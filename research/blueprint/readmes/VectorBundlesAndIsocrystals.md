# Isocrystals, vector bundles and Banach–Colmez spaces

The Fargues–Fontaine curve turns Frobenius modules into vector bundles and p-adic period spaces into geometry. This roadmap plans the finite isocrystal category, its exact tensor bundle functor, the slope theory and geometric classification of bundles, and the section and hypercohomology sheaves called Banach–Colmez spaces. The relative theory then relates slope-zero bundles to local systems and controls purity and ampleness in families. These are the linear inputs for Bun_G and Newton strata, modifications and period maps, and the geometric local Langlands programme.

The plan covers VB0–VB4, including the two VB2 substages and three VB3 substages. It assembles the corrected contracts of the [VB0 packet](../packets/VectorBundlesAndIsocrystals--VB0.json) and [VB3 packet](../packets/VectorBundlesAndIsocrystals--VB3.json). The reader below includes every planned declaration, proof outline, API item, unit test and planet from those packets. The [suggested Lean file](../suggested/VectorBundlesAndIsocrystals.lean) gives available component signatures and an index of geometric omissions. All implementation statuses remain `unchecked`; target coverage is `planned`, with the proof and supplier boundaries listed at the end. The existing independent part reviews remain `needs_changes`. Assembly synchronizes this full reader with their corrected contracts; it does not change those verdicts or complete the missing mathematics.

## Scope and ownership

This roadmap owns finite general-coefficient isocrystals; the full isocrystal-to-bundle functor; finite locally free bundles and Frobenius descent; curve-specific degree, saturation, HN theory, ampleness, GAGA and classification; BC section/hypercohomology objects, their scalar projectivizations, geometric properties and classical category; and relative slope and local-system comparisons. Generic algebra, scheme, analytic and categorical machinery is imported from its owner.

| Supplier or consumer | Boundary |
| --- | --- |
| Local fields and ramification; Class field theory (existing Tau Ceti roadmaps) | Import unramified extensions and arithmetic Frobenius, and the arithmetic local Brauer/reciprocity comparison only in its stated regimes. RF0 supplies completion and its continuous Frobenius extension. Construct the slope-labelled cyclic algebra here, then compare its algebraic Brauer class to the arithmetic invariant. |
| Relative Fargues–Fontaine RF0–RF3 | Import coefficient and annular period rings, the analytic quotient curve, untilts, divisor lines, local DVR comparisons, and rank-one twists with partial homogeneous charts. The full bundle functor and global chart coverage are owned here. RF3 may not assume this roadmap's global Proj map or GAGA to construct its early charts. |
| Scheme and stack foundations; Adic spaces Part II | Import finite locally free/projective and coherent-sheaf foundations, generic Proj, descent, Kiehl and trace tools, torsion-pair tilts and finite-length local module theory. Keep the curve-specific HN, cohomological and algebraization theorems here. |
| Perfectoid spaces; Diamonds and v-stacks | Import tilting, the perfectoid site, sheaf/diamond descent, torsors, quotients and spatiality criteria. This roadmap supplies the BC objects and their geometric applications, not another definition of diamonds. |
| Diamond étale cohomology; Diamond six operations; Perfectoid quotients | Import properness, tautness, cohomological smoothness and strong closed quotient criteria. Verify their exact hypotheses on the BC spaces here. |
| Finite flat groups and integral p-adic Hodge theory R07 | Import Lubin–Tate groups, universal covers, logarithms and the crystalline Hom comparison with the specified covariant normalization. Full faithfulness alone does not supply that comparison. |
| K-theory in low degrees Z.1 | Import stable finite-projective presentations. Z.2 rank calculations are not the prerequisite for that construction. |
| Adic étale geometry; p-adic differential equations and rigid cohomology RD2 | Request the perfected analytic affine-line comparison and the analytic-field slope-specialization theorem with the exact coefficient/sign conventions. Neither result is silently inferred from a generic diamond theorem. |
| Reductive groups (existing Tau Ceti roadmap), Part II | Request integral Tannakian reconstruction for smooth affine Z_p-models with connected fibres; the existing field-valued theorem is imported only at its actual scope. |
| Bun_G and Newton strata; filtered isocrystals and period maps; p-adic Hodge theory R06 | Export bundle classification, slope variation, BC geometry and the stated semistable-period Dimension calculation. Keep G-isocrystals, filtration/admissibility and representation-theoretic multiplicity with their owners. |
| The routed Colmez–Nizioł Part II | Import the bounded-image/graph step when needed. The later h(W)=Hom_VS(W,B_dR) theory is already routed to its successor; do not rebuild it here. |

The two existing link maps [Local fields and ramification](../links/tauceti_TauCetiRoadmap_LocalFieldsRamification.json) and [Class field theory](../links/tauceti_TauCetiRoadmap_ClassFieldTheory.json) supply the unramified-Frobenius and cohomological-arithmetic-invariant interfaces to VB0. There is no dedicated VectorBundlesAndIsocrystals link map. Further cross-roadmap imports and extensions are explicit node prerequisites and supplier requests, collected with the restructuring proposals in the [assembly handoff](../handoff/ASM-VectorBundlesAndIsocrystals.md). Tau Ceti roadmaps and their links are not replanned here.

## Conventions

- **Coefficients.** E is a nonarchimedean local field with residue field F_q and chosen uniformizer π. Put k=bar F_q and L=breve E; in mixed characteristic L=W_{O_E}(k)[1/π], in equal characteristic L=k((π)). The arithmetic q-Frobenius σ fixes E and π. An isocrystal includes a bijective σ-semilinear Φ and is finite-dimensional over L. For the general functor over S, require S/k and the chosen coefficient embedding. The standard cyclic bundles O(d/h) have their separate F_q-definition; this does not supply a general coefficient embedding over an arbitrary S/F_q.
- **Signs and rational blocks.** D(s,r) has cyclic Frobenius with wrap π^s and isocrystal slope s/r. Its bundle has slope −s/r. For λ=d/h in lowest terms, h>0, O(λ) has rank h and degree d, not rank one unless h=1. The bundle-slope cyclic algebra has Π^h=π^d and Πx=σ(x)Π, with Brauer invariant +λ. Endomorphisms of an isocrystal of slope a have invariant −a. Tensor multiplicities are determined by the resulting denominator, rather than treating rational standard bundles as line bundles.
- **Geometric fields and untilts.** Geometric classification uses a complete algebraically closed perfectoid C of characteristic p; a closed point corresponds to an untilt C♯ over E. In the classical CN25 discussion the source's symbol C means a characteristic-zero untilt: E=Q_p and C is the completion of an algebraic closure of a complete discretely valued K of characteristic zero with countable perfect residue field. Then O_C/p is countable, as needed for sympathetic closures and separability. This hypothesis is retained on each CN contract. SW Definition 15.2.1 and Theorem 15.2.12 have their separately stated arbitrary algebraically closed C/Q_p scope.
- **Bundles and HN.** A bundle is a finite locally free structure-sheaf module; local freeness and finite generation use the same generator witness. Rank is locally constant. Nonzero slope is degree/rank. The zero bundle has no slope and an empty polygon, and is nevertheless an object of each fixed-slope category. A geometric HN filtration has decreasing slopes, and its concave polygon has horizontal coordinate rank and endpoint (rank, degree). KL's convex lower polygon lists slopes in increasing order. Once both use the same normalized degree multiset, P_KL(x)=deg−P_FS(n−x). KL's φ^a convention, q=p^a, gives a (c,d)-pure module slope c/d and the basic positive twist slope 1/a; retain all hypotheses of its mixed-characteristic comparisons.
- **Cohomology and BC.** BC(E)=H⁰(X_T,E_T) is an E-module v-sheaf, BCneg(E)=H¹(X_T,E_T) for universally negative bundles, and BCcomplex([E₁→E₀])=H⁰ RΓ(X_T,[E₁→E₀]) in cohomological degrees −1,0. Require H⁰(E₁,T)=0 for every T/S; this is FS's homological [0,1] convention. Representability is a theorem, not part of this definition. Constant coefficients mean the sheaf underline E: on a disconnected base its sections need not be a single E.
- **Quotients and positivity.** PBC(W)=(W minus its zero section)/underline E×. Keep punctured spatiality, relative spatial representability and absolute spatiality distinct. Strictly positive/negative means every geometric HN slope has that sign. In a positive presentation the specified small-slope bundle must be fibrewise semistable, not merely of that average degree. An E-local system is pro-étale locally constant; it need not be globally trivial or admit a global integral lattice.
- **Classical Dimension.** For a BC space write Dim=(dim,ht), where the first coordinate is the C-dimension and the second the Q_p-height. For the tilted heart rk⁻=dim and deg⁻=−ht, so for nonzero curve slope λ the BC slope is −1/λ. Q_p has BC slope −∞. Curvature is the distinct Hom/support notion relative to the chosen ∞, not synonymous with this slope. Torsion at another closed point may have height zero and strictly positive curvature.
- **Names.** Node IDs and planning API/test names are stable. The first packet proposes the future `TauCeti.FFCurve` library modules; its available algebraic Lean prototypes live in `TauCeti.FFBundles`. BC prototypes live in `TauCeti.BanachColmez`. These component namespaces do not assert that the future curve/site carriers exist.

## Layer overview and proof order

The display follows the two parts, first VB0–VB2 and then VB3–VB4. The prerequisite order crosses those boundaries. Read the direct node links as the proof order; a parent stage aggregates several declarations and is not a single prerequisite.

| Layer | Contents | Main exports |
| --- | --- | --- |
| [VB0](#vectorbundlesandisocrystals-vb0) | Finite isocrystals, rational blocks, Dieudonné–Manin, cyclic endomorphisms and descent | FiniteIsocrystal, SlopeBlock, slope-labelled division algebras |
| [VB1](#vectorbundlesandisocrystals-vb1) | Bundles, annular/Robba descent, derived cohomology; geometric charts, Picard, degree, saturation and HN | CurveBundle, bundleOfIsocrystal, bundleDegree, HNFiltration |
| [VB2: ampleness](#vectorbundlesandisocrystals-vb2-ampleness) | Corrected positive-twist generation, global Proj map, GAGA and ampleness criteria | positiveTwistGeneration, curveGaga, tensor global ampleness |
| [VB2: classification](#vectorbundlesandisocrystals-vb2-classification) | Stable standard bundles, fixed-slope categories, classification, Hom/Ext and coherent sheaves | O(λ), geometric classification, stable division endomorphisms |
| [VB3: positive/basic](#vectorbundlesandisocrystals-vb3-positive-basic-examples) | Section/hypercohomology definition, Lubin–Tate and fundamental exact sequence | BC, BCneg, BCcomplex and PBC(O(1))=Div¹ |
| [VB3: projectivized properness](#vectorbundlesandisocrystals-vb3-projectivized-properness) | Scalar quotient, contracting action and ordinary projectivized properness | BCProjectivization and proper PBC(E) |
| [VB3: general BC](#vectorbundlesandisocrystals-vb3-general-bc) | Positive resolutions, two-term geometry, absolute examples, classical category and Le Bras | Families of BC spaces, Dimension, curvature and BC HN |
| [VB4](#vectorbundlesandisocrystals-vb4) | Relative HN, Robba purity, ampleness, rational/integral local systems | Slope-zero equivalence, pure models and relative ampleness |

The acyclic construction order starts with RF3's rank-one twists and partial charts, then VB1's early bundle/annular/Frobenius-complex/v-descent nodes. Those permit the basic VB3 Lubin–Tate and fundamental calculation without ampleness or classification. It feeds VB1's twist cohomology, followed by independently established geometric chart coverage, regularity, Picard, degree and HN. Corrected positive-twist generation gives the global Proj map and GAGA; classification follows the stability and key-extension work. Ordinary projectivized BC properness uses ampleness and positive-twist cohomology, without classification. It feeds VB4's relative HN and local-system results, which in turn feed positive resolutions and general two-term BC geometry. The classical BC equivalence additionally consumes geometric classification and the coherent/derived foundations.

The restricted direct graph on all 127 nodes is acyclic and every cross-part local prerequisite resolves to its exact declaration ID. This does not repair the older aggregate RF3/VB1/VB3 graph. Accepted RS-15 and RS-20 require an atomic narrowing and replacement of those stage edges. That integration and the proof boundaries G-DM, G-GEOM, G-HN, G-GG, G-KEY and their VB3 analogues remain explicit below.

## Existing library baseline

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, the following 29 declaration contracts are imported. Their complete statements were read at those pins for assembly as well as in the recorded part reviews. The [library audit](../../../data/library-coverage.json) has no dedicated VB0–VB4 layer entries; its Bun_G references are downstream uses, not proof that this curve theory exists. In particular, Mathlib's isocrystal classification is only rank one, line-bundle classes do not compute the curve's Picard group, and generic abelian/derived/sheaf machinery does not construct BC geometry.

### Baseline used by VB0

- `mathlib:WittVector.FractionRing.frobenius` — Ring automorphism of Frac(W(k)) for perfect characteristic-p domain k; q-Frobenius is its appropriate iterate. Source module: `Mathlib/RingTheory/WittVector/Isocrystal.lean`.
- `mathlib:WittVector.Isocrystal` — Module over Frac(W(k)) with a bijective p-Frobenius-semilinear equivalence; no finite-dimensionality field. Source module: `Mathlib/RingTheory/WittVector/Isocrystal.lean`.
- `mathlib:WittVector.IsocrystalHom` — Linear maps commuting with Frobenius. Source module: `Mathlib/RingTheory/WittVector/Isocrystal.lean`.
- `mathlib:WittVector.IsocrystalEquiv` — Intertwining linear equivalences. Source module: `Mathlib/RingTheory/WittVector/Isocrystal.lean`.
- `mathlib:WittVector.StandardOneDimIsocrystal` — Rank-one block with Frobenius p^m times coefficient Frobenius. Source module: `Mathlib/RingTheory/WittVector/Isocrystal.lean`.
- `mathlib:WittVector.isocrystal_classification` — Only the finrank=1 classification over algebraically closed k. Does not supply higher-rank Dieudonné–Manin. Source module: `Mathlib/RingTheory/WittVector/Isocrystal.lean`.
- `mathlib:AlgebraicGeometry.Scheme.Modules` — Sheaves of modules over a scheme structure sheaf; underlying carrier of schematic bundles. Source module: `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean`.
- `mathlib:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData` — A local generator family whose free-to-module maps are isomorphisms; does not impose finite ranks. Source module: `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean`.
- `mathlib:SheafOfModules.LocalGeneratorsData.IsFiniteType` — Each local generator family is finite. Combine with locally free data on the SAME family for bundles. Source module: `Mathlib/Algebra/Category/ModuleCat/Sheaf/Generators.lean`.
- `tauceti:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation` — Finite locally free local generator data implies finite presentation. Source module: `TauCeti/Algebra/Category/ModuleCat/Sheaf/FinitePresentation.lean`.
- `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` — Full subcategory of invertible structure-sheaf modules on a scheme. Source module: `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`.
- `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass` — Isomorphism classes of invertible sheaves; tensor-product commutative monoid at this pin, with equality iff underlying sheaves are isomorphic. Source module: `TauCeti/AlgebraicGeometry/LineBundle/Class.lean`.
- `mathlib:CommRing.Pic` — Picard group of a commutative ring, defined from invertible modules; does not compute Pic of the curve. Source module: `Mathlib/RingTheory/PicardGroup.lean`.
- `tauceti:TauCeti.CSA.of` — Bundles an already central simple finite-dimensional algebra; does not construct cyclic algebras or arithmetic invariants. Source module: `TauCeti/Algebra/BrauerGroup/Basic.lean`.
- `tauceti:TauCeti.BrauerGroup.mk_end` — The Brauer class of End_K(V) is split for nonzero finite-dimensional V. Source module: `TauCeti/Algebra/BrauerGroup/Group.lean`.
- `tauceti:TauCeti.BrauerGroup.baseChange_mk` — Algebraic Brauer class commutes with scalar extension. Source module: `TauCeti/Algebra/BrauerGroup/BaseChange.lean`.

### Baseline used by VB3

- `mathlib:SpectralSpace` — Spectral topology for the contracting quotient. Source module: `Mathlib/Topology/Spectral/Basic.lean`.
- `mathlib:Specializes` — Neighbourhood-filter specialization, used for the chain of generalizations. Source module: `Mathlib/Topology/Defs/Filter.lean`.
- `mathlib:CategoryTheory.Sheaf` — Full subcategory of presheaves satisfying a supplied Grothendieck topology. Source module: `Mathlib/CategoryTheory/Sites/Sheaf.lean`.
- `mathlib:DerivedCategory` — Localization of integer cochain complexes at quasi-isomorphisms. Source module: `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`.
- `mathlib:CategoryTheory.Abelian` — Generic abelian category; BC abelianness is a theorem, not replanned machinery. Source module: `Mathlib/CategoryTheory/Abelian/Basic.lean`.
- `mathlib:CategoryTheory.ShortComplex.ShortExact` — Exact short complex with mono first map and epi second map. Source module: `Mathlib/Algebra/Homology/ShortComplex/ShortExact.lean`.
- `mathlib:Submodule` — Actual integral lattice inclusions and intersections. Source module: `Mathlib/Algebra/Module/Submodule/Defs.lean`.
- `mathlib:ModuleCat` — Modules with linear maps for VS values and evaluated presentations. Source module: `Mathlib/Algebra/Category/ModuleCat/Basic.lean`.
- `mathlib:NormedAlgebra` — Normed scalar algebra carrier; sympathetic spectrality and separability add hypotheses. Source module: `Mathlib/Analysis/Normed/Module/Basic.lean`.
- `mathlib:Module.finrank` — Finite Q_p rank entering height difference. Source module: `Mathlib/LinearAlgebra/Dimension/Finrank.lean`.
- `mathlib:CategoryTheory.Equivalence` — Functor, inverse, unit and counit for Le Bras and local-system comparisons. Source module: `Mathlib/CategoryTheory/Equivalence.lean`.
- `mathlib:CategoryTheory.ShortComplex.homology` — Honest homology object after derived RΓ, not coker of raw sections. Source module: `Mathlib/Algebra/Homology/ShortComplex/Homology.lean`.
- `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition` — SpectralSpace (spa Aplus) for a Huber ring with a PairOfDefinition; a concrete pinned spectral specialization. Source module: `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.lean`.

## Sources and editions

Locators below refer to these exact public editions, recorded by the independent part reviews on 6 October 2026. The two CN25 copies have the same reviewed text but different PDF bytes and are identified separately. Source readings and hashes are inherited provenance; assembly does not claim a new independent paper review. Corrected readings, including the 33 independently confirmed source findings, are recorded after the layer contracts.

<a id="source-fs-geometrization"></a>

### FS-geometrization

Laurent Fargues; Peter Scholze. [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; printed page equals PDF page; bytes reproduce the inherited hash.

SHA-256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`. Used by VB0, VB3.

Reviewed sections:

- II.1.11–14 and II.1.22, pp. 53–57: classical points, annular rings and quotient curve
- II.2, pp. 57–72: complete descent, basic cohomology, ampleness, GAGA and geometric classification proofs
- II.3.4, p. 79: relative slope-vanishing uses assigned to the VB3/VB4 part
- I.3.5; II.2.1–II.2.4; II.2.16–II.3.13

<a id="source-ff18-courbes"></a>

### FF18-courbes

Laurent Fargues; Jean-Marc Fontaine; preface Pierre Colmez. [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf). Current author-hosted 404-page version of Astérisque 406 (2018). Main-text pagination restarts after the preface; use printed main-text pages, not the inherited continuously paginated edition.

SHA-256: `8c020573d3dce341088ea7e83fe1063b410686c08e3a144fa3c0de634667cc79`. Used by VB0, VB3.

Reviewed sections:

- 5.5.1–5.5.6, pp. 162–164: exact-category HN axioms, filtration, polygons, fixed slope
- 5.6.22–5.6.23, pp. 181–182: pullback, tensor, dual and Hom/Ext of slope bundles
- 8.2.3–8.2.4, pp. 236–238: isocrystals, cyclic endomorphism algebra, coefficient adjunction, classification
- 8.5.1 and 8.6.1, pp. 248–249: geometric simple connectivity and finite étale algebras
- §8.4.1; preface Theorem 2.12

<a id="source-kl15"></a>

### KL15

Kiran S. Kedlaya; Ruochuan Liu. [Relative p-adic Hodge theory: Foundations](https://arxiv.org/pdf/1301.0792v5). arXiv:1301.0792v5; 210 PDF pages; printed pages cited.

SHA-256: `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942`. Used by VB0, VB3.

Reviewed sections:

- 6.2.1–6.2.6, pp. 135–137: complete contraction and two-half-annulus generation proof
- 6.3.5–6.3.19, pp. 138–143: Prüfer charts, categories, invariant norms and cohomology
- 7.3.4–7.3.5, pp. 148–149: local and global pure/étale models
- 8.7.6–8.7.7, p. 178: two affine charts and cohomological dimension
- 8.8.1–8.8.9, pp. 180–182: global ampleness, power and cohomology criteria, affineness
- 7.1–7.4; 8.5–8.8

The packets also record this same hash at [alternate recorded URL](https://arxiv.org/pdf/1301.0792).

<a id="source-cs17"></a>

### CS17

Ana Caraiani; Peter Scholze. [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Publisher PDF, Annals of Mathematics 186 (2017), pp. 649–766; citations use printed pages.

SHA-256: `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`. Used by VB0.

Reviewed sections:

- 3.2.10–3.2.13, printed p. 681: relative tilted Robba ring and Frobenius modules
- 3.3.4, printed p. 683: exact tensor equivalence with curve bundles

<a id="source-cn25-vb0"></a>

### CN25-VB0

Pierre Colmez; Wiesława Nizioł. [On the cohomology of p-adic analytic spaces, II: the C_st-conjecture](https://arxiv.org/pdf/2108.12785). arXiv:2108.12785v4, 25 November 2024; paper-route identifier CN25 retained; citations use printed pages and §3.2 numbering.

SHA-256: `83c6afdc8a377e38dced9dd8b400cb3461a2d47de2664a094e81a04332051361`. Used by VB0.

Reviewed sections:

- 3.2.1–3.2.4, pp. 14–15: Q_p curve, closed points, completed local rings, slopes and cohomology; abstract Banach–Colmez theory remains VB3-owned

<a id="source-sw20"></a>

### SW20

Peter Scholze; Jared Weinstein. [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). Author-hosted 260-page PDF; PDF page = printed page + 10 (Theorem 13.5.7 printed p. 114 is PDF p. 124).

SHA-256: `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`. Used by VB0, VB3.

Reviewed sections:

- 13.5.7 and proof, pp. 114–115: finite étale algebras and classification argument for simple connectivity
- Lecture 12.3; 15.2; 22.3; 22.6

<a id="source-ked05"></a>

### Ked05

Kiran S. Kedlaya. [Slope filtrations revisited](https://ems.press/content/serial-article-files/25974). Documenta Mathematica 10 (2005), 447–525; filename in scratch has no bibliographic significance.

SHA-256: `9a9e305e74a57c459311bb5d90ec0d38bd7b6551da6152f2f94e586d6ce4bd68`. Used by VB0.

Reviewed sections:

- 2.0.1 and 2.1.1–2.1.4, pp. 451–452: ramified Witt coefficients and Frobenius
- 3.1.1–3.1.6, pp. 477–478: standard modules and pushforward
- 4.1.1–4.1.2, printed p. 487; 4.5.1–4.5.12, pp. 497–499: Dieudonné–Manin and descent; Lemma 4.3.3 remains a specifically identified proof input

<a id="source-lurie26"></a>

### Lurie26

Jacob Lurie. [Lecture 26: Isocrystals](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf). Three-page lecture note; statement source, not a full proof of Dieudonné–Manin.

SHA-256: `73fcb0f228e194ba1e4db21957702d861d6abaeae4c11bc3a66511a0b91251ea`. Used by VB0.

Reviewed sections:

- Definition 1, standard blocks and Theorem 6; Warning 17 on lack of full faithfulness

<a id="source-glx26"></a>

### GLX26

Ian Gleason; Dong Gyu Lim; Yujie Xu. [The connected components of affine Deligne–Lusztig varieties](https://arxiv.org/pdf/2208.07195). arXiv:2208.07195v3, 10 November 2025, 57 pages; atlas paper-route identifier GLX26 retained.

SHA-256: `d2249ddbe1ae2f4728000d27846d396adffc97b2f8b7b1c82c5d2701153fcb12`. Used by VB0.

Reviewed sections:

- 5.1, pp. 31–32: tensor isocrystal input to filtered/G-isocrystal consumers; filtered objects are outside this part

<a id="source-cn25-vb3"></a>

### CN25-VB3

Colmez and Nizioł. [On the cohomology of p-adic analytic spaces, II: the C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf). Author-hosted PDF read on 2026-10-06; KL arXiv v5 and SW13 arXiv v2. FF has separately paginated preface.

SHA-256: `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a`. Used by VB3.

Reviewed sections:

- §§3.1–3.3; §3.3 ownership boundary only

<a id="source-cdn20"></a>

### CDN20

Colmez, Dospinescu and Nizioł. [Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf). Author-hosted PDF read on 2026-10-06; KL arXiv v5 and SW13 arXiv v2. FF has separately paginated preface.

SHA-256: `2cdb1de25b5201ed46f8af6c06c19b72fdc5cbe1dd2037b4e1d24dee30155776`. Used by VB3.

Reviewed sections:

- §2.1.2; Lemma 2.7

<a id="source-sw13-moduli"></a>

### SW13-moduli

Scholze and Weinstein. [Moduli of p-divisible groups](https://arxiv.org/pdf/1211.6357v2). Author-hosted PDF read on 2026-10-06; KL arXiv v5 and SW13 arXiv v2. FF has separately paginated preface.

SHA-256: `984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d`. Used by VB3.

Reviewed sections:

- Theorem A; Proposition 3.1.3; Lemma 3.5.1

<a id="vectorbundlesandisocrystals-vb0"></a>

## VB0 — Finite isocrystals and their slope algebras

Start with the specified arithmetic Frobenius and finite coefficient category. General rational blocks extend the existing rank-one Witt-vector theory; the cyclic algebra and arithmetic invariant comparison remain separate constructions.

Planets: [Finite isocrystals](#vectorbundlesandisocrystals-vb0-isocrystal-category-and-standard-block); [Rational Frobenius blocks](#vectorbundlesandisocrystals-vb0-rational-standard-block); [Dieudonné–Manin theorem](#vectorbundlesandisocrystals-vb0-dieudonne-manin-isocrystals); [Isocrystal endomorphism algebra](#vectorbundlesandisocrystals-vb0-endomorphism-division-algebra).

<a id="vectorbundlesandisocrystals-vb0-isocrystal-category-and-standard-block"></a>

### Finite isocrystals over the completed maximal unramified coefficient field

`VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block` · definition · implementation `unchecked`.

Fix a nonarchimedean local field E, residue field F_q, uniformizer π and L=breve E. In mixed characteristic L=W_{O_E}(bar F_q)[1/π]; in equal characteristic L=bar F_q((π)). Let σ be the lift of q-power arithmetic Frobenius fixing E and π. An E-isocrystal is a finite-dimensional L-vector space D with a bijective σ-semilinear Φ. Morphisms are L-linear maps f with fΦ_D=Φ_D′f. This category retains E, σ and the coefficient embedding; the coefficient field alone does not determine it.

Prerequisites: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`; `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`; `mathlib:WittVector.FractionRing.frobenius`; `mathlib:WittVector.Isocrystal`; `mathlib:WittVector.IsocrystalHom`; `mathlib:WittVector.IsocrystalEquiv`.

Proof / construction outline:

1. Restrict the existing semilinear-module API to finite-dimensional objects and supply general-E σ from the coefficient supplier.
2. Use intertwining linear maps for identities and composition; kernels and cokernels inherit bijective Φ, making the finite category E-linear abelian.
3. For E=Q_p, identify this category with the finite-dimensional full subcategory of Mathlib isocrystals, not with every WittVector.Isocrystal.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB0`.

Planning API:

- `FiniteIsocrystal` (data): A finite L-module with a σ-semilinear equivalence.
- `FiniteIsocrystal.Hom` (data): The E-vector subspace of L-linear maps intertwining the two Frobenius equivalences; scalars are restricted through the specified σ-fixed E embedding, not arbitrary L-scalars.
- `FiniteIsocrystal.Hom.ext` (extensionality): Intertwining morphisms agree iff their underlying functions agree.
- `FiniteIsocrystal.category` (instance): Identity and composition are inherited from linear maps; the category is E-linear abelian.
- `FiniteIsocrystal.toWitt` (compatibility): For E=Q_p and σ=p-Frobenius, forget finiteness to the existing WittVector.Isocrystal class; arrows and isomorphisms agree.
- `FiniteIsocrystal.coeffFrobenius` (projection): Return the specified σ together with the E-coefficient embedding; do not infer it from L.

Unit tests:

- `finiteIsocrystal_zero` (degenerate): The zero module has rank 0 and an invertible semilinear zero-to-zero map.
- `finiteIsocrystal_witt` (compatibility): For Q_p the finite subcategory embeds fully faithfully into WittVector.IsocrystalHom and IsocrystalEquiv.
- `finiteIsocrystal_requires_bijective` (non-example): The zero Frobenius map on nonzero L is not an isocrystal.
- `finiteIsocrystal_unramified_frobenius` (computation): For the unramified degree-two E′, the coefficient automorphism is σ², not σ.

Acceptance checks:

- Zero is an object, with rank zero; an infinite-dimensional Mathlib isocrystal is excluded.
- Changing E unramified of degree f changes the specified Frobenius to σ^f even when the completed coefficient fields are identified.

Downstream uses:

- FF18 8.2.3 and VectorBundlesAndIsocrystals:VB2:classification: Source category for the bundle functor and rational classification.
- GLX26 §5.1: Tensor isocrystal input to the filtered/G-isocrystal consumer; no filtered objects are rebuilt here.

Sources:

- [FF18-courbes](#source-ff18-courbes), 8.2.3, Definition 8.2.5, printed p. 236. Finite coefficient category, including its dependence on E; L is used as a field, with π inverted.

<a id="vectorbundlesandisocrystals-vb0-rational-standard-block"></a>

### Rational standard Frobenius blocks

`VectorBundlesAndIsocrystals:VB0/rational-standard-block` · construction · implementation `unchecked`.

For s∈Z and r>0, define D(s,r)=L^r with Φ(e_i)=e_{i+1} for i<r−1 and Φ(e_{r−1})=π^s e_0, applying σ to coefficients. Then Φ^r=π^sσ^r and its isocrystal slope is s/r. The coprime pair gives the simple block. FF M(d,h) is D(−d,h); its bundle is O(d/h), rank h and degree d.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`](#vectorbundlesandisocrystals-vb0-isocrystal-category-and-standard-block); `mathlib:WittVector.StandardOneDimIsocrystal`.

Proof / construction outline:

1. Construct the cyclic coefficient-semilinear matrix and its inverse, using π≠0.
2. Iterate on the basis to obtain the r-th-power formula; compare r=1 with the pinned p^m block.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB0`.

Planning API:

- `SlopeBlock` (constructor): D(s,r), with r>0 and π≠0.
- `SlopeBlock.frobenius_basis` (simp): Evaluate Φ on the cyclic basis, including the π^s wraparound.
- `SlopeBlock.iterate` (relation): Φ^r=π^sσ^r, with σ^r acting coefficientwise.
- `SlopeBlock.rank` (projection): The L-rank is r.
- `SlopeBlock.slope` (projection): The rational isocrystal slope is s/r.
- `SlopeBlock.rankOneWitt` (compatibility): At E=Q_p, r=1, D(s,1) identifies with StandardOneDimIsocrystal s.

Unit tests:

- `slopeBlock_half` (computation): D(1,2) has rank 2 and isocrystal slope 1/2.
- `slopeBlock_wraparound` (characterisation): On D(−1,2), Φ²(e_0)=π^{-1}e_0, ruling out a coefficient-linear or unsigned shift.
- `slopeBlock_rankOne` (compatibility): D(−2,1) is the pinned rank-one block with exponent −2.
- `slopeBlock_not_simple` (non-example): D(2,2) has slope 1 and is not simple: it is two copies of D(1,1).

Acceptance checks:

- D(1,2) has slope 1/2 and its bundle O(−1/2) has degree −1.
- The standard block is simple only if gcd(s,r)=1.

Downstream uses:

- Dieudonné–Manin theorem: Canonical simple objects.
- FS II.2.11–14: Define O(λ) with slope reversal and test its rank and degree.

Sources:

- [FF18-courbes](#source-ff18-courbes), 8.2.3 before Proposition 8.2.6, p. 237. Cyclic basis and π^{-d} convention.
- [Ked05](#source-ked05), Definition 4.1.1, printed p. 487. General ramified mixed-characteristic cyclic blocks.

<a id="vectorbundlesandisocrystals-vb0-dieudonne-manin-isocrystals"></a>

### Dieudonné–Manin classification of finite isocrystals

`VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals` · theorem · implementation `unchecked`.

Over L with algebraically closed residue field bar F_q, every finite E-isocrystal is a finite direct sum of coprime D(s,r); the multiset of rational slopes with block multiplicities is unique. The coprime blocks are simple, Hom between distinct slopes is zero, and every isocrystal short exact sequence splits. This asserts no analogous classification over an arbitrary perfect residue field without descent data.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/rational-standard-block`](#vectorbundlesandisocrystals-vb0-rational-standard-block); `mathlib:WittVector.isocrystal_classification`.

Proof / construction outline:

1. Use the standard-module eigenvector calculation and slope filtration in Ked05; record the unproved imported Lemma 4.3.3 separately as G-DM rather than treating the citation as closure.
2. For trivial residue valuation descend an eigenbasis from the Hahn extension via the dual basis argument and coefficient reduction (4.5.5–4.5.8).
3. Simplicity, distinct-slope Hom vanishing and splitting identify the unique multiplicities; restrict rank one to the pinned theorem. The equal-characteristic proof is G-DM.

Suggested declaration: `dieudonneManinIsocrystals`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB0`.

Acceptance checks:

- D(2,2)≅D(1,1)⊕D(1,1); rank-one case agrees with the library.
- The sum of multiplicity times reduced denominator equals the rank; slope multiplicity is not itself the rank.

Downstream uses:



Sources:

- [Ked05](#source-ked05), 4.5.3–4.5.8, pp. 497–499. Mixed-characteristic classification, including descent of standard bases.
- [Lurie26](#source-lurie26), Theorem 6. Accessible precise algebraically closed residue-field statement; not a proof source.

<a id="vectorbundlesandisocrystals-vb0-tensor-and-dual-slopes"></a>

### Tensor and dual calculus for isocrystals

`VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes` · theorem · implementation `unchecked`.

Finite isocrystals form a rigid exact E-linear tensor category. Tensor Frobenius is Φ_D⊗Φ_D′ and dual Frobenius is ℓ↦σ∘ℓ∘Φ_D^{-1}. Tensor slopes are pairwise sums, dual slopes are negatives. If a,b have reduced denominators h_a,h_b,h_{a+b}, then D_a⊗D_b≅D_{a+b}^{⊕h_a h_b/h_{a+b}}.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`](#vectorbundlesandisocrystals-vb0-isocrystal-category-and-standard-block); [`VectorBundlesAndIsocrystals:VB0/rational-standard-block`](#vectorbundlesandisocrystals-vb0-rational-standard-block); [`VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`](#vectorbundlesandisocrystals-vb0-dieudonne-manin-isocrystals).

Proof / construction outline:

1. Use the semilinear tensor and inverse-dual formulas; verify evaluation and coevaluation intertwine Φ.
2. Apply classification after a common denominator to calculate the unique slope and rank.

Suggested declaration: `isocrystalTensorSlopes`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB0`.

Acceptance checks:

- D_{1/2}⊗D_{1/2}≅D_1^{⊕4}, and D_{1/2}∨≅D_{−1/2}.
- Tensoring with the unit D(0,1) preserves an object.

Downstream uses:



Sources:

- [Ked05](#source-ked05), Definition 3.1.5 and Lemma 4.1.2, pp. 478, 487. Dual/internal Hom construction; block tensor slope calculation follows from the classification and explicit iterates. The displayed multiplicity dd′/d″ is included in this mathematical transcription; it is lost by plain PDF text extraction.
- [FF18-courbes](#source-ff18-courbes), Proposition 8.2.6, p. 237. Compatibility required by the bundle consumer.

<a id="vectorbundlesandisocrystals-vb0-endomorphism-division-algebra"></a>

### Division endomorphisms of a simple isocrystal

`VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra` · theorem · implementation `unchecked`.

For coprime (s,r), End_Φ(D(s,r)) is a central division algebra over E of dimension r². With E_r/E unramified degree r and arithmetic σ, it has presentation ⊕_{i=0}^{r−1}E_r Π^i, Π^r=π^{−s}, Πx=σ(x)Π. Its arithmetic Brauer invariant is computed later by the separate brauer-invariant-sign node. The bundle endomorphism comparison is a separate classification-layer node.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/rational-standard-block`](#vectorbundlesandisocrystals-vb0-rational-standard-block); [`VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`](#vectorbundlesandisocrystals-vb0-dieudonne-manin-isocrystals); `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

Proof / construction outline:

1. Simplicity makes nonzero intertwining maps invertible.
2. The diagonal action of E_r and inverse cyclic shift give Πx=σ(x)Π and Π^r=π^{−s}; compare dimensions by solving the intertwining equations.
3. The centralizer of E_r and Π is E. This proves the center and the cyclic presentation without invoking the later Brauer invariant comparison, which consumes this theorem.

Suggested declaration: `isocrystalEndDivision`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB0`.

Acceptance checks:

- For s=−1,r=2 the algebra has dimension 4 and the quaternion cyclic presentation Π²=π.
- For r=1 the algebra is E regardless of s.

Downstream uses:



Sources:

- [FF18-courbes](#source-ff18-courbes), Definition 8.2.7 and Proposition 8.2.8, pp. 237–238. Cyclic algebra for bundle slope d/h, hence isocrystal slope −d/h.

<a id="vectorbundlesandisocrystals-vb0-slope-division-algebra"></a>

### Slope-labelled cyclic algebra

`VectorBundlesAndIsocrystals:VB0/slope-division-algebra` · construction · implementation `unchecked`.

For bundle slope λ=d/h in lowest terms, h>0, set D_λ=Cyc(E_h/E, arithmetic σ, π^d), a central division algebra with Π^h=π^d and Πx=σ(x)Π. Use the general cyclic algebra construction supplied by Class field theory; this node supplies the slope-indexed specialization and its identification with End_Φ(D(−d,h)), rather than redoing cyclic algebra theory.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`](#vectorbundlesandisocrystals-vb0-endomorphism-division-algebra); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`; `tauceti:TauCeti.CSA.of`.

Proof / construction outline:

1. Specialize the requested general cyclic algebra to E_h, σ and π^d; use its basis for dimension h².
2. Use the endomorphism presentation to prove the specialization is a division algebra and bundle it with CSA.of.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB0`.

Planning API:

- `SlopeDivisionAlgebra` (constructor): The cyclic algebra D_λ for the reduced pair of λ.
- `SlopeDivisionAlgebra.generator` (data): The element Π with Π^h=π^d.
- `SlopeDivisionAlgebra.commutation` (relation): Πx=σ(x)Π for x∈E_h; specify arithmetic Frobenius.
- `SlopeDivisionAlgebra.basis` (structure): E-basis obtained from an E-basis of E_h times Π^i, 0≤i<h.
- `SlopeDivisionAlgebra.isocrystalEnd` (equivalence): E-algebra equivalence with End_Φ(D(−d,h)).

Unit tests:

- `slopeDivision_integer` (degenerate): D_3≅E because the reduced denominator is one.
- `slopeDivision_half` (computation): D_{1/2} has dimension 4 and Π²=π.
- `slopeDivision_negative` (non-example): D_{−1/3} uses Π³=π^{−1}, not π, and has invariant −1/3.
- `slopeDivision_end` (compatibility): D_{1/3}≅End_Φ(D(−1,3)), not End_Φ(D(1,3)).

Acceptance checks:

- The label is λ, the negative of the isocrystal slope.

Downstream uses:

- FF18 8.2.8: Compute stable-bundle endomorphisms.
- CFT Layer 5: Match algebraic Brauer classes with the arithmetic local invariant.

Sources:

- [FF18-courbes](#source-ff18-courbes), Definition 8.2.7, p. 237. Specific unramified presentation with the bundle-slope label.

<a id="vectorbundlesandisocrystals-vb0-brauer-invariant-sign"></a>

### Arithmetic Brauer invariant and slope normalization

`VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign` · comparison · implementation `unchecked`.

Under the algebraic-to-cohomological Brauer comparison and the arithmetic local invariant inv_E:Br(E)≃Q/Z, inv_E[D_λ]=λ mod Z. Restriction to finite E′/E multiplies this invariant by [E′:E]; the opposite algebra negates it. This fixes the choice Πx=σ(x)Π with arithmetic, not geometric, Frobenius.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/slope-division-algebra`](#vectorbundlesandisocrystals-vb0-slope-division-algebra); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`; `tauceti:TauCeti.BrauerGroup.baseChange_mk`; `tauceti:TauCeti.BrauerGroup.mk_end`.

Proof / construction outline:

1. Import the general unramified cyclic-algebra invariant formula inv Cyc(E_h,σ,π^d)=d/h from CFT Layer 5, including its comparison with the pinned algebraic Brauer group.
2. Use BrauerGroup.baseChange_mk for the algebraic scalar extension; translate CFT restriction multiplication and opposite inversion.

Suggested declaration: `slopeBrauerInvariant`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB0`.

Acceptance checks:

- The invariant of D_{1/3} is 1/3, not −1/3; cubic unramified scalar extension splits its class.
- D_{1/2} splits over E_2, consistent with the pinned split endomorphism-algebra class.

Downstream uses:



Sources:

- [FF18-courbes](#source-ff18-courbes), Definition 8.2.7, p. 237. Presentation determines the arithmetic sign.

<a id="vectorbundlesandisocrystals-vb0-scalar-extension-adjunction"></a>

### Coefficient extension and induction adjunction

`VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction` · comparison · implementation `unchecked`.

For finite separable E′/E of residue degree f, ramification degree e and total degree n=ef, identify the coefficient fields compatibly. Pull D to D⊗_{L_E}L_E′ with Frobenius Φ^f⊗σ_E′; induction is the f cyclic conjugate copies of restriction of scalars, with wraparound given by Φ′. Pull is left adjoint to induction; the Hom isomorphism is given by coefficient extension and the cyclic Frobenius components. Pull preserves rank and scales slopes by n; induction multiplies rank by n and divides isoclinic slopes by n. At the bundle stage they compare to the finite curve map pullback/pushforward.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`](#vectorbundlesandisocrystals-vb0-isocrystal-category-and-standard-block); [`VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`](#vectorbundlesandisocrystals-vb0-dieudonne-manin-isocrystals); `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`; `SchemeAndStackFoundations:SF.1`.

Proof / construction outline:

1. Use σ_E′=σ_E^f and v_E′(π_E)=e to obtain the total-degree slope factor ef, not merely f.
2. Give the cyclic induction arrows explicitly and prove Hom(Pull D,D′)≅Hom(D,Ind D′), using ordinary coefficient restriction and Frobenius iteration. No unproved reverse trace adjunction is assumed.
3. Check units/counits and Frobenius; apply the block classification to compute slopes.

Suggested declaration: `coefficientAdjunction`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB0`.

Acceptance checks:

- Unramified degree two sends slope 1/2 to 1; totally ramified degree two sends slope 1 to 2.
- The two coefficient categories differ even if their L fields identify.

Downstream uses:



Sources:

- [FF18-courbes](#source-ff18-courbes), 8.2.3 after Proposition 8.2.8, p. 238. Coefficient extension/induction and corresponding curve maps.

<a id="vectorbundlesandisocrystals-vb0-finite-galois-descent"></a>

### Finite Galois descent of isocrystals

`VectorBundlesAndIsocrystals:VB0/finite-galois-descent` · comparison · implementation `unchecked`.

Let L′/L be finite Galois and let σ′ be a coefficient automorphism extending σ. Finite L-vector spaces with bijective σ-semilinear Φ are equivalent to finite L′-vector spaces with bijective σ′-semilinear Φ′ and a semilinear Galois descent action ρ satisfying Φ′ρ_g=ρ_{σ′gσ′^{-1}}Φ′ for every g∈Gal(L′/L). The descended module is the invariant module and Φ′ restricts to a bijective σ-semilinear Φ. Ordinary commutation with each ρ_g is sufficient only when σ′ centralizes the Galois group. This is module descent with Frobenius, not classification over arbitrary perfect residue fields.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`](#vectorbundlesandisocrystals-vb0-isocrystal-category-and-standard-block); `SchemeAndStackFoundations:SF.1`.

Proof / construction outline:

1. Apply the supplier finite faithfully flat module descent equivalence.
2. The conjugation compatibility makes Φ′ preserve Galois invariants; its inverse also preserves them. Descend both maps and the intertwining equation on arrows through the effective module descent equivalence.

Suggested declaration: `isocrystalGaloisDescent`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB0`.

Acceptance checks:

- For the identity extension the equivalence is the identity.
- Rank-one forms require their descent cocycle; slope alone is not asserted to classify them.

Downstream uses:



Sources:

- [FF18-courbes](#source-ff18-courbes), 8.2.3, Definition 8.2.5, printed p. 236. Finite coefficient category, including its dependence on E; L is used as a field, with π inverted.
- [Ked05](#source-ked05), 4.5.7–4.5.8, pp. 498–499. Statement source for coefficient isocrystals and the limits of slope classification. The conjugation compatibility and descent assertion here are derived from ordinary effective finite Galois module descent requested from SF.1, rather than quoted as Theorem 4.5.7.

<a id="vectorbundlesandisocrystals-vb1"></a>

## VB1 — Bundles, cohomology and geometric slope theory

The first eight nodes use only the analytic curve and its annuli. Standard twist cohomology then consumes the early Lubin–Tate calculation in VB3. The geometric prefix supplies chart coverage and regularity before general GAGA; determinant degree, saturation and HN are proved without using classification.

Planets: [Curve vector bundles](#vectorbundlesandisocrystals-vb1-finite-locally-free-bundles); [Frobenius cohomology complex](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); [V-descent for curve bundles](#vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology); [Isocrystal-to-bundle functor](#vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor); [Picard degree](#vectorbundlesandisocrystals-vb1-picard-degree); [Harder–Narasimhan filtration](#vectorbundlesandisocrystals-vb1-harder-narasimhan-filtration).

<a id="vectorbundlesandisocrystals-vb1-finite-locally-free-bundles"></a>

### Finite locally free bundles on the curve

`VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles` · definition · implementation `unchecked`.

For X_S imported from RF1, Bun(X_S) is the category of structure-sheaf modules admitting a covering with finite free trivializations. The same local generator data must be finite and locally free. Schematic bundles use Scheme.Modules and the pinned local generator APIs; analytic bundles use the R3 coherent-sheaf carrier. Pullback, tensor, dual, determinants and exact sequences are transported from these suppliers. Finite rank is required even though the pinned locally free predicate alone allows infinite ranks.

Prerequisites: `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`; `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`; `SchemeAndStackFoundations:SF.0`; `mathlib:AlgebraicGeometry.Scheme.Modules`; `mathlib:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData`; `mathlib:SheafOfModules.LocalGeneratorsData.IsFiniteType`; `tauceti:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation`.

Proof / construction outline:

1. Bundle the existing sheaf-of-modules object with finite locally free trivialization data; forgetful functors are full subcategory inclusions.
2. Import sheaf pullback and its tensor coherence. Define exactness using exact sequences of sheaves, retaining locally free endpoints.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `CurveBundle` (data): A structure-sheaf module with a single finite locally free local generator witness.
- `CurveBundle.ofFree` (constructor): The free sheaf of finite rank n.
- `CurveBundle.ext` (extensionality): Bundle morphisms are equal iff the underlying sheaf morphisms are equal.
- `CurveBundle.pullback` (functoriality): Pullback along curve-base change, with identity and composition isomorphisms.
- `CurveBundle.tensorDual` (structure): Tensor, unit, dual and evaluation from the structure-sheaf module category.
- `CurveBundle.finitePresentation` (compatibility): Apply the pinned finite-presentation theorem to the same finite locally free witness.

Unit tests:

- `curveBundle_zero` (degenerate): The free sheaf on the empty family is a bundle of rank 0.
- `curveBundle_free_two` (computation): O_X⊕O_X is a bundle of rank 2.
- `curveBundle_not_infinite` (non-example): On a nonempty geometric curve, a free sheaf on an infinite constant basis is not finite locally free; test its nonzero residue-field stalk. The nonempty hypothesis excludes the empty scheme, where the zero sheaf admits every vacuous presentation.
- `curveBundle_schematic` (compatibility): For a scheme, forgetting CurveBundle returns its Scheme.Modules object with the pinned finite locally free data.

Acceptance checks:

- The zero object and free rank n objects are admitted; infinite free modules are excluded.

Downstream uses:

- FS II.2.1–15: Carrier for analytic descent, cohomology, degree and classification.
- KL15 6.3.12: Common carrier for Frobenius-module comparisons.

Sources:

- [FS-geometrization](#source-fs-geometrization), II.2 preamble and Proposition II.2.1, pp. 57–58. Finite locally free objects, with analytic descent.

<a id="vectorbundlesandisocrystals-vb1-annular-frobenius-descent"></a>

### Annular Frobenius descent for bundles

`VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent` · comparison · implementation `unchecked`.

For affinoid perfectoid S of characteristic p over F_q, finite locally free bundles on X_S are equivalent, exactly and tensorially, to finite projective bundles on the RF0 closed annuli with compatible overlap identifications and bijective Frobenius identification under radius rescaling. Restriction to a fundamental annular range and Frobenius translates gives the inverse. Cohomology on Y_S is acyclic in positive degrees by sousperfectoid annular acyclicity and dense restriction maps.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`](#vectorbundlesandisocrystals-vb1-finite-locally-free-bundles); `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`; `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`; `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`; `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`; `DiamondsAndVStacks:D0/cech-to-derived-comparison`; `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity`.

Proof / construction outline:

1. Import annular finite-projective/coherent equivalence and acyclicity from R3; identify the RF0 annuli and Frobenius rescaling.
2. Glue the fundamental range and all Frobenius translates; RF1 quotient descent yields the inverse to restriction.
3. For the exhaustion of Y_S, use dense restriction maps to kill lim¹ and the Čech-to-derived supplier; no global GAGA is used.

Suggested declaration: `annularBundleDescent`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Acceptance checks:

- The identity descent datum gives O_X; replacing a bijective Frobenius identification by a noninvertible map is not descent.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), II.2 preamble, p. 57. Annular acyclicity, dense restriction maps and Frobenius descent.
- [CS17](#source-cs17), 3.3.4, p. 683. Annular construction of the tensor equivalence.

<a id="vectorbundlesandisocrystals-vb1-tilted-robba-ring"></a>

### Relative tilted Robba ring from curve annuli

`VectorBundlesAndIsocrystals:VB1/tilted-robba-ring` · construction · implementation `unchecked`.

For perfectoid affinoid S=Spa(R,R⁺) in characteristic p, define the relative tilted Robba ring R̃_R as colim_{r>0} lim_{s→0} Γ(Y_{S,[s,r]},O). At fixed r the inverse limit has its Fréchet seminorms, and the union carries the corresponding LF topology. Frobenius rescales radii by q. For E=Q_p its absolute specialization agrees with CS17 3.2.10, and its relative form is the ring used in 3.3.4; general E uses the coefficient-compatible RF0 annuli. Absolute field R gives a Bézout ring; no such assertion is made for every affinoid R.

Prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`; `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`; [`VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`](#vectorbundlesandisocrystals-vb1-annular-frobenius-descent).

Proof / construction outline:

1. Take the inverse limits with the annular restriction maps, then the filtered union over outer radii; retain all seminorms.
2. Identify the q-Frobenius maps on the limit system. Use the field-only Bézout input of RF0 when required, not in the relative case.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `TiltedRobba` (constructor): The annular inverse-limit/filtered-union ring.
- `TiltedRobba.restrict` (functoriality): Cofinal radius restriction maps, compatible with composition.
- `TiltedRobba.frobenius` (structure): Coefficient-semilinear ring automorphism with radius rescaling q.
- `TiltedRobba.seminorm` (data): The family of annular seminorms on fixed-radius Fréchet pieces.
- `TiltedRobba.compareCS` (compatibility): For E=Q_p identify the ring, Frobenius and topology with CS17 3.2.10.

Unit tests:

- `tiltedRobba_cofinal` (characterisation): Using s_j→0 in a fixed r inverse limit produces the same ring and topology.
- `tiltedRobba_zero_section` (degenerate): The zero compatible annular family has all seminorms zero.
- `tiltedRobba_frobenius_radius` (computation): At Q_p, Frobenius moves the outer radius r to r/p in the CS convention.
- `tiltedRobba_not_algebraic_union` (non-example): Replacing the fixed-r inverse limit by an algebraic union loses compatible sections defined on all sufficiently small inner radii.

Acceptance checks:

- Changing the cofinal radius sequence gives a canonical topological ring isomorphism.

Downstream uses:

- CS17 3.3.4: A single-ring description of analytic curve bundles.
- KL15 6.3.17–18: Norms and continuous group actions on Frobenius invariants.

Sources:

- [CS17](#source-cs17), Definition 3.2.10 and Theorems 3.2.13, 3.3.4, pp. 681–683. Actual limit/colimit topology and coefficient Frobenius.

<a id="vectorbundlesandisocrystals-vb1-robba-frobenius-modules"></a>

### Finite projective Frobenius modules and integral models

`VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules` · definition · implementation `unchecked`.

A Robba Frobenius module is a finite projective R̃_R-module M with a semilinear Frobenius whose linearization φ* M→M is an isomorphism. A globally étale model is a finite locally free module over the integral Robba ring whose linearized Frobenius is invertible and whose scalar extension is M. This defines the global model predicate needed in KL 8.8.7; equivalence with pointwise purity or local systems is not included here and remains VB4-owned.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`](#vectorbundlesandisocrystals-vb1-tilted-robba-ring); `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

Proof / construction outline:

1. Use finite-projective modules and the actual scalar-extension linearization, not an arbitrary endomorphism.
2. Import the integral Robba subring from RF0 and store a finite locally free Frobenius-stable model plus scalar-extension isomorphism.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `RobbaPhiModule` (data): Finite projective M with invertible Frobenius linearization.
- `RobbaPhiModule.Hom` (data): R̃-linear maps commuting with Frobenius.
- `RobbaPhiModule.baseChange` (functoriality): Base change of modules and linearizations under coefficient-compatible perfectoid maps.
- `RobbaPhiModule.GlobalEtaleModel` (data): An integral finite locally free model and Frobenius identification.
- `RobbaPhiModule.isGloballyEtale` (characterisation): Existence of such a global model; independent of presentation.

Unit tests:

- `robbaPhi_trivial` (degenerate): The rank-one ring with its own Frobenius has its evident integral étale model.
- `robbaPhi_noninvertible` (non-example): Zero linearization on a nonzero free module is excluded.
- `robbaPhi_finite_projective` (compatibility): Over an absolute field the module is free by the field Bézout theorem, while its definition remains finite projective.
- `robbaPhi_unit_lattice` (characterisation): A rank-one Frobenius multiplier that is an integral unit preserves an invertible rank-one integral model.

Acceptance checks:

- Global model data does not follow merely from a slope computed at one geometric point.

Downstream uses:

- KL15 6.3.12: Bundle equivalence.
- KL15 8.8.7: Global étale models imply vanishing after positive twist and global ampleness.

Sources:

- [CS17](#source-cs17), Definition before Theorem 3.3.4, p. 683 (absolute case before 3.2.13, p. 681). Finite projectivity and invertible Frobenius.
- [KL15](#source-kl15), 7.3.4–7.3.5, pp. 148–149. The global integral-model condition differs from pointwise purity.

<a id="vectorbundlesandisocrystals-vb1-robba-bundle-equivalence"></a>

### Exact tensor equivalence of Robba modules and curve bundles

`VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence` · comparison · implementation `unchecked`.

For affinoid perfectoid characteristic-p S, RobbaPhiModule(R̃_S)≃Bun(X_S) is an exact tensor equivalence, commuting with base change and duals. Spread a finite presentation to sufficiently small annuli, extend across Frobenius translates, then descend to X_S. Its inverse takes compatible annular sections. For Q_p this is CS17 3.3.4. The general-E coefficient comparison is requested from RF0; this analytic equivalence does not require Proj/GAGA.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`](#vectorbundlesandisocrystals-vb1-robba-frobenius-modules); [`VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`](#vectorbundlesandisocrystals-vb1-annular-frobenius-descent).

Proof / construction outline:

1. Spread module and invertible linearization matrices to annuli using finite projectivity; a finite range suffices.
2. Use Ann to glue and descend; restriction reconstructs the original module and arrows.
3. Compare tensor and exact sequences on annuli, using the supplier coherent equivalence.

Suggested declaration: `robbaBundleEquivalence`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Acceptance checks:

- Rank-one Frobenius π^{-n} gives O(n), fixing the sign.
- The equivalence includes all finite projective relative modules, not only globally free ones.

Downstream uses:



Sources:

- [CS17](#source-cs17), Theorem 3.3.4, p. 683. Exact tensor comparison proved through annuli.
- [KL15](#source-kl15), 6.3.12, p. 141. Robba and Frobenius-bundle comparison; schematic leg is reserved for GAGA.

<a id="vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology"></a>

### Two-term Frobenius complex for curve cohomology

`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology` · construction · implementation `unchecked`.

For a bundle V descended from M on Y_S, derived global sections on X_S identify with the homotopy fiber of φ−1 on RΓ(Y_S,M). Annular Stein acyclicity reduces this to [Γ(Y_S,M) →^{φ−1} Γ(Y_S,M)] in degrees 0 and 1. H⁰ is the kernel, H¹ the cokernel and H^i=0 for i>1. The differential is E-linear, not L-linear; negative shifted complexes are interpreted by hypercohomology, never by a bare cokernel definition of Banach–Colmez spaces.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`](#vectorbundlesandisocrystals-vb1-annular-frobenius-descent); `DiamondsAndVStacks:D0/cech-to-derived-comparison`; `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity`.

Proof / construction outline:

1. Apply the quotient group cohomology fiber sequence for the infinite cyclic Frobenius action.
2. Use Ann to eliminate higher cohomology on Y_S. Identify kernel/cokernel by the two-term long exact sequence.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `FrobeniusComplex` (constructor): The E-linear two-term complex in degrees 0 and 1.
- `FrobeniusComplex.differential` (simp): The differential sends x to φ(x)−x.
- `FrobeniusComplex.H0` (characterisation): H⁰=ker(φ−1).
- `FrobeniusComplex.H1` (characterisation): H¹=coker(φ−1).
- `FrobeniusComplex.map` (functoriality): A Frobenius-equivariant bundle morphism induces a cochain map.
- `FrobeniusComplex.compareDerived` (equivalence): Canonical quasi-isomorphism with RΓ(X_S,V), compatible with pullback.

Unit tests:

- `frobeniusComplex_zero` (degenerate): For the zero module both terms and both cohomology groups vanish.
- `frobeniusComplex_identity` (computation): For φ=id on a nonzero E-vector space the differential is zero, so H⁰ and H¹ both equal that space.
- `frobeniusComplex_kernel` (characterisation): H⁰ consists precisely of φ-fixed vectors, not all vectors.
- `frobeniusComplex_degree` (non-example): The cokernel occupies degree 1, and cannot represent H⁰(V) for an arbitrary V.

Acceptance checks:

- The zero bundle gives the zero complex; the differential on O is φ−1, not φ.

Downstream uses:

- FS II.2.5: Compute twist cohomology by difference equations.
- VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition: Supply RΓ(X_T,V_T) for its degree-zero hypercohomology v-sheaf.

Sources:

- [FS-geometrization](#source-fs-geometrization), II.2 preamble, p. 57. Derived quotient cohomology and Stein reduction.

<a id="vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology"></a>

### V-descent of bundles and their derived cohomology

`VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology` · theorem · implementation `unchecked`.

On Perf/F_q, S↦Bun(X_S) is a v-stack. For any perfectoid S and V∈Bun(X_S), T↦RΓ(X_T,V_T) on Perf/S is a derived v-sheaf. In the affinoid case this follows after completed tensoring with the perfectoid completed coefficient extension E_∞, where closed annuli become affinoid perfectoid, and descending the finite projective module data. Both arrows and effective objects descend.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`](#vectorbundlesandisocrystals-vb1-annular-frobenius-descent); [`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); `DiamondsAndVStacks:D2/higher-v-acyclicity`; `DiamondsAndVStacks:D2/v-descent-of-functions`; `SchemeAndStackFoundations:SF.1`.

Proof / construction outline:

1. Use RF0 coefficient perfectoidization and finite-projective descent on the resulting affinoid perfectoid annuli.
2. Apply D2 v-acyclicity and function descent to the annular complexes; descend Frobenius maps and glue.
3. Use the two-term derived complex, not separate underived group sheafifications, for cohomology descent.

Suggested declaration: `bundleVDescent`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Acceptance checks:

- A v-cover descent datum reconstructs a bundle uniquely up to equivalence.
- The induced maps on cohomology are the maps of the derived v-sheaf complex.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.2.1, pp. 57–58. Effective vector-bundle descent and the derived v-sheaf statement.

<a id="vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor"></a>

### The exact tensor isocrystal-to-bundle functor

`VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor` · construction · implementation `unchecked`.

Fix k=bar F_q and its coefficient inclusion in L=breve E. For perfectoid S/k with the specified k-structure, define E_S(D) by descending D⊗_L O_{Y_S} along Φ_D⊗φ_Y. It is an exact tensor functor from finite E-isocrystals to Bun(X_S), compatible with duals, k-compatible base change and finite coefficient pull/induction. For any perfectoid S/F_q, define the standard O_{X_S}(d/h) directly by descending the cyclic rank-h Frobenius matrix with wrap coefficient π^{−d}; this needs no chosen k-embedding. After base change to k it agrees with E_S(D(−d,h)). Its rank is h, O(n) agrees with RF3 rank-one twists, and O(λ)∨=O(−λ). Geometric degree d is a later consequence of degree-rank-slope-and-HN-formalism, not an input to this construction. No relative classification is asserted.

Hypotheses:

- For the general finite-isocrystal functor, S is over the fixed k=bar F_q so that L embeds in O_{Y_S}. The standard cyclic bundles alone are defined over F_q.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`](#vectorbundlesandisocrystals-vb0-isocrystal-category-and-standard-block); [`VectorBundlesAndIsocrystals:VB0/rational-standard-block`](#vectorbundlesandisocrystals-vb0-rational-standard-block); [`VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`](#vectorbundlesandisocrystals-vb0-tensor-and-dual-slopes); [`VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`](#vectorbundlesandisocrystals-vb0-scalar-extension-adjunction); [`VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`](#vectorbundlesandisocrystals-vb1-annular-frobenius-descent); [`VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`](#vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology); `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`.

Proof / construction outline:

1. Use the specified k-structure to embed L in the analytic coefficient sheaf, then apply Ann to the finite free bundle and its diagonal semilinear Frobenius. Define standard cyclic matrix descent separately over F_q and compare after k-base change.
2. Tensor/dual identities and exactness are checked on Y_S, where scalar extension is flat.
3. Compare rank-one descent with RF3 and coefficient curve maps with Adj; geometric degrees are proved in the degree node.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `bundleOfIsocrystal` (constructor): For S over the fixed k=bar F_q, the analytic Frobenius-descended bundle E_S(D), retaining the coefficient embedding.
- `bundleOfIsocrystal.map` (functoriality): Descend an intertwining linear map; preserve identity and composition.
- `bundleOfIsocrystal.tensorDual` (compatibility): Exact tensor structure and dual compatibility.
- `standardBundle` (constructor): For S/F_q, descend the cyclic matrix for (−d,h); over k compare with E_S(D(−d,h)).
- `standardBundle.integerTwist` (compatibility): O(n) identifies with RF3 rank-one twists, with their tensor laws.
- `standardBundle.baseChange` (functoriality): Perfectoid pullback preserves the cyclic standard bundle; general E_S(D) pullback retains the chosen k-embedding. At a geometric point, coefficient pullback multiplies λ by [E′:E], as proved with degree and scalar extension.

Unit tests:

- `standardBundle_zero` (degenerate): O(0) is the tensor unit of rank 1, rather than the rank-zero bundle.
- `standardBundle_half_sign` (computation): Over geometric C/k, D(1,2) maps to O(−1/2), rank 2; the degree −1 check belongs after geometric degree is constructed.
- `standardBundle_integer` (compatibility): D(−2,1) maps to the RF3 twist O(2).
- `standardBundle_tensor_half` (computation): Over geometric C/k, O(1/2)⊗O(1/2)≅O(1)^{⊕4}; rank 4 detects omission of the tensor multiplicity.

Acceptance checks:

- Over a geometric C with chosen k-embedding, D(1,2) maps to O(−1/2) of rank 2. Its degree −1 is checked after the geometric degree node. Without a k-embedding the general D⊗_L construction is unavailable; standard cyclic descent is still defined.

Downstream uses:

- FS II.2.5 and II.2.11–15: Twist cohomology and stable classification objects.
- GeometricSatakeAndFusion and GLX26 §5.1: Tensor input without asserting the G-isocrystal/G-bundle equivalence owned elsewhere.

Sources:

- [FS-geometrization](#source-fs-geometrization), II.2 preamble, p. 58. The general functor requires S over k=bar F_q, as stated immediately before this sentence. Rank-one and standard cyclic matrix objects descend already over F_q. The covariant convention reverses slopes.
- [FF18-courbes](#source-ff18-courbes), Proposition 8.2.6 and Remark 8.2.9, pp. 237–238. Tensor functor and quotient description.

<a id="vectorbundlesandisocrystals-vb1-cohomology-of-twists"></a>

### Slope-sensitive cohomology of standard bundles

`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` · theorem · implementation `unchecked`.

For λ<0, H⁰(X_S,O(λ))=0 and the v-sheaf H¹(O(λ)) is locally spatial, partially proper and cohomologically smooth. For λ=0, the degree-zero v-sheaf is constant E and the pro-étale sheafification of degree-one cohomology is zero; RΓ_proét(S,E)≃RΓ(X_S,O). For λ>0 and affinoid S, H¹(X_S,O(λ))=0; its H⁰ v-sheaf is locally spatial, partially proper and cohomologically smooth. After base change to the fixed algebraically closed k, the positive H⁰ v-sheaf is a d-dimensional perfectoid open ball in mixed characteristic only for 0<λ=d/h≤[E:Q_p]; in equal characteristic every positive λ has this description. Nonaffinoid global H¹ vanishing is not asserted. The negative λ=−1 presentation is (A¹_{S♯})^diamond/E on an untilt cover.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`](#vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor); [`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); [`VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`](#vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-lubin-tate-universal-cover); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence).

Proof / construction outline:

1. Reduce rational λ to an integer twist after the finite unramified denominator cover, using Adj and trace.
2. Solve φ−π^n by convergent annular series for positive integer twists; the zero case uses the fundamental exact sequence from the BC owner.
3. For negative twists use untilt exact sequences and induction. Import the BC owner’s basic positive/negative geometric representability package and record its retargeting request to early VB1; there is no dependence on full VB1/HN. The open-ball dimension is the positive numerator d, not the rank h.

Suggested declaration: `standardBundleCohomology`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Acceptance checks:

- At λ=0 H¹ vanishes only after the stated v-sheafification or on affinoid pro-étale input; distinguish this from a global assertion on arbitrary S.
- At Q_p, λ=2 is outside the open-ball guarantee; positivity alone is insufficient.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.2.5 and proof, pp. 62–64. Sign cases, affinoid restriction and bounded open-ball identification.

<a id="vectorbundlesandisocrystals-vb2-classification-classical-points-and-principal-ideal-domains"></a>

### Classical points and annular Dedekind rings

`VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains` · theorem · implementation `unchecked`.

For complete algebraically closed perfectoid C/F_q and a connected affinoid U=Spa(B,B⁺) in Y_C, Spm(B) identifies with the classical points of U, whose residue fields are untilts of C over E. B is a PID. On X_C, classical points are Frobenius orbits and affinoid chart rings are Dedekind domains; their PID upgrade is obtained from geometric Picard degree, rather than assumed as an early analytic input.

Prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`; `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`; `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`; `PerfectoidQuotients:Q4`; `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

Proof / construction outline:

1. Use Q4 strongly Zariski closed perfectoidization to reduce zero loci to the tilted perfectoid disc.
2. Classical maximal ideals have primitive principal generators; a nonzero function has finitely many zeros with finite orders on a compact annulus.
3. Factor by these generators to prove the annular PID assertion; descend Frobenius orbits to X_C and glue Dedekind local rings. Do not use the full schematic GAGA theorem.

Suggested declaration: `classicalPointPid`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Acceptance checks:

- Distinguish classical rank-one closed points from every topological point of the adic space.
- The untilt residue field may depend on the point, even for the fixed C.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.1.11, Corollary II.1.12 and Definition/Proposition II.1.22, pp. 53–57. Annular classical-point structure; curve affinoids are Dedekind at this step.

<a id="vectorbundlesandisocrystals-vb1-geometric-point-chart-cover"></a>

### Elementary algebraization at a geometric point

`VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover` · construction · implementation `unchecked`.

For complete algebraically closed perfectoid C, RF3 supplies P_C=⊕_{n≥0}Γ(X_C,O(n)) and chart maps on nonvanishing loci. Prove these loci cover X_C using the classical-point description and the Lubin–Tate degree-one divisor sections, then glue a global locally ringed spectral map α_C:X_C→Proj(P_C). It identifies finite locally free bundles on the geometric curve with their schematic counterparts by chartwise finite-projective comparison. This geometric-point construction precedes the general-S ampleness/GAGA theorem; it is not imported from that theorem.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`](#vectorbundlesandisocrystals-vb2-classification-classical-points-and-principal-ideal-domains); `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`; `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`; [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-lubin-tate-universal-cover); `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`; `SchemeAndStackFoundations:SF.0`.

Proof / construction outline:

1. For a nonclassical point any nonzero degree-one divisor section is nonvanishing. For a classical point choose a distinct degree-one divisor; justify this separation and existence from the Lubin–Tate evaluation sequence. G-GEOM names the exact residual proof contract.
2. Identify the degree-zero localizations with analytic nonvanishing chart functions, using RF3 chart comparisons and the early annular PID structure.
3. Glue chart maps; compare locally free sheaves chartwise through finite-projective modules and effective gluing, not through full general-S GAGA.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `geometricCurveMap` (constructor): The global map α_C formed from the proved geometric-point covering.
- `geometricCurveMap.chart` (simp): On D(f), the map is the RF3 map to D_+(f).
- `geometricCurveMap.compatible` (compatibility): The chart maps agree on D(fg) under homogeneous localization.
- `geometricBundleAlgebraization` (equivalence): Exact tensor equivalence of analytic and schematic finite locally free bundles at C.
- `geometricCurveMap.closedPoints` (characterisation): Classical points map bijectively to schematic closed points.

Unit tests:

- `geometricCurveMap_nonvanishing` (characterisation): A nonzero divisor section is nonvanishing at every nonclassical point.
- `geometricCurveMap_separates` (non-example): The section vanishing at x cannot alone define a chart containing x; use a section with a distinct zero divisor.
- `geometricCurveMap_overlap` (compatibility): The maps for f and g agree on D(fg).

Acceptance checks:

- Every classical point must be excluded from the zero locus of some chosen homogeneous section; a map defined only on their union does not suffice.

Downstream uses:

- FS II.2.9–12: Obtain regularity, Picard degree and HN before general ampleness.
- RT-AREA-padic-1/21: Remove the former ampleness/degree/classification cycle.

Sources:

- [FS-geometrization](#source-fs-geometrization), Proof of Proposition II.2.9, p. 68. Untilts produce degree-one divisor sections.
- [FS-geometrization](#source-fs-geometrization), Proposition II.2.7, pp. 66–67. Chart gluing is used only after proving coverage; general ampleness is not used in this geometric prefix.

<a id="vectorbundlesandisocrystals-vb2-ampleness-schematic-curve-at-a-geometric-point"></a>

### Regular noetherian geometric curve and PID complements

`VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point` · theorem · implementation `unchecked`.

For complete algebraically closed perfectoid C, X_C^alg=Proj(P_C) is connected, regular, noetherian and one-dimensional. Classical points correspond bijectively to its closed points; for every classical x the complement of x in X_C^alg is affine with PID coordinate ring. Degree-one untilt divisor sections cut out Spec(C♯) and their nonvanishing complements give these charts.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`](#vectorbundlesandisocrystals-vb1-geometric-point-chart-cover); [`VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`](#vectorbundlesandisocrystals-vb2-classification-classical-points-and-principal-ideal-domains); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); `SchemeAndStackFoundations:SF.0`.

Proof / construction outline:

1. A divisor section f_x cuts out the untilt point; find a chart containing x using GeoMap.
2. Factor a homogeneous section into its finitely many classical zeros and an everywhere nonzero remainder, using ClassPt. An invertible positive twist would contradict the computed twist cohomology, so the remainder has degree zero and lies in E×.
3. Use this factorization in P[f_x^{-1}]_0 to prove PID, identify maximal ideals and DVR local rings, and glue the noetherian regular one-dimensional scheme.

Suggested declaration: `geometricCurveRegular`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Acceptance checks:

- X_C^alg is not asserted to be a finite-type E-curve; regularity and noetherianness are local statements from its charts.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.2.9 and proof, p. 68. Geometric chart structure and PID complement; proof is transplanted after the independent early chart cover.

<a id="vectorbundlesandisocrystals-vb1-completed-local-ring-comparison"></a>

### Untilts and completed local rings

`VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison` · comparison · implementation `unchecked`.

At a classical point x of the geometric curve, identify the completed local ring with the RF2 untilt period DVR, whose residue field is C_x♯. At E=Q_p this is B_dR⁺(C_x♯). A uniformizer t_x depends on a choice of generator; neither its equality with a global t nor the equality of every untilt with a fixed C♯ is asserted.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`](#vectorbundlesandisocrystals-vb2-ampleness-schematic-curve-at-a-geometric-point); `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

Proof / construction outline:

1. Compare analytic and homogeneous-localization stalks through GeoMap.
2. Complete the regular local ring and identify the primitive untilt ideal with the RF2 period DVR; specialize to the Q_p B_dR⁺ statement.

Suggested declaration: `completedLocalUntilt`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Acceptance checks:

- Changing a local generator multiplies t_x by a unit; residue fields are identified with their own untilts.

Downstream uses:



Sources:

- [CN25-VB0](#source-cn25-vb0), §3.2.1, p. 14. Completed local ring and point-dependent untilt.

<a id="vectorbundlesandisocrystals-vb1-picard-degree"></a>

### Picard group of the geometric curve

`VectorBundlesAndIsocrystals:VB1/picard-degree` · theorem · implementation `unchecked`.

At complete algebraically closed C, the map Z→Pic(X_C), n↦[O(n)], is an isomorphism of groups. Every classical point has divisor class [O(1)]. Use the existing invertible-sheaf and line-bundle-class carriers, adding dual inverses and the curve-specific integer classification; a commutative monoid of classes in the baseline is not already this Picard computation.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`](#vectorbundlesandisocrystals-vb2-ampleness-schematic-curve-at-a-geometric-point); [`VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`](#vectorbundlesandisocrystals-vb1-geometric-point-chart-cover); [`VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`](#vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor); `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`; `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`; `mathlib:CommRing.Pic`.

Proof / construction outline:

1. Trivialize a line bundle away from one closed point using its PID complement.
2. A transition at the DVR is a power of the uniformizer times a unit, so the bundle is O(n[x]).
3. The Lubin–Tate divisor sequence identifies O([x])=O(1); cohomology rules out a nonzero n with O(n) trivial.

Suggested declaration: `picardDegreeEquivalence`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Acceptance checks:

- O(n)≅O(m) iff n=m, and O([x]) has degree 1 for every classical x.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.2.10 and proof, p. 68. Integer Picard classification from PID complements and DVR divisors.

<a id="vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism"></a>

### Rank, determinant degree and rational slope

`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism` · construction · implementation `unchecked`.

For V∈Bun(X_C), rank(V) is its finite locally constant rank, constant on connected X_C. Set deg(V)=PicDegree(det V)∈Z and μ(V)=deg(V)/rank(V)∈Q only for V≠0. Rank and degree are additive in bundle short exact sequences; deg(V⊗W)=rank(W)deg(V)+rank(V)deg(W), deg(V∨)=−deg(V). For O(d/h) in reduced form, rank=h and degree=d. No global degree function on arbitrary perfectoid S is asserted; VB4 uses geometric fibers.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`](#vectorbundlesandisocrystals-vb1-finite-locally-free-bundles); [`VectorBundlesAndIsocrystals:VB1/picard-degree`](#vectorbundlesandisocrystals-vb1-picard-degree); [`VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`](#vectorbundlesandisocrystals-vb0-tensor-and-dual-slopes); [`VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`](#vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor); `SchemeAndStackFoundations:SF.0`.

Proof / construction outline:

1. Import determinant and finite-rank exact-sequence identities from the sheaf supplier. Compose determinant class with the inverse Picard isomorphism.
2. Compute ranks and degrees of blocks after the unramified denominator cover or determinant Frobenius; this uses no bundle classification.
3. Keep the nonzero hypothesis at every slope comparison; zero bundles are treated separately.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `bundleRank` (projection): Constant finite rank on X_C.
- `bundleDegree` (constructor): Integer Picard degree of the determinant.
- `bundleSlope` (projection): Rational degree/rank for a nonzero bundle.
- `bundleDegree.exact` (relation): Degree and rank add in short exact sequences.
- `bundleDegree.tensorDual` (relation): Tensor determinant formula and dual sign.
- `bundleDegree.standard` (simp): For λ=d/h reduced, rank O(λ)=h and degree O(λ)=d.

Unit tests:

- `bundleDegree_zero` (degenerate): Rank and degree of the zero bundle are both zero; no slope is requested.
- `bundleDegree_half` (computation): O(1/2) has (rank,degree,slope)=(2,1,1/2).
- `bundleDegree_dual` (compatibility): O(1/2)∨ has rank 2, degree −1 and slope −1/2.
- `bundleDegree_directSum` (computation): O(1)⊕O(−1) has rank 2 and degree 0, although its HN slopes are 1 and −1.

Acceptance checks:

- O(1/2) has rank 2, degree 1 and slope 1/2.

Downstream uses:

- FS II.2.11–14: Stability and HN axioms.
- VectorBundlesAndIsocrystals:VB4: Degree and slope of each geometric fiber; do not assume a constant global relative degree.

Sources:

- [FS-geometrization](#source-fs-geometrization), After Proposition II.2.10, pp. 68–69. Geometric determinant degree and rank-normalized slope.
- [FF18-courbes](#source-ff18-courbes), 5.5.1, pp. 162–163 (rank/degree axioms p. 162; Definition 5.5.1 p. 163). Rank/degree inputs of HN theory.

<a id="vectorbundlesandisocrystals-vb1-saturation-and-torsion-degree"></a>

### Saturation and torsion degree on the geometric curve

`VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree` · construction · implementation `unchecked`.

For a coherent subsheaf F of a geometric bundle V, its saturation F^sat is the inverse image of the torsion subsheaf of V/F, so V/F^sat is torsion free and locally free on the regular one-dimensional curve. A torsion coherent sheaf T has degree ∑_x length_{O_x}(T_x)deg(x), with deg(x)=1 at a classical point. A generic-fiber isomorphism F→G of bundles satisfies deg(F)≤deg(G), with equality iff it is an isomorphism. This gives the strict-subobject and degree-monotonicity HN axioms.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`](#vectorbundlesandisocrystals-vb2-ampleness-schematic-curve-at-a-geometric-point); [`VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison`](#vectorbundlesandisocrystals-vb1-completed-local-ring-comparison); [`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`](#vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism); `SchemeAndStackFoundations:SF.0`.

Proof / construction outline:

1. Use local DVR torsion-free finite modules to show the saturated quotient is locally free.
2. Compute lengths locally and compare determinant divisors; exactness yields the degree inequality and equality criterion.
3. Verify finite support by noetherianness and quasi-compactness; generic subspaces have unique saturated inverse images.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `bundleSaturation` (constructor): The saturated inverse image inside V.
- `bundleSaturation.universal` (universal-property): Smallest saturated subsheaf containing F; its quotient is torsion free.
- `bundleSaturation.idempotent` (simp): Saturating an already saturated subsheaf does nothing.
- `torsionDegree` (constructor): Finite sum of local DVR lengths times point degree.
- `torsionDegree.exact` (relation): Torsion degree is additive in short exact sequences.
- `genericIso_degree` (characterisation): Generic bundle injection has nonnegative degree defect, zero precisely for an isomorphism.

Unit tests:

- `saturation_zero` (degenerate): The zero subbundle of a torsion-free bundle is saturated.
- `saturation_divisor` (computation): The image O(−1)⊂O cut out by one classical point saturates to O, with torsion degree 1.
- `torsionDegree_length_two` (computation): O_x/(t_x²) has degree 2, not degree 1.
- `saturation_not_same_rank` (non-example): Equal generic rank does not make O(−1)→O an isomorphism; its degree defect is positive.

Acceptance checks:

- For O→O(1) defined by a degree-one divisor section the cokernel has length 1 and degree 1.

Downstream uses:

- FF18 5.5.1: Verify generic-fiber exact-category HN hypotheses.
- Coherent classification: Separate torsion and bundle pieces.

Sources:

- [FF18-courbes](#source-ff18-courbes), 5.5.2.1, printed p. 164; generic-isomorphism axioms in 5.5.1, p. 162. Torsion degree and generic-isomorphism inequality.

<a id="vectorbundlesandisocrystals-vb1-geometric-semistability"></a>

### Stable and semistable geometric bundles

`VectorBundlesAndIsocrystals:VB1/geometric-semistability` · definition · implementation `unchecked`.

A nonzero bundle V on X_C is semistable if every proper nonzero saturated subbundle F has μ(F)≤μ(V), and stable if the inequality is strict. Checking all coherent subsheaves of smaller positive rank is equivalent after saturation. The zero bundle is admitted into each fixed-slope subcategory separately, but has no slope and is not called stable.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`](#vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism); [`VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`](#vectorbundlesandisocrystals-vb1-saturation-and-torsion-degree).

Proof / construction outline:

1. Use saturated subbundles to match the exact-category strict subobjects.
2. Apply saturation’s degree monotonicity to compare the coherent-subsheaf formulation.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `BundleSemistable` (characterisation): Nonzero V and the weak inequalities for proper saturated subbundles.
- `BundleStable` (characterisation): Nonzero V and the strict inequalities.
- `BundleStable.semistable` (relation): Stable implies semistable.
- `BundleSemistable.iso` (compatibility): Stability and semistability are invariant under bundle isomorphisms.
- `BundleSemistable.saturation` (equivalence): Equivalent test using coherent subsheaves of smaller positive rank.

Unit tests:

- `bundleSemistable_line` (degenerate): Every line bundle is stable: there is no proper positive-rank saturated subbundle.
- `bundleSemistable_equal_sum` (characterisation): O⊕O is semistable of slope 0 but is not stable.
- `bundleSemistable_unequal_sum` (non-example): O(1)⊕O(−1) is not semistable: O(1) has slope 1>0.
- `bundleStable_zero` (non-example): The zero bundle is not stable and is never assigned a finite slope.

Acceptance checks:

- A direct sum of two equal-slope line bundles is semistable and not stable.

Downstream uses:

- FS II.2.11–14: Identify O(λ), define HN graded pieces and the fixed-slope category.

Sources:

- [FS-geometrization](#source-fs-geometrization), Before Example II.2.11, p. 69. Proper nonzero subobjects and slope inequalities.
- [FF18-courbes](#source-ff18-courbes), Definition 5.5.5 and Proposition 5.5.6, p. 164. Semistable fixed-slope category and simple objects.

<a id="vectorbundlesandisocrystals-vb1-harder-narasimhan-filtration"></a>

### Harder–Narasimhan filtration of geometric bundles

`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration` · construction · implementation `unchecked`.

Every bundle V on X_C has a unique finite exhaustive filtration by saturated subbundles with nonzero semistable graded pieces of strictly decreasing rational slopes. Write V^{≥λ} for the decreasing threshold filtration; it is functorial and invariant under isomorphism. The zero bundle has the empty filtration. Existence uses the HN axioms, including boundedness of degrees of subbundles of each rank; it does not use the geometric classification theorem.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/geometric-semistability`](#vectorbundlesandisocrystals-vb1-geometric-semistability); [`VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`](#vectorbundlesandisocrystals-vb1-saturation-and-torsion-degree); [`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`](#vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism); [`VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`](#vectorbundlesandisocrystals-vb2-ampleness-schematic-curve-at-a-geometric-point); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists).

Proof / construction outline:

1. Verify exactness of generic fiber, positivity of rank, saturated subobject correspondence, determinant additivity and generic-isomorphism degree monotonicity with Sat.
2. Obtain rankwise upper bounds by a meromorphic trivialization V→O(N)^m with finite divisor poles, then use wedge injections and negative-twist H⁰ vanishing. This avoids invoking global generation/GAGA; its complete verification is G-HN.
3. Choose the maximal-slope subobject of maximal rank and iterate on its locally free quotient. Uniqueness and functoriality follow from slope orthogonality.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `HNFiltration` (constructor): The unique saturated finite decreasing-slope filtration.
- `HNFiltration.threshold` (projection): V^{≥λ} for a rational threshold λ.
- `HNFiltration.graded` (data): Semistable graded bundles and their ranks and degrees.
- `HNFiltration.unique` (characterisation): Every filtration satisfying these properties equals the canonical one.
- `HNFiltration.functorial` (functoriality): Every bundle morphism preserves each threshold piece.
- `HNFiltration.semistable` (characterisation): A nonzero bundle is semistable iff it has one HN slope.

Unit tests:

- `hnFiltration_zero` (degenerate): The zero bundle has no nonzero HN graded pieces.
- `hnFiltration_two_slopes` (computation): O(1)⊕O(−1) has descending HN slopes 1,−1 and rank-one pieces.
- `hnFiltration_equal_slopes` (characterisation): O⊕O has one slope-zero piece of rank 2, rather than two strictly decreasing equal slopes.
- `hnFiltration_threshold` (computation): For O(1)⊕O(−1), the threshold ≥0 is O(1).

Acceptance checks:

- For O(1)⊕O(−1), the first piece is O(1); for a semistable object there is a single nonzero graded piece.

Downstream uses:

- FS II.2.13–14: Base change, semistable reduction and split classification.
- VectorBundlesAndIsocrystals:VB4: Fiberwise HN data; relative HN filtration is owned by VB4.

Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.2.12, p. 69. Existence, uniqueness and functoriality.
- [FF18-courbes](#source-ff18-courbes), 5.5.1–5.5.4, pp. 162–164. Exact-category construction and fixed-slope orthogonality.

<a id="vectorbundlesandisocrystals-vb1-harder-narasimhan-polygon"></a>

### Rank-normalized Harder–Narasimhan polygon

`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon` · construction · implementation `unchecked`.

For HN graded pieces with ranks r_i and slopes λ_1>…>λ_m, the HN polygon is the concave piecewise-linear function on [0,rank V] starting at (0,0), with segment length r_i and slope λ_i. It ends at (rank V,deg V). For V=0 it is the single point (0,0). Use rank lengths, not one unit per simple block.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`](#vectorbundlesandisocrystals-vb1-harder-narasimhan-filtration).

Proof / construction outline:

1. Take cumulative ranks and degrees of HN graded pieces and linearly interpolate.
2. Strictly decreasing slopes prove concavity; exact additivity proves the endpoint formula.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/VB1`.

Planning API:

- `HNPolygon` (constructor): The rational piecewise-linear polygon from HN graded data.
- `HNPolygon.vertices` (projection): Cumulative rank and degree vertices.
- `HNPolygon.endpoint` (simp): Endpoint (rank V,deg V).
- `HNPolygon.concave` (characterisation): The polygon has decreasing segment slopes.
- `HNPolygon.directSum` (compatibility): Direct sum merges the descending slope multisets, weighted by ranks.

Unit tests:

- `hnPolygon_zero` (degenerate): The zero polygon has only (0,0).
- `hnPolygon_half` (computation): For O(1/2) the endpoint is (2,1), not (1,1/2).
- `hnPolygon_split` (computation): For O(1)⊕O(−1), vertices are (0,0),(1,1),(2,0).
- `hnPolygon_not_slope_only` (non-example): The polygon of O(1)⊕O(−1) is not the horizontal rank-two degree-zero segment.

Acceptance checks:

- O(1/2) gives a segment from (0,0) to (2,1).

Downstream uses:

- VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon: Fiberwise polygons and dominance order.

Sources:

- [FF18-courbes](#source-ff18-courbes), Theorem 5.5.3, p. 163. Concavity, rank-axis normalization and filtration data.

<a id="vectorbundlesandisocrystals-vb2"></a>

## VB2 — Ampleness and classification

VB2 is the aggregate of the following two substages. Its coverage does not mean that either substage can be imported wholesale to prove its own prerequisites.

<a id="vectorbundlesandisocrystals-vb2-ampleness"></a>

## VB2:ampleness — Ampleness and algebraization

Quantitative generation keeps the corrected two-half-annulus proof and its general-E comparison obligation. Global homogeneous charts and GAGA follow generation. The remaining KL criteria keep their coefficient, topology, integral-model and twist hypotheses.

Planets: [Positive-twist global generation](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [Fargues–Fontaine GAGA](#vectorbundlesandisocrystals-vb2-ampleness-gaga-equivalence); [Tensor global ampleness](#vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness); [Cohomological ampleness criterion](#vectorbundlesandisocrystals-vb2-ampleness-cohomological-ampleness-criterion).

<a id="vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation"></a>

### Global generation and vanishing after positive twists

`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation` · theorem · implementation `unchecked`.

For affinoid perfectoid S/F_q and V∈Bun(X_S), there is n_0 such that for every n≥n_0, V(n) is generated by finitely many global sections and H^i(X_S,V(n))=0 for all i>0. The bound depends on V and the chosen affinoid S. On a general perfectoid base the assertion is local on S; no uniform global bound is asserted. The quantitative proof uses the two half-annulus contraction estimates of KL6.2.2–6.2.4, not the defective estimate (II.2.1) in FS.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`](#vectorbundlesandisocrystals-vb1-robba-bundle-equivalence); [`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); `KTheoryLowDegrees:Z.1`; `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`; `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`; `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

Proof / construction outline:

1. Spread finite projective data to annuli using RE. The alternative free-stabilization route uses the requested finite-projective K₀ input, but is not required by the KL proof.
2. On each half annulus of ratio q^{1/2}, bound forward and inverse Frobenius matrices by c_1,c_2. Choose a large twist and a cutoff c so that both terms in the KL6.2.2 contraction constant ε are <1; decompose coefficients using the annular splitting estimate and sum the convergent error series.
3. Construct approximate-basis invariant sections on [r/q^{1/2},r], then repeat on [r/q,r/q^{1/2}]. The two finite families together generate every annulus under Frobenius translates. Use KL6.2.2 difference-equation surjectivity and Coh for higher vanishing.
4. General-E normalization replaces the p-based KL constants with the RF0 π/q annular comparison. G-GG records that remaining comparison and forbids importing the false FS bound q^{−M−1} or its dropped π^{−N} factor.

Suggested declaration: `positiveTwistGeneration`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Acceptance checks:

- Every sufficiently large integer n works, not merely an unbounded sequence.
- For V=O(−m), n>m gives H¹=0; zero slope is treated by the zero-case cohomology statement.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Theorem II.2.6 and proof, pp. 64–66. Simultaneous generation and higher-cohomology vanishing.
- [KL15](#source-kl15), Propositions 6.2.2–6.2.4 and Remark 6.2.5, pp. 136–137. Correct two-half-annulus proof of generation and difference-equation surjectivity.

<a id="vectorbundlesandisocrystals-vb2-ampleness-global-proj-map-and-twists"></a>

### Global Proj map and compatible schematic twists

`VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists` · construction · implementation `unchecked`.

For affinoid perfectoid S, set X_S^alg=Proj(P_S) using the RF3 graded ring. Apply GG to prove the homogeneous nonvanishing loci cover X_S, then glue the RF3 chart maps to α_S:X_S→X_S^alg. For sufficiently large positive m, construct invertible O_alg(m) with pullback O(m) and compatible multiplication; use consecutive large powers to define O_alg(1) and all integer tensor powers. Do not assume the naive Proj shift sheaf in degree one is already invertible for an arbitrary graded ring.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`; `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`; `SchemeAndStackFoundations:SF.0`; [`VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`](#vectorbundlesandisocrystals-vb1-finite-locally-free-bundles).

Proof / construction outline:

1. Use GG for O to prove coverage before chart gluing.
2. On large-degree charts construct the transition ratios for O_alg(m); common refinements give multiplication coherence.
3. Choose consecutive sufficiently large a,a+1 and define O_alg(1)=O_alg(a+1)⊗O_alg(a)∨; prove independence of the choices and recovery of all large powers.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Planning API:

- `curveProjMap` (constructor): Global α_S after homogeneous chart coverage.
- `curveProjMap.chart` (compatibility): Its restriction is the RF3 homogeneous localization chart map.
- `algebraicTwist` (constructor): Invertible O_alg(n), obtained from compatible sufficiently large shifts.
- `algebraicTwist.pullback` (compatibility): α_S*O_alg(n)≅O(n).
- `algebraicTwist.add` (relation): O_alg(n+m)≅O_alg(n)⊗O_alg(m), coherently.
- `algebraicTwist.largeShift` (characterisation): For large n it agrees with the Proj graded shift sheaf.

Unit tests:

- `algebraicTwist_zero` (degenerate): O_alg(0) is the structure-sheaf tensor unit.
- `algebraicTwist_consecutive` (characterisation): O_alg(a+1)⊗O_alg(a)∨ pulls back to O(1).
- `algebraicTwist_inverse` (compatibility): O_alg(−1) is the dual of O_alg(1).
- `curveProjMap_coverage` (non-example): A map on the union of D(f) is not called curveProjMap before the union is proved to be X_S.

Acceptance checks:

- The global map is defined on all X_S; RF3’s partial union alone is insufficient.

Downstream uses:

- FS II.2.7: Global GAGA and cohomology comparison.
- RS-20/RF3: The chart supplier has no dependency on this global theorem.

Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.2.7, pp. 66–67. Large-degree tautological sheaves and their compatible roots.

<a id="vectorbundlesandisocrystals-vb2-ampleness-gaga-equivalence"></a>

### GAGA for the relative schematic curve

`VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence` · theorem · implementation `unchecked`.

Let X be a locally ringed spectral space with line bundle O(1) such that every finite locally free V has V(n) globally generated and H^i(X,V(n))=0 for all i>0 and all sufficiently large n. The homogeneous chart maps define a global α:X→Proj⊕Γ(X,O(n)); pullback gives an exact tensor equivalence of finite locally free bundles and comparison isomorphisms on all bundle cohomology. Apply this to X_S for affinoid perfectoid S via GG and GMap. No coherent-sheaf equivalence on arbitrary nonnoetherian S is inferred from this bundle statement.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [`VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`](#vectorbundlesandisocrystals-vb2-ampleness-global-proj-map-and-twists); [`VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`](#vectorbundlesandisocrystals-vb1-finite-locally-free-bundles); `SchemeAndStackFoundations:SF.0`; `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

Proof / construction outline:

1. Use sufficiently positive twists to present bundles by finite free sums; vanishing of H¹ makes the section functor exact in the needed range.
2. Build the schematic graded module and use generation and localizations to obtain a vector bundle; compare its pullback.
3. Resolve Hom bundles by twists to prove full faithfulness and exactness. A finite chart Čech complex reduces all cohomology comparisons to filtered colimits of twist sections.

Suggested declaration: `curveGaga`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Acceptance checks:

- The unit and every integer twist agree under pullback; morphisms are identified, not only isomorphism classes.
- For S=C this equivalence agrees with the independently established GeoMap prefix.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.2.7 and proof, pp. 66–67. Axiomatic GAGA after generation, vanishing and global chart construction.

<a id="vectorbundlesandisocrystals-vb2-ampleness-prufer-and-coherent-correspondence"></a>

### Prüfer charts and coherent Frobenius correspondence

`VectorBundlesAndIsocrystals:VB2:ampleness/prufer-and-coherent-correspondence` · theorem · implementation `unchecked`.

For an absolute analytic characteristic-p field F in the KL setting, every positive homogeneous chart ring P_F[f^{-1}]_0 is Prüfer. Coherent sheaves on Proj(P_F) correspond to finitely presented R̃_F-modules with invertible Frobenius linearization. Finite locally free objects correspond to finite projective Frobenius modules. The claim is absolute; Prüfer or Bézout hypotheses are not silently imposed on arbitrary relative bases.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`](#vectorbundlesandisocrystals-vb1-tilted-robba-ring); [`VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`](#vectorbundlesandisocrystals-vb1-robba-frobenius-modules); [`VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`](#vectorbundlesandisocrystals-vb2-ampleness-gaga-equivalence); `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`; `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`; `SchemeAndStackFoundations:SF.0`.

Proof / construction outline:

1. Use the absolute Robba Bézout input to prove distributivity of intersections and sums of ideals; twisted-invariant exactness transfers it to homogeneous chart rings.
2. Spread finite presentations to annuli; sheafify the corresponding graded invariant modules on Proj and reconstruct by localization.
3. Use the Prüfer characterization that finitely generated torsion-free modules are projective for the locally free subcategory.

Suggested declaration: `pruferCoherentComparison`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Acceptance checks:

- A finite torsion coherent module is allowed in the coherent correspondence but is not called a bundle.

Downstream uses:



Sources:

- [KL15](#source-kl15), Definition 6.3.5, Lemma 6.3.6 and Theorem 6.3.14, pp. 138–141. Absolute chart Prüfer property and finite-presentation coherent correspondence.

<a id="vectorbundlesandisocrystals-vb2-ampleness-norms-on-twisted-invariants"></a>

### Norm topology on twisted Frobenius invariants

`VectorBundlesAndIsocrystals:VB2:ampleness/norms-on-twisted-invariants` · construction · implementation `unchecked`.

For a finite projective tilted Robba Frobenius module M and each fixed integer n, the space Γ_n(M)=ker(φ−π^n) has a canonical Banach topology from a sufficiently small annular radius. Its induced norms at admissible radii and from finite projective presentations are equivalent. This is a separate assertion for each n; no uniform norm-equivalence constant over all n is asserted.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`](#vectorbundlesandisocrystals-vb1-robba-frobenius-modules); [`VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`](#vectorbundlesandisocrystals-vb1-tilted-robba-ring); [`VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`](#vectorbundlesandisocrystals-vb1-robba-bundle-equivalence).

Proof / construction outline:

1. Put the finite-projective quotient seminorm on a fixed annulus.
2. On eigenvectors compare the norm with its Frobenius translates; the growth bounds and annular log-convexity compare radii. KL6.3.17 prints p^{-n} alongside M(n), contrary to Definition 6.2.1; reindex its proof by n↦−n to obtain our Γ_n=ker(φ−π^n). See E15.
3. Complete the fixed-eigenvalue subspace and show the topology is independent of a presentation. General-E radius constants require RF0’s coefficient comparison.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Planning API:

- `TwistedInvariant` (constructor): The kernel of φ−π^n as an E-vector space.
- `TwistedInvariant.norm` (structure): Banach topology at a fixed n from any admissible annular norm.
- `TwistedInvariant.radiusEquiv` (compatibility): Different sufficiently small radii induce equivalent norms.
- `TwistedInvariant.map` (functoriality): Intertwining module maps act continuously on Γ_n.
- `TwistedInvariant.presentationIndependent` (characterisation): The topological vector space is independent of projective presentation.

Unit tests:

- `twistedInvariant_zero` (degenerate): For M=0 the invariant Banach space is zero.
- `twistedInvariant_n_zero` (characterisation): At n=0 the space is ker(φ−1).
- `twistedInvariant_change_radius` (compatibility): Two admissible radii induce the same open subsets of Γ_n.
- `twistedInvariant_not_exact_norm` (non-example): Rescaling the chosen module norm changes its numeric values but leaves the invariant topology unchanged.
- `twistedInvariant_sign` (characterisation): On the rank-one module with φ=π·id, π≠0 and π²≠1, Γ_1 is the whole space while ker(φ−π^{-1}) is zero. This detects the sign mismatch in KL6.3.17.

Acceptance checks:

- Changing finite projective generators preserves the topology, rather than an exact numeric norm.

Downstream uses:

- KL15 6.3.18: Detect continuity of profinite actions on the geometric bundle.

Sources:

- [KL15](#source-kl15), Lemma 6.3.17, p. 142. Annular estimates and log-convexity identify invariant norms.

<a id="vectorbundlesandisocrystals-vb2-ampleness-continuous-frobenius-group-actions"></a>

### Continuous profinite actions on Frobenius modules

`VectorBundlesAndIsocrystals:VB2:ampleness/continuous-frobenius-group-actions` · definition · implementation `unchecked`.

Let a profinite group G act by continuous E-algebra automorphisms on every fixed-radius Fréchet piece of R̃_R and commute with Frobenius; in particular it fixes E and π. A semilinear G-action on M is LF-continuous if its action map is continuous for the annular LF topology. This is equivalent to continuity of G on every Γ_n(M) with its fixed-n Banach topology. Actions commute with Frobenius and preserve the specified ring action, hence act E-linearly on each invariant space.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/norms-on-twisted-invariants`](#vectorbundlesandisocrystals-vb2-ampleness-norms-on-twisted-invariants); [`VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`](#vectorbundlesandisocrystals-vb1-robba-frobenius-modules); [`VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`](#vectorbundlesandisocrystals-vb1-tilted-robba-ring); [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation).

Proof / construction outline:

1. Define continuity using the genuine G×M topological action, not only an algebraic representation.
2. Restrict to the closed invariant spaces and apply fixed-n norm equivalence. Conversely, the quantitative-global-generation theorem supplies sufficiently many twisted invariant generators; use them to control the LF action. This is the dependency explicitly invoked as KL6.2.4 in Definition 6.3.18.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Planning API:

- `ContinuousPhiAction` (data): Frobenius-commuting semilinear G-action, whose coefficient action fixes E, with a jointly LF-continuous action map.
- `ContinuousPhiAction.restrictInvariants` (functoriality): Continuous E-linear action on Γ_n for each n.
- `ContinuousPhiAction.invariantCriterion` (equivalence): LF continuity iff every twisted-invariant action is continuous.
- `ContinuousPhiAction.baseChange` (compatibility): Continuous scalar extension along an E-algebra map compatible with the coefficient actions and Frobenius preserves the action.

Unit tests:

- `continuousPhiAction_trivial` (degenerate): The trivial group action is continuous and commutes with φ.
- `continuousPhiAction_all_weights` (characterisation): The criterion quantifies over all integers n, including negative and zero twists.
- `continuousPhiAction_finite` (compatibility): A finite discrete group acting by continuous semilinear automorphisms yields a continuous action.
- `continuousPhiAction_requires_commutation` (non-example): A continuous module action that does not commute with φ does not restrict to the invariant spaces and is excluded.

Acceptance checks:

- Testing one eigenvalue alone is not the stated criterion.

Downstream uses:

- KL15 6.3.18 and Galois-equivariant consumers: Transfer topological actions through the Robba/bundle comparison.

Sources:

- [KL15](#source-kl15), Definition 6.3.18, printed p. 143. Equivalence of LF continuity and continuity of all twisted-invariant spaces.

<a id="vectorbundlesandisocrystals-vb2-ampleness-two-affine-cover-cohomological-dimension"></a>

### Two affine charts and cohomological dimension one

`VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension` · theorem · implementation `unchecked`.

In the relative KL setting choose a fixed analytic coefficient field L and two homogeneous sections f_1,f_2 of the same positive degree whose images generate the unit ideal in the tilted Robba ring. Their D_+(f_i) cover Proj(P_R), each is affine and their intersection is affine. Every quasi-coherent sheaf G has H^i=0 for i>1; Čech cohomology on this two-open cover computes H⁰ and H¹. The degree-one normalization is the one used by KL 8.8.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [`VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`](#vectorbundlesandisocrystals-vb2-ampleness-global-proj-map-and-twists); `SchemeAndStackFoundations:SF.0`; `DiamondsAndVStacks:D0/cech-to-derived-comparison`; [`VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`](#vectorbundlesandisocrystals-vb1-tilted-robba-ring).

Proof / construction outline:

1. Produce the two scalar coefficient sections and their unit ideal relation; homogeneous saturation proves the Proj cover.
2. Use the affine intersection D_+(f_1f_2) and affine quasi-coherent acyclicity to compute the Čech complex.

Suggested declaration: `curveCohomologicalDimension`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Acceptance checks:

- Both charts are needed; global sections on only D_+(f_1) do not generate on its complement.

Downstream uses:



Sources:

- [KL15](#source-kl15), Remark 8.7.6 and Theorem 8.7.7, printed p. 178. Two homogeneous affine charts and quasi-coherent cohomology.

<a id="vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness"></a>

### Tensor global ampleness and rational-local ampleness

`VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness` · definition · implementation `unchecked`.

For a finite locally free F on X_S^alg, GloballyAmple(F) means: for every finite-type quasi-coherent G, there exists N(G) such that F^{⊗n}⊗G is globally generated by finitely many sections for all n≥N(G). Ample(F) means this on a strong rational covering of the perfectoid base. This is KL’s tensor-power bundle notion, not an unproved equivalence with projective-bundle ampleness or with pointwise positive slopes.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`](#vectorbundlesandisocrystals-vb1-finite-locally-free-bundles); [`VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`](#vectorbundlesandisocrystals-vb2-ampleness-global-proj-map-and-twists); `SchemeAndStackFoundations:SF.0`; [`VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`](#vectorbundlesandisocrystals-vb2-ampleness-two-affine-cover-cohomological-dimension).

Proof / construction outline:

1. Import quasi-coherent finite-type and global-generation predicates from SF0.
2. Define tensor powers using the bundle tensor unit at n=0; cover independence follows by refinement of strong rational covers.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Planning API:

- `BundleGloballyAmple` (characterisation): ∀ finite-type G, eventually every F^{⊗n}⊗G is finitely globally generated.
- `BundleAmple` (characterisation): Global ampleness after a strong rational cover of S.
- `BundleGloballyAmple.iso` (compatibility): The predicates are invariant under bundle isomorphism.
- `BundleGloballyAmple.tensorPower` (relation): Positive powers preserve and detect the predicate.
- `BundleAmple.refine` (functoriality): A refinement of the witnessing strong rational cover is also a witness.

Unit tests:

- `bundleAmple_positive_line` (computation): O(1) is globally ample.
- `bundleAmple_unit_fails` (non-example): O is not globally ample: tensor with O(−1) has no global sections on the geometric curve.
- `bundleAmple_zero` (degenerate): Under the tensor-power definition the zero bundle is globally ample: for n≥1 its tensor power times every G is zero, generated by the empty finite family. No positive-rank hypothesis is added.
- `bundleAmple_threshold` (characterisation): For O(1) tested against O(−m), a generation bound grows with m; a common threshold for all m is not required.

Acceptance checks:

- The threshold may depend on G; replacing it by a threshold independent of all G is incorrect.
- The zero bundle satisfies this tensor-power definition; standard projective-bundle conventions must not be imported silently.

Downstream uses:

- KL15 8.8.3–9: Power criterion, cohomological characterization and affine nonvanishing loci.

Sources:

- [KL15](#source-kl15), Definition 8.8.2, printed p. 180. Quantifier order and the rational-local version.

<a id="vectorbundlesandisocrystals-vb2-ampleness-ampleness-power-criterion"></a>

### Power criterion for tensor global ampleness

`VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion` · theorem · implementation `unchecked`.

For every positive integer m, F is globally ample iff F^{⊗m} is globally ample, with the same statement for rational-local ampleness. The test sheaf remains every finite-type quasi-coherent G.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness).

Proof / construction outline:

1. For the forward implication take the subsequence of exponents divisible by m.
2. For the converse apply global ampleness of F^{⊗m} to the finitely many sheaves F^{⊗i}⊗G, 0≤i<m, and take the maximum threshold.

Suggested declaration: `amplenessPowerCriterion`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Acceptance checks:

- For O(2) the criterion recovers ampleness of O(1); m=0 is excluded.

Downstream uses:



Sources:

- [KL15](#source-kl15), Lemma 8.8.3, printed p. 180. Ampleness tested on one positive tensor power.

<a id="vectorbundlesandisocrystals-vb2-ampleness-positive-lines-and-finite-type-presentations"></a>

### Positive line ampleness and finite-type presentations

`VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations` · theorem · implementation `unchecked`.

For every integer e>0, O_alg(e) is globally ample. Every finite-type quasi-coherent G on X_S^alg is a quotient of a finite sum of integer twists O_alg(e_i). On each of the two affine charts take finitely many local generators and multiply by sufficiently high powers of its homogeneous section to extend them globally; use both charts and a common maximum exponent.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [`VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`](#vectorbundlesandisocrystals-vb2-ampleness-two-affine-cover-cohomological-dimension); [`VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`](#vectorbundlesandisocrystals-vb2-ampleness-global-proj-map-and-twists); [`VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness); `SchemeAndStackFoundations:SF.0`; [`VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion`](#vectorbundlesandisocrystals-vb2-ampleness-ampleness-power-criterion).

Proof / construction outline:

1. Import extension of local sections after clearing homogeneous denominators on a quasi-compact scheme.
2. Do it for both D_+(f_1) and D_+(f_2); extend every generator with a common exponent.
3. The resulting finite family generates G(n); take a surjection from the corresponding negative twists and use Pow for e>0.

Suggested declaration: `positiveLineAmple`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Acceptance checks:

- Do not infer generation on all X from sections generating only on the first affine chart.

Downstream uses:



Sources:

- [KL15](#source-kl15), Lemma 8.8.4 (statement p. 180, proof p. 181) and Corollary 8.8.5, p. 181. Positive lines and finite-type twist presentations, with confirmed E73 correction.

<a id="vectorbundlesandisocrystals-vb2-ampleness-cohomological-ampleness-criterion"></a>

### Cohomological criterion for tensor global ampleness

`VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion` · theorem · implementation `unchecked`.

For a bundle F on X_S^alg the following are equivalent: (a) F is globally ample; (b) for every finite-type quasi-coherent G, H¹(F^{⊗n}⊗G)=0 for all sufficiently large n; (c) for every e∈Z, H¹(F^{⊗n}(e))=0 for all sufficiently large n. Thresholds may depend on G or e. The implication (c)⇒(a) must produce one positive power independently of e, then apply the power criterion.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness); [`VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion`](#vectorbundlesandisocrystals-vb2-ampleness-ampleness-power-criterion); [`VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations`](#vectorbundlesandisocrystals-vb2-ampleness-positive-lines-and-finite-type-presentations); [`VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`](#vectorbundlesandisocrystals-vb2-ampleness-two-affine-cover-cohomological-dimension); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`](#vectorbundlesandisocrystals-vb2-ampleness-gaga-equivalence).

Proof / construction outline:

1. From a finite-type twist presentation, global generation and dimension-one Čech cohomology reduce (a)⇒(b) to positive-line H¹ vanishing imported from Tw/GAGA, not from ampleness itself.
2. Clearly (b)⇒(c). For (c)⇒(a) first choose n_0 at e=0; for each e choose n divisible by n_0 with the required H¹ vanishing.
3. Use the divisor exact sequence to generate F^{⊗jn}(e), tensor with generated F^{⊗kn_0}, and express every large multiple of n_0 as jn+kn_0. This proves one fixed power globally ample for all twists; apply PL and Pow.

Suggested declaration: `cohomologicalAmplenessCriterion`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Acceptance checks:

- The exponent defining the ample power cannot depend on e.
- At F=O, condition (c) fails for e=−1 on the geometric curve.

Downstream uses:



Sources:

- [KL15](#source-kl15), Proposition 8.8.6 and proof, pp. 181–182. Corrected cohomological criterion, using E74 and E75.

<a id="vectorbundlesandisocrystals-vb2-ampleness-globally-etale-positive-ampleness"></a>

### Positive twists of globally étale bundles

`VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness` · theorem · implementation `unchecked`.

In the KL coefficient setting, if F corresponds to a Robba Frobenius module with a global finite locally free étale integral model, then for every integer n>0, H¹(F(n))=0 and F(n) is globally ample. The global model hypothesis is stronger than pointwise purity. General-E specialization requires the normalized RF0 comparison; no converse to this theorem is asserted.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`](#vectorbundlesandisocrystals-vb1-robba-frobenius-modules); [`VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`](#vectorbundlesandisocrystals-vb1-robba-bundle-equivalence); [`VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion`](#vectorbundlesandisocrystals-vb2-ampleness-cohomological-ampleness-criterion); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`](#vectorbundlesandisocrystals-vb2-ampleness-gaga-equivalence).

Proof / construction outline:

1. Apply the Frobenius difference-equation estimate with the integral model to obtain H¹(F(n))=0 for n>0.
2. Tensor powers of the model remain integral; for each e, sufficiently many positive twists give the vanishing required by AC.

Suggested declaration: `globallyEtalePositiveAmple`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Acceptance checks:

- The untwisted unit F=O has a global étale model but fails global ampleness; n>0 is essential.

Downstream uses:



Sources:

- [KL15](#source-kl15), Corollary 8.8.7, p. 182. Positive twist vanishing and ampleness from integral global model.

<a id="vectorbundlesandisocrystals-vb2-ampleness-ample-section-affineness"></a>

### Affine nonvanishing loci of ample line sections

`VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness` · theorem · implementation `unchecked`.

If L is a globally ample line bundle on X_S^alg and s∈Γ(L), the open nonvanishing locus D(s) is affine, including the empty case. Its coordinate ring is the degree-zero localization of ⊕_{n≥0}Γ(L^{⊗n}) at s. This yields intrinsic Proj reconstruction and the canonical independence comparison for ample choices.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness); [`VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion`](#vectorbundlesandisocrystals-vb2-ampleness-cohomological-ampleness-criterion); [`VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`](#vectorbundlesandisocrystals-vb2-ampleness-two-affine-cover-cohomological-dimension); `SchemeAndStackFoundations:SF.0`.

Proof / construction outline:

1. Express j_*G on D(s) through filtered twists and multiplication by s.
2. Use the cohomological ampleness criterion to show quasi-coherent higher cohomology vanishes on D(s); apply the supplier quasi-compact scheme affineness criterion.
3. Identify its global functions by homogeneous localization and glue these affine charts.

Suggested declaration: `ampleSectionAffine`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Acceptance checks:

- For s=0 the open is empty; for the standard positive homogeneous section this recovers D_+(s).

Downstream uses:



Sources:

- [KL15](#source-kl15), Lemma 8.8.8 and Corollary 8.8.9, p. 182. Affineness and intrinsic Proj realization.

<a id="vectorbundlesandisocrystals-vb2-ampleness-independence-of-positive-twist"></a>

### Independence of the ample line bundle

`VectorBundlesAndIsocrystals:VB2:ampleness/independence-of-positive-twist` · comparison · implementation `unchecked`.

Two line bundles satisfying the axiomatic generation/vanishing hypotheses on the same X yield canonically isomorphic Proj schemes, with the same locally ringed map from X and the same finite locally free equivalence. The identification is functorial and obeys the cocycle law for three choices. No arbitrary choice of line bundle without these hypotheses is included.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`](#vectorbundlesandisocrystals-vb2-ampleness-gaga-equivalence); [`VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`](#vectorbundlesandisocrystals-vb2-ampleness-global-proj-map-and-twists); `SchemeAndStackFoundations:SF.0`; [`VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness`](#vectorbundlesandisocrystals-vb2-ampleness-ample-section-affineness).

Proof / construction outline:

1. Use nonvanishing loci of positive sections to reconstruct the affine open charts from their structure-sheaf functions.
2. Refine charts from the two choices jointly and compare their degree-zero localizations intrinsically.
3. Glue identity maps on these rings; uniqueness on the common basis proves functoriality and the cocycle law.

Suggested declaration: `ampleLineIndependence`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/ampleness`.

Acceptance checks:

- Replacing O(1) by O(2) gives the Veronese Proj comparison and the same α.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Remark II.2.8, p. 67. Canonical independence claim.
- [KL15](#source-kl15), 8.8.8–8.8.9, p. 182. Intrinsic reconstruction through affine nonvanishing loci of ample line bundles.

<a id="vectorbundlesandisocrystals-vb2-classification"></a>

## VB2:classification — Geometric classification

All classification statements here are at an algebraically closed geometric point unless a node explicitly says otherwise. The standard-block functor is fully faithful on a simple slope block; the full isocrystal functor gives a bijection of isomorphism classes, not an equivalence of the entire categories.

Planets: [Geometric bundle classification](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [Stable-bundle endomorphism algebra](#vectorbundlesandisocrystals-vb2-classification-bundle-endomorphism-comparison); [Geometric simple connectivity](#vectorbundlesandisocrystals-vb2-classification-finite-etale-constant-algebras).

<a id="vectorbundlesandisocrystals-vb2-classification-standard-bundle-stability"></a>

### Stability of rational standard bundles

`VectorBundlesAndIsocrystals:VB2:classification/standard-bundle-stability` · theorem · implementation `unchecked`.

For every λ=d/h in lowest terms, O_{X_C}(λ) is stable of rank h, degree d and slope λ. If a saturated subbundle F has rank r<h and degree s, then s/r≤λ by the wedge/H⁰ argument; equality would force h|r and is impossible.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`](#vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor); [`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`](#vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism); [`VectorBundlesAndIsocrystals:VB1/geometric-semistability`](#vectorbundlesandisocrystals-vb1-geometric-semistability); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`](#vectorbundlesandisocrystals-vb0-tensor-and-dual-slopes).

Proof / construction outline:

1. Tensor calculus puts ∧^r O(λ) inside a sum of blocks of slope rλ; det F=O(s) gives a nonzero map into that wedge.
2. Negative-twist H⁰ vanishing forces s≤rλ. If equality holds, coprimality forces h|r, contrary to 0<r<h.

Suggested declaration: `standardBundleStable`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/classification`.

Acceptance checks:

- O(1/2) is stable although its rank is 2; degree alone does not determine its slope.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Example II.2.11 and proof, p. 69. Wedge-power injection and denominator argument prove strict stability.

<a id="vectorbundlesandisocrystals-vb2-classification-fixed-slope-abelian-category"></a>

### Fixed-slope abelian finite-length category

`VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category` · theorem · implementation `unchecked`.

For each λ∈Q, semistable bundles of slope λ together with the zero bundle form an E-linear abelian finite-length category. Its simple objects are the stable bundles. Kernels and cokernels inside this category are saturated bundle kernels and quotients; a nonzero map between stable equal-slope objects is an isomorphism. This statement precedes classification and does not yet identify all simple objects with O(λ).

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/geometric-semistability`](#vectorbundlesandisocrystals-vb1-geometric-semistability); [`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`](#vectorbundlesandisocrystals-vb1-harder-narasimhan-filtration); [`VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`](#vectorbundlesandisocrystals-vb1-saturation-and-torsion-degree).

Proof / construction outline:

1. Use slope inequalities on kernel and saturated image to force equality in rank/degree and eliminate torsion in the cokernel.
2. Strict rank decreases bound chains of subobjects; simple means no proper same-slope subobject, equivalent to stability.

Suggested declaration: `fixedSlopeAbelian`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/classification`.

Acceptance checks:

- O⊕O has a proper slope-zero subobject; it is not simple even though semistable.

Downstream uses:



Sources:

- [FF18-courbes](#source-ff18-courbes), Theorem 5.5.4 and Proposition 5.5.6, pp. 163–164. Same-slope abelianity and finite length from HN axioms.

<a id="vectorbundlesandisocrystals-vb2-classification-hn-filtration-base-change"></a>

### Base change of the geometric HN filtration

`VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change` · lemma · implementation `unchecked`.

For an extension of complete algebraically closed perfectoid fields C⊂C′, the pullback of every threshold HN piece is the corresponding threshold piece on X_C′. For finite separable E′/E of degree n, the finite coefficient curve map f satisfies (f*V)^{≥λ}=f*(V^{≥λ/n}); ranks are preserved and degrees/slopes multiply by n. In particular f*O(1)=O(n). These are geometric-field and coefficient changes with different normalizations.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`](#vectorbundlesandisocrystals-vb1-harder-narasimhan-filtration); [`VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`](#vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology); [`VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`](#vectorbundlesandisocrystals-vb0-scalar-extension-adjunction); [`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`](#vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism); [`VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`](#vectorbundlesandisocrystals-vb2-classification-fixed-slope-abelian-category); [`VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`](#vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor).

Proof / construction outline:

1. Induct on rank and descend the candidate highest-slope subbundle through the geometric extension using VD and absence of Hom from higher to lower slopes.
2. For coefficients first use an unramified/Galois splitting cover and the explicit block pullback; apply uniqueness to the descended HN filtration and the determinant degree scaling.

Suggested declaration: `hnBaseChange`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/classification`.

Acceptance checks:

- For an unramified quadratic coefficient extension the threshold ≥1 pulls back the original threshold ≥1/2.
- Extending C alone does not rescale slopes.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.2.13 and proof, pp. 69–70. HN compatibility under geometric and coefficient extension.

<a id="vectorbundlesandisocrystals-vb2-classification-key-extension-lemma"></a>

### Nonzero sections of the key rank-one extension

`VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma` · lemma · implementation `unchecked`.

Let C be complete algebraically closed and let 0→O(−1)→V→O(1/n)→0 be a bundle extension on X_C, n≥1. After an extension C′/C of complete algebraically closed perfectoid fields, H⁰(X_C′,V)≠0. The proof applies in both mixed and equal characteristic and does not require a prior claim that the negative Banach–Colmez quotient is nonperfectoid in equal characteristic.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); [`VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`](#vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence); `AdicEtaleGeometry:A1`.

Proof / construction outline:

1. Assuming no section after any extension makes the connecting map from positive H⁰ into H¹(O(−1)) injective. Use the basic BC connectedness and negative presentation A¹/E supplied by Tw and the BC owner.
2. The image contains a nonclassical point and hence is open after extension; π-contraction forces surjectivity.
3. Compose the quotient map A¹→A¹/E, the assumed inverse, and a nonzero untilt evaluation to obtain a nonzero E-linear affine-line diamond endomorphism with nontrivial kernel. In mixed characteristic use analytic maps A¹→A¹; in equal characteristic use maps of the perfected analytic affine line, whose convergent additive series may initially have fractional p-power exponents. In both cases g(πX)=πg(X) kills every exponent except 1, so g(X)=aX, contradicting the kernel. G-KEY records the missing supplier comparison and open-image verification.

Suggested declaration: `keyExtensionSection`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/classification`.

Acceptance checks:

- At n=1 this gives the section required by the rank-two induction, with the same equal-characteristic proof route.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Lemma II.2.15 and proof, pp. 71–72. Key extension argument and E-linear affine-line contradiction.

<a id="vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles"></a>

### Geometric classification of vector bundles

`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles` · theorem · implementation `unchecked`.

For complete algebraically closed perfectoid C/F_q, every bundle on X_C is a finite direct sum of O(λ), uniquely up to permutation of reduced rational slopes and multiplicities. The HN filtration splits, and every semistable slope-λ bundle is O(λ)^{⊕m}. After choosing the embedding k=bar F_q→C, the finite-isocrystal functor induces a bijection on isomorphism classes in this geometric setting, but is not fully faithful on all morphisms and is not asserted to classify relative bundles on arbitrary S.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`](#vectorbundlesandisocrystals-vb0-dieudonne-manin-isocrystals); [`VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`](#vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor); [`VectorBundlesAndIsocrystals:VB2:classification/standard-bundle-stability`](#vectorbundlesandisocrystals-vb2-classification-standard-bundle-stability); [`VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`](#vectorbundlesandisocrystals-vb2-classification-fixed-slope-abelian-category); [`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`](#vectorbundlesandisocrystals-vb1-harder-narasimhan-filtration); [`VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change`](#vectorbundlesandisocrystals-vb2-classification-hn-filtration-base-change); [`VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`](#vectorbundlesandisocrystals-vb2-classification-key-extension-lemma); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`](#vectorbundlesandisocrystals-vb0-scalar-extension-adjunction); `DiamondsAndVStacks:D3/locally-profinite-torsors`; [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation).

Proof / construction outline:

1. If V is not semistable, induct on rank and split its HN extensions using positive-slope H¹ vanishing.
2. Reduce fixed slope to zero by finite unramified coefficient pullback and Adj, and use the fixed-slope abelian finite-length category.
3. To justify replacing C by an extension, argue conditionally: if V becomes trivial there, then Isom(O^rank(V),V) is a v-locally trivial GL_rank(V)(E)-torsor by H⁰(O)=E and VD; D3 makes this a pro-étale torsor over the algebraically closed point, hence trivial. This does not assume V is already v-locally trivial. Now use GG to choose minimal d with O(−d) injecting into a slope-zero V; apply the rank induction and the key extension lemma after allowed extensions to rule out d≥2 and handle d=1, thereby proving triviality.
4. Uniqueness follows from stable slopes and rank multiplicities. For lack of full faithfulness, Hom_Φ(D(0,1),D(−1,1))=0 while Hom(O,O(1))=H⁰(O(1))≠0.

Suggested declaration: `geometricBundleClassification`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/classification`.

Acceptance checks:

- O(1)⊕O(−1) has the two displayed summands; slope-zero rank m is O^{⊕m}.
- The explicit O→O(1) example detects a false full-faithfulness assertion.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Theorem II.2.14 and proof, pp. 70–72. Geometric splitting classification.
- [FF18-courbes](#source-ff18-courbes), Theorem 8.2.10, p. 238. Isocrystal/bundle classification statement.

<a id="vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus"></a>

### Hom and extension calculus for geometric bundles

`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus` · theorem · implementation `unchecked`.

For geometric standard bundles on X_C^alg, compute Ext in the abelian category of structure-sheaf modules (equivalently QCoh for these finite locally free inputs), with Ext¹ also classifying bundle extensions. Hom(O(λ),O(μ))=H⁰(O(λ)∨⊗O(μ)) vanishes for λ>μ, and Ext¹(O(λ),O(μ))=H¹(O(λ)∨⊗O(μ)) vanishes for λ≤μ. The tensor decomposes into h_λh_μ/h_{μ−λ} copies of O(μ−λ). Ext^i between these bundles vanishes for i>1. Equal-slope End(O(λ)) need not be E when its denominator exceeds one.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`](#vectorbundlesandisocrystals-vb0-tensor-and-dual-slopes); [`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); `SchemeAndStackFoundations:SF.0`; [`VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`](#vectorbundlesandisocrystals-vb2-ampleness-gaga-equivalence); [`VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`](#vectorbundlesandisocrystals-vb2-ampleness-two-affine-cover-cohomological-dimension).

Proof / construction outline:

1. SF.0 supplies Hom/Ext versus cohomology for a finite locally free source in the abelian module-sheaf category. Use GAGA for geometric analytic/schematic cohomology comparison and the two-affine-cover theorem for schematic higher cohomology vanishing. Then apply exact tensor Frobenius calculus.
2. Apply positive, zero and negative twist cases with μ−λ; preserve the ordering of source and target.

Suggested declaration: `bundleHomExt`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/classification`.

Acceptance checks:

- Hom(O(1),O)=0 but Hom(O,O(1))≠0. Ext¹(O(−1),O(1))=0, while the reverse direction can have nontrivial extensions.

Downstream uses:



Sources:

- [FF18-courbes](#source-ff18-courbes), Proposition 5.6.23(4)–(5), printed p. 181 (proof continues p. 182). Exact orientation of Hom/Ext vanishing and tensor normalization.

<a id="vectorbundlesandisocrystals-vb2-classification-bundle-endomorphism-comparison"></a>

### Stable-bundle division endomorphism comparison

`VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison` · theorem · implementation `unchecked`.

The natural E-algebra map End_Φ(D(−d,h))→End_{X_C}(O(d/h)) is an isomorphism for each reduced rational slope. Both identify with D_{d/h}, of dimension h² and invariant d/h mod Z. This full endomorphism comparison on one simple block coexists with the failure of full faithfulness between different slopes.

Prerequisites: [`VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`](#vectorbundlesandisocrystals-vb0-endomorphism-division-algebra); [`VectorBundlesAndIsocrystals:VB0/slope-division-algebra`](#vectorbundlesandisocrystals-vb0-slope-division-algebra); [`VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`](#vectorbundlesandisocrystals-vb0-brauer-invariant-sign); [`VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`](#vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor); [`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`](#vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus).

Proof / construction outline:

1. The functor injects intertwining matrices into bundle endomorphisms.
2. Pull to the unramified denominator cover, compute invariants after tensor decomposition using HE and H⁰(O)=E, and obtain dimension h².
3. Compare with the cyclic-algebra basis; the injective map between equal finite dimensions is an algebra isomorphism.

Suggested declaration: `stableBundleEnd`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/classification`.

Acceptance checks:

- End(O(1/2)) has E-dimension 4; it is not a matrix algebra over E and not just E.

Downstream uses:



Sources:

- [FF18-courbes](#source-ff18-courbes), Proposition 8.2.8 and proof, pp. 237–238. Injectivity and dimension count for the block endomorphism map.

<a id="vectorbundlesandisocrystals-vb2-classification-coherent-sheaf-classification"></a>

### Coherent sheaves on the geometric curve

`VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification` · theorem · implementation `unchecked`.

Every coherent sheaf F on X_C^alg is, noncanonically, a direct sum T⊕V with T its torsion subsheaf and V a finite sum of O(λ). T has finite support at closed untilt points and each local piece is a finite sum of O_x/(t_x^{n_j}), n_j>0. The torsion-free quotient is locally free because the curve is regular and one-dimensional; the split is not claimed canonical. This specializes CN Theorem 3.9(iii) at E=Q_p and applies to the general-E geometric curve using its DVR charts.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`](#vectorbundlesandisocrystals-vb2-ampleness-schematic-curve-at-a-geometric-point); [`VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison`](#vectorbundlesandisocrystals-vb1-completed-local-ring-comparison); [`VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`](#vectorbundlesandisocrystals-vb1-saturation-and-torsion-degree); [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`](#vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus); `SchemeAndStackFoundations:SF.0`.

Proof / construction outline:

1. Take the canonical finite-support torsion subsheaf; the finite torsion-free quotient is locally free on each DVR chart.
2. The extension splits because Ext¹(V,T)=H¹(V∨⊗T)=0 for finite-support sheaves, using affine support and Čech acyclicity.
3. Use the elementary-divisor classification of finite-length modules over a DVR and Cl for V.

Suggested declaration: `geometricCoherentClassification`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/classification`.

Acceptance checks:

- O_x/(t_x²) is torsion of degree 2 and rank 0; it is not a rank-one bundle.
- Only the torsion subobject and quotient are canonical, not a chosen splitting.

Downstream uses:



Sources:

- [CN25-VB0](#source-cn25-vb0), §3.2.3, Theorem 3.9(iii), pp. 14–15. Torsion plus stable-bundle classification on the Q_p curve.

<a id="vectorbundlesandisocrystals-vb2-classification-finite-etale-constant-algebras"></a>

### Geometric simple connectivity via finite étale algebras

`VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras` · theorem · implementation `unchecked`.

For complete algebraically closed perfectoid C, every finite étale O_{X_C}-algebra B is canonically O_{X_C}⊗_E A with A=H⁰(X_C,B) a finite étale E-algebra. Thus finite étale covers of X_C are exactly coefficient-field covers; after base change to an algebraic closure of E they split. The statement is not that X_C has no nontrivial covers over nonalgebraically closed E. Export this theorem to VStackSheavesAndLisseCategories:VS1 for its divisor and Weil-map construction.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`](#vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus); [`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`](#vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism); [`VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`](#vectorbundlesandisocrystals-vb2-ampleness-gaga-equivalence); `SchemeAndStackFoundations:SF.0`; `AdicSpacesPartII:R3/etale-iff-trace-pairing-perfect`.

Proof / construction outline:

1. The perfect trace pairing B≅B∨ forces degree zero.
2. A maximal positive-slope summand would have sufficiently high products mapping into slopes above every summand, hence be nilpotent by Hom vanishing; finite étale algebras are reduced, giving a contradiction. Self-duality excludes negative slopes as well.
3. Cl makes B a trivial bundle. Its algebra maps are constant since H⁰(O)=E, so B=O⊗A. The perfect trace pairing makes A finite étale; inverse scalar extension proves the category equivalence.

Suggested declaration: `finiteEtaleConstantAlgebras`.

Proposed library: `TauCeti.FFCurve` in `TauCeti/Geometry/FarguesFontaine/classification`.

Acceptance checks:

- A finite separable E′/E gives the nontrivial coefficient cover O⊗E′ and is not excluded.
- Over bar E every finite étale coefficient algebra is a finite product of bar E.

Downstream uses:



Sources:

- [FF18-courbes](#source-ff18-courbes), Theorem 8.6.1 and proof, pp. 248–249. Geometric simple connectivity after coefficient algebraic closure.
- [SW20](#source-sw20), Theorem 13.5.7 and proof, pp. 114–115. Trace-pairing/classification argument identifies the coefficient algebra.

<a id="vectorbundlesandisocrystals-vb3"></a>

## VB3 — Banach–Colmez spaces

VB3 is the aggregate of the three substages below. Positive/basic calculations precede VB1 twist cohomology; ordinary projectivized properness precedes VB4; general two-term geometry follows relative HN and positive resolutions. Classical sympathetic spaces and the tilted heart are a further fixed-untilt comparison.

<a id="vectorbundlesandisocrystals-vb3-positive-basic-examples"></a>

## VB3:positive-basic-examples — Positive and basic Banach–Colmez calculations

Define section and derived hypercohomology objects before proving their geometric properties. The Lubin–Tate normalization and crystalline Hom comparison are explicit imports; the canonical fundamental section requires an untilt over E∞.

Planets: [Banach–Colmez spaces](#vectorbundlesandisocrystals-vb3-positive-basic-examples-banach-colmez-space-definition); [Lubin–Tate universal cover](#vectorbundlesandisocrystals-vb3-positive-basic-examples-lubin-tate-universal-cover); [Fundamental exact sequence](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence).

<a id="vectorbundlesandisocrystals-vb3-positive-basic-examples-banach-colmez-space-definition"></a>

### Banach–Colmez section and hypercohomology sheaves

`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition` · definition · implementation `unchecked`.

For a perfectoid S/F_q and a bundle E on X_S, BC(E)(T)=H⁰(X_T,E_T). If E has only negative geometric slopes, BCneg(E)(T)=H¹(X_T,E_T). For a complex [E₁→E₀] in COHOMOLOGICAL degrees −1,0 with H⁰(X_T,E₁,T)=0 for EVERY T/S, BCcomplex(T)=H⁰ RΓ(X_T,[E₁→E₀]_T), the degree-zero hypercohomology v-sheaf. No representability is assumed. FS calls these homological degrees [0,1].

Hypotheses:

- S belongs to Perf_Fq; coefficients are the fixed local field E with uniformizer π.
- Derived v-descent is imported from the companion; the universal H⁰ vanishing prevents negative cohomology of the section complex.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`](#vectorbundlesandisocrystals-vb1-finite-locally-free-bundles); [`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); [`VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`](#vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology); `mathlib:CategoryTheory.Sheaf`; `mathlib:CategoryTheory.ShortComplex.homology`.

Proof / construction outline:

1. Apply companion derived v-descent to RΓ, then take degree-zero cohomology using the universal negative-degree vanishing.
2. Recover H⁰(E₀) when E₁=0 and H¹(E₁) when E₀=0; use cohomological shifts.
3. Local spatiality and partial properness remain the conclusions of separate nodes.

Suggested declaration: `BC`.

Planning API:

- `BC` (data): The v-sheaf T↦H⁰(X_T,E_T).
- `BCneg` (data): For universally negative slopes, T↦H¹(X_T,E_T).
- `BCcomplex` (data): Degree-zero hypercohomology of [E₁→E₀] in degrees −1,0, with universal H⁰(E₁) vanishing.
- `BC.module` (instance): BC(E), BCneg(E) and BCcomplex are sheaves of E-modules on Perf_S, E acting through O_{X_T}, and BC.map is E-linear. This scalar action is the one BCProjectivization divides out.
- `BC.map` (functoriality): A bundle or complex map induces the corresponding E-linear map of v-sheaves; identity and composition are preserved.
- `BC.exactSequence` (relation): A short exact sequence 0→E′→E→E″→0 of bundles gives an exact sequence of E-module v-sheaves 0→BC(E′)→BC(E)→BC(E″)→H¹(E′)→H¹(E)→H¹(E″)→0 (Prop. II.2.1 and the two-term complex); for [E₁→E₀] with E₁ universally negative it gives 0→BC(E₀)→BCcomplex→BCneg(E₁)→H¹(E₀).
- `BC.baseChange` (compatibility): For U→S, restriction of BCcomplex on Perf_U is BCcomplex of the pulled-back complex.
- `BC.directSum` (compatibility): BCcomplex(K⊕L)≅BCcomplex(K)⊕BCcomplex(L) in the abelian category of E-module v-sheaves.

Unit tests:

- `BCtest.zero` (degenerate): The zero complex has zero BC v-sheaf.
- `BCtest.single` (compatibility): BCcomplex([0→E])=BC(E) and BCcomplex([E→0])=BCneg(E) when E is negative.
- `BCtest.constantSections` (computation): For S the disjoint union of two geometric points, BC(O)(S)=E², not E; BC(O) is the constant SHEAF underline E.
- `BCtest.hypercohomology` (non-example): For [O(−1)→0] over a geometric point, BCcomplex=H¹(O(−1))≠0 although the cokernel of the map of H⁰ groups is zero.

Acceptance checks:

- Check the degrees −1,0 against both degenerate complexes.
- Check restriction to a disconnected base; evaluate the constant sheaf rather than the constant presheaf.

Downstream uses:

- VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC: the properness theorem is about this functor and its projectivization
- VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces: the two-term form is what that theorem is stated for
- VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence: the identification (BC(O(1)) minus 0)/E^times = Div^1 is a statement about this object
- VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations: presentations of bundles give exact sequences of BC spaces (FS II.3.5 proof, II.3.4)

Sources:

- [FS-geometrization](#source-fs-geometrization), Definition I.3.5, p. 19; two-term definition after II.2.1, p. 58. Exact source contract, with the conventions and corrections stated in this node.
- [FS-geometrization](#source-fs-geometrization), Two-term definition after Proposition II.2.1, p. 58. The original homological [0,1] convention translates to cohomological −1,0.

<a id="vectorbundlesandisocrystals-vb3-positive-basic-examples-lubin-tate-universal-cover"></a>

### FS II.2.2: H^0(X_S,O(1)) is the universal cover of the Lubin-Tate formal group

`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover` · theorem · implementation `unchecked`.

Let S = Spa(R,R^+) be affinoid perfectoid over F_q with untilt S^sharp over E, and let O_{X_S}(1) correspond to the isocrystal (E, pi^{-1}). Then X -> sum over i in Z of pi^i [X^{q^{-i}}] defines a natural isomorphism G-tilde(R^{sharp+}) = R^{circ circ} -> H^0(X_S, O(1)) = H^0(Y_S, O_{Y_S})^{phi = pi}, and the evaluation map H^0(X_S,O(1)) -> R^sharp at S^sharp is the logarithm map log_G : G-tilde(R^{sharp+}) -> G(R^{sharp+}) -> R^sharp.

Hypotheses:

- G = G_LT is the Lubin-Tate formal O_E-module over O_E-breve, normalized by M = W_{O_E}(k) with F = sigma/pi in Dieudonne theory (with the SW20 renormalisation dividing F by p and base changing along W(k) tensor_{Z_p} O_E -> W_{O_E}(k)); under this normalisation G is already defined over O_E
- G-tilde = inverse limit of G along multiplication by pi, isomorphic to Spf O_E[[X-tilde^{1/p^infty}]]; for pi-adically complete A one has G-tilde(A) = G-tilde(A/pi) = Hom_{O_E}(E/O_E, G(A/pi))[1/pi] = the topologically nilpotent elements of A^flat
- The equal-characteristic case is a direct power-series computation with the condition r_i = r_{i+1}^q
- In the p-adic case the proof replaces B_{R,[1,infty]} by the crystalline period ring B^+_crys of R^{sharp+}/pi and cites [SW13, Theorem A]. What [SW13, Theorem A] actually states, read in the source, is: for R f-semiperfect the Dieudonne module functor on p-divisible groups UP TO ISOGENY is fully faithful, and if R = S/J with S perfect and J regular then it is fully faithful on p-divisible groups themselves. Here f-semiperfect means Frobenius is surjective and lim_Phi R has a finitely generated ideal of definition; O_C/p is the motivating example. The deduction of the displayed identity B^{phi=pi}_{R,[1,infty]} = Hom_{O_E}(E/O_E, G(R^{sharp+}/pi))[1/pi] from that full-faithfulness statement is NOT written out in Fargues-Scholze.
- The explicit-formula compatibility is [SW13, Lemma 3.5.1], read: the map G-tilde(R) -> M(G)(S)[1/p] coming from Dieudonne theory agrees with q log, proved by functoriality reduction to G = Q_p/Z_p.
- The perfectoid-ball shape of the universal cover is [SW13, Proposition 3.1.3(iii)], read: if R is perfect of characteristic p, G connected and Lie G free of dimension d, then G-tilde = Spf R[[X_1^{1/p^infty}, ..., X_d^{1/p^infty}]].

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-banach-colmez-space-definition); [`VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`](#vectorbundlesandisocrystals-vb1-annular-frobenius-descent); [`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); [`VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`](#vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology); `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`.

Proof / construction outline:

1. Equal characteristic: H^0(Y_S,O) is a space of Laurent series sum r_i pi^i with convergence conditions; phi = pi forces r_i = r_{i+1}^q, so everything is determined by r_0, which may be any topologically nilpotent element of R.
2. Mixed characteristic: rewrite H^0(X_S,O(1)) as B_{R,[1,infty]}^{phi = pi}; by the contracting property of Frobenius replace B_{R,[1,infty]} by B^+_crys of R^{sharp+}/pi and apply [SW13, Theorem A] to identify it with Hom_{O_E}(E/O_E, G(R^{sharp+}/pi))[1/pi] = G-tilde(R^{sharp+}). The π-divisible normalization and precise crystalline Hom comparison are supplier obligations G-LT; full faithfulness alone is not asserted to be essential surjectivity.
3. The agreement with the explicit series is [SW13, Lemma 3.5.1]; compatibility with the logarithm is immediate from the formulas.

Suggested declaration: `LubinTateUniversalCover`.

Acceptance checks:

- Verify the series sum pi^i [X^{q^{-i}}] converges and is phi = pi in an explicit chart
- Verify the logarithm formula log_G(X) = X + X^q/pi + ... + X^{q^n}/pi^n + ... and its convergence as a map of rigid spaces
- Verify G-tilde(A) = A^{flat,circ circ} on a concrete A

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.2.2, p. 60. Exact source contract, with the conventions and corrections stated in this node.
- [SW13-moduli](#source-sw13-moduli), Theorem A, p. 3. Full faithfulness; the compressed explicit Hom comparison remains G-LT.
- [SW13-moduli](#source-sw13-moduli), Proposition 3.1.3(iii), p. 22. The perfect formal universal-cover shape.
- [SW13-moduli](#source-sw13-moduli), Lemma 3.5.1, p. 29. Agreement with the logarithm construction.

<a id="vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence"></a>

### FS II.2.3 and II.2.4: the fundamental exact sequence and (BC(O(1)) minus 0)/E^times = Div^1

`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence` · theorem · implementation `unchecked`.

For any perfectoid S with untilt S^sharp over E_infty, the above construction gives an exact sequence 0 -> O_{X_S} -> O_{X_S}(1) -> O_{S^sharp} -> 0 of O_{X_S}-modules. Consequently there is a well-defined map BC(O(1)) minus {0} -> Div^1 sending a nonzero section f to V(f), and it descends to an isomorphism (BC(O(1)) minus {0})/E^times = Div^1. The scalar E×-torsor is the Lubin–Tate Tate-module torsor; its comparison with the divisor-to-Weil-group map imports VS1 and arithmetic local reciprocity, rather than reproving class field theory.

Hypotheses:

- For II.2.3 the untilt S^sharp must be over E_infty (the completion of the union of the Lubin-Tate level fields E_n), not merely over E; this is what supplies the canonical nonzero section
- The check that the map O_{X_S} -> I(1) is an isomorphism is done on geometric points
- The vanishing locus computation identifies the zeroes of the logarithm on G-tilde^ad_E minus {0} with the disjoint union over n of Spa E_n, each a simple zero
- Corollary II.2.4 uses BC(O(1)) = Spd F_q[[X^{1/p^infty}]], so BC(O(1)) minus {0} = Spa F_q((X^{1/p^infty})) = Spd E_infty, and the map to Div^1 is Spd E_infty -> Spd E -> Spd E/phi^Z, a quotient first by O_E^times and then by pi^Z

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-lubin-tate-universal-cover); [`VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`](#vectorbundlesandisocrystals-vb1-finite-locally-free-bundles); `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`; `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`; `VStackSheavesAndLisseCategories:VS1`.

Proof / construction outline:

1. The Lubin-Tate section gives a map O_{X_S} -> I(1) where I is the ideal sheaf of S^sharp, a line bundle by Prop. II.1.18.
2. To see it is an isomorphism, check on geometric points S = Spa C; the section is f = sum pi^i [X-tilde^{q^{-i}}], the base change of the function sum pi^i X-tilde^{q^{-i}} on (Spa O_E[[X-tilde^{1/p^infty}]])_E minus V(X-tilde).
3. Under G-tilde = Spf O_E[[X-tilde^{1/p^infty}]] this function is the logarithm; its vanishing locus is exactly the disjoint union of the Spa E_n inside G-tilde^ad_E minus {0}, with a simple zero at each. This gives the exact sequence.
4. For II.2.4: identify BC(O(1)) minus {0} with Spd E_infty; the resulting E^times-quotient is exactly Div^1 = Spd E/phi^Z, and the induced map from the absolute Galois group of E to the profinite completion of E^times is the Artin reciprocity map.

Suggested declaration: `FundamentalExactSequence`.

Acceptance checks:

- Verify the simple-zero claim for the logarithm at each level E_n
- Verify that O_{X_S}([S^sharp]) = O_{X_S}(1), which is what makes deg O(1) = 1
- Verify the Artin reciprocity identification against local class field theory

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Propositions II.2.3–II.2.4, pp. 60–61. Exact source contract, with the conventions and corrections stated in this node.

<a id="vectorbundlesandisocrystals-vb3-projectivized-properness"></a>

## VB3:projectivized-properness — Scalar projectivization and properness

Projectivization is a sheaf quotient. Its properness proof uses positive-twist generation and cohomology, followed by the contracting action criterion; it does not use bundle classification. Quantitative chartwise contraction is a separate proof boundary.

Planets: [Contracting action lemma](#vectorbundlesandisocrystals-vb3-projectivized-properness-contracting-action-lemma); [Scalar projectivization](#vectorbundlesandisocrystals-vb3-projectivized-properness-scalar-projectivization); [Projectivized Banach–Colmez properness](#vectorbundlesandisocrystals-vb3-projectivized-properness-properness-of-projectivized-bc).

<a id="vectorbundlesandisocrystals-vb3-projectivized-properness-contracting-action-lemma"></a>

### FS II.2.17: quotients by contracting automorphisms of taut locally spectral spaces

`VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma` · theorem · implementation `unchecked`.

Let X be a taut locally spectral space such that for every x the set X_x of generalizations of x is a totally ordered chain under specialization. Let gamma be an automorphism of X whose fixed-point set X_0 is a spectral space, such that (i) for all x, gamma^n(x) converges to X_0 as n -> +infinity, and (ii) for all x outside X_0, gamma^n(x) leaves every quasicompact open as n -> -infinity. Then X_0 is closed, gamma acts freely and totally discontinuously on X minus X_0, and (X minus X_0)/gamma^Z is a spectral space.

Hypotheses:

- X taut locally spectral; generalization sets totally ordered chains (automatic for locally spatial diamonds by ECD Prop. 11.19, and tautness holds if X is partially proper over a spatial diamond by ECD Prop. 18.10)
- X_0 must be a spectral space, and both convergence conditions (i) and (ii) are needed
- Total discontinuity is in the strong sense: the action map (X minus X_0) x Z -> (X minus X_0) x (X minus X_0) is a closed immersion

Prerequisites: `mathlib:SpectralSpace`; `mathlib:Specializes`; `DiamondsAndVStacks:D0/locally-spectral-space`; `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`; `DiamondEtaleCohomology:C4`.

Proof / construction outline:

1. Arrange a quasicompact open neighbourhood U of X_0 with gamma(U) contained in U, by covering U with the gamma^{-n}(U) and using quasicompactness.
2. Show X_0 = intersection over n >= 0 of gamma^n(U), and that for any other quasicompact open neighbourhood V of X_0 some gamma^n(U) lies in V (the gamma^n(U) minus V form a decreasing sequence of spectral spaces with empty limit).
3. Use tautness: the closure U-bar is quasicompact and the sequences gamma^n(U) and gamma^n(U-bar) are cofinal, so X_0 is closed.
4. For freeness/discontinuity: for x outside X_0 pick V inside U minus gamma^{n+1}(U) containing x, so gamma^i(V) misses V for i >= n+1; for the finitely many remaining i use the totally ordered generalization hypothesis: X_x has a unique generic point eta, and X_x meeting gamma^i(X_x) forces gamma^i(eta) = eta, so eta in X_0, hence x in X_0 since X_0 is closed - contradiction.
5. Conclude the quotient is locally spectral, quasiseparated (intersections of admissible V's are admissible) and quasicompact (U-bar minus gamma(U) surjects continuously and bijectively onto it from a spectral space).

Suggested declaration: `ContractingActionLemma`.

Acceptance checks:

- Verify hypotheses (i),(ii) for A^1_C with multiplication by pi
- Verify that the totally ordered generalization hypothesis is genuinely used, by finding where the argument breaks without it
- Verify quasicompactness of the quotient on an explicit example

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Lemma II.2.17, pp. 72–74. Exact source contract, with the conventions and corrections stated in this node.

<a id="vectorbundlesandisocrystals-vb3-projectivized-properness-scalar-projectivization"></a>

### Scalar projectivization

`VectorBundlesAndIsocrystals:VB3:projectivized-properness/scalar-projectivization` · construction · implementation `unchecked`.

For an E-module BC v-sheaf W over S, define W× as the complement of its zero section and PBC(W)=W×/underline E×, the v-sheaf quotient of the scalar action. The quotient map is an E×-torsor on this punctured locus. Representability and properness are separate theorems. Apply to both section and two-term hypercohomology objects.

Hypotheses:

- W is an E-module v-sheaf; the zero section is closed in the locally spatial cases where complement is used.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-banach-colmez-space-definition); `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`; `DiamondsAndVStacks:D5/relative-representability`.

Proof / construction outline:

1. Use the relative complement and v-sheafification of scalar orbits, importing generic groupoid quotients.
2. Field scalar action is free away from zero; its torsor presentation specifies maps out of the quotient.
3. Perfectoid pullback commutes with this quotient.

Suggested declaration: `BCProjectivization`.

Planning API:

- `BCProjectivization` (data): The v-sheaf quotient of punctured W by scalar E×.
- `BCProjectivization.torsor` (structure): W×→PBC(W) is an underline E× torsor.
- `BCProjectivization.lift` (universal-property): An E×-invariant map W×→Z descends uniquely to PBC(W).
- `BCProjectivization.baseChange` (compatibility): Perfectoid base change commutes with scalar projectivization.

Unit tests:

- `BCProjectivizationTest.zero` (degenerate): PBC(0) is empty.
- `BCProjectivizationTest.line` (computation): PBC(underline E)=S.
- `BCProjectivizationTest.unitTwist` (compatibility): PBC(BC(O(1)))≅Div¹, with the fundamental scalar torsor.
- `BCProjectivizationTest.absolute` (non-example): Punctured BC(O(d)) is spatial while its π^Z-quotient is not quasiseparated; ordinary properness does not imply total absolute spatiality.

Acceptance checks:

- PBC(0) is empty, whereas PBC(underline E)=S.

Downstream uses:

- VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC: state scalar properness independently of classification
- VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces: state the stronger two-term quotient theorem

Sources:

- [FS-geometrization](#source-fs-geometrization), Propositions II.2.16 and II.3.5, pp. 72,80. The punctured scalar quotient used throughout the properness arguments.

<a id="vectorbundlesandisocrystals-vb3-projectivized-properness-properness-of-projectivized-bc"></a>

### FS II.2.16: BC(E) is a locally spatial diamond partially proper over S, and its projectivization is proper

`VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC` · theorem · implementation `unchecked`.

Let S be a perfectoid space over F_q and E a vector bundle on X_S. Then BC(E) : T -> H^0(X_T, E|_{X_T}) is a locally spatial diamond, partially proper over S, and (BC(E) minus {0})/E^times is a locally spatial diamond, proper over S. The proof uses only ampleness (II.2.6) and the positive-twist statement II.2.5(iii); it does not use the classification theorem.

Hypotheses:

- S may be assumed qcqs for the second part
- The presentation 0 -> E -> O_{X_S}(n)^m -> O_{X_S}(n')^{m'} is obtained by applying Thm. II.2.6 to E^dual and dualising, with n, n' > 0 - the positivity of n, n' is what lets II.2.5(iii) apply
- It suffices to treat (BC(E) minus {0})/pi^Z because the O_E^times-action is free, so ECD Proposition 11.24 (last part) applies
- The contracting-action criterion is checked by formally reducing to BC(O_{X_S}(n)^m) and then to A^1_{S^sharp} by evaluating sections at a collection of untilts

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-banach-colmez-space-definition); [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma`](#vectorbundlesandisocrystals-vb3-projectivized-properness-contracting-action-lemma); `DiamondsAndVStacks:D5/relative-representability`; `DiamondEtaleCohomology:C4`; [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/scalar-projectivization`](#vectorbundlesandisocrystals-vb3-projectivized-properness-scalar-projectivization).

Proof / construction outline:

1. Apply Thm. II.2.6 to get O_{X_S}(-n')^{m'} -> O_{X_S}(-n)^m -> E^dual with n, n' > 0; dualise to 0 -> E -> O_{X_S}(n)^m -> O_{X_S}(n')^{m'}.
2. Hence BC(E) is a closed subspace of BC(O_{X/S}(n))^m, and the first part follows from Prop. II.2.5(iii).
3. For the second part, reduce to the pi^Z-quotient and apply Lemma II.2.17 on contracting actions of an automorphism on a taut locally spectral space whose generalization sets are totally ordered chains.

Suggested declaration: `PropernessOfProjectivizedBc`.

Acceptance checks:

- Verify that the image of (BC(E) minus {0})/E^times -> S is closed, which is the use made of properness in Thm. II.2.19(i)
- Verify the hypotheses of Lemma II.2.17 for A^1_{S^sharp} with the multiplication-by-pi action
- Check the independence of the argument from Thm. II.2.14, as the stage text requires

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.2.16, p. 72. Exact source contract, with the conventions and corrections stated in this node.

<a id="vectorbundlesandisocrystals-vb3-general-bc"></a>

## VB3:general-BC — General geometric and classical Banach–Colmez theory

Relative HN from VB4 supplies the small-slope presentations. Use fibrewise semistability in every such presentation and keep punctured absolute diamond statements separate from relative representability. The classical category retains the CN field/countability hypotheses and all closed-point torsion summands, including points distinct from the chosen ∞.

Planets: [Two-term Banach–Colmez families](#vectorbundlesandisocrystals-vb3-general-bc-families-of-banach-colmez-spaces); [Curvature](#vectorbundlesandisocrystals-vb3-general-bc-curvature); [Banach–Colmez category](#vectorbundlesandisocrystals-vb3-general-bc-abstract-banach-colmez-category); [Le Bras equivalence](#vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence); [Dimension](#vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian); [Canonical curvature filtration](#vectorbundlesandisocrystals-vb3-general-bc-canonical-curvature-filtration).

<a id="vectorbundlesandisocrystals-vb3-general-bc-positive-slope-resolution"></a>

### FS II.3.1 and Cor. II.3.3: resolving a positive-slope bundle by semistable bundles of small slope

`VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution` · theorem · implementation `unchecked`.

If all geometric slopes of a bundle E are ≥1/r, r≥1, then analytically locally on S there is 0→O^m→F→E→0 with F fibrewise semistable of SLOPE 1/r. On a constant-rank n, degree d component, rank(F)=dr and m=dr−n. This extends FS II.3.1’s geometric construction via II.3.3(i). Rank-zero E is treated separately.

Hypotheses:

- r is a positive integer; standard O(1/r) has rank r and degree 1.
- Analytic-local existence is distinguished from the strict-positive étale-local presentation in the next node.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); [`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`](#vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus); [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence); [`VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon`](#vectorbundlesandisocrystals-vb4-semicontinuity-of-hn-polygon).

Proof / construction outline:

1. Reduce to constant rank n and degree d and affinoid S; set m = dr - n.
2. Choose m pairwise disjoint untilts via m maps S -> BC(O(1)) minus {0}, using fractional powers of a pseudouniformizer to force disjointness.
3. Build F as the corresponding modification, checking fibrewise semistability of slope 1/r.
4. Disjointness makes the fibres of E and of the partial modification agree at the next untilt. Over a perfectoid field choose the rank-one quotient of the fibre so that the pulled-back extension of the maximal-slope piece E^{≥λ} (λ>1/r) is nonsplit; slope counting then keeps every HN slope ≥1/r. Over affinoid S do this at a point s and spread it to an open neighbourhood by upper semicontinuity (II.2.19(i)). The variant II.3.3(ii) belongs to the strict-positive presentations node.

Suggested declaration: `PositiveSlopeResolution`.

Acceptance checks:

- Verify disjointness of the chosen untilts explicitly
- Verify the degree/rank bookkeeping m = dr - n on an example
- Over a perfectoid field K, check that a nonsplit extension 0→O→G→E^{≥λ}→0 with λ>1/r has all HN slopes ≥1/r, as in the slope count of the proof.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.3.1, pp. 75–76; Corollary II.3.3(i), p. 78. Exact source contract, with the conventions and corrections stated in this node.

<a id="vectorbundlesandisocrystals-vb3-general-bc-strict-positive-etale-presentations"></a>

### Étale positive-slope presentations

`VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations` · theorem · implementation `unchecked`.

Let S∈Perf_Fq, E a bundle on X_S and r≥1. (a) If all HN slopes of E at all geometric points are >1/r, then étale locally on S, for some m≥0, there is 0→G→O(1/r)^m→E→0 with G fibrewise SEMISTABLE of slope 0 (FS II.3.2, II.3.3(iii)). (b) If all slopes are ≥1/r, then locally on S there is 0→O(1/(2r))^m→F→E′→0 with F fibrewise semistable of slope 1/r and E a direct summand of E′ (II.3.3(ii)). (c) If all slopes are >1/r, then étale locally on S there is 0→G→O(1/r)^m→E′→0 with G fibrewise semistable of slope 1/(2r) and E a direct summand of E′ (II.3.3(iv)). Claims (b) and (c) retain E′. On a component where E has constant degree d, the sequence in (a) forces m=d, since O(1/r) has rank r and degree 1 (FS print m=dr, E29). Fibrewise semistability, not merely degree zero, is what the subsequent separatedness and pro-étale trivialization arguments use.

Hypotheses:

- r≥1; finite constant ranks and degrees after passing to components.
- The analytic and étale topologies in the three assertions are distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`](#vectorbundlesandisocrystals-vb3-general-bc-positive-slope-resolution); [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); [`VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`](#vectorbundlesandisocrystals-vb1-annular-frobenius-descent); [`VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change`](#vectorbundlesandisocrystals-vb2-classification-hn-filtration-base-change); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`](#vectorbundlesandisocrystals-vb3-projectivized-properness-properness-of-projectivized-bc); [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon`](#vectorbundlesandisocrystals-vb4-semicontinuity-of-hn-polygon).

Proof / construction outline:

1. Use the geometric presentation and positivity of Hom(O(1/r),E); the universal surjection/kernel conditions define an open locus.
2. Approximate a section at a geometric point by solving φ−A with a uniform bound near a diagonal positive matrix; this makes the open locus meet an étale neighbourhood.
3. For the direct-summand variants pull back to the unramified 2r coefficient extension, twist, apply the first presentation and push forward; the adjunction makes E a summand.

Suggested declaration: `StrictPositiveEtalePresentations`.

Acceptance checks:

- At r=2 a quotient O(1/2)^m→E with slope-zero kernel has degree m, not 2m.
- The source explicitly declines to remove the auxiliary summand E′.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Corollary II.3.3(i)–(iv), pp. 78–79; II.3.2 proof, pp. 76–78. The four topology-sensitive forms; rank-degree correction in the proof is recorded as SI-FS-multiplicity.

<a id="vectorbundlesandisocrystals-vb3-general-bc-families-of-banach-colmez-spaces"></a>

### FS II.3.5: two-term Banach-Colmez spaces, properness and cohomological smoothness

`VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces` · theorem · implementation `unchecked`.

For [E₁→E₀] in degrees −1,0, with E₁ negative at every geometric point of S, BCcomplex is a locally spatial diamond partially proper over S; its punctured E×-quotient is locally spatial and proper over S. If E₀ is everywhere strictly positive, BCcomplex→S is cohomologically smooth. In this positive range, 0→BC(E₀)→BCcomplex→BCneg(E₁)→0 is exact as E-module v-sheaves. Neither unpunctured absolute spatiality nor perfectoid representability is asserted.

Hypotheses:

- E_1 must have only NEGATIVE slopes at all geometric points; this is what makes H^0(X_T,E_1) = 0 (Prop. II.3.4(i)) so that the two-term complex has a well-defined H_0
- Part (iii) additionally requires all slopes of E_0 to be POSITIVE
- All assertions are etale-local, in fact v-local, on S
- The reduction replaces [E_1 -> E_0] by a quasi-isomorphic [E'_1 -> O_{X_S}(-d)^m] obtained from a surjection O_{X_S}(-d)^m -> E_0 with d > 0 given by Thm. II.2.6; E'_1 still has only negative slopes
- Separatedness of BC(O_{X_S}(-d)^m[1]) from Prop. II.2.5(i) is used to reduce (i) and (ii) to BC(E'_1[1])

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-banach-colmez-space-definition); [`VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`](#vectorbundlesandisocrystals-vb3-general-bc-positive-slope-resolution); [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma`](#vectorbundlesandisocrystals-vb3-projectivized-properness-contracting-action-lemma); `DiamondSixOperations:S4`; `DiamondSixOperations:S5`; `DiamondsAndVStacks:D5/relative-representability`; [`VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations`](#vectorbundlesandisocrystals-vb3-general-bc-strict-positive-etale-presentations); [`VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`](#vectorbundlesandisocrystals-vb4-relative-cohomology-vanishing); [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/scalar-projectivization`](#vectorbundlesandisocrystals-vb3-projectivized-properness-scalar-projectivization).

Proof / construction outline:

1. Simplify the complex: choose d > 0 and a surjection O_{X_S}(-d)^m -> E_0 (Thm. II.2.6), let E'_1 = ker(E_1 + O_{X_S}(-d)^m -> E_0); then [E'_1 -> O_{X_S}(-d)^m] -> [E_1 -> E_0] is a quasi-isomorphism.
2. Use 0 -> BC([E'_1 -> O(-d)^m]) -> BC(E'_1[1]) -> BC(O(-d)^m[1]) and separatedness of the last term to reduce (i),(ii) to BC(E'_1[1]).
3. Apply Cor. II.3.3(iv) to the dual of E'_1 to get, etale-locally and after adding a bundle, 0 -> BC(E'_1[1]) -> BC(O(-1/r)^m[1]) -> BC(G[1]), reducing to the explicitly known negative Banach-Colmez spaces of Prop. II.2.5(i).
4. Part (iii) uses Cor. II.3.3 again to present E_0 and then Prop. II.2.5(iii)'s cohomological smoothness.

Suggested declaration: `FamiliesOfBanachColmezSpaces`.

Acceptance checks:

- Verify the negative-slope hypothesis is necessary by exhibiting failure of partial properness otherwise
- Verify (iii) on [0 -> O(1)] where cohomological smoothness is II.2.5(iii)
- Verify the quasi-isomorphism step preserves the negative-slope condition

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.3.5, pp. 79–81. Exact source contract, with the conventions and corrections stated in this node.

<a id="vectorbundlesandisocrystals-vb3-general-bc-divisor-section-comparison"></a>

### Effective divisors and projective sections

`VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison` · comparison · implementation `unchecked`.

For d≥1, the already owned absolute divisor v-sheaf Div^d of degree-d relative Cartier divisors is (BC(O(d))∖{0})/E^×. It is proper over ∗, representable in spatial diamonds and cohomologically smooth. The sum map (Div¹)^d→Div^d is a quasi-pro-étale cover identifying Div^d=(Div¹)^d/Σ_d as v-sheaves; in particular Div^d is a diamond (ECD Propositions 11.4, 11.6).

Hypotheses:

- Absolute curve over k=bar F_q; coefficient field E as in FS; d positive integral.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence); [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`](#vectorbundlesandisocrystals-vb3-projectivized-properness-properness-of-projectivized-bc); `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`; `DiamondsAndVStacks:D5/spatial-v-sheaf-criterion`; `DiamondsAndVStacks:D5`; `DiamondSixOperations:S5`; [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); [`VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`](#vectorbundlesandisocrystals-vb2-ampleness-schematic-curve-at-a-geometric-point); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); `DiamondsAndVStacks:D3/locally-profinite-torsors`.

Proof / construction outline:

1. Divisor of a nonzero section supplies the comparison with RF2’s divisor moduli; scalar multiples give the same divisor.
2. Conversely, for a relative Cartier divisor I↪O_{X_S}, after an open and closed decomposition of S the line bundle I has constant degree −d, and by II.2.19 the isomorphisms I≅O(−d) form a pro-étale E^×-torsor; hence Div=⊔_d Div^d with Div^d=(BC(O(d))∖{0})/E^× (FS p. 81).
3. Properness of all spaces over ∗ (II.2.16) makes the sum map proper; surjectivity is checked on geometric points, where every element of P_d is a product of elements of P_1 (proof of II.2.9); bijectivity up to Σ_d gives the quotient, and the projection is quasi-pro-étale (ECD Lemma 7.19).
4. Use the DD5 spatiality criteria to prove the spatial quotient statement, and six-operations smoothness descent.

Suggested declaration: `DivisorSectionComparison`.

Acceptance checks:

- d=1 recovers the fundamental E×-torsor.
- Σ_d permutes ordered factors; this is not a degree-d étale cover.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.3.6, pp. 81–82. Comparison and finite permutation cover; RF2 retains ownership of the divisor object.

<a id="vectorbundlesandisocrystals-vb3-general-bc-absolute-bc-spatiality"></a>

### FS II.3.6-II.3.7: Div^d as a diamond and absolute Banach-Colmez spaces of pure-sign isocrystals

`VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality` · theorem · implementation `unchecked`.

Work on Perf_k, k = algebraic closure of F_q (the absolute base). Let D be a nonzero isocrystal with only negative slopes (resp. only positive slopes); the bundle functor reverses slopes, so E(D) has only positive (resp. only negative) HN slopes. (i) The punctured Banach–Colmez space BC(D)∖{0} (resp. BC(D[1])∖{0}) is a spatial DIAMOND. (ii) The quotient (BC(D)∖{0})/E^× → ∗ (resp. (BC(D[1])∖{0})/E^× → ∗) is proper, representable in spatial diamonds and cohomologically smooth. The punctured spaces are open in the cohomologically smooth BC(D) (resp. BC(D[1])) and so are cohomologically smooth over ∗. Relative representability in spatial diamonds does not assert that every total quotient over the non-spatial absolute base is spatial: (BC(O(d))∖{0})/π^Z is not quasiseparated (FS Remark II.3.10).

Hypotheses:

- D has slopes of a single sign; mixed-sign isocrystals are not covered by this statement
- One works on Perf_k with k algebraically closed
- The proof of (i) chooses, by Dieudonne-Manin, a basis in which phi is E-rational and U = phi^N is diagonal with entries powers of pi for some N > 0 - i.e. D is DECENT in the sense of Rapoport-Zink Definition 1.8
- Since U = φ^N and BC(D) (resp. BC(D[1])) is already defined on Perf_Fq, the action of U agrees with that of Frob^N. The hypotheses of Lemma II.2.17 are checked for U^{-1} (resp. U) after base change to Spa F_q((t^{1/p^∞})), because that lemma needs a spatial base; the quotient statement is translated back using that the absolute Frobenius acts trivially on topological spaces.
- Surjectivity of the sum map is checked on geometric points using Prop. II.2.9 (every element of P_d is a product of elements of P_1)

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`](#vectorbundlesandisocrystals-vb3-general-bc-families-of-banach-colmez-spaces); [`VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`](#vectorbundlesandisocrystals-vb0-dieudonne-manin-isocrystals); `DiamondsAndVStacks:D5/spatial-v-sheaf-criterion`; `DiamondsAndVStacks:D5/relative-representability`; `DiamondSixOperations:S4`; `DiamondSixOperations:S5`; [`VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison`](#vectorbundlesandisocrystals-vb3-general-bc-divisor-section-comparison); `DiamondsAndVStacks:D5`; [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma`](#vectorbundlesandisocrystals-vb3-projectivized-properness-contracting-action-lemma); [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); `DiamondsAndVStacks:D3/locally-profinite-torsors`.

Proof / construction outline:

1. For II.3.6: all spaces are proper over * by Prop. II.2.16(ii), so the sum map is proper; surjectivity as v-sheaves is checked on geometric points via the factorisation in the proof of Prop. II.2.9; one gets bijectivity up to Sigma_d, hence Div^d = (Div^1)^d/Sigma_d; the projection is quasi-pro-etale, and Div^1 = Spd E/phi^Z is a diamond, so Div^d is a diamond.
2. For II.3.7(ii): apply Prop. II.3.5 and, for cohomological smoothness after the E^times-quotient, ECD Proposition 24.2.
3. For II.3.7(i), spatiality: use decency so that U = φ^N acts as Frob^N; U^{-1} (resp. U) on the base change to Spa F_q((t^{1/p^∞})) satisfies the hypotheses of Lemma II.2.17, so (BC(D)∖{0})/φ^N × Spa F_q((t^{1/p^∞})) is a spatial diamond; translate back using triviality of the absolute Frobenius on topological spaces, and apply Lemma II.3.8(i) (Spa F_q((t^{1/p^∞}))/φ^N → ∗ is proper and cohomologically smooth) to see that BC(D)∖{0} is a spatial v-sheaf.
4. Diamond property, positive case: reduce to D simple and, after a finite unramified extension of E, of rank one; then BC(D)∖{0} is an E^×-torsor over Div^d, a diamond by II.3.6, so it is a diamond (ECD Proposition 11.7).
5. Diamond property, negative case D = (E, π^nφ), n>0: BC(D[1])∖{0} classifies extensions 0→O(−n)→E→O→0 that are geometrically fibrewise non-split. Stratify by the geometric isomorphism class of E (O(−n+i)⊕O(−i) with 0<i≤n/2, or O(−n/2)); these strata are locally closed and generalizing. On a stratum the global HN filtration exists (II.2.19); trivializing its lowest-slope graded piece is a pro-étale torsor, and composing O(−n)→E with the projection to that piece maps the torsor into a punctured positive absolute BC space, already a diamond. ECD Proposition 11.10 makes each stratum a diamond, and Lemma II.3.8(ii) concludes (compare SW20 Theorem 19.2.4, FS Remark II.3.9).

Suggested declaration: `AbsoluteBcSpatiality`.

Acceptance checks:

- Verify decency explicitly for the simple isocrystal of slope 1/n
- Verify Div^2 = (Div^1)^2/Sigma_2 on geometric points
- Verify the identification of the U-action with Frob^N after base change

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.3.7, pp. 82–83. The pure-sign statement; II.3.6 is the divisor comparison, now a separate node.

<a id="vectorbundlesandisocrystals-vb3-general-bc-punctured-absolute-quotients"></a>

### Punctured absolute spaces and scalar quotients

`VectorBundlesAndIsocrystals:VB3:general-BC/punctured-absolute-quotients` · application · implementation `unchecked`.

Over Perf_k, for d≥1 the punctured absolute BC(O(d))∖{0} is a spatial diamond. Its quotient (BC(O(d))∖{0})/π^Z is not quasiseparated and therefore not spatial; the good object is the morphism (BC(O(d))∖{0})/π^Z → ∗, which is representable in spatial diamonds, while (BC(O(d))∖{0})/E^× = Div^d → ∗ is proper and representable in spatial diamonds. In equal characteristic the punctured positive absolute BC spaces (from pure negative isocrystals) are perfectoid spaces, whereas the punctured negative ones (from pure positive isocrystals) are only spatial diamonds. If E is p-adic, BC(O_{X_C}(−1)[1]) is not a perfectoid space (proof of FS Lemma II.2.15); in equal characteristic FS leave this open (footnote 5).

Hypotheses:

- Use punctured spaces throughout; absolute spatiality and relative spatial representability are different assertions.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality`](#vectorbundlesandisocrystals-vb3-general-bc-absolute-bc-spatiality); [`VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison`](#vectorbundlesandisocrystals-vb3-general-bc-divisor-section-comparison); `DiamondsAndVStacks:D5/relative-representability`; `DiamondsAndVStacks:D5`; [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists).

Proof / construction outline:

1. Use the E×-torsor over Div^d and the generic smooth-cover spatiality criterion.
2. Apply the absolute quotient calculation in FS II.3.10 to retain the failure of quasiseparatedness.
3. Use the open-ball/perfected additive description in equal characteristic; keep the negative shifted non-perfectoid example.

Suggested declaration: `PuncturedAbsoluteQuotients`.

Acceptance checks:

- BC(O(d)) punctured spatial does not make its π^Z-quotient spatial.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Remarks II.3.10–II.3.11, pp. 83–84. Supplies both the nonspatial quotient and the equal-characteristic distinction.
- [FS-geometrization](#source-fs-geometrization), Proof of Lemma II.2.15 and footnote 5, p. 71. The mixed-characteristic non-perfectoid clause; footnote 5 leaves the equal-characteristic case open.

<a id="vectorbundlesandisocrystals-vb3-general-bc-negative-quaternion-example"></a>

### Quaternion presentation of negative Banach–Colmez space

`VectorBundlesAndIsocrystals:VB3:general-BC/negative-quaternion-example` · comparison · implementation `unchecked`.

Over Perf_k, the absolute punctured BC(O(−1)[1])∖{0} classifies extensions 0→O(−1)→E→O→0 that are non-split fiberwise; geometrically E≅O(−1/2). It identifies with (BC(O(1/2))∖{0})/SL₁(D), where D is the quaternion division algebra over E (invariant 1/2) and SL₁(D) its reduced-norm-one group. After base change to Spa C with a chosen untilt C♯/E, BC(O(−1)[1])×_k Spa C≅(A¹_{C♯})^♢/E and the punctured space becomes (Ω_{C♯})^♢/E with Ω = A¹_E∖E = P¹_E∖P¹(E). The latter description uses the untilt and is not an identification with a perfectoid quotient space.

Hypotheses:

- The nonzero extension has fixed determinant; the acting group is SL₁(D), not D×.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`](#vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus); [`VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison`](#vectorbundlesandisocrystals-vb2-classification-bundle-endomorphism-comparison); [`VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`](#vectorbundlesandisocrystals-vb0-brauer-invariant-sign); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence); [`VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality`](#vectorbundlesandisocrystals-vb3-general-bc-absolute-bc-spatiality); [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); `DiamondsAndVStacks:D3/locally-profinite-torsors`.

Proof / construction outline:

1. A nonzero class of Ext¹(O,O(−1)) has semistable middle term O(−1/2); use classification and fix its determinant.
2. The torsor of determinant-preserving identifications yields the norm-one quotient; duality gives positive O(1/2).
3. Use the fundamental exact sequence to identify the additive quotient and punctured Drinfeld upper half-plane description.

Suggested declaration: `NegativeQuaternionExample`.

Acceptance checks:

- Replacing SL₁(D) by D× loses the fixed determinant.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Example II.3.12, p. 84. The norm-one quaternion group and untilt-dependent additive quotient.

<a id="vectorbundlesandisocrystals-vb3-general-bc-negative-sl2-example"></a>

### SL₂ presentation of negative Banach–Colmez space

`VectorBundlesAndIsocrystals:VB3:general-BC/negative-sl2-example` · comparison · implementation `unchecked`.

Over Perf_k, the absolute punctured BC(O(−2)[1])∖{0}≅U/SL₂(E), where U⊂(BC(O(1))∖{0})² is the open locus of pairs of sections that are fiberwise nonzero and E-linearly independent, U=(BC(O(1))∖{0})²∖(E^××1).Δ. The corresponding extension 0→O(−1)→O²→O(1)→0 is specified by a surjection and its determinant trivialization; changing the determinant-preserving basis gives SL₂(E), not GL₂(E).

Hypotheses:

- Nonzero extension class; determinant fixed.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-lubin-tate-universal-cover); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence); [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`](#vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus); [`VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality`](#vectorbundlesandisocrystals-vb3-general-bc-absolute-bc-spatiality); [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); `DiamondsAndVStacks:D3/locally-profinite-torsors`.

Proof / construction outline:

1. Classify the middle term of 0→O(−2)→F→O→0 and twist by O(1).
2. Show that the surjection O²→O(1) is equivalent to E-linear independence of its two sections.
3. Use the determinant to identify its kernel with O(−1); quotient the choices of determinant-preserving basis.

Suggested declaration: `NegativeSl2Example`.

Acceptance checks:

- An E-dependent pair lies outside U; GL₂ does not preserve the kernel determinant identification.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Example II.3.13, p. 84. Open locus and special linear quotient.

<a id="vectorbundlesandisocrystals-vb3-general-bc-sympathetic-vector-spaces"></a>

### Sympathetic Vector Spaces

`VectorBundlesAndIsocrystals:VB3:general-BC/sympathetic-vector-spaces` · definition · implementation `unchecked`.

A Vector Space (VS) W is a functor Λ ↦ W(Λ) from sympathetic algebras to Q_p-vector spaces, and a sequence 0 → W_1 → W → W_2 → 0 is exact precisely when it is exact on W(Λ) for every Λ. Sympathetic algebras are, following Colmez, the spectral connected C-Banach algebras Λ on which x ↦ x^p is surjective on {x : ‖x−1‖_Λ < 1}, with O_Λ the unit ball; this paper imposes two further conditions, that Λ → C(Spm(Λ) → C) be injective — a property taken for granted in the earlier arguments but failing for instance for Λ = O_{C′} with C′ the spherical closure of C — and that Λ be separable, i.e. have a dense C-subspace of countable dimension, so that Hahn–Banach is available without assuming C spherically complete. Since O_C/p is countable, the sympathetic closure of a separable such algebra is again separable.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: `mathlib:NormedAlgebra`; `mathlib:ModuleCat`.

Proof / construction outline:

1. Import normed C-algebra topology; take connected spectral Banach algebras with p-root surjectivity near 1.
2. Include injectivity into C-valued functions on Spm and countable-dimensional dense C-subspace.
3. A VS is a covariant functor to Q_p-vector spaces; exactness is tested on every sympathetic algebra.

Suggested declaration: `SympatheticVS`.

Planning API:

- `SympatheticVS` (data): A covariant functor from the stated sympathetic C-Banach algebras to ModuleCat Q_p.
- `SympatheticVS.constant` (constructor): The constant functor of a finite-dimensional Q_p vector space.
- `SympatheticVS.additive` (constructor): V_d evaluates to Λ^d and maps by the C-algebra homomorphism in every coordinate.
- `SympatheticVS.exact` (compatibility): A short complex is short exact iff its evaluated ModuleCat complex is short exact at every Λ.
- `SympatheticVS.periodTargets` (compatibility): The source period Rings BdR⁺ and BdR and the quotients B_m are VS targets via the R06.1 period-functor construction.

Unit tests:

- `SympatheticVSTest.constants` (computation): The constant Q_p functor evaluates to Q_p at C, whereas V₁ evaluates to C.
- `SympatheticVSTest.zero` (degenerate): V₀ is the zero functor.
- `SympatheticVSTest.finiteSum` (compatibility): V_{d+e}≅V_d⊕V_e coordinatewise.
- `SympatheticVSTest.evaluation` (non-example): The C-valued spectrum-injectivity condition excludes the spherical-closure example singled out by footnote 6; p-root surjectivity alone is insufficient.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:

- VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations: make the two exact presentation sequences meaningful
- VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing: state Hom for all VS natural maps, not only period-linear ones

Sources:

- [CN25-VB3](#source-cn25-vb3), §3.1.1 with footnote 6, p. 12. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-banach-colmez-presentations"></a>

### Finite-Dimensional Banach–Colmez presentations

`VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations` · construction · implementation `unchecked`.

Morally a BC is a finite dimensional C-vector space up to a finite dimensional Q_p-vector space, with Dimension Dim W = (a,b) where a = dim W is the C-dimension and b = ht W ∈ Z the Q_p-dimension. Precisely, a VS W is finite Dimensional — a BC — if it equals V_d up to finite dimensional Q_p-vector spaces: there are finite dimensional Q_p-vector spaces V_1, V_2 and exact sequences 0 → V_1 → Y → V_d → 0 and 0 → V_2 → Y → W → 0, so that W is obtained from V_d by adding V_1 and quotienting by V_2; then dim W = d and ht W = dim_{Q_p}V_1 − dim_{Q_p}V_2. These are the objects often called Banach–Colmez spaces.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/sympathetic-vector-spaces`](#vectorbundlesandisocrystals-vb3-general-bc-sympathetic-vector-spaces); `mathlib:CategoryTheory.ShortComplex.ShortExact`; `mathlib:Module.finrank`.

Proof / construction outline:

1. Choose Y with two short exact sequences 0→V₁→Y→V_d→0 and 0→V₂→Y→W→0.
2. Finite Q_p spaces V₁,V₂ give Dim=(d,finrank V₁−finrank V₂).
3. The separate Dimension theorem proves independence; continuous Q_p-Banach points alone do not determine Dim.

Suggested declaration: `BCPresentation`.

Planning API:

- `BCPresentation` (data): Y and exact 0→V₁→Y→V_d→0, 0→V₂→Y→W→0 with finite Q_p spaces V₁,V₂.
- `BCPresentation.dim` (projection): The natural number d.
- `BCPresentation.height` (projection): The integer finrank_Qp(V₁)−finrank_Qp(V₂).
- `BCPresentation.dimension` (compatibility): The pair (d,height) is independent of the presentation by DimensionAbelian.
- `BCPresentation.stabilize` (constructor): Adding the same finite Q_p vector space to Y,V₁,V₂ gives another presentation of W and the same Dimension.

Unit tests:

- `BCPresentationTest.additive` (computation): The tautological presentation of V_d has Dimension (d,0).
- `BCPresentationTest.constant` (computation): A finite Q_p vector space of dimension h has Dimension (0,h).
- `BCPresentationTest.quotient` (computation): The cokernel V₁/Q_p of a nonzero Q_p→V₁ map has Dimension (1,−1).
- `BCPresentationTest.stabilize` (compatibility): Increasing both finite Q_p dimensions by one leaves height unchanged.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:

- VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian: prove independence and additivity
- VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples: compute basic period objects

Sources:

- [CN25-VB3](#source-cn25-vb3), §3.1.1, pp. 12–13. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-curvature"></a>

### Curvature

`VectorBundlesAndIsocrystals:VB3:general-BC/curvature` · definition · implementation `unchecked`.

For W ∈ BC one says W has curvature > 0 if Hom(W,V_1) = 0; curvature ≥ 0 if Hom(W,B^+_dR) = 0; curvature = 0, or affine, if it is a successive extension of V_1's; curvature < 0 if it injects into B_dR^d, equivalently into (B^+_dR)^d; curvature ≤ 0 if it injects into a B^+_dR-Module, i.e. a VS with an action of B^+_dR.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/sympathetic-vector-spaces`](#vectorbundlesandisocrystals-vb3-general-bc-sympathetic-vector-spaces); [`VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations`](#vectorbundlesandisocrystals-vb3-general-bc-banach-colmez-presentations); `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`; `PadicHodgeTheory:R06.1`.

Proof / construction outline:

1. Define the two positive predicates by VS Hom vanishing against V₁ and BdR⁺.
2. Define curvature zero by a finite filtration with V₁ quotients, strict negative by injection into a finite BdR (equivalently BdR⁺) power, nonpositive by injection into a BdR⁺-Module.
3. Keep curvature distinct from HN slope and height, especially at other untilt points.

Suggested declaration: `BCCurvature.positive`.

Planning API:

- `BCCurvature.positive` (data): Hom_VS(W,V₁)=0.
- `BCCurvature.nonnegative` (data): Hom_VS(W,BdR⁺)=0.
- `BCCurvature.affine` (data): A finite filtration with V₁ quotients.
- `BCCurvature.negative` (data): An injection into (BdR⁺)^d for some finite d, equivalently BdR^d.
- `BCCurvature.nonpositive` (data): An injection into a VS carrying a BdR⁺-Module structure.
- `BCCurvature.iso` (functoriality): Every curvature predicate is invariant under BC isomorphism.

Unit tests:

- `BCCurvatureTest.rational` (computation): Q_p has strict negative curvature and height one.
- `BCCurvatureTest.affine` (computation): V₁ has curvature zero and height zero.
- `BCCurvatureTest.shifted` (computation): H¹(O(−1)) has positive curvature and height −1.
- `BCCurvatureTest.otherPoint` (non-example): At x≠∞, U₁/Q_p t_x has height zero and positive curvature but not curvature zero.
- `BCCurvatureTest.zero` (degenerate): The zero object satisfies all five predicates; strict height inequalities require nonzero objects.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:

- VectorBundlesAndIsocrystals:VB3:general-BC/canonical-curvature-filtration: define the canonical curvature filtration
- VectorBundlesAndIsocrystals:VB3:general-BC/curvature-subquotients: avoid the false dual quotient assertion

Sources:

- [CN25-VB3](#source-cn25-vb3), Definition 3.5, p. 13. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-tilted-coherent-heart"></a>

### The tilted coherent heart

`VectorBundlesAndIsocrystals:VB3:general-BC/tilted-coherent-heart` · definition · implementation `unchecked`.

Coh⁻_X is the full subcategory of Dᵇ(Coh_X) with cohomology only in degrees −1 and 0, H^{−1} of negative slopes and H⁰ of nonnegative slopes INCLUDING torsion sheaves. It is the torsion-pair tilt heart, hence abelian. Objects split noncanonically as H⁰⊕H^{−1}[1] because the curve has cohomological dimension one. For such a zero-differential representative BC(F)=H⁰(X,H⁰F)⊕H¹(X,H^{−1}F), noncanonically; general morphisms include Ext¹(H⁰F,H^{−1}G).

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: `mathlib:DerivedCategory`; `SchemeAndStackFoundations:SF.0`; [`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`](#vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism); [`VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification`](#vectorbundlesandisocrystals-vb2-classification-coherent-sheaf-classification); [`VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`](#vectorbundlesandisocrystals-vb2-ampleness-two-affine-cover-cohomological-dimension).

Proof / construction outline:

1. Import the derived category and the torsion-pair tilt construction from SF.0.
2. Take complexes with cohomology only in degrees −1,0, H^{−1} negative and H⁰ nonnegative including torsion.
3. Cohomological dimension one gives an isomorphism H⁰⊕H^{−1}[1], noncanonically; record the Ext¹ off-diagonal morphisms.

Suggested declaration: `BCTiltedHeart`.

Planning API:

- `BCTiltedHeart` (data): Objects K∈Dᵇ(Coh_X) with HⁱK=0 except i=−1,0, H^{-1} negative and H⁰ nonnegative including torsion.
- `BCTiltedHeart.positive` (constructor): A coherent sheaf of nonnegative slopes enters in degree zero.
- `BCTiltedHeart.negative` (constructor): A negative bundle enters with shift [1].
- `BCTiltedHeart.split` (compatibility): K is isomorphic to H⁰K⊕H^{-1}K[1], noncanonically, using Ext²=0 on the curve.
- `BCTiltedHeart.homMatrix` (compatibility): Morphisms between these decompositions have diagonal Hom and off-diagonal Ext¹(E₀,F₋₁).

Unit tests:

- `BCTiltedHeartTest.positive` (computation): O(1) in degree zero belongs to the heart.
- `BCTiltedHeartTest.negative` (computation): O(−1)[1] belongs, while O(−1) in degree zero does not.
- `BCTiltedHeartTest.torsion` (compatibility): The torsion skyscraper at any untilt point belongs in degree zero.
- `BCTiltedHeartTest.shift` (non-example): O[1] is excluded, since its H^{-1} has slope zero rather than negative.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:

- VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence: state Le Bras as an equivalence of actual abelian categories
- VectorBundlesAndIsocrystals:VB3:general-BC/bc-morphism-calculus: retain nontrivial Ext¹ off-diagonal maps

Sources:

- [CN25-VB3](#source-cn25-vb3), §3.2.4, p. 15. The definition of the heart; the preceding sentences of §3.2.4 concern Le Bras’s sheaf realization.

<a id="vectorbundlesandisocrystals-vb3-general-bc-abstract-banach-colmez-category"></a>

### Abstract Banach–Colmez category

`VectorBundlesAndIsocrystals:VB3:general-BC/abstract-banach-colmez-category` · definition · implementation `unchecked`.

For fixed C/Q_p algebraically closed and complete, BC is the smallest strictly full abelian subcategory of sheaves of Q_p-modules on Perf_C,proét, stable under extensions and containing underline Q_p and the additive untilt sheaf G_a. Equivalently close these generators under finite biproducts, kernels and cokernels of morphisms BETWEEN BC objects, extensions and isomorphisms. Do not require closure under every ambient subobject.

Hypotheses:

- The untilt additive sheaf is over Perf_C; Frobenius coefficients are Q_p here.

Prerequisites: `mathlib:CategoryTheory.Sheaf`; `mathlib:CategoryTheory.Abelian`; `DiamondsAndVStacks:D6/etale-site-comparison`; `DiamondsAndVStacks:D3`.

Proof / construction outline:

1. Import the generic sheaf and abelian category machinery.
2. Define membership as the generated finite abelian-extension closure, equivalently the intersection of such full subcategories.
3. Le Bras identifies this subcategory with the presentation-defined BC category and the tilted heart.

Suggested declaration: `AbstractBC`.

Planning API:

- `AbstractBC` (data): The generated abelian extension-closed strictly full subcategory of Q_p-module sheaves containing Q_p and G_a.
- `AbstractBC.rational` (constructor): The constant sheaf Q_p is a member.
- `AbstractBC.additive` (constructor): The untilt additive sheaf G_a is a member.
- `AbstractBC.kernelCokernel` (structure): Kernels and cokernels of maps between member objects remain members, computed in the ambient abelian sheaf category.
- `AbstractBC.extension` (constructor): A short exact extension of two members is a member.
- `AbstractBC.leBras` (equivalence): Degree-zero hypercohomology induces the exact equivalence with BCTiltedHeart; sympathetic values agree with the presentation realization.

Unit tests:

- `AbstractBCTest.generators` (computation): The two generators are Q_p and G_a, with Dimensions (0,1) and (1,0).
- `AbstractBCTest.zero` (degenerate): The zero sheaf is in AbstractBC.
- `AbstractBCTest.quotient` (compatibility): The cokernel G_a/Q_p belongs and is BC(O(−1)[1]) after choosing ∞.
- `AbstractBCTest.points` (non-example): C and C⊕Q_p are isomorphic as topological Q_p-vector spaces but their BC Dimensions (1,0) and (1,1) differ.

Acceptance checks:

- Q_p and G_a are generators; G_a/Q_p belongs as a cokernel; the category is not all ambient Q_p-module sheaves.

Downstream uses:

- VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence: identify the three BC realizations
- VectorBundlesAndIsocrystalsPartII: import the abelian category before introducing h

Sources:

- [SW20](#source-sw20), Definition 15.2.1, book p. 133. The smallest abelian extension-closed category, not arbitrary topological Q_p vector spaces.
- [SW20](#source-sw20), Theorem 15.2.12, book p. 139. Tilted coherent realization and diamond property.

<a id="vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence"></a>

### Le Bras equivalence

`VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence` · theorem · implementation `unchecked`.

The functor BC realises an equivalence of categories Coh^-_X ≃ BC. In its pro-étale sheaf realization every BC object is a diamond (SW Theorem 15.2.12); no perfectoid representability is inferred.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-banach-colmez-space-definition); [`VectorBundlesAndIsocrystals:VB3:general-BC/tilted-coherent-heart`](#vectorbundlesandisocrystals-vb3-general-bc-tilted-coherent-heart); [`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`](#vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations`](#vectorbundlesandisocrystals-vb3-general-bc-banach-colmez-presentations); `DiamondsAndVStacks:D3`; [`VectorBundlesAndIsocrystals:VB3:general-BC/abstract-banach-colmez-category`](#vectorbundlesandisocrystals-vb3-general-bc-abstract-banach-colmez-category); [`VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`](#vectorbundlesandisocrystals-vb3-general-bc-families-of-banach-colmez-spaces); `mathlib:CategoryTheory.Equivalence`.

Proof / construction outline:

1. Take degree-zero hypercohomology after base change, then sheafify; compare values on sympathetic algebras.
2. Compute Hom via the triangular Hom/Ext¹ matrix, rather than treating BC as pointwise Banach spaces.
3. Use the standard/torsion blocks and extension closure to prove essential surjectivity and exactness.

Suggested declaration: `LeBrasEquivalence`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Theorem 3.12, p. 15. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian"></a>

### Dimension and the abelian BC category

`VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian` · theorem · implementation `unchecked`.

(i) The Dimension of a BC is independent of the choices in its definition. (ii) For f : W_1 → W_2 a morphism of BC's, ker f, coker f and im f are BC's, with Dim W_1 = Dim ker f + Dim im f and Dim W_2 = Dim coker f + Dim im f. (iii) If dim W = 0 then ht W ≥ 0. (iv) If W has an increasing filtration with successive quotients V_1, then every sub-BC W′ has ht W′ ≥ 0. The category BC of BC's is abelian.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence); [`VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations`](#vectorbundlesandisocrystals-vb3-general-bc-banach-colmez-presentations); `mathlib:CategoryTheory.Abelian`.

Proof / construction outline:

1. Use the equivalence with the tilted coherent heart to obtain kernels, cokernels and images inside BC.
2. Transport rank and degree from the curve to prove independence of presentation and additivity of Dim.
3. Dimension zero gives a finite-dimensional Q_p space with nonnegative height; subobjects of successive V₁-extensions have nonnegative height.

Suggested declaration: `DimensionAbelian`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.
- Concrete instance: for the inclusion f:Q_p→V₁, Dim coker f = (1,−1) = Dim V₁ − Dim Q_p, and ker f = 0.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Proposition 3.2, p. 13. The routed statement, with corrections and ownership boundaries recorded explicitly.
- [FF18-courbes](#source-ff18-courbes), Preface, Theorem 2.12(i)–(ii), printed pp. 16–17. Independent and additive Dimension; preface pagination kept distinct.

<a id="vectorbundlesandisocrystals-vb3-general-bc-exact-banach-points"></a>

### Exact faithful Banach realization

`VectorBundlesAndIsocrystals:VB3:general-BC/exact-banach-points` · theorem · implementation `unchecked`.

(i) One is in general only interested in W = W(C), but without the extra structure its Dimension could not be spoken of — for example C and C ⊕ Q_p are isomorphic as topological Q_p-vector spaces. (ii) The functor W ↦ W(C) is faithful on BC's; moreover W(Λ) is a Q_p-banach for every Λ, a morphism of BC's induces continuous strict maps W_1(Λ) → W_2(Λ), and an exact sequence of BC's induces a strictly exact sequence for every sympathetic Λ.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations`](#vectorbundlesandisocrystals-vb3-general-bc-banach-colmez-presentations); [`VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`](#vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian).

Proof / construction outline:

1. Evaluate the source VS functor on C or an arbitrary sympathetic algebra.
2. Use the BC presentation and the source strictness theorem to obtain Banach values and continuous strict maps.
3. Faithfulness holds for W(C); fullness into all continuous Q_p-linear maps is not claimed.

Suggested declaration: `ExactBanachPoints`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Remark 3.1, p. 13. The routed statement, with corrections and ownership boundaries recorded explicitly.
- [FF18-courbes](#source-ff18-courbes), §8.4.1, main text pp. 245–247. Exact faithful Banach realization and finite-dimensional coefficient embeddings.

<a id="vectorbundlesandisocrystals-vb3-general-bc-standard-dimension-examples"></a>

### Dimensions of standard Banach–Colmez spaces

`VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples` · theorem · implementation `unchecked`.

The Spaces B_m and U_{h,d} are BC's, with Dim B_m = (m,0) and Dim U_{h,d} = (d,h) if d ≥ 0, (−d,−h) if d < 0.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`](#vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence); `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

Proof / construction outline:

1. Combine the companion cohomology of standard O(d/h) with the chosen-untilt fundamental sequence.
2. Identify B_m= BdR⁺/t^m and U_{h,d}: for d≥0 the φ^h=p^d invariants, for d<0 the quotient B_{−d}/Q_p^h.
3. Dimension additivity gives (m,0), (d,h) for d≥0 and (−d,−h) for d<0; unreduced pairs give direct-sum multiplicities.

Suggested declaration: `StandardDimensionExamples`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.
- Concrete instances: Dim B_2=(2,0), Dim U_{2,1}=(1,2), Dim U_{1,−1}=Dim(C/Q_p)=(1,−1).

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Example 3.3, p. 13. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-euler-poincare-height"></a>

### Euler–Poincaré height formula

`VectorBundlesAndIsocrystals:VB3:general-BC/euler-poincare-height` · theorem · implementation `unchecked`.

From the formulas (3.10), ht(H^0(X,O(λ))) − ht(H^1(X,O(λ))) = h for every λ; by additivity this gives ht(H^0(X,E)) − ht(H^1(X,E)) = rk E for every vector bundle E on X, and the formula extends to coherent sheaves.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples`](#vectorbundlesandisocrystals-vb3-general-bc-standard-dimension-examples); [`VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification`](#vectorbundlesandisocrystals-vb2-classification-coherent-sheaf-classification).

Proof / construction outline:

1. Compute heights on every standard positive, zero and shifted negative block.
2. Add over the geometric classification; torsion contributes height zero and rank zero.

Suggested declaration: `EulerPoincareHeight`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.
- Concrete instance: for O(1/2), ht H⁰=2 and H¹=0; for O(−1), H⁰=0 and ht H¹=−1; both differences equal the rank.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Remark 3.11, p. 15. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-bc-hn-invariants"></a>

### Banach–Colmez HN invariants

`VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-invariants` · definition · implementation `unchecked`.

One endows Coh^-_X with rk^-(E_{−1} → E_0) = deg(E_0) − deg(E_{−1}) and deg^-(E_{−1} → E_0) = rk(E_{−1}) − rk(E_0), making it a Harder–Narasimhan category, and transports this to BC, where rk^- = dim and deg^- = −ht; a torsion F_x gives µ^-(BC(0 → F_x)) = 0. One writes W_{≥λ}, W_{>λ} for the Harder–Narasimhan filtration and W_{>−∞} := ∪_λ W_{≥λ}. For λ = d/h in lowest terms, U_λ := U_{h,d}, with U_{eh,ed} = U_λ^e for e ≥ 1, and U_λ = H^0(X,O(λ)) = BC(0 → O(λ)) if λ ≥ 0, U_λ = H^1(X,O(λ)) = BC(O(λ) → 0) if λ < 0; then rk^-(U_λ) = sign(λ)d, deg^-(U_λ) = −sign(λ)h and µ^-(U_λ) = −1/λ.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`](#vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian); [`VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence); [`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`](#vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism).

Proof / construction outline:

1. Transport rank⁻=deg E₀−deg E₋₁ and degree⁻=rank E₋₁−rank E₀ through Le Bras.
2. Equivalently rank⁻=dim and degree⁻=−ht; finite Q_p spaces have slope −∞.
3. For nonzero curve slope λ, slope_BC(U_λ)=−1/λ; torsion sheaves give BC slope zero.

Suggested declaration: `BCHNInvariants`.

Planning API:

- `BCHNInvariants` (data): BC rank=dim, BC degree=−ht, with the zero object assigned no slope.
- `BCHNInvariants.fromHeart` (compatibility): For E₋₁[1]⊕E₀, rank=deg E₀−deg E₋₁ and degree=rank E₋₁−rank E₀.
- `BCHNInvariants.slope` (projection): For positive dimension use −ht/dim; a nonzero dimension-zero object has slope −∞.
- `BCHNInvariants.standard` (compatibility): For a nonzero standard curve slope λ, BC slope of U_λ is −1/λ.
- `BCHNInvariants.additive` (relation): Rank and degree add in a BC short exact sequence; slope does not simply add.

Unit tests:

- `BCHNInvariantsTest.rational` (computation): Q_p has rank zero, degree −1 and slope −∞.
- `BCHNInvariantsTest.affine` (computation): V₁ has rank one, degree zero and slope zero.
- `BCHNInvariantsTest.inversion` (computation): U_{2,1} has BC rank one, degree −2 and slope −2, while O(1/2) has curve rank two and degree one.
- `BCHNInvariantsTest.negative` (computation): U_{1,−1}=H¹(O(−1)) has BC rank one, degree one and slope one.
- `BCHNInvariantsTest.zero` (degenerate): The zero object has BC rank and degree zero and no slope; it is not assigned the slope −∞ of a nonzero finite Q_p space.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:

- VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition: construct HN and connected components
- VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation: compare HN and curvature without conflating them

Sources:

- [CN25-VB3](#source-cn25-vb3), §3.2.5, p. 16. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-bc-hn-decomposition"></a>

### HN decomposition and connected components

`VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition` · theorem · implementation `unchecked`.

(i) Since Q_p = U_0, µ^-(Q_p) = −∞. (ii) BC's are naturally diamonds — among the first non-trivial examples — and as such have connected components: W_{>−∞} is the connected component of 0 and the quotient W_{−∞} is the largest étale quotient, a finite dimensional Q_p-vector space. (iii) The Harder–Narasimhan filtration splits non-canonically and every BC decomposes as (3.14) W = U_{−1/λ_1} ⊕ ⋯ ⊕ U_{−1/λ_r} ⊕ (⊕_x H^0(X,F_x)), with λ_i nonzero in Q ∪ {−∞}, U_{−1/λ_i} of slope λ_i, and F_x torsion supported at x and zero for almost all x with H^0(X,F_x) of slope 0; the λ_i are the slopes of W, to which 0 is added if some F_x is nonzero. (iv) In the sequence of §3.2.4, H^1(X,E_{−1}) is the subspace of slopes > 0 of BC(E_{−1} → E_0).

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-invariants`](#vectorbundlesandisocrystals-vb3-general-bc-bc-hn-invariants); [`VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification`](#vectorbundlesandisocrystals-vb2-classification-coherent-sheaf-classification); [`VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence); `DiamondsAndVStacks:D5/relative-representability`.

Proof / construction outline:

1. Transport classification and HN filtration across Le Bras.
2. Identify the finite Q_p quotient as the maximal étale quotient; its kernel is the connected component of zero.
3. Retain noncanonical splitting and the torsion summands at ALL closed points.

Suggested declaration: `BcHnDecomposition`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Remark 3.13 and (3.14), p. 16. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-artinian-bc"></a>

### Artinian property of BC

`VectorBundlesAndIsocrystals:VB3:general-BC/artinian-bc` · theorem · implementation `unchecked`.

(i) The exact sequence 0 → W_{>−∞} → W → W_{−∞} → 0 makes it possible to show that a decreasing sequence (W_n) of BC's is stationary: dim(W_n) is decreasing and bounded below, hence constant for n ≥ N; then W_N/W_n has dimension 0 and is a quotient of W_N^{−∞}, and ht(W_N/W_n) is increasing and bounded by ht(W_N^{−∞}) < ∞, so W_N/W_n and hence W_n are eventually constant. (ii) Alternatively one uses a presentation to reduce to W = V_d and induces on d, using that a sub-BC of V_1 is either V_1 or a finite dimensional Q_p-vector space; this proof applies verbatim to almost C-representations.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition`](#vectorbundlesandisocrystals-vb3-general-bc-bc-hn-decomposition); [`VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`](#vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian).

Proof / construction outline:

1. In a descending chain, nonnegative integer dimension stabilizes.
2. The resulting dimension-zero quotients factor through the maximal finite Q_p quotient, whose finite height bounds the chain.

Suggested declaration: `ArtinianBc`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Remark 3.15, p. 16. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-bc-morphism-calculus"></a>

### Banach–Colmez morphism calculus

`VectorBundlesAndIsocrystals:VB3:general-BC/bc-morphism-calculus` · comparison · implementation `unchecked`.

For zero-map tilted-heart representatives E₋₁[1]⊕E₀ and F₋₁[1]⊕F₀, BC morphisms are triangular matrices with diagonal Hom(E₋₁,F₋₁), Hom(E₀,F₀) and off-diagonal Ext¹(E₀,F₋₁). End_BC(U_λ)=End(O(λ))=D_λ. For λ=d/h≥0 in lowest terms Hom_BC(U_λ,V₁) has C-dimension h with basis θ∘φ^i, 0≤i<h. All tensor multiplicities and Brauer signs are imported from the companion, not the unqualified rank-one-looking formula in the review paper.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence); [`VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison`](#vectorbundlesandisocrystals-vb2-classification-bundle-endomorphism-comparison); [`VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`](#vectorbundlesandisocrystals-vb0-brauer-invariant-sign); [`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`](#vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus); `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

Proof / construction outline:

1. Under the tilted-heart equivalence compute diagonal Hom and the off-diagonal Ext¹(E₀,F₋₁); the other off-diagonal term vanishes.
2. Use the companion endomorphism algebra for standard blocks, with invariant λ for BUNDLE slope λ.
3. For λ=d/h≥0 the maps U_λ→V₁ are the C-span of θφ^i, i=0,…,h−1, and form a C-vector space of dimension h.

Suggested declaration: `BcMorphismCalculus`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), §3.2.4 and §3.2.6, pp. 15,17. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-embedding-height-bound"></a>

### Height bound for non-affine additive subobjects

`VectorBundlesAndIsocrystals:VB3:general-BC/embedding-height-bound` · theorem · implementation `unchecked`.

For a NONZERO sub-BC W⊂V_N which contains no subobject isomorphic to V₁, dim(W)<ht(W); all its BC HN slopes are <−1. The zero object has no slopes but does not satisfy the strict numerical inequality. Include finite Q_p summands (slope −∞) in the proof.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition`](#vectorbundlesandisocrystals-vb3-general-bc-bc-hn-decomposition); [`VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`](#vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian); [`VectorBundlesAndIsocrystals:VB3:general-BC/bc-morphism-calculus`](#vectorbundlesandisocrystals-vb3-general-bc-bc-morphism-calculus).

Proof / construction outline:

1. Decompose a nonzero subobject of V_N containing no V₁ into stable blocks; include the finite-Q_p boundary λ=0.
2. For λ=d/h>0 factor the injection through the fibre at ∞ to obtain U_λ↪V_h.
3. Cokernel Dimension is (h−d,−h); nonnegative height in dimension zero forces h>d. Do not reverse the printed inequality.

Suggested declaration: `EmbeddingHeightBound`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.
- Concrete instances: U_{2,1}⊂V² has dim 1 < ht 2; the zero subobject satisfies the slope clause vacuously but not dim<ht.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Lemma 3.16, pp. 16–17. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-torsion-point-realization"></a>

### Torsion at an untilt point

`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-point-realization` · comparison · implementation `unchecked`.

For x a closed point, F ↦ H^0(X,F) is an equivalence from torsion coherent sheaves supported at x to finite length B^+_dR(C_x)-modules; such a module is a sum of B_m(C_x) = B^+_dR(C_x)/t_x^m, and the sequence 0 → O --t_x^m--> O(m) → i_{x,*}B_m → 0 together with H^1(X,O) = 0 gives H^0(X,i_{x,*}B_m) = U_m/Q_p t_x^m. Hence End_BC(U_m/Q_p t_x^m) ≅ B_m(C_x), so for m = 1 the endomorphisms are C_x; and for x ≠ ∞, Hom_BC(U_1/Q_p t_x, V_1) = 0 because the two sheaves are supported at distinct points. In the case x = ∞, crucial for the paper's results, t_x = t and U_m/Q_p t^m = B_m, and the object of BC attached to a finite length B^+_dR-module M is simply M ⊗_{B^+_dR} B^+_dR.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence); [`VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison`](#vectorbundlesandisocrystals-vb1-completed-local-ring-comparison); [`VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification`](#vectorbundlesandisocrystals-vb2-classification-coherent-sheaf-classification).

Proof / construction outline:

1. Use the completed local DVR at x and finite-support coherent sheaves.
2. The divisor exact sequence gives H⁰(i_{x,*}B_m(C_x))=U_m/Q_p t_x^m.
3. Compute End as B_m(C_x); distinct-point supports make Hom to V₁ zero when x≠∞.

Suggested declaration: `TorsionPointRealization`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), §3.2.7, pp. 17–18. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-affine-finite-length-equivalence"></a>

### Curvature-zero finite-length modules

`VectorBundlesAndIsocrystals:VB3:general-BC/affine-finite-length-equivalence` · comparison · implementation `unchecked`.

The functor M ↦ M ⊗_{B^+_dR} B^+_dR is an equivalence between the category of B^+_dR-modules of finite length and the subcategory of BC of objects of curvature 0.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-point-realization`](#vectorbundlesandisocrystals-vb3-general-bc-torsion-point-realization); [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature`](#vectorbundlesandisocrystals-vb3-general-bc-curvature).

Proof / construction outline:

1. The completed local DVR realizes finite-length BdR⁺ modules as torsion sheaves at ∞.
2. Under Le Bras, their successive residue-field extensions are exactly curvature-zero BC objects.
3. Prove full faithfulness and essential surjectivity; modules at another closed point need not have curvature zero.

Suggested declaration: `AffineFiniteLengthEquivalence`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Proposition 3.17, p. 18. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-torsion-vs-hom-vanishing"></a>

### VS Hom vanishing from torsion period modules

`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing` · theorem · implementation `unchecked`.

(i) The kernel and cokernel of a morphism of objects of curvature 0 are of curvature 0. (ii) If W is a torsion B^+_dR-Module, i.e. annihilated by t^r for some r ≥ 1, then Hom_VS(W,B^+_dR) = 0 and Hom_VS(W,B_dR) = 0. For (ii) one writes W = W ⊗_{B^+_dR} B^+_dR by Proposition 3.17 and computes Hom_VS(W,B^+_dR) = lim_k Hom_{B^+_dR}(W,B^+_dR/t^k) = Hom_{B^+_dR}(W,B^+_dR) = 0; for B_dR one uses that a BC of dimension 1 is a quotient of Q_p^r ⊕ L_ℓ for L_ℓ the Graph of an additive element, hence one of dimension d a quotient of Q_p^r ⊕ L_{ℓ_1} ⊕ ⋯ ⊕ L_{ℓ_d}, so that the image of any α : W → B_dR factors through t^{−N}B^+_dR for some N.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/affine-finite-length-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-affine-finite-length-equivalence); [`VectorBundlesAndIsocrystals:VB3:general-BC/bc-morphism-calculus`](#vectorbundlesandisocrystals-vb3-general-bc-bc-morphism-calculus); `PadicHodgeTheory:R06.1`.

Proof / construction outline:

1. Curvature-zero kernels and cokernels follow from the finite-length equivalence.
2. For a BC killed by t^r, use the inverse-limit comparison to identify Hom_VS(W,BdR⁺) with the zero Hom into a torsion-free module.
3. For arbitrary VS maps into BdR, prove their image lands in t^{-N}BdR⁺ by the bounded-image argument, then reduce to the preceding vanishing; do not assume the maps BdR-linear.

Suggested declaration: `TorsionVsHomVanishing`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Corollary 3.18, p. 18. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-canonical-curvature-filtration"></a>

### Canonical curvature filtration

`VectorBundlesAndIsocrystals:VB3:general-BC/canonical-curvature-filtration` · construction · implementation `unchecked`.

Every W ∈ BC has a unique filtration W_{>0} ⊂ W_{≥0} ⊂ W, the canonical filtration, with W_{>0} of curvature > 0, W_{≥0}/W_{>0} of curvature 0 and W/W_{≥0} of curvature < 0. One defines W_{>0} as the intersection of the kernels of all morphisms W → B_m, m ≥ 1, and W_{≥0} as the intersection of the kernels of all morphisms W → B_dR; the outer two properties are then clear, while the curvature-0 property of the middle piece comes from the description of the canonical filtration in terms of the Harder–Narasimhan filtration in §3.2.8. One writes W_{≤0} := W/W_{>0}, the largest quotient of curvature ≤ 0, and W_{=0} := W_{≥0}/W_{>0}, the largest affine sub-VS of W_{≤0}. The filtration and a number of results about it are due to Plût; most of them can be recovered from the relation of BC to vector bundles on the Fargues–Fontaine curve and Le Bras's Harder–Narasimhan theory. For W a BC the relation between (3.14) and the filtration of Proposition 3.7 is: W_{>0} ≅ (⊕_{λ_i>0}U_{−1/λ_i}) ⊕ (⊕_{x≠∞}H^0(X,F_x)); W_{≤0} ≅ (⊕_{λ_i<0}U_{−1/λ_i}) ⊕ H^0(X,F_∞) = H^0(X, F_∞ ⊕ (⊕_{λ_i<0}O(−1/λ_i))); W_{<0} ≅ ⊕_{λ_i<0}U_{−1/λ_i}; W_{=0} ≅ H^0(X,F_∞). In particular W is of curvature < 0 if and only if its Harder–Narasimhan slopes are < 0, and if its slopes are > 0 then it is of curvature > 0.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature`](#vectorbundlesandisocrystals-vb3-general-bc-curvature); [`VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition`](#vectorbundlesandisocrystals-vb3-general-bc-bc-hn-decomposition); [`VectorBundlesAndIsocrystals:VB3:general-BC/artinian-bc`](#vectorbundlesandisocrystals-vb3-general-bc-artinian-bc); [`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing`](#vectorbundlesandisocrystals-vb3-general-bc-torsion-vs-hom-vanishing).

Proof / construction outline:

1. Intersect kernels of all W→B_m for W_{>0}, and W→BdR for W_{≥0}.
2. The Artinian BC property reduces these intersections to finite subobjects; the HN/support description identifies their graded pieces.
3. Orthogonality proves uniqueness, functoriality, the largest nonpositive quotient W/W_{>0}, and its maximal affine subobject W_{≥0}/W_{>0}.

Suggested declaration: `BCCanonicalFiltration`.

Planning API:

- `BCCanonicalFiltration` (data): Subobjects W_{>0}≤W_{≥0}≤W with positive, affine and negative graded pieces.
- `BCCanonicalFiltration.positive` (characterisation): W_{>0} is the intersection of kernels of all W→B_m.
- `BCCanonicalFiltration.nonnegative` (characterisation): W_{≥0} is the intersection of kernels of all W→BdR.
- `BCCanonicalFiltration.map` (functoriality): Every BC map preserves these subobjects.
- `BCCanonicalFiltration.nonpositiveQuotient` (universal-property): Every map from W to a nonpositive-curvature BC factors uniquely through W/W_{>0}.
- `BCCanonicalFiltration.affinePart` (universal-property): W_{≥0}/W_{>0} is the maximal affine subobject of W/W_{>0}.

Unit tests:

- `BCCanonicalFiltrationTest.rational` (computation): For Q_p, W_{>0}=W_{≥0}=0.
- `BCCanonicalFiltrationTest.affine` (computation): For V₁, W_{>0}=0 and W_{≥0}=W.
- `BCCanonicalFiltrationTest.positive` (computation): For H¹(O(−1)), W_{>0}=W_{≥0}=W.
- `BCCanonicalFiltrationTest.otherPoint` (non-example): For torsion at x≠∞, W_{>0}=W despite BC HN slope zero; HN cut at zero alone is insufficient.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:

- VectorBundlesAndIsocrystals:VB3:general-BC/nonpositive-curvature-extensions: identify nonpositive-curvature extensions
- VectorBundlesAndIsocrystalsPartII: supply the input to the height categorification h

Sources:

- [CN25-VB3](#source-cn25-vb3), Proposition 3.7 and Remark 3.8, pp. 13–14. The routed statement, with corrections and ownership boundaries recorded explicitly.
- [CN25-VB3](#source-cn25-vb3), §3.2.8, p. 18. Explicit HN slope and closed-point support description of the canonical pieces.

<a id="vectorbundlesandisocrystals-vb3-general-bc-curvature-hn-characterisation"></a>

### Curvature and HN support

`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation` · theorem · implementation `unchecked`.

(i) W is of curvature < 0 (resp. ≤ 0) if and only if W ≅ H^0(X,E) with E a vector bundle of slopes ≥ 0 (resp. the sum of such a bundle and a torsion sheaf supported at ∞). (ii) An extension of two BC's of curvature < 0 (resp. ≤ 0) is again of curvature < 0 (resp. ≤ 0).

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature`](#vectorbundlesandisocrystals-vb3-general-bc-curvature); [`VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition`](#vectorbundlesandisocrystals-vb3-general-bc-bc-hn-decomposition); [`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-point-realization`](#vectorbundlesandisocrystals-vb3-general-bc-torsion-point-realization); [`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing`](#vectorbundlesandisocrystals-vb3-general-bc-torsion-vs-hom-vanishing).

Proof / construction outline:

1. Use the HN decomposition: negative BC slopes are H⁰ of nonnegative bundles, positive slopes are shifted negative bundles.
2. Torsion at ∞ forms the affine middle piece; torsion at x≠∞ belongs to the strictly positive-curvature piece even though its HN slope is zero.
3. Conclude closure of nonpositive/negative curvature under extensions from the heart.

Suggested declaration: `CurvatureHnCharacterisation`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), §3.2.8 and Corollary 3.19, p. 18. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-curvature-hom-orthogonality"></a>

### Curvature orthogonality

`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hom-orthogonality` · theorem · implementation `unchecked`.

(i) If W has curvature > 0 (resp. ≥ 0) and W′ has curvature ≤ 0 (resp. < 0), then Hom_BC(W,W′) = 0. (ii) A sub-VS of one of curvature ≤ 0 (resp. < 0) has curvature ≤ 0 (resp. < 0). (iii) A quotient of one of curvature ≥ 0 (resp. > 0) has curvature ≥ 0 (resp. > 0).

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature`](#vectorbundlesandisocrystals-vb3-general-bc-curvature); [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation`](#vectorbundlesandisocrystals-vb3-general-bc-curvature-hn-characterisation).

Proof / construction outline:

1. Use the Hom definitions and filtrations of BdR⁺-modules to prove orthogonality.
2. Sub-VS embeddings preserve the negative predicates; quotient maps preserve the positive Hom-vanishing predicates.

Suggested declaration: `CurvatureHomOrthogonality`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.
- Concrete instance: Hom_BC(C/Q_p, Q_p)=0 (curvature >0 against <0), while Hom_BC(V₁,V₁)=C is nonzero.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Remark 3.6, p. 13. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-curvature-height-signs"></a>

### Height signs from curvature

`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-height-signs` · theorem · implementation `unchecked`.

Curvature zero implies height zero; NONZERO strictly negative-curvature BC objects have strictly positive height; positive-curvature objects have height ≤0. A nonzero torsion object at x≠∞ has height zero and strictly positive curvature, so ≤ cannot be strengthened to <.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation`](#vectorbundlesandisocrystals-vb3-general-bc-curvature-hn-characterisation); [`VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples`](#vectorbundlesandisocrystals-vb3-general-bc-standard-dimension-examples).

Proof / construction outline:

1. Apply the explicit support decomposition and Dimension on standard blocks.
2. Strict positivity of height for strictly negative curvature requires W≠0; positive curvature only forces ht≤0.

Suggested declaration: `CurvatureHeightSigns`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.
- Concrete instances: B_m has height 0; Q_p has height 1>0; C/Q_p has height −1; U₁/Q_p t_x (x≠∞) has height 0 and curvature >0.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Corollary 3.20 and footnote 9, p. 18. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-curvature-subquotients"></a>

### Curvature subobjects and quotients

`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-subquotients` · theorem · implementation `unchecked`.

Negative/nonpositive curvature is preserved by sub-BCs; positive/nonnegative curvature is preserved by quotients. A height-zero subobject of a nonpositive-curvature object has curvature zero. The printed dual quotient assertion is false: a height-zero quotient of a nonnegative-curvature BC has HN slope zero (torsion support), and has curvature zero if and only if its support is at ∞.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation`](#vectorbundlesandisocrystals-vb3-general-bc-curvature-hn-characterisation); [`VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`](#vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian).

Proof / construction outline:

1. Use negative-curvature embeddings for subobjects and positive Hom vanishing for quotients.
2. A height-zero subobject of a nonpositive-curvature BC is affine by the torsion-at-∞ characterization.
3. Correct the false quotient assertion: height-zero nonnegative-curvature quotients have HN slope zero, and curvature zero exactly when supported at ∞.

Suggested declaration: `CurvatureSubquotients`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.
- Counterexample to the printed (iv): the identity quotient of U₁/Q_p t_x (x≠∞) has height 0 and curvature >0.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Corollary 3.21, p. 18; corrected (iv). The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-torsion-subobjects-height"></a>

### Height of torsion period subobjects

`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-subobjects-height` · theorem · implementation `unchecked`.

A sub-BC U of a torsion B^+_dR-Module W satisfies ht(U) ≥ 0, and is itself a torsion B^+_dR-Module if and only if ht(U) = 0. This can also be proved without the Harder–Narasimhan decomposition, by induction on the length of W, using that a sub-BC of V_1 is either V_1 or a finite dimensional Q_p-vector space and that an extension of B^+_dR-Modules is one; that proof extends verbatim to almost C-representations, thanks to Proposition 2.5.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-subquotients`](#vectorbundlesandisocrystals-vb3-general-bc-curvature-subquotients); [`VectorBundlesAndIsocrystals:VB3:general-BC/affine-finite-length-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-affine-finite-length-equivalence).

Proof / construction outline:

1. Apply the preceding subobject theorem to an affine torsion BdR⁺ object.
2. Nonnegative height follows by dévissage; height zero identifies a finite-length BdR⁺ module via the curvature-zero equivalence.

Suggested declaration: `TorsionSubobjectsHeight`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Remark 3.22, p. 19. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-generating-image-cokernel"></a>

### Cokernel of a generating period-module image

`VectorBundlesAndIsocrystals:VB3:general-BC/generating-image-cokernel` · theorem · implementation `unchecked`.

Let f : W_1 → W_2 be a morphism of BC's with W_2 a B^+_dR-Module whose image generates it as a B^+_dR-Module. Then coker(f), if nonzero, is of curvature > 0 and height < 0. One may assume f injective and not surjective; then W_1 = H^0(X,F_1), W_2 = H^0(X,F_2) with F_1, F_2 of vanishing H^1 and F_2 supported at ∞, and f induced by f_X : F_1 → F_2, which the generation hypothesis makes surjective and the injectivity makes H^0(X,ker f_X) = 0; vanishing of H^1(X,F_1) gives coker(f) ≅ H^1(X,ker f_X). Since F_1 is not torsion — else it would be supported at ∞, making W_1 a B^+_dR-module and f surjective — neither is ker f_X, and its H^0 being zero its slopes are < 0, whence the conclusion.

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation`](#vectorbundlesandisocrystals-vb3-general-bc-curvature-hn-characterisation); [`VectorBundlesAndIsocrystals:VB3:general-BC/euler-poincare-height`](#vectorbundlesandisocrystals-vb3-general-bc-euler-poincare-height); [`VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence).

Proof / construction outline:

1. Replace the map by its image; realize both objects through the curve with vanishing H¹.
2. Generation makes the coherent map surjective; BC injectivity kills H⁰ of its kernel.
3. The nonzero cokernel is H¹ of a negative vector bundle, hence positive-curvature and strictly negative height.

Suggested declaration: `GeneratingImageCokernel`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.
- Concrete instance: Q_p→B₁=C has image generating C as a BdR⁺-module and cokernel C/Q_p, of curvature >0 and height −1.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Proposition 3.23, p. 19. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-nonpositive-curvature-extensions"></a>

### Nonpositive curvature extension criterion

`VectorBundlesAndIsocrystals:VB3:general-BC/nonpositive-curvature-extensions` · comparison · implementation `unchecked`.

For W ∈ BC the following are equivalent: (i) W is of curvature ≤ 0; (ii) there is an exact sequence (3.25) 0 → V → W → M → 0 with M of curvature 0 and V finite dimensional over Q_p. For (i)⇒(ii) one writes W = H^0(X,F_∞) ⊕ (⊕_{d_i/h_i≥0}U_{d_i/h_i}) and uses the sequences 0 → Q_p^{h_i} → U_{d_i/h_i} → B_{d_i} → 0, taking V = ⊕ Q_p^{h_i}; the converse is Corollary 3.19(ii).

Hypotheses:

- E=Q_p. As in CN §1 and §1.3.3, C is the completion of an algebraic closure of a complete discretely valued field K of characteristic 0 whose perfect residue field is countable; hence O_C/p is countable, which CN use (footnote 6) to keep sympathetic closures separable and Hahn–Banach available. ∞ is the point of X_FF with residue field C, t=t_∞. Sympathetic algebras carry the two extra CN conditions (evaluation into C(Spm Λ,C) injective; separable). SW20 Definition 15.2.1 and Theorem 15.2.12 are stated for any algebraically closed nonarchimedean C/Q_p.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation`](#vectorbundlesandisocrystals-vb3-general-bc-curvature-hn-characterisation); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence); [`VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples`](#vectorbundlesandisocrystals-vb3-general-bc-standard-dimension-examples).

Proof / construction outline:

1. Use 0→Q_p^h→U_{h,d}→B_d→0 on each nonnegative bundle block.
2. Sum these sequences and the ∞-torsion piece to present W as an extension of an affine object by a finite Q_p space.
3. The converse follows from extension closure.

Suggested declaration: `NonpositiveCurvatureExtensions`.

Acceptance checks:

- Compare the Q_p, V₁, shifted O(−1), and other-untilt torsion cases; never infer curvature solely from height.
- Concrete instance: 0→Q_p→U_{1,1}→B₁→0 presents U_{1,1} (curvature <0) as an extension of an affine object by Q_p.

Downstream uses:



Sources:

- [CN25-VB3](#source-cn25-vb3), Lemma 3.24, p. 19. The routed statement, with corrections and ownership boundaries recorded explicitly.

<a id="vectorbundlesandisocrystals-vb3-general-bc-semistable-period-example"></a>

### Dimension of the semistable period space

`VectorBundlesAndIsocrystals:VB3:general-BC/semistable-period-example` · application · implementation `unchecked`.

For the supercuspidal rank-two slope-1/2 L-(φ,N,G_F)-module M of CDN §2.1.2, X_st⁺(M)=(B_cris⁺⊗M)^{φ=p} is a positive Banach–Colmez space of L-Dimension ([L:Q_p],2). The one-dimensional multiplicity conclusion of Lemma 2.7 also uses the admissibility/p-adic Hodge representation input; it is not deduced from Dimension for an arbitrary rank-two module.

Hypotheses:

- Retain the paper’s supercuspidal hypothesis, coefficient action, and normalization of L-Dimension.
- No extension to arbitrary rank-two M or a new local-Langlands theorem is claimed.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples`](#vectorbundlesandisocrystals-vb3-general-bc-standard-dimension-examples); [`VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`](#vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian); [`VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`](#vectorbundlesandisocrystals-vb3-general-bc-families-of-banach-colmez-spaces); `PadicHodgeTheory:R06.2`.

Proof / construction outline:

1. Identify X_st⁺ as the positive section object after the φ=p twist; use the standard positive Dimension calculation.
2. Export its source-normalized L-Dimension to the routed Drinfeld-tower consumer.
3. Use R06.2 only for the representation-theoretic uniqueness/multiplicity application; the tower cohomology remains with its owner.

Suggested declaration: `SemistablePeriodExample`.

Acceptance checks:

- A slope-zero rank-two module does not have this positive Dimension.

Downstream uses:



Sources:

- [CDN20](#source-cdn20), §2.1.2, author preprint p. 21; published p. 328. Positive BC example with its source coefficient normalization.

<a id="vectorbundlesandisocrystals-vb3-general-bc-positive-range-dimension"></a>

### Dimension in the positive range

`VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension` · theorem · implementation `unchecked`.

For bundles E₀,E₁ with E₀ everywhere positive and E₁ everywhere negative, the cohomologically smooth relative BCcomplex([E₁→E₀]) has locally constant dimension deg(E₀)−deg(E₁), componentwise. In particular a positive bundle E has BC dimension deg(E); a negative bundle has shifted BC dimension −deg(E). Geometrically these are the first entries of the BC Dimension; height is rank(E₀)−rank(E₁). Slope-zero section sheaves are locally profinite of dimension zero via the E-local-system equivalence.

Hypotheses:

- Use the canonical geometric degree and fixed coefficient field E.
- Diamond relative dimension is the cohomologically smooth dimension, not the rank or height; the numeric Dimension comparison is classical Q_p over fixed C.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`](#vectorbundlesandisocrystals-vb3-general-bc-families-of-banach-colmez-spaces); [`VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`](#vectorbundlesandisocrystals-vb3-general-bc-positive-slope-resolution); [`VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations`](#vectorbundlesandisocrystals-vb3-general-bc-strict-positive-etale-presentations); [`VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`](#vectorbundlesandisocrystals-vb4-slope-zero-local-systems); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples`](#vectorbundlesandisocrystals-vb3-general-bc-standard-dimension-examples); `DiamondSixOperations:S5`.

Proof / construction outline:

1. For standard blocks read the numerator dimension from the open-ball calculation and negative exact-sequence presentation.
2. Positive presentations and pro-étale trivialization of slope-zero kernels reduce arbitrary positive bundles to those blocks.
3. The exact sequence in the two-term theorem and six-operations dimension additivity give the difference of degrees; the classical Dimension theorem identifies height.

Suggested declaration: `PositiveRangeDimension`.

Acceptance checks:

- O(1/2) has rank two and BC dimension one; height two.
- A slope-zero rank-two local system has geometric dimension zero.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Definition I.3.5 and examples, p. 19; II.3.5, pp. 79–81. Basic ball dimension, extended through exact presentations.
- [CN25-VB3](#source-cn25-vb3), Example 3.3 and §3.2.5, pp. 13,16. Classical Dimension comparison.

<a id="vectorbundlesandisocrystals-vb4"></a>

## VB4 — Relative slopes, ampleness and local systems

Ordinary projectivized properness supplies upper semicontinuity and constant-polygon HN descent. KL purity and Robba theory retain their lower-polygon normalization and local/global model distinction. Rational local systems and integral boundary lattices are separate comparisons; integral group torsors require their connected-fibre reconstruction input.

Planets: [HN semicontinuity](#vectorbundlesandisocrystals-vb4-semicontinuity-of-hn-polygon); [Relative Harder–Narasimhan filtration](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); [Slope-zero local systems](#vectorbundlesandisocrystals-vb4-slope-zero-local-systems); [Pure models](#vectorbundlesandisocrystals-vb4-pure-models); [Ampleness and positive slopes](#vectorbundlesandisocrystals-vb4-ample-iff-pointwise); [Twisted rational local systems](#vectorbundlesandisocrystals-vb4-twisted-local-systems).

<a id="vectorbundlesandisocrystals-vb4-semicontinuity-of-hn-polygon"></a>

### FS II.2.19(i): upper semicontinuity of the Harder-Narasimhan polygon in families

`VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon` · theorem · implementation `unchecked`.

For a constant-rank n bundle E on X_S, the concave HN polygon, horizontal coordinate rank and decreasing slopes repeated with their ranks, is upper semicontinuous on |S|: for every x∈[0,n] its ordinate is upper semicontinuous. Rank and total degree are locally constant. This is FS II.2.19(i), including equal-characteristic coefficient fields. The polygon is the UPPER boundary of the convex hull of the exterior-power section points; do not replace it by KL’s convex lower polygon.

Hypotheses:

- S is perfectoid over F_q; rank n is constant on the component considered.
- Geometric-point values are invariant under extension of the complete algebraically closed field.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`](#vectorbundlesandisocrystals-vb3-projectivized-properness-properness-of-projectivized-bc); [`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon`](#vectorbundlesandisocrystals-vb1-harder-narasimhan-polygon); [`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`](#vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change`](#vectorbundlesandisocrystals-vb2-classification-hn-filtration-base-change).

Proof / construction outline:

1. Properness of punctured scalar quotients makes the nonzero-section locus closed.
2. Apply this to all exterior powers and negative twists; the maximal integral degrees of sections recover the upper convex-hull boundary.
3. Rank and determinant degree determine locally constant endpoints; use the companion normalization rather than swapping rank and degree axes.

Suggested declaration: `SemicontinuityOfHnPolygon`.

Acceptance checks:

- Verify the convex-hull description of the polygon on a rank-2 example with slopes 0 and 1
- Exhibit a family where the polygon jumps and check the direction of semicontinuity
- Check where Thm. II.2.14 enters: only at geometric points, to identify the HN polygon with the upper convex hull of the points (i,d_i), d_i maximal with H⁰((∧^iE)(−d_i))≠0; the properness input II.2.16 is itself classification-free.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Theorem II.2.19(i) and proof, p. 74. Exact source contract, with the conventions and corrections stated in this node.

<a id="vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting"></a>

### FS II.2.19(ii): the global HN filtration on constant-polygon loci and its pro-etale splitting

`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting` · theorem · implementation `unchecked`.

Assume the HN polygon of E is constant on S. Then there exists a global separated exhaustive decreasing Harder-Narasimhan filtration E^{>= lambda} in E specialising to the HN filtration at each point; and after replacing S by a PRO-ETALE cover the filtration can be split, with isomorphisms E^lambda = O_{X_S}(lambda)^{n_lambda} for integers n_lambda >= 0.

Hypotheses:

- S is perfectoid over F_q, the bundle has constant rank and constant geometric HN polygon.
- Splitting is PRO-ÉTALE local; it is not asserted étale local or globally split.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon`](#vectorbundlesandisocrystals-vb4-semicontinuity-of-hn-polygon); [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`](#vectorbundlesandisocrystals-vb3-projectivized-properness-properness-of-projectivized-bc); [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`](#vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus); `DiamondsAndVStacks:D3/locally-profinite-torsors`; `DiamondEtaleCohomology:C4`; [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`](#vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology).

Proof / construction outline:

1. Let λ be the maximal slope and F=Hom(O(λ),E). BC(F)∖{0}→(BC(F)∖{0})/E^×→S is a v-cover (an E^×-torsor, then a proper map surjective on geometric points, ECD Lemma 12.11); over it there is a map O(λ)→E nonzero in every fibre. Its dual E^∨→O(−λ) is surjective by stability of O(−λ), so the cokernel E′ is a bundle with constant HN polygon.
2. Induct on rank; by II.2.5(i)–(ii) the extension of ⊕O(λ′)^{n_λ′} (λ′≤λ) by O(λ) splits after a further pro-étale cover, and the global filtration exists v-locally and descends (v-descent of bundles). Splitting of the filtration uses II.2.5(iii).
3. The graded isomorphism sheaf is a torsor for the relevant locally profinite automorphism groups; D3 makes it pro-étale.

Suggested declaration: `RelativeHnFiltrationAndProetaleSplitting`.

Acceptance checks:

- Verify that v-local splitting really upgrades to pro-etale and not to etale
- Verify the surjectivity of the dual map at a geometric point using stability of O(-lambda)
- Exhibit a constant-polygon family where the filtration does not split Zariski-locally

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Theorem II.2.19(ii) and proof, pp. 74–75. Exact source contract, with the conventions and corrections stated in this node.

<a id="vectorbundlesandisocrystals-vb4-slope-zero-local-systems"></a>

### FS II.2.20: slope-zero bundles are pro-etale E-local systems

`VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems` · theorem · implementation `unchecked`.

There is an exact tensor equivalence between finite-rank pro-étale E-local systems on S and vector bundles on X_S whose EVERY geometric HN slope is zero, via L↦L⊗_E O_X. The quasi-inverse is T↦H⁰(X_T,E_T); it commutes with perfectoid base change and coefficient extension with its normalized Frobenius. Locally constant rank is handled componentwise. Total degree zero alone does not suffice.

Hypotheses:

- The condition is that the HN polygon is CONSTANT ZERO, i.e. everywhere semistable of slope 0, not merely fibrewise trivial
- Full faithfulness is proved by pro-étale descent, reducing to L trivial, and then by Prop. II.2.5(ii): H⁰(X_S,O)=underline E(S), the locally constant E-valued functions on |S|, and RΓ(X_S,O)=RΓ_proét(S,E)
- Essential surjectivity is Thm. II.2.19(ii) applied with a single slope 0
- A local system is not the same as a globally trivial bundle: the descent datum is the content

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); [`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); `DiamondsAndVStacks:D3/locally-profinite-torsors`; `mathlib:CategoryTheory.Equivalence`; [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists).

Proof / construction outline:

1. Full faithfulness: descend pro-etale-locally to L trivial and apply Prop. II.2.5(ii) to identify Hom.
2. Essential surjectivity: apply Thm. II.2.19(ii) to E with constant zero polygon; pro-etale locally E is trivial, and the descent datum gives the local system.

Suggested declaration: `SlopeZeroLocalSystems`.

Acceptance checks:

- Exhibit a slope-zero bundle with nontrivial monodromy, i.e. a nonconstant local system, confirming that pro-etale triviality is not global triviality
- Check tensor and scalar-extension compatibility of the equivalence
- Check that a bundle with fibrewise slope 0 but nonconstant polygon is excluded

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Corollary II.2.20, p. 75. Exact source contract, with the conventions and corrections stated in this node.

<a id="vectorbundlesandisocrystals-vb4-relative-cohomology-vanishing"></a>

### Slope-dependent cohomology vanishing

`VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing` · theorem · implementation `unchecked`.

For a bundle E on X_S: everywhere negative slopes imply H⁰(X_S,E)=0, universally after perfectoid base change; everywhere nonnegative slopes imply H¹(X_S,E)=0 after some pro-étale cover of S; everywhere positive slopes imply an étale cover S′→S such that H¹(X_T,E_T)=0 for EVERY affinoid perfectoid T/S′. The second assertion is local vanishing of cohomology, not vanishing on every original S.

Hypotheses:

- S∈Perf_Fq; slope assertions hold at all geometric points.

Prerequisites: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-banach-colmez-space-definition); [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); [`VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`](#vectorbundlesandisocrystals-vb3-general-bc-positive-slope-resolution); [`VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations`](#vectorbundlesandisocrystals-vb3-general-bc-strict-positive-etale-presentations); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`](#vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology).

Proof / construction outline:

1. Check H⁰=0 on geometric points and use v-descent.
2. Resolve a nonnegative bundle by a slope-zero bundle and negative twists; use relative HN and the identification H¹(O)=H¹_proét(S,E), which vanishes pro-étale locally.
3. For strict positivity use the étale presentation by O(1/r), then the standard positive-twist H¹ vanishing on affinoids.

Suggested declaration: `RelativeCohomologyVanishing`.

Acceptance checks:

- O is the boundary case: H¹_proét(S,E) can be nonzero before a cover.

Downstream uses:



Sources:

- [FS-geometrization](#source-fs-geometrization), Proposition II.3.4(i)–(iii), p. 79. Keeps the universal-affinoid clause only in the strictly positive étale case.

<a id="vectorbundlesandisocrystals-vb4-annular-basis-approximation"></a>

### Annular basis approximation

`VectorBundlesAndIsocrystals:VB4/annular-basis-approximation` · theorem · implementation `unchecked`.

Let M be a φ^a-module over ℛ̃_R with models M_r. (7.1.1) If v_1, …, v_n is a basis of M_{[r/q,r]} on which φ^a acts via an invertible matrix over ℛ̃^{r/q}_R, then it is a basis of M_r. (7.1.2) Let h ≥ 0, let D be diagonal with entries p^{d_1}, …, p^{d_n} (d_i ∈ ℤ, no two differing by more than h), and let e_1, …, e_n be a basis of M_{[r/q,r]} on which φ^a acts via F over ℛ̃^{[r/q,r/q]}_R with λ(α^{r/q})(FD − 1) < p^{−h}. Then M_r has a basis v_j = Σ_i U_{ij} e_i on which φ^a acts via F′ with F′D − 1 having entries in pℛ̃^{int,r/q}_R, where λ(α^{r/q})(U − 1), λ(α^r)(D^{−1}UD − 1) < p^{−h}.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`](#vectorbundlesandisocrystals-vb1-annular-frobenius-descent); [`VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`](#vectorbundlesandisocrystals-vb1-tilted-robba-ring).

Proof / construction outline:

1. Extend an annular basis inward with Frobenius and finite-projective gluing (7.1.1).
2. For 7.1.2 correct the gauge matrices iteratively; the norm error strictly decreases, so the matrices converge. Preserve FD−1, not FD^{-1}−1, in the estimates.

Suggested declaration: `AnnularBasisApproximation`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §7.1, Lemmas 7.1.1–7.1.2, pp. 145–146. The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-pure-models"></a>

### Pure models and purity loci

`VectorBundlesAndIsocrystals:VB4/pure-models` · definition · implementation `unchecked`.

Let c, d ∈ ℤ with d a positive multiple of a. A (c,d)-pure model of a φ^a-module M over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R) is a W(R)-submodule (resp. ℛ̃^int_R-submodule) M_0 of M which is bounded (there is a finitely generated submodule N_0 over the same subring with p^n M_0 ⊆ N_0 and p^n N_0 ⊆ M_0 for some n ≥ 0) such that the natural map M_0 ⊗_{W(R)} ℰ̃_R → M (resp. M_0 ⊗_{ℛ̃^int_R} ℛ̃^bd_R → M, M_0 ⊗_{ℛ̃^int_R} ℛ̃_R → M) is an isomorphism and the φ^a-action on M induces an isomorphism (p^cφ^d)^*M_0 ≅ M_0 (only stability of M_0[p^{−1}] under φ^d, not φ^a, is assumed; Remark 7.3.2). Its existence makes M pointwise pure of constant slope c/d; a (0,d)-pure model is an étale model; a pure model is (locally) free if its underlying module is finite (locally) free, and a finitely presented pure model is locally free. A (locally free, free) local (c,d)-pure model at β ∈ ℳ(R) is a rational localization R → R′ encircling β together with a (locally free, free) (c,d)-pure model of the base extension of M to R′. M has a locally free local pure model at β iff it has a free one, and over ℛ̃^bd_R this can be tested over ℰ̃_R (Lemma 7.3.3). M is pure of slope s at β if it has a locally free local (c,d)-pure model at β with c/d = s (forcing s = μ(M, β) when rank(M, β) > 0; every slope when the rank is 0), pure if it is pure at every β (finitely many local models then cover ℳ(R)), étale = pure of slope 0, and globally pure if it has a locally free pure model. For the conditions (a) globally pure, (b) admits a pure model, (c) pure, (d) admits local pure models, (e) pointwise pure: over ℰ̃_R and ℛ̃^bd_R, (a) strictly implies (b) and (b)–(e) are equivalent; over ℛ̃_R, (a) strictly implies (b), (b) strictly implies (c), and (c)–(e) are equivalent (by Corollaries 7.3.9 and 8.5.14 and Examples 8.5.17 (Tate curve) and 8.5.18 (banana)). Purity of a φ^a-module over ℛ̃^bd_R cannot be read off from its base extension to ℛ̃_R.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`](#vectorbundlesandisocrystals-vb1-robba-frobenius-modules); [`VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`](#vectorbundlesandisocrystals-vb1-tilted-robba-ring); `mathlib:Submodule`.

Proof / construction outline:

1. Use bounded integral submodules generating M by scalar extension, with p^cφ^d-linearized action an isomorphism.
2. Localize rationally around a seminorm to define local models; finite presentation gives local freeness.
3. Separate globally pure from locally pure; zero-rank fibres count as pure of every slope.

Suggested declaration: `PureModel`.

Planning API:

- `PureModel` (data): A bounded integral submodule generating the ambient Frobenius module, with p^cφ^d linearization invertible.
- `PureModel.lattice` (projection): The integral lattice is a Submodule of the restricted-scalars module, with its actual inclusion.
- `PureModel.baseChange` (functoriality): Rational localization transports the pure model, its boundedness and its Frobenius isomorphism.
- `PureModel.etale` (characterisation): A (0,d)-pure model is an étale model; globally pure means a globally finite locally free such model.
- `PureModel.fibreSlope` (compatibility): On a nonzero fibre a (c,d)-pure model forces the Robba slope c/d, with p^cφ^d=1 on a trivializing basis.

Unit tests:

- `PureModelTest.unit` (computation): The trivial φ-module with unit integral lattice is (0,a)-pure.
- `PureModelTest.zero` (degenerate): The zero module is pure of every slope; it has no distinguished numeric slope.
- `PureModelTest.scaled` (computation): A rank-one action φ^d=p^{−c} with standard lattice is (c,d)-pure, detecting the sign of p^c.
- `PureModelTest.localNotGlobal` (non-example): The perfected Tate-curve local system with p monodromy is locally étale but has no global integral étale model.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:

- VectorBundlesAndIsocrystals:VB4/purity-openness: spread integral fibre lattices to neighbourhoods
- VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems: identify local models with twisted local systems

Sources:

- [KL15](#source-kl15), §7.3, Definitions 7.3.1 and 7.3.4, Lemma 7.3.3 and Remarks 7.3.2, 7.3.5, 7.3.11, pp. 147–152. The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-pure-model-trivialization"></a>

### Pro-étale trivialization of pure models

`VectorBundlesAndIsocrystals:VB4/pure-model-trivialization` · theorem · implementation `unchecked`.

If a φ^a-module M over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R) has a free (c,d)-pure model M_0, there is an R-algebra S, the completed direct limit of faithfully finite étale R-subalgebras, such that M_0 ⊗ W(S) (resp. M_0 ⊗ ℛ̃^int_S) has a basis fixed by p^cφ^d.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/pure-models`](#vectorbundlesandisocrystals-vb4-pure-models).

Proof / construction outline:

1. Trivialize modulo p by Lang/Artin–Schreier–Witt torsors.
2. Correct the invariant basis p-adically and use contraction to keep it in the integral Robba subring; the extension is a COMPLETED finite-étale direct limit.

Suggested declaration: `PureModelTrivialization`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §7.3, Proposition 7.3.6, p. 149. The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-purity-openness"></a>

### Openness and pointwise detection of purity

`VectorBundlesAndIsocrystals:VB4/purity-openness` · theorem · implementation `unchecked`.

Let M be a φ^a-module over ℛ̃_R of nowhere zero rank, β a point of its pure locus, and c, d ∈ ℤ with d a positive multiple of a and c/d = μ(M, β). Every (c,d)-pure model of M ⊗ ℛ̃_{ℋ(β)} extends to a free local (c,d)-pure model of M at β (Theorem 7.3.7). Consequently, for any φ^a-module M over ℛ̃_R: the pure and étale loci are open; M is étale (resp. pure) iff it is pointwise étale (resp. pointwise pure); and M is pure at β iff it has a (not necessarily locally free) local pure model at β.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/annular-basis-approximation`](#vectorbundlesandisocrystals-vb4-annular-basis-approximation); [`VectorBundlesAndIsocrystals:VB4/pure-models`](#vectorbundlesandisocrystals-vb4-pure-models).

Proof / construction outline:

1. Use a good pure fibre basis, spread its annular approximation to a rational neighbourhood, and correct it by the gauge estimate.
2. Localize to make the integral lattice free; compactness supplies a finite rational cover of all seminorms.

Suggested declaration: `PurityOpenness`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §7.3, Theorem 7.3.7 and Corollaries 7.3.8–7.3.10, pp. 150–151. The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-diagonal-gauge-normal-form"></a>

### Diagonal Frobenius gauge normal form

`VectorBundlesAndIsocrystals:VB4/diagonal-gauge-normal-form` · lemma · implementation `unchecked`.

Let M be a φ^a-module over ℛ̃^bd_R with a basis on which φ^a acts via AD, D diagonal with entries in p^ℤ and A − 1 with entries in pℛ̃^int_R. Then there are an R-algebra S which is the union (not only the completed union) of faithfully finite étale R-subalgebras and an invertible U over W(S), congruent to 1 modulo p, with U^{−1}ADφ^a(U) = D. In particular, at every β ∈ ℳ(R) the generic slopes of M are the negatives of the p-adic valuations of the diagonal entries of D, divided by a.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/annular-basis-approximation`](#vectorbundlesandisocrystals-vb4-annular-basis-approximation).

Proof / construction outline:

1. Solve the off-diagonal gauge equations by p-adic iteration after finite étale extensions.
2. For every residue precision only finitely many étale extensions are needed; the coefficients live in their UNION, rather than requiring its completion.

Suggested declaration: `DiagonalGaugeNormalForm`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §7.4, Lemma 7.4.4, p. 152. The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-robba-polygon-semicontinuity"></a>

### Robba slope-polygon semicontinuity

`VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity` · theorem · implementation `unchecked`.

For any φ^a-module M over ℛ̃_R, β ↦ the slope polygon of M ⊗ ℛ̃_{ℋ(β)} is lower semicontinuous on ℳ(R): where the rank is constant, for each x ∈ [0, rank M] the y-coordinate of the polygon at x is a lower semicontinuous function of β, and it is locally constant at x = rank M.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/annular-basis-approximation`](#vectorbundlesandisocrystals-vb4-annular-basis-approximation); [`VectorBundlesAndIsocrystals:VB4/diagonal-gauge-normal-form`](#vectorbundlesandisocrystals-vb4-diagonal-gauge-normal-form); [`VectorBundlesAndIsocrystals:VB4/pure-models`](#vectorbundlesandisocrystals-vb4-pure-models); `PadicDifferentialEquationsAndRigidCohomology:RD.2/special-polygon-above-generic`; [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`](#vectorbundlesandisocrystals-vb1-robba-bundle-equivalence); [`VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change`](#vectorbundlesandisocrystals-vb2-classification-hn-filtration-base-change).

Proof / construction outline:

1. At β pass to a completed algebraic closure L of ℋ(β): by Proposition 4.2.16 (Dieudonné–Manin over ℛ̃_L) φ^d acts on a basis by a diagonal matrix D with entries in p^ℤ; slope polygons do not change under extension of analytic fields (Remark 7.4.2).
2. Approximate this basis and apply Lemma 7.1.2 as in Theorem 7.3.7: over a rational localization encircling β and a faithfully finite étale cover, φ^d acts by FD with F−1 ≡ 0 mod p over ℛ̃^int, spanning a bounded model N.
3. By Lemma 7.4.4 the generic polygon of N at every nearby point is the polygon at β; by Proposition 7.4.3(a) the special polygon, i.e. the polygon of M there, lies on or above it. The endpoint is locally constant (Lemma 7.2.2).

Suggested declaration: `RobbaPolygonSemicontinuity`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §7.4, Theorem 7.4.5, p. 153. The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-bounded-polygons-dense-locus"></a>

### Bounded polygons and dense constant loci

`VectorBundlesAndIsocrystals:VB4/bounded-polygons-dense-locus` · theorem · implementation `unchecked`.

For any φ^a-module M over ℛ̃_R, the slope polygons of M at the points of ℳ(R) are bounded above and below (all slopes are at least −N/a for N as in Proposition 6.2.4, and the sum of the slopes is continuous). Hence the polygon takes finitely many values locally, and there is an open dense U ⊆ ℳ(R) on which it is locally constant.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [`VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity`](#vectorbundlesandisocrystals-vb4-robba-polygon-semicontinuity).

Proof / construction outline:

1. Global generation of a sufficiently positive twist bounds the slopes below; determinant degree bounds them above.
2. Bounded slopes of fixed finite rank and discrete denominators give finitely many polygons; semicontinuity gives a dense open locus of local constancy.

Suggested declaration: `BoundedPolygonsDenseLocus`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §7.4, Proposition 7.4.6 and Corollary 7.4.7, pp. 153–154. The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-constant-vertex-submodule"></a>

### Submodule at a constant polygon vertex

`VectorBundlesAndIsocrystals:VB4/constant-vertex-submodule` · theorem · implementation `unchecked`.

(7.4.8) Let A be an n × n matrix over ℛ̃^int_R invertible over ℛ̃^bd_R, x_1, …, x_n ∈ ℛ̃^bd_R, and y_1, …, y_n ∈ ℰ̃_R with y_i − x_i = Σ_j A_{ij}φ^a(y_j). Then all y_i lie in ℛ̃^bd_R iff their images lie in ℛ̃^bd_{ℋ(β)} for every β ∈ ℳ(R). (7.4.9) Let M over ℛ̃_R have constant rank n and slopes μ_1(M,β) ≥ ⋯ ≥ μ_n(M,β) at β. If for some m ∈ {1, …, n−1} and all β we have μ_m(M,β) > μ_{m+1}(M,β) and μ_1 + ⋯ + μ_m constant, there is a unique φ^a-submodule N of rank m with M/N a φ^a-module such that at every β the slopes of N are μ_1, …, μ_m and those of M/N are μ_{m+1}, …, μ_n.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity`](#vectorbundlesandisocrystals-vb4-robba-polygon-semicontinuity); [`VectorBundlesAndIsocrystals:VB4/pure-models`](#vectorbundlesandisocrystals-vb4-pure-models); `PadicDifferentialEquationsAndRigidCohomology:RD.2/coincident-polygons-common-filtration`; [`VectorBundlesAndIsocrystals:VB4/diagonal-gauge-normal-form`](#vectorbundlesandisocrystals-vb4-diagonal-gauge-normal-form).

Proof / construction outline:

1. Use the uniformly bounded Frobenius difference-equation criterion 7.4.8 to descend the fibrewise summand to bounded Robba coefficients.
2. Take the exterior-power line for the fixed vertex and descend its associated submodule; uniqueness follows from separated slopes.
3. The quotient is finite projective. A global splitting is not a conclusion.

Suggested declaration: `ConstantVertexSubmodule`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §7.4, Lemma 7.4.8 and Theorem 7.4.9, pp. 154–155. The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-robba-constant-polygon-filtration"></a>

### Robba filtration on a constant-polygon locus

`VectorBundlesAndIsocrystals:VB4/robba-constant-polygon-filtration` · theorem · implementation `unchecked`.

If the slope polygon of a φ^a-module M over ℛ̃_R is constant on ℳ(R), there is a unique filtration 0 = M_0 ⊂ ⋯ ⊂ M_l = M by φ^a-submodules whose quotients are φ^a-modules pure of constant slope with μ(M_1/M_0) > ⋯ > μ(M_l/M_{l−1}).

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/constant-vertex-submodule`](#vectorbundlesandisocrystals-vb4-constant-vertex-submodule); [`VectorBundlesAndIsocrystals:VB4/purity-openness`](#vectorbundlesandisocrystals-vb4-purity-openness).

Proof / construction outline:

1. Apply the constant-vertex theorem at each strict break.
2. Induct on rank, obtain pure graded pieces by pointwise purity, and use uniqueness for gluing.

Suggested declaration: `RobbaConstantPolygonFiltration`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §7.4, Corollary 7.4.10, p. 155. The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-negative-frobenius-cohomology-detection"></a>

### Pointwise detection of negative Frobenius cohomology

`VectorBundlesAndIsocrystals:VB4/negative-frobenius-cohomology-detection` · theorem · implementation `unchecked`.

If M over ℛ̃_R has everywhere negative slopes, then H^0_{φ^a}(M) = 0, H^0_{φ^a}(M ⊗ ℛ̃_{ℋ(β)}) = 0 for all β ∈ ℳ(R), and H^1_{φ^a}(M) → ∏_β H^1_{φ^a}(M ⊗ ℛ̃_{ℋ(β)}) is injective. For any M this applies to M(n) for n small enough (by Proposition 7.4.6); the injectivity also holds for n large, since then H^1_{φ^a}(M(n)) = 0 by Proposition 6.2.2.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); [`VectorBundlesAndIsocrystals:VB4/robba-constant-polygon-filtration`](#vectorbundlesandisocrystals-vb4-robba-constant-polygon-filtration); [`VectorBundlesAndIsocrystals:VB4/constant-vertex-submodule`](#vectorbundlesandisocrystals-vb4-constant-vertex-submodule); [`VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`](#vectorbundlesandisocrystals-vb1-robba-bundle-equivalence); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists).

Proof / construction outline:

1. Negative slopes kill H⁰ on every fibre.
2. Interpret an H¹ class as an extension by the trivial module; if it splits at all fibres, the constant-vertex filtration canonically splits it globally.

Suggested declaration: `NegativeFrobeniusCohomologyDetection`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §7.4, Corollary 7.4.11 and Remark 7.4.12, pp. 155–156. The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-ring-sheaf-frobenius-comparison"></a>

### Ring and sheaf Frobenius-module comparison

`VectorBundlesAndIsocrystals:VB4/ring-sheaf-frobenius-comparison` · comparison · implementation `unchecked`.

Let (R, R⁺) be a perfect uniform adic Banach algebra over 𝔽_p and X = Spa(R, R⁺). For ∗ ∈ {ℰ̃, ℛ̃^bd, ℛ̃}, the natural functor from φ^d-modules over ∗_R to φ^d-modules over the sheaf ∗_X (called local φ^d-modules over ∗_R) is fully faithful (Theorem 5.3.3). For ∗ = ℛ̃ it is an equivalence of categories (Corollary 6.3.13); for ∗ = ℰ̃ and ∗ = ℛ̃^bd it is not (Example 8.5.17). A φ^d-module over ∗_R is pure (resp. étale) if and only if the corresponding φ^d-module over ∗_X is.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`](#vectorbundlesandisocrystals-vb1-robba-bundle-equivalence); [`VectorBundlesAndIsocrystals:VB4/pure-models`](#vectorbundlesandisocrystals-vb4-pure-models).

Proof / construction outline:

1. Use sheafiness and rational descent for full faithfulness.
2. Full Robba modules glue by the bundle equivalence; the Tate-curve example obstructs essential surjectivity for completed and bounded coefficient rings.

Suggested declaration: `RingSheafFrobeniusComparison`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.5, Remark 8.5.10, p. 172 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-adic-purity-loci"></a>

### Adic pure and étale loci

`VectorBundlesAndIsocrystals:VB4/adic-purity-loci` · theorem · implementation `unchecked`.

Let X be a perfect uniform adic space over 𝔽_{p^d} and M a φ^d-module over ℛ̃_X. Then the pure locus and the étale locus of M [printed 'of ℛ̃_X'] are open and partially proper (partial properness, Definition 8.2.11, presupposes X over an analytic field). In particular, by Lemma 8.2.12, if X is taut then so are the pure locus and the étale locus.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/purity-openness`](#vectorbundlesandisocrystals-vb4-purity-openness).

Proof / construction outline:

1. Pull back the seminorm purity locus along the adic rank-one retraction.
2. Openness and partial properness follow from saturation under generalization; partial properness requires a space over an analytic field.

Suggested declaration: `AdicPurityLoci`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.5, Lemma 8.5.11, p. 173 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-pointwise-ampleness"></a>

### Pointwise ampleness

`VectorBundlesAndIsocrystals:VB4/pointwise-ampleness` · definition · implementation `unchecked`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), let F be a vector bundle on Proj(P_R) and M the φ^a-module over ℛ̃_R corresponding to it (Theorem 6.3.12). The slope polygon of F is the function on ℳ(R) (and on Spa(R, R⁺) by retraction) given by the fibrewise Harder–Narasimhan polygon; it agrees with the slope polygon of M (Remark 4.2.18). F is pointwise ample at β ∈ ℳ(R) if all slopes of F at β are positive; by Theorem 7.4.5 this is an open condition on ℳ(R). F is pointwise ample if it is pointwise ample at every β.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.
- KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon`](#vectorbundlesandisocrystals-vb1-harder-narasimhan-polygon); [`VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness); [`VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity`](#vectorbundlesandisocrystals-vb4-robba-polygon-semicontinuity).

Proof / construction outline:

1. Use the existing fibre polygon; require every slope to be strictly positive.
2. Transfer the predicate across the companion Proj/Robba equivalence; no new generic definition of ample vector bundle is introduced.

Suggested declaration: `PointwiseAmple`.

Planning API:

- `PointwiseAmple` (data): At β the predicate that all slopes of the fibre polygon are strictly positive.
- `PointwiseAmple.isOpen` (structure): The set of β∈ℳ(R) at which F is pointwise ample is open (KL Theorem 7.4.5), and so is its preimage in Spa(R,R⁺) under the retraction.
- `PointwiseAmple.pullback` (functoriality): The predicate is preserved under residue-field extension and perfectoid pullback.
- `PointwiseAmple.tensor` (compatibility): Tensor products of positive fibres are positive, with slopes added with their multiplicities.
- `PointwiseAmple.projComparison` (compatibility): The predicate agrees for a Proj bundle and its full Robba module under the companion equivalence.

Unit tests:

- `PointwiseAmpleTest.positive` (computation): O(1) is pointwise ample.
- `PointwiseAmpleTest.unit` (non-example): O is not pointwise ample: its slope is zero.
- `PointwiseAmpleTest.mixed` (non-example): O(2)⊕O(−1) has positive total degree but is not pointwise ample.
- `PointwiseAmpleTest.zero` (degenerate): The zero bundle satisfies the every-slope predicate vacuously; it has no positive rank or numerical slope.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:

- VectorBundlesAndIsocrystals:VB4/positive-tensor-domination: control large tensor powers
- VectorBundlesAndIsocrystals:VB4/ample-iff-pointwise: characterize the imported local ampleness predicate

Sources:

- [KL15](#source-kl15), §8.8, Definition 8.8.10, pp. 182–183 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-positive-tensor-domination"></a>

### Positive tensor powers dominate a bundle

`VectorBundlesAndIsocrystals:VB4/positive-tensor-domination` · theorem · implementation `unchecked`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), for any pointwise ample vector bundle F on Proj(P_R) and any vector bundle G on Proj(P_R) there exists n_0 ∈ ℤ such that F^{⊗n} ⊗ G is pointwise ample for all n ≥ n_0.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.
- KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/bounded-polygons-dense-locus`](#vectorbundlesandisocrystals-vb4-bounded-polygons-dense-locus); [`VectorBundlesAndIsocrystals:VB4/pointwise-ampleness`](#vectorbundlesandisocrystals-vb4-pointwise-ampleness).

Proof / construction outline:

1. Use the uniform lower bound on the least slope of the pointwise-positive F and upper/lower bounds for G.
2. Tensor slope additivity gives positivity for all n beyond a common threshold.

Suggested declaration: `PositiveTensorDomination`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.8, Lemma 8.8.11 and its proof, p. 183 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-geometric-positive-generation"></a>

### Positive bundles on the geometric Proj curve

`VectorBundlesAndIsocrystals:VB4/geometric-positive-generation` · theorem · implementation `unchecked`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5) with R = L an analytic field, let F be an ample vector bundle on Proj(P_L). Then H^1(Proj(P_L), F) = 0. Under the same analytic-field hypothesis, F is generated by H⁰(Proj(P_L),F), Lemma 8.8.12(b).

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.
- KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

Prerequisites: [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`](#vectorbundlesandisocrystals-vb2-ampleness-gaga-equivalence); [`VectorBundlesAndIsocrystals:VB4/pointwise-ampleness`](#vectorbundlesandisocrystals-vb4-pointwise-ampleness); [`VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness); [`VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-globally-etale-positive-ampleness); [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles).

Proof / construction outline:

1. By the geometric classification reduce H¹=0 to a positive pure block.
2. For generation multiply the slope denominator to make standard summands integral; descend generation from the unramified coefficient extension.

Suggested declaration: `GeometricPositiveGeneration`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.8, Lemma 8.8.12(a) and its proof, p. 183 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-nonnegative-extension"></a>

### Nonnegative extension by a negative twist

`VectorBundlesAndIsocrystals:VB4/nonnegative-extension` · theorem · implementation `unchecked`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), let F be a vector bundle on Proj(P_R) whose slopes at some β ∈ ℳ(R) are all nonnegative but not all zero. Then there exists a short exact sequence 0 → O(−1) → G → F → 0 of vector bundles on Proj(P_R) such that the slopes of G at β are also all nonnegative.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.
- KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity`](#vectorbundlesandisocrystals-vb4-robba-polygon-semicontinuity); [`VectorBundlesAndIsocrystals:VB4/geometric-positive-generation`](#vectorbundlesandisocrystals-vb4-geometric-positive-generation).

Proof / construction outline:

1. Build 0→O(−1)→G→F→0 using a nontrivial fibrewise extension of the positive summand.
2. Use stability and slope inequalities to show G still has nonnegative slopes at the specified point. Degrees lie in (1/a)Z: the twist O(−1) has degree −1/a.

Suggested declaration: `NonnegativeExtension`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.8, Lemma 8.8.13 and its proof, pp. 183–185 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-etale-at-point-resolution"></a>

### Resolution by an étale-at-a-point bundle

`VectorBundlesAndIsocrystals:VB4/etale-at-point-resolution` · theorem · implementation `unchecked`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), let F be a vector bundle on Proj(P_R) whose slopes at some β ∈ ℳ(R) are all nonnegative. Then there exists a short exact sequence 0 → H → G → F → 0 of vector bundles on Proj(P_R) such that G is étale at β.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.
- KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/nonnegative-extension`](#vectorbundlesandisocrystals-vb4-nonnegative-extension).

Proof / construction outline:

1. Repeat the nonnegative extension and direct-sum construction to reduce the positive degree.
2. After finitely many steps obtain a bundle étale at the specified point and a finite locally free kernel.

Suggested declaration: `EtaleAtPointResolution`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.8, Corollary 8.8.14, p. 185 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-ample-iff-pointwise"></a>

### Ampleness and positive fibre slopes

`VectorBundlesAndIsocrystals:VB4/ample-iff-pointwise` · theorem · implementation `unchecked`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), a vector bundle F on Proj(P_R) is ample if and only if it is pointwise ample (all its slopes at every β ∈ ℳ(R) are positive).

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.
- KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

Prerequisites: [`VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness); [`VectorBundlesAndIsocrystals:VB4/positive-tensor-domination`](#vectorbundlesandisocrystals-vb4-positive-tensor-domination); [`VectorBundlesAndIsocrystals:VB4/etale-at-point-resolution`](#vectorbundlesandisocrystals-vb4-etale-at-point-resolution); [`VectorBundlesAndIsocrystals:VB4/pointwise-ampleness`](#vectorbundlesandisocrystals-vb4-pointwise-ampleness); [`VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-globally-etale-positive-ampleness); [`VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion`](#vectorbundlesandisocrystals-vb2-ampleness-ampleness-power-criterion); [`VectorBundlesAndIsocrystals:VB4/purity-openness`](#vectorbundlesandisocrystals-vb4-purity-openness).

Proof / construction outline:

1. Locally positive tensor domination and the étale-at-a-point resolution reduce to positive twists of globally étale modules.
2. Use the companion cohomological ampleness criterion to prove local ampleness; conversely ample generation tests all fibre slopes.

Suggested declaration: `AmpleIffPointwise`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.8, Theorem 8.8.15 and Remark 8.8.16, p. 185 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-relative-ampleness"></a>

### Ampleness on the relative curve

`VectorBundlesAndIsocrystals:VB4/relative-ampleness` · definition · implementation `unchecked`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), a vector bundle F on FF_X is ample if for every choice of (A, A⁺), (R, R⁺) and every morphism f : Spa(A, A⁺) → X, the bundle f^*F on FF_R corresponds via Theorem 8.7.7 to an ample vector bundle on Proj(P_R). By Theorem 8.8.15 this holds if and only if the slopes of F, as functions on X, are everywhere positive. Consequently: if X = Spa(A, A⁺), a vector bundle on Proj(P_R) is ample if and only if the corresponding vector bundle on FF_X is ample; if f : Y → X is a surjective morphism of perfectoid adic spaces and f^*F is ample then F is ample, so ampleness is local on the base; and ampleness is open on the base, even on its real quotient: if the restriction of F to FF_{H(x)} is ample for some x ∈ X, there is a partially proper open neighbourhood U of x in X such that the restriction of F to FF_U is ample (Theorem 7.4.5).

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.
- KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

Prerequisites: `RelativeFarguesFontaine:RF1`; [`VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness); [`VectorBundlesAndIsocrystals:VB4/ample-iff-pointwise`](#vectorbundlesandisocrystals-vb4-ample-iff-pointwise).

Proof / construction outline:

1. Define ampleness by pulling back to every affinoid perfectoid over the base and using the already owned Proj notion.
2. The pointwise criterion proves independence of those charts, surjective descent, and a partially proper open ample locus.

Suggested declaration: `RelativeAmple`.

Planning API:

- `RelativeAmple` (data): A bundle on FF_X is ample if all perfectoid affinoid pullbacks are ample in the already owned Proj sense.
- `RelativeAmple.fibreCriterion` (characterisation): Relative ampleness is equivalent to every geometric fibre slope being strictly positive.
- `RelativeAmple.pullback` (functoriality): Perfectoid pullback preserves ampleness.
- `RelativeAmple.surjectiveDescent` (compatibility): A bundle is ample iff its pullback along a surjective perfectoid map is ample.
- `RelativeAmple.openLocus` (structure): The ample locus is a partially proper open subset on a base over an analytic field.

Unit tests:

- `RelativeAmpleTest.affinoid` (compatibility): On an affinoid perfectoid untilt, relative ampleness agrees with the companion Proj ampleness.
- `RelativeAmpleTest.untiltLine` (computation): The untilt divisor line L_X is relatively ample; in KL normalization its slope is 1/a.
- `RelativeAmpleTest.unit` (non-example): The unit bundle is not relatively ample on a nonempty base.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:

- VectorBundlesAndIsocrystals:VB4/untilt-positive-line: identify the untilt line as a positive relative bundle
- VectorBundlesAndIsocrystalsPartII: supply positive-slope hypotheses for period constructions

Sources:

- [KL15](#source-kl15), §8.8, Definition 8.8.17, pp. 185–186 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-untilt-positive-line"></a>

### The positive line of an untilt

`VectorBundlesAndIsocrystals:VB4/untilt-positive-line` · comparison · implementation `unchecked`.

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5) with X = Spa(A, A⁺), write z = [z̄] + p z_1. Let M be the φ^a-module over ℛ̃_R free on one generator v with φ^a(v) = z_1^{−1} z v; it is globally étale. The convergent product u = ∏_{n≥0} φ^{an}(1 + p^{−1} z_1^{−1}[z̄]) ∈ ℛ̃⁺_R satisfies φ^a(u) = p z_1 z^{−1} u in ℛ̃_R, so uv defines an inclusion ℛ̃_R → M(1) of φ^a-modules, and M(1) is the φ^a-module corresponding to L_X. Hence the φ^a-module corresponding to L_X is globally pure of slope 1/a, i.e. globally (1, a)-pure (printed 'slope 1'; see source issue).

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.
- KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a.

Prerequisites: `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`; [`VectorBundlesAndIsocrystals:VB4/pure-models`](#vectorbundlesandisocrystals-vb4-pure-models); [`VectorBundlesAndIsocrystals:VB4/relative-ampleness`](#vectorbundlesandisocrystals-vb4-relative-ampleness).

Proof / construction outline:

1. Use the untilt primitive z=[z̄]+pz₁ and its divisor line L_X.
2. The convergent product u=∏φ^{an}(1+p^{-1}z₁^{-1}[z̄]) satisfies φ^a(u)=pz₁z^{-1}u.
3. The vector uv embeds the trivial module into M(1), identifying it with L_X; its slope is 1/a, not 1 for general a.

Suggested declaration: `UntiltPositiveLine`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.8, Lemma 8.8.19 and its proof, p. 186 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-twisted-local-systems"></a>

### Twisted rational local systems

`VectorBundlesAndIsocrystals:VB4/twisted-local-systems` · definition · implementation `unchecked`.

For c∈Z and d>0, a (c,d)-Q_p local system is an étale local system of finite-dimensional Q_{p^d}-vector spaces equipped with a Frobenius-semilinear automorphism τ such that p^c τ^d=1. Scheme-side isogeny (c,d)-Z_p local systems carry the same data on an isogeny Z_{p^d} local system. The categories for proportional pairs (c,d) are naturally equivalent, not literally equal.

Hypotheses:

- Q_{p^d}/Q_p unramified; τ acts semilinearly for arithmetic Frobenius.
- Étale rational local systems need not admit a global integral lattice.

Prerequisites: `DiamondsAndVStacks:D3`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`; `mathlib:ModuleCat`.

Proof / construction outline:

1. Import the generic locally constant sheaf and finite-dimensional coefficient categories.
2. Impose the explicit p^cτ^d equation; use Hilbert 90 for proportional denominator equivalences.

Suggested declaration: `TwistedLocalSystem`.

Planning API:

- `TwistedLocalSystem` (data): Finite-rank Q_{p^d} étale local system with arithmetic-Frobenius-semilinear τ and p^cτ^d=1.
- `TwistedLocalSystem.frobenius` (projection): The specified semilinear automorphism τ, with its coefficient Frobenius.
- `TwistedLocalSystem.iterate` (relation): For every section v, p^c τ^d(v)=v.
- `TwistedLocalSystem.pullback` (functoriality): Pullback transports τ and its equation; identities and composition agree.
- `TwistedLocalSystem.reindex` (equivalence): Pairs of positive denominator with the same c/d give naturally equivalent categories by unramified scalar extension/descent.

Unit tests:

- `TwistedLocalSystemTest.zeroSlope` (compatibility): At (0,1), τ=1 and the object is an ordinary Q_p local system.
- `TwistedLocalSystemTest.nonzeroTwist` (non-example): For c≠0,d=1, τ=1 on a nonzero Q_p line fails p^cτ=1.
- `TwistedLocalSystemTest.reindex` (compatibility): The categories for (1,2) and (2,4) are equivalent; the coefficient fields and underlying vector-space ranks are not literally identical.

Acceptance checks:

- At (c,d)=(0,1) the equation gives τ=1 and ordinary Q_p local systems.

Downstream uses:

- VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems: the local-system side of the pure-module equivalence
- VectorBundlesAndIsocrystals:VB4/purity-denominator-independence: prove denominator independence

Sources:

- [KL15](#source-kl15), Definition 8.5.7, p. 172. The Frobenius action is part of the object, not a mere slope annotation.

<a id="vectorbundlesandisocrystals-vb4-integral-frobenius-local-systems"></a>

### Integral Frobenius and local-system comparison

`VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems` · comparison · implementation `unchecked`.

For a perfect uniform adic Banach pair over F_{p^d}, étale Z_{p^d} local systems on Spec(R), on its inverse-perfecting complete subring, and on the corresponding untilt agree with φ^d-modules over W(R) and the integral relative Robba ring; the ring functor is scalar extension. The equivalence globalizes to perfectoid X and its tilt/inverse perfection. Over an algebraically closed complete C/Q_p, φ-modules over the integral Robba ring and W(C♭) agree with finite free Z_p modules (SW12.3.4). Taking isogenies yields globally pure models, not all rational étale local systems.

Hypotheses:

- KL Theorems 8.5.3–8.5.6, with integral finite projective modules.
- The absolute SW12.3.4 is restricted to E=Q_p and C algebraically closed.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/pure-model-trivialization`](#vectorbundlesandisocrystals-vb4-pure-model-trivialization); [`VectorBundlesAndIsocrystals:VB4/twisted-local-systems`](#vectorbundlesandisocrystals-vb4-twisted-local-systems); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `PerfectoidSpaces:P3`.

Proof / construction outline:

1. Solve Lang/Artin–Schreier–Witt equations to trivialize the integral Frobenius action pro-étale locally.
2. Descend the invariant lattice; the Robba-to-Witt fully faithful map uses pure-model trivialization and intersection of integral rings.
3. Produce essential surjectivity by the convergent Frobenius gauge correction; localize and glue, then invert p only for the isogeny category.

Suggested declaration: `IntegralFrobeniusLocalSystems`.

Acceptance checks:

- The unit integral φ-module has invariants Z_{p^d}; inverting p produces Q_{p^d}.

Downstream uses:



Sources:

- [KL15](#source-kl15), Theorems 8.5.3–8.5.6, pp. 169–171. Integral equivalence and its globalization.
- [SW20](#source-sw20), Theorem 12.3.4, book p. 104. Algebraically closed absolute specialization.

<a id="vectorbundlesandisocrystals-vb4-pure-modules-local-systems"></a>

### Pure modules and twisted local systems

`VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems` · comparison · implementation `unchecked`.

Let X be a perfectoid adic space over ℚ_{p^d}, X′ the corresponding perfect uniform adic space over 𝔽_{p^d}, and c ∈ ℤ. The following categories are equivalent: (a) étale (c, d)-ℚ_p-local systems over X; (b) étale (c, d)-ℚ_p-local systems over X′; (c) étale (c, d)-ℚ_p-local systems over X_0′ for any adic space X_0′ whose inverse perfection is isomorphic to X′; (d) (c, d)-pure φ-modules over ℰ̃_{X′}; (e) (c, d)-pure φ-modules over ℛ̃^bd_{X′}; (f) (c, d)-pure φ-modules over ℛ̃_{X′}.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/pure-models`](#vectorbundlesandisocrystals-vb4-pure-models); [`VectorBundlesAndIsocrystals:VB4/pure-model-trivialization`](#vectorbundlesandisocrystals-vb4-pure-model-trivialization); [`VectorBundlesAndIsocrystals:VB4/ring-sheaf-frobenius-comparison`](#vectorbundlesandisocrystals-vb4-ring-sheaf-frobenius-comparison); [`VectorBundlesAndIsocrystals:VB4/twisted-local-systems`](#vectorbundlesandisocrystals-vb4-twisted-local-systems); [`VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems`](#vectorbundlesandisocrystals-vb4-integral-frobenius-local-systems); `mathlib:CategoryTheory.Equivalence`.

Proof / construction outline:

1. Combine the global isogeny-local-system/pure-model comparison with tilting and descent.
2. Sheafify the equivalence on rational opens. Only Q_p and its unramified degree-d extension are claimed.

Suggested declaration: `PureModulesLocalSystems`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.5, Theorem 8.5.12, p. 173 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-purity-denominator-independence"></a>

### Independence of purity denominator

`VectorBundlesAndIsocrystals:VB4/purity-denominator-independence` · theorem · implementation `unchecked`.

Let X be a perfect uniform adic space over 𝔽_{p^d}. A φ^d-module over ℰ̃_X, ℛ̃^bd_X or ℛ̃_X is pure of slope s at a point x ∈ X if and only if it is (c′, d′)-pure at x for every (not just one) pair of integers (c′, d′) with d′ a positive multiple of d and c′/d′ = s.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems`](#vectorbundlesandisocrystals-vb4-pure-modules-local-systems).

Proof / construction outline:

1. Transport along the (c,d)-local-system comparison.
2. Use unramified coefficient extension and Hilbert 90 for proportional pairs; do not declare the integral models equal.

Suggested declaration: `PurityDenominatorIndependence`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.5, Corollary 8.5.13, p. 173 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-all-rings-pointwise-purity"></a>

### Pointwise purity over all three coefficient rings

`VectorBundlesAndIsocrystals:VB4/all-rings-pointwise-purity` · theorem · implementation `unchecked`.

Let (R, R⁺) be as in Hypothesis 5.0.1 (a perfect uniform adic Banach algebra over 𝔽_p that is a Banach algebra over an analytic field) and M a φ^d-module over ℰ̃_R, ℛ̃^bd_R or ℛ̃_R. If M is pointwise pure (M ⊗ ℋ(β) is pure for every β ∈ ℳ(R)), then M is pure (it admits a locally free local pure model at every β ∈ ℳ(R)).

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/purity-openness`](#vectorbundlesandisocrystals-vb4-purity-openness); [`VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems`](#vectorbundlesandisocrystals-vb4-pure-modules-local-systems).

Proof / construction outline:

1. For completed/bounded coefficients approximate a fibre cyclic vector on a rational neighbourhood.
2. Its iterates yield a free pure local model; use the full Robba result separately.

Suggested declaration: `AllRingsPointwisePurity`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.5, Corollary 8.5.14, p. 173 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-surjective-purity-descent"></a>

### Surjective descent and detection of purity

`VectorBundlesAndIsocrystals:VB4/surjective-purity-descent` · theorem · implementation `unchecked`.

Let (R, R⁺) → (S, S⁺) be a bounded homomorphism of perfect uniform adic Banach algebras over 𝔽_{p^d} such that Spa(S, S⁺) → Spa(R, R⁺) is surjective, and let M be a local φ^d-module over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R). Then M is pure if and only if M ⊗ ℰ̃_S (resp. M ⊗ ℛ̃^bd_S, M ⊗ ℛ̃_S) is pure. Corollary 8.5.16 globalizes this equivalence to any surjective morphism of perfectoid adic spaces for full Robba sheaves.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/all-rings-pointwise-purity`](#vectorbundlesandisocrystals-vb4-all-rings-pointwise-purity).

Proof / construction outline:

1. Use purity’s dependence only on the corresponding rank-one seminorm and its residue extension.
2. A bounded surjective adic map lifts every seminorm; apply pointwise detection and glue local models.

Suggested declaration: `SurjectivePurityDescent`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.5, Corollary 8.5.15, p. 174 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-local-global-purity-counterexamples"></a>

### Local purity without global pure models

`VectorBundlesAndIsocrystals:VB4/local-global-purity-counterexamples` · application · implementation `unchecked`.

Let K = 𝔽_p((q)) with |q| = ω < 1, B = K{ω²/T, T, U/ω^{−2}}/(U(T − q) − 1) (so Spa(B, B°) is the annulus ω² ≤ |T| ≤ 1 minus the open disc |T − q| < ω²), and B_1 = K{ω²/T, T/ω²}, B_2 = K{1/T, T} (its boundary circles |T| = ω² and |T| = 1). The substitution T ↦ q²T is an isomorphism σ_q: B_1 → B_2 [printed as a map B_2 → B_1]; identifying the two circles through it gives a strictly affinoid subspace Spa(A, A°) of the Tate curve over K with parameter q², the analytification of a smooth projective genus-1 curve over K. Glueing the trivial ℚ_p-local system on Spa(B, B°) along this identification by matching the generator 1 on one circle with p on the other gives an étale ℚ_p-local system V on Spa(A, A°). Let R, S, S_1, S_2 be the completed perfections of A, B, B_1, B_2 and X = Spa(R, R°). Then V corresponds to no étale φ-module over ℰ̃_R or ℛ̃^bd_R (a nonzero v would give x ∈ ℰ̃_S with x_2 = pσ_q(x_1) ∈ ℰ̃_{S_2}, forcing x ∈ ∩_m p^m W(S) = 0). By Theorem 8.5.12, V does correspond to an étale φ-module over ℛ̃_R and to étale φ-modules over ℰ̃_X and ℛ̃^bd_X, which therefore do not descend to ℰ̃_R, ℛ̃^bd_R (an obstruction to glueing finite projective modules over these rings, Remark 5.3.7); and the étale φ-module over ℛ̃_R admits no étale model, locally free or not. For the nodal example, we also retain Example 8.5.18 as a sheaf-level locally étale but not globally étale counterexample; the ring-level strengthening is G-PATCH.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/ring-sheaf-frobenius-comparison`](#vectorbundlesandisocrystals-vb4-ring-sheaf-frobenius-comparison); [`VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems`](#vectorbundlesandisocrystals-vb4-pure-modules-local-systems).

Proof / construction outline:

1. On the perfected Tate-curve annulus glue a generator to p times a generator; no nonzero global lattice is invariant under repeated transport.
2. For the perfected nodal curve Y²=(X²−1)², p≠2, the infinite-chain cover gives a Q_p local system without a global Z_p lattice.
3. Keep the latter SHEAF counterexample as stated. The ring-level strengthening needs Milnor patching (G-PATCH), not the sheaf comparison alone.

Suggested declaration: `LocalGlobalPurityCounterexamples`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.5, Example 8.5.17, pp. 174–175 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-pure-two-out-of-three"></a>

### Pure modules in short exact sequences

`VectorBundlesAndIsocrystals:VB4/pure-two-out-of-three` · theorem · implementation `unchecked`.

Assume Hypothesis 8.6.1. Let 0 → M_1 → M → M_2 → 0 be a short exact sequence of φ-modules over ℛ̃_R. If any two of M, M_1, M_2 are (c, d)-pure, then so is the third.

Hypotheses:

- KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/all-rings-pointwise-purity`](#vectorbundlesandisocrystals-vb4-all-rings-pointwise-purity).

Proof / construction outline:

1. Reduce to a geometric seminorm; slope inequalities and rank-degree additivity make the third term pure of the common slope.
2. Invoke pointwise purity detection to construct its local models.

Suggested declaration: `PureTwoOutOfThree`.

Acceptance checks:

- Check coefficient ring, base topology and normalization against the stated source; the zero-rank convention applies only to purity.

Downstream uses:



Sources:

- [KL15](#source-kl15), §8.6, Lemma 8.6.3, p. 176 (arXiv 1301.0792v5). The accepted route’s target; literal source passage read and corrected where recorded below.

<a id="vectorbundlesandisocrystals-vb4-integral-boundary-realization"></a>

### Integral boundary realization

`VectorBundlesAndIsocrystals:VB4/integral-boundary-realization` · comparison · implementation `unchecked`.

For S∈Perf, finite free Z_p local systems on S_proét are equivalent to φ^{-1}-modules on `Y_[0,r](S)`, including the characteristic-p boundary. Restriction to Y_(0,r] realizes the rationalized local system L[1/p], which has all Newton slopes zero. This distinguishes integral lattices at the boundary from a slope-zero bundle on the open curve.

Hypotheses:

- S = Spa(R,R⁺) is an affinoid perfectoid space of characteristic p with a fixed pseudouniformizer ϖ defining `Y_[0,r](S)` (SW20 §22.6: "we assume that S = Spa(R,R+) is affinoid and we fix a pseudo-uniformizer"); the statement globalizes by descent.
- r>0; the integral period space and φ^{-1} pullback conventions are those of SW Lecture 22.
- Finite rank is locally constant; no boundary deletion in the integral comparison.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems`](#vectorbundlesandisocrystals-vb4-integral-frobenius-local-systems); [`VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`](#vectorbundlesandisocrystals-vb4-slope-zero-local-systems); `RelativeFarguesFontaine:RF0:integral-Y`; `DiamondsAndVStacks:D3/locally-profinite-torsors`.

Proof / construction outline:

1. Trivialize the local system on a pro-étale cover and tensor with the boundary structure sheaf.
2. Use Frobenius invariants and the integral comparison to recover the lattice; descend both functors.
3. Restrict away from p=0 to identify rationalization.

Suggested declaration: `IntegralBoundaryRealization`.

Acceptance checks:

- Two distinct Z_p lattices in the same Q_p space give the same interior bundle and different integral data.

Downstream uses:



Sources:

- [SW20](#source-sw20), Proposition 22.3.2, book p. 209. Integral boundary and rational interior clauses.

<a id="vectorbundlesandisocrystals-vb4-integral-group-torsors"></a>

### Integral group torsors and Frobenius

`VectorBundlesAndIsocrystals:VB4/integral-group-torsors` · comparison · implementation `unchecked`.

For a smooth affine group scheme G/Z_p with connected fibres, pro-étale G(Z_p)-torsors on S are equivalent to φ^{-1}-G-torsors on `Y_[0,r](S)`. For G=GL_n this is the integral local-system equivalence. Connectedness of fibres and the integral boundary are retained; extensions requiring a parahoric model are not inferred from this theorem.

Hypotheses:

- S = Spa(R,R⁺) is an affinoid perfectoid space of characteristic p with a fixed pseudouniformizer ϖ defining `Y_[0,r](S)` (SW20 §22.6: "we assume that S = Spa(R,R+) is affinoid and we fix a pseudo-uniformizer"); the statement globalizes by descent.
- S perfectoid; r>0; smooth affine integral model with connected fibres.

Prerequisites: [`VectorBundlesAndIsocrystals:VB4/integral-boundary-realization`](#vectorbundlesandisocrystals-vb4-integral-boundary-realization); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `RelativeFarguesFontaine:RF0:integral-Y`; `DiamondsAndVStacks:D3/locally-profinite-torsors`.

Proof / construction outline:

1. Use the representation/comodule dictionary and the integral exact tensor comparison to pass from representations to torsors.
2. Lang’s map on the connected special fibre trivializes Frobenius torsors; lift and descend pro-étale locally.

Suggested declaration: `IntegralGroupTorsors`.

Acceptance checks:

- G=GL₁ recovers Z_p× torsors, with the boundary lattice retained.

Downstream uses:



Sources:

- [SW20](#source-sw20), Proposition 22.6.1, book p. 213. The group-model hypotheses are part of the statement.

## Coverage and remaining proof boundaries

Every target in the two scopes has a declaration-level contract or a named owner import. Coverage is planning coverage; a missing proof or supplier carrier remains missing. In particular, compilation of component prototypes does not prove these contracts.

### VB0 coverage

- `VectorBundlesAndIsocrystals:VB0`: **planned**. Every target in scope has a node; chains terminate in verified baseline references, precise supplier contracts or the named gaps. This is target-level planning, not proof closure. Remaining: G-DM: full eigenvector and equal-characteristic proofs; CFT cyclic/cohomological Brauer contract.
- `VectorBundlesAndIsocrystals:VB1`: **planned**. Every target in scope has a node; chains terminate in verified baseline references, precise supplier contracts or the named gaps. This is target-level planning, not proof closure. Remaining: G-GEOM: independent chart coverage/local comparison; G-HN: boundedness and generic-fiber axioms; G-INTEGRATION: retarget basic BC/RF3 suppliers; G-LEAN: actual curve carriers.
- `VectorBundlesAndIsocrystals:VB2`: **planned**. Every target in scope has a node; chains terminate in verified baseline references, precise supplier contracts or the named gaps. This is target-level planning, not proof closure. Remaining: The two child stages are fully target-planned; their named proof/supplier refinements remain.
- `VectorBundlesAndIsocrystals:VB2:ampleness`: **planned**. Every target in scope has a node; chains terminate in verified baseline references, precise supplier contracts or the named gaps. This is target-level planning, not proof closure. Remaining: Supplier coefficient-normalization and K₀ stabilization contracts; SF0 nonnoetherian Proj/global-generation and affineness inputs; G-INTEGRATION and G-LEAN.; G-GG: general-E comparison for the corrected KL contraction proof.
- `VectorBundlesAndIsocrystals:VB2:classification`: **planned**. Every target in scope has a node; chains terminate in verified baseline references, precise supplier contracts or the named gaps. This is target-level planning, not proof closure. Remaining: G-KEY: both-characteristic analytic input; prerequisite G-DM/G-GEOM/G-HN; VS1 export integration and G-LEAN.

#### VB0/G-INTEGRATION — Atomic early-layer integration

The RF0 packet still assigns the full isocrystal functor to RF3 and states a global curve map without chart coverage. Under accepted RS-20 consume only rank-one O(n) descent/sign/divisor compatibility and partial homogeneous charts there; this packet owns the full functor and global coverage. The other VB3 packet still depends on the whole VB1 aggregate for its basic BC nodes. Retarget those inputs to Bundle/Ann/Coh/VD, excluding Tw and geometric degree/HN. Until these changes are integrated atomically, the old aggregate stage graph retains cycles; the proposed direct declaration graph is acyclic.

Needed by: [`VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`](#vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`](#vectorbundlesandisocrystals-vb1-geometric-point-chart-cover); [`VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`](#vectorbundlesandisocrystals-vb2-ampleness-global-proj-map-and-twists).

#### VB0/G-DM — Dieudonné–Manin proof inputs beyond the pinned rank-one theorem

Ked05 4.5.5–4.5.8 provides the mixed-characteristic ramified-coefficient route, but its eigenvector calculation Lemma 4.3.3 imports [19, Lemma 4.12] without a proof read here. A proof of that specific calculation and a full equal-characteristic bar F_q((π)) proof are required. Lurie26 Theorem 6 is only a statement source. This gap replaces the inherited claim that no higher-rank proof route had been read.

Needed by: [`VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`](#vectorbundlesandisocrystals-vb0-dieudonne-manin-isocrystals); [`VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`](#vectorbundlesandisocrystals-vb0-tensor-and-dual-slopes); [`VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`](#vectorbundlesandisocrystals-vb0-endomorphism-division-algebra).

#### VB0/G-GEOM — Independent geometric chart-cover proof

Complete the transplantation of FS II.2.9 before general-S GAGA: show at least two distinct untilt divisor classes can be represented by degree-one sections, separate every classical point by a nonvanishing section, prove the homogeneous-localization/analytic chart comparison on their overlaps, and establish the chartwise finite-projective equivalence. This is the early prefix demanded by RT-AREA-padic-1/21. The source states II.2.9 after GAGA, so its printed proof alone does not close this reordered prefix.

Needed by: [`VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`](#vectorbundlesandisocrystals-vb1-geometric-point-chart-cover); [`VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`](#vectorbundlesandisocrystals-vb2-ampleness-schematic-curve-at-a-geometric-point); [`VectorBundlesAndIsocrystals:VB1/picard-degree`](#vectorbundlesandisocrystals-vb1-picard-degree).

#### VB0/G-HN — HN axiom verification without ampleness

Write the curve-specific verification of FF5.5.1, especially meromorphic trivialization with bounded finite divisor poles and a wedge-power upper bound on degrees of saturated subbundles of every fixed rank. The local DVR and torsion degree work is specified by Sat; generic-fiber exactness and boundedness must not be inferred from the classification theorem or from general-S global generation. FS II.2.12 has no expanded proof.

Needed by: [`VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`](#vectorbundlesandisocrystals-vb1-saturation-and-torsion-degree); [`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`](#vectorbundlesandisocrystals-vb1-harder-narasimhan-filtration); [`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon`](#vectorbundlesandisocrystals-vb1-harder-narasimhan-polygon).

#### VB0/G-KEY — Equal-characteristic analytic affine-line input

FS II.2.15 gives the common outline: a nonclassical image point becomes an open image in A¹/E after extending C; contraction makes the map surjective. To obtain the contradiction, compare E-linear affine-line diamond maps with analytic A¹ maps in mixed characteristic and with maps of perfected analytic A¹ in equal characteristic. The latter series may have fractional p-power exponents; π-linearity kills all except exponent 1. Supply this exact comparison and the open-image argument in the analytic foundations owner. These are recorded proof refinements, not an assumption of nonperfectoidness in equal characteristic.

Needed by: [`VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`](#vectorbundlesandisocrystals-vb2-classification-key-extension-lemma); [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles).

#### VB0/G-LEAN — Actual curve carriers for source-level signatures

The pinned libraries contain semilinear isocrystals, module sheaves, line-bundle classes and Brauer operations, but no relative Fargues–Fontaine curve, completed tilted Robba ring, its annular descent or HN bundle objects. The suggested file states genuine algebraic and numerical prototypes and finite locally free carrier signatures. Curve-dependent assertions whose hypotheses require these missing supplier carriers are explicitly omitted and indexed by their planned names, rather than encoded by arbitrary propositions. Replace those omissions when the named supplier carriers exist.

Needed by: [`VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`](#vectorbundlesandisocrystals-vb1-finite-locally-free-bundles); [`VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`](#vectorbundlesandisocrystals-vb1-annular-frobenius-descent); [`VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`](#vectorbundlesandisocrystals-vb1-tilted-robba-ring); [`VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`](#vectorbundlesandisocrystals-vb1-robba-frobenius-modules); [`VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`](#vectorbundlesandisocrystals-vb1-robba-bundle-equivalence); [`VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`](#vectorbundlesandisocrystals-vb1-frobenius-two-term-cohomology); [`VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`](#vectorbundlesandisocrystals-vb1-v-descent-for-bundles-and-cohomology); [`VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`](#vectorbundlesandisocrystals-vb1-isocrystal-to-bundle-functor); [`VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`](#vectorbundlesandisocrystals-vb1-cohomology-of-twists); [`VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`](#vectorbundlesandisocrystals-vb2-classification-classical-points-and-principal-ideal-domains); [`VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`](#vectorbundlesandisocrystals-vb1-geometric-point-chart-cover); [`VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`](#vectorbundlesandisocrystals-vb2-ampleness-schematic-curve-at-a-geometric-point); [`VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison`](#vectorbundlesandisocrystals-vb1-completed-local-ring-comparison); [`VectorBundlesAndIsocrystals:VB1/picard-degree`](#vectorbundlesandisocrystals-vb1-picard-degree); [`VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`](#vectorbundlesandisocrystals-vb1-degree-rank-slope-and-hn-formalism); [`VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`](#vectorbundlesandisocrystals-vb1-saturation-and-torsion-degree); [`VectorBundlesAndIsocrystals:VB1/geometric-semistability`](#vectorbundlesandisocrystals-vb1-geometric-semistability); [`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`](#vectorbundlesandisocrystals-vb1-harder-narasimhan-filtration); [`VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon`](#vectorbundlesandisocrystals-vb1-harder-narasimhan-polygon); [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [`VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`](#vectorbundlesandisocrystals-vb2-ampleness-global-proj-map-and-twists); [`VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`](#vectorbundlesandisocrystals-vb2-ampleness-gaga-equivalence); [`VectorBundlesAndIsocrystals:VB2:ampleness/independence-of-positive-twist`](#vectorbundlesandisocrystals-vb2-ampleness-independence-of-positive-twist); [`VectorBundlesAndIsocrystals:VB2:ampleness/prufer-and-coherent-correspondence`](#vectorbundlesandisocrystals-vb2-ampleness-prufer-and-coherent-correspondence); [`VectorBundlesAndIsocrystals:VB2:ampleness/norms-on-twisted-invariants`](#vectorbundlesandisocrystals-vb2-ampleness-norms-on-twisted-invariants); [`VectorBundlesAndIsocrystals:VB2:ampleness/continuous-frobenius-group-actions`](#vectorbundlesandisocrystals-vb2-ampleness-continuous-frobenius-group-actions); [`VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`](#vectorbundlesandisocrystals-vb2-ampleness-two-affine-cover-cohomological-dimension); [`VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-tensor-global-ampleness); [`VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion`](#vectorbundlesandisocrystals-vb2-ampleness-ampleness-power-criterion); [`VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations`](#vectorbundlesandisocrystals-vb2-ampleness-positive-lines-and-finite-type-presentations); [`VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion`](#vectorbundlesandisocrystals-vb2-ampleness-cohomological-ampleness-criterion); [`VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-globally-etale-positive-ampleness); [`VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness`](#vectorbundlesandisocrystals-vb2-ampleness-ample-section-affineness); [`VectorBundlesAndIsocrystals:VB2:classification/standard-bundle-stability`](#vectorbundlesandisocrystals-vb2-classification-standard-bundle-stability); [`VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`](#vectorbundlesandisocrystals-vb2-classification-fixed-slope-abelian-category); [`VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change`](#vectorbundlesandisocrystals-vb2-classification-hn-filtration-base-change); [`VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`](#vectorbundlesandisocrystals-vb2-classification-key-extension-lemma); [`VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`](#vectorbundlesandisocrystals-vb2-classification-dieudonne-manin-classification-of-bundles); [`VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`](#vectorbundlesandisocrystals-vb2-classification-hom-and-ext-calculus); [`VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison`](#vectorbundlesandisocrystals-vb2-classification-bundle-endomorphism-comparison); [`VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification`](#vectorbundlesandisocrystals-vb2-classification-coherent-sheaf-classification); [`VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras`](#vectorbundlesandisocrystals-vb2-classification-finite-etale-constant-algebras).

#### VB0/G-GG — General-E corrected annular contraction comparison

FS II.2.6 estimates (II.2.1) and its π-adic inclusion are false as printed (confirmed FS extraction E75/E76). Use the fully read KL6.2.2–6.2.4 proof, whose two half-annuli and contraction constants are specified in GG, then prove its coefficient/radius normalization for general E and equal characteristic using the RF0 annular ring comparison. This gap does not question the generation theorem, but prevents treating the defective published quantitative proof as closed.

Needed by: [`VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`](#vectorbundlesandisocrystals-vb2-ampleness-quantitative-global-generation); [`VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness`](#vectorbundlesandisocrystals-vb2-ampleness-globally-etale-positive-ampleness).

### VB3 coverage

- `VectorBundlesAndIsocrystals:VB3`: **planned**. All explicit stage targets and all routed items in this scope have target-level nodes or named owner imports. Aggregate VB3 is realised by its three substages. Remaining: Supplier and proof boundaries of the three substages; see G-LT, G-SPATIAL, G-LEBRAS, G-LEAN and G-ORDER.
- `VectorBundlesAndIsocrystals:VB3:general-BC`: **planned**. Target-level pass complete; recorded proof/supplier refinements remain. Remaining: G-CONTRACT: Quantitative verification of contraction on BC charts; G-SPATIAL: Two generic spatiality extensions; G-LEBRAS: Construction-level proof of Le Bras; G-HOM: Bounded-image step for unrestricted VS morphisms; G-COMPANION: Imported companion proof obligations; G-ORDER: Atomic stage-order integration; G-LEAN: Missing geometric Lean carriers
- `VectorBundlesAndIsocrystals:VB3:positive-basic-examples`: **planned**. Target-level pass complete; recorded proof/supplier refinements remain. Remaining: G-LT: Crystalline Lubin–Tate Hom comparison; G-COMPANION: Imported companion proof obligations; G-LEAN: Missing geometric Lean carriers
- `VectorBundlesAndIsocrystals:VB3:projectivized-properness`: **planned**. Target-level pass complete; recorded proof/supplier refinements remain. Remaining: G-CONTRACT: Quantitative verification of contraction on BC charts; G-COMPANION: Imported companion proof obligations; G-LEAN: Missing geometric Lean carriers
- `VectorBundlesAndIsocrystals:VB4`: **planned**. Target-level pass complete; recorded proof/supplier refinements remain. Remaining: G-PATCH: Ring-level nodal purity counterexample; G-INTEGRAL: Integral Tannakian reconstruction; G-COMPANION: Imported companion proof obligations; G-LEAN: Missing geometric Lean carriers

#### VB3/G-LT — Crystalline Lubin–Tate Hom comparison

SW13 Theorem A supplies full faithfulness; FSII.2.2 compresses the specific Hom/eigenspace calculation and the σ/π normalization. R07.2 must provide exactly the displayed comparison, with OE action and Frobenius. SW20 p.99 normalization was read; this is now a proof boundary, not an unread source or an asserted essential-surjectivity theorem.

Needed by: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-lubin-tate-universal-cover).

#### VB3/G-CONTRACT — Quantitative verification of contraction on BC charts

FSII.2.16 reduces in one sentence from embeddings into BC(O(n)^m) to evaluation at a finite family of untilts. Verify that those evaluations jointly detect vanishing and provide a common contraction/escape bound on each quasicompact open. The topological lemma itself is fully stated; the missing quantitative application affects ordinary and two-term properness.

Needed by: [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`](#vectorbundlesandisocrystals-vb3-projectivized-properness-properness-of-projectivized-bc); [`VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`](#vectorbundlesandisocrystals-vb3-general-bc-families-of-banach-colmez-spaces).

#### VB3/G-SPATIAL — Two generic spatiality extensions

DD5 has generic spatiality and relative representability nodes but does not yet state the two exact FSII.3.8 contracts. Requested there; proof must keep smallness, qcqs/surjectivity for the smooth cover, and a covering family of locally closed generalizing strata.

Needed by: [`VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality`](#vectorbundlesandisocrystals-vb3-general-bc-absolute-bc-spatiality); [`VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison`](#vectorbundlesandisocrystals-vb3-general-bc-divisor-section-comparison); [`VectorBundlesAndIsocrystals:VB3:general-BC/punctured-absolute-quotients`](#vectorbundlesandisocrystals-vb3-general-bc-punctured-absolute-quotients).

#### VB3/G-LEBRAS — Construction-level proof of Le Bras

SW15.2.12 and CN3.12 state and use the exact equivalence and triangular Hom matrix. Both are read; the underlying proof in Le Bras’s thesis/article was not available among the supplied sources read. Obtain its hypercohomology full-faithfulness and sympathetic-evaluation comparison, not just cite an abstract categorical equivalence.

Needed by: [`VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence); [`VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`](#vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian).

#### VB3/G-HOM — Bounded-image step for unrestricted VS morphisms

CN3.18’s BdR vanishing uses presentations by Graphs of additive elements and a bound landing the image in t^{-N}BdR⁺. The graph theorem in §4 was not read in this pass. The finite-length/BdR⁺ part is sourced, but the uniform bound for arbitrary VS maps must be proved or imported from the routed CN PartII, without a cyclic use of its h-exactness theorem.

Needed by: [`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing`](#vectorbundlesandisocrystals-vb3-general-bc-torsion-vs-hom-vanishing).

#### VB3/G-PATCH — Ring-level nodal purity counterexample

KL8.5.18 explicitly gives sheaf modules. The accepted extraction’s E68 supplies a possible Milnor fibre-product patching argument to produce modules over completed and bounded coefficient RINGS. Verify the Witt and Robba fibre-product/intersection statements and φ compatibility before claiming Remark7.3.5’s stronger ring-level separation. This packet’s application keeps the established sheaf version.

Needed by: [`VectorBundlesAndIsocrystals:VB4/local-global-purity-counterexamples`](#vectorbundlesandisocrystals-vb4-local-global-purity-counterexamples); [`VectorBundlesAndIsocrystals:VB4/pure-models`](#vectorbundlesandisocrystals-vb4-pure-models).

#### VB3/G-INTEGRAL — Integral Tannakian reconstruction

The upstream ReductiveGroups Layer1 is over a field. SW22.6.1 requires an integral smooth affine model with connected fibres and exact tensor fibre-functor torsors over Z_p. Requested as the upstream roadmap’s PartII, preserving the connected-fibre Lang input.

Needed by: [`VectorBundlesAndIsocrystals:VB4/integral-group-torsors`](#vectorbundlesandisocrystals-vb4-integral-group-torsors).

#### VB3/G-COMPANION — Imported companion proof obligations

VB0 packet is complete but its independent review currently needs_changes because its reader is unsynchronized. Import its corrected NODE statements. Retain its G-DM, G-GEOM, G-HN, G-GG and G-KEY obligations where used: equal-characteristic DM, early chart/PID comparison, HN degree bounds, general-E global-generation comparison and perfected-A¹ endomorphisms. This part neither duplicates nor treats those proof gaps as resolved.

Needed by: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-lubin-tate-universal-cover); [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`](#vectorbundlesandisocrystals-vb3-projectivized-properness-properness-of-projectivized-bc); [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); [`VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`](#vectorbundlesandisocrystals-vb3-general-bc-positive-slope-resolution); [`VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence).

#### VB3/G-ORDER — Atomic stage-order integration

Binding RS15 review accepted 2026-09-30 withholds the reversal general-BC→VB4. The node order is acyclic and uses VB4→positive resolutions→general two-term geometry, while early basic calculations feed VB1 twists. Never mechanically lift these node dependencies into the current stage graph. Apply the parent-stage narrowing and edge replacement atomically in a separate integration change. Red-team finding RT-AREA-padic-1/21 (independent review): this part is consistent with its acyclic order. The positive/basic nodes use only II.2.1 descent, the RF2 untilt nodes and the Lubin–Tate inputs (no II.2.6, II.2.9 or classification); projectivized properness uses II.2.6 from VB2:ampleness; the divisor comparison uses the geometric-point stage (II.2.9) of the companion; the RF3 global-map blocker itself is owned by the companion VB0 packet.

Needed by: [`VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`](#vectorbundlesandisocrystals-vb3-general-bc-positive-slope-resolution); [`VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations`](#vectorbundlesandisocrystals-vb3-general-bc-strict-positive-etale-presentations); [`VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`](#vectorbundlesandisocrystals-vb3-general-bc-families-of-banach-colmez-spaces).

#### VB3/G-LEAN — Missing geometric Lean carriers

The pinned libraries contain sheaves, abelian/derived categories, ModuleCat, short complexes, spectral topology and lattices, but no Perf site, FF curve, slopes, diamonds, period VS or Le Bras functor. Suggested signatures give their available categorical, linear, cochain, numeric and topological components, and an exact contract index lists every definition, API item, test and missing geometric clause. Generic category/functor/height parameters are uninstantiated supplier interfaces, not verified models. Compilation with admitted proofs verifies these component types only; it proves neither geometric hypotheses nor the complete contracts.

Needed by: [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-banach-colmez-space-definition); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-lubin-tate-universal-cover); [`VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`](#vectorbundlesandisocrystals-vb3-positive-basic-examples-fundamental-exact-sequence); [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`](#vectorbundlesandisocrystals-vb3-projectivized-properness-properness-of-projectivized-bc); [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma`](#vectorbundlesandisocrystals-vb3-projectivized-properness-contracting-action-lemma); [`VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution`](#vectorbundlesandisocrystals-vb3-general-bc-positive-slope-resolution); [`VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`](#vectorbundlesandisocrystals-vb3-general-bc-families-of-banach-colmez-spaces); [`VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality`](#vectorbundlesandisocrystals-vb3-general-bc-absolute-bc-spatiality); [`VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon`](#vectorbundlesandisocrystals-vb4-semicontinuity-of-hn-polygon); [`VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`](#vectorbundlesandisocrystals-vb4-relative-hn-filtration-and-proetale-splitting); [`VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`](#vectorbundlesandisocrystals-vb4-slope-zero-local-systems); [`VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations`](#vectorbundlesandisocrystals-vb3-general-bc-strict-positive-etale-presentations); [`VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`](#vectorbundlesandisocrystals-vb4-relative-cohomology-vanishing); [`VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison`](#vectorbundlesandisocrystals-vb3-general-bc-divisor-section-comparison); [`VectorBundlesAndIsocrystals:VB3:general-BC/punctured-absolute-quotients`](#vectorbundlesandisocrystals-vb3-general-bc-punctured-absolute-quotients); [`VectorBundlesAndIsocrystals:VB3:general-BC/negative-quaternion-example`](#vectorbundlesandisocrystals-vb3-general-bc-negative-quaternion-example); [`VectorBundlesAndIsocrystals:VB3:general-BC/negative-sl2-example`](#vectorbundlesandisocrystals-vb3-general-bc-negative-sl2-example); [`VectorBundlesAndIsocrystals:VB4/annular-basis-approximation`](#vectorbundlesandisocrystals-vb4-annular-basis-approximation); [`VectorBundlesAndIsocrystals:VB4/pure-models`](#vectorbundlesandisocrystals-vb4-pure-models); [`VectorBundlesAndIsocrystals:VB4/pure-model-trivialization`](#vectorbundlesandisocrystals-vb4-pure-model-trivialization); [`VectorBundlesAndIsocrystals:VB4/purity-openness`](#vectorbundlesandisocrystals-vb4-purity-openness); [`VectorBundlesAndIsocrystals:VB4/diagonal-gauge-normal-form`](#vectorbundlesandisocrystals-vb4-diagonal-gauge-normal-form); [`VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity`](#vectorbundlesandisocrystals-vb4-robba-polygon-semicontinuity); [`VectorBundlesAndIsocrystals:VB4/bounded-polygons-dense-locus`](#vectorbundlesandisocrystals-vb4-bounded-polygons-dense-locus); [`VectorBundlesAndIsocrystals:VB4/constant-vertex-submodule`](#vectorbundlesandisocrystals-vb4-constant-vertex-submodule); [`VectorBundlesAndIsocrystals:VB4/robba-constant-polygon-filtration`](#vectorbundlesandisocrystals-vb4-robba-constant-polygon-filtration); [`VectorBundlesAndIsocrystals:VB4/negative-frobenius-cohomology-detection`](#vectorbundlesandisocrystals-vb4-negative-frobenius-cohomology-detection); [`VectorBundlesAndIsocrystals:VB4/ring-sheaf-frobenius-comparison`](#vectorbundlesandisocrystals-vb4-ring-sheaf-frobenius-comparison); [`VectorBundlesAndIsocrystals:VB4/adic-purity-loci`](#vectorbundlesandisocrystals-vb4-adic-purity-loci); [`VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems`](#vectorbundlesandisocrystals-vb4-pure-modules-local-systems); [`VectorBundlesAndIsocrystals:VB4/purity-denominator-independence`](#vectorbundlesandisocrystals-vb4-purity-denominator-independence); [`VectorBundlesAndIsocrystals:VB4/all-rings-pointwise-purity`](#vectorbundlesandisocrystals-vb4-all-rings-pointwise-purity); [`VectorBundlesAndIsocrystals:VB4/surjective-purity-descent`](#vectorbundlesandisocrystals-vb4-surjective-purity-descent); [`VectorBundlesAndIsocrystals:VB4/local-global-purity-counterexamples`](#vectorbundlesandisocrystals-vb4-local-global-purity-counterexamples); [`VectorBundlesAndIsocrystals:VB4/pure-two-out-of-three`](#vectorbundlesandisocrystals-vb4-pure-two-out-of-three); [`VectorBundlesAndIsocrystals:VB4/pointwise-ampleness`](#vectorbundlesandisocrystals-vb4-pointwise-ampleness); [`VectorBundlesAndIsocrystals:VB4/positive-tensor-domination`](#vectorbundlesandisocrystals-vb4-positive-tensor-domination); [`VectorBundlesAndIsocrystals:VB4/geometric-positive-generation`](#vectorbundlesandisocrystals-vb4-geometric-positive-generation); [`VectorBundlesAndIsocrystals:VB4/nonnegative-extension`](#vectorbundlesandisocrystals-vb4-nonnegative-extension); [`VectorBundlesAndIsocrystals:VB4/etale-at-point-resolution`](#vectorbundlesandisocrystals-vb4-etale-at-point-resolution); [`VectorBundlesAndIsocrystals:VB4/ample-iff-pointwise`](#vectorbundlesandisocrystals-vb4-ample-iff-pointwise); [`VectorBundlesAndIsocrystals:VB4/relative-ampleness`](#vectorbundlesandisocrystals-vb4-relative-ampleness); [`VectorBundlesAndIsocrystals:VB4/untilt-positive-line`](#vectorbundlesandisocrystals-vb4-untilt-positive-line); [`VectorBundlesAndIsocrystals:VB4/twisted-local-systems`](#vectorbundlesandisocrystals-vb4-twisted-local-systems); [`VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems`](#vectorbundlesandisocrystals-vb4-integral-frobenius-local-systems); [`VectorBundlesAndIsocrystals:VB4/integral-boundary-realization`](#vectorbundlesandisocrystals-vb4-integral-boundary-realization); [`VectorBundlesAndIsocrystals:VB4/integral-group-torsors`](#vectorbundlesandisocrystals-vb4-integral-group-torsors); [`VectorBundlesAndIsocrystals:VB3:general-BC/sympathetic-vector-spaces`](#vectorbundlesandisocrystals-vb3-general-bc-sympathetic-vector-spaces); [`VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations`](#vectorbundlesandisocrystals-vb3-general-bc-banach-colmez-presentations); [`VectorBundlesAndIsocrystals:VB3:general-BC/exact-banach-points`](#vectorbundlesandisocrystals-vb3-general-bc-exact-banach-points); [`VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian`](#vectorbundlesandisocrystals-vb3-general-bc-dimension-abelian); [`VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples`](#vectorbundlesandisocrystals-vb3-general-bc-standard-dimension-examples); [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature`](#vectorbundlesandisocrystals-vb3-general-bc-curvature); [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hom-orthogonality`](#vectorbundlesandisocrystals-vb3-general-bc-curvature-hom-orthogonality); [`VectorBundlesAndIsocrystals:VB3:general-BC/canonical-curvature-filtration`](#vectorbundlesandisocrystals-vb3-general-bc-canonical-curvature-filtration); [`VectorBundlesAndIsocrystals:VB3:general-BC/euler-poincare-height`](#vectorbundlesandisocrystals-vb3-general-bc-euler-poincare-height); [`VectorBundlesAndIsocrystals:VB3:general-BC/tilted-coherent-heart`](#vectorbundlesandisocrystals-vb3-general-bc-tilted-coherent-heart); [`VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-le-bras-equivalence); [`VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-invariants`](#vectorbundlesandisocrystals-vb3-general-bc-bc-hn-invariants); [`VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition`](#vectorbundlesandisocrystals-vb3-general-bc-bc-hn-decomposition); [`VectorBundlesAndIsocrystals:VB3:general-BC/artinian-bc`](#vectorbundlesandisocrystals-vb3-general-bc-artinian-bc); [`VectorBundlesAndIsocrystals:VB3:general-BC/embedding-height-bound`](#vectorbundlesandisocrystals-vb3-general-bc-embedding-height-bound); [`VectorBundlesAndIsocrystals:VB3:general-BC/bc-morphism-calculus`](#vectorbundlesandisocrystals-vb3-general-bc-bc-morphism-calculus); [`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-point-realization`](#vectorbundlesandisocrystals-vb3-general-bc-torsion-point-realization); [`VectorBundlesAndIsocrystals:VB3:general-BC/affine-finite-length-equivalence`](#vectorbundlesandisocrystals-vb3-general-bc-affine-finite-length-equivalence); [`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing`](#vectorbundlesandisocrystals-vb3-general-bc-torsion-vs-hom-vanishing); [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation`](#vectorbundlesandisocrystals-vb3-general-bc-curvature-hn-characterisation); [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-height-signs`](#vectorbundlesandisocrystals-vb3-general-bc-curvature-height-signs); [`VectorBundlesAndIsocrystals:VB3:general-BC/curvature-subquotients`](#vectorbundlesandisocrystals-vb3-general-bc-curvature-subquotients); [`VectorBundlesAndIsocrystals:VB3:general-BC/torsion-subobjects-height`](#vectorbundlesandisocrystals-vb3-general-bc-torsion-subobjects-height); [`VectorBundlesAndIsocrystals:VB3:general-BC/generating-image-cokernel`](#vectorbundlesandisocrystals-vb3-general-bc-generating-image-cokernel); [`VectorBundlesAndIsocrystals:VB3:general-BC/nonpositive-curvature-extensions`](#vectorbundlesandisocrystals-vb3-general-bc-nonpositive-curvature-extensions); [`VectorBundlesAndIsocrystals:VB3:general-BC/abstract-banach-colmez-category`](#vectorbundlesandisocrystals-vb3-general-bc-abstract-banach-colmez-category); [`VectorBundlesAndIsocrystals:VB3:general-BC/semistable-period-example`](#vectorbundlesandisocrystals-vb3-general-bc-semistable-period-example); [`VectorBundlesAndIsocrystals:VB3:projectivized-properness/scalar-projectivization`](#vectorbundlesandisocrystals-vb3-projectivized-properness-scalar-projectivization); [`VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension`](#vectorbundlesandisocrystals-vb3-general-bc-positive-range-dimension).

The historical companion-reader and aggregate-basic-edge clauses in VB0/G-INTEGRATION and VB3/G-COMPANION must be read with this assembly: the full reader now follows the corrected packets, and the current basic VB3 prerequisites already name the early companion nodes. The original part readers are outside this issue’s edit scope and remain subject to their recorded revisions. External RF3/global stage integration and all mathematical proof obligations remain open. No packet gap or review verdict has been silently removed.

## Corrected source readings

The following findings are inherited from the two independent reviews and retain their stable IDs. Each node above uses its corrected contract, including the extra field, topology and semistability hypotheses. This list summarizes corrections rather than repeating printed excerpts; the packets retain the finding, edition searches and full review evidence.

### VectorBundlesAndIsocrystals/E1 — gap

[KL15](#source-kl15), Proof of Lemma 8.8.4, p. 181 (arXiv 1301.0792v5).

Correction: Since U_1 = D_+(f_1) and U_2 = D_+(f_2) are affine and cover Proj(P_R) (Remark 8.7.6(b)), each H^0(U_i, G) is a finitely generated P_R[f_i^{−1}]_0-module; for m large, f_i^m times each of finitely many generators extends to a global section of G(m), and these sections generate G(m) on U_1 ∪ U_2 = Proj(P_R). (Here d = 1, since f_1, f_2 ∈ P_{L,1}.)

Reason: Sections defined on U_1 alone only generate G(m) over U_1, which misses Z_1 = V_+(f_1); the same argument on D_+(f_2) is needed. The symbol d is not defined in the proof (a leftover from Remark 8.7.6(a)); with the normalization f_1, f_2 ∈ P_{L,1} of Definition 8.8.1 it equals 1.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. At KL p. 181 the proof extends generators only from U1. U2 is required to cover V_+(f1). Definition 8.8.1 chooses degree-one f_i, so the undefined d must be 1.

### VectorBundlesAndIsocrystals/E2 — gap

[KL15](#source-kl15), Proof of Proposition 8.8.6, (a) implies (c), p. 181 (arXiv 1301.0792v5).

Correction: By Proposition 6.2.2 (with N = 1, as ℛ̃_R comes from ℛ̃^int_R) and Theorem 8.7.13, H^1(Proj(P_R), O(e′)) = H^1_{φ^a}(ℛ̃_R(e′)) = 0 for every e′ ≥ 1; take e′ = 1.

Reason: Lemma 8.8.4 asserts that O(e) is globally ample, a statement about generation by global sections; the only way to get vanishing of H^1 from it is the implication (a) ⇒ (c) being proved, so the citation is circular. The vanishing holds by the result named in the parenthesis.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. KL p. 181 cites generation Lemma 8.8.4 for H¹ vanishing while proving the implication from generation to vanishing. The explicitly cited Proposition 6.2.2 proves the required positive-twist vanishing independently.

### VectorBundlesAndIsocrystals/E3 — gap

[KL15](#source-kl15), Proof of Proposition 8.8.6, (b) implies (a), last paragraph, p. 182 (arXiv 1301.0792v5).

Correction: Let n_0 be the integer n chosen in the case e = 0, so that F^{⊗kn_0} is globally generated for k ≫ 0. For general e choose n to be a multiple of n_0 with H^1(Proj(P_R), F^{⊗n}(e − 1)) = 0 (possible, since (c) gives this for all large n) and n′ divisible by n; the argument gives F^{⊗jn}(e) globally generated for j ≫ 0, and tensoring with F^{⊗kn_0} gives F^{⊗mn_0}(e) globally generated for all m ≫ 0. As this holds for every e, F^{⊗n_0} is globally ample (Corollary 8.8.5), and Lemma 8.8.3 gives F.

Reason: The integer n is chosen after e is fixed ('Fix e ∈ ℤ … Choose n sufficiently large so that H^1(Proj(P_R), F^{⊗n}(e − 1)) = 0'), so the conclusion 'F^{⊗n} is globally ample' names a power depending on e, while global ampleness of one power requires generation of its tensor powers twisted by every O(e). The paragraph also uses F^{⊗n′} generated for n′ divisible by the current n, whereas the case e = 0 provides this only for multiples of its own n. Both points are repaired as in the correction.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. In KL pp. 181–182 the chosen n depends on e. Fix n0 from e=0, choose each later n divisible by n0, and express every sufficiently large multiple of n0 as jn+kn0 with j,k large. This gives the required single tensor-power criterion.

### VectorBundlesAndIsocrystals/E4 — error

[CN25-VB0](#source-cn25-vb0), §3.2.2, fourth bulleted consequence, p. 14.

Correction: If E1 and E2 both have slopes in [λ1, λ2], then any extension of E2 by E1 has slopes in [λ1, λ2].

Reason: False as stated: one-sided hypotheses on the two terms cannot bound the slopes of the extension on both sides. Take λ1 = 0, λ2 = 1, E1 = O(5) (slopes ≥ 0) and E2 = O (slopes ≤ 1) on the Fargues-Fontaine curve; the split extension O(5) ⊕ O has a slope 5 ∉ [0,1]. The intended statement is the combination of the two preceding bullets, which do hold. ('Il' is also an untranslated French 'If'.)

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. CN p. 14 prints the one-sided hypotheses. The split extension O(5)⊕O satisfies them for [0,1] and has slope 5. Both terms must have slopes in the interval.

### VectorBundlesAndIsocrystals/E5 — misprint

[FS-geometrization](#source-fs-geometrization), Chapter II, §II.2.2, proof of Proposition II.2.5(iv), p. 63 (arXiv v4).

Correction: we require φ(r_i) = r_{i−n}

Reason: For f = Σ r_iπ^i one has φ(f) = Σ φ(r_i)π^i and πⁿf = Σ r_{i−n}π^i, so φ(f) = πⁿf is equivalent to φ(r_i) = r_{i−n}. The printed relation has the shift in the wrong direction. The convention H⁰(𝒪(n)) = B^{φ=πⁿ} matches 'φ − πⁿ' in the same proof, and the n = 1 case in Proposition II.2.2 reads 'r_i = r_{i+1}^q', i.e. φ(r_{i+1}) = r_i. The conclusion is unaffected, since n consecutive coefficients still determine all the others.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. FS p. 63: comparing π^i coefficients of φ(f)=π^n f gives φ(r_i)=r_{i−n}. The n=1 recurrence in II.2.2 agrees; the number of free coefficients is unchanged.

### VectorBundlesAndIsocrystals/E6 — misprint

[FS-geometrization](#source-fs-geometrization), Chapter II, §II.2.2, proof of Proposition II.2.5(iv), p. 63, last sentence of the paragraph on part (iv) (arXiv v4).

Correction: B_{R,[1,∞]}^{φ^s=p^r}, with λ = r/s as in the statement of (iv).

Reason: In (iv), λ = r/s and BC(𝒪(λ)) has r coordinates, so 𝒪(r/s) has rank s and degree r. The same proof works with H⁰(𝒪(n)) = B^{φ=πⁿ}, via 'φ − πⁿ'. Passing to the degree-s unramified extension, which is how the proof reduces λ to an integer, gives H⁰(𝒪(r/s)) = B^{φ^s=p^r} for E = ℚ_p. As printed, λ = 1/2 would give B^{φ=p²}, the sections of 𝒪(2).

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. FS p. 63 uses λ=r/s but prints φ^r=p^s. The denominator s is the unramified extension degree, so the equation is φ^s=p^r. λ=1/2 distinguishes the equations.

### VectorBundlesAndIsocrystals/E7 — misprint

[FS-geometrization](#source-fs-geometrization), Chapter II, §II.2.2, end of proof of Proposition II.2.5(i), p. 64 (arXiv v4).

Correction: 0 → (𝔸¹_{S♯})^♢ → 𝓑𝓒(𝒪(n)[1])|_S → 𝓑𝓒(𝒪(n+1)[1])|_S → 0 (induction downwards from n+1 to n); equivalently, keep the printed sequence and read 'for n > 1' in place of 'for n < −1'.

Reason: For n < −1 the bundles 𝒪(−n), 𝒪(−n+1) have positive slope, so by (iii) their H¹ vanishes on affinoids and the printed sequence cannot be exact. Take 0 → 𝒪(n) → 𝒪(n+1) → 𝒪_{S♯} → 0 (stated just before, for all n ∈ ℤ) with H⁰(𝒪(n+1)) = 0, since n+1 ≤ −1. Its long exact sequence is exactly the corrected sequence, and it matches the base case n = −1 given just before.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. FS p. 64 inducts at n<−1, where H¹(O(n)) and H¹(O(n+1)) are the negative-twist terms. Printed O(−n) has positive slope and zero H¹, so it cannot perform that induction.

### VectorBundlesAndIsocrystals/E8 — error

[FS-geometrization](#source-fs-geometrization), Chapter II, §II.2.3, proof of Theorem II.2.6: the estimate (II.2.1), p. 65, and the last paragraph of the proof, p. 66 (arXiv v4).

Correction: With the conventions of Proposition II.1.16 (rad = log|[ϖ]|/log|π|, Y_{S,[r,q]} = {|π|^q ≤ |[ϖ]| ≤ |π|^r}) and the normalization ||[ϖ]|| = 1/q, one has |π| = q^{−1/ρ} at radius ρ, so ||π^k||_{B_{R,[r,q]}} = q^{−k/q} for k ≥ 0, not q^{−rk}. The two bounds become q^{−M/q} and q^{(N′−M)/q}, both larger than q^{−M−1}; the printed exponents are those of the reciprocal convention |π| = |[ϖ]|^ρ. The claimed estimate (II.2.1) is itself false as stated, so the proof does not establish global generation as written; the theorem is [KL15, Proposition 6.2.4] and stands, but the quantitative step must be redone (for example following [KL15]). For A = π^N·Id the choice v_i = Σ_j π^{Nj}[ϖ^{Mq^{−j}}]e_i works when (N/r + 1)/(q − 1) ≤ M ≤ (N − q)/(q − 1), i.e. with N made large by twisting and M chosen in a window, not with M large.

Reason: Counterexample to (II.2.1): E = 𝔽_q((π)), S = Spa C, A = π^N·Id with N > 0 (so N′ = N, qN > N′), w = π^M e₁ ∈ π^M W_{𝒪_E}(R⁺)⟨([ϖ]/π)^{±1}⟩^m. Every v with (φ − A)v = w is v = c e₁ + h with c = π^M/(1 − π^N) ∈ E and h ∈ ker(φ − π^N) = H⁰(X_C, 𝒪(N))^m. Writing h = Σ h_iπ^i, φ(h) = π^N h gives h_i^q = h_{i−N}; if |h_M| = 1 then |h_{M−kN}| = 1 for all k ≥ 0 and h cannot converge on Y_{C,[1,q]}, so |h_M| ≠ 1 and the π^M-coefficient of v has absolute value ≥ 1. Hence ||v||_{B_{C,[r,q]}} ≥ sup|π|^M = q^{−M/q} > q^{−M−1} for every M ≥ 1 and 1 < r ≤ q. The same computation on φ^{−1}(w₁) = [ϖ]^{(N−1)/q}π^{M−N+1} gives q^{−M/q}, not the printed q^{−(N−1)/q−r(M−N+1)}.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. FS pp. 65–66 normalize |[ϖ]|=q^−1 and rad=log|[ϖ]|/log|π|; hence |π|=q^−1/ρ. For A=π^N and w=π^M the constant particular solution has size q^−M/q at radius q. A homogeneous eigenvector cannot cancel its unit coefficient without violating convergence along its negative-index recurrence. This contradicts (II.2.1); the KL replacement and G-GG are necessary.

### VectorBundlesAndIsocrystals/E9 — misprint

[FS-geometrization](#source-fs-geometrization), Chapter II, §II.2.3, proof of Theorem II.2.6, p. 66, second display (arXiv v4).

Correction: φ(A^{−1}w₂) ∈ π^{−N′}[ϖ]^{Nq}π^{M−N}W_{𝒪_E}(R⁺)⟨π/[ϖ], [ϖ]^q/π⟩^m, which lies in π^{M+1}W_{𝒪_E}(R⁺)⟨([ϖ]/π)^{±1}⟩^m when (q − 1)N > N′, not qN > N′. Since N ≤ N′, twisting (N, N′) ↦ (N + n, N′ + n) achieves (q − 1)N > N′ only for q ≥ 3; in general one splits w at the power K of [ϖ]/π with (N′ + 1)/(q − 1) ≤ K ≤ 1 + (N − 1)q/(q − 1), which exists after twisting because qN − N′ grows with n.

Reason: w₂ ∈ [ϖ]^Nπ^{M−N}W⟨[ϖ]/π⟩ (as printed just above), so φ(w₂) ∈ [ϖ]^{qN}π^{M−N}W⟨[ϖ]^q/π⟩, and φ(A^{−1}) ∈ π^{−N′}W⟨π/[ϖ], [ϖ]^q/π⟩ because A^{−1} ∈ π^{−N′}W⟨π/[ϖ]^{1/q}, [ϖ]/π⟩. On Y_{S,[1,1]} (|π| = |[ϖ]|) the product has size |π|^{M + (q−1)N − N′}. N ≤ N′ because A·A^{−1} = 1 and 1 ∉ π·W⟨([ϖ]/π)^{±1}⟩. The printed factor π^M drops π^{−N}.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. FS p. 66 writes w2 with π^{M−N}, then drops π^−N after applying φ(A^−1). On |[ϖ]|=|π| the actual exponent is M+(q−1)N−N′. The proposed cutoff K has lower bound (N′+1)/(q−1) and upper bound 1+(N−1)q/(q−1), so the corrected two inequalities work also at q=2 after twisting.

### VectorBundlesAndIsocrystals/E10 — misprint

[FS-geometrization](#source-fs-geometrization), Chapter II, §II.2.3, proof of Proposition II.2.7 (GAGA), p. 67, first sentence (arXiv v4).

Correction: The chart maps D(g) → D₊(g) are formal and glue to a morphism ⋃_g D(g) → X^alg; this union is all of X because 𝒪_X(n) is globally generated for large n, which is a hypothesis of the proposition.

Reason: For an arbitrary line bundle the D(g), g ∈ P_n with n > 0, need not cover X: for X = ℙ¹ and 𝒪_X(1) replaced by 𝒪(−1), P = ⊕ H⁰(𝒪(−n)) is concentrated in degree 0 and ⋃ D(g) is empty (cf. Stacks 01XS). The accepted restructuring RS-20 (research/blueprint/restructure/RS-20.result.json) records the same point and places the global morphism after global generation, in VectorBundlesAndIsocrystals:VB2:ampleness. The result is unaffected since the hypothesis holds.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. FS p. 67 claims the chart construction has no hypotheses. With a negative line bundle on P¹, every positive-degree section vanishes and the chart union is empty. Generation is required to cover X, precisely the RF3/global-Proj separation in RS-20.

### VectorBundlesAndIsocrystals/E11 — misprint

[FF18-courbes](#source-ff18-courbes), Théorème 5.5.3 and the following sentence, printed p. 163 (PDF p. 223), current 404-page author copy.

Correction: The point (rg(X'), deg(X')) lies below HN(X); HN(X) is the concave envelope of the points (rg(X'), deg(X')).

Reason: HN(X) is defined just before as the concave polygon from (0,0) with slopes µ(X_i/X_{i−1}) = deg/rg and multiplicities rg(X_i/X_{i−1}), so its abscissa is the rank and its ordinate the degree (slope = Δdeg/Δrg). With the printed coordinates the statement is meaningless: e.g. on P^1 with X = O(1) ⊕ O(−1), HN(X) joins (0,0), (1,1), (2,0) on [0, 2], while the printed point of X' = O(−1) is (−1, 1).

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. Current FF printed p. 163 defines segment slopes as degree/rank and horizontal lengths as ranks, then reverses the coordinates in Theorem 5.5.3. The point must be (rank,degree), as used by this polygon node.

### VectorBundlesAndIsocrystals/E12 — misprint

[FF18-courbes](#source-ff18-courbes), Définition 5.5.5, printed p. 164 (PDF p. 224), current 404-page author copy.

Correction: … for every nonzero strict subobject X' ≠ X of X, µ(X') < µ(X).

Reason: Taking X' = X gives µ(X) < µ(X), so as printed no nonzero object is stable, and Proposition 5.5.6 ('les objets simples de C^ss_λ sont les objets stables de pente λ') would say C^ss_λ has no simple objects, contradicting finite length (and Corollaire 5.6.28, where O_X(λ) is simple).

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. Current FF printed p. 164 excludes only the zero strict subobject in Definition 5.5.5; identity is also strict. Testing X′=X forces μ(X)<μ(X). Add X′≠X to agree with the following simple-object characterization.

### VectorBundlesAndIsocrystals/E13 — misprint

[FF18-courbes](#source-ff18-courbes), §8.2.3, printed p. 236 (PDF p. 296); also §8.1.2 p. 229, §8.2.1.2 p. 234 and §8.2.2 p. 235, current 404-page author copy.

Correction: L = W_{O_E}(F̄_q)_Q = W_{O_E}(F̄_q)[1/π], the fraction field. Likewise on p. 229 « D = O_{E_n}[Π], W_{O_E}(F_{q^n}) = E_n|E étant l'extension non-ramifiée » should read D = E_n[Π] with E_n = W_{O_E}(F_{q^n})_Q (O_D = O_{E_n}[Π] is the maximal order, as stated two lines later), and on p. 235 « E_h = W_{O_E}(F_{q^h}) » should be W_{O_E}(F_{q^h})_Q; likewise on p. 234 « E_h = W_{O_E}(F̄_q)^{φ_E^h=Id} » should be (W_{O_E}(F̄_q)_Q)^{φ_E^h=Id}.

Reason: Définition 8.2.5 immediately defines isocrystals as finite-dimensional 'L-espaces vectoriels', which requires L to be a field; in 8.1.1 the same text writes Ĕ = W_{O_E}(F̄_q)_Q with the subscript Q. On p. 229 the same symbol O_{E_n}[Π] is used both for the division algebra D and for its maximal order O_D.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. Current FF pp. 229,234–236 write Witt rings where fields and a division algebra are required. Invert π: in particular L must be a field for Definition 8.2.5, and E_n[Π] is the algebra whereas O_{E_n}[Π] is its order.

### VectorBundlesAndIsocrystals/E14 — misprint

[FF18-courbes](#source-ff18-courbes), §8.2.3, printed p. 238 (PDF p. 298), current 404-page author copy.

Correction: Fib_{X_E} ⇄ Fib_{X_{E'}}.

Reason: The category of vector bundles is denoted Fib_X throughout (e.g. Prop. 8.2.6: « ℰ(−) : ϕ-Mod_L −→ Fib_X »); 'Fix' is not defined.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. Current FF printed p. 238 uses Fix in the coefficient-adjunction diagram; Fib is the defined bundle category used in Proposition 8.2.6. This is a category-name misprint.

### VectorBundlesAndIsocrystals/E15 — misprint

[KL15](#source-kl15), arXiv:1301.0792v5, Lemma 6.3.17, printed p. 142; compare Definition 6.2.1, p. 135 and Remark 6.3.16, p. 142. Finding is scoped to this preprint, not an unread publisher edition..

Correction: Use eigenvalue pⁿ on the left, or M(−n) on the right. Our Γ_n is ker(φ−πⁿ). The norm-equivalence proof for the displayed eigenvalue can be reindexed by n↦−n.

Reason: Definition 6.2.1 multiplies Frobenius on M(n) by p⁻ⁿ. Being fixed in M(n) therefore means p⁻ⁿϕᵃ(v)=v, hence ϕᵃ(v)=pⁿv. On a rank-one module with ϕᵃ(v)=pv, the generator is fixed in M(1), while the printed p⁻¹ eigenspace is zero. The fixed-n norm-independence conclusion survives this relabelling.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB0`. KL Definition 6.2.1 on p. 135 defines φ_{M(n)}=p^−n φ_M. Fixed vectors therefore satisfy φ_M(v)=p^n v, whereas Lemma 6.3.17 p. 142 prints p^−n. Reindex by −n; fixed-n norm equivalence survives. The packet’s rank-one π-eigenvalue test separates the two kernels.

### VectorBundlesAndIsocrystals/E16 — misprint

[CN25-VB3](#source-cn25-vb3), Lemma 3.16, end of proof, p. 17.

Correction: implies h > d

Reason: The inequality is reversed relative to both the lemma and its own proof. The lemma asserts dim(W) < ht(W), i.e. d < h, and three lines earlier the proof states its goal as 'we need to show that h > d'. Dimension additivity (Proposition 3.2(ii)) applied to the injection U_λ ↪ V^h gives Dim Coker = (h−d, −h), and ht Coker = −h < 0 forces dim Coker > 0 by Proposition 3.2(iii), i.e. h > d.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at CN5.pdf p. 17 (page image checked): the proof states its goal as h>d and ends "implies h < d, as wanted". The injection U_λ↪V^h gives Dim coker=(h−d,−h), and Proposition 3.2(iii) forces h>d. Misprint; nothing else affected.

### VectorBundlesAndIsocrystals/E17 — error

[CN25-VB3](#source-cn25-vb3), Corollary 3.21(iv), p. 18.

Correction: A quotient of height 0 of a BC of curvature ≥ 0 has Harder-Narasimhan slope 0, i.e. is of the form ⊕_x H^0(X,F_x) with each F_x torsion; it has curvature 0 only if in addition the support is {∞}, equivalently if it is a B^+_dR-Module.

Reason: The statement is refuted by the paper's own footnote 9 on the same page, which records that for x ≠ ∞ the object U_1/Q_p t_x has ht = 0 but curvature > 0. Take W = U_1/Q_p t_x with x ≠ ∞ and let the quotient be the identity: W is of curvature > 0, hence of curvature ≥ 0, has height 0, and is a quotient of itself, so (iv) would give it curvature 0. But curvature 0 and curvature > 0 are incompatible for W ≠ 0: a nonzero object of curvature 0 is a finite length B^+_dR-module by Proposition 3.17 and so admits a nonzero map to V_1, whereas §3.2.7 computes Hom_BC(U_1/Q_p t_x, V_1) = 0 and End = C_x. The asymmetry with the correct part (ii) is that curvature ≤ 0 already forces support at ∞ (Corollary 3.19(i)), while curvature ≥ 0 does not.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at p. 18 with footnote 9. U₁/Q_p t_x (x≠∞) has curvature >0, hence ≥0, height 0, and is its own quotient, but it is not affine (Hom to V₁ is 0 by §3.2.7). The corrected statement follows from (3.14): a height-0 quotient of a curvature ≥0 object has only torsion summands.

### VectorBundlesAndIsocrystals/E18 — misprint

[CN25-VB3](#source-cn25-vb3), §3.2.7, p. 17.

Correction: Hom_{Coh_X}(i_{x,*}B_1, i_{∞,*}B_1) = 0

Reason: The left-hand side is the case m = 1, so both sheaf indices should be 1: under the isomorphism H^0(X, i_{x,*}B_m) = U_m/Q_p t_x^m displayed just above, U_1/Q_p t_x corresponds to i_{x,*}B_1, and V_1 = B_1 corresponds to i_{∞,*}B_1. The vanishing conclusion holds for any indices, the two sheaves being supported at distinct points, but as printed the two sides do not correspond.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at p. 17: the displayed Hom uses B_m on both sides for the m=1 object U₁/Q_p t_x. Index misprint; the vanishing holds for any indices.

### VectorBundlesAndIsocrystals/E19 — error

[CN25-VB3](#source-cn25-vb3), Corollary 3.20(b), p. 18.

Correction: a nonzero BC of curvature < 0 has height > 0

Reason: The nonvanishing hypothesis is missing: W = 0 has curvature < 0, injecting into B_dR^0, and height 0. By Corollary 3.19(i) a BC of curvature < 0 is H^0(X,E) for E a vector bundle of slopes ≥ 0, and Remark 3.11 gives ht(W) = rk E, which is > 0 precisely when W ≠ 0. A degenerate case only, recorded because a formalisation must carry the hypothesis.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at p. 18: W=0 has curvature <0 and height 0. Nonzero hypothesis needed; the node carries it.

### VectorBundlesAndIsocrystals/E20 — gap

[CN25-VB3](#source-cn25-vb3), Lemma 3.16, proof, p. 17.

Correction: λ = d/h ≥ 0, the summand λ = 0 being treated separately

Reason: The reduction is incomplete. The hypothesis that W contains no V_1 rules out torsion-at-∞ summands and, by §3.2.8, the summands of negative curve slope, but it does not rule out Q_p = U_0: indeed Q_p ⊂ V_1 ⊂ V_N, so the decomposition (3.14) of a sub-BC of V_N may have U_0 summands. Only the proof is incomplete, not the statement: for Q_p one has dim = 0 < 1 = ht and slope −∞ < −1, so the conclusion holds trivially.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at p. 17: Q_p=U₀ ⊂ V₁ ⊂ V_N contains no V₁ and is a possible summand of a sub-BC of V_N; the reduction to λ>0 omits it. The conclusion holds trivially for it, so only the proof is affected.

### VectorBundlesAndIsocrystals/E21 — misprint

[KL15](#source-kl15), Proof of Lemma 7.1.2, display after (7.1.2.1), p. 146 (arXiv 1301.0792v5).

Correction: F_{l+1} = U_{l+1}^{−1} F φ^a(U_{l+1}) = (1 + Z_l)^{−1} F_l (1 + φ^a(Z_l))

Reason: Condition (b) defines F_l = U_l^{−1} F φ^a(U_l), the matrix of φ^a on the basis given by U_l. With U_{l+1} = U_l(1 + Z_l) one gets U_{l+1}^{−1} F φ^a(U_{l+1}) = (1 + Z_l)^{−1} U_l^{−1} F φ^a(U_l)(1 + φ^a(Z_l)) = (1 + Z_l)^{−1} F_l (1 + φ^a(Z_l)), which is the second expression; U_{l+1}^{−1} F φ^a(U_l) equals (1 + Z_l)^{−1} F_l instead.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at KL p. 146: the printed definition of F_{l+1} uses φ^a(U_l); with U_{l+1}=U_l(1+Z_l) the displayed right-hand side equals U_{l+1}^{−1}Fφ^a(U_{l+1}). Index misprint.

### VectorBundlesAndIsocrystals/E22 — misprint

[KL15](#source-kl15), Lemma 8.5.11, p. 173 (arXiv 1301.0792v5).

Correction: Then the pure locus and the étale locus of M are open and (when X is an adic space over an analytic field, so that its real quotient and partial properness are defined) partially proper.

Reason: The loci belong to the φ^d-module M (Definitions 7.2.3 and 8.5.9), not to the sheaf of rings ℛ̃_X. Partial properness (Definition 8.2.11) and Lemma 8.2.12 are set up only for spaces over an analytic field, which a perfect uniform adic space over 𝔽_{p^d} need not be; Definition 8.5.9 itself says 'when the latter is defined'.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at KL p. 173: the loci belong to M, and partial properness (Definition 8.2.11, p. 160) is set up for adic Banach rings over an analytic field. Misprint plus the needed scope.

### VectorBundlesAndIsocrystals/E23 — misprint

[KL15](#source-kl15), Example 8.5.17, first paragraph, p. 174 (arXiv 1301.0792v5).

Correction: Let σ_q : B_1 → B_2 be the substitution T ↦ q²T (an isomorphism from the ring of the circle |T| = ω² onto that of |T| = 1); equivalently, B_2 → B_1 is T ↦ q^{−2}T.

Reason: In B_1 = K{ω²/T, T/ω²} one has |T| = ω², so a map B_2 → B_1 with T ↦ q²T would send the power-bounded unit T^{−1} of B_2 = K{1/T, T} to q^{−2}T^{−1}, of norm ω^{−4} > 1; it is not a bounded homomorphism. The example subsequently uses σ_q in the direction B_1 → B_2: 'x2 = pσq(x1) ∈ ẼS2 = W(S2)[p−1]' with x_1 ∈ ℰ̃_{S_1}.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at KL p. 174: T ↦ q²T sends the power-bounded unit T^{−1} of B₂ to q^{−2}T^{−1}, of norm ω^{−4}>1 in B₁, so it is not a bounded map B₂→B₁; the example itself applies σ_q from S₁ to S₂.

### VectorBundlesAndIsocrystals/E24 — misprint

[KL15](#source-kl15), Example 8.5.17, first paragraph, p. 174 (arXiv 1301.0792v5).

Correction: … of the Tate curve over K for the parameter q².

Reason: No space X is defined in the example; the Tate curve is over the base field K = 𝔽_p((q)), as the next sentence ('a smooth projective curve over K of genus 1') says.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at KL p. 174: no space X is defined; the next sentence says the curve is over K.

### VectorBundlesAndIsocrystals/E25 — misprint

[KL15](#source-kl15), Example 8.5.18, p. 175 (arXiv 1301.0792v5).

Correction: … over ℰ̃_X, ℛ̃^bd_X, ℛ̃_X …

Reason: The paper has no ring Ẽ^bd (Definitions 5.1.1 and 8.3.4); the three rings of Theorems 8.5.8 and 8.5.12 and of Remark 7.3.5 are ℰ̃, ℛ̃^bd and ℛ̃.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at KL p. 175: the text prints Ẽ^bd_X; the rings of Theorems 8.5.8 and 8.5.12 are ℰ̃, ℛ̃^bd, ℛ̃.

### VectorBundlesAndIsocrystals/E26 — gap

[KL15](#source-kl15), Example 8.5.18, p. 175, as invoked in Remark 7.3.5, p. 149 (arXiv 1301.0792v5).

Correction: To justify the ring-level invocation, show that the nodal sheaf modules descend to φ-modules over ℰ̃_R and ℛ̃^bd_R. A proposed route is the nodal fibre-product description A≅{(f,g)∈K{X}²:f(±1)=g(±1)} for p≠2, its completed perfection and the corresponding Witt/Robba fibre products, followed by Milnor patching with transitions 1 and p. The completed/bounded coefficient-ring fibre-product statements and φ compatibility must be verified (G-PATCH); the established statement in this packet remains sheaf-level.

Reason: Remark 7.3.5's claim concerns φ-modules over the rings ℰ̃_R and ℛ̃^bd_R, and 'globally étale' is defined for them (Definition 7.3.4). Example 8.5.18 produces modules over the sheaves ℰ̃_X, ℛ̃^bd_X, and Remark 8.5.10 with Example 8.5.17 shows that such modules need not descend to ℰ̃_R, ℛ̃^bd_R. Over ℛ̃_R there is no gap, since Corollary 6.3.13 makes the functor an equivalence. With the descent supplied, the claim of Remark 7.3.5 holds.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at KL pp. 149, 172–175. Remark 7.3.5 claims (c)⇏(a) over the rings ℰ̃_R, ℛ̃^bd_R, but Example 8.5.18 only produces modules over the sheaves, and Remark 8.5.10 with Example 8.5.17 shows such modules need not descend. Gap in the proof of the ring-level claim; the packet keeps the sheaf-level statement and records G-PATCH.

### VectorBundlesAndIsocrystals/E27 — error

[KL15](#source-kl15), Definition 8.8.18 and Lemma 8.8.19, p. 186; also the proofs of Lemma 8.8.13 (p. 184) and Theorem 8.8.15 (p. 185) and Conjecture 8.8.20 (p. 186) (arXiv 1301.0792v5).

Correction: … L_X is pure of slope 1/a … the φ^a-module corresponding to L_X is globally pure of slope 1/a (globally (1, a)-pure). Likewise deg O(−1) = −1/a: in the proof of Lemma 8.8.13 read 'deg(H_1) ≥ −1/a with equality only if H_1 = O(−1)' (the conclusion deg(H) ≥ 0 still follows because degrees lie in a^{−1}ℤ); in the proof of Theorem 8.8.15 read 'nα_m − 1/a ≥ 0'; in Conjecture 8.8.20, deg(F) takes values in a^{−1}ℤ and the twist is F(−a·deg(F)). Everything is as printed when a = 1.

Reason: Definition 7.2.1 computes degrees of φ^a-modules with Convention 4.1.13 (the p-adic valuation of the determinant, with the sign of Remark 4.1.12, divided by a), and 'pure of slope s' means admitting a (c, d)-pure model, (p^c φ^d)^*M_0 ≅ M_0, with c/d = s (Definitions 7.3.1, 7.3.4). The proof of Lemma 8.8.19 identifies the φ^a-module of L_X with M(1), where M is free on v with φ^a(v) = z_1^{−1}z v and is étale; in M(1) (Definition 6.2.1) φ^a acts by p^{−1} times this unit, so p·φ^a preserves an étale model and M(1) is (1, a)-pure, of degree and slope 1/a. The ampleness conclusions only use positivity and are unaffected.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at KL pp. 105–106, 147–149, 184–186. Convention 4.1.13 divides the degree of a φ^d-module by d, and Definition 7.3.4 defines slope as c/d for a (c,d)-pure model. M(1) has p·φ^a preserving an étale model, so it is (1,a)-pure of slope 1/a. The printed "slope 1" holds only for a=1; ampleness conclusions are unaffected.

### VectorBundlesAndIsocrystals/E28 — misprint

[FS-geometrization](#source-fs-geometrization), FS Proposition II.3.1, p. 75.

Correction: semistable of slope 1/r

Reason: F has rank dr and degree d in the proof; for general d,r its degree is not 1/r. Binding RS15 already records this correction.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at FS p. 75 (author PDF; also arXiv 2102.13459v4, p. 75): "semistable of degree 1/r". F has rank dr and degree d, so slope 1/r is meant; II.3.3(i) prints "slope".

### VectorBundlesAndIsocrystals/E29 — misprint

[FS-geometrization](#source-fs-geometrization), FS proof of Proposition II.3.2, p. 77.

Correction: we set m = d.

Reason: O(1/r) has rank r and degree 1. In 0→G→O(1/r)^m→E→0 with G of slope zero and deg(E)=d, degree additivity forces m=d. dr is the rank of the middle term, not its number of copies. For r=2,d=1 the printed choice gives degree 2 instead of 1.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at FS p. 77 (author PDF; also arXiv v4): O(1/r) has rank r and degree 1, so 0→G→O(1/r)^m→E→0 with G of slope 0 and deg E=d forces m=d. Misprint in the proof.

### VectorBundlesAndIsocrystals/E30 — error

[CN25-VB3](#source-cn25-vb3), CN author preprint, Lemma 3.16, pp. 16–17.

Correction: For NONZERO such W, dim(W)<ht(W); every such W, including zero, has all HN slopes <−1.

Reason: The zero subobject has no V1 and dim=ht=0, contradicting the strict inequality. Positive and finite-Q_p nonzero cases prove the corrected claim; the empty slope multiset accounts for the zero case.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Read at CN5.pdf pp. 16–17: the zero sub-BC contains no V₁ and has dim=ht=0. The strict inequality needs W≠0; the slope clause holds vacuously.

### VectorBundlesAndIsocrystals/E31 — error

[CN25-VB3](#source-cn25-vb3), CN author copy CN5.pdf, §3.2.6(2), p. 17.

Correction: n(λ1,λ2) = h1h2/h; and Hom(O(λ1),O(λ2)) = H⁰(O(λ1)^∨⊗O(λ2)) = H⁰(O(λ2−λ1))^{n(−λ1,λ2)}, which equals Hom(O,O(λ2−λ1)) only when h1h2 equals the denominator of λ2−λ1 (for instance when λ1 is an integer).

Reason: Ranks: O(λ1)⊗O(λ2) has rank h1h2 and each copy of O(λ1+λ2) has rank h, so n=h1h2/h. For λ1=λ2=1/2 one has O(1/2)⊗O(1/2)≅O(1)^4, while the printed formula gives n=(2/2)·1=1. For the Hom formula, Hom(O(1/2),O(1/2))=End(O(1/2)) is the quaternion algebra D_{1/2}, of Q_p-dimension 4, whereas Hom(O,O)=Q_p. The surrounding text (End_BC(U_λ)=D_λ in item (1)) is correct.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Found by this review at the page image of CN5.pdf p. 17; the rank count and the O(1/2) example settle it. The packet already avoided the formula (bc-morphism-calculus imports multiplicities from the companion) without recording it.

### VectorBundlesAndIsocrystals/E32 — misprint

[FS-geometrization](#source-fs-geometrization), FS proof of Proposition II.3.5, p. 80 (author PDF; same text in arXiv 2102.13459v4).

Correction: The third term is BC(G^∨[1]), with G^∨ semistable of slope −1/(2r): Corollary II.3.3(iv) is applied to the dual of E′1, giving 0→G→O(1/r)^m→E′→0 with G of slope 1/(2r), and dualizing gives 0→E′^∨→O(−1/r)^m→G^∨→0.

Reason: BC(−[1]) is defined only for bundles with negative slopes, and the cited Proposition II.2.5(i) concerns λ<0. A positive-slope G would have no negative Banach–Colmez space and H¹ vanishing locally, so the displayed separatedness argument only makes sense for G^∨.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Found by this review; the sign follows from dualizing the II.3.3(iv) sequence, as the use of II.2.5(i) requires.

### VectorBundlesAndIsocrystals/E33 — misprint

[SW20](#source-sw20), SW20, discussion after Definition 15.2.11, book p. 139 (PDF p. 149).

Correction: BC(O_XFF(−1)[1]) = G_{a,C}/Q_p.

Reason: BC(O(−1)) is the H⁰ sheaf, which is zero since O(−1) has negative slope; the displayed sequence 0→BC(O(λ+1))→G_a^r→BC(O(λ)[1])→0 with λ=−1, r=1 gives G_a/Q_p as the shifted space BC(O(−1)[1]) of Definition 15.2.11.

Review: `confirmed` by `REV-VectorBundlesAndIsocrystals--VB3`. Found by this review while checking AbstractBCTest.quotient, which uses the corrected identity.

## Integration and upstream notes

The [handoff](../handoff/ASM-VectorBundlesAndIsocrystals.md) preserves all 32 supplier requests and all six restructuring proposals, with their exact needed-by declarations and ownership. It records which internal companion requests now resolve to nodes and which need external integration; it also preserves the part-review limitations. This assembly changes no Tau Ceti roadmap, link, data or ownership assignment.

- VB0: **roadmaps**: `tauceti:TauCetiRoadmap/ClassFieldTheory`  **note**: The Layer 9 carrier/topology applies to every local field, but its localWeilArtinEquiv reciprocity comparison is explicitly restricted to finite extensions of Q_p because Layer 8 excludes equal-characteristic p-primary existence. The downstream VS1 divisor/Weil construction must respect that scope or identify a separate equal-characteristic reciprocity supplier. This review changes no Tau Ceti roadmap or link.
- VB3: **roadmap**: ReductiveGroups  **detail**: The integral reconstruction needed by SW19.5.2/22.6.1 is outside the field-only Layer1 contract. This packet requests the extension as ReductiveGroups, PartII and does not edit or replan upstream.
- VB3: **roadmap**: VectorBundlesAndIsocrystalsPartII  **detail**: CN §3.3 h(W)=Hom_VS(W,BdR), its Ext correction and rank=height theorem belong to accepted routed items331–333 in PartII. The parent supplies BC, Le Bras, curvature and Hom vanishing only. No duplicate h construction is planned here.
