# The Grothendieck simultaneous resolution, the Steinberg variety and characteristic cycles

This roadmap develops the geometry behind normal local models and their characteristic cycles. Starting with a split connected reductive group and its flag scheme, it constructs Grothendieck’s simultaneous resolution, the double incidence scheme and its Weyl-labelled components. It proves the component normality theorem, then identifies nilpotent incidence with conormal geometry. Algebraic differential operators and localisation connect highest-weight modules to positive cycles. The final targets are the zero-operator tangent estimate and the completed Kazhdan–Lusztig cycle identity used in trianguline local models.

## Conventions

Fix a split connected reductive group G over k, a Borel B, a maximal torus T⊂B, and U=radᵤ(B). Positive roots are those of u. Put F=G/B, N=dim U, r=dim T, D=dim G=r+2N. The initial geometry assumes char(k)=0 or p>h, where h is the largest Coxeter number of a simple factor, and h=0 for a torus. This is the paper’s explicit bound, stronger than the usual meaning of good characteristic. Layers S–E use characteristic zero. The two Cartan coordinates obey κ₂,w=w⁻¹κ₁,w. The signed cotangent embedding sends ψ to (−ψ,ψ). The half-sum ρ is a weight-space functional and is not assumed an integral character of G. Highest weights are ww₀·0=−wρ−ρ. The central reduction is strict at the trivial infinitesimal character χ₀; ordinary D_F corresponds to BB’s twisting parameter ρ. Cycles have integral coefficients and generic-length multiplicities; no rational equivalence or reduction of a scheme zero fibre is implicit.

## Boundaries and inputs

ReductiveGroups supplies group and root data, LieHighestWeight supplies enveloping, Verma/simple and central-character theory, and current AlgebraicVectorBundles supplies sheaf duals and geometric total spaces. General local algebra and completion criteria come from DeformationAndDerivedPatchingAlgebra. Elementary category O and KL multiplicities have the separate supplier described below. The present roadmap owns the resolution geometry, D-module and localisation bridge, cycle bases and formal geometric identities. It does not construct trianguline varieties, Galois representations, analytic category O, the KL polynomial theory itself, or a general Springer representation. A conormal-intersection conjecture and historical comments on nilpotent component normality and reducible simple cycles are recorded only as landscape.

The independent review accepts this complete target-level planning pass: all 14 layers are planned, and none is closed. The 11 input gaps below remain prerequisites for closure; in particular, the raw Steinberg fibre-product comparison is conditional on reducedness. The [review report](../reviews/REV-DESIGN-SpringerResolutionAndCharacteristicCycles.md) records the supplier boundaries and source corrections.

The companion suggested Lean file is not this roadmap and is not exhaustive. This document is definitive. Its statements suggest names and mathematical signatures so contributors and reviewers can converge; targets whose carriers are absent at the pins remain mathematical prose. No implementation is asserted.

The construction order is F→G→I→C→N→S→Y→D→H→L→K. Differential operators and filtered PBW can start independently of the incidence branch, but characteristic cycles import the top-cycle construction from Y. P supplies parabolic invariance. The Cartan/tangent branch T uses N independently of KL, and E combines T and K. Elementary category O precedes L, whereas the supplier’s KL theorem follows L.

## Sources

- **BHS19**: Christophe Breuil, Eugen Hellmann and Benjamin Schraen, [A local model for the trianguline variety and applications](https://numdam.org/item/10.1007/s10240-019-00111-y.pdf), Publications Mathématiques de l’IHÉS 130 (2019), 299–412; published version. Read §2.1–2.5, printed pp. 309–328, including proofs; PDF page = printed page − 298.
- **BR12**: Roman Bezrukavnikov and Simon Riche, [Affine braid group actions on derived categories of Springer resolutions](https://www.numdam.org/item/10.24033/asens.2173.pdf), Annales scientifiques de l’École normale supérieure 45 (2012), 535–599. Read §1.1, pp. 538–539, hypotheses and coadjoint conventions, §2.2, Theorem 2.2.1 and Remark 2.2.2, pp. 557–558, §2.10–2.11, pp. 570–572, proof structure and base-change remark, §2.14, pp. 574–575, Proposition 2.14.2 and conventions.
- **M23**: Mircea Mustață, [D-modules and singularities](https://websites.umich.edu/~mmustata/DmodulesNotes.pdf), Author lecture notes, Math 732, Winter 2023; downloaded 18 October 2026. Read §§2.1–2.4, pp. 1–8, §3.1, p. 9; §3.4, pp. 13–17, §6.1, pp. 43–47; §6.2, pp. 47–51, equivalence and local proof, §6.3, pp. 51–52; §6.4, pp. 53–56, §6.8, pp. 72–77, intermediate extension and simple-module classification, §7.4.3, pp. 93–94, regularity definitions and preservation statement, §5.1, pp. 35–36, filtered Ext and biduality statements read; remaining homological package is a gap, §6.4, pp. 53–56, holonomicity, finite length and cycle arguments, §6.5–6.6, pp. 62–63, normalized duality and stated proper duality theorem.
- **BB81**: Alexandre Beilinson and Joseph Bernstein, [Localisation de g-modules](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/BernBeil_Localization_of_g-modules.pdf), C. R. Acad. Sci. Paris 292 (1981), 15–18; author-hosted scan contains pp. 15–17. Read §1, p. 15, D-affinity and equivalence, §2, pp. 16–17, main theorem and proof, §3, p. 17, compatible algebraic subgroup actions; p. 18 not in the scan.
- **G98**: Victor Ginzburg, with Vladimir Baranovsky and Sam Evens, [Lectures on D-modules](https://math.berkeley.edu/~nadler/ginzburg.dmodules.pdf), Author lecture notes, Winter 1998. Read §1.1, pp. 4–6, good filtrations and characteristic varieties, §2.1, pp. 23–24, coordinate differential operators, §4.1, pp. 60–61, holonomicity and conormal support.

## Existing library boundary

- **mathlib:AlgebraicGeometry.Scheme** (Mathlib/AlgebraicGeometry/Scheme.lean): Native locally affine locally ringed spaces; retain Scheme and its actual stalks.
- **mathlib:CategoryTheory.Limits.pullback** (Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean): The categorical pullback as the limit of a cospan; Scheme has pullbacks in Mathlib/AlgebraicGeometry/Pullbacks.lean, lines 481–485.
- **mathlib:AlgebraicGeometry.AlgebraicCycle** (Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean): Locally finitely supported coefficient functions on scheme points, using generic points to encode irreducible closed subsets. This is not a Chow group.
- **mathlib:Module.length** (Mathlib/RingTheory/Length.lean): Module length with values in extended natural numbers; prove finiteness before converting a coefficient to an integer.
- **mathlib:Module.length_eq_add_of_exact** (Mathlib/RingTheory/Length.lean): Length additivity for an injective map f, a surjective map g and Function.Exact f g; no finite-length assumption is needed for the extended-natural equality.
- **mathlib:AdicCompletion** (Mathlib/RingTheory/AdicCompletion/Basic.lean): The compatible system of quotients M/IⁿM, with its native of and evaluation maps.
- **mathlib:LinearMap.ker** (Mathlib/Algebra/Module/Submodule/Ker.lean): Kernel submodule of a semilinear map; fixed subspaces here use ker(w−id), not a new linear-algebra carrier.
- **mathlib:Module.finrank** (Mathlib/LinearAlgebra/Dimension/Finrank.lean): Natural-valued rank, equal to dimension for finite-dimensional vector spaces. Finite-dimensionality must be explicit.
- **mathlib:Finsupp** (Mathlib/Data/Finsupp/Defs.lean): Finitely supported functions; for a finite component set, integer coefficients give the free abelian cycle group.
- **mathlib:DerivedCategory** (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean): The native derived category of an abelian category under HasDerivedCategory; this does not supply D-module transfer or duality.
- **mathlib:SheafOfModules** (Mathlib/Algebra/Category/ModuleCat/Sheaf.lean): Sheaves of modules over a sheaf of rings, with the underlying presheaf and sheaf condition.
- **mathlib:SymmetricAlgebra** (Mathlib/LinearAlgebra/SymmetricAlgebra/Basic.lean): Symmetric algebra as the commutative quotient of the tensor algebra; sheaf versions and geometric total spaces belong to AlgebraicVectorBundles.
- **tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf** (TauCeti/AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean): Full subcategory of finitely presented sheaves of modules on a Scheme; on locally noetherian schemes this supplies the coherent O-module carrier.
- **mathlib:Finsupp.linearCombination** (Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean): The native linear map sending a finitely supported coefficient family to its finite linear combination. The suggested file specializes this to integer component cycles; its single-generator formula preserves integer multiplicity.

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Current upstream was also checked at the commits in the handoff. In particular totalSpace(E)=Spec Sym(E∨) is imported from AlgebraicVectorBundles L2B, not reconstructed from the older atlas snapshot.

## Layer F: Flag schemes and relative position

Construct the flag scheme F=G/B and diagonal orbits U_w in F×F; prove smooth projectivity, orbit dimensions and Bruhat closures. Establish the constant-rank intersection theorem for subbundles over a reduced finite-type base.

### flag-scheme: The flag scheme

**Target.** Let F be the scheme representing the fppf quotient G/B. The quotient map G→F is a right B-torsor, and its functor of points is the sheafification of S↦G(S)/B(S), rather than the naive quotient on every S. Fix the base flag eB and the left G-action.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, mathlib:AlgebraicGeometry.Scheme, SchemeAndStackFoundations:SF.0.

**Uses.** G, I and S: Base of the associated bundles and both flag coordinates of the incidence schemes.

**Construction or proof.**

1. Use the representable parabolic quotient supplied by ReductiveGroups; identify its universal B-torsor and descend the left action.
2. Keep the fppf sheaf quotient in the universal property: points over a test scheme need only lift to G locally.

**API.**

- **Flag.quotient** (constructor): G→F is the universal B-invariant morphism to an fppf sheaf.
- **Flag.torsor** (structure): G×B→G×_F G, (g,b)↦(g,gb), is an isomorphism.
- **Flag.action** (functoriality): Left multiplication descends and commutes with extension of the ground field.
- **Flag.points** (characterisation): An S-point is a B-reduction of the trivial G-torsor; it is locally represented by gB.

**Checks and worked examples.**

- **Flag.torus**: For G=T and B=T, F=Spec k.
- **Flag.sl2**: For SL₂ with upper triangular B, F≅P¹ and eB corresponds to the line ke₁.
- **Flag.gl3**: For GL₃, points are a line inside a plane in k³; choosing only a line loses one flag parameter.

**Source.** BHS19, §2.1, p. 309: The geometric constructions use the flag quotient, its base point and its G-action.

### flag-geometry: Smooth projectivity of the flag variety

**Target.** F is smooth, projective and geometrically integral over k, of dimension N=dim U; D=dim G=r+2N and dim B=r+N, where r=dim T. These dimension equalities persist after extension of k.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:F/flag-scheme, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, SchemeAndStackFoundations:SF.0.

**Construction or proof.**

1. Use the big Bruhat cell, a product of the negative root subgroups, to obtain a smooth dense affine N-space; translate it to cover F.
2. The parabolic quotient is proper and admits a projective embedding using a regular dominant character that belongs to X*(T); do not assume ρ itself is an integral character.
3. The dense cell over an algebraic closure proves geometric integrality; the root decomposition gives the dimensions.

**Check.** For SL₂, F=P¹ has dimension 1, B has dimension 2 and G has dimension 3; for a torus F is a point and D=r.

**Source.** BHS19, §2.1, pp. 309–310: The flag base is smooth projective and the associated bundle has the expected dimension.

**Required input still to establish.** AG-geometry (exact boundaries below).

### relative-position: Relative position orbits

**Target.** For w∈W=N_G(T)/T, choose a representative ŵ and let U_w⊂F×F be the diagonal G-orbit of (eB,ŵB), with its locally closed reduced orbit scheme. Define Ū_w as its reduced closed closure. These constructions are independent of ŵ.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:F/flag-scheme, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, SchemeAndStackFoundations:SF.0.

**Uses.** I, N, S, K and T: Stratification, conormals, simple-cycle support and the tangent contribution from Ū_w.

**Construction or proof.**

1. Identify the orbit with G/(B∩ŵBŵ⁻¹) and descend its orbit map.
2. Take the reduced closure in F×F and use the Bruhat decomposition to identify its support.

**API.**

- **RelativePosition.mem** (characterisation): (g₁B,g₂B) lies in U_w iff g₁⁻¹g₂∈BŵB, after a field extension splitting the points.
- **RelativePosition.liftIndependent** (compatibility): Replacing ŵ by tŵ or ŵt, t∈T, gives the same orbit scheme.
- **RelativePosition.diagonalAction** (functoriality): The diagonal G-action preserves U_w and Ū_w.
- **RelativePosition.closure** (projection): U_w→Ū_w→F×F are respectively open and closed immersions.

**Checks and worked examples.**

- **RelativePosition.identity**: U_e is the diagonal F⊂F×F.
- **RelativePosition.sl2**: For SL₂, U_s consists of pairs of distinct lines, and Ū_s=P¹×P¹.
- **RelativePosition.torus**: For a torus W={e}, the sole orbit and its closure are Spec k.

**Source.** BHS19, §2.1, p. 309; Lemma 2.2.4, pp. 312–313: Diagonal relative-position strata and their closures control all incidence supports.

### orbit-geometry: Dimensions and closures of the Bruhat orbits

**Target.** The U_w are smooth geometrically integral, dim U_w=N+ℓ(w), and F×F is their disjoint stratification. The support of Ū_w is the union of U_v for v≤w in Bruhat order. In particular Ū_w is geometrically integral and U_w is its dense smooth open stratum.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:F/relative-position, SpringerResolutionAndCharacteristicCycles:F/flag-geometry, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.

**Construction or proof.**

1. The stabilizer has Lie algebra t⊕(u∩Ad(ŵ)u) of dimension r+N−ℓ(w); its root-subgroup description gives smoothness.
2. Pull back along G→F in the first coordinate; the second coordinate becomes the usual Bruhat stratification of F.
3. Use the supplied Schubert closure order, then descend the statements through the torsor.

**Check.** For SL₂, U_e is the one-dimensional diagonal and U_s the two-dimensional distinct-pair open; only the latter closure is all P¹×P¹.

**Source.** BHS19, §2.1, p. 309; Proposition 2.2.1, pp. 311–312: The dimensions and closure order used in the bundle and boundary calculations.

**Required input still to establish.** Lie-invariants (exact boundaries below).

### constant-rank-intersection: Intersection of subvector bundles

**Target.** Let Y be reduced and locally of finite type over a field, E a finite-rank vector bundle, and E₁,E₂ subvector bundles (locally direct summands). If dim(E₁,y∩E₂,y)=a for every closed y∈Y, their scheme theoretic intersection in E is a vector subbundle of rank a, with fibre the intersection of the two fibres. No assertion is made over a nonreduced base.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SchemeAndStackFoundations:SF.0, mathlib:LinearMap.ker.

**Construction or proof.**

1. Locally identify the intersection with ker(E₁⊕E₂→E), (x,y)↦x−y.
2. Constant fibre ranks at closed points give constant ranks everywhere because finite-type schemes over a field are Jacobson. Minors that vanish at every closed point vanish on the reduced base.
3. On the open where a maximal nonzero minor is invertible, row and column operations split the map into an identity block and zero block; the kernel is locally free and a direct summand.

**Check.** Over k[ε]/ε², the summands spanned by (1,0) and (1,ε) in the free rank-two module have one-dimensional intersection on the closed fibre, but their actual intersection is (ε)(1,0), not a rank-one direct summand. The reduced-base hypothesis must reject this case.

**Source.** BHS19, Lemma 2.2.2, p. 312: Reducedness and constant closed-fibre rank make the intersection a geometric vector bundle.

**Required input still to establish.** VB-upstream, AG-geometry (exact boundaries below).

## Layer G: The Grothendieck simultaneous resolution

Construct g̃=G×ᴮb and its incidence embedding in F×g, its regular and regular semisimple loci and q:g̃→g. Prove smoothness, proper surjectivity, quasi-finiteness over gʳᵉᵍ and finite étaleness of degree |W| over gʳˢ.

### simultaneous-resolution: The Grothendieck simultaneous resolution

**Target.** Define g̃=G×ᴮb using (g,x)∼(gb,Ad(b⁻¹)x). Identify it with the closed incidence scheme {(gB,ψ)∈F×g:Ad(g⁻¹)ψ∈b}. The bundle projection is p:g̃→F, and q:g̃→g sends (gB,ψ) to ψ.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:F/flag-scheme, tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation, SpringerResolutionAndCharacteristicCycles:F/constant-rank-intersection, mathlib:CategoryTheory.Limits.pullback.

**Uses.** I and C: Two copies define X, and integral versions define the CM spreading model.

**Construction or proof.**

1. Descend the B-representation b along G→F using the existing vector-bundle theory.
2. The inclusion b→g descends to a subbundle of F×g, and (g,x)↦(gB,Ad(g)x) gives the incidence comparison.
3. Define q by the ambient projection and prove the formula independently of the torsor representative.

**API.**

- **GrothendieckResolution.incidenceIso** (equivalence): G×ᴮb≅g̃ as vector bundles over F.
- **GrothendieckResolution.mem** (characterisation): An S-point is a flag with a Lie-algebra section lying in its Borel subalgebra, interpreted by torsor descent.
- **GrothendieckResolution.q** (projection): q([g,x])=Ad(g)x; p([g,x])=gB.
- **GrothendieckResolution.fibre** (compatibility): The fibre of p at gB is Ad(g)b, a vector space of dimension dim B.
- **GrothendieckResolution.baseChange** (functoriality): The incidence and associated-bundle presentations commute with every field extension.

**Checks and worked examples.**

- **GrothendieckResolution.torus**: For a torus F is a point, g̃=t and q=id.
- **GrothendieckResolution.gl2**: For GL₂, an incidence point is a line L⊂k² and a matrix preserving L; p has rank 3.
- **GrothendieckResolution.zero**: q⁻¹(0)=F scheme theoretically, whereas g̃ itself has dimension D.

**Source.** BHS19, §2.1, formulas (2.1)–(2.2), p. 310: The associated bundle and its closed incidence presentation define the simultaneous resolution.

**Required input still to establish.** VB-upstream (exact boundaries below).

### regular-loci: Regular and regular semisimple loci

**Target.** Use the reductive Lie-algebra Jordan decomposition. An element ψ is regular when its algebraic centralizer has dimension r. It is regular semisimple when it is both regular and semisimple. Write gʳᵉᵍ and gʳˢ for these open subschemes, and g̃ʳᵉᵍ,q⁻¹(gʳˢ) for their scheme inverse images. Set tʳᵉᵍ=t∩gʳˢ.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, SpringerResolutionAndCharacteristicCycles:G/simultaneous-resolution.

**Uses.** G and N: The degree computation, birational isomorphism locus and codimension-one regularity argument.

**Construction or proof.**

1. Express regularity by the minimal centralizer dimension and construct the corresponding open locus.
2. Identify the semisimple regular locus by conjugating t minus the root hyperplanes; the Jordan-theory input and its characteristic bound are explicit.

**API.**

- **RegularLie.mem** (characterisation): ψ∈gʳᵉᵍ iff dim Z_G(ψ)=r.
- **RegularLie.torus** (characterisation): z∈tʳᵉᵍ iff α(z)≠0 for every root α.
- **RegularLie.semisimpleInclusion** (relation): gʳˢ is an open subscheme of gʳᵉᵍ, not generally equal to it.
- **RegularLie.baseChange** (functoriality): Membership is geometric and the open loci commute with field extension.

**Checks and worked examples.**

- **RegularLie.torusAll**: For a torus every Lie-algebra element is regular semisimple.
- **RegularLie.sl2Nilpotent**: For SL₂ in characteristic different from 2, the nonzero nilpotent matrix E₁₂ is regular and is not semisimple.
- **RegularLie.sl2Zero**: For SL₂, zero is not regular, whereas diag(a,−a) is regular semisimple when a≠0.

**Source.** BHS19, §2.1, p. 310: Regularity is the minimal centralizer dimension, with separate regular semisimple and toral loci.

**Required input still to establish.** Lie-invariants (exact boundaries below).

### resolution-properties: Properness and the regular covering

**Target.** The scheme g̃ is smooth and geometrically integral of dimension D. The map q is proper and surjective; q⁻¹(gʳᵉᵍ)→gʳᵉᵍ is quasi-finite (hence finite), and q⁻¹(gʳˢ)→gʳˢ is finite étale of constant degree |W|.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:G/simultaneous-resolution, SpringerResolutionAndCharacteristicCycles:F/flag-geometry, SpringerResolutionAndCharacteristicCycles:G/regular-loci, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, SchemeAndStackFoundations:SF.0.

**Construction or proof.**

1. Smoothness and dimension follow from the bundle of rank dim B over F. Closed incidence in F×g gives properness.
2. Every geometric Lie-algebra element is contained in a Borel subalgebra; this proves surjectivity.
3. The regular-element Borel-finiteness theorem gives quasi-finiteness. Over a regular semisimple element the Borels containing its centralizer torus form the W-torsor; root-coordinate differentials prove étaleness. The Lie-theoretic proof boundary is recorded.

**Check.** For SL₂, the regular semisimple fibre has two flags, while a regular nonzero nilpotent has one geometric flag. The latter statement is not a claim of étaleness there; q is ramified and is not birational.

**Source.** BHS19, Proposition 2.1.1, pp. 310–311: The simultaneous resolution is finite over regular elements and a W-cover over regular semisimple elements.

**Required input still to establish.** Lie-invariants, AG-geometry (exact boundaries below).

## Layer I: Incidence components and birational projections

Construct X=g̃×_g g̃, the two projections pr_i, π to F×F, the Cartan maps κ_i and the strata V_w. Define reduced closures X_w, prove the stratum vector-bundle rank, Bruhat support, lci and reducedness of X, and the proper birational projection theorem with isomorphisms above g̃ʳᵉᵍ.

### incidence-scheme: The double incidence scheme

**Target.** Define X=g̃×_g g̃ using q on each side, with pr₁,pr₂:X→g̃ and π=(p∘pr₁,p∘pr₂):X→F×F. Its closed incidence presentation is triples (F₁,F₂,ψ) with ψ in both Borel Lie subalgebras. The common operator map is q∘pr₁=q∘pr₂.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:G/simultaneous-resolution, mathlib:CategoryTheory.Limits.pullback, SchemeAndStackFoundations:SF.0.

**Uses.** I–E: Ambient scheme for components, Cartan maps, zero fibres and completion.

**Construction or proof.**

1. Use the native Scheme pullback and its universal property, with both arrows equal to q.
2. Compare its functor of points with simultaneous membership in the two descended subbundles. Define π from the two flag projections.

**API.**

- **DoubleIncidence.lift** (universal-property): Two maps to g̃ with equal composite to g lift uniquely to X.
- **DoubleIncidence.projections** (projection): pr_i records the i-th flag together with the common ψ; π records both flags.
- **DoubleIncidence.swap** (equivalence): Swapping the two copies of g̃ is an involution and exchanges pr₁ and pr₂.
- **DoubleIncidence.closed** (compatibility): The categorical pullback agrees with the two incidence conditions in F×F×g.

**Checks and worked examples.**

- **DoubleIncidence.torus**: For a torus X=t, not t×t.
- **DoubleIncidence.zero**: The fibre at ψ=0 is F×F, not the diagonal.
- **DoubleIncidence.gl2Opposite**: For GL₂ and distinct coordinate lines, the operator fibre consists of diagonal matrices and has dimension 2.

**Source.** BHS19, §2.2, formulas (2.3)–(2.4), p. 311: The fibre product retains a common Lie-algebra element and two flags.

### cartan-maps: The two Cartan projections

**Target.** The B-equivariant quotient b→b/u≅t, where B acts trivially on the target, defines κ:g̃→t. Put κ_i=κ∘pr_i. On a represented triple, κ_i is the image of Ad(g_i⁻¹)ψ in b/u, using the fixed B⊃T identification. Keep κ_i distinct from pr_i.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/incidence-scheme, tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.

**Uses.** C, N, S, T and E: Flatness, the graph relation, nilpotent zero fibres and component labels.

**Construction or proof.**

1. Descend the quotient map b→t along the B-torsor.
2. Compose with pr_i, check the displayed formula after an fppf trivialisation, and descend equality of maps.

**API.**

- **CartanProjection.formula** (characterisation): κ_i(g₁B,g₂B,ψ)=Ad(g_i⁻¹)ψ mod u.
- **CartanProjection.representativeIndependent** (compatibility): Changing either Borel representative does not change the corresponding toral class.
- **CartanProjection.linear** (structure): κ_i is linear in ψ and satisfies κ_i(aψ)=aκ_i(ψ).
- **CartanProjection.swap** (functoriality): The swap involution exchanges κ₁ and κ₂.

**Checks and worked examples.**

- **CartanProjection.torus**: For a torus κ₁=κ₂=id_t.
- **CartanProjection.gl2Swap**: For GL₂, flags ke₁,ke₂ and ψ=diag(a,b) give κ₁=(a,b), κ₂=(b,a).
- **CartanProjection.nilpotent**: For coincident standard flags and ψ∈u, both Cartan coordinates are zero.

**Source.** BHS19, §2.2, formula (2.5), p. 311: The two Cartan coordinates record the toral parts relative to the two flags.

### incidence-strata: Incidence strata

**Target.** Define V_w=X×_(F×F)U_w, with its scheme inverse-image structure. It is locally closed in X, and π_w:V_w→U_w is the restricted flag projection. Do not substitute the zero-Cartan stratum V′_w.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/incidence-scheme, SpringerResolutionAndCharacteristicCycles:F/relative-position, mathlib:CategoryTheory.Limits.pullback.

**Uses.** I, N and T: Dense component charts, boundary strata and tangent kernels.

**Construction or proof.**

1. Base change the locally closed immersion U_w→F×F along π.
2. Transport the incidence conditions to the stabilizer model over the orbit.

**API.**

- **IncidenceStratum.mem** (characterisation): A triple belongs to V_w iff its two flags have relative position w.
- **IncidenceStratum.fibre** (compatibility): Over (gB,gŵB), the operator fibre is Ad(g)(b∩Ad(ŵ)b).
- **IncidenceStratum.stratification** (structure): The V_w give a disjoint finite stratification of X.
- **IncidenceStratum.scaling** (functoriality): Scaling ψ and the diagonal G-action preserve every V_w.

**Checks and worked examples.**

- **IncidenceStratum.identity**: V_e consists of equal flags with arbitrary operator in that Borel.
- **IncidenceStratum.sl2Open**: For SL₂ opposite flags, the fibre is t of dimension 1, not u.
- **IncidenceStratum.zero**: For every w, V_w contains the zero-operator section U_w.

**Source.** BHS19, §2.2, p. 311: V_w is the full incidence scheme above the relative-position orbit.

### stratum-bundle: The incidence bundle over a Bruhat orbit

**Target.** π_w:V_w→U_w is a vector bundle of rank dim B−ℓ(w)=r+N−ℓ(w). Its fibre over (gB,gŵB) is Ad(g)(t⊕(u∩Ad(ŵ)u)). Thus V_w is smooth geometrically integral of dimension D for every w.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/incidence-strata, SpringerResolutionAndCharacteristicCycles:F/constant-rank-intersection, SpringerResolutionAndCharacteristicCycles:F/orbit-geometry, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, SpringerResolutionAndCharacteristicCycles:F/flag-geometry.

**Construction or proof.**

1. Inside the trivial g-bundle on F×F intersect the two Borel subbundles.
2. Use the root decomposition to compute b∩Ad(ŵ)b=t⊕(u∩Ad(ŵ)u), with nilpotent intersection dimension N−ℓ(w).
3. Apply the reduced-base constant-rank intersection theorem on U_w, then add base and fibre dimensions.

**Check.** For SL₂, V_e has bundle rank 2 over the one-dimensional diagonal and V_s has rank 1 over a two-dimensional orbit; both total dimensions are 3.

**Source.** BHS19, Proposition 2.2.1, pp. 311–312, formulas (2.6)–(2.7): All strata are vector bundles of complementary rank and have the same total dimension.

### component-closures: The incidence components

**Target.** Define X_w as the reduced closed closure of V_w in X. Equivalently it is the scheme theoretic image of V_w→X because V_w is reduced. Write pr_i,w and κ_i,w for restrictions. The definition does not identify X_w with π⁻¹(Ū_w).

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/stratum-bundle, SpringerResolutionAndCharacteristicCycles:I/incidence-scheme, SpringerResolutionAndCharacteristicCycles:I/cartan-maps, SchemeAndStackFoundations:SF.0.

**Uses.** C, N, K, T and E: CM and normal components, scheme zero fibres and completed component labels.

**Construction or proof.**

1. Use the ideal of functions vanishing on V_w; it is radical because the source is reduced.
2. Form the closed subscheme and restrict every named projection. The dense open V_w determines it uniquely.

**API.**

- **IncidenceComponent.denseOpen** (structure): V_w→X_w is an open dense immersion.
- **IncidenceComponent.universalClosure** (universal-property): A closed reduced subscheme of X contains X_w iff it contains V_w.
- **IncidenceComponent.flagImage** (projection): The set theoretic image π(X_w) is Ū_w.
- **IncidenceComponent.restriction** (compatibility): The maps pr_i,w, κ_i,w compose with X_w→X to the original maps.

**Checks and worked examples.**

- **IncidenceComponent.identity**: X_e=V_e≅g̃, embedded with equal flags.
- **IncidenceComponent.sl2Longest**: For SL₂, X_s is not all of X, although Ū_s=F×F.
- **IncidenceComponent.bruhatExclusion**: X_e∩V_s is empty for SL₂, while X_s meets V_e at ψ=0.

**Source.** BHS19, Definition 2.2.3 and Lemma 2.2.4, pp. 312–313: Components arise as closures of the equal-dimensional incidence strata.

### bruhat-support: Bruhat support of a component

**Target.** π(X_w)=Ū_w as closed subsets, and X_w∩V_v≠∅ implies v≤w. The X_w are geometrically irreducible and no distinct X_w is contained in another.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/component-closures, SpringerResolutionAndCharacteristicCycles:F/orbit-geometry, SpringerResolutionAndCharacteristicCycles:I/stratum-bundle.

**Construction or proof.**

1. The zero-operator section over U_w extends over its closure and lies in X_w, giving one image inclusion and surjectivity onto Ū_w. Continuity gives the other.
2. All X_w have dimension D and dense pairwise disjoint V_w; containment would force equality and an intersection of these dense opens.

**Check.** For SL₂, X_e misses V_s, while X_s meets V_e along zero operators. The support order is v≤w, and X_s is not the whole inverse image of the largest orbit closure.

**Source.** BHS19, Lemma 2.2.4 and proof of Proposition 2.2.5, pp. 312–313: The Bruhat order controls possible boundary strata and distinct closures yield distinct components.

### local-complete-intersection: Local complete intersection of X

**Target.** The X_w, w∈W, are exactly the irreducible components of X; X is equidimensional of dimension D and is a local complete intersection over k, hence Cohen–Macaulay. This statement concerns X and does not yet prove CM for the separate reduced X_w.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/component-closures, SpringerResolutionAndCharacteristicCycles:I/bruhat-support, SpringerResolutionAndCharacteristicCycles:I/stratum-bundle, SpringerResolutionAndCharacteristicCycles:F/flag-geometry, DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersections, DeformationAndDerivedPatchingAlgebra:R03.3/ci-cohen-macaulay.

**Construction or proof.**

1. The finite stratum decomposition shows the closures exhaust the components.
2. X lies in the smooth scheme F×F×g of dimension D+2N. Each incidence condition is the vanishing of a section of the rank-N quotient of the Borel subbundle.
3. Locally X is cut out by 2N equations with codimension 2N; the expected-codimension criterion in a regular local ring makes them a regular sequence. Import the general CI-to-CM theorem.

**Check.** For SL₂ the smooth ambient F×F×g has dimension 5, the incidence equations have rank 2 and every component has dimension 3. The CM conclusion applies to X before it is proved for X_w.

**Source.** BHS19, Proposition 2.2.5, p. 313: The full incidence scheme is an expected-codimension complete intersection.

**Required input still to establish.** AG-geometry (exact boundaries below).

### reduced-incidence: Reducedness of X

**Target.** X is reduced. Its generic points lie above gʳˢ, and each reduced component X_w therefore agrees with its component scheme structure obtained from the generically reduced CM scheme X.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/local-complete-intersection, SpringerResolutionAndCharacteristicCycles:G/resolution-properties, SpringerResolutionAndCharacteristicCycles:I/stratum-bundle, DeformationAndDerivedPatchingAlgebra:R03.3/serre-conditions.

**Construction or proof.**

1. A CM noetherian scheme has no embedded associated points, so generic reducedness suffices.
2. For each V_w its restriction to regular semisimple ψ is nonempty and dense: take a regular toral element in its fibre.
3. The fibre product of the finite étale regular semisimple covering is étale over its smooth base and hence reduced; it contains all generic points of X.

**Check.** The finite étale regular-semisimple locus meets both SL₂ components and establishes generic reducedness. Reducedness of X must not be used to discard multiplicities of its Cartan fibres.

**Source.** BHS19, Theorem 2.2.6(i), pp. 313–314: CM and reducedness on the dense regular semisimple loci imply reducedness everywhere.

**Required input still to establish.** AG-geometry (exact boundaries below).

### birational-projections: Birational projections of the components

**Target.** For i=1,2, pr_i,w:X_w→g̃ is proper birational and restricts to an isomorphism above g̃ʳᵉᵍ. In particular that inverse-image open of X_w is smooth. The full q is not asserted birational when W is nontrivial.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/component-closures, SpringerResolutionAndCharacteristicCycles:G/resolution-properties, SpringerResolutionAndCharacteristicCycles:I/reduced-incidence, SpringerResolutionAndCharacteristicCycles:I/bruhat-support, SchemeAndStackFoundations:SF.0.

**Construction or proof.**

1. Properness is inherited from the base-changed proper q. Over gʳˢ, V_w gives the graph of the deck transformation labelled by w; hence degree one on each component.
2. Over g̃ʳᵉᵍ, quasi-finiteness of q makes pr_i,w finite. It is birational onto the normal smooth scheme g̃ʳᵉᵍ, so the finite birational comparison is an isomorphism.

**Check.** For SL₂ each X_w→g̃ has degree one above the regular locus, although g̃→g has generic degree two. For a torus both projections are identities on t.

**Source.** BHS19, Theorem 2.2.6(ii), pp. 313–314: Each component projection resolves the graph and is already an isomorphism on the regular locus.

**Required input still to establish.** AG-geometry (exact boundaries below).

## Layer C: Cohen–Macaulayness and Cartan flatness

Prove equidimensionality and surjectivity of all κ_i and κ_i,w fibres. Import the precise Bezrukavnikov–Riche CM input, transfer it to split reductive groups and characteristic zero using integral models, and apply the local dimension-equality form of miracle flatness.

### cartan-fibre-dimensions: Dimensions of Cartan fibres

**Target.** For each i∈{1,2}, κ_i:X→t and κ_i,w:X_w→t are surjective, and every geometric fibre of each is equidimensional of dimension D−r=2N.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/cartan-maps, SpringerResolutionAndCharacteristicCycles:I/component-closures, SpringerResolutionAndCharacteristicCycles:I/stratum-bundle, SpringerResolutionAndCharacteristicCycles:I/bruhat-support, SpringerResolutionAndCharacteristicCycles:F/flag-geometry.

**Construction or proof.**

1. The dense stratum description gives surjectivity for X_w: its toral coordinate can be prescribed.
2. At zero, the stratum over U_v has nilpotent-intersection fibre dimension N−ℓ(v), so every stratum in the zero fibre has dimension 2N. The dimension inequality for fibres supplies the matching lower bound for components of X_w.
3. Use upper semicontinuity on X of the local fibre dimension x↦dim_x κ_i⁻¹(κ_i(x)). Its locus above 2N is closed and scaling-stable. Each scalar orbit extends to zero operator on the same flags, so a nonempty excess-dimension locus would meet the zero fibre, contradicting its stratum calculation. The lower bound on every component then proves equidimensionality. Apply the same argument to each scaling-stable X_w.

**Check.** For a torus κ_i=id_t and fibres have dimension 0. For SL₂ both incidence components have every Cartan fibre of dimension 2, including the zero fibre with its possibly multiple components.

**Source.** BHS19, Lemma 2.3.1, pp. 314–315: Scaling to the zero fibre gives the uniform fibre dimension for X and its components.

**Required input still to establish.** AG-geometry (exact boundaries below).

### bezrukavnikov-riche-input: Bezrukavnikov–Riche Cohen–Macaulay theorem

**Target.** Over an algebraically closed field of characteristic p>h, for a semisimple simply connected split G, the reduced graph closures X_w are Cohen–Macaulay. In the integral model over Z_(p), formation of these closures commutes with the special fibre: X_A,w×F_p=X_Fp,w scheme theoretically. The BR coadjoint and inverse-index conventions are translated before applying this input.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/component-closures, tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ.

**Construction or proof.**

1. BR works with annihilators in g* and labels the orbit by w⁻¹. Use an invariant form in this characteristic range and replace w by w⁻¹ to compare the closures.
2. Read BR Theorem 2.2.1 as the stated CM input. Its proof identifies the structure sheaf with a derived convolution kernel by Bruhat induction; the required positive-characteristic localisation and kernel-concentration package is the explicit BR-input gap, not a theorem claimed to be available in Lean.
3. Use BR Remark 2.11.1 for the actual scheme special fibre; topological equality would not suffice.

**Check.** For type A₁ in characteristic 5, h=2 and the input applies to both labels. Verify the scheme special fibre of the closure, rather than just equality of its underlying set.

**Source.** BHS19, Proposition 2.3.3, pp. 315–316: The CM input and special-fibre compatibility are imported from BR. BR12, Theorem 2.2.1, pp. 557–558; §2.10, pp. 570–571; Remark 2.11.1, p. 572: CM graph closures arise from convolution kernels, with scheme theoretic base change over large primes.

**Required input still to establish.** BR-input (exact boundaries below).

### cm-reductive-and-zero: Cohen–Macaulayness in the required generality

**Target.** For split connected reductive G and char(k)=0 or p>h, every X_w is geometrically Cohen–Macaulay. In characteristic zero, choose p>h and the split Chevalley model over A=Z_(p); the closure X_A,w is A-flat and has special fibre X_Fp,w.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:C/bezrukavnikov-riche-input, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ, DeformationAndDerivedPatchingAlgebra:R03.3/flat-depth-dimension-formulas, SpringerResolutionAndCharacteristicCycles:I/component-closures, tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon.

**Construction or proof.**

1. After passing to an algebraic closure, replace G by G_der^sc×Z(G)° through a central isogeny of degree invertible in the stated range. Its differential and flag map identify the incidence components with the simply connected components times the central Lie-algebra factor. CM is preserved by this smooth affine factor.
2. In characteristic zero define X_A,w as the closure of its generic stratum inside the Chevalley incidence model. Its coordinate rings are A-torsion-free, hence A-flat; use BR special-fibre compatibility.
3. At special-fibre points, flatness over the DVR and the CM special fibre imply CM of the total space. For the remaining generic points use the open CM locus and the G_m-action: a hypothetical bad closed generic point is defined over a number field. Choose a DVR over p, extend both flags by projectivity, and multiply ψ by a sufficiently high power of its uniformizer to make the operator integral. The closed G_m-stable model then extends the scaled bad point into its special fibre. The closed non-CM locus would specialize to a non-CM special point, a contradiction. The CM-locus, DVR extension and faithfully flat descent inputs are precisely the CM-spreading gap.

**Check.** The type A₁ test applies in characteristic 3 as well as characteristic zero, and the torus test is affine space t. The scaling argument must reach generic points outside an arbitrary initial neighbourhood of the special fibre.

**Source.** BHS19, Proposition 2.3.3, pp. 315–316: The integral argument transports CM from large positive characteristic to characteristic zero.

**Required input still to establish.** BR-input, CM-spreading, Lie-invariants (exact boundaries below).

### cartan-flatness: Flatness of the Cartan projections

**Target.** Each κ_i and κ_i,w is flat. Apply the local miracle-flatness theorem: for every local map O_t,κ(x)→O_Y,x, with Y=X or X_w, the source is regular, the target is CM and dim O_Y,x=dim O_t,κ(x)+dim O_(Y_κ(x)),x. The global fibre dimensions alone are not the flatness criterion for arbitrary noetherian schemes.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:C/cartan-fibre-dimensions, SpringerResolutionAndCharacteristicCycles:C/cm-reductive-and-zero, SpringerResolutionAndCharacteristicCycles:I/local-complete-intersection, DeformationAndDerivedPatchingAlgebra:R03.3/miracle-flatness-finite-modules.

**Construction or proof.**

1. The maps are of finite type over k, source schemes are equidimensional, t is irreducible regular, and the fibre theorem gives all fibres equidimensional of dimension D−r.
2. Use the finite-type dimension formula at each point to obtain the displayed local equality; then apply the imported local criterion with module M equal to the local ring.
3. For X use CM from its lci theorem; for X_w use the BR transfer. The disconnected unequal-component counterexample in E1 prevents applying the criterion outside these hypotheses.

**Check.** Reject the disconnected point-plus-line map in E1: global dimensions agree but the local equality fails at the isolated point. In the Cartan application check the equality at every local ring, including nonclosed points.

**Source.** BHS19, Lemma 2.3.2, p. 315, corrected as E1; Proposition 2.3.3, p. 316: Local miracle flatness yields flat Cartan maps in this equidimensional finite-type setting.

**Required input still to establish.** AG-geometry (exact boundaries below).

## Layer N: Normality of the incidence components

Identify κ₂,w=w⁻¹κ₁,w and smooth affine fibres of (π,κ_i) on V_w. Prove the regular-root-wall lemma and normality of X_w by Serre R₁+S₂, with every codimension-one boundary accounted for.

### cartan-relation: The Weyl relation between Cartan maps

**Target.** On X_w the morphisms to t satisfy κ₂,w=w⁻¹∘κ₁,w. In particular the two Cartan zero fibres on X_w are the same scheme.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/cartan-maps, SpringerResolutionAndCharacteristicCycles:I/component-closures, SpringerResolutionAndCharacteristicCycles:I/stratum-bundle.

**Construction or proof.**

1. On V_w write the common element as Ad(g)(z+n), with n∈u∩Ad(ŵ)u; the second Borel representative is gŵ, so its toral coordinate is w⁻¹z.
2. The two morphisms agree on the dense open V_w of the reduced integral X_w; separatedness of the affine target extends the equality.

**Check.** For GL₃ and a three-cycle w, a generic diagonal z has second coordinate w⁻¹z; substituting wz is false. At zero the two coordinate ideals agree on X_w.

**Source.** BHS19, Lemma 2.3.4, pp. 316–317: The inverse Weyl element is forced by the second flag convention.

### smooth-stratum-fibres: Smooth Cartan and flag fibres

**Target.** The maps (π,κ_i):V_w→U_w×t are smooth surjective with geometrically irreducible affine-space fibres of dimension N−ℓ(w). For any v∈W, the inverse image of U_w×ker(v−id_t) is geometrically irreducible.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/stratum-bundle, SpringerResolutionAndCharacteristicCycles:N/cartan-relation, mathlib:LinearMap.ker.

**Construction or proof.**

1. The quotient t⊕(u∩Ad(ŵ)u)→t is surjective with kernel dimension N−ℓ(w). Descend this vector-bundle calculation over the orbit.
2. The restriction over the linear subspace has an irreducible smooth base and geometrically irreducible affine-space fibres; local bundle trivialisations give integrality.

**Check.** For SL₂ the maps on V_e have affine-line fibres and those on V_s have point fibres. Restriction to the zero toral subspace must still be geometrically irreducible.

**Source.** BHS19, Lemma 2.3.5, p. 317: The simultaneous flag and Cartan map has affine fibres, including over the fixed subspaces needed at the boundary.

### regular-root-wall: Regular points over a single root wall

**Target.** Over an algebraic closure, let s_α be a Weyl reflection and v∈W with ℓ(s_αv)>ℓ(v). In the incidence stratum V_v there are regular elements with κ₁ in ker(s_α−id), and they form a nonempty open subset of its inverse image. More precisely choose z on the α-wall and on no distinct root wall, and 0≠c∈k; z+c e_β is regular for the sign β of α lying in the positive roots with v⁻¹β positive.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:N/smooth-stratum-fibres, SpringerResolutionAndCharacteristicCycles:G/regular-loci, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation.

**Construction or proof.**

1. The length inequality places the indicated root space in u∩Ad(v)u.
2. The centralizer of a generic point of the wall has semisimple rank one; adding a nonzero vector in its root space changes its rank-one part to regular nilpotent. The remaining root spaces have nonzero z-eigenvalue.
3. The root decomposition computes centralizer dimension r. Openness of regularity and irreducibility from the preceding theorem give a dense regular open.

**Check.** For SL₂ the reflection wall is z=0 and z+cE₁₂ is regular for c≠0, although its semisimple part z is not regular. This is exactly the boundary case needed for R₁.

**Source.** BHS19, Proof of Theorem 2.3.6, pp. 318–319: A rank-one centralizer calculation produces regular points in every codimension-one boundary candidate.

**Required input still to establish.** Lie-invariants (exact boundaries below).

### normal-components: Normality of the incidence components

**Target.** Every X_w is geometrically normal. This theorem does not assert normality of the reducible X or of the nilpotent components Z_w.

**Hypotheses.** G is split connected reductive over k, with B⊃T and U=radᵤ(B); g,b,t,u are their Lie algebras. Unless characteristic zero is specified, char(k)=0 or char(k)=p>h, where h is the maximum Coxeter number of the simple factors; for a torus take h=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:C/cm-reductive-and-zero, SpringerResolutionAndCharacteristicCycles:I/birational-projections, SpringerResolutionAndCharacteristicCycles:I/bruhat-support, SpringerResolutionAndCharacteristicCycles:N/cartan-relation, SpringerResolutionAndCharacteristicCycles:N/smooth-stratum-fibres, SpringerResolutionAndCharacteristicCycles:N/regular-root-wall, DeformationAndDerivedPatchingAlgebra:R03.3/serre-normality.

**Construction or proof.**

1. CM gives S₂. A codimension-one component C of the boundary has dense intersection with some V_v, v<w. The Cartan relation for w and v puts it above ker(wv⁻¹−id).
2. Compare the affine-fibre dimension from SM with dim C=D−1. The fixed-space codimension must be one, so wv⁻¹ is a reflection s_α. The irreducible inverse image from SM is precisely the possible boundary component.
3. The regular-root-wall theorem shows that this C meets the open on which pr_i,w is an isomorphism to smooth g̃ʳᵉᵍ. Thus every height-one generic point is regular. Apply Serre R₁+S₂, and repeat after algebraic closure.

**Check.** For SL₂ both X_e and X_s are normal even though their union X is reducible and is not normal at their meeting. No normality conclusion about Z_w follows by taking the Cartan zero fibre.

**Source.** BHS19, Theorem 2.3.6, pp. 318–319: The codimension-one boundary is regular and CM supplies the remaining Serre condition.

## Layer S: The Springer resolution and Steinberg variety

In characteristic zero prove Chevalley restriction, define the nilpotent cone and Springer resolution Ñ=G×ᴮu, and identify Ñ with T*F using an invariant nondegenerate form. Construct the reduced Steinberg variety Z and its components Z_w, and identify them with conormal closures with the cotangent sign fixed.

### chevalley-restriction: Chevalley restriction and the nilpotent fibre

**Target.** In characteristic zero the adjoint quotient is c=Spec k[g]^G≅Spec k[t]^W=t/W≅Aʳ. Its zero fibre has reduced support equal to the nilpotent elements of g, and is the reduced nilpotent cone 𝒩. The composite g̃→g→c equals g̃→κ t→t/W. A nondegenerate invariant symmetric form g≅g* exists for reductive G; the Killing form alone is not adequate on the centre.

**Hypotheses.** char(k)=0; G is split connected reductive with the fixed B⊃T.

**Inputs.** tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, SpringerResolutionAndCharacteristicCycles:G/regular-loci, SpringerResolutionAndCharacteristicCycles:I/cartan-maps, SchemeAndStackFoundations:SF.0.

**Construction or proof.**

1. Use restriction of invariant polynomials and the Weyl invariant-polynomial theorem to construct the quotient comparison. Separate the central summand from the semisimple derived summand.
2. On the Borel, invariant functions depend only on the toral quotient. The zero toral value forces the central component to vanish and the derived component to be nilpotent.
3. Use the invariant form on the derived summand and any nondegenerate form on the centre. The Lie-invariants gap includes the precise reduced nilpotent-fibre statement, rather than deriving reducedness from its set of points.

**Check.** For GL₂ the quotient coordinates can be trace and determinant, and their zero fibre is the nilpotent cone. The centre gives a direct counterexample to using the Killing form as a nondegenerate reductive form.

**Source.** BHS19, Beginning of §2.4, pp. 319–320; Lemma 2.3.4, p. 316: The characteristic-zero adjoint quotient identifies the nilpotent geometry and Cartan factorisation.

**Required input still to establish.** Lie-invariants (exact boundaries below).

### springer-resolution: The Springer resolution

**Target.** In characteristic zero define 𝒩̃=G×ᴮu as the closed subbundle of g̃ cut out by κ=0, and μ:𝒩̃→𝒩 by q. Its incidence points are (gB,ψ) with Ad(g⁻¹)ψ∈u. The map μ is the Springer resolution: proper birational, with smooth source of dimension 2N.

**Hypotheses.** char(k)=0; G is split connected reductive.

**Inputs.** SpringerResolutionAndCharacteristicCycles:G/simultaneous-resolution, SpringerResolutionAndCharacteristicCycles:S/chevalley-restriction, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, SpringerResolutionAndCharacteristicCycles:F/flag-geometry.

**Uses.** S and H: Cotangent presentation, Steinberg fibre product and moment-map support.

**Construction or proof.**

1. Descend u⊂b and compare its associated bundle with the scheme zero fibre of b→t.
2. The incidence projection is proper, and nilpotent elements admit compatible Borel flags. The regular nilpotent locus has a unique such flag, yielding birationality. The nilpotent-orbit input is kept in Lie-invariants.

**API.**

- **SpringerResolution.zeroFibre** (equivalence): 𝒩̃≅g̃×_t{0} as schemes, not merely on points.
- **SpringerResolution.operator** (projection): μ([g,n])=Ad(g)n.
- **SpringerResolution.bundle** (structure): 𝒩̃→F is a vector bundle of rank N.
- **SpringerResolution.baseChange** (functoriality): The construction and its incidence embedding commute with field extension.

**Checks and worked examples.**

- **SpringerResolution.torus**: For a torus 𝒩=𝒩̃=Spec k, although g̃=t.
- **SpringerResolution.sl2**: For SL₂, 𝒩̃≅Tot O_(P¹)(−2), of dimension 2.
- **SpringerResolution.zero**: μ⁻¹(0)=F; for a nonzero regular nilpotent in SL₂ the fibre is a single reduced flag.

**Source.** BHS19, §2.4, p. 320: The nilpotent associated bundle and its projection give the Springer resolution.

**Required input still to establish.** VB-upstream, Lie-invariants (exact boundaries below).

### cotangent-identification: Cotangent and conormal identifications

**Target.** The fixed invariant form identifies T*F≅𝒩̃, because the annihilator of b is u. Under T*(F×F)≅𝒩̃×𝒩̃, embed a triple (F₁,F₂,ψ) as ((F₁,−ψ),(F₂,ψ)). The moment map for diagonal G is ξ₁+ξ₂, so its zero locus corresponds to the common-operator incidence condition. Over U_w its reduced zero locus is T*_(U_w)(F×F).

**Hypotheses.** char(k)=0; choose a nondegenerate invariant symmetric form on g.

**Inputs.** SpringerResolutionAndCharacteristicCycles:S/springer-resolution, SpringerResolutionAndCharacteristicCycles:F/relative-position, tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation.

**Construction or proof.**

1. Compute T*_(gB)F=Ad(g)b⊥=Ad(g)u. The natural moment map is the operator coordinate.
2. A covector annihilates the diagonal orbit tangent exactly when the two moment maps add to zero. Use a minus sign in the first factor and the identity in the second.
3. Descend the orbitwise identification and compare dimensions. The product is of two Springer resolutions; substituting two Grothendieck resolutions would give dimension 4N+2r.

**Check.** For a positive-rank torus T*F is a point while g̃=t has positive dimension. For SL₂ the signed pair (−ψ,ψ) has moment sum zero; the unsigned pair need not.

**Source.** BHS19, §2.4, pp. 320–321; proof of Lemma 2.4.8, p. 324, corrected as E4: Cotangent geometry identifies nilpotent incidence with conormal geometry and fixes the sign.

**Required input still to establish.** VB-upstream, AG-geometry (exact boundaries below).

### steinberg-variety: The reduced Steinberg variety

**Target.** Define Z=(X×_c{0})_red, and define Z_w as the reduced closure in Z of V′_w=π⁻¹(U_w)∩Z. There is a canonical isomorphism Z≅(𝒩̃×_𝒩𝒩̃)_red. The raw fibre-product comparison without reduction is a separate target, not part of this definition.

**Hypotheses.** char(k)=0; conventions for flags, κ_i and the invariant form are fixed.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/incidence-scheme, SpringerResolutionAndCharacteristicCycles:S/chevalley-restriction, SpringerResolutionAndCharacteristicCycles:S/springer-resolution, SpringerResolutionAndCharacteristicCycles:I/component-closures, SpringerResolutionAndCharacteristicCycles:N/cartan-relation.

**Uses.** Y, H, K and E: The component basis for characteristic and completed cycles.

**Construction or proof.**

1. Form the nilpotent fibre of the common operator map and then its reduction.
2. After reduction the two Borel conditions force both toral parts to vanish; compare the two reduced functors on reduced test schemes or radical ideals.
3. Define each component by reduced closure, retaining its label from the relative-position orbit.

**API.**

- **Steinberg.reducedFibreProduct** (equivalence): Z≅(𝒩̃×_𝒩𝒩̃)_red with the same flags and operator.
- **Steinberg.component** (constructor): Z_w is the reduced closure of V′_w, not the Cartan zero fibre of X_w.
- **Steinberg.cotangent** (compatibility): Its cotangent embedding sends ψ to (−ψ,ψ).
- **Steinberg.baseChange** (functoriality): Reduction and these components commute with characteristic-zero field extension.

**Checks and worked examples.**

- **Steinberg.torus**: For a torus Z=Z_e=Spec k; it is not t.
- **Steinberg.sl2Components**: For SL₂, Z_e is the diagonal Springer resolution and Z_s=F×F×{0}; both have dimension 2.
- **Steinberg.sl2Meeting**: In SL₂ their intersection is the zero section diagonal F, so Z is reducible even though each X_w is normal.

**Source.** BHS19, §2.4 and Proposition 2.4.1, pp. 320–321: The reduced nilpotent incidence variety and its labelled components are the Steinberg geometry used for cycles.

### raw-fibre-product-comparison: Scheme comparison for the Steinberg fibre product

**Target.** Let Q=𝒩̃×_𝒩𝒩̃ be the scheme fibre product in characteristic zero. The canonical closed immersion Z≅Q_red→Q is an isomorphism if and only if Q is reduced. Thus Z≅Q without reduction is conditional on radicality of the local incidence ideals; equality of geometric points alone does not establish that condition.

**Hypotheses.** char(k)=0; 𝒩 and Z have the reduced scheme structures specified above.

**Inputs.** SpringerResolutionAndCharacteristicCycles:S/steinberg-variety, SpringerResolutionAndCharacteristicCycles:S/springer-resolution, SpringerResolutionAndCharacteristicCycles:S/chevalley-restriction.

**Construction or proof.**

1. Construct the closed immersion from the reduced fibre product.
2. The immersion is an isomorphism exactly when the nilradical sheaf of Q vanishes. Reducedness of Q is the separate Steinberg-reduced gap. The BHS display may be read in the reduced-variety convention; it is not used as a scheme-level reducedness theorem, and no subsequent cycle theorem assumes it.

**Check.** For a torus both raw and reduced Springer fibre products are a point. In higher rank this elementary case does not prove radicality; the comparison remains bounded by Steinberg-reduced and is not used by the cycle identities.

**Source.** BHS19, Beginning of §2.4, pp. 319–320, displayed Steinberg comparison: The variety-level display supplies the reduced comparison; it does not independently establish reducedness of the raw scheme fibre product.

**Required input still to establish.** Steinberg-reduced (exact boundaries below).

### steinberg-components: Components and conormal closures

**Target.** Z is equidimensional of dimension 2N; its irreducible components are exactly the distinct Z_w, w∈W. Under the signed cotangent embedding, Z_w is the reduced conormal closure of U_w. Each V′_w→U_w is a vector bundle of rank N−ℓ(w). No CM or normality assertion for Z_w is included.

**Hypotheses.** char(k)=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:S/steinberg-variety, SpringerResolutionAndCharacteristicCycles:S/cotangent-identification, SpringerResolutionAndCharacteristicCycles:I/stratum-bundle, SpringerResolutionAndCharacteristicCycles:N/smooth-stratum-fibres, SpringerResolutionAndCharacteristicCycles:F/orbit-geometry.

**Construction or proof.**

1. The nilpotent stratum fibre is u∩Ad(ŵ)u, giving dimension N−ℓ(w); add dim U_w=N+ℓ(w).
2. The orbit conormal description identifies each stratum and its reduced closure. The finite stratification by equal-dimensional irreducible strata gives precisely the components.

**Check.** For SL₂, Z_e is the diagonal Springer resolution and Z_s=P¹×P¹ at ψ=0; each has dimension 2 and they meet along the one-dimensional diagonal zero section.

**Source.** BHS19, Proposition 2.4.1, p. 320; §2.4, p. 321: Steinberg components are the conormal closures indexed by W.

## Layer Y: Top cycles and scheme theoretic zero fibres

Specialise native algebraic cycles to the free group on the components of an equidimensional noetherian scheme. Construct generic-length cycles of coherent modules and the unreduced Cartan zero fibres X̄ and X̄_w, preserving their multiplicities.

### top-cycle-group: The group of top cycles

**Target.** For a noetherian equidimensional scheme Y of dimension d with finitely many irreducible components, define Z_d(Y)=⊕_(η∈Y generic, dim closure{η}=d) Z[closure{η}]. This is the finite-support subgroup of native AlgebraicCycle Y Z supported at those generic points. There is no rational-equivalence quotient.

**Hypotheses.** Y is noetherian, finite dimensional and equidimensional of dimension d.

**Inputs.** SpringerResolutionAndCharacteristicCycles:S/steinberg-components, mathlib:AlgebraicGeometry.AlgebraicCycle, mathlib:Finsupp.

**Uses.** K and E: The three bases and the completed component expansion.

**Construction or proof.**

1. Use the generic point of each irreducible component to identify the finite set of top-dimensional integral closed subschemes.
2. Transport the free abelian structure from integer-valued finitely supported functions and embed it in native locally finite cycles.

**API.**

- **TopCycle.component** (constructor): A component C gives a basis vector [C].
- **TopCycle.coeff** (projection): coeff_C([C′]) is 1 for C=C′ and 0 otherwise.
- **TopCycle.ext** (extensionality): Two cycles agree iff all their component coefficients agree.
- **TopCycle.native** (compatibility): The inclusion in AlgebraicCycle Y Z has image supported on top generic points and is injective.

**Checks and worked examples.**

- **TopCycle.twoComponents**: For the two coordinate axes Y=V(xy), Z₁(Y)≅Z²; [axis x] and [axis y] remain independent.
- **TopCycle.point**: For Spec k, Z₀≅Z and its point has coefficient 1.
- **TopCycle.lowerDimension**: On Y=A¹, Z₁(Y) has the one generator [A¹]; the native zero-dimensional cycle [0] is not an element of this top-dimensional subgroup.

**Source.** BHS19, §2.4, p. 320; §2.5, p. 327: Top cycles are a free component group, before and after local completion.

### module-cycle: The generic-length cycle of a coherent module

**Target.** For a noetherian finite-dimensional scheme Y and a coherent O_Y-module M with dim Supp(M)≤d, define [M]_d=Σ_C length_(O_Y,ηC)(M_ηC)[C], where C runs over the finitely many d-dimensional components of Supp(M). Each localized module has finite length. The result is a native dimension-d cycle; when its support lies in a pure d-dimensional reduced Z⊂Y, identify its component coefficients with Z_d(Z). This identification does not turn M into an O_Z-module. Closed subscheme cycles use the pushforward of the full structure sheaf into Y, retaining nilpotent multiplicities.

**Hypotheses.** Y is noetherian and finite dimensional; M is coherent and dim Supp(M)≤d.

**Inputs.** SpringerResolutionAndCharacteristicCycles:Y/top-cycle-group, mathlib:Module.length, mathlib:Module.length_eq_add_of_exact, tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf.

**Uses.** D and E: Characteristic-cycle multiplicities and the completion formula.

**Construction or proof.**

1. At each d-dimensional generic point of Supp(M), the support of M localized there is zero-dimensional, hence the finite stalk has finite length. Convert finite extended-natural lengths to integer coefficients.
2. Define the finite cycle by these coefficients. Stalk exactness and length additivity give the short-exact-sequence API.

**API.**

- **ModuleCycle.coeff** (characterisation): The C coefficient is length(M_ηC).
- **ModuleCycle.exact** (relation): For 0→M′→M→M″→0, [M]=[M′]+[M″].
- **ModuleCycle.reduced** (compatibility): For a reduced pure d-dimensional closed subscheme Z⊂Y, the cycle of its pushforward O_Z is Σ_C[C].
- **ModuleCycle.lowerSupport** (simp): If dim Supp(M)<d then [M]_d=0.

**Checks and worked examples.**

- **ModuleCycle.doublePoint**: On Spec k[ε]/ε², [O]=2[point]; reducing first gives the wrong answer 1.
- **ModuleCycle.axes**: For k[x,y]/xy, [O]=[V(x)]+[V(y)].
- **ModuleCycle.extension**: The exact sequence 0→(ε)→k[ε]/ε²→k→0 gives 2=1+1 at the generic point.

**Source.** BHS19, §2.4, p. 320; Lemma 2.5.5, pp. 327–328: Cycles of schemes and coherent modules count generic lengths rather than reduced ranks.

### cartan-zero-fibres: The scheme theoretic Cartan zero fibres

**Target.** Define X̄=X×_(κ₁,t){0} and X̄_w=X_w×_(κ₁,w,t){0}, with their full scheme structures. Their reduced supports lie in Z, so their structure sheaves define cycles in Z_(2N)(Z), denoted [X̄] and [X̄_w]. The same zero fibre on X_w is obtained with κ₂,w.

**Hypotheses.** char(k)=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/cartan-maps, SpringerResolutionAndCharacteristicCycles:N/cartan-relation, SpringerResolutionAndCharacteristicCycles:C/cartan-flatness, SpringerResolutionAndCharacteristicCycles:S/steinberg-variety, SpringerResolutionAndCharacteristicCycles:Y/module-cycle.

**Uses.** K and E: Verma characteristic cycles and their completed KL expansions.

**Construction or proof.**

1. Form the native scheme fibres before reduction. The Cartan relation identifies the zero conditions for each component.
2. Nilpotence identifies the reduced support with a union of Steinberg components. Form the generic-length cycle of the structure sheaf pushed into X, then identify its dimension-2N component basis with that on Z. There is no asserted map from the nonreduced fibre to Z_red.

**API.**

- **CartanZeroFibre.universal** (universal-property): A map into X_w factors through X̄_w iff its κ₁,w composite is zero.
- **CartanZeroFibre.second** (equivalence): The zero fibres of κ₁,w and κ₂,w agree as closed subschemes.
- **CartanZeroFibre.cycle** (projection): Its cycle uses O_(X̄_w) and generic lengths on Z.
- **CartanZeroFibre.scalars** (compatibility): Flat field extension commutes with the scheme zero fibre and its geometric components.

**Checks and worked examples.**

- **CartanZeroFibre.torus**: For a torus X=t and X̄_e=Spec k.
- **CartanZeroFibre.sl2Identity**: For SL₂, X̄_e=𝒩̃, so [X̄_e]=[Z_e].
- **CartanZeroFibre.sl2Longest**: For SL₂, [X̄_s]=[Z_s]+[Z_e]; identifying X̄_s with Z_s loses the diagonal component.

**Source.** BHS19, §2.4, p. 320, notation preceding Proposition 2.4.6: The zero fibre of a normal incidence component may carry nontrivial generic multiplicities.

### zero-fibre-dimension: Dimension and Cohen–Macaulayness of zero fibres

**Target.** X̄ and every X̄_w are equidimensional CM schemes of dimension 2N. Their scheme multiplicities need not be discarded, although their reduced supports have only the Z_v as possible top components.

**Hypotheses.** char(k)=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:Y/cartan-zero-fibres, SpringerResolutionAndCharacteristicCycles:C/cm-reductive-and-zero, SpringerResolutionAndCharacteristicCycles:I/local-complete-intersection, SpringerResolutionAndCharacteristicCycles:C/cartan-flatness, SpringerResolutionAndCharacteristicCycles:C/cartan-fibre-dimensions, DeformationAndDerivedPatchingAlgebra:R03.3/flat-depth-dimension-formulas.

**Construction or proof.**

1. The source of each flat Cartan map is CM and its target t is regular. The local flat depth formula makes every fibre CM.
2. The previously proved uniform fibre dimension gives 2N; the nilpotent support and the Steinberg component theorem identify the available top components.

**Check.** For SL₂ the Cartan fibres X̄_e and X̄_s are CM of pure dimension 2. Their cycles are respectively [Z_e] and [Z_e]+[Z_s], so neither dimension nor CM identifies X̄_s with Z_s.

**Source.** BHS19, Proposition 2.3.3, p. 316; §2.4, p. 320: Flat Cartan specialisation gives pure-dimensional CM zero fibres without asserting their reduction.

## Layer D: Differential operators and characteristic cycles

Construct the sheaf D_Y of k-linear differential operators on a smooth characteristic-zero variety, coherent left modules and good filtrations. Prove filtered PBW, existence and comparison of filtrations, reduced characteristic varieties, and the independence of characteristic cycles defined by generic lengths.

### differential-operators: The sheaf of differential operators

**Target.** Define F_(−1)D_Y=0 and F_pD_Y recursively as the k-linear operators P on O_Y for which [P,f]∈F_(p−1)D_Y for every local function f. Set D_Y=⋃_(p≥0)F_pD_Y with composition multiplication. A coherent left D_Y-module is locally finitely presented over this sheaf of rings and is O_Y-quasi-coherent. After filtered PBW proves local noetherianity, finite presentation is equivalent to finite generation.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SchemeAndStackFoundations:SF.0, mathlib:SheafOfModules, tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation.

**Uses.** D, H and L: Filtered modules, characteristic support, transfer and localisation.

**Construction or proof.**

1. Sheafify the local recursive commutator condition in End_k(O_Y); locality of differential operators gives restriction maps.
2. Composition respects F_pF_q⊂F_(p+q). Identify F₀=O_Y and F₁=O_Y⊕T_Y. Define coherent modules using local finite presentation; filtered PBW then proves local noetherianity and its equivalence with finite generation.

**API.**

- **DifferentialOperators.order** (characterisation): P∈F_p iff every (p+1)-fold iterated commutator with functions is zero.
- **DifferentialOperators.functions** (compatibility): F₀=O_Y and multiplication by functions is the native O_Y-action.
- **DifferentialOperators.product** (structure): F_p·F_q⊂F_(p+q); [F_p,F_q]⊂F_(p+q−1).
- **DifferentialOperators.etale** (functoriality): Étale coordinates identify D locally with operators generated by functions and commuting coordinate derivations.

**Checks and worked examples.**

- **DifferentialOperators.point**: On Spec k, D=k and F_p=k for every p≥0.
- **DifferentialOperators.line**: On A¹, ∂x−x∂=1, so replacing D by the commutative polynomial ring is false.
- **DifferentialOperators.coherence**: D_A¹ is coherent over itself and is not a coherent O_A¹-module; its O-rank is infinite.

**Source.** BHS19, §2.4, p. 321, D-module conventions: The characteristic-cycle input uses the ordinary untwisted sheaf of differential operators. M23, §§2.1–2.4, Theorems 2.11 and 2.21, pp. 1–6; Definition 3.1, p. 9: Recursive operators, local generators and coherent module conventions.

**Required input still to establish.** VB-upstream, AG-geometry (exact boundaries below).

### filtered-pbw: Filtered PBW for differential operators

**Target.** The principal symbol defines an isomorphism of graded O_Y-algebras Sym_(O_Y)(T_Y)≅gr_F D_Y. In étale coordinates x₁,…,x_n, F_pD is freely generated over O by ∂₁^a₁⋯∂_n^a_n with Σa_i≤p. Consequently D is left and right noetherian on affine coordinate charts, and Spec_Y(gr D)=T*Y.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:D/differential-operators, mathlib:SymmetricAlgebra.

**Construction or proof.**

1. Coordinate derivations commute. Monomials of total degree at most p have order at most p, giving F′_pD⊂F_pD. Repeated commutators and induction give F_pD⊂F′_pD and uniqueness of the monomial expansion; these are the directions needed despite the two reversed announcements in E7.
2. Its leading coefficients give the symbol map and identify the graded pieces with symmetric powers. Descent through étale charts gives the sheaf statement.
3. Use the noetherian graded ring and a leading-order argument to prove noetherianity of the filtered algebra.

**Check.** On A¹ the relation ∂x−x∂=1 becomes the commutative symbol ring k[x,ξ]. The order-p piece has O-basis 1,∂,…,∂^p.

**Source.** BHS19, §2.4, p. 321: The cotangent bundle is the spectrum of the associated graded operator algebra. M23, Theorems 2.11 and 2.21; Corollary 2.22, pp. 3–6; both PBW inclusion directions on pp. 3–4 corrected as E7: Coordinate PBW gives the symmetric graded algebra and the noetherian consequence.

**Required input still to establish.** VB-upstream (exact boundaries below).

### good-filtration: Good filtrations on coherent D-modules

**Target.** A filtration F_jM, j∈Z, is good when it is increasing, exhaustive, locally bounded below, each F_jM is coherent over O_Y, F_pD·F_jM⊂F_(p+j)M, and gr_FM is locally finitely generated over gr D. Equivalently, locally F_(p+j)M=F_pD·F_jM for all p≥0 once j is large enough. Filtrations are local sheaf data, with global choices where the stated hypotheses provide them.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:D/differential-operators, SpringerResolutionAndCharacteristicCycles:D/filtered-pbw, tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf.

**Uses.** D and H: Characteristic varieties, cycles and the holonomic dimension condition.

**Construction or proof.**

1. Use the order filtration on D and integer-indexed O-submodules of M.
2. Finite generation of gr M implies the eventual generation condition; the converse follows from finitely many coherent graded pieces.

**API.**

- **GoodFiltration.graded** (projection): gr_F M is a coherent module on T*Y.
- **GoodFiltration.shift** (functoriality): Replacing F_j by F_(j+a), a∈Z, preserves goodness.
- **GoodFiltration.local** (characterisation): Goodness is local on Y and may be checked in an étale coordinate cover.
- **GoodFiltration.eventual** (equivalence): Finite generation of gr M is equivalent to the stated eventual order-generation condition.

**Checks and worked examples.**

- **GoodFiltration.functionModule**: For O_A¹, F_j=0 for j<0 and F_j=O for j≥0 is good; the symbol ξ acts by zero.
- **GoodFiltration.regularModule**: For D_A¹ the order filtration is good and gr D=k[x,ξ].
- **GoodFiltration.unbounded**: For nonzero M, the constant filtration F_j=M for every integer j is not good because it is not bounded below; its zero graded module must not erase M.

**Source.** BHS19, §2.4, p. 321: Good filtrations allow coherent graded modules on the cotangent bundle. M23, Definitions 3.19 and 3.21; Proposition 3.22, pp. 13–14: All filtration conditions and their finite-generation equivalence.

### filtration-existence-comparison: Existence and comparison of good filtrations

**Target.** Every coherent D_Y-module admits good filtrations locally. A global coherent O_Y-generating subsheaf yields a global good filtration; on the flag varieties used here such generating subsheaves exist. Any two good filtrations are locally comparable up to bounded shifts. In a short exact sequence of coherent D-modules, choose a good middle filtration and induced filtrations on submodule and quotient; these are good and their graded sequence is exact.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:D/good-filtration, SpringerResolutionAndCharacteristicCycles:D/filtered-pbw, SchemeAndStackFoundations:SF.0.

**Construction or proof.**

1. Choose finite local D-generators to construct a good filtration by their orders. On a quasi-projective flag variety, extend the local generators to a coherent O-subsheaf generating M.
2. Express finite homogeneous generators for each filtration in bounded degrees of the other, giving the two inclusions after shifts.
3. Noetherianity of gr D makes the induced submodule finite. The induced quotient filtration then gives degreewise exactness.

**Check.** Shifting a good filtration by any integer changes its degrees but preserves goodness. For a short exact sequence, taking induced filtrations must yield an exact graded sequence; unrelated independently chosen filtrations need not do so.

**Source.** BHS19, §2.4, p. 321: Existence and comparison make characteristic support and cycle constructions intrinsic. M23, Propositions 3.24, 3.25 and 3.33, pp. 14–16: Good filtrations exist under the generating-subsheaf hypothesis, compare by shifts and can be made strict in exact sequences.

**Required input still to establish.** AG-geometry (exact boundaries below).

### characteristic-variety: The characteristic variety

**Target.** For a coherent D_Y-module M, define Ch(M)⊂T*Y as the reduced closed support of gr_FM for any local good filtration. These closed sets glue independently of the choices. This definition assigns reduced support, not a preferred possibly thickened characteristic subscheme. Put Ch(0)=∅.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:D/good-filtration, SpringerResolutionAndCharacteristicCycles:D/filtration-existence-comparison, SpringerResolutionAndCharacteristicCycles:D/filtered-pbw.

**Uses.** H: Holonomicity and moment-map support.

**Construction or proof.**

1. On an affine chart take the radical annihilator of gr_FM in Sym T_Y.
2. Comparison by bounded shifts and the Rees-lattice argument identify radical annihilators. Gluing follows from restriction compatibility.

**API.**

- **CharacteristicVariety.independent** (compatibility): Two good filtrations have the same reduced characteristic support.
- **CharacteristicVariety.restrict** (functoriality): Ch(M|_V)=Ch(M)×_YV for every open V.
- **CharacteristicVariety.exact** (relation): Ch(M)=Ch(M′)∪Ch(M″) for a short exact sequence.
- **CharacteristicVariety.conic** (structure): Ch(M) is invariant under scaling of cotangent fibres.

**Checks and worked examples.**

- **CharacteristicVariety.zeroSection**: Ch(O_A¹) is ξ=0, the zero section.
- **CharacteristicVariety.delta**: Ch(D_A¹/D_A¹x) is x=0, the whole cotangent fibre at zero.
- **CharacteristicVariety.full**: Ch(D_A¹)=T*A¹, whereas Ch(0)=∅.

**Source.** BHS19, §2.4, p. 321: Characteristic support is independent of filtration as a reduced closed set. M23, Definition 3.28 and Proposition 3.30, pp. 15–16: The characteristic variety is defined using radical support and is independent of filtration.

### characteristic-cycle: The characteristic cycle

**Target.** For a coherent D_Y-module M whose reduced characteristic support is empty or pure n-dimensional, define CC(M)=Σ_C length_(O_(T*Y),ηC)((gr_FM)_ηC)[C], over its n-dimensional characteristic components, and set CC(0)=0. This support hypothesis can be stated before the holonomic category is named. Bernstein inequality will identify it with holonomicity. Independence of F is a theorem; generic length, rather than rank after tensoring with the reduced component, is essential.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. Ch(M) is empty or pure n-dimensional; no holonomic-category carrier is needed to state this condition.

**Inputs.** SpringerResolutionAndCharacteristicCycles:Y/module-cycle, SpringerResolutionAndCharacteristicCycles:D/characteristic-variety, SpringerResolutionAndCharacteristicCycles:D/filtration-existence-comparison.

**Uses.** H, K, P and E: Additive Grothendieck-group map, simple and Verma cycles, parabolic and completed identities.

**Construction or proof.**

1. Apply the generic-length cycle construction directly to the coherent graded module with pure n-dimensional support. The stated support hypothesis, rather than a subsequent holonomic theorem, supplies the dimension needed here.
2. Compare adjacent Rees lattices. Their comparison has kernel and cokernel equal up to grading shift after reduction by the Rees parameter; their cycles cancel by length additivity. A bounded comparison reduces general filtrations to this case.

**API.**

- **CharacteristicCycle.independent** (compatibility): CC(M) is the same for every good filtration.
- **CharacteristicCycle.coefficient** (projection): Its C coefficient is the finite generic length, a nonnegative integer.
- **CharacteristicCycle.restrict** (functoriality): Restriction to an open subset discards components missing it and restricts the others.
- **CharacteristicCycle.zero** (simp): CC(0)=0.

**Checks and worked examples.**

- **CharacteristicCycle.line**: CC(O_A¹)=[zero section].
- **CharacteristicCycle.doubleDelta**: For M=D_A¹/D_A¹x², CC(M)=2[T*_{0}A¹]; reducing the graded support first would yield 1.
- **CharacteristicCycle.connection**: An integrable connection of rank a on a smooth n-fold has CC=a[zero section].

**Source.** BHS19, §2.4, p. 321; Theorem 2.4.7, pp. 322–323: The cycle invariant and its positivity are the bridge from D-modules to the Steinberg component group. M23, Definition 6.40 and Proposition 6.41, pp. 55–56: Characteristic multiplicities are generic lengths, with the Rees comparison proving independence. G98, Definition 1.1.12, p. 5, corrected as E5: The rank wording in this set of notes must be replaced by generic length.

## Layer H: Holonomicity, regularity and equivariance

Construct the transfer and duality operations used here, establish Kashiwara equivalence and Bernstein inequality, define holonomic and regular holonomic modules and strong algebraic equivariance. Build intermediate extensions, classify finite-orbit simple objects, and prove moment-map support and cycle additivity.

### transfer-and-duality: Transfer modules and D-module operations

**Target.** For a morphism f:Y→Y′ of smooth characteristic-zero varieties define D_(Y→Y′)=O_Y⊗_(f⁻¹O_Y′)f⁻¹D_Y′ with its left D_Y and right f⁻¹D_Y′ actions. Write Lf* for derived tensor with this transfer module and f†=Lf*[dim Y−dim Y′]. For a smooth map of relative dimension d, the abelian pullback is f†[−d]=Lf*. For a closed immersion of codimension c, f†=Lf*[−c] is the inverse in Kashiwara equivalence; direct image for right modules is Rf_*(M⊗^L_(D_Y)D_(Y→Y′)), and left direct image is obtained using the canonical-bundle left/right equivalence. Define duality 𝔻_Y(M)=RHom_(D_Y)(M,D_Y)⊗_(O_Y)ω_Y⁻¹[n] and f_!=𝔻_(Y′)f_+𝔻_Y. Fix this normalization throughout.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:D/differential-operators, SpringerResolutionAndCharacteristicCycles:D/filtered-pbw, mathlib:DerivedCategory, SchemeAndStackFoundations:SF.0.

**Uses.** H and L: Kashiwara, intermediate extension, regularity stability and equivariant descent.

**Construction or proof.**

1. Construct the transfer bimodule from the chain rule. Include the canonical-bundle action in the conversion between left and right modules.
2. Build derived tensor, derived Hom and derived pushforward in the native derived categories of sheaf modules. The sheaf-derived operations needed beyond the existing carrier are the D-homological gap.
3. The tensor associativity and projection comparisons produce the composition isomorphisms; do not identify naive O-pullback with derived D-inverse image for a closed immersion.

**API.**

- **DOperations.identity** (simp): Transfer for id_Y is D_Y and its inverse/direct image functors are identities.
- **DOperations.compose** (functoriality): The derived transfer comparisons identify the operations for a composite with the composites of operations.
- **DOperations.leftRight** (equivalence): Tensoring with ω_Y converts left to right modules, with inverse tensor by ω_Y⁻¹.
- **DOperations.dual** (relation): Coherent holonomic modules have biduality, and f_! is defined by the displayed dual conjugation.

**Checks and worked examples.**

- **DOperations.point**: For a point the normalized dual of a finite-dimensional vector space is its ordinary linear dual in degree zero.
- **DOperations.closedPoint**: For {0}→A¹, direct image of k is δ₀=D/Dx, not the O-module k with trivial ∂-action.
- **DOperations.identity**: For id_A¹ the transfer construction leaves O_A¹ and D_A¹ unchanged.

**Source.** BHS19, §2.4, p. 321, localisation and equivariant induction: Localisation and equivariance require genuine sheaf D-module operations. M23, §6.1, pp. 43–47; normalized duality before Exercise 6.55 and Remarks 6.56–6.57, pp. 62–63: Transfer formulas and the canonical-bundle conversion; the full derived machinery is an explicit input gap.

**Required input still to establish.** D-homological, VB-upstream (exact boundaries below).

### kashiwara-equivalence: Kashiwara equivalence

**Target.** For a closed immersion i:W→Y of smooth varieties, i_+ is exact on quasi-coherent D-modules and induces an equivalence from D_W-modules to D_Y-modules supported set theoretically on W, with inverse H⁰(i†), where i†=Li*[−codim_Y W]. This equivalence restricts to coherent modules. In normal coordinates, the direct image consists of finite sums of normal derivative monomials applied to the original module.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality, SpringerResolutionAndCharacteristicCycles:D/differential-operators, SpringerResolutionAndCharacteristicCycles:D/filtered-pbw.

**Construction or proof.**

1. Locally reduce to coordinate subspaces. The relations between the normal coordinates and normal derivatives give the expansion and identify sections killed by the normal ideal.
2. Use induction on the normal multi-index to prove full faithfulness and essential surjectivity. Patch these coordinate equivalences. The full sheaf/homological proof is bounded by the D-homological input gap.

**Check.** For {0}→A¹, the direct image of k is k[∂] with x acting by lowering derivatives; ker x=k and coker x=0. Thus Li*[−1] recovers k in degree zero.

**Source.** BHS19, §2.4, p. 321: The D-module classification on orbit supports uses the closed-immersion equivalence. M23, Theorem 6.20 and Proposition 6.24, pp. 48–51, with the Tor index corrected as E8: The equivalence for a smooth closed support, including coherence.

**Required input still to establish.** D-homological (exact boundaries below).

### bernstein-inequality: Bernstein inequality

**Target.** Every irreducible component of Ch(M) for a nonzero coherent D_Y-module M has dimension at least n.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:D/characteristic-variety, SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality, SpringerResolutionAndCharacteristicCycles:H/kashiwara-equivalence.

**Construction or proof.**

1. The filtered homological argument bounds Ext by characteristic codimension (Sato–Kashiwara filtration); this is an explicit part of D-homological. Alternatively use its support-purity consequence, then Kashiwara on a dense smooth support and induction on support dimension.

**Check.** On A¹, O has the one-dimensional zero section, δ₀ has the one-dimensional cotangent fibre and D has the two-dimensional whole cotangent bundle. The inequality includes all three; holonomicity excludes only D.

**Source.** BHS19, §2.4, p. 321; Theorem 2.4.7, pp. 322–323: The holonomic category has finite length and an additive cycle map. M23, §6.3, pp. 51–52: Bernstein inequality follows from filtered homological purity, Kashiwara and induction on support.

**Required input still to establish.** D-homological (exact boundaries below).

### holonomic-modules: Holonomic D-modules

**Target.** A coherent D_Y-module is holonomic when dim Ch(M)≤n, with zero holonomic. By Bernstein inequality, every component of the characteristic variety of a nonzero holonomic module has dimension n. Holonomicity does not itself impose regular singularities.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:D/characteristic-variety, SpringerResolutionAndCharacteristicCycles:H/bernstein-inequality.

**Uses.** H, L and K: Regularity by simple factors and cycle bases from finite-length modules.

**Construction or proof.**

1. Define the full subcategory using characteristic dimension and include the empty support explicitly.
2. Use the Bernstein theorem and exact-support theorem to obtain the abelian and finite-length API.

**API.**

- **Holonomic.zero** (instance): Zero belongs to the holonomic category.
- **Holonomic.exact** (characterisation): The middle object of a short exact sequence is holonomic iff both ends are.
- **Holonomic.fullSubcategory** (compatibility): Morphisms are exactly the D_Y-linear morphisms of the ambient coherent module category.
- **Holonomic.cycle** (projection): CC gives an additive map K₀(Hol(D_Y))→Z_n(T*Y).

**Checks and worked examples.**

- **Holonomic.function**: O_A¹ is holonomic; its support has dimension 1.
- **Holonomic.operatorRing**: D_A¹ is not holonomic; its characteristic support has dimension 2.
- **Holonomic.delta**: δ₀ and zero are holonomic, although only δ₀ has a nonempty characteristic variety.

**Source.** BHS19, §2.4, p. 321: The characteristic cycle and localisation restriction use the holonomic category.

### finite-length-and-cycle-additivity: Finite holonomic length and cycle additivity

**Target.** Every holonomic D_Y-module has finite length. For every short exact sequence 0→M′→M→M″→0 of holonomic modules, CC(M)=CC(M′)+CC(M″). Hence CC defines a group homomorphism from K₀(Hol(D_Y)) to the free group on n-dimensional characteristic components.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:H/holonomic-modules, SpringerResolutionAndCharacteristicCycles:D/characteristic-cycle, SpringerResolutionAndCharacteristicCycles:D/filtration-existence-comparison, mathlib:Module.length_eq_add_of_exact.

**Construction or proof.**

1. Use induced good filtrations to obtain an exact sequence of coherent graded modules. At each top generic point apply native module-length additivity.
2. The characteristic support of any subquotient lies in the finite union of components of Ch(M), and a nonzero holonomic subquotient contributes a positive coefficient somewhere. Total multiplicity therefore bounds every strict ascending or descending chain, proving finite length.
3. The exact-sequence relation is precisely the defining relation of K₀, so additivity supplies the homomorphism.

**Check.** For δ₀⊕δ₀ on A¹ the finite length is 2 and its cycle is twice the cotangent fibre. Additivity must retain this coefficient for extensions too, rather than counting only reduced support components.

**Source.** BHS19, §2.4, p. 321; Theorem 2.4.7, pp. 322–323: Finite holonomic length and cycle additivity transport composition multiplicities to cycles. M23, Proposition 6.37, p. 54; Proposition 6.42, p. 56: Finite-length holonomic objects and additive generic-length characteristic cycles.

### intermediate-extension: Intermediate extension

**Target.** For a locally closed immersion j:W→Y of smooth varieties and holonomic E on W, define j_!*E=im(H⁰j_!E→H⁰j_+E). It restricts to E and has no nonzero subobject or quotient supported on the complement of W in its closure. It is the unique such extension and is simple when E is simple.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality, SpringerResolutionAndCharacteristicCycles:H/kashiwara-equivalence, SpringerResolutionAndCharacteristicCycles:H/holonomic-modules, SpringerResolutionAndCharacteristicCycles:H/finite-length-and-cycle-additivity.

**Uses.** H and K: Definition of regularity and classification of simple cycles.

**Construction or proof.**

1. For an open immersion construct the natural !→+ map using duality and adjunction; use its image in the holonomic heart.
2. For a locally closed immersion compose an open and closed factorization; Kashiwara and the no-boundary-subquotient property prove independence.

**API.**

- **IntermediateExtension.restrict** (simp): j†j_!*E≅E in degree zero, using the codimension normalization for the locally closed immersion.
- **IntermediateExtension.unique** (universal-property): The no-boundary-subquotient condition characterizes j_!*E among extensions.
- **IntermediateExtension.simple** (structure): Simple E has simple intermediate extension.
- **IntermediateExtension.dual** (compatibility): 𝔻(j_!*E)≅j_!*(𝔻E).

**Checks and worked examples.**

- **IntermediateExtension.identity**: For j=id, j_!*E=E.
- **IntermediateExtension.trivialConnection**: For G_m↪A¹, j_!*O_(G_m)=O_A¹, while j_+O_(G_m)=O_A¹[x⁻¹] has an extra boundary quotient.
- **IntermediateExtension.closedPoint**: For {0}↪A¹, intermediate extension of k is δ₀.

**Source.** BHS19, §2.4, pp. 321–323: Simple equivariant modules are the intermediate extensions of orbit connections. M23, Definition 6.77; Theorem 6.79; Theorem 6.83, pp. 72–77: Image construction, uniqueness, simple extensions and classification.

**Required input still to establish.** D-homological (exact boundaries below).

### regular-holonomic: Regular holonomic D-modules

**Target.** An integrable connection is regular if every restriction to a smooth locally closed curve has, at every boundary point of a smooth projective completion, a logarithmic lattice. A simple holonomic module is regular if it is j_!* of a simple regular connection on a smooth locally closed support. A holonomic module is regular when all its simple factors are regular. Use geometric regularity after algebraic closure for general k; its descent and stability are separate inputs.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:H/holonomic-modules, SpringerResolutionAndCharacteristicCycles:H/intermediate-extension, SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality, SpringerResolutionAndCharacteristicCycles:H/finite-length-and-cycle-additivity.

**Uses.** H and L: The precise category in the B-equivariant localisation theorem.

**Construction or proof.**

1. For curves define a locally free lattice stable under logarithmic derivations. The condition is independent of the lattice and completion.
2. Use the simple-module classification to transfer the curve condition to simple holonomic objects. Extend through finite composition series; Jordan–Hölder makes this independent of the series.

**API.**

- **RegularHolonomic.connection** (characterisation): A flat bundle is regular exactly when it satisfies the curve logarithmic-lattice condition.
- **RegularHolonomic.factors** (characterisation): Regularity is equivalent to regularity of all composition factors.
- **RegularHolonomic.exact** (relation): Regular holonomic modules are closed under extensions and subquotients.
- **RegularHolonomic.scalar** (functoriality): The chosen geometric regularity is invariant under algebraically closed characteristic-zero extension; descent is required in D-regular.

**Checks and worked examples.**

- **RegularHolonomic.trivial**: O_A¹ with its trivial connection is regular.
- **RegularHolonomic.delta**: δ₀ is regular, as the intermediate extension of the connection on a point.
- **RegularHolonomic.irregular**: The rank-one connection ∂e=e on A¹ is holonomic but irregular at infinity: it has no logarithmic lattice there.

**Source.** BHS19, §2.4, p. 321: The localisation equivalence is stated in the regular holonomic category. M23, Definitions 7.25, 7.30 and 7.32, pp. 93–94: Curve, connection and simple-factor definitions of regularity.

**Required input still to establish.** D-regular (exact boundaries below).

### strong-equivariance: Strong algebraic equivariance

**Target.** For a smooth algebraic group H acting on Y, a strongly H-equivariant D-module is a D-module M with an isomorphism a^*M≅p^*M on H×Y, identity and cocycle compatibilities, whose differentiated H-action agrees with the infinitesimal action from D_Y. Both a and p are smooth of relative dimension dim H; a* and p* mean their abelian pullbacks Lf*=f†[−dim H]. Weak equivariance without this differentiated compatibility is insufficient.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. H is a smooth algebraic k-group acting on Y.

**Inputs.** SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality, SpringerResolutionAndCharacteristicCycles:D/differential-operators, SpringerResolutionAndCharacteristicCycles:H/regular-holonomic, tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation.

**Uses.** H, L and P: Moment-map support, induction from B to G and first-flag parabolic invariance.

**Construction or proof.**

1. Use smooth inverse image to formulate the descent isomorphism and impose the unit and multiplication diagrams.
2. Differentiate at the identity and require equality with the vector-field action on M.

**API.**

- **StrongEquivariance.cocycle** (structure): The isomorphism satisfies the identity and multiplication cocycles on H×H×Y.
- **StrongEquivariance.differential** (compatibility): The Lie(H)-action equals the action through its image in T_Y⊂D_Y.
- **StrongEquivariance.restrict** (functoriality): A subgroup H′⊂H gives a strongly H′-equivariant object.
- **StrongEquivariance.support** (relation): Ch(M) and CC(M) are invariant under the cotangent H-action.

**Checks and worked examples.**

- **StrongEquivariance.point**: On a point with connected H=G_m, only trivial algebraic H-representations give strongly equivariant D-modules; nonzero weights fail differentiated compatibility.
- **StrongEquivariance.trivialGroup**: For H={1}, the equivariant category is the original D-module category.
- **StrongEquivariance.function**: O_Y with its natural action and derivations is strongly H-equivariant.

**Source.** BHS19, §2.4, p. 321; proof of Lemma 2.4.8, p. 324: The equivariant categories and the parabolic extension use compatible infinitesimal actions. BB81, §3, p. 17: The subgroup action is algebraic and its differential must match the Lie action.

### moment-support-and-induction: Moment-map support and orbit classification

**Target.** For a strongly H-equivariant coherent D_Y-module M, Ch(M) lies in the zero fibre of the cotangent moment map μ_H:T*Y→Lie(H)*. Over an algebraically closed k, when H acts with finitely many orbits and geometrically connected stabilizers on Y, the strongly H-equivariant regular holonomic simple objects are exactly the intermediate extensions of trivial rank-one connections on individual orbits. For the diagonal G-action on F×F their reduced characteristic support lies in the signed Steinberg variety.

**Hypotheses.** k is a field of characteristic zero; Y is a smooth separated finite-type k-scheme of pure dimension n. All D-modules are left modules with quasi-coherent underlying O_Y-module; coherent means finite over D_Y, not necessarily finite over O_Y. H is smooth. The finite-orbit simple classification is asserted over an algebraically closed field with geometrically connected stabilizers; the moment-support inclusion needs neither restriction. General-field comparisons are the D-regular input.

**Inputs.** SpringerResolutionAndCharacteristicCycles:H/strong-equivariance, SpringerResolutionAndCharacteristicCycles:H/regular-holonomic, SpringerResolutionAndCharacteristicCycles:H/intermediate-extension, SpringerResolutionAndCharacteristicCycles:S/cotangent-identification, SpringerResolutionAndCharacteristicCycles:S/steinberg-components, SpringerResolutionAndCharacteristicCycles:F/flag-scheme, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory.

**Construction or proof.**

1. Choose an equivariant good filtration locally. Differentiated compatibility makes infinitesimal orbit vector fields act on gr M with zero principal symbol; hence their moment functions annihilate the support.
2. On a transitive orbit, strong equivariance identifies equivariant connections with representations of the stabilizer component group. Connected stabilizers give only trivial simples. Use intermediate extension and finite-length induction.
3. Apply the moment-map assertion to the diagonal G-action on F×F and use the signed conormal description of Z. The separate induction equivalence is constructed in L/equivariant-induction.

**Check.** For the diagonal action on P¹×P¹ there are exactly two orbits with connected stabilizers. Their trivial rank-one connections yield the two equivariant simples, whose characteristic supports are in the signed Steinberg variety.

**Source.** BHS19, §2.4, p. 321; proof of Theorem 2.4.7, p. 323: Finite-orbit induction identifies the two equivariant categories and their conormal supports. M23, Theorems 6.79 and 6.83, pp. 73–77; Theorem 7.33, p. 94: Simple holonomic extension and the stated regularity-stability input.

**Required input still to establish.** D-regular (exact boundaries below).

## Layer L: Beilinson–Bernstein localisation

Prove D-affinity of F for the ordinary sheaf D_F, identify its sections with the central reduction at the trivial infinitesimal character, and construct localisation with global-sections inverse. Restrict to the central-reduced principal category O and induce from B-equivariance on F to diagonal G-equivariance on F×F. This layer does not use the KL multiplicity theorem.

### flag-d-affinity: D-affinity of the flag variety

**Target.** In characteristic zero the ordinary sheaf D_F has Γ(F,D_F)≅U(g)⊗_(Z(U(g)),χ₀)k=:U_χ₀, where χ₀ is the infinitesimal character of the trivial representation. Every O-quasi-coherent D_F-module is generated by its global sections and has vanishing H^i(F,M) for i>0. In the BB parameter χ, ordinary D_F is χ=ρ, not χ=0; χ₀ denotes a central character, not this twisting parameter.

**Hypotheses.** char(k)=0; G is split connected reductive, F=G/B, χ₀ is the central character at highest weight 0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:F/flag-scheme, SpringerResolutionAndCharacteristicCycles:F/flag-geometry, SpringerResolutionAndCharacteristicCycles:D/differential-operators, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations, SchemeAndStackFoundations:SF.0.

**Construction or proof.**

1. The infinitesimal G-action gives U(g)→Γ(D_F); the Harish–Chandra character computes its central kernel. The filtered global-section calculation identifies the quotient with all global operators. The finite-dimensional modules chosen in the projection argument must integrate for the selected group characters; the Lie highest-weight classification alone does not supply this group-action comparison (BB-sections).
2. For D-affinity use ample weights, Serre vanishing, tensoring with finite-dimensional highest-weight modules and projection to the regular dominant central summand, as in the BB proof.
3. Keep the two rho normalizations explicit, including for groups where rho is not an integral character. The native coherent-sheaf Serre vanishing and filtered section calculation are recorded as missing supplier inputs.

**Check.** For SL₂, ordinary D_(P¹) uses BB parameter ρ and the Casimir central character of the trivial module. For a torus its global differential algebra after this central reduction is k.

**Source.** BHS19, §2.4, p. 321: Localisation at the trivial infinitesimal character uses the untwisted flag D-sheaf. BB81, §1, p. 15; §2, main theorem and proof, pp. 16–17: D-affinity for a dominant regular parameter and the rho shift identify the ordinary D-sheaf case.

**Required input still to establish.** BB-sections, AG-geometry, CategoryO-elementary (exact boundaries below).

### localisation-equivalence: Beilinson–Bernstein localisation

**Target.** Define Loc(M)=D_F⊗_(U_χ₀)M, with the tensor sheafified, for a U_χ₀-module M. The functors Loc and Γ(F,−) are mutually inverse exact equivalences between U_χ₀-modules and O-quasi-coherent D_F-modules. They restrict to finitely generated modules and coherent D_F-modules. This is localisation at a strict central reduction, not merely a generalized central character.

**Hypotheses.** The hypotheses and central-character conventions of L/flag-d-affinity hold.

**Inputs.** SpringerResolutionAndCharacteristicCycles:L/flag-d-affinity, SpringerResolutionAndCharacteristicCycles:D/differential-operators, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations.

**Uses.** K and P: Exact transport of the Verma/simple modules and their subgroup actions.

**Construction or proof.**

1. Use the global U_χ₀-action on D_F to construct the tensor functor. The natural unit and evaluation counit form an adjunction. For split reductive g, use the derived semisimple algebra and the prescribed scalar action of the centre; this extension of the semisimple upstream Verma/central-character interfaces is retained in CategoryO-elementary.
2. D-affinity makes Γ exact and conservative, while global generation makes the counit surjective. Apply the same argument to its kernel and to presentations by free modules to prove both unit and counit are isomorphisms.

**API.**

- **Localisation.tensor** (constructor): Loc(M) is the displayed sheaf tensor, with left D_F-action on the first factor.
- **Localisation.unit** (equivalence): M≅Γ(F,Loc(M)) naturally.
- **Localisation.counit** (equivalence): Loc(Γ(F,N))≅N naturally for quasi-coherent D_F-modules.
- **Localisation.exact** (structure): Loc and Γ preserve short exact sequences and identify the finite/coherent subcategories.

**Checks and worked examples.**

- **Localisation.torus**: For a torus F=point and U_χ₀=k, so localisation is the identity on vector spaces.
- **Localisation.trivial**: Loc of the trivial g-module is O_F with its standard D-action.
- **Localisation.generalizedCharacter**: For a torus with generator z, k[z]/z² has generalized character zero but is not a U_χ₀-module; extending the stated equivalence to it would fail.

**Source.** BHS19, §2.4, p. 321, displayed localisation equivalence: The exact localisation functor turns highest-weight modules into flag D-modules. BB81, §1, p. 15; §2, pp. 16–17: D-affinity gives tensor localisation with global-sections inverse.

**Required input still to establish.** CategoryO-elementary (exact boundaries below).

### equivariant-induction: Induction from one flag to two flags

**Target.** For a strongly B-equivariant regular holonomic D_F-module E, pull E to G×F and descend it along the free B-action (g,hB)·b=(gb,b⁻¹hB). This defines Ind(E) on G×ᴮF≅F×F, [g,hB]↦(gB,ghB), strongly equivariant for diagonal G. Use abelian smooth pullbacks Lf* in this descent; Ind is an exact equivalence. Its inverse is the noncharacteristic restriction Li* to the fibre i:{eB}×F→F×F, equivalently i†[N]. This restriction is exact on these equivariant objects.

**Hypotheses.** char(k)=0; G is split connected reductive with the fixed B and F=G/B.

**Inputs.** SpringerResolutionAndCharacteristicCycles:H/strong-equivariance, SpringerResolutionAndCharacteristicCycles:H/regular-holonomic, SpringerResolutionAndCharacteristicCycles:H/moment-support-and-induction, SpringerResolutionAndCharacteristicCycles:F/flag-scheme, SpringerResolutionAndCharacteristicCycles:S/cotangent-identification, SpringerResolutionAndCharacteristicCycles:H/finite-length-and-cycle-additivity.

**Uses.** L, K and P: The equivalence labelling Verma/simple cycles and transferring subgroup actions.

**Construction or proof.**

1. The B-equivariant cocycle is exactly the descent datum on G×F. Smooth descent supplies the D-module and its diagonal G-action.
2. Restriction to the base fibre recovers the original cocycle. Pullback to the torsor makes both unit and counit identities; descend these comparisons.
3. Use smooth characteristic-support comparison and the signed cotangent embedding to identify induced conormal supports. The regularity and descent comparison is the D-regular input.

**API.**

- **EquivariantInduction.torsor** (constructor): Pulling Ind(E) to G×F recovers the pullback of E on the second factor with its B-descent datum.
- **EquivariantInduction.inverse** (equivalence): Noncharacteristic restriction Li*=i†[N] to {eB}×F is an inverse equivalence.
- **EquivariantInduction.exact** (structure): Ind preserves short exact sequences and simple objects.
- **EquivariantInduction.characteristic** (compatibility): The induced characteristic support is obtained by the corresponding G×ᴮ construction and lies in the signed Steinberg variety.

**Checks and worked examples.**

- **EquivariantInduction.torus**: For a torus both flag spaces are points and Ind is the identity.
- **EquivariantInduction.function**: Ind(O_F)=O_(F×F), whose characteristic cycle is the zero section Z_(w₀).
- **EquivariantInduction.closedOrbit**: The delta module at eB on F induces to the direct image of O_F along the diagonal F→F×F, with characteristic cycle [Z_e]; it does not stay supported at one double flag.

**Source.** BHS19, Remark 2.4.3 and Proposition 2.4.4, pp. 321–322: The single-flag equivariant category induces to the diagonal double-flag category.

**Required input still to establish.** D-regular (exact boundaries below).

### principal-o-and-induction: Principal category O and equivariant localisation

**Target.** Let O_χ₀ consist of finitely generated U_χ₀-modules, t-semisimple with finite-dimensional weight spaces and locally finite b-action. Its weights lie in the integral principal block. Write M_w=M(ww₀·0)=M(−wρ−ρ), and L_w for its simple quotient. Localisation identifies O_χ₀ with strongly B-equivariant regular holonomic D_F-modules; the induction of L/equivariant-induction identifies the latter with strongly diagonal G-equivariant regular holonomic modules on F×F. The equivalence is exact and labels the simple for w by the orbit U_w.

**Hypotheses.** char(k)=0; central reduction is strict at χ₀; dot action is w·λ=w(λ+ρ)−ρ.

**Inputs.** SpringerResolutionAndCharacteristicCycles:L/localisation-equivalence, SpringerResolutionAndCharacteristicCycles:H/moment-support-and-induction, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, SpringerResolutionAndCharacteristicCycles:L/equivariant-induction.

**Construction or proof.**

1. Import the definition of the strict central-reduced principal category, its finite-length highest-weight classification and algebraic B-action from the elementary Category O supplier, without using KL multiplicities.
2. Use BB compatibility of localisation and algebraic subgroup actions to restrict the equivalence. Finite B-orbits give holonomicity; regularity and field descent require the recorded D-regular input.
3. Fix the labels using the ordinary D-sheaf and the weight −wρ−ρ, then induce to the double flag space. The labels are checked in rank one before any matrix is imported.

**Check.** For SL₂, M_e=M(−2ρ) is simple and M_s=M(0) has the two simple factors L_e and L_s, with L_s the trivial representation. Under double-flag induction L_e labels the diagonal and L_s the full flag-pair support.

**Source.** BHS19, §2.4, p. 321, conventions for O₀ and M_w,L_w; Theorem 2.4.7, pp. 322–323: The principal equivariant equivalence is the representation-theoretic input to the cycle bases. BB81, §3, p. 17: Compatible algebraic subgroup actions pass through localisation; the missing regularity proof is explicitly separated.

**Required input still to establish.** CategoryO-elementary, D-regular (exact boundaries below).

## Layer K: Verma and simple characteristic cycle bases

Identify [X̄_w] with the characteristic cycle of the localised Verma module. Prove positivity and Bruhat triangularity for simple cycles, import the KL multiplicity theorem only after localisation, and deduce all three integral bases and the corrected transition matrix.

### verma-cycle: The characteristic cycle of a Verma module

**Target.** With the preceding equivalence and induction understood, CC(M_w)=[X̄_w] in Z_(2N)(Z), for every w∈W. The right side is the scheme theoretic zero-fibre cycle with its generic multiplicities, not [Z_w].

**Hypotheses.** char(k)=0; M_w and all Weyl labels use the BHS conventions fixed in L.

**Inputs.** SpringerResolutionAndCharacteristicCycles:L/principal-o-and-induction, SpringerResolutionAndCharacteristicCycles:Y/cartan-zero-fibres, SpringerResolutionAndCharacteristicCycles:Y/zero-fibre-dimension, SpringerResolutionAndCharacteristicCycles:D/characteristic-cycle, SpringerResolutionAndCharacteristicCycles:C/bezrukavnikov-riche-input.

**Construction or proof.**

1. Compare BR coadjoint and BHS adjoint resolutions with the invariant form. BR labels its orbit by w⁻¹, so Proposition 2.14.2 evaluated on M_w has closure label w⁻¹ in BR and label w here.
2. BR proves the equality in top Borel–Moore homology using convolution kernels and the Weyl-group action. In top degree the fundamental classes of the components form a rational basis. The integral free component group injects, so equality of its images gives the integral cycle equality.
3. The convolution and top-homology comparison not back-chained to an accessible foundational proof is part of the precisely bounded BR-input gap.
4. For arbitrary characteristic-zero k, spread the finite presentation data to a finitely generated Q-algebra, compare on a complex fibre, and descend the component-coefficient equality by faithful field extension and generic-length compatibility. The exact cycle/base-field comparison remains in BR-input.

**Check.** For SL₂ the Verma M_s has cycle [Z_e]+[Z_s], whereas its simple quotient L_s has cycle [Z_s]. This separates the scheme zero fibre from the single conormal component.

**Source.** BHS19, Proposition 2.4.6, p. 322: The Verma cycle is the Cartan zero fibre of the corresponding incidence component. BR12, §1.1, pp. 538–539; Proposition 2.14.2 and proof, pp. 574–575: The coadjoint inverse-index formula, transported through the top-homology cycle map.

**Required input still to establish.** BR-input (exact boundaries below).

### simple-cycle-triangularity: Triangularity of simple characteristic cycles

**Target.** Write ℒ_w=CC(L_w)=Σ_v a_(w,v)[Z_v]. Then a_(w,v)∈N, a_(w,w)=1, and a_(w,v)=0 unless v≤w. If v<w and Ū_w is smooth at every point of U_v, then a_(w,v)=0. These conclusions do not say that ℒ_w is irreducible.

**Hypotheses.** char(k)=0; regular strong-equivariant simple modules are identified as in L.

**Inputs.** SpringerResolutionAndCharacteristicCycles:L/principal-o-and-induction, SpringerResolutionAndCharacteristicCycles:H/moment-support-and-induction, SpringerResolutionAndCharacteristicCycles:H/intermediate-extension, SpringerResolutionAndCharacteristicCycles:D/characteristic-cycle, SpringerResolutionAndCharacteristicCycles:S/steinberg-components, SpringerResolutionAndCharacteristicCycles:F/orbit-geometry.

**Construction or proof.**

1. The simple object is the intermediate extension of the trivial connection on U_w, so its support is Ū_w and its generic rank on that orbit is one.
2. Conormal support and generic lengths give nonnegative coefficients, Bruhat support and diagonal coefficient one. If the closure is smooth near U_v, its simple extension is a rank-one smooth connection there; the conormal of a smaller stratum cannot occur.

**Check.** For SL₂ both orbit closures are smooth, so ℒ_e=[Z_e] and ℒ_s=[Z_s]; the off-diagonal simple coefficient vanishes even though the corresponding Verma coefficient does not.

**Source.** BHS19, Theorem 2.4.7(iii), pp. 322–323: The simple cycles form a positive unitriangular change from conormal component cycles.

### kl-transition: Kazhdan–Lusztig multiplicity input

**Target.** For w,v∈W put m_(w,v)=[M(ww₀·0):L(vw₀·0)]. The imported KL theorem gives m_(w,v)=P_(w₀w,w₀v)(1), so m_(w,w)=1 and m_(w,v)=0 unless v≤w. Consequently [X̄_w]=Σ_(v≤w)m_(w,v)ℒ_v. Both occurrences of w₀ in the polynomial indices are required.

**Hypotheses.** char(k)=0; principal-block KL multiplicity theorem is supplied with the explicitly stated indexing.

**Inputs.** SpringerResolutionAndCharacteristicCycles:K/verma-cycle, SpringerResolutionAndCharacteristicCycles:K/simple-cycle-triangularity, SpringerResolutionAndCharacteristicCycles:L/principal-o-and-induction, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, SpringerResolutionAndCharacteristicCycles:H/finite-length-and-cycle-additivity.

**Construction or proof.**

1. Import the KL composition-multiplicity theorem in the fixed highest-weight convention from the Category O supplier, then convert indices using (ww₀)⁻¹=w₀w⁻¹ and the standard inversion identity for KL polynomials as needed.
2. Apply the exact localisation equivalence and additivity of characteristic cycles to a composition series of M_w. Use the independently proved Verma-cycle theorem. No KL fact is used to construct localisation itself.

**Check.** For W={e,s}, m_(s,e)=1, m_(e,s)=0 and both diagonal entries are 1. The unprefixed P_(w,v)(1) reverses this support test.

**Source.** BHS19, Theorem 2.4.7(ii) and its proof, p. 323, proof index corrected as E3: Composition multiplicities give the transition from zero-fibre cycles to simple cycles.

**Required input still to establish.** CategoryO-KL (exact boundaries below).

### three-bases: The three integral cycle bases

**Target.** The three families ([Z_w])_(w∈W), (ℒ_w)_(w∈W), and ([X̄_w])_(w∈W) are Z-bases of Z_(2N)(Z). The simple-to-component matrix is A=(a_(w,v)); the zero-fibre-to-simple matrix is M=(m_(w,v)); each is lower unitriangular in any linear extension of Bruhat order. In particular all changes are integral, not just rational.

**Hypotheses.** char(k)=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:Y/top-cycle-group, SpringerResolutionAndCharacteristicCycles:S/steinberg-components, SpringerResolutionAndCharacteristicCycles:K/simple-cycle-triangularity, SpringerResolutionAndCharacteristicCycles:K/kl-transition.

**Construction or proof.**

1. The component family is the defining free basis.
2. Choose a linear extension of the finite Bruhat poset. Each of A and M is identity plus a strictly triangular nilpotent integer matrix; its inverse is the finite alternating sum of powers of the nilpotent part.
3. Transport the free basis successively. For W of order two both A and M have diagonal entries one, which also checks the orientation of the transition formula.

**Check.** For SL₂ the component and simple bases coincide, while the zero-fibre basis is [Z_e], [Z_e]+[Z_s]. The transition has integral determinant 1 and inverse with one negative off-diagonal entry.

**Source.** BHS19, Theorem 2.4.7(i)–(iii), pp. 322–323: Unitriangular transition matrices give all three integral bases.

## Layer P: Parabolic invariance of simple cycles

Define P_w by dominance of ww₀·0 on its standard Levi, import the extension of the highest-weight module action, and prove invariance of its simple characteristic cycle under the first-flag action in the ambient incidence space. Identify which individual component cycles it fixes.

### dominant-parabolic: The parabolic attached to a simple module

**Target.** For λ_w=ww₀·0=−wρ−ρ define I_w={α simple positive:⟨λ_w,α∨⟩≥0}, and P_w the standard parabolic generated by B and the negative root subgroups for I_w. It is the largest standard parabolic whose Levi has λ_w dominant. The highest-weight action on L_w extends to an algebraic P_w-action compatible with the Lie action.

**Hypotheses.** char(k)=0; the weights are integral and use the fixed dot action.

**Inputs.** tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ, tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles, SpringerResolutionAndCharacteristicCycles:L/principal-o-and-induction.

**Uses.** P: The action extending that of B is transported to the simple cycle.

**Construction or proof.**

1. Use the simple-root inequalities to define I_w and the existing standard parabolic construction.
2. Import the highest-weight integrability criterion: the negative simple-root operator is locally nilpotent exactly for α∈I_w. Together with the B-action it integrates to P_w; compatibility on root subgroups gives uniqueness. This extension is included in CategoryO-elementary.

**API.**

- **DominantParabolic.simpleRoots** (characterisation): The Levi simple roots are exactly those with ⟨−wρ−ρ,α∨⟩≥0.
- **DominantParabolic.maximal** (universal-property): A standard parabolic P_I has dominant λ_w on its Levi iff I⊂I_w.
- **DominantParabolic.action** (structure): L_w has a compatible algebraic P_w-action extending its B-action.
- **DominantParabolic.convention** (compatibility): P_w contains the fixed B, using negative root groups for the chosen Levi roots.

**Checks and worked examples.**

- **DominantParabolic.sl2AntiDominant**: For SL₂ and w=e, λ=−2ρ, so I_e=∅ and P_e=B.
- **DominantParabolic.sl2Trivial**: For SL₂ and w=s=w₀, λ=0, so P_s=G.
- **DominantParabolic.torus**: For a torus there are no simple roots and P_e=B=G.

**Source.** BHS19, Lemma 2.4.8 and preceding paragraph, p. 324: Dominance on the Levi specifies the subgroup acting on the simple object.

**Required input still to establish.** CategoryO-elementary (exact boundaries below).

### parabolic-cycle-invariance: Parabolic invariance of simple cycles

**Target.** The cycle ℒ_w, viewed in the ambient F×F×g via Z, is invariant under p·(F₁,F₂,ψ)=(pF₁,F₂,ψ) for p∈P_w. Every component Z_v with a_(w,v)>0 is individually P_w-stable for this ambient action. This action need not preserve all of Z.

**Hypotheses.** char(k)=0; ℒ_w is the positive cycle of the simple with highest weight ww₀·0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:P/dominant-parabolic, SpringerResolutionAndCharacteristicCycles:K/simple-cycle-triangularity, SpringerResolutionAndCharacteristicCycles:H/strong-equivariance, SpringerResolutionAndCharacteristicCycles:H/moment-support-and-induction, SpringerResolutionAndCharacteristicCycles:S/cotangent-identification.

**Construction or proof.**

1. The extended P_w-action on L_w makes the localised object strongly P_w-equivariant before induction. Its induced cycle is invariant under the second-flag action with simultaneous Ad action on ψ.
2. Compose with the inverse diagonal G-action to obtain the displayed first-flag-only invariance. Use the signed Springer cotangent identification, correcting E4.
3. An automorphism preserving a positive cycle permutes its finite support components with multiplicities. Connectedness of P_w makes this permutation constant, hence each positive-support component is fixed.

**Check.** For SL₂, P_s=G preserves Z_s=P¹×P¹×{0} under the first-flag action, while this action does not preserve Z_e or all Z. The theorem concerns only components occurring in ℒ_s.

**Source.** BHS19, Lemma 2.4.8 and proof, p. 324: The parabolic acts on the first flag in the ambient space and preserves precisely the relevant simple-cycle support.

## Layer T: Cartan graphs and tangent spaces

Construct 𝒯=t×_(t/W)t and its components 𝒯_w, establish component detection after completion at closed points, and prove the zero-operator tangent-space upper bound and its smoothness criterion. No conjectural equality is assumed.

### cartan-fibre-product: The Cartan fibre product and its graphs

**Target.** Define 𝒯=t×_(t/W)t as a scheme. For w∈W let 𝒯_w be the graph {(z,w⁻¹z):z∈t}, with its reduced closed graph structure. The pair (κ₁,κ₂) defines κ:X→𝒯, and its restriction κ_w:X_w→𝒯_w is surjective. Graph labels use w⁻¹, consistently with the incidence relation.

**Hypotheses.** char(k)=0.

**Inputs.** SpringerResolutionAndCharacteristicCycles:S/chevalley-restriction, SpringerResolutionAndCharacteristicCycles:N/cartan-relation, SpringerResolutionAndCharacteristicCycles:C/cartan-fibre-dimensions, mathlib:CategoryTheory.Limits.pullback.

**Uses.** T and E: Detection of formal component labels and the fixed-space tangent restriction.

**Construction or proof.**

1. Factor (κ₁,κ₂) through the common invariant-polynomial quotient.
2. Use the graph closed immersion and the established relation on X_w. The first graph projection is an isomorphism with t, and κ₁,w is surjective.

**API.**

- **CartanFibreProduct.lift** (universal-property): Two toral maps with equal quotient map lift uniquely to 𝒯.
- **CartanGraph.first** (equivalence): The first projection 𝒯_w→t is an isomorphism with inverse z↦(z,w⁻¹z).
- **CartanGraph.factor** (compatibility): κ|_(X_w) factors through 𝒯_w and is surjective.
- **CartanGraph.second** (projection): The second projection of the graph is w⁻¹ applied to its first.

**Checks and worked examples.**

- **CartanGraph.rankOne**: For SL₂, 𝒯=Spec k[x,y]/(x²−y²), with graphs y=x and y=−x.
- **CartanGraph.torus**: For a torus the quotient is t itself and 𝒯 is only the diagonal t.
- **CartanGraph.nonInvolution**: For the A₂ Weyl group and a 3-cycle w, the point (z,w⁻¹z) belongs to graph w; replacing w⁻¹ by w changes its graph at a generic z.

**Source.** BHS19, Beginning of §2.5 and Lemma 2.5.1, pp. 324–325: The Cartan fibre product records the Weyl-labelled image of each incidence component.

### cartan-graph-components: The components of the Cartan fibre product

**Target.** The irreducible components of 𝒯 are the distinct smooth graphs 𝒯_w≅t. In characteristic zero 𝒯 is reduced and equidimensional of dimension r. The graphs may meet; no disjoint-union assertion is made.

**Hypotheses.** char(k)=0; Chevalley invariant-polynomial theorem is available.

**Inputs.** SpringerResolutionAndCharacteristicCycles:T/cartan-fibre-product, SpringerResolutionAndCharacteristicCycles:S/chevalley-restriction, tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory, DeformationAndDerivedPatchingAlgebra:R03.3/serre-conditions.

**Construction or proof.**

1. The finite quotient t→t/W separates W-orbits of geometric points, so the support is the union of the graphs. Generic points away from the reflecting hyperplanes distinguish them.
2. Polynomial invariants give 𝒯 as r equations in smooth t×t with expected codimension r. It is therefore CM, and it is generically étale over t. CM plus generic reducedness gives reducedness.

**Check.** In rank one the ring is k[x,y]/(x²−y²): its two reduced graphs intersect at zero. In the torus case there is only the diagonal graph.

**Source.** BHS19, Lemma 2.5.1, p. 325: The graph components of the Cartan fibre product are reduced and individually smooth.

**Required input still to establish.** AG-geometry (exact boundaries below).

### formal-component-detection: Detection of components after completion

**Target.** Let x be a closed point of X_w, and y=κ(x)∈𝒯_w. The map of completed local schemes (X_w)^∧_x→𝒯^∧_y factors through (𝒯_(w′))^∧_y if and only if w′=w. When y∉𝒯_(w′), that closed subscheme has empty completion and cannot contain the nonempty source. The generic point used in the proof lies on 𝒯_w, not on X.

**Hypotheses.** char(k)=0; x is closed and belongs to X_w.

**Inputs.** SpringerResolutionAndCharacteristicCycles:N/normal-components, SpringerResolutionAndCharacteristicCycles:T/cartan-fibre-product, SpringerResolutionAndCharacteristicCycles:T/cartan-graph-components, DeformationAndDerivedPatchingAlgebra:R03.1/flat-completion-and-finite-module-comparison, DeformationAndDerivedPatchingAlgebra:R03.3/cm-completion-and-equidimensionality, SchemeAndStackFoundations:SF.0, SpringerResolutionAndCharacteristicCycles:C/cartan-flatness.

**Construction or proof.**

1. Normality and excellence make the completion of the local ring of X_w normal and integral. Its map to the smooth graph is induced by the flat surjective Cartan map, and remains schematically dominant after completion.
2. If it factored through a distinct graph, that dominance would put all of 𝒯_w in its intersection with 𝒯_(w′), contradicting distinct graph generic points. Faithful flatness of local completion preserves the nonempty dense image.
3. Record separately the standard excellent-normal-completion and completion-flatness comparisons; their native scheme application lies in AG-geometry.

**Check.** At the SL₂ zero operator both Cartan graphs meet, but the completed local map of a fixed X_w still detects its one graph label. Set-theoretic membership of the closed point in both graphs is insufficient.

**Source.** BHS19, Lemma 2.5.2, pp. 325–326, generic-point misprint corrected as E2: Completion retains the Weyl label of a normal incidence component.

**Required input still to establish.** AG-geometry (exact boundaries below).

### tangent-space-bound: The tangent-space upper bound

**Target.** Let x=(F₁,F₂,0) be a closed point of X_w∩V_v, and let πx∈U_v. Then dim_(k(x)) T_(X_w),x ≤ dim T_(Ū_w),πx + dim ker(wv⁻¹−id_t) + ℓ(vw₀). All dimensions are over the common residue field after base extension. The hypothesis ψ=0 is essential to the splitting used here.

**Hypotheses.** char(k)=0; x=(F₁,F₂,0) is a closed point in X_w∩V_v.

**Inputs.** SpringerResolutionAndCharacteristicCycles:I/component-closures, SpringerResolutionAndCharacteristicCycles:I/bruhat-support, SpringerResolutionAndCharacteristicCycles:N/cartan-relation, SpringerResolutionAndCharacteristicCycles:N/smooth-stratum-fibres, SpringerResolutionAndCharacteristicCycles:F/orbit-geometry, mathlib:LinearMap.ker, mathlib:Module.finrank.

**Construction or proof.**

1. Use the differential of π and bound its image by T_(Ū_w),πx. At zero operator, the tangent in the operator direction splits as t⊕(u∩Ad(v)u).
2. The two Cartan relations on the component and the stratum put the toral tangent in ker(wv⁻¹−id). The remaining nilpotent intersection has dimension N−ℓ(v)=ℓ(vw₀).
3. Add the image and kernel bounds. No conjectural description of X_w∩V_v, or equality of tangent dimensions, is used.

**Check.** For SL₂ at a zero-operator diagonal flag pair, (w,v)=(e,e) gives 1+1+1=3, while (s,e) gives 2+0+1=3. The two different fixed-space terms are necessary for the same dimension bound.

**Source.** BHS19, Proposition 2.5.3, pp. 326–327: The tangent bound separates flag tangents, the fixed toral subspace and the nilpotent intersection.

### smoothness-criterion: Smoothness from the tangent bound

**Target.** With x and v as in the tangent bound, assume Ū_w is smooth at πx and codim_t ker(wv⁻¹−id)=ℓ(w)−ℓ(v). Then X_w is smooth at x. This is a sufficient criterion; no converse is asserted.

**Hypotheses.** The hypotheses of T/tangent-space-bound and the two displayed additional conditions hold.

**Inputs.** SpringerResolutionAndCharacteristicCycles:T/tangent-space-bound, SpringerResolutionAndCharacteristicCycles:F/flag-geometry, SpringerResolutionAndCharacteristicCycles:F/orbit-geometry, SpringerResolutionAndCharacteristicCycles:I/stratum-bundle, SchemeAndStackFoundations:SF.0.

**Construction or proof.**

1. Smoothness of the orbit closure makes its tangent dimension N+ℓ(w). Substitute the fixed-space codimension into the bound to obtain D=r+2N.
2. The local dimension of X_w at a closed point is D. Equality of tangent dimension with local dimension gives regularity, and over the perfect characteristic-zero field this is smoothness.

**Check.** For SL₂ with w=s and v=e the orbit closure is all P¹×P¹ and the toral fixed-space codimension is 1=ℓ(s)−ℓ(e); the criterion gives smoothness of X_s at the zero-operator diagonal point.

**Source.** BHS19, Proposition 2.5.3(ii), p. 327: The numerical fixed-space condition makes the upper bound equal the known component dimension.

**Required input still to establish.** AG-geometry (exact boundaries below).

## Layer E: Completed cycle identities

Construct the map on top cycles induced by completion at a closed point using excellent reduced local rings, allowing component splitting. Prove the generic-length base-change formula, define the completed simple cycles and prove the completed KL cycle identity.

### completion-cycle-map: Completion of top cycles at a point

**Target.** For an excellent reduced pure d-dimensional finite-type k-scheme Y and a closed point x, put A=O_Y,x and Â its maximal-ideal completion. Define c_x:Z_d(Y)→Z_d(Spec Â) by c_x([C])=[Spec(Â/I_CÂ)] if x∈C and by zero otherwise. A completed component can split into several components; its cycle is the sum of all of them with their scheme multiplicities. Excellence makes the completed reduced component reduced.

**Hypotheses.** Y is excellent, reduced, pure d-dimensional and finite type over k; x is closed.

**Inputs.** SpringerResolutionAndCharacteristicCycles:Y/top-cycle-group, SpringerResolutionAndCharacteristicCycles:Y/module-cycle, DeformationAndDerivedPatchingAlgebra:R03.1/flat-completion-and-finite-module-comparison, DeformationAndDerivedPatchingAlgebra:R03.3/cm-completion-and-equidimensionality, SchemeAndStackFoundations:SF.0, mathlib:AdicCompletion, mathlib:Finsupp.linearCombination.

**Uses.** E: Completed coherent-module and KL identities.

**Construction or proof.**

1. Localize the prime ideal of C at x and complete its quotient. Completion commutes with finite quotients.
2. Excellence makes the reduced quotient analytically unramified, and the finite-type dimension formula gives pure dimension d. Expand its fundamental cycle in its possibly multiple minimal primes.
3. Extend the component assignment by the universal property of the free abelian cycle group.

**API.**

- **CompletedCycle.component** (simp): c_x([C])=[Spec(Â/I_CÂ)] for x∈C.
- **CompletedCycle.missing** (simp): A component missing x has image zero.
- **CompletedCycle.add** (structure): c_x is an additive group homomorphism.
- **CompletedCycle.branches** (compatibility): If C is reduced and has b formal branches at x, its completed cycle is the sum of their b distinct fundamental cycles.

**Checks and worked examples.**

- **CompletedCycle.smoothLine**: For A¹ at zero, c₀([A¹])=[Spec k[[t]]].
- **CompletedCycle.nodalBranches**: For the irreducible curve y²=x²(1+x) over a characteristic-zero algebraically closed field, completion at (0,0) has two reduced branches; its one global component maps to their sum.
- **CompletedCycle.missingAxis**: For V(xy) at the point (1,0), only the component y=0 contributes; the component x=0 contributes zero.

**Source.** BHS19, §2.5, p. 327; proof of Lemma 2.5.5, pp. 327–328: Top cycles have a completion map which retains all formal branches.

**Required input still to establish.** AG-geometry (exact boundaries below).

### module-completion-formula: Generic-length cycles under completion

**Target.** Let M be coherent on X̄, and x a closed point of X̄. In Z_(2N)(Spec Ô_(X̄),x) one has [M̂_x]=Σ_v m(Z_v,M)[Spec Ô_(Z_v),x], with the term defined as zero if x∉Z_v. Each completed Z_v is reduced and equidimensional of dimension 2N, but may be reducible. The formula also applies to coherent modules supported on X̄_w.

**Hypotheses.** char(k)=0; x is closed in X̄ and M is coherent.

**Inputs.** SpringerResolutionAndCharacteristicCycles:E/completion-cycle-map, SpringerResolutionAndCharacteristicCycles:Y/module-cycle, SpringerResolutionAndCharacteristicCycles:Y/zero-fibre-dimension, SpringerResolutionAndCharacteristicCycles:S/steinberg-components, DeformationAndDerivedPatchingAlgebra:R03.1/flat-completion-and-finite-module-comparison, DeformationAndDerivedPatchingAlgebra:R03.3/cm-completion-and-equidimensionality.

**Construction or proof.**

1. Take a prime filtration of the finite local module. Terms of smaller support dimension have no top-cycle contribution before or after completion.
2. For each top prime, the number of occurrences is its generic module length. Flat completion preserves the exact filtration and replaces the prime quotient by its completed structure module.
3. Excellence gives reducedness and equidimensionality for each completed reduced component. This controls branch multiplicities without assuming normality of Z_v.

**Check.** For a point and a two-dimensional module, completion leaves cycle coefficient 2. For the irreducible nodal curve in CompletedCycle.nodalBranches, completion must preserve the sum of both formal branches rather than one chosen branch.

**Source.** BHS19, Lemma 2.5.5, pp. 327–328: Prime filtrations and flat completion preserve the generic-length component expansion.

**Required input still to establish.** AG-geometry (exact boundaries below).

### completed-simple-cycles: The completed simple cycles

**Target.** For x a closed point of X̄, define ℒ̂_(w,x)=Σ_v a_(w,v)[Spec Ô_(Z_v),x] in the completed top-cycle group, with a missing-component term zero. This is c_x(ℒ_w); it is not a claim to complete the localised D-module itself. The same definition is used in the common reduced support cycle group of X̄.

**Hypotheses.** char(k)=0; x is closed in X̄.

**Inputs.** SpringerResolutionAndCharacteristicCycles:E/completion-cycle-map, SpringerResolutionAndCharacteristicCycles:K/simple-cycle-triangularity, SpringerResolutionAndCharacteristicCycles:E/module-completion-formula.

**Uses.** E: The completed KL identity at closed points used by local-model applications.

**Construction or proof.**

1. Use the previously fixed integral simple-cycle coefficients and the additive completion map.
2. Identify cycle groups across a nilpotent thickening by their integral component bases; retain structure-sheaf multiplicities when forming module cycles.

**API.**

- **CompletedSimpleCycle.expansion** (characterisation): The displayed sum uses the same a_(w,v) as the uncompleted simple cycle.
- **CompletedSimpleCycle.completion** (compatibility): ℒ̂_(w,x)=c_x(ℒ_w).
- **CompletedSimpleCycle.positive** (structure): Every formal-branch coefficient is nonnegative.
- **CompletedSimpleCycle.support** (relation): It vanishes if x lies on none of the Z_v with a_(w,v)>0.

**Checks and worked examples.**

- **CompletedSimpleCycle.torus**: For a torus at its sole Steinberg point, ℒ̂_e=[Spec k].
- **CompletedSimpleCycle.sl2Identity**: For SL₂, ℒ_e=[Z_e], so ℒ̂_e is the completed diagonal Springer component, or zero off it.
- **CompletedSimpleCycle.sl2Longest**: For SL₂, ℒ_s=[Z_s]; at a point off Z_s its completion is zero even if the point lies on Z_e.

**Source.** BHS19, Definition following Lemma 2.5.5, p. 328: The formal simple cycles are explicit sums of completed Steinberg components.

### completed-kl-identity: The completed Kazhdan–Lusztig cycle identity

**Target.** For every w∈W and every closed point x of X̄, [Spec Ô_(X̄_w),x]=Σ_(v≤w)P_(w₀w,w₀v)(1)ℒ̂_(v,x), where the left side is zero when x∉X̄_w. The equality is in the common top-cycle group at x and preserves all generic multiplicities and formal branches.

**Hypotheses.** char(k)=0; x is a closed point of X̄.

**Inputs.** SpringerResolutionAndCharacteristicCycles:K/kl-transition, SpringerResolutionAndCharacteristicCycles:E/completed-simple-cycles, SpringerResolutionAndCharacteristicCycles:E/module-completion-formula, SpringerResolutionAndCharacteristicCycles:Y/cartan-zero-fibres.

**Construction or proof.**

1. Apply c_x to the uncompleted equality [X̄_w]=Σ_v m_(w,v)ℒ_v.
2. The module-completion formula identifies its left side with the fundamental cycle of the completed zero-fibre structure sheaf. The definition of ℒ̂ gives the right side.
3. Substitute the corrected KL coefficients. No claim that a completed nilpotent component is normal or irreducible is used.

**Check.** In SL₂ at a point on both Steinberg components, the completed zero-fibre cycle of X_s is ℒ̂_e+ℒ̂_s. Off one component its missing term is zero, with the same coefficients.

**Source.** BHS19, Corollary 2.5.6, p. 328: The completed cycle identity follows functorially from the uncompleted KL expansion.

## Supplier statements

- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation**: The Lie algebra and adjoint differential of a smooth affine group, root-space and Borel/nilradical inclusions, and compatibility of the adjoint action with subgroup maps and base change.
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components**: Representable parabolic fppf quotients G/B, their right B-torsor G→G/B, and descent along that torsor. The quotient is not the pointwise coset functor on arbitrary schemes.
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory**: Borel and maximal torus data, the Weyl group, root spaces and root subgroups, standard parabolic/Levi construction, Bruhat orbits and their closure order, and root/length criteria used for intersection dimensions. Upstream Layer 7 states Bruhat decomposition and BN-pairs; the precise Schubert closure-order statement and its root/length comparison remain a Lie-invariants extension, not a theorem confirmed there.
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon**: The central isogeny G_der^sc×Z(G)°→G and its root-datum kernel, with differential an isomorphism and flag schemes identified in char zero or p>h. The isogeny exists in Layer 8; the stated Lie comparison and characteristic bound must be checked.
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ**: Split Chevalley–Demazure group models over Z, compatible B,T and root subgroups, and base-change comparisons for their Borel/nilradical associated bundles over Z_(p). Layer 9 supplies the pinned group/root-subgroup model, while base change of the associated Lie bundles also needs the descent and total-space comparisons retained in VB-upstream.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ**: U(g), PBW, nonzero Verma M(λ), its unique simple quotient L(λ) and the highest-weight conventions for split reductive g, with the central summand acting by its chosen character. The existing Layer 3 Verma signatures assume a Killing-semisimple Lie algebra; extension to the split reductive algebra with fixed central action is required through CategoryO-elementary.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-4-the-classification-of-finite-dimensional-irreducibles**: Finite-dimensional highest-weight modules at dominant integral weights, tensor constructions and integration/integrability at the group level needed in the BB projection argument. Layer 4 supplies the Lie-module classification, not an integration theorem for arbitrary Lie weights; BB-sections retains the comparison for weights that are characters of G.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations**: Harish–Chandra projection and central characters χ_λ, χ_λ=χ_μ on the dot-action orbit, with the trivial infinitesimal character χ₀ and the rho-shift convention made explicit. Its stated signatures are semisimple; the central polynomial factor for split reductive g is part of the CategoryO-elementary extension.
- **SchemeAndStackFoundations:SF.0**: Native scheme morphisms and locally noetherian coherent sheaves, smooth/étale/proper base-change facts, expected-codimension regular-sequence and dimension formula applications, excellent finite-type schemes and completion comparisons, plus Serre vanishing on the projective flag schemes. The precise statements not yet supplied are retained in AG-geometry and BB-sections.

## Missing input boundaries

### AG-geometry: Native finite-type scheme geometry and completion comparisons

Supply native dimension, regular-sequence and fibre criteria, the open CM locus, generic reducedness of CM schemes, finite birational maps to normal schemes, excellent finite-type field schemes and reduced/equidimensional completed prime quotients. Also supply Serre vanishing and extension of coherent generating subsheaves on the projective flag schemes. General foundations belong to SchemeAndStackFoundations:SF.0; these exact statements have not all been found as nodes, so no closure is claimed.

Direct consumers: SpringerResolutionAndCharacteristicCycles:F/flag-geometry, SpringerResolutionAndCharacteristicCycles:F/constant-rank-intersection, SpringerResolutionAndCharacteristicCycles:G/resolution-properties, SpringerResolutionAndCharacteristicCycles:I/local-complete-intersection, SpringerResolutionAndCharacteristicCycles:I/reduced-incidence, SpringerResolutionAndCharacteristicCycles:I/birational-projections, SpringerResolutionAndCharacteristicCycles:C/cartan-fibre-dimensions, SpringerResolutionAndCharacteristicCycles:C/cartan-flatness, SpringerResolutionAndCharacteristicCycles:S/cotangent-identification, SpringerResolutionAndCharacteristicCycles:D/differential-operators, SpringerResolutionAndCharacteristicCycles:D/filtration-existence-comparison, SpringerResolutionAndCharacteristicCycles:L/flag-d-affinity, SpringerResolutionAndCharacteristicCycles:T/cartan-graph-components, SpringerResolutionAndCharacteristicCycles:T/formal-component-detection, SpringerResolutionAndCharacteristicCycles:T/smoothness-criterion, SpringerResolutionAndCharacteristicCycles:E/completion-cycle-map, SpringerResolutionAndCharacteristicCycles:E/module-completion-formula.

### VB-upstream: Register and import the current vector-bundle roadmap

AlgebraicVectorBundles on current TauCetiRoadmap main already owns sheaf symmetric algebras, relative Spec, duality and total spaces: L0B–L0C, L1A–L1B, L2A–L2B. Import totalSpace(E)=Spec Sym(E∨) and pullback; do not rebuild those carriers here. The current upstream statements do not give the required associated-bundle descent theorem: supply that precise extension and its integral-model base-change comparison. It is absent from this atlas snapshot, so supply the registration and check the precise descent theorem. Current Tau Ceti already has finite locally free sheaves and relative differentials, but not every geometric total-space construction.

Direct consumers: SpringerResolutionAndCharacteristicCycles:F/constant-rank-intersection, SpringerResolutionAndCharacteristicCycles:G/simultaneous-resolution, SpringerResolutionAndCharacteristicCycles:S/springer-resolution, SpringerResolutionAndCharacteristicCycles:S/cotangent-identification, SpringerResolutionAndCharacteristicCycles:D/differential-operators, SpringerResolutionAndCharacteristicCycles:D/filtered-pbw, SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality.

### Lie-invariants: Reductive Lie-algebra structure inputs

Check and supply the char(k)=0 or p>h Jordan and centralizer theory: regular-element Borels are finite, regular semisimple Borels form an étale W-torsor, the rank-one root-wall calculation, and invariant forms in this range. In characteristic zero also supply Chevalley restriction, polynomial Weyl invariants, reduced nilpotent quotient fibre, unique flags over regular nilpotents and the adjoint/cotangent comparison. ReductiveGroups Layers 2, 7 and 8 supply the underlying Lie, roots and isogenies, but not an audited theorem with all these conclusions; additions in that direction require a ReductiveGroups Part II extension. Also supply the precise Bruhat closure-order theorem beyond the current Layer 7 decomposition statement, and the invertibility bound for the central-isogeny differential and induced flag comparison used in C/cm-reductive-and-zero; an isogeny by itself supplies neither conclusion.

Direct consumers: SpringerResolutionAndCharacteristicCycles:G/regular-loci, SpringerResolutionAndCharacteristicCycles:G/resolution-properties, SpringerResolutionAndCharacteristicCycles:N/regular-root-wall, SpringerResolutionAndCharacteristicCycles:S/chevalley-restriction, SpringerResolutionAndCharacteristicCycles:S/springer-resolution, SpringerResolutionAndCharacteristicCycles:F/orbit-geometry, SpringerResolutionAndCharacteristicCycles:C/cm-reductive-and-zero.

### BR-input: Convolution inputs behind the BR theorems

BR Theorem 2.2.1 is read, including its §2.10 proof structure, and Proposition 2.14.2 is read. Their positive-characteristic localisation, kernel concentration, global generation, convolution geometry and top Borel–Moore component-class comparison and the arbitrary-characteristic-zero base-field descent of the cycle equality are not back-chained here to established native nodes. A proof pass must supply these inputs, or register the exact published CM/base-change and Verma-cycle statements as imported theorem boundaries; merely citing BR is not closure.

Direct consumers: SpringerResolutionAndCharacteristicCycles:C/bezrukavnikov-riche-input, SpringerResolutionAndCharacteristicCycles:C/cm-reductive-and-zero, SpringerResolutionAndCharacteristicCycles:K/verma-cycle.

### CM-spreading: Cohen–Macaulay spreading through the special fibre

Verify the detailed scaling/DVR argument in C/cm-reductive-and-zero and its hypotheses on the integral closure model. In particular prove the model is preserved by scaling, its scheme special fibre is BR’s component, the CM locus is open, and the scaled finite-extension generic point extends to the special fibre. Flatness plus one CM special fibre alone does not imply every generic point is CM without this additional argument.

Direct consumers: SpringerResolutionAndCharacteristicCycles:C/cm-reductive-and-zero.

### Steinberg-reduced: Reducedness of the raw Springer fibre product

The main cycle construction uses (𝒩̃×_𝒩𝒩̃)_red. To replace this by the raw scheme fibre product as suggested by the variety-level BHS display, prove its incidence ideal radical in characteristic zero, or identify the source’s display as a reduced-variety convention and restrict the comparison accordingly. This gap affects only S/raw-fibre-product-comparison, not the downstream cycle identities.

Direct consumers: SpringerResolutionAndCharacteristicCycles:S/raw-fibre-product-comparison.

### D-homological: Derived sheaf operations and filtered homological inputs

The native DerivedCategory carrier does not supply derived sheaf tensor/Hom/pushforward, transfer compatibility, holonomic duality or the Sato–Kashiwara filtration. Supply these exact key inputs for H/transfer-and-duality, Kashiwara and Bernstein. Mustață’s explicit transfer and inequality arguments were read; the full homological proof and functor stability through b-functions have not been audited. The not-cleared HTT book has not been used as a read source.

Direct consumers: SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality, SpringerResolutionAndCharacteristicCycles:H/kashiwara-equivalence, SpringerResolutionAndCharacteristicCycles:H/bernstein-inequality, SpringerResolutionAndCharacteristicCycles:H/intermediate-extension.

### D-regular: Regularity, equivariant descent and field comparison

Supply stability of regular holonomic modules under the smooth pullbacks and intermediate extensions actually used, the finite-orbit equivariant classification and the regularity restriction of BB. Mustață Theorem 7.33 states stability over C but sends its proof to HTT; the available BB scan lacks p. 18. Establish the characteristic-zero geometric regularity/base-field descent comparison separately. No Riemann–Hilbert theorem is assumed as a black-box definition.

Direct consumers: SpringerResolutionAndCharacteristicCycles:H/regular-holonomic, SpringerResolutionAndCharacteristicCycles:H/moment-support-and-induction, SpringerResolutionAndCharacteristicCycles:L/principal-o-and-induction, SpringerResolutionAndCharacteristicCycles:L/equivariant-induction.

### BB-sections: Global differential operators at the trivial central character

Finish the filtered-section computation Γ(D_F)=U(g)/ker χ₀, including the Harish–Chandra kernel and rho shift, in native sheaf terms. The BB pp. 16–17 theorem and proof were read, but the geometric section calculation used there is not currently a confirmed library theorem or requested node. Also supply integration of the finite-dimensional highest-weight modules selected by G-characters in the projection argument; do not infer integration for all integral Lie weights from LieHighestWeight Layer 4.

Direct consumers: SpringerResolutionAndCharacteristicCycles:L/flag-d-affinity.

### CategoryO-elementary: Register the elementary principal category O supplier

The existing paper route assigns algebraic category O, its strict central-reduced block, finite-length highest-weight classification, algebraic B-action and Levi integrability to LieHighestWeightPartIICompletedCategoryO. That proposed roadmap is not registered in this checkout, so there is no valid stage id to cite. Register its elementary layer before L/principal-o-and-induction and P/dominant-parabolic; it must not depend on this roadmap’s KL layer. Include the split reductive extension of the semisimple Verma and Harish–Chandra interfaces by a fixed central scalar character; the current upstream Layers 3 and 7 do not state this extension.

Direct consumers: SpringerResolutionAndCharacteristicCycles:L/principal-o-and-induction, SpringerResolutionAndCharacteristicCycles:P/dominant-parabolic, SpringerResolutionAndCharacteristicCycles:L/flag-d-affinity, SpringerResolutionAndCharacteristicCycles:L/localisation-equivalence.

### CategoryO-KL: Register the KL multiplicity supplier after localisation

LieHighestWeightPartIICompletedCategoryO must provide Weyl KL polynomials and [M(ww₀·0):L(vw₀·0)]=P_(w₀w,w₀v)(1) with the stated Bruhat order. Its KL theorem may consume this roadmap’s D/H/L layers, but its elementary O layer may not. Registration and a theorem-level dependency split are needed to avoid a cycle. No new KL polynomial definition is planned here.

Direct consumers: SpringerResolutionAndCharacteristicCycles:K/kl-transition.

## Landscape

The proposed equality describing X_w∩V_v by the corresponding fixed toral subspace is recorded as a conjecture in the 2019 paper. Only its proved inclusion is used here; no present-day status claim is made. Source: BHS19 Conjecture 2.3.7, p. 319.

The 2019 paper leaves CM and normality of individual Z_w open in its discussion. Those properties are not inferred from normality of X_w, and this roadmap makes no claim that the historical question is still open. Source: BHS19 Remark 2.4.2, p. 320.

The sources report counterexamples to irreducibility of simple characteristic cycles for SL_n with n≥8. This is landscape, not a theorem this roadmap builds; positivity and triangularity do not imply irreducibility. Source: BHS19 Remark 2.4.5, pp. 321–322; BR12 Remark 2.14.3, p. 575.

## Source corrections

### E1 — BHS19, Lemma 2.3.2, published p. 315

For arbitrary noetherian schemes, the printed global dimension and uniform equidimensional-fibre condition is asserted sufficient for flatness when the target is regular and the source CM. Use the local equality dim S=dim R+dim(S/m_RS), with R regular and S CM, before applying miracle flatness. The finite-type equidimensional schemes and irreducible Cartan target in this application yield the needed local equality. Let Y=Spec k ⊔ A¹ map to A¹ by the point 0 on the first component and the identity on the second. Y is CM, dim Y=dim A¹=1 and every fibre is equidimensional of dimension 0, but the isolated point is not flat over k[t].

Provenance: Already identified as PAPER-BREUIL-HELLMANN-SCHRAEN-19/E13 and independently confirmed in its recorded review; not an author correction. Correction search: Numdam version-of-record article and bibliography, https://numdam.org/articles/10.1007/s10240-019-00111-y/, checked 18 October 2026; no linked correction found. arXiv:1702.02192 submission history, checked 18 October 2026; only v1 is listed, not a subsequent corrected version. Benjamin Schraen’s publications page, https://math.univ-lyon1.fr/~schraen/, checked 18 October 2026; no erratum is attached to this article. Title searches for erratum and corrigendum on 18 October 2026; the eigenvariety paper’s erratum concerns a predecessor, not these §2 statements.

### E2 — BHS19, Proof of Lemma 2.5.2, published p. 326

The formal generic point for the Cartan graph is assigned membership in Spec Ô_X,x in the parenthetical declaration. Its ambient space is Spec Ô_𝒯,κ(x); the incidence component generic point belongs to the completed X. The next arrow in the proof maps the incidence generic point to the graph generic point; they cannot have the same declared ambient ring.

Provenance: Already recorded within PAPER-BREUIL-HELLMANN-SCHRAEN-19/E5; not an author correction. Correction search: Numdam version-of-record article and bibliography, https://numdam.org/articles/10.1007/s10240-019-00111-y/, checked 18 October 2026; no linked correction found. arXiv:1702.02192 submission history, checked 18 October 2026; only v1 is listed, not a subsequent corrected version. Benjamin Schraen’s publications page, https://math.univ-lyon1.fr/~schraen/, checked 18 October 2026; no erratum is attached to this article. Title searches for erratum and corrigendum on 18 October 2026; the eigenvariety paper’s erratum concerns a predecessor, not these §2 statements.

### E3 — BHS19, Proof of Theorem 2.4.7, published p. 323, paragraph deriving invertibility

The vanishing condition in the proof drops the two longest-element prefixes and says the unshifted KL coefficient vanishes unless v≤w. The triangular coefficient is P_(w₀w,w₀v)(1), which vanishes unless v≤w. The displayed formula in part (ii) already has the correct indices. In type A₁, P_(e,s)(1)=1 with s not ≤e, whereas P_(s,e)=0. The proof must use the prefixed indices.

Provenance: Already recorded as PAPER-BREUIL-HELLMANN-SCHRAEN-19/E6; not an author correction. Correction search: Numdam version-of-record article and bibliography, https://numdam.org/articles/10.1007/s10240-019-00111-y/, checked 18 October 2026; no linked correction found. arXiv:1702.02192 submission history, checked 18 October 2026; only v1 is listed, not a subsequent corrected version. Benjamin Schraen’s publications page, https://math.univ-lyon1.fr/~schraen/, checked 18 October 2026; no erratum is attached to this article. Title searches for erratum and corrigendum on 18 October 2026; the eigenvariety paper’s erratum concerns a predecessor, not these §2 statements.

### E4 — BHS19, Proof of Lemma 2.4.8, published p. 324, cotangent-product display

The display identifies T*(F×F) with a product of two Grothendieck resolutions g̃. Use a product of two Springer resolutions 𝒩̃≅T*F, with the signed embedding of Z given in S/cotangent-identification. The cotangent dimension is 4N, while dim(g̃×g̃)=2D=4N+2r. In the torus case the former is a point and the latter has dimension 2r. The published rendered page was checked to distinguish the two glyphs.

Provenance: new Correction search: Numdam version-of-record article and bibliography, https://numdam.org/articles/10.1007/s10240-019-00111-y/, checked 18 October 2026; no linked correction found. arXiv:1702.02192 submission history, checked 18 October 2026; only v1 is listed, not a subsequent corrected version. Benjamin Schraen’s publications page, https://math.univ-lyon1.fr/~schraen/, checked 18 October 2026; no erratum is attached to this article. Title searches for erratum and corrigendum on 18 October 2026; the eigenvariety paper’s erratum concerns a predecessor, not these §2 statements.

### E5 — G98, Definition 1.1.12, author notes p. 5

The multiplicity is described as the rank of the graded module after tensoring with the reduced irreducible component. Use the length of the graded module localized at the generic point of the component, as in Mustață Definition 6.40, p. 55. For D_A¹/D_A¹x² the graded module is k[x,ξ]/x². Its generic length along x=0 is 2, while tensoring with k[ξ] gives rank 1. The reduced-rank prescription loses the extension multiplicity.

Provenance: new Correction search: Author-hosted Ginzburg notes at https://math.berkeley.edu/~nadler/ginzburg.dmodules.pdf and Nadler’s page, checked 18 October 2026; no correction linked. Searches for Ginzburg D-modules Definition 1.1.12 and multiplicity length correction, 18 October 2026; no explicit erratum found. Compared the generic-length definition and additivity proof in Mustață, Definition 6.40 and Propositions 6.41–6.42, pp. 55–56.

### E6 — BHS19, Proof of Proposition 2.2.5, published p. 313

The vector-bundle dimension statement is cited under the label Lemma 2.2.1. The source result is Proposition 2.2.1. The result at that number is headed Proposition and supplies exactly the bundle rank used.

Provenance: Already recorded within PAPER-BREUIL-HELLMANN-SCHRAEN-19/E5; not an author correction. Correction search: Numdam version-of-record article and bibliography, https://numdam.org/articles/10.1007/s10240-019-00111-y/, checked 18 October 2026; no linked correction found. arXiv:1702.02192 submission history, checked 18 October 2026; only v1 is listed, not a subsequent corrected version. Benjamin Schraen’s publications page, https://math.univ-lyon1.fr/~schraen/, checked 18 October 2026; no erratum is attached to this article. Title searches for erratum and corrigendum on 18 October 2026; the eigenvariety paper’s erratum concerns a predecessor, not these §2 statements.

### E7 — M23, Theorem 2.11, preparatory paragraph on p. 3 and proof on p. 4, author notes

The preparatory paragraph assigns the easy monomial inclusion the direction F_pD⊂F′_pD; the proof introduction assigns the inductive inclusion the direction F′_pD⊂F_pD. Both directions are reversed. Products of coordinate derivations give F′_pD⊂F_pD on p. 3. The induction on p. 4 starts with an order-p operator and proves F_pD⊂F′_pD, completing equality. The multiplicative order bound puts each monomial in F_pD, while the inductive argument expands each P∈F_pD in monomials. The two printed announcements reverse these respective directions; the actual PBW argument is sound. Both rendered pages were checked independently.

Provenance: new Correction search: Author’s current lecture-note PDF at https://websites.umich.edu/~mmustata/DmodulesNotes.pdf, accessed 18 October 2026. Title and Theorem 2.11 searches for a correction, 18 October 2026; no separate erratum found.

### E8 — M23, Proof of Proposition 6.24, pp. 50–51

The first Tor group is indexed by 1 when it is identified with the quotient N/zN. That group is Tor₀, which vanishes because z acts surjectively on the closed-support direct image. The next Tor₁ is correctly the kernel of z and recovers N₀. The two-term free resolution of R/(z) identifies Tor₀ with the cokernel and Tor₁ with the kernel. The displayed index was also checked on the rendered page.

Provenance: new Correction search: Author’s current PDF at https://websites.umich.edu/~mmustata/DmodulesNotes.pdf and course homepage, accessed 18 October 2026; no correction linked. Targeted searches for the lecture-note title, Proposition 6.24 Tor and Theorem 5.5 correction, 18 October 2026; no separate erratum found.

### E9 — M23, Proof of Theorem 5.5, last paragraph, p. 36

The termwise double-dual evaluation is asserted an isomorphism for a bounded complex of arbitrary finitely generated modules. Retain the projectivity of the chosen finite generated terms, as already required immediately before the theorem. For R=k[x] and M=R/(x), Hom_R(M,R)=0, so the ordinary termwise double dual is zero. The finite projective resolution used by the actual derived argument repairs the omitted adjective. The rendered page was checked.

Provenance: new Correction search: Author’s current PDF at https://websites.umich.edu/~mmustata/DmodulesNotes.pdf and course homepage, accessed 18 October 2026; no correction linked. Targeted searches for the lecture-note title, Proposition 6.24 Tor and Theorem 5.5 correction, 18 October 2026; no separate erratum found.

### E10 — M23, Proof of Theorem 6.20, first display on p. 50

The left side applies the normal-coordinate operator to u, while the displayed product on the right is left unapplied. Apply the product of Euler operators on the right to u as well. The left side is a module element and the right side as printed is an operator. With D=∂_z z the identity is the product of D+i for 0≤i<m, applied to u; the subsequent annihilating-polynomial argument uses this version.

Provenance: new Correction search: Author’s current PDF at https://websites.umich.edu/~mmustata/DmodulesNotes.pdf and course homepage, accessed 18 October 2026; no correction linked. Targeted searches for the lecture-note title, Proposition 6.24 Tor and Theorem 5.5 correction, 18 October 2026; no separate erratum found.

### E11 — M23, Proof of proper coherence immediately before the duality definition, p. 62

The coherent sheaf R^q f_*E is described as an O_X-module. Its scalar sheaf is O_Y on the target of f:X→Y. The following tensor product is over O_Y and constructs a D_Y-module, so the target scheme is required.

Provenance: new Correction search: Author’s current PDF at https://websites.umich.edu/~mmustata/DmodulesNotes.pdf and course homepage, accessed 18 October 2026; no correction linked. Targeted searches for the lecture-note title, Proposition 6.24 Tor and Theorem 5.5 correction, 18 October 2026; no separate erratum found.

### E12 — BHS19, Proof of Proposition 2.3.3, p. 316, passage from the special fibre to the total integral model

The argument infers CM of the entire A-flat integral model from CM of its special fibre. First obtain CM near the special fibre. To reach every generic point, also use scaling stability and projectivity of the flag factors to specialize a scaled finite-extension generic point into that neighbourhood; the exact model checks are retained as CM-spreading. The general implication is insufficient: Spec A disjoint union Spec(Q[x,y]/(x²,xy)) over A=Z_(p) is flat of finite type with CM special fibre, but has a non-CM generic component. This does not refute the source’s geometric conclusion; it identifies the additional argument its model needs.

Provenance: new Correction search: Numdam version-of-record article and bibliography, https://numdam.org/articles/10.1007/s10240-019-00111-y/, checked 18 October 2026; no linked correction found. arXiv:1702.02192 submission history, checked 18 October 2026; only v1 is listed, not a subsequent corrected version. Benjamin Schraen’s publications page, https://math.univ-lyon1.fr/~schraen/, checked 18 October 2026; no erratum is attached to this article. Title searches for erratum and corrigendum on 18 October 2026; the eigenvariety paper’s erratum concerns a predecessor, not these §2 statements.

## Acceptance across the layers

For a torus all flags, nilpotent and Steinberg spaces are points, while X=t and κ_i=id. For SL₂, N=r=1, the incidence components have dimension 3, the Steinberg components have dimension 2, ℒ_e=[Z_e], ℒ_s=[Z_s], and [X̄_s]=[Z_s]+[Z_e]. These checks distinguish the Cartan zero-fibre cycle from a single reduced nilpotent component. The double delta module has multiplicity 2 on its cotangent fibre, distinguishing generic length from reduced rank. The nodal-curve check distinguishes one global component from two completed branches. The tangent bound is used only at ψ=0, and the parabolic action is used only in the ambient space with the first flag moving.
