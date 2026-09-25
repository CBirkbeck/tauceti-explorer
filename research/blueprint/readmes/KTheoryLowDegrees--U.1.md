# Explicit K₀ and K₁: projectives, rank, stable matrices and the determinant

*Roadmap `KTheoryLowDegrees`, part U.1: stages Z.1, Z.2 and U.1–U.6. The companion part `KTheoryLowDegrees--Z.3` has Z.3–Z.6.*

This document is definitive. Its machine form is the packet `research/blueprint/packets/KTheoryLowDegrees--U.1.json`, from which it is generated, so that the two agree. The suggested Lean file `research/blueprint/suggested/KTheoryLowDegrees--U.1.lean` is a naming proposal, not an implementation; implementationStatus is `unchecked` for every node. Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Purpose and scope

This part plans the explicit algebraic K-theory of rings in degrees zero and one: finitely generated projective modules and ring K₀ with its rank, the stable general linear group and its elementary subgroup, the Whitehead group K₁ with the determinant, and the arithmetic theorem SK₁(O_{F,S}) = 0. The companion part `KTheoryLowDegrees--Z.3` builds the tensor, exterior-power and determinant calculus of K₀ and the Dedekind-domain and curve computations on top of Z.1 and Z.2.

- **Z.1.**
  - It presents a finitely generated projective as a direct summand of a finite free module, with the complement, the splitting maps and the idempotent matrix as data.
  - It classifies projectives by idempotent matrices up to stabilised conjugacy.
  - It defines ring K₀ as Tau Ceti's SplitK0 of the finite projectives.
  - It proves the stable-isomorphism criterion, and that direct-sum relations suffice.
  - It builds the K₀ maps of scalar extension along any ring homomorphism, of restriction along a finite projective extension, and of a Morita equivalence.
- **Z.2.**
  - It gives the rank as a locally constant function on Spec A, with finite image and compatibility with localisation and base change.
  - It computes K₀ of division rings, local rings and semilocal rings, the last with its connected-component decomposition stated exactly.
  - It proves the product formula and K₀(F × F) ≅ ℤ².
  - It shows by a rank-one ideal of ℤ[√−5] that a projective of constant rank need not be free.
- **U.1.**
  - It builds GL(A) as the direct limit of the GL_n(A) along g ↦ diag(g, 1), and elementary matrices and E_n(A) over an arbitrary ring.
  - It proves the Steinberg commutator identities, perfectness of E_n(A) for n ≥ 3, normality of E(A) and Whitehead's lemma [GL(A), GL(A)] = E(A), with every rank shift explicit.
  - E₂(𝔽₂) and E₂(𝔽₃), which are not perfect, show why the stable theorem is not stated for SL₂.
- **U.2.**
  - It defines K₁(A) = GL(A)/E(A), which Whitehead's lemma identifies with the abelianisation, with its functoriality and block-sum calculus.
  - It defines the class of an automorphism of a finitely generated projective, independent of the complement, additive along projective filtrations and compatible with sums and scalar extension.
- **U.3.**
  - For commutative A it gives the stable determinant, SK₁(A) and the natural splitting K₁(A) ≅ Aˣ × SK₁(A).
  - SK₁ vanishes for fields and, through Bass's stable range, for commutative semilocal rings.
  - For division rings it builds the Dieudonné determinant, with K₁(D) ≅ D^×ab.
  - SK₁ of the real circle ring shows that K₁(A) = Aˣ is not a general rule.
- **U.4.**
  - It proves SK₁(O_{F,S}) = 0 along the Bass–Milnor–Serre route: stable range two for Dedekind rings, Mennicke symbols and their universal group, and the arithmetic prime-choice and power-reduction theorems.
  - It identifies K₁(O_{F,S}) ≅ O_{F,S}ˣ through the determinant, and O_{F,S}ˣ ≅ μ(F) ⊕ ℤ^{r₁+r₂+|S|−1} through fundamental S-units.
- **U.5.**
  - It builds the congruence subgroup GL(I), the relative elementary group E(A, I) and K₁(A, I) = GL(I)/E(A, I), defined directly rather than as a kernel.
  - It proves the degree-one relative sequence, with its extra term (E(A) ∩ GL(I))/E(A, I) made explicit, and the degree-zero sequence of an ideal.
  - It gives transfer by restriction of scalars, agreeing with the field norm, and the projection formula.
  - It gives the DVR boundary K₁(L) → K₀(k) with ∂(π) = [k].
- **U.6.**
  - It identifies π₁BGL(A)⁺ with GL(A)/E(A), matching loop classes, the determinant and the transfer.
  - It computes K₁ of ℤ, of 𝔽_q, of ℤ[1/p] and of a finite product of fields.
  - It runs the three required tests: triangular matrices, diag(g, g⁻¹) and the valuation of a uniformiser.

## Boundaries

The part imports what other roadmaps own and plans nothing twice. The requests section at the end lists each import with the nodes that need it.

**Suppliers.**
- **GeneralAlgebraicKTheory.** K.2:plus: the plus-construction model of K(A), used by U.6 only.
- **StableHomotopyKTheory.** H.1 to H.3: classifying spaces, fundamental groups, homotopy fibres and the plus construction with its universal property, used by U.6 only.
- **The Tau Ceti roadmaps.**
  - For U.4's class-field-theory inputs: ClassFieldTheory (layers 5, 12 and 13), Chebotarev (layers 4 and 10) and GlobalNumberFields (layers 6 and 7).
  - GrothendieckEulerForms layer 4, for its finite-dimensional Morita statement.
- **The libraries.**
  - Mathlib supplies matrices and GL_n, DirectLimit, transvections, the determinant, Module.rankAtStalk and its API, freeness over local rings, S-integers and the unit theorem.
  - Tau Ceti supplies finiteProjectiveModules, SplitK0 and ExactK0 with the split/exact comparison, the transvection and commutator lemmas, diag2nUnit_decompose, and the generation of SL_n over fields and over ℤ.

**Consumers.** These layers are upstream of their consumers, and the nodes supply what each has asked for:
- ArithmeticKTheory N.1, N.2 and N.5 (the determinant, SK₁(O_{F,S}) = 0, transfer and the boundary);
- K2SymbolsBrauer T.1, T.5 and T.6 (E(A), its centre, SK₁(O_{F,S}) = 0 and the relative groups);
- K3BlochGroups V.1 and V.2 (E(A) perfect and normal, E(F) = SL(F));
- EllipticKTheory E.3 and E.4 (the determinant splitting);
- ClassicalArithmeticCompletion CA.7 (ring K₀ with extension and restriction);
- KTheoryFiniteLocalFields L.1 (K₀ and K₁ of finite fields);
- the companion part Z.3.

GeneralAlgebraicKTheory K.2:low-degree-comparisons, KTheoryFiniteLocalFields L.1 and ArithmeticKTheory N.8 lie downstream of U.6. Their degree-one computations are therefore planned here.

## Conventions

- **Modules.** K₀ is formed from left modules, as Mathlib's and Tau Ceti's `Module` are. Z.1's idempotent matrix e presents the row-vector module Rⁿe, and e acts on the right, so that the definition is correct for noncommutative rings.
- **K₁ classes.** The class of an automorphism is formed from right modules and column vectors, the K-book's and Bass's convention; in Mathlib these are modules over Aᵐᵒᵖ, for which End(Aⁿ) ≅ M_n(A) preserves the order of composition.
  - For commutative rings the two conventions agree, and the class of v ↦ gv is [g], Mathlib's column convention.
  - The row-vector convention would transpose matrices. Transposition inverts Mennicke symbols, so it changes SK₁ classes.
- **Stable range.** HasStableRange A n is Bass's "n defines a stable range for GL(A)". It is the K-book's sr(A) ≤ n, and BMS's condition (7.2)_{n+1} for the unit ideal.
- **S-integers.** S is a finite set of finite places and O_{F,S} is Mathlib's `Set.integer`. The unit rank is r₁ + r₂ + |S| − 1, as in ArithmeticKTheory N.1 and K2SymbolsBrauer T.5.
- **The degree-one boundary.** For a DVR O with fraction field L and residue field k, ∂: K₁(L) → K₀(k) is the cokernel length, ∂ = v ∘ det, and ∂(π) = [k], matching K2SymbolsBrauer T.3.
- **K-book locators.** PDF page = book page + 8, in the author-hosted draft of 29 August 2013.

## Sources

Every statement below is taken from these sources, at the versions recorded; locators name the statement and, where the packets give it, the page. Excerpts are quoted literally, from the LaTeX source or the PDF text.

- **The K-book: An Introduction to Algebraic K-theory**, Charles A. Weibel. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013). <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf> (source id `Kbook.2013`).
- **Algebraic Number Theory**, J. S. Milne. Course notes, version 3.08, 19 July 2020 (166 pages). <https://www.jmilne.org/math/CourseNotes/ANT.pdf> (source id `Milne.ANT.2020`).
- **Ideal factorization**, Keith Conrad. Expository note, author-hosted PDF (26 pages), as downloaded 2026-09-25. <https://kconrad.math.uconn.edu/blurbs/gradnumthy/idealfactor.pdf> (source id `Conrad.IdealFactor`).
- **K-theory and stable algebra**, Hyman Bass. Publications Mathématiques de l'IHÉS 22 (1964), 5–60; numdam scan (article pages = PDF pages + 3) <http://www.numdam.org/item/10.1007/BF02684689.pdf> (source id `Bass.1964`).
- **Les déterminants sur un corps non commutatif**, Jean Dieudonné. Bulletin de la Société Mathématique de France 71 (1943), 27–45; numdam scan (article pages = PDF pages + 25) <https://www.numdam.org/item/10.24033/bsmf.1345.pdf> (source id `Dieudonne.1943`).
- **Solution of the congruence subgroup problem for SL_n (n ≥ 3) and Sp_2n (n ≥ 2)**, Hyman Bass, John Milnor, Jean-Pierre Serre. Publications Mathématiques de l'IHÉS 33 (1967), 59–137; numdam scan (article pages = PDF pages + 57) <http://www.numdam.org/item/10.1007/BF02684586.pdf> (source id `BMS.1967`).

The files read, with their SHA-256:

- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, SHA-256 `a04f53c9393b…`
- published: Weibel’s errata to The K-book (GSM 145, AMS 2013), Wayback Machine copy of https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, SHA-256 `ef7ed6d08a5f…`
- author copy: https://www.jmilne.org/math/CourseNotes/ANT.pdf, SHA-256 `24b83c789a89…`
- author copy: https://kconrad.math.uconn.edu/blurbs/gradnumthy/idealfactor.pdf, SHA-256 `1f6fa016abe8…`
- author copy: https://web.archive.org/web/2024/https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, SHA-256 `ef7ed6d08a5f…`
- published: http://www.numdam.org/item/10.1007/BF02684689.pdf, SHA-256 `98bcfa4b38b7…`
- published: https://www.numdam.org/item/10.24033/bsmf.1345.pdf, SHA-256 `4173ddea7ff6…`
- published: http://www.numdam.org/item/10.1007/BF02684586.pdf, SHA-256 `b455790cdaeb…`
- published: Weibel's errata to The K-book (GSM 145, AMS 2013), Wayback Machine copy of https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf (the live file returns 404); the published edition itself was not read, so K-book findings are scoped to the author copy, SHA-256 `ef7ed6d08a5f…`

## What the pinned libraries have

Tau Ceti has ring K₀ through SplitK0 of the finite projectives, and both libraries have matrices, transvections and the generation of SL_n over fields and ℤ. Neither has the stable group GL(A), the elementary group E(A), K₁ of a ring, relative K₁, Mennicke symbols or the plus construction. The nodes build on these pinned declarations, each read at its module:

- `mathlib:Algebra.GrothendieckGroup.lift` (Mathlib/GroupTheory/MonoidLocalization/GrothendieckGroup.lean): Universal property of Mathlib’s group completion: monoid maps to a group correspond to group maps out of the completion (additive form by to_additive).
- `mathlib:CategoryTheory.Adjunction.comp` (Mathlib/CategoryTheory/Adjunction/Basic.lean): Composition of adjunctions F ⋙ H ⊣ I ⋙ G.
- `mathlib:CategoryTheory.Adjunction.leftAdjointUniq` (Mathlib/CategoryTheory/Adjunction/Unique.lean): Two left adjoints of the same functor are naturally isomorphic.
- `mathlib:CategoryTheory.Adjunction.leftAdjoint_preservesColimits` (Mathlib/CategoryTheory/Adjunction/Limits.lean): A left adjoint preserves all colimits.
- `mathlib:CategoryTheory.Adjunction.mkOfHomEquiv` (Mathlib/CategoryTheory/Adjunction/Basic.lean): An adjunction from a natural bijection of hom-sets.
- `mathlib:CategoryTheory.Equivalence.map_projective_iff` (Mathlib/CategoryTheory/Preadditive/Projective/Basic.lean): For an equivalence F, F.functor.obj P is projective iff P is.
- `mathlib:CategoryTheory.Equivalence.toOrderIso` (Mathlib/CategoryTheory/Category/Preorder.lean): A categorical equivalence between partial orders is an order isomorphism.
- `mathlib:CategoryTheory.Functor.additive_of_preserves_binary_products` (Mathlib/CategoryTheory/Preadditive/AdditiveFunctor.lean): A functor between preadditive categories preserving binary products and zero morphisms is additive.
- `mathlib:CategoryTheory.Idempotents.Karoubi` (Mathlib/CategoryTheory/Idempotents/Karoubi.lean): The Karoubi envelope (idempotent completion) of a category.
- `mathlib:CategoryTheory.Idempotents.functorExtension₂` (Mathlib/CategoryTheory/Idempotents/FunctorExtension.lean): The canonical extension (C ⥤ D) ⥤ (Karoubi C ⥤ Karoubi D).
- `mathlib:CategoryTheory.Idempotents.isIdempotentComplete_iff_idempotents_have_kernels` (Mathlib/CategoryTheory/Idempotents/Basic.lean): A preadditive category is idempotent complete iff idempotent endomorphisms have kernels.
- `mathlib:CategoryTheory.Idempotents.toKaroubiEquivalence` (Mathlib/CategoryTheory/Idempotents/Karoubi.lean): C ≌ Karoubi C for an idempotent complete C.
- `mathlib:CategoryTheory.IsIdempotentComplete` (Mathlib/CategoryTheory/Idempotents/Basic.lean): The class of idempotent complete categories: every idempotent splits.
- `mathlib:CategoryTheory.MonoOver.congr` (Mathlib/CategoryTheory/Subobject/MonoOver.lean): An equivalence e : C ≌ D induces MonoOver X ≌ MonoOver (e.functor.obj X).
- `mathlib:CategoryTheory.ObjectProperty.fullSubcategoryCongr` (Mathlib/CategoryTheory/Equivalence.lean): Equal object properties give equivalent full subcategories (identity on objects).
- `mathlib:CategoryTheory.ObjectProperty.lift` (Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean): Lift of a functor through a full subcategory whose property it satisfies.
- `mathlib:CategoryTheory.Subobject.lowerEquivalence` (Mathlib/CategoryTheory/Subobject/Basic.lean): An equivalence of MonoOver categories induces an equivalence of subobject posets.
- `mathlib:CompleteOrthogonalIdempotents` (Mathlib/RingTheory/Idempotents.lean): Complete families of orthogonal idempotents (pairwise products 0, sum 1).
- `mathlib:CompleteOrthogonalIdempotents.bijective_pi` (Mathlib/RingTheory/Idempotents.lean): A complete orthogonal family e induces R ≃ ∏ R ⧸ ⟨1 − e_i⟩ (bijectivity of the product of quotient maps).
- `mathlib:ConnectedComponents` (Mathlib/Topology/Connected/Clopen.lean): The quotient of a topological space by its connected components.
- `mathlib:Equiv.Perm.permMatrix` (Mathlib/LinearAlgebra/Matrix/Permutation.lean): The permutation matrix of a permutation.
- `mathlib:FGModuleCat` (Mathlib/Algebra/Category/FGModuleCat/Basic.lean): The full subcategory of finitely generated modules, (ModuleCat.isFG R).FullSubcategory.
- `mathlib:Ideal.exists_le_maximal` (Mathlib/RingTheory/Ideal/Maximal.lean): Krull: a proper ideal lies in a maximal ideal.
- `mathlib:Ideal.exists_maximal` (Mathlib/RingTheory/Ideal/Maximal.lean): Krull: a nontrivial ring has a maximal ideal.
- `mathlib:Ideal.finrank_fiber_eq_finrank` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): Over a domain, the fibre dimension at every prime equals finrank R M.
- `mathlib:Ideal.span` (Mathlib/RingTheory/Ideal/Span.lean): The ideal generated by a subset.
- `mathlib:InvariantBasisNumber` (Mathlib/LinearAlgebra/InvariantBasisNumber.lean): The (left) invariant basis number property: (Fin n → R) ≃ₗ (Fin m → R) implies n = m.
- `mathlib:IsCompactElement` (Mathlib/Order/CompactlyGenerated/Basic.lean): Compact elements of a partial order (directed-supremum formulation).
- `mathlib:IsFractionRing` (Mathlib/RingTheory/Localization/FractionRing.lean): IsFractionRing R K: K is the localisation at the non-zero-divisors.
- `mathlib:IsLocalRing.maximalIdeal` (Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean): The maximal ideal (the nonunits) of a commutative local ring.
- `mathlib:IsLocallyConstant.apply_eq_of_preconnectedSpace` (Mathlib/Topology/LocallyConstant/Basic.lean): A locally constant function on a preconnected space takes the same value at any two points.
- `mathlib:IsLocallyConstant.eq_const` (Mathlib/Topology/LocallyConstant/Basic.lean): A locally constant function on a preconnected space is constant.
- `mathlib:IsLocallyConstant.range_finite` (Mathlib/Topology/LocallyConstant/Basic.lean): A locally constant function on a compact space has finite range.
- `mathlib:IsProjective.iff_projective` (Mathlib/Algebra/Category/ModuleCat/Projective.lean): Module.Projective R P iff ModuleCat.of R P is a projective object (Small.{v} R).
- `mathlib:LinearEquiv.sumArrowLequivProdArrow` (Mathlib/LinearAlgebra/Pi.lean): The linear equivalence (α ⊕ β → M) ≃ₗ (α → M) × (β → M).
- `mathlib:LinearMap.IsIdempotentElem.isCompl` (Mathlib/LinearAlgebra/Projection.lean): For an idempotent linear endomorphism f, IsCompl (range f) (ker f).
- `mathlib:LinearMap.IsIdempotentElem.ker_eq_range_one_sub` (Mathlib/LinearAlgebra/Projection.lean): For an idempotent p, ker p = range (1 − p).
- `mathlib:LinearMap.IsIdempotentElem.mem_range_iff` (Mathlib/LinearAlgebra/Projection.lean): For an idempotent p, x ∈ range p iff p x = x.
- `mathlib:LinearMap.toMatrixRight'` (Mathlib/LinearAlgebra/Matrix/ToLin.lean): Linear maps (m → R) → (n → R) ≃ Matrix m n R through right multiplication on row vectors, for arbitrary (noncommutative) R.
- `mathlib:LinearMap.toMatrixRight'_comp` (Mathlib/LinearAlgebra/Matrix/ToLin.lean): toMatrixRight' (g ∘ₗ f) = toMatrixRight' f * toMatrixRight' g.
- `mathlib:Localization.AtPrime` (Mathlib/RingTheory/Localization/AtPrime/Basic.lean): The localisation of a commutative ring at a prime.
- `mathlib:LocalizedModule.equivTensorProduct` (Mathlib/RingTheory/Localization/BaseChange.lean): LocalizedModule S M ≃ₗ Localization S ⊗[R] M.
- `mathlib:LocallyConstant` (Mathlib/Topology/LocallyConstant/Basic.lean): Bundled locally constant functions X → Y (an additive group for Y = ℤ).
- `mathlib:LocallyConstant.comap` (Mathlib/Topology/LocallyConstant/Basic.lean): Pull-back of a locally constant function along a continuous map.
- `mathlib:LocallyConstant.const` (Mathlib/Topology/LocallyConstant/Basic.lean): The constant locally constant function.
- `mathlib:Matrix.GeneralLinearGroup` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): GL n R := (Matrix n n R)ˣ for a semiring R (no commutativity needed).
- `mathlib:Matrix.GeneralLinearGroup.map` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): A ring homomorphism induces GL n R →* GL n S entrywise.
- `mathlib:Matrix.fromBlocks` (Mathlib/Data/Matrix/Block.lean): The 2 × 2 block matrix built from four blocks, indexed by sum types.
- `mathlib:Matrix.fromBlocks_multiply` (Mathlib/Data/Matrix/Block.lean): Block multiplication of fromBlocks matrices.
- `mathlib:Matrix.map` (Mathlib/LinearAlgebra/Matrix/Defs.lean): Entrywise application of a function to a matrix.
- `mathlib:Matrix.map_mul` (Mathlib/Data/Matrix/Mul.lean): Entrywise application of a ring homomorphism commutes with matrix products.
- `mathlib:Matrix.reindex` (Mathlib/LinearAlgebra/Matrix/Defs.lean): Reindexing a matrix along equivalences of the index types.
- `mathlib:Matrix.toLinearEquivRight'OfInv` (Mathlib/LinearAlgebra/Matrix/ToLin.lean): Mutually inverse matrices give a linear equivalence of row-vector spaces through right multiplication.
- `mathlib:Matrix.toLinearMapRight'_mul` (Mathlib/LinearAlgebra/Matrix/ToLin.lean): Right multiplication by M * N is right multiplication by M followed by N.
- `mathlib:Matrix.vecMulLinear` (Mathlib/LinearAlgebra/Matrix/ToLin.lean): v ↦ v ᵥ* M as a left-linear map (m → R) →ₗ[R] (n → R), for any semiring R.
- `mathlib:Matrix.vecMul_fromBlocks` (Mathlib/Data/Matrix/Block.lean): Row vector times a block matrix, blockwise.
- `mathlib:Matrix.vecMul_vecMul` (Mathlib/Data/Matrix/Mul.lean): (v ᵥ* M) ᵥ* N = v ᵥ* (M * N).
- `mathlib:MaximalSpectrum` (Mathlib/RingTheory/Spectrum/Maximal/Defs.lean): The type of maximal ideals of a commutative ring.
- `mathlib:Module.Basis.ofVectorSpace` (Mathlib/LinearAlgebra/Basis/VectorSpace.lean): Every vector space over a division ring has a basis.
- `mathlib:Module.Finite.exists_comp_eq_id_of_projective` (Mathlib/RingTheory/Finiteness/Projective.lean): A finite projective module is a retract of Fin n → R: f surjective, g injective, f ∘ₗ g = id.
- `mathlib:Module.Finite.of_surjective` (Mathlib/RingTheory/Finiteness/Basic.lean): A quotient (surjective image) of a finite module is finite.
- `mathlib:Module.Finite.trans` (Mathlib/RingTheory/Finiteness/Basic.lean): Finiteness is transitive along a scalar tower R → A → M.
- `mathlib:Module.FinitePresentation.exists_free_localizedModule_powers` (Mathlib/RingTheory/Localization/Free.lean): A finitely presented module free at a localisation is free after inverting a single element.
- `mathlib:Module.Flat.of_projective` (Mathlib/RingTheory/Flat/Basic.lean): Projective modules are flat.
- `mathlib:Module.Invertible.finrank_eq_one` (Mathlib/RingTheory/PicardGroup.lean): A free invertible module has finrank one.
- `mathlib:Module.IsStablyFree` (Mathlib/Algebra/Module/StablyFree/Basic.lean): Stably free modules: M × N free for some finite free N.
- `mathlib:Module.IsStablyFree.exist_free_prod` (Mathlib/Algebra/Module/StablyFree/Basic.lean): Extraction of the finite free N with M × N free.
- `mathlib:Module.IsStablyFree.of_free_prod` (Mathlib/Algebra/Module/StablyFree/Basic.lean): Constructor: N finite free and M × N free give IsStablyFree R M.
- `mathlib:Module.Projective.directSum` (Mathlib/Algebra/Module/Projective.lean): A direct sum of projective modules is projective.
- `mathlib:Module.Projective.of_split` (Mathlib/Algebra/Module/Projective.lean): A retract of a projective module is projective.
- `mathlib:Module.finBasis` (Mathlib/LinearAlgebra/Dimension/Free.lean): A finite free module has a basis indexed by Fin (finrank R M).
- `mathlib:Module.finBasisOfFinrankEq` (Mathlib/LinearAlgebra/Dimension/Free.lean): A basis indexed by Fin n when finrank R M = n (finite free M).
- `mathlib:Module.finitePresentation_of_projective` (Mathlib/Algebra/Module/FinitePresentation.lean): Finite projective modules are finitely presented.
- `mathlib:Module.finite_def` (Mathlib/RingTheory/Finiteness/Defs.lean): Module.Finite R M iff ⊤ : Submodule R M is finitely generated.
- `mathlib:Module.finrank_pi` (Mathlib/LinearAlgebra/Dimension/Constructions.lean): finrank of Fin n → R-type finite products (free case).
- `mathlib:Module.free_of_finite_type_torsion_free'` (Mathlib/LinearAlgebra/FreeModule/PID.lean): Over a PID, a finitely generated torsion-free module is free.
- `mathlib:Module.free_of_flat_of_finrank_eq` (Mathlib/RingTheory/LocalRing/Module.lean): Over a commutative ring with finitely many maximal ideals, a finite flat module of constant fibre rank n at the maximal ideals is free (Stacks 02M9).
- `mathlib:Module.free_of_flat_of_isLocalRing` (Mathlib/RingTheory/LocalRing/Module.lean): Over a commutative local ring, a finite flat module is free (Stacks 00NZ).
- `mathlib:Module.isLocallyConstant_rankAtStalk` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): For finitely presented flat M, rankAtStalk M is locally constant.
- `mathlib:Module.nonempty_basis_of_flat_of_finrank_eq` (Mathlib/RingTheory/LocalRing/Module.lean): The basis version of free_of_flat_of_finrank_eq.
- `mathlib:Module.projective_of_isSemisimpleRing` (Mathlib/RingTheory/SimpleModule/InjectiveProjective.lean): Every module over a semisimple ring is projective.
- `mathlib:Module.rankAtStalk` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): rankAtStalk M p := finrank_{R_p} M_p, a function Spec R → ℕ.
- `mathlib:Module.rankAtStalk_baseChange` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): rankAtStalk (S ⊗[R] M) p = rankAtStalk M (comap p) (flat finite M).
- `mathlib:Module.rankAtStalk_eq` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): rankAtStalk M p equals the fibre dimension finrank κ(p) (p.Fiber M) for finite flat M.
- `mathlib:Module.rankAtStalk_eq_finrank_of_free` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): For free M, rankAtStalk M is the constant finrank R M.
- `mathlib:Module.rankAtStalk_eq_of_equiv` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): Linearly equivalent modules have equal stalk ranks.
- `mathlib:Module.rankAtStalk_eq_zero_iff_subsingleton` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): For finite flat M, rankAtStalk M = 0 iff M is subsingleton.
- `mathlib:Module.rankAtStalk_pi` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): rankAtStalk of a finite product of finite flat modules is the sum.
- `mathlib:Module.rankAtStalk_prod` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): rankAtStalk (M × N) = rankAtStalk M + rankAtStalk N for finite flat M, N.
- `mathlib:Module.rankAtStalk_tensorProduct` (Mathlib/RingTheory/Spectrum/Prime/FreeLocus.lean): rankAtStalk (M ⊗ N) = rankAtStalk M · rankAtStalk N for finite flat M, N.
- `mathlib:ModuleCat.biprodIsoProd` (Mathlib/Algebra/Category/ModuleCat/Biproducts.lean): The binary biproduct in ModuleCat is the product module.
- `mathlib:ModuleCat.extendRestrictScalarsAdj` (Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean): For commutative rings, extension of scalars is left adjoint to restriction.
- `mathlib:ModuleCat.extendScalars` (Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean): Extension of scalars ModuleCat R ⥤ ModuleCat S for commutative R and S only.
- `mathlib:ModuleCat.matrixEquivalence` (Mathlib/RingTheory/Morita/Matrix.lean): ModuleCat R ≌ ModuleCat (Matrix ι ι R), M ↦ (ι → M), inverse N ↦ E_ii N.
- `mathlib:ModuleCat.restrictScalars` (Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean): Restriction of scalars ModuleCat S ⥤ ModuleCat R along any ring homomorphism.
- `mathlib:ModuleCat.restrictScalarsComp'` (Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean): Restriction along a composite is the composite of restrictions.
- `mathlib:ModuleCat.restrictScalarsId'` (Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean): Restriction along the identity is the identity functor.
- `mathlib:ModuleCat.subobjectModule` (Mathlib/Algebra/Category/ModuleCat/Subobject.lean): Subobject M ≃o Submodule R M in ModuleCat.
- `mathlib:MoritaEquivalence` (Mathlib/RingTheory/Morita/Basic.lean): Morita equivalence of R-algebras: an R-linear equivalence of module categories.
- `mathlib:MoritaEquivalence.ofAlgEquiv` (Mathlib/RingTheory/Morita/Basic.lean): An algebra isomorphism gives a Morita equivalence (restriction of scalars).
- `mathlib:MoritaEquivalence.refl` (Mathlib/RingTheory/Morita/Basic.lean): The identity Morita equivalence.
- `mathlib:MoritaEquivalence.symm` (Mathlib/RingTheory/Morita/Basic.lean): The inverse Morita equivalence.
- `mathlib:MoritaEquivalence.trans` (Mathlib/RingTheory/Morita/Basic.lean): Composition of Morita equivalences.
- `mathlib:Pi.evalRingHom` (Mathlib/Algebra/Ring/Pi.lean): Evaluation at a coordinate as a ring homomorphism out of a product.
- `mathlib:PrimeSpectrum.basicOpen_injOn_isIdempotentElem` (Mathlib/RingTheory/Spectrum/Prime/Topology.lean): basicOpen is injective on idempotents.
- `mathlib:PrimeSpectrum.basicOpen_isIdempotentElemEquivClopens_symm` (Mathlib/RingTheory/Spectrum/Prime/Topology.lean): The idempotent attached to a clopen U has basic open U.
- `mathlib:PrimeSpectrum.comap` (Mathlib/RingTheory/Spectrum/Prime/RingHom.lean): The map Spec S → Spec R induced by a ring homomorphism (continuous version used for LocallyConstant.comap).
- `mathlib:PrimeSpectrum.compactSpace` (Mathlib/RingTheory/Spectrum/Prime/Topology.lean): The prime spectrum is compact.
- `mathlib:PrimeSpectrum.isIdempotentElemEquivClopens` (Mathlib/RingTheory/Spectrum/Prime/Topology.lean): Idempotents of a commutative ring correspond to clopen subsets of Spec (Stacks 00EE).
- `mathlib:PrimeSpectrum.isIdempotentElemEquivClopens_symm_inf` (Mathlib/RingTheory/Spectrum/Prime/Topology.lean): The idempotent of U ∩ V is the product of the idempotents.
- `mathlib:PrimeSpectrum.isIdempotentElemEquivClopens_symm_sup` (Mathlib/RingTheory/Spectrum/Prime/Topology.lean): The idempotent of U ∪ V is e + f − ef.
- `mathlib:PrimeSpectrum.zeroLocus_eq_basicOpen_of_isIdempotentElem` (Mathlib/RingTheory/Spectrum/Prime/Topology.lean): For an idempotent e, V(e) = D(1 − e).
- `mathlib:RingEquiv.piFinTwo` (Mathlib/Algebra/Ring/Fin.lean): The ring isomorphism between a product over Fin 2 and a binary product.
- `mathlib:RingHom.fst` (Mathlib/Algebra/Ring/Prod.lean): The first projection of a product ring.
- `mathlib:RingHom.mapMatrix` (Mathlib/Data/Matrix/Basic.lean): Entrywise application of a ring homomorphism as a ring homomorphism of matrix rings.
- `mathlib:RingHom.snd` (Mathlib/Algebra/Ring/Prod.lean): The second projection of a product ring.
- `mathlib:Submodule.fg_iff_compact` (Mathlib/RingTheory/Finiteness/Basic.lean): A submodule is finitely generated iff it is a compact element of the submodule lattice.
- `mathlib:Submodule.isIdempotentElemEquiv` (Mathlib/LinearAlgebra/Projection.lean): Idempotent endomorphisms with range p correspond to linear retractions onto p.
- `mathlib:Submodule.liftQ` (Mathlib/LinearAlgebra/Quotient/Basic.lean): Descent of a linear map to a quotient module.
- `mathlib:Submodule.mkQ` (Mathlib/LinearAlgebra/Quotient/Defs.lean): The quotient map of a submodule.
- `mathlib:Submodule.span` (Mathlib/LinearAlgebra/Span/Defs.lean): The submodule spanned by a set.
- `mathlib:Submonoid.LocalizationMap.eq_iff_exists` (Mathlib/GroupTheory/MonoidLocalization/Basic.lean): In a localisation, f x = f y iff c * x = c * y for some c (additive form by to_additive).
- `mathlib:TensorProduct` (Mathlib/LinearAlgebra/TensorProduct/Defs.lean): Tensor product over a commutative semiring (used over ℤ).
- `mathlib:TensorProduct.AlgebraTensorModule.lift` (Mathlib/LinearAlgebra/TensorProduct/Tower.lean): Lift of an A-linear-in-the-first-variable bilinear map to M ⊗[R] N →ₗ[A] P.
- `mathlib:TensorProduct.leftModule` (Mathlib/LinearAlgebra/TensorProduct/Defs.lean): The left module structure on M ⊗[R] N through the first factor.
- `mathlib:TwoSidedIdeal` (Mathlib/RingTheory/TwoSidedIdeal/Basic.lean): Two-sided ideals of a (noncommutative) ring.
- `mathlib:TwoSidedIdeal.jacobson` (Mathlib/RingTheory/Jacobson/Ideal.lean): The Jacobson radical of a two-sided ideal.
- `mathlib:TwoSidedIdeal.jacobson_matrix` (Mathlib/LinearAlgebra/Matrix/Ideal.lean): J(M_n(I)) = M_n(J(I)).
- `mathlib:TwoSidedIdeal.matrix_jacobson_bot` (Mathlib/LinearAlgebra/Matrix/Ideal.lean): M_n of the Jacobson radical of R is the Jacobson radical of M_n(R).
- `mathlib:TwoSidedIdeal.mem_jacobson_iff` (Mathlib/RingTheory/Jacobson/Ideal.lean): x ∈ jacobson I iff for all y there is z with z * y * x + z − 1 ∈ I.
- `mathlib:Zsqrtd` (Mathlib/NumberTheory/Zsqrtd/Basic.lean): The ring ℤ√d = ℤ[√d].
- `mathlib:Zsqrtd.isUnit_iff_norm_isUnit` (Mathlib/NumberTheory/Zsqrtd/Basic.lean): z is a unit iff its norm is a unit.
- `mathlib:Zsqrtd.norm` (Mathlib/NumberTheory/Zsqrtd/Basic.lean): The norm a² − d b² on ℤ√d.
- `mathlib:Zsqrtd.norm_eq_zero_iff` (Mathlib/NumberTheory/Zsqrtd/Basic.lean): For d < 0, the norm vanishes only at 0.
- `mathlib:Zsqrtd.norm_mul` (Mathlib/NumberTheory/Zsqrtd/Basic.lean): The norm is multiplicative.
- `mathlib:finSumFinEquiv` (Mathlib/Logic/Equiv/Fin/Basic.lean): The equivalence Fin m ⊕ Fin n ≃ Fin (m + n).
- `mathlib:moritaEquivalenceMatrix` (Mathlib/RingTheory/Morita/Matrix.lean): The Morita equivalence between R and Matrix ι ι R.
- `tauceti:PrimeSpectrum.connectedSpace_quotient_connectedComponentsIdeal` (TauCeti/RingTheory/Idempotents/Connected/Components.lean): Each component quotient A ⧸ I_C has connected spectrum.
- `tauceti:PrimeSpectrum.ringEquivPiQuotientConnectedComponentsIdeal` (TauCeti/RingTheory/Idempotents/Connected/Components.lean): A ≃+* ∏_C A ⧸ I_C over the connected components, when there are finitely many.
- `tauceti:TauCeti.ExactK0` (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): Exact K₀ of an exact structure.
- `tauceti:TauCeti.ExactK0.fromSplitEquiv` (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): SplitK0 C ≃+ ExactK0 E when every conflation splits.
- `tauceti:TauCeti.ExactK0.fromSplitEquiv_apply` (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): fromSplitEquiv acts by the comparison fromSplit.
- `tauceti:TauCeti.ExactK0.fromSplitEquiv_symm_of` (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): The inverse sends ExactK0.of X to SplitK0.of X.
- `tauceti:TauCeti.ExactK0.liftEquiv` (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): The universal property of exact K₀: conflation-additive invariants ≃ homomorphisms out of ExactK0.
- `tauceti:TauCeti.ExactK0.of_conflation` (TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean): The defining relation [X₂] = [X₁] + [X₃] for a conflation.
- `tauceti:TauCeti.ExactStructure.split_conflation` (TauCeti/CategoryTheory/Exact/Split.lean): The conflations of the split exact structure are the short complexes admitting a splitting.
- `tauceti:TauCeti.ObjectCode` (TauCeti/CategoryTheory/GrothendieckGroup/Presentation.lean): A small type of codes for isomorphism classes of objects (an additive monoid under biproduct).
- `tauceti:TauCeti.SplitK0` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Split K₀ of an essentially small category with zero morphisms and binary biproducts.
- `tauceti:TauCeti.SplitK0.exists_eq_sub` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Every element of split K₀ is [X] − [Y].
- `tauceti:TauCeti.SplitK0.finrankEquiv` (TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean): SplitK0 (FGModuleCat k) ≃+ ℤ by dimension, for a division ring k.
- `tauceti:TauCeti.SplitK0.finrankEquiv_of` (TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean): finrankEquiv sends a class to its dimension.
- `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Split K₀ is Mathlib’s group completion of the monoid of isomorphism classes.
- `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv_of_objectCode` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): The group-completion equivalence on classes of isomorphism classes.
- `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv_symm_of` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): The inverse equivalence on object classes.
- `tauceti:TauCeti.SplitK0.hom_ext` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Homomorphisms out of split K₀ agreeing on object classes are equal.
- `tauceti:TauCeti.SplitK0.induction_on` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Induction on split K₀ through object classes.
- `tauceti:TauCeti.SplitK0.lift` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): The homomorphism induced by a biproduct-additive invariant.
- `tauceti:TauCeti.SplitK0.liftEquiv` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): The universal property: additive invariants ≃ homomorphisms out of split K₀.
- `tauceti:TauCeti.SplitK0.lift_of` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): lift a (of X) = a.obj X.
- `tauceti:TauCeti.SplitK0.map` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): The map on split K₀ induced by an additive functor.
- `tauceti:TauCeti.SplitK0.mapEquiv` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): The additive equivalence induced by an additive equivalence of categories.
- `tauceti:TauCeti.SplitK0.mapEquiv_of` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): mapEquiv e (of X) = of (e.functor.obj X).
- `tauceti:TauCeti.SplitK0.map_comp` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): map (F ⋙ G) = (map G).comp (map F).
- `tauceti:TauCeti.SplitK0.map_congr` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Objectwise isomorphic additive functors induce the same map.
- `tauceti:TauCeti.SplitK0.map_id` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): map (𝟭 C) = id.
- `tauceti:TauCeti.SplitK0.map_of` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): map F (of X) = of (F.obj X).
- `tauceti:TauCeti.SplitK0.of` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): The class of an object in split K₀.
- `tauceti:TauCeti.SplitK0.of_biprod` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): [X ⊞ Y] = [X] + [Y].
- `tauceti:TauCeti.SplitK0.of_congr` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): Isomorphic objects have equal classes.
- `tauceti:TauCeti.SplitK0.of_eq_zero_of_isZero` (TauCeti/CategoryTheory/GrothendieckGroup/Split.lean): The class of a zero object vanishes.
- `tauceti:TauCeti.connectedSpace_primeSpectrum_iff_idempotent_eq_zero_or_one` (TauCeti/RingTheory/Idempotents/Connected/Spectrum.lean): For nontrivial commutative R: Spec R connected iff the only idempotents are 0 and 1.
- `tauceti:TauCeti.finiteModules_le_finiteProjectiveModules` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): Over a semisimple ring, finitely generated modules are finitely generated projective.
- `tauceti:TauCeti.finiteProjectiveModules` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The object property of finitely generated projective modules in ModuleCat R, with closure under isomorphisms, zero and binary products and essential smallness instances.
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The exact structure on finitely generated projectives induced from ModuleCat R.
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): Its conflations are the short exact sequences of modules with terms in the subcategory.
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): The induced exact structure on finitely generated projectives is the split one.
- `tauceti:TauCeti.finiteProjectiveModules_iff` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): Membership: Module.Finite R M ∧ Module.Projective R M.
- `tauceti:TauCeti.finiteProjectiveModules_le_finiteModules` (TauCeti/Algebra/Category/ModuleCat/CartanMap.lean): Finitely generated projectives are finitely generated.
- `tauceti:TauCeti.objectCode_biprod` (TauCeti/CategoryTheory/GrothendieckGroup/ObjectCodeMonoid.lean): The code of a biproduct is the sum of the codes.
- `tauceti:TauCeti.objectCode_eq_objectCode_iff` (TauCeti/CategoryTheory/GrothendieckGroup/Presentation.lean): Equal codes iff isomorphic objects.
- `tauceti:TauCeti.objectCode_surjective` (TauCeti/CategoryTheory/GrothendieckGroup/Presentation.lean): Every code is the code of an object.
- `mathlib:Abelianization` (Mathlib/GroupTheory/Abelianization/Defs.lean): The abelianisation G ⧸ commutator G of a group.
- `mathlib:Abelianization.equivOfComm` (Mathlib/GroupTheory/Abelianization/Defs.lean): For a commutative group H, H ≃* Abelianization H.
- `mathlib:Abelianization.lift` (Mathlib/GroupTheory/Abelianization/Defs.lean): Universal property: homomorphisms G →* A to a commutative group correspond to homomorphisms Abelianization G →* A.
- `mathlib:Abelianization.map` (Mathlib/GroupTheory/Abelianization/Defs.lean): Functoriality of the abelianisation.
- `mathlib:Abelianization.of` (Mathlib/GroupTheory/Abelianization/Defs.lean): The quotient map G →* Abelianization G.
- `mathlib:Commute` (Mathlib/Algebra/Group/Commute/Defs.lean): Commuting elements of a monoid.
- `mathlib:ContinuousMap` (Mathlib/Topology/ContinuousMap/Defs.lean): Continuous maps between topological spaces (C(S¹, ℝ) for the real circle example).
- `mathlib:DirectLimit` (Mathlib/Order/DirectedInverseSystem.lean): The direct limit of a directed system as a quotient of the sigma type (equal after a common transition).
- `mathlib:DirectLimit.eq_of_le` (Mathlib/Order/DirectedInverseSystem.lean): ⟦⟨i, x⟩⟧ = ⟦⟨j, f i j h x⟩⟧ in the direct limit.
- `mathlib:DirectLimit.exists_eq_mk` (Mathlib/Order/DirectedInverseSystem.lean): Every element of the direct limit is the class of an element of some component.
- `mathlib:DirectLimit.exists_eq_mk₂` (Mathlib/Order/DirectedInverseSystem.lean): Two elements of the direct limit come from a common component.
- `mathlib:DirectLimit.induction` (Mathlib/Order/DirectedInverseSystem.lean): Induction principle on representatives in the components.
- `mathlib:DirectLimit.lift` (Mathlib/Order/DirectedInverseSystem.lean): A compatible family of maps out of the components induces a map out of the direct limit.
- `mathlib:DirectLimit.lift_def` (Mathlib/Order/DirectedInverseSystem.lean): DirectLimit.lift evaluated on a representative.
- `mathlib:DirectLimit.lift_mul` (Mathlib/Algebra/Colimit/DirectLimit.lean): DirectLimit.lift of multiplicative maps is multiplicative.
- `mathlib:DirectLimit.map` (Mathlib/Order/DirectedInverseSystem.lean): A compatible family of maps between two directed systems induces a map of direct limits.
- `mathlib:DirectLimit.mk_apply` (Mathlib/Order/DirectedInverseSystem.lean): The class of f i j h x equals the class of x.
- `mathlib:DirectLimit.mk_injective` (Mathlib/Order/DirectedInverseSystem.lean): If the transition maps are injective, so is each component map into the direct limit.
- `mathlib:DirectLimit.mul_def` (Mathlib/Algebra/Colimit/DirectLimit.lean): Multiplication in the direct limit of monoids is computed in a common component.
- `mathlib:DirectLimit.one_def` (Mathlib/Algebra/Colimit/DirectLimit.lean): The unit of the direct limit is the class of 1 in any component.
- `mathlib:DirectLimit.setoid` (Mathlib/Order/DirectedInverseSystem.lean): The equivalence relation defining the direct limit: equality after a common transition.
- `mathlib:DirectedSystem` (Mathlib/Order/DirectedInverseSystem.lean): The functoriality laws (map_self, map_map) of a directed system of transition maps.
- `mathlib:Ideal.IsMaximal.eq_of_le` (Mathlib/RingTheory/Ideal/Maximal.lean): A maximal ideal contained in a proper ideal equals it (distinct maximal ideals are incomparable).
- `mathlib:Ideal.IsMaximal.isPrime` (Mathlib/RingTheory/Ideal/Maximal.lean): Maximal ideals are prime.
- `mathlib:Ideal.Quotient.mk_surjective` (Mathlib/RingTheory/Ideal/Quotient/Defs.lean): The quotient map A → A ⧸ I is surjective.
- `mathlib:Ideal.mul_le_right` (Mathlib/RingTheory/Ideal/Operations.lean): I * J ≤ J.
- `mathlib:Ideal.prod_le_inf` (Mathlib/RingTheory/Ideal/Operations.lean): A finite product of ideals lies in their infimum, hence in each factor.
- `mathlib:Ideal.quotientInfRingEquivPiQuotient` (Mathlib/RingTheory/Ideal/Quotient/Operations.lean): Chinese remainder theorem for pairwise coprime ideals.
- `mathlib:Ideal.span_singleton_eq_top` (Mathlib/RingTheory/Ideal/Span.lean): span {x} = ⊤ ↔ IsUnit x.
- `mathlib:Ideal.subset_union_prime` (Mathlib/RingTheory/Ideal/Operations.lean): Prime avoidance for finitely many (prime) ideals in a commutative ring.
- `mathlib:IsLocalRing` (Mathlib/RingTheory/LocalRing/Defs.lean): Local (semi)rings.
- `mathlib:IsLocalRing.eq_maximalIdeal` (Mathlib/RingTheory/LocalRing/MaximalIdeal/Basic.lean): In a local ring every maximal ideal is the maximal ideal.
- `mathlib:LinearEquiv` (Mathlib/Algebra/Module/Equiv/Defs.lean): Linear equivalences (automorphisms of modules).
- `mathlib:LinearEquiv.IsExceptional` (Mathlib/LinearAlgebra/Transvection/Generation.lean): The exceptional elements excluded from Mathlib's Dieudonné generation theorem.
- `mathlib:LinearEquiv.automorphismGroup` (Mathlib/Algebra/Module/Equiv/Basic.lean): The group structure on M ≃ₗ[R] M (composition).
- `mathlib:LinearEquiv.mem_transvections_pow_mul_dilatransvections_of_not_isExceptional` (Mathlib/LinearAlgebra/Transvection/Generation.lean): Dieudonné's generation theorem over a division ring, non-exceptional case: e is a product of transvections and one dilatransvection.
- `mathlib:LinearEquiv.prodCongr` (Mathlib/LinearAlgebra/Prod.lean): Product of two linear equivalences.
- `mathlib:LinearEquiv.transvections` (Mathlib/LinearAlgebra/Transvection/Basic.lean): The set of transvections x ↦ x + f(x)v (f(v) = 0) of a module.
- `mathlib:LinearMap.baseChange` (Mathlib/LinearAlgebra/TensorProduct/Tower.lean): Base change A ⊗_R M → A ⊗_R N of a linear map (commutative base).
- `mathlib:LinearMap.det` (Mathlib/LinearAlgebra/Determinant.lean): The determinant of an endomorphism, defined to be 1 when the module has no finite basis.
- `mathlib:LinearMap.det_toMatrix` (Mathlib/LinearAlgebra/Determinant.lean): The determinant of the matrix of f in a basis is LinearMap.det f.
- `mathlib:LinearMap.toMatrix` (Mathlib/LinearAlgebra/Matrix/ToLin.lean): The matrix of a linear map in chosen bases (column convention, commutative ring).
- `mathlib:LinearMap.toMatrix_baseChange` (Mathlib/RingTheory/TensorProduct/Free.lean): The matrix of a base-changed map is the entrywise image of the matrix.
- `mathlib:Matrix.BlockTriangular.det` (Mathlib/LinearAlgebra/Matrix/Block.lean): The determinant of a block triangular matrix is the product of the determinants of its diagonal blocks.
- `mathlib:Matrix.GeneralLinearGroup.det` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): The determinant GL n R →* Rˣ for a commutative ring R.
- `mathlib:Matrix.GeneralLinearGroup.det_surjective` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): The determinant GL n R → Rˣ is surjective for nonempty n.
- `mathlib:Matrix.GeneralLinearGroup.map_det` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): det (map f g) = Units.map f (det g).
- `mathlib:Matrix.GeneralLinearGroup.toLin` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): GL n R ≃* LinearMap.GeneralLinearGroup R (n → R) (column convention, commutative R).
- `mathlib:Matrix.GeneralLinearGroup.transvection` (Mathlib/LinearAlgebra/Matrix/ElementaryRowOperations.lean): The transvection 1 + c E_ij as an element of GL m R, for a commutative ring R.
- `mathlib:Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec` (Mathlib/LinearAlgebra/Matrix/Transvection.lean): Over a field every matrix is a product of transvections, a diagonal matrix and transvections.
- `mathlib:Matrix.SL2.commutator_eq_top` (Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean): SL(2, F) is perfect over a field with some a ≠ 0, a² ≠ 1.
- `mathlib:Matrix.SpecialLinearGroup.range_toGL` (Mathlib/Topology/Algebra/Group/Matrix.lean): The image of SL n A in GL n A is the kernel of the determinant (commutative A).
- `mathlib:Matrix.SpecialLinearGroup.toGL` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): The inclusion SL n R →* GL n R.
- `mathlib:Matrix.TransvectionStruct.toMatrix_sumInl` (Mathlib/LinearAlgebra/Matrix/Transvection.lean): A transvection extended by the identity block is the block matrix fromBlocks t 0 0 1.
- `mathlib:Matrix.TransvectionStruct.toSpecialLinearGroup` (Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean): A transvection as an element of SL ι F.
- `mathlib:Matrix.det_fromBlocks_zero₂₁` (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): det (fromBlocks A B 0 D) = det A * det D.
- `mathlib:Matrix.det_of_isUpperTriangular` (Mathlib/LinearAlgebra/Matrix/Block.lean): The determinant of an upper triangular matrix is the product of its diagonal entries.
- `mathlib:Matrix.det_transvection_of_ne` (Mathlib/LinearAlgebra/Matrix/Transvection.lean): A transvection with i ≠ j has determinant 1.
- `mathlib:Matrix.fromBlocks_one` (Mathlib/Data/Matrix/Block.lean): fromBlocks 1 0 0 1 = 1.
- `mathlib:Matrix.fromBlocks_submatrix_sum_swap_sum_swap` (Mathlib/Data/Matrix/Block.lean): Swapping the two summands of the index sets swaps the diagonal blocks.
- `mathlib:Matrix.mem_range_scalar_of_commute_single` (Mathlib/Data/Matrix/Basis.lean): A matrix commuting with all matrix units single i j 1 (i ≠ j) is scalar.
- `mathlib:Matrix.mem_range_scalar_of_commute_transvectionStruct` (Mathlib/LinearAlgebra/Matrix/Transvection.lean): Over a commutative ring, a matrix commuting with all transvections is scalar.
- `mathlib:Matrix.mulVec` (Mathlib/Data/Matrix/Mul.lean): Matrix times column vector.
- `mathlib:Matrix.mulVec_mulVec` (Mathlib/Data/Matrix/Mul.lean): M *ᵥ (N *ᵥ v) = (M * N) *ᵥ v.
- `mathlib:Matrix.reindexAlgEquiv` (Mathlib/LinearAlgebra/Matrix/Reindex.lean): Reindexing square matrices along an equivalence, as an algebra isomorphism.
- `mathlib:Matrix.reindexAlgEquiv_mul` (Mathlib/LinearAlgebra/Matrix/Reindex.lean): Reindexing is multiplicative.
- `mathlib:Matrix.scalar` (Mathlib/Data/Matrix/Basic.lean): Scalar matrices a·1.
- `mathlib:Matrix.single` (Mathlib/Data/Matrix/Basis.lean): The matrix with a single nonzero entry a at (i, j), over any semiring.
- `mathlib:Matrix.single_mul_single_of_ne` (Mathlib/Data/Matrix/Basis.lean): single i j c * single k l d = 0 when j ≠ k.
- `mathlib:Matrix.single_mul_single_same` (Mathlib/Data/Matrix/Basis.lean): single i j c * single j k d = single i k (c * d).
- `mathlib:Matrix.toLinAlgEquiv'` (Mathlib/LinearAlgebra/Matrix/ToLin.lean): Matrices as endomorphisms of n → R acting on column vectors (commutative R).
- `mathlib:Matrix.transvection` (Mathlib/LinearAlgebra/Matrix/Transvection.lean): The matrix 1 + single i j c (commutative ring).
- `mathlib:Module.End` (Mathlib/Algebra/Module/LinearMap/End.lean): Endomorphisms of a module.
- `mathlib:Module.Finite` (Mathlib/RingTheory/Finiteness/Defs.lean): Finitely generated modules.
- `mathlib:Module.Projective` (Mathlib/Algebra/Module/Projective.lean): Projective modules.
- `mathlib:Module.Projective.iff_split` (Mathlib/Algebra/Module/Projective.lean): A module is projective iff it is a retract of a free module.
- `mathlib:Module.Projective.tensorProduct` (Mathlib/Algebra/Module/Projective.lean): Tensor products (in particular base changes) of projective modules are projective.
- `mathlib:Module.projective_lifting_property` (Mathlib/Algebra/Module/Projective.lean): Maps out of a projective module lift along surjections (so surjections onto a projective split).
- `mathlib:MonoidHom.ker` (Mathlib/Algebra/Group/Subgroup/Ker.lean): The kernel of a group homomorphism.
- `mathlib:MonoidHom.map_closure` (Mathlib/Algebra/Group/Subgroup/Map.lean): The image of a closure is the closure of the image.
- `mathlib:MonoidHom.prod` (Mathlib/Algebra/Group/Prod.lean): The homomorphism into a product given by two homomorphisms.
- `mathlib:MulEquiv.prodUnits` (Mathlib/Algebra/Group/Prod.lean): (M × N)ˣ ≃* Mˣ × Nˣ.
- `mathlib:MulOpposite` (Mathlib/Algebra/Opposites.lean): The opposite monoid or ring Aᵐᵒᵖ; right A-modules are left Aᵐᵒᵖ-modules.
- `mathlib:MvPolynomial` (Mathlib/Algebra/MvPolynomial/Basic.lean): Multivariate polynomial rings (for ℝ[x, y]/(x² + y² − 1)).
- `mathlib:OrzechProperty.injective_of_surjective_endomorphism` (Mathlib/RingTheory/OrzechProperty.lean): Over a commutative ring a surjective endomorphism of a finitely generated module is injective.
- `mathlib:Quaternion` (Mathlib/Algebra/Quaternion.lean): Hamilton's quaternions ℍ[R].
- `mathlib:QuotientGroup.eq_one_iff` (Mathlib/GroupTheory/QuotientGroup/Defs.lean): The image of x in G ⧸ N is 1 iff x ∈ N.
- `mathlib:QuotientGroup.lift` (Mathlib/GroupTheory/QuotientGroup/Defs.lean): Universal property of the quotient by a normal subgroup.
- `mathlib:QuotientGroup.map` (Mathlib/GroupTheory/QuotientGroup/Defs.lean): Induced map of quotient groups.
- `mathlib:QuotientGroup.mk'` (Mathlib/GroupTheory/QuotientGroup/Defs.lean): The quotient map G →* G ⧸ N.
- `mathlib:QuotientGroup.quotientKerEquivOfSurjective` (Mathlib/GroupTheory/QuotientGroup/Basic.lean): First isomorphism theorem for a surjective homomorphism.
- `mathlib:QuotientGroup.quotientKerEquivRange` (Mathlib/GroupTheory/QuotientGroup/Basic.lean): First isomorphism theorem onto the range.
- `mathlib:QuotientGroup.quotientMulEquivOfEq` (Mathlib/GroupTheory/QuotientGroup/Basic.lean): Equal normal subgroups give isomorphic quotients.
- `mathlib:Real.cos` (Mathlib/Analysis/Complex/Trigonometric.lean): The real cosine (for the embedding of the circle ring into C(S¹, ℝ)).
- `mathlib:RingEquiv.mopMatrix` (Mathlib/Data/Matrix/Basic.lean): Matrix m m αᵐᵒᵖ ≃+* (Matrix m m α)ᵐᵒᵖ (transpose), for non-commutative α.
- `mathlib:RingHom.pi` (Mathlib/Algebra/Ring/Pi.lean): The ring homomorphism into a product of rings given by a family.
- `mathlib:RingHom.prod` (Mathlib/Algebra/Ring/Prod.lean): The ring homomorphism into a product given by two ring homomorphisms.
- `mathlib:Subgroup.Normal` (Mathlib/Algebra/Group/Subgroup/Defs.lean): Normal subgroups.
- `mathlib:Subgroup.center` (Mathlib/GroupTheory/Subgroup/Center.lean): The centre of a group.
- `mathlib:Subgroup.closure` (Mathlib/Algebra/Group/Subgroup/Lattice.lean): The subgroup generated by a set.
- `mathlib:Subgroup.closure_induction` (Mathlib/Algebra/Group/Subgroup/Lattice.lean): Induction on the subgroup generated by a set.
- `mathlib:Subgroup.closure_le` (Mathlib/Algebra/Group/Subgroup/Lattice.lean): closure k ≤ K ↔ k ⊆ K.
- `mathlib:Subgroup.commutator_def` (Mathlib/GroupTheory/Commutator/Basic.lean): ⁅H₁, H₂⁆ is the closure of the commutators ⁅g₁, g₂⁆.
- `mathlib:Subgroup.commutator_le` (Mathlib/GroupTheory/Commutator/Basic.lean): ⁅H₁, H₂⁆ ≤ H₃ iff every commutator ⁅g₁, g₂⁆ lies in H₃.
- `mathlib:Subgroup.commutator_normal` (Mathlib/GroupTheory/Commutator/Basic.lean): The commutator of normal subgroups is normal.
- `mathlib:Subgroup.map` (Mathlib/Algebra/Group/Subgroup/Map.lean): The image of a subgroup.
- `mathlib:Subgroup.mem_iSup_of_directed` (Mathlib/Algebra/Group/Subgroup/Lattice.lean): The supremum of a directed family of subgroups is their union.
- `mathlib:Units.ext` (Mathlib/Algebra/Group/Units/Defs.lean): Units are equal if their values are.
- `mathlib:Units.map` (Mathlib/Algebra/Group/Units/Hom.lean): Units.map f : Mˣ →* Nˣ for a monoid homomorphism f.
- `mathlib:Units.map_comp` (Mathlib/Algebra/Group/Units/Hom.lean): Units.map respects composition.
- `mathlib:commutator` (Mathlib/GroupTheory/Commutator/Basic.lean): The commutator subgroup ⁅⊤, ⊤⁆ of a group.
- `mathlib:commutatorElement` (Mathlib/Algebra/Group/Commutator.lean): The commutator ⁅g₁, g₂⁆ = g₁ g₂ g₁⁻¹ g₂⁻¹ (the K-book's convention).
- `mathlib:commutatorElement_inv` (Mathlib/GroupTheory/Commutator/Basic.lean): ⁅g₁, g₂⁆⁻¹ = ⁅g₂, g₁⁆.
- `tauceti:LinearMap.GeneralLinearGroup.prodMap` (TauCeti/LinearAlgebra/GeneralLinearGroup/Prod.lean): The product GL(V) × GL(W) → GL(V × W) of automorphisms.
- `tauceti:Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field` (TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean): Over a field K, SL_ι(K) is generated by the transvections TransvectionStruct.toSpecialLinearGroup, for any finite index type.
- `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose` (TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Diagonal.lean): Over a commutative ring, diag(a, a⁻¹) at two coordinates is a product of six transvections.
- `tauceti:TauCeti.coe_transvectionUnit` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean): The matrix underlying transvectionUnit is Matrix.transvection.
- `tauceti:TauCeti.commutatorElement_transvectionUnit` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean): ⁅x_ij(c), x_jl(d)⁆ = x_il(cd) for distinct i, j, l (commutative ring).
- `tauceti:TauCeti.commutatorElement_transvectionUnit_reverse` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean): ⁅x_ij(c), x_ki(d)⁆ = x_kj(−(dc)) (commutative ring).
- `tauceti:TauCeti.commute_transvection` (TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean): Bare transvection matrices at non-chaining positions commute (commutative ring, proof by abel).
- `tauceti:TauCeti.commute_transvectionUnit` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean): Transvections at non-chaining positions commute in GL n A (commutative ring).
- `tauceti:TauCeti.toGL_transvection_eq_transvectionUnit` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean): toGL of the special-linear transvection is transvectionUnit.
- `tauceti:TauCeti.transvectionUnit` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean): The transvection 1 + cE_ij (i ≠ j) as an element of GL n A, for a commutative ring A.
- `tauceti:TauCeti.transvectionUnit_mem_of_adjacent` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean): A subgroup of GL_{m+1}(A) containing the adjacent transvections in both orientations contains every transvection.
- `tauceti:TauCeti.transvectionWeylElement` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean): The Weyl representative x_ij(1) x_ji(−1) x_ij(1) in GL n A (commutative ring).
- `tauceti:TauCeti.transvectionWeylElement_inv` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean): The inverse of the Weyl representative for (i, j) is the one for (j, i).
- `tauceti:TauCeti.transvection_mul_transvection_eq_mul_mul` (TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean): x_ij(c) x_jl(d) = x_jl(d) x_ij(c) x_il(cd) for bare transvection matrices (commutative ring, proof by abel).
- `mathlib:Algebra.norm` (Mathlib/RingTheory/Norm/Defs.lean): The norm N_{S/R}(s) = det of left multiplication by s (1 when S has no finite basis).
- `mathlib:Algebra.norm_eq_one_of_not_exists_basis` (Mathlib/RingTheory/Norm/Defs.lean): Algebra.norm R x = 1 when S has no finite R-basis: the junk value off the free case.
- `mathlib:ClassGroup.mk0_eq_one_iff` (Mathlib/RingTheory/ClassGroup/Basic.lean): The class of a nonzero ideal is trivial iff the ideal is principal.
- `mathlib:EuclideanDomain` (Mathlib/Algebra/EuclideanDomain/Defs.lean): Euclidean domains: division with remainder for a well-founded relation.
- `mathlib:Fintype.card_units` (Mathlib/Algebra/GroupWithZero/Units/Fintype.lean): The unit group of a finite field (group with zero) has card − 1 elements.
- `mathlib:Ideal.IsMaximal` (Mathlib/RingTheory/Ideal/Maximal.lean): Maximal ideals.
- `mathlib:Ideal.absNorm` (Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean): The absolute norm of an ideal, #(S/I).
- `mathlib:Ideal.absNorm_span_singleton` (Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean): absNorm (r) = |Algebra.norm ℤ r|.
- `mathlib:Ideal.finite_factors` (Mathlib/RingTheory/DedekindDomain/Factorization.lean): A nonzero ideal of a Dedekind domain lies in finitely many height-one primes.
- `mathlib:Int.euclideanDomain` (Mathlib/Algebra/EuclideanDomain/Int.lean): ℤ is a Euclidean domain.
- `mathlib:Int.units_eq_one_or` (Mathlib/Algebra/Ring/Int/Units.lean): Every unit of ℤ is 1 or −1.
- `mathlib:IsCoprime` (Mathlib/RingTheory/Coprime/Basic.lean): IsCoprime a b: a x + b y = 1 for some x, y.
- `mathlib:IsCoprime.exists_SL2_row` (Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean): A coprime pair is a row of some matrix in SL(2, R).
- `mathlib:IsDedekindDomain` (Mathlib/RingTheory/DedekindDomain/Basic.lean): Dedekind domains.
- `mathlib:IsDedekindDomain.HeightOneSpectrum` (Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean): The height-one primes (finite places) of a Dedekind domain.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation` (Mathlib/RingTheory/DedekindDomain/AdicValuation.lean): The v-adic valuation on the fraction field.
- `mathlib:IsDedekindDomain.exists_forall_sub_mem_ideal` (Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean): Chinese remainder theorem for finitely many distinct primes of a Dedekind domain.
- `mathlib:IsDedekindDomain.integer_empty` (Mathlib/RingTheory/DedekindDomain/SInteger.lean): Set.integer ∅ K = ⊥, the image of R.
- `mathlib:IsDiscreteValuationRing` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): Discrete valuation rings.
- `mathlib:IsDiscreteValuationRing.addVal` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): The ℕ∞-valued additive valuation of a DVR.
- `mathlib:IsDiscreteValuationRing.addVal_eq_zero_iff` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): addVal x = 0 iff x is a unit.
- `mathlib:IsDiscreteValuationRing.addVal_uniformizer` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): addVal ϖ = 1 for an irreducible (uniformiser) ϖ.
- `mathlib:IsDiscreteValuationRing.eq_unit_mul_pow_irreducible` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): Every nonzero x is u·ϖⁿ with u a unit.
- `mathlib:IsLocalization` (Mathlib/RingTheory/Localization/Defs.lean): The predicate that S is the localisation of R at a submonoid.
- `mathlib:IsLocalization.Away` (Mathlib/RingTheory/Localization/Away/Basic.lean): Localisation away from one element.
- `mathlib:LinearMap.det_restrictScalars` (Mathlib/RingTheory/Norm/Transitivity.lean): det_R(f.restrictScalars R) = Algebra.norm R (det_S f) for S free over R and A free over S.
- `mathlib:LinearMap.restrictScalars` (Mathlib/Algebra/Module/LinearMap/Defs.lean): Restriction of scalars of a linear map.
- `mathlib:LinearMap.restrictScalars_toMatrix` (Mathlib/LinearAlgebra/Matrix/ToLin.lean): The matrix of a restricted-scalars map in a tower basis is the block matrix of left-multiplication matrices.
- `mathlib:Localization.Away` (Mathlib/GroupTheory/MonoidLocalization/Away.lean): The localisation R[1/x].
- `mathlib:Module.length` (Mathlib/RingTheory/Length.lean): The length of a module.
- `mathlib:Module.length_eq_add_of_exact` (Mathlib/RingTheory/Length.lean): Length is additive in short exact sequences.
- `mathlib:Module.length_quotient` (Mathlib/RingTheory/Length.lean): The length of M/N is the coheight of N.
- `mathlib:Nat.forall_exists_prime_gt_and_eq_mod` (Mathlib/NumberTheory/LSeries/PrimesInAP.lean): Dirichlet's theorem: arbitrarily large primes in every invertible residue class.
- `mathlib:NumberField.InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces` (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean): The number of infinite places is r₁ + r₂.
- `mathlib:NumberField.IsTotallyComplex` (Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean): Totally complex number fields.
- `mathlib:NumberField.RingOfIntegers` (Mathlib/NumberTheory/NumberField/Basic.lean): The ring of integers 𝓞 K.
- `mathlib:NumberField.RingOfIntegers.basis` (Mathlib/NumberTheory/NumberField/Basic.lean): An integral basis of 𝓞 K.
- `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup` (Mathlib/NumberTheory/NumberField/ClassNumber.lean): The class group of 𝓞 K is finite.
- `mathlib:NumberField.Units.exist_unique_eq_mul_prod` (Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean): Dirichlet's unit theorem: unique decomposition as root of unity times powers of the fundamental system.
- `mathlib:NumberField.Units.finrank_eq` (Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean): finrank ℤ of the units is rank K.
- `mathlib:NumberField.Units.fundSystem` (Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean): A fundamental system of units.
- `mathlib:NumberField.Units.mem_torsion` (Mathlib/NumberTheory/NumberField/Units/Basic.lean): A unit is torsion iff all its absolute values are 1.
- `mathlib:NumberField.Units.rank` (Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean): The unit rank card(InfinitePlace K) − 1.
- `mathlib:NumberField.Units.torsion` (Mathlib/NumberTheory/NumberField/Units/Basic.lean): The torsion subgroup (roots of unity) of the units.
- `mathlib:PresentedGroup` (Mathlib/GroupTheory/PresentedGroup.lean): The group presented by generators and relations.
- `mathlib:QuotientGroup.mk` (Mathlib/GroupTheory/Coset/Defs.lean): The quotient map to G/N.
- `mathlib:RingHom` (Mathlib/Algebra/Ring/Hom/Defs.lean): Ring homomorphisms.
- `mathlib:Set.integer` (Mathlib/RingTheory/DedekindDomain/SInteger.lean): The ring of S-integers {x : v(x) ≤ 1 for v ∉ S}.
- `mathlib:Set.unitEquivUnitsInteger` (Mathlib/RingTheory/DedekindDomain/SInteger.lean): The S-units are the units of the ring of S-integers.
- `mathlib:Subgroup.normalClosure` (Mathlib/Algebra/Group/Subgroup/Basic.lean): The normal closure of a subset.
- `mathlib:isCyclic_subgroup_units` (Mathlib/RingTheory/IntegralDomain.lean): Finite subgroups of the units of a domain are cyclic.
- `mathlib:isOfFinOrder_of_finite` (Mathlib/GroupTheory/OrderOfElement.lean): Every element of a finite group has finite order.
- `mathlib:padicValRat` (Mathlib/NumberTheory/Padics/PadicVal/Basic.lean): The p-adic valuation on ℚ.
- `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv` (TauCeti/RingTheory/DedekindDomain/SInteger/Spectrum.lean): The height-one primes of O_S are the height-one primes of R outside S.
- `tauceti:Matrix.BlockTriangular.det_eq_prod_diag` (TauCeti/LinearAlgebra/Matrix/Triangular.lean): A block-triangular matrix for an injective labelling has determinant the product of its diagonal.
- `tauceti:Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top` (TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean): SL_n(ℤ) is generated by elementary transvections.
- `tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative` (TauCeti/NumberTheory/NumberField/Units/Dirichlet.lean): (𝓞 F)ˣ ≃* torsion × ℤ^rank, the structural unit theorem.
- `tauceti:Set.mem_integer_iff` (TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean): Membership in Set.integer: v(x) ≤ 1 for every v ∉ S.
- `tauceti:Set.unitEmptyEquivUnits` (TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean): The ∅-units are the units of R.
- `tauceti:Set.unitValuation` (TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean): The S-valuation map S-units → ℤ^S.
- `tauceti:Set.unitValuation_ker` (TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean): Its kernel is the ∅-units (left exactness of 1 → Rˣ → O_Sˣ → ℤ^S).
- `tauceti:Set.unit_fg_of_units` (TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean): For finite S and finitely generated Rˣ, the S-units are finitely generated.
- `tauceti:Set.unit_mono` (TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean): S ⊆ S′ gives S.unit ≤ S′.unit.
- `tauceti:TauCeti.unitsLeftMulMatrix` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/LeftMulMatrix.lean): Sˣ →* GL ι R by left multiplication in a basis.
- `tauceti:TauCeti.val_det_unitsLeftMulMatrix` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/LeftMulMatrix.lean): det of unitsLeftMulMatrix b x is Algebra.norm R x.
- `mathlib:Ideal.IsTwoSided` (Mathlib/RingTheory/Ideal/Defs.lean): The predicate that a (left) ideal is two-sided.
- `mathlib:Ideal.Quotient.ring` (Mathlib/RingTheory/Ideal/Quotient/Defs.lean): The ring structure on R ⧸ I for an ideal I with [I.IsTwoSided].
- `mathlib:Ideal.toTwoSided` (Mathlib/RingTheory/TwoSidedIdeal/Operations.lean): The TwoSidedIdeal of an ideal with [I.IsTwoSided].
- `mathlib:NumberField.IdeleGroup` (Mathlib/NumberTheory/NumberField/AdeleRing.lean): The idèle group of a number field, the units of its adèle ring.
- `mathlib:NumberField.IdeleClassGroup` (Mathlib/NumberTheory/NumberField/AdeleRing.lean): The idèle class group, the idèles modulo the principal idèles.
- `mathlib:NumberField.IdeleClassGroup.ofAdicCompletion` (Mathlib/NumberTheory/NumberField/AdeleRing.lean): The map from the units of the completion at a finite prime to the idèle class group.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers` (Mathlib/RingTheory/DedekindDomain/AdicValuation.lean): The valuation ring of the completion of K at a height-one prime v.

## Layer overview

| Layer | Title | Nodes | Planets | Coverage |
|---|---|---|---|---|
| Z.1 | Finitely generated projectives and their presentations | 24 | 6 | partial |
| Z.2 | Rank in the correct generality | 24 | 6 | source_decomposed |
| U.1 | Stabilisation and elementary groups | 25 | 5 | source_decomposed |
| U.2 | K₁ and its calculus | 18 | 4 | source_decomposed |
| U.3 | Determinant, units and SK₁ | 27 | 6 | partial |
| U.4 | S-integers and the arithmetic theorem | 30 | 6 | partial |
| U.5 | Relative K₁ and maps | 22 | 6 | partial |
| U.6 | Homotopy comparison and tests | 14 | 5 | partial |

Each layer section below opens with the layer's coverage record, then states every node: its statement and hypotheses, the proof outline, for definitions and constructions the API and the unit tests, its acceptance checks, its dependencies and its sources.

## Z.1 — Finitely generated projectives and their presentations

*Coverage: partial.* Planned within RS-18’s narrowed scope for Z.1 (accepted): the concrete idempotent/stabilisation classification, splitting and complement data, the ring-carrier instantiation of the existing K₀, class induction and the stable-equality criterion, scalar extension and ring-level Morita functoriality, all on the existing carriers (finiteProjectiveModules, SplitK0, ExactK0); no new categorical K₀ is built. Stage targets and their nodes. (1) Finitely generated projectives = summands of finite free modules, with complement, splitting maps and idempotent matrix: the retract equivalence itself is Mathlib (Module.Finite.exists_comp_eq_id_of_projective, Module.Projective.of_split); the data are Z.1/free-summand-data, on Z.1/idempotent-module and Z.1/idempotent-module-finite-projective. (2) Idempotent matrices up to stabilised equivalence ↔ isomorphism classes: Z.1/stable-idempotent-monoid, Z.1/idempotent-module-conj, Z.1/idempotent-module-block, Z.1/iso-stably-conjugate, Z.1/idempotent-classification, and K₀ as the group completion of Idem(R) (Z.1/ring-k0-idempotent-completion). (3) “A presentation of the actual projective category, not a replacement for it”: K₀ is taken on the module category itself, and Z.1/projective-karoubi identifies the category of finitely generated projectives with the idempotent completion of the finite free modules, morphisms included (K-book II.7.3.1). (4) Ring K₀ via the existing universal property: Z.1/ring-k0. (5) Object-class induction: Z.1/ring-k0-class-induction. (6) Equality of classes by stable isomorphism: Z.1/stable-isomorphism-criterion and Z.1/stably-free-class, with the free-class map and the invariant basis number in Z.1/free-class-ibn (K-book II.2.1, corrected). (7) Scalar extension: Mathlib has extension of scalars only for commutative rings, so Z.1/extend-scalars constructs it for arbitrary ring homomorphisms (left adjoint of restriction), Z.1/extend-scalars-finite-projective and Z.1/ring-k0-map give the functor K₀(A) → K₀(B) with identity and composition laws. (8) Restriction of scalars along a finite projective extension, requested by CA.7: Z.1/restrict-scalars-finite-projective and Z.1/ring-k0-transfer. (9) Morita functoriality: Z.1/equivalence-preserves-finite-projective, Z.1/ring-k0-morita, with the test K₀(M_n(A)) ≅ K₀(A) in Z.1/ring-k0-matrix. (10) Direct-sum relations suffice because short exact sequences of projectives split: Tau Ceti already has finiteProjectiveModulesExactStructure_eq_split and ExactK0.fromSplitEquiv; the ring-level statement is Z.1/ring-k0-exact. Consumers: the CA.7 request (ring K₀ on SplitK0 of finiteProjectiveModules, the class [P], [P] = [Q] ⇔ P ⊕ Λ^k ≅ Q ⊕ Λ^k, scalar extension along Λ → Λ′ and restriction along Λ → Λ′ with Λ′ finitely generated projective over Λ) is supplied by Z.1/ring-k0, Z.1/stable-isomorphism-criterion, Z.1/ring-k0-map with Z.1/extend-scalars, and Z.1/ring-k0-transfer. Conventions: left modules, matrices acting on row vectors from the right, the zero ring allowed. K-book statements proved only as exercises there (Ex. I.2.3) are proved in full in the nodes. Not targets of Z.1 and so not planned here: the Hattori–Stallings trace (II.2.5), nilpotent-ideal invariance (II.2.2), Pierce’s theorem (II.2.2.2), filtered colimits (II.2.1.6, GeneralAlgebraicKTheory K.7), Milnor squares and Mayer–Vietoris (II.2.9), the relative group K₀(T) (II.2.10).

- Remaining: Check the categorical proof of Z.1/equivalence-preserves-finite-projective (compact elements of subobject lattices and projective objects) against a readable source, or read Bass, Algebraic K-theory, II.3, which the K-book cites for Theorem II.2.7(a) (gaps).
- Remaining: Once GrothendieckEulerForms layer 4 exists, state and prove that Z.1/ring-k0-morita restricted to finite-dimensional algebras equals that layer’s Morita isomorphism on the common carrier (requests).

### The module of an idempotent matrix

`Z.1/idempotent-module` · definition

Let R be a ring and ι a finite type with decidable equality. For e ∈ Matrix ι ι R with e·e = e, the idempotent module P(e) is the left R-submodule of R^ι = (ι → R) given by the range of the left R-linear map ρ_e : R^ι → R^ι, v ↦ v·e (Matrix.vecMulLinear e). Equivalently P(e) = {v ∈ R^ι : v·e = v}. The idempotent 1 − e gives the complementary module P(1 − e). Reindexing along σ : ι ≃ κ carries P(e) onto P(reindex σ σ e) by the coordinate permutation. In the K-book’s right-module notation P(e) is e(R^n); here e acts on row vectors from the right, so that the definition is correct for noncommutative R.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- Matrices act on row vectors from the right: M ∈ Mat_{m×n}(R) gives the left R-linear map R^m → R^n, v ↦ v·M (Mathlib Matrix.vecMulLinear), so that End_R(R^n) ≅ M_n(R)ᵐᵒᵖ (LinearMap.toMatrixRight'). This is the left-module form of the K-book’s column vectors e(R^n).
- ι is a finite type with decidable equality; e ∈ Matrix ι ι R satisfies IsIdempotentElem e.

**Proof.**

1. Define P(e) := LinearMap.range (Matrix.vecMulLinear e). The map v ↦ v·e is left R-linear for every ring R, because (r•v)·e = r•(v·e); a column-vector map v ↦ e·v would not be.
2. Membership: if v = w·e then v·e = w·(e·e) = w·e = v (Matrix.vecMul_vecMul and idempotence); conversely v = v·e lies in the range. So v ∈ P(e) ↔ v·e = v, which is LinearMap.IsIdempotentElem.mem_range_iff for the idempotent endomorphism ρ_e (ρ_e ∘ ρ_e = ρ_{e·e} by Matrix.toLinearMapRight'_mul).
3. Reindexing: for σ : ι ≃ κ, v·(reindex σ σ e) = (v ∘ σ)·e reindexed, so the coordinate permutation (ι → R) ≃ₗ (κ → R) maps P(e) onto P(reindex σ σ e).

**API.**

- `TauCeti.idempotentModule` (constructor): P(e) := range (Matrix.vecMulLinear e) : Submodule R (ι → R), for e : Matrix ι ι R.
- `TauCeti.mem_idempotentModule_iff` (characterisation): For IsIdempotentElem e: v ∈ P(e) ↔ v ᵥ* e = v.
- `TauCeti.idempotentModule_one` (simp): P(1) = ⊤.
- `TauCeti.idempotentModule_zero` (simp): P(0) = ⊥.
- `TauCeti.idempotentModule.retraction` (projection): The map R^ι → P(e), v ↦ v·e, is a retraction of the inclusion: it restricts to the identity on P(e).
- `TauCeti.idempotentModule_reindex` (compatibility): For σ : ι ≃ κ, the coordinate permutation maps P(e) onto P(reindex σ σ e); in particular the two are isomorphic.
- `TauCeti.idempotentModule_unique` (example): For ι = Unit and e ∈ R idempotent, P(e) is the left ideal R·e.

**Unit tests.**

- `TauCeti.idempotentModule_one_test` (degenerate): P(1 : Matrix (Fin 2) (Fin 2) R) = ⊤ and P(0 : Matrix (Fin 2) (Fin 2) R) = ⊥.
- `TauCeti.idempotentModule_diag_test` (computation): Over a field k, P(diag(1, 0)) = {(a, 0) : a ∈ k}, a one-dimensional subspace of k².
- `TauCeti.idempotentModule_rows_test` (non-example): Over ℚ, for the idempotent e with rows (1, 1) and (0, 0): v·e = (v₁, v₁), so P(e) = {(a, a)}; a definition using the column action e·v would give {(a, 0)} instead.
- `TauCeti.idempotentModule_prod_test` (computation): Over R = ℤ × ℤ and the 1 × 1 idempotent e = (1, 0): P(e) = R·(1, 0) = ℤ × 0.

**Acceptance.**

- P(1) = ⊤ and P(0) = ⊥ in R^ι.
- For ι a singleton and e ∈ R idempotent, P(e) is the left ideal R·e (the K-book’s eR in the right-module convention).
- Over ℚ, for e = ((1, 1), (0, 0)) (rows), P(e) = {(a, a)}; the column-vector image {(a, 0)} is a different submodule.

**Used by.**

- Weibel, Example I.2.1.2: every finitely generated projective is e(R^n) for an idempotent e ∈ M_n(R)
- Weibel, II.2, the Hattori–Stallings paragraph (PDF p. 81): P = e(R^n) with End(P) = eM_n(R)e; block sums represent direct sums
- KTheoryLowDegrees:Z.1/stable-idempotent-monoid and Z.1/idempotent-classification: the class of an idempotent matrix is sent to the isomorphism class of P(e)
- KTheoryLowDegrees:Z.1/extend-scalars-finite-projective: extension of scalars along f sends P(e) to P(f(e))
- KTheoryLowDegrees:Z.2/componentwise-free: for a central idempotent e ∈ A, P(e) = A·e is the clopen module of D(e)

**Depends on.** libraries: `mathlib:Matrix.vecMulLinear`, `mathlib:Matrix.vecMul_vecMul`, `mathlib:Matrix.toLinearMapRight'_mul`, `mathlib:LinearMap.IsIdempotentElem.mem_range_iff`, `mathlib:Matrix.reindex`.

**Sources.**

- `Kbook.2013`, Example I.2.1.2 (Idempotents), PDF p. 17 (draft p. 9): “Every finitely generated projective R-module arises from an idempotent element in a matrix ring Mn(R). To see this, note that if P ⊕Q = R^n then the projection-inclusion R^n →P →R^n is an idempotent element e of Mn(R). By inspection, the image e(R^n) of e is P.” — The K-book presents every finitely generated projective as the image e(R^n) of an idempotent matrix; the node defines that image, in the left-module form.
- `Kbook.2013`, Example I.2.1.2 (Idempotents), PDF p. 17 (draft p. 9): “If e ∈R is idempotent then P = eR is projective because R = eR ⊕(1 −e)R.” — The 1 × 1 case: an idempotent e ∈ R gives the projective eR, here the left ideal R·e.

### Idempotent modules are finitely generated projective summands

`Z.1/idempotent-module-finite-projective` · lemma

For an idempotent e ∈ Matrix ι ι R: P(e) and P(1 − e) are complementary submodules of R^ι (IsCompl), the map v ↦ (v·e, v·(1 − e)) is an isomorphism R^ι ≃ₗ P(e) × P(1 − e), and P(e) is finitely generated and projective, so ModuleCat.of R P(e) lies in finiteProjectiveModules R.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- Matrices act on row vectors from the right: M ∈ Mat_{m×n}(R) gives the left R-linear map R^m → R^n, v ↦ v·M (Mathlib Matrix.vecMulLinear), so that End_R(R^n) ≅ M_n(R)ᵐᵒᵖ (LinearMap.toMatrixRight'). This is the left-module form of the K-book’s column vectors e(R^n).
- e ∈ Matrix ι ι R is idempotent, ι finite with decidable equality.

**Proof.**

1. 1 − e is idempotent. The endomorphism ρ_e is idempotent, so LinearMap.IsIdempotentElem.isCompl gives IsCompl (range ρ_e) (ker ρ_e), and LinearMap.IsIdempotentElem.ker_eq_range_one_sub identifies ker ρ_e with range (1 − ρ_e) = P(1 − e).
2. The splitting v = v·e + v·(1 − e) gives the isomorphism with P(e) × P(1 − e).
3. The retraction v ↦ v·e composed with the inclusion P(e) → R^ι is the identity on P(e): Module.Projective.of_split gives projectivity, and Module.Finite.of_surjective applied to the retraction from the finite module R^ι gives finite generation.
4. finiteProjectiveModules_iff packages the two properties for ModuleCat.of R P(e).

**Acceptance.**

- For e = 1 the complement is P(0) = 0.
- For e = diag(1, 0) over a field, the two summands are the two coordinate lines.

**Depends on.** this roadmap: `Z.1/idempotent-module`; libraries: `mathlib:LinearMap.IsIdempotentElem.isCompl`, `mathlib:LinearMap.IsIdempotentElem.ker_eq_range_one_sub`, `mathlib:Module.Projective.of_split`, `mathlib:Module.Finite.of_surjective`, `tauceti:TauCeti.finiteProjectiveModules_iff`.

**Sources.**

- `Kbook.2013`, Example I.2.1.2 (Idempotents), PDF p. 17 (draft p. 9): “If e ∈R is idempotent then P = eR is projective because R = eR ⊕(1 −e)R.” — The source proves projectivity of eR from the decomposition R = eR ⊕ (1 − e)R; the node is the same argument for an idempotent matrix acting on R^ι.
- `Kbook.2013`, Definition I.2.1, PDF p. 15 (draft p. 7): “Definition 2.1. An R-module P is called projective if there exists a module Q so that the direct sum P ⊕Q is free.” — A projective module is a direct summand of a free one; here the complement is P(1 − e).

### Free-summand data of a finitely generated projective module

`Z.1/free-summand-data` · construction · planet “Idempotent matrix of a projective module”

For a ring R and a left R-module P, a free-summand datum FreeSummandData R P consists of n ∈ ℕ and R-linear maps ι : P → R^n, π : R^n → P with π ∘ ι = id_P. It determines: the idempotent endomorphism ι ∘ π of R^n and its matrix e := LinearMap.toMatrixRight' (ι ∘ π) ∈ M_n(R), which is idempotent; an isomorphism P ≃ₗ P(e), x ↦ ι x; the complement Q := ker π with P × Q ≃ₗ R^n, (x, q) ↦ ι x + q. Every finitely generated projective module admits a datum, and a module admitting one is finitely generated projective. Data are not unique; only the stabilised class of e is (Z.1/idempotent-classification).

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- Matrices act on row vectors from the right: M ∈ Mat_{m×n}(R) gives the left R-linear map R^m → R^n, v ↦ v·M (Mathlib Matrix.vecMulLinear), so that End_R(R^n) ≅ M_n(R)ᵐᵒᵖ (LinearMap.toMatrixRight'). This is the left-module form of the K-book’s column vectors e(R^n).
- For existence: Module.Finite R P and Module.Projective R P.

**Proof.**

1. Existence: Module.Finite.exists_comp_eq_id_of_projective gives n, a surjection f : R^n → P and g : P → R^n with f ∘ g = id; take ι := g, π := f.
2. Converse: Module.Projective.of_split applied to (ι, π) gives projectivity; π is surjective (π ∘ ι = id), so Module.Finite.of_surjective gives finite generation.
3. Idempotent: p := ι ∘ π satisfies p ∘ p = ι ∘ (π ∘ ι) ∘ π = p. LinearMap.toMatrixRight' turns composition into the reversed matrix product (LinearMap.toMatrixRight'_comp), so e·e = e, and Matrix.toLinearMapRight' e = p.
4. P ≃ P(e): ι is injective (left inverse π) with range ι = range p = P(e) (range p ⊆ range ι, and ι x = p (ι x)); LinearEquiv.ofInjective corestricted to P(e).
5. Complement: ker π = ker p; IsCompl (range p) (ker p) (LinearMap.IsIdempotentElem.isCompl) gives P × ker π ≃ R^n, with inverse v ↦ (π v, v − ι π v). Under Submodule.isIdempotentElemEquiv the idempotent p with range P(e) corresponds to the retraction R^n → P(e), which is how data with a prescribed image are built.
6. Operations: data for P and P′ give a datum for P × P′ with n + n′ and idempotent the block sum (Matrix.fromBlocks e 0 0 e′, reindexed along finSumFinEquiv); an idempotent e gives the datum of P(e) with ι the inclusion and π = ρ_e, whose idempotent is e.

**API.**

- `TauCeti.FreeSummandData` (structure): Fields n : ℕ, ι : P →ₗ[R] (Fin n → R), π : (Fin n → R) →ₗ[R] P and π ∘ₗ ι = LinearMap.id.
- `TauCeti.FreeSummandData.exists` (constructor): [Module.Finite R P] [Module.Projective R P] : Nonempty (FreeSummandData R P).
- `TauCeti.FreeSummandData.finite` (other): A datum makes P finitely generated.
- `TauCeti.FreeSummandData.projective` (other): A datum makes P projective.
- `TauCeti.FreeSummandData.idempotent` (data): e := toMatrixRight' (ι ∘ₗ π) : Matrix (Fin n) (Fin n) R, with isIdempotentElem_idempotent : IsIdempotentElem e.
- `TauCeti.FreeSummandData.equivIdempotentModule` (equivalence): P ≃ₗ[R] P(e), x ↦ ι x.
- `TauCeti.FreeSummandData.complement` (data): Q := ker π, with isCompl_range_complement : IsCompl (range ι) (ker π).
- `TauCeti.FreeSummandData.prodComplementEquiv` (equivalence): P × ker π ≃ₗ[R] (Fin n → R), (x, q) ↦ ι x + q.
- `TauCeti.FreeSummandData.complement_finiteProjective` (other): The complement is finitely generated projective.
- `TauCeti.FreeSummandData.ofIdempotent` (constructor): For an idempotent e, the datum of P(e) with ι the inclusion and π = ρ_e; (ofIdempotent e).idempotent = e.
- `TauCeti.FreeSummandData.prod` (constructor): Data for P and P′ give a datum for P × P′ whose idempotent is the block sum of the two, reindexed along finSumFinEquiv.
- `TauCeti.FreeSummandData.congr` (functoriality): A datum for P and P ≃ₗ P′ give a datum for P′ with the same idempotent.

**Unit tests.**

- `TauCeti.FreeSummandData.free_test` (degenerate): For P = Fin n → R with ι = π = id, idempotent = 1 and the complement is ⊥.
- `TauCeti.FreeSummandData.zero_test` (degenerate): For P = 0 every datum has idempotent 0 and complement ⊤.
- `TauCeti.FreeSummandData.ofIdempotent_test` (characterisation): (ofIdempotent e).idempotent = e for every idempotent e : Matrix (Fin n) (Fin n) R.
- `TauCeti.FreeSummandData.prod_field_test` (computation): Over R = ℚ × ℚ, for P = ℚ × 0 with n = 1, ι x = x and π v = (1, 0)·v, the idempotent is the 1 × 1 matrix (1, 0) and the complement is 0 × ℚ.
- `TauCeti.FreeSummandData.not_unique_test` (non-example): For P = ℚ over ℚ, the data (n = 1, ι = id) and (n = 2, ι x = (x, 0), π v = v₀) have idempotents 1 ∈ M₁(ℚ) and diag(1, 0) ∈ M₂(ℚ); the idempotent is an invariant only up to stabilised conjugation.

**Acceptance.**

- For P = R^n with ι = π = id the idempotent is 1 and the complement is 0.
- The K-book’s example: for P ⊕ Q = R^n the projection-inclusion R^n → P → R^n is the idempotent, and its image is P.

**Used by.**

- Weibel, I.2 (PDF p. 16) and Example I.2.1.2: a finitely generated projective is a summand of R^n, with complement, projection and idempotent
- KTheoryLowDegrees:U.2 (the K₁ class of an automorphism of a finitely generated projective): a complement Q with P ⊕ Q ≅ A^n turns α into the automorphism α ⊕ 1_Q of a free module
- KTheoryLowDegrees:Z.1/ring-k0-class-induction and Z.1/stable-isomorphism-criterion: adding the complement makes a class or an isomorphism class free (cofinality of free modules)
- KTheoryLowDegrees:Z.2/local-projective-free: Weibel’s proof of Lemma I.2.2 starts from P ⊕ Q ≅ R^n
- GeneralAlgebraicKTheory:K.2:plus: “every finitely generated projective has a projective complement making it free” — imported from here (RS-18 owner record)

**Depends on.** this roadmap: `Z.1/idempotent-module`, `Z.1/idempotent-module-finite-projective`; libraries: `mathlib:Module.Finite.exists_comp_eq_id_of_projective`, `mathlib:Module.Projective.of_split`, `mathlib:Module.Finite.of_surjective`, `mathlib:LinearMap.toMatrixRight'`, `mathlib:LinearMap.toMatrixRight'_comp`, `mathlib:LinearMap.IsIdempotentElem.isCompl`, `mathlib:Matrix.fromBlocks`, `mathlib:finSumFinEquiv`, `mathlib:Submodule.isIdempotentElemEquiv`.

**Sources.**

- `Kbook.2013`, I.2, paragraph after Definition 2.1, PDF p. 16 (draft p. 8): “If P is a projective module, then P is generated by n elements if and only if there is a decomposition P ⊕Q ∼= R^n. Indeed, the generators give a surjection π: R^n →P, and the lifting property yields the decomposition.” — The existence of the decomposition P ⊕ Q ≅ R^n for a projective module generated by n elements, with the surjection and splitting as data.
- `Kbook.2013`, Example I.2.1.2 (Idempotents), PDF p. 17 (draft p. 9): “Every finitely generated projective R-module arises from an idempotent element in a matrix ring Mn(R). To see this, note that if P ⊕Q = R^n then the projection-inclusion R^n →P →R^n is an idempotent element e of Mn(R). By inspection, the image e(R^n) of e is P.” — The idempotent matrix of the decomposition and the identification of its image with P.
- `Kbook.2013`, II.2, Hattori–Stallings trace, PDF p. 81 (draft p. 73): “If P is a finitely generated projective module, choosing an isomorphism P ⊕ Q ∼= R^n yields an idempotent e in Mn(R) such that P = e(R^n) and End(P) = eMn(R)e. By Ex. I.2.3, any other choice yields an e1 which is conjugate to e in some larger Mm(R).” — The source uses the same data (P ⊕ Q ≅ R^n, e with P = e(R^n), End(P) = eM_n(R)e) and notes that another choice changes e only by conjugation in a larger matrix ring.

### Conjugate idempotents give isomorphic modules

`Z.1/idempotent-module-conj` · lemma

Let e ∈ Matrix ι ι R be idempotent and g ∈ GL_ι(R) (Matrix.GeneralLinearGroup). Then g⁻¹·e·g is idempotent and v ↦ v·g restricts to an isomorphism of left R-modules P(e) ≃ₗ P(g⁻¹ e g), with inverse w ↦ w·g⁻¹. (Row-vector form of the K-book’s statement that e₁ = g e g⁻¹ gives P ≅ P₁.)

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- Matrices act on row vectors from the right: M ∈ Mat_{m×n}(R) gives the left R-linear map R^m → R^n, v ↦ v·M (Mathlib Matrix.vecMulLinear), so that End_R(R^n) ≅ M_n(R)ᵐᵒᵖ (LinearMap.toMatrixRight'). This is the left-module form of the K-book’s column vectors e(R^n).
- e idempotent, g invertible in Matrix ι ι R.

**Proof.**

1. (g⁻¹ e g)(g⁻¹ e g) = g⁻¹ e (g g⁻¹) e g = g⁻¹ e g.
2. If v·e = v then (v·g)·(g⁻¹ e g) = v·e·g = v·g, so v·g ∈ P(g⁻¹ e g); conversely if w·(g⁻¹ e g) = w then (w·g⁻¹)·e = w·g⁻¹ (multiply on the right by g⁻¹).
3. The two restricted maps are mutually inverse because g g⁻¹ = g⁻¹ g = 1 (Matrix.vecMul_vecMul), and they are left R-linear (Matrix.toLinearEquivRight'OfInv restricted).

**Acceptance.**

- For the swap permutation matrix g of Fin 2, P(diag(1, 0)) ≅ P(diag(0, 1)).
- For g = u·1 with u a central unit, the isomorphism is multiplication by u.

**Depends on.** this roadmap: `Z.1/idempotent-module`; libraries: `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.vecMul_vecMul`, `mathlib:Matrix.toLinearEquivRight'OfInv`.

**Sources.**

- `Kbook.2013`, Exercise I.2.3, PDF p. 23 (draft p. 15): “Let e, e1 be idempotents in Mn(R) defining projective modules P and P1. If e1 = geg−1 for some g ∈GLn(R), show that P ∼= P1.” — The statement; the source leaves it as an exercise, and the proof steps give the isomorphism explicitly. The source’s g e g⁻¹ becomes g⁻¹ e g in the row-vector convention.

### Block sums of idempotents give direct sums

`Z.1/idempotent-module-block` · lemma

For idempotents e ∈ Matrix ι ι R and f ∈ Matrix κ κ R, the block matrix e ⊞ f := Matrix.fromBlocks e 0 0 f ∈ Matrix (ι ⊕ κ) (ι ⊕ κ) R is idempotent and the coordinate splitting R^{ι ⊕ κ} ≃ₗ R^ι × R^κ restricts to an isomorphism P(e ⊞ f) ≃ₗ P(e) × P(f). In particular P(e ⊞ 0_κ) ≃ₗ P(e) (stabilisation invariance), and the same holds for the block sum reindexed to Fin (n + m) along finSumFinEquiv.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- Matrices act on row vectors from the right: M ∈ Mat_{m×n}(R) gives the left R-linear map R^m → R^n, v ↦ v·M (Mathlib Matrix.vecMulLinear), so that End_R(R^n) ≅ M_n(R)ᵐᵒᵖ (LinearMap.toMatrixRight'). This is the left-module form of the K-book’s column vectors e(R^n).
- e, f idempotent; ι, κ finite with decidable equality.

**Proof.**

1. (fromBlocks e 0 0 f)(fromBlocks e 0 0 f) = fromBlocks (e e) 0 0 (f f) by Matrix.fromBlocks_multiply, so e ⊞ f is idempotent.
2. For v = (v₁, v₂): v ᵥ* fromBlocks e 0 0 f = (v₁ ᵥ* e, v₂ ᵥ* f) (Matrix.vecMul_fromBlocks); under LinearEquiv.sumArrowLequivProdArrow the range of ρ_{e⊞f} is therefore P(e) × P(f).
3. P(0) = ⊥ (Z.1/idempotent-module), so P(e ⊞ 0) ≅ P(e) × 0 ≅ P(e); reindexing along finSumFinEquiv is the reindex API item of Z.1/idempotent-module.

**Acceptance.**

- P(1_m ⊞ 1_n) is all of R^{m+n}.
- P(e ⊞ 0_k) ≅ P(e) for every k, including k = 0.

**Depends on.** this roadmap: `Z.1/idempotent-module`; libraries: `mathlib:Matrix.fromBlocks`, `mathlib:Matrix.fromBlocks_multiply`, `mathlib:Matrix.vecMul_fromBlocks`, `mathlib:LinearEquiv.sumArrowLequivProdArrow`, `mathlib:finSumFinEquiv`.

**Sources.**

- `Kbook.2013`, II.2, Hattori–Stallings trace, PDF p. 81 (draft p. 73): “If P ′ is represented by an idempotent matrix f then P ⊕P ′ is represented by the idempotent matrix” — The direct sum of the modules of e and f is represented by the block diagonal idempotent (displayed in the source as the 2 × 2 block matrix with e and f on the diagonal).

### Isomorphic idempotent modules have stably conjugate idempotents

`Z.1/iso-stably-conjugate` · lemma

Let e, e′ ∈ Matrix ι ι R be idempotents and φ : P(e) ≃ₗ P(e′). Let A, B ∈ Matrix ι ι R be the matrices of the R-linear maps v ↦ φ(v·e) and w ↦ φ⁻¹(w·e′) of R^ι (so that eAe′ = A, e′Be = B, AB = e and BA = e′). Then g := fromBlocks A (1 − e) (1 − e′) B ∈ Matrix (ι ⊕ ι) (ι ⊕ ι) R is invertible with inverse h := fromBlocks B (1 − e′) (1 − e) A, and h·(e ⊞ 0)·g = e′ ⊞ 0. Thus isomorphic idempotent modules have idempotents conjugate after one stabilisation of size |ι|; for idempotents of different sizes, first pad both to the larger size (Z.1/idempotent-module-block).

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- Matrices act on row vectors from the right: M ∈ Mat_{m×n}(R) gives the left R-linear map R^m → R^n, v ↦ v·M (Mathlib Matrix.vecMulLinear), so that End_R(R^n) ≅ M_n(R)ᵐᵒᵖ (LinearMap.toMatrixRight'). This is the left-module form of the K-book’s column vectors e(R^n).
- e, e′ idempotent of the same size ι; φ an isomorphism of left R-modules.

**Proof.**

1. The matrices: a(v) := φ(v·e) satisfies a(v·e) = a(v) and a(v) ∈ P(e′), which gives eA = A and Ae′ = A, hence A = eAe′ (toMatrixRight' is injective); likewise B = e′Be. Moreover v·(AB) = φ⁻¹(φ(v·e)·e′) = v·e, so AB = e, and BA = e′.
2. Block multiplication (Matrix.fromBlocks_multiply): gh has blocks AB + (1 − e)² = 1, A(1 − e′) + (1 − e)A = 0, (1 − e′)B + B(1 − e) = 0 and (1 − e′)² + BA = 1, using A(1 − e′) = A − Ae′ = 0 and the analogous identities; symmetrically hg = 1.
3. (e ⊞ 0)·g = fromBlocks (eA) (e(1 − e)) 0 0 = fromBlocks A 0 0 0, and h·fromBlocks A 0 0 0 = fromBlocks (BA) 0 ((1 − e)A) 0 = fromBlocks e′ 0 0 0.
4. The identity is verified entirely by these block multiplications; no further input is used.

**Acceptance.**

- If φ is the identity of P(e) (e′ = e), then A = B = e and g = fromBlocks e (1 − e) (1 − e) e, which is an involution.
- Over a field k, e = diag(1, 0) and e′ = diag(0, 1) with φ the swap: g conjugates diag(1, 0, 0, 0) to diag(0, 1, 0, 0).

**Depends on.** this roadmap: `Z.1/idempotent-module`; libraries: `mathlib:LinearMap.toMatrixRight'`, `mathlib:Matrix.fromBlocks`, `mathlib:Matrix.fromBlocks_multiply`, `mathlib:Matrix.GeneralLinearGroup`.

**Sources.**

- `Kbook.2013`, Exercise I.2.3, PDF p. 23 (draft p. 15): “Conversely, if P ∼= P1 show that for some g ∈GL2n(R):” — The converse half of the exercise: an isomorphism gives a conjugating g in GL_{2n}(R) between diag(e₁, 0) and diag(e, 0). The source gives no proof; the node supplies the matrix g and its inverse, checked by block multiplication, in the row-vector convention (so g⁻¹(−)g replaces g(−)g⁻¹).
- `Kbook.2013`, II.2, Hattori–Stallings trace, PDF p. 81 (draft p. 73): “If P is a finitely generated projective module, choosing an isomorphism P ⊕ Q ∼= R^n yields an idempotent e in Mn(R) such that P = e(R^n) and End(P) = eMn(R)e. By Ex. I.2.3, any other choice yields an e1 which is conjugate to e in some larger Mm(R).” — The source uses the exercise to show that the idempotent of P is well defined up to conjugation in a larger matrix ring.

### The monoid of stabilised idempotent matrices

`Z.1/stable-idempotent-monoid` · definition

For a ring R, StableIdempotent R (Idem(R)) is the quotient of the pairs (n, e), n ∈ ℕ and e ∈ M_n(R) idempotent, by (n, e) ∼ (m, f) iff there are N ≥ n, m and g ∈ GL_N(R) with g⁻¹·pad_N(e)·g = pad_N(f); here pad_N(e) ∈ M_N(R) has e in the top-left n × n block and zeros elsewhere, the stabilisation e ↦ diag(e, 0). It is an additive commutative monoid with [e] + [f] := [e ⊞ f] (block sum reindexed along finSumFinEquiv) and 0 = [the 0 × 0 matrix]. Every idempotent e ∈ Matrix ι ι R over a finite type ι has a class mk e := [reindex (Fintype.equivFin ι) e], independent of the chosen equivalence. A ring homomorphism f : R → S induces map f : Idem(R) →+ Idem(S), [e] ↦ [e.map f].

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Matrix sizes n, m, N are natural numbers; the zero-size matrix is allowed.

**Proof.**

1. ∼ is an equivalence relation: reflexive with g = 1; symmetric with g⁻¹; transitive by padding to N″ = max(N, N′): pad_{N″} factors through pad_N, and g ⊞ 1 ∈ GL_{N″}(R) conjugates pad_{N″}(e) to pad_{N″}(f) (block matrices of invertible matrices are invertible, Matrix.fromBlocks_multiply).
2. Addition is well defined: pad(e ⊞ f) and pad(e) ⊞ pad(f) are conjugate by the permutation matrix (Equiv.Perm.permMatrix) of the shuffle of index blocks, and (g ⊞ h)⁻¹(pad e ⊞ pad f)(g ⊞ h) = (g⁻¹ pad(e) g) ⊞ (h⁻¹ pad(f) h).
3. Monoid laws: e ⊞ f and f ⊞ e are conjugate by the permutation matrix of the block swap; associativity and the unit laws hold up to reindexing equivalences, which are permutation conjugations.
4. mk is independent of the equivalence ι ≃ Fin |ι|: two choices differ by a permutation σ, and reindexing along σ is conjugation by σ.permMatrix.
5. map f is well defined and additive because entrywise application commutes with products, block sums and padding (Matrix.map_mul, RingHom.mapMatrix) and sends GL_N(R) to GL_N(S) (Matrix.GeneralLinearGroup.map); map_id and map_comp hold on representatives.

**API.**

- `TauCeti.StableIdempotent` (structure): The quotient type with its AddCommMonoid instance.
- `TauCeti.StableIdempotent.mk` (constructor): mk e for an idempotent e : Matrix ι ι R, ι a finite type with decidable equality.
- `TauCeti.StableIdempotent.mk_reindex` (simp): mk (reindex σ σ e) = mk e for σ : ι ≃ κ.
- `TauCeti.StableIdempotent.mk_eq_mk_iff` (characterisation): For e ∈ M_n(R), f ∈ M_m(R): mk e = mk f ↔ ∃ N ≥ max n m, ∃ g : GL (Fin N) R, g⁻¹ * pad N e * g = pad N f.
- `TauCeti.StableIdempotent.mk_conj` (simp): mk (g⁻¹ * e * g) = mk e for g ∈ GL_ι(R).
- `TauCeti.StableIdempotent.mk_fromBlocks_zero` (simp): mk (fromBlocks e 0 0 0) = mk e.
- `TauCeti.StableIdempotent.mk_fromBlocks` (simp): mk (fromBlocks e 0 0 f) = mk e + mk f.
- `TauCeti.StableIdempotent.mk_zero` (simp): mk (0 : Matrix ι ι R) = 0.
- `TauCeti.StableIdempotent.induction_on` (other): Every element is mk e for some n and idempotent e ∈ M_n(R).
- `TauCeti.StableIdempotent.map` (functoriality): For f : R →+* S, map f : StableIdempotent R →+ StableIdempotent S with map f (mk e) = mk (e.map f), map_id and map_comp.

**Unit tests.**

- `TauCeti.StableIdempotent.swap_test` (computation): mk (diag(1, 0) : Matrix (Fin 2) (Fin 2) R) = mk (diag(0, 1)), via the swap permutation matrix.
- `TauCeti.StableIdempotent.zero_test` (degenerate): mk (0 : Matrix (Fin n) (Fin n) R) = 0 for every n; over the zero ring every element is 0.
- `TauCeti.StableIdempotent.field_test` (computation): Over a field k, mk e = mk f ↔ rank e = rank f, so StableIdempotent k ≃+ ℕ by the matrix rank.
- `TauCeti.StableIdempotent.stabilise_test` (non-example): mk (1 : Matrix (Fin 1) (Fin 1) k) = mk diag(1, 0) although the matrices have different sizes, so no relation without stabilisation can be the right one.
- `TauCeti.StableIdempotent.trace_test` (characterisation): For commutative R, mk e ↦ trace e ∈ R is well defined (conjugation and padding preserve the trace); over ℤ × ℤ it separates mk (1, 0), mk (0, 1), mk 1 and 0.

**Acceptance.**

- Over a field the class of e is determined by its rank.
- mk (diag(e, 0)) = mk e and mk 1_n = n • mk 1_1.

**Used by.**

- Weibel, II.2 (Hattori–Stallings paragraph, PDF p. 81): invariants of idempotent matrices that are invariant under conjugation and stabilisation are invariants of projectives
- KTheoryLowDegrees:Z.1/idempotent-classification: identified with the monoid of isomorphism classes of finitely generated projectives
- KTheoryLowDegrees:Z.1/ring-k0-idempotent-completion: K₀(R) is its group completion
- KTheoryLowDegrees:Z.1/ring-k0-map: scalar extension acts on classes of idempotents entrywise
- ClassicalArithmeticCompletion:CA.7: classes of projective modules over an order can be computed from idempotent matrices

**Depends on.** libraries: `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.fromBlocks`, `mathlib:Matrix.fromBlocks_multiply`, `mathlib:Matrix.reindex`, `mathlib:Equiv.Perm.permMatrix`, `mathlib:finSumFinEquiv`, `mathlib:Matrix.map_mul`, `mathlib:RingHom.mapMatrix`, `mathlib:Matrix.GeneralLinearGroup.map`.

**Sources.**

- `Kbook.2013`, II.2, Hattori–Stallings trace, PDF p. 81 (draft p. 73): “If P is a finitely generated projective module, choosing an isomorphism P ⊕ Q ∼= R^n yields an idempotent e in Mn(R) such that P = e(R^n) and End(P) = eMn(R)e. By Ex. I.2.3, any other choice yields an e1 which is conjugate to e in some larger Mm(R).” — The relation: two idempotents presenting the same projective are conjugate in some larger matrix ring after the stabilisation e ↦ diag(e, 0).
- `Kbook.2013`, II.2, Hattori–Stallings trace, PDF p. 81 (draft p. 73): “If P ′ is represented by an idempotent matrix f then P ⊕P ′ is represented by the idempotent matrix” — The addition: block sums of idempotents represent direct sums.
- `Kbook.2013`, Exercise I.2.3, PDF p. 23 (draft p. 15): “Conversely, if P ∼= P1 show that for some g ∈GL2n(R):” — The stabilisation to GL_{2n}(R) that makes the relation an equivalence relation compatible with isomorphism.

### Classification of finitely generated projectives by idempotent matrices

`Z.1/idempotent-classification` · theorem · planet “Classification by idempotent matrices”

For every ring R the map mk e ↦ objectCode (ModuleCat.of R P(e)), from stabilised idempotent classes to isomorphism classes of objects of (finiteProjectiveModules R).FullSubcategory, is a well-defined isomorphism of additive monoids StableIdempotent R ≃+ ObjectCode (finiteProjectiveModules R).FullSubcategory. Equivalently: (i) every finitely generated projective left R-module is isomorphic to P(e) for some idempotent e ∈ M_n(R); (ii) for idempotents e, f of any sizes, P(e) ≅ P(f) iff mk e = mk f; (iii) P(e ⊞ f) ≅ P(e) × P(f) and P(0) = 0.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. Well defined and (ii, ⇐): if g⁻¹ pad(e) g = pad(f) then P(e) ≅ P(pad e) ≅ P(g⁻¹ pad(e) g) = P(pad f) ≅ P(f) by Z.1/idempotent-module-block (padding is ⊞ 0) and Z.1/idempotent-module-conj.
2. Additivity (iii): Z.1/idempotent-module-block, the identification of the binary biproduct in ModuleCat with the product (ModuleCat.biprodIsoProd) and objectCode_biprod; the empty matrix gives the zero module.
3. Surjectivity (i): a free-summand datum (Z.1/free-summand-data) gives P ≅ P(e).
4. Injectivity (ii, ⇒): pad e and f to a common size N (Z.1/idempotent-module-block), then Z.1/iso-stably-conjugate gives g ∈ GL_{2N}(R) with g⁻¹(pad e ⊞ 0)g = pad f ⊞ 0, i.e. mk e = mk f.
5. objectCode_eq_objectCode_iff translates equality of codes into existence of an isomorphism in the full subcategory, i.e. a linear equivalence.

**Acceptance.**

- Over a field k the composite with dimension sends mk e to the rank of e.
- Over ℤ × ℤ, mk (1, 0), mk (0, 1) and mk 1 are pairwise distinct and mk (1, 0) + mk (0, 1) = mk 1.

**Depends on.** this roadmap: `Z.1/stable-idempotent-monoid`, `Z.1/idempotent-module-finite-projective`, `Z.1/idempotent-module-conj`, `Z.1/idempotent-module-block`, `Z.1/iso-stably-conjugate`, `Z.1/free-summand-data`; libraries: `tauceti:TauCeti.ObjectCode`, `tauceti:TauCeti.objectCode_eq_objectCode_iff`, `tauceti:TauCeti.objectCode_biprod`, `tauceti:TauCeti.finiteProjectiveModules`, `mathlib:ModuleCat.biprodIsoProd`.

**Sources.**

- `Kbook.2013`, Example I.2.1.2 (Idempotents), PDF p. 17 (draft p. 9): “Every finitely generated projective R-module arises from an idempotent element in a matrix ring Mn(R). To see this, note that if P ⊕Q = R^n then the projection-inclusion R^n →P →R^n is an idempotent element e of Mn(R). By inspection, the image e(R^n) of e is P.” — Surjectivity: every finitely generated projective is e(R^n).
- `Kbook.2013`, Exercise I.2.3, PDF p. 23 (draft p. 15): “Let e, e1 be idempotents in Mn(R) defining projective modules P and P1. If e1 = geg−1 for some g ∈GLn(R), show that P ∼= P1.” — Conjugate idempotents give isomorphic modules.
- `Kbook.2013`, Exercise I.2.3, PDF p. 23 (draft p. 15): “Conversely, if P ∼= P1 show that for some g ∈GL2n(R):” — Isomorphic modules give idempotents conjugate after stabilisation.
- `Kbook.2013`, II.2, Hattori–Stallings trace, PDF p. 81 (draft p. 73): “If P ′ is represented by an idempotent matrix f then P ⊕P ′ is represented by the idempotent matrix” — Block sums correspond to direct sums.

### Finitely generated projectives are the idempotent completion of finite free modules

`Z.1/projective-karoubi` · theorem

Let Free(R) be the full subcategory of ModuleCat R on the modules Fin n → R (n ∈ ℕ). The inclusion Free(R) ⥤ (finiteProjectiveModules R).FullSubcategory extends to an equivalence of categories Karoubi (Free(R)) ≌ (finiteProjectiveModules R).FullSubcategory, sending an object (R^n, p) with p an idempotent endomorphism to the image of p, i.e. to P(e) for e = toMatrixRight' p, and a Karoubi morphism f = p′ f p to its restriction. So the idempotent-matrix description presents the actual category of finitely generated projectives, morphisms included.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. (finiteProjectiveModules R).FullSubcategory is idempotent complete: an idempotent endomorphism p of P splits through its image, which is a retract of P and hence finitely generated projective (Module.Projective.of_split, Module.Finite.of_surjective); this is the criterion isIdempotentComplete_iff_idempotents_have_kernels in the preadditive setting.
2. By the universal property of the idempotent completion (functorExtension₂, with toKaroubiEquivalence for the idempotent-complete target) the inclusion extends to a functor Karoubi(Free(R)) ⥤ (finiteProjectiveModules R).FullSubcategory; on objects it is (R^n, p) ↦ range p = P(e).
3. Fully faithful: morphisms (R^n, p) → (R^m, p′) in the Karoubi envelope are the maps f with f = p′ f p, which are exactly the maps between the images extended by zero on the complements (Z.1/idempotent-module-finite-projective).
4. Essentially surjective: every finitely generated projective is P(e) for some idempotent (Z.1/free-summand-data). An essentially surjective fully faithful functor is an equivalence.

**Acceptance.**

- The object (R^1, id) goes to R and (R^n, 0) to the zero module.
- Over a field k the equivalence identifies Karoubi(Free(k)) with finite-dimensional k-vector spaces.

**Depends on.** this roadmap: `Z.1/free-summand-data`, `Z.1/idempotent-module-finite-projective`; libraries: `mathlib:CategoryTheory.Idempotents.Karoubi`, `mathlib:CategoryTheory.Idempotents.functorExtension₂`, `mathlib:CategoryTheory.Idempotents.toKaroubiEquivalence`, `mathlib:CategoryTheory.Idempotents.isIdempotentComplete_iff_idempotents_have_kernels`, `mathlib:CategoryTheory.IsIdempotentComplete`, `mathlib:Module.Projective.of_split`, `mathlib:Module.Finite.of_surjective`, `tauceti:TauCeti.finiteProjectiveModules`.

**Sources.**

- `Kbook.2013`, Example II.7.3.1, PDF p. 140 (draft p. 132): “Consider the subcategory Free(R) of M(R) consisting of finitely generated free R-modules. The idempotent completion of Free(R) is the category P(R) of finitely generated projective modules.” — The statement of the node.
- `Kbook.2013`, II.7.3 (Idempotent completion), PDF p. 140 (draft p. 132): “Given C, we can form a new category bC whose objects are pairs (C, e) with e an idempotent endomorphism of an object C of C; a morphism from (C, e) to (C′, e′) is a map f : C →C′ in C such that f = e′fe.” — The idempotent completion used, with morphisms f = e′fe.

### K₀ of a ring

`Z.1/ring-k0` · definition · planet “K₀ of a ring”

For a ring R : Type u, RingK0 R is the reducible abbreviation SplitK0 ((finiteProjectiveModules R).FullSubcategory): the split Grothendieck group of the essentially small additive category of finitely generated projective left R-modules in ModuleCat.{u} R. For M : Type u with Module.Finite R M and Module.Projective R M, its class is RingK0.of R M := SplitK0.of ⟨ModuleCat.of R M, _⟩, written [M]. No new presentation is introduced: the relations are those of SplitK0, and by Z.1/ring-k0-exact the result is also the exact K₀ of the finitely generated projectives.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. The full subcategory has zero morphisms and binary biproducts (finiteProjectiveModules R is closed under binary products, instance in CartanMap.lean) and is essentially small (ObjectProperty.EssentiallySmall.{u} instance in CartanMap.lean), so SplitK0 applies.
2. Define of; of_congr from SplitK0.of_congr (a linear equivalence is an isomorphism in ModuleCat); of_prod from SplitK0.of_biprod with ModuleCat.biprodIsoProd; of_zero from SplitK0.of_eq_zero_of_isZero.
3. The universal property RingK0.lift restates SplitK0.liftEquiv for functions on modules: a function c on finitely generated projective modules with c M = c N whenever M ≃ₗ N and c (M × N) = c M + c N induces a unique additive map with lift [M] = c M (SplitK0.lift_of, SplitK0.hom_ext).
4. The abbreviation is reducible so that the ring structure of SplitK0 on a monoidal category (Z.3/finite-projective-monoidal) applies to RingK0 A for commutative A without a transport.

**API.**

- `TauCeti.RingK0` (structure): RingK0 R := SplitK0 (finiteProjectiveModules R).FullSubcategory (reducible), an AddCommGroup.
- `TauCeti.RingK0.of` (constructor): of R M = [M] for M : Type u with Module.Finite R M and Module.Projective R M.
- `TauCeti.RingK0.of_congr` (simp): M ≃ₗ[R] N → [M] = [N].
- `TauCeti.RingK0.of_prod` (simp): [M × N] = [M] + [N].
- `TauCeti.RingK0.of_pi` (simp): [Π i, M i] = Σ i, [M i] for a finite family.
- `TauCeti.RingK0.of_subsingleton` (simp): [M] = 0 if M is subsingleton.
- `TauCeti.RingK0.of_free` (simp): [Fin n → R] = n • [R].
- `TauCeti.RingK0.ofIdempotent` (constructor): The class [P(e)] of the module of an idempotent matrix.
- `TauCeti.RingK0.lift` (universal-property): lift c : RingK0 R →+ G for a linear-equivalence-invariant, product-additive function c on finitely generated projectives, with lift_of and lift_unique.
- `TauCeti.RingK0.hom_ext` (extensionality): Two additive maps out of RingK0 R agreeing on every [M] are equal.
- `TauCeti.RingK0.grothendieckAddGroupEquiv` (compatibility): RingK0 R ≃+ Algebra.GrothendieckAddGroup (ObjectCode (finiteProjectiveModules R).FullSubcategory), the existing SplitK0.grothendieckAddGroupEquiv.

**Unit tests.**

- `TauCeti.RingK0.zero_ring_test` (degenerate): If R is the zero ring then RingK0 R is subsingleton.
- `TauCeti.RingK0.of_prod_test` (computation): Over R = ℤ × ℤ: [ℤ × 0] + [0 × ℤ] = [R] (as R-modules).
- `TauCeti.RingK0.free_test` (computation): For a field k: [k²] = 2 • [k].
- `TauCeti.RingK0.grothendieck_test` (compatibility): RingK0.grothendieckAddGroupEquiv sends [M] to the class of objectCode M in Mathlib’s group completion.
- `TauCeti.RingK0.swindle_test` (non-example): [ℤ] ≠ 0 in RingK0 ℤ; a definition admitting all projective modules would force [ℤ] = 0 by the Eilenberg swindle ℤ ⊕ ℤ^(ℕ) ≅ ℤ^(ℕ).

**Acceptance.**

- [R²] = 2 • [R] and [0] = 0.
- RingK0 of the zero ring is trivial.

**Used by.**

- Weibel, II.2 (PDF p. 76): K₀(R) as the group completion of P(R), with [P] = [Q] iff P and Q are stably isomorphic
- KTheoryLowDegrees:Z.3/finite-projective-monoidal and the rest of the companion packet KTheoryLowDegrees--Z.3: “the existing ring K₀(R)” is this carrier; its commutative ring structure is instantiated there
- ClassicalArithmeticCompletion:CA.7/locally-free-class-group: the locally free class group of an order Λ is a subgroup of RingK0 Λ generated by [M] − n[Λ]
- KTheoryLowDegrees:Z.2/rank-hom: the rank is an additive map out of RingK0 A
- KTheoryLowDegrees:U.5 (relative K₁ and the relative sequence): K₀(A) → K₀(A/I) closes the relative exact sequence
- KTheoryLowDegrees:Z.4: the rank–determinant classification K₀(A) ≃ ℤ ⊕ Pic(A) for Dedekind domains is stated on this carrier

**Depends on.** libraries: `tauceti:TauCeti.SplitK0`, `tauceti:TauCeti.SplitK0.of`, `tauceti:TauCeti.SplitK0.of_congr`, `tauceti:TauCeti.SplitK0.of_biprod`, `tauceti:TauCeti.SplitK0.of_eq_zero_of_isZero`, `tauceti:TauCeti.SplitK0.lift`, `tauceti:TauCeti.SplitK0.lift_of`, `tauceti:TauCeti.SplitK0.liftEquiv`, `tauceti:TauCeti.SplitK0.hom_ext`, `tauceti:TauCeti.finiteProjectiveModules`, `tauceti:TauCeti.finiteProjectiveModules_iff`, `mathlib:ModuleCat.biprodIsoProd`.

**Sources.**

- `Kbook.2013`, II.2, opening paragraph, PDF p. 76 (draft p. 68): “The set P(R) of isomorphism classes of finitely generated projective R-modules, together with direct sum ⊕and identity 0, forms an abelian monoid. The Grothendieck group of R, K0(R), is the group completion P^−1P of P(R).” — The definition: the group completion of the monoid of isomorphism classes of finitely generated projectives under ⊕. SplitK0 is this group completion (SplitK0.grothendieckAddGroupEquiv), so the node realises the source definition on the existing carrier.
- `Kbook.2013`, II.2, the Eilenberg swindle, PDF p. 76 (draft p. 68): “If we had included the module R^∞ (defined in Ex. I.1.7), then the formula P ⊕R^∞ ∼= R^∞ would imply that [P] = 0 for every finitely generated projective R-module, and we would have K0(R) = 0.” — Why the definition is restricted to finitely generated projectives.
- `Kbook.2013`, I.2, paragraph on the category P(R), PDF p. 16 (draft p. 8): “We will focus most of our attention on the category P(R) of finitely generated projective R-modules; the morphisms are the R-module maps. Since the direct sum of projectives is projective, P(R) is an additive category.” — The category whose split K₀ is taken.

### Split and exact K₀ of the finitely generated projectives agree

`Z.1/ring-k0-exact` · comparison

Every conflation of finiteProjectiveModulesExactStructure R splits, so ExactK0.fromSplitEquiv gives RingK0.toExactK0 : RingK0 R ≃+ ExactK0 (finiteProjectiveModulesExactStructure R), [M] ↦ ExactK0.of M. Consequently, for every short exact sequence 0 → M′ → M → M″ → 0 of left R-modules with M′, M, M″ finitely generated projective, [M] = [M′] + [M″] in RingK0 R: the direct-sum relations already impose the exact-sequence relations.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. finiteProjectiveModulesExactStructure_eq_split identifies the exact structure with the split one, and ExactStructure.split_conflation says its conflations are the short complexes admitting a splitting; this is the hypothesis of ExactK0.fromSplitEquiv.
2. fromSplitEquiv_apply with fromSplit_of gives the value on classes, fromSplitEquiv_symm_of the inverse.
3. A short exact sequence of modules with the three terms in the subcategory is a conflation (finiteProjectiveModulesExactStructure_conflation_iff); ExactK0.of_conflation gives the relation, transported back along the equivalence.
4. Consequently the two universal properties agree: conflation-additive invariants of finitely generated projectives (ExactK0.liftEquiv) are exactly the biproduct-additive ones (SplitK0.liftEquiv, i.e. RingK0.lift).

**Acceptance.**

- For 0 → R → R² → R → 0 (first inclusion, second projection) the relation is 2[R] = [R] + [R].
- The comparison sends [P(e)] to ExactK0.of P(e).

**Depends on.** this roadmap: `Z.1/ring-k0`; libraries: `tauceti:TauCeti.ExactK0`, `tauceti:TauCeti.ExactK0.fromSplitEquiv`, `tauceti:TauCeti.ExactK0.fromSplitEquiv_apply`, `tauceti:TauCeti.ExactK0.fromSplitEquiv_symm_of`, `tauceti:TauCeti.ExactK0.of_conflation`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`, `tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff`, `tauceti:TauCeti.ExactStructure.split_conflation`, `tauceti:TauCeti.ExactK0.liftEquiv`, `tauceti:TauCeti.SplitK0.liftEquiv`.

**Sources.**

- `Kbook.2013`, I.2, proof of the equivalence in Definition 2.1, PDF p. 16 (draft p. 8): “Choose a surjection π: F →P with F a free module; the lifting property splits π, yielding F ∼= P ⊕ker(π).” — A surjection onto a projective module splits; this is why every exact sequence of projectives with projective quotient splits.

### Object-class induction and cofinality of free modules

`Z.1/ring-k0-class-induction` · lemma

(a) A predicate on RingK0 R that holds at 0 and at every class [M] of a finitely generated projective M : Type u, and is closed under addition and negation, holds everywhere. (b) Every x ∈ RingK0 R is [P] − [Q] with P, Q finitely generated projective. (c) Every x is [P] − n•[R] = [P] − [R^n] for some finitely generated projective P and n ∈ ℕ.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. (a) SplitK0.induction_on, replacing each object of the full subcategory by ModuleCat.of R of its carrier (of_congr).
2. (b) SplitK0.exists_eq_sub (the full subcategory has a zero object).
3. (c) From x = [P] − [Q], a free-summand datum for Q (Z.1/free-summand-data) gives Q × Q′ ≃ R^n with Q′ finitely generated projective; then x = [P × Q′] − [R^n] by of_prod and of_free. This is the cofinality of free modules.

**Acceptance.**

- −[R] = [0] − [R¹].
- Over ℤ × ℤ, [ℤ × 0] − [0 × ℤ] = [(ℤ × 0) × (ℤ × 0)] − [R], since (0 × ℤ) × (ℤ × 0) ≅ R.

**Depends on.** this roadmap: `Z.1/ring-k0`, `Z.1/free-summand-data`; libraries: `tauceti:TauCeti.SplitK0.induction_on`, `tauceti:TauCeti.SplitK0.exists_eq_sub`.

**Sources.**

- `Kbook.2013`, II.2, PDF p. 76 (draft p. 68): “By Corollary 1.3 every element of K0(R) can be written as [P] −[R^n] for some P and n. Moreover, [P] = [Q] in K0(R) if and only if P, Q are stably isomorphic: P ⊕R^m ∼= Q⊕R^m for some m. In particular, [P] = [R^n] if and only if P is stably free.” — The source states (c) by cofinality of free modules (Corollary II.1.3).
- `Kbook.2013`, Corollary II.1.3, PDF p. 73 (draft p. 65): “(b) Every element of M^−1M is of the form [m] −[ℓ] for some m ∈M, ℓ∈L; (c) If [m] = [m′] in M^−1M then m + ℓ= m′ + ℓfor some ℓ∈L.” — Corollary II.1.3(b): with a cofinal submonoid, every element is [m] − [ℓ].

### K₀ as the group completion of stabilised idempotents

`Z.1/ring-k0-idempotent-completion` · theorem

RingK0 R ≃+ Algebra.GrothendieckAddGroup (StableIdempotent R): the group completion of the monoid isomorphism of Z.1/idempotent-classification, composed with (SplitK0.grothendieckAddGroupEquiv)⁻¹. It sends [P(e)] to the class of mk e. Under it, RingK0.map f (Z.1/ring-k0-map) corresponds to the group completion of StableIdempotent.map f.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. Group completion is functorial for additive monoid isomorphisms: lifting the monoid isomorphism and its inverse through the universal property of the group completion (Algebra.GrothendieckGroup.lift, additive form) gives inverse additive maps.
2. Compose with SplitK0.grothendieckAddGroupEquiv (split K₀ is the group completion of ObjectCode) and evaluate on classes with SplitK0.grothendieckAddGroupEquiv_of_objectCode.
3. Compatibility with ring maps is checked on the generators [P(e)], using Z.1/extend-scalars-finite-projective (ExtendScalars f P(e) ≅ P(e.map f)).

**Acceptance.**

- For a field k the composite with dimension identifies K₀(k) with ℤ, the group completion of ℕ.
- The class of mk 1_n corresponds to n[R].

**Depends on.** this roadmap: `Z.1/idempotent-classification`, `Z.1/ring-k0`, `Z.1/ring-k0-map`, `Z.1/extend-scalars-finite-projective`; libraries: `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv`, `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv_of_objectCode`, `mathlib:Algebra.GrothendieckGroup.lift`.

**Sources.**

- `Kbook.2013`, II.2, opening paragraph, PDF p. 76 (draft p. 68): “The set P(R) of isomorphism classes of finitely generated projective R-modules, together with direct sum ⊕and identity 0, forms an abelian monoid. The Grothendieck group of R, K0(R), is the group completion P^−1P of P(R).” — K₀(R) is the group completion of the monoid of isomorphism classes, which the classification identifies with stabilised idempotents.
- `Kbook.2013`, Example I.2.1.2 (Idempotents), PDF p. 17 (draft p. 9): “Every finitely generated projective R-module arises from an idempotent element in a matrix ring Mn(R). To see this, note that if P ⊕Q = R^n then the projection-inclusion R^n →P →R^n is an idempotent element e of Mn(R). By inspection, the image e(R^n) of e is P.” — Every projective comes from an idempotent matrix.

### Equality of classes is stable isomorphism

`Z.1/stable-isomorphism-criterion` · theorem · planet “Stable isomorphism criterion”

For finitely generated projective left R-modules P, Q : Type u, [P] = [Q] in RingK0 R iff there is n ∈ ℕ with P × R^n ≃ₗ[R] Q × R^n.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. (⇐) of_prod and of_free give [P] + n[R] = [Q] + n[R]; cancel in the group.
2. (⇒) Apply (SplitK0.grothendieckAddGroupEquiv)⁻¹ (grothendieckAddGroupEquiv_symm_of): the classes of objectCode P and objectCode Q agree in the group completion of the monoid ObjectCode, so by the localisation criterion (Submonoid.LocalizationMap.eq_iff_exists, additive form; Proposition II.1.1(b)) there is c with objectCode P + c = objectCode Q + c.
3. Write c = objectCode C (objectCode_surjective) and choose a free-summand datum C × C′ ≃ R^n (Z.1/free-summand-data). Adding objectCode C′ gives objectCode (P × R^n) = objectCode (Q × R^n) (objectCode_biprod, ModuleCat.biprodIsoProd), so the two objects are isomorphic (objectCode_eq_objectCode_iff), i.e. P × R^n ≃ₗ Q × R^n.

**Acceptance.**

- [P] = [P] with n = 0.
- The criterion needs the free summand: the K-book’s rank-two stably free module P over ℝ[x, y, z]/(x² + y² + z² − 1) (Example I.1.2.2) has [P] = [R²] but P ≇ R² (the proof of non-freeness there is topological).
- CA.7 uses the case Q = Λ^n: [M] − n[Λ] = 0 iff M × Λ^k ≃ Λ^{n+k} for some k (Z.1/stably-free-class).

**Depends on.** this roadmap: `Z.1/ring-k0`, `Z.1/free-summand-data`; libraries: `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv`, `tauceti:TauCeti.SplitK0.grothendieckAddGroupEquiv_symm_of`, `mathlib:Submonoid.LocalizationMap.eq_iff_exists`, `tauceti:TauCeti.objectCode_surjective`, `tauceti:TauCeti.objectCode_biprod`, `tauceti:TauCeti.objectCode_eq_objectCode_iff`, `mathlib:ModuleCat.biprodIsoProd`.

**Sources.**

- `Kbook.2013`, II.2, PDF p. 76 (draft p. 68): “By Corollary 1.3 every element of K0(R) can be written as [P] −[R^n] for some P and n. Moreover, [P] = [Q] in K0(R) if and only if P, Q are stably isomorphic: P ⊕R^m ∼= Q⊕R^m for some m. In particular, [P] = [R^n] if and only if P is stably free.” — The statement of the node.
- `Kbook.2013`, Proposition II.1.1(b), PDF p. 72 (draft p. 64): “(b) If m, n ∈M then [m] = [n] in M^−1M if and only if m + p = n + p for some p ∈M;” — The group-completion criterion used in the proof.
- `Kbook.2013`, I.2, before Theorem 2.3, PDF p. 20 (draft p. 12): “two R-modules M, M ′ are stably isomorphic if M ⊕R^m ∼= M ′ ⊕R^m for some m ≥0.” — The K-book’s definition of stably isomorphic modules, which the node uses.

### Stably free modules and multiples of the free class

`Z.1/stably-free-class` · lemma

For a finitely generated projective P and n ∈ ℕ: [P] = n•[R] iff there is k ∈ ℕ with P × R^k ≃ₗ R^{n+k}. Moreover [P] lies in the subgroup ℤ•[R] iff Mathlib’s Module.IsStablyFree R P holds (P × N free for some finite free N).

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. First statement: Z.1/stable-isomorphism-criterion with Q = R^n, since R^n × R^k ≃ R^{n+k}.
2. If Module.IsStablyFree R P: Module.IsStablyFree.exist_free_prod gives N finite free with P × N free. P × N is finite and free, so it has a finite basis (Module.finBasis) and P × N ≃ R^m; also N ≃ R^k. Hence [P] = (m − k)•[R].
3. Conversely, if [P] = a•[R] with a ∈ ℤ, choose k ≥ 0 with a + k ≥ 0; then [P × R^k] = (a + k)[R] and the first statement gives P × R^{k+j} ≃ R^{a+k+j}; Module.IsStablyFree.of_free_prod applies with N = R^{k+j}.

**Acceptance.**

- For P = R^m: [P] = m[R] with k = 0.
- CA.7: for a locally free Λ-lattice M of rank n, [M] − n[Λ] = 0 iff M × Λ^k ≃ Λ^{n+k} for some k.

**Depends on.** this roadmap: `Z.1/stable-isomorphism-criterion`; libraries: `mathlib:Module.IsStablyFree`, `mathlib:Module.IsStablyFree.exist_free_prod`, `mathlib:Module.IsStablyFree.of_free_prod`, `mathlib:Module.finBasis`.

**Sources.**

- `Kbook.2013`, II.2, PDF p. 76 (draft p. 68): “By Corollary 1.3 every element of K0(R) can be written as [P] −[R^n] for some P and n. Moreover, [P] = [Q] in K0(R) if and only if P, Q are stably isomorphic: P ⊕R^m ∼= Q⊕R^m for some m. In particular, [P] = [R^n] if and only if P is stably free.” — The special case [P] = [R^n] iff P is stably free.
- `Kbook.2013`, Definition I.1.2, PDF p. 10 (draft p. 2): “An R-module P is called stably free (of rank n−m) if P ⊕R^m ∼= R^n for some m and n.” — The K-book’s definition of stably free, P ⊕ R^m ≅ R^n.

### The free class map and the invariant basis number

`Z.1/free-class-ibn` · lemma

Let freeClass : ℤ →+ RingK0 R, m ↦ m•[R]. (1) freeClass is injective iff InvariantBasisNumber R. (2) If InvariantBasisNumber R, then freeClass is bijective iff every finitely generated projective left R-module is stably free. This corrects Lemma II.2.1(2) of the K-book, which writes “K₀(R) ≅ ℤ” for “freeClass is an isomorphism” (sourceIssues): an abstract isomorphism does not suffice.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).
- InvariantBasisNumber is Mathlib’s left version (R^n ≃ₗ R^m ⇒ n = m); the K-book’s IBP is the right version.

**Proof.**

1. (1, ⇐) If a[R] = b[R], the criterion gives R^{a+k} ≃ₗ R^{b+k}, so a = b by InvariantBasisNumber.eq_of_fin_equiv.
2. (1, ⇒) If R^a ≃ₗ R^b then (a − b)[R] = 0 (of_congr, of_free), so injectivity forces a = b.
3. (2) Surjectivity of freeClass means every [P] lies in ℤ[R], which is Module.IsStablyFree R P by Z.1/stably-free-class; with (1) this is bijectivity.

**Acceptance.**

- For the zero ring freeClass is not injective and InvariantBasisNumber fails.
- For R = M₂(k), k a field: InvariantBasisNumber holds and freeClass is injective with image of index 2, although K₀(M₂(k)) ≅ ℤ abstractly (Z.2/matrix-division-ring-k0); so the uncorrected statement fails.

**Depends on.** this roadmap: `Z.1/stable-isomorphism-criterion`, `Z.1/stably-free-class`; libraries: `mathlib:InvariantBasisNumber`.

**Sources.**

- `Kbook.2013`, Lemma II.2.1, PDF p. 76 (draft p. 68): “Lemma 2.1. The monoid map N →P(R) sending n to R^n induces a group homomorphism Z →K0(R). We have: (1) Z →K0(R) is injective if and only if R satisfies the Invariant Basis Property (IBP);” — Part (1), stated with the right-module IBP.
- `Kbook.2013`, Lemma II.2.1(2), PDF p. 76 (draft p. 68): “(2) Suppose that R satisfies the IBP (e.g., R is commutative). Then K0(R) ∼= Z ⇐⇒every finitely generated projective R-module is stably free.” — Part (2) as printed, corrected in the node (sourceIssues).
- `Kbook.2013`, Definition I.1.1 (IBP), PDF p. 10 (draft p. 2): “We say that a ring R satisfies the (right) invariant basis property (or IBP) if R^m and R^n are not isomorphic for m̸ = n.” — The K-book’s invariant basis property.

### Extension of scalars along a homomorphism of arbitrary rings

`Z.1/extend-scalars` · construction

Let f : R →+* S be a homomorphism of rings (not necessarily commutative) in one universe u. For a left R-module M, ExtendScalars f M := (S ⊗_ℤ M) ⧸ N_f, where S ⊗_ℤ M is a left S-module through the left factor and N_f is the S-submodule spanned by the elements (s·f(r)) ⊗ m − s ⊗ (r•m); write s ⊗ m for the class of s ⊗ m. It is the left adjoint of restriction of scalars: for every left S-module N, R-linear maps M → f_*N correspond to S-linear maps ExtendScalars f M → N by φ ↦ (s ⊗ m ↦ s•φ(m)). This gives a functor ExtendScalars.functor f : ModuleCat.{u} R ⥤ ModuleCat.{u} S, an adjunction with ModuleCat.restrictScalars f, natural isomorphisms for the identity and for composites, ExtendScalars f R ≅ S, and, when R and S are commutative, a natural isomorphism with Mathlib’s ModuleCat.extendScalars f. In the K-book’s right-module notation this is P ↦ P ⊗_R S.

**Hypotheses.**

- R, S are associative unital rings in the same universe, f : R →+* S; no commutativity, flatness or finiteness hypothesis.
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.

**Proof.**

1. The left S-module structure on S ⊗_ℤ M is TensorProduct.leftModule (S acting on its own factor). N_f is an S-submodule by definition (Submodule.span over S); define the quotient and tmul s m := Submodule.mkQ N_f (s ⊗ m). The relations give (s·f(r)) ⊗ m = s ⊗ (r•m), and s ⊗ m is additive in each variable.
2. Universal property: for φ : M →ₗ[R] f_*N the ℤ-bilinear map (s, m) ↦ s•φ(m) is S-linear in s, so TensorProduct.AlgebraTensorModule.lift gives an S-linear map on S ⊗_ℤ M; it kills N_f because s•φ(r•m) = s•(f(r)•φ(m)) = (s·f(r))•φ(m); Submodule.liftQ descends it. The inverse sends ψ to m ↦ ψ(1 ⊗ m), which is R-linear because ψ(1 ⊗ r•m) = ψ(f(r) ⊗ m) = f(r)•ψ(1 ⊗ m). The two maps are inverse on generators s ⊗ m.
3. On morphisms g : M → M′ the map is induced by id_S ⊗ g; the hom-set bijection is natural in M and N, so CategoryTheory.Adjunction.mkOfHomEquiv gives ExtendScalars.functor f ⊣ ModuleCat.restrictScalars f.
4. Identity and composites: restriction along the identity is the identity (ModuleCat.restrictScalarsId') and along g ∘ f is the composite (ModuleCat.restrictScalarsComp'); left adjoints of isomorphic functors are isomorphic (CategoryTheory.Adjunction.leftAdjointUniq, with CategoryTheory.Adjunction.comp for the composite adjunction).
5. Commutative comparison: ModuleCat.extendScalars f is also left adjoint to restrictScalars f (ModuleCat.extendRestrictScalarsAdj), so leftAdjointUniq gives the natural isomorphism; it sends s ⊗ m to s ⊗ₜ m.
6. ExtendScalars f R ≅ S by s ⊗ r ↦ s·f(r), with inverse s ↦ s ⊗ 1, both from the universal property.

**API.**

- `TauCeti.ExtendScalars` (data): The left S-module ExtendScalars f M.
- `TauCeti.ExtendScalars.tmul` (constructor): tmul s m, written s ⊗ m.
- `TauCeti.ExtendScalars.tmul_smul` (relation): (s * f r) ⊗ m = s ⊗ (r • m).
- `TauCeti.ExtendScalars.smul_tmul` (simp): s′ • (s ⊗ m) = (s′ * s) ⊗ m.
- `TauCeti.ExtendScalars.induction_on` (other): Every element is a finite sum of elements s ⊗ m.
- `TauCeti.ExtendScalars.lift` (universal-property): For φ : M →ₗ[R] restrictScalars f N, lift φ : ExtendScalars f M →ₗ[S] N with lift φ (s ⊗ m) = s • φ m; lift is a bijection (liftEquiv).
- `TauCeti.ExtendScalars.hom_ext` (extensionality): S-linear maps out of ExtendScalars f M agreeing on all 1 ⊗ m are equal.
- `TauCeti.ExtendScalars.functor` (functoriality): ModuleCat.{u} R ⥤ ModuleCat.{u} S, additive.
- `TauCeti.ExtendScalars.adj` (universal-property): functor f ⊣ ModuleCat.restrictScalars f.
- `TauCeti.ExtendScalars.functorId` (functoriality): functor (RingHom.id R) ≅ 𝟭 (ModuleCat R).
- `TauCeti.ExtendScalars.functorComp` (functoriality): functor (g.comp f) ≅ functor f ⋙ functor g.
- `TauCeti.ExtendScalars.selfEquiv` (simp): ExtendScalars f R ≃ₗ[S] S, s ⊗ r ↦ s * f r.
- `TauCeti.ExtendScalars.isoExtendScalars` (compatibility): For commutative R and S: functor f ≅ ModuleCat.extendScalars f, with s ⊗ m ↦ s ⊗ₜ m.
- `TauCeti.ExtendScalars.quotientEquiv` (example): For π : R → R ⧸ I (I two-sided): ExtendScalars π M ≃ M ⧸ (I • ⊤).

**Unit tests.**

- `TauCeti.ExtendScalars.self_test` (computation): ExtendScalars f R ≃ₗ[S] S and ExtendScalars (RingHom.id R) M ≃ₗ[R] M.
- `TauCeti.ExtendScalars.balanced_test` (non-example): For fst : ℤ × ℤ → ℤ, ExtendScalars fst (ℤ × ℤ) ≃ ℤ, whereas the unbalanced ℤ ⊗_ℤ (ℤ × ℤ) ≃ ℤ²: the relation (s·f(r)) ⊗ m = s ⊗ (r•m) cannot be omitted.
- `TauCeti.ExtendScalars.commRing_test` (compatibility): For commutative R, S the isomorphism with Mathlib’s S ⊗[R] M sends s ⊗ m to s ⊗ₜ m.
- `TauCeti.ExtendScalars.quotient_test` (computation): For π : ℤ → ℤ/2: ExtendScalars π (ℤ³) ≃ (ℤ/2)³ and ExtendScalars π (ℤ/4) ≃ ℤ/2.
- `TauCeti.ExtendScalars.comp_test` (characterisation): For ℤ → ℚ → ℝ, functorComp identifies ℝ ⊗_ℚ (ℚ ⊗_ℤ M) with ℝ ⊗_ℤ M, r ⊗ (q ⊗ m) ↦ (r·q) ⊗ m.

**Acceptance.**

- For f = RingHom.id R, ExtendScalars f M ≅ M.
- For the quotient map R → R ⧸ I by a two-sided ideal, ExtendScalars M ≅ M ⧸ I•M.

**Used by.**

- Weibel, I.2 (PDF p. 16), II.2 (PDF p. 76) and Example II.2.8.1: the base-change functor P(R) → P(S) that makes K₀ a functor on all rings
- KTheoryLowDegrees:Z.1/ring-k0-map: the K₀ map is induced by this functor restricted to finitely generated projectives
- KTheoryLowDegrees:Z.2/local-projective-free: the reduction P/mP of Lemma I.2.2 over a noncommutative local ring is ExtendScalars along R → R/m
- KTheoryLowDegrees:Z.2/pi-ring-modules: A_i ⊗_{∏A} P is the i-th component e_i P
- ClassicalArithmeticCompletion:CA.7: extension of scalars along an inclusion of orders Λ → Λ′ (e.g. ℤ[G] → 𝓞_K[G]), [M] ↦ [Λ′ ⊗_Λ M]
- GeneralAlgebraicKTheory:K.2:plus: “scalar extension along every unital ring homomorphism preserves these objects” — imported from here (RS-18 owner record)

**Depends on.** libraries: `mathlib:TensorProduct`, `mathlib:TensorProduct.leftModule`, `mathlib:TensorProduct.AlgebraTensorModule.lift`, `mathlib:Submodule.span`, `mathlib:Submodule.mkQ`, `mathlib:Submodule.liftQ`, `mathlib:ModuleCat.restrictScalars`, `mathlib:ModuleCat.restrictScalarsId'`, `mathlib:ModuleCat.restrictScalarsComp'`, `mathlib:CategoryTheory.Adjunction.mkOfHomEquiv`, `mathlib:CategoryTheory.Adjunction.leftAdjointUniq`, `mathlib:CategoryTheory.Adjunction.comp`, `mathlib:ModuleCat.extendScalars`, `mathlib:ModuleCat.extendRestrictScalarsAdj`.

**Sources.**

- `Kbook.2013`, I.2, paragraph on the category P(R), PDF p. 16 (draft p. 8): “We may regard P as a covariant functor on rings, since if R →S is a ring map then up to coherence there is an additive functor P(R) →P(S) sending P to P ⊗R S.” — The source’s base-change functor P ↦ P ⊗_R S on projectives along an arbitrary ring map; Mathlib has it only for commutative rings, so the node constructs it.
- `Kbook.2013`, Example II.2.8.1 (Base change and Transfer maps), PDF p. 84 (draft p. 76): “Then S is an R–S bimodule, and it represents the base change functor f ∗: K0(R) →K0(S) sending P to P ⊗R S.” — Base change is represented by S as an R–S bimodule.

### Extension of scalars preserves finitely generated projectives

`Z.1/extend-scalars-finite-projective` · lemma

For f : R →+* S: (a) ExtendScalars f (Fin n → R) ≅ (Fin n → S), 1 ⊗ e_i ↦ e_i, and under these isomorphisms the image of v ↦ v·A (A ∈ Mat_{m×n}(R)) is w ↦ w·(A.map f); (b) if P is finitely generated projective over R, then ExtendScalars f P is finitely generated projective over S; (c) for an idempotent e ∈ M_n(R), ExtendScalars f P(e) ≅ P(e.map f); (d) the functor restricts to an additive functor (finiteProjectiveModules R).FullSubcategory ⥤ (finiteProjectiveModules S).FullSubcategory.

**Hypotheses.**

- R, S rings in one universe, f : R →+* S.
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- Matrices act on row vectors from the right: M ∈ Mat_{m×n}(R) gives the left R-linear map R^m → R^n, v ↦ v·M (Mathlib Matrix.vecMulLinear), so that End_R(R^n) ≅ M_n(R)ᵐᵒᵖ (LinearMap.toMatrixRight'). This is the left-module form of the K-book’s column vectors e(R^n).

**Proof.**

1. (a) The functor is a left adjoint, so it preserves finite coproducts (CategoryTheory.Adjunction.leftAdjoint_preservesColimits) and is additive (CategoryTheory.Functor.additive_of_preserves_binary_products); with ExtendScalars f R ≅ S this gives ExtendScalars f R^n ≅ S^n. On generators, e_i·A = Σ_j A_ij e_j and 1 ⊗ (Σ_j A_ij e_j) = Σ_j f(A_ij)·(1 ⊗ e_j), which is the matrix statement.
2. (b) A free-summand datum (ι, π) for P (Z.1/free-summand-data) is sent by the functor to maps with π′ ∘ ι′ = id, exhibiting ExtendScalars f P as a retract of S^n: Module.Projective.of_split and Module.Finite.of_surjective.
3. (c) P(e) is the image of the idempotent ρ_e, split by ρ_e itself; an additive functor preserves split images of idempotents, so ExtendScalars f P(e) is the image of the functor applied to ρ_e, which is ρ_{e.map f} by (a).
4. (d) CategoryTheory.ObjectProperty.lift of ι ⋙ functor f, using (b) for the property; additivity from (a).

**Acceptance.**

- For π : ℤ → 𝔽_p and e = diag(1, 0), ExtendScalars π P(e) ≅ P(diag(1, 0)) over 𝔽_p, of dimension one.
- For fst : ℤ × ℤ → ℤ and P = ℤ × 0 = P((1, 0)): ExtendScalars fst P ≅ P(1) = ℤ, and for snd it is P(0) = 0.

**Depends on.** this roadmap: `Z.1/extend-scalars`, `Z.1/free-summand-data`, `Z.1/idempotent-module`; libraries: `mathlib:CategoryTheory.Adjunction.leftAdjoint_preservesColimits`, `mathlib:CategoryTheory.Functor.additive_of_preserves_binary_products`, `mathlib:Module.Projective.of_split`, `mathlib:Module.Finite.of_surjective`, `mathlib:CategoryTheory.ObjectProperty.lift`, `mathlib:Matrix.map`, `tauceti:TauCeti.finiteProjectiveModules`.

**Sources.**

- `Kbook.2013`, I.2, paragraph on the category P(R), PDF p. 16 (draft p. 8): “We may regard P as a covariant functor on rings, since if R →S is a ring map then up to coherence there is an additive functor P(R) →P(S) sending P to P ⊗R S.” — The additive functor P(R) → P(S), P ↦ P ⊗_R S.
- `Kbook.2013`, II.2, functoriality, PDF p. 76 (draft p. 68): “The functor ⊗RS : P(R) →P(S) (sending P to P ⊗R S) yields a monoid map P(R) →P(S), hence a group homomorphism K0(R) →K0(S).” — It induces the monoid map P(R) → P(S) and hence the map on K₀.

### Scalar extension on K₀

`Z.1/ring-k0-map` · construction · planet “Scalar extension on K₀”

For f : R →+* S, RingK0.map f := SplitK0.map (the additive functor of Z.1/extend-scalars-finite-projective (d)) : RingK0 R →+ RingK0 S, so map f [P] = [ExtendScalars f P]. It satisfies map (RingHom.id R) = id and map (g.comp f) = (map g).comp (map f); a ring isomorphism gives an additive equivalence mapEquiv; map f [R] = [S]; map f [P(e)] = [P(e.map f)]; and for commutative R, S, map f [P] = [S ⊗[R] P] with Mathlib’s tensor product.

**Hypotheses.**

- R, S, T rings in one universe; f : R →+* S, g : S →+* T.
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. SplitK0.map for the additive functor, with SplitK0.map_of for the value on classes.
2. Identity and composites: the objectwise isomorphisms ExtendScalars.functorId and functorComp and SplitK0.map_congr, combined with SplitK0.map_id and SplitK0.map_comp.
3. Values: Z.1/extend-scalars-finite-projective (a) for [R] and (c) for [P(e)]; ExtendScalars.isoExtendScalars for the commutative formula.
4. mapEquiv: map e and map e.symm are mutually inverse by the composition and identity laws.

**API.**

- `TauCeti.RingK0.map` (functoriality): map f : RingK0 R →+ RingK0 S.
- `TauCeti.RingK0.map_of` (simp): map f [P] = [ExtendScalars f P].
- `TauCeti.RingK0.map_id` (functoriality): map (RingHom.id R) = AddMonoidHom.id.
- `TauCeti.RingK0.map_comp` (functoriality): map (g.comp f) = (map g).comp (map f).
- `TauCeti.RingK0.map_one` (simp): map f [R] = [S].
- `TauCeti.RingK0.map_ofIdempotent` (simp): map f [P(e)] = [P(e.map f)].
- `TauCeti.RingK0.map_of_commRing` (compatibility): For commutative R, S: map f [P] = [S ⊗[R] P].
- `TauCeti.RingK0.mapEquiv` (equivalence): For e : R ≃+* S, mapEquiv e : RingK0 R ≃+ RingK0 S.
- `TauCeti.RingK0.map_idempotentCompletion` (compatibility): Under Z.1/ring-k0-idempotent-completion, map f is the group completion of StableIdempotent.map f.

**Unit tests.**

- `TauCeti.RingK0.map_id_test` (degenerate): map (RingHom.id R) x = x.
- `TauCeti.RingK0.map_zero_ring_test` (degenerate): If S is the zero ring then map f = 0.
- `TauCeti.RingK0.map_rat_test` (compatibility): For ℤ → ℚ: map [ℤ²] = [ℚ²], and map [P] = [ℚ ⊗[ℤ] P] with Mathlib’s tensor product.
- `TauCeti.RingK0.map_fst_test` (computation): For fst : ℤ × ℤ → ℤ: map fst [ℤ × 0] = [ℤ] and map fst [0 × ℤ] = 0.
- `TauCeti.RingK0.map_not_injective_test` (non-example): map fst is not injective: [0 × ℤ] ≠ 0 in RingK0 (ℤ × ℤ) (its image under map snd is [ℤ]) but map fst [0 × ℤ] = 0.

**Acceptance.**

- map f (n•[R]) = n•[S].
- For π : ℤ → ℤ/6, map π [ℤ] = [ℤ/6].

**Used by.**

- Weibel, II.2 (PDF p. 76): K₀ is a functor from rings to abelian groups
- KTheoryLowDegrees:Z.2/rank-base-change: rank is natural for this map
- KTheoryLowDegrees:Z.2/local-ring-k0 and Z.2/integer-summand: maps to a residue division ring detect the free class
- KTheoryLowDegrees:Z.2/k0-pi: the product formula is x ↦ (map π_i x)_i
- ClassicalArithmeticCompletion:CA.7/locally-free-class-group: LocallyFree.classGroupMap is extension of scalars along Λ → Λ′
- KTheoryLowDegrees:U.5: K₀(A) → K₀(A/I) in the relative exact sequence
- KTheoryLowDegrees:Z.3 and Z.4: naturality of λ-operations and the determinant, localisation and extension of number fields on K₀

**Depends on.** this roadmap: `Z.1/ring-k0`, `Z.1/extend-scalars`, `Z.1/extend-scalars-finite-projective`; libraries: `tauceti:TauCeti.SplitK0.map`, `tauceti:TauCeti.SplitK0.map_of`, `tauceti:TauCeti.SplitK0.map_id`, `tauceti:TauCeti.SplitK0.map_comp`, `tauceti:TauCeti.SplitK0.map_congr`.

**Sources.**

- `Kbook.2013`, II.2, functoriality, PDF p. 76 (draft p. 68): “The functor ⊗RS : P(R) →P(S) (sending P to P ⊗R S) yields a monoid map P(R) →P(S), hence a group homomorphism K0(R) →K0(S).” — K₀ is a functor on rings through P ↦ P ⊗_R S.
- `Kbook.2013`, Example II.2.8.1 (Base change and Transfer maps), PDF p. 84 (draft p. 76): “Then S is an R–S bimodule, and it represents the base change functor f ∗: K0(R) →K0(S) sending P to P ⊗R S.” — Base change f^* on K₀ is represented by S as an R–S bimodule.

### Restriction of scalars along a finite projective extension

`Z.1/restrict-scalars-finite-projective` · lemma

Let f : R →+* S be such that S, as a left R-module through f (r•s = f(r)·s), is finitely generated projective. Then for every finitely generated projective left S-module Q, (ModuleCat.restrictScalars f).obj Q is finitely generated projective over R, and restriction of scalars restricts to an additive functor (finiteProjectiveModules S).FullSubcategory ⥤ (finiteProjectiveModules R).FullSubcategory.

**Hypotheses.**

- R, S rings in one universe; f : R →+* S; S finitely generated projective as a left R-module through f.
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.

**Proof.**

1. Finite generation: Module.Finite.trans (S finite over R, Q finite over S).
2. Projectivity: a free-summand datum for Q over S (Z.1/free-summand-data) exhibits Q as an S-linear, hence R-linear, retract of S^n; the restriction of S^n is (f_*S)^n, projective over R as a finite direct sum of projectives (Module.Projective.directSum); Module.Projective.of_split.
3. Restriction of scalars is additive (it is the identity on underlying groups and maps); lift through the full subcategories with CategoryTheory.ObjectProperty.lift.

**Acceptance.**

- For ℤ → ℤ[i], ℤ[i] ≅ ℤ² as a ℤ-module, so f_*ℤ[i] ≅ ℤ².
- The hypothesis is needed: for ℤ → ℚ, ℚ is not finitely generated over ℤ.

**Depends on.** this roadmap: `Z.1/free-summand-data`; libraries: `mathlib:ModuleCat.restrictScalars`, `mathlib:Module.Finite.trans`, `mathlib:Module.Projective.of_split`, `mathlib:Module.Projective.directSum`, `mathlib:CategoryTheory.ObjectProperty.lift`, `tauceti:TauCeti.finiteProjectiveModules`.

**Sources.**

- `Kbook.2013`, Example II.2.8.1 (Base change and Transfer maps), PDF p. 84 (draft p. 76): “If in addition S is finitely generated projective as a right R-module then there is a forgetful functor from P(S) to P(R); it is represented by S as a S–R bimodule because it sends Q to Q ⊗S S. The induced map f∗: K0(S) →K0(R) is called the transfer map.” — The forgetful functor P(S) → P(R) for S finitely generated projective over R (a right module in the source, a left module here) and the transfer map it induces.

### The transfer on K₀ by restriction of scalars

`Z.1/ring-k0-transfer` · construction

Under the hypothesis of Z.1/restrict-scalars-finite-projective, RingK0.transfer f := SplitK0.map (the restricted restriction functor) : RingK0 S →+ RingK0 R, with transfer f [Q] = [f_*Q] and transfer f [S] = [f_*S]. transfer (RingHom.id R) = id, and transfer (g.comp f) = (transfer f).comp (transfer g) when S is finitely generated projective over R and T over S (then T is finitely generated projective over R).

**Hypotheses.**

- R, S, T rings in one universe; f : R →+* S, g : S →+* T with the finiteness and projectivity hypotheses stated.
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. SplitK0.map for the additive functor, SplitK0.map_of for the values.
2. Identity and composites: restriction along the identity is objectwise isomorphic to the identity (ModuleCat.restrictScalarsId') and along g ∘ f to the composite (ModuleCat.restrictScalarsComp'); SplitK0.map_congr, map_id and map_comp.
3. The composite hypothesis: T is finitely generated projective over R by Z.1/restrict-scalars-finite-projective applied to T as a finitely generated projective S-module.

**API.**

- `TauCeti.RingK0.transfer` (functoriality): transfer f : RingK0 S →+ RingK0 R.
- `TauCeti.RingK0.transfer_of` (simp): transfer f [Q] = [restrictScalars f Q].
- `TauCeti.RingK0.transfer_one` (simp): transfer f [S] = [f_*S].
- `TauCeti.RingK0.transfer_id` (functoriality): transfer (RingHom.id R) = AddMonoidHom.id.
- `TauCeti.RingK0.transfer_comp` (functoriality): transfer (g.comp f) = (transfer f).comp (transfer g).
- `TauCeti.RingK0.transfer_map_free` (other): If S ≃ R^d as a left R-module then transfer f (map f x) = d • x for x ∈ ℤ•[R].

**Unit tests.**

- `TauCeti.RingK0.transfer_gaussian_test` (computation): For ℤ → ℤ[i]: transfer [ℤ[i]] = 2[ℤ].
- `TauCeti.RingK0.transfer_id_test` (degenerate): transfer (RingHom.id R) = AddMonoidHom.id.
- `TauCeti.RingK0.transfer_projection_test` (characterisation): For fst : ℤ × ℤ → ℤ (ℤ ≅ ℤ × 0 is a projective ℤ × ℤ-module): transfer fst [ℤ] = [ℤ × 0] and map fst (transfer fst x) = x.
- `TauCeti.RingK0.transfer_matrix_test` (compatibility): For the scalar embedding R → M_n(R), M_n(R) ≃ R^{n²} as a left R-module, so transfer [M_n(R)] = n²[R].
- `TauCeti.RingK0.transfer_not_inverse_test` (non-example): transfer is not inverse to map: for ℤ → ℤ[i], transfer (map [ℤ]) = 2[ℤ] ≠ [ℤ].

**Acceptance.**

- For ℤ → ℤ[i]: transfer [ℤ[i]] = 2[ℤ].
- For R → M_n(R) (scalar matrices): transfer [M_n(R)] = n²[R].

**Used by.**

- Weibel, Example II.2.8.1 and Exercise II.2.2: the transfer and the projection formula f_*(x·f^*y) = f_*(x)·y
- ClassicalArithmeticCompletion:CA.7: restriction of scalars along ℤ[G] → 𝓞_K[G], which makes 𝓞_K[G] finitely generated projective over ℤ[G]
- KTheoryLowDegrees:Z.4: finite-flat restriction of scalars on K₀ of Dedekind domains and its determinant-norm formula
- KTheoryLowDegrees:U.5: the transfer on K₁ by restriction of scalars is compared with this one through the projection formula against K₀
- KTheoryLowDegrees:Z.2/k0-pi: the inverse of the product formula is the sum of the transfers along the projections

**Depends on.** this roadmap: `Z.1/ring-k0`, `Z.1/restrict-scalars-finite-projective`; libraries: `tauceti:TauCeti.SplitK0.map`, `tauceti:TauCeti.SplitK0.map_of`, `tauceti:TauCeti.SplitK0.map_id`, `tauceti:TauCeti.SplitK0.map_comp`, `tauceti:TauCeti.SplitK0.map_congr`, `mathlib:ModuleCat.restrictScalarsId'`, `mathlib:ModuleCat.restrictScalarsComp'`.

**Sources.**

- `Kbook.2013`, Example II.2.8.1 (Base change and Transfer maps), PDF p. 84 (draft p. 76): “If in addition S is finitely generated projective as a right R-module then there is a forgetful functor from P(S) to P(R); it is represented by S as a S–R bimodule because it sends Q to Q ⊗S S. The induced map f∗: K0(S) →K0(R) is called the transfer map.” — The transfer map f_* : K₀(S) → K₀(R).

### Equivalences of module categories preserve finitely generated projectives

`Z.1/equivalence-preserves-finite-projective` · lemma

Let A, B be rings in one universe and E : ModuleCat A ≌ ModuleCat B an equivalence of categories. For every finitely generated projective A-module M, E.functor.obj M is a finitely generated projective B-module. Hence E restricts to an equivalence (finiteProjectiveModules A).FullSubcategory ≌ (finiteProjectiveModules B).FullSubcategory with additive functor.

**Hypotheses.**

- A, B rings in one universe; E any equivalence of categories (automatically additive).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.

**Proof.**

1. Projectivity: in ModuleCat, the categorical projective objects are the projective modules (IsProjective.iff_projective), and equivalences preserve projective objects (CategoryTheory.Equivalence.map_projective_iff).
2. Finite generation is a lattice property: M is finitely generated iff ⊤ is a compact element of Submodule A M (Module.finite_def, Submodule.fg_iff_compact, IsCompactElement). The subobject lattice of M in ModuleCat is Submodule A M (ModuleCat.subobjectModule), and E induces MonoOver M ≌ MonoOver (E M) (CategoryTheory.MonoOver.congr), hence an order isomorphism of subobject posets (CategoryTheory.Subobject.lowerEquivalence, CategoryTheory.Equivalence.toOrderIso) sending ⊤ to ⊤; an order isomorphism preserves compact elements (their definition uses only suprema).
3. The restricted functor is additive because E preserves binary products (CategoryTheory.Functor.additive_of_preserves_binary_products); restriction to the full subcategories uses the two preservation statements for E and its inverse.

**Acceptance.**

- For Mathlib’s ModuleCat.matrixEquivalence, A ↦ A^ι (column vectors) is finitely generated projective over M_ι(A).
- The restriction is essential: the equivalence also preserves the non-finitely generated free module A^(ℕ), which is projective but not in the subcategory.

**Depends on.** libraries: `mathlib:IsProjective.iff_projective`, `mathlib:CategoryTheory.Equivalence.map_projective_iff`, `mathlib:Module.finite_def`, `mathlib:Submodule.fg_iff_compact`, `mathlib:IsCompactElement`, `mathlib:ModuleCat.subobjectModule`, `mathlib:CategoryTheory.MonoOver.congr`, `mathlib:CategoryTheory.Subobject.lowerEquivalence`, `mathlib:CategoryTheory.Equivalence.toOrderIso`, `mathlib:CategoryTheory.Functor.additive_of_preserves_binary_products`, `tauceti:TauCeti.finiteProjectiveModules`.

**Sources.**

- `Kbook.2013`, Theorem II.2.7(a), PDF p. 83 (draft p. 75): “Theorem 2.7 (Structure Theorem for Morita Equivalence). If R and S are Morita equivalent, and P, Q are as above, then: (a) P and Q are finitely generated projective, both as R-modules and as S-modules;” — Part (a) of the structure theorem: the Morita bimodules are finitely generated projective.
- `Kbook.2013`, II.2, before Theorem 2.7, PDF p. 83 (draft p. 75): “Here is the main structure theorem, taken from Bass [15, II.3].” — The source takes the theorem from Bass, Algebraic K-theory, II.3, which was not available; the proof steps are a categorical argument not checked against a source (gaps).
- `Kbook.2013`, II.2, after Theorem 2.7, and Corollary 2.7.1, PDF p. 84 (draft p. 76): “Since P and Q are finitely generated projective, the Morita functors T and U also induce an equivalence between the categories P(R) and P(S). This implies the following: Corollary 2.7.1. If R and S are Morita equivalent then K0(R) ∼= K0(S).” — The consequence used: the Morita functors restrict to an equivalence of the categories of finitely generated projectives.

### Morita invariance of K₀

`Z.1/ring-k0-morita` · construction · planet “Morita invariance of K₀”

For rings A, B in one universe and an equivalence E : ModuleCat A ≌ ModuleCat B (in particular the underlying equivalence e.eqv of a Mathlib MoritaEquivalence ℤ A B), RingK0.ofEquivalence E := SplitK0.mapEquiv (the restricted equivalence of Z.1/equivalence-preserves-finite-projective) : RingK0 A ≃+ RingK0 B, with [M] ↦ [E.functor.obj M]; moritaEquiv e := ofEquivalence e.eqv. It is the identity for MoritaEquivalence.refl, compatible with trans and symm, and for an algebra isomorphism φ it agrees with RingK0.mapEquiv φ.

**Hypotheses.**

- A, B, C rings in one universe (Mathlib’s Morita equivalences are ℤ-linear equivalences of module categories; every ring is a ℤ-algebra).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. SplitK0.mapEquiv for the restricted additive equivalence; SplitK0.mapEquiv_of for the values.
2. refl, trans, symm: the restricted functors of the composite and inverse equivalences are objectwise isomorphic to the composites and inverses; SplitK0.map_congr.
3. Algebra isomorphisms: MoritaEquivalence.ofAlgEquiv φ is restriction of scalars along φ⁻¹, which is left adjoint to restriction along φ (inverse equivalence), as is ExtendScalars φ (Z.1/extend-scalars); CategoryTheory.Adjunction.leftAdjointUniq gives the objectwise isomorphism, so ofEquivalence agrees with RingK0.mapEquiv φ (Z.1/ring-k0-map).

**API.**

- `TauCeti.RingK0.ofEquivalence` (equivalence): For E : ModuleCat A ≌ ModuleCat B, ofEquivalence E : RingK0 A ≃+ RingK0 B.
- `TauCeti.RingK0.ofEquivalence_of` (simp): ofEquivalence E [M] = [E.functor.obj M].
- `TauCeti.RingK0.moritaEquiv` (equivalence): moritaEquiv e := ofEquivalence e.eqv for e : MoritaEquivalence ℤ A B.
- `TauCeti.RingK0.moritaEquiv_refl` (simp): moritaEquiv (MoritaEquivalence.refl ℤ A) = AddEquiv.refl _.
- `TauCeti.RingK0.moritaEquiv_trans` (functoriality): moritaEquiv (e.trans e′) = (moritaEquiv e).trans (moritaEquiv e′).
- `TauCeti.RingK0.moritaEquiv_symm` (simp): moritaEquiv e.symm = (moritaEquiv e).symm.
- `TauCeti.RingK0.moritaEquiv_ofAlgEquiv` (compatibility): moritaEquiv (MoritaEquivalence.ofAlgEquiv φ) = RingK0.mapEquiv φ.

**Unit tests.**

- `TauCeti.RingK0.moritaEquiv_matrix_test` (computation): For a field k and Mathlib’s moritaEquivalenceMatrix for Fin 2: [k] ↦ [k²] (column vectors), and the inverse sends [M₂(k)] to 2[k].
- `TauCeti.RingK0.moritaEquiv_refl_test` (degenerate): moritaEquiv (MoritaEquivalence.refl ℤ A) x = x.
- `TauCeti.RingK0.moritaEquiv_not_free_test` (non-example): A Morita equivalence need not send the free class to the free class: for k and M₂(k), [k] ↦ [k²], which is not a multiple of [M₂(k)] in K₀(M₂(k)).
- `TauCeti.RingK0.moritaEquiv_algEquiv_test` (compatibility): For φ : A ≃ₐ[ℤ] B, moritaEquiv (ofAlgEquiv φ) agrees with RingK0.mapEquiv φ.

**Acceptance.**

- For the matrix equivalence of Z.1/ring-k0-matrix, [A] ↦ [A^ι].
- For finite-dimensional algebras over a field it must agree with the Morita invariance of GrothendieckEulerForms layer 4, stated on the same carrier through Z.1/ring-k0-exact (requests).

**Used by.**

- Weibel, Corollary II.2.7.1 and Example II.2.7.2: K₀(R) ≅ K₀(S) for Morita equivalent rings; K₀(S) ≅ K₀(M_n(S))
- KTheoryLowDegrees:Z.1/ring-k0-matrix and Z.2/matrix-division-ring-k0: the matrix-ring computation
- GeneralAlgebraicKTheory:K.7: the higher Morita invariance is compared with this degree-zero map (RS-18 link Z.1 → K.7)
- GrothendieckEulerForms layer 4 (Tau Ceti roadmap): its finite-dimensional-algebra Morita invariance is the special case; the two must agree (requests)
- Weibel, Example II.2.1.4: K₀ of a semisimple ring through the Artin–Wedderburn decomposition into matrix rings over division rings

**Depends on.** this roadmap: `Z.1/ring-k0`, `Z.1/equivalence-preserves-finite-projective`, `Z.1/ring-k0-map`, `Z.1/extend-scalars`; libraries: `mathlib:MoritaEquivalence`, `mathlib:MoritaEquivalence.refl`, `mathlib:MoritaEquivalence.trans`, `mathlib:MoritaEquivalence.symm`, `mathlib:MoritaEquivalence.ofAlgEquiv`, `tauceti:TauCeti.SplitK0.mapEquiv`, `tauceti:TauCeti.SplitK0.mapEquiv_of`, `tauceti:TauCeti.SplitK0.map_congr`, `mathlib:CategoryTheory.Adjunction.leftAdjointUniq`.

**Sources.**

- `Kbook.2013`, II.2, after Theorem 2.7, and Corollary 2.7.1, PDF p. 84 (draft p. 76): “Since P and Q are finitely generated projective, the Morita functors T and U also induce an equivalence between the categories P(R) and P(S). This implies the following: Corollary 2.7.1. If R and S are Morita equivalent then K0(R) ∼= K0(S).” — Corollary II.2.7.1 and the restricted equivalence P(R) ≃ P(S) it rests on.

### K₀ of a matrix ring

`Z.1/ring-k0-matrix` · application

For a ring A, a nonempty finite type ι with decidable equality and i₀ ∈ ι, RingK0.moritaEquiv (moritaEquivalenceMatrix A ℤ i₀) : RingK0 A ≃+ RingK0 (Matrix ι ι A) sends [M] to [ι → M] (column vectors with the matrix action); its inverse sends [N] to [E_{i₀i₀}·N] and in particular [Matrix ι ι A] to |ι|•[A].

**Hypotheses.**

- A a ring; ι nonempty, finite, with decidable equality.
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. Apply Z.1/ring-k0-morita to Mathlib’s moritaEquivalenceMatrix, whose equivalence is ModuleCat.matrixEquivalence (functor M ↦ (ι → M)).
2. The inverse functor sends N to the image of E_{i₀i₀} acting on N; for N = Matrix ι ι A this is the set of matrices supported in row i₀, isomorphic as a left A-module to A^ι, so its class is |ι|•[A] (of_free).

**Acceptance.**

- For A = ℤ and ι = Fin 2: [ℤ] ↦ [ℤ²] and [M₂(ℤ)] ↦ 2[ℤ].
- For ι a singleton, M₁(A) ≅ A and the isomorphism is RingK0.mapEquiv of that ring isomorphism.

**Depends on.** this roadmap: `Z.1/ring-k0-morita`, `Z.1/ring-k0`; libraries: `mathlib:moritaEquivalenceMatrix`, `mathlib:ModuleCat.matrixEquivalence`.

**Sources.**

- `Kbook.2013`, Example II.2.7.2, PDF p. 84 (draft p. 76): “R = Mn(S) is always Morita equivalent to S; P is the bimodule S^n of “column vectors” and Q is the bimodule (S^n)^t of “row vectors.”” — The Morita equivalence between S and M_n(S) through column vectors, and the conclusion K₀(S) ≅ K₀(M_n(S)).

## Z.2 — Rank in the correct generality

*Coverage: source_decomposed.* Planned within RS-18’s narrowed scope for Z.2 (accepted), reusing Mathlib’s stalk rank and local finite-flat freeness. Stage targets and their nodes. (1) Rank of a finitely generated projective as a locally constant integer-valued function on Spec A: Mathlib’s Module.rankAtStalk and isLocallyConstant_rankAtStalk on modules; the virtual rank on K₀ is Z.2/rank-hom (with local freeness packaged in Z.2/local-freeness). (2) Finite image: API of Z.2/rank-hom (IsLocallyConstant.range_finite). (3) Compatibility with localisation and base change: Z.2/rank-base-change and Z.2/rank-localization. (4) Connected spectrum gives an integer, a disconnected one must not be collapsed: Z.2/rank-connected, Z.2/connected-iff-constant-rank (K-book Ex. I.2.5), the non-examples in Z.2/rank-hom and Z.2/k0-field-product, with the section and splitting K₀ = H⁰ ⊕ K̃₀ (Z.2/componentwise-free, Z.2/rank-section) and the clopen rank-fibre decomposition (Z.2/rank-fibre-decomposition) that the companion part uses. (5) K₀(F) ≅ ℤ for fields and division rings by dimension, identified with the ring K₀ of Z.1: Z.2/division-ring-k0 (transport of the existing SplitK0.finrankEquiv), with Z.2/integer-summand (K-book II.2.1.1), Z.2/pid-k0 and Z.2/matrix-division-ring-k0 (II.2.1.2). (6) Finite-product formula for arbitrary rings: Z.2/pi-ring-modules and Z.2/k0-pi; the test K₀(F × F) ≅ ℤ² through the rank is Z.2/k0-field-product. (7) Local rings: freeness of finitely generated projectives, in the K-book’s generality of possibly noncommutative local rings (Lemma I.2.2, Z.2/local-matrix-lift and Z.2/local-projective-free; the commutative case is Mathlib’s Module.free_of_flat_of_isLocalRing), and K₀ ≅ ℤ (Z.2/local-ring-k0). (8) The semilocal decomposition with its component information: Z.2/semilocal-components-finite, Z.2/semilocal-connected-k0 (K₀ ≅ ℤ for connected spectrum) and Z.2/semilocal-k0 (K₀ ≅ LocallyConstant(Spec A, ℤ) ≅ ℤ^{π₀(Spec A)}, counting components rather than maximal ideals). (9) Non-free projectives: Z.2/nonfree-projective-ideal (the ideal (2, 1 + √−5) of ℤ[√−5], constant rank one, not free) and the componentwise free modules over disconnected rings. The rank is additive here; its multiplicativity as a ring homomorphism needs the ring structure of Z.3 and is proposed there (restructure). Proofs that the K-book leaves as exercises (Ex. I.2.5, I.2.12, II.2.6) and the finiteness of components of a semilocal spectrum are given in full. Z.2/matrix-division-ring-k0 uses Z.1/ring-k0-matrix, whose Morita input carries the Z.1 gap.

### Finitely generated projectives are locally free of their stalk rank

`Z.2/local-freeness` · lemma

Let A be commutative, P a finitely generated projective A-module and p ∈ Spec A. Then the localisation P_p (LocalizedModule p.primeCompl P) is a free A_p-module of rank rankAtStalk P p, so P_p ≃ₗ (A_p)^{rankAtStalk P p}; there is s ∉ p such that P[1/s] is a free A[1/s]-module of the same rank; and rankAtStalk P is locally constant, constant on the basic open D(s).

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.
- P is a finitely generated projective A-module.

**Proof.**

1. P is flat (Module.Flat.of_projective) and finitely presented (Module.finitePresentation_of_projective).
2. A_p is local and P_p is finite and flat over it, hence free (Module.free_of_flat_of_isLocalRing); its finrank is rankAtStalk P p by definition (Module.rankAtStalk), and Module.finBasisOfFinrankEq gives the isomorphism with A_p^n.
3. Module.FinitePresentation.exists_free_localizedModule_powers gives s ∉ p with P[1/s] free over A[1/s]; localising further at p shows that its rank is n.
4. Local constancy is Module.isLocallyConstant_rankAtStalk.

**Acceptance.**

- For a field k and A = k × k with p₁ = ker(fst), P = k × 0: P_{p₁} ≅ k, and s = (1, 0) ∉ p₁ gives P[1/s] ≅ A[1/s] ≅ k free of rank one.
- For the ideal I = (2, 1 + √−5) of ℤ[√−5] every localisation is free of rank one although I is not free (Z.2/nonfree-projective-ideal).

**Depends on.** libraries: `mathlib:Module.rankAtStalk`, `mathlib:Module.Flat.of_projective`, `mathlib:Module.finitePresentation_of_projective`, `mathlib:Module.free_of_flat_of_isLocalRing`, `mathlib:Module.finBasisOfFinrankEq`, `mathlib:Module.FinitePresentation.exists_free_localizedModule_powers`, `mathlib:Module.isLocallyConstant_rankAtStalk`.

**Sources.**

- `Kbook.2013`, Corollary I.2.2.2, PDF p. 18 (draft p. 10): “If p is a prime ideal of a commutative ring R and P is a finitely generated projective R-module, then the localization Pp is isomorphic to (Rp)^n for some n ≥0. Moreover, there is an s ∈R−p such that the localization of P away from s is free” — Corollary I.2.2.2, the statement of the node (the source continues: (P[1/s]) ≅ (R[1/s])^n).
- `Kbook.2013`, Definition I.2.2.3 (Rank), PDF p. 19 (draft p. 11): “If P is a finitely generated projective R-module then rank(P): p 7→rankp(P) is a continuous function from the topological space Spec(R) to the discrete topological space N ⊂Z, as we see from Corollary 2.2.2.” — The consequence that the rank is locally constant.

### The rank of a virtual projective module

`Z.2/rank-hom` · construction · planet “Rank of a projective module”

For a commutative ring A, RingK0.rank : RingK0 A →+ LocallyConstant (PrimeSpectrum A) ℤ is the unique additive map with rank [P] = (p ↦ (rankAtStalk P p : ℤ)) for every finitely generated projective P. Here rankAtStalk P p = finrank_{A_p} P_p (Mathlib), which for finitely generated projective P equals the K-book’s dim_{k(p)} P ⊗ k(p) (Module.rankAtStalk_eq). The value is a locally constant integer-valued function on Spec A with finite image. It is not collapsed to a single integer: that is possible only on a connected spectrum (Z.2/rank-connected).

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.

**Proof.**

1. The object function P ↦ ⟨p ↦ (rankAtStalk P p : ℤ), _⟩ lands in LocallyConstant (PrimeSpectrum A) ℤ by Module.isLocallyConstant_rankAtStalk (P is finitely presented and flat, Z.2/local-freeness), composed with the cast ℕ → ℤ.
2. Isomorphism invariance: Module.rankAtStalk_eq_of_equiv. Additivity: the binary biproduct in ModuleCat is the product (ModuleCat.biprodIsoProd) and Module.rankAtStalk_prod gives rankAtStalk (P × Q) = rankAtStalk P + rankAtStalk Q.
3. The universal property of Z.1/ring-k0 (RingK0.lift, i.e. SplitK0.lift) gives the additive map into the additive group LocallyConstant (PrimeSpectrum A) ℤ; uniqueness by RingK0.hom_ext.
4. Finite image: Spec A is compact (PrimeSpectrum.compactSpace) and a locally constant function on a compact space has finite range (IsLocallyConstant.range_finite).
5. Invertible modules have rank one: for L invertible (Module.Invertible), each localisation L_p is invertible over the local ring A_p, hence free, and Module.Invertible.finrank_eq_one gives rank one.

**API.**

- `TauCeti.RingK0.rank` (constructor): rank : RingK0 A →+ LocallyConstant (PrimeSpectrum A) ℤ.
- `TauCeti.RingK0.rank_of` (simp): rank [P] p = rankAtStalk P p.
- `TauCeti.RingK0.rank_one` (simp): rank [A] = 1.
- `TauCeti.RingK0.rank_free` (simp): rank (n • [A]) = n.
- `TauCeti.RingK0.rank_of_eq_zero_iff` (characterisation): rank [P] = 0 ↔ Subsingleton P.
- `TauCeti.RingK0.rank_of_nonneg` (other): 0 ≤ rank [P] p for every p.
- `TauCeti.RingK0.rank_range_finite` (other): (Set.range (rank x)).Finite for every x.
- `TauCeti.RingK0.rank_of_eq_fiber` (compatibility): rank [P] p = finrank κ(p) (κ(p) ⊗[A] P) (Module.rankAtStalk_eq), the K-book’s definition.
- `TauCeti.RingK0.rankAtStalk_tensor` (relation): For finitely generated projective P, Q: rankAtStalk (P ⊗[A] Q) = rankAtStalk P · rankAtStalk Q (Module.rankAtStalk_tensorProduct); the object-level input from which Z.3 proves that rank is a ring homomorphism.
- `TauCeti.RingK0.rank_of_invertible` (simp): For an invertible module L (Module.Invertible A L), rank [L] = 1.
- `TauCeti.RingK0.rank_eq_const_iff` (characterisation): rank [P] = n (constant) ↔ ∀ p, P_p ≅ A_p^n.

**Unit tests.**

- `TauCeti.RingK0.rank_prod_field_test` (computation): For a field k, A = k × k, p₁ = ker(fst), p₂ = ker(snd): rank [k × 0] p₁ = 1, rank [k × 0] p₂ = 0 and rank [A] = 1.
- `TauCeti.RingK0.rank_zero_ring_test` (degenerate): For the zero ring, PrimeSpectrum is empty and rank = 0; rank [A] = 1 = 0 holds.
- `TauCeti.RingK0.rank_field_test` (compatibility): For a field k: rank x = LocallyConstant.const _ (RingK0.divisionRingEquiv x); rank [kⁿ] = n.
- `TauCeti.RingK0.rank_disconnected_test` (non-example): For A = k × k, rank [k × 0] is not constant; the single integer Module.finrank A (k × 0) is 0 (no element of k × 0 is A-linearly independent), which a definition of rank by finrank_A would wrongly return.
- `TauCeti.RingK0.rank_torsion_test` (non-example): For the ℤ-module ℤ/2 (not projective) the fibre dimension p ↦ finrank κ(p) (κ(p) ⊗ ℤ/2) is 1 at (2) and 0 at (0), so it is not locally constant ((0) lies in every neighbourhood of (2)), while rankAtStalk (ℤ/2) is identically 0: the two rank notions agree only on finitely generated projectives, which is where rank is defined.

**Acceptance.**

- rank [A] = 1 for every commutative A (vacuously for the zero ring).
- rank [A^n] = n; rank [P] = 0 iff P = 0 (Module.rankAtStalk_eq_zero_iff_subsingleton).

**Used by.**

- Weibel, II.2, Rank and H⁰ (PDF p. 79): rank : K₀(R) → H⁰(R) with H⁰(R) a direct summand and K̃₀(R) its kernel
- KTheoryLowDegrees:Z.3/augmentation: the augmentation ideal is the kernel of this map, normalised by ρ([P])(p) = rankAtStalk(P, p)
- KTheoryLowDegrees:Z.3/rank-lambda and Z.3/gamma-filtration-one: ranks of exterior coefficients and of γ-generators
- KTheoryLowDegrees:Z.4/rank-pic-equivalence: the rank coordinate of K₀(A) ≃ ℤ ⊕ Pic(A)
- KTheoryLowDegrees:Z.2/rank-section and Z.2/semilocal-k0: the section H⁰ → K₀ and the semilocal isomorphism
- SchemeKTheoryOperations:S.7: the affine degree-zero rank filtration uses the same map
- KTheoryLowDegrees:Z.6: the disconnected-ring test of the degree-zero comparison

**Depends on.** this roadmap: `Z.1/ring-k0`, `Z.2/local-freeness`; libraries: `mathlib:Module.rankAtStalk`, `mathlib:Module.isLocallyConstant_rankAtStalk`, `mathlib:Module.rankAtStalk_eq_of_equiv`, `mathlib:Module.rankAtStalk_prod`, `mathlib:Module.rankAtStalk_eq`, `mathlib:Module.rankAtStalk_eq_zero_iff_subsingleton`, `mathlib:Module.rankAtStalk_eq_finrank_of_free`, `mathlib:Module.rankAtStalk_tensorProduct`, `mathlib:Module.Invertible.finrank_eq_one`, `mathlib:ModuleCat.biprodIsoProd`, `mathlib:LocallyConstant`, `mathlib:IsLocallyConstant.range_finite`, `mathlib:PrimeSpectrum.compactSpace`, `tauceti:TauCeti.SplitK0.lift`.

**Sources.**

- `Kbook.2013`, Definition I.2.2.3 (Rank), PDF p. 19 (draft p. 11): “Let R be a commutative ring. The rank of a finitely generated R-module M at a prime ideal p of R is rankp(M) = dimk(p) M⊗Rk(p).” — The K-book’s rank at a prime, the fibre dimension; for finitely generated projectives it equals the stalk rank used here.
- `Kbook.2013`, Definition I.2.2.3 (Rank), PDF p. 19 (draft p. 11): “If P is a finitely generated projective R-module then rank(P): p 7→rankp(P) is a continuous function from the topological space Spec(R) to the discrete topological space N ⊂Z, as we see from Corollary 2.2.2.” — Continuity of the rank of a finitely generated projective.
- `Kbook.2013`, II.2, Rank and H0, PDF p. 79 (draft p. 71): “Recall from §I.2 that the rank of a projective module gives a map from P(R) to [Spec(R), N]. Since rank(P ⊕Q) = rank(P) + rank(Q) and rank(P ⊗Q) = rank(P) rank(Q) (by Ex. I.2.7, this is a semiring map. As such it induces a ring map” — The rank is additive (and multiplicative), hence induces a map K₀(R) → H⁰(R) = [Spec R, ℤ]; its multiplicativity on K₀ needs the ring structure of Z.3 (restructure).
- `Kbook.2013`, II.2, Rank and H0, definition, PDF p. 79 (draft p. 71): “When R is commutative, we write H0(R) for [Spec(R), Z], the ring of all continuous maps from Spec(R) to Z.” — H⁰(R) = [Spec(R), ℤ], realised as LocallyConstant (PrimeSpectrum A) ℤ.

### The rank is natural for scalar extension

`Z.2/rank-base-change` · lemma

Let f : A →+* B be a homomorphism of commutative rings. For every x ∈ RingK0 A, rank_B (RingK0.map f x) = (rank_A x).comap (PrimeSpectrum.comap f), i.e. rank_B(map f x)(q) = rank_A(x)(f⁻¹q). In particular, if [P] has constant rank n, so has [B ⊗_A P].

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.
- B is commutative; f : A →+* B.

**Proof.**

1. Both sides are additive in x; by RingK0.hom_ext it suffices to treat x = [P].
2. map f [P] = [B ⊗[A] P] (Z.1/ring-k0-map, commutative formula), and Module.rankAtStalk_baseChange gives rankAtStalk (B ⊗[A] P) q = rankAtStalk P (PrimeSpectrum.comap f q).
3. LocallyConstant.comap along the continuous map PrimeSpectrum.comap f is additive.

**Acceptance.**

- For fst : k × k → k: rank (map fst [k × 0]) = 1 and rank (map fst [0 × k]) = 0.
- For A → A/𝔪, 𝔪 maximal: rank (map x) is the constant value rank x (𝔪).

**Depends on.** this roadmap: `Z.2/rank-hom`, `Z.1/ring-k0-map`; libraries: `mathlib:Module.rankAtStalk_baseChange`, `mathlib:LocallyConstant.comap`, `mathlib:PrimeSpectrum.comap`.

**Sources.**

- `Kbook.2013`, Exercise I.2.12, PDF p. 25 (draft p. 17): “If P is a finitely generated projective R-module, show that rank(P ⊗R S) is the composition of f ∗and rank(P). In particular, if P has constant rank n, then so does P ⊗R S.” — The statement for modules (an exercise; the node’s proof is Mathlib’s rankAtStalk_baseChange), extended additively to K₀.

### Rank, localisation and the local ranks

`Z.2/rank-localization` · lemma

Let A be commutative. (a) For a submonoid S ⊆ A, rank_{S⁻¹A} (map (algebraMap A (Localization S)) x) is the restriction of rank_A x along Spec(S⁻¹A) → Spec A. (b) For p ∈ Spec A, (rank x)(p) = localEquiv_{A_p} (map (algebraMap A A_p) x), where localEquiv : RingK0 A_p ≃+ ℤ is Z.2/local-ring-k0. (c) ker rank = {x : map (A → A_p) x = 0 for every p ∈ Spec A}; equivalently the kernel of K₀(A) → ∏_p K₀(A_p).

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.

**Proof.**

1. (a) is Z.2/rank-base-change for the localisation map.
2. (b) Both sides are additive; on [P], map sends [P] to [A_p ⊗[A] P] ≅ [P_p] (LocalizedModule.equivTensorProduct), and localEquiv sends that to finrank_{A_p} P_p = rankAtStalk P p.
3. (c) By (b), rank x = 0 iff every image vanishes, localEquiv being injective.

**Acceptance.**

- For A = k × k: map to A_{p₁} ≅ k sends [k × 0] to 1 and [0 × k] to 0.
- For the ideal I = (2, 1 + √−5) of ℤ[√−5], [I] − [ℤ[√−5]] lies in ker rank: its image in every K₀(A_p) ≅ ℤ is 0.

**Depends on.** this roadmap: `Z.2/rank-base-change`, `Z.2/rank-hom`, `Z.2/local-ring-k0`, `Z.1/ring-k0-map`; libraries: `mathlib:LocalizedModule.equivTensorProduct`, `mathlib:Localization.AtPrime`.

**Sources.**

- `Kbook.2013`, Proof of Proposition II.2.5, PDF p. 81 (draft p. 73): “The kernel of the top arrow is eK0(R), so the left arrow factors as claimed.” — The source identifies K̃₀(R) = ker rank with the kernel of K₀(R) → ∏_p K₀(R_p).
- `Kbook.2013`, II.2, after Corollary 2.3.2, PDF p. 80 (draft p. 72): “Here is another interpretation of eK0(R): it is the intersection of the kernels of K0(R) →K0(F) over all maps R →F, F a field.” — The companion description of K̃₀(R) through maps to fields.

### Clopen classes and componentwise free modules

`Z.2/componentwise-free` · construction

Let A be commutative. For a clopen U ⊆ Spec A let e_U be the idempotent with D(e_U) = U (PrimeSpectrum.isIdempotentElemEquivClopens). The clopen module A_U := A·e_U is finitely generated projective with rankAtStalk A_U the indicator of U; A_U × A_V ≅ A_{U ∪ V} for disjoint U, V; A_∅ = 0 and A_{Spec A} = A. Its class is clopenClass U := [A_U]. For a locally constant f : Spec A → ℕ, the componentwise free module A^f := ∏_{n ∈ range f} (A_{f⁻¹(n)})^n is finitely generated projective with rank A^f = f and A^f × A^g ≅ A^{f+g}.

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.

**Proof.**

1. e_U is idempotent and A = A·e_U ⊕ A·(1 − e_U) (Z.1/idempotent-module-finite-projective for the 1 × 1 idempotent e_U), so A_U is finitely generated projective.
2. Localising at p: if p ∈ U = D(e_U), e_U is a unit and an idempotent in A_p, hence 1, so (A_U)_p = A_p has rank one; if p ∉ U, e_U ∈ p and 1 − e_U is a unit, so e_U = 0 in A_p and (A_U)_p = 0.
3. For disjoint U, V: e_{U ∪ V} = e_U + e_V and e_U e_V = 0 (isIdempotentElemEquivClopens_symm_sup and _symm_inf), so A·e_{U ∪ V} = A·e_U ⊕ A·e_V internally.
4. range f is finite (IsLocallyConstant.range_finite) with clopen fibres; A^f is a finite product of finitely generated projectives, and at p its rank is f(p) (Module.rankAtStalk_pi, Module.rankAtStalk_prod).
5. A^f × A^g ≅ A^{f+g}: refine both sides along the clopen partition {f⁻¹(a) ∩ g⁻¹(b)} using the disjoint-union isomorphism.

**API.**

- `TauCeti.RingK0.clopenModule` (constructor): clopenModule U := Ideal.span {e_U} = A·e_U for U : TopologicalSpace.Clopens (PrimeSpectrum A).
- `TauCeti.RingK0.clopenModule_finiteProjective` (instance): clopenModule U is finitely generated projective.
- `TauCeti.RingK0.rankAtStalk_clopenModule` (simp): rankAtStalk (clopenModule U) = Set.indicator U 1.
- `TauCeti.RingK0.clopenModule_union` (relation): For disjoint U, V: clopenModule (U ⊔ V) ≃ₗ clopenModule U × clopenModule V.
- `TauCeti.RingK0.clopenModule_top` (simp): clopenModule ⊤ ≃ₗ A; clopenModule ⊥ = 0.
- `TauCeti.RingK0.clopenClass` (constructor): clopenClass U := [clopenModule U] ∈ RingK0 A.
- `TauCeti.RingK0.clopenClass_union` (relation): clopenClass (U ⊔ V) = clopenClass U + clopenClass V for disjoint U, V.
- `TauCeti.RingK0.rank_clopenClass` (simp): rank (clopenClass U) is the indicator of U.
- `TauCeti.RingK0.componentwiseFree` (constructor): componentwiseFree f for f : LocallyConstant (PrimeSpectrum A) ℕ.
- `TauCeti.RingK0.rank_componentwiseFree` (simp): rank [componentwiseFree f] = f.
- `TauCeti.RingK0.componentwiseFree_add` (relation): componentwiseFree (f + g) ≃ₗ componentwiseFree f × componentwiseFree g.
- `TauCeti.RingK0.componentwiseFree_const` (simp): componentwiseFree (const n) ≃ₗ (Fin n → A).

**Unit tests.**

- `TauCeti.RingK0.clopenClass_prod_test` (computation): For A = k × k and U = {p₁}: clopenModule U = k × 0 and rank (clopenClass U) is the indicator of {p₁}.
- `TauCeti.RingK0.componentwiseFree_const_test` (degenerate): componentwiseFree 0 = 0 and componentwiseFree (const n) ≃ₗ A^n; over the zero ring everything is 0.
- `TauCeti.RingK0.clopenClass_connected_test` (characterisation): If Spec A is connected, the clopen classes are exactly 0 and [A].
- `TauCeti.RingK0.componentwiseFree_not_free_test` (non-example): For A = k × k and f with f(p₁) = 1, f(p₂) = 2, componentwiseFree f ≅ k × k² is projective but not free (its rank is not constant).

**Acceptance.**

- A^{const n} ≅ A^n.
- For A = k × k and U = {p₁} = D((1, 0)): A_U = k × 0.

**Used by.**

- Weibel, Example I.2.2.4 and II.2 (Rank and H⁰): the submonoid L of componentwise free modules is cofinal and gives H⁰(R) ⊂ K₀(R)
- KTheoryLowDegrees:Z.2/rank-section: the section of rank is built from clopen classes
- KTheoryLowDegrees:Z.2/connected-iff-constant-rank: an idempotent e gives the module A·e whose rank is the indicator of D(e)
- KTheoryLowDegrees:Z.2/rank-fibre-decomposition: the idempotents of the rank fibres
- KTheoryLowDegrees:Z.3/determinant-projective: rank-zero components contribute A_U to the componentwise determinant

**Depends on.** this roadmap: `Z.1/idempotent-module-finite-projective`, `Z.2/rank-hom`; libraries: `mathlib:PrimeSpectrum.isIdempotentElemEquivClopens`, `mathlib:PrimeSpectrum.basicOpen_isIdempotentElemEquivClopens_symm`, `mathlib:PrimeSpectrum.isIdempotentElemEquivClopens_symm_sup`, `mathlib:PrimeSpectrum.isIdempotentElemEquivClopens_symm_inf`, `mathlib:Module.rankAtStalk_pi`, `mathlib:Module.rankAtStalk_prod`, `mathlib:IsLocallyConstant.range_finite`.

**Sources.**

- `Kbook.2013`, Example I.2.2.4 (Componentwise free modules), PDF p. 19 (draft p. 11): “Clearly Rf has constant rank ni at every prime in Spec(Ri) and rank(Rf) = f. For n ≥max{ni}, Rf ⊕R^{n−f} = R^n, so Rf is a finitely generated projective R-module.” — The componentwise free module R_f, its rank f and its projectivity.
- `Kbook.2013`, Example I.2.2.4 (Componentwise free modules), PDF p. 19 (draft p. 11): “In fact, f takes only finitely many values (say n1, . . . , nc), and it is possible to write R as R1 × · · · × Rc such that f^−1(ni) is homeomorphic to Spec(Ri).” — The decomposition of R along the finitely many fibres of a continuous f : Spec R → ℕ.
- `Kbook.2013`, Example I.2.1.1(3), componentwise free modules, PDF p. 16 (draft p. 8): “Another type of projective module arises for rings of the form R = R1 × R2; both P = R1 × 0 and Q = 0 × R2 are projective but cannot be free because the element e = (0, 1) ∈R satisfies Pe = 0 yet R^n e̸ = 0.” — The basic case R = R₁ × R₂ with P = R₁ × 0 projective but not free.

### H⁰ as a direct summand of K₀

`Z.2/rank-section` · construction · planet “H⁰ as a direct summand of K₀”

For commutative A, RingK0.rankSection : LocallyConstant (PrimeSpectrum A) ℤ →+ RingK0 A, f ↦ Σ_{n ∈ range f} n • clopenClass (f⁻¹(n)), is additive and satisfies rank ∘ rankSection = id; for f ≥ 0, rankSection f = [A^f]. Hence rank is surjective and RingK0 A ≃+ LocallyConstant (PrimeSpectrum A) ℤ × ker rank, x ↦ (rank x, x − rankSection (rank x)). In the K-book’s notation K₀(R) ≅ H⁰(R) ⊕ K̃₀(R).

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.

**Proof.**

1. f has finite range with clopen fibres, so the sum is finite and well defined.
2. Independence of the partition: for any finite clopen partition {U_j} on which f is constant, Σ_j f(U_j)·clopenClass U_j = rankSection f, by clopenClass_union on the fibres.
3. Additivity: compute rankSection f, rankSection g and rankSection (f + g) on the common refinement {f⁻¹(a) ∩ g⁻¹(b)}.
4. rank ∘ rankSection = id by linearity and rank_clopenClass: rank (rankSection f) = Σ_n n·1_{f⁻¹(n)} = f.
5. The splitting is the formal consequence of a section of a surjective homomorphism of abelian groups.

**API.**

- `TauCeti.RingK0.rankSection` (constructor): rankSection : LocallyConstant (PrimeSpectrum A) ℤ →+ RingK0 A.
- `TauCeti.RingK0.rank_rankSection` (simp): rank (rankSection f) = f.
- `TauCeti.RingK0.rankSection_const` (simp): rankSection (const n) = n • [A].
- `TauCeti.RingK0.rankSection_indicator` (simp): rankSection (indicator of U) = clopenClass U.
- `TauCeti.RingK0.rankSection_of_nonneg` (characterisation): For f ≥ 0, rankSection f = [componentwiseFree f].
- `TauCeti.RingK0.rank_surjective` (other): Function.Surjective rank.
- `TauCeti.RingK0.rankSplitting` (equivalence): RingK0 A ≃+ LocallyConstant (PrimeSpectrum A) ℤ × (ker rank).

**Unit tests.**

- `TauCeti.RingK0.rankSection_prod_test` (computation): For A = k × k: rankSection (indicator {p₁}) = [k × 0] and rankSection 1 = [A].
- `TauCeti.RingK0.rankSection_zero_test` (degenerate): rankSection 0 = 0; over the zero ring rankSection is the zero map between trivial groups.
- `TauCeti.RingK0.rankSection_connected_test` (compatibility): If Spec A is connected, rankSection (const n) = n[A], the section of Z.2/rank-connected.
- `TauCeti.RingK0.rankSection_not_scalar_test` (non-example): rankSection is not f ↦ (integer)·[A]: for A = k × k, rankSection (indicator {p₁}) = [k × 0] is not a multiple of [A], its rank not being constant.

**Acceptance.**

- rankSection (const n) = n•[A].
- For A = k × k, rankSection (a at p₁, b at p₂) = a[k × 0] + b[0 × k].

**Used by.**

- Weibel, Definition II.2.3: K̃₀(R) := ker(rank) and the natural decomposition K₀(R) ≅ H⁰(R) ⊕ K̃₀(R)
- KTheoryLowDegrees:Z.3/augmentation: the augmentation ideal ker rank is complemented by this section
- KTheoryLowDegrees:Z.4/rank-pic-equivalence: in the connected case the section is n ↦ n[A], used in the inverse (n, L) ↦ (n − 1)[A] + [L]
- KTheoryLowDegrees:Z.2/semilocal-k0: the inverse of the semilocal rank isomorphism

**Depends on.** this roadmap: `Z.2/componentwise-free`, `Z.2/rank-hom`; libraries: `mathlib:LocallyConstant`, `mathlib:IsLocallyConstant.range_finite`.

**Sources.**

- `Kbook.2013`, II.2, Rank and H0, PDF p. 79 (draft p. 71): “H0(R) is a subring of K0(R). To see this, consider the submonoid L of P(R) consisting of componentwise free modules Rf.” — H⁰(R) inside K₀(R) through the componentwise free modules.
- `Kbook.2013`, II.2, Rank and H0, PDF p. 79 (draft p. 71): “Since rank(Rf) = f for every componentwise free module, the composition H0(R) ⊂K0(R) →H0(R) is the identity. Thus H0(R) is a direct summand of K0(R).” — The composite H⁰(R) → K₀(R) → H⁰(R) is the identity, so H⁰(R) is a direct summand.

### The rank-fibre decomposition of a projective module

`Z.2/rank-fibre-decomposition` · construction

Let A be commutative and P finitely generated projective. Let n₁ < … < n_c be the values of rankAtStalk P, U_i := rank⁻¹(n_i) (clopen, partitioning Spec A) and e_i := e_{U_i}. Then (e_i) is a complete family of orthogonal idempotents; A ≃+* ∏_i A_i with A_i := A ⧸ (1 − e_i) and Spec A_i ≅ U_i; P ≃ₗ ∏_i P_i with P_i := e_i P ≅ A_i ⊗_A P; and each P_i is a finitely generated projective A_i-module of constant rank n_i. The same holds for any finite clopen partition refining the rank fibres, which is how several modules are decomposed at once.

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.

**Proof.**

1. Finitely many values: Z.2/rank-hom. The fibres are clopen since rankAtStalk P is locally constant.
2. Idempotents: e_i := isIdempotentElemEquivClopens.symm U_i; orthogonality from disjointness and completeness from the union being Spec A (isIdempotentElemEquivClopens_symm_inf, _symm_sup and Z.2/componentwise-free), which is CompleteOrthogonalIdempotents.
3. Ring decomposition: CompleteOrthogonalIdempotents.bijective_pi gives A ≃ ∏_i A ⧸ (1 − e_i); Spec(A ⧸ (1 − e_i)) = V(1 − e_i) = D(e_i) = U_i (PrimeSpectrum.zeroLocus_eq_basicOpen_of_isIdempotentElem).
4. Module decomposition: Σ e_i = 1 and e_i e_j = 0 give P = ⊕ e_i P internally; e_i P ≅ A_i ⊗_A P is finitely generated projective over A_i (Z.1/extend-scalars-finite-projective), of rank n_i at every point of U_i by Z.2/rank-base-change.

**API.**

- `TauCeti.RingK0.rankFibres` (data): The finite set of values of rankAtStalk P.
- `TauCeti.RingK0.rankFibreIdempotent` (data): e_n for n ∈ rankFibres P, with basicOpen (e_n) = rank⁻¹(n).
- `TauCeti.RingK0.completeOrthogonalIdempotents_rankFibre` (characterisation): CompleteOrthogonalIdempotents (rankFibreIdempotent P).
- `TauCeti.RingK0.rankFibreRingEquiv` (equivalence): A ≃+* ∏_{n ∈ rankFibres P} A ⧸ (1 − e_n).
- `TauCeti.RingK0.rankFibreModuleEquiv` (equivalence): P ≃ₗ[A] ∏_n e_n • P.
- `TauCeti.RingK0.rankAtStalk_rankFibre` (simp): The n-th component has constant rank n over A ⧸ (1 − e_n).
- `TauCeti.RingK0.rankFibre_refine` (other): For any finite clopen partition refining the fibres of P, the analogous decomposition exists and regroups to the fibre decomposition.

**Unit tests.**

- `TauCeti.RingK0.rankFibres_constant_test` (degenerate): For P = A^n (A ≠ 0) rankFibres P = {n} and e_n = 1; for P = 0 it is {0}.
- `TauCeti.RingK0.rankFibres_prod_test` (computation): For A = k × k and P = k × k²: rankFibres P = {1, 2}, e₁ = (1, 0), e₂ = (0, 1), and the components are k and k².
- `TauCeti.RingK0.rankFibres_connected_test` (characterisation): Spec A is connected iff every finitely generated projective has a single rank fibre (Z.2/connected-iff-constant-rank).
- `TauCeti.RingK0.rankFibres_not_components_test` (non-example): The fibres are not the connected components: for A = k × k × k and P = A there is one fibre but three components.

**Acceptance.**

- If P has constant rank n there is one fibre and e = 1.
- For A = k × k and P = k × k²: fibres {p₁} (rank 1) and {p₂} (rank 2), P₁ = k, P₂ = k².

**Used by.**

- Weibel, Example I.2.2.4 and I.3 (the componentwise determinant recipe): reduction of statements about projectives to constant rank
- KTheoryLowDegrees:Z.3/determinant-projective and Z.3/determinant-sum: “Import the clopen rank/idempotent decomposition from Z.2”: det(P) is formed on the rank fibres
- KTheoryLowDegrees:Z.3/gamma-filtration: the component argument for disconnected rank
- KTheoryLowDegrees:Z.2/semilocal-k0: decomposition along the connected components

**Depends on.** this roadmap: `Z.2/rank-hom`, `Z.2/componentwise-free`, `Z.2/rank-base-change`, `Z.1/extend-scalars-finite-projective`; libraries: `mathlib:CompleteOrthogonalIdempotents`, `mathlib:CompleteOrthogonalIdempotents.bijective_pi`, `mathlib:PrimeSpectrum.isIdempotentElemEquivClopens`, `mathlib:PrimeSpectrum.isIdempotentElemEquivClopens_symm_sup`, `mathlib:PrimeSpectrum.isIdempotentElemEquivClopens_symm_inf`, `mathlib:PrimeSpectrum.zeroLocus_eq_basicOpen_of_isIdempotentElem`.

**Sources.**

- `Kbook.2013`, Example I.2.2.4, last paragraph, PDF p. 19 (draft p. 11): “Then each component Pi = P ⊗R Ri of P is a projective Ri-module of constant rank and there is an R-module isomorphism P ∼= P1 × · · · × Pc.” — The components P_i = P ⊗_R R_i of constant rank and P ≅ P₁ × ⋯ × P_c.
- `Kbook.2013`, Exercise I.2.4, PDF p. 23 (draft p. 15): “If R is a commutative ring and f : Spec(R) →Z is a continuous function, show that we can write R = R1×· · ·×Rc in such a way that Spec(R) is the disjoint union of the Spec(Ri), and f is constant on each of the components Spec(Ri) of R.” — The decomposition of R along a continuous function; the node uses Mathlib’s idempotent–clopen correspondence instead of the exercise’s route through the reduced ring (whose hint is misprinted, sourceIssues).

### Connected spectrum, constant rank and idempotents

`Z.2/connected-iff-constant-rank` · theorem

For a nontrivial commutative ring A the following are equivalent: (1) Spec A is connected; (2) every finitely generated projective A-module has constant rank; (3) the only idempotents of A are 0 and 1. For the zero ring (1) fails while (2) and (3) hold vacuously; the K-book’s convention 1 ≠ 0 excludes it.

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.
- A is nontrivial.

**Proof.**

1. (1) ⇒ (2): a locally constant function on a preconnected space is constant (IsLocallyConstant.apply_eq_of_preconnectedSpace), applied to rankAtStalk P.
2. (2) ⇒ (3): for an idempotent e, the module A·e has rank the indicator of D(e) (Z.2/componentwise-free); constancy forces D(e) = ∅ or D(e) = Spec A, hence e = 0 or e = 1 (PrimeSpectrum.basicOpen_injOn_isIdempotentElem).
3. (3) ⇔ (1): TauCeti.connectedSpace_primeSpectrum_iff_idempotent_eq_zero_or_one.

**Acceptance.**

- ℤ is connected; ℤ × ℤ is not, with the idempotent (1, 0) and the non-constant rank of ℤ × 0.
- ℤ/6 is not connected: 3 is idempotent (9 ≡ 3 mod 6) and the module 3·ℤ/6 ≅ ℤ/2 has rank 1 at (2) and 0 at (3).

**Depends on.** this roadmap: `Z.2/componentwise-free`, `Z.2/rank-hom`; libraries: `mathlib:IsLocallyConstant.apply_eq_of_preconnectedSpace`, `mathlib:PrimeSpectrum.basicOpen_injOn_isIdempotentElem`, `tauceti:TauCeti.connectedSpace_primeSpectrum_iff_idempotent_eq_zero_or_one`.

**Sources.**

- `Kbook.2013`, Exercise I.2.5, PDF p. 23 (draft p. 15): “Show that the following are equivalent for every commutative ring R: (1) Spec(R) is topologically connected (2) Every finitely generated projective R-module has constant rank (3) R has no idempotent elements except 0 and 1.” — The statement (an exercise; the proof steps are given in full).
- `Kbook.2013`, I.2, after Definition 2.2.3, PDF p. 19 (draft p. 11): “If Spec(R) is topologically connected, every continuous function Spec(R) →N must be constant, so every finitely generated projective R-module has constant rank.” — The implication (1) ⇒ (2), proved in the text.

### The integer rank on a connected spectrum

`Z.2/rank-connected` · construction

Let A be commutative with ConnectedSpace (PrimeSpectrum A). Then RingK0.rankℤ : RingK0 A →+ ℤ, rankℤ x := (rank x)(p) for any p ∈ Spec A (independent of p), satisfies rankℤ [P] = rankAtStalk P p and rankℤ [A] = 1; it is surjective with section n ↦ n•[A], so RingK0 A ≃+ ℤ × ker rankℤ; and rank x = LocallyConstant.const _ (rankℤ x). Without connectedness no such integer exists in general (Z.2/connected-iff-constant-rank).

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.
- Spec A is connected; in particular A is nontrivial.

**Proof.**

1. A locally constant function on a connected space is constant (IsLocallyConstant.eq_const, IsLocallyConstant.apply_eq_of_preconnectedSpace); ConnectedSpace gives a point p₀, set rankℤ x := rank x p₀, and prove independence of p₀.
2. Additivity from Z.2/rank-hom; rankℤ [A] = 1 from rank_one; the section and the splitting are formal.

**API.**

- `TauCeti.RingK0.rankℤ` (constructor): rankℤ : RingK0 A →+ ℤ for [ConnectedSpace (PrimeSpectrum A)].
- `TauCeti.RingK0.rankℤ_of` (simp): rankℤ [P] = rankAtStalk P p for every p.
- `TauCeti.RingK0.rankℤ_one` (simp): rankℤ [A] = 1.
- `TauCeti.RingK0.rank_eq_const` (characterisation): rank x = LocallyConstant.const _ (rankℤ x).
- `TauCeti.RingK0.rankℤ_surjective` (other): rankℤ is surjective, split by n ↦ n • [A].
- `TauCeti.RingK0.rankℤ_map` (compatibility): For f : A →+* B with both spectra connected: rankℤ (map f x) = rankℤ x.
- `TauCeti.RingK0.rankℤSplitting` (equivalence): RingK0 A ≃+ ℤ × ker rankℤ.

**Unit tests.**

- `TauCeti.RingK0.rankℤ_int_test` (computation): For A = ℤ: rankℤ [ℤⁿ] = n.
- `TauCeti.RingK0.rankℤ_field_test` (compatibility): For a field k, rankℤ = RingK0.divisionRingEquiv k.
- `TauCeti.RingK0.rankℤ_local_test` (degenerate): For a commutative local ring, rankℤ [P] = finrank A P.
- `TauCeti.RingK0.rankℤ_disconnected_test` (non-example): For A = k × k the hypothesis fails and no p gives a well-defined rankℤ: rank [k × 0] takes the values 1 and 0.

**Acceptance.**

- rankℤ [A^n] = n.
- For a domain, rankℤ [P] = finrank_K (K ⊗ P) (Z.2/rank-domain).

**Used by.**

- Weibel, I.2 and II.2: “If R is a domain, or more generally if Spec(R) is connected, then H⁰(R) = ℤ”
- KTheoryLowDegrees:Z.4/projective-class-normal-form and Z.4/rank-pic-equivalence: the integer rank of a Dedekind domain
- KTheoryLowDegrees:Z.2/semilocal-connected-k0 and Z.2/local-ring-k0: the isomorphism K₀ ≅ ℤ in the connected semilocal and local cases
- KTheoryLowDegrees:Z.5: rank on a connected regular curve

**Depends on.** this roadmap: `Z.2/rank-hom`; libraries: `mathlib:IsLocallyConstant.apply_eq_of_preconnectedSpace`, `mathlib:IsLocallyConstant.eq_const`, `mathlib:LocallyConstant.const`.

**Sources.**

- `Kbook.2013`, I.2, after Definition 2.2.3, PDF p. 19 (draft p. 11): “If Spec(R) is topologically connected, every continuous function Spec(R) →N must be constant, so every finitely generated projective R-module has constant rank.” — On a connected spectrum every finitely generated projective has constant rank.
- `Kbook.2013`, II.2, Rank and H0, definition, PDF p. 79 (draft p. 71): “When R is commutative, we write H0(R) for [Spec(R), Z], the ring of all continuous maps from Spec(R) to Z.” — H⁰(R) = [Spec R, ℤ], which is ℤ when Spec R is connected.

### The rank over a domain is the dimension over the fraction field

`Z.2/rank-domain` · lemma

Let A be a commutative domain with fraction field K (IsFractionRing A K). For every finitely generated projective P and every p ∈ Spec A, rankAtStalk P p = finrank_K (K ⊗[A] P) = finrank_A P. Hence Spec A is connected and rankℤ [P] = finrank_K (K ⊗[A] P) = rankℤ_K (map (algebraMap A K) [P]); a nonzero projective ideal has rankℤ equal to 1.

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.
- A is a domain; K is its fraction field.

**Proof.**

1. The zero ideal is a prime contained in every prime, so every point of Spec A lies in the closure of (0); Spec A is irreducible, hence connected.
2. At p = (0), A_p = K and P_p ≅ K ⊗[A] P (LocalizedModule.equivTensorProduct and the IsFractionRing identification), so rankAtStalk P (0) = finrank_K (K ⊗ P); by Z.2/rank-connected it is the value at every p. Ideal.finrank_fiber_eq_finrank gives the equality with finrank_A P.
3. The formula through K is Z.2/rank-base-change for A → K.
4. For a nonzero ideal I, K ⊗ I → K ⊗ A = K is injective (K is flat) and surjective (I contains a nonzero element, invertible in K), so rank one.

**Acceptance.**

- rankℤ [ℤⁿ] = n over ℤ.
- For I = (2, 1 + √−5) ⊆ ℤ[√−5], rankℤ [I] = 1 (Z.2/nonfree-projective-ideal).

**Depends on.** this roadmap: `Z.2/rank-connected`, `Z.2/rank-base-change`; libraries: `mathlib:Ideal.finrank_fiber_eq_finrank`, `mathlib:LocalizedModule.equivTensorProduct`, `mathlib:IsFractionRing`.

**Sources.**

- `Kbook.2013`, I.2, after Definition 2.2.3, PDF p. 19 (draft p. 11): “For example, suppose that R is an integral domain with field of fractions F; then Spec(R) is connected, and every finitely generated projective R-module P has constant rank: rank(P) = dimF (P ⊗R F).” — The statement: over a domain the rank is constant, equal to dim_F(P ⊗_R F).
- `Kbook.2013`, Proposition I.3.5 and its proof, PDF p. 28 (draft p. 20): “As R is an integral domain and I ⊆F, rank(I) is the constant dimF (I ⊗R F) = dimF (F) = 1. Hence I is a line bundle.” — The ideal case: rank(I) = dim_F(I ⊗_R F) = dim_F(F) = 1.

### K₀ of a division ring

`Z.2/division-ring-k0` · construction · planet “K₀ of a division ring”

For a division ring D : Type u, the object properties finiteProjectiveModules D and ModuleCat.isFG D coincide, so ObjectProperty.fullSubcategoryCongr gives (finiteProjectiveModules D).FullSubcategory ≌ FGModuleCat D; composing SplitK0.mapEquiv of it with the existing SplitK0.finrankEquiv gives RingK0.divisionRingEquiv : RingK0 D ≃+ ℤ, [P] ↦ finrank_D P, with [D] ↦ 1 and inverse n ↦ n•[D]. This is the existing categorical computation of K₀ of finite-dimensional vector spaces transported to the ring K₀ of Z.1.

**Hypotheses.**

- D is a division ring, not necessarily commutative.
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. TauCeti.finiteProjectiveModules_le_finiteModules and TauCeti.finiteModules_le_finiteProjectiveModules (D is semisimple, every module is projective: Module.projective_of_isSemisimpleRing) give equality of the two object properties.
2. fullSubcategoryCongr is the identity on objects and morphisms, hence additive; SplitK0.mapEquiv transports split K₀ along it.
3. SplitK0.finrankEquiv (Small.{u} D holds as D : Type u) and SplitK0.finrankEquiv_of give the value finrank_D P on classes; finrank_D D = 1.

**API.**

- `TauCeti.RingK0.divisionRingEquiv` (equivalence): divisionRingEquiv D : RingK0 D ≃+ ℤ.
- `TauCeti.RingK0.divisionRingEquiv_of` (simp): divisionRingEquiv D [P] = finrank D P.
- `TauCeti.RingK0.divisionRingEquiv_one` (simp): divisionRingEquiv D [D] = 1.
- `TauCeti.RingK0.divisionRingEquiv_symm_apply` (simp): (divisionRingEquiv D).symm n = n • [D].
- `TauCeti.RingK0.divisionRingEquiv_eq_rankℤ` (compatibility): For a field k: divisionRingEquiv k = rankℤ.
- `TauCeti.RingK0.divisionRingEquiv_map` (compatibility): For a ring homomorphism f : D → D′ of division rings: divisionRingEquiv D′ (map f x) = divisionRingEquiv D x.
- `TauCeti.RingK0.fgModuleCatEquiv` (equivalence): RingK0 D ≃+ SplitK0 (FGModuleCat D), the transport used.

**Unit tests.**

- `TauCeti.RingK0.divisionRingEquiv_quaternion_test` (computation): For Hamilton’s quaternions ℍ[ℝ], a noncommutative division ring: [ℍ²] ↦ 2.
- `TauCeti.RingK0.divisionRingEquiv_zero_test` (degenerate): [0] ↦ 0 and [D] ↦ 1.
- `TauCeti.RingK0.divisionRingEquiv_finrankEquiv_test` (compatibility): divisionRingEquiv D x = SplitK0.finrankEquiv D (fgModuleCatEquiv x): agreement with the existing categorical computation.
- `TauCeti.RingK0.divisionRingEquiv_subfield_test` (non-example): The dimension is over D itself: for D = ℂ, [ℂ] ↦ 1, not dim_ℝ ℂ = 2.

**Acceptance.**

- [D³] ↦ 3.
- The field case agrees with rankℤ.

**Used by.**

- Weibel, II.2 (PDF p. 76): K₀ of a field or division ring is ℤ by dimension
- KTheoryLowDegrees:Z.2/local-ring-k0: composed with K₀(R) → K₀(R/m)
- KTheoryLowDegrees:Z.2/integer-summand and Z.2/matrix-division-ring-k0: splitting of the free class and K₀ of matrix rings over D
- KTheoryLowDegrees:Z.2/rank-domain: the fraction-field formula for the rank
- KTheoryLowDegrees:Z.6: the required field test of the degree-zero comparison
- KTheoryFiniteLocalFields:L.1: K₀(𝔽_q) = ℤ is the finite-field case; L.1 imports it

**Depends on.** this roadmap: `Z.1/ring-k0`; libraries: `tauceti:TauCeti.finiteProjectiveModules_le_finiteModules`, `tauceti:TauCeti.finiteModules_le_finiteProjectiveModules`, `mathlib:Module.projective_of_isSemisimpleRing`, `mathlib:CategoryTheory.ObjectProperty.fullSubcategoryCongr`, `mathlib:FGModuleCat`, `tauceti:TauCeti.SplitK0.mapEquiv`, `tauceti:TauCeti.SplitK0.finrankEquiv`, `tauceti:TauCeti.SplitK0.finrankEquiv_of`.

**Sources.**

- `Kbook.2013`, II.2, PDF p. 76 (draft p. 68): “For example, let k be a field or division ring. Then the abelian monoid P(k) is isomorphic to N = {0, 1, 2, . . . }, so K0(k) = Z. The same argument applies to show that K0(R) = Z for every local ring R” — K₀(k) = ℤ for a field or division ring, because P(k) ≅ ℕ by dimension.

### A map to a division ring splits the free class

`Z.2/integer-summand` · lemma

Let R be a ring (not necessarily commutative) and φ : R →+* D a ring homomorphism to a division ring. Then divisionRingEquiv ∘ RingK0.map φ : RingK0 R →+ ℤ sends [R] to 1, so freeClass : ℤ →+ RingK0 R, n ↦ n•[R], is split injective and RingK0 R ≃+ ℤ × ker(divisionRingEquiv ∘ map φ). Every nonzero commutative ring admits such φ, to A/𝔪 for a maximal ideal 𝔪.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. map φ [R] = [D] (Z.1/ring-k0-map) and divisionRingEquiv [D] = 1 (Z.2/division-ring-k0).
2. A retraction of freeClass gives the splitting; in particular freeClass is injective (compare Z.1/free-class-ibn).
3. For commutative A ≠ 0, Ideal.exists_maximal gives 𝔪 and A/𝔪 is a field.

**Acceptance.**

- For R = ℤ[G] and the augmentation ℤ[G] → ℤ → ℚ, K₀(ℤ[G]) ≅ ℤ × ker.
- For R = M₂(k) there is no ring map to a division ring (M₂(k) is simple and contains nonzero nilpotents), and indeed freeClass has image of index 2 and does not split.

**Depends on.** this roadmap: `Z.1/ring-k0-map`, `Z.2/division-ring-k0`, `Z.1/free-class-ibn`; libraries: `mathlib:Ideal.exists_maximal`.

**Sources.**

- `Kbook.2013`, Example II.2.1.1, PDF pp. 76–77 (draft pp. 68–69): “Suppose that R is commutative, or more generally that there is a ring map R →F to a field F. In this case Z is a direct summand of K0(R), because the map K0(R) →K0(F) ∼= Z takes [R] to 1.” — The statement for a ring map to a field; the proof uses only K₀ of the target ≅ ℤ, so division rings are allowed.
- `Kbook.2013`, Example II.2.1.2 (Simple rings), PDF p. 77 (draft p. 69): “Thus length is an abelian group isomorphism K0(Mn(F)) ∼= −→Z sending [V ] to 1. Since R has length n, the subgroup of K0(R) ∼= Z generated by the free modules has index n. In particular, the inclusion Z ⊂K0(R) of Lemma 2.1 does not split.” — The contrast: for M_n(F) the free subgroup has index n and the inclusion does not split.

### K₀ of a principal ideal domain

`Z.2/pid-k0` · application

If A is a principal ideal domain (IsDomain A, IsPrincipalIdealRing A), every finitely generated projective A-module is free, and rankℤ : RingK0 A ≃+ ℤ, [P] ↦ finrank_A P, with inverse n ↦ n•[A]. In particular RingK0 ℤ ≃+ ℤ with [ℤ] ↦ 1.

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.
- A is a principal ideal domain.

**Proof.**

1. A projective module is a direct summand of a free module (Z.1/free-summand-data), hence torsion-free; a finitely generated torsion-free module over a PID is free (Module.free_of_finite_type_torsion_free').
2. Hence [P] = (finrank_A P)•[A]; Spec A is connected (a domain, Z.2/rank-domain), and rankAtStalk of a free module is its finrank (Module.rankAtStalk_eq_finrank_of_free), so rankℤ is bijective with inverse n ↦ n[A] (Z.2/rank-connected).

**Acceptance.**

- RingK0 ℤ ≃+ ℤ sends [ℤ³] to 3.
- RingK0 k[X] ≃+ ℤ for a field k.

**Depends on.** this roadmap: `Z.1/free-summand-data`, `Z.2/rank-connected`, `Z.2/rank-domain`; libraries: `mathlib:Module.free_of_finite_type_torsion_free'`, `mathlib:Module.rankAtStalk_eq_finrank_of_free`.

**Sources.**

- `Kbook.2013`, II.2, PDF p. 76 (draft p. 68): “(by the Structure Theorem for modules over a PID). In particular, K0(Z) = Z.” — K₀(R) = ℤ for a PID by the structure theorem; in particular K₀(ℤ) = ℤ.
- `Kbook.2013`, Example I.2.1.2, PDF p. 17 (draft p. 9): “If R is a Principal Ideal Domain (PID), such as Z or F[x], F a field, then all projective R-modules are free.” — Projective modules over a PID are free.

### Matrices over a local ring that are invertible modulo the maximal ideal

`Z.2/local-matrix-lift` · lemma

Let R be a ring and m a two-sided ideal with m ≠ R such that every element of R outside m is a unit (the K-book’s local ring; for commutative R this is IsLocalRing R with m its maximal ideal). Then (i) R ⧸ m is a division ring; (ii) m is contained in the Jacobson radical of R, so 1 + x is a unit for every x ∈ m; (iii) for every n, a matrix A ∈ M_n(R) whose image in M_n(R ⧸ m) is invertible is invertible in M_n(R).

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- m is a two-sided ideal (m : Ideal R with [m.IsTwoSided], so that R ⧸ m is a ring by Ideal.Quotient.ring; Ideal.toTwoSided m is the TwoSidedIdeal the Jacobson-radical lemmas take) with m ≠ ⊤ and ∀ x ∉ m, IsUnit x.

**Proof.**

1. (i) A nonzero class ū has a representative u ∉ m, a unit with uv = vu = 1, so ū v̄ = v̄ ū = 1; 1 ∉ m gives R ⧸ m ≠ 0.
2. (ii) For x ∈ m and every y, yx ∈ m, so 1 + yx ∉ m (otherwise 1 ∈ m) and 1 + yx is a unit; TwoSidedIdeal.mem_jacobson_iff then gives x ∈ jacobson ⊥. An element 1 + j with j in the Jacobson radical has a left inverse z; z = 1 − zj is again of that form, so z has a left inverse too and 1 + j is a unit.
3. (iii) TwoSidedIdeal.jacobson_matrix with TwoSidedIdeal.matrix_jacobson_bot gives M_n(m) ⊆ M_n(jacobson ⊥) = jacobson of ⊥ in M_n(R). Choose B with ĀB̄ = B̄Ā = 1; AB and BA lie in 1 + M_n(m), hence are units by (ii) in M_n(R), so A has the right inverse B(AB)⁻¹ and the left inverse (BA)⁻¹B and is a unit.

**Acceptance.**

- For R = ℤ_(p) and m = pℤ_(p): A with rows (1, p) and (p, 1) reduces to 1, so it is invertible (its determinant is 1 − p²).
- The hypothesis is needed: over ℤ with the ideal (2), the 1 × 1 matrix (3) is invertible modulo 2 but not over ℤ (3 ∉ (2) is not a unit).

**Depends on.** libraries: `mathlib:TwoSidedIdeal`, `mathlib:TwoSidedIdeal.jacobson`, `mathlib:TwoSidedIdeal.mem_jacobson_iff`, `mathlib:TwoSidedIdeal.jacobson_matrix`, `mathlib:TwoSidedIdeal.matrix_jacobson_bot`, `mathlib:RingHom.mapMatrix`, `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`, `mathlib:Ideal.toTwoSided`.

**Sources.**

- `Kbook.2013`, I.2, definition of local ring before Lemma 2.2, PDF p. 17 (draft p. 9): “A ring R is called a local ring if R has a unique maximal (2-sided) ideal m, and every element of R −m is a unit; R/m is either a field or a division ring by Ex. 1.12.” — The K-book’s definition of a local ring, used here as the hypothesis.
- `Kbook.2013`, Proof of Lemma I.2.2, PDF p. 18 (draft p. 10): “We first observe that every element u ∈R invertible in R/m is a unit of R, i.e., uv = vu = 1 for some v. Indeed, by multiplying by a representative for the inverse of ¯u ∈R/m we may assume that u ∈1 + m.” — The first step of the proof of Lemma I.2.2: elements invertible modulo m are units.
- `Kbook.2013`, Exercise I.1.12(ii)–(iii), PDF p. 14 (draft p. 6): “(iii) If I is a radical ideal of R, show that Mn(I) is a radical ideal of Mn(R) for every n.” — Exercise I.1.12(iii), used in Lemma I.2.2 for matrices; supplied by Mathlib’s TwoSidedIdeal.jacobson_matrix.

### Finitely generated projectives over a local ring are free

`Z.2/local-projective-free` · theorem · planet “Projectives over a local ring are free”

Under the hypotheses of Z.2/local-matrix-lift (R possibly noncommutative, m two-sided, R ∖ m ⊆ units), every finitely generated projective left R-module P is free: P ≃ₗ R^p with p = finrank_{R⧸m} (ExtendScalars (R → R⧸m) P), the dimension of P ⧸ mP. For commutative local rings this is Mathlib’s Module.free_of_flat_of_isLocalRing.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- m is a two-sided ideal with m ≠ ⊤ and every element outside m a unit.

**Proof.**

1. Choose a free-summand datum P × Q ≃ R^n (Z.1/free-summand-data).
2. Extend scalars to D := R ⧸ m (Z.1/extend-scalars, Z.1/extend-scalars-finite-projective): D ⊗ P and D ⊗ Q are finite-dimensional D-vector spaces of dimensions p and q with p + q = n, because D ⊗ R^n ≅ D^n and finrank is additive on products (Module.finrank_pi); vector spaces over a division ring have bases (Module.Basis.ofVectorSpace).
3. x ↦ 1 ⊗ x from P onto D ⊗ P is surjective; lift bases to e₁, …, e_p ∈ P and e′₁, …, e′_q ∈ Q. The induced R-linear map φ : R^p × R^q → P × Q ≅ R^n has a matrix whose image mod m is the matrix of the isomorphism D^p × D^q ≅ D ⊗ P × D ⊗ Q ≅ D^n (Z.1/extend-scalars-finite-projective (a)); by Z.2/local-matrix-lift φ is an isomorphism.
4. φ maps R^p into P and R^q into Q, so it is the product of two maps, each an isomorphism; P ≅ R^p.

**Acceptance.**

- For a division ring (m = 0) it is the freeness of vector spaces.
- For D[[t]] over a division ring D, with m = tD[[t]], every finitely generated projective is free.
- In the commutative case p = finrank_R P, as in Mathlib.

**Depends on.** this roadmap: `Z.2/local-matrix-lift`, `Z.1/free-summand-data`, `Z.1/extend-scalars`, `Z.1/extend-scalars-finite-projective`; libraries: `mathlib:Module.Basis.ofVectorSpace`, `mathlib:Module.finrank_pi`, `mathlib:Module.free_of_flat_of_isLocalRing`.

**Sources.**

- `Kbook.2013`, Lemma I.2.2, PDF p. 17 (draft p. 9): “Lemma 2.2. If R is a local ring, then every finitely generated projective R-module P is free. In fact P ∼= R^p, where p = dimR/m(P/mP).” — Lemma I.2.2, the statement.
- `Kbook.2013`, Proof of Lemma I.2.2, PDF p. 18 (draft p. 10): “The ei and e′j determine a homomorphism R^p ⊕R^q →P ⊕Q ∼= R^n, which may be represented by a square matrix (rij) ∈Mn(R) whose reduction (¯rij) ∈Mn(F) is invertible. But every such matrix (rij) is invertible over R by Exercise 1.12.” — The step of the proof that the lifted matrix is invertible, which the node follows.

### K₀ of a local ring

`Z.2/local-ring-k0` · construction

Under the hypotheses of Z.2/local-matrix-lift, RingK0.localEquiv : RingK0 R ≃+ ℤ is the composite divisionRingEquiv ∘ RingK0.map (R → R ⧸ m); it sends [P] to the rank p with P ≅ R^p and [R] to 1, with inverse n ↦ n•[R]. For a commutative local ring (IsLocalRing A, m = maximalIdeal A) it equals rankℤ and [P] ↦ finrank_A P.

**Hypotheses.**

- R is an associative unital ring, not necessarily commutative. The zero ring is allowed (the K-book assumes 1 ≠ 0; every statement below is checked to hold, possibly vacuously, for the zero ring).
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).
- m is a two-sided ideal with m ≠ ⊤ and every element outside m a unit.

**Proof.**

1. Additive by construction; surjective since [R] ↦ 1; injective since every [P] = p•[R] (Z.2/local-projective-free), so every x is n•[R], and n•[R] ↦ n.
2. Commutative case: Spec A is connected (its only idempotents are 0 and 1: e(1 − e) = 0 with one factor a unit), and at the closed point rankAtStalk equals the fibre dimension (Module.rankAtStalk_eq), which is the value of localEquiv; Module.free_of_flat_of_isLocalRing is the commutative freeness.

**API.**

- `TauCeti.RingK0.localEquiv` (equivalence): localEquiv m : RingK0 R ≃+ ℤ.
- `TauCeti.RingK0.localEquiv_of` (simp): localEquiv m [P] = finrank (R ⧸ m) (ExtendScalars (R → R ⧸ m) P).
- `TauCeti.RingK0.localEquiv_one` (simp): localEquiv m [R] = 1.
- `TauCeti.RingK0.localEquiv_symm_apply` (simp): (localEquiv m).symm n = n • [R].
- `TauCeti.RingK0.localEquiv_eq_rankℤ` (compatibility): For commutative local A: localEquiv (maximalIdeal A) = rankℤ.
- `TauCeti.RingK0.of_eq_finrank_smul` (characterisation): [P] = (localEquiv m [P]) • [R].

**Unit tests.**

- `TauCeti.RingK0.localEquiv_zp_test` (computation): For ℤ_(p) = Localization.AtPrime (p): [ℤ_(p)³] ↦ 3.
- `TauCeti.RingK0.localEquiv_divisionRing_test` (degenerate): For a division ring D and m = ⊥: localEquiv = divisionRingEquiv.
- `TauCeti.RingK0.localEquiv_commRing_test` (compatibility): For commutative local A: localEquiv = rankℤ, and [P] ↦ finrank A P.
- `TauCeti.RingK0.localEquiv_nonlocal_test` (non-example): The hypothesis cannot be dropped: for A = k × k (two maximal ideals) K₀(A) ≅ ℤ² (Z.2/k0-field-product).

**Acceptance.**

- For a division ring it is divisionRingEquiv.
- For ℤ_(p), [ℤ_(p)³] ↦ 3.

**Used by.**

- Weibel, II.2 (PDF p. 76): K₀ of a local ring is ℤ
- KTheoryLowDegrees:Z.2/rank-localization: the local rank of a class at p is its image in K₀(A_p) ≅ ℤ
- KTheoryLowDegrees:Z.2/semilocal-connected-k0: the one-maximal-ideal case
- KTheoryLowDegrees:U.3: the local rings whose SK₁ vanishes by elementary reduction are the same class of rings

**Depends on.** this roadmap: `Z.2/local-projective-free`, `Z.2/division-ring-k0`, `Z.1/ring-k0-map`, `Z.2/rank-connected`; libraries: `mathlib:Module.rankAtStalk_eq`, `mathlib:Module.free_of_flat_of_isLocalRing`, `mathlib:IsLocalRing.maximalIdeal`.

**Sources.**

- `Kbook.2013`, II.2, PDF p. 76 (draft p. 68): “For example, let k be a field or division ring. Then the abelian monoid P(k) is isomorphic to N = {0, 1, 2, . . . }, so K0(k) = Z. The same argument applies to show that K0(R) = Z for every local ring R” — K₀(R) = ℤ for every local ring, by Lemma I.2.2.

### Projective modules over a finite product of rings

`Z.2/pi-ring-modules` · lemma

Let ι be finite with decidable equality, A : ι → Type u rings, R := ∏_i A_i and π_i : R → A_i the projections (Pi.evalRingHom). (a) Each A_i, as a left R-module through π_i, is finitely generated projective (it is R·e_i for the central idempotent e_i = Pi.single i 1), so Z.1/restrict-scalars-finite-projective applies to π_i. (b) For a left A_i-module M, ExtendScalars π_j ((π_i)_*M) ≅ M if j = i and = 0 if j ≠ i. (c) For a left R-module P, P ≅ ∏_i (π_i)_*(ExtendScalars π_i P) as R-modules.

**Hypotheses.**

- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).
- The A_i are arbitrary rings; ι is finite.

**Proof.**

1. (a) R = ⊕_i R·e_i with R·e_i ≅ A_i through π_i (Z.1/idempotent-module-finite-projective for the 1 × 1 idempotent e_i).
2. (b) e_j acts on (π_i)_*M by π_i(e_j) = δ_ij. For j ≠ i, a ⊗ m = a·π_j(e_j) ⊗ m = a ⊗ e_j•m = 0; for j = i, a ⊗ m ↦ a•m is an isomorphism with inverse m ↦ 1 ⊗ m (universal property of Z.1/extend-scalars).
3. (c) The complete orthogonal idempotents e_i decompose P = ⊕_i e_i P (CompleteOrthogonalIdempotents), and e_i P ≅ (π_i)_*(A_i ⊗_R P) by the computation in (b).

**Acceptance.**

- For R = k × k and P = k × k²: A₁ ⊗ P ≅ k and A₂ ⊗ P ≅ k².
- k ⊗_{k × k} (0 × k) = 0.

**Depends on.** this roadmap: `Z.1/extend-scalars`, `Z.1/restrict-scalars-finite-projective`, `Z.1/idempotent-module-finite-projective`; libraries: `mathlib:Pi.evalRingHom`, `mathlib:CompleteOrthogonalIdempotents`.

**Sources.**

- `Kbook.2013`, II.2, after Example 2.1.3, PDF p. 77 (draft p. 69): “If R = R1 ×R2 then P(R) ∼= P(R1)×P(R2). As in Exercise 1.2, this implies that K0(R) ∼= K0(R1) × K0(R2). Thus K0 may be computed componentwise.” — P(R₁ × R₂) ≅ P(R₁) × P(R₂).
- `Kbook.2013`, Example I.2.1.1(3), componentwise free modules, PDF p. 16 (draft p. 8): “Another type of projective module arises for rings of the form R = R1 × R2; both P = R1 × 0 and Q = 0 × R2 are projective but cannot be free because the element e = (0, 1) ∈R satisfies Pe = 0 yet R^n e̸ = 0.” — The modules R₁ × 0 and 0 × R₂ over R₁ × R₂.

### The product formula for K₀

`Z.2/k0-pi` · construction · planet “Product formula for K₀”

For a finite family of rings (A_i)_{i ∈ ι} (arbitrary, noncommutative allowed), RingK0.piEquiv : RingK0 (∏_i A_i) ≃+ ∏_i RingK0 (A_i), x ↦ (map π_i x)_i, with inverse (x_i) ↦ Σ_i transfer π_i x_i. For two rings, RingK0.prodEquiv : RingK0 (A × B) ≃+ RingK0 A × RingK0 B, x ↦ (map fst x, map snd x).

**Hypotheses.**

- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).
- ι finite with decidable equality; the A_i are arbitrary rings.

**Proof.**

1. The forward map is additive (Z.1/ring-k0-map); the backward map uses the transfer along each projection (Z.1/ring-k0-transfer), defined by Z.2/pi-ring-modules (a).
2. map π_j ∘ transfer π_i = δ_ij·id: on classes this is Z.2/pi-ring-modules (b); extend by RingK0.hom_ext.
3. Σ_i transfer π_i ∘ map π_i = id: on classes this is Z.2/pi-ring-modules (c) with of_pi; extend by RingK0.hom_ext.
4. The binary case: transport along RingEquiv.piFinTwo, or repeat the argument with RingHom.fst and RingHom.snd.

**API.**

- `TauCeti.RingK0.piEquiv` (equivalence): piEquiv : RingK0 (Π i, A i) ≃+ Π i, RingK0 (A i).
- `TauCeti.RingK0.piEquiv_apply` (simp): piEquiv x i = map (Pi.evalRingHom A i) x.
- `TauCeti.RingK0.piEquiv_symm_apply` (simp): piEquiv.symm y = Σ i, transfer (Pi.evalRingHom A i) (y i).
- `TauCeti.RingK0.prodEquiv` (equivalence): prodEquiv : RingK0 (A × B) ≃+ RingK0 A × RingK0 B.
- `TauCeti.RingK0.prodEquiv_of` (simp): prodEquiv [P] = ([ExtendScalars fst P], [ExtendScalars snd P]).
- `TauCeti.RingK0.prodEquiv_symm_of` (simp): prodEquiv.symm ([M], [N]) = [M × N] with the componentwise action.
- `TauCeti.RingK0.rank_prodEquiv` (compatibility): For commutative A and B, under PrimeSpectrum (A × B) ≃ PrimeSpectrum A ⊕ PrimeSpectrum B, rank corresponds to the pair (rank_A, rank_B).

**Unit tests.**

- `TauCeti.RingK0.prodEquiv_field_test` (computation): For a field k, after divisionRingEquiv on each factor: [k × k] ↦ (1, 1), [k × 0] ↦ (1, 0), [0 × k] ↦ (0, 1).
- `TauCeti.RingK0.piEquiv_empty_test` (degenerate): For ι empty, Π A i is the zero ring and both sides are trivial.
- `TauCeti.RingK0.prodEquiv_rank_test` (compatibility): For commutative A, B, rank on A × B is the pair of ranks through PrimeSpectrum (A × B) ≃ PrimeSpectrum A ⊕ PrimeSpectrum B.
- `TauCeti.RingK0.prodEquiv_not_diagonal_test` (non-example): The free class does not generate: for A = B = k the image of ℤ is the diagonal {(n, n)}, while [k × 0] ↦ (1, 0).

**Acceptance.**

- For ι empty both sides are 0.
- prodEquiv [A × B] = ([A], [B]).

**Used by.**

- Weibel, II.2 (PDF p. 77) and Example II.2.1.4: K₀ computed componentwise; semisimple rings
- KTheoryLowDegrees:Z.2/semilocal-k0: K₀ along the decomposition A ≅ ∏_C A/I_C into connected components
- KTheoryLowDegrees:Z.2/k0-field-product: the test K₀(F × F) ≅ ℤ²
- KTheoryLowDegrees:Z.6: the product-of-two-fields test
- GeneralAlgebraicKTheory:K.7: finite-product compatibility in higher degrees is compared with this map (RS-18 link Z.2 → K.7)

**Depends on.** this roadmap: `Z.2/pi-ring-modules`, `Z.1/ring-k0-map`, `Z.1/ring-k0-transfer`, `Z.1/ring-k0`; libraries: `mathlib:RingEquiv.piFinTwo`, `mathlib:RingHom.fst`, `mathlib:RingHom.snd`, `mathlib:Pi.evalRingHom`.

**Sources.**

- `Kbook.2013`, II.2, after Example 2.1.3, PDF p. 77 (draft p. 69): “If R = R1 ×R2 then P(R) ∼= P(R1)×P(R2). As in Exercise 1.2, this implies that K0(R) ∼= K0(R1) × K0(R2). Thus K0 may be computed componentwise.” — K₀(R₁ × R₂) ≅ K₀(R₁) × K₀(R₂): K₀ may be computed componentwise.
- `Kbook.2013`, Exercise II.1.2, PDF p. 75 (draft p. 67): “If M = M1 × M2, show that M^−1M is the product group (M^−1 1 M1) × (M^−1 2 M2).” — The group completion of a product monoid is the product of the group completions.

### K₀ of a product of two fields through the rank

`Z.2/k0-field-product` · application

For a field k, rank : RingK0 (k × k) ≃+ LocallyConstant (PrimeSpectrum (k × k)) ℤ ≅ ℤ², where Spec (k × k) = {p₁, p₂}, p₁ = ker(fst), p₂ = ker(snd), is discrete; [k × 0] ↦ (1, 0), [0 × k] ↦ (0, 1), [k × k] ↦ (1, 1). The same isomorphism is prodEquiv followed by divisionRingEquiv on each factor.

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.
- k is a field.

**Proof.**

1. Z.2/k0-pi and Z.2/division-ring-k0 give RingK0 (k × k) ≅ ℤ².
2. Spec (k × k) has exactly the two points p₁ and p₂, both open, so LocallyConstant (Spec, ℤ) ≅ ℤ²; by Z.2/rank-base-change along fst and snd the rank is the pair of dimensions, so rank is this isomorphism.
3. The values: (k × 0)_{p₁} ≅ k and (k × 0)_{p₂} = 0 (Z.2/componentwise-free with U = {p₁}).

**Acceptance.**

- rank [k × 0] is not constant: K₀(k × k) has no integer rank.
- The free classes n[k × k] form the diagonal, of infinite index.

**Depends on.** this roadmap: `Z.2/k0-pi`, `Z.2/division-ring-k0`, `Z.2/rank-hom`, `Z.2/rank-base-change`, `Z.2/componentwise-free`.

**Sources.**

- `Kbook.2013`, I.2, paragraph before Definition 2.2.3, PDF p. 18 (draft p. 10): “If M is any R-module (projective or not) then the rank of M at f is the integer dimF (M ⊗R F). However, the rank depends upon f, as the example R = F × F, M = F × 0 shows.” — The example R = F × F, M = F × 0, whose rank depends on the point.
- `Kbook.2013`, II.2, after Example 2.1.3, PDF p. 77 (draft p. 69): “If R = R1 ×R2 then P(R) ∼= P(R1)×P(R2). As in Exercise 1.2, this implies that K0(R) ∼= K0(R1) × K0(R2). Thus K0 may be computed componentwise.” — The product formula.

### A semilocal ring has finitely many connected components

`Z.2/semilocal-components-finite` · lemma

If A is commutative with finitely many maximal ideals (Finite (MaximalSpectrum A)), then Spec A has finitely many connected components, at most as many as maximal ideals.

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.
- Finite (MaximalSpectrum A).

**Proof.**

1. A connected component C of Spec A is closed, and a nonempty closed subset of Spec A contains a maximal ideal: it contains a prime p and, being closed, every prime containing p, in particular a maximal ideal containing p (Ideal.exists_le_maximal).
2. Distinct components are disjoint, so choosing a maximal ideal in each component is injective; hence the number of components is at most the number of maximal ideals.

**Acceptance.**

- A = k × k × k: three maximal ideals, three components.
- ℤ localised away from 2ℤ ∪ 3ℤ: two maximal ideals, one component.

**Depends on.** libraries: `mathlib:MaximalSpectrum`, `mathlib:ConnectedComponents`, `mathlib:Ideal.exists_le_maximal`.

**Sources.**

- `Kbook.2013`, Exercise II.2.6 (Semilocal rings), PDF p. 87 (draft p. 79): “A ring R is called semilocal if R/J is semisimple for some radical ideal J. Show that if R is semilocal then K0(R) ∼= Z^n for some n > 0.” — The semilocal setting of the K-book’s exercise; the finiteness of components is the elementary step needed for its commutative form and is proved here in full.

### K₀ of a connected semilocal ring

`Z.2/semilocal-connected-k0` · theorem

Let A be commutative with finitely many maximal ideals and ConnectedSpace (PrimeSpectrum A). Then every finitely generated projective A-module P is free, P ≃ₗ A^{rankℤ [P]}, and rankℤ : RingK0 A ≃+ ℤ with inverse n ↦ n•[A].

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.
- Finite (MaximalSpectrum A) and Spec A connected.

**Proof.**

1. P has constant rank n (Z.2/rank-connected); at a maximal ideal 𝔪 the fibre dimension finrank (A ⧸ 𝔪) ((A ⧸ 𝔪) ⊗ P) equals rankAtStalk P 𝔪 = n (Module.rankAtStalk_eq, the residue field of 𝔪 being A ⧸ 𝔪).
2. Module.free_of_flat_of_finrank_eq (Stacks 02M9; P is finite and flat, Module.Flat.of_projective) gives P free of rank n, with a basis by Module.nonempty_basis_of_flat_of_finrank_eq.
3. Hence [P] = n•[A]; every class is an integer multiple of [A] and rankℤ is bijective.

**Acceptance.**

- For A = ℤ localised away from 2ℤ ∪ 3ℤ: K₀(A) ≅ ℤ, while A/J ≅ 𝔽₂ × 𝔽₃ has K₀ ≅ ℤ²; the map K₀(A) → K₀(A/J) is n ↦ (n, n), not an isomorphism.
- Local rings are the case of one maximal ideal (Z.2/local-ring-k0).

**Depends on.** this roadmap: `Z.2/rank-connected`; libraries: `mathlib:Module.free_of_flat_of_finrank_eq`, `mathlib:Module.nonempty_basis_of_flat_of_finrank_eq`, `mathlib:Module.rankAtStalk_eq`, `mathlib:Module.Flat.of_projective`.

**Sources.**

- `Kbook.2013`, Exercise II.2.6 (Semilocal rings), PDF p. 87 (draft p. 79): “A ring R is called semilocal if R/J is semisimple for some radical ideal J. Show that if R is semilocal then K0(R) ∼= Z^n for some n > 0.” — K₀ of a semilocal ring is ℤ^n; for a commutative semilocal ring with connected spectrum n = 1.
- `Kbook.2013`, Exercise II.2.5(b), PDF p. 87 (draft p. 79): “If R is a semilocal but not local domain, show that K0(R) →K0(R/I) is not an isomorphism when I is the Jacobson radical.” — The semilocal non-local domain, for which K₀(R) → K₀(R/J) is not an isomorphism.

### K₀ of a semilocal ring

`Z.2/semilocal-k0` · theorem · planet “K₀ of a semilocal ring”

Let A be commutative with finitely many maximal ideals. Then rank : RingK0 A ≃+ LocallyConstant (PrimeSpectrum A) ℤ, and LocallyConstant (PrimeSpectrum A) ℤ ≃+ (π₀(Spec A) → ℤ) ≅ ℤ^c with c = |π₀(Spec A)| ≤ |MaximalSpectrum A|. The isomorphism is the composite RingK0 A ≅ RingK0 (∏_C A ⧸ I_C) ≅ ∏_C RingK0 (A ⧸ I_C) ≅ ∏_C ℤ through the decomposition into connected components, each A ⧸ I_C connected with finitely many maximal ideals. The exponent counts connected components of Spec A, not maximal ideals.

**Hypotheses.**

- A is a commutative unital ring; the zero ring is allowed.
- Finite (MaximalSpectrum A).

**Proof.**

1. Finitely many components (Z.2/semilocal-components-finite); PrimeSpectrum.ringEquivPiQuotientConnectedComponentsIdeal gives A ≅ ∏_C A ⧸ I_C, each factor connected (PrimeSpectrum.connectedSpace_quotient_connectedComponentsIdeal) and with finitely many maximal ideals (those of A containing I_C).
2. RingK0.mapEquiv of that ring isomorphism (Z.1/ring-k0-map), Z.2/k0-pi and Z.2/semilocal-connected-k0 on each factor give RingK0 A ≃+ ∏_C ℤ.
3. Compatibility with rank: by Z.2/rank-base-change along A → A ⧸ I_C, the C-coordinate is the constant value of rank on C; a locally constant function on Spec A is constant on each component, and the finitely many components are clopen, so rank is the displayed isomorphism.

**Acceptance.**

- A = k × k × k: K₀(A) ≅ ℤ³.
- For the semilocal domain ℤ localised away from 2ℤ ∪ 3ℤ, c = 1 < 2 maximal ideals.
- A = ℤ/12 ≅ ℤ/4 × ℤ/3: two components, K₀ ≅ ℤ².

**Depends on.** this roadmap: `Z.2/semilocal-components-finite`, `Z.1/ring-k0-map`, `Z.2/k0-pi`, `Z.2/semilocal-connected-k0`, `Z.2/rank-base-change`, `Z.2/rank-hom`; libraries: `tauceti:PrimeSpectrum.ringEquivPiQuotientConnectedComponentsIdeal`, `tauceti:PrimeSpectrum.connectedSpace_quotient_connectedComponentsIdeal`.

**Sources.**

- `Kbook.2013`, Exercise II.2.6 (Semilocal rings), PDF p. 87 (draft p. 79): “A ring R is called semilocal if R/J is semisimple for some radical ideal J. Show that if R is semilocal then K0(R) ∼= Z^n for some n > 0.” — K₀ of a semilocal ring is ℤ^n; the node determines n and the isomorphism in the commutative case.
- `Kbook.2013`, Exercise II.2.5(b), PDF p. 87 (draft p. 79): “If R is a semilocal but not local domain, show that K0(R) →K0(R/I) is not an isomorphism when I is the Jacobson radical.” — The count is by components, not by maximal ideals.

### A projective ideal of constant rank one that is not free

`Z.2/nonfree-projective-ideal` · application

In A = ℤ[√−5] (Mathlib’s Zsqrtd (−5)), the ideal I = (2, 1 + √−5) is a finitely generated projective A-module of constant rank 1 that is not free. Explicitly, a ↦ (a(−1 + √−5)/2, −a(1 + √−5)/2) : I → A² and (r₁, r₂) ↦ 2r₁ + (1 + √−5)r₂ : A² → I compose to the identity of I.

**Hypotheses.**

- A = ℤ[√−5], a domain (Zsqrtd.norm_eq_zero_iff for d = −5 < 0 gives no zero divisors).

**Proof.**

1. I² = (4, 2 + 2√−5, (1 + √−5)²) with (1 + √−5)² = −4 + 2√−5, so I² ⊆ (2), and 2 = 2(1 + √−5) − (1 + √−5)² − 4 ∈ I², so I² = (2). Hence a·z ∈ 2A for a, z ∈ I and the first map lands in A².
2. The composite is the identity: 2(−1 + √−5) − (1 + √−5)² = −2 + 2√−5 + 4 − 2√−5 = 2, so a ↦ a·2/2 = a. Module.Projective.of_split gives projectivity; I is finitely generated by 2 and 1 + √−5.
3. Rank one: A is a domain and I ≠ 0 (Z.2/rank-domain).
4. Not free: if I ≅ A^n then n = 1 by the rank, and an isomorphism A ≅ I makes I = (α) principal. Then N(α) divides N(2) = 4 and N(1 + √−5) = 6 (Zsqrtd.norm_mul), so N(α) ∈ {1, 2}; m² + 5n² = 2 has no integer solution, and N(α) = 1 would make α a unit (Zsqrtd.isUnit_iff_norm_isUnit) and I = A. But 1 ∉ I: an element 2(a + b√−5) + (1 + √−5)(c + d√−5) = (2a + c − 5d) + (2b + c + d)√−5 equal to 1 would give 2a − 2b − 6d = 1, which is impossible by parity.

**Acceptance.**

- I is not free, but each localisation I_p is free of rank one (Z.2/local-freeness): freeness of projectives is a local-ring phenomenon.
- The nonvanishing of [I] − [A] in K₀(A) is a determinant statement, owned by Z.4 (KTheoryLowDegrees:Z.4/rank-pic-equivalence).

**Depends on.** this roadmap: `Z.2/rank-domain`; libraries: `mathlib:Zsqrtd`, `mathlib:Zsqrtd.norm`, `mathlib:Zsqrtd.norm_mul`, `mathlib:Zsqrtd.isUnit_iff_norm_isUnit`, `mathlib:Zsqrtd.norm_eq_zero_iff`, `mathlib:Module.Projective.of_split`, `mathlib:Ideal.span`.

**Sources.**

- `Milne.ANT.2020`, Remark 2.31(c), printed pp. 35–36 (PDF pp. 37–38), version 3.08; checked on the rendered page, the text layer being garbled: “Both (2) and ℤ[√−5] are free ℤ[√−5]-modules of rank 1, but (2, 1 + √−5) is not a free ℤ[√−5]-module of rank 1, because it is not a principal ideal (see the Introduction). In fact, it is not a free module of any rank.” — The non-freeness of (2, 1 + √−5), because it is not principal.
- `Milne.ANT.2020`, Example 4.6, printed p. 71 (PDF p. 73), version 3.08; checked on the rendered page: “The ideal p can’t be principal because there does not exist an element α = m + n√−5 such that Nm(α) = m^2 + 5n^2 = 2, and so Cl(ℤ[√−5]) has order 2.” — The norm argument showing that the ideal of norm 2 is not principal.
- `Milne.ANT.2020`, Introduction, printed p. 10 (PDF p. 12), version 3.08; checked on the rendered page: “Conversely, 2 = 6 − 4 ∈ (4, 2 + 2√−5, 6) and so (2, 1 + √−5)^2 = (2), as claimed.” — The identity (2, 1 + √−5)² = (2) used to construct the retraction.
- `Conrad.IdealFactor`, Example 1.3, p. 1: “Suppose (2, 1 + √−5) = (1). Then we can write 1 = 2(a + b√−5) + (1 + √−5)(c + d√−5) for some integers a, b, c, and d.” — The parity argument showing (2, 1 + √−5) ≠ (1).
- `Kbook.2013`, Proof of Proposition I.3.5, PDF p. 28 (draft p. 20): “The kernel of Cart(R) →Pic(R) is the set of invertible ideals I having an isomorphism I ∼= R. If f ∈I corresponds to 1 ∈R under such an isomorphism then I = fR = div(f).” — An invertible ideal is isomorphic to R exactly when it is principal.

### K₀ of a matrix ring over a division ring

`Z.2/matrix-division-ring-k0` · application

For a division ring D and n ≥ 1, RingK0 (Matrix (Fin n) (Fin n) D) ≃+ ℤ (Z.1/ring-k0-matrix followed by Z.2/division-ring-k0) sends the class of the simple module V = D^n of column vectors to 1 and [M_n(D)] to n. Hence the subgroup generated by the free modules has index n; for n ≥ 2, freeClass : ℤ → K₀(M_n(D)) is injective, not surjective and not split, and V is not stably free.

**Hypotheses.**

- D a division ring, n ≥ 1.
- Modules are left modules, as in Mathlib. The K-book works with right modules; each of its statements is read here over the opposite ring, and for commutative rings the two conventions coincide.
- R lives in a universe u and the modules considered are in the same universe u (ModuleCat.{u} R).

**Proof.**

1. Z.1/ring-k0-matrix gives K₀(D) ≃ K₀(M_n(D)) with [D] ↦ [V] and [M_n(D)] ↦ n[D]; compose with divisionRingEquiv.
2. freeClass is then m ↦ n·m, injective with image nℤ; a retraction would send n·1 to 1, impossible for n ≥ 2; V is not stably free since [V] = 1 ∉ nℤ (Z.1/stably-free-class).

**Acceptance.**

- For n = 2: [M₂(D)] ↦ 2 and [D²] ↦ 1; this is the counterexample to the uncorrected Lemma II.2.1(2) (sourceIssues).
- For n = 1 it is Z.2/division-ring-k0.

**Depends on.** this roadmap: `Z.1/ring-k0-matrix`, `Z.2/division-ring-k0`, `Z.1/free-class-ibn`, `Z.1/stably-free-class`.

**Sources.**

- `Kbook.2013`, Example II.2.1.2 (Simple rings), PDF p. 77 (draft p. 69): “Thus length is an abelian group isomorphism K0(Mn(F)) ∼= −→Z sending [V ] to 1. Since R has length n, the subgroup of K0(R) ∼= Z generated by the free modules has index n. In particular, the inclusion Z ⊂K0(R) of Lemma 2.1 does not split.” — Example II.2.1.2: K₀(M_n(F)) ≅ ℤ by length, the free modules generating a subgroup of index n.
- `Kbook.2013`, Example II.2.7.2, PDF p. 84 (draft p. 76): “R = Mn(S) is always Morita equivalent to S; P is the bimodule S^n of “column vectors” and Q is the bimodule (S^n)^t of “row vectors.”” — The Morita equivalence used.

## U.1 — Stabilisation and elementary groups

*Coverage: source_decomposed.* GL(A) is Mathlib's DirectLimit of the GL_n(A) along g ↦ diag(g, 1) (the choice is justified in U.1/stable-general-linear-group: group structure, lift, finite representatives and the equality relation come with it, and injective transitions make it the K-book's union); finite representatives and equality after a common stabilisation are separate lemmas. Block sums, elementary matrices and GL_n(f) are built for arbitrary rings: Mathlib's Matrix.transvection, GeneralLinearGroup.transvection and GeneralLinearGroup.map and Tau Ceti's transvectionUnit all assume a commutative ring, and each is recovered as a compatibility API item. E_n(A) and E(A); the three commutator identities of (1.3.1) over any ring (Tau Ceti's commutatorElement_transvectionUnit, commute_transvectionUnit and commutatorElement_transvectionUnit_reverse are their commutative cases); signed transpositions; E_n(A) → E_n(B) onto for surjections; perfectness of E_n(A) for n ≥ 3 and of E(A); Whitehead's identity g ⊕ g⁻¹ ∈ E_{2n}(A) with 3n² + 3n factors (Tau Ceti's diag2nUnit_decompose is n = 1), the congruences a ⊕ b ≡ ab ⊕ 1 ≡ ba ⊕ 1, commutators and elementary conjugates in rank 2n; Whitehead's Lemma [GL(A), GL(A)] = E(A); normality of E(A) with the explicit rank shift; the centraliser of E_n(A) and the trivial centre of E(A) (for K2SymbolsBrauer T.1's Steinberg centre theorem). Finite-rank normality (Suslin: E_n(A) ⊴ GL_n(A) for commutative A and n ≥ 3; K-book Remark III.1.2.5 and Ex. III.1.9) is cited and not claimed. The SL₂ warning is the theorem U.1/rank-two-failure: E_2(𝔽_2) and E_2(𝔽_3) are not perfect and [GL_2(𝔽_2), GL_2(𝔽_2)] ≠ E_2(𝔽_2), with the group orders recomputed, which is where Mathlib's Matrix.SL2.commutator_eq_top hypothesis fails. The consumer requests of K3BlochGroups V.1 (E(A) perfect and normal) and K2SymbolsBrauer T.1 are supplied by U.1/stable-elementary-perfect, U.1/stable-elementary-normal, U.1/whitehead-lemma and U.1/stable-elementary-centre.

### General linear groups along a homomorphism of arbitrary rings

`U.1/general-linear-map` · construction

For a homomorphism f : A → B of associative unital rings (commutativity not assumed) and a finite index type n with decidable equality, glMap f : GL_n(A) →* GL_n(B) is Units.map of the ring homomorphism RingHom.mapMatrix f : Matrix n n A →+* Matrix n n B; it applies f to every entry. It satisfies glMap (id) = id and glMap (g ∘ f) = glMap g ∘ glMap f, commutes with reindexing along n ≃ m, and for commutative A and B it is Mathlib's Matrix.GeneralLinearGroup.map f, which is only defined for commutative rings. glMap f need not be surjective when f is.

**Hypotheses.**

- A and B are associative unital rings (Mathlib's Ring); f : A →+* B.
- n is a finite type with decidable equality (in the roadmap n = Fin n).

**Proof.**

1. RingHom.mapMatrix f is a ring homomorphism Matrix n n A →+* Matrix n n B for any (non-commutative) semirings, so Units.map of its underlying monoid homomorphism is a group homomorphism GL n A →* GL n B.
2. The functor laws are entrywise: RingHom.mapMatrix of the identity is the identity and RingHom.mapMatrix (g.comp f) = (RingHom.mapMatrix g).comp (RingHom.mapMatrix f); Units.map_comp transports them to units.
3. For commutative A and B the definition is literally Mathlib's Matrix.GeneralLinearGroup.map f = Units.map (RingHom.mapMatrix f).toMonoidHom, so the two agree definitionally.
4. Reindexing along e : n ≃ m commutes with entrywise application of f (both act on entries only).
5. Non-surjectivity: for f : ℤ → ℤ/5ℤ the matrix diag(2, 1) ∈ GL_2(ℤ/5ℤ) has determinant 2, whereas glMap f preserves determinants and every element of GL_2(ℤ) has determinant ±1 (Matrix.GeneralLinearGroup.map_det).

**API.**

- `glMap` (constructor): For f : A →+* B, glMap f : GL n A →* GL n B, entrywise application of f.
- `glMap_apply` (simp): (glMap f g : Matrix n n B) i j = f ((g : Matrix n n A) i j), and likewise for (glMap f g)⁻¹.
- `glMap_id` (functoriality): glMap (RingHom.id A) = MonoidHom.id (GL n A).
- `glMap_comp` (functoriality): glMap (g.comp f) = (glMap g).comp (glMap f).
- `glMap_injective` (other): If f is injective then so is glMap f.
- `glMap_reindex` (functoriality): glMap f commutes with reindexing along an equivalence of index types.
- `glMap_eq_map` (compatibility): For commutative A and B, glMap f = Matrix.GeneralLinearGroup.map f.

**Unit tests.**

- `glMap_int_zmod_two` (computation): glMap (Int.castRingHom (ZMod 2)) sends diag(−1, 1) ∈ GL_2(ℤ) to 1 ∈ GL_2(ZMod 2).
- `glMap_id_eq` (degenerate): glMap (RingHom.id A) = MonoidHom.id (GL (Fin n) A), for the zero ring as well.
- `glMap_eq_map_int` (compatibility): glMap (Int.castRingHom (ZMod 5)) = Matrix.GeneralLinearGroup.map (Int.castRingHom (ZMod 5)) on GL (Fin 2) ℤ.
- `glMap_not_surjective` (non-example): diag(2, 1) ∈ GL_2(ZMod 5) is not in the range of glMap (Int.castRingHom (ZMod 5)) : GL_2(ℤ) → GL_2(ZMod 5), since its determinant is 2 ≠ ±1.

**Acceptance.**

- glMap is multiplicative, sends 1 to 1 and satisfies the two functor laws.
- For A = ℤ, B = ℤ/2ℤ it agrees with Mathlib's Matrix.GeneralLinearGroup.map (Int.castRingHom _).
- It is defined for the quaternions ℍ[ℝ] and for matrix rings, where Mathlib's GeneralLinearGroup.map is not available.

**Used by.**

- KTheoryLowDegrees:U.1/stable-general-linear-group: GL(f) : GL(A) → GL(B) is the direct-limit map of the glMap f
- KTheoryLowDegrees:U.2/K1-map: functoriality of K₁ for homomorphisms of arbitrary rings
- KTheoryLowDegrees:U.1/elementary-surjective-map: the image of E_n(A) under glMap of a surjection is E_n(B) (Bass 1964, Lemma 1.1)
- KTheoryLowDegrees:U.5 (relative K₁): GL_n(I) is the kernel of glMap along A → A/I

**Depends on.** libraries: `mathlib:Units.map`, `mathlib:Units.map_comp`, `mathlib:RingHom.mapMatrix`, `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.map`, `mathlib:Matrix.GeneralLinearGroup.map_det`.

**Sources.**

- `Kbook.2013`, III.1, paragraph after Definition 1.1 (PDF p. 188; draft p. 180): “A ring map R →S induces a natural map from GL(R) to GL(S), and hence from K1(R) to K1(S). That is, K1 is a functor from rings to abelian groups.” — The map GL(R) → GL(S) for an arbitrary ring map; this node supplies its finite-rank layer for non-commutative rings, which Mathlib lacks.
- `Kbook.2013`, III.1.2.3, Remark 1.2.3 (Surjections) (PDF p. 189; draft p. 181): “In contrast, the maps GLn(R) →GLn(R/I) are usually not onto unless I is a radical ideal” — The non-surjectivity recorded in the last proof step and tested below.

### Elementary matrices over an arbitrary ring

`U.1/elementary-matrix` · definition · planet “Elementary matrices”

Let A be an associative unital ring, not necessarily commutative, n a finite index type with decidable equality (in the roadmap Fin n) and i ≠ j indices. For a ∈ A the elementary matrix e_ij(a) is the element of GL_n(A) = (Matrix n n A)ˣ whose underlying matrix is 1 + E_ij(a), where E_ij(a) = Matrix.single i j a has a in position (i, j) and 0 elsewhere; its inverse is e_ij(−a). Left multiplication by e_ij(a) adds a times row j to row i (row i of e_ij(a)·M is M_i + a·M_j, with a on the left); right multiplication adds column i times a to column j. The hypothesis i ≠ j is part of the data. For commutative A the underlying matrix is Mathlib's Matrix.transvection i j a, so e_ij(a) is Mathlib's Matrix.GeneralLinearGroup.transvection i j h a and Tau Ceti's transvectionUnit h a; both of those assume CommRing, and that assumption is exactly what is missing for the rings this roadmap needs (division rings for the Dieudonné determinant, matrix and group rings).

**Hypotheses.**

- A is an associative ring with 1 (Mathlib's Ring A); commutativity is not assumed.
- n is a finite type with decidable equality; i, j ∈ n with i ≠ j; a ∈ A.

**Proof.**

1. E_ij(a)·E_ij(b) = 0 because j ≠ i (Matrix.single_mul_single_of_ne), so (1 + E_ij(a))(1 + E_ij(b)) = 1 + E_ij(a + b) by additivity of single in its entry; with b = −a this is 1 in both orders, so 1 + E_ij(a) is a unit with inverse 1 + E_ij(−a). No commutativity is used.
2. Package the unit as e_ij(a) ∈ GL_n(A) and record e_ij(0) = 1 and e_ij(a)e_ij(b) = e_ij(a + b), so a ↦ e_ij(a) is a homomorphism Multiplicative A →* GL_n(A).
3. Row and column operations: (E_ij(a)·M)_{kl} = δ_{ki}·a·M_{jl} and (M·E_ij(a))_{kl} = M_{ki}·a·δ_{jl}, entrywise from the definition of Matrix.single.
4. Injectivity in a: the (i, j) entry of e_ij(a) is a.
5. Naturality: glMap f (U.1/general-linear-map) sends 1 + E_ij(a) to 1 + E_ij(f a).
6. For commutative A, 1 + single i j a is by definition Matrix.transvection i j a; hence e_ij(a) = Matrix.GeneralLinearGroup.transvection i j h a, and its coercion agrees with that of TauCeti.transvectionUnit h a (TauCeti.coe_transvectionUnit), so the two are equal by Units.ext; its determinant is 1 (Matrix.det_transvection_of_ne).

**API.**

- `elementary` (constructor): For h : i ≠ j and a : A, elementary h a : GL n A with underlying matrix 1 + Matrix.single i j a, over any ring A.
- `coe_elementary` (simp): ↑(elementary h a) = 1 + Matrix.single i j a and ↑(elementary h a)⁻¹ = 1 + Matrix.single i j (−a).
- `elementary_zero` (simp): elementary h 0 = 1.
- `elementary_add` (simp): elementary h (a + b) = elementary h a * elementary h b.
- `elementary_inv` (simp): (elementary h a)⁻¹ = elementary h (−a).
- `elementaryHom` (constructor): The homomorphism Multiplicative A →* GL n A, a ↦ elementary h a.
- `elementary_injective` (characterisation): a ↦ elementary h a is injective; the (i, j) entry of elementary h a is a.
- `elementary_mul_apply` (characterisation): (elementary h a * M) k l = M k l + (if k = i then a * M j l else 0), and (M * elementary h a) k l = M k l + (if l = j then M k i * a else 0).
- `glMap_elementary` (functoriality): glMap f (elementary h a) = elementary h (f a) for every ring homomorphism f : A →+* B.
- `elementary_reindex` (functoriality): Reindexing along e : n ≃ m sends elementary h a to elementary (e.injective.ne h) a.
- `elementary_eq_transvection` (compatibility): For commutative A: elementary h a = Matrix.GeneralLinearGroup.transvection i j h a = TauCeti.transvectionUnit h a.
- `det_elementary` (compatibility): For commutative A: Matrix.GeneralLinearGroup.det (elementary h a) = 1.

**Unit tests.**

- `elementary_weyl_two` (computation): In GL (Fin 2) A for any ring A, elementary (0 ≠ 1) 1 * elementary (1 ≠ 0) (−1) * elementary (0 ≠ 1) 1 is the matrix with rows (0, 1) and (−1, 0).
- `elementary_zero_eq_one` (degenerate): elementary h (0 : A) = 1; over the zero ring every elementary matrix is 1, as GL_n of the zero ring is trivial.
- `elementary_eq_transvectionUnit_int` (compatibility): For A = ℤ and i ≠ j in Fin 3, elementary h a = TauCeti.transvectionUnit h a for every a : ℤ.
- `elementary_mul_quaternion` (non-example): For A = ℍ[ℝ] and M ∈ Matrix (Fin 2) (Fin 2) ℍ[ℝ] with rows (0, 0) and (j, 0), row 0 of elementary (0 ≠ 1) i * M is (i·j, 0) = (k, 0), not (j·i, 0) = (−k, 0): a definition adding row j times a on the right would fail.

**Acceptance.**

- e_ij(a)e_ij(b) = e_ij(a + b) and e_ij(a)⁻¹ = e_ij(−a) over every ring, including ℍ[ℝ].
- For commutative A, e_ij(a) equals Mathlib's GeneralLinearGroup.transvection i j h a and Tau Ceti's transvectionUnit h a.
- The product e_12(1)e_21(−1)e_12(1) in GL_2(A) is the matrix with rows (0, 1) and (−1, 0) (K-book Example III.1.2.1); this was recomputed by multiplying the three matrices.

**Used by.**

- K-book III.1.2 and Bass 1964 § 1: the elementary matrices generate E_n(A) and E(A); Whitehead's lemma identifies E(A) with [GL(A), GL(A)]
- K2SymbolsBrauer:T.1/elementary-matrices-satisfy: the Steinberg generator x_ij(r) is sent to e_ij(r); that node needs the relations over non-commutative rings, which U.1 supplies
- KTheoryLowDegrees:U.5 (relative K₁): E(A, I) is the normal closure of the e_ij(x) with x ∈ I
- KTheoryLowDegrees:U.3/division-ring-reduction: Gaussian elimination over a division ring multiplies on the left by e_ij(λ)
- KTheoryLowDegrees:U.3/stable-range-transitive: elementary row operations shorten unimodular columns (Bass 1964, Theorem 4.2)

**Depends on.** this roadmap: `U.1/general-linear-map`; libraries: `mathlib:Matrix.single`, `mathlib:Matrix.single_mul_single_of_ne`, `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.transvection`, `mathlib:Matrix.transvection`, `mathlib:Matrix.det_transvection_of_ne`, `mathlib:Units.ext`, `tauceti:TauCeti.transvectionUnit`, `tauceti:TauCeti.coe_transvectionUnit`.

**Sources.**

- `Kbook.2013`, III.1.2, Definition 1.2 (PDF p. 188; draft p. 180): “Definition 1.2. If i ≠ j are distinct positive integers and r ∈ R then the elementary matrix eij(r) is the matrix in GL(R) which has 1 in every diagonal spot, has r in the (i, j)-spot, and is zero elsewhere.” — The definition, for an arbitrary ring R (the K-book's rings are associative with 1, not necessarily commutative).
- `Kbook.2013`, III.1.2.2 (PDF p. 189; draft p. 181): “If we interpret matrices as linear operators on column vectors, then eij(r) is the elementary row operation of adding r times row j to row i” — The row-operation convention pinned in the statement (a on the left).
- `Bass.1964`, § 1, Notation and lemmas (p. 8 of the article; PDF p. 5 of the numdam file): “A matrix of the form 1 + ae_ij, i ≠ j, is called elementary, and we denote by E(n, A) the subgroup of GL(n, A) generated by all elementary matrices.” — Bass's definition for an arbitrary ring A; 1 + ae_ij is the node's 1 + E_ij(a).

### The stabilisation embedding g ↦ diag(g, 1)

`U.1/stabilisation-map` · construction

For m ≤ n define stabilise_{m,n} : GL_m(A) →* GL_n(A), identifying Fin m with the first m indices of Fin n: (stabilise g)_{ab} = g_{ab} if a, b < m, 1 if a = b ≥ m, and 0 otherwise, i.e. g ↦ diag(g, 1_{n−m}). It is an injective group homomorphism, stabilise_{m,m} = id and stabilise_{n,k} ∘ stabilise_{m,n} = stabilise_{m,k} for m ≤ n ≤ k, so (GL_n(A), stabilise) is a directed system over (ℕ, ≤) in Mathlib's sense (DirectedSystem). It sends e_ij(a) to e_{ij}(a) with the indices cast along Fin m → Fin n, commutes with glMap f, and for commutative A preserves determinants. Its matrix is Matrix.fromBlocks g 0 0 1 reindexed along finSumFinEquiv and the cast m + (n − m) = n.

**Hypotheses.**

- A is an associative unital ring; m ≤ n ≤ k are natural numbers.

**Proof.**

1. Define the underlying matrix entrywise as the extension of g by the identity; it equals Matrix.fromBlocks g 0 0 1 reindexed along finSumFinEquiv : Fin m ⊕ Fin (n − m) ≃ Fin (m + (n − m)) followed by the cast to Fin n.
2. Multiplicativity: fromBlocks g 0 0 1 · fromBlocks h 0 0 1 = fromBlocks (gh) 0 0 1 (Matrix.fromBlocks_multiply), fromBlocks 1 0 0 1 = 1 (Matrix.fromBlocks_one), and reindexing is multiplicative (Matrix.reindexAlgEquiv_mul); so units go to units and stabilise is a MonoidHom.
3. Injectivity: the upper left m × m block of stabilise g is g.
4. Directed-system laws: both stabilise_{n,k}(stabilise_{m,n} g) and stabilise_{m,k} g have entries g_{ab} for a, b < m and δ_{ab} otherwise, and stabilise_{m,m} g = g entrywise; these are the fields map_self and map_map of DirectedSystem.
5. Elementary matrices: stabilise(1 + single i j a) = 1 + single (castLE i) (castLE j) a entrywise; for commutative A this is Mathlib's TransvectionStruct.toMatrix_sumInl read through the reindexing.
6. Naturality: glMap f acts entrywise and fixes 0 and 1, so it commutes with stabilise.
7. Determinant (commutative A): det (fromBlocks g 0 0 1) = det g · det 1 = det g (Matrix.det_fromBlocks_zero₂₁), and reindexing along an equivalence preserves the determinant.

**API.**

- `stabilise` (constructor): For h : m ≤ n, stabilise h : GL (Fin m) A →* GL (Fin n) A, g ↦ diag(g, 1).
- `stabilise_apply` (simp): (stabilise h g) a b = if (a < m ∧ b < m) then g a b else if a = b then 1 else 0 (indices read in Fin n).
- `stabilise_self` (simp): stabilise (le_refl m) = MonoidHom.id.
- `stabilise_stabilise` (functoriality): stabilise hnk (stabilise hmn g) = stabilise (hmn.trans hnk) g.
- `instDirectedSystem` (instance): DirectedSystem (fun n ↦ GL (Fin n) A) (fun m n h ↦ stabilise h).
- `stabilise_injective` (characterisation): stabilise h is injective.
- `stabilise_elementary` (simp): stabilise h (elementary hij a) = elementary (castLE_ne hij) a.
- `glMap_stabilise` (functoriality): glMap f (stabilise h g) = stabilise h (glMap f g).
- `stabilise_eq_fromBlocks` (compatibility): The matrix of stabilise h g is Matrix.fromBlocks g 0 0 1 reindexed along finSumFinEquiv and the cast m + (n − m) = n.
- `det_stabilise` (compatibility): For commutative A, Matrix.GeneralLinearGroup.det (stabilise h g) = Matrix.GeneralLinearGroup.det g.

**Unit tests.**

- `stabilise_one_two_unit` (computation): For u : Aˣ viewed in GL (Fin 1) A, stabilise (1 ≤ 2) u is the diagonal matrix diag(u, 1).
- `stabilise_zero` (degenerate): stabilise (0 ≤ n) sends the unique element of GL (Fin 0) A to 1.
- `stabilise_transvectionStruct` (compatibility): For A commutative and t : Matrix.TransvectionStruct (Fin m) A, the matrix of stabilise (m ≤ m + p) t.toMatrix is (t.sumInl (Fin p)).toMatrix = fromBlocks t.toMatrix 0 0 1 after reindexing along finSumFinEquiv (Mathlib's toMatrix_sumInl).
- `stabilise_ne_right_corner` (non-example): For u ≠ 1 in Aˣ, stabilise (1 ≤ 2) u = diag(u, 1) ≠ diag(1, u): the embedding g ↦ diag(1, g) is a different map, conjugate to this one by the swap, and the directed system fixes this one.

**Acceptance.**

- stabilise_{1,2}(u) = diag(u, 1) for u ∈ Aˣ = GL_1(A).
- The two directed-system laws hold, so Mathlib's DirectLimit applies (U.1/stable-general-linear-group).
- det (stabilise g) = det g for A commutative.

**Used by.**

- K-book III.1, definition of GL(R): the union GL_1(R) ⊂ GL_2(R) ⊂ ⋯ is formed along this embedding
- KTheoryLowDegrees:U.1/stable-general-linear-group: the transition maps of the direct limit
- K2SymbolsBrauer:T.1/stabilisation: St_n(R) → St_{n+1}(R) covers this embedding, so φ : St(R) → E(R) is a map of directed systems
- KTheoryLowDegrees:U.3/stable-determinant: det is compatible with stabilisation, so it passes to GL(A) and K₁(A)

**Depends on.** this roadmap: `U.1/elementary-matrix`, `U.1/general-linear-map`; libraries: `mathlib:Matrix.fromBlocks`, `mathlib:Matrix.fromBlocks_multiply`, `mathlib:Matrix.fromBlocks_one`, `mathlib:Matrix.reindexAlgEquiv`, `mathlib:Matrix.reindexAlgEquiv_mul`, `mathlib:finSumFinEquiv`, `mathlib:DirectedSystem`, `mathlib:Matrix.TransvectionStruct.toMatrix_sumInl`, `mathlib:Matrix.det_fromBlocks_zero₂₁`.

**Sources.**

- `Kbook.2013`, III.1, opening paragraph of § 1 (PDF p. 187; draft p. 179): “Let R be an associative ring with unit. Identifying each n×n matrix g with the larger matrix g 0 0 1 gives an embedding of GLn(R) into GLn+1(R).” — The embedding g ↦ diag(g, 1); the displayed 2 × 2 block matrix appears in the text layer as 'g 0 0 1'.
- `Bass.1964`, § 1 (p. 8 of the article; PDF p. 5 of the numdam file): “We shall identify GL(n, A) with a subgroup of GL(n+m, A) by identifying α∈GL(n, A) with” — Bass's stabilisation in several steps at once (the display that follows is the block matrix with blocks α, 0, 0, 1_m); this is stabilise_{n,n+m}.

### The infinite general linear group GL(A)

`U.1/stable-general-linear-group` · definition · planet “Infinite general linear group”

GL(A) := DirectLimit of the directed system (GL_n(A), stabilise_{m,n}) over ℕ, using Mathlib's DirectLimit (Mathlib/Order/DirectedInverseSystem.lean) with the Group instance of Mathlib/Algebra/Colimit/DirectLimit.lean. The canonical map of_n : GL_n(A) →* GL(A) sends g to its class; of_n ∘ stabilise_{m,n} = of_m. GL is a functor of arbitrary rings: GL(f) := DirectLimit.map of the glMap f. Choice of model: Mathlib's DirectLimit already carries the group structure (mul_def, inv_def), the universal property (DirectLimit.lift with lift_mul), the representation of elements (exists_eq_mk) and an explicit equality relation (equal after a common stabilisation); a union model would need a new carrier of ℕ × ℕ matrices differing from the identity in finitely many entries, with its own multiplication and inverse, and would duplicate all of this. Because the transition maps are injective, of_n is injective (DirectLimit.mk_injective) and the direct limit is the K-book's union GL_1(A) ⊂ GL_2(A) ⊂ ⋯. The stable Steinberg group of K2SymbolsBrauer T.1 is also a Mathlib DirectLimit, so φ : St(A) → GL(A) is a DirectLimit.map.

**Hypotheses.**

- A is an associative unital ring (commutativity not assumed).

**Proof.**

1. Take ι = ℕ with its order (directed and nonempty), G n = GL (Fin n) A and transition maps stabilise, whose DirectedSystem instance is U.1/stabilisation-map; since each transition map is a MonoidHom, Mathlib's DirectLimit carries a Group instance.
2. Package of_n g := ⟦⟨n, g⟩⟧ as a MonoidHom: DirectLimit.mul_def and DirectLimit.one_def say the operations are computed in a common GL_n.
3. Compatibility of_n (stabilise_{m,n} g) = of_m g is DirectLimit.mk_apply.
4. Universal property: a family φ_n : GL_n(A) →* H with φ_n ∘ stabilise_{m,n} = φ_m induces lift φ : GL(A) →* H through DirectLimit.lift, multiplicative by DirectLimit.lift_mul, with lift φ ∘ of_n = φ_n (DirectLimit.lift_def); uniqueness from DirectLimit.induction.
5. Functoriality: glMap f commutes with stabilise (U.1/stabilisation-map), so DirectLimit.map gives GL(f) : GL(A) →* GL(B) with GL(f) ∘ of_n = of_n ∘ glMap f; map_id and map_comp follow from glMap_id and glMap_comp and DirectLimit.induction.
6. Injectivity of of_n is DirectLimit.mk_injective applied to stabilise_injective.

**API.**

- `StableGL` (constructor): StableGL A := DirectLimit (fun n : ℕ ↦ GL (Fin n) A) (fun _ _ h ↦ stabilise h).
- `StableGL.instGroup` (instance): The group structure from Mathlib's DirectLimit (products and inverses computed in a common GL_n).
- `StableGL.of` (constructor): StableGL.of n : GL (Fin n) A →* StableGL A.
- `StableGL.of_stabilise` (simp): StableGL.of n (stabilise h g) = StableGL.of m g.
- `StableGL.of_injective` (characterisation): StableGL.of n is injective.
- `StableGL.exists_of` (characterisation): ∀ x, ∃ n g, x = StableGL.of n g (promoted to U.1/finite-representatives).
- `StableGL.of_eq_of_iff` (characterisation): StableGL.of m g = StableGL.of n h ↔ stabilise (m ≤ max m n) g = stabilise (n ≤ max m n) h (promoted to U.1/stable-equality-criterion).
- `StableGL.lift` (universal-property): A compatible family φ n : GL (Fin n) A →* H (φ n ∘ stabilise h = φ m) gives StableGL.lift φ : StableGL A →* H.
- `StableGL.lift_of` (universal-property): StableGL.lift φ (StableGL.of n g) = φ n g.
- `StableGL.hom_ext` (extensionality): Two homomorphisms out of StableGL A that agree on every StableGL.of n are equal.
- `StableGL.map` (functoriality): StableGL.map f : StableGL A →* StableGL B for f : A →+* B, with map f (of n g) = of n (glMap f g).
- `StableGL.map_id` (functoriality): StableGL.map (RingHom.id A) = MonoidHom.id.
- `StableGL.map_comp` (functoriality): StableGL.map (g.comp f) = (StableGL.map g).comp (StableGL.map f).
- `StableGL.induction_on` (other): To prove a property of all x : StableGL A it suffices to prove it for StableGL.of n g.

**Unit tests.**

- `StableGL.of_one_eq_of_two` (computation): For u : Aˣ, StableGL.of 1 u = StableGL.of 2 (diag(u, 1)).
- `StableGL.subsingleton_zero_ring` (degenerate): If A is the zero ring then StableGL A is trivial.
- `StableGL.map_int_zmod` (compatibility): StableGL.map (Int.castRingHom (ZMod 2)) (StableGL.of n g) = StableGL.of n (Matrix.GeneralLinearGroup.map (Int.castRingHom (ZMod 2)) g) for g : GL (Fin n) ℤ.
- `StableGL.of_two_right_corner_ne` (non-example): For u ≠ 1 in Aˣ, StableGL.of 2 (diag(1, u)) ≠ StableGL.of 1 u: the rank-two representative of of 1 u is diag(u, 1), not diag(1, u).

**Acceptance.**

- Every element of GL(A) is of_n g for some n (U.1/finite-representatives), and equality is equality after a common stabilisation (U.1/stable-equality-criterion).
- of_1 u = of_2 diag(u, 1) and of_2 diag(1, u) ≠ of_1 u for u ≠ 1.
- The universal property yields the stable determinant of U.3 from the finite determinants.

**Used by.**

- K-book III.1.1, Definition 1.1: K₁(R) = GL(R)/[GL(R), GL(R)]
- KTheoryLowDegrees:U.1/stable-elementary-subgroup: E(A) is a subgroup of GL(A)
- KTheoryLowDegrees:U.2/K1: K₁(A) = GL(A)/E(A)
- GeneralAlgebraicKTheory:K.2:plus: the plus construction BGL(A)⁺ is taken on the classifying space of this group
- StableHomotopyKTheory:H.4/gl-telescope-plus-comparison: B(S⁻¹S) ≃ Z × BGL(R)⁺ with GL(R) = colim Aut(s_n)
- KTheoryLowDegrees:U.5: GL(I) is the kernel of GL(A) → GL(A/I)

**Depends on.** this roadmap: `U.1/stabilisation-map`, `U.1/general-linear-map`; libraries: `mathlib:DirectLimit`, `mathlib:DirectedSystem`, `mathlib:DirectLimit.mul_def`, `mathlib:DirectLimit.one_def`, `mathlib:DirectLimit.mk_apply`, `mathlib:DirectLimit.lift`, `mathlib:DirectLimit.lift_def`, `mathlib:DirectLimit.lift_mul`, `mathlib:DirectLimit.map`, `mathlib:DirectLimit.induction`, `mathlib:DirectLimit.mk_injective`.

**Sources.**

- `Kbook.2013`, III.1, opening paragraph of § 1 (PDF p. 187; draft p. 179): “The union of the resulting sequence GL1(R) ⊂GL2(R) ⊂· · · ⊂GLn(R) ⊂GLn+1(R) ⊂· · · is called the infinite general linear group GL(R).” — The object defined here; the direct limit along injective maps is this union.
- `Bass.1964`, § 1 (p. 8 of the article; PDF p. 5 of the numdam file): “When q = A we write GL(A) = GL(A, A) and E(A) = E(A, A). GL(A) is called the stable general linear group over A.” — Bass's name for the same group, over an arbitrary ring A.

### Finite representatives in GL(A)

`U.1/finite-representatives` · lemma

Every x ∈ GL(A) equals of_n g for some n and g ∈ GL_n(A). Any finitely many x_1, …, x_k ∈ GL(A) are of_n g_1, …, of_n g_k for one common n, and then for every larger n (replace g_i by stabilise g_i). Consequently a statement about finitely many elements of GL(A), or about a word in them, can be checked in a single GL_n(A) with n as large as needed.

**Hypotheses.**

- A is an associative unital ring; x_1, …, x_k ∈ GL(A) (k finite).

**Proof.**

1. One element: DirectLimit.exists_eq_mk.
2. Two elements: DirectLimit.exists_eq_mk₂ gives a common index; for k elements induct on k using that ℕ is directed (take the maximum index) and of_n (stabilise_{m,n} g) = of_m g (DirectLimit.eq_of_le).
3. Larger n: of_n g = of_{n'} (stabilise_{n,n'} g) for every n' ≥ n.

**Acceptance.**

- Two elements of GL(A) have representatives in a common GL_n(A), so their product and commutator are computed there.
- The index can always be enlarged, which U.1/whitehead-lemma uses to pass from rank n to rank 2n and 3.

**Depends on.** this roadmap: `U.1/stable-general-linear-group`; libraries: `mathlib:DirectLimit.exists_eq_mk`, `mathlib:DirectLimit.exists_eq_mk₂`, `mathlib:DirectLimit.eq_of_le`.

**Sources.**

- `Kbook.2013`, III.1, opening paragraph of § 1 (PDF p. 187; draft p. 179): “The union of the resulting sequence GL1(R) ⊂GL2(R) ⊂· · · ⊂GLn(R) ⊂GLn+1(R) ⊂· · · is called the infinite general linear group GL(R).” — Every element of the union lies in some GLn(R); finitely many lie in a common one because the sequence is increasing.
- `Kbook.2013`, III.1.6, proof of Lemma 1.6 (PDF p. 193; draft p. 185): “Next we observe that there is no harm in stabilizing, i.e., replacing Q by Q⊕Rm and P ⊕Q ∼= Rn by P ⊕(Q⊕Rm) ∼= Rn+m. This is because GLn(R) →GL(R) factors through GLn+m(R).” — The enlargement of the representing index, used throughout the source.

### Equality in GL(A) is equality after a common stabilisation

`U.1/stable-equality-criterion` · lemma

For g ∈ GL_m(A) and h ∈ GL_n(A) the following are equivalent: (i) of_m g = of_n h in GL(A); (ii) stabilise_{m,k} g = stabilise_{n,k} h for some k ≥ m, n; (iii) stabilise_{m,k} g = stabilise_{n,k} h for every k ≥ max(m, n); (iv) stabilise_{m,max(m,n)} g = stabilise_{n,max(m,n)} h. In particular of_n : GL_n(A) → GL(A) is injective, so GL_n(A) is identified with a subgroup of GL(A), and of_n g = 1 iff g = 1.

**Hypotheses.**

- A is an associative unital ring; g ∈ GL_m(A), h ∈ GL_n(A).

**Proof.**

1. (i) ⇔ (ii) is the definition of the setoid defining Mathlib's DirectLimit (DirectLimit.setoid, via Quotient.eq).
2. (ii) ⇒ (iii): if the images agree at k and k′ ≥ max(m, n) then they agree at max(k, k′) by applying stabilise, and hence at k′ because stabilise_{k′, max(k,k′)} is injective (U.1/stabilisation-map).
3. (iii) ⇒ (iv) ⇒ (ii) are immediate.
4. Injectivity of of_n is the case m = n together with stabilise_{n,k} injective (DirectLimit.mk_injective).

**Acceptance.**

- of_2 diag(u, 1) = of_3 diag(u, 1, 1) and of_2 diag(1, u) ≠ of_1 u for u ≠ 1.
- of_n is injective for every n.

**Depends on.** this roadmap: `U.1/stable-general-linear-group`, `U.1/stabilisation-map`; libraries: `mathlib:DirectLimit.setoid`, `mathlib:DirectLimit.mk_injective`.

**Sources.**

- `Kbook.2013`, III.1, opening paragraph of § 1 (PDF p. 187; draft p. 179): “Identifying each n×n matrix g with the larger matrix g 0 0 1 gives an embedding of GLn(R) into GLn+1(R).” — The transition maps are embeddings, which is what upgrades equality at some stage to equality at every subsequent stage.
- `Bass.1964`, § 1 (p. 8 of the article; PDF p. 5 of the numdam file): “This done, we set GL(A, q) = ∪_n GL(n, A, q) and E(A, q) = ∪_n E(n, A, q).” — Bass treats GL(A) as the union of the GL(n, A) identified along stabilisation; the criterion makes that identification explicit for the direct-limit model.

### Block sums of invertible matrices

`U.1/block-sum` · construction

For m and n, blockSum : GL_m(A) × GL_n(A) →* GL_{m+n}(A) sends (g, h) to g ⊕ h, the matrix Matrix.fromBlocks g 0 0 h reindexed along finSumFinEquiv : Fin m ⊕ Fin n ≃ Fin (m + n). It is an injective group homomorphism for the componentwise product; g ⊕ 1_n = stabilise_{m,m+n} g; it is associative up to the identification of Fin (l + m + n) for the two bracketings, and the summand GL_0 is neutral up to the cast Fin (0 + n) = Fin n; e_ij(a) ⊕ 1 = e_ij(a) and 1 ⊕ e_ij(a) = e_{m+i, m+j}(a) (indices cast); glMap f (g ⊕ h) = glMap f g ⊕ glMap f h; for commutative A, det(g ⊕ h) = det g · det h. Swapping the summands is conjugation by the block permutation matrix w of the swap Fin m ⊕ Fin n ≃ Fin n ⊕ Fin m: h ⊕ g = w (g ⊕ h) w⁻¹; w need not lie in E_{m+n}(A).

**Hypotheses.**

- A is an associative unital ring; m, n ∈ ℕ.

**Proof.**

1. fromBlocks g 0 0 h · fromBlocks g′ 0 0 h′ = fromBlocks (gg′) 0 0 (hh′) (Matrix.fromBlocks_multiply) and fromBlocks 1 0 0 1 = 1 (Matrix.fromBlocks_one); reindexing along an equivalence is a ring isomorphism (Matrix.reindexAlgEquiv, reindexAlgEquiv_mul). Hence (g, h) ↦ g ⊕ h is a MonoidHom with (g ⊕ h)⁻¹ = g⁻¹ ⊕ h⁻¹.
2. g ⊕ 1 = stabilise g compares entries (U.1/stabilisation-map).
3. Associativity and the neutral summand: both sides have the same entries after the canonical identification of index sets.
4. Elementary matrices: fromBlocks (1 + single i j a) 0 0 1 = 1 + single (inl i) (inl j) a, and similarly on the second summand.
5. Swap: (fromBlocks g 0 0 h).submatrix Sum.swap Sum.swap = fromBlocks h 0 0 g (Matrix.fromBlocks_submatrix_sum_swap_sum_swap), and reindexing along a permutation is conjugation by its permutation matrix.
6. Determinant for commutative A: Matrix.det_fromBlocks_zero₂₁.
7. For commutative A, under Matrix.GeneralLinearGroup.toLin the block sum corresponds to Tau Ceti's LinearMap.GeneralLinearGroup.prodMap on (Fin m → A) × (Fin n → A) transported to Fin (m + n) → A.

**API.**

- `blockSum` (constructor): blockSum : GL (Fin m) A × GL (Fin n) A →* GL (Fin (m + n)) A, (g, h) ↦ reindex finSumFinEquiv (fromBlocks g 0 0 h).
- `blockSum_apply` (simp): The entries of blockSum (g, h): g on Fin m × Fin m, h on the last n × n block, 0 elsewhere.
- `blockSum_one_right` (compatibility): blockSum (g, 1) = stabilise (m ≤ m + n) g.
- `blockSum_assoc` (relation): blockSum (blockSum (f, g), h) = cast (blockSum (f, blockSum (g, h))) along Fin (l + m + n) = Fin (l + (m + n)).
- `blockSum_zero_left` (other): blockSum (1 : GL (Fin 0) A, h) = cast h along Fin (0 + n) = Fin n.
- `blockSum_swap` (relation): blockSum (h, g) = w * cast (blockSum (g, h)) * w⁻¹ with w the permutation matrix of the block swap.
- `glMap_blockSum` (functoriality): glMap f (blockSum (g, h)) = blockSum (glMap f g, glMap f h).
- `blockSum_elementary` (simp): blockSum (elementary hij a, 1) = elementary (inl-cast) a and blockSum (1, elementary hij a) = elementary (shifted indices) a.
- `det_blockSum` (compatibility): For commutative A, det (blockSum (g, h)) = det g * det h.
- `toLin_blockSum` (compatibility): For commutative A, toLin (blockSum (g, h)) corresponds to LinearMap.GeneralLinearGroup.prodMap (toLin g) (toLin h) under Fin (m + n) → A ≃ (Fin m → A) × (Fin n → A).

**Unit tests.**

- `blockSum_units` (computation): For u, v : Aˣ in GL (Fin 1) A, blockSum (u, v) = diag(u, v) in GL (Fin 2) A.
- `blockSum_one_eq_stabilise` (degenerate): blockSum (g, (1 : GL (Fin 0) A)) = g up to the cast Fin (m + 0) = Fin m, and blockSum (g, 1) = stabilise g.
- `det_blockSum_int` (compatibility): For A = ℤ, det (blockSum (g, h)) = det g * det h for g : GL (Fin 2) ℤ, h : GL (Fin 3) ℤ, as Mathlib's Matrix.det_fromBlocks_zero₂₁ gives.
- `blockSum_not_comm` (non-example): For u ≠ 1 in Aˣ, blockSum (u, 1) = diag(u, 1) ≠ diag(1, u) = blockSum (1, u): block sum is commutative only up to conjugation.

**Acceptance.**

- blockSum is a homomorphism and blockSum (g, 1) = stabilise g.
- det (g ⊕ h) = det g · det h for commutative A.
- h ⊕ g is conjugate to g ⊕ h, which is what makes [g ⊕ h] = [g][h] in K₁ (U.2/K1-block-sum).

**Used by.**

- K-book Ex. III.1.6: [α ⊕ β] = [α][β] in K₁ describes the group law of K₁ by block sums
- KTheoryLowDegrees:U.1/whitehead-diagonal and U.1/commutator-in-elementary: the identities g ⊕ g⁻¹ ∈ E_{2n}(A) and [g, h] ⊕ 1 = (g ⊕ g⁻¹)(h ⊕ h⁻¹)((hg)⁻¹ ⊕ hg) are statements about block sums
- StableHomotopyKTheory:H.4/gl-telescope-plus-comparison: the monoidal structure of ⊔_n GL_n(R) is block sum
- KTheoryLowDegrees:U.2/automorphism-class-direct-sum: the class of α ⊕ β for automorphisms of projectives

**Depends on.** this roadmap: `U.1/stabilisation-map`, `U.1/general-linear-map`, `U.1/elementary-matrix`; libraries: `mathlib:Matrix.fromBlocks`, `mathlib:Matrix.fromBlocks_multiply`, `mathlib:Matrix.fromBlocks_one`, `mathlib:Matrix.fromBlocks_submatrix_sum_swap_sum_swap`, `mathlib:Matrix.reindexAlgEquiv`, `mathlib:Matrix.reindexAlgEquiv_mul`, `mathlib:finSumFinEquiv`, `mathlib:Matrix.det_fromBlocks_zero₂₁`, `mathlib:Matrix.GeneralLinearGroup.toLin`, `tauceti:LinearMap.GeneralLinearGroup.prodMap`.

**Sources.**

- `Kbook.2013`, Exercise III.1.6 (PDF p. 197; draft p. 189): “1.6. Here is another interpretation of the group law for K1. For each m, n, let ⊕mn denote the group homomorphism GLm(R) × GLn(R) →GLm+n(R) sending (α, β) to the block diagonal matrix” — The block-sum homomorphism; the exercise goes on to ask for [α ⊕ β] = [α][β] in K₁ (U.2/K1-block-sum).

### The elementary subgroup E_n(A)

`U.1/elementary-subgroup` · definition

E_n(A) := Subgroup.closure {e_ij(a) : i ≠ j, a ∈ A} ≤ GL_n(A) for any ring A and finite index type n (for Fin n, the K-book's E_n(R)). E_1(A) = 1 since there is no pair i ≠ j. For commutative A, E_n(A) ≤ SL_n(A), i.e. E_n(A) lies in the range of Matrix.SpecialLinearGroup.toGL, and E_n(A) is the subgroup generated by Tau Ceti's transvectionUnit's (equivalently the image under toGL of the subgroup generated by Mathlib's TransvectionStruct.toSpecialLinearGroup). Stabilisation maps E_m(A) into E_n(A), glMap f maps E_n(A) into E_n(B), and reindexing preserves E_n.

**Hypotheses.**

- A is an associative unital ring; n is a finite type with decidable equality.

**Proof.**

1. Define E_n(A) as the closure of the set of elementary matrices; Subgroup.closure_induction gives induction on products of generators and their inverses.
2. E_1: the generating set is empty, so the closure is ⊥.
3. For commutative A each generator has determinant 1 (det_elementary), so E_n(A) ≤ ker det = range toGL (Matrix.SpecialLinearGroup.range_toGL).
4. stabilise and glMap send generators to generators (stabilise_elementary, glMap_elementary), so the image of the closure is contained in the closure of the generators (MonoidHom.map_closure, Subgroup.closure_le).
5. For commutative A, elementary_eq_transvection identifies the generators with TauCeti.transvectionUnit; Tau Ceti's transvectionUnit_mem_of_adjacent then shows that a subgroup containing the adjacent generators in both orientations contains E_n(A).

**API.**

- `elementarySubgroup` (constructor): elementarySubgroup n A := Subgroup.closure {g | ∃ i j (h : i ≠ j) a, g = elementary h a}.
- `elementary_mem` (simp): elementary h a ∈ elementarySubgroup n A.
- `elementarySubgroup.induction` (other): A property closed under 1, products and inverses and true for every elementary h a holds on elementarySubgroup n A.
- `elementarySubgroup_fin_one` (simp): elementarySubgroup (Fin 1) A = ⊥.
- `elementarySubgroup_le_specialLinear` (compatibility): For commutative A, elementarySubgroup n A ≤ (Matrix.SpecialLinearGroup.toGL).range.
- `elementarySubgroup_eq_closure_transvectionUnit` (compatibility): For commutative A, elementarySubgroup n A = Subgroup.closure (range of TauCeti.transvectionUnit).
- `map_stabilise_elementarySubgroup_le` (functoriality): (elementarySubgroup (Fin m) A).map (stabilise h) ≤ elementarySubgroup (Fin n) A.
- `map_glMap_elementarySubgroup_le` (functoriality): (elementarySubgroup n A).map (glMap f) ≤ elementarySubgroup n B; equality for surjective f is U.1/elementary-surjective-map.
- `elementarySubgroup_reindex` (functoriality): Reindexing along n ≃ m maps elementarySubgroup n A onto elementarySubgroup m A.
- `mem_of_adjacent` (characterisation): For commutative A, a subgroup containing elementary h a for all adjacent i, j = i ± 1 and all a contains elementarySubgroup (Fin n) A (from TauCeti.transvectionUnit_mem_of_adjacent).

**Unit tests.**

- `card_elementarySubgroup_zmod_two` (computation): elementarySubgroup (Fin 2) (ZMod 2) has 6 elements and equals ⊤ in GL (Fin 2) (ZMod 2).
- `elementarySubgroup_fin_one_eq_bot` (degenerate): elementarySubgroup (Fin 1) A = ⊥ for every ring A, and elementarySubgroup n A = ⊤ = ⊥ for the zero ring.
- `elementarySubgroup_field_eq` (compatibility): For a field F, elementarySubgroup (Fin n) F = (Matrix.SpecialLinearGroup.toGL).range (from Tau Ceti's closure_range_toSpecialLinearGroup_eq_top_of_field; U.3/field-special-linear-eq-elementary).
- `elementarySubgroup_ne_specialLinear` (non-example): For A = ℝ[x, y]/(x² + y² − 1), the matrix with rows (x, −y), (y, x) lies in SL_2(A) but its stabilisation lies in no elementarySubgroup (Fin n) A (K-book Example III.1.5.4; U.3/SK1-real-circle-nonzero): E_n(A) ≠ SL_n(A) in general.

**Acceptance.**

- E_1(A) = ⊥ and E_2(ZMod 2) has 6 elements (recomputed by enumerating the closure of the elementary matrices).
- E_n(A) ≤ SL_n(A) for commutative A.
- stabilise maps E_m(A) into E_n(A).

**Used by.**

- K-book III.1.2, Bass 1964 § 1: E_n(R) and E(R) = ⋃ E_n(R)
- KTheoryLowDegrees:U.1/elementary-perfect: E_n(A) is perfect for n ≥ 3
- KTheoryLowDegrees:U.3/stable-range-transitive: E_r(A) acts transitively on unimodular columns in the stable range
- KTheoryLowDegrees:U.3/field-special-linear-eq-elementary: E_n(F) = SL_n(F) for a field
- K2SymbolsBrauer:T.1/elementary-matrices-satisfy: φ_n : St_n(R) → E_n(R) is onto E_n(R)
- KTheoryLowDegrees:U.3/dieudonne-kernel: Dieudonné's C_n is E_n(D)

**Depends on.** this roadmap: `U.1/elementary-matrix`, `U.1/stabilisation-map`, `U.1/general-linear-map`; libraries: `mathlib:Subgroup.closure`, `mathlib:Subgroup.closure_induction`, `mathlib:Subgroup.closure_le`, `mathlib:MonoidHom.map_closure`, `mathlib:Matrix.SpecialLinearGroup.range_toGL`, `mathlib:Matrix.TransvectionStruct.toSpecialLinearGroup`, `tauceti:TauCeti.transvectionUnit_mem_of_adjacent`.

**Sources.**

- `Kbook.2013`, III.1.2, Definition 1.2 (PDF p. 188; draft p. 180): “En(R) denotes the subgroup of GLn(R) generated by all elementary matrices eij(r) with 1 ≤i, j ≤n, and the union E(R) of the En(R) is the subgroup of GL(R) generated by all elementary matrices.” — The definition of E_n(R); the stable group is U.1/stable-elementary-subgroup.
- `Bass.1964`, § 1 (p. 8 of the article; PDF p. 5 of the numdam file): “A matrix of the form 1 + ae_ij, i ≠ j, is called elementary, and we denote by E(n, A) the subgroup of GL(n, A) generated by all elementary matrices.” — The same definition in Bass's notation.

### The chain commutator relation for elementary matrices

`U.1/elementary-commutator-chain` · lemma

For any associative unital ring A and pairwise distinct indices i, j, l: ⁅e_ij(a), e_jl(b)⁆ = e_il(ab), where ⁅x, y⁆ = x y x⁻¹ y⁻¹ (Mathlib's commutatorElement, the K-book's convention). The order of the product ab is forced when A is not commutative. For commutative A this is Tau Ceti's commutatorElement_transvectionUnit.

**Hypotheses.**

- A is an associative unital ring; i, j, l are pairwise distinct indices of a finite type n (so n has at least three elements); a, b ∈ A.

**Proof.**

1. Write X = E_ij(a), Y = E_jl(b). Then XY = E_il(ab) (Matrix.single_mul_single_same), while YX = 0 (l ≠ i), X² = Y² = 0, E_il(ab)X = 0 (l ≠ i), YE_il(ab) = 0 (l ≠ i), E_il(ab)Y = 0 (l ≠ j) and XE_il(ab) = 0 (j ≠ i), all by Matrix.single_mul_single_of_ne.
2. Expand (1 + X)(1 + Y)(1 − X)(1 − Y): the surviving terms are 1 + XY = 1 + E_il(ab), which is e_il(ab). This is Bass's computation in Lemma 1.2 and uses no commutativity; Tau Ceti's transvection_mul_transvection_eq_mul_mul proves the equivalent product identity by the same abelian-group computation, stated over a commutative ring.
3. Hence ⁅e_ij(a), e_jl(b)⁆ = e_il(ab). For commutative A the elementary matrices are TauCeti.transvectionUnit (elementary_eq_transvection) and the identity is TauCeti.commutatorElement_transvectionUnit.

**Acceptance.**

- Over ℍ[ℝ], ⁅e_12(i), e_23(j)⁆ = e_13(ij) = e_13(k), not e_13(−k) = e_13(ji).
- For A commutative the statement specialises to Tau Ceti's commutatorElement_transvectionUnit.
- The distinctness hypotheses are all used: for l = i the commutator is not elementary (U.1/rank-two-failure).

**Depends on.** this roadmap: `U.1/elementary-matrix`; libraries: `mathlib:commutatorElement`, `mathlib:Matrix.single_mul_single_same`, `mathlib:Matrix.single_mul_single_of_ne`, `tauceti:TauCeti.commutatorElement_transvectionUnit`, `tauceti:TauCeti.transvection_mul_transvection_eq_mul_mul`.

**Sources.**

- `Kbook.2013`, III.1.3, Commutators 1.3, formula (1.3.1) (PDF p. 190; draft p. 182): “The commutator of two elementary matrices is easy to compute and simple to describe (unless j = k and i = ℓ): [eij(r), ekℓ(s)] = 1 if j≠k and i≠ℓ eiℓ(rs) if j = k and i≠ℓ ekj(−sr) if j≠k and i = ℓ.” — The middle case (j = k, i ≠ ℓ) is this node; the K-book's commutator is [g, h] = ghg⁻¹h⁻¹ (III.1, before Definition 1.1).
- `Bass.1964`, Lemma (1.2) (p. 9 of the article; PDF p. 6 of the numdam file): “Lemma (1.2). — If i, j, and k are distinct, then [1−ae_ij, 1−be_jk] = 1+abe_ik.” — Bass's form, with his commutator [h1, h2] = h1⁻¹h2⁻¹h1h2; since (1 − ae_ij)⁻¹ = 1 + ae_ij it is the same identity.

### Elementary matrices at non-chaining positions commute

`U.1/elementary-commute` · lemma

For any associative unital ring A, if j ≠ k and i ≠ l then e_ij(a) and e_kl(b) commute, i.e. ⁅e_ij(a), e_kl(b)⁆ = 1 (including the case (k, l) = (i, j)). For commutative A this is Tau Ceti's commute_transvectionUnit.

**Hypotheses.**

- A is an associative unital ring; i ≠ j and k ≠ l are indices with j ≠ k and i ≠ l; a, b ∈ A.

**Proof.**

1. E_ij(a)E_kl(b) = 0 because j ≠ k and E_kl(b)E_ij(a) = 0 because l ≠ i (Matrix.single_mul_single_of_ne).
2. Hence (1 + E_ij(a))(1 + E_kl(b)) = 1 + E_ij(a) + E_kl(b) = (1 + E_kl(b))(1 + E_ij(a)); no commutativity of A is used (Tau Ceti's commute_transvection has the same abelian-group proof, stated over a commutative ring).

**Acceptance.**

- e_12(a) and e_12(b) commute; e_12(a) and e_34(b) commute; e_12(a) and e_32(b) commute over ℍ[ℝ].
- e_12(a) and e_21(b) are not covered (j = k and i = l), and do not commute in general.

**Depends on.** this roadmap: `U.1/elementary-matrix`; libraries: `mathlib:commutatorElement`, `mathlib:Commute`, `mathlib:Matrix.single_mul_single_of_ne`, `tauceti:TauCeti.commute_transvectionUnit`, `tauceti:TauCeti.commute_transvection`.

**Sources.**

- `Kbook.2013`, III.1.3, formula (1.3.1) (PDF p. 190; draft p. 182): “[eij(r), ekℓ(s)] = 1 if j≠k and i≠ℓ” — The first case of (1.3.1).

### The reversed chain commutator relation

`U.1/elementary-commutator-reverse` · lemma

For any associative unital ring A and pairwise distinct i, j, k: ⁅e_ij(a), e_ki(b)⁆ = e_kj(−ba). For commutative A this is Tau Ceti's commutatorElement_transvectionUnit_reverse, whose right-hand side is transvectionUnit (−(d·c)).

**Hypotheses.**

- A is an associative unital ring; i, j, k pairwise distinct; a, b ∈ A.

**Proof.**

1. ⁅x, y⁆ = ⁅y, x⁆⁻¹ (commutatorElement_inv).
2. ⁅e_ki(b), e_ij(a)⁆ = e_kj(ba) by U.1/elementary-commutator-chain with the chain k, i, j.
3. Invert: e_kj(ba)⁻¹ = e_kj(−ba) (elementary_inv).

**Acceptance.**

- Over ℍ[ℝ], ⁅e_12(i), e_31(j)⁆ = e_32(−ji) = e_32(k).
- Together with U.1/elementary-commutator-chain and U.1/elementary-commute this covers every pair of elementary matrices except e_ij against e_ji.

**Depends on.** this roadmap: `U.1/elementary-commutator-chain`, `U.1/elementary-matrix`; libraries: `mathlib:commutatorElement_inv`, `tauceti:TauCeti.commutatorElement_transvectionUnit_reverse`.

**Sources.**

- `Kbook.2013`, III.1.3, formula (1.3.1) (PDF p. 190; draft p. 182): “ekj(−sr) if j≠k and i = ℓ” — The third case of (1.3.1), with the order sr of the source (here b a).

### Signed transpositions and even permutation matrices are elementary

`U.1/signed-transposition` · lemma

For any ring A and i ≠ j, w̄_ij := e_ij(1)e_ji(−1)e_ij(1) ∈ E_n(A) is the signed permutation matrix with w̄_ij e_j = e_i, w̄_ij e_i = −e_j and w̄_ij e_k = e_k for k ∉ {i, j} (column vectors); on the left it replaces row i by row j and row j by minus row i. Its inverse is w̄_ji, and w̄_ij² is diag(−1, −1) at positions i, j. For n ≥ 3 and distinct i, j, k, the product w̄_jk w̄_ij is the (unsigned) permutation matrix of the 3-cycle e_i ↦ e_k ↦ e_j ↦ e_i, so the permutation matrix of every even permutation of the basis lies in E_n(A). For commutative A, w̄_ij is Tau Ceti's transvectionWeylElement.

**Hypotheses.**

- A is an associative unital ring; i ≠ j (and k distinct from both for the second part), in a finite index type.

**Proof.**

1. Multiply the three matrices using the row-operation description of U.1/elementary-matrix: for n = 2 the product is the matrix with rows (0, 1) and (−1, 0); in general it acts as displayed on the basis.
2. w̄_ij w̄_ji = 1 by the same computation (compare Tau Ceti's transvectionWeylElement_inv), and w̄_ij² sends e_i ↦ −e_i, e_j ↦ −e_j.
3. For distinct i, j, k: w̄_ij e_i = −e_j, w̄_ij e_j = e_i, w̄_ij e_k = e_k and w̄_jk e_j = −e_k, w̄_jk e_k = e_j, w̄_jk e_i = e_i; hence w̄_jk w̄_ij sends e_i ↦ w̄_jk(−e_j) = e_k, e_j ↦ w̄_jk(e_i) = e_i and e_k ↦ w̄_jk(e_k) = e_j, the unsigned permutation matrix of the 3-cycle e_i ↦ e_k ↦ e_j ↦ e_i.
4. Every even permutation is a product of 3-cycles, and σ ↦ P_σ is a homomorphism, so P_σ ∈ E_n(A) for σ even once each 3-cycle matrix lies in E_n(A).

**Acceptance.**

- For n = 2, e_12(1)e_21(−1)e_12(1) has rows (0, 1) and (−1, 0) (recomputed).
- For n = 3 with (i, j, k) = (1, 2, 3), the product w̄_23 w̄_12 is the permutation matrix sending e_1 ↦ e_3, e_2 ↦ e_1, e_3 ↦ e_2, with no signs (recomputed by multiplying the 3 × 3 matrices with rows (0,1,0),(−1,0,0),(0,0,1) and (1,0,0),(0,0,1),(0,−1,0)).
- For commutative A, w̄_ij = TauCeti.transvectionWeylElement hij.

**Depends on.** this roadmap: `U.1/elementary-matrix`, `U.1/elementary-subgroup`; libraries: `tauceti:TauCeti.transvectionWeylElement`, `tauceti:TauCeti.transvectionWeylElement_inv`.

**Sources.**

- `Kbook.2013`, III.1.2.1, Example 1.2.1 (PDF p. 188; draft p. 180): “A signed permutation matrix is one which permutes the standard basis {ei} up to sign, i.e., it permutes the set {±e1, . . . , ±en}. The following signed permutation matrix belongs to E2(R): ¯w12 := e12(1)e21(−1)e12(1) =” — The definition of w̄_12 as an elementary word.
- `Kbook.2013`, III.1.2.1, Example 1.2.1 (PDF p. 188; draft p. 180): “Since the products ¯wjk ¯wij correspond to cyclic permutations of 3 basis elements, every matrix corresponding to an even permutation of basis elements belongs to En(R).” — The even-permutation statement; the recomputation in the acceptance confirms that w̄_23 w̄_12 is the unsigned 3-cycle.

### Elementary subgroups surject along surjective ring maps

`U.1/elementary-surjective-map` · lemma

If f : A → B is a surjective homomorphism of rings then glMap f maps E_n(A) onto E_n(B) for every n: (E_n(A)).map (glMap f) = E_n(B). In contrast glMap f : GL_n(A) → GL_n(B) need not be surjective (U.1/general-linear-map).

**Hypotheses.**

- A, B associative unital rings; f : A →+* B surjective; n a finite index type.

**Proof.**

1. The image of a closure is the closure of the image (MonoidHom.map_closure).
2. glMap f (e_ij(a)) = e_ij(f a) (glMap_elementary), and every generator e_ij(b) of E_n(B) is e_ij(f a) for some a because f is surjective; so the image of the generating set of E_n(A) is the generating set of E_n(B).

**Acceptance.**

- E_2(ℤ) → E_2(ℤ/5ℤ) is onto although GL_2(ℤ) → GL_2(ℤ/5ℤ) is not (diag(2, 1)).
- Used by U.1/stable-elementary-subgroup for the stable statement E(A) → E(B) onto, and by U.5 for the relative sequence.

**Depends on.** this roadmap: `U.1/elementary-subgroup`, `U.1/general-linear-map`, `U.1/elementary-matrix`; libraries: `mathlib:MonoidHom.map_closure`.

**Sources.**

- `Kbook.2013`, III.1.2.3, Remark 1.2.3 (Surjections) (PDF p. 189; draft p. 181): “If I is an ideal of R, each homomorphism En(R) →En(R/I) is onto, because the generators eij(r) of En(R) map onto the generators eij(¯r) of En(R/I).” — The statement for quotient maps; the argument works for any surjective ring map.
- `Bass.1964`, Lemma (1.1) (p. 8 of the article; PDF p. 5 of the numdam file): “Lemma (1.1) (“Homotopy Extension”). — If A→B is a surjective ring homomorphism, then E(n, A, q)→E(n, B, qB) is surjective for all n and q.” — The statement for an arbitrary surjection (q = A gives this node).

### E_n(A) is perfect for n ≥ 3

`U.1/elementary-perfect` · theorem · planet “E_n(R) is perfect for n ≥ 3”

For any ring A and a finite index type n with at least three elements (for Fin n: n ≥ 3), ⁅E_n(A), E_n(A)⁆ = E_n(A); explicitly e_ij(a) = ⁅e_ik(a), e_kj(1)⁆ for any k ∉ {i, j}. The bound is sharp: E_2(𝔽_2) and E_2(𝔽_3) are not perfect (U.1/rank-two-failure).

**Hypotheses.**

- A is an associative unital ring.
- The index type has at least three elements.

**Proof.**

1. ⁅E_n(A), E_n(A)⁆ ≤ E_n(A) because a subgroup contains its own commutator subgroup (Subgroup.commutator_le).
2. For i ≠ j choose k ∉ {i, j} (possible since there are at least three indices); U.1/elementary-commutator-chain with the chain i, k, j gives ⁅e_ik(a), e_kj(1)⁆ = e_ij(a·1) = e_ij(a), a commutator of two elements of E_n(A).
3. So every generator lies in ⁅E_n(A), E_n(A)⁆, and E_n(A) ≤ ⁅E_n(A), E_n(A)⁆ by Subgroup.closure_le.

**Acceptance.**

- For A = ℤ and n = 3: e_12(5) = ⁅e_13(5), e_32(1)⁆.
- The statement is false for n = 2 and A = 𝔽_2 or 𝔽_3.

**Depends on.** this roadmap: `U.1/elementary-subgroup`, `U.1/elementary-commutator-chain`; libraries: `mathlib:Subgroup.commutator_le`, `mathlib:Subgroup.closure_le`.

**Sources.**

- `Kbook.2013`, III.1.3.2, Lemma 1.3.2 (PDF p. 190; draft p. 182): “Lemma 1.3.2. If n ≥3 then En(R) is a perfect group. Proof. If i, j, k are distinct then eij(r) = [eik(r), ekj(1)].” — The theorem and its proof.
- `Bass.1964`, Corollary (1.5) (p. 9 of the article; PDF p. 6 of the numdam file): “Corollary (1.5). — (i) E(n, A) = [E(n, A), E(n, A)] for n ≥ 3.” — The same statement over an arbitrary ring.

### Block unitriangular matrices are elementary

`U.1/block-unitriangular-elementary` · lemma

For p, q ∈ ℕ, any ring A and any p × q matrix X over A, the block matrix [[1_p, X], [0, 1_q]] (in GL_{p+q}(A) after reindexing along finSumFinEquiv) equals the product of the pq pairwise commuting elementary matrices e_{i, p+j}(X_ij), hence lies in E_{p+q}(A); likewise [[1_p, 0], [Y, 1_q]] = ∏ e_{p+j, i}(Y_ji) ∈ E_{p+q}(A) for a q × p matrix Y. No lower bound on p + q is needed (if p = 0 or q = 0 both matrices are 1).

**Hypotheses.**

- A is an associative unital ring; X is p × q and Y is q × p over A.

**Proof.**

1. For i, k < p and j, l < q, E_{i,p+j}(x)·E_{k,p+l}(y) = 0 since p + j ≠ k, so the matrices N_ij = E_{i,p+j}(X_ij) have pairwise zero products and the corresponding elementary matrices commute (U.1/elementary-commute).
2. Hence ∏_{i,j} (1 + N_ij) = 1 + Σ_{i,j} N_ij, which is the block matrix [[1, X], [0, 1]] (fromBlocks 1 X 0 1).
3. The lower block case is the same with the roles of the blocks exchanged.

**Acceptance.**

- [[1, X], [0, 1]] ∈ E_{p+q}(A) for every X, e.g. [[1, g], [0, 1]] for g ∈ GL_n(A) with p = q = n.
- The factorisation has at most pq nontrivial factors.

**Depends on.** this roadmap: `U.1/elementary-subgroup`, `U.1/elementary-commute`, `U.1/elementary-matrix`; libraries: `mathlib:Matrix.fromBlocks`, `mathlib:Matrix.fromBlocks_multiply`, `mathlib:finSumFinEquiv`.

**Sources.**

- `Kbook.2013`, Exercise I.1.11 (Whitehead) (PDF p. 14; draft p. 6): “1.11. (Whitehead) If g ∈GLn(R), verify the following identity in GL2n(R) :” — The identity that follows is a product of block unitriangular matrices; that each of them is a product of elementary matrices is what this node isolates.
- `Bass.1964`, Lemma (1.7), proof (p. 10 of the article; PDF p. 7 of the numdam file): “Then clearly τ = τ1τ2^σ τ3 ∈ E(2n, A, q).” — Bass uses without comment that block unitriangular matrices with blocks in q are products of q-elementary matrices; this node proves the case q = A.

### Whitehead's identity: diag(g, g⁻¹) is elementary in rank 2n

`U.1/whitehead-diagonal` · lemma

For any ring A and g ∈ GL_n(A): g ⊕ g⁻¹ ∈ E_{2n}(A). Explicitly (K-book Ex. I.1.11), in GL_{2n}(A), g ⊕ g⁻¹ = [[1, g], [0, 1]]·[[1, 0], [−g⁻¹, 1]]·[[1, g], [0, 1]]·[[0, −1], [1, 0]], and [[0, −1], [1, 0]] = [[1, 0], [1, 1]]·[[1, −1], [0, 1]]·[[1, 0], [1, 1]] (blocks 1 = 1_n); all six factors are block unitriangular, so g ⊕ g⁻¹ is a product of at most 3n² + 3n elementary matrices. The rank doubles: nothing is claimed about g ⊕ g⁻¹ in a smaller rank. For n = 1 and A commutative this is Tau Ceti's diag2nUnit_decompose (six transvections).

**Hypotheses.**

- A is an associative unital ring; g ∈ GL_n(A).

**Proof.**

1. Block multiplication (Matrix.fromBlocks_multiply) using g g⁻¹ = 1 = g⁻¹ g only: [[1, g], [0, 1]][[1, 0], [−g⁻¹, 1]] = [[0, g], [−g⁻¹, 1]]; times [[1, g], [0, 1]] gives [[0, g], [−g⁻¹, 0]]; times [[0, −1], [1, 0]] gives [[g, 0], [0, g⁻¹]]. This was recomputed; no commutativity is used.
2. [[1, 0], [1, 1]][[1, −1], [0, 1]] = [[1, −1], [1, 0]] and times [[1, 0], [1, 1]] gives [[0, −1], [1, 0]] (recomputed).
3. Each factor lies in E_{2n}(A) by U.1/block-unitriangular-elementary: three factors with an arbitrary n × n block (n² elementary factors each) and three with block ±1_n (n nontrivial factors each).
4. For n = 1 and commutative A compare Matrix.SpecialLinearGroup.diag2nUnit_decompose: the same matrix diag(a, a⁻¹) as a product of six transvections.

**Acceptance.**

- For n = 1: diag(u, u⁻¹) ∈ E_2(A) for every unit u of every ring.
- For A = ℤ, g = −1: diag(−1, −1) ∈ E_2(ℤ).
- The factor count is 3n² + 3n, and 6 for n = 1, matching diag2nUnit_decompose.

**Depends on.** this roadmap: `U.1/block-unitriangular-elementary`, `U.1/block-sum`, `U.1/elementary-subgroup`; libraries: `mathlib:Matrix.fromBlocks_multiply`, `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose`.

**Sources.**

- `Kbook.2013`, Exercise I.1.11 (Whitehead) (PDF p. 14; draft p. 6): “1.11. (Whitehead) If g ∈GLn(R), verify the following identity in GL2n(R) :” — The identity displayed after this sentence is the one written out in the statement.
- `Kbook.2013`, III.1.2.1, Example 1.2.1 (PDF p. 188; draft p. 180): “Moreover, if g ∈GLn(R) then we see by Ex. I. 1.11 that E2n(R) contains the matrix g 0 0 g−1 .” — The conclusion g ⊕ g⁻¹ ∈ E_{2n}(R); the display 'g 0 0 g−1' is the block matrix diag(g, g⁻¹) in the text layer.
- `Bass.1964`, Lemma (1.7), proof, continued (p. 11 of the article; PDF p. 8 of the numdam file): “Taking a = b⁻¹ we have |b⁻¹ 0; 0 b| ∈ E(2n, A, q)” — Bass's form of the same fact (the display is transcribed linearly).

### The Whitehead congruences diag(a, b) ≡ diag(ab, 1)

`U.1/whitehead-block-product` · lemma

For any ring A and a, b ∈ GL_n(A): a ⊕ b ∈ (ab ⊕ 1)·E_{2n}(A) and a ⊕ b ∈ E_{2n}(A)·(ab ⊕ 1), and the same with ba in place of ab. In particular ab ⊕ 1 and ba ⊕ 1 lie in the same (left and right) coset of E_{2n}(A). (Bass's Lemma 1.7 with q = A.)

**Hypotheses.**

- A is an associative unital ring; a, b ∈ GL_n(A).

**Proof.**

1. Left coset of ab ⊕ 1: a ⊕ b = (a ⊕ 1)(1 ⊕ b) and 1 ⊕ b = (b ⊕ 1)(b⁻¹ ⊕ b), so a ⊕ b = (ab ⊕ 1)(b⁻¹ ⊕ b) with b⁻¹ ⊕ b ∈ E_{2n}(A) (U.1/whitehead-diagonal).
2. Right coset of ba ⊕ 1: a ⊕ b = (1 ⊕ b)(a ⊕ 1) and 1 ⊕ b = (b⁻¹ ⊕ b)(b ⊕ 1), so a ⊕ b = (b⁻¹ ⊕ b)(ba ⊕ 1).
3. Right coset of ab ⊕ 1: a ⊕ b = (a ⊕ a⁻¹)(1 ⊕ ab) and 1 ⊕ ab = ((ab)⁻¹ ⊕ ab)(ab ⊕ 1); both correction factors lie in E_{2n}(A).
4. Left coset of ba ⊕ 1: a ⊕ b = (ba ⊕ 1)(a⁻¹b⁻¹a ⊕ b), and by the first step a⁻¹b⁻¹a ⊕ b ∈ (a⁻¹b⁻¹ab ⊕ 1)E_{2n}(A) = (⁅a⁻¹, b⁻¹⁆ ⊕ 1)E_{2n}(A) = E_{2n}(A), since ⁅a⁻¹, b⁻¹⁆ ⊕ 1 ∈ E_{2n}(A) (U.1/commutator-in-elementary).
5. Every identity was recomputed blockwise and uses only associativity and inverses, so it holds over non-commutative rings; this replaces Bass's appeal to transposition for the other cosets, which over a non-commutative ring must be read as applying the lemma to the opposite ring.

**Acceptance.**

- For n = 1 and units u, v: diag(u, v) ≡ diag(uv, 1) ≡ diag(vu, 1) modulo E_2(A); over ℍ[ℝ] with u = i, v = j this gives diag(k, 1) ≡ diag(−k, 1).
- In K₁ this is [g ⊕ h] = [gh] = [hg] (U.2/K1-block-sum).

**Depends on.** this roadmap: `U.1/whitehead-diagonal`, `U.1/block-sum`, `U.1/elementary-subgroup`, `U.1/commutator-in-elementary`.

**Sources.**

- `Bass.1964`, Lemma (1.7) (“Whitehead Lemma”) (p. 10 of the article; PDF p. 7 of the numdam file): “Lemma (1.7) (“Whitehead Lemma”). — Let a∈GL(n, A) and b∈GL(n, A, q). Then |ab 0; 0 1| ≡ |a 0; 0 b| ≡ |ba 0; 0 1| mod E(2n, A, q)” — The statement with q = A (the displays are transcribed linearly); Bass adds a further congruence with an anti-diagonal matrix, not needed here.
- `Bass.1964`, Lemma (1.7) (p. 10 of the article; PDF p. 7 of the numdam file): “(The congruences hold for either left or right cosets.)” — Both coset versions, which the proof steps establish directly.
- `Kbook.2013`, Exercise III.1.6 (PDF p. 197; draft p. 189): “Show that in K1(R) we have [α ⊕mn β] = [α][β].” — The consequence in K₁; the finite-rank congruence is the input.

### Commutators and elementary conjugates become elementary in rank 2n

`U.1/commutator-in-elementary` · lemma

For any ring A and g, h ∈ GL_n(A): ⁅g, h⁆ ⊕ 1_n = (g ⊕ g⁻¹)(h ⊕ h⁻¹)((hg)⁻¹ ⊕ hg) in GL_{2n}(A), hence ⁅g, h⁆ ⊕ 1_n ∈ E_{2n}(A). Moreover for g ∈ GL_n(A) and e ∈ E_n(A): (g e g⁻¹) ⊕ 1_n = (g ⊕ g⁻¹)(e ⊕ 1_n)(g⁻¹ ⊕ g) ∈ E_{2n}(A). The rank doubles; no statement in rank n is claimed.

**Hypotheses.**

- A is an associative unital ring; g, h ∈ GL_n(A); e ∈ E_n(A).

**Proof.**

1. Multiply blockwise (the block-sum homomorphism, U.1/block-sum): the first summand is g h (hg)⁻¹ = g h g⁻¹ h⁻¹ and the second is g⁻¹ h⁻¹ h g = 1. Recomputed.
2. Each factor g ⊕ g⁻¹, h ⊕ h⁻¹, (hg)⁻¹ ⊕ hg lies in E_{2n}(A) by U.1/whitehead-diagonal.
3. For the conjugate: (g ⊕ g⁻¹)(e ⊕ 1)(g⁻¹ ⊕ g) = (g e g⁻¹) ⊕ (g⁻¹ g) = (geg⁻¹) ⊕ 1, and e ⊕ 1 = stabilise e ∈ E_{2n}(A) (U.1/elementary-subgroup, stabilisation of generators).

**Acceptance.**

- For n = 1 and units x, y: diag(xyx⁻¹y⁻¹, 1) ∈ E_2(A); over ℍ[ℝ] with x = i, y = j this gives diag(−1, 1) ∈ E_2(ℍ[ℝ]).
- Used for U.1/whitehead-lemma and U.1/stable-elementary-normal.

**Depends on.** this roadmap: `U.1/whitehead-diagonal`, `U.1/block-sum`, `U.1/elementary-subgroup`, `U.1/stabilisation-map`; libraries: `mathlib:commutatorElement`.

**Sources.**

- `Kbook.2013`, III.1.3.3, proof of Whitehead's Lemma, formula (1.3.4) (PDF p. 191; draft p. 183): “Conversely, every commutator in GLn(R) can be expressed as a product in GL2n(R):” — The identity (1.3.4) written out in the statement; the K-book then notes that each factor is in E_{2n}(R).
- `Kbook.2013`, III.2.1, proof of the Relative Whitehead Lemma (PDF p. 201; draft p. 193): “Hence if h ∈En(R, I) then the conjugate ghg−1 0 0 1 = g 0 0 g−1 h 0 0 1 g−1 0 0 g is in E(R, I).” — The conjugation identity; with I = R it is the second part of this node (the displays are block matrices in the text layer).
- `Bass.1964`, Corollary (1.8) (p. 11 of the article; PDF p. 8 of the numdam file): “Corollary (1.8). — [GL(n, A), GL(n, A, q)] ⊂ E(2n, A, q).” — The rank-2n statement with q = A.

### The stable elementary group E(A)

`U.1/stable-elementary-subgroup` · definition · planet “Stable elementary group E(A)”

E(A) := Subgroup.closure {of_n(e_ij(a))} ≤ GL(A), equivalently ⨆_n (E_n(A)).map of_n, for any ring A. An element x ∈ GL(A) lies in E(A) iff x = of_n e for some n and some e ∈ E_n(A); for g ∈ GL_n(A), of_n g ∈ E(A) iff stabilise_{n,k} g ∈ E_k(A) for some k ≥ n. E is functorial: GL(f) maps E(A) into E(B), onto when f is surjective.

**Hypotheses.**

- A is an associative unital ring.

**Proof.**

1. stabilise maps E_m(A) into E_n(A), so the subgroups (E_n(A)).map of_n form an increasing chain; the supremum of a directed family is its union (Subgroup.mem_iSup_of_directed), and it contains every of_n(e_ij(a)) and is contained in the closure of these; so the two descriptions agree.
2. Membership criterion: if of_n g = of_k e with e ∈ E_k(A), stabilise both to rank max(n, k) and use U.1/stable-equality-criterion.
3. Functoriality: GL(f)(of_n e) = of_n (glMap f e) and glMap f maps E_n(A) into E_n(B); for surjective f use U.1/elementary-surjective-map in each rank and U.1/finite-representatives.

**API.**

- `StableGL.elementary` (constructor): StableGL.elementary A : Subgroup (StableGL A), the closure of the StableGL.of n (elementary h a).
- `StableGL.of_elementary_mem` (simp): StableGL.of n (elementary h a) ∈ StableGL.elementary A.
- `StableGL.mem_elementary_iff` (characterisation): x ∈ StableGL.elementary A ↔ ∃ n (e : GL (Fin n) A), e ∈ elementarySubgroup (Fin n) A ∧ x = StableGL.of n e.
- `StableGL.of_mem_elementary_iff` (characterisation): StableGL.of n g ∈ StableGL.elementary A ↔ ∃ k (h : n ≤ k), stabilise h g ∈ elementarySubgroup (Fin k) A.
- `StableGL.elementary_eq_iSup` (characterisation): StableGL.elementary A = ⨆ n, (elementarySubgroup (Fin n) A).map (StableGL.of n).
- `StableGL.map_elementary_le` (functoriality): (StableGL.elementary A).map (StableGL.map f) ≤ StableGL.elementary B.
- `StableGL.map_elementary_eq` (functoriality): If f is surjective, (StableGL.elementary A).map (StableGL.map f) = StableGL.elementary B.

**Unit tests.**

- `StableGL.of_neg_one_two_mem` (computation): StableGL.of 2 (diag(−1, −1)) ∈ StableGL.elementary A for every ring A, since diag(−1, −1) = w̄_12².
- `StableGL.elementary_zero_ring` (degenerate): For the zero ring, StableGL.elementary A = ⊤ (= ⊥).
- `StableGL.elementary_transvectionUnit` (compatibility): For A commutative, StableGL.of n (TauCeti.transvectionUnit h a) ∈ StableGL.elementary A for all h, a.
- `StableGL.of_neg_one_not_mem` (non-example): StableGL.of 1 (−1 : ℤˣ) ∉ StableGL.elementary ℤ, because every element of StableGL.elementary ℤ has determinant 1.

**Acceptance.**

- of_2 w̄_12 ∈ E(A) and of_2 diag(−1, −1) ∈ E(A) for every ring A.
- of_1(−1) ∉ E(ℤ): its determinant is −1 whereas every element of E(ℤ) has determinant 1.
- E(A) → E(A/I) is onto.

**Used by.**

- K-book III.1.2 and Whitehead's Lemma 1.3.3: E(R) is the commutator subgroup of GL(R) and K₁(R) = GL(R)/E(R)
- KTheoryLowDegrees:U.2/K1: the quotient GL(A)/E(A)
- K3BlochGroups:V.1/bst-plus: the stable elementary group E(A) inside GL(A), perfect and normal, is the perfect subgroup of the plus construction
- K2SymbolsBrauer:T.1/stabilisation: the stable surjection φ : St(R) → E(R)
- K2SymbolsBrauer:T.1/k2-is-centre: the centre of E(R) is trivial (U.1/stable-elementary-centre)
- GeneralAlgebraicKTheory:K.2:plus: the plus construction BGL(A)⁺ is taken with respect to the perfect normal subgroup E(A)

**Depends on.** this roadmap: `U.1/stable-general-linear-group`, `U.1/elementary-subgroup`, `U.1/finite-representatives`, `U.1/stable-equality-criterion`, `U.1/elementary-surjective-map`; libraries: `mathlib:Subgroup.closure`, `mathlib:Subgroup.map`, `mathlib:Subgroup.mem_iSup_of_directed`.

**Sources.**

- `Kbook.2013`, III.1.2, Definition 1.2 (PDF p. 188; draft p. 180): “the union E(R) of the En(R) is the subgroup of GL(R) generated by all elementary matrices.” — The definition: the union of the E_n(R), which is the subgroup generated by the elementary matrices.
- `Bass.1964`, § 1 (p. 8 of the article; PDF p. 5 of the numdam file): “This done, we set GL(A, q) = ∪_n GL(n, A, q) and E(A, q) = ∪_n E(n, A, q).” — Bass's E(A) = E(A, A).

### Whitehead's Lemma: [GL(A), GL(A)] = E(A)

`U.1/whitehead-lemma` · theorem · planet “Whitehead's Lemma”

For every associative unital ring A, the commutator subgroup of GL(A) is E(A): commutator (GL(A)) = ⁅⊤, ⊤⁆ = E(A). Consequently E(A) is normal in GL(A) and GL(A)/E(A) is abelian. The finite-rank ingredients carry explicit ranks: E_n(A) is perfect for n ≥ 3, and a commutator in GL_n(A) lies in E_{2n}(A) after stabilisation.

**Hypotheses.**

- A is an associative unital ring (commutativity not assumed).

**Proof.**

1. E(A) ≤ ⁅GL(A), GL(A)⁆: E(A) is generated by the of_n(e_ij(a)); stabilising to n ≥ 3 (of_n e = of_{n'}(stabilise e)), e_ij(a) is a commutator of two elements of E_{n}(A) (U.1/elementary-perfect), hence of_n(e_ij(a)) is a commutator in GL(A), and the commutator subgroup is a subgroup (Subgroup.closure_le).
2. ⁅GL(A), GL(A)⁆ ≤ E(A): the commutator subgroup is generated by the commutators ⁅x, y⁆ (Subgroup.commutator_def); by U.1/finite-representatives x = of_n g and y = of_n h for a common n, so ⁅x, y⁆ = of_n ⁅g, h⁆ = of_{2n}(⁅g, h⁆ ⊕ 1_n) ∈ E(A) by U.1/commutator-in-elementary and U.1/stable-elementary-subgroup.
3. Normality and commutativity of the quotient follow because a commutator subgroup is normal (Subgroup.commutator_normal) and the quotient by it is abelian.

**Acceptance.**

- For A = ℤ: of_2 diag(−1, −1) ∈ ⁅GL(ℤ), GL(ℤ)⁆ although diag(−1, −1) is not a commutator in GL_1(ℤ) × GL_1(ℤ).
- The theorem is stable only: ⁅GL_2(𝔽_2), GL_2(𝔽_2)⁆ ≠ E_2(𝔽_2) (U.1/rank-two-failure).
- It holds for non-commutative rings, e.g. ℍ[ℝ] and matrix rings.

**Depends on.** this roadmap: `U.1/elementary-perfect`, `U.1/commutator-in-elementary`, `U.1/stable-elementary-subgroup`, `U.1/finite-representatives`, `U.1/stable-equality-criterion`; libraries: `mathlib:commutator`, `mathlib:Subgroup.commutator_def`, `mathlib:Subgroup.closure_le`, `mathlib:Subgroup.commutator_normal`.

**Sources.**

- `Kbook.2013`, III.1.3.3, Whitehead's Lemma (printed as 1.3.5; see sourceIssues) (PDF p. 190; draft p. 182): “Whitehead’s Lemma 1.3.5. E(R) is the commutator subgroup of GL(R). Hence K1(R) = GL(R)/E(R).” — The theorem.
- `Kbook.2013`, III.1.3.3, proof (PDF p. 191; draft p. 183): “Proof. The commutator subgroup contains E(R) by Lemma 1.3.2. Conversely, every commutator in GLn(R) can be expressed as a product in GL2n(R):” — The two inclusions, as in the proof steps.
- `Bass.1964`, Corollary (1.9) (p. 11 of the article; PDF p. 8 of the numdam file): “Corollary (1.9). — E(A, q) = [E(A), E(A, q)] = [GL(A), GL(A, q)]. In particular, E(A) = [GL(A), GL(A)].” — The same theorem over an arbitrary ring, credited by Bass to J. H. C. Whitehead.

### E(A) is perfect

`U.1/stable-elementary-perfect` · theorem

For every ring A, ⁅E(A), E(A)⁆ = E(A).

**Hypotheses.**

- A is an associative unital ring.

**Proof.**

1. ⊆ is automatic (Subgroup.commutator_le).
2. ⊇: each generator of_n(e_ij(a)) equals of_{n'}(stabilise e_ij(a)) with n′ ≥ 3, and stabilise e_ij(a) = ⁅e_ik(a), e_kj(1)⁆ with both factors in E_{n′}(A) (U.1/elementary-perfect); their images lie in E(A).

**Acceptance.**

- of_2 e_12(a) = ⁅of_3 e_13(a), of_3 e_32(1)⁆ in GL(A).
- This is the perfectness requested by K3BlochGroups V.1 for the plus construction.

**Depends on.** this roadmap: `U.1/elementary-perfect`, `U.1/stable-elementary-subgroup`; libraries: `mathlib:Subgroup.commutator_le`, `mathlib:Subgroup.closure_le`.

**Sources.**

- `Kbook.2013`, III.1.3, after (1.3.1) (PDF p. 190; draft p. 182): “Recall that a group is called perfect if G = [G, G]. If a subgroup H of G is perfect, then H ⊆[G, G]. The group E(R) is perfect, as are most of its finite versions:” — The stable statement.
- `Bass.1964`, Corollary (1.9) (p. 11 of the article; PDF p. 8 of the numdam file): “E(A, q) = [E(A), E(A, q)]” — With q = A: E(A) = [E(A), E(A)].

### E(A) is a normal subgroup of GL(A)

`U.1/stable-elementary-normal` · theorem

For every ring A, E(A) is normal in GL(A) (a Subgroup.Normal instance), with an explicit rank: for g ∈ GL_n(A) and e ∈ E_n(A), (g e g⁻¹) ⊕ 1_n ∈ E_{2n}(A). No finite-rank normality is claimed or used: E_n(A) ⊴ GL_n(A) for n ≥ 3 holds for commutative A by Suslin's theorem (K-book Remark III.1.2.5 and Ex. III.1.9) and in the stable range by Bass (Theorem 4.2(c)), while Suslin exhibits Dedekind domains with E_2(A) not normal in GL_2(A).

**Hypotheses.**

- A is an associative unital ring.

**Proof.**

1. For x = of_n g ∈ GL(A) and y = of_n e ∈ E(A) (common rank by U.1/finite-representatives), x y x⁻¹ = of_n (g e g⁻¹) = of_{2n}((g e g⁻¹) ⊕ 1) ∈ E(A) by U.1/commutator-in-elementary.
2. Alternatively E(A) = ⁅GL(A), GL(A)⁆ (U.1/whitehead-lemma) is normal as a commutator subgroup (Subgroup.commutator_normal).

**Acceptance.**

- The conjugate of e_12(1) by diag(2, 1) in GL_2(ℚ), namely e_12(2), lies in E_2(ℚ); the rank-2n statement gives it in E_4(ℚ) without using that E_2(ℚ) is normal.
- This is the normality requested by K3BlochGroups V.1 and used by GeneralAlgebraicKTheory K.2:plus.

**Depends on.** this roadmap: `U.1/commutator-in-elementary`, `U.1/whitehead-lemma`, `U.1/finite-representatives`; libraries: `mathlib:Subgroup.Normal`, `mathlib:Subgroup.commutator_normal`.

**Sources.**

- `Kbook.2013`, III.1.2.5, Remark 1.2.5 (PDF p. 190; draft p. 182): “There is no a priori reason to believe that the subgroups En(R) are normal, except in special cases.” — Why only the stable statement is made.
- `Kbook.2013`, III.1.2.5, Remark 1.2.5 (PDF p. 190; draft p. 182): “If R is commutative, we can do better: En(R) is a normal subgroup of GLn(R) for all n ≥3. This theorem was proven by A. Suslin in” — Suslin's finite-rank theorem, cited here and not claimed.
- `Kbook.2013`, III.2.1, Relative Whitehead Lemma, proof (PDF p. 201; draft p. 193): “Hence if h ∈En(R, I) then the conjugate ghg−1 0 0 1 = g 0 0 g−1 h 0 0 1 g−1 0 0 g is in E(R, I).” — The rank-2n conjugation identity (with I = R).

### The centraliser of E_n(A)

`U.1/elementary-centraliser` · lemma

For any ring A and n ≥ 2, the centraliser of E_n(A) in GL_n(A) consists of the scalar matrices u·1 with u a unit in the centre of A. For commutative A this refines Mathlib's Matrix.mem_range_scalar_of_commute_transvectionStruct (a matrix commuting with all transvections is scalar).

**Hypotheses.**

- A is an associative unital ring; n ≥ 2.

**Proof.**

1. If g commutes with e_ij(1) = 1 + E_ij(1) for all i ≠ j then g commutes with every matrix unit E_ij(1); comparing entries of g E_ij(1) and E_ij(1) g shows g_ki = 0 for k ≠ i, g_jl = 0 for l ≠ j and g_ii = g_jj, so g = u·1 with u = g_11 (the non-commutative form of Matrix.mem_range_scalar_of_commute_single).
2. Commuting with e_ij(a) for all a gives u a = a u, so u is central; u is a unit because g is invertible.
3. Conversely a central unit scalar commutes with every matrix.

**Acceptance.**

- For A = ℍ[ℝ] the centraliser of E_2 is {r·1 : r ∈ ℝˣ}.
- For A commutative it agrees with Mathlib's result for transvections.

**Depends on.** this roadmap: `U.1/elementary-subgroup`, `U.1/elementary-matrix`; libraries: `mathlib:Matrix.mem_range_scalar_of_commute_transvectionStruct`, `mathlib:Matrix.mem_range_scalar_of_commute_single`, `mathlib:Matrix.scalar`.

**Sources.**

- `Bass.1964`, Corollary (2.4) (p. 13 of the article; PDF p. 10 of the numdam file): “Corollary (2.4). — If n ≥ 2, the centralizer of E(n, A) consists of all matrices u.1 with u a unit in the center of A.” — The statement.
- `Kbook.2013`, Exercise III.1.8 (PDF p. 198; draft p. 190): “1.8. In this exercise we show that the center of E(R) is trivial. First show that any matrix in GLn(R) commuting with En(R) must be a diagonal matrix diag(r, ..., r) with r in the center of R.” — The first step of the exercise is this lemma.

### The centre of E(A) is trivial

`U.1/stable-elementary-centre` · theorem

For every ring A the centre of E(A) is trivial; more precisely, an element of GL(A) that commutes with every element of E(A) is 1.

**Hypotheses.**

- A is an associative unital ring.

**Proof.**

1. Let z = of_n g commute with E(A). Then of_{n+1}(stabilise g) = z commutes with of_{n+1}(E_{n+1}(A)); by injectivity of of_{n+1} (U.1/stable-equality-criterion), stabilise g ∈ GL_{n+1}(A) commutes with E_{n+1}(A).
2. By U.1/elementary-centraliser (n + 1 ≥ 2), stabilise g = u·1_{n+1}; its (n+1, n+1) entry is 1, so u = 1 and g = 1.

**Acceptance.**

- The scalar −1_2 ∈ E_2(ℤ) is central in GL_2(ℤ), but of_2(−1_2) is not central in E(ℤ): in rank 3 it is diag(−1, −1, 1), which conjugates e_13(1) to e_13(−1) (recomputed).
- This is the fact used by K2SymbolsBrauer T.1's proof that K_2(R) is the centre of St(R).

**Depends on.** this roadmap: `U.1/elementary-centraliser`, `U.1/stable-elementary-subgroup`, `U.1/stable-equality-criterion`; libraries: `mathlib:Subgroup.center`.

**Sources.**

- `Kbook.2013`, Exercise III.1.8 (PDF p. 198; draft p. 190): “Conclude that no element in En−1(R) is in the center of En(R), and pass to the limit as n →∞.” — The stable conclusion of the exercise; the exercise gives only the outline, which the proof steps complete.

### The stable statements fail in rank two

`U.1/rank-two-failure` · theorem

(a) E_2(𝔽_2) = SL_2(𝔽_2) = GL_2(𝔽_2) has order 6 and its commutator subgroup has order 3; so E_2(𝔽_2) is not perfect and ⁅GL_2(𝔽_2), GL_2(𝔽_2)⁆ ≠ E_2(𝔽_2). (b) E_2(𝔽_3) = SL_2(𝔽_3) has order 24 and its commutator subgroup has order 8; so E_2(𝔽_3) is not perfect (while ⁅GL_2(𝔽_3), GL_2(𝔽_3)⁆ = SL_2(𝔽_3)). In both fields every a ≠ 0 satisfies a² = 1, exactly where the hypothesis of Mathlib's Matrix.SL2.commutator_eq_top (some a ≠ 0 with a² ≠ 1) fails. Hence no rank-two form of U.1/elementary-perfect or U.1/whitehead-lemma holds for all rings, and the finite-rank statements of U.1 keep their rank bounds.

**Hypotheses.**

- F_2 = ZMod 2 and F_3 = ZMod 3, with GL_2, SL_2 and E_2 as in U.1/elementary-subgroup.

**Proof.**

1. E_2(F) is the image of SL_2(F) for a field F (Tau Ceti's closure_range_toSpecialLinearGroup_eq_top_of_field; U.3/field-special-linear-eq-elementary is the general statement, here only the two finite fields are needed).
2. The groups are finite and the orders are decidable: |GL_2(𝔽_2)| = |SL_2(𝔽_2)| = 6, and its commutator subgroup (generated by all x y x⁻¹ y⁻¹) has 3 elements; |SL_2(𝔽_3)| = 24 with commutator subgroup of order 8, and |GL_2(𝔽_3)| = 48 with commutator subgroup of order 24. These six numbers were recomputed by enumerating the groups and closing the set of commutators.
3. A subgroup of order 3 in a group of order 6, or 8 in 24, is proper, which gives the failures.

**Acceptance.**

- The computed orders 6, 3, 24, 8, 48, 24.
- For 𝔽_5 the commutator subgroup of SL_2(𝔽_5) is all of SL_2(𝔽_5) (order 120, recomputed), in accordance with Matrix.SL2.commutator_eq_top (a = 2, 2² = 4 ≠ 1).
- Bass records that SL(2, ℤ) = E(2, ℤ) has commutator quotient cyclic of order 12, another rank-two failure.

**Depends on.** this roadmap: `U.1/elementary-subgroup`; libraries: `tauceti:Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`, `mathlib:Matrix.SL2.commutator_eq_top`, `mathlib:commutator`.

**Sources.**

- `Kbook.2013`, III.1.3, after Lemma 1.3.2 (PDF p. 190; draft p. 182): “We know from Example 1.1.2 that E2(R) is not always perfect; in fact E2(F2) and E2(F3) are solvable groups.” — The rank-two failure.
- `Kbook.2013`, III.1.1.2, Example 1.1.2 (PDF p. 188; draft p. 180): “SLn(F) is the commutator subgroup of both GLn(F) and SLn(F), with only two exceptions: GL2(F2) = SL2(F2) ∼= Σ3, which has order 6, and GL2(F3), which has center {±I} and quotient PGL2(F3) = GL2(F3)/{±I} isomorphic to Σ4.” — Dickson's exceptions: for 𝔽_2 both statements fail; for 𝔽_3 the statement for SL_2 fails (the recomputation shows ⁅GL_2(𝔽_3), GL_2(𝔽_3)⁆ = SL_2(𝔽_3)).
- `Bass.1964`, § 1, Examples 3 (p. 10 of the article; PDF p. 7 of the numdam file): “The commutator quotient of GL(2, Z) is a group of type (2, 2), and that of SL(2, Z) is cyclic of order 12.” — A further rank-two failure for a Euclidean ring, where E(2, Z) = SL(2, Z).

## U.2 — K₁ and its calculus

*Coverage: source_decomposed.* K₁(A) = GL(A)/E(A) with its universal property and the isomorphism with Mathlib's Abelianization; functoriality for arbitrary ring homomorphisms; stabilisation invariance and triviality of elementary classes and of [g ⊕ g⁻¹] (the U.6 test); [g ⊕ h] = [g][h] = [gh]; K₁ of binary and finite products of rings (finiteness needed and explained). The class of an automorphism of a finitely generated projective module is defined for RIGHT modules with column vectors, as in the K-book and Bass (Mathlib: modules over Aᵐᵒᵖ, with the ring isomorphism U.2/right-module-matrix-equiv); for commutative rings it is Mathlib's column convention (Matrix.GeneralLinearGroup.toLin); the row convention of LinearMap.toMatrixRight' would give transposed classes (restructure entry). Independence of the complement and the isomorphism (K-book Lemma 1.6, Bass 12.1), direct sums, unipotent automorphisms, additivity along short exact sequences and along projective filtrations (with the hypothesis α(P_i) = P_i, and ⊆ for commutative rings via Mathlib's Orzech property), the block triangular and triangular case (the U.6 test), base change (commutative rings through Mathlib's TensorProduct; general rings through KTheoryLowDegrees:Z.1/extend-scalars-finite-projective for the opposite rings), and Bass's universal property Prop. 12.1 identifying K₁(A) with the universal additive and multiplicative invariant of automorphisms. Results of K-book III.1 that the U.2 text does not ask for are routed: the product K₀(R) ⊗ K₁(S) → K₁(R ⊗ S) (Cor. 1.6.1) and the transfer of Lemma 1.7 and Cor. 1.7.1 to U.5 (planned there as U.5/K0-action-on-K1 and U.5/transfer); Morita invariance of K₁ (1.1.4, Prop. 1.6.4) to GeneralAlgebraicKTheory K.7; Bass's colimit formula (Cor. 1.6.3) is the homological form of U.2/automorphism-class-universal and is not planned separately; K₁ with coefficients (1.7.4), flasque rings (1.7.3), Whitehead groups and s-cobordisms (1.8, 1.9) are outside every stage in scope.

### K₁ of a ring

`U.2/K1` · definition · planet “Whitehead group K₁”

For an associative unital ring A, K₁(A) := GL(A) ⧸ E(A), the quotient of the infinite general linear group by the stable elementary group; E(A) is normal (U.1/stable-elementary-normal), and the quotient is commutative because E(A) contains ⁅GL(A), GL(A)⁆ (U.1/whitehead-lemma). K₁(A) is a CommGroup written multiplicatively; the K-book writes it additively when convenient, so its [g] + [h] is [g]·[h] here. K1.mk : GL(A) →* K₁(A) is the quotient map and K1.of n : GL_n(A) →* K₁(A) is K1.mk ∘ of_n; [g] denotes K1.of n g. Universal property: every homomorphism from GL(A) to a commutative group factors uniquely through K1.mk.

**Hypotheses.**

- A is an associative unital ring.

**Proof.**

1. Form the quotient group GL(A) ⧸ E(A) (QuotientGroup, with the normality instance of U.1/stable-elementary-normal) and K1.mk := QuotientGroup.mk'.
2. Commutativity: for x, y ∈ GL(A), x y x⁻¹ y⁻¹ ∈ ⁅GL(A), GL(A)⁆ = E(A) (U.1/whitehead-lemma), so mk x · mk y = mk y · mk x (QuotientGroup.eq_one_iff); this gives the CommGroup instance.
3. Kernel: mk x = 1 ↔ x ∈ E(A) (QuotientGroup.eq_one_iff); for g ∈ GL_n(A), [g] = 1 ↔ stabilise g ∈ E_k(A) for some k (U.1/stable-elementary-subgroup, of_mem_elementary_iff).
4. Universal property: a homomorphism φ : GL(A) →* H with H commutative kills every commutator, hence ⁅GL(A), GL(A)⁆ = E(A), and factors through QuotientGroup.lift; uniqueness because mk is surjective.

**API.**

- `K1` (constructor): K1 A := StableGL A ⧸ StableGL.elementary A.
- `K1.instCommGroup` (instance): K1 A is a commutative group.
- `K1.mk` (constructor): K1.mk : StableGL A →* K1 A, the quotient map.
- `K1.of` (constructor): K1.of n : GL (Fin n) A →* K1 A, K1.mk ∘ StableGL.of n.
- `K1.mk_surjective` (characterisation): K1.mk is surjective; every element of K1 A is K1.of n g for some n and g.
- `K1.mk_eq_one_iff` (characterisation): K1.mk x = 1 ↔ x ∈ StableGL.elementary A.
- `K1.of_eq_one_iff` (characterisation): K1.of n g = 1 ↔ ∃ k (h : n ≤ k), stabilise h g ∈ elementarySubgroup (Fin k) A.
- `K1.of_eq_of_iff` (characterisation): K1.of n g = K1.of n h ↔ StableGL.of n (g * h⁻¹) ∈ StableGL.elementary A.
- `K1.of_conj` (relation): K1.of n (x * g * x⁻¹) = K1.of n g for x, g : GL (Fin n) A.
- `K1.lift` (universal-property): For H a commutative group, (StableGL A →* H) ≃ (K1 A →* H), φ ↦ the induced map.
- `K1.lift_mk` (universal-property): K1.lift φ (K1.mk x) = φ x.
- `K1.hom_ext` (extensionality): Two homomorphisms K1 A →* H agreeing on every K1.of n g are equal.

**Unit tests.**

- `K1.subsingleton_zero_ring` (degenerate): If A is the zero ring then K1 A is trivial.
- `K1.of_neg_one_two` (computation): K1.of 2 (diag(−1, −1)) = 1 in K1 A for every ring A (diag(−1, −1) = w̄_12²).
- `K1.of_diag_right_eq_left` (characterisation): K1.of 2 (diag(1, u)) = K1.of 2 (diag(u, 1)) = K1.of 1 u for u : Aˣ, although diag(1, u) ≠ diag(u, 1) in GL_2(A).
- `K1.equivAbelianization_mk` (compatibility): Under U.2/K1-abelianization, K1.mk x corresponds to Abelianization.of x.
- `K1.of_neg_one_int_ne_one` (non-example): K1.of 1 (−1 : ℤˣ) ≠ 1 in K1 ℤ (its determinant is −1; U.3/stable-determinant): K₁ is not a quotient killing all of GL_1.

**Acceptance.**

- K₁ of the zero ring is trivial.
- [diag(−1, −1)] = 1 for every ring, as diag(−1, −1) = w̄_12² ∈ E_2(A).
- [g ⊕ g⁻¹] = 1 and [e_ij(a)] = 1 (U.2/K1-elementary-trivial).

**Used by.**

- K-book Lemma III.1.6: an automorphism of a finitely generated projective module has a class in K₁(R)
- KTheoryLowDegrees:U.3/stable-determinant: det : K₁(A) → Aˣ for commutative A
- KTheoryLowDegrees:U.5: the relative sequence K₁(A, I) → K₁(A) → K₁(A/I) → K₀(I)
- KTheoryLowDegrees:U.6: π₁ BGL(A)⁺ ≅ K₁(A) with the class of a loop given by a matrix
- K2SymbolsBrauer:T.1/k2-definition: the exact sequence 1 → K₂(R) → St(R) → GL(R) → K₁(R) → 1
- EllipticKTheory:E.4/K1-and-SK1-of-a-curve: K₁ and SK₁ of the coordinate ring of an affine curve
- ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant: K₁(O_{F,S}) ≅ O_{F,S}^× by the determinant
- KTheoryFiniteLocalFields:L.1/determinant-degree-one: K₁(𝔽_q) = GL(𝔽_q)/E(𝔽_q) ≅ 𝔽_q^×

**Depends on.** this roadmap: `U.1/stable-general-linear-group`, `U.1/stable-elementary-subgroup`, `U.1/stable-elementary-normal`, `U.1/whitehead-lemma`; libraries: `mathlib:QuotientGroup.mk'`, `mathlib:QuotientGroup.eq_one_iff`, `mathlib:QuotientGroup.lift`.

**Sources.**

- `Kbook.2013`, III.1.1, Definition 1.1 (PDF p. 187; draft p. 179): “Definition 1.1. K1(R) is the abelian group GL(R)/[GL(R), GL(R)]. The universal property of K1(R) is this: every homomorphism from GL(R) to an abelian group must factor through the natural quotient GL(R) →K1(R).” — The definition and universal property; by Whitehead's Lemma the commutator subgroup is E(R), which is the quotient taken here.
- `Kbook.2013`, III.1.3.3, Whitehead's Lemma (PDF p. 190; draft p. 182): “E(R) is the commutator subgroup of GL(R). Hence K1(R) = GL(R)/E(R).” — The form K₁(R) = GL(R)/E(R) used as the definition.
- `Bass.1964`, § 12, Proposition (12.1) (p. 32 of the article; PDF p. 29 of the numdam file): “Proposition (12.1). — The inclusions GL(n, A, q) ⊂ obj P_q[t, t⁻¹] induce an isomorphism f : GL(A, q)/E(A, q) → K¹(A, q).” — With q = A: Bass's Whitehead group K¹(A) is GL(A)/E(A) (U.2/automorphism-class-universal).

### K₁ is the abelianisation of GL(A)

`U.2/K1-abelianization` · comparison

For every ring A the identity of GL(A) induces an isomorphism K₁(A) ≃* Abelianization GL(A) (Mathlib's Abelianization G = G ⧸ commutator G), sending K1.mk x to Abelianization.of x; under it the universal property of K₁ is Abelianization.lift. Equivalently K₁(A) ≅ H₁(GL(A); ℤ) = colim_n H₁(GL_n(A); ℤ) (K-book (1.6.2)); the homology form is not planned here.

**Hypotheses.**

- A is an associative unital ring.

**Proof.**

1. E(A) = commutator GL(A) (U.1/whitehead-lemma), so QuotientGroup.quotientMulEquivOfEq gives K₁(A) = GL(A) ⧸ E(A) ≃* GL(A) ⧸ commutator GL(A) = Abelianization GL(A), commuting with the quotient maps.
2. Naturality in A: the isomorphism intertwines K1.map f (U.2/K1-map) and Abelianization.map (StableGL.map f), since both are induced by StableGL.map f.

**Acceptance.**

- K1.mk x ↦ Abelianization.of x.
- The composite with Abelianization.lift φ is K1.lift φ.

**Depends on.** this roadmap: `U.2/K1`, `U.1/whitehead-lemma`; libraries: `mathlib:Abelianization`, `mathlib:Abelianization.of`, `mathlib:Abelianization.lift`, `mathlib:Abelianization.map`, `mathlib:QuotientGroup.quotientMulEquivOfEq`, `mathlib:commutator`.

**Sources.**

- `Kbook.2013`, III.1.1, Definition 1.1 (PDF p. 187; draft p. 179): “Definition 1.1. K1(R) is the abelian group GL(R)/[GL(R), GL(R)].” — The K-book's definition is the abelianisation; this node identifies it with GL(R)/E(R).
- `Kbook.2013`, III.1.6, formula (1.6.2) (PDF p. 194; draft p. 186): “Recall that the first homology H1(G; Z) of any group G is naturally isomorphic to G/[G, G].” — The homological reading of the same group, recorded in the statement.

### Functoriality of K₁ for ring homomorphisms

`U.2/K1-map` · construction

For a homomorphism f : A → B of arbitrary rings, K1.map f : K₁(A) →* K₁(B) is induced by GL(f) = StableGL.map f, which maps E(A) into E(B) (U.1/stable-elementary-subgroup): K1.map f [g] = [glMap f g]. It satisfies K1.map id = id and K1.map (g ∘ f) = K1.map g ∘ K1.map f. For surjective f it need not be surjective (GL_n(A) → GL_n(B) is not onto in general), although E(A) → E(B) is.

**Hypotheses.**

- A, B, C associative unital rings; f : A →+* B, g : B →+* C.

**Proof.**

1. StableGL.map f maps StableGL.elementary A into StableGL.elementary B (StableGL.map_elementary_le), so QuotientGroup.map induces K1.map f.
2. Functor laws from StableGL.map_id and StableGL.map_comp, and K1.mk surjective.
3. Non-surjectivity for ℤ → ℤ/5ℤ: every class in the image has a representative with determinant ±1, while [diag(2, 1)] ∈ K₁(ℤ/5ℤ) has determinant 2 (determinants are well defined on K₁ by U.3/stable-determinant; this is a test, not a prerequisite).

**API.**

- `K1.map` (constructor): K1.map f : K1 A →* K1 B.
- `K1.map_of` (simp): K1.map f (K1.of n g) = K1.of n (glMap f g).
- `K1.map_mk` (simp): K1.map f (K1.mk x) = K1.mk (StableGL.map f x).
- `K1.map_id` (functoriality): K1.map (RingHom.id A) = MonoidHom.id (K1 A).
- `K1.map_comp` (functoriality): K1.map (g.comp f) = (K1.map g).comp (K1.map f).
- `K1.map_abelianization` (compatibility): Under U.2/K1-abelianization, K1.map f corresponds to Abelianization.map (StableGL.map f).

**Unit tests.**

- `K1.map_zmod_two` (computation): K1.map (Int.castRingHom (ZMod 2)) (K1.of 2 (diag(−1, 1))) = 1.
- `K1.map_id_eq` (degenerate): K1.map (RingHom.id A) = MonoidHom.id (K1 A).
- `K1.map_eq_abelianization_map` (compatibility): (K1.equivAbelianization B) ∘ K1.map f = Abelianization.map (StableGL.map f) ∘ (K1.equivAbelianization A).
- `K1.map_not_surjective` (non-example): K1.map (Int.castRingHom (ZMod 5)) : K1 ℤ → K1 (ZMod 5) is not surjective: K1.of 1 (2 : (ZMod 5)ˣ) is not in its range.

**Acceptance.**

- K1.map (RingHom.id A) = MonoidHom.id and composition is respected.
- K1.map (Int.castRingHom (ZMod 2)) [diag(−1, 1)] = 1.

**Used by.**

- KTheoryLowDegrees:U.3/stable-determinant: naturality of the determinant, det ∘ K1.map f = Units.map f ∘ det
- KTheoryLowDegrees:U.5: K₁(A) → K₁(A/I) in the relative sequence
- KTheoryLowDegrees:U.4: the unit inclusion K₁(O_{F,S}) → K₁(F)
- EllipticKTheory:E.3/localisation-sequence-for-a-curve: the map K₁(A) → K₁(F) to the function field

**Depends on.** this roadmap: `U.2/K1`, `U.1/stable-general-linear-group`, `U.1/stable-elementary-subgroup`, `U.1/general-linear-map`; libraries: `mathlib:QuotientGroup.map`.

**Sources.**

- `Kbook.2013`, III.1, after Definition 1.1 (PDF p. 188; draft p. 180): “A ring map R →S induces a natural map from GL(R) to GL(S), and hence from K1(R) to K1(S). That is, K1 is a functor from rings to abelian groups.” — The construction.
- `Bass.1964`, § 12, end (p. 33 of the article; PDF p. 30 of the numdam file): “Finally we note that K⁰ and K¹ are functors. If φ: A → B is a ring homomorphism, then ⊗_A B : P(A) → P(B) induces φ_1 : K¹(A) → K¹(B).” — Bass's functoriality through base change of projectives, compatible with this one by U.2/automorphism-class-base-change.

### Stabilised matrices have the same K₁ class

`U.2/K1-stabilisation-invariance` · lemma

For m ≤ n and g ∈ GL_m(A): [stabilise_{m,n} g] = [g] in K₁(A); more generally [g ⊕ 1_k] = [g] and [1_k ⊕ g] = [g].

**Hypotheses.**

- A is an associative unital ring.

**Proof.**

1. of_n (stabilise g) = of_m g in GL(A) (StableGL.of_stabilise), so the classes agree; g ⊕ 1 = stabilise g (U.1/block-sum).
2. 1_k ⊕ g is conjugate to g ⊕ 1_k by the block swap (blockSum_swap) and K₁(A) is commutative, so conjugate elements have the same class (K1.of_conj).

**Acceptance.**

- [diag(u, 1, 1)] = [u] and [diag(1, u)] = [u] for u ∈ Aˣ.

**Depends on.** this roadmap: `U.2/K1`, `U.1/stable-general-linear-group`, `U.1/block-sum`.

**Sources.**

- `Kbook.2013`, III.1.6, proof of Lemma 1.6 (PDF p. 193; draft p. 185): “Next we observe that there is no harm in stabilizing, i.e., replacing Q by Q⊕Rm and P ⊕Q ∼= Rn by P ⊕(Q⊕Rm) ∼= Rn+m. This is because GLn(R) →GL(R) factors through GLn+m(R).” — Stabilisation does not change the class.

### Elementary matrices and diag(g, g⁻¹) have trivial K₁ class

`U.2/K1-elementary-trivial` · lemma

For every ring A: [e] = 1 in K₁(A) for every e ∈ E_n(A) (in particular [e_ij(a)] = 1 and [w̄_ij] = 1), and [g ⊕ g⁻¹] = 1 for every g ∈ GL_n(A). The latter is the test 'diag(g, g⁻¹) has trivial class after stabilisation' of U.6.

**Hypotheses.**

- A is an associative unital ring; e ∈ E_n(A); g ∈ GL_n(A).

**Proof.**

1. of_n e ∈ E(A) (U.1/stable-elementary-subgroup), so its class is 1 (K1.mk_eq_one_iff).
2. g ⊕ g⁻¹ ∈ E_{2n}(A) by U.1/whitehead-diagonal.

**Acceptance.**

- [e_12(5)] = 1 in K₁(ℤ); [diag(2, 1/2)] = 1 in K₁(ℚ).

**Depends on.** this roadmap: `U.2/K1`, `U.1/stable-elementary-subgroup`, `U.1/whitehead-diagonal`, `U.1/signed-transposition`.

**Sources.**

- `Kbook.2013`, III.1.2.1, Example 1.2.1 (PDF p. 188; draft p. 180): “Moreover, if g ∈GLn(R) then we see by Ex. I. 1.11 that E2n(R) contains the matrix g 0 0 g−1 .” — diag(g, g⁻¹) ∈ E_{2n}(R), hence has trivial class.

### The group law of K₁ is block sum

`U.2/K1-block-sum` · lemma

For g ∈ GL_m(A) and h ∈ GL_n(A): [g ⊕ h] = [g]·[h] in K₁(A). For g, h ∈ GL_n(A): [g ⊕ h] = [gh] = [hg].

**Hypotheses.**

- A is an associative unital ring.

**Proof.**

1. g ⊕ h = (g ⊕ 1_n)(1_m ⊕ h) because blockSum is a homomorphism (U.1/block-sum), and [g ⊕ 1] = [g], [1 ⊕ h] = [h] (U.2/K1-stabilisation-invariance).
2. For equal sizes, g ⊕ h ≡ gh ⊕ 1 ≡ hg ⊕ 1 modulo E_{2n}(A) (U.1/whitehead-block-product), and [gh ⊕ 1] = [gh].

**Acceptance.**

- [diag(u, v)] = [u][v] = [uv] for units u, v; over ℍ[ℝ], [diag(i, j)] = [k] = [−k].

**Depends on.** this roadmap: `U.2/K1`, `U.1/block-sum`, `U.2/K1-stabilisation-invariance`, `U.1/whitehead-block-product`.

**Sources.**

- `Kbook.2013`, Exercise III.1.6 (PDF p. 197; draft p. 189): “Show that in K1(R) we have [α ⊕mn β] = [α][β].” — The lemma (the K-book writes the group law multiplicatively here).
- `Bass.1964`, § 12, proof of Proposition (12.1) (p. 32 of the article; PDF p. 29 of the numdam file): “g is multiplicative. For if dom α = P = dom β an isomorphism P⊕Q ≅ A^n induces α⊕1_Q ≅ α_n, β⊕1_Q ≅ β_n, and αβ⊕1_Q ≅ α_nβ_n.” — The multiplicativity used alongside the block-sum formula.

### K₁ of a product of two rings

`U.2/K1-prod` · theorem

For rings A and B, the projections A × B → A and A × B → B induce an isomorphism K₁(A × B) ≃* K₁(A) × K₁(B).

**Hypotheses.**

- A, B associative unital rings.

**Proof.**

1. Entrywise projection gives a ring isomorphism Matrix n n (A × B) ≃+* Matrix n n A × Matrix n n B (RingHom.prod of RingHom.mapMatrix of the two projections, bijective entrywise), hence GL_n(A × B) ≃* GL_n(A) × GL_n(B) (units of a product, MulEquiv.prodUnits), compatible with stabilisation.
2. Passing to direct limits over ℕ (both sides are direct limits of the same system; build the maps with StableGL.lift and StableGL.map and check they are inverse on each GL_n), GL(A × B) ≃* GL(A) × GL(B).
3. Under this isomorphism E_n(A × B) = E_n(A) × E_n(B): e_ij((a, b)) ↦ (e_ij(a), e_ij(b)) gives ⊆, and (e_ij(a), 1) = e_ij((a, 0)), (1, e_ij(b)) = e_ij((0, b)) give ⊇, since E_n(A) × E_n(B) is generated by these; hence E(A × B) ↦ E(A) × E(B).
4. The quotient of a product by a product of normal subgroups is the product of the quotients.

**Acceptance.**

- K₁(F × F) ≃* F^× × F^× for a field F (with U.3/SK1-field); this is the product-of-fields computation U.6 requires.
- K₁(ℤ × ℤ) ≃* {±1} × {±1}, the class of (−1, 1) ∈ GL_1(ℤ × ℤ) corresponding to ([−1], 1).

**Depends on.** this roadmap: `U.2/K1`, `U.2/K1-map`, `U.1/stable-general-linear-group`, `U.1/stable-elementary-subgroup`, `U.1/elementary-subgroup`; libraries: `mathlib:RingHom.prod`, `mathlib:RingHom.mapMatrix`, `mathlib:MulEquiv.prodUnits`.

**Sources.**

- `Kbook.2013`, III.1.1.3, Example 1.1.3 (PDF p. 188; draft p. 180): “Example 1.1.3. If R is the product R′ × R′′ of two rings, then K1(R) = K1(R′) ⊕K1(R′′). Indeed, GL(R) is the product GL(R′) × GL(R′′), and the commutator subgroup decomposes accordingly.” — The theorem and the outline of its proof.

### K₁ of a finite product of rings

`U.2/K1-pi` · lemma

For a finite family of rings (A_i)_{i ∈ I}, the projections induce K₁(∏_i A_i) ≃* ∏_i K₁(A_i). The proof uses finiteness of I twice: for infinite I, GL(∏ A_i) is smaller than ∏ GL(A_i) (an element of GL(∏ A_i) has a bounded matrix size, a family of elements of the GL(A_i) need not), and a family of elementary words in the E_n(A_i) is a finite product only if the word lengths are bounded, which is automatic for finitely many factors.

**Hypotheses.**

- I is a finite type; each A_i is an associative unital ring.

**Proof.**

1. Either induct on I from U.2/K1-prod (using ∏_{I ⊔ {j}} A_i ≅ (∏_I A_i) × A_j), or repeat its proof: Matrix n n (∏ A_i) ≃+* ∏ Matrix n n A_i, GL_n(∏ A_i) ≃* ∏ GL_n(A_i), and E_n(∏ A_i) = ∏ E_n(A_i) using e_ij(Pi.single i a) for the generators of the i-th factor, which needs I finite so that a tuple of elementary words is a finite product.
2. Pass to direct limits (finitely many coordinates have representatives in a common rank) and to the quotient.

**Acceptance.**

- K₁(F_1 × ⋯ × F_r) ≃* F_1^× × ⋯ × F_r^× for fields F_i (with U.3/SK1-field).

**Depends on.** this roadmap: `U.2/K1-prod`, `U.2/K1`; libraries: `mathlib:RingHom.pi`, `mathlib:RingHom.mapMatrix`.

**Sources.**

- `Kbook.2013`, III.1.1.3, Example 1.1.3 (PDF p. 188; draft p. 180): “If R is the product R′ × R′′ of two rings, then K1(R) = K1(R′) ⊕K1(R′′).” — The binary case; the finite case follows by induction.

### Matrices as endomorphisms of the free right module Aⁿ

`U.2/right-module-matrix-equiv` · construction

For any ring A and n, rightModuleEnd : Module.End Aᵐᵒᵖ (Fin n → A) ≃+* Matrix (Fin n) (Fin n) A, where Fin n → A is the free right A-module Aⁿ_A (a left Aᵐᵒᵖ-module coordinatewise, via Mathlib's instance Semiring.toOppositeModule), sends φ to the matrix whose j-th column is φ(e_j), with inverse M ↦ (v ↦ M *ᵥ v) (column vectors). It is multiplicative in both directions (composition ↔ product, no reversal) and restricts to GL_n(A) ≃* ((Fin n → A) ≃ₗ[Aᵐᵒᵖ] (Fin n → A)). For commutative A, where right and left modules agree, it is Mathlib's Matrix.toLinAlgEquiv' (column convention; Matrix.GeneralLinearGroup.toLin on units). By contrast Mathlib's LinearMap.toMatrixRight' (left modules, row vectors, v ↦ v ᵥ* M) reverses composition and, for commutative A, gives the transpose.

**Hypotheses.**

- A is an associative unital ring; n ∈ ℕ.

**Proof.**

1. M *ᵥ (v · a) = (M *ᵥ v) · a by associativity, so v ↦ M *ᵥ v is Aᵐᵒᵖ-linear; (MN) *ᵥ v = M *ᵥ (N *ᵥ v) (Matrix.mulVec_mulVec), so M ↦ (v ↦ M *ᵥ v) is multiplicative; 1 ↦ id and addition is respected.
2. Inverse: an Aᵐᵒᵖ-linear φ is determined by the images of the standard basis e_j (v = Σ_j e_j · v_j), and the matrix with columns φ(e_j) recovers φ.
3. Equivalently, compose LinearMap.toMatrixRight' over the ring Aᵐᵒᵖ (an anti-isomorphism End_{Aᵐᵒᵖ}((Aᵐᵒᵖ)ⁿ) ≅ Matrix n n Aᵐᵒᵖ) with RingEquiv.mopMatrix : Matrix n n Aᵐᵒᵖ ≃+* (Matrix n n A)ᵐᵒᵖ.
4. For commutative A both sides are A-algebras and the map is Matrix.toLinAlgEquiv'.symm after identifying Aᵐᵒᵖ-modules with A-modules.

**API.**

- `rightModuleEnd` (constructor): rightModuleEnd : Module.End Aᵐᵒᵖ (Fin n → A) ≃+* Matrix (Fin n) (Fin n) A.
- `rightModuleEnd_symm_apply` (simp): rightModuleEnd.symm M v = M *ᵥ v.
- `rightModuleEnd_apply` (simp): rightModuleEnd φ i j = φ (Pi.single j 1) i.
- `rightModuleAut` (constructor): The restriction GL (Fin n) A ≃* ((Fin n → A) ≃ₗ[Aᵐᵒᵖ] (Fin n → A)).
- `rightModuleEnd_comm` (compatibility): For commutative A, rightModuleEnd.symm = Matrix.toLinAlgEquiv' after identifying Aᵐᵒᵖ-modules with A-modules; on units it is Matrix.GeneralLinearGroup.toLin.
- `rightModuleEnd_eq_mopMatrix` (characterisation): rightModuleEnd is LinearMap.toMatrixRight' over Aᵐᵒᵖ followed by RingEquiv.mopMatrix.

**Unit tests.**

- `rightModuleEnd_symm_elementary` (computation): rightModuleEnd.symm (elementary (0 ≠ 1) a) (Pi.single 1 1) = Pi.single 1 1 + Pi.single 0 a in Fin 2 → A.
- `rightModuleEnd_zero_dim` (degenerate): For n = 0 both sides are the zero ring.
- `rightModuleEnd_comm_eq_toLin` (compatibility): For A = ℤ and M : Matrix (Fin 2) (Fin 2) ℤ, rightModuleEnd.symm M acts as Matrix.toLin' M.
- `toMatrixRight_transpose` (non-example): For A = ℤ and φ = Matrix.toLin' (elementary (0 ≠ 1) 1), LinearMap.toMatrixRight' φ is the transpose elementary (1 ≠ 0) 1, not elementary (0 ≠ 1) 1: the row convention is not the one used here.

**Acceptance.**

- rightModuleEnd.symm (elementary h a) sends e_j to e_j + e_i · a and fixes the other basis vectors.
- For commutative A it agrees with Matrix.toLin'.
- It is multiplicative, not anti-multiplicative.

**Used by.**

- KTheoryLowDegrees:U.2/automorphism-class: the matrix of θ(α ⊕ 1_Q)θ⁻¹ on Aⁿ
- KTheoryLowDegrees:U.5 (transfer): an element of GL_n(B) acts on the free right B-module Bⁿ, which restriction of scalars views as an A-module
- K-book I.1: homomorphisms of free right modules are matrices acting on column vectors

**Depends on.** this roadmap: `U.1/elementary-matrix`; libraries: `mathlib:LinearMap.toMatrixRight'`, `mathlib:RingEquiv.mopMatrix`, `mathlib:Matrix.mulVec`, `mathlib:Matrix.mulVec_mulVec`, `mathlib:MulOpposite`, `mathlib:Module.End`, `mathlib:Matrix.toLinAlgEquiv'`, `mathlib:Matrix.GeneralLinearGroup.toLin`.

**Sources.**

- `Kbook.2013`, I.1, after Definition 1.1 (PDF p. 10; draft p. 2): “Our choice to use right modules dictates that we write R-module homomorphisms on the left. In particular, homomorphisms Rn →Rm may be thought of as m × n matrices with entries in R, acting on the column vectors in Rn by matrix multiplication.” — The convention implemented here.
- `Bass.1964`, § 2 (p. 11 of the article; PDF p. 8 of the numdam file): “Viewing A^n as a right A-module we can identify GL(n, A) with Aut_A(A^n).” — The same identification in Bass.

### The class of α ⊕ 1_Q does not depend on the complement

`U.2/automorphism-class-independence` · lemma

Let P be a finitely generated projective right A-module (Module Aᵐᵒᵖ P with Module.Finite and Module.Projective) and α ∈ Aut(P). A presentation of P is a right module Q with an isomorphism θ : P ⊕ Q ≅ Aⁿ_A; put c(Q, θ; α) := [rightModuleEnd(θ ∘ (α ⊕ 1_Q) ∘ θ⁻¹)] ∈ K₁(A). Then (a) presentations exist; (b) for fixed Q, c does not depend on θ; (c) c(Q ⊕ A^m, θ ⊕ id; α) = c(Q, θ; α); (d) c does not depend on (Q, θ). Moreover c(Q, θ; αβ) = c(Q, θ; α)·c(Q, θ; β) and c(Q, θ; 1) = 1.

**Hypotheses.**

- A is an associative unital ring; P is a finitely generated projective right A-module; α, β ∈ Aut(P).

**Proof.**

1. (a) P is a retract of some Aⁿ (Module.Finite.exists_comp_eq_id_of_projective); with s : P → Aⁿ and r : Aⁿ → P, r ∘ s = id, take Q = ker r and θ⁻¹ = (s, inclusion).
2. (b) Two isomorphisms θ, θ′ : P ⊕ Q ≅ Aⁿ differ by g = θ′θ⁻¹ ∈ Aut(Aⁿ) ≅ GL_n(A) (U.2/right-module-matrix-equiv), so the two matrices are conjugate by rightModuleEnd g, and conjugate elements have the same class (K1.of_conj).
3. (c) Replacing Q by Q ⊕ A^m replaces the matrix M by M ⊕ 1_m = stabilise M (U.2/K1-stabilisation-invariance).
4. (d) Given θ : P ⊕ Q ≅ Aⁿ and θ′ : P ⊕ Q′ ≅ A^{n′}, one has Q ⊕ A^{n′} ≅ Q ⊕ P ⊕ Q′ ≅ Aⁿ ⊕ Q′; stabilise both presentations by (c) until the complements are Q ⊕ A^{n′} and Q′ ⊕ Aⁿ, transport one presentation along an isomorphism ψ of complements (replacing θ by θ ∘ (1_P ⊕ ψ), which does not change α ⊕ 1 up to conjugacy), and apply (b).
5. Multiplicativity: α ↦ θ(α ⊕ 1_Q)θ⁻¹ is a homomorphism Aut(P) → Aut(Aⁿ), rightModuleEnd is multiplicative and K1.of is a homomorphism.

**Acceptance.**

- For P = Aⁿ with Q = 0 and θ = id, c is the class of the matrix of α.
- For P = A_A and Q = A, the matrix of α ⊕ 1 is diag(u, 1) when α is left multiplication by u, with the same class as [u].

**Depends on.** this roadmap: `U.2/K1`, `U.2/right-module-matrix-equiv`, `U.2/K1-stabilisation-invariance`; libraries: `mathlib:Module.Finite.exists_comp_eq_id_of_projective`, `mathlib:Module.Projective`, `mathlib:Module.Finite`, `mathlib:LinearEquiv.prodCongr`.

**Sources.**

- `Kbook.2013`, III.1.6, Lemma 1.6 (PDF p. 193; draft p. 185): “Lemma 1.6. The homomorphism from Aut(P) to GL(R) = S GLn(R) is well-deﬁned up to inner automorphism of GL(R). Hence there is a well-deﬁned homomorphism Aut(P) →K1(R).” — The lemma (the text layer renders the union ⋃ as 'S').
- `Kbook.2013`, III.1.6, proof of Lemma 1.6 (PDF p. 193; draft p. 185): “Two diﬀerent isomorphisms between P ⊕Q and Rn must diﬀer by an automorphism of Rn, i.e., by an element g ∈GLn(R). Thus if α ∈Aut(P) maps to the matrices A and B, respectively, we must have A = gBg−1.” — Step (b).
- `Kbook.2013`, III.1.6, proof of Lemma 1.6 (PDF p. 193; draft p. 185): “Finally, suppose given a second isomorphism P ⊕Q′ ∼= Rm. Since Q⊕Rm ∼= Rn ⊕Q′, we may stabilize both Q and Q′ to make them isomorphic, and invoke the above argument.” — Step (d).
- `Bass.1964`, § 12, proof of Proposition (12.1) (p. 32 of the article; PDF p. 29 of the numdam file): “Finally, if P⊕Q′ ≅ A^{n′}, then Q⊕A^{n′} ≅ Q⊕P⊕Q′ ≅ A^n⊕Q′, so we see that the image of α_n in G is independent of Q.” — The same argument in Bass, for right modules.

### The K₁ class of an automorphism of a finitely generated projective module

`U.2/automorphism-class` · construction · planet “K₁ class of an automorphism”

For a finitely generated projective right A-module P, autClass P : Aut(P) →* K₁(A), α ↦ [α] := c(Q, θ; α) for any presentation θ : P ⊕ Q ≅ Aⁿ_A (U.2/automorphism-class-independence). It is a homomorphism, [1] = 1, and it is invariant under transport: for φ : P ≅ P′, [φ α φ⁻¹] = [α]. For P = Aⁿ_A and α = (v ↦ g·v), [α] = [g]; for P free with a basis b, [α] = [matrix of α in b] (column convention). Convention: right modules and column vectors, as in the K-book. For commutative A and a finitely generated projective A-module P (Mathlib's Module A P) the same construction with Matrix.GeneralLinearGroup.toLin gives autClass P α; the construction through LinearMap.toMatrixRight' (left modules, row vectors) would instead give the class of the transposed matrix; for a 2 × 2 matrix of determinant 1 over a commutative ring, transposition replaces its Mennicke symbol by the inverse (from the rules of K-book Ex. III.1.10), so the two conventions differ as soon as SK₁ has elements of order greater than 2. Left modules over a non-commutative A are right Aᵐᵒᵖ-modules, and their classes live in K₁(Aᵐᵒᵖ).

**Hypotheses.**

- A is an associative unital ring; P, P′ are finitely generated projective right A-modules; α, β ∈ Aut(P); φ : P ≃ P′.

**Proof.**

1. Define [α] as c(Q, θ; α) for the presentation chosen by U.2/automorphism-class-independence (a); by (d) any other presentation gives the same value, and multiplicativity is part of that lemma.
2. Transport: if θ : P′ ⊕ Q ≅ Aⁿ then θ ∘ (φ ⊕ 1) is a presentation of P and computes the class of α as that of φαφ⁻¹.
3. Free case: for P = Aⁿ take Q = 0, θ = id; for P with basis b, take θ the coordinate isomorphism of b.
4. Commutative case: for commutative A every A-module is a right module through op, and rightModuleEnd agrees with Matrix.GeneralLinearGroup.toLin (U.2/right-module-matrix-equiv), so the construction is the column-convention one.

**API.**

- `autClass` (constructor): autClass P : (P ≃ₗ[Aᵐᵒᵖ] P) →* K1 A for P finitely generated projective over Aᵐᵒᵖ (a right A-module).
- `autClass_one` (simp): autClass P 1 = 1.
- `autClass_mul` (simp): autClass P (α * β) = autClass P α * autClass P β.
- `autClass_conj` (relation): For φ : P ≃ₗ P′, autClass P′ (φ ∘ α ∘ φ⁻¹) = autClass P α.
- `autClass_eq_of_presentation` (characterisation): For any θ : P × Q ≃ₗ (Fin n → A), autClass P α = K1.of n (rightModuleAut.symm (θ ∘ (α × 1) ∘ θ⁻¹)).
- `autClass_free` (compatibility): autClass (Fin n → A) (rightModuleAut g) = K1.of n g.
- `autClass_basis` (compatibility): For a basis b of P, autClass P α is the class of the matrix of α in b, column convention.
- `autClassComm` (constructor): For commutative A and a finitely generated projective A-module P, autClassComm P : (P ≃ₗ[A] P) →* K1 A, built with Matrix.GeneralLinearGroup.toLin.
- `autClassComm_eq` (compatibility): autClassComm P = autClass of P viewed as a right module through op.

**Unit tests.**

- `autClass_zero_module` (degenerate): For P = 0 the unique automorphism has autClass 1.
- `autClass_left_mul_unit` (computation): For P = A (as a right A-module) and α = left multiplication by u ∈ Aˣ, autClass P α = K1.of 1 u.
- `autClass_swap_int` (computation): For A = ℤ and α the swap (x, y) ↦ (y, x) of ℤ², autClassComm α = K1.of 1 (−1): the swap matrix is w̄_12 · diag(−1, 1).
- `autClassComm_det_free` (compatibility): For A commutative and P free of finite rank, K1.det (autClassComm P α) = LinearMap.det α (U.3/stable-determinant).
- `autClass_nonfree_det` (non-example): For A = ℤ × ℤ and P = ℤ × 0 (projective, not free), autClassComm P (−1) corresponds to ([−1], 1) ∈ K1 ℤ × K1 ℤ under U.2/K1-prod, while Mathlib's LinearMap.det (−1 : P →ₗ P) = 1 because P has no finite basis: a definition through LinearMap.det would lose this class.

**Acceptance.**

- [α] for α = v ↦ g·v on Aⁿ is [g].
- For A = ℤ and the swap automorphism of ℤ², [swap] = [−1] ≠ 1.
- A definition through Mathlib's LinearMap.det would lose classes of non-free projectives (test below).

**Used by.**

- K-book Lemma III.1.6 and Corollary III.1.6.1: Aut(P) → K₁(R), and the product K₀(R) ⊗ K₁(S) → K₁(R ⊗ S), [P]·β = class of 1_P ⊗ β
- K-book Lemma III.1.7 and Corollary III.1.7.1 (KTheoryLowDegrees:U.5): the transfer f_* of a finite projective extension views α ∈ GL_n(S) as an automorphism of the projective R-module Sⁿ
- Bass 1964 § 12: the Whitehead determinant W of an automorphism
- K-book Theorem III.3.2, proof: classes of automorphisms of the modules in a resolution add along exact sequences
- KTheoryLowDegrees:U.3/stable-determinant: for commutative A the determinant of [α] is the determinant of α

**Depends on.** this roadmap: `U.2/automorphism-class-independence`, `U.2/K1`, `U.2/right-module-matrix-equiv`; libraries: `mathlib:Module.Projective`, `mathlib:Module.Finite`, `mathlib:LinearEquiv`, `mathlib:LinearEquiv.automorphismGroup`, `mathlib:Matrix.GeneralLinearGroup.toLin`, `mathlib:LinearMap.toMatrixRight'`, `mathlib:LinearMap.toMatrix`, `mathlib:LinearMap.det`.

**Sources.**

- `Kbook.2013`, III.1, K1 and projective modules (PDF p. 193; draft p. 185): “Now let P be a ﬁnitely generated projective R-module. Choosing an isomorphism P ⊕Q ∼= Rn gives a group homomorphism from Aut(P) to GLn(R). (Send α to α ⊕1Q.)” — The construction.
- `Kbook.2013`, III.1.6, Lemma 1.6 (PDF p. 193; draft p. 185): “Hence there is a well-deﬁned homomorphism Aut(P) →K1(R).” — The resulting homomorphism.
- `Bass.1964`, § 12 (p. 31 of the article; PDF p. 28 of the numdam file): “Let A be a ring and P = P(A) the category of finitely generated projective right A-modules, and A-homomorphisms.” — Bass works with right modules, the convention pinned here.

### The class of a direct sum of automorphisms

`U.2/automorphism-class-direct-sum` · lemma

For finitely generated projective right A-modules P, P′ and α ∈ Aut(P), β ∈ Aut(P′): [α ⊕ β] = [α]·[β] in K₁(A).

**Hypotheses.**

- A is an associative unital ring.

**Proof.**

1. Take presentations θ : P ⊕ Q ≅ A^m and θ′ : P′ ⊕ Q′ ≅ A^n. Then (P ⊕ P′) ⊕ (Q ⊕ Q′) ≅ (P ⊕ Q) ⊕ (P′ ⊕ Q′) ≅ A^m ⊕ A^n = A^{m+n} is a presentation of P ⊕ P′, under which (α ⊕ β) ⊕ 1 corresponds to M ⊕ M′, where M, M′ are the matrices of α ⊕ 1_Q and β ⊕ 1_{Q′}; the rearrangement of summands is an isomorphism of complements, harmless by U.2/automorphism-class-independence.
2. [M ⊕ M′] = [M][M′] (U.2/K1-block-sum).

**Acceptance.**

- [u ⊕ v] = [u][v] for units acting on A_A.
- This is the split case of additivity (U.2/automorphism-class-exact-sequence).

**Depends on.** this roadmap: `U.2/automorphism-class`, `U.2/automorphism-class-independence`, `U.2/K1-block-sum`.

**Sources.**

- `Bass.1964`, § 12, proof of Proposition (12.1) (p. 32 of the article; PDF p. 29 of the numdam file): “g is additive. Let 0→α′→α→α″→0 be an exact sequence, with domains P′, P, P″, respectively. Choose Q′ and Q″ with isomorphisms P′⊕Q′ ≅ A^n ≅ P″⊕Q″.” — The presentation of the middle term used here and in the additivity theorem.
- `Kbook.2013`, Exercise III.1.6 (PDF p. 197; draft p. 189): “Show that in K1(R) we have [α ⊕mn β] = [α][β].” — The matrix case.

### Unipotent automorphisms of a direct sum have trivial class

`U.2/automorphism-class-unipotent` · lemma

For finitely generated projective right A-modules P′, P″ and an A-linear γ : P″ → P′, the automorphism u_γ = [[1, γ], [0, 1]] of P′ ⊕ P″, (x′, x″) ↦ (x′ + γx″, x″), has [u_γ] = 1; likewise the lower unitriangular [[1, 0], [δ, 1]] for δ : P′ → P″.

**Hypotheses.**

- A is an associative unital ring; P′, P″ finitely generated projective right A-modules.

**Proof.**

1. Choose presentations P′ ⊕ Q′ ≅ Aⁿ and P″ ⊕ Q″ ≅ Aⁿ with the same n (stabilise the smaller one, U.2/automorphism-class-independence (c)).
2. Then u_γ ⊕ 1_{Q′ ⊕ Q″} corresponds to the block matrix [[1_n, X], [0, 1_n]] in GL_{2n}(A), with X the matrix of γ extended by zero on Q″ and composed with the projection to P′.
3. [[1, X], [0, 1]] ∈ E_{2n}(A) (U.1/block-unitriangular-elementary), so its class is 1 (U.2/K1-elementary-trivial).

**Acceptance.**

- For P′ = P″ = A_A and γ = left multiplication by a, u_γ is e_12(a) and has trivial class.

**Depends on.** this roadmap: `U.2/automorphism-class`, `U.2/automorphism-class-independence`, `U.1/block-unitriangular-elementary`, `U.2/K1-elementary-trivial`.

**Sources.**

- `Bass.1964`, § 12, proof of Proposition (12.1) (p. 32 of the article; PDF p. 29 of the numdam file): “Since the second factor is manifestly in E(2n, A, q), and since” — The second factor is the block unitriangular matrix |1 (α′_n)⁻¹q; 0 1| of the factorisation displayed just before; with q = A this is the present lemma.

### Additivity of the K₁ class along short exact sequences

`U.2/automorphism-class-exact-sequence` · theorem · planet “Additivity of the K₁ class”

Let 0 → P′ →ι P →π P″ → 0 be an exact sequence of right A-modules with P and P″ finitely generated projective (so the sequence splits and P′ is finitely generated projective), and α ∈ Aut(P) with α(ι P′) = ι P′. Then α restricts to α′ ∈ Aut(P′) (ι α′ = α ι) and induces α″ ∈ Aut(P″) (α″ π = π α), and [α] = [α′]·[α″] in K₁(A).

**Hypotheses.**

- A is an associative unital ring; P, P″ finitely generated projective; α ∈ Aut(P) with α(ι P′) = ι P′.

**Proof.**

1. α′ is bijective because α maps ι P′ onto itself, and α⁻¹ also preserves ι P′; α″ is well defined because α preserves ker π = ι P′, with inverse induced by α⁻¹.
2. P″ is projective, so π has a section s (Module.projective_lifting_property); (ι, s) : P′ ⊕ P″ ≅ P. In this decomposition α is [[α′, β], [0, α″]] with β(x″) the ι-preimage of α s x″ − s α″ x″ (which lies in ker π = ι P′).
3. Factor [[α′, β], [0, α″]] = (α′ ⊕ α″)·[[1, α′⁻¹β], [0, 1]]; the second factor has trivial class (U.2/automorphism-class-unipotent) and [α′ ⊕ α″] = [α′][α″] (U.2/automorphism-class-direct-sum); transport along (ι, s) does not change the class (autClass_conj).

**Acceptance.**

- For P = A² with the flag A ⊕ 0 and α upper triangular with diagonal units u, v: [α] = [u][v].
- The hypothesis α(ι P′) = ι P′ cannot be weakened to α(ι P′) ⊆ ι P′ over arbitrary rings; over commutative rings ⊆ suffices, because the induced surjective endomorphism of the finitely generated module P″ is then injective (Mathlib's OrzechProperty.injective_of_surjective_endomorphism) and α(ιP′) = ιP′ follows.

**Depends on.** this roadmap: `U.2/automorphism-class`, `U.2/automorphism-class-unipotent`, `U.2/automorphism-class-direct-sum`; libraries: `mathlib:Module.projective_lifting_property`, `mathlib:OrzechProperty.injective_of_surjective_endomorphism`.

**Sources.**

- `Bass.1964`, § 12, definition of K¹(A, q) (p. 31 of the article; PDF p. 28 of the numdam file): “(A) (Additivity) If 0→α′→α→α″→0 is exact then W_qα = W_qα′ + W_qα″.” — The additivity axiom of Bass's Whitehead group; this theorem shows the matrix class satisfies it.
- `Bass.1964`, § 12, proof of Proposition (12.1) (p. 32 of the article; PDF p. 29 of the numdam file): “Since the exact sequence induces P ≅ P′⊕P″, we can choose an isomorphism P⊕Q′⊕Q″ ≅ A^n⊕A^n compatible with the direct sum of the given sequence with 0→1_{Q′}→1_{Q′}⊕1_{Q″}→1_{Q″}→0.” — The splitting used in the proof.
- `Kbook.2013`, III.3.2, proof of Theorem 3.2 (PDF p. 209; draft p. 201): “Inverting S makes each αi an isomorphism conjugate to α′ 0 0 α′′ . Thus in K1(S−1R) we have [α1] = [α′] + [α′′] = [α2].” — The K-book uses this additivity for block triangular automorphisms.

### Additivity along a projective filtration

`U.2/automorphism-class-filtration` · theorem

Let P be a finitely generated projective right A-module with submodules 0 = P_0 ⊆ P_1 ⊆ ⋯ ⊆ P_r = P such that each P_i/P_{i−1} is projective, and let α ∈ Aut(P) with α(P_i) = P_i for every i. Then each P_i and each P_i/P_{i−1} is finitely generated projective, α induces gr_i α ∈ Aut(P_i/P_{i−1}), and [α] = ∏_{i=1}^{r} [gr_i α] in K₁(A). For commutative A the hypothesis α(P_i) ⊆ P_i suffices.

**Hypotheses.**

- A is an associative unital ring; the filtration has projective successive quotients; α(P_i) = P_i for all i (or ⊆, for commutative A).

**Proof.**

1. Induct on r; r = 0, 1 are trivial.
2. P/P_{r−1} is projective, so 0 → P_{r−1} → P → P/P_{r−1} → 0 splits and P_{r−1} is a direct summand of P, hence finitely generated projective; likewise every P_i/P_{i−1} is a direct summand of P_i.
3. Apply U.2/automorphism-class-exact-sequence: [α] = [α|P_{r−1}]·[gr_r α]; the filtration P_0 ⊆ ⋯ ⊆ P_{r−1} is preserved by α|P_{r−1} with the same graded pieces, so the induction hypothesis gives [α|P_{r−1}] = ∏_{i<r} [gr_i α].
4. Commutative A: descending induction shows α(P_i) = P_i from α(P_i) ⊆ P_i, since each gr_i α is a surjective endomorphism of a finitely generated module, hence injective (OrzechProperty.injective_of_surjective_endomorphism).

**Acceptance.**

- For the standard flag of Aⁿ and an upper triangular α with unit diagonal entries u_1, …, u_n: [α] = [u_1]⋯[u_n] (U.2/block-triangular-class).
- For r = 2 it is U.2/automorphism-class-exact-sequence.

**Depends on.** this roadmap: `U.2/automorphism-class-exact-sequence`, `U.2/automorphism-class`; libraries: `mathlib:Module.Projective.iff_split`, `mathlib:OrzechProperty.injective_of_surjective_endomorphism`.

**Sources.**

- `Bass.1964`, § 12, definition of K¹(A, q) (p. 31 of the article; PDF p. 28 of the numdam file): “(A) (Additivity) If 0→α′→α→α″→0 is exact then W_qα = W_qα′ + W_qα″.” — Iterated along the filtration.
- `Bass.1964`, § 12 (p. 31 of the article; PDF p. 28 of the numdam file): “If α ∈ Aut_A(P) then α defines an A-representation of T on P, t acting as α. In this sense we can think of P[T] as a category of A[T] = A[t, t⁻¹]-modules, and as such we may speak of “ exact sequences ” of α's.” — A filtration preserved by α is a chain of subobjects in this category; the successive quotients are the graded pieces.

### The K₁ class of a block triangular matrix

`U.2/block-triangular-class` · lemma

If g ∈ GL_n(A) is block upper triangular with diagonal blocks g_1 ∈ GL_{n_1}(A), …, g_r ∈ GL_{n_r}(A) (n = Σ n_i, blocks above the diagonal arbitrary), then [g] = ∏_i [g_i] in K₁(A); the same holds for block lower triangular matrices. In particular an upper or lower triangular matrix whose diagonal entries u_1, …, u_n are units has [g] = [u_1]⋯[u_n] = [diag(u_1, …, u_n)]. For commutative A an invertible triangular matrix automatically has unit diagonal entries (det g = ∏ u_i, Matrix.det_of_isUpperTriangular), so this is the U.6 test that a triangular matrix has the product of its diagonal units as determinant class.

**Hypotheses.**

- A is an associative unital ring; g ∈ GL_n(A) block triangular with invertible diagonal blocks (for a triangular matrix: unit diagonal entries).

**Proof.**

1. Direct matrix proof: g = diag(g_1, …, g_r)·v with v block upper unitriangular (v = diag(g_i)⁻¹ g); v is a product of block unitriangular matrices of the form [[1, X], [0, 1]] after grouping blocks, each in E_n(A) (U.1/block-unitriangular-elementary); so [g] = [diag(g_1, …, g_r)] = ∏ [g_i] (U.2/K1-block-sum).
2. Equivalently apply U.2/automorphism-class-filtration to Aⁿ with the flag spanned by the first n_1 + ⋯ + n_i basis vectors, which g preserves (column convention), with gr_i g = g_i.
3. Lower triangular: g preserves the flag spanned by the last basis vectors; or write g = v′·diag(g_i) with v′ block lower unitriangular.
4. Commutative A: Matrix.det_of_isUpperTriangular (and Matrix.BlockTriangular.det) give det g = ∏ det g_i, so invertibility of g forces each diagonal entry of a triangular g to be a unit.

**Acceptance.**

- For A = ℤ and g the upper triangular matrix with rows (−1, 5), (0, 1): [g] = [−1].
- For A = ℍ[ℝ] and g upper triangular with diagonal (i, j): [g] = [i][j] = [k].

**Depends on.** this roadmap: `U.1/block-unitriangular-elementary`, `U.2/K1-block-sum`, `U.2/automorphism-class-filtration`; libraries: `mathlib:Matrix.det_of_isUpperTriangular`, `mathlib:Matrix.BlockTriangular.det`.

**Sources.**

- `Kbook.2013`, III.3.2, proof of Theorem 3.2 (PDF p. 209; draft p. 201): “Inverting S makes each αi an isomorphism conjugate to α′ 0 0 α′′ . Thus in K1(S−1R) we have [α1] = [α′] + [α′′] = [α2].” — The two-block case, used by the K-book for block triangular matrices.
- `Bass.1964`, § 12, proof of Proposition (12.1) (p. 32 of the article; PDF p. 29 of the numdam file): “Since the second factor is manifestly in E(2n, A, q), and since |α′_n 0; 0 α″_n| ≡ |α′_nα″_n 0; 0 1| mod E(2n, A, q),” — The factorisation into a block diagonal and a block unitriangular matrix (display transcribed linearly).

### The K₁ class is compatible with scalar extension

`U.2/automorphism-class-base-change` · lemma

Let f : A → B be a ring homomorphism, P a finitely generated projective right A-module and α ∈ Aut(P). Then P ⊗_A B is a finitely generated projective right B-module and [α ⊗ 1_B] = K1.map f [α] in K₁(B). For commutative A and B this is stated with Mathlib's TensorProduct, LinearMap.baseChange and the instance Module.Projective.tensorProduct; for general rings the right module P ⊗_A B is Z.1's scalar extension of finitely generated projectives (KTheoryLowDegrees:Z.1/extend-scalars-finite-projective, which also gives f^*Aⁿ ≅ Bⁿ), applied to fᵐᵒᵖ : Aᵐᵒᵖ → Bᵐᵒᵖ since right A-modules are left Aᵐᵒᵖ-modules.

**Hypotheses.**

- A, B associative unital rings; f : A →+* B; P finitely generated projective over A (commutative case: A, B commutative, P a finitely generated projective A-module).

**Proof.**

1. A presentation θ : P ⊕ Q ≅ Aⁿ base-changes to (P ⊗ B) ⊕ (Q ⊗ B) ≅ Aⁿ ⊗_A B ≅ Bⁿ, because scalar extension commutes with finite direct sums and A ⊗_A B ≅ B.
2. Under these isomorphisms (α ⊗ 1) ⊕ 1 corresponds to glMap f of the matrix of α ⊕ 1 (for commutative rings: LinearMap.toMatrix_baseChange), so the classes are related by K1.map f (K1.map_of).
3. Commutative case: Module.Projective.tensorProduct supplies projectivity of the base change, and finiteness is preserved.
4. General rings: the module P ⊗_A B, its finiteness and projectivity and f^*Aⁿ ≅ Bⁿ are KTheoryLowDegrees:Z.1/extend-scalars-finite-projective (for the opposite rings); Mathlib's TensorProduct needs a commutative base.

**Acceptance.**

- For P = Aⁿ and α = g, [glMap f g] = K1.map f [g].
- For ℤ → ℤ/2ℤ and P = ℤ², [swap ⊗ 1] = 1 in K₁(ℤ/2ℤ) since −1 = 1.

**Depends on.** this roadmap: `U.2/automorphism-class`, `U.2/K1-map`, `Z.1/extend-scalars-finite-projective`; libraries: `mathlib:TensorProduct`, `mathlib:LinearMap.baseChange`, `mathlib:Module.Projective.tensorProduct`, `mathlib:LinearMap.toMatrix_baseChange`.

**Sources.**

- `Bass.1964`, § 12, end (p. 33 of the article; PDF p. 30 of the numdam file): “Finally we note that K⁰ and K¹ are functors. If φ: A → B is a ring homomorphism, then ⊗_A B : P(A) → P(B) induces φ_1 : K¹(A) → K¹(B).” — Functoriality of the class through base change of projectives.
- `Kbook.2013`, III.1.6.1, proof of Corollary 1.6.1 (PDF p. 194; draft p. 186): “For each ﬁnitely generated projective R-module P and each m, Lemma 1.6 provides a homomorphism Aut(P ⊗Sm) →K1(R ⊗S).” — The source uses classes of tensor products of automorphisms in the same way.

### Bass's universal property of K₁

`U.2/automorphism-class-universal` · theorem · planet “Bass's universal property of K₁”

Let G be a commutative group and W a function assigning to every pair (P, α), P a finitely generated projective right A-module and α ∈ Aut(P), an element W(P, α) ∈ G such that (M) W(P, αβ) = W(P, α)·W(P, β) and (A) W(P, α) = W(P′, α′)·W(P″, α″) for every exact sequence 0 → (P′, α′) → (P, α) → (P″, α″) → 0 of modules with compatible automorphisms (it suffices to ask (A) for split exact sequences). Then there is a unique homomorphism h : K₁(A) → G with W(P, α) = h([α]) for all (P, α). Conversely [·] satisfies (M) and (A) (U.2/automorphism-class, U.2/automorphism-class-exact-sequence). So K₁(A) is Bass's Whitehead group K¹(A), defined by this universal problem.

**Hypotheses.**

- A is an associative unital ring; G a commutative group; W satisfies (M) and (A).

**Proof.**

1. (A) applied to 0 → (P, α) → (P′, α′) → 0 → 0 for an isomorphism shows W is invariant under isomorphism, and (M) with α = β = 1 gives W(P, 1) = 1.
2. Define h_n : GL_n(A) → G, h_n(g) := W(Aⁿ_A, g); it is a homomorphism by (M). The split sequence 0 → (Aⁿ, g) → (A^{n+1}, g ⊕ 1) → (A, 1) → 0 and W(A, 1) = 1 give h_{n+1}(stabilise g) = h_n(g), so the h_n induce h : GL(A) → G (StableGL.lift).
3. An elementary matrix e_ij(a) fixes the submodule U spanned by the e_k with k ≠ j pointwise and induces the identity on Aⁿ/U (generated by the image of e_j), so (A) gives h(e_ij(a)) = W(U, 1)·W(Aⁿ/U, 1) = 1; hence h kills E(A) and factors through K₁(A) (K1.lift).
4. For a presentation P ⊕ Q ≅ Aⁿ: W(P, α) = W(P, α)·W(Q, 1) = W(P ⊕ Q, α ⊕ 1) (by (A) for the split sequence) = W(Aⁿ, θ(α ⊕ 1)θ⁻¹) = h([α]).
5. Uniqueness: K₁(A) is generated by the classes [g] = [(Aⁿ, g)] (K1.mk_surjective).

**Acceptance.**

- For commutative A, W(P, α) := the determinant of the class of α satisfies (M) and (A), and the induced h is K1.det (U.3/stable-determinant).
- Bass's remark that (A) may be restricted to split sequences is the case used in the proof.

**Depends on.** this roadmap: `U.2/automorphism-class`, `U.2/automorphism-class-exact-sequence`, `U.2/K1`, `U.1/stable-general-linear-group`, `U.1/elementary-matrix`.

**Sources.**

- `Bass.1964`, § 12, definition of K¹(A, q) (p. 31 of the article; PDF p. 28 of the numdam file): “(M) (Multiplicativity) If dom α = dom β then W_qαβ = W_qα + W_qβ.” — The second axiom.
- `Bass.1964`, § 12 (p. 31 of the article; PDF p. 28 of the numdam file): “Although we have no need for this fact, the reader will be able to determine easily that K¹ is unaltered if we relax (A) to apply only to split exact sequences.” — The split version of (A).
- `Bass.1964`, § 12, Proposition (12.1) (p. 32 of the article; PDF p. 29 of the numdam file): “Proposition (12.1). — The inclusions GL(n, A, q) ⊂ obj P_q[t, t⁻¹] induce an isomorphism f : GL(A, q)/E(A, q) → K¹(A, q).” — The theorem with q = A: the universal object is GL(A)/E(A).
- `Kbook.2013`, III.1.6.3, Corollary 1.6.3 (Bass) (PDF p. 194; draft p. 186): “Corollary 1.6.3. (Bass) K1(R) ∼= lim −→P ∈tP H1(Aut(P); Z).” — The K-book's form of the same description of K₁ through automorphisms of projectives.

## U.3 — Determinant, units and SK₁

*Coverage: partial.* For commutative A: the stable determinant from Mathlib's GeneralLinearGroup.det (compatible with stabilisation, natural, and different from Mathlib's LinearMap.det on non-free projectives), the section Aˣ → K₁(A) (not injective for non-commutative rings: the upper triangular 2 × 2 matrices over 𝔽_2, checked by computation), SK₁ = ker det, the natural splitting K₁(A) ≅ Aˣ × SK₁(A), SL(A) and SL(A)/E(A) ≅ SK₁(A). Fields: SL_n(F) = E_n(F) from Tau Ceti's closure_range_toSpecialLinearGroup_eq_top_of_field and the stable statement SK₁(F) = 1, E(F) = SL(F) (K3BlochGroups V.2, ArithmeticKTheory N.1, EllipticKTheory). Semilocal rings by explicit elementary reduction through Bass's stable range: the definition (all n, with the K-book and BMS indexings compared; U.4 uses n = 2), transitivity of E_r on unimodular columns, GL_r = E_r·GL_n and surjective stability, stable range one ⇒ SL_r = E_r, the unit lemma by prime avoidance for finitely many maximal ideals, stable range one for commutative semilocal rings, SK₁ = 1 for commutative semilocal and local rings (KTheoryFiniteLocalFields L.3, L.6, L.7). Division rings: elementary reduction and normality of E_n(D), the Dieudonné determinant by Dieudonné's recursion with his properties 1°–3°, multiplicativity, ker Δ_n = E_n(D) for all n ≥ 2 (no exception; sourceIssues), the block triangular formula and stabilisation, [GL_n(D), GL_n(D)] = E_n(D) except (2, 𝔽_2), K₁(D) ≅ Dˣab, and the non-existence of a Dˣ-valued determinant (ℍ). Mathlib's Dieudonné generation theorem is cited and shown insufficient (exceptional elements, conjugated transvections). Non-example: SK₁(ℝ[x, y]/(x² + y² − 1)) ≠ 1 (K-book Example III.1.5.4), with its topological inputs recorded as a gap. The scheme warning is not a U.3 declaration, since K₁ of schemes belongs to the scheme roadmaps: for a smooth projective curve X over 𝔽_q, geometrically connected, K-book VI.6 (PDF p. 510) gives K₁(X) ≅ 𝔽_q^× × 𝔽_q^× while the global units are H⁰(X, O_X)^× = 𝔽_q^×, so K₁(X) is not the unit group of global functions. The S-integer case of 'K₁ = units' is U.4's (Bass–Milnor–Serre).

- Remaining: Obtain the topological inputs of U.3/SK1-real-circle-nonzero (gap: E_n(R) is the identity component of SL_n(R) for a commutative Banach algebra R, and π₁(SO_2) ≅ ℤ → π₁(SO_n) ≅ ℤ/2 is onto for n ≥ 3), or an algebraic proof through Mennicke symbols (K-book Ex. III.1.10 gives only the statement SK₁ ≅ ℤ/2).

### The determinant on K₁ of a commutative ring

`U.3/stable-determinant` · construction · planet “Determinant on K₁”

For a commutative ring A, K1.det : K₁(A) →* Aˣ is induced by Mathlib's Matrix.GeneralLinearGroup.det : GL_n(A) →* Aˣ: det(stabilise g) = det g, so the finite determinants lift to StableGL.det : GL(A) →* Aˣ (StableGL.lift), which kills E(A) since det e_ij(a) = 1 (and in any case since Aˣ is commutative and E(A) = ⁅GL(A), GL(A)⁆). Thus K1.det [g] = det g. It is surjective, and natural: for a ring homomorphism f : A → B of commutative rings, K1.det ∘ K1.map f = Units.map f ∘ K1.det. For a finitely generated free A-module P, K1.det (autClassComm P α) = LinearMap.det α; for projective non-free P, K1.det [α] is not Mathlib's LinearMap.det α (which is 1 when no finite basis exists).

**Hypotheses.**

- A is a commutative ring (for naturality, f : A →+* B with B commutative).

**Proof.**

1. det_stabilise (U.1/stabilisation-map) makes (Matrix.GeneralLinearGroup.det)_n a compatible family, so StableGL.lift gives StableGL.det with StableGL.det (of_n g) = det g.
2. det (elementary h a) = 1 (U.1/elementary-matrix), so StableGL.elementary A ≤ ker StableGL.det and QuotientGroup.lift gives K1.det.
3. Surjectivity: det (K1.ofUnits u) = u (U.3/units-to-K1), or Matrix.GeneralLinearGroup.det_surjective in rank 1.
4. Naturality: det (glMap f g) = Units.map f (det g) (Matrix.GeneralLinearGroup.map_det, as glMap f = GeneralLinearGroup.map f for commutative rings), and K1.map f [g] = [glMap f g].
5. Free modules: for a basis b of P the class is that of the matrix of α in b (autClass_basis), whose determinant is LinearMap.det α (LinearMap.det_toMatrix).

**API.**

- `StableGL.det` (constructor): For commutative A, StableGL.det : StableGL A →* Aˣ with StableGL.det (StableGL.of n g) = Matrix.GeneralLinearGroup.det g.
- `K1.det` (constructor): K1.det : K1 A →* Aˣ for commutative A.
- `K1.det_of` (simp): K1.det (K1.of n g) = Matrix.GeneralLinearGroup.det g.
- `K1.det_mk` (simp): K1.det (K1.mk x) = StableGL.det x.
- `K1.det_surjective` (characterisation): K1.det is surjective.
- `K1.det_map` (functoriality): K1.det (K1.map f x) = Units.map f (K1.det x) for f : A →+* B of commutative rings.
- `K1.det_autClassComm_free` (compatibility): For P finitely generated free over commutative A, K1.det (autClassComm P α) = LinearMap.det α (as a unit).
- `K1.det_blockSum` (simp): K1.det (K1.of (m + n) (blockSum (g, h))) = det g * det h.

**Unit tests.**

- `K1.det_diag_rat` (computation): K1.det (K1.of 2 (diag(2, 3))) = 6 in ℚˣ.
- `K1.det_zero_ring` (degenerate): For the zero ring, K1.det is the unique homomorphism between trivial groups.
- `K1.det_comp_of` (compatibility): K1.det.comp (K1.of n) = Matrix.GeneralLinearGroup.det for every n.
- `K1.det_not_injective_circle` (non-example): K1.det is not injective for A = ℝ[x, y]/(x² + y² − 1): the class of the matrix with rows (x, −y), (y, x) over ℝ[x, y]/(x² + y² − 1) has determinant x² + y² = 1 but is nontrivial (U.3/SK1-real-circle-nonzero).
- `K1.det_ne_linearMap_det` (non-example): For A = ℤ × ℤ and P = ℤ × 0, K1.det (autClassComm P (−1)) = (−1, 1) ≠ 1, while LinearMap.det (−1 : P →ₗ[A] P) = 1.

**Acceptance.**

- K1.det [diag(2, 3)] = 6 in ℚˣ.
- K1.det ∘ K1.of n = Matrix.GeneralLinearGroup.det.
- Naturality along ℤ → ℤ/3ℤ: K1.det (K1.map f [−1]) = −1 = 2.

**Used by.**

- K-book Example III.1.1.1: SK₁(R) is the kernel of det : K₁(R) → R×
- EllipticKTheory:E.3/boundaries-in-degrees-one-and-zero: the degree-one boundary of the localisation sequence of a curve is computed through the determinant
- EllipticKTheory:E.4/K1-and-SK1-of-a-curve: K₁ of a curve and its special subgroup
- ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant: K₁(O_{F,S}) ≅ O_{F,S}^× by the determinant, via U.4
- KTheoryFiniteLocalFields:L.1/determinant-degree-one: K₁(𝔽_q) ≅ 𝔽_q^× by the determinant, via U.6
- KTheoryLowDegrees:U.5: the relative determinant K₁(A, I) → (1 + I)^× and the comparison of the transfer with the norm
- KTheoryLowDegrees:U.6: a triangular matrix has the product of its diagonal units as determinant class

**Depends on.** this roadmap: `U.2/K1`, `U.2/K1-map`, `U.2/automorphism-class`, `U.1/stable-general-linear-group`, `U.1/stabilisation-map`, `U.1/elementary-matrix`; libraries: `mathlib:Matrix.GeneralLinearGroup.det`, `mathlib:Matrix.GeneralLinearGroup.det_surjective`, `mathlib:Matrix.GeneralLinearGroup.map_det`, `mathlib:DirectLimit.lift`, `mathlib:QuotientGroup.lift`, `mathlib:LinearMap.det`, `mathlib:LinearMap.det_toMatrix`.

**Sources.**

- `Kbook.2013`, III.1.1.1, Example 1.1.1 (SK1) (PDF p. 188; draft p. 180): “If R happens to be commutative, the determinant of a matrix provides a group homomorphism from GL(R) onto the group R× of units of R. It is traditional to write SK1(R) for the kernel of the induced surjection det: K1(R) →R×.” — The determinant on GL(R) and the induced surjection on K₁(R).

### The units of a ring in K₁

`U.3/units-to-K1` · construction

For any ring A, K1.ofUnits : Aˣ →* K₁(A) sends u to the class of the 1 × 1 matrix u, i.e. K1.of 1 applied to GL_1(A) ≅ Aˣ; [diag(u_1, …, u_n)] = ofUnits(u_1 ⋯ u_n) in any order. For commutative A it is a section of the determinant, K1.det ∘ K1.ofUnits = id, hence injective. For non-commutative A it factors through Aˣ/[Aˣ, Aˣ] (K₁ is commutative) and need not be injective: for the ring T of upper triangular 2 × 2 matrices over 𝔽_2, Tˣ ≅ ℤ/2 but ofUnits is trivial.

**Hypotheses.**

- A is an associative unital ring (commutative for the section property).

**Proof.**

1. GL (Fin 1) A ≃* Aˣ (a 1 × 1 matrix is invertible iff its entry is a unit); compose with K1.of 1.
2. Diagonal matrices: diag(u_1, …, u_n) = diag(u_1, 1, …) ⋯ diag(1, …, u_n), each factor conjugate by a permutation matrix to a stabilised 1 × 1 matrix, and K₁ is commutative; [diag(u, v)] = [uv] by U.2/K1-block-sum.
3. Section: det (diag(u)) = u (Matrix.GeneralLinearGroup.det in rank 1), so K1.det (ofUnits u) = u (U.3/stable-determinant).
4. The example T: T has units {1, u} with u the matrix with rows (1, 1), (0, 1); diag(u, 1) ∈ E_2(T) (recomputed by enumerating the closure of the elementary matrices in GL_2(T), which has 576 elements and contains diag(u, 1)), so ofUnits u = 1.

**API.**

- `K1.ofUnits` (constructor): K1.ofUnits : Aˣ →* K1 A, u ↦ K1.of 1 (u as a 1 × 1 matrix).
- `K1.ofUnits_diag` (simp): K1.of n (diagonal of units u_1, …, u_n) = K1.ofUnits (∏ u_i).
- `K1.det_ofUnits` (characterisation): For commutative A, K1.det (K1.ofUnits u) = u.
- `K1.ofUnits_injective` (characterisation): For commutative A, K1.ofUnits is injective.
- `K1.ofUnits_map` (functoriality): K1.ofUnits (Units.map f u) = K1.map f (K1.ofUnits u).
- `K1.ofUnits_commutator` (relation): K1.ofUnits (u * v * u⁻¹ * v⁻¹) = 1, so K1.ofUnits factors through Abelianization Aˣ.

**Unit tests.**

- `K1.ofUnits_neg_one_int` (computation): K1.ofUnits (−1 : ℤˣ) ≠ 1 in K1 ℤ, since K1.det of it is −1.
- `K1.ofUnits_one` (degenerate): K1.ofUnits 1 = 1.
- `K1.ofUnits_eq_of_one` (compatibility): K1.ofUnits u = K1.of 1 (Units.map (Matrix.scalar (Fin 1)).toMonoidHom u), matching Mathlib's GeneralLinearGroup.scalar in rank 1.
- `K1.ofUnits_upperTriangular_trivial` (non-example): For T the ring of upper triangular 2 × 2 matrices over ZMod 2 and u its unit with rows (1, 1), (0, 1): u ≠ 1 but K1.ofUnits u = 1 (diag(u, 1) ∈ E_2(T)).

**Acceptance.**

- ofUnits (−1) ≠ 1 in K₁(ℤ) since its determinant is −1.
- det (ofUnits u) = u for commutative A.
- ofUnits is trivial on the units of the upper triangular 2 × 2 matrices over 𝔽_2.

**Used by.**

- K-book Example III.1.1.1: the section of det giving K₁(R) = R× ⊕ SK₁(R)
- KTheoryLowDegrees:U.3/K1-units-split: the splitting
- KTheoryLowDegrees:U.4: the unit inclusion O_{F,S}^× → K₁(O_{F,S}) → K₁(F)
- KTheoryLowDegrees:U.3/K1-division-ring: Dˣ → K₁(D) is onto, with kernel [Dˣ, Dˣ]

**Depends on.** this roadmap: `U.2/K1`, `U.2/K1-block-sum`, `U.3/stable-determinant`; libraries: `mathlib:Matrix.GeneralLinearGroup.det`.

**Sources.**

- `Kbook.2013`, III.1.1.1, Example 1.1.1 (PDF p. 188; draft p. 180): “Since the natural inclusion of the units R× in GL(R) as GL1(R) is split by the homomorphism det: GL(R) →R×, we see that GL(R) is the semidirect product SL(R)⋊R×, and there is a direct sum decomposition: K1(R) = R× ⊕SK1(R).” — The inclusion R× = GL_1(R) → GL(R) and its splitting by det.
- `Kbook.2013`, III.1.3.7, Example 1.3.7 (Vaserstein) (PDF p. 191; draft p. 183): “If T is the subring of upper triangular matrices in M2(F2), its group of units is abelian (T × ∼= Z/2), but K1(T) = 1” — The non-commutative non-example, checked by computation.

### SK₁ of a commutative ring

`U.3/special-K1` · definition · planet “SK₁”

For a commutative ring A, SK₁(A) := ker(K1.det) ≤ K₁(A). It is functorial: K1.map f maps SK₁(A) into SK₁(B) for f : A → B commutative. SK₁(A) = ⊥ iff K1.det is injective iff K1.ofUnits is surjective. It is the image of the stable special linear group SL(A) (U.3/special-linear-mod-elementary). SK₁ vanishes for fields and commutative semilocal rings (U.3/SK1-field, U.3/SK1-semilocal) but not in general (U.3/SK1-real-circle-nonzero).

**Hypotheses.**

- A is a commutative ring.

**Proof.**

1. Define SK₁(A) := K1.det.ker (MonoidHom.ker).
2. Functoriality from K1.det_map: det (K1.map f x) = Units.map f (det x) = 1 if det x = 1.
3. SK₁(A) = ⊥ ↔ det injective (MonoidHom.ker_eq_bot_iff) ↔ ofUnits surjective (given det ∘ ofUnits = id).

**API.**

- `SK1` (constructor): SK1 A : Subgroup (K1 A) := K1.det.ker, for commutative A.
- `mem_SK1_iff` (characterisation): x ∈ SK1 A ↔ K1.det x = 1.
- `of_mem_SK1_iff` (characterisation): K1.of n g ∈ SK1 A ↔ Matrix.GeneralLinearGroup.det g = 1.
- `SK1.map` (functoriality): K1.map f maps SK1 A into SK1 B; SK1.map f : SK1 A →* SK1 B.
- `SK1_eq_bot_iff` (characterisation): SK1 A = ⊥ ↔ Function.Injective K1.det ↔ Function.Surjective K1.ofUnits.

**Unit tests.**

- `SK1_zero_ring` (degenerate): SK1 A = ⊥ for the zero ring.
- `SK1_field_eq_bot` (computation): SK1 F = ⊥ for a field F (U.3/SK1-field), e.g. F = ZMod 7.
- `SK1_int_eq_bot` (compatibility): SK1 ℤ = ⊥, from Tau Ceti's closure_range_toSpecialLinearGroup_eq_top (SL_n(ℤ) is generated by transvections) through U.3/special-linear-mod-elementary.
- `SK1_circle_ne_bot` (non-example): SK1 (ℝ[x, y]/(x² + y² − 1)) ≠ ⊥: the class of the matrix with rows (x, −y), (y, x) over ℝ[x, y]/(x² + y² − 1) is a nontrivial element (K-book Example III.1.5.4; U.3/SK1-real-circle-nonzero).

**Acceptance.**

- SK₁ of the zero ring and of a field are trivial.
- SK₁(A) is the kernel, not the image, of det: det is always surjective.

**Used by.**

- K-book Example III.1.1.1, Lemma III.1.4 and Example III.1.5.4: SK₁(R) = 1 for semilocal R and SK₁ ≠ 1 for the real circle ring
- KTheoryLowDegrees:U.4: SK₁(O_{F,S}) = 0 (Bass–Milnor–Serre), generated by Mennicke symbols
- EllipticKTheory:E.4/K1-and-SK1-of-a-curve: the special subgroup of K₁ of a curve
- KTheoryFiniteLocalFields:L.3/local-k2-localisation-sequence: SK₁ of the valuation ring of a local field vanishes
- K-book Ex. III.2.1 (KTheoryLowDegrees:U.5): the relative SK₁(R, I) and its sequences

**Depends on.** this roadmap: `U.3/stable-determinant`, `U.3/units-to-K1`, `U.2/K1-map`; libraries: `mathlib:MonoidHom.ker`.

**Sources.**

- `Kbook.2013`, III.1.1.1, Example 1.1.1 (SK1) (PDF p. 188; draft p. 180): “It is traditional to write SK1(R) for the kernel of the induced surjection det: K1(R) →R×.” — The definition.

### The splitting K₁(A) ≅ Aˣ × SK₁(A)

`U.3/K1-units-split` · theorem · planet “K₁(A) = Aˣ ⊕ SK₁(A)”

For a commutative ring A, x ↦ (K1.det x, x · K1.ofUnits(K1.det x)⁻¹) is a group isomorphism K₁(A) ≃* Aˣ × SK₁(A) with inverse (u, y) ↦ K1.ofUnits u · y; it is natural in A (compatible with K1.map f, Units.map f and SK1.map f). Additively: K₁(A) = Aˣ ⊕ SK₁(A).

**Hypotheses.**

- A is a commutative ring.

**Proof.**

1. 1 → SK₁(A) → K₁(A) →det Aˣ → 1 is exact (det surjective, U.3/stable-determinant) and split by ofUnits (K1.det_ofUnits).
2. In a commutative group a split surjection gives a product decomposition: the displayed maps are inverse homomorphisms (MonoidHom.prod of det and x ↦ x·ofUnits(det x)⁻¹, which lands in SK₁ since det(x·ofUnits(det x)⁻¹) = 1).
3. Naturality: K1.det_map and K1.ofUnits_map.

**Acceptance.**

- For a field F: K₁(F) ≃* Fˣ × 1.
- For A = ℝ[x, y]/(x² + y² − 1) the second factor is nontrivial.
- This is the splitting requested by ArithmeticKTheory N.1 and EllipticKTheory E.3/E.4.

**Depends on.** this roadmap: `U.3/stable-determinant`, `U.3/units-to-K1`, `U.3/special-K1`; libraries: `mathlib:MonoidHom.prod`.

**Sources.**

- `Kbook.2013`, III.1.1.1, Example 1.1.1 (PDF p. 188; draft p. 180): “Since the natural inclusion of the units R× in GL(R) as GL1(R) is split by the homomorphism det: GL(R) →R×, we see that GL(R) is the semidirect product SL(R)⋊R×, and there is a direct sum decomposition: K1(R) = R× ⊕SK1(R).” — The theorem.

### The stable special linear group SL(A)

`U.3/stable-special-linear-group` · definition

For a commutative ring A, SL(A) := ker(StableGL.det) ≤ GL(A). of_n g ∈ SL(A) iff det g = 1, so SL(A) is the union of the images of SL_n(A) (via Matrix.SpecialLinearGroup.toGL); E(A) ≤ SL(A); SL(A) is normal and GL(A) is the semidirect product SL(A) ⋊ Aˣ with Aˣ embedded as GL_1(A).

**Hypotheses.**

- A is a commutative ring.

**Proof.**

1. Define SL(A) as the kernel of StableGL.det (U.3/stable-determinant).
2. of_n g ∈ SL(A) ↔ det g = 1 ↔ g ∈ range toGL (Matrix.SpecialLinearGroup.range_toGL).
3. E(A) ≤ SL(A) because det e_ij(a) = 1.
4. The complement u ↦ of_1 u splits StableGL.det, giving the semidirect product.

**API.**

- `StableGL.specialLinear` (constructor): StableGL.specialLinear A : Subgroup (StableGL A) := StableGL.det.ker, commutative A.
- `StableGL.of_mem_specialLinear_iff` (characterisation): StableGL.of n g ∈ StableGL.specialLinear A ↔ Matrix.GeneralLinearGroup.det g = 1.
- `StableGL.elementary_le_specialLinear` (compatibility): StableGL.elementary A ≤ StableGL.specialLinear A.
- `StableGL.specialLinear_normal` (instance): (StableGL.specialLinear A).Normal.
- `StableGL.map_specialLinear_le` (functoriality): StableGL.map f maps StableGL.specialLinear A into StableGL.specialLinear B.

**Unit tests.**

- `StableGL.diag_inv_mem_specialLinear` (computation): StableGL.of 2 (diag(u, u⁻¹)) ∈ StableGL.specialLinear A for u : Aˣ.
- `StableGL.specialLinear_zero_ring` (degenerate): For the zero ring StableGL.specialLinear A = ⊤.
- `StableGL.specialLinear_of_range_toGL` (compatibility): StableGL.of n ⁻¹' specialLinear = Set.range (Matrix.SpecialLinearGroup.toGL : SL (Fin n) A → GL (Fin n) A) (Mathlib's range_toGL).
- `StableGL.elementary_ne_specialLinear_circle` (non-example): For A = ℝ[x, y]/(x² + y² − 1), StableGL.elementary A ≠ StableGL.specialLinear A (U.3/SK1-real-circle-nonzero).

**Acceptance.**

- of_2 diag(u, u⁻¹) ∈ SL(A).
- E(A) ≤ SL(A), with equality for fields and semilocal rings.

**Used by.**

- K-book Example III.1.1.1: GL(R) = SL(R) ⋊ R×
- KTheoryLowDegrees:U.3/special-linear-mod-elementary: SK₁(A) = SL(A)/E(A)
- K3BlochGroups:V.2/k3-to-h3-sl-field: E(F) = SL(F) for a field
- K-book Ex. IV.1.8: π₁ BSL(R)⁺ ≅ SK₁(R) and BSL(R)⁺ × B(R×) ≃ BGL(R)⁺

**Depends on.** this roadmap: `U.3/stable-determinant`, `U.1/stable-general-linear-group`, `U.1/stable-elementary-subgroup`; libraries: `mathlib:Matrix.SpecialLinearGroup.toGL`, `mathlib:Matrix.SpecialLinearGroup.range_toGL`, `mathlib:MonoidHom.ker`.

**Sources.**

- `Kbook.2013`, III.1.1.1, Example 1.1.1 (PDF p. 188; draft p. 180): “The special linear group SLn(R) is the subgroup of GLn(R) consisting of matrices with determinant 1, and SL(R) is their union.” — The definition.

### SL(A)/E(A) is SK₁(A)

`U.3/special-linear-mod-elementary` · comparison

For a commutative ring A, the inclusion SL(A) ≤ GL(A) induces an isomorphism SL(A) ⧸ E(A) ≃* SK₁(A) (E(A) viewed inside SL(A)).

**Hypotheses.**

- A is a commutative ring.

**Proof.**

1. The composite SL(A) → GL(A) → K₁(A) has kernel SL(A) ∩ E(A) = E(A) (E(A) ≤ SL(A)) and lands in SK₁(A) since det = 1.
2. It is onto SK₁(A): x = K1.mk y with det x = StableGL.det y = 1 means y ∈ SL(A).
3. QuotientGroup.quotientKerEquivRange (or QuotientGroup.lift with the two facts) gives the isomorphism.

**Acceptance.**

- For a field both sides are trivial.
- For A = ℤ: SL(ℤ) = E(ℤ) (Tau Ceti's closure_range_toSpecialLinearGroup_eq_top), so SK₁(ℤ) = 1.

**Depends on.** this roadmap: `U.3/stable-special-linear-group`, `U.3/special-K1`, `U.2/K1`; libraries: `mathlib:QuotientGroup.quotientKerEquivRange`, `mathlib:QuotientGroup.lift`.

**Sources.**

- `Kbook.2013`, III.1.1.1, Example 1.1.1 (PDF p. 188; draft p. 180): “we see that GL(R) is the semidirect product SL(R)⋊R×, and there is a direct sum decomposition: K1(R) = R× ⊕SK1(R).” — Dividing the semidirect product by E(R) ≤ SL(R) identifies SK₁(R) with SL(R)/E(R).

### SL_n(F) = E_n(F) for a field

`U.3/field-special-linear-eq-elementary` · lemma

For a field F and a finite index type n, the image of SL_n(F) in GL_n(F) is E_n(F); equivalently E_n(F) = ker det. This is Tau Ceti's theorem that SL_n(F) is generated by the transvections TransvectionStruct.toSpecialLinearGroup, transported to GL_n(F), where these transvections are the elementary matrices.

**Hypotheses.**

- F is a field; n a finite type with decidable equality.

**Proof.**

1. Tau Ceti's Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field: the transvections generate SL_n(F).
2. Apply toGL: the image of a closure is the closure of the image (MonoidHom.map_closure), and toGL (TransvectionStruct.toSpecialLinearGroup t) = elementary t.hij t.c (elementary_eq_transvection, TauCeti.toGL_transvection_eq_transvectionUnit).
3. So range toGL = E_n(F); and range toGL = ker det (Matrix.SpecialLinearGroup.range_toGL).

**Acceptance.**

- For F = ZMod 2 and n = 2 both sides have 6 elements.
- For n = 1 both sides are trivial.

**Depends on.** this roadmap: `U.1/elementary-subgroup`, `U.1/elementary-matrix`; libraries: `tauceti:Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`, `tauceti:TauCeti.toGL_transvection_eq_transvectionUnit`, `mathlib:Matrix.TransvectionStruct.toSpecialLinearGroup`, `mathlib:Matrix.SpecialLinearGroup.toGL`, `mathlib:Matrix.SpecialLinearGroup.range_toGL`, `mathlib:MonoidHom.map_closure`.

**Sources.**

- `Kbook.2013`, III.1.2.2 (PDF p. 189; draft p. 181): “If F is a ﬁeld this obstruction is F ×, and is measured by the determinant. That is, En(F) = SLn(F) for all n ≥1. Indeed, standard linear algebra shows that every matrix of determinant 1 is a product of elementary matrices.” — The lemma.

### SK₁ of a field vanishes: K₁(F) = Fˣ

`U.3/SK1-field` · theorem

For a field F: SL(F) = E(F), SK₁(F) = ⊥, and K1.det : K₁(F) ≃* Fˣ with inverse K1.ofUnits. Naturally in F.

**Hypotheses.**

- F is a field.

**Proof.**

1. If of_n g ∈ SL(F) then det g = 1, so g ∈ E_n(F) (U.3/field-special-linear-eq-elementary) and of_n g ∈ E(F).
2. Hence SL(F)/E(F) = 1, so SK₁(F) = ⊥ (U.3/special-linear-mod-elementary), and U.3/K1-units-split gives K₁(F) ≃* Fˣ × 1 ≃* Fˣ.
3. This agrees with U.3/SK1-local (a field is local), which is proved independently through stable range one.

**Acceptance.**

- K₁(ZMod 5) ≃* (ZMod 5)ˣ, cyclic of order 4.
- E(F) = SL(F), the input requested by K3BlochGroups V.2.
- K₁(k(𝔭)) = k(𝔭)ˣ for residue fields, as ArithmeticKTheory N.1 requests.

**Depends on.** this roadmap: `U.3/field-special-linear-eq-elementary`, `U.3/special-linear-mod-elementary`, `U.3/K1-units-split`, `U.3/stable-special-linear-group`.

**Sources.**

- `Kbook.2013`, III.1.3.5, Example 1.3.5 (PDF p. 191; draft p. 183): “Example 1.3.5. If F is a ﬁeld then K1(F) = F ×, because we have already seen that E(F) = SL(F).” — The theorem and its proof.
- `Kbook.2013`, III.1.1.2, Example 1.1.2 (PDF p. 188; draft p. 180): “Example 1.1.2. If F is a ﬁeld, then K1(F) = F ×.” — The statement.

### Bass's stable range condition

`U.3/stable-range` · definition

For a ring A and n ≥ 1, HasStableRange A n (Bass: 'n defines a stable range for GL(A)') means: for every r > n and every column (a_1, …, a_r) ∈ A^r that is left unimodular (Σ_i A a_i = A), there exist b_1, …, b_{r−1} ∈ A such that (a_1 + b_1 a_r, …, a_{r−1} + b_{r−1} a_r) is left unimodular. Indexing: this is the K-book's condition (S_n) of Ex. I.1.5 for all larger lengths, i.e. sr(A) ≤ n (the K-book writes rows and right ideals, the mirror condition; the two agree for commutative A, and (S_n) implies (S_m) for m ≥ n by Vaserstein's theorem, Ex. I.1.5(a), which is not needed here); it is BMS's condition (7.2)_{n+1} for the unit ideal. U.3 uses n = 1; U.4 uses n = 2 for Dedekind domains.

**Hypotheses.**

- A is an associative unital ring; n ≥ 1.

**Proof.**

1. State the condition as a Prop over all r > n and all left unimodular r-tuples.
2. Monotonicity HasStableRange A n → HasStableRange A (n + 1) is immediate (the condition for r > n + 1 is part of the condition for r > n).
3. Quotients (Bass, Lemma 4.1): if A has stable range n so does A/𝔮, by lifting a unimodular tuple together with an element of 𝔮 witnessing unimodularity.
4. For n = 1 and r = 2 with A commutative the condition reads: aA + bA = A ⇒ a + tb ∈ Aˣ for some t.

**API.**

- `HasStableRange` (constructor): HasStableRange A n : Prop, Bass's condition.
- `HasStableRange.mono` (other): HasStableRange A n → n ≤ m → HasStableRange A m.
- `HasStableRange.quotient` (functoriality): HasStableRange A n → HasStableRange (A ⧸ I) n for a two-sided ideal I (Bass, Lemma 4.1).
- `hasStableRange_one_two` (characterisation): For commutative A, HasStableRange A 1 → Ideal.span {a, b} = ⊤ → ∃ t, IsUnit (a + t * b) (the case r = 2).
- `HasStableRange.of_field` (example): Every field (indeed every division ring) has stable range 1.

**Unit tests.**

- `not_hasStableRange_one_int` (non-example): ¬ HasStableRange ℤ 1: the column (2, 5) is unimodular but no 2 + 5b is a unit.
- `hasStableRange_one_zmod` (computation): HasStableRange (ZMod 6) 1 (a finite, hence semilocal, commutative ring).
- `hasStableRange_zero_ring` (degenerate): The zero ring has stable range 1 (every tuple is unimodular).
- `hasStableRange_bms_index` (compatibility): HasStableRange A n ↔ BMS's condition (7.2)_{n+1} for q = A, i.e. U.4's stable-range condition with the shifted index.

**Acceptance.**

- ℤ does not have stable range 1: (2, 5) is unimodular (3·2 − 5 = 1) but 2 + 5b = ±1 has no integer solution (recomputed).
- Every commutative semilocal ring has stable range 1 (U.3/semilocal-stable-range-one).

**Used by.**

- Bass 1964 Theorem 4.2: in the stable range E_r(A) is transitive on unimodular columns and GL_r(A) = GL_n(A)E_r(A)
- K-book Ex. III.1.3: sr(R) = d + 1 gives GL_n(R) = GL_{d+1}(R)E_n(R)
- KTheoryLowDegrees:U.4: Dedekind domains have stable range 2; surjective stability from GL_2 and Mennicke symbols (BMS § 7)
- KTheoryLowDegrees:U.3/semilocal-stable-range-one: semilocal rings have stable range 1

**Depends on.** libraries: `mathlib:Ideal.span_singleton_eq_top`, `mathlib:Ideal.Quotient.mk_surjective`.

**Sources.**

- `Bass.1964`, § 4, Definition (p. 14 of the article; PDF p. 11 of the numdam file): “Let n ≥ 1; we say n defines a stable range for GL(A) if, for all r > n, given α = (a_1, . . ., a_r) unimodular in A^r, there exist b_1, . . ., b_{r−1} in A such that (a_1 + b_1a_r, . . ., a_{r−1} + b_{r−1}a_r) is unimodular in A^{r−1}.” — The definition.
- `Bass.1964`, § 4, Definition (p. 14 of the article; PDF p. 11 of the numdam file): “Let α = (a_1, . . ., a_r) be an element of the right A-module A^r. We call α unimodular (in A^r) if Σ_iAa_i = A.” — Unimodularity is for the left ideal generated by the entries.
- `Kbook.2013`, Exercise I.1.5 (Stable Range Conditions) (PDF p. 12; draft p. 4): “We say that a ring R satisﬁes condition (Sn) if for every unimodular row (r0, r1, ..., rn) in Rn+1 there is a unimodular row (r′ 1, ..., r′ n) in Rn with r′ i = ri −r0ti for some t1, ..., tn in R. The stable range of R, sr(R), is deﬁned to be the smallest n such that R satisﬁes condition (Sn).” — The K-book's indexing, compared in the statement.
- `BMS.1967`, § 7, condition (7.2)_n (p. 106 of the article; PDF p. 49 of the numdam file): “If we require (7.2)_n only for the unit ideal, q = A, then (7.2)_n becomes the condition that “ n − 1 defines a stable range for GL(A) ” in the sense of [1, § 4].” — BMS's shift of index, recorded for U.4.

### In the stable range E_r(A) is transitive on unimodular columns

`U.3/stable-range-transitive` · lemma

If HasStableRange A n and r > n, then for every left unimodular column v ∈ A^r there is τ ∈ E_r(A) with τ·v = e_1 (and likewise τ′·v = e_r). (Bass, Theorem 4.2(a), q = A.)

**Hypotheses.**

- A is an associative unital ring with HasStableRange A n; r > n; v ∈ A^r left unimodular.

**Proof.**

1. Shorten: by the stable range there are b_i with v′ = (v_1 + b_1 v_r, …, v_{r−1} + b_{r−1} v_r) unimodular; τ_1 = ∏_{i<r} e_{ir}(b_i) ∈ E_r(A) maps v to (v′, v_r) (left multiplication adds b_i v_r to v_i).
2. Make the last entry 1: write 1 = Σ_{i<r} c_i v′_i; τ_2 = ∏_{i<r} e_{ri}((1 − v_r)c_i) replaces v_r by v_r + (1 − v_r)Σ c_i v′_i = 1.
3. Clear the others: τ_3 = ∏_{i<r} e_{ir}(−v′_i) gives e_r; then the signed transposition w̄_{1r} (U.1/signed-transposition) sends e_r to e_1.
4. All factors lie in E_r(A); for r ≥ 2 this is the whole argument (Bass's proof also handles a congruence ideal q, not needed here).

**Acceptance.**

- For A a field (stable range 1) and r = 2, every nonzero column is moved to e_1 by elementary matrices.
- For A = ℤ (stable range 2) and r = 3, (6, 10, 15) is unimodular and is moved to e_1.

**Depends on.** this roadmap: `U.3/stable-range`, `U.1/elementary-subgroup`, `U.1/elementary-matrix`, `U.1/signed-transposition`.

**Sources.**

- `Bass.1964`, Theorem (4.2) (p. 14 of the article; PDF p. 11 of the numdam file): “Theorem (4.2). — Suppose n defines a stable range for GL(A). For r > n and for all ideals q: a) The orbits of E(r, A, q) on the unimodular elements of A^r are the congruence classes modulo q. In particular E(r, A) is transitive.” — The lemma is the case q = A.
- `Kbook.2013`, Exercise III.1.3 (PDF p. 197; draft p. 189): “This condition describes the action of Ed+2(R) on unimodular rows in Rd+2.” — The K-book's statement of the same use of stable range.

### Reduction to GL_n in the stable range (surjective stability)

`U.3/stable-range-reduction` · theorem

If HasStableRange A n and r > n then every g ∈ GL_r(A) is e·(h ⊕ 1_{r−n}) with e ∈ E_r(A) and h ∈ GL_n(A): GL_r(A) = E_r(A)·stabilise(GL_n(A)). Consequently K1.of n : GL_n(A) → K₁(A) is surjective; for n = 1 every class is K1.ofUnits u. (Bass, Theorem 4.2(b), q = A.)

**Hypotheses.**

- A is an associative unital ring with HasStableRange A n; r > n.

**Proof.**

1. Descending induction on r. The last column c of g is left unimodular, since the last row of g⁻¹ gives Σ_j (g⁻¹)_{rj} c_j = 1.
2. By U.3/stable-range-transitive there is τ_1 ∈ E_r(A) with τ_1 c = e_r; then τ_1 g has last column e_r, so τ_1 g = [[g_1, 0], [α, 1]] with g_1 ∈ GL_{r−1}(A) (a block lower triangular invertible matrix with invertible corner has invertible diagonal block).
3. τ_2 = [[1, 0], [−α g_1⁻¹, 1]] ∈ E_r(A) (U.1/block-unitriangular-elementary) and τ_2 τ_1 g = g_1 ⊕ 1.
4. Iterate down to rank n; the K₁ statement follows from [e(h ⊕ 1)] = [h] (U.2/K1-elementary-trivial, U.2/K1-stabilisation-invariance) and U.1/finite-representatives.

**Acceptance.**

- For a field (n = 1), every g ∈ GL_r(F) is e·diag(u, 1, …, 1).
- For Dedekind domains (n = 2), GL_2(A) maps onto K₁(A) (the form U.4 uses).

**Depends on.** this roadmap: `U.3/stable-range-transitive`, `U.1/block-unitriangular-elementary`, `U.1/block-sum`, `U.2/K1-elementary-trivial`, `U.2/K1-stabilisation-invariance`, `U.1/finite-representatives`, `U.3/units-to-K1`.

**Sources.**

- `Bass.1964`, Theorem (4.2) b) (p. 14 of the article; PDF p. 11 of the numdam file): “b) GL(r, A, q) = GL(n, A, q)E(r, A, q).” — The theorem with q = A.
- `Bass.1964`, Theorem (4.2), proof of b) (p. 15 of the article; PDF p. 12 of the numdam file): “By induction we can continue reducing until reaching GL(n, A, q).” — The descending induction.
- `Kbook.2013`, Exercise III.1.3(a) (PDF p. 197; draft p. 189): “(a) Show that GLn(R) = GLd+1(R)En(R) for all n > d + 1, and deduce that GLd+1(R) maps onto K1(R).” — The same statement with sr(R) = d + 1.
- `BMS.1967`, Theorem 7.5 b) (p. 106 of the article; PDF p. 49 of the numdam file): “b) GL_m(A, q) = GL_{n−1}(A, q).E_m(A, q).” — BMS's form under (7.2)_n, used by U.4.

### Stable range one gives SL_r = E_r and SK₁ = 1

`U.3/stable-range-one-special-linear` · theorem

If A is commutative and HasStableRange A 1, then E_r(A) = SL_r(A) (image in GL_r(A)) for every r ≥ 1, SL(A) = E(A), SK₁(A) = ⊥ and K1.det : K₁(A) ≃* Aˣ. Moreover every g ∈ GL_r(A) is e·diag(det g, 1, …, 1) with e ∈ E_r(A). (Bass, Proposition 5.1(a), q = A.)

**Hypotheses.**

- A is a commutative ring with HasStableRange A 1.

**Proof.**

1. E_r(A) ≤ SL_r(A) (det of elementary matrices).
2. For g ∈ GL_r(A), r ≥ 2: g = e·(u ⊕ 1) with u ∈ Aˣ (U.3/stable-range-reduction, n = 1); taking determinants u = det g. If det g = 1 then g = e ∈ E_r(A). For r = 1, SL_1 = 1 = E_1.
3. Stable: SL(A) = E(A), hence SK₁(A) = SL(A)/E(A) = 1 (U.3/special-linear-mod-elementary), and U.3/K1-units-split.

**Acceptance.**

- For A = ZMod 12 (finite, so semilocal): SL_2(ZMod 12) = E_2(ZMod 12).

**Depends on.** this roadmap: `U.3/stable-range-reduction`, `U.3/special-linear-mod-elementary`, `U.3/K1-units-split`, `U.3/stable-special-linear-group`, `U.1/elementary-subgroup`; libraries: `mathlib:Matrix.GeneralLinearGroup.det`.

**Sources.**

- `Bass.1964`, Proposition (5.1) (p. 17 of the article; PDF p. 14 of the numdam file): “Proposition (5.1). — Suppose n = 1 defines a stable range for GL(A) (e.g. A can be any semi-local ring).” — The hypothesis.
- `Bass.1964`, Proposition (5.1) a) (p. 18 of the article; PDF p. 15 of the numdam file): “a) If A is commutative, then, for all ideals q and all r ≥ 2, E(r, A, q) = SL(r, A, q) (= SL(r, A) ∩ GL(r, A, q)). In particular E(r, A) = SL(r, A).” — The theorem (q = A).
- `Bass.1964`, Proposition (5.1), proof of a) (p. 18 of the article; PDF p. 15 of the numdam file): “Now an element of GL(r, A, q) is, by (4.2) b), reducible modulo E(r, A, q) to GL(1, A, q), i.e. to a unit, and that unit is evidently the determinant of the original matrix.” — The proof.

### In a commutative semilocal ring b + 𝔞 contains a unit when Ab + 𝔞 = A

`U.3/semilocal-unit-lemma` · lemma

Let A be a commutative ring with finitely many maximal ideals. If b ∈ A and 𝔞 is an ideal with Ab + 𝔞 = A, then b + a ∈ Aˣ for some a ∈ 𝔞. (Bass, Lemma 6.4, commutative case.)

**Hypotheses.**

- A is commutative and MaximalSpectrum A is finite; b ∈ A; 𝔞 an ideal with Ab + 𝔞 = A.

**Proof.**

1. An element lying in no maximal ideal is a unit: otherwise the proper ideal it generates lies in a maximal ideal (Ideal.span_singleton_eq_top, Ideal.exists_le_maximal).
2. Let m_1, …, m_s be the maximal ideals and T = {i : b ∈ m_i}. For i ∈ T, 𝔞 ⊄ m_i, since otherwise Ab + 𝔞 ⊆ m_i. If T = ∅ take a = 0.
3. Let J = ∏_{i ∉ T} m_i (the unit ideal if every i is in T). For i ∈ T, the prime m_i contains neither 𝔞 nor any m_j with j ≠ i (distinct maximal ideals are incomparable, Ideal.IsMaximal.eq_of_le), so 𝔞J ⊄ m_i.
4. Prime avoidance (Ideal.subset_union_prime, finitely many primes m_i, i ∈ T): 𝔞J ⊄ ⋃_{i ∈ T} m_i, so there is a ∈ 𝔞J with a ∉ m_i for all i ∈ T.
5. Then b + a ∉ m_i for every i: for i ∈ T because b ∈ m_i and a ∉ m_i; for i ∉ T because a ∈ 𝔞J ⊆ J ⊆ m_i (Ideal.mul_le_right, Ideal.prod_le_inf) and b ∉ m_i. So b + a is a unit.
6. Bass instead reduces modulo the Jacobson radical to a semisimple ring and uses endomorphisms of vector spaces; for commutative A the prime-avoidance argument above is the same statement (equivalently, the Chinese remainder theorem A/rad A ≅ ∏ A/m_i, Ideal.quotientInfRingEquivPiQuotient).

**Acceptance.**

- A = ZMod 12 (maximal ideals (2), (3)), b = 2, 𝔞 = (3): 2 + 3 = 5 is a unit (recomputed).
- A = ℤ_(p) (local), b ∈ pℤ_(p), 𝔞 = ℤ_(p): b + 1 is a unit.

**Depends on.** libraries: `mathlib:MaximalSpectrum`, `mathlib:Ideal.subset_union_prime`, `mathlib:Ideal.IsMaximal.isPrime`, `mathlib:Ideal.IsMaximal.eq_of_le`, `mathlib:Ideal.exists_le_maximal`, `mathlib:Ideal.span_singleton_eq_top`, `mathlib:Ideal.mul_le_right`, `mathlib:Ideal.prod_le_inf`, `mathlib:Ideal.quotientInfRingEquivPiQuotient`.

**Sources.**

- `Bass.1964`, Lemma (6.4) (p. 20 of the article; PDF p. 17 of the numdam file): “Lemma (6.4). — If b∈A and a is a left ideal such that Ab + a = A, then b + a contains a unit.” — The lemma (Bass's 𝔞 is printed in fraktur); A semi-local means A/rad A Artinian, which for commutative A is equivalent to finitely many maximal ideals.
- `Bass.1964`, § 6, Definition (p. 19 of the article; PDF p. 16 of the numdam file): “Definition. — Call A semi-local if A/rad A is an Artin ring. It follows then that A/rad A is a finite product of full matrix algebras over division rings.” — The hypothesis in Bass's form.

### Commutative semilocal rings have stable range one

`U.3/semilocal-stable-range-one` · theorem

Every commutative ring A with finitely many maximal ideals satisfies HasStableRange A 1. (Bass, Corollary 6.5, commutative case.)

**Hypotheses.**

- A is commutative and MaximalSpectrum A is finite.

**Proof.**

1. Let r > 1 and (a_1, …, a_r) unimodular. Apply U.3/semilocal-unit-lemma to b = a_1 and 𝔞 = Aa_2 + ⋯ + Aa_r: there is a unit u = a_1 + b_2a_2 + ⋯ + b_ra_r.
2. Then u ∈ A(a_1 + b_r a_r) + Aa_2 + ⋯ + Aa_{r−1}, so (a_1 + b_r a_r, a_2, …, a_{r−1}) is unimodular: this is the required shortening with b_1 = b_r and b_i = 0 for 1 < i < r.

**Acceptance.**

- Fields, local rings, finite rings and ZMod n have stable range 1.
- ℤ is not semilocal and does not have stable range 1 (U.3/stable-range test).

**Depends on.** this roadmap: `U.3/semilocal-unit-lemma`, `U.3/stable-range`.

**Sources.**

- `Bass.1964`, Corollary (6.5) (p. 20 of the article; PDF p. 17 of the numdam file): “Corollary (6.5). — n = 1 defines a stable range for GL(A) (in the sense of § 4).” — The theorem, for semi-local A.
- `Bass.1964`, Corollary (6.5), proof (p. 20 of the article; PDF p. 17 of the numdam file): “Let b = a_1 and a = Aa_2 + . . . + Aa_r; then (6.4) provides us with a unit u = a_1 + b_2a_2 + . . . + b_ra_r. Hence u ∈ (A(a_1 + b_ra_r) + Aa_2 + . . . + Aa_{r−1}), as required.” — The proof.
- `Bass.1964`, § 4, Examples (p. 14 of the article; PDF p. 11 of the numdam file): “If A is a semi-local ring, then n = 1 defines a stable range.” — The example as Bass lists it.
- `Kbook.2013`, Exercise I.1.12(v) (PDF p. 15; draft p. 7): “(v) If I is a radical ideal, show that sr(R) = sr(R/I), where sr is the stable range of Exercise 1.5. Conclude that sr(R) = 1 for every local ring R.” — The local case in the K-book.

### SK₁ of a commutative semilocal ring vanishes

`U.3/SK1-semilocal` · theorem · planet “SK₁ of semilocal rings vanishes”

For a commutative ring A with finitely many maximal ideals: E_r(A) = SL_r(A) for every r, SL(A) = E(A), SK₁(A) = ⊥ and K1.det : K₁(A) ≃* Aˣ; every g ∈ GL_r(A) is e·diag(det g, 1, …, 1) with e ∈ E_r(A). What the proof needs: stable range one (U.3/semilocal-stable-range-one, from prime avoidance for the finitely many maximal ideals), transitivity of E_r(A) on unimodular columns and the reduction GL_r = E_r·GL_1 (U.3/stable-range-transitive, U.3/stable-range-reduction), and the determinant. The K-book's alternative proof of Lemma III.1.4 (reduce modulo the Jacobson radical J, use E_n = SL_n over the finite product of fields A/J, lift along E_n(A) → E_n(A/J) and clear the off-diagonal entries lying in J) is not used.

**Hypotheses.**

- A is commutative and MaximalSpectrum A is finite.

**Proof.**

1. U.3/semilocal-stable-range-one gives HasStableRange A 1.
2. U.3/stable-range-one-special-linear gives E_r(A) = SL_r(A), SL(A) = E(A), SK₁(A) = ⊥ and K1.det an isomorphism.

**Acceptance.**

- K₁(ZMod 12) ≃* (ZMod 12)ˣ ≅ (ℤ/2)².
- K₁(ℤ_(p)) ≃* ℤ_(p)ˣ.
- This is the statement KTheoryFiniteLocalFields L.3, L.6 and L.7 request.

**Depends on.** this roadmap: `U.3/semilocal-stable-range-one`, `U.3/stable-range-one-special-linear`.

**Sources.**

- `Kbook.2013`, III.1.4, Lemma 1.4 (PDF p. 191; draft p. 183): “If R is a commutative semilocal ring, then SK1(R) = 1 and K1(R) = R×.” — The theorem.
- `Kbook.2013`, III.1.4, proof of Lemma 1.4 (PDF p. 191; draft p. 183): “it suﬃces to prove that R× maps onto K1(R). This will follow by induction on n once we show that GLn(R) = En(R)GLn−1(R).” — The reduction GL_n = E_n·GL_{n−1} is the stable-range reduction used here.
- `Bass.1964`, Proposition (5.1) a) (p. 18 of the article; PDF p. 15 of the numdam file): “In particular E(r, A) = SL(r, A).” — Bass's form for semi-local A.

### K₁ of a commutative local ring is its unit group

`U.3/SK1-local` · application

For a commutative local ring A (Mathlib's IsLocalRing A): SK₁(A) = ⊥ and K1.det : K₁(A) ≃* Aˣ; in particular K₁(O) = Oˣ for the valuation ring of a local field and K₁(𝔽_q[[t]]) = 𝔽_q[[t]]ˣ.

**Hypotheses.**

- A is a commutative local ring.

**Proof.**

1. Every maximal ideal of A is the maximal ideal (IsLocalRing.eq_maximalIdeal), so MaximalSpectrum A has one element and U.3/SK1-semilocal applies.

**Acceptance.**

- K₁(ℤ_p) ≃* ℤ_pˣ and K₁(𝔽_q[[t]]) ≃* 𝔽_q[[t]]ˣ.
- A field is local, recovering U.3/SK1-field.

**Depends on.** this roadmap: `U.3/SK1-semilocal`; libraries: `mathlib:IsLocalRing`, `mathlib:IsLocalRing.eq_maximalIdeal`, `mathlib:MaximalSpectrum`.

**Sources.**

- `Kbook.2013`, Exercise I.1.12(v) (PDF p. 15; draft p. 7): “Conclude that sr(R) = 1 for every local ring R.” — Stable range one for local rings.
- `Kbook.2013`, VI.7, opening paragraph (PDF p. 515; draft p. 507): “We saw in II. 2.2 and III. 1.4 that K0(V ) = K0(E) = Z and K1(V ) = V ×, K1(E) = E× ∼= (V ×)×Z” — The use for the valuation ring V of a local field E.

### Elementary reduction over a division ring

`U.3/division-ring-reduction` · lemma

For a division ring D and n ≥ 1, every g ∈ GL_n(D) is e·D(μ) with e ∈ E_n(D) and D(μ) = diag(1, …, 1, μ), μ ∈ Dˣ; only left multiplications by elementary matrices (row operations) are used. For fields this is contained in Mathlib's Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec; Mathlib's Dieudonné generation theorem LinearEquiv.mem_transvections_pow_mul_dilatransvections_of_not_isExceptional (division rings) does not give it, because it excludes the exceptional elements (LinearEquiv.IsExceptional) and its transvections of Dⁿ are GL_n(D)-conjugates of elementary matrices, not elementary matrices.

**Hypotheses.**

- D is a division ring; n ≥ 1; g ∈ GL_n(D).

**Proof.**

1. Induct on the columns (Dieudonné n° 2). Some entry of the first column is nonzero since g is invertible; if the (2, 1) entry is 0, a signed transposition w̄ (U.1/signed-transposition) or an operation e_2k(1) makes it nonzero.
2. Multiplying on the left by e_12(λ) with λ = (1 − g_11)g_21⁻¹ makes the (1, 1) entry 1; then e_k1(−g_k1) for k ≠ 1 clears the rest of the first column.
3. The remaining columns are treated the same way with pivots in rows of index ≥ j: some entry of column j in rows ≥ j is nonzero because the matrix stays invertible; for j < n, if the only such entry is in row j itself, adding row j to row j + 1 creates a second one, the pivot (j, j) is normalised to 1 with an operation e_jk(λ), k > j, and column j is then cleared in all other rows.
4. After n − 1 columns the matrix is diagonal with entries 1, …, 1, μ; so g = e·D(μ) with e a product of elementary matrices.
5. For n = 1, g = D(g) with e = 1.

**Acceptance.**

- For D = ℚ and g with rows (0, 1), (1, 0): g = e·diag(1, −1) with e ∈ E_2(ℚ) (g = w̄_12 · diag(−1, 1) and diag(−1, 1) = diag(−1, −1)·diag(1, −1)).
- For D = ℍ[ℝ] and g = diag(i, j): g = e·diag(1, μ) with φ(μ) = φ(i)φ(j) = φ(k) in ℍˣab (U.3/dieudonne-multiplicative).

**Depends on.** this roadmap: `U.1/elementary-subgroup`, `U.1/elementary-matrix`, `U.1/signed-transposition`; libraries: `mathlib:Matrix.Pivot.exists_list_transvec_mul_diagonal_mul_list_transvec`, `mathlib:LinearEquiv.mem_transvections_pow_mul_dilatransvections_of_not_isExceptional`, `mathlib:LinearEquiv.IsExceptional`, `mathlib:LinearEquiv.transvections`.

**Sources.**

- `Dieudonne.1943`, n° 2 (p. 30 of the article; PDF p. 5 of the numdam file): “on arrive finalement à une matrice diagonale (μij), avec μii = 1 pour 1 ≤ i ≤ n − 1, μnn = μ ≠ 0 quelconque; si l'on désigne par D(μ) cette dernière matrice, on a démontré la relation A = BD(μ), où B est une matrice appartenant au sous-groupe Cn engendré par les Bij(λ)” — The lemma: B ∈ C_n = E_n(K) and A = B·D(μ). Dieudonné's B_ij(λ) has λ in row j, column i, i.e. it is the node's e_ji(λ).
- `Dieudonne.1943`, n° 2 (p. 29 of the article; PDF p. 4 of the numdam file): “Nous commencerons par déterminer un système de générateurs du groupe Mn(K), suivant la méthode de Jordan, Burnside et Dickson qui s'étend presque textuellement du cas commutatif au cas non commutatif” — The row reduction is the classical one, valid over a skew field.
- `Kbook.2013`, III.1.2.4, Division rings 1.2.4 (PDF p. 189; draft p. 181): “The same linear algebra that we invoked for ﬁelds shows that if D is a division ring (a “skew ﬁeld”) then every invertible matrix may be reduced to a diagonal matrix diag(r, 1, ..., 1), and that En(D) is a normal subgroup of GLn(D).” — The K-book's statement, with the diagonal entry in the first position (conjugate by a signed permutation in E_n(D)).

### E_n(D) is normal in GL_n(D) for a division ring

`U.3/division-ring-elementary-normal` · lemma

For a division ring D and n ≥ 1, E_n(D) is a normal subgroup of GL_n(D): with D(μ) = diag(1, …, 1, μ), D(μ)e_ij(λ)D(μ)⁻¹ equals e_ij(λ) if i, j ≠ n, e_nj(μλ) if i = n, and e_in(λμ⁻¹) if j = n; since GL_n(D) = E_n(D)·{D(μ)}, conjugation preserves E_n(D). Every transvection of Dⁿ in Mathlib's sense (LinearEquiv.transvections) is a GL_n(D)-conjugate of e_21(1), so lies in E_n(D).

**Hypotheses.**

- D is a division ring; n ≥ 1.

**Proof.**

1. Left multiplication by D(μ) multiplies row n by μ and right multiplication by D(μ)⁻¹ multiplies column n by μ⁻¹; applied to λE_ij this gives the three formulas (Dieudonné n° 3, formulas (1), in his indexing).
2. For g = e·D(μ) (U.3/division-ring-reduction), g E_n(D) g⁻¹ = e (D(μ)E_n(D)D(μ)⁻¹) e⁻¹ ⊆ E_n(D).
3. Transvections: a transvection x ↦ x + f(x)v with f(v) = 0 has, in a basis beginning with v and continuing with a basis of ker f, the matrix of an elementary matrix (Dieudonné n° 4); so it is a conjugate of an elementary matrix.

**Acceptance.**

- For D = ℚ this is the normality of E_n(ℚ) = SL_n(ℚ).
- For n = 2 and D = ℍ[ℝ]: D(i)e_21(j)D(i)⁻¹ = e_21(ij) = e_21(k).

**Depends on.** this roadmap: `U.3/division-ring-reduction`, `U.1/elementary-subgroup`, `U.1/elementary-matrix`; libraries: `mathlib:LinearEquiv.transvections`, `mathlib:Subgroup.Normal`.

**Sources.**

- `Dieudonne.1943`, n° 3 (p. 30 of the article; PDF p. 5 of the numdam file): “En premier lieu, c'est un sous-groupe distingué; pour voir que ABij(λ)A⁻¹ appartient à Cn pour toute matrice A de Mn, il suffit évidemment, d'après la forme qu'on vient de donner aux matrices de Mn, de considérer le cas où A = D(μ)” — The lemma and the reduction to A = D(μ); the formulas (1) follow in the source.
- `Kbook.2013`, III.1.2.4, Division rings 1.2.4 (PDF p. 189; draft p. 181): “and that En(D) is a normal subgroup of GLn(D). Thus each GLn(D)/En(D) is a quotient group of the nonabelian group D×.” — The K-book's statement.

### The Dieudonné determinant

`U.3/dieudonne-determinant` · construction · planet “Dieudonné determinant”

For a division ring D and n ≥ 1 define Δ_n : GL_n(D) → Dˣab = Abelianization Dˣ (the source's K*/C with C = [Dˣ, Dˣ]; φ : Dˣ → Dˣab the quotient map) by recursion on n (Dieudonné n° 6): Δ_1(x) = φ(x); for n ≥ 2 and X = (ξ_ij), let i be the least index with ξ_i1 ≠ 0; subtract left multiples of row i from the other rows so that the first column becomes ξ_i1·e_i (row_k ← row_k − ξ_k1 ξ_i1⁻¹ row_i); let X′ ∈ GL_{n−1}(D) be the matrix of the rows of index ≠ i of the result, with the first column deleted (invertible because the transformed matrix is); put Δ_n(X) = φ((−1)^{i+1} ξ_i1)·Δ_{n−1}(X′). The least nonzero pivot makes the definition unconditional; independence of the pivot and the other properties are U.3/dieudonne-expansion-properties, multiplicativity is U.3/dieudonne-multiplicative. For a field F, Abelianization.equivOfComm identifies Fˣab with Fˣ and Δ_n with Matrix.GeneralLinearGroup.det.

**Hypotheses.**

- D is a division ring; n ≥ 1.

**Proof.**

1. Well-foundedness: the recursion decreases n; the pivot exists because an invertible matrix has a nonzero entry in its first column.
2. X′ is invertible: the transformed matrix Y = e·X (e a product of elementary matrices) is invertible with first column ξ_i1·e_i; expanding, Y is a permutation-conjugate of [[ξ_i1, *], [0, X′]], which is invertible only if X′ is.
3. Field compatibility: for commutative D the recursion is the expansion of the determinant along the first column after row operations, which do not change the determinant; so Δ_n = det under Fˣab ≅ Fˣ (Dieudonné n° 7).

**API.**

- `dieudonneDet` (constructor): dieudonneDet : GL (Fin n) D → Abelianization Dˣ by the recursion above (a MonoidHom by U.3/dieudonne-multiplicative).
- `dieudonneDet_one_dim` (simp): dieudonneDet (u : GL (Fin 1) D) = Abelianization.of u.
- `dieudonneDet_expansion` (characterisation): For every pivot i with ξ_i1 ≠ 0, dieudonneDet X = of((−1)^{i+1} ξ_i1) * dieudonneDet X′ (U.3/dieudonne-expansion-properties).
- `dieudonneDet_elementary_mul` (simp): dieudonneDet (elementary h λ * X) = dieudonneDet X.
- `dieudonneDet_diag` (simp): dieudonneDet (diag(1, …, 1, μ)) = Abelianization.of μ.
- `dieudonneDet_updateRow_smul` (relation): Multiplying a row of X on the left by μ ≠ 0 multiplies dieudonneDet X by of μ.
- `dieudonneDet_swap_rows` (relation): Exchanging two rows multiplies dieudonneDet X by of (−1).
- `dieudonneDet_stabilise` (compatibility): dieudonneDet (stabilise h X) = dieudonneDet X (U.3/dieudonne-block-triangular).
- `dieudonneDet_field` (compatibility): For a field F, Abelianization.equivOfComm (dieudonneDet X) = Matrix.GeneralLinearGroup.det X.
- `dieudonneDet_quaternion_norm` (example): For D = ℍ[ℝ], the norm Quaternion.normSq induces ℍˣab ≅ ℝ_{>0} (every quaternion of norm 1 is a commutator), and dieudonneDet composed with it is a positive real 'determinant'.

**Unit tests.**

- `dieudonneDet_rat_two` (computation): For D = ℚ, dieudonneDet of the matrix with rows (1, 2), (3, 4) is of (−2).
- `dieudonneDet_swap` (computation): For any D, dieudonneDet of the matrix with rows (0, 1), (1, 0) is of (−1); for D = ℚ this is nontrivial.
- `dieudonneDet_quaternion_swap` (non-example): For D = ℍ[ℝ], of (−1) = 1 since −1 = i j i⁻¹ j⁻¹, so the swap matrix has trivial Dieudonné determinant, while the ordinary determinant of the swap over any field is −1: signs are not detected over ℍ.
- `dieudonneDet_one_by_one` (degenerate): For n = 1, dieudonneDet is Abelianization.of : Dˣ → Dˣab.
- `dieudonneDet_eq_det_field` (compatibility): For D = ZMod 5 and X : GL (Fin 3) (ZMod 5), Abelianization.equivOfComm (dieudonneDet X) = Matrix.GeneralLinearGroup.det X.

**Acceptance.**

- Δ_2 of the matrix with rows (1, 2), (3, 4) over ℚ is φ(−2) = det (pivot ξ_11 = 1, X′ = (4 − 3·2) = (−2)).
- Δ_2 of the swap matrix is φ(−1): the least pivot is ξ_21 = 1, with sign (−1)^{2+1}, and X′ = (1).

**Used by.**

- Dieudonné 1943, Théorème 1: GL_n(K)/C_n ≅ K*/C for every n > 1
- K-book III.1.2.4 and Example III.1.3.5: K₁(D) ≅ D×/[D×, D×]
- KTheoryLowDegrees:U.3/K1-division-ring: the stable Dieudonné determinant is the isomorphism K₁(D) ≅ Dˣab
- K-book Ex. III.1.2: the determinant of a semilocal ring with values in R×/W(R) generalises this construction
- KTheoryLowDegrees:U.5 (transfer for division algebras, K-book Example III.1.7.2): the transfer K₁(D) → K₁(F) is computed through determinants

**Depends on.** this roadmap: `U.1/elementary-matrix`; libraries: `mathlib:Abelianization`, `mathlib:Abelianization.of`, `mathlib:Abelianization.equivOfComm`, `mathlib:Matrix.GeneralLinearGroup.det`, `mathlib:Matrix.GeneralLinearGroup`.

**Sources.**

- `Dieudonne.1943`, n° 6, definition of Δn (p. 33 of the article; PDF p. 8 of the numdam file): “Soit donc X = (ξij) une matrice quelconque de Mn(K); étant donné un élément non nul ξi1 de la première colonne (un tel élément existe nécessairement, X étant inversible), retranchons des lignes d'indice ≠ i de X des multiples convenables (à gauche) de la ligne d'indice i” — The first half of the recursive definition.
- `Dieudonne.1943`, n° 6, definition of Δn (p. 33 of the article; PDF p. 8 of the numdam file): “si alors X′ est la matrice d'ordre n − 1 formée des lignes d'indice ≠ i de X1, X′ est une matrice régulière; nous poserons Δn(X) = φ[(−1)^{i+1}ξi1]Δn−1(X′).” — The second half; X1 is the matrix after the row operations, and the first column of X1 is dropped in forming X′.
- `Dieudonne.1943`, n° 7 (p. 35 of the article; PDF p. 10 of the numdam file): “Lorsque K est commutatif, le groupe C est réduit à l'élément unité de K, et l'on peut identifier le groupe quotient K*/C à K* lui-même; Δn(X) n'est autre alors que le déterminant de X au sens ordinaire” — Compatibility with the determinant for fields.
- `Kbook.2013`, III.1.2.4, Division rings 1.2.4 (PDF p. 189; draft p. 181): “Dieudonn´e proved in 1943 that in fact GLn(D)/En(D) = D×/[D×, D×] for all n > 1 (except for n = 2 when D = F2).” — The K-book's summary of Dieudonné's theorem; the parenthetical exception concerns the commutator subgroup, not this quotient (sourceIssues).

### Dieudonné's expansion properties

`U.3/dieudonne-expansion-properties` · lemma

For a division ring D and n ≥ 1, simultaneously: (1°) the value of the recursion defining Δ_n(X) does not depend on the choice of the pivot ξ_i1 ≠ 0 of the first column; (2°) Δ_n(e·X) = Δ_n(X) for every elementary matrix e; (3°) multiplying a row of X on the left by μ ≠ 0 multiplies Δ_n(X) by φ(μ).

**Hypotheses.**

- D is a division ring; n ≥ 1; X ∈ GL_n(D).

**Proof.**

1. Induct on n; for n = 1, (1°) and (2°) are vacuous and (3°) is φ(μx) = φ(μ)φ(x).
2. (1°) For two pivots ξ_i1, ξ_j1 ≠ 0 (Dieudonné writes the case n = 3, i = 1, j = 2), the matrix X″ obtained from pivot j is obtained from X′ (pivot i) by subtracting a left multiple of one row from another and multiplying a row by −ξ_i1 ξ_j1⁻¹; by (2°) and (3°) in rank n − 1, Δ_{n−1}(X″) = φ(−ξ_i1 ξ_j1⁻¹)Δ_{n−1}(X′), and φ(−ξ_i1ξ_j1⁻¹) = φ(ξ_i1)φ(−ξ_j1)⁻¹ in the commutative group Dˣab, with the signs (−1)^{i+1}, (−1)^{j+1} accounting for the rest.
3. (2°) Adding a left multiple of the pivot row to another row does not change X′; adding a multiple of a row k ≠ i to a row l ≠ i performs the same operation on X′ (use (2°) in rank n − 1); adding a multiple of another row to the pivot row: if that row has first entry 0 nothing changes, otherwise compute with that row as pivot, using (1°).
4. (3°) Multiplying the pivot row by μ replaces ξ_i1 by μξ_i1 and leaves X′ unchanged; multiplying another row by μ multiplies a row of X′ by μ (use (3°) in rank n − 1).

**Acceptance.**

- For D = ℚ and n = 2, pivots 1 and 3 in the matrix with rows (1, 2), (3, 4) both give φ(−2) (recomputed: pivot 3 gives φ((−1)^{3}·3)·φ(2 − 1·3⁻¹·4) = φ(−3)·φ(2/3) = φ(−2)).
- Exchanging two rows multiplies Δ by φ(−1) (a signed transposition in E_n(D) followed by (3°) with μ = −1).

**Depends on.** this roadmap: `U.3/dieudonne-determinant`, `U.1/elementary-matrix`; libraries: `mathlib:Abelianization.of`.

**Sources.**

- `Dieudonne.1943`, n° 6 (p. 33 of the article; PDF p. 8 of the numdam file): “1° la définition de Δn(X) est indépendante du choix de l'élément ξi1 ≠ 0 de la première colonne de X (lorsqu'il existe plus d'un élément ayant cette propriété).” — Property 1°.
- `Dieudonne.1943`, n° 6 (p. 33 of the article; PDF p. 8 of the numdam file): “2° Δn(X) ne change pas si l'on multiplie à gauche X par une matrice Bij(λ); 3° si l'on multiplie (à gauche) une ligne de X par un élément μ ≠ 0 de K, Δn(X) est multiplié par φ(μ).” — Properties 2° and 3°, proved with 1° by induction on n (the source writes out n = 3 and says the argument is general).

### The Dieudonné determinant is a surjective homomorphism

`U.3/dieudonne-multiplicative` · theorem

For a division ring D and n ≥ 1, Δ_n : GL_n(D) →* Dˣab is a surjective group homomorphism with Δ_n(e) = 1 for e ∈ E_n(D) and Δ_n(D(μ)) = φ(μ).

**Hypotheses.**

- D is a division ring; n ≥ 1.

**Proof.**

1. Δ_n(D(μ)) = φ(μ): the least pivot of D(μ) is ξ_11 = 1 (for n ≥ 2), X′ = D_{n−1}(μ), and induct.
2. By (2°) Δ_n(e·X) = Δ_n(X), so Δ_n(e) = Δ_n(1) = 1 for e ∈ E_n(D) and Δ_n(e·D(μ)) = φ(μ).
3. Multiplicativity (Dieudonné n° 6): write X = B·D(λ), Y = B′·D(μ) (U.3/division-ring-reduction); normality (U.3/division-ring-elementary-normal) gives D(λ)B′ = B″D(λ) with B″ ∈ E_n(D); then XY = BB″·D(λμ), so Δ_n(XY) = φ(λμ) = φ(λ)φ(μ) = Δ_n(X)Δ_n(Y).
4. Surjective because μ ranges over Dˣ.

**Acceptance.**

- Δ_2(diag(i, j)) = φ(ij) = φ(k) over ℍ[ℝ].
- Δ_n(XY) = Δ_n(YX) since the target is commutative.

**Depends on.** this roadmap: `U.3/dieudonne-determinant`, `U.3/dieudonne-expansion-properties`, `U.3/division-ring-reduction`, `U.3/division-ring-elementary-normal`; libraries: `mathlib:Abelianization.of`.

**Sources.**

- `Dieudonne.1943`, n° 6, end of the proof of Théorème 1 (p. 35 of the article; PDF p. 10 of the numdam file): “Δn est bien une représentation de Mn(K) dans K*/C; elle applique Mn(K) sur K*/C, puisque μ peut prendre toutes les valeurs ≠ 0 dans K” — The theorem.
- `Dieudonne.1943`, n° 6 (p. 35 of the article; PDF p. 10 of the numdam file): “En effet, si la matrice X est mise sous la forme BD(μ), où B ∈ Cn (n° 2), on a Δn(X) = Δn[D(μ)] d'après la propriété 2°; mais le calcul de Δn[D(μ)] est immédiat et donne φ(μ).” — The computation of Δ_n on the normal form.

### Dieudonné's theorem: GL_n(D)/E_n(D) ≅ Dˣab

`U.3/dieudonne-kernel` · theorem

For a division ring D and every n ≥ 2, ker Δ_n = E_n(D), so Δ_n induces GL_n(D)/E_n(D) ≃* Dˣab. This holds for all n ≥ 2 without exception (also for D = 𝔽_2, where both sides are trivial). For n = 1, ker Δ_1 = [Dˣ, Dˣ], which differs from E_1(D) = 1 whenever Dˣ is not commutative.

**Hypotheses.**

- D is a division ring; n ≥ 2.

**Proof.**

1. E_n(D) ≤ ker Δ_n by U.3/dieudonne-multiplicative.
2. Conversely let Δ_n(X) = 1 and write X = B·D(μ) (U.3/division-ring-reduction); then φ(μ) = 1, i.e. μ ∈ [Dˣ, Dˣ].
3. D(μ) ∈ E_n(D) for μ ∈ [Dˣ, Dˣ]: for x, y ∈ Dˣ, diag(⁅x, y⁆, 1) ∈ E_2(D) by U.1/commutator-in-elementary with n = 1 (the identity ⁅x, y⁆ ⊕ 1 = (x ⊕ x⁻¹)(y ⊕ y⁻¹)((yx)⁻¹ ⊕ yx)); x ↦ diag(x, 1) is a homomorphism, so diag(c, 1) ∈ E_2(D) for every c in the commutator subgroup; stabilise and conjugate by a signed transposition in E_n(D) (U.1/signed-transposition) to move c to the last diagonal position.
4. Hence X ∈ E_n(D), and QuotientGroup.quotientKerEquivOfSurjective gives the isomorphism.

**Acceptance.**

- For D = 𝔽_2 and n = 2: GL_2(𝔽_2) = E_2(𝔽_2) and 𝔽_2ˣab = 1, so the theorem holds although ⁅GL_2(𝔽_2), GL_2(𝔽_2)⁆ ≠ E_2(𝔽_2).
- For D = ℍ[ℝ]: GL_n(ℍ)/E_n(ℍ) ≅ ℍˣab ≅ ℝ_{>0} (through the norm).

**Depends on.** this roadmap: `U.3/dieudonne-multiplicative`, `U.3/division-ring-reduction`, `U.1/commutator-in-elementary`, `U.1/signed-transposition`, `U.1/elementary-subgroup`; libraries: `mathlib:QuotientGroup.quotientKerEquivOfSurjective`, `mathlib:commutator`.

**Sources.**

- `Dieudonne.1943`, n° 6, Théorème 1 (p. 32 of the article; PDF p. 7 of the numdam file): “THÉORÈME 1. — Le groupe quotient Mn(K)/Cn est isomorphe au groupe K*/C quel que soit n > 1.” — The theorem, with no exception.
- `Dieudonne.1943`, n° 6, end of the proof (p. 35 of the article; PDF p. 10 of the numdam file): “enfin, Δn(X) ne peut être l'élément neutre que si μ est un élément du groupe des commutateurs C de K*; mais dans ce cas, on a vu (n° 5) que D(μ) appartient au groupe Cn, donc aussi X.” — The kernel argument.
- `Kbook.2013`, III.1.2.4, Division rings 1.2.4 (PDF p. 189; draft p. 181): “Dieudonn´e proved in 1943 that in fact GLn(D)/En(D) = D×/[D×, D×] for all n > 1 (except for n = 2 when D = F2). In particular, K1(D) = GLn(D)/En(D) for all n ≥3.” — The K-book's version, whose exception is misplaced (sourceIssues).

### The Dieudonné determinant of a block triangular matrix

`U.3/dieudonne-block-triangular` · lemma

For a division ring D, X ∈ GL_p(D), Z ∈ GL_q(D) and any p × q matrix Y: Δ_{p+q}([[X, Y], [0, Z]]) = Δ_p(X)·Δ_q(Z). In particular Δ_{n+1}(X ⊕ 1) = Δ_n(X), so the Δ_n define a stable Dieudonné determinant Δ : GL(D) →* Dˣab; and if [[X, Y], [W, T]] is invertible with X invertible then Δ([[X, Y], [W, T]]) = Δ_p(X)·Δ_q(T − W X⁻¹ Y).

**Hypotheses.**

- D is a division ring; X ∈ GL_p(D), Z ∈ GL_q(D).

**Proof.**

1. [[X, Y], [0, Z]] = (X ⊕ Z)·[[1, X⁻¹Y], [0, 1]] and the second factor lies in E_{p+q}(D) (U.1/block-unitriangular-elementary), so its Δ is 1.
2. X ⊕ Z = (X ⊕ 1)(1 ⊕ Z). Write X = B·D_p(λ) (U.3/division-ring-reduction): X ⊕ 1 = (B ⊕ 1)(D_p(λ) ⊕ 1) and D_p(λ) ⊕ 1 = diag(1, …, λ, …, 1) (λ at position p) is conjugate to D_{p+q}(λ) by a signed transposition in E_{p+q}(D), so Δ(X ⊕ 1) = φ(λ) = Δ_p(X); similarly Δ(1 ⊕ Z) = Δ_q(Z).
3. Schur complement: [[1, 0], [−WX⁻¹, 1]]·[[X, Y], [W, T]] = [[X, Y], [0, T − WX⁻¹Y]] and the first factor lies in E(D).
4. Stabilisation compatibility makes (Δ_n) a compatible family, hence Δ = StableGL.lift (Δ_n) (U.1/stable-general-linear-group).

**Acceptance.**

- Δ_3(X ⊕ 1) = Δ_2(X) for X with rows (1, 2), (3, 4) over ℚ: both φ(−2).
- Δ of an upper triangular matrix with diagonal μ_1, …, μ_n is φ(μ_1⋯μ_n).

**Depends on.** this roadmap: `U.3/dieudonne-multiplicative`, `U.3/division-ring-reduction`, `U.1/block-unitriangular-elementary`, `U.1/signed-transposition`, `U.1/stable-general-linear-group`, `U.1/block-sum`.

**Sources.**

- `Dieudonne.1943`, n° 7 (p. 37 of the article; PDF p. 12 of the numdam file): “si une matrice d'ordre n est de la forme (X Y; 0 Z) où X est une matrice carrée d'ordre p, Z une matrice carrée d'ordre n − p, son déterminant est égal à Δp(X)Δn−p(Z)” — The lemma (the block matrix is transcribed linearly).
- `Dieudonne.1943`, n° 7 (p. 37 of the article; PDF p. 12 of the numdam file): “en prenant les déterminants, on a donc Δn(X Y; Z T) = Δp(X)Δn−p(T − ZX⁻¹Y).” — The Schur-complement form.

### The commutator subgroup of GL_n over a division ring

`U.3/dieudonne-commutator-subgroup` · theorem

For a division ring D and n ≥ 2, ⁅GL_n(D), GL_n(D)⁆ = E_n(D), except when n = 2 and D = 𝔽_2, where ⁅GL_2(𝔽_2), GL_2(𝔽_2)⁆ has index 2 in E_2(𝔽_2) = GL_2(𝔽_2).

**Hypotheses.**

- D is a division ring; n ≥ 2; (n, D) ≠ (2, 𝔽_2) for the equality.

**Proof.**

1. ⁅GL_n(D), GL_n(D)⁆ ≤ E_n(D): GL_n(D)/E_n(D) ≅ Dˣab is commutative (U.3/dieudonne-kernel).
2. n ≥ 3: E_n(D) is perfect (U.1/elementary-perfect), hence contained in the commutator subgroup.
3. n = 2 and D ≠ 𝔽_2: pick u ∈ Dˣ with u ≠ 1; then ⁅diag(u, 1), e_12(b)⁆ = e_12(ub)e_12(−b) = e_12((u − 1)b), and b = (u − 1)⁻¹q gives e_12(q); likewise ⁅diag(1, u), e_21(b)⁆ = e_21((u − 1)b). This is Bass's Lemma 1.6 with v = 1 − u (in a division ring 1 − u is a unit).
4. The exception is U.1/rank-two-failure (a).

**Acceptance.**

- For D = 𝔽_3 and n = 2, ⁅GL_2(𝔽_3), GL_2(𝔽_3)⁆ = SL_2(𝔽_3) (recomputed: order 24) = E_2(𝔽_3).
- For D = 𝔽_2 and n = 2 the commutator subgroup has order 3 in a group of order 6.

**Depends on.** this roadmap: `U.3/dieudonne-kernel`, `U.1/elementary-perfect`, `U.1/rank-two-failure`, `U.1/elementary-matrix`; libraries: `mathlib:commutator`.

**Sources.**

- `Dieudonne.1943`, n° 5 (p. 32 of the article; PDF p. 7 of the numdam file): “sauf dans le cas où n = 2 et où K est le corps à deux éléments, Cn est le groupe des commutateurs de Mn(K).” — The theorem.
- `Dieudonne.1943`, n° 5 (p. 32 of the article; PDF p. 7 of the numdam file): “Reste le cas où, K étant le corps à deux éléments, on a n = 2 : ce cas est effectivement un cas d'exception, car Mn(K) = Cn est alors un groupe résoluble, donc distinct de son groupe des commutateurs” — The exception.
- `Bass.1964`, Lemme (1.6) (p. 9 of the article; PDF p. 6 of the numdam file): “Lemme (1.6). — Suppose 1 = u+v with u and v units in A. Then E(2, A, q) ⊂ [GL(2, A), E(2, A, q)].” — The rank-two argument for any ring in which 1 is a sum of two units.

### K₁ of a division ring

`U.3/K1-division-ring` · theorem · planet “K₁ of a division ring”

For a division ring D, the stable Dieudonné determinant induces K₁(D) ≃* Dˣab, with inverse induced by K1.ofUnits : Dˣ → K₁(D) (which kills [Dˣ, Dˣ]); for every n ≥ 2 the map GL_n(D)/E_n(D) → K₁(D) is an isomorphism. For D a field this is K1.det : K₁(F) ≃* Fˣ composed with Abelianization.equivOfComm (U.3/SK1-field).

**Hypotheses.**

- D is a division ring.

**Proof.**

1. Δ : GL(D) → Dˣab (U.3/dieudonne-block-triangular) kills E(D) (U.3/dieudonne-multiplicative), so it induces Δ̄ : K₁(D) → Dˣab (K1.lift).
2. Δ̄(K1.ofUnits x) = φ(x), so Δ̄ is surjective and ofUnits induces ψ : Dˣab → K₁(D) (Abelianization.lift) with Δ̄ ∘ ψ = id.
3. Δ̄ is injective: a class [X] with X ∈ GL_n(D), n ≥ 2, and Δ_n(X) = 1 has X ∈ E_n(D) (U.3/dieudonne-kernel), so [X] = 1.
4. The same argument in fixed rank n ≥ 2 shows GL_n(D)/E_n(D) → K₁(D) is an isomorphism (surjective by U.3/division-ring-reduction, injective by U.3/dieudonne-kernel).

**Acceptance.**

- K₁(ℍ[ℝ]) ≃* ℍˣab ≅ ℝ_{>0}.
- K₁(F) ≃* Fˣ for a field F, agreeing with U.3/SK1-field.
- K₁(D) = GL_2(D)/E_2(D) also for D = 𝔽_2.

**Depends on.** this roadmap: `U.3/dieudonne-block-triangular`, `U.3/dieudonne-multiplicative`, `U.3/dieudonne-kernel`, `U.3/division-ring-reduction`, `U.3/units-to-K1`, `U.2/K1`; libraries: `mathlib:Abelianization.lift`, `mathlib:Abelianization.equivOfComm`.

**Sources.**

- `Kbook.2013`, III.1.3.5, Example 1.3.5 (PDF p. 191; draft p. 183): “To get a feeling for the non-commutative situation, suppose that D is a division ring. Diedonn´e’s calculation of GLn(D)/En(D) (described in 1.2.4 and Ex. 1.2) gives an isomorphism K1(D) ∼= D×/[D×, D×].” — The theorem (the source misspells Dieudonné here).
- `Dieudonne.1943`, Introduction (p. 28 of the article; PDF p. 3 of the numdam file): “Cela conduit à déterminer le groupe des commutateurs Cn de Mn(K), et l'on constate alors que le groupe quotient Mn(K)/Cn est indépendant de n” — The independence of n, which is the stability used here.

### There is no determinant with values in Dˣ

`U.3/no-units-valued-determinant` · theorem

Let D be a division ring in which 2 ≠ 0 and whose multiplicative group is not commutative (for example Hamilton's quaternions ℍ[ℝ]). There is no group homomorphism f : GL_2(D) → Dˣ with f(diag(x, 1)) = x for all x ∈ Dˣ. So the Dieudonné determinant must take values in Dˣab: a 'commutative determinant' with values in Dˣ does not exist.

**Hypotheses.**

- D is a division ring with 2 ≠ 0 and Dˣ not commutative.

**Proof.**

1. Let c = f(e_12(1)). Since 2 is central, e_12(2) = diag(2, 1)e_12(1)diag(2, 1)⁻¹, so f(e_12(2)) = 2c2⁻¹ = c; and e_12(2) = e_12(1)², so c² = c and c = 1. Then f(e_12(λ)) = λcλ⁻¹ = 1 for all λ, as e_12(λ) = diag(λ, 1)e_12(1)diag(λ, 1)⁻¹.
2. Similarly, with c′ = f(e_21(1)), e_21(λ) = diag(λ⁻¹, 1)e_21(1)diag(λ, 1) gives f(e_21(λ)) = λ⁻¹c′λ, and e_21(2) = e_21(1)² gives c′ = 1. So f kills E_2(D).
3. For x, y ∈ Dˣ, diag(xyx⁻¹y⁻¹, 1) ∈ E_2(D) (U.1/commutator-in-elementary with n = 1), so xyx⁻¹y⁻¹ = f(diag(xyx⁻¹y⁻¹, 1)) = 1 for all x, y, contradicting non-commutativity.

**Acceptance.**

- For ℍ[ℝ] with x = i, y = j: diag(−1, 1) ∈ E_2(ℍ[ℝ]), but f(diag(−1, 1)) = −1 ≠ 1.
- For a field such an f exists: the determinant.

**Depends on.** this roadmap: `U.1/commutator-in-elementary`, `U.1/elementary-matrix`, `U.1/elementary-subgroup`; libraries: `mathlib:Quaternion`.

**Sources.**

- `Kbook.2013`, III.1.2.4, Division rings 1.2.4 (PDF p. 189; draft p. 181): “Thus each GLn(D)/En(D) is a quotient group of the nonabelian group D×.” — The target of a determinant on GL_n(D) is a quotient of Dˣ by at least its commutator subgroup.
- `Dieudonne.1943`, Introduction (p. 27 of the article; PDF p. 2 of the numdam file): “Toutefois, il est une partie de la théorie où la commutativité du corps semble jouer un rôle essentiel : c'est la théorie des déterminants.” — The problem the Dieudonné determinant solves.

### SK₁ of the real circle ring is nonzero

`U.3/SK1-real-circle-nonzero` · theorem

For A = ℝ[x, y]/(x² + y² − 1) (a commutative ring, in fact a Dedekind domain), the class of the matrix with rows (x, −y), (y, x) over ℝ[x, y]/(x² + y² − 1) is a nontrivial element of SK₁(A). Hence SK₁(A) ≠ ⊥ and K₁(A) ≠ Aˣ: 'K₁(A) = Aˣ' is not a simplification rule for commutative rings, not even for Dedekind domains. (The source adds SK₁(A) ≅ ℤ/2, by Mennicke symbols; that is not claimed here.)

**Hypotheses.**

- A = MvPolynomial (Fin 2) ℝ ⧸ (X₀² + X₁² − 1).

**Proof.**

1. The matrix M with rows (x, −y), (y, x) has determinant x² + y² = 1, so [M] ∈ SK₁(A).
2. A embeds in the Banach algebra C(S¹, ℝ) by x ↦ cos θ, y ↦ sin θ, and K1.map sends [M] to the class of the rotation loop θ ↦ [[cos θ, −sin θ], [sin θ, cos θ]].
3. For a commutative Banach algebra R, E_n(R) is the path component of 1 in SL_n(R) (K-book Proposition III.1.5), so SK₁(R) ≅ π₀ SL(R); for R = C(S¹, ℝ) this is [S¹, SO] = π₁(SO) ≅ ℤ/2 (Example III.1.5.3).
4. The rotation loop generates π₁(SO_2) ≅ ℤ, which maps onto π₁(SO) ≅ ℤ/2, so its class is nonzero, and therefore [M] ≠ 1 (Example III.1.5.4).
5. The inputs of the last two steps (path components of E_n(R) in SL_n(R), π₁(SO_2) ≅ ℤ, π₁(SO_n) ≅ ℤ/2 for n ≥ 3 and the surjection π₁(SO_2) → π₁(SO)) are absent from the libraries; they are recorded as a gap.

**Acceptance.**

- det M = 1 is a direct computation in A.
- The class is nontrivial; its square is trivial (not claimed).

**Depends on.** this roadmap: `U.3/special-K1`, `U.2/K1-map`; libraries: `mathlib:MvPolynomial`, `mathlib:ContinuousMap`, `mathlib:Real.cos`.

**Sources.**

- `Kbook.2013`, III.1.5.4, Example 1.5.4 (PDF p. 193; draft p. 185): “The ring R = R[x, y]/(x2 + y2 −1) may be embedded in the ring RS1 by x 7→cos(θ), y 7→sin(θ). Since the matrix x −y y x maps to A, it represents a nontrivial element of SK1(R).” — The theorem and the embedding into continuous functions on the circle.
- `Kbook.2013`, III.1.5.4, Example 1.5.4 (PDF p. 193; draft p. 185): “When X is the circle S1 we have SK1(RS1) = [S1, SO] = π1SO = Z/2.” — The topological computation used.
- `Kbook.2013`, III.1.5, Proposition 1.5 (PDF p. 192; draft p. 184): “Proposition 1.5. En(R) is the path component of the identity matrix in the special linear group SLn(R), n ≥2. Hence we may identify the group SK1(R) with the group π0SL(R) of path components of the topological space SL(R).” — The Banach-algebra input.

## U.4 — S-integers and the arithmetic theorem

*Coverage: partial.* S is a finite set of finite places and O_{F,S} = Set.integer S F, as in ArithmeticKTheory N.1 and K2SymbolsBrauer T.5; the rank is r₁ + r₂ + |S| − 1. Targets: SK₁(O_{F,S}) = 0 (U.4/bass-milnor-serre), decomposed as BMS do — stable range of Dedekind domains (U.4/dedekind-stable-range-two, with U.3's stable-range definition and surjective stability), Mennicke symbols and the universal Mennicke group (U.4/mennicke-symbol, universal-mennicke-group, Lemmas 2.1–2.9, the SK₁ symbol of Mennicke's theorem and its surjectivity), and the arithmetic of BMS §3 and the appendix ((A.7), (A.8), (A.10), (A.11), Theorems 3.2, 3.5, 3.6); class-field-theory inputs are requested from Tau Ceti ClassFieldTheory, Chebotarev and GlobalNumberFields with their stated forms; K₁(O_{F,S}) ≅ O_{F,S}^× canonically (K1-S-integers-determinant); Dirichlet's S-unit theorem and fundamental S-units (s-unit-theorem, fundamental-s-units, K1-S-integers-structure); the unit inclusion into K₁(F) and the residue-field and local-ring specialisations. The non-example 'an arbitrary Dedekind-domain SK₁ vanishing theorem is not an acceptable substitute' is U.3/SK1-real-circle-nonzero (K-book III.1.5.4), cited rather than duplicated. BMS Theorem 4.1(c) (universality of the SK₁ symbol, Kubota's theorem, §§ 8–10) and the full determination C_q ≅ μ_{r(q)} for totally imaginary A are not on the path to SK₁(O_{F,S}) = 0 and are not planned.

- Remaining: Import the tame formula (A.16), the degree-m product formula (A.19) and the reciprocity law (A.21) once the CA.1 → K2SymbolsBrauer:T.7 cycle is removed (gap; restructure).
- Remaining: Source and plan BMS (A.17)–(A.18) (Serre, Corps locaux XIV) for the totally imaginary case (gap).
- Remaining: Receive the requested Tau Ceti inputs: ClassFieldTheory Layers 5, 12, 13; Chebotarev Layers 4, 10; GlobalNumberFields Layers 6, 7.

### A Dedekind domain has stable range at most two

`U.4/dedekind-stable-range-two` · theorem

Every Dedekind domain A (Mathlib's IsDedekindDomain; fields included) satisfies HasStableRange A 2 of U.3/stable-range (every unimodular column of length at least 3 can be shortened by adding multiples of its last entry): if m ≥ 3 and a₁A + ⋯ + a_mA = A, there are t₁, …, t_{m−1} ∈ A with (a₁ + t₁a_m, …, a_{m−1} + t_{m−1}a_m) unimodular. The proof uses only that A/bA has finitely many maximal ideals for every nonzero b ∈ A. In particular every ring of S-integers O_{F,S} satisfies it (a Dedekind domain by Tau Ceti's instance on Set.integer).

**Hypotheses.**

- A is a Dedekind domain: its nonzero primes are maximal and a nonzero ideal lies in finitely many of them.
- Bass's general bound sr(R) ≤ d + 1 for noetherian rings of dimension d (quoted in K-book Ex. I.1.5, and BMS Theorem 7.4 via Bass [1, Theorem 11.1]) is not used; its proof is not in the sources read. The case d = 1 is proved directly.

**Proof.**

1. If a₁ = ⋯ = a_{m−1} = 0 then a_m is a unit: take t₁ = a_m⁻¹ and t_i = 0 for i ≥ 2, so the first entry becomes 1.
2. Otherwise renumber the first m − 1 coordinates (the condition is symmetric in them) so that a₁ ≠ 0. If a₁ is a unit take all t_i = 0. If not, the maximal ideals 𝔪₁, …, 𝔪_r containing a₁ are finite in number and distinct (Ideal.finite_factors for the nonzero ideal a₁A).
3. For each k: if some a_j ∉ 𝔪_k with 3 ≤ j ≤ m − 1, set τ_k = 0. Otherwise a₂ ∉ 𝔪_k or a_m ∉ 𝔪_k, because the row is unimodular and a₁ ∈ 𝔪_k; set τ_k = 0 if a₂ ∉ 𝔪_k and τ_k = 1 if a₂ ∈ 𝔪_k (then a_m ∉ 𝔪_k, so a₂ + a_m ∉ 𝔪_k).
4. By the Chinese remainder theorem (IsDedekindDomain.exists_forall_sub_mem_ideal) choose t₂ ∈ A with t₂ − τ_k ∈ 𝔪_k for all k, and put t_i = 0 for i ≠ 2. This is BMS's remark before Lemma 2.2: in the semilocal ring A/a₁A one finds t with a₂ + t a_m prime to the remaining entries.
5. No maximal ideal contains a₁, a₂ + t₂a_m, a₃, …, a_{m−1}: one not containing a₁ is avoided by a₁, and one containing a₁ is some 𝔪_k, avoided by the choice of τ_k. So the shortened row is unimodular; m ≥ 3 is used because the index 2 must differ from 1 and from m.

**Acceptance.**

- A = ℤ, row (6, 10, 15): 6 lies in (2) and (3); at (2), 10 ∈ (2) so τ = 1; at (3), 10 ∉ (3) so τ = 0; t₂ = 3 gives the shortened row (6, 10 + 3·15) = (6, 55), and gcd(6, 55) = 1.
- A field: every unimodular row of length at least three shortens (a nonzero entry among the first m − 1, or a unit last entry).
- Applies to ℤ[1/p] = O_{ℚ,{p}} and to every O_{F,S}; for Dedekind A this is K-book Ex. I.1.5's bound sr(A) ≤ 2 in the form BMS Theorem 7.4 needs (n = 3).

**Depends on.** this roadmap: `U.3/stable-range`; libraries: `mathlib:IsDedekindDomain`, `mathlib:Ideal.finite_factors`, `mathlib:IsDedekindDomain.exists_forall_sub_mem_ideal`, `mathlib:Ideal.IsMaximal`.

**Sources.**

- `Kbook.2013`, Ex. I.1.5 (PDF p. 12; book p. 4): “Bass’ Cancellation Theorem [15, V.3.5], which is used to prove 1.3, and 2.3 below, states that sr(R) ≤ d+1 if R is a d-dimensional commutative noetherian ring” — The bound for d = 1, which this node proves for Dedekind domains.
- `BMS.1967`, §2, remark before Lemma 2.2, p. 66 (PDF p. 9): “Suppose aA + bA = A. If A is semi-local then we can find a t ∈ A such that a + tb is a unit. For this is trivial if A is a field, so we can do this modulo each of the (finite number of) maximal ideals of A.” — The Chinese-remainder step used in the proof; transcribed from the scan.
- `BMS.1967`, Theorem 7.4, p. 106 (PDF p. 49): “Theorem 7.4. — If the maximal ideal space of A is a noetherian space of dimension ≤ d (e.g. if A is a noetherian ring of Krull dimension ≤ d) then A satisfies (7.2)_n for all n ≥ d + 2.” — The statement for d = 1 (Dedekind rings), with n = 3; BMS cite Bass [1, Theorem 11.1] for the proof, which is replaced by the direct argument.

### Mennicke symbols on W_𝔮

`U.4/mennicke-symbol` · definition · planet “Mennicke symbol”

Let A be a commutative ring and 𝔮 an ideal. W_𝔮 ⊆ A × A is the set of pairs (a, b) with a ≡ 1 and b ≡ 0 modulo 𝔮 and aA + bA = A (so W_A is the set of unimodular pairs). 𝔮-equivalence ∼_𝔮 is the equivalence relation on A × A generated by (a, b) ↦ (a, b + ta) for t ∈ 𝔮 and (a, b) ↦ (a + tb, b) for t ∈ A; the moves preserve W_𝔮. A Mennicke symbol on W_𝔮 with values in a group C is a function W_𝔮 → C, (a, b) ↦ [b/a], satisfying MS1: [0/1] = 1, and [b₁/a₁] = [b₂/a₂] whenever (a₁, b₁) ∼_𝔮 (a₂, b₂); and MS2: [b₁b₂/a] = [b₁/a][b₂/a] whenever (a, b₁), (a, b₂) ∈ W_𝔮. The symbol puts the second coordinate on top, as in BMS.

**Hypotheses.**

- A commutative; 𝔮 any ideal (BMS define W_𝔮, 𝔮-equivalence and Mennicke symbols for any commutative ring; their Lemmas 2.1, 2.3 and 2.4 need A Dedekind and 𝔮 ≠ 0).
- C is any group; that the image of W_𝔮 is abelian is a consequence (U.4/mennicke-symbol-residue-homomorphism).

**Proof.**

1. Define W_𝔮 as a subset of A × A.
2. Define ∼_𝔮 as the equivalence closure (Mathlib's EqvGen) of the two moves. They preserve W_𝔮: b + ta ∈ 𝔮 because t ∈ 𝔮, a + tb ≡ 1 because b ∈ 𝔮, and unimodularity is preserved because each move is an invertible row operation.
3. Equivalently, the ∼_𝔮-classes are the orbits on columns (a, b)ᵀ of the subgroup of GL₂(A) generated by the (1 0; t 1), t ∈ 𝔮, and the (1 t; 0 1), t ∈ A (BMS §2).
4. Package a Mennicke symbol as a structure MennickeSymbol A 𝔮 C: a function on W_𝔮 with the fields MS1 and MS2.

**API.**

- `MennickeSymbol.W` (data): The subset W_𝔮 of A × A.
- `MennickeSymbol.QEquiv` (data): The relation ∼_𝔮, the equivalence closure of the two moves.
- `MennickeSymbol.QEquiv.mem_W` (relation): The moves, hence ∼_𝔮, preserve W_𝔮.
- `MennickeSymbol` (structure): A function W_𝔮 → C with fields map_zero_one ([0/1] = 1), map_qEquiv (MS1) and map_mul (MS2).
- `MennickeSymbol.qEquiv_iff_orbit` (characterisation): ∼_𝔮 is the orbit relation on columns of the subgroup of GL₂(A) generated by (1 0; t 1), t ∈ 𝔮, and (1 t; 0 1), t ∈ A.
- `MennickeSymbol.comp` (functoriality): Composing with a group homomorphism C → C′ gives a Mennicke symbol with values in C′.
- `MennickeSymbol.restrict` (functoriality): For 𝔮′ ≤ 𝔮, W_{𝔮′} ⊆ W_𝔮, and a symbol on W_𝔮 restricts to one on W_{𝔮′}.

**Unit tests.**

- `MennickeSymbol.W_bot` (degenerate): For 𝔮 = ⊥, W_𝔮 = {(1, 0)} and every Mennicke symbol on it is trivial.
- `MennickeSymbol.int_qEquiv_example` (computation): Over A = ℤ with 𝔮 = ℤ: (5, 2) ∼_𝔮 (1, 2) (t = −2 in the second move) ∼_𝔮 (1, 0) (t = −2 in the first).
- `MennickeSymbol.W_two_not_closed` (non-example): The asymmetry matters: over ℤ with 𝔮 = 2ℤ, (1, 2) ∈ W_𝔮, but (1, 2) ↦ (1, 2 + 1·1) = (1, 3) uses t = 1 ∉ q and leaves W_𝔮.
- `MennickeSymbol.symm_top` (characterisation): For 𝔮 = A every Mennicke symbol satisfies [b/a] = [a/b] whenever (a, b), (b, a) ∈ W_A: (a, b) ∼_A (b, −a), and [−a/b] = [−1/b][a/b] with [−1/b] = 1.

**Acceptance.**

- For A = ℤ, 𝔮 = ℤ the constant function 1 is a Mennicke symbol, and (5, 2) ∼_ℤ (1, 2) ∼_ℤ (1, 0).
- For 𝔮 = 0, W_0 = {(1, 0)} and the only symbol is trivial.
- The symbol of U.4/sk1-mennicke-symbol is a Mennicke symbol on W_A with values in SK₁(A).

**Used by.**

- BMS 1967, Theorem 3.6: the determination of all Mennicke symbols for Dedekind rings of arithmetic type
- BMS 1967, Theorem 5.4 (Mennicke): a conjugation-invariant homomorphism on SL_n(A, 𝔮), n ≥ 3, restricts to a Mennicke symbol on W_𝔮 through first rows
- K-book Ex. III.1.10 and III.2.5: the SK₁-valued Mennicke symbol and its relative version
- U.4/sk1-generated-by-mennicke-symbols and U.4/bass-milnor-serre: SK₁(A) is a quotient of the universal Mennicke group, which is trivial in the arithmetic case

**Depends on.** libraries: `mathlib:IsCoprime`, `mathlib:Ideal.span_singleton_eq_top`.

**Sources.**

- `BMS.1967`, §2, p. 65 (PDF p. 8): “We write W_𝔮 = {(a, b) ∈ A² | (a, b) ≡ (1, 0) mod 𝔮, and aA + bA = A}.” — The set W_𝔮; transcribed from the scan.
- `BMS.1967`, §2, p. 65 (PDF p. 8): “if one is obtained from the other by a finite sequence of transformations of the types (a, b) ↦ (a, b + ta) (t ∈ 𝔮) and (a, b) ↦ (a + tb, b) (t ∈ A) (Note the asymmetry.)” — 𝔮-equivalence, with its asymmetry.
- `BMS.1967`, Definition 2.5, p. 67 (PDF p. 10): “Definition 2.5. — A Mennicke symbol on W_𝔮 is a function [ ] : W_𝔮 → C; (a, b) ↦ [b/a], where C is a group, which satisfies: MS 1. [0/1] = 1, and [b₁/a₁] = [b₂/a₂] if (a₁, b₁) ∼_𝔮 (a₂, b₂). MS 2. If (a, b₁), (a, b₂) ∈ W_𝔮 then [b₁b₂/a] = [b₁/a][b₂/a].” — The definition, verbatim up to writing the fraction-like symbols inline.

### The universal Mennicke symbol

`U.4/universal-mennicke-group` · construction

For a commutative ring A and an ideal 𝔮, let C_𝔮 be the group presented (Mathlib's PresentedGroup) by generators ⟨a, b⟩ for (a, b) ∈ W_𝔮 and the relations ⟨1, 0⟩ = 1, ⟨a₁, b₁⟩ = ⟨a₂, b₂⟩ for (a₁, b₁) ∼_𝔮 (a₂, b₂), and ⟨a, b₁b₂⟩ = ⟨a, b₁⟩⟨a, b₂⟩. The universal symbol [ ]_𝔮 : W_𝔮 → C_𝔮, (a, b) ↦ ⟨a, b⟩, is a Mennicke symbol, and every Mennicke symbol W_𝔮 → C is f ∘ [ ]_𝔮 for a unique homomorphism f : C_𝔮 → C. For 𝔮′ ≤ 𝔮, restricting [ ]_𝔮 to W_{𝔮′} gives a homomorphism C_{𝔮′} → C_𝔮 (BMS (2.6)), surjective when A is a Dedekind domain and 𝔮′ ≠ 0 (U.4/q-equivalence-smaller-ideal).

**Hypotheses.**

- A commutative, 𝔮 an ideal; the surjectivity of C_{𝔮′} → C_𝔮 needs A Dedekind and 𝔮′ ≠ 0.

**Proof.**

1. Take the free group on W_𝔮 modulo the normal closure of the three families of relations (BMS: 'the free group with basis W_𝔮 modulo the relations dictated by MS 1 and MS 2').
2. The universal property is PresentedGroup.toGroup: a function satisfying the relations extends uniquely.
3. The restricted symbol on W_{𝔮′} is a Mennicke symbol, so it induces C_{𝔮′} → C_𝔮 by the universal property.
4. Surjectivity: every generator ⟨a, b⟩ of C_𝔮 equals ⟨a′, b′⟩ for some (a′, b′) ∈ W_{𝔮′} 𝔮-equivalent to it (Lemma 2.3); by MS1 the images of the generators of C_{𝔮′} generate C_𝔮.

**API.**

- `MennickeGroup` (data): The group C_𝔮.
- `MennickeGroup.symbol` (constructor): The universal Mennicke symbol W_𝔮 → C_𝔮.
- `MennickeGroup.symbol_isMennicke` (structure): The universal symbol satisfies MS1 and MS2.
- `MennickeGroup.lift` (universal-property): A Mennicke symbol s : W_𝔮 → C induces lift s : C_𝔮 →* C.
- `MennickeGroup.lift_symbol` (universal-property): lift s ∘ symbol = s.
- `MennickeGroup.hom_ext` (extensionality): Two homomorphisms out of C_𝔮 agreeing on the symbols are equal.
- `MennickeGroup.restrictHom` (functoriality): For 𝔮′ ≤ 𝔮 the homomorphism C_{𝔮′} →* C_𝔮 of BMS (2.6).
- `MennickeGroup.restrictHom_surjective` (characterisation): restrictHom is surjective for A Dedekind and 𝔮′ ≠ ⊥.

**Unit tests.**

- `MennickeGroup.bot_trivial` (degenerate): C_⊥ is trivial.
- `MennickeGroup.int_top_trivial` (computation): For A = ℤ and 𝔮 = ℤ, C_𝔮 is trivial: the Euclidean algorithm, alternating the two moves, takes every unimodular (a, b) to (1, 0).
- `MennickeGroup.trivial_iff` (characterisation): C_𝔮 is trivial iff every Mennicke symbol on W_𝔮 with values in any group is constant 1.
- `MennickeGroup.lift_sk1` (compatibility): lift of the SK₁-valued symbol of U.4/sk1-mennicke-symbol is a homomorphism C_A →* SK₁(A), surjective for Dedekind A.
- `MennickeGroup.real_circle_nontrivial` (non-example): For A = ℝ[x, y]/(x² + y² − 1) and 𝔮 = A, C_𝔮 is nontrivial: BMS Example 4.4 gives a symbol with [y/x] = −1 (U.3/SK1-real-circle-nonzero).

**Acceptance.**

- C_𝔮 is trivial exactly when every Mennicke symbol on W_𝔮 is trivial.
- For A of arithmetic type, C_A = 1 (U.4/arithmetic-mennicke-symbols-trivial).
- BMS Theorem 4.1(c) identifies C_𝔮 with SK₁(A, 𝔮) for Dedekind A; only the surjection C_A → SK₁(A) is planned (U.4/sk1-generated-by-mennicke-symbols).

**Used by.**

- BMS 1967, Theorem 3.6: the universal symbol [ ] : W_𝔮 → C is the object whose triviality or cyclicity is proved
- BMS 1967, Theorem 4.1(c) and Corollary 4.3: C_𝔮 is identified with SK₁(A, 𝔮), giving the congruence subgroup theorem
- U.4/sk1-generated-by-mennicke-symbols: SK₁(A) is a quotient of C_A for Dedekind A
- U.4/mennicke-group-locally-cyclic and U.4/mennicke-group-exponent: the structure of C_𝔮 in the arithmetic case

**Depends on.** this roadmap: `U.4/mennicke-symbol`, `U.4/q-equivalence-smaller-ideal`; libraries: `mathlib:PresentedGroup`.

**Sources.**

- `BMS.1967`, §2, after Definition 2.5, p. 67 (PDF p. 10): “This definition makes it clear that there is a universal Mennicke symbol, [ ]_𝔮 : W_𝔮 → C_𝔮, such that all others are obtained, in a unique way, by composing [ ]_𝔮 with a homomorphism C_𝔮 → C.” — The universal symbol and its universal property.
- `BMS.1967`, §2, (2.6), p. 67 (PDF p. 10): “In particular, therefore, there is a canonical homomorphism (2.6) C_𝔮′ → C_𝔮. Using Lemma 2.3, it follows just from MS 1 that this homomorphism is surjective.” — The comparison map for 𝔮′ ⊂ 𝔮 and its surjectivity.

### Reductions of 𝔮-equivalence (Lemma 2.2)

`U.4/q-equivalence-to-base-point` · lemma

Let A be a commutative ring, 𝔮 an ideal and (a, b) ∈ W_𝔮. (a) (a, b) ∼_𝔮 (a, bq) with q = 1 − a ∈ 𝔮. (b) If a is congruent to a unit modulo b, or b is congruent to a unit modulo a, then (a, b) ∼_𝔮 (1, 0).

**Hypotheses.**

- No hypothesis on A (BMS: Lemmas 2.2 and 2.10 'are valid without any hypothesis on A').

**Proof.**

1. (a) (a, b) ↦ (a, b − ba) = (a, b(1 − a)) is a first-type move with t = −b ∈ 𝔮.
2. (b), first case: a = u − tb with u a unit. (a, b) ∼ (a + tb, b) = (u, b) ∼ (u, b + u·u⁻¹(1 − b − u)) = (u, 1 − u) ∼ (1, 1 − u) ∼ (1, 0); the parameters u⁻¹(1 − b − u) and u − 1 lie in 𝔮 because u ≡ a ≡ 1 and b ≡ 0 modulo 𝔮.
3. (b), second case: b = u + ta with u a unit, q = 1 − a. Then (a, b) ∼ (a, bq) ∼ (a, bq − a(tq)) = (a, uq) ∼ (a + u⁻¹(uq), uq) = (1, uq) ∼ (1, 0).

**Acceptance.**

- (5, 2) over ℤ with 𝔮 = ℤ: 5 ≡ 1 = unit mod 2, so (5, 2) ∼ (1, 0).
- For a unit a, every (a, b) ∈ W_𝔮 is equivalent to (1, 0).

**Depends on.** this roadmap: `U.4/mennicke-symbol`.

**Sources.**

- `BMS.1967`, Lemma 2.2, p. 66 (PDF p. 9): “Lemma 2.2. — Suppose (a, b) ∈ W_𝔮. a) (a, b) ∼_𝔮 (a, bq), where q = 1 − a ∈ 𝔮. b) If a is congruent to a unit mod b, or if b is congruent to a unit mod a, then (a, b) ∼_𝔮 (1, 0).” — Statement; the proof steps reproduce BMS's two chains of moves.

### Moving into W_{𝔮′} (Lemma 2.3)

`U.4/q-equivalence-smaller-ideal` · lemma

Let A be a Dedekind domain and 𝔮′ ⊆ 𝔮 nonzero ideals. Every (a, b) ∈ W_𝔮 is 𝔮-equivalent to some (a′, b′) ∈ W_{𝔮′}.

**Hypotheses.**

- A Dedekind and 𝔮′ ≠ 0, so that A/𝔮′ has finitely many maximal ideals.

**Proof.**

1. Pass to B = A/𝔮′ and 𝔟 = 𝔮/𝔮′; B is semilocal (Ideal.finite_factors for 𝔮′).
2. In B, āB + b̄B = B, so some t̄ ∈ B makes ā + t̄b̄ a unit (the Chinese-remainder remark of BMS §2; U.3/semilocal-unit-lemma).
3. Then (ā, b̄) ∼_𝔟 (ā + t̄b̄, b̄) ∼_𝔟 (1, 0) by U.4/q-equivalence-to-base-point over B.
4. Lift the moves to A (parameters in 𝔟 lift into 𝔮, parameters in B into A): (a, b) ∼_𝔮 (a′, b′) with (a′, b′) ≡ (1, 0) mod 𝔮′; unimodularity is preserved, so (a′, b′) ∈ W_{𝔮′}.

**Acceptance.**

- 𝔮′ = pq ⊂ 𝔮 in ℤ: every (a, b) ∈ W_𝔮 moves into W_{pq}.
- It gives the surjectivity of C_{𝔮′} → C_𝔮 (U.4/universal-mennicke-group).

**Depends on.** this roadmap: `U.4/q-equivalence-to-base-point`, `U.4/mennicke-symbol`, `U.3/semilocal-unit-lemma`; libraries: `mathlib:Ideal.finite_factors`, `mathlib:IsDedekindDomain.exists_forall_sub_mem_ideal`.

**Sources.**

- `BMS.1967`, Lemma 2.3 and its proof, p. 66 (PDF p. 9): “Lemma 2.3. — Suppose 𝔮′ ⊂ 𝔮 are non zero ideals in A. Then any (a, b) ∈ W_𝔮 is 𝔮-equivalent to some (a′, b′) ∈ W_𝔮′.” — Statement; the proof passes to the semilocal ring A/𝔮′ as in the steps.

### Descending to a smaller ring (Lemma 2.1)

`U.4/q-equivalence-ring-of-fractions` · lemma

Let A be a Dedekind domain, A′ = M⁻¹A a ring of fractions (IsLocalization M A′, M a submonoid of nonzero elements) and 𝔮′ a nonzero ideal of A′, 𝔮 = 𝔮′ ∩ A. Every (a′, b′) ∈ W_{𝔮′} is 𝔮′-equivalent (in A′) to some (a, b) with a, b ∈ A and (a, b) ∈ W_𝔮.

**Hypotheses.**

- A Dedekind; M consists of nonzero elements, so A′ is again Dedekind and A → A′/𝔞′ is surjective for every nonzero ideal 𝔞′ of A′.

**Proof.**

1. Arrange a′, b′ ≠ 0 (move once if needed). Since A → A′/a′𝔮′ is surjective, choose b ∈ A with b ≡ b′ mod a′𝔮′; then (a′, b′) ∼_{𝔮′} (a′, b).
2. Write bA = 𝔟₁𝔟₂ with 𝔟₁ = bA′ ∩ A; 𝔟₁ and 𝔟₂ are coprime and 𝔟₁A′ = bA′ (standard properties of rings of fractions of a Dedekind domain).
3. Choose a₁ ∈ A with a₁ ≡ a′ mod bA′, and solve a ≡ a₁ mod 𝔟₁, a ≡ 1 mod 𝔟₂ in A (Chinese remainder); then a ≡ a′ mod bA′, so (a′, b) ∼_{𝔮′} (a, b).
4. (a, b) ≡ (1, 0) modulo 𝔮′ ∩ A = 𝔮, and aA + bA = A follows from aA′ + bA′ = A′ and a ≡ 1 mod 𝔟₂, so (a, b) ∈ W_𝔮.

**Acceptance.**

- A = ℤ, A′ = ℤ[1/2], 𝔮′ = 3A′: (5/2, 3) ∈ W_{𝔮′} (5/2 − 1 = 3/2 ∈ 𝔮′), and (5/2, 3) ∼_{𝔮′} (5/2 − (1/2)·3, 3) = (1, 3) ∼_{𝔮′} (1, 0), an integer pair in W_{3ℤ}.
- Used with A = 𝓞_F and A′ = O_{F,S} = 𝓞_F[1/s] (U.4/s-integers-ring-of-fractions) in U.4/prime-choice.

**Depends on.** this roadmap: `U.4/mennicke-symbol`; libraries: `mathlib:IsLocalization`, `mathlib:IsDedekindDomain.exists_forall_sub_mem_ideal`.

**Sources.**

- `BMS.1967`, Lemma 2.1 and its proof, p. 65 (PDF p. 8): “Lemma 2.1. — Suppose A′ = S⁻¹A is a ring of fractions of A, and that 𝔮′ is a non zero ideal of A′. Then any (a′, b′) ∈ W_𝔮′ is 𝔮′-equivalent to some (a, b) ∈ W_𝔮, where q = 𝔮′ ∩ A.” — Statement; the proof steps follow BMS pp. 65–66.

### A common first entry (Mennicke–Newman, Lemma 2.4)

`U.4/mennicke-newman-common-entry` · lemma

Let A be a Dedekind domain and 𝔮 a nonzero ideal. Given (a₁, b₁), …, (a_n, b_n) ∈ W_𝔮 there are a ∈ A and c₁, …, c_n with (a, c_i) ∈ W_𝔮 and (a, c_i) ∼_𝔮 (a_i, b_i) for every i.

**Hypotheses.**

- A Dedekind, 𝔮 ≠ 0.

**Proof.**

1. Choose 0 ≠ q ∈ 𝔮 and, by U.4/q-equivalence-smaller-ideal, (a_i′, b_i′q) ∈ W_{qA} with (a_i′, b_i′q) ∼_𝔮 (a_i, b_i).
2. Induct on n: having (a′, c_iq) ∼_𝔮 (a_i′, b_i′q) for i < n with all c_i ≠ 0, choose c_n ≡ b_n′ mod a_n′ prime to c₁⋯c_{n−1} (Chinese remainder, as in BMS's remark before Lemma 2.2); then (a_n′, b_n′q) ∼_𝔮 (a_n′, c_nq).
3. Write a′ − a_n′ = dq and solve d = rc_n − sc₁⋯c_{n−1}; then a := a_n′ + rc_nq = a′ + sc₁⋯c_{n−1}q satisfies (a, c_iq) ∼_𝔮 (a′, c_iq) for i < n and (a, c_nq) ∼_𝔮 (a_n′, c_nq).

**Acceptance.**

- Two pairs over ℤ with 𝔮 = ℤ receive a common first entry.
- Used in U.4/mennicke-symbol-residue-map (d): finitely many symbols lie in one image of U(A/aA).

**Depends on.** this roadmap: `U.4/q-equivalence-smaller-ideal`, `U.4/mennicke-symbol`; libraries: `mathlib:IsDedekindDomain.exists_forall_sub_mem_ideal`.

**Sources.**

- `BMS.1967`, Lemma 2.4 (Mennicke-Newman), p. 66 (PDF p. 9): “Lemma 2.4 (Mennicke-Newman). — Given (a₁, b₁), . . ., (a_n, b_n) ∈ W_𝔮, we can find (a, c₁), . . ., (a, c_n) ∈ W_𝔮 such that (a, c_i) ∼_𝔮 (a_i, b_i), 1 ≤ i ≤ n.” — Statement; the proof steps follow BMS's induction.

### Consequences of MS1 and the map U(A/aA) → C (Lemma 2.7)

`U.4/mennicke-symbol-residue-map` · lemma

Let A be a Dedekind domain, 𝔮 a nonzero ideal and [ ] : W_𝔮 → C a function satisfying MS1. (a) [b/a] = 1 if a is congruent to a unit mod b or b is congruent to a unit mod a. (b) For a nonzero 𝔮′ ⊆ 𝔮, every [b/a] equals some [b′/a′] with (a′, b′) ∈ W_{𝔮′}. (c) If q ∈ 𝔮 and a ≡ 1 mod 𝔮, then b ↦ [bq/a], for b ∈ A prime to a, induces a map U(A/aA) → C (BMS (2.8)) whose composite with U(A) → U(A/aA) is constant 1. (d) Any finite set of symbols [b_i/a_i] lies in the image of one map (2.8), for suitable q and a, and a can be chosen arbitrarily in a progression a + tcq (t ∈ A) for some c prime to a.

**Hypotheses.**

- A Dedekind, 𝔮 ≠ 0; only MS1 is assumed (MS2 enters in U.4/mennicke-symbol-residue-homomorphism).

**Proof.**

1. (a) is U.4/q-equivalence-to-base-point (b) with MS1.
2. (b) is U.4/q-equivalence-smaller-ideal with MS1.
3. (c) The 𝔮-equivalence class of (a, bq) depends on b only modulo a ((a, bq) ↦ (a, bq + (xq)a), xq ∈ 𝔮); if b is a unit then a ≡ 1 mod bq, so [bq/a] = 1 by (a).
4. (d) By (b) and U.4/mennicke-newman-common-entry, bring the finitely many pairs to (a, c_iq) with a common a ≡ 1 mod 𝔮; a may be changed within a + tc₁⋯c_nq without changing the classes.

**Acceptance.**

- For 𝔮 = A and aA prime, (2.8) is a map from the finite cyclic group (A/aA)^× (K-book Ex. III.1.11's transfer from K₁(A/𝔭) to SK₁(A) is this map for the SK₁ symbol).
- The constant-1 composite with U(A) says that global units give trivial symbols.

**Depends on.** this roadmap: `U.4/q-equivalence-to-base-point`, `U.4/q-equivalence-smaller-ideal`, `U.4/mennicke-newman-common-entry`, `U.4/mennicke-symbol`.

**Sources.**

- `BMS.1967`, Lemma 2.7, p. 67 (PDF p. 10): “c) If q ∈ 𝔮 and if a ≡ 1 mod 𝔮, then the map b ↦ [bq/a] for b ∈ A, b prime to a, induces a map (2.8) U(A/aA) → C whose composite with the homomorphism U(A) → U(A/aA) is the constant map 1.” — Part (c), the map (2.8); parts (a), (b), (d) are on the same page.
- `BMS.1967`, Lemma 2.7(d), p. 67 (PDF p. 10): “d) Any finite set of symbols [b_i/a_i] belong to the image of (2.8) for a suitable choice of q and a, and a can be chosen arbitrarily from a “progression” a + tcq (t ∈ A) for some c prime to a.” — Part (d).
- `Kbook.2013`, Ex. III.1.11, Transfer (PDF p. 199; book p. 191): “Suppose that R is a Dedekind domain and p is a prime ideal of R. Show that there is a map π∗from K1(R/p) = (R/p)× to SK1(R) sending s̄ ∈(R/p)× to the Mennicke symbol” — The K-book's instance of (2.8) for the SK₁ symbol and a prime aA.

### The maps (2.8) are homomorphisms (Lemma 2.9)

`U.4/mennicke-symbol-residue-homomorphism` · lemma

Let A be a Dedekind domain, 𝔮 a nonzero ideal and [ ] : W_𝔮 → C a Mennicke symbol. (a) Each map (2.8) U(A/aA) → C is a group homomorphism. (b) The image of W_𝔮 is an abelian subgroup of C.

**Hypotheses.**

- A Dedekind, 𝔮 ≠ 0, [ ] a Mennicke symbol (MS1 and MS2).

**Proof.**

1. (a) For a ≡ 1 mod 𝔮, [q/a] = 1 by U.4/mennicke-symbol-residue-map (a); so for b₁, b₂ prime to a, MS2 gives [b₁b₂q/a] = [b₁b₂q/a][q/a] = [b₁qb₂q/a] = [b₁q/a][b₂q/a].
2. (b) By U.4/mennicke-symbol-residue-map (d) any two symbols lie in the image of one map (2.8), a homomorphic image of the abelian group U(A/aA).

**Acceptance.**

- For aA prime the image of (2.8) is cyclic, the image of the finite cyclic group (A/aA)^×.
- Used in U.4/mennicke-group-locally-cyclic and U.4/arithmetic-mennicke-symbols-trivial.

**Depends on.** this roadmap: `U.4/mennicke-symbol-residue-map`, `U.4/mennicke-symbol`.

**Sources.**

- `BMS.1967`, Lemma 2.9 and its proof, pp. 67–68 (PDF pp. 10–11): “Lemma 2.9. — Suppose [ ] : W_𝔮 → C is a Mennicke symbol. Then: a) The maps (2.8) are homomorphisms. b) The image of W_𝔮 is an abelian subgroup of C.” — Statement; the proof is BMS's two-line computation.

### The Mennicke symbol with values in SK₁ (Mennicke's theorem)

`U.4/sk1-mennicke-symbol` · construction · planet “Mennicke's theorem”

Let A be a commutative ring, n ≥ 3 and κ : SL_n(A) → C a group homomorphism with κ(τστ⁻¹) = κ(σ) for τ ∈ E_n(A) and σ ∈ SL_n(A). For (a, b) ∈ W_A choose σ ∈ SL₂(A) with first row (a, b) (Mathlib's IsCoprime.exists_SL2_row) and set [b/a]_κ := κ(diag(σ, 1_{n−2})). This is independent of σ and is a Mennicke symbol on W_A (BMS Theorem 5.4 with 𝔮 = A). For κ the composite SL₃(A) → SL(A) → SK₁(A) = SL(A)/E(A) (U.1, U.3) this is the SK₁-valued Mennicke symbol [b/a] = class of σ, which is the K-book's symbol of Ex. III.1.10 ([s/r] is the class of (r s; t u) with ru − st = 1) and is symmetric: [b/a] = [a/b].

**Hypotheses.**

- A commutative; 𝔮 = A throughout (the relative symbols of BMS §5 for 𝔮 ≠ A are not needed for U.4).
- κ exists for SK₁ because SK₁(A) is abelian and E(A) is normal in SL(A) (U.1: [GL(A), GL(A)] = E(A)).

**Proof.**

1. First rows: the map SL₂(A) → W_A, σ ↦ (a, b), is surjective (for 1 = ax + by take (a b; −y x)), and two matrices with the same first row differ on the left by an element of SN = {(1 0; c 1)} ⊂ E₂(A) (BMS Lemma 5.3).
2. κ kills E₂(A) and [E₂(A), SL₂(A)] through diag(·, 1): κ([τ, σ]) = κ(τστ⁻¹)κ(σ)⁻¹ = 1 for τ ∈ E_n(A), and E_n(A) = [E_n(A), E_n(A)] for n ≥ 3 (BMS (5.1); U.1 perfectness). So the value depends only on the first row, and MS1 holds: right multiplication by (1 t; 0 1) ∈ E₂ changes (a, b) to (a, b + ta); conjugation by (1 0; t 1) changes it to (a + tb, b) (BMS Lemma 5.5).
3. MS2: BMS's explicit computation in SL₃(A): for α_i = (a b_i; c_i d_i), multiplying α₁ε₁α₂ε₁⁻¹ by elementary matrices ε₂, …, ε₅ gives diag(α′, 1) with α′ ∈ SL₂(A) of first row (a, b₁b₂), so κ(α′) = κ(α₁)κ(α₂).
4. For SK₁: κ : SL₃(A) → SK₁(A) is a homomorphism into an abelian group, trivial on E₃(A) ⊆ E(A), hence conjugation-invariant.
5. Symmetry: σ·(0 −1; 1 0) has first row (b, −a), and (0 −1; 1 0) = e₁₂(−1)e₂₁(1)e₁₂(−1) ∈ E₂(A) (K-book Example III.1.2.1), so [b/a] = [−a/b] = [−1/b][a/b] = [a/b], using [−1/b] = 1 (U.4/q-equivalence-to-base-point (b)).

**API.**

- `MennickeSymbol.ofSLHom` (constructor): The Mennicke symbol on W_A attached to a conjugation-invariant κ : SL_n(A) →* C, n ≥ 3.
- `MennickeSymbol.ofSLHom_apply` (simp): Its value at (a, b) is κ(diag(σ, 1)) for any σ ∈ SL₂(A) with first row (a, b).
- `MennickeSymbol.sk1` (data): The SK₁-valued symbol W_A → SK₁(A).
- `MennickeSymbol.sk1_apply` (simp): sk1 (a, b) is the class in SK₁(A) of any σ ∈ SL₂(A) with first row (a, b).
- `MennickeSymbol.sk1_symm` (relation): [b/a] = [a/b].
- `MennickeSymbol.sk1_map` (functoriality): For a ring homomorphism f : A → B, SK₁(f)[b/a] = [f b/f a].
- `MennickeSymbol.sk1_of_isUnit` (simp): [b/a] = 1 when a or b is a unit.

**Unit tests.**

- `MennickeSymbol.sk1_one` (degenerate): [b/1] = 1 for every b: (1, b) is the first row of e₁₂(b) ∈ E₂(A).
- `MennickeSymbol.sk1_int` (computation): For A = ℤ, sk1 is constant 1, by Tau Ceti's closure_range_toSpecialLinearGroup_eq_top.
- `MennickeSymbol.sk1_unit` (characterisation): For a unit a and any b, [b/a] = 1, via (a b; 0 a⁻¹) = diag(a, a⁻¹)·e₁₂(a⁻¹b) and diag2nUnit_decompose.
- `MennickeSymbol.sk1_eq_kbook` (compatibility): For a unimodular row (r, s), sk1 (r, s) is the class of (r s; t u) with ru − st = 1, the K-book's [s/r] of Ex. III.1.10.
- `MennickeSymbol.sk1_real_circle` (non-example): For A = ℝ[x, y]/(x² + y² − 1), sk1 (x, y) ≠ 1 (U.3/SK1-real-circle-nonzero), so the symbol is not trivial on every Dedekind domain.

**Acceptance.**

- For A = ℤ the symbol is trivial (SL₂(ℤ) = E₂(ℤ), Tau Ceti's closure_range_toSpecialLinearGroup_eq_top).
- For a unit a, [b/a] = 1: (a b; 0 a⁻¹) = diag(a, a⁻¹)e₁₂(a⁻¹b) and diag(a, a⁻¹) ∈ E₂(A) (Tau Ceti's Matrix.SpecialLinearGroup.diag2nUnit_decompose).
- For A = ℝ[x, y]/(x² + y² − 1), [y/x] ≠ 1 (U.3/SK1-real-circle-nonzero).

**Used by.**

- BMS 1967, Theorem 4.1(b) and Corollary 4.3: the SL_n-symbol, whose universality identifies SK₁(A, 𝔮) with C_𝔮
- K-book Ex. III.1.10: SK₁(R) is generated by Mennicke symbols when sr(R) ≤ 2
- K-book Ex. III.1.11: the transfer K₁(R/𝔭) → SK₁(R) for a Dedekind domain is s̄ ↦ [s/r]
- U.4/sk1-generated-by-mennicke-symbols: its lift C_A → SK₁(A) is onto
- U.3/SK1-real-circle-nonzero: the symbol [y/x] detects the nontrivial class

**Depends on.** this roadmap: `U.4/mennicke-symbol`, `U.4/q-equivalence-to-base-point`, `U.1/whitehead-lemma`, `U.1/elementary-perfect`, `U.1/signed-transposition`, `U.3/special-linear-mod-elementary`; libraries: `mathlib:IsCoprime.exists_SL2_row`, `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose`, `tauceti:TauCeti.commutatorElement_transvectionUnit`.

**Sources.**

- `BMS.1967`, Theorem 5.4 (Mennicke), p. 101 (PDF p. 44): “Theorem 5.4 (Mennicke). — Let A be a commutative ring, and let 𝔮 be an ideal of A. Suppose, for some n ≥ 3, that we are given a homomorphism κ : SL_n(A, 𝔮) → C such that κ(τστ⁻¹) = κ(σ) whenever τ ∈ E_n(A) and σ ∈ SL_n(A, 𝔮).” — The hypothesis; the conclusion, the proof of MS1 (Lemma 5.5) and of MS2 are on pp. 101–103. Used with 𝔮 = A.
- `BMS.1967`, Lemma 5.3, p. 101 (PDF p. 44): “The map α = (a b; c d) ↦ (a, b) defines bijections N\GL₂(A, 𝔮) → W_𝔮 and SN\SL₂(A, 𝔮) → W_𝔮.” — First rows parametrise the cosets of SN ⊂ E₂(A).
- `Kbook.2013`, Ex. III.1.10, Mennicke symbols (PDF p. 198; book p. 190): “Let (r, s) be a unimodular row over a commutative ring R. We define the Mennicke symbol” — The K-book's SK₁-valued symbol: the class of the matrix (r s; t u) with ru − st = 1; the exercise lists [r/s] = [s/r] and multiplicativity.

### SK₁ of a Dedekind domain is a quotient of the universal Mennicke group

`U.4/sk1-generated-by-mennicke-symbols` · theorem

Let A be a commutative ring of stable range at most 2 (U.3/stable-range with n = 2), for instance a Dedekind domain. The homomorphism C_A → SK₁(A) lifting the SK₁-valued Mennicke symbol (U.4/universal-mennicke-group, U.4/sk1-mennicke-symbol) is surjective: SK₁(A) is generated by the symbols [b/a], (a, b) ∈ W_A. In particular SK₁(A) = 0 if every Mennicke symbol on W_A is trivial.

**Hypotheses.**

- Stable range at most 2 in the sense of U.3/stable-range (U.4/dedekind-stable-range-two for Dedekind A).

**Proof.**

1. By surjective stability (U.3/stable-range-reduction with n = 2: GL_r(A) = E_r(A)·GL₂(A) for r > 2; taking determinants SL_r(A) = E_r(A)·SL₂(A)) every class in SK₁(A) = SL(A)/E(A) (U.3/special-linear-mod-elementary) is the class of some σ ∈ SL₂(A).
2. That class is the symbol of the first row of σ (U.4/sk1-mennicke-symbol), which is the image of the generator ⟨a, b⟩ of C_A.
3. If C_A = 1 the surjection shows SK₁(A) = 0.

**Acceptance.**

- K-book Ex. III.1.10: SK₁(R) is generated by Mennicke symbols when sr(R) ≤ 2.
- BMS Theorem 4.1(c) states that this surjection is an isomorphism for Dedekind A (universality, via Kubota's theorem and §§ 8–10); the isomorphism is not needed for SK₁(A) = 0 and is not planned.

**Depends on.** this roadmap: `U.3/stable-range-reduction`, `U.3/special-linear-mod-elementary`, `U.4/sk1-mennicke-symbol`, `U.4/universal-mennicke-group`, `U.4/dedekind-stable-range-two`.

**Sources.**

- `Kbook.2013`, Ex. III.1.10 (PDF p. 198; book p. 190): “If R is noetherian of dimension 1, or more generally has sr(R) ≤ 2, then we know by Ex. 1.3 that GL2(R) maps onto K1(R), and hence SK1(R) is generated by Mennicke symbols.” — The statement of this node.
- `BMS.1967`, Theorem 4.1, p. 94 (PDF p. 37): “Theorem 4.1. — Let A be a Dedekind ring, let 𝔮 be an ideal of A, and suppose n ≥ 3.” — BMS's main theorem of Chapter II, of which part (b) is the construction of the symbol and part (c), universality, is cited only.

### Rings of S-integers are localisations away from one element

`U.4/s-integers-ring-of-fractions` · lemma

Let F be a number field and S a finite set of nonzero primes of 𝓞_F. There is a nonzero s ∈ 𝓞_F whose prime divisors are exactly the primes of S such that O_{F,S} = Set.integer S F is the localisation of 𝓞_F away from s (IsLocalization.Away s (S.integer F)). One may take s = ∏_{v ∈ S} a_v with v^{h_v} = (a_v), h_v the order of the class of v in the finite class group. More generally, if S ⊆ S′ are finite, O_{F,S′} = O_{F,S}[1/s′] for some s′ ∈ O_{F,S}.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).
- Only finiteness of the class group of 𝓞_F is used (Mathlib's NumberField.RingOfIntegers.instFintypeClassGroup).

**Proof.**

1. For v ∈ S the class [v] has finite order h_v ≥ 1 (isOfFinOrder_of_finite), so v^{h_v} = (a_v) is principal (ClassGroup.mk0_eq_one_iff); a_v ∈ v and w(a_v) = 1 for every w ≠ v.
2. s = ∏ a_v is a unit in O_{F,S}: its valuation is 1 at every w ∉ S (Set.mem_integer_iff).
3. Surjectivity of 𝓞_F[1/s] → O_{F,S}: for x ∈ O_{F,S}, v(x) > 1 only for v ∈ S (Set.integer), and v(s) < 1 for v ∈ S, so s^k x has valuation ≤ 1 everywhere for k large, hence lies in 𝓞_F (IsDedekindDomain.HeightOneSpectrum.mem_integers_of_valuation_le_one).
4. Injectivity is automatic in the domain F; the second statement applies the first to the primes of S′ ∖ S, whose images in O_{F,S} are principal up to the same argument.
5. This is the argument of ArithmeticKTheory N.1/S-integers-localisation-of-torsion-class-group, which is downstream of U.4 (U.4 → U.5 → N.1); see restructure for the ownership of the statement.

**Acceptance.**

- F = ℚ, S = {(p)}: s = p and O_{F,S} = ℤ[1/p].
- F = ℚ(√−5), S = {𝔭₂} with 𝔭₂ = (2, 1 + √−5): 𝔭₂² = (2), s = 2, O_{F,S} = 𝓞_F[1/2].
- S = ∅: s = 1 and O_{F,∅} = 𝓞_F (Mathlib's IsDedekindDomain.integer_empty).

**Depends on.** libraries: `mathlib:Set.integer`, `mathlib:IsLocalization.Away`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:isOfFinOrder_of_finite`, `mathlib:ClassGroup.mk0_eq_one_iff`, `tauceti:Set.mem_integer_iff`, `mathlib:IsDedekindDomain.integer_empty`.

**Sources.**

- `BMS.1967`, Appendix on number theory, definition after (A.9), p. 83 (PDF p. 26): “If A′ is defined by S′_∞ ⊃ S_∞ then it follows easily from the finiteness of class number that A′ is a ring of fractions of A; in fact A′ = A[a⁻¹] for a suitable a ∈ A.” — The statement; BMS give no further proof, and the steps are the standard class-number argument. Transcribed from the scan.
- `BMS.1967`, Proof of Theorem 3.2, p. 73 (PDF p. 16): “Next suppose A′ is some other Dedekind ring of arithmetic type in k. Then A′ = A[s⁻¹] for some s ∈ A, where A is as above.” — Where the lemma is used: passing from 𝓞_F to O_{F,S}.

### The density theorem for idèle class groups (A.7)

`U.4/idelic-density-theorem` · application

Let k be a number field, J its idèle group and C = J/k^× its idèle class group (Mathlib's NumberField.IdeleGroup (𝓞 k) k and NumberField.IdeleClassGroup (𝓞 k) k; the class of an idèle prime at 𝔭 is the image of a uniformiser under IdeleClassGroup.ofAdicCompletion 𝔭). An idèle t is prime at a finite prime 𝔭₀ if t_𝔭 = 1 for 𝔭 ≠ 𝔭₀ and t_{𝔭₀} is a uniformiser. If V is an open subgroup of finite index in C, every coset of C/V contains the classes of prime idèles at infinitely many finite primes.

**Hypotheses.**

- The class-field-theoretic inputs are imported from Tau Ceti roadmaps through the requests of this packet; they cannot be listed as prerequisites.
- Number fields only (BMS also treat function fields, which are not needed).

**Proof.**

1. By GlobalNumberFields Layer 7 (requested), V contains the ray subgroup RaySubgroup 𝔪 of some modulus 𝔪; every coset of V is a union of cosets of RaySubgroup 𝔪, so it suffices to treat V = RaySubgroup 𝔪, with C/V ≅ RayClassGroup 𝔪 by rayClassQuotient.
2. Under rayClassQuotient the class of a prime idèle at 𝔭₀ ∤ 𝔪 is the ray class of 𝔭₀ (the ray-class dictionary of the same layer).
3. The ray class field L = rayClassField 𝔪 is abelian over k and unramified outside 𝔪, and gal_rayClassField_equiv_rayClassGroup sends the Artin symbol of 𝔭 ∤ 𝔪 to its ray class (ClassFieldTheory Layers 12–13, requested; this is BMS's (A.5)).
4. Chebotarev for the abelian extension L/k (Chebotarev Layer 10: infinitude of every Frobenius class, requested; BMS's (A.6)) gives infinitely many 𝔭 ∤ 𝔪 with any prescribed Artin symbol, hence in any prescribed ray class.
5. So every coset of C/V contains infinitely many prime idèle classes. BMS: 'In view of (A.5) we see that this Čebotarev Theorem is equivalent to the Density Theorem'.

**Acceptance.**

- k = ℚ, V the kernel of C → (ℤ/m)^×: the statement is Dirichlet's theorem on primes in progressions (Mathlib's Nat.forall_exists_prime_gt_and_eq_mod).
- V = C: infinitely many primes, trivially.

**Depends on.** libraries: `mathlib:NumberField.RingOfIntegers`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:Nat.forall_exists_prime_gt_and_eq_mod`, `mathlib:NumberField.IdeleGroup`, `mathlib:NumberField.IdeleClassGroup`, `mathlib:NumberField.IdeleClassGroup.ofAdicCompletion`.

**Sources.**

- `BMS.1967`, Appendix, (A.7), p. 82 (PDF p. 25): “(A.7) Density Theorem. If U is an open subgroup of finite index in C then every coset of C/U contains infinitely many prime idèle classes.” — The statement; transcribed from the scan.
- `BMS.1967`, Appendix, (A.5)–(A.6), p. 82 (PDF p. 25): “(A.6) “Čebotarev Theorem for abelian extensions”. (See [H], § 24). Let K/k be a finite abelian extension; given σ ∈ Gal(K/k) there are infinitely many primes p of k, unramified in K, such that (p, K/k) = σ.” — The input from Chebotarev; (A.5), Artin reciprocity and existence, is the other.

### Infinitely many primes of norm not 1 modulo m (A.8)

`U.4/primes-with-norm-not-one` · lemma

Let k be a number field and m ≥ 2 an integer such that k contains no primitive m-th root of unity. Then there are infinitely many nonzero primes 𝔭 of 𝓞_k, prime to m, with N𝔭 ≢ 1 (mod m), where N𝔭 = Ideal.absNorm 𝔭.

**Hypotheses.**

- The class-field-theoretic inputs are imported from Tau Ceti roadmaps through the requests of this packet; they cannot be listed as prerequisites.
- Used with m = p^{n+1}, n maximal with μ_{p^n} ⊂ k (U.4/prime-choice).

**Proof.**

1. Let ζ be a primitive m-th root of unity; k(ζ)/k is abelian and σ ≠ 1 exists in its Galois group since ζ ∉ k.
2. By Chebotarev (Layer 10, requested) infinitely many 𝔭 ∤ m, unramified in k(ζ), have Frobenius σ.
3. The Frobenius at 𝔭 ∤ m acts on ζ by ζ ↦ ζ^{N𝔭} (the cyclotomic Frobenius formula, Chebotarev Layer 4, requested); as σ(ζ) ≠ ζ, ζ^{N𝔭} ≠ ζ, i.e. N𝔭 ≢ 1 (mod m) — equivalently ζ ∉ k(𝔭), the residue field.

**Acceptance.**

- k = ℚ, m = 4: the primes p ≡ 3 (mod 4).
- k = ℚ(i), m = 8: ζ₈ ∉ ℚ(i), and the primes of norm 9, 49, … (inert rational primes 3, 7) have N𝔭 ≡ 1 mod 8; primes above p ≡ 5 (mod 8) have N𝔭 = p ≢ 1 (mod 8).

**Depends on.** libraries: `mathlib:Ideal.absNorm`, `mathlib:NumberField.RingOfIntegers`.

**Sources.**

- `BMS.1967`, Appendix, (A.8), p. 82 (PDF p. 25): “(A.8) Corollary. — Let ζ be a primitive m-th root of unity and suppose that ζ ∉ k. Then there exist infinitely many primes p such that Np ≢ 1 mod m.” — The statement (number-field case); the proof via Chebotarev is on pp. 82–83.

### Dirichlet's theorem with local conditions (A.10)

`U.4/dirichlet-theorem-arithmetic-type` · theorem · planet “Dirichlet theorem for arithmetic Dedekind rings”

Let A = O_{F,S} and S_∞ = S ∪ {archimedean places}. Let a, b ∈ A be nonzero with aA + bA = A; let S₀ be a finite set of primes of A prime to b; for each place 𝔭 ∈ S₀ ∪ S_∞ let V_𝔭 ⊆ F_𝔭^× be an open subgroup and x_𝔭 ∈ F_𝔭^× with e_𝔭 = ord_𝔭(x_𝔭) ≥ 0 for 𝔭 ∈ S₀; assume V_𝔭 has finite index for at least one 𝔭 ∈ S_∞. Then there are infinitely many primes 𝔭₀ ∉ S₀ ∪ S_∞ for which some c ∈ A satisfies c ≡ a mod bA, c ∈ x_𝔭V_𝔭 for all 𝔭 ∈ S₀ ∪ S_∞, and cA = 𝔭₀·∏_{𝔭 ∈ S₀} 𝔭^{e_𝔭}.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).
- The class-field-theoretic inputs are imported from Tau Ceti roadmaps through the requests of this packet; they cannot be listed as prerequisites.
- The compactness of the norm-one idèle classes (BMS (A.4), GlobalNumberFields Layer 6) is imported.

**Proof.**

1. Shrink V_𝔭 ⊆ U_𝔭 for 𝔭 ∈ S₀; for 𝔭 ∉ S₀ ∪ S_∞ put V_𝔭 = U_𝔭(ord_𝔭(b)) = {u ∈ U_𝔭 | ord_𝔭(1 − u) ≥ ord_𝔭(b)}; V = ∏ V_𝔭 is an open subgroup of J (V_𝔭 = U_𝔭 for almost all 𝔭).
2. W = Vk^×/k^× is open in C, and C/W is finite: it is discrete, and compact because C⁰ is compact (GlobalNumberFields Layer 6's normOne compactness, requested) and ‖C‖/‖W‖ is finite, ‖W‖ ≠ {1} since some V_𝔭 with 𝔭 ∈ S_∞ has finite index.
3. Form the idèles ā (a at the primes dividing b, 1 elsewhere) and x̄ (x_𝔭 at 𝔭 ∈ S₀ ∪ S_∞, 1 elsewhere). By U.4/idelic-density-theorem there are infinitely many 𝔭₀ ∉ S₀ ∪ S_∞ with a prime idèle t at 𝔭₀ such that t ≡ ā x̄⁻¹ mod Vk^×, i.e. t x̄ v = ā d with d ∈ k^×, v ∈ V.
4. Put c = ad and read the equation place by place: ord_𝔭(c) = 0 away from 𝔭₀ ∪ S₀ ∪ S_∞ ∪ (primes of b); ord_{𝔭₀}(c) = 1; c ∈ x_𝔭V_𝔭 with ord_𝔭(c) = e_𝔭 on S₀; c ≡ a mod 𝔭^{ord_𝔭 b} at the primes of b; and c x_𝔭⁻¹ ∈ V_𝔭 on S_∞. Hence c ∈ A, c ≡ a mod bA and cA = 𝔭₀∏𝔭^{e_𝔭}.

**Acceptance.**

- F = ℚ, S = ∅, S₀ = ∅, V_∞ = ℝ_{>0}: primes p ≡ a (mod b) with a prescribed sign, i.e. Dirichlet's theorem.
- It is applied in U.4/prime-choice, U.4/power-reduction-non-totally-imaginary, U.4/power-reduction-totally-imaginary and U.4/mennicke-group-locally-cyclic.

**Depends on.** this roadmap: `U.4/idelic-density-theorem`; libraries: `mathlib:Set.integer`, `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation`.

**Sources.**

- `BMS.1967`, Appendix, (A.10), p. 83 (PDF p. 26): “(A.10) Dirichlet Theorem. — Suppose we are given: non zero a, b ∈ A such that aA + bA = A; a finite set S₀ of primes outside S_∞ and prime to b; for each p ∈ S₀ ∪ S_∞ an open subgroup V_p ⊂ k*_p and an x_p ∈ k*_p such that, for p ∈ S₀, e_p = ord_p(x_p) ≥ 0.” — The hypotheses; the conclusion and the proof follow on pp. 83–84. Transcribed from the scan.
- `BMS.1967`, Proof of (A.10), p. 84 (PDF p. 27): “Now it follows from the Density Theorem that each coset of J/V.k* contains infinitely many prime idèles.” — The key step of the proof.

### Primes in a progression with prescribed signs (A.11)

`U.4/dirichlet-theorem-number-field` · lemma

Let F be a number field, A = O_{F,S}, a, b ∈ A nonzero and 𝔞 a nonzero ideal with aA + bA = A = 𝔞 + bA. There are infinitely many primes 𝔭₀ of A (outside S) such that 𝔭₀𝔞 = cA for some c ≡ a mod bA, and the signs of c at the real places may be prescribed.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).

**Proof.**

1. Apply U.4/dirichlet-theorem-arithmetic-type with S₀ the primes of 𝔞 and x_𝔭 a local generator of 𝔞 at 𝔭 ∈ S₀ with V_𝔭 = U_𝔭, V_𝔭 = ℝ_{>0} and x_𝔭 = ±1 (the prescribed sign) at the real places, and V_𝔭 = F_𝔭^× elsewhere in S_∞; the real place, or any archimedean place with V = F_𝔭^×, has finite index.
2. The c produced satisfies cA = 𝔭₀𝔞 and the prescribed signs.

**Acceptance.**

- F = ℚ, S = ∅, 𝔞 = (1): a prime p₀ ≡ a mod b, positive: Dirichlet's theorem.
- Used with 𝔞 = 𝔭₁ in U.4/prime-choice.

**Depends on.** this roadmap: `U.4/dirichlet-theorem-arithmetic-type`.

**Sources.**

- `BMS.1967`, Appendix, (A.11), p. 84 (PDF p. 27): “(A.11) Suppose k is a number field. Given non zero a, b ∈ A and a non zero ideal 𝔞 such that aA + bA = A = 𝔞 + bA, then there are infinitely many primes p₀ ∉ S_∞ such that p₀𝔞 = cA for some c ≡ a mod bA, and we can prescribe the signs of c at the real primes.” — Statement; BMS: 'We take V_p = the positive reals, at real p, to obtain the last condition'.

### Choosing a first entry with two prime factors (Theorem 3.2)

`U.4/prime-choice` · theorem

Let A = O_{F,S}, 𝔮 a nonzero ideal of A, p a rational prime and n ≥ 0 maximal with μ_{p^n} ⊂ F. Every (a, b) ∈ W_𝔮 is 𝔮-equivalent to some (a₁, b₁) with a₁A = 𝔭₁𝔭₂ a product of two distinct primes of A, prime to p, with N𝔭_i ≢ 1 (mod p^{n+1}) (i = 1, 2).

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).

**Proof.**

1. Case A = 𝓞_F. By U.4/q-equivalence-smaller-ideal assume 𝔮 ⊆ p^{n+1}A, and move so that b ≠ 0. It suffices to find a₁ ≡ a mod bA with the property, since then (a₁, b) ∼_𝔮 (a, b).
2. P = {𝔭 prime to p : N𝔭 ≢ 1 mod p^{n+1}} is infinite by U.4/primes-with-norm-not-one (ζ_{p^{n+1}} ∉ F by maximality of n); choose 𝔭₁ ∈ P prime to b.
3. By U.4/dirichlet-theorem-number-field with 𝔞 = 𝔭₁: a₁ ≡ a mod bA, positive at the real places, with a₁A = 𝔭₁𝔭₂ for a prime 𝔭₂ ≠ 𝔭₁ prime to p (infinitely many choices).
4. N𝔭₁·N𝔭₂ = #(A/a₁A) = |N_{F/ℚ}(a₁)| (Mathlib's Ideal.absNorm_span_singleton) = N_{F/ℚ}(a₁), positive because a₁ is positive at the real places; and a₁ ≡ 1 mod 𝔮 ⊆ p^{n+1}A gives N_{F/ℚ}(a₁) ≡ 1 (mod p^{n+1}) (the norm is the determinant of multiplication by a₁ in an integral basis, which is ≡ 1 mod p^{n+1}). Since N𝔭₁ ≢ 1 and is prime to p, N𝔭₂ ≢ 1 (mod p^{n+1}).
5. General A = O_{F,S} = 𝓞_F[1/s] (U.4/s-integers-ring-of-fractions): by U.4/q-equivalence-ring-of-fractions replace (a, b) by a 𝔮-equivalent pair in W_{𝔮 ∩ 𝓞_F}, apply the first case with 𝔭₁, 𝔭₂ not dividing s, and read the 𝓞_F-equivalence in A; 𝔭_iA are distinct primes of A with the same residue fields.

**Acceptance.**

- F = ℚ, p = 2 (n = 1): a₁ = ℓ₁ℓ₂ with primes ℓ_i ≡ 3 (mod 4).
- F = ℚ(i), p = 2 (n = 2): primes of norm ≢ 1 mod 8, e.g. above rational primes ≡ 5 (mod 8).

**Depends on.** this roadmap: `U.4/q-equivalence-smaller-ideal`, `U.4/primes-with-norm-not-one`, `U.4/dirichlet-theorem-number-field`, `U.4/q-equivalence-ring-of-fractions`, `U.4/s-integers-ring-of-fractions`; libraries: `mathlib:Ideal.absNorm_span_singleton`, `mathlib:Algebra.norm`, `mathlib:NumberField.RingOfIntegers.basis`.

**Sources.**

- `BMS.1967`, Theorem 3.2, p. 72 (PDF p. 15): “Theorem 3.2. — Given (a, b) ∈ W_𝔮, we can find an (a₁, b₁) ∼_𝔮 (a, b) such that a₁A = p₁p₂, a product of distinct primes, which satisfy Np_i ≢ 1 mod p^{n+1}, i = 1, 2. In case k is a number field we can choose the p_i prime to p” — Statement (number-field part); transcribed from the scan.
- `BMS.1967`, Proof of Theorem 3.2, p. 73 (PDF p. 16): “Since b ≠ 0 and P is infinite we can choose a p₁ ∈ P prime to b. Then we can apply the Dirichlet Theorem (A.11) to find a₁ ≡ a mod b such that a₁ is positive at the real primes, and such that a₁A = p₁p₂ for some prime p₂.” — The main step.

### Reduction to p^n-th powers when A is not totally imaginary (Theorem 3.5, Case 1)

`U.4/power-reduction-non-totally-imaginary` · lemma

Let A = O_{F,S} be not totally imaginary (S ≠ ∅, or F has a real place), 𝔮 a nonzero ideal, p a rational prime and n ≥ 0 maximal with μ_{p^n} ⊂ F. For every (a, b) ∈ W_𝔮 there are q ∈ 𝔮, a₁ ∈ A with a₁ ≡ 1 mod 𝔮, and c ∈ A such that (a, b) ∼_𝔮 (a₁, c^{p^n}q).

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).
- Hilbert symbols (a, b / 𝔭)_m are those of BMS's Appendix (A.13)–(A.19): for a local field containing μ_m, (a, b / k)_m = σ(a^{1/m})/a^{1/m} with σ = (b, k_ab/k) the local reciprocity image of b — the transpose of the orientation (a, b)_v = Art_v(a)(ⁿ√b)/ⁿ√b used by ClassicalArithmeticCompletion CA.1. The local symbol, its nondegeneracy and the openness of k_𝔭^{×m} are requested from Tau Ceti ClassFieldTheory; the tame formula (A.16), the product formula (A.19)/(A.21) and the wild computation (A.17) are gaps (see gaps and restructure).
- 'Close at 𝔭' means multiplicatively congruent modulo p^n-th powers in F_𝔭^×, a congruence modulo an open subgroup of finite index.

**Proof.**

1. Take a non-complex place 𝔭_∞ ∈ S_∞ (a real place or a prime of S). By nondegeneracy of the Hilbert symbol at 𝔭_∞ (requested) choose u, v ∈ F_{𝔭_∞}^× with (u, v / 𝔭_∞)_{p^n} a generator of μ_{p^n}.
2. Choose 0 ≠ q ∈ 𝔮 with qA ⊆ 𝔮 and, by U.4/q-equivalence-smaller-ideal, (a′, b′q) ∈ W_{qA} 𝔮-equivalent to (a, b), with b′ ≠ 0 and a′ prime to p.
3. U.4/dirichlet-theorem-arithmetic-type gives a prime b₁A with b₁ ≡ b′ mod a′, b₁ close to v at 𝔭_∞, and close to 1 at all other places of S_∞ and at the primes of F over p; so b₁A is prime to p.
4. Choose i > 0 with (a′, b₁ / b₁A)_{p^n}·(u, v / 𝔭_∞)_{p^n}^i = 1, and by the same theorem a prime a₁A, prime to p, with a₁ ≡ a′ mod b₁q and a₁ close to u^i at 𝔭_∞.
5. Reciprocity (A.21) (gap): (b₁/a₁)_{p^n} = ∏_{𝔭 ∤ a₁} (a₁, b₁ / 𝔭)_{p^n}. The conditions on b₁ remove every place of S_∞ except 𝔭_∞ and the primes over p; the tame formula (A.16) (gap) removes the other finite primes except b₁A. So (b₁/a₁)_{p^n} = (a₁, b₁ / b₁A)_{p^n}(a₁, b₁ / 𝔭_∞)_{p^n} = (a′, b₁ / b₁A)_{p^n}(u^i, v / 𝔭_∞)_{p^n} = 1.
6. Hence b₁ ≡ c^{p^n} mod a₁ for some c ∈ A, and (a, b) ∼_𝔮 (a′, b′q) ∼_𝔮 (a′, b₁q) ∼_𝔮 (a₁, b₁q) ∼_𝔮 (a₁, c^{p^n}q); a₁ ≡ a′ ≡ 1 mod 𝔮. (BMS print the last pair as (a₂, c^{p^n}q); see sourceIssues.)

**Acceptance.**

- If n = 0 (no p-th roots of unity), the conclusion is (a, b) ∼_𝔮 (a₁, cq) with nothing to prove beyond Lemma 2.2.
- F = ℚ, p = 2, 𝔭_∞ the real place: (−1, −1 / ℝ)₂ = −1 generates μ₂ (BMS (A.15)).

**Depends on.** this roadmap: `U.4/q-equivalence-smaller-ideal`, `U.4/dirichlet-theorem-arithmetic-type`, `U.4/mennicke-symbol`.

**Sources.**

- `BMS.1967`, Theorem 3.5, p. 74 (PDF p. 17): “Theorem 3.5. — Suppose (a, b) ∈ W_𝔮. Let p be a prime number, and let n be the largest integer such that k contains μ_{p^n}. Then there exist q ∈ 𝔮, a₁ ≡ 1 mod 𝔮, and c ∈ A, such that (a, b) ∼_𝔮 (a₁, c^{p^n}q), except in the following case:” — Statement; the exceptional case (A totally imaginary with a nontrivial power residue symbol) does not arise here.
- `BMS.1967`, Proof of Theorem 3.5, Case 1, p. 74 (PDF p. 17): “Then there is a non-complex (i.e. either real or finite) p_∞ ∈ S_∞, and the non degeneracy of the Hilbert symbol shows that we can find u, v ∈ k*_{p_∞} such that (u, v / p_∞)_{p^n} generates μ_{p^n}.” — The first step; the rest of Case 1 is on pp. 74–75.

### Reduction to p^n-th powers for totally imaginary A with j_p = 0 (Theorem 3.5, Cases 2–3)

`U.4/power-reduction-totally-imaginary` · lemma

Let F be totally complex and A = 𝓞_F (S = ∅), p a rational prime, n ≥ 0 maximal with μ_{p^n} ⊂ F, and for a nonzero ideal 𝔮 put j_p(𝔮) = min_{𝔭 | p} [ord_𝔭(𝔮)/ord_𝔭(p) − 1/(p − 1)]_{[0,n]}, where [x]_{[0,n]} is the integer in [0, n] nearest to the largest integer ≤ x. If j_p(𝔮) = 0 — in particular for 𝔮 = A — then every (a, b) ∈ W_𝔮 is 𝔮-equivalent to (a₁, c^{p^n}q) with q ∈ 𝔮, a₁ ≡ 1 mod 𝔮 and c ∈ A.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).
- Hilbert symbols (a, b / 𝔭)_m are those of BMS's Appendix (A.13)–(A.19): for a local field containing μ_m, (a, b / k)_m = σ(a^{1/m})/a^{1/m} with σ = (b, k_ab/k) the local reciprocity image of b — the transpose of the orientation (a, b)_v = Art_v(a)(ⁿ√b)/ⁿ√b used by ClassicalArithmeticCompletion CA.1. The local symbol, its nondegeneracy and the openness of k_𝔭^{×m} are requested from Tau Ceti ClassFieldTheory; the tame formula (A.16), the product formula (A.19)/(A.21) and the wild computation (A.17) are gaps (see gaps and restructure).
- The case j_p(𝔮) > 0, which needs the power residue Mennicke symbol of BMS Proposition 3.1, is not needed for SK₁ and is not planned.

**Proof.**

1. Reduction (Case 2): if 𝔮 is not divisible by every prime over p, let 𝔮′ ⊆ 𝔮 be the largest ideal in 𝔮 divisible by all of them; ord_𝔭(𝔮′) = 1 for some 𝔭 | p, so j_p(𝔮′) = 0, and U.4/q-equivalence-smaller-ideal moves (a, b) into W_{𝔮′}. So assume 𝔮 divisible by every 𝔭 | p and j_p(𝔮) = 0 (Case 3); the power residue symbol (·)_{p^j} is then trivial.
2. Lemma 3.4(a) for j = 0: there are 𝔭₀ | p, u ≡ 1 mod 𝔮 and v ∈ U_{𝔭₀} with (u, v / 𝔭₀)_{p^n} generating μ_{p^n}, by the local computation (A.17) (gap): (U_{𝔭₀}(h), U_{𝔭₀} / 𝔭₀)_{p^n} = μ_{p^{n−j}}, h = ord_{𝔭₀}(q).
3. Choose q ∈ 𝔮 with ord_𝔭(q) = ord_𝔭(𝔮) for all 𝔭 | p and (a′, b′q) ∈ W_{qA} 𝔮-equivalent to (a, b). By U.4/dirichlet-theorem-arithmetic-type take a prime b₁A, prime to 𝔮, with b₁ ≡ b′ mod a′, b₁ close to v at 𝔭₀ and close to 1 at the other 𝔭 | p.
4. Choose i ≥ 0 with (u, v / 𝔭₀)_{p^n}^i (a′, b₁ / b₁)_{p^n} = 1, and a prime a₁ ≡ a′ mod b₁q close to u^i at 𝔭₀ (compatible because u ≡ 1 mod 𝔭₀^h and b₁ is prime to 𝔮).
5. Reciprocity (A.21) and the tame formula (A.16) (gaps), with F totally imaginary: (b₁/a₁)_{p^n} = (a₁, b₁ / b₁)_{p^n}(a₁, b₁ / 𝔭₀)_{p^n} = (a′, b₁ / b₁)_{p^n}(u^i, v / 𝔭₀)_{p^n} = 1, using (A.16) to see that (a₁, b₁ / b₁)_{p^n} depends on a₁ only modulo b₁.
6. So b₁ is a p^n-th power modulo a₁ and (a₁, b₁q) ∼_𝔮 (a₁, c^{p^n}q); also (a₁, b₁q) ∼_𝔮 (a′, b₁q) ∼_𝔮 (a′, b′q) ∼_𝔮 (a, b).

**Acceptance.**

- 𝔮 = A: j_p(A) = [−1/(p − 1)]_{[0,n]} = 0 for every p, so the lemma applies to all of W_A.
- F = ℚ(i), p = 2, n = 2: for 𝔮 = A the conclusion is (a, b) ∼ (a₁, c⁴q).

**Depends on.** this roadmap: `U.4/q-equivalence-smaller-ideal`, `U.4/dirichlet-theorem-arithmetic-type`, `U.4/mennicke-symbol`; libraries: `mathlib:NumberField.IsTotallyComplex`.

**Sources.**

- `BMS.1967`, (3.3) and Lemma 3.4, p. 74 (PDF p. 17): “Lemma 3.4. — a) With j = j_p(𝔮), there is a prime p₀ dividing p, a u ≡ 1 mod 𝔮, and a v ∈ U_{p₀}, such that (u, v / p₀)_{p^n} generates μ_{p^{n−j}}.” — Lemma 3.4(a), used with j = 0; (3.3) defines j_p(𝔮). Transcribed from the scan.
- `BMS.1967`, Proof of Theorem 3.5, Case 2, p. 75 (PDF p. 18): “Case 2. — A is totally imaginary, but 𝔮 is not divisible by every prime dividing p. Let 𝔮′ ⊂ 𝔮 be the largest ideal in 𝔮 which is so divisible. Then ord_p(𝔮′) = 1 for at least one p dividing p, so it follows that j_p(𝔮′) = j_p(𝔮) = 0” — The reduction to Case 3; Case 3 is on pp. 75–77.

### Reduction of Mennicke pairs to p^n-th powers (Theorem 3.5)

`U.4/power-reduction` · theorem

Let A = O_{F,S}, 𝔮 a nonzero ideal, p a prime and n ≥ 0 maximal with μ_{p^n} ⊂ F. Suppose A is not totally imaginary, or A is totally imaginary and j_p(𝔮) = 0. Then every (a, b) ∈ W_𝔮 is 𝔮-equivalent to some (a₁, c^{p^n}q) with q ∈ 𝔮, a₁ ≡ 1 mod 𝔮 and c ∈ A.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).
- This is BMS Theorem 3.5 outside its exceptional case, restricted to the cases in which the power residue symbol (b/a)_{p^j} is trivial; for totally imaginary A and j_p(𝔮) > 0 BMS's theorem has a further hypothesis that is not needed here.

**Proof.**

1. If A is not totally imaginary apply U.4/power-reduction-non-totally-imaginary.
2. If A is totally imaginary, then S = ∅ and F is totally complex, and U.4/power-reduction-totally-imaginary applies since j_p(𝔮) = 0.

**Acceptance.**

- 𝔮 = A: the hypothesis holds for every ring of S-integers and every p.
- A = ℤ: F = ℚ has a real place, so the theorem holds for all q.

**Depends on.** this roadmap: `U.4/power-reduction-non-totally-imaginary`, `U.4/power-reduction-totally-imaginary`.

**Sources.**

- `BMS.1967`, Theorem 3.5, p. 74 (PDF p. 17): “except in the following case: A is totally imaginary and (b/a)_{p^j} ≠ 1, where j = j_p(𝔮).” — The exceptional case, which the hypothesis j_p(𝔮) = 0 excludes.

### Finite subsets of C_𝔮 lie in finite cyclic subgroups

`U.4/mennicke-group-locally-cyclic` · lemma

Let A = O_{F,S} and 𝔮 a nonzero ideal. Every finite subset of the universal Mennicke group C_𝔮 lies in a finite cyclic subgroup.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).

**Proof.**

1. By U.4/mennicke-symbol-residue-map (d), finitely many generators [b_i/a_i] lie in the image of one map (2.8) U(A/aA) → C_𝔮, with a free to vary in a progression a + tcq, c prime to a.
2. By U.4/dirichlet-theorem-number-field (𝔞 = A) choose a in that progression with aA prime; then U(A/aA) = (A/aA)^× is the unit group of a finite field, hence cyclic (Mathlib's isCyclic_subgroup_units) and finite.
3. The map (2.8) is a homomorphism (U.4/mennicke-symbol-residue-homomorphism), so its image is a finite cyclic subgroup containing the given symbols; the symbols generate C_𝔮.

**Acceptance.**

- For A = ℤ every such subgroup is trivial (C_ℤ = 1).
- Step (i) of the proof of BMS Theorem 3.6.

**Depends on.** this roadmap: `U.4/mennicke-symbol-residue-map`, `U.4/mennicke-symbol-residue-homomorphism`, `U.4/dirichlet-theorem-number-field`, `U.4/universal-mennicke-group`; libraries: `mathlib:isCyclic_subgroup_units`.

**Sources.**

- `BMS.1967`, Proof of Theorem 3.6, (i), p. 77 (PDF p. 20): “In the homomorphism (2.8) we can use (2.7) d) and the Dirichlet Theorem to make aA prime. Then U(A/aA) is cyclic, so we conclude from (2.7) d) that: (i) Every finite subset of C lies in a finite cyclic subgroup.” — The statement and its proof.

### C_𝔮 is cyclic of order dividing the number of roots of unity

`U.4/mennicke-group-exponent` · lemma

Let A = O_{F,S}, 𝔮 a nonzero ideal and m = #μ(F) the number of roots of unity in F. Then C_𝔮 is a cyclic group of order dividing m.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).

**Proof.**

1. Fix a prime p, write m = p^n m′ with p ∤ m′ (so n is maximal with μ_{p^n} ⊂ F), and let (a, b) ∈ W_𝔮.
2. By U.4/prime-choice, (a, b) ∼_𝔮 (a₁, b₁) with a₁A = 𝔭₁𝔭₂, N𝔭_i ≢ 1 mod p^{n+1}; then U(A/a₁A) ≅ (A/𝔭₁)^× × (A/𝔭₂)^× (Chinese remainder), a product of cyclic groups of orders N𝔭_i − 1, has no element of order p^{n+1}.
3. With q = 1 − a₁ ∈ 𝔮, (a₁, b₁) ∼_𝔮 (a₁, b₁q) (U.4/q-equivalence-to-base-point), so [b/a] = [b₁q/a₁] lies in the image of the homomorphism (2.8) for a₁ (U.4/mennicke-symbol-residue-homomorphism) and has no element of order p^{n+1} in its cyclic span.
4. Over all p: every element of C_𝔮 has finite order (U.4/mennicke-group-locally-cyclic) dividing m, so C_𝔮 has exponent dividing m; a group in which every finite subset lies in a cyclic subgroup and whose exponent divides m is cyclic of order dividing m.

**Acceptance.**

- F = ℚ: m = 2, so C_𝔮 has order at most 2 before U.4/arithmetic-mennicke-symbols-trivial shows it is trivial.
- Step (ii) of the proof of BMS Theorem 3.6.

**Depends on.** this roadmap: `U.4/prime-choice`, `U.4/q-equivalence-to-base-point`, `U.4/mennicke-symbol-residue-homomorphism`, `U.4/mennicke-group-locally-cyclic`; libraries: `mathlib:NumberField.Units.torsion`.

**Sources.**

- `BMS.1967`, Proof of Theorem 3.6, (ii), p. 77 (PDF p. 20): “Consequently C has no elements of order p^{n+1}. Letting p range now over all rational primes we conclude from this and (i) that C has exponent m, i.e. x^m = 1 for all x ∈ C. It follows easily from this and (i) that: (ii) C is a cyclic group of order dividing m.” — The statement and the end of its proof.

### Mennicke symbols of rings of S-integers are trivial (Theorem 3.6)

`U.4/arithmetic-mennicke-symbols-trivial` · theorem · planet “Arithmetic Mennicke symbols”

Let A = O_{F,S}. (a) If A is not totally imaginary (S ≠ ∅ or F has a real place), then C_𝔮 = 1 for every nonzero ideal q: every Mennicke symbol on W_𝔮 is trivial. (b) If A is totally imaginary (S = ∅, F totally complex), then C_𝔮 = 1 for every nonzero q with j_p(𝔮) = 0 for all primes p. In particular C_A = 1 for every ring of S-integers.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).
- BMS Theorem 3.6 also computes C_𝔮 ≅ μ_{r(𝔮)} for totally imaginary A and all 𝔮 (with r(A) = 1); the lower bound, which needs the power residue symbol of Proposition 3.1, is not needed for SK₁ and is not planned.

**Proof.**

1. By U.4/mennicke-group-exponent, C_𝔮 is cyclic of order dividing m = #μ(F).
2. Fix p and write m = p^n m′. By U.4/power-reduction (its hypothesis holds in both (a) and (b)), each (a, b) ∈ W_𝔮 is 𝔮-equivalent to (a₁, c^{p^n}q) with a₁ ≡ 1 mod 𝔮, so [b/a] = [c^{p^n}q/a₁] = [cq/a₁]^{p^n} (U.4/mennicke-symbol-residue-homomorphism, the map (2.8) being a homomorphism).
3. A p^n-th power in a cyclic group of order dividing p^n m′ has order prime to p. As p is arbitrary, every generator [b/a] is trivial, so C_𝔮 = 1.
4. For 𝔮 = A, j_p(A) = 0 for all p (U.4/power-reduction-totally-imaginary), so C_A = 1 in every case.

**Acceptance.**

- A = ℤ: C_𝔮 = 1 for all 𝔮 ≠ 0 (ℚ has a real place), which with BMS Theorem 4.1 is the congruence subgroup property of SL_n(ℤ), n ≥ 3.
- A = ℤ[i]: C_A = 1, while C_𝔮 ≅ μ₄ ≠ 1 for 𝔮 = 16ℤ[i] (BMS: r(𝔮) = 4 when m² divides 𝔮); the relative groups do not vanish, only C_A does.
- The hypothesis 'arithmetic type' cannot be dropped: for ℝ[x, y]/(x² + y² − 1), C_A ≠ 1 (BMS Example 4.4).

**Depends on.** this roadmap: `U.4/mennicke-group-exponent`, `U.4/power-reduction`, `U.4/mennicke-symbol-residue-homomorphism`, `U.4/universal-mennicke-group`.

**Sources.**

- `BMS.1967`, Theorem 3.6, p. 77 (PDF p. 20): “Theorem 3.6. — If A is not totally imaginary then, for all ideals 𝔮 ≠ 0, all Mennicke symbols on W_𝔮 are trivial; i.e. C_𝔮 = {1}.” — Part (a); transcribed from the scan.
- `BMS.1967`, Proof of Theorem 3.6, pp. 77–78 (PDF pp. 20–21): “Then if [b/a] ∈ C_p ∩ ker f we have (b/a)_{p^j} = 1, so it follows from Theorem 3.5 that (a, b) ∼_𝔮 (a₁, c^{p^n}q). As above, we see that [b/a] = 1 since it is a p^n-th power in the group C_p which has exponent p^n, according to (ii).” — The totally imaginary case; for 𝔮 = A, r(A) = 1 and f is trivial.
- `BMS.1967`, After Corollary 4.3, p. 96 (PDF p. 39): “Parts b) and c) follow from Theorem 4.1 combined with Theorem 3.6. These imply C_A = {1} in all cases” — C_A = 1 for every Dedekind ring of arithmetic type.

### SK₁ of a ring of S-integers vanishes (Bass–Milnor–Serre)

`U.4/bass-milnor-serre` · theorem · planet “Bass–Milnor–Serre theorem”

Let F be a number field and S a finite set of nonzero primes of 𝓞_F. Then SK₁(O_{F,S}) = 0, i.e. SL(O_{F,S}) = E(O_{F,S}) (U.1, U.3). For F = ℚ and S = ∅ this is SK₁(ℤ) = 0.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).
- The finite-rank equality SL_n(O_{F,S}) = E_n(O_{F,S}) for n ≥ 3 (BMS Corollary 4.3(a)) needs BMS's injective stability (Theorem 4.1) and is not planned; the stable statement is what K₁ requires.

**Proof.**

1. O_{F,S} is a Dedekind domain (Tau Ceti's instance on Set.integer), so it has stable range at most 2 (U.4/dedekind-stable-range-two).
2. By U.4/sk1-generated-by-mennicke-symbols, C_A → SK₁(A) is surjective for A = O_{F,S}.
3. By U.4/arithmetic-mennicke-symbols-trivial, C_A = 1. Hence SK₁(A) = 0.

**Acceptance.**

- F = ℚ, S = ∅: SK₁(ℤ) = 0, agreeing with Tau Ceti's SL_n(ℤ) generation (U.6/K1-integers).
- F = ℚ, S = {(p)}: SK₁(ℤ[1/p]) = 0, agreeing with the Euclidean route of U.6/K1-integers-away-from-p.
- K-book III.1.3.6 states the theorem for integrally closed subrings of number fields.
- An arbitrary Dedekind domain does not qualify: SK₁(ℝ[x, y]/(x² + y² − 1)) ≠ 0 (U.3/SK1-real-circle-nonzero).

**Depends on.** this roadmap: `U.4/dedekind-stable-range-two`, `U.4/sk1-generated-by-mennicke-symbols`, `U.4/arithmetic-mennicke-symbols-trivial`, `U.3/special-K1`, `U.3/special-linear-mod-elementary`; libraries: `mathlib:Set.integer`.

**Sources.**

- `Kbook.2013`, Example III.1.3.6 (PDF p. 191; book p. 183): “If F is a finite field extension of Q (a number field) and R is an integrally closed subring of F, then Bass, Milnor and Serre proved in [19, 4.3] that SK1(R) = 0, so that K1(R) ≅ R×.” — The theorem as the K-book cites it.
- `BMS.1967`, Corollary 4.3, p. 95 (PDF p. 38): “Corollary 4.3. — Suppose that A is of arithmetic type and that n ≥ 3. a) SL_n(A) is equal to E_n(A) and it is a finitely generated group, equal to its own commutator subgroup. b) If A is not totally imaginary then C_𝔮 = {1} for all q.” — BMS's statement; the stable consequence SK₁(A) = 0 is what this node proves.

### K₁ of a ring of S-integers is its unit group

`U.4/K1-S-integers-determinant` · comparison

Let F be a number field and S a finite set of nonzero primes of 𝓞_F. The stable determinant det : K₁(O_{F,S}) → O_{F,S}^× (U.3) is an isomorphism, with inverse u ↦ [u] the class of u ∈ GL₁(O_{F,S}); composed with Mathlib's Set.unitEquivUnitsInteger it identifies K₁(O_{F,S}) with the S-unit group Set.unit S F. The identification is canonical and natural: for S ⊆ S′ the map K₁(O_{F,S}) → K₁(O_{F,S′}) is the inclusion of S-units (Tau Ceti's Set.unit_mono).

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).

**Proof.**

1. U.3/K1-units-split gives K₁(A) ≅ A^× × SK₁(A) naturally in the commutative ring A, the first factor split by U.3/units-to-K1.
2. SK₁(O_{F,S}) = 0 by U.4/bass-milnor-serre, so det is an isomorphism with inverse the unit section.
3. Naturality of det (U.3/stable-determinant) for the inclusion O_{F,S} ⊆ O_{F,S′} gives the last statement.

**Acceptance.**

- F = ℚ, S = ∅: K₁(ℤ) ≅ {±1} (U.6/K1-integers).
- F = ℚ, S = {(p)}: K₁(ℤ[1/p]) ≅ {±p^k} (U.6/K1-integers-away-from-p).
- The identification is not a general rule for commutative rings: SK₁ ≠ 0 for ℝ[x, y]/(x² + y² − 1) (U.3/SK1-real-circle-nonzero).

**Depends on.** this roadmap: `U.4/bass-milnor-serre`, `U.3/K1-units-split`, `U.3/units-to-K1`, `U.3/stable-determinant`; libraries: `mathlib:Set.unitEquivUnitsInteger`, `tauceti:Set.unit_mono`.

**Sources.**

- `Kbook.2013`, Example III.1.3.6 (PDF p. 191; book p. 183): “If F is a finite field extension of Q (a number field) and R is an integrally closed subring of F, then Bass, Milnor and Serre proved in [19, 4.3] that SK1(R) = 0, so that K1(R) ≅ R×.” — The isomorphism K₁(R) ≅ R^× for rings of S-integers.

### Dirichlet's S-unit theorem

`U.4/s-unit-theorem` · theorem · planet “Dirichlet's S-unit theorem”

Let F be a number field with r₁ real and r₂ complex places (Mathlib's NumberField.InfinitePlace.nrRealPlaces and nrComplexPlaces) and S a finite set of nonzero primes of 𝓞_F. Then O_{F,S}^× ≅ Set.unit S F is a finitely generated abelian group; its torsion subgroup is the image of μ(F) = NumberField.Units.torsion F, all roots of unity of F; and its rank, finrank ℤ of Additive(O_{F,S}^×) modulo torsion, is r₁ + r₂ + |S| − 1. With Bass–Milnor–Serre's S_∞ = S ∪ {archimedean places} the rank is |S_∞| − 1, the K-book's s − 1.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).
- The stage's |S| counts the finite places in S; the archimedean places contribute r₁ + r₂.

**Proof.**

1. Finite generation: Tau Ceti's instance Set.unit_fg_of_units, from Mathlib's Monoid.FG (𝓞 F)^×.
2. Left exactness: the S-valuation map Set.unitValuation : S.unit F → ℤ^S (Tau Ceti) has kernel the ∅-units (Set.unitValuation_ker), which are (𝓞 F)^× (Set.unitEmptyEquivUnits).
3. Finite index of the image: for v ∈ S, v^{h_v} = (a_v) with a_v ∈ 𝓞_F (finite class group, ClassGroup.mk0_eq_one_iff); a_v is an S-unit whose valuation vector is h_v times the basis vector of v (up to the sign convention of valuationOfNeZero), so the image contains a subgroup of finite index of ℤ^S.
4. Ranks add along 1 → (𝓞 F)^× → O_{F,S}^× → image → 1 (tensor with ℚ, which is flat over ℤ): rank = rank (𝓞 F)^× + |S| = (r₁ + r₂ − 1) + |S|, by Mathlib's NumberField.Units.finrank_eq, NumberField.Units.rank = card(InfinitePlace F) − 1 and NumberField.InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces.
5. Torsion: a torsion element of F^× is a root of unity, integral over ℤ, hence in (𝓞 F)^× and in its torsion subgroup (NumberField.Units.mem_torsion).

**Acceptance.**

- F = ℚ, S = {(p)}: rank 1 + 0 + 1 − 1 = 1 and torsion {±1}: ℤ[1/p]^× = {±p^k}.
- F = ℚ(i), S = {(1 + i)}: rank 0 + 1 + 1 − 1 = 1, torsion μ₄: ℤ[i][1/2]^× = ⟨i⟩ × (1 + i)^ℤ.
- S = ∅ recovers Mathlib's unit theorem, rank r₁ + r₂ − 1.
- The K-book's Classical Data VI.8.1 misprints the rank as r₂ + |S| − 1; Weibel's errata correct it to r₁ + r₂ + |S| − 1 (recorded in the ArithmeticKTheory N.1 packet).

**Depends on.** libraries: `tauceti:Set.unit_fg_of_units`, `tauceti:Set.unitValuation`, `tauceti:Set.unitValuation_ker`, `tauceti:Set.unitEmptyEquivUnits`, `mathlib:NumberField.Units.finrank_eq`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.InfinitePlace.card_eq_nrRealPlaces_add_nrComplexPlaces`, `mathlib:NumberField.Units.torsion`, `mathlib:NumberField.Units.mem_torsion`, `mathlib:ClassGroup.mk0_eq_one_iff`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:Set.unitEquivUnitsInteger`.

**Sources.**

- `Kbook.2013`, Example III.1.3.6 (PDF p. 191; book p. 183): “We mention that if R is finitely generated over Z then, by the Dirichlet Unit Theorem, K1(R) = R× is a finitely generated abelian group isomorphic to µ(F) ⊕Zs−1, where µ(F) denotes the cyclic group of all roots of unity in F” — The S-unit theorem with s = r₁ + r₂ + |S| the number of places at infinity for R.

### Fundamental S-units and the decomposition of the S-units

`U.4/fundamental-s-units` · construction

Let F be a number field, S a finite set of nonzero primes of 𝓞_F and r = r₁ + r₂ + |S| − 1. A system of fundamental S-units is a family ε₁, …, ε_r ∈ O_{F,S}^× whose images form a ℤ-basis of O_{F,S}^×/μ(F); one exists because that quotient is finitely generated and torsion-free of rank r (U.4/s-unit-theorem; Mathlib's Module.free_of_finite_type_torsion_free'). A choice gives the isomorphism μ(F) × ℤ^r ≃* O_{F,S}^×, (ζ, e) ↦ ζ·∏ ε_i^{e_i}. For S = ∅ one may take Mathlib's NumberField.Units.fundSystem, and the isomorphism is Tau Ceti's NumberField.unitsMulEquivTorsionProdMultiplicative. The decomposition depends on the choice; the torsion subgroup μ(F) and the rank r do not.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).

**Proof.**

1. Take a ℤ-basis of the free module Additive(O_{F,S}^×/torsion) (Module.Free.chooseBasis) and lift it (Quotient.out), as Mathlib does for S = ∅ (basisModTorsion, fundSystem).
2. The map (ζ, e) ↦ ζ∏ε_i^{e_i} is a homomorphism; it is bijective because every u has a unique image in the free quotient and the kernel of O_{F,S}^× → quotient is μ(F).
3. For S = ∅ transport along Set.unitEquivUnitsInteger and IsDedekindDomain.integer_empty to compare with Tau Ceti's equivalence.

**API.**

- `NumberField.SUnits.IsFundamentalSystem` (data): The predicate that a family Fin r → O_{F,S}^× maps to a ℤ-basis of the quotient by torsion.
- `NumberField.SUnits.exists_isFundamentalSystem` (constructor): A fundamental system exists.
- `NumberField.SUnits.mulEquivTorsionProd` (equivalence): For a fundamental system ε, μ(F) × Multiplicative (Fin r → ℤ) ≃* O_{F,S}^×.
- `NumberField.SUnits.mulEquivTorsionProd_apply` (simp): The equivalence sends (ζ, e) to ζ·∏ ε_i^{e_i}.
- `NumberField.SUnits.exist_unique_eq_mul_prod` (characterisation): Every S-unit is uniquely ζ·∏ ε_i^{e_i}.
- `NumberField.SUnits.mulEquivTorsionProd_empty` (compatibility): For S = ∅ and ε = fundSystem it is Tau Ceti's unitsMulEquivTorsionProdMultiplicative.

**Unit tests.**

- `NumberField.SUnits.rat_p` (computation): F = ℚ, S = {(p)}: r = 1, ε₁ = p is fundamental, and ℤ[1/p]^× ≃ {±1} × ℤ.
- `NumberField.SUnits.gauss` (computation): F = ℚ(i), S = {(1 + i)}: r = 1, ε₁ = 1 + i, torsion ⟨i⟩ of order 4.
- `NumberField.SUnits.rat_empty` (degenerate): F = ℚ, S = ∅: r = 0, and the decomposition is ℤ^× = {±1} = μ(ℚ).
- `NumberField.SUnits.not_canonical` (non-example): For F = ℚ(√2), S = ∅, both 1 + √2 and 1 − √2 = −(1 + √2)⁻¹ are fundamental, and the two isomorphisms differ: the splitting is not canonical.
- `NumberField.SUnits.empty_compat` (compatibility): For S = ∅ the decomposition with fundSystem agrees with Tau Ceti's NumberField.unitsMulEquivTorsionProdMultiplicative after Set.unitEquivUnitsInteger.

**Acceptance.**

- F = ℚ, S = {(p)}: ε₁ = p.
- F = ℚ(√2), S = ∅: ε₁ = 1 + √2 or 1 − √2.

**Used by.**

- U.4 stage text: O_{F,S}^× ≅ μ(F) ⊕ ℤ^{r₁+r₂+|S|−1}, 'where the second decomposition depends on a choice of fundamental units'
- U.4/K1-S-integers-structure: transports the decomposition to K₁(O_{F,S})
- ArithmeticKTheory N.1/K1-of-S-integers-and-the-determinant: the rank and torsion of K₁(O_{F,S}) contrasted with K₁(F)
- U.6/K1-integers-away-from-p: the case F = ℚ, S = {(p)}

**Depends on.** this roadmap: `U.4/s-unit-theorem`; libraries: `mathlib:Module.free_of_finite_type_torsion_free'`, `mathlib:NumberField.Units.fundSystem`, `mathlib:NumberField.Units.exist_unique_eq_mul_prod`, `tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative`, `mathlib:IsDedekindDomain.integer_empty`.

**Sources.**

- `Kbook.2013`, Example III.1.3.6 (PDF p. 191; book p. 183): “K1(R) = R× is a finitely generated abelian group isomorphic to µ(F) ⊕Zs−1” — The decomposition; it depends on a basis of the free part, as the stage text says.

### The structure of K₁ of a ring of S-integers

`U.4/K1-S-integers-structure` · theorem

Let F be a number field and S a finite set of nonzero primes. K₁(O_{F,S}) is a finitely generated abelian group, with torsion μ(F) and rank r₁ + r₂ + |S| − 1; a system of fundamental S-units gives K₁(O_{F,S}) ≅ μ(F) ⊕ ℤ^{r₁+r₂+|S|−1}. The first identification K₁(O_{F,S}) ≅ O_{F,S}^× is canonical; this decomposition is not.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).

**Proof.**

1. Compose U.4/K1-S-integers-determinant with U.4/s-unit-theorem and U.4/fundamental-s-units.

**Acceptance.**

- F = ℚ, S = {(2)}: K₁(ℤ[1/2]) ≅ ℤ/2 ⊕ ℤ.
- ArithmeticKTheory N.1 imports this node and contrasts it with K₁(F) = F^×, which is not finitely generated.

**Depends on.** this roadmap: `U.4/K1-S-integers-determinant`, `U.4/s-unit-theorem`, `U.4/fundamental-s-units`.

**Sources.**

- `Kbook.2013`, Example III.1.3.6 (PDF p. 191; book p. 183): “We mention that if R is finitely generated over Z then, by the Dirichlet Unit Theorem, K1(R) = R× is a finitely generated abelian group isomorphic to µ(F) ⊕Zs−1” — The statement.

### K₁ of the S-integers inside K₁ of the field

`U.4/K1-S-integers-into-field` · comparison

Let F be a number field and S finite. Under the determinant identifications K₁(O_{F,S}) ≅ O_{F,S}^× (U.4) and K₁(F) ≅ F^× (U.3/SK1-field), the map K₁(O_{F,S}) → K₁(F) induced by the inclusion O_{F,S} ⊆ F is the inclusion of S-units Set.unit S F ≤ F^×. In particular it is injective.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).

**Proof.**

1. Naturality of the determinant (U.3/stable-determinant) for O_{F,S} → F, and injectivity of units of a subring.
2. Both determinants are isomorphisms (U.4/K1-S-integers-determinant, U.3/SK1-field).

**Acceptance.**

- F = ℚ, S = ∅: K₁(ℤ) = {±1} ↪ ℚ^× = K₁(ℚ).
- The map is never surjective (F^× is not finitely generated); that contrast is ArithmeticKTheory N.1's.

**Depends on.** this roadmap: `U.4/K1-S-integers-determinant`, `U.3/SK1-field`, `U.3/stable-determinant`; libraries: `mathlib:Set.unitEquivUnitsInteger`.

**Sources.**

- `Kbook.2013`, Example III.1.3.5 (PDF p. 191; book p. 183): “Example 1.3.5. If F is a field then K1(F) = F×, because we have already seen that E(F) = SL(F).” — K₁ of the fraction field.
- `Kbook.2013`, Example III.1.3.6 (PDF p. 191; book p. 183): “Bass, Milnor and Serre proved in [19, 4.3] that SK1(R) = 0, so that K1(R) ≅ R×.” — K₁ of the S-integers.

### Specialisation of K₁ of the S-integers to residue fields and local rings

`U.4/K1-S-integers-residue-and-local` · comparison

Let F be a number field, S finite, A = O_{F,S} and 𝔭 a nonzero prime of A (a prime of 𝓞_F outside S, Tau Ceti's IsDedekindDomain.integerHeightOneSpectrumEquiv). Under the determinant identifications: (i) K₁(A) → K₁(A/𝔭) is the reduction of units A^× → (A/𝔭)^× = k(𝔭)^×, with K₁ of the finite residue field cyclic of order N𝔭 − 1 (U.6/K1-finite-field); (ii) K₁(A) → K₁(A_𝔭) for the local ring A_𝔭 = Localization.AtPrime 𝔭 (a discrete valuation ring) is the inclusion A^× ⊆ A_𝔭^×, injective; (iii) the same holds for the completion 𝒪_v = v.adicCompletionIntegers F (a complete discrete valuation ring, local), through the ring map O_{F,S} → 𝒪_v induced by F → F_v, whose image is integral because v ∉ S; v is the height-one prime of 𝔭 under IsDedekindDomain.integerHeightOneSpectrumEquiv. The reduction map need not be surjective.

**Hypotheses.**

- Conventions of U.4: F is a number field, 𝓞_F = NumberField.RingOfIntegers F, and S is a finite set of nonzero primes of 𝓞_F (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), S.Finite) — the finite places; O_{F,S} is Mathlib's Set.integer S F. This is the convention of ArithmeticKTheory N.1 and of K2SymbolsBrauer T.5. Bass–Milnor–Serre's S_∞ is S together with the archimedean places, and their 'Dedekind ring of arithmetic type defined by S_∞' is O_{F,S}; it is 'totally imaginary' exactly when S = ∅ and F is totally complex (Mathlib's NumberField.IsTotallyComplex).
- Local and semilocal rings have SK₁ = 1 by U.3/SK1-local; finite fields by U.3/SK1-field.

**Proof.**

1. Each target has K₁ = units by det: U.3/SK1-field for k(𝔭), U.3/SK1-local for A_𝔭 and the completion.
2. Naturality of det (U.3/stable-determinant) identifies each K₁-map with the map on units.
3. Units of A inject into A_𝔭 and into the completion because A is a domain contained in them.

**Acceptance.**

- A = ℤ, 𝔭 = (p), p ≥ 5: K₁(ℤ) = {±1} → K₁(𝔽_p) = 𝔽_p^× is the inclusion of {±1}, not surjective.
- A = ℤ[1/2], 𝔭 = (3): K₁(ℤ[1/2]) → 𝔽₃^× sends −1 ↦ −1 and 2 ↦ −1, surjective.
- A = ℤ, 𝔭 = (p): K₁(ℤ) → K₁(ℤ_(p)) = ℤ_(p)^× is the inclusion of {±1}.

**Depends on.** this roadmap: `U.4/K1-S-integers-determinant`, `U.3/SK1-field`, `U.3/SK1-local`, `U.3/stable-determinant`; libraries: `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv`, `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`.

**Sources.**

- `Kbook.2013`, Lemma III.1.4 (PDF p. 191; book p. 183): “If R is a commutative semilocal ring, then SK1(R) = 1 and K1(R) = R×.” — K₁ of the local rings A_𝔭 and of their completions.
- `Kbook.2013`, Example III.1.3.6 (PDF p. 191; book p. 183): “Bass, Milnor and Serre proved in [19, 4.3] that SK1(R) = 0, so that K1(R) ≅ R×.” — K₁ of the S-integers, specialised along ring maps.

## U.5 — Relative K₁ and maps

*Coverage: partial.* Targets: congruence subgroups and relative elementary groups (U.5/congruence-subgroup, relative-elementary-subgroup), the Relative Whitehead Lemma and [GL(A), GL(I)] = E(A, I) through the double ring, K₁(A, I) := GL(I)/E(A, I) (not a kernel), the relative determinant, the radical and split cases, the beginning of the relative sequence with its K₂ boundary target identified explicitly as ker(K₁(A, I) → K₁(A)) = (E(A) ∩ GL(I))/E(A, I) (the boundary map itself is K2SymbolsBrauer T.6's, which imports U.5), K₀(I) and the degree-zero ideal sequence; transfer by restriction of scalars for finite projective extensions, its determinant–norm formula, the field norm, base change and the projection formula against K₀ (with the K₀(A)-module structure on K₁); the explicit cokernel-length boundary K₁(L) → K₀(k) of a DVR with ∂ = v ∘ det, the exact sequence 1 → K₁(O) → K₁(L) → K₀(k) → 0, and its comparison with the localisation boundary, which RS-18 gives to SchemeKTheoryOperations S.3 together with the normalisation ∂(π) = [k] (U.5/dvr-boundary-localisation-comparison, citing S.3/dvr-boundary-unit-valuation). The comparison with the homotopy-fibre relative K₁ (GeneralAlgebraicKTheory K.5) needs U.6's π₁BGL⁺ = K₁ and is realised by U.6/relative-K1-homotopy-comparison.

- Remaining: Milnor patching and the K₀ Mayer–Vietoris sequence for U.5/ideal-sequence-degree-zero (gap; proposed for Z.1).
- Remaining: The homotopy-fibre comparison (U.6/relative-K1-homotopy-comparison) awaits K2SymbolsBrauer T.1:plus and T.6, blocked by the T.1 → GeneralAlgebraicKTheory:K.2 dependency (gap; restructure).

### The congruence subgroups GL_n(A, I) and GL(I)

`U.5/congruence-subgroup` · definition

For a ring A, a two-sided ideal I with quotient map π : A → A/I, and n ≥ 0, GL_n(A, I) := ker(GL_n(π) : GL_n(A) → GL_n(A/I)) (U.1/general-linear-map; Mathlib's Matrix.GeneralLinearGroup.map for commutative A), the invertible matrices congruent to 1 modulo I. The stabilisation g ↦ diag(g, 1) maps GL_n(A, I) into GL_{n+1}(A, I), and GL(I) := GL(A, I) is the kernel of GL(A) → GL(A/I), the union of the GL_n(A, I) in U.1's stable group. GL(I) is normal in GL(A). A matrix g = 1 + x with x ∈ M_n(I) lies in GL_n(A, I) iff it is invertible, and then g⁻¹ = 1 + y with y ∈ M_n(I).

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.

**Proof.**

1. Define GL_n(A, I) as a MonoidHom.ker; normality is automatic.
2. Stabilisation: diag(g, 1) ≡ 1 mod I iff g ≡ 1 mod I, so the kernels form a directed subsystem of U.1's tower and their union is the kernel of the stable map GL(A) → GL(A/I) (U.1/stable-equality-criterion).
3. If g ≡ 1 then g⁻¹ ≡ 1 mod I, since reduction is a ring homomorphism on matrices.

**API.**

- `congruenceSubgroup` (data): GL_n(A, I) ≤ GL_n(A).
- `mem_congruenceSubgroup` (characterisation): g ∈ GL_n(A, I) iff every entry of g − 1 lies in I.
- `congruenceSubgroup.normal` (instance): GL_n(A, I) is normal in GL_n(A).
- `stableCongruenceSubgroup` (data): GL(I) ≤ GL(A), the kernel of the stable reduction map.
- `stabilise_mem_congruenceSubgroup` (compatibility): diag(g, 1) ∈ GL_{n+1}(A, I) iff g ∈ GL_n(A, I).
- `congruenceSubgroup.map` (functoriality): A ring homomorphism f : A → B with f(I) ⊆ J maps GL_n(A, I) into GL_n(B, J).
- `congruenceSubgroup_bot` (simp): GL_n(A, ⊥) = ⊥.
- `congruenceSubgroup_top` (simp): GL_n(A, ⊤) = ⊤.
- `congruenceSubgroup_gamma` (compatibility): SL₂(ℤ) ∩ GL₂(ℤ, Nℤ) = CongruenceSubgroup.Gamma N under the inclusion SL ≤ GL.

**Unit tests.**

- `congruenceSubgroup_bot_top` (degenerate): GL_n(A, 0) = 1 and GL_n(A, A) = GL_n(A).
- `congruenceSubgroup_zmod_four` (computation): GL₁(ℤ/4, 2ℤ/4) = {1, 3}, of order 2.
- `congruenceSubgroup_gamma_test` (compatibility): For N ≥ 1, the determinant-one elements of GL₂(ℤ, Nℤ) form Mathlib's CongruenceSubgroup.Gamma N.
- `congruenceSubgroup_two_det` (non-example): diag(−1, 1) ∈ GL₂(ℤ, 2ℤ) has determinant −1, so GL₂(ℤ, 2ℤ) is strictly larger than Γ(2): the congruence subgroup of GL is not the one of SL.

**Acceptance.**

- For A = ℤ, I = Nℤ: GL₂(ℤ, Nℤ) ∩ SL₂(ℤ) is Mathlib's CongruenceSubgroup.Gamma N.
- GL₁(ℤ/4, 2ℤ/4) = {1, 3}.

**Used by.**

- K-book III.2.2: K₁(R, I) is the quotient GL(I)/E(R, I)
- BMS 1967 §4: SL_n(A, q) = ker(SL_n(A) → SL_n(A/q)) and the congruence kernel C_q = SL_n(A, q)/E_n(A, q)
- K2SymbolsBrauer T.6/relative-steinberg-group: the relative Steinberg group maps to E(R, I) ⊆ GL(I)
- U.5/relative-K1 and U.5/relative-whitehead-lemma: the ambient group of the relative theory

**Depends on.** this roadmap: `U.1/general-linear-map`, `U.1/stable-general-linear-group`, `U.1/stabilisation-map`, `U.1/stable-equality-criterion`; libraries: `mathlib:MonoidHom.ker`, `mathlib:TwoSidedIdeal`, `mathlib:Matrix.GeneralLinearGroup.map`, `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `Kbook.2013`, III.2, opening (PDF p. 201; book p. 193): “Let I be an ideal in a ring R. We write GL(I) for the kernel of the natural map GL(R) →GL(R/I); the notation reflects the fact that GL(I) is independent of R (see Ex. I.1.10).” — The definition of GL(I).
- `Kbook.2013`, Ex. I.1.10(ii) (PDF p. 14; book p. 6): “If I is an ideal in a ring R, show that GLn(I) is the kernel of GLn(R) →GLn(R/I), and so is independent of the choice of R.” — The finite-rank group and its independence of R.

### The relative elementary groups E_n(A, I) and E(A, I)

`U.5/relative-elementary-subgroup` · definition · planet “Relative elementary group”

For a ring A and a two-sided ideal I, E_n(A, I) is the normal closure inside E_n(A) (U.1/elementary-subgroup) of the elementary matrices e_ij(x) with x ∈ I and i ≠ j ≤ n: the subgroup generated by the τe_ij(x)τ⁻¹, τ ∈ E_n(A) (not the normal closure in GL_n(A)). E(A, I) ⊆ GL(A) is the union of the E_n(A, I), equivalently the subgroup generated by the E(A)-conjugates of the e_ij(x), x ∈ I. One has E_n(A, I) ⊆ E_{n+1}(A, I) and E_n(A, I) ⊆ GL_n(A, I).

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.

**Proof.**

1. Define E_n(A, I) as the subgroup generated by the E_n(A)-conjugates of {e_ij(x) : x ∈ I} (equivalently the image of Mathlib's Subgroup.normalClosure in the subgroup E_n(A)).
2. e_ij(x) ≡ 1 mod I and GL_n(A, I) is normal, so E_n(A, I) ⊆ GL_n(A, I).
3. Stabilisation sends generators and conjugating elements to generators and conjugating elements.
4. For n ≥ 3 and commutative A, E_n(A, I) = [E_n(A), E_n(A, I)] (BMS (5.1)): e_ij(x) = [e_ik(x), e_kj(1)] for k ∉ {i, j} (U.1/elementary-commutator-chain).

**API.**

- `relElementary` (data): E_n(A, I) ≤ GL_n(A).
- `elementary_mem_relElementary` (constructor): e_ij(x) ∈ E_n(A, I) for x ∈ I.
- `relElementary.conj_mem` (relation): E_n(A, I) is normalised by E_n(A).
- `relElementary_le_congruenceSubgroup` (relation): E_n(A, I) ≤ GL_n(A, I).
- `stableRelElementary` (data): E(A, I) ≤ GL(A).
- `relElementary.map` (functoriality): For f : A → B with f(I) ⊆ J, f maps E_n(A, I) into E_n(B, J).
- `relElementary_top` (simp): E_n(A, ⊤) = E_n(A).
- `relElementary_bot` (simp): E_n(A, ⊥) = ⊥.
- `relElementary_eq_commutator` (characterisation): For commutative A and n ≥ 3, E_n(A, I) = ⁅E_n(A), E_n(A, I)⁆.

**Unit tests.**

- `relElementary_top_bot` (degenerate): E_n(A, A) = E_n(A) and E_n(A, 0) = 1; E₁(A, I) = 1.
- `relElementary_int_two_conj` (computation): (3 −2; 2 −1) = e₁₂(1)e₂₁(2)e₁₂(−1) lies in E₂(ℤ, 2ℤ).
- `relElementary_not_generated` (non-example): E₂(ℤ, 2ℤ) is not generated by the e_ij(x), x ∈ 2ℤ, alone: those generate a subgroup of the matrices (a b; c d) with a ≡ d ≡ 1 (mod 4) (a subgroup of SL₂(ℤ)), which does not contain (3 −2; 2 −1).
- `relElementary_commutator` (characterisation): For commutative A, n ≥ 3 and x ∈ I: e_ij(x) = ⁅e_ik(x), e_kj(1)⁆ with k ∉ {i, j}, so E_n(A, I) ≤ ⁅E_n(A), E_n(A, I)⁆.

**Acceptance.**

- E(A, A) = E(A) and E(A, 0) = 1.
- The conjugate e₁₂(1)e₂₁(2)e₁₂(−1) = (3 −2; 2 −1) lies in E₂(ℤ, 2ℤ).

**Used by.**

- K-book III.2.1–2.2: the relative Whitehead lemma and K₁(R, I) = GL(I)/E(R, I)
- BMS 1967 §4: C_q(n) = SL_n(A, q)/E_n(A, q)
- K2SymbolsBrauer T.6/relative-steinberg-group: St(R, I) → St(R) → E(R) lands in E(R, I), and K₂(R, I) = ker(St(R, I) → E(R, I))
- U.5/relative-commutator-formula: E(A, I) = [GL(A), GL(I)]

**Depends on.** this roadmap: `U.1/elementary-matrix`, `U.1/elementary-subgroup`, `U.1/stable-elementary-subgroup`, `U.1/elementary-commutator-chain`, `U.5/congruence-subgroup`; libraries: `mathlib:Subgroup.normalClosure`, `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `Kbook.2013`, III.2, opening (PDF p. 201; book p. 193): “In addition, we define E(R, I) to be the smallest normal subgroup of E(R) containing the elementary matrices eij(x) with x ∈I.” — The stable group.
- `Kbook.2013`, III.2, opening (PDF p. 201; book p. 193): “More generally, for each n we define En(R, I) to be the normal subgroup of En(R) generated by the matrices eij(x) with x ∈I and 1 ≤i ≠ j ≤n.” — The finite-rank groups.
- `BMS.1967`, §5, (5.1), p. 101 (PDF p. 44): “(5.1) E_n(A, q) = [E_n(A), E_n(A, q)] for n ≥ 3.” — The commutator description for commutative A.

### The double ring A ⊕ I

`U.5/augmented-double-ring` · construction

For a ring A and a two-sided ideal I, the double ring D = A ⊕ I is the abelian group A × I with product (r, x)(s, y) = (rs, ry + xs + xy) and unit (1, 0) (the K-book's augmented ring of Ex. II.2.3 and III.5.7). It carries ring homomorphisms pr, add : D → A, pr(r, x) = r and add(r, x) = r + x, with the common section Δ(r) = (r, 0). (pr, add) : D → A ×_{A/I} A = {(a, b) ∈ A × A | a − b ∈ I} is a ring isomorphism, ker pr = 0 ⊕ I, and add maps 0 ⊕ I isomorphically onto I, so D →add A, D →pr A form a Milnor square over A/I.

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.

**Proof.**

1. The product is associative and unital because (r, x) ↦ (r, r + x) is a bijection onto the subring A ×_{A/I} A of A × A that transports it to the componentwise product.
2. pr and add are the two projections in these coordinates; Δ is the diagonal.
3. ker pr = 0 ⊕ I; add restricted to 0 ⊕ I is x ↦ x, injective with image I.

**API.**

- `DoubleRing` (data): The ring A ⊕ I.
- `DoubleRing.pr` (projection): The ring homomorphism (r, x) ↦ r.
- `DoubleRing.add` (projection): The ring homomorphism (r, x) ↦ r + x.
- `DoubleRing.diag` (constructor): The section r ↦ (r, 0) of both.
- `DoubleRing.pr_diag` (simp): pr ∘ diag = id and add ∘ diag = id.
- `DoubleRing.equivPullback` (equivalence): D ≃+* {(a, b) ∈ A × A | a − b ∈ I}.
- `DoubleRing.ker_pr` (characterisation): ker pr = 0 ⊕ I, and add is injective on it with image I.
- `DoubleRing.map` (functoriality): f : A → B with f(I) ⊆ J induces D(A, I) → D(B, J), compatible with pr, add and diag.

**Unit tests.**

- `DoubleRing.bot` (degenerate): For I = 0, pr = add : D ≃ A.
- `DoubleRing.int_two` (computation): For A = ℤ, I = 2ℤ: equivPullback sends (1, 2) to (1, 3), and (1, 2)² = (1, 8) ↦ (1, 9) = (1, 3)².
- `DoubleRing.top` (characterisation): For I = A, equivPullback is D ≃+* A × A.
- `DoubleRing.not_componentwise` (non-example): The product is not componentwise: in ℤ ⊕ 2ℤ, (1, 2)(1, 2) = (1, 8), not (1, 4).

**Acceptance.**

- For I = 0, D ≅ A and pr = add.
- For I = A, D ≅ A × A (K-book Ex. II.2.4(a)).

**Used by.**

- K-book Ex. II.2.3: K₀(I) := ker(K₀(R ⊕ I) → K₀(R))
- K-book III.5.7: St′(R, I) ⊆ St(R ⊕ I) and the relative Steinberg group St(R, I)
- K-book Ex. IV.1.15: the hint 'π₀K(R ⊕ I, 0 ⊕ I) must be K₀(I)'
- U.5/relative-commutator-formula: Whitehead's lemma for D gives [GL(A), GL(I)] ⊆ E(A, I)
- K2SymbolsBrauer T.6/relative-steinberg-group: imports the ring D, pr and add

**Depends on.** libraries: `mathlib:TwoSidedIdeal`, `mathlib:RingHom`, `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `Kbook.2013`, Ex. II.2.3 (PDF p. 86; book p. 78): “If I is an ideal in a ring R, form the augmented ring R ⊕I and let K0(I) = K0(R, I) denote the kernel of K0(R ⊕I) →K0(R).” — The augmented ring and its role for K₀(I).
- `Kbook.2013`, III.5.7, relative Steinberg group (PDF p. 230; book p. 222): “Let St′(R, I) denote the normal subgroup of St(R ⊕ I) generated by all xij(0, v) with v ∈ I.” — The double ring as used by the relative Steinberg group (K2SymbolsBrauer T.6).

### The relative Whitehead lemma

`U.5/relative-whitehead-lemma` · theorem · planet “Relative Whitehead lemma”

For a ring A and a two-sided ideal I: (a) for g ∈ GL_n(A, I), diag(g, g⁻¹) ∈ E_{2n}(A, I); (b) E(A, I) ⊆ GL(I), and E(A, I) is normal in GL(A); (c) [GL(I), GL(I)] ⊆ E(A, I). Hence K₁(A, I) = GL(I)/E(A, I) is abelian. (The K-book states normality in GL(I); its proof gives normality in GL(A).)

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.

**Proof.**

1. (a) With α = g − 1 ∈ M_n(I): diag(g, g⁻¹) = (1 1; 0 1)(1 0; α 1)(1 −1; 0 1)(1 g⁻¹α; 0 1)(1 0; −gα 1) in block form; the product of the first three factors is the conjugate by (1 1; 0 1) ∈ E_{2n}(A) (U.1/block-unitriangular-elementary) of (1 0; α 1) ∈ E_{2n}(A, I), and the last two are products of e_ij(x) with x ∈ I.
2. (b) For g ∈ GL_n(A) and h ∈ E_n(A, I): diag(ghg⁻¹, 1) = diag(g, g⁻¹)·diag(h, 1)·diag(g⁻¹, g), and diag(g, g⁻¹) ∈ E_{2n}(A) (U.1/whitehead-diagonal) normalises E_{2n}(A, I) by definition.
3. (c) For g, h ∈ GL_n(I): [g, h] = diag(g, g⁻¹)·diag(h, h⁻¹)·diag((hg)⁻¹, hg) in GL_{2n}(A) (K-book (1.3.4)), and each factor lies in E_{2n}(A, I) by (a).
4. K₁(A, I) is then a quotient of GL(I) by a normal subgroup containing its commutators.

**Acceptance.**

- I = A recovers U.1's Whitehead lemma: [GL(A), GL(A)] ⊆ E(A), E(A) normal.
- For n = 1 and g = 1 + a the identity in (a) multiplies out to diag(1 + a, (1 + a)⁻¹).
- Swan's example (K-book Ex. III.2.3) shows that E(A, I), unlike GL(I), depends on A.

**Depends on.** this roadmap: `U.5/relative-elementary-subgroup`, `U.5/congruence-subgroup`, `U.1/block-unitriangular-elementary`, `U.1/whitehead-diagonal`, `U.1/commutator-in-elementary`; libraries: `mathlib:commutatorElement`, `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `Kbook.2013`, Relative Whitehead Lemma III.2.1 (PDF p. 201; book p. 193): “Relative Whitehead Lemma 2.1. E(R, I) is a normal subgroup of GL(I), and contains the commutator subgroup of GL(I).” — The statement; the proof on the same page gives (a)–(c).
- `Kbook.2013`, Proof of III.2.1 (PDF p. 201; book p. 193): “(The product of the first 3 matrices is in E2n(R, I).)” — The step (a) of the proof.

### E(A, I) = [GL(A), GL(I)]

`U.5/relative-commutator-formula` · theorem

For a ring A and a two-sided ideal I, in U.1's stable group GL(A): E(A, I) = [GL(A), GL(I)] = [E(A), E(A, I)], the subgroups generated by the commutators. Consequently GL(A) acts trivially by conjugation on K₁(A, I).

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.
- The finite-rank form [GL_m(A), GL_m(A, q)] = E_m(A, q) for commutative A of stable range n − 1 and m ≥ max(3, 2(n − 1)) is BMS Theorem 7.5(d), citing Bass; it is not needed.

**Proof.**

1. ⊇: for x ∈ I and i ≠ j choose k ∉ {i, j} (possible stably); e_ij(x) = [e_ik(x), e_kj(1)] (U.1/elementary-commutator-chain) with e_ik(x) ∈ E(A, I) ⊆ GL(I) and e_kj(1) ∈ E(A). The subgroup generated by the [g, x], g ∈ GL(A), x ∈ GL(I), is normal in GL(A) (h[g, x]h⁻¹ = [hgh⁻¹, hxh⁻¹] and GL(I) is normal), so it contains the E(A)-conjugates of the e_ij(x), i.e. E(A, I); likewise inside E(A).
2. ⊆: let P = A ×_{A/I} A ≅ D (U.5/augmented-double-ring) with projections p₁, p₂ and diagonal Δ. For g ∈ GL(A) and x ∈ GL(I), (g, g) and (x, 1) lie in GL(P) and [(g, g), (x, 1)] = ([g, x], 1) ∈ [GL(P), GL(P)] = E(P) (U.1/whitehead-lemma for P) and in ker p₂.
3. E(P) is generated by the e_ij((a, b)) with a − b ∈ I, and e_ij((a, b)) = e_ij((a − b, 0))·e_ij((b, b)); so E(P) = N·Δ(E(A)) with N the normal closure in E(P) of the e_ij((y, 0)), y ∈ I. As p₂(N) = 1 and p₂∘Δ = id, E(P) ∩ ker p₂ = N.
4. p₁(N) is the normal closure in p₁(E(P)) = E(A) of the e_ij(y), y ∈ I, i.e. E(A, I) (U.1/elementary-surjective-map for p₁). Hence [g, x] = p₁([(g, g), (x, 1)]) ∈ E(A, I).
5. Trivial conjugation action: for g ∈ GL(A) and x ∈ GL(I), gxg⁻¹x⁻¹ ∈ E(A, I).

**Acceptance.**

- I = A: [GL(A), GL(A)] = E(A), U.1's Whitehead lemma.
- BMS Theorem 7.5(d) is the finite-rank statement under a stable range hypothesis.

**Depends on.** this roadmap: `U.5/augmented-double-ring`, `U.5/relative-elementary-subgroup`, `U.5/relative-whitehead-lemma`, `U.1/whitehead-lemma`, `U.1/elementary-commutator-chain`, `U.1/elementary-surjective-map`; libraries: `mathlib:commutatorElement`, `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `BMS.1967`, Theorem 7.5(d), p. 106 (PDF p. 49): “If moreover, m ≥ 2(n − 1), then [GL_m(A), GL_m(A, q)] = E_m(A, q).” — The finite-rank statement (commutative A under (7.2)_n); the stable statement for arbitrary rings is assembled here from the absolute Whitehead lemma applied to the double ring, which the K-book uses in III.5.7.
- `Kbook.2013`, Relative Whitehead Lemma III.2.1 (PDF p. 201; book p. 193): “Relative Whitehead Lemma 2.1. E(R, I) is a normal subgroup of GL(I), and contains the commutator subgroup of GL(I).” — The inclusion [GL(I), GL(I)] ⊆ E(R, I); the node strengthens it to [GL(R), GL(I)].

### Relative K₁ of an ideal

`U.5/relative-K1` · definition · planet “Relative K₁”

For a ring A and a two-sided ideal I, K₁(A, I) := GL(I)/E(A, I), an abelian group (U.5/relative-whitehead-lemma). The inclusion GL(I) ⊆ GL(A) induces ι : K₁(A, I) → K₁(A) (U.2/K1), and a ring homomorphism f : A → B with f(I) ⊆ J induces K₁(A, I) → K₁(B, J). K₁(A, I) is not defined as ker(K₁(A) → K₁(A/I)): ι is not injective in general, and K₁(A, I) depends on A and not only on I.

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.

**Proof.**

1. Define K₁(A, I) as the quotient of the group GL(I) by its normal subgroup E(A, I) (normal by U.5/relative-whitehead-lemma), with CommGroup structure from (c) of that lemma.
2. ι and functoriality: GL(I) → GL(A) maps E(A, I) into E(A), and f maps GL(I) into GL(J) and E(A, I) into E(B, J) (U.5/relative-elementary-subgroup, U.5/congruence-subgroup).

**API.**

- `RelK1` (data): K₁(A, I).
- `RelK1.mk` (constructor): GL(I) →* K₁(A, I).
- `RelK1.mk_surjective` (characterisation): mk is surjective.
- `RelK1.mk_eq_one_iff` (characterisation): mk x = 1 iff x ∈ E(A, I).
- `RelK1.instCommGroup` (instance): K₁(A, I) is a commutative group.
- `RelK1.toK1` (projection): ι : K₁(A, I) →* K₁(A).
- `RelK1.map` (functoriality): K₁(A, I) →* K₁(B, J) for f(I) ⊆ J, with map_id and map_comp.
- `RelK1.mk_elementary` (simp): mk (e_ij(x)) = 1 for x ∈ I.
- `RelK1.equivK1_top` (equivalence): K₁(A, ⊤) ≃* K₁(A) compatibly with ι.
- `RelK1.subsingleton_bot` (simp): K₁(A, ⊥) is trivial.

**Unit tests.**

- `RelK1.bot_top` (degenerate): K₁(A, 0) is trivial and ι : K₁(A, A) → K₁(A) is an isomorphism.
- `RelK1.zmod_sq` (computation): For A = ℤ/p², I = pℤ/p²: K₁(A, I) ≅ ℤ/p, and K₁(A, I) → K₁(ℤ/p²) → K₁(𝔽_p) is 1 → ℤ/p → (ℤ/p²)^× → 𝔽_p^× → 1 (orders p, p(p − 1), p − 1).
- `RelK1.swan` (non-example): Swan's example: for R the upper triangular 2 × 2 matrices over a field F and I = the matrices with only the (1, 2) entry, K₁(F ⊕ I, I) ≅ F while K₁(R, I) = 0 (K-book Ex. III.2.3): relative K₁ is not a function of the ideal.
- `RelK1.top_compat` (compatibility): Under K₁(A, A) ≃ K₁(A), RelK1.map agrees with U.2's K₁(f).

**Acceptance.**

- K₁(A, 0) = 0 and K₁(A, A) = K₁(A).
- K₁(ℤ/p², pℤ/p²) ≅ ℤ/p (U.5/relative-K1-radical-ideal).
- Swan (K-book Ex. III.2.3): for R the upper triangular 2 × 2 matrices over a field F, I its strictly upper triangular ideal and R₀ = F ⊕ I, K₁(R₀, I) ≅ F but K₁(R, I) = 0.

**Used by.**

- K-book Proposition III.2.3: the exact sequence K₁(R, I) → K₁(R) → K₁(R/I) → K₀(I) → K₀(R) → K₀(R/I)
- K-book III.5.7.1 and K2SymbolsBrauer T.6/relative-steinberg-group: K₂(R, I) → K₂(R) → K₂(R/I) → K₁(R, I) → K₁(R) → K₁(R/I)
- BMS 1967 Theorem 4.1: SK₁(A, q) ≅ C_q
- GeneralAlgebraicKTheory K.5: the homotopy-fibre relative K₁ is compared with this group (U.6/relative-K1-homotopy-comparison)
- K-book III.3.3 (NK₁): NK₁(R) ≅ K₁(R[t], (t − r))

**Depends on.** this roadmap: `U.5/congruence-subgroup`, `U.5/relative-elementary-subgroup`, `U.5/relative-whitehead-lemma`, `U.2/K1`, `U.2/K1-map`; libraries: `mathlib:QuotientGroup.mk`, `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `Kbook.2013`, Definition III.2.2 (PDF p. 201; book p. 193): “Definition 2.2. The relative group K1(R, I) is defined to be the quotient GL(I)/E(R, I). By the Relative Whitehead Lemma, it is an abelian group.” — The definition.
- `Kbook.2013`, Definition III.2.2 (PDF p. 201; book p. 193): “More generally, if R →S is a ring map sending I into an ideal I′ of S, the natural maps GL(I) →GL(I′) and E(R) →E(S) induce a map K1(R, I) →K1(S, I′).” — Functoriality.
- `Kbook.2013`, Remark III.2.2.1 (PDF p. 201; book p. 193): “Vaserstein proved in [206, 14.2] that K1(R, I) is independent of R if and only if I = I2.” — Why K₁(A, I) is not a function of I alone.

### The relative determinant and SK₁(A, I)

`U.5/relative-determinant` · construction

For a commutative ring A and an ideal I, the determinant induces det : K₁(A, I) → GL₁(I) = {u ∈ A^× | u ≡ 1 mod I}, split by GL₁(I) → K₁(A, I); SK₁(A, I) := ker det = SL(I)/E(A, I) with SL(I) = SL(A) ∩ GL(I). So K₁(A, I) ≅ GL₁(I) × SK₁(A, I), compatibly under ι with K₁(A) ≅ A^× × SK₁(A) (U.3/K1-units-split).

**Hypotheses.**

- A commutative, I an ideal.

**Proof.**

1. det maps GL(I) into GL₁(I), since the determinant of a matrix ≡ 1 mod I is ≡ 1 mod I, and kills E(A, I) ⊆ SL(A).
2. GL₁(I) = GL₁(A, I) → K₁(A, I) is a section of det.
3. The kernel of det on GL(I)/E(A, I) is (SL(A) ∩ GL(I))/E(A, I); the split exact sequence gives the product decomposition.
4. Compatibility with U.3's splitting is the naturality of det along GL(I) ⊆ GL(A).

**API.**

- `RelK1.det` (data): det : K₁(A, I) →* GL₁(I), GL₁(I) the units congruent to 1 mod I.
- `RelK1.det_mk` (simp): det (mk x) = det x.
- `RelK1.ofUnit` (constructor): The section GL₁(I) →* K₁(A, I).
- `RelK1.det_ofUnit` (simp): det ∘ ofUnit = id.
- `RelSK1` (data): SK₁(A, I) = ker det.
- `RelSK1.equiv` (characterisation): SK₁(A, I) ≃* (SL(A) ⊓ GL(I))/E(A, I).
- `RelK1.equivProd` (equivalence): K₁(A, I) ≃* GL₁(I) × SK₁(A, I).
- `RelK1.det_toK1` (compatibility): U.3's det ∘ ι = (inclusion GL₁(I) ≤ A^×) ∘ det.

**Unit tests.**

- `RelK1.det_top` (degenerate): For I = A the relative determinant is U.3's det : K₁(A) → A^×.
- `RelK1.det_zmod_sq` (computation): For A = ℤ/p², I = (p): det : K₁(A, I) ≅ 1 + pℤ/p², cyclic of order p, and SK₁(A, I) = 0.
- `RelK1.det_int_three` (non-example): The relative determinant takes values in units ≡ 1 mod I, not in A^×: for A = ℤ, I = 3ℤ, det(K₁(ℤ, 3ℤ)) = {1} although det(K₁(ℤ)) = {±1}, as −1 ≢ 1 (mod 3).
- `RelK1.det_compat` (compatibility): On GL_n(A, I) the relative determinant is Mathlib's Matrix.GeneralLinearGroup.det.

**Acceptance.**

- For I = A: U.3's det and SK₁(A).
- A = ℤ, I = 3ℤ: GL₁(3ℤ) = {1}.

**Used by.**

- K-book Theorem III.2.5 and BMS Corollary 4.3: SK₁(R, I) is computed for integrally closed subrings of number fields
- K-book Ex. III.2.5: the relative Mennicke symbol takes values in SK₁(R, I)
- U.5/relative-K1-radical-ideal: SK₁(A, I) = 0 for radical I

**Depends on.** this roadmap: `U.5/relative-K1`, `U.3/stable-determinant`, `U.3/K1-units-split`, `U.3/stable-special-linear-group`; libraries: `mathlib:Matrix.GeneralLinearGroup.det`.

**Sources.**

- `Kbook.2013`, III.2, The relative group SK1(R, I) (PDF p. 202; book p. 194): “If R happens to be commutative, the determinant map K1(R) →R× of Example 1.1.1 induces a relative determinant map det: K1(R, I) →GL1(I), since the determinant of a matrix in GL(I) is congruent to 1 modulo I.” — The relative determinant.
- `Kbook.2013`, III.2, The relative group SK1(R, I) (PDF p. 202; book p. 194): “It is traditional to write SK1(R, I) for the kernel of det, so the canonical map GL1(I) →K1(R, I) induces a direct sum decomposition K1(R, I) = GL1(I) ⊕SK1(R, I)” — The splitting.

### Relative K₁ of a radical ideal

`U.5/relative-K1-radical-ideal` · lemma

Let I be a radical ideal of a ring A (1 + x is a unit for every x ∈ I). Then GL_n(A, I) = E_n(A, I)·GL_{n−1}(A, I) for n ≥ 2, so K₁(A, I) is a quotient of GL₁(I) = 1 + I. If A is commutative, SK₁(A, I) = 0, det : K₁(A, I) ≅ 1 + I, and ι : K₁(A, I) → K₁(A) is injective.

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.
- I radical: I is contained in the Jacobson radical.

**Proof.**

1. For x = (x_ij) ∈ GL_n(A, I), x_nn ∈ 1 + I is a unit and x_in, x_ni ∈ I for i < n.
2. Multiply by diag(1, …, 1, x_nn, x_nn⁻¹) ∈ E_n(A, I) (U.5/relative-whitehead-lemma (a) for n = 1) to get x_nn = 1.
3. Left multiplication by the e_in(−x_in) and right multiplication by the e_ni(−x_ni), all in E_n(A, I), reduce the matrix into GL_{n−1}(A, I).
4. By induction K₁(A, I) is generated by the image of GL₁(I). For commutative A, det ∘ (GL₁(I) → K₁(A, I)) = id, so GL₁(I) → K₁(A, I) is an isomorphism, SK₁(A, I) = 0, and ι composed with det is the inclusion 1 + I ⊆ A^× (U.5/relative-determinant).

**Acceptance.**

- A = ℤ/p², I = (p): K₁(A, I) ≅ 1 + pℤ/p² ≅ ℤ/p.
- A = k[ε]/(ε²), I = (ε): K₁(A, I) ≅ 1 + kε ≅ (k, +).
- A local, I its maximal ideal: K₁(A, I) ≅ 1 + I.

**Depends on.** this roadmap: `U.5/relative-K1`, `U.5/relative-whitehead-lemma`, `U.5/relative-determinant`; libraries: `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `Kbook.2013`, Lemma III.2.4 (PDF p. 202; book p. 194): “Lemma 2.4. Let I be a radical ideal in R. Then: 1. K1(R, I) is a quotient of the multiplicative group 1 + I = GL1(I). 2. If R is a commutative ring, then SK1(R, I) = 0 and K1(R, I) = 1 + I.” — Statement; the proof steps are the K-book's.

### Relative K₁ for a split quotient

`U.5/relative-K1-split` · lemma

If the quotient map π : A → A/I has a ring section s : A/I → A, then E(A) ∩ GL(I) = E(A, I), so ι : K₁(A, I) → K₁(A) is injective, and K₁(A) ≅ K₁(A/I) × K₁(A, I) (via K₁(π) and a retraction induced by s).

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.

**Proof.**

1. E(A) is generated by the e_ij(s(r) + x) = e_ij(x)e_ij(s(r)) with x ∈ I, so E(A) = E(A, I)·s(E(A/I)) (E(A, I) is normal in E(A)).
2. If e = n·s(e′) ∈ GL(I) with n ∈ E(A, I), reducing mod I gives 1 = e′, so e = n: E(A) ∩ GL(I) = E(A, I).
3. The kernel of ι is (E(A) ∩ GL(I))/E(A, I) (U.5/relative-sequence-degree-one), hence trivial; K₁(s) splits K₁(π), and exactness at K₁(A) gives the decomposition.

**Acceptance.**

- A = R[t], I = (t), s the inclusion: K₁(R[t]) ≅ K₁(R) × K₁(R[t], (t)), the K-book's NK₁(R) ≅ K₁(R[t], (t)).
- A = D = A₀ ⊕ I (U.5/augmented-double-ring) with pr and Δ: K₁(D) ≅ K₁(A₀) × K₁(D, 0 ⊕ I).

**Depends on.** this roadmap: `U.5/relative-K1`, `U.5/relative-elementary-subgroup`, `U.5/relative-sequence-degree-one`, `U.2/K1-map`; libraries: `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `Kbook.2013`, Ex. III.2.7 (PDF p. 205; book p. 197): “Suppose that the ring map R →R/I is split by a map R/I →R. Show that K1(R) ≅ K1(R/I)⊕K1(R, I).” — The exercise this lemma proves.

### The relative exact sequence in degree one

`U.5/relative-sequence-degree-one` · theorem · planet “Relative exact sequence”

For a ring A and a two-sided ideal I, E(A) → E(A/I) is surjective and K₁(A, I) →ι K₁(A) →K₁(π) K₁(A/I) is exact. The kernel of ι is (E(A) ∩ GL(I))/E(A, I): this is the group that the boundary K₂(A/I) → K₁(A, I) of the relative K₂-sequence maps onto (K-book Theorem III.5.7.1), which K2SymbolsBrauer T.6 builds from these groups. So ι is injective exactly when E(A) ∩ GL(I) = E(A, I) — for instance for split quotients and radical ideals of commutative rings (U.5/relative-K1-split, U.5/relative-K1-radical-ideal).

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.
- The K₂ terms are K2SymbolsBrauer's (T.1 defines K₂, T.6 the relative sequence and its boundary); U.5 exports the degree-one groups and the explicit kernel.

**Proof.**

1. E_n(A) → E_n(A/I) is onto: generators map to generators (U.1/elementary-surjective-map, K-book Remark III.1.2.3).
2. K₁(π) ∘ ι = 0 because GL(I) maps to 1.
3. If g ∈ GL(A) has [ḡ] = 0 then ḡ ∈ E(A/I); lift it to e ∈ E(A); then ge⁻¹ ∈ GL(I) and ι[ge⁻¹] = [g].
4. x ∈ GL(I) has ι[x] = 0 iff x ∈ E(A) ∩ GL(I).

**Acceptance.**

- A = ℤ/p², I = (p): 1 → ℤ/p → (ℤ/p²)^× → 𝔽_p^× → 1 is exact (ι injective, I radical).
- BMS Example 4.5 (Stallings): A = ℝ[t], q = (t² − t): SK₁(A, q) maps onto π₁SL_n(ℝ) ≅ ℤ/2 while SK₁(A) = 0 (ℝ[t] is Euclidean), so ι is not injective there; the extra classes are the image of K₂(A/q).

**Depends on.** this roadmap: `U.5/relative-K1`, `U.1/elementary-surjective-map`, `U.2/K1`, `U.2/K1-map`; libraries: `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `Kbook.2013`, Proposition III.2.3 and its proof (PDF pp. 201–202; book pp. 193–194): “Hence the class of ge−1 in K1(R, I) is defined, and maps to the class of g in K1(R). This proves exactness at the remaining spot.” — Exactness at K₁(R).
- `Kbook.2013`, Remark III.1.2.3 (PDF p. 189; book p. 181): “If I is an ideal of R, each homomorphism En(R) →En(R/I) is onto, because the generators eij(r) of En(R) map onto the generators eij(r̄) of En(R/I).” — Surjectivity on elementary groups.
- `Kbook.2013`, Theorem III.5.7.1 (PDF p. 231; book p. 223): “Theorem 5.7.1. If I is an ideal of a ring R, then the exact sequence of Proposition 2.3 extends to an exact sequence K2(R, I) →K2(R) →K2(R/I) →K1(R, I) →K1(R) →K1(R/I) →K0(I) · · ·” — The K₂ extension, whose boundary lands in the kernel identified here.

### K₀ of an ideal

`U.5/relative-K0-of-ideal` · definition

For a ring A and a two-sided ideal I, K₀(I) := ker(K₀(pr) : K₀(A ⊕ I) → K₀(A)), with A ⊕ I the double ring (U.5/augmented-double-ring) and K₀ Z.1's ring K₀ (RingK0, functorial by scalar extension). The map K₀(I) → K₀(A) is the restriction of K₀(add). The section Δ gives K₀(A ⊕ I) ≅ K₀(A) ⊕ K₀(I).

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.

**Proof.**

1. Define K₀(I) as the kernel of RingK0.map pr (Z.1/ring-k0-map).
2. K₀(pr) ∘ K₀(Δ) = id (Z.1's map_comp, map_id), so K₀(A ⊕ I) = K₀(A) ⊕ K₀(I).
3. The map to K₀(A) is RingK0.map add restricted to the kernel; functoriality in (A, I) comes from DoubleRing.map.

**API.**

- `RelK0` (data): K₀(I) = ker(K₀(pr)).
- `RelK0.toK0` (projection): K₀(I) →+ K₀(A), restriction of K₀(add).
- `RelK0.splitting` (equivalence): K₀(A ⊕ I) ≃+ K₀(A) × K₀(I) via K₀(pr) and the projection onto the kernel along K₀(Δ).
- `RelK0.map` (functoriality): f : A → B with f(I) ⊆ J induces K₀(I) →+ K₀(J).
- `RelK0.subsingleton_bot` (simp): K₀(0) = 0.
- `RelK0.equiv_of_unital` (compatibility): If I = eA for a central idempotent e, K₀(I) ≃+ K₀(eA) of the unital ring eA (K-book Ex. II.2.4(a)).

**Unit tests.**

- `RelK0.bot` (degenerate): K₀(0) = 0.
- `RelK0.top` (computation): For I = A, K₀(I) ≅ K₀(A) through the second factor of A ⊕ A ≅ A × A.
- `RelK0.product_factor` (compatibility): For A = A₁ × A₂ and I = 0 × A₂, K₀(I) ≅ K₀(A₂) (I has the unit (0, 1)).
- `RelK0.two_int` (non-example): K₀(2ℤ) = 0 (the ideal sequence, with SL(ℤ) → SL(𝔽₂) onto), although 2ℤ ≅ ℤ as a ℤ-module: K₀ of an ideal is not K₀ of the ideal as a module.

**Acceptance.**

- K₀(0) = 0.
- K₀(A) for I = A (then A ⊕ A ≅ A × A and pr is the first projection).
- K₀(I) = 0 for a radical ideal (K-book Ex. II.2.5(a)).

**Used by.**

- K-book Proposition III.2.3: the terms K₁(R/I) → K₀(I) → K₀(R) → K₀(R/I) of the relative sequence
- K-book IV.1.11 and Ex. IV.1.15: π₀ of the relative K-theory space K(R, I) is K₀(I)
- GeneralAlgebraicKTheory K.5: K₀(R, I) ≅ K₀(I) for the homotopy fibre (U.6/relative-K1-homotopy-comparison)

**Depends on.** this roadmap: `U.5/augmented-double-ring`, `Z.1/ring-k0`, `Z.1/ring-k0-map`; libraries: `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `Kbook.2013`, Ex. II.2.3 (PDF p. 86; book p. 78): “If I is an ideal in a ring R, form the augmented ring R ⊕I and let K0(I) = K0(R, I) denote the kernel of K0(R ⊕I) →K0(R).” — The definition.
- `Kbook.2013`, Ex. II.2.4 (PDF p. 87; book p. 79): “Let R be a ring with unit acting upon I, form the augmented ring R ⊕I, and let K0(I) be the kernel of K0(R ⊕I) →K0(R). Thus K0(R ⊕I) ≅ K0(R) ⊕K0(I) by definition.” — The splitting.

### The ideal sequence in degree zero

`U.5/ideal-sequence-degree-zero` · theorem

For a ring A and a two-sided ideal I there is a homomorphism ∂ : K₁(A/I) → K₀(I) such that K₁(A) → K₁(A/I) →∂ K₀(I) → K₀(A) → K₀(A/I) is exact. With U.5/relative-sequence-degree-one this is the exact sequence K₁(A, I) → K₁(A) → K₁(A/I) → K₀(I) → K₀(A) → K₀(A/I) of K-book Proposition III.2.3.

**Hypotheses.**

- A is an associative unital ring and I a two-sided ideal (Mathlib's I : Ideal A with [I.IsTwoSided], whose quotient ring A ⧸ I is Ideal.Quotient.ring, and Ideal.toTwoSided I its TwoSidedIdeal; for commutative A every ideal is two-sided). GL_n, E_n, GL, E, the stabilisation maps and K₁ are those of U.1 and U.2.
- The proof rests on Milnor's patching theorem and its Mayer–Vietoris sequence (K-book I.2.7, II.2.9), which no layer of the atlas plans; recorded as a gap.

**Proof.**

1. The double ring gives a Milnor square: add : D = A ⊕ I → A maps the ideal 0 ⊕ I isomorphically onto I, D/(0 ⊕ I) ≅ A via pr, and A/I is the common quotient (U.5/augmented-double-ring).
2. Milnor's Mayer–Vietoris theorem (K-book Theorem II.2.9; gap): GL(A/I) →∂ K₀(D) →(add_*, pr_*) K₀(A) ⊕ K₀(A) → K₀(A/I) is exact, ∂ being Milnor patching of free modules along g ∈ GL_n(A/I).
3. Restrict to K₀(I) = ker pr_* (U.5/relative-K0-of-ideal): ∂ takes values in K₀(I) after subtracting the class from K₀(Δ), and a diagram chase gives exactness of GL(A) → GL(A/I) → K₀(I) → K₀(A) → K₀(A/I) (K-book Ex. II.2.3(c)).
4. ∂ kills the image of GL(A) and hence E(A/I) = image of E(A) (U.5/relative-sequence-degree-one); as K₀(I) is abelian, ∂ factors through K₁(A/I) (K-book proof of Proposition III.2.3).

**Acceptance.**

- For A = ℤ, I = pℤ: GL(ℤ) → GL(𝔽_p) has image {±1}·SL(𝔽_p), so K₀(pℤ) ≅ 𝔽_p^×/{±1} (and K₀(ℤ) → K₀(𝔽_p) is an isomorphism).
- For a radical ideal GL(A) → GL(A/I) is onto (K-book Ex. I.1.12(iv)), so K₀(I) → K₀(A) is injective.

**Depends on.** this roadmap: `U.5/augmented-double-ring`, `U.5/relative-K0-of-ideal`, `U.5/relative-sequence-degree-one`, `Z.1/ring-k0`, `Z.1/ring-k0-map`, `U.2/K1`; libraries: `mathlib:Ideal.IsTwoSided`, `mathlib:Ideal.Quotient.ring`.

**Sources.**

- `Kbook.2013`, Proposition III.2.3 (PDF p. 201; book p. 193): “Proposition 2.3. There is an exact sequence K1(R, I) →K1(R) →K1(R/I) ∂−→K0(I) →K0(R) →K0(R/I).” — The full sequence.
- `Kbook.2013`, Ex. II.2.3(c) (PDF p. 86; book p. 78): “(c) Ideal sequence. Show that there is an exact sequence GL(R) →GL(R/I) ∂−→K0(I) →K0(R) →K0(R/I).” — The degree-zero part, an exercise in the source.
- `Kbook.2013`, Theorem II.2.9 (PDF p. 85; book p. 77): “Theorem 2.9 (Mayer-Vietoris). Given a Milnor square as above, the sequence GL(S/I) ∂−→K0(R) ∆−→K0(S) ⊕K0(R/I) ±−→K0(S/I) is exact.” — The input, whose proof the K-book derives from Milnor patching I.2.6–2.7.

### Transfer on K₁ for a finite projective extension

`U.5/transfer` · construction · planet “Transfer”

Let f : A → B be a ring homomorphism making B a finitely generated projective right A-module (b·a = b f(a); for commutative A, B an A-algebra finite projective as an A-module). For g ∈ GL_n(B) = Aut_B(Bⁿ), restriction of scalars makes g an A-linear automorphism res(g) of the finitely generated projective A-module Bⁿ (Z.1/restrict-scalars-finite-projective), and g ↦ [res g] ∈ K₁(A) (U.2/automorphism-class) is a homomorphism compatible with stabilisation; it defines the transfer f_* : K₁(B) → K₁(A). If B is free over A with basis (b₁, …, b_d), then f_* is induced by GL_n(B) → GL_{nd}(A), g ↦ the matrix of res g (Mathlib's LinearMap.restrictScalars_toMatrix: the block matrix of left-multiplication matrices; for n = 1 Tau Ceti's unitsLeftMulMatrix), and the class does not depend on the basis.

**Hypotheses.**

- A, B rings; B f.g. projective as a right A-module via f (U.2's automorphism classes use right modules). No flatness or freeness beyond this is assumed.

**Proof.**

1. Bⁿ is a finitely generated projective A-module (a sum of copies of B).
2. g ↦ res(g) is a homomorphism Aut_B(Bⁿ) → Aut_A(Bⁿ); composing with U.2/automorphism-class (a homomorphism, independent of the complement and the isomorphism by U.2/automorphism-class-independence) gives GL_n(B) → K₁(A).
3. Stabilisation: res(diag(g, 1)) = res(g) ⊕ 1_B on Bⁿ ⊕ B, whose class is [res g] (U.2/automorphism-class-direct-sum).
4. The resulting homomorphism GL(B) → K₁(A) has abelian target, so it kills [GL(B), GL(B)] = E(B) (U.1/whitehead-lemma) and factors through K₁(B) (U.2/K1).
5. Free case: a basis identifies Bⁿ ≅ A^{nd}, and [res g] is the class of its matrix; another basis conjugates the matrix by an element of GL_{nd}(A), which does not change the class.

**API.**

- `K1.transfer` (data): f_* : K₁(B) →* K₁(A).
- `K1.transfer_mk` (simp): f_*[g] = [res g] for g ∈ GL_n(B).
- `K1.transfer_basis` (characterisation): For A commutative, B an A-algebra (f = algebraMap A B) and a basis b of B over A, f_*[g] is the class of the matrix of res g, the block matrix of Algebra.leftMulMatrix b of the entries.
- `K1.transfer_units` (simp): For A commutative, B an A-algebra (f = algebraMap A B), u ∈ B^× and a basis b, f_*[u] = [unitsLeftMulMatrix b u].
- `K1.transfer_id` (simp): (id_A)_* = id.
- `K1.transfer_comp` (functoriality): (g ∘ f)_* = f_* ∘ g_* for A → B → C with each step finite projective.
- `K1.transfer_prod` (compatibility): For B = B₁ × B₂, f_* x = (f₁)_*(pr₁ x) · (f₂)_*(pr₂ x) under K₁(B) ≅ K₁(B₁) × K₁(B₂) (U.2/K1-prod); K₁ is written multiplicatively.

**Unit tests.**

- `K1.transfer_id_test` (degenerate): For f = id_A the transfer is the identity of K₁(A).
- `K1.transfer_complex` (computation): For ℝ → ℂ, under det, f_*(z) = |z|² = z z̄: in the basis 1, i the matrix of a + bi is (a −b; b a), of determinant a² + b²; so f_*(i) = 1 and f_*(1 + i) = 2.
- `K1.transfer_diagonal` (computation): For the diagonal A → A × A (free of rank 2), f_* : K₁(A) × K₁(A) → K₁(A) is (x, y) ↦ x·y.
- `K1.transfer_not_norm` (non-example): For the projection A = k × k → B = k (B projective, not free), f_*[x] = (x, 1) ∈ K₁(k × k) = k^× × k^×, whereas Mathlib's Algebra.norm (k × k) x = 1 by Algebra.norm_eq_one_of_not_exists_basis: outside the free case the transfer is not Algebra.norm.
- `K1.transfer_field_norm_test` (compatibility): For a finite field extension L/F, det ∘ f_* = Algebra.norm F on L^× (U.5/transfer-field-norm).

**Acceptance.**

- f = id: f_* = id.
- ℂ/ℝ: z ↦ |z|².
- For B not free, e.g. k × k → k, the transfer is not given by Mathlib's Algebra.norm (see the tests).

**Used by.**

- K-book Corollary III.1.7.1: f_*f^* is multiplication by [S] ∈ K₀(R) for commutative R
- K-book III.1.7.2 and Ex. III.1.16: transfers along division algebras: i_*Nred and the norm
- ArithmeticKTheory N.1/transfer-and-norm-on-units and N.1/norms-transfers-and-pullbacks: transfer along O_{F,S} ⊂ O_{F′,S′} is the norm on S-units
- KTheoryFiniteLocalFields L.1: transfer for finite extensions of finite fields in degree one
- U.6/pi1-plus-transfer: the transfer on π₁BGL⁺

**Depends on.** this roadmap: `U.2/automorphism-class`, `U.2/automorphism-class-independence`, `U.2/automorphism-class-direct-sum`, `U.2/K1`, `U.1/whitehead-lemma`, `Z.1/restrict-scalars-finite-projective`; libraries: `mathlib:LinearMap.restrictScalars`, `mathlib:LinearMap.restrictScalars_toMatrix`, `tauceti:TauCeti.unitsLeftMulMatrix`.

**Sources.**

- `Kbook.2013`, Corollary III.1.7.1 (PDF p. 195; book p. 187): “Suppose that S is finitely generated projective as an R-module. Then the forgetful functor P(S) →P(R) induces a natural transfer homomorphism f∗: K1(S) →K1(R).” — The transfer.
- `Kbook.2013`, Lemma III.1.7 (PDF p. 195; book p. 187): “Any additive functor P(S) T−→P(R) induces a natural homomorphism K1(T): K1(S) →K1(R), and T1 ⊕T2 induces the sum K1(T1) + K1(T2).” — The general construction, via Bass's description K₁ = lim H₁(Aut P); the node builds it directly from U.2's classes.
- `Kbook.2013`, IV.1.1.3, Transfer maps (PDF p. 269; book p. 261): “If R →S is a ring map such that S ≅ Rd as an R-module, the isomorphisms Sm ≅ Rmd induce a group map GL(S) →GL(R) and hence a map BGL(S)+ →BGL(R)+” — The matrix form in the free case.

### Determinant of the transfer is the norm of the determinant

`U.5/transfer-determinant-norm` · lemma

Let A be commutative and B a commutative A-algebra that is free of finite rank as an A-module. For x ∈ K₁(B), det_A(f_* x) = N_{B/A}(det_B x), where N_{B/A} = Algebra.norm A (Mathlib) and det is U.3's. In particular det f_*[u] = N_{B/A}(u) for u ∈ B^×.

**Hypotheses.**

- A, B commutative; B free of finite rank over A (for projective B the norm must be computed through a complement, not with Mathlib's Algebra.norm, which is 1 off the free case).

**Proof.**

1. For g ∈ GL_n(B): det_A(res g) = Algebra.norm A (det_B g) (Mathlib's LinearMap.det_restrictScalars, Bⁿ being free over B and B free over A).
2. For n = 1 this is Tau Ceti's val_det_unitsLeftMulMatrix.
3. The stable determinants are compatible with stabilisation (U.3/stable-determinant), so the identity passes to K₁.

**Acceptance.**

- ℂ/ℝ: det f_*(z) = N(z) = |z|².
- 𝔽_{q²}/𝔽_q: det f_*(x) = x^{q+1}.
- A → A × A: det f_*(x, y) = xy.

**Depends on.** this roadmap: `U.5/transfer`, `U.3/stable-determinant`; libraries: `mathlib:LinearMap.det_restrictScalars`, `mathlib:Algebra.norm`, `tauceti:TauCeti.val_det_unitsLeftMulMatrix`, `mathlib:Algebra.norm_eq_one_of_not_exists_basis`.

**Sources.**

- `Kbook.2013`, III.1.7, after Corollary 1.7.1 (PDF p. 195; book p. 187): “When j : F →E is a finite field extension, it is easy to see from 1.1.2 that the transfer map j∗: E× →F× is the classical norm map.” — The source states the field case; the free case is the determinant computation of the steps.

### On units of a field the transfer is the field norm

`U.5/transfer-field-norm` · theorem

For a finite field extension L/F, under the determinant isomorphisms K₁(L) ≅ L^× and K₁(F) ≅ F^× (U.3/SK1-field) the transfer f_* : K₁(L) → K₁(F) is the field norm N_{L/F} = Algebra.norm F restricted to L^×.

**Hypotheses.**

- L/F finite, so L is free of rank [L : F] over F.

**Proof.**

1. Apply U.5/transfer-determinant-norm and invert the determinant isomorphisms of U.3/SK1-field.

**Acceptance.**

- ℂ/ℝ: |z|². ℚ(i)/ℚ: 1 + i ↦ 2. 𝔽_{q^d}/𝔽_q: x ↦ x^{(q^d − 1)/(q − 1)}, onto 𝔽_q^×.
- The composite f_* f^* is u ↦ u^{[L:F]} (U.5/projection-formula).

**Depends on.** this roadmap: `U.5/transfer-determinant-norm`, `U.3/SK1-field`; libraries: `mathlib:Algebra.norm`.

**Sources.**

- `Kbook.2013`, III.1.7, after Corollary 1.7.1 (PDF p. 195; book p. 187): “When j : F →E is a finite field extension, it is easy to see from 1.1.2 that the transfer map j∗: E× →F× is the classical norm map. For this reason, the transfer map is sometimes called the norm map.” — The statement.

### Transfer commutes with base change

`U.5/transfer-base-change` · lemma

Let A be commutative, B an A-algebra that is finitely generated projective as an A-module, A′ a commutative A-algebra, B′ = A′ ⊗_A B and f′ : A′ → B′. Then f′_* ∘ K₁(B → B′) = K₁(A → A′) ∘ f_* : K₁(B) → K₁(A′). In particular for a localisation A′ = M⁻¹A the transfer of B is compatible with that of M⁻¹B, e.g. O_{F,S} ⊂ O_{F′,S′} with F ⊂ F′.

**Hypotheses.**

- A, A′ commutative; B′ is f.g. projective over A′ because base change preserves f.g. projectives (Z.1/extend-scalars-finite-projective).

**Proof.**

1. For h ∈ GL_n(B): A′ ⊗_A res(h) = res′(B′ ⊗_B h) as A′-automorphisms of A′ ⊗_A Bⁿ = B′ⁿ (associativity of base change).
2. The class of an automorphism commutes with scalar extension (U.2/automorphism-class-base-change).

**Acceptance.**

- O_{F,S} → F with B = O_{F′,S′}: B′ = F′, so the transfer on S-units is the restriction of N_{F′/F} (used by ArithmeticKTheory N.1/transfer-and-norm-on-units).
- A′ = A/𝔪: the transfer reduces to the transfer of the fibre algebra.

**Depends on.** this roadmap: `U.5/transfer`, `U.2/automorphism-class-base-change`, `Z.1/extend-scalars-finite-projective`; libraries: `mathlib:TensorProduct`.

**Sources.**

- `Kbook.2013`, Lemma III.1.7 (PDF p. 195; book p. 187): “Any additive functor P(S) T−→P(R) induces a natural homomorphism K1(T): K1(S) →K1(R), and T1 ⊕T2 induces the sum K1(T1) + K1(T2).” — Naturality of the transfer; base change is the composite of additive functors.
- `Kbook.2013`, V.6.6.3 (PDF p. 418; book p. 410): “Suppose that R ⊂R′ is an inclusion of Dedekind domains, with R′ finitely generated as an R-module. Then the fraction field F ′ of R′ is finite over F, so the exact functors M(R′) →M(R) and M(F ′) →M(F) inducing the transfer maps (IV.6.3.3) are compatible.” — The compatibility of transfers with passage to fraction fields that consumers use.

### K₁(B) as a module over K₀(A)

`U.5/K0-action-on-K1` · construction

Let A be commutative and B an A-algebra. For a finitely generated projective A-module P and β ∈ GL_m(B), let [P]·[β] ∈ K₁(B) be the class of the B-automorphism 1_P ⊗ β of P ⊗_A B^m (a f.g. projective B-module; U.2/automorphism-class). This defines a biadditive pairing K₀(A) × K₁(B) → K₁(B) making K₁(B) a module over the ring K₀(A) (Z.3's tensor product ring structure): [A]·x = x and [P ⊗_A Q]·x = [P]·([Q]·x). For B commutative and P of constant rank r, det([P]·x) = det(x)^r.

**Hypotheses.**

- A commutative, B an A-algebra (not necessarily commutative). K₀(A) is Z.1's ring K₀ with Z.3's product.

**Proof.**

1. Additivity in P: (P ⊕ P′) ⊗ B^m ≅ (P ⊗ B^m) ⊕ (P′ ⊗ B^m) carries 1 ⊗ β to (1 ⊗ β) ⊕ (1 ⊗ β), so [P ⊕ P′]·β = [P]·β + [P′]·β (U.2/automorphism-class-direct-sum); hence P ↦ [P]·β factors through K₀(A) (SplitK0's universal property, Z.1/ring-k0).
2. For fixed P, β ↦ [P]·β is a homomorphism compatible with stabilisation (1_P ⊗ (β ⊕ 1) = (1_P ⊗ β) ⊕ 1), hence factors through K₁(B).
3. Module axioms: 1_A ⊗ β = β, and (P ⊗ Q) ⊗_A B^m ≅ P ⊗_A (Q ⊗_A B^m) carries 1 ⊗ β to 1_P ⊗ (1_Q ⊗ β).
4. Determinant: for B commutative, det_B(1_P ⊗ β) = det(β)^{rank P} when P has constant rank (locally P is free of rank r and 1_{A^r} ⊗ β is diag(β, …, β)).

**API.**

- `K1.smulK0` (data): The pairing K₀(A) × K₁(B) → K₁(B).
- `K1.smulK0_class` (simp): [P]·[β] = [1_P ⊗ β].
- `K1.module` (instance): Module (RingK0 A) (Additive (K₁ B)).
- `K1.one_smulK0` (simp): [A]·x = x.
- `K1.smulK0_map` (functoriality): For an A-algebra map B → B′, K₁(B) → K₁(B′) is K₀(A)-linear.
- `K1.det_smulK0` (compatibility): For B commutative and P of constant rank r, det([P]·x) = det(x)^r.

**Unit tests.**

- `K1.smulK0_free` (computation): [Aⁿ]·x = x^n in K₁(B).
- `K1.smulK0_zero` (degenerate): [0]·x = 1 and [A]·x = x.
- `K1.smulK0_ideal_units` (computation): For R = ℤ[√−5] and 𝔞 = (2, 1 + √−5): [𝔞]·[−1] = [−1] in K₁(R), since det(1_𝔞 ⊗ (−1)) = −1: the class-group part of K₀ acts trivially on units.
- `K1.smulK0_kbook` (compatibility): The pairing is the K-book's product [P]·β of Corollary III.1.6.1.

**Acceptance.**

- [Aⁿ]·x = x^n (multiplicatively).
- For a Dedekind domain R and an invertible ideal 𝔞, [𝔞]·u = u on units: det(1_𝔞 ⊗ u) = u.

**Used by.**

- K-book Corollary III.1.7.1: f_*f^* is multiplication by [S] in this module structure
- U.5/projection-formula: both sides of the projection formula
- ArithmeticKTheory N.1/transfer-and-norm-on-units: multiplication by [O_{F′,S′}] acts on units by u ↦ u^d
- GeneralAlgebraicKTheory K.7: products compatible with transfers, compared in degrees (0, 1)

**Depends on.** this roadmap: `U.2/automorphism-class`, `U.2/automorphism-class-direct-sum`, `Z.1/ring-k0`, `U.3/stable-determinant`; other roadmaps: `KTheoryLowDegrees:Z.3/finite-projective-monoidal`; libraries: `mathlib:TensorProduct`.

**Sources.**

- `Kbook.2013`, Corollary III.1.6.1 (PDF pp. 193–194; book pp. 185–186): “If R is commutative and S is an R-algebra, there is a natural product operation K0(R) ⊗K1(S) →K1(S), making K1(S) into a module over the ring K0(R).” — The statement.
- `Kbook.2013`, Proof of Corollary III.1.6.1 (PDF p. 194; book p. 186): “For each β ∈GLm(S), let [P] · β denote the image of the automorphism 1P ⊗β of P ⊗Sm under this map.” — The construction.

### The projection formula against K₀

`U.5/projection-formula` · theorem

Let A be commutative and f : A → B with B a commutative A-algebra that is finitely generated projective as an A-module; write f^* for base change on K₀ (Z.1/ring-k0-map) and on K₁ (U.2/K1-map), f_* for the transfers on K₀ (Z.1/ring-k0-transfer) and K₁ (U.5/transfer). Then (a) f_*(f^*(x)·y) = x·f_*(y) for x ∈ K₀(A), y ∈ K₁(B); (b) f_*(y·f^*(z)) = f_*(y)·z for y ∈ K₀(B), z ∈ K₁(A); (c) f_*f^*(z) = [B]·z for z ∈ K₁(A), so for B of constant rank d, det(f_*f^* u) = u^d on units.

**Hypotheses.**

- The K₀(A)-module structure on K₁ is U.5/K0-action-on-K1.

**Proof.**

1. (a) For P ∈ P(A) and β ∈ GL_m(B): f^*[P]·β is the class of 1_{P⊗B} ⊗_B β on (P ⊗_A B) ⊗_B B^m ≅ P ⊗_A B^m; as an A-automorphism it is 1_P ⊗_A res(β), whose class is [P]·f_*(β).
2. (b) For Q ∈ P(B) and α ∈ GL_n(A): [Q]·f^*α is the class of 1_Q ⊗_B (B ⊗_A α) on Q ⊗_A Aⁿ = Qⁿ; restricted to A it is 1_{res Q} ⊗ α, of class [res Q]·α = f_*[Q]·α.
3. (c) is (b) with y = [B] ∈ K₀(B), f_*[B] = [B as an A-module]; equivalently res(1_B ⊗ α) = [B]·α as in the K-book's proof of Corollary III.1.7.1. The determinant formula is U.5/K0-action-on-K1.

**Acceptance.**

- L/F fields: N_{L/F}(u) = u^{[L:F]} for u ∈ F^×.
- O_{F,S} ⊂ O_{F′,S′} (degree d): f_*f^*(u) = u^d on units even when the Steinitz class of O_{F′,S′} is nontrivial (ArithmeticKTheory N.1).
- The K₀ version f_*(x·f^*y) = f_*(x)·y is K-book Ex. II.2.2(a).

**Depends on.** this roadmap: `U.5/transfer`, `U.5/K0-action-on-K1`, `Z.1/ring-k0-map`, `Z.1/ring-k0-transfer`, `U.2/K1-map`, `U.2/automorphism-class`; libraries: `mathlib:TensorProduct`.

**Sources.**

- `Kbook.2013`, Corollary III.1.7.1 (PDF p. 195; book p. 187): “If R is commutative, the composite K1(R) f∗−→K1(S) f∗−→K1(R) is multiplication by [S] ∈K0(R).” — Part (c).
- `Kbook.2013`, Ex. II.2.2(a) (PDF p. 86; book p. 78): “(a) Show that the transfer map f∗: K0(A) →K0(R) of Example 2.8.1 is a K0(R)-module homomorphism, i.e., that the projection formula holds: f∗(x · f∗y) = f∗(x) · y for every x ∈K0(A), y ∈K0(R).” — The projection formula on K₀, which (a) and (b) extend to K₁.

### The boundary K₁(L) → K₀(k) of a discrete valuation ring

`U.5/dvr-boundary` · construction · planet “Explicit valuation boundary”

Let O be a discrete valuation ring with fraction field L and residue field k. For g ∈ GL_n(L) choose s ∈ O ∖ {0} with α := s·g ∈ M_n(O) (so α is injective on Oⁿ and coker α = Oⁿ/αOⁿ has finite length) and put ∂(g) := (ℓ_O(Oⁿ/αOⁿ) − n·ℓ_O(O/sO))·[k] ∈ K₀(k), with ℓ_O Mathlib's Module.length. This is independent of s, a homomorphism GL_n(L) → K₀(k) compatible with stabilisation, and so defines ∂ : K₁(L) → K₀(k). It is the boundary of K-book Lemma III.3.1 / Corollary III.3.1.1 for S = O ∖ {0} (∂(s) = [O/sO]), read in K₀(k) through the length of finite-length O-modules. Sign convention: ∂(s) = +[O/sO] for s ∈ O ∖ {0}, so ∂(π) = [k], matching K2SymbolsBrauer T.3's normalisation ∂[π] = [R/πR] = 1.

**Hypotheses.**

- O is a discrete valuation ring (Mathlib's IsDiscreteValuationRing) with fraction field L (IsFractionRing O L), residue field k and normalised valuation v : L^× → ℤ (IsDiscreteValuationRing.addVal extended to L^×), v(π) = 1 for a uniformiser π. K₀(k) ≅ ℤ by dimension (Z.2/division-ring-k0), [k] ↦ 1.
- The identification of K₀ of finite-length O-modules with K₀(k) by length is built into the definition; the localisation boundary and its unit-valuation normalisation are SchemeKTheoryOperations S.3's (RS-18 owner 13), and U.5/dvr-boundary-localisation-comparison identifies this explicit boundary with it.

**Proof.**

1. Such s exists: clear the denominators of the entries. det α ≠ 0, so α is injective and coker α is a finitely generated torsion O-module, of finite length.
2. Independence of s: for t ∈ O ∖ {0}, 0 → Oⁿ/αOⁿ →t Oⁿ/tαOⁿ → Oⁿ/tOⁿ → 0 is exact (α injective), so ℓ(coker tα) = ℓ(coker α) + n·ℓ(O/tO) (Module.length_eq_add_of_exact; the K-book's (3.1.3)), and ℓ(O/tsO) = ℓ(O/tO) + ℓ(O/sO).
3. Homomorphism: for injective α, β ∈ M_n(O), 0 → coker β →α coker αβ → coker α → 0 is exact, so ℓ(coker αβ) = ℓ(coker α) + ℓ(coker β) (the K-book's (3.1.2)); with g = α/s, h = β/t, gh = αβ/st.
4. Stabilisation: diag(g, 1) = diag(α, s)/s and ℓ(coker diag(α, s)) = ℓ(coker α) + ℓ(O/sO).
5. K₀(k) is abelian, so the homomorphism GL(L) → K₀(k) kills E(L) = [GL(L), GL(L)] (U.1/whitehead-lemma) and factors through K₁(L) (U.2/K1).

**API.**

- `K1.dvrBoundary` (data): ∂ : K₁(L) →+ K₀(k) (additive notation on K₁).
- `K1.dvrBoundary_mk` (simp): For g ∈ GL_n(L) and s with sg ∈ M_n(O): ∂[g] = (ℓ(coker sg) − n ℓ(O/sO))·[k].
- `K1.dvrBoundary_integral` (simp): For α ∈ M_n(O) invertible over L: ∂[α] = ℓ(coker α)·[k].
- `K1.dvrBoundary_map_O` (simp): ∂ ∘ K₁(O → L) = 0.
- `K1.dvrBoundary_uniformizer` (simp): ∂[π] = [k] for any uniformiser π.
- `K1.dvrBoundary_eq_valuation` (characterisation): ∂(x) = v(det x)·[k] (U.5/dvr-boundary-valuation).

**Unit tests.**

- `K1.dvrBoundary_padic` (computation): O = ℤ_(p), L = ℚ: ∂(p) = 1, ∂(1/p) = −1, and for p = 2, ∂(12) = 2 in K₀(𝔽_p) ≅ ℤ.
- `K1.dvrBoundary_units` (degenerate): ∂ vanishes on K₁(O) → K₁(L): matrices invertible over O have zero cokernel.
- `K1.dvrBoundary_matrix` (computation): O = ℤ_(p), g = (p 1; 0 1): coker g = ℤ_(p)/p, so ∂[g] = 1; and ∂[diag(p, p⁻¹)] = 1 − 1 = 0.
- `K1.dvrBoundary_not_entry` (non-example): ∂ is not the valuation of an entry: g = (p 1; 0 1) has an entry of valuation 0 and one of valuation 1 off the diagonal, while ∂[g] = v(det g) = 1; an entrywise definition fails already here.
- `K1.dvrBoundary_power_series` (compatibility): For O = k[[t]], ∂(t) = [k], agreeing with Mathlib's IsDiscreteValuationRing.addVal_uniformizer (v(t) = 1).

**Acceptance.**

- O = ℤ_(p): ∂(p) = [𝔽_p] ↦ 1, ∂(12) = 2 for p = 2, ∂(1/p) = −1.
- ∂ vanishes on the image of GL(O): for α ∈ GL_n(O), coker α = 0.

**Used by.**

- K-book Theorem III.3.2: the exact sequence K₁(R) → K₁(S⁻¹R) → K₀(R on S) → K₀(R) → K₀(S⁻¹R)
- K-book V.6.6 and V.6.9.1: for a Dedekind domain the boundary K₁(F) → ⊕K₀(R/𝔭) is the divisor map, and ∂(s) = [k] for a parameter s
- ArithmeticKTheory N.2/the-three-classical-rows: imports the valuation convention of the degree-one boundary
- K2SymbolsBrauer T.3/localization-boundary: fixes the normalisation ∂[π] = [R/πR] = 1 used to compare with the tame symbol
- EllipticKTheory E.3/boundaries-in-degrees-one-and-zero: the boundary on a curve is f ↦ Σ ord_x(f)[x]
- U.6/uniformiser-boundary-one: the test ∂(π) = 1

**Depends on.** this roadmap: `U.1/whitehead-lemma`, `U.2/K1`, `Z.2/division-ring-k0`; libraries: `mathlib:IsDiscreteValuationRing`, `mathlib:Module.length`, `mathlib:Module.length_eq_add_of_exact`, `mathlib:IsFractionRing`.

**Sources.**

- `Kbook.2013`, Lemma III.3.1 (PDF p. 206; book p. 198): “Then there is a group homomorphism K1(S−1R) ∂−→K0(R on S) sending each S-isomorphism α to the class [cone(α)] of the mapping cone of α.” — The boundary; the node takes R = O, S = O ∖ {0}.
- `Kbook.2013`, Corollary III.3.1.1 (PDF p. 206; book p. 198): “If S consists of nonzerodivisors then there is a homomorphism K1(S−1R) ∂−→K0HS(R) sending each S-isomorphism α to [coker(α)], and sending s ∈S to [R/sR].” — The cokernel form and the sign convention ∂(s) = [R/sR].
- `Kbook.2013`, Proof of Lemma III.3.1 (PDF p. 207; book p. 199): “Every g ∈GLn(S−1R) can be represented as α/s for some S-isomorphism α and some s ∈S” — The representation g = α/s used in the definition.

### The boundary is the valuation of the determinant

`U.5/dvr-boundary-valuation` · theorem

In the setting of U.5/dvr-boundary, ∂(x) = v(det x)·[k] for every x ∈ K₁(L), where det : K₁(L) ≅ L^× (U.3/SK1-field). In particular ∂(π) = [k], ∂(uπⁿ) = n·[k] for u ∈ O^×, and ∂ does not depend on the choice of uniformiser.

**Hypotheses.**

- O is a discrete valuation ring (Mathlib's IsDiscreteValuationRing) with fraction field L (IsFractionRing O L), residue field k and normalised valuation v : L^× → ℤ (IsDiscreteValuationRing.addVal extended to L^×), v(π) = 1 for a uniformiser π. K₀(k) ≅ ℤ by dimension (Z.2/division-ring-k0), [k] ↦ 1.

**Proof.**

1. Both sides are homomorphisms K₁(L) → K₀(k).
2. K₁(L) is generated by the classes of 1 × 1 matrices x ∈ L^× (U.3/SK1-field: det is an isomorphism with inverse the unit section).
3. For x = a/s with a, s ∈ O ∖ {0}: ∂(x) = (ℓ(O/aO) − ℓ(O/sO))·[k].
4. a = uπ^{v(a)} (IsDiscreteValuationRing.eq_unit_mul_pow_irreducible) and ℓ(O/π^mO) = m (the chain π^iO/π^mO, 0 ≤ i ≤ m, is a composition series; Module.length_quotient), so ℓ(O/aO) = v(a).
5. Hence ∂(x) = (v(a) − v(s))[k] = v(x)[k].

**Acceptance.**

- O = ℤ_(p): ∂(−p) = 1 and ∂(p²/3) = 2 for p ≠ 3.
- O = k[[t]]: ∂(t) = 1.
- For g ∈ GL_n(L), ∂[g] = v(det g), e.g. g = (p 1; 0 1) gives 1.

**Depends on.** this roadmap: `U.5/dvr-boundary`, `U.3/SK1-field`; libraries: `mathlib:IsDiscreteValuationRing.eq_unit_mul_pow_irreducible`, `mathlib:IsDiscreteValuationRing.addVal`, `mathlib:IsDiscreteValuationRing.addVal_uniformizer`, `mathlib:Module.length_quotient`.

**Sources.**

- `Kbook.2013`, Proof of Theorem V.6.9.1 (PDF p. 422; book p. 414): “Since ∂(s′) = [R′/s′R′] = [k] by III.3.1.1, we see that” — ∂ of a parameter is the class of the residue field.
- `Kbook.2013`, V.6.6, Dedekind domains (PDF p. 417; book p. 409): “Writing K1(R) = R× ⊕SK1(R) (see III.1.1.1), the formula 6.1.2 allows us to identify the ending with the sequence 1 →R× →F × div→D(R) →K0(R) →Z →0 of I.3.6.” — The boundary on F^× is the divisor map, whose component at 𝔭 is ord_𝔭.

### The degree-one localisation sequence of a discrete valuation ring

`U.5/dvr-units-sequence` · theorem

In the setting of U.5/dvr-boundary, 1 → K₁(O) → K₁(L) →∂ K₀(k) → 0 is exact: under the determinant K₁(O) ≅ O^× (U.3/SK1-local) and K₁(L) ≅ L^× (U.3/SK1-field) the first map is the inclusion O^× ⊆ L^× and ∂ is v. Correspondingly the next map of K-book Theorem III.3.2, K₀(k) → K₀(O), [k] ↦ [O/πO] = [O] − [πO] = 0, vanishes.

**Hypotheses.**

- O is a discrete valuation ring (Mathlib's IsDiscreteValuationRing) with fraction field L (IsFractionRing O L), residue field k and normalised valuation v : L^× → ℤ (IsDiscreteValuationRing.addVal extended to L^×), v(π) = 1 for a uniformiser π. K₀(k) ≅ ℤ by dimension (Z.2/division-ring-k0), [k] ↦ 1.

**Proof.**

1. K₁(O) → K₁(L) is O^× ⊆ L^× by naturality of det (U.3/stable-determinant), hence injective.
2. ∂ = v ∘ det by U.5/dvr-boundary-valuation; v is onto (v(π) = 1) and ker v = O^× (IsDiscreteValuationRing.addVal_eq_zero_iff for elements of O, and v(x) = 0 forces x, x⁻¹ ∈ O).
3. [O/πO] = [O] − [πO] = 0 in K₀(O) since πO ≅ O.

**Acceptance.**

- O = ℤ_(p): 1 → ℤ_(p)^× → ℚ^× → ℤ → 0.
- The Dedekind version (the divisor sequence 1 → R^× → F^× → ⊕ℤ → K₀(R) → ℤ → 0) is ArithmeticKTheory N.2/the-three-classical-rows'.

**Depends on.** this roadmap: `U.5/dvr-boundary-valuation`, `U.3/SK1-local`, `U.3/SK1-field`, `U.3/stable-determinant`; libraries: `mathlib:IsDiscreteValuationRing.addVal_eq_zero_iff`.

**Sources.**

- `Kbook.2013`, Theorem III.3.2 (PDF p. 209; book p. 201): “Theorem 3.2. Let S be a multiplicatively closed set of central elements in a ring R. Then the map ∂of Lemma 3.1 fits into an exact sequence K1(R) →K1(S−1R) ∂−→K0(R on S) →K0(R) →K0(S−1R).” — The sequence, specialised to a DVR.

### The explicit boundary is the localisation boundary

`U.5/dvr-boundary-localisation-comparison` · comparison

Let O be a discrete valuation ring with fraction field L and residue field k, and let ∂_S : K₁(L) → K₀(k) be the boundary of the localisation sequence K(k) → K(O) → K(L) of SchemeKTheoryOperations S.3, read on K₁(L) = π₁K(L). Let λ : K₁(L) = GL(L)/E(L) → π₁K(L) be the canonical map sending the class of g ∈ GL_n(L) to the loop of g in BGL(L) ⊂ BGL(L)⁺ (StableHomotopyKTheory H.1 and H.3, GeneralAlgebraicKTheory K.2:plus/plus-equals-Q). Then ∂_S ∘ λ = ∂, where ∂ is the explicit cokernel-length boundary of U.5/dvr-boundary. In particular both send the class of a uniformiser π to [k] ↦ 1 ∈ ℤ ≅ K₀(k), and both vanish on O^×.

**Hypotheses.**

- O is a discrete valuation ring (Mathlib's IsDiscreteValuationRing) with fraction field L, residue field k and normalised valuation v, v(π) = 1; K₀(k) ≅ ℤ by dimension (Z.2/division-ring-k0).
- ∂_S and its unit-valuation normalisation ∂_S(λ(u)) = v(u)·[k] for u ∈ L^× are S.3's (RS-18 owner 13), SchemeKTheoryOperations S.3/dvr-boundary and S.3/dvr-boundary-unit-valuation, with λ = S.3/unit-loop-class. λ uses only the functoriality of BGL(−)⁺ and π₁BG = G; it does not use U.6's identification π₁BGL(L)⁺ ≅ GL(L)/E(L).

**Proof.**

1. Both sides are homomorphisms K₁(L) → K₀(k): ∂ by U.5/dvr-boundary, ∂_S ∘ λ as a composite of homomorphisms.
2. K₁(L) is generated by the classes of 1 × 1 matrices u ∈ L^× (U.3/SK1-field: det is an isomorphism with inverse the unit section U.3/units-to-K1).
3. On such a class, ∂(u) = v(u)·[k] (U.5/dvr-boundary-valuation) and ∂_S(λ(u)) = v(u)·[k] (S.3/dvr-boundary-unit-valuation). Hence the two homomorphisms agree on generators, so they are equal.

**Acceptance.**

- The composite ∂_S ∘ λ, not ∂_S on an abstract identification, is compared with ∂.
- The uniformiser goes to [k] ↦ 1 on both sides, with S.3's sign convention; no second normalisation is fixed in U.5.

**Depends on.** this roadmap: `U.5/dvr-boundary`, `U.5/dvr-boundary-valuation`, `U.3/SK1-field`, `U.3/units-to-K1`, `Z.2/division-ring-k0`; other roadmaps: `StableHomotopyKTheory:H.1/nerve-and-classifying-space`, `StableHomotopyKTheory:H.3/plus-construction-universal-property`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `SchemeKTheoryOperations:S.3/dvr-boundary`, `SchemeKTheoryOperations:S.3/dvr-boundary-unit-valuation`, `SchemeKTheoryOperations:S.3/unit-loop-class`; libraries: `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `Kbook.2013`, Lemma III.3.1 (PDF p. 206; book p. 198): “Then there is a group homomorphism K1(S−1R) ∂−→K0(R on S) sending each S-isomorphism α to the class [cone(α)] of the mapping cone of α.” — The boundary; the node takes R = O, S = O ∖ {0}.
- `Kbook.2013`, Proof of Theorem V.6.9.1, PDF p. 422 (book p. 414); the printed 'III.1.1' is III.3.1.1 (KTheoryLowDegrees/E109): “If a′i ∈ R× is a lift of ai and s ∈ R is a parameter then ∂: K1(F) → K0(k) sends s to [k] by III.1.1.” — The boundary of the higher localisation sequence of a DVR, on K₁(F), is computed by the classical formula of Corollary III.3.1.1: a parameter goes to [k].

## U.6 — Homotopy comparison and tests

*Coverage: partial.* π₁BGL(A)⁺ ≅ GL(A)/E(A) with loop classes, naturality, determinant and transfer (U.6/pi1-plus-construction, pi1-plus-determinant, pi1-plus-transfer), from StableHomotopyKTheory H.1/H.3 and GeneralAlgebraicKTheory K.2:plus node ids; computations K₁(ℤ) = {±1} (Tau Ceti's SL_n(ℤ) generation), K₁(𝔽_q) = 𝔽_q^×, K₁(ℤ[1/p]) = ℤ/2 ⊕ ℤ (by the Euclidean route, cross-checked with U.4), K₁ of a finite product of fields; tests: triangular determinant class, diag(g, g⁻¹) versus diag(g, 1), ∂(π) = 1. These are the computations that KTheoryFiniteLocalFields L.1, ArithmeticKTheory N.8 and GeneralAlgebraicKTheory K.2:low-degree-comparisons consume. The U.1–U.2 lemmas behind the tests (U.2/block-triangular-class, U.1/whitehead-diagonal) are cited, not restated.

- Remaining: Complete U.6/relative-K1-homotopy-comparison (gap: K-book Ex. IV.1.15 is a hint; needs K2SymbolsBrauer T.1:plus and T.6).
- Remaining: StableHomotopyKTheory H.3/plus-construction-universal-property records an unread proof boundary (obstruction theory); the naturality statements of U.6 rest on it.

### π₁ of BGL(A)⁺ is K₁(A)

`U.6/pi1-plus-construction` · theorem · planet “π₁ of BGL(A)⁺”

Let A be a ring, BGL(A) the classifying space of the group GL(A) of U.1 (StableHomotopyKTheory H.1: the realisation of the one-object category, a K(GL(A), 1)), and i : BGL(A) → BGL(A)⁺ a plus construction relative to the perfect normal subgroup E(A) (U.1/stable-elementary-perfect, U.1/stable-elementary-normal; StableHomotopyKTheory H.3). Then i_* : GL(A) = π₁BGL(A) → π₁BGL(A)⁺ is surjective with kernel E(A), giving θ_A : K₁(A) = GL(A)/E(A) ≅ π₁BGL(A)⁺ (K-book IV Definition 1.1). For g ∈ GL_n(A) ⊆ GL(A) the loop of BGL(A) given by the edge g of the nerve maps to the class θ_A[g]. θ is natural: a ring homomorphism f : A → A′ induces BGL(A)⁺ → BGL(A′)⁺, unique up to homotopy, and on π₁ it is K₁(f) (U.2/K1-map). Through GeneralAlgebraicKTheory K.2:plus (the + = Q theorem), θ_A identifies U.2's K₁(A) with π₁ of the basepoint component of the K-theory space of A.

**Hypotheses.**

- Spaces are CW complexes; the plus construction is unique up to homotopy under BGL(A) (H.3's universal property, whose obstruction-theory proof is recorded there as an unread boundary).

**Proof.**

1. π₁(BG) = G canonically for a group G regarded as a one-object category, the loop of a 1-simplex g being g (H.1/coverings-fundamental-group-local-coefficients).
2. E(A) is perfect and normal in GL(A) (U.1), so H.3/plus-construction-by-cell-attachment gives i with i_* onto and kernel the normal closure of E(A), which is E(A); the homotopy fibre is acyclic (H.3/acyclic-spaces-and-maps).
3. The first isomorphism theorem gives θ_A, and the loop of g maps to θ_A[g] by construction.
4. Naturality: GL(f) maps E(A) into E(A′), so BGL(A) → BGL(A′) → BGL(A′)⁺ kills E(A) on π₁ and factors through i uniquely up to homotopy (H.3/plus-construction-universal-property); on π₁ the factorisation is GL(A)/E(A) → GL(A′)/E(A′), U.2's K₁(f).
5. K.2:plus/plus-equals-Q: ΩBQP(A) ≃ K₀(A) × BGL(A)⁺ after a choice of component representatives, so π₁ of the basepoint component is π₁BGL(A)⁺ ≅ K₁(A).

**Acceptance.**

- A = ℤ: π₁BGL(ℤ)⁺ ≅ {±1}, generated by the loop of (−1) ∈ GL₁(ℤ).
- K-book IV.1: 'By construction, K₁(R) agrees with the group K₁(R) = GL(R)/E(R)'.
- Two plus constructions give the same θ up to the canonical homotopy equivalence between them.

**Depends on.** this roadmap: `U.1/stable-elementary-perfect`, `U.1/stable-elementary-normal`, `U.1/whitehead-lemma`, `U.2/K1`, `U.2/K1-map`; other roadmaps: `StableHomotopyKTheory:H.1/nerve-and-classifying-space`, `StableHomotopyKTheory:H.1/coverings-fundamental-group-local-coefficients`, `StableHomotopyKTheory:H.3/acyclic-spaces-and-maps`, `StableHomotopyKTheory:H.3/plus-construction-by-cell-attachment`, `StableHomotopyKTheory:H.3/plus-construction-universal-property`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`.

**Sources.**

- `Kbook.2013`, Definition IV.1.1 (PDF p. 268; book p. 260): “The notation BGL(R)+ will denote any CW complex X which has a distinguished map BGL(R) →BGL(R)+ such that (1) π1BGL(R)+ ≅ K1(R), and the natural map from GL(R) = π1BGL(R) to π1BGL(R)+ is onto with kernel E(R);” — The comparison; condition (1) is what the node proves for H.3's construction.
- `Kbook.2013`, After Definition IV.1.1 (PDF p. 269; book p. 261): “By construction, K1(R) agrees with the group K1(R) = GL(R)/E(R) defined in Chapter III.” — The identification of loop classes with quotient classes.
- `Kbook.2013`, Theorem IV.1.5(2) (PDF p. 271; book p. 263): “(2) Let f : X →Y be a +–construction relative to P, and g: X →Z a map such that P vanishes in π1(Z). Then there is a map h: Y →Z, unique up to homotopy, such that g = hf.” — The universal property used for naturality.

### The determinant on π₁ of BGL(A)⁺

`U.6/pi1-plus-determinant` · lemma

For a commutative ring A, the determinant det : GL(A) → A^× induces Bdet : BGL(A) → B(A^×), which factors up to homotopy through BGL(A)⁺ because E(A) ⊆ SL(A) = ker det (H.3's universal property; B(A^×) is a K(A^×, 1)). On π₁ the factorisation is det ∘ θ_A⁻¹ : π₁BGL(A)⁺ → A^×, U.3's stable determinant.

**Hypotheses.**

- A commutative; B(A^×) the classifying space of the abelian group A^× (H.1).

**Proof.**

1. det kills E(A), so π₁(Bdet) = det vanishes on the kernel E(A) of i_*; H.3/plus-construction-universal-property gives h : BGL(A)⁺ → B(A^×) with h ∘ i ≃ Bdet.
2. On π₁: h_* ∘ i_* = det, and i_* = θ_A ∘ (GL(A) → K₁(A)) (U.6/pi1-plus-construction), so h_* ∘ θ_A = U.3's det on K₁(A).

**Acceptance.**

- A = F a field: π₁BGL(F)⁺ ≅ F^× through det (K₁(F) = F^×, U.3/SK1-field); KTheoryFiniteLocalFields L.1 recovers the degree-one determinant this way.
- A = ℤ: the loop of (−1) maps to −1.

**Depends on.** this roadmap: `U.6/pi1-plus-construction`, `U.3/stable-determinant`; other roadmaps: `StableHomotopyKTheory:H.3/plus-construction-universal-property`, `StableHomotopyKTheory:H.1/nerve-and-classifying-space`.

**Sources.**

- `Kbook.2013`, Theorem IV.1.8 (PDF p. 273; book p. 265): “Theorem 1.8. The map i : BGL(R) →BGL(R)+ is universal for maps into H-spaces.” — The factorisation through BGL(R)⁺ of maps to H-spaces such as B(A^×).
- `Kbook.2013`, Example III.1.1.1 (PDF p. 188; book p. 180): “It is traditional to write SK1(R) for the kernel of the induced surjection det: K1(R) →R×.” — The determinant on K₁.

### The transfer on π₁ of BGL(A)⁺

`U.6/pi1-plus-transfer` · lemma

Let f : A → B be a ring homomorphism with B free of rank d as a right A-module, with a chosen basis. Restriction of scalars gives ρ : GL_n(B) → GL_{nd}(A), compatible with stabilisation and hence a homomorphism ρ : GL(B) → GL(A) with ρ(E(B)) ⊆ E(A); it induces Bρ⁺ : BGL(B)⁺ → BGL(A)⁺ (K-book IV.1.1.3), unique up to homotopy, and on π₁, θ_A⁻¹ ∘ π₁(Bρ⁺) ∘ θ_B is U.5's transfer f_* : K₁(B) → K₁(A).

**Hypotheses.**

- B free of finite rank d over A with a fixed basis; a change of basis changes ρ by an inner automorphism of GL(A), which acts trivially on π₁BGL(A)⁺ ≅ K₁(A) (abelian).

**Proof.**

1. ρ(diag(g, 1)) = diag(ρ(g), 1_d), so ρ is compatible with stabilisation.
2. E(B) is perfect (U.1/stable-elementary-perfect), so ρ(E(B)) ⊆ [GL(A), GL(A)] = E(A) (U.1/whitehead-lemma).
3. BGL(B) → BGL(A) → BGL(A)⁺ kills E(B) on π₁ and factors through BGL(B)⁺ (H.3/plus-construction-universal-property).
4. On π₁ the induced map sends θ_B[g] to θ_A[ρ(g)] = θ_A(f_*[g]) (U.5/transfer, free case).

**Acceptance.**

- ℂ/ℝ: the loop of z ∈ GL₁(ℂ) goes to the loop of (a −b; b a), whose determinant is |z|².
- For B = A × A the map is induced by (g, h) ↦ diag(g, h).

**Depends on.** this roadmap: `U.6/pi1-plus-construction`, `U.5/transfer`, `U.1/stable-elementary-perfect`, `U.1/whitehead-lemma`; other roadmaps: `StableHomotopyKTheory:H.3/plus-construction-universal-property`.

**Sources.**

- `Kbook.2013`, IV.1.1.3, Transfer maps (PDF p. 269; book p. 261): “If R →S is a ring map such that S ≅ Rd as an R-module, the isomorphisms Sm ≅ Rmd induce a group map GL(S) →GL(R) and hence a map BGL(S)+ →BGL(R)+, again unique up to homotopy. On homotopy groups, the maps Kn(S) →Kn(R) are called transfer maps.” — The statement.

### Relative K₁ and the homotopy fibre

`U.6/relative-K1-homotopy-comparison` · comparison · also realises U.5

Let A be a ring, I a two-sided ideal and K(A, I) the homotopy fibre of K(A) → K(A/I) (GeneralAlgebraicKTheory K.5/relative-K-theory-and-excision-boundary, the owner of the generic relative fibre). There are natural isomorphisms K₁(A, I) = GL(I)/E(A, I) ≅ π₁K(A, I) (U.5/relative-K1) and K₀(I) ≅ π₀K(A, I) (U.5/relative-K0-of-ideal), compatible with the maps to K₁(A) ≅ π₁K(A) and K₀(A) (U.6/pi1-plus-construction, K.2:plus) and with the boundaries K₁(A/I) → K₀(I) and K₂(A/I) → K₁(A, I): the long exact homotopy sequence of the fibration ends in the classical sequence of U.5/relative-sequence-degree-one, U.5/ideal-sequence-degree-zero and K-book Theorem III.5.7.1.

**Hypotheses.**

- The relative fibre is K.5's, its exact sequence H.2's, the K-theory spaces K.2:plus's and the classical groups U.5's.
- The proof is a gap (see gaps): the K-book states the comparison as an exercise with a hint, and the proof needs π₂BGL(A)⁺ = K₂(A) (K2SymbolsBrauer T.1:plus) and the classical K₂-sequence (K2SymbolsBrauer T.6), which the atlas places downstream of U.6.

**Proof.**

1. The fibration gives ⋯ → π₂K(A/I) → π₁K(A, I) → π₁K(A) → π₁K(A/I) → π₀K(A, I) → K₀(A) → K₀(A/I) (H.2/homotopy-fibre-and-long-exact-sequence; K.5).
2. Split case (the hint 'Use Ex. III.2.7'): for the double ring D = A ⊕ I with pr split by Δ (U.5/augmented-double-ring), the fibre sequence of K(D) → K(A) splits, so π₁K(D, 0 ⊕ I) = ker(K₁(D) → K₁(A)) = K₁(D, 0 ⊕ I) (U.5/relative-K1-split, U.6/pi1-plus-construction for D and A), and π₀K(D, 0 ⊕ I) = K₀(I) (the hint 'π₀K(R ⊕ I, 0 ⊕ I) must be K₀(I)').
3. Compare the fibres of D → A (pr) and A → A/I along add : (D, 0 ⊕ I) → (A, I), and apply the five lemma to the two long exact sequences, using π₂ = K₂ and the classical relative K₂-sequence (gap: blocked imports).
4. Naturality in (A, I) follows from that of K.5's fibre and of U.5's groups.

**Acceptance.**

- I = A: K(A, A) is the fibre of K(A) → K(0) ≃ ∗, and the comparison is U.6/pi1-plus-construction.
- A = ℤ/p², I = (p): π₁K(A, I) ≅ ℤ/p and π₀K(A, I) = K₀(I) = 0 (I radical).
- K-book IV.1.11: 'K₀(R, I) and K₁(R, I) agree with the relative groups defined in Ex. II.2.3 and III.2.2'.

**Depends on.** this roadmap: `U.6/pi1-plus-construction`, `U.5/relative-K1`, `U.5/relative-K0-of-ideal`, `U.5/relative-K1-split`, `U.5/augmented-double-ring`, `U.5/relative-sequence-degree-one`, `U.5/ideal-sequence-degree-zero`; other roadmaps: `GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`.

**Sources.**

- `Kbook.2013`, IV.1.11, Relative K-groups (PDF pp. 275–276; book pp. 267–268): “When R′ = R/I for some ideal I, we write K(R, I) for K(R →R/I). It is easy to see (Ex. 1.15) that K0(R, I) and K1(R, I) agree with the relative groups” — The statement.
- `Kbook.2013`, Ex. IV.1.15 (PDF p. 283; book p. 275): “Use Ex. III.2.7 to show that π1K(R →R/I) is isomorphic to the group K1(R, I) of III.2.2, and that the maps K2(R/I) →K1(R, I) →K1(R) in III.5.7.1 agree with those of 1.11.” — The hint; no proof is given in the source.

### Elementary generation over a Euclidean domain

`U.6/euclidean-elementary-generation` · lemma

Let R be a commutative ring with a Euclidean division: a well-founded relation ≺ on R such that for all x and all y ≠ 0 there are q, r ∈ R with x = q·y + r and (r = 0 or r ≺ y). Every Mathlib EuclideanDomain has one, its relation r. For every n ≥ 1, SL_n(R) is generated by the elementary transvections e_ij(r), i ≠ j (SL_n(R) = E_n(R)); hence SL(R) = E(R), SK₁(R) = 0 and det : K₁(R) ≅ R^×. For R = ℤ this is Tau Ceti's Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top, whose Euclidean argument the node generalises.

**Hypotheses.**

- R a commutative ring with a Euclidean division as in the statement. The condition is a proposition, so the theorem applies to a ring such as ℤ[1/m] without a new EuclideanDomain instance, which would carry its own quotient and remainder functions beside the ring structure.

**Proof.**

1. For σ ∈ SL_n(R) (n ≥ 2), reduce the first column by row operations: while two entries are nonzero, subtract from one a multiple of an r-minimal one (EuclideanDomain.div_add_mod); this terminates by well-foundedness of r.
2. The remaining nonzero entry u generates the ideal of the column entries, which is R because the column of an invertible matrix is unimodular; so u is a unit.
3. Move it to position (1, 1) by a signed permutation in E_n(R) (U.1/signed-transposition) and make it 1 with diag(u⁻¹, u) ∈ E_n(R) (Tau Ceti's Matrix.SpecialLinearGroup.diag2nUnit_decompose).
4. Clear the first row by column operations and induct on n with the (n − 1) × (n − 1) block of determinant 1; SL₁ = 1.
5. Stably, SL(R) = E(R) and SK₁(R) = SL(R)/E(R) = 0 (U.3/special-linear-mod-elementary), so det is an isomorphism (U.3/K1-units-split).

**Acceptance.**

- R = ℤ: Tau Ceti's theorem, and K₁(ℤ) = {±1} (U.6/K1-integers).
- R = F[t]: K₁(F[t]) = F^× (K-book Example III.1.3.5).
- R = ℤ[1/p] (U.6/localised-integers-euclidean) and R = ℤ[i]: SK₁ = 0, consistent with U.4/bass-milnor-serre.

**Depends on.** this roadmap: `U.1/signed-transposition`, `U.1/elementary-subgroup`, `U.3/special-linear-mod-elementary`, `U.3/K1-units-split`; libraries: `mathlib:EuclideanDomain`, `tauceti:Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top`, `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose`.

**Sources.**

- `Kbook.2013`, Ex. III.1.5 (PDF p. 198; book p. 190): “Let R be a Euclidean domain, such as Z or the polynomial ring F[t] over a field. Show that En(R) = SLn(R) for all n, and hence that SK1(R) = 0.” — The statement, an exercise in the source; the proof follows Tau Ceti's ℤ argument.
- `Kbook.2013`, Example III.1.3.5 (PDF p. 191; book p. 183): “Similarly, if R is a Euclidean domain such as Z or F[t] then it is easy to show that SK1(R) = 1 and hence K1(R) = R×; see Ex. 1.5.” — The consequence for K₁.

### ℤ[1/m] is a Euclidean domain

`U.6/localised-integers-euclidean` · lemma

For an integer m ≥ 1, the ring ℤ[1/m] (Mathlib's Localization.Away (m : ℤ)) has a Euclidean division in the sense of U.6/euclidean-elementary-generation, for the relation φ(x) < φ(y), where φ(0) = 0 and φ(x) = |a| when x = u·a with u a unit and a ∈ ℤ coprime to m.

**Hypotheses.**

- m ≥ 1; the units of ℤ[1/m] are ±∏ p_i^{k_i} over the primes p_i dividing m.

**Proof.**

1. Every nonzero x ∈ ℤ[1/m] is uniquely u·a with u a unit and a > 0 an integer coprime to m (factor out the primes of m), so φ is well defined.
2. Division by y = v·b (b ≥ 1 coprime to m): write x = c/m^k with c ∈ ℤ and choose t ∈ ℤ with t·m^k ≡ 1 (mod b); then x ≡ ct modulo bℤ[1/m].
3. Divide ct by b in ℤ: ct = q₀b + r₀ with 0 ≤ r₀ < b; then x = q y + r₀ for some q ∈ ℤ[1/m], and r₀ = 0 or φ(r₀) ≤ r₀ < b = φ(y).

**Acceptance.**

- m = 1: ℤ itself.
- m = 2: 3/2 = 1·(1/2)·3, φ(3/2) = 3; dividing 7 by 3/2 leaves remainder 1.

**Depends on.** libraries: `mathlib:Localization.Away`, `mathlib:EuclideanDomain`, `mathlib:Int.euclideanDomain`.

**Sources.**

- `Kbook.2013`, Example III.1.3.5 (PDF p. 191; book p. 183): “Similarly, if R is a Euclidean domain such as Z or F[t] then it is easy to show that SK1(R) = 1 and hence K1(R) = R×; see Ex. 1.5.” — The Euclidean route to SK₁ = 0, applied to ℤ[1/m]; the Euclidean norm is the standard prime-to-m part.

### K₁(ℤ) = {±1}

`U.6/K1-integers` · theorem · planet “K₁ of the integers”

det : K₁(ℤ) ≅ ℤ^× = {±1}; SK₁(ℤ) = 0. The generator is the class of (−1) ∈ GL₁(ℤ), and diag(−1, −1) ∈ SL₂(ℤ) = E₂(ℤ) has trivial class.

**Hypotheses.**

- ℤ^× = {1, −1} (Mathlib's Int.units_eq_one_or).

**Proof.**

1. Tau Ceti's closure_range_toSpecialLinearGroup_eq_top gives SL_n(ℤ) = E_n(ℤ) for all n, hence SL(ℤ) = E(ℤ) and SK₁(ℤ) = SL(ℤ)/E(ℤ) = 0 (U.3/special-linear-mod-elementary).
2. By U.3/K1-units-split, det : K₁(ℤ) ≅ ℤ^× = {±1}.

**Acceptance.**

- Agrees with U.4 for F = ℚ, S = ∅: μ(ℚ) ⊕ ℤ^{1+0+0−1} = {±1} (U.4/K1-S-integers-structure).
- ArithmeticKTheory N.8 consumes this value (the first four K-groups of ℤ).
- Via U.6/pi1-plus-construction, π₁BGL(ℤ)⁺ ≅ ℤ/2.

**Depends on.** this roadmap: `U.3/special-linear-mod-elementary`, `U.3/K1-units-split`; libraries: `tauceti:Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top`, `mathlib:Int.units_eq_one_or`.

**Sources.**

- `Kbook.2013`, Example III.1.3.5 (PDF p. 191; book p. 183): “In particular, K1(Z) = Z× = {±1} and K1(F[t]) = F ×.” — The value.

### K₁ of a finite field

`U.6/K1-finite-field` · theorem · planet “K₁ of a finite field”

For a finite field 𝔽_q, det : K₁(𝔽_q) ≅ 𝔽_q^×, a cyclic group of order q − 1; moreover K₁(𝔽_q) = GL_n(𝔽_q)/SL_n(𝔽_q) for every n ≥ 1, as SL_n(𝔽_q) = E_n(𝔽_q) in each rank.

**Hypotheses.**

- 𝔽_q a finite field with q elements.

**Proof.**

1. U.3/SK1-field: SK₁(F) = 1 and det : K₁(F) ≅ F^× for every field; in each rank SL_n(F) = E_n(F) (U.3/field-special-linear-eq-elementary, from Tau Ceti's closure_range_toSpecialLinearGroup_eq_top_of_field).
2. 𝔽_q^× is cyclic (Mathlib's isCyclic_subgroup_units, a finite subgroup of the units of a domain) of order q − 1 (Fintype.card_units).

**Acceptance.**

- 𝔽₂: K₁ = 0 although GL₂(𝔽₂) ≅ S₃ is nonabelian (K-book Example III.1.1.2).
- 𝔽₃: K₁ = {±1}.
- KTheoryFiniteLocalFields L.1 consumes this as the degree-one case K₁(𝔽_q) ≅ ℤ/(q − 1) of Quillen's computation, with the determinant.

**Depends on.** this roadmap: `U.3/SK1-field`, `U.3/field-special-linear-eq-elementary`; libraries: `mathlib:isCyclic_subgroup_units`, `mathlib:Fintype.card_units`.

**Sources.**

- `Kbook.2013`, III.1.2.2 (PDF p. 189; book p. 181): “If F is a field this obstruction is F ×, and is measured by the determinant. That is, En(F) = SLn(F) for all n ≥1.” — The rank-by-rank statement.
- `Kbook.2013`, Example III.1.3.5 (PDF p. 191; book p. 183): “Example 1.3.5. If F is a field then K1(F) = F×, because we have already seen that E(F) = SL(F).” — K₁ of a field.

### The units of ℤ[1/p]

`U.6/units-of-integers-away-from-p` · lemma

For a prime p, ℤ[1/p]^× = {±p^k : k ∈ ℤ}, and (sign, v_p) : ℤ[1/p]^× ≅ {±1} × ℤ.

**Hypotheses.**

- ℤ[1/p] = Localization.Away (p : ℤ), identified with Set.integer {(p)} ℚ by U.4/s-integers-ring-of-fractions.

**Proof.**

1. If x = a/p^k is a unit with inverse b/p^l (a, b ∈ ℤ), then ab = p^{k+l}, so a = ±p^j by unique factorisation in ℤ.
2. Conversely ±p^k are units; sign and v_p are homomorphisms and together injective.

**Acceptance.**

- The torsion is {±1} = μ(ℚ) and the rank is 1 = r₁ + r₂ + |S| − 1 (U.4/s-unit-theorem).
- p = 2: 3 is not a unit of ℤ[1/2].

**Depends on.** this roadmap: `U.4/s-integers-ring-of-fractions`; libraries: `mathlib:Localization.Away`, `mathlib:padicValRat`.

**Sources.**

- `Kbook.2013`, Example III.1.3.6 (PDF p. 191; book p. 183): “We mention that if R is finitely generated over Z then, by the Dirichlet Unit Theorem, K1(R) = R× is a finitely generated abelian group isomorphic to µ(F) ⊕Zs−1, where µ(F) denotes the cyclic group of all roots of unity in F” — The shape of the answer for R = ℤ[1/p] (s = 2).

### K₁(ℤ[1/p]) = ℤ/2 ⊕ ℤ

`U.6/K1-integers-away-from-p` · theorem · planet “K₁ of ℤ[1/p]”

For a prime p, det : K₁(ℤ[1/p]) ≅ ℤ[1/p]^× = {±1} × p^ℤ ≅ ℤ/2 ⊕ ℤ; SK₁(ℤ[1/p]) = 0. The class of −1 generates the torsion and the class of p the free part.

**Hypotheses.**

- ℤ[1/p] as in U.6/units-of-integers-away-from-p.

**Proof.**

1. ℤ[1/p] has a Euclidean division (U.6/localised-integers-euclidean), so SK₁ = 0 and det is an isomorphism (U.6/euclidean-elementary-generation).
2. The units are {±p^k} (U.6/units-of-integers-away-from-p).

**Acceptance.**

- Agrees with U.4 for F = ℚ, S = {(p)}: μ(ℚ) ⊕ ℤ^{1+0+1−1} (U.4/K1-S-integers-structure, via U.4/s-integers-ring-of-fractions).
- The boundary ∂ : K₁(ℚ) → K₀(𝔽_p) of O = ℤ_(p) (U.5/dvr-boundary-valuation) sends p ↦ 1 and −1 ↦ 0: it detects the free part.
- ArithmeticKTheory N.8's S-integer exact sequence for ℤ[1/p] consumes this.

**Depends on.** this roadmap: `U.6/localised-integers-euclidean`, `U.6/euclidean-elementary-generation`, `U.6/units-of-integers-away-from-p`.

**Sources.**

- `Kbook.2013`, Example III.1.3.5 (PDF p. 191; book p. 183): “Similarly, if R is a Euclidean domain such as Z or F[t] then it is easy to show that SK1(R) = 1 and hence K1(R) = R×; see Ex. 1.5.” — The Euclidean route, applied to ℤ[1/p].
- `Kbook.2013`, Example III.1.3.6 (PDF p. 191; book p. 183): “Bass, Milnor and Serre proved in [19, 4.3] that SK1(R) = 0, so that K1(R) ≅ R×.” — The arithmetic route, which gives the same answer.

### K₁ of a finite product of fields

`U.6/K1-product-of-fields` · theorem · planet “K₁ of a product of fields”

For fields F₁, …, F_r, K₁(F₁ × ⋯ × F_r) ≅ F₁^× × ⋯ × F_r^×. The two routes agree: the product decomposition K₁(∏ A_i) ≅ ∏ K₁(A_i) (U.2/K1-pi) followed by det for each field (U.3/SK1-field), and det for the commutative semilocal ring ∏ F_i (U.3/SK1-semilocal) with (∏ F_i)^× = ∏ F_i^×.

**Hypotheses.**

- Finitely many fields; ∏ F_i is commutative semilocal with maximal ideals the kernels of the projections.

**Proof.**

1. U.2/K1-pi and U.3/SK1-field give the first isomorphism.
2. U.3/SK1-semilocal gives K₁(∏ F_i) ≅ (∏ F_i)^×, and (∏ F_i)^× = ∏ F_i^× (Mathlib's MulEquiv.prodUnits).
3. Both are induced by the determinant, which is compatible with the projections (U.3/stable-determinant), so they agree.

**Acceptance.**

- F × F: K₁ = F^× × F^×, the degree-one companion of Z.2's K₀(F × F) ≅ ℤ².
- 𝔽₂ × 𝔽₃: K₁ ≅ {±1}.
- A rank-one-only model of K₁ (a single unit group) fails here: the two factors are independent.

**Depends on.** this roadmap: `U.2/K1-pi`, `U.3/SK1-field`, `U.3/SK1-semilocal`, `U.3/stable-determinant`; libraries: `mathlib:MulEquiv.prodUnits`.

**Sources.**

- `Kbook.2013`, Example III.1.1.3 (PDF p. 188; book p. 180): “If R is the product R′ × R′′ of two rings, then K1(R) = K1(R′) ⊕K1(R′′). Indeed, GL(R) is the product GL(R′) × GL(R′′), and the commutator subgroup decomposes accordingly.” — The product decomposition.
- `Kbook.2013`, Lemma III.1.4 (PDF p. 191; book p. 183): “If R is a commutative semilocal ring, then SK1(R) = 1 and K1(R) = R×.” — The semilocal route.

### A triangular matrix has the product of its diagonal units as determinant class

`U.6/triangular-determinant-class` · application

Let A be commutative and g ∈ GL_n(A) upper or lower triangular with diagonal d₁, …, d_n. Then the d_i are units, det g = d₁⋯d_n (Mathlib's Matrix.det_of_isUpperTriangular; Tau Ceti's Matrix.BlockTriangular.det_eq_prod_diag), and [g] = [d₁⋯d_n] in K₁(A), the class of a unit: its SK₁-component is trivial (U.3/K1-units-split).

**Hypotheses.**

- A commutative (for noncommutative A, U.2/block-triangular-class gives [g] = ∏[d_i] when the d_i are units).

**Proof.**

1. det g = ∏ d_i is a unit, so each d_i is a unit.
2. U.2/block-triangular-class: [g] = [d₁]⋯[d_n].
3. [d₁]⋯[d_n] = [diag(d₁, …, d_n)] = [d₁⋯d_n] because diag(1, …, d_i, …, d_i⁻¹, …) ∈ E_n(A) (U.2/K1-elementary-trivial); under det both sides map to ∏ d_i.

**Acceptance.**

- A = ℤ: (−1 5; 0 1) has class [−1] ≠ 0 and (−1 5; 0 −1) has trivial class.
- A = ℤ/6: (5 2; 0 5) has determinant 25 = 1, so its class is trivial.

**Depends on.** this roadmap: `U.2/block-triangular-class`, `U.2/K1-elementary-trivial`, `U.3/K1-units-split`, `U.3/stable-determinant`; libraries: `mathlib:Matrix.det_of_isUpperTriangular`, `tauceti:Matrix.BlockTriangular.det_eq_prod_diag`.

**Sources.**

- `Kbook.2013`, Proof of Lemma III.1.4 (PDF p. 192; book p. 184): “By Ex. I.1.11, the matrix diag(1, ..., 1, rn, r−1n) is in En(R). Multiplying D by this matrix yields a matrix in GLn−1(R)” — The reduction of a diagonal matrix to a single unit modulo E_n.
- `Kbook.2013`, Example III.1.1.1 (PDF p. 188; book p. 180): “It is traditional to write SK1(R) for the kernel of the induced surjection det: K1(R) →R×.” — The determinant class.

### diag(g, g⁻¹) is trivial after stabilisation, diag(g, 1) is not

`U.6/diagonal-inverse-pair-test` · application

For every ring A and g ∈ GL_n(A), diag(g, g⁻¹) ∈ E_{2n}(A) and its class in K₁(A) is trivial (U.1/whitehead-diagonal, U.2/K1-elementary-trivial), whereas diag(g, 1) has class [g]. For A = ℤ: [diag(−1, −1)] = 0 but [diag(−1, 1)] = [−1] ≠ 0; for a field F and a ∈ F^×, diag(a, a⁻¹) = the six-factor product of Tau Ceti's diag2nUnit_decompose.

**Hypotheses.**

- The stabilisation is essential for the statement to be about K₁; in GL_n itself diag(g, g⁻¹) needs rank 2n.

**Proof.**

1. U.1/whitehead-diagonal and U.2/K1-elementary-trivial give the first statement; U.2/K1-stabilisation-invariance the second.
2. For A = ℤ, det distinguishes the classes (U.6/K1-integers).
3. For n = 1 and commutative A, Tau Ceti's diag2nUnit_decompose writes diag(a, a⁻¹) as six transvections.

**Acceptance.**

- A = ℤ/4, g = 3: [diag(3, 3)] = 0 and [diag(3, 1)] = [3] ≠ 0 (det 3 ≠ 1).
- A = ℍ (quaternions), g = i: diag(i, −i) ∈ E₂(ℍ), consistent with K₁(ℍ) = ℝ_{>0} via the reduced norm.

**Depends on.** this roadmap: `U.1/whitehead-diagonal`, `U.2/K1-elementary-trivial`, `U.2/K1-stabilisation-invariance`, `U.6/K1-integers`; libraries: `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose`.

**Sources.**

- `Kbook.2013`, Example III.1.2.1 (PDF p. 188; book p. 180): “Moreover, if g ∈GLn(R) then we see by Ex. I.1.11 that E2n(R) contains the matrix” — diag(g, g⁻¹) ∈ E_{2n}(R).

### The valuation boundary of a uniformiser is 1

`U.6/uniformiser-boundary-one` · application

For a discrete valuation ring O with residue field k and any uniformiser π, the boundary of U.5/dvr-boundary, which equals S.3's localisation boundary (U.5/dvr-boundary-localisation-comparison), satisfies ∂(π) = [k] ↦ 1 ∈ ℤ ≅ K₀(k), and ∂(uπ) = 1 for every u ∈ O^×, so the value does not depend on the uniformiser. For O = ℤ_(p): ∂(p) = ∂(−p) = 1; for O = k[[t]]: ∂(t) = 1; for O = ℤ[i]_(1+i): ∂(1 + i) = 1 and ∂(2) = 2 (2 = −i(1 + i)²).

**Hypotheses.**

- O a discrete valuation ring; K₀(k) ≅ ℤ by dimension (Z.2/division-ring-k0).

**Proof.**

1. U.5/dvr-boundary-valuation: ∂ = v ∘ det, and v(π) = 1 (Mathlib's IsDiscreteValuationRing.addVal_uniformizer).
2. v(uπ) = v(π) since v(u) = 0 for units; the examples are valuations of the listed elements.

**Acceptance.**

- The normalisation matches K2SymbolsBrauer T.3/localization-boundary (∂[π] = [R/πR] = 1) and ArithmeticKTheory N.2 (divisor map).
- A sign-reversed convention would give ∂(π) = −1 and fails this test.

**Depends on.** this roadmap: `U.5/dvr-boundary-valuation`, `U.5/dvr-boundary`, `Z.2/division-ring-k0`, `U.5/dvr-boundary-localisation-comparison`; libraries: `mathlib:IsDiscreteValuationRing.addVal_uniformizer`.

**Sources.**

- `Kbook.2013`, Corollary III.3.1.1 (PDF p. 206; book p. 198): “If S consists of nonzerodivisors then there is a homomorphism K1(S−1R) ∂−→K0HS(R) sending each S-isomorphism α to [coker(α)], and sending s ∈S to [R/sR].” — ∂(π) = [O/πO] = [k].

## Mistakes found in the sources

Recorded under PROTOCOL.md section 18. Each was checked at its locator by its author and again by the coordinator; the nodes above use the corrected statements.

### KTheoryLowDegrees/E101 — error (affects a stated result)

- **Where:** `Kbook.2013`, Lemma II.2.1(2), PDF p. 76 (draft p. 68), author-hosted draft of 29 August 2013.
- **Printed:** (2) Suppose that R satisfies the IBP (e.g., R is commutative). Then K0(R) ≅ Z ⇐⇒ every finitely generated projective R-module is stably free.
- **Correction:** Then the map Z → K0(R) of (1) is an isomorphism if and only if every finitely generated projective R-module is stably free.
- **Reason:** With “≅” read as an abstract isomorphism the forward implication fails. R = M₂(F), F a field, has the IBP (Example I.1.1.1: a finite-dimensional algebra) and K₀(R) ≅ ℤ (Example II.2.1.2), but the simple module V of row vectors is not stably free: dim_F(V ⊕ R^m) = 2 + 4m is never 4n. The source’s own Example II.2.1.2 notes that the free modules generate a subgroup of index n. The argument that precedes the lemma (every class is [P] − [R^n]) proves the corrected statement.
- **Known:** new.

### KTheoryLowDegrees/E102 — misprint (affects the proof)

- **Where:** `Kbook.2013`, Exercise I.2.4(iii), PDF p. 23 (draft p. 15), author-hosted draft of 29 August 2013.
- **Printed:** If R is reduced, show that I1 + · · · + Ic = R and that for every i ≠ j Ii ∩ Ij = ∅. Conclude using the Chinese Remainder Theorem, which says that R ≅ ∏ Ri.
- **Correction:** If R is reduced, show that Ii + Ij = R for every i ≠ j and that I1 ∩ · · · ∩ Ic = 0; conclude by the Chinese Remainder Theorem that R ≅ ∏ R/Ii.
- **Reason:** An intersection of ideals contains 0 and is never empty. The Chinese Remainder Theorem needs pairwise comaximality and trivial intersection: V(Ii + Ij) = Vi ∩ Vj = ∅ gives Ii + Ij = R, and ∩ Ii is the nilradical, which is 0 for reduced R. The printed condition I1 + · · · + Ic = R is weaker than pairwise comaximality once c ≥ 3.
- **Known:** new.

### KTheoryLowDegrees/E103 — misprint (affects nothing)

- **Where:** `Kbook.2013`, II.2, “Rank and H0”, PDF p. 79 (draft p. 71), author-hosted draft of 29 August 2013.
- **Printed:** Since rank(P ⊕Q) = rank(P) + rank(Q) and rank(P ⊗Q) = rank(P) rank(Q) (by Ex. I.2.7, this is a semiring map.
- **Correction:** … and rank(P ⊗ Q) = rank(P) rank(Q) (by Ex. I.2.7), this is a semiring map.
- **Reason:** The parenthesis opened before “by Ex. I.2.7” is never closed; the mathematics is unaffected.
- **Known:** new.

### KTheoryLowDegrees/E104 — misprint (affects nothing)

- **Where:** `Kbook.2013`, III.1.3.3 (Whitehead's Lemma), PDF p. 190 (draft p. 182), author-hosted draft of 29 August 2013.
- **Printed:** Whitehead’s Lemma 1.3.5. E(R) is the commutator subgroup of GL(R).
- **Correction:** Whitehead's Lemma 1.3.3.
- **Reason:** The margin label of the statement is III.1.3.3; the number 1.3.5 is also printed for Example 1.3.5 on the next page (III.1.3.5), and no item 1.3.3 is printed otherwise, so Whitehead's Lemma carries a duplicated number.
- **Known:** new.

### KTheoryLowDegrees/E105 — misprint (affects nothing)

- **Where:** `Kbook.2013`, III.1.2.4 (Division rings 1.2.4), PDF p. 189 (draft p. 181), author-hosted draft of 29 August 2013.
- **Printed:** Dieudonn´e proved in 1943 that in fact GLn(D)/En(D) = D×/[D×, D×] for all n > 1 (except for n = 2 when D = F2). In particular, K1(D) = GLn(D)/En(D) for all n ≥3.
- **Correction:** GL_n(D)/E_n(D) ≅ D×/[D×, D×] for all n > 1, without exception; hence K₁(D) = GL_n(D)/E_n(D) for all n ≥ 2. The exception n = 2, D = 𝔽_2 concerns the different statement E_n(D) = [GL_n(D), GL_n(D)].
- **Reason:** Dieudonné's Théorème 1 (1943, n° 6) reads 'Le groupe quotient Mn(K)/Cn est isomorphe au groupe K*/C quel que soit n > 1', with no exception; the exception appears in his n° 5 for 'Cn est le groupe des commutateurs de Mn(K)'. For D = 𝔽_2 and n = 2 both sides of the printed isomorphism are trivial, since GL_2(𝔽_2) = SL_2(𝔽_2) = E_2(𝔽_2) (order 6, recomputed) and 𝔽_2^× = 1. The printed statement is true but its exception, and the bound n ≥ 3 in the consequence, are displaced.
- **Known:** new.

### KTheoryLowDegrees/E106 — misprint (affects nothing)

- **Where:** `Kbook.2013`, III.1.8 (Example 1.8, Whitehead group Wh1), PDF p. 196 (draft p. 188), author-hosted draft of 29 August 2013.
- **Printed:** If G is abelian, then Z[G] is a commutative ring and ±G is a subgroup of K1(Z[G]), so by 1.3.4 we have Wh1(G) = (Z[G]×/ ± G) ⊕SK1(Z[G]).
- **Correction:** … so by Example 1.1.1 we have Wh₁(G) = (ℤ[G]^×/±G) ⊕ SK₁(ℤ[G]).
- **Reason:** The cross-reference 1.3.4 (label III.1.3.4) is the commutator identity (1.3.4) in the proof of Whitehead's Lemma, which says nothing about units; the decomposition K₁(R) = R× ⊕ SK₁(R) for commutative R used here is Example 1.1.1.
- **Known:** new.

### KTheoryLowDegrees/E107 — misprint (affects nothing)

- **Where:** `Bass.1964`, § 4, Examples after the definition of stable range, p. 14 (numdam scan of Publ. Math. IHÉS 22).
- **Printed:** If A is a Dedeking ring n = 2 works.
- **Correction:** If A is a Dedekind ring n = 2 works.
- **Reason:** Spelling of 'Dedekind'; the claim itself is Theorem 11.1 for one-dimensional noetherian maximal spectra.
- **Known:** new.

### KTheoryLowDegrees/E108 — error (affects a stated result)

- **Where:** `Kbook.2013`, Theorem III.2.5 (Bass–Milnor–Serre), part (2), PDF p. 202 (book p. 194), author-hosted draft of 29 August 2013.
- **Printed:** (2) If F is “totally imaginary” (has no embedding into R), then SK1(R, I) ≅ Cn is a finite cyclic group whose order n divides the order w1 of the group of roots of unity in R. The exponent ordp n of p in the integer n is the minimum over all prime ideals p of R containing I of the integer inf{ordp w1, sup{0, [ordp(I)/ordp(p) − 1/(p−1)]}}.
- **Correction:** The minimum runs over the primes 𝔭 of R lying over p (BMS (3.3): j_p(q) = min_{𝔭|p}), not over the primes containing I; and case (2) needs R to be the full ring of integers O_F. For R = O_{F,S} with S ≠ ∅ (BMS: A is then not 'totally imaginary', as S_∞ contains a finite prime) SK₁(R, I) = 0 for every I, as in (1).
- **Reason:** F = ℚ(i), R = ℤ[i], I = 3R (3 is inert): the primes of R containing I are {(3)}, and ord_{(3)}(2) = 0, so the printed formula divides by zero, or read as +∞ gives ord₂ n = ord₂ w₁ = 2, SK₁(ℤ[i], 3ℤ[i]) ≅ ℤ/4. BMS (3.3) takes the prime (1 + i) over 2, where ord(I) = 0, so j₂ = [0/2 − 1]_{[0,2]} = 0 and r = 1: SK₁(ℤ[i], 3ℤ[i]) = 0. For R = ℤ[i][1/2] BMS Corollary 4.3(b) gives SK₁(R, I) = 0 while the printed (2) gives a nontrivial group for I = 9R.
- **Known:** new (ArithmeticKTheory/E1 records a different slip in the same theorem: the ideal I must be nonzero).

### KTheoryLowDegrees/E109 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Proof of Theorem V.6.9.1, PDF p. 422 (book p. 414).
- **Printed:** If a′i ∈R× is a lift of ai and s ∈R is a parameter then ∂: K1(F) →K0(k) sends s to [k] by III.1.1.
- **Correction:** … sends s to [k] by III.3.1.1 (Corollary 3.1.1), as cited a few lines earlier on the same page ('Since ∂(s′) = [R′/s′R′] = [k] by III.3.1.1').
- **Reason:** III.1.1 is the definition of K₁; the formula ∂(s) = [R/sR] is Corollary III.3.1.1.
- **Known:** new.

### KTheoryLowDegrees/E110 — misprint (affects nothing)

- **Where:** `BMS.1967`, Proof of Theorem 3.5, Case 1, p. 75 (PDF p. 18).
- **Printed:** Then (a, b) ∼q (a′, b′q) ∼q (a′, b₁q) ∼q (a₁, b₁q) ∼q (a₂, c^{p^n}q), and the proof is complete.
- **Correction:** The last pair is (a₁, c^{p^n}q), the form in the statement of Theorem 3.5 ('(a, b) ∼q (a₁, c^{p^n}q)'); a₂ is not defined.
- **Reason:** b₁ ≡ c^{p^n} mod a₁ gives (a₁, b₁q) ∼q (a₁, c^{p^n}q) by a first-type move with parameter in q; the first entry does not change.
- **Known:** new.

## Gaps

### Source for Theorem II.2.7(a): Morita functors preserve finitely generated projectives

The K-book takes its Structure Theorem for Morita equivalence from Bass, Algebraic K-theory, II.3 (not freely available and not read). Z.1/equivalence-preserves-finite-projective gives a categorical route with Mathlib ingredients: projective objects are preserved by equivalences, and finite generation is compactness of ⊤ in the subobject lattice, which an equivalence preserves through MonoOver.congr and Subobject.lowerEquivalence. This route is complete as written but has not been checked against any source. Next source action: read Bass II.3, or Lam, Lectures on Modules and Rings §18, or any public account of Morita theory stating that progenerators and finite generation are categorical.

Needed by: `Z.1/equivalence-preserves-finite-projective`, `Z.1/ring-k0-morita`, `Z.1/ring-k0-matrix`, `Z.2/matrix-division-ring-k0`.

### Topological inputs for SK₁ of the real circle ring

U.3/SK1-real-circle-nonzero follows K-book Example III.1.5.4: it needs Proposition III.1.5 (for a commutative Banach algebra R, E_n(R) is the path component of 1 in SL_n(R), using a continuous factorisation of matrices near 1 into n² + 5n − 6 elementary matrices and Ex. I.1.10), Example III.1.5.3 (SK₁(C(X, ℝ)) = [X, SO]) and the homotopy groups π₁(SO_2) ≅ ℤ, π₁(SO_n) ≅ ℤ/2 (n ≥ 3) with π₁(SO_2) → π₁(SO) onto. Mathlib and Tau Ceti have neither the Banach-algebra statement nor these fundamental groups. The algebraic route (Mennicke symbols, K-book Ex. III.1.10, where SK₁ ≅ ℤ/2 is stated) is an exercise without proof in the sources read. The statement SK₁ ≠ 1 is used only as a non-example (tests of U.3/special-K1, U.3/stable-determinant, U.3/stable-special-linear-group and U.1/elementary-subgroup).

Needed by: `U.3/SK1-real-circle-nonzero`.

### The tame formula, the degree-m Hilbert product formula and the power reciprocity law (BMS (A.16), (A.19)–(A.21))

U.4's arithmetic Mennicke argument (BMS Theorem 3.5) uses (A.16) (a, b / 𝔭)_m = (a/𝔭)_m^{ord_𝔭 b} for a a unit at 𝔭 ∤ m, the product formula ∏_𝔭 (a, b / 𝔭)_m = 1 (Artin–Tate XII Theorem 13) and its consequence (A.21) (b/a)_m = ∏_{𝔭∤a}(a, b / 𝔭)_m. ClassicalArithmeticCompletion CA.1 plans exactly these (CA.1/tame-hilbert-symbol-formula, CA.1/hilbert-product-formula-of-degree-n, CA.1/power-reciprocity-law), but those nodes cite K2SymbolsBrauer:T.7 for the norm-residue symbol, and T.7 lies downstream of U.4 (CA.1 ← T.7 ← T.3:localization-comparison ← T.2:graded-map ← K3BlochGroups:V.2 ← ArithmeticKTheory:N.5 ← U.4), so U.4 cannot import them without a stage cycle; Tau Ceti ClassFieldTheory lists 'explicit power-reciprocity laws beyond quadratic reciprocity' as outside its scope. BMS's orientation of the symbol is the transpose of CA.1's. Resolution proposed in restructure.

Needed by: `U.4/power-reduction-non-totally-imaginary`, `U.4/power-reduction-totally-imaginary`.

### Hilbert symbols on higher unit groups at primes above p (BMS (A.17)–(A.18))

The totally imaginary case of BMS Theorem 3.5 (Case 3, through Lemma 3.4(a)) needs (A.17): for k/ℚ_p finite containing μ_{p^n}, with e = ord_𝔭(p), (U_𝔭(h), U_𝔭 / 𝔭)_{p^n} = (U_𝔭(h+1), k^× / 𝔭)_{p^n} = μ_{p^{n−j}}, j = [h/e − 1/(p−1)]_{[0,n]}. BMS prove it (pp. 87–88) from Serre, Corps locaux, Ch. XIV Prop. 6 (p. 237) and Ch. XV Prop. 9 (p. 219), which are not freely available and were not read; no roadmap of the atlas plans the statement. Needed only for S = ∅ and F totally complex, where U.4 uses j = 0 (the pairing U_𝔭(h) × U_𝔭 → μ_{p^n} is onto).

Needed by: `U.4/power-reduction-totally-imaginary`.

### Milnor patching and the K₀ Mayer–Vietoris sequence (K-book I.2.7, II.2.9)

The degree-zero part of the relative sequence, K₁(A/I) → K₀(I) → K₀(A) → K₀(A/I) (K-book Ex. II.2.3(c), an exercise), follows from Milnor's Mayer–Vietoris theorem for the double-ring Milnor square; the K-book proves part (3) of Milnor patching and outlines the rest in Ex. I.2.8, and derives II.2.9 from it. No layer plans Milnor patching (KTheoryLowDegrees Z.1 does not list it; GrothendieckEulerForms is K₀ of categories). Proposed for Z.1 in restructure.

Needed by: `U.5/ideal-sequence-degree-zero`.

### Comparison of classical relative K₁ with π₁ of the homotopy fibre (K-book IV.1.11, Ex. IV.1.15)

The source gives only a hint ('Use Ex. III.2.7 to show that π₁K(R → R/I) is isomorphic to the group K₁(R, I)'). Completing the five-lemma argument needs π₂BGL⁺ = K₂ (K2SymbolsBrauer T.1:plus) and the classical relative K₂-sequence (K2SymbolsBrauer T.6), which the helper places downstream of U.6 because K2SymbolsBrauer:T.1/k2-definition cites GeneralAlgebraicKTheory:K.2, whose combined stage requires K.2:low-degree-comparisons ← U.6. GeneralAlgebraicKTheory's decomposition node K.5/relative-K-theory-and-excision-boundary asserts the identification with the same exercise as its only source. See restructure.

Needed by: `U.6/relative-K1-homotopy-comparison`.

## Requests

What this roadmap imports, by supplier.

### tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

For a finite Galois (here abelian) extension L/K of number fields and σ ∈ Gal(L/K), infinitely many primes of K unramified in L with Frobenius σ — BMS (A.6). Layer 10's text: 'Derive, rather than reprove, the density of split-completely primes, the non-Galois statement via a Galois closure, infinitude of every Frobenius class, and the rational arithmetic-progression case.'

Needed by: `U.4/idelic-density-theorem`, `U.4/primes-with-norm-not-one`.

### tauceti:TauCetiRoadmap/Chebotarev#layer-4-cyclotomic-galois-characters

For K(ζ_m)/K and 𝔭 ∤ m, the arithmetic Frobenius sends ζ_m to ζ_m^{N𝔭}. Layer 4's text: 'Prove that for 𝔭 ∤ m the arithmetic Frobenius sends ζ_m to ζ_m ^ 𝔑𝔭'.

Needed by: `U.4/primes-with-norm-not-one`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

The ray-class factorisation of the global Artin map for number fields, with its splitting law (the Artin symbol of an unramified prime 𝔭 ∤ 𝔪 is the image of the ray class of 𝔭) and surjectivity for admissible moduli — BMS (A.5) in ray-class form. Layer 12's text: 'The ray-class factorization of the global Artin map, rayClassArtinMap, takes the admissibility proof as an argument, and its splitting law and surjectivity are stated for admissible moduli.'

Needed by: `U.4/idelic-density-theorem`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

rayClassField 𝔪 and gal_rayClassField_equiv_rayClassGroup: the ray class field is abelian, unramified outside 𝔪, with Galois group the ray class group via the Artin map. Layer 13's text: 'define rayClassField 𝔪 as its class field' and 'The Galois/class-group isomorphisms (gal_rayClassField_equiv_rayClassGroup, …) are then the composite of galClassFieldEquiv, globalClassFieldGaloisEquiv and GlobalNumberFields.ker_rayClassQuotient'.

Needed by: `U.4/idelic-density-theorem`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

For a local field k (finite over ℚ_p, and the archimedean fields through the archimedean package of Layers 10–11) containing μ_m: the degree-m local Hilbert symbol localSymbol at the named pairing kummerCupPairing ζ, with bilinearity, the Steinberg relation (a, 1 − a) = 1, antisymmetry, nondegeneracy on k^×/k^{×m} × k^×/k^{×m} (from tateDualityPairing_perfect_mixed), and the fact that k^{×m} is an open subgroup of finite index in k^× — BMS (A.13)–(A.15). KTheoryLowDegrees U.4 uses BMS's orientation (a, b / k)_m = σ_b(a^{1/m})/a^{1/m}, σ_b the reciprocity image of b; the comparison with localSymbol's orientation is part of the need. Layer 5's text: 'Define kummerCupPairing ζ from a chosen primitive root, then define localSymbol as Kummer cup followed by the invariant. Prove bilinearity and the Steinberg relation' and 'Construct local Tate duality from the evaluation pairing'. The helper finds no stage cycle.

Needed by: `U.4/power-reduction-non-totally-imaginary`, `U.4/power-reduction-totally-imaginary`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles

The idèle norm on Mathlib's NumberField.IdeleClassGroup and the compactness of its norm-one subgroup IdeleClassGroup.normOne (the idèle group and idèle class group themselves are in Mathlib 082e2d3) — BMS (A.4) 'C⁰ is compact'. Layer 6's text: 'define the closed norm-one subgroup IdeleClassGroup.normOne. Prove its compactness'.

Needed by: `U.4/dirichlet-theorem-arithmetic-type`, `U.4/idelic-density-theorem`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary

Every open subgroup of IdeleClassGroup K contains RaySubgroup 𝔪 for some modulus 𝔪; rayClassQuotient : IdeleClassGroup K →* RayClassGroup 𝔪 is surjective with kernel RaySubgroup 𝔪; and the class of a prime idèle at 𝔭 ∤ 𝔪 maps to the ray class of 𝔭. Layer 7's text: 'Prove openness, antitonicity, and rayClassQuotient … with surjectivity and kernel RaySubgroup 𝔪 … Prove that every open subgroup of the idele class group contains a ray subgroup'.

Needed by: `U.4/idelic-density-theorem`, `U.4/dirichlet-theorem-arithmetic-type`.

### tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map

Layer 4’s “Define K₀(proj A) and G₀(mod A) through Layers 2--3. Prove Morita and algebra-equivalence invariance.” for a finite-dimensional algebra A over a field, stated on the existing carrier ExactK0 (finiteProjectiveModulesExactStructure A) (Tau Ceti’s CartanMap.lean), so that KTheoryLowDegrees Z.1 can prove that its general-ring Morita isomorphism RingK0.moritaEquiv (Z.1/ring-k0-morita), transported along RingK0.toExactK0 (Z.1/ring-k0-exact), restricts to layer 4’s isomorphism. RS-18 records layer 4 as the owner of the finite-dimensional Morita case and Z.1 as the owner of the general-ring degree-zero Morita specialisation; the comparison is the only interface between them.

Needed by: `Z.1/ring-k0-morita`.

## Structural proposals

### Z.1 owns ring-level scalar extension, complements and degree-zero Morita invariance

*ownership.* RS-18 (accepted) records “Explicit ring K0 scalar extension, complements/cofinality and general-ring degree-zero Morita specialization” with owner KTheoryLowDegrees:Z.1, formerly also GeneralAlgebraicKTheory:K.2:plus and K.7, and adds the links Z.1 → K.2:plus and Z.1 → K.7. This part plans them in Z.1 (Z.1/free-summand-data, Z.1/extend-scalars, Z.1/extend-scalars-finite-projective, Z.1/ring-k0-map, Z.1/equivalence-preserves-finite-projective, Z.1/ring-k0-morita, Z.1/ring-k0-matrix). K.2:plus (“scalar extension along every unital ring homomorphism preserves these objects”, “every finitely generated projective has a projective complement making it free”) and K.7 (Morita invariance of all K-groups) should import these nodes and not re-plan them. The atlas does not yet carry RS-18’s edge Z.1 → K.7, so the stage-cycle helper would allow Z.1 to cite K.7; Z.1 does not, following RS-18’s direction.

### Extension of scalars along noncommutative ring homomorphisms is planned in Z.1

*ownership.* Mathlib’s ModuleCat.extendScalars and extendRestrictScalarsAdj require commutative rings, and no roadmap in the atlas plans a noncommutative extension of scalars (the DGAInfinity layer 1 extension of scalars is for DG modules, and FoundationsAndLibraryIntegration LI.1 is commutative). Z.1 is the most foundational layer that needs it (for P ↦ S ⊗_R P on K₀; consumers ClassicalArithmeticCompletion CA.7 for orders ℤ[G] → 𝓞_K[G], GeneralAlgebraicKTheory K.2:plus, and the noncommutative local rings of Z.2), so Z.1/extend-scalars constructs it as the left adjoint of ModuleCat.restrictScalars with a comparison to Mathlib’s commutative functor. If a module-theory roadmap adopts the construction, the node moves there unchanged.

### Resolution of the companion packet’s references to KTheoryLowDegrees:Z.2

*interface.* KTheoryLowDegrees--Z.3 cites the stage KTheoryLowDegrees:Z.2 and requests “the existing finite-projective carrier with finite clopen rank fibres, their orthogonal-idempotent product decomposition, local freeness and the virtual ring homomorphism rank:K₀(R)→LocallyConstant(Spec R,ℤ), natural under scalar extension and normalized on every object class … For a Dedekind domain, provide the integer-valued specialization normalized by fraction-field dimension.” These resolve to: the carrier Z.1/ring-k0 (the same SplitK0 of finiteProjectiveModules, reducible, so the SplitK0 ring structure applies); clopen rank fibres and orthogonal idempotents Z.2/rank-fibre-decomposition (with clopen modules in Z.2/componentwise-free); local freeness Z.2/local-freeness; the rank Z.2/rank-hom, normalised by rank [P] = rankAtStalk P, with its naturality Z.2/rank-base-change; the “rank-one normalisation” of invertible modules is the API item RingK0.rank_of_invertible of Z.2/rank-hom; the integer specialisation normalised by fraction-field dimension is Z.2/rank-connected with Z.2/rank-domain. Names follow the companion’s namespace TauCeti.RingK0 and module TauCeti/Algebra/KTheory/RingK0/…

### The rank is a ring homomorphism only once Z.3 has the ring structure

*ownership.* The companion packet’s Z.3/augmentation calls the Z.2 rank a “virtual rank ring homomorphism”. The commutative ring structure on K₀ is constructed in Z.3 (Z.3/finite-projective-monoidal), downstream of Z.2, so Z.2 cannot state multiplicativity on K₀. Z.2 supplies the additive map (Z.2/rank-hom) and the object-level input rankAtStalk (P ⊗ Q) = rankAtStalk P · rankAtStalk Q (API item RingK0.rankAtStalk_tensor, Mathlib’s rankAtStalk_tensorProduct). Proposal: add to Z.3 a lemma “rank is a ring homomorphism” with prerequisites Z.3/finite-projective-monoidal, Z.2/rank-hom, TauCeti.SplitK0.ringHom_ext and Mathlib’s rankAtStalk_tensorProduct, and let Z.3/augmentation cite it.

### Finite-product formula and the finite-field case

*ownership.* The reviewed audit lists GeneralAlgebraicKTheory K.7 as duplicating the degree-zero product formula; RS-18 keeps “disconnected and finite-product comparison” in Z.2 and links Z.2 → K.7, so the degree-zero formula is planned here (Z.2/k0-pi) and K.7 compares its higher statement with it. The audit also lists KTheoryFiniteLocalFields L.1 (K₀(𝔽_q) = ℤ) as a duplicate: L.1 imports Z.2, and the finite-field case is Z.2/division-ring-k0; L.1 should cite it rather than restate it.

### E(A), elementary matrices over any ring and their commutator identities are U.1's; K2SymbolsBrauer T.1 should import them

*ownership.* The atlas edge U.1 → K2SymbolsBrauer:T.1:classical makes U.1 the supplier. The accepted packet K2SymbolsBrauer--T.1 re-plans part of U.1: T.1/stabilisation says 'Construct the stable elementary group as the colimit of the finite-rank elementary groups', T.1/elementary-matrices-satisfy says 'the noncommutative case is proved here', T.1/k2-is-centre uses 'the centre of E(R) is trivial' without a prerequisite, and T.1/k2-definition imports 'E(R) is the commutator subgroup of GL(R) and K_1(R) is the quotient' from GeneralAlgebraicKTheory:K.2. The owners are KTheoryLowDegrees:U.1/stable-elementary-subgroup, U.1/elementary-commutator-chain, U.1/elementary-commute, U.1/elementary-commutator-reverse, U.1/stable-elementary-centre, U.1/whitehead-lemma and U.2/K1; T.1's nodes should cite them. GL(A) here is a Mathlib DirectLimit, as T.1's St(A) is, so φ : St(A) → E(A) ≤ GL(A) is a DirectLimit.map.

### Left or right modules for K₁ classes of automorphisms

*convention.* U.2 defines the K₁ class of an automorphism for finitely generated projective RIGHT A-modules with matrices acting on column vectors, as the K-book (I.1: right modules, homomorphisms as matrices on column vectors) and Bass (§ 12: right modules) do; in Mathlib these are modules over Aᵐᵒᵖ, and End(Aⁿ_A) ≅ M_n(A) is multiplicative (U.2/right-module-matrix-equiv). Tau Ceti's finiteProjectiveModules and the Z.1 part of this packet use left modules (Z.1/idempotent-module uses row vectors). For commutative rings the two agree and the class of v ↦ gv is [g]. For non-commutative A a left A-module is a right Aᵐᵒᵖ-module and its classes lie in K₁(Aᵐᵒᵖ); using LinearMap.toMatrixRight' (row vectors) instead would give the class of the transposed matrix, which differs on SK₁ (transposition inverts Mennicke symbols). The packet summary states this convention.

### Break the stage cycle that blocks the power reciprocity law for U.4

*rescope.* CA.1's nodes tame-hilbert-symbol-formula, hilbert-product-formula-of-degree-n and power-reciprocity-law cite K2SymbolsBrauer:T.7 only for the local norm-residue symbol; T.7 is downstream of KTheoryLowDegrees U.4 (via ArithmeticKTheory N.5 and K3BlochGroups V.2), so U.4 cannot import CA.1.

### ClassFieldTheory, Part II: explicit local symbols at p

*rescope.* BMS (A.17)–(A.18), the values of the degree-p^n Hilbert symbol on higher unit groups of a p-adic field, have no owner; Tau Ceti's ClassFieldTheory excludes explicit reciprocity laws beyond quadratic reciprocity.

### Classical K₂ should not depend on the late K.2 layer

*rescope.* K2SymbolsBrauer:T.1/k2-definition lists GeneralAlgebraicKTheory:K.2 (the combined stage, which requires K.2:low-degree-comparisons ← KTheoryLowDegrees U.6) as a prerequisite, so all of T.1:classical, T.1:plus and T.6 are downstream of U.5 and U.6. This blocks U.5 from naming the K₂ boundary K₂(A/I) → K₁(A, I) and U.6 from completing the homotopy comparison of relative K₁.

### Ownership of the relative-K₁ comparison with the homotopy fibre

*rescope.* RS-18 gives U.5 the comparison of K₁(A, I) with K.5's homotopy-fibre relative K₁, and K.5 the generic fibre (owner 35). The comparison needs π₁BGL(A)⁺ = K₁(A), which is U.6's, and π₂ = K₂; U.5 is upstream of U.6, so the comparison cannot be a U.5 node.

### Presentation of the S-integers as a localisation belongs upstream of U.4

*rescope.* U.4/s-integers-ring-of-fractions (BMS: A′ = A[a⁻¹]) restates the finite-S case of ArithmeticKTheory N.1/S-integers-as-a-localisation and N.1/S-integers-localisation-of-torsion-class-group, which U.4 cannot cite (N.1 is downstream of U.4).

### Milnor patching for Z.1

*rescope.* Milnor patching (K-book I.2.6–2.7) and the Mayer–Vietoris sequence II.2.9 are unplanned; U.5/ideal-sequence-degree-zero needs them.

## Dependencies between the layers

Within the roadmap, the nodes of each layer use the nodes of these other layers; the graph is acyclic.

- **Z.2** uses Z.1.
- **U.2** uses Z.1, U.1.
- **U.3** uses U.1, U.2.
- **U.4** uses U.1, U.3.
- **U.5** uses Z.1, Z.2, U.1, U.2, U.3.
- **U.6** uses Z.2, U.1, U.2, U.3, U.4, U.5.

The atlas requirements of each layer:

- **Z.1** requires `UPSTREAM:ProjectiveModules-and-ExactK0`.
- **Z.2** requires `KTheoryLowDegrees:Z.1`.
- **U.1** requires `UPSTREAM:Mathlib-matrices-and-linear-algebra`.
- **U.2** requires `KTheoryLowDegrees:U.1`.
- **U.3** requires `KTheoryLowDegrees:U.2`.
- **U.4** requires `KTheoryLowDegrees:U.3`.
- **U.5** requires `KTheoryLowDegrees:U.4`.
- **U.6** requires `GeneralAlgebraicKTheory:K.2:plus`, `KTheoryLowDegrees:U.5`.

## What this blueprint does not claim

- **Missing proofs.** The proofs no obtainable source contains are not supplied; each is a gap with the nodes that need it.
  - A source proof that Morita functors preserve finitely generated projectives. The K-book cites Bass for it, and the categorical proof written here is unchecked against a source.
  - The topology behind SK₁ ≠ 1 for the real circle ring.
  - The class-field-theory inputs of BMS Theorem 3.5: the tame formula, the Hilbert product formula, the power reciprocity law and the local symbols on higher unit groups.
  - Milnor patching.
  - The five-lemma comparison of relative K₁ with the homotopy fibre.
- **SK₁ of general Dedekind domains.** SK₁ = 0 is asserted only for O_{F,S}, with F a number field and S finite. It is not asserted for an arbitrary Dedekind domain.
- **Congruence subgroups.** The congruence subgroup theorem of BMS, their Theorem 4.1(c) computing C_𝔮 ≅ μ_r, is not planned, because SK₁ = 0 does not need it.
- **Formalisation.** Nothing here is formalised. The suggested Lean file names the objects and states what the pinned libraries can express; the rest is recorded there as comments.
