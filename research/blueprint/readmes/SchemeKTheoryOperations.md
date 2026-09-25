# K-theory of schemes, localisation and operations

*Roadmap `SchemeKTheoryOperations`, stages S.1–S.7.*

This document is definitive. Its machine form is the packet `research/blueprint/packets/SchemeKTheoryOperations.json`, from which it is generated, so that the two agree. The suggested Lean file `research/blueprint/suggested/SchemeKTheoryOperations.lean` is a naming proposal, not an implementation; implementationStatus is `unchecked` for every node. Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Purpose and scope

This roadmap plans the K-theory of schemes: the categories of perfect complexes and coherent sheaves that define K and G; their functoriality; the localisation, descent and coniveau theorems that compute them; the fundamental formulas for affine lines, projective bundles and blow-ups; and the products, λ- and Adams operations, Chern character and Riemann–Roch theorems that relate K-theory to cycles. Each layer is planned only as far as the accepted restructuring RS-18 allows. Generic unbounded derived sheaves, categorical K-theory, ring-level low-degree operations and Chow-theoretic intersection theory are imported from their owners.

- **S.1.** Perfect and strictly perfect complexes on an arbitrary scheme are defined locally. It proves locality, triangulated closure, stability under pullback and essential smallness on qcqs schemes, and the comparison D_perf(A) ≃ D_perf(Spec A) for every ring. It builds the complicial Waldhausen and Frobenius-pair models of Perf(X), compared with EnhancedDerivedSheaves E1. It proves the resolution property and the vector-bundle comparison it licenses; the doubled affine plane shows the comparison fails without it.
- **S.2.** K(X) is the K-theory of Perf(X), with its nonconnective version, and G(X) is the K-theory of coherent sheaves on noetherian X. It proves derived pullback, proper pushforward on G and on K for proper perfect morphisms, composition, Tor-independent base change, the projection formula and the affine comparisons. The Cartan map K → G is an equivalence for regular noetherian schemes and agrees in degree zero with Tau Ceti's Cartan map; for k[ε]/(ε²) it is not an equivalence. It also proves continuity along affine limits and that perfect equals compact.
- **S.3.** It gives the support categories and the nonconnective fibre sequence K(X on Z) → K(X) → K(U) for qcqs X, with excision, naturality of the boundary, and the comparison with Quillen's localisation and with G-theory. Regular dévissage is stated with non-examples. This stage owns the DVR boundary with ∂(λ(u)) = v(u)·[k] (RS-18 owner 13), with the applications to Dedekind domains, regular curves and regular arithmetic surfaces.
- **S.4.** Zariski and Nisnevich descent come from Mayer–Vietoris squares, with the K-sheaves and the Brown–Gersten–Thomason descent spectral sequence. It builds the coniveau spectral sequences of K and G with their residue differentials, Quillen's Gersten theorem for smooth varieties over fields, and Bloch's formula. Mixed-characteristic statements are kept separate and scoped to their sources.
- **S.5.** It proves homotopy invariance for regular noetherian schemes, and the projective-bundle theorem with the generators [O(−i)] and its P¹ coordinates. It gives the scheme form of Bass's fundamental theorem, keeping the Nil terms for singular schemes, and Thomason's blow-up formula along a regular centre with its exceptional-divisor tests.
- **S.6.** Products with supports are extended from GeneralAlgebraicKTheory K.7. It builds special λ-rings, Adams operations and the γ-filtration; λ- and Adams operations on higher K-theory of rings and regular schemes (Quillen–Hiller–Kratzer, Soulé, Gillet–Soulé); and the weight decomposition with its ranges and denominators. It records the weight shifts of Gysin maps, transfers and residues.
- **S.7.** It gives the scheme γ-filtration normalised against KTheoryLowDegrees Z.3, the Chern character, and Grothendieck's γ–Chow comparison. Riemann–Roch is stated for the actual K- and G-theory pushforwards, including Adams–Riemann–Roch, together with Thomason's excess-intersection and self-intersection formulas.

## Boundaries

The roadmap imports what other roadmaps own and plans nothing twice. The accepted restructuring RS-18 fixes the owners. The requests section at the end lists each import with the nodes that need it.

**Suppliers.**
- **EnhancedDerivedSheaves.** E0–E1: generic unbounded complexes of sheaves of modules, replacements and the enhanced pullback/pushforward adjunction.
- **DeformationAndDerivedPatchingAlgebra.** P7 (and R03.3): perfect modules over complete noetherian local rings, identified with S.1's affine notion on overlap.
- **GeneralAlgebraicKTheory.**
  - K.1–K.7: K-theory of exact, Waldhausen and Frobenius-pair categories; the resolution, dévissage and localisation theorems; derived invariance; the nonconnective theory and the ring fundamental theorem with Nil terms (K.6); products (K.7).
  - K.2:plus: the plus-construction model used for loops of matrices.
- **StableHomotopyKTheory.** H.1–H.6: classifying spaces, homotopy fibres, the plus construction, spectra and homotopy limits.
- **KTheoryLowDegrees.** Z.1–Z.4 and U.1–U.3: ring K₀ and its rank, the K₀ ring with λ, γ and determinant (Z.3, whose normalisation S.6 and S.7 extend), Dedekind domains, and K₁ with the determinant.
- **SchemeAndStackFoundations.** SF.2 (quasi-coherent and coherent cohomology) and SF.5 (Chow groups, Chern classes, intersection, excess intersection, deformation to the normal cone and source-scoped Grothendieck–Riemann–Roch).
- **AdicCoefficientsAndComparisons.** L2: absolute noetherian approximation.
- **AlgebraicModuliForArithmeticGeometry.** R09.1 (projective bundles) and R09.7a (blow-ups).
- **The Tau Ceti roadmaps.** GrothendieckEulerForms (layer 4, the degree-zero Cartan map), JacobianChallenge (layers A–B: divisors, line bundles, coherent cohomology of curves), StableReduction (layer 4, blow-ups) and ClassicalGroups (layer 4, characters).
- **The libraries.**
  - Mathlib supplies schemes, sheaves of modules, homological complexes, quasi-isomorphisms and derived categories, the tilde functor, Proj, limits of schemes along affine maps and algebraic cycles.
  - Tau Ceti supplies split and exact K₀, the degree-zero Cartan map, finitely presented sheaves, Weil divisors, invertible sheaves and Riemann–Roch for function fields.

**Consumers.** The nodes supply what each consumer has asked for:
- EllipticKTheory E.2–E.8 (functoriality, localisation, coniveau, projective bundle, Adams operations, self-intersection);
- EllipticRegulators ER.6;
- KTheoryFiniteLocalFields L.1;
- Polylogarithms P.3–P.5;
- KTheoryLowDegrees U.5/U.6 (the DVR boundary) and Z.5/Z.6.

**Blocked by the current stage graph.**
- The tame-symbol identification that RS-18 gives S.3 through K2SymbolsBrauer T.3 lies downstream of S.3. It is a gap with a restructure proposal.
- The open blueprints of GeneralAlgebraicKTheory K.6 and K.7 cite S.5 and S.6 as prerequisites. They would close cycles, because the atlas makes S.2 require K.6 and S.6 require K.7.

## Conventions

- **Perfect complexes.** A complex of O_X-modules is perfect if it is locally quasi-isomorphic to a bounded complex of finite locally free modules (strictly perfect). This is equivalent to pseudo-coherent with locally finite Tor-amplitude (S.1). No global bounded vector-bundle model is assumed without the resolution property.
- **K and G.** K(X) is the K-theory of the complicial Waldhausen category (equivalently, the Frobenius pair) of perfect complexes. K^B(X), or K(X) with negative groups, is the nonconnective version. G(X) is the K-theory of coherent sheaves on a noetherian scheme. The Cartan map K → G is an equivalence only for regular X.
- **Supports.** K(X on Z) is the K-theory of perfect complexes acyclic off Z. K(X on Z) = K(Z) is claimed only through regular dévissage, and otherwise G-theory or the support category is kept.
- **The boundary.** The localisation boundary is right-linear, ∂(x·y) = x·∂(y) (K-book V.6.6.1). For a DVR, ∂(λ(π)) = +[k], where λ is the loop of a 1 × 1 matrix. The left-linear convention of KTheoryFiniteLocalFields L.2 and EllipticKTheory E.3 differs by (−1)^{n−1} on K_n.
- **λ-rings.** λ-rings are special λ-rings. The Adams operations satisfy the Newton formula ψ^k − λ¹ψ^{k−1} + … + (−1)^k kλ^k = 0, and the γ-filtration is that of an augmented λ-ring. Weights, denominators and the ranges in which the weight decomposition is proved are stated where they are used.
- **K-book locators.** PDF page = book page + 8, in the author-hosted draft of 29 August 2013. Thomason–Trobaugh locators are to the published pages.

## Sources

Every statement below is taken from these sources, at the versions recorded; locators name the statement and, where the packets give it, the page. Excerpts are quoted literally, from the LaTeX source or the PDF text.

- **The K-book: an introduction to algebraic K-theory**, Charles A. Weibel. Author-hosted combined draft of 29 August 2013 (Kbook.pdf); PDF page = book page + 8; the published AMS GSM 145 numbering differs. <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf> (source id `Kbook.2013`).
- **Corrections to “The K-book: an introduction to algebraic K-theory”**, Charles A. Weibel. Author's errata list for AMS GSM 145 (2 pages), page numbers of the published book. <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf> (source id `Kbook.errata`).
- **Higher algebraic K-theory of schemes and of derived categories**, R. W. Thomason and Thomas Trobaugh. The Grothendieck Festschrift, vol. III, Progr. Math. 88, Birkhäuser 1990, pp. 247–435; scanned copy of 189 PDF pages, printed page = PDF page + 246. Quotations follow the rendered page images (the text layer is OCR). <https://gwern.net/doc/math/1990-thomason.pdf> (source id `ThomasonTrobaugh.1990`).
- **The Stacks Project, Chapter Cohomology of Sheaves (tag 01DW)**, The Stacks Project Authors. Chapter PDF cohomology.pdf, version ed88ff78 compiled 14 July 2026; results cited by section numbers and tags. <https://stacks.math.columbia.edu/download/cohomology.pdf> (source id `Stacks.cohomology.2026`).
- **The Stacks Project, Chapter Derived Categories of Schemes (tag 08CU)**, The Stacks Project Authors. Chapter PDF perfect.pdf, version ed88ff78 compiled 14 July 2026. <https://stacks.math.columbia.edu/download/perfect.pdf> (source id `Stacks.perfect.2026`).
- **The Stacks Project, Chapter More on Algebra (tag 05E3)**, The Stacks Project Authors. Chapter PDF more-algebra.pdf, version ed88ff78 compiled 14 July 2026. <https://stacks.math.columbia.edu/download/more-algebra.pdf> (source id `Stacks.more-algebra.2026`).
- **The Stacks Project, Chapter Derived Categories (tag 05QI)**, The Stacks Project Authors. Chapter PDF derived.pdf, version ed88ff78 compiled 14 July 2026. <https://stacks.math.columbia.edu/download/derived.pdf> (source id `Stacks.derived.2026`).
- **Negative K-theory of derived categories**, Marco Schlichting. Author preprint dated 16 June 2003 (28 pages), the file the reviewed GeneralAlgebraicKTheory decomposition records; the published version (Math. Z. 253, 2006) was not compared. <https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf> (source id `Schlichting.2003`).
- **The resolution property for schemes and stacks**, Burt Totaro. arXiv:math/0207210v1 (23 July 2002), 23 pages; published J. reine angew. Math. 577 (2004); the published version was not compared. <https://arxiv.org/pdf/math/0207210> (source id `Totaro.2004`).
- **Higher algebraic K-theory: I**, Daniel Quillen. Algebraic K-theory I (Seattle 1972), Lecture Notes in Mathematics 341, Springer 1973, pp. 85-147 (scan read; its own page numbers 77-139 are printed; PDF page = printed page - 76) <https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf> (source id `Quillen.1973`).
- **Algebraic K-theory and étale cohomology**, R. W. Thomason. Annales scientifiques de l'École Normale Supérieure (4) 18 (1985), 437-552 (numdam copy; PDF page = printed page - 435) <http://www.numdam.org/item/10.24033/asens.1495.pdf> (source id `Thomason.1985`).
- **The Stacks Project, Chapter 28: Properties of Schemes**, The Stacks Project Authors. chapter PDF, downloaded 25 September 2026 <https://stacks.math.columbia.edu/download/properties.pdf> (source id `Stacks.Properties`).
- **A survey of Gersten's conjecture**, Satoshi Mochizuki. arXiv:1608.08114v1, 29 August 2016 (read only for its historical list of proved cases) <https://arxiv.org/abs/1608.08114> (source id `Mochizuki.2016`).
- **Les K-groupes d'un schéma éclaté et une formule d'intersection excédentaire**, R. W. Thomason. Inventiones mathematicae 112 (1993), 195–215 (scan of the published article from the Göttingen digitisation centre; no text layer, excerpts transcribed from the page images) <https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf> (source id `Thomason.1993`).
- **The Stacks project**, The Stacks project authors. Online version, pages read on 2026-09-25 <https://stacks.math.columbia.edu> (source id `Stacks`).
- **Opérations en K-théorie algébrique**, Christophe Soulé. Canadian Journal of Mathematics 37 (1985), no. 3, 488–550 (published version, from the journal's open archive) <https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427> (source id `Soule.1985`).
- **Filtrations on higher algebraic K-theory**, Henri Gillet and Christophe Soulé. Preprint in the K-theory Preprint Archives, no. 327 (the paper appeared in Algebraic K-theory, Seattle 1997, Proc. Sympos. Pure Math. 67, AMS 1999, 89–148); read from the Wayback Machine copy of the archive file <http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf> (source id `GilletSoule.1999`).
- **Groupes de Grothendieck des schémas en groupes réductifs déployés**, Jean-Pierre Serre. Publications mathématiques de l'IHÉS 34 (1968), 37–52 (NUMDAM scan) <http://www.numdam.org/item/10.1007/BF02684589.pdf> (source id `Serre.1968`).
- **λ-Structure en K-théorie algébrique**, Christian Kratzer. Commentarii Mathematici Helvetici 55 (1980), 233–254 (GDZ scan) <https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0055/LOG_0018.pdf> (source id `Kratzer.1980`).
- **Algebraic K-theory, A¹-homotopy and Riemann–Roch theorems**, Joël Riou. arXiv:0907.2710v2 (9 September 2009) <https://arxiv.org/pdf/0907.2710> (source id `Riou.2009`).
- **Le théorème de Riemann-Roch**, Armand Borel and Jean-Pierre Serre. Bulletin de la SMF 86 (1958), 97–136 (NUMDAM scan) <http://www.numdam.org/item/10.24033/bsmf.1500.pdf> (source id `BorelSerre.1958`).

The files read, with their SHA-256:

- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, SHA-256 `a04f53c9393b…`
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, SHA-256 `ef7ed6d08a5f…`
- published: https://gwern.net/doc/math/1990-thomason.pdf, SHA-256 `4e9397e860f7…`
- published: https://stacks.math.columbia.edu/download/cohomology.pdf, SHA-256 `23fbd6af99fe…`
- published: https://stacks.math.columbia.edu/download/perfect.pdf, SHA-256 `f79e0ebb6287…`
- published: https://stacks.math.columbia.edu/download/more-algebra.pdf, SHA-256 `ab69179738e6…`
- published: https://stacks.math.columbia.edu/download/derived.pdf, SHA-256 `3d6c5169149c…`
- preprint: https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf, SHA-256 `f59620e3ba25…`
- preprint: https://arxiv.org/pdf/math/0207210, SHA-256 `e549d6a3b8f9…`
- published: https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf, SHA-256 `5d2db42d3fec…`
- published: http://www.numdam.org/item/10.24033/asens.1495.pdf, SHA-256 `3497d34982b0…`
- author copy: https://stacks.math.columbia.edu/download/properties.pdf, SHA-256 `2f5b9ba41e07…`
- preprint: https://arxiv.org/abs/1608.08114, SHA-256 `c32bddc5c6e9…`
- published: Weibel's errata to The K-book (GSM 145, AMS 2013), Wayback Machine copy of https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf; the published edition itself was not read, so the K-book findings are scoped to the author copy, SHA-256 `ef7ed6d08a5f…`
- published: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0112/LOG_0023.pdf, SHA-256 `048d66e669fa…`
- published: https://stacks.math.columbia.edu/tag/061M, SHA-256 `ffd645330d6b…`
- published: https://stacks.math.columbia.edu/tag/01XS, SHA-256 `4c788eac610d…`
- published: https://stacks.math.columbia.edu/tag/01OF, SHA-256 `3365721a3d34…`
- published: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427, SHA-256 `50af5bf3a976…`
- published: http://www.numdam.org/item/10.1007/BF02684589.pdf, SHA-256 `09bb50443322…`
- published: https://gdz.sub.uni-goettingen.de/download/pdf/PPN358147735_0055/LOG_0018.pdf, SHA-256 `63323754e24d…`
- published: http://www.numdam.org/item/10.24033/bsmf.1500.pdf, SHA-256 `95ca3ce0ef82…`
- preprint: http://web.archive.org/web/20210416024831id_/https://faculty.math.illinois.edu/K-theory/0327/fff.pdf, SHA-256 `11a5c01bf99e…`
- preprint: https://arxiv.org/pdf/0907.2710, SHA-256 `4cc98488dd74…`
- author copy: http://web.archive.org/web/2019/https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, SHA-256 `ef7ed6d08a5f…`

## What the pinned libraries have

Mathlib has schemes, sheaves of modules (an abelian category), homological complexes with quasi-isomorphisms and derived categories, the tilde functor on Spec A, Proj and algebraic cycles; Tau Ceti has split and exact K₀, the degree-zero Cartan map, finitely presented sheaves, Weil divisors and invertible sheaves. Neither has perfect complexes, K-theory spectra of schemes, G-theory, supports, higher λ- or Adams operations, Chow groups or Chern classes. The nodes build on these pinned declarations, each read at its module:

- `mathlib:AlgebraicGeometry.Flat` (Mathlib/AlgebraicGeometry/Morphisms/Flat.lean): Flat morphisms of schemes.
- `mathlib:AlgebraicGeometry.IsAffineHom` (Mathlib/AlgebraicGeometry/Morphisms/Affine.lean): Affine morphisms (preimages of affine opens are affine); affine diagonal is IsAffineHom of the diagonal.
- `mathlib:AlgebraicGeometry.IsFinite` (Mathlib/AlgebraicGeometry/Morphisms/Finite.lean): Finite morphisms (affine with finite ring maps on affine opens).
- `mathlib:AlgebraicGeometry.IsNoetherian` (Mathlib/AlgebraicGeometry/Noetherian.lean): Noetherian schemes (locally noetherian and quasi-compact).
- `mathlib:AlgebraicGeometry.IsProper` (Mathlib/AlgebraicGeometry/Morphisms/Proper.lean): Proper morphisms: separated, universally closed, locally of finite type.
- `mathlib:AlgebraicGeometry.QuasiCompact` (Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean): Quasi-compact morphisms of schemes.
- `mathlib:AlgebraicGeometry.QuasiSeparated` (Mathlib/AlgebraicGeometry/Morphisms/QuasiSeparated.lean): Quasi-separated morphisms (quasi-compact diagonal).
- `mathlib:AlgebraicGeometry.Scheme.Modules` (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): The abelian category X.Modules of sheaves of O_X-modules on a scheme, with limits and colimits.
- `mathlib:AlgebraicGeometry.Scheme.Modules.pseudofunctor` (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): The pseudofunctor from Scheme^op to adjunctions of module categories (pullback ⊣ pushforward) with its coherences.
- `mathlib:AlgebraicGeometry.Scheme.Modules.pullback` (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): Underived pullback f* of O-modules along a morphism of schemes, left adjoint to pushforward.
- `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackComp` (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): The natural isomorphism pullback g ⋙ pullback f ≅ pullback (f ≫ g).
- `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward` (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): Underived direct image f_* of O-modules, with sections Γ(f_*M, U) = Γ(M, f⁻¹U).
- `mathlib:AlgebraicGeometry.Scheme.Modules.pushforwardComp` (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): The natural isomorphism pushforward f ⋙ pushforward g ≅ pushforward (f ≫ g).
- `mathlib:AlgebraicGeometry.Scheme.Modules.restrict` (Mathlib/AlgebraicGeometry/Modules/Sheaf.lean): Restriction of an O-module along an open immersion.
- `mathlib:AlgebraicGeometry.Scheme.exists_isOpenCover_and_isAffine` (Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean): For a cofiltered qcqs diagram with affine transition maps, an affine open cover of the limit comes from a finite affine open cover at some finite level.
- `mathlib:AlgebraicGeometry.exists_preimage_eq` (Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean): For a cofiltered diagram with affine transition maps, every quasi-compact open of the limit is the preimage of a quasi-compact open at some level (Stacks 01Z4(1)).
- `mathlib:AlgebraicGeometry.isAffineHom_π_app` (Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean): For a cofiltered diagram of schemes with affine transition maps and a limit cone, each projection from the limit is affine.
- `mathlib:AlgebraicGeometry.tilde` (Mathlib/AlgebraicGeometry/Modules/Tilde.lean): The O_{Spec R}-module M~ attached to an R-module M.
- `mathlib:AlgebraicGeometry.tilde.functor` (Mathlib/AlgebraicGeometry/Modules/Tilde.lean): M ↦ M~ as a functor ModuleCat R ⥤ (Spec R).Modules (fully faithful, left adjoint to global sections, additive).
- `mathlib:AlgebraicGeometry.tildeEquiv` (Mathlib/AlgebraicGeometry/Modules/Tilde.lean): The equivalence ModuleCat R ≌ quasi-coherent O_{Spec R}-modules.
- `mathlib:CategoryTheory.EssentiallySmall` (Mathlib/CategoryTheory/EssentiallySmall.lean): A category equivalent to a small category in universe w.
- `mathlib:CategoryTheory.Functor.IsTriangulated` (Mathlib/CategoryTheory/Triangulated/Functor.lean): A functor commuting with shifts is triangulated if it preserves distinguished triangles.
- `mathlib:CategoryTheory.IsIdempotentComplete` (Mathlib/CategoryTheory/Idempotents/Basic.lean): Every idempotent splits.
- `mathlib:CategoryTheory.ObjectProperty.EssentiallySmall` (Mathlib/CategoryTheory/ObjectProperty/Small.lean): An object property contained in the isomorphism closure of a small property.
- `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` (Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean): The full subcategory on an object property.
- `mathlib:CategoryTheory.ObjectProperty.IsTriangulated` (Mathlib/CategoryTheory/Triangulated/Subcategory.lean): An object property of a pretriangulated category defines a triangulated subcategory (contains 0, stable under shifts, closed under extensions in triangles).
- `mathlib:CochainComplex` (Mathlib/Algebra/Homology/HomologicalComplex.lean): ℤ-indexed cochain complexes (differential raising degree).
- `mathlib:CochainComplex.mappingCone` (Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean): The mapping cone of a morphism of ℤ-indexed cochain complexes.
- `mathlib:DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean): The derived category of an abelian category (with a chosen localization).
- `mathlib:DerivedCategory.Q` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean): The localisation functor from cochain complexes to the derived category.
- `mathlib:HomologicalComplex.quasiIso` (Mathlib/Algebra/Homology/QuasiIso.lean): The morphism property of quasi-isomorphisms.
- `mathlib:HomotopyCategory` (Mathlib/Algebra/Homology/HomotopyCategory.lean): The homotopy category of complexes (chain maps up to homotopy).
- `mathlib:IsRegularLocalRing` (Mathlib/RingTheory/RegularLocalRing/Defs.lean): Noetherian local rings whose maximal ideal is generated by dim R elements.
- `mathlib:IsRegularRing` (Mathlib/RingTheory/RegularLocalRing/Defs.lean): Noetherian rings all of whose localisations at primes are regular local rings.
- `mathlib:Module.Finite` (Mathlib/RingTheory/Finiteness/Defs.lean): Finitely generated modules.
- `mathlib:Module.FinitePresentation` (Mathlib/Algebra/Module/FinitePresentation.lean): Finitely presented modules.
- `mathlib:Module.Flat` (Mathlib/RingTheory/Flat/Basic.lean): Flat modules.
- `mathlib:Module.Projective` (Mathlib/Algebra/Module/Projective.lean): Projective modules.
- `mathlib:ModuleCat` (Mathlib/Algebra/Category/ModuleCat/Basic.lean): The category of modules over a ring.
- `mathlib:QuasiIso` (Mathlib/Algebra/Homology/QuasiIso.lean): A map of complexes inducing isomorphisms on all homology objects.
- `mathlib:SheafOfModules.IsFinitePresentation` (Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean): Finite presentation of a sheaf of modules (finitely many generators and relations locally).
- `mathlib:SheafOfModules.IsFiniteType` (Mathlib/Algebra/Category/ModuleCat/Sheaf/Generators.lean): A sheaf of modules is locally generated by finitely many sections.
- `mathlib:SheafOfModules.IsLocallyFree` (Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean): A sheaf of modules is locally free: local generators with isomorphisms from free sheaves.
- `mathlib:SheafOfModules.IsQuasicoherent` (Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean): Quasi-coherence of a sheaf of modules: locally a cokernel of a map of free sheaves.
- `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf` (TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean): The full subcategory of finitely presented sheaves of modules on a scheme (the coherent sheaves on a locally noetherian scheme).
- `tauceti:TauCeti.ExactK0.mapEquiv` (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): An exact equivalence of exact categories induces an isomorphism of exact K₀.
- `tauceti:TauCeti.TriangulatedK0` (TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean): The Grothendieck group of an essentially small pretriangulated category: [Y] = [X] + [Z] for every distinguished triangle.
- `tauceti:TauCeti.TriangulatedK0.lift` (TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean): The homomorphism out of triangulated K₀ induced by a triangle-additive invariant.
- `tauceti:TauCeti.TriangulatedK0.of` (TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean): The class of an object in triangulated K₀.
- `tauceti:TauCeti.cartanEquiv` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The Cartan isomorphism under the finite-resolution hypothesis, with inverse the alternating class of a resolution.
- `tauceti:TauCeti.cartanMap` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The Cartan map K₀(proj R) → G₀(mod R) of exact Grothendieck groups, for any ring R.
- `tauceti:TauCeti.cartanMap_bijective` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The Cartan map is bijective when every finitely generated module has a finite resolution by finitely generated projectives.
- `tauceti:TauCeti.cartanMap_of` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): cartanMap sends the class of a finitely generated projective module to its class.
- `tauceti:TauCeti.finiteModulesExactStructure` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The exact structure on finitely generated R-modules (FGModuleCat R) induced from ModuleCat R.
- `tauceti:TauCeti.finiteProjectiveModules` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The object property of being a finitely generated projective module.
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The exact structure on finitely generated projective R-modules (split, by finiteProjectiveModulesExactStructure_eq_split).
- `mathlib:AlgebraicGeometry.IsOpenImmersion` (Mathlib/AlgebraicGeometry/OpenImmersion.lean): The morphism property of being an open immersion of schemes.
- `mathlib:AlgebraicGeometry.Etale` (Mathlib/AlgebraicGeometry/Morphisms/Etale.lean): Étale morphisms of schemes, affine-locally étale ring maps.
- `mathlib:AlgebraicGeometry.Scheme.ord` (Mathlib/AlgebraicGeometry/OrderOfVanishing.lean): The order of vanishing of a rational function at a point of coheight one of a locally noetherian integral scheme, defined by lengths (Stacks 02MD); junk value 0 elsewhere.
- `mathlib:AlgebraicGeometry.AlgebraicCycle` (Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean): Algebraic cycles on a scheme: finitely supported functions on points with coefficients in R.
- `mathlib:IsDiscreteValuationRing` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): Discrete valuation rings: local PIDs that are not fields.
- `mathlib:IsDiscreteValuationRing.addVal` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): The ℕ∞-valued additive valuation of a DVR.
- `mathlib:IsDiscreteValuationRing.eq_unit_mul_pow_irreducible` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): Every nonzero element of a DVR is a unit times a power of a given irreducible.
- `mathlib:IsDiscreteValuationRing.length_quotient_pow_maximalIdeal` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): The length of R/m^n over a DVR R is n.
- `mathlib:IsDedekindDomain` (Mathlib/RingTheory/DedekindDomain/Basic.lean): Dedekind domains.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation` (Mathlib/RingTheory/DedekindDomain/AdicValuation.lean): The v-adic valuation on the fraction field of a Dedekind domain at a height-one prime.
- `mathlib:IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain` (Mathlib/RingTheory/DedekindDomain/Dvr.lean): The localisation of a Dedekind domain at a nonzero prime is a DVR.
- `mathlib:Module.length_eq_add_of_exact` (Mathlib/RingTheory/Length.lean): Length is additive along short exact sequences.
- `mathlib:Module.support` (Mathlib/RingTheory/Support.lean): The support of a module: primes p with M_p ≠ 0 (Stacks 00L1).
- `mathlib:Ring.ord` (Mathlib/RingTheory/OrderOfVanishing/Basic.lean): ord_R(x) = length of R/(x) (Stacks 02MD).
- `mathlib:Ring.ordFrac` (Mathlib/RingTheory/OrderOfVanishing/Basic.lean): The extension of the length order ord_R to the fraction field, as a monoid-with-zero hom to ℤᵐ⁰.
- `mathlib:HenselianLocalRing` (Mathlib/RingTheory/Henselian.lean): Henselian local rings (simple roots lift).
- `mathlib:CategoryTheory.GrothendieckTopology.MayerVietorisSquare` (Mathlib/CategoryTheory/Sites/MayerVietorisSquare.lean): Commutative squares with f₁₃ mono that become pushouts of sheaves of sets: the abstract Mayer-Vietoris squares of a Grothendieck topology.
- `mathlib:CategoryTheory.ObjectProperty.IsVerdierLeftLocalizing` (Mathlib/CategoryTheory/Triangulated/LocalizingSubcategory.lean): A is left B-localizing: every map from an object of A to an object of B factors through an object of A ⊓ B; then A/(A ⊓ B) → C/B is fully faithful (Verdier II.2.3.5, instances in the same file).
- `mathlib:CategoryTheory.ObjectProperty.isVerdierLeftLocalizing_iff` (Mathlib/CategoryTheory/Triangulated/LocalizingSubcategory.lean): Characterisation of left localizing triangulated subcategories through B.trW.
- `mathlib:CategoryTheory.ObjectProperty.triangulatedLocalizerMorphism` (Mathlib/CategoryTheory/Triangulated/LocalizingSubcategory.lean): The inclusion A ⊂ C as a localizer morphism for the Verdier classes of morphisms, whose localized functor is shown full and faithful in the same file.
- `mathlib:CategoryTheory.ObjectProperty.trW` (Mathlib/CategoryTheory/Triangulated/Subcategory.lean): The morphisms whose cone lies in a given triangulated subcategory (the Verdier localizing class).
- `mathlib:CategoryTheory.Abelian.SpectralObject` (Mathlib/Algebra/Homology/SpectralObject/Basic.lean): Spectral objects in an abelian category (Verdier II.4): functors H^n on arrows with functorial long exact sequences.
- `mathlib:CategoryTheory.Abelian.SpectralObject.spectralSequence` (Mathlib/Algebra/Homology/SpectralObject/SpectralSequence.lean): The spectral sequence of a spectral object, given SpectralSequenceDataCore and HasSpectralSequence.
- `mathlib:CategoryTheory.Abelian.SpectralObject.coreE₂Cohomological` (Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean): Indexing data for a cohomological spectral sequence of a spectral object indexed by ℤ.
- `mathlib:CategoryTheory.SpectralSequence` (Mathlib/Algebra/Homology/SpectralSequence/Basic.lean): Spectral sequences in an abelian category (pages with differentials and homology isomorphisms).
- `mathlib:CategoryTheory.presheafToSheaf` (Mathlib/CategoryTheory/Sites/Sheafification.lean): Sheafification of presheaves on a site.
- `mathlib:topologicalKrullDim` (Mathlib/Topology/KrullDimension.lean): The Krull dimension of a topological space (lengths of chains of irreducible closed subsets).
- `mathlib:ringKrullDim` (Mathlib/RingTheory/KrullDimension/Basic.lean): The Krull dimension of a commutative ring.
- `mathlib:Ideal.height` (Mathlib/RingTheory/Ideal/Height.lean): The height of an ideal.
- `mathlib:ClassGroup` (Mathlib/RingTheory/ClassGroup/Basic.lean): The ideal class group of a domain.
- `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.orderAt` (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Order.lean): The order of a nonzero rational function at a codimension-one point of a locally noetherian integral scheme, as an additive homomorphism to ℤ built on Mathlib's Scheme.ord.
- `tauceti:TauCeti.AlgebraicGeometry.CodimensionOnePoint` (TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean): Points of coheight one of a scheme.
- `mathlib:TopCat.Presheaf.IsFlasque` (Mathlib/Topology/Sheaves/Flasque.lean): Flasque presheaves: all restriction maps are epimorphisms.
- `mathlib:CategoryTheory.Sheaf.H` (Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean): Sheaf cohomology H^n of an abelian sheaf on a site, as Ext from the constant sheaf ℤ.
- `mathlib:skyscraperSheaf` (Mathlib/Topology/Sheaves/Skyscraper.lean): The skyscraper sheaf at a point with a given value.
- `mathlib:Opens.grothendieckTopology` (Mathlib/CategoryTheory/Sites/Spaces.lean): The Grothendieck topology of open covers on the opens of a topological space.
- `mathlib:AlgebraicGeometry.Scheme.etaleTopology` (Mathlib/AlgebraicGeometry/Sites/Etale.lean): The big étale topology on schemes, generated by jointly surjective étale families.
- `mathlib:AlgebraicGeometry.Scheme.zariskiTopology` (Mathlib/AlgebraicGeometry/Sites/BigZariski.lean): The big Zariski topology on schemes.
- `mathlib:CategoryTheory.GrothendieckTopology` (Mathlib/CategoryTheory/Sites/Grothendieck.lean): Grothendieck topologies on a category.
- `mathlib:Algebra.Smooth` (Mathlib/RingTheory/Smooth/Basic.lean): Smooth algebras: formally smooth and of finite presentation.
- `mathlib:IsLocalRing` (Mathlib/RingTheory/LocalRing/Defs.lean): Local rings.
- `tauceti:TauCeti.Topology.subsingleton_H_succ_of_isFlasque` (TauCeti/Topology/Sheaves/Flasque.lean): A flasque sheaf of abelian groups on a topological space has vanishing sheaf cohomology H^{n+1}.
- `tauceti:TauCeti.Topology.isFlasque_skyscraperSheaf` (TauCeti/Topology/Sheaves/Flasque.lean): Skyscraper sheaves of abelian groups are flasque.
- `mathlib:AlgebraicGeometry.AffineSpace` (Mathlib/AlgebraicGeometry/AffineSpace.lean): 𝔸(n; S), affine n-space over a scheme S as the pullback of S → Spec ℤ and Spec ℤ[n] → Spec ℤ: the polynomial extensions X[T] and A^m_X.
- `mathlib:LaurentPolynomial` (Mathlib/Algebra/Polynomial/Laurent.lean): The Laurent polynomial ring R[T;T⁻¹] as AddMonoidAlgebra R ℤ: the ring ℤ[T, T⁻¹] of the Laurent extensions.
- `mathlib:LaurentPolynomial.isLocalization` (Mathlib/Algebra/Polynomial/Laurent.lean): R[T;T⁻¹] is the localisation of R[X] away from X: X[T, T⁻¹] is the open subscheme T ≠ 0 of X[T].
- `mathlib:AlgebraicGeometry.«Proj»` (Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean): The scheme Proj A of an ℕ-graded ring: P¹_ℤ and the local model P^{r−1}_A of a projective bundle.
- `mathlib:AlgebraicGeometry.Proj.awayι` (Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean): The open immersion Spec (A_f)₀ → Proj A for f homogeneous of positive degree: the standard affine cover of P¹ used for the Mayer–Vietoris square.
- `mathlib:Polynomial.isRegularRing_of_isRegularRing` (Mathlib/RingTheory/RegularLocalRing/Polynomial.lean): R regular ⇒ R[X] regular: X[T] is regular when X is.
- `mathlib:MvPolynomial.isRegularRing_of_isRegularRing` (Mathlib/RingTheory/RegularLocalRing/Polynomial.lean): R regular ⇒ R[X_i : i ∈ ι] regular for finite ι: A^m_X is regular when X is.
- `mathlib:Polynomial.isNoetherianRing` (Mathlib/RingTheory/Polynomial/Basic.lean): Hilbert's basis theorem: R[X] is noetherian when R is.
- `mathlib:Polynomial.isUnit_iff_coeff_isUnit_isNilpotent` (Mathlib/RingTheory/Polynomial/Nilpotent.lean): A polynomial is a unit iff its constant coefficient is a unit and all other coefficients are nilpotent: 1 + εT is a unit of k[ε][T].
- `mathlib:DualNumber` (Mathlib/Algebra/DualNumber.lean): The dual numbers R[ε] = TrivSqZeroExt R R, the singular test ring k[ε].
- `mathlib:RingTheory.Sequence.IsRegular` (Mathlib/RingTheory/Regular/RegularSequence.lean): Regular sequences on a module: the local generators of the ideal of a regular closed immersion in the noetherian case.
- `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` (TauCeti/AlgebraicGeometry/LineBundle/Basic.lean): The category of invertible sheaves on a scheme: O_{X′}(1), O(n) and the conormal line bundle of the exceptional divisor.
- `mathlib:AddMonoidAlgebra` (Mathlib/Algebra/MonoidAlgebra/Defs.lean): The additive monoid algebra R[M]: finitely supported R-linear combinations of M with the convolution product.
- `mathlib:CategoryTheory.Sheaf` (Mathlib/CategoryTheory/Sites/Sheaf.lean): The category of A-valued sheaves for a Grothendieck topology J.
- `mathlib:ExteriorAlgebra.exteriorPower` (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): The n-th exterior power ⋀[R]^n M as the n-th power of the degree-one submodule of the exterior algebra.
- `mathlib:HomotopicalAlgebra.ModelCategory` (Mathlib/AlgebraicTopology/ModelCategory/Basic.lean): The class of (closed) model categories: cofibrations, fibrations and weak equivalences satisfying CM1–CM5.
- `mathlib:Matrix.GeneralLinearGroup` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): GL n R: the group of invertible n×n matrices over a semiring.
- `mathlib:MvPolynomial.IsSymmetric` (Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean): A multivariate polynomial is symmetric if invariant under every permutation of the variables (rename).
- `mathlib:MvPolynomial.esymm` (Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean): The n-th elementary symmetric polynomial esymm σ R n = Σ over n-subsets of ∏ X_i.
- `mathlib:MvPolynomial.esymmAlgEquiv` (Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean): For card σ = n, MvPolynomial (Fin n) R ≃ₐ symmetricSubalgebra σ R sending X_i to esymm (i+1): the fundamental theorem of symmetric polynomials with algebraic independence of the elementary symmetric polynomials.
- `mathlib:MvPolynomial.mul_esymm_eq_sum` (Mathlib/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean): Newton's identities: k·esymm k = (−1)^{k+1} Σ (−1)^a esymm a · psum b over a + b = k, a < k.
- `mathlib:MvPolynomial.psum` (Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean): The power sum psum σ R n = Σ_i X_i^n.
- `mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum` (Mathlib/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean): Newton's identities in the form expressing psum k through esymm and lower power sums.
- `mathlib:PowerSeries` (Mathlib/RingTheory/PowerSeries/Basic.lean): Formal power series R⟦X⟧ over a coefficient type R (abbrev for MvPowerSeries Unit R).
- `mathlib:PowerSeries.coeff` (Mathlib/RingTheory/PowerSeries/Basic.lean): The n-th coefficient of a power series, as a linear map.
- `mathlib:Rep` (Mathlib/RepresentationTheory/Rep/Basic.lean): The category Rep k G of k-linear representations of a monoid G.
- `mathlib:SSet` (Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean): The category of simplicial sets (contravariant functors from SimplexCategory to Type).
- `mathlib:exteriorPower.map` (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): Functoriality ⋀^n f: ⋀[R]^n M → ⋀[R]^n N of exterior powers for a linear map f.
- `mathlib:frobenius` (Mathlib/Algebra/CharP/Lemmas.lean): The Frobenius ring endomorphism x ↦ x^p of a commutative semiring of exponential characteristic p.
- `tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm` (TauCeti/RingTheory/MvPolynomial/Symmetric/Substitution.lean): Unbundled fundamental theorem: a symmetric polynomial in n variables over a commutative ring is a polynomial in esymm 1, …, esymm n.
- `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass` (TauCeti/AlgebraicGeometry/LineBundle/Class.lean): Isomorphism classes of line bundles on a scheme (the skeleton of InvertibleSheaf), with tensor product as multiplication.
- `tauceti:TauCeti.ExactK0` (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): The Grothendieck group of a Quillen exact structure on an essentially small additive category: free abelian group on isomorphism classes modulo [X₂] = [X₁] + [X₃] for conflations.
- `tauceti:TauCeti.ExactK0.lift` (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): The homomorphism ExactK0 E →+ G induced by a conflation-additive invariant (universal property).
- `tauceti:TauCeti.exists_isRiemannRochDivisor` (TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.lean): Riemann–Roch for an algebraic function field with exact constant field: a divisor W with ℓ(D) = deg D + 1 − g + ℓ(W − D) for all D exists (the divisor of a nonzero Weil differential).
- `tauceti:TauCeti.genus` (TauCeti/FieldTheory/FunctionField/RiemannRoch/Genus.lean): The genus of an algebraic function field F/k as sup of deg D + 1 − ℓ(D) (truncated to ℕ).
- `tauceti:TauCeti.repRing` (TauCeti/RepresentationTheory/RepresentationRing/Basic.lean): The representation ring of a monoid over a field, the split K_0 of FDRep k G.

## Layer overview

| Layer | Title | Nodes | Planets | Coverage |
|---|---|---|---|---|
| S.1 | Perfect complexes and enhancements | 30 | 6 | partial |
| S.2 | K, G and maps | 31 | 6 | partial |
| S.3 | Supports and localisation | 43 | 6 | partial |
| S.4 | Descent and coniveau | 43 | 6 | partial |
| S.5 | Homotopy invariance and fundamental formulas | 34 | 6 | partial |
| S.6 | Products, λ-operations and Adams operations | 53 | 6 | partial |
| S.7 | Cycle classes and Riemann–Roch | 19 | 6 | partial |

Each layer section below opens with the layer's coverage record, then states every node: its statement and hypotheses, the proof outline, for definitions and constructions the API and the unit tests, its acceptance checks, its dependencies and its sources.

## S.1 — Perfect complexes and enhancements

*Coverage: partial.* RS-18 narrows S.1 to the scheme-specific perfect complexes; generic unbounded sheaf complexes, K-injective/K-flat replacements, derived tensor, enhanced pullback/pushforward and the enhancement itself are imported from EnhancedDerivedSheaves E1 (and E0's dg nerve and sign comparison), the complete-noetherian-local perfect-module construction from DeformationAndDerivedPatchingAlgebra P7. Targets of the stage text and their nodes: (1) complexes of O_X-modules and quasi-isomorphisms from the existing categories — baseline (Mathlib's X.Modules, CochainComplex, QuasiIso, DerivedCategory), no node; (2) perfectness defined locally by bounded finite locally free complexes — strictly-perfect-complex, perfect-complex (with pseudo-coherent-complex and tor-amplitude, and perfect-iff-pseudo-coherent-finite-tor); (3) locality, shifts, cones, retracts — perfect-local-and-invariant, perfect-triangulated-and-thick, perfect-idempotent-complete, with the local lifting lemma strictly-perfect-local-lifting; (4) pullback stability — strictly-perfect-closure, perfect-derived-pullback (arbitrary morphisms), with perfect-derived-tensor; (5) essential smallness for qcqs X — perfect-essentially-small and perfect-universe-invariance (the Waldhausen category itself is not essentially small, which the construction node records); (6) the enhanced model for K.4–K.6 — perfect-complicial-waldhausen-category (TT 3.1, for K.4), perfect-frobenius-pair (Schlichting 5.10, for K.6), perfect-enhanced-subcategory (inside E1) and enhancement-comparison (same triangulated homotopy category D_perf); the model list perfect-waldhausen-models; (7) affine comparison for an arbitrary ring, beyond P7 and identified with it on overlap — perfect-module-complex, affine-derived-equivalence, affine-perfect-comparison; (8) vector-bundle comparison under a proved resolution property — resolution-property, resolution-property-affine-diagonal, resolution-property-strict-representatives, vector-bundle-comparison, with coherator and perfect-objects-quasi-coherent-bounded; (9) the explicit counterexample — doubled-plane-counterexample; singular schemes stay in scope throughout (no regularity hypothesis in any definition). Added for S.2 and S.5: perfect-complexes-on-limits (Stacks 09RE, 09RF; TT 3.20.1), the input of S.2/k-theory-continuity. Consumers: EllipticKTheory E.1 (via S.2), EnhancedDerivedSheaves E0's overlap note is resolved by RS-18's split. No comparison of the ∞-categorical K-theory of D^∞_perf with Waldhausen K-theory is asserted; K.4–K.6 use the Waldhausen and Frobenius models.

- Remaining: Obtain a source-backed proof that restriction Vect(X) → Vect(A^n) is an equivalence for the affine n-space X with doubled origin, n ≥ 2 (EGA IV 5.9–5.10, cited by TT Ex. 8.6 and K-book Ex. V.6.8) (gap 'Vector bundles on affine space with doubled origin').
- Remaining: Receive absolute noetherian approximation from AdicCoefficientsAndComparisons L2 (request), used by resolution-property-affine-diagonal for non-noetherian qcqs X; the descent step Stacks 0F8C omits is written out in that node.
- Remaining: Receive from SchemeAndStackFoundations SF.2 the quasi-coherent cohomology inputs (Serre vanishing on affines, the uniform bound for qcqs morphisms, cohomology and direct sums) used by affine-derived-equivalence, coherator and resolution-property-affine-diagonal (request).

### Strictly perfect complexes on a scheme

`S.1/strictly-perfect-complex` · definition · planet “Strictly perfect complex”

Conventions of this layer: X is a scheme; an O_X-module is an object of Mathlib's abelian category X.Modules; a complex is a cochain complex indexed by ℤ with differential raising degree (TT 1.1.1, Stacks, Mathlib's CochainComplex); the shift is E[k]^n = E^{n+k} with differential multiplied by (−1)^k, and the cone of φ : E → F has C(φ)^n = F^n ⊕ E^{n+1} (Mathlib's mappingCone); D(O_X) is Mathlib's DerivedCategory of X.Modules, identified by EnhancedDerivedSheaves E1 with the homotopy category of its enhancement. A complex E• of O_X-modules is strictly perfect if E^i = 0 for all but finitely many i and every E^i is a finite locally free O_X-module, meaning an O_X-module that is locally free (Mathlib's SheafOfModules.IsLocallyFree) and of finite type (SheafOfModules.IsFiniteType). Since every stalk O_{X,x} is a local ring, this is equivalent to asking that each E^i be, locally on X, a direct summand of a finite free module, which is the ringed-space definition of Stacks 08C4 (Stacks 0BCJ); Thomason–Trobaugh call such a complex a strict perfect complex, a strict bounded complex of algebraic vector bundles (TT 2.2.2). Write SPerf(X) for the full subcategory of the category of complexes on the strictly perfect ones.

**Hypotheses.**

- X is an arbitrary scheme; no finiteness or separation hypothesis is imposed.
- The bound is strict: E^i = 0 outside a finite interval [a, b], not merely H^i(E•) = 0 outside it.
- The terms are required to be of finite type; a locally free module of infinite rank is excluded.

**Proof.**

1. Define the object property on CochainComplex X.Modules ℤ: there are a ≤ b with E^i = 0 for i ∉ [a, b], and each E^i is locally free and of finite type.
2. Record the equivalence with the Stacks formulation: on a locally ringed space a direct summand of a finite free module is finite locally free and conversely a finite locally free module is locally finite free (Stacks 0BCJ, citing Modules 14.6).
3. Record that SPerf(X) is closed under isomorphism of complexes and contains the zero complex and O_X[n] for every n.

**API.**

- `IsStrictlyPerfect` (constructor): The object property on complexes of O_X-modules: bounded, with finite locally free terms.
- `IsStrictlyPerfect.single` (constructor): A finite locally free O_X-module placed in a single degree n is strictly perfect.
- `IsStrictlyPerfect.exists_bounds` (projection): A strictly perfect complex has integers a ≤ b with E^i = 0 for i ∉ [a, b].
- `IsStrictlyPerfect.of_iso` (structure): The property is closed under isomorphism of complexes.
- `IsStrictlyPerfect.shift` (structure): E• strictly perfect implies E•[k] strictly perfect for every k ∈ ℤ.
- `isStrictlyPerfect_iff_locally_summand_free` (characterisation): E• is strictly perfect iff it is bounded and each E^i is locally on X a direct summand of a finite free module (Stacks 08C4 via 0BCJ).
- `IsStrictlyPerfect.restrict` (functoriality): For an open immersion j : U → X, the restriction of a strictly perfect complex is strictly perfect.
- `IsStrictlyPerfect.tilde` (compatibility): For a ring A and a bounded complex P• of finite projective A-modules, the termwise tilde P•~ on Spec A is strictly perfect (finite projective modules are locally free of finite rank, KTheoryLowDegrees Z.2).

**Unit tests.**

- `isStrictlyPerfect_koszul_affineLine` (computation): On Spec k[x] for a field k, the complex O --x--> O in degrees −1, 0 is strictly perfect, and its only nonzero cohomology sheaf is H^0 = (k[x]/(x))~, the skyscraper at the origin.
- `isStrictlyPerfect_zero_and_unit` (degenerate): On every scheme the zero complex and O_X[0] are strictly perfect; on the empty scheme every complex is strictly perfect.
- `not_isStrictlyPerfect_skyscraper` (non-example): On Spec k[x] the skyscraper (k[x]/(x))~ in degree 0 is not strictly perfect: its stalk at the origin is k while its stalk at the generic point is 0, so it is not locally free of any locally constant rank.
- `not_isStrictlyPerfect_unbounded` (non-example): The complex with O_X in every degree n ≤ 0 and zero differentials has finite free terms but is not strictly perfect, because it is not bounded.
- `isStrictlyPerfect_tilde_projective` (compatibility): For a ring A and a bounded complex P• of finitely generated projective A-modules, P•~ on Spec A is strictly perfect; for A = ℤ and P• = (ℤ --2--> ℤ) its cohomology is (ℤ/2)~ in degree 0.

**Acceptance.**

- O_X[0] is strictly perfect on every scheme, and the zero complex is strictly perfect.
- The skyscraper k(0) = (k[x]/(x))~ in degree 0 on Spec k[x] is not strictly perfect, although it is quasi-isomorphic to the strictly perfect complex O --x--> O in degrees −1, 0.

**Used by.**

- SchemeKTheoryOperations:S.1/perfect-complex: perfect complexes are those locally quasi-isomorphic to strictly perfect ones
- SchemeKTheoryOperations:S.1/vector-bundle-comparison: under the resolution property every perfect complex is globally quasi-isomorphic to a strictly perfect one
- TT 3.2 and SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison: strictly perfect complexes form the complicial biWaldhausen category whose K-theory is K^naive(X), Quillen's K-theory of vector bundles
- SchemeKTheoryOperations:S.1/doubled-plane-counterexample: the counterexample shows a perfect complex with no strictly perfect global model

**Depends on.** libraries: `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:SheafOfModules.IsLocallyFree`, `mathlib:SheafOfModules.IsFiniteType`, `mathlib:CochainComplex`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Definition 46.1 (tag 08C4): “We say E• is strictly perfect if Ei is zero for all but finitely many i and Ei is a direct summand of a finite free OX-module for all i.” — The ringed-space definition; on a scheme it is the finite-locally-free form stated here (next excerpt).
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.3 (tag 0BCJ): “Assume that all stalks OX,x are local rings. Then the following are equivalent (1) E is perfect, (2) there exists an open covering X = ⋃ Ui such that E|Ui can be represented by a finite complex of finite locally free OUi-modules” — On a locally ringed space the local models may be taken to be finite complexes of finite locally free modules, which justifies the scheme-level formulation.
- `ThomasonTrobaugh.1990`, Definition 2.2.2, p. 285: “That is, a strict perfect complex is a strict bounded complex of algebraic vector bundles.” — Thomason–Trobaugh's name and definition, with algebraic vector bundle meaning locally free O_X-module of finite type (TT 2.1.3(b)).

### Closure properties of strictly perfect complexes

`S.1/strictly-perfect-closure` · lemma

Let X be a scheme and let E•, F• be strictly perfect complexes on X. Then (a) E•[k] is strictly perfect for every k ∈ ℤ; (b) the cone C(φ) of any map of complexes φ : E• → F• is strictly perfect (Stacks 08C5); (c) the total complex Tot(E• ⊗_{O_X} F•) is strictly perfect (Stacks 09J2); (d) for every morphism of schemes f : X′ → X the degreewise pullback f*E• is strictly perfect on X′ (Stacks 09U6); (e) every term E^i is a flat O_X-module, so E• is a bounded complex of flat modules and hence K-flat; consequently f*E• represents Lf*E• and E• ⊗_{O_X} G• represents E• ⊗^L G• for every complex G• (TT 2.5.1).

**Hypotheses.**

- Pullback is the degreewise underived pullback of Mathlib (Scheme.Modules.pullback), which is additive and preserves finite free modules.
- K-flatness of bounded complexes of flat modules and the identification of Lf* on K-flat complexes are EnhancedDerivedSheaves E1's K-flat model.

**Proof.**

1. (a) and (b): the terms of E•[k] are those of E• and C(φ)^n = F^n ⊕ E^{n+1} is a finite sum of finite locally free modules; boundedness is preserved.
2. (c): each term of the total complex is a finite direct sum of E^p ⊗ F^q, and a tensor product of finite locally free modules is finite locally free (locally a tensor product of finite free modules).
3. (d): pullback of a finite free module is finite free and f* is additive, so it preserves direct summands locally; boundedness is clear (Stacks 09U6).
4. (e): a finite locally free module is flat; a bounded complex of flat modules is K-flat (E1's K-flat model), so the underived pullback and tensor product compute the derived ones on it.

**Acceptance.**

- The Koszul complex O --x--> O on Spec k[x] tensored with itself is the strictly perfect complex O --(x,−x)--> O² --(x,x)--> O in degrees −2..0 (up to the chosen sign convention).
- The pullback of O --x--> O along the origin Spec k → Spec k[x] is k --0--> k, whose cohomology k ⊕ k[1] computes Lι*(k[x]/(x)) = k ⊕ k[1].

**Depends on.** this roadmap: `S.1/strictly-perfect-complex`; other roadmaps: `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:CochainComplex.mappingCone`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 46.2 (tag 08C5): “The cone on a morphism of strictly perfect complexes is strictly perfect.” — Part (b).
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 46.3 (tag 09J2): “The total complex associated to the tensor product of two strictly perfect complexes is strictly perfect.” — Part (c).
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 46.4 (tag 09U6): “If F• is a strictly perfect complex of OY -modules, then f ∗F• is a strictly perfect complex of OX-modules.” — Part (d).
- `ThomasonTrobaugh.1990`, 2.5.1, p. 303: “For E· a strict perfect complex on Y, f*E· is clearly a strict perfect complex on X. This complex represents Lf*E·, as the vector bundles E^i are flat over O_Y and hence deployed for Lf*.” — Part (e) for pullback: the underived pullback computes the derived one on strictly perfect complexes.

### Maps out of strictly perfect complexes are locally chain maps

`S.1/strictly-perfect-local-lifting` · lemma

Let X be a scheme (more generally a ringed space), E• a strictly perfect complex and F• any complex of O_X-modules. (1) For every morphism α : E• → F• in D(O_X) there is an open covering X = ⋃ U_i such that each α|U_i is represented by a map of complexes E•|U_i → F•|U_i. (2) If a map of complexes α : E• → F• is zero in D(O_X), then there is an open covering on whose members α is homotopic to zero. (3) If E^j = 0 for j < a and f : G• → F• is a map of complexes with H^j(f) an isomorphism for j > a and surjective for j = a, then every map of complexes E• → F• lifts locally, up to homotopy, through f.

**Hypotheses.**

- The covering in (1)–(3) depends on α; no global chain-level representative is claimed, and none exists in general (see SchemeKTheoryOperations:S.1/doubled-plane-counterexample for the failure of global strict models).

**Proof.**

1. A map from a direct summand of a finite free module to a sheaf quotient lifts locally, because a surjection of sheaves is locally surjective on sections (Stacks 08C6).
2. By induction on the length of E•, using the split sequences 0 → E^b[−b] → E• → σ_{≤b−1}E• → 0 and the long exact sequence of Hom in the homotopy category, a map from E• to a complex acyclic in degrees ≥ a is locally null-homotopic (Stacks 08C7).
3. Applying this to the cone of f gives (3) (Stacks 08C8); representing α = f^{-1}β by a roof with f a quasi-isomorphism gives (1), and (2) is the case β = 0 (Stacks 08C9).

**Acceptance.**

- The identity of O[0] on Spec k[x] composed with the quasi-isomorphism (O --x--> O) → (k[x]/(x))~ gives a map in D whose chain representative exists globally; for a strictly perfect source on an affine scheme the covering can always be taken trivial, whereas on a general scheme it cannot.

**Depends on.** this roadmap: `S.1/strictly-perfect-complex`; other roadmaps: `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`; libraries: `mathlib:DerivedCategory.Q`, `mathlib:HomotopyCategory`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 46.8 (tag 08C9): “(1) For any element α ∈HomD(OX)(E•, F•) there exists an open covering X = ⋃ Ui such that α|Ui is given by a morphism of complexes αi : E•|Ui →F•|Ui.” — Part (1).
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 46.8 (tag 08C9): “Given a morphism of complexes α : E• →F• whose image in the group HomD(OX)(E•, F•) is zero, there exists an open covering” — Part (2); the proof of (2) is omitted in the source and is supplied here by Lemma 46.6 (tag 08C7) applied to the null-homotopic composite with a quasi-isomorphism.

### Pseudo-coherent complexes

`S.1/pseudo-coherent-complex` · definition

Conventions of this layer: X is a scheme; an O_X-module is an object of Mathlib's abelian category X.Modules; a complex is a cochain complex indexed by ℤ with differential raising degree (TT 1.1.1, Stacks, Mathlib's CochainComplex); the shift is E[k]^n = E^{n+k} with differential multiplied by (−1)^k, and the cone of φ : E → F has C(φ)^n = F^n ⊕ E^{n+1} (Mathlib's mappingCone); D(O_X) is Mathlib's DerivedCategory of X.Modules, identified by EnhancedDerivedSheaves E1 with the homotopy category of its enhancement. Let m ∈ ℤ. A complex E• of O_X-modules is m-pseudo-coherent if there are an open covering X = ⋃ U_i, strictly perfect complexes E•_i on U_i and maps of complexes α_i : E•_i → E•|U_i with H^j(α_i) an isomorphism for j > m and surjective for j = m; it is pseudo-coherent if it is m-pseudo-coherent for every m. An object of D(O_X) is m-pseudo-coherent (resp. pseudo-coherent) if some, equivalently every, complex representing it is. Thomason–Trobaugh give the same notion through local n-quasi-isomorphisms from strict perfect complexes (TT 2.2.5, 2.2.6). On a noetherian scheme, an object of D_QCoh(O_X) is pseudo-coherent iff it lies in D^−_Coh(O_X), i.e. is cohomologically bounded above with coherent cohomology (Stacks 08E8, TT 2.2.8).

**Hypotheses.**

- The local models are required only in degrees > m; the covering may shrink as m decreases (TT 2.2.7), so a pseudo-coherent complex need not be locally quasi-isomorphic to one bounded-above complex of vector bundles.
- On a quasi-compact X an m-pseudo-coherent object is bounded above (Stacks 47.1).

**Proof.**

1. Define m-pseudo-coherence of a complex by the displayed local condition and pseudo-coherence as the conjunction over m.
2. Show independence of the representative: by SchemeKTheoryOperations:S.1/strictly-perfect-local-lifting a map E•_i → E|U_i in D is locally a chain map to any other representative (Stacks 08CC).
3. Record the noetherian characterisation: on an affine noetherian scheme this is the module statement that a complex with finite cohomology bounded above is pseudo-coherent (Stacks 08E7, 08E8).

**API.**

- `IsPseudoCoherentAt` (constructor): The m-pseudo-coherence predicate on complexes of O_X-modules.
- `IsPseudoCoherent` (constructor): Pseudo-coherence: m-pseudo-coherent for all m.
- `IsPseudoCoherent.of_quasiIso` (structure): Invariance under quasi-isomorphism, hence a property of objects of D(O_X) (Stacks 08CC).
- `IsPseudoCoherent.shift` (structure): E is m-pseudo-coherent iff E[k] is (m − k)-pseudo-coherent.
- `IsPseudoCoherent.two_of_three` (structure): In a distinguished triangle K → L → M, if K is (m+1)- and L is m-pseudo-coherent then M is m-pseudo-coherent, and the two rotations (Stacks 08CD, TT 2.2.13(a)).
- `IsPseudoCoherent.summand` (structure): Summands of m-pseudo-coherent objects are m-pseudo-coherent (Stacks 08CE).
- `IsPseudoCoherent.pullback` (functoriality): Lf* preserves m-pseudo-coherence for every morphism f (Stacks 09U7).
- `isPseudoCoherent_iff_bounded_above_coherent` (characterisation): On a noetherian scheme, an object of D_QCoh is pseudo-coherent iff it is in D^−_Coh (Stacks 08E8).
- `isPseudoCoherent_zero_iff_finiteType` (characterisation): A module in degree 0 is 0-pseudo-coherent iff of finite type, (−1)-pseudo-coherent iff finitely presented (Stacks 09V9).

**Unit tests.**

- `isPseudoCoherent_residueField_dualNumbers` (computation): On Spec k[ε]/(ε²), the residue field k in degree 0 is pseudo-coherent (resolved by the infinite complex ⋯ --ε--> O --ε--> O), but it is not perfect (SchemeKTheoryOperations:S.1/perfect-complex).
- `isPseudoCoherent_zero` (degenerate): The zero complex is pseudo-coherent, and on the empty scheme every complex is.
- `not_isPseudoCoherent_infinite_type` (non-example): On Spec ℤ the module ⊕_{n ∈ ℕ} ℤ in degree 0 is not 0-pseudo-coherent, since it is not of finite type.
- `isPseudoCoherent_iff_finite_cohomology_affine` (compatibility): On Spec A, A noetherian, (M•)~ is pseudo-coherent iff M• is bounded above with finitely generated cohomology modules (Stacks 08E7, More on Algebra 66.17).

**Acceptance.**

- A coherent sheaf on a noetherian scheme, placed in degree 0, is pseudo-coherent.
- An O_X-module viewed in degree 0 is 0-pseudo-coherent iff it is of finite type and (−1)-pseudo-coherent iff it is of finite presentation (Stacks 09V9).

**Used by.**

- TT 3.3 and SchemeKTheoryOperations:S.2/g-theory-of-a-scheme: G(X) is the K-theory of pseudo-coherent complexes with globally bounded cohomology
- SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor: perfect is pseudo-coherent plus locally finite tor dimension
- SchemeKTheoryOperations:S.2/perfect-coherent-on-regular: on a regular scheme bounded pseudo-coherent complexes are perfect

**Depends on.** this roadmap: `S.1/strictly-perfect-complex`, `S.1/strictly-perfect-local-lifting`; libraries: `mathlib:SheafOfModules.IsFiniteType`, `mathlib:SheafOfModules.IsFinitePresentation`, `mathlib:AlgebraicGeometry.IsNoetherian`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Definition 47.1(2) (tag 08CB): “We say E• is pseudo-coherent if it is m-pseudo-coherent for all m.” — The definition, part (2); part (1) is the local condition stated above.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 10.3 (tag 08E8): “In particular, E is pseudo-coherent if and only if E is an object of D− Coh(OX).” — The noetherian characterisation (for E ∈ D_QCoh on a noetherian scheme).
- `ThomasonTrobaugh.1990`, 2.2.8, p. 289: “A complex E· of O_X-modules on a noetherian scheme X is pseudo-coherent iff E· is cohomologically bounded above and all the H^k(E·) are coherent O_X-modules.” — Thomason–Trobaugh's form of the noetherian characterisation, used for G-theory.

### Tor-amplitude and finite tor dimension

`S.1/tor-amplitude` · definition

Conventions of this layer: X is a scheme; an O_X-module is an object of Mathlib's abelian category X.Modules; a complex is a cochain complex indexed by ℤ with differential raising degree (TT 1.1.1, Stacks, Mathlib's CochainComplex); the shift is E[k]^n = E^{n+k} with differential multiplied by (−1)^k, and the cone of φ : E → F has C(φ)^n = F^n ⊕ E^{n+1} (Mathlib's mappingCone); D(O_X) is Mathlib's DerivedCategory of X.Modules, identified by EnhancedDerivedSheaves E1 with the homotopy category of its enhancement. For integers a ≤ b, an object E of D(O_X) has tor-amplitude in [a, b] if H^i(E ⊗^L_{O_X} F) = 0 for every O_X-module F and every i ∉ [a, b]; it has finite tor dimension if it has tor-amplitude in some [a, b], and locally finite tor dimension if there is an open covering on whose members it has finite tor dimension. The derived tensor product is EnhancedDerivedSheaves E1's (K-flat model). Equivalently, E has tor-amplitude in [a, b] iff it is represented by a complex of flat O_X-modules concentrated in degrees [a, b] (Stacks 08CI); the condition can be checked on stalks (Stacks 09U9). TT 2.2.11 calls these Tor-amplitude, globally finite Tor-amplitude and locally finite Tor-amplitude.

**Hypotheses.**

- Every O_X-module F is tested, not only quasi-coherent ones; for E ∈ D_QCoh on a quasi-separated scheme quasi-coherent F suffice (Stacks 08EA).
- Taking F = O_X shows that an object of finite tor dimension is cohomologically bounded.
- Formally HasTorAmplitude is defined by the flat-representative form (Stacks 08CI): E is locally quasi-isomorphic to a complex of flat O_X-modules concentrated in degrees [a, b]. The derived-tensor form above is its characterisation once ⊗^L on D(O_X) is available from EnhancedDerivedSheaves E1.

**Proof.**

1. Define the three predicates with E1's derived tensor product.
2. Prove the flat-representative characterisation: represent E by a bounded above complex of flat modules, truncate above b using that kernels of surjections of flat modules are flat, and below a using that the cokernel of d^{a−1} is flat (Stacks 08CH, 08CI).
3. Record stalkwise detection (Stacks 09U9) and the affine translation to modules (Stacks 08E9).

**API.**

- `HasTorAmplitude` (constructor): E has tor-amplitude in [a, b].
- `HasFiniteTorDimension` (constructor): E has tor-amplitude in some [a, b].
- `HasLocallyFiniteTorDimension` (constructor): E has finite tor dimension on the members of an open covering.
- `hasTorAmplitude_iff_flat_representative` (characterisation): Tor-amplitude in [a, b] iff E is represented by flat modules in degrees [a, b] (Stacks 08CI).
- `hasTorAmplitude_iff_stalks` (characterisation): Tor-amplitude in [a, b] can be checked on every stalk E_x over O_{X,x} (Stacks 09U9).
- `HasTorAmplitude.pullback` (functoriality): Lf* preserves tor-amplitude in [a, b] (Stacks 09U8).
- `HasTorAmplitude.triangle` (structure): The three-term closure rules in a distinguished triangle (Stacks 08CJ) and additivity of amplitudes under ⊗^L (Stacks 09J4).
- `HasFiniteTorDimension.of_locally_quasiCompact` (other): On a quasi-compact scheme locally finite tor dimension implies finite tor dimension (TT 3.1.2).
- `HasTorAmplitude.bounded` (projection): Tor-amplitude in [a, b] implies H^i(E) = 0 for i ∉ [a, b].

**Unit tests.**

- `hasTorAmplitude_locallyFree` (computation): A finite locally free module in degree 0 has tor-amplitude in [0, 0]; O --x--> O in degrees −1, 0 on Spec k[x] has tor-amplitude in [−1, 0].
- `hasTorAmplitude_zero` (degenerate): The zero object has tor-amplitude in every [a, b].
- `not_hasFiniteTorDimension_residue_dualNumbers` (non-example): The residue field k of k[ε]/(ε²) has no finite tor dimension on Spec k[ε]/(ε²), since Tor_i(k, k) ≅ k for every i ≥ 0.
- `hasTorAmplitude_affine_iff` (compatibility): On Spec A, (M•)~ has tor-amplitude in [a, b] iff M• has tor-amplitude in [a, b] as a complex of A-modules (Stacks 08E9).

**Acceptance.**

- A finite locally free module in degree 0 has tor-amplitude in [0, 0].
- On Spec k[ε]/(ε²) the residue field k has infinite tor dimension: Tor_i(k, k) = k for every i ≥ 0.

**Used by.**

- TT 3.1 and SchemeKTheoryOperations:S.1/perfect-complicial-waldhausen-category: K(X) is defined from perfect complexes of globally finite Tor-amplitude
- SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor: perfect is pseudo-coherent plus locally finite tor dimension
- SchemeKTheoryOperations:S.2/proper-perfect-pushforward-perfect: perfect morphisms are those of locally finite Tor-dimension

**Depends on.** other roadmaps: `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:DerivedCategory`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Definition 48.1 (tag 08CG): “We say E has tor-amplitude in [a, b] if Hi(E⊗L OX F) = 0 for all OX-modules F and all i ∉ [a, b].” — The definition, part (1).
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Definition 48.1(3) (tag 08CG): “We say E locally has finite tor dimension if there exists an open covering” — The local version, part (3).
- `ThomasonTrobaugh.1990`, Definition 2.2.11, p. 290: “A complex E· of O_X-modules has Tor-amplitude contained in [a, b] for integers a ≤ b if for all O_X-modules F, H^k(E· ⊗^L_{O_X} F) = 0 unless a ≤ k ≤ b.” — Thomason–Trobaugh's definition, which TT 3.1 uses globally for K(X).

### Perfect complexes and the perfect derived category

`S.1/perfect-complex` · definition · planet “Perfect complex”

Conventions of this layer: X is a scheme; an O_X-module is an object of Mathlib's abelian category X.Modules; a complex is a cochain complex indexed by ℤ with differential raising degree (TT 1.1.1, Stacks, Mathlib's CochainComplex); the shift is E[k]^n = E^{n+k} with differential multiplied by (−1)^k, and the cone of φ : E → F has C(φ)^n = F^n ⊕ E^{n+1} (Mathlib's mappingCone); D(O_X) is Mathlib's DerivedCategory of X.Modules, identified by EnhancedDerivedSheaves E1 with the homotopy category of its enhancement. A complex E• of O_X-modules is perfect if there are an open covering X = ⋃ U_i and, for each i, a strictly perfect complex E•_i on U_i with a quasi-isomorphism E•_i → E•|U_i (Stacks 08CM; TT 2.2.10, 2.2.9). An object of D(O_X) is perfect if it is represented by a perfect complex. D_perf(O_X) denotes the full subcategory of D(O_X) on the perfect objects: it is strictly full, and by SchemeKTheoryOperations:S.1/perfect-triangulated-and-thick it is a saturated (thick) triangulated subcategory. Perfectness is defined locally: no global bounded complex of finite locally free modules is required, and singular schemes are allowed.

**Hypotheses.**

- X is an arbitrary scheme; the quasi-compactness and resolution hypotheses of the nodes that follow are not part of the definition.
- The local models are quasi-isomorphic to the restrictions by actual maps of complexes; by SchemeKTheoryOperations:S.1/perfect-local-and-invariant this is equivalent to asking for isomorphisms in D(O_{U_i}).
- On a non-quasi-compact scheme a perfect object need not be globally bounded; TT 3.1 therefore adds globally finite Tor-amplitude when defining K(X), which is automatic for quasi-compact X (TT 3.1.2).

**Proof.**

1. Define the object property on complexes and its image as an ObjectProperty of D(O_X) (closed under isomorphism by SchemeKTheoryOperations:S.1/perfect-local-and-invariant).
2. Record the scheme form of the local models: finite complexes of finite locally free, or even finite free, modules (Stacks 0BCJ).
3. Define D_perf(O_X) as the corresponding full subcategory of Mathlib's DerivedCategory X.Modules.

**API.**

- `IsPerfect` (constructor): The object property on complexes: locally quasi-isomorphic to strictly perfect complexes.
- `DerivedCategory.isPerfect` (constructor): The induced object property on D(O_X); D_perf(O_X) is its full subcategory.
- `IsStrictlyPerfect.isPerfect` (constructor): A strictly perfect complex is perfect.
- `isPerfect_iff_locally_finite_free` (characterisation): E is perfect iff there is a covering on which E is represented by finite complexes of finite free modules (Stacks 0BCJ).
- `IsPerfect.of_quasiIso` (structure): Perfectness is invariant under quasi-isomorphism (SchemeKTheoryOperations:S.1/perfect-local-and-invariant).
- `isPerfect_iff_restrict` (characterisation): E is perfect iff E|U_i is perfect for every member of some open covering.
- `isTriangulated_isPerfect` (instance): D_perf(O_X) is a triangulated subcategory closed under summands (SchemeKTheoryOperations:S.1/perfect-triangulated-and-thick).
- `IsPerfect.bounded` (projection): On a quasi-compact scheme a perfect object has H^i = 0 outside a finite interval (SchemeKTheoryOperations:S.1/perfect-objects-quasi-coherent-bounded).
- `isPerfect_tilde_iff` (compatibility): On Spec A, M•~ is perfect iff M• is a perfect complex of A-modules (SchemeKTheoryOperations:S.1/affine-perfect-comparison).

**Unit tests.**

- `isPerfect_skyscraper_affineLine` (computation): On Spec k[x], the skyscraper (k[x]/(x))~ in degree 0 is perfect: the strictly perfect complex O --x--> O maps quasi-isomorphically to it.
- `isPerfect_zero_unit` (degenerate): The zero object and O_X[n] are perfect on every scheme; on the empty scheme D_perf is the zero category.
- `not_isPerfect_residue_dualNumbers` (non-example): On Spec k[ε]/(ε²) the residue field k in degree 0 is not perfect: a perfect object has finite tor dimension, but Tor_i(k, k) ≅ k for every i.
- `isPerfect_iff_affine_projective` (compatibility): For X = Spec ℤ, the object (ℤ/n)~ in degree 0 (n ≠ 0) is perfect, via ℤ --n--> ℤ, matching that ℤ/n is a perfect ℤ-module (More on Algebra 066Q).
- `not_isPerfect_iff_strictly_perfect` (non-example): Perfect does not imply strictly perfect even globally up to quasi-isomorphism: on the affine plane with doubled origin the skyscraper at one origin is perfect but not quasi-isomorphic to a strictly perfect complex (SchemeKTheoryOperations:S.1/doubled-plane-counterexample).

**Acceptance.**

- O_X[0], every strictly perfect complex and every finite locally free module in one degree are perfect.
- On Spec k[x] the skyscraper (k[x]/(x))~ is perfect but not strictly perfect; on Spec k[ε]/(ε²) the residue field is pseudo-coherent but not perfect.

**Used by.**

- TT 3.1 and SchemeKTheoryOperations:S.2/k-theory-of-a-scheme: K(X) is the K-theory of the complicial biWaldhausen category of perfect complexes
- SchemeKTheoryOperations:S.3 (K_Z(X)): K_Z(X) uses perfect complexes acyclic off a closed subset Z
- SchemeKTheoryOperations:S.2/cartan-map: on a noetherian scheme perfect complexes are cohomologically bounded with coherent cohomology, giving K(X) → G(X)
- EllipticKTheory:E.2–E.5: the K-groups of an elliptic curve and of its models are those of D_perf through S.2

**Depends on.** this roadmap: `S.1/strictly-perfect-complex`; other roadmaps: `EnhancedDerivedSheaves:E1/enhanced-derived-category`; libraries: `mathlib:DerivedCategory`, `mathlib:DerivedCategory.Q`, `mathlib:QuasiIso`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Definition 49.1 (tag 08CM): “We say E• is perfect if there exists an open covering X = ⋃ Ui such that for each i there exists a morphism of complexes E• i →E•|Ui which is a quasi-isomorphism with E• i a strictly perfect complex of OUi-modules.” — The definition used here.
- `ThomasonTrobaugh.1990`, Definition 2.2.10, p. 290: “A complex E· of O_X-modules on a scheme is perfect if it is locally quasi-isomorphic to a strict perfect complex, i.e., if 2.2.9.1 or 2.2.9.2 hold for E·.” — Thomason–Trobaugh's equivalent definition (SGA 6 I 4.2).
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.3 (tag 0BCJ): “Assume that all stalks OX,x are local rings. Then the following are equivalent (1) E is perfect, (2) there exists an open covering X = ⋃ Ui such that E|Ui can be represented by a finite complex of finite locally free OUi-modules” — The scheme form: local models are finite complexes of finite locally free modules.

### Perfectness is local and invariant under quasi-isomorphism

`S.1/perfect-local-and-invariant` · lemma

Let X be a scheme and E an object of D(O_X). (1) If there are an open covering X = ⋃ U_i and strictly perfect complexes E•_i on U_i with E•_i ≅ E|U_i in D(O_{U_i}), then E is perfect. (2) If E is perfect then every complex representing E is perfect; in particular a complex quasi-isomorphic to a perfect complex is perfect. (3) For every open U ⊂ X, the restriction of a perfect object to U is perfect, and E is perfect iff E|U_i is perfect for all members of some open covering.

**Hypotheses.**

- The isomorphisms in (1) are in the derived categories of the U_i, not chain maps; (1) says local derived models suffice.

**Proof.**

1. Let F• be any complex representing E. By SchemeKTheoryOperations:S.1/strictly-perfect-local-lifting (Stacks 08C9), after refining the covering the isomorphisms E•_i → E|U_i are represented by maps of complexes E•_i → F•|U_i, which are quasi-isomorphisms; so F• is perfect. This proves (1) and (2) together (Stacks 08CN, TT 2.2.9).
2. (3): restriction to an open is exact and sends strictly perfect complexes to strictly perfect complexes (SchemeKTheoryOperations:S.1/strictly-perfect-closure); the local criterion is the definition.

**Acceptance.**

- If E is perfect and E ≅ F in D(O_X) then F is perfect.
- A complex that is perfect on each chart of an open covering is perfect.

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/strictly-perfect-local-lifting`, `S.1/strictly-perfect-closure`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules.restrict`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.2(1) (tag 08CN): “If there exists an open covering X = ⋃ Ui and strictly perfect complexes E• i on Ui such that E• i represents E|Ui in D(OUi), then E is perfect.” — Part (1).
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.2(2) (tag 08CN): “If E is perfect, then any complex representing E is perfect.” — Part (2).
- `ThomasonTrobaugh.1990`, Lemma 2.2.9, p. 290: “2.2.9.2. For each point x ∈ X, there is an nbd U of x, a strict perfect complex F· on U, and an isomorphism in D(O_X-Mod) between E·|U and F·.” — Thomason–Trobaugh's equivalence of the chain-level and derived-level local conditions.

### Perfect is pseudo-coherent of locally finite tor dimension

`S.1/perfect-iff-pseudo-coherent-finite-tor` · theorem

Let X be a scheme and E an object of D(O_X). Then E is perfect iff E is pseudo-coherent and locally has finite tor dimension. More precisely, if E has tor-amplitude in [a, b] and is (a − 1)-pseudo-coherent, then E is perfect, and locally it is represented by a complex of finite locally free modules in degrees [a, b].

**Hypotheses.**

- Tor dimension is local: the amplitude may vary over an open covering; on a quasi-compact scheme it is global (TT 3.1.2).

**Proof.**

1. Perfect implies pseudo-coherent (the local strictly perfect models are m-pseudo-coherent models for every m) and locally of finite tor dimension (a bounded complex of flat modules computes ⊗^L termwise).
2. Conversely, work locally: choose a strictly perfect E• and a map α : E• → E with H^i(α) an isomorphism for i ≥ a, replaced by σ_{≥a−1}E•; the cone is K[2 − a] with K = Ker(E^{a−1} → E^a).
3. The tor-amplitude hypothesis gives Tor_1(Coker(E^{a−1} → E^a), F) = 0 for all F, so this cokernel E′ is flat and finitely presented, hence locally a direct summand of a finite free module (Stacks Modules 18.3).
4. Then E′ → E^{a+1} → ⋯ → E^b is a strictly perfect local model of E (Stacks 08CP, 08CQ; TT 2.2.12).

**Acceptance.**

- On Spec k[x], (k[x]/(x))~ is 0-pseudo-coherent of tor-amplitude [−1, 0], hence perfect.
- On Spec k[ε]/(ε²), the residue field is pseudo-coherent but has infinite tor dimension, hence is not perfect.

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/pseudo-coherent-complex`, `S.1/tor-amplitude`, `S.1/perfect-local-and-invariant`; libraries: `mathlib:Module.Flat`, `mathlib:Module.FinitePresentation`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.5 (tag 08CQ): “E is pseudo-coherent and locally has finite tor dimension.” — Condition (2) of the equivalence (1) E is perfect ⇔ (2); the page break of the source falls between the two conditions.
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.4 (tag 08CP): “If E has tor amplitude in [a, b] and is (a −1)-pseudo-coherent, then E is perfect.” — The sharp form.
- `ThomasonTrobaugh.1990`, Proposition 2.2.12, p. 290: “A complex E· of O_X-modules is perfect iff E· is pseudo-coherent and has locally finite Tor-amplitude.” — Thomason–Trobaugh's statement (SGA 6 I 5.8.1).

### Perfect complexes are closed under shifts, cones and retracts

`S.1/perfect-triangulated-and-thick` · lemma

Let X be a scheme. (1) If E is perfect then so is E[k] for every k ∈ ℤ. (2) If K → L → M → K[1] is a distinguished triangle in D(O_X) and two of K, L, M are perfect, so is the third; in particular the cone of a morphism of perfect objects is perfect (Stacks 08CR; TT 2.2.13(b)). (3) If K ⊕ L is perfect then K and L are perfect (Stacks 08CS; TT 2.2.13(c)). Hence D_perf(O_X) is a strictly full, saturated (thick) triangulated subcategory of D(O_X): Mathlib's ObjectProperty.IsTriangulated holds, together with closure under direct summands.

**Hypotheses.**

- Retracts are handled through direct summands: a retract of an object in the pretriangulated D(O_X), which is Karoubian (SchemeKTheoryOperations:S.1/perfect-idempotent-complete), is a direct summand.

**Proof.**

1. (1) is immediate from the definition, strictly perfect complexes being closed under shift (SchemeKTheoryOperations:S.1/strictly-perfect-closure).
2. (2): work locally with strictly perfect representatives of K and L; by SchemeKTheoryOperations:S.1/strictly-perfect-local-lifting the map K → L is locally a chain map, and its cone is strictly perfect (Stacks 08C5) and represents M. Rotation handles the other two cases.
3. (3): by SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor it suffices that summands of pseudo-coherent objects are pseudo-coherent (Stacks 08CE: an induction with the triangles L[n] → L[n] ⊕ L[n−1] → L[n−1]) and that Tor functors are additive (Stacks 08CK).

**Acceptance.**

- The cone of the map O --x--> O on Spec k[x], viewed as a map O[0] → O[0], is perfect.
- A direct summand of O_X^n in D(O_X) is perfect.

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/strictly-perfect-closure`, `S.1/strictly-perfect-local-lifting`, `S.1/perfect-iff-pseudo-coherent-finite-tor`; libraries: `mathlib:CategoryTheory.ObjectProperty.IsTriangulated`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.7 (tag 08CR): “Let (K, L, M, f, g, h) be a distinguished triangle in D(OX). If two out of three of K, L, M are perfect then the third is also perfect.” — Part (2).
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.9 (tag 08CS): “If K ⊕L is a perfect object of D(OX), then so are K and L.” — Part (3).
- `ThomasonTrobaugh.1990`, Proposition 2.2.13(b), p. 291: “If A·, B·, C· are the three vertices of a distinguished triangle in D(O_X-Mod), and 2 of these 3 vertices are pseudo-coherent (resp. perfect), then the third vertex is also pseudo-coherent (resp. perfect).” — Thomason–Trobaugh's statement.

### Derived tensor products of perfect complexes

`S.1/perfect-derived-tensor` · lemma

Let X be a scheme. If K, L are perfect objects of D(O_X), then K ⊗^L_{O_X} L is perfect; if K has tor-amplitude in [a, b] and L in [c, d], then K ⊗^L L has tor-amplitude in [a + c, b + d]. If E is perfect and F is pseudo-coherent (resp. cohomologically bounded pseudo-coherent) then E ⊗^L F is pseudo-coherent (resp. cohomologically bounded pseudo-coherent). For strictly perfect K•, L• the derived tensor product is represented by Tot(K• ⊗ L•), which is strictly perfect.

**Hypotheses.**

- The derived tensor product is EnhancedDerivedSheaves E1's, computed on K-flat representatives.

**Proof.**

1. Locally represent K and L by strictly perfect complexes; these are K-flat, so K ⊗^L L is represented by Tot(K• ⊗ L•), strictly perfect by Stacks 09J2 (SchemeKTheoryOperations:S.1/strictly-perfect-closure).
2. The amplitude estimate is the Tor spectral sequence (Stacks 09J4); the pseudo-coherent statements are Stacks 09J3 and TT 2.5.1.

**Acceptance.**

- O_X ⊗^L E ≅ E.
- On Spec k[x], (k[x]/(x))~ ⊗^L (k[x]/(x))~ ≅ k ⊕ k[1] as a perfect complex of tor-amplitude [−2, 0].

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/strictly-perfect-closure`, `S.1/tor-amplitude`, `S.1/pseudo-coherent-complex`; other roadmaps: `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.8 (tag 09J5): “If K, L are perfect objects of D(OX), then so is K ⊗L OX L.” — The main statement.
- `ThomasonTrobaugh.1990`, 2.5.1, p. 303: “If E· is perfect, hence of finite Tor-amplitude, and F· is cohomologically bounded and pseudo-coherent, then E· ⊗^L_{O_X} F· is also cohomologically bounded and pseudo-coherent.” — The mixed statement used for the K(X)-module structure of G(X).

### Derived pullback preserves perfect complexes

`S.1/perfect-derived-pullback` · lemma

Let f : X → Y be an arbitrary morphism of schemes and Lf* : D(O_Y) → D(O_X) the derived pullback of EnhancedDerivedSheaves E1 (computed on K-flat complexes). If E ∈ D(O_Y) is perfect then Lf*E is perfect; if E is m-pseudo-coherent then so is Lf*E; tor-amplitude in [a, b] is preserved. For a strictly perfect complex E• on Y, the degreewise pullback f*E• is strictly perfect and represents Lf*E•. Lf* restricts to a triangulated functor D_perf(O_Y) → D_perf(O_X), and L(g∘f)* ≅ Lf*∘Lg* on perfect objects.

**Hypotheses.**

- No hypothesis on f: not flat, not of finite type, not quasi-compact. This is the 'arbitrary derived pullback' of the layer.
- The degreewise pullback computes Lf* only on complexes of flat modules; on a general perfect complex one first passes to a flat (K-flat) representative.

**Proof.**

1. Locally on Y represent E by a strictly perfect complex; its degreewise pullback is strictly perfect and computes Lf* because finite locally free modules are flat (SchemeKTheoryOperations:S.1/strictly-perfect-closure; TT 2.5.1).
2. Pseudo-coherence: a map E•_i → E|V_i inducing isomorphisms on H^j for j > m has cone with H^j = 0 for j ≥ m; Lf* preserves this vanishing (the dual of Derived Categories 16.1) (Stacks 09U7).
3. Tor-amplitude: represent E by flat modules in degrees [a, b] (Stacks 08CI) and pull back degreewise (Stacks 09U8); combine with SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor (Stacks 09UA).
4. Composition: the canonical isomorphism L(g∘f)* ≅ Lf*∘Lg* is that of E1's enhanced pullback, and on strictly perfect complexes it is Mathlib's pullbackComp.

**Acceptance.**

- For the origin ι : Spec k → Spec k[x], Lι*((k[x]/(x))~) ≅ k ⊕ k[1], a perfect complex on Spec k.
- For an open immersion Lf* is restriction.

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/strictly-perfect-closure`, `S.1/pseudo-coherent-complex`, `S.1/tor-amplitude`, `S.1/perfect-iff-pseudo-coherent-finite-tor`; other roadmaps: `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackComp`.

**Sources.**

- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.6 (tag 09UA): “If E is perfect in D(OY ), then Lf ∗E is perfect in D(OX).” — The main statement, for an arbitrary morphism of ringed spaces.
- `ThomasonTrobaugh.1990`, 2.5.1, p. 303: “In general, Lf* : D^−(O_Y-Mod) → D^−(O_X-Mod) sends perfect complexes to perfect complexes.” — Thomason–Trobaugh's statement (SGA 6 I 2).

### The perfect derived category is idempotent complete

`S.1/perfect-idempotent-complete` · lemma

Let X be a scheme. The derived category D(O_X) has countable (indeed arbitrary) direct sums, computed termwise on representatives, hence is Karoubian: every idempotent splits. Since D_perf(O_X) is closed under direct summands (SchemeKTheoryOperations:S.1/perfect-triangulated-and-thick), D_perf(O_X) is idempotent complete (Mathlib's IsIdempotentComplete).

**Hypotheses.**

- This is a statement about the triangulated category, not about the Waldhausen category of complexes: idempotents of D_perf(O_X) split in D_perf(O_X).

**Proof.**

1. D(O_X) has direct sums, computed by termwise direct sums of representatives (Injectives 13.4 as quoted in Stacks 08DT); these exist because X.Modules is Grothendieck abelian (EnhancedDerivedSheaves E1).
2. A pre-triangulated category with countable coproducts is Karoubian (Stacks 05QW, the Bökstedt–Neeman argument).
3. An idempotent e of a perfect object P splits in D(O_X) as P ≅ Q ⊕ Q′; by closure under summands Q is perfect, so e splits in D_perf(O_X).

**Acceptance.**

- The idempotent (1, 0) on O_X ⊕ O_X[1] splits with image O_X.
- K_0 of D_perf(O_X) needs no idempotent completion; this is what makes π_0 of the nonconnective K-theory equal K_0(X) (SchemeKTheoryOperations:S.2/nonconnective-k-theory-of-a-scheme).

**Depends on.** this roadmap: `S.1/perfect-triangulated-and-thick`; other roadmaps: `EnhancedDerivedSheaves:E1/sheaves-of-modules-and-the-grothendieck-property`; libraries: `mathlib:CategoryTheory.IsIdempotentComplete`, `mathlib:DerivedCategory`.

**Sources.**

- `Stacks.derived.2026`, Derived Categories, Lemma 4.14 (tag 05QW): “Let D be a pre-triangulated category. If D has countable products, then D is Karoubian. If D has countable coproducts, then D is Karoubian.” — The Karoubian criterion.
- `Stacks.perfect.2026`, Derived Categories of Schemes, proof of Lemma 3.1 (tag 08DT): “By Injectives, Lemma 13.4 the derived category D(OX) has direct sums and they are computed by taking termwise direct sums of any representatives.” — Existence of direct sums in D(O_X).

### Perfect objects have quasi-coherent, bounded, and on noetherian schemes coherent cohomology

`S.1/perfect-objects-quasi-coherent-bounded` · lemma

Let X be a scheme and E ∈ D(O_X) perfect. (1) Every cohomology sheaf H^i(E) is quasi-coherent, i.e. E ∈ D_QCoh(O_X) (Stacks 08E5). (2) If X is quasi-compact, E ∈ D^b(O_X): H^i(E) = 0 outside a finite interval. (3) If X is noetherian, E ∈ D^b_Coh(O_X): the cohomology sheaves are coherent and only finitely many are nonzero; moreover E ⊗^L L and RHom(E, L) lie in D^b_Coh(O_X) for every L ∈ D^b_Coh(O_X) (Stacks 0FXU).

**Hypotheses.**

- Quasi-compactness is needed in (2): on an infinite disjoint union of points, ⊕_n k[n] (one summand on each point) is perfect but unbounded.

**Proof.**

1. (1): locally E is represented by a strictly perfect complex, whose terms are quasi-coherent; so its cohomology sheaves are quasi-coherent (Stacks 08E5).
2. (2): locally E has tor-amplitude in some [a, b], hence H^i(E) = 0 outside [a, b] there; finitely many charts cover X.
3. (3): on a noetherian scheme, the terms of the local strictly perfect models are coherent, so the cohomology is coherent; the statements for ⊗^L and RHom are local and computed termwise on a finite complex of finite free modules (Stacks 0FXU, using Cohomology 46.9).

**Acceptance.**

- On Spec k[x], (k[x]/(x))~ ∈ D^b_Coh.
- On Spec k[ε]/(ε²), the residue field lies in D^b_Coh but is not perfect: (3) has no converse without regularity (the converse for regular schemes is SchemeKTheoryOperations:S.2/perfect-coherent-on-regular).

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/tor-amplitude`, `S.1/perfect-iff-pseudo-coherent-finite-tor`; libraries: `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:AlgebraicGeometry.IsNoetherian`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 10.1 (tag 08E5): “If E is pseudo-coherent, then E is an object of DQCoh(OX).” — Part (1), via perfect ⇒ pseudo-coherent.
- `Stacks.cohomology.2026`, Cohomology of Sheaves, remark after Definition 49.1: “If X is quasi-compact, then a perfect object of D(OX) is in Db(OX).” — Part (2).
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 11.6 (tag 0FXU): “Let X be a Noetherian scheme. Let E in D(OX) be perfect. Then (1) E is in Db Coh(OX),” — Part (3).

### Perfect complexes of modules over an arbitrary ring

`S.1/perfect-module-complex` · definition

Let A be a ring (commutative for every scheme-theoretic use below) and D(A) Mathlib's derived category of ModuleCat A. An object K of D(A) is perfect if it is quasi-isomorphic to a bounded complex of finitely generated projective A-modules (Stacks 0657); an A-module M is perfect if M[0] is. Equivalently K is pseudo-coherent of finite tor dimension, and if K has tor-amplitude in [a, b] it is quasi-isomorphic to a complex of finite projective modules concentrated in [a, b] (Stacks 0658); a module is perfect iff it has a finite resolution by finite projective modules (Stacks 066Q). D_perf(A) ⊂ D(A) is the full subcategory of perfect objects. No noetherian, local or completeness hypothesis is imposed: this extends the complete-noetherian-local construction of DeformationAndDerivedPatchingAlgebra P7, with which it coincides on P7's rings.

**Hypotheses.**

- A is arbitrary; for a regular (noetherian) ring every finite module is perfect (Stacks 066Z), but for a general ring finite modules need not be perfect.
- Finite projective means finitely generated and projective (Tau Ceti's finiteProjectiveModules), not finitely presented and flat for a non-noetherian ring unless the equivalence of Stacks Algebra 78.2 is invoked.

**Proof.**

1. Define the object property on D(ModuleCat A) and the full subcategory D_perf(A).
2. Prove the equivalence with pseudo-coherent plus finite tor dimension: truncate a bounded-above finite free resolution at the lower tor bound; the truncated term is finitely presented and flat, hence finite projective (Stacks 0658).
3. Record closure under cones, summands and derived tensor products (Stacks 066R, 066S, 0GM0) and preservation by −⊗^L_A B for ring maps A → B (Stacks 066W).
4. Compare with DeformationAndDerivedPatchingAlgebra P7: for a complete noetherian local O-algebra R, P7's perfect objects (quasi-isomorphic to bounded complexes of finite projective R-modules) are exactly the perfect objects of this node for A = R.

**API.**

- `IsPerfectModule` (constructor): K ∈ D(A) is perfect: isomorphic in D(A) to a bounded complex of finitely generated projective modules.
- `isPerfectModule_iff_pseudoCoherent_finiteTor` (characterisation): Perfect iff pseudo-coherent of finite tor dimension (Stacks 0658).
- `isPerfectModule_iff_finite_projective_resolution` (characterisation): A module is perfect iff it has a finite resolution by finite projective modules (Stacks 066Q).
- `IsPerfectModule.triangle` (structure): Two out of three in distinguished triangles (Stacks 066R); summands (Stacks 066S).
- `IsPerfectModule.derivedTensor` (structure): K ⊗^L_A L of perfect objects is perfect (Stacks 0GM0).
- `IsPerfectModule.baseChange` (functoriality): K ⊗^L_A B is perfect over B for any ring map A → B (Stacks 066W).
- `IsPerfectModule.restrictScalars` (functoriality): If B is perfect as an A-module, a perfect complex of B-modules is perfect over A (Stacks 066V).
- `isPerfectModule_iff_P7` (compatibility): For a complete noetherian local O-algebra R, this property agrees with DeformationAndDerivedPatchingAlgebra P7's perfectness.
- `isPerfectModule_of_isRegularRing` (example): Over a regular ring every finite module is perfect (Stacks 066Z; Serre's theorem via DeformationAndDerivedPatchingAlgebra R03.3).

**Unit tests.**

- `isPerfectModule_int_quot` (computation): ℤ/6 is a perfect ℤ-module, with resolution 0 → ℤ --6--> ℤ → ℤ/6 → 0 of length one.
- `isPerfectModule_zero_ring` (degenerate): Over the zero ring every object of D(A) is perfect, and D_perf(A) is equivalent to the zero category.
- `not_isPerfectModule_Z4` (non-example): Over A = ℤ/4 the module ℤ/2 is not perfect: its minimal resolution ⋯ --2--> ℤ/4 --2--> ℤ/4 → ℤ/2 is infinite and Tor_i^{ℤ/4}(ℤ/2, ℤ/2) ≅ ℤ/2 for every i ≥ 0.
- `isPerfectModule_single_iff_finiteProjective` (compatibility): A module M in degree 0 is perfect of tor-amplitude [0, 0] iff M ∈ tauceti:TauCeti.finiteProjectiveModules A.
- `isPerfectModule_eq_P7_on_complete_local` (compatibility): For R = ℤ_p[[x]], O = ℤ_p, the object (R --x--> R) is perfect here and in P7, with cohomology R/(x) ≅ ℤ_p in degree 0.

**Acceptance.**

- A[0] is perfect; ℤ/n (n ≠ 0) is a perfect ℤ-module; the residue field of k[ε]/(ε²) is not a perfect module.
- On P7's rings the two definitions return the same object property of D(R).

**Used by.**

- SchemeKTheoryOperations:S.1/affine-perfect-comparison: D_perf(Spec A) ≃ D_perf(A)
- SchemeKTheoryOperations:S.2/affine-k-theory-comparison: K(R) ≃ K Ch^b(P(R)) ≃ K Ch_perf(R) (K-book V.2.7.2)
- DeformationAndDerivedPatchingAlgebra P7: the complete-noetherian-local construction is the overlap case
- SchemeKTheoryOperations:S.2/affine-pushforward-is-transfer: the transfer along A → B needs B perfect as an A-module

**Depends on.** other roadmaps: `DeformationAndDerivedPatchingAlgebra:P7/perfect-complexes-tor-amplitude-and-minimal-models`; libraries: `mathlib:ModuleCat`, `mathlib:DerivedCategory`, `mathlib:Module.Projective`, `mathlib:Module.Finite`, `tauceti:TauCeti.finiteProjectiveModules`.

**Sources.**

- `Stacks.more-algebra.2026`, More on Algebra, Definition 76.1 (tag 0657): “An object K of D(R) is perfect if it is quasi-isomorphic to a bounded complex of finite projective R-modules.” — The definition, for an arbitrary ring R.
- `Stacks.more-algebra.2026`, More on Algebra, Lemma 76.2 (tag 0658): “The following are equivalent (1) K• is perfect, and (2) K• is pseudo-coherent and has finite tor dimension.” — The characterisation.
- `Stacks.more-algebra.2026`, More on Algebra, Lemma 76.3 (tag 066Q): “there exists a resolution 0 →Fd →. . . →F1 →F0 →M →0 with each Fi a finite projective R-module.” — The module case.
- `Kbook.2013`, Example V.2.7.2 (PDF p. 391): “A perfect complex of R-modules is a complex M which is quasi-isomorphic to a bounded complex of finitely generated projective R-modules, i.e., to a complex in Chb(P(R)).” — The K-book's definition, used for K(R) ≃ K Ch_perf(R).

### The coherator and complexes of quasi-coherent modules

`S.1/coherator` · theorem

Let X be a scheme and Q_X : Mod(O_X) → QCoh(O_X) the coherator, the right adjoint of the inclusion QCoh(O_X) → Mod(O_X) (it exists on every scheme, and Q_X(F) → F is an isomorphism for quasi-coherent F). Its right derived functor RQ_X : D(O_X) → D(QCoh(O_X)) is right adjoint to the canonical functor D(QCoh(O_X)) → D(O_X). (1) If X is quasi-compact with affine diagonal (quasi-compact and semi-separated in TT's language), D(QCoh(O_X)) → D_QCoh(O_X) is an equivalence with quasi-inverse RQ_X (Stacks 08DB). (2) If X is noetherian, the same holds (Stacks 09T4), and D^b(Coh(O_X)) → D^b_Coh(O_X) is an equivalence (Stacks 0FDB). TT B.16 proves the bounded-below case of (1) and (2).

**Hypotheses.**

- Affine diagonal (every intersection of two affine opens is affine) is needed in (1); separated schemes qualify. Without it only the bounded-below comparison on a noetherian scheme is available by (2).
- The unbounded derived functors use the K-injective replacements of EnhancedDerivedSheaves E1 for X.Modules and for QCoh(O_X) (both Grothendieck abelian).

**Proof.**

1. Existence of Q_X and the adjunction RQ_X ⊣ (D(QCoh) → D(O_X)) (Stacks 08D6, Derived Categories 30.3).
2. For an affine morphism f the direct image on quasi-coherent modules is exact and computes Rf_* (Stacks 08D7); in particular for affine opens U ⊂ X with affine inclusion (affine diagonal) the hypothesis of Stacks 09T6 holds.
3. Stacks 09T6: by induction on the number of affines needed to cover the support, using Mayer–Vietoris for the two adjunction maps, both are isomorphisms; this gives (1).
4. For noetherian X, Stacks 8.2 verifies the same hypothesis without affine diagonal, giving (2) (Stacks 09T4); Stacks 0FDB deduces the D^b(Coh) statement from Lemma 11.1 (coherent submodules of quasi-coherent modules).

**Acceptance.**

- For X = Spec A the coherator is M ↦ Γ(X, M)~ and (1) is the affine equivalence of SchemeKTheoryOperations:S.1/affine-derived-equivalence.
- On the affine plane with doubled origin (not of affine diagonal) (1) is not asserted; (2) applies since it is noetherian.

**Depends on.** other roadmaps: `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `SchemeAndStackFoundations:SF.2`; libraries: `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:AlgebraicGeometry.IsAffineHom`, `mathlib:AlgebraicGeometry.IsNoetherian`, `mathlib:AlgebraicGeometry.tilde`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Proposition 7.5 (tag 08DB): “Let X be a quasi-compact scheme with affine diagonal. Then the functor (3.0.1) D(QCoh(OX)) −→DQCoh(OX) is an equivalence with quasi-inverse given by RQX.” — Part (1).
- `ThomasonTrobaugh.1990`, Proposition B.16, p. 416: “For any complex F· in D^+(O_X-Mod) with quasi-coherent cohomology, the canonical map φ(RQ(F·)) → F· is a quasi-isomorphism.” — Thomason–Trobaugh's bounded-below version, for X quasi-compact and semi-separated or noetherian.

### The derived category of an affine scheme

`S.1/affine-derived-equivalence` · theorem

Let A be a commutative ring and X = Spec A. The tilde functor M ↦ M~, applied degreewise, and derived global sections RΓ(X, −) give mutually inverse triangulated equivalences D(A) ≃ D(QCoh(O_X)) ≃ D_QCoh(O_X) (Stacks 06Z0). They are compatible with the two functorialities of a ring map φ : A → B, g = Spec φ : Spec B → Spec A: under the equivalences, Lg* corresponds to − ⊗^L_A B (Stacks 08DW) and Rg_* to restriction of scalars (Stacks 0DJK); and (M•)~ ⊗^L (K•)~ ≅ (M• ⊗^L_A K•)~ (Stacks 08DX).

**Hypotheses.**

- A is an arbitrary commutative ring: no noetherian hypothesis.
- RΓ(X, −) on unbounded complexes is computed with E1's K-injective replacements; its vanishing above degree 0 on quasi-coherent modules is Serre's vanishing on affine schemes, imported from scheme cohomology.

**Proof.**

1. Degreewise input: Mathlib's tilde functor is fully faithful with essential image the quasi-coherent modules (tildeEquiv); it is exact because its stalks are localisations (Stacks Schemes 5.4), a lemma this node adds since the pinned Mathlib records full faithfulness and the essential image but not exactness. So it induces D(A) → D_QCoh(O_X).
2. H^p(X, M~) = 0 for p > 0 (Cohomology of Schemes 2.2, requested from SchemeAndStackFoundations SF.2) makes Γ(X, −) of cohomological dimension 0 on quasi-coherent modules; Stacks 08D4 then gives H^0(RΓ(X, E)) = Γ(X, H^0(E)) for E ∈ D_QCoh.
3. Hence the adjunction maps RΓ(X, E)~ → E and M• → RΓ(X, M•~) induce isomorphisms on H^0, and by shifting on all H^n: they are isomorphisms (Stacks 06Z0).
4. Compatibilities: for g affine, Rg_* is computed on quasi-coherent modules by g_*, which is restriction of scalars (Stacks 0DJK); K-flat complexes of A-modules go to K-flat complexes of O_X-modules (Stacks 08DV), so Lg* is − ⊗^L_A B (Stacks 08DW), and similarly for ⊗^L (Stacks 08DX).

**Acceptance.**

- D(ℤ) ≃ D_QCoh(O_{Spec ℤ}), sending ℤ/n[0] to the skyscraper (ℤ/n)~.
- For A → A/I, Lg*(M~) corresponds to M ⊗^L_A A/I.

**Depends on.** other roadmaps: `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `SchemeAndStackFoundations:SF.2`; libraries: `mathlib:AlgebraicGeometry.tilde`, `mathlib:AlgebraicGeometry.tildeEquiv`, `mathlib:AlgebraicGeometry.tilde.functor`, `mathlib:DerivedCategory`, `mathlib:ModuleCat`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, proof of Lemma 3.5 (tag 06Z0): “We will show this functor is quasi-inverse to (3.0.1) via the equivalence between quasi-coherent modules on X and the category of A-modules.” — The equivalence D(A) ≃ D_QCoh(O_{Spec A}); the statement's diagram is not reproduced.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 3.8(2) (tag 08DW): “If X and Y are affine and f is given by the ring map A →B, then the diagram” — Lf* corresponds to −⊗^L_A B (the commutative diagram of the lemma).
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 3.7 (tag 0DJK): “If f : X →Y is a morphism of affine schemes given by the ring map A →B, then the diagram” — Rf_* corresponds to restriction of scalars D(B) → D(A).

### Perfect complexes on an affine scheme are perfect module complexes

`S.1/affine-perfect-comparison` · theorem · planet “Perfect complexes on an affine scheme”

Let A be an arbitrary commutative ring and X = Spec A. Under the equivalence D(A) ≃ D_QCoh(O_X) of SchemeKTheoryOperations:S.1/affine-derived-equivalence, an object M• of D(A) is perfect (SchemeKTheoryOperations:S.1/perfect-module-complex) iff (M•)~ is a perfect object of D(O_X) (Stacks 08EB). Since perfect objects of D(O_X) lie in D_QCoh(O_X) (SchemeKTheoryOperations:S.1/perfect-objects-quasi-coherent-bounded), the equivalence restricts to a triangulated equivalence D_perf(A) ≃ D_perf(O_{Spec A}); both are equivalent to the localisation of the homotopy category K^b(proj A) at quasi-isomorphisms (in fact K^b(proj A) itself).

**Hypotheses.**

- No noetherian hypothesis on A; this is the arbitrary-ring affine theorem the layer retains beyond DeformationAndDerivedPatchingAlgebra P7.
- The comparison is an equivalence of triangulated categories compatible with −⊗^L and with pullback along ring maps.

**Proof.**

1. If M• is perfect, it is quasi-isomorphic to a bounded complex P• of finite projective modules and P•~ is strictly perfect (SchemeKTheoryOperations:S.1/strictly-perfect-complex), so M•~ is perfect.
2. Conversely, if E = M•~ is perfect it is pseudo-coherent and locally of finite tor dimension (SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor). Pseudo-coherence descends from a standard open covering D(f_i) to M• (Stacks 08E7, via More on Algebra 66.14), and tor-amplitude is detected on the tilde side (Stacks 08E9); so M• is pseudo-coherent of finite tor dimension, hence perfect (Stacks 0658).
3. Restrict the equivalence of SchemeKTheoryOperations:S.1/affine-derived-equivalence to perfect objects on both sides; it is triangulated because the ambient equivalence is.

**Acceptance.**

- For A = ℤ, the skyscraper (ℤ/p)~ is perfect on Spec ℤ because ℤ/p is a perfect ℤ-module.
- For A = k[ε]/(ε²), the residue field is neither a perfect module nor a perfect object on Spec A.

**Depends on.** this roadmap: `S.1/affine-derived-equivalence`, `S.1/perfect-module-complex`, `S.1/perfect-complex`, `S.1/perfect-iff-pseudo-coherent-finite-tor`, `S.1/perfect-objects-quasi-coherent-bounded`, `S.1/strictly-perfect-complex`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 10.7 (tag 08EB): “Let X = Spec(A) be an affine scheme. Let M • be a complex of A-modules and let E be the corresponding object of D(OX). Then E is a perfect object of D(OX) if and only if M • is perfect as an object of D(A).” — The comparison, for an arbitrary ring A.
- `Kbook.2013`, Exercise II.9.10(a) (PDF p. 180): “If X = Spec(R), show that K0(R) ∼= Kder 0 (X).” — The degree-zero shadow, proved by the approximation theorem applied to Ch_perf(R) ⊂ Ch_perf(X).

### The complicial biWaldhausen category of perfect complexes

`S.1/perfect-complicial-waldhausen-category` · construction · planet “Waldhausen category of perfect complexes”

Conventions of this layer: X is a scheme; an O_X-module is an object of Mathlib's abelian category X.Modules; a complex is a cochain complex indexed by ℤ with differential raising degree (TT 1.1.1, Stacks, Mathlib's CochainComplex); the shift is E[k]^n = E^{n+k} with differential multiplied by (−1)^k, and the cone of φ : E → F has C(φ)^n = F^n ⊕ E^{n+1} (Mathlib's mappingCone); D(O_X) is Mathlib's DerivedCategory of X.Modules, identified by EnhancedDerivedSheaves E1 with the homotopy category of its enhancement. Let X be a scheme. Perf(X) is the full subcategory of the category of complexes of O_X-modules on the perfect complexes of globally finite Tor-amplitude (all perfect complexes if X is quasi-compact), with the default complicial biWaldhausen structure of TT 1.2.11: cofibrations are the degreewise split monomorphisms whose cokernel lies in Perf(X), and weak equivalences are the quasi-isomorphisms. Its homotopy category w^{-1}Perf(X) (TT 1.9.6) maps by a fully faithful triangulated functor to D(O_X) with essential image D_perf(O_X). This is the Waldhausen model on which GeneralAlgebraicKTheory K.4 computes K(X) (TT 3.1). For a closed subset Z with quasi-compact complement, the full subcategory Perf_Z(X) of complexes acyclic on X ∖ Z carries the induced structure (TT 3.1, used in S.3).

**Hypotheses.**

- Perf(X) is not essentially small: every acyclic complex M --id--> M of O_X-modules is perfect. Only its homotopy category is (for qcqs X, SchemeKTheoryOperations:S.1/perfect-essentially-small); K-theory is formed in the universe of complexes, as TT 1.4 prescribes, and does not depend on it (SchemeKTheoryOperations:S.1/perfect-universe-invariance).
- Weak equivalences are quasi-isomorphisms, not chain homotopy equivalences.
- The ambient abelian category is all O_X-modules, not quasi-coherent ones; quasi-coherent models are compared in SchemeKTheoryOperations:S.1/perfect-waldhausen-models.

**Proof.**

1. Perf(X) is a full additive subcategory of complexes closed under shifts, extensions, canonical homotopy pushouts and pullbacks (TT 1.1.2), because perfect objects are closed under shifts and two out of three (SchemeKTheoryOperations:S.1/perfect-triangulated-and-thick) and globally finite Tor-amplitude is preserved by extensions.
2. Verify the axioms of a saturated extensional biWaldhausen category (TT 1.2.3–1.2.6): pushouts along degreewise split monomorphisms exist in complexes, the gluing lemma and extension axiom follow from the five lemma on cohomology, saturation from two out of three for quasi-isomorphisms.
3. The mapping cylinder and cocylinder of TT 1.3.4 lie in Perf(X) and satisfy the cylinder and cocylinder axioms (TT 1.3.5, 1.3.6).
4. Homotopy category: by TT 1.9.6 w^{-1}Perf(X) is triangulated with a calculus of fractions; it maps fully faithfully to D(O_X) because every complex quasi-isomorphic to one in Perf(X) is in Perf(X) (the localizing criterion of K-book V.3.8, via SchemeKTheoryOperations:S.1/perfect-local-and-invariant); the essential image is D_perf(O_X) by definition.

**API.**

- `perfCategory` (data): The full subcategory Perf(X) of complexes of O_X-modules on perfect complexes of globally finite Tor-amplitude.
- `perfCategory.cofibration_iff` (characterisation): A map is a cofibration iff it is a degreewise split monomorphism with cokernel in Perf(X).
- `perfCategory.weq_iff` (characterisation): A map is a weak equivalence iff it is a quasi-isomorphism of complexes.
- `perfCategory.isComplicialBiWaldhausen` (structure): Perf(X) is a saturated extensional complicial biWaldhausen category (TT 1.2.11).
- `perfCategory.cylinder` (structure): The TT 1.3.4 mapping cylinder is a cylinder functor satisfying the cylinder axiom on Perf(X).
- `perfCategory.closedUnderHomotopyPushouts` (structure): Perf(X) is closed under canonical homotopy pushouts and pullbacks (hypothesis of TT 1.9.8).
- `perfCategory.homotopyCategoryEquiv` (equivalence): w^{-1}Perf(X) ≃ D_perf(O_X), as triangulated categories, via the localisation functor to D(O_X).
- `perfCategory.supports` (constructor): For Z closed with X ∖ Z quasi-compact, Perf_Z(X): perfect complexes acyclic on X ∖ Z, with the induced structure.
- `perfCategory.restrict` (functoriality): Restriction to an open U is a complicial exact functor Perf(X) → Perf(U).

**Unit tests.**

- `perfCategory_affine_homotopy` (compatibility): For X = Spec A, w^{-1}Perf(X) is equivalent to D_perf(A) (SchemeKTheoryOperations:S.1/affine-perfect-comparison), hence to K^b(proj A).
- `perfCategory_empty` (degenerate): For X = ∅, Perf(X) has only zero objects and w^{-1}Perf(X) is the zero category.
- `perfCategory_not_essentiallySmall` (non-example): Perf(Spec k) is not essentially small: for every set S the acyclic complex k^(S) --id--> k^(S) lies in Perf(Spec k), and these complexes are pairwise non-isomorphic as the cardinality of S varies; w^{-1}Perf(Spec k) is nevertheless equivalent to finite-dimensional graded vector spaces.
- `perfCategory_weq_not_homotopyEquiv` (characterisation): On Spec k[x] the quasi-isomorphism (O --x--> O) → (k[x]/(x))~ is a weak equivalence between objects of Perf(Spec k[x]) that is not a chain homotopy equivalence: a homotopy inverse would give a nonzero map from the torsion module (k[x]/(x))~ to the free module O in degree 0, and there is none.

**Acceptance.**

- For X = Spec A, w^{-1}Perf(X) ≃ D_perf(A) ≃ K^b(proj A).
- The acyclic complex O_X --id--> O_X is a weakly contractible object of Perf(X), isomorphic to 0 in w^{-1}Perf(X).

**Used by.**

- SchemeKTheoryOperations:S.2/k-theory-of-a-scheme: K(X) := K(wPerf(X)) through GeneralAlgebraicKTheory K.4
- SchemeKTheoryOperations:S.1/perfect-frobenius-pair: with degreewise split conflations and the acyclic complexes it is a Frobenius pair for K.6 (Schlichting 5.10)
- SchemeKTheoryOperations:S.3 (K_Z(X)): the subcategory of complexes acyclic off Z gives K(X on Z) (TT 3.1)
- SchemeKTheoryOperations:S.2/cartan-map: Perf(X) ⊂ PsCoh^b(X) on noetherian X gives the Cartan map

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/perfect-triangulated-and-thick`, `S.1/perfect-local-and-invariant`, `S.1/tor-amplitude`; other roadmaps: `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction`; libraries: `mathlib:CochainComplex`, `mathlib:CochainComplex.mappingCone`, `mathlib:HomologicalComplex.quasiIso`.

**Sources.**

- `ThomasonTrobaugh.1990`, Definition 3.1, p. 312: “For X a scheme K(X) is the K-theory spectrum of the complicial biWaldhausen category (1.2.11) of perfect complexes of globally finite Tor-amplitude (2.2.11), in the abelian category of all O_X-modules.” — The Waldhausen category chosen as the model; its cofibrations and weak equivalences follow the default conventions of 1.2.11.
- `ThomasonTrobaugh.1990`, 1.2.11, p. 255: “w(A) is to contain all maps in A which are quasi-isomorphisms in the full category of complexes in 𝒜.” — Weak equivalences of a complicial biWaldhausen category.
- `Kbook.2013`, V.3.8 (PDF p. 400): “We say that C is a localizing subcategory of Ch(M) if the natural map w−1C →w−1Ch(M) = D(M) is an embedding. This will be the case whenever the following condition holds: given any quasi-isomorphism C →B with C in C, there is a quasi-isomorphism B →C′ with C′ in C.” — The criterion showing w^{-1}Perf(X) → D(O_X) is fully faithful.

### Model subcategories of perfect complexes with the same homotopy category

`S.1/perfect-waldhausen-models` · lemma

Let X be a quasi-compact scheme. The inclusions of the following complicial biWaldhausen subcategories into Perf(X) induce equivalences of homotopy categories (TT 3.5): (i) perfect strict bounded complexes; (ii) perfect bounded above complexes of flat O_X-modules; (iii) perfect bounded below complexes of injective, (iv) of flasque O_X-modules. If moreover X has affine diagonal or is noetherian, (v) perfect complexes of quasi-coherent O_X-modules may be added (TT 3.6); if X is noetherian, (vi) perfect bounded complexes of coherent O_X-modules (TT 3.7); and if X is quasi-compact and quasi-separated with the resolution property (for instance with an ample family of line bundles, TT 3.8), (vii) strictly perfect complexes. The same holds for the subcategories of complexes acyclic on X ∖ Z.

**Hypotheses.**

- The strictly perfect model (vii) needs the resolution property; SchemeKTheoryOperations:S.1/doubled-plane-counterexample shows it fails without.
- Only equivalence of homotopy categories is asserted here; the K-theory consequence is SchemeKTheoryOperations:S.2/k-theory-model-invariance.

**Proof.**

1. By TT 1.9.7, for a full inclusion closed under the operations it suffices that every object of the target be quasi-isomorphic to (receive a quasi-isomorphism from, or map quasi-isomorphically to) an object of the source.
2. (ii)–(iv): O_X-Mod has enough flat and enough injective objects and injectives are flasque, so the inductive construction TT 1.9.5 gives quasi-isomorphisms A → B → C with A bounded above flat and C bounded below injective (TT 3.5 proof). (i): a perfect complex of globally finite Tor-amplitude is cohomologically bounded, so good truncations give a strict bounded model.
3. (v): the coherator (SchemeKTheoryOperations:S.1/coherator). (vi): TT 1.9.5 with coherent submodules (TT 3.7). (vii): SchemeKTheoryOperations:S.1/vector-bundle-comparison.

**Acceptance.**

- On Spec A every perfect complex is quasi-isomorphic to a strictly perfect one, so (vii) holds without further hypothesis.
- On the affine plane with doubled origin (vii) fails.

**Depends on.** this roadmap: `S.1/perfect-complicial-waldhausen-category`, `S.1/coherator`, `S.1/vector-bundle-comparison`, `S.1/perfect-objects-quasi-coherent-bounded`; other roadmaps: `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`.

**Sources.**

- `ThomasonTrobaugh.1990`, Lemma 3.5, p. 314: “Then the obvious inclusion functors induce homotopy equivalences of all their K-theory spectra, so all are homotopy equivalent to K(X).” — The statement for the list 3.5.1–3.5.8; the proof establishes equivalences of derived categories (next excerpt).
- `ThomasonTrobaugh.1990`, Proof of Lemma 3.5, p. 314: “The inclusion functors will induce homotopy equivalences in K-theory because they will induce equivalences on the derived categories of the complicial biWaldhausen categories, allowing appeal to 1.9.8.” — The homotopy-category statement this node records.
- `ThomasonTrobaugh.1990`, Lemma 3.8, p. 316: “For X with an ample family of line bundles (2.1.1), Lemma 3.5 remains true if the following categories are added to the list in 3.5 and 3.6.” — The strict perfect model under an ample family; this node uses the more general resolution property through Stacks 0F8I.

### The Frobenius pair of perfect complexes

`S.1/perfect-frobenius-pair` · construction

Let X be a quasi-compact quasi-separated scheme. Declare a sequence in Perf(X) a conflation if it is degreewise split exact. Then Perf(X) is a Frobenius category whose projective-injective objects are the contractible complexes, and with Perf(X)^0 the full subcategory of acyclic complexes, (Perf(X), Perf(X)^0) is a Frobenius pair in the sense of GeneralAlgebraicKTheory K.6 (Schlichting 5.10). Its derived category D(Perf(X), Perf(X)^0) = Stable(Perf(X))/Stable(Perf(X)^0) is isomorphic to w^{-1}Perf(X), hence equivalent to D_perf(O_X). This is the model on which K.6's nonconnective IK-spectrum computes 𝕂(X) (SchemeKTheoryOperations:S.2/nonconnective-k-theory-of-a-scheme).

**Hypotheses.**

- Schlichting states 5.10 for any complicial biWaldhausen category closed under canonical homotopy pushouts and pullbacks with weak equivalences closed under retracts; Perf(X) satisfies these (SchemeKTheoryOperations:S.1/perfect-complicial-waldhausen-category).
- K.6 needs small Frobenius categories. Perf(X), formed from O_X-modules in the universe u of X, is small relative to the next universe, where IK is computed; SchemeKTheoryOperations:S.1/perfect-universe-invariance shows the result does not depend on this choice (TT 1.4, Appendix F).
- The Frobenius structure uses degreewise split conflations, not all short exact sequences of complexes.

**Proof.**

1. Degreewise split exact sequences make Perf(X) an exact category; a contractible complex is projective and injective for it, and every object embeds by a conflation into a contractible one (its cone of the identity) and is a quotient of one (the shifted cone), so Perf(X) is Frobenius (Schlichting 5.10, using TT 1.2.11 and 1.9.6).
2. Perf(X)^0 is closed under extensions, kernels of deflations, cokernels of inflations, direct factors and contains the projective-injectives, so the pair is a Frobenius pair.
3. The stable category is the chain homotopy category of Perf(X); quotienting by acyclic complexes is the localisation at quasi-isomorphisms, giving D(Perf, Perf^0) ≅ w^{-1}Perf(X) ≃ D_perf(O_X).

**API.**

- `perfFrobeniusPair` (data): The Frobenius pair (Perf(X), acyclic perfect complexes) with degreewise split conflations.
- `perfFrobeniusPair.projectiveInjective_iff` (characterisation): An object is projective-injective iff it is a contractible complex.
- `perfFrobeniusPair.derivedEquiv` (equivalence): D(Perf(X), Perf(X)^0) ≃ w^{-1}Perf(X) ≃ D_perf(O_X), triangulated.
- `perfFrobeniusPair.isIdempotentComplete` (structure): Its derived category is idempotent complete.
- `perfFrobeniusPair.map` (functoriality): A complicial exact functor preserving acyclic complexes and degreewise split sequences (e.g. pullback on flat models) induces a map of Frobenius pairs.

**Unit tests.**

- `perfFrobeniusPair_contractible` (characterisation): The cone of the identity of O_X is projective-injective in the Frobenius structure; O_X[0] itself is not (it is not contractible).
- `perfFrobeniusPair_empty` (degenerate): For X = ∅ the pair is (0, 0) and its derived category is zero.
- `perfFrobeniusPair_affine` (compatibility): For X = Spec A the derived category of the pair is equivalent to K^b(proj A), the derived category of K.6's Frobenius pair (Ch^b(proj A), Ac^b(proj A)).
- `perfFrobeniusPair_not_all_ses` (non-example): The short exact sequence of complexes 0 → O --x--> O → (k[x]/(x))~ → 0 in degree 0 on Spec k[x] is not a conflation of the pair (not degreewise split), although its three terms are perfect.

**Acceptance.**

- For X = Spec A this pair has the same derived category as (Ch^b(proj A), Ac^b(proj A)), K.6's pair for the exact category proj A.
- The idempotent completion of its derived category is itself (SchemeKTheoryOperations:S.1/perfect-idempotent-complete).

**Used by.**

- SchemeKTheoryOperations:S.2/nonconnective-k-theory-of-a-scheme: 𝕂(X) := IK of this Frobenius pair (GeneralAlgebraicKTheory K.6)
- SchemeKTheoryOperations:S.3 (nonconnective localisation): the support/open fibre sequence is formed in the nonconnective theory on these models
- Schlichting 7.1: IK_i(X) agrees with Thomason's K^B_i(X) for i ≤ 0

**Depends on.** this roadmap: `S.1/perfect-complicial-waldhausen-category`, `S.1/perfect-idempotent-complete`; other roadmaps: `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`; libraries: `mathlib:HomotopyCategory`.

**Sources.**

- `Schlichting.2003`, 5.10, p. 13: “Declare a sequence in C to be a conflation if it is degree-wise split exact. Then the axioms imposed in [TT90, 1.2.11] and [TT90, 1.9.6] imply that C is a Frobenius category, with projective-injective objects being the contractible chain complexes in C.” — The Frobenius structure.
- `Schlichting.2003`, 5.10, p. 13: “It follows that (C, C0) is a Frobenius pair. Its derived category D(C, C0) is isomorphic to the derived category ω−1C as constructed in [TT90, 1.9.6].” — The pair and its derived category.
- `Schlichting.2003`, 5.10, p. 13: “Let X be a quasi-compact and quasi-seperated scheme, we define IKi(X), i ≤0, to be the negative IK-groups of the Frobenius pair associated with the complicial BiWaldhausen category of [TT90, 3.1].” — The pair is the one built on TT 3.1's Perf(X); 'seperated' is the source's spelling.

### Perfect complexes inside the enhanced derived category

`S.1/perfect-enhanced-subcategory` · construction

Let X be a scheme and D^∞(O_X) the enhanced derived category of EnhancedDerivedSheaves E1: the dg nerve of the K-injective model of complexes of O_X-modules (E0's dg nerve), a stable ∞-category whose homotopy category is Mathlib's D(O_X). D^∞_perf(O_X) is its full sub-∞-category on the perfect objects. It is a stable sub-∞-category closed under retracts (idempotent complete), its homotopy category is D_perf(O_X) with the triangulated structure identified with the pinned one by E0's sign comparison, and for quasi-compact quasi-separated X it is essentially small (SchemeKTheoryOperations:S.1/perfect-essentially-small). Its mapping spaces are the Dold–Kan spaces of the truncated derived Hom complexes RHom(E, F) (E1).

**Hypotheses.**

- The ∞-categorical model is compared with the Waldhausen and Frobenius models only through homotopy categories (SchemeKTheoryOperations:S.1/enhancement-comparison); no comparison of K-theory spectra between the ∞-categorical and Waldhausen constructions is asserted, since GeneralAlgebraicKTheory K.4–K.6 use the Waldhausen and Frobenius models.

**Proof.**

1. Take the full sub-∞-category of E1's enhancement on objects whose image in the homotopy category D(O_X) is perfect.
2. Stability: a full subcategory of a stable ∞-category containing 0 and closed under fibres, cofibres and shifts is stable; closure is SchemeKTheoryOperations:S.1/perfect-triangulated-and-thick transported through E1's identification of the homotopy category and E0's sign comparison (cofibres = mapping cones with signs).
3. Idempotent completeness: retracts in the homotopy category are summands, and D_perf(O_X) is closed under summands (SchemeKTheoryOperations:S.1/perfect-idempotent-complete).

**API.**

- `perfEnhanced` (data): The full sub-∞-category of E1's enhanced derived category on perfect objects.
- `perfEnhanced.isStable` (structure): It is a stable ∞-category and the inclusion is exact.
- `perfEnhanced.isIdempotentComplete` (structure): It is closed under retracts.
- `perfEnhanced.homotopyCategory` (compatibility): Its homotopy category is D_perf(O_X) ⊂ D(O_X), triangulated compatibly with E0's sign comparison.
- `perfEnhanced.mappingSpace` (characterisation): Mapping spaces are Dold–Kan of τ_{≤0}RHom(E, F).
- `perfEnhanced.pullback` (functoriality): E1's enhanced pullback along any f restricts to perfect objects.

**Unit tests.**

- `perfEnhanced_pi0_mapping` (computation): For X = Spec k, π_0 Map(O, O[n]) is k for n = 0 and 0 otherwise.
- `perfEnhanced_empty` (degenerate): For X = ∅ the sub-∞-category is contractible (only zero objects).
- `perfEnhanced_homotopy_eq_Dperf` (compatibility): Its homotopy category, as a full subcategory of Mathlib's DerivedCategory X.Modules, is exactly the perfect objects.
- `perfEnhanced_not_all_compact` (non-example): On Spec k[ε]/(ε²) the residue field is an object of D^∞(O_X) not in D^∞_perf(O_X), although it is bounded with coherent cohomology.

**Acceptance.**

- For X = Spec A its homotopy category is D_perf(A).
- O_X is a compact object of D^∞(O_X) lying in D^∞_perf(O_X).

**Used by.**

- SchemeKTheoryOperations:S.1/enhancement-comparison: compared with the Waldhausen and Frobenius models
- EnhancedDerivedSheaves E1–E3 consumers: the enhanced pullback/pushforward of E1 restrict to perfect objects (SchemeKTheoryOperations:S.1/perfect-derived-pullback)
- GeneralAlgebraicKTheory K.7 (derived Morita invariance): enhanced perfect categories are the inputs of derived Morita invariance

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/perfect-triangulated-and-thick`, `S.1/perfect-idempotent-complete`, `S.1/perfect-essentially-small`; other roadmaps: `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E0/dg-nerve`.

**Sources.**

- `ThomasonTrobaugh.1990`, Introduction, p. 248: “We especially need his concept of a perfect complex, a sheaf of chain complexes that is locally quasi-isomorphic to a bounded complex of algebraic vector bundles.” — The objects singled out in the enhancement are TT's perfect complexes.
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 49.9 (tag 08CS): “If K ⊕L is a perfect object of D(OX), then so are K and L.” — Closure under retracts, which makes the sub-∞-category idempotent complete.

### The Waldhausen, Frobenius and enhanced models of perfect complexes agree

`S.1/enhancement-comparison` · comparison

Let X be a quasi-compact quasi-separated scheme. The three models of perfect complexes have the same triangulated homotopy category: (a) the homotopy category w^{-1}Perf(X) of TT's complicial biWaldhausen category (for GeneralAlgebraicKTheory K.4); (b) the derived category of the Frobenius pair (Perf(X), Perf(X)^0) (for K.6); (c) the homotopy category of E1's D^∞_perf(O_X). Precisely, the functors w^{-1}Perf(X) → D(O_X) (localisation), D(Perf, Perf^0) → w^{-1}Perf(X) (Schlichting 5.10) and Ho(D^∞_perf(O_X)) → D(O_X) (E1) are fully faithful triangulated functors with the same essential image D_perf(O_X), and the resulting equivalences are compatible with shifts and distinguished triangles, the signs being those of E0's comparison of cones.

**Hypotheses.**

- The comparison is between homotopy categories with their triangulated structures; it is not a claim that the ∞-categorical K-theory of D^∞_perf equals Waldhausen K-theory.

**Proof.**

1. (a) → D(O_X): SchemeKTheoryOperations:S.1/perfect-complicial-waldhausen-category.
2. (b) ≅ (a): SchemeKTheoryOperations:S.1/perfect-frobenius-pair.
3. (c) → D(O_X): E1's identification of the homotopy category of the enhancement with the pinned DerivedCategory, restricted to perfect objects (SchemeKTheoryOperations:S.1/perfect-enhanced-subcategory).
4. Triangulated structures: in (a) distinguished triangles come from mapping-cone sequences (TT 1.9.6); in (c) from cofibre sequences, identified with mapping cones with their signs by E0's sign comparison; both map to Mathlib's pretriangulated structure on D(O_X).

**Acceptance.**

- For X = Spec A all three are equivalent to K^b(proj A).
- A cofibration sequence in Perf(X) gives the same distinguished triangle in all three models.

**Depends on.** this roadmap: `S.1/perfect-complicial-waldhausen-category`, `S.1/perfect-frobenius-pair`, `S.1/perfect-enhanced-subcategory`; other roadmaps: `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`; libraries: `mathlib:CategoryTheory.Functor.IsTriangulated`.

**Sources.**

- `ThomasonTrobaugh.1990`, 1.9.6, p. 269: “Let Ho(A) = w^{-1}A be the “derived” or homotopy category formed from A by localizing the category A to make the maps in w(A) isomorphisms in w^{-1}A.” — The homotopy category of the Waldhausen model.
- `Schlichting.2003`, 5.10, p. 13: “It follows that (C, C0) is a Frobenius pair. Its derived category D(C, C0) is isomorphic to the derived category ω−1C as constructed in [TT90, 1.9.6].” — Identification of the Frobenius-pair derived category with the Waldhausen homotopy category.

### Perfect complexes on a quasi-compact quasi-separated scheme form an essentially small category

`S.1/perfect-essentially-small` · theorem

Let X be a quasi-compact quasi-separated scheme whose O_X-modules form a category with morphisms in universe u (X : Scheme.{u}). Then D_perf(O_X) is essentially small in universe u (Mathlib's EssentiallySmall.{u}, equivalently the object property 'perfect' on D(O_X) is ObjectProperty.EssentiallySmall.{u}). The Waldhausen category Perf(X) itself is not essentially small (SchemeKTheoryOperations:S.1/perfect-complicial-waldhausen-category); smallness holds for the homotopy categories.

**Hypotheses.**

- Quasi-compactness and quasi-separatedness are both used: the proof is an induction on the number of affine opens covering X, and needs quasi-compact intersections.
- Hom-sets of D(O_X) are u-small because morphisms are computed against K-injective replacements (EnhancedDerivedSheaves E1).

**Proof.**

1. Affine and quasi-affine case: a quasi-compact open V of an affine scheme has the resolution property (O_V is ample, Stacks 0F87), so by SchemeKTheoryOperations:S.1/vector-bundle-comparison every perfect object of D(O_V) is a bounded complex of finite locally free modules. Isomorphism classes of finite locally free modules on V form a u-small set (glue finite free modules on a finite affine cover along u-small transition data), hence so do bounded complexes of them.
2. Induction: write X = U ∪ V with U affine and V covered by fewer affines; U ∩ V is a quasi-compact open of U, hence quasi-affine. For E ∈ D_perf(O_X) the exact sequence 0 → ℓ_!ℓ*E → j_!j*E ⊕ k_!k*E → E → 0 of TT (2.4.1.10) (j, k, ℓ the inclusions of U, V, U ∩ V, extension by zero exact) exhibits E as the cone of a morphism ℓ_!C → j_!A ⊕ k_!B with A = E|U, B = E|V, C = E|U∩V perfect.
3. By induction A, B, C range, up to isomorphism, over u-small sets of representatives, and the morphisms ℓ_!C → j_!A ⊕ k_!B form a u-small set; a cone is determined up to isomorphism by its morphism. Hence the isomorphism classes of D_perf(O_X) form a u-small set.
4. Equivalently (Stacks 09IS, 0GEF, 09SR): D_QCoh(O_X) has a single perfect generator G, and D_perf(O_X) is the thick closure ⟨G⟩, obtained from G by finitely many shifts, finite sums, cones and summands, which again yields a u-small set of isomorphism classes.

**Acceptance.**

- For X = Spec A, D_perf(A) ≃ K^b(proj A) has a u-small skeleton of bounded complexes of summands of A^n.
- For X = P^1_k, every perfect object is a bounded complex of sums of O(i) (resolution property), a u-small family.

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/vector-bundle-comparison`, `S.1/resolution-property`, `S.1/perfect-local-and-invariant`, `S.1/perfect-triangulated-and-thick`; other roadmaps: `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`; libraries: `mathlib:CategoryTheory.EssentiallySmall`, `mathlib:CategoryTheory.ObjectProperty.EssentiallySmall`, `mathlib:AlgebraicGeometry.QuasiSeparated`.

**Sources.**

- `ThomasonTrobaugh.1990`, Lemma 2.4.1.7, proof, p. 299: “There is a canonical exact sequence of complexes on U ∪ V (2.4.1.10) 0 → ℓ!ℓ*E· → j!j*E· ⊕ k!k*E· → E· → 0” — The Mayer–Vietoris exact sequence driving the induction.
- `ThomasonTrobaugh.1990`, 1.4, p. 259: “We henceforth consider only small Waldhausen categories, those with a set, as opposed to a class of morphisms.” — Why smallness is needed; TT achieve it with universes, which SchemeKTheoryOperations:S.1/perfect-universe-invariance makes harmless.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Theorem 15.3 (tag 09IS): “The category DQCoh(OX) can be generated by a single perfect object.” — The alternative route through a perfect generator.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Remark 17.2 (tag 0GEF): “we see that G is a classical generator for Dperf(OX).” — D_perf is the thick closure of the generator.

### Invariance of perfect complexes under change of universe

`S.1/perfect-universe-invariance` · theorem

Let X be a quasi-compact quasi-separated scheme and U_1 ⊂ U_2 two Grothendieck universes containing X. The change-of-universe functor from the homotopy category of the biWaldhausen category of perfect complexes on X in U_1 to that in U_2 is an equivalence of categories, and likewise for cohomologically bounded pseudo-coherent complexes (TT Appendix F (e), (f)). In Lean terms: for X : Scheme.{u}, lifting complexes of O_X-modules from universe u to max u v induces an equivalence D_perf(O_X) ≃ D_perf(O_X)^{lift}; hence (SchemeKTheoryOperations:S.2/k-theory-model-invariance) K(X), G(X) and the nonconnective 𝕂(X) do not depend on the universe used to form Perf(X).

**Hypotheses.**

- Quasi-compactness and quasi-separatedness are needed for the homotopy-category statements (e), (f); the categories of finitely presented modules, vector bundles and strict perfect complexes are invariant on every scheme (TT App. F (a)–(d)).

**Proof.**

1. The change of universe is an equivalence on finitely presented O_X-modules and on vector bundles, hence on strict perfect and strict pseudo-coherent complexes (TT App. F (a)–(d)).
2. Affine-locally every perfect complex is quasi-isomorphic to a strict perfect one (SchemeKTheoryOperations:S.1/affine-perfect-comparison), so (e) holds on affines; fully faithfulness on homotopy categories holds because Hom in D is computed by the same strict models.
3. For general qcqs X, induct on the number of affines with the Mayer–Vietoris sequence of SchemeKTheoryOperations:S.1/perfect-essentially-small (TT 3.20.4–3.20.6).

**Acceptance.**

- For X = Spec A both sides are K^b(proj A) with proj A the same category in either universe.

**Depends on.** this roadmap: `S.1/perfect-essentially-small`, `S.1/affine-perfect-comparison`, `S.1/perfect-complicial-waldhausen-category`; libraries: `mathlib:CategoryTheory.EssentiallySmall`.

**Sources.**

- `ThomasonTrobaugh.1990`, Appendix F, p. 431: “For X quasi-compact and quasi-separated, we may add to this list (e) the homotopy category of the biWaldhausen category of all perfect complexes on X in the universe;” — Part (e), the statement of this node.
- `ThomasonTrobaugh.1990`, Appendix F, p. 431: “Now 1.9.8 applies to show G(X), K(X), and hence K^B(X) are invariant up to homotopy under change of universe.” — The K-theoretic consequence, recorded in S.2.

### The resolution property

`S.1/resolution-property` · definition · planet “Resolution property”

A scheme X has the resolution property if every quasi-coherent O_X-module of finite type is a quotient of a finite locally free O_X-module (Stacks 0F86). For quasi-compact quasi-separated X it suffices to test finitely presented modules; for noetherian X, coherent modules. It holds when X has an ample invertible module (Stacks 0F87), or more generally an ample family of invertible modules (Stacks 0GMM; TT 2.1.3(b)); for X quasi-compact regular with affine diagonal (Stacks 0F8A), in particular for separated regular noetherian schemes; and it passes along affine and quasi-affine morphisms to a quasi-compact quasi-separated base with the property (Stacks 0F88). It fails on affine n-space with doubled origin for n ≥ 2 (SchemeKTheoryOperations:S.1/doubled-plane-counterexample).

**Hypotheses.**

- The quotient must be by a module that is locally free of finite type, not merely locally free.
- For a qcqs X the property forces affine diagonal (SchemeKTheoryOperations:S.1/resolution-property-affine-diagonal).

**Proof.**

1. Define the property on schemes.
2. Record the sufficient conditions: an ample invertible module or ample family gives finitely many sections of tensor powers generating any finite type module (Stacks 0F87, 0GMM through Properties 27.13); a quasi-compact regular scheme with affine diagonal has an ample family (Divisors 17.8), whence 0F8A; along an f-ample module the property ascends (Stacks 0FDD, 0F88).
3. Record the reduction for qcqs X to finitely presented modules (Properties 23.8).

**API.**

- `HasResolutionProperty` (constructor): Every finite type quasi-coherent O_X-module is a quotient of a finite locally free O_X-module.
- `hasResolutionProperty_iff_finitePresentation` (characterisation): For qcqs X it suffices to test finitely presented modules (Stacks 0F86, Properties 23.8).
- `hasResolutionProperty_of_isAffine` (example): Affine schemes have the resolution property (O_X is ample).
- `hasResolutionProperty_of_ample` (other): An ample invertible module gives the resolution property (Stacks 0F87).
- `hasResolutionProperty_of_ampleFamily` (other): An ample family of invertible modules gives it (Stacks 0GMM; TT 2.1.3).
- `hasResolutionProperty_of_regular_affineDiagonal` (other): A quasi-compact regular scheme with affine diagonal has it (Stacks 0F8A).
- `HasResolutionProperty.of_quasiAffine` (functoriality): It ascends along affine and quasi-affine morphisms to a qcqs base (Stacks 0F88).
- `HasResolutionProperty.affineDiagonal` (projection): For qcqs X it implies affine diagonal (SchemeKTheoryOperations:S.1/resolution-property-affine-diagonal).

**Unit tests.**

- `hasResolutionProperty_projectiveLine` (computation): P^1_k has the resolution property: every coherent sheaf F admits a surjection O(−n)^m → F for n ≫ 0.
- `hasResolutionProperty_spec` (degenerate): Spec A has the resolution property for every ring A, and so does the empty scheme.
- `not_hasResolutionProperty_doubledPlane` (non-example): The affine plane with doubled origin over a field is noetherian, regular and quasi-separated but lacks the resolution property, since its diagonal is not affine (the intersection of the two charts is A^2 ∖ {0}, not affine).
- `hasResolutionProperty_doubledLine` (compatibility): The affine line with doubled origin is regular, quasi-compact with affine diagonal (the charts meet in the affine A^1 ∖ {0}), so it has the resolution property by Stacks 0F8A, although it is not separated.

**Acceptance.**

- Spec A and P^n_A have the resolution property (O and O(1) are ample).
- Affine n-space with doubled origin, n ≥ 2, does not.

**Used by.**

- SchemeKTheoryOperations:S.1/vector-bundle-comparison: the hypothesis under which perfect complexes are bounded complexes of vector bundles
- SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison: the hypothesis for K(Vect X) ≃ K(X)
- KTheoryLowDegrees:Z.5: the K/G comparison on a regular noetherian curve with its global finite resolutions: a separated regular noetherian curve has the property by Stacks 0F8A
- SchemeKTheoryOperations:S.1/perfect-essentially-small: quasi-affine schemes have it, giving the base case of the induction

**Depends on.** libraries: `mathlib:SheafOfModules.IsQuasicoherent`, `mathlib:SheafOfModules.IsFiniteType`, `mathlib:SheafOfModules.IsLocallyFree`, `mathlib:AlgebraicGeometry.Scheme.Modules`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Definition 36.1 (tag 0F86): “We say X has the resolution property if every quasi-coherent OX-module of finite type is the quotient of a finite locally free OX-module.” — The definition.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 36.7 (tag 0GMM): “If X has an ample family of invertible modules (Morphisms, Definition 12.1), then X has the resolution property.” — Ample families.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 36.8 (tag 0F8A): “Let X be a quasi-compact, regular scheme with affine diagonal. Then X has the resolution property.” — The regular case used for arithmetic schemes.

### The resolution property forces affine diagonal

`S.1/resolution-property-affine-diagonal` · theorem

Let X be a quasi-compact quasi-separated scheme with the resolution property. Then the diagonal X → X × X is affine: the intersection of any two affine opens of X is affine (Stacks 0F8C, a special case of Totaro, Proposition 1.3).

**Hypotheses.**

- For non-noetherian X the proof reduces to the noetherian case by absolute noetherian approximation, owned by AdicCoefficientsAndComparisons L2 and requested from it; the descent step Stacks leaves as 'small detail omitted' is written out in the proof below.
- Totaro proves the statement for noetherian algebraic stacks with affine stabilizers at closed points.

**Proof.**

1. Reduce to X noetherian: write X = lim X_i with X_i of finite type over ℤ and affine transition maps (absolute noetherian approximation, Stacks Limits 5.4, TT C.9; requested from AdicCoefficientsAndComparisons L2); by Stacks 0F8B some X_i has the resolution property (finite-presentation descent of the surjections onto the ideals of a finite affine cover, Stacks 0F89). If Δ_{X_i} is affine then so is Δ_X: it factors as X → X ×_{X_i} X (the diagonal of the affine, hence separated, map X → X_i, a closed immersion) followed by X ×_{X_i} X → X × X, the base change of Δ_{X_i}; this supplies the detail Stacks omits.
2. It suffices that each inclusion j : U → X of an affine open is affine, i.e. R^1j_*G = 0 for every quasi-coherent G on U (Cohomology of Schemes 3.4).
3. If R^1j_*G ≠ 0, represent Rj_*G by a complex H• of quasi-coherent modules (SchemeKTheoryOperations:S.1/coherator, noetherian case), choose a coherent F → Ker(H^1 → H^2) hitting a nonzero class and, by the resolution property, a finite locally free E ↠ F; this gives a nonzero map E[−1] → Rj_*G, i.e. a nonzero element of H^1(U, j*E^∨ ⊗ G), contradicting the vanishing of higher cohomology of quasi-coherent modules on the affine U (Stacks 0F8C proof).

**Acceptance.**

- The affine line with doubled origin has affine diagonal; the affine plane with doubled origin does not, hence lacks the resolution property (Totaro, §1).

**Depends on.** this roadmap: `S.1/resolution-property`, `S.1/coherator`; other roadmaps: `SchemeAndStackFoundations:SF.2`, `AdicCoefficientsAndComparisons:L2`; libraries: `mathlib:AlgebraicGeometry.IsAffineHom`, `mathlib:AlgebraicGeometry.QuasiSeparated`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 36.10 (tag 0F8C): “Let X be a quasi-compact and quasi-separated scheme with the resolution property. Then X has affine diagonal.” — The statement.
- `Stacks.perfect.2026`, Derived Categories of Schemes, proof of Lemma 36.10: “this reduces to the case where X is Noetherian (small detail omitted).” — The non-noetherian reduction is only sketched in the source.
- `Totaro.2004`, Proposition 1.3, p. 2: “Let X be a noetherian algebraic stack whose stabilizer groups at closed points of X are affine. If X has the resolution property, then the diagonal morphism X →X ×Z X is affine.” — Totaro's statement, of which Stacks 0F8C is the scheme case.

### Under the resolution property, perfect complexes, maps and homotopies have vector-bundle models

`S.1/resolution-property-strict-representatives` · lemma

Let X be a quasi-compact quasi-separated scheme with the resolution property. (1) If F• is a bounded below complex of quasi-coherent O_X-modules representing a perfect object, there are a bounded complex E• of finite locally free modules and a quasi-isomorphism E• → F• (Stacks 0F8E). (2) Every perfect object of D(O_X) is represented by a bounded complex of finite locally free modules (Stacks 0F8F). (3) For bounded complexes E•, F• of finite locally free modules, every α ∈ Hom_{D(O_X)}(E•, F•) is represented by a roof E• ← G• → F• with G• a bounded complex of finite locally free modules and G• → E• a quasi-isomorphism (Stacks 0F8G). (4) If two maps of complexes α•, β• : E• → F• agree in D(O_X), there is a quasi-isomorphism γ• : G• → E• from a bounded complex of finite locally free modules with α•γ• and β•γ• chain homotopic (Stacks 0F8H).

**Hypotheses.**

- The resolution property is used for global finite locally free surjections; affine diagonal (SchemeKTheoryOperations:S.1/resolution-property-affine-diagonal) is used to represent perfect objects by complexes of quasi-coherent modules.

**Proof.**

1. (1): choose a, b with F• of tor-amplitude in [a, b] and F^n = 0 for n < a; induct on b − a. If b = a, H^b(F•) is finitely presented of tor dimension 0, hence finite locally free. Otherwise lift a finite type submodule of Ker(F^b → F^{b+1}) onto H^b(F•), cover it by a finite locally free E^b using the resolution property, and apply the induction to the cone of E^b[−b] → F•, which has tor-amplitude in [a, b − 1] (Stacks 0F8E).
2. (2): by affine diagonal and the coherator (SchemeKTheoryOperations:S.1/coherator) represent the perfect object by a complex of quasi-coherent modules, bounded because X is quasi-compact (SchemeKTheoryOperations:S.1/perfect-objects-quasi-coherent-bounded); truncate and apply (1) (Stacks 0F8F).
3. (3), (4): represent the roof or homotopy through a complex of quasi-coherent modules (coherator), truncate below, and replace it by a vector-bundle complex using (1) (Stacks 0F8G, 0F8H).

**Acceptance.**

- On P^1_k, the skyscraper at a rational point is represented by O(−1) → O.
- On the affine plane with doubled origin (2) fails.

**Depends on.** this roadmap: `S.1/resolution-property`, `S.1/resolution-property-affine-diagonal`, `S.1/coherator`, `S.1/perfect-objects-quasi-coherent-bounded`, `S.1/tor-amplitude`, `S.1/perfect-complex`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 37.1 (tag 0F8E): “Let F• be a bounded below complex of quasi-coherent OX-modules representing a perfect object of D(OX). Then there exists a bounded complex E• of finite locally free OX-modules and a quasi-isomorphism E• →F•.” — Part (1).
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 37.2 (tag 0F8F): “Then every perfect object of D(OX) can be represented by a bounded complex of finite locally free OX-modules.” — Part (2).
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 37.3 (tag 0F8G): “Then any α ∈HomD(OX)(E•, F•) can be represented by a diagram E• ←G• →F• where G• is a bounded complex of finite locally free OX-modules and where G• →E• is a quasi-isomorphism.” — Part (3).
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 37.4 (tag 0F8H): “Then there exists a quasi-isomorphism γ• : G• →E• where G• is a bounded complex of finite locally free OX-modules such that α• ◦γ• and β• ◦γ• are homotopic maps of complexes.” — Part (4).

### Perfect complexes are bounded complexes of vector bundles under the resolution property

`S.1/vector-bundle-comparison` · theorem · planet “Vector-bundle comparison under the resolution property”

Let X be a quasi-compact quasi-separated scheme with the resolution property, A = Vect(X) the additive category of finite locally free O_X-modules, K^b(A) the homotopy category of bounded complexes in A and S its saturated multiplicative system of quasi-isomorphisms. Then the functor K^b(A) → D_perf(O_X) is exact and induces an equivalence of triangulated categories S^{-1}K^b(A) ≃ D_perf(O_X) (Stacks 0F8I). Consequently the inclusion of strictly perfect complexes into Perf(X) induces an equivalence of homotopy categories (SchemeKTheoryOperations:S.1/perfect-waldhausen-models (vii)). For X with an ample family of line bundles this is TT 2.3.1(d) and 3.8.

**Hypotheses.**

- The resolution property is proved, not assumed by fiat, in every application: Stacks 0F87, 0GMM, 0F8A supply it for ample, ample-family and regular-affine-diagonal schemes.
- Without it the statement is false: SchemeKTheoryOperations:S.1/doubled-plane-counterexample.

**Proof.**

1. The functor is exact: distinguished triangles of K^b(A) are mapping-cone triangles, sent to distinguished triangles; its image lies in D_perf because bounded complexes of finite locally free modules are strictly perfect.
2. S is a saturated multiplicative system compatible with the triangulation (Derived Categories 5.4), so S^{-1}K^b(A) is triangulated and the functor factors (Derived Categories 5.6, 5.7).
3. Essential surjectivity is SchemeKTheoryOperations:S.1/resolution-property-strict-representatives (2); fullness is (3); faithfulness is (4); an exact equivalence of triangulated categories preserves and reflects distinguished triangles (Derived Categories 4.18).

**Acceptance.**

- On P^1_k every perfect complex is quasi-isomorphic to a bounded complex of finite sums of O(i).
- On Spec A the statement reduces to D_perf(A) ≃ K^b(proj A).

**Depends on.** this roadmap: `S.1/resolution-property-strict-representatives`, `S.1/resolution-property`, `S.1/strictly-perfect-complex`, `S.1/perfect-triangulated-and-thick`; libraries: `mathlib:HomotopyCategory`, `mathlib:CategoryTheory.Functor.IsTriangulated`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Proposition 37.5 (tag 0F8I): “is an exact functor of trianglated categories which factors through an equivalence S−1Kb(A) →Dperf(OX) of triangulated categories where S is the saturated multi- plicative system of quasi-isomorphisms in Kb(A).” — The comparison, for qcqs X with the resolution property ('trianglated' is the source's misprint for 'triangulated').
- `ThomasonTrobaugh.1990`, Proposition 2.3.1(d), p. 293: “(d) If F· is any perfect complex of O_X-modules (perhaps not quasi-coherent), then there is a strict perfect complex E· and an isomorphism in the derived category D(O_X-Mod) between E· and F·.” — Thomason–Trobaugh's version for a quasi-compact quasi-separated scheme with an ample family of line bundles.

### On the plane with doubled origin a perfect complex has no vector-bundle model

`S.1/doubled-plane-counterexample` · application

Let k be a field, n ≥ 2 and X = A^n ∪_{A^n ∖ 0} A^n the affine n-space with doubled origin: two charts U′, U″ ≅ A^n_k glued along A^n ∖ {0}, with origins 0′ ∈ U′, 0″ ∈ U″. X is noetherian, regular and quasi-separated but its diagonal is not affine. Let F = k(0′) be the skyscraper at 0′. Then F is a perfect complex on X, but F is not isomorphic in D(O_X) to any bounded complex of finite locally free O_X-modules. Hence the functor S^{-1}K^b(Vect X) → D_perf(O_X) of SchemeKTheoryOperations:S.1/vector-bundle-comparison is not essentially surjective for X, and X lacks the resolution property.

**Hypotheses.**

- n ≥ 2 is essential: for n = 1 the charts meet in the affine A^1 ∖ {0}, the diagonal is affine and the resolution property holds (Totaro §1; Stacks 0F8A).
- The proof uses that restriction j″* : Vect(X) → Vect(U″) is an equivalence of additive categories (TT Exercise 8.6, citing EGA IV 5.9–5.10); this input is recorded as a gap.

**Proof.**

1. F is perfect: on U′ it is the skyscraper at the origin of A^n, resolved by the Koszul complex of (x_1, …, x_n), a strictly perfect complex; on U″ it is zero. Perfectness is local (SchemeKTheoryOperations:S.1/perfect-local-and-invariant).
2. Suppose E• is a bounded complex of finite locally free modules with E• ≅ F in D(O_X). Restricting to U″ = X ∖ {0′} gives E•|U″ ≅ 0, a bounded acyclic complex of finitely generated projective k[x_1, …, x_n]-modules, which is contractible (split exact).
3. Restriction Vect(X) → Vect(U″) is an equivalence of additive categories (gap: vector bundles on the doubled affine space). An additive equivalence reflects contractibility: a contracting homotopy of E•|U″ lifts to one of E•, and the homotopy identity holds on X by faithfulness. So E• is contractible, hence acyclic, and F ≅ 0 in D(O_X).
4. But the stalk of F at 0′ is k ≠ 0; contradiction. The failure of the resolution property follows from SchemeKTheoryOperations:S.1/vector-bundle-comparison, or directly from SchemeKTheoryOperations:S.1/resolution-property-affine-diagonal since U′ ∩ U″ = A^n ∖ {0} is not affine.

**Acceptance.**

- For n = 2, the class of F in K_0(X) is nonzero while its restriction to either chart vanishes; K_0(Vect X) ≅ ℤ but K_0(X) ≅ ℤ ⊕ ℤ (K-book Ex. II.9.10(d); TT Ex. 8.6).
- The skyscraper k(0′) is a perfect complex that no strictly perfect complex resolves globally.

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/strictly-perfect-complex`, `S.1/perfect-local-and-invariant`, `S.1/vector-bundle-comparison`, `S.1/resolution-property-affine-diagonal`; libraries: `mathlib:AlgebraicGeometry.IsAffineHom`, `mathlib:HomotopyCategory`.

**Sources.**

- `ThomasonTrobaugh.1990`, Exercise 8.6, p. 374: “Let X be affine n-space with the origin doubled, the union of two copies of affine n-space A^n glued together on the open A^n − {0}. This X is noetherian.” — The scheme of the counterexample, with n ≥ 2.
- `ThomasonTrobaugh.1990`, Exercise 8.6, hint, p. 374: “(Hint: j : A^n → X induces an isomorphism of the categories of algebraic vector bundles.” — The vector-bundle input, attributed to EGA IV 5.10, 5.9.
- `Totaro.2004`, §1, p. 2: “the smooth non-separated scheme An ∪An−0 An has affine diagonal for n = 1 but not for n ≥2. Thus Proposition 1.3 immediately implies Thomason’s observation that the scheme An ∪An−0 An does not have the resolution property for n ≥2 ([37], Exercise 8.6).” — Failure of the resolution property and the n = 1 contrast.
- `Kbook.2013`, Example II.8.2.4 (PDF p. 155): “Let X be “affine n-space with a double origin” over a field k, where n ≥2.” — The K-book's version, whose K_0 computation is Ex. II.9.10(d).

### Perfect complexes on a limit of schemes with affine transition maps

`S.1/perfect-complexes-on-limits` · lemma

Let S = lim_{i∈I} S_i be the limit of a directed inverse system of quasi-compact quasi-separated schemes with affine transition morphisms f_{i′i} : S_{i′} → S_i, with projections f_i : S → S_i (the projections are affine, Mathlib's isAffineHom_π_app), and fix 0 ∈ I. (1) For E_0 perfect and K_0 ∈ D_QCoh(O_{S_0}), with E_i = Lf*_{i0}E_0, K_i = Lf*_{i0}K_0, E = Lf*_0E_0, K = Lf*_0K_0, the map colim_{i≥0} Hom_{D(O_{S_i})}(E_i, K_i) → Hom_{D(O_S)}(E, K) is bijective (Stacks 09RE). (2) The functors Lf_i* induce an equivalence colim_i D_perf(O_{S_i}) ≃ D_perf(O_S): every perfect E on S is Lf_i*E_i for some i and some perfect E_i (Stacks 09RF; TT 3.20.1). (3) If closed subsets Z_i ⊂ S_i with f_{i′i}^{-1}(Z_i) = Z_{i′}, S_i ∖ Z_i quasi-compact, and Z = f_i^{-1}(Z_i) are given, a perfect E_i whose pullback is acyclic on S ∖ Z is acyclic on S_{i′} ∖ Z_{i′} for some i′ ≥ i, so (2) holds for perfect complexes acyclic off the Z_i (TT 3.20.1).

**Hypotheses.**

- Directed (cofiltered) system with affine transition maps and qcqs terms; this is the situation of absolute noetherian approximation (requested from AdicCoefficientsAndComparisons L2), but the lemma is stated for any such system.
- Lf* is the derived pullback of SchemeKTheoryOperations:S.1/perfect-derived-pullback; the colimit of categories is formed along these functors (after the usual strictification of the pseudofunctor).

**Proof.**

1. Induction on quasi-compact opens U_0 ⊂ S_0 (the induction principle of Cohomology of Schemes 4.1): the condition 'the statement holds over U_0' is stable under U_0 = V_0 ∪ W_0 by the Mayer–Vietoris sequence for Hom in the derived category (TT 2.4.1.8; Stacks Cohomology 33.3) for (1), and by gluing perfect complexes along an isomorphism on the overlap, which exists at a finite level by (1) (Stacks Cohomology 45.1), for (2) (Stacks 09RE, 09RF proofs).
2. Affine case S_0 = Spec A_0, S_i = Spec A_i, S = Spec A with A = colim A_i: by SchemeKTheoryOperations:S.1/affine-derived-equivalence and SchemeKTheoryOperations:S.1/affine-perfect-comparison the statement is about D(A); a perfect E_0 is a finite complex of finite projective, hence finitely presented, modules, so Hom_K(E_0, K_0 ⊗ A_i) → Hom_K(E_0, K_0 ⊗ A) is a colimit (K_0 K-flat), giving (1); a perfect complex over A is a finite complex of finitely presented projective modules with finitely many differentials, all defined over some A_i (More on Algebra 0BC7), giving (2).
3. (3): acyclicity on an affine open V of S ∖ Z of a finite complex of projectives means a contracting homotopy, defined at a finite level; finitely many affines cover the quasi-compact S_i ∖ Z_i (TT 3.20.1 proof). Mathlib's lemmas on limits with affine transition maps (quasi-compact opens and affine covers descend to a finite level) provide the bookkeeping.

**Acceptance.**

- For A = colim A_i, D_perf(A) = colim D_perf(A_i).
- Every perfect complex on a qcqs scheme over a noetherian ring comes from a noetherian approximation (combined with the requested absolute noetherian approximation).

**Depends on.** this roadmap: `S.1/perfect-derived-pullback`, `S.1/affine-derived-equivalence`, `S.1/affine-perfect-comparison`, `S.1/perfect-module-complex`, `S.1/perfect-local-and-invariant`; other roadmaps: `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`; libraries: `mathlib:AlgebraicGeometry.isAffineHom_π_app`, `mathlib:AlgebraicGeometry.Scheme.exists_isOpenCover_and_isAffine`, `mathlib:AlgebraicGeometry.exists_preimage_eq`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 29.3 (tag 09RF): “In Situation 29.1 the category of perfect objects of D(OS) is the colimit of the categories of perfect objects of D(OSi).” — Part (2).
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 29.2 (tag 09RE): “Then the map colimi≥0 HomD(OSi)(Ei, Ki) −→HomD(OS)(E, K) is an isomorphism if either” — Part (1), case E_0 perfect and K_0 ∈ D_QCoh.
- `ThomasonTrobaugh.1990`, Proposition 3.20.1, p. 324: “3.20.1. The derived category of strict perfect (resp., perfect) complexes on X is the direct colimit of the derived categories of strict perfect (resp., perfect) complexes on the X_α, where the maps in the direct system are the Lf*_{αβ}.” — Thomason–Trobaugh's form, with the supports version (3) in the next sentence of 3.20.1.

## S.2 — K, G and maps

*Coverage: partial.* RS-18 narrows S.2: the degree-zero categorical Cartan map is Tau Ceti's (GrothendieckEulerForms layer 4, baseline TauCeti.cartanMap), everything else stays. Targets and nodes: (1) K(X) from perfect complexes — k-theory-of-a-scheme, k-theory-model-invariance, k-zero-of-a-scheme, and the nonconnective 𝕂(X) needed by S.3 — nonconnective-k-theory-of-a-scheme; (2) G(X) from coherent sheaves on noetherian X — g-theory-of-a-scheme, g-theory-models; (3) derived pullback for arbitrary morphisms — derived-pullback-perfect, k-theory-pullback, and g-theory-finite-tor-pullback; (4) proper pushforward on G, and on K for proper perfect morphisms — total-direct-image-qcqs, proper-pushforward-coherent, proper-perfect-pushforward-perfect, g-theory-proper-pushforward, k-theory-proper-pushforward; (5) composition — pushforward-functoriality (pullback composition is part of k-theory-pullback); (6) flat base change — derived-tor-independent-base-change, k-theory-base-change (flat and Tor-independent squares); (7) projection formulas — derived-projection-formula, tensor-product-pairings (constructed here because the projection formula needs them; S.6 builds the ring structure on them, as author D's plan records), projection-formula (all degrees); (8) affine scalar-extension/restriction comparisons — affine-k-theory-comparison, affine-pullback-is-scalar-extension, affine-pushforward-is-transfer (finite flat case for E.5); also vector-bundle-k-theory-comparison under the resolution property (KTheoryLowDegrees Z.5); (9) the Cartan map and its equivalence for regular noetherian schemes — cartan-map, perfect-coherent-on-regular, cartan-equivalence (TT 3.21; finite dimension and separatedness are not needed), compatibility with Tau Ceti's degree-zero map — cartan-degree-zero-compatibility; (10) no singular equivalence by definition — cartan-singular-non-example (Spec k[ε]/(ε²), Cartan = ×2). Added for S.3 and S.5: perfect-iff-compact (Stacks 09M1; its compact-generation companion 09IS is the case T = X of S.3/supported-perfect-generator) and k-theory-continuity (TT 3.20.2 and 7.2, the nonconnective case proved through Schlichting 6.3 so that S.2 does not depend on S.5); absolute noetherian approximation is imported from AdicCoefficientsAndComparisons L2 (request), not planned here. Consumer requests: EllipticKTheory's S.2 request is met item by item (pullback for every morphism: k-theory-pullback; proper pushforward on G and on K for finite Tor-dimension: g-/k-theory-proper-pushforward, pushforward-functoriality; base change for flat and Tor-independent g: k-theory-base-change; projection formula in all degrees: projection-formula; finite flat affine pushforward = module transfer: affine-pushforward-is-transfer; K ≃ G for regular noetherian: cartan-equivalence). KTheoryLowDegrees Z.5/Z.6 receive vector-bundle-k-theory-comparison, cartan-map and cartan-degree-zero-compatibility.

- Remaining: Grothendieck's coherence theorem for proper morphisms over a noetherian base is imported without an owner (gap 'Grothendieck's coherence theorem for proper morphisms'); proper-pushforward-coherent and everything downstream of it (G- and K-pushforward, base change, projection formula, perfect pushforward) rest on it.
- Remaining: Receive from GeneralAlgebraicKTheory K.4 the derived-invariance theorem for complicial biWaldhausen categories (TT 1.9.8, K-book V.3.9 and Ex. V.3.12) and the homotopy invariance of K under natural weak equivalences (TT 1.5.4) (request).
- Remaining: Receive from GeneralAlgebraicKTheory K.7 the homotopy invariance of biexact pairings under natural weak equivalence of biexact functors (request).
- Remaining: Receive from SchemeAndStackFoundations SF.2 the quasi-coherent cohomology inputs of total-direct-image-qcqs and derived-tor-independent-base-change (request).

### The K-theory spectrum of a scheme

`S.2/k-theory-of-a-scheme` · definition · planet “K-theory of a scheme”

K-theory conventions: for a small complicial biWaldhausen category A (small relative to the universe in which spectra are formed, TT 1.4), K(A) is Waldhausen's connective K-theory spectrum of GeneralAlgebraicKTheory K.4 and K_n(A) = π_n K(A) for n ≥ 0; for an exact category E, K(E) is Quillen's (K.1), equivalent to Waldhausen's for E with admissible monomorphisms and isomorphisms (TT 1.11.2), and to K(Ch^b(E)) by Gillet–Waldhausen (K.4). For a scheme X, K(X) := K(Perf(X)) is the K-theory spectrum of the complicial biWaldhausen category Perf(X) of perfect complexes of globally finite Tor-amplitude in the abelian category of all O_X-modules (SchemeKTheoryOperations:S.1/perfect-complicial-waldhausen-category; TT 3.1), and K_n(X) := π_n K(X) for n ≥ 0. For a closed subset Z ⊂ X, K(X on Z) is the K-theory of the subcategory of complexes acyclic on X ∖ Z (TT 3.1; developed in S.3). K^naive(X) := K of the strictly perfect complexes, equivalently Quillen's K-theory of the exact category Vect(X) (TT 3.2, 3.10). The K-book's K(X) := K Ch_perf(X) (K-book V.2.7.3) is the same spectrum for quasi-compact X.

**Hypotheses.**

- No hypothesis on X; for non-quasi-compact X the global Tor-amplitude condition matters (TT 3.1.2).
- K(X) and K^naive(X) are different in general (SchemeKTheoryOperations:S.1/doubled-plane-counterexample); they agree under the resolution property (SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison).

**Proof.**

1. Apply GeneralAlgebraicKTheory K.4's Waldhausen S•-construction and delooping to Perf(X), formed in the universe of X and small relative to the next one (TT 1.4, 1.5.3).
2. Record independence of the choices of model and universe (SchemeKTheoryOperations:S.2/k-theory-model-invariance).
3. Record K_0(X) as the triangulated K_0 of D_perf(O_X) (SchemeKTheoryOperations:S.2/k-zero-of-a-scheme).

**API.**

- `Scheme.K` (data): K(X) := K(Perf(X)), a spectrum; Scheme.K_n X := π_n K(X).
- `Scheme.KOn` (data): K(X on Z) for Z ⊂ X closed, from perfect complexes acyclic on X ∖ Z.
- `Scheme.Knaive` (data): K^naive(X): K-theory of strictly perfect complexes, ≃ Quillen K of Vect(X) (TT 3.10).
- `Scheme.Knaive_to_K` (projection): The map K^naive(X) → K(X) induced by the inclusion.
- `Scheme.K.class` (constructor): For E ∈ Perf(X), its class [E] ∈ K_0(X); [E] = [E′] + [E″] for a cofibration sequence and [E] = [E′] for a quasi-isomorphism (TT 1.5.6).
- `Scheme.K.pullback` (functoriality): f*: K(Y) → K(X) for every morphism f (SchemeKTheoryOperations:S.2/k-theory-pullback).
- `Scheme.K.pushforward` (functoriality): f_*: K(X) → K(Y) for proper perfect f (SchemeKTheoryOperations:S.2/k-theory-proper-pushforward).
- `Scheme.K.affineEquiv` (compatibility): K(Spec A) ≃ K(A) (SchemeKTheoryOperations:S.2/affine-k-theory-comparison).
- `Scheme.K.zero_eq_triangulatedK0` (compatibility): K_0(X) ≅ TriangulatedK0(D_perf(O_X)) (SchemeKTheoryOperations:S.2/k-zero-of-a-scheme).
- `Scheme.K.nonconnective` (other): 𝕂(X) with π_n 𝕂(X) = K_n(X) for n ≥ 0 (SchemeKTheoryOperations:S.2/nonconnective-k-theory-of-a-scheme).

**Unit tests.**

- `K_zero_spec_field` (computation): For a field F, K_0(Spec F) ≅ ℤ, sending the class of a perfect complex E to Σ(−1)^i dim_F H^i(E).
- `K_empty` (degenerate): K(∅) is contractible, so K_n(∅) = 0 for all n ≥ 0.
- `K_zero_spec_eq_ringK0` (compatibility): For a commutative ring A, K_0(Spec A) ≅ KTheoryLowDegrees Z.1's K_0(A), sending [P~] to [P] (Stacks 0FDH).
- `K_ne_Knaive_doubledPlane` (non-example): For the affine plane X with doubled origin over a field, K_0(X) ≇ K_0^naive(X): K^naive(X) ≃ K(k) while K(X) ≃ K(k) × K(k) (TT Ex. 8.6; K-book Ex. II.9.10(d)); the class of the skyscraper at one origin is not in the image of K_0^naive(X).
- `K_zero_class_skyscraper_affineLine` (computation): On Spec k[x], [(k[x]/(x))~] = [O] − [O] = 0 in K_0(Spec k[x]) ≅ ℤ.

**Acceptance.**

- K_0(Spec F) ≅ ℤ for a field F, generated by [O].
- K(∅) is contractible.

**Used by.**

- EllipticKTheory:E.2–E.8: K_0, …, K_3 of an elliptic curve, its function field, residue fields and models come from this functor (E.8/the-completion-criterion item (1))
- SchemeKTheoryOperations:S.3: K(X on Z) → K(X) → K(U) localisation
- SchemeKTheoryOperations:S.6: products and λ/Adams operations act on K_*(X)
- KTheoryLowDegrees:Z.5, Z.6: degree-zero comparisons with vector bundles and the explicit K_0 of curves
- MotivicEtaleKTheory M.4–M.6a: motivic filtrations on K(X)

**Depends on.** this roadmap: `S.1/perfect-complicial-waldhausen-category`, `S.1/perfect-universe-invariance`; other roadmaps: `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction`, `GeneralAlgebraicKTheory:K.4/relative-S-construction-fibration-and-delooping`, `GeneralAlgebraicKTheory:K.4`.

**Sources.**

- `ThomasonTrobaugh.1990`, Definition 3.1, p. 312: “For X a scheme K(X) is the K-theory spectrum of the complicial biWaldhausen category (1.2.11) of perfect complexes of globally finite Tor-amplitude (2.2.11), in the abelian category of all O_X-modules.” — The definition.
- `Kbook.2013`, V.2.7.3 (PDF p. 391): “If X is any scheme, we define K(X) to be KChperf(X).” — The K-book's definition.
- `ThomasonTrobaugh.1990`, Definition 3.2, p. 313: “For X a scheme, K^naive(X) is the K-theory spectrum of the complicial biWaldhausen category of strict perfect complexes in the category of O_X-modules.” — The naive variant, kept distinct from K(X).

### K(X) does not depend on the model of perfect complexes or on the universe

`S.2/k-theory-model-invariance` · lemma

Let X be a quasi-compact scheme. The inclusions of the model subcategories of SchemeKTheoryOperations:S.1/perfect-waldhausen-models into Perf(X) (strict bounded, bounded above flat, bounded below injective or flasque perfect complexes; quasi-coherent ones when X has affine diagonal or is noetherian; coherent ones when X is noetherian; strictly perfect ones under the resolution property) induce homotopy equivalences of K-theory spectra, so all are models of K(X) (TT 3.5–3.8). For qcqs X the change of universe induces a homotopy equivalence (TT Appendix F). The same holds for K(X on Z) and for the pseudo-coherent models of G(X) (TT 3.11).

**Hypotheses.**

- The K-theoretic input is GeneralAlgebraicKTheory K.4's derived invariance for complicial biWaldhausen categories closed under canonical homotopy pushouts and pullbacks (TT 1.9.8; K-book V.3.9), requested from K.4.

**Proof.**

1. Each inclusion is a complicial exact functor between complicial biWaldhausen categories closed under canonical homotopy pushouts and pullbacks (TT 1.3.6), inducing an equivalence of homotopy categories (SchemeKTheoryOperations:S.1/perfect-waldhausen-models).
2. Derived invariance (TT 1.9.8, from Waldhausen's approximation theorem, K.4) gives a homotopy equivalence of K-theory spectra (TT 3.5 proof).
3. Universe: SchemeKTheoryOperations:S.1/perfect-universe-invariance gives an equivalence of homotopy categories; apply TT 1.9.8 again (TT App. F).

**Acceptance.**

- K of perfect strict bounded complexes on Spec A is K(A).
- K(X) computed from flat bounded-above perfect complexes equals K(X), which is what makes pullback functorial (SchemeKTheoryOperations:S.2/k-theory-pullback).

**Depends on.** this roadmap: `S.2/k-theory-of-a-scheme`, `S.1/perfect-waldhausen-models`, `S.1/perfect-universe-invariance`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`, `GeneralAlgebraicKTheory:K.4`.

**Sources.**

- `ThomasonTrobaugh.1990`, Lemma 3.5, p. 314: “Then the obvious inclusion functors induce homotopy equivalences of all their K-theory spectra, so all are homotopy equivalent to K(X).” — The statement for the list 3.5.1–3.5.8, extended in 3.6–3.8.
- `ThomasonTrobaugh.1990`, Theorem 1.9.8, p. 271: “Then F induces a homotopy equivalence of K-theory spectra K(F) : K(A) → K(B).” — The derived invariance used, for a complicial exact functor inducing an equivalence of derived homotopy categories.
- `Kbook.2013`, Theorem V.3.9 (PDF p. 400): “If w−1A ≃> w−1B (i.e., the derived categories of A and B are equivalent), then KA ≃> KB is a homotopy equivalence.” — The K-book's form (Thomason–Trobaugh resolution theorem).

### K_0 of a scheme is the Grothendieck group of its perfect derived category

`S.2/k-zero-of-a-scheme` · comparison

Let X be a quasi-compact quasi-separated scheme. The map sending the class of E ∈ Perf(X) to the class of E in Tau Ceti's TriangulatedK0(D_perf(O_X)) (defined because D_perf(O_X) is essentially small, SchemeKTheoryOperations:S.1/perfect-essentially-small) is an isomorphism K_0(X) ≅ TriangulatedK0(D_perf(O_X)); this is Stacks' definition of K_0(X) (Stacks 0FDG) and SGA 6's K^·(X) (TT 3.1.1). For a strictly perfect complex E•, [E•] = Σ_i (−1)^i [E^i[0]]; for E ∈ D_perf and k ∈ ℤ, [E[k]] = (−1)^k [E].

**Hypotheses.**

- Essential smallness of D_perf(O_X) is needed for TriangulatedK0 to be a small group; this is where qcqs enters.

**Proof.**

1. Waldhausen K_0 of Perf(X) is generated by classes of objects with [A] = [B] for weak equivalences and [B] = [A] + [B/A] for cofibration sequences (TT 1.5.6; K.4).
2. Weak equivalences become isomorphisms and cofibration sequences distinguished triangles in w^{-1}Perf(X) ≃ D_perf(O_X) (TT 1.9.6), so the class map factors through triangulated K_0.
3. Conversely every distinguished triangle of D_perf is isomorphic to the image of a mapping-cone cofibration sequence E → cyl(φ) → cone(φ) in Perf(X) (TT 1.3.4, 1.9.6), and every object and isomorphism of D_perf lifts to Perf(X) up to weak equivalence (calculus of fractions), so the triangle relations hold in Waldhausen K_0: the two maps are inverse.
4. The formula for strictly perfect complexes follows from the stupid-truncation cofibration sequences σ_{≥n}E• → σ_{≥n−1}E• → E^{n−1}[1−n] (Stacks 0FDJ proof).

**Acceptance.**

- K_0(Spec F) ≅ ℤ by the Euler characteristic.
- [O --x--> O] = 0 on Spec k[x].

**Depends on.** this roadmap: `S.2/k-theory-of-a-scheme`, `S.1/perfect-complicial-waldhausen-category`, `S.1/perfect-essentially-small`; other roadmaps: `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction`; libraries: `tauceti:TauCeti.TriangulatedK0`, `tauceti:TauCeti.TriangulatedK0.of`, `tauceti:TauCeti.TriangulatedK0.lift`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Definition 38.2 (tag 0FDG): “We denote K0(X) the Grothendieck group of X. It is the zeroth K-group of the strictly full, saturated, triangulated subcategory Dperf(OX) of D(OX) consisting of perfect objects.” — Stacks' K_0(X), with which π_0 K(X) is identified.
- `ThomasonTrobaugh.1990`, 3.1.1, p. 313: “It is clear from the description of K_0 in 1.5.6. that K_0(X) is indeed the Grothendieck group “K^·(X)” of [SGA 6] IV 2.2.” — Thomason–Trobaugh's identification.

### The nonconnective K-theory spectrum of a scheme

`S.2/nonconnective-k-theory-of-a-scheme` · definition

Let X be a quasi-compact quasi-separated scheme. 𝕂(X) := IK(Perf(X), Perf(X)^0) is GeneralAlgebraicKTheory K.6's nonconnective IK-spectrum of the Frobenius pair of perfect complexes (SchemeKTheoryOperations:S.1/perfect-frobenius-pair; Schlichting 5.10, §11). There is a natural map K(X) → 𝕂(X) inducing isomorphisms π_n K(X) ≅ π_n 𝕂(X) for n ≥ 1 and, because D_perf(O_X) is idempotent complete, for n = 0; for n < 0 the groups 𝕂_n(X) are Thomason's negative K-groups K^B_n(X) (Schlichting 7.1). For X = Spec A they are Bass's negative K-groups of A; for regular noetherian X they vanish (K.6), and negative G-theory of any noetherian scheme vanishes.

**Hypotheses.**

- qcqs is needed for the agreement with Thomason's K^B (Schlichting 7.1).
- Negative groups of singular schemes need not vanish; nothing here infers their vanishing from the connective model.

**Proof.**

1. Form the Frobenius pair (SchemeKTheoryOperations:S.1/perfect-frobenius-pair) and apply K.6's construction: the spaces K(S^n Perf(X)) with the maps K(A) → ΩK(SA) form a spectrum (K.6).
2. Degrees ≥ 1: π_i IK(A) = K_i(A) for i > 0 (K.6); the Waldhausen K-theory of the Frobenius pair is that of Perf(X) with the same weak equivalences (Schlichting 5.10, K.6).
3. Degree 0: π_0 IK = K_0 of the idempotent completion of D(Perf, Perf^0) = D_perf(O_X), which is idempotent complete (SchemeKTheoryOperations:S.1/perfect-idempotent-complete).
4. Negative degrees: agreement with Thomason's K^B (Schlichting 7.1, via the projective line bundle and Bass fundamental theorem arguments of TT; K.6's agreement node) and, for affine X, with Bass's groups.

**API.**

- `Scheme.KB` (data): 𝕂(X) := IK of the Frobenius pair of perfect complexes.
- `Scheme.K_to_KB` (projection): The natural map K(X) → 𝕂(X).
- `Scheme.K_to_KB_iso` (characterisation): π_n K(X) → π_n 𝕂(X) is an isomorphism for n ≥ 0.
- `Scheme.KB_neg_eq_thomason` (compatibility): For n < 0, π_n 𝕂(X) is Thomason's K^B_n(X) (Schlichting 7.1).
- `Scheme.KB_affine` (compatibility): 𝕂(Spec A) has negative homotopy Bass's K_n(A) (K.6).
- `Scheme.KB_neg_eq_zero_of_regular` (example): For regular noetherian X, π_n 𝕂(X) = 0 for n < 0 (K.6 vanishing).

**Unit tests.**

- `KB_zero_spec` (computation): π_0 𝕂(Spec A) ≅ K_0(A) for every commutative ring A.
- `KB_empty` (degenerate): 𝕂(∅) is contractible.
- `KB_neg_regular_zero` (compatibility): π_{−1} 𝕂(Spec ℤ) = 0, matching the vanishing of Bass's K_{−1} for the regular noetherian ring ℤ.
- `KB_neg_node_nonzero` (non-example): For the node A = k[x, y]/(y² − x² − x³) over a field k of characteristic ≠ 2, π_{−1} 𝕂(Spec A) ≅ K_{−1}(A) ≅ ℤ: the Mayer–Vietoris sequence of negative K-theory for the conductor square of A → k[t] (x = t² − 1, y = tx) gives K_{−1}(A) ≅ coker(K_0(k[t]) ⊕ K_0(k) → K_0(k × k)) ≅ ℤ; negative groups need not vanish for singular schemes.

**Acceptance.**

- 𝕂_0(Spec A) = K_0(A).
- 𝕂_{−1} of a regular noetherian ring is 0.

**Used by.**

- SchemeKTheoryOperations:S.3: the localisation fibre sequence K_Z(X) → K(X) → K(U) holds in the nonconnective theory (TT 7.4)
- SchemeKTheoryOperations:S.5: the Bass fundamental theorem for schemes with its Nil terms and negative groups
- GeneralAlgebraicKTheory K.6: the construction applied to the Frobenius pair of perfect complexes

**Depends on.** this roadmap: `S.1/perfect-frobenius-pair`, `S.1/perfect-idempotent-complete`, `S.2/k-theory-of-a-scheme`; other roadmaps: `GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K`.

**Sources.**

- `Schlichting.2003`, 5.10, p. 13: “Let X be a quasi-compact and quasi-seperated scheme, we define IKi(X), i ≤0, to be the negative IK-groups of the Frobenius pair associated with the complicial BiWaldhausen category of [TT90, 3.1].” — The Frobenius-pair model of the nonconnective theory of X.
- `Schlichting.2003`, Theorem 7.1, p. 14: “Let X be a quasi-compact and quasi-separated scheme, then there are natural isomorphisms between Thomason’s groups KB i (X) and the groups IKi(X) defined in 5.10 for i ≤0.” — Agreement with Thomason's negative K-groups.

### The G-theory of a noetherian scheme

`S.2/g-theory-of-a-scheme` · definition · planet “G-theory of a noetherian scheme”

Let X be a noetherian scheme and Coh(X) the abelian category of coherent O_X-modules (on a locally noetherian scheme these are Tau Ceti's finitely presented sheaves, FinitelyPresentedSheaf X). G(X) := K(Coh(X)) is Quillen's K-theory of this abelian (hence exact) category (GeneralAlgebraicKTheory K.1), and G_n(X) := π_n G(X) (K-book IV.6.3.4). Equivalently G(X) is the Waldhausen K-theory of the complicial biWaldhausen category PsCoh^b(X) of pseudo-coherent complexes of O_X-modules with globally bounded cohomology (TT 3.3, 3.13; SchemeKTheoryOperations:S.2/g-theory-models); for X not noetherian TT and the K-book take this as the definition (K-book V.3.10.3).

**Hypotheses.**

- Noetherian: then coherent = finitely presented and Coh(X) is abelian; G of a non-noetherian scheme is not used by this layer's consumers.

**Proof.**

1. Coh(X) is an abelian full subcategory of X.Modules closed under kernels, cokernels and extensions (X noetherian), essentially small; give it the abelian exact structure and apply K.1.
2. Record the Waldhausen model and its equivalence with Quillen's G (SchemeKTheoryOperations:S.2/g-theory-models).

**API.**

- `Scheme.G` (data): G(X) := K(Coh(X)) for noetherian X; Scheme.G_n X := π_n G(X).
- `Scheme.G.class` (constructor): The class [F] ∈ G_0(X) of a coherent sheaf, additive on short exact sequences.
- `Scheme.G.equivPsCoh` (equivalence): G(X) ≃ K(PsCoh^b(X)) ≃ K(Ch^b Coh X) (SchemeKTheoryOperations:S.2/g-theory-models).
- `Scheme.G.pushforward` (functoriality): f_*: G(X) → G(Y) for proper f (SchemeKTheoryOperations:S.2/g-theory-proper-pushforward).
- `Scheme.G.pullback` (functoriality): f*: G(Y) → G(X) for f of finite Tor-dimension (SchemeKTheoryOperations:S.2/g-theory-finite-tor-pullback).
- `Scheme.G.affineEquiv` (compatibility): G(Spec R) ≃ G(R) := K(mod R) for R noetherian (SchemeKTheoryOperations:S.2/affine-k-theory-comparison).
- `Scheme.G.zero_eq_exactK0` (compatibility): G_0(X) ≅ Tau Ceti's ExactK0 of Coh(X) with its abelian exact structure (K.1's identification of π_1 BQ with ExactK0).

**Unit tests.**

- `G_zero_spec_field` (computation): G_0(Spec F) ≅ ℤ, [M] ↦ dim_F M.
- `G_empty` (degenerate): G(∅) is contractible.
- `G_zero_spec_eq_tauceti` (compatibility): For a noetherian ring R, G_0(Spec R) ≅ ExactK0(TauCeti.finiteModulesExactStructure R), [M~] ↦ [M].
- `G_zero_dualNumbers` (computation): G_0(Spec k[ε]/(ε²)) ≅ ℤ generated by [k], with [O] = 2[k] (from 0 → k --ε--> k[ε]/(ε²) → k → 0).
- `G_ne_K_dualNumbers_map` (non-example): For X = Spec k[ε]/(ε²), K_0(X) and G_0(X) are both ≅ ℤ, but they are not identified by the Cartan map, which is multiplication by 2 (SchemeKTheoryOperations:S.2/cartan-singular-non-example); G is not K on singular schemes.

**Acceptance.**

- G_0(Spec F) ≅ ℤ for a field F.
- G(Spec k[ε]/(ε²)) ≃ G(Spec k) by dévissage, so G_0 ≅ ℤ generated by [k].

**Used by.**

- SchemeKTheoryOperations:S.2/cartan-map: target of K(X) → G(X)
- SchemeKTheoryOperations:S.3 (G-theory localisation and dévissage): G(Z) → G(X) → G(X ∖ Z) for Z closed, dévissage for non-regular closed subschemes
- EllipticKTheory:E.2, E.6: G-theory of curves and of possibly non-regular models (E.6's warning that G-theory fails model independence)
- SchemeKTheoryOperations:S.2/projection-formula: G_*(X) is a K_*(X)-module and f_* on G is K_*(Y)-linear

**Depends on.** other roadmaps: `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`; libraries: `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, `mathlib:SheafOfModules.IsFinitePresentation`, `mathlib:AlgebraicGeometry.IsNoetherian`.

**Sources.**

- `Kbook.2013`, Definition IV.6.3.4 (PDF p. 328): “If X is noetherian, we define G(X) = KM(X) and Gn(X) = KnM(X).” — The definition, M(X) being the coherent O_X-modules.
- `ThomasonTrobaugh.1990`, Definition 3.3, p. 313: “For X a scheme, G(X) is the K-theory spectrum of the complicial biWaldhausen category of all pseudo-coherent complexes with globally bounded cohomology in the abelian category of all O_X-modules.” — The complicial model, equivalent to Quillen's for noetherian X (TT 3.13).

### Models of G-theory: bounded complexes of coherent sheaves and pseudo-coherent complexes

`S.2/g-theory-models` · lemma

Let X be a noetherian scheme. The exact inclusions Coh(X) → Ch^b(Coh(X)) → PsCoh^b(X) (bounded complexes of coherent sheaves; cohomologically bounded pseudo-coherent complexes of O_X-modules) induce homotopy equivalences G(X) = K(Coh X) ≃ K(Ch^b Coh X) ≃ K(PsCoh^b(X)) (TT 3.11–3.13; K-book V.3.10.2). Also the flasque model (cohomologically bounded pseudo-coherent complexes of flasque O_X-modules, TT 3.11.5) and the bounded-above flat model (TT 3.11.3) have K-theory G(X). For Z ⊂ X closed, the same holds for complexes acyclic on X ∖ Z.

**Hypotheses.**

- Noetherian is used to identify pseudo-coherent complexes with D^−_Coh (TT 2.2.8; Stacks 08E8) and for D^b(Coh) ≃ D^b_Coh (Stacks 0FDB).

**Proof.**

1. Gillet–Waldhausen: K(Coh X) ≃ K(Ch^b Coh X) (GeneralAlgebraicKTheory K.4; TT 1.11.7), Coh(X) being abelian.
2. Ch^b Coh X → PsCoh^b(X) induces an equivalence of homotopy categories: pseudo-coherent with bounded cohomology on noetherian X means bounded with coherent cohomology (SchemeKTheoryOperations:S.1/pseudo-coherent-complex), and D^b(Coh X) ≃ D^b_Coh(O_X) (SchemeKTheoryOperations:S.1/coherator (2)).
3. Flasque and flat models: every object admits a quasi-isomorphism to a bounded-below flasque (injective) complex and from a bounded-above flat one (TT 1.9.5); apply derived invariance (TT 1.9.8, K.4).

**Acceptance.**

- G(Spec R) ≃ K Ch^b M(R) ≃ K Ch^hb_pcoh(R) for R noetherian (K-book V.3.10.1).

**Depends on.** this roadmap: `S.2/g-theory-of-a-scheme`, `S.1/pseudo-coherent-complex`, `S.1/coherator`, `S.2/k-theory-model-invariance`; other roadmaps: `GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`, `GeneralAlgebraicKTheory:K.4`.

**Sources.**

- `ThomasonTrobaugh.1990`, Corollary 3.13, p. 317: “For X a noetherian scheme, G(X) is naturally homotopy equivalent to the Quillen G- or K′-spectrum of X defined in [Q1].” — The comparison of the complicial model with Quillen's G.
- `Kbook.2013`, Example V.3.10.2 (PDF p. 402): “G(X) ≃KChbM(X) ≃KChhb pcoh(X).” — The K-book's form for noetherian X.

### Derived pullback of perfect complexes as a complicial exact functor

`S.2/derived-pullback-perfect` · construction

Let f : X → Y be an arbitrary morphism of schemes. On the model Perf^flat(Y) of perfect bounded above complexes of flat O_Y-modules (SchemeKTheoryOperations:S.1/perfect-waldhausen-models (ii)), the degreewise pullback f* is a complicial exact functor Perf^flat(Y) → Perf^flat(X) representing Lf* (TT 3.14); it preserves cofibrations (degreewise split monomorphisms), quasi-isomorphisms (flat complexes are deployed for f*) and pushouts along cofibrations. It induces Lf* : D_perf(O_Y) → D_perf(O_X) (SchemeKTheoryOperations:S.1/perfect-derived-pullback). For g : Y → Z there is a natural isomorphism f*∘g* ≅ (g∘f)* on flat complexes (Mathlib's pullbackComp), and these isomorphisms satisfy the pseudofunctor coherences (Mathlib's Scheme.Modules.pseudofunctor). The same functor restricts to strictly perfect complexes and to complexes acyclic off closed subsets: f* maps Perf_Z(Y) into Perf_{f^{-1}Z}(X).

**Hypotheses.**

- No hypothesis on f.
- The strict functoriality of K-theory needs a rectification of the pseudofunctor f ↦ f*; TT 3.14 and 3.16.1 note that the usual rectification is available.

**Proof.**

1. f* is additive and exact on flat modules, preserves flatness and bounded-aboveness, and sends perfect to perfect (SchemeKTheoryOperations:S.1/perfect-derived-pullback); a quasi-isomorphism between bounded above flat complexes has a bounded above flat acyclic cone, which f* keeps acyclic.
2. It is induced degreewise by an additive functor, so it is complicial exact (TT 1.2.16, 1.9.2.1).
3. Pseudofunctoriality is inherited from the underived pullback on sheaves of modules (Mathlib's pullbackComp and pseudofunctor).

**API.**

- `perfPullback` (data): f* : Perf^flat(Y) → Perf^flat(X), degreewise pullback.
- `perfPullback.isComplicialExact` (structure): It is a complicial exact functor (preserves cofibrations, weak equivalences, pushouts along cofibrations).
- `perfPullback.represents` (compatibility): It represents Lf* : D_perf(O_Y) → D_perf(O_X).
- `perfPullback.comp` (functoriality): f*∘g* ≅ (g∘f)* naturally, with pseudofunctor coherence.
- `perfPullback.id` (functoriality): id* ≅ id.
- `perfPullback.supports` (functoriality): f* maps complexes acyclic off Z to complexes acyclic off f^{-1}(Z).
- `perfPullback.strict` (compatibility): On strictly perfect complexes it is the degreewise pullback of vector bundles.

**Unit tests.**

- `perfPullback_open` (compatibility): For an open immersion j : U → X, j* on Perf^flat(X) is Mathlib's restriction functor Scheme.Modules.restrictFunctor applied degreewise.
- `perfPullback_point` (computation): For the origin ι : Spec k → Spec k[x], ι* of the flat resolution O --x--> O of (k[x]/(x))~ is k --0--> k, with cohomology k in degrees −1 and 0.
- `perfPullback_id` (degenerate): For f = id_X the functor is naturally isomorphic to the identity of Perf^flat(X).
- `perfPullback_not_underived` (non-example): The underived pullback of the non-flat perfect complex (k[x]/(x))~ along ι is k in degree 0, which differs from Lι* = k ⊕ k[1]: the degreewise pullback computes Lf* only on flat models.

**Acceptance.**

- For an open immersion, f* is restriction.
- For Spec B → Spec A it is − ⊗_A B on flat complexes (SchemeKTheoryOperations:S.1/affine-derived-equivalence).

**Used by.**

- SchemeKTheoryOperations:S.2/k-theory-pullback: induces f* on K
- SchemeKTheoryOperations:S.3 (restriction to the open complement): K(X) → K(U) is induced by restriction, an instance
- EllipticKTheory:E.3, E.5, E.6: pullback along generic fibres, finite maps and open immersions

**Depends on.** this roadmap: `S.1/perfect-waldhausen-models`, `S.1/perfect-derived-pullback`, `S.1/strictly-perfect-closure`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackComp`, `mathlib:AlgebraicGeometry.Scheme.Modules.pseudofunctor`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.14, pp. 317–318: “K(X) and K^naive(X) are contravariant functors in the scheme X, as a map of schemes f : X → X′ induces a complicial exact (1.2.16) functor Lf* = f* between the biWaldhausen categories of perfect bounded above complexes of flat modules (3.5.3), or those of strict perfect complexes.” — The construction.

### Pullback on K-theory of schemes

`S.2/k-theory-pullback` · construction

For every morphism of schemes f : X → Y, the complicial exact functor f* of SchemeKTheoryOperations:S.2/derived-pullback-perfect induces f* : K(Y) → K(X) (and K(Y on Z) → K(X on f^{-1}Z), and on K^naive), using that flat bounded-above perfect complexes compute K (SchemeKTheoryOperations:S.2/k-theory-model-invariance). Naturally isomorphic exact functors induce homotopic maps (TT 1.5.4), so (g∘f)* ≃ f*∘g* and id* ≃ id: K is a contravariant functor from schemes to the homotopy category of spectra, and a strict functor after the rectification of TT 3.14. On K_0, f*[E] = [Lf*E].

**Hypotheses.**

- No hypothesis on f.
- Pullback on G-theory needs finite Tor-dimension (SchemeKTheoryOperations:S.2/g-theory-finite-tor-pullback).

**Proof.**

1. Apply K (K.4) to the exact functor f* on the flat model and compose with the model equivalences K(Perf^flat) ≃ K(Perf).
2. Composition and identity: the natural isomorphisms of SchemeKTheoryOperations:S.2/derived-pullback-perfect give homotopies by TT 1.5.4 (a natural weak equivalence of exact functors induces a homotopy of maps of spectra, K.4).

**API.**

- `Scheme.K.pullback` (data): f* : K(Y) → K(X) for every morphism f : X → Y.
- `Scheme.K.pullback_comp` (functoriality): (g∘f)* ≃ f*∘g* (homotopy of spectrum maps; equality on K_n).
- `Scheme.K.pullback_id` (functoriality): id* ≃ id.
- `Scheme.K.pullback_class` (simp): On K_0, f*[E] = [Lf*E]; for a vector bundle V, f*[V] = [f*V].
- `Scheme.K.pullback_supports` (functoriality): f*: K(Y on Z) → K(X on f^{-1}Z) compatibly with K(Y on Z) → K(Y).
- `Scheme.K.pullback_affine` (compatibility): For Spec B → Spec A it is scalar extension K(A) → K(B) (SchemeKTheoryOperations:S.2/affine-pullback-is-scalar-extension).
- `Scheme.Knaive.pullback` (functoriality): The same on K^naive, compatibly with K^naive → K.

**Unit tests.**

- `K_pullback_class_O` (computation): f*[O_Y] = [O_X] in K_0(X) for every f : X → Y.
- `K_pullback_id` (degenerate): id_X^* acts as the identity on K_n(X) for every n.
- `K_pullback_affine_eq_ringK0Map` (compatibility): For a ring map A → B, the induced K_0(Spec A) → K_0(Spec B) is KTheoryLowDegrees Z.1's ring-k0-map under the identifications with ring K_0.
- `K_pullback_point_skyscraper` (computation): For ι : Spec k → Spec k[x] the origin, ι*[(k[x]/(x))~] = [k] − [k] = 0 in K_0(Spec k) = ℤ, consistently with [(k[x]/(x))~] = 0 in K_0(Spec k[x]).
- `K_pullback_not_G` (non-example): For the closed immersion ι : Spec k → Spec k[ε]/(ε²), ι* is defined on K but ι has infinite Tor-dimension, so no pullback G_0(Spec k[ε]/(ε²)) → G_0(Spec k) with ι*[k] = [Lι*k] exists: Lι*k has infinitely many nonzero cohomology groups.

**Acceptance.**

- f* : K(Spec A) → K(Spec B) is the map induced by −⊗_A B (SchemeKTheoryOperations:S.2/affine-pullback-is-scalar-extension).
- For the zero section of A^1_X → X, the pullback composed with the projection's pullback is homotopic to the identity.

**Used by.**

- EllipticKTheory:E.3/naturality-of-the-sequence, E.6/the-integral-part: restriction to opens and to the generic fibre j*: K(𝓔) → K(E)
- EllipticKTheory:E.4/rational-base-point-splitting: P*: K_1(X) → K_1(F) and π*
- SchemeKTheoryOperations:S.3: the restriction K(X) → K(U) in the localisation sequence
- SchemeKTheoryOperations:S.6: λ- and Adams operations commute with f*

**Depends on.** this roadmap: `S.2/derived-pullback-perfect`, `S.2/k-theory-of-a-scheme`, `S.2/k-theory-model-invariance`; other roadmaps: `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction`, `GeneralAlgebraicKTheory:K.4`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.14, pp. 317–318: “K(X) and K^naive(X) are contravariant functors in the scheme X, as a map of schemes f : X → X′ induces a complicial exact (1.2.16) functor Lf* = f* between the biWaldhausen categories of perfect bounded above complexes of flat modules (3.5.3), or those of strict perfect complexes.” — Contravariant functoriality of K.
- `ThomasonTrobaugh.1990`, 1.5.4, pp. 260–261: “If η : F → G is a natural transformation of exact functors A → B, and if for all objects A in A, η_A : FA → GA is in w(B), then η induces a homotopy wS.F ≃ wS.G, and in fact a homotopy of maps of spectra KF ≃ KG.” — Why composition holds up to homotopy.

### Pullback on G-theory along morphisms of finite Tor-dimension

`S.2/g-theory-finite-tor-pullback` · construction

Let f : X → Y be a morphism of noetherian schemes of finite Tor-dimension (O_X has finite tor dimension over f^{-1}O_Y); for instance f flat, or a regular closed immersion, or any morphism to a regular noetherian scheme of finite Krull dimension. Then Lf* preserves cohomologically bounded pseudo-coherent complexes and is a complicial exact functor on the flat models of SchemeKTheoryOperations:S.2/g-theory-models, inducing f* : G(Y) → G(X) with (g∘f)* ≃ f*∘g* (TT 3.14.1; K-book V.3.6). For flat f it is induced by the exact functor f* : Coh(Y) → Coh(X). On G_0, f*[F] = Σ_i (−1)^i [L_i f* F] (a finite sum).

**Hypotheses.**

- Finite Tor-dimension is essential: for the closed point of Spec k[ε]/(ε²) the derived pullback of the residue field is unbounded.

**Proof.**

1. For f of finite Tor-dimension, Lf* of a cohomologically bounded complex is cohomologically bounded, and Lf* preserves pseudo-coherence (TT 2.5.1; SchemeKTheoryOperations:S.1/pseudo-coherent-complex).
2. So f* is a complicial exact functor between the models of cohomologically bounded pseudo-coherent complexes of flat modules (TT 3.11.3, 3.14.1); apply K (K.4) and the models lemma.
3. For f flat, f* is exact on coherent sheaves and the resulting map agrees with Quillen's (K-book V.3.6).

**API.**

- `Scheme.G.pullback` (data): f* : G(Y) → G(X) for f of finite Tor-dimension between noetherian schemes.
- `Scheme.G.pullback_comp` (functoriality): (g∘f)* ≃ f*∘g*.
- `Scheme.G.pullback_flat_class` (simp): For f flat and F coherent, f*[F] = [f*F].
- `Scheme.G.pullback_class` (simp): f*[F] = Σ(−1)^i [L_if*F] in G_0(X).
- `Scheme.G.pullback_cartan` (compatibility): Commutes with the Cartan map: c_X∘f* ≃ f*∘c_Y (SchemeKTheoryOperations:S.2/cartan-map).

**Unit tests.**

- `G_pullback_open_class` (computation): For the open immersion D(x) → Spec k[x], the restriction of [(k[x]/(x))~] is 0 in G_0(Spec k[x, x^{-1}]).
- `G_pullback_id` (degenerate): id* is the identity of G(X).
- `G_pullback_flat_eq_quillen` (compatibility): For f flat the map equals the one induced by the exact functor f* : Coh(Y) → Coh(X) on Quillen K-theory.
- `not_G_pullback_dualNumbers_point` (non-example): For ι : Spec k → Spec k[ε]/(ε²), which has infinite Tor-dimension, the formula Σ(−1)^i [L_iι*k] is an infinite sum (L_iι*k ≅ k for all i ≥ 0), so no G-pullback along ι is defined.

**Acceptance.**

- For an open immersion j : U → X, j* : G(X) → G(U) is restriction of coherent sheaves.
- For A^1_X → X, the pullback is induced by F ↦ F[t].

**Used by.**

- SchemeKTheoryOperations:S.3: G(X) → G(U) for U open, in the G-theory localisation sequence
- SchemeKTheoryOperations:S.2/k-theory-base-change: g* on G in base-change squares
- SchemeKTheoryOperations:S.5 (homotopy invariance): G(X) → G(X × A^1) along the flat projection

**Depends on.** this roadmap: `S.2/g-theory-of-a-scheme`, `S.2/g-theory-models`, `S.1/pseudo-coherent-complex`, `S.1/tor-amplitude`; other roadmaps: `GeneralAlgebraicKTheory:K.4`; libraries: `mathlib:AlgebraicGeometry.Flat`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.14.1, p. 318: “If f : X → X′ is a map of globally finite Tor-dimension, then Lf*E· is cohomologically bounded if E· is.” — The key finiteness; the rest of 3.14.1 draws the conclusion f* : G(X′) → G(X).
- `Kbook.2013`, Base change maps for G∗(X) V.3.6 (PDF p. 397): “If f : X →Y is a morphism of noetherian schemes such that OX has finite flat dimension over f −1OY , there is also a contravariant map f ∗from G(Y ) to G(X).” — The K-book's statement.

### Total direct image along quasi-compact quasi-separated morphisms

`S.2/total-direct-image-qcqs` · lemma

Let f : X → Y be a quasi-compact quasi-separated morphism of schemes and Rf_* : D(O_X) → D(O_Y) the derived direct image of EnhancedDerivedSheaves E1. (1) Rf_* maps D_QCoh(O_X) into D_QCoh(O_Y) (Stacks 08D5). (2) If Y is quasi-compact there is N = N(X, Y, f) with H^m(Rf_*E) = 0 for m ≥ N whenever E ∈ D_QCoh(O_X) has H^m(E) = 0 for m > 0, and N works after any base change (Stacks 08D5); in particular Rf_* has finite cohomological amplitude on D_QCoh and preserves cohomological boundedness (TT B.11). (3) Rf_* : D_QCoh(O_X) → D_QCoh(O_Y) commutes with direct sums (Stacks 08DZ). (4) If f is affine, f_* applied to a complex of quasi-coherent modules computes Rf_* (Stacks 0G9R).

**Hypotheses.**

- The underlying vanishing R^pf_*F = 0 for p ≥ N and F quasi-coherent (Cohomology of Schemes 4.5), and the commutation of H^p with direct sums of quasi-coherent sheaves (Cohomology of Schemes 6.1), are scheme-cohomology inputs requested from SchemeAndStackFoundations SF.2.

**Proof.**

1. For bounded below E use the spectral sequence R^pf_*H^q(E) ⇒ R^{p+q}f_*E with quasi-coherent terms vanishing for p ≥ N (Stacks 08D5 proof).
2. For general E combine the bound (2), proved with Stacks 08D4 on affine opens of Y, with the triangles τ_{≤−n−1}E → E → τ_{≥−n}E.
3. Direct sums: reduce to bounded below complexes with the bound N and then to quasi-coherent sheaves (Stacks 08DZ). Affine f: quasi-coherent modules are f_*-acyclic (Stacks 0G9N, 0G9R).

**Acceptance.**

- For f : Spec B → Spec A, Rf_* is restriction of scalars and N = 1.
- For f : P^n_A → Spec A, N = n + 1.

**Depends on.** this roadmap: `S.1/affine-derived-equivalence`; other roadmaps: `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `SchemeAndStackFoundations:SF.2`; libraries: `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.QuasiSeparated`, `mathlib:AlgebraicGeometry.IsAffineHom`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 4.1(1) (tag 08D5): “The functor Rf∗sends DQCoh(OX) into DQCoh(OS).” — Part (1).
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 4.1(2) (tag 08D5): “If S is quasi-compact, there exists an integer N = N(X, S, f) such that for an object E of DQCoh(OX) with Hm(E) = 0 for m > 0 we have Hm(Rf∗E) = 0 for m ≥N.” — Part (2).
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 4.5 (tag 08DZ): “Then Rf∗: DQCoh(OX) →DQCoh(OS) commutes with direct sums.” — Part (3).

### Proper direct image preserves bounded complexes with coherent cohomology

`S.2/proper-pushforward-coherent` · lemma

Let f : X → Y be a proper morphism of schemes with Y noetherian (more generally, f locally of finite type with Y noetherian and E with proper support). Then Rf_* maps D^b_Coh(O_X) into D^b_Coh(O_Y) (Stacks 08E2); equivalently Rf_* preserves cohomologically bounded pseudo-coherent complexes (TT 2.5.4, pseudo-coherent case). On G_0 this gives the class Σ_i (−1)^i [R^if_*F] of a coherent sheaf F (Stacks 0FDL).

**Hypotheses.**

- The coherence of R^if_*F for F coherent and f proper over a noetherian base (Grothendieck's coherence theorem, EGA III 3.2.1; Cohomology of Schemes 19.1, 26.10) is imported, not proved here: it is the gap 'Grothendieck's coherence theorem for proper morphisms'.
- Boundedness uses SchemeKTheoryOperations:S.2/total-direct-image-qcqs (2).

**Proof.**

1. The spectral sequence R^pf_*H^q(E) ⇒ R^{p+q}f_*E has coherent terms by the coherence theorem (gap) and finitely many nonzero columns by the bound N, so R^nf_*E is coherent and vanishes for |n| ≫ 0 (Stacks 08E2 proof).
2. On a noetherian scheme bounded complexes with coherent cohomology are exactly the cohomologically bounded pseudo-coherent complexes (SchemeKTheoryOperations:S.1/pseudo-coherent-complex).

**Acceptance.**

- For f : P^1_k → Spec k, Rf_*O = k[0] and Rf_*O(−2) = k[−1].
- For a closed immersion Rf_* is exact and preserves coherence trivially.

**Depends on.** this roadmap: `S.2/total-direct-image-qcqs`, `S.1/pseudo-coherent-complex`; other roadmaps: `SchemeAndStackFoundations:SF.2`; libraries: `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsNoetherian`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 11.3 (tag 08E2): “Let E be an object of Db Coh(OX) such that the support of Hi(E) is proper over S for all i. Then Rf∗E is an object of Db Coh(OS).” — The statement (S noetherian, f locally of finite type).
- `Stacks.perfect.2026`, Derived Categories of Schemes, Remark 38.7 (tag 0FDL): “This is well defined because the sheaves Rif∗F are coherent (Cohomology of Schemes, Proposition 19.1), because locally only a finite number are nonzero” — The coherence input and the G_0 formula.

### Proper perfect direct image preserves perfect complexes

`S.2/proper-perfect-pushforward-perfect` · lemma

Let f : X → Y be a proper morphism of schemes with Y noetherian (or f projective), and suppose f is perfect: pseudo-coherent (automatic over a noetherian base) and of locally finite Tor-dimension, i.e. O_X has locally finite tor dimension over f^{-1}O_Y. Then Rf_* maps perfect complexes on X to perfect complexes on Y (TT 2.5.4; SGA 6 III 4.8.1). In particular this holds for f flat and proper over a noetherian base (Stacks 0B6F), for regular closed immersions, and for proper morphisms to a regular noetherian scheme of finite Krull dimension (whose local rings have global dimension bounded by the dimension).

**Hypotheses.**

- Proper is needed (a non-proper f can send O_X to a non-coherent complex); perfect (finite Tor-dimension) is needed: for the closed point i : Spec k → Spec k[ε]/(ε²), Ri_*k = k is not perfect.
- Y noetherian or f projective: the stated generality of TT 2.5.4.

**Proof.**

1. Rf_*E is bounded with coherent cohomology (SchemeKTheoryOperations:S.2/proper-pushforward-coherent), hence pseudo-coherent; by SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor it remains to bound its tor amplitude.
2. For quasi-coherent F on Y, Rf_*E ⊗^L F ≅ Rf_*(E ⊗^L Lf*F) (SchemeKTheoryOperations:S.2/derived-projection-formula), and E ⊗^L Lf*F = E ⊗^L_{f^{-1}O_Y} f^{-1}F has cohomology in a range [a, b] independent of F because E has finite tor dimension over f^{-1}O_Y (E perfect, f of finite Tor-dimension, X quasi-compact); so Rf_* of it lies in [a, ∞) (Stacks 08EV).
3. Quasi-coherent F suffice to test tor-amplitude on the quasi-separated Y (Stacks 08EA); conclude by SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor.

**Acceptance.**

- For f : P^n_A → Spec A (A noetherian), Rf_*O(m) is perfect for every m.
- For the finite map Spec k → Spec k[ε]/(ε²) the conclusion fails; f is proper but not perfect.

**Depends on.** this roadmap: `S.2/proper-pushforward-coherent`, `S.2/derived-projection-formula`, `S.1/perfect-iff-pseudo-coherent-finite-tor`, `S.1/tor-amplitude`; libraries: `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.Flat`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 2.5.4, p. 304: “Let f : X → Y be a proper map of schemes. Suppose either that f is projective, or that Y is locally noetherian. Suppose that f is a pseudo-coherent (respectively, a perfect) map. Then if E· is a pseudo-coherent (resp. perfect) complex on X, Rf_*(E·) is pseudo-coherent (resp. perfect) on Y.” — The statement.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 27.1 (tag 08EV): “Let E ∈D(OX) such that (1) E ∈Db Coh(OX), (2) the support of Hi(E) is proper over S for all i, and (3) E has finite tor dimension as an object of D(f −1OS). Then Rf∗E is a perfect object of D(OS).” — The form used in the proof (S noetherian, f locally of finite type).

### Proper pushforward on G-theory

`S.2/g-theory-proper-pushforward` · construction · planet “Proper pushforward on G-theory”

Let f : X → Y be a proper morphism of noetherian schemes. On the model of cohomologically bounded pseudo-coherent complexes of flasque O_X-modules (SchemeKTheoryOperations:S.2/g-theory-models), the degreewise direct image f_* is a complicial exact functor to the corresponding model on Y (flasque sheaves are f_*-acyclic, f_* preserves flasqueness, and Rf_* preserves bounded pseudo-coherence by SchemeKTheoryOperations:S.2/proper-pushforward-coherent); it induces the proper transfer f_* : G(X) → G(Y) (TT 3.16.1; K-book V.3.7, V.3.11). Using the Godement resolution T, Rf_* = f_*∘T is exact on all complexes and induces the same map (K-book V.3.11.1). On G_0, f_*[F] = Σ_i (−1)^i [R^if_*F] (Stacks 0FDL).

**Hypotheses.**

- Proper and noetherian: the stated setting of TT 3.16.1. TT 3.16.2–3.16.3 give variants for flat proper maps with relatively ample families and pseudo-coherent projective maps of quasi-compact schemes.
- The K-book's flasque model in V.3.11 must consist of pseudo-coherent complexes; the published errata insert this word (source issue).

**Proof.**

1. f_* sends flasque sheaves to flasque sheaves and on bounded below complexes of flasques represents Rf_* (TT 3.16; SGA 4 V 4.9).
2. It preserves cohomological boundedness (SchemeKTheoryOperations:S.2/total-direct-image-qcqs) and pseudo-coherence (SchemeKTheoryOperations:S.2/proper-pushforward-coherent), so it is a complicial exact functor between the flasque models, degreewise induced by the additive f_*.
3. Apply K (K.4) and the model equivalences G(X) ≃ K(flasque model) (SchemeKTheoryOperations:S.2/g-theory-models).

**API.**

- `Scheme.G.pushforward` (data): f_* : G(X) → G(Y) for f proper between noetherian schemes.
- `Scheme.G.pushforward_class` (simp): f_*[F] = Σ(−1)^i [R^if_*F] in G_0(Y).
- `Scheme.G.pushforward_closedImmersion` (simp): For a closed immersion i, i_*[F] = [i_*F].
- `Scheme.G.pushforward_finite` (compatibility): For finite f, f_* is induced by the exact functor f_* : Coh(X) → Coh(Y) (restriction of scalars on affines).
- `Scheme.G.pushforward_comp` (functoriality): (g∘f)_* ≃ g_*∘f_* (SchemeKTheoryOperations:S.2/pushforward-functoriality).
- `Scheme.G.pushforward_godement` (characterisation): f_* is induced by Rf_* = f_*∘T on the pseudo-coherent model (K-book V.3.11.1).

**Unit tests.**

- `G_pushforward_projectiveLine` (computation): For p : P^1_k → Spec k, p_*[O(n)] = n + 1 for every n ∈ ℤ (so p_*[O(−1)] = 0 and p_*[O(−2)] = −1).
- `G_pushforward_id` (degenerate): id_* is the identity of G(X).
- `G_pushforward_finite_eq_restrictScalars` (compatibility): For a finite ring map A → B of noetherian rings, (Spec B → Spec A)_* on G_0 is ExactK0.map of restriction of scalars FGModuleCat B → FGModuleCat A.
- `G_pushforward_class_point` (computation): For a closed point x : Spec k(x) → X of a curve over k, x_*[k(x)] = [O_x] in G_0(X), and composing with p_* gives [k(x) : k].
- `not_G_pushforward_open` (non-example): The open immersion A^1_k → P^1_k is not proper; its direct image of O is not coherent, so no pushforward G_0(A^1) → G_0(P^1) of this form exists.

**Acceptance.**

- For the structure map p : P^1_k → Spec k, p_*[O(n)] = n + 1 in G_0(k) = ℤ.
- For a closed immersion i, i_* is induced by the exact functor i_* on coherent sheaves.

**Used by.**

- EllipticKTheory:E.2/degree-euler-characteristic-and-pushforward: p_* : K_0(X) ≅ G_0(X) → K_0(F) = ℤ is the Euler characteristic
- EllipticKTheory:E.3/localisation-sequence-for-a-curve: the maps out of the residue terms are the transfers i_{x*}
- SchemeKTheoryOperations:S.3: G(Z) → G(X) along the closed immersion in the G-theory localisation sequence and dévissage
- SchemeKTheoryOperations:S.2/projection-formula: f_* is K_*(Y)-linear

**Depends on.** this roadmap: `S.2/g-theory-models`, `S.2/proper-pushforward-coherent`, `S.2/total-direct-image-qcqs`, `S.2/g-theory-of-a-scheme`; other roadmaps: `GeneralAlgebraicKTheory:K.4`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward`, `mathlib:AlgebraicGeometry.IsProper`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.16.1, p. 319: “G( ) is a covariant functor on the category of noetherian schemes and proper maps.” — The construction's output.
- `Kbook.2013`, Proposition V.3.7 (PDF p. 397): “If f : X →Y is a proper morphism of noetherian schemes, there is a “proper transfer” map f∗: G(X) →G(Y ).” — The K-book's statement.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Remark 38.7 (tag 0FDL): “This is well defined because the sheaves Rif∗F are coherent (Cohomology of Schemes, Proposition 19.1), because locally only a finite number are nonzero” — The G_0 formula.

### Pushforward on K-theory along proper perfect morphisms

`S.2/k-theory-proper-pushforward` · construction

Let f : X → Y be a proper perfect morphism of noetherian schemes (proper, of finite Tor-dimension). Then f_* = Rf_* restricts to a complicial exact functor on the flasque models of perfect complexes (TT 3.5.5), because Rf_* preserves perfection (SchemeKTheoryOperations:S.2/proper-perfect-pushforward-perfect), and induces f_* : K(X) → K(Y) (TT 3.16.4; K-book V.3.7.1, V.3.11). Variants with the same construction: perfect projective morphisms and flat proper morphisms of quasi-compact schemes (TT 3.16.5, 3.16.6), and the maps on K(X on Z). On K_0, f_*[E] = [Rf_*E]. It is compatible with the G-pushforward through the Cartan maps: c_Y∘f_* ≃ f_*∘c_X.

**Hypotheses.**

- Finite Tor-dimension is part of the hypothesis and is proved in each application (regular target, flat f, lci f); it is not implied by properness.

**Proof.**

1. The flasque models 3.5.5 compute K (SchemeKTheoryOperations:S.1/perfect-waldhausen-models, SchemeKTheoryOperations:S.2/k-theory-model-invariance).
2. f_* is exact on flasque complexes, preserves flasqueness and cohomological boundedness, and preserves perfection (SchemeKTheoryOperations:S.2/proper-perfect-pushforward-perfect), so it is a complicial exact functor; apply K (K.4).

**API.**

- `Scheme.K.pushforward` (data): f_* : K(X) → K(Y) for f proper perfect between noetherian schemes.
- `Scheme.K.pushforward_class` (simp): f_*[E] = [Rf_*E] in K_0(Y).
- `Scheme.K.pushforward_comp` (functoriality): (g∘f)_* ≃ g_*∘f_* (SchemeKTheoryOperations:S.2/pushforward-functoriality).
- `Scheme.K.pushforward_cartan` (compatibility): c_Y∘f_* ≃ f_*∘c_X with the G-pushforward (SchemeKTheoryOperations:S.2/cartan-map).
- `Scheme.K.pushforward_affine` (compatibility): For Spec B → Spec A finite with B perfect over A, f_* is the restriction-of-scalars transfer (SchemeKTheoryOperations:S.2/affine-pushforward-is-transfer).
- `Scheme.K.pushforward_supports` (functoriality): The analogous maps K(X on Z) → K(Y on f(Z)) (TT 3.16.7).

**Unit tests.**

- `K_pushforward_projectiveLine` (computation): For p : P^1_k → Spec k, p_*[O(n)] = n + 1 in K_0(Spec k) = ℤ.
- `K_pushforward_id` (degenerate): id_* is the identity of K(X).
- `K_pushforward_finiteFlat_eq_ringK0Transfer` (compatibility): For a finite ring extension A → B with B finitely generated projective over A, (Spec B → Spec A)_* on K_0 is KTheoryLowDegrees Z.1's ring-k0-transfer.
- `K_pushforward_degree` (computation): For the degree-2 map f : Spec ℤ[i] → Spec ℤ, f_*[O] = [ℤ[i]] = 2 in K_0(ℤ) = ℤ.
- `not_K_pushforward_nonperfect` (non-example): For i : Spec k → Spec k[ε]/(ε²), i is proper but not perfect and Ri_*k = k is not perfect, so K-pushforward along i is not defined (only i_* : G(Spec k) → G(Spec k[ε]/(ε²)) is).

**Acceptance.**

- For p : P^1_k → Spec k, p_*[O(n)] = n + 1 in K_0(k) = ℤ.
- For a finite flat f : Spec B → Spec A, f_* is the transfer by restriction of scalars (SchemeKTheoryOperations:S.2/affine-pushforward-is-transfer).

**Used by.**

- EllipticKTheory:E.4/rational-base-point-splitting: π_* and P_* for a rational point P of a proper curve (both perfect: π flat, P a regular immersion into a regular curve)
- EllipticKTheory:E.5/projection-formula-and-isogenies: pushforward along an isogeny, a finite flat map
- SchemeKTheoryOperations:S.7: Riemann–Roch compares f_* on K with pushforward of cycles
- SchemeKTheoryOperations:S.5: the projective bundle theorem uses p_* for p : P(E) → X

**Depends on.** this roadmap: `S.2/proper-perfect-pushforward-perfect`, `S.2/total-direct-image-qcqs`, `S.2/k-theory-model-invariance`, `S.2/k-theory-of-a-scheme`; other roadmaps: `GeneralAlgebraicKTheory:K.4`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.16.4, p. 320: “K( ) is a covariant functor on the category of noetherian schemes, with proper maps of finite Tor-dimension (i.e., perfect proper maps).” — The construction's output.
- `Kbook.2013`, Proposition V.3.7.1 (PDF p. 397): “If f : X →Y is a proper morphism of finite flat dimension. Then there is a “transfer” map f∗: K(X) →K(Y ).” — The K-book's statement.

### Functoriality of proper pushforward

`S.2/pushforward-functoriality` · lemma

For proper morphisms f : X → Y and g : Y → Z of noetherian schemes, (g∘f)_* ≃ g_*∘f_* : G(X) → G(Z) and id_* ≃ id; if f and g are moreover perfect, the same holds on K. After the usual rectification making f_*g_* = (fg)_* strictly on O-modules, the flasque-model construction is strictly functorial (TT 3.16.1; K-book V.3.11). On G_0 this is the Grothendieck spectral sequence identity Σ(−1)^n[R^n(gf)_*F] = Σ(−1)^{p+q}[R^pg_*R^qf_*F].

**Hypotheses.**

- The composite of perfect morphisms is perfect, so the K-statement makes sense.

**Proof.**

1. On flasque models (g∘f)_* = g_*∘f_* as functors of complexes after rectification, and f_* preserves flasqueness (SchemeKTheoryOperations:S.2/g-theory-proper-pushforward); an equality or natural isomorphism of exact functors gives equal or homotopic maps on K (TT 1.5.4, K.4).
2. For K use the same argument on flasque perfect complexes (SchemeKTheoryOperations:S.2/k-theory-proper-pushforward).

**Acceptance.**

- For P^1_k → Spec k → Spec k the composite is p_*.
- For closed immersions Z ⊂ Y ⊂ X, the composite of the pushforwards is the pushforward along Z ⊂ X.

**Depends on.** this roadmap: `S.2/g-theory-proper-pushforward`, `S.2/k-theory-proper-pushforward`; other roadmaps: `GeneralAlgebraicKTheory:K.4`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules.pushforwardComp`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.16.1, note, p. 319: “Also after the usual rectification to make f_*g_* = (fg)_* on O-modules strictly, instead of up to natural isomorphism, our method yields a strictly functorial G( ), instead of a functor up to homotopy.” — Strict functoriality on G.
- `Kbook.2013`, V.3.11 (PDF p. 403): “Thus X ↦ K(FX) and hence X ↦ G(X) is a functor on the category of noetherian schemes and proper maps.” — The K-book's statement; the same argument gives K on perfect proper maps.

### Derived base change for Tor-independent squares

`S.2/derived-tor-independent-base-change` · lemma

Consider a cartesian square of schemes X′ = X ×_Y Y′ with g : Y′ → Y, f : X → Y quasi-compact quasi-separated, g′ : X′ → X and f′ : X′ → Y′ the projections. If X and Y′ are Tor-independent over Y (Tor_p^{O_{Y,y}}(O_{X,x}, O_{Y′,y′}) = 0 for p ≥ 1 whenever x, y′ map to the same y), then for every E ∈ D_QCoh(O_X) the canonical base-change map Lg*Rf_*E → Rf′_*L(g′)*E is an isomorphism (Stacks 08IB; TT 2.5.6; SGA 6 IV 3.1). This holds in particular if g is flat, e.g. an open immersion or the inclusion of a generic fibre (a limit of opens is handled by the flat case).

**Hypotheses.**

- Tor-independence may be required only at points of a closed subset off which E is acyclic (TT 2.5.6.4).
- TT state it for E cohomologically bounded with either E of finite tor-amplitude over f^{-1}O_Y or g of finite Tor-dimension; the Stacks statement needs neither for E ∈ D_QCoh.

**Proof.**

1. Construct the base-change map from the adjunctions Lg* ⊣ Rg_* and Lg′* ⊣ Rg′_* (Cohomology 28.3).
2. The question is local on Y′, so assume Y′ → Y a morphism of affine schemes; then g and g′ are affine and it suffices to check after Rg_*, which reflects isomorphisms on D_QCoh (Stacks 08I8).
3. Rg_*Lg*Rf_*E = Rf_*E ⊗^L g_*O_{Y′} and Rf_*Rg′_*Lg′*E = Rf_*(E ⊗^L g′_*O_{X′}) (Stacks 08I9); g′_*O_{X′} = f*g_*O_{Y′} by affine base change, and Tor-independence says Lf*g_*O_{Y′} = f*g_*O_{Y′}. Conclude by the projection formula (SchemeKTheoryOperations:S.2/derived-projection-formula).

**Acceptance.**

- Restriction to an open V ⊂ Y: (Rf_*E)|V ≅ R(f|f^{-1}V)_*(E|f^{-1}V).
- For the flat map Spec F → Spec O_F from the generic point, Rf_* commutes with restriction to the generic fibre.

**Depends on.** this roadmap: `S.2/derived-projection-formula`, `S.2/total-direct-image-qcqs`, `S.1/affine-derived-equivalence`; other roadmaps: `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `SchemeAndStackFoundations:SF.2`; libraries: `mathlib:AlgebraicGeometry.Flat`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 22.5 (tag 08IB): “If X and S′ are Tor independent over S, then for all E ∈DQCoh(OX) the canonical arrow Lg∗Rf∗E →Rf ′ ∗L(g′)∗E is an isomorphism.” — The statement.
- `ThomasonTrobaugh.1990`, Theorem 2.5.6, p. 305: “Then there is a canonical base-change quasi-isomorphism (2.5.6.3) Lg*Rf_*E· ≃ Rf′_*Lg′*E·.” — Thomason–Trobaugh's statement (SGA 6 IV 3.1).

### Base change for pushforward on G- and K-theory

`S.2/k-theory-base-change` · theorem

Consider a cartesian square X′ = X ×_Y Y′ of noetherian schemes with f : X → Y proper, g : Y′ → Y, and X, Y′ Tor-independent over Y. (1) If g has finite Tor-dimension, g*∘f_* ≃ f′_*∘g′* : G(X) → G(Y′). (2) If f is moreover perfect, g*∘f_* ≃ f′_*∘g′* : K(X) → K(Y′) for every g. In particular (1) and (2) hold for g flat (open immersions, the inclusion of a generic fibre, étale maps) and for Tor-independent squares (TT 3.18; K-book V.3.7.2, Ex. V.3.11). On K_0 and G_0 this is the equality g*[Rf_*E] = [Rf′_*Lg′*E].

**Hypotheses.**

- TT 3.18 is stated for quasi-compact schemes with f quasi-separated, for maps satisfying the hypotheses of 3.16; here the noetherian proper case is used.
- Without Tor-independence the formula fails already on K_0: for f = g the inclusion of the origin Spec k → A^1_k (a square that is not Tor-independent, Tor_1^{k[x]}(k, k) = k), g*f_*[k] = g*([O] − [O]) = 0 while f′_*g′*[k] = [k] = 1 in K_0(Spec k) = ℤ.

**Proof.**

1. Build the model of G(X) whose objects are data (E, F → f_*E, g′*E → G) with E bounded above pseudo-coherent flat, F flat on Y and G flasque on X′, with quasi-isomorphisms (TT 3.18 proof, K-book Ex. V.3.11 (a)–(b)); it has the derived category of the pseudo-coherent model, hence K-theory G(X) (K.4 derived invariance).
2. On this model g*f_* is represented by (E, F, G) ↦ g*F and f′_*g′* by (E, F, G) ↦ f′_*G; Deligne's base-change transformation g*F → g*f_*E → f′_*g′*E → f′_*G is a natural quasi-isomorphism by SchemeKTheoryOperations:S.2/derived-tor-independent-base-change.
3. A natural weak equivalence of exact functors gives a homotopy of maps of K-theory spectra (TT 1.5.4); the same argument on perfect complexes gives (2).

**Acceptance.**

- For an open immersion j : V → Y, j*f_* = (f|)_*j′* : G(X) → G(f^{-1}V).
- For the generic fibre E → 𝓔 of an arithmetic surface and 𝓔 → Spec O_F, restriction commutes with pushforward.

**Depends on.** this roadmap: `S.2/derived-tor-independent-base-change`, `S.2/g-theory-proper-pushforward`, `S.2/k-theory-proper-pushforward`, `S.2/g-theory-finite-tor-pullback`, `S.2/k-theory-pullback`, `S.2/g-theory-models`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`, `GeneralAlgebraicKTheory:K.4`.

**Sources.**

- `ThomasonTrobaugh.1990`, Proposition 3.18, p. 321: “Then there is a canonical homotopy between g*f_* ≃ f′_*g′* : G(X) → G(Y′) (resp., g*f_* ≃ f′_*g′* : K(X) → K(Y′)).” — The conclusion, under the Tor-independence and Tor-dimension hypotheses stated there.
- `Kbook.2013`, Base change Theorem V.3.7.2 (PDF p. 398): “Then g∗f∗≃f ′ ∗g′∗as maps G(X) →G(Y ′).” — The K-book's statement for quasi-projective schemes, extended to noetherian schemes in Ex. V.3.11.

### The derived projection formula

`S.2/derived-projection-formula` · lemma

Let f : X → Y be a quasi-compact quasi-separated morphism of schemes. For E ∈ D_QCoh(O_X) and K ∈ D_QCoh(O_Y) the canonical map Rf_*E ⊗^L_{O_Y} K → Rf_*(E ⊗^L_{O_X} Lf*K) is an isomorphism (Stacks 08EU; TT 2.5.5, SGA 6 III 3.7). On the flat perfect models it is induced by the natural quasi-isomorphism F ⊗ f_*TE → f_*(f*F ⊗ TE) → Rf_*(f*F ⊗ E) (TT (3.17.2)), natural in both variables.

**Hypotheses.**

- TT 2.5.5 assumes Y quasi-compact, E and F cohomologically bounded with one of them of finite Tor-amplitude; Stacks 08EU needs only D_QCoh.

**Proof.**

1. The question is local on Y; assume Y = Spec A.
2. Both sides are exact functors of K commuting with direct sums (Lf* and ⊗^L do; Rf_* does on D_QCoh by SchemeKTheoryOperations:S.2/total-direct-image-qcqs (3)), so the class of K for which the map is an isomorphism is closed under shifts, cones and direct sums.
3. It contains O_Y trivially; every object of D(A) ≃ D_QCoh(O_Y) is built from A by these operations (More on Algebra 60.11), so the map is always an isomorphism (Stacks 08EU).

**Acceptance.**

- K = O_Y: both sides are Rf_*E.
- For f affine, Rf_* is f_* and the formula is (f_*E) ⊗ K ≅ f_*(E ⊗ f*K) for flat K.

**Depends on.** this roadmap: `S.2/total-direct-image-qcqs`, `S.1/affine-derived-equivalence`; other roadmaps: `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; libraries: `mathlib:AlgebraicGeometry.QuasiCompact`, `mathlib:AlgebraicGeometry.QuasiSeparated`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 22.1 (tag 08EU): “For E in DQCoh(OX) and K in DQCoh(OY ) the map Rf∗(E) ⊗L OY K −→Rf∗(E ⊗L OX Lf ∗K) defined in Cohomology, Equation (54.2.1) is an isomorphism.” — The statement.
- `ThomasonTrobaugh.1990`, Theorem 2.5.5, p. 304: “Then the canonical map is a quasi-isomorphism in D(O_Y−Mod) (2.5.5.1) Rf_*(E·) ⊗^L_{O_Y} F· ≃ Rf_*(E· ⊗^L_{O_X} Lf*F·).” — Thomason–Trobaugh's statement.

### The tensor-product pairings on K- and G-theory of a scheme

`S.2/tensor-product-pairings` · construction

Let X be a scheme. The derived tensor product, realised on the flat model Perf^flat(X) by (E, F) ↦ E ⊗_{O_X} F, is a biexact functor Perf^flat(X) × Perf^flat(X) → Perf(X) and Perf^flat(X) × PsCoh^{b,flat}(X) → PsCoh^b(X) (TT 3.15; SchemeKTheoryOperations:S.1/perfect-derived-tensor). By GeneralAlgebraicKTheory K.7's construction of external products from biexact functors it induces pairings K(X) ∧ K(X) → K(X) and, for X noetherian, K(X) ∧ G(X) → G(X) (TT (3.15.1), (3.15.3)), hence products K_i(X) ⊗ K_j(X) → K_{i+j}(X) and K_i(X) ⊗ G_j(X) → G_{i+j}(X). For a morphism f : X → Y the composite K(Y) ∧ G(X) → K(X) ∧ G(X) → G(X) (with f*) is the K(Y)-module structure on G(X) used in the projection formula. On K_0 the product is [E]·[F] = [E ⊗^L F] (Stacks 0FDK). The ring-spectrum structure (associativity, unit, graded commutativity), the products with supports and relative theories and their compatibility with flat pullback are SchemeKTheoryOperations:S.6's.

**Hypotheses.**

- Biexactness needs one variable to run over flat complexes: ⊗ of two arbitrary complexes does not preserve quasi-isomorphisms.
- Only the pairings are constructed here, because S.2's projection formula is stated with them; S.6 builds the ring structure on them.

**Proof.**

1. (E, F) ↦ E ⊗ F preserves degreewise split monomorphisms in each variable and, if one variable is flat bounded above, quasi-isomorphisms in the other; it preserves perfection and pseudo-coherence with bounded cohomology (TT 3.15; SchemeKTheoryOperations:S.1/perfect-derived-tensor). Hence it is biexact on the stated pairs of complicial biWaldhausen categories.
2. Apply K.7's biexact-pairing construction (Waldhausen's pairing |wS.A| ∧ |wS.B| → |wwS.S.C|) and the model equivalences (SchemeKTheoryOperations:S.2/k-theory-model-invariance, SchemeKTheoryOperations:S.2/g-theory-models).
3. Naturally weakly equivalent biexact functors induce homotopic pairings (TT 3.17 proof via 1.5.4; requested of K.7).

**API.**

- `Scheme.K.mulPairing` (data): K(X) ∧ K(X) → K(X) from the biexact tensor product on flat perfect complexes.
- `Scheme.G.modulePairing` (data): K(X) ∧ G(X) → G(X) for noetherian X.
- `Scheme.K.mul_class` (simp): [E]·[F] = [E ⊗^L F] in K_0(X).
- `Scheme.G.smul_class` (simp): [E]·[F] = [E ⊗^L F] in G_0(X) for E perfect, F coherent.
- `Scheme.K.one_mul` (simp): [O_X]·x = x on K_*(X) and on G_*(X).
- `Scheme.K.mulPairing_pullback` (compatibility): f* is multiplicative on K_0: f*(x·y) = f*x·f*y; in higher degrees this is S.6's.
- `Scheme.K.mulPairing_affine` (compatibility): On Spec A the K_0 product is the tensor product of projective modules (KTheoryLowDegrees Z.3).

**Unit tests.**

- `K_mul_one` (degenerate): [O_X]·x = x in K_0(X) for every scheme X.
- `K_mul_lineBundle_projectiveLine` (computation): On P^1_k, [O(1)]·[O(1)] = [O(2)] and ([O] − [O(−1)])² = 0 in K_0(P^1_k).
- `K_mul_affine_eq_tensor` (compatibility): On Spec A, [P~]·[Q~] = [(P ⊗_A Q)~] for finitely generated projective P, Q, matching KTheoryLowDegrees Z.3's tensor product on K_0(A).
- `G_smul_skyscraper` (computation): On Spec k[x], [O --x--> O]·[(k[x]/(x))~] = [k ⊕ k[1]] = 0 in G_0(Spec k[x]) = ℤ.
- `not_biexact_unflat` (non-example): The degreewise tensor product is not a biexact functor on all of Perf(X) × Perf(X): on Spec k[x] tensoring the quasi-isomorphism (O --x--> O) → (k[x]/(x))~ with (k[x]/(x))~ gives k --0--> k → k, which is not a quasi-isomorphism.

**Acceptance.**

- [O_X]·x = x for all x ∈ K_0(X).
- On Spec k[x], [O]·[(k[x]/(x))~] = [(k[x]/(x))~] in G_0.

**Used by.**

- SchemeKTheoryOperations:S.2/projection-formula: both sides of f_*(x·f*y) = f_*x·y are these pairings
- SchemeKTheoryOperations:S.6: extended to supports and relative theories, with graded commutativity
- EllipticKTheory:E.5/projection-formula-and-isogenies: f_*f*y = [f_*O_X]·y
- KTheoryLowDegrees:Z.3: on K_0(Spec A) it is the tensor product ring structure normalised in Z.3

**Depends on.** this roadmap: `S.1/perfect-derived-tensor`, `S.2/k-theory-of-a-scheme`, `S.2/g-theory-models`, `S.2/k-theory-model-invariance`, `S.2/k-theory-pullback`; other roadmaps: `KTheoryLowDegrees:Z.3/finite-projective-monoidal`, `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`, `GeneralAlgebraicKTheory:K.7`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.15, p. 318: “Thus ⊗ induces biexact functors between various biWaldhausen categories 3.5.3, 3.8.3, 3.11.3. As biexact functors induce pairings between K-theory spectra ([W] just after 1.5.3), we get various pairings (cf. [SGA 6] IV 2.7, 2.10):” — The construction.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Remark 38.6 (tag 0FDK): “The K-group K0(X) is canonically a commu- tative ring.” — The degree-zero product; Stacks also gives the K_0(X)-module structure on K′_0(X) for noetherian X.

### The projection formula in all degrees

`S.2/projection-formula` · theorem · planet “Projection formula”

Let f : X → Y be a proper morphism of noetherian schemes. Then f_* : G_*(X) → G_*(Y) is a graded K_*(Y)-module homomorphism: f_*(x·f*y) = f_*(x)·y for x ∈ G_m(X), y ∈ K_n(Y), the products being those of SchemeKTheoryOperations:S.2/tensor-product-pairings; at the spectrum level the square K(Y) ∧ G(X) → G(X) → G(Y) versus K(Y) ∧ G(Y) → G(Y) commutes up to a canonical homotopy (TT 3.17; K-book V.3.12). If f is moreover perfect, the same holds for f_* : K_*(X) → K_*(Y). In degree zero, f_*(α·f*β) = f_*α·β for α ∈ G_0(X), β ∈ K_0(Y) (Stacks 0FDM); taking x = [O_X] gives f_*f*y = [Rf_*O_X]·y.

**Hypotheses.**

- TT 3.17 is stated for f quasi-compact quasi-separated with Y quasi-compact and Rf_* preserving pseudo-coherence (resp. perfection); the noetherian proper case is the one used by consumers.

**Proof.**

1. Represent Rf_* by f_*∘T with T the Godement resolution, exact on all complexes (TT 3.17 proof; K-book V.3.11.1).
2. For F bounded above perfect flat on Y and E pseudo-coherent (resp. perfect) on X, the map F ⊗ f_*TE → f_*(f*F ⊗ TE) → f_*T(f*F ⊗ E) is a natural quasi-isomorphism by SchemeKTheoryOperations:S.2/derived-projection-formula (TT (3.17.2)).
3. The two composites are biexact functors in (F, E) related by this natural weak equivalence, so they induce homotopic pairings K(Y) ∧ G(X) → G(Y) (TT 1.5.4; K.7).

**Acceptance.**

- For an isogeny f : E′ → E of elliptic curves (finite flat of degree d), f_*f*y = [f_*O_{E′}]·y, where [f_*O_{E′}] has rank d.
- For p : P^1_k → Spec k and y ∈ K_n(k), p_*(p*y) = p_*[O]·y = y.

**Depends on.** this roadmap: `S.2/tensor-product-pairings`, `S.2/derived-projection-formula`, `S.2/g-theory-proper-pushforward`, `S.2/k-theory-proper-pushforward`, `S.2/k-theory-pullback`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`, `GeneralAlgebraicKTheory:K.4`.

**Sources.**

- `ThomasonTrobaugh.1990`, Proposition 3.17, p. 320: “Then f_* is a map of module spectra over the ring spectra K(Y).” — The spectrum-level statement.
- `Kbook.2013`, Projection Formula V.3.12 (PDF p. 403): “Then f∗: G∗(X) →G∗(Y ) is a graded K∗(Y )-module homomorphism: for all x ∈Gm(X) and y ∈Kn(Y ): f∗(x · f ∗y) = f∗(x) · y.” — The statement in all degrees.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 38.8 (tag 0FDM): “Then we have f∗(α · f ∗β) = f∗α · β for α ∈K′ 0(X) and β ∈K0(Y ).” — Degree zero, for proper f between locally noetherian schemes.

### K- and G-theory of an affine scheme are those of its ring

`S.2/affine-k-theory-comparison` · comparison

K-theory conventions: for a small complicial biWaldhausen category A (small relative to the universe in which spectra are formed, TT 1.4), K(A) is Waldhausen's connective K-theory spectrum of GeneralAlgebraicKTheory K.4 and K_n(A) = π_n K(A) for n ≥ 0; for an exact category E, K(E) is Quillen's (K.1), equivalent to Waldhausen's for E with admissible monomorphisms and isomorphisms (TT 1.11.2), and to K(Ch^b(E)) by Gillet–Waldhausen (K.4). Let A be a commutative ring and K(A) := K(P(A)) Quillen's K-theory of finitely generated projective A-modules. The complicial exact functor Ch^b(P(A)) → Perf(Spec A), P• ↦ P•~ (tilde degreewise), induces a homotopy equivalence K(A) ≃ K Ch^b(P(A)) ≃ K(Spec A); on K_0 it identifies K_0(Spec A) with KTheoryLowDegrees Z.1's ring K_0(A), [P~] ↔ [P] (Stacks 0FDH). If A is noetherian, tilde restricts to an equivalence mod A ≃ Coh(Spec A) of abelian categories, so G(Spec A) ≃ G(A) := K(mod A), and G_0(Spec A) ≅ ExactK0 of Tau Ceti's finiteModulesExactStructure A. The identifications are natural for the maps of SchemeKTheoryOperations:S.2/affine-pullback-is-scalar-extension and SchemeKTheoryOperations:S.2/affine-pushforward-is-transfer.

**Hypotheses.**

- A is an arbitrary commutative ring for K; noetherian for G.

**Proof.**

1. Gillet–Waldhausen: P(A) is closed under kernels of surjections in Mod A, so K(P(A)) ≃ K Ch^b(P(A)) (GeneralAlgebraicKTheory K.4; TT 1.11.7).
2. Ch^b(P(A)) → Perf(Spec A) is complicial exact (induced by the exact additive tilde functor, Mathlib) and induces an equivalence of homotopy categories: K^b(proj A) ≃ D_perf(A) ≃ D_perf(O_{Spec A}) (SchemeKTheoryOperations:S.1/perfect-module-complex, SchemeKTheoryOperations:S.1/affine-perfect-comparison). Derived invariance (TT 1.9.8, K-book Ex. V.3.12, requested from K.4) gives K Ch^b(P(A)) ≃ K(Spec A).
3. Degree zero: K_0 of the exact category P(A) is Z.1's ring K_0 (split and exact K_0 agree, Z.1/ring-k0-exact; K.1 identifies π_1 BQ with ExactK0).
4. G: for A noetherian, Mathlib's tildeEquiv restricts to finitely generated modules and coherent sheaves (quasi-coherent of finite type = finitely presented = coherent), an exact equivalence; K.1 is invariant under exact equivalences and ExactK0.mapEquiv identifies G_0.

**Acceptance.**

- K_0(Spec ℤ) ≅ K_0(ℤ) ≅ ℤ.
- For a Dedekind domain A, K_0(Spec A) ≅ ℤ ⊕ Pic(A) as in KTheoryLowDegrees Z.4.

**Depends on.** this roadmap: `S.2/k-theory-of-a-scheme`, `S.2/g-theory-of-a-scheme`, `S.1/affine-perfect-comparison`, `S.1/perfect-module-complex`; other roadmaps: `GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`, `KTheoryLowDegrees:Z.1/ring-k0`, `KTheoryLowDegrees:Z.1/ring-k0-exact`, `GeneralAlgebraicKTheory:K.4`; libraries: `mathlib:AlgebraicGeometry.tilde.functor`, `mathlib:AlgebraicGeometry.tildeEquiv`, `tauceti:TauCeti.finiteModulesExactStructure`, `tauceti:TauCeti.ExactK0.mapEquiv`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 38.3 (tag 0FDH): “Let X = Spec(R) be an affine scheme. Then K0(X) = K0(R) and if R is Noetherian then K′ 0(X) = K′ 0(R).” — Degree zero.
- `Kbook.2013`, Example V.2.7.2 (PDF p. 391): “K(R) ≃KChb(P(R)) ≃KCh− perf(R) ≃KChperf(R).” — The ring-level chain of equivalences.
- `Kbook.2013`, Exercise II.9.10(a) (PDF p. 180): “If X = Spec(R), show that K0(R) ∼= Kder 0 (X).” — The affine comparison in degree zero; the hint is the approximation theorem for Ch_perf(R) ⊂ Ch_perf(X).

### Pullback along a morphism of affine schemes is scalar extension

`S.2/affine-pullback-is-scalar-extension` · comparison

Let φ : A → B be a homomorphism of commutative rings and g = Spec φ : Spec B → Spec A. Under the identifications of SchemeKTheoryOperations:S.2/affine-k-theory-comparison, g* : K(Spec A) → K(Spec B) is homotopic to the map K(A) → K(B) induced by the exact functor B ⊗_A − : P(A) → P(B); on K_0 it is KTheoryLowDegrees Z.1's ring-k0-map. If A and B are noetherian and B is flat over A (more generally of finite Tor-dimension, via K-book V.3.5), g* : G(Spec A) → G(Spec B) is induced by B ⊗_A − on finitely generated modules.

**Hypotheses.**

- No hypothesis on φ for K.

**Proof.**

1. For P• a bounded complex of finitely generated projective A-modules, g*(P•~) ≅ (B ⊗_A P•)~ (Stacks 08DW: Lg* corresponds to − ⊗^L_A B, computed termwise on projectives), naturally in P•; so the square of complicial exact functors Ch^b(P(A)) → Ch^b(P(B)) → Perf(Spec B) and Ch^b(P(A)) → Perf(Spec A) → Perf^flat... → Perf(Spec B) commutes up to natural isomorphism.
2. Natural isomorphisms of exact functors induce homotopic maps on K (TT 1.5.4); combine with Gillet–Waldhausen naturality (K.4).

**Acceptance.**

- For ℤ → ℤ/p, g* : K_0(ℤ) = ℤ → K_0(ℤ/p) = ℤ is the identity on ranks.
- For a field extension F → E, g* : K_1(F) = F^× → K_1(E) = E^× is the inclusion.

**Depends on.** this roadmap: `S.2/affine-k-theory-comparison`, `S.2/k-theory-pullback`, `S.1/affine-derived-equivalence`; other roadmaps: `KTheoryLowDegrees:Z.1/ring-k0-map`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.4`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 3.8(2) (tag 08DW): “If X and Y are affine and f is given by the ring map A →B, then the diagram” — Lf* corresponds to − ⊗^L_A B under D(A) ≃ D_QCoh.
- `Kbook.2013`, Base change maps for G∗(R) V.3.5 (PDF p. 395): “If g : S →T is another map, and T has finite flat dimension over S, then the natural isomorphism (M ⊗R S)⊗S T ∼= M ⊗R T shows that g∗f ∗≃(gf)∗.” — The ring-level base change on G, compatible with composition.

### Pushforward along a finite flat morphism of affine schemes is the module transfer

`S.2/affine-pushforward-is-transfer` · comparison

Let φ : A → B be a finite homomorphism of commutative rings and f = Spec φ. (1) If B is a finitely generated projective A-module (φ finite flat of finite presentation) then f is proper and perfect, and under SchemeKTheoryOperations:S.2/affine-k-theory-comparison, f_* : K(Spec B) → K(Spec A) is homotopic to the transfer K(B) → K(A) induced by restriction of scalars P(B) → P(A) (K-book IV.6.3.2); on K_0 it is KTheoryLowDegrees Z.1's ring-k0-transfer. More generally, if A is noetherian and B has a finite resolution by finitely generated projective A-modules, f_* is the transfer K(B) → KH(A) ≃ K(A) of K-book V.3.3.2 (GeneralAlgebraicKTheory K.3's resolution theorem). (2) If A is noetherian, f_* : G(Spec B) → G(Spec A) is induced by the exact restriction of scalars mod B → mod A (K-book V.3.3.1).

**Hypotheses.**

- Finite flat is the case EllipticKTheory E.5 uses (isogenies); A noetherian in (2) and in the H(A) variant of (1).

**Proof.**

1. f is affine, so Rf_* on quasi-coherent complexes is f_*, which is restriction of scalars on modules (Stacks 0DJK, 0G9R; SchemeKTheoryOperations:S.2/total-direct-image-qcqs (4)).
2. For P• bounded finitely generated projective over B, f_*(P•~) = (P•|_A)~ with P•|_A finitely generated projective over A (B is), so f_* restricts to the complicial exact functor Ch^b(P(B)) → Ch^b(P(A)) on strict models; on the flasque model the Godement map P~ → T(P~) is an f_*-acyclic resolution, so the two models of f_* agree up to natural quasi-isomorphism.
3. Apply K and Gillet–Waldhausen naturality (K.4, TT 1.5.4); for the H(A) variant use K.3's resolution theorem K(P(A)) ≃ K(H(A)).
4. (2): for finite f, f_* is exact on quasi-coherent, hence on coherent sheaves, and is restriction of scalars; so on the Quillen model G = K(Coh) it is induced by mod B → mod A.

**Acceptance.**

- For ℤ → ℤ[i], f_*[O] = 2 in K_0(ℤ) = ℤ.
- For a finite field extension F → E, f_* : K_1(E) = E^× → K_1(F) = F^× is the norm (KTheoryLowDegrees U.5's transfer-field-norm, a consequence).

**Depends on.** this roadmap: `S.2/affine-k-theory-comparison`, `S.2/k-theory-proper-pushforward`, `S.2/g-theory-proper-pushforward`, `S.2/total-direct-image-qcqs`; other roadmaps: `KTheoryLowDegrees:Z.1/ring-k0-transfer`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison`, `GeneralAlgebraicKTheory:K.4`; libraries: `mathlib:AlgebraicGeometry.IsFinite`, `mathlib:AlgebraicGeometry.Flat`.

**Sources.**

- `Kbook.2013`, Transfer Maps for K∗(R) V.3.3.2 (PDF p. 394): “Let f : R →S be a ring homomorphism such that S has a finite R-module resolution by finitely generated projective R-modules. Then the restriction of scalars defines a functor P(S) →H(R).” — The ring-level transfer.
- `Kbook.2013`, Corollary V.3.3.1 (PDF p. 394): “If f : R →S is a homomorphism, R is regular noetherian and S is finite as an R-module, then there is a transfer map f∗: K∗(S) →K∗(R), defined by the G-theory transfer map” — The G-theory transfer for finite maps.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 3.7 (tag 0DJK): “If f : X →Y is a morphism of affine schemes given by the ring map A →B, then the diagram” — Rf_* corresponds to restriction of scalars.

### K-theory of vector bundles equals K-theory of perfect complexes under the resolution property

`S.2/vector-bundle-k-theory-comparison` · theorem

Let X be a quasi-compact quasi-separated scheme with the resolution property (for example: X with an ample line bundle or an ample family of line bundles; X quasi-compact regular with affine diagonal, in particular a separated regular noetherian scheme such as a regular curve). Then the natural maps K(Vect X) ≃ K^naive(X) → K(X) are homotopy equivalences, where K(Vect X) is Quillen's K-theory of the exact category of finite locally free modules; on K_0, K_0(Vect X) ≅ K_0(X) (Stacks 0FDJ). For X with an ample family of line bundles this is TT 3.9–3.10. Without the resolution property the map can fail to be an equivalence already on K_0 (affine plane with doubled origin).

**Hypotheses.**

- The resolution property is a hypothesis to be verified (SchemeKTheoryOperations:S.1/resolution-property); it is not automatic for regular noetherian schemes without affine diagonal.

**Proof.**

1. Vect(X) is closed under kernels of surjections in O_X-Mod (a surjection of finite locally free modules is locally split), so Gillet–Waldhausen gives K(Vect X) ≃ K Ch^b(Vect X) = K^naive(X) (K.4; TT 1.11.7, 3.10).
2. The inclusion of strictly perfect complexes into Perf(X) induces an equivalence of homotopy categories (SchemeKTheoryOperations:S.1/vector-bundle-comparison); derived invariance (TT 1.9.8, requested from K.4) gives K^naive(X) ≃ K(X).
3. Degree zero: the inverse sends a perfect object represented by E• to Σ(−1)^i [E^i] (Stacks 0FDJ).

**Acceptance.**

- For P^1_k, K_0(Vect P^1_k) = K_0(P^1_k) = ℤ[O] ⊕ ℤ[O(−1)].
- For a separated regular noetherian curve C, K_0(C) is generated by classes of vector bundles, as KTheoryLowDegrees Z.5 requires.

**Depends on.** this roadmap: `S.1/vector-bundle-comparison`, `S.1/resolution-property`, `S.2/k-theory-of-a-scheme`, `S.2/k-theory-model-invariance`; other roadmaps: `GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.4`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 38.5 (tag 0FDJ): “Let X be a quasi-compact and quasi-separated scheme with the resolution property. Then the map K0(Vect(X)) →K0(X) is an isomorphism.” — Degree zero.
- `Totaro.2004`, §2, p. 4: “Thomason gave a satisfactory answer: if X has the resolution property, then the map from Knaive ∗ X to K∗X is an isomorphism.” — The statement in all degrees, attributed to Thomason.
- `Kbook.2013`, V.2.7.3 (PDF p. 391): “Indeed, KVB(X) ≃KChperf(X), by Waldhausen Approximation applied to Chb(VB(X)) ⊂Chperf(X).” — The K-book's argument, for qcqs X in which every coherent sheaf is a quotient of a vector bundle.

### The Cartan map from K-theory to G-theory

`S.2/cartan-map` · construction · planet “Cartan map”

K-theory conventions: for a small complicial biWaldhausen category A (small relative to the universe in which spectra are formed, TT 1.4), K(A) is Waldhausen's connective K-theory spectrum of GeneralAlgebraicKTheory K.4 and K_n(A) = π_n K(A) for n ≥ 0; for an exact category E, K(E) is Quillen's (K.1), equivalent to Waldhausen's for E with admissible monomorphisms and isomorphisms (TT 1.11.2), and to K(Ch^b(E)) by Gillet–Waldhausen (K.4). Let X be a noetherian scheme. Every perfect complex on X is pseudo-coherent with bounded cohomology (SchemeKTheoryOperations:S.1/perfect-objects-quasi-coherent-bounded), so Perf(X) is a complicial biWaldhausen subcategory of PsCoh^b(X) and the inclusion is complicial exact. The Cartan map is the composite c_X : K(X) = K(Perf X) → K(PsCoh^b X) ≃ G(X) (SchemeKTheoryOperations:S.2/g-theory-models). On K_0, c_X[E] = Σ_i (−1)^i [H^i(E)] (Stacks: K_0(D_perf) → K_0(D^b_Coh) = K′_0). It is natural for pullback along morphisms of finite Tor-dimension, commutes with proper perfect pushforward, and is K(X)-linear. It is NOT an equivalence in general (SchemeKTheoryOperations:S.2/cartan-singular-non-example); it is one for regular X (SchemeKTheoryOperations:S.2/cartan-equivalence).

**Hypotheses.**

- Noetherian, so that G(X) is defined and perfect complexes are cohomologically bounded with coherent cohomology.
- The map is a construction, not an identification: an integral point class, a coherent sheaf and a perfect resolution are equal only after applying c_X.

**Proof.**

1. Perf(X) ⊂ PsCoh^b(X) as full subcategories of complexes of O_X-modules, with the same cofibrations and weak equivalences; the inclusion is complicial exact.
2. Apply K (K.4) and compose with the equivalence K(PsCoh^b X) ≃ G(X).
3. Naturality: for f of finite Tor-dimension both pullbacks are induced by f* on flat models, so the inclusions commute; for f proper perfect both pushforwards are f_* on flasque models; linearity from the pairings of SchemeKTheoryOperations:S.2/tensor-product-pairings restricted along Perf ⊂ PsCoh^b.

**API.**

- `Scheme.cartan` (data): c_X : K(X) → G(X) for noetherian X.
- `Scheme.cartan_class` (simp): c_X[E] = Σ(−1)^i [H^i(E)] in G_0(X).
- `Scheme.cartan_class_vectorBundle` (simp): c_X[V] = [V] for a finite locally free module V.
- `Scheme.cartan_pullback` (functoriality): c_X∘f* ≃ f*∘c_Y for f of finite Tor-dimension.
- `Scheme.cartan_pushforward` (functoriality): c_Y∘f_* ≃ f_*∘c_X for f proper perfect.
- `Scheme.cartan_linear` (structure): c_X(x·y) = x·c_X(y) for x, y ∈ K_*(X).
- `Scheme.cartan_affine` (compatibility): For X = Spec R, π_0 c_X is Tau Ceti's cartanMap R (SchemeKTheoryOperations:S.2/cartan-degree-zero-compatibility).
- `Scheme.cartan_isEquiv_of_regular` (characterisation): c_X is an equivalence for regular noetherian X (SchemeKTheoryOperations:S.2/cartan-equivalence).

**Unit tests.**

- `cartan_spec_field` (computation): For a field F, c : K_0(Spec F) → G_0(Spec F) is the identity of ℤ ([F] ↦ [F]).
- `cartan_empty` (degenerate): For X = ∅, c_X is the map between contractible spectra.
- `cartan_dualNumbers` (computation): For X = Spec k[ε]/(ε²), c([O]) = [O] = 2[k] in G_0(X) = ℤ[k], so c = ×2 : ℤ → ℤ.
- `cartan_affine_eq_tauceti` (compatibility): For X = Spec R with R noetherian, π_0 c_X corresponds to TauCeti.cartanMap R under K_0(Spec R) ≅ ExactK0(finiteProjectiveModulesExactStructure R) and G_0(Spec R) ≅ ExactK0(finiteModulesExactStructure R).
- `cartan_not_surjective_dualNumbers` (non-example): For X = Spec k[ε]/(ε²), [k] ∈ G_0(X) is not in the image of c: the Cartan map is not an equivalence for this singular scheme, although K_0(X) ≅ G_0(X) ≅ ℤ abstractly.

**Acceptance.**

- For X = Spec F a field, c_X is an equivalence and on K_0 the identity ℤ → ℤ.
- For X = Spec k[ε]/(ε²), c_X on K_0 is multiplication by 2.

**Used by.**

- EllipticKTheory:E.2/degree-euler-characteristic-and-pushforward: K_0(X) ≅ G_0(X) for a regular proper curve, so χ is defined on K_0
- EllipticKTheory:E.3/localisation-sequence-for-a-curve: on a regular curve K = G, so the G-theory localisation sequence computes K
- KTheoryLowDegrees:Z.6: compatibility of explicit degree-zero classes with the existing categorical Cartan map
- SchemeKTheoryOperations:S.3: the localisation sequence K_Z(X) → K(X) → K(U) compared with G(Z) → G(X) → G(U)

**Depends on.** this roadmap: `S.2/k-theory-of-a-scheme`, `S.2/g-theory-of-a-scheme`, `S.2/g-theory-models`, `S.1/perfect-objects-quasi-coherent-bounded`, `S.1/perfect-iff-pseudo-coherent-finite-tor`, `S.2/tensor-product-pairings`; other roadmaps: `GeneralAlgebraicKTheory:K.4`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, discussion before Lemma 38.4: “Namely, perfect complexes are in Db Coh(OX) (by Lemma 10.3), the inclusion functor Dperf(OX) →Db Coh(OX) induces a map on zeroth K-groups” — The degree-zero Cartan map.
- `ThomasonTrobaugh.1990`, Theorem 3.21, p. 328: “Then the canonical map is a homotopy equivalence: K(X) ≃ G(X).” — The canonical map K(X) → G(X) of TT, induced by the inclusion of perfect complexes into cohomologically bounded pseudo-coherent ones.

### On a regular scheme bounded pseudo-coherent complexes are perfect

`S.2/perfect-coherent-on-regular` · lemma

Let X be a quasi-compact scheme such that for every x ∈ X every finitely presented O_{X,x}-module has finite Tor-dimension (TT 3.21's hypothesis; it suffices that every pseudo-coherent O_{X,x}-module has finite Tor-dimension). Then every cohomologically bounded pseudo-coherent complex of O_X-modules is perfect. Every regular noetherian scheme satisfies the hypothesis: its local rings are regular local rings, which have finite global dimension (Serre; DeformationAndDerivedPatchingAlgebra R03.3). Hence for X regular noetherian, D^b_Coh(O_X) = D_perf(O_X) (Stacks 0FDC), the Waldhausen categories PsCoh^b(X) and Perf(X) coincide, and every coherent sheaf is perfect.

**Hypotheses.**

- No finite-dimensionality is needed: the Tor-dimension is finite at each point and the argument is local; quasi-compactness gives the global bound.
- No separatedness is needed (contrast K-book V.3.4, which works with vector bundles and needs separated).

**Proof.**

1. The question is local; on a small affine neighbourhood U of x, E is quasi-isomorphic to a strict pseudo-coherent complex (bounded above complex of finite free modules; TT 2.3.1(e), SchemeKTheoryOperations:S.1/pseudo-coherent-complex).
2. Let k be such that H^n(E) = 0 for n ≤ k; then Z^kE is finitely presented and the stalk Z^kE_x has finite Tor-dimension p by hypothesis.
3. By descending induction along the exact sequences 0 → Z^{n−1}E_x → E^{n−1}_x → Z^nE_x → 0 for n ≤ k, Z^{k−p}E_x is flat and finitely presented, hence free; so Z^{k−p}E is free near x and the good truncation τ^{≥k−p}E is strictly perfect and quasi-isomorphic to E there (TT 3.21 proof).
4. Regular noetherian local rings have finite global dimension (DeformationAndDerivedPatchingAlgebra R03.3: a noetherian local ring is regular iff it has finite global dimension), so their finitely generated modules have finite Tor-dimension. The converse inclusion D_perf ⊂ D^b_Coh is SchemeKTheoryOperations:S.1/perfect-objects-quasi-coherent-bounded.

**Acceptance.**

- On Spec ℤ every finitely generated abelian group is a perfect complex in degree 0.
- On Spec k[ε]/(ε²) the residue field is bounded pseudo-coherent but not perfect: the hypothesis fails at the closed point.

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/pseudo-coherent-complex`, `S.1/perfect-iff-pseudo-coherent-finite-tor`, `S.1/perfect-objects-quasi-coherent-bounded`, `S.1/perfect-local-and-invariant`; other roadmaps: `DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds`; libraries: `mathlib:IsRegularLocalRing`, `mathlib:IsRegularRing`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 3.21, proof, p. 328: “This follows from the definitions once we show that any cohomologically bounded pseudo-coherent complex E· on X is perfect.” — The lemma is the content of TT's proof of 3.21.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 11.8 (tag 0FDC): “Let X be a regular scheme. Then every object of Db Coh(OX) is perfect. If X is quasi-compact, i.e., Noetherian and regular, then conversely every perfect object of D(OX) is in Db Coh(OX).” — The regular noetherian form.
- `Stacks.more-algebra.2026`, More on Algebra, Lemma 76.14 (tag 066Z): “Let R be a regular ring. Then (1) an R-module is perfect if and only if it is a finite R-module,” — The affine input, proved from finite global dimension of regular local rings.

### Poincaré duality: the Cartan map is an equivalence for regular schemes

`S.2/cartan-equivalence` · theorem · planet “Poincaré duality K ≃ G”

Let X be a quasi-compact scheme such that every finitely presented module over every local ring O_{X,x} has finite Tor-dimension; in particular let X be a regular noetherian scheme (of any Krull dimension, not necessarily separated). Then the Cartan map c_X : K(X) → G(X) is a homotopy equivalence (TT 3.21, 'Poincaré duality'), so K_n(X) ≅ G_n(X) for all n ≥ 0; on K_0 this is Stacks 0FDI. Moreover the negative groups of 𝕂(X) vanish for X regular noetherian, so 𝕂(X) ≃ K(X) ≃ G(X). For separated regular noetherian X the equivalence also follows from Quillen's resolution theorem applied to Vect(X) ⊂ Coh(X) (K-book V.3.4).

**Hypotheses.**

- Regularity is essential and is never assumed by definition: for singular X the Cartan map need not be an equivalence (SchemeKTheoryOperations:S.2/cartan-singular-non-example).
- The stage's 'finite-dimensional' hypothesis is not needed in TT's proof; the consumers' schemes (curves, arithmetic surfaces over O_F) are finite-dimensional in any case.

**Proof.**

1. By SchemeKTheoryOperations:S.2/perfect-coherent-on-regular, Perf(X) and PsCoh^b(X) have the same objects, cofibrations and weak equivalences; so the inclusion defining c_X is the identity functor and K(Perf X) → K(PsCoh^b X) is the identity (TT 3.21 proof: 'This follows from the definitions').
2. Compose with the equivalence K(PsCoh^b X) ≃ G(X) (SchemeKTheoryOperations:S.2/g-theory-models).
3. Negative groups: for X regular noetherian the inclusion of bounded complexes of coherent sheaves (degreewise split conflations, acyclic complexes) into Perf(X) = PsCoh^b(X) is a map of Frobenius pairs inducing D^b(Coh X) ≃ D^b_Coh(O_X) = D_perf(O_X) (SchemeKTheoryOperations:S.1/coherator (2)); by K.6 derived invariance 𝕂(X) ≃ IK(Coh X), and IK_n of a small noetherian abelian category vanishes for n < 0 (K.6).

**Acceptance.**

- For X = Spec O_F (O_F a Dedekind domain), K_n(O_F) ≅ G_n(O_F).
- For a regular proper curve over a field, K_0(X) ≅ G_0(X) ≅ ℤ ⊕ Pic(X) (EllipticKTheory E.2).

**Depends on.** this roadmap: `S.2/cartan-map`, `S.2/perfect-coherent-on-regular`, `S.2/g-theory-models`, `S.2/nonconnective-k-theory-of-a-scheme`, `S.1/coherator`; other roadmaps: `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 3.21, p. 328: “Let X be a quasi-compact scheme. Suppose for every local ring O_{X,x} of X, that every finitely presented O_{X,x}-module has finite Tor-dimension over O_{X,x}.” — The hypothesis; TT add that any regular noetherian scheme meets it.
- `ThomasonTrobaugh.1990`, Theorem 3.21, p. 328: “(Note that any regular noetherian scheme meets these hypotheses.) Then the canonical map is a homotopy equivalence: K(X) ≃ G(X).” — The conclusion.
- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 38.4 (tag 0FDI): “Let X be a Noetherian regular scheme. Then the map K0(X) → K′ 0(X) is an isomorphism.” — Degree zero.
- `Kbook.2013`, Theorem V.3.4 (PDF p. 395): “If X is a separated regular noetherian scheme, then K(X) = KVB(X) satisfies: K(X) ≃G(X)” — The separated case via vector bundles.

### In degree zero on affine schemes the Cartan map is Tau Ceti's categorical Cartan map

`S.2/cartan-degree-zero-compatibility` · comparison

Let R be a noetherian commutative ring and X = Spec R. Under the identifications K_0(X) ≅ ExactK0(finiteProjectiveModulesExactStructure R) and G_0(X) ≅ ExactK0(finiteModulesExactStructure R) of SchemeKTheoryOperations:S.2/affine-k-theory-comparison, π_0(c_X) is Tau Ceti's TauCeti.cartanMap R : K_0(proj R) → G_0(mod R). If R is regular, every finitely generated R-module has a finite resolution by finitely generated projective modules, so the hypothesis of TauCeti.cartanMap_bijective holds, and π_0 of the Poincaré-duality equivalence (SchemeKTheoryOperations:S.2/cartan-equivalence) is TauCeti.cartanEquiv R, with inverse the alternating class of any finite projective resolution.

**Hypotheses.**

- The degree-zero categorical Cartan map is the existing Tau Ceti construction owned by GrothendieckEulerForms layer 4 (RS-18); this node proves compatibility, it does not rebuild it.

**Proof.**

1. Both homomorphisms send the class of a finitely generated projective P to the class of P (TauCeti.cartanMap_of; SchemeKTheoryOperations:S.2/cartan-map on P~[0], whose only cohomology is P~); K_0(proj R) is generated by such classes, so the two maps agree (ExactK0 homomorphisms agreeing on generators).
2. For R regular noetherian, every finite R-module is perfect (More on Algebra 066Z, via DeformationAndDerivedPatchingAlgebra R03.3), hence has a finite resolution by finite projective modules (More on Algebra 066Q); this is the hypothesis of TauCeti.cartanMap_bijective, giving TauCeti.cartanEquiv.
3. π_0 of an equivalence is an isomorphism restricting to cartanMap, hence equal to cartanEquiv.

**Acceptance.**

- For R = ℤ both groups are ℤ and the map is the identity.
- For R = k[ε]/(ε²), cartanMap R = ×2, consistent with SchemeKTheoryOperations:S.2/cartan-singular-non-example.

**Depends on.** this roadmap: `S.2/cartan-map`, `S.2/cartan-equivalence`, `S.2/affine-k-theory-comparison`, `S.1/perfect-module-complex`; other roadmaps: `DeformationAndDerivedPatchingAlgebra:R03.3/depth-auslander-buchsbaum-and-dimension-bounds`, `KTheoryLowDegrees:Z.1/ring-k0-exact`; libraries: `tauceti:TauCeti.cartanMap`, `tauceti:TauCeti.cartanMap_of`, `tauceti:TauCeti.cartanMap_bijective`, `tauceti:TauCeti.cartanEquiv`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure`, `tauceti:TauCeti.finiteModulesExactStructure`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Lemma 38.3 (tag 0FDH): “Let X = Spec(R) be an affine scheme. Then K0(X) = K0(R) and if R is Noetherian then K′ 0(X) = K′ 0(R).” — The two affine identifications in degree zero.
- `Stacks.more-algebra.2026`, More on Algebra, Lemma 76.14 (tag 066Z): “Let R be a regular ring. Then (1) an R-module is perfect if and only if it is a finite R-module,” — Regular rings satisfy the finite-resolution hypothesis of Tau Ceti's cartanMap_bijective.

### For the dual numbers the Cartan map is not an equivalence

`S.2/cartan-singular-non-example` · application

Let k be a field, R = k[ε]/(ε²) and X = Spec R. Then K_0(X) ≅ ℤ generated by [O_X] (R is local, so finitely generated projective modules are free), G_0(X) ≅ ℤ generated by [k] (every finite module has a composition series with factors k; dévissage), and c_X([O_X]) = [R] = 2[k] because of the exact sequence 0 → k --ε--> R → k → 0. So π_0(c_X) = ×2 : ℤ → ℤ is injective but not surjective, c_X is not an equivalence, and the residue field k (in degree 0) is a coherent sheaf that is not perfect. TT 3.21's hypothesis fails at the closed point: k has infinite Tor-dimension over R. No statement of this layer makes K and G agree on singular schemes by definition.

**Hypotheses.**

- k is a field; char k is arbitrary.

**Proof.**

1. K_0(R) ≅ ℤ: a local ring has only free finitely generated projectives (KTheoryLowDegrees Z.2's local-ring-k0), and the rank is an isomorphism; with the affine comparison K_0(X) ≅ K_0(R).
2. G_0(R) ≅ ℤ: R is artinian local with residue field k, so dévissage (GeneralAlgebraicKTheory K.3) identifies G_0(R) with K_0(k) = ℤ, [M] ↦ length(M).
3. c_X[O_X] = [R] = length(R)·[k] = 2[k] (SchemeKTheoryOperations:S.2/cartan-map on K_0; SchemeKTheoryOperations:S.2/cartan-degree-zero-compatibility).
4. Hence [k] ∉ im(c_X); the Tor computation Tor_i^R(k, k) = k (i ≥ 0) from the periodic resolution ⋯ --ε--> R --ε--> R → k shows k is not perfect.

**Acceptance.**

- π_0(c_X)(1) = 2.
- Tau Ceti's cartanMap for k[ε]/(ε²) is also ×2, and its bijectivity hypothesis (finite projective resolutions) fails for k.

**Depends on.** this roadmap: `S.2/cartan-map`, `S.2/cartan-degree-zero-compatibility`, `S.2/affine-k-theory-comparison`, `S.1/perfect-complex`; other roadmaps: `KTheoryLowDegrees:Z.2/local-ring-k0`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`; libraries: `tauceti:TauCeti.cartanMap`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 3.21, p. 328: “Let X be a quasi-compact scheme. Suppose for every local ring O_{X,x} of X, that every finitely presented O_{X,x}-module has finite Tor-dimension over O_{X,x}.” — The hypothesis that fails for k[ε]/(ε²): the residue field has infinite Tor-dimension.
- `Totaro.2004`, §2, p. 4: “In particular, for any regular scheme X, the natural map K∗X →G∗X is an isomorphism, whereas these groups may differ from Knaive ∗ X when the resolution property fails, for example for the regular scheme X = An ∪An−0 An with n ≥2 ([37], Exercise 8.6).” — The comparison is for regular schemes; outside regularity it is not asserted.

### Perfect complexes are the compact objects of the quasi-coherent derived category

`S.2/perfect-iff-compact` · lemma

Let X be a quasi-compact quasi-separated scheme. D_QCoh(O_X) has arbitrary direct sums, computed in D(O_X) by termwise sums (Stacks 08DT). An object K of D_QCoh(O_X) is compact (Hom(K, −) commutes with direct sums in D_QCoh(O_X)) iff K is perfect (Stacks 09M1). Hence D_perf(O_X) is exactly the full subcategory D_QCoh(O_X)^c of compact objects. For X = Spec A this is the ring statement: the compact objects of D(A) are the perfect complexes (Stacks 07LT). That D_QCoh(O_X) is moreover compactly generated by a single perfect object (Stacks 09IS) is the case T = X of SchemeKTheoryOperations:S.3/supported-perfect-generator (Stacks 0A9A), planned in S.3 together with the extension lemma it needs.

**Hypotheses.**

- Compactness is taken in D_QCoh(O_X), not in D(O_X): on a noetherian scheme of finite dimension j_!O_U is compact in D(O_X) for every open U but is not perfect (Stacks §17 introduction).
- Quasi-compact and quasi-separated: used for RΓ and Rj_* to commute with direct sums on D_QCoh (SchemeKTheoryOperations:S.2/total-direct-image-qcqs (3)).

**Proof.**

1. A perfect K is dualizable: K^∨ = RHom(K, O_X) is perfect, K^∨ ⊗^L M ≅ RHom(K, M) and Hom_{D(O_X)}(K, M) = H^0(X, K^∨ ⊗^L M) (Stacks 08DQ; locally K is strictly perfect and RHom is computed termwise, Stacks 08DM, via SchemeKTheoryOperations:S.1/strictly-perfect-local-lifting).
2. K^∨ ⊗^L − commutes with direct sums, and H^0(X, −) = H^0 RΓ(X, −) commutes with direct sums on D_QCoh(O_X) (SchemeKTheoryOperations:S.2/total-direct-image-qcqs (3) for X → Spec ℤ); so perfect objects are compact.
3. Conversely let K ∈ D_QCoh(O_X) be compact. Perfectness is local (SchemeKTheoryOperations:S.1/perfect-local-and-invariant); for an affine open j : U → X, j is quasi-compact and separated, Rj_* : D_QCoh(O_U) → D_QCoh(O_X) commutes with direct sums (SchemeKTheoryOperations:S.2/total-direct-image-qcqs (3)) and is right adjoint to restriction, so K|U is compact in D_QCoh(O_U).
4. Affine case: under D(A) ≃ D_QCoh(O_U) (SchemeKTheoryOperations:S.1/affine-derived-equivalence, compatible with sums) K|U is a compact object of D(A); compact objects of D(A) are perfect, being direct summands of finite complexes of finite free modules obtained from the compact generator A (Stacks 07LT, Derived Categories 37.6); so K|U is perfect (SchemeKTheoryOperations:S.1/affine-perfect-comparison).

**Acceptance.**

- O_X is compact in D_QCoh(O_X) for qcqs X.
- On Spec k[ε]/(ε²) the residue field k is not compact: ⊕_{n≥0} k[n] = ∏_{n≥0} k[n] and Hom(k, ∏ k[n]) = ∏_n Ext^n(k, k) = ∏_n k, which is not ⊕_n Ext^n(k, k).

**Depends on.** this roadmap: `S.2/total-direct-image-qcqs`, `S.1/perfect-complex`, `S.1/perfect-local-and-invariant`, `S.1/strictly-perfect-local-lifting`, `S.1/perfect-derived-tensor`, `S.1/affine-derived-equivalence`, `S.1/affine-perfect-comparison`, `S.1/perfect-module-complex`; other roadmaps: `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`; libraries: `mathlib:AlgebraicGeometry.QuasiSeparated`, `mathlib:AlgebraicGeometry.QuasiCompact`.

**Sources.**

- `Stacks.perfect.2026`, Derived Categories of Schemes, Proposition 17.1 (tag 09M1): “An object of DQCoh(OX) is compact if and only if it is perfect.” — The statement, for qcqs X.
- `Stacks.more-algebra.2026`, More on Algebra, Proposition 80.3 (tag 07LT): “Let R be a ring. For an object K of D(R) the following are equivalent (1) K is perfect, and (2) K is a compact object of D(R).” — The affine case.
- `Stacks.cohomology.2026`, Cohomology of Sheaves, Lemma 50.5 (tag 08DQ): “Let K be a perfect object of D(OX). Then K∨= R Hom(K, OX) is a perfect object too and (K∨)∨∼= K.” — Duality for perfect objects, used for perfect ⇒ compact.
- `ThomasonTrobaugh.1990`, 2.4.4, p. 302: “To summarize, 2.4.3 roughly characterizes perfect complexes on schemes with ample families of line bundles as the finitely presented objects” — Thomason–Trobaugh's form of the characterisation (finitely presented = Mor out of them preserves direct colimits).

### Continuity of K-theory for limits with affine transition maps

`S.2/k-theory-continuity` · theorem

Let X = lim_α X_α be the limit of a directed inverse system of quasi-compact quasi-separated schemes with affine transition maps f_{αβ}, and let Y_α ⊂ X_α be closed subsets with f_{αβ}^{-1}(Y_β) = Y_α and X_α ∖ Y_α quasi-compact, Y the preimage of the Y_α in X. Then the maps induced by the pullbacks are homotopy equivalences colim_α K(X_α) ≃ K(X) and colim_α K(X_α on Y_α) ≃ K(X on Y) (TT 3.20.2), and likewise colim_α 𝕂(X_α) ≃ 𝕂(X) for the nonconnective theory of SchemeKTheoryOperations:S.2/nonconnective-k-theory-of-a-scheme (TT 7.2 for K^B); in particular K_n(X) ≅ colim_α K_n(X_α) for all n ∈ ℤ (nonconnective). Combined with absolute noetherian approximation (requested from AdicCoefficientsAndComparisons L2), statements about K of noetherian schemes of finite type over ℤ pass to all qcqs schemes.

**Hypotheses.**

- The system is directed with affine transition maps and qcqs terms; no noetherian or flatness hypothesis (contrast G-theory, whose continuity needs flat transition maps, SchemeKTheoryOperations:S.3/g-theory-continuity).
- The nonconnective statement is proved without the Bass fundamental theorem: TT 7.2 reduces to degrees n ≥ 0 by 6.6(d), a result of S.5; here degrees n ≤ 0 come from Schlichting's filtered-colimit lemma instead, so S.2 does not depend on S.5.

**Proof.**

1. Form the diagram of flat-model Waldhausen categories Perf^flat(X_α) with the exact functors f*_{αβ} (SchemeKTheoryOperations:S.2/derived-pullback-perfect, rectified to a strict diagram) and the exact functor from its filtered colimit to Perf^flat(X).
2. K commutes with filtered colimits of Waldhausen categories: the S•-construction, nerves and geometric realisation commute with filtered colimits (TT 3.20.2 proof; GeneralAlgebraicKTheory K.7's filtered-colimit compatibility), so colim K(Perf^flat(X_α)) ≃ K(colim Perf^flat(X_α)).
3. The homotopy category of the filtered colimit is the colimit of the homotopy categories (the calculus of fractions involves finitely many objects and maps), and colim D_perf(X_α) → D_perf(X) is an equivalence (SchemeKTheoryOperations:S.1/perfect-complexes-on-limits); derived invariance (TT 1.9.8, requested from K.4) and SchemeKTheoryOperations:S.2/k-theory-model-invariance give K(X) ≃ colim K(X_α); with supports use part (3) of the same lemma.
4. Nonconnective: π_n 𝕂 = K_n for n ≥ 0 is the connective case; for n ≤ 0, IK_n commutes with filtered colimits of Frobenius pairs (Schlichting 6.3, recorded in K.7), and the map from the colimit of the Frobenius pairs of SchemeKTheoryOperations:S.1/perfect-frobenius-pair to that of X induces an equivalence of derived categories, hence of IK (K.6 derived invariance).

**Acceptance.**

- For A = colim A_i, K_n(A) = colim K_n(A_i).
- For a qcqs scheme X over ℤ, K_n(X) is a filtered colimit of K_n of schemes of finite type over ℤ (with absolute noetherian approximation).

**Depends on.** this roadmap: `S.1/perfect-complexes-on-limits`, `S.1/perfect-frobenius-pair`, `S.2/k-theory-of-a-scheme`, `S.2/derived-pullback-perfect`, `S.2/k-theory-pullback`, `S.2/k-theory-model-invariance`, `S.2/nonconnective-k-theory-of-a-scheme`; other roadmaps: `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`, `GeneralAlgebraicKTheory:K.4`; libraries: `mathlib:AlgebraicGeometry.isAffineHom_π_app`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.20.2, p. 324: “3.20.2. The canonical maps induced by the Lf*_α are homotopy equivalences:” — The connective statement (followed by colim K(X_α) ≃ K(X) and colim K(X_α on Y_α) ≃ K(X on Y)).
- `ThomasonTrobaugh.1990`, Proof of 3.20, p. 324: “The construction of K( ), see 1.5.2 -1.5.3, clearly preserves direct colimits of biWaldhausen categories, and also converts complicial exact functors inducing an equivalence of derived categories into homotopy equivalences of K-theory spectra, by 1.9.8.” — The two ingredients of the proof.
- `ThomasonTrobaugh.1990`, Theorem 7.2 (Continuity), p. 364: “Let X = lim X_α be the limit of an inverse system of schemes X_α in which the bonding maps f_αβ : X_α → X_β are affine. Suppose all the X_α are quasi-compact and quasi-separated.” — The hypotheses of the nonconnective statement for K^B.
- `Schlichting.2003`, Lemma 6.3, p. 13: “Let i ↦ Ai be a functor from a small, filtered index category I to the category of Frobenius pairs. Then colimAi is a Frobenius pair and the natural map” — Filtered colimits of Frobenius pairs, used for the nonpositive degrees.

## S.3 — Supports and localisation

*Coverage: partial.* Planned as far as RS-18's keeps. Support categories Perf_Z(X) and nonconnective K(X on Z) as K.6's IK of the Frobenius-pair model; the Thomason–Trobaugh triangulated input through the Stacks Project's qcqs proofs (extension up to summand, killing morphisms, a supported perfect generator) and Mathlib's Verdier left-localizing criterion; the K_0 extension criterion; the exact sequence of Frobenius pairs and the nonconnective localisation theorem (TT 7.4) with its connective form (TT 5.1); the boundary with its sign pinned (right-linear, ∂λ(π) = +[k]) and the conversion to the left-linear normalisation used by L.2 and E.3; naturality and K_*(X)-linearity; excision for maps that are isomorphisms infinitely near the support (open, étale, completion, henselisation) and disjoint additivity; the affine comparison with K.5's K(R on S) and the divisor comparison with Quillen's H_Z (exact-category localisation for K). G-theory: Coh_Z(X), Gabriel's quotient, dévissage, Quillen's G-localisation, continuity, and the Cartan comparison of the two sequences, which is an equivalence for regular X; hypothesis-qualified dévissage K(X on Z) ≃ G(Z) (≃ K(Z) for regular Z) with the singular and non-reduced non-examples. Applications: λ (loop of a 1 × 1 matrix, from H.1/H.3/K.2:plus only), the DVR sequence and boundary ∂_S, the unit-valuation theorem ∂_S(λ(u)) = v(u)[k] in exactly the form KTheoryLowDegrees U.5/U.6 import (RS-18 owner 13), the boundary on products with a unit, specialisation maps with the corrected change-of-parameter sign, injectivity for algebraically closed fields, the divisor description of the degree-one boundary (Mathlib's Scheme.ord), finite-pushforward naturality, Dedekind domains, one-dimensional schemes and curves, Gillet's Weil reciprocity, and regular arithmetic surfaces with their codimension-two terms and vertical-residue compatibility. The classical tame-symbol formula is not re-planned (RS-18 owners 4-5 are K2SymbolsBrauer T.3's) and cannot be imported (stage cycle: gap and restructure).

- Remaining: Connect S.3/dvr-boundary-on-unit-products to K2SymbolsBrauer T.3/localization-boundary and T.3/tame-symbol once the stage cycle recorded in restructure is removed; until then the identification of ∂_S on all of K_2(L) (including {π, π} = {π, −1}) is a gap.
- Remaining: Requests to GeneralAlgebraicKTheory K.3 (K-book Ex. V.5.1 boundary formula), K.2:plus (Ex. IV.7.9(c) comparison of automorphism classes), K.7 (boundary linearity for biexact pairings), AdicCoefficientsAndComparisons L2 (EGA IV 8.5 approximation of coherent sheaves) and SchemeAndStackFoundations SF.2 (Čech–Koszul computation, Stacks 08DD and 09IR) are open.
- Remaining: SchemeKTheoryOperations S.1 is cited as a stage for 'perfect objects of D_QCoh(O_X) are compact' (Stacks 09M1) in S.3/killing-morphisms-into-supported; the coordinator should resolve it to an S.1 node or S.1 should add one.
- Remaining: K-book Corollary V.6.6.2 (semilocal Dedekind: K_3(F) → ⊕ K_2(R/p) onto) is not planned: its proof lifts Steinberg symbols and needs Matsumoto's theorem (K2SymbolsBrauer T.2, downstream of S.3).
- Remaining: The proofs of S.3/divisor-support-comparison (TT Exercise 5.7, K-book Ex. V.3.16) and of the K-book's boundary formula Ex. V.5.1 are exercises with hints in the sources read.

### Perfect complexes supported on a closed subset

`S.3/perfect-complexes-with-support` · definition

Let X be a scheme and Z ⊆ X a closed subset, with open complement j: U = X ∖ Z → X. Perf_Z(X) is the full subcategory of D_perf(O_X) (SchemeKTheoryOperations S.1/perfect-complex) on the perfect complexes E with j^*E ≅ 0 in D(O_U); equivalently every cohomology sheaf H^i(E) has support contained in Z (Stacks 08DA: E is supported on Z). As an object property of the pretriangulated category D_perf(O_X) it is closed under isomorphisms, shifts, cones and direct summands, so it is a thick triangulated subcategory in Mathlib's sense (ObjectProperty.IsTriangulated, closed under retracts). Its models: the complicial biWaldhausen category of TT 3.1 (perfect complexes of O_X-modules acyclic on X ∖ Z, cofibrations the degreewise split monomorphisms, weak equivalences the quasi-isomorphisms) and the Frobenius sub-pair of S.1/perfect-frobenius-pair on the objects acyclic off Z; both have homotopy category Perf_Z(X). Only the closed subset Z matters, never a scheme structure on it.

**Hypotheses.**

- X a scheme; in the theorems of this layer X is quasi-compact and quasi-separated and U = X ∖ Z is quasi-compact (so Z = |Y| for a finitely presented closed subscheme Y, TT 2.6.1(c)).
- Z is a closed subset of the underlying space; Perf_Z(X) does not depend on a subscheme structure.

**Proof.**

1. Restriction j^*: D(O_X) → D(O_U) along the open immersion is exact and triangulated (EnhancedDerivedSheaves E1: derived pullback of ringed topoi, which for an open immersion is exact restriction) and preserves perfect complexes (S.1/perfect-derived-pullback).
2. Perf_Z(X) is the kernel of j^* on D_perf(O_X); the kernel of a triangulated functor is closed under isomorphisms, shifts and cones (two-out-of-three in a distinguished triangle), and the kernel of an additive functor is closed under direct summands, so it is thick (S.1/perfect-triangulated-and-thick for the ambient thickness).
3. H^i(j^*E) = j^*H^i(E), so j^*E ≅ 0 iff every H^i(E)|_U = 0 iff Supp H^i(E) ⊆ Z (Stacks 08DA).
4. Acyclicity off Z is invariant under quasi-isomorphism and stable under cofibration sequences, so it cuts out a complicial biWaldhausen subcategory of TT 3.1 and a Frobenius sub-pair of S.1/perfect-frobenius-pair; their homotopy categories are Perf_Z(X) by S.1/enhancement-comparison.

**API.**

- `PerfSupport` (data): PerfSupport X Z : ObjectProperty (D_perf X), E ↦ (E|_{X∖Z} ≅ 0).
- `PerfSupport.isTriangulated` (instance): PerfSupport X Z is a triangulated subcategory closed under isomorphisms.
- `PerfSupport.isClosedUnderRetracts` (instance): Direct summands of objects of Perf_Z(X) lie in Perf_Z(X).
- `PerfSupport.mem_iff_support` (characterisation): E ∈ Perf_Z(X) iff Supp H^i(E) ⊆ Z for all i ∈ ℤ.
- `PerfSupport.mono` (relation): Z ⊆ Z' implies Perf_Z(X) ≤ Perf_{Z'}(X).
- `PerfSupport.inf` (simp): Perf_Z(X) ⊓ Perf_W(X) = Perf_{Z∩W}(X).
- `PerfSupport.univ` (simp): Perf_X(X) = D_perf(O_X).
- `PerfSupport.empty` (simp): E ∈ Perf_∅(X) iff E ≅ 0.
- `PerfSupport.pullback` (functoriality): For f: X' → X, Lf^* maps Perf_Z(X) into Perf_{f^{-1}Z}(X'); restriction to an open V maps Perf_Z(X) into Perf_{Z∩V}(V).
- `PerfSupport.tensor` (structure): E ∈ Perf_Z(X), F ∈ Perf_W(X) imply E ⊗^L F ∈ Perf_{Z∩W}(X) (S.1/perfect-derived-tensor).
- `PerfSupport.affine_iff` (compatibility): On X = Spec A with Z = V(I), E = M~ lies in Perf_Z(X) iff every H^i(M) has Module.support inside V(I) (S.1/affine-perfect-comparison).
- `PerfSupport.cone_mem` (example): For s ∈ Γ(X, O_X), cone(s: O_X → O_X) ∈ Perf_{V(s)}(X).

**Unit tests.**

- `PerfSupport.univ_eq` (degenerate): Perf_X(X) is all of D_perf(O_X); Perf_∅(X) contains only zero objects.
- `PerfSupport.dvr_cone` (computation): On X = Spec ℤ_(p) with Z the closed point: cone(p: O_X → O_X) ∈ Perf_Z(X) with H^0 = 𝔽_p, while O_X ∉ Perf_Z(X) since its restriction to Spec ℚ is ℚ ≠ 0.
- `PerfSupport.residue_field_not_perfect` (non-example): On X = Spec k[ε]/(ε²), Z = X: the residue field k in degree 0 is supported on Z but is not in Perf_Z(X), because k has infinite projective dimension over k[ε]/(ε²); a definition by supports of cohomology alone, without perfectness, would contain it.
- `PerfSupport.affine_support` (compatibility): On X = Spec A and a ∈ A: cone(a) ∈ Perf_{V(a)}(X) and Module.support(A/aA) = V(a), agreeing with Mathlib's Module.support.

**Acceptance.**

- Perf_X(X) = D_perf(O_X) and Perf_∅(X) consists of the zero objects.
- Perf_Z(X) is an ObjectProperty.IsTriangulated subcategory closed under isomorphisms and retracts, so Mathlib's Verdier localisation D_perf(X)/Perf_Z(X) (ObjectProperty.trW) is available.

**Used by.**

- Thomason–Trobaugh 3.1, 5.2, 7.4: the fibre term of the localisation sequence is the K-theory of this category
- S.3/support-k-theory: K(X on Z) is IK of its Frobenius-pair model
- S.3/excision and S.3/infinitely-near-equivalence: Lf^* and Rf_* restrict to inverse equivalences between support categories
- S.4/codimension-support-filtration: the coniveau tower is built from Perf_Z(X) over closed Z of codimension ≥ p
- MotivicEtaleKTheory M.6a (RS-18: ordinary support infrastructure imported from S.4): support categories on actual K-theory spectra

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/perfect-triangulated-and-thick`, `S.1/perfect-derived-pullback`, `S.1/perfect-frobenius-pair`, `S.1/enhancement-comparison`; other roadmaps: `EnhancedDerivedSheaves:E1/enhanced-derived-category`; libraries: `mathlib:CategoryTheory.ObjectProperty.IsTriangulated`, `mathlib:CategoryTheory.ObjectProperty.trW`, `mathlib:AlgebraicGeometry.Scheme.Modules`.

**Sources.**

- `ThomasonTrobaugh.1990`, Definition 3.1 (p. 313): “For Y a closed subspace of X, K(X on Y) is the K-theory spectrum of the complicial biWaldhausen subcategory of those perfect complexes on X which are acyclic on X − Y.” — The support category: perfect complexes acyclic off the closed subspace; only the subspace matters.
- `Stacks.perfect.2026`, Remark 38.9 (tag 0FDN): “Consider the strictly full, saturated, triangulated subcategory DZ,perf(OX) ⊂D(OX) consisting of perfect complexes of OX-modules whose cohomology sheaves are set- theoretically supported on Z.” — The same subcategory, described by supports of cohomology sheaves.
- `Stacks.perfect.2026`, Definition 6.1 (tag 08DA): “Let X be a scheme. Let E be an object of D(OX). Let T ⊂X be a closed subset. We say E is supported on T if the cohomology sheaves Hi(E) are supported on T.” — The support condition used in the characterisation.

### K-theory with supports

`S.3/support-k-theory` · construction · planet “K-theory with supports”

For a quasi-compact quasi-separated scheme X and a closed subset Z ⊆ X with X ∖ Z quasi-compact, K(X on Z) is the nonconnective K-theory spectrum IK (GeneralAlgebraicKTheory K.6, Schlichting's IK of a Frobenius pair) of the Frobenius-pair model of Perf_Z(X) (S.3/perfect-complexes-with-support), and K_n(X on Z) := π_n K(X on Z) for n ∈ ℤ. The inclusion Perf_Z(X) ⊆ Perf(X) gives K(X on Z) → K(X), where K(X) is S.2/nonconnective-k-theory-of-a-scheme; K(X on X) = K(X) and K(X on ∅) ≃ 0. For n ≥ 0 the groups agree with the Waldhausen K-groups of Thomason–Trobaugh's complicial biWaldhausen category of perfect complexes acyclic off Z (TT 3.1), K_0 included, because Perf_Z(X) is a thick subcategory of the idempotent complete D_perf(O_X). Pullback f^*: K(X on Z) → K(X' on Z') for f: X' → X with f^{-1}(Z) ⊆ Z', enlargement K(X on Z) → K(X on Z') for Z ⊆ Z', and the pairing K(X on Z) ∧ K(X on W) → K(X on Z ∩ W) from the derived tensor product are part of the construction. This spectrum is the fibre term; the Bass-style K^B(X on Z) of TT 6.4 is not used as a definition (its construction needs the projective bundle theorem of S.5), and the comparison is recorded in the API.

**Hypotheses.**

- X quasi-compact and quasi-separated; Z ⊆ X closed with X ∖ Z quasi-compact.
- Nonconnective K-theory is K.6's IK of Frobenius pairs; the model of Perf(X) is S.1/perfect-frobenius-pair, the same one S.2 uses for K(X).

**Proof.**

1. Restrict the Frobenius pair (Perf(X), acyclics) of S.1/perfect-frobenius-pair to the full subcategory of complexes acyclic off Z: it is closed under the Frobenius structure (conflations and projective-injectives are the degreewise split ones), so it is a Frobenius pair with derived category Perf_Z(X) (S.3/perfect-complexes-with-support).
2. Apply K.6's IK construction (GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance) to obtain the spectrum and its homotopy groups in all degrees.
3. Agreement in degrees n ≥ 0: π_n IK = K_n of the Frobenius pair for n > 0 and π_0 IK = K_0 of the idempotent completion of the derived category (same K.6 node); Perf_Z(X) is thick in D_perf(O_X), which is idempotent complete (S.1/perfect-idempotent-complete), so it is idempotent complete and π_0 = K_0; the Frobenius-pair and TT biWaldhausen models have equivalent homotopy categories (S.1/enhancement-comparison), so the connective parts agree by K.4 approximation (GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem).
4. Functoriality: Lf^* on flat models (S.2/derived-pullback-perfect) is a map of Frobenius pairs sending Perf_Z(X) into Perf_{Z'}(X') (support condition: (Lf^*E)|_{X'∖f^{-1}Z} = Lf^*(E|_{X∖Z}) = 0); the forgetful inclusion for Z ⊆ Z' and the derived tensor product (S.1/perfect-derived-tensor, S.2/tensor-product-pairings, K.7 biexact pairings) give the enlargement maps and the pairing.

**API.**

- `supportKTheory` (data): K(X on Z), a spectrum; K_n(X on Z) := π_n K(X on Z), n ∈ ℤ.
- `supportKTheory.toK` (projection): The map K(X on Z) → K(X) induced by Perf_Z(X) ⊆ Perf(X).
- `supportKTheory.class` (constructor): For E ∈ Perf_Z(X), [E] ∈ K_0(X on Z), additive in distinguished triangles and [E[1]] = −[E].
- `supportKTheory.univ` (simp): K(X on X) ≃ K(X) compatibly with toK.
- `supportKTheory.empty` (simp): K(X on ∅) ≃ 0.
- `supportKTheory.pullback` (functoriality): f^*: K(X on Z) → K(X' on Z') for f^{-1}(Z) ⊆ Z', with id^* = id and (fg)^* ≃ g^* f^*.
- `supportKTheory.enlarge` (functoriality): For Z ⊆ Z', K(X on Z) → K(X on Z') compatible with toK and with pullback.
- `supportKTheory.pairing` (structure): K(X on Z) ∧ K(X on W) → K(X on Z ∩ W), associative and commutative up to coherent homotopy (TT 3.15.4); K(X on Z) is a K(X)-module spectrum.
- `supportKTheory.pushforward` (functoriality): For f: X' → X proper and perfect between noetherian schemes with f(Z') ⊆ Z, Rf_* induces K(X' on Z') → K(X on Z) (TT 3.16.7; S.2/k-theory-proper-pushforward).
- `supportKTheory.connective_comparison` (compatibility): For n ≥ 0, K_n(X on Z) equals the Waldhausen K_n of TT's category of perfect complexes acyclic off Z.

**Unit tests.**

- `supportKTheory.empty_vanishes` (degenerate): K_n(X on ∅) = 0 for all n ∈ ℤ.
- `supportKTheory.univ_eq` (degenerate): K_n(X on X) = K_n(X) for all n ∈ ℤ.
- `supportKTheory.dvr_K0` (computation): X = Spec ℤ_(p), Z = closed point: K_0(X on Z) ≅ ℤ with [cone(p)] ↦ 1 and [cone(p^n)] ↦ n.
- `supportKTheory.not_K_of_subscheme` (non-example): X = A¹_k, Z = V(x²): K_1(X on Z) ≅ K_1(k) = k^× (S.3/regular-support-devissage; only |Z| = {0} matters), whereas K_1(k[x]/(x²)) = (k[x]/(x²))^× ≅ k^× × k (KTheoryLowDegrees U.3/SK1-local); defining K(X on Z) as K(Z) fails here.
- `supportKTheory.affine_compat` (compatibility): X = Spec R, Z = V(s): K_n(X on Z) ≅ K_n(R on {s^m}) of GeneralAlgebraicKTheory K.5 (S.3/affine-support-comparison).

**Acceptance.**

- K_n(X on ∅) = 0 and K_n(X on X) = K_n(X) for every n ∈ ℤ.
- For X = Spec O with O a DVR and Z the closed point, K_0(X on Z) ≅ ℤ generated by [cone(π)] (S.3/regular-support-devissage).
- K(X on Z) depends on the closed subset only: K(X on |Y|) is the same for every subscheme structure Y on Z.

**Used by.**

- Thomason–Trobaugh 7.4 and K-book V.7.6: the fibre term of the localisation fibre sequence
- S.4/codimension-support-filtration and S.4/zariski-descent: the coniveau tower S^pK and the Zariski/Nisnevich descent proofs use K(X on Z) and excision
- KTheoryLowDegrees U.5 (imports the DVR boundary): K(Spec O on closed point) is the fibre K(k) of the DVR sequence
- EllipticKTheory E.3/E.6: support K-theory of closed fibres and closed points of curves and arithmetic surfaces

**Depends on.** this roadmap: `S.3/perfect-complexes-with-support`, `S.1/perfect-frobenius-pair`, `S.1/perfect-idempotent-complete`, `S.1/enhancement-comparison`, `S.1/perfect-derived-tensor`, `S.2/nonconnective-k-theory-of-a-scheme`, `S.2/derived-pullback-perfect`, `S.2/tensor-product-pairings`; other roadmaps: `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`, `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`.

**Sources.**

- `ThomasonTrobaugh.1990`, Definition 3.1 (p. 313): “For Y a closed subspace of X, K(X on Y) is the K-theory spectrum of the complicial biWaldhausen subcategory of those perfect complexes on X which are acyclic on X − Y.” — The connective support K-theory whose nonnegative homotopy groups this construction recovers.
- `Kbook.2013`, Definition V.7.6.3 (PDF p. 434): “Let us deﬁne the (non-connective) spectrum KB(X on Z) to be the homotopy ﬁber of the morphism KB(X) →KB(X −Z). Then Theorem 7.6 states that the K-theory spectrum K(X on Z) of Chperf,Z(X) is the (−1)- connected cover of KB(X on Z).” — The nonconnective support spectrum and its connective cover; here the nonconnective spectrum is IK of the support category, identified with this fibre by S.3/localisation-fibre-sequence.
- `ThomasonTrobaugh.1990`, 3.15 (pp. 318-319): “Moreover K(X on Y) has a commutative and associative multiplication up to "coherent homotopy," but fails to have a unit when X ≠ Y.” — The pairing on support K-theory from the tensor product.

### Extending perfect complexes from a quasi-compact open of an affine scheme

`S.3/affine-extension-of-perfect` · lemma

Let X = Spec A be affine, U ⊆ X a quasi-compact open and T ⊆ X a closed subset with X ∖ T quasi-compact. (a) For every perfect F in D(O_U) there are r ∈ ℤ and a finite locally free O_U-module 𝓕 with 𝓕[−r] ⊕ F the restriction of a perfect object of D(O_X) (Stacks 08EG). (b) F ⊕ F[1] is the restriction of a perfect object of D(O_X) (Stacks 08EI). (c) If F is supported on T ∩ U, then F ⊕ F[1] is the restriction of a perfect object E of D(O_X) supported on T (Stacks 08EK).

**Hypotheses.**

- X affine; U quasi-compact open; T closed with X ∖ T quasi-compact, so T = V(g_1, …, g_s).

**Proof.**

1. (a) Represent F by a bounded above complex F^• of finite free A-modules restricted to U (Stacks 08EE: approximation of pseudo-coherent objects by finite free complexes over the affine X); F has tor amplitude in some [a, b] as U is quasi-compact; for r < a the kernel 𝓕 = Ker(F^r → F^{r+1})|_U is flat and finitely presented, hence finite locally free, and the stupid truncation P = (F^r → F^{r+1} → ⋯) is perfect on X with a triangle P|_U → F → 𝓕[−r−1]; the connecting map F → 𝓕[−r−1] vanishes for r ≪ 0 by the Ext-vanishing Lemma 08EF/09M4, giving P|_U ≅ 𝓕[−r−2] ⊕ F.
2. (b) Take E as in (a) with E|_U = 𝓕[r] ⊕ F; by S.3/affine-lifting-of-morphisms find a map α: E_1 → E of perfect complexes with E_1|_U ≅ E|_U and α|_U = id_{𝓕[r]} ⊕ 0; cone(α)|_U ≅ F ⊕ F[1].
3. (c) After replacing g_j by powers, multiplication by g_j is zero on F (S.3/affine-lifting-of-morphisms, part (b)); take E as in (b) and form iterated cones C_1 = cone(g_1: E → E), C_{j+1} = cone(g_{j+1}: C_j → C_j); each g_j acts by a square-zero map, C_s is perfect and supported on T, and C_s|_U = F ⊕ F[1]^{⊕s} ⊕ ⋯ ⊕ F[s]; a second application of S.3/affine-lifting-of-morphisms kills every summand except F ⊕ F[1] and the cone of the resulting map is the required E.

**Acceptance.**

- On X = Spec k[x, y], U = X ∖ {0}, T = X: the restriction O_U is itself extendable (O_X), and (b) produces O_U ⊕ O_U[1] as the restriction of cone(0: O_X → O_X).
- The support clause fails without the square-zero reduction: a perfect extension of F need not be supported on T until the g_j are killed.

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/perfect-triangulated-and-thick`, `S.1/affine-derived-equivalence`, `S.1/affine-perfect-comparison`, `S.1/tor-amplitude`, `S.1/pseudo-coherent-complex`, `S.3/affine-lifting-of-morphisms`, `S.3/perfect-complexes-with-support`.

**Sources.**

- `Stacks.perfect.2026`, Lemma 36.13.6 (tag 08EG): “For every perfect object E of D(OU) there exists an integer r and a finite locally free sheaf F on U such that F[−r] ⊕E is the restriction of a perfect object of D(OX).” — Part (a).
- `Stacks.perfect.2026`, Lemma 36.13.8 (tag 08EI): “For every perfect object F of D(OU) the object F ⊕F[1] is the restriction of a perfect object of D(OX).” — Part (b).
- `Stacks.perfect.2026`, Lemma 36.13.10 (tag 08EK): “For every perfect object F of D(OU) supported on T ∩U the object F ⊕F[1] is the restriction of a perfect object E of D(OX) supported in T.” — Part (c), with supports.

### Lifting morphisms from a quasi-compact open of an affine scheme

`S.3/affine-lifting-of-morphisms` · lemma

Let X = Spec A be affine and U ⊆ X a quasi-compact open. (a) For E, E' in D_QCoh(O_X) with E perfect and every α: E|_U → E'|_U there are maps E ←β− E_1 −γ→ E' with E_1 perfect, β|_U an isomorphism and α = γ|_U ∘ (β|_U)^{-1}; moreover E_1 = E ⊗^L I for a perfect complex I on X (Stacks 08EH). (b) For X quasi-compact and quasi-separated, f ∈ Γ(X, O_X) and α: E → E' in D_QCoh(O_X) with E perfect and E' supported on V(f), some power f^n satisfies f^n α = 0 (Stacks 08EJ).

**Hypotheses.**

- (a): X affine, U = D(f_1) ∪ ⋯ ∪ D(f_r) quasi-compact open.
- (b): X quasi-compact and quasi-separated.

**Proof.**

1. (a) Represent E by a finite complex M^• of finite projective A-modules and E' by a complex (M')^• (S.1/affine-derived-equivalence, S.1/affine-perfect-comparison); α is a class s ∈ H^0(U, RHom(E, E')); by the Čech–Koszul comparison colim_e Hom^•(I^•(f_1^e, …, f_r^e), H^•) ≅ RΓ(U, RHom(E, E')) (Stacks 08DD, requested from SchemeAndStackFoundations SF.2) s comes from ξ: I^•(f_1^e, …, f_r^e) → H^• = Hom_A(M^•, (M')^•) for some e; set E_1 = Tot(I^• ⊗_A M^•), β induced by the augmentation I^• → A (an isomorphism on U) and γ by ξ.
2. (b) By Mayer–Vietoris for morphisms in D(O_X) and the induction principle over affine covers, reduce to X = Spec A affine; represent E by a finite complex of finite projectives and reduce by stupid truncations to E = P[0] with P finite projective; then α is a map P → H^0(M^•) into a module every element of which is killed by a power of f, and P is finitely generated.

**Acceptance.**

- For X = Spec k[x], U = D(x), E = E' = O_X and α = x^{-1} on U: E_1 = x·O_X ≅ O_X with β the inclusion and γ the identification, so α = γ ∘ β^{-1} on U.
- Part (b) for f = p on Spec ℤ and E' = ℤ/p^2: the map ℤ → ℤ/p^2 is killed by p^2.

**Depends on.** this roadmap: `S.1/perfect-complex`, `S.1/affine-derived-equivalence`, `S.1/affine-perfect-comparison`, `S.1/perfect-derived-tensor`; other roadmaps: `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `Stacks.perfect.2026`, Lemma 36.13.7 (tag 08EH): “For every map α : E|U →E′|U there exist maps E β ←−E1 γ−→E′ of complexes on X with E1 perfect such that β : E1 →E restricts to an isomorphism on U and such that α = γ|U ◦β|−1 U . Moreover we can assume E1 = E ⊗L OX I” — Part (a); the excerpt drops the final 'for some perfect complex I on X'.
- `Stacks.perfect.2026`, Lemma 36.13.9 (tag 08EJ): “For any morphism α : E →E′ in DQCoh(OX) such that (1) E is perfect, and (2) E′ is supported on T = V (f) there exists an n ≥0 such that f nα = 0.” — Part (b).

### Thomason's extension lemma: perfect complexes extend up to a direct summand

`S.3/extension-up-to-summand` · lemma

Let X be quasi-compact and quasi-separated, U ⊆ X a quasi-compact open and T ⊆ X closed with X ∖ T quasi-compact. Let E ∈ D_QCoh(O_X) and let α: P → E|_U be a map with P perfect on U and supported on T ∩ U. Then there are a perfect R on X supported on T and β: R → E such that P is a direct summand of R|_U in D(O_U), compatibly with α and β|_U; moreover R|_U ≅ P ⊕ P^{⊕n_1}[1] ⊕ ⋯ ⊕ P^{⊕n_m}[m]. In particular (E = Rj_*P, or Stacks 09IQ) every perfect complex on U supported on T ∩ U is a direct summand of the restriction of a perfect complex on X supported on T (TT 5.5.1 without supports; TT 5.5.5 and 5.6.1(a) with supports).

**Hypotheses.**

- X quasi-compact and quasi-separated; U quasi-compact open; T closed with X ∖ T quasi-compact (hence retrocompact).

**Proof.**

1. Write X = U ∪ V_1 ∪ ⋯ ∪ V_m with V_j affine; by induction on m reduce to X = U ∪ V with V affine.
2. On the affine V, S.3/affine-extension-of-perfect(c) gives Q perfect on V supported on T ∩ V with Q|_{U∩V} ≅ (P ⊕ P[1])|_{U∩V}.
3. By S.3/affine-lifting-of-morphisms(a), after replacing Q by Q ⊗^L I (still supported on T ∩ V), the composite Q|_{U∩V} ≅ (P ⊕ P[1])|_{U∩V} → P|_{U∩V} → E|_{U∩V} lifts to Q → E|_V.
4. Glue: Mayer–Vietoris for objects and morphisms of D(O_X) along X = U ∪ V (homotopy pullback in the stable enhancement of EnhancedDerivedSheaves E1) gives a: R → E with a|_U ≅ (P ⊕ P[1] → E|_U) and a|_V ≅ (Q → E|_V); R is perfect (perfectness is local, S.1/perfect-local-and-invariant) and supported on T.

**Acceptance.**

- For X = A²_k, U = X ∖ {0} and T = X: P = O_U is the restriction of O_X, and the construction may return R with R|_U = O_U ⊕ O_U[1]; the lemma never asserts that P itself extends (that is S.3/extension-k0-criterion).
- R|_U has the same top cohomology sheaf as P (Stacks Remark 13.12).

**Depends on.** this roadmap: `S.3/affine-extension-of-perfect`, `S.3/affine-lifting-of-morphisms`, `S.3/perfect-complexes-with-support`, `S.1/perfect-local-and-invariant`, `S.2/total-direct-image-qcqs`; other roadmaps: `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Sources.**

- `Stacks.perfect.2026`, Lemma 36.13.11 (tag 09IM): “Let α : P →E|U be a map where P is a perfect object of D(OU) supported on T ∩U. Then there exists a map β : R →E where R is a perfect object of D(OX) supported on T such that P is a direct summand of R|U in D(OU) compatible α and β|U.” — The statement, for X qcqs, U quasi-compact open and X ∖ T retrocompact.
- `ThomasonTrobaugh.1990`, Lemma 5.5.1 (p. 343): “Then for every perfect complex F· on U, there exists a perfect complex E· on X such that F· is isomorphic to a summand of j*E· in the derived category D(OU-Mod).” — The original statement, first for X with an ample family of line bundles; TT 5.6 removes that hypothesis.
- `ThomasonTrobaugh.1990`, 5.5.2 (p. 343): “Despite the flagrant triviality of the proof of 5.5.1, this result is the key point in the paper.” — Its role in the localisation theorem.

### A single perfect generator for complexes supported on a closed subset

`S.3/supported-perfect-generator` · lemma

Let X be quasi-compact and quasi-separated and T ⊆ X closed with X ∖ T quasi-compact. Then the triangulated category D_QCoh,T(O_X) of complexes with quasi-coherent cohomology supported on T is generated by a single perfect object G ∈ Perf_T(X): if E ∈ D_QCoh,T(O_X) and Hom(G[n], E) = 0 for all n ∈ ℤ then E ≅ 0 (Rouquier; Stacks 0A9A). On an affine X = Spec A with T = V(f_1, …, f_r) the Koszul complex K(f_1, …, f_r) is such a generator.

**Hypotheses.**

- X quasi-compact and quasi-separated; T closed with X ∖ T quasi-compact.

**Proof.**

1. Induction principle for qcqs schemes (prove it for affine X and for X = U ∪ V with V affine, U quasi-compact, when it holds for U): the induction principle is Stacks Cohomology of Schemes, Lemma 4.1, a formal induction on the number of affines.
2. Affine case: with j: U = X ∖ T → X, the Koszul complex K on f_1, …, f_r is perfect and supported on T, and for E ∈ D_QCoh(O_X), E ≅ Rj_*(E|_U) iff Hom(K[n], E) = 0 for all n (Stacks 09IR, Bökstedt–Neeman), proved with the Koszul complexes of the powers f_i^e and the Čech comparison of Stacks 08DD (requested from SchemeAndStackFoundations SF.2); for E supported on T this gives E = Rj_*(0) = 0.
3. Induction step: given a generator P of D_QCoh,T∩U(O_U), S.3/extension-up-to-summand gives Q ∈ Perf_T(X) with P a summand of Q|_U; with V = Spec B and Z ∩ T = V(g_1, …, g_s) (Z = X ∖ U), the extension by zero K' of the Koszul complex of the g_j is perfect on X; then Q ⊕ K' generates, using Hom(K'[n], E) = Hom(K[n], E|_V) and the affine case on V.

**Acceptance.**

- X = Spec ℤ_(p), T = closed point: G = cone(p: O → O) ≅ 𝔽_p[0] generates D_QCoh,T; for the torsion module E = ℤ[1/p]/ℤ, supported on T, Hom(G, E) = Hom(𝔽_p, ℤ[1/p]/ℤ) ≅ 𝔽_p ≠ 0, as generation requires.
- For T = X the statement specialises to the existence of a perfect generator of D_QCoh(O_X) (Bondal–van den Bergh), which S.1/perfect-essentially-small uses.

**Depends on.** this roadmap: `S.3/extension-up-to-summand`, `S.3/perfect-complexes-with-support`, `S.1/perfect-complex`, `S.1/affine-derived-equivalence`, `S.2/total-direct-image-qcqs`; other roadmaps: `SchemeAndStackFoundations:SF.2`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

**Sources.**

- `Stacks.perfect.2026`, Lemma 36.15.4 (tag 0A9A): “Let X be a quasi-compact and quasi-separated scheme. Let T ⊂X be a closed subset such that X \ T is quasi-compact. With notation as above, the category DQCoh,T (OX) is generated by a single perfect object.” — The statement.
- `Stacks.perfect.2026`, Lemma 36.15.2 (tag 09IR): “For E ∈DQCoh(OX) the following are equivalent (1) E = Rj∗(E|U), and (2) HomD(OX)(K[n], E) = 0 for all n ∈Z.” — The affine Koszul input, for the Koszul complex K on f_1, …, f_r with U = D(f_1) ∪ ⋯ ∪ D(f_r).

### Killing morphisms from perfect complexes into complexes supported off an open

`S.3/killing-morphisms-into-supported` · lemma

Let X be quasi-compact and quasi-separated, T ⊆ X closed with U = X ∖ T quasi-compact, and α: P → E a morphism in D_QCoh(O_X) with P perfect and E supported on T (or P pseudo-coherent and E supported on T and bounded below). Then there are a perfect complex I and a map I → O_X[0] whose restriction to U is an isomorphism, such that the composite I ⊗^L P → P → E is zero (Stacks 0A9C). Consequently the cone Q of I ⊗^L P → P is perfect, supported on T, and α factors through P → Q.

**Hypotheses.**

- X quasi-compact and quasi-separated; T closed with X ∖ T quasi-compact.

**Proof.**

1. K := RHom(P, E) lies in D_QCoh,T(O_X): quasi-coherent by Stacks 36.10.8 (P perfect or pseudo-coherent with E bounded below) and supported on T since RHom commutes with restriction to opens; α is a class in H^0(K) = Hom(O_X[0], K), so it suffices to treat α: O_X[0] → K.
2. Choose a perfect generator G of D_QCoh,T(O_X) (S.3/supported-perfect-generator) and write K = hocolim K_n with K_n built from finite sums of shifts of G (compactly generated triangulated categories: EnhancedDerivedSheaves E1, filtered homotopy colimits and presentability); the inclusion D_QCoh,T → D(O_X) commutes with sums, so K = hocolim K_n in D(O_X).
3. O_X is compact in D_QCoh(O_X) (perfect objects are compact; SchemeKTheoryOperations S.1), so α factors through some K_n, and then through an object Q of the thick subcategory generated by G: Q is perfect and supported on T.
4. Complete O_X[0] → Q to a triangle I → O_X[0] → Q → I[1]: I is perfect, I|_U → O_U is an isomorphism because Q|_U = 0, and I → O_X → K is zero because α factors through Q; tensoring with P gives the stated form.

**Acceptance.**

- For X = Spec k[x], T = {0}, P = O_X and E = k (skyscraper) with α the reduction map: I = x·O_X ≅ O_X[0] → O_X kills α, and Q = cone(x) ≅ k.
- The cone Q of I ⊗ P → P lies in Perf_T(X) ∩ Perf_Z(X) whenever P ∈ Perf_Z(X), since tensoring preserves supports.

**Depends on.** this roadmap: `S.3/supported-perfect-generator`, `S.3/perfect-complexes-with-support`, `S.1/perfect-complex`, `S.1/pseudo-coherent-complex`, `S.1/perfect-derived-tensor`, `S.1/perfect-essentially-small`, `S.2/perfect-iff-compact`; other roadmaps: `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

**Sources.**

- `Stacks.perfect.2026`, Lemma 36.17.5 (tag 0A9C): “Then there exists a perfect complex of OX-modules I and a map I →OX[0] such that I ⊗L P →E is zero and such that I|U →OU[0] is an isomorphism.” — The conclusion, for α: P → E with P perfect and E supported on T (or the pseudo-coherent variant).
- `Stacks.perfect.2026`, Proposition 36.17.1 (tag 09M1): “Let X be a quasi-compact and quasi-separated scheme. An object of DQCoh(OX) is compact if and only if it is perfect.” — The compactness of O_X and of perfect objects used in the proof.

### Restriction to an open induces a fully faithful functor on the Verdier quotient

`S.3/restriction-quotient-fully-faithful` · lemma

Let X be quasi-compact and quasi-separated, j: U → X a quasi-compact open with complement Y, and Z ⊆ X closed with X ∖ Z quasi-compact. Then j^* induces a fully faithful triangulated functor Perf_Z(X)/Perf_{Z∩Y}(X) → Perf_{Z∩U}(U) on the Verdier quotient (Mathlib's localisation at ObjectProperty.trW). Equivalently (TT 5.2.3, 5.2.4): (a) every map b: j^*E → j^*E' in D(O_U) between restrictions of objects of Perf_Z(X) is j^*a' ∘ (j^*a)^{-1} for a roof E ←a− E'' −a'→ E' with E'' ∈ Perf_Z(X) and j^*a an isomorphism; (b) if a, b: E → E' agree on U there is c: E'' → E with j^*c an isomorphism and ac = bc.

**Hypotheses.**

- X quasi-compact and quasi-separated; U quasi-compact open with complement Y; Z closed with X ∖ Z quasi-compact.

**Proof.**

1. Work in the pretriangulated C = D_QCoh(O_X) with A = Perf_Z(X) and B = D_QCoh,Y(O_X) (objects supported on Y), both triangulated and B closed under isomorphisms; A ⊓ B = Perf_{Z∩Y}(X).
2. A is left B-localizing in Mathlib's sense (ObjectProperty.IsVerdierLeftLocalizing): a map f: P → E with P ∈ A and E ∈ B factors through the cone Q ∈ A ⊓ B of I ⊗^L P → P given by S.3/killing-morphisms-into-supported (Q is supported on Y since I → O_X is an isomorphism on U, and on Z since P is).
3. Mathlib's instances for left-localizing triangulated subcategories (the localized functor of ObjectProperty.triangulatedLocalizerMorphism is full and faithful) make A/(A ⊓ B) → C/B fully faithful.
4. C/B ≃ D_QCoh(O_U) through j^*: j^* kills B, and Rj_*: D_QCoh(O_U) → D_QCoh(O_X) (S.2/total-direct-image-qcqs) is a fully faithful right adjoint with j^*Rj_* ≅ id, so j^* is the Verdier localisation at B (EnhancedDerivedSheaves E1 adjunction for the open immersion).
5. The composite lands in Perf_{Z∩U}(U) (S.1/perfect-derived-pullback), giving the fully faithful functor; (a) and (b) are the unravelled fullness and faithfulness in the calculus of fractions.

**Acceptance.**

- For X = Spec ℤ_(p), U = Spec ℚ, Z = X: Hom_{Perf(X)/Perf_Y(X)}(O, O) = ℤ_(p)[1/p] = ℚ = Hom_{Perf(ℚ)}(ℚ, ℚ).
- The functor is not essentially surjective in general: that failure is measured by K_0 (S.3/extension-k0-criterion), and every object is a summand of one in the image (S.3/extension-up-to-summand).

**Depends on.** this roadmap: `S.3/killing-morphisms-into-supported`, `S.3/perfect-complexes-with-support`, `S.1/perfect-derived-pullback`, `S.2/total-direct-image-qcqs`; other roadmaps: `EnhancedDerivedSheaves:E1/enhanced-derived-category`; libraries: `mathlib:CategoryTheory.ObjectProperty.IsVerdierLeftLocalizing`, `mathlib:CategoryTheory.ObjectProperty.triangulatedLocalizerMorphism`, `mathlib:CategoryTheory.ObjectProperty.isVerdierLeftLocalizing_iff`, `mathlib:CategoryTheory.ObjectProperty.trW`.

**Sources.**

- `ThomasonTrobaugh.1990`, Proposition 5.2.3 (pp. 338-339): “(a) For any two perfect complexes E· and E'· on X, and for any map b : j*E· → j*E'· in the derived category on U, D(OU-Mod), there is a perfect complex E''· on X and maps a : E''· → E·, a' : E''· → E'· in the derived category on X” — Fullness, in TT's form (continued: j*a an isomorphism and b · j*a = j*a').
- `ThomasonTrobaugh.1990`, Proposition 5.2.4 (p. 339): “Suppose that a, b : E· → E'· are two maps in the derived category on X, D(OX-Mod), such that j*a = j*b in D(OU-Mod) on U. Then there is a perfect complex E''· on X, and a map c : E''· → E· in D(OX-Mod), such that ac = bc” — Faithfulness, in TT's form (continued: j*(c) an isomorphism).
- `Kbook.2013`, Theorem V.7.7 (PDF p. 434): “Theorem 7.7. w−1Chperf(X) →w−1B is an equivalence of triangulated cate- gories.” — The K-book's statement of the same result, quoted from TT 5.2.2-5.2.4 with its proof omitted as 'beyond the level of this book'.

### Which perfect complexes extend: the K_0 criterion

`S.3/extension-k0-criterion` · lemma

Let X be quasi-compact and quasi-separated, j: U → X a quasi-compact open and Z ⊆ X closed with X ∖ Z quasi-compact. A perfect complex F on U acyclic on U ∖ (U ∩ Z) is isomorphic in D(O_U) to j^*E for some E ∈ Perf_Z(X) if and only if its class [F] ∈ K_0(U on U ∩ Z) lies in the image of K_0(X on Z) (TT 5.2.2; for Z = X: F extends iff [F] ∈ im(K_0(X) → K_0(U))). The obstruction [F] mod im K_0(X on Z) is the image of [F] under the boundary K_0(U on U ∩ Z) → K_{−1}(X on Y ∩ Z) (S.3/localisation-boundary).

**Hypotheses.**

- X quasi-compact and quasi-separated; U quasi-compact open; Z closed with X ∖ Z quasi-compact.

**Proof.**

1. Two out of three (TT 5.5.3): if two of the vertices of a distinguished triangle in Perf_{Z∩U}(U) are isomorphic to restrictions of objects of Perf_Z(X), so is the third: rotate, lift the map between the two extendable vertices to a map E_1 → E_2 on X (S.3/restriction-quotient-fully-faithful, fullness) and take its cone.
2. Grayson's cofinality argument (TT 5.5.4): let π be the monoid of isomorphism classes of Perf_{Z∩U}(U) under ⊕ modulo the classes of restrictions; by S.3/extension-up-to-summand every F has F' with F ⊕ F' extendable, so π is a group; using two-out-of-three, (G) = 0 in π iff G is extendable, and π satisfies the triangle relations, so π = K_0(U on U ∩ Z)/im K_0(X on Z) by the presentation of K_0 of a triangulated category (S.2/k-zero-of-a-scheme applied to the support categories).
3. Hence F extends iff [F] maps to 0 in K_0(U on U∩Z)/im K_0(X on Z); the identification of this cokernel with a subgroup of K_{−1}(X on Y∩Z) is the exactness of S.3/localisation-fibre-sequence at K_0(U on U∩Z).

**Acceptance.**

- For X regular noetherian and U ⊆ X open, K_0(X) → K_0(U) is onto (G_0 localisation is right exact, S.3/g-theory-localisation, and K = G), so every perfect complex on U extends to X up to quasi-isomorphism.
- For X = Spec ℤ_(p), U = Spec ℚ, Z = X: F = ℚ[0] extends (as ℤ_(p)[0]) and the obstruction group K_0(U)/im K_0(X) = 0.

**Depends on.** this roadmap: `S.3/restriction-quotient-fully-faithful`, `S.3/extension-up-to-summand`, `S.3/support-k-theory`, `S.2/k-zero-of-a-scheme`.

**Sources.**

- `ThomasonTrobaugh.1990`, Key Proposition 5.2.2 (p. 338): “(a) A perfect complex F· on U is isomorphic in the derived category D(OU-Mod) to the restriction j*E· of some perfect complex E· on X, if and only if the class [F·] in K0(U) is in the image of K0(X).” — Part (a); part (b) is the version with supports in Z, proved by the same argument (TT 5.5.5, 5.6.2(a)).
- `ThomasonTrobaugh.1990`, Proposition 5.5.4 (p. 344): “Proof. This will follow from 5.5.1 and 5.5.3 by a cofinality trick of Grayson, (cf. [Gr3] Section 1).” — The route: summand extension, two out of three, and Grayson's monoid.

### The support/open sequence of perfect complexes is exact up to direct factors

`S.3/perfect-localisation-exact-sequence` · theorem

Let X be quasi-compact and quasi-separated, U ⊆ X a quasi-compact open with complement Y, and Z ⊆ X closed with X ∖ Z quasi-compact. Then Perf_{Y∩Z}(X) → Perf_Z(X) → Perf_{U∩Z}(U) is an exact sequence of triangulated categories in Schlichting's sense (GeneralAlgebraicKTheory K.6): the first functor is fully faithful, the composite is zero, and the induced functor Perf_Z(X)/Perf_{Y∩Z}(X) → Perf_{U∩Z}(U) is fully faithful and cofinal (every object of the target is a direct summand of an object of the image). It is realised by the maps of Frobenius pairs underlying S.3/support-k-theory, and its essential image is described by S.3/extension-k0-criterion.

**Hypotheses.**

- X quasi-compact and quasi-separated; U quasi-compact open; Z closed with X ∖ Z quasi-compact.

**Proof.**

1. The inclusion Perf_{Y∩Z}(X) ⊆ Perf_Z(X) is full, and j^* kills it because its objects are acyclic on U (S.3/perfect-complexes-with-support).
2. Fully faithful on the Verdier quotient: S.3/restriction-quotient-fully-faithful.
3. Cofinal: every object of Perf_{U∩Z}(U) is a direct summand of the restriction of an object of Perf_Z(X) (S.3/extension-up-to-summand, T = Z).
4. The functors come from maps of Frobenius pairs (restriction of S.1/perfect-frobenius-pair to supports, and j^* on flat models, S.2/derived-pullback-perfect), so the sequence is an exact sequence of Frobenius pairs in the sense required by K.6's localisation theorem (GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization).

**Acceptance.**

- For X = Spec ℤ, U = Spec ℤ[1/p], Z = X: the quotient functor Perf(ℤ)/Perf_{(p)}(ℤ) → Perf(ℤ[1/p]) is an equivalence (every perfect ℤ[1/p]-complex extends, K_0(ℤ) → K_0(ℤ[1/p]) being onto).
- The sequence is not exact on the nose in general: K_0(X) → K_0(U) need not be surjective, and the cofinality clause is exactly what lets K.6 produce K_{−1}.

**Depends on.** this roadmap: `S.3/restriction-quotient-fully-faithful`, `S.3/extension-up-to-summand`, `S.3/perfect-complexes-with-support`, `S.3/extension-k0-criterion`, `S.1/perfect-frobenius-pair`, `S.2/derived-pullback-perfect`; other roadmaps: `GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization`.

**Sources.**

- `ThomasonTrobaugh.1990`, 5.2 (p. 338): “By the Approximation Theorem in form 1.9.8, this in turn reduces to showing that j* induces an equivalence of the derived categories of the two complicial biWaldhausen categories. This equivalence follows from the results 5.2.2., 5.2.3, and 5.2.4, below.” — The triangulated input to the localisation theorem, TT's connective formulation (equivalence onto the objects whose K_0 class lies in the image).
- `Kbook.2013`, Proof of Theorem V.7.6 (PDF p. 434): “Thus the proof reduces to showing that K(wA) →K(B) is a homotopy equivalence. By the Approxima- tion Theorem 2.4, this reduces to showing that A →B induces an equivalence of derived categories. This is the conclusion of the following theorem of Thomason and Trobaugh.” — The same reduction in the K-book.

### The Thomason–Trobaugh localisation theorem

`S.3/localisation-fibre-sequence` · theorem · planet “Thomason–Trobaugh localisation theorem”

Let X be quasi-compact and quasi-separated, j: U → X an open immersion with U quasi-compact, Y = X ∖ U, and Z ⊆ X closed with X ∖ Z quasi-compact. Then K(X on Y ∩ Z) → K(X on Z) → K(U on U ∩ Z) is a homotopy fibre sequence of nonconnective K-theory spectra (S.3/support-k-theory), the null-homotopy of the composite being the canonical one (a complex acyclic off Y ∩ Z is naturally acyclic on U). In particular (Z = X) K(X on Y) → K(X) → K(U) is a fibre sequence, with a long exact sequence ⋯ → K_n(X on Y) → K_n(X) → K_n(U) →∂ K_{n−1}(X on Y) → ⋯ in all degrees n ∈ ℤ; there is no surjectivity condition on K_0(X) → K_0(U).

**Hypotheses.**

- X quasi-compact and quasi-separated; U ⊆ X quasi-compact open; Z ⊆ X closed with X ∖ Z quasi-compact.
- Nonconnective K is K.6's IK; its negative groups agree with Thomason's K^B (GeneralAlgebraicKTheory K.6/agreement-and-vanishing-of-negative-K), which is the form of TT 7.4.

**Proof.**

1. S.3/perfect-localisation-exact-sequence gives an exact sequence of Frobenius pairs Perf_{Y∩Z}(X) → Perf_Z(X) → Perf_{U∩Z}(U).
2. K.6: an exact sequence of Frobenius pairs gives a homotopy cartesian square IK(A) → IK(B) over * → IK(C), hence a homotopy fibre sequence and a long exact sequence in all degrees (GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance, K.6/schlichting-set-up-and-negative-localization).
3. The null-homotopy of Perf_{Y∩Z}(X) → Perf_{U∩Z}(U) is induced by the natural quasi-isomorphism to 0 on U (TT 7.4 proof), so the fibre sequence is natural in X, U, Z.
4. The long exact sequence of homotopy groups is StableHomotopyKTheory H.2's exact homotopy sequence of a homotopy fibre, which fixes the connecting map ∂ (S.3/localisation-boundary).

**Acceptance.**

- For X = Spec O (O a DVR), U = Spec L, Y the closed point: K(X on Y) → K(O) → K(L) is the fibre sequence of S.3/dvr-localisation-sequence, and K_0(O) → K_0(L) is ℤ ≅ ℤ.
- For X = A²_k and U = A²_k ∖ {0}: K_n(A² on {0}) → K_n(A²) → K_n(U) with K_n(A² on {0}) ≅ K_n(k) (S.3/regular-support-devissage).
- K.6's negative groups appear exactly when K_0(X) → K_0(U) is not onto; no covering-spectrum correction is needed in this nonconnective form (contrast S.3/connective-localisation-sequence).

**Depends on.** this roadmap: `S.3/perfect-localisation-exact-sequence`, `S.3/support-k-theory`; other roadmaps: `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization`, `GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 7.4 (p. 365): “Let X be a quasi-compact and quasi-separated scheme. Let j : U → X be an open immersion with U quasi-compact. Set Y = X − U. Let Z be a closed subspace of X with X − Z quasi-compact. Then there are homotopy fibre sequences, induced by the obvious maps and nullhomotopies:” — The statement; the displayed sequences are K^B(X on Y) → K^B(X) → K^B(U) and K^B(X on Y ∩ Z) → K^B(X on Z) → K^B(U on U ∩ Z).
- `Kbook.2013`, Theorem V.7.6 (PDF p. 433): “Let X be a quasi-compact, quasi-separated scheme, and U a quasi-compact open in X with complement Z. Then K(X on Z) →K(X) j∗ −→K(U) is a homotopy ﬁbration” — The K-book's statement (connective, with the K_0 caveat of TT 5.1).
- `ThomasonTrobaugh.1990`, 5.1.5 (p. 337): “Unlike our results in Sections 1-4, which have been at most minor improvements on the work of Grothendieck, Illusie, Berthelot, Quillen, and Waldhausen, this result is a revolutionary advance.” — The role of the theorem.

### The connective localisation sequence and its K_0 correction

`S.3/connective-localisation-sequence` · theorem

In the setting of S.3/localisation-fibre-sequence, the connective (Waldhausen) K-theory spectra of TT 3.1 satisfy: K(X on Y ∩ Z) → K(X on Z) → K(U on U ∩ Z)~ is a homotopy fibre sequence, where K(U on U ∩ Z)~ is the covering spectrum with π_i = K_i(U on U ∩ Z) for i > 0 and π_0 = im(K_0(X on Z) → K_0(U on U ∩ Z)) (TT 5.1). Hence the long exact sequence of Quillen/Waldhausen groups ⋯ → K_1(U on U∩Z) → K_0(X on Y ∩ Z) → K_0(X on Z) → K_0(U on U ∩ Z) is exact, and the cokernel of the last map is the image of K_0(U on U∩Z) in K_{−1}(X on Y ∩ Z).

**Hypotheses.**

- As in S.3/localisation-fibre-sequence; the spectra are the connective Waldhausen spectra of TT 3.1.

**Proof.**

1. Waldhausen localisation (GeneralAlgebraicKTheory:K.4/waldhausen-localization-fibration-theorem) for the category of perfect complexes acyclic off Z, with the quasi-isomorphisms and the coarser class of maps that are quasi-isomorphisms on U: its fibre is the category acyclic off Y ∩ Z, giving K(X on Y ∩ Z) → K(X on Z) → K(X on Z for U) (TT (5.2.1)).
2. Thomason's cofinality (GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction) identifies K of the perfect complexes on U acyclic off U ∩ Z whose class lies in im K_0(X on Z) with the covering spectrum K(U on U∩Z)~.
3. Waldhausen approximation (GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem) reduces the comparison of K(X on Z for U) with that covering spectrum to an equivalence of derived categories, which is S.3/restriction-quotient-fully-faithful together with S.3/extension-k0-criterion (the essential image).

**Acceptance.**

- For X = A²_k with the origin doubled (qcqs, not separated) and U one copy of A², K_0(X) → K_0(U) is onto and the connective and nonconnective sequences agree in degrees ≥ 0.
- The connective sequence in degree 0 is left exact at K_0(U) only up to the image: K_0(X) → K_0(U) → 0 fails in general, which is why the nonconnective statement is the primary one.

**Depends on.** this roadmap: `S.3/restriction-quotient-fully-faithful`, `S.3/extension-k0-criterion`, `S.3/support-k-theory`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-localization-fibration-theorem`, `GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 5.1 (p. 337): “Then aside from possible failure of surjectivity for K0(X) → K0(U) and K0(X on Z) → K0(U on U ∩ Z), the usual maps give homotopy fibre sequences” — The connective statement, with the covering-spectrum correction in degree 0.
- `ThomasonTrobaugh.1990`, 5.2 (p. 338): “The Waldhausen Localization Theorem 1.8.2 immediately gives a homotopy fibre sequence (5.2.1), after we note that a complex acyclic on X − Z and quasi-isomorphic to 0 on U = X − Y is acyclic on (X − Z) ∪ (X − Y) = X − Z ∩ Y.” — The first step of the proof.

### The connecting maps of the localisation sequence

`S.3/localisation-boundary` · construction

In the setting of S.3/localisation-fibre-sequence, the connecting map ∂: K_n(U on U ∩ Z) → K_{n−1}(X on Y ∩ Z) (n ∈ ℤ) is the boundary of the exact homotopy sequence of the fibre sequence K(X on Y ∩ Z) → K(X on Z) → K(U on U ∩ Z), in StableHomotopyKTheory H.2's convention. Sign normalisation (pinned for this roadmap and its consumers): in each degree ∂ is H.2's connecting map multiplied by a sign depending only on the degree, chosen so that (i) ∂ is right K_*(X)-linear, ∂(x · j^*y) = ∂(x) · y (S.3/boundary-module-linearity), and (ii) for X noetherian regular and an endomorphism α of O_X^m that is an isomorphism on U, λ[α|_U] ∈ K_1(U) goes to [cone(α)] ∈ K_0(X on Y), which corresponds to [coker α] in G_0(Y) (S.3/boundary-of-a-nonzerodivisor through S.3/cartan-localisation-comparison); in particular ∂(λ(π)) = +[k] for a DVR. The left-linear normalisation ∂^left_n := (−1)^{n−1}∂_n (used by KTheoryFiniteLocalFields L.2 and EllipticKTheory E.3) satisfies ∂^left(j^*y · x) = y · ∂^left(x) and agrees with ∂ on K_1; exactness is unaffected by either choice.

**Hypotheses.**

- As in S.3/localisation-fibre-sequence.
- The normalisation clause uses the regular noetherian case only to pin the sign; ∂ itself exists for every qcqs X.

**Proof.**

1. The fibre sequence of S.3/localisation-fibre-sequence gives, by StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence, a natural connecting homomorphism π_n K(U on U∩Z) → π_{n−1} K(X on Y∩Z).
2. The sign is fixed by comparing on the explicit class λ(π) for the DVR case (S.3/dvr-boundary-unit-valuation), where the value is ±[k]; the definition picks +.
3. Exactness of ⋯ → K_n(X on Z) → K_n(U on U∩Z) →∂ K_{n−1}(X on Y∩Z) → K_{n−1}(X on Z) → ⋯ holds for either sign.

**API.**

- `localisationBoundary` (data): ∂: K_n(U on U∩Z) → K_{n−1}(X on Y∩Z), a group homomorphism for each n ∈ ℤ.
- `localisationBoundary_comp_restrict` (simp): ∂ ∘ j^* = 0.
- `localisationBoundary_exact_left` (characterisation): ker(K_n(X on Z) → K_n(U on U∩Z)) = im(K_n(X on Y∩Z) → K_n(X on Z)), and im ∂ = ker(K_{n−1}(X on Y∩Z) → K_{n−1}(X on Z)).
- `localisationBoundary_naturality` (functoriality): ∂ commutes with pullback along f: X' → X with f^{-1}(U) = U' (S.3/boundary-pullback-naturality).
- `localisationBoundary_mul_right` (relation): ∂(x · j^*y) = ∂(x) · y for y ∈ K_*(X) (S.3/boundary-module-linearity); ∂(j^*y · x) = (−1)^{|y|} y · ∂(x).
- `localisationBoundary_K0` (characterisation): ∂: K_0(U on U∩Z) → K_{−1}(X on Y∩Z) vanishes on [F] iff F extends to Perf_Z(X) (S.3/extension-k0-criterion).
- `localisationBoundary_cone` (compatibility): For X regular noetherian and α ∈ End(O_X^m) an isomorphism on U: ∂(λ[α|_U]) = [cone(α)] ∈ K_0(X on Y).
- `localisationBoundary_left` (other): ∂^left_n := (−1)^{n−1}∂_n is left-linear, ∂^left(j^*y·x) = y·∂^left(x), and equals ∂ on K_1; conversions between the two normalisations used by consumers.

**Unit tests.**

- `localisationBoundary.dvr_uniformiser` (computation): O = ℤ_(p): ∂(λ(p)) = [𝔽_p] = 1 and ∂(λ(12)) = 2 for p = 2, under K_0(Spec ℤ_(p) on closed point) ≅ K_0(𝔽_p) ≅ ℤ.
- `localisationBoundary.units_vanish` (degenerate): For u ∈ O^× (O a DVR), ∂(λ(u)) = 0, since λ(u) comes from K_1(O).
- `localisationBoundary.sign_pinned` (non-example): The opposite orientation ∂' = −∂ gives ∂'(λ(p)) = −1 for O = ℤ_(p); it fails localisationBoundary.dvr_uniformiser and disagrees with KTheoryLowDegrees U.6's uniformiser test.
- `localisationBoundary.empty_support` (degenerate): If U = X (Y = ∅) then K(X on ∅) = 0 and ∂ = 0.

**Acceptance.**

- ∂ ∘ j^* = 0 on K_n(X on Z) and im ∂ = ker(K_{n−1}(X on Y∩Z) → K_{n−1}(X on Z)).
- For a DVR O with uniformiser π: ∂(λ(π)) = [k] ↦ 1 ∈ ℤ ≅ K_0(k).

**Used by.**

- S.3/dvr-boundary: the DVR boundary ∂_S is this map for X = Spec O, U = Spec L, composed with dévissage
- K-book V.6.6.1 and V.6.7: ∂{s, a} = {∂(s), a} computes the tame symbol on {π, u} and splits Gersten's DVR sequence
- S.4/codimension-support-filtration: the differentials of the coniveau spectral sequences are composites of these boundaries
- EllipticKTheory E.3 and KTheoryLowDegrees U.5: the curve residues and the unit-valuation boundary are components of ∂

**Depends on.** this roadmap: `S.3/localisation-fibre-sequence`; other roadmaps: `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 7.4, (7.4.2) (p. 365): “There are resulting long exact sequences of homotopy groups:” — The long exact sequences whose connecting maps are ∂: K^B_n(U) → K^B_{n−1}(X on Y).
- `Kbook.2013`, Theorem V.7.6 (PDF p. 433): “and there is a long exact sequence · · · →Kn+1(U) ∂ −→Kn(X on Z) →Kn(X) →Kn(U) ∂ −→· · ·” — The boundary ∂ in the K-book's notation (there Z is the closed complement).
- `Kbook.2013`, Example V.6.1.2 (PDF p. 414): “It is useful to observe that any s ∈S determines an element [s] of K1(R[1/s]) and hence G1(R[1/s]), and that ∂(s) ∈G0(R/sR) is [R/sR]−[I], where I = {r ∈R : sr = 0}.” — The normalisation of the degree-one boundary that fixes the sign.

### Naturality of the localisation sequence and its boundary

`S.3/boundary-pullback-naturality` · lemma

Let f: X' → X be a morphism of quasi-compact quasi-separated schemes, U ⊆ X a quasi-compact open with f^{-1}(U) = U' quasi-compact, and Z ⊆ X, Z' ⊆ X' closed with X ∖ Z, X' ∖ Z' quasi-compact and f^{-1}(Z) ⊆ Z'. Then Lf^* induces a map of fibre sequences from K(X on Y∩Z) → K(X on Z) → K(U on U∩Z) to K(X' on Y'∩Z') → K(X' on Z') → K(U' on U'∩Z') (Y' = f^{-1}Y), so f^* ∘ ∂ = ∂ ∘ (f|_{U'})^*. The same holds for the enlargement maps Z ⊆ Z'' on a fixed X, and for restriction to an open V ⊆ X (f = inclusion).

**Hypotheses.**

- f any morphism of qcqs schemes; the support and quasi-compactness conditions as stated.

**Proof.**

1. Lf^* on flat models is a map of Frobenius pairs (S.2/derived-pullback-perfect) sending Perf_{Y∩Z}(X) → Perf_{Y'∩Z'}(X'), Perf_Z(X) → Perf_{Z'}(X') and, restricted to U, Perf_{U∩Z}(U) → Perf_{U'∩Z'}(U'), and commuting with restriction to U and U' (pullback is pseudofunctorial, j'^* Lf^* ≅ L(f|_{U'})^* j^*).
2. So it is a map of exact sequences of Frobenius pairs (S.3/perfect-localisation-exact-sequence), and K.6's construction is functorial for such maps, giving a map of homotopy cartesian squares (GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance); the canonical null-homotopies are compatible because both are induced by the quasi-isomorphism to 0 on U.
3. A map of fibre sequences induces a map of long exact sequences (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence), which is the stated commutation with ∂.

**Acceptance.**

- For the flat map Spec O_{X,x} → X at a point x of codimension one of a regular scheme, the boundary of the local DVR sequence is the component at x of the global boundary (used by S.3/unit-boundary-is-divisor and S.4/coniveau-residue-differential).
- For the inclusion V ⊆ X of an open containing Y ∩ Z, the map on fibres is the excision equivalence (S.3/excision).

**Depends on.** this roadmap: `S.3/localisation-fibre-sequence`, `S.3/perfect-localisation-exact-sequence`, `S.3/support-k-theory`, `S.2/derived-pullback-perfect`; other roadmaps: `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.**

- `ThomasonTrobaugh.1990`, Proof of Theorem 7.4 (p. 365): “This nullhomotopy is strictly natural in X, and in particular is natural for the maps (X[T, T−1]) → X.” — Naturality of the null-homotopy, hence of the fibre sequences.
- `ThomasonTrobaugh.1990`, 3.14 (pp. 317-318): “Similarly f induces a map f* : K(X' on Y') → K(X on f−1(Y')).” — Pullback on support K-theory (TT's f: X → X').

### The localisation boundary is K_*(X)-linear

`S.3/boundary-module-linearity` · lemma

In the setting of S.3/localisation-fibre-sequence let W ⊆ X be closed with X ∖ W quasi-compact. For x ∈ K_p(U on U ∩ Z) and y ∈ K_q(X on W), ∂(x · j^*y) = ∂(x) · y in K_{p+q−1}(X on Y ∩ Z ∩ W), products being the support pairings of S.3/support-k-theory. In particular (W = X) ∂ is right K_*(X)-linear: ∂(x · j^*y) = ∂(x) · y, and with y on the left ∂(j^*y · x) = (−1)^q y · ∂(x). For a DVR O with fraction field L and residue field k this reads ∂(x · y) = ∂(x) · ȳ for y ∈ K_*(O), ȳ its image in K_*(k) (K-book V.6.1.1, V.6.6.1).

**Hypotheses.**

- As in S.3/localisation-fibre-sequence; the right-hand factor carries no sign; graded commutativity of the pairing is GeneralAlgebraicKTheory K.7's.

**Proof.**

1. Tensoring with a perfect complex G ∈ Perf_W(X) (on flat models) is an exact functor Perf_{Y∩Z}(X) → Perf_{Y∩Z∩W}(X), Perf_Z(X) → Perf_{Z∩W}(X), Perf_{U∩Z}(U) → Perf_{U∩Z∩W}(U) compatible with j^* (S.1/perfect-derived-tensor, S.2/tensor-product-pairings): a biexact pairing of the exact sequence of Frobenius pairs with Perf_W(X).
2. A biexact functor A × C → A' inducing B × C → B' and A/B × C → A'/B' satisfies ∂({x, y}) = {∂(x), y} (K-book Ex. V.5.3, Ex. V.8.2; requested from GeneralAlgebraicKTheory K.7, whose text asks for 'compatibility with relative groups, localisation boundaries and transfers').
3. The left-hand form follows from the right-hand one and graded commutativity x·y = (−1)^{pq} y·x of the pairing (GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products): ∂(j^*y · x) = (−1)^{pq}∂(x)·y = (−1)^{pq}(−1)^{(p−1)q} y·∂(x) = (−1)^q y·∂(x).
4. For the DVR, dévissage K(Spec O on closed point) ≃ K(k) is K_*(O)-linear with K_*(O) acting on K_*(k) through O → k (the pairing restricted to the closed point is the pullback to k, S.3/regular-support-devissage).

**Acceptance.**

- O = ℤ_(p), u ∈ ℤ_(p)^×: ∂(λ(p) · λ(u)) = ∂(λ(p)) · ū = [ū] ∈ K_1(𝔽_p) = 𝔽_p^× (S.3/dvr-boundary-on-unit-products).
- ∂(λ(u) · λ(p)) = −[ū], i.e. ū^{−1} multiplicatively: the sign rule is visible already on K_2.

**Depends on.** this roadmap: `S.3/localisation-fibre-sequence`, `S.3/support-k-theory`, `S.1/perfect-derived-tensor`, `S.2/tensor-product-pairings`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`, `GeneralAlgebraicKTheory:K.7`.

**Sources.**

- `Kbook.2013`, Exercise V.8.2 (PDF p. 442): “Deduce that the map ∂: Kn(U) → Kn−1HZ(X) satisﬁes ∂({u, x}) = ∂(u) · x for u ∈K∗(U) and x ∈K∗(X). Hint: Mimick Ex. 5.3, using Ex. IV. 1.23.” — The right linearity, for the divisor case of the sequence; the node states it for the Thomason–Trobaugh sequence.
- `Kbook.2013`, Exercise V.5.3 (PDF p. 413): “Use Ex. IV. 1.23 to show that for x ∈Kj(A/B) and y ∈Kn(C) the element {x, y} ∈Kn+i(A′/B′) satisﬁes ∂({x, y}) = {∂(x), y} in Kn+i(B′).” — The general mechanism for a biexact pairing of a localisation sequence (the printed indices n+i should read n+j and n+j−1).
- `Kbook.2013`, V.6.6.1 (PDF p. 417): “In this case, we know that ∂in K∗(R)-linear, so if u ∈R× has image ¯u ∈R/p then ∂{π, u} = [¯u] in R/p×.” — The DVR form, used on {π, u}.

### Maps that are isomorphisms infinitely near a closed subset

`S.3/infinitely-near-equivalence` · lemma

Let f: X' → X be a quasi-separated morphism of quasi-compact schemes and i: Y → X a finitely presented closed immersion; set Y' = f^{-1}(Y). Say f is an isomorphism infinitely near Y if f is flat at every point of X' lying over Y and Y' = Y ×_X X' → Y is an isomorphism (TT 2.6.2.1; the condition does not depend on the finitely presented Y with the given underlying space, TT 2.6.2.2). Then: (a) for E ∈ D^−_QCoh(O_X) acyclic off Y, E → Rf_*Lf^*E is an isomorphism; (b) for E' ∈ D^−_QCoh(O_{X'}) acyclic off Y', Lf^*Rf_*E' → E' is an isomorphism; (c) Rf_* preserves pseudo-coherence and (d) perfection of complexes acyclic off Y' (TT 2.6.3). Hence Lf^* and Rf_* are inverse equivalences Perf_Y(X) ≃ Perf_{Y'}(X'). Examples: an open immersion V ⊆ X containing Y; an étale f with f^{-1}(Y) → Y an isomorphism (TT 10.8); A → Â_I for A noetherian and Y = V(I); A → A^h_I, the henselisation along I (TT 3.19.2).

**Hypotheses.**

- X, X' quasi-compact; f quasi-separated (hence quasi-compact, EGA I 6.1.10); Y ⊆ X a finitely presented closed subscheme, which exists for the closed subspace Y when X is qcqs and X ∖ Y quasi-compact (TT 2.6.1(c)).

**Proof.**

1. Independence of Y (TT 2.6.2.2): flatness over |Y| gives f^*J^n = J'^n and f^*(J^k/J^{k+n}) ≅ J'^k/J'^{k+n}, so the isomorphism on Y propagates to all thickenings Y^(n) and, by TT 2.6.1(b), to any finitely presented Z with |Z| = |Y|.
2. (a): Rf_* has bounded cohomological amplitude on D_QCoh and commutes with filtered colimits (S.2/total-direct-image-qcqs); truncating, reduce to a single quasi-coherent module E vanishing off Y, then (colimits) to E of finite type, so J^nE = 0 for some n; by dévissage along J^kE/J^{k+1}E reduce to E = i_*E_0 an O_Y-module, where Rf_*Lf^*i_*E_0 = Rf_*i'_*E_0 = i_*E_0 by flatness over Y and Y' ≅ Y.
3. (b) is the same argument on X', and (c), (d) follow from (a), (b) and the locality of pseudo-coherence and perfection (S.1/perfect-local-and-invariant), using local cohomology RΓ_Y = fibre(1 → Rj_*j^*) to identify both sides with complexes acyclic off Y (TT 2.6.3 proof).
4. The examples: open immersions and étale maps are flat; for noetherian A the completion is flat with A/I^n ≅ Â/I^nÂ; the henselisation is ind-étale with A/I ≅ A^h/IA^h.

**Acceptance.**

- For the open immersion V = X ∖ W ⊇ Y (W closed, disjoint from Y), Lf^* is restriction and Rf_* is Rj_*: every perfect complex on V supported on Y extends uniquely (up to isomorphism) to X.
- Non-example: Spec k[x]/(x²) → Spec k[x] is an isomorphism on Y = {0} as a set but not flat, and Perf_{0}(A¹) ≠ Perf(k[x]/(x²)) (their K_1 differ, S.3/regular-support-devissage).

**Depends on.** this roadmap: `S.3/perfect-complexes-with-support`, `S.2/total-direct-image-qcqs`, `S.2/derived-tor-independent-base-change`, `S.1/perfect-local-and-invariant`, `S.1/pseudo-coherent-complex`; other roadmaps: `EnhancedDerivedSheaves:E1/enhanced-derived-category`; libraries: `mathlib:AlgebraicGeometry.Flat`, `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.IsOpenImmersion`.

**Sources.**

- `ThomasonTrobaugh.1990`, Definition 2.6.2.1 (p. 306): “We say f is an isomorphism infinitely near Y if the following two conditions hold: (a) f is flat over the points of Y; that is, for all x' ∈ X' with y = f(x') in |Y| ⊆ X, OX',x' is flat over OX,y. (b) f induces an isomorphism of schemes Y' = Y ×X X' → Y.” — The definition.
- `ThomasonTrobaugh.1990`, Theorem 2.6.3 (pp. 307-308): “(a) For E· in D−(OX−Mod) with quasi-coherent cohomology and which is acyclic on X − Y, the canonical map E· → Rf*Lf*E· is an isomorphism in D−(OX−Mod).” — Part (a); parts (b)-(d) as stated in the node.
- `ThomasonTrobaugh.1990`, Examples 3.19.2 (p. 323): “Then the map to the completion A → AI^ induces a homotopy equivalence: K(Spec(A) on Spec(A/I)) → K(Spec(AI^) on Spec(AI^/IAI^))” — The completion example (with the henselisation and open-immersion examples in the same paragraph).

### Excision for K-theory with supports

`S.3/excision` · theorem · planet “Excision”

Let f: X' → X be a morphism of quasi-compact quasi-separated schemes and Y ⊆ X a closed subset with X ∖ Y quasi-compact; set Y' = f^{-1}(Y). If f is an isomorphism infinitely near Y (S.3/infinitely-near-equivalence), then f^*: K(X on Y) → K(X' on Y') is a homotopy equivalence of nonconnective spectra (TT 3.19 in degrees ≥ 0, TT 7.1 for K^B). In particular: (i) for an open V ⊆ X containing Y, K(X on Y) ≃ K(V on Y) (K-book V.7.9); (ii) for étale f with f^{-1}(Y) → Y an isomorphism (Nisnevich excision); (iii) K(Spec A on V(I)) ≃ K(Spec Â_I on V(IÂ)) for noetherian A; (iv) K(Spec A on V(I)) ≃ K(Spec A^h_I on V(IA^h)) for the henselisation along a finitely generated I.

**Hypotheses.**

- X, X' qcqs; X ∖ Y quasi-compact; f an isomorphism infinitely near Y.

**Proof.**

1. By S.3/infinitely-near-equivalence(a),(b),(d), Lf^* and Rf_* restrict to inverse equivalences Perf_Y(X) ≃ Perf_{Y'}(X') of triangulated categories.
2. Lf^* is induced by a map of Frobenius pairs between the support models of S.3/support-k-theory (flat models, S.2/derived-pullback-perfect), so K.6's derived invariance (a map of Frobenius pairs inducing an equivalence of derived categories induces an equivalence of IK spectra, GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance) gives the equivalence of nonconnective spectra; no Bass-type trick through the projective bundle theorem is needed.
3. The four cases are the examples of S.3/infinitely-near-equivalence.

**Acceptance.**

- For X = Spec ℤ, V = Spec ℤ_(p), Y = V(p): K_n(ℤ on (p)) ≅ K_n(ℤ_(p) on (p)) ≅ K_n(ℤ_p on (p)) ≅ K_n(𝔽_p) for all n (combined with S.3/regular-support-devissage).
- Excision fails for the non-flat map Spec k[x]/(x²) → A¹_k (S.3/infinitely-near-equivalence non-example).

**Depends on.** this roadmap: `S.3/infinitely-near-equivalence`, `S.3/support-k-theory`, `S.2/derived-pullback-perfect`; other roadmaps: `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`.

**Sources.**

- `ThomasonTrobaugh.1990`, Proposition 3.19 (p. 322): “Suppose that f is an isomorphism infinitely near Y in the sense of 2.6.2.2 , 2.6.1. Then f* induces homotopy equivalences f* : K(X on Y) ≃ K(X' on Y')” — The statement for connective K (and for G with supports).
- `ThomasonTrobaugh.1990`, Theorem 7.1 (p. 364): “Suppose f is an isomorphism infinitely near Y, in the sense 2.6.2.2. Then f* : KB(X on Y) ≃ KB(X' on Y') is a homotopy equivalence.” — The nonconnective statement.
- `Kbook.2013`, Proposition V.7.9 (PDF p. 435): “Proposition 7.9. (Excision) Let X and Z be as in Theorem 7.6, and let i : V ⊂X be the inclusion of an open subscheme containing Z. Then the restriction i∗: Chperf,Z(X) →Chperf,Z(V ) is exact and induces a homotopy equivalence KB(X on Z) ≃ −→KB(V on Z).” — Case (i).

### Supports on disjoint closed subsets add

`S.3/disjoint-support-additivity` · lemma

Let X be quasi-compact and quasi-separated and Z_1, Z_2 ⊆ X disjoint closed subsets with X ∖ Z_1, X ∖ Z_2 quasi-compact. Then (E_1, E_2) ↦ E_1 ⊕ E_2 is an equivalence Perf_{Z_1}(X) × Perf_{Z_2}(X) ≃ Perf_{Z_1 ⊔ Z_2}(X), and hence K(X on Z_1) × K(X on Z_2) → K(X on Z_1 ⊔ Z_2) is an equivalence; for a finite disjoint family, K(X on ⊔_i Z_i) ≃ ∏_i K(X on Z_i).

**Hypotheses.**

- X qcqs; Z_1 ∩ Z_2 = ∅; complements quasi-compact.

**Proof.**

1. For E_i ∈ Perf_{Z_i}(X), RHom(E_1, E_2) is supported on Z_1 ∩ Z_2 = ∅ (RHom commutes with restriction to opens and E_2 vanishes near Z_1's complement… precisely: on X ∖ Z_1 the source vanishes and on X ∖ Z_2 the target vanishes), so Hom(E_1, E_2[n]) = 0: the functor is fully faithful.
2. Essential surjectivity: for E ∈ Perf_{Z_1 ⊔ Z_2}(X) let V_i = X ∖ Z_{3−i} (an open neighbourhood of Z_i); by S.3/excision (open case, via S.3/infinitely-near-equivalence) E|_{V_i} extends uniquely to E_i ∈ Perf_{Z_i}(X), and E ≅ E_1 ⊕ E_2 because both restrict to E on V_1 and V_2 and to 0 on V_1 ∩ V_2 = X ∖ (Z_1 ⊔ Z_2) (Mayer–Vietoris gluing of objects in the stable enhancement, EnhancedDerivedSheaves E1).
3. The equivalence is induced by a map of Frobenius pairs, so IK takes it to an equivalence (GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance) and IK of a product of Frobenius pairs is the product (GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits).

**Acceptance.**

- For a Dedekind domain R and distinct maximal ideals p_1, …, p_r: K(Spec R on {p_1, …, p_r}) ≃ ∏_i K(R/p_i) (with S.3/regular-support-devissage).
- For a regular curve and a finite set S of closed points, K_n(X on S) ≅ ⊕_{x∈S} K_n(k(x)).

**Depends on.** this roadmap: `S.3/perfect-complexes-with-support`, `S.3/support-k-theory`, `S.3/infinitely-near-equivalence`, `S.3/excision`; other roadmaps: `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`, `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`.

**Sources.**

- `ThomasonTrobaugh.1990`, Proof of Theorem 10.3, (10.3.9) (p. 385): “As KB(VI on VI ∩ (Z − Z')) = KB(VI on φ) ≃ 0 if I contains two distinct indices,the Mayer-Vietoris spectral sequence (8.3.2) collapses” — The additivity over disjoint closed pieces, used in the coniveau decomposition (TT derive it from the Mayer–Vietoris spectral sequence; the node gives the direct argument).
- `ThomasonTrobaugh.1990`, Corollary 8.1.4 (p. 368): “Let Y1 and Y2 be two closed subspaces with both X − Y1 and X − Y2 quasi-compact. Then (8.1.5) is a homotopy cartesian square” — The closed Mayer–Vietoris square K^B(X on Y_1 ∩ Y_2) → K^B(X on Y_1), K^B(X on Y_2) → K^B(X on Y_1 ∪ Y_2), of which the disjoint case is this lemma.

### Affine support K-theory is ring support K-theory

`S.3/affine-support-comparison` · comparison

Let R be a commutative ring and s ∈ R, X = Spec R, Z = V(s), S = {s^n}. Under the affine comparison D_perf(Spec R) ≃ D_perf(R) (S.1/affine-perfect-comparison), Perf_Z(X) corresponds to the perfect R-complexes P with P[1/s] acyclic, and K(X on Z) ≃ K(R on S) := K Ch^b_S(P(R)) of GeneralAlgebraicKTheory K.5 (bounded complexes of finitely generated projectives with S^{-1}P exact); the localisation sequence of S.3/localisation-fibre-sequence for (X, D(s)) is identified with Weibel's K(R on S) → K(R) → K(S^{-1}R) (K-book V.2.6.3) in degrees ≥ 0. More generally for Z = V(I) with I finitely generated, Perf_Z(X) is the perfect complexes with I-power-torsion cohomology.

**Hypotheses.**

- R commutative; s ∈ R (or I finitely generated, so that X ∖ V(I) is quasi-compact).

**Proof.**

1. Restriction to D(s) = Spec R[1/s] corresponds to − ⊗_R R[1/s] under S.1/affine-derived-equivalence (S.2/affine-pullback-is-scalar-extension), so the support conditions match: P|_{D(s)} ≅ 0 iff P ⊗_R R[1/s] is acyclic.
2. Every perfect R-complex is quasi-isomorphic to a bounded complex of finitely generated projectives (S.1/affine-perfect-comparison), so Ch^b_S(P(R)) → Perf_Z(X) induces an equivalence of derived (homotopy) categories; Waldhausen approximation (GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem) and K.6 derived invariance give K(R on S) ≃ K(X on Z) in degrees ≥ 0 and nonconnectively.
3. The maps to K(R) and K(S^{-1}R) correspond (S.2/affine-k-theory-comparison), so the fibre sequences agree (GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary records Weibel V.2.6.3).

**Acceptance.**

- R = ℤ, s = p: K_0(Spec ℤ on (p)) ≅ K_0(ℤ on p^ℕ) ≅ ℤ, generated by [ℤ →p ℤ].
- For R = k[x, y]/(xy) and s = x (a zero divisor), K(R on S) is still the fibre, whereas K(H_S(R)) of x-torsion modules of finite projective dimension is not (K-book Ex. V.2.9); the comparison is with K(R on S), not with K(H_S(R)).

**Depends on.** this roadmap: `S.3/perfect-complexes-with-support`, `S.3/support-k-theory`, `S.3/localisation-fibre-sequence`, `S.1/affine-derived-equivalence`, `S.1/affine-perfect-comparison`, `S.2/affine-pullback-is-scalar-extension`, `S.2/affine-k-theory-comparison`; other roadmaps: `GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`.

**Sources.**

- `Kbook.2013`, Theorem V.2.6.3 (PDF p. 390): “If S is a central multiplicatively closed set in a ring R, there is a homotopy ﬁbration K(R on S) →K(R) →K(S−1R), and hence a long exact sequence · · · Kn+1(S−1R) →Kn(R on S) →Kn(R) →Kn(S−1R) · · ·” — The ring-level sequence identified with the affine case.

### Comparison with Quillen's exact category for an effective Cartier divisor

`S.3/divisor-support-comparison` · comparison

Let X be a scheme with an ample family of line bundles (for example quasi-projective over a ring) and Z ⊆ X the closed subscheme of an invertible ideal I ⊆ O_X. Let H_Z(X) be the exact category of O_X-modules supported on Z with a resolution of length ≤ 1 by vector bundles (equivalently pseudo-coherent of Tor-dimension ≤ 1, supported on Z). Then the inclusion H_Z(X) ⊆ Perf_Z(X) induces a homotopy equivalence of connective spectra K(H_Z(X)) ≃ K(X on Z) (K-book Cor. V.7.6.1, TT Exercise 5.7 with k = 1), so the connective localisation sequence reads ⋯ → K_n H_Z(X) → K_n(X) → K_n(U) → ⋯; for X = Spec R and Z = V(s), s a nonzerodivisor, this is Quillen's localisation for nonzerodivisors K(H_s(R)) → K(R) → K(R[1/s]) (K-book V.7.1).

**Hypotheses.**

- X with an ample family of line bundles; Z defined by an invertible ideal (an effective Cartier divisor).

**Proof.**

1. O_X/I^n has the resolution 0 → I^n → O_X → O_X/I^n → 0 by line bundles, so it is pseudo-coherent of Tor-dimension ≤ 1, and so is every quasi-coherent module of finite type annihilated by some I^n that is locally of Tor-dimension ≤ 1 (TT 5.7(a),(e) with k = 1).
2. Perf_Z(X) is modelled by perfect complexes of quasi-coherent modules vanishing off Z (TT 5.7(b): local cohomology lim Ext(O/I^p, −) computed with injectives in Qcoh(X)), and then by complexes of objects of the additive category generated by the L^{⊗m} ⊗ O_X/I^p, L in the ample family (TT 5.7(c), the inductive construction lemma TT 1.9.5).
3. Gillet–Waldhausen and approximation (GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison, K.4/waldhausen-approximation-theorem) identify the K-theory of these bounded complexes with Quillen's K of the exact category H_Z(X) (TT 5.7(d), K-book Ex. V.3.16(c)).
4. The source proofs are exercises with hints (TT 5.7 is an exercise the source flags as skippable; K-book Ex. V.3.16); the steps above follow those hints and are recorded as such in the gap list.

**Acceptance.**

- X = Spec ℤ, Z = V(p): H_Z(X) is the category of finite abelian p-groups and K_n(H_Z) ≅ K_n(𝔽_p) by dévissage, matching K(ℤ on (p)).
- The comparison fails for non-divisors: for A the homogeneous coordinate ring of a non-normal plane cubic and m the origin, K_*(H_m(A)) is not the fibre (K-book Ex. V.7.4).

**Depends on.** this roadmap: `S.3/support-k-theory`, `S.3/perfect-complexes-with-support`, `S.1/perfect-waldhausen-models`, `S.1/resolution-property-strict-representatives`; other roadmaps: `GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`.

**Sources.**

- `Kbook.2013`, Corollary V.7.6.1 (PDF p. 433): “Corollary 7.6.1. If X is quasiprojective and Z is deﬁned by an invertible ideal, then HZ(X) ⊂Chperf,Z(X) induces an equivalence on K-theory.” — The statement.
- `Kbook.2013`, Exercise V.3.16 (PDF p. 407): “(c) Show that the inclusion of Chb(H) in Chperf(MZ) satisﬁes (App), so that Waldhausen Approximation 2.4 (and 2.2) imply that K(X on Z) ≃ KHZ(X).” — The proof route (an exercise with hints).
- `ThomasonTrobaugh.1990`, Exercise 5.7 (p. 350): “Let i : Y → X be a regular closed immersion ([SGA 6] VII Section 1) defined by ideal J. Suppose Y has codimension k in X. Then show that K(X on Y) is homotopy equivalent to the Quillen K- theory of the exact category of pseudo-coherent OX-modules supported on the subspace Y” — The general regular-immersion version (continued: 'and of Tor-dimension ≤ k on X'); this node uses k = 1.

### Coherent sheaves supported on a closed subset

`S.3/coherent-sheaves-with-support` · definition

For a noetherian scheme X and a closed subset Z ⊆ X, Coh_Z(X) is the full subcategory of the abelian category Coh(X) of coherent O_X-modules F with F|_{X∖Z} = 0, i.e. Supp F ⊆ Z. It is a Serre subcategory (closed under subobjects, quotients and extensions); K(Coh_Z(X)) is its Quillen K-theory spectrum (GeneralAlgebraicKTheory K.1), and G(X) = K(Coh(X)) is S.2/g-theory-of-a-scheme.

**Hypotheses.**

- X noetherian (so Coh(X) is abelian and noetherian); Z closed.

**Proof.**

1. Coh(X) is an abelian subcategory of X.Modules (Mathlib's Scheme.Modules) for noetherian X; restriction to U = X ∖ Z is exact.
2. Coh_Z(X) is the kernel of the exact functor Coh(X) → Coh(U), hence closed under subobjects, quotients and extensions: a Serre subcategory.
3. Its K-theory is Quillen's (GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories), it is essentially small because Coh(X) is (S.2/g-theory-of-a-scheme).

**API.**

- `cohSupport` (data): Coh_Z(X) as an ObjectProperty of Coh(X) (or as a full subcategory).
- `cohSupport.isSerre` (instance): Coh_Z(X) is closed under subobjects, quotients and extensions.
- `cohSupport.mem_iff` (characterisation): F ∈ Coh_Z(X) iff F|_{X∖Z} = 0 iff Supp F ⊆ Z; on Spec A, M~ ∈ Coh_{V(I)} iff Module.support M ⊆ V(I) iff I^n M = 0 for some n.
- `cohSupport.mono` (relation): Z ⊆ Z' implies Coh_Z(X) ⊆ Coh_{Z'}(X).
- `cohSupport.pushforward` (functoriality): For a closed immersion i: Y → X with |Y| ⊆ Z, i_*: Coh(Y) → Coh_Z(X) is exact.
- `cohSupport.flatPullback` (functoriality): For flat f: X' → X, f^* maps Coh_Z(X) to Coh_{f^{-1}Z}(X').

**Unit tests.**

- `cohSupport.univ` (degenerate): Coh_X(X) = Coh(X) and Coh_∅(X) = {0}.
- `cohSupport.Zp` (computation): On X = Spec ℤ, ℤ/p^3 ∈ Coh_{V(p)}(X) and ℤ ∉ Coh_{V(p)}(X).
- `cohSupport.support_compat` (compatibility): On X = Spec A: M~ ∈ Coh_{V(I)}(X) iff Mathlib's Module.support M ⊆ PrimeSpectrum.zeroLocus I (M finitely generated).
- `cohSupport.not_scheme_structure` (non-example): Coh_{V(x)}(A¹_k) contains k[x]/(x²), which is not an O_Z-module for the reduced structure Z = Spec k: Coh_Z(X) is not Coh(Z) (they have the same K-theory by S.3/coherent-support-devissage).

**Acceptance.**

- Coh_X(X) = Coh(X) and Coh_∅(X) = 0.
- For X = Spec ℤ and Z = V(p): Coh_Z(X) is the category of finite abelian p-groups.

**Used by.**

- K-book V.6.11: the fibre of G(X) → G(U) is K(Coh_Z(X)) ≃ G(Z)
- S.4/coherent-codimension-filtration: M^p(X) is the union of Coh_Z(X) over closed Z of codimension ≥ p
- EllipticKTheory E.6: G-theory of the closed fibres 𝓧_v of an arithmetic surface

**Depends on.** this roadmap: `S.2/g-theory-of-a-scheme`; other roadmaps: `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.IsNoetherian`, `mathlib:Module.support`.

**Sources.**

- `Kbook.2013`, Example V.6.11 (PDF p. 423): “In this case we take A = M(X) and B = MZ(X) the category of coherent X-modules supported on Z, i.e., modules whose restriction to U is zero.” — The definition.
- `Kbook.2013`, Application II.6.4.2 (PDF p. 129): “Let modZ(X) denote the Serre subcategory of OX-mod consisting of all OX-modules F with support in Z, i.e., such that F|U = 0.” — The Serre property.

### Gabriel's theorem: Coh(X)/Coh_Z(X) ≃ Coh(U)

`S.3/coherent-quotient-by-support` · lemma

Let X be a noetherian scheme, Z ⊆ X closed and j: U = X ∖ Z → X. Restriction j^*: Coh(X) → Coh(U) is exact, essentially surjective and full on the Serre quotient: it induces an equivalence Coh(X)/Coh_Z(X) ≃ Coh(U).

**Hypotheses.**

- X noetherian; Z closed; U its complement (quasi-compact as X is noetherian).

**Proof.**

1. j^* is exact and kills exactly Coh_Z(X) (S.3/coherent-sheaves-with-support), so it factors through the Serre quotient (the universal property of Gabriel's quotient; GeneralAlgebraicKTheory K.3 uses the same quotient in its localisation theorem).
2. Essential surjectivity: every coherent G on U is the restriction of a coherent sheaf on X: extend G to the quasi-coherent j_*G, and by Stacks 01PF (X qcqs, U quasi-compact) find a finite-type quasi-coherent G' ⊆ j_*G with G'|_U = G; on noetherian X finite type quasi-coherent is coherent.
3. Full faithfulness on the quotient: a map φ: F|_U → F'|_U extends, after replacing F by a coherent subsheaf F_1 ⊆ F with F_1|_U = F|_U (Stacks 01PE(2),(3)), to a map F_1 → F'; F/F_1 ∈ Coh_Z(X), so φ is a map in the quotient; a map killed by j^* has image in Coh_Z(X), hence is zero in the quotient.

**Acceptance.**

- For X = Spec ℤ, Z = V(p): Coh(ℤ)/(finite p-groups) ≃ Coh(ℤ[1/p]).
- For X = Spec O (DVR), Z = closed point: Coh(O)/(finite-length modules) ≃ finite-dimensional L-vector spaces.

**Depends on.** this roadmap: `S.3/coherent-sheaves-with-support`; other roadmaps: `GeneralAlgebraicKTheory:K.3`; libraries: `mathlib:AlgebraicGeometry.IsNoetherian`, `mathlib:AlgebraicGeometry.Scheme.Modules`.

**Sources.**

- `Kbook.2013`, Application II.6.4.2 (PDF p. 129): “Morover, if X is noetherian and MZ(X) denotes the category of coherent sheaves supported in Z, then M(X)/MZ(X) ∼= M(U).” — The statement (attributed to Gabriel).
- `Stacks.Properties`, Lemma 28.23.2 (tag 01PF): “Let G ⊂F|U be a quasi-coherent OU-submodule which is of finite type. Then there exists a quasi- coherent submodule G′ ⊂F which is of finite type such that G′|U = G.” — The extension of coherent sheaves used for essential surjectivity (X qcqs, U quasi-compact).

### Dévissage for coherent sheaves with support

`S.3/coherent-support-devissage` · lemma

Let X be noetherian, Z ⊆ X closed, and i: Z → X any closed subscheme with underlying space Z (for instance the reduced one). Then i_*: Coh(Z) → Coh_Z(X) induces a homotopy equivalence G(Z) = K(Coh(Z)) ≃ K(Coh_Z(X)). In particular G(Z) is independent of the scheme structure on Z, and G(Z_red) ≃ G(Z).

**Hypotheses.**

- X noetherian; i: Z → X a closed immersion with |Z| the given closed subset.

**Proof.**

1. i_* identifies Coh(Z) with the full subcategory of Coh_Z(X) killed by the ideal J of Z; it is closed under subobjects and quotients (an exact abelian subcategory).
2. Every F ∈ Coh_Z(X) is killed by J^n for some n (X noetherian, Supp F ⊆ V(J); Stacks 01PF-type finiteness / EGA I 6.8.4), so the filtration F ⊇ JF ⊇ ⋯ ⊇ J^nF = 0 has subquotients in Coh(Z).
3. Quillen's dévissage theorem (GeneralAlgebraicKTheory:K.3/devissage-theorem) gives K(Coh(Z)) ≃ K(Coh_Z(X)).

**Acceptance.**

- G(Spec k[x]/(x^n)) ≃ K(k) for every n ≥ 1 (Z = V(x^n) ⊂ A¹_k).
- For X = Spec ℤ, Z = V(p): K_n(finite p-groups) ≅ K_n(𝔽_p).

**Depends on.** this roadmap: `S.3/coherent-sheaves-with-support`, `S.2/g-theory-of-a-scheme`; other roadmaps: `GeneralAlgebraicKTheory:K.3/devissage-theorem`.

**Sources.**

- `Kbook.2013`, Exercise V.4.3 (PDF p. 410): “Let Z be a closed subscheme of a noetherian scheme X, and let MZ(X) be the exact category of all coherent X-modules supported on Z. Generalize 4.4 and II. 6.3.4 by showing that G(Z) = KM(Z) ≃KMZ(X).” — The statement (an exercise; the proof is the dévissage argument of Application V.4.4).
- `Kbook.2013`, Application V.4.4 (PDF p. 409): “More generally, given any ideal I we can form the exact category MI(R) of all M such that MIn = 0 for some n. Again by devissage, KMI(R) ≃KM(R/I) and we have K∗MI(R) ∼= G∗(R/I).” — The affine case, from which the scheme case follows as stated.

### Quillen's localisation sequence for G-theory

`S.3/g-theory-localisation` · theorem · planet “Quillen's localisation sequence”

Let X be a noetherian scheme, i: Z → X a closed subscheme and j: U = X ∖ Z → X. Then G(Z) →i_* G(X) →j^* G(U) is a homotopy fibre sequence, with long exact sequence ⋯ → G_n(Z) → G_n(X) → G_n(U) →∂ G_{n−1}(Z) → ⋯ ending in G_0(Z) → G_0(X) → G_0(U) → 0; negative G-groups vanish. It is a sequence of K_*(X)-modules (tensor with vector bundles, or with perfect complexes of finite Tor-amplitude), natural for flat pullback, and ∂ is K_*(X)-linear in the sense of S.3/boundary-module-linearity. For X = Spec R and Z = V(s): ⋯ → G_n(R/sR) → G_n(R) → G_n(R[1/s]) → ⋯ (K-book (6.1.1)).

**Hypotheses.**

- X noetherian; Z closed with any subscheme structure.

**Proof.**

1. Coh_Z(X) is a Serre subcategory of Coh(X) with quotient Coh(U) (S.3/coherent-sheaves-with-support, S.3/coherent-quotient-by-support).
2. Quillen's localisation theorem (GeneralAlgebraicKTheory:K.3/abelian-localization-theorem) gives the fibre sequence K(Coh_Z(X)) → G(X) → G(U) and its long exact sequence ending in K_0 with G_0(X) → G_0(U) onto.
3. Dévissage identifies the fibre with G(Z) through i_* (S.3/coherent-support-devissage).
4. Negative groups: IK_n of a noetherian abelian category vanishes for n < 0 (GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K), so the connective sequence is the nonconnective one.
5. Module structure and naturality: ⊗ with vector bundles is biexact on Coh_Z(X) → Coh(X) → Coh(U) (K-book Ex. V.5.3), and flat pullback preserves the three categories (S.2/g-theory-finite-tor-pullback).

**Acceptance.**

- X = Spec ℤ, Z = V(p): G_1(ℤ) = ℤ^× → G_1(ℤ[1/p]) = ℤ[1/p]^× →∂ G_0(𝔽_p) = ℤ with ∂(p) = 1 (S.3/boundary-of-a-nonzerodivisor), and the sequence ends G_0(𝔽_p) →0 G_0(ℤ) = ℤ →≅ G_0(ℤ[1/p]) = ℤ → 0, the first map vanishing because [𝔽_p] = [ℤ] − [pℤ] = 0.
- Mayer–Vietoris for G (S.4/g-theory-mayer-vietoris) follows by comparing two such sequences.

**Depends on.** this roadmap: `S.3/coherent-sheaves-with-support`, `S.3/coherent-quotient-by-support`, `S.3/coherent-support-devissage`, `S.2/g-theory-of-a-scheme`, `S.2/g-theory-finite-tor-pullback`; other roadmaps: `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K`.

**Sources.**

- `Kbook.2013`, Example V.6.11 (PDF p. 423): “By devissage (Ex. 4.3), KMZ(X) ≃G(Z). Hence we have a homotopy ﬁbration G(Z) →G(X) → G(U), and the localization sequence becomes: · · · ∂ −→Gn(Z) →Gn(X) j∗ −→Gn(U) ∂ −→Gn−1(Z) →· · ·” — The statement.
- `Kbook.2013`, Example V.6.11 (PDF p. 424): “This is a sequence of K∗(X)-modules, because ⊗is a biexact pairing of VB(X) with the sequence M(Z) →M(X) →M(U).” — The module structure.
- `Quillen.1973`, §7, 3.2 and Proposition 3.1 context (printed p. 120): “induces isomorphisms on K-groups, so the desired exact sequence results from Theorem 5.” — Quillen's own derivation of the G-theory localisation sequence from his localisation theorem.

### The Cartan maps compare the support sequence with the G-theory sequence

`S.3/cartan-localisation-comparison` · comparison

Let X be a noetherian scheme, Z ⊆ X closed, U = X ∖ Z. The Cartan maps K(X) → G(X) and K(U) → G(U) (S.2/cartan-map) commute with restriction, so they induce a map of fibre sequences from K(X on Z) → K(X) → K(U) (S.3/localisation-fibre-sequence) to G(Z) → G(X) → G(U) (S.3/g-theory-localisation), and in particular a Cartan map with supports c_Z: K(X on Z) → G(Z) compatible with the boundaries. If X is regular (every local ring regular; TT 3.21's hypothesis), all three maps are equivalences of nonconnective spectra, so K(X on Z) ≃ G(Z), K_n(X on Z) = 0 for n < 0, and the boundaries agree. On objects, c_Z sends E ∈ Perf_Z(X) to Σ_i (−1)^i [H^i(E)] in G_0(Z) ≅ K_0(Coh_Z(X)).

**Hypotheses.**

- X noetherian; for the equivalence, X regular noetherian (then finite-dimensionality is not needed for this statement).

**Proof.**

1. Restriction commutes with the Cartan map (both are induced by the inclusion of perfect complexes into cohomologically bounded pseudo-coherent complexes, which restriction preserves; S.2/cartan-map), so the square K(X) → K(U) over G(X) → G(U) commutes up to canonical homotopy and induces a map on homotopy fibres (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
2. The fibre of G(X) → G(U) is G(Z) by S.3/g-theory-localisation, which gives c_Z and the compatibility of long exact sequences, boundaries included.
3. For regular noetherian X (and its open U), S.2/cartan-equivalence gives K(X) ≃ G(X), K(U) ≃ G(U) as nonconnective spectra (Perf = D^b(Coh) by S.2/perfect-coherent-on-regular, and negative IK of the noetherian abelian category Coh vanishes, GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K); a map of fibre sequences that is an equivalence on two terms is one on the third.
4. On K_0: the Cartan map sends a perfect E to its Euler characteristic of cohomology sheaves in G_0 (S.2/cartan-map), and the cohomology of E ∈ Perf_Z(X) lies in Coh_Z(X).

**Acceptance.**

- X = Spec ℤ_(p), Z = closed point: c_Z: K_0(X on Z) → G_0(𝔽_p) = ℤ sends [cone(p^n)] to [ℤ/p^n] = n.
- Non-example of the equivalence: X = Spec k[ε]/(ε²) = Z, U = ∅: c_Z: K_0(X) = ℤ → G_0(X) = ℤ is multiplication by 2 ([X] ↦ [k[ε]/(ε²)] = 2[k]), so c_Z is not an equivalence for singular X (S.2/cartan-singular-non-example).

**Depends on.** this roadmap: `S.3/localisation-fibre-sequence`, `S.3/g-theory-localisation`, `S.3/support-k-theory`, `S.2/cartan-map`, `S.2/cartan-equivalence`, `S.2/perfect-coherent-on-regular`; other roadmaps: `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`, `GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K`.

**Sources.**

- `Kbook.2013`, Remark V.7.6.2 (PDF p. 433): “A na¨ıve guess for such a model would be the K-theory of the category HZ(X). This is correct if X is regular by the localization sequence ( 6.11) for G-theory, if Z is a divisor ( 7.6.1), and even if Z is locally a complete intersection in X TT [200, 5.7].” — The regular case of the comparison, via the G-theory sequence.
- `ThomasonTrobaugh.1990`, Theorem 3.21 (p. 328): “Then the canonical map is a homotopy equivalence: K(X) ≃ G(X).” — Poincaré duality, for X quasi-compact with all local rings of finite Tor-dimension on finitely presented modules (e.g. regular noetherian), used on X and U.

### Dévissage for supports on regular schemes, and where it fails

`S.3/regular-support-devissage` · theorem · planet “Regular dévissage”

Let X be a regular noetherian scheme and Z ⊆ X closed. Then K(X on Z) ≃ G(Z) (via S.3/cartan-localisation-comparison and S.3/coherent-support-devissage, for any subscheme structure on Z). If moreover Z is regular for some closed subscheme structure i: Z → X (for example i a regular immersion between regular schemes, or Z a point with its reduced structure), then i_*: K(Z) → K(X on Z), induced by Ri_*: Perf(Z) → Perf_Z(X), is an equivalence, and composing with Cartan maps it is the dévissage equivalence G(Z) ≃ K(Coh_Z(X)). The identity K(X on Z) = K(Z) is not unconditional: it fails when Z is singular (e.g. X = A²_k and Z the nodal cubic y² = x³ + x², where K_{−1}(Z) ≅ ℤ but K_{−1}(X on Z) = G_{−1}(Z) = 0) and for non-reduced subscheme structures (Z = V(x²) ⊂ A¹_k, where K_1(Z) = k^× × k but K_1(X on Z) = k^×).

**Hypotheses.**

- X regular noetherian (all local rings regular); Z closed.
- For the K(Z) statement: a regular closed subscheme structure on Z; i proper and perfect because X is regular.

**Proof.**

1. K(X on Z) ≃ G(Z): S.3/cartan-localisation-comparison (X regular) gives K(X on Z) ≃ fibre(G(X) → G(U)) ≃ G(Z).
2. Ri_* sends perfect complexes on Z to perfect complexes on X (X regular, so bounded coherent complexes are perfect: S.2/perfect-coherent-on-regular) supported on Z; it is the pushforward of S.2/k-theory-proper-pushforward restricted to supports, and on G-theory it is i_*: Coh(Z) → Coh_Z(X) (S.2/cartan-map commutes with proper pushforward).
3. Z regular gives K(Z) ≃ G(Z) (S.2/cartan-equivalence); combined with S.3/coherent-support-devissage the composite K(Z) → K(X on Z) → G(Z) is the Cartan equivalence of Z, so i_* is an equivalence.
4. Failure for singular Z: for the affine nodal cubic R = k[x, y]/(y² − x² − x³) with normalisation k[t] and conductor I, Bass–Murthy (K-book Ex. III.4.4) gives K_{−1}(R) ≅ ℤ^r with r = h0(R) − h0(k[t]) + h0(k[t]/I) − h0(R/I) = 1 − 1 + 2 − 1 = 1, whereas G_{−1}(Z) = 0 (K.6 vanishing for noetherian abelian categories).
5. Failure for non-reduced Z = V(x²): K_1(k[x]/(x²)) = (k[x]/(x²))^× ≅ k^× × k (KTheoryLowDegrees U.3/SK1-local), while K_1(A¹ on 0) ≅ G_1(Spec k) = k^×.

**Acceptance.**

- X = Spec O (DVR), Z = closed point: K(X on Z) ≃ K(k); K_0(X on Z) ≅ ℤ with [cone(π)] ↦ 1.
- X = A²_k, Z = {0}: K_n(A² on 0) ≅ K_n(k) for all n.
- X = A²_k, Z the node: K(X on Z) ≃ G(Z) but not ≃ K(Z).

**Depends on.** this roadmap: `S.3/cartan-localisation-comparison`, `S.3/coherent-support-devissage`, `S.3/support-k-theory`, `S.2/cartan-equivalence`, `S.2/perfect-coherent-on-regular`, `S.2/k-theory-proper-pushforward`, `S.2/cartan-map`; other roadmaps: `GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K`, `KTheoryLowDegrees:U.3/SK1-local`.

**Sources.**

- `Kbook.2013`, Remark V.7.6.2 (PDF p. 433): “Since the model KChperf,Z(X) for the ﬁber K(X on Z) of K(X) →K(U) is complicated, it would be nice to have a simpler model.” — The need for a hypothesis-qualified dévissage; the regular case is the next sentence.
- `Kbook.2013`, Exercise III.4.4 (PDF p. 223): “If h0(R) denotes the rank of the free abelian group H0(R) = [Spec(R), Z], show that K−1(R) ∼= L Pic(R) ∼= Zr, where r = h0(R) −h0( eR) + h0( eR/I) −h0(R/I).” — K_{−1} of a one-dimensional noetherian ring with finite normalisation R̃ and conductor I (Bass–Murthy), used for the node non-example: r = 1.
- `Kbook.2013`, Example I.3.10.2 (PDF p. 34): “Example 3.10.2 (Node). Let R be k[x, y]/(y2 = x2 + x3), the coordinate ring of the node in the plane over a ﬁeld k with char(k)̸ = 2.” — The node used as the non-example.

### The degree-one boundary of an element

`S.3/boundary-of-a-nonzerodivisor` · lemma

Let R be a commutative noetherian ring and s ∈ R, with localisation sequence ⋯ → G_1(R) → G_1(R[1/s]) →∂ G_0(R/sR) → ⋯ of S.3/g-theory-localisation (Z = V(s)). The class [s] ∈ K_1(R[1/s]) = π_1K(R[1/s]) of the 1 × 1 matrix (s), mapped to G_1(R[1/s]) by the Cartan map, satisfies ∂[s] = [R/sR] − [I] in G_0(R/sR), where I = {r ∈ R : sr = 0}; in particular ∂[s] = [R/sR] when s is a nonzerodivisor. More generally, for an endomorphism α of a finitely generated R-module M that becomes an automorphism over R[1/s], ∂[α] = [coker α] − [ker α] in K_0(Coh_{V(s)}(Spec R)) ≅ G_0(R/sR).

**Hypotheses.**

- R commutative noetherian; s ∈ R; K_1 classes of automorphisms taken through the + = Q comparison.

**Proof.**

1. The class of an automorphism α of an object of an exact category is the element [α] ∈ π_2 BQ of K-book Ex. IV.7.9, and under + = Q it is the class of α in π_1BGL^+ (GeneralAlgebraicKTheory K.2:plus, requested: K-book Ex. IV.7.9(c)).
2. For a Serre subcategory B ⊆ A and an endomorphism α of A ∈ A that is an isomorphism in A/B, Quillen's boundary sends [α] to [coker α] − [ker α] (K-book Ex. V.5.1, requested from GeneralAlgebraicKTheory K.3 together with its abelian localisation theorem).
3. Apply it to A = Coh(Spec R), B = Coh_{V(s)}(Spec R) (quotient Coh(R[1/s]) by S.3/coherent-quotient-by-support) and α = multiplication by s on M = R: coker α = R/sR and ker α = I, both in B.
4. The sign agrees with the normalisation fixed in S.3/localisation-boundary; with dévissage (S.3/coherent-support-devissage) the class lives in G_0(R/sR).

**Acceptance.**

- R = ℤ, s = 12: ∂[12] = [ℤ/12] ∈ G_0 of V(12) = {2, 3}, i.e. (2, 1) ∈ G_0(𝔽_2) ⊕ G_0(𝔽_3) = ℤ² (lengths of ℤ/12 localised at 2 and 3).
- R = k[x, y]/(xy), s = x: ∂[x] = [R/xR] − [yR] (the annihilator of x is yR ≅ k[y]·y), not [R/xR].

**Depends on.** this roadmap: `S.3/g-theory-localisation`, `S.3/coherent-quotient-by-support`, `S.3/coherent-support-devissage`, `S.3/localisation-boundary`; other roadmaps: `GeneralAlgebraicKTheory:K.3`, `GeneralAlgebraicKTheory:K.2:plus`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`.

**Sources.**

- `Kbook.2013`, Example V.6.1.2 (PDF p. 414): “It is useful to observe that any s ∈S determines an element [s] of K1(R[1/s]) and hence G1(R[1/s]), and that ∂(s) ∈G0(R/sR) is [R/sR]−[I], where I = {r ∈R : sr = 0}. This formula is immediate from Ex. 5.1. In particular, when R is a domain we have ∂(s) = [R/sR].” — The statement.
- `Kbook.2013`, Exercise V.5.1 (PDF p. 413): “Suppose that α : A →A is a morphism in A which is an isomorphism in A/B, and so determines an element [α] of K1(A/B). Show that ∂: K1(A/B) → K0(B) sends [α] to [coker(α)] −[ker(α)].” — The general boundary formula, an exercise with the hint recorded in the proof steps (a gap in the source).
- `Kbook.2013`, Exercise IV.7.9 (PDF pp. 340-341): “(c) Finally, lift this diagram to EA using Ex. 7.8, representing a map I2 → BEA, and conclude that the isomorphism between K1(A) = π2BQA and K1(S) = π1(S−1S) of Theorem 7.1 identiﬁes [α] with the class of α” — The comparison of the automorphism class in π_2 BQ with the GL class.

### G-theory commutes with limits along affine flat transition maps

`S.3/g-theory-continuity` · lemma

Let (X_i) be a filtered projective system of noetherian schemes with affine flat transition maps whose limit X = lim X_i is noetherian. Then G_n(X) = colim_i G_n(X_i) for all n, the maps being flat pullbacks (Quillen §7 Proposition 2.2). In particular, for a noetherian integral scheme X with generic point η, colim_U G_n(U) = K_n(k(η)) over nonempty opens U, and for a point x, colim_{U ∋ x} G_n(U) = G_n(O_{X,x}).

**Hypotheses.**

- Noetherian schemes; affine flat transition maps; noetherian limit.

**Proof.**

1. Coh(X) is the filtered colimit of the categories Coh(X_i) along flat pullback, exact sequences included (EGA IV 8.5; noetherian approximation is requested from AdicCoefficientsAndComparisons L2, whose text owns 'limits of schemes with affine transition maps, finite-presentation descent of morphisms and diagrams').
2. Quillen K-theory commutes with filtered colimits of exact categories (GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits).
3. For the generic point: Spec k(η) = lim_U U with affine flat transition maps between affine opens, and G(k(η)) = K(k(η)); similarly Spec O_{X,x} = lim_{U∋x} U.

**Acceptance.**

- For X = Spec ℤ: colim_N G_1(ℤ[1/N]) = ℚ^× = K_1(ℚ).
- For a curve X over k with function field F: colim_U G_n(U) = K_n(F).

**Depends on.** this roadmap: `S.2/g-theory-of-a-scheme`, `S.2/g-theory-finite-tor-pullback`; other roadmaps: `AdicCoefficientsAndComparisons:L2`, `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`.

**Sources.**

- `Quillen.1973`, §7, Proposition 2.2 (printed p. 117): “Let i ↦ X_i be a filtered projective system of schemes such that the transition morphisms X_i → X_j are affine, and let X = lim X_i. Then (2.3) K_qX = lim K_qX_i. If in addition the transition morphisms are flat, then (2.4) K'_qX = lim K'_qX_i.” — The statement (scan text normalised: the subscripts and the colimit arrows are as printed); the second clause is the G-theory case.

### The K_1 class of a unit: the loop of a 1 × 1 matrix

`S.3/unit-loop-class` · construction

For a commutative ring A, λ_A: A^× → K_1(Spec A) = π_1 K(Spec A) sends u to the image of the loop u ∈ π_1 BGL_1(A) = GL_1(A) (StableHomotopyKTheory H.1: π_1 of the classifying space of a group) under BGL_1(A) → BGL(A) → BGL(A)^+ (H.3), the identification of BGL(A)^+ with the base-point component of ΩBQP(A) (GeneralAlgebraicKTheory K.2:plus/plus-equals-Q), and K(A) ≃ K(Spec A) in degrees ≥ 1 (SchemeKTheoryOperations S.2/affine-k-theory-comparison). It is a group homomorphism (multiplicative to additive) and natural for ring homomorphisms. It factors as the canonical map GL(A)/E(A) → π_1BGL(A)^+ (H.3's plus construction kills the perfect normal subgroup E(A) = [GL(A), GL(A)], KTheoryLowDegrees U.1/whitehead-lemma) after K1.ofUnits: A^× → K_1(A) (U.3/units-to-K1). That the canonical map is an isomorphism is KTheoryLowDegrees U.6's theorem and is not used here.

**Hypotheses.**

- A commutative; the plus construction is taken with respect to E(A) ⊆ GL(A).

**Proof.**

1. π_1 BGL_1(A) = A^× and the loop of u is a homomorphism A^× → π_1 BGL_1(A) (StableHomotopyKTheory:H.1/nerve-and-classifying-space, H.1/coverings-fundamental-group-local-coefficients).
2. BGL_1(A) → BGL(A) is induced by the stabilisation g ↦ diag(g, 1, 1, …) (KTheoryLowDegrees U.1/stabilisation-map); BGL(A) → BGL(A)^+ is the plus construction (StableHomotopyKTheory:H.3/plus-construction-universal-property), a map of H-spaces on π_1.
3. GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q identifies the base-point component of ΩBQP(A) with BGL(A)^+ (after choosing component representatives), and S.2/affine-k-theory-comparison identifies K(A) with K(Spec A); compose.
4. Naturality: all three steps are functorial in ring maps A → B (K.2:plus's naturality clause; S.2/affine-pullback-is-scalar-extension).
5. The factorisation through GL(A)/E(A): the plus construction kills E(A) (H.3), and E(A) is the commutator subgroup (U.1/whitehead-lemma); 1 × 1 matrices give K1.ofUnits.

**API.**

- `unitLoopClass` (data): λ_A: A^× →* Additive (K_1(Spec A)), u ↦ loop of the 1 × 1 matrix u.
- `unitLoopClass_one` (simp): λ_A(1) = 0.
- `unitLoopClass_mul` (simp): λ_A(uv) = λ_A(u) + λ_A(v).
- `unitLoopClass_map` (functoriality): For φ: A → B, φ^* λ_A(u) = λ_B(φ(u)).
- `unitLoopClass_eq_ofUnits` (compatibility): λ_A = (GL(A)/E(A) → π_1BGL(A)^+ → K_1(Spec A)) ∘ K1.ofUnits (KTheoryLowDegrees U.3/units-to-K1).
- `unitLoopClass_prod` (relation): For u, w ∈ A^×, λ(u)·λ(w) ∈ K_2(Spec A) is the product of GeneralAlgebraicKTheory K.7; it is bilinear in (u, w).

**Unit tests.**

- `unitLoopClass.one` (degenerate): λ_A(1) = 0 for every commutative ring A.
- `unitLoopClass.dvr_valuation` (computation): For O = ℤ_(p), L = ℚ: ∂_S(λ(p²/3)) = 2 for p ≠ 3 (S.3/dvr-boundary-unit-valuation), so λ(p²/3) ≠ 0.
- `unitLoopClass.not_additive_in_u` (non-example): λ is multiplicative-to-additive, not additive in u: for O = ℤ_(3), ∂_S λ(3 + 3) = ∂_S λ(6) = 1 whereas ∂_S(λ(3) + λ(3)) = 2.
- `unitLoopClass.compat_classical` (compatibility): For a field F and u ∈ F^×, λ_F(u) is the image of K1.ofUnits u ∈ K_1(F) (KTheoryLowDegrees U.3) under the canonical map to π_1BGL(F)^+.

**Acceptance.**

- λ_A(1) = 0 and λ_A(uv) = λ_A(u) + λ_A(v).
- For a DVR O with uniformiser π, ∂λ_L(π) = [k] (S.3/dvr-boundary-unit-valuation).

**Used by.**

- KTheoryLowDegrees U.5/dvr-boundary-localisation-comparison: ∂_S ∘ λ is compared with the explicit cokernel-length boundary
- S.3/dvr-boundary-unit-valuation: the unit-valuation normalisation is stated on λ(u)
- K-book V.6.6.1 and V.6.7: products {s, a} = λ(s)·a define the specialisation map and split Gersten's DVR sequence

**Depends on.** this roadmap: `S.2/affine-k-theory-comparison`, `S.2/affine-pullback-is-scalar-extension`; other roadmaps: `StableHomotopyKTheory:H.1/nerve-and-classifying-space`, `StableHomotopyKTheory:H.1/coverings-fundamental-group-local-coefficients`, `StableHomotopyKTheory:H.3/plus-construction-universal-property`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `KTheoryLowDegrees:U.1/stabilisation-map`, `KTheoryLowDegrees:U.1/whitehead-lemma`, `KTheoryLowDegrees:U.3/units-to-K1`.

**Sources.**

- `Kbook.2013`, Exercise IV.7.9 (PDF p. 340): “Given an automorphism α of an object A in A, consider the continuous map [0, 1]2 →BQA given by the commutative diagram” — The π_2 BQ representative of an automorphism class; part (c) of the exercise compares it with the GL class used here.
- `Kbook.2013`, Definition IV.1.1 (PDF p. 268): “The notation BGL(R)+ will denote any CW complex X which has a distinguished map BGL(R) →BGL(R)+ such that (1) π1BGL(R)+ ∼= K1(R), and the natural map from GL(R) = π1BGL(R) to π1BGL(R)+ is onto with kernel E(R);” — The plus construction and the map GL(R) = π_1BGL(R) → π_1BGL(R)^+ through which λ is defined; its bijectivity onto GL/E is the part owned by KTheoryLowDegrees U.6 and not used.

### The localisation sequence of a discrete valuation ring

`S.3/dvr-localisation-sequence` · application

Let O be a discrete valuation ring with fraction field L, residue field k and closed immersion i: Spec k → Spec O. Then K(k) →i_* K(O) → K(L) is a homotopy fibre sequence (K(A) := K(Spec A)), with long exact sequence ⋯ → K_n(k) →i_* K_n(O) → K_n(L) →∂_S K_{n−1}(k) → ⋯ in all degrees; all negative groups vanish, and the sequence ends K_1(L) →∂_S K_0(k) →0 K_0(O) →≅ K_0(L) → 0, with K_0(O) ≅ K_0(L) ≅ K_0(k) ≅ ℤ by rank. The first map i_* is the transfer along O → k (G-theory pushforward), and its connecting map is the DVR boundary ∂_S (constructed from this sequence in S.3/dvr-boundary). The sequence is one of K_*(O)-modules.

**Hypotheses.**

- O a DVR (Mathlib IsDiscreteValuationRing); L = Frac O; k = O/m.

**Proof.**

1. S.3/localisation-fibre-sequence for X = Spec O, U = Spec L (a quasi-compact open; U = D(π)), Y = {m}.
2. O and k are regular noetherian, so S.3/regular-support-devissage gives i_*: K(k) ≃ K(Spec O on {m}).
3. Negative groups: K(Spec O on {m}) ≃ G(k), K(O) ≃ G(O), K(L) ≃ G(L) (S.3/cartan-localisation-comparison), and negative G vanishes (GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K).
4. K_0: K_0(O) and K_0(L) are ℤ by rank (KTheoryLowDegrees Z.2/local-ring-k0 and Z.2/division-ring-k0, through S.2/affine-k-theory-comparison), the map is the identity on ranks, so K_0(O) → K_0(L) is an isomorphism and i_*: K_0(k) → K_0(O) is zero (i_*[k] = [O/πO] = [O] − [πO] = 0).
5. Module structure: S.3/boundary-module-linearity with W = X.

**Acceptance.**

- For O = ℤ_(p): K_0(𝔽_p) →0 K_0(ℤ_(p)) = ℤ ≅ K_0(ℚ) and K_1(ℚ) →∂_S K_0(𝔽_p) = ℤ is onto (∂_S λ(p) = 1).
- Gersten's conjecture for O is the statement that i_* = 0 in all degrees (S.4/gersten-dvr-equicharacteristic proves it when O contains a field).

**Depends on.** this roadmap: `S.3/localisation-fibre-sequence`, `S.3/regular-support-devissage`, `S.3/cartan-localisation-comparison`, `S.3/boundary-module-linearity`, `S.2/affine-k-theory-comparison`; other roadmaps: `GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K`, `KTheoryLowDegrees:Z.2/local-ring-k0`, `KTheoryLowDegrees:Z.2/division-ring-k0`; libraries: `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `Kbook.2013`, Gersten's DVR Conjecture 6.9 (PDF p. 421): “Suppose that R is a discrete valuation do- main with maximal ideal m = sR, residue ﬁeld k = R/m and ﬁeld of fractions F = R[s−1]. The localization sequence ( 6.6) becomes · · · ∂ −→Kn(k) i∗ −→Kn(R) →Kn(F) ∂ −→Kn−1(k) i∗ −→Kn−1(R) →· · · .” — The sequence.
- `Kbook.2013`, Dedekind domains, (6.6) (PDF p. 417): “Then R and F and regular, as are the residue ﬁelds R/p, so K∗(R) ∼= G∗(R), etc.” — Regularity reduces the K-sequence to the G-sequence (the source's 'and' is 'are').

### The boundary of a discrete valuation ring

`S.3/dvr-boundary` · construction · planet “Valuation boundary of a DVR”

For a discrete valuation ring O with fraction field L and residue field k, ∂_S: K_n(L) → K_{n−1}(k) (n ∈ ℤ) is the connecting map of S.3/localisation-fibre-sequence for (Spec O, Spec L, {m}) (S.3/localisation-boundary, with its sign) followed by the inverse of the dévissage equivalence i_*: K(k) ≃ K(Spec O on {m}) (S.3/regular-support-devissage). It is the boundary of the localisation sequence K(k) → K(O) → K(L) of S.3/dvr-localisation-sequence. Normalisation: ∂_S(λ(π)) = [k] ↦ 1 ∈ ℤ ≅ K_0(k) for any uniformiser π (S.3/dvr-boundary-unit-valuation). This is RS-18's single owner of the DVR unit boundary; KTheoryLowDegrees U.5 compares its explicit cokernel-length boundary with ∂_S ∘ λ and K2SymbolsBrauer T.3 compares the tame symbol with ∂_S on K_2.

**Hypotheses.**

- O a DVR with uniformiser π and normalised valuation v (IsDiscreteValuationRing.addVal extended to L^×); k = O/m.

**Proof.**

1. Take ∂: K_n(Spec L) → K_{n−1}(Spec O on {m}) from S.3/localisation-boundary.
2. Compose with (i_*)^{-1}: K_{n−1}(Spec O on {m}) ≅ K_{n−1}(k) (S.3/regular-support-devissage; O and k regular).
3. The identities in the API are S.3/dvr-localisation-sequence (exactness), S.3/boundary-module-linearity (linearity), S.3/boundary-pullback-naturality (flat base change) and S.3/dvr-boundary-unit-valuation (normalisation).

**API.**

- `dvrBoundary` (data): ∂_S: K_n(L) →+ K_{n−1}(k) for n ∈ ℤ.
- `dvrBoundary_comp_restrict` (simp): ∂_S ∘ (O → L)^* = 0.
- `dvrBoundary_exact` (characterisation): ker ∂_S = im(K_n(O) → K_n(L)) and im ∂_S = ker(i_*: K_{n−1}(k) → K_{n−1}(O)).
- `dvrBoundary_unitLoopClass` (simp): ∂_S(λ(u)) = v(u)·[k] (S.3/dvr-boundary-unit-valuation).
- `dvrBoundary_uniformizer` (simp): ∂_S(λ(π)) = [k] for every uniformiser π.
- `dvrBoundary_mul_right` (relation): ∂_S(x·y) = ∂_S(x)·ȳ for y ∈ K_*(O) with image ȳ ∈ K_*(k).
- `dvrBoundary_unit_product` (relation): ∂_S(λ(f)·λ(u)) = v(f)·λ_k(ū) for u ∈ O^× (S.3/dvr-boundary-on-unit-products).
- `dvrBoundary_flat_ramification` (functoriality): For a local flat map O → O' of DVRs with mO' = m'^e, ∂_S'(x_{L'}) = e·(k → k')^*(∂_S x): pulling back the support category multiplies by the length e of O'/mO' (S.3/boundary-pullback-naturality).
- `dvrBoundary_completion` (compatibility): The completion O → Ô (e = 1) and the henselisation O → O^h identify the boundaries (S.3/excision on the support term).
- `dvrBoundary_left_normalisation` (compatibility): ∂^left_n = (−1)^{n−1}∂_S satisfies ∂^left(x·y) = x̄·∂^left(y) for x ∈ K_*(O): this is KTheoryFiniteLocalFields L.2/dvr-localisation's convention; on K_2, ∂^left is the inverse of ∂_S in multiplicative notation (EllipticKTheory E.3/the-tame-symbol-boundary).
- `dvrBoundary_explicit` (compatibility): ∂_S ∘ λ agrees with KTheoryLowDegrees U.5's explicit cokernel-length boundary on K_1(L) (proved there, U.5/dvr-boundary-localisation-comparison).

**Unit tests.**

- `dvrBoundary.padic_uniformiser` (computation): O = ℤ_(p): ∂_S(λ(p)) = 1, ∂_S(λ(1/p)) = −1, and for p = 2, ∂_S(λ(12)) = 2, in K_0(𝔽_p) ≅ ℤ.
- `dvrBoundary.units_zero` (degenerate): ∂_S(λ(u)) = 0 for u ∈ O^×; ∂_S = 0 on K_0(L) (K_{−1}(k) = 0).
- `dvrBoundary.power_series` (compatibility): O = k[[t]]: ∂_S(λ(t)) = [k], matching Mathlib's IsDiscreteValuationRing.addVal_uniformizer (v(t) = 1).
- `dvrBoundary.ramified` (computation): O = ℤ_(2) ⊂ O' = ℤ_(2)[i] localised at (1 + i) (e = 2): ∂_S'(λ(2)) = 2 = e·∂_S(λ(2)), and ∂_S'(λ(1 + i)) = 1.
- `dvrBoundary.sign` (non-example): The opposite orientation −∂_S sends λ(π) to −1 and fails dvrBoundary.padic_uniformiser and KTheoryLowDegrees U.6/uniformiser-boundary-one.

**Acceptance.**

- ∂_S vanishes on the image of K_n(O) and is onto K_{n−1}(k) whenever i_* = 0 on K_{n−1}(k).
- ∂_S(λ(π)) = [k] for every uniformiser π.

**Used by.**

- KTheoryLowDegrees U.5/dvr-boundary-localisation-comparison and U.6/uniformiser-boundary-one: ∂_S ∘ λ equals the explicit boundary; the uniformiser goes to 1
- K2SymbolsBrauer T.3/localization-boundary: ∂_S on K_2(L) is the tame symbol with the sign fixed there (import blocked by a stage cycle, see restructure)
- K-book V.6.6.4, V.6.7, V.6.9: specialisation maps, Gersten's DVR conjecture
- S.3/unit-boundary-is-divisor and S.4/coniveau-residue-differential: residues at codimension-one points are DVR boundaries of local rings
- EllipticKTheory E.3/E.6, KTheoryFiniteLocalFields L.2: residues of curves and arithmetic surfaces; local fields

**Depends on.** this roadmap: `S.3/localisation-boundary`, `S.3/regular-support-devissage`, `S.3/dvr-localisation-sequence`, `S.3/boundary-module-linearity`, `S.3/boundary-pullback-naturality`; libraries: `mathlib:IsDiscreteValuationRing`, `mathlib:IsDiscreteValuationRing.addVal`.

**Sources.**

- `Kbook.2013`, Gersten's DVR Conjecture 6.9 (PDF p. 421): “The localization sequence ( 6.6) becomes · · · ∂ −→Kn(k) i∗ −→Kn(R) →Kn(F) ∂ −→Kn−1(k) i∗ −→Kn−1(R) →· · · .” — The boundary ∂ of the DVR sequence.
- `Kbook.2013`, Proof of Theorem V.6.9.1 (PDF p. 422): “Since ∂(s′) = [R′/s′R′] = [k] by III. 3.1.1, we see that” — The normalisation on a parameter.

### The DVR boundary on units is the valuation

`S.3/dvr-boundary-unit-valuation` · theorem

Let O be a discrete valuation ring with fraction field L, residue field k and normalised valuation v: L^× → ℤ (v(π) = 1). Then ∂_S(λ(u)) = v(u)·[k] in K_0(k) for every u ∈ L^×, where λ = λ_L: L^× → π_1K(L) is S.3/unit-loop-class and ∂_S: K_1(L) → K_0(k) is S.3/dvr-boundary; under K_0(k) ≅ ℤ ([k] ↦ 1), ∂_S ∘ λ = v. In particular ∂_S(λ(π)) = 1 for every uniformiser and ∂_S ∘ λ vanishes on O^×. This is the form imported by KTheoryLowDegrees U.5/dvr-boundary-localisation-comparison and U.6/uniformiser-boundary-one (RS-18 owner: 'DVR unit boundary equals valuation with the uniformizer normalization').

**Hypotheses.**

- O a DVR (IsDiscreteValuationRing); v = IsDiscreteValuationRing.addVal on O extended to L^× by v(a/b) = v(a) − v(b).
- λ uses only H.1, H.3 and K.2:plus (S.3/unit-loop-class); no identification of K_1(L) with L^× is used.

**Proof.**

1. Units: for u ∈ O^×, λ_L(u) = (O → L)^* λ_O(u) (naturality of λ), so ∂_S λ_L(u) = 0 by exactness (S.3/dvr-localisation-sequence), and v(u) = 0.
2. Nonzero non-units a ∈ O: O[1/a] = L and V(a) = {m}. Through S.3/cartan-localisation-comparison (O regular) ∂ becomes the boundary of Quillen's G-sequence for (Spec O, V(a)), and λ_L(a) becomes the class of the automorphism a of the L-vector space L, i.e. the element [a] of K-book Example V.6.1.2 (the identification of the loop class with the automorphism class is K-book Ex. IV.7.9(c), requested from GeneralAlgebraicKTheory K.2:plus).
3. S.3/boundary-of-a-nonzerodivisor (O a domain): ∂[a] = [O/aO] ∈ G_0(O/aO) = K_0(Coh_{m}(Spec O)).
4. Dévissage (S.3/coherent-support-devissage) sends a finite-length O-module M to ℓ_O(M)·[k] (a composition series has all factors ≅ k; additivity of K_0 and Mathlib's Module.length_eq_add_of_exact). With a = wπ^n, w ∈ O^× (IsDiscreteValuationRing.eq_unit_mul_pow_irreducible), O/aO = O/m^n has length n (IsDiscreteValuationRing.length_quotient_pow_maximalIdeal) and n = v(a).
5. General u = a/b with a, b ∈ O ∖ {0}: λ(u) = λ(a) − λ(b) (λ a homomorphism), so ∂_S λ(u) = (v(a) − v(b))·[k] = v(u)·[k].
6. The sign is the one pinned in S.3/localisation-boundary, which is defined so that this value is +[k].

**Acceptance.**

- O = ℤ_(p): ∂_S λ(p) = 1, ∂_S λ(−p) = 1, ∂_S λ(p²/3) = 2 for p ≠ 3, ∂_S λ(1/p) = −1.
- O = k[[t]]: ∂_S λ(t) = 1; O = ℤ[i]_(1+i): ∂_S λ(1 + i) = 1 and ∂_S λ(2) = 2 (2 = −i(1 + i)²).
- The composite ∂_S ∘ λ, not ∂_S on an abstract identification K_1(L) ≅ L^×, is what is computed.

**Depends on.** this roadmap: `S.3/unit-loop-class`, `S.3/dvr-boundary`, `S.3/dvr-localisation-sequence`, `S.3/cartan-localisation-comparison`, `S.3/boundary-of-a-nonzerodivisor`, `S.3/coherent-support-devissage`, `S.3/localisation-boundary`; other roadmaps: `GeneralAlgebraicKTheory:K.2:plus`; libraries: `mathlib:IsDiscreteValuationRing.eq_unit_mul_pow_irreducible`, `mathlib:IsDiscreteValuationRing.length_quotient_pow_maximalIdeal`, `mathlib:IsDiscreteValuationRing.addVal`, `mathlib:Module.length_eq_add_of_exact`.

**Sources.**

- `Kbook.2013`, Proof of Theorem V.6.9.1 (PDF p. 422): “If a′ i ∈R× is a lift of ai and s ∈R is a parameter then ∂: K1(F) →K0(k) sends s to [k] by III. 1.1.” — The normalisation on a parameter (the citation 'III.1.1' is III.3.1.1: KTheoryLowDegrees/E109).
- `Kbook.2013`, Example V.6.1.2 (PDF p. 414): “In particular, when R is a domain we have ∂(s) = [R/sR].” — The boundary of a nonzero element of a domain, the step that computes ∂λ(a).
- `Kbook.2013`, V.6.6 (PDF p. 417): “Writing K1(R) = R× ⊕SK1(R) (see III. 1.1.1), the formula 6.1.2 allows us to identify the ending with the sequence 1 →R× →F × div> D(R) →K0(R) → Z →0 of I. 3.6.” — The divisor (valuation) description of the degree-one boundary.

### The DVR boundary on products with a unit

`S.3/dvr-boundary-on-unit-products` · theorem

Let O be a DVR with fraction field L, residue field k, and u ∈ O^× with residue ū ∈ k^×. For every f ∈ L^×: ∂_S(λ(f)·λ(u)) = v(f)·λ_k(ū) in K_1(k), and ∂_S(λ(u)·λ(f)) = −v(f)·λ_k(ū), products being those of GeneralAlgebraicKTheory K.7 in K_2(L); for u, w ∈ O^×, ∂_S(λ(u)·λ(w)) = 0. More generally ∂_S(x·λ(u)) = ∂_S(x)·λ_k(ū) for x ∈ K_n(L). In multiplicative notation on K_1(k) this is ∂{f, u} = ū^{v(f)}, the tame symbol's value on such pairs in the K-book's normalisation. The value ∂_S(λ(π)·λ(π)) = λ_k(−1) and the identification of ∂_S on all of K_2(L) with the tame symbol need Matsumoto's theorem and the Steinberg relation for products of units, which are K2SymbolsBrauer T.2/T.3's and are not imported here (gap and restructure).

**Hypotheses.**

- O a DVR; u ∈ O^×; f ∈ L^×; λ from S.3/unit-loop-class; products from K.7; sign conventions of S.3/boundary-module-linearity.

**Proof.**

1. λ_L(u) = j^*λ_O(u) with λ_O(u) ∈ K_1(O) (naturality of λ).
2. Right linearity (S.3/boundary-module-linearity for the DVR): ∂_S(x·j^*y) = ∂_S(x)·ȳ, with ȳ the image of y ∈ K_*(O) in K_*(k); for y = λ_O(u), ȳ = λ_k(ū) (naturality of λ along O → k).
3. With x = λ(f): ∂_S(λ(f))·λ_k(ū) = v(f)[k]·λ_k(ū) = v(f)·λ_k(ū), since [k] is the unit of K_0(k) and the K_0-product is the classical one (GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products; S.3/dvr-boundary-unit-valuation).
4. Left factor: λ(u)·λ(f) = −λ(f)·λ(u) by graded commutativity of K_*(L) (K.7), giving −v(f)·λ_k(ū).
5. Two units: λ(u)·λ(w) = j^*(λ_O(u)·λ_O(w)) comes from K_2(O), so ∂_S kills it by exactness.

**Acceptance.**

- O = ℤ_(5), f = 5, u = 2: ∂_S(λ(5)·λ(2)) = λ_{𝔽_5}(2), i.e. 2 ∈ 𝔽_5^×, agreeing with the K-book's tame symbol ∂_5(5, 2) = 2 (K2SymbolsBrauer T.3/tame-symbol records that its roadmap normalisation gives 3 = 2^{−1} there).
- ∂_S(λ(2)·λ(3)) = 0 for O = ℤ_(5).

**Depends on.** this roadmap: `S.3/unit-loop-class`, `S.3/dvr-boundary`, `S.3/dvr-boundary-unit-valuation`, `S.3/boundary-module-linearity`, `S.3/dvr-localisation-sequence`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`.

**Sources.**

- `Kbook.2013`, V.6.6.1 (PDF p. 417): “In this case, we know that ∂in K∗(R)-linear, so if u ∈R× has image ¯u ∈R/p then ∂{π, u} = [¯u] in R/p×.” — The computation on {π, u} (the source's 'in' is 'is'); the node extends it to {f, u} and records the sign for {u, f}.
- `Kbook.2013`, V.6.6.1 (PDF p. 417): “Similarly, ∂ sends {π, π} = {π, −1} to {∂π, −1} = [R/π] · [−1], which is the class of the unit −1.” — The remaining generator, which uses the Steinberg relation {π, −π} = 0 and is therefore left to K2SymbolsBrauer T.3.

### The specialisation map of a DVR with a chosen parameter

`S.3/specialisation-map` · construction

Let O be a DVR with fraction field L, residue field k and parameter s (a uniformiser). The specialisation map λ_s: K_n(L) → K_n(k) is λ_s(a) := ∂_S(λ(s)·a) (K-book V.6.6.4, where it is written ∂({s, a})). It depends on s: for s' = us with u ∈ O^×, λ_{s'}(a) = λ_s(a) − λ_k(ū)·∂_S(a) = λ_s(a) + (−1)^n ∂_S(a)·λ_k(ū) (sign derived from the right linearity of ∂_S and graded commutativity; this corrects the printed sign of V.6.6.4 for even n, see sourceIssues). For a ∈ K_n(O), λ_s(j^*a) is the reduction of a (S.3/specialisation-of-restriction).

**Hypotheses.**

- O a DVR, s a uniformiser; products from GeneralAlgebraicKTheory K.7; ∂_S right-linear (S.3/boundary-module-linearity).

**Proof.**

1. Define λ_s(a) = ∂_S(λ(s)·a); it is additive in a since ∂_S and the product are.
2. Change of parameter: λ(us) = λ(u) + λ(s), so λ_{us}(a) − λ_s(a) = ∂_S(λ(u)·a); by graded commutativity λ(u)·a = (−1)^n a·j^*λ_O(u), and right linearity gives (−1)^n ∂_S(a)·λ_k(ū); graded commutativity in K_*(k) turns this into −λ_k(ū)·∂_S(a).
3. Check in degree one: for a = λ(s), λ_{us}(λ(s)) − λ_s(λ(s)) = −λ_k(ū)·[k] = −λ_k(ū) (the K-book's formula agrees in odd degrees).

**API.**

- `specialisation` (data): λ_s: K_n(L) →+ K_n(k), λ_s(a) = ∂_S(λ(s)·a).
- `specialisation_restrict` (simp): λ_s(j^*a) = π^*a for a ∈ K_n(O) (S.3/specialisation-of-restriction).
- `specialisation_change_parameter` (relation): λ_{us}(a) = λ_s(a) − λ_k(ū)·∂_S(a).
- `specialisation_unitLoopClass_param` (simp): λ_s(λ(s)) = ∂_S(λ(s)·λ(s)); in degree one λ_s(λ(w)) = λ_k(w̄) for units w.
- `specialisation_linear` (relation): λ_s(a·j^*y) = λ_s(a)·ȳ for y ∈ K_*(O).

**Unit tests.**

- `specialisation.units` (computation): O = ℤ_(5), s = 5: λ_5(λ(2)) = λ_{𝔽_5}(2) ∈ K_1(𝔽_5).
- `specialisation.degree_zero` (degenerate): On K_0(L) = ℤ: λ_s(1) = ∂_S(λ(s)) = [k] = 1 ∈ K_0(k).
- `specialisation.depends_on_parameter` (non-example): λ_{us}(λ(s)) − λ_s(λ(s)) = −λ_k(ū): for O = ℤ_(5), s = 5 and s' = 10 (u = 2) the two specialisations differ on λ(5) by λ_{𝔽_5}(2)^{−1} ≠ 0, so a definition independent of s is wrong.
- `specialisation.sign_even_degree` (non-example): For a = λ(s)·λ(w) ∈ K_2(L) (w ∈ O^×), λ_{us}(a) − λ_s(a) = −λ_k(ū)·λ_k(w̄); the printed formula of V.6.6.4 would give +λ_k(ū)·λ_k(w̄).

**Acceptance.**

- For w ∈ O^×, λ_s(λ(w)) = λ_k(w̄) (S.3/specialisation-of-restriction).
- λ_s depends on s already on K_1: λ_{us}(λ(s)) = λ_s(λ(s)) − λ_k(ū).

**Used by.**

- K-book Lemma V.6.7.3 and Corollary V.6.7.4: λ_s ∘ i^* = π^* gives injectivity of K_*(k) → K_*(F) for algebraically closed k
- K-book Theorem V.6.7: a ↦ λ(s)·a splits ∂_S when O contains its residue field
- K2SymbolsBrauer T.3/higher-milnor-residues: the Milnor K-theory specialisation is compared with this one through the symbol map (owned there)

**Depends on.** this roadmap: `S.3/dvr-boundary`, `S.3/unit-loop-class`, `S.3/boundary-module-linearity`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`.

**Sources.**

- `Kbook.2013`, V.6.6.4 (PDF p. 418): “If R is a discrete valuation ring with fraction ﬁeld F, parameter s and residue ﬁeld R/sR = k, we deﬁne the specialization map λs : Kn(F) →Kn(k) by λs(a) = ∂({s, a}).” — The definition.
- `Kbook.2013`, V.6.6.4 (PDF p. 418): “a diﬀerent choice of pa- rameter will yield a diﬀerent specialization map: if u ∈R× is such that s′ = us then λs′(a) = λs(a) + (−1)n{u, ∂a}.” — The change-of-parameter formula, whose sign the node corrects for even n.

### Specialisation of a class from the ring is its reduction

`S.3/specialisation-of-restriction` · lemma

Let O be a DVR with fraction field L, residue field k, parameter s, j: O → L and π: O → k. Then λ_s ∘ j^* = π^*: K_n(O) → K_n(k) (K-book Lemma V.6.7.3); the same holds with finite coefficients.

**Hypotheses.**

- O a DVR; λ_s from S.3/specialisation-map.

**Proof.**

1. λ_s(j^*a) = ∂_S(λ(s)·j^*a) = ∂_S(λ(s))·ā by right linearity (S.3/boundary-module-linearity), where ā = π^*a.
2. ∂_S(λ(s)) = [k] (S.3/dvr-boundary-unit-valuation), the unit of K_0(k), so the value is π^*a.

**Acceptance.**

- For a = λ_O(w), w ∈ O^×: λ_s(λ_L(w)) = λ_k(w̄).
- For a = 1 ∈ K_0(O): λ_s(1) = 1.

**Depends on.** this roadmap: `S.3/specialisation-map`, `S.3/boundary-module-linearity`, `S.3/dvr-boundary-unit-valuation`.

**Sources.**

- `Kbook.2013`, Lemma V.6.7.3 and its proof (PDF pp. 419-420): “The composition of i∗: Kn(R) →Kn(F) and λs is the nat- ural map π∗: Kn(R) →Kn(k).” — The statement; the proof is the one-line linearity computation reproduced in the node.

### K-theory of an algebraically closed field injects into K-theory of any algebra over it

`S.3/algebraically-closed-injectivity` · application

Let k be an algebraically closed field and A a commutative k-algebra (A ≠ 0). Then K_n(k) → K_n(A) is injective for every n (K-book Corollary V.6.7.4).

**Hypotheses.**

- k algebraically closed; A a nonzero commutative k-algebra.

**Proof.**

1. Choose a map A → F to a field (A ≠ 0 has a maximal ideal); it suffices to treat A = F.
2. K_*(F) = colim K_*(F_α) over finitely generated subfields containing k (GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits), so assume F finitely generated over k; induct on the transcendence degree (degree 0: F = k).
3. F is the fraction field of a DVR O ⊇ k with residue field E finitely generated of smaller transcendence degree (a standard fact: localise a normal model at a codimension-one point; KTheoryLowDegrees does not own it, it is recorded as an input of this application).
4. By S.3/specialisation-of-restriction, the composite K_n(k) → K_n(O) → K_n(F) →λ_s K_n(E) is K_n(k) → K_n(E), injective by induction; hence K_n(k) → K_n(F) is injective.

**Acceptance.**

- K_n(ℂ) → K_n(ℂ(t)) is injective (split by any specialisation at t = a).
- For k = ℂ and A = ℂ[x]/(x²), K_n(ℂ) → K_n(A) is split injective (A → ℂ).

**Depends on.** this roadmap: `S.3/specialisation-of-restriction`, `S.3/specialisation-map`; other roadmaps: `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`; libraries: `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `Kbook.2013`, Corollary V.6.7.4 (PDF p. 420): “If k is an algebraically closed ﬁeld, and A is any commuta- tive k-algebra, the maps Kn(k) →Kn(A) and Kn(k; Z/m) →Kn(A; Z/m) are injections.” — The statement; the proof by induction on transcendence degree is reproduced.

### The degree-one boundary of a unit is its divisor

`S.3/unit-boundary-is-divisor` · theorem

Let X be a noetherian integral scheme with function field F, U ⊆ X a nonempty open, Y = X ∖ U, and f ∈ Γ(U, O_X)^×. Let ∂: G_1(U) → G_0(Y) be the boundary of S.3/g-theory-localisation and [f] the image of λ(f) (S.3/unit-loop-class on an affine open, or the class of the automorphism f of O_U) in G_1(U). For every point y ∈ Y of codimension one in X (a generic point of Y), the image of ∂[f] under G_0(Y) → G_0(Spec O_{Y,y}) ≅ ℤ (restriction to the local scheme, then length over the artinian ring O_{Y,y}) is ord_y(f) = ℓ(O_{X,y}/a) − ℓ(O_{X,y}/b) for f = a/b with a, b ∈ O_{X,y} ∖ {0}, i.e. Mathlib's AlgebraicGeometry.Scheme.ord f y (length-based order of vanishing, Stacks 02MD). When O_{X,y} is a DVR this is the valuation v_y(f), matching S.3/dvr-boundary-unit-valuation; for a Dedekind domain the boundary F^× → ⊕_p ℤ is the divisor map f ↦ (v_p(f))_p.

**Hypotheses.**

- X noetherian integral; U ⊆ X nonempty open; y ∈ Y with dim O_{X,y} = 1 (coheight one).

**Proof.**

1. Naturality under the flat map Spec O_{X,y} → X (S.3/g-theory-localisation is natural for flat pullback, Quillen §7 3.4): the component of ∂[f] at y is the boundary of the sequence for the one-dimensional local domain R = O_{X,y} with Y_y = {m_y} and U_y = Spec F.
2. Write f = a/b in F with a, b ∈ R ∖ {0}; then [f] = [a] − [b] in G_1(F). Since R is a one-dimensional local domain, R[1/c] = F for every nonzero non-unit c, so the boundary of the sequence for (Spec R, V(c)) is the boundary of the local sequence; units c have zero boundary by exactness.
3. S.3/boundary-of-a-nonzerodivisor (R a domain): ∂[a] = [R/aR] ∈ G_0(R/aR) = K_0(finite-length R-modules) (S.3/coherent-support-devissage), which is ℓ_R(R/aR) = Ring.ord R a under the length isomorphism.
4. Hence the component is ℓ(R/aR) − ℓ(R/bR) = Ring.ordFrac, which is Mathlib's Scheme.ord f y (defined through Ring.ordFrac of the stalk at a coheight-one point).
5. For R a DVR this is v_y(f) (Ring.ord of a = uπ^n is n by length_quotient_pow_maximalIdeal); for a Dedekind domain the local rings at maximal ideals are DVRs (IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain) and v_p is HeightOneSpectrum.valuation.

**Acceptance.**

- X = Spec ℤ, U = Spec ℤ[1/6], f = 12: the boundary is (2, 1) at (2) and (3).
- X = Spec k[x, y]/(y² − x³) (the cusp), y = the origin, f = x on the complement of the origin: ord = ℓ(O/(x)) = 2, although O_{X,y} is not a DVR.
- Compatibility: on a locally noetherian integral X with f a rational function, the component equals Tau Ceti's SchemeWeilDivisor.orderAt y f.

**Depends on.** this roadmap: `S.3/g-theory-localisation`, `S.3/boundary-of-a-nonzerodivisor`, `S.3/coherent-support-devissage`, `S.3/g-theory-continuity`, `S.3/unit-loop-class`, `S.3/dvr-boundary-unit-valuation`; libraries: `mathlib:AlgebraicGeometry.Scheme.ord`, `mathlib:Ring.ord`, `mathlib:Ring.ordFrac`, `mathlib:IsDiscreteValuationRing.length_quotient_pow_maximalIdeal`, `mathlib:IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain`, `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation`, `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.orderAt`, `tauceti:TauCeti.AlgebraicGeometry.CodimensionOnePoint`.

**Sources.**

- `Kbook.2013`, V.9.1 (PDF p. 443): “Here Di(R) is the free abelian group on the height i primes, and ∆sends r/s ∈k(p)× to [R/(r, p)] −[R/(s, p)] by Example 6.1.2.” — The length formula for the degree-one boundary.
- `Quillen.1973`, §7, Lemma 5.16 (printed p. 128): “Then ∂ : K1F → K0k is isomorphic to ord : F* → Z, where ord is the homomorphism such that ord(x) = length(A/xA) for x in A, x ≠ 0.” — Quillen's statement for an equicharacteristic one-dimensional local domain (scan text normalised); his proof uses the equicharacteristic hypothesis, which the route through Example V.6.1.2 avoids.

### Finite pushforward gives a morphism of localisation sequences

`S.3/boundary-finite-pushforward-naturality` · lemma

Let p: X' → X be a finite morphism of noetherian schemes, Z ⊆ X closed, Z' = p^{-1}(Z), U = X ∖ Z, U' = p^{-1}(U). Then p_* (exact on coherent sheaves) maps the G-localisation sequence of (X', Z') to that of (X, Z): p_*∘∂' = ∂∘(p|_{U'})_*, and on the fibre terms it is (p|_{Z'})_*: G(Z') → G(Z). For Dedekind domains R ⊆ R' with R' finite over R and fraction fields F ⊆ F', this is the morphism (6.6.4) of localisation sequences: N_{F'/F}: K_n(F') → K_n(F) is compatible with ⊕_{p'|p} N_{(R'/p')/(R/p)} on the residue terms.

**Hypotheses.**

- p finite; X, X' noetherian.

**Proof.**

1. p_*: Coh(X') → Coh(X) is exact (p affine) and sends Coh_{Z'}(X') into Coh_Z(X) and induces Coh(U') → Coh(U) on the quotients (S.3/coherent-quotient-by-support), so it is an exact functor of pairs.
2. Quillen's localisation theorem is functorial for exact functors of pairs (GeneralAlgebraicKTheory:K.3/abelian-localization-theorem), giving a map of fibre sequences and of long exact sequences.
3. On fibres, dévissage (S.3/coherent-support-devissage) is compatible with p_* on Coh(Z') → Coh(Z) (both are pushforwards of coherent sheaves), which is S.2/g-theory-proper-pushforward for the finite map Z' → Z.
4. For Dedekind R ⊆ R': the pushforwards on points are the finite transfers (norms) of the residue field extensions and of F'/F (S.2/affine-pushforward-is-transfer).

**Acceptance.**

- For ℤ ⊆ ℤ[i] and K_1: N_{ℚ(i)/ℚ} on units and the norm maps 𝔽_{p²}^× → 𝔽_p^× at inert p are compatible with the boundaries.
- The residue-field maps are norms, not inclusions: a pullback-style square would fail at ramified primes.

**Depends on.** this roadmap: `S.3/g-theory-localisation`, `S.3/coherent-quotient-by-support`, `S.3/coherent-support-devissage`, `S.2/g-theory-proper-pushforward`, `S.2/affine-pushforward-is-transfer`; other roadmaps: `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`.

**Sources.**

- `Kbook.2013`, V.6.6.3 (PDF p. 418): “Suppose that R ⊂R′ is an inclusion of Dedekind domains, with R′ ﬁnitely generated as an R-module. Then the fraction ﬁeld F ′ of R′ is ﬁnite over F, so the exact functors M(R′) →M(R) and M(F ′) →M(F) inducing the transfer maps (IV. 6.3.3) are compatible.” — The statement for Dedekind domains, with the diagram (6.6.4).

### The localisation sequence of a Dedekind domain

`S.3/dedekind-localisation-sequence` · application

Let R be a Dedekind domain with fraction field F. Then there is a long exact sequence ⋯ → ⊕_p K_n(R/p) →⊕(i_p)_* K_n(R) → K_n(F) →∂ ⊕_p K_{n−1}(R/p) → ⋯ (p over the nonzero primes), with K = G throughout and no negative groups. The p-component of ∂ is the DVR boundary of R_p (S.3/dvr-boundary) composed with K_n(F) = K_n(Frac R_p). Its end is ⋯ → K_1(F) →∂ ⊕_p ℤ → K_0(R) → K_0(F) = ℤ → 0, where ∂ ∘ λ_F is the divisor map f ↦ (v_p(f))_p and e_p ↦ [R/p] = [R] − [p] ∈ K_0(R); under K_0(R) ≅ ℤ ⊕ Pic(R) (KTheoryLowDegrees Z.4) the image of e_p is (0, [p]^{-1}), so coker(div) ≅ Cl(R) ⊕ 0 ↪ K_0(R) recovers 1 → R^× → F^× → Div(R) → Cl(R) → 1 in degree ≤ 1. For finite residue fields, K_2(R/p) = 0 is not used here (K_*(𝔽_q) is KTheoryFiniteLocalFields').

**Hypotheses.**

- R a Dedekind domain (Mathlib IsDedekindDomain), not a field.

**Proof.**

1. Coh_{tors}(Spec R) (finitely generated torsion modules) is the union over finite sets S of maximal ideals of Coh_{V(S)}; its quotient is Coh(F) (S.3/coherent-quotient-by-support and S.3/g-theory-continuity for Spec F = lim D(a)).
2. Quillen's localisation (S.3/g-theory-localisation, in its colimit form) gives K(Coh_tors) → G(R) → G(F); dévissage on finite-length torsion modules (GeneralAlgebraicKTheory:K.3/devissage-theorem, Application V.4.3) and S.3/disjoint-support-additivity give K(Coh_tors) ≃ ⊕_p K(R/p).
3. R, F and R/p are regular, so K = G (S.3/cartan-localisation-comparison), and negative groups vanish.
4. The p-component of ∂ is the DVR boundary of R_p by naturality under the flat map Spec R_p → Spec R (S.3/boundary-pullback-naturality); in degree one it is v_p by S.3/unit-boundary-is-divisor.
5. K_0: e_p ↦ (i_p)_*[R/p] = [R/p] = [R] − [p], and KTheoryLowDegrees:Z.4/rank-pic-equivalence maps this to (0, [p]^{-1}).

**Acceptance.**

- R = ℤ: K_1(ℚ) → ⊕_p ℤ, 12 ↦ 2e_2 + e_3; ⊕_p ℤ → K_0(ℤ) = ℤ is zero and K_0(ℤ) ≅ K_0(ℚ).
- R = ℤ[√−5], p = (2, 1 + √−5): e_p ↦ (0, [p]^{-1}) = (0, [p]) since [p] has order 2 in Cl(R) ≅ ℤ/2, so the image of ⊕ℤ in K_0(R) is 0 ⊕ Cl(R).

**Depends on.** this roadmap: `S.3/g-theory-localisation`, `S.3/coherent-quotient-by-support`, `S.3/g-theory-continuity`, `S.3/disjoint-support-additivity`, `S.3/cartan-localisation-comparison`, `S.3/boundary-pullback-naturality`, `S.3/unit-boundary-is-divisor`, `S.3/dvr-boundary`; other roadmaps: `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `KTheoryLowDegrees:Z.4/rank-pic-equivalence`; libraries: `mathlib:IsDedekindDomain`, `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation`, `mathlib:ClassGroup`.

**Sources.**

- `Kbook.2013`, (6.6) (PDF p. 417): “Hence the localization sequence of 6.1 with S = R −{0} becomes the long exact sequence: · · · →Kn+1(F) ∂ −→⊕p Kn(R/p) ⊕(ip)∗> Kn(R) > Kn(F) ∂> · · · .” — The sequence.
- `Kbook.2013`, V.6.6 (PDF p. 417): “Writing K1(R) = R× ⊕SK1(R) (see III. 1.1.1), the formula 6.1.2 allows us to identify the ending with the sequence 1 →R× →F × div> D(R) →K0(R) → Z →0 of I. 3.6.” — The degree-one end: the boundary is the divisor map.

### The localisation sequence of a one-dimensional noetherian scheme

`S.3/one-dimensional-localisation-sequence` · application

Let Y be a noetherian scheme of dimension one, with closed points y and generic points η (finitely many). Then there is a long exact sequence ⋯ → ⊕_{y} K_n(k(y)) →⊕(i_y)_* G_n(Y) → ⊕_η K_n(k(η)) →∂ ⊕_y K_{n−1}(k(y)) → ⋯ ending in ⊕_y ℤ → G_0(Y) → ⊕_η ℤ → 0 (sums over closed points y that are not generic, and over generic points η, with G_n(O_{Y,η}) ≅ K_n(k(η)) by dévissage over the artinian local ring). If Y is an integral curve over a field k with function field F, this is ⋯ → ⊕_x K_n(k(x)) → G_n(Y) → K_n(F) →∂ ⊕_x K_{n−1}(k(x)) → ⋯ over the closed points (K-book 6.12), with ∂'s x-component the DVR boundary of O_{Y,x} when Y is regular (then K = G), and in general the boundary of the one-dimensional local domain O_{Y,x} (degree one: the length order ord_x).

**Hypotheses.**

- Y noetherian of dimension ≤ 1; for the curve form, Y integral.

**Proof.**

1. Coh_0(Y) (sheaves of finite length, supported on finitely many closed points) is a Serre subcategory; Coh(Y)/Coh_0(Y) ≃ ⊕_η Coh_{fl}(O_{Y,η}) (a coherent sheaf modulo finite-length ones is determined by its stalks at the generic points; S.3/coherent-quotient-by-support over the complements of finite sets and S.3/g-theory-continuity).
2. Quillen's localisation (GeneralAlgebraicKTheory:K.3/abelian-localization-theorem) and dévissage for finite-length objects (K.3/devissage-theorem; Application V.4.3: K of an abelian category with all objects of finite length is ⊕ K of the endomorphism fields of simple objects) give K(Coh_0(Y)) ≃ ⊕_y K(k(y)) and K(Coh_fl(O_{Y,η})) ≃ K(k(η)).
3. The x-component of ∂ is computed at the local ring by naturality for flat pullback (S.3/g-theory-localisation); for regular Y it is S.3/dvr-boundary, and in degree one it is ord_x (S.3/unit-boundary-is-divisor).
4. For regular Y, K = G by S.3/cartan-localisation-comparison.

**Acceptance.**

- Y = A¹_k: 0 → K_n(k(t))/K_n(k) ≅ ⊕_x K_{n−1}(k(x)) (S.4/gersten-polynomial-line).
- Y = the node Spec k[x, y]/(y² − x² − x³): the sequence ⊕_y ℤ → G_0(Y) → ℤ → 0 (generic rank) holds without K = G, whereas K_0(Y) ≅ ℤ ⊕ k^× (K-book Example II.2.9.1) is not computed by it.
- E.3's curve sequence in degrees ≤ 3 is the regular-curve case.

**Depends on.** this roadmap: `S.3/g-theory-localisation`, `S.3/coherent-quotient-by-support`, `S.3/g-theory-continuity`, `S.3/unit-boundary-is-divisor`, `S.3/dvr-boundary`, `S.3/cartan-localisation-comparison`; other roadmaps: `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`.

**Sources.**

- `Kbook.2013`, Smooth Curves 6.12 (PDF p. 424): “The category M0(X) of coherent torsion modules (modules of ﬁnite length) is a Serre subcategory of M(X), and M(F) ∼= M(X)/M0(X) (II. 6.4.2). By devissage ( 4.3), K∗M0(X) ∼= ⊕xK∗(k(x)) = ⊕K∗(x).” — The curve case.
- `Kbook.2013`, Exercise V.6.1 (PDF p. 426): “Suppose that R is a 1-dimensional commutative noetherian domain with fraction ﬁeld F. Show that there is a long exact sequence · · · →Kn+1(F) ∂ −→⊕p Kn(R/p) →Gn(R) →Kn(F) ∂ −→· · · .” — The one-dimensional (possibly singular) affine case.

### Weil reciprocity in Quillen K-theory (Gillet)

`S.3/weil-reciprocity-k-theory` · application

Let X be a projective curve over a field k (integral, dimension one, proper over k) with function field F. For every a ∈ K_{n+1}(F), Σ_{x closed} N_{k(x)/k}(∂_x(a)) = 0 in K_n(k), where ∂_x: K_{n+1}(F) → K_n(k(x)) is the x-component of the boundary of S.3/one-dimensional-localisation-sequence and N_{k(x)/k} the finite transfer. The sum is finite because a comes from G_{n+1}(U) for some nonempty open U.

**Hypotheses.**

- X integral, proper over k, of dimension one.

**Proof.**

1. By S.3/one-dimensional-localisation-sequence, ⊕_x (i_x)_* ∘ ∂ = 0: K_{n+1}(F) → G_n(X) (two consecutive maps of an exact sequence).
2. Apply the proper pushforward π_*: G_n(X) → G_n(k) = K_n(k) along π: X → Spec k (S.2/g-theory-proper-pushforward); functoriality (S.2/pushforward-functoriality) gives π_*(i_x)_* = (Spec k(x) → Spec k)_* = N_{k(x)/k}.
3. Hence Σ_x N_{k(x)/k} ∂_x(a) = π_*(Σ_x (i_x)_*∂_x(a)) = 0.

**Acceptance.**

- n = 0, X = P¹_k, a = λ(f): Σ_x [k(x):k]·ord_x(f) = deg div(f) = 0.
- n = 1, a = λ(f)·λ(g): the formula is the product over closed points of the norms of the tame symbols, i.e. classical Weil reciprocity, once ∂_x on symbols is identified with the tame symbol (K2SymbolsBrauer T.4/weil-reciprocity-symbol-form proves the classical statement independently).

**Depends on.** this roadmap: `S.3/one-dimensional-localisation-sequence`, `S.2/g-theory-proper-pushforward`, `S.2/pushforward-functoriality`.

**Sources.**

- `Kbook.2013`, Weil Reciprocity Formula 6.12.1 (PDF p. 424): “Weil Reciprocity Formula 6.12.1. Let X be a projective curve over a ﬁeld k, with function ﬁeld F. For every a ∈Kn+1(F) we have the following formula in Kn(k): X x∈X Nk(x)/k∂x(a) = 0.” — The statement (the rendered formula is Σ_{x∈X} N_{k(x)/k}∂_x(a) = 0).
- `Kbook.2013`, Proof of 6.12.1 (PDF p. 425): “Consider the proper transfer π∗: Gn(X) →Gn(k) of 3.7 associated to the structure map π : X →Spec(k). By functoriality, π∗(ix)∗= Nk(x)/k for each closed point x ∈X.” — The proof.

### Localisation on a regular arithmetic surface, with its codimension-two terms

`S.3/arithmetic-surface-localisation` · application

Let B = Spec A with A a Dedekind domain (for example O_{F,S}) and p: 𝓧 → B a morphism with 𝓧 a regular noetherian scheme of dimension two (for example a regular proper flat model of a curve over F). For a finite set V of closed points of B, U = B ∖ V and 𝓧_v = p^{-1}(v): (a) there is a fibre sequence ∏_{v∈V} G(𝓧_v) → K(𝓧) → K(𝓧_U), i.e. K(𝓧 on 𝓧_V) ≃ ⊕_{v∈V} G(𝓧_v); (b) passing to the colimit over V (continuity), K_n(𝓧) → K_n(𝓧_F) →∂ ⊕_{v} G_{n−1}(𝓧_v) → K_{n−1}(𝓧) → ⋯ with 𝓧_F the generic fibre, in particular K_2(𝓧) → K_2(𝓧_F) → ⊕_v G_1(𝓧_v); (c) the codimension-two terms are retained: for each v, S.3/one-dimensional-localisation-sequence for the curve 𝓧_v gives ⊕_{x∈𝓧_v closed} K_1(k(x)) → G_1(𝓧_v) → ⊕_{C} K_1(k(C)) →∂ ⊕_x K_0(k(x)) → G_0(𝓧_v) → ⊕_C ℤ → 0 over the irreducible components C (generic points c) of 𝓧_v, and G_1(𝓧_v) is not replaced by ⊕_C k(C)^×: its kernel term ⊕_x k(x)^× (finite when the residue fields are finite) and the cokernel term ⊕_x ℤ are part of the statement.

**Hypotheses.**

- A Dedekind; 𝓧 regular noetherian of dimension 2; p any morphism (flatness is not needed for (a)-(c)); V finite.

**Proof.**

1. (a) S.3/localisation-fibre-sequence for 𝓧 and U' = 𝓧_U (quasi-compact), with 𝓧 ∖ 𝓧_U = ⊔_{v∈V} 𝓧_v a disjoint union of closed subsets: S.3/disjoint-support-additivity and S.3/regular-support-devissage (𝓧 regular) give K(𝓧 on 𝓧_V) ≃ ∏_v G(𝓧_v).
2. (b) 𝓧_F = lim_V 𝓧_U with affine flat transition maps (open subschemes of the affine Dedekind B are affine); S.3/g-theory-continuity and K = G on the regular 𝓧_U give K_n(𝓧_F) = colim K_n(𝓧_U), and filtered colimits of long exact sequences are exact.
3. (c) Apply S.3/one-dimensional-localisation-sequence to the one-dimensional noetherian scheme 𝓧_v (a curve over k(v), possibly reducible and non-reduced; G is insensitive to nilpotents by S.3/coherent-support-devissage).

**Acceptance.**

- For a good-reduction prime v (𝓧_v smooth over a finite k(v)), G_1(𝓧_v) = K_1(𝓧_v) and the residue-field terms are finite, so the vertical condition at v is vacuous rationally (EllipticKTheory E.6/good-reduction-primes-impose-no-condition, which imports this node).
- The composite of the two boundaries K_2(𝓧_F) → G_1(𝓧_v) → ⊕_C k(C)^× → ⊕_x ℤ is zero; that is S.4/residue-composite-vanishes, not a consequence of (a)-(c) alone.

**Depends on.** this roadmap: `S.3/localisation-fibre-sequence`, `S.3/disjoint-support-additivity`, `S.3/regular-support-devissage`, `S.3/g-theory-continuity`, `S.3/one-dimensional-localisation-sequence`, `S.3/coherent-support-devissage`, `S.3/cartan-localisation-comparison`; libraries: `mathlib:IsDedekindDomain`.

**Sources.**

- `Kbook.2013`, Example V.6.11 (PDF p. 423): “Let X be a noetherian scheme, j : U ⊂X an open subscheme, and Z = X −U the closed complement. In this case we take A = M(X) and B = MZ(X) the category of coherent X-modules supported on Z, i.e., modules whose restriction to U is zero.” — The localisation sequence used for the union of closed fibres, with Z = 𝓧_V.
- `Quillen.1973`, §7, Proposition 2.2 (printed p. 117): “If in addition the transition morphisms are flat, then (2.4) K'_qX = lim K'_qX_i.” — The passage to the generic fibre (scan text normalised).

### Vertical residues are local DVR boundaries

`S.3/vertical-residue-compatibility` · lemma

In the setting of S.3/arithmetic-surface-localisation, let C be an irreducible component of a closed fibre 𝓧_v with generic point c (a point of codimension one of 𝓧, so O_{𝓧,c} is a DVR with fraction field k(𝓧) and residue field k(C)). Then the composite K_n(𝓧_U) → G_{n−1}(𝓧_v) → G_{n−1}(O_{𝓧_v, c}) ≅ K_{n−1}(k(C)) (boundary, then restriction to the local scheme at c and dévissage) equals ∂_c ∘ res, where res: K_n(𝓧_U) → K_n(k(𝓧)) is restriction to the generic point and ∂_c is the DVR boundary of O_{𝓧,c} (S.3/dvr-boundary). In degree n = 1 and 2 this identifies the vertical residues of EllipticKTheory E.6: for α ∈ K_2(𝓧_F), ∂_C(α) is ∂_c of α viewed in K_2(k(𝓧)).

**Hypotheses.**

- As in S.3/arithmetic-surface-localisation; c the generic point of C.

**Proof.**

1. Spec O_{𝓧,c} → 𝓧 is flat and Spec O_{𝓧,c} ∩ 𝓧_v = {c} (the closed point), Spec O_{𝓧,c} ∩ 𝓧_U = Spec k(𝓧).
2. S.3/boundary-pullback-naturality (or flat naturality of S.3/g-theory-localisation) gives a map from the sequence of (𝓧, 𝓧_v) to that of (Spec O_{𝓧,c}, closed point) compatible with the boundaries.
3. On the fibre terms the map G(𝓧_v) → G(Spec O_{𝓧,c} on c) ≃ K(k(C)) is restriction to the local ring at c followed by dévissage (S.3/regular-support-devissage), and the local sequence is S.3/dvr-localisation-sequence.

**Acceptance.**

- For α = λ(f)·λ(u) with u a unit at c: ∂_C(α) = v_c(f)·λ(ū) (S.3/dvr-boundary-on-unit-products); v_c(π_v) = m_C, the multiplicity of C in 𝓧_v.
- Rationally, α ∈ K_2(𝓧_F) ⊗ ℚ lies in the image of K_2(𝓧) iff its image in ⊕_v G_1(𝓧_v) ⊗ ℚ vanishes; E.6 reduces this to the vertical residues using the finiteness of the ⊕_x k(x)^× terms.

**Depends on.** this roadmap: `S.3/arithmetic-surface-localisation`, `S.3/boundary-pullback-naturality`, `S.3/g-theory-localisation`, `S.3/regular-support-devissage`, `S.3/dvr-localisation-sequence`, `S.3/dvr-boundary`.

**Sources.**

- `Kbook.2013`, V.6.6.1 (PDF p. 417): “Since the p-component of ∂factors through the localization K2(R) →K2(Rp) and the localization sequence for Rp, we may suppose that R is a DVR with parameter π.” — The same localisation argument for a Dedekind domain; the node applies it at the codimension-one point c of the surface.
- `Quillen.1973`, §7, 3.4 (printed p. 120): “Also a flat map f: X' → X induces a map from the exact sequence for (X,Z) to the one for (X',f^{-1}Z).” — The flat naturality used (scan text normalised).

## S.4 — Descent and coniveau

*Coverage: partial.* Descent: Zariski Mayer–Vietoris (TT 8.1) and G-theory Mayer–Vietoris; the Nisnevich site with elementary distinguished squares, points and cohomological dimension (TT App. E); K sends distinguished squares to homotopy cartesian squares via S.3's excision; the Mayer–Vietoris property of presheaves of spectra and the Brown–Gersten vanishing lemma; Thomason's Godement hypercohomology spectrum and its spectral sequence; K-sheaves with their Zariski and Nisnevich stalks; the codimension filtration by supports and its layers (TT 10.3.5-10.3.11); Zariski and Nisnevich descent (TT 10.3, 10.8) with strongly convergent descent spectral sequences under finite Krull dimension. Coniveau: the K-theory coniveau spectral sequence from the support tower, Quillen's G-theory coniveau spectral sequence with M^p, its quotients, flat functoriality, the first differential as residues (DVR boundaries at codimension-one specialisations with DVR local rings, length orders on K_1), d_1 d_1 = 0 (the low-degree Gersten/Kato complex of a regular surface, as requested by EllipticRegulators ER.6 and EllipticKTheory E.6), E_2^{p,−p} = CH^p, the one-dimensional case used directly (E.4), and the identification of the K-coniveau first page with ⊕ K(k(x)) for regular X. Gersten: the Gersten–Quillen condition and its equivalent forms, Quillen's normalisation lemma and effacement, Quillen's theorem for semilocal rings of algebras over a field, power series, the flasque Gersten resolution and Bloch's formula, equicharacteristic DVRs (K-book 6.7, 6.7.2), Panin's theorem (cited), and the mixed-characteristic statements kept separate and source-scoped: Gillet–Levine (cited) and K-book 9.7.1(a)-(d), with Gersten's DVR conjecture an explicit hypothesis.

- Remaining: Requests to StableHomotopyKTheory H.5:spectra (homotopy limits of cosimplicial spectra and the Bousfield–Kan spectral sequence), SchemeAndStackFoundations SF.2 (Grothendieck vanishing, the SGA 4 inputs for Nisnevich cohomological dimension) and SF.5 (Fulton's comparison of the two definitions of rational equivalence) are open.
- Remaining: Cited without a proof read: Gillet–Levine (K-book 9.7), Panin 2003 (equicharacteristic Gersten via Popescu), Gillet–Soulé's isomorphism of descent and coniveau spectral sequences, the n-variable Weierstrass preparation used in S.4/gersten-power-series, and MVW 12.7 (generation of the Nisnevich topology by distinguished squares; Mathlib MayerVietorisSquare compatibility).
- Remaining: K-book 6.7 and 6.7.2 assert without proof the existence of a finite extension whose integral closure contains the residue field, and of a subfield over which the residue field is algebraic (gaps recorded).
- Remaining: Gersten's DVR conjecture with finite residue field or finite coefficients (K-book 6.9.1, 6.9.2, Ex. 6.11) is not planned here: it needs K_*(𝔽_q), Gabber rigidity and Geisser–Levine, and KTheoryFiniteLocalFields L.2 (even-k-field-splitting, henselian-dvr-mod-m-splitting) plans it on top of S.3's DVR sequence.
- Remaining: K-book Corollary V.6.7.1 (split Gersten sequence for k[t] ⊂ k(t)) needs K_n(k) ≅ K_n(k[t]) (S.5/homotopy-invariance-regular), downstream of S.4; it is proposed for S.5 (restructure).
- Remaining: Polylogarithms P.5's request (the last two cohomology groups of the Gersten complex agree with those of Bloch's cycle complex) needs higher Chow groups, which are MotivicEtaleKTheory M.4's; S.4 supplies only the Gersten complex (S.4/gersten-conditions-equivalent, S.4/gersten-resolution).

### Mayer–Vietoris for K-theory with supports

`S.4/zariski-mayer-vietoris` · theorem

Let X be quasi-separated, U, V ⊆ X quasi-compact opens and Z ⊆ U ∪ V closed with (U ∪ V) ∖ Z quasi-compact. Then the square K(U ∪ V on Z) → K(U on U ∩ Z), K(V on V ∩ Z) → K(U ∩ V on U ∩ V ∩ Z) of nonconnective spectra (restrictions) is homotopy cartesian; for Z = U ∪ V this is K(U ∪ V) → K(U) × K(V) → K(U ∩ V), with long exact sequence ⋯ → K_n(U ∪ V) → K_n(U) ⊕ K_n(V) →± K_n(U ∩ V) →∂ K_{n−1}(U ∪ V) → ⋯ in all degrees (TT 8.1, K-book V.7.10). In the terminology of S.4/mayer-vietoris-property, U ↦ K(U on U ∩ Z) has the Zariski Mayer–Vietoris property on qcqs schemes.

**Hypotheses.**

- X quasi-separated; U, V quasi-compact opens; Z closed in U ∪ V with quasi-compact complement.

**Proof.**

1. Set W = U ∪ V and T = (W ∖ U) ∩ Z, a closed subset of W contained in V, with V ∖ T = U ∩ V (inside V) quasi-compact.
2. S.3/localisation-fibre-sequence gives fibre sequences K(W on T) → K(W on Z) → K(U on U ∩ Z) and K(V on T) → K(V on V ∩ Z) → K(U ∩ V on U ∩ V ∩ Z), and restriction W ⊇ V maps the first to the second (S.3/boundary-pullback-naturality).
3. On fibres the map K(W on T) → K(V on T) is an equivalence by excision for the open V ⊇ T (S.3/excision).
4. A map of fibre sequences that is an equivalence on fibres has a homotopy cartesian right-hand square (StableHomotopyKTheory H.2's homotopy-cartesian squares; or the five lemma on homotopy groups), which is the claim.

**Acceptance.**

- X = P¹_k = U ∪ V with U, V ≅ A¹_k and U ∩ V ≅ G_m: K_1(P¹) → K_1(A¹) ⊕ K_1(A¹) → K_1(G_m) → K_0(P¹) → K_0(A¹)² → K_0(G_m); with K_1(G_m) ≅ k^× ⊕ ℤ the boundary sends the class of the coordinate to a generator of the rank-zero part of K_0(P¹) ≅ ℤ²  (consistency test with S.5's projective line).
- Connective K fails the property: for the affine plane with doubled origin the map K_0(U) ⊕ K_0(V) → K_0(U ∩ V) need not be onto (K-book V.10.3), which is why the nonconnective spectra are used.

**Depends on.** this roadmap: `S.3/localisation-fibre-sequence`, `S.3/boundary-pullback-naturality`, `S.3/excision`; other roadmaps: `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 8.1 (p. 367): “Let X be a quasi-separated scheme. Let U and V be quasi-compact open subschemes of X. Let Z ⊆ U ∪ V be a closed subspace, with U ∪ V − Z quasi-compact. Then the squares (8.1.1) are homotopy cartesian:” — The statement (scan text normalised).
- `ThomasonTrobaugh.1990`, Proof of 8.1 (p. 367): “The columns of (8.1.3) are homotopy fibre sequences by the Localization Theorem 7.4. The induced map on the fibres is a homotopy equivalence by excision 7.1.” — The proof.
- `Kbook.2013`, Corollary V.7.10 (PDF pp. 435-436): “Corollary 7.10. (Mayer-Vietoris) Let X be a quasi-compact, quasi-separated scheme, and U, V quasi-compact open subschemes with X = U ∪V .” — The K-book's statement (the square K^B(X) → K^B(U), K^B(V) → K^B(U ∩ V) is homotopy cartesian).

### Mayer–Vietoris for G-theory

`S.4/g-theory-mayer-vietoris` · lemma

Let X be a noetherian scheme and U, V ⊆ X opens with X = U ∪ V. Then G(X) → G(U) × G(V) → G(U ∩ V) is a homotopy fibre sequence, with long exact sequence ⋯ → G_{n+1}(U ∩ V) →∂ G_n(X) → G_n(U) ⊕ G_n(V) → G_n(U ∩ V) → ⋯ (K-book V.6.11.2, Quillen §7.3.5).

**Hypotheses.**

- X noetherian; U ∪ V = X.

**Proof.**

1. Z = X ∖ U is closed in X, contained in V, and V ∖ Z = U ∩ V.
2. S.3/g-theory-localisation for (X, Z) and (V, Z) gives fibre sequences G(Z) → G(X) → G(U) and G(Z) → G(V) → G(U ∩ V) with the same fibre G(Z), and restriction to V maps the first to the second (flat naturality) inducing the identity on G(Z).
3. Hence the square G(X) → G(U), G(V) → G(U ∩ V) is homotopy cartesian (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).

**Acceptance.**

- X = P¹_k: G_0(P¹) → ℤ² → ℤ is compatible with S.5's computation G_0(P¹) ≅ ℤ².
- For regular X it is the K-theory statement of S.4/zariski-mayer-vietoris.

**Depends on.** this roadmap: `S.3/g-theory-localisation`; other roadmaps: `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.**

- `Kbook.2013`, Mayer-Vietoris Sequences 6.11.2 (PDF p. 424): “If X = U ∪V then Z = X −U is con- tained in V and V −Z = U ∩V . Comparing the two localization sequences, we see that the square G(X) > G(U) G(V ) ∨ > G(U ∩V ). ∨ is homotopy cartesian” — The statement and proof.
- `Quillen.1973`, §7, 3.5 (printed p. 120): “From 3.3 one deduces in a well-known fashion a Mayer-Vietoris sequence” — Quillen's version (for any two opens U, V of X, with U ∪ V in the middle term).

### The Zariski Mayer–Vietoris property of a presheaf of spectra

`S.4/mayer-vietoris-property` · definition

Let X be a scheme (or a noetherian topological space). A presheaf of spectra F on the opens of X (valued in StableHomotopyKTheory H.5's spectra) has the Mayer–Vietoris property (for the Zariski topology) if for all opens U, V ⊆ X the square F(U ∪ V) → F(U), F(V) → F(U ∩ V) is homotopy cartesian, and F(∅) ≃ 0 (K-book V.10.1). For a noetherian scheme it suffices to ask this for quasi-compact opens. The Nisnevich variant asks the same for every elementary distinguished square of S.4/nisnevich-site (K-book V.10.9), which contains the Zariski one (take the square of an open cover X = U ∪ V).

**Hypotheses.**

- F a presheaf of spectra on the opens of X; homotopy cartesian squares as in H.5 (fibres of the two horizontal maps agree).

**Proof.**

1. State the condition on squares; homotopy cartesian means the induced map on homotopy fibres is an equivalence (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence, H.5:spectra).
2. The condition is invariant under objectwise equivalence of presheaves and is inherited by homotopy fibres of maps between presheaves with the property (K-book Ex. V.10.1): fibres commute with fibres.

**API.**

- `HasMayerVietoris` (data): HasMayerVietoris F : Prop, for F a presheaf of spectra on Opens X.
- `HasMayerVietoris.les` (projection): For U, V: the long exact sequence ⋯ → π_nF(U ∪ V) → π_nF(U) ⊕ π_nF(V) → π_nF(U ∩ V) → π_{n−1}F(U ∪ V) → ⋯.
- `HasMayerVietoris.of_equiv` (relation): Invariance under objectwise equivalences F ≃ F'.
- `HasMayerVietoris.fib` (relation): If F → E → B is objectwise a fibre sequence and E, B have the property, so does F (K-book Ex. V.10.1).
- `HasMayerVietoris.restrict` (functoriality): The property restricts to any open W ⊆ X.
- `HasMayerVietoris.nisnevich` (other): HasNisnevichMayerVietoris F for presheaves on the Nisnevich site: elementary distinguished squares go to homotopy cartesian squares; implies HasMayerVietoris on the Zariski opens.

**Unit tests.**

- `HasMayerVietoris.ktheory` (computation): U ↦ K(U) on a qcqs scheme has the property (S.4/zariski-mayer-vietoris).
- `HasMayerVietoris.zero` (degenerate): The zero presheaf has the property; a presheaf with F(∅) ≄ 0 does not.
- `HasMayerVietoris.constant_fails` (non-example): The constant presheaf U ↦ Hℤ (Eilenberg–Mac Lane spectrum of ℤ, including U = ∅) fails the property: for X = U ⊔ V a disjoint union of two points, F(X) = Hℤ is not the product Hℤ × Hℤ.
- `HasMayerVietoris.sheaf_compat` (compatibility): For an abelian sheaf A on X with an injective resolution I, the presheaf of Eilenberg–Mac Lane spectra U ↦ H(I(U)) has the property, and π_{−n} of its value at X is Mathlib's sheaf cohomology Sheaf.H A n (K-book Example V.10.6.1).

**Acceptance.**

- U ↦ K(U) on a qcqs scheme has the property (S.4/zariski-mayer-vietoris); U ↦ G(U) on a noetherian scheme has it (S.4/g-theory-mayer-vietoris).
- Connective K does not: the property fails on π_0 for the affine plane with doubled origin.

**Used by.**

- S.4/brown-gersten-vanishing: the vanishing lemma for presheaves with this property
- S.4/zariski-descent: K(− on − ∩ Y) has the property, which with the coniveau tower gives descent
- K-book V.10.2 and V.10.10: the property is equivalent to Zariski (Nisnevich) descent

**Depends on.** other roadmaps: `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`; libraries: `mathlib:Opens.grothendieckTopology`.

**Sources.**

- `Kbook.2013`, Definition V.10.1 (PDF p. 451): “Let F be a presheaf of simplicial sets (or spectra) on a scheme X. We say that F has the Mayer-Vietoris property (for the Zariski topology on X) if for every pair of open subschemes U and V the following square is homotopy cartesian.” — The definition.
- `Kbook.2013`, Definition V.10.9 (PDF p. 456): “A presheaf of simplicial sets on X is said to have the Mayer- Vietoris property for the Nisnevich topology if it sends upper distinguished squares to homotopy cartesian squares.” — The Nisnevich variant.

### The Brown–Gersten vanishing lemma

`S.4/brown-gersten-vanishing` · lemma

Let X be a noetherian topological space of finite Krull dimension and F a presheaf of spectra on X with the Mayer–Vietoris property (S.4/mayer-vietoris-property). If every presheaf of homotopy groups π_qF has zero associated sheaf, then π_qF(X) = 0 for all q (K-book Proposition V.10.8, Brown–Gersten).

**Hypotheses.**

- X noetherian of finite Krull dimension; F with the Zariski Mayer–Vietoris property; a(π_qF) = 0 for all q.

**Proof.**

1. Prove by induction on d ≥ 0: for all opens X' ⊆ X, all q and a ∈ π_qF(X') there is an open U ⊆ X' with a|_U = 0 and codim_X(X ∖ U) ≥ d; for d > dim X this gives a = 0.
2. d = 0: U = ∅ (F(∅) ≃ 0).
3. Step: with a|_U = 0 and Z = X ∖ U of codimension ≥ d, the generic points x_1, …, x_n of Z of codimension d have a neighbourhood V with a|_V = 0 (the sheaf a(π_qF) vanishes) and X ∖ V of codimension ≥ d.
4. Mayer–Vietoris: if a|_{U∪V} ≠ 0 then a = ∂(z) for z ∈ π_{q+1}F(U ∩ V); by induction z|_W = 0 on an open W ⊆ U ∩ V with complement of codimension ≥ d; remove from V the closure Y of the generic points of (U ∩ V) ∖ W to get V' ∋ x_i with U ∩ V' = W; then a|_{U∪V'} = ∂(z|_W) = 0, and U ∪ V' misses no x_i, so its complement has codimension > d.

**Acceptance.**

- For F = fibre of K → H_Zar(−; K), the lemma with S.4/k-theory-sheaves gives Zariski descent; TT 10.3 instead proves descent through the coniveau tower (S.4/zariski-descent), and both routes are recorded.
- The finite-dimensionality hypothesis is used: the induction terminates at d > dim X.

**Depends on.** this roadmap: `S.4/mayer-vietoris-property`; other roadmaps: `StableHomotopyKTheory:H.5:spectra`; libraries: `mathlib:topologicalKrullDim`, `mathlib:CategoryTheory.presheafToSheaf`.

**Sources.**

- `Kbook.2013`, Proposition V.10.8 (PDF p. 455): “Let X be a ﬁnite-dimensional noetherian space, and F a presheaf of spectra on X which has the Mayer-Vietoris property (for the Zariski topology). If all the presheaves πqF have zero as associated sheaves, then πqF(X) = 0 for all q.” — The statement; the induction on codimension is reproduced in the proof steps.

### The Nisnevich site and elementary distinguished squares

`S.4/nisnevich-site` · definition

For a scheme X, the small Nisnevich site X_Nis is the category of étale (hence locally finitely presented) X-schemes U → X, with covering families {V_a → U} such that for every point x ∈ U some V_a has a point y over x with k(x) → k(y) an isomorphism (TT Appendix E.1); it is finer than the Zariski and coarser than the étale topology (Mathlib's Scheme.etaleTopology restricted to étale X-schemes). An elementary (upper) distinguished square is a cartesian square U ×_X V → V, U → X with U ⊆ X open, p: V → X étale and p^{-1}(X ∖ U) → X ∖ U an isomorphism of reduced closed subschemes (K-book V.10). For noetherian X the Nisnevich topology is generated by the covers {U → X, V → X} of such squares, the points of X_Nis are the henselisations O^h_{X,x} at residue field extensions (TT E.5), and X_Nis has cohomological dimension ≤ dim X (S.4/nisnevich-cohomological-dimension).

**Hypotheses.**

- X a scheme; for the generation and point statements X noetherian.

**Proof.**

1. The covering condition is stable under base change and composition and contains isomorphisms, so it is a Grothendieck pretopology on étale X-schemes (TT E.1); Mathlib's GrothendieckTopology packages it.
2. Every Zariski cover is a Nisnevich cover (a point has a preimage with the same residue field), and every Nisnevich cover is an étale cover (jointly surjective étale), so Zar ⊆ Nis ⊆ ét.
3. For a distinguished square, {U → X, V → X} is a Nisnevich cover: points of U are covered by U, points of X ∖ U by V with isomorphic residue fields.
4. Generation by distinguished squares and the description of points: TT E.5 (via EGA IV 18) and MVW 12.7 as cited in the K-book; the point statement is S.4/nisnevich-cohomological-dimension's input.

**API.**

- `nisnevichTopology` (data): The Grothendieck topology on the category of étale X-schemes.
- `DistinguishedSquare` (structure): Structure: U ⊆ X open, p: V → X étale, p^{-1}(X ∖ U)_red ≅ (X ∖ U)_red, with the cartesian square.
- `DistinguishedSquare.isCover` (constructor): {U → X, V → X} is a Nisnevich cover.
- `DistinguishedSquare.ofOpenCover` (example): X = U ∪ V gives the distinguished square with p the inclusion of V.
- `zariski_le_nisnevich` (relation): Zariski covers are Nisnevich covers.
- `nisnevich_le_etale` (relation): Nisnevich covers are étale covers (Mathlib's Scheme.etaleTopology).
- `DistinguishedSquare.mayerVietorisSquare` (compatibility): A distinguished square is a MayerVietorisSquare for the Nisnevich topology in Mathlib's sense (f₁₃ an open immersion, pushout of sheaves), for noetherian X (MVW 12.7, cited by the K-book).
- `nisnevich_point` (characterisation): For noetherian X the stalk of O at the point over x ∈ X and k(x) → k' is the henselisation O^h_{X,x} at k' (TT E.5(c)).

**Unit tests.**

- `nisnevichTopology.field` (computation): For X = Spec k, a family {Spec k_a → Spec k'} covers iff some k_a → k' is an isomorphism; Spec ℂ → Spec ℝ is an étale cover but not a Nisnevich cover.
- `DistinguishedSquare.open_cover` (degenerate): For V ⊆ X open with U ∪ V = X, the square is distinguished; for U = X any étale V works.
- `DistinguishedSquare.henselian_example` (compatibility): X = Spec ℤ_(p), U = Spec ℚ, V = Spec of an étale ℤ_(p)-algebra with an 𝔽_p-point: the square is distinguished and its limit is the henselisation ℤ_(p)^h (Mathlib HenselianLocalRing).
- `DistinguishedSquare.not_etale_cover` (non-example): X = Spec ℝ[t], U = X ∖ {t = 0}, V = Spec ℂ[t] → X: the fibre over t = 0 is Spec ℂ, not isomorphic to Spec ℝ, so the square is not distinguished, although {U, V} is an étale cover.

**Acceptance.**

- For k a field, (Spec k)_Nis consists of finite products of finite separable extensions, and a family covers k' iff one member is isomorphic to k' (TT E.4).
- The square Spec k[x]_{(x)}^h over Spec k[x]_{(x)} with U = Spec k(x) is a filtered limit of distinguished squares.

**Used by.**

- S.4/nisnevich-excision-square and S.4/nisnevich-descent: K sends distinguished squares to homotopy cartesian squares; descent for X_Nis
- TT 10.8, 11: reduction of K-theory to henselian local rings
- MotivicEtaleKTheory M.5a: Nisnevich sheaves with transfers are sheaves on (the big version of) this site

**Depends on.** libraries: `mathlib:AlgebraicGeometry.Etale`, `mathlib:AlgebraicGeometry.IsOpenImmersion`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:AlgebraicGeometry.Scheme.etaleTopology`, `mathlib:AlgebraicGeometry.Scheme.zariskiTopology`, `mathlib:CategoryTheory.GrothendieckTopology.MayerVietorisSquare`, `mathlib:HenselianLocalRing`.

**Sources.**

- `ThomasonTrobaugh.1990`, Appendix E, E.1 (p. 427): “A family {Vα → U} in the site is cover if for all points x ∈ U, there is an α and a point yα ∈ Vα such that Vα → U sends yα to x and induces an isomorphism of residue fields k(x) ≅ k(yα).” — The covering condition of the Nisnevich site of étale X-schemes (scan text normalised).
- `Kbook.2013`, V.10, Nisnevich descent (PDF p. 456): “is called upper distinguished if UY = U ×X Y , U is open in X, f is ´etale and (Y −UY ) →(X −U) is an isomorphism of the underlying reduced closed subschemes.” — Elementary distinguished squares.
- `Kbook.2013`, V.10, Nisnevich descent (PDF p. 456): “The Nisnevich topology on the category of schemes of ﬁnite type over X is the Grothendieck topology generated by coverings {U →X, Y →X} for the upper distinguished squares.” — The generation statement (the K-book uses the big site of schemes of finite type; the small site is used here).

### Points, coherence and cohomological dimension of the Nisnevich topos

`S.4/nisnevich-cohomological-dimension` · lemma

Let X be a noetherian scheme. (a) X_Nis has enough points, given by the henselisations O^h_{X,x} at finite separable residue extensions (TT E.5). (b) X_Nis is a noetherian (coherent) topos: every Nisnevich cover of a quasi-compact object has a finite subcover (TT E.6(a)). (c) If X has finite Krull dimension N, then H^q_Nis(X, F) = 0 for q > N and every abelian sheaf F (TT E.6(c)). (d) Nisnevich hypercohomology of presheaves of spectra commutes up to homotopy with filtered colimits (TT E.6(d)).

**Hypotheses.**

- X noetherian; (c), (d) with finite Krull dimension.

**Proof.**

1. (a) The fibre functors at Spec k' → Spec k(x) → X distinguish covering families from non-covering ones (SGA 4 IV 6.5); their neighbourhoods are étale neighbourhoods with trivial residue extension, whose limit is the henselisation (EGA IV 18.5-18.8).
2. (b) Noetherian induction: at a generic point η of U some member V_1 has a point with residue field k(η), hence is an isomorphism over a neighbourhood W of η (reduce to U reduced by TT E.3); cover U ∖ W by induction.
3. (c) Induction on dimension following SGA 4 X 4.1, with finite pushforwards exact on Nisnevich sheaves (a finite extension of a henselian local ring is henselian; EGA IV 18.5.10) and fields of Nisnevich cohomological dimension 0 (TT E.4).
4. (d) Coherence (b) and the bounded dimension (c) make hypercohomology commute with filtered colimits (Thomason 1985 1.39).
5. The SGA 4 and EGA IV inputs are cited by the source and not reproved there (recorded in the gap list).

**Acceptance.**

- For X = Spec k, X_Nis has cohomological dimension 0.
- For a DVR O, H^q_Nis(Spec O, F) = 0 for q ≥ 2.

**Depends on.** this roadmap: `S.4/nisnevich-site`; other roadmaps: `SchemeAndStackFoundations:SF.2`; libraries: `mathlib:HenselianLocalRing`, `mathlib:AlgebraicGeometry.IsNoetherian`, `mathlib:topologicalKrullDim`.

**Sources.**

- `ThomasonTrobaugh.1990`, Lemma E.6 (p. 428): “(c) If X has finite Krull dimension N, the cohomological dimension of XNis is at most N. (d) If X has finite Krull dimension, HNis(X; ) preserves up to homotopy direct colimits of presheaves of spectra.” — Parts (c) and (d) (scan text normalised).
- `ThomasonTrobaugh.1990`, Lemma E.5(c) (p. 428): “(c) The stalk of the structure sheaf OX in XNis at the point (k')Zar → (k(x))Nis → X is the henselization of OX,x at the residue field extension k(x) → k' ([EGA] IV 18.8)” — The points (scan text normalised).

### K-theory takes Nisnevich distinguished squares to homotopy cartesian squares

`S.4/nisnevich-excision-square` · theorem

Let X be quasi-compact and quasi-separated and U ⊆ X, p: V → X an elementary distinguished square (S.4/nisnevich-site) with U quasi-compact and V quasi-compact and quasi-separated, and let W ⊆ X be closed with X ∖ W quasi-compact. Then the square K(X on W) → K(U on U ∩ W), K(V on p^{-1}W) → K(U ×_X V on (U ×_X V) ∩ p^{-1}W) of restrictions is homotopy cartesian (nonconnective); in particular K(X) → K(U) × K(V) → K(U ×_X V) is a fibre sequence. Hence U ↦ K(U on U ∩ W) has the Nisnevich Mayer–Vietoris property on qcqs étale X-schemes (K-book Example V.10.10.1, TT 10.8).

**Hypotheses.**

- X qcqs; U quasi-compact; V qcqs; W closed with quasi-compact complement; the square distinguished.

**Proof.**

1. Let Z = X ∖ U with a finitely presented closed subscheme structure (TT 2.6.1(c)); p is étale, hence flat, and p^{-1}(Z) → Z is étale and an isomorphism on reduced subschemes, hence an isomorphism (an étale universally injective surjective morphism that is an isomorphism on reductions is an isomorphism; EGA IV 17.9.1, cited): p is an isomorphism infinitely near Z (S.3/infinitely-near-equivalence).
2. S.3/localisation-fibre-sequence gives fibre sequences K(X on Z ∩ W) → K(X on W) → K(U on U ∩ W) and K(V on p^{-1}(Z ∩ W)) → K(V on p^{-1}W) → K(U ×_X V on (U ×_X V) ∩ p^{-1}W), and p^* maps the first to the second (S.3/boundary-pullback-naturality).
3. On fibres p^* is an equivalence by S.3/excision, so the right-hand square is homotopy cartesian (as in S.4/zariski-mayer-vietoris).

**Acceptance.**

- For the square Spec ℤ_(p)[1/p] = Spec ℚ ⊂ Spec ℤ_(p), V = Spec ℤ_p (after limit): K(ℤ_(p)) → K(ℚ) × K(ℤ_p) → K(ℚ_p) — the Karoubi square of K-book V.7.5 is the limit of distinguished squares.
- Open covers are distinguished squares, so this contains S.4/zariski-mayer-vietoris.

**Depends on.** this roadmap: `S.4/nisnevich-site`, `S.3/infinitely-near-equivalence`, `S.3/excision`, `S.3/localisation-fibre-sequence`, `S.3/boundary-pullback-naturality`; libraries: `mathlib:AlgebraicGeometry.Etale`.

**Sources.**

- `Kbook.2013`, Example V.10.10.1 (PDF p. 456): “The functor KB satisﬁes Nisnevich descent, by TT [200, 10.8].” — The statement for the nonconnective spectrum.
- `ThomasonTrobaugh.1990`, Proof of 10.8 (p. 389): “The henselization Spec(Oh U,z) → Spec(OU,z) is pro-étale, hence flat, and induces an isomorphism of residue fields k(z) = k(z). Hence it is an isomorphism infinitely near z (2.6.2.2), and so by excision 7.1 it induces a homotopy equivalence” — The excision mechanism for étale maps inducing isomorphisms over the closed complement (scan text normalised).

### Thomason's Godement hypercohomology spectrum

`S.4/sheaf-hypercohomology-spectrum` · construction

Let C be a site whose topos has enough points (the Zariski site of a scheme, the Nisnevich site of a noetherian scheme by S.4/nisnevich-cohomological-dimension), and F a presheaf of fibrant spectra on C. With p: P → C the family of points and T = p_*p^* the Godement monad, T^•F is a cosimplicial presheaf of fibrant spectra (the Godement complex), and the sheaf hypercohomology spectrum is H(C; F) := holim_Δ (T^•F)(X), X the terminal object, with the augmentation η: F(X) → H(C; F) (Thomason 1985, Definition 1.33). For U in C, H(C/U; F) makes U ↦ H(U; F) a presheaf, and H_Y(X; F) := fibre(H(X; F) → H(X ∖ Y; F)) is hypercohomology with supports (TT Appendix D).

**Hypotheses.**

- C a site with enough points; F a presheaf of fibrant spectra (replace F by an objectwise fibrant model); homotopy limits of cosimplicial spectra in StableHomotopyKTheory H.5's model.

**Proof.**

1. The Godement monad T = p_*p^* on presheaves of spectra, built pointwise from the stalk functors (Thomason 1985, 1.23-1.32); T^n F is fibrant when F is, and π_q(T^•F) = T^•(π_qF), which depends only on the sheafification of π_qF (1.26, 1.32).
2. Take holim_Δ of the cosimplicial spectrum (T^•F)(X) (Bousfield–Kan homotopy limit of cosimplicial fibrant spectra: requested from StableHomotopyKTheory H.5:spectra, whose text asks for 'enough functorial fibrant/cofibrant replacement to justify the operations used').
3. Functoriality in F and contravariance in the site (1.28); the augmentation comes from F → T^0F.
4. Properties (Thomason 1985 Lemma 1.35): H(C; −) preserves products, fibrations, weak equivalences and homotopy fibre sequences, since T^• and holim_Δ do.

**API.**

- `hypercohomology` (data): H(C; F) with the augmentation η: F(X) → H(C; F).
- `hypercohomology.map` (functoriality): Functorial in F; contravariant in the site (morphisms of sites with enough points).
- `hypercohomology.fiber` (relation): H(C; −) preserves homotopy fibre sequences, products and weak equivalences (Thomason 1985 1.35).
- `hypercohomology.presheaf` (structure): U ↦ H(C/U; F) is a presheaf of fibrant spectra and has the Mayer–Vietoris property for the topology of C.
- `hypercohomology.skyscraper` (simp): For a skyscraper i_{x*}E on the Zariski site, η: E → H(X; i_{x*}E) is an equivalence.
- `hypercohomology.supports` (other): H_Y(X; F) := fibre(H(X; F) → H(X ∖ Y; F)), functorial for maps of pairs.
- `hypercohomology.eilenbergMacLane` (compatibility): π_{−n}H(X; K(A, 0)) ≅ Sheaf.H A n for an abelian sheaf A (Mathlib's sheaf cohomology).

**Unit tests.**

- `hypercohomology.point` (degenerate): For X a point (one-point Zariski site), η: F(X) → H(X; F) is an equivalence.
- `hypercohomology.P1_ktheory_sheaf` (computation): For X = P¹_k and F = K(O^×, 0) (the units sheaf as an Eilenberg–Mac Lane presheaf in degree 0), π_{−1}H(X; F) = H^1(P¹, O^×) = Pic(P¹) ≅ ℤ.
- `hypercohomology.not_sections` (non-example): On the two-point discrete space X = {a, b}, let A be the constant presheaf U ↦ ℤ (A(∅) = ℤ included), which is not a sheaf; for F = K(A, 0), π_0 H(X; F) = Γ(X, aA) = ℤ² ≠ ℤ = A(X): hypercohomology sees only the sheafification, so defining it as sections of the presheaf is wrong.
- `hypercohomology.sheafcoh_compat` (compatibility): For an abelian Zariski sheaf A, π_{−n}H(X; K(A, 0)) agrees with Mathlib's CategoryTheory.Sheaf.H A n.

**Acceptance.**

- For an abelian sheaf A with Eilenberg–Mac Lane presheaf K(A, 0): π_{−n} H(X; K(A, 0)) = H^n(X, A) (Godement's flasque resolution; Mathlib's Sheaf.H).
- For a skyscraper presheaf of spectra i_{x*}F(x), the augmentation is an equivalence (skyscrapers are flasque, TT (10.3.12)).

**Used by.**

- TT 10.3 and 10.8: the augmentations K(X) → H_Zar(X; K) and K(X) → H_Nis(X; K) are the descent statements
- TT 10.5 and 10.10: hypercohomology with supports gives K(X on Y) ≃ H_Y(X; K)
- S.4/hypercohomology-spectral-sequence: the E_2 = H^p(C; π~_q F) spectral sequence

**Depends on.** other roadmaps: `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`; libraries: `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.presheafToSheaf`, `mathlib:CategoryTheory.Sheaf.H`.

**Sources.**

- `Thomason.1985`, Definition 1.33 (printed p. 452): “Let F be a presheaf of fibrant spectra on a site C. Suppose the topos of sheaves on C has enough points. Then the sheaf hypercohomology spectrum of C with coefficients in F is the homotopy limit along Δ of the cosimplicial fibrant spectrum (T· F)(X).” — The definition (scan text normalised).
- `Thomason.1985`, Lemma 1.35 (printed p. 452): “Let C be a site with enough points. Then H·(C; ) on the category of presheaves of fibrant spectra preserves products, fibrations, weak homotopy equivalences, and homotopy fibre sequences.” — The exactness properties used by the descent proofs.

### The hypercohomology spectral sequence

`S.4/hypercohomology-spectral-sequence` · theorem

Let C be a site with enough points and F a presheaf of fibrant spectra on C. There is a spectral sequence E_2^{p,q} = H^p(C; π~_qF) ⇒ π_{q−p} H(C; F) (p ≥ 0), with π~_qF the sheafification of the presheaf π_qF and differentials of bidegree (r, r − 1) (Thomason 1985, Proposition 1.36); it converges strongly if π_qF = 0 for q ≫ 0, or if C has bounded cohomological dimension for the sheaves π~_qF. In cohomological indexing E_2^{p,q} = H^p(C, π~_{−q}F) ⇒ π_{−p−q}H(C; F), as in K-book V.10.11.

**Hypotheses.**

- As in S.4/sheaf-hypercohomology-spectrum; convergence under one of the two boundedness hypotheses.

**Proof.**

1. It is the Bousfield–Kan spectral sequence of the cosimplicial spectrum (T^•F)(X) (Thomason 1985 5.13; requested from StableHomotopyKTheory H.5:spectra together with the homotopy limit).
2. E_1 is the cochain complex of the cosimplicial abelian group π_q T^•F(X) = T^•(π~_qF)(X) (1.26, 1.32), which is the Godement flasque resolution of π~_qF evaluated on X (conservativity of the points and the extra codegeneracy after pulling back to points); flasque resolutions compute sheaf cohomology (Tau Ceti's vanishing of H^{n+1} for flasque sheaves and dimension shifting), so E_2 = H^p(C; π~_qF).
3. Convergence: Thomason 1985 5.44-5.48; under either hypothesis the filtration is finite in each degree.

**Acceptance.**

- For F = K(A, 0) the spectral sequence is concentrated on q = 0 and gives π_{−p}H = H^p(C; A).
- For X noetherian of Krull dimension d, E_2^{p,q} = 0 for p > d (Grothendieck vanishing), so the Zariski spectral sequence for K converges strongly (S.4/zariski-descent-spectral-sequence).

**Depends on.** this roadmap: `S.4/sheaf-hypercohomology-spectrum`; other roadmaps: `StableHomotopyKTheory:H.5:spectra`; libraries: `mathlib:CategoryTheory.Sheaf.H`, `mathlib:TopCat.Presheaf.IsFlasque`, `tauceti:TauCeti.Topology.subsingleton_H_succ_of_isFlasque`, `mathlib:CategoryTheory.SpectralSequence`.

**Sources.**

- `Thomason.1985`, Proposition 1.36 (printed p. 452): “There is a hypercohomology spectral sequence E2^{p,q} = H^p(C; π~q F) ⇒ π_{q−p} H·(C; F), p ≥ 0, ∞ > q > −∞. The indexing is funny so differentials dr have bidegree (r, r−1).” — The statement (scan text normalised: the OCR of the display is replaced by the rendered formula).
- `Thomason.1985`, Proposition 1.36 (printed p. 452): “The spectral sequence converges strongly if either there is an N such that πq F = 0 for q > N or if C has bounded cohomological dimension for the sheaves π~* F.” — The convergence hypotheses (scan text normalised).

### The Zariski and Nisnevich sheaves of K-groups

`S.4/k-theory-sheaves` · definition

For a qcqs scheme X and a closed Y ⊆ X with quasi-compact complement, 𝒦_n^{Zar}(− on Y) is the Zariski sheaf on X associated to the presheaf U ↦ K_n(U on U ∩ Y) (nonconnective, n ∈ ℤ; S.3/support-k-theory), and 𝒦_n := 𝒦_n^{Zar}(− on X). Its stalk at x ∈ X is K_n(O_{X,x} on Y ×_X Spec O_{X,x}) (TT 10.4), in particular (𝒦_n)_x = K_n(O_{X,x}). For noetherian X, 𝒦_n^{Nis} is the sheaf on X_Nis associated to U ↦ K_n(U), with stalk K_n(O^h_{X,x}) at the henselisation at a separable residue extension (TT 10.9). For a regular X with Gersten local rings, 𝒦_n has the flasque Gersten resolution of S.4/gersten-resolution.

**Hypotheses.**

- X qcqs (Zariski); X noetherian for the Nisnevich sheaves; Y closed with quasi-compact complement.

**Proof.**

1. U ↦ K_n(U on U ∩ Y) is a presheaf of abelian groups on the quasi-compact opens (S.3/boundary-pullback-naturality: restriction maps), and quasi-compact opens form a basis of X, so Mathlib's sheafification (CategoryTheory.presheafToSheaf for Opens.grothendieckTopology) applies.
2. Stalks: affine opens containing x are cofinal; on them K_n(Spec A) = K_n(A) (S.2/affine-k-theory-comparison), and K_n commutes with filtered colimits of rings (GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits; for negative n through K.6's filtered-colimit statement), so the stalk is K_n(O_{X,x}); with supports use S.3/affine-support-comparison.
3. Nisnevich: the same on étale X-schemes, with the stalks of S.4/nisnevich-cohomological-dimension(a) (henselisations) as filtered colimits of étale neighbourhoods.

**API.**

- `kSheaf` (data): 𝒦_n (and 𝒦_n(− on Y)) as a sheaf of abelian groups on X_Zar; 𝒦_n^{Nis} on X_Nis.
- `kSheaf.stalk` (characterisation): (𝒦_n)_x ≅ K_n(O_{X,x}), naturally in x.
- `kSheaf.stalk_nis` (characterisation): (𝒦_n^{Nis}) at the point over (x, k') is K_n(O^h_{X,x,k'}).
- `kSheaf.map` (functoriality): For f: X' → X, f^{-1}𝒦_n(X) → 𝒦_n(X') compatible with stalks.
- `kSheaf.zero_of_neg` (simp): 𝒦_n = 0 for n < 0 when X is regular noetherian.
- `kSheaf.units` (compatibility): O_X^× → 𝒦_1 (through λ of S.3/unit-loop-class on local rings), split by the determinant when the stalks are local rings (KTheoryLowDegrees U.3/SK1-local, U.6's identification of π_1 with K_1 assumed).

**Unit tests.**

- `kSheaf.affine_line_stalk` (computation): On X = A¹_k, the stalk of 𝒦_0 at every point is K_0(O_{X,x}) = ℤ, and the stalk of 𝒦_1 at the generic point is K_1(k(t)), which contains λ(t) ≠ 0 because its boundary at the origin is ∂_S λ(t) = 1 (S.3/dvr-boundary-unit-valuation for O_{A¹,0}).
- `kSheaf.point` (degenerate): On X = Spec k, 𝒦_n is the constant sheaf K_n(k).
- `kSheaf.not_presheaf` (non-example): The presheaf U ↦ K_0(U) on P¹_k has global sections ℤ² but H^0(P¹, 𝒦_0) = ℤ (the stalks are K_0 of local rings, ℤ): 𝒦_0 differs from the presheaf.
- `kSheaf.K0_rank` (compatibility): 𝒦_0 on a connected noetherian X is the constant sheaf ℤ (K_0 of a local ring is ℤ, KTheoryLowDegrees Z.2/local-ring-k0).

**Acceptance.**

- 𝒦_0 on a connected scheme contains the constant sheaf ℤ (rank) as a summand; 𝒦_1 ⊇ O^× (determinant splitting on local rings, KTheoryLowDegrees U.3/SK1-local).
- 𝒦_n = 0 for n < 0 on a regular noetherian X (stalks are regular local rings).

**Used by.**

- S.4/zariski-descent-spectral-sequence: E_2 = H^p(X, 𝒦_{−q})
- S.4/gersten-resolution and S.4/bloch-formula: H^p(X, 𝒦_p) ≅ CH^p(X)
- MotivicEtaleKTheory M.6a/b: K-cohomology in the comparison with motivic cohomology
- Polylogarithms P.5: the Gersten complex of K-sheaves in low degrees

**Depends on.** this roadmap: `S.3/support-k-theory`, `S.3/boundary-pullback-naturality`, `S.3/affine-support-comparison`, `S.4/nisnevich-site`, `S.4/nisnevich-cohomological-dimension`, `S.2/affine-k-theory-comparison`; other roadmaps: `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`; libraries: `mathlib:CategoryTheory.presheafToSheaf`, `mathlib:Opens.grothendieckTopology`.

**Sources.**

- `ThomasonTrobaugh.1990`, Remark 10.4 (p. 386): “The sheafification K~B_q in the Zariski topology of the presheaf KB_q has as stalk at a point x ∈ X the KB_q of the local ring OX,x in X” — The Zariski stalks (scan text normalised).
- `ThomasonTrobaugh.1990`, Remark 10.9 (p. 390): “Thus the spectral sequence (10.8.2) reduces problems in the K-theory of X to the case of hensel local rings of schemes etale over X.” — The Nisnevich stalks are henselian local rings.
- `Kbook.2013`, V.9.8 (PDF p. 449): “Here Kn is the sheaf associated to the presheaf U 7→Kn(U); its stalk at x ∈X is Kn(OX,x).” — The K-book's definition.

### The codimension filtration of K-theory by supports

`S.4/codimension-support-filtration` · construction

Let X be a noetherian scheme of finite Krull dimension d and Y ⊆ X closed. For p ≥ 0, S^pK(X on Y) := colim_{Z'} K(X on Y ∩ Z') over closed Z' ⊆ X of codimension ≥ p, a filtered colimit of spectra (TT (10.3.5)); S^0K = K(X on Y) and S^pK = 0 for p > d. The maps S^{p+1}K → S^pK are induced by inclusion of index systems, and the construction is a presheaf on the Zariski (and, via étale pullback, the Nisnevich) site, natural for flat maps. The coniveau filtration of K_n(X on Y) is F^p = im(π_n S^pK → K_n(X on Y)).

**Hypotheses.**

- X noetherian of finite Krull dimension; codimension of a closed Z' is the infimum of dim O_{X,z} over its generic points.

**Proof.**

1. For Z' ⊆ Z'' the enlargement maps K(X on Y ∩ Z') → K(X on Y ∩ Z'') of S.3/support-k-theory form a filtered system (finite unions of closed subsets of codimension ≥ p have codimension ≥ p); take the homotopy colimit.
2. Codimension is preserved by flat pullback (EGA IV 6.1.4 via Quillen §7 5.2) and by étale maps, so the construction is a presheaf on X_Nis (TT 10.8 proof).
3. For p > dim X only Z' = ∅ occurs, so S^pK = 0.

**API.**

- `supportFiltration` (data): S^pK(X on Y), with maps S^{p+1}K → S^pK.
- `supportFiltration.zero` (simp): S^0K(X on Y) ≃ K(X on Y).
- `supportFiltration.vanish` (simp): S^pK = 0 for p > dim X.
- `supportFiltration.flat` (functoriality): Natural for flat maps and restriction to opens.
- `supportFiltration.coniveauFiltration` (projection): F^pK_n(X on Y) = im(π_nS^pK → K_n(X on Y)), a decreasing filtration with F^{d+1} = 0.

**Unit tests.**

- `supportFiltration.dvr` (computation): X = Spec ℤ_(p): S^1K ≃ K(𝔽_p), and F^1K_0(ℤ_(p)) = 0 since i_*[𝔽_p] = 0.
- `supportFiltration.point` (degenerate): X = Spec k: S^0K = K(k), S^pK = 0 for p ≥ 1.
- `supportFiltration.not_dimension` (non-example): Indexing by dimension instead of codimension changes the filtration on X = A¹ ⊔ A² (not equidimensional): the origin of A² has codimension 2 but dimension 0, the closed points of A¹ codimension 1 and dimension 0.
- `supportFiltration.dedekind_classgroup` (compatibility): For X = Spec R with R a Dedekind domain: F^1K_0(R) = ker(rank: K_0(R) → ℤ), which is the image of ⊕_p ℤ in K_0(R) and is isomorphic to Mathlib's ClassGroup R (S.3/dedekind-localisation-sequence, KTheoryLowDegrees Z.4/rank-pic-equivalence).

**Acceptance.**

- For X = Spec O (a DVR): S^0K = K(O), S^1K = K(O on closed point) ≃ K(k), S^2K = 0.
- For X regular, the filtration F^p on K_0(X) = G_0(X) is the topological (coniveau) filtration of K-book II.6.4.3.

**Used by.**

- TT 10.3, 10.8: descending induction on p proves Zariski and Nisnevich descent
- S.4/k-coniveau-spectral-sequence: the tower gives the K-theoretic coniveau exact couple
- MotivicEtaleKTheory M.6a (RS-18): imports this ordinary support filtration; its homotopy-coniveau tower is a different construction

**Depends on.** this roadmap: `S.3/support-k-theory`, `S.3/boundary-pullback-naturality`; other roadmaps: `StableHomotopyKTheory:H.5:spectra`; libraries: `mathlib:ringKrullDim`, `mathlib:topologicalKrullDim`.

**Sources.**

- `ThomasonTrobaugh.1990`, (10.3.5) (p. 384): “Now for p ≥ 0 a non-negative integer, we define (10.3.5) SpKB(( ) on Y ∩ ( )) = lim KB(( ) on Y ∩ Z̄' ∩ ( )) as the direct colimit over all closed Z̄' of codimension ≥ p in X. Note SpKB = 0 if p > dim X.” — The definition (scan text normalised).

### The layers of the support filtration are local support K-theories

`S.4/coniveau-layer-fibre-sequence` · lemma

In the setting of S.4/codimension-support-filtration there is a homotopy fibre sequence of presheaves on X (Zariski, and Nisnevich for noetherian X): S^{p+1}K(− on −∩Y) → S^pK(− on −∩Y) → ⋁_{codim x = p} i_{x*}K(Spec O_{X,x} on x ∩ Y), where i_{x*}F(x) is the skyscraper at x with value F(x) = K(Spec O_{X,x} on {x}) (zero if x ∉ Y) (TT (10.3.6)-(10.3.7)). In the Nisnevich version the skyscraper at x is i_{#}F(x) with F(x)(k') = K(Spec O^h_{X,x,k'} on the closed point) (TT (10.8.3)-(10.8.6)).

**Hypotheses.**

- X noetherian of finite Krull dimension; Y closed.

**Proof.**

1. For Z closed of codimension p and Z' ⊆ Z closed of codimension ≥ p + 1, S.3/localisation-fibre-sequence gives K(V on Z' ∩ V) → K(V on Z ∩ V) → K(V ∖ Z' on (Z ∖ Z') ∩ V) for opens V (TT (10.3.8)).
2. Enlarging Z' to contain all pairwise intersections of the codimension-p components z_1, …, z_r of Z, Z ∖ Z' is a disjoint union of the pieces z_i ∖ Z', and S.3/disjoint-support-additivity splits the right term as ⊕_i K(V ∖ Z' on z_i ∖ Z') (TT (10.3.9)).
3. By S.3/excision the i-th term only depends on a neighbourhood of z_i ∖ Z'; taking the colimit over Z', the limit of these neighbourhoods is Spec O_{X,z_i}, and continuity of K along affine transition maps (TT 7.2; for the affine neighbourhoods, GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits with S.3/affine-support-comparison) gives K(Spec O_{X,z_i} on z_i) (TT (10.3.10)-(10.3.11)).
4. Taking the colimit over Z of codimension ≥ p gives the stated sequence; for the Nisnevich version replace the local ring by its henselisations, which S.3/excision identifies with the same support K-theory (TT (10.8.4)).

**Acceptance.**

- For X regular, K(Spec O_{X,x} on x) ≃ K(k(x)) (S.3/regular-support-devissage), so the layers are ⋁ i_{x*}K(k(x)).
- For X = Spec O (a DVR) and p = 1 the sequence is 0 → K(O on m) → i_{m*}K(O on m).

**Depends on.** this roadmap: `S.4/codimension-support-filtration`, `S.3/localisation-fibre-sequence`, `S.3/disjoint-support-additivity`, `S.3/excision`, `S.3/affine-support-comparison`; other roadmaps: `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`; libraries: `mathlib:skyscraperSheaf`.

**Sources.**

- `ThomasonTrobaugh.1990`, (10.3.6)-(10.3.7) (p. 384): “We claim that the obvious map Sp+1KB → SpKB induced by inclusion of direct systems is part of a homotopy fibre sequence (10.3.6), where the last term is a wedge over the points x of codimension p in X of skyscraper sheaves i*F(x) supported at x:” — The statement, with F(x) = K^B(Spec(O_{X,x}) on x) (scan text normalised).
- `ThomasonTrobaugh.1990`, Proof of 10.3, (10.3.11) (p. 385): “As Z' runs over the codimension ≥ p+1 subspaces of Z, the inverse limit of z̄i − Z' is the point zi, and the inverse limit of the various W's for the various Z''s is the spectrum of the local ring Spec(OX,zi).” — The passage to local rings by excision and continuity (scan text normalised).

### Zariski descent for K-theory (Thomason–Trobaugh, Brown–Gersten)

`S.4/zariski-descent` · theorem · planet “Zariski descent”

Let X be a noetherian scheme of finite Krull dimension (more generally a scheme whose underlying space is noetherian of finite Krull dimension) and Y ⊆ X closed. Then the augmentations K(X) → H_Zar(X; K) and K(X on Y) → H_Zar(X; K(− on − ∩ Y)) into Thomason's Zariski hypercohomology spectra (S.4/sheaf-hypercohomology-spectrum) are homotopy equivalences, and K(X on Y) ≃ H_Y(X; K)_Zar (hypercohomology with supports) (TT 10.3, 10.5).

**Hypotheses.**

- X noetherian of finite Krull dimension; Y closed; nonconnective K.

**Proof.**

1. Descending induction on p: S^pK(X) → H_Zar(X; S^pK) is an equivalence for all p (TT (10.3.13)); for p > dim X both sides vanish.
2. Induction step: the fibre sequence S^{p+1}K → S^pK → ⋁_{codim x = p} i_{x*}F(x) of S.4/coniveau-layer-fibre-sequence is preserved by H_Zar (Thomason 1985 1.35, recorded in S.4/sheaf-hypercohomology-spectrum), and for the skyscraper wedge the augmentation is an equivalence: its homotopy sheaves are skyscrapers, flasque (Tau Ceti isFlasque_skyscraperSheaf), hence acyclic, and the hypercohomology spectral sequence collapses (S.4/hypercohomology-spectral-sequence); the five lemma gives the step (TT (10.3.14)).
3. p = 0 is the theorem; the version with supports is the same argument with K(− on − ∩ Z ∩ Y), and K(X on Y) ≃ H_Y(X; K) follows from the five lemma applied to the localisation sequence (S.3/localisation-fibre-sequence) and the definition of H_Y (TT 10.5).
4. (Alternatively, K has the Mayer–Vietoris property (S.4/zariski-mayer-vietoris) and the Brown–Gersten vanishing lemma (S.4/brown-gersten-vanishing) applied to the fibre of the augmentation gives the same result, K-book V.10.2.)

**Acceptance.**

- For X = Spec R with R local, H_Zar(X; K) ≃ K(R) is the stalk and the statement is trivial; for X = P¹_k it gives K(P¹) ≃ H_Zar(P¹; K).
- The finite-dimensionality hypothesis cannot be dropped in this form (the induction on codimension, and the convergence of the spectral sequence, use it).

**Depends on.** this roadmap: `S.4/coniveau-layer-fibre-sequence`, `S.4/codimension-support-filtration`, `S.4/sheaf-hypercohomology-spectrum`, `S.4/hypercohomology-spectral-sequence`, `S.4/zariski-mayer-vietoris`, `S.4/brown-gersten-vanishing`, `S.3/localisation-fibre-sequence`; libraries: `tauceti:TauCeti.Topology.isFlasque_skyscraperSheaf`, `tauceti:TauCeti.Topology.subsingleton_H_succ_of_isFlasque`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 10.3 (p. 383): “Let X be as in 10.1, and Y ⊆ X a closed subspace. Then the augmentation maps into Zariski hypercohomology spectra are homotopy equivalences (10.3.1):” — The statement: K^B(X) ≃ H_Zar(X; K^B( )) and K^B(X on Y) ≃ H_Zar(X; K^B(( ) on ( ) ∩ Y)) (scan text normalised).
- `ThomasonTrobaugh.1990`, 10.1 (p. 382): “Let X be a scheme with underlying space a noetherian space of finite Krull dimension. For example, X should be a finite dimensional noetherian scheme.” — The hypothesis.
- `Kbook.2013`, Theorem V.10.2 (PDF p. 451): “Let F be a presheaf of simplicial sets (or spectra) on X. Then F satisﬁes Zariski descent if and only if it has the Mayer-Vietoris property.” — The Brown–Gersten characterisation, the alternative route.

### The Brown–Gersten–Thomason descent spectral sequence

`S.4/zariski-descent-spectral-sequence` · theorem · planet “Brown–Gersten–Thomason spectral sequence”

Let X be a noetherian scheme of Krull dimension d < ∞ and Y ⊆ X closed. There are strongly convergent spectral sequences E_2^{p,q} = H^p_Zar(X, 𝒦_{−q}) ⇒ K_{−p−q}(X) and E_2^{p,q} = H^p_Zar(X, 𝒦_{−q}(− on − ∩ Y)) ⇒ K_{−p−q}(X on Y), with E_2^{p,q} = 0 for p > d (Grothendieck vanishing) (TT (10.3.2); K-book V.10.11-10.12), and with supports E_2 = H^p_Y(X, 𝒦_{−q}) ⇒ K_{−p−q}(X on Y) (TT 10.5). The rows q = 0 and q = −1 begin with H^p(X, ℤ) and H^p(X, O^×).

**Hypotheses.**

- X noetherian of finite Krull dimension d; 𝒦_n from S.4/k-theory-sheaves.

**Proof.**

1. S.4/zariski-descent identifies K(X on Y) with H_Zar(X; K(− on − ∩ Y)).
2. S.4/hypercohomology-spectral-sequence for F = K(− on − ∩ Y) gives E_2^{p,q} = H^p(X, π~_{−q}F) = H^p(X, 𝒦_{−q}(− on − ∩ Y)).
3. Grothendieck's vanishing theorem: H^p(X, A) = 0 for p > dim X on a noetherian space of dimension ≤ d (TT 10.2; requested from SchemeAndStackFoundations SF.2, which owns sheaf cohomology of schemes), so the spectral sequence is bounded and converges strongly.
4. Supports: apply the same to H_Y (TT 10.5) and the local-cohomology spectral sequence (TT Appendix D.4).

**Acceptance.**

- X = Spec R local: the spectral sequence is concentrated on p = 0.
- X a curve (d = 1): 0 → H^1(X, 𝒦_{n+1}) → K_n(X) → H^0(X, 𝒦_n) → 0 for all n.

**Depends on.** this roadmap: `S.4/zariski-descent`, `S.4/hypercohomology-spectral-sequence`, `S.4/k-theory-sheaves`; other roadmaps: `SchemeAndStackFoundations:SF.2`; libraries: `mathlib:CategoryTheory.Sheaf.H`, `mathlib:topologicalKrullDim`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 10.3, (10.3.2) (p. 383): “Thus there are stronlgy converging spectral sequences (10.3.2) E2^{p,q} = H^p_Zar(X; K~B_q) ⇒ KB_{q−p}(X)” — The spectral sequence in Bousfield–Kan indexing (scan text normalised).
- `ThomasonTrobaugh.1990`, 10.2 (p. 382): “A theorem of Grothendieck [Gro] 3.6.5 reveals that the Zariski cohomological dimension of such an X is at most its Krull dimension dim X, so H^p_Zar(X; ) = 0 for p > dim X.” — Grothendieck vanishing, giving strong convergence (scan text normalised).
- `Kbook.2013`, Example V.10.12 (PDF p. 457): “Similarly, the presheaf U 7→KB satisﬁes the Mayer-Vietoris property, so there is a spectral sequence with Ep,q 2 = Hp(X, K−q) converging to K∗(X). This spectral sequence lives mostly in the fourth quadrant.” — The K-book's form.

### Nisnevich descent for K-theory

`S.4/nisnevich-descent` · theorem · planet “Nisnevich descent”

Let X be a noetherian scheme of finite Krull dimension and Y ⊆ X a closed subscheme. Then K(X) → H_Nis(X; K) and K(X on Y) → H_Nis(X; K(− on − ×_X Y)) are homotopy equivalences, K(X on Y) ≃ H_Y(X; K)_Nis, and there are strongly convergent spectral sequences E_2^{p,q} = H^p_Nis(X, 𝒦^{Nis}_{−q}(− on − ×_X Y)) ⇒ K_{−p−q}(X on Y) whose stalks are the K-groups of henselian local rings of schemes étale over X (TT 10.8-10.10).

**Hypotheses.**

- X noetherian of finite Krull dimension; Y closed.

**Proof.**

1. The support filtration S^pK and the fibre sequence of S.4/coniveau-layer-fibre-sequence are natural for étale maps, so they are sequences of presheaves on X_Nis, with layers the pushforwards i_{#}F(x) from the Nisnevich sites of the residue fields, F(x)(k') = K(Spec O^h_{X,x,k'} on the closed point) (TT (10.8.3)-(10.8.6)).
2. The layers are Nisnevich-acyclic: on the Nisnevich site of a field every cover of a field is split, so every sheaf is acyclic, and i_* from a closed point is exact on Nisnevich sheaves (S.4/nisnevich-cohomological-dimension; SGA 4 V 4.9), and H_Nis commutes with the infinite wedge (TT E.6(d)); so the augmentation is an equivalence on layers (TT (10.8.8)-(10.8.9)).
3. Descending induction on p as in S.4/zariski-descent gives the equivalence for S^0K = K(X on Y).
4. The spectral sequence is S.4/hypercohomology-spectral-sequence for X_Nis (enough points: S.4/nisnevich-cohomological-dimension(a)), strongly convergent because cd(X_Nis) ≤ dim X (part (c)); supports as in TT 10.10.

**Acceptance.**

- For X = Spec O^h (a henselian local ring) the spectral sequence is concentrated on p = 0.
- K-book Ex. V.10.9: for a one-dimensional noetherian X, K_{−1}(X) ≅ H^1_Nis(X, ℤ) follows from this spectral sequence and K_{−1} = 0 for henselian local rings (K-book III.4.4.3).

**Depends on.** this roadmap: `S.4/coniveau-layer-fibre-sequence`, `S.4/codimension-support-filtration`, `S.4/nisnevich-site`, `S.4/nisnevich-cohomological-dimension`, `S.4/sheaf-hypercohomology-spectrum`, `S.4/hypercohomology-spectral-sequence`, `S.4/zariski-descent`, `S.4/nisnevich-excision-square`, `S.4/k-theory-sheaves`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 10.8 (p. 388): “Let X be a noetherian scheme of finite Krull dimension, and let Y ⊆ X be a closed subscheme. Then the augmentation maps into Nisnevich hypercohomology are homotopy equivalences” — The statement: K^B(X) ≃ H_Nis(X; K^B( )) and K^B(X on Y) ≃ H_Nis(X; K^B(( ) on ( ) ×_X Y)) (scan text normalised).
- `ThomasonTrobaugh.1990`, Proof of 10.8 (p. 388): “The strong convergence holds as X has finite Nisnevich cohomological dimension by E.6(c).” — Convergence.

### The coniveau spectral sequence of K-theory with supports

`S.4/k-coniveau-spectral-sequence` · construction

Let X be a noetherian scheme of finite Krull dimension and Y ⊆ X closed. The tower S^•K(X on Y) of S.4/codimension-support-filtration, with layers ⊕_{codim x = p} K(Spec O_{X,x} on x ∩ Y) (S.4/coniveau-layer-fibre-sequence evaluated on X), gives an exact couple D_1^{p,q} = π_{−p−q}S^pK, E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(O_{X,x} on x) and a bounded, strongly convergent spectral sequence E_1^{p,q} ⇒ K_{−p−q}(X on Y) whose abutment filtration is the coniveau filtration F^p. It is natural for flat maps. If X is regular, E_1^{p,q} ≅ ⊕_{codim x = p} K_{−p−q}(k(x)) and the spectral sequence is identified with Quillen's G-theory coniveau spectral sequence (S.4/k-coniveau-first-page-regular); for singular X the local terms K(O_{X,x} on x) are not K(k(x)) in general.

**Hypotheses.**

- X noetherian of finite Krull dimension; Y closed.

**Proof.**

1. The fibre sequences S^{p+1}K(X on Y) → S^pK(X on Y) → ⊕_{codim x = p} K(O_{X,x} on x ∩ Y) (global sections of S.4/coniveau-layer-fibre-sequence; the wedge is a sum since spectra are stable) form a tower of spectra; their long exact sequences form an exact couple.
2. S^0K = K(X on Y) and S^pK = 0 for p > dim X, so the spectral sequence is bounded and converges to π_*K(X on Y) (as in K-book V.9.2's proof, WHomo 5.9.7); package it through a spectral object (Mathlib's CategoryTheory.Abelian.SpectralObject and its spectralSequence).
3. Flat naturality from that of S^pK.

**API.**

- `kConiveauSS` (data): The spectral sequence E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(O_{X,x} on x ∩ Y) ⇒ K_{−p−q}(X on Y).
- `kConiveauSS.converges` (characterisation): Strong convergence to K_*(X on Y) with the coniveau filtration F^p; E_1^{p,q} = 0 unless 0 ≤ p ≤ dim X.
- `kConiveauSS.flat` (functoriality): Natural for flat morphisms.
- `kConiveauSS.edge` (projection): The edge map K_n(X) → E_1^{0,−n} = ⊕_{generic η} K_n(O_{X,η}) is restriction to the generic points.
- `kConiveauSS.regular` (compatibility): For X regular, E_1^{p,q} ≅ ⊕ K_{−p−q}(k(x)) and the spectral sequence is Quillen's (S.4/k-coniveau-first-page-regular).

**Unit tests.**

- `kConiveauSS.dvr` (computation): For O = ℤ_(p): E_1^{0,−1} = K_1(ℚ), E_1^{1,−1} = K_0(ℤ_(p) on (p)) ≅ ℤ, d_1(λ(p)) = 1.
- `kConiveauSS.field` (degenerate): For X = Spec k the spectral sequence is concentrated in p = 0 with E_1^{0,−n} = K_n(k).
- `kConiveauSS.singular_local_term` (non-example): For X = Spec k[ε]/(ε²) (dimension 0), E_1^{0,−n} = K_n(k[ε]/(ε²)), which is not K_n(k) (K_1 = k^× × k): the first page is not ⊕ K(k(x)) without regularity.
- `kConiveauSS.G_compat` (compatibility): For X = A²_k the spectral sequence agrees with Quillen's (K = G), with E_1^{2,−2} = ⊕_{closed x} ℤ.

**Acceptance.**

- X = Spec O (a DVR): E_1 has two columns K_n(L) (p = 0) and K_{n−1}(k) (p = 1, via dévissage), d_1 = ∂_S, and the spectral sequence is S.3/dvr-localisation-sequence.
- X a regular curve: two columns, identified with S.3/one-dimensional-localisation-sequence.

**Used by.**

- K-book V.9.5 and Quillen 5.4: for regular X this is Quillen's coniveau spectral sequence, E_2^{p,−p} = CH^p
- EllipticKTheory E.4 (RS-18: imports S.4's ordinary coniveau): the two-column curve case
- MotivicEtaleKTheory M.6a: the ordinary coniveau tower to which its homotopy-coniveau tower is compared

**Depends on.** this roadmap: `S.4/codimension-support-filtration`, `S.4/coniveau-layer-fibre-sequence`; other roadmaps: `StableHomotopyKTheory:H.5:spectra`; libraries: `mathlib:CategoryTheory.Abelian.SpectralObject`, `mathlib:CategoryTheory.Abelian.SpectralObject.spectralSequence`, `mathlib:CategoryTheory.Abelian.SpectralObject.coreE₂Cohomological`.

**Sources.**

- `ThomasonTrobaugh.1990`, (10.3.6)-(10.3.7) (p. 384): “In the case with supports Y, F(x) = KB(Spec(OX,x) on x ∩ Y), so F(x) = 0 if x ∉ Y.” — The layers of the tower (scan text normalised).
- `Kbook.2013`, Proof of Proposition V.9.2 (PDF p. 444): “Because M(R) = M0(R) and Mp(R) = ∅for p > dim(R), the resulting spectral sequence is bounded and converges to K∗(R)” — The boundedness and convergence argument for such a finite tower.

### Coherent sheaves supported in codimension at least p

`S.4/coherent-codimension-filtration` · definition

Let X be a noetherian scheme. For p ≥ 0, M^p(X) is the full subcategory of Coh(X) of coherent sheaves whose support has codimension ≥ p, the codimension of a closed Z being the infimum of dim O_{X,z} over its generic points z (Quillen §7.5). Each M^p(X) is a Serre subcategory, M^0(X) = Coh(X), M^{p+1}(X) ⊆ M^p(X), and M^p(X) = 0 for p > dim X. K(M^p(X)) = colim_Z G(Z) over closed Z of codimension ≥ p (Quillen (5.1)), via S.3/coherent-support-devissage. Flat pullback preserves M^p (Quillen 5.2). For a ring R, M^p(R) consists of the finitely generated modules whose associated primes have height ≥ p (K-book V.9.1).

**Hypotheses.**

- X noetherian (finite Krull dimension for the vanishing M^p = 0, p > dim X).

**Proof.**

1. Support of a coherent sheaf is closed, and codimension is monotone and ≥ min over components, so M^p is closed under subobjects, quotients and extensions (supports of extensions are unions): a Serre subcategory of Coh(X) (K-book Ex. II.6.9).
2. M^p(X) = ⋃_{codim Z ≥ p} Coh_Z(X) (S.3/coherent-sheaves-with-support) as a filtered union; K commutes with filtered unions of exact categories (GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits) and K(Coh_Z(X)) ≃ G(Z) (S.3/coherent-support-devissage).
3. Flat pullback: for f: X' → X flat and Z of codimension p, every generic point z' of f^{-1}(Z) maps to a generic point z of Z with dim O_{X',z'} = dim O_{X,z} (flat local homomorphism with maximal-ideal-primary extension, EGA IV 6.1.3; Quillen 5.2).

**API.**

- `codimFiltration` (data): M^p(X) ⊆ Coh(X), p ∈ ℕ.
- `codimFiltration.isSerre` (instance): Each M^p(X) is a Serre subcategory.
- `codimFiltration.antitone` (relation): M^{p+1}(X) ⊆ M^p(X); M^0(X) = Coh(X); M^p(X) = 0 for p > dim X.
- `codimFiltration.K_colim` (characterisation): K(M^p(X)) ≃ colim_{codim Z ≥ p} G(Z).
- `codimFiltration.flat` (functoriality): Flat f: X' → X maps M^p(X) into M^p(X').
- `codimFiltration.ring` (compatibility): On Spec R: M^p(R) = finitely generated modules all of whose associated primes have Ideal.height ≥ p.

**Unit tests.**

- `codimFiltration.Z` (computation): M^1(Spec ℤ) = finite abelian groups, and ℤ/6 ∈ M^1 ∖ M^2.
- `codimFiltration.field` (degenerate): For X = Spec k: M^0 = Coh(k) and M^1 = 0.
- `codimFiltration.not_dimension` (non-example): On X = Spec k[x, y, z]/(xz, yz) (a plane and a line meeting at the origin), the skyscraper at a closed point of the line has support of codimension 1 in X (the line component has dimension 1), not 2; indexing by the dimension of the support gives a different filtration.
- `codimFiltration.height_compat` (compatibility): For R = k[x, y] and M = R/(x): M ∈ M^1(R) ∖ M^2(R), matching Ideal.height (x) = 1.

**Acceptance.**

- M^1(Spec ℤ) is the category of finite abelian groups; M^2(Spec ℤ) = 0.
- For X of dimension d, M^d(X) consists of the sheaves of finite length supported on closed points of codimension d.

**Used by.**

- S.4/g-coniveau-spectral-sequence: the filtration M^• gives the exact couple
- S.4/gersten-quillen-property: Gersten's condition is that M^{p+1} → M^p is zero on K
- S.7 (SchemeKTheoryOperations) and SchemeAndStackFoundations SF.5: the coniveau filtration on G_0 compared with the γ-filtration and cycles

**Depends on.** this roadmap: `S.3/coherent-sheaves-with-support`, `S.3/coherent-support-devissage`; other roadmaps: `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`; libraries: `mathlib:AlgebraicGeometry.IsNoetherian`, `mathlib:Ideal.height`, `mathlib:ringKrullDim`.

**Sources.**

- `Quillen.1973`, §7.5 (printed pp. 122-123): “Let M_p(X) denote the Serre subcategory of M(X) consisting of those coherent sheaves whose support is of codimension ≥ p. (The codimension of a closed subset Z of X is the infimum of the dimensions of the local rings O_{X,z} where z runs over the generic points of Z.)” — The definition (scan text normalised).
- `Kbook.2013`, V.9 (PDF p. 445): “Here we let Mi(X) denote the category of coherent OX-modules whose support has codimension ≥i.” — The K-book's definition.

### The graded pieces of the codimension filtration

`S.4/coniveau-quotient-decomposition` · lemma

Let X be a noetherian scheme and p ≥ 0. The stalk functor F ↦ (F_x)_{x} over the points x of codimension p induces an equivalence M^p(X)/M^{p+1}(X) ≃ ⊕_{codim x = p} Coh_{fl}(O_{X,x}) (finite-length O_{X,x}-modules; finitely many nonzero components for each object), and dévissage gives K(M^p(X)/M^{p+1}(X)) ≃ ⊕_{codim x = p} K(k(x)) (Quillen proof of 5.4, K-book V.9.4, II.6.4.3).

**Hypotheses.**

- X noetherian; p ≥ 0.

**Proof.**

1. For F ∈ M^p(X) the points of codimension p in Supp F are among its finitely many generic points, and F_x has finite length over O_{X,x} (its support in Spec O_{X,x} is the closed point); F ↦ (F_x) is exact with kernel M^{p+1}(X), so it factors through the Serre quotient.
2. Fully faithful and essentially surjective on the quotient: localise at the finitely many relevant points, using S.3/coherent-quotient-by-support on complements of closed subsets of codimension ≥ p + 1 and S.3/g-theory-continuity's limit description of Spec O_{X,x} (every finite-length O_{X,x}-module extends to a coherent sheaf supported on the closure of x).
3. Dévissage for abelian categories all of whose objects have finite length (GeneralAlgebraicKTheory:K.3/devissage-theorem, K-book Application V.4.3): K(Coh_fl(O_{X,x})) ≃ K(k(x)), the simple object being k(x); K commutes with direct sums (K.7).

**Acceptance.**

- For X = Spec ℤ and p = 1: M^1/M^2 = M^1 = finite abelian groups ≃ ⊕_p (finite p-groups), with K ≃ ⊕_p K(𝔽_p).
- K_0(M^p/M^{p+1}) ≅ Z^p(X), the free abelian group on points of codimension p (K-book II.6.4.3).

**Depends on.** this roadmap: `S.4/coherent-codimension-filtration`, `S.3/coherent-quotient-by-support`, `S.3/g-theory-continuity`; other roadmaps: `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`; libraries: `mathlib:AlgebraicGeometry.AlgebraicCycle`.

**Sources.**

- `Kbook.2013`, V.9 (PDF p. 445): “Then Mi/Mi+1 is equivalent to the direct sum, over all points x of codimension i in X, of the Mx(OX,x); by devissage this category has the same K-theory as its subcategory M(k(x)).” — The statement.
- `Kbook.2013`, V.9.1 (PDF p. 443): “We saw in II. 6.4.3 and Ex. II. 6.9 that each Mi(R) is a Serre subcategory of M(R) and that Mi/Mi+1(R) ∼= L ht(p)=i Mp(Rp), where Mp(Rp) is the category of Rp- modules of ﬁnite length.” — The affine form.

### Quillen's coniveau spectral sequence

`S.4/g-coniveau-spectral-sequence` · construction · planet “Coniveau spectral sequence”

Let X be a noetherian scheme of finite Krull dimension. The localisation sequences K(M^{p+1}(X)) → K(M^p(X)) → K(M^p/M^{p+1}) (GeneralAlgebraicKTheory K.3) form an exact couple D_1^{p,q} = K_{−p−q}(M^p(X)), E_1^{p,q} = K_{−p−q}(M^p/M^{p+1}) ≅ ⊕_{codim x = p} K_{−p−q}(k(x)), giving a bounded, convergent fourth-quadrant cohomological spectral sequence E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(k(x)) ⇒ G_{−p−q}(X) (Quillen 5.4, Gersten; K-book V.9.5), with abutment filtration the coniveau filtration F^pG_n(X) = im(K_nM^p(X) → G_n(X)). Its edge maps G_n(X) → E_1^{0,−n} = ⊕ K_n(k(η)) (generic points) are restriction to generic points (X reduced), its d_1 components are residues (S.4/coniveau-residue-differential), E_2^{p,−p} = CH^p(X) (S.4/coniveau-chow-group), and it is contravariant for flat maps (S.4/coniveau-flat-functoriality). For X not finite-dimensional it converges to lim K_*(M/M^i).

**Hypotheses.**

- X noetherian of finite Krull dimension.

**Proof.**

1. S.4/coherent-codimension-filtration gives the Serre subcategories M^{p+1} ⊆ M^p; Quillen's localisation (GeneralAlgebraicKTheory:K.3/abelian-localization-theorem) gives the long exact sequences, which form an exact couple.
2. S.4/coniveau-quotient-decomposition identifies E_1.
3. M^0 = Coh(X) and M^p = 0 for p > dim X, so the couple is bounded and the spectral sequence converges to G_*(X) (K-book V.9.2 proof, via WHomo 5.9.7); package it as a spectral object in abelian groups (Mathlib's CategoryTheory.Abelian.SpectralObject with SpectralObject.spectralSequence and coreE₂Cohomological) or directly as a Mathlib CategoryTheory.SpectralSequence.
4. Edge maps: G_n(X) = K_nM^0 → K_n(M^0/M^1) = ⊕_η K_n(k(η)), whose components are induced by M(X) → M(k(η)) (restriction to generic points).

**API.**

- `coniveauSS` (data): The spectral sequence E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(k(x)) ⇒ G_{−p−q}(X).
- `coniveauSS.exactCouple` (structure): The exact couple (D_1, E_1) from the localisation sequences of M^{p+1} ⊆ M^p.
- `coniveauSS.converges` (characterisation): Convergence to G_*(X) with filtration F^pG_n(X) = im(K_nM^p(X) → G_n(X)); E_1^{p,q} = 0 unless 0 ≤ p ≤ dim X and p + q ≤ 0.
- `coniveauSS.edge` (projection): The edge map G_n(X) → ⊕_η K_n(k(η)) is restriction to the generic points.
- `coniveauSS.d1` (simp): The components of d_1 are residues (S.4/coniveau-residue-differential); on K_1 they are length orders (S.4/coniveau-weight-one-differential).
- `coniveauSS.d1_d1` (relation): d_1 ∘ d_1 = 0 (S.4/residue-composite-vanishes).
- `coniveauSS.E2_chow` (characterisation): E_2^{p,−p} ≅ CH^p(X) (S.4/coniveau-chow-group).
- `coniveauSS.flat` (functoriality): Contravariant for flat maps (S.4/coniveau-flat-functoriality).
- `coniveauSS.proper` (functoriality): For f: X → Y proper of relative dimension d, f_* maps M^i(X) to M^{i−d}(Y) and induces a map of spectral sequences E_r^{p,q}(X) → E_r^{p−d,q+d}(Y) compatible with G-theory pushforward (K-book Ex. V.9.3, Gillet; an exercise, recorded as a gap).
- `coniveauSS.K_compat` (compatibility): For X regular it is the K-theoretic coniveau spectral sequence of S.4/k-coniveau-spectral-sequence (S.4/k-coniveau-first-page-regular).

**Unit tests.**

- `coniveauSS.dvr` (computation): X = Spec ℤ_(p): E_1^{0,−1} = ℚ^× (via λ), E_1^{1,−1} = K_0(𝔽_p) = ℤ, d_1 = v_p; E_2^{1,−1} = 0, E_2^{0,−1} = ℤ_(p)^×.
- `coniveauSS.field` (degenerate): X = Spec k: only the column p = 0, E_1^{0,−n} = K_n(k), E_2 = E_1.
- `coniveauSS.P1` (computation): X = P¹_k: E_2^{1,−1} = CH^1(P¹) = ℤ and E_2^{0,0} = ℤ, so G_0(P¹) ≅ ℤ² (with S.5's projective-line theorem as a cross-check).
- `coniveauSS.nonreduced` (non-example): X = Spec k[ε]/(ε²): E_1^{0,−n} = K_n(k) (residue field), not K_n(k[ε]/(ε²)): the first page sees residue fields only, matching G = K(k) (dévissage), and differs from K_n(X) (K_1(X) = k^× × k).

**Acceptance.**

- X = Spec O (a DVR): two columns, d_1 = ∂_S, and the spectral sequence is S.3/dvr-localisation-sequence.
- X = P¹_k: E_1^{0,−n} = K_n(k(t)), E_1^{1,−n} = ⊕_x K_{n−1}(k(x)); d_1 is split surjective (the transfers to K_{n−1}(k) and S.3/weil-reciprocity-k-theory), giving G_n(P¹) = K_n(k) ⊕ K_{n−1}(k) (K-book Example V.9.8.2).

**Used by.**

- EllipticKTheory E.4 (RS-18: imports S.4's ordinary coniveau): the two-column coniveau spectral sequence of a curve and its filtration
- EllipticKTheory E.6 and EllipticRegulators ER.6: d_1 d_1 = 0 on a regular arithmetic surface (vertical residues)
- S.4/gersten-resolution and S.4/bloch-formula: E_2 = H^p(X, 𝒦_{−q}) and E_2^{p,−p} = CH^p
- SchemeKTheoryOperations S.6 (Adams operations on coniveau) and S.7 (γ versus coniveau): operations act on this spectral sequence with weight shifts
- Polylogarithms P.5: the last terms of the Gersten complex (the comparison with Bloch's cycle complex is MotivicEtaleKTheory's)

**Depends on.** this roadmap: `S.4/coherent-codimension-filtration`, `S.4/coniveau-quotient-decomposition`, `S.2/g-theory-of-a-scheme`; other roadmaps: `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`; libraries: `mathlib:CategoryTheory.Abelian.SpectralObject`, `mathlib:CategoryTheory.Abelian.SpectralObject.spectralSequence`, `mathlib:CategoryTheory.Abelian.SpectralObject.coreE₂Cohomological`, `mathlib:CategoryTheory.SpectralSequence`.

**Sources.**

- `Kbook.2013`, Proposition V.9.5 (PDF p. 446): “Proposition 9.5. (Gersten) If X is noetherian and dim(X) < ∞, there is a convergent 4th quadrant cohomological spectral sequence (zero unless p+q ≤0): Ep,q 1 = M codim(x)=p K−p−q(k(x)) ⇒G−p−q(X).” — The statement (the rendered E_1 term is ⊕_{codim(x)=p} K_{−p−q}(k(x))).
- `Quillen.1973`, §7, Theorem 5.4 (printed p. 123): “Let X_p be the set of points of codimension p in X. There is a spectral sequence (5.5) E_1^{pq}(X) = ⨿_{x∈X_p} K_{−p−q}k(x) ⇒ K'_{−n}X which is convergent when X has finite (Krull) dimension. This spectral sequence is contravariant for flat morphisms.” — Quillen's statement (scan text normalised).

### Flat functoriality and continuity of the coniveau spectral sequence

`S.4/coniveau-flat-functoriality` · lemma

Let f: X' → X be a flat morphism of noetherian schemes of finite Krull dimension. Then f^* maps M^p(X) into M^p(X') and induces a morphism of exact couples and of coniveau spectral sequences, compatible with the edge maps and with G-theory flat pullback. If X = lim X_i is a filtered projective system of noetherian schemes with affine flat transition maps and X noetherian, K_*(M^p(X)) = colim K_*(M^p(X_i)) and the spectral sequence of X is the colimit of those of the X_i (Quillen 5.3, 5.4); in particular for x ∈ X the spectral sequence of Spec O_{X,x} is the colimit of those of the affine neighbourhoods of x.

**Hypotheses.**

- f flat; noetherian schemes of finite Krull dimension; for the colimit statement, affine flat transition maps and a noetherian limit.

**Proof.**

1. S.4/coherent-codimension-filtration: flat pullback preserves codimension, so f^* is an exact functor of filtered abelian categories; Quillen localisation is functorial for exact functors of pairs (GeneralAlgebraicKTheory:K.3/abelian-localization-theorem), giving a map of exact couples.
2. Colimits: every closed Z ⊆ X of codimension ≥ p is the preimage of a closed Z_i of codimension ≥ p for i large (Quillen proof of 5.3), and Coh(X) = colim Coh(X_i) (S.3/g-theory-continuity); K commutes with filtered colimits (GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits) and filtered colimits of exact couples are exact.

**Acceptance.**

- For the localisation Spec O_{X,x} → X, the map on E_1 is the projection to the points specialising to x.
- For Spec k(η) → X at a generic point, the map is the edge map.

**Depends on.** this roadmap: `S.4/coherent-codimension-filtration`, `S.4/g-coniveau-spectral-sequence`, `S.3/g-theory-continuity`; other roadmaps: `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`; libraries: `mathlib:AlgebraicGeometry.Flat`.

**Sources.**

- `Quillen.1973`, §7, 5.2-5.3 (printed p. 123): “We also have (5.2) f*(M_p(X)) ⊂ M_p(X') if f : X' → X is flat.” — Flat functoriality (scan text normalised); 5.3 is the limit statement.
- `Kbook.2013`, Remark V.9.2.2 (PDF p. 444): “If f : R →S is ﬂat then ⊗RS sends Mi(R) to Mi(S). It follows that the spectral sequence ( 9.2) is covariant for ﬂat maps.” — The K-book's form.

### The first differential of the coniveau spectral sequence is a sum of residues

`S.4/coniveau-residue-differential` · lemma

Let X be a noetherian scheme of finite Krull dimension, y ∈ X of codimension p and x ∈ X of codimension p + 1. The component (d_1)_{yx}: K_n(k(y)) → K_{n−1}(k(x)) of d_1: E_1^{p,−n} → E_1^{p+1,−n} vanishes unless x lies in the closure Y of y. If x ∈ Y (then x has codimension one in Y, the latter with its reduced structure), (d_1)_{yx} is the boundary of the localisation sequence of the one-dimensional local domain O_{Y,x} with fraction field k(y) and residue field k(x) (S.3/one-dimensional-localisation-sequence); when O_{Y,x} is a DVR it is the DVR boundary ∂_S (S.3/dvr-boundary). In particular, for X regular and p = 0 (X integral with function field F), (d_1)_{ηx} = ∂_x: K_n(F) → K_{n−1}(k(x)), the DVR boundary of O_{X,x}.

**Hypotheses.**

- X noetherian of finite Krull dimension; codim y = p, codim x = p + 1.

**Proof.**

1. The closed immersion Y → X sends M^j(Y) into M^{j+p}(X) (a point of codimension j in Y has codimension ≥ j + p in X, with equality at y (j = 0) and at x (j = 1)), so it maps the coniveau spectral sequence of Y to that of X, shifted by p, compatibly with the components at y and x (Quillen proof of 5.14).
2. The flat map Spec O_{Y,x} → Y maps the spectral sequence of Y to that of the local scheme (S.4/coniveau-flat-functoriality), which has two columns with d_1 the boundary of its localisation sequence (S.3/one-dimensional-localisation-sequence).
3. If x ∉ Y, the sheaves supported on the closure of y have no stalk contribution at x in M^{p+1}/M^{p+2}, so (d_1)_{yx} = 0.

**Acceptance.**

- X = A²_k, y the generic point of the line L = V(x), x the origin: (d_1)_{yx}: K_n(k(y)) → K_{n−1}(k) is the DVR boundary of O_{L,0} = k[y]_(y).
- For the cusp Y = V(y² − x³) ⊂ A² and x the origin, O_{Y,x} is not a DVR and (d_1)_{yx} on K_1 is ord (length): ord(x) = 2, ord(y) = 3.

**Depends on.** this roadmap: `S.4/g-coniveau-spectral-sequence`, `S.4/coniveau-flat-functoriality`, `S.3/one-dimensional-localisation-sequence`, `S.3/dvr-boundary`, `S.3/coherent-support-devissage`.

**Sources.**

- `Quillen.1973`, Proof of Proposition 5.14 (printed p. 128): “The closed immersion Y → X carries M_j(Y) to M_{j+p−1}(X) for all j, hence it induces a map from the spectral sequence 5.5 for Y to the one for X augmenting the filtration by p−1.” — The closed-immersion step (Quillen's y has codimension p − 1; scan text normalised).
- `Quillen.1973`, Proof of Proposition 5.14 (printed p. 128): “if x is of codimension one in Y, then the flat map Spec(O_{Y,x}) → Y induces a map of spectral sequences” — The localisation step (scan text normalised).

### On K_1 the first differential is the divisor of a rational function

`S.4/coniveau-weight-one-differential` · lemma

In the setting of S.4/coniveau-residue-differential, for n = 1 the component (d_1)_{yx}: k(y)^× = K_1(k(y)) → K_0(k(x)) = ℤ is the length order ord_x^Y: for f = a/b with a, b ∈ O_{Y,x} ∖ {0}, ord_x^Y(f) = ℓ(O_{Y,x}/a) − ℓ(O_{Y,x}/b) (Mathlib's Ring.ordFrac on O_{Y,x}; Scheme.ord on Y). Hence d_1: ⊕_{codim y = p−1} k(y)^× → ⊕_{codim x = p} ℤ = Z^p(X) sends f ∈ k(y)^× to div_Y(f) = Σ_x ord_x^Y(f)·[x], Fulton's divisor of a rational function on the subvariety Y (K-book V.9.1 formula ∆(r/s) = [R/(r, p)] − [R/(s, p)]).

**Hypotheses.**

- As in S.4/coniveau-residue-differential, n = 1; λ identifies k(y)^× with its image in K_1(k(y)) (S.3/unit-loop-class).

**Proof.**

1. By S.4/coniveau-residue-differential the component is the boundary for O_{Y,x}, computed in degree one by S.3/unit-boundary-is-divisor: ℓ(O/a) − ℓ(O/b).
2. The sum over x is finite (f is a unit away from finitely many points of codimension one of Y), and the components identify d_1 with div_Y.

**Acceptance.**

- X = A²_k, Y = V(y) (the x-axis), f = x(x − 1) ∈ k(Y)^×: d_1(f) = [0] + [(1, 0)].
- Y the cusp y² = x³, f = x: ord_0^Y(x) = ℓ(k[t², t³]_{(t², t³)}/(t²)) = 2.

**Depends on.** this roadmap: `S.4/coniveau-residue-differential`, `S.3/unit-boundary-is-divisor`, `S.3/unit-loop-class`; libraries: `mathlib:Ring.ordFrac`, `mathlib:AlgebraicGeometry.Scheme.ord`, `mathlib:AlgebraicGeometry.AlgebraicCycle`.

**Sources.**

- `Kbook.2013`, V.9.1 (PDF p. 443): “Here Di(R) is the free abelian group on the height i primes, and ∆sends r/s ∈k(p)× to [R/(r, p)] −[R/(s, p)] by Example 6.1.2.” — The formula.
- `Quillen.1973`, Proof of Proposition 5.14, (5.15) (printed p. 127): “where ord_{yx}: k(y)* → Z is the unique homomorphism such that ord_{yx}(f) = length(O_{Y,x}/fO_{Y,x}) for f ∈ O_{Y,x}, f ≠ 0.” — The length order (scan text normalised).

### The composite of two residue maps vanishes

`S.4/residue-composite-vanishes` · theorem

Let X be a noetherian scheme of finite Krull dimension. Then d_1 ∘ d_1 = 0 on the first page of the coniveau spectral sequence: for every n and p the composite ⊕_{codim y = p} K_n(k(y)) → ⊕_{codim z = p+1} K_{n−1}(k(z)) → ⊕_{codim x = p+2} K_{n−2}(k(x)) of residue maps is zero. In particular, if X is a regular integral scheme of dimension two with function field F (for example a regular arithmetic surface 𝓧), then for every α ∈ K_2(F) and every closed point x, Σ_{D ∋ x} ord_x^D(∂_D(α)) = 0, where D runs over the codimension-one points whose closure contains x, ∂_D: K_2(F) → k(D)^× is the DVR boundary of O_{X,D} and ord_x^D the length order on D at x: the composite K_2(F) → ⊕_D k(D)^× → ⊕_x ℤ is zero (the Gersten complex in low degrees).

**Hypotheses.**

- X noetherian of finite Krull dimension; for the displayed form, X regular integral of dimension 2 (so each O_{X,D} is a DVR).

**Proof.**

1. d_1 is the differential of the E_1 page of the spectral sequence of an exact couple (S.4/g-coniveau-spectral-sequence), so d_1 ∘ d_1 = 0 (it factors through two consecutive maps of the long exact sequence of K(M^{p+1}/M^{p+3}), K-book (9.4)).
2. Identify the components: d_1 from p = 0 to p = 1 on K_2 is ⊕_D ∂_D (S.4/coniveau-residue-differential, O_{X,D} a DVR since X is regular), and d_1 from p = 1 to p = 2 on K_1 is ⊕ ord_x^D (S.4/coniveau-weight-one-differential).
3. For X regular the E_1 page computes K-theory (S.4/k-coniveau-first-page-regular), so the statement concerns K_2(F) for the function field.

**Acceptance.**

- X = A²_k and α = λ(x)·λ(y): ∂_{V(x)}(α) = λ(ȳ) (ȳ the restriction of y to the line x = 0) and ∂_{V(y)}(α) = −λ(x̄) (S.3/dvr-boundary-on-unit-products), and at the origin ord_0(ȳ) − ord_0(x̄) = 1 − 1 = 0.
- The vanishing is what EllipticRegulators ER.6 and EllipticKTheory E.6/vertical-residues request.

**Depends on.** this roadmap: `S.4/g-coniveau-spectral-sequence`, `S.4/coniveau-residue-differential`, `S.4/coniveau-weight-one-differential`, `S.4/k-coniveau-first-page-regular`.

**Sources.**

- `Kbook.2013`, Proof of Proposition V.9.2 (PDF p. 444): “Setting Dp,q 1 = ⊕iK−p−qMi(R), the localization sequences ( 9.1) yield an exact couple (D1, E1).” — The exact couple whose E_1 differential squares to zero.
- `Kbook.2013`, Proposition V.9.2, the E1 page (PDF p. 444): “Z 0 F × →D1(R) 0 K2(F) →⊕k(x1)× →D2(R) 0 K3(F) →⊕K2(x1) →⊕k(x2)× →D3(R)” — The low-degree rows, including K_2(F) → ⊕ k(x_1)^× → D^2(R) (rendered: the rows of the E_1 page).

### The diagonal of the second page is the Chow group

`S.4/coniveau-chow-group` · lemma

Let X be a noetherian scheme of finite Krull dimension. Then E_2^{p,−p} of the coniveau spectral sequence is CH^p(X) := Z^p(X)/R^p(X), where Z^p(X) is the free abelian group on points of codimension p (Mathlib's AlgebraicCycle, codimension-p part) and R^p(X) is generated by div_Y(f) = Σ_x ord_x^Y(f)[x] for Y the closure of a point of codimension p − 1 and f ∈ k(Y)^× (K-book Lemma V.9.1.1, Proposition V.9.5; Fulton's rational equivalence in the form of divisors of rational functions on subvarieties). For X of finite type over a field this is Fulton's Chow group of codimension-p cycles (K-book Lemma V.9.4.1, whose comparison with the X × P¹ definition is imported from SchemeAndStackFoundations SF.5). For p = 1 and X normal, CH^1(X) is the Weil divisor class group.

**Hypotheses.**

- X noetherian of finite Krull dimension (Fulton comparison: X of finite type over a field).

**Proof.**

1. E_1^{p,−p} = ⊕_{codim x = p} K_0(k(x)) = Z^p(X) and E_1^{p+1,−p} = ⊕ K_{−1}(k(x)) = 0, so E_2^{p,−p} = coker(d_1: E_1^{p−1,−p} → E_1^{p,−p}).
2. E_1^{p−1,−p} = ⊕_{codim y = p−1} K_1(k(y)) = ⊕ k(y)^× (KTheoryLowDegrees U.3/SK1-field through S.3/unit-loop-class), and d_1 is div_Y (S.4/coniveau-weight-one-differential), so the cokernel is Z^p/R^p.
3. Comparison with the X × P¹ definition of rational equivalence (Fulton Proposition 1.6, cited by K-book Lemma 9.4.1 as well known): imported from SchemeAndStackFoundations SF.5, which owns Chow groups and rational equivalence.

**Acceptance.**

- CH^1(Spec R) = Cl(R) for a Dedekind domain R (Mathlib ClassGroup).
- CH^1(P¹_k) = ℤ (generated by a rational point); CH^2(A²_k) = 0.

**Depends on.** this roadmap: `S.4/g-coniveau-spectral-sequence`, `S.4/coniveau-weight-one-differential`, `S.3/unit-loop-class`; other roadmaps: `KTheoryLowDegrees:U.3/SK1-field`, `SchemeAndStackFoundations:SF.5`; libraries: `mathlib:AlgebraicGeometry.AlgebraicCycle`, `mathlib:ClassGroup`.

**Sources.**

- `Kbook.2013`, Lemma V.9.1.1 (PDF p. 443): “CHi(R) is the quotient of Di(R) by the relations that ∆(r/s) = 0 for each r/s ∈k(p)× and each prime ideal p of height i −1.” — The presentation of CH^i.
- `Kbook.2013`, Proposition V.9.5 (PDF p. 446): “Along the line p + q = 0, we have Ep,−p 2 ∼= CHp(X).” — The identification on the second page.
- `Kbook.2013`, Lemma V.9.4.1 (PDF pp. 445-446): “Lemma 9.4.1. CHi(X) is the usual Chow group Ai(X).” — The comparison with Fulton's Chow group, whose proof in the source cites Fulton ('it is well known').

### For a one-dimensional scheme the coniveau spectral sequence is the localisation sequence

`S.4/one-dimensional-coniveau` · application

Let X be a noetherian scheme of dimension one. Its coniveau spectral sequence has two columns: E_1^{0,−n} = ⊕_η K_n(k(η)), E_1^{1,−n−1} = ⊕_{x closed} K_n(k(x)), d_1 = the residue maps ∂ of S.3/one-dimensional-localisation-sequence; hence E_2 = E_∞ and for every n there is a short exact sequence 0 → coker(∂: ⊕_η K_{n+1}(k(η)) → ⊕_x K_n(k(x))) → G_n(X) → ker(∂: ⊕_η K_n(k(η)) → ⊕_x K_{n−1}(k(x))) → 0, whose maps are those of the localisation sequence, with F^1G_n(X) = im(⊕_x (i_x)_*: ⊕_x K_n(k(x)) → G_n(X)). For X regular (a regular curve), G = K. This is the curve case used directly, without Gersten's conjecture: the exact couple is the single localisation sequence of M^1 ⊆ M^0.

**Hypotheses.**

- X noetherian of dimension ≤ 1.

**Proof.**

1. M^1(X) = Coh_0(X) (finite-length sheaves) and M^2 = 0, so the exact couple is the long exact sequence of K(Coh_0) → G(X) → K(Coh(X)/Coh_0) (S.4/g-coniveau-spectral-sequence), which is S.3/one-dimensional-localisation-sequence.
2. A two-column spectral sequence degenerates at E_2, and the filtration 0 ⊆ F^1 ⊆ F^0 = G_n gives the short exact sequences.

**Acceptance.**

- X = A¹_k: F^1G_n(A¹) = 0 (the transfers from points vanish: K-book V.3.6.1), so G_n(A¹) ≅ ker ∂ on K_n(k(t)).
- X a proper curve with a rational point P: F^1K_n(X) ⊇ P_*K_n(F) ≠ 0 in general (EllipticKTheory E.4/the-coniveau-spectral-sequence-of-a-curve, which imports this node).

**Depends on.** this roadmap: `S.4/g-coniveau-spectral-sequence`, `S.3/one-dimensional-localisation-sequence`, `S.3/cartan-localisation-comparison`.

**Sources.**

- `Kbook.2013`, V.9 introduction (PDF p. 443): “The prototype of the extension problem is illustrated by the exact sequences in 6.6 and 6.12, for Dedekind domains and smooth curves.” — The one-dimensional case as the prototype of the coniveau spectral sequence.
- `Kbook.2013`, Smooth Curves 6.12 (PDF p. 424): “In this case, the Localization sequence ( 5.1.1) becomes: · · · →Kn+1(F) ∂ −→⊕x Kn(k(x)) ⊕(ix)∗> Gn(X) →Kn(F) ∂ −→· · · .” — The localisation sequence of a curve, which the two-column spectral sequence reproduces.

### For regular schemes the K-theory coniveau is Quillen's coniveau

`S.4/k-coniveau-first-page-regular` · comparison

Let X be a regular noetherian scheme of finite Krull dimension. The Cartan maps with supports give an equivalence of towers S^pK(X) ≃ K(M^p(X)) (S.4/codimension-support-filtration against S.4/coherent-codimension-filtration), with layers K(Spec O_{X,x} on x) ≃ K(k(x)); hence the K-theoretic coniveau spectral sequence of S.4/k-coniveau-spectral-sequence is isomorphic, from E_1 on, to Quillen's G-theoretic one (S.4/g-coniveau-spectral-sequence), and its first page is ⊕_{codim x = p} K_{−p−q}(k(x)). This is the identification 'wherever dévissage applies'; it fails for singular X, where K(O_{X,x} on x) ≠ K(k(x)) in general.

**Hypotheses.**

- X regular noetherian of finite Krull dimension.

**Proof.**

1. For each closed Z' of codimension ≥ p, S.3/cartan-localisation-comparison gives K(X on Z') ≃ G(Z') ≃ K(Coh_{Z'}(X)) compatibly with enlargement of supports; taking colimits, S^pK(X) ≃ colim K(Coh_{Z'}(X)) ≃ K(M^p(X)) (GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits).
2. On layers, O_{X,x} is regular local, so K(Spec O_{X,x} on x) ≃ K(k(x)) (S.3/regular-support-devissage), matching S.4/coniveau-quotient-decomposition.
3. An equivalence of towers induces an isomorphism of exact couples and of spectral sequences.

**Acceptance.**

- X = Spec O (a DVR): both spectral sequences are the DVR sequence.
- X = A²_k ∪ (a node) is excluded: at the node the local term K(O on x) has K_{−1} ≅ ℤ ≠ K_{−1}(k) = 0.

**Depends on.** this roadmap: `S.4/k-coniveau-spectral-sequence`, `S.4/g-coniveau-spectral-sequence`, `S.4/codimension-support-filtration`, `S.4/coherent-codimension-filtration`, `S.4/coniveau-quotient-decomposition`, `S.3/cartan-localisation-comparison`, `S.3/regular-support-devissage`; other roadmaps: `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`.

**Sources.**

- `Kbook.2013`, Example V.10.12 (PDF p. 457): “This assertion holds more generally if X is regular and the Gersten-Quillen Conjecture 9.3 holds for the local rings of X.” — The regular setting in which the K-theory and G-theory spectral sequences are identified (the sentence refers to the descent spectral sequence; see S.4/descent-coniveau-e2-comparison).
- `ThomasonTrobaugh.1990`, Remark 10.6 (p. 386): “The analog of 10.3 for G-theory of noetherian schemes, and hence for K-theory of regular noetherian schemes is due to Brown and Gersten [BG] using Quillen's Localization Theorem for G-theory.” — K = G for regular schemes transports the G-theory constructions (scan text normalised).

### The Gersten–Quillen condition

`S.4/gersten-quillen-property` · definition

A noetherian scheme X of finite Krull dimension (in particular Spec R for a noetherian ring R) satisfies the Gersten–Quillen condition if for every p ≥ 0 the inclusion M^{p+1}(X) ⊆ M^p(X) (S.4/coherent-codimension-filtration) induces the zero map K_n(M^{p+1}(X)) → K_n(M^p(X)) for every n (Quillen 5.6(i), K-book V.9.3). Gersten's conjecture asserts it for every regular local ring, and Quillen's extension for every regular semilocal ring (Quillen 5.10, K-book Conjecture V.9.3). It is proved in the cases of S.4/quillen-gersten-theorem, S.4/gersten-power-series, S.4/gersten-dvr-equicharacteristic and S.4/panin-equicharacteristic-gersten (cited), and reduced in mixed characteristic to the DVR case for rings smooth over a DVR (S.4/mixed-char-gersten-from-dvr); it is not asserted for general mixed-characteristic regular local rings.

**Hypotheses.**

- X noetherian of finite Krull dimension; K-theory of the abelian categories M^p(X) (Quillen).

**Proof.**

1. The condition is a statement about the maps of K-groups induced by the exact inclusion functors, i.e. about the D_1-maps of the exact couple of S.4/g-coniveau-spectral-sequence.
2. Equivalent reformulations are S.4/gersten-conditions-equivalent.

**API.**

- `GerstenQuillen` (data): GerstenQuillen X : Prop := ∀ p n, K_n(M^{p+1}X) → K_n(M^pX) is zero.
- `GerstenQuillen.iff_exact` (characterisation): GerstenQuillen (Spec R) iff the Gersten complex 0 → K_n(R) → K_n(F) → ⊕_{ht 1} K_{n−1}(k(p)) → ⋯ is exact for R a regular semilocal domain (S.4/gersten-conditions-equivalent).
- `GerstenQuillen.of_colimit` (relation): Stable under filtered colimits of noetherian rings along flat maps with noetherian colimit (S.4/coniveau-flat-functoriality).
- `GerstenQuillen.field` (simp): GerstenQuillen (Spec k) for every field k.
- `GerstenQuillen.injective` (relation): GerstenQuillen (Spec R) implies K_n(R) → K_n(F) injective for a regular semilocal domain R (with K = G).

**Unit tests.**

- `GerstenQuillen.field` (degenerate): Spec k satisfies the condition: M^1(k) = 0.
- `GerstenQuillen.dvr_Fp_t` (computation): R = 𝔽_p[t]_(t): the condition holds, and 0 → K_2(R) → K_2(𝔽_p(t)) → 𝔽_p^× → 0 is exact (S.4/gersten-dvr-equicharacteristic).
- `GerstenQuillen.singular_fails` (non-example): R the local ring of ℝ + xℂ[x] at (x, ix) (not regular): G_0(R) ≅ ℤ ⊕ ℤ/2 (K-book Ex. V.6.1), so K_0(M^1(R)) → K_0(M^0(R)) = G_0(R) is nonzero and the condition fails.
- `GerstenQuillen.injective_K1` (compatibility): For R regular local, the condition gives K_1(R) ↪ K_1(F), which under the determinant is R^× ↪ F^× (KTheoryLowDegrees U.3/SK1-local and SK1-field).

**Acceptance.**

- Spec k (k a field) satisfies it trivially (M^1 = 0).
- A DVR containing a field satisfies it (S.4/gersten-dvr-equicharacteristic).

**Used by.**

- S.4/gersten-resolution and S.4/bloch-formula: for the local rings of a regular X it makes the Gersten complex of sheaves a flasque resolution of 𝒦_n
- S.4/descent-coniveau-e2-comparison: the coniveau and descent spectral sequences agree from E_2 on
- SchemeKTheoryOperations S.7 (Gillet–Soulé comparison of filtrations): used for regular schemes of finite type over a field
- EllipticKTheory E.6, Polylogarithms P.5: exactness of the Gersten complex in low degrees

**Depends on.** this roadmap: `S.4/coherent-codimension-filtration`, `S.4/g-coniveau-spectral-sequence`.

**Sources.**

- `Kbook.2013`, Gersten-Quillen Conjecture 9.3 (PDF p. 444): “Gersten-Quillen Conjecture 9.3. If R is a semilocal regular ring, the maps KnMi+1(R) →KnMi(R) are zero for every n and i.” — The conjecture; the node's predicate is its conclusion.
- `Mochizuki.2016`, §1, Conjecture 1.4 (p. 2): “Conjecture 1.4 (Gersten’s conjecture). The conditions above are true for any commutative regular local ring.” — The conjecture in the local form, with the survey's list of proved cases.

### Equivalent forms of the Gersten–Quillen condition

`S.4/gersten-conditions-equivalent` · lemma

For a noetherian scheme X of finite Krull dimension the following are equivalent (Quillen 5.6): (i) X satisfies the Gersten–Quillen condition; (ii) E_2^{p,q} = 0 for p ≠ 0 in the coniveau spectral sequence and the edge map G_n(X) → E_2^{0,−n} is an isomorphism; (iii) for every n the Gersten complex 0 → G_n(X) → ⊕_{codim x = 0} K_n(k(x)) →d_1 ⊕_{codim x = 1} K_{n−1}(k(x)) →d_1 ⋯ is exact. For R a regular semilocal domain with fraction field F this reads 0 → K_n(R) → K_n(F) → ⊕_{ht p = 1} K_{n−1}(k(p)) → ⋯ → ⊕_{ht p = i} K_{n−i}(k(p)) → ⋯ exact (K-book (9.3.1)), and the localisation sequences break into short exact sequences 0 → K_nM^i(R) → ⊕_{ht = i} K_n(k(p)) → K_{n−1}M^{i+1}(R) → 0.

**Hypotheses.**

- X noetherian of finite Krull dimension.

**Proof.**

1. (i) ⇒ short exact sequences: if K_nM^{p+1} → K_nM^p vanishes for all n, the localisation sequence of M^{p+1} ⊆ M^p breaks into 0 → K_nM^p → K_n(M^p/M^{p+1}) → K_{n−1}M^{p+1} → 0; splicing them gives the exact Gersten complex (iii), and the E_1 page is exact except in column 0, giving (ii).
2. (iii) ⇒ (i): descending induction on p using the long exact sequences (the D_1-maps are determined by the E_1 page and the abutment); Quillen: 'This follows immediately from the spectral sequence 5.5 and its construction.'
3. For regular R, G = K (S.3/cartan-localisation-comparison).

**Acceptance.**

- For a DVR the complex is 0 → K_n(O) → K_n(L) →∂_S K_{n−1}(k) → 0.
- For k[x, y]_(x,y): 0 → K_2(R) → K_2(k(x, y)) → ⊕_{ht 1} k(p)^× → ⊕ over the maximal ideal ℤ → 0 in degree two.

**Depends on.** this roadmap: `S.4/gersten-quillen-property`, `S.4/g-coniveau-spectral-sequence`, `S.3/cartan-localisation-comparison`.

**Sources.**

- `Kbook.2013`, V.9.3 (PDF p. 445): “This conjecture implies that, for R a regular semilocal domain, ( 9.1) breaks into short exact sequences 0 →KnMi(R) →⊕ht=iKn(k(p)) →Kn−1Mi+1(R) →0, which splice to yield exact sequences (with F the ﬁeld of fractions of R): 0 →Kn(R) →Kn(F) →” — The consequence (i) ⇒ (iii).
- `Mochizuki.2016`, §1, Proposition 1.3 (p. 2): “3. For any commutative regular local ring R and natural number 1 ≤p ≤dimR, the canonical inclusion M p R֒ →M p−1 R induces the zero map on K-theory” — The equivalence of the conditions as stated in the survey (item 3 of Proposition 1.3; items 1-2 are the E_2 and complex forms).

### The Gersten complex of sheaves is a flasque resolution of 𝒦_n

`S.4/gersten-resolution` · theorem

Let X be a regular noetherian scheme of finite Krull dimension whose local rings O_{X,x} all satisfy the Gersten–Quillen condition (for example X regular of finite type over a field, by S.4/quillen-gersten-theorem). Then for every n the sheafified Gersten complex 0 → 𝒦_n → ⊕_{codim x = 0} (i_x)_*K_n(k(x)) → ⊕_{codim x = 1} (i_x)_*K_{n−1}(k(x)) → ⋯ → ⊕_{codim x = p}(i_x)_*K_{n−p}(k(x)) → ⋯ is a flasque resolution of the K-sheaf 𝒦_n (S.4/k-theory-sheaves), and the E_2 page of the coniveau spectral sequence is E_2^{p,q} ≅ H^p(X, 𝒦_{−q}) (Quillen 5.8, K-book 9.8.1).

**Hypotheses.**

- X regular noetherian of finite Krull dimension; every O_{X,x} satisfies the Gersten–Quillen condition.

**Proof.**

1. The rows of the E_1 page of the coniveau spectral sequence, as presheaves U ↦ E_1(U) (S.4/coniveau-flat-functoriality for restriction to opens), sheafify to the displayed complex of sheaves; its stalk at x is the Gersten complex of O_{X,x}, because Spec O_{X,x} = lim U and the spectral sequence commutes with this limit (S.4/coniveau-flat-functoriality), and (𝒦_n)_x = K_n(O_{X,x}) (S.4/k-theory-sheaves; K = G on regular X).
2. By hypothesis and S.4/gersten-conditions-equivalent each stalk complex is exact, so the sheaf complex is exact.
3. Each (i_x)_*A is a skyscraper sheaf, flasque (Tau Ceti isFlasque_skyscraperSheaf); a direct sum of flasque sheaves on a noetherian space is flasque; so the complex is a flasque resolution, and flasque sheaves are acyclic (Tau Ceti subsingleton_H_succ_of_isFlasque), so H^p(X, 𝒦_n) is the cohomology of its global sections, the (−n)-th row of E_1; hence E_2^{p,−n} ≅ H^p(X, 𝒦_n).

**Acceptance.**

- For X = A¹_k: 0 → 𝒦_n → K_n(k(t)) → ⊕_x (i_x)_*K_{n−1}(k(x)) → 0, H^0(A¹, 𝒦_n) = K_n(k) (S.4/gersten-dvr-equicharacteristic on the local rings) and H^1(A¹, 𝒦_n) = 0.
- For X = P¹_k: H^0(P¹, 𝒦_n) ≅ K_n(k) and H^1(P¹, 𝒦_n) ≅ K_{n−1}(k) (K-book Example V.9.8.2).

**Depends on.** this roadmap: `S.4/g-coniveau-spectral-sequence`, `S.4/gersten-conditions-equivalent`, `S.4/gersten-quillen-property`, `S.4/coniveau-flat-functoriality`, `S.4/k-theory-sheaves`; libraries: `mathlib:skyscraperSheaf`, `mathlib:TopCat.Presheaf.IsFlasque`, `tauceti:TauCeti.Topology.isFlasque_skyscraperSheaf`, `tauceti:TauCeti.Topology.subsingleton_H_succ_of_isFlasque`, `mathlib:CategoryTheory.Sheaf.H`.

**Sources.**

- `Kbook.2013`, Proposition V.9.8.1 (PDF p. 449): “Assume that X is a regular quasi-projective scheme, or more generally that the Gersten-Quillen conjecture 9.3 holds for the local rings of X. Then ( 9.8) is a ﬂasque resolution of Kn, and the E2 page of the coniveau spectral sequence ( 9.5) is Ep,q 2 ∼= Hp(X, K−q).” — The statement (the K-book's first hypothesis 'regular quasi-projective' should be read with 'over a field', where Quillen's theorem applies).
- `Kbook.2013`, V.9.8 (PDF p. 449): “Since each (iy)∗Kn(y) is a ﬂasque sheaf, ( 9.8) is a ﬂasque resolution of the sheaf Kn.” — Flasqueness of the terms.

### Bloch's formula

`S.4/bloch-formula` · theorem · planet “Bloch's formula”

Let X be a regular scheme of finite type over a field (more generally a regular noetherian scheme of finite Krull dimension whose local rings satisfy the Gersten–Quillen condition). Then H^p(X, 𝒦_p) ≅ CH^p(X) for all p ≥ 0, where 𝒦_p is the Zariski K-sheaf (S.4/k-theory-sheaves) and CH^p(X) = Z^p(X)/rational equivalence (S.4/coniveau-chow-group) (Quillen 5.19; K-book 9.8.1). For p = 0 and 1 this is H^0(X, ℤ) = CH^0(X) and H^1(X, O_X^×) = Pic(X) = CH^1(X).

**Hypotheses.**

- X regular of finite type over a field (then all local rings satisfy the condition by S.4/quillen-gersten-theorem), or X regular noetherian of finite dimension with Gersten local rings.

**Proof.**

1. S.4/gersten-resolution: H^p(X, 𝒦_p) ≅ E_2^{p,−p}.
2. S.4/coniveau-chow-group: E_2^{p,−p} ≅ CH^p(X).
3. For X of finite type over a field the hypothesis is S.4/quillen-gersten-theorem applied to the local rings O_{X,x} (semilocal localisations of finite-type algebras at regular primes).
4. p = 1: 𝒦_1 ⊇ O^× with 𝒦_1 = O^× on regular (local) stalks via the determinant, giving H^1(X, O^×) = Pic(X) (KTheoryLowDegrees U.3/SK1-local; the identification of π_1K with the classical K_1 is KTheoryLowDegrees U.6's).

**Acceptance.**

- X = P²_k: H^2(P², 𝒦_2) ≅ CH^2(P²) = ℤ (a point).
- X = A^n_k: H^p(A^n, 𝒦_p) = CH^p(A^n) = 0 for p ≥ 1.
- X a smooth projective surface: H^2(X, 𝒦_2) = CH^2(X) = CH_0(X), Bloch's original case.

**Depends on.** this roadmap: `S.4/gersten-resolution`, `S.4/coniveau-chow-group`, `S.4/quillen-gersten-theorem`, `S.4/k-theory-sheaves`; other roadmaps: `KTheoryLowDegrees:U.3/SK1-local`.

**Sources.**

- `Kbook.2013`, Proposition V.9.8.1 (PDF p. 449): “In addition, we have Hp(X, Kp) ∼= CHp(X) for all p > 0.” — The formula.
- `Kbook.2013`, V.9.8.1 (PDF p. 449): “The isomorphism Hp(X, Kp) ∼= CHp(X) is often referred to as Bloch’s for- mula, since it was ﬁrst discovered for p = 2 by Spencer Bloch in Bl74 [24].” — The name.
- `Quillen.1973`, §7, Theorem 5.19 (printed p. 129): “For a regular scheme X of finite type over a field, there is a canonical isomorphism” — Quillen's statement (the displayed formula H^p(X, K_p) ≅ A^p(X) is lost in the scan).

### Quillen's normalisation lemma

`S.4/quillen-presentation-lemma` · lemma

Let R be a smooth finite-type algebra of dimension r over a field k, t ∈ R a regular element and S ⊆ Spec R a finite set. Then there are x_1, …, x_{r−1} ∈ R, algebraically independent over k, such that for B = k[x_1, …, x_{r−1}] ⊆ R: (i) R/tR is finite over B, and (ii) R is smooth over B at the points of S (Quillen Lemma 5.12; K-book Lemma V.9.6.2 states it for infinite k in the form: a projection Spec R → A^{r−1} finite on V(t) and smooth at S).

**Hypotheses.**

- k a field (Quillen); the K-book restricts to infinite k and treats finite fields in S.4/quillen-effacement by a transfer argument, which is then not needed.
- R smooth of dimension r over k; t regular; S finite (replace each prime by a maximal ideal containing it).

**Proof.**

1. Let J be the intersection of the maximal ideals in S; R/J^n is finite-dimensional, so there is a finite-dimensional k-subspace V ⊆ R generating R as a k-algebra such that at each m ∈ S some v_1, …, v_r ∈ V have differentials forming a basis of Ω_{R/k} at m (Ω_{R/k} projective of rank r) and vanishing at the other points of S.
2. Filter R/tR by F_n = span of monomials of degree ≤ n in V; gr(R/tR) has dimension r − 1 (Proj of the Rees ring is the closure of Spec R/tR in projective space, and its part at infinity has dimension r − 2).
3. Choose a homogeneous system of parameters z_1, …, z_{r−1} of gr(R/tR) with each z_i of degree ≥ 2 (graded Noether normalisation) and lift them to x'_i ∈ R; then R/tR is finite over k[x'_1, …, x'_{r−1}].
4. Perturb by degree-one elements: by the choice of V, pick v_i ∈ V with x_i = x'_i + v_i having independent differentials dx_1, …, dx_{r−1} at the points of S; since deg z_i ≥ 2 the leading terms are unchanged, so finiteness persists, and independence of differentials is smoothness of R over B at S.

**Acceptance.**

- R = k[u, w] (r = 2), t = u² − w³, S = {origin}: x_1 = u + w works for k of characteristic 0 (R/tR = k[u, w]/(u² − w³) is finite over k[u + w] and R is smooth over k[u + w] everywhere).
- For r = 1, B = k and the lemma says R/tR is finite over k, which holds as dim R/tR = 0.

**Depends on.** libraries: `mathlib:Algebra.Smooth`, `mathlib:ringKrullDim`, `mathlib:IsLocalRing`.

**Sources.**

- `Quillen.1973`, §7, Lemma 5.12 (printed p. 125): “Then there exist elements x1,…,xr−1 of R algebraically independent over k such that if B = k[x1,…,xr−1] ⊂ R, then i) R/tR is finite over B, and ii) R is smooth over B at the points of S.” — The conclusion, for R smooth of dimension r over a field k, t regular and S ⊆ Spec R finite (scan text normalised).
- `Kbook.2013`, Lemma V.9.6.2 (PDF p. 447): “Suppose that X = Spec(R), for a ﬁnitely generated ring R over an inﬁnite ﬁeld k. If Z ⊂X is closed of dimension r and T ⊂X is a ﬁnite set of closed points, then there is a projection X →Spec(k[t1, ..., tr]) which is ﬁnite on Z and smooth at each point of T.” — The K-book's form, restricted to infinite fields, with its proof referred to Quillen 5.12.

### Quillen's effacement: supports in a divisor die after localisation

`S.4/quillen-effacement` · lemma

Let R be a smooth domain of finite type over a field k and S ⊆ R a multiplicative set with S^{-1}R semilocal. For every t ∈ R ∖ ({0} ∪ S) there is s ∈ S such that for every i the exact functor M^i(R/tR) → M^i(R[1/s]), N ↦ N[1/s] (N viewed as an R-module; codimensions in R/tR shifted into R), induces the zero map on K-groups (K-book Proposition V.9.6.1, Quillen proof of 5.11).

**Hypotheses.**

- R smooth domain of finite type over k; S^{-1}R semilocal; t ≠ 0, t ∉ S.

**Proof.**

1. Retraction case: if R contains a subring B mapping isomorphically onto R/tR and R is smooth over B, the kernel I of R → R/tR is locally principal near S (over a field the smooth curve case is Dedekind), so choose s ∈ S with I[1/s] ≅ R[1/s]; for a B-module N the characteristic sequence 0 → I[1/s] ⊗_B N → R[1/s] ⊗_B N → N[1/s] → 0 is an exact sequence of exact functors M^i(B) → M^i(R[1/s]) (R flat over B) whose first two terms are isomorphic, so Additivity (GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories) gives zero on K.
2. By S.4/quillen-presentation-lemma choose A = k[x_1, …, x_{r−1}] ⊆ R with B = R/tR finite over A and R smooth over A at the primes not meeting S; set R' = R ⊗_A B; then R'/R is finite, S^{-1}R' semilocal, R' smooth over B near S and B ⊆ R' is a retraction of R' → R'/(t ⊗ 1) ≅ B, so for suitable s, M^i(B) → M^i(R[1/s]) factors through M^i(R'[1/s]) where the first map is zero by the retraction case.
3. (The K-book states the presentation lemma only for infinite k and adds this step for finite k.) For a prime p let k'' be the infinite p-primary algebraic extension; the result over R ⊗_k k'' gives a finite k' with [k' : k] = p^r and x·p^r ↦ 0 over R ⊗_k k'; the transfer K M^i(R ⊗_k k') → K M^i(R) composed with base change is multiplication by p^r (projection formula for the finite flat R → R ⊗_k k', SchemeKTheoryOperations S.2/projection-formula), so the image of x is p-power torsion for every p, hence zero.

**Acceptance.**

- R = k[u], t = u: B = k ⊆ k[u] maps isomorphically onto R/uR, R is smooth over B and I = uR ≅ R, so for every k-vector space N the sequence 0 → uR ⊗_k N → R ⊗_k N → N → 0 shows that K(k) = K M^0(R/uR) → K M^1(R) → G(R) is zero (the zero-section transfer vanishes).
- The effacement fails for singular R: at the node the local analogue of the conclusion fails (S.4/gersten-quillen-property non-example).

**Depends on.** this roadmap: `S.4/quillen-presentation-lemma`, `S.4/coherent-codimension-filtration`, `S.2/projection-formula`, `S.2/affine-pushforward-is-transfer`; other roadmaps: `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`; libraries: `mathlib:Algebra.Smooth`.

**Sources.**

- `Kbook.2013`, Proposition V.9.6.1 (PDF p. 446): “Let R be a smooth domain over a ﬁeld and S ⊂ R a multiplicative set so that S−1R is semilocal. Then for each t̸ = 0 in R with t̸ ∈S there is an s ∈S so that each base change Mi(R/tR) →Mi(R[1/s]) induces a null-homotopic map on K-spaces.” — The statement.
- `Quillen.1973`, Proof of Theorem 5.11 (printed p. 126): “Applying Th. 2, Cor. 1, and using the isomorphism I_f ≅ R'_f, we conclude that the functor from M_p(B') to M_p(R_f) induces the zero map on K-groups” — Quillen's additivity step (scan text normalised).

### Quillen's theorem: Gersten's conjecture for semilocal rings of algebras over a field

`S.4/quillen-gersten-theorem` · theorem · planet “Quillen's Gersten theorem”

Let R be a finite-type algebra over a field k, S a finite set of primes of R such that R_p is regular for every p ∈ S, and A the regular semilocal ring obtained by localising R at S. Then Spec A satisfies the Gersten–Quillen condition: K_n M^{i+1}(A) → K_n M^i(A) is zero for all n, i (Quillen 5.11, K-book 9.6). Consequently the Gersten complex 0 → K_n(A) → K_n(F) → ⊕_{ht 1} K_{n−1}(k(p)) → ⋯ is exact, and it is even pure exact (K-book Corollary V.9.6.4, Grayson).

**Hypotheses.**

- R of finite type over a field k; S finite with R_p regular for p ∈ S; A = S^{-1}R semilocal (in particular any local ring of a regular scheme of finite type over a field).

**Proof.**

1. Reduce to R smooth over k: A is a filtered colimit of k_j ⊗_{k'} A' over finitely generated subfields k' ⊆ k_j ⊆ k, with A' a semilocal localisation of a finite-type k'-algebra and each k_j ⊗ A' regular; S.4/coniveau-flat-functoriality commutes the condition with the colimit, so assume k finitely generated over the prime field, then (changing R) k the prime field, which is perfect, so R is smooth at S and after inverting some f ∉ S smooth over k.
2. M^{i+1}(A) = colim_{s∈S} M^{i+1}(R[1/s]) = colim_{s, t} M^i(R[1/s]/tR[1/s]) over nonzerodivisors t (a module of support codimension ≥ i+1 is killed by some t and has codimension ≥ i over R/tR) (S.4/coniveau-flat-functoriality).
3. For each t, S.4/quillen-effacement gives s with M^i(R/tR) → M^i(R[1/s]) zero on K, hence the colimit map K M^{i+1}(A) → K M^i(A) is zero.
4. Pure exactness: the null-homotopies split the fibre sequences, and filtered colimits of pure exact sequences are pure exact (K-book 9.6.3-9.6.4).

**Acceptance.**

- A = k[x_1, …, x_n]_(x_1, …, x_n): the Gersten complex of K_n is exact; in degree one 0 → A^× → F^× → ⊕_{ht 1} ℤ → ⊕_{ht 2} 0 recovers the fact that A is a UFD (divisors of height one are principal).
- K_n(A) → K_n(F) is injective for every regular local A essentially of finite type over a field.

**Depends on.** this roadmap: `S.4/quillen-effacement`, `S.4/gersten-quillen-property`, `S.4/gersten-conditions-equivalent`, `S.4/coniveau-flat-functoriality`, `S.4/coherent-codimension-filtration`; libraries: `mathlib:Algebra.Smooth`.

**Sources.**

- `Kbook.2013`, Theorem V.9.6 (PDF p. 446): “Theorem 9.6. (Quillen) Let R be an algebra of ﬁnite type over a ﬁeld, and let A = S−1R be the semilocal ring of R at a ﬁnite set of prime ideals. Then Conjecture 9.3 holds for A: for each i the map KMi+1(A) →KMi(A) is zero.” — The K-book's statement (the regularity of A at the primes of S is implicit in 'Conjecture 9.3 holds for A', which concerns regular rings).
- `Quillen.1973`, §7, Theorem 5.11 (printed p. 125): “Let R be a finite type algebra over a field k, let S be a finite set of primes in R such that R_p is regular for each p in S, and let A be the regular semi-local ring obtained by localizing R with respect to S. Then Spec A satisfies the conditions of 5.6.” — Quillen's statement (scan text normalised).

### Gersten's conjecture for power series rings over a field

`S.4/gersten-power-series` · theorem

The Gersten–Quillen condition holds for A = k[[x_1, …, x_n]] over a field k, and for the ring of convergent power series in x_1, …, x_n over a field complete for a nontrivial absolute value (Quillen 5.13, K-book Ex. V.9.2).

**Hypotheses.**

- k a field (complete valued for the convergent case).

**Proof.**

1. For 0 ≠ t ∈ A, after a linear change of coordinates t is x_n-regular and, by the Weierstrass preparation theorem, A/tA is finite over B = k[[x_1, …, x_{n−1}]] (the source: 'the proof is analogous to the preceding').
2. With A' = A ⊗̂_B (A/tA), Ker(A' → A/tA) is principal, so the retraction argument of S.4/quillen-effacement shows M^p(A/tA) → M^p(A) is zero on K for every p.
3. M^{p+1}(A) is the union of the M^p(A/tA), so the condition follows as in S.4/quillen-gersten-theorem.
4. The Weierstrass preparation theorem in n variables and the completed tensor product are not supplied by the sources read (gap).

**Acceptance.**

- A = k[[x]] (a complete DVR containing its residue field): 0 → K_n(A) → K_n(k((x))) → K_{n−1}(k) → 0 (compare S.4/gersten-dvr-split).
- A = ℂ{x, y} (convergent power series): the Gersten complex is exact.

**Depends on.** this roadmap: `S.4/quillen-effacement`, `S.4/gersten-quillen-property`, `S.4/quillen-gersten-theorem`, `S.4/coniveau-flat-functoriality`.

**Sources.**

- `Quillen.1973`, §7, Theorem 5.13 (printed p. 127): “The conditions of 5.6 hold for Spec A when A is the ring of formal power series k[[X1,…,Xn]] over a field k, and when A is the ring of convergent power series in X1,…,Xn with coefficients in a field complete with respect to a non-trivial valuation.” — The statement (scan text normalised).
- `Kbook.2013`, Exercise V.9.2 (PDF p. 450): “(Quillen) Let R = k[[x1, ..., xn]] be a power series ring over a ﬁeld. Modify the proof of Theorem 9.6 to show that the maps KMi+1(R) →KMi(R) are zero, so that ( 9.3.1) is exact.” — The K-book's form (an exercise).

### Panin's theorem: Gersten's conjecture for regular local rings containing a field

`S.4/panin-equicharacteristic-gersten` · theorem

Let R be a regular local (or semilocal) ring containing a field. Then R satisfies the Gersten–Quillen condition, so 0 → K_n(R) → K_n(F) → ⊕_{ht 1} K_{n−1}(k(p)) → ⋯ is exact (Panin, 'The equi-characteristic case of the Gersten conjecture', Proc. Steklov Inst. Math. 241 (2003) 154–163; cited, not read).

**Hypotheses.**

- R regular (semi)local, equicharacteristic (containing a field).

**Proof.**

1. Reported route (Panin 2003 was not accessible; the survey read describes it): by Popescu's general Néron desingularisation R is a filtered colimit of smooth algebras over its prime field; localise to semilocal rings of finite type over a field; apply S.4/quillen-gersten-theorem and pass to the colimit (S.4/coniveau-flat-functoriality).
2. Popescu's theorem and Panin's handling of the colimit (the transition maps need not be flat, so the flat-colimit form of the coniveau spectral sequence does not apply directly) are not in any source read: recorded as a gap; the node is cited, not proved here.

**Acceptance.**

- R = k[[x, y]] is covered both by S.4/gersten-power-series and by this theorem.
- R = ℤ_(p)[x] localised at (p, x) is not covered: it contains no field.

**Depends on.** this roadmap: `S.4/quillen-gersten-theorem`, `S.4/gersten-quillen-property`, `S.4/coniveau-flat-functoriality`.

**Sources.**

- `Mochizuki.2016`, §1, Historical Note (p. 2): “If A is of equi-characteristic, then Gersten’s conjecture for A is true. We refer to [Qui73] for special cases, and the general cases [Pan03] can be deduced from limit argu- ment and Popescu’s general N´eron desingularization [Pop86].” — The statement and its reported proof route; Panin 2003 itself was not read.

### Gersten's conjecture for a DVR containing a field over which the residue field is finite

`S.4/gersten-dvr-split` · theorem

Let O be a DVR with fraction field F, residue field k and parameter s, containing a field k_0 with [k : k_0] < ∞. Then i_* = 0 in the localisation sequence and it breaks into split short exact sequences 0 → K_n(O) → K_n(F) →∂_S K_{n−1}(k) → 0; the canonical map K_n(O) → K_n(k) factors through the specialisation λ_s (K-book Theorem V.6.7).

**Hypotheses.**

- O a DVR containing a field k_0 with [k : k_0] finite.

**Proof.**

1. If k ⊆ O (a coefficient field), K_*(k) → K_*(O) makes the sequence one of K_*(k)-modules, and a ↦ λ(s)·a (a ∈ K_{n−1}(k) via k ⊆ O ⊆ F) satisfies ∂_S(λ(s)·a) = ∂_S(λ(s))·ā = [k]·a = a (S.3/boundary-module-linearity, S.3/dvr-boundary-unit-valuation, k → O → k the identity): ∂_S is split surjective, hence i_* = 0.
2. In general choose a finite extension F'/F whose integral closure O' contains k and a maximal ideal p = tO' with O'/p ≅ k lying over the closed point (asserted in the source; recorded as a gap); by the first case the boundary ∂' of O'_p is split surjective onto K_{n−1}(k), and the morphism of localisation sequences for the finite map O → O' (S.3/boundary-finite-pushforward-naturality; R'/p = k over k) shows ∂_S is split surjective.
3. The factorisation K_n(O) → K_n(k) = λ_s ∘ j^* is S.3/specialisation-of-restriction.

**Acceptance.**

- O = k[t]_(t): 0 → K_n(O) → K_n(k(t)) → K_{n−1}(k) → 0 split by a ↦ λ(t)·a.
- O = 𝔽_p[[t]]: K_2(𝔽_p((t))) ≅ K_2(𝔽_p[[t]]) ⊕ 𝔽_p^×.

**Depends on.** this roadmap: `S.3/dvr-localisation-sequence`, `S.3/dvr-boundary`, `S.3/dvr-boundary-unit-valuation`, `S.3/boundary-module-linearity`, `S.3/specialisation-of-restriction`, `S.3/boundary-finite-pushforward-naturality`, `S.3/unit-loop-class`.

**Sources.**

- `Kbook.2013`, Theorem V.6.7 (PDF p. 418): “If a discrete valuation ring R contains a ﬁeld k0, and [k : k0] is ﬁnite, then the localization sequence ( 6.6) breaks up into split exact sequences: 0 > Kn(R) > Kn(F) ∂ ←> Kn−1(k) > 0.” — The statement.
- `Kbook.2013`, Proof of Theorem V.6.7 (PDF p. 418): “Consider the map Kn(k) →Kn+1(F) sending a to {s, a}; we have ∂({s, a}) = {∂(s), a} = [k] · a = a. Hence ∂is a split surjection, and the result follows.” — The coefficient-field case.
- `Kbook.2013`, Proof of Theorem V.6.7 (PDF p. 419): “In general, there is a ﬁnite ﬁeld extension F ′ of F so that the integral closure R′ of R contains k, and R →k extends to a map R′ →k with kernel p = tR′.” — The reduction step asserted without proof.

### Gersten's conjecture for equicharacteristic discrete valuation rings

`S.4/gersten-dvr-equicharacteristic` · theorem

Let O be a DVR containing a field. Then ∂_S: K_{n+1}(F) → K_n(k) is onto for every n and the localisation sequence breaks into short exact sequences 0 → K_n(O) → K_n(F) → K_{n−1}(k) → 0 (not necessarily split); i.e. O satisfies the Gersten–Quillen condition (K-book Corollary V.6.7.2; Sherman for DVRs).

**Hypotheses.**

- O a DVR containing some field.

**Proof.**

1. O contains a field k_0 over which k is algebraic (asserted in the source: 'if R contains any field then it always contains a field k_0 so that k is algebraic over k_0'; recorded as a gap).
2. Every a ∈ K_n(k) comes from some a' ∈ K_n(k') with k' ⊆ k finite over k_0 (K commutes with filtered colimits, GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits).
3. Choose a finite extension F'/F containing k' such that O → k extends to O' as in S.4/gersten-dvr-split; γ: K_n(k') → K_{n+1}(F') → K_{n+1}(F), a' ↦ N_{F'/F}(λ(t)·a'), satisfies ∂_S γ(a') = image of a' (S.3/boundary-finite-pushforward-naturality), so a = ∂_S(γ(a')).
4. Surjectivity in all degrees makes i_* = 0; this is the Gersten–Quillen condition for dim O = 1 (S.4/gersten-conditions-equivalent).

**Acceptance.**

- O = ℚ[t]_(t) ⊆ ℚ(t) and the residue field ℚ: 0 → K_2(O) → K_2(ℚ(t)) → ℚ^× → 0.
- Mixed-characteristic DVRs such as ℤ_(p) are not covered, since they contain no field; see S.4/mixed-char-gersten-from-dvr.

**Depends on.** this roadmap: `S.4/gersten-dvr-split`, `S.4/gersten-conditions-equivalent`, `S.3/boundary-finite-pushforward-naturality`, `S.3/dvr-localisation-sequence`; other roadmaps: `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`.

**Sources.**

- `Kbook.2013`, Corollary V.6.7.2 (PDF p. 419): “If a discrete valuation ring R contains a ﬁeld k0, then each Kn+1(F) ∂ −→Kn(k) is onto, and the localization sequence ( 6.6) breaks up into short exact sequences. (The sequences may not split.)” — The statement.
- `Kbook.2013`, Gersten's DVR Conjecture 6.9 (PDF p. 421): “This conjecture is known for n = 0, 1, 2 (see 6.6.2), when char(F) = char(k) ( 6.7 ﬀ) or when k is algebraic over Fp ( 6.9.2 and Ex. 6.11). It is not known in the general mixed characteristic case” — The scope: the equicharacteristic case is this node; the mixed-characteristic case is open in general.

### Gillet–Levine: the relative Gersten conjecture for smooth algebras over a DVR

`S.4/gillet-levine-smooth-over-dvr` · theorem

Let Λ be a DVR with parameter π, residue field Λ/π of characteristic p > 0 and fraction field of characteristic 0. Let A be a smooth algebra of finite type over Λ and S ⊆ A a multiplicative set with R = S^{-1}A semilocal. If t ∈ A and A/tA is flat over Λ, then every base change K M^i(A/tA) → K M^i(R) is null-homotopic (Gillet–Levine, J. Pure Appl. Algebra 46 (1987) 59–71; K-book Theorem V.9.7; cited, not read).

**Hypotheses.**

- Λ a mixed-characteristic DVR; A smooth of finite type over Λ; R = S^{-1}A semilocal; t with A/tA flat over Λ.

**Proof.**

1. The source refers to Gillet–Levine for the proof ('we refer the reader to GiL [69] for the proof'); the paper was not accessible (Elsevier refused the download), so the statement is imported as cited and recorded as a gap.
2. The expected route, by analogy with S.4/quillen-effacement: a relative presentation lemma over Λ making A/tA finite over a smooth Λ-algebra B with A smooth over B near S, followed by the retraction argument; this is not verified here.

**Acceptance.**

- A = Λ[x], t = x − π: A/tA ≅ Λ is flat over Λ, and the theorem gives K M^i(Λ) → K M^i(Λ[x]_S) null.
- t = π is excluded: A/πA is not flat over Λ; that direction is the DVR D = R_(πR) of S.4/mixed-char-gersten-from-dvr.

**Depends on.** this roadmap: `S.4/coherent-codimension-filtration`, `S.4/quillen-effacement`; libraries: `mathlib:Algebra.Smooth`, `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `Kbook.2013`, Theorem V.9.7 (PDF p. 448): “Theorem 9.7. Let A be a smooth algebra of ﬁnite type over Λ and S ⊂A a multiplicative set so that R = S−1A is semilocal. If t ∈A and A/tA is ﬂat over Λ then every base change KMi(A/tA) →KMi(R) is null-homotopic.” — The statement.
- `Kbook.2013`, V.9 (PDF p. 448): “In mixed characteristic, Gillet and Levine proved the following result; we refer the reader to GiL [69] for the proof.” — The source gives no proof.

### Mixed characteristic: the higher transfer maps are null

`S.4/mixed-char-higher-effacement` · lemma

Let R be a regular semilocal Λ-algebra as in S.4/gillet-levine-smooth-over-dvr (R = S^{-1}A, A smooth over the mixed-characteristic DVR Λ). Then for i ≥ 1 the map K M^{i+1}(R) → K M^i(R) is null-homotopic (K-book Corollary V.9.7.1(a)).

**Hypotheses.**

- As in S.4/gillet-levine-smooth-over-dvr; i ≥ 1.

**Proof.**

1. The set T = {t ∈ A : R/tR flat over Λ} is multiplicative, generated by the height-one primes other than πR, and T^{-1}R = D := R_(πR), a DVR whose residue field is the fraction field of R/πR.
2. For i + 1 > 1 = dim D, every module in M^{i+1}(R) vanishes over D, so it is killed by some t ∈ T: K M^{i+1}(R) = colim_{t ∈ T, s ∈ S} K M^i(A[1/s]/t) (S.4/coniveau-flat-functoriality).
3. Each K M^i(A[1/s]/t) → K M^i(R) is null by S.4/gillet-levine-smooth-over-dvr (A/tA flat over Λ), so the colimit map is null.

**Acceptance.**

- For R = Λ[x]_(π, x) (dimension 2) and i = 1: K M^2(R) → K M^1(R) is zero on K_0, i.e. the class of the residue field [R/(π, x)] vanishes in K_0 M^1(R) (since 0 → R/xR →π R/xR → R/(π, x) → 0 is exact in M^1(R)).
- For i = 0 the statement is not claimed: that is Gersten's DVR conjecture for D (S.4/mixed-char-gersten-from-dvr).

**Depends on.** this roadmap: `S.4/gillet-levine-smooth-over-dvr`, `S.4/coniveau-flat-functoriality`, `S.4/coherent-codimension-filtration`.

**Sources.**

- `Kbook.2013`, Corollary V.9.7.1(a) (PDF p. 448): “(a) For i ≥1, the transfer map KMi+1(R) →KMi(R) is null homotopic.” — The statement.
- `Kbook.2013`, V.9.7 (PDF p. 448): “Now the set T = {t ∈A : R/tR is ﬂat over Λ} is multiplicatively closed, generated by the height 1 primes other than πR. Hence the localization D = T −1R is the discrete valuation ring D = R(πR) whose residue ﬁeld is the quotient ﬁeld of R/πR.” — The DVR D used in the proof.

### Mixed characteristic: K_0 of M^i is generated by complete intersections

`S.4/mixed-char-k0-generation` · lemma

Let R be a regular semilocal Λ-algebra as in S.4/gillet-levine-smooth-over-dvr. Then each K_0 M^i(R) is generated by the classes [R/xR] with x = (x_1, …, x_i) a regular sequence of length i in R (K-book Corollary V.9.7.1(b)).

**Hypotheses.**

- As in S.4/gillet-levine-smooth-over-dvr.

**Proof.**

1. Induction on i; i = 1 from the localisation sequence R^× → Frac(R)^× →∆ K_0 M^1(R) → 0 and ∆(r/s) = [R/rR] − [R/sR] (S.3/boundary-of-a-nonzerodivisor).
2. For i > 1, S.4/mixed-char-higher-effacement gives an exact sequence ⊕_{ht p = i−1} k(p)^× →∂ K_0 M^i(R) → 0 (the next map is zero), with ∂_p(r/s) = [R/p + rR] − [R/p + sR] (K-book Ex. V.5.1).
3. It suffices to write each [R/p + rR] as a sum of [R/xR]: by induction [R/p] = Σ[R/x'R] in K_0 M^{i−1}(R) for regular sequences x' of length i − 1; by prime avoidance choose r' with p + rR = p + r'R and (x', r') regular; R/x' is Cohen–Macaulay with associated primes of height i − 1, so [R/p + rR] = Σ[R/(x', r')R] in K_0 M^i(R) (K-book Ex. II.6.16).

**Acceptance.**

- R = Λ[x]_(π, x), i = 2: K_0 M^2(R) is generated by [R/(π, x)].
- For i = 1: K_0 M^1(R) is generated by the [R/rR], r a nonzerodivisor.

**Depends on.** this roadmap: `S.4/mixed-char-higher-effacement`, `S.3/boundary-of-a-nonzerodivisor`, `S.4/coherent-codimension-filtration`.

**Sources.**

- `Kbook.2013`, Corollary V.9.7.1(b) (PDF p. 448): “(b) Each K0Mi(R) is generated by the classes [R/xR], where each x = (x1, . . . , xi) is a regular sequence in R of length i.” — The statement; the proof on PDF pp. 448-449 is reproduced.

### Mixed characteristic: the Gersten complex is exact except in two places

`S.4/mixed-char-gersten-partial-exactness` · theorem

Let R be a regular semilocal Λ-algebra as in S.4/gillet-levine-smooth-over-dvr, with fraction field E. Then the Gersten complex (9.3.1) 0 → K_n(R) → K_n(E) → ⊕_{ht 1} K_{n−1}(k(p)) → ⋯ → ⊕_{ht i} K_{n−i}(k(p)) → ⋯ is exact except possibly at K_n(R) and at ⊕_{ht 1} K_{n−1}(k(p)); and it is exact everywhere if and only if every K_n(R) → K_n(E) is injective (K-book Corollary V.9.7.1(c)).

**Hypotheses.**

- As in S.4/gillet-levine-smooth-over-dvr.

**Proof.**

1. By S.4/mixed-char-higher-effacement the localisation sequences for M^{i+1} ⊆ M^i, i ≥ 1, break into short exact sequences, which splice into the exact complex 0 → K_n M^1(R) → ⊕_{ht 1} K_{n−1}(k(p)) → ⋯.
2. Combined with the exact sequence K_n(R) → K_n(E) → K_{n−1} M^1(R) (localisation for M^1 ⊆ M^0, G = K for regular R), the Gersten complex is exact from ⊕_{ht 2} on and at K_n(E); exactness at the two remaining places is equivalent to injectivity of K_n(R) → K_n(E) (S.4/gersten-conditions-equivalent).

**Acceptance.**

- For R = Λ itself (dimension 1) the statement is empty: exactness everywhere is Gersten's DVR conjecture for Λ.
- For n = 1 the complex is exact: K_1(R) → K_1(E) is R^× ↪ E^× under the identification of K_1 of local rings with units (KTheoryLowDegrees U.3/SK1-local, with U.6's comparison of π_1 with the classical K_1).

**Depends on.** this roadmap: `S.4/mixed-char-higher-effacement`, `S.4/gersten-conditions-equivalent`, `S.3/cartan-localisation-comparison`.

**Sources.**

- `Kbook.2013`, Corollary V.9.7.1(c) (PDF p. 448): “(c) Sequence ( 9.3.1) is exact except possibly at Kn(R) and ⊕ht=1Kn−1(k(p)).” — The statement.
- `Kbook.2013`, Proof of Corollary V.9.7.1 (PDF p. 449): “It follows that ( 9.3.1) is exact for R (the Gersten-Quillen conjecture 9.3 holds for R) if and only if each Kn(R) →Kn(F) is an injection.” — The criterion.

### Mixed characteristic: Gersten for smooth algebras over a DVR reduces to the DVR

`S.4/mixed-char-gersten-from-dvr` · theorem

Let R be a regular semilocal Λ-algebra as in S.4/gillet-levine-smooth-over-dvr and D = R_(πR). If Gersten's DVR conjecture holds for D (K_*(D) → K_*(Frac D) injective), then R satisfies the Gersten–Quillen condition (K-book Corollary V.9.7.1(d); Gillet–Levine). Gersten's DVR conjecture itself is not known in general mixed characteristic (K-book V.6.9); it holds for finite coefficients (K-book 6.9.1) and when the residue field is algebraic over 𝔽_p (K-book 6.9.2, Ex. 6.11), which are not planned in this layer (see coverage).

**Hypotheses.**

- As in S.4/gillet-levine-smooth-over-dvr; the hypothesis on D is an explicit assumption, not a theorem of this layer.

**Proof.**

1. By S.4/mixed-char-gersten-partial-exactness it suffices that K_n(R) → K_n(E) is injective.
2. G_n(R) → G_n(D) is injective by S.4/gillet-levine-smooth-over-dvr with i = 0 (the kernel comes from K M^1(R), which is the colimit of the K M^0(A[1/s]/t) over t ∈ T, whose images vanish), and G_n(D) → G_n(Frac D) = K_n(E) is injective by hypothesis; R and D are regular, so G = K.

**Acceptance.**

- For R = ℤ_(p)[x]_(p, x), D = ℤ_(p)[x]_(p) is a DVR with residue field 𝔽_p(x), not algebraic over 𝔽_p, so none of the known DVR cases applies and Gersten for R remains conditional.
- An unrefereed 2007 preprint (Mochizuki, arXiv math/0702315) claims the DVR case in general; it is not used here.

**Depends on.** this roadmap: `S.4/mixed-char-gersten-partial-exactness`, `S.4/gillet-levine-smooth-over-dvr`, `S.4/gersten-quillen-property`, `S.3/cartan-localisation-comparison`.

**Sources.**

- `Kbook.2013`, Corollary V.9.7.1(d) (PDF p. 448): “(d) If Gersten’s DVR conjecture 6.9 is true for D, then the Gersten-Quillen conjecture 9.3 is true for R.” — The statement.
- `Mochizuki.2016`, §1, Historical Note (p. 2): “If A is smooth over some commutative discrete valuation ring S and if we accept Gersten’s conjecture for S, then Gersten’s conjecture for A is true. [GL87].” — The same reduction as recorded in the survey.

### Descent and coniveau spectral sequences agree for regular schemes with Gersten local rings

`S.4/descent-coniveau-e2-comparison` · comparison

Let X be a regular noetherian scheme of finite Krull dimension whose local rings satisfy the Gersten–Quillen condition (e.g. regular of finite type over a field). Then the E_2 pages of the Brown–Gersten–Thomason descent spectral sequence (S.4/zariski-descent-spectral-sequence) and of the coniveau spectral sequence (S.4/g-coniveau-spectral-sequence, re-indexed) are both H^p(X, 𝒦_{−q}), by S.4/gersten-resolution; Gillet–Soulé prove that the two spectral sequences are isomorphic from E_2 on (K-book V.10.12, citing Gillet–Soulé 2.2.4). The E_2 identification is proved here; the isomorphism of the whole spectral sequences is cited.

**Hypotheses.**

- X regular noetherian, finite Krull dimension, Gersten local rings.

**Proof.**

1. E_2 of the coniveau spectral sequence is H^p(X, 𝒦_{−q}) (S.4/gersten-resolution); E_2 of the descent spectral sequence is H^p_Zar(X, 𝒦_{−q}) by construction (S.4/zariski-descent-spectral-sequence); K = G on regular X.
2. The comparison of higher differentials and filtrations is Gillet–Soulé, 'Filtrations on higher algebraic K-theory', §2.2.4 (not read): recorded as a gap.

**Acceptance.**

- For X a regular curve both spectral sequences are two-column and degenerate at E_2, and both give 0 → H^1(X, 𝒦_{n+1}) → K_n(X) → H^0(X, 𝒦_n) → 0.
- For X = P²_k, H^2(P², 𝒦_2) = ℤ on both pages.

**Depends on.** this roadmap: `S.4/gersten-resolution`, `S.4/zariski-descent-spectral-sequence`, `S.4/g-coniveau-spectral-sequence`, `S.4/k-coniveau-first-page-regular`.

**Sources.**

- `Kbook.2013`, Example V.10.12 (PDF p. 457): “If X is regular, of ﬁnite type over a ﬁeld, then Gillet and Soul´e proved in GiS [70, 2.2.4] that the descent spectral sequence ( 10.11) is isomorphic to the spectral sequence of Proposition 9.8.1, which arises from the coniveau spectral sequence of 9.5.” — The comparison (cited in the source).

## S.5 — Homotopy invariance and fundamental formulas

*Coverage: partial.* Thirty-four nodes realise the stage as RS-18 narrows it. Homotopy invariance for regular noetherian schemes (S.5/homotopy-invariance-regular) is proved from Quillen's homotopy invariance of G-theory, planned here in full because no layer owns it (graded lemma, Rees dehomogenisation, the affine theorem, the zero-section transfer, the scheme theorem and its Laurent half), through S.2's Cartan equivalence; the Laurent decomposition and the vanishing of negative K-groups of regular noetherian schemes follow. The projective-bundle theorem is planned at declaration granularity along Thomason–Trobaugh §4 (cohomology of O(n), the Koszul sequences, Mumford regularity and its lemmas, Quillen's resolution, the split injection, the regular approximation, the noetherian theorem and the qcqs theorem), for S.2's non-connective K in every degree, with the actual generators [O(−i)], 0 ≤ i < rank E. The P¹ specialisation (S.5/projective-line-k-theory) gives the basis, the classes of all O(m), and the Euler-characteristic and rank functionals that KTheoryLowDegrees Z.6 compares with rank/Pic, without depending on Z.6 (RS-18). The Bass fundamental theorem for schemes is proved directly for the non-connective K from S.4's Mayer–Vietoris, the P¹ theorem and S.3's supports; the splitting by the unit T, the four-term decomposition with Nil terms and the comparison with GeneralAlgebraicKTheory K.6's ring theorem (the owner of the ring form, Nil terms included) import and extend K.6 as RS-18 asks, and the test of the README (A¹ minus the origin: localisation against the fundamental theorem) is S.5/punctured-line-localisation-test. The regular-centre blow-up formula follows Thomason 1993 §2 (geometry of the regular blow-up, Lemmas 2.3–2.5, the codimension-one triangle 3.5.2, the Waldhausen filtration 2.7, Theorem 2.1 in all degrees), with the exceptional-divisor tests and the invariance of images on the complement that EllipticKTheory E.6 uses. Homotopy K-theory: no consumer requests KH (consumer_requests; EllipticKTheory, KTheoryLowDegrees, MotivicEtaleKTheory M.6a and Polylogarithms P.5 all use ordinary K of regular schemes), so KH is not constructed, as the stage text directs; ordinary K is kept distinct from KH by the non-example NK_1(k[ε]) ≠ 0 recorded in S.5/homotopy-invariance-regular and S.5/laurent-extension-and-nk, and no node substitutes KH for K in a statement about tame kernels.

- Remaining: Continuity of K under affine inverse limits and absolute noetherian approximation (Thomason–Trobaugh 3.20, C.9) for the qcqs projective-bundle theorem: to be planned in S.2 (gap).
- Remaining: Additivity of S.2's non-connective K for cofibration sequences of exact functors, in negative degrees: import from GeneralAlgebraicKTheory K.6 (request).
- Remaining: Compatibility of products with Mayer–Vietoris and localisation boundaries: import from GeneralAlgebraicKTheory K.7 (request); the universal sign ε = ∂_T(T) is left as a constant whose value 1 is asserted, not proved, by Thomason–Trobaugh (gap).
- Remaining: The exact-sequence form of the blow-up formula (Thomason 1993 Remarque 2.2) needs the K-theoretic excess intersection formula, which S.7 owns downstream (gap and restructure).
- Remaining: Graded Quillen lemma (K-book Ex. V.3.3) and the Rees dehomogenisation equivalence are exercise- or assertion-level in the K-book; their proof steps are written here but not taken from a source proof (gaps).
- Remaining: Relative Serre vanishing and p_*O_{X′}(n) = J^n for n ≫ 0, and the regular embedding X′ ⊂ P^{d−1}_X, are cited by Thomason from EGA and SGA 6, not read (gap).
- Remaining: The Nil-category description of NK for non-affine schemes (Thomason–Trobaugh Ex. 9.13) has no proof in the sources read; only the affine Nil terms are imported from K.6 (gap).

### K-theory of graded modules over a flat graded ring

`S.5/graded-quillen-lemma` · lemma

Let S = ⊕_{n≥0} S_n be a commutative graded noetherian ring with R := S_0, such that S is flat as an R-module and R = S/S_+ has finite flat dimension as an S-module. Let Mgr(S) be the abelian category of finitely generated ℤ-graded S-modules, and let σ be the shift automorphism σ(M) = M(−1), which makes K_*Mgr(S) a ℤ[σ, σ⁻¹]-module. Then the map β: G_i(R) ⊗_ℤ ℤ[σ, σ⁻¹] → K_iMgr(S), [M]·σⁿ ↦ [(M ⊗_R S)(−n)], induced by the exact functor M ↦ M ⊗_R S, is an isomorphism of ℤ[σ, σ⁻¹]-modules for every i ≥ 0. Its inverse is induced by M ↦ M ⊗_S R on the resolving subcategory Pgr of graded modules Tor-independent of R, followed by K_iMgr(R) ≅ ⊕_{n∈ℤ} G_i(R). The same holds for the category Mgr,≥0(S) of positively graded modules with ℤ[σ] in place of ℤ[σ, σ⁻¹].

**Hypotheses.**

- S is commutative, graded by ℕ, noetherian, and flat over R = S_0; R = S/S_+ has finite flat (Tor) dimension over S.
- G_i(R) = K_i(M(R)) is Quillen's K-theory of finitely generated R-modules (S.2's G-theory of the affine scheme Spec R).
- Graded modules are ℤ-graded and finitely generated; σ(M)_n = M_{n−1}.

**Proof.**

1. Mgr(R), with R concentrated in degree 0, is the coproduct over n ∈ ℤ of copies of M(R) (a graded R-module is a sequence of R-modules with finitely many non-zero terms); K-theory commutes with the coproduct as a filtered colimit of finite products (GeneralAlgebraicKTheory K.7, finite products and filtered colimits), so K_iMgr(R) ≅ G_i(R)[σ, σ⁻¹].
2. β is well defined: M ↦ M ⊗_R S is exact because S is R-flat, and it commutes with σ.
3. Let Pgr ⊂ Mgr(S) be the full subcategory of graded modules M with Tor^S_q(M, R) = 0 for q > 0. It is closed under extensions and kernels of surjections, and every object of Mgr(S) has a finite Pgr-resolution because R has finite flat dimension over S and S is noetherian. By the Resolution Theorem (GeneralAlgebraicKTheory K.3/resolution-theorem) K(Pgr) ≃ K Mgr(S), and M ↦ M ⊗_S R is exact on Pgr, giving γ: K_iMgr(S) → K_iMgr(R) = G_i(R)[σ, σ⁻¹].
4. γβ = id, since (M ⊗_R S) ⊗_S R ≅ M naturally.
5. Surjectivity of β (the hint of Ex. V.3.3): for m ≥ 0 let F_m(M) be the submodule generated by M_{−m} ⊕ ⋯ ⊕ M_m and M_m(S) the subcategory of M with M = F_m(M). The admissible filtration 0 ⊂ F_0(M) ⊂ ⋯ ⊂ F_m(M) = M has exact subquotient functors, so by admissible-filtration additivity (GeneralAlgebraicKTheory K.3/additivity-for-exact-categories) K_iM_m(S) ≅ K_iM_m(R), a finite sum of copies of G_i(R), compatibly with β; pass to the colimit over m.
6. The positively graded variant is the same argument restricted to non-negative degrees.

**Acceptance.**

- For S = R[x] with deg x = 1: K_iMgr(R[x]) ≅ G_i(R)[σ, σ⁻¹] with [R[x](−n)] ↔ σⁿ[R].
- For S = R (concentrated in degree 0) β is the identity of G_i(R)[σ, σ⁻¹].
- Hypothesis check: for S = R[u, t] with deg u = deg t = 1, R = S/(u, t) has flat dimension 2 over S (Koszul resolution), so the lemma applies; this is the case used by the fundamental theorem for G.

**Depends on.** this roadmap: `S.2/g-theory-of-a-scheme`; other roadmaps: `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`.

**Sources.**

- `Kbook.2013`, Example V.3.5.2 (PDF p. 396; book p. 388): “Suppose that S = R⊕S1⊕S2⊕· · · is a graded noetherian ring, and let Mgr(S) be the abelian category of ﬁnitely generated graded S-modules.” — The setting of the lemma.
- `Kbook.2013`, Example V.3.5.2 (PDF p. 396): “In fact, β is an isomorphism (see Ex. 3.3).” — The statement; the source proves the left inverse and leaves surjectivity to the exercise.
- `Kbook.2013`, Exercise V.3.3 (PDF p. 405; book p. 397): “Show that β is an isomorphism in Example 3.5.2. To do this, let Fm(M) be the submodule of M generated by M−m⊕· · ·⊕Mm” — The hint the proof steps follow; the exercise's 'graded B-modules' is read as graded S-modules (source issue).

### Dehomogenisation for the Rees ring of the polynomial ring

`S.5/rees-dehomogenisation` · lemma

Let R be a commutative noetherian ring and S := R[st, t] ⊂ R[s, t], graded by deg s = 0 and deg t = 1, so that S = R[u, t] with u = st and deg u = deg t = 1, and S_0 = R. Let Mt_gr(S) ⊂ Mgr(S) be the full subcategory of finitely generated graded S-modules annihilated by a power of t. Then (a) Mt_gr(S) is a Serre subcategory of Mgr(S); (b) Φ(M) := M/(t − 1)M, an R[s]-module through S/(t − 1)S ≅ R[s] (u ↦ s, t ↦ 1), is an exact functor Mgr(S) → M(R[s]) whose kernel is exactly Mt_gr(S), and it induces an equivalence Mgr(S)/Mt_gr(S) ≃ M(R[s]); (c) every object M of Mt_gr(S) has the finite filtration M ⊃ tM ⊃ ⋯ ⊃ t^N M = 0 with subquotients in Mgr(S/tS), S/tS ≅ R[u] = R[st], so dévissage gives K Mgr(S/tS) ≃ K Mt_gr(S). The Serre subcategory is the t-power-torsion modules, not the modules with finitely many non-zero homogeneous components: S/tS ≅ R[u] is t-torsion with every component non-zero.

**Hypotheses.**

- R commutative noetherian; S = R[st, t] with deg s = 0, deg t = 1.
- Mgr denotes finitely generated ℤ-graded modules; the quotient is Gabriel's Serre quotient.

**Proof.**

1. S/(t − 1)S ≅ R[s]: R[u, t]/(t − 1) ≅ R[u], and u = st ↦ s.
2. t − 1 is a non-zerodivisor on every graded S-module: if (t − 1)m = 0 with m = Σ_{i=a}^{b} m_i homogeneous components, the degree-a component of (t − 1)m is −m_a, so m_a = 0, and inductively m = 0. Hence Tor_1^S(M, S/(t − 1)) = 0 and Φ is exact.
3. Φ(M) ≅ (M[1/t])_0 through m_i ↦ m_i/t^i; since t is a unit of degree one in S[1/t], M[1/t] ≅ (M[1/t])_0 ⊗ ℤ[t, t⁻¹], so Φ(M) = 0 iff M[1/t] = 0 iff (M finitely generated) t^N M = 0 for some N. This gives (a) and the kernel in (b).
4. Φ is essentially surjective: homogenise a presentation R[s]^a → R[s]^b → N → 0 by replacing each entry a(s) of degree ≤ d by t^d a(u/t) ∈ S_d; the cokernel M of the resulting graded map has Φ(M) ≅ N.
5. Φ is fully faithful on the quotient: multiplication by t: M → M(1) has t-torsion kernel and cokernel, so M ≅ M(1) in the quotient; an R[s]-linear map Φ(M) → Φ(M′) extends t-linearly to M[1/t] → M′[1/t], and since M is finitely generated it maps M into t^{−N}M′ for some N, i.e. comes from a graded map M → M′(N) ≅ M′; two graded maps inducing the same Φ differ by a map with t-torsion image. Gabriel's theorem then identifies the Serre quotient with M(R[s]) (GeneralAlgebraicKTheory K.3/abelian-localization-theorem supplies the Serre-quotient framework).
6. (c): M ⊃ tM ⊃ ⋯ ⊃ t^N M = 0 is a filtration by graded submodules whose subquotients are killed by t, i.e. objects of Mgr(S/tS); Mgr(S/tS) is closed in Mt_gr(S) under subobjects and quotients, so dévissage (GeneralAlgebraicKTheory K.3/devissage-theorem) applies.

**Acceptance.**

- Φ(S(−n)) = R[s] for every n, and Φ(S/tS) = 0.
- Φ(S/uS) = R[s]/(s) = R: the module S/uS = R[t] is t-torsion-free, so it is not killed.
- Non-example: S/tS ≅ R[u] has infinitely many non-zero components but lies in Mt_gr(S); the 'finitely many non-zero components' subcategory would not contain Mgr(S/tS) and dévissage would fail.

**Depends on.** other roadmaps: `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`; libraries: `mathlib:Polynomial.isNoetherianRing`.

**Sources.**

- `Kbook.2013`, Theorem V.6.2, proof (PDF p. 415; book p. 407): “To prove (i), we introduce the graded subring S = R[st, t] of R[s, t] where deg(s) = 0, deg(t) = 1.” — The ring S of the lemma.
- `Kbook.2013`, Theorem V.6.2, proof (PDF p. 415): “There is also an equivalence of quotient categories Mgr(S)/Mb gr(S) ∼= M(R[s]) induced by the exact functor M 7→M/(t −1)M from Mgr(S) to M(R[s]).” — Part (b), asserted without proof in the source; the source's Mb_gr(S) must be read as the t-power-torsion modules (source issue).
- `Kbook.2013`, Theorem V.6.2, proof (PDF p. 415): “By devissage (Ex. 4.4), Mb gr(S) has the same K-theory as its subcategory Mgr(S/tS).” — Part (c).

### Homotopy invariance of G-theory for noetherian rings

`S.5/g-theory-homotopy-invariance-affine` · theorem

Let R be a commutative noetherian ring and f: R → R[s] the inclusion. The flat base change f^*: G(R) → G(R[s]), M ↦ M[s] = M ⊗_R R[s], is a homotopy equivalence, split by (s = 1)^*: G(R[s]) → G(R) (defined since R = R[s]/(s − 1) has flat dimension one over R[s]). Hence f^*: G_n(R) ≅ G_n(R[s]) for all n ≥ 0.

**Hypotheses.**

- R commutative noetherian (the source allows any noetherian ring with s central; the scheme theory uses the commutative case).
- G(R) = K(M(R)) is Quillen's K-theory of finitely generated R-modules; base change along maps of finite flat dimension is S.2's finite-Tor-dimension pullback on G.

**Proof.**

1. (s = 1) ∘ f = id_R, so (s = 1)^* f^* ≃ id by functoriality of finite-Tor-dimension pullback (S.2/g-theory-finite-tor-pullback); it remains to show that f^* is an isomorphism on homotopy groups.
2. Let S = R[st, t] be graded as in S.5/rees-dehomogenisation. Quillen's localization theorem for the Serre subcategory Mt_gr(S) ⊂ Mgr(S) (GeneralAlgebraicKTheory K.3/abelian-localization-theorem), with the quotient identified with M(R[s]) by S.5/rees-dehomogenisation(b), gives a homotopy fibration K Mt_gr(S) → K Mgr(S) → G(R[s]).
3. By S.5/rees-dehomogenisation(c), K Mt_gr(S) ≃ K Mgr(S/tS) with S/tS = R[st].
4. S and S/tS are flat over R and R has finite flat dimension over both (Koszul resolutions of R over R[u, t] and R[u]), so S.5/graded-quillen-lemma identifies K_*Mgr(S) and K_*Mgr(S/tS) with G_*(R)[σ, σ⁻¹], compatibly with M ↦ M ⊗_R S and M ↦ M ⊗_R S/tS.
5. The map h: K_*Mgr(S/tS) → K_*Mgr(S) induced by the inclusion is 1 − σ: for M ∈ M(R) the sequence 0 → (M ⊗ S)(−1) → M ⊗ S → M ⊗ S/tS → 0 (multiplication by t) is exact, and additivity (GeneralAlgebraicKTheory K.3/additivity-for-exact-categories) gives [M ⊗ S/tS] = (1 − σ)[M ⊗ S].
6. 1 − σ is injective on G_*(R)[σ, σ⁻¹] with cokernel G_*(R) (σ ↦ 1); so the long exact sequence breaks into 0 → G_*(R)[σ, σ⁻¹] → G_*(R)[σ, σ⁻¹] → G_*(R[s]) → 0, and the induced G_*(R) → G_*(R[s]) is M ↦ (M ⊗_R S)/(t − 1) = M[s], i.e. f^*. Hence f^* is an isomorphism on all homotopy groups, so a homotopy equivalence.

**Acceptance.**

- G_0(R[s]) ≅ G_0(R) for every noetherian R, e.g. G_0(k[ε][s]) ≅ G_0(k[ε]) ≅ ℤ (k a field, ε² = 0).
- G_1(k[ε][s]) ≅ G_1(k[ε]) ≅ k^× (dévissage to the residue field), whereas K_1(k[ε][s]) ≠ K_1(k[ε]): homotopy invariance holds for G of singular rings but not for K.
- For R regular noetherian the statement becomes K_n(R) ≅ K_n(R[s]) after the Cartan equivalence (S.5/homotopy-invariance-regular).

**Depends on.** this roadmap: `S.5/graded-quillen-lemma`, `S.5/rees-dehomogenisation`, `S.2/g-theory-finite-tor-pullback`, `S.2/g-theory-of-a-scheme`; other roadmaps: `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`.

**Sources.**

- `Kbook.2013`, Theorem V.6.2 (PDF p. 415; book p. 407): “Fundamental Theorem for G(R) 6.2. Let R be a noetherian ring. Then: (i) The ﬂat base change f ∗: G(R) →G(R[s]) is a homotopy equivalence, split by (s = 1)∗. Hence f ∗: Gn(R) ∼= Gn(R[s]) for all n.” — The statement, verbatim.
- `Kbook.2013`, Theorem V.6.2, proof (PDF p. 415): “As pointed out in Example 3.5.2, the ﬁrst two maps induce the maps σ and 1, respectively, from Gn(R) to G(R)[σ, σ−1]. Hence h = 1 −σ, proving (i).” — The final step of the proof.

### The zero-section transfer vanishes and sections split the projection

`S.5/zero-section-transfer-vanishes` · lemma

Let X be a scheme, p: X[s] → X the projection and z: X → X[s] the zero section (s ↦ 0). (a) If X is noetherian, z has finite flat dimension, z^*p^* ≃ id on G(X), and the finite transfer z_*: G(X) → G(X[s]) is null-homotopic. (b) If X is quasi-compact and quasi-separated, z is a perfect closed immersion (z_*O_X has the resolution O_{X[s]} →(s) O_{X[s]}), z^*p^* ≃ id on K(X), and z_*: K(X) → K(X[s]) is null-homotopic. (c) The same holds for the section e: X → X[s, s⁻¹], s ↦ 1, of the Laurent extension: e^*(jp)^* ≃ id on G(X) (X noetherian) and on K(X).

**Hypotheses.**

- X[s] and X[s, s⁻¹] are the polynomial and Laurent extensions of S.5/laurent-extension-and-nk.
- G-theory for noetherian X; K-theory is S.2's K of perfect complexes.

**Proof.**

1. p ∘ z = id_X and p ∘ j ∘ e = id_X, so z^*p^* ≃ id and e^*(jp)^* ≃ id by functoriality of pullback (S.2/k-theory-pullback; S.2/g-theory-finite-tor-pullback for G, z and e having flat dimension one).
2. For F coherent (resp. perfect) on X, multiplication by s is injective on p^*F = F[s] and gives the exact sequence of exact functors 0 → p^*F →(s) p^*F → z_*F → 0.
3. Additivity (GeneralAlgebraicKTheory K.3/additivity-for-exact-categories for coherent sheaves; K.4/waldhausen-additivity-theorem for perfect complexes) gives z_* ≃ p^* − p^* ≃ 0.

**Acceptance.**

- z_*[O_X] = [O_{X[s]}] − [O_{X[s]}] = 0 in K_0(X[s]) (and in G_0(X[s])).
- For X = Spec R: z^* is M ↦ M/sM on modules Tor-independent of R, matching K-book V.3.5.1.
- The finite transfer along the closed immersion is zero although z_*O_X ≠ 0 as a sheaf.

**Depends on.** this roadmap: `S.5/laurent-extension-and-nk`, `S.2/k-theory-pullback`, `S.2/g-theory-finite-tor-pullback`, `S.2/k-theory-proper-pushforward`, `S.2/g-theory-proper-pushforward`; other roadmaps: `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.4/waldhausen-additivity-theorem`.

**Sources.**

- `Kbook.2013`, Example V.3.6.1 (PDF p. 397; book p. 389): “In contrast the ﬁnite transfer map f∗: G(X) →G(X[s]) is zero. This follows from the Additivity Theorem applied to the sequence of functors p∗֌ p∗։ f∗ from M(X) to M(X[s]), analogous to the one in 3.5.1.” — Part (a); f is the source's name for the zero section.
- `Kbook.2013`, Example V.3.5.1 (PDF p. 396): “In contrast, the transfer maps K(R) f∗ −→K(R[s]) and G(R) f∗ −→G(R[s]) are zero.” — The affine case, for K and G.

### Fundamental theorem for G-theory of noetherian schemes: homotopy invariance

`S.5/g-theory-homotopy-invariance` · theorem · planet “Fundamental Theorem for G(X)”

For every noetherian scheme X, the flat projection p: X[s] → X induces a homotopy equivalence p^*: G(X) ≃ G(X[s]), with homotopy inverse z^* (the zero section). Hence G_n(X) ≅ G_n(X[s]) for all n ≥ 0, and by induction G(X) ≃ G(A^m_X) for all m.

**Hypotheses.**

- X noetherian (quasi-compact, covered by finitely many spectra of noetherian rings); no separatedness or regularity is assumed.
- G(X) = K(Coh X) (S.2/g-theory-of-a-scheme); p^* is flat pullback.

**Proof.**

1. By S.5/zero-section-transfer-vanishes, z^*p^* ≃ id, so it suffices that p^* is an isomorphism on homotopy groups.
2. X affine: S.5/g-theory-homotopy-invariance-affine, with G(Spec A) ≃ G(A) (S.2/affine-k-theory-comparison).
3. X separated: induction on the number of affine opens. Write X = U₁ ∪ U₂ with U₂ affine; U₁ and U₁₂ = U₁ ∩ U₂ (affine, X being separated) have fewer affines. Quillen localization for coherent sheaves and dévissage give the G-theory Mayer–Vietoris sequence of the cover (S.3's G-theory localization; S.4's Mayer–Vietoris), compatible with flat pullback along p; the five lemma gives the result for X.
4. General noetherian X: the same induction, since every open subscheme of a separated scheme is separated, so the intersections U₁₂ are covered by the separated case.

**Acceptance.**

- G_0(X[s]) ≅ G_0(X) holds for the singular cuspidal curve X = Spec k[t², t³]: no regularity is needed for G.
- For the affine plane with a doubled origin X over a field k (non-separated; G(X) ≃ G(k) × G(k) by K-book Ex. V.6.8), G(X[s]) ≃ G(X).
- Iteration: G(X) ≃ G(A^m_X) = G(X[s₁, …, s_m]).

**Depends on.** this roadmap: `S.5/g-theory-homotopy-invariance-affine`, `S.5/zero-section-transfer-vanishes`, `S.2/g-theory-of-a-scheme`, `S.2/affine-k-theory-comparison`, `S.2/g-theory-finite-tor-pullback`, `S.4/g-theory-mayer-vietoris`, `S.3/g-theory-localisation`, `S.3/coherent-support-devissage`; libraries: `mathlib:AlgebraicGeometry.IsNoetherian`, `mathlib:AlgebraicGeometry.AffineSpace`.

**Sources.**

- `Kbook.2013`, Theorem V.6.13 (PDF p. 425; book p. 417): “Fundamental Theorem for G(X) 6.13. If X is a noetherian scheme, the ﬂat maps X[s, s−1] ⊂ j > X[s] p>> X induce a homotopy equivalence p∗: G(X) ≃G(X[s])” — The statement (first part).
- `Kbook.2013`, Theorem V.6.13, proof (PDF p. 425): “The 5-lemma implies that G(X) ≃G(X[s]) for X separated. Another induction establishes the result for non-separated X, since any open subscheme of a separated scheme is separated.” — The two inductions of the proof.

### Fundamental theorem for G-theory: the Laurent decomposition

`S.5/g-theory-laurent-decomposition` · theorem

Let X be noetherian, j: X[s, s⁻¹] → X[s] the open complement of the zero section. The G-theory localization sequence for the zero section splits into short exact sequences 0 → G_n(X[s]) →(j^*) G_n(X[s, s⁻¹]) →(∂) G_{n−1}(X) → 0 (n ≥ 1; G_0(X[s]) ≅ G_0(X[s, s⁻¹])), and (jp)^*: G_n(X) → G_n(X[s, s⁻¹]) is split by e^* (s = 1). Hence G_n(X[s, s⁻¹]) ≅ G_n(X) ⊕ G_{n−1}(X) for all n ≥ 0, with G_{−1} := 0.

**Hypotheses.**

- X noetherian.
- The boundary ∂ is that of Quillen's localization sequence G(X) →(z_*) G(X[s]) → G(X[s, s⁻¹]) (coherent sheaves supported on the zero section, identified with G(X) by dévissage).

**Proof.**

1. Localization for coherent sheaves (S.3's G-theory localization, with dévissage for the zero section X ≅ z(X), GeneralAlgebraicKTheory K.3/devissage-theorem) gives the long exact sequence ⋯ → G_n(X) →(z_*) G_n(X[s]) →(j^*) G_n(X[s, s⁻¹]) →(∂) G_{n−1}(X) → ⋯.
2. z_* = 0 (S.5/zero-section-transfer-vanishes(a)), so the sequence breaks into the displayed short exact sequences.
3. By S.5/g-theory-homotopy-invariance, j^*p^* = (jp)^* identifies G_n(X) with the image of j^*; e^*(jp)^* ≃ id (S.5/zero-section-transfer-vanishes(c)) splits it, giving the direct sum decomposition.

**Acceptance.**

- X = Spec F, F a field: G_1(F[s, s⁻¹]) ≅ F^× ⊕ ℤ, the ℤ generated by the class of the unit s, whose boundary is [F] = 1.
- G_0(X[s, s⁻¹]) ≅ G_0(X) for every noetherian X.
- The splitting of ∂ is multiplication by s (K-book Ex. V.6.3) once the product is available (S.5/bass-boundary-splitting in K-theory).

**Depends on.** this roadmap: `S.5/g-theory-homotopy-invariance`, `S.5/zero-section-transfer-vanishes`, `S.2/g-theory-of-a-scheme`, `S.3/g-theory-localisation`, `S.3/coherent-support-devissage`; other roadmaps: `GeneralAlgebraicKTheory:K.3/devissage-theorem`.

**Sources.**

- `Kbook.2013`, Theorem V.6.13 (PDF p. 425; book p. 417): “induce a homotopy equivalence p∗: G(X) ≃G(X[s]) and isomorphisms Gn(X[s, s−1]) ∼= Gn(X) ⊕Gn−1(X).” — The statement (second part).
- `Kbook.2013`, Theorem V.6.13, proof (PDF p. 425): “If z : X →X[s] is the zero-section, we saw in 3.6.1 that z∗= 0. Hence the Localization Sequence ( 6.11) splits into short exact sequences” — The splitting step.

### Homotopy invariance of K-theory for regular noetherian schemes

`S.5/homotopy-invariance-regular` · theorem · planet “Homotopy invariance for regular schemes”

Let X be a regular noetherian scheme (every local ring O_{X,x} is a regular local ring). Then p^*: K(X) → K(X[T]) is a homotopy equivalence of S.2's non-connective K-theory spectra, with inverse z^*; hence K_n(X) ≅ K_n(X[T]) and NK_n(X) = 0 for all n ∈ ℤ, and by induction K(X) ≃ K(A^m_X) for all m ≥ 0. The regularity hypothesis cannot be dropped: for X = Spec k[ε] (k a field, ε² = 0), K_1(X) → K_1(X[T]) is not surjective.

**Hypotheses.**

- X noetherian and regular in the sense that all local rings are regular (Mathlib's IsRegularRing on affine opens: all localisations at primes are IsRegularLocalRing).
- K is S.2's non-connective K-theory of perfect complexes; the Cartan map K → G is S.2's.

**Proof.**

1. X[T] is regular noetherian: on an affine open Spec A of X, A[T] is noetherian (Hilbert basis theorem, mathlib Polynomial.isNoetherianRing) and regular (mathlib Polynomial.isRegularRing_of_isRegularRing), and X[T] is covered by the Spec A[T].
2. The Cartan maps K(X) → G(X) and K(X[T]) → G(X[T]) are equivalences on connective covers (Poincaré duality, S.2/cartan-equivalence) and commute with flat pullback p^* (S.2/cartan-map).
3. By S.5/g-theory-homotopy-invariance, p^*: G(X) ≃ G(X[T]); hence p^*: K_n(X) ≅ K_n(X[T]) for n ≥ 0.
4. For n < 0 both groups vanish, X and X[T] being regular noetherian (S.5/negative-k-vanishing-regular); so p^* is an isomorphism on all homotopy groups, hence a homotopy equivalence, and NK_n(X) = coker(p^*) = 0.
5. Induction on m gives K(X) ≃ K(A^m_X), A^m_X = X ×_ℤ Spec ℤ[T₁, …, T_m] (mathlib AlgebraicGeometry.AffineSpace; MvPolynomial.isRegularRing_of_isRegularRing).
6. Non-example: for A = k[ε], Nil₀(A) ≅ NK_1(A) ≅ (1 + εT·k[T])^× (K-book Example III.3.8.1 with R = k, N = 2, imported from GeneralAlgebraicKTheory K.6 through S.5/affine-fundamental-theorem-comparison), which is non-zero since 1 + εT is a unit of A[T] (mathlib Polynomial.isUnit_iff_coeff_isUnit_isNilpotent) whose determinant is not constant (KTheoryLowDegrees U.3/stable-determinant).

**Acceptance.**

- K_n(k[T₁, …, T_m]) ≅ K_n(k) for a field k and all n; K_1(ℤ[T]) = {±1}.
- K_0(X[T]) ≅ K_0(X) for a Dedekind domain X = Spec O, e.g. K_0(ℤ[√−5][T]) ≅ ℤ ⊕ ℤ/2.
- Non-example: NK_1(k[ε]) ≅ (1 + εT·k[T])^× ≠ 0, so ordinary K-theory is not homotopy invariant on the singular scheme Spec k[ε]; homotopy K-theory KH is homotopy invariant by construction (K-book IV.12.8), so K and KH differ there, and no statement of this node applies to singular schemes.
- Consumers: EllipticKTheory E.4 uses SK_1(F[t]) = 0 and K_n(A¹_F) = K_n(F).

**Depends on.** this roadmap: `S.5/g-theory-homotopy-invariance`, `S.5/zero-section-transfer-vanishes`, `S.5/negative-k-vanishing-regular`, `S.5/laurent-extension-and-nk`, `S.5/affine-fundamental-theorem-comparison`, `S.2/cartan-equivalence`, `S.2/cartan-map`, `S.2/nonconnective-k-theory-of-a-scheme`; other roadmaps: `KTheoryLowDegrees:U.3/stable-determinant`; libraries: `mathlib:Polynomial.isNoetherianRing`, `mathlib:Polynomial.isRegularRing_of_isRegularRing`, `mathlib:MvPolynomial.isRegularRing_of_isRegularRing`, `mathlib:IsRegularRing`, `mathlib:AlgebraicGeometry.AffineSpace`, `mathlib:Polynomial.isUnit_iff_coeff_isUnit_isNilpotent`, `mathlib:DualNumber`.

**Sources.**

- `ThomasonTrobaugh.1990`, Proposition 6.8 (p. 362; PDF p. 116): “6.8 Proposition. Let X be a regular noetherian scheme. Then (a) p∗ : K(X) ∼→ K(X[T]) is a homotopy equivalence.” — The statement, for the connective K; part (b) of 6.8 is S.5/negative-k-vanishing-regular.
- `ThomasonTrobaugh.1990`, Proposition 6.8, proof (p. 362; PDF p. 116): “Statement (a) results from Poincaré duality 3.21 and the corresponding result for G-theory, [Q1] Section 7, 4.1.” — The route: Cartan equivalence plus homotopy invariance of G.
- `Kbook.2013`, Corollary V.6.13.2 (PDF p. 425; book p. 417): “Corollary 6.13.2. If X is regular noetherian then for all n: Kn(X)∼=Kn(X[s]), Kn(X[s, s−1]) ∼= Kn(X) ⊕Kn−1(X) and Kn(X × P1) ∼= Kn(X) ⊕Kn(X).” — The K-book's form; K(X) there is KChperf(X) (V.2.7.3), so no separatedness is needed.
- `Kbook.2013`, Example III.3.8.1 (PDF p. 215; book p. 207): “If R is a commutative regular ring, and A = R[x]/(xN), it follows from 2.4 and 3.8 that SK1(A[t]) = SK1(A) and hence (by 3.5.3 and 3.12) Nil0(A) ∼= NK1(A) ∼= (1 + tA[t])× = (1 + xtA[t])×.” — The non-example, with R = k, N = 2.

### The Laurent decomposition for regular noetherian schemes

`S.5/laurent-decomposition-regular` · theorem

Let X be a regular noetherian scheme. Then (jp)^*: K_n(X) → K_n(X[T, T⁻¹]) and the boundary of the localization sequence for the zero section give K_n(X[T, T⁻¹]) ≅ K_n(X) ⊕ K_{n−1}(X) for all n ≥ 1, and K_0(X) ≅ K_0(X[T, T⁻¹]); in particular K_0(X) → K_0(X[T, T⁻¹]) is surjective. (With S.5/negative-k-vanishing-regular the decomposition holds for all n ∈ ℤ, both sides vanishing for n < 0.)

**Hypotheses.**

- X regular noetherian; X[T, T⁻¹] is regular noetherian, being open in X[T].
- The statement concerns the connective K-groups; its proof does not use negative K-groups, so S.5/negative-k-vanishing-regular may use it.

**Proof.**

1. X[T, T⁻¹] is regular noetherian: its affine pieces are A[T, T⁻¹] = A[T]_T (mathlib LaurentPolynomial.isLocalization), localizations of the regular noetherian A[T].
2. The Cartan maps for X, X[T] and X[T, T⁻¹] are equivalences on connective covers, compatible with flat pullback and with localization sequences (S.2/cartan-equivalence, S.2/cartan-map; the zero section is a regular immersion, and coherent sheaves supported on it are perfect because X[T] is regular).
3. Transport S.5/g-theory-laurent-decomposition through the Cartan equivalences: K_n(X[T, T⁻¹]) ≅ G_n(X[T, T⁻¹]) ≅ G_n(X) ⊕ G_{n−1}(X) ≅ K_n(X) ⊕ K_{n−1}(X) for n ≥ 1, and K_0(X[T, T⁻¹]) ≅ G_0(X) ≅ K_0(X).

**Acceptance.**

- K_1(F[T, T⁻¹]) ≅ F^× ⊕ ℤ for a field F; K_1(ℤ[T, T⁻¹]) ≅ {±1} ⊕ ℤ, generated by −1 and T.
- K_0(O[T, T⁻¹]) ≅ K_0(O) ≅ ℤ ⊕ Cl(O) for a Dedekind domain O.
- Non-example: for singular X the decomposition acquires the terms NK_n(X) ⊕ NK_n(X) (S.5/nk-decomposition).

**Depends on.** this roadmap: `S.5/g-theory-laurent-decomposition`, `S.5/laurent-extension-and-nk`, `S.2/cartan-equivalence`, `S.2/cartan-map`; libraries: `mathlib:LaurentPolynomial.isLocalization`, `mathlib:Polynomial.isRegularRing_of_isRegularRing`.

**Sources.**

- `ThomasonTrobaugh.1990`, Proposition 6.8, proof (p. 363; PDF p. 117): “By Poincaré duality, we have K(X[T,T−1]) ≃ K(X) × ΣK(X). In particular, the map K0(X) → K0(X[T,T−1]) is onto” — The statement and its degree-zero consequence.
- `Kbook.2013`, Corollary V.6.13.2 (PDF p. 425): “Kn(X[s, s−1]) ∼= Kn(X) ⊕Kn−1(X)” — The decomposition.

### Negative K-groups of regular noetherian schemes vanish

`S.5/negative-k-vanishing-regular` · theorem

Let X be a regular noetherian scheme. Then K_n(X) = 0 for all n < 0 in S.2's non-connective K-theory, i.e. the connective cover K(X)⟨0⟩ → K(X) is an equivalence. The regularity hypothesis is needed: the node B = k[x, y]/(y² − x³ + x²) has K_{−1}(B) ≅ ℤ.

**Hypotheses.**

- X regular noetherian.
- Negative K-groups are π_n of S.2's non-connective K; by S.5/nk-decomposition they satisfy Bass's contraction formula.

**Proof.**

1. By S.5/bass-fundamental-theorem (n = 0), K_{−1}(Y) ≅ coker(K_0(Y[T]) ⊕ K_0(Y[T⁻¹]) → K_0(Y[T, T⁻¹])) for every quasi-compact quasi-separated Y.
2. For Y regular noetherian, K_0(Y) → K_0(Y[T, T⁻¹]) is surjective (S.5/laurent-decomposition-regular), so the cokernel is zero: K_{−1}(Y) = 0.
3. For k ≥ 2, K_{−k}(X) is a natural retract of K_{−1}(X[T₁^{±1}, …, T_{k−1}^{±1}]) (S.5/nk-decomposition, iterated splitting), and X[T₁^{±1}, …, T_{k−1}^{±1}] is regular noetherian (mathlib Polynomial.isRegularRing_of_isRegularRing and LaurentPolynomial.isLocalization); so K_{−k}(X) = 0.
4. Alternative route (not used): negative G-theory of a noetherian scheme vanishes (GeneralAlgebraicKTheory K.6/agreement-and-vanishing-of-negative-K, ring and abelian-category part) and would transport through a non-connective Cartan equivalence.

**Acceptance.**

- K_{−n}(Spec ℤ) = 0 and K_{−n}(Spec F) = 0 for a field F.
- For a Dedekind domain O, K(Spec O) is connective.
- Non-example: K_{−1}(k[x, y]/(y² − x³ + x²)) ≅ ℤ (K-book Ex. III.4.12), so the node's affine curve has a non-zero negative K-group.

**Depends on.** this roadmap: `S.5/bass-fundamental-theorem`, `S.5/nk-decomposition`, `S.5/laurent-decomposition-regular`, `S.2/nonconnective-k-theory-of-a-scheme`; libraries: `mathlib:Polynomial.isRegularRing_of_isRegularRing`, `mathlib:LaurentPolynomial.isLocalization`.

**Sources.**

- `ThomasonTrobaugh.1990`, Proposition 6.8(b) (p. 362; PDF p. 116): “(b) K(X) ∼→ KB(X) is a homotopy equivalence, so KBn(X) = 0 for n < 0.” — The statement, for Thomason–Trobaugh's non-connective K^B.
- `ThomasonTrobaugh.1990`, Proposition 6.8, proof (p. 363; PDF p. 117): “is onto, so KB−1(X) = 0 by 6.2(b). Now by descending induction on n, using 6.6(b), KB n(X) = 0 for n < 0.” — The proof the steps follow.
- `Kbook.2013`, Exercise III.4.12 (PDF p. 224; book p. 216): “(Reid) Let f = y2 −x3 + x2 in k[x, y] and set B = k[x, y]/(f). Using Theorem 4.3, show that K−1(B) ∼= K−1(B(x,y)) ∼= Z.” — The non-example.

### Higher direct images on a projective bundle

`S.5/projective-bundle-cohomology` · lemma

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). Then: (a) R^qπ_* preserves quasi-coherence, and coherence when X is locally noetherian; (b) R^qπ_*F = 0 for q ≥ r and every quasi-coherent F; (c) if X is noetherian and F coherent, there is n₀ with R^qπ_*(F(n)) = 0 for all n ≥ n₀ and q ≥ 1; (d) R^qπ_*(F ⊗ π^*M) ≅ R^qπ_*(F) ⊗ M for F quasi-coherent on P(E) and M flat quasi-coherent on X; (e) if r ≥ 2, then for every n ∈ ℤ, π_*O(n) ≅ Sym^n E (zero for n < 0), R^{r−1}π_*O(n) ≅ (Sym^{−r−n}E)^∨ ⊗ (Λ^r E)^∨, and R^qπ_*O(n) = 0 for q ≠ 0, r − 1 (for r = 1, π is an isomorphism and O(n) ≅ E^{⊗n}, so π_*O(n) = E^{⊗n} for all n); (f) R^qπ_*(O(n) ⊗ π^*M) ≅ R^qπ_*(O(n)) ⊗ M for every quasi-coherent M. Consequently Rπ_*O ≃ O_X, Rπ_*O(−i) ≃ 0 for 1 ≤ i ≤ r − 1, and Rπ_*(π^*G ⊗ O(−i)) ≃ 0 for 1 ≤ i ≤ r − 1 and every perfect G (derived projection formula).

**Hypotheses.**

- X a scheme (quasi-compact and quasi-separated where derived images are formed); E of constant rank r ≥ 1.
- P(E), O(1) and their base change are imported from AlgebraicModuliForArithmeticGeometry R09.1.

**Proof.**

1. (a) π is quasi-compact and separated, so higher direct images of quasi-coherent sheaves are quasi-coherent, and coherent over a locally noetherian base (S.2/total-direct-image-qcqs for the derived statement).
2. (b) Locally on X, E is free and P(E) is P^{r−1}_A, covered by r standard affines D_+(T_i) (mathlib Proj.awayι); the alternating Čech complex has length r − 1.
3. (c) Serre vanishing for the π-ample O(1) (imported with relative ampleness from R09.1; Thomason–Trobaugh cite EGA III 2.2.1).
4. (e) Stacks Lemma 30.8.4: the Koszul complex of π^*E(−1) → O (S.5/projective-bundle-koszul) is exact; its hypercohomology spectral sequence, with the projection formula and the local computation of Stacks Lemma 30.8.1, leaves only the terms π_*O = O_X and R^{r−1}π_*(π^*Λ^r E(−r)), forcing the stated values.
5. (d), (f): the Čech computation shows R^qπ_*O(n) is flat over X, so the Künneth Tor spectral sequences degenerate (Thomason–Trobaugh 4.5 proof).
6. Consequences: n = 0 gives π_*O = O_X with no higher images; for 1 ≤ i ≤ r − 1, Sym^{−i}E = 0 and −r + i < 0, so every R^qπ_*O(−i) vanishes; then S.2/derived-projection-formula gives Rπ_*(π^*G ⊗ O(−i)) ≃ G ⊗ Rπ_*O(−i) ≃ 0.

**Acceptance.**

- For r = 2, X = Spec k: H⁰(P¹, O(n)) has dimension n + 1 for n ≥ 0 and H¹(P¹, O(n)) has dimension −n − 1 for n ≤ −2; so χ(O(n)) = n + 1 for all n.
- Rπ_*O(−1) = 0 on P(E) for every r ≥ 2, while Rπ_*O(−r) = (Λ^r E)^∨[−(r−1)].
- For r = 1, π is an isomorphism and O(n) = (π^*E)^{⊗n}, so π_*O(n) = E^{⊗n} is non-zero also for n < 0: the case distinction of (e), which for r = 1 lists two values in degree q = 0 = r − 1, is stated for r ≥ 2.

**Depends on.** this roadmap: `S.5/projective-bundle-koszul`, `S.2/total-direct-image-qcqs`, `S.2/derived-projection-formula`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.1`; libraries: `mathlib:AlgebraicGeometry.«Proj»`, `mathlib:AlgebraicGeometry.Proj.awayι`.

**Sources.**

- `ThomasonTrobaugh.1990`, Recollection 4.5(b), (e) (p. 330; PDF p. 84): “(b) For q ≥ r = rank E, and F any quasi-coherent sheaf on PE, Rqπ∗F = 0.” — Part (b).
- `ThomasonTrobaugh.1990`, Recollection 4.5(e) (p. 330; PDF p. 84): “where SkE is the k-th symmetric power of E, considered to be 0 for k ≤ −1, ΛrE is the maximal exterior power of E, and ( )∨ sends a vector bundle to its dual” — The conventions of the formula in (e).
- `Stacks`, Lemma 30.8.4, Tag 01XX (Cohomology of Schemes, Section 30.8): “Let S be a scheme. Let n ≥ 1. Let E be a finite locally free O_S-module of constant rank n + 1. Consider the structure morphism π : P(E) → S.” — The projective-bundle computation with its proof (rank n + 1 there is r here), which Thomason–Trobaugh cite from EGA III.

### The Koszul resolutions on a projective bundle

`S.5/projective-bundle-koszul` · lemma

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). The tautological map π^*E ⊗ O(−1) → O is surjective and its Koszul complex is exact, giving the exact sequence of vector bundles (4.6.1) 0 → π^*(Λ^r E) ⊗ O(−r) → ⋯ → π^*(Λ²E) ⊗ O(−2) → π^*E ⊗ O(−1) → O → 0, and dually (4.6.2) 0 → O → π^*(E^∨) ⊗ O(1) → π^*(Λ²E^∨) ⊗ O(2) → ⋯ → π^*(Λ^r E^∨) ⊗ O(r) → 0. Consequently Σ_{i=0}^{r} (−1)^i [π^*(Λ^i E) ⊗ O(m − i)] = 0 in K_0(P(E)) for every m ∈ ℤ; for E = O^{⊕r} this reads Σ_{i=0}^{r} (−1)^i C(r, i)[O(m − i)] = 0, the additive form of (1 − [O(−1)])^r = 0.

**Hypotheses.**

- E of constant rank r ≥ 1 on any scheme X.
- K_0 classes of vector bundles are classes of perfect complexes; an exact sequence of vector bundles gives a relation (S.2/k-zero-of-a-scheme).

**Proof.**

1. Surjectivity: π^*E → O(1) is the tautological surjection of the projective bundle (R09.1; Thomason–Trobaugh cite EGA II 4.1.6); twist by O(−1).
2. Locally on P(E), π^*E ⊗ O(−1) is free and one basis vector maps onto the local generator, so the Koszul complex of the surjection is locally isomorphic to a tensor product of complexes one of which is acyclic; hence it is exact (Stacks, More on Algebra, Lemma 15.29.5, as used in Stacks Lemma 30.8.4).
3. The terms of the Koszul complex of a map V → O with V = π^*E ⊗ O(−1) are Λ^i V = π^*(Λ^i E) ⊗ O(−i): this is (4.6.1). Dualising (4.6.1), all of whose terms are vector bundles, gives (4.6.2); equivalently, (4.6.2) is the Koszul complex of the nowhere-vanishing section of π^*E^∨ ⊗ O(1) dual to the surjection.
4. Tensoring (4.6.1) with O(m) and taking classes in K_0 gives the relation; for trivial E, Λ^i E = O^{⊕C(r,i)}.

**Acceptance.**

- On P¹_X (r = 2): 0 → O(−2) → O(−1)^{⊕2} → O → 0, so [O] − 2[O(−1)] + [O(−2)] = 0.
- On P(E) with r = 1 the complex is 0 → π^*E ⊗ O(−1) ≅ O → O → 0, the identity.
- Non-example: the complex 0 → O → π^*E ⊗ O(1) → ⋯ written with E in place of E^∨ (K-book II.8.7.10, V.1.5.2) is not a resolution when E is not self-dual; the dual sequence uses E^∨ (source issue).

**Depends on.** this roadmap: `S.2/k-zero-of-a-scheme`, `S.1/perfect-derived-tensor`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources.**

- `ThomasonTrobaugh.1990`, Section 4.6 (p. 331; PDF p. 85): “On PE, the canonical map (π∗E) ⊗ O(−1) = (π∗π∗O(1)) ⊗ O(−1) → O(1) ⊗ O(−1) = O_PE is an epimorphism by [EGA] II 4.1.6.” — The surjection.
- `ThomasonTrobaugh.1990`, Section 4.6 (p. 331; PDF p. 85): “Thus the Kozsul complex of π∗E ⊗ O(−1) → O is acyclic (cf. [EGA] III 1.1, [SGA 6] VII 1). Expanding out the Koszul complex yields the well-known long exact sequence of algebraic vector bundles on PE” — Exactness and (4.6.1); 'Kozsul' is the source's spelling (source issue).
- `Stacks`, Lemma 30.8.4, proof, Tag 01XX: “This is a surjective map from a locally free rank n + 1 sheaf onto the structure sheaf. Hence the corresponding Koszul complex is exact (More on Algebra, Lemma 15.29.5).” — The local exactness argument.

### Castelnuovo–Mumford regularity on a projective bundle

`S.5/mumford-regularity` · definition

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). For m ∈ ℤ, a quasi-coherent O_{P(E)}-module F is m-regular (in the sense of Castelnuovo and Mumford) if R^qπ_*(F(m − q)) = 0 for all q ≥ 1; F is Mumford-regular if it is 0-regular. MR(E) denotes the exact category of 0-regular coherent sheaves (X noetherian), and MR_perf(E) the complicial category of perfect strict bounded complexes of 0-regular coherent sheaves (for the version with supports, also acyclic off π⁻¹(Y) for a closed Y ⊂ X). The K-book's convention (rank E = r + 1, 'Mumford-regular' meaning R^qπ_*F(−q) = 0 for q > 0) is the case m = 0.

**Hypotheses.**

- X a scheme; E of constant rank r ≥ 1; in the K-theoretic applications X is noetherian and F coherent.

**Proof.**

1. Define the predicate by the displayed vanishing condition, for each m.
2. Define MR(E) as the full subcategory of coherent sheaves that are 0-regular; it is closed under extensions by the long exact sequence of the R^qπ_*, hence an exact subcategory.
3. Define MR_perf(E) as the perfect strict bounded complexes whose terms lie in MR(E), with degreewise split monomorphisms as cofibrations and quasi-isomorphisms as weak equivalences (Thomason–Trobaugh 4.9's category A).

**API.**

- `MumfordRegular` (constructor): For m ∈ ℤ and F quasi-coherent on P(E): MumfordRegular m F :⇔ ∀ q ≥ 1, R^qπ_*(F(m − q)) = 0.
- `MumfordRegular.twist` (relation): MumfordRegular m (F(n)) ↔ MumfordRegular (m + n) F.
- `MumfordRegular.mono` (relation): MumfordRegular m F → MumfordRegular k F for every k ≥ m (Thomason–Trobaugh 4.7.2(a)).
- `MumfordRegular.of_extension` (relation): For 0 → F → G → H → 0: F, H m-regular ⇒ G m-regular; G m-regular and F (m+1)-regular ⇒ H m-regular (4.7.1(a), (b)).
- `MumfordRegular.acyclic` (characterisation): A 0-regular F satisfies R^qπ_*(F(n)) = 0 for q > 0 and n ≥ −q; in particular F is π_*-acyclic (K-book II.8.7.3(2)).
- `MumfordRegular.globallyGenerated` (characterisation): If F is m-regular then π^*π_*F(k) → F(k) is surjective for k ≥ m (4.7.2(c)).
- `MumfordRegular.exists` (other): For X noetherian and F coherent, ∃ m₀, ∀ m ≥ m₀, MumfordRegular m F (4.7.0).
- `MumfordRegular.pullback` (example): For N quasi-coherent on X and n ≥ 0, π^*N ⊗ O(n) is 0-regular and π_*(π^*N ⊗ O(n)) ≅ Sym^n E ⊗ N (K-book II.8.7.2).
- `MumfordRegular.baseChange` (compatibility): For a flat morphism g: X′ → X, F m-regular ⇒ g′^*F m-regular on P(g^*E) (flat base change of R^qπ_*).

**Unit tests.**

- `mumfordRegular_twist_P1` (computation): On P¹_k (k a field): O(n) is 0-regular iff n ≥ 0; O(−1) is 1-regular but not 0-regular, since H¹(P¹, O(−2)) ≅ k ≠ 0.
- `mumfordRegular_rank_one` (degenerate): If r = 1 (π an isomorphism) every quasi-coherent sheaf is m-regular for every m, there being no higher direct images.
- `mumfordRegular_field` (compatibility): For X = Spec k and E = k^{⊕r}, F coherent on P^{r−1}_k is 0-regular iff H^q(P^{r−1}_k, F(−q)) = 0 for all q ≥ 1: the classical Castelnuovo–Mumford condition reg(F) ≤ 0.
- `mumfordRegular_not_kernel_closed` (non-example): On P¹_k the Euler sequence 0 → O(−1) → O^{⊕2} → O(1) → 0 has O^{⊕2} and O(1) 0-regular but O(−1) not: MR is not closed under kernels of surjections, so the Resolution Theorem cannot replace Quillen's resolution.

**Acceptance.**

- F is m-regular iff F(n) is (m − n)-regular.
- O(n) on P^{r−1}_k (r ≥ 2) is m-regular iff n + m ≥ 0.
- A coherent sheaf on P(E) over noetherian X is m-regular for all m ≫ 0.

**Used by.**

- Thomason–Trobaugh 4.8 and K-book II.8.7.6: Quillen's functors T_i and the canonical resolution are defined on 0-regular sheaves
- Thomason–Trobaugh 4.9–4.11: K-theory of perfect complexes of 0-regular coherent sheaves computes K(P(E)); the approximation step lowers the regularity bound by the Koszul complex
- K-book II.8.7.10 and Lemma V.1.5.2: MR ⊂ VB(P) induces K(MR) ≃ K(P) through the filtration MR(n) = {F : F(−n) 0-regular}
- SchemeKTheoryOperations S.7 (splitting principle): flag-bundle arguments iterate the projective bundle theorem, whose proof runs through regular sheaves

**Depends on.** this roadmap: `S.5/projective-bundle-cohomology`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources.**

- `ThomasonTrobaugh.1990`, Section 4.7.0 (p. 331; PDF p. 85): “Let m be an integer. A quasi-coherent sheaf F on PE is said to be m-regular in the sense of Mumford if Rqπ∗(F(m − q)) = 0 for all q ≥ 1” — The definition, verbatim.
- `Kbook.2013`, Definition II.8.7.1 (PDF p. 158; book p. 150): “Deﬁnition 8.7.1. A quasicoherent OP-module F is called Mumford-regular if for all q > 0 the higher derived sheaves Rqπ∗F(−q) vanish.” — The case m = 0, in the K-book's rank convention.

### Basic properties of regular sheaves

`S.5/mumford-regularity-lemmas` · lemma

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). Let X be noetherian. (0) Every coherent F on P(E) is n-regular for all n ≥ m₀ := n₀ + r − 1, n₀ as in S.5/projective-bundle-cohomology(c). (1) For an exact sequence 0 → F → G → H → 0 of quasi-coherent sheaves: (a) if F and H are n-regular, G is n-regular; (b) if G is n-regular and F is (n + 1)-regular, H is n-regular; (c) if G is (n + 1)-regular, H is n-regular and π_*G(n) → π_*H(n) is surjective, then F is (n + 1)-regular. (2) If F is m-regular, then for all k ≥ m: (a) F is k-regular; (b) the multiplication π_*(F(k)) ⊗ E = π_*(F(k)) ⊗ π_*O(1) → π_*F(k + 1) is surjective; (c) π^*π_*F(k) → F(k) is surjective.

**Hypotheses.**

- X noetherian for (0); (1) and (2) hold over any base.
- E of constant rank r.

**Proof.**

1. (0): by S.5/projective-bundle-cohomology(b), (c), R^qπ_*(F(n − q)) = 0 for q ≥ r and for n − q ≥ n₀; take n ≥ n₀ + r − 1.
2. (1): the long exact sequence ⋯ → R^{q−1}π_*H(n − q) → R^qπ_*F(n − q) → R^qπ_*G(n − q) → R^qπ_*H(n − q) → R^{q+1}π_*F(n − q) → ⋯.
3. (2a): induction on k − m. Tensor the Koszul sequence (4.6.1) (S.5/projective-bundle-koszul) with F(k) and break it into short exact sequences 0 → Z_p → π^*(Λ^pE) ⊗ F(k − p) → Z_{p−1} → 0; each middle term is p-regular; descending induction on p from Z_r = 0 with (1b) shows Z_0 = F(k) is 1-regular, i.e. F is (k + 1)-regular.
4. (2b): the same sequences show Z_1 is 2-regular, so R¹π_*(Z_1(1)) = 0 and π_*(π^*E ⊗ F(k)) → π_*F(k + 1) is onto.
5. (2c): by (2b), Sym E ⊗ π_*F(k) → ⊕_{n≥0} π_*F(n + k) is a surjection of graded quasi-coherent O_X-algebra modules; applying Proj gives surjectivity of π^*π_*F(k) → F(k) (EGA II 3.2–3.4.4 as cited by Thomason–Trobaugh).

**Acceptance.**

- O(n) (n ≥ 0) and π^*N are 0-regular.
- On P¹_k, the skyscraper at a closed point is m-regular for every m.
- The surjectivity (2c) fails for O(−1) on P¹_k, which is not 0-regular: π_*O(−1) = 0.

**Depends on.** this roadmap: `S.5/mumford-regularity`, `S.5/projective-bundle-cohomology`, `S.5/projective-bundle-koszul`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources.**

- `ThomasonTrobaugh.1990`, Section 4.7.0 (p. 331; PDF p. 85): “If F is a coherent sheaf on PE, there exists an integer m0 such that F is n-regular for all n ≥ m0.” — Part (0).
- `ThomasonTrobaugh.1990`, Lemma 4.7.1 (p. 332; PDF p. 86): “(a) If F and H are n-regular, G is n-regular. (b) If G is n-regular and F is (n + 1)-regular, then H is n-regular.” — Parts (1a), (1b).
- `ThomasonTrobaugh.1990`, Lemma 4.7.2 (p. 332; PDF p. 86): “If F is m-regular on PE, then for all k ≥ m we have that: (a) F is k-regular.” — Part (2a); (2b), (2c) follow in the source.

### Quillen's canonical resolution of a regular sheaf

`S.5/quillen-resolution` · construction · planet “Quillen's Resolution Theorem”

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). Let X be noetherian. For quasi-coherent F on P(E) define inductively Z_{−1}F := F, T_nF := π_*((Z_{n−1}F)(n)) (a quasi-coherent O_X-module) and Z_nF := ker(O(−n) ⊗ π^*T_nF → Z_{n−1}F) for n ≥ 0. If F is 0-regular then: (a) each (Z_{n−1}F)(n) is 0-regular, the sequences 0 → (Z_nF)(n) → π^*T_nF → (Z_{n−1}F)(n) → 0 are exact and π_*((Z_nF)(n)) = 0; (b) Z_{r−1}F = 0; (c) T_0, …, T_{r−1} are exact functors from 0-regular coherent sheaves to coherent sheaves on X, with a functorial exact sequence 0 → O(−r + 1) ⊗ π^*T_{r−1}F → ⋯ → O(−1) ⊗ π^*T_1F → O ⊗ π^*T_0F → F → 0; (d) applied degreewise to strict bounded complexes of 0-regular coherent sheaves, the T_i preserve mapping cones, acyclic complexes, quasi-isomorphisms and acyclicity off π⁻¹(Y); (e) for such a complex F^• and 0 ≤ k ≤ r − 1 there is an exact sequence of complexes 0 → T_k(F^•) → E ⊗ T_{k−1}(F^•) → ⋯ → Sym^kE ⊗ T_0(F^•) → π_*F^•(k) → 0, and if F^• is perfect so is every T_k(F^•); (f) if F is a vector bundle, the T_iF are vector bundles.

**Hypotheses.**

- X noetherian; E of constant rank r ≥ 1; F 0-regular (coherent for (c)–(f)).

**Proof.**

1. (a) by induction on n: (Z_{−1}F)(0) = F is 0-regular; π^*T_n F = π^*π_*((Z_{n−1}F)(n)) → (Z_{n−1}F)(n) is surjective (S.5/mumford-regularity-lemmas (2c)) and π_*π^*T_n → π_*((Z_{n−1}F)(n)) is an isomorphism (π_*π^* = 1), so π_*((Z_nF)(n)) = 0 and (1c) makes (Z_nF)(n + 1) 0-regular.
2. π_* is exact on 0-regular sheaves (they are π_*-acyclic), so by induction Z_{n−1} and T_n are exact functors.
3. (b): from the long exact sequences of (4.8.1), π_*((Z_nF)(n)) = 0 and S.5/projective-bundle-cohomology(e), ascending induction on q gives R^qπ_*((Z_{n+q}F)(n)) = 0; R^qπ_* = 0 for q ≥ r then makes (Z_{r−1}F)(r − 1) 0-regular with π_* = 0, hence zero by (2c).
4. (c): tensor (4.8.1) with O(−n) and splice for n = 0, …, r − 1.
5. (d): for an acyclic strict bounded complex of 0-regular sheaves, increasing induction with 0 → Z^nF → F^n → B^{n+1}F → 0 and Lemma 4.7.1(b), 4.7.2(a) shows the cycles are 0-regular, so the exact T_i preserve the short exact sequences and T_iF^• is acyclic; apply to mapping cones.
6. (e): tensor the resolution (c) with O(k), 0 ≤ k ≤ r − 1, apply π_* and S.5/projective-bundle-cohomology; if F^• is perfect, π_*F^• = T_0(F^•) is perfect (π proper and flat, S.2/proper-perfect-pushforward-perfect), and ascending induction on k with the two-out-of-three property of perfect complexes (S.1/perfect-triangulated-and-thick) makes each T_k(F^•) perfect.
7. (f): for a vector bundle F the exact sequence of (e) and Lemma 8.7.5(3) of the K-book show inductively that the T_iF are vector bundles (K-book Corollary II.8.7.9).

**API.**

- `quillenT` (constructor): The functor T_n: 0-regular coherent sheaves on P(E) → coherent sheaves on X, T_nF = π_*((Z_{n−1}F)(n)).
- `quillenZ` (constructor): The functor Z_n with Z_{−1} = id and Z_nF = ker(O(−n) ⊗ π^*T_nF → Z_{n−1}F).
- `quillenResolution` (data): The natural exact sequence 0 → O(−r+1) ⊗ π^*T_{r−1}F → ⋯ → O ⊗ π^*T_0F → F → 0.
- `quillenT_exact` (structure): Each T_i is an exact functor on MR(E), and on MR_perf(E) it preserves cofibrations, cones and quasi-isomorphisms.
- `quillenT_zero` (simp): T_0 = π_* on 0-regular sheaves.
- `quillenT_pullback` (simp): T_0(π^*N) = N and T_i(π^*N) = 0 for i ≥ 1.
- `quillenZ_last` (characterisation): Z_{r−1}F = 0 for F 0-regular.
- `quillenT_perfect` (compatibility): If F^• ∈ MR_perf(E) then T_kF^• is a perfect complex on X, acyclic off Y if F^• is acyclic off π⁻¹(Y).
- `quillenT_vectorBundle` (compatibility): If F is a 0-regular vector bundle, each T_iF is a vector bundle (K-book II.8.7.9).
- `quillenResolution_class` (relation): [F] = Σ_{k=0}^{r−1} (−1)^k [O(−k) ⊗ π^*T_kF] in K_0(P(E)).

**Unit tests.**

- `quillenResolution_P1_O1` (computation): On P¹_k, F = O(1): T_0F ≅ k², Z_0F ≅ O(−1), T_1F ≅ k, Z_1F = 0, and the resolution is 0 → O(−1) → O^{⊕2} → O(1) → 0.
- `quillenResolution_pullback` (degenerate): For F = π^*N: T_0F = N, Z_0F = 0, all higher T_i vanish, and the resolution is the identity π^*N → π^*N.
- `quillenResolution_class_compat` (compatibility): Composed with u(a_0, …, a_{r−1}) = Σ π^*a_k ⊗ O(−k), the map [F] ↦ ([T_0F], −[T_1F], …, (−1)^{r−1}[T_{r−1}F]) is the identity on K_0 of 0-regular sheaves; it is the K-book's t of II.8.5 with its rank r + 1 relabelled.
- `quillenResolution_needs_regularity` (non-example): For F = O(−1) on P¹_k (not 0-regular), T_0F = π_*O(−1) = 0, so Z_0F = 0 and T_1F = 0; the displayed complex is 0 → 0 → 0 → O(−1) → 0, not exact: the construction requires 0-regularity.

**Acceptance.**

- On P¹_k and F = O(1): T_0F = k², Z_0F = O(−1), T_1F = k, and the resolution is the Euler sequence 0 → O(−1) → O^{⊕2} → O(1) → 0.
- T_0(π^*N) = N and T_i(π^*N) = 0 for i ≥ 1.
- In K_0: [F] = Σ_{k=0}^{r−1} (−1)^k [O(−k) ⊗ π^*T_kF].

**Used by.**

- Thomason–Trobaugh 4.9, 4.11: the natural quasi-isomorphism I(A) ≃ Tot[O(−r+1) ⊗ π^*T_{r−1}A → ⋯ → O ⊗ π^*T_0A] and additivity give the splitting map (T_0, −T_1, …, (−1)^{r−1}T_{r−1}) of the projective bundle theorem
- K-book II.8.5 proof and Theorem V.1.5 proof: the homomorphism t: K_0MR → K_0(X)^{r+1}, [F] ↦ ([T_0F], −[T_1F], …) and its higher analogue
- Thomason 1993, Lemma 2.5 and 2.7: the blow-up formula's acyclicity criterion uses the same Koszul and regularity mechanism on P(N)

**Depends on.** this roadmap: `S.5/mumford-regularity`, `S.5/mumford-regularity-lemmas`, `S.5/projective-bundle-cohomology`, `S.5/projective-bundle-koszul`, `S.2/proper-perfect-pushforward-perfect`, `S.1/perfect-triangulated-and-thick`.

**Sources.**

- `ThomasonTrobaugh.1990`, Section 4.8 (p. 333; PDF p. 87): “For any quasi-coherent F on PE, we inductively define quasi-coherent sheaves TnF on X and ZnF on PE. We start with Z−1F = F. Let TnF = π∗((Zn−1F)(n)), and let ZnF be the kernel of the product map O(−n) ⊗ π∗TnF → Zn−1F” — The construction.
- `ThomasonTrobaugh.1990`, Lemma 4.8.4 [4.8.3] (p. 334; PDF p. 88): “On the exact category of 0-regular coherent sheaves on PE, there are exact functors Ti, i = 0, 1, 2, ..., r − 1, to the category of coherent sheaves on X, and a functorial exact sequence on PE:” — Part (c); the lemma is printed as 4.8.4 but cited as 4.8.3 (source issue).
- `ThomasonTrobaugh.1990`, Section 4.8.5 (p. 334; PDF p. 88): “Suppose now that F· is perfect. Then π∗F· = T0(F·) is perfect by 2.7 for the proper flat π : PE → X. By ascending induction on k, using (4.8.5.1) and 2.2.13(b), it follows that Tk(F·) is perfect.” — Part (e).
- `Kbook.2013`, Theorem II.8.7.8 (PDF p. 159; book p. 151): “Theorem 8.7.8 (Quillen’s Resolution Theorem). Let F be a vector bundle on P(E), rank(E) = r + 1. If F is Mumford-regular then Zr = 0” — The K-book's statement, rank r + 1.

### The projective bundle map is split injective

`S.5/pbt-split-injection` · lemma

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). Let X be noetherian, Y ⊂ X closed, and u := Σ_{k=0}^{r−1} (O(−k) ⊗ π^*(−)): ∏_{k=0}^{r−1} K(X on Y) → K(P(E) on P(E)_Y), and v := (Rπ_*(−), Rπ_*(− ⊗ O(1)), …, Rπ_*(− ⊗ O(r−1))): K(P(E) on P(E)_Y) → ∏_{k=0}^{r−1} K(X on Y). Then v ∘ u is represented by the r × r matrix with entries Rπ_*(O(n − k)) ⊗ (−) = Sym^{n−k}E ⊗ (−) for n ≥ k and 0 for n < k; it is lower triangular with identity diagonal, hence a homotopy equivalence, and u is a split monomorphism in the homotopy category of spectra.

**Hypotheses.**

- X noetherian (or quasi-compact and quasi-separated: the argument is formal once π_* is defined); Y closed with X − Y quasi-compact.
- K is S.2's non-connective K-theory; π is proper, flat and perfect, so Rπ_* preserves perfect complexes (S.2/k-theory-proper-pushforward).

**Proof.**

1. Each entry of v ∘ u is induced by the exact functor E^• ↦ Rπ_*(O(n − k) ⊗ π^*E^•) ≃ Rπ_*(O(n − k)) ⊗ E^• (S.2/derived-projection-formula).
2. By S.5/projective-bundle-cohomology, Rπ_*O(n − k) = 0 for 0 ≤ n < k ≤ r − 1 (then −(r−1) ≤ n − k < 0) and Rπ_*O = O_X; so the matrix has zeros above the diagonal and identities on it (additivity, GeneralAlgebraicKTheory K.4/waldhausen-additivity-theorem, identifies the map induced by a sum of exact functors with the sum of the maps).
3. A lower unitriangular matrix of self-maps of a finite product of spectra is invertible (its inverse is the finite Neumann series), so v ∘ u is a homotopy equivalence and v ∘ u composed with its inverse splits u.

**Acceptance.**

- For r = 2: v ∘ u = [[1, 0], [E ⊗ −, 1]].
- For r = 1: u = v = id.
- For X = Spec k and r = 2: v(u(a_0, a_1)) = (a_0, 2a_0 + a_1), since Rπ_*O(1) = k² and Rπ_*O(−1) = 0.

**Depends on.** this roadmap: `S.5/projective-bundle-cohomology`, `S.2/k-theory-proper-pushforward`, `S.2/derived-projection-formula`, `S.2/k-theory-pullback`, `S.1/perfect-derived-tensor`, `S.2/nonconnective-k-theory-of-a-scheme`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-additivity-theorem`.

**Sources.**

- `ThomasonTrobaugh.1990`, Section 4.10 (p. 335; PDF p. 89): “The formulae of 4.5 show that Rπ∗(O(n − k) ⊗ π∗E·) = 0 for 0 ≤ n < k ≤ r − 1, and that Rπ∗(O ⊗ π∗E·) ≃ Rπ∗π∗E· ≃ E·, for E· any complex of quasi-coherent sheaves on X.” — The vanishing that makes the matrix triangular.
- `ThomasonTrobaugh.1990`, Section 4.10 (p. 335; PDF p. 89): “The calculation of the preceding paragraph shows that this matrix has 0's above the diagonal and has 1's along the diagonal. Thus the matrix is invertible” — The conclusion.

### Regular perfect complexes compute the K-theory of the projective bundle

`S.5/pbt-regular-approximation` · lemma

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). Let X be noetherian, Y ⊂ X closed, A := perfect strict bounded complexes of 0-regular coherent sheaves on P(E) (acyclic off P(E)_Y for the version with supports) and B := all perfect strict bounded complexes of coherent sheaves on P(E) (acyclic off P(E)_Y). Then (a) the inclusion I: A → B induces K(A) ≃ K(B), and K(B) ≃ K(P(E) on P(E)_Y); (b) on K(A), I ≃ Σ_{k=0}^{r−1} (−1)^k O(−k) ⊗ π^*T_k, so I factors through u: ∏^r K(X on Y) → K(P(E) on P(E)_Y) via (T_0, −T_1, …, (−1)^{r−1}T_{r−1}); hence u is a split epimorphism in the homotopy category of spectra.

**Hypotheses.**

- X noetherian; Y ⊂ X closed.
- Weak equivalences are quasi-isomorphisms; the approximation criterion is Thomason–Trobaugh 1.9.8 with the hypothesis added in Thomason 1993 §4 (source issue), which holds for complexes with quasi-isomorphisms.

**Proof.**

1. (a) By the approximation criterion (GeneralAlgebraicKTheory K.4/waldhausen-approximation-theorem; for the non-connective K, the derived invariance of K.6/nonconnective-spectrum-and-derived-invariance), it suffices that every B^• ∈ B receives a quasi-isomorphism B^• → A^• with A^• ∈ A.
2. By S.5/mumford-regularity-lemmas (0) there is n with every B^i n-regular; if n ≤ 0 then B^• ∈ A by (2a). Otherwise descend on n: tensoring the locally split Koszul sequence (4.6.2) (S.5/projective-bundle-koszul) with B^• gives a quasi-isomorphism B^• → B′^• := Tot[π^*E^∨ ⊗ B^•(1) → ⋯ → π^*Λ^rE^∨ ⊗ B^•(r)], whose terms are (n − 1)-regular; by induction B′^• → A^•.
3. K(B) ≃ K(P(E) on P(E)_Y) because P(E) is noetherian and perfect complexes are quasi-isomorphic to strict bounded complexes of coherent sheaves (S.1/perfect-waldhausen-models, S.2/k-theory-model-invariance).
4. (b) By S.5/quillen-resolution, I(A^•) is naturally quasi-isomorphic to the total complex of O(−k) ⊗ π^*T_kA^•; filtering it with these as subquotients and applying additivity (GeneralAlgebraicKTheory K.4/waldhausen-additivity-theorem) gives I ≃ Σ(−1)^k O(−k) ⊗ π^*T_k, which is u ∘ (T_0, −T_1, …); since I is an equivalence, u is split surjective.

**Acceptance.**

- For X = Spec k and B^• = O(−1) on P¹_k (1-regular, not 0-regular), one Koszul step replaces it by the quasi-isomorphic complex [O^{⊕2} → O(1)] of 0-regular sheaves (the Euler sequence 0 → O(−1) → O^{⊕2} → O(1) → 0).
- For r = 1, A = B.
- On K_0 the splitting reads [F] = Σ(−1)^k[O(−k)][π^*T_kF] for F 0-regular.

**Depends on.** this roadmap: `S.5/mumford-regularity`, `S.5/mumford-regularity-lemmas`, `S.5/quillen-resolution`, `S.5/projective-bundle-koszul`, `S.5/pbt-split-injection`, `S.1/perfect-waldhausen-models`, `S.2/k-theory-model-invariance`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`, `GeneralAlgebraicKTheory:K.4/waldhausen-additivity-theorem`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`.

**Sources.**

- `ThomasonTrobaugh.1990`, Section 4.9 (p. 335; PDF p. 89): “A: perfect strict bounded complexes of 0-regular coherent sheaves on PEX (resp., such as are also acyclic on PEX − PEY).” — The category A.
- `ThomasonTrobaugh.1990`, Section 4.11 (p. 336; PDF p. 90): “Thus it suffices to show that I : K(A) → K(B) is a homotopy equivalence. This will follow from the approximation theorem in the form 1.9.8, set up by the dual of 1.9.7, once we show that for every B· in B there is an A· in A and a quasi-isomorphism B· ∼→ A·.” — Part (a) and its reduction.
- `ThomasonTrobaugh.1990`, Section 4.11 (p. 336; PDF p. 90): “Tensoring the (locally split) exact Koszul sequence (4.6.2) with B· yields an exact sequence of complexes.” — The induction step.

### Projective bundle theorem over a noetherian base

`S.5/projective-bundle-theorem-noetherian` · theorem

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). Let X be noetherian and Y ⊂ X closed. Then u: ∏_{i=0}^{r−1} K(X on Y) → K(P(E) on P(E)_Y), (x_0, …, x_{r−1}) ↦ Σ_{i=0}^{r−1} π^*(x_i) ⊗ [O(−i)], is a homotopy equivalence of S.2's non-connective K-theory spectra (the absolute case Y = X included), with homotopy inverse given by either splitting map of S.5/pbt-split-injection or S.5/pbt-regular-approximation.

**Hypotheses.**

- X noetherian; Y ⊂ X closed; E of constant rank r ≥ 1.

**Proof.**

1. u is split mono (S.5/pbt-split-injection) and split epi (S.5/pbt-regular-approximation) in the homotopy category of spectra; a map with a left and a right inverse is an isomorphism, so u is a homotopy equivalence and both splittings are homotopy inverses.
2. The arguments use only additivity, derived invariance and the models of perfect complexes, all of which hold for the non-connective K (GeneralAlgebraicKTheory K.6/nonconnective-spectrum-and-derived-invariance); hence the equivalence holds in every degree n ∈ ℤ.

**Acceptance.**

- K_n(P^{r−1}_k) ≅ K_n(k)^r for a field k, all n.
- r = 1: u = id.
- With supports: K_n(P(E) on P(E)_Y) ≅ K_n(X on Y)^r.

**Depends on.** this roadmap: `S.5/pbt-split-injection`, `S.5/pbt-regular-approximation`, `S.3/support-k-theory`; other roadmaps: `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`.

**Sources.**

- `ThomasonTrobaugh.1990`, Section 4.12 (p. 336; PDF p. 90): “We have shown that ∏r K(C) → K(B) is both split mono and split epi in the homotopy category of spectra. It follows that this map is a homotopy equivalence, with homotopy inverse given by either of the splitting maps.” — The conclusion.
- `Kbook.2013`, Variant V.1.5.3 (PDF p. 378; book p. 370): “Theorem 1.5 remains valid if X is noetherian instead of quasiprojective, but the proof is more intricate because in this case K(X) is deﬁned to be KChperf(X)” — The noetherian generality with K = K of perfect complexes.

### Projective space bundle theorem

`S.5/projective-bundle-theorem` · theorem · planet “Projective space bundle theorem”

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). Let X be quasi-compact and quasi-separated and Y ⊂ X closed with X − Y quasi-compact. Then u: ∏_{i=0}^{r−1} K(X on Y) → K(P(E) on P(E)_Y), (x_0, …, x_{r−1}) ↦ Σ_{i=0}^{r−1} π^*(x_i) ⊗ [O(−i)], is a natural homotopy equivalence of S.2's non-connective K-theory spectra; in particular K_n(P(E)) ≅ ⊕_{i=0}^{r−1} K_n(X) for all n ∈ ℤ, the i-th summand embedded by x ↦ π^*x ⊗ [O(−i)]. In degree zero: K_0(P(E)) is a free K_0(X)-module (through π^* and ⊗) with basis 1 = [O], [O(−1)], …, [O(−(r−1))]. The generators are the classes of the powers O(−i) = O(−1)^{⊗i} of the tautological line bundle.

**Hypotheses.**

- X quasi-compact and quasi-separated; Y ⊂ X closed with X − Y quasi-compact; E of constant rank r ≥ 1.
- Rank convention: the K-book writes rank E = r + 1 and the basis [O(−i)], 0 ≤ i ≤ r; Thomason–Trobaugh write rank r and 0 ≤ i ≤ r − 1, as here. EllipticKTheory's request writes ⊕_{i=0}^{r}, i.e. the K-book's convention.

**Proof.**

1. Absolute noetherian approximation (Thomason–Trobaugh C.9): X = lim X_α with affine bonding maps and each X_α of finite presentation over ℤ, hence noetherian; U = X − Y, E and P(E) descend to some X_α (EGA IV §8) with P(E) = lim P(E_α) (base change of P(E), R09.1).
2. Continuity of K (Thomason–Trobaugh 3.20 in non-negative degrees; GeneralAlgebraicKTheory K.7 filtered colimits for the non-connective groups): K(X on Y) ≃ colim_α K(X_α on Y_α) and K(P(E) on P(E)_Y) ≃ colim_α K(P(E_α) on P(E_α)_{Y_α}), compatibly with u.
3. S.5/projective-bundle-theorem-noetherian for each X_α and the colimit of equivalences give the result.
4. Degree zero: π_0 of u; the module structure is x·[O(−i)] = π^*x ⊗ [O(−i)] through S.2's pairing (S.2/tensor-product-pairings).

**Acceptance.**

- X = Spec k: K_0(P^{r−1}_k) ≅ ℤ^r with basis [O(−i)], 0 ≤ i ≤ r − 1; K_1(P^{r−1}_k) ≅ (k^×)^r.
- E trivial of rank n + 1: K(P^n_X) ≃ K(X)^{n+1}; with S.2's product, K_*(P^n_X) ≅ K_*(X)[z]/(z^{n+1}), z = 1 − [O(−1)] (K-book V.1.5.1 with its exponent corrected to n + 1; K_0(P^n_ℤ) = ℤ[z]/(z^{n+1}), II.8.6).
- r = 1: P(E) = X and u = id.
- Consumers: EllipticKTheory E.5 (projective line and projective bundles in all degrees), KTheoryLowDegrees Z.6 (the projective-bundle basis of K_0(P¹_F)), EllipticKTheory E.4 (K_1(P¹_F)); for a quasi-projective or divisorial X, K_0(P(E)) is also K_0 of vector bundles (S.2/vector-bundle-k-theory-comparison), which is the K-book's II.8.5.

**Depends on.** this roadmap: `S.5/projective-bundle-theorem-noetherian`, `S.2/k-theory-continuity`, `S.2/tensor-product-pairings`, `S.2/vector-bundle-k-theory-comparison`, `S.3/support-k-theory`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.1`, `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`, `AdicCoefficientsAndComparisons:L2`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 4.1 (p. 329; PDF p. 83): “Let X be a quasi-compact and quasi-separated scheme. Let Y be a closed subspace such that X − Y is quasi-compact. Let E be an algebraic vector bundle of rank r over X, and let π : PEX → X be the associated projective space bundle. Then there are natural homotopy equivalences” — The statement; the equivalences are (4.1.1), (4.1.2) given by (4.1.3).
- `ThomasonTrobaugh.1990`, Theorem 7.3 (p. 364; PDF p. 118): “Let E be a vector bundle of rank r on X. Then the maps sending (x0, x1, ..., xr−1) to Σπ∗(xi) ⊗ [O(−i)] (using the module structure of KB(PEX on PEY) over K(PEX)) induce homotopy equivalences:” — The non-connective statement.
- `ThomasonTrobaugh.1990`, Section 4.3 (p. 329; PDF p. 83): “We first reduce to the case where X is noetherian. By C.9, X is the inverse limit lim Xα of an inverse system of schemes in which all the bounding maps Xβ → Xα are affine” — The reduction step.
- `Kbook.2013`, Projective Bundle Theorem II.8.5 (PDF p. 157; book p. 149): “Let P be the projective space bundle of E over a quasi-compact scheme X. Then K0(P) is a free K0(X)-module with basis the twisting line bundles {1 = [OP], [OP(−1)], . . . , [OP(−r)]}.” — The degree-zero statement, rank E = r + 1.
- `Kbook.2013`, Projective Bundle Theorem V.1.5 (PDF p. 377; book p. 369): “Let P(E) be a projective bundle over a quasi-projective scheme X. Then the ui induce an equivalence K(X)r+1 ≃ K(P(E)).” — The K-book's higher statement.

### K-theory of the projective line

`S.5/projective-line-k-theory` · theorem

Let X be quasi-compact and quasi-separated and π: P¹_X = P(O_X^{⊕2}) → X. (a) (x_0, x_1) ↦ π^*x_0 + π^*x_1 ⊗ [O(−1)] is an isomorphism K_n(X) ⊕ K_n(X) ≅ K_n(P¹_X) for every n ∈ ℤ; equivalently {[O], [O] − [O(−1)]} and {[O], [O(1)]} are bases of K_*(P¹_X) over K_*(X). (b) For all m ∈ ℤ, [O(m − 1)] + [O(m + 1)] = 2[O(m)] in K_0(P¹_X), hence [O(m)] = (m + 1)[O] − m[O(−1)]. (c) Coordinates: for a = π^*x_0 + π^*x_1[O(−1)], π_*(a) = x_0 (π_* = Rπ_*, S.2's proper pushforward) and σ^*(a) = x_0 + x_1 for each of the two standard sections σ ∈ {0, ∞}: X → P¹_X (for which σ^*O(1) ≅ O_X); so the projective-bundle coordinates are recovered as x_0 = π_*(a), x_1 = σ^*(a) − π_*(a). (d) If X = Spec F for a field F: K_0(P¹_F) ≅ ℤ², a class of rank ρ = σ^*(a) and Euler characteristic χ = π_*(a) has coordinates (χ, ρ − χ), and [O(m)] has (rank, χ) = (1, m + 1), i.e. coordinates (m + 1, −m); the skyscraper at a rational point has class [O_∞] = [O] − [O(−1)]; K_1(P¹_F) ≅ F^× ⊕ F^×.

**Hypotheses.**

- X quasi-compact and quasi-separated; for (d), F a field.
- The comparison with the rank/Picard coordinates is KTheoryLowDegrees Z.6's; this node supplies the projective-bundle basis, the classes of all O(m) and the two functionals Z.6 compares with, without using Z.6.

**Proof.**

1. (a) S.5/projective-bundle-theorem with r = 2; the change to {[O], [O] − [O(−1)]} and to {[O], [O(1)]} is by the unimodular matrices [[1, 0], [1, −1]] and, using (b) with m = 0, [O(1)] = 2[O] − [O(−1)], by [[1, 0], [2, −1]].
2. (b) Tensor the Koszul sequence 0 → O(−2) → O(−1)^{⊕2} → O → 0 (S.5/projective-bundle-koszul, r = 2) with O(m + 1); induction on m in both directions gives [O(m)] = (m + 1)[O] − m[O(−1)].
3. (c) π_*(π^*x ⊗ [O(k)]) = x · [Rπ_*O(k)] (S.2/projection-formula), with Rπ_*O = O_X and Rπ_*O(−1) = 0 (S.5/projective-bundle-cohomology); for a standard section σ (the X-points given by the coordinate quotients O^{⊕2} → O), σ^*O(1) ≅ O_X, and π ∘ σ = id gives σ^*(π^*x ⊗ [O(k)]) = x.
4. (d) For X = Spec F: K_0(F) = ℤ (KTheoryLowDegrees Z.2/division-ring-k0) and K_1(F) = F^× (KTheoryLowDegrees U.3/K1-division-ring); Rπ_*O(m) has Euler characteristic m + 1 (S.5/projective-bundle-cohomology(e)); the exact sequence 0 → O(−1) → O → O_∞ → 0 gives [O_∞].

**Acceptance.**

- [O(1)] = 2[O] − [O(−1)] and [O(−2)] = 2[O(−1)] − [O] in K_0(P¹_X).
- π_*[O(m)] = (m + 1)·1 in K_0(X) for every m; σ^*[O(m)] = 1.
- For X = Spec F: the class of rank r and degree d (degree in Z.6's sense, deg = χ − rank on P¹) has projective-bundle coordinates (r + d, −d); Z.6 proves this change of basis against rank/Pic.
- SK_1-type check for EllipticKTheory E.4: K_1(P¹_F) = F^×[O] ⊕ F^×[O(−1)]; since O(−1) is trivial at the generic point, restriction to K_1(F(t)) = F(t)^× sends π^*x_0 + π^*x_1[O(−1)] to x_0x_1, so the image is F^× and the kernel is {π^*x·([O] − [O(−1)])} = F^×·[O_∞], matching E.4's SK_1(P¹_F) ≅ F^×.
- Compatibility with G-theory: for noetherian X, (π^*, ∞_*): G(X) ⊕ G(X) ≃ G(P¹_X) (K-book V.6.13.1) corresponds to the basis {[O], [O_∞]} = {[O], [O] − [O(−1)]} when X is regular.

**Depends on.** this roadmap: `S.5/projective-bundle-theorem`, `S.5/projective-bundle-koszul`, `S.5/projective-bundle-cohomology`, `S.2/projection-formula`, `S.2/k-theory-proper-pushforward`, `S.2/k-theory-pullback`; other roadmaps: `KTheoryLowDegrees:Z.2/division-ring-k0`, `KTheoryLowDegrees:U.3/K1-division-ring`.

**Sources.**

- `Kbook.2013`, Theorem V.1.5.4 (PDF p. 379; book p. 371): “Theorem 1.5.4. The functors u0, u1 induce an equivalence K(R) ⊕K(R) ≃ K(P1 R). In addition, (ui+1)∗+ (ui+1)∗≃(ui)∗+ (ui+2)∗for all i.” — Parts (a) and (b) for P¹ over a ring.
- `ThomasonTrobaugh.1990`, Theorem 6.1, proof (p. 352; PDF p. 106): “We prefer now to shift to a direct sum decomposition of K∗(P1X on P1Z) with basis {[O], [O] − [O(−1)]}.” — The basis used by the fundamental theorem.
- `Kbook.2013`, Corollary II.8.6 (PDF p. 157; book p. 149): “As a ring, K0(Pr Z) = Z[z]/(zr+1), where z = 1−[O(−1)].” — The relation (1 − [O(−1)])² = 0 for r = 1, whose additive form is (b).

### Polynomial and Laurent extensions of a scheme, and the groups NK

`S.5/laurent-extension-and-nk` · definition

For a scheme X put X[T] := X ×_{Spec ℤ} Spec ℤ[T] (Mathlib's affine line 𝔸(1; X) over X), X[T⁻¹] := X ×_ℤ Spec ℤ[T⁻¹] and X[T, T⁻¹] := X ×_ℤ Spec ℤ[T, T⁻¹], where ℤ[T, T⁻¹] is Mathlib's LaurentPolynomial ℤ, the localisation of ℤ[T] away from T. They come with the flat projections p: X[T] → X, p₋: X[T⁻¹] → X, the open immersions j₊: X[T, T⁻¹] → X[T], j₋: X[T, T⁻¹] → X[T⁻¹], the zero section z: X → X[T] (T ↦ 0), and the unit sections e: X → X[T], X → X[T, T⁻¹] (T ↦ 1); for a closed Z ⊂ X with X − Z quasi-compact, Z[T] etc. are the inverse images. For n ∈ ℤ define NK_n(X) := coker(p^*: K_n(X) → K_n(X[T])) (S.2's non-connective K), canonically ≅ ker(z^*: K_n(X[T]) → K_n(X)), and N₋K_n(X) := coker(p₋^*); similarly NK_n(X on Z). Thus K_n(X[T]) = p^*K_n(X) ⊕ ker(z^*).

**Hypotheses.**

- X any scheme; K-groups of X on Z need X quasi-compact and quasi-separated with X − Z quasi-compact.
- K is S.2's non-connective K-theory; pullback is S.2's derived pullback, defined for every morphism.

**Proof.**

1. Form the fibre products with Spec ℤ[T], Spec ℤ[T⁻¹], Spec ℤ[T, T⁻¹] (mathlib AlgebraicGeometry.AffineSpace for X[T]; LaurentPolynomial ℤ and LaurentPolynomial.isLocalization identify X[T, T⁻¹] with the open subscheme T ≠ 0 of X[T]).
2. z^*p^* = id (p ∘ z = id_X), so p^* is split injective and coker(p^*) ≅ ker(z^*) canonically (S.2/k-theory-pullback).
3. The automorphism T ↦ T⁻¹ of ℤ[T, T⁻¹] exchanges X[T] and X[T⁻¹] over X, so N₋K_n(X) ≅ NK_n(X).
4. Functoriality: a morphism f: X′ → X induces f[T]: X′[T] → X[T] commuting with p and z, hence NK_n(X) → NK_n(X′).

**API.**

- `Scheme.polynomialExtension` (constructor): X[T] := pullback of X → Spec ℤ and Spec ℤ[T] → Spec ℤ, with p, z and e; it is Mathlib's 𝔸(1; X).
- `Scheme.laurentExtension` (constructor): X[T, T⁻¹] := pullback of X → Spec ℤ and Spec (LaurentPolynomial ℤ) → Spec ℤ, with j₊, j₋ and e.
- `laurentExtension_isOpen` (compatibility): j₊: X[T, T⁻¹] → X[T] is the open immersion of the locus T ≠ 0 (LaurentPolynomial.isLocalization).
- `NK` (constructor): NK_n(X on Z) := coker(p^*: K_n(X on Z) → K_n(X[T] on Z[T])).
- `NK_eq_ker` (characterisation): The composite ker(z^*) → K_n(X[T]) → NK_n(X) is an isomorphism.
- `K_polynomialExtension_split` (relation): K_n(X[T]) ≅ K_n(X) ⊕ NK_n(X), naturally in X.
- `NK.map` (functoriality): A morphism f: X′ → X induces NK_n(f): NK_n(X) → NK_n(X′), with NK_n(id) = id and NK_n(g ∘ f) = NK_n(f) ∘ NK_n(g).
- `NK_inv` (relation): T ↦ T⁻¹ gives N₋K_n(X) ≅ NK_n(X).
- `NK_affine` (compatibility): Under S.2/affine-k-theory-comparison, NK_n(Spec R) ≅ NK_n(R) of GeneralAlgebraicKTheory K.6.
- `NK_eq_zero_of_regular` (example): X regular noetherian ⇒ NK_n(X) = 0 for all n (S.5/homotopy-invariance-regular).

**Unit tests.**

- `NK_one_dualNumbers` (computation): For X = Spec k[ε] (k a field): the unit 1 + εT of k[ε][T] (a unit by Polynomial.isUnit_iff_coeff_isUnit_isNilpotent) has non-zero image in NK_1(X), and NK_1(X) ≅ (1 + εT·k[T])^× ≅ (T·k[T], +) (K-book Example III.3.8.1).
- `NK_field` (degenerate): NK_n(Spec F) = 0 for every field F and every n ∈ ℤ, and NK_n(∅) = 0.
- `NK_affine_compat` (compatibility): For X = Spec R, NK_n(X) ≅ NK_n(R) := K_n(R[T])/K_n(R) of GeneralAlgebraicKTheory K.6, compatibly with the maps induced by ring homomorphisms.
- `NK_sections_differ` (non-example): ker(z^*) and ker(e^*) are different complements of p^*K_1(X) in K_1(X[T]) for X = Spec k[ε]: [1 + εT] lies in ker(z^*) (T ↦ 0 gives 1) but e^*[1 + εT] = [1 + ε] ≠ 1; only the quotient NK_n is canonical.

**Acceptance.**

- NK_n(Spec F) = 0 for a field F and all n (S.5/homotopy-invariance-regular).
- NK_1(Spec k[ε]) ≅ (1 + εT·k[T])^× ≠ 0.
- For X = Spec R, NK_n(X) is GeneralAlgebraicKTheory K.6's NK_n(R).

**Used by.**

- K-book V.8.2–V.8.3 and Thomason–Trobaugh 6.1, 6.6: the four-term exact sequence of the fundamental theorem is formed from K of X, X[T], X[T⁻¹], X[T, T⁻¹]
- K-book III.3 and GeneralAlgebraicKTheory K.6: NK_n(R) measures the failure of homotopy invariance; Nil_n(R) ≅ NK_{n+1}(R)
- S.5/homotopy-invariance-regular: NK_n(X) = 0 for regular noetherian X
- Thomason 1993, §2.6: the blow-up formula is extended to negative degrees through the Laurent extensions X[T, T⁻¹]
- Thomason–Trobaugh 6.7 and 7.1–7.4: negative K-groups are retracts of K_0 of iterated Laurent extensions

**Depends on.** this roadmap: `S.2/k-theory-pullback`, `S.2/nonconnective-k-theory-of-a-scheme`; libraries: `mathlib:AlgebraicGeometry.AffineSpace`, `mathlib:LaurentPolynomial`, `mathlib:LaurentPolynomial.isLocalization`, `mathlib:Polynomial.isUnit_iff_coeff_isUnit_isNilpotent`.

**Sources.**

- `Kbook.2013`, Section V.8, Theorem V.8.3 (PDF p. 439; book p. 431): “For every scheme X, let X[t] and X[t, t−1] denote the schemes X × Spec(Z[t]) and X × Spec(Z[t, t−1]) respectively.” — The definition of the extensions.
- `Kbook.2013`, Example III.3.8.1 (PDF p. 215; book p. 207): “If R is a commutative regular ring, and A = R[x]/(xN), it follows from 2.4 and 3.8 that SK1(A[t]) = SK1(A) and hence (by 3.5.3 and 3.12) Nil0(A) ∼= NK1(A) ∼= (1 + tA[t])× = (1 + xtA[t])×.” — The computational test, with R = k and N = 2.

### Bass fundamental theorem for schemes

`S.5/bass-fundamental-theorem` · theorem · planet “Bass fundamental theorem”

Let X be quasi-compact and quasi-separated and Z ⊂ X closed with X − Z quasi-compact. For every n ∈ ℤ there is a natural exact sequence 0 → K_n(X on Z) →(p^*, p₋^*) K_n(X[T] on Z[T]) ⊕ K_n(X[T⁻¹] on Z[T⁻¹]) →(j₊^* − j₋^*) K_n(X[T, T⁻¹] on Z[T, T⁻¹]) →(∂_T) K_{n−1}(X on Z) → 0 of S.2's non-connective K-groups, where ∂_T is the Mayer–Vietoris boundary of the cover P¹_X = X[T] ∪ X[T⁻¹] followed by projection of K_{n−1}(P¹_X on P¹_Z) onto the coefficient of [O] − [O(−1)]. It comes from a homotopy fibre sequence of spectra K(X on Z) → K(X[T] on Z[T]) ∪_{K(X on Z)} K(X[T⁻¹] on Z[T⁻¹]) → K(X[T, T⁻¹] on Z[T, T⁻¹]) → ΣK(X on Z). Consequently (Bass contraction) K_{n−1}(X on Z) ≅ coker(K_n(X[T]) ⊕ K_n(X[T⁻¹]) → K_n(X[T, T⁻¹])) naturally, for every n ∈ ℤ.

**Hypotheses.**

- X quasi-compact and quasi-separated; Z closed with X − Z quasi-compact (absolute case Z = X).
- K is S.2's non-connective K; the proof uses S.4's Zariski Mayer–Vietoris squares and S.3's supports in all degrees, and does not use any comparison with Thomason–Trobaugh's K^B.

**Proof.**

1. The standard cover P¹_X = X[T] ∪ X[T⁻¹] (the two standard opens D_+(T_0), D_+(T_1) of Proj ℤ[T_0, T_1], mathlib Proj.awayι, with T = T_1/T_0), with intersection X[T, T⁻¹], gives a homotopy cartesian square of non-connective K-theory with supports (S.4's Mayer–Vietoris; equivalently S.3's localization with excision, as in Thomason–Trobaugh (6.1.2)), hence a long exact sequence ⋯ → K_{n+1}(X[T, T⁻¹]) →(∂) K_n(P¹_X) →(k₁^*, −k₂^*) K_n(X[T]) ⊕ K_n(X[T⁻¹]) → K_n(X[T, T⁻¹]) → ⋯ (all with supports).
2. By S.5/projective-line-k-theory (with supports, from S.5/projective-bundle-theorem), K_n(P¹_X on P¹_Z) = K_n(X on Z)·[O] ⊕ K_n(X on Z)·([O] − [O(−1)]).
3. On the standard opens O(−1) restricts to the trivial line bundle, so k^*[O] = k^*[O(−1)] = 1: on the first summand k₁^* = p^* and k₂^* = p₋^*, split injective by the zero sections (S.5/laurent-extension-and-nk), and on the second summand k₁^* = k₂^* = 0.
4. Hence ∂ maps onto the second summand and (k₁^*, −k₂^*) is injective on the first; the long exact sequence breaks into short exact sequences which, rearranged, are the displayed four-term sequence (Thomason–Trobaugh 6.1(a), now in every degree since the square is one of non-connective spectra).
5. Naturality in (X, Z) follows from naturality of the Mayer–Vietoris square under pullback; the spectrum-level statement is the homotopy cartesian square with the split summand removed.
6. The Bass contraction is exactness at the two right-hand terms.

**Acceptance.**

- X regular noetherian: NK = 0 and the sequence reduces to S.5/laurent-decomposition-regular.
- X = Spec ℤ, n = 1: 0 → {±1} → {±1} ⊕ {±1} → K_1(ℤ[T, T⁻¹]) → ℤ → 0 with K_1(ℤ[T, T⁻¹]) = {±1} × T^ℤ.
- n = 0 identifies K_{−1}(X) with coker(K_0(X[T]) ⊕ K_0(X[T⁻¹]) → K_0(X[T, T⁻¹])), Bass's definition of K_{−1} (K-book V.8.3.2, Thomason–Trobaugh 6.2).
- For X = Spec R it is GeneralAlgebraicKTheory K.6's ring fundamental theorem (S.5/affine-fundamental-theorem-comparison).
- Supplies GeneralAlgebraicKTheory K.6's request for the fundamental theorem for schemes.

**Depends on.** this roadmap: `S.5/projective-line-k-theory`, `S.5/projective-bundle-theorem`, `S.5/laurent-extension-and-nk`, `S.4/zariski-mayer-vietoris`, `S.2/k-theory-pullback`, `S.2/nonconnective-k-theory-of-a-scheme`, `S.3/support-k-theory`, `S.3/localisation-fibre-sequence`, `S.3/excision`; libraries: `mathlib:AlgebraicGeometry.Proj.awayι`, `mathlib:AlgebraicGeometry.«Proj»`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 6.6(b) (p. 361; PDF p. 115): “Let X be a quasi-compact and quasi-separated scheme, and let Z ⊂ X be a closed subscheme with X − Z quasi-compact.” — The hypotheses of the Bass fundamental theorem; (b) gives the exact sequences for all n ∈ ℤ.
- `ThomasonTrobaugh.1990`, Theorem 6.1, proof (p. 353; PDF p. 107): “Now for k = k1 and k2, k∗(OP(i)) = O. Hence k∗([O]) = [O] = 1, and k∗([O]−[O(−1)]) = [O]−[O] = 0 in K0(Z[T]) or K0(Z[T−1]).” — The computation of the restriction maps.
- `ThomasonTrobaugh.1990`, Theorem 6.1, proof (p. 353; PDF p. 107): “Hence in (6.1.3) the boundary map ∂T is onto this summand. Thus the long exact sequence (6.1.3) breaks up into short exact sequences, yielding 6.1(a).” — The conclusion of the exactness argument.
- `Kbook.2013`, Theorem V.8.3 (PDF p. 439; book p. 431): “Theorem 8.3. For every quasi-projective scheme X we have canonically split exact sequences for all n, where the splitting of ∂is by multiplication by t.” — The K-book's form, for quasi-projective X.

### The boundary of the fundamental theorem is split by the unit T

`S.5/bass-boundary-splitting` · theorem

In the setting of S.5/bass-fundamental-theorem, let [T] ∈ K_1(Spec ℤ[T, T⁻¹]) be the class of the unit T (KTheoryLowDegrees U.3/units-to-K1, through S.2/affine-k-theory-comparison), and for x ∈ K_n(X on Z) put T ∪ x := q^*[T] · r^*x ∈ K_{n+1}(X[T, T⁻¹] on Z[T, T⁻¹]), with q: X[T, T⁻¹] → Spec ℤ[T, T⁻¹], r: X[T, T⁻¹] → X and S.2's pairing. Then ε := ∂_T(T) ∈ K_0(Spec ℤ) = ℤ is a universal sign, ε ∈ {±1}, and ∂_T(T ∪ x) = ε·x for all n ∈ ℤ and x. Hence h_T := ε·(T ∪ −): K_n(X on Z) → K_{n+1}(X[T, T⁻¹] on Z[T, T⁻¹]) is a natural splitting of ∂_T.

**Hypotheses.**

- As in S.5/bass-fundamental-theorem.
- The value ε = 1 depends on the sign conventions of the Mayer–Vietoris boundary; Thomason–Trobaugh assert ε = 1 without printing the calculation (source issue); the K-book's convention, with the localization boundary, gives ∂(t) = [ℤ[t]/tℤ[t]] = 1.

**Proof.**

1. Module structure: r^*x is the restriction of π^*x from P¹_X, and the Mayer–Vietoris square of S.5/bass-fundamental-theorem is a square of module spectra over K(P¹_X) under S.2's pairing; compatibility of products with Mayer–Vietoris and localization boundaries (requested from GeneralAlgebraicKTheory K.7) gives ∂(q^*[T] · r^*x) = ∂(q^*[T]) · π^*x in K_n(P¹_X on P¹_Z).
2. Naturality of the Mayer–Vietoris square along P¹_X → P¹_ℤ gives ∂(q^*[T]) = (pullback of) ∂_ℤ[T] ∈ K_0(P¹_ℤ).
3. Computation over ℤ: by S.5/bass-fundamental-theorem for X = Spec ℤ and n = 1, ∂: K_1(ℤ[T, T⁻¹]) → K_0(P¹_ℤ) = ℤ[O] ⊕ ℤ([O] − [O(−1)]) has image the second summand and kills the images of K_1(ℤ[T]) and K_1(ℤ[T⁻¹]); by the ring fundamental theorem for ℤ (GeneralAlgebraicKTheory K.6: K_1(ℤ[T, T⁻¹]) is generated by those images and T·K_0(ℤ)) and K_0(ℤ) = ℤ (KTheoryLowDegrees Z.2/pid-k0), ∂[T] generates it: ∂_ℤ[T] = ε([O] − [O(−1)]) with ε = ±1.
4. Projecting to the coefficient of [O] − [O(−1)] gives ∂_T(T ∪ x) = ε·x; h_T splits ∂_T and is natural because the pairing and pullbacks are.

**Acceptance.**

- X = Spec F (F a field), n = 0: ∂_T(T) = ε and K_1(F[T, T⁻¹]) = F^× ⊕ ℤ·[T].
- Iterating: ∂_{T_k}⋯∂_{T_1}(T_1 ∪ ⋯ ∪ T_k ∪ x) = ε^k x (Thomason–Trobaugh 6.6(d)).
- Under the S.3 convention for the boundary of a unit (∂[s] = [R/sR] for a non-zerodivisor s, K-book Example V.6.1.2), the corresponding localization boundary sends T ∪ x to x (S.5/punctured-line-localisation-test).

**Depends on.** this roadmap: `S.5/bass-fundamental-theorem`, `S.5/projective-line-k-theory`, `S.2/tensor-product-pairings`, `S.2/k-theory-pullback`, `S.2/affine-k-theory-comparison`, `S.4/zariski-mayer-vietoris`, `S.3/boundary-module-linearity`, `S.3/boundary-pullback-naturality`; other roadmaps: `GeneralAlgebraicKTheory:K.7`, `GeneralAlgebraicKTheory:K.6`, `KTheoryLowDegrees:U.3/units-to-K1`, `KTheoryLowDegrees:Z.2/pid-k0`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 6.1(b) (p. 352; PDF p. 106): “(b) For n ≥ 0, ∂T : Kn+1(X[T,T−1] on Z[T,T−1]) → Kn(X on Z) is naturally split by a map hT of K∗(X) modules. Indeed, cup product with T ∈ K1(Z[T,T−1]) splits ∂T up to a natural automorphism of Kn(X on Z).” — The statement, up to automorphism.
- `ThomasonTrobaugh.1990`, Theorem 6.1, proof (p. 354; PDF p. 108): “(A careful calculation of ∂T(T) by building categorical models of everything via [Th3], and considering our choice of signs in forming a Mayer-Vietoris sequence from a homotopy cartesian square yields that in fact ∂T T = 1.” — The sign, asserted without the calculation.
- `Kbook.2013`, Theorem V.8.2 (PDF p. 438; book p. 430): “in which the splitting of ∂is given by multiplication by t ∈K1(Z[t, t−1]).” — The splitting in the K-book's form.

### The four-term decomposition of the K-theory of a Laurent extension

`S.5/nk-decomposition` · theorem

Let X be quasi-compact and quasi-separated (and Z closed with X − Z quasi-compact). For every n ∈ ℤ there is a natural decomposition K_n(X[T, T⁻¹]) ≅ K_n(X) ⊕ K_{n−1}(X) ⊕ NK_n(X) ⊕ N₋K_n(X), the summands embedded by (jp)^*, h_T, j₊^* on ker(z^*) and j₋^* on ker(z₋^*); similarly with supports. For k ≥ 1 the composite ∂_{T_k}⋯∂_{T_1}(T_1 ∪ ⋯ ∪ T_k ∪ −): K_n(X) → K_{n+k}(X[T_1^{±1}, …, T_k^{±1}]) → K_n(X) is ε^k·id, so K_{−k}(X) is a natural retract of K_0(X[T_1^{±1}, …, T_k^{±1}]) and K_n(X) of K_{n+k}(X[T_1^{±1}, …, T_k^{±1}]). When NK_n(X) = 0 (for instance X regular noetherian, by S.5/homotopy-invariance-regular, which uses this node) the decomposition has two terms.

**Hypotheses.**

- X quasi-compact and quasi-separated.
- N₋K_n(X) ≅ NK_n(X) through T ↦ T⁻¹; the Nil terms need not vanish when X is singular.

**Proof.**

1. K_n(X[T]) = p^*K_n(X) ⊕ ker(z^*) and K_n(X[T⁻¹]) = p₋^*K_n(X) ⊕ ker(z₋^*) (S.5/laurent-extension-and-nk).
2. By S.5/bass-fundamental-theorem, the image of K_n(X[T]) ⊕ K_n(X[T⁻¹]) in K_n(X[T, T⁻¹]) is (K_n(X) ⊕ K_n(X) ⊕ NK ⊕ N₋K)/ΔK_n(X) ≅ K_n(X) ⊕ NK_n(X) ⊕ N₋K_n(X), and the cokernel is K_{n−1}(X) through ∂_T.
3. S.5/bass-boundary-splitting splits the cokernel by h_T, giving the four summands; naturality from that of the sequence and of h_T.
4. Iterate over T_1, …, T_k: each ∂_{T_i}(T_i ∪ −) = ε·id (S.5/bass-boundary-splitting applied to X[T_1^{±1}, …, T_{i−1}^{±1}]).

**Acceptance.**

- For R = k[ε]: K_1(R[T, T⁻¹]) ≅ K_1(R) ⊕ K_0(R) ⊕ NK_1(R)² with NK_1(R) ≅ (1 + εT·k[T])^× ≠ 0.
- For X regular noetherian: K_n(X[T, T⁻¹]) ≅ K_n(X) ⊕ K_{n−1}(X).
- K_{−1}(X) is a retract of K_0(X[T, T⁻¹]); used by S.5/negative-k-vanishing-regular and by the blow-up formula's extension to negative degrees.

**Depends on.** this roadmap: `S.5/bass-fundamental-theorem`, `S.5/bass-boundary-splitting`, `S.5/laurent-extension-and-nk`.

**Sources.**

- `ThomasonTrobaugh.1990`, Theorem 6.6(d) (p. 361; PDF p. 115): “For all integers n ∈ Z, and all positive integers k ≥ 1, the composition dk · ... · d1(T1 ∪ ··· ∪ Tk∪) is an isomorphism” — The iterated splitting.
- `ThomasonTrobaugh.1990`, Section 6.7 (p. 362; PDF p. 116): “By 6.6(d), for n > 0, KB−n(X) is a natural retract of K0(X[T1, T1−1, ..., Tn, Tn−1]) and of K1(X[T1, T1−1, ..., Tn+1, Tn+1−1]).” — The retract statement used for negative degrees.
- `Kbook.2013`, Fundamental Theorem for K0 III.3.7 (PDF p. 214; book p. 206): “Consequently, we have a natural direct sum decomposition K0(R[t, t−1]) ∼= K0(R) ⊕K−1(R) ⊕NK0(R) ⊕NK0(R).” — The ring prototype of the four-term decomposition.

### The scheme fundamental theorem on an affine scheme is the ring fundamental theorem

`S.5/affine-fundamental-theorem-comparison` · comparison

For X = Spec R with R commutative, under S.2/affine-k-theory-comparison (K(Spec R) ≃ K(R), non-connective, compatible with pullback along ring maps), the exact sequence of S.5/bass-fundamental-theorem is GeneralAlgebraicKTheory K.6's ring fundamental theorem 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t, t⁻¹]) → K_{n−1}(R) → 0, the boundaries agree up to the universal sign ε of S.5/bass-boundary-splitting, h_T is multiplication by t, NK_n(Spec R) = NK_n(R), and the Nil terms are identified by Nil_n(R) ≅ NK_{n+1}(R) (K-book V.8.1). For singular R the Nil terms need not vanish: NK_1(k[ε]) ≅ Nil_0(k[ε]) ≅ (1 + εT·k[T])^×.

**Hypotheses.**

- R commutative; K-groups of R are K.6's (Bass's in negative degrees, agreeing with the non-connective K of perfect complexes, GeneralAlgebraicKTheory K.6/agreement-and-vanishing-of-negative-K, ring clause).

**Proof.**

1. The four schemes Spec R, Spec R[t], Spec R[t⁻¹], Spec R[t, t⁻¹] and their maps correspond to the ring maps of the ring fundamental theorem (S.2/affine-pullback-is-scalar-extension), so the first three maps agree.
2. The two boundaries both come from the projective line P¹_R: the ring proof (K-book V.8.1–V.8.2) uses the localization sequence for t-torsion modules of projective dimension one on P¹_R and the projective bundle theorem for P¹_R, the scheme proof the Mayer–Vietoris square of the same cover; the map of localization sequences induced by the open inclusion Spec R[t] ⊂ P¹_R identifies them up to the sign fixed by S.5/bass-boundary-splitting.
3. In negative degrees both sides are contracted functors with the same contraction (S.5/bass-fundamental-theorem, Bass contraction; K-book III.4.1), and the ring negative groups agree with the non-connective K of perfect complexes (K.6 agreement, ring clause).
4. The Nil identification and the example k[ε] are K.6's ring statements (K-book V.8.1, Example III.3.8.1), transported through the comparison.

**Acceptance.**

- For R regular noetherian, NK_n(R) = 0 and K_n(R[t, t⁻¹]) ≅ K_n(R) ⊕ K_{n−1}(R) (K-book V.6.3).
- For R = k[ε]: NK_1(Spec R) ≅ (1 + εT·k[T])^× ≠ 0, so the four-term decomposition has non-zero Nil terms.
- The comparison is compatible with ring maps R → R′.

**Depends on.** this roadmap: `S.5/bass-fundamental-theorem`, `S.5/bass-boundary-splitting`, `S.5/nk-decomposition`, `S.5/laurent-extension-and-nk`, `S.2/affine-k-theory-comparison`, `S.2/affine-pullback-is-scalar-extension`; other roadmaps: `GeneralAlgebraicKTheory:K.6`, `GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K`.

**Sources.**

- `Kbook.2013`, Theorem V.8.1 (PDF p. 438; book p. 430): “Theorem 8.1. For every R and every n, Niln(R) ∼= NKn+1(R)” — The Nil identification.
- `Kbook.2013`, Theorem V.8.2 (PDF p. 438; book p. 430): “Theorem 8.2. [Fundamental Theorem] There is a canonically split exact sequence 0 →Kn(R) ∆ −→Kn(R[t]) ⊕Kn(R[1/t]) ± −→Kn(R[t, 1/t]) ∂> ← Kn−1(R) →0.” — The ring statement being compared.
- `Kbook.2013`, Theorem V.8.3, proof (PDF p. 440; book p. 432): “Hence ∂({t, x}) = x, regarded as an element of the subgroup K∗(X) of K∗HX0(X[t]).” — The boundary of the product with t in the scheme proof.

### The affine line minus the origin: localization against the fundamental theorem

`S.5/punctured-line-localisation-test` · application

Let X be a regular noetherian scheme. Two computations of K_*(X[T, T⁻¹]) = K_*(A¹_X − 0) agree. (i) The localization sequence of S.3 for the zero section X ≅ X × 0 ⊂ X[T] with open complement X[T, T⁻¹], with K(X[T] on X × 0) ≃ K(X) (X[T] regular, the zero section a regular immersion of codimension one) and z_* = 0 (S.5/zero-section-transfer-vanishes), gives 0 → K_n(X[T]) → K_n(X[T, T⁻¹]) →(∂_loc) K_{n−1}(X) → 0. (ii) S.5/nk-decomposition with NK = 0 gives K_n(X[T, T⁻¹]) = K_n(X) ⊕ K_{n−1}(X) with boundary ∂_T. The boundaries satisfy ∂_loc = ε·∂_T, both vanishing on the image of K_n(X[T]) and ∂_loc(T ∪ x) = x. For X = Spec F (F a field): K_1(F[T, T⁻¹]) = F^× ⊕ ℤ·[T] with ∂_loc(T) = 1 and ∂_loc(a) = 0 for a ∈ F^×.

**Hypotheses.**

- X regular noetherian (for K(X[T] on X × 0) ≃ K(X) and NK = 0); F a field for the explicit case.
- ∂_loc is S.3's localization boundary with its unit-boundary normalisation ∂[s] = [R/sR].

**Proof.**

1. Localization (S.3) for the closed subscheme X × 0 of the regular noetherian X[T]: K(X[T] on X × 0) ≃ G(X × 0) ≃ K(X) by dévissage and the Cartan equivalence (S.2/cartan-equivalence); the map K(X) → K(X[T]) is z_* = 0.
2. Hence the localization sequence breaks into short exact sequences and K_n(X[T]) = K_n(X) (S.5/homotopy-invariance-regular).
3. Both ∂_loc and ∂_T vanish on the image of K_n(X[T]) (exactness), and K_n(X[T, T⁻¹]) is generated by that image and T ∪ K_{n−1}(X) (S.5/nk-decomposition with NK = 0).
4. ∂_loc(T ∪ x) = ∂_loc(T)·x = [O_X] · x = x by K(X)-linearity of the localization sequence and the unit boundary ∂[T] = [ℤ[T]/(T)] = 1 (S.3; K-book Example V.6.1.2), while ∂_T(T ∪ x) = εx (S.5/bass-boundary-splitting); so ∂_loc = ε∂_T.

**Acceptance.**

- X = Spec F: K_0(F[T, T⁻¹]) = ℤ, K_1(F[T, T⁻¹]) = F^× ⊕ ℤ, ∂_loc[T] = 1.
- X = Spec F, n = 2: ∂_loc{T, a} = a for a ∈ F^× (the tame symbol at the origin, with S.3's and K2SymbolsBrauer's sign conventions).
- X = Spec ℤ: K_1(ℤ[T, T⁻¹]) = {±1} × T^ℤ and K_0(ℤ[T, T⁻¹]) = ℤ.

**Depends on.** this roadmap: `S.5/zero-section-transfer-vanishes`, `S.5/homotopy-invariance-regular`, `S.5/laurent-decomposition-regular`, `S.5/nk-decomposition`, `S.5/bass-boundary-splitting`, `S.2/cartan-equivalence`, `S.2/tensor-product-pairings`, `S.3/localisation-fibre-sequence`, `S.3/boundary-of-a-nonzerodivisor`, `S.3/boundary-module-linearity`, `S.3/regular-support-devissage`.

**Sources.**

- `Kbook.2013`, Example V.6.1.2 (PDF p. 414; book p. 406): “It is useful to observe that any s ∈S determines an element [s] of K1(R[1/s]) and hence G1(R[1/s]), and that ∂(s) ∈G0(R/sR) is [R/sR]−[I], where I = {r ∈R : sr = 0}.” — The unit boundary; for T in ℤ[T], I = 0.
- `Kbook.2013`, Theorem V.6.2, proof (PDF p. 415; book p. 407): “the localization sequence ( 6.1.1) for j : R[s] →R[s, s−1] splits into short exact sequences 0 →Gn(R[s]) j∗ −→Gn(R[s, s−1]) ∂ −→Gn−1(R) →0.” — Computation (i) in G-theory.
- `Kbook.2013`, Corollary V.6.3.1 (PDF p. 416; book p. 408): “For any regular ring R, there is a split exact sequence 0 →Kn(R) →Kn(R[s]) ⊕Kn(R[s−1]) →Kn(R[s, s−1]) ∂> ← Kn−1(R) →0, in which the splitting is multiplication by s ∈K1(Z[s, s−1]).” — Computation (ii) for regular rings.

### Geometry of the blow-up along a regular immersion

`S.5/regular-blowup-geometry` · lemma

Setting: X is quasi-compact and quasi-separated; i: Y → X is a regular closed immersion (Koszul-regular in the sense of SGA 6 VII 1.4: the ideal J is locally generated by a sequence whose Koszul complex is acyclic in non-zero degrees; for noetherian X, locally generated by a regular sequence) of pure codimension d ≥ 1, with conormal sheaf N := J/J², locally free of rank d on Y; p: X′ := Bl_Y X = Proj_X(⊕_{n≥0} J^n) → X is the blow-up, Y′ := p⁻¹(Y) = X′ ×_X Y with i′: Y′ → X′ and p′: Y′ → Y, and O_{X′}(1) is the tautological invertible sheaf. Then: (a) Y′ ≅ Proj_Y(⊕_n J^n/J^{n+1}) ≅ P(N) = Proj_Y(Sym N), with O_{X′}(1)|_{Y′} ≅ O_{P(N)}(1), and p′ is the projective bundle of N; (b) the ideal of i′ is O_{X′}(1), giving the exact sequences 0 → O_{X′}(n + 1) → O_{X′}(n) → i′_*O_{Y′}(n) → 0 for all n ∈ ℤ; i′ is a regular immersion of codimension one with conormal sheaf O_{Y′}(1), and O_{X′}(−1) = O_{X′}(Y′); (c) p is projective and perfect: locally on X a surjection O_X^{⊕d} → J induces a closed immersion k: X′ → P^{d−1}_X with k^*O(1) = O_{X′}(1), and k is a regular immersion; (d) p restricts to an isomorphism X′ − Y′ ≅ X − Y; (e) if d = 1, p is an isomorphism.

**Hypotheses.**

- As in the setting; the blow-up construction (Rees algebra, relative Proj, universal property, affine charts, flat base change) is imported from AlgebraicModuliForArithmeticGeometry R09.7a (and the Tau Ceti StableReduction layer 4 construction).

**Proof.**

1. (a) Y′ = Proj_X(⊕J^n) ×_X Y = Proj_Y(⊕J^n ⊗ O_X/J) = Proj_Y(⊕ J^n/J^{n+1}). Locally J is generated by a Koszul-regular, hence quasi-regular, sequence (Stacks Lemma 10.69.2, Tag 00LN, in the noetherian case), so Sym_{O_Y}(N) → ⊕J^n/J^{n+1} is an isomorphism (Stacks Definition 10.69.1, Tag 061P), and Y′ ≅ P(N) (R09.1).
2. (b) The exceptional divisor is an effective Cartier divisor with O_{X′}(−1) = O_{X′}(E) (Stacks Lemma 31.33.4, Tag 02OS), i.e. its ideal is O_{X′}(1); twist 0 → O_{X′}(1) → O_{X′} → i′_*O_{Y′} → 0 by O_{X′}(n). A Cartier divisor is a regular immersion of codimension one, with conormal I/I² = O_{X′}(1)|_{Y′} = O_{Y′}(1).
3. (c) J of finite type makes p projective with O_{X′}(1) p-relatively ample (Stacks Lemma 31.33.13, Tag 02NS); the closed immersion k and its regularity are SGA 6 VII 1.8 and EGA IV 19.4, as cited in Thomason 1993, 1.2; perfectness of p follows (S.2/proper-perfect-pushforward-perfect then applies to Rp_*).
4. (d) Stacks Lemma 31.33.4, Tag 02OS; (e) Stacks Lemma 31.33.7, Tag 0807.

**Acceptance.**

- Blow-up of A²_k at the origin (J = (x, y), d = 2): Y′ ≅ P¹_k and O_{X′}(1)|_{Y′} = O_{P¹}(1).
- d = 1: X′ = X and Y′ = Y.
- Non-example: for the non-regular ideal J = (x², xy, y²) of k[x, y], Bl_J = Bl_{(x,y)} and the exceptional divisor for J is the double line 2E, one-dimensional over the point V(J), whereas J/J² needs three generators; it is not the projective bundle of a conormal bundle.

**Depends on.** this roadmap: `S.2/proper-perfect-pushforward-perfect`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.7a`, `AlgebraicModuliForArithmeticGeometry:R09.1`; libraries: `mathlib:RingTheory.Sequence.IsRegular`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

**Sources.**

- `Thomason.1993`, §1.2 (p. 197): “Soit X′ = Proj_X(⊕J^n) le schéma éclaté de X le long de l’immersion régulière i: Y → X. C’est muni d’un faisceau inversible fondamental O_{X′}(1) qui est relativement ample pour le morphisme canonique p: X′ → X. Ce morphisme projectif est aussi parfait” — The blow-up, O_{X′}(1) and part (c); transcribed from the scan (no text layer).
- `Thomason.1993`, §1.2 (p. 197): “Alors Y′ = Proj_Y(⊕J^n/J^{n+1}) ≅ PN_Y. Le morphisme p′: Y′ → Y s’identifie au morphisme de projection et donc est parfait, même lisse. L’idéal de l’immersion fermée induite i′: Y′ → X′ est canoniquement isomorphe au faisceau inversible O_{X′}(1)” — Parts (a) and (b).
- `Stacks`, Lemma 31.33.4, Tag 02OS (Divisors, Section 31.33): “the exceptional divisor E = b−1(Z) is an effective Cartier divisor on X′, there is a canonical isomorphism OX′(−1) = OX′(E)” — Part (b) for any blow-up.
- `Stacks`, Lemma 10.69.2, Tag 00LN (Algebra, Section 10.69): “A regular sequence f1, …, fc of R is a quasi-regular sequence.” — The graded algebra of a regular ideal is the symmetric algebra of the conormal module.

### Pullback to the blow-up is fully faithful on perfect complexes

`S.5/blowup-adjunction-lemma` · lemma

Setting: X is quasi-compact and quasi-separated; i: Y → X is a regular closed immersion (Koszul-regular in the sense of SGA 6 VII 1.4: the ideal J is locally generated by a sequence whose Koszul complex is acyclic in non-zero degrees; for noetherian X, locally generated by a regular sequence) of pure codimension d ≥ 1, with conormal sheaf N := J/J², locally free of rank d on Y; p: X′ := Bl_Y X = Proj_X(⊕_{n≥0} J^n) → X is the blow-up, Y′ := p⁻¹(Y) = X′ ×_X Y with i′: Y′ → X′ and p′: Y′ → Y, and O_{X′}(1) is the tautological invertible sheaf. (a) For every perfect complex F on X, the adjunction η: F → Rp_*Lp^*F = Rp_*(O_{X′} ⊗ Lp^*F) is a quasi-isomorphism. (b) For every perfect complex G on Y, η: G → Rp′_*Lp′^*G = Rp′_*(O_{Y′} ⊗ Lp′^*G) is a quasi-isomorphism, and Rp′_*(O_{Y′}(−i) ⊗ Lp′^*G) ≃ 0 for i = 1, 2, …, d − 1.

**Hypotheses.**

- As in the setting.

**Proof.**

1. By the derived projection formula (S.2/derived-projection-formula), Rp_*(O_{X′} ⊗ Lp^*F) ≃ Rp_*(O_{X′}) ⊗ F and Rp′_*(O_{Y′}(n) ⊗ Lp′^*G) ≃ Rp′_*(O_{Y′}(n)) ⊗ G; so it suffices to show (a′) O_X → Rp_*O_{X′} and (b′) O_Y → Rp′_*O_{Y′} are quasi-isomorphisms and Rp′_*O_{Y′}(−i) ≃ 0 for 1 ≤ i ≤ d − 1.
2. (b′) is the cohomology of the projective bundle Y′ = P(N) of rank d (S.5/projective-bundle-cohomology; EGA III 2.1.15 in Thomason).
3. (a′): by descending induction on n ≥ 0, J^n → Rp_*O_{X′}(n) is a quasi-isomorphism. For n very large this holds by the relative ampleness of O_{X′}(1) (Serre vanishing and p_*O_{X′}(n) = J^n for n ≫ 0, cited by Thomason from EGA; gap in the sources read). The induction step uses the exact sequence (1.2.2) 0 → O_{X′}(n + 1) → O_{X′}(n) → i′_*O_{Y′}(n) → 0 of S.5/regular-blowup-geometry and the computation on Y′ = P(N) that J^n/J^{n+1} ≅ Sym^n(N) → Rp′_*O_{Y′}(n) is a quasi-isomorphism for n ≥ 0 (S.5/projective-bundle-cohomology(e)); n = 0 gives (a′).

**Acceptance.**

- X = A²_k blown up at the origin: Rp_*O_{X′} = O_{A²} (in particular H¹(X′, O_{X′}) = 0).
- d = 1: p = id and both statements are trivial.
- Rp′_*O_{Y′}(−1) = 0 but Rp′_*O_{Y′}(−d) ≅ (Λ^d N)^∨[−(d − 1)] ≠ 0: the vanishing range 1 ≤ i ≤ d − 1 is sharp.

**Depends on.** this roadmap: `S.5/regular-blowup-geometry`, `S.5/projective-bundle-cohomology`, `S.2/derived-projection-formula`, `S.2/total-direct-image-qcqs`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources.**

- `Thomason.1993`, Lemme 2.3 (p. 200): “(a) Soit F· un complexe parfait sur X. Alors le morphisme canonique d’adjonction (2.3.1) pour p: X′ → X est un quasi-isomorphisme” — Part (a); transcribed from the scan.
- `Thomason.1993`, Lemme 2.3, démonstration (p. 200): “La méthode est de démontrer par récurrence descendante sur n pour n ≥ 0 que J^n → Rp_*O_{X′}(n) est un quasi-isomorphisme où J est l’idéal le long duquel on a éclaté X. Pour n très grand c’est vrai grâce à l’amplitude relative de O_{X′}(1)” — The descending induction and its starting point.

### The self-intersection triangle of a Cartier divisor

`S.5/codimension-one-triangle` · lemma

Let i: D → W be a regular closed immersion of pure codimension one of quasi-compact quasi-separated schemes (an effective Cartier divisor), with conormal sheaf N (an invertible O_D-module). For every perfect complex F on D there is a natural exact triangle (N ⊗ F)[1] → Li^*Ri_*F → F → (N ⊗ F)[2] in the derived category of perfect complexes on D, the second map being the counit of adjunction.

**Hypotheses.**

- i regular of codimension one; F perfect on D.
- This is the codimension-one case of Thomason's excess-intersection analysis; its proof uses only the Koszul resolution of O_D and not the K-theoretic excess formula.

**Proof.**

1. Tor sheaves: resolving O_D by 0 → O_W(−D) → O_W → O_D → 0 and tensoring with O_D, the map N = O_W(−D) ⊗ O_D → O_D is zero, so Tor_0^{O_W}(O_D, O_D) = O_D, Tor_1 = N and Tor_k = 0 for k ≥ 2 (Thomason 1993, Lemme 3.2, for this square).
2. Represent F by a bounded complex of flat O_D-modules (S.1/perfect-waldhausen-models); then Li^*Ri_*F is computed by a flat resolution of i_*F on W, and the horizontal cohomology of the resulting bicomplex is Tor_k^{O_W}(O_D, O_D) ⊗ F, i.e. F in degree 0 and N ⊗ F in degree −1 (Thomason 1993, (3.4.3)–(3.4.4)).
3. The truncation of this filtration gives the exact sequence of complexes h_1 → T_1 → T_0 with h_1 ≃ (N ⊗ F)[1] and T_0 ≃ F, T_1 representing Li^*Ri_*F (Thomason 1993, proof of 3.5.2); naturality in F follows from functoriality of the resolutions up to quasi-isomorphism.

**Acceptance.**

- F = O_D: Li^*i_*O_D has cohomology O_D in degree 0 and N in degree −1.
- For D a rational point of a smooth curve W over a field: Li^*i_*k has Tor_1 = N ≅ k, so [Li^*i_*k] = [k] − [N] = 0 in K_0(D), the self-intersection formula i^*i_* = λ_{−1}(N) in codimension one.
- The triangle need not split in general; only the triangle is asserted.

**Depends on.** this roadmap: `S.1/perfect-waldhausen-models`, `S.1/perfect-derived-pullback`, `S.2/proper-perfect-pushforward-perfect`.

**Sources.**

- `Thomason.1993`, Porisme 3.5, (3.5.2) (p. 213): “En particulier, en prenant i = f, d’où Y = X′ = Y′, i′ = f′ = 1_Y et F = N, pour i une immersion fermée régulière de pure codimension un il existe un triangle exact naturel en F″· un complexe parfait sur Y:” — The statement; transcribed from the scan.
- `Thomason.1993`, Porisme 3.5, démonstration (p. 213): “On note que cette démonstration ne dépend que de l’analyse homologique de 3.2 et de 3.4, et donc qu’elle est indépendante du paragraphe 2 où le porisme 3.5 est cité.” — Independence from the K-theoretic statements.

### The exceptional maps ∂ and Δ

`S.5/blowup-exceptional-triangles` · lemma

Setting: X is quasi-compact and quasi-separated; i: Y → X is a regular closed immersion (Koszul-regular in the sense of SGA 6 VII 1.4: the ideal J is locally generated by a sequence whose Koszul complex is acyclic in non-zero degrees; for noetherian X, locally generated by a regular sequence) of pure codimension d ≥ 1, with conormal sheaf N := J/J², locally free of rank d on Y; p: X′ := Bl_Y X = Proj_X(⊕_{n≥0} J^n) → X is the blow-up, Y′ := p⁻¹(Y) = X′ ×_X Y with i′: Y′ → X′ and p′: Y′ → Y, and O_{X′}(1) is the tautological invertible sheaf. Assume d ≥ 2 and let 1 ≤ k ≤ d − 1. (a) Let A′_k be the category of perfect complexes E on X′ with Rp_*(E ⊗ O_{X′}(i)) ≃ 0 for 0 ≤ i < k. There is a map, natural in E ∈ A′_k, ∂: (i′_*(Lp′^*Rp′_*(E ⊗^L O_{Y′}(k − 1))) ⊗ O_{X′}(−k))[−1] → E in the derived category of perfect complexes on X′, such that Rp_*(∂ ⊗ O_{X′}(i)) is a quasi-isomorphism for 0 ≤ i < k + 1. (b) For perfect F on Y there is a natural quasi-isomorphism Δ: F → Rp′_*(Li′^* i′_*(Lp′^*F) ⊗ O_{Y′}(−1))[−1].

**Hypotheses.**

- As in the setting, with d ≥ 2 and 1 ≤ k ≤ d − 1.

**Proof.**

1. The sequence (1.2.2) of S.5/regular-blowup-geometry, read as an exact triangle and tensored with E, gives triangles E ⊗ O_{X′}(n + 1) → E ⊗ O_{X′}(n) → i′_*(E ⊗ O_{Y′}(n)) → with connecting map δ of degree one.
2. (a) Define ∂ as the composite of the counit ε: Lp′^*Rp′_*(E ⊗ O_{Y′}(k − 1)) → E ⊗ O_{Y′}(k − 1), the map δ for n = k − 1, and E ⊗ O_{X′}(k) ⊗ O_{X′}(−k) ≅ E.
3. For 0 ≤ i < k the source of Rp_*(∂ ⊗ O_{X′}(i)) is i_*Rp′_*(Lp′^*Rp′_*(E ⊗ O_{Y′}(k − 1)) ⊗ O_{Y′}(−k + i)) ≃ 0 by S.5/blowup-adjunction-lemma(b) (1 − d ≤ −k + i < 0), and the target is ≃ 0 by hypothesis; for i = k the source is i_*Rp′_*Lp′^*Rp′_*(E ⊗ O_{Y′}(k − 1)) ≃ i_*Rp′_*(E ⊗ O_{Y′}(k − 1)) by S.5/blowup-adjunction-lemma(b), and the adjunction identity (Rp′_*ε)(ηRp′_*) = 1 identifies Rp_*(∂ ⊗ O_{X′}(k)) with the connecting map δ′ of Rp_* of the triangle for n = k − 1, a quasi-isomorphism because Rp_*(E ⊗ O_{X′}(k − 1)) ≃ 0.
4. (b) Apply the codimension-one triangle (S.5/codimension-one-triangle) to i′, whose conormal is O_{Y′}(1), with F″ = Lp′^*F; tensor with O_{Y′}(−1) and apply Rp′_*: the term Rp′_*(Lp′^*F ⊗ O_{Y′}(−1)) ≃ 0 (S.5/blowup-adjunction-lemma(b), d ≥ 2), so Rp′_*Lp′^*F[1] → Rp′_*(Li′^*i′_*Lp′^*F ⊗ O_{Y′}(−1)) is a quasi-isomorphism; compose its shift by [−1] with η of S.5/blowup-adjunction-lemma(b).

**Acceptance.**

- k = 1: A′_1 consists of the E with Rp_*E ≃ 0, and ∂ realises E, up to the maps described, from its restriction to the exceptional divisor.
- For F = O_Y, Δ identifies O_Y with Rp′_*(Li′^*i′_*O_{Y′} ⊗ O_{Y′}(−1))[−1], whose only contribution is the Tor_1 term O_{Y′}(1) ⊗ O_{Y′}(−1) = O_{Y′}.
- For d = 1 there is no k in range; the lemma is vacuous and the formula of S.5/blowup-formula has no K(Y) factor.

**Depends on.** this roadmap: `S.5/regular-blowup-geometry`, `S.5/blowup-adjunction-lemma`, `S.5/codimension-one-triangle`, `S.2/derived-projection-formula`.

**Sources.**

- `Thomason.1993`, Lemme 2.4 (a) (p. 200): “Notons A′_k la catégorie des complexes parfaits E· sur X′ tels que Rp_*(E· ⊗ O_{X′}(i)) ≃ 0 pour 0 ≤ i < k.” — The category A′_k of part (a); transcribed from the scan.
- `Thomason.1993`, Lemme 2.4 (a) (p. 200): “Ce morphisme ∂ satisfait à ce que Rp_*(∂ ⊗ O_{X′}(i)) est un quasi-isomorphisme pour 0 ≤ i < k + 1.” — The property of ∂.
- `Thomason.1993`, Lemme 2.4 (b) (p. 201): “Il existe un quasi-isomorphisme naturel dans la catégorie dérivée des complexes parfaits sur Y des foncteurs en F· un tel complexe:” — Part (b).

### Acyclicity is detected by the twisted direct images

`S.5/blowup-acyclicity-criterion` · lemma

(a) Let X be quasi-compact and quasi-separated, E a locally free O_X-module of rank d and q: P(E) → X its projective bundle. If E^• is a perfect complex on P(E) with Rq_*(E^• ⊗ O_{P(E)}(i)) acyclic for i = 0, 1, …, d − 1, then E^• is acyclic. (b) In the setting of the blow-up (S.5/regular-blowup-geometry), if E^• is perfect on X′ and Rp_*(E^• ⊗ O_{X′}(i)) is acyclic for i = 0, …, d − 1, then E^• is acyclic.

**Hypotheses.**

- As stated; the questions are local on X.

**Proof.**

1. Both statements are local on X. For (b), work where N is the pullback of a free E of rank d and p factors as the regular closed immersion k: X′ → P(E) = P^{d−1}_X followed by q, with k^*O(1) = O_{X′}(1) (S.5/regular-blowup-geometry(c)); k_*E^• is perfect and Rq_*(k_*E^• ⊗ O(i)) ≅ Rp_*(E^• ⊗ O_{X′}(i)), and E^• is acyclic iff k_*E^• is; so (b) follows from (a).
2. (a) with X = Spec A and E free: first show Rq_*(E^• ⊗ O(i)) ≃ 0 for all i ≥ 0 by induction, using the Koszul sequence 0 → q^*(Λ^dE) ⊗ E^• ⊗ O(j − d) → ⋯ → q^*E ⊗ E^• ⊗ O(j − 1) → E^• ⊗ O(j) → 0 (S.5/projective-bundle-koszul) and the spectral sequence of this resolution: the terms Λ^iE ⊗ Rq_*(E^• ⊗ O(j − i)) vanish by induction, hence so does Rq_*(E^• ⊗ O(j)).
3. Then show H^k(E^•) = 0 by ascending induction on k, using the hypercohomology spectral sequence E_2^{r,s} = R^rq_*(H^s(E^•) ⊗ O(n)) ⇒ 0 and the ampleness of O(1): a quasi-coherent sheaf H with q_*(H ⊗ O(n)) = 0 for all n ≫ 0 is zero (EGA II 4.5.2(c) in Thomason; R09.1's relative ampleness).

**Acceptance.**

- For E^• = O_{P(E)}(−d) on P(E) (d ≥ 2): Rq_*(O(−d + i)) = 0 for 1 ≤ i ≤ d − 1 but Rq_*O(−d) ≠ 0 at i = 0, consistent with E^• not being acyclic.
- On the blow-up of A²_k at the origin (d = 2), the non-zero sheaf i′_*O_{Y′}(−1) has Rp_*(i′_*O_{Y′}(−1)) = i_*Rp′_*O_{P¹}(−1) = 0, but its twist by O_{X′}(1) has Rp_* = i_*Rp′_*O_{P¹} ≠ 0: the twist i = 1 detects it.
- d = 1: P(E) = X and the criterion is the tautology Rq_* = id.

**Depends on.** this roadmap: `S.5/projective-bundle-koszul`, `S.5/projective-bundle-cohomology`, `S.5/regular-blowup-geometry`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources.**

- `Thomason.1993`, Lemme 2.5 (p. 202): “(b) On adopte les hypothèses de 1.1–1.2, en particulier que X′ soit l’éclaté de X le long de Y → X, une immersion régulière de codimension d en tout point. Soit E· un complexe parfait sur X′, tel que pour i = 0, 1, …, d − 1, Rp_*(E· ⊗ O_{X′}(i)) est acyclique sur X. Alors E· est acyclique sur X′.” — Part (b); transcribed from the scan.
- `Thomason.1993`, Lemme 2.5, démonstration (p. 202): “Les questions sont locales sur la base X.” — The reduction to the local case.

### The filtration of perfect complexes on the blow-up

`S.5/blowup-waldhausen-filtration` · lemma

Setting: X is quasi-compact and quasi-separated; i: Y → X is a regular closed immersion (Koszul-regular in the sense of SGA 6 VII 1.4: the ideal J is locally generated by a sequence whose Koszul complex is acyclic in non-zero degrees; for noetherian X, locally generated by a regular sequence) of pure codimension d ≥ 1, with conormal sheaf N := J/J², locally free of rank d on Y; p: X′ := Bl_Y X = Proj_X(⊕_{n≥0} J^n) → X is the blow-up, Y′ := p⁻¹(Y) = X′ ×_X Y with i′: Y′ → X′ and p′: Y′ → Y, and O_{X′}(1) is the tautological invertible sheaf. Let A = Perf(X), B = Perf(Y) and, for 0 ≤ k ≤ d, A′_k ⊂ Perf(X′) the complicial Waldhausen category of perfect complexes E on X′ with Rp_*(E ⊗ O_{X′}(i)) ≃ 0 for 0 ≤ i < k (A′_0 = Perf(X′)), with quasi-isomorphisms as weak equivalences. Then (2.7.2) K(A′_0) ≃ K(A′_1) × K(A), the inclusion of K(A) being induced by Lp^*; (2.7.3) for 1 ≤ k ≤ d − 1, K(A′_k) ≃ K(A′_{k+1}) × K(B), the inclusion of K(B) being induced by E ↦ (i′_*Lp′^*E) ⊗ O_{X′}(−k); and K(A′_d) is contractible.

**Hypotheses.**

- As in the setting; K is Waldhausen's connective K-theory of these complicial categories (Thomason 1993, 2.6–2.7).

**Proof.**

1. Let vA′_k be A′_k with quasi-isomorphisms and wA′_k the same category with weak equivalences the f such that Rp_*(f ⊗ O_{X′}(k)) is a quasi-isomorphism. The w-acyclic objects of vA′_k are exactly A′_{k+1}; mapping cylinders give cylinder functors, and the Waldhausen fibration theorem (GeneralAlgebraicKTheory K.4/waldhausen-localization-fibration-theorem) gives fibrations K(vA′_{k+1}) → K(vA′_k) → K(wA′_k).
2. k = 0: Lp^*: Ho(A) → Ho(wA′_0) is an equivalence with inverse Rp_* — η: 1 → Rp_*Lp^* is an isomorphism (S.5/blowup-adjunction-lemma(a)) and the counit ε: Lp^*Rp_* → 1 satisfies (Rp_*ε)(ηRp_*) = 1, so Rp_*ε is an isomorphism and ε a w-equivalence; by the approximation criterion (Thomason–Trobaugh 1.9.8 with the hypothesis of Thomason 1993 §4.1, which holds here; GeneralAlgebraicKTheory K.4/waldhausen-approximation-theorem) K(A) ≃ K(wA′_0), splitting the fibration.
3. 1 ≤ k ≤ d − 1: (i′_*Lp′^*(−)) ⊗ O_{X′}(−k) sends B into A′_k (S.5/blowup-adjunction-lemma(b)); it induces an equivalence Ho(B) → Ho(wA′_k) with inverse E ↦ Rp′_*(E ⊗^L O_{Y′}(k − 1))[−1]: one composite is naturally w-equivalent to the identity by ∂ (S.5/blowup-exceptional-triangles(a)), the other quasi-isomorphic to the identity by Δ (S.5/blowup-exceptional-triangles(b)); approximation gives K(B) ≃ K(wA′_k) and splits the fibration (using the model of bounded-above flat perfect complexes for B, S.1/perfect-waldhausen-models).
4. k = d: every object of A′_d is acyclic (S.5/blowup-acyclicity-criterion(b)), so K(A′_d) ≃ *.

**Acceptance.**

- d = 1: only (2.7.2) and K(A′_1) ≃ *, so K(X′) ≃ K(X) (and indeed X′ = X).
- d = 2: K(X′) ≃ K(X) × K(Y) × K(A′_2) with K(A′_2) ≃ *.
- On K_0 the inclusions are [F] ↦ [Lp^*F] and [G] ↦ [i′_*Lp′^*G ⊗ O_{X′}(−k)].

**Depends on.** this roadmap: `S.5/blowup-adjunction-lemma`, `S.5/blowup-exceptional-triangles`, `S.5/blowup-acyclicity-criterion`, `S.1/perfect-waldhausen-models`, `S.1/perfect-complicial-waldhausen-category`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-localization-fibration-theorem`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`.

**Sources.**

- `Thomason.1993`, §2.7 (p. 204): “En utilisant le théorème de fibration de Waldhausen on verra qu’il existe une équivalence d’homotopie: (2.7.2) K(A′_0) ≃ K(A′_1) × K(A) tandis que pour chaque k entre 1 et d − 1 inclus on aura l’équivalence: (2.7.3) K(A′_k) ≃ K(A′_{k+1}) × K(B).” — The statement; transcribed from the scan.
- `Thomason.1993`, §2.7 (p. 204): “Or d’après le lemme 2.5 le morphisme canonique partant de 0 vers un objet quelconque de A′_d est un quasi-isomorphisme naturel et donc K(A′_d) est contractile.” — The last step.

### K-groups of the blow-up along a regular centre

`S.5/blowup-formula` · theorem · planet “K-groups of a blow-up”

Setting: X is quasi-compact and quasi-separated; i: Y → X is a regular closed immersion (Koszul-regular in the sense of SGA 6 VII 1.4: the ideal J is locally generated by a sequence whose Koszul complex is acyclic in non-zero degrees; for noetherian X, locally generated by a regular sequence) of pure codimension d ≥ 1, with conormal sheaf N := J/J², locally free of rank d on Y; p: X′ := Bl_Y X = Proj_X(⊕_{n≥0} J^n) → X is the blow-up, Y′ := p⁻¹(Y) = X′ ×_X Y with i′: Y′ → X′ and p′: Y′ → Y, and O_{X′}(1) is the tautological invertible sheaf. Then the map Θ⁻¹: K(X) × ∏_{k=1}^{d−1} K(Y) → K(X′), (x, y_1, …, y_{d−1}) ↦ p^*x + Σ_{k=1}^{d−1} i′_*(p′^*y_k) ⊗ [O_{X′}(−k)], is a natural homotopy equivalence of S.2's non-connective K-theory spectra, and of module spectra over K(X). Hence K_n(X′) ≅ K_n(X) ⊕ K_n(Y)^{d−1} for all n ∈ ℤ, with no regularity hypothesis on X or Y beyond the regularity of the immersion. Here p^* is derived pullback, p′^*: K(Y) → K(Y′) pullback along the projective bundle, i′_*: K(Y′) → K(X′) pushforward along the perfect closed immersion i′, and ⊗[O_{X′}(−k)] tensoring with the line bundle.

**Hypotheses.**

- X quasi-compact and quasi-separated; Y → X regular of pure codimension d ≥ 1.
- K is S.2's non-connective K; the connective statement is Thomason's, extended to all degrees through the Laurent extensions.

**Proof.**

1. Connective K: by S.5/blowup-waldhausen-filtration and induction on k, K(X′) = K(A′_0) ≃ K(A) × K(A′_1) ≃ K(A) × K(B) × K(A′_2) ≃ ⋯ ≃ K(X) × K(Y)^{d−1} × K(A′_d), with K(A′_d) ≃ *; the inclusions of the factors are p^* and (i′_*p′^*(−)) ⊗ O_{X′}(−k), which is Θ⁻¹.
2. Base change: the blow-up commutes with flat base change (Stacks Lemma 31.33.3, Tag 0805), and Y[T_1^{±1}, …] → X[T_1^{±1}, …] is again regular of codimension d, so the construction is compatible with the Laurent extensions X[T_1^{±1}, …, T_k^{±1}] (Thomason 1993, 2.6).
3. Negative degrees: K_{−k}(−) is a natural retract of K_0(−[T_1^{±1}, …, T_k^{±1}]) (S.5/nk-decomposition), and a retract of an isomorphism is an isomorphism; so Θ⁻¹ is an isomorphism on π_n for all n ∈ ℤ, hence an equivalence of non-connective spectra.
4. K(X)-linearity: each component is K(X)-linear by the projection formula (S.2/projection-formula) and the pairing (S.2/tensor-product-pairings).

**Acceptance.**

- d = 1: Θ⁻¹ = p^* and X′ = X.
- Blow-up of a closed point x of a regular surface (d = 2): K_n(X′) ≅ K_n(X) ⊕ K_n(k(x)) (S.5/blowup-exceptional-divisor-tests).
- K_0: the complete formula K_0(X′) ≅ K_0(X) ⊕ K_0(Y)^{d−1} refines SGA 6 VII 3.7's exact sequence 0 → K_0(Y) → K_0(Y′) ⊕ K_0(X) → K_0(X′), without the classical regularity hypothesis on Y (Thomason 1993, introduction); the exact-sequence form for all n needs the K-theoretic excess intersection formula (gap).
- Consumer: EllipticKTheory E.6 (model independence of the integral part), through S.5/blowup-image-on-complement.

**Depends on.** this roadmap: `S.5/blowup-waldhausen-filtration`, `S.5/regular-blowup-geometry`, `S.5/nk-decomposition`, `S.2/projection-formula`, `S.2/tensor-product-pairings`, `S.2/k-theory-pullback`, `S.2/k-theory-proper-pushforward`, `S.2/nonconnective-k-theory-of-a-scheme`.

**Sources.**

- `Thomason.1993`, Théorème 2.1 (pp. 198–199): “soient i: Y → X une immersion fermée régulière de pure codimension d ≥ 1 et p: X′ → X l’éclaté de X le long de Y. Alors il existe une équivalence d’homotopie naturelle de spectres, en tant que modules sur le spectre multiplicatif K(X):” — The statement (2.1.1); transcribed from the scan.
- `Thomason.1993`, §2.1.2 (p. 199): “Sur les d − 1 facteurs K(Y) le morphisme Θ⁻¹ est le composé de p′*: K(Y) → K(Y′), de i′_*: K(Y′) → K(X′) et de la multiplication par la classe dans K_0(X′) du faisceau inversible O_{X′}(−i), où i prend les d − 1 valeurs i = 1, 2, …, d − 1.” — The explicit inverse.
- `Thomason.1993`, §2.6 (p. 203): “D’après [TT, 6.7], il suffit de démontrer 2.1 pour cette version connexe.” — The extension to non-connective K.

### Exceptional-divisor tests for the blow-up formula

`S.5/blowup-exceptional-divisor-tests` · application

(a) d = 1: X′ = X and the blow-up formula is the identity K(X) ≃ K(X). (b) Let X be a regular noetherian scheme of dimension two and x a closed point (the maximal ideal of the regular local ring O_{X,x} is generated by a regular sequence of length 2, so x → X is regular of codimension 2), E := p⁻¹(x) ≅ P¹_{k(x)}. Then K_n(X′) ≅ K_n(X) ⊕ K_n(k(x)), the second summand embedded by y ↦ i′_*(p′^*y) ⊗ [O_{X′}(−1)] = i′_*(y·[O_E(−1)]); in K_0, i′_*[O_E(−1)] = [O_{X′}(−1)] − [O_{X′}] = [O_{X′}(E)] − 1 and i′_*[O_E] = 1 − [O_{X′}(1)] = 1 − [O_{X′}(−E)]. (c) For a field k: K_0(Bl_0 A²_k) ≅ ℤ², with basis 1 and i′_*[O_E(−1)]; K_0(Bl_x P²_k) ≅ ℤ⁴ for a rational point x. (d) On the exceptional curve, i′_*[O_E(m)] = (m + 1)·i′_*[O_E] − m·i′_*[O_E(−1)] for all m ∈ ℤ.

**Hypotheses.**

- X regular noetherian of dimension two for (b); k a field for (c).

**Proof.**

1. (a): S.5/regular-blowup-geometry(e) and S.5/blowup-formula with d − 1 = 0 factors.
2. (b): a regular local ring of dimension 2 has a regular system of parameters, a regular sequence generating the maximal ideal, so x → X is a regular immersion of codimension 2 and S.5/blowup-formula applies with Y = Spec k(x).
3. The classes: the sequence 0 → O_{X′}(n + 1) → O_{X′}(n) → i′_*O_{Y′}(n) → 0 (S.5/regular-blowup-geometry(b)) with n = −1 and n = 0, and O_{X′}(−1) = O_{X′}(E).
4. (c): K_0(A²_k) = K_0(k) = ℤ (S.5/homotopy-invariance-regular, KTheoryLowDegrees Z.2/division-ring-k0) and K_0(P²_k) = ℤ³ (S.5/projective-bundle-theorem), plus one copy of K_0(k) = ℤ.
5. (d): S.5/projective-line-k-theory(b) on E ≅ P¹_{k(x)}, pushed forward by i′_*.

**Acceptance.**

- K_0(Bl_0 A²_k) ≅ ℤ² and K_0(Bl_x P²_k) ≅ ℤ⁴; the ranks agree with rank ⊕ Pic ⊕ CH_0 = ℤ ⊕ ℤ² ⊕ ℤ for the rational surface Bl_x P²_k, where Pic(Bl_x P²) ≅ Pic(P²) ⊕ ℤ (K-book Example I.5.15.2).
- K_1(Bl_0 A²_k) ≅ k^× ⊕ k^×.
- The exceptional class i′_*[O_E(−1)] restricts to zero on X′ − E.

**Depends on.** this roadmap: `S.5/blowup-formula`, `S.5/regular-blowup-geometry`, `S.5/projective-line-k-theory`, `S.5/projective-bundle-theorem`, `S.5/homotopy-invariance-regular`; other roadmaps: `KTheoryLowDegrees:Z.2/division-ring-k0`, `KTheoryLowDegrees:U.3/K1-division-ring`; libraries: `mathlib:IsRegularLocalRing`.

**Sources.**

- `Thomason.1993`, Introduction, (0.2) (p. 195): “Dans cet article je donne une formule complète pour K_n(X′), pour tout n et sans hypothèse de régularité de Y.” — The formula being tested; transcribed from the scan.
- `Kbook.2013`, Example I.5.15.2 (PDF p. 66; book p. 58): “For example, the blowing up of a smooth surface X at a point x is a smooth surface ˜X, and the smooth curve ˜Y ∼= P1 is called the exceptional divisor.” — The exceptional divisor of a point blow-up.

### Blow-ups along regular centres do not change images on the complement

`S.5/blowup-image-on-complement` · application

Setting: X is quasi-compact and quasi-separated; i: Y → X is a regular closed immersion (Koszul-regular in the sense of SGA 6 VII 1.4: the ideal J is locally generated by a sequence whose Koszul complex is acyclic in non-zero degrees; for noetherian X, locally generated by a regular sequence) of pure codimension d ≥ 1, with conormal sheaf N := J/J², locally free of rank d on Y; p: X′ := Bl_Y X = Proj_X(⊕_{n≥0} J^n) → X is the blow-up, Y′ := p⁻¹(Y) = X′ ×_X Y with i′: Y′ → X′ and p′: Y′ → Y, and O_{X′}(1) is the tautological invertible sheaf. Let U := X − Y ≅ X′ − Y′ (S.5/regular-blowup-geometry(d)), with open immersions j: U → X and j′: U → X′. Then j′^*(K_n(X′)) = j^*(K_n(X)) as subgroups of K_n(U) for every n ∈ ℤ. If X is integral with generic point η, then im(K_n(X′) → K_n(k(η))) = im(K_n(X) → K_n(k(η))). In particular, for a regular two-dimensional scheme 𝓔 (an arithmetic surface) and the blow-up 𝓔′ at a closed point, the images of K_2(𝓔′) and K_2(𝓔) in K_2 of the generic fibre coincide.

**Hypotheses.**

- As in the setting; for the generic-point statement X integral (so that K_n(k(η)) = colim K_n(V) over non-empty opens V ⊂ U).

**Proof.**

1. By S.5/blowup-formula every class of K_n(X′) is p^*x + Σ_k i′_*(p′^*y_k)·[O_{X′}(−k)].
2. j′^*p^* = j^* because p ∘ j′ = j under U ≅ X′ − Y′ (S.2/k-theory-pullback).
3. j′^*i′_* = 0: i′_* factors through K(X′ on Y′), whose composite to K(X′ − Y′) is null (S.3's localization sequence), and multiplication by [O_{X′}(−k)] commutes with restriction.
4. Hence j′^*K_n(X′) = j^*K_n(X). For the generic point, K_n(k(η)) is the filtered colimit of K_n(V) over non-empty opens V ⊂ U (continuity; GeneralAlgebraicKTheory K.7 filtered colimits), and restriction to V factors through U.

**Acceptance.**

- Blow-up of A²_k at the origin: the images of K_n(X′) and K_n(A²_k) = K_n(k) in K_n(A²_k − 0) coincide.
- For E.6: with 𝓔 regular and proper over a Dedekind base, im(K_2(𝓔′) ⊗ ℚ → K_2(E) ⊗ ℚ) = im(K_2(𝓔) ⊗ ℚ → K_2(E) ⊗ ℚ) for a blow-up at a closed point of the special fibre (the centre is regular of codimension two).
- The exceptional summands contribute nothing on U, although they are non-zero in K_n(X′).

**Depends on.** this roadmap: `S.5/blowup-formula`, `S.5/regular-blowup-geometry`, `S.2/k-theory-pullback`, `S.3/localisation-fibre-sequence`, `S.3/support-k-theory`; other roadmaps: `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`.

**Sources.**

- `Thomason.1993`, Théorème 2.1 and §2.1.2 (p. 199): “Sur le facteur K(X), Θ⁻¹ est donné par p*: K(X) → K(X′).” — The factor that survives on the complement; transcribed from the scan.
- `Thomason.1993`, §1.2 (p. 197): “Si l’on pose U′ = X′ − Y′, le morphisme restreint p|U′: U′ → U est un isomorphisme, donc identifions U et U′.” — The identification of the complements.

## S.6 — Products, λ-operations and Adams operations

*Coverage: partial.* Every target of the stage text and of RS-18's keeps has a node. Products: support pairings, external and cup products, relative K-theory as a module spectrum, graded commutativity, pullback multiplicativity with the projection formula on supports (S.2 owns the projection formula itself), and the low-degree comparison; K.7's generic pairings and K.2:plus's plus construction are imported. λ-ring algebra: Grothendieck's universal polynomials, special λ-rings, the monoid λ-rings, the identity principle, Adams operations with additivity, multiplicativity, ψ^kψ^l = ψ^{kl} and the Frobenius congruence, the γ-filtration, ψ^k = k^n on gr^n_γ, and the rational weight decomposition with its projectors. Genuine higher construction (not exterior powers on objects): Serre's R_ℤ(GL_N), R_A(G), the classifying map q, the Quillen–Hiller–Kratzer operations on K_0(A) × [X, BGL(A)^+], their special λ-structure, Hiller's universality, multiplicativity for Loday's product, units and products of units, Kratzer's low γ-steps, Soulé's γ-length bound and the affine and field weight decompositions (the Quillen–Hiller form requested by KTheoryFiniteLocalFields L.1, with ψ^p = Φ^* on R_A(G)); for regular schemes Soulé's sheaf-level operations on K-theory with supports (via the hypercohomology of ℤ × BGL^+), the K_0(X)-λ-algebra structure, naturality including the boundary into support K-theory, multiplicativity, the γ-length bound, the weight decomposition K_m(X)_ℚ = ⊕_{i=α}^{m+d}K^{(i)} with integral refinement modulo 𝒮_{m+d} and explicit projectors and denominators, finite coefficients for ℓ > m + d + 1, the singular quasi-projective case, and Riou's uniqueness comparison. Degree zero is compared with Z.3's λ, γ, augmentation, γ-filtration and determinant (S.6/degree-zero-comparison), in the direction Z.3 → S.6. Weight shifts: Bott's θ^k, Grothendieck's twisted λ-ring, ψ^k(N, x) = θ^k(N)ψ^k(x), Riemann–Roch without denominators, the Gysin shift ψ^kj_* = k^cj_*ψ^k for trivial conormal, finite étale transfers, operations on the coniveau spectral sequence and the residue shift ∂ψ^k = kψ^k∂. The flag bundle and the K-theoretic splitting principle, S.7 targets, are planned here because S.6 uses them (restructure). Consumers: E.4's request (ψ^k on K_*(X), ψ^k[L] = [L^k], multiplicativity, pullback, projectors, Gysin shift, finite coefficients) is met by S.6/scheme-weight-decomposition, S.6/gysin-weight-shift and S.6/finite-coefficient-weight-decomposition; L.1's by S.6/quillen-hiller-operations, S.6/quillen-hiller-special-lambda, S.6/representation-frobenius and S.6/hiller-universality; P.3/P.4's by S.6/field-weight-decomposition and S.6/gamma-filtration.

- Remaining: Quillen's homology isomorphism for block-triangular groups (Characteristic classes of representations, LNM 551), used for the additivity of q on non-split exact sequences (gap).
- Remaining: Proof of Serre's Théorème 4 (representation ring of a split reductive group over a field); the ℂ case is requested from Tau Ceti RepresentationTheory/ClassicalGroups layers 3–4 (gap and request).
- Remaining: Hiller's obstruction-theoretic proof of the universality of q (gap), on which the multiplicativity of ψ^k for Loday's product rests.
- Remaining: Suslin's stability theorems (surjective stability for Volodin's model; stability for local rings) and Serre's splitting theorem, used for the γ-length bounds (gaps).
- Remaining: The Brown–Gersten closed model structure on simplicial sheaves (gap), and the global comparison of the sheaf-level tensor pairing with Waldhausen's product (gap; Riou Proposition 3.2.1 covers smooth schemes over a regular base).
- Remaining: Grothendieck's integrality of the twisted λ-operations (SGA 6 V §5) and SGA 6 VI 6.6 (F^{d+1}_γK_0 = 0) — SGA 6 not obtained (gaps).
- Remaining: Fulton's factorisation lemma for embeddings of singular quasi-projective schemes (gap), and the A¹-homotopy input of Riou's uniqueness (gap).
- Remaining: Soulé's Théorème 2 (top weight of K_m of a field is Milnor K-theory modulo torsion) is not planned (gap).

### Products of K-theory with supports

`S.6/support-product-pairings` · construction

Let X be a quasi-compact quasi-separated scheme and Y, Z ⊆ X closed subsets with quasi-compact complements. The derived tensor product of perfect complexes, computed on the model of bounded-above flat perfect complexes, restricts to a biexact functor Perf_Y(X) × Perf_Z(X) → Perf_{Y∩Z}(X) (a complex acyclic off Y tensored with one acyclic off Z is acyclic off Y ∩ Z), and hence induces pairings of spectra K(X on Y) ∧ K(X on Z) → K(X on Y ∩ Z) and, for X noetherian, K(X on Y) ∧ G(X on Z) → G(X on Y ∩ Z), with the same statements for the nonconnective spectra. On homotopy groups they give bilinear products K^Y_m(X) ⊗ K^Z_n(X) → K^{Y∩Z}_{m+n}(X), m, n ≥ 0 (all m, n ∈ ℤ nonconnectively). For Y = Z = X they are the pairings of S.2/tensor-product-pairings, and they are compatible with the maps forgetting supports K(X on Y) → K(X on Y') for Y ⊆ Y'.

**Hypotheses.**

- X qcqs; Y, Z closed with X − Y, X − Z quasi-compact (the hypothesis under which the support categories of S.3 are defined).
- The G-theory pairing needs X noetherian.
- The products are defined up to canonical homotopy; their homotopy-group products are strict.

**Proof.**

1. Take the models of S.1/perfect-waldhausen-models: bounded-above complexes of flat O_X-modules which are perfect, with the extra acyclicity condition off Y (TT 3.5.3, 3.8); on them ⊗_{O_X} represents ⊗^L and preserves quasi-isomorphisms in each variable (TT 3.15).
2. Acyclicity: the stalk of E ⊗^L F at x ∉ Y ∩ Z vanishes because one factor is acyclic at x (S.3/perfect-complexes-with-support); perfectness of E ⊗^L F is S.1/perfect-derived-tensor.
3. The functor preserves cofibrations (degreewise split monomorphisms) and weak equivalences in each variable and satisfies the admissibility condition of a biexact functor, so the generic construction of GeneralAlgebraicKTheory K.7/biexact-pairings-and-products gives the pairing of connective K-theory spectra; S.3/support-k-theory builds the nonconnective spectra from the same categories, and the pairing extends to them by K.7's compatibility with the nonconnective extension (request to K.7).
4. For the G-theory version replace the second category by cohomologically bounded pseudo-coherent complexes acyclic off Z (TT 3.11.3, 3.15.5); the product with a perfect complex keeps it pseudo-coherent and bounded.
5. Compatibility with forgetting supports: the forgetful functor Perf_Y(X) → Perf_{Y'}(X) commutes strictly with ⊗.

**API.**

- `TauCeti.AlgebraicGeometry.KTheory.supportPairing` (constructor): The pairing K(X on Y) ∧ K(X on Z) → K(X on Y ∩ Z).
- `TauCeti.AlgebraicGeometry.KTheory.supportMul` (data): The bilinear product K^Y_m(X) ⊗ K^Z_n(X) → K^{Y∩Z}_{m+n}(X).
- `TauCeti.AlgebraicGeometry.KTheory.supportMul_forget` (compatibility): Forgetting supports commutes with the products.
- `TauCeti.AlgebraicGeometry.KTheory.supportMul_self` (compatibility): For Y = Z = X the product is that of S.2/tensor-product-pairings.
- `TauCeti.AlgebraicGeometry.KTheory.supportMul_zero_class` (simp): On π_0 the product of [E] and [F] is [E ⊗^L F].
- `TauCeti.AlgebraicGeometry.KTheory.gSupportPairing` (constructor): The pairing K(X on Y) ∧ G(X on Z) → G(X on Y ∩ Z), X noetherian.

**Unit tests.**

- `supportMul_disjoint` (degenerate): If Y ∩ Z = ∅ the pairing lands in K(X on ∅) ≃ 0, so every product vanishes.
- `supportMul_point_line` (computation): On X = A²_k with Y = {x = 0}, Z = {y = 0}: [O_Y]·[O_Z] = [O_{Y∩Z}] = [k(0)] in K^{0}_0(A²_k), because the Koszul complexes of x and y tensor to that of (x, y).
- `supportMul_non_unital` (non-example): For Y ≠ X, K^Y_0(X) has no unit for the product: on X = Spec k[t], Y = {0}, K^Y_0(X) ≅ K_0(k) = ℤ·[k(0)] with [k(0)]² = [k(0) ⊗^L k(0)] = [k(0)] − [k(0)] = 0.
- `supportMul_self_compat` (compatibility): For Y = Z = X the product equals S.2/tensor-product-pairings on K_*(X).

**Acceptance.**

- For Y = X the pairing K(X) ∧ K(X on Z) → K(X on Z) makes K(X on Z) a K(X)-module spectrum.
- On π_0, [E]·[F] = [E ⊗^L F] in K^{Y∩Z}_0(X).

**Used by.**

- Soulé 1985, 4.3: the tensor-product pairing on K^Y(X) whose interaction with the operations is Proposition 4 and Théorème 3
- S.6/riemann-roch-without-denominators: j_* : K^Z(Y)_N → K^Z(X) is a ring homomorphism for the twisted product
- S.3/boundary-module-linearity: the K_*(X)-linearity of the localisation boundary into support K-theory
- EllipticKTheory E.4 (self-intersection and projection formulas on a curve): cup products with support at a point

**Depends on.** this roadmap: `S.2/tensor-product-pairings`, `S.3/perfect-complexes-with-support`, `S.3/support-k-theory`, `S.1/perfect-derived-tensor`, `S.1/perfect-waldhausen-models`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`, `GeneralAlgebraicKTheory:K.7`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.15, pairings (3.15.4) and (3.15.5) (printed p. 318): “(3.15.4) K(X on Y)∧K(X on Z)→K(X on Y ∩ Z)” — The support pairing; (3.15.5) is the G-theory analogue K(X on Y) ∧ G(X on Z) → G(X on Y ∩ Z).
- `ThomasonTrobaugh.1990`, 3.15 (printed p. 319): “Moreover K(X on Y) has a commutative and associative multiplication up to “coherent homotopy,” but fails to have a unit when X ≠ Y.” — The multiplication on support K-theory, non-unital when Y ≠ X.

### External products and the cup product

`S.6/external-product` · construction

Let S be a scheme, X and Z qcqs S-schemes with X flat over S, and Y ⊆ X, W ⊆ Z closed with quasi-compact complements. External tensor product (E, F) ↦ pr_1^*E ⊗_{O_{X×_SZ}} pr_2^*F is biexact on the flat perfect models and induces the external product ⊠: K(X on Y) ∧ K(Z on W) → K(X ×_S Z on Y ×_S W), with K(X) ∧ G(Z) → G(X ×_S Z) for Z noetherian and X ×_S Z noetherian. The internal product of S.6/support-product-pairings is recovered by pulling back along the diagonal: x·y = Δ^*(x ⊠ y) for x ∈ K^Y(X), y ∈ K^Z(X), Δ: X → X ×_S X (S = X, or S = Spec ℤ with X flat over ℤ). The external product is bilinear, associative, and natural for pullback along maps of S-schemes.

**Hypotheses.**

- X flat over S (so that the external tensor product represents the derived one; TT 3.15.6). Without flatness the external product is defined through derived tensor products on X ×_S Z.
- Supports are closed subsets with quasi-compact complements.

**Proof.**

1. On flat perfect models pr_1^* and pr_2^* are exact and preserve flatness; the tensor product of the pullbacks is perfect and acyclic off Y ×_S W (S.1/perfect-derived-pullback via S.2/derived-pullback-perfect, S.1/perfect-derived-tensor).
2. Biexactness and K.7/biexact-pairings-and-products give the pairing of spectra; the G-version uses pseudo-coherent bounded complexes (TT 3.15.7).
3. Δ^*(pr_1^*E ⊗ pr_2^*F) ≅ E ⊗ F naturally, and a natural quasi-isomorphism of biexact functors gives a homotopy of pairings (TT 1.5.4 via K.7), so x·y = Δ^*(x ⊠ y).
4. Associativity and naturality from the corresponding natural isomorphisms of tensor products and pullbacks.

**API.**

- `TauCeti.AlgebraicGeometry.KTheory.externalPairing` (constructor): ⊠: K(X on Y) ∧ K(Z on W) → K(X ×_S Z on Y ×_S W).
- `TauCeti.AlgebraicGeometry.KTheory.externalMul_assoc` (structure): (x ⊠ y) ⊠ z = x ⊠ (y ⊠ z) under the associativity isomorphism of fibre products.
- `TauCeti.AlgebraicGeometry.KTheory.diag_externalMul` (characterisation): Δ^*(x ⊠ y) = x·y.
- `TauCeti.AlgebraicGeometry.KTheory.externalMul_pullback` (functoriality): (f × g)^*(x ⊠ y) = f^*x ⊠ g^*y for maps of S-schemes.
- `TauCeti.AlgebraicGeometry.KTheory.externalMul_one` (simp): [O_X] ⊠ y = pr_2^*y.
- `TauCeti.AlgebraicGeometry.KTheory.gExternalPairing` (constructor): K(X) ∧ G(Z) → G(X ×_S Z) for noetherian Z and X ×_S Z.

**Unit tests.**

- `externalMul_point` (degenerate): For X = Z = S the external product is the internal product of S.6/graded-commutative-ring.
- `externalMul_structure_sheaf` (computation): [O_X] ⊠ [O_Z] = [O_{X ×_S Z}] in K_0(X ×_S Z).
- `externalMul_projective_line` (computation): On P^1_k × P^1_k, ([O] − [O(−1)]) ⊠ ([O] − [O(−1)]) is the class of the structure sheaf of a point (Koszul resolution of a point as intersection of two lines).
- `diag_externalMul_compat` (compatibility): Δ^*(x ⊠ y) equals the product of S.2/tensor-product-pairings on K_*(X).

**Acceptance.**

- For X = Z = S = Spec k, ⊠ is the product of K_*(k).
- [O_X] ⊠ [O_Z] = [O_{X×Z}].

**Used by.**

- Soulé 1985, Théorème 7 v): φ^k(α ⊠ β) = φ^k(α) ⊠ φ^k(β) on G-theory
- S.6/scheme-lambda-algebra: λ-identities involving two variables are transported along external products from R_Z(GL_N × GL_M)
- S.5/projective-bundle-theorem: K(P^r_X) is generated over K(X) by external products with the classes O(−i) on P^r_S

**Depends on.** this roadmap: `S.6/support-product-pairings`, `S.2/derived-pullback-perfect`, `S.1/perfect-derived-pullback`, `S.1/perfect-derived-tensor`, `S.2/k-theory-pullback`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.15 (printed p. 319): “There are also external pairings induced by (E·, F·) → E· ⊗_{O_S} F· for X flat over S and Z over S.” — The external pairings (3.15.6) K(X) ∧ K(Z) → K(X ×_S Z) and (3.15.7) K(X) ∧ G(Z) → G(X ×_S Z).
- `Soule.1985`, Théorème 7 v) (p. 533): “Si X et Y sont des schémas de 𝒱_S le produit externe ⊠: K'_m(X) × K'_n(Y) → K'_{m+n}(X × Y)” — Soulé uses the external product on G-theory and its compatibility with his operations.

### Relative K-theory of a map of schemes as a module spectrum

`S.6/relative-k-theory-module` · construction

For a morphism f: X' → X of qcqs schemes define the relative K-theory K(f) as the homotopy fibre of f^*: K(X) → K(X') (GeneralAlgebraicKTheory K.5, for the exact functor f^* on flat perfect models), with its long exact sequence ⋯ → K_{n+1}(X') → K_n(f) → K_n(X) → K_n(X') → ⋯. Because f^* is a map of ring spectra (S.6/product-pullback-compatibility), K(f) is a K(X)-module spectrum and every map in the long exact sequence is K_*(X)-linear (K_*(X) acting on K_*(X') through f^*). For f = j: U ↪ X an open immersion with complement Y (quasi-compact U), the localisation fibre sequence K(X on Y) → K(X) → K(U) of S.3/localisation-fibre-sequence identifies K(X on Y) with K(j) in the nonconnective theory, as K(X)-modules. For a closed immersion defined by an ideal I (a pair (X, V(I))), K(f) is the relative K-theory of the pair.

**Hypotheses.**

- f is a morphism of qcqs schemes; for the identification with support K-theory the nonconnective spectra are used (connective K(X on Y) and the connective fibre differ in degree 0).
- The module structure is defined up to coherent homotopy.

**Proof.**

1. Define K(f) as the homotopy fibre (StableHomotopyKTheory H.2/homotopy-fibre-and-long-exact-sequence) of the map of spectra f^* of S.2/k-theory-pullback; this is K.5's relative K-theory of the exact functor f^*.
2. K(X) acts on K(X) and on K(X') (through f^*) compatibly with f^*, since f^* is multiplicative (S.6/product-pullback-compatibility); the homotopy fibre of a map of module spectra is a module spectrum, and the maps of its fibre sequence are module maps.
3. For an open immersion the localisation fibre sequence of S.3/localisation-fibre-sequence is a sequence of K(X)-modules (S.6/support-product-pairings with Z = X), giving the identification.

**API.**

- `TauCeti.AlgebraicGeometry.KTheory.relative` (constructor): K(f) = hofib(f^*: K(X) → K(X')).
- `TauCeti.AlgebraicGeometry.KTheory.relative_les` (structure): The long exact sequence ⋯ → K_{n+1}(X') → K_n(f) → K_n(X) → K_n(X') → ⋯.
- `TauCeti.AlgebraicGeometry.KTheory.relative_module` (structure): K_*(f) is a graded K_*(X)-module and the long exact sequence is K_*(X)-linear.
- `TauCeti.AlgebraicGeometry.KTheory.relative_open_immersion` (compatibility): For an open immersion j: U → X with closed complement Y, K(j) ≃ K(X on Y) as K(X)-modules (nonconnective).
- `TauCeti.AlgebraicGeometry.KTheory.relative_map` (functoriality): A commutative square of schemes induces a map of relative K-theories, functorially.

**Unit tests.**

- `relative_id` (degenerate): K(id_X) ≃ 0.
- `relative_open_compat` (compatibility): For j: U ↪ X open, K_n(j) ≅ K_n(X on Y) (nonconnective, S.3/support-k-theory), and the boundary K_{n+1}(U) → K_n(j) is S.3/localisation-boundary.
- `relative_dvr` (computation): For Spec L ↪ Spec O (O a DVR with residue field k): K_0(j) ≅ K_0(k) ≅ ℤ and the map K_1(L) → K_0(j) is the valuation (S.3/dvr-boundary-unit-valuation).
- `relative_not_quotient` (non-example): K_n(f) is not the cokernel of f^*: for f: Spec ℚ → Spec ℤ, K_0(ℤ) → K_0(ℚ) is an isomorphism but K_0(f) ≅ ⊕_p K_0(𝔽_p) ≠ 0 (nonconnective localisation, S.3/dedekind-localisation-sequence).

**Acceptance.**

- For f = id, K(f) ≃ 0.
- For the inclusion j of the generic point of Spec O (O a DVR with residue field k), K(j) ≃ K(O on closed point) ≃ K(k) (S.3/regular-support-devissage), as K(O)-modules.

**Used by.**

- S.6 stage text ('Extend the external products of K.7 to schemes, supports and relative theories'): the relative theory with its module structure
- GeneralAlgebraicKTheory K.7 ('Prove compatibility with relative groups'): the scheme form of K.7's relative-group compatibility
- S.6/operations-functoriality: the operations commute with the maps of the localisation sequence into support K-theory

**Depends on.** this roadmap: `S.2/k-theory-pullback`, `S.3/localisation-fibre-sequence`, `S.6/support-product-pairings`, `S.6/product-pullback-compatibility`; other roadmaps: `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`, `GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary`.

**Sources.**

- `Kbook.2013`, Relative K-groups IV.1.11 (PDF p. 275): “Given a ring homomorphism f : R →R′, let K(f) be the homotopy ﬁber of K(R) →K(R′), and set Kn(f) = πnK(f).” — Relative K-theory as a homotopy fibre with its long exact sequence; the node applies it to f^* for schemes (K.5 owns the ring and exact-functor versions).
- `ThomasonTrobaugh.1990`, 3.15 (printed p. 319): “The spectrum G(X) is a module spectrum over K(X), and when it exists, f* : G(X') → G(X) is a map of module spectra over K(X') (cf. e.g., [Ma2]).” — The module-spectrum structures and their compatibility with pullback, used for the relative theory.

### Multiplicativity of pullback and the projection formula with supports

`S.6/product-pullback-compatibility` · lemma

Let f: X' → X be a morphism of qcqs schemes and Y, Z ⊆ X closed with quasi-compact complements. (a) f^*: K^Y_m(X) → K^{f^{−1}Y}_m(X') satisfies f^*(x·y) = f^*(x)·f^*(y) and f^*[O_X] = [O_{X'}]; (b) f^* commutes with forgetting supports and with external products; (c) if f is proper and perfect between noetherian schemes (or as in S.2/k-theory-proper-pushforward), then for x ∈ K^{W}_m(X') with f(W) closed and y ∈ K^Y_n(X): f_*(x·f^*y) = f_*(x)·y in K^{f(W)∩Y}_{m+n}(X), and the same with G-theory in the x-variable. For Y = X and W = X' this is S.2/projection-formula.

**Hypotheses.**

- f is a morphism of qcqs schemes; in (c) f_* is S.2's proper pushforward, extended to supports as in TT 3.16.7.

**Proof.**

1. (a), (b): on flat perfect models f^* is strictly monoidal up to the canonical isomorphism f^*(E ⊗ F) ≅ f^*E ⊗ f^*F (TT 3.14, 3.15: f^* is a map of ring spectra); a natural isomorphism of biexact functors gives a homotopy of pairings (K.7).
2. (c): the natural quasi-isomorphism Rf_*(E) ⊗^L F ≅ Rf_*(E ⊗^L Lf^*F) of S.2/derived-projection-formula is natural in complexes acyclic off W and off Y respectively, so the argument of S.2/projection-formula (TT 3.17) applies to the support categories.

**Acceptance.**

- For f the structure map of P^1_k → Spec k and y = 1, f_*(x) = f_*(x·1) (the degenerate case).
- For a closed immersion i: Y → X and y ∈ K_0(X): i_*(i^*y) = i_*(1)·y = [O_Y]·y.

**Depends on.** this roadmap: `S.2/k-theory-pullback`, `S.2/derived-pullback-perfect`, `S.2/derived-projection-formula`, `S.2/projection-formula`, `S.2/k-theory-proper-pushforward`, `S.6/support-product-pairings`, `S.6/external-product`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.15 (printed p. 319): “and the canonical map K^naive(X) → K(X) and also f* : K(X') → K(X) and f* : K^naive(X') → K^naive(X) are maps of such ring spectra.” — Part (a).
- `ThomasonTrobaugh.1990`, Proposition 3.17 (printed p. 320): “Then f* is a map of module spectra over the ring spectra K(Y).” — The projection formula, whose support version is part (c).

### K-theory of a scheme is a graded-commutative ring

`S.6/graded-commutative-ring` · theorem · planet “Graded-commutative K-theory ring”

For a qcqs scheme X the products of S.2/tensor-product-pairings and S.6/support-product-pairings make K_*(X) = ⊕_{n∈ℤ} K_n(X) (nonconnective) a graded ring with unit [O_X], associative and graded-commutative: xy = (−1)^{mn}yx for x ∈ K_m(X), y ∈ K_n(X). For closed Y ⊆ X with quasi-compact complement, K^Y_*(X) is an associative, graded-commutative, possibly non-unital ring and a graded K_*(X)-module; for X noetherian, G_*(X) is a graded K_*(X)-module. For X = Spec A these are the ring K_*(A) of GeneralAlgebraicKTheory K.7.

**Hypotheses.**

- X qcqs; the sign (−1)^{mn} is part of the statement: K_*(X) is not commutative in the ungraded sense (for a field F with a unit a, {a, a} = {a, −1} ∈ K_2(F), and the sign matters in odd degrees).

**Proof.**

1. Associativity and unit: the natural isomorphisms (E ⊗ F) ⊗ G ≅ E ⊗ (F ⊗ G) and O_X ⊗ E ≅ E of biexact (triexact) functors induce homotopies between the corresponding pairings (K.7/biexact-pairings-and-products, K.7's associativity and unit homotopies).
2. Commutativity: the symmetry isomorphism E ⊗ F ≅ F ⊗ E gives a homotopy between the pairing μ and μ ∘ τ, where τ swaps the smash factors; on homotopy groups τ acts on S^m ∧ S^n by a map of degree (−1)^{mn}, which gives xy = (−1)^{mn}yx (K.7: graded commutativity from the symmetry homotopy).
3. Supports and G-theory: the same isomorphisms restricted to the support categories of S.6/support-product-pairings.
4. Affine case: S.2/affine-k-theory-comparison identifies K(Spec A) with K(A) compatibly with the tensor product of projective modules.

**Acceptance.**

- K_0(X) is a commutative ring with unit [O_X], and K_1(F) ⊗ K_1(F) → K_2(F) is antisymmetric for a field F.
- For X = Spec F, F a field: K_0(F) = ℤ acts on K_n(F) by multiplication.

**Depends on.** this roadmap: `S.2/tensor-product-pairings`, `S.6/support-product-pairings`, `S.2/affine-k-theory-comparison`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`, `GeneralAlgebraicKTheory:K.7`.

**Sources.**

- `ThomasonTrobaugh.1990`, 3.15 (printed p. 319): “As the tensor product ⊗ is associative and commutative up to “coherent natural isomorphism,” K(X) and K^naive(X) are in fact “homotopy-everything” ring spectra,” — The ring structure on K(X), from which graded commutativity of K_*(X) follows.
- `Kbook.2013`, Theorem IV.1.10 (PDF p. 274): “If A is commutative, the induced product Kp(A) ⊗Kq(A) →Kp+q(A ⊗A) →Kp+q(A) is graded-commutative.” — The affine case (Loday).

### Products in low degrees

`S.6/product-low-degree-comparison` · comparison

For a qcqs scheme X: (a) the product on K_0(X) is [E]·[F] = [E ⊗^L F] for perfect complexes, and on classes of vector bundles [E]·[F] = [E ⊗ F]; for X = Spec A it is the ring structure of KTheoryLowDegrees Z.3 (tensor product of finitely generated projectives, Z.3/finite-projective-monoidal) under S.2/affine-k-theory-comparison; (b) K_0(X) × K_1(X) → K_1(X): for X = Spec A, [P]·[α] = [id_P ⊗ α] for a finitely generated projective P and α ∈ GL_n(A), in particular [A]·x = x; (c) K_1(A) ⊗ K_1(A) → K_2(A) agrees with Loday's product of the K-book IV.1.10 (for units a, b ∈ A^× their product is the element denoted {a, b} there).

**Hypotheses.**

- A commutative for (b), (c); X qcqs for (a).

**Proof.**

1. (a): π_0 of the Waldhausen K-theory of Perf(X) is K_0(D_perf(X)) (S.2/k-zero-of-a-scheme), and the pairing on π_0 is induced by the biexact functor itself; for a vector bundle E, E ⊗^L F = E ⊗ F. For X = Spec A, the degree-zero product of K.7/biexact-pairings-and-products is the classical one ('The K₀ product agrees with the classical product').
2. (b): π_1 of the S-construction of P(A) is K_1(A) = GL(A)^{ab} (GeneralAlgebraicKTheory K.2:plus and KTheoryLowDegrees U.2/K1), and the product with [P] is induced by the exact functor P ⊗ −, which sends α to id_P ⊗ α.
3. (c): the comparison of Waldhausen's product with Loday's is cited (Riou Remark 3.2.2: 'This comparison was already known (see [48])'); recorded as a gap.

**Acceptance.**

- [O(1)]·[O(1)] = [O(2)] on P^1_k.
- For A a field F and a ∈ F^×, [F]·a = a in K_1(F) = F^×.

**Depends on.** this roadmap: `S.2/k-zero-of-a-scheme`, `S.2/affine-k-theory-comparison`, `S.6/graded-commutative-ring`; other roadmaps: `KTheoryLowDegrees:Z.3/finite-projective-monoidal`, `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`, `KTheoryLowDegrees:U.2/K1`, `GeneralAlgebraicKTheory:K.2:plus`.

**Sources.**

- `Kbook.2013`, Theorem IV.1.10 (PDF p. 274): “Moreover, the special case K1(A)⊗K1(B) →K2(A⊗B) coincides with the product deﬁned in III.5.12.” — Loday's product in degree (1, 1), the comparison target of (c).
- `Riou.2009`, Remark 3.2.2 (p. 13): “In particular, Waldhausen's pairing coincide with those defined by Quillen and Loday. This comparison was already known (see [48]).” — The cited comparison used in (c).

### Grothendieck's universal polynomials P_k and P_{k,l}

`S.6/lambda-universal-polynomials` · construction

For integers k, l ≥ 1 there are unique polynomials P_k ∈ ℤ[a_1,…,a_k; b_1,…,b_k] and P_{k,l} ∈ ℤ[a_1,…,a_{kl}] such that, for all n, m ≥ k (respectively n ≥ kl), in the polynomial ring ℤ[ξ_1,…,ξ_n, η_1,…,η_m] one has e_k((ξ_iη_j)_{i≤n, j≤m}) = P_k(e_1(ξ),…,e_k(ξ); e_1(η),…,e_k(η)) and e_k((ξ_{i_1}⋯ξ_{i_l})_{i_1<⋯<i_l}) = P_{k,l}(e_1(ξ),…,e_{kl}(ξ)), where e_j denotes the j-th elementary symmetric polynomial of the listed family. Giving a_i and b_i the weight i, P_k is isobaric of weight k in the a's and of weight k in the b's, and P_{k,l} is isobaric of weight kl. The polynomials do not depend on n and m. Together with the Newton polynomials N_k (ψ^k = N_k(λ^1,…,λ^k), the power sum p_k written in the e_j) they are the only universal polynomials the λ-ring layer uses.

**Hypotheses.**

- The coefficient ring is ℤ; no division occurs.
- n and m are at least k (at least kl for P_{k,l}); for smaller n the identities still hold after setting a_i = 0 for i > n.

**Proof.**

1. The left-hand sides are symmetric in ξ (and, for P_k, separately in η): a permutation of the ξ_i permutes the listed family of products (mathlib:MvPolynomial.IsSymmetric).
2. By the fundamental theorem of symmetric polynomials (mathlib:MvPolynomial.esymmAlgEquiv, in the unbundled form tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm) a symmetric polynomial in n variables is a unique polynomial in e_1,…,e_n; apply it in ξ over the coefficient ring ℤ[η], then in η, for P_k.
3. Isobaric weight: e_k of a family of monomials of total degree d is homogeneous of degree kd; the fundamental-theorem polynomial of a homogeneous symmetric polynomial of degree w only involves monomials in e_1,…,e_n of weight w, so only a_1,…,a_k (respectively a_1,…,a_{kl}) occur.
4. Independence of n: specialising ξ_n ↦ 0 sends e_j(ξ_1,…,ξ_n) to e_j(ξ_1,…,ξ_{n−1}) and e_n to 0, and sends the listed family to the family for n − 1 plus zeros, which do not change e_k; uniqueness in n − 1 ≥ k variables gives the same polynomial.
5. The Newton polynomials N_k with p_k = N_k(e_1,…,e_k) come from Newton's identities (mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum, mathlib:MvPolynomial.mul_esymm_eq_sum).

**API.**

- `TauCeti.LambdaRing.productPoly` (constructor): The polynomial P_k ∈ ℤ[a_1,…,a_k; b_1,…,b_k].
- `TauCeti.LambdaRing.compPoly` (constructor): The polynomial P_{k,l} ∈ ℤ[a_1,…,a_{kl}].
- `TauCeti.LambdaRing.newtonPoly` (constructor): The Newton polynomial N_k with p_k = N_k(e_1,…,e_k).
- `TauCeti.LambdaRing.productPoly_esymm` (characterisation): e_k((ξ_iη_j)) = P_k(e(ξ); e(η)) in ℤ[ξ_1,…,ξ_n, η_1,…,η_m] for n, m ≥ k.
- `TauCeti.LambdaRing.compPoly_esymm` (characterisation): e_k of the products of l distinct ξ's equals P_{k,l}(e(ξ)) for n ≥ kl.
- `TauCeti.LambdaRing.productPoly_unique` (extensionality): A polynomial Q with Q(e(ξ); e(η)) = e_k((ξ_iη_j)) for some n, m ≥ k equals P_k (algebraic independence of the e_j).
- `TauCeti.LambdaRing.productPoly_isobaric` (other): P_k is isobaric of weight k in each set of variables, P_{k,l} of weight kl.

**Unit tests.**

- `productPoly_one` (computation): P_1(a_1; b_1) = a_1 b_1.
- `productPoly_two` (computation): P_2 = a_1²b_2 + a_2b_1² − 2a_2b_2.
- `compPoly_two_two` (computation): P_{2,2} = a_1a_3 − a_4.
- `compPoly_k_one` (degenerate): P_{k,1} = a_k and P_{1,l} = a_l.
- `productPoly_ne_naive` (non-example): P_2 ≠ a_2b_2 + a_1b_1 (the naive guess λ²(xy) = λ²(x)λ²(y) + xy fails for x = y = 2 in ℤ: λ²(4) = 6 while 1 + 4 = 5).

**Acceptance.**

- P_1 = a_1b_1 and P_{1,l} = a_l, P_{k,1} = a_k.
- P_2 = a_1²b_2 + a_2b_1² − 2a_2b_2 and P_{2,2} = a_1a_3 − a_4 (both checked by expanding in 3 + 3 respectively 4 variables).
- N_2 = a_1² − 2a_2 and N_3 = a_1³ − 3a_1a_2 + 3a_3.

**Used by.**

- S.6/lambda-ring: the product and composition axioms of a special λ-ring
- S.6/lambda-identity-principle: identities in special λ-rings are reduced to identities between these polynomials
- KTheoryLowDegrees Z.3 coverage (remaining item on special-λ product and iteration polynomials): the polynomials Z.3 needs for its degree-zero identities

**Depends on.** libraries: `mathlib:MvPolynomial.esymm`, `mathlib:MvPolynomial.IsSymmetric`, `mathlib:MvPolynomial.esymmAlgEquiv`, `tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm`, `mathlib:MvPolynomial.psum`, `mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum`, `mathlib:MvPolynomial.mul_esymm_eq_sum`.

**Sources.**

- `Soule.1985`, §1.1 (p. 490): “où P_k et P_{k,l} sont des polynômes universels à coefficients entiers [14].” — Soulé's λ-ring axioms are stated with these universal polynomials; their characterisation by elementary symmetric functions is the one of Grothendieck [SGA 6] that the K-book reproduces.
- `Kbook.2013`, Example II.4.3 (PDF p. 100): “It is not hard to see that there are “universal” polynomials Pn in 2n variables so:” — The K-book defines the product on Witt vectors, hence the product axiom of a special λ-ring, by these polynomials; P_{n,k} are introduced in the same paragraph for λ^k on W(R).

### Special λ-rings, λ-homomorphisms, λ-ideals and non-unital λ-algebras

`S.6/lambda-ring` · definition · planet “Special λ-ring”

A special λ-ring (Grothendieck's λ-anneau, Atiyah's special λ-ring) is a commutative unital ring K with maps λ^k: K → K, k ≥ 0, such that for all x, y ∈ K: λ^0(x) = 1 and λ^1(x) = x; λ^k(x + y) = Σ_{i=0}^{k} λ^i(x)λ^{k−i}(y); λ^k(1) = 0 for k ≥ 2; λ^k(xy) = P_k(λ^1x,…,λ^kx; λ^1y,…,λ^ky); λ^k(λ^l x) = P_{k,l}(λ^1x,…,λ^{kl}x). The first two axioms alone define a pre-λ-ring (the K-book's 'λ-ring'); they say that λ_t(x) = Σ λ^k(x)t^k is a group homomorphism from (K, +) to the units of K[[t]] with constant term 1. A λ-homomorphism is a ring homomorphism commuting with every λ^k; a λ-ideal is an ideal I with λ^k(I) ⊆ I for k ≥ 1. A non-unital λ-algebra over a special λ-ring K_0 is a commutative ring I without unit, with a K_0-module structure and operations λ^k: I → I (k ≥ 1), such that ℤ ⊕ I, or K_0 ⊕ I with (a, x)(b, y) = (ab, ay + bx + xy), with λ^k(a, x) = (λ^k a, Σ_{i<k} λ^i(a)λ^{k−i}(x)), is a special λ-ring; in particular I is a λ-ideal of it. This is the structure Soulé puts on K(A) = ⊕_{m≥0} K_m(A) and on support K-theory K^Y(X).

**Hypotheses.**

- K is commutative with unit; the zero ring is allowed.
- The operations are set maps; only λ^1 and the sum formula make λ_t additive.
- 'λ-ring' without qualification in this packet means special λ-ring; pre-λ-rings are named as such.

**Proof.**

1. Define the structure with the five axioms, using S.6/lambda-universal-polynomials for P_k and P_{k,l}.
2. λ_t is additive by the sum axiom and takes values in 1 + tK[[t]], a subgroup of the units of K[[t]] (mathlib:PowerSeries, constant coefficient 1).
3. λ-homomorphisms compose and contain the identities; λ-ideals are closed under sums and intersections.
4. For a non-unital λ-algebra the unitalisation is defined by the stated formula; the special axioms for it are the definition (Soulé 4.3).

**API.**

- `TauCeti.PreLambdaRing` (structure): A commutative ring with operations λ^k such that λ^0 = 1, λ^1 = id and the sum formula hold.
- `TauCeti.LambdaRing` (structure): A pre-λ-ring satisfying λ^k(1) = 0 (k ≥ 2), the product axiom with P_k and the composition axiom with P_{k,l}.
- `TauCeti.LambdaRing.lambdaTotal` (data): λ_t: K → (1 + tK[[t]], ·) as an additive-to-multiplicative group homomorphism.
- `TauCeti.LambdaRing.lambda_add` (simp): λ^k(x + y) = Σ_{i+j=k} λ^i(x)λ^j(y).
- `TauCeti.LambdaRing.lambda_neg` (simp): λ_t(−x) = λ_t(x)^{-1}; hence λ^k(−x) is a universal integer polynomial in λ^1x,…,λ^kx.
- `TauCeti.LambdaRing.lambda_natCast` (simp): λ^k(n) = C(n, k) for n ∈ ℕ, from λ^k(1) = 0 and the sum formula.
- `TauCeti.LambdaRing.lambda_mul` (relation): λ^k(xy) = P_k(λ^•x; λ^•y).
- `TauCeti.LambdaRing.lambda_lambda` (relation): λ^k(λ^l x) = P_{k,l}(λ^•x).
- `TauCeti.LambdaRing.Hom` (structure): λ-homomorphisms, with id and composition; bundled as a category.
- `TauCeti.LambdaRing.Ideal` (structure): λ-ideals; the kernel of a λ-homomorphism is a λ-ideal.
- `TauCeti.LambdaRing.NonUnitalAlgebra` (structure): Non-unital λ-algebras over a special λ-ring K_0, through the unitalisation K_0 ⊕ I.
- `TauCeti.LambdaRing.int` (instance): ℤ with the binomial operations is a special λ-ring, initial among special λ-rings.

**Unit tests.**

- `LambdaRing.int_lambda_two_three` (computation): In ℤ, λ²(3) = 3 and λ^3(2) = 0.
- `LambdaRing.zero_ring` (degenerate): The zero ring carries a unique special λ-ring structure.
- `LambdaRing.not_special_example` (non-example): The pre-λ-ring ℤ with λ_t(n) = (1 + t + t²)^n satisfies λ^0 = 1, λ^1 = id and additivity but λ²(1) = 1, so it is not special.
- `LambdaRing.ringK0_compat` (compatibility): For a commutative ring R, KTheoryLowDegrees Z.3's λ^k on K_0(R) (Z.3/lambda) satisfy the pre-λ-ring axioms, and S.6/vector-bundle-lambda-ring makes them special: the two structures on K_0(R) are the same maps.
- `LambdaRing.habiro_compat` (compatibility): For a torsion-free special λ-ring K, the Adams operations of S.6/adams-operations make K a Λ-ring in the sense of HabiroRings HR.1/lambda-rings-with-commuting-adams-operations (ψ^1 = id, ψ^{mn} = ψ^mψ^n, ψ^p(x) ≡ x^p mod p).

**Acceptance.**

- ℤ with λ^k(n) = C(n, k) is a special λ-ring; λ²(3) = 3.
- The pre-λ-ring ℤ with λ_t(n) = (1 + t + t²)^n is not special: λ²(1) = 1 ≠ 0.

**Used by.**

- Soulé 1985, §1.4 and Proposition 4: K(A) = ⊕ K_m(A) and K^Y(X) are (non-unital) special λ-rings
- Gillet–Soulé 1999, Theorem 3: H^0(X, K) is a λ-algebra and H^{−m}(X, K) an H^0(X, K)-λ-module
- S.7/scheme-gamma-filtration: the γ-filtration of the λ-ring K_0(Vect X)
- KTheoryFiniteLocalFields L.1/brauer-lift-lambda-ring: Brauer lifting is a λ-homomorphism between representation rings
- KTheoryLowDegrees Z.3/lambda: Z.3's operations on K_0(R) are an instance, and satisfy the pre-λ-ring axioms there

**Depends on.** this roadmap: `S.6/lambda-universal-polynomials`; libraries: `mathlib:PowerSeries`, `mathlib:PowerSeries.coeff`.

**Sources.**

- `Soule.1985`, §1.1 (pp. 489–490): “1.1 Un λ-anneau R (appelé aussi λ-anneau spécial) est un anneau commutatif unitaire, muni d'applications λ^k: R → R, k ≥ 0, vérifiant les propriétés suivantes:” — The definition, with the five axioms displayed on p. 490 (λ^0 = 1, λ^1 = id, the sum, λ^k(1) = 0 for k ≥ 2, the product and composition formulas).
- `Kbook.2013`, II.4.1 and Definition II.4.3.1 (PDF pp. 98, 101): “Warning: Our notation of λ-ring follows Atiyah; Grothendieck and other authors call this a pre-λ-ring, reserving the term λ-ring for what we call a special λ-ring;” — Pins the terminology: the packet's 'λ-ring' is the K-book's special λ-ring.
- `Soule.1985`, Proposition 4 and its explanation (p. 512): “K^Y(X) est muni d'opérations λ^k, k ≥ 1, vérifiant toutes les identités de 1.1 qui ne font pas intervenir l'unité (c'est une Z−λ-algèbre, l'anneau unitaire associé Z ⊕ K^Y(X) est un λ-anneau).” — The non-unital version used for support K-theory.

### The λ-ring of a monoid of line elements

`S.6/laurent-lambda-ring` · construction

For a commutative monoid M, the monoid ring ℤ[M] carries a unique special λ-ring structure with λ_t(m) = 1 + mt for m ∈ M (every m is a line element: λ^k(m) = 0 for k ≥ 2). On a positive element x = m_1 + ⋯ + m_n one has λ^k(x) = e_k(m_1,…,m_n), and the Adams operations of S.6/adams-operations are the ring endomorphisms ψ^k(m) = m^k. Instances: the Laurent polynomial ring W_s = ℤ[u_1^{±1},…,u_s^{±1}] (M = ℤ^s), the polynomial ring ℤ[ξ_1,…,ξ_n] (M = ℕ^n), and the character ring ℤ[X(T_N)] of the diagonal torus T_N ⊂ GL_N.

**Hypotheses.**

- M is a commutative monoid; ℤ[M] is torsion free as an abelian group.

**Proof.**

1. Define λ_t on the free abelian group ℤ[M] as the additive extension of m ↦ 1 + mt; λ^0 = 1 and λ^1 = id hold on generators and extend.
2. Define ψ^k on ℤ[M] as the ring endomorphism induced by the monoid endomorphism m ↦ m^k; it satisfies ψ^kψ^l = ψ^{kl}. On generators ψ^k(m) = m^k is the Newton expression of λ_t(m) = 1 + mt, so ψ^k agrees with S.6/adams-operations, both being additive.
3. Over ℚ, Newton's identities (mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum) express λ^k(z) as a polynomial with rational coefficients in ψ^1(z),…,ψ^k(z); by the defining property of P_k and P_{k,l} (S.6/lambda-universal-polynomials) the same rational polynomials express P_k(λ^•x; λ^•y) in the products ψ^j(x)ψ^j(y) and P_{k,l}(λ^•x) in the ψ^{jl}(x).
4. Since ψ^j is a ring endomorphism with ψ^jψ^l = ψ^{jl}, the product and composition axioms hold in ℚ[M]; ℤ[M] is torsion free, so they hold in ℤ[M]. λ^k(1) = 0 because 1 is a line element.
5. Uniqueness: a pre-λ-structure is determined by its values on additive generators.

**API.**

- `TauCeti.LambdaRing.monoidAlgebra` (instance): The special λ-ring structure on ℤ[M] with λ_t(m) = 1 + mt.
- `TauCeti.LambdaRing.monoidAlgebra_lambda_of` (simp): λ^k(m) = 0 for k ≥ 2 and m ∈ M.
- `TauCeti.LambdaRing.monoidAlgebra_lambda_sum` (simp): λ^k(m_1 + ⋯ + m_n) = e_k(m_1,…,m_n).
- `TauCeti.LambdaRing.monoidAlgebra_adams` (simp): ψ^k(m) = m^k, and ψ^k is the ring map induced by m ↦ m^k.
- `TauCeti.LambdaRing.monoidAlgebra_map` (functoriality): A monoid homomorphism M → M' induces a λ-homomorphism ℤ[M] → ℤ[M'].
- `TauCeti.LambdaRing.monoidAlgebra_lift` (universal-property): For a special λ-ring K and a monoid map M → (line elements of K), there is a unique λ-homomorphism ℤ[M] → K extending it (K-book Ex. II.4.4(c)).

**Unit tests.**

- `monoidAlgebra_lambda_two` (computation): In ℤ[u^{±1}], λ²(u + u^{−1}) = 1.
- `monoidAlgebra_trivial` (degenerate): For M the trivial monoid the structure is the binomial one on ℤ.
- `monoidAlgebra_adams_ne_frobenius` (non-example): ψ²(u + 1) = u² + 1 ≠ (u + 1)² in ℤ[u]: the Adams operation is not the squaring map.
- `monoidAlgebra_special` (characterisation): λ³(λ²(ξ_1 + ξ_2 + ξ_3)) = P_{3,2}(λ^•(ξ_1 + ξ_2 + ξ_3)) = ξ_1²ξ_2²ξ_3² in ℤ[ξ_1, ξ_2, ξ_3].

**Acceptance.**

- In ℤ[u^{±1}], λ²(u + u^{−1}) = 1 and ψ³(u + u^{−1}) = u³ + u^{−3}.
- For M trivial, ℤ[M] = ℤ with the binomial structure.

**Used by.**

- S.6/lambda-identity-principle: the universal case in which identities are checked
- S.6/representation-ring-of-gl: R_Z(GL_N) is the sub-λ-ring of Σ_N-invariants of ℤ[X(T_N)]
- K-book Ex. II.4.4: the universal special λ-ring W_s

**Depends on.** this roadmap: `S.6/lambda-ring`, `S.6/lambda-universal-polynomials`, `S.6/adams-operations`; libraries: `mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum`, `mathlib:AddMonoidAlgebra`.

**Sources.**

- `Kbook.2013`, Ex. II.4.4 (PDF p. 109): “Show that Ws is a λ-ring with a positive structure; the line elements are the monomials uα = Q uni i .” — The universal special λ-ring W_s of the K-book; its line elements are the monomials. (The excerpt reproduces the text layer; the rendered monomial is the product of the u_i^{n_i}.)
- `Serre.1968`, §3.8 (p. 52): “L'anneau Z[M] s'identifie au localisé Z[X_1, …, X_n]_{λ_n} de Z[X_1, …, X_n] par rapport à λ_n = X_1…X_n.” — Serre's identification of the character ring of the diagonal torus of GL_n, the instance used for R_Z(GL_n).

### Identities in special λ-rings are checked on sums of line elements

`S.6/lambda-identity-principle` · lemma

Let F and G be expressions built from variables x_1,…,x_r by integer constants, +, −, ·, and the operations λ^k (k ≥ 0). If F = G holds in the special λ-ring ℤ[ξ^{(1)}, …, ξ^{(r)}] of S.6/laurent-lambda-ring for x_j = ξ^{(j)}_1 + ⋯ + ξ^{(j)}_n (disjoint sets of n variables) for all sufficiently large n, then F = G holds for all elements x_1,…,x_r of every special λ-ring. The same holds with x_j replaced by x_j − n (augmented case), so identities for elements of the augmentation ideal are checked on (ξ_1 − 1) + ⋯ + (ξ_n − 1). Fixed rank: if an identity F = G between integer polynomials in λ^1(p),…,λ^n(p) holds for p = ξ_1 + ⋯ + ξ_n in ℤ[ξ_1,…,ξ_n], it holds for every element p of a special λ-ring with λ^j(p) = 0 for j > n (a positive element of rank n).

**Hypotheses.**

- The expressions involve finitely many operations; 'sufficiently large' means n at least the largest index k of any λ^k occurring after expansion.

**Proof.**

1. By induction on the expression, the axioms of S.6/lambda-ring (sum formula, λ_t(−z) = λ_t(z)^{-1}, λ^k(n) = C(n,k), the product axiom with P_k and the composition axiom with P_{k,l}) rewrite each of F and G as an integer polynomial f, g in the elements λ^i(x_j); the rewriting is the same in every special λ-ring.
2. In ℤ[ξ^{(1)},…,ξ^{(r)}] with x_j as stated, λ^i(x_j) = e_i(ξ^{(j)}) (S.6/laurent-lambda-ring), and these elementary symmetric polynomials, i ≤ n, are algebraically independent (mathlib:MvPolynomial.esymmAlgEquiv, injectivity of the evaluation at elementary symmetric polynomials).
3. Hence f(e(ξ)) = g(e(ξ)) forces f = g as polynomials in the variables λ^i(x_j), i ≤ n, and so F = G in every special λ-ring.
4. Augmented case: λ^i(x − n) is an integer polynomial in the λ^j(x) and conversely, and for x = Σ ξ_i the elements γ^i(x − n) = e_i(ξ_1 − 1,…,ξ_n − 1) are again algebraically independent.
5. Fixed rank: the relations λ^j(p) = 0 (j > n) are exactly the relations e_j = 0 (j > n) in n variables, so the rewriting of the first step, followed by these substitutions, yields polynomials in λ^1(p),…,λ^n(p) that agree when evaluated at the algebraically independent e_1(ξ),…,e_n(ξ).

**Acceptance.**

- The identity ψ^k(xy) = ψ^k(x)ψ^k(y) reduces to p_k(ξ_iη_j) = p_k(ξ)p_k(η) for power sums.
- The identity λ²(λ²x) = xλ³(x) − λ⁴(x) is checked on ξ_1 + ⋯ + ξ_4.

**Depends on.** this roadmap: `S.6/lambda-ring`, `S.6/laurent-lambda-ring`, `S.6/lambda-universal-polynomials`; libraries: `mathlib:MvPolynomial.esymmAlgEquiv`.

**Sources.**

- `Kbook.2013`, Proof of Proposition II.4.9 (PDF p. 105): “The Filtered Splitting Principle allows us to consider the universal case W = Ws of Exercise 4.4.” — The K-book reduces λ-ring identities to the universal λ-ring W_s generated by line elements; the lemma makes that reduction a statement, proved by algebraic independence instead of the Filtered Splitting Principle of Fulton–Lang, which is not public.
- `Soule.1985`, §1.4 (p. 492): “Tout ceci se vérifie en déduisant des identités sur K(A) des mêmes identités sur R_Z(GL) (via r_A).” — Soulé proves every λ-identity on K-theory by checking it in a universal λ-ring; the lemma supplies that step for arbitrary special λ-rings.

### Adams operations of a λ-ring

`S.6/adams-operations` · definition · planet “Adams operations”

For a pre-λ-ring K and k ≥ 1 define ψ^k: K → K by the Newton recursion ψ^k(x) − λ^1(x)ψ^{k−1}(x) + ⋯ + (−1)^{k−1}λ^{k−1}(x)ψ^1(x) + (−1)^k kλ^k(x) = 0, i.e. ψ^k(x) = N_k(λ^1x,…,λ^kx). Equivalently ψ_t(x) := Σ_{k≥1} ψ^k(x)t^k = −t·(d/dt)(λ_{−t}(x))·λ_{−t}(x)^{−1} in K[[t]], where λ_{−t}(x) = Σ(−1)^kλ^k(x)t^k; this series is integral because λ_{−t}(x) has constant coefficient 1. For an augmented λ-ring (S.6/gamma-filtration) put ψ^0 = ι ∘ ε, where ι : H → K is the inclusion. ψ^{−1} (duality) is not part of this definition. Examples: ψ¹ = id, ψ²(x) = x² − 2λ²(x), ψ³(x) = x³ − 3xλ²(x) + 3λ³(x).

**Hypotheses.**

- K is a pre-λ-ring; the properties that need the special axioms are S.6/adams-multiplicative-composition.

**Proof.**

1. Define ψ^k by strong recursion on k with the displayed formula.
2. The generating-function identity is the Newton identity for the power series λ_{−t}(x): comparing coefficients of t^k in λ_{−t}(x)ψ_t(x) = −tλ'_{−t}(x) gives the recursion (mathlib:PowerSeries, derivative and inverse of a series with unit constant term).
3. The closed forms of ψ², ψ³ are the Newton polynomials N_2, N_3 of S.6/lambda-universal-polynomials.

**API.**

- `TauCeti.LambdaRing.adams` (constructor): ψ^k: K → K for k ≥ 1, by the Newton recursion.
- `TauCeti.LambdaRing.adams_one` (simp): ψ^1 = id.
- `TauCeti.LambdaRing.adams_two` (simp): ψ²(x) = x² − 2λ²(x).
- `TauCeti.LambdaRing.adams_newton` (characterisation): The Newton recursion displayed in the statement.
- `TauCeti.LambdaRing.adamsSeries` (characterisation): Σ_{k≥1} ψ^k(x)t^k = −t λ'_{−t}(x)/λ_{−t}(x) in K[[t]].
- `TauCeti.LambdaRing.adams_add` (simp): ψ^k(x + y) = ψ^k(x) + ψ^k(y) (S.6/adams-additivity-square-zero).
- `TauCeti.LambdaRing.adams_map` (functoriality): A λ-homomorphism f satisfies f ∘ ψ^k = ψ^k ∘ f.

**Unit tests.**

- `adams_int` (computation): In ℤ with λ^k(n) = C(n,k): ψ^k(n) = n for all k ≥ 1 (e.g. ψ²(2) = 4 − 2 = 2).
- `adams_zero` (degenerate): ψ^k(0) = 0 in every pre-λ-ring.
- `adams_ne_pow` (non-example): ψ^k(x) ≠ x^k in general: ψ²(2) = 2 ≠ 4 in ℤ, so a definition ψ^k(x) = x^k fails.
- `adams_line` (characterisation): If λ^j(ℓ) = 0 for j ≥ 2 then ψ^k(ℓ) = ℓ^k.
- `adams_ringK0_line` (compatibility): For an invertible R-module L, ψ^k([L]) = [L^{⊗k}] in Z.3's K_0(R) (Z.3/lambda: λ^j[L] = [Λ^jL] = 0 for j ≥ 2).

**Acceptance.**

- In ℤ with the binomial structure ψ^k(n) = n for all k.
- For a line element ℓ, ψ^k(ℓ) = ℓ^k.

**Used by.**

- Soulé 1985, §1.5–1.6 and Théorème 3: ψ^k on K-theory, its multiplicativity and the Riemann–Roch formula for closed immersions
- EllipticKTheory E.4/adams-operations-and-the-weight-decomposition: the weight decomposition of the K-theory of a curve
- KTheoryFiniteLocalFields L.1/adams-psi-p-frobenius and L.1/adams-on-finite-field-k: ψ^p = Frobenius and ψ^k = k^i on K_{2i−1}(F_q)
- S.7/chern-character-adams: ch_i ∘ ψ^k = k^i ch_i

**Depends on.** this roadmap: `S.6/lambda-ring`, `S.6/lambda-universal-polynomials`; libraries: `mathlib:PowerSeries`, `mathlib:PowerSeries.coeff`.

**Sources.**

- `Soule.1985`, §1.5 (p. 493): “ψ^k − λ^1ψ^{k−1} + … + (−1)^{k−1}λ^{k−1}ψ^1 + (−1)^k kλ^k = 0.” — Soulé's recursion for the Adams operations, k ≥ 1 (with ψ^{−k}(x) = ψ^k of the dual, not used here).
- `Kbook.2013`, II.4, Adams operations (PDF p. 101): “Define ψk(x) to be the coefficient of tk in the power series: ψt(x) = X ψk(x)tk = ε(x) −t d dt log λ−t(x).” — The generating-function form (text layer; the rendered formula is ψ_t(x) = Σψ^k(x)t^k = ε(x) − t d/dt log λ_{−t}(x)).

### Additivity of Adams operations, line elements and square-zero ideals

`S.6/adams-additivity-square-zero` · lemma

In a pre-λ-ring K: (a) ψ^k(x + y) = ψ^k(x) + ψ^k(y) for all x, y and k ≥ 1; (b) if λ^j(ℓ) = 0 for all j ≥ 2 then ψ^k(ℓ) = ℓ^k; (c) if x satisfies λ^i(x)λ^j(x) = 0 for all i, j ≥ 1 (for instance x in a λ-ideal I with I² = 0), then ψ^k(x) = (−1)^{k−1}kλ^k(x), and λ^k is additive on such an ideal I; (d) on a binomial λ-ring (λ^k(x) = C(x,k)) every ψ^k is the identity.

**Hypotheses.**

- K is a pre-λ-ring; (c) needs the products to vanish, not merely x² = 0.

**Proof.**

1. (a): λ_{−t}(x + y) = λ_{−t}(x)λ_{−t}(y), and −t(d/dt)log is additive on products of series with constant term 1 (S.6/adams-operations, generating-function form).
2. (b): λ_{−t}(ℓ) = 1 − ℓt, so ψ_t(ℓ) = ℓt/(1 − ℓt) = Σ ℓ^k t^k.
3. (c): in the Newton recursion every term λ^i(x)ψ^{k−i}(x) with 1 ≤ i ≤ k − 1 is a product of elements of I (ψ^{k−i}(x) ∈ I by induction), hence 0; for additivity, λ_t(x + y) = λ_t(x)λ_t(y) = 1 + Σ(λ^kx + λ^ky)t^k modulo I².
4. (d): the identity x Σ_{i=0}^{k−1}(−1)^iC(x,i) = (−1)^{k+1}kC(x,k), checked in ℚ[x], makes the recursion give ψ^k(x) = x.

**Acceptance.**

- In the λ-ring K_0(A) ⊕ K_1(A) with zero products in positive degree, ψ²(a) = −2λ²(a) for a ∈ K_1(A).
- ψ^k(ℓ^{−1}) = ℓ^{−k} for a line element ℓ.

**Depends on.** this roadmap: `S.6/adams-operations`, `S.6/lambda-ring`; libraries: `mathlib:PowerSeries`.

**Sources.**

- `Kbook.2013`, II.4, three facts after the definition of ψ^k (PDF p. 101): “if I is a λ-ideal with I2 = 0 then ψk(x) = (−1)k−1kλk(x) for all x ∈ I;” — Part (c); the same paragraph states (b) and (d).
- `Kbook.2013`, Proof of Proposition II.4.4 (PDF p. 102): “The logarithm in the deﬁnition of ψt implies that ψt(x + y) = ψt(x) + ψt(y), so each ψk is additive.” — Part (a).

### Adams operations are λ-endomorphisms with ψ^kψ^l = ψ^{kl}

`S.6/adams-multiplicative-composition` · theorem

In a special λ-ring K, for all k, l ≥ 1: ψ^k is a ring endomorphism (ψ^k(1) = 1 and ψ^k(xy) = ψ^k(x)ψ^k(y)), ψ^k ∘ λ^l = λ^l ∘ ψ^k (so ψ^k is a λ-endomorphism), and ψ^k ∘ ψ^l = ψ^{kl}; in particular the ψ^k commute. Moreover ψ^p(x) ≡ x^p modulo pK for every prime p.

**Hypotheses.**

- K is a special λ-ring (the product and composition axioms are used).

**Proof.**

1. By S.6/adams-additivity-square-zero ψ^k is additive, and ψ^k(1) = 1 since 1 is a line element.
2. By S.6/lambda-identity-principle each identity may be checked for x = Σξ_i, y = Σ η_j in ℤ[ξ, η]; there ψ^k(x) = p_k(ξ) (power sum, S.6/laurent-lambda-ring), and p_k(ξ_iη_j) = p_k(ξ)p_k(η), p_k(ξ^l) = p_{kl}(ξ), and λ^l(p_k(ξ)) = e_l(ξ_1^k, …) = p_k applied to e_l(ξ).
3. Frobenius congruence: ψ^p(x) − x^p = Q(λ^1x,…,λ^px) for the integer polynomial Q = N_p − a_1^p, and Q(e(ξ)) = p_p(ξ) − p_1(ξ)^p = p·f with f ∈ ℤ[ξ]; f is symmetric because p·f is and ℤ[ξ] is torsion free, so f = g(e(ξ)) with g integral (fundamental theorem), and Q = p·g by algebraic independence; hence ψ^p(x) − x^p = p·g(λ^•x) ∈ pK.

**Acceptance.**

- ψ²ψ³ = ψ⁶ on ℤ[ξ]: both send ξ to ξ⁶.
- In ℤ, ψ² = id, so ψ²(2·2) = 4 = ψ²(2)ψ²(2).
- ψ²(x) ≡ x² mod 2: ψ²(x) = x² − 2λ²(x).

**Depends on.** this roadmap: `S.6/adams-additivity-square-zero`, `S.6/lambda-identity-principle`, `S.6/laurent-lambda-ring`; libraries: `mathlib:MvPolynomial.psum`, `mathlib:MvPolynomial.esymmAlgEquiv`.

**Sources.**

- `Soule.1985`, §1.5 (p. 493): “On a γ^0 = 1, γ^1 = ψ^1 = id, ψ^k ∘ ψ^{k'} = ψ^{kk'}, et ψ^k est un endomorphisme de λ-anneaux.” — The statement; Soulé cites Grothendieck [14] for it.
- `Kbook.2013`, Proposition II.4.4 (PDF p. 102): “Assume K satisﬁes the Splitting Principle. Then each ψk is a ring endomorphism of K, and ψjψk = ψjk for all j, k ≥ 0.” — The K-book proves it under the Splitting Principle; the proof here uses the identity principle, which holds in every special λ-ring.

### γ-operations and the γ-filtration of an augmented λ-ring

`S.6/gamma-filtration` · definition

An augmented λ-ring is a special λ-ring K with a binomial λ-subring H (λ^k(h) = C(h, k), e.g. H = H^0(Spec A, ℤ) of locally constant integer functions) and a λ-homomorphism ε: K → H that is the identity on H. The γ-operations are defined by γ_t(x) = λ_{t/(1−t)}(x), equivalently γ^0 = 1 and γ^k(x) = λ^k(x + k − 1) for k ≥ 1; they satisfy γ^k(x + y) = Σγ^i(x)γ^{k−i}(y). The γ-filtration is F^0_γ = K, F^1_γ = ker ε, and for n ≥ 1, F^n_γ K is the ideal generated by the products γ^{i_1}(x_1)⋯γ^{i_r}(x_r) with ε(x_j) = 0 and i_1 + ⋯ + i_r ≥ n; gr^n_γ K = F^n_γ/F^{n+1}_γ. For a non-unital λ-algebra I over K (S.6/lambda-ring) with zero products in positive degree, F^n_γ I is the subgroup generated by γ^j(x) (j ≥ n) and a·γ^j(x) (a ∈ F^i_γ K, i + j ≥ n): this is the filtration Soulé and the K-book use on K_m(A) and K^Y_m(X). When H = ℤ or H = H^0(X, ℤ), the ideal generated by the products equals the additive subgroup they generate (for a general binomial H, by their ι(H)-multiples): a product of a generator with a ∈ K is a sum of ε(a)·generator and (a − ε(a))·generator, the second a generator of higher weight, and multiplication by a locally constant function on connected components is a sum of generators.

**Hypotheses.**

- K is a special λ-ring with a binomial λ-subring H and augmentation ε; H may have several idempotents (disconnected spectra).
- The filtration is decreasing and multiplicative: F^iF^j ⊆ F^{i+j} (immediate from the generators).

**Proof.**

1. Define γ_t by substituting s = t/(1 − t) in λ_s; the series is integral since s ∈ tℤ[[t]].
2. γ^k(x) = λ^k(x + k − 1): substitute and use λ_s(k − 1) = (1 + s)^{k−1} = (1 − t)^{1−k}.
3. γ_t is additive because λ_s is (S.6/lambda-ring).
4. Define F^n_γ as the ideal of generators; show it equals the additive span of the generators as in the statement; F^1_γ = ker ε because x = γ^1(x) for x ∈ ker ε.

**API.**

- `TauCeti.LambdaRing.Augmented` (structure): A special λ-ring with a binomial λ-subring H and a λ-retraction ε: K → H.
- `TauCeti.LambdaRing.gamma` (constructor): γ^k(x) = λ^k(x + k − 1), γ^0 = 1.
- `TauCeti.LambdaRing.gamma_add` (simp): γ^k(x + y) = Σγ^i(x)γ^{k−i}(y).
- `TauCeti.LambdaRing.gammaFiltration` (constructor): F^n_γ K as an ideal; F^0 = K, F^1 = ker ε.
- `TauCeti.LambdaRing.gammaFiltration_mul` (structure): F^iF^j ⊆ F^{i+j}; F^{n+1} ⊆ F^n.
- `TauCeti.LambdaRing.gammaFiltration_eq_span` (characterisation): The ideal equals the additive subgroup generated by the ι(H)-multiples of the γ-products; for H = ℤ or H = H^0(X, ℤ), by the γ-products themselves.
- `TauCeti.LambdaRing.gammaGraded` (constructor): gr^•_γ K = ⊕ F^n/F^{n+1}, a graded ring and an H-module.
- `TauCeti.LambdaRing.gammaFiltration_map` (functoriality): Augmented λ-homomorphisms preserve F^n_γ.
- `TauCeti.LambdaRing.gammaFiltration_ringK0` (compatibility): For K = K_0(R), F^n_γ equals KTheoryLowDegrees Z.3/gamma-filtration.
- `TauCeti.LambdaRing.gamma_line_sub_one` (simp): γ^k(ℓ − 1) = 0 for k ≥ 2 and ℓ a line element.

**Unit tests.**

- `gamma_two` (computation): γ²(x) = λ²(x) + x.
- `gammaFiltration_zero_one` (degenerate): F^0_γ = K and F^1_γ = ker ε; for K = ℤ with H = ℤ, F^1_γ = 0.
- `gamma_line` (computation): γ^k(ℓ − 1) = 0 for k ≥ 2 and a line element ℓ, so for K = ℤ[u^{±1}], F^n_γ = (u − 1)^n.
- `gammaFiltration_not_adic` (non-example): For K = R(C_2) = ℤ[σ]/(σ² − 1), F^n_γ = 2^{n−1}(σ − 1)ℤ ≠ 0 for all n (K-book Example II.4.8.3), so the γ-filtration need not be finite.
- `gammaFiltration_ringK0` (compatibility): For a commutative ring R, F^n_γ K_0(R) equals KTheoryLowDegrees Z.3/gamma-filtration (the same generators; Z.3's ideal-span form).

**Acceptance.**

- γ²(x) = λ²(x) + x.
- For a line element ℓ, γ^k(ℓ − 1) = 0 for k ≥ 2 (K-book Lemma II.4.5.3).
- F^1_γ K_0(R)/F^2_γ K_0(R) ≅ Pic(R) (S.7/gamma-first-graded-pieces for Spec R).

**Used by.**

- Soulé 1985, Théorème 1 and Corollaire 1: the length of the γ-filtration on K_m(A) and the integral weight decomposition
- S.6/adams-eigenvalue-on-gamma-graded: ψ^k acts on gr^n_γ by k^n
- S.7/scheme-gamma-filtration: the scheme γ-filtration is this filtration on K_0(Vect X)
- Polylogarithms P.3/k-theory-comparison-weight-three and P.4/goncharov-comparison-conjecture: the graded pieces gr^n_γ K_m(F)_ℚ

**Depends on.** this roadmap: `S.6/lambda-ring`; libraries: `mathlib:PowerSeries`.

**Sources.**

- `Soule.1985`, §1.5 (p. 493): “et, si i ≥ 1, on désigne par F^i_γK(A) le sous-groupe de K(A) engendré par les produits γ^{i_1}(x_1) … γ^{i_α}(x_α) où ε(x_1) = … = ε(x_α) = 0 et i_1 + … + i_α ≥ i.” — Soulé's definition, as an additive subgroup, for K(A) = ⊕K_m(A); γ^k(x) = λ^k(x + k − 1) is displayed on the same page.
- `Kbook.2013`, II.4, The γ-filtration (PDF p. 104): “For n ≥2, F n γ K is deﬁned to be the ideal of K generated by the products γk1(x1) · · · γkm(xm) with xi ∈eK and P ki ≥n.” — The K-book's ideal-generated form (text layer; rendered: F^n_γK is the ideal generated by γ^{k_1}(x_1)⋯γ^{k_m}(x_m) with x_i ∈ K̃ and Σk_i ≥ n).
- `Kbook.2013`, IV.5, The γ-filtration (PDF p. 324): “If n > 0 then F k γ Kn(A) is generated by all γk′(x) and a·γj(x) with k′ ≥k, a ∈F i γK0(A), x ∈Kn(A), i > 0 and i + j ≥k.” — The filtration on the square-zero part K_n(A), n > 0.

### ψ^k acts on gr^n_γ by k^n

`S.6/adams-eigenvalue-on-gamma-graded` · lemma

Let K be an augmented special λ-ring and n ≥ 1. For x ∈ F^n_γ K: ψ^k(x) ≡ k^n x, λ^k(x) ≡ (−1)^{k−1}k^{n−1}x and γ^n(x) ≡ (−1)^{n−1}(n−1)! x modulo F^{n+1}_γ K. More precisely, for x ∈ ker ε and i ≥ 1, ψ^k(γ^i(x)) − k^iγ^i(x) = Q_{k,i}(γ^1(x), γ^2(x), …) for a universal integer polynomial Q_{k,i} all of whose monomials have weight ≥ i + 1 (γ^j of weight j). In Soulé's notation every natural operation τ acts on gr^i_γ by a universal constant ω_i(τ), with ω_i(ψ^k) = k^i, ω_i(λ^k) = (−1)^{k−1}k^{i−1}, ω_i(γ^i) = (−1)^{i−1}(i−1)!, and ω_i(γ^k) = 0 for i < k. The same holds for the filtration of a non-unital λ-algebra (K(A), K^Y(X)).

**Hypotheses.**

- K is a special λ-ring with augmentation (S.6/gamma-filtration); no splitting principle and no finiteness are assumed.

**Proof.**

1. Universal computation: for x = Σ_{j≤N}(ξ_j − 1) in ℤ[ξ], γ_t(x) = ∏(1 + u_jt) with u_j = ξ_j − 1, so γ^i(x) = e_i(u) and ψ^k(γ^i(x)) = e_i((1 + u_1)^k − 1, …) = k^ie_i(u) + (symmetric polynomial in u with all homogeneous components of degree ≥ i + 1).
2. By the fundamental theorem (mathlib:MvPolynomial.esymmAlgEquiv) the correction is Q_{k,i}(e_1(u), e_2(u), …) with monomials of weight ≥ i + 1; by S.6/lambda-identity-principle (augmented case) the identity ψ^kγ^i(x) − k^iγ^i(x) = Q_{k,i}(γ^•(x)) holds for all x ∈ ker ε in every augmented special λ-ring.
3. Each monomial of Q_{k,i}(γ^•(x)) is a generator of F^{i+1}_γ. Since ψ^k is a ring endomorphism with ψ^k(a) ≡ ε(a) mod F^1 (S.6/adams-multiplicative-composition, and ψ^k = id on H by S.6/adams-additivity-square-zero(d)), the congruence extends from generators to F^n_γ.
4. For λ^k: by the Newton recursion k^n x = (−1)^{k−1}kλ^k(x) + (terms in F^{n+1}); the resulting universal polynomial identity in the case W_s has torsion-free graded pieces (K-book Ex. II.4.4(b)), so one may divide by k there and transport by the identity principle. γ^n: from γ_t = λ_{t/(1−t)} and the value of λ^k on gr^n.

**Acceptance.**

- For x = ℓ − 1 (ℓ a line element), ψ^k(x) = ℓ^k − 1 ≡ k(ℓ − 1) modulo (ℓ − 1)² ⊆ F²_γ.
- On gr^1, γ^1 = id: ω_1(γ^1) = (−1)^0·0! = 1.

**Depends on.** this roadmap: `S.6/gamma-filtration`, `S.6/adams-multiplicative-composition`, `S.6/adams-additivity-square-zero`, `S.6/lambda-identity-principle`, `S.6/laurent-lambda-ring`; libraries: `mathlib:MvPolynomial.esymmAlgEquiv`.

**Sources.**

- `Kbook.2013`, Proposition II.4.9 (PDF p. 105): “Let k, n ≥1 be integers. If x ∈F n γ K then modulo F n+1 γ K: ψk(x) ≡knx; and λk(x) ≡(−1)kkn−1x.” — The statement for ψ^k. The printed sign (−1)^k for λ^k disagrees with the proof on the same page, which gives k^n x = (−1)^{k−1}kλ^k(x); the node uses (−1)^{k−1} (recorded in sourceIssues).
- `Soule.1985`, §1.5 (p. 493): “L'action de τ sur Gr^i_γK(A) est la multiplication par une constante universelle ω_i(τ) ∈ Z [29].” — The general form, with ω_i(ψ^k) = k^i, ω_i(λ^k) = (−1)^{k−1}k^{i−1}, ω_i(γ^i) = (−1)^{i−1}(i − 1)! listed on the same page.

### Weight decomposition from a γ-filtration of bounded length

`S.6/rational-weight-decomposition` · theorem

Let K be an augmented special λ-ring and J ⊆ K an additive subgroup with ψ^k(J) ⊆ J for all k (for instance J = F^a_γK, or the degree-m part K_m in K(A) = ⊕K_m(A)), filtered by J_i = J ∩ F^i_γK. Suppose J_a = J and J_{N+1} ⊗ ℚ = 0 for integers 0 ≤ a ≤ N. Then: (1) for every k ≥ 2, ∏_{i=a}^{N}(ψ^k − k^i) = 0 on J_ℚ, and J_ℚ = ⊕_{i=a}^{N} J^{(i)}, where J^{(i)} = {x ∈ J_ℚ : ψ^k(x) = k^ix}; (2) J^{(i)} does not depend on k ≥ 2 and ψ^l = l^i on J^{(i)} for every l ≥ 1; (3) (J_i)_ℚ = ⊕_{j≥i} J^{(j)}, so J^{(i)} ≅ gr^i_γ J_ℚ; (4) the projector onto J^{(i)} is π_i = ∏_{j≠i, a≤j≤N}(ψ^k − k^j)/(k^i − k^j), whose denominator is ∏_{j≠i}(k^i − k^j) (for k = 2, a = 1, N = 3: π_2 = −(ψ² − 2)(ψ² − 8)/8); (5) products map J^{(i)} ⊗ J'^{(j)} into (JJ')^{(i+j)}. The decomposition is a statement about J ⊗ ℚ only; its integral refinements are S.6/affine-weight-decomposition and S.6/scheme-weight-decomposition.

**Hypotheses.**

- K is an augmented special λ-ring; J is ψ^k-stable; the bounds a, N are part of the hypothesis, not a conclusion.

**Proof.**

1. By S.6/adams-eigenvalue-on-gamma-graded, (ψ^k − k^i) maps J_i into J_{i+1}; composing the factors for i = a,…,N maps J = J_a into J_{N+1}, which is torsion, so the product vanishes on J_ℚ.
2. The polynomial ∏(T − k^i) has distinct roots in ℚ (k ≥ 2), so Lagrange interpolation gives commuting idempotents π_i summing to 1 with (ψ^k − k^i)π_i = 0: this is (1) and (4).
3. ψ^k and ψ^l commute (S.6/adams-multiplicative-composition), so ψ^l preserves the ψ^k-eigenspaces; on gr^i both act by k^i, l^i; downward induction on i using (3) shows ψ^l = l^i on J^{(i)}, giving (2).
4. (3): π_i preserves each J_j and acts on gr^j as δ_{ij}, so J^{(j)} ⊆ (J_j)_ℚ and the sum is direct; (5) from multiplicativity of ψ^k.

**Acceptance.**

- For K = K_0(P²_F) (γ-length 2, S.7/gamma-filtration-finite), J = K: K_ℚ = K^{(0)} ⊕ K^{(1)} ⊕ K^{(2)}, each of dimension 1; with h = 1 − [O(−1)], ψ^k(h) = 1 − (1 − h)^k = kh − C(k,2)h², so h ∉ K^{(1)} and the weight-one projection of h is h + h²/2 = π_1(h), with denominator 2 (the integral decomposition fails).
- For J = K_1(F) of a field, a = N = 1: J_ℚ = J^{(1)} = F^× ⊗ ℚ.

**Depends on.** this roadmap: `S.6/adams-eigenvalue-on-gamma-graded`, `S.6/adams-multiplicative-composition`, `S.6/gamma-filtration`.

**Sources.**

- `Kbook.2013`, Theorem II.4.10 (PDF p. 106): “The subspace K(n) Q =K(n,k) Q of eigenvectors for ψk=kn is independent of k;” — Part (2); parts (1), (3), (5) are the other items of Theorem II.4.10, whose proof uses the product ∏(ψ^k − k^n) and Proposition II.4.9.
- `Kbook.2013`, Proof of Theorem IV.5.11 (PDF p. 324): “the linear operator QN 1 (ψk −ki) is trivial on each F i γ/F i+1 γ for large N, and this implies that Kn(A) ⊗Q is the direct sum of the eigenspaces for ψk = ki, 1 ≤i ≤N.” — The same argument applied to J = K_n(A); text layer (rendered: the operator ∏_1^N(ψ^k − k^i)).
- `GilletSoule.1999`, Proof of Proposition 8 (p. 48): “there exists an integer M such that γ^{k(1)}(x) … γ^{k(α)}(x) = 0 when k(1) + ⋯ + k(α) > M.” — Gillet–Soulé run the same product-of-factors argument on H^{−m}(X, K); the excerpt is abridged from display (25) and the sentence before it.

### The representation rings R_k(GL_N) and R_ℤ(GL)

`S.6/representation-ring-of-gl` · definition

Let k be ℤ or a field. A representation of the group scheme GL_N over k on a finite free k-module M of rank m is a homomorphism of k-group schemes ρ: GL_{N,k} → GL(M) ≅ GL_{m,k}; concretely, for every commutative k-algebra A a group homomorphism ρ_A: GL_N(A) → GL_m(A), natural in A, whose matrix entries are polynomials over k in the entries of g and det(g)^{−1}. R_k(GL_N) is the Grothendieck group of such representations with respect to short exact sequences of representations; it is a ring under ⊗, and a pre-λ-ring under exterior powers Λ^i(ρ) (again representations, polynomial in the entries). Restriction along GL_N ↪ GL_{N+1}, g ↦ diag(g, 1), is a pre-λ-homomorphism R_k(GL_{N+1}) → R_k(GL_N) sending id_{N+1} to id_N + 1; R_ℤ(GL) := lim_N R_ℤ(GL_N). For every natural operation τ of special λ-rings (a polynomial in the λ^i with integer coefficients, or its composite with duality ρ ↦ ρ^∨), the family (τ(id_N − N))_N is an element of R_ℤ(GL); the λ^k, γ^k, ψ^k are the cases used.

**Hypotheses.**

- k = ℤ or a field; representations are on finite free k-modules (for k = ℤ, on lattices).
- Isomorphic representations (conjugate by GL_m(k)) have the same class; the dual representation ρ^∨(g) = ρ(g^{−1})^T gives an involution.

**Proof.**

1. Define representations functorially in commutative k-algebras A as stated; morphisms are k-linear maps compatible with all ρ_A.
2. Exterior powers: Λ^i of a matrix is polynomial in its entries (mathlib:ExteriorAlgebra.exteriorPower, mathlib:exteriorPower.map applied to a basis), so Λ^i ρ is a representation; the filtration of Λ^i of an extension gives the sum formula, making R_k(GL_N) a pre-λ-ring (the argument of S.6/vector-bundle-lambda-ring for modules).
3. Restriction along diag(g, 1) preserves ⊗ and Λ^i and sends id_{N+1} to id_N ⊕ 1.
4. τ(id_{N+1} − (N+1)) restricts to τ(id_N + 1 − (N + 1)) = τ(id_N − N), so the τ-family is compatible; that R_k(GL_N) is special (so that τ can be any natural operation) is S.6/serre-representation-ring-theorem.

**API.**

- `TauCeti.RepresentationRing.GLRep` (structure): A representation of GL_{N,k} on a finite free k-module, natural in commutative k-algebras.
- `TauCeti.RepresentationRing.ofGL` (constructor): R_k(GL_N), the Grothendieck group of GLRep for exact sequences, with ⊗.
- `TauCeti.RepresentationRing.ofGL.preLambda` (instance): The pre-λ-ring structure by exterior powers.
- `TauCeti.RepresentationRing.ofGL.restrict` (functoriality): Restriction along diag(g, 1): a pre-λ-homomorphism sending id_{N+1} to id_N + 1.
- `TauCeti.RepresentationRing.stableGL` (constructor): R_ℤ(GL) = lim_N R_ℤ(GL_N).
- `TauCeti.RepresentationRing.stableGL.ofOperation` (constructor): The element (τ(id_N − N))_N for a natural operation τ.
- `TauCeti.RepresentationRing.ofGL.dual` (structure): The involution ρ ↦ ρ^∨, with λ^k(x)^∨ = λ^k(x^∨) and x^∨ = x^{−1} for x of rank one.
- `TauCeti.RepresentationRing.ofGL.baseChange` (functoriality): Base change R_ℤ(GL_N) → R_{𝔽_p}(GL_N), a pre-λ-homomorphism.

**Unit tests.**

- `ofGL_one` (computation): R_ℤ(GL_1) = ℤ[t, t^{−1}], t the standard character, with λ^k(t) = 0 for k ≥ 2.
- `ofGL_restrict_id` (characterisation): restrict(id_{N+1}) = id_N + 1 in R_ℤ(GL_N).
- `ofGL_lambda_top` (computation): λ^N(id_N) = det, an invertible element of R_ℤ(GL_N) with inverse det^{−1} = λ^N(id_N)^∨.
- `ofGL_not_abstract_group` (non-example): R_ℤ(GL_1) is not the representation ring of the group of ℤ-points GL_1(ℤ) = {±1}: restriction sends t to the sign character σ with σ² = 1 in R_ℚ({±1}), while t² ≠ 1 in R_ℤ(GL_1) = ℤ[t^{±1}].
- `ofGL_zero` (degenerate): For N = 0, GL_0 is trivial and R_ℤ(GL_0) = ℤ with the binomial λ-structure.

**Acceptance.**

- R_ℤ(GL_1) = ℤ[t, t^{−1}] with t = id_1.
- λ^2(id_2) = det, a one-dimensional representation.

**Used by.**

- Soulé 1985, §§1.2–1.4 and 4.3: the source of every operation on K-theory: r_A: R_ℤ(GL) → [BGL(A)^+, BGL(A)^+] and its sheaf version
- Gillet–Soulé 1999, Lemma 20 and Theorem 3: the homomorphism φ: R_ℤ(GL_N) → H^0(BGL_N, K)
- Riou 2009, Theorem 3.3.2: comparison of Soulé's operations with those from K_0 of Grassmannians
- S.6/vector-bundle-lambda-ring: associated bundles E ↦ ρ(E) give λ-homomorphisms R_ℤ(GL_N) → K_0(Vect X)

**Depends on.** this roadmap: `S.6/lambda-ring`; libraries: `mathlib:Matrix.GeneralLinearGroup`, `mathlib:ExteriorAlgebra.exteriorPower`, `mathlib:exteriorPower.map`.

**Sources.**

- `Soule.1985`, §1.1 (p. 490): “Soient N un entier, N ≥ 1, GL_N le schéma en groupe linéaire de rang N sur Z, et R_Z(GL_N) l'anneau de Grothendieck des représentations de GL_N définies sur Z (muni du produit tensoriel).” — Soulé's definition; restriction and R_Z(GL) = lim R_Z(GL_N) are on pp. 491–492 ('On pose R_Z(GL) = lim R_Z(GL_N)').
- `Soule.1985`, §1.3 (p. 492): “La famille (τ(id_N − N)) est donc un élément de R_Z(GL).” — The element of R_ℤ(GL) attached to a natural operation τ.

### Serre's computation of R(GL_N)

`S.6/serre-representation-ring-theorem` · theorem

Let k be ℤ or a field and T_N ⊂ GL_N the diagonal torus with character group M = ℤ^N. Restriction of representations to T_N (the character map) is an injective ring homomorphism R_k(GL_N) → ℤ[M] = ℤ[X_1^{±1},…,X_N^{±1}], with image the Σ_N-invariants ℤ[M]^{Σ_N} = ℤ[λ_1,…,λ_N]_{λ_N} (λ_i the elementary symmetric functions, λ_i the image of Λ^i(id_N)); in particular R_ℤ(GL_N) → R_{𝔽_p}(GL_N) is an isomorphism. Consequently R_k(GL_N) is a special λ-ring (the character map is a pre-λ-embedding into the special λ-ring of S.6/laurent-lambda-ring), R_ℤ(GL_N) = ℤ[λ^1(id_N),…,λ^N(id_N), λ^N(id_N)^{−1}], and R_ℤ(GL) is a special λ-ring.

**Hypotheses.**

- k is ℤ (a principal ideal domain) or a field; GL_N is split reductive over k.

**Proof.**

1. The character map is a pre-λ-homomorphism: restriction preserves ⊗ and Λ^i, and on ℤ[M] the λ-structure of S.6/laurent-lambda-ring is the one of exterior powers of sums of characters.
2. Injectivity and image over a field: Serre, Théorème 4 (a split reductive group's representation ring maps isomorphically onto ℤ[M]^W); its proof uses the highest-weight classification of irreducible representations of split reductive groups over a field — read at statement level only (gap). For k = ℂ the classification and the identification of characters with symmetric Laurent polynomials are the targets of Tau Ceti RepresentationTheory/ClassicalGroups layers 3 and 4 (request).
3. Over ℤ: Serre, Théorème 5: the maps R_ℤ(G) → R_ℚ(G) and R_ℚ(G) → R_{𝔽_p}(G) (decomposition homomorphisms) are isomorphisms for split reductive G; combined with Théorème 4 for ℚ and 𝔽_p this gives the ℤ statement (§3.8 for GL_n).
4. Special λ-ring: a pre-λ-subring of a special λ-ring is special, since the axioms are identities; ℤ[M]^{Σ_N} is the localisation of the ring of symmetric polynomials at λ_N (mathlib:MvPolynomial.esymmAlgEquiv for the polynomial part).
5. R_ℤ(GL) = lim R_ℤ(GL_N) is special because the axioms hold in each term and the transition maps are λ-homomorphisms.

**Acceptance.**

- For N = 2: λ²(λ²(id_2)) = λ²(det) = 0 and λ²(id_2 · id_2) = P_2 evaluated: λ²(id_2 ⊗ id_2) = e_1²e_2 + e_2e_1² − 2e_2² as characters.
- ψ^2(id_2) = X_1² + X_2² = λ_1² − 2λ_2.

**Depends on.** this roadmap: `S.6/representation-ring-of-gl`, `S.6/laurent-lambda-ring`, `S.6/lambda-ring`; libraries: `mathlib:MvPolynomial.esymmAlgEquiv`.

**Sources.**

- `Serre.1968`, §3.8 (p. 52): “L'anneau Z[M] s'identifie au localisé Z[X_1, …, X_n]_{λ_n} de Z[X_1, …, X_n] par rapport à λ_n = X_1…X_n. D'où : R_A(GL_n) = R_K(GL_n) = Z[M]^W = Z[λ_1, …, λ_n]_{λ_n}.” — The computation for GL_n over a principal ideal ring A with fraction field K.
- `Serre.1968`, Théorème 5 (p. 51): “Théorème 5. — Supposons que G soit réductif et déployé sur A (cf. [4], exposé XXII). Les homomorphismes d_v (v∈V) et i sont alors des isomorphismes.” — The comparison over a principal ideal ring used for k = ℤ.
- `Soule.1985`, §1.1 (p. 490): “Serre a montré [27] que R_Z(GL_N), muni des opérations de puissances extérieures, est un λ-anneau.” — Soulé's use of the theorem: R_ℤ(GL_N) is a special λ-ring.

### The representation ring R_A(G) of a group over a commutative ring

`S.6/representation-ring` · definition

For a group G and a commutative ring A, R_A(G) is the Grothendieck group of the exact category of AG-modules that are finitely generated projective as A-modules, for short exact sequences of such modules (equivalently, K_0 of representations ρ: G → Aut_A(P)); it is a commutative ring under ⊗_A with the diagonal action, a pre-λ-ring under exterior powers Λ^k_A (with the induced action), and augmented by the rank to H^0(Spec A, ℤ) through the forgetful map R_A(G) → K_0(A). It is contravariant in G (restriction ρ^*) and covariant in A (extension of scalars), and for every representation σ of the group scheme GL_N over ℤ and every ρ: G → GL_N(A) the pullback [σ_A ∘ ρ] defines a pre-λ-homomorphism R_ℤ(GL_N) → R_A(G), id_N ↦ [ρ]. For a field k and a finite group G with |G| invertible in k, R_k(G) agrees with Tau Ceti's repRing k G (the split K_0 of FDRep k G), since every short exact sequence of representations then splits (Maschke); in general the two differ, because R_A(G) uses short exact sequences.

**Hypotheses.**

- G is an abstract group; modules are finitely generated projective over A (not necessarily free); A is commutative.

**Proof.**

1. The category of AG-modules finitely generated projective over A is exact (extensions of projectives are projective) and closed under ⊗_A and Λ^k_A; its K_0 is defined with TauCeti's exact K_0 (tauceti:TauCeti.ExactK0).
2. Λ^k of an extension has a filtration with quotients Λ^iP' ⊗ Λ^{k−i}P'' compatible with the G-action (the argument of S.6/vector-bundle-lambda-ring), so λ_t is additive and R_A(G) is a pre-λ-ring.
3. For σ ∈ R_ℤ(GL_N) and ρ: G → GL_N(A), σ_A ∘ ρ is a representation of G on A^m; this is additive in exact sequences of σ and commutes with ⊗ and Λ^k because σ ↦ σ_A does.
4. Specialness of R_A(G) for every A is Swan's theorem (K-book Ex. II.4.2(a); Swan 1970 and SGA 6 VI 3.3, not read): recorded as a gap and not used by the scheme construction, which works with R_ℤ(GL_N) (S.6/serre-representation-ring-theorem).

**API.**

- `TauCeti.RepresentationRing` (constructor): R_A(G) as ExactK0 of the exact category of AG-modules finitely generated projective over A.
- `TauCeti.RepresentationRing.preLambda` (instance): The pre-λ-ring structure by exterior powers.
- `TauCeti.RepresentationRing.restrict` (functoriality): ρ^*: R_A(G') → R_A(G) for ρ: G → G', with id and composition.
- `TauCeti.RepresentationRing.extendScalars` (functoriality): f_*: R_A(G) → R_{A'}(G) for f: A → A'.
- `TauCeti.RepresentationRing.forget` (projection): The forgetful λ-homomorphism R_A(G) → K_0(A), a retraction of R_A(1) = K_0(A) → R_A(G).
- `TauCeti.RepresentationRing.ofGLPullback` (constructor): For ρ: G → GL_N(A), the pre-λ-homomorphism R_ℤ(GL_N) → R_A(G), σ ↦ [σ_A ∘ ρ].
- `TauCeti.RepresentationRing.frobeniusTwist` (other): For pA = 0, Φ^*: R_A(G) → R_A(G), [P] ↦ [A ⊗_{Φ,A} P].

**Unit tests.**

- `representationRing_trivial_group` (degenerate): R_A(1) = K_0(A) as pre-λ-rings (Z.3/lambda).
- `representationRing_cyclic_two` (computation): R_ℂ(ℤ/2) = ℤ[σ]/(σ² − 1) with λ²(1 + σ) = σ.
- `representationRing_not_free_only` (non-example): Restricting to free A-modules changes the group: for A a Dedekind domain with nontrivial class group and G trivial, the free modules give ℤ ≠ K_0(A) = ℤ ⊕ Cl(A).
- `representationRing_forget_compat` (compatibility): forget ∘ ofGLPullback(ρ)(id_N) = [A^N] in K_0(A) (KTheoryLowDegrees Z.1/ring-k0).

**Acceptance.**

- R_A(1) = K_0(A).
- For G = ℤ/2 and A = ℂ, R_ℂ(G) = ℤ[σ]/(σ² − 1).

**Used by.**

- K-book Proposition IV.5.3 and Theorem IV.5.5: q: R_A(G) → [BG, BGL(A)^+] and the λ-structure on K_0(A) × [X, BGL(A)^+]
- KTheoryFiniteLocalFields L.1/brauer-lift-lambda-ring and L.1/adams-psi-p-frobenius: Brauer lifting R_{𝔽_q}(G) → R_ℂ(G) and ψ^p = Φ^* on R_A(G)
- Kratzer 1980, §3: the homomorphism r: IR_A(G) → K(BG; A)

**Depends on.** this roadmap: `S.6/lambda-ring`, `S.6/representation-ring-of-gl`; libraries: `tauceti:TauCeti.ExactK0`, `mathlib:Rep`, `tauceti:TauCeti.repRing`.

**Sources.**

- `Kbook.2013`, Ex. II.4.2 (PDF p. 109): “For every group G and every commutative ring A, let RA(G) denote the group K0(AG, A) of Ex. 2.14, i.e., the group completion of the monoid Rep(AG, A) of all AG-modules which are ﬁnitely generated projective as A-modules.” — The definition (as a group completion; by Ex. II.2.14 short exact sequences split over A but not over AG, and the exact-category K_0 is the one used in IV.5.3).
- `Kratzer.1980`, §2 (p. 236): “On obtient ainsi un homomorphisme d'anneaux f_*: R_A(G) → R_{A'}(G) dit d'extension des scalaires. Ainsi, R_A(G) devient un foncteur contravariant en G et covariant en A.” — Functoriality in G and A.

### ψ^p is the Frobenius twist on representation rings in characteristic p

`S.6/representation-frobenius` · lemma

Let p be a prime. (a) In R_{𝔽_p}(GL_N), ψ^p(id_N) = [id_N^{(p)}], where id_N^{(p)}: GL_{N,𝔽_p} → GL_{N,𝔽_p} is the Frobenius representation g ↦ (g_{ij}^p). (b) For a commutative ring A with pA = 0, a group G and x ∈ R_A(G): ψ^p(x) = Φ^*(x), where Φ: A → A is a ↦ a^p and Φ^*[P] = [A ⊗_{Φ,A} P].

**Hypotheses.**

- pA = 0 in (b); ψ^p is S.6/adams-operations on the pre-λ-ring R_A(G) (Newton polynomial in the λ^i).

**Proof.**

1. (a): by S.6/serre-representation-ring-theorem the character map R_{𝔽_p}(GL_N) → ℤ[X^{±1}] is injective; ψ^p(id_N) has character X_1^p + ⋯ + X_N^p (power sum), and so does id_N^{(p)} (on the torus, diag(t_i) ↦ diag(t_i^p)).
2. (b), free case: a representation ρ on A^N is the pullback of id_N along ρ: G → GL_N(A) (S.6/representation-ring), and pullback is a pre-λ-homomorphism, hence commutes with ψ^p = N_p(λ^1,…,λ^p); by (a) pulled back through R_ℤ(GL_N) → R_{𝔽_p}(GL_N) → R_A(G) (A an 𝔽_p-algebra), ψ^p[ρ] = [id^{(p)} ∘ ρ], and id^{(p)} ∘ ρ is the representation g ↦ Φ(ρ(g)) on A^N, i.e. A ⊗_{Φ,A} ρ.
3. (b), general case: for ρ on P with P ⊕ Q ≅ A^N, [ρ] = [ρ ⊕ 1_Q] − [1_Q] with ρ ⊕ 1_Q on a free module; ψ^p (S.6/adams-additivity-square-zero) and Φ^* are additive, so it remains to show ψ^p[Q] = Φ^*[Q] in K_0(A) = R_A(1), which maps to R_A(G) by a λ-homomorphism.
4. K_0 case: by S.6/k-theoretic-splitting-principle, pull back along the flag bundle of Q̃ on Spec A, where [Q̃] becomes a sum of line bundle classes [L_i]; ψ^p[L] = [L]^p = [L^{⊗p}] (S.6/adams-additivity-square-zero) and the Frobenius pullback of a line bundle with transition functions g_{ij} has transition functions g_{ij}^p, i.e. is L^{⊗p}; pullback along the flag bundle commutes with ψ^p and Φ^* and is injective on K_0.

**Acceptance.**

- For N = 1: ψ^p(t) = t^p = t^{(p)}.
- For A = 𝔽_p the Frobenius is the identity, so ψ^p = id on R_{𝔽_p}(G) for every G.

**Depends on.** this roadmap: `S.6/serre-representation-ring-theorem`, `S.6/representation-ring`, `S.6/adams-operations`, `S.6/adams-additivity-square-zero`, `S.6/k-theoretic-splitting-principle`; libraries: `mathlib:frobenius`.

**Sources.**

- `Kbook.2013`, Ex. II.4.2(b) (PDF p. 109): “When p = 0 in A, show that ψp = Φ∗in RA(G), where Φ : A →A is the Frobenius Φ(a) = ap.” — The statement (b); the exercise's hint argues through characters, the node through the Frobenius representation of GL_N.
- `Kbook.2013`, Proof of Corollary IV.5.5.2 (PDF p. 322): “This follows from the fact (Ex. II.4.2) that ψp = Φ∗on the representation ring RA(G), together with the observation that q(Φ∗) : Kn(A) →Kn(A) is induced by Φ : A →A by naturality in A.” — How the lemma is used for K-theory (KTheoryFiniteLocalFields L.1/adams-psi-p-frobenius).

### The classifying map q: R_A(G) → [BG, BGL(A)^+]

`S.6/representation-classifying-map` · construction

Let A be a commutative ring. A representation ρ of a group G on a finitely generated projective A-module P, with a choice of P ⊕ Q ≅ A^N, gives BG → B Aut(P) → BGL_N(A) → BGL(A)^+; its pointed homotopy class q(ρ) does not depend on the choices (conjugation acts trivially on [BG, H] for an H-space H). q is additive on direct sums, and (Kratzer, via Quillen) on short exact sequences of representations, so it defines a homomorphism q: R_A(G) → [BG, BGL(A)^+], natural in G and in A. On the augmentation ideal it gives Kratzer's r: IR_A(G) → [BG, BGL(A)^+]; composing with the pullbacks of S.6/representation-ring gives, for each N, r_{A,N}: R_ℤ(GL_N) → [BGL_N(A), BGL(A)^+], compatible with restriction in N, and hence r_A: R_ℤ(GL) → lim_N [BGL_N(A), BGL(A)^+] = [BGL(A)^+, BGL(A)^+] (weak homotopy classes; universal property of the plus construction).

**Hypotheses.**

- A commutative; BGL(A)^+ is GeneralAlgebraicKTheory K.2:plus's model with its H-space structure (block sum).
- Additivity on non-split exact sequences uses Quillen's homology isomorphism for block-triangular groups (Quillen, 'Characteristic classes of representations', LNM 551) — not read; recorded as a gap.

**Proof.**

1. Well defined: two embeddings of P in A^N differ by conjugation; the action of π_1 on [BG, H] is trivial for an H-space H (K-book IV.5, citing Whitehead III.4.18), so the pointed classes agree.
2. Additive on ⊕: block sum is the H-space structure of BGL(A)^+ (GeneralAlgebraicKTheory K.2:plus, StableHomotopyKTheory H.4/gl-telescope-plus-comparison).
3. Exact sequences: reduce by universality to G = G_{m,n}, the block upper-triangular group; the inclusion of the block-diagonal group induces a homology isomorphism in the limit (Quillen; gap), hence equal classes in [lim BG_{m,n}, H] for every connected H-space H (StableHomotopyKTheory H.3/plus-construction-universal-property and Whitehead's theorem for H-spaces).
4. Naturality in G and A is by construction; compatibility of r_{A,N} with restriction because diag(ρ(g), 1) represents ρ ⊕ 1 and the trivial summand contributes the class of the constant map.
5. Passage to the limit over N and to BGL(A)^+: [BGL(A), BGL(A)^+] = lim [BGL_N(A), BGL(A)^+] up to lim¹ (weak homotopy classes, as in Soulé 1.2) and [BGL(A), H] = [BGL(A)^+, H] by the universal property of the plus construction.

**API.**

- `TauCeti.KTheory.LambdaOperations.classifyingMap` (constructor): q: R_A(G) → [BG, BGL(A)^+].
- `TauCeti.KTheory.LambdaOperations.classifyingMap_add` (simp): q(ρ ⊕ ρ') = q(ρ) + q(ρ') and q on exact sequences.
- `TauCeti.KTheory.LambdaOperations.classifyingMap_natural` (functoriality): Natural in G (restriction) and in A (extension of scalars).
- `TauCeti.KTheory.LambdaOperations.stableMap` (constructor): r_A: R_ℤ(GL) → [BGL(A)^+, BGL(A)^+].
- `TauCeti.KTheory.LambdaOperations.stableMap_id` (simp): r_A((id_N − N)_N) is the identity class of BGL(A)^+.

**Unit tests.**

- `classifyingMap_trivial` (degenerate): For the trivial group, q: R_A(1) = K_0(A) → [pt, BGL(A)^+] = 0 kills everything; with the component, R_A(1) → K_0(A) × [pt, BGL(A)^+] is the identity on K_0(A).
- `classifyingMap_units` (computation): For G = ℤ acting on A by a unit u (1 ↦ u), q(ρ) − 1 ∈ [S^1, BGL(A)^+] = K_1(A) is the class of u.
- `classifyingMap_not_module_only` (non-example): q(ρ) is not determined by the underlying module: for G = ℤ acting on A = ℚ through the units 2 and 3, both representations have underlying module ℚ, but q(ρ) − 1 ∈ [S^1, BGL(ℚ)^+] = K_1(ℚ) = ℚ^× equals 2 and 3 respectively.
- `classifyingMap_restrict_compat` (compatibility): r_{A,N+1}(σ) restricted to BGL_N(A) equals r_{A,N}(restrict σ).

**Acceptance.**

- For G = GL_N(A) and ρ = id: q(id_N) − N is the class of BGL_N(A) → BGL(A)^+.
- q(trivial representation on A^N) = N·(constant map).

**Used by.**

- K-book IV.5.3–5.5 and Soulé 1.2–1.4: the definition of λ^k, γ^k, ψ^k on K_m(A) and on [X, BGL(A)^+]
- KTheoryFiniteLocalFields L.1/quillen-map and L.1/adams-on-finite-field-k: q for the Brauer-lifted representations of GL_n(𝔽_q)
- S.6/hiller-universality: q is universal among natural transformations to representable functors

**Depends on.** this roadmap: `S.6/representation-ring`, `S.6/representation-ring-of-gl`; other roadmaps: `GeneralAlgebraicKTheory:K.2:plus`, `StableHomotopyKTheory:H.3/plus-construction-universal-property`, `StableHomotopyKTheory:H.4/gl-telescope-plus-comparison`, `StableHomotopyKTheory:H.1/nerve-and-classifying-space`.

**Sources.**

- `Kbook.2013`, Proposition IV.5.3 (PDF p. 320): “If 0 →(P ′, ρ′) →(P, ρ) →(P ′′, ρ′′) →0 is a short exact sequence of representations of G, then q(ρ) = q(ρ′) + q(ρ′′) in [BG, BGL(A)+].” — Additivity; the K-book's proof reduces to the block-triangular group and cites Quillen [156] for the homology isomorphism.
- `Kratzer.1980`, Théorème 3.1 (p. 237): “Preuve. D. Quillen [18] a montré que les applications canoniques s et p induisent un isomorphisme” — Kratzer's route to additivity rests on the same result of Quillen ([18] = Characteristic classes of representations, LNM 551).
- `Soule.1985`, §1.2 (p. 491): “Si 0 → ρ' → ρ → ρ'' → 0 est une suite exacte de représentation, on montre [16] que ρ est homotope à la somme de ρ' et ρ''” — Soulé's form, citing Kratzer [16].

### λ-operations on the higher K-theory of a commutative ring

`S.6/quillen-hiller-operations` · construction

For a commutative ring A and a natural operation τ of special λ-rings with τ(0) = 0, let τ_A = r_A((τ(id_N − N))_N) ∈ [BGL(A)^+, BGL(A)^+] (S.6/representation-classifying-map). For a pointed space X it acts on [X, BGL(A)^+] by composition, and for X = S^m (m ≥ 1) on K_m(A) = π_m BGL(A)^+. The λ-, γ- and Adams operations are the cases τ = λ^k, γ^k, ψ^k. On K_0(A) × [X, BGL(A)^+] the operations are extended by λ^k(a, x) = (λ^k(a), λ^k(x) + a·λ^{k−1}(x) + ⋯ + λ^i(a)λ^{k−i}(x) + ⋯ + λ^{k−1}(a)x), using the product [X, BGL(A)^+] × [X, BGL(A)^+] → [X, BGL(A)^+] from the tensor-product pairing and the K_0(A)-module structure; this gives λ^0(a, x) = (1, 0). The operations are natural in A and in X, and on K_0(A) they are those of KTheoryLowDegrees Z.3/lambda.

**Hypotheses.**

- A commutative; X a pointed space (a CW complex in the universal case X = BGL(A)^+).

**Proof.**

1. The family (τ(id_N − N))_N lies in R_ℤ(GL) (S.6/representation-ring-of-gl), and r_A gives a weak homotopy class of self-maps of BGL(A)^+.
2. Composition gives τ on [X, BGL(A)^+], natural in X; naturality in A because r_A is natural in A (S.6/representation-classifying-map).
3. The extension to K_0(A) × [X, BGL(A)^+] uses the product of S.6/product-low-degree-comparison (Loday's pairing on BGL(A)^+, restricted to [X, −] through the diagonal of X) and is forced by the sum formula once λ^0(a, x) = (1, 0).
4. On K_0(A) (X = S^0 with the component) the operations are λ^k[P] = [Λ^kP], i.e. KTheoryLowDegrees Z.3/lambda (S.6/degree-zero-comparison).

**API.**

- `TauCeti.KTheory.LambdaOperations.op` (constructor): τ_A ∈ [BGL(A)^+, BGL(A)^+] for a natural operation τ with τ(0) = 0.
- `TauCeti.KTheory.LambdaOperations.lambda` (constructor): λ^k: K_m(A) → K_m(A), m ≥ 1, and on K_0(A) × [X, BGL(A)^+].
- `TauCeti.KTheory.LambdaOperations.gamma` (constructor): γ^k likewise.
- `TauCeti.KTheory.LambdaOperations.adams` (constructor): ψ^k likewise.
- `TauCeti.KTheory.LambdaOperations.op_natural` (functoriality): f_* ∘ τ_A = τ_B ∘ f_* for a ring map f: A → B, and τ commutes with maps of spaces X → X'.
- `TauCeti.KTheory.LambdaOperations.lambda_zero_ring` (compatibility): On K_0(A), λ^k is KTheoryLowDegrees Z.3/lambda.

**Unit tests.**

- `lambda_one` (degenerate): λ^1 = id on K_m(A) for m ≥ 1, and λ^0(a, x) = (1, 0).
- `adams_units` (computation): ψ^k(u) = u^k for u ∈ A^× ⊆ K_1(A).
- `lambda_not_exterior_on_objects` (non-example): λ^k on K_1(A) is not induced by Λ^k on automorphisms: Λ² of a 1 × 1 matrix is the zero-dimensional space, but λ²(u) = −u (written additively; u^{−1} in A^×) for a unit u ∈ K_1(A), which is nonzero when u² ≠ 1.
- `op_zero_ring_compat` (compatibility): On K_0(A), λ^k[P] = [Λ^kP] = KTheoryLowDegrees Z.3/lambda.

**Acceptance.**

- λ^1 = id and λ^0 = 0 on K_m(A), m ≥ 1.
- In additive notation λ^k(a) = (−1)^{k−1}a and ψ^k(a) = ka for a unit a ∈ K_1(A) (S.6/adams-on-units-and-products).

**Used by.**

- KTheoryFiniteLocalFields L.1 (request: 'λ^k and ψ^k on K_0(A) × [X, BGL(A)^+] … induced from the representation rings'): the Quillen–Hiller form of the operations for affine schemes
- S.6/soule-scheme-operations: the sheafified version on regular schemes restricts to these operations on affine regular X
- Polylogarithms P.3 and P.4: the Adams operations on K_*(F) of a field

**Depends on.** this roadmap: `S.6/representation-classifying-map`, `S.6/representation-ring-of-gl`, `S.6/product-low-degree-comparison`; other roadmaps: `KTheoryLowDegrees:Z.3/lambda`, `GeneralAlgebraicKTheory:K.2:plus`.

**Sources.**

- `Kbook.2013`, Definition IV.5.4 (PDF p. 321): “If X is any based space, and f : X →BGL(A)+ any map, we deﬁne λkf : X →BGL(A)+ to be the composition of f and λk. This deﬁnes operations on [X, BGL(A)+] which we also refer to as λk. When X = Sn, we get operations λk : Kn(A) →Kn(A).” — The operations on [X, BGL(A)^+] and on K_n(A).
- `Kbook.2013`, IV.5, before Theorem 5.5 (PDF p. 322): “To ﬁx this, we extend the operations to K0(A) × [X, BGL(A)+] by λk(a, x) = (λk(a), λk(x) + a · λk−1(x) + · · · + λi(a)λk−i(x) + · · · + λk−1(a)x.” — The extension to K_0(A) × [X, BGL(A)^+] (the printed formula lacks its closing parenthesis).
- `Soule.1985`, §1.3 (p. 492): “On pose τ_A = r_A((τ(id_N − N))) ∈ [BGL(A)^+, BGL(A)^+].” — Soulé's form for a general natural operation τ.

### The higher K-theory of a commutative ring is a K_0(A)-λ-algebra

`S.6/quillen-hiller-special-lambda` · theorem

For a commutative ring A and a pointed space X, the operations of S.6/quillen-hiller-operations make K_0(A) × [X, BGL(A)^+] a special λ-ring (with the product of [X, BGL(A)^+] induced by the tensor product and the diagonal of X), augmented by the rank. For X = S^m, m ≥ 1, where the product on [S^m, BGL(A)^+] is zero, this says that K(A) = ⊕_{m≥0} K_m(A), with the usual product K_0(A) × K_m(A) → K_m(A) and zero product between positive degrees, is a special λ-ring: each K_m(A), m ≥ 1, is a K_0(A)-λ-algebra. Consequently, for m ≥ 1, λ^k is additive on K_m(A) and ψ^k = (−1)^{k−1}kλ^k there, ψ^k is additive, ψ^kψ^l = ψ^{kl}, and ψ^k(a·x) = ψ^k(a)ψ^k(x) for a ∈ K_0(A), x ∈ K_m(A).

**Hypotheses.**

- A commutative. The zero product in positive degrees is the product of the λ-structure, not Loday's product; the compatibility with Loday's product is S.6/adams-product-compatibility.

**Proof.**

1. Universal case X = BGL(A)^+: every identity of special λ-rings for elements of [X, BGL(A)^+] is the image under r_A of the same identity for the elements (id_N − N) of R_ℤ(GL_N), and for identities in two variables of R_ℤ(GL_N × GL_M) = R_ℤ(GL_N) ⊗ R_ℤ(GL_M) (S.6/representation-classifying-map applied to GL_N(A) × GL_M(A)); these hold because R_ℤ(GL_N), R_ℤ(GL_N × GL_M) are special λ-rings (S.6/serre-representation-ring-theorem, for the split reductive group GL_N × GL_M).
2. The sum formula λ^k(x + y) = Σλ^i(x)λ^{k−i}(y) comes from λ^k ∘ ⊕ = Σλ^i ⊗ λ^{k−i} in R(GL_m × GL_n); product and composition formulas likewise; λ^k(1) = 0 because the trivial representation of rank 1 is a line element.
3. General X by composition; K_0(A)-coefficients through the extension formula, which is forced by the sum formula.
4. X = S^m: the diagonal S^m → S^m ∧ S^m is null-homotopic (m ≥ 1), so products vanish; then S.6/adams-additivity-square-zero gives additivity of λ^k and ψ^k = (−1)^{k−1}kλ^k, and S.6/adams-multiplicative-composition gives ψ^kψ^l = ψ^{kl} and the K_0(A)-linearity.

**Acceptance.**

- On K_1(A), ψ²(x) = −2λ²(x) and λ² is additive.
- For A = ℤ, ψ^k acts on K_1(ℤ) = {±1} trivially for odd k and kills it for even k.

**Depends on.** this roadmap: `S.6/quillen-hiller-operations`, `S.6/representation-classifying-map`, `S.6/serre-representation-ring-theorem`, `S.6/adams-additivity-square-zero`, `S.6/adams-multiplicative-composition`, `S.6/lambda-ring`.

**Sources.**

- `Kbook.2013`, Theorem IV.5.5 (PDF p. 322): “Theorem 5.5. For any based space X, the λk make K0(A) × [X, BGL(A)+] into a special λ-ring” — The statement; its proof reduces to the universal case X = BGL(A)^+ and identities in representation rings.
- `Kbook.2013`, Corollary IV.5.5.1 (PDF p. 322): “If n > 0 then λk : Kn(A) →Kn(A) is additive, and we have ψk(x) = (−1)k−1kλk.” — The consequence for K_n(A), n > 0.
- `Soule.1985`, §1.4 (p. 492): “est muni du produit nul entre deux éléments de degré positif et du produit usuel (induit par le produit tensoriel, [19]): K_0(A) × K_m(A) → K_m(A), les opérations λ^k font de K(A) un λ-anneau.” — Soulé's formulation of the K_0(A)-λ-algebra structure.

### Hiller's universality of the classifying map

`S.6/hiller-universality` · theorem

For a commutative ring A, the natural transformation R_A(π_1X) → [X, BGL(A)^+] of functors on connected pointed spaces (induced by S.6/representation-classifying-map through X → Bπ_1X) is universal for natural transformations to representable functors: for every connected H-space H and every natural transformation η_X: R_A(π_1X) → [X, H] there is a map f: BGL(A)^+ → H, unique up to homotopy, with η = f_* ∘ q. In particular a natural transformation of λ-rings R_A(π_1 X) → R_{A'}(π_1X) (e.g. Brauer lifting) induces maps [X, BGL(A)^+] → [X, BGL(A')^+] commuting with λ^k and ψ^k.

**Hypotheses.**

- X ranges over connected pointed CW complexes; H is a connected H-space. The proof is by obstruction theory (Hiller 1981, 2.4), not read: recorded as a gap.

**Proof.**

1. Existence: consider the spaces BGL_n(A) and the maps BGL_n(A) → H given by η(id_n); they are compatible up to homotopy with stabilisation, and obstruction theory (Hiller 2.4; the K-book compares it with Theorem IV.1.8) produces f on BGL(A), hence on BGL(A)^+ by the universal property of the plus construction (StableHomotopyKTheory H.3/plus-construction-universal-property). Gap: Hiller's argument is not public.
2. Uniqueness: two such f agree on each BGL_n(A) up to homotopy, and phantom classes are excluded by the argument of Hiller 2.4 (gap).
3. Consequence for λ-homomorphisms: apply universality to both sides of the square of natural transformations.

**Acceptance.**

- For H = BGL(A)^+ and η = q the map f is the identity.
- The consequence used by KTheoryFiniteLocalFields L.1/adams-on-finite-field-k: [X, BGL(𝔽_q)^+] → [X, BU] commutes with ψ^k.

**Depends on.** this roadmap: `S.6/representation-classifying-map`; other roadmaps: `StableHomotopyKTheory:H.3/plus-construction-universal-property`, `GeneralAlgebraicKTheory:K.2:plus`.

**Sources.**

- `Kbook.2013`, Proposition IV.5.7 (PDF p. 323): “The natural transformation RA(π1X) q−→[X, BGL(A)+] is universal for maps to representable functors.” — The statement; the K-book continues 'Like Theorem 1.8, this is proven by obstruction theory … See Hiller [89, 2.4] for details.'

### Adams operations are multiplicative for the Loday product

`S.6/adams-product-compatibility` · theorem

For a commutative ring A, the Adams operations of S.6/quillen-hiller-operations satisfy ψ^k(x·y) = ψ^k(x)·ψ^k(y) for x ∈ K_m(A), y ∈ K_n(A), m, n ≥ 0, where x·y is the product of S.6/graded-commutative-ring (Loday's product; S.6/product-low-degree-comparison). Consequently K_*(A)_ℚ is bigraded by weight: K^{(i)}_m(A)_ℚ · K^{(j)}_n(A)_ℚ ⊆ K^{(i+j)}_{m+n}(A)_ℚ. For the γ-operations there is the product formula γ^k(xy) = Σ_{k'+k''=k} −((k−1)!/((k'−1)!(k''−1)!)) γ^{k'}(x)γ^{k''}(y) when mn ≠ 0.

**Hypotheses.**

- A commutative; m, n ≥ 0; the γ-product formula needs m, n ≥ 1.

**Proof.**

1. The product is induced by γ: BGL(A)^+ ∧ BGL(A)^+ → BGL(A)^+ (K-book IV.1.10); it suffices that ψ^k ∘ γ ≃ γ ∘ (ψ^k ∧ ψ^k) up to weak homotopy.
2. Both composites are natural transformations R_A(π_1(X × X')) → [X ∧ X', BGL(A)^+] coming from the λ-ring maps R_A(GL_m(A) × GL_n(A)); in these rings ψ^k is multiplicative (S.6/adams-multiplicative-composition, R(GL_m × GL_n) special by S.6/serre-representation-ring-theorem), so by S.6/hiller-universality the two maps agree.
3. The weight statement follows from multiplicativity (S.6/affine-weight-decomposition); the γ-formula is Kratzer's (cited by Soulé 1.6; not re-derived here).

**Acceptance.**

- For units a, b: ψ^k({a, b}) = ψ^k(a)ψ^k(b) = k²{a, b} (K-book Example IV.5.9.1).
- K_0(A) × K_m(A): ψ^k([P]x) = ψ^k[P]·ψ^k(x).

**Depends on.** this roadmap: `S.6/quillen-hiller-operations`, `S.6/hiller-universality`, `S.6/adams-multiplicative-composition`, `S.6/serre-representation-ring-theorem`, `S.6/product-low-degree-comparison`.

**Sources.**

- `Kbook.2013`, Theorem IV.5.9 (PDF p. 323): “The Adams operations ψk are compatible with the product on K-theory, in the sense that ψk(x · y) = ψk(x) · ψk(y) for x ∈Km(A) and y ∈Kn(A).” — The statement; the proof uses Proposition 5.7 and the representation rings of GL_m(A) × GL_n(A).
- `Soule.1985`, §1.6 (p. 493): “Loday [19] a défini un produit K_m(A) × K_n(A) → K_{m+n}(A) pour tout couple (m, n) d'entiers naturels. On a, pour ce produit, ψ^k(xy) = ψ^k(x)ψ^k(y) si k ∈ Z − {0},” — Soulé's statement, followed by the γ-product formula.

### Adams and λ-operations on units and on products of units

`S.6/adams-on-units-and-products` · lemma

Let A be a commutative ring. (a) For a unit a ∈ A^× ⊆ K_1(A) (K_1 written additively): λ^k(a) = (−1)^{k−1}a and ψ^k(a) = ka (i.e. a^k in A^×). (b) For units a_1,…,a_n, the product {a_1,…,a_n} = a_1⋯a_n ∈ K_n(A) of S.6/graded-commutative-ring satisfies ψ^k{a_1,…,a_n} = k^n{a_1,…,a_n}; so ψ^k = k^n on the subgroup of K_n(A) generated by products of n units. (c) ψ^k acts on K_0(A) ⊇ Pic classes by ψ^k[L] = [L^{⊗k}].

**Hypotheses.**

- A commutative; K_1 is written additively in (a).

**Proof.**

1. (a): the unit a is q(ρ) − 1 for the representation of ℤ on A by a (S.6/representation-classifying-map); in R_A(ℤ), x = [ρ] − 1 has λ_t(x) = (1 + [ρ]t)/(1 + t), whose t^k-coefficient is (−1)^{k−1}([ρ] − 1); ψ^k(x) = [ρ]^k − 1 = [ρ^k] − 1 maps to a^k, i.e. ka additively. This corrects the sign in the K-book's Example IV.5.4.1 (see sourceIssues).
2. (b): multiplicativity (S.6/adams-product-compatibility) and (a).
3. (c): [L] is a line element (λ^j[L] = [Λ^jL] = 0 for j ≥ 2), so ψ^k[L] = [L]^k = [L^{⊗k}] (S.6/adams-additivity-square-zero).

**Acceptance.**

- ψ²(−1) = (−1)² = 1 in K_1(ℤ) = {±1}.
- For a field F and a, b ∈ F^×: ψ^k{a, b} = {a^k, b^k} = k²{a, b} in K_2(F).

**Depends on.** this roadmap: `S.6/representation-classifying-map`, `S.6/quillen-hiller-special-lambda`, `S.6/adams-product-compatibility`, `S.6/adams-additivity-square-zero`; other roadmaps: `KTheoryLowDegrees:U.3/units-to-K1`.

**Sources.**

- `Kbook.2013`, Example IV.5.4.1 (PDF p. 321): “When n = 1 and a ∈A× is regarded as an element of K1(A), the formulas λk(a) = a and ψk(a) = ak are immediate from the formula 5.2 for λk A.” — Part (a); the printed λ^k(a) = a is corrected to λ^k(a) = (−1)^{k−1}a (sourceIssues), since ψ^k = (−1)^{k−1}kλ^k on K_1 (Corollary IV.5.5.1).
- `Kbook.2013`, Example IV.5.9.1 (PDF p. 324): “This is because K2(F) is generated by Steinberg symbols {a, b} (III.6.1), and Example 5.4.1 implies that ψk{a, b} = {ak, bk} = k2{a, b}.” — Part (b) in degree 2.

### The first steps of the γ-filtration on higher K-groups (Kratzer)

`S.6/kratzer-low-gamma` · theorem

For every commutative ring A: F^1_γK_1(A)/F^2_γK_1(A) ≅ A^× (via the determinant) and F^2_γK_1(A) = SK_1(A), so K_1(A) = A^× ⊕ F^2_γK_1(A); and K_n(A) = F^2_γK_n(A) for n ≥ 2. Here F^i_γ is the filtration of S.6/gamma-filtration on the K_0(A)-λ-algebra K_m(A) (m ≥ 1), with F^1_γK_m(A) = K_m(A).

**Hypotheses.**

- A commutative; the filtration is the one generated by γ^j(x) and a·γ^j(x) (S.6/gamma-filtration).

**Proof.**

1. K_n(A) = π_nBSL(A)^+ for n ≥ 2 and SK_1(A) = π_1BSL(A)^+ (K-book Ex. IV.1.8(a); KTheoryLowDegrees U.3/special-K1 for SK_1).
2. In R_ℤ(SL_N), λ^N(id_N) = det = 1. For ρ = id_N − N one has Σ_{i=0}^{N}γ^i(ρ) = λ^N(id_N) and γ^i(ρ) = 0 for i > N (fixed-rank identities, checked on ξ_1 + ⋯ + ξ_N where γ_t(Σξ_j − N) = ∏(1 + (ξ_j − 1)t) and t = 1 gives ∏ξ_j; S.6/lambda-identity-principle), so γ^1(ρ) + ⋯ + γ^N(ρ) = 0.
3. Mapping by r_A (S.6/representation-classifying-map for SL_N(A)) gives x = γ^1(x) = −Σ_{i≥2}γ^i(x) ∈ F^2_γ for x ∈ π_nBSL(A)^+.
4. Conversely det: K_1(A) → A^× kills F^2_γ: on units γ^k(a) = Σ_{j=1}^{k}(−1)^{j−1}C(k−1, j−1)a = 0 for k ≥ 2 (λ^j(a) = (−1)^{j−1}a, S.6/adams-on-units-and-products), γ^k vanishes on SK_1 ⊆ F^2 by the first steps, and det(b·x) = det(x)^{rank b} = 1 for b of rank zero. With K_1(A) = A^× × SK_1(A) (KTheoryLowDegrees U.3/K1-units-split) this gives F^2_γK_1 = SK_1 and F^1/F^2 ≅ A^×.

**Acceptance.**

- For a field F, K_1(F) = F^× has F^2_γK_1(F) = SK_1(F) = 0.
- K_2(F) = F^2_γK_2(F) for every field F.

**Depends on.** this roadmap: `S.6/representation-classifying-map`, `S.6/quillen-hiller-special-lambda`, `S.6/gamma-filtration`, `S.6/lambda-identity-principle`, `S.6/adams-on-units-and-products`; other roadmaps: `KTheoryLowDegrees:U.3/special-K1`, `KTheoryLowDegrees:U.3/K1-units-split`.

**Sources.**

- `Kbook.2013`, Proposition IV.5.10 (PDF p. 324): “Proposition 5.10. (Kratzer) For all commutative A, SK1(A) = F 2 γ K1(A), and F 1 γ K1(A)/F 2 γ K1(A) = A×, and for n ≥2: Kn(A) = F 2 γ Kn(A).” — The statement, with the proof via the identity det(id_N) = 1 in R(SL_N).
- `Soule.1985`, Proposition 1 (p. 500): “Mais l'identité dét(id_N) = 1 dans R_Z(SL_N) s'écrit aussi γ^1(id_N − N) + γ^2(id_N − N) + … + γ^N(id_N − N) = 0.” — The key identity (Soulé writes the resulting splitting as K_1(A) = A^* × F²_γK_1(A)).

### Soulé's bound on the length of the γ-filtration of a ring

`S.6/soule-gamma-bound` · theorem

(i) Let A be a finite R-algebra with dim Max(R) < ∞. For x ∈ K_0(A) with ε(x) = 0 and k ≥ dim Max(R) + 1, γ^k(x) = 0. (ii) Let A be a commutative ring with stable rank r = sr(A) < ∞ (KTheoryLowDegrees U.3/stable-range) and m ≥ 1. For x ∈ K_m(A) and k ≥ m + r, γ^k(x) = 0; hence F^{m+r}_γK_m(A) = 0 (for the filtration generated by the γ^j(x)). Since sr(A) ≤ dim(A) + 1 for noetherian A, γ^k = 0 on K_m(A) for k ≥ m + dim(A) + 1.

**Hypotheses.**

- (i) A finite over R with dim Max(R) finite; (ii) sr(A) < ∞. (ii) uses Suslin's surjective stability K_m(A)_N → K_m(A) for N ≥ m + r − 1 on Volodin's model, which is cited (Suslin, 'Stability in algebraic K-theory', LNM 966) and not read: gap.

**Proof.**

1. (i): write x = [P] − ε[P]; by Serre's splitting theorem (Bass IV 2.7, cited by Soulé; not read — gap) [P] = [Q] + [A^m] with rank Q = r ≤ dim Max(R), so x = [Q] − r and γ^k(x) = λ^k([Q] + k − 1 − r) = 0 for k ≥ r + 1 because [Q] + k − 1 − r is the class of a projective of rank k − 1.
2. (ii): Volodin's model K_m(A) = π_{m−1}V(A) (Soulé 2.3–2.4, Suslin): a representation of GL_N maps V_N(A) to V(A) (every irreducible representation of GL_N is a tensor product of exterior powers of the identity, so its image of the triangular groups is triangular), giving operations on K_{m,N}(A) compatible with those of S.6/quillen-hiller-operations.
3. γ^k(id_N − N) = λ^k(id_N − N + k − 1) = 0 in R_ℤ(GL_N) for k > N (a genuine representation of rank k − 1), so γ^k vanishes on the image of K_{m,N}(A); by surjective stability (gap) this image is all of K_m(A) for N ≥ m + r − 1.

**Acceptance.**

- For a field (r = 1): γ^k = 0 on K_m(F) for k ≥ m + 1, so F^{m+1}_γK_m(F) = 0.
- For a Dedekind domain (dim 1, K_0): γ^k(x) = 0 for x of rank 0 and k ≥ 2, so F^2_γK_0 = 0 and K̃_0 = Pic.

**Depends on.** this roadmap: `S.6/quillen-hiller-operations`, `S.6/gamma-filtration`, `S.6/representation-ring-of-gl`; other roadmaps: `KTheoryLowDegrees:U.3/stable-range`, `KTheoryLowDegrees:Z.3/gamma`.

**Sources.**

- `Soule.1985`, Théorème 1 (p. 494): “ii) Soient A un anneau commutatif unitaire tel que r.s.A < +∞ et m ≥ 1 un entier. Si x ∈ K_m(A) et k ≥ m + r.s.(A) on a γ^k(x) = 0.” — Part (ii); part (i) is Théorème 1 i) on the same page.
- `Kbook.2013`, Remark IV.5.10.1 (PDF p. 324): “Soulé has proven [174, Thm. 1] that if A has stable range sr(A) < ∞ (I, Ex. 1.5) then γ^k vanishes on K_n(A) for all k ≥ n + sr(A).” — The K-book's statement of (ii), with the bound sr(A) ≤ dim(A) + 1 for noetherian A.

### Weight decomposition of the K-theory of a ring

`S.6/affine-weight-decomposition` · theorem

Let A be a commutative ring and m ≥ 1. (1) Rationally: the eigenvalues of ψ^k on K_m(A)_ℚ lie in {k, k², …}, the eigenspace K^{(i)}_m(A) for ψ^k = k^i is independent of k, and K_*(A)_ℚ ≅ ⊕_{m,i}K^{(i)}_m(A)_ℚ as bigraded rings; if sr(A) = r < ∞, only 2 ≤ i ≤ m + r − 1 occur for m ≥ 2 and 1 ≤ i ≤ r for m = 1. (2) Integrally (Soulé): with r = sr(A) < ∞, K_m(A) = ⊕_{i=2}^{m+r−1} K_m(A)^{(i)} modulo 𝒮_{m+r−1} for m ≥ 2, and K_1(A) = ⊕_{i=1}^{r} K_1(A)^{(i)} modulo 𝒮_{r+1}, where K_m(A)^{(i)} = {x : ψ^k(x) = k^ix for all k} and 𝒮_n is the class of abelian groups of finite exponent all of whose prime divisors p satisfy p = 2 or p < n (an isomorphism modulo 𝒮_n becomes one after ⊗ℤ[1/(n−1)!] for n ≥ 3). The denominators are controlled by w_i = gcd_{k≥2} k^N(k^i − 1) (N large): w_i = 2 for i odd, and for i even a prime p divides w_i iff (p − 1) | i (w_2 = 24).

**Hypotheses.**

- A commutative; (1) needs only that every element of K_m(A) comes from a finitely generated subring, where sr < ∞.
- (2) needs sr(A) < ∞ and the bound of S.6/soule-gamma-bound.

**Proof.**

1. (1): K_m commutes with filtered colimits of rings (GeneralAlgebraicKTheory K.7/invariance-products-and-colimits), so reduce to sr(A) < ∞; by S.6/soule-gamma-bound, F^{m+r}_γK_m(A) = 0, and F^1_γK_m = K_m; apply S.6/rational-weight-decomposition with J = K_m(A), a = 1, N = m + r − 1; Kratzer's F^2_γK_m = K_m for m ≥ 2 (S.6/kratzer-low-gamma) raises a to 2; multiplicativity from S.6/adams-product-compatibility.
2. (2): choose integers A_{ijk} with w_{|j−i|} = Σ_k A_{ijk}(k^i − k^j); the operators Φ_i = ∏_{j≠i}(Σ_kA_{ijk}(ψ^k − k^j)) map K_m(A) into K_m(A)^{(i)}, and on F^i_γ they are ≡ ∏_{j≠i}w_{|i−j|} modulo F^{i+1}_γ (S.6/adams-eigenvalue-on-gamma-graded); with F^{m+r}_γ = 0 this shows kernel and cokernel of ⊕K^{(i)} → K_m are killed by A_m = ∏_{i≠j}w_{|i−j|}, whose primes are 2 or < m + r − 1.
3. The value of w_i: the gcd over k of k^N(k^i − 1) is computed by the structure of (ℤ/p^a)^× (Milnor–Stasheff, Appendix, cited by Soulé).

**Acceptance.**

- w_1 = gcd(2^N·1, 3^N·2, …) = 2 and w_2 = gcd(2^N·3, 3^N·8, 5^N·24, …) = 24.
- For A = F a field (r = 1) and m = 2: K_2(F) = K_2(F)^{(2)} modulo 𝒮_2, the groups of 2-power exponent, consistent with ψ^k = k² on K_2(F).
- K_3(F)_ℚ = K_3(F)^{(2)}_ℚ ⊕ K_3(F)^{(3)}_ℚ (weights 2 ≤ i ≤ 3).

**Depends on.** this roadmap: `S.6/soule-gamma-bound`, `S.6/kratzer-low-gamma`, `S.6/rational-weight-decomposition`, `S.6/adams-eigenvalue-on-gamma-graded`, `S.6/adams-product-compatibility`, `S.6/quillen-hiller-special-lambda`; other roadmaps: `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`.

**Sources.**

- `Kbook.2013`, Theorem IV.5.11 (PDF p. 324): “For n > 0, the eigenvalues of ψk on Kn(A) ⊗Q are a subset of {1, k, k2, . . . }, and the subspace K(i) n (A) of eigenvectors for ψk = ki is inde- pendent of k. Finally, the ring K∗(A) ⊗Q is isomorphic to the bigraded ring ⊕n,iK(i) n (A).” — Part (1) (text layer; rendered K^{(i)}_n(A)).
- `Soule.1985`, Corollaire 1 (p. 498): “COROLLAIRE 1. Sous les hypothèses du Théorème 1, ii), on a, en posant r = r.s.A < +∞, K_m(A) = ⊕_{i=2}^{m+r−1} K_m(A)^{(i)} (modulo 𝒮_{m+r−1}) si m ≥ 2,” — Part (2); 𝒮_n is defined in 2.7 and w_i in the proof on p. 498.

### Adams weights of the K-theory of a field

`S.6/field-weight-decomposition` · application

Let F be a field. Then K_0(F)_ℚ = K_0^{(0)}, K_1(F)_ℚ = K_1^{(1)}(F)_ℚ = F^× ⊗ ℚ, and for m ≥ 2, K_m(F)_ℚ = ⊕_{i=2}^{m} K_m^{(i)}(F)_ℚ with K_m^{(i)} ≅ gr^i_γK_m(F)_ℚ; the image of the products of m units (Milnor symbols) lies in K_m^{(m)}(F)_ℚ; integrally K_m(F) = ⊕_{i=2}^{m}K_m(F)^{(i)} modulo 𝒮_m. In particular K_3(F)_ℚ = K_3^{(2)}(F)_ℚ ⊕ K_3^{(3)}(F)_ℚ. The identification of the top weight with Milnor K-theory (Soulé, Théorème 2: K_m(F)^{(m)} = K^M_m(F) modulo 𝒮_m, using Suslin's homology stability) and the vanishing of low weights (Beilinson–Soulé) are not claimed here.

**Hypotheses.**

- F a field: stable rank 1.

**Proof.**

1. Apply S.6/affine-weight-decomposition with r = sr(F) = 1: weights in [2, m] for m ≥ 2 and [1, 1] for m = 1; K_0(F) = ℤ has weight 0.
2. Products of m units have weight m by S.6/adams-on-units-and-products(b).
3. gr^i_γ ≅ K^{(i)} rationally by S.6/rational-weight-decomposition(3).

**Acceptance.**

- K_2(F)_ℚ = K_2^{(2)}(F)_ℚ.
- For F = 𝔽_q: K_{2i−1}(𝔽_q) is torsion, so K_m(𝔽_q)_ℚ = 0 for m ≥ 1; ψ^k = k^i on K_{2i−1}(𝔽_q) (KTheoryFiniteLocalFields L.1/adams-on-finite-field-k) is the integral refinement.

**Depends on.** this roadmap: `S.6/affine-weight-decomposition`, `S.6/adams-on-units-and-products`, `S.6/rational-weight-decomposition`.

**Sources.**

- `Soule.1985`, Introduction (p. 488): “Si A est un corps (ou un anneau local contenant un corps infini) le dernier cran de la γ-filtration correspond au premier défaut de stabilité qui est égal, grâce à un résultat de Suslin [35], à la K-théorie de Milnor K_m^M(A) de l'anneau A, à torsion près (Théorème 2).” — Soulé's description of the top weight for fields (Théorème 2), cited and not planned here.
- `Kbook.2013`, Vanishing Conjecture IV.5.12 (PDF p. 325): “(Beilinson-Soul´e) If i < n/2 and A is regular then Kn(A) = F i γKn(A).” — The conjectural low-weight vanishing, recorded as not claimed.

### K_0 of vector bundles is a special λ-ring

`S.6/vector-bundle-lambda-ring` · theorem

Let X be a quasi-compact scheme and K_0(Vect X) the Grothendieck group of the exact category of finite locally free O_X-modules. The operations λ^k[E] = [Λ^kE] extend to K_0(Vect X) and make it a special λ-ring, augmented by the rank to H^0(X, ℤ) (locally constant integer functions); line bundles are line elements, and ψ^k[L] = [L^{⊗k}]. For a vector bundle E of constant rank N with a trivialising Zariski cover and cocycle g_{ij} ∈ GL_N(O(U_ij)), and a representation σ of GL_N over ℤ, the associated bundle σ(E) is glued by σ(g_{ij}); E ↦ σ(E) gives a λ-homomorphism R_ℤ(GL_N) → K_0(Vect X) sending id_N to [E], and likewise R_ℤ(GL_N × GL_M) → K_0(Vect X) for a pair (E, F). For X = Spec A this is the special λ-ring structure on K_0(A), with the operations of KTheoryLowDegrees Z.3/lambda.

**Hypotheses.**

- X quasi-compact (so that a bundle has finitely many ranks on components and finite trivialising covers); no regularity is used.
- For non-constant rank, decompose X into the finitely many open-closed subsets where the rank is constant.

**Proof.**

1. Pre-λ-ring: Λ^k of a short exact sequence 0 → E' → E → E'' → 0 of vector bundles has a filtration with quotients Λ^iE' ⊗ Λ^{k−i}E'' (K-book Ex. I.5.4), so λ_t(E) = λ_t(E')λ_t(E'') and λ_t extends to K_0(Vect X) (tauceti:TauCeti.ExactK0.lift).
2. Associated bundles: σ(g_{ij}) satisfies the cocycle condition because σ is a homomorphism natural in the ring; exact sequences, ⊗ and Λ^k of representations give exact sequences, ⊗ and Λ^k of associated bundles; so E ↦ [σ(E)] is a pre-λ-homomorphism R_ℤ(GL_N) → K_0(Vect X) with id_N ↦ [E] (Gillet–Soulé's Lemma 20 in this form).
3. Special axioms on classes of bundles: an identity in λ^•[E] (one bundle) or in λ^•[E], λ^•[F] (two bundles, via GL_N × GL_M and the external construction) holds in K_0(Vect X) because it holds in the special λ-rings R_ℤ(GL_N), R_ℤ(GL_N × GL_M) (S.6/serre-representation-ring-theorem).
4. Extension to virtual classes: the product axiom says λ_t(xy) = λ_t(x) ∗ λ_t(y) for the Witt product ∗ on 1 + tK[[t]] (K-book Example II.4.3), which is biadditive; both sides are biadditive in (x, y), so the axiom passes from classes of bundles to differences. The composition axiom λ^k(λ^l x) = P_{k,l}(λ^•x) passes from x, y to x + y by the sum formula and to −x by induction on k from λ_t(x)λ_t(−x) = 1; the identities of the Witt ring used are checked by S.6/lambda-identity-principle in ℤ[ξ, η].
5. λ^k(1) = 0 (k ≥ 2) since Λ^kO_X = 0; the rank is a λ-homomorphism to the binomial ring H^0(X, ℤ).
6. For a line bundle L, λ^j[L] = 0 (j ≥ 2), so ψ^k[L] = [L]^k = [L^{⊗k}] (S.6/adams-additivity-square-zero).

**Acceptance.**

- λ²([O] + [O(1)]) = [O(1)] on P^1.
- For X = Spec A, λ^k[P] = [Λ^kP] (Z.3/lambda-of).

**Depends on.** this roadmap: `S.6/representation-ring-of-gl`, `S.6/serre-representation-ring-theorem`, `S.6/lambda-identity-principle`, `S.6/lambda-ring`, `S.6/adams-additivity-square-zero`; other roadmaps: `KTheoryLowDegrees:Z.3/lambda-of`; libraries: `tauceti:TauCeti.ExactK0`, `tauceti:TauCeti.ExactK0.lift`, `mathlib:ExteriorAlgebra.exteriorPower`.

**Sources.**

- `Kbook.2013`, Proposition II.8.8 (PDF p. 161): “The operations λk[F] = [∧kF] are well-deﬁned on K0(X), and make K0(X) into a λ-ring.” — The pre-λ-ring structure on K_0(X) = K_0(Vect X); specialness is Corollary II.8.8.2, which the K-book derives from the splitting principle (II.8.8.1) and Fulton–Lang; the node derives it from representation rings instead.
- `GilletSoule.1999`, Lemma 20 (p. 44): “Given any locally ringed topos (T, O_T) there is a canonical ring homomorphism φ : R_Z(GL_N) → H^0(BGL_N, K). It is compatible with the inclusions GL_{N−1} → GL_N.” — The representation-ring homomorphism whose value on a bundle's classifying map is the associated-bundle map of this node.

### The complete flag bundle of a vector bundle

`S.6/complete-flag-bundle` · construction · also realises S.7

For a vector bundle E of constant rank n on a quasi-compact scheme X, the complete flag bundle f: Fl(E) → X is defined by recursion on n: Fl(E) = X if n ≤ 1, and Fl(E) = Fl(Q) → P(E) → X otherwise, where π: P(E) → X is the projective bundle of lines in E (S.5's convention, with tautological sub-line bundle O(−1) ⊆ π^*E) and Q = π^*E/O(−1) has rank n − 1. It carries a filtration 0 = F_0 ⊂ F_1 ⊂ ⋯ ⊂ F_n = f^*E by subbundles with line bundle quotients L_i = F_i/F_{i−1}. f is smooth, projective, and a composite of n − 1 projective bundle maps; it commutes with base change X' → X.

**Hypotheses.**

- X quasi-compact; E of constant rank n (componentwise otherwise).
- The projective bundle convention is the one of SchemeKTheoryOperations S.5/projective-bundle-theorem (lines in E).

**Proof.**

1. Construct P(E) → X with O(−1) ⊆ π^*E (S.5); the quotient Q is a vector bundle of rank n − 1 on P(E).
2. Define Fl(E) by recursion on n as Fl(Q) → P(E) → X; the filtration of f^*E is the preimage of the filtration of Q together with O(−1).
3. Base change: P(E) and quotients commute with pullback along X' → X, so Fl(E ×_X X') = Fl(E) ×_X X'.

**API.**

- `TauCeti.AlgebraicGeometry.flagBundle` (constructor): f: Fl(E) → X for a vector bundle E of constant rank.
- `TauCeti.AlgebraicGeometry.flagBundle.filtration` (data): The filtration F_• of f^*E with line bundle quotients L_1, …, L_n.
- `TauCeti.AlgebraicGeometry.flagBundle.baseChange` (functoriality): Fl(g^*E) ≅ X' ×_X Fl(E) compatibly with filtrations.
- `TauCeti.AlgebraicGeometry.flagBundle.projective` (structure): f is smooth, projective and a composite of projective bundles.
- `TauCeti.AlgebraicGeometry.flagBundle.lineQuotients_sum` (characterisation): [f^*E] = Σ[L_i] in K_0(Vect Fl(E)).

**Unit tests.**

- `flagBundle_line` (degenerate): For E of rank 1, Fl(E) = X and the filtration is 0 ⊂ E.
- `flagBundle_rank_two` (computation): For E of rank 2, Fl(E) = P(E) and the filtration is O(−1) ⊂ π^*E with quotient π^*E/O(−1) ≅ π^*det E ⊗ O(1).
- `flagBundle_pbt_compat` (compatibility): For rank 2, K_*(Fl(E)) = K_*(X) ⊕ K_*(X)[O(−1)] is S.5/projective-bundle-theorem.
- `flagBundle_not_grassmannian` (non-example): Fl(O^3) over a field has K_0 free of rank 6 = 3!, while the Grassmannian of lines in k^3 (= P^2) has K_0 of rank 3: the flag bundle is not the Grassmannian.

**Acceptance.**

- Fl of a line bundle is X; Fl(O^2) = P^1_X.
- For E = O^n on X = Spec k, Fl(E) is the variety of complete flags in k^n, of dimension n(n−1)/2.

**Used by.**

- K-book II.8.8.1 and II.8.9: the splitting principle for K_0 and for Chern classes
- S.6/riemann-roch-without-denominators: reduction of the universal polynomial computation to line bundles
- S.7/gamma-first-graded-pieces and S.7/chern-character-ring-homomorphism: computations with Chern roots
- SchemeAndStackFoundations SF.5 (Chern classes): the Chow-theoretic splitting principle uses the same flag bundle

**Depends on.** this roadmap: `S.5/projective-bundle-theorem`, `S.5/projective-bundle-cohomology`.

**Sources.**

- `Kbook.2013`, Splitting Principle II.8.8.1 (PDF p. 161): “Let f : F(E) →X be the ﬂag bundle of E; by Theorem I.5.9 the bundle f ∗E has a ﬁltration by sub-vector bundles whose successive quotients Li are line bundles.” — The flag bundle and its filtration.
- `GilletSoule.1999`, 3.3.4 (p. 44): “Let X and E be as in Proposition 6. On the associated projective bundle P(E), there is an exact sequence of vector bundles 0 → E' → p^*E → L → 0” — The step of the recursion (Gillet–Soulé use quotient line bundles; the node uses the sub-line O(−1) with the same effect).

### The K-theoretic splitting principle

`S.6/k-theoretic-splitting-principle` · theorem · also realises S.7

Let X be a quasi-compact quasi-separated scheme, E a vector bundle of constant rank n and f: Fl(E) → X its complete flag bundle. Then K_*(Fl(E)) is a free graded K_*(X)-module of rank n! (via f^* and the products of S.6/graded-commutative-ring), f^*: K_m(X) → K_m(Fl(E)) is split injective for every m (also with supports and nonconnectively), and f^*[E] = Σ_{i=1}^{n}[L_i] in K_0(Fl(E)). Consequently, for finitely many bundles E_1, …, E_r there is a composite g: X' → X of flag bundles with g^* injective on K_* and every g^*[E_j] a sum of line bundle classes; and pullback along g is injective on Pic(X).

**Hypotheses.**

- X qcqs; the statement is K-theoretic (for Chow groups and Chern classes the analogous statement is SchemeAndStackFoundations SF.5's).

**Proof.**

1. Each step P(Q) → Y of the recursion satisfies the projective bundle theorem K(P(Q)) ≃ ∏_{i<rk Q}K(Y)·[O(−i)] (S.5/projective-bundle-theorem, with supports and nonconnectively); so K_*(P(Q)) is free over K_*(Y) with basis 1, [O(−1)], …, and π^* is split injective (retraction: the coefficient of the basis element 1).
2. Iterating over the n − 1 steps of S.6/complete-flag-bundle gives freeness of rank n(n−1)⋯1 = n! and split injectivity of f^*.
3. The filtration F_• of f^*E gives [f^*E] = Σ[L_i] by additivity in K_0 of exact sequences.
4. For several bundles take successive flag bundles of the pullbacks; injectivity composes.
5. Pic: if g^*L ≅ O then g^*([L] − 1) = 0 in K_0, so [L] = 1 in K_0(X) and L ≅ det[L] = O (det: K_0 → Pic of S.7/gamma-first-graded-pieces is a homomorphism with det[L] = L; here only det of classes of bundles is used).

**Acceptance.**

- For E = O ⊕ O(1) on P^1_k, the pullback to Fl(E) = P(E) (a Hirzebruch surface) splits [E] and K_0(P(E)) ≅ ℤ^4.
- For X = Spec k, K_0(Fl(k^n)) ≅ ℤ^{n!}.

**Depends on.** this roadmap: `S.6/complete-flag-bundle`, `S.5/projective-bundle-theorem`, `S.6/graded-commutative-ring`, `S.2/k-theory-pullback`.

**Sources.**

- `Kbook.2013`, Splitting Principle II.8.8.1 (PDF p. 161): “Let f : F(E) →X be the ﬂag bundle of a vector bundle E over a quasi-compact scheme X. Then K0(F(E)) is a free module over the ring K0(X), and f ∗[E] is a sum of line bundles P[Li].” — The K_0 statement; the node uses S.5's projective bundle theorem to extend it to K_* and to supports.
- `GilletSoule.1999`, 3.3.4 (p. 44): “Therefore, by induction on N, if p : D(E) → X is the flag space of E, then in K_0(D(E)), p^*([E]) is a sum of classes of line bundles.” — The same induction in Gillet–Soulé's simplicial setting.

### Hypercohomology with supports of simplicial sheaves on a noetherian scheme

`S.6/simplicial-sheaf-hypercohomology` · definition

Let X be a noetherian scheme of finite Krull dimension. S_*(X) is the category of sheaves of pointed simplicial sets on X_Zar; a map is a weak equivalence if it induces isomorphisms of homotopy groups of all stalks (at every point and base point), and a fibration if its sections over each inclusion U ⊆ V of opens give Kan fibrations Γ(V, F) → Γ(V, G) ×_{Γ(U,G)} Γ(U, F) (Brown–Gersten); Ho S_*(X) is the homotopy category. For a closed subset Y and a sheaf F with fibrant replacement F → K, the hypercohomology with supports is H^{−m}_Y(X, F) = π_m(fibre(Γ(X, K) → Γ(X − Y, K))) = [S^m_Y, K], where S^m_Y is the constant sheaf of m-spheres with support in Y. It is contravariant in (X, Y), covariant in F for maps in Ho S_*(X), sits in the long exact sequence ⋯ → H^{−m}_Y(X, F) → H^{−m}(X, F) → H^{−m}(X − Y, F) → H^{−m+1}_Y(X, F) → ⋯, and has the Brown spectral sequence E_2^{pq} = H^p_Y(X, π_{−q}F) ⇒ H^{p+q}_Y(X, F) with a fringe effect on p + q = 0.

**Hypotheses.**

- X noetherian of finite Krull dimension (for convergence of the Brown spectral sequence and Thomason's comparison).
- The existence of the closed model structure is Brown–Gersten's theorem (Soulé 4.1, citing [9] Théorème 2), which is not read: gap. Only the homotopy category and the hypercohomology groups are used.

**Proof.**

1. Define weak equivalences and fibrations as stated; the closed model structure (Brown–Gersten; the Mathlib notion is mathlib:HomotopicalAlgebra.ModelCategory on sheaves (mathlib:CategoryTheory.Sheaf) of pointed simplicial sets (mathlib:SSet)) gives Ho S_*(X) and functorial fibrant replacement: gap for its existence.
2. Define H^{−m}_Y as stated; the long exact sequence is the homotopy sequence of the fibration Γ_Y(X, K) → Γ(X, K) → Γ(X − Y, K) (StableHomotopyKTheory H.2/homotopy-fibre-and-long-exact-sequence).
3. Comparison with Thomason's Godement hypercohomology: for a sheaf of pointed Kan complexes, H^{−m}_Y(X, F) = π_m of the fibre of Thomason's hypercohomology spaces (S.4/sheaf-hypercohomology-spectrum applied to the associated presheaf of connective spectra where F is infinite-loop), which is how S.4's descent theorem is imported.
4. The Brown spectral sequence is imported in its Thomason form (S.4/hypercohomology-spectral-sequence).

**API.**

- `TauCeti.AlgebraicGeometry.SimplicialSheaf` (structure): Pointed simplicial sheaves on X_Zar with stalkwise weak equivalences and Brown–Gersten fibrations.
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper` (constructor): H^{−m}_Y(X, F) = [S^m_Y, K] for a fibrant replacement K of F.
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_map` (functoriality): Maps in Ho S_*(X) act on H^{−m}_Y; pullback along maps of pairs (X', Y') → (X, Y).
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_les` (structure): The long exact sequence of (X, Y, X − Y), natural in F.
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.brownSS` (structure): The Brown spectral sequence with its fringe effect.
- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_thomason` (compatibility): Agreement with Thomason's Godement hypercohomology of S.4 for sheaves of infinite loop spaces.

**Unit tests.**

- `hyper_point` (degenerate): For X = Spec k a point and Y = X, H^{−m}(X, F) = π_m(F).
- `hyper_empty_support` (degenerate): H^{−m}_∅(X, F) = 0.
- `hyper_discrete` (computation): For F the constant sheaf ℤ (discrete), H^0(X, F) = H^0(X, ℤ) and H^{−m} = 0 for m ≥ 1.
- `hyper_not_sections` (non-example): H^{−m}(X, F) is not π_mΓ(X, F) before fibrant replacement: for F the sheaf associated to U ↦ ℤ × BGL(Γ(U, O))^+ on a regular X, π_0Γ(X, F) need not see the classes of vector bundles that are not trivial on X, while H^0(X, F) = K_0(X) does.

**Acceptance.**

- For the constant sheaf of a discrete set, H^0 is its global sections.
- For X a point, H^{−m}(X, F) = π_m(F_x).

**Used by.**

- Soulé 1985, 4.2–4.3: K-theory with supports of a regular scheme as H^{−m}_Y(X, ℤ × BGL^+), and the operations as maps of simplicial sheaves
- Gillet–Soulé 1999, §§1–4: the λ-structure on H^{−m}(X, K) of K-coherent spaces
- S.6/adams-on-coniveau: operations act on the coniveau spectral sequence, which filters this hypercohomology by codimension of supports

**Depends on.** this roadmap: `S.4/sheaf-hypercohomology-spectrum`, `S.4/hypercohomology-spectral-sequence`; other roadmaps: `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`; libraries: `mathlib:HomotopicalAlgebra.ModelCategory`, `mathlib:SSet`, `mathlib:CategoryTheory.Sheaf`.

**Sources.**

- `Soule.1985`, 4.1 (p. 509): “Brown et Gersten ont montré ([9], Théorème 2) que S(X), munie des notions ci-dessus, est une catégorie à modèle fermé (“closed model category”) au sens de [26].” — The homotopy theory of simplicial sheaves; the definitions of equivalences and fibrations are on pp. 508–509.
- `Soule.1985`, Proof of Lemme 1 (p. 510): “D'après [8] si 𝒫 ∈ S(X) il existe une suite spectrale E_r^{pq}(𝒫) telle que E_2^{pq}(𝒫) = H^p_Y(X, π_{−q}𝒫) si p + q ≤ 0, et qui converge vers H_Y^{p+q}(X, 𝒫), avec un effet de frange (“fringe effect”) sur la diagonale p + q = 0.” — The Brown spectral sequence.

### K-theory with supports as hypercohomology of ℤ × BGL^+

`S.6/sheaf-level-k-theory-model` · comparison

Let X be a regular noetherian scheme of finite Krull dimension and Y ⊆ X closed. Let BGL_N^+ and BGL^+ = colim_N BGL_N^+ be the simplicial sheaves associated to U ↦ BGL_N(Γ(U, O_X))^+ and U ↦ BGL(Γ(U, O_X))^+ for a functorial plus construction (e.g. BGL_N(A)^+ = BGL_N(A) ∪_{BGL_N(ℤ)} BGL_N(ℤ)^+). Then K^Y_m(X) := K_m(X on Y) ≅ H_Y^{−m}(X, ℤ × BGL^+) for m ≥ 0, naturally in (X, Y), compatibly with forgetting supports and with the long exact sequences. Moreover the stabilisation map lim_N H^{−m}_Y(X, ℤ × BGL_N^+) → H^{−m}_Y(X, ℤ × BGL^+) is an isomorphism (Soulé's Lemme 1), and the class of a rank-N vector bundle E in K_0(X) is the image of the class of its classifying map N(𝒰) → BGL_N for a trivialising cover 𝒰.

**Hypotheses.**

- X regular noetherian of finite Krull dimension d (so that K = K^B, S.5/negative-k-vanishing-regular, and descent holds); Y closed.
- Stability for the K-theory of local rings (π_m BGL_N(R)^+ → π_m BGL(R)^+ bijective for N ≥ 2m + 1, R local; Suslin, 'Stability in algebraic K-theory') is cited: gap.

**Proof.**

1. Zariski descent: K(X on Y) ≃ H_Y(X; K) for the presheaf of K-theory spectra (S.4/zariski-descent, TT 10.3), X noetherian of finite Krull dimension; for X regular the nonconnective and connective theories agree (S.5/negative-k-vanishing-regular).
2. Stalks: for a local ring R, K_0(R) = ℤ (KTheoryLowDegrees Z.2/local-ring-k0) and ΩBQP(R) ≃ K_0(R) × BGL(R)^+ (GeneralAlgebraicKTheory K.2:plus/plus-equals-Q), so the zero-th spaces of the K-theory presheaf and ℤ × BGL^+ have the same stalks up to weak equivalence; the connective and zero-th space hypercohomology agree in degrees m ≥ 0 (S.6/simplicial-sheaf-hypercohomology).
3. Stabilisation (Lemme 1): compare the Brown spectral sequences E_2^{pq} = H^p_Y(X, π_{−q}(−)) for ℤ × BGL_N^+ and ℤ × BGL^+; by local stability (gap) they agree for N ≥ 2m + 1 in the relevant range since p ≤ d; injectivity and surjectivity follow, with the case m = 0 reduced to Y = X by the long exact sequence and handled by the classifying maps of bundles.
4. The class of E: the classifying map of a trivialising cover defines an element of [S^0 ∧ N(𝒰), ℤ × BGL_N^+] = H^0(X, ℤ × BGL_N^+) mapping to [E].

**Acceptance.**

- For X = Spec R regular local, K^X_m(X) = π_m(ℤ × BGL(R)^+) = K_m(R).
- For Y = ∅ both sides vanish.

**Depends on.** this roadmap: `S.4/zariski-descent`, `S.5/negative-k-vanishing-regular`, `S.6/simplicial-sheaf-hypercohomology`, `S.3/support-k-theory`, `S.3/localisation-fibre-sequence`; other roadmaps: `KTheoryLowDegrees:Z.2/local-ring-k0`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`.

**Sources.**

- `Soule.1985`, 4.2 (p. 509): “Si Y ⊂ X est une immersion fermée, la K-théorie de X à support dans Y: K^Y_m(X) = π_{m+1}(fibre(BQP(X) → BQP(X − Y))) (où BQP(X) est l'espace défini dans [25]) peut aussi se définir par K^Y_m(X) = H_Y^{−m}(X, Z × BGL^+).” — The comparison.
- `Soule.1985`, Lemme 1 (p. 510): “LEMME 1. Le morphisme de stabilisation lim_N H_Y^{−m}(X, Z × BGL_N^+) → H_Y^{−m}(X, Z × BGL^+) est un isomorphisme.” — Stabilisation, proved with the Brown spectral sequence and stability for local rings ('stabilité pour la K-théorie d'un anneau local, voir [33]').
- `Soule.1985`, Proof of Lemme 1 (p. 511): “La classe de l'application f définit un élément de [S^0 ∧ N(𝒰), Z × BGL_N^+] = H^0(X, Z × BGL_N^+) dont l'image dans K_0(X) est l'élément [E].” — The class of a bundle.

### λ-operations on the higher K-theory of regular schemes

`S.6/soule-scheme-operations` · construction · planet “λ-operations on higher K-theory”

Let X be a regular noetherian scheme of finite Krull dimension and Y ⊆ X closed. A representation ρ: GL_N → GL_M over ℤ induces a map of simplicial sheaves BGL_N → BGL_M, hence ρ: BGL_N → BGL^+; conjugate representations give the same class in [BGL_N, BGL^+], and the H-group structure of BGL^+ (direct sum; inverse in Ho S(X)) makes ρ ↦ ρ additive on exact sequences, giving R_ℤ(GL_N) → [ℤ × BGL_N^+, ℤ × BGL^+] and, by S.6/sheaf-level-k-theory-model, R_ℤ(GL) → End_Set(K^Y_m(X)). For a natural operation τ with τ(0) = 0, the element (τ(id_N − N))_N ∈ R_ℤ(GL) defines τ: K^Y_m(X) → K^Y_m(X) for all m ≥ 0: in particular λ^k, γ^k, ψ^k. The augmentation ε: K^Y_m(X) → H^0_Y(X, ℤ) is zero for m ≠ 0 and the rank for m = 0, and the tensor product defines the pairing μ: (ℤ × BGL^+) × (ℤ × BGL^+) → ℤ × BGL^+ in Ho S(X) and K^Y_m(X) × K^Y_n(X) → K^Y_{m+n}(X).

**Hypotheses.**

- X regular noetherian of finite Krull dimension; Y closed. For singular quasi-projective X over a regular base see S.6/singular-scheme-operations.
- The additivity of ρ ↦ ρ on non-split exact sequences uses the same input as S.6/representation-classifying-map (Quillen's homology isomorphism for block-triangular groups), applied stalkwise: gap.

**Proof.**

1. ρ induces strict maps of presheaves U ↦ BGL_N(Γ(U, O)) → BGL_M(Γ(U, O)), hence of sheaves; compose with BGL_M → BGL → BGL^+.
2. Conjugation by g ∈ GL_M(ℤ) induces a weak equivalence Int(g) of BGL^+ homotopic to the identity in Ho S(X) (stalkwise, conjugation acts trivially on homotopy of the H-space BGL(O_{X,x})^+), so the class depends only on the isomorphism class of ρ.
3. Additivity on exact sequences: stalkwise it is S.6/representation-classifying-map for the local rings O_{X,x}; a map in Ho S_*(X) is determined by stalks up to the equivalences (gap inherited from Quillen's theorem).
4. Stabilisation (S.6/sheaf-level-k-theory-model, Lemme 1) turns the compatible family into self-maps of K^Y_m(X); the operations on H^{−m}_Y(X, −) are functorial for maps in Ho S_*(X) (S.6/simplicial-sheaf-hypercohomology).
5. The pairing μ is induced by the tensor product of matrices GL_N × GL_M → GL_{NM} (Loday's construction, sheafified) and on homotopy agrees with the products of S.6/support-product-pairings (Riou Proposition 3.2.1 for X smooth over a regular base; in general by the comparison of the two constructions on stalks, recorded as part of the gap on product comparisons).

**API.**

- `TauCeti.AlgebraicGeometry.KTheory.lambdaOp` (constructor): τ: K^Y_m(X) → K^Y_m(X) for a natural operation τ with τ(0) = 0, X regular noetherian of finite dimension.
- `TauCeti.AlgebraicGeometry.KTheory.lambda` (constructor): λ^k on K^Y_m(X).
- `TauCeti.AlgebraicGeometry.KTheory.gamma` (constructor): γ^k on K^Y_m(X).
- `TauCeti.AlgebraicGeometry.KTheory.adams` (constructor): ψ^k on K^Y_m(X), k ∈ ℤ − {0} (ψ^{−1} the duality).
- `TauCeti.AlgebraicGeometry.KTheory.augmentation` (projection): ε: K^Y_m(X) → H^0_Y(X, ℤ), zero for m ≠ 0.
- `TauCeti.AlgebraicGeometry.KTheory.lambdaOp_affine` (compatibility): For X = Spec A regular, τ agrees with S.6/quillen-hiller-operations.
- `TauCeti.AlgebraicGeometry.KTheory.lambdaOp_zero` (compatibility): On K_0(X), λ^k[E] = [Λ^kE].

**Unit tests.**

- `adams_line_bundle` (computation): ψ^k[L] = [L^{⊗k}] in K_0(X) for a line bundle L.
- `lambda_empty_support` (degenerate): For Y = ∅ every operation is the zero map on K^∅_m(X) = 0.
- `lambdaOp_affine_compat` (compatibility): For X = Spec A regular, ψ^k on K_m(X) = K_m(A) is ψ^k of S.6/quillen-hiller-operations.
- `adams_units_scheme` (computation): For a unit u ∈ O(X)^× ⊆ K_1(X), ψ^k(u) = u^k.
- `lambda_not_objectwise` (non-example): λ² on K_1(X) is not induced by Λ² on automorphisms of vector bundles: for u ∈ O(X)^×, Λ² of the automorphism u of O_X is the identity of the zero bundle, while λ²(u) = u^{−1} ≠ 1 when u² ≠ 1.

**Acceptance.**

- On K_0(X) = K_0(Vect X) the operations are λ^k[E] = [Λ^kE] (S.6/degree-zero-comparison).
- For X = Spec A regular affine, they are the operations of S.6/quillen-hiller-operations.

**Used by.**

- EllipticKTheory E.4/adams-operations-and-the-weight-decomposition: ψ^k on K_n(X) of a regular curve and its weight decomposition
- MotivicEtaleKTheory M.4 and M.6b: the Adams operations compared with motivic cohomology and the filtered spectrum
- S.7/g-theory-adams-operations: Soulé's φ^k on G-theory are defined from ψ^k on K-theory with supports of a smooth ambient scheme
- Polylogarithms P.3/k-theory-comparison-weight-three: weights of K_*(F) for a field F (the affine case)

**Depends on.** this roadmap: `S.6/sheaf-level-k-theory-model`, `S.6/simplicial-sheaf-hypercohomology`, `S.6/representation-ring-of-gl`, `S.6/representation-classifying-map`, `S.6/support-product-pairings`.

**Sources.**

- `Soule.1985`, 4.3 (p. 511): “Si ρ: GL_N → GL_M est une représentation du schéma en groupes GL_N, elle induit un morphisme de faisceaux BGL_N → BGL_M et donc, en composant avec BGL_M → BGL → BGL^+, un morphisme ρ: BGL_N → BGL^+.” — The sheaf-level construction.
- `Soule.1985`, 4.3 (p. 512): “Une opération τ ∈ 𝒯 définit un élément (τ(id_N − N))_N ∈ R_Z(GL) et donc une application τ: K^Y_m(X) → K^Y_m(X).” — The operations on K-theory with supports.
- `GilletSoule.1999`, Theorem 3 (p. 46): “Theorem 3 Assume that X is a K-coherent space. Then H^0(X, K) is a λ-algebra with involution, augmented by ε. When m > 0, H^{−m}(X, K) is an H^0(X, K)-λ-module with involution.” — The same construction in Gillet–Soulé's generality of K-coherent spaces.

### K-theory with supports is an augmented K_0(X)-λ-algebra

`S.6/scheme-lambda-algebra` · theorem

For X regular noetherian of finite Krull dimension and Y ⊆ X closed, the operations of S.6/soule-scheme-operations make K^Y(X) = ⊕_{m≥0}K^Y_m(X), with zero product between elements of positive degree and the product K^Y_0(X) × K^Y_m(X) → K^Y_m(X), a (non-unital if Y ≠ X) special λ-ring with involution, augmented by ε: for Y = X it is a K_0(X)-λ-algebra (ℤ ⊕ K^Y(X) is a special λ-ring). Consequently, for m ≥ 1, λ^k is additive on K^Y_m(X), ψ^k = (−1)^{k−1}kλ^k there, ψ^kψ^l = ψ^{kl}, and the γ-filtration F^i_γK^Y_m(X) of S.6/gamma-filtration is defined, with ψ^k = k^i on gr^i_γ. For X = Spec A regular affine this is S.6/quillen-hiller-special-lambda.

**Hypotheses.**

- X regular noetherian of finite Krull dimension.

**Proof.**

1. Identities of special λ-rings for the operations on K^Y_m(X) are the images of the same identities in R_ℤ(GL_N) and R_ℤ(GL_N × GL_M) (S.6/serre-representation-ring-theorem) under the maps of S.6/soule-scheme-operations, as in the affine case (Soulé Proposition 4, 'La preuve est la même que dans le cas affine').
2. Gillet–Soulé's proof of their Theorem 3 carries this out: the identity λ^k(α + β) = λ^k(α) + λ^k(β) for α, β ∈ H^{−m}(X, K), m > 0, and the composition formula (19) are checked on [X, ℤ_∞BGL] through the power series λ_t(id_M − M) ∈ 1 + tR_ℤ(GL_M)[[t]] and the elements α(ρ, x) (their (20)–(22)).
3. The consequences are S.6/adams-additivity-square-zero, S.6/adams-multiplicative-composition and S.6/adams-eigenvalue-on-gamma-graded applied to ℤ ⊕ K^Y(X).

**Acceptance.**

- On K_1(X), ψ²(x) = −2λ²(x).
- For Y = X = Spec A regular, K(A) = ⊕K_m(A) is the λ-ring of S.6/quillen-hiller-special-lambda.

**Depends on.** this roadmap: `S.6/soule-scheme-operations`, `S.6/serre-representation-ring-theorem`, `S.6/adams-additivity-square-zero`, `S.6/adams-multiplicative-composition`, `S.6/adams-eigenvalue-on-gamma-graded`, `S.6/gamma-filtration`.

**Sources.**

- `Soule.1985`, Proposition 4 (p. 512): “PROPOSITION 4. Les groupes K^Y_m(X), munis des notions ci-dessus, sont des K^Y_0(X) − λ-algèbres augmentées avec involution.” — The statement, followed by 'La preuve est la même que dans le cas affine … et consiste à traduire sur K^Y_m(X) des identités vraies sur R_Z(GL)'.
- `GilletSoule.1999`, Proof of Theorem 3 (p. 46): “The idea is to translate the identities in R_Z(GL_N) which express that this is an augmented λ-ring with involution into identities in H^{−m}(X, K).” — The method of proof, carried out in formulas (19)–(22).

### Naturality of the operations

`S.6/operations-functoriality` · lemma

The operations τ of S.6/soule-scheme-operations commute with: (a) pullback f^*: K^Y_m(X) → K^{f^{−1}Y}_m(X') for every morphism f: X' → X of regular noetherian schemes of finite Krull dimension; (b) forgetting supports K^Y_m(X) → K^{Y'}_m(X) for Y ⊆ Y', and restriction to open subschemes; (c) the localisation boundary ∂: K_{m+1}(X − Y) → K^Y_m(X) of S.3/localisation-boundary, for m ≥ 0 (τ∂ = ∂τ into K-theory with supports); (d) for X = Spec A, with the operations of S.6/quillen-hiller-operations. They need not commute with the dévissage isomorphism j_*: K_m(Z) → K^Z_m(X) for a regular closed immersion: that comparison is S.6/riemann-roch-without-denominators, and the combination of (c) with it is S.6/residue-weight-shift.

**Hypotheses.**

- X, X' regular noetherian of finite Krull dimension; in (c) the boundary is the one into support K-theory, not into K_m(Y).

**Proof.**

1. (a): f^{−1} of the simplicial sheaves ℤ × BGL_N^+ on X maps to those on X' compatibly with the maps induced by representations (they are defined by the same ring-theoretic formulas), and pullback on hypercohomology (S.6/simplicial-sheaf-hypercohomology) is natural in the coefficient sheaf.
2. (b): forgetting supports and restriction are maps of pairs, natural in the coefficient sheaf.
3. (c): ∂ is the boundary of the homotopy sequence of the fibration Γ_Y(X, K) → Γ(X, K) → Γ(X − Y, K) for a fibrant K; a map of pointed sheaves K → K' (here a representative of τ) induces a map of these fibration sequences, and boundary maps of homotopy sequences are natural (StableHomotopyKTheory H.2/homotopy-fibre-and-long-exact-sequence); this requires no H-space property of τ. The identification with S.3's boundary is S.6/sheaf-level-k-theory-model.
4. (d): Soulé, end of 4.3: on a regular affine scheme the sheaf-level operations restrict to the ring-level ones (both come from r: R_ℤ(GL) → [BGL(A)^+, BGL(A)^+], and H^{−m}(Spec A, ℤ × BGL^+) = π_m(ℤ × BGL(A)^+) for the global sections of the fibrant replacement, A regular).

**Acceptance.**

- ψ^k commutes with restriction K_1(X) → K_1(k(η)) to the generic point of an integral regular X.
- For a DVR O with fraction field L, τ commutes with ∂: K_1(L) → K^{closed}_0(O).

**Depends on.** this roadmap: `S.6/soule-scheme-operations`, `S.6/simplicial-sheaf-hypercohomology`, `S.6/sheaf-level-k-theory-model`, `S.3/localisation-boundary`, `S.6/quillen-hiller-operations`, `S.2/k-theory-pullback`; other roadmaps: `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.**

- `Soule.1985`, Theorem 7, proof step 4 (p. 536): “En effet f_* consiste à restreindre le support: f_*: H_X^{−m}(M, Z × BGL^+) → H_Y^{−m}(M, Z × BGL^+), donc l'action de tout élément τ ∈ 𝒯 commute à f_*.” — Part (b): changing supports is a map on hypercohomology natural in the coefficients, so every operation commutes with it.
- `Soule.1985`, Proposition 4 (p. 512): “Si X = Spec(A) est un schéma affine régulier, la λ-structure sur K^X_m(X) = K_m(A) définie ici est la même que celle définie dans la Section 1.” — Part (d).

### The degree-zero operations are the classical ones

`S.6/degree-zero-comparison` · comparison

Let X be a regular noetherian scheme of finite Krull dimension with an ample family of line bundles (e.g. quasi-projective over a regular ring), so that K_0(X) = K_0(Vect X) (S.2/vector-bundle-k-theory-comparison). Then the operations of S.6/soule-scheme-operations on K_0(X) = H^0(X, ℤ × BGL^+) are those of S.6/vector-bundle-lambda-ring: λ^k[E] = [Λ^kE], the augmentation is the rank, and ψ^k[L] = [L^{⊗k}] for line bundles. For X = Spec A (A regular) they are KTheoryLowDegrees Z.3's operations: λ^k = Z.3/lambda, γ^k = Z.3/gamma, the augmentation ideal is Z.3/augmentation and the γ-filtration is Z.3/gamma-filtration, and the determinant det: K_0(A) → Pic(A) of Z.3/determinant-hom equals λ^r on classes of constant rank r and induces F^1_γ/F^2_γ ≅ Pic(A) (S.7/gamma-first-graded-pieces). For arbitrary commutative A (not necessarily regular), the degree-zero part of S.6/quillen-hiller-operations is again Z.3/lambda.

**Hypotheses.**

- X regular noetherian of finite Krull dimension with an ample family (so that every class in K_0(X) is a difference of bundle classes); A commutative for the ring statement.

**Proof.**

1. The class of a rank-N bundle E is the image of its classifying map N(𝒰) → BGL_N (S.6/sheaf-level-k-theory-model), and the operation defined by σ ∈ R_ℤ(GL_N) sends it to the class of the classifying map of σ(E), i.e. to [σ(E)] (S.6/vector-bundle-lambda-ring). For σ = Λ^k(id_N) this is [Λ^kE].
2. Differences of bundle classes: both structures are pre-λ-structures agreeing on bundle classes, hence equal (λ_t is additive).
3. Affine case: Z.3/lambda is defined by λ^k[P] = [Λ^kP] (Z.3/lambda-of), γ^k from λ^k by the same formula (Z.3/gamma), and the augmentation by the rank of Z.2 (Z.3/augmentation), so S.6/gamma-filtration and Z.3/gamma-filtration have the same generators.
4. Determinant: for p = [P] of constant rank r, det(P) = Λ^rP = λ^r(p) (Z.3/determinant-hom and KTheoryLowDegrees Z.3/constant-rank-top-invertible).

**Acceptance.**

- For X = P^1_k and x = 1 − [O(−1)]: ψ^k(x) = 1 − [O(−k)] = kx in K_0(P^1_k), since x² = 0.
- For A a Dedekind domain with ideal class [I], ψ^k([I] − 1) = [I^{⊗k}] − 1 = k([I] − 1) because ([I] − 1)² = 0 in K_0(A).

**Depends on.** this roadmap: `S.6/soule-scheme-operations`, `S.6/vector-bundle-lambda-ring`, `S.6/sheaf-level-k-theory-model`, `S.2/vector-bundle-k-theory-comparison`, `S.6/quillen-hiller-operations`; other roadmaps: `KTheoryLowDegrees:Z.3/lambda`, `KTheoryLowDegrees:Z.3/lambda-of`, `KTheoryLowDegrees:Z.3/gamma`, `KTheoryLowDegrees:Z.3/augmentation`, `KTheoryLowDegrees:Z.3/gamma-filtration`, `KTheoryLowDegrees:Z.3/determinant-hom`, `KTheoryLowDegrees:Z.3/constant-rank-top-invertible`.

**Sources.**

- `Soule.1985`, Proof of Lemme 1 (p. 511): “La classe de l'application f définit un élément de [S^0 ∧ N(𝒰), Z × BGL_N^+] = H^0(X, Z × BGL_N^+) dont l'image dans K_0(X) est l'élément [E].” — Bundles in the sheaf model, whence the value of the operations in degree zero.
- `Kbook.2013`, Example II.4.1.2 (PDF p. 98): “Let R be a commutative ring and set K = K0(R). If P is a ﬁnitely generated projective R-module, consider the formula λk(P) = [∧kP].” — The classical degree-zero normalisation Z.3 implements.

### Operations on the K-theory of singular quasi-projective schemes

`S.6/singular-scheme-operations` · construction

Let S be a regular noetherian scheme of finite Krull dimension and 𝒱_S the category of quasi-projective S-schemes (possibly singular). For X ∈ 𝒱_S, K_m(X) (Quillen K-theory of vector bundles) is the colimit of K_m(M) over the category of morphisms X → M in 𝒱_S with M smooth over S, and the operations τ of S.6/soule-scheme-operations on the K_m(M) induce operations on K_m(X), making K_m(X) a nilpotent augmented K_0(X)-λ-algebra with involution, compatible with pullback along morphisms of 𝒱_S. Nilpotent means: for each x there is N_x with γ^{i_1}(x − ε(x))⋯γ^{i_a}(x − ε(x)) = 0 whenever i_1 + ⋯ + i_a ≥ N_x. Whether the γ-filtration of K_m(X) is finite for singular X is left open by the source and not claimed.

**Hypotheses.**

- S regular noetherian of finite Krull dimension; X quasi-projective over S; K is the K-theory of vector bundles (for singular X it differs from G-theory and from homotopy K-theory).

**Proof.**

1. Every exact sequence of bundles on X is pulled back from one on a smooth M ∈ 𝒱_S through an embedding, and two bundles on smooth M with isomorphic pullbacks become isomorphic on some smooth M' → M through which X → M factors (Fulton, 'Rational equivalence on singular varieties', 3.2 Lemma, cited by Soulé; not read: gap).
2. Hence QP(X) = colim_𝒞 QP(M) over the category 𝒞 of maps X → M with M smooth over S, and K_m(X) = colim_𝒞 K_m(M) (K-theory commutes with filtered colimits of exact categories: GeneralAlgebraicKTheory K.7/invariance-products-and-colimits; 𝒞 is filtered by the factorisation property).
3. The operations on K_m(M) commute with pullback (S.6/operations-functoriality), so they induce operations on the colimit with the same identities (S.6/scheme-lambda-algebra).
4. Nilpotence: each x comes from some M of finite dimension, where the γ-filtration is finite (S.6/scheme-gamma-bound).

**API.**

- `TauCeti.AlgebraicGeometry.KTheory.singularLambdaOp` (constructor): τ on K_m(X) for X quasi-projective over a regular base, via smooth embeddings.
- `TauCeti.AlgebraicGeometry.KTheory.singularLambdaOp_smooth` (compatibility): Agrees with S.6/soule-scheme-operations when X is smooth over S.
- `TauCeti.AlgebraicGeometry.KTheory.singularLambdaOp_pullback` (functoriality): Commutes with f^* for morphisms of 𝒱_S.
- `TauCeti.AlgebraicGeometry.KTheory.singular_lambda_nilpotent` (structure): K_m(X) is a nilpotent augmented K_0(X)-λ-algebra.

**Unit tests.**

- `singularLambdaOp_smooth` (degenerate): For X smooth over S the operations are those of S.6/soule-scheme-operations.
- `singular_dual_numbers` (computation): On K_1(k[ε]/(ε²)) ⊇ 1 + kε: ψ^k(1 + aε) = 1 + kaε (a unit, S.6/adams-on-units-and-products).
- `singular_not_G_theory` (non-example): The operations are on K, not on G: for X = Spec k[ε]/(ε²), K_0(X) = ℤ = G_0(X) but the Cartan map is multiplication by 2 (S.2/cartan-singular-non-example), so ψ^k on K_0 does not induce a λ-structure on G_0 through the Cartan map.
- `singularLambdaOp_affine_compat` (compatibility): For X = Spec A affine of finite type over S, the operations agree with S.6/quillen-hiller-operations (both commute with pullback from smooth ambient affine schemes).

**Acceptance.**

- For X smooth over S the construction agrees with S.6/soule-scheme-operations (X → X is final in 𝒞).
- For X = Spec k[ε]/(ε²) over S = Spec k, K_1(X) = (k[ε]/ε²)^× ⊇ 1 + kε, and ψ^k(1 + aε) = (1 + aε)^k = 1 + kaε.

**Used by.**

- S.5 stage text ('For singular schemes distinguish ordinary K-theory and homotopy K-theory'): operations on ordinary K-theory of singular schemes, without passing to KH
- S.7/g-theory-adams-operations: the cap product with K_*(X) of a singular X in Soulé's Théorème 7 iv)
- KTheoryFiniteLocalFields L.1/adams-psi-p-frobenius: ψ^p = Frobenius for non-regular 𝔽_p-algebras (affine case)

**Depends on.** this roadmap: `S.6/soule-scheme-operations`, `S.6/scheme-lambda-algebra`, `S.6/operations-functoriality`, `S.6/scheme-gamma-bound`; other roadmaps: `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`.

**Sources.**

- `Soule.1985`, Proposition 7 (p. 528): “PROPOSITION 7. Pour tout schéma X de 𝒱_S, tout entier m ≥ 0 et tout élément τ ∈ 𝒯, on peut définir une action de τ sur K_m(X) et une structure de K_0(X) − λ-algèbre augmentée, à involution, et nilpotente sur K_m(X), qui est compatible aux morphismes f^* induits par les morphismes de 𝒱_S.” — The statement; the proof writes QP(X) = lim QP(M) over smooth M.
- `Soule.1985`, Remarque after Proposition 7 (p. 529): “Remarque. Je ne sais pas si la γ-filtration de K_m(X) est finie.” — Finiteness for singular X is open in the source.

### Adams operations on schemes are multiplicative

`S.6/scheme-adams-multiplicative` · theorem

For X regular noetherian of finite Krull dimension and closed Y, Z ⊆ X, the Adams operations satisfy ψ^k(x·y) = ψ^k(x)·ψ^k(y) for x ∈ K^Y_m(X), y ∈ K^Z_n(X) and the product of S.6/support-product-pairings (not the zero product of the λ-structure), and ψ^k(x ⊠ y) = ψ^k(x) ⊠ ψ^k(y) for external products. Hence K_*(X)_ℚ is bigraded by weight: K^{(i)}_m(X)_ℚ · K^{(j)}_n(X)_ℚ ⊆ K^{(i+j)}_{m+n}(X)_ℚ.

**Hypotheses.**

- X regular noetherian of finite Krull dimension; the product is Waldhausen's (TT 3.15), identified with the sheaf-level tensor product pairing μ of S.6/soule-scheme-operations.

**Proof.**

1. Stalkwise the statement is S.6/adams-product-compatibility for the local rings O_{X,x}: the tensor-product pairing (ℤ × BGL^+) ∧ (ℤ × BGL^+) → ℤ × BGL^+ commutes with ψ^k ∧ ψ^k up to homotopy on stalks, via Hiller's universality applied to R(GL_m × GL_n) (S.6/hiller-universality).
2. A diagram in Ho S_*(X) commuting on stalks up to homotopy need not commute globally; Gillet–Soulé check the compatibility on H^{−*}(X, K) 'as in [Kr]' — cited, and the passage from stalks to global hypercohomology is recorded as part of the gap on sheaf-level products.
3. Weights: multiplicativity and S.6/scheme-weight-decomposition.

**Acceptance.**

- For units u, v ∈ O(X)^×, ψ^k(u·v) = k²(u·v) in K_2(X).
- ψ^k([L]·x) = [L^{⊗k}]·ψ^k(x) for x ∈ K_m(X).

**Depends on.** this roadmap: `S.6/soule-scheme-operations`, `S.6/adams-product-compatibility`, `S.6/hiller-universality`, `S.6/support-product-pairings`, `S.6/external-product`.

**Sources.**

- `GilletSoule.1999`, 4.1, after Theorem 3 (p. 48): “One checks as in [Kr] that ψ^k respects the additive and multiplicative structures of H^{−*}(X, K), (note that here we mean the standard multiplicative structure, not the structure in which H^{−*}(X, K) for ∗ > 0 is a square zero ideal).” — The statement for the actual product.
- `Soule.1985`, Théorème 7 v) (p. 533): “φ^k(α ⊠ β) = φ^k(α) ⊠ φ^k(β), F_j ⊠ F_{j'} ⊂ F_{j+j'},” — The external-product compatibility in Soulé's G-theory version, which rests on ψ^k(α ⊠ β) = ψ^k(α) ⊠ ψ^k(β) (proof of Théorème 7, step 2).

### Length of the γ-filtration on the K-theory of a regular scheme

`S.6/scheme-gamma-bound` · theorem

Let X be a regular noetherian scheme of Krull dimension d and Y ⊆ X closed. Then γ^k(x) = 0 for x ∈ K^Y_m(X) if m ≥ 2 and k ≥ m + d + 1, or m = 1 and k ≥ d + 3; and F^{d+1}_γK_0(X) = 0. If X is moreover of finite type over a field, F^{m+d+1}_γK_m(X) = 0 for all m ≥ 0.

**Hypotheses.**

- X regular noetherian of Krull dimension d.
- The K_0 statement is quoted from SGA 6 (VI 6.6; Fulton–Lang V.3.10), not public: gap; for X of finite type over a field it follows from S.7/gamma-in-coniveau, which is not used here to avoid an S.6 → S.7 dependency.

**Proof.**

1. Volodin sheaves V_N, V associated to U ↦ V_N(Γ(U, O_X)): the proof of S.6/soule-gamma-bound (ii) gives a cartesian square and ΩBGL^+ ≃ V (Soulé 2.4, Suslin), and K^Y_{m,N}(X) := H_Y^{−m+1}(X, V_N) → K^Y_m(X).
2. Brown spectral sequences for V_N → V, with the stalkwise surjective stability of π_{−q}(V_N) → π_{−q}(V) for N ≥ −q (bijective for N ≥ −q + 1) — cited (gap), with the fringe effect on p + q = 0 — show K^Y_{m,N}(X) → K^Y_m(X) surjective for m ≥ 2, N ≥ m + d, and for m = 1, N ≥ d + 2 (Mayer–Vietoris over affine covers, S.4/zariski-mayer-vietoris).
3. γ^k(id_N − N) = 0 in R_ℤ(GL_N) for k > N, and the operations are compatible with the Volodin model (S.6/soule-gamma-bound), so γ^k vanishes on the image.
4. For X of finite type over a field: Gillet–Soulé 5.4 (consequence of their Theorem 4 iii).

**Acceptance.**

- For X = Spec of a DVR (d = 1): γ^k = 0 on K_m for k ≥ m + 2 (m ≥ 2).
- For a regular curve X, F^2_γK_0(X) = 0, so K_0(X) = H^0(X, ℤ) ⊕ Pic(X).

**Depends on.** this roadmap: `S.6/soule-gamma-bound`, `S.6/scheme-lambda-algebra`, `S.6/simplicial-sheaf-hypercohomology`, `S.4/zariski-mayer-vietoris`, `S.6/representation-ring-of-gl`.

**Sources.**

- `Soule.1985`, Proof of Proposition 5 (p. 514): “Ce qui précède montre que γ^k(x) = 0 si x ∈ K^Y_m(X), m ≥ 2 et k ≥ m + d + 1 (resp. m = 1 et k ≥ d + 3). D'après [14] F_γ^{d+1}K_0(X) = 0.” — The bounds, with the K_0 bound cited to SGA 6 [14].
- `GilletSoule.1999`, 5.4 (p. 52): “5.4. A consequence of Theorem 4 iii) is that if X is a scheme of finite type over a field and of dimension d F_γ^{m+d+1} K_m(X) = 0.” — The bound over a field.

### Adams weight decomposition of the K-theory of a regular scheme

`S.6/scheme-weight-decomposition` · theorem · planet “Adams weight decomposition”

Let X be a regular noetherian scheme of Krull dimension d and Y ⊆ X closed. (1) For m ≥ 0, K^Y_m(X)_ℚ = ⊕_{i=α}^{m+d} K^Y_m(X)^{(i)}_ℚ, where K^{(i)} is the subgroup on which ψ^k = k^i for every k ≠ 0, α = 0 for m = 0, α = 1 for m = 1 and α = 2 for m ≥ 2; K^{(i)}_ℚ ≅ gr^i_γK^Y_m(X)_ℚ. (2) Low weights: K_1(X)^{(1)}_ℚ = Γ(X, O_X^×) ⊗ ℚ, K_0(X)^{(0)}_ℚ = H^0(X, ℚ), K_0(X)^{(1)}_ℚ = Pic(X) ⊗ ℚ. (3) Integrally (Soulé): F^2_γK^Y_m(X) = ⊕_{i=2}^{m+d}K^Y_m(X)^{(i)} modulo 𝒮_{m+d} (m ≥ 2), F^2_γK^Y_1(X) = ⊕_{i=2}^{d+2}F^2_γK^Y_1(X)^{(i)} modulo 𝒮_{d+2}, F^2_γK_0(X) = ⊕_{i=2}^{d}F^2_γK_0(X)^{(i)} modulo 𝒮_d. (4) Projectors: with k = 2 and weights a ≤ i ≤ N = m + d, π_i = ∏_{j≠i}(ψ² − 2^j)/(2^i − 2^j) is the projection to weight i on K_m(X)_ℚ; its denominator ∏_{j≠i}(2^i − 2^j) is recorded (for d = 1, m = 1 the weights are 1, 2 and π_1 = −(ψ² − 4)/2, π_2 = (ψ² − 2)/2). The decomposition is compatible with pullback, with products (weights add) and with forgetting supports.

**Hypotheses.**

- X regular noetherian of Krull dimension d; the rational statement is Gillet–Soulé's Proposition 8 for K-coherent spaces of dimension ≤ d, and the integral one Soulé's Proposition 5.
- The weight range is an upper bound; the Beilinson–Soulé vanishing of low weights is not claimed.

**Proof.**

1. By S.6/scheme-gamma-bound, F^{N+1}_γK^Y_m(X) = 0 with N = m + d (m ≥ 2), N = d + 2 for m = 1 (improved to d + 1 rationally, see the next step), N = d for m = 0; F^1_γ = K^Y_m for m ≥ 1 and Kratzer's F^2_γ = K^Y_m for m ≥ 2 holds stalkwise (S.6/kratzer-low-gamma) and hence globally by the Brown spectral sequence (Gillet–Soulé Proposition 8 proof).
2. Apply S.6/rational-weight-decomposition to J = K^Y_m(X) inside the λ-ring ℤ ⊕ K^Y(X) (S.6/scheme-lambda-algebra): this gives (1) and (4); the rational range for m = 1 is 1 ≤ i ≤ d + 1 by Gillet–Soulé's product-of-factors argument (their (25)) using ψ^k = k on K_1 of local rings.
3. (2): Gillet–Soulé Proposition 8 ii), from the Brown spectral sequence and K_1(O_{X,x}) = O_{X,x}^× (local rings, KTheoryLowDegrees U.3/SK1-local) and Pic via S.7's first graded pieces in the λ-ring K_0.
4. (3): the integral argument of S.6/affine-weight-decomposition with the operators Φ_i and the constants w_i.
5. Compatibilities from S.6/operations-functoriality and S.6/scheme-adams-multiplicative.

**Acceptance.**

- For X = P^1_k (d = 1): K_0(P^1)_ℚ = K^{(0)} ⊕ K^{(1)} with K^{(1)} = ℚ·(1 − [O(−1)]).
- For a regular curve over a field: K_1(X)_ℚ = K_1^{(1)} ⊕ K_1^{(2)} with K_1^{(1)} = O(X)^× ⊗ ℚ (EllipticKTheory E.4).

**Depends on.** this roadmap: `S.6/scheme-gamma-bound`, `S.6/rational-weight-decomposition`, `S.6/scheme-lambda-algebra`, `S.6/kratzer-low-gamma`, `S.6/affine-weight-decomposition`, `S.6/operations-functoriality`, `S.6/scheme-adams-multiplicative`; other roadmaps: `KTheoryLowDegrees:U.3/SK1-local`.

**Sources.**

- `GilletSoule.1999`, Proposition 8 (p. 48): “i) For any m ≥ 0, there is a decomposition H^{−m}(X, K) ⊗ Q = ⊕_{i=α}^{m+d} H^{−m}(X, K)^{(i)} ⊗ Q, where α = 2 if m ≥ 2, α = 1 if m = 1, and α = 0 if m = 0;” — Part (1); part ii) of the proposition gives (2).
- `Soule.1985`, Proposition 5 (p. 513): “PROPOSITION 5. Si d = dim(X) et m ≥ 2 on a F^2_γK^Y_m(X) = ⊕_{i=2}^{m+d} K^Y_m(X)^{(i)} (mod 𝒮_{m+d}).” — Part (3), with the K_1 and K_0 cases on the same page.

### Weight decomposition with finite coefficients

`S.6/finite-coefficient-weight-decomposition` · theorem

Let X be a regular noetherian scheme of Krull dimension d, m ≥ 1, and ℓ an odd prime with ℓ > m + d + 1. The Adams operations act on K_m(X; ℤ/ℓ^ν) (mod ℓ^ν homotopy of the sheaf model, StableHomotopyKTheory H.6), additively for m ≥ 2, compatibly with the Bockstein sequence 0 → K_m(X)/ℓ^ν → K_m(X; ℤ/ℓ^ν) → K_{m−1}(X)[ℓ^ν] → 0. For a primitive root k modulo ℓ, the elements k^i (0 ≤ i ≤ m + d) are distinct modulo ℓ, and K_m(X; ℤ/ℓ^ν) = ⊕_{i} K_m(X; ℤ/ℓ^ν)^{(i)}, where the summand of weight i is the generalised eigenspace ker(ψ^k − k^i)^2, independent of the choice of k; it contains the images of (K_m(X)_{(ℓ)})^{(i)}/ℓ^ν and maps onto K_{m−1}(X)^{(i)}[ℓ^ν]. The projectors are the Chinese-remainder idempotents of ℤ/ℓ^ν[T]/∏_i(T − k^i)^2, defined over ℤ/ℓ^ν because the differences k^i − k^j are units.

**Hypotheses.**

- ℓ odd, ℓ > m + d + 1 (so ℓ ∉ 𝒮_{m+d+1} and a primitive root separates the weights); m ≥ 1 (for m = 1 the mod-ℓ group is π_1 of a Moore-space mapping set, a group via the H-space structure).
- This node is a deduction from the cited integral results; no source read states it with finite coefficients.

**Proof.**

1. Mod ℓ^ν homotopy: K_m(X; ℤ/ℓ^ν) = [P^m(ℓ^ν), K] for the Moore space P^m(ℓ^ν) and a fibrant model K of ℤ × BGL^+ (S.6/sheaf-level-k-theory-model); the cofibre sequence S^{m−1} → P^m(ℓ^ν) → S^m gives the Bockstein sequence (StableHomotopyKTheory H.6/mod-l-homotopy-and-bockstein-sequence).
2. Operations are maps of simplicial sheaves (S.6/soule-scheme-operations), so they act on [P^m(ℓ^ν), K] compatibly with the Bockstein maps; for m ≥ 2, P^m(ℓ^ν) is a suspension, products vanish and ψ^k = (−1)^{k−1}kλ^k is additive (the λ-ring structure on K_0 × [P, BGL^+] of S.6/quillen-hiller-special-lambda, sheafified in S.6/scheme-lambda-algebra).
3. By S.6/scheme-weight-decomposition (3), K_m(X) ⊗ ℤ_{(ℓ)} and K_{m−1}(X) ⊗ ℤ_{(ℓ)} decompose integrally into ψ^k-eigenspaces of weights in [0, m + d] (ℓ ∉ 𝒮_{m+d} and ℓ is odd); hence ∏_i(ψ^k − k^i) kills the two ends of the Bockstein sequence and ∏_i(ψ^k − k^i)^2 kills K_m(X; ℤ/ℓ^ν).
4. Chinese remainder theorem over ℤ/ℓ^ν for the pairwise coprime (T − k^i)^2 gives the decomposition; independence of k because the ψ^k commute (S.6/adams-multiplicative-composition).

**Acceptance.**

- For X = Spec 𝔽_q (d = 0) and ℓ ∤ q, ℓ > 2i + 1: K_{2i−1}(𝔽_q; ℤ/ℓ^ν) has weight i (ψ^k = k^i, KTheoryFiniteLocalFields L.1/adams-on-finite-field-k).
- For a regular curve over F with ℓ ∤ char F and ℓ > m + 2, K_m(X; ℤ/ℓ^ν) splits into weights 1, …, m + 1 (EllipticKTheory E.4's condition).

**Depends on.** this roadmap: `S.6/scheme-weight-decomposition`, `S.6/soule-scheme-operations`, `S.6/sheaf-level-k-theory-model`, `S.6/scheme-lambda-algebra`, `S.6/adams-multiplicative-composition`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `Soule.1985`, 2.7 (p. 498): “Si n ≥ 1 est un entier, la catégorie 𝒮_n est formée des groupes X tels qu'il existe un entier m avec: mx = 0 si x ∈ X si p est un nombre premier divisant m on a p = 2 ou p < n.” — The Serre classes controlling the primes ℓ for which the integral decomposition, hence this one, holds.
- `Soule.1985`, 2.7 (p. 498): “Remarquons que X = Y (mod 𝒮_n), n ≥ 3, implique X ⊗ Z[1/(n − 1)!] ≃ Y ⊗ Z[1/(n − 1)!].” — The localisation used in the third step.

### Uniqueness of operations on the K-theory of smooth schemes (Riou)

`S.6/riou-motivic-uniqueness` · comparison

Let S be a regular (noetherian, separated) scheme. For X ∈ Sm/S there is a canonical isomorphism Hom_{H•(S)}(S^n ∧ X_+, ℤ × Gr) ≅ K_n(X) (Morel–Voevodsky), and the induced map End_{H(S)}(ℤ × Gr) → End(K_0(−)) (natural transformations of presheaves of sets on Sm/S) is a bijection. Hence every natural operation on K_0 of smooth S-schemes extends uniquely to a natural operation on K_n of smooth S-schemes, for all n, and the operations of S.6/soule-scheme-operations restricted to Sm/S are these extensions (for elements of R_ℤ(GL) of rank zero acting on K_n, n ≥ 1). The same holds for operations in several variables, so the products of S.6/graded-commutative-ring on Sm/S are determined by the product on K_0 (Riou, Proposition 3.2.1: Waldhausen's pairing).

**Hypotheses.**

- S regular; X smooth and separated of finite type over S. The A¹-homotopy category H(S) and the representability theorem are not planned by any stage upstream of S.6 (MotivicEtaleKTheory M.5a is downstream): recorded as a gap.

**Proof.**

1. Representability of K-theory in H•(S) (Morel–Voevodsky, Riou Theorem 0.1): gap; it uses Nisnevich descent (S.4/nisnevich-descent) and homotopy invariance for regular schemes (S.5/homotopy-invariance-regular).
2. Bijectivity (Riou Theorem 0.2) via the Grassmannians Gr_{d,r} and the vanishing of lim¹ terms (Riou §1.2): cited.
3. Comparison with Soulé's operations (Riou Theorem 3.3.2): both factor through the universal special λ-rings Univ_d ≅ R_ℤ(GL_d) (S.6/serre-representation-ring-theorem) mapping to K_0(Gr_{d,∞}); cited.

**Acceptance.**

- The Adams operations ψ^k on K_n(X), X smooth over S, are determined by ψ^k on K_0 of smooth S-schemes.
- For S = Spec k and X = Spec k, the uniqueness recovers ψ^k on K_n(k) from its values on K_0 of Grassmannians.

**Depends on.** this roadmap: `S.6/soule-scheme-operations`, `S.6/serre-representation-ring-theorem`, `S.4/nisnevich-descent`, `S.5/homotopy-invariance-regular`, `S.6/graded-commutative-ring`.

**Sources.**

- `Riou.2009`, Theorem 0.2 (p. 2): “Theorem 0.2 Let S be a regular scheme. We let K_0(−) be the presheaf of sets on Sm/S which maps X to K_0(X). Then, the map induced by theorem 0.1 is a bijection:” — The uniqueness statement; the displayed bijection is End_{H(S)}(Z × Gr) ≅ End_{Sm/S^opp Sets}(K_0(−)).
- `Riou.2009`, 3.3 (p. 13): “In his article [42], Soulé defined an action of R_Z GL = lim R_Z GL_d on the higher algebraic K-theory of schemes, where R_Z GL_d is the Grothendieck group defined by Serre [39].” — The comparison with Soulé's operations, Theorem 3.3.2.

### The Bott cannibalistic class θ^k

`S.6/bott-cannibalistic-class` · definition

Let R be a special λ-ring and N ∈ R an element of rank p ≥ 0 (λ^j(N) = 0 for j > p and ε(N) = p), e.g. the class of a vector bundle of rank p. For k ≥ 1, θ^k(N) := Θ_k(λ^1N, …, λ^pN), where Θ_k is the unique integer polynomial with Θ_k(e_1(ξ), …, e_p(ξ)) = ∏_{i=1}^{p}(1 + ξ_i + ξ_i² + ⋯ + ξ_i^{k−1}) in ℤ[ξ_1,…,ξ_p]. Equivalently θ^k is the multiplicative operation with θ^k(L) = 1 + L + ⋯ + L^{k−1} for line elements. It satisfies θ^k(N + N') = θ^k(N)θ^k(N'), θ^{kk'}(N) = ψ^k(θ^{k'}(N))θ^k(N), ε(θ^k(N)) = k^p, and θ^k(N) − k^p ∈ F^1_γR. If R carries an involution with L^∨ = L^{−1} on line elements, θ^{−1}(N) = (−1)^pλ^p(ψ^{−1}(N)) and θ^{−k}(N) = ψ^k(θ^{−1}(N))θ^k(N). If the augmentation ideal is a nil ideal and every element is a difference of finite-rank elements, θ^k extends to an exponential map on K_0 with values in K_0 ⊗ ℤ[1/k]; without the nil condition it does not (in ℤ[u^{±1}], θ²(u) = 1 + u is not a unit of ℤ[1/2][u^{±1}]).

**Hypotheses.**

- R a special λ-ring; N of finite rank p (positive element); the extension to virtual elements inverts k (θ^k(−N) = θ^k(N)^{−1} needs ε(θ^k N) = k^p invertible).

**Proof.**

1. Θ_k exists by the fundamental theorem of symmetric polynomials (tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm).
2. Multiplicativity and the composition formula are identities in λ^•(N), λ^•(N') for positive elements of fixed rank, checked on sums of line elements by S.6/lambda-identity-principle (fixed rank): ∏(1 + ξ + ⋯ + ξ^{kk'−1}) = ∏(1 + ξ^k + ⋯ + ξ^{k(k'−1)})(1 + ξ + ⋯ + ξ^{k−1}).
3. ε(θ^k N) = Θ_k(C(p,1), …, C(p,p)) = k^p (put ξ_i = 1); θ^k(N) − k^p has rank zero.

**API.**

- `TauCeti.LambdaRing.bott` (constructor): θ^k(N) for N of finite rank p.
- `TauCeti.LambdaRing.bott_add` (simp): θ^k(N + N') = θ^k(N)θ^k(N').
- `TauCeti.LambdaRing.bott_line` (simp): θ^k(L) = 1 + L + ⋯ + L^{k−1} for a line element L.
- `TauCeti.LambdaRing.bott_mul_index` (relation): θ^{kk'}(N) = ψ^k(θ^{k'}(N))θ^k(N).
- `TauCeti.LambdaRing.augmentation_bott` (simp): ε(θ^k(N)) = k^{rank N}.
- `TauCeti.LambdaRing.bott_map` (functoriality): λ-homomorphisms commute with θ^k.
- `TauCeti.LambdaRing.bottExp` (constructor): The exponential extension θ^k: K_0 → K_0 ⊗ ℤ[1/k], for K_0 with nil augmentation ideal in which every element is a difference of finite-rank elements.

**Unit tests.**

- `bott_one` (degenerate): θ^k(1) = k and θ^k(0) = 1.
- `bott_trivial` (computation): θ^k(O^c) = k^c; θ^3(L) = 1 + L + L².
- `bott_ne_adams` (non-example): θ^k ≠ ψ^k: θ^2(L) = 1 + L while ψ²(L) = L².
- `bott_augmentation` (characterisation): ε(θ^k(N)) = k^{rank N}, so θ^k(N) is invertible in K_0 ⊗ ℤ[1/k] when K̃_0 is nilpotent.

**Acceptance.**

- θ^k(1) = k and θ^k(O^c) = k^c.
- θ^2(L) = 1 + L; θ^2(L_1 + L_2) = (1 + L_1)(1 + L_2).

**Used by.**

- Soulé 1985, Lemme 2 and Théorème 3: ψ^k(N, x) = θ^k(N)ψ^k(x) and the Riemann–Roch formula without denominators
- S.7/adams-riemann-roch: θ^k(−T^∨_M) in Soulé's φ^k and in the Adams–Riemann–Roch formula
- S.6/gysin-weight-shift: θ^k of a trivial normal bundle of rank c is k^c

**Depends on.** this roadmap: `S.6/lambda-ring`, `S.6/lambda-identity-principle`, `S.6/adams-operations`; libraries: `tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm`.

**Sources.**

- `Soule.1985`, 4.5 (p. 515): “Si k ≥ 1, désignons par θ^k(N) ∈ R l'image de N par l'opération cannibale θ^k ([2], [20]). On peut définir θ^k(N) à l'aide du principe de scindage:” — The definition, by θ^k(N) = ∏(1 + L_i + ⋯ + L_i^{k−1}) after splitting; the node defines it by the symmetric polynomial Θ_k, which gives the same element.
- `Soule.1985`, Lemme 2 ii) (p. 515): “ii) θ^k(N + N') = θ^k(N) · θ^k(N') θ^{kk'}(N) = ψ^k(θ^{k'}(N)) · θ^k(N) ε(θ^k(N)) = k^{ε(N)}.” — The identities of the node.

### Grothendieck's λ-ring R_N twisted by an element of finite rank

`S.6/twisted-lambda-ring` · construction

Let R be a special λ-ring and N ∈ R of rank p > 0 (λ^k(N) = 0 for k > p, λ^p(N) ≠ 0), with λ_{−1}(N) := Σ_{j=0}^{p}(−1)^jλ^j(N). The λ-ring R_N has underlying group ℤ × R and product (1, 0)_N(n, x) = (n, x), x_N y = x·y·λ_{−1}(N) for x, y ∈ R; its operations are given by universal formulas: λ^k(N, x) (the R-component of λ^k(0, x)) is an integer polynomial in λ^1x, …, λ^kx and λ^1N, …, λ^pN, characterised by λ^k(N, x)λ_{−1}(N) = λ^k(xλ_{−1}(N)); likewise γ^k(N, x)λ_{−1}(N) = γ^k(xλ_{−1}(N)); τ(N, x) denotes the R-component of τ(0, x) for any natural operation τ. It is the λ-ring structure transported by a Gysin map: for the zero section j of a vector bundle with conormal class N, j_*(x_N y) = j_*(x)j_*(y).

**Hypotheses.**

- R a special λ-ring; N of finite rank p with λ_{−1}(N) not necessarily a nonzerodivisor, which is why the operations are defined by universal polynomials rather than by division.

**Proof.**

1. Universal case: R = ℤ[ξ_1,…,ξ_p, u_1, u_2, …] with N = Σξ_i; there λ_{−1}(N) = ∏(1 − ξ_i) is a nonzerodivisor, and the formula λ^k(N, x) := λ^k(xλ_{−1}(N))/λ_{−1}(N) is shown to be an integer polynomial by Grothendieck (SGA 6 V §5, cited by Soulé; not public: gap for this integrality).
2. The λ-ring axioms of R_N hold in the universal case because x ↦ xλ_{−1}(N) is then an injective map compatible with the structures, and transfer to every R by the identity principle (S.6/lambda-identity-principle, fixed rank in N).
3. Unit and product as stated; (1, 0) is the unit.

**API.**

- `TauCeti.LambdaRing.twisted` (constructor): R_N = ℤ × R with (1,0) as unit and x_N y = xyλ_{−1}(N), as a function of R, N and its rank p (λ_{−1}(N) depends on p).
- `TauCeti.LambdaRing.twisted.lambdaRing` (instance): R_N is a special λ-ring, under the hypothesis λ^j(N) = 0 for j > p.
- `TauCeti.LambdaRing.twistedOp` (data): τ(N, x), the R-component of τ(0, x).
- `TauCeti.LambdaRing.twistedLambda_mul` (characterisation): λ^k(N, x)λ_{−1}(N) = λ^k(xλ_{−1}(N)), and the same for γ^k.
- `TauCeti.LambdaRing.twisted_map` (functoriality): A λ-homomorphism f: R → R' induces R_N → R'_{f(N)}.

**Unit tests.**

- `twisted_unit` (degenerate): (1, 0) is the unit of R_N and (n, 0)_N(m, y) = (nm, ny).
- `twisted_trivial_rank_one` (computation): For N = 1: λ_{−1}(N) = 0 and x_N y = 0 for x, y ∈ R.
- `twisted_lambda_one` (computation): λ^1(N, x) = x and λ^k(N, 0) = 0 for k ≥ 1.
- `twisted_not_untwisted` (non-example): R_N is not R: for R = ℤ[ξ] and N = ξ, 1_N·1 = 1 − ξ ≠ 1, so (0, 1) is not the unit of R_N.

**Acceptance.**

- For N = 1 (rank one, trivial): λ_{−1}(1) = 0, x_N y = 0, and R_N is ℤ ⊕ R with square-zero R, as for K^Y(X) with Y the zero section of a trivial line bundle.
- λ^1(N, x) = x.

**Used by.**

- Soulé 1985, Théorème 3: the formula τ(j_*x) = j_*(τ(N, x)) for a closed immersion of regular schemes
- S.6/twisted-adams-formula: ψ^k(N, x) = θ^k(N)ψ^k(x)
- S.6/riemann-roch-without-denominators: j_*: K^Z(Y)_N → K^Z(X) is a morphism of λ-rings

**Depends on.** this roadmap: `S.6/lambda-ring`, `S.6/lambda-identity-principle`, `S.6/lambda-universal-polynomials`.

**Sources.**

- `Soule.1985`, 4.5 (p. 514): “Soit R un λ-anneau et N ∈ R un élément de rang p > 0: λ^k(N) = 0 si k > p et λ^p(N) ≠ 0. Grothendieck associe à ces données un λ-anneau R_N ([14], V, Section 5) défini comme suit.” — The construction, with the product x_N y = xyλ_{−1}(N) and the characterisation λ^k(N, x)λ_{−1}(N) = λ^k(xλ_{−1}(N)) on the same page.

### Adams operations of the twisted λ-ring

`S.6/twisted-adams-formula` · lemma

In the situation of S.6/twisted-lambda-ring, for x ∈ R and k ≥ 1: ψ^k(N, x) = θ^k(N)ψ^k(x); with an involution sending line elements to their inverses, the same holds for k ∈ ℤ − {0} with θ^{−1}(N) = (−1)^pλ^p(ψ^{−1}(N)) and θ^{−k} as in S.6/bott-cannibalistic-class.

**Hypotheses.**

- R a special λ-ring, N of rank p; for k < 0 an involution with L^∨ = L^{−1} on line elements.

**Proof.**

1. Reduce to the universal case where R is a domain (S.6/lambda-identity-principle).
2. In R[[u]], with λ_u(N, x) = Σλ^k(N, x)u^k and ψ_u(N, x) = Σ_{k≥1}ψ^k(N, x)u^k, one has λ_{−u}(N, x)_N ψ_u(N, x) = −uλ'_{−u}(N, x) (the Newton identity in R_N, S.6/adams-operations).
3. Using λ_u(N, x)λ_{−1}(N) = λ_u(xλ_{−1}(N)) this gives ψ_u(N, x) = ψ_u(xλ_{−1}(N))/λ_{−1}(N), so ψ^k(N, x) = ψ^k(x)ψ^k(λ_{−1}(N))/λ_{−1}(N), and ψ^k(λ_{−1}(N))/λ_{−1}(N) = θ^k(N) on sums of line elements: (1 − L^k)/(1 − L) = 1 + L + ⋯ + L^{k−1}.
4. The case k < 0 by the analogous computation with ψ^{−1} (Soulé's Lemme 2 i)).

**Acceptance.**

- For N = 1: ψ^k(1, x) = kψ^k(x).
- For N = L a line element: ψ^2(L, x) = (1 + L)ψ^2(x).

**Depends on.** this roadmap: `S.6/twisted-lambda-ring`, `S.6/bott-cannibalistic-class`, `S.6/adams-operations`, `S.6/lambda-identity-principle`.

**Sources.**

- `Soule.1985`, Lemme 2 i) (p. 515): “LEMME 2. i) Si x ∈ R, ψ^k(N, x) = θ^k(N)ψ^k(x), k ∈ Z − {0}.” — The statement; the proof is on pp. 515–517.

### Riemann–Roch without denominators for closed immersions

`S.6/riemann-roch-without-denominators` · theorem · planet “Riemann–Roch without denominators”

Let S be a regular noetherian scheme of finite Krull dimension, j: Y → X a closed immersion of regular schemes of finite type over S (hence regular, of codimension p on components), N ∈ K_0(Y) the class of the conormal sheaf I/I² of Y in X (Soulé's 'fibré normal' in SGA 6's convention V(I/I²)), and Z ⊆ Y closed. Then j_*: K^Z_m(Y) → K^Z_m(X) is an isomorphism (dévissage) and, for x ∈ K^Z(Y) = ⊕_m K^Z_m(Y) and every natural operation τ, τ(j_*(x)) = j_*(τ(N, x)) with τ(N, x) as in S.6/twisted-lambda-ring. In particular j_*: K^Z(Y)_N → K^Z(X) is a morphism of λ-rings, and ψ^k(j_*x) = j_*(θ^k(N)ψ^k(x)).

**Hypotheses.**

- X, Y regular of finite type over a regular noetherian S of finite Krull dimension; j a closed immersion over S; supports Z ⊆ Y.
- The conormal convention is pinned: N = [I/I²], λ_{−1}(N) = Σ(−1)^i[Λ^iI/I²] = j^*j_*(1).

**Proof.**

1. Dévissage: K^Z_m(Y) ≅ G_m(Z) ≅ K^Z_m(X) for regular X, Y (S.3/regular-support-devissage), and j_* is this isomorphism.
2. Deformation to the normal cone: W = Bl_{Y×0}(A¹_X) with its closed immersion j̃: A¹_Y → W over A¹_S, whose fibres are j at t ≠ 0 and the zero section of the normal bundle at t = 0 (imported from SchemeAndStackFoundations SF.5, request; the blow-up of a regular immersion is S.5/regular-blowup-geometry).
3. Homotopy invariance for regular schemes (S.5/homotopy-invariance-regular) makes the restrictions i_t^*: K^Z(A¹_Y) → K^Z(Y) isomorphisms; the operations commute with pullback (S.6/operations-functoriality), so the statement for j_0 implies it for j̃ and then for j_1 = j.
4. Zero-section case: X is the total space f: X → Y of the vector bundle whose zero section has conormal sheaf N (its sheaf of sections is N^∨); j_*(x) = f^*(x)·j_*(1) (projection formula, S.6/product-pullback-compatibility) and j^*j_*(1) = λ_{−1}(N) by the Koszul resolution of O_Y by Λ^•(f^*N) (Thomason 1993, (3.2.6)–(3.2.7)); so j_*(x_Ny) = j_*(x)j_*(y) and, by the λ-ring structure of R_N, it suffices to show τ(j_*(1)) = j_*(τ(N, 1)).
5. Compactify X ⊂ P = P(N^∨ ⊕ 1) with φ: X → P open, p: P → Y and section σ; then τ(j_*(1)) = φ^*σ_*p_*τ(σ̃_*(1)) and it suffices that p_*τ(σ̃_*(1)) = τ(N, 1), an identity between universal integer polynomials in the λ^k(N), λ^k(N^∨), computed by the projective bundle formulas (S.5/projective-bundle-theorem, S.5/projective-bundle-cohomology).
6. Evaluate the universal polynomial after splitting: pull back to the flag bundle of N (S.6/k-theoretic-splitting-principle, injective on K_0 and compatible with p_* by flat base change S.2/k-theory-base-change) and reduce to N of rank one, where τ(j̃_*(1)) = τ(1 − L) and λ_u(1 − L) = 1 − uL = λ_u(L, 1)(1 − L) = j̃_*(λ_u(N, 1)); similarly for ψ^{−1}.

**Acceptance.**

- For the zero section of a trivial line bundle (N = 1): ψ^k(j_*x) = kj_*(ψ^kx).
- For a divisor Y ⊂ X with O(−Y) = L: j_*(1) = 1 − [L] and ψ^k(j_*(1)) = 1 − [L]^k = j_*(θ^k(L|_Y)).

**Depends on.** this roadmap: `S.3/regular-support-devissage`, `S.5/regular-blowup-geometry`, `S.5/homotopy-invariance-regular`, `S.6/operations-functoriality`, `S.6/product-pullback-compatibility`, `S.6/twisted-lambda-ring`, `S.6/twisted-adams-formula`, `S.5/projective-bundle-theorem`, `S.5/projective-bundle-cohomology`, `S.6/k-theoretic-splitting-principle`, `S.2/k-theory-base-change`, `S.6/scheme-lambda-algebra`; other roadmaps: `SchemeAndStackFoundations:SF.5`.

**Sources.**

- `Soule.1985`, Théorème 3 (p. 517): “THÉORÈME 3. Si x ∈ K^Z(Y) et τ ∈ 𝒯 on a τ(j_*(x)) = j_*(τ(N, x)).” — The statement, for X, Y regular of finite type over S (4.6).
- `Soule.1985`, Proof of Théorème 3 (p. 517): “Preuve. On utilise comme dans [4] et [12] la déformation sur le cône normal.” — The method; the reduction to the zero section and to rank one is on pp. 518–519.
- `Thomason.1993`, Lemme 3.2 and (3.2.6) (pp. 207–208): “D'après [SGA6, VII 1.4.2] les complexes de Koszul de ces suites sont acycliques, c'est-à-dire qu'ils sont des résolutions libres de O_Y = O_X/𝒥 et de O_{Y'} = O_{X'}/𝒥' respectivement:” — The Koszul resolution used for j^*j_*(1) = λ_{−1}(N).

### Weight shift of Gysin maps

`S.6/gysin-weight-shift` · theorem

In the situation of S.6/riemann-roch-without-denominators, with Y of pure codimension c in X: (a) ψ^k(j_*x) = j_*(θ^k(N)ψ^k(x)) for x ∈ K^Z_m(Y), k ≥ 1; (b) if the conormal sheaf is trivial of rank c, ψ^k ∘ j_* = k^c·j_* ∘ ψ^k, so j_* maps K^Z_m(Y)^{(i)} into K^Z_m(X)^{(i+c)} (integrally, on the eigenspaces of S.6/scheme-weight-decomposition); (c) in general, rationally, j_*(K^Z_m(Y)^{(i)}_ℚ) ⊆ ⊕_{i' ≥ i+c}K^Z_m(X)^{(i')}_ℚ, and j_*(F^i_γ) ⊆ F^{i+c}_γ modulo torsion; the exact weight-preserving map is x ↦ j_*(x·θ^k-correction), made precise in S.7/adams-riemann-roch. The operations are not claimed to commute with j_*: the factor θ^k(N) (= k^c for trivial N) is the twist.

**Hypotheses.**

- As in S.6/riemann-roch-without-denominators; (b) needs the conormal sheaf free of rank c (e.g. a rational point of a regular curve, or a regular point of codimension c with trivialised normal bundle).

**Proof.**

1. (a) is S.6/riemann-roch-without-denominators with S.6/twisted-adams-formula.
2. (b): θ^k(O^c) = k^c (S.6/bott-cannibalistic-class), so ψ^kj_*x = k^cj_*ψ^kx; if ψ^kx = k^ix then ψ^k(j_*x) = k^{i+c}j_*x.
3. (c): θ^k(N) = k^c + (element of F^1_γK_0(Y)) and F^a_γ·F^b_γ ⊆ F^{a+b}_γ; on the weight decomposition ψ^k(j_*x) − k^{i+c}j_*x = j_*((θ^k(N) − k^c)k^ix), which lies in higher weights; the γ-statement follows from ψ^k = k^i on gr^i (S.6/adams-eigenvalue-on-gamma-graded) and Soulé's Remarque in 4.5.

**Acceptance.**

- For a rational point P: Spec F → X of a regular curve, ψ^kP_* = kP_*ψ^k, so P_*(K_1(F)^{(1)}) ⊆ K_1(X)^{(2)} (EllipticKTheory E.4: SK_1 of a curve has weight 2 rationally).
- For a closed point x of a regular surface with trivial conormal (c = 2), x_*K_0(k(x)) ⊆ K_0(X)^{(2)}.

**Depends on.** this roadmap: `S.6/riemann-roch-without-denominators`, `S.6/twisted-adams-formula`, `S.6/bott-cannibalistic-class`, `S.6/scheme-weight-decomposition`, `S.6/adams-eigenvalue-on-gamma-graded`.

**Sources.**

- `Soule.1985`, Proof of Proposition 6 (p. 520): “Puisque le fibré normal à j(X) est trivial, on a, d'après le Théorème 3, ψ^k(j_*(x)) = j_*(ψ^k(x)θ^k(1)) = kj_*(ψ^k(x)),” — Part (b) for c = 1, as Soulé applies it.
- `Soule.1985`, Remarque after Lemme 2 (p. 517): “Enfin, si x ∈ F^i_γR, on a γ^{p+i}(N, x) − (−1)^{p+i−1}(p + i − 1)!x ∈ F^{i+1}_γR.” — The γ-version of the shift by the codimension p.

### Adams operations and finite étale transfers

`S.6/finite-etale-transfer-adams` · lemma

Let f: X → Y be a finite étale morphism of regular noetherian schemes of finite Krull dimension that factors through a closed immersion into A¹_Y (e.g. X = Y ⊗_k k' for a finite separable extension k'/k of the base field). Then for x ∈ K_m(X) and k ∈ ℤ − {0}: kψ^k(f_*(x)) = kf_*(ψ^k(x)), and for k ≥ 1 the element kγ^k(f_*(x)) − kf_*(γ^k(x)) lies in f_*(F^{k+1}_γK_m(X)). In particular f_* respects the γ-filtration modulo torsion.

**Hypotheses.**

- f finite étale between regular noetherian schemes of finite dimension, factoring through a closed immersion into A¹_Y; the factor k is not removed in the source.

**Proof.**

1. Factor f as X → P^1_Y → Y with j: X → P^1_Y a closed immersion missing the section at infinity j_∞: Y → P^1_Y (Gillet, Cor. 3.12's method).
2. The normal bundles of j(X) and of j_∞(Y) are trivial of rank 1, so S.6/gysin-weight-shift gives ψ^k(j_*x) = kj_*(ψ^kx) and ψ^k(j_{∞*}x̄) = kj_{∞*}(ψ^kx̄).
3. With x̄ = f_*(x), j_*(x) = j_{∞*}(x̄) in K(P^1_Y) (Gillet, loc. cit.) and the projection formula j_{∞*}(x̄) = p^*(x̄)j_{∞*}(1) (S.6/product-pullback-compatibility); apply p_* and γ^k(j_{∞*}(1)) = 0 for k > 1.

**Acceptance.**

- For k'/k finite separable and X = Spec k', f_*ψ^k = ψ^kf_* on K_m(k') after multiplying by k.
- For f = id both sides agree.

**Depends on.** this roadmap: `S.6/gysin-weight-shift`, `S.6/product-pullback-compatibility`, `S.2/k-theory-proper-pushforward`, `S.5/projective-line-k-theory`.

**Sources.**

- `Soule.1985`, Proposition 6 (pp. 519–520): “PROPOSITION 6. Soit f: X → Y un morphisme fini étale entre schémas réguliers, nœthériens et de dimensions finies. On suppose que f se factorise par une immersion fermée dans la droite affine A^1_Y.” — The hypotheses; the conclusion kψ^k(f_*(x)) = kf_*(ψ^k(x)) is on p. 520.

### Operations on the Gersten–Quillen spectral sequence

`S.6/adams-on-coniveau` · theorem

Let X be a regular noetherian scheme of finite Krull dimension d, with the coniveau spectral sequence E_1^{pq}(X) = ⊕_{x∈X^{(p)}} K_{−p−q}(k(x)) ⇒ K_{−p−q}(X) of S.4 (Quillen's, identified with the coniveau filtration of H^*(X, ℤ × BGL^+)). (i) Every operation τ induces an endomorphism E_r(τ) of the spectral sequence converging to τ on K_{−p−q}(X). (ii) For x ∈ X^{(p)} and α ∈ K_{−p−q}(k(x)), E_1(τ)(α) = τ(p, α) (the twisted operation with N = 1^p trivial of rank p): in particular E_1(ψ^k) = k^pψ^k on the codimension-p column. (iii) For i ≥ 2 and m ≥ i there is, modulo 𝒮_{m+d}, a direct-summand spectral sequence with E_1^{pq} = ⊕_{x∈X^{(p)}} K_{−p−q}(k(x))^{(i−p)} for −m ≤ p + q ≤ 0, converging to K_{−p−q}(X)^{(i)}; the differentials d_r preserve the total weight i. (iv) Degeneration in low degrees: K_0(X) = E_2^{00} ⊕ E_2^{1,−1} ⊕ F^2_γK_0(X), K_1(X) = E_2^{0,−1} ⊕ F^2_γK_1(X), and K_0(X) = ⊕_{p=0}^{d}E_2^{p,−p}(X) modulo 𝒮_d, K_1(X) = ⊕_p E_2^{p,−p−1}(X) and K_2(X) = ⊕_p E_2^{p,−p−2}(X) modulo 𝒮_{d+2}.

**Hypotheses.**

- X regular noetherian of finite Krull dimension d; the residue fields at points of codimension p have trivial conormal in a small enough neighbourhood (used in (ii)).

**Proof.**

1. (i): Gillet's construction obtains the spectral sequence by filtering the hypercohomology of a simplicial sheaf F by codimension of supports, E_1^{pq}(F) = ⊕_{x∈X^{(p)}}H_x^{p+q}(X, F), contravariant in F; take F = ℤ × BGL^+ and use S.6/sheaf-level-k-theory-model and S.6/soule-scheme-operations (identification with S.4/g-coniveau-spectral-sequence via Cartan, X regular).
2. (ii): for U a small neighbourhood of x, x̄ ∩ U is regular with trivial normal bundle and colim_U K_m^{x̄∩U}(U) ≅ K_m(k(x)) is induced by the closed immersion; S.6/riemann-roch-without-denominators gives τ ↦ τ(p, ·), and S.6/twisted-adams-formula with θ^k(1^p) = k^p gives k^pψ^k.
3. (iii): on K_{−p−q}(k(x)) the γ-filtration has length ≤ −p − q + 1 (S.6/soule-gamma-bound, r = 1) and K_n = F^2_γK_n for n ≥ 2 (S.6/kratzer-low-gamma), so ∏(E_r(ψ^{k_j}) − k_j^{p+j}) = 0 on E_r^{pq}; eigenspace decomposition modulo 𝒮 as in S.6/affine-weight-decomposition; d_r commutes with E_r(ψ^k), hence preserves weights; convergence by S.6/scheme-gamma-bound.
4. (iv): the determinant splits ℤ × BGL^+ → ℤ × BGL_1 and the coniveau sequence of ℤ × BGL_1 is concentrated in |p| + |q| ≤ 1; the remaining terms are SK_m = F^2_γK_m by Kratzer; the differentials into the diagonals are killed by w-numbers whose primes are 2 or < p − 1 (S.6/affine-weight-decomposition).

**Acceptance.**

- For a regular curve X over a field, E_1(ψ^k) is ψ^k on K_n(k(X)) and kψ^k on ⊕_{closed x}K_{n−1}(k(x)).
- (iv) for d = 1: K_0(X) = ℤ^{π_0} ⊕ Pic(X), integrally.

**Depends on.** this roadmap: `S.4/g-coniveau-spectral-sequence`, `S.4/k-coniveau-spectral-sequence`, `S.2/cartan-equivalence`, `S.6/sheaf-level-k-theory-model`, `S.6/soule-scheme-operations`, `S.6/riemann-roch-without-denominators`, `S.6/twisted-adams-formula`, `S.6/soule-gamma-bound`, `S.6/kratzer-low-gamma`, `S.6/affine-weight-decomposition`, `S.6/scheme-gamma-bound`.

**Sources.**

- `Soule.1985`, Théorème 4 (p. 521): “THÉORÈME 4. i) Pour toute opération τ ∈ 𝒯 il existe une application entre suites spectrales E_r^{pq}(τ): E_r^{pq}(X) → E_r^{pq}(X) convergeant vers τ: K_{−p−q}(X) → K_{−p−q}(X).” — Part (i); (ii)–(iv) are on the same page.
- `Soule.1985`, Proof of Théorème 4 iii) (p. 522): “D'après ii), l'action E_r(ψ^k) des opérations d'Adams sur E_r^{pq}(X) vérifie E_1(ψ^k) = ψ^k(p, ·) = k^pψ^k” — Part (ii) for Adams operations.

### Weight shift of residue maps

`S.6/residue-weight-shift` · theorem

(a) Let O be a discrete valuation ring with fraction field L and residue field k, and ∂: K_{m+1}(L) → K_m(k) the boundary of S.3/dvr-boundary. Then ∂ ∘ ψ^k = k·ψ^k ∘ ∂ for all k ≥ 1 and m ≥ 0; rationally ∂ maps K_{m+1}(L)^{(j)}_ℚ into K_m(k)^{(j−1)}_ℚ. (b) Let X be regular noetherian of finite Krull dimension; the d_1 differential of the coniveau spectral sequence from ⊕_{x∈X^{(p)}}K_n(k(x)) to ⊕_{y∈X^{(p+1)}}K_{n−1}(k(y)) satisfies d_1 ∘ k^pψ^k = k^{p+1}ψ^k ∘ d_1, so its components (residues) lower the weight of residue-field K-theory by one: d_1(K_n(k(x))^{(j)}) ⊆ ⊕K_{n−1}(k(y))^{(j−1)} rationally. Checks: ∂(u) = v(u) for u ∈ L^× (weight 1 → 0) and the tame symbol ∂{f, u} = ū^{v(f)} (weight 2 → 1): ∂ψ^k{f, u} = ∂(k²{f, u}) = k²ū^{v(f)} = k·ψ^k(ū^{v(f)}).

**Hypotheses.**

- O a DVR (regular of dimension one, of finite type over S = Spec O, so S.6/riemann-roch-without-denominators applies to Spec k → Spec O); in (b) X regular noetherian of finite dimension.

**Proof.**

1. The boundary of the localisation sequence factors as K_{m+1}(L) → K^{closed}_m(O) ≅ K_m(k), the second map the inverse of the dévissage j_* (S.3/localisation-boundary, S.3/regular-support-devissage, S.3/dvr-boundary).
2. ψ^k commutes with the boundary into support K-theory (S.6/operations-functoriality (c)), and ψ^k(j_*y) = k·j_*(ψ^ky) because the conormal m/m² ≅ k is trivial of rank one (S.6/gysin-weight-shift (b)).
3. Hence j_*(∂ψ^ku) = ψ^k(j_*∂u) = kj_*(ψ^k∂u), and j_* is injective.
4. (b): d_1 commutes with E_1(ψ^k) (S.6/adams-on-coniveau (i)), which is k^pψ^k on the codimension-p column (S.6/adams-on-coniveau (ii)); the component of d_1 at a codimension-one specialisation with DVR local ring is the DVR boundary (S.4/coniveau-residue-differential).
5. Checks: ∂ on units is the valuation (S.3/dvr-boundary-unit-valuation), ψ^k(u) = u^k and ψ^k = id on K_0(k); the tame-symbol check uses ψ^k = k² on products of two units (S.6/adams-on-units-and-products) — the identification of ∂{f, u} with the tame symbol is K2SymbolsBrauer T.3's, not used in the proof.

**Acceptance.**

- ∂(ψ^k(π)) = ∂(π^k) = k = k·ψ^k(∂π) for a uniformiser π.
- On K_2(ℚ_p) → K_1(𝔽_p): ∂ψ^k = kψ^k∂.

**Depends on.** this roadmap: `S.3/dvr-boundary`, `S.3/dvr-boundary-unit-valuation`, `S.3/localisation-boundary`, `S.3/regular-support-devissage`, `S.6/operations-functoriality`, `S.6/gysin-weight-shift`, `S.6/adams-on-coniveau`, `S.4/coniveau-residue-differential`, `S.6/adams-on-units-and-products`.

**Sources.**

- `Soule.1985`, Proof of Théorème 4 iii) (p. 523): “De plus, l'image par la différentielle d_r: E_r^{pq}(X) → E_r^{p+r,q−r+1}(X) d'un élément α ∈ E_r^{pq}(X)^{(i)} vérifie E_r(ψ^k)(d_r(α)) = d_r(E_r(ψ^k)(α)) = k^id_r(α).” — Differentials preserve the total weight i, which on the codimension-p column is residue-field weight i − p: residues lower the residue-field weight by one.
- `Kbook.2013`, Ex. IV.5.3 (PDF p. 325): “Show that the λ-operations are compatible with K1(A[t, 1/t]) ∂ −→K0(A), the map in the Fundamental Theorem III.3.6, in the sense that for every x ∈ K0(A), t · x ∈K1(A[t, 1/t]) satisﬁes ∂λk(t · x) = (−1)k−1ψk(x).” — A boundary compatibility with a twist in the Laurent case, of the same shape.

## S.7 — Cycle classes and Riemann–Roch

*Coverage: partial.* Nodes: the scheme γ-filtration normalised against Z.3 on affines, its first graded pieces (rank, Pic via det, F^2_γ = SK_0 — proved with the K-theoretic splitting principle and the identity principle, not the filtered splitting principle), the inclusion of the γ-filtration in the coniveau filtration, cycles onto coniveau graded pieces, the Chern character on K_0 and G_0 (K/G realisation through the Cartan isomorphism) with multiplicativity, naturality and its interaction with Adams operations, the Chern classes of structure sheaves of subvarieties (with the sign corrected), Grothendieck's γ–Chow comparison (rational, and integral modulo 𝒮_d), the γ-valued Chern character of Soulé in all degrees, the Euler-characteristic identification of S.2's proper pushforward, Grothendieck–Riemann–Roch on the actual K/G pushforward (compatibility with SF.5's source-scoped theorem), Hirzebruch–Riemann–Roch with the comparison to Tau Ceti's function-field Riemann–Roch, Soulé's Adams operations, filtration and σ on G-theory of quasi-projective schemes over a regular base (the explicit extension beyond SF.5's scope, with denominators), the Adams–Riemann–Roch theorem for projective morphisms, Thomason's excess intersection formula in all degrees with its Tor lemma, the self-intersection formula and the rational-point case requested by EllipticKTheory E.4. Imported: Chow groups, Chern classes, intersection products, deformation to the normal cone and geometric GRR from SchemeAndStackFoundations SF.5 (request), divisors/line bundles/Pic from JacobianChallenge layer A (request), coherent cohomology and Serre duality from JacobianChallenge layer B (request). Higher Chow groups and the higher Chern character into motivic cohomology belong to MotivicEtaleKTheory; S.7/gamma-chern-character is the γ-graded form they must extend.

- Remaining: Jussila's F^p_γK_0 ⊆ F^p_cod K_0 for arbitrary noetherian X (SGA 6 X, not obtained) and Gillet–Soulé's Brown-filtration comparison (their §§1–3, Theorem 2), recorded as gaps behind S.7/gamma-in-coniveau.
- Remaining: Grothendieck–Riemann–Roch with values in Chow groups over a Dedekind or regular arithmetic base (needed for regular arithmetic surfaces by EllipticKTheory E.6 and EllipticRegulators ER.6) is not supplied by SF.5's source scope (Borel–Serre, Fulton 15.2 over a field); S.7 supplies Soulé's γ-graded Riemann–Roch over a regular base instead, and the Chow-valued arithmetic version remains a gap.
- Remaining: Manin's identity k^r ch^{−1}(ψ^k Td(P^r)^{−1}) ch(Td(P^r))^{−1} = θ^k(P^r) (Lectures on the K-functor, Lemma 18.4), cited in the proof of S.7/adams-riemann-roch (gap).
- Remaining: The requests to SF.5 and to JacobianChallenge layers A and B must be answered by those owners.

### The γ-filtration of a scheme

`S.7/scheme-gamma-filtration` · definition · planet “γ-filtration”

For a quasi-compact scheme X, the γ-filtration F^•_γK_0(X) is the γ-filtration (S.6/gamma-filtration) of the augmented special λ-ring K_0(Vect X) of S.6/vector-bundle-lambda-ring, with augmentation the rank ε: K_0(Vect X) → H^0(X, ℤ); gr^i_γK_0(X) = F^i_γ/F^{i+1}_γ. When K_0(Vect X) = K_0(X) (X with an ample family, e.g. quasi-projective, or regular separated with the resolution property) this is a filtration of K_0(X); for X regular noetherian of finite Krull dimension it is the degree-zero part of the filtration of S.6/scheme-lambda-algebra. It is a filtration by ideals, multiplicative, contravariant in X, and for X = Spec A it is KTheoryLowDegrees Z.3/gamma-filtration (the normalisation against Z.3 on affines).

**Hypotheses.**

- X quasi-compact; for disconnected X the rank is locally constant and H^0(X, ℤ) has several idempotents.

**Proof.**

1. Instance of S.6/gamma-filtration for the augmented λ-ring K_0(Vect X) (S.6/vector-bundle-lambda-ring).
2. Pullback f^* is an augmented λ-homomorphism, so preserves F^i_γ.
3. Affine normalisation: S.6/degree-zero-comparison identifies λ^k, γ^k and the augmentation on K_0(A) with Z.3's, so the filtrations coincide (both are generated by the same weighted γ-products).

**API.**

- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration` (constructor): F^i_γK_0(X), an ideal of K_0(Vect X).
- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_mul` (structure): F^iF^j ⊆ F^{i+j}; F^{i+1} ⊆ F^i; F^0 = K_0, F^1 = ker(rank).
- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_pullback` (functoriality): f^*(F^i_γK_0(X)) ⊆ F^i_γK_0(X').
- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_affine` (compatibility): For X = Spec A, F^i_γ = KTheoryLowDegrees Z.3/gamma-filtration.
- `TauCeti.AlgebraicGeometry.KTheory.gammaGraded` (constructor): gr^•_γK_0(X), a graded H^0(X, ℤ)-algebra.
- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_first` (characterisation): F^1/F^2 ≅ Pic(X) and F^2 = SK_0(X) (S.7/gamma-first-graded-pieces).

**Unit tests.**

- `gammaFiltration_field` (degenerate): For a field F, F^1_γK_0(F) = 0.
- `gammaFiltration_P1` (computation): On P^1_k, F^1_γ = ℤ·h with h = 1 − [O(−1)] and F^2_γ = 0 (h² = 0).
- `gammaFiltration_P2` (computation): On P^2_k, F^2_γ = ℤ·h², F^3_γ = 0, h = 1 − [O(−1)], h³ = 0.
- `gammaFiltration_affine_compat` (compatibility): For X = Spec A, F^i_γK_0(X) = Z.3/gamma-filtration of K_0(A).
- `gammaFiltration_not_coniveau_integral` (non-example): The γ-filtration is not the coniveau filtration integrally in general; they agree after ⊗ℚ for X regular of finite type over a field (S.7/gamma-chow-comparison), and F^p_γ ⊆ F^p_cod always (S.7/gamma-in-coniveau).

**Acceptance.**

- F^1_γK_0(P^1_k) = ℤ·(1 − [O(−1)]) and F^2_γK_0(P^1_k) = 0.
- For a field, F^1_γK_0(F) = 0.

**Used by.**

- Soulé 1985, 6.1 and Théorème 7: gr_γK_0 compared with Chow groups and the Riemann–Roch isomorphism into gr_γ
- S.7/gamma-chow-comparison: gr^i_γK_0(X)_ℚ ≅ CH^i(X)_ℚ for regular X of finite type over a field
- MotivicEtaleKTheory M.6: the degree-zero Chern character that the motivic Chern character extends
- KTheoryLowDegrees Z.6 (P^1_F tests): the two bases of K_0(P^1) and the rank/degree filtration

**Depends on.** this roadmap: `S.6/gamma-filtration`, `S.6/vector-bundle-lambda-ring`, `S.6/degree-zero-comparison`, `S.6/scheme-lambda-algebra`; other roadmaps: `KTheoryLowDegrees:Z.3/gamma-filtration`.

**Sources.**

- `Kbook.2013`, Corollary II.8.8.2 (PDF p. 161): “K0(X) is a special λ-ring. Consequently, the ﬁrst two ideals in the γ-ﬁltration of K0(X) are F 1 γ = eK0(X) and F 2 γ = SK0(X).” — The γ-filtration of K_0 of a scheme and its first two terms.
- `Soule.1985`, Introduction (p. 488): “si X est lisse sur un corps, le groupe F^i_γK_0(X)/F^{i+1}_γK_0(X) est isomorphe, à la torsion près, au groupe de Chow CH^i(X) des cycles de codimension i sur X, modulo l'équivalence linéaire.” — The filtration and the comparison it serves (S.7/gamma-chow-comparison).

### The first graded pieces of the γ-filtration

`S.7/gamma-first-graded-pieces` · theorem

For a quasi-compact scheme X: F^0_γ/F^1_γ ≅ H^0(X, ℤ) via the rank; the determinant det: K_0(Vect X) → Pic(X) (the additive-to-multiplicative homomorphism with det[E] = Λ^{rk E}E componentwise) kills F^2_γ, and ℓ ↦ [L] − 1 induces an isomorphism Pic(X) ≅ F^1_γ/F^2_γ with inverse det; hence F^2_γ = SK_0(X) := ker(rank, det). The map rank ⊕ det: K_0(Vect X) → H^0(X, ℤ) ⊕ Pic(X) is a ring homomorphism for (a_1, L_1)(a_2, L_2) = (a_1a_2, L_1^{a_2} ⊗ L_2^{a_1}). For X = Spec A this is the statement F^2_γK_0(A) = ker(rank, det) left open in KTheoryLowDegrees Z.3's coverage (its F^1 statement is Z.3/gamma-filtration-one).

**Hypotheses.**

- X quasi-compact; Pic(X) is the group of isomorphism classes of line bundles (tauceti:TauCeti.AlgebraicGeometry.LineBundleClass; the dictionary with divisors is JacobianChallenge layer A, request).

**Proof.**

1. det is additive on exact sequences (det E ≅ det E' ⊗ det E''), hence defined on K_0(Vect X); det(xy) = det(x)^{rk y}det(y)^{rk x} for bundle classes (K-book Ex. II.8.5), extended bilinearly.
2. det kills products xy of two rank-zero classes, by the product formula.
3. det(γ^i(x)) = 1 for rank-zero x and i ≥ 2: pull back along a composite of flag bundles g with g^* injective on K_0 and on Pic (S.6/k-theoretic-splitting-principle) where x = Σ([L_j] − 1) − Σ([M_j] − 1); then γ_t(x) = ∏(1 + ([L_j] − 1)t)/∏(1 + ([M_j] − 1)t) and γ^i(x) is a signed sum of products of classes [L_S] = ⊗_{j∈S}L_j; the exponent of each L_t in det(γ^i(x)) is Σ_{S∋t}(−1)^{i−|S|}(…) = Σ_{a=0}^{i−1}C(i−1, a)(−1)^{i−1−a} = 0 for i ≥ 2.
4. Hence det(F^2_γ) = 1. For p a bundle of rank n, p − n ≡ det(p) − 1 mod F^2_γ: the fixed-rank identity λ^n(p) − 1 − (p − n) = Σ_{i≥2}γ^i(p − n) (S.6/lambda-identity-principle, checked as ∏ξ_i − 1 − Σ(ξ_i − 1) = Σ_{i≥2}e_i(ξ − 1)) and λ^n(p) = det p.
5. So ℓ ↦ ℓ − 1 is a homomorphism Pic → F^1/F^2 ((ℓ_1 − 1)(ℓ_2 − 1) ∈ F^2), surjective by the previous step and injective since det(ℓ − 1) = ℓ; the ring structure on H^0 ⊕ Pic follows from the product formula for det.

**Acceptance.**

- For a Dedekind domain A, F^1_γ/F^2_γ ≅ Cl(A) and F^2_γ = 0.
- For P^1_k: F^1/F^2 ≅ Pic(P^1) = ℤ, generated by 1 − [O(−1)].

**Depends on.** this roadmap: `S.7/scheme-gamma-filtration`, `S.6/k-theoretic-splitting-principle`, `S.6/lambda-identity-principle`, `S.6/vector-bundle-lambda-ring`; other roadmaps: `KTheoryLowDegrees:Z.3/gamma-filtration-one`, `KTheoryLowDegrees:Z.3/determinant-hom`; libraries: `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

**Sources.**

- `Kbook.2013`, Theorem II.4.7 (PDF p. 104): “If K satisﬁes the Splitting Principle, then the map ℓ7→ℓ−1 induces a group isomorphism, split by the map det: L ∼ = −→F 1 γ K/F 2 γ K.” — The statement for λ-rings with the splitting principle (text layer; rendered L ≅ F^1_γK/F^2_γK). The K-book's proof uses the filtered splitting principle of Fulton–Lang; the node's proof avoids it.
- `Kbook.2013`, Theorem II.8.1 (PDF p. 153): “Their sum rank ⊕det: K0(X) →H0(X; Z) ⊕Pic(X) is a surjective ring map. The ring structure on H0(X; Z)⊕Pic(X) is (a1, L1)·(a2, L2) = (a1a2, La2 1 ⊗La1 2 ).” — The ring map rank ⊕ det (text layer; rendered L_1^{a_2} ⊗ L_2^{a_1}).

### The γ-filtration lies in the coniveau filtration

`S.7/gamma-in-coniveau` · theorem

Let F^p_cod K_m(X) = ∪_{codim Y ≥ p} ker(K_m(X) → K_m(X − Y)) be the filtration by codimension of supports. (a) For every noetherian scheme X, F^p_γK_0(X) ⊆ F^p_cod K_0(X) (SGA 6 X, Jussila). (b) For X of finite type over a field, F^p_γK_m(X) ⊆ F^{p−m}_cod K_m(X) for all m, p ≥ 0; in particular F^{m+d+1}_γK_m(X) = 0 for d = dim X. (c) For X regular of finite type over a field, the Brown filtration equals the coniveau filtration and the Quillen spectral sequence coincides with the Brown–Gersten one from E_2 on.

**Hypotheses.**

- (a) X noetherian, cited to SGA 6 Exp. X (not public): gap. (b), (c) X of finite type over a field (Gillet–Soulé use Quillen's Gersten conjecture for varieties over a field).
- The Brown filtration and Gillet–Soulé's comparison of exact couples (their §§1–3, Theorem 2) are not decomposed here: gap.

**Proof.**

1. Brown filtration F^pK_m(X) = F^pH^{−m}(X, K) from the Postnikov tower of the K-theory simplicial sheaf; F^pK_m ⊆ F^p_cod K_m for finite-dimensional noetherian X (Gillet–Soulé Theorem 4 i), via their Theorem 2 comparing the Brown–Gersten and coniveau spectral sequences: gap.
2. F^p_γK_m ⊆ F^{p−m}K_m (Brown) for X of finite type over a field (their (26)): reduce to the universal element γ^i(id_N − N) ∈ H^0(BGL_N, K) and use the splitting principle for the Brown filtration of flag bundles (their 3.3.4, Proposition 6) and Gersten's conjecture for smooth varieties (S.4/quillen-gersten-theorem, S.4/gersten-resolution).
3. Combine; the vanishing since F^{d+1}_cod = 0 for d = dim X.
4. (c): Gillet–Soulé Theorem 4 iv, from the Gersten resolution (S.4/gersten-resolution).

**Acceptance.**

- For a regular curve (d = 1): F^2_γK_0 ⊆ F^2_cod K_0 = 0.
- For X = P^2_k, h² = [O_point] ∈ F^2_γ ⊆ F^2_cod.

**Depends on.** this roadmap: `S.7/scheme-gamma-filtration`, `S.6/scheme-lambda-algebra`, `S.6/k-theoretic-splitting-principle`, `S.4/quillen-gersten-theorem`, `S.4/gersten-resolution`, `S.4/g-coniveau-spectral-sequence`, `S.4/codimension-support-filtration`.

**Sources.**

- `GilletSoule.1999`, Introduction (p. 1): “The purpose of this paper is to compare the analogous filtrations for the higher K-groups of X. When X is of finite type over a field we prove: F^p_γK_m(X) ⊂ F^{p−m}_{cod}K_m(X).” — Part (b); (a) is attributed there to Jussila, SGA 6 Exp. X.
- `GilletSoule.1999`, Theorem 4 (p. 51): “iv) When X is regular of finite type over a field the Quillen spectral sequence ([Q2] § 7.5) coincides from E_2 on with the Brown-Gersten spectral sequence ([B-G] § 3 Corollary). In particular F^pK_m(X) = F^p_{cod}K_m(X) in that case.” — Part (c).

### Cycles map onto the coniveau graded pieces of K_0

`S.7/cycle-class-to-graded-k0` · lemma

Let X be a noetherian scheme, and for p ≥ 0 let Z^p(X) be the free abelian group on integral closed subschemes of codimension p (Mathlib's AlgebraicCycle with finite support). The map [Z] ↦ [O_Z] induces a surjection Z^p(X) → gr^p_cod G_0(X) = F^p_cod/F^{p+1}_cod, which factors through rational equivalence: CH^p(X) → gr^p_cod G_0(X). For X regular of finite type over a field, CH^p(X) = E_2^{p,−p} of the coniveau spectral sequence and this map is its edge map; with ⊗ℚ it is an isomorphism (S.7/gamma-chow-comparison).

**Hypotheses.**

- X noetherian; G_0 = K_0 of coherent sheaves (= K_0(X) for X regular separated, S.2/cartan-equivalence).

**Proof.**

1. F^p_cod G_0(X) is generated by classes of coherent sheaves supported in codimension ≥ p (S.4/coherent-codimension-filtration); such a sheaf has a filtration with quotients O_Z-modules for integral Z, and modulo F^{p+1} only the generic lengths at codimension-p points count, giving surjectivity.
2. Rational equivalence: for W integral of codimension p − 1 and f ∈ k(W)^×, the image of div(f) is the d_1-image of f ∈ K_1(k(W)), which vanishes in E_2 and hence in gr^p_cod; this is the computation of S.4/coniveau-chow-group (E_2^{p,−p} = CH^p).
3. Edge map identification: S.4/g-coniveau-spectral-sequence.

**Acceptance.**

- For a regular curve, CH^1(X) = Pic(X) → gr^1 K_0 = F^1_γ K_0 is [x] ↦ [O_x] = 1 − [O(−x)].
- For X = P^n_k, CH^p = ℤ·[P^{n−p}] ↦ h^p.

**Depends on.** this roadmap: `S.4/coherent-codimension-filtration`, `S.4/coniveau-chow-group`, `S.4/g-coniveau-spectral-sequence`, `S.2/cartan-equivalence`; libraries: `mathlib:AlgebraicGeometry.AlgebraicCycle`.

**Sources.**

- `Kbook.2013`, Proof of Corollary II.8.9.1 (PDF p. 163): “By 6.4.3, there is a canonical surjection CH^i(X) → F^iK0(X)/F^{i+1}K0(X) sending [Z] to the class of [O_Z];” — The statement for nonsingular X.
- `Soule.1985`, Proof of Théorème 5 iii) (p. 527): “Par ailleurs, Quillen a montré l'égalité CH^i(X) = E_2^{i,−i}(X)” — The identification with the coniveau spectral sequence.

### The Chern character on K_0 and G_0

`S.7/chern-character` · construction · planet “Chern character”

Let X be a smooth quasi-projective variety over a field (more generally a regular separated noetherian scheme for which SchemeAndStackFoundations SF.5 supplies Chow groups and Chern classes c_i: K_0(Vect X) → CH^i(X) with the Whitney formula, c_1(L) = [D] for L = O(D), and the splitting principle). The Chern character ch: K_0(X) → CH^*(X)_ℚ = ⊕_i CH^i(X) ⊗ ℚ is the unique additive map with ch(L) = exp(c_1(L)) = Σ c_1(L)^n/n! on line bundles and compatible with pullback; for a bundle E with Chern roots a_1, …, a_r, ch(E) = Σ_j exp(a_j), and ch_n(E) = N_n(c_1(E), …, c_n(E))/n! with the Newton polynomial N_n in the Chern classes (ch = rk + c_1 + (c_1² − 2c_2)/2 + (c_1³ − 3c_1c_2 + 3c_3)/6 + ⋯). K/G realisation: through the Cartan isomorphism K_0(X) ≅ G_0(X) (X regular separated) ch is defined on G_0(X), i.e. on classes of coherent sheaves ch[F] = Σ(−1)^i ch[E_i] for a finite locally free resolution E_• → F.

**Hypotheses.**

- X regular separated noetherian of finite dimension with the Chow-theoretic input of SF.5 (request); denominators n! occur in ch_n, so ch takes values in CH^* ⊗ ℚ.
- The Chern classes are SF.5's (RS-18: geometric Chern classes are imported); this node constructs only ch on the K/G groups.

**Proof.**

1. Chern roots: by the Chow splitting principle of SF.5 (pullback to the flag bundle of S.6/complete-flag-bundle is injective on CH^*), write c(E) = ∏(1 + a_j); the symmetric power sums Σ a_j^n are polynomials in the c_i (Newton, mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum), which defines ch_n(E) = (1/n!)Σa_j^n ∈ CH^n(X)_ℚ.
2. Additivity on exact sequences from the Whitney formula c(E) = c(E')c(E''), so ch descends to K_0(Vect X) (tauceti:TauCeti.ExactK0.lift).
3. K/G: K_0(Vect X) ≅ K_0(X) ≅ G_0(X) for X regular separated (S.2/cartan-equivalence and S.2/vector-bundle-k-theory-comparison), and the resolution formula is additivity.
4. Uniqueness: an additive, pullback-compatible map is determined on line bundles by the splitting principle.

**API.**

- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter` (constructor): ch: K_0(X) → CH^*(X) ⊗ ℚ.
- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_line` (simp): ch([L]) = exp(c_1(L)).
- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_add` (simp): ch(x + y) = ch(x) + ch(y).
- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_mul` (simp): ch(xy) = ch(x)ch(y) (S.7/chern-character-ring-homomorphism).
- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_pullback` (functoriality): ch(f^*x) = f^*ch(x).
- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_degree_zero` (simp): ch_0 = rank and ch_1 = c_1 = [det].
- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_coherent` (compatibility): ch on G_0(X) via the Cartan isomorphism: ch[F] = Σ(−1)^ich[E_i] for a locally free resolution.
- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_adams` (relation): ch_n(ψ^kx) = k^nch_n(x) (S.7/chern-character-adams).

**Unit tests.**

- `chernCharacter_trivial` (degenerate): ch(O_X^r) = r.
- `chernCharacter_P1` (computation): On P^1_k, ch(O(n)) = 1 + n·[pt] and ch(1 − [O(−1)]) = [pt].
- `chernCharacter_P2_point` (computation): On P^2_k with h = c_1(O(1)): ch([O_pt]) = ch((1 − [O(−1)])²) = (1 − e^{−h})² = h² = [pt].
- `chernCharacter_not_total_chern` (non-example): ch is not the total Chern class c: c is multiplicative on sums (c(x + y) = c(x)c(y)) while ch is additive; for L ⊕ L, c = (1 + a)² but ch = 2e^{a}.
- `chernCharacter_gamma_compat` (compatibility): ch_n vanishes on F^{n+1}_γ ⊗ ℚ and on K_0^{(i)}, i ≠ n, and for x ∈ F^n_γ, ch_n(x) = (−1)^{n−1}c_n(x)/(n − 1)!.

**Acceptance.**

- ch(O_X^r) = r.
- On P^1_k, ch(O(n)) = 1 + n[pt].

**Used by.**

- Borel–Serre, §7 and K-book Theorem II.8.10: the Grothendieck–Riemann–Roch formula ch(f_*x)td(T_Y) = f_*(ch(x)td(T_X))
- S.7/gamma-chow-comparison: the rational isomorphism K_0(X)_ℚ ≅ CH^*(X)_ℚ
- MotivicEtaleKTheory M.6 ('Identify the cycle-theoretic Chern character with the one constructed in S.7'): the degree-zero normalisation of the higher Chern character
- EllipticKTheory E.6 (arithmetic surfaces): Riemann–Roch on regular models (through SF.5's scope)

**Depends on.** this roadmap: `S.6/complete-flag-bundle`, `S.2/cartan-equivalence`, `S.2/vector-bundle-k-theory-comparison`, `S.6/vector-bundle-lambda-ring`; other roadmaps: `SchemeAndStackFoundations:SF.5`; libraries: `mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum`, `tauceti:TauCeti.ExactK0.lift`.

**Sources.**

- `Kbook.2013`, II.4, Chern character (PDF p. 108): “The ﬁrst few terms in the expansion of the Chern character are ch(x) = ε(x) + c1(x) + 1 2[c1(x)2 −c2(x)] + 1 6[c1(x)3 −3c1(x)c2(x) + 3c3(x)] + · · ·” — The expansion in Chern classes. The printed degree-two term (c_1² − c_2)/2 is corrected to (c_1² − 2c_2)/2 (sourceIssues): for a sum of two line bundles with roots a, b, (a² + b²)/2 = ((a + b)² − 2ab)/2.
- `BorelSerre.1958`, §6 (p. 112): “De même, on définit la classe « exponentielle » de Chern, notée ch(x) (qui est aussi un élément de A(X) ⊗ Q) en posant ch(x) = rg(x) + Σ(e^{α_i} − 1)” — Borel–Serre's definition through Chern roots, with the rank term.

### The Chern character is a natural ring homomorphism

`S.7/chern-character-ring-homomorphism` · lemma

In the setting of S.7/chern-character: ch(xy) = ch(x)ch(y), ch(1) = 1, ch(f^*x) = f^*ch(x) for morphisms f: X' → X of such schemes, ch(L) = exp(c_1(L)), and ch_0 = rank, ch_1 = c_1 = c_1(det).

**Hypotheses.**

- As in S.7/chern-character.

**Proof.**

1. By the Chow splitting principle (SF.5, request) reduce to sums of line bundles: if p = Σ[L_i] and q = Σ[M_j] with roots a_i, b_j, then pq = Σ[L_i ⊗ M_j] has roots a_i + b_j (c_1(L ⊗ M) = c_1(L) + c_1(M), SF.5), and Σexp(a_i + b_j) = Σexp(a_i)Σexp(b_j).
2. Pullback: Chern classes commute with pullback (SF.5); ch is a polynomial in them.
3. ch_1 = Σa_i = c_1(E) = c_1(det E).

**Acceptance.**

- ch([L]^n) = exp(nc_1(L)).
- ch(x²) = ch(x)² for x = 1 − [O(−1)] on P^1: both sides are 0.

**Depends on.** this roadmap: `S.7/chern-character`, `S.6/k-theoretic-splitting-principle`; other roadmaps: `SchemeAndStackFoundations:SF.5`.

**Sources.**

- `Kbook.2013`, Proposition II.4.12 (PDF p. 108): “If Q ⊂A then the Chern character is a ring homomorphism ch: K →ˆA.” — The statement, proved by the splitting principle as here.
- `BorelSerre.1958`, §6 (p. 112): “On a ch(x + y) = ch(x) + ch(y) et ch(xy) = ch(x).ch(y), en vertu des propriétés analogues des fibrés à fibre vectorielle.” — Borel–Serre's statement.

### The Chern character diagonalises the Adams operations

`S.7/chern-character-adams` · lemma

In the setting of S.7/chern-character, for every k ≥ 1 and n ≥ 0: ch_n(ψ^k(x)) = k^n ch_n(x), and c_n(ψ^k(x)) = k^n c_n(x). Consequently ch_n vanishes on K_0(X)^{(i)}_ℚ for i ≠ n, and ch: K_0(X)_ℚ = ⊕_iK_0(X)^{(i)}_ℚ → ⊕CH^i(X)_ℚ is graded.

**Hypotheses.**

- As in S.7/chern-character; ψ^k is the Adams operation of S.6/vector-bundle-lambda-ring.

**Proof.**

1. Splitting principle (SF.5 for CH, S.6/k-theoretic-splitting-principle for K_0): for x = Σ[L_i], ψ^k(x) = Σ[L_i^{⊗k}] (S.6/adams-additivity-square-zero), whose roots are ka_i, so ch_n(ψ^kx) = Σ(ka_i)^n/n! = k^nch_n(x); similarly c_n is homogeneous of degree n in the roots.
2. On K^{(i)}, ψ^k = k^i, so k^ich_n(x) = k^nch_n(x) forces ch_n(x) = 0 for i ≠ n (ℚ-coefficients).

**Acceptance.**

- ch(ψ²(1 − [O(−1)])) = ch(1 − [O(−2)]) = 2[pt] on P^1.
- ch_0(ψ^kx) = ch_0(x) (rank).

**Depends on.** this roadmap: `S.7/chern-character`, `S.7/chern-character-ring-homomorphism`, `S.6/adams-additivity-square-zero`, `S.6/k-theoretic-splitting-principle`, `S.6/rational-weight-decomposition`; other roadmaps: `SchemeAndStackFoundations:SF.5`.

**Sources.**

- `Kbook.2013`, Proposition II.4.11.3 (PDF p. 107): “Then cn(ψkx) = kncn(x) for all x ∈K.” — The statement for Chern classes; Corollary II.4.11.4 and II.4.12.1 give the vanishing on other weights.

### Chern classes of the structure sheaf of a subvariety

`S.7/chern-class-of-subvariety` · lemma

Let X be a smooth quasi-projective variety over a field and Z ⊆ X an integral closed subvariety of codimension i. Then c_j([O_Z]) = 0 for 1 ≤ j < i and c_i([O_Z]) = (−1)^{i−1}(i − 1)!·[Z] in CH^i(X); equivalently ch([O_Z]) = [Z] + (terms in CH^{>i}(X)_ℚ). For i = 1, c_1(O_D) = [D]. The sign is (−1)^{i−1} (not (−1)^i as printed in the K-book's Ex. II.8.7): check i = 1, O_D = 1 − O(−D), c_1 = −c_1(O(−D)) = [D].

**Hypotheses.**

- X smooth quasi-projective over a field; Z integral of codimension i. The reduction to complete intersections (removing a closed subset of Z) needs the localisation sequence for Chow groups (SF.5) and the fact that the statement only concerns the coefficient of [Z].

**Proof.**

1. Localise: replacing X by an open U meeting Z, with Z ∩ U a complete intersection of divisors D_1, …, D_i in U (Z generically smooth in smooth X is a local complete intersection), changes neither the vanishing nor the coefficient of [Z] modulo cycles supported off U (localisation for CH, SF.5; request).
2. For a complete intersection, the Koszul resolution gives [O_Z] = ∏_{j=1}^{i}(1 − [O(−D_j)]) in K_0(U), so ch([O_Z]) = ∏(1 − e^{−[D_j]}) = [D_1]⋯[D_i] + higher = [Z] + higher (intersection product of SF.5).
3. For x ∈ F^i with ch = [Z] + higher, the Newton relation ch_i = (−1)^{i−1}c_i/(i − 1)! + (terms in c_1,…,c_{i−1}) and the vanishing of c_j for j < i give c_i = (−1)^{i−1}(i − 1)![Z].

**Acceptance.**

- For a point P on a surface (i = 2): c_2(O_P) = −[P].
- For a divisor D: c_1(O_D) = [D].

**Depends on.** this roadmap: `S.7/chern-character`, `S.7/chern-character-ring-homomorphism`; other roadmaps: `SchemeAndStackFoundations:SF.5`.

**Sources.**

- `Kbook.2013`, Ex. II.8.7 (PDF p. 165): “Suppose that Z is a codimension i subvariety of a nonsingular X, with conormal bundle E; E →OX →OZ →0 is exact. Show that ci([OZ]) = (−1)i(i−1)![Z] in CHi(X).” — The statement with the printed sign (−1)^i, corrected to (−1)^{i−1} (sourceIssues).
- `Kbook.2013`, Proof of Corollary II.8.9.1 (PDF p. 163): “removing a closed subvariety of Z, we can assume that Z is a complete intersection. In that case, ci(OZ) ∼= (−1)i(i −1)![Z] by Ex. 8.7.” — The reduction to complete intersections; the same sign correction applies.

### Grothendieck's comparison of the γ-filtration with Chow groups

`S.7/gamma-chow-comparison` · theorem · planet “γ–Chow comparison”

Let X be a smooth quasi-projective variety over a field k of dimension d (Soulé: X regular of finite type over a field). Then: (a) ch ⊗ ℚ: K_0(X)_ℚ → CH^*(X)_ℚ is an isomorphism of rings, graded for the Adams decomposition: ch_i: K_0(X)^{(i)}_ℚ ≅ CH^i(X)_ℚ; (b) gr^i_γK_0(X)_ℚ ≅ K_0(X)^{(i)}_ℚ ≅ gr^i_cod K_0(X)_ℚ ≅ CH^i(X)_ℚ, with F^i_γK_0(X)_ℚ = F^i_cod K_0(X)_ℚ, where CH^i → gr^i_cod is [Z] ↦ [O_Z] and c_i: gr^i_γ → CH^i is multiplication by (−1)^{i−1}(i − 1)! on the identified groups; (c) integrally, K_0(X) = ⊕_{p=0}^{d} E_2^{p,−p}(X) = ⊕_{p=0}^{d}CH^p(X) modulo 𝒮_d (groups of exponent divisible only by 2 and primes < d). The integral groups gr^i_γK_0(X) and CH^i(X) are not claimed isomorphic (they differ by torsion).

**Hypotheses.**

- X smooth quasi-projective over a field (regular of finite type suffices for (b), (c)); the Chow groups and Chern classes are SF.5's.

**Proof.**

1. (b), weight side: by S.6/adams-on-coniveau (ii), ψ^k acts on the codimension-p column E_1^{p,−p} = ⊕_{x∈X^{(p)}}K_0(k(x)) by k^p; hence E_∞^{p,−p} ⊗ ℚ = gr^p_cod K_0(X)_ℚ is the weight-p part and F^p_cod K_0 ⊗ ℚ = ⊕_{i≥p}K^{(i)}_ℚ = F^p_γ ⊗ ℚ (S.6/scheme-weight-decomposition).
2. E_2^{p,−p} = CH^p(X) (S.4/coniveau-chow-group) and the differentials into and out of the diagonal vanish rationally since they join different weights (S.6/residue-weight-shift (b)); so CH^p_ℚ ≅ gr^p_cod K_0(X)_ℚ via S.7/cycle-class-to-graded-k0.
3. (a): ch_p is zero on K^{(i)}, i ≠ p (S.7/chern-character-adams), and ch_p([O_Z]) = [Z] for Z of codimension p modulo higher codimension (S.7/chern-class-of-subvariety); hence ch_p ∘ (CH^p_ℚ ≅ K^{(p)}_ℚ) is the identity, and ch ⊗ ℚ is an isomorphism; it is a ring map by S.7/chern-character-ring-homomorphism.
4. c_i on gr^i_γ: for x ∈ F^i_γ, c_i(x) = γ^i(x) modulo F^{i+1}, and γ^i acts on gr^i by (−1)^{i−1}(i − 1)! (S.6/adams-eigenvalue-on-gamma-graded).
5. (c): Soulé Théorème 4 iv (S.6/adams-on-coniveau (iv)).

**Acceptance.**

- For X = P^n_k: K_0(P^n)_ℚ ≅ ℚ[h]/(h^{n+1}) ≅ CH^*(P^n)_ℚ with ch(1 − [O(−1)]) = 1 − e^{−H}, H the hyperplane class.
- For a smooth projective curve: K_0(X) = ℤ ⊕ Pic(X) integrally and CH^1 = Pic (d = 1, 𝒮_1 = 0).

**Depends on.** this roadmap: `S.6/adams-on-coniveau`, `S.6/scheme-weight-decomposition`, `S.6/residue-weight-shift`, `S.4/coniveau-chow-group`, `S.7/cycle-class-to-graded-k0`, `S.7/chern-character-adams`, `S.7/chern-class-of-subvariety`, `S.7/chern-character-ring-homomorphism`, `S.6/adams-eigenvalue-on-gamma-graded`, `S.7/scheme-gamma-filtration`; other roadmaps: `SchemeAndStackFoundations:SF.5`.

**Sources.**

- `Kbook.2013`, Corollary II.8.9.1 (PDF p. 162): “If X is nonsingular, the Chern classes induce isomorphisms ci : K(i) 0 (X) ∼= CHi(X) ⊗Q, and the Chern character induces a ring isomor- phism ch : K0(X) ⊗Q ∼= CH∗(X) ⊗Q.” — Parts (a) and (b) (text layer; rendered K_0^{(i)}(X)).
- `Soule.1985`, Théorème 4 iv) (p. 521): “De plus, K_0(X) = ⊕_{p=0}^{d} E_2^{p,−p}(X) (modulo 𝒮_d)” — Part (c).

### The Chern character into the γ-graded K-theory

`S.7/gamma-chern-character` · construction

Let K be an augmented special λ-ring (or a K_0-λ-algebra such as K^Y(X) or K(A)) with a γ-filtration of finite length after ⊗ℚ. The γ-Chern character ch = ⊕_{i≥0}ch_i: K → ⊕_i gr^i_γK ⊗ ℚ is ch_0 = ε and, for i > 0, ch_i(x) = the class of (1/i!)N_i(γ^1(x − ε(x)), …, γ^i(x − ε(x))) in gr^i_γ ⊗ ℚ, N_i the Newton polynomial. It is a ring homomorphism commuting with all natural operations, ch_i(ψ^kx) = k^ich_i(x), compatible with products on K-theory of schemes and with pullback, and ch ⊗ 1: K_m(X)_ℚ → ⊕_i gr^i_γK_m(X)_ℚ is an isomorphism for X regular of finite dimension (also with supports). This is the Chern character in which Soulé states Riemann–Roch with denominators (S.7/g-theory-adams-operations); the higher Chern character into higher Chow groups or motivic cohomology is MotivicEtaleKTheory's.

**Hypotheses.**

- K augmented special λ-ring with F^N_γ ⊗ ℚ = 0 for some N (true for K_m(X), X regular noetherian of finite dimension: S.6/scheme-gamma-bound).

**Proof.**

1. Define ch_i by the formula; with Chern roots (S.6/lambda-identity-principle, augmented case) γ^j(x − ε(x)) = e_j(u) with u_j = ξ_j − 1 and (1/i!)N_i(e(u)) = (1/i!)Σu_j^i, so ch_i is the degree-i term of Σ(e^{log(1+u_j)}) computed in gr_γ: additivity and multiplicativity are identities of power sums.
2. ch_i(ψ^kx) = k^ich_i(x) since ψ^k = k^i on gr^i (S.6/adams-eigenvalue-on-gamma-graded).
3. Isomorphism: for x ∈ F^i_γ every γ^j(x) lies in F^i_γ (natural operations preserve the filtration, S.6/adams-eigenvalue-on-gamma-graded), so modulo F^{2i} ⊆ F^{i+1} only the linear term (−1)^{i−1}iγ^i(x) of N_i survives and ch_i(x) ≡ (−1)^{i−1}γ^i(x)/(i − 1)! ≡ x; hence ch is filtered with graded map the identity, and an isomorphism after ⊗ℚ since the filtration is finite.
4. Products and pullback: operations and products are compatible with both (S.6/scheme-adams-multiplicative, S.6/operations-functoriality).

**API.**

- `TauCeti.AlgebraicGeometry.KTheory.gammaChern` (constructor): ch: K_m(X) → ⊕_i gr^i_γK_m(X) ⊗ ℚ.
- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_add` (simp): ch is additive.
- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_mul` (simp): ch(xy) = ch(x)ch(y) for the product on K_*(X).
- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_adams` (relation): ch_i ∘ ψ^k = k^ich_i.
- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_bijective` (equivalence): ch ⊗ 1 is an isomorphism K_m(X)_ℚ ≅ ⊕gr^i_γK_m(X)_ℚ.
- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_pullback` (functoriality): ch commutes with f^*.

**Unit tests.**

- `gammaChern_zero` (degenerate): ch(0) = 0 and ch_0 = ε.
- `gammaChern_line` (computation): For a line element ℓ, ch(ℓ) = Σ_i (ℓ − 1)^i/i! computed in gr_γ, i.e. ch_i(ℓ) = (ℓ − 1)^i/i! in gr^i: the γ-graded analogue of exp(c_1(ℓ)), with ℓ − 1 in F^1_γ.
- `gammaChern_not_identity_integrally` (non-example): ch is not defined integrally: on K_0(P^2), ch_2(h) = −h²/2 ∉ gr^2_γK_0(P^2) = ℤh² (h = 1 − [O(−1)]).
- `gammaChern_chow_compat` (compatibility): For X smooth over a field, composing with gr^i_γK_0(X)_ℚ ≅ CH^i(X)_ℚ (S.7/gamma-chow-comparison) gives S.7/chern-character.

**Acceptance.**

- For K = K_0(P^1): ch(1 − [O(−1)]) = (1 − [O(−1)]) ∈ gr^1.
- On K_1(A) (weight 1 part A^× ⊗ ℚ), ch_1 is the projection to gr^1_γK_1(A)_ℚ = A^× ⊗ ℚ.

**Used by.**

- Soulé 1985, Théorème 7: σ = ch·Td on G-theory and η(x) = ch(x)·Td(X)
- MotivicEtaleKTheory M.6: the higher Chern character must restrict to this in degree zero
- Polylogarithms P.3/P.4: gr^n_γK_{2n−i}(F)_ℚ as the target of the comparison with polylogarithmic complexes

**Depends on.** this roadmap: `S.6/gamma-filtration`, `S.6/lambda-identity-principle`, `S.6/adams-eigenvalue-on-gamma-graded`, `S.6/rational-weight-decomposition`, `S.6/scheme-gamma-bound`, `S.6/scheme-adams-multiplicative`, `S.6/operations-functoriality`; libraries: `mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum`.

**Sources.**

- `Soule.1985`, 7.1 (p. 532): “où ch_0 = ε, et, si i > 0, ch_i(x) est la classe de l'élément (1/i!)N_i(γ^1(x − ε(x)), …, γ^i(x − ε(x))), et N_i le i-ème polynôme de Newton.” — The definition; Soulé adds that ch is a ring homomorphism commuting with 𝒯, that ch ⊗ 1 is an isomorphism, and that ch(xy) = ch(x)ch(y) on higher K-theory.

### Proper pushforward on K_0 and G_0 is the Euler characteristic

`S.7/pushforward-euler-class` · lemma

Let f: X → Y be a proper morphism of noetherian schemes. On π_0, S.2's pushforward f_*: G_0(X) → G_0(Y) sends [F] to Σ_{q≥0}(−1)^q[R^qf_*F] (a finite sum). If f is moreover perfect (e.g. X, Y regular, or f flat), the K-theory pushforward f_*: K_0(X) → K_0(Y) of S.2 satisfies f_*[E] = [Rf_*E] = Σ(−1)^q[R^qf_*E] under the Cartan maps, and the Cartan maps commute with f_*. For a closed immersion i, i_*[F] = [i_*F].

**Hypotheses.**

- f proper, X, Y noetherian; perfectness for the K-version.

**Proof.**

1. S.2's G-theory pushforward is induced by Rf_* on cohomologically bounded pseudo-coherent (or coherent) complexes (S.2/g-theory-proper-pushforward, TT 3.16.1); on K_0 = K_0(D^b_coh) (S.2/g-theory-models) the class of a complex is the alternating sum of the classes of its cohomology sheaves, giving Σ(−1)^q[R^qf_*F].
2. For perfect f, Rf_* preserves perfect complexes and the inclusion Perf ⊂ D^b_coh commutes with Rf_* (S.2/k-theory-proper-pushforward, S.2/cartan-map), so the Cartan maps commute with f_*.
3. Finiteness: R^qf_* = 0 for q > dim of fibres (coherent cohomology vanishing, S.2/proper-pushforward-coherent).

**Acceptance.**

- For π: P^1_k → Spec k, π_*[O(n)] = n + 1 for n ≥ −1 and = n + 1 in general (h^0 − h^1).
- For a finite morphism, f_*[F] = [f_*F].

**Depends on.** this roadmap: `S.2/g-theory-proper-pushforward`, `S.2/k-theory-proper-pushforward`, `S.2/g-theory-models`, `S.2/cartan-map`, `S.2/proper-pushforward-coherent`.

**Sources.**

- `Kbook.2013`, Example II.8.2.3 (PDF p. 155): “If f : X →Y is a proper morphism of separated noetherian schemes with Y regular, we can use the transfer G0(X) →G0(Y ) of Lemma 6.2.6 to get a functo- rial transfer map f∗: K0(X) →K0(Y ), this time sending [F] to P(−1)i[Rif∗F].” — The Euler-characteristic form of the pushforward (text layer; rendered Σ(−1)^i[R^if_*F]).
- `BorelSerre.1958`, §5d (p. 110): “Si ℱ est cohérent sur Y, on a vu (théorème 1, § 3) que les R^qf(ℱ), q = 0, 1, …, sont des faisceaux cohérents sur X, et leur somme alternée est un élément bien défini de K(X).” — The pushforward f_! used in the classical Riemann–Roch theorem.

### Grothendieck–Riemann–Roch on the K/G pushforward

`S.7/grothendieck-riemann-roch` · theorem · planet “Grothendieck–Riemann–Roch”

Let f: X → Y be a projective morphism of smooth quasi-projective varieties over a field k (Borel–Serre: a proper morphism of nonsingular quasi-projective irreducible varieties over an algebraically closed field). Then for x ∈ K_0(X), ch(f_*(x))·td(T_Y) = f_*(ch(x)·td(T_X)) in CH^*(Y)_ℚ, where f_* on K_0 is the pushforward of SchemeKTheoryOperations S.2 (π_0 of the K-theory pushforward, equal under Cartan to the G-theory one), f_* on CH^* is proper pushforward, ch is S.7/chern-character and td(E) = ∏a_j/(1 − e^{−a_j}) over the Chern roots of E (td = 1 + c_1/2 + (c_1² + c_2)/12 + ⋯). The denominators of td and ch are retained; the integral refinement is S.7/adams-riemann-roch. This node proves the compatibility of the imported geometric GRR (SchemeAndStackFoundations SF.5, for the Euler-characteristic pushforward f_! = Σ(−1)^qR^qf_*) with the actual K/G pushforward; it does not extend SF.5's source scope.

**Hypotheses.**

- f projective between smooth quasi-projective k-varieties (proper suffices over an algebraically closed field in Borel–Serre); X, Y connected or componentwise.
- The geometric theorem (Borel–Serre §§7–16; SGA 6 VIII; Fulton 15.2) is SF.5's: request.

**Proof.**

1. S.7/pushforward-euler-class identifies π_0 of S.2's f_* with f_! = Σ(−1)^q[R^qf_*] on K_0(X) = G_0(X) (X, Y regular, f perfect since X, Y smooth over k).
2. SF.5 supplies ch(f_!y)·td(T_Y) = f_*(ch(y)·td(T_X)) for y ∈ G_0(X) (request, Borel–Serre's statement and proof by factorisation into a closed immersion and a projection X × P → X, their Lemmas 15–16 and §§9–16).
3. Substitute y = x.

**Acceptance.**

- For f: P^1_k → Spec k and x = [O(n)]: f_*x = n + 1 and deg(ch(O(n))td(P^1)) = deg((1 + n·pt)(1 + pt)) = n + 1.
- For f a closed immersion of a point in a curve: ch(f_*[k]) = [pt] (no correction since td(T_pt) = 1 and td(T_X) = 1 + c_1/2 restricts trivially).

**Depends on.** this roadmap: `S.7/pushforward-euler-class`, `S.7/chern-character`, `S.7/chern-character-ring-homomorphism`, `S.2/k-theory-proper-pushforward`, `S.2/cartan-equivalence`; other roadmaps: `SchemeAndStackFoundations:SF.5`.

**Sources.**

- `BorelSerre.1958`, §7 (p. 113): “THÉORÈME DE RIEMANN-ROCH. — f_*(ch(y).T(Y)) = ch(f_!(y)).T(X).” — Borel–Serre's statement for f: Y → X proper, X, Y nonsingular quasi-projective irreducible, with f_! the alternating sum of the R^qf_*; T is the Todd class.
- `Kbook.2013`, Theorem II.8.10 (PDF p. 163): “More generally, if f : X →Y is a smooth projective morphism, then the pushforward f∗: K0(X) →K0(Y ) satisﬁes ch(f∗x) = f∗(ch(x) · td(Tf)),” — The relative form; the K-book cites Fulton for it.

### Hirzebruch–Riemann–Roch and the curve case

`S.7/hirzebruch-riemann-roch` · application

(a) For a smooth projective variety X over a field k and a coherent sheaf F, χ(X, F) = Σ(−1)^i dim_k H^i(X, F) = deg(ch(F)·td(T_X)) (the degree of the dimension-zero component). (b) For a smooth projective geometrically connected curve X of genus g over k and a divisor D: χ(O(D)) = deg D + 1 − g; with Serre duality, dim H^0(O(D)) − dim H^0(O(K − D)) = deg D + 1 − g, which is Tau Ceti's Riemann–Roch for the function field k(X) (TauCeti.exists_isRiemannRochDivisor).

**Hypotheses.**

- (a) X smooth projective over k; (b) X a smooth projective curve with H^0(X, O_X) = k (exact constant field of k(X)), and the identification of H^0(X, O(D)) with the Riemann–Roch space of D and of the genus with Tau Ceti's genus is JacobianChallenge layer B (request).

**Proof.**

1. (a): S.7/grothendieck-riemann-roch for f: X → Spec k, where f_*[F] = χ(X, F) (S.7/pushforward-euler-class) and ch on K_0(k) = ℤ is the rank.
2. (b): ch(O(D)) = 1 + [D], td(T_X) = 1 + c_1(T_X)/2 = 1 − K/2 with deg K = 2g − 2, so deg(ch·td) = deg D − (2g − 2)/2 = deg D + 1 − g.
3. Compatibility: with dim H^0(O(D)) = ℓ(D) and dim H^1(O(D)) = ℓ(W − D) (Serre duality, JacobianChallenge layer B), χ(O(D)) = ℓ(D) − ℓ(W − D), which Tau Ceti proves equal to deg D + 1 − g for its genus (tauceti:TauCeti.exists_isRiemannRochDivisor, tauceti:TauCeti.genus).

**Acceptance.**

- χ(P^1, O(n)) = n + 1.
- For an elliptic curve (g = 1): χ(O(D)) = deg D.

**Depends on.** this roadmap: `S.7/grothendieck-riemann-roch`, `S.7/pushforward-euler-class`; libraries: `tauceti:TauCeti.exists_isRiemannRochDivisor`, `tauceti:TauCeti.genus`.

**Sources.**

- `Kbook.2013`, Theorem II.8.10 (PDF p. 163): “Let X be a nonsingular projective variety over a ﬁeld k, and let E be a locally free sheaf of rank n on X. Then the Euler characteristic χ(E) = P(−1)i dim Hi(X, E) equals deg(ch(E)·td(X)).” — Part (a) (text layer; rendered χ(E) = Σ(−1)^i dim H^i(X, E)).
- `BorelSerre.1958`, §7 (p. 113): “Montrons comment le théorème de R-R, sous la forme de Grothendieck, entraine la formule de R. R. Hirzebruch [9] :” — The deduction of (a) from GRR.

### Soulé's Adams operations and filtration on G-theory

`S.7/g-theory-adams-operations` · construction

Let S be a regular noetherian irreducible scheme of finite Krull dimension and 𝒱_S the category of quasi-projective S-schemes. For X ∈ 𝒱_S there are operations φ^k: K'_m(X) ⊗ ℤ[1/k] → K'_m(X) ⊗ ℤ[1/k] (k ∈ ℤ − {0}), a finite increasing filtration F_jK'_m(X) ⊗ ℚ (j ∈ ℤ) and an isomorphism σ: K'_m(X) ⊗ ℚ → ⊕_j Gr_jK'_m(X) ⊗ ℚ, where K' = G-theory. For a closed immersion f: X → M into M smooth and equidimensional of dimension d over S, with M → S surjective and f_*: K'_m(X) ≅ K^X_m(M) (dévissage): F^M_jK'_m(X)_ℚ = f_*^{−1}(F^{d−j}_γK^X_m(M)_ℚ), k^{dim S}φ^k_M(α) = f_*^{−1}(ψ^k(f_*α)·θ^k(M)) with θ^k(M) = θ^k(−T^∨_M) ∈ K_0(M) ⊗ ℤ[1/k] (S.6/bott-cannibalistic-class), and σ^M(α) = f_*^{−1}(ch(f_*α)·Td(M)) (S.7/gamma-chern-character, Td(M) the Todd class of T_M relative to S in ⊕gr^i_γK_0(M)_ℚ). These do not depend on the embedding. φ^k preserves F_j and acts on Gr_j by k^{−j}; φ^kφ^l = φ^{kl}; φ^k commutes with σ.

**Hypotheses.**

- S regular noetherian irreducible of finite Krull dimension; X quasi-projective over S (possibly singular: this is the K/G realisation for singular schemes).
- The normalisation k^{dim S} makes φ^k act on Gr_j by exactly k^{−j} (ε(θ^k(M)) = k^{−d+dim S}).

**Proof.**

1. Define φ^k_M, F^M_j, σ^M through an embedding as stated, using S.6/soule-scheme-operations on the support K-theory of the regular M and dévissage (S.3/regular-support-devissage).
2. φ^k_M preserves F^M_j and acts on Gr^M_j by k^{d−j}k^{−d} = k^{−j}, because ψ^k = k^{d−j} on gr^{d−j}_γ (S.6/adams-eigenvalue-on-gamma-graded) and θ^k(M) ≡ k^{−d+dim S} modulo F^1; φ^kφ^l = φ^{kl} from θ^{kl} = ψ^k(θ^l)θ^k (S.6/bott-cannibalistic-class).
3. Independence of the embedding: for X → M → M' closed immersions with normal bundle N of M in M', S.6/riemann-roch-without-denominators gives g_*(ψ^k(α)θ^k(N)) = ψ^k(g_*α), and θ^k(N) = θ^k(M)g^*(θ^k(M'))^{−1}, Td(N^∨)^{−1} = Td(M)g^*(Td(M'))^{−1}, so the projection formula (S.6/product-pullback-compatibility) identifies the M- and M'-definitions; for two embeddings compare both with X → M × M' (open subsets of projective spaces, Soulé's steps 6–7), using S.6/operations-functoriality for open immersions.
4. For σ the same argument with GRR for g_* in the γ-graded form: g_*(ch(α)Td(N^∨)^{−1}) = ch(g_*α), from S.6/riemann-roch-without-denominators and the γ-Chern character.

**API.**

- `TauCeti.AlgebraicGeometry.KTheory.gAdams` (constructor): φ^k on K'_m(X) ⊗ ℤ[1/k] for X quasi-projective over a regular S.
- `TauCeti.AlgebraicGeometry.KTheory.gFiltration` (constructor): The increasing filtration F_jK'_m(X) ⊗ ℚ.
- `TauCeti.AlgebraicGeometry.KTheory.gRiemannRoch` (constructor): σ: K'_m(X)_ℚ ≅ ⊕Gr_jK'_m(X)_ℚ.
- `TauCeti.AlgebraicGeometry.KTheory.gAdams_graded` (characterisation): φ^k acts on Gr_j by k^{−j}.
- `TauCeti.AlgebraicGeometry.KTheory.gAdams_comp` (relation): φ^kφ^l = φ^{kl}.
- `TauCeti.AlgebraicGeometry.KTheory.gAdams_embedding_indep` (extensionality): The definitions do not depend on the closed immersion into a smooth M.
- `TauCeti.AlgebraicGeometry.KTheory.gAdams_smooth` (compatibility): On smooth X, η(φ^kx) = ψ^k(η x)θ^k(X) and η(x) = ch(x)Td(X) under Poincaré duality η: K'_m(X) ≅ K_m(X).

**Unit tests.**

- `gAdams_smooth` (compatibility): For X smooth over S = Spec k (dim S = 0): φ^k(x) = ψ^k(x)θ^k(X) under K' = K.
- `gAdams_point` (degenerate): For X = S = Spec k: θ^k(Spec k) = 1, φ^k = ψ^k and F_0 = everything on K'_0 = ℤ.
- `gAdams_curve_point` (computation): For a closed point x of a smooth curve X over k (S = Spec k, M = X): φ^k[O_x] = ψ^k[O_x]·θ^k(X) = k[O_x]·k^{−1}(1 + y) with y ∈ F^1_γK_0(X), and [O_x]·y ∈ F^2_γ = 0, so φ^k[O_x] = [O_x]: points have homological weight 0.
- `gAdams_not_psi` (non-example): φ^k ≠ ψ^k on smooth X of positive dimension: on X = P^1_k, φ^k(1) = θ^k(P^1) = θ^k(−T^∨) ≠ 1 = ψ^k(1), since θ^k(T^∨_{P^1}) = 1 + [O(−2)] + ⋯ + [O(−2(k − 1))] ≠ 1 for k ≥ 2.

**Acceptance.**

- For X smooth over S the construction reduces to X = M: φ^k(α) = k^{−dim S}ψ^k(α)θ^k(X).
- For X a point Spec k over S = Spec k: φ^k = id on K'_m(k) ⊗ ℤ[1/k] up to ψ^k, F_0 everything.

**Used by.**

- Soulé 1985, Théorèmes 8–9: Beilinson's 'universal' homology Gr_jK'_m(X)_ℚ, covariant for projective maps
- S.7/adams-riemann-roch: the Adams–Riemann–Roch formula for projective morphisms
- EllipticKTheory E.6 and EllipticRegulators ER.6 (integral parts on regular models): weights on G-theory of possibly singular fibres of arithmetic surfaces

**Depends on.** this roadmap: `S.6/soule-scheme-operations`, `S.3/regular-support-devissage`, `S.6/bott-cannibalistic-class`, `S.6/riemann-roch-without-denominators`, `S.6/adams-eigenvalue-on-gamma-graded`, `S.6/product-pullback-compatibility`, `S.6/operations-functoriality`, `S.7/gamma-chern-character`, `S.2/g-theory-of-a-scheme`.

**Sources.**

- `Soule.1985`, Théorème 7 (p. 533): “7.2 THÉORÈME 7. Pour tout schéma X de 𝒱_S il existe des opérations φ^k: K'_m(X) ⊗ Z[1/k] → K'_m(X) ⊗ Z[1/k], k ∈ Z − {0}, une filtration croissante finie F_jK'_m(X) ⊗ Q, j ∈ Z, et un isomorphisme σ: K'_m(X) ⊗ Q → ⊕_j Gr_jK'_m(X) ⊗ Q” — The statement; i) φ^k(F_j) ⊂ F_j, φ^k acts on Gr_j by k^{−j}, φ^k ∘ φ^l = φ^{kl}, φ^k commutes with σ.
- `Soule.1985`, Proof of Théorème 7, step 1 (p. 534): “On pose alors, si d = dim (M) est la dimension de Krull de M, F_j^MK'_m(X) ⊗ Q = f_*^{−1}(F_γ^{d−j}K^X_m(M) ⊗ Q),” — The definition through an embedding.

### Adams–Riemann–Roch for projective morphisms

`S.7/adams-riemann-roch` · theorem · planet “Adams–Riemann–Roch”

In the setting of S.7/g-theory-adams-operations: (i) for a projective morphism f of 𝒱_S, φ^kf_* = f_*φ^k, f_*(F_j) ⊆ F_j and σf_* = f_*σ on G-theory; (ii) for an open immersion f, φ^kf^* = f^*φ^k, f^*(F_j) ⊆ F_j, σf^* = f^*σ; (iii) φ^k(α ∩ β) = φ^k(α) ∩ ψ^k(β) and σ(α ∩ β) = σ(α) ∩ ch(β) for the cap product K'_m(X) × K_n(X) → K'_{m+n}(X), and φ^k(α ⊠ β) = φ^k(α) ⊠ φ^k(β); (iv) consequently, for a projective morphism f: X → Y of smooth quasi-projective S-schemes and x ∈ K_m(X): ψ^k(f_*x)·θ^k(Y) = f_*(ψ^k(x)·θ^k(X)) in K_m(Y) ⊗ ℤ[1/k], i.e. ψ^k(f_*x) = f_*(θ^k(−T^∨_f)·ψ^k(x)) with T_f = T_X − f^*T_Y; for a closed immersion this is S.6/gysin-weight-shift, and for m = 0 it is Grothendieck's Adams–Riemann–Roch of SGA 6.

**Hypotheses.**

- S regular noetherian irreducible of finite Krull dimension; f projective (factors as a closed immersion into P^r_Y followed by the projection).

**Proof.**

1. Factor f = π ∘ g with g: X → P^r_Y a closed immersion and π the projection; for g the statement is the embedding-independence of S.7/g-theory-adams-operations (restricting supports commutes with operations, S.6/operations-functoriality); for π it is Soulé's step 5.
2. Step 5: K^X_m(P^r_M) is free over K^X_m(M) on 1, ξ, …, ξ^r with ξ = [O(−1)] (S.5/projective-bundle-theorem), (ξ − 1)^{r+1} = 0, and θ^k(P^r_M) = θ^k(P^r_S)θ^k(M); by the projection formula it suffices to check π_*(ψ^k(ξ^j)θ^k(P^r)) = ψ^k(π_*ξ^j) in K_0(P^r_F) for a field F, which is Grothendieck's Riemann–Roch for P^r → Spec F with the identity k^r ch^{−1}(ψ^k(Td(P^r)^{−1}))ch(Td(P^r))^{−1} = θ^k(P^r) (Manin, Lemma 18.4; cited): the GRR input is SF.5's (request) or S.7/hirzebruch-riemann-roch for P^r.
3. (ii) from θ^k and Td restricting along open immersions; (iii) from multiplicativity of ψ^k and ch (S.6/scheme-adams-multiplicative, S.7/gamma-chern-character) and external products.
4. (iv): for X, Y smooth, η_Y ∘ f_* = f_* ∘ η_X (Poincaré duality commutes with proper pushforward, S.2/cartan-equivalence and S.7/pushforward-euler-class) and η(φ^kx) = ψ^k(η x)θ^k(·) (up to the common factor k^{−dim S}); combine with (i) and the projection formula.

**Acceptance.**

- For f: P^1_k → Spec k, x = 1 and k = 2: with h = 1 − [O(−1)] (h² = 0), T^∨ = O(−2) has class 1 − 2h, θ^2(−T^∨) = (1 + [O(−2)])^{−1} = (2 − 2h)^{−1} = (1 + h)/2 in K_0(P^1) ⊗ ℤ[1/2], and f_*((1 + h)/2) = (χ(O) + χ(O) − χ(O(−1)))/2 = (1 + 1 − 0)/2 = 1 = ψ²(f_*1).
- For a closed immersion with trivial normal bundle of rank c: ψ^kf_* = k^cf_*ψ^k.

**Depends on.** this roadmap: `S.7/g-theory-adams-operations`, `S.6/operations-functoriality`, `S.5/projective-bundle-theorem`, `S.6/product-pullback-compatibility`, `S.6/scheme-adams-multiplicative`, `S.7/gamma-chern-character`, `S.7/hirzebruch-riemann-roch`, `S.2/cartan-equivalence`, `S.7/pushforward-euler-class`, `S.6/gysin-weight-shift`, `S.6/external-product`; other roadmaps: `SchemeAndStackFoundations:SF.5`.

**Sources.**

- `Soule.1985`, Théorème 7 ii) (p. 533): “ii) Si f est un morphisme projectif de 𝒱_S on a φ^kf_* = f_*φ^k, f_*(F_j) ⊂ F_j, σf_* = f_*σ.” — Part (i); iii)–vi) of the theorem give (ii), (iii) and the smooth case used in (iv).
- `Soule.1985`, Proof of Théorème 7, step 5 (p. 537): “On utilise le Théorème de Riemann-Roch prouvé par Grothendieck pour le morphisme de définition π: P^r → Spec F.” — The GRR input for projective space.

### Tor of structure sheaves in an excess square

`S.7/excess-tor-lemma` · lemma

In a cartesian square Y' = X' ×_X Y of quasi-compact quasi-separated schemes with i: Y → X and i': Y' → X' regular closed immersions (conormal sheaves 𝒩, 𝒩') and excess bundle ℱ = ker(f'^*𝒩 → 𝒩') (locally free), there is a canonical isomorphism of O_{Y'}-modules Tor_k^{O_X}(O_{X'}, O_Y) ≅ Λ^kℱ for every k ≥ 0; these are locally free of finite type and vanish for k > rank ℱ.

**Hypotheses.**

- i, i' regular closed immersions; f: X' → X arbitrary with Y' = f^{−1}(Y).

**Proof.**

1. The sequence 0 → 𝒥 → O_X → O_Y → 0 gives an exact sequence 0 → Tor_1(O_{X'}, O_Y) → f^*𝒥 → 𝒥' → 0 and an epimorphism Tor_1 → ℱ.
2. Locally, choose bases compatibly (Nakayama) so that 𝒥 = (u_1, …, u_m, v_1, …, v_d) and 𝒥' = (u_1, …, u_m) with v_i ↦ 0 in O_{Y'}; the Koszul complexes are resolutions (regularity, SGA 6 VII 1.4.2 via Thomason), and O_{X'} ⊗^L O_Y ≃ O_{Y'} ⊗ K_•(v_1, …, v_d) with zero differentials, so Tor_* is the exterior algebra on d generators of degree 1, the cup product Λ^kTor_1 → Tor_k is an isomorphism and Tor_1 → ℱ is an epimorphism of free modules of the same rank d, hence an isomorphism.

**Acceptance.**

- For f = i (self-intersection), ℱ = 𝒩 and Tor_k(O_Y, O_Y) = Λ^k𝒩.
- For a transversal square (Y' of the expected codimension), ℱ = 0 and Tor_k = 0 for k > 0.

**Depends on.** this roadmap: `S.2/derived-pullback-perfect`, `S.2/derived-tor-independent-base-change`.

**Sources.**

- `Thomason.1993`, Lemme 3.2 (p. 207): “Lemme 3.2 (cf. [SGA6, VII 2.5, 3.2]) Sous les hypothèses de 3.1, il existe un isomorphisme canonique de O_{Y'}-modules: (3.2.1) Tor_k^{O_X}(O_{X'}, O_Y) ≅ Λ^kℱ.” — The statement; the proof is on pp. 207–208.

### Thomason's excess intersection formula in higher K-theory

`S.7/excess-intersection-formula` · theorem · planet “Excess intersection formula”

Let Y' → X' over Y → X be a cartesian square of quasi-compact quasi-separated schemes with i: Y → X and i': Y' → X' regular closed immersions, f: X' → X, f' = f|_{Y'}, and excess bundle ℱ = ker(f'^*𝒩 → 𝒩') (𝒩, 𝒩' the conormal sheaves), with class [λ_{−1}ℱ] = Σ_k(−1)^k[Λ^kℱ] ∈ K_0(Y'). For closed W ⊆ X and Z ⊆ Y with X − W, Y − Z quasi-compact and Z ⊆ Y ∩ W, W' = f^{−1}(W), Z' = f'^{−1}(Z), the two maps of spectra K(Y on Z) → K(X' on W') are homotopic: f^* ∘ i_* ≃ i'_*([λ_{−1}ℱ] ∪ f'^*(−)). On homotopy groups: f^*i_*(y) = i'_*(λ_{−1}(ℱ)·f'^*y) for y ∈ K_m(Y on Z), all m. No regularity of X or Y is assumed.

**Hypotheses.**

- qcqs schemes; i, i' regular closed immersions (Koszul-regular, SGA 6 VII 1.4); the pushforwards i_*, i'_* exist on K with supports (TT 3.16.5–3.16.7, since regular immersions are perfect and projective).

**Proof.**

1. Models: K(Y on Z) by the Waldhausen category of pairs (E, λ: L → i_*E), L a bounded flat bicomplex resolution (Thomason 3.3; the approximation theorem, GeneralAlgebraicKTheory K.4/waldhausen-approximation-theorem, shows it has the right K-theory); i_* sends (E, λ, L) to Tot L, a flat perfect model of Ri_*E.
2. f^*i_* is represented by (E, λ, L) ↦ Tot(f^*L). The good truncations T_k of the rows of f^*L (Thomason (3.4.1)) form a finite filtration by exact functors, with successive quotients h_k(L) ≃ Tor_k^{O_X}(O_{X'}, i_*E) shifted by k, and h_k(L) ≃ Λ^kℱ ⊗ f'^*E[k] (Thomason (3.4.4), from S.7/excess-tor-lemma and flatness of E).
3. Waldhausen's additivity theorem (GeneralAlgebraicKTheory K.4/waldhausen-additivity-theorem) turns the filtration into f^*i_* ≃ Σ_k(−1)^k i'_*(Λ^kℱ ⊗ f'^*(−)) (the shift [k] contributes the sign (−1)^k), which is i'_*([λ_{−1}ℱ] ∪ f'^*(−)) (the cup product of S.6/support-product-pairings).

**Acceptance.**

- Transversal case ℱ = 0: f^*i_* = i'_*f'^* (base change, compare S.2/k-theory-base-change for Tor-independent squares).
- Self-intersection f = i: i^*i_* = λ_{−1}(𝒩)·(−) (S.7/self-intersection-formula).

**Depends on.** this roadmap: `S.7/excess-tor-lemma`, `S.2/k-theory-proper-pushforward`, `S.2/k-theory-pullback`, `S.6/support-product-pairings`, `S.1/perfect-waldhausen-models`, `S.5/codimension-one-triangle`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-additivity-theorem`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`.

**Sources.**

- `Thomason.1993`, Théorème 3.1 (p. 206): “Alors on a une égalité à homotopie près des morphismes de spectres K(Y sur Z) → K(X' sur W') (3.1.3) f^* ∘ i_* = i'_*([λ_{−1}ℱ] ∪ f'^*( )).” — The statement, for the cartesian square (3.1.1) of quasi-compact quasi-separated schemes with i, i' regular closed immersions.
- `Thomason.1993`, Introduction (p. 195): “En plus, je fournis un théorème d'intersection excédentaire pour la K-théorie, le théorème 3.1, qui donne une relation entre les morphismes d'image réciproque et les morphismes d'image directe par une immersion fermée régulière dans un carré cartésien de schémas.” — Its role: the higher-K-theory version of SGA 6's 'formule clef'.

### The K-theoretic self-intersection formula

`S.7/self-intersection-formula` · application

Let i: Y → X be a regular closed immersion of quasi-compact quasi-separated schemes with conormal sheaf 𝒩 = I/I² (locally free of rank c). Then i^* ∘ i_* = λ_{−1}(𝒩)·(−) on K_m(Y) (and on K_m(Y on Z) for closed Z ⊆ Y with quasi-compact complement), for all m, where λ_{−1}(𝒩) = Σ_{k=0}^{c}(−1)^k[Λ^k𝒩] ∈ K_0(Y). In E.4's notation, λ_{−1}(N^∨) with N the normal bundle. In particular, if 𝒩 has a trivial direct summand O_Y, then i^*i_* = 0.

**Hypotheses.**

- i a regular closed immersion; no regularity of X, Y.

**Proof.**

1. Apply S.7/excess-intersection-formula to the square with X' = X, f = i: then Y' = Y ×_X Y = Y (i a monomorphism), i' = id, 𝒩' = 0 and ℱ = 𝒩, and i'_* = id.
2. If 𝒩 ≅ O_Y ⊕ 𝒩_1 then λ_{−1}(𝒩) = λ_{−1}(O_Y)λ_{−1}(𝒩_1) = (1 − 1)λ_{−1}(𝒩_1) = 0.

**Acceptance.**

- For the zero section of a line bundle L (conormal L^∨): i^*i_*(y) = (1 − [L^∨])y.
- For a point of a smooth surface with conormal k²: i^*i_* = (1 − 1)² = 0.

**Depends on.** this roadmap: `S.7/excess-intersection-formula`.

**Sources.**

- `Thomason.1993`, (3.1.4) (p. 207): “En particulier en prenant f = i, on a pour une immersion fermée régulière i que: (3.1.4) i^* ∘ i_* = [λ_{−1}𝒩] ∪ ( ).” — The statement.

### A rational point of a curve has vanishing self-intersection in K-theory

`S.7/rational-point-self-intersection` · application

Let X be a regular curve over a field F and P ∈ X(F) a rational point with closed immersion P: Spec F → X. Then P^* ∘ P_* = 0 on K_m(F) for all m. (EllipticKTheory E.4/rational-base-point-splitting (c).)

**Hypotheses.**

- X regular of dimension one over F; P an F-rational point, so the maximal ideal m_P/m_P² ≅ F is free of rank one and P is a regular closed immersion (O_{X,P} a DVR).

**Proof.**

1. The conormal sheaf of P is m_P/m_P² ≅ F, trivial of rank one; S.7/self-intersection-formula gives P^*P_* = λ_{−1}(F)·(−) = (1 − [F])·(−) = 0.

**Acceptance.**

- P^*P_*[F] = 0 in K_0(F) = ℤ, i.e. the Euler characteristic of O_P ⊗^L O_P vanishes: Tor_0 = F, Tor_1 = F.
- On K_1(F): P^*P_*(u) = 0 for u ∈ F^×.

**Depends on.** this roadmap: `S.7/self-intersection-formula`.

**Sources.**

- `Thomason.1993`, (3.1.4) (p. 207): “En particulier en prenant f = i, on a pour une immersion fermée régulière i que: (3.1.4) i^* ∘ i_* = [λ_{−1}𝒩] ∪ ( ).” — Specialised to a rational point, whose conormal sheaf is trivial of rank one.

## Mistakes found in the sources

Recorded under PROTOCOL.md section 18. Each was checked at its locator by its author and again by the coordinator; the nodes above use the corrected statements.

### SchemeKTheoryOperations/E1 — error (affects nothing)

- **Where:** `Kbook.2013`, Remark V.3.4.2 (PDF p. 395, book p. 387).
- **Printed:** This is illustrated when X is the affine line with a double origin over a field, since (as we saw in II, 8.2.4 and Ex. 9.10) G0(X) = Z ⊕Z but K0VB(X) = Z.
- **Correction:** The example must be affine n-space with a double origin for n ≥ 2 (the affine plane, as in II.8.2.4 and Ex. II.9.10(d)); for the affine line with double origin K0VB(X) ≅ K0(X) ≅ G0(X) ≅ Z ⊕ Z and Theorem V.3.4's conclusion holds.
- **Reason:** For n = 1 the two charts meet in A^1 − 0 = Spec k[t, t^{-1}], which is affine, so X has affine diagonal (Totaro §1: 'An ∪An−0 An has affine diagonal for n = 1 but not for n ≥ 2'); being quasi-compact and regular, X has the resolution property (Stacks 0F8A), hence K0(Vect X) ≅ K0(X) (Stacks 0FDJ) ≅ G0(X) (Stacks 0FDI). Directly: the line bundles L_m glued from O on the two charts by t^m are pairwise non-isomorphic, so Pic(X) ≅ Z, and rank and determinant map K0VB(X) onto Z ⊕ Pic(X) ≅ Z ⊕ Z, so K0VB(X) ≠ Z. The places the remark cites (II.8.2.4, Ex. II.9.10) themselves require n ≥ 2.
- **Known:** new.

### SchemeKTheoryOperations/E2 — error (affects the proof)

- **Where:** `Kbook.2013`, Proper Transfer V.3.11 (PDF p. 403, book p. 395).
- **Printed:** Let FX denote the Waldhausen category of homologically bounded complexes of flasque OX-modules whose stalks have cardinality at most κ for a suitably large κ
- **Correction:** F_X must consist of homologically bounded pseudo-coherent complexes of flasque O_X-modules (TT 3.11.5); only then does F_X ⊂ Ch^hb_pcoh(X) induce K(F_X) ≃ G(X).
- **Reason:** Without pseudo-coherence F_X contains arbitrary bounded complexes of flasque modules, whose homotopy category is not that of Ch^hb_pcoh(X), so the Resolution Theorem V.3.9 does not identify K(F_X) with G(X).
- **Known:** Weibel, Corrections to the K-book, p. 434 l. 20 (V.3.11): insert 'pseudocoherent' before 'complexes of flasque'.

### SchemeKTheoryOperations/E3 — misprint (affects nothing)

- **Where:** `Stacks.perfect.2026`, Proposition 37.5 (tag 0F8I), Derived Categories of Schemes, version ed88ff78.
- **Printed:** is an exact functor of trianglated categories
- **Correction:** is an exact functor of triangulated categories
- **Reason:** Spelling slip; the same sentence continues 'an equivalence ... of triangulated categories'.
- **Known:** new.

### SchemeKTheoryOperations/E4 — gap (affects the proof)

- **Where:** `Stacks.cohomology.2026`, Lemma 46.8(2) (tag 08C9), Cohomology of Sheaves.
- **Printed:** We omit the proof of (2).
- **Correction:** If α : E• → F• is zero in D(O_X), choose a quasi-isomorphism s : F• → G• with s∘α null-homotopic; then α factors in K(O_X) through the acyclic homotopy fibre of s, and a map from the strictly perfect E• to an acyclic complex is locally null-homotopic by Lemma 46.6(1), so α is locally null-homotopic.
- **Reason:** The omitted argument uses only Lemma 46.6 and the description of morphisms in D(O_X) by calculus of fractions.
- **Known:** new.

### SchemeKTheoryOperations/E5 — gap (affects the proof)

- **Where:** `Stacks.perfect.2026`, Lemma 36.10 (tag 0F8C), proof, Derived Categories of Schemes.
- **Printed:** this reduces to the case where X is Noetherian (small detail omitted).
- **Correction:** The reduction needs a noetherian approximation X = lim X_i (Limits 5.4) with X_i having the resolution property (Lemma 36.9) and an argument that affine diagonal descends from some X_i to X (affine morphisms are stable under base change and the diagonal of X is the base change of that of X_i along X × X → X_i × X_i); the detail is not written in the source.
- **Reason:** The omitted step is the non-noetherian case, which the node records as a gap.
- **Known:** new.

### SchemeKTheoryOperations/E6 — misprint (affects nothing)

- **Where:** `ThomasonTrobaugh.1990`, Proposition 3.18, p. 321.
- **Printed:** Let (3.18.1) be a pullback diagram of quasi-coherent schemes, with f a quasi-separated map.
- **Correction:** Let (3.18.1) be a pullback diagram of quasi-compact schemes, with f a quasi-separated map.
- **Reason:** 'Quasi-coherent' is not a property of schemes; the proof uses the base change theorem 2.5.6, whose hypotheses are Y quasi-compact and f quasi-compact and quasi-separated, and 3.17 just before is stated for quasi-compact Y.
- **Known:** new.

### SchemeKTheoryOperations/E7 — misprint (affects nothing)

- **Where:** `ThomasonTrobaugh.1990`, 2.4.4, p. 302.
- **Printed:** On a general scheme, the prefect complexes are the locally finitely presented objects in the “homotopy-stack” of derived categories.
- **Correction:** On a general scheme, the perfect complexes are the locally finitely presented objects in the “homotopy-stack” of derived categories.
- **Reason:** Spelling slip ('prefect' for 'perfect'); the paragraph summarises Theorem 2.4.3 on perfect complexes.
- **Known:** new.

### SchemeKTheoryOperations/E8 — misprint (affects nothing)

- **Where:** `Schlichting.2003`, 5.10, p. 13 (preprint of 16 June 2003).
- **Printed:** Let X be a quasi-compact and quasi-seperated scheme
- **Correction:** Let X be a quasi-compact and quasi-separated scheme
- **Reason:** Spelling slip (also in 7.3).
- **Known:** new.

### SchemeKTheoryOperations/E9 — error (affects a stated result)

- **Where:** `Kbook.2013`, V.6.6.4, change of parameter for the specialisation map (PDF p. 418).
- **Printed:** if u ∈R× is such that s′ = us then λs′(a) = λs(a) + (−1)n{u, ∂a}.
- **Correction:** With the right-linear boundary used in V.6.6.1 and V.6.7 (∂{s, a} = {∂s, a}) and graded commutativity, λ_{us}(a) = λ_s(a) − {ū, ∂a} = λ_s(a) + (−1)^n{∂a, ū}; the printed sign is correct for odd n and wrong for even n.
- **Reason:** λ_{us}(a) − λ_s(a) = ∂{u, a} = (−1)^n ∂{a, u} = (−1)^n{∂a, ū} = −{ū, ∂a}. For n = 2 and a = {s, w} (w a unit): ∂{u, s, w} = −∂{s, u, w} = −{ū, w̄}, while the printed formula gives +{ū, ∂a} = +{ū, w̄}; {ū, w̄} need not be 2-torsion.
- **Known:** new.

### SchemeKTheoryOperations/E10 — misprint (affects a stated result)

- **Where:** `Kbook.2013`, Exercise V.6.9(b) (PDF p. 428).
- **Printed:** If X is the node Spec(k[x, y]/(y2 −x3 −x)), show that Gn(X) ∼= Gn(k) ⊕ Gn−1(k) for all n.
- **Correction:** The node is Spec k[x, y]/(y² − x² − x³) (Example I.3.10.2, char k ≠ 2).
- **Reason:** y² = x³ + x is smooth when char k ≠ 2 (the partials 2y and 3x² + 1 do not vanish together on the curve), an affine elliptic curve with G_0 = ℤ ⊕ Pic, which contains the 2-torsion class of (0, 0) over k = ℚ; so the stated G_n formula fails for the printed equation and holds for the nodal cubic by Ex. 6.9(a).
- **Known:** new.

### SchemeKTheoryOperations/E11 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Exercise V.5.3 (PDF p. 413).
- **Printed:** for x ∈Kj(A/B) and y ∈Kn(C) the element {x, y} ∈Kn+i(A′/B′) satisﬁes ∂({x, y}) = {∂(x), y} in Kn+i(B′).
- **Correction:** {x, y} ∈ K_{n+j}(A'/B') and ∂({x, y}) ∈ K_{n+j−1}(B').
- **Reason:** The product of degrees j and n has degree n + j, and the boundary lowers degree by one; there is no index i in the statement.
- **Known:** new.

### SchemeKTheoryOperations/E12 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Proof of Theorem V.9.6 (PDF p. 447).
- **Printed:** Let A = k[t1, ..., tr] be the polynomial subalgebra of R given by Lemma 9.6.1
- **Correction:** given by Lemma 9.6.2 (the normalisation lemma); 9.6.1 is the proposition being proved.
- **Reason:** Lemma 9.6.2 provides the projection finite on Z and smooth at T; Proposition 9.6.1 is the effacement statement.
- **Known:** new.

### SchemeKTheoryOperations/E13 — error (affects a stated result)

- **Where:** `Kbook.2013`, Theorem V.9.6 (PDF p. 446).
- **Printed:** Let R be an algebra of ﬁnite type over a ﬁeld, and let A = S−1R be the semilocal ring of R at a ﬁnite set of prime ideals. Then Conjecture 9.3 holds for A
- **Correction:** Add the hypothesis that R_p is regular for every p in the finite set (Quillen, Theorem 5.11); the proof's first step ('We may replace R by R[1/f], f ∈ S, to assume that R is smooth') uses it.
- **Reason:** For the local ring A of ℝ + xℂ[x] at (x, ix) (a finite-type ℝ-algebra), G_0(A) ≅ ℤ ⊕ ℤ/2 by Ex. V.6.1, so K_0M^1(A) → K_0M^0(A) is nonzero and the conclusion fails without regularity.
- **Known:** Quillen, Higher algebraic K-theory I, §7 Theorem 5.11 states the regularity hypothesis.

### SchemeKTheoryOperations/E14 — error (affects a stated result)

- **Where:** `Kbook.2013`, Proposition V.9.8.1 (PDF p. 449).
- **Printed:** Assume that X is a regular quasi-projective scheme, or more generally that the Gersten-Quillen conjecture 9.3 holds for the local rings of X.
- **Correction:** Assume that X is a regular quasi-projective scheme over a field (so that Theorem 9.6 applies to its local rings), or more generally that 9.3 holds for the local rings of X.
- **Reason:** For a regular quasi-projective scheme over ℤ (for example over a mixed-characteristic DVR) the Gersten–Quillen conjecture for its local rings is not known (V.6.9, V.9.7.1(d)), so the first hypothesis does not imply the second.
- **Known:** new.

### SchemeKTheoryOperations/E15 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Proof of Theorem V.6.9.1 (PDF p. 422).
- **Printed:** ∂p{a′, s′} = {a′, ∂ps′} for all p
- **Correction:** With the right-linear boundary of V.6.6.1, ∂{a', s'} = (−1)^{n−1}{a', ∂s'} for a' of degree n − 1.
- **Reason:** Right linearity and graded commutativity give ∂{a', s'} = (−1)^{n−1}∂{s', a'} = (−1)^{n−1}{∂s', a'}; the surjectivity conclusion is unaffected because the sign is a unit.
- **Known:** new.

### SchemeKTheoryOperations/E16 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Corollary V.1.5.1, PDF p. 377 (book p. 369), author copy of 29 August 2013.
- **Printed:** As a ring, K∗(Pn X) ∼= K∗(X)⊗Z K0(Pn Z) ∼= K∗(X)[z]/(zr+1).
- **Correction:** K_*(P^n_X) ≅ K_*(X)[z]/(z^{n+1}).
- **Reason:** P^n_X is the projective bundle of the trivial bundle of rank n + 1; the letter r refers to Theorem V.1.5's rank r + 1 bundle and is undefined here. II.8.6 gives K_0(P^r_ℤ) = ℤ[z]/(z^{r+1}) in its own notation.
- **Known:** new.

### SchemeKTheoryOperations/E17 — misprint (affects the proof)

- **Where:** `Kbook.2013`, Lemma V.1.5.2, proof, PDF p. 377 (book p. 369).
- **Printed:** By Additivity ( 1.2.1), ιn has Pr i=1(−1)iλi as a homotopy inverse.
- **Correction:** ι_n has Σ_{i=1}^{r+1} (−1)^{i−1} λ_i as a homotopy inverse.
- **Reason:** The Koszul resolution 0 → F → F(1) ⊗ π^*E^∨ → ⋯ → F(r + 1) ⊗ π^*Λ^{r+1}E^∨ → 0 has r + 1 terms after F, and additivity gives [F] = Σ_{i≥1} (−1)^{i−1}[λ_iF]; the K-book's own II.8.7.10 states 'the map Σ_{i>0} (−1)^{i−1}u_i is an inverse'.
- **Known:** new.

### SchemeKTheoryOperations/E18 — misprint (affects the proof)

- **Where:** `Kbook.2013`, Proposition II.8.7.10, proof (PDF p. 160) and Lemma V.1.5.2, proof (PDF p. 377).
- **Printed:** 0 →F →F(1) ⊗X E →· · · →F(r + 1) ⊗X ∧r+1E →0
- **Correction:** 0 → F → F(1) ⊗ π^*E^∨ → ⋯ → F(r + 1) ⊗ π^*Λ^{r+1}E^∨ → 0, with the dual bundle E^∨.
- **Reason:** With the K-book's convention P(E) = Proj(Sym E) (I.5.8), the tautological map is π^*E → O(1), a section of π^*E^∨ ⊗ O(1); its Koszul complex has terms π^*Λ^iE^∨ ⊗ O(i) (Thomason–Trobaugh (4.6.2)). For E = L ⊕ O with L not self-dual the complex with E has no canonical differential. For trivial E the two agree.
- **Known:** new.

### SchemeKTheoryOperations/E19 — error (affects the proof)

- **Where:** `Kbook.2013`, Theorem V.6.2, proof, PDF p. 415 (book p. 407).
- **Printed:** Let Mb gr(S) denote the Serre subcategory of all graded modules M in Mgr(S) with only ﬁnitely many nonzero Mn, i.e., graded t- torsion modules.
- **Correction:** M^b_gr(S) must be the Serre subcategory of finitely generated graded S-modules annihilated by a power of t; this is not the same as having finitely many non-zero components.
- **Reason:** For S = R[st, t], S/tS ≅ R[st] is t-torsion with every homogeneous component non-zero; the proof needs it inside the subcategory ('M^b_gr(S) has the same K-theory as its subcategory Mgr(S/tS)') and needs the t-torsion modules as kernel of M ↦ M/(t − 1)M. With 'finitely many non-zero M_n' both steps fail. The same wording recurs in Theorem V.6.4 through 'the rest of the proof is the same'. (For Theorem V.6.14 and P^r the description is correct.)
- **Known:** new.

### SchemeKTheoryOperations/E20 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Remark V.8.3.2, PDF p. 440 (book p. 432).
- **Printed:** the groups Kn(X) may also be inductively deﬁned to be the cokernel LKn+1(X) of Kn+1(X[t]) ⊕Kn+1(X[1/t]) →Kn+1(R[t, 1/t]).
- **Correction:** … → K_{n+1}(X[t, 1/t]).
- **Reason:** The remark concerns a scheme X; R is not defined there (the ring notation of Theorem V.8.2).
- **Known:** new.

### SchemeKTheoryOperations/E21 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Lemma IV.12.8(2), PDF p. 372 (book p. 364).
- **Printed:** KH(X × Spec(Z[x, x−1]) ≃KH(X) × Ω−1KH(R)
- **Correction:** KH(X × Spec ℤ[x, x⁻¹]) ≃ KH(X) × Ω⁻¹KH(X).
- **Reason:** The lemma is about a scheme X; the displayed isomorphism on homotopy groups that follows is KH_n(X[x, x⁻¹]) ≅ KH_n(X) ⊕ KH_{n−1}(X).
- **Known:** new.

### SchemeKTheoryOperations/E22 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Exercise V.3.3, PDF p. 405 (book p. 397).
- **Printed:** consider the subcategory Mm(S) of graded B-modules M with M = Fm(M).
- **Correction:** … of graded S-modules M with M = F_m(M).
- **Reason:** No ring B occurs in Example V.3.5.2 or the exercise; the graded ring is S.
- **Known:** new.

### SchemeKTheoryOperations/E23 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Exercise V.3.4, PDF p. 405 (book p. 397).
- **Printed:** Hint: Consider S-modules which are acyclic for both ⊗SR and ⊗SS.
- **Correction:** … acyclic for both ⊗_S R and ⊗_R S.
- **Reason:** Every S-module is acyclic for ⊗_S S; the hint needs modules Tor-independent for base change along S → R and R → S.
- **Known:** Weibel's published errata list: 'p.434 Ex.V.3.4: ⊗SS should be ⊗RS'.

### SchemeKTheoryOperations/E24 — misprint (affects nothing)

- **Where:** `ThomasonTrobaugh.1990`, Section 4.8, Lemma numbered 4.8.4 (p. 334; PDF p. 88), scan of the published article.
- **Printed:** 4.8.4. Lemma. On the exact category of 0-regular coherent sheaves on PE, there are exact functors Ti
- **Correction:** The lemma is 4.8.3.
- **Reason:** The next paragraph is also numbered 4.8.4, and 4.8.5 and 4.9 cite 'the exact sequence of 4.8.3' and 'From 4.8.3, 4.8.4, and 4.8.5' for this lemma.
- **Known:** new.

### SchemeKTheoryOperations/E25 — misprint (affects nothing)

- **Where:** `ThomasonTrobaugh.1990`, Section 4.6 (p. 331; PDF p. 85).
- **Printed:** Thus the Kozsul complex of π∗E ⊗ O(−1) → O is acyclic
- **Correction:** Koszul complex.
- **Reason:** Spelling of the name; the same paragraph writes 'Koszul' two lines below.
- **Known:** new.

### SchemeKTheoryOperations/E26 — error (affects a stated result)

- **Where:** `ThomasonTrobaugh.1990`, Theorem 1.9.8 (p. 271; PDF p. 25), as used in 4.11 (p. 336).
- **Printed:** This will follow from the approximation theorem in the form 1.9.8, set up by the dual of 1.9.7
- **Correction:** Theorem 1.9.8 needs the additional hypothesis that a retract up to weak equivalence of an object weakly equivalent to zero is itself weakly equivalent to zero (Thomason 1993, Hypothèse 4.1.1); it holds when weak equivalences are quasi-isomorphisms, so 4.11 is unaffected.
- **Reason:** Thomason 1993 §4.1 gives a counterexample: bounded complexes of finite-dimensional vector spaces with weak equivalences the maps preserving Euler characteristic; the homotopy category is equivalent to 0 but K_0 is ℤ.
- **Known:** Thomason, Les K-groupes d'un schéma éclaté …, Invent. Math. 112 (1993), §4, 'Une correction à l'article de Thomason et de Trobaugh'.

### SchemeKTheoryOperations/E27 — gap (affects nothing)

- **Where:** `ThomasonTrobaugh.1990`, Theorem 6.1(b), proof (p. 354; PDF p. 108).
- **Printed:** (A careful calculation of ∂T(T) by building categorical models of everything via [Th3], and considering our choice of signs in forming a Mayer-Vietoris sequence from a homotopy cartesian square yields that in fact ∂T T = 1.
- **Correction:** The calculation of the sign ∂_T(T) = +1 is not given; the proof establishes ∂_T(T) = ±1, which is all 6.1(b) as stated needs.
- **Reason:** The proof shows ∂_T(T) generates K_0(ℤ) = ℤ, hence ±1; the parenthetical sign claim depends on conventions not recorded in the paper.
- **Known:** new.

### SchemeKTheoryOperations/E28 — misprint (affects a stated result)

- **Where:** `Kbook.2013`, Ex. II.8.7 (printed p. 157, PDF p. 165) and the proof of Corollary II.8.9.1 (printed p. 155, PDF p. 163), author-hosted draft of 29 August 2013.
- **Printed:** Show that ci([OZ]) = (−1)i(i−1)![Z] in CHi(X).
- **Correction:** c_i([O_Z]) = (−1)^{i−1}(i − 1)![Z].
- **Reason:** For a divisor D (i = 1), [O_D] = 1 − [O(−D)] and c_1(O_D) = −c_1(O(−D)) = [D], whereas the printed formula gives −[D]. For i = 2 and a complete intersection of D_1, D_2, ch([O_Z]) = (1 − e^{−D_1})(1 − e^{−D_2}) = D_1D_2 + ⋯, so ch_2 = [Z]; with c_1 = 0, ch_2 = (c_1² − 2c_2)/2 = −c_2, so c_2 = −[Z] = (−1)^{2−1}1![Z].
- **Known:** new.

### SchemeKTheoryOperations/E29 — misprint (affects a stated result)

- **Where:** `Kbook.2013`, Example IV.5.4.1 (printed p. 313, PDF p. 321), author-hosted draft of 29 August 2013.
- **Printed:** When n = 1 and a ∈A× is regarded as an element of K1(A), the formulas λk(a) = a and ψk(a) = ak are immediate from the formula 5.2 for λk A.
- **Correction:** λ^k(a) = a^{(−1)^{k−1}} (in additive notation λ^k(a) = (−1)^{k−1}a), and ψ^k(a) = a^k.
- **Reason:** By Corollary IV.5.5.1, ψ^k = (−1)^{k−1}kλ^k on K_1(A); with λ^k(a) = a this would give ψ²(a) = a^{−2}, contradicting ψ²(a) = a². Directly: a is the image of x = [ρ] − 1 for the rank-one representation ρ of ℤ by a, and λ_t(x) = (1 + [ρ]t)/(1 + t) has t^k-coefficient (−1)^{k−1}([ρ] − 1). Formula 5.2 for P of rank one gives λ^k_P = Σ_{i<k}(−1)^iΛ^{k−i}_P = (−1)^{k−1}Λ^1_P.
- **Known:** new.

### SchemeKTheoryOperations/E30 — misprint (affects nothing)

- **Where:** `Kbook.2013`, II.4, Chern character, expansion of ch (printed p. 100, PDF p. 108), author-hosted draft of 29 August 2013.
- **Printed:** ch(x) = ε(x) + c1(x) + 1 2[c1(x)2 −c2(x)] + 1 6[c1(x)3 −3c1(x)c2(x) + 3c3(x)] + · · ·
- **Correction:** The degree-two term is (1/2)[c_1(x)² − 2c_2(x)].
- **Reason:** For p = ℓ_1 + ℓ_2 with Chern roots a, b: ch_2(p) = (a² + b²)/2 = ((a + b)² − 2ab)/2 = (c_1² − 2c_2)/2. The degree-three term printed is correct: (a³ + b³ + c³)/6 = (c_1³ − 3c_1c_2 + 3c_3)/6.
- **Known:** new.

### SchemeKTheoryOperations/E31 — misprint (affects nothing)

- **Where:** `Soule.1985`, Proof of Proposition 5, pp. 513–514 (Canad. J. Math. 37, published version).
- **Printed:** D'après [32] le morphisme π_{−q}(V_N) → π_{−q}(V) est surjectif (resp. bijectif) si N ≥ −q (resp. N ≥ −q + 1).
- **Correction:** The reference should be [33] (Suslin, Stability in algebraic K-theory, LNM 966), as in the proof of Lemme 1 and in 2.4–2.6; the same applies to 'est surjectif [32]' on p. 514.
- **Reason:** [32] in the bibliography is Stienstra, 'Cartier–Dieudonné theory for the Chow groups', which does not treat stability of Volodin's spaces; the statement is Suslin's surjective stability, which Soulé attributes to [33] elsewhere in the paper.
- **Known:** new.

## Gaps

### Grothendieck's coherence theorem for proper morphisms

For f : X → Y proper with Y locally noetherian and F coherent, the sheaves R^if_*F are coherent (EGA III 3.2.1; Stacks Cohomology of Schemes 19.1 and 26.10). Stacks 08E2, TT 2.5.4 and K-book V.3.7 ('Serre's Theorem B') invoke it; its proof (Chow's lemma, dévissage, the projective case) was not read. No roadmap in the atlas states it in this generality: SchemeAndStackFoundations SF.2's text concerns site and étale cohomology, and Tau Ceti's JacobianChallenge layer B covers coherent cohomology of curves over a field. A request to SF.2 and a restructure entry are filed.

Needed by: `S.2/proper-pushforward-coherent`, `S.2/proper-perfect-pushforward-perfect`, `S.2/g-theory-proper-pushforward`, `S.2/k-theory-proper-pushforward`.

### Vector bundles on affine space with doubled origin

For n ≥ 2 and X = A^n ∪_{A^n−0} A^n, restriction to either chart is an equivalence Vect(X) ≃ Vect(A^n) (TT Exercise 8.6, hint, citing EGA IV 5.10, 5.9; K-book Ex. V.6.8). TT sketch the argument (full faithfulness because the complement has codimension ≥ 2; extension of the patching isomorphism over the origin); the EGA statements on extending sections and isomorphisms of locally free sheaves across codimension ≥ 2 on a normal scheme were not read in a public source. The counterexample node uses only this equivalence and the contractibility of bounded acyclic complexes of projectives.

Needed by: `S.1/doubled-plane-counterexample`.

### Tame-symbol identification of the DVR boundary on K_2 cannot be imported

RS-18 makes K2SymbolsBrauer T.3:symbols and T.3:localization-comparison the owners of the tame-symbol formula and of its comparison with the localisation boundary, and S.3 should identify its scheme boundary with them. Those stages are downstream of S.3: T.3/localization-boundary cites K2SymbolsBrauer:T.2/graded-map (and T.2/matsumoto), T.2:graded-map ← K3BlochGroups V.2 ← MotivicEtaleKTheory M.4 ← S.6 ← S.5 ← S.4 ← S.3, and T.1:classical cites the combined stage GeneralAlgebraicKTheory:K.2, which contains K.2:low-degree-comparisons ← K3BlochGroups V.4 ← V.2. S.3 therefore proves only the part not needing Matsumoto's theorem or the Steinberg relation for products of units (S.3/dvr-boundary-on-unit-products: ∂_S(λ(f)·λ(u)) = v(f)λ_k(ū) for u a unit); the value on {π, π} and the equality ∂_S = tame symbol on all of K_2(L) remain to be connected.

Needed by: `S.3/dvr-boundary-on-unit-products`, `S.3/dvr-boundary`, `S.3/vertical-residue-compatibility`.

### The boundary formula for an automorphism class (K-book Ex. V.5.1) and the comparison of automorphism classes (Ex. IV.7.9(c)) are exercises

S.3/boundary-of-a-nonzerodivisor and S.3/dvr-boundary-unit-valuation use ∂[α] = [coker α] − [ker α] for Quillen's localisation boundary, and the identification of the loop of g ∈ GL_n(R) in π_1BGL(R)^+ with the class [g] ∈ π_2BQP(R); the K-book states both as exercises with hints. They are requested from GeneralAlgebraicKTheory K.3 and K.2:plus.

Needed by: `S.3/boundary-of-a-nonzerodivisor`, `S.3/dvr-boundary-unit-valuation`, `S.3/unit-boundary-is-divisor`.

### Exercise-level proofs of the divisor comparison

S.3/divisor-support-comparison (K(H_Z(X)) ≃ K(X on Z) for an effective Cartier divisor) follows TT Exercise 5.7 (an exercise the source flags as skippable) and K-book Ex. V.3.16; the steps are the sources' hints, not written proofs.

Needed by: `S.3/divisor-support-comparison`.

### Reduction steps asserted without proof in K-book 6.7 and 6.7.2

Theorem V.6.7 asserts that a finite extension F'/F exists whose integral closure O' contains the residue field k with a maximal ideal tO' of residue field k; Corollary V.6.7.2 asserts that a DVR containing a field contains a subfield over which its residue field is algebraic. Neither is proved in the source (for inseparable or infinite extensions both need care); they are inputs of S.4/gersten-dvr-split and S.4/gersten-dvr-equicharacteristic.

Needed by: `S.4/gersten-dvr-split`, `S.4/gersten-dvr-equicharacteristic`.

### Gillet–Levine's theorem not read

K-book Theorem V.9.7 refers to Gillet–Levine, J. Pure Appl. Algebra 46 (1987) 59–71, for the proof; the publisher refused the download. The statement is imported as cited; S.4/mixed-char-higher-effacement, S.4/mixed-char-gersten-partial-exactness and S.4/mixed-char-gersten-from-dvr are proved from it as in the K-book.

Needed by: `S.4/gillet-levine-smooth-over-dvr`, `S.4/mixed-char-higher-effacement`, `S.4/mixed-char-k0-generation`, `S.4/mixed-char-gersten-partial-exactness`, `S.4/mixed-char-gersten-from-dvr`.

### Panin's equicharacteristic Gersten theorem not read

Panin, The equi-characteristic case of the Gersten conjecture, Proc. Steklov Inst. Math. 241 (2003) 154–163, was not accessible; the node records the statement and the route reported by Mochizuki's survey (Popescu's general Néron desingularisation plus Quillen's theorem and a limit argument). Popescu's theorem has no owner in the atlas.

Needed by: `S.4/panin-equicharacteristic-gersten`.

### Weierstrass preparation in several variables

S.4/gersten-power-series uses the Weierstrass preparation theorem for k[[x_1, …, x_n]] (and for convergent power series) and a completed tensor product; Quillen says only 'the proof is analogous to the preceding'. Neither input is supplied by a source read or by a planned node.

Needed by: `S.4/gersten-power-series`.

### Gillet–Soulé comparison of the descent and coniveau spectral sequences

K-book V.10.12 cites Gillet–Soulé 2.2.4 for the isomorphism of the two spectral sequences from E_2 on; only the E_2 identification is proved here (S.4/descent-coniveau-e2-comparison).

Needed by: `S.4/descent-coniveau-e2-comparison`.

### Nisnevich site inputs cited from SGA 4, EGA IV and MVW

The points of X_Nis (TT E.5 via EGA IV 18), its coherence and cohomological dimension (TT E.6 via SGA 4 X 4.1) and the generation of the Nisnevich topology by distinguished squares with their Mayer–Vietoris-square property (MVW 12.7, cited in K-book V.10) are cited, not reproved, in the sources read; the SGA 4 cohomological inputs are requested from SchemeAndStackFoundations SF.2.

Needed by: `S.4/nisnevich-site`, `S.4/nisnevich-cohomological-dimension`, `S.4/nisnevich-descent`.

### Proper pushforward on the coniveau spectral sequence

The API item coniveauSS.proper (a proper map of relative dimension d induces E_r^{p,q}(X) → E_r^{p−d,q+d}(Y), compatible with G-theory pushforward) is K-book Exercise V.9.3 (Gillet) with no proof in the source.

Needed by: `S.4/g-coniveau-spectral-sequence`.

### Graded Quillen lemma is an exercise in the K-book

K-book Example V.3.5.2 proves only that β has a left inverse and states 'In fact, β is an isomorphism (see Ex. 3.3)'; Ex. V.3.3 gives a hint (the filtration F_m and admissible-filtration additivity V.1.8) but no proof, and describes the subcategory M_m(S) as 'graded B-modules' (misprint for S). The node's proof steps follow the hint. Quillen's original argument (Higher algebraic K-theory I, §6) was not available. Next action: write out the filtration argument, checking that F_n/F_{n−1} is an exact functor on the Tor-independent category Pgr.

Needed by: `S.5/graded-quillen-lemma`.

### Rees dehomogenisation equivalence is asserted without proof

The proof of K-book Theorem V.6.2 asserts the equivalence Mgr(S)/Mb_gr(S) ≅ M(R[s]) and uses the wrong description of the Serre subcategory (source issue). The node supplies a proof sketch (exactness of M ↦ M/(t − 1)M, its kernel, essential surjectivity by homogenising, full faithfulness in the quotient); a formaliser must verify the full-faithfulness step against Gabriel's quotient construction owned by GeneralAlgebraicKTheory K.3.

Needed by: `S.5/rees-dehomogenisation`, `S.5/g-theory-homotopy-invariance-affine`.

### Sign of the boundary of the unit T

Thomason–Trobaugh 6.1(b) prove ∂_T(T) = ±1 and assert '(A careful calculation ... yields that in fact ∂_T T = 1)' without the calculation. The nodes carry the universal sign ε = ∂_T(T) ∈ {±1} and split ∂_T by ε·(T ∪ −). Fixing ε = 1 requires matching the sign convention of S.4's Mayer–Vietoris boundary with S.3's localisation boundary (whose unit normalisation ∂[s] = [R/sR] gives ∂_loc(T ∪ x) = x).

Needed by: `S.5/bass-boundary-splitting`, `S.5/punctured-line-localisation-test`.

### Exact-sequence form of the blow-up formula needs K-theoretic excess intersection

Thomason 1993 Remarque 2.2 derives the exact sequence 0 → K_n(Y) → K_n(Y′) ⊕ K_n(X) → K_n(X′) → 0 from Theorem 2.1 and the excess intersection formula 3.1 (f^*i_* = i′_*([λ_{−1}F] ∪ f′^*)), which says that the composite K_n(Y) → K_n(X′) vanishes. The K-theoretic excess intersection formula is SchemeKTheoryOperations S.7's ('Develop the excess-intersection ... ingredients'), downstream of S.5, so the exact-sequence form is not planned here (restructure).

Needed by: `S.5/blowup-formula`.

### EGA and SGA 6 inputs of Thomason's blow-up lemmas

Thomason 1993 cites, without proof: p_*O_{X′}(n) = J^n and R^qp_*O_{X′}(n) = 0 for n ≫ 0 (relative ampleness, EGA III), the regular embedding X′ ⊂ P^{d−1}_X (SGA 6 VII 1.8, EGA IV 19.4), and ampleness in the form 'q_*(H(n)) = 0 for n ≫ 0 ⇒ H = 0' (EGA II 4.5.2(c)); Thomason–Trobaugh 4.5(c) cite Serre vanishing (EGA III 2.2.1). None of EGA or SGA 6 was read. Relative ampleness is requested from AlgebraicModuliForArithmeticGeometry R09.1; the other two facts remain gaps.

Needed by: `S.5/regular-blowup-geometry`, `S.5/blowup-adjunction-lemma`, `S.5/blowup-acyclicity-criterion`, `S.5/projective-bundle-cohomology`.

### Nil description of NK for non-affine schemes

For affine X the Nil terms are identified by K.6 (K-book V.8.1, Nil_n(R) ≅ NK_{n+1}(R)). For a scheme with an ample family of line bundles Thomason–Trobaugh Ex. 9.13 (an exercise, with no proof) describe the cofibre of i^*: K(X) → K(X[T] on (T = 0)) as a Nil K-theory of vector bundles with nilpotent endomorphisms. The nodes keep NK_n(X) as the cokernel; the non-affine Nil description is not planned.

Needed by: `S.5/nk-decomposition`, `S.5/affine-fundamental-theorem-comparison`.

### Quillen's homology isomorphism for block-triangular linear groups

The additivity of the classifying map q: R_A(G) → [BG, BGL(A)^+] on non-split short exact sequences reduces to the statement that the block-diagonal inclusion GL_m(A) × GL_n(A) → G_{m,n} (block upper-triangular) induces an isomorphism on integral homology in the limit. The K-book (Proposition IV.5.3), Kratzer (Théorème 3.1) and Soulé (§1.2, via Kratzer) all cite Quillen, 'Characteristic classes of representations', LNM 551 (1976), 189–216, which was not obtained. No stage of the atlas states it.

Needed by: `S.6/representation-classifying-map`, `S.6/soule-scheme-operations`.

### Serre's theorem on representation rings of split reductive groups

S.6/serre-representation-ring-theorem uses Serre 1968, Théorème 4 (for a split reductive group over a field, the character map R(G) → ℤ[M]^W is an isomorphism) and Théorème 3 (comparison over a principal ideal ring), read only at statement level; §§2–3.6 of Serre 1968 were not decomposed. Over ℂ the highest-weight classification and the character identification are targets of Tau Ceti RepresentationTheory/ClassicalGroups layers 3–4 (requested); the descent to ℚ, 𝔽_p and ℤ is not planned anywhere.

Needed by: `S.6/serre-representation-ring-theorem`.

### Hiller's universality of the classifying map

K-book Proposition IV.5.7 is proved by obstruction theory in Hiller, 'λ-rings and algebraic K-theory', J. Pure Appl. Algebra 20 (1981), 2.4; the paper is behind the publisher's paywall and was not read. Multiplicativity of ψ^k for Loday's product (S.6/adams-product-compatibility) and its sheafified form rest on it.

Needed by: `S.6/hiller-universality`, `S.6/adams-product-compatibility`, `S.6/scheme-adams-multiplicative`.

### Suslin's stability theorems and Serre's splitting theorem

Soulé's bounds on the γ-filtration use (a) surjective stability K_{m,N}(A) → K_m(A) for Volodin's model when N ≥ m + sr(A) − 1 and the homotopy equivalence ΩBGL(A)^+ ≃ V(A) (Suslin, 'Stability in algebraic K-theory', LNM 966), (b) stability π_m BGL_N(R)^+ ≅ π_m BGL(R)^+ for local R and N ≥ 2m + 1 (Soulé's Lemme 1, same source), and (c) Serre's splitting theorem for projectives of rank > dim Max (Bass, Algebraic K-theory IV 2.7). None was read.

Needed by: `S.6/soule-gamma-bound`, `S.6/scheme-gamma-bound`, `S.6/sheaf-level-k-theory-model`.

### The homotopy theory of simplicial sheaves on a noetherian scheme

Soulé's sheaf-level operations live in the homotopy category of the Brown–Gersten closed model structure on simplicial sheaves on X_Zar (Brown–Gersten, LNM 341, Theorem 2; Brown, Trans. AMS 186). Mathlib has model categories, simplicial sets and sheaves but not this model structure, and no stage of the atlas plans it. S.6/simplicial-sheaf-hypercohomology records the needed interface; the existence of the model structure is this gap.

Needed by: `S.6/simplicial-sheaf-hypercohomology`, `S.6/soule-scheme-operations`.

### Products at the sheaf level and the Loday–Waldhausen comparison

The tensor-product pairing on ℤ × BGL^+ used by Soulé and Gillet–Soulé is compared with Waldhausen's product of TT 3.15 only for smooth schemes over a regular base (Riou, Proposition 3.2.1); the comparison of Waldhausen's and Loday's products in positive degrees is cited by Riou (Remark 3.2.2) to Weibel's survey [48], not read. The global compatibility of ψ^k with Waldhausen's product (Gillet–Soulé: 'One checks as in [Kr]') is not decomposed.

Needed by: `S.6/product-low-degree-comparison`, `S.6/soule-scheme-operations`, `S.6/scheme-adams-multiplicative`.

### SGA 6 inputs: twisted λ-operations, the γ-length of K_0 and Jussila's inclusion

Soulé cites SGA 6 (not obtained) for the integrality of the operations of Grothendieck's twisted λ-ring R_N (Exp. V §5), for F^{d+1}_γK_0(X) = 0 (Exp. VI 6.6, also Fulton–Lang V.3.10) and, through Gillet–Soulé, for Jussila's F^p_γK_0 ⊆ F^p_cod K_0 on noetherian schemes (Exp. X). For X of finite type over a field the last two follow from Gillet–Soulé's Theorem 4, itself resting on the next gap.

Needed by: `S.6/twisted-lambda-ring`, `S.6/scheme-gamma-bound`, `S.7/gamma-in-coniveau`.

### Gillet–Soulé's comparison of the Brown and coniveau filtrations

Gillet–Soulé 1999, §§1–3 (Joyal's theorem for sheaves of simplicial groups, their Theorem 2 comparing exact couples, the splitting principle for the Brown filtration, Proposition 6) and the proof of Theorem 4 were read at statement level only.

Needed by: `S.7/gamma-in-coniveau`.

### Fulton's factorisation lemma for singular quasi-projective schemes

Soulé's Proposition 7 uses Fulton, 'Rational equivalence on singular varieties', Publ. IHÉS 45 (1975), 3.2 Lemma (exact sequences of bundles on X come from a smooth embedding; isomorphic pullbacks become isomorphic on a further smooth factorisation). Not read.

Needed by: `S.6/singular-scheme-operations`.

### Representability of K-theory in the A¹-homotopy category

Riou's uniqueness (Theorems 0.1, 0.2, 3.3.2) rests on Morel–Voevodsky's representability of K-theory of regular schemes by ℤ × Gr in H•(S). The A¹-homotopy category is not planned by any stage upstream of S.6 (MotivicEtaleKTheory M.5a is downstream).

Needed by: `S.6/riou-motivic-uniqueness`.

### Swan's theorem that R_A(G) is a special λ-ring

K-book Ex. II.4.2(a) cites Swan (Proc. Symp. Pure Math. 21, 1971) and SGA 6 VI 3.3; neither was read. The scheme construction does not use it (it uses R_ℤ(GL_N)), but the Quillen–Hiller form for arbitrary groups G requested by KTheoryFiniteLocalFields L.1 does whenever λ-identities in R_A(G) are needed beyond pullbacks from GL_N.

Needed by: `S.6/representation-ring`.

### Manin's identity for the Bott class of projective space

The proof of Soulé's Théorème 7 (step 5) cites Manin, 'Lectures on the K-functor in algebraic geometry', Russ. Math. Surveys 24 (1969), Lemma 18.4: k^r ch^{−1}(ψ^k(Td(P^r)^{−1}))ch(Td(P^r))^{−1} = θ^k(P^r). Not read.

Needed by: `S.7/adams-riemann-roch`.

### Soulé's Théorème 2 and the Beilinson–Soulé conjecture

The identification of the top weight K_m(F)^{(m)} of a field with Milnor K-theory modulo 𝒮_m (Soulé, Théorème 2, via Suslin's 'Homology of GL_n, characteristic classes and Milnor K-theory') is not planned; the vanishing of low weights (Beilinson–Soulé, K-book Conjecture IV.5.12) is a conjecture and is not claimed.

Needed by: `S.6/field-weight-decomposition`.

### Chow-valued Riemann–Roch over arithmetic bases

SchemeAndStackFoundations SF.5's source-scoped GRR (Borel–Serre over an algebraically closed field; SGA 6 VIII and Fulton 15.2 over a field) does not cover regular arithmetic surfaces over O_F, which EllipticKTheory E.6 and EllipticRegulators ER.6 use. S.7 provides Soulé's Riemann–Roch with values in γ-graded K-theory over a regular base (S.7/g-theory-adams-operations, S.7/adams-riemann-roch); a Chow-valued version over a Dedekind base (Fulton, Intersection theory, Ch. 20; Gillet's Riemann–Roch theorems for higher K-theory, Adv. Math. 40) is not public and not planned.

Needed by: `S.7/grothendieck-riemann-roch`, `S.7/adams-riemann-roch`.

### Exterior powers of sheaves of modules

λ^k[E] = [Λ^k E] on K_0(Vect X), the determinant and F^2_γ = SK_0 need exterior powers of O_X-modules and their local freeness for vector bundles. Mathlib has exterior powers of modules (ExteriorAlgebra.exteriorPower) but not of sheaves of modules, Tau Ceti has neither, and no layer of the atlas plans them; the suggested Lean file states the affected results without Λ^k.

Needed by: `S.6/vector-bundle-lambda-ring`, `S.7/gamma-first-graded-pieces`.

## Requests

What this roadmap imports, by supplier.

### AdicCoefficientsAndComparisons:L2

L2's text: 'First develop noetherian approximation: limits of schemes with affine transition maps, finite-presentation descent of morphisms and diagrams, eventual recognition of the relevant properties'. S.1 (and S.5's projective-bundle theorem for qcqs schemes) need absolute noetherian approximation as a declaration: every quasi-compact quasi-separated scheme X is the limit of a directed inverse system of schemes X_i of finite type over ℤ with affine (and schematically dominant) transition maps; if X is separated, or has affine diagonal, or has an ample family of line bundles, the X_i may be chosen with the same property (Stacks 01ZA, Limits 5.4; TT Theorem C.9); together with finite-presentation descent of finite locally free modules and of maps between finitely presented modules along such systems (Stacks Limits 10.2, 10.3). Mathlib provides the limit API (Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean) but not the existence of such an approximation. For a filtered projective system of noetherian schemes X_i with affine flat transition maps and noetherian limit X, Coh(X) is the filtered colimit of the Coh(X_i) along pullback, exact sequences included (EGA IV 8.5; Quillen §7 Proposition 2.2's input). L2's text: 'First develop noetherian approximation: limits of schemes with affine transition maps, finite-presentation descent of morphisms and diagrams, eventual recognition of the relevant properties, and étale/cohomological continuity.'

Needed by: `S.1/resolution-property-affine-diagonal`, `S.3/g-theory-continuity`, `S.5/projective-bundle-theorem`.

### AlgebraicModuliForArithmeticGeometry:R09.1

The projective bundle P(E) = Proj_X(Sym E) of a finite locally free O_X-module of constant rank r over an arbitrary scheme, with O(n), the tautological surjection π^*E → O(1), the standard affine cover when E is free, base change along any morphism and along inverse limits of schemes, and relative (very) ampleness of O(1) with Serre vanishing R^qπ_*(F(n)) = 0 for n ≫ 0 and F coherent over a noetherian base. R09.1: 'Construct projective bundles, Grassmannians and flag schemes with their quotient/subbundle universal properties, universal sheaves and base-change laws. Include relative ampleness and very ampleness'.

Needed by: `S.5/projective-bundle-cohomology`, `S.5/projective-bundle-koszul`, `S.5/mumford-regularity`, `S.5/mumford-regularity-lemmas`, `S.5/projective-bundle-theorem`, `S.5/regular-blowup-geometry`, `S.5/blowup-adjunction-lemma`, `S.5/blowup-acyclicity-criterion`.

### AlgebraicModuliForArithmeticGeometry:R09.7a

The blow-up X′ = Proj_X(⊕_{n≥0} J^n) of a quasi-coherent ideal of finite type, with O_{X′}(1), its universal property, the affine charts, compatibility with flat base change, the isomorphism away from the centre and the exceptional divisor as an effective Cartier divisor with ideal O_{X′}(1). R09.7a: 'Construct blowups by the Rees algebra with their projective universal property, affine charts, strict/total/controlled transforms and smooth base-change comparison.' The same construction is a target of the Tau Ceti StableReduction layer 4, which the atlas should name as the owner (see restructure).

Needed by: `S.5/regular-blowup-geometry`.

### GeneralAlgebraicKTheory:K.2:plus

Under the + = Q equivalence of GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q, the class of g ∈ GL_n(R) in π_1BGL(R)^+ corresponds to the class [g] ∈ π_2BQP(R) of the automorphism g of R^n represented by the square of K-book Ex. IV.7.9 (part (c) of that exercise). K.2:plus's text: 'identify its zero component naturally with BGL(A)⁺'. The plus-construction model K(A) ≃ K_0(A) × BGL(A)^+ with its block-sum H-space structure, functorial in A (K.2:plus: 'identify its zero component naturally with BGL(A)⁺ … The group-completion and zero-component comparisons must commute with ring maps and the appropriate block-sum operation'), and the identification of π_1 with K_1(A) = GL(A)^{ab}.

Needed by: `S.3/boundary-of-a-nonzerodivisor`, `S.3/dvr-boundary-unit-valuation`, `S.6/representation-classifying-map`, `S.6/quillen-hiller-operations`, `S.6/hiller-universality`, `S.6/product-low-degree-comparison`.

### GeneralAlgebraicKTheory:K.3

The boundary of Quillen's localisation for a Serre subcategory B ⊆ A sends the class [α] ∈ K_1(A/B) of an endomorphism α: A → A in A that is an isomorphism in A/B to [coker α] − [ker α] ∈ K_0(B) (K-book Ex. V.5.1), and the universal property of Gabriel's Serre quotient A → A/B for exact functors killing B. K.3's text: 'Prove Quillen localisation for a Serre subcategory of a small abelian category and its quotient.'

Needed by: `S.3/boundary-of-a-nonzerodivisor`, `S.3/coherent-quotient-by-support`.

### GeneralAlgebraicKTheory:K.4

K.4's text: 'Prove approximation and the comparison with the Q-construction for exact categories' and 'For bounded complexes of projectives, use quasi-isomorphisms ... Prove the Gillet–Waldhausen comparison'. S.1–S.2 need, besides the existing K.4 nodes (S-construction, approximation, Gillet–Waldhausen, delooping): (a) a natural transformation of exact functors that is objectwise a weak equivalence induces a homotopy of the induced maps of K-theory spectra (TT 1.5.4); (b) derived invariance: a complicial exact functor between complicial biWaldhausen categories closed under canonical homotopy pushouts and pullbacks that induces an equivalence of homotopy categories w^{-1}A ≃ w^{-1}B induces a homotopy equivalence K(A) ≃ K(B) (TT 1.9.8; K-book V.3.9), including the variant for a functor induced by an additive functor between different ambient abelian categories (K-book Ex. V.3.12). (b) follows from the approximation theorem K.4 proves; it is used for every model comparison of K(X) and G(X).

Needed by: `S.2/k-theory-of-a-scheme`, `S.2/k-theory-model-invariance`, `S.2/g-theory-models`, `S.2/k-theory-pullback`, `S.2/g-theory-finite-tor-pullback`, `S.2/g-theory-proper-pushforward`, `S.2/k-theory-proper-pushforward`, `S.2/pushforward-functoriality`, `S.2/k-theory-base-change`, `S.2/projection-formula`, `S.2/affine-k-theory-comparison`, `S.2/affine-pullback-is-scalar-extension`, `S.2/affine-pushforward-is-transfer`, `S.2/vector-bundle-k-theory-comparison`, `S.2/cartan-map`, `S.2/k-theory-continuity`.

### GeneralAlgebraicKTheory:K.6

(1) The ring fundamental theorem with Nil terms in every degree (K-book V.8.1–V.8.2, III.3.6–3.7, III.4.1): 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t, t⁻¹]) → K_{n−1}(R) → 0 split by multiplication by t ∈ K_1(ℤ[t, t⁻¹]), Nil_n(R) ≅ NK_{n+1}(R), and in particular for R = ℤ that K_1(ℤ[T, T⁻¹]) is generated by the images of K_1(ℤ[T^{±1}]) and T·K_0(ℤ); K.6: 'Prove localisation in the nonconnective formulation and the fundamental theorem with Nil terms'. S.5 extends it to schemes and compares (S.5/affine-fundamental-theorem-comparison); the scheme form K.6's open blueprint requests from S.5 is S.5/bass-fundamental-theorem, and K.6 must not cite S.5 back (restructure). (2) Additivity of the non-connective K of Frobenius pairs: for a cofibration sequence F′ ↣ F ↠ F″ of exact functors, F_* = F′_* + F″_* on IK_n for all n ∈ ℤ, used by S.5's projective-bundle and blow-up arguments in negative degrees.

Needed by: `S.5/bass-boundary-splitting`, `S.5/affine-fundamental-theorem-comparison`, `S.5/pbt-split-injection`, `S.5/pbt-regular-approximation`.

### GeneralAlgebraicKTheory:K.7

K.7's text: 'Construct external products from biexact functors and their associativity, unit and symmetry homotopies.' S.2 needs, for Waldhausen categories of complexes: the pairing K(A) ∧ K(B) → K(C) of a biexact functor (K.7/biexact-pairings-and-products), natural in exact functors of each variable, and homotopy invariance: two biexact functors related by a natural transformation that is objectwise a weak equivalence induce homotopic pairings (used for the projection formula, TT 3.17; K-book V.3.12 via IV.8.11). For a biexact pairing A × C → A' inducing B × C → B' and A/B × C → A'/B' (or the corresponding pairing of exact sequences of Frobenius pairs), the localisation boundary satisfies ∂({x, y}) = {∂(x), y} (K-book Ex. V.5.3 and Ex. V.8.2), with the degree convention stated. K.7's text: 'Prove compatibility with relative groups, localisation boundaries and transfers.' Compatibility of the products induced by biexact functors with Mayer–Vietoris and localisation boundaries: for the pairing K(P¹_X) ∧ K(U) → K(U) restricted to the opens of a Zariski cover, ∂(a · r^*b) = ∂(a) · b (with the sign convention stated); K.7: 'Prove compatibility with relative groups, localisation boundaries and transfers.' Used to compute ∂_T(T ∪ x) = ∂_T(T)·x. The generic external products from biexact functors of Waldhausen categories satisfying the admissibility condition, with their associativity, unit and symmetry homotopies, the resulting graded commutativity on homotopy groups, and the extension of the pairing to the nonconnective spectra of K.6; K.7's text: 'Construct external products from biexact functors and their associativity, unit and symmetry homotopies. For commutative rings obtain graded-commutative K-groups. Prove compatibility with relative groups, localisation boundaries and transfers.' S.6 specialises them to perfect complexes with supports (TT 3.15) and does not re-prove them.

Needed by: `S.2/tensor-product-pairings`, `S.3/boundary-module-linearity`, `S.5/bass-boundary-splitting`, `S.6/support-product-pairings`, `S.6/graded-commutative-ring`.

### SchemeAndStackFoundations:SF.2

SF.2's text: 'construct sheaf cohomology, localization, proper/smooth base change'. S.1–S.2 need the quasi-coherent cohomology of schemes: Serre's vanishing H^p(Spec A, M~) = 0 for p > 0 (Stacks Cohomology of Schemes 2.2); for f : X → Y quasi-compact quasi-separated with Y quasi-compact, R^pf_*F is quasi-coherent for quasi-coherent F and vanishes for p ≥ N(X, Y, f), uniformly after base change (Cohomology of Schemes 4.5); cohomology of quasi-coherent sheaves on qcqs schemes commutes with direct sums (Cohomology of Schemes 6.1); affine base change (Cohomology of Schemes 5.1); and Grothendieck's coherence theorem: R^if_*F coherent for f proper over a locally noetherian base (Cohomology of Schemes 19.1, 26.10; recorded as a gap). (1) For U = D(f_1) ∪ ⋯ ∪ D(f_r) ⊆ Spec A and M^• a complex of A-modules: colim_e Hom^•(I^•(f_1^e, …, f_r^e), M^•) computes RΓ(U, M~^•) (Stacks 08D0, 08DD), and Hom(K(f)[n], E) = 0 for all n iff E = Rj_*(E|_U) (Stacks 09IR). (2) Grothendieck's vanishing theorem H^p(X, A) = 0 for p > dim X on a noetherian space (used by TT 10.2). (3) The SGA 4 X 4.1-type induction bounding Nisnevich cohomological dimension by Krull dimension and exactness of finite pushforward on Nisnevich sheaves (TT E.6). SF.2's text: 'Own Zariski, etale, fppf and pro-etale site comparisons at the appropriate coefficient level; construct sheaf cohomology, localization, proper/smooth base change and compact support.'

Needed by: `S.1/affine-derived-equivalence`, `S.1/coherator`, `S.1/resolution-property-affine-diagonal`, `S.2/derived-tor-independent-base-change`, `S.2/proper-pushforward-coherent`, `S.2/total-direct-image-qcqs`, `S.3/affine-lifting-of-morphisms`, `S.3/supported-perfect-generator`, `S.4/zariski-descent-spectral-sequence`, `S.4/nisnevich-cohomological-dimension`.

### SchemeAndStackFoundations:SF.5

Chow groups CH^p(X) of cycles modulo rational equivalence with the equality of the two descriptions of rational equivalence (divisors div_Y(f) of rational functions on codimension-(p − 1) subvarieties, with orders by length, versus the X × P¹ definition; Fulton Proposition 1.6), which K-book Lemma V.9.4.1 uses to identify E_2^{p,−p} with Fulton's Chow group. SF.5's text: 'Construct Chow groups, rational equivalence, proper pushforward, flat/lci pullback'. For smooth quasi-projective varieties over a field (and regular noetherian schemes where the source allows): Chow groups CH^* with proper pushforward, flat/lci pullback, intersection product and the localisation sequence; Chern classes c_i of vector bundles with the Whitney formula, c_1(O(D)) = [D], naturality and the splitting principle through the projective and flag bundles of S.6/complete-flag-bundle; the Todd class; the deformation to the normal cone W = Bl_{Y×0}(X × A¹) of a regular closed immersion over a regular base, with its fibres (used in S.6/riemann-roch-without-denominators); and the source-scoped Grothendieck–Riemann–Roch ch(f_!x)td(T_Y) = f_*(ch(x)td(T_X)) for projective (Borel–Serre: proper, over an algebraically closed field) morphisms of smooth quasi-projective varieties, with f_! = Σ(−1)^q[R^qf_*], including f: P^r → Spec F. SF.5's text: 'Construct Chow groups, rational equivalence, proper pushforward, flat/lci pullback, refined Gysin maps, Chern classes and intersection products. Prove source-scoped Grothendieck-Riemann-Roch'.

Needed by: `S.4/coniveau-chow-group`, `S.6/riemann-roch-without-denominators`, `S.7/chern-character`, `S.7/chern-character-ring-homomorphism`, `S.7/chern-character-adams`, `S.7/chern-class-of-subvariety`, `S.7/gamma-chow-comparison`, `S.7/grothendieck-riemann-roch`, `S.7/adams-riemann-roch`.

### StableHomotopyKTheory:H.5:spectra

Homotopy limits of cosimplicial fibrant spectra (Bousfield–Kan) with their spectral sequence E_2^{p,q} = π^pπ_q ⇒ π_{q−p} holim and Thomason's convergence criteria (Thomason 1985 §5.13, 5.31, 5.44-5.48), Postnikov towers of spectra, filtered homotopy colimits, and presheaves of spectra with objectwise fibrant replacement. H.5:spectra's text: 'Construct suspension spectra, loop and shift, stable homotopy groups indexed by integers, stable equivalences, homotopy fibres/cofibres, and long exact sequences. Construct the stable homotopy category and enough functorial fibrant/cofibrant replacement to justify the operations used.'

Needed by: `S.4/mayer-vietoris-property`, `S.4/brown-gersten-vanishing`, `S.4/sheaf-hypercohomology-spectrum`, `S.4/hypercohomology-spectral-sequence`, `S.4/codimension-support-filtration`, `S.4/k-coniveau-spectral-sequence`.

### tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map

RS-18's supplier of the degree-zero categorical Cartan map: 'the Cartan map K₀(proj A) → G₀(mod A) and its inverse under finite projective resolutions', already built in the pinned Tau Ceti as TauCeti.cartanMap, TauCeti.cartanEquiv and TauCeti.cartanMap_bijective (cited as baseline). S.2 imports it, proves that π_0 of the scheme-level Cartan map on Spec R is this map, and supplies the regular-ring hypothesis through Serre's theorem; nothing of layer 4 is rebuilt.

Needed by: `S.2/cartan-degree-zero-compatibility`, `S.2/cartan-map`.

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree

Invertible sheaves and Pic X under ⊗, Weil and Cartier divisors with Cl(X) ≅ Pic X on a smooth curve, and the degree deg L = χ(L) − χ(O_X) with deg O(D) = Σ[κ(x):k]ord_x (layer A: 'Invertible sheaves on a scheme; the Picard group Pic X under ⊗ … Define deg L := χ(L) − χ(O_X) … prove agreement'), used for F^1_γ/F^2_γ ≅ Pic(X) and for Hirzebruch–Riemann–Roch on curves. RS-18 names this layer as S.7's supplier.

Needed by: `S.7/gamma-first-graded-pieces`, `S.7/hirzebruch-riemann-roch`.

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality

Coherent cohomology of a smooth projective curve over k, its genus, Riemann–Roch and Serre duality (layer B's title), in the form dim H^0(X, O(D)) = ℓ(D), dim H^1(X, O(D)) = ℓ(W − D) and agreement of the genus with Tau Ceti's function-field genus, used to compare S.7's Hirzebruch–Riemann–Roch with TauCeti.exists_isRiemannRochDivisor.

Needed by: `S.7/hirzebruch-riemann-roch`.

### tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-4-characters-and-schur-polynomials

The torus character of a rational GL_n(ℂ)-representation is a symmetric Laurent polynomial, the characters of the irreducibles are det-twisted Schur polynomials, and (with layer 3's highest-weight classification) the character map from the representation ring of GL_n(ℂ) to ℤ[X_1^{±1}, …, X_n^{±1}]^{S_n} is an isomorphism (layer 4: 'Characters are Schur polynomials … The rational character is Laurent'); S.6 needs the version over ℚ, 𝔽_p and ℤ of Serre 1968, which starts from this.

Needed by: `S.6/serre-representation-ring-theorem`.

### tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces

The general blow-up of a quasi-coherent finite-type ideal as a relative Proj, which this Tau Ceti layer constructs ('Construct the Rees algebra and the blowup of a quasi-coherent finite-type ideal as a relative Proj. Prove the universal property, properness/projectivity, compatibility with flat base change, behaviour away from the centre, exceptional divisor, strict transform, and affine chart descriptions'); S.5's regular-centre blow-up formula is stated for this construction.

Needed by: `S.5/regular-blowup-geometry`.

## Structural proposals

### Quasi-coherent and coherent cohomology of morphisms needs a stated owner

*rescope.* S.1 (affine derived equivalence, coherator, resolution property ⇒ affine diagonal) and S.2 (total direct image, proper pushforward, base change) use Serre vanishing on affines, the cohomological bound for qcqs morphisms, cohomology commuting with direct sums, affine base change and Grothendieck's coherence theorem for proper morphisms. SchemeAndStackFoundations SF.2 is the closest layer ('construct sheaf cohomology ... proper/smooth base change') but its text and source route are étale; Tau Ceti's JacobianChallenge layer B covers only curves over a field. Propose that SF.2 state these quasi-coherent results explicitly (Stacks Cohomology of Schemes §§2–6, 19, 26), so that S.1–S.2 import them instead of recording a gap.

### Derived invariance of Waldhausen K-theory (TT 1.9.8) as an explicit K.4 node

*rescope.* Every model comparison of S.1–S.2 (TT 3.5–3.13, the affine comparison, the vector-bundle comparison, change of universe) uses TT 1.9.8: a complicial exact functor inducing an equivalence of homotopy categories induces a homotopy equivalence of K-theory spectra. It is a corollary of Waldhausen approximation (K.4) but no K.4 node states it; propose adding it to GeneralAlgebraicKTheory K.4 (request filed).

### The tensor-product pairings are constructed in S.2 and extended in S.6

*boundary.* RS-18 gives the projection formula to S.2 ('General scheme derived pullback/proper-perfect pushforward/transfer comparisons and projection formula: owner S.2'), and its statement in all degrees needs the pairings K(X) ∧ K(X) → K(X) and K(X) ∧ G(X) → G(X). They are therefore constructed once, in S.2/tensor-product-pairings, from K.7's biexact-pairing construction; S.6 (author D's plan) builds on them the ring and module structure, supports, relative theories and external products. The stage edge S.2 → S.6 already exists, so no cycle arises.

### Nonconnective K-theory of a scheme placed in S.2

*rescope.* S.3's localisation fibre sequence is stated 'in the nonconnective theory'. The nonconnective spectrum 𝕂(X) of the Frobenius pair of perfect complexes (Schlichting 5.10, K.6) is defined in S.2 (nonconnective-k-theory-of-a-scheme) next to K(X), with the Frobenius model in S.1; S.3 imports it.

### Absolute noetherian approximation belongs in the scheme foundations

*rescope.* Absolute noetherian approximation (Stacks 01ZA; TT C.9) is used by S.1 (resolution property ⇒ affine diagonal for non-noetherian qcqs schemes) and by S.5 (the projective-bundle theorem for qcqs schemes, with S.2/k-theory-continuity). The only stage whose text plans it is AdicCoefficientsAndComparisons L2 ('First develop noetherian approximation: limits of schemes with affine transition maps ...'), an étale-cohomology layer; a request is filed there. Propose moving this foundational content to SchemeAndStackFoundations (SF.0 schemes and morphisms or SF.1), from which L2 and the K-theory stages would all import it.

### S.2's Cartan equivalence does not need finite dimension

*rescope.* The stage text asks for the Cartan equivalence 'in the regular noetherian finite-dimensional cases used by arithmetic'. TT 3.21 proves it for every quasi-compact scheme whose local rings have finite Tor-dimension on finitely presented modules, in particular every regular noetherian scheme, separated or not, of any dimension; cartan-equivalence states this generality. A future revision of the stage text can drop 'finite-dimensional'.

### S.3 cannot import the tame-symbol owners RS-18 assigns to it

*cycle.* RS-18 (owners 4-5; S.3 suppliedBy) routes the classical tame symbol and its localisation comparison from K2SymbolsBrauer T.3:symbols and T.3:localization-comparison into S.3. In the current stage graph they are downstream of S.3: K2SymbolsBrauer T.3/localization-boundary cites T.2/graded-map and T.2/matsumoto, and T.2:graded-map ← K3BlochGroups V.2 ← MotivicEtaleKTheory M.4 ← SchemeKTheoryOperations S.6 ← S.5 ← S.4 ← S.3; independently K2SymbolsBrauer T.1:classical cites the combined stage GeneralAlgebraicKTheory:K.2, whose sub-stage K.2:low-degree-comparisons ← K3BlochGroups V.4 ← V.2 ← M.4 ← S.6. Proposal: (1) remove the V.2 → T.2:graded-map dependence (the graded map from Milnor K-theory is early material that V.2 should consume, not supply), or route K3BlochGroups V.2's use of S.6 through a downstream sub-stage; (2) make T.1:classical cite GeneralAlgebraicKTheory:K.2:plus instead of the combined K.2. After that S.3 imports T.3/tame-symbol and T.3/localization-boundary and adds a comparison node identifying ∂_S on K_2 with the tame symbol (in the K-book's right-linear normalisation ∂{π, u} = ū, the inverse of T.3's symbol). Meanwhile S.3 supplies T.3 the degree-one normalisation ∂[π] = [R/πR] = [k] that T.3/localization-boundary lists as its gap (S.3/dvr-boundary-unit-valuation) and the unit-product values (S.3/dvr-boundary-on-unit-products).

### K-book Corollary V.6.7.1 belongs to S.5

*move.* The split Gersten sequence 0 → K_n(k) → K_n(k(t)) → ⊕_p K_{n−1}(k[t]/p) → 0 uses K_n(k) ≅ K_n(k[t]) (SchemeKTheoryOperations S.5/homotopy-invariance-regular), downstream of S.4. Plan it in S.5 as an application of S.4/gersten-dvr-split and S.3/dedekind-localisation-sequence (both upstream of S.5); it is S.5's comparison of localisation for A¹ with the fundamental theorem, which S.5's author already lists (S.5/punctured-line-localisation-test).

### Gersten's DVR conjecture for finite residue fields and finite coefficients is KTheoryFiniteLocalFields L.2's

*ownership.* K-book 6.9.1 (finite coefficients: Gabber rigidity, Geisser–Levine) and 6.9.2/Ex. 6.11 (finite or algebraic-over-𝔽_p residue fields: Quillen's K_*(𝔽_q)) need inputs owned by KTheoryFiniteLocalFields L.1-L.2, which are downstream of S.4 (L.1 ← S.6). L.2 already plans the henselian cases (henselian-dvr-mod-m-splitting, even-k-field-splitting) on top of the DVR localisation sequence; record L.2 as the owner of these explicit arithmetic DVR Gersten statements, and S.4 as owner of the equicharacteristic and the source-scoped Gillet–Levine reductions.

### ER.6's residue-composite request is supplied by S.4, not S.3

*routing.* RS-18 links S.3 → EllipticRegulators ER.6. The vanishing of K_2(F) → ⊕_D k(D)^× → ⊕_x ℤ on a regular surface is d_1 d_1 = 0 of the coniveau spectral sequence (S.4/residue-composite-vanishes); add the link S.4 → ER.6 (cycle-free by the helper) and point ER.6 at that node. EllipticKTheory E.6/vertical-residues already cites S.4.

### Proposed sub-layers of S.3

*sub-layers.* S.3:supports — perfect-complexes-with-support, support-k-theory, the extension and fully-faithfulness lemmas (affine-extension-of-perfect, affine-lifting-of-morphisms, extension-up-to-summand, supported-perfect-generator, killing-morphisms-into-supported, restriction-quotient-fully-faithful, extension-k0-criterion), perfect-localisation-exact-sequence, localisation-fibre-sequence, connective-localisation-sequence, localisation-boundary, boundary-pullback-naturality, boundary-module-linearity, infinitely-near-equivalence, excision, disjoint-support-additivity, affine-support-comparison, divisor-support-comparison. S.3:G — coherent-sheaves-with-support, coherent-quotient-by-support, coherent-support-devissage, g-theory-localisation, g-theory-continuity, cartan-localisation-comparison, regular-support-devissage, boundary-of-a-nonzerodivisor, unit-boundary-is-divisor, boundary-finite-pushforward-naturality. S.3:applications — unit-loop-class, dvr-localisation-sequence, dvr-boundary, dvr-boundary-unit-valuation, dvr-boundary-on-unit-products, specialisation-map, specialisation-of-restriction, algebraically-closed-injectivity, dedekind-localisation-sequence, one-dimensional-localisation-sequence, weil-reciprocity-k-theory, arithmetic-surface-localisation, vertical-residue-compatibility.

### Proposed sub-layers of S.4

*sub-layers.* S.4:descent — zariski-mayer-vietoris, g-theory-mayer-vietoris, mayer-vietoris-property, brown-gersten-vanishing, nisnevich-site, nisnevich-cohomological-dimension, nisnevich-excision-square, sheaf-hypercohomology-spectrum, hypercohomology-spectral-sequence, k-theory-sheaves, codimension-support-filtration, coniveau-layer-fibre-sequence, zariski-descent, zariski-descent-spectral-sequence, nisnevich-descent. S.4:coniveau — k-coniveau-spectral-sequence, coherent-codimension-filtration, coniveau-quotient-decomposition, g-coniveau-spectral-sequence, coniveau-flat-functoriality, coniveau-residue-differential, coniveau-weight-one-differential, residue-composite-vanishes, coniveau-chow-group, one-dimensional-coniveau, k-coniveau-first-page-regular. S.4:gersten — gersten-quillen-property, gersten-conditions-equivalent, quillen-presentation-lemma, quillen-effacement, quillen-gersten-theorem, gersten-power-series, panin-equicharacteristic-gersten, gersten-resolution, bloch-formula, gersten-dvr-split, gersten-dvr-equicharacteristic, gillet-levine-smooth-over-dvr, mixed-char-higher-effacement, mixed-char-k0-generation, mixed-char-gersten-partial-exactness, mixed-char-gersten-from-dvr, descent-coniveau-e2-comparison.

### The exact-sequence form of the blow-up formula and the K-theoretic excess intersection formula

*rescope.* Thomason's K-theoretic excess intersection formula (1993, Théorème 3.1: f^*i_* = i′_*([λ_{−1}F] ∪ f′^*) for a cartesian square of regular immersions) is a statement about K of perfect complexes, needed by S.5 for the exact sequence 0 → K_n(Y) → K_n(Y′) ⊕ K_n(X) → K_n(X′) → 0 (Remarque 2.2) and by S.7 for the self-intersection formula EllipticKTheory requests. S.7 lies downstream of S.5. Proposal: plan Théorème 3.1 (with Lemme 3.2 and 3.3–3.4) in S.5, after the codimension-one triangle S.5/codimension-one-triangle, and let S.7 cite it; or keep it in S.7 and move Remarque 2.2 there. S.5 plans the product decomposition (Théorème 2.1) only.

### The codimension-one triangle is the base case of S.7's self-intersection formula

*build-on.* S.5/codimension-one-triangle (Thomason 1993 (3.5.2)) is planned in S.5 because the blow-up formula needs it. S.7's self-intersection and excess formulas should cite it for codimension one rather than re-plan it.

### The scheme clause of K.6's agreement with Thomason's K^B rests on S.5

*cycle.* GeneralAlgebraicKTheory K.6/agreement-and-vanishing-of-negative-K states agreement of Schlichting's IK(X) with Thomason–Trobaugh's K^B(X) for quasi-compact quasi-separated schemes, and its own hypotheses record that this rests on the projective bundle theorem and the Bass fundamental theorem 6.6(b) for schemes, which RS-18 gives to S.5. S.2 (upstream of S.5) announces the same agreement in S.2/nonconnective-k-theory-of-a-scheme. S.5 therefore proves the projective bundle theorem and the Bass fundamental theorem directly for S.2's non-connective K (additivity, derived invariance, S.3 localisation, S.4 Mayer–Vietoris) and never uses the agreement. Proposal: move the scheme clause of the agreement to S.5 as a comparison after S.5/bass-fundamental-theorem, and restrict K.6's and S.2's statements to rings and to the definition.

### K.6's open blueprint cites S.5 for the scheme fundamental theorem

*cycle.* The open GeneralAlgebraicKTheory K.6 blueprint lists SchemeKTheoryOperations:S.5 as a prerequisite of K.6/fundamental-theorem-with-nil-terms for the scheme version (K-book V.8.3). K.6 → S.2 → S.3 → S.4 → S.5 in the stage graph, so this edge closes a cycle. RS-18 makes S.5 the owner of the scheme form; K.6 should state the ring form only, and S.5/affine-fundamental-theorem-comparison relates the two.

### Blow-ups have two planned owners

*duplicate-owner.* The general Rees-algebra blow-up is a target of the Tau Ceti StableReduction layer 4 (existing work) and of AlgebraicModuliForArithmeticGeometry R09.7a (proposed). S.5 cites R09.7a as the atlas prerequisite (a Tau Ceti layer cannot be a prerequisite string) and requests both. Proposal: R09.7a imports the construction from StableReduction layer 4 and keeps only its resolution-specific transforms.

### Proposed sub-layers of S.5 for the atlas

*sub-layers.* S.5 reads as four stars: (S.5a) homotopy invariance: graded-quillen-lemma, rees-dehomogenisation, g-theory-homotopy-invariance-affine, zero-section-transfer-vanishes, g-theory-homotopy-invariance, g-theory-laurent-decomposition, homotopy-invariance-regular, laurent-decomposition-regular, negative-k-vanishing-regular; (S.5b) projective bundles: projective-bundle-cohomology, projective-bundle-koszul, mumford-regularity, mumford-regularity-lemmas, quillen-resolution, pbt-split-injection, pbt-regular-approximation, projective-bundle-theorem-noetherian, projective-bundle-theorem, projective-line-k-theory; (S.5c) fundamental theorem: laurent-extension-and-nk, bass-fundamental-theorem, bass-boundary-splitting, nk-decomposition, affine-fundamental-theorem-comparison, punctured-line-localisation-test; (S.5d) blow-ups: regular-blowup-geometry, blowup-adjunction-lemma, codimension-one-triangle, blowup-exceptional-triangles, blowup-acyclicity-criterion, blowup-waldhausen-filtration, blowup-formula, blowup-exceptional-divisor-tests, blowup-image-on-complement.

### The K-theoretic splitting principle is planned in S.6, not S.7

*ordering.* The S.7 stage text asks to 'Prove the splitting principle through projective/flag bundles, including pullback injectivity where used', and RS-18 keeps it in S.7. But S.6 uses it: Soulé's Riemann–Roch without denominators (reduction of the universal polynomial to rank one), and the K_0 statements of S.6/representation-frobenius. Since S.7 is downstream of S.6, the flag bundle and the K-theoretic splitting principle are planned as S.6/complete-flag-bundle and S.6/k-theoretic-splitting-principle, with realises [S.6, S.7]. Proposal: move this target from S.7's description to S.6's (or to S.5, next to the projective bundle theorem it iterates); S.7 keeps the Chow-theoretic splitting principle, which is SF.5's.

### The abstract λ-ring algebra should be owned by KTheoryLowDegrees Z.3

*ownership.* S.6 plans the abstract theory of special λ-rings (S.6/lambda-universal-polynomials, S.6/lambda-ring, S.6/laurent-lambda-ring, S.6/lambda-identity-principle, S.6/adams-operations, S.6/adams-additivity-square-zero, S.6/adams-multiplicative-composition, S.6/gamma-filtration, S.6/adams-eigenvalue-on-gamma-graded, S.6/rational-weight-decomposition, S.6/bott-cannibalistic-class) because no layer upstream plans it. KTheoryLowDegrees Z.3 owns the λ-ring identities on K_0 of a ring (RS-18 owner 'Early ring K0 tensor, exterior/virtual lambda operations') and its packet leaves open 'the noncircular splitting-principle supplier for special-lambda product/iteration polynomials' and the Newton-recursion Adams normalisation; with RS-18's direction Z.3 → S.6 it cannot import these nodes. Proposal: move the listed abstract nodes into Z.3 (as 'Grothendieck groups, Cartan maps, and Euler forms, Part II', layer Z.3), where they serve both Z.3's identities on K_0(A) (with the representation-ring proof of S.6/vector-bundle-lambda-ring, which needs no splitting principle) and S.6; until then Z.3's remaining item stays open.

### GeneralAlgebraicKTheory K.7's product node mentions schemes

*overlap.* The integrated decomposition node GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products states 'For a commutative ring R (or scheme X), tensor product makes K_*(R) (K_*(X)) a graded-commutative ring'. RS-18 assigns the extension of K.7's products to schemes, supports and relative theories to S.6 (S.6/graded-commutative-ring, S.6/support-product-pairings, S.6/relative-k-theory-module). Proposal: K.7's blueprint drops '(or scheme X)' and cites S.6.

### Chow-valued Riemann–Roch over arithmetic bases has no owner

*boundary.* S.7's text asks for Riemann–Roch 'in the generality used by M and ER', and RS-18 keeps in S.7 'any extension beyond SF.5's verified source scope'. EllipticKTheory E.6 and EllipticRegulators ER.6 work on regular arithmetic surfaces, beyond SF.5's scope (varieties over a field). S.7 plans Soulé's γ-graded Riemann–Roch over a regular base, which covers them in γ-graded K-theory; the Chow-valued version over a Dedekind base (Fulton Ch. 20, Gillet 1981) has no public source here. Proposal: add it to SchemeAndStackFoundations SF.5's scope, or accept the γ-graded form as the one E.6/ER.6 consume.

### The open K.6/K.7 blueprint cites S.5 and S.6 and would close cycles

*cycle.* The GeneralAlgebraicKTheory K.6/K.7 blueprint in an open pull request (not on main) has GeneralAlgebraicKTheory:K.7/graded-commutativity citing SchemeKTheoryOperations:S.6 and GeneralAlgebraicKTheory:K.6/fundamental-theorem-with-nil-terms citing SchemeKTheoryOperations:S.5. The atlas and RS-18 have K.6 → S.2 → ⋯ → S.5 → S.6 and K.7 → S.6, and this fragment's S.6 nodes cite K.7 (S.6/support-product-pairings, S.6/graded-commutative-ring): with that pull request merged, the cycle checker (run with the open packets) reports S.6 ← K.7 ← S.6 and S.5 ← K.6 ← … ← S.5 for every such edge. Proposal: K.7/graded-commutativity proves the ring case from K.7's own symmetry homotopy and drops its S.6 citation (the scheme case is S.6/graded-commutative-ring), and K.6/fundamental-theorem-with-nil-terms drops the quasi-projective scheme sentence and its S.5 citation (RS-18 gives the geometric extension to S.5).

### No cycle through the tame symbol is needed by S.6

*cycle.* S.6/residue-weight-shift checks ∂ψ^k = kψ^k∂ on symbols using only ψ^k = k² on products of two units (S.6/adams-on-units-and-products); it does not cite K2SymbolsBrauer T.3's tame-symbol identification, which is downstream of S.6 through K3BlochGroups V.2 → MotivicEtaleKTheory M.4 → S.6. No edge from S.6 or S.7 to K2SymbolsBrauer T.1, T.2 or T.3 or to MotivicEtaleKTheory is used.

### KTheoryLowDegrees U.5 and U.6 should cite S.3's DVR-boundary nodes

*interface.* U.5/dvr-boundary-localisation-comparison and U.6/uniformiser-boundary-one (correction PR #2919) import 'the boundary ∂_S : K₁(L) → K₀(k) of the localisation sequence K(k) → K(O) → K(L), and its unit-valuation normalisation ∂_S(λ(u)) = v(u)·[k] for u ∈ L^×, with λ : L^× → π₁K(L) the loop of a 1 × 1 matrix'; this is S.3/dvr-boundary with S.3/dvr-boundary-unit-valuation and S.3/unit-loop-class, which use only StableHomotopyKTheory H.1/H.3, GeneralAlgebraicKTheory K.2:plus/K.3/K.6/K.7 and KTheoryLowDegrees Z.2/U.1/U.3 (no U.5/U.6 node), so the RS-18 direction S.3 → U.5 is respected. U.5 should cite these node ids in place of the stage.

### ER.6's residue-composite request is supplied by S.4/residue-composite-vanishes

*interface.* ER.6/potentially-good-reduction-integrality requests from S.3 that on a regular two-dimensional scheme the composite K_2(F) → ⊕_D k(D)^× → ⊕_x ℤ is zero. It is supplied by S.4/residue-composite-vanishes (d_1 d_1 = 0 of the coniveau spectral sequence), a node of S.4 rather than S.3; the helper confirms ER.6 may cite S.4 without a cycle.

### P.5's Gersten–Bloch comparison needs higher Chow groups, which are MotivicEtaleKTheory's

*interface.* P.5/higher-arakelov-chow-degree-zero requests from S.4 the agreement of the last two cohomology groups of the Gersten complex with those of Bloch's cycle complex. S.4 supplies the Gersten complex, its exactness in the proved cases (S.4/quillen-gersten-theorem, S.4/gersten-conditions-equivalent) and H^p(X, 𝒦_p) ≅ CH^p(X) (S.4/bloch-formula); the comparison with Bloch's cycle complex needs higher Chow groups, which RS-18 and S.7's text assign to MotivicEtaleKTheory (M.4), so it stays P.5's gap or M.4's.

### Boundary conventions: S.3's right-linear boundary against L.2's left-linear one

*interface.* L.2/dvr-localisation fixes the left-linear convention ∂(x·y) = r(x)·∂(y); S.3 fixes the right-linear convention (K-book V.6.6.1) with ∂λ(π) = +[k]. The two agree on K_1 and differ by (−1)^{n−1} on K_n (S.3/localisation-boundary, API item localisationBoundary_left); L.2's section formulas should be read through that conversion, and L.2's Gersten statements for henselian DVRs with finite residue field (6.9.1-6.9.2 type) are the owner of what S.4 does not plan.

## Dependencies between the layers

Within the roadmap, the nodes of each layer use the nodes of these other layers; the graph is acyclic.

- **S.2** uses S.1.
- **S.3** uses S.1, S.2.
- **S.4** uses S.2, S.3.
- **S.5** uses S.1, S.2, S.3, S.4.
- **S.6** uses S.1, S.2, S.3, S.4, S.5.
- **S.7** uses S.1, S.2, S.3, S.4, S.5, S.6.

The atlas requirements of each layer:

- **S.1** requires `UPSTREAM:Schemes-vector-bundles`.
- **S.2** requires `GeneralAlgebraicKTheory:K.6`, `SchemeKTheoryOperations:S.1`.
- **S.3** requires `GeneralAlgebraicKTheory:K.3`, `SchemeKTheoryOperations:S.2`.
- **S.4** requires `SchemeKTheoryOperations:S.3`.
- **S.5** requires `SchemeKTheoryOperations:S.4`.
- **S.6** requires `GeneralAlgebraicKTheory:K.7`, `SchemeKTheoryOperations:S.5`.
- **S.7** requires `SchemeKTheoryOperations:S.6`.

## What this blueprint does not claim

- **Missing proofs.** The proofs no obtainable source contains are not supplied; each is a gap with the nodes that need it. The main ones are:
  - Grothendieck's coherence theorem for proper morphisms;
  - vector bundles on the doubled affine plane;
  - the SGA 6 inputs (twisted operations, F^{d+1}_γ K₀ = 0);
  - Hiller's universality and Quillen's homology isomorphism;
  - Gillet–Levine's and Panin's Gersten theorems;
  - the Brown–Gersten model structure;
  - Fulton's factorisation lemma.
- **Tame symbol.** The identification of the scheme boundary on K₂ with the tame symbol is not claimed. Its owner, K2SymbolsBrauer T.3, lies downstream of S.3 in the current stage graph.
- **Mixed characteristic.** No general mixed-characteristic Gersten theorem is claimed. Gersten's DVR conjecture appears only as a hypothesis.
- **KH.** Homotopy K-theory is not constructed, since no consumer uses it, and ordinary K-theory is never replaced by it.
- **Higher cycles.** Higher Chow groups and the higher Chern character are MotivicEtaleKTheory's. Chow-valued Riemann–Roch over arithmetic bases has no owner and is not claimed.
- **Formalisation.** Nothing here is formalised. The suggested Lean file names the objects and states what the pinned libraries can express; the rest is recorded there as comments.
