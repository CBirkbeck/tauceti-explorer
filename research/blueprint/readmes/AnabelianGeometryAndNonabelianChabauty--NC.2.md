# Unipotent fundamental groups and realizations — NC.2

This part constructs the unipotent étale, algebraic de Rham and rigid fundamental groups of a pointed smooth curve, their tensor path schemes, and the realization structures on their finite objects. The [packet](../packets/AnabelianGeometryAndNonabelianChabauty--NC.2.json) gives the dependency graph. The [suggested file](../suggested/AnabelianGeometryAndNonabelianChabauty--NC.2.lean) gives native categorical and linear prototypes. Every geometric statement below is a specification, with its proof inputs identified; no implementation is claimed.

The only stage in scope is `AnabelianGeometryAndNonabelianChabauty:NC.2`. Its 30 targets comprise three definitions, ten constructions, twelve theorems and five comparisons. The stage is **planned**: its targets terminate in the pinned libraries, named suppliers or the two explicit gaps described below. The targets support the NC.3 nonabelian cohomology and NC.4 Albanese constructions without defining Selmer conditions, a nonabelian cohomology classification or the quotient Albanese map here. Rational endpoints belong to this part; a tangential isocrystal fibre needs a separate logarithmic endpoint construction.

## Scope, coefficient fields and ownership

For the algebraic realization, take a characteristic-zero field k and a smooth geometrically connected curve Y/k with b in Y(k). A finite connection means a finite locally free sheaf with integrable k-connection; horizontal sheaf maps are its morphisms. For the étale realization use the geometric curve Y over a separable closure, finite-rank lisse Q_p-sheaves and their continuous p-adic monodromy. The rational basepoint supplies descent identifications, rather than changing the geometric category into an arithmetic category.

For good reduction fix q=p^f, K_0=Frac W(F_q), a smooth proper relative curve Xcal over W(F_q), and a finite étale relative divisor Dcal, possibly empty. Put Ycal=Xcal minus Dcal. Endpoints are integral sections of Ycal. These assumptions permit the algebraic/overconvergent equivalence and Olsson's unit-specialized path comparison. A general ramified good-reduction model is outside the verified comparison input. A ramified extension of an established unramified pair is covered when the pair and the endpoints descend to it: D_cris has coefficients in K_0, while D_dR and the Hodge filtration extend to the ramified field.

The inputs have the following owners.

| Owner | Imported mathematical contract |
| --- | --- |
| `MotivesAndAlgebraicCycles:MC.3`, `MC.6` | Neutral Tannakian categories, reconstruction and the affine tensor-isomorphism torsor. NC.2 verifies the geometric unipotent instance. |
| `TauCetiRoadmap/AlgebraicVectorBundles`, L0 and L0A | Finite locally free sheaves, tensor/dual, exact fibre restriction and monoidal pullback. The catalogue bridge is requested at `SchemeAndStackFoundations:SF.0`. |
| `SchemeAndStackFoundations:SF.2` | Actual de Rham/Čech complexes, extension cohomology, affine coherent splitting and finite-dimensional curve H¹. |
| `InverseGaloisAndArithmeticFundamentalGroups:IG.0` | Rational local systems and continuous rational representations; finite étale covers remain its separate category. |
| `AnabelianGeometryAndNonabelianChabauty:NC.0/arithmetic-geometric-paths` | The arithmetic descent action on paths between rational endpoints. |
| `AnabelianGeometryAndNonabelianChabauty:NC.3/equivariant-topological-torsors` | The abstract equivariant torsor carrier; it supplies no scheme representability or period comparison. |
| `ColemanIntegration:L1` | Word/shuffle algebra, local iterated integrals and the scalar Coleman realization. |
| `PadicDifferentialEquationsAndRigidCohomology:RD.3`, `RD.4`, `RD.6` | Isocrystals, frames, rigid cohomology and H¹ weights. |
| `PadicHodgeTheory:R06.2`, `R06.5`; `CohomologyComparisons:CP.2`, `CP.3` | Exact tensor period functors, linear comparison and multiplicative enhanced cochain comparison. |
| `TauCetiRoadmap/ReductiveGroups`, Layer 5 | Characteristic-zero unipotent algebraic group/Lie equivalence, closed normal subgroups and algebraic quotients. |
| `TauCetiRoadmap/JacobianChallenge`, Layers B, E and F | Curve cohomology, the Jacobian, Abel–Jacobi and its Tate/de Rham realizations. |

These are imports or precise export requests, not duplicate targets. The packet gives the catalogue's full layer identifiers where its layer titles differ from these abbreviations. In particular, the algebraic unipotent group/Lie input belongs to ReductiveGroups; real Lie groups and smooth differential geometry do not provide it.

The fixed library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Its native short complexes, finite biproducts, full subcategories, monoidal natural transformations, automorphism groups, natural-transformation evaluation, derivations and enveloping algebra are used directly. `TauCeti.Tannaka.fgPointTensorIsoEquiv` reconstructs tensor points for a **supplied** commutative Hopf algebra. It does not construct the Hopf algebra of our geometric category. `TauCeti.SmoothUnipotentAffineGroupSchemeCat` supplies an existing category of finite-type unipotent schemes. Its presence does not supply the pro-geometric group or our path scheme. Similarly, `Subgroup.lowerCentralSeries` controls abstract indexing and cannot replace schematic closure or an fpqc quotient.

## Two finite towers and their conventions

A length-n object has n+1 possibly zero trivial graded layers. At n=0 it is a finite sum of units. The full length subcategory C_n retains all ambient morphisms and does not carry a chosen flag as data. The union over n is a tensor category; an individual C_n need not be tensor closed. Finite-rank objects have finite length, and the invariant-vector criterion quantifies over **nonzero** objects.

Let U=Aut^⊗(ω), let A be the completed enveloping/distribution algebra of its pronilpotent Lie algebra, and let I be the augmentation ideal. The word-length tower is A_n=A/I^(n+1). Its regular representation realizes the universal connection 𝒜_n, pointed by 1. For a second fibre ν, the whole finite path module is

M_n(ω,ν)=Nat(ω restricted to C_n,ν restricted to C_n) ≅ ν(𝒜_n).

An element of M_n may be zero and need not preserve tensor products or the unit. The tensor path scheme instead represents tensor **isomorphisms** of the full fibres, over every coefficient algebra. Its coordinate ring is the union of the dual finite path pieces. This distinction is needed to dualize the ind-crystalline theorem correctly.

The other tower uses closed schematic commutators: Γ_1U=U and Γ_(r+1)U=[U,Γ_rU]. Write U⟨n⟩=U/Γ_(n+1)U. Then U⟨0⟩ is trivial and U⟨1⟩ is the H¹-dual vector group. Kim's U_r=U/Z_r uses Z_1=U, so his U_(n+1) is our U⟨n⟩. The native abstract lowerCentralSeries starts at zero and matches Γ_(n+1) at native index n. A finite word-length algebra and a lower central group quotient have different dimensions and different universal properties.

The Hopf coproduct belongs to the completed algebra and to the direct-limit coordinate algebra. Its length compatibility is A_(r+s)→A_r tensor A_s. A_n generally has no quotient Hopf structure: for a primitive generator T at length one, T²=0 but the primitive formula for its coproduct square has the nonzero cross term 2T tensor T. The dual-number test in the suggested file enforces this boundary.

Functional multiplication applies the right factor first. A path p:b→x acts on the right by p·g=p after g; comp(q,p)=q after p. Native categorical composition writes the first arrow before the second. In universal affine coordinates this gives comp(f_2,f_1)=f_2 f_1. To see the order without imposing commutativity, right multiplication by f_1 is a horizontal **connection morphism**, and the natural transformation belonging to f_2 commutes with it. Its value on f_1 is therefore f_2 f_1. Natural-transformation components themselves are linear fibre maps, rather than horizontal maps from the universal connection to itself.

## The affine and proper universal objects

On a smooth affine curve choose represented H¹_dR classes ω_i, with dual generators T_i. The rank of the length-n connection is the sum of m^j for 0≤j≤n, with m=dim H¹_dR. The connection on truncated words is d minus the sum of left-prepending T_i times ω_i. Thus its length-one matrix sends the empty word to the negative generator term; the **horizontal transport** has the positive first-order term. Degree overflow is zero. Right multiplication is horizontal because it commutes with left-prepending; left multiplication by a noncentral word need not be horizontal.

The pointed property asks for one horizontal morphism for each vector in the fibre at b. A global section is not the input. Affine normal form removes exact connection coefficients by gauge transformations and identifies the universal connection with the finite regular module. Changing represented cohomology bases uses the unique pointed universal isomorphism, with an exact-form gauge correction when necessary.

For proper X, take an affine open containing b and then the maximal quotient extending without poles to X. Full faithfulness of restriction follows from a local pole calculation in the horizontal Hom connection: differentiation raises a nonzero pole order, whereas the regular connection matrix cannot cancel that leading term in characteristic zero. The proper grades are quotient tensor powers. For a genus-g proper curve the degree-two relation is governed by the cup product, so a free affine word object cannot be reused as the proper universal object.

The Hodge filtration is constructed on the proper or canonical logarithmic extension, with Griffiths transversality, the quotient tensor filtration on each kernel, and 1_b in F⁰. Strict filtered extension classes are computed by the degree-one hypercohomology of F⁰Hom→F⁻¹Hom tensor Ω¹(log D). Hadian's calculation controls an isomorphism class; universal pointed normalization removes its remaining automorphisms and fixes the filtration on the specified pointed universal bundle. An affine bundle alone admits many filtrations. Dualization annihilates F^(1−i), so a line of Hodge degree one has dual degree minus one.

## Frobenius, continuation and the comparison input

The rigid fibre at a special point is horizontal sections on its residue disc. Evaluating at any integral lift identifies this fibre with the de Rham fibre; the evaluation maps give local transport without a chosen coordinate. Pullback by p-Frobenius is semilinear in the coefficients. Its q-power is K_0-linear. The unique pointed isomorphism F*𝒜_n≅𝒜_n fixes the universal base pointer and determines the finite Frobenius operators. Changing lifts conjugates the operator by **both** endpoint transports. Frobenius preserves length; it need not preserve the Hodge filtration.

Global transport uses Besser's scheme Lang theorem. The H¹-dual has strictly negative weights, and every positive augmentation/Lie grade is a tensor-power quotient. Consequently φ−1 is invertible in every positive grade. Successive corrections solve g⁻¹φ(g)=h in the complete algebra; coproduct compatibility and uniqueness make the solution group-like. This constructs a scheme inverse over all coefficient algebras, not only a bijection of rational points. The Lang map need not be a homomorphism. Solving the associated torsor equation gives a unique Frobenius-fixed path; uniqueness gives rational descent, composition, pullback and agreement with local transport. A positive Frobenius power still satisfies the weight condition and selects the same path.

The local word coefficient formula is imported from Coleman L1. Its identification with geometric tensor paths is a separate NC.2 comparison. Across discs, the fixed Frobenius path supplies the global continuation. With the chosen word order, two-sided transport of v is I(x_0,x) v I(b,b_0). Source and target transports cannot be swapped.

The crystalline theorem first concerns the **coordinate algebra** of the étale tensor path scheme. Olsson's unit-specialized theorem makes it ind-crystalline, with finite Galois-stable crystalline subspaces. D_cris on this ind-object is interpreted through that filtered union of finite crystalline objects. Its coordinate comparison respects coactions, composition, Frobenius and the filtered de Rham realization. Only then does exact tensor duality give D_cris(M_n^et)≅M_n^rig and the finite de Rham path comparison. Being an iterated extension of crystalline representations does not alone prove a representation crystalline.

This theorem requires a pointed multiplicative cochain comparison, including the two endpoint augmentations. A linear H¹ comparison or a cup-product identity is insufficient to reconstruct the nonlinear path object. The exact open-pair enhancement and the audit of Olsson's schematic-homotopy engine form the first explicit gap below; the theorem is stated under its verified geometric hypotheses and its proof input is not silently assumed.

At central depth one, Abel–Jacobi identifies the proper étale group with the additive Tate module V_pJ and the de Rham group with H¹_dR(X) dual. F⁰ is the annihilator of holomorphic one-forms, and the quotient is Lie(J). The endpoint torsor becomes the rational Kummer torsor of [x−b], and linear periods are ordinary one-form integrals. For an open curve there are boundary directions and a generalized Jacobian. This statement imports the existing Jacobian and constructs only its unipotent realization comparison.

The finite-cover boundary is already visible on G_m: power maps are nontrivial finite étale covers, but its geometric unipotent group is the additive Tate line. The additive Q_p point group is divisible and has no nontrivial finite abstract quotient. Neither this rational point group nor the finite path vector space replaces the profinite cover classifier.

## Target declarations, proof inputs and acceptance

All node identifiers below have prefix `AnabelianGeometryAndNonabelianChabauty:NC.2/`. The names are those reserved in the suggested namespace. Each construction's APIs and discriminating tests form part of its specification. A source locator refers to the version listed in the bibliography, not to an uninspected edition.

### Unipotent length — `IsUnipotentLength`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/unipotent-length`; definition.

In a neutral Tannakian category C over a characteristic-zero field k, with unit 1, let C_n be the full subcategory of objects admitting a filtration E=E_0 ⊇ E_1 ⊇ … ⊇ E_(n+1)=0 with each E_i/E_(i+1) a finite direct sum of 1. Zero summands are allowed. Write IsUnipotentLength(n,E) for this property, and Un(C) for the full subcategory of objects satisfying it for some n. Thus C_0 consists of trivial objects, including zero. Filtrations witness a property; they are not extra data on the objects or extra restrictions on the full subcategory morphisms. Tensor products of lengths n and m have length at most n+m; C_n need not be tensor closed.

Hypotheses: C is k-linear, abelian, rigid symmetric monoidal, with End(1)=k and an exact faithful k-linear tensor fibre functor to finite-dimensional vector spaces.

Construction or proof:

1. Construct the filtration predicate using subobjects and finite biproducts. An equivalent recursion extends a length-n object by a trivial object.
2. Use exactness of tensor and the product filtration for tensor products; intersect and image filtrations for subobjects and quotients, and the dual filtration for duals. The union is an abelian rigid tensor subcategory.

Dependencies: `MotivesAndAlgebraicCycles:MC.3/tannakian-category`, `mathlib:CategoryTheory.ShortComplex.Exact`, `mathlib:CategoryTheory.Limits.biproduct`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`.

| API | Contract |
| --- | --- |
| `IsUnipotentLength.trivial` | Length zero is equivalent to being a finite direct sum of units. |
| `IsUnipotentLength.mono` | Length n implies length n+1 by inserting a zero graded layer. |
| `IsUnipotentLength.extension` | An extension of length n by a trivial object has length n+1. |
| `IsUnipotentLength.tensor` | Lengths n and m give tensor length at most n+m. |
| `UnipotentCategory` | The full subcategory selected by the existence of a finite unipotent length, with its inherited morphisms. |

Discriminating unit tests:

- `length_zero_object` (degenerate): Zero is of length zero.
- `length_unit_sum` (computation): A sum of two copies of the unit is of length zero.
- `length_nonsplit_extension` (non-example): For a nonsplit extension of unit by unit in a neutral unipotent category, the middle term has length one and does not have length zero.

Uses: BDMTV Appendix A, Lemmas A.3–A.4: Determines which objects the universal pointed object represents.; NC.3: Ensures finite path modules and central quotients use their own indices.

Acceptance: The zero object and every finite sum of units have length zero. A nontrivial extension of 1 by 1 has length one but not zero.

Sources: **bdmtv**, Appendix A.1, Definition A.1 and the paragraph before Definition A.2, pp. 934–935: Gives the unipotent subcategories and the length convention behind the universal objects; the terminal zero and zero object are made explicit.; **cls**, Propositions 2.3.2 and 2.3.5, pp. 93–95: Proves the subquotient/tensor/dual stability used for the geometric isocrystal instance.

### Invariant vectors and unipotence — `unipotent_invariant_criterion`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/invariant-vector-criterion`; theorem.

For a neutral Tannakian category C over a characteristic-zero field k, the following are equivalent: every object is a successive extension of units; its reconstructed affine group is pro-unipotent; every nonzero object E has a nonzero morphism 1→E. The zero object is excluded from the last quantifier. In each finite-dimensional representation, an invariant line and induction on dimension produce a full unipotent flag.

Hypotheses: Neutral Tannakian hypotheses of unipotent-length.

Construction or proof:

1. Apply neutral reconstruction, imported from MC.6, to pass between objects and finite-dimensional representations.
2. For a pro-unipotent group all nonzero representations have invariants. Conversely apply the invariant hypothesis repeatedly to quotients; the resulting flag realizes every finite tensor-generated image in upper triangular matrices with unit diagonal.
3. Finite tensor-generated images are unipotent; their inverse limit is pro-unipotent.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/unipotent-length`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.

Acceptance: In finite-dimensional vector spaces with their usual tensor product the reconstructed group is trivial and every nonzero object has a nonzero vector. The assertion with zero included fails, since Hom(1,0)=0.

Sources: **bdmtv**, Definition A.1, p. 934 (corrected E10): The equivalence motivates the definition; exclusion of zero repairs the invariant-vector wording.; **kim**, Section 1, pp. 97–100; Section 2, p. 114: The geometric categories are successive extensions of trivial objects and reconstruct pro-unipotent groups.

### Geometric unipotent categories — `UnipotentRealizations`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/realization-categories`; construction.

For a smooth geometrically connected characteristic-zero curve Y/k with b∈Y(k), define C_dR(Y) as the unipotent full subcategory of finite locally free O_Y-modules with integrable k-connection; morphisms are horizontal O_Y-linear maps. Its fibre ω_b is b*E. For a prime p and chosen geometric b, C_et(Y_bar,Q_p) is the unipotent full subcategory of finite-rank lisse Q_p-sheaves on Y_bar, with stalk fibre ω_b. In a smooth proper good-reduction compactification (Xcal,Dcal) over W(F_q), with Dcal finite étale and Ycal=Xcal−Dcal, C_rig(Y_0) is the unipotent full subcategory of overconvergent isocrystals over K_0=Frac W(F_q), with fibre at b_bar. Each category is neutral Tannakian, with finite-dimensional Ext^1(1,1), identified with the corresponding H^1. Algebraic vector bundles, local systems and general isocrystals are imported objects; the new construction selects their unipotent categories and proves the fibre hypotheses.

Hypotheses: Finite-rank objects; geometric connectedness makes endomorphisms of the unit equal to the coefficient field. For C_rig, a smooth good-reduction pair with finite étale boundary, possibly empty, and an integral endpoint. Only rational endpoints are constructed in this part; tame tangential endpoints need a separate logarithmic fibre construction.

Construction or proof:

1. Apply unipotent-length in the three imported geometric categories. Prove subquotient closure by the invariant-vector filtration, and exact faithful evaluation using connectedness and horizontal/local-system uniqueness.
2. Identify extensions of unit by unit with H^1 using the connection Čech–de Rham cocycle, the local-system cocycle, or the rigid de Rham complex. Use the suppliers for finite-dimensionality.
3. Build tensor/dual/pullback and basepoint evaluation from the suppliers; check symmetry and unit compatibility, rather than assuming an arbitrary tensor category is neutral.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/unipotent-length`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-local-systems`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-representations`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-isocrystals-of-a-variety`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-isocrystal-connection-form`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `ColemanIntegration:L1/frobenius-h1-datum`.

| API | Contract |
| --- | --- |
| `UnipotentRealizations.etale` | The full unipotent subcategory of the imported geometric rational local systems. |
| `UnipotentRealizations.deRham` | The full unipotent subcategory of algebraic integrable connections. |
| `UnipotentRealizations.rigid` | The full unipotent subcategory of imported overconvergent isocrystals. |
| `UnipotentRealizations.fiber` | Exact faithful tensor evaluation at the specified endpoint. |
| `UnipotentRealizations.pullback` | A morphism of pointed smooth curves induces the pullback tensor functor and compatible fibre identification; identity and composition agree. |

Discriminating unit tests:

- `realization_unit` (degenerate): In each realization the fibre of the tensor unit is the coefficient field.
- `realization_nontrivial_rank_one` (non-example): A rank-one representation with a nonidentity monodromy scalar has no unipotent filtration.
- `realization_extension` (characterisation): A nonsplit geometric extension of the unit by itself belongs to C_1, while its fibre sequence is exact.

Uses: Kim Sections 1–2: Constructs groups and Galois paths from actual geometric categories.; BDMTV Sections 4–5: Provides universal connections and their good-reduction rigid realization.

Acceptance: The trivial connection and constant Q_p-sheaf lie in C_0. A rank-one local system with nontrivial monodromy is excluded.

Sources: **kim**, Section 1, pp. 97–100; Section 2, pp. 114–116: Constructs the connection and geometric lisse-sheaf realizations with their evaluation fibres.; **cls**, Proposition 2.3.2, p. 93; Proposition 2.4.1, pp. 95–97: Supplies the isocrystal closure and neutral-fibre comparison.; **besser**, Section 2, Proposition 2.13, pp. 6–7: The isocrystal fibre is exact, tensor and faithful on the unipotent category.

### Unipotent fundamental group — `UnipotentFundamentalGroup`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/tannakian-groups`; construction.

For each category in realization-categories, let U_b be the affine group scheme representing R↦Aut^⊗(ω_b⊗R) on all commutative coefficient algebras R, constructed by the imported neutral reconstruction. It is pro-unipotent, and C≃Rep_fd(U_b). The étale realization is over Q_p and the de Rham realization over k. Pullback along f:(Y,b)→(Z,c) induces U_b(Y)→U_c(Z); basepoint paths act by conjugation. Finite-dimensional tensor generators produce algebraic unipotent quotients, whose inverse limit is U_b. This specializes neutral reconstruction; it does not reconstruct a group from a Hopf algebra chosen in advance.

Hypotheses: realization-categories and the invariant-vector criterion.

Construction or proof:

1. Apply MC.6 reconstruction to each established neutral category, and invariant-vector-criterion to identify pro-unipotence.
2. Construct morphisms by restriction of tensor automorphisms along pullback, checking all coefficient algebras and base change.
3. Compare with the pinned fixed-Hopf comodule reconstruction when the category is presented as finite comodules; do not claim that result constructs the geometric Hopf algebra.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/realization-categories`, `AnabelianGeometryAndNonabelianChabauty:NC.2/invariant-vector-criterion`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv`, `tauceti:TauCeti.SmoothUnipotentAffineGroupSchemeCat`.

| API | Contract |
| --- | --- |
| `UnipotentFundamentalGroup.points` | R-points are tensor automorphisms of the scalar-extended fibre functor, not arbitrary natural endomorphisms. |
| `UnipotentFundamentalGroup.pullback` | Pointed pullback induces a group-scheme morphism, covariant in the pointed curve. |
| `UnipotentFundamentalGroup.map_comp` | The group map for g∘f is the composition of the group maps. |
| `UnipotentFundamentalGroup.fixedHopf` | For the finite-comodule presentation, the R-point equivalence is the pinned fgPointTensorIsoEquiv, with its convolution convention. |

Discriminating unit tests:

- `group_trivial_category` (degenerate): Every tensor automorphism of the usual fibre on finite-dimensional k-vector spaces is the identity.
- `group_fixed_hopf` (compatibility): On FGComoduleCat the point group is the existing convolution group of k-algebra maps H→R.
- `group_unit_constraint` (non-example): A natural scalar multiplication by 2 on every fibre in characteristic zero is not a tensor automorphism, since its unit component is not identity.

Uses: NC.3 central Selmer towers: The group schemes are the coefficients of nonabelian torsors.; BDMTV Appendix A: Their completed distribution algebras give the universal length objects.

Acceptance: The trivial Tannakian category yields the trivial group over every coefficient algebra. For the algebraic de Rham category on G_m in characteristic zero, U≅G_a.

Sources: **kim**, Section 1, pp. 97–100; Section 2, pp. 114–115: The tensor automorphism functors define the two geometric realizations.; **bdmtv**, Appendix A.1, pp. 934–935: Uses the pro-unipotent Tannakian fundamental group and its coordinate Hopf algebra.

### Tensor paths — `TensorPath`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`; construction.

For endpoints b,x define P(b,x)(R)=Isom^⊗(ω_b⊗R,ω_x⊗R). Import representability and fpqc torsor descent from MC.6: P(b,x) is an affine right U_b-torsor by p·g=p∘g, with commuting left U_x-action. Path composition is (p_23,p_12)↦p_23∘p_12; inversion reverses endpoints; P(b,b)=U_b. These are scheme statements over every coefficient algebra, rather than a classification of just rational points. A path identifies U_b and U_x by g↦p g p^−1.

Hypotheses: Neutral categories and fibres of realization-categories.

Construction or proof:

1. Apply MC.6 tensor-isomorphism representability and torsor theorem to the two fibres.
2. Define actions, identity, inverse and composition in the category of tensor functors. Check the torsor isomorphism P×U→P×P after faithfully flat trivialization, then descend.
3. Compare the point carrier directly with the native category of bundled lax monoidal functors and its monoidal natural isomorphisms.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/tannakian-groups`, `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`, `mathlib:CategoryTheory.LaxMonoidalFunctor.Hom`, `mathlib:CategoryTheory.Aut`.

| API | Contract |
| --- | --- |
| `TensorPath.identity` | The identity tensor isomorphism is a path b→b. |
| `TensorPath.rightMul` | For p:b→x and g∈U_b, first apply g and then p. |
| `TensorPath.comp` | For p:b→x and q:x→y, compose to q∘p. |
| `TensorPath.inverse` | The inverse path goes from x to b. |
| `TensorPath.conjugate` | A path transports source tensor automorphisms to target tensor automorphisms. |
| `TensorPath.ext` | Paths agree if all their fibre maps agree. |

Discriminating unit tests:

- `path_identity_comp` (degenerate): Composing the identity at either endpoint leaves a path unchanged.
- `path_right_action_free` (characterisation): If p·g=p then g=1.
- `path_comp_order` (computation): For vector-space fibre maps, the component of q after p is q_E∘p_E; a noncommuting pair detects the reversed convention.

Uses: NC.3: Provides genuine geometric scheme torsors before nonabelian cohomology.; BDMTV Lemma A.4: Acts on the finite path modules.

Acceptance: At equal endpoints composition is the native tensor-automorphism multiplication, with the order specified. A natural transformation whose unit component is zero is excluded, even though it is a valid element of a finite path module.

Sources: **kim**, Section 1, pp. 98–104; Section 2, pp. 114–116: Constructs path schemes and their right action.; **besser**, Section 3, pp. 7–9: Uses tensor-natural paths, their composition and endpoint group actions.; **bdmtv**, Appendix A.1.2, pp. 936–937: Distinguishes tensor paths from universal-object vector spaces.

### Galois structure and completion — `etale_galois_completion`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/etale-galois`; comparison.

For Y/k and k-rational endpoints b,x, descent from Y_bar gives continuous semilinear G_k-actions on U_et and P_et(b,x), compatible with all algebraic operations and finite-dimensional coordinate pieces. In profinite path coordinates the formula is σ(p)=s_x(σ) p s_b(σ)^−1. Restriction of finite-cover paths to unipotent lisse Q_p-sheaves yields the geometric pro-unipotent Q_p completion: every continuous unipotent finite-dimensional Q_p representation factors through its tensor category, and hence through an algebraic quotient of U_et. No surjectivity of profinite points onto all U_et(Q_p)-points is asserted.

Hypotheses: Characteristic-zero base field, a separable closure and rational endpoints. Continuity means the usual p-adic topology on each finite-dimensional representation; not a discrete topology on Q_p.

Construction or proof:

1. Import the rational local-system/continuous-representation equivalence and NC.0 arithmetic geometric paths.
2. Pull back the geometric local systems by σ and use rational endpoint stalk identifications. Descent cocycles give the Galois actions and σ(p·g)=σ(p)·σ(g).
3. Apply neutral reconstruction to the unipotent representation subcategory. Finite objects supply finite-dimensional Galois-stable pieces; continuity follows from the imported continuous local systems.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`, `AnabelianGeometryAndNonabelianChabauty:NC.2/realization-categories`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-representations`, `AnabelianGeometryAndNonabelianChabauty:NC.0/arithmetic-geometric-paths`, `AnabelianGeometryAndNonabelianChabauty:NC.3/equivariant-topological-torsors`.

Acceptance: For b=x, the identity path is Galois fixed and the action is by group automorphisms. The displayed action respects the right action, even when neither endpoint section becomes equal under a chosen ordinary path.

Sources: **kim**, Section 2, pp. 114–116: The geometric unipotent group and all endpoint paths inherit Galois actions.; **bdmtv**, Section 2.1, pp. 896–898; Appendix A.1, pp. 934–937: The arithmetic objects are finite representations of geometric unipotent groups, not full profinite covers.

### Lower central depth — `UnipotentDepth`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/central-quotients`; construction.

For U in tannakian-groups, put Γ_1U=U and Γ_(r+1)U equal to the closed normal subgroup scheme generated by commutators of U with Γ_rU. Define U⟨n⟩=U/Γ_(n+1)U for n≥0 as an fpqc quotient group scheme. It is finite type and unipotent for these curves, U⟨0⟩=1, and U⟨1⟩ is the additive group on H^1∨. Quotienting a path torsor by Γ_(n+1) gives a right U⟨n⟩-torsor. The tower maps, path composition and realization structures descend. Kim writes U_r=U/Z_r with Z_1=U, so U⟨n⟩ equals his U_(n+1). Native lowerCentralSeries of the top subgroup starts at index zero; its index n matches Γ_(n+1) on abstract points only, and does not supply schematic quotient representability.

Hypotheses: Characteristic zero; finite-dimensional H^1; pro-unipotent U from a curve. Use schematic closure and fpqc quotients; abstract quotients of rational points are not substituted.

Construction or proof:

1. Construct schematic lower central terms or equivalently use the closed lower central ideals in the pronilpotent Lie algebra via characteristic-zero unipotent group/Lie equivalence.
2. The bracket gives a surjection from finite-dimensional tensor powers of H^1∨ onto each successive Lie graded piece; induction gives finite-dimensional depth-n Lie algebra and a finite-type unipotent group.
3. Descend the characteristic subgroup and torsor quotient along a trivializing faithfully flat cover. Verify indexing against the native abstract lowerCentralSeries, retaining the representability boundary.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/tannakian-groups`, `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`, `mathlib:Subgroup.lowerCentralSeries`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`.

| API | Contract |
| --- | --- |
| `UnipotentDepth.quotient` | The canonical fpqc group-scheme quotient map U→U⟨n⟩. |
| `UnipotentDepth.transition` | For m≤n there is U⟨n⟩→U⟨m⟩, with identity and composition laws. |
| `UnipotentDepth.pathQuotient` | Quotient P(b,x) by Γ_(n+1), preserving its scheme torsor structure. |
| `UnipotentDepth.nativeIndex` | On an abstract group, native top.lowerCentralSeries n uses Γ_(n+1) indexing; no assertion equating an abstract point quotient with the scheme quotient. |

Discriminating unit tests:

- `depth_zero` (degenerate): The quotient by Γ_1 is trivial.
- `depth_one_abelian` (computation): For an abelian group Γ_2 is trivial; the abstract depth-one quotient is the group itself.
- `depth_index` (compatibility): Γ_(n+1) corresponds to native lowerCentralSeries n, so the first commutator term is native index one.

Uses: NC.3: Provides finite-dimensional group schemes for a central Selmer tower.; Kim Section 1: Separates central depth from the universal length truncations.

Acceptance: For G_a the depth-one quotient is G_a and all higher central commutators vanish. A nonabelian two-step unipotent group has nontrivial depth-two commutators, whereas its depth-one quotient is abelian.

Sources: **kim**, Section 1, pp. 100–104; Section 2, pp. 115–116: Constructs finite-dimensional lower central quotients and compatible path torsors.; **besser**, Theorem 3.6 and Lemma 3.7, pp. 9–11: Relates the Lie and completed-algebra filtrations and finite-dimensional graded pieces.

### Completed path algebra — `UnipotentLengthAlgebra`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/length-algebra`; construction.

For a neutral unipotent C with finite-dimensional Ext^1(1,1), let A(C,ω) be the completed enveloping/distribution algebra of Lie(U_ω), with its augmentation ideal I. Put A_n=A/I^(n+1) and equip it with the finite filtration I^i/I^(n+1). Each A_n is finite dimensional, A_0=k, and multiplication induces A_n⊗A_n→A_n. The complete coproduct is defined by primitive Lie elements; it gives length-compatible maps A_(r+s)→A_r⊗A_s. The coordinate Hopf algebra is the direct limit of A_n∨. A_n is not a Hopf quotient in general: for a primitive T, Δ(T²) contains 2T⊗T. The C-object corresponding to the left regular A_n-module is written 𝒜_n(ω).

Hypotheses: Neutral unipotent C, characteristic zero, finite-dimensional Ext^1(1,1). I^(n+1) is a closed two-sided ideal in the complete algebra.

Construction or proof:

1. Use MC.6 reconstruction and the characteristic-zero unipotent/Lie equivalence. Complete the existing enveloping algebra in augmentation powers; finite generation of the abelianized Lie algebra bounds each graded piece by a finite tensor power.
2. Apply the finite-dimensional representation equivalence to the left regular A_n-module.
3. Dualize the length-compatible coproduct and multiplication. Their compatible finite pieces construct the coordinate Hopf algebra and its direct-limit identification; do not equip an individual length quotient with a nonexistent Hopf quotient structure.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/tannakian-groups`, `AnabelianGeometryAndNonabelianChabauty:NC.2/central-quotients`, `mathlib:UniversalEnvelopingAlgebra`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.

| API | Contract |
| --- | --- |
| `UnipotentLengthAlgebra.augmentation` | The augmentation A_n→k sends the unit to one and I to zero. |
| `UnipotentLengthAlgebra.transition` | The pointed surjective map A_(n+1)→A_n. |
| `UnipotentLengthAlgebra.graded` | The i-th length grade is I^i/I^(i+1), a quotient of (Ext^1(1,1)∨)^⊗i. |
| `UnipotentLengthAlgebra.coordinate` | The direct limit of the linear duals A_n∨ is the coordinate Hopf algebra, with products using length r+s. |
| `UnipotentLengthAlgebra.regularObject` | The C-object 𝒜_n whose fibre is the regular left A_n-module. |

Discriminating unit tests:

- `length_algebra_zero` (degenerate): A_0 is k with its usual augmentation.
- `length_algebra_ga` (computation): For G_a, A_1 has basis 1,T and T²=0.
- `length_algebra_not_hopf` (non-example): In characteristic zero, the primitive coproduct does not factor through the quotient k[T]/T² as a coalgebra map to its tensor square.

Uses: BDMTV Appendix A.3: Supplies finite universal objects.; Olsson comparison and BDMTV Lemma 5.4: Finite dual coordinate pieces identify the path modules.

Acceptance: For U=G_a, A_n=k[T]/(T^(n+1)), while O(U)=k[t] is infinite dimensional. At n=1, T² is zero in A_1 but its proposed coproduct is not zero in A_1⊗A_1.

Sources: **bdmtv**, Appendix A.1.1, pp. 934–935: Defines the augmentation length algebra and its dual coordinate ring.; **kim**, Section 1, pp. 98–101; Section 2, pp. 115–116: Builds the completed universal algebra and the dual coordinate Hopf structure.; **besser**, Theorem 3.6, pp. 9–10: Establishes finite length pieces and the representation/algebra interpretation.

### Universal pointed object — `IsUniversalPointed`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-pointed`; definition.

A pointed object is (E,e) with e∈ω(E). A universal pointed length-n object is a length-n E together with e such that, for every V∈C_n, evaluation f↦ω(f)(e) is a bijection Hom_C(E,V)→ω(V). In particular each prescribed fibre vector determines exactly one morphism. Equivalently (E,e) is initial among pointed objects with that prescribed target vector. This property is stated in the full length subcategory; augmentation filtrations make the maps compatible with the usual unipotent filtration convention. A pointed pro-object is a compatible tower of such objects with transition maps preserving e.

Hypotheses: Neutral unipotent category and fibre functor; finite length n.

Construction or proof:

1. Define the evaluation function and its bijectivity as the universal property.
2. Apply it twice to obtain the unique pointed isomorphism between two universal objects. The two composites are identity by uniqueness.
3. Use the property to construct unique pointed transition maps and their composition law.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/unipotent-length`, `mathlib:ModuleCat.of`.

| API | Contract |
| --- | --- |
| `IsUniversalPointed.lift` | For a length-n V and v∈ω(V), produce the unique map carrying e to v. |
| `IsUniversalPointed.lift_eval` | Evaluation of lift(v) at e is v. |
| `IsUniversalPointed.lift_unique` | Maps from E into a length-n object agree if their values at e agree. |
| `IsUniversalPointed.pointedIso` | Two universal pointed objects have a unique pointed isomorphism. |

Discriminating unit tests:

- `universal_unit` (degenerate): On the trivial tensor category, (k,1) has the universal evaluation property.
- `universal_extra_summand` (non-example): For pointer (1,0) in k², projection onto the first coordinate and the sum of the two coordinates both send the pointer to 1 and are distinct.
- `universal_eval_unique` (characterisation): Two maps from a universal pointed object to a specified length-n target with equal pointer image must coincide.

Uses: BDMTV Lemmas A.3–A.4: Constructs evaluation isomorphisms for finite paths.; BDMTV Lemma 5.2: Determines the normalized universal Frobenius morphism uniquely.

Acceptance: At length zero (1,1) represents the usual fibre on trivial objects. (1⊕1,(1,0)) has existence of maps to all trivial pointed targets but does not have uniqueness.

Sources: **bdmtv**, Definition A.2 and Lemma A.3, p. 935 (corrected E9): Requires the unique-map property used in all subsequent universal-object arguments.; **kim**, Section 1, pp. 98–100; Lemma 3, pp. 108–110: Uses evaluation at the distinguished fibre vector, including uniqueness.

### Existence of universal length objects — `universal_length_object`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-object-existence`; theorem.

The pair (𝒜_n(ω),1) obtained from length-algebra is universal pointed length n. Its pointed quotient maps to 𝒜_(n−1) give a compatible universal pointed pro-object. The length-zero member is the unit, and its fibre algebra is A_n. Evaluation is k-linear as well as bijective.

Hypotheses: Neutral unipotent C with finite-dimensional Ext^1(1,1), characteristic zero.

Construction or proof:

1. Under Tannaka reconstruction, a length-n representation is annihilated by I^(n+1); prove this by its trivial graded filtration and conversely use powers of I.
2. An A-linear map A_n→V is determined by 1, and any v defines a↦a·v. Transport this elementary regular-module property through the representation equivalence.
3. Quotient maps preserve the unit and define the inverse system. Uniqueness implies all transition diagrams commute.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/length-algebra`, `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-pointed`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`.

Acceptance: For G_a and n=1, multiplication by T on k[T]/T² is the nontrivial two-dimensional regular representation. The only map to the unit carrying 1 to 1 is the augmentation.

Sources: **bdmtv**, Lemma A.3 and its preceding construction, p. 935: The regular length quotient represents all pointed length-n objects.; **kim**, Section 1, pp. 98–100; Section 2, pp. 115–116: Gives the pro-universal system in the connection and lisse realizations.

### Finite path module — `FinitePathModule`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-module`; construction.

For fibres ω,ν on a neutral unipotent C, define M_n(ω,ν)=Nat(ω|C_n,ν|C_n), with its k-vector-space structure from pointwise linear operations. Evaluation α↦α_(𝒜_n(ω))(1) is a canonical linear isomorphism M_n(ω,ν)≅ν(𝒜_n(ω)). In particular M_n(ω,ω)≅A_n(ω), as an algebra with categorical composition; M_n(ω,ν) is a right A_n(ω)-module. Tensor paths act by postcomposition and identify this with the associated finite bundle P(ω,ν)×^Uω A_n. Composition M_n(ν,λ)×M_n(ω,ν)→M_n(ω,λ) is bilinear and associative. Duality gives the endpoint-reversed linear isomorphism, with reversal of composition. No invertibility or tensor constraint is required of an element of M_n.

Hypotheses: The finite universal objects exist; C_n is the full length subcategory. All coefficient fibres are over the same field; geometric comparison first extends scalars when needed.

Construction or proof:

1. Apply universal-object-existence to each V,v to define the inverse to evaluation and prove its naturality using lift uniqueness.
2. Use natural transformation composition for the algebra and right module structure. Reconstruct the associated finite bundle after a faithfully flat tensor path trivialization and descend it.
3. Dualize components on V∨ and use the double-dual tensor identification; this reverses endpoints and composition.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-object-existence`, `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`, `mathlib:CategoryTheory.NatTrans.appLinearMap`, `MotivesAndAlgebraicCycles:MC.6/tensor-iso-torsor`.

| API | Contract |
| --- | --- |
| `FinitePathModule.eval` | Evaluate a natural transformation on the universal pointer. |
| `FinitePathModule.evalEquiv` | Evaluation identifies M_n(ω,ν) linearly with ν(𝒜_n(ω)). |
| `FinitePathModule.comp` | Bilinear composition, with q after p, is associative and unital at equal endpoints. |
| `FinitePathModule.rightMul` | Precomposition by a source natural endomorphism gives the right A_n-module action. |
| `FinitePathModule.reverseDual` | Duality reverses endpoint order and reverses the order in a composite. |

Discriminating unit tests:

- `finite_path_zero` (degenerate): The zero natural transformation is an element and evaluates to zero.
- `finite_path_comp_order` (computation): On a constant vector-space fibre, comp(q,p) has component q∘p.
- `finite_path_not_tensor` (non-example): The zero natural transformation fails the tensor unit constraint, so the finite path module and tensor-path carrier are distinct.

Uses: BDMTV Section 4.2: Provides the fibre coordinates of the affine universal connection.; BDMTV Lemma 5.4: Is the finite-dimensional crystalline representation being compared.

Acceptance: For the trivial category, M_0=k, whereas the tensor path scheme is a point. The zero natural transformation belongs to M_n but is not a tensor path.

Sources: **bdmtv**, Lemma A.4 and the composition paragraph, pp. 936–937: Identifies the whole natural-transformation space with a universal fibre and defines composition.; **kim**, Section 1, pp. 98–101: Identifies the pro-path algebra with Hom of fibre functors and its geometric coordinate dual.

### Affine universal connection — `AffineUniversalConnection`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/affine-universal`; construction.

Let Y be a smooth geometrically connected affine curve over k of characteristic zero, with b∈Y(k), and choose forms ω_1,…,ω_m whose classes are a basis of H^1_dR(Y). Put V=H^1_dR(Y)∨ with dual generators T_i and W_≤n=⊕_(j=0)^n V^⊗j. On W_≤n⊗O_Y define ∇(w⊗f)=w⊗df−Σ_i(T_iw)⊗fω_i, with terms of degree n+1 set to zero. The pointer at b is the empty word 1. Descending word-degree subbundles give trivial graded connections. This is an integrable algebraic connection: Ω²_Y=0. Its algebra is the length quotient of the imported tensor/word algebra, with left-prepending in the connection and right multiplication horizontal.

Hypotheses: Affine smooth curve, rational b, finite-dimensional H^1 with a represented basis. If the compactification has genus g and d geometric boundary points, d>0, then m=2g+d−1.

Construction or proof:

1. Import the word algebra from Coleman L1 and form its finite length quotient; tensor it with O_Y using AlgebraicVectorBundles.
2. Define the connection by the displayed Leibniz rule. Word-degree proves unipotence and finite rank, and curve dimension proves integrability.
3. Right multiplication commutes with left-prepending, hence is horizontal; do not claim left multiplication is horizontal for arbitrary noncentral words.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/realization-categories`, `ColemanIntegration:L1/word-algebra`, `SchemeAndStackFoundations:SF.0`, `mathlib:Derivation`.

| API | Contract |
| --- | --- |
| `AffineUniversalConnection.empty` | The empty-word section and its pointer at b. |
| `AffineUniversalConnection.nabla` | The connection is d−Σ_i L_(T_i)ω_i with degree overflow zero. |
| `AffineUniversalConnection.truncate` | Word truncation gives horizontal pointed maps between lengths. |
| `AffineUniversalConnection.rightMul` | Right multiplication by a constant word element is horizontal. |
| `AffineUniversalConnection.rank` | Its rank is Σ_(j=0)^n m^j, with 0^0=1. |

Discriminating unit tests:

- `affine_length_zero` (degenerate): At length zero, every prepend operator vanishes and the connection is the ordinary derivation.
- `affine_one_generator` (computation): In length one for one generator, prepend sends empty word to T and T to zero.
- `affine_order_noncommuting` (non-example): With two generators and length two, ∇ applied to T_2 contains −T_1T_2ω_1, rather than −T_2T_1ω_1.

Uses: BDMTV Theorem 4.2 and Lemma 4.3: Constructs the universal pointed object and fixes composition order.; Coleman L1 and BDMTV equation (41): Its horizontal solutions are the word-valued path coefficients.

Acceptance: At n=0 this is (O_Y,d). For Y=G_m with ω=dt/t and n=1, ∇1=−T·dt/t and ∇T=0.

Sources: **bdmtv**, Section 4.2, equation (21), p. 910: Provides the explicit left-prepending connection on a finite word module.; **kim**, Lemma 2, pp. 107–108; Lemma 3, pp. 108–110: The affine normal form and free universal connection support the construction.

### Kim’s affine universal property — `affine_universal_property`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/affine-universality`; theorem.

The affine connection in affine-universal, pointed by the empty word at b, is isomorphic as a pointed connection to 𝒜_n(C_dR(Y),ω_b). For every length-n unipotent connection E and every vector v∈b*E, there is exactly one horizontal morphism f with f_b(1)=v. The vector is in the fibre, not an arbitrary global section. Changing the cohomology basis yields the uniquely pointed universal isomorphism, with the nonlinear gauge correction when representatives differ by exact forms.

Hypotheses: Hypotheses of affine-universal.

Construction or proof:

1. Use the affine normal form: unipotent bundles are split as O_Y-modules, and gauge changes remove exact parts of connection matrices using affine H^1 representatives.
2. Use Kim’s universal word connection and its holonomy/word independence argument to identify the completed algebra; at finite length the regular-module evaluation property gives existence and uniqueness.
3. Apply universal-pointed uniqueness to basis changes. The gauge correction is required; an arbitrary basis change alone cannot handle exact differences.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/affine-universal`, `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-object-existence`, `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-pointed`, `SchemeAndStackFoundations:SF.2`, `ColemanIntegration:L1/word-algebra`.

Acceptance: For E=unit and v=a, the unique map is a times augmentation. On G_m a nonconstant global function is not the image of 1 under a horizontal map from the length-zero unit connection.

Sources: **kim**, Lemmas 2–3, pp. 107–110: Proves affine normal form and universality of the free word connection.; **bdmtv**, Theorem 4.2, p. 910 (corrected E6): States the unique pointed-map property for a fibre vector.

### Composition in affine word coordinates — `affine_composition`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/affine-composition`; theorem.

The affine trivialization s_0(b,x):W_≤n→M_n(b,x) induced by the universal connection satisfies comp(s_0(x_2,x_3)(f_2),s_0(x_1,x_2)(f_1))=s_0(x_1,x_3)(f_2 f_1). Multiplication is truncated concatenation in the displayed order. For equal endpoints it is an algebra isomorphism. The associated action of a source algebra element is right multiplication in these coordinates.

Hypotheses: One affine curve, one chosen cohomology basis, and endpoints in Y(k).

Construction or proof:

1. Right multiplication by f_1 defines a horizontal endomorphism of the universal connection.
2. Evaluate at its pointer and apply the unique pointed-map property. The resulting natural transformation realizes f_1 in finite-path-module.
3. Compose the natural transformations and evaluate; right multiplication gives f_2 f_1, fixing the convention without commuting the words.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-module`, `AnabelianGeometryAndNonabelianChabauty:NC.2/affine-universality`.

Acceptance: With two generators and n=2, composing coordinate T_1 then T_2 gives T_2T_1, distinct from T_1T_2. The empty word is the identity endomorphism.

Sources: **bdmtv**, Lemma 4.3, equations (22)–(24), p. 911: The affine trivialization identifies composition with ordered multiplication.

### Proper extendable quotient — `proper_maximal_quotient`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/proper-maximal-quotient`; theorem.

Let X be a smooth proper geometrically connected characteristic-zero curve and j:Y↪X a nonempty affine open containing b. Restriction C_dR(X)→C_dR(Y) is fully faithful. The canonical pointed map 𝒜_n(Y)→j*𝒜_n(X) is surjective, and its target is the maximal length-n pointed quotient extending to an integrable connection on all of X with no logarithmic poles. Every horizontal map from 𝒜_n(Y) to a restricted length-n connection from X factors uniquely through it. The proper length graded pieces are quotients of V_X^⊗i, not free tensor powers in general.

Hypotheses: Smooth proper X, rational basepoint in nonempty affine Y, characteristic zero.

Construction or proof:

1. Prove restriction full faithfulness in characteristic zero on the horizontal Hom connection: a rational horizontal section with a pole of maximal order r>0 has derivative of order r+1, while a regular connection matrix contributes at most order r. The leading pole coefficient cannot cancel, so the section extends across each removed smooth point. Apply this to Hom of two regular connections.
2. Use the universal pointed maps on Y and X. The image is a subconnection extending to X, and contains the universal pointer; universality forces surjectivity.
3. For each extendable target, universal pointed evaluation on X gives the unique factorization. Extendable quotients are exactly the ones with zero residues in their canonical logarithmic extension.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/affine-universality`, `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-object-existence`, `SchemeAndStackFoundations:SF.2`.

Acceptance: For X=P¹, 𝒜_n(X) is the unit for all n, even though puncturing creates nontrivial universal word generators. For a positive-genus proper curve the degree-two cup-product relation prevents the proper algebra from being the free tensor algebra.

Sources: **bdmtv**, Corollary 4.4 and its proof, pp. 911–912: Characterizes the proper universal connection as the largest extendable quotient.; **kim**, Section 1, p. 111: Uses full faithfulness of restriction for unipotent connections.; **besser**, Lemma 2.14, Corollary 2.15 and Proposition 2.16, p. 7: Supplies the dense-open horizontal extension argument on rigid unipotent objects, transported by the good-reduction comparison where available.; **bdii**, Lemma 6.7, §6.5.1, p. 33 of the author manuscript: Illustrates the proper quotient by residues for the depth-two mixed-height quotient; the general universal-object assertion comes from Corollary 4.4.

### Hodge filtered path fibres — `FilteredPathFiber`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/filtered-path`; definition.

A filtered unipotent connection is an integrable connection E with a finite, exhaustive, separated descending filtration F^iE by subbundles, satisfying ∇F^iE⊆F^(i−1)E⊗Ω¹ (or Ω¹(log D) on the canonical extension of an open curve). For 𝒜_n(b), filter its constant kernel I^n/I^(n+1) by the quotient filtration from V_dR^⊗n, where V_dR=H^1_dR∨ has the dual Hodge filtration. The Hodge filtered path fibre at x is x*𝒜_n(b) with the resulting filtration. On the dual coordinate ring this induces the multiplicative filtration and F^0 path subtorsor. The existence and uniqueness of the geometric filtration are the theorem hadian-filtration, not fields assumed in this definition.

Hypotheses: Smooth proper curve or the canonical logarithmic extension to its smooth proper compactification. Dual filtration convention: F^i(V∨) annihilates F^(1−i)V. General filtered modules and Hodge filtrations are imported from p-adic Hodge theory.

Construction or proof:

1. Specify the filtration and transversality on the imported connection; the subbundle condition makes fibre restriction exact.
2. Use the augmentation length grades and the quotient of the tensor Hodge filtration for the universal kernels.
3. Restrict the actual filtered bundles at endpoints; dualize to filtered coordinate objects and check tensor/coalgebra compatibility using the universal construction.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/realization-categories`, `AnabelianGeometryAndNonabelianChabauty:NC.2/length-algebra`, `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-module`, `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`, `SchemeAndStackFoundations:SF.0`.

| API | Contract |
| --- | --- |
| `FilteredPathFiber.filtration` | For each integer i the subspace F^i in the endpoint fibre. |
| `FilteredPathFiber.graded` | The associated length grade has the quotient tensor Hodge filtration. |
| `FilteredPathFiber.unit` | The universal pointer at b lies in F^0. |
| `FilteredPathFiber.dual` | Dualization uses annihilators of F^(1−i), and comparison maps are strict filtered maps. |
| `FilteredPathFiber.truncate` | Length transition maps preserve the Hodge filtration. |

Discriminating unit tests:

- `filtered_unit` (degenerate): The filtered unit is k for i≤0 and zero for i>0.
- `filtered_dual_index` (compatibility): For a one-dimensional space with its only graded piece in degree one, its dual has its only graded piece in degree minus one.
- `filtered_augmentation_quotient` (characterisation): A filtered quotient of a finite path fibre carries the image filtration, rather than an arbitrary splitting filtration.

Uses: BDMTV Theorem 4.5: Determines the filtration on the universal connection.; NC.3–NC.4: Supplies filtered path torsors for local comparison, without constructing their moduli here.

Acceptance: At length zero the unit filtration is k in degrees i≤0 and zero for i>0. Frobenius is not required to preserve the Hodge filtration.

Sources: **bdmtv**, Section 4.3 and Theorem 4.5, pp. 912–913: Defines the filtered universal connection and its kernel filtration.; **bdii**, Definition 6.2 and Proposition 6.1, p. 30; Remarks 4–5, p. 31 of the author manuscript: Makes separated subbundle filtration, logarithmic extension and the normalization issue explicit.; **kim**, Section 1, pp. 103–104: Constructs the filtration on path coordinates and the F^0 subtorsor.

### Filtered extension classification — `filtered_extension_hypercohomology`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/filtered-extension`; theorem.

For filtered integrable connections E,F on a smooth proper curve X, with logarithmic poles along a reduced divisor D when present, extensions that are strict on filtered bundles are classified by H¹ of the two-term complex F^0 Hom(E,F)→F^(−1) Hom(E,F)⊗Ω¹_X(log D). The differential is the induced Hom connection. Forgetting the filtration is induced by inclusion into the full logarithmic de Rham complex. This is a classification of extension classes; uniqueness of a class does not by itself imply equality of filtrations on a fixed underlying bundle.

Hypotheses: Finite exhaustive separated subbundle filtrations and Griffiths transversality. Proper X and logarithmic canonical extensions if D is nonempty.

Construction or proof:

1. Choose local filtered splittings, which exist for strict extensions of vector bundles. Their differences form a Čech 1-cochain in F^0 Hom; connection off-diagonal terms form a 0-cochain in Ω¹(log D)⊗F^(−1) Hom.
2. The cocycle and horizontality equations are precisely the total degree-one hypercohomology cocycle condition. Changes of filtered splitting give coboundaries.
3. Reconstruct the extension from such a cocycle and check the inverse construction; the forgetful map is the inclusion of complexes.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/filtered-path`, `SchemeAndStackFoundations:SF.2`.

Acceptance: For D empty and E=F=unit with trivial filtration, the displayed filtered complex has O_X→Ω¹_X, the usual de Rham extension complex. Changing a filtered splitting changes the cocycle by a coboundary.

Sources: **hadian**, Thesis §2.2, Lemma 2.2.6 and Proposition 2.2.7, pp. 30–32: Proves the filtered Hom-complex calculation for logarithmic unipotent connections.; **bdii**, Proposition 6.1, p. 30; Remark 5, p. 31 of the author manuscript: States the extension classification and distinguishes class uniqueness from a rigidified filtration.

### Hadian’s universal Hodge filtration — `hadian_hodge_filtration`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/hadian-filtration`; theorem.

For a pointed smooth proper curve X/k in characteristic zero, the universal connection 𝒜_n(b) has a unique Hodge filtration by subbundles, rigidified at b, such that Griffiths transversality holds, the sequence V_dR^⊗n⊗O_X→𝒜_n(b)→𝒜_(n−1)(b)→0 induces the specified quotient tensor filtration on the kernel and the inductively specified filtration on the quotient, and 1_b∈F^0. Start with the unit filtration at n=0. Equivalently construct the canonical logarithmic universal connection on a nonempty affine Y⊂X, rigidify it by the pointer, and pass to the maximal no-pole quotient. Filtered quotients inherit the image filtration. The affine bundle without its compactification does not satisfy a uniqueness theorem.

Hypotheses: Smooth proper X, characteristic zero, rational b; n≥1. On an auxiliary affine open use its canonical logarithmic extension to X, including nilpotent residues; impose the basepoint pointer normalization.

Construction or proof:

1. Use filtered-extension to lift the underlying universal extension class with the prescribed graded filtration. Hadian’s filtered Ext calculation gives the lift and uniqueness of its class on the proper compactification.
2. Rigidify the filtered universal extension at the pointed fibre. A pointed connection automorphism is identity by universal-pointed, turning the isomorphism-class result into uniqueness for the normalized universal object.
3. For proper X use proper-maximal-quotient and the filtered quotient construction. The kernel is a quotient of the tensor grade; it is not assumed to be the entire tensor power.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/filtered-path`, `AnabelianGeometryAndNonabelianChabauty:NC.2/filtered-extension`, `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-pointed`, `AnabelianGeometryAndNonabelianChabauty:NC.2/proper-maximal-quotient`.

Acceptance: For n=0, the pointer 1 lies in the usual F^0 of the unit. At n=1 for genus g proper X, the V_dR part has filtration F^0=ann H^0(X,Ω¹), of dimension g. The same uniqueness assertion on an affine bundle alone is excluded.

Sources: **bdmtv**, Theorem 4.5 and Remark 4.6, pp. 912–913: States the pointed proper-curve characterization used in this part.; **bdii**, Lemma 6.4, Remarks 4–5 and Corollary 6.2, pp. 30–31 of the author manuscript: Provides the logarithmic extension proof route, basepoint rigidification and filtered quotient step.; **hadian**, Thesis §2.2, Proposition 2.2.7 and Remark 2.2.8, pp. 31–32: Provides the filtered extension calculation for the affine/logarithmic universal connection, not a free-tensor description of a proper curve.

### Residue-disc fibre — `RigidHorizontalFiber`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/rigid-fibre`; construction.

For a unipotent overconvergent isocrystal E and a rational special-fibre point z, define ω_z(E) as the horizontal sections of E on the residue disc ]z[. For any lift x∈]z[(K_0), evaluation is a canonical tensor-natural isomorphism ω_z(E)≅E_x. For x,y in the same disc, define T_(x→y)=ev_y∘ev_x^−1. It composes, is horizontal, respects tensor products and the unit, and is independent of any chosen coordinate on the disc. These are local fibre identifications; they do not identify different discs until canonical-frobenius-path is proved.

Hypotheses: Smooth good-reduction curve and unipotent overconvergent connection. Endpoints rational over K_0; otherwise extend the unramified coefficient field first.

Construction or proof:

1. Import the isocrystal evaluation at a point from RD.3 and represent it on the residue disc by horizontal sections.
2. Use the unipotent filtration and recursively solve the connection using local primitives on the disc; uniqueness with a prescribed value proves evaluation is an isomorphism.
3. Tensor naturality and composition follow from uniqueness, not from a choice of basis.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/realization-categories`, `ColemanIntegration:L1/word-algebra-local-expansion`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-isocrystal-connection-form`.

| API | Contract |
| --- | --- |
| `RigidHorizontalFiber.horizontal` | The kernel of the connection on disc sections, as a coefficient-field vector space. |
| `RigidHorizontalFiber.eval` | Evaluation at a lift is a tensor-natural linear isomorphism. |
| `RigidHorizontalFiber.transport` | Transport from x to y is evaluation at y after inverse evaluation at x. |
| `RigidHorizontalFiber.transport_comp` | T_(y→z)∘T_(x→y)=T_(x→z). |
| `RigidHorizontalFiber.tensor` | Evaluation and transport commute with the tensor structure and send the unit to one. |

Discriminating unit tests:

- `rigid_unit` (degenerate): Horizontal sections of the trivial rank-one connection are the coefficient constants.
- `rigid_same_endpoint` (computation): Transport from x to itself is identity.
- `rigid_nilpotent_transport` (computation): For a constant nilpotent matrix N with N²=0 in d−Ndt, transport is 1+(y−x)N and therefore has the positive sign.

Uses: BDMTV Theorem 5.3: Matches rigid and de Rham endpoint fibres.; BDMTV equation (42): Conjugates Frobenius from fixed lifts to arbitrary endpoints.

Acceptance: For the trivial connection the horizontal sections are the constants and every evaluation is identity. For d−Ndt on a disc with N²=0, transport x→y is 1+(y−x)N.

Sources: **besser**, Section 2, equations (2.4)–(2.7), p. 6: Identifies the isocrystal fibre with horizontal sections on the tube of a point.; **kim**, Section 1, p. 102: Evaluation at any lift identifies a unipotent rigid fibre with the de Rham fibre.; **bdmtv**, Theorem 5.3 and §5.2, p. 920: Uses these fibre identifications to transport Frobenius.

### Frobenius pullback equivalence — `rigid_frobenius_equivalence`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/rigid-frobenius-equivalence`; theorem.

On the unipotent isocrystal category of a smooth curve over F_q with the stated good-reduction compactification, pullback by the q-power Frobenius is a K_0-linear tensor autoequivalence. For p-power Frobenius before iteration it is σ-semilinear. Unit and endpoint fibre identifications give actions on tensor paths and all finite universal path modules. Frobenius preserves the length filtration; preservation of the Hodge filtration is not part of the statement.

Hypotheses: Smooth special fibre descending to F_q; K_0=Frac W(F_q). Use the overconvergent unipotent category, not arbitrary F-isocrystals defined by choosing a matrix.

Construction or proof:

1. Use CLS Proposition 2.4.2. Its induction on unipotent length reduces full faithfulness to H^0 and essential surjectivity of extensions to H^1, on which Frobenius is invertible.
2. Pullback is tensor and preserves the unit; q-power iteration removes coefficient semilinearity over K_0.
3. Transport its functor and fibre identifications through tensor-paths and finite-path-module.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/realization-categories`, `AnabelianGeometryAndNonabelianChabauty:NC.2/rigid-fibre`, `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`, `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-module`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`.

Acceptance: Frobenius pullback of the unit is the unit. A p-power map over W(F_q)[1/p] is semilinear unless its coefficient Frobenius has been iterated q times appropriately.

Sources: **cls**, Proposition 2.4.2 and proof, pp. 96–97: Proves Frobenius is a tensor autoequivalence on unipotent isocrystals.; **bdmtv**, Section 5.1, pp. 918–919: Applies Frobenius pullback to universal connections.

### Normalized universal Frobenius — `universal_frobenius_normalization`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/frobenius-normalization`; theorem.

At a Frobenius-fixed special endpoint b_0, pullback of the universal pointed isocrystal (𝒜_n(b_0),1) is universal. There is exactly one pointed horizontal isomorphism Φ_n:F*𝒜_n(b_0)≅𝒜_n(b_0) carrying the identified base fibre pointer to 1. It commutes with length transition maps, yields the identity on A_0, and on the graded pieces induces the quotient of the tensor powers of Frobenius on H^1_rig∨. At other lifts of the same endpoint use rigid-fibre transport to express this normalization.

Hypotheses: Good-reduction hypotheses and a q-power Frobenius fixing the special endpoint. The comparison of the base fibres is specified; an unnormalized horizontal isomorphism is not canonical.

Construction or proof:

1. Apply the tensor autoequivalence to the universal pointed evaluation property; the endpoint identification preserves its pointer.
2. Use the unique pointed isomorphism of universal-pointed. Uniqueness forces compatibility with all transitions.
3. On the augmentation generators the map is the H^1-dual Frobenius; multiplicativity and quotient compatibility give its action on tensor graded pieces.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/rigid-frobenius-equivalence`, `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-object-existence`, `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-pointed`, `AnabelianGeometryAndNonabelianChabauty:NC.2/length-algebra`.

Acceptance: At length zero Φ_0 sends 1 to 1 and is identity. Multiplying a universal Frobenius map by a nonidentity source automorphism changes the pointer normalization and is excluded.

Sources: **bdmtv**, Lemma 5.2, equations (37)–(38), p. 919: Characterizes the universal Frobenius map by its pointer normalization.

### Nonabelian Berthelot–Ogus comparison — `nonabelian_berthelot_ogus`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/berthelot-ogus`; comparison.

For a smooth proper pair (Xcal,Dcal) over W(F_q), with Dcal finite étale, and Y=Xcal_K0−Dcal_K0, analytification is a K_0-linear tensor equivalence C_dR(Y)≃C_rig(Y_0). For an integral lift x of a special endpoint, its fibre comparison ι_x is rigid-fibre evaluation. Hence the groups, tensor path schemes, universal objects and finite path modules compare canonically, with coefficient extension if needed. For x,y in one residue disc, the induced de Rham path is local parallel transport. For Dcal empty this applies to the proper curve; the affine free-word computation is not applied to the proper curve without taking its quotient.

Hypotheses: Smooth proper compactification over the unramified DVR with smooth finite étale boundary, possibly empty. Only unipotent connections/isocrystals.

Construction or proof:

1. Apply CLS Proposition 2.4.1. Use its induction on length, identifying Hom with horizontal H^0 and extension classes with H^1 via algebraic/rigid linear comparison.
2. Compare endpoint fibres by rigid-fibre evaluation; use neutral reconstruction and tensor-isomorphism representability to pass to groups and schemes.
3. Universal pointed uniqueness gives finite-object comparison and compatibility with path composition and all length transitions.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/realization-categories`, `AnabelianGeometryAndNonabelianChabauty:NC.2/rigid-fibre`, `AnabelianGeometryAndNonabelianChabauty:NC.2/universal-object-existence`, `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`.

Acceptance: The comparison sends the unit to the unit and the universal pointer to the universal pointer. On a single residue disc its endpoint comparison is exactly T_(x→y), not a new arbitrary path choice.

Sources: **cls**, Proposition 2.4.1 and proof, pp. 95–97: Establishes the algebraic/rigid equivalence with the compactification and boundary hypotheses.; **bdmtv**, Theorem 5.3, p. 920: States the endpoint-fibre form of the nonabelian comparison.; **kim**, Section 1, pp. 102–104: Uses this comparison for the de Rham groups and path coordinates.

### Frobenius on de Rham paths — `PathFrobenius`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/path-frobenius`; construction.

Use berthelot-ogus and the endpoint fibre comparisons to transport rigid q-Frobenius to P_dR(b,x) and to M_n^dR(b,x). If b_0,x_0 are Frobenius-fixed lifts in the same respective discs, put τ(g)=T_(x_0→x)∘g∘T_(b→b_0). Then φ_n(b,x)=τ∘φ_n(b_0,x_0)∘τ^−1. At the fixed lifts, φ_n(b_0,x_0) is the fibre of Φ_n under the universal evaluation isomorphism. The operators preserve length, commute with composition and the source action, and retain their coefficient semilinearity before q-iteration. They need not preserve Hodge filtration.

Hypotheses: Good-reduction pair, integral rational endpoints in the good open, and specified Frobenius-fixed lifts when this coordinate formula is used.

Construction or proof:

1. Define the action through the actual rigid tensor functor and endpoint identifications, then transfer it through berthelot-ogus.
2. Use universal-frobenius-normalization and finite-path-module evaluation to identify the fixed-lift operator.
3. Change lifts by rigid-fibre transport; naturality gives the conjugation formula and its compatibility with length/composition.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/berthelot-ogus`, `AnabelianGeometryAndNonabelianChabauty:NC.2/frobenius-normalization`, `AnabelianGeometryAndNonabelianChabauty:NC.2/rigid-fibre`, `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-module`, `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`.

| API | Contract |
| --- | --- |
| `PathFrobenius.fixedLift` | The fixed-lift finite path operator obtained from Φ_n. |
| `PathFrobenius.transport` | Transport the fixed-lift operator by τ. |
| `PathFrobenius.changeLift` | Changing a disc lift conjugates the path operator by the corresponding two-sided transport. |
| `PathFrobenius.comp` | Frobenius of a composable pair is the composition of their Frobenius images. |
| `PathFrobenius.truncate` | The Frobenius operators commute with length transitions. |

Discriminating unit tests:

- `frobenius_fixed_lifts` (degenerate): Identity transport leaves the fixed-lift operator unchanged.
- `frobenius_two_sided` (computation): For linear maps represented by source A and target B, τ(g)=B∘g∘A and the transported operator is τφτ^−1.
- `frobenius_conjugation_fixed` (characterisation): If φ(g)=g, then τφτ^−1 fixes τ(g); reversing one endpoint transport generally fails this equality.

Uses: BDMTV Sections 5.3–5.4: Makes the Frobenius matrix at an arbitrary point intrinsic.; NC.3: Provides geometric crystalline path data before imposing Selmer conditions.

Acceptance: At fixed lifts the conjugating transport is identity. Changing both endpoints gives two-sided transport in the specified order.

Sources: **bdmtv**, Section 5.2, equation (42), pp. 920–921: Defines the endpoint operator and its transport from fixed lifts.; **kim**, Section 1, pp. 102–104: The rigid Frobenius induces compatible structures on de Rham paths.

### Unipotent Frobenius Lang theorem — `frobenius_lang_isomorphism`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/frobenius-lang`; theorem.

Let U be a pro-unipotent rigid fundamental group of a smooth F_q curve in the stated good-reduction pair. Its q-Frobenius φ has no eigenvalue one on any positive augmentation/Lie graded piece: H^1_rig∨ has weights −1 (proper) or −1 and −2 (open), and the grades are tensor-power quotients. The Lang map L_φ:U→U, g↦g^−1φ(g), is an isomorphism of affine schemes, compatible with finite lower central quotients and scalar extension. This is not asserted to be a group homomorphism. More generally the same proof applies when φ−1 is invertible on every finite Lie graded piece.

Hypotheses: Good-reduction smooth curve over a finite field and its geometric unipotent group; characteristic-zero coefficients. Weight/no-eigenvalue-one hypothesis at every positive grade; a single H^1 eigenvalue statement without its tensor-grade consequence is insufficient.

Construction or proof:

1. Import the rigid H^1 weights. Length-algebra bounds positive grades by tensor powers of H^1∨, so all eigenvalues have strictly negative weights and none is one.
2. Solve g^−1φ(g)=h successively in the complete augmentation algebra, where the next correction is determined by the invertible linear map φ−1 on the next grade.
3. Use the coproduct and uniqueness of this solution to show it is group-like. The construction is functorial over coefficient algebras, giving a scheme inverse rather than just a pointwise bijection.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/tannakian-groups`, `AnabelianGeometryAndNonabelianChabauty:NC.2/length-algebra`, `AnabelianGeometryAndNonabelianChabauty:NC.2/rigid-frobenius-equivalence`, `PadicDifferentialEquationsAndRigidCohomology:RD.6/purity-smooth-proper`, `PadicDifferentialEquationsAndRigidCohomology:RD.6/weights-of-h1-of-affine-curve`.

Acceptance: For U=G_a and φ=a·id with a≠1, Lang is multiplication by a−1. For U=G_a and φ=id, Lang is zero and is not invertible, so the weight hypothesis cannot be dropped.

Sources: **besser**, Theorem 3.1, Theorem 3.6 and Proposition 3.8, pp. 7–12: Proves Lang invertibility using the negative-weight augmentation argument.

### Canonical Frobenius path — `CanonicalFrobeniusPath`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/canonical-frobenius-path`; construction.

For any two endpoint fibres of the good-reduction unipotent rigid category, the Frobenius action on their tensor path torsor has a unique fixed point p_φ(b,x), rational over the coefficient field. The paths satisfy p_φ(x,y)∘p_φ(b,x)=p_φ(b,y), p_φ(b,b)=1, and are natural under pointed curve maps. They are unchanged after replacing a common Frobenius by a positive power. Through berthelot-ogus they supply tensor-natural horizontal continuation between distinct residue discs, agreeing with rigid-fibre transport inside a disc. These canonical paths do not require a choice of logarithm or a Hodge-filtration-preserving Frobenius.

Hypotheses: Good-reduction pair and the Frobenius Lang hypothesis; endpoints defined over the coefficient field after a common finite extension if needed.

Construction or proof:

1. Trivialize the torsor over a field extension and write φ(p)=p·h. Solving the resulting twisted Lang equation gives a unique fixed path by frobenius-lang.
2. Uniqueness makes the fixed path invariant under descent automorphisms, so it descends to the coefficient field.
3. Identity, composition, pullback, Frobenius power independence and local agreement follow because both sides are fixed tensor paths and the fixed path is unique.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/frobenius-lang`, `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`, `AnabelianGeometryAndNonabelianChabauty:NC.2/berthelot-ogus`, `AnabelianGeometryAndNonabelianChabauty:NC.2/rigid-fibre`.

| API | Contract |
| --- | --- |
| `CanonicalFrobeniusPath.fixed` | The canonical path is fixed by the specified Frobenius. |
| `CanonicalFrobeniusPath.unique` | Any Frobenius-fixed tensor path equals the canonical path. |
| `CanonicalFrobeniusPath.comp` | Canonical paths compose with endpoint order b→x→y. |
| `CanonicalFrobeniusPath.sameDisc` | Within one residue disc, canonical continuation is the local horizontal transport. |
| `CanonicalFrobeniusPath.power` | A common positive Frobenius power gives the same canonical path. |

Discriminating unit tests:

- `canonical_equal_endpoint` (degenerate): The fixed path at equal endpoints is identity.
- `canonical_additive` (computation): For φ(z)=2z+c on an additive torsor in characteristic zero, the unique fixed point is −c.
- `canonical_identity_fails` (non-example): Identity Frobenius on the additive line has more than one fixed point and does not meet the unique-fixed-path hypotheses.

Uses: BDMTV equation (41), including cross-disc use: Identifies global Coleman word solutions with Tannakian paths.; NC.4: Supplies the Frobenius choice in the de Rham Albanese construction without constructing the quotient here.

Acceptance: At equal endpoints the canonical fixed point is the identity. For an additive torsor with φ(z)=az+c and a≠1, the fixed point is c/(1−a).

Sources: **besser**, Corollaries 3.2–3.3 and Proposition 3.4, pp. 8–9: Constructs unique fixed paths, their composition and analytic transport.; **bdmtv**, Section 5.2.1, equations (39)–(41), p. 921: Uses the canonical global continuation to interpret word-valued path transport.

### Word coordinates and global transport — `word_path_transport`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/word-path-bridge`; comparison.

In the affine universal connection and its proper extendable quotient, the tensor path p_φ(a,c) corresponds under finite-path-module and affine trivialization to the truncated word element I(a,c)=1+Σ_(0<|w|≤n)(∫_a^c w)w, with the outermost integral matching left-prepending. For endpoints in one residue disc the coefficients are exactly the imported L1 local iterated integrals. For endpoints in different discs they are the imported Coleman coefficients selected by the canonical Frobenius path. Consequently the two-sided transport of a finite path module is v↦I(x_0,x) v I(b,b_0). This map intertwines the endpoint Frobenius operators. The local coefficient formula and the global Frobenius identification are separate dependencies.

Hypotheses: Good-reduction compactification, affine open, chosen H^1 forms and consistent word convention. Global Coleman realization and Frobenius-normalized continuation imported from L1.

Construction or proof:

1. Identify a horizontal solution of affine-universal with its coefficient recursion; imported local word expansions satisfy the recursion and initial value, so agree on each disc.
2. For cross-disc endpoints use canonical-frobenius-path. Its uniqueness and the L1 Frobenius Coleman realization identify the global solution; local integration alone cannot prove this.
3. Apply affine-composition to the two endpoint transports to obtain the ordered word product, and pass to the proper quotient if appropriate.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/affine-composition`, `AnabelianGeometryAndNonabelianChabauty:NC.2/canonical-frobenius-path`, `AnabelianGeometryAndNonabelianChabauty:NC.2/path-frobenius`, `AnabelianGeometryAndNonabelianChabauty:NC.2/proper-maximal-quotient`, `ColemanIntegration:L1/word-algebra-local-expansion`, `ColemanIntegration:L1/word-algebra-frobenius`, `ColemanIntegration:L1/coleman-realization`.

Acceptance: I(a,a)=1 and I(c,d)I(a,c)=I(a,d), including cross-disc endpoints under the global hypothesis. At one generator and length one, transport is 1+(∫_a^cω)T. At a noncommutative length-two word the order distinguishes I(x_0,x)vI(b,b_0) from a formula with reversed factors.

Sources: **bdmtv**, Section 5.2.1, equations (39)–(41), p. 921: Identifies word-valued transport with universal path coordinates.; **besser**, Corollaries 3.2–3.3, pp. 8–9: Provides the global Frobenius-fixed path needed across discs.

### Crystalline coordinate path comparison — `crystalline_path_coordinates`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/crystalline-path-coordinates`; theorem.

Let (Xcal,Dcal) be a smooth proper good-reduction pair over W(F_q), with Dcal a relative finite étale divisor, and let b,x be integral sections of Ycal=Xcal−Dcal. For the geometric unipotent étale path scheme P_et(b,x), O(P_et) is an ind-crystalline G_K0-representation. There is a canonical comparison D_cris(O(P_et))≅O(P_rig(b_bar,x_bar)) and, after the rigid/de Rham identification, its scalar extension is O(P_dR(b,x)). It is compatible with Frobenius, the Hodge filtration after de Rham extension, tensor structures, endpoint composition and the coordinate coactions; at b=x it is a Hopf-algebra comparison. Every finite-dimensional Galois-stable subspace occurring in the coordinate union is crystalline. This is a nonlinear geometric comparison; the ordinary comparison for H^1 alone does not imply it.

Hypotheses: Unramified K_0=Frac W(F_q), smooth proper model and relative smooth boundary, integral endpoints. Olsson’s relative setup is specialized to the unit local system/isocrystal: trivial reductive hull and zero, hence nilpotent, local monodromy. Filtered compatibility uses the associated filtered crystalline objects, not a Frobenius-preserved Hodge filtration.

Construction or proof:

1. Apply the unit specialization of Olsson’s pointed schematic comparison, obtained from the multiplicative crystalline/étale cochain comparison over the enlarged crystalline period ring. The group/path comparison is its degree-zero homotopy consequence.
2. Use Olsson’s finite Galois-stable coordinate-piece argument and descent from the enlarged ring to B_cris. The admissibility/subspace lemmas ensure genuine continuous crystalline finite pieces.
3. Use tensor compatibility to identify coordinate coactions and endpoint composition; rigid/de Rham evaluation identifies the endpoint Frobenius. Filtered association supplies strict de Rham compatibility. The missing general multiplicative cochain comparison input is recorded explicitly as a gap, rather than replaced by H^1 comparison.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/etale-galois`, `AnabelianGeometryAndNonabelianChabauty:NC.2/tensor-paths`, `AnabelianGeometryAndNonabelianChabauty:NC.2/berthelot-ogus`, `AnabelianGeometryAndNonabelianChabauty:NC.2/path-frobenius`, `AnabelianGeometryAndNonabelianChabauty:NC.2/filtered-path`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `CohomologyComparisons:CP.2`.

Acceptance: For b=x the comparison respects augmentation, multiplication and coproduct. For the unit coordinate subspace it is the usual comparison of Q_p with K_0.

Sources: **olsson**, Author manuscript of 24 March 2008, §§1.5–1.11, pp. 4–6; §§8.27–8.32, pp. 83–85; Sub-Lemma 7.19, pp. 69–70; Appendix D, Theorem D.3, p. 132: The path-coordinate comparison and finite ind-crystalline pieces are stated and derived here; manuscript pagination is distinguished from the 2011 Memoirs edition.; **bdii**, Lemma 6.1 and proof, §6.2, p. 29 of the author manuscript: Explains the filtered coordinate algebra comparison and how finite path objects follow.; **kim**, Section 2, pp. 116–119: Describes B_dR path comparison, its filtration and coordinate compatibility.

### Finite crystalline path comparison — `finite_path_crystalline_comparison`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-comparison`; comparison.

Under crystalline-path-coordinates, each finite M_n^et(b,x) is crystalline and D_cris(M_n^et(b,x))≅M_n^rig(b_bar,x_bar); identifying with the de Rham fibre gives a filtered Frobenius comparison after scalar extension. The comparisons commute with length transitions, bilinear composition and the source algebra action. On grade n they make the diagram from D_cris((H^1_et∨)^⊗n)≅(H^1_dR∨)^⊗n to the corresponding quotient length grades commute; a proper curve’s grade is not asserted to equal the entire tensor power. For finite ramified extensions K/K_0 of an existing good-reduction pair, D_cris takes values over K_0 and D_dR over K; base change of the established crystalline data supplies the K version. No new ramified-model comparison is inferred without a descent theorem.

Hypotheses: Hypotheses of crystalline-path-coordinates; finite path modules identified by universal evaluation. For the base-change clause, the model and endpoints descend to the displayed unramified pair.

Construction or proof:

1. Identify O(P_et) with the union of M_n^et∨, using length-algebra and finite-path-module. Each finite dual is a Galois-stable crystalline subobject of the ind-coordinate ring.
2. Use exact tensor duality of D_cris on crystalline representations to dualize the finite coordinate comparison. Compatibility with augmentation and coactions identifies the precise universal length piece, not just a vector space with matching dimension.
3. Use H^1 comparison on the augmentation generator and tensor exactness on its quotient grades. Extend coefficients along the imported period-functor base change for models that descend.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/crystalline-path-coordinates`, `AnabelianGeometryAndNonabelianChabauty:NC.2/length-algebra`, `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-module`, `AnabelianGeometryAndNonabelianChabauty:NC.2/filtered-path`, `AnabelianGeometryAndNonabelianChabauty:NC.2/path-frobenius`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`.

Acceptance: At n=0 this is the unit comparison; at n=1 its nontrivial grade is the dual H^1 comparison. At proper genus g and n=2 the comparison carries the cup-product quotient relation; it does not remove that relation.

Sources: **bdmtv**, Proof of Lemma 5.4, pp. 923–924: Compares the finite path modules as filtered Frobenius objects and spells out the graded quotient diagram.; **bdii**, Lemma 6.1 and proof, p. 29 of the author manuscript: Derives finite crystalline paths from Olsson’s ind-coordinate theorem, rather than assuming extension closure implies crystallinity.; **kim**, Section 2, pp. 116–119: Makes the finite length and filtration compatibility explicit.

### Depth one and the Jacobian — `depth_one_jacobian`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/depth-one-jacobian`; comparison.

For a smooth proper geometrically connected curve X/k with rational b and Jacobian J, the Abel–Jacobi morphism a_b:X→J induces canonical abelian realization identifications U_et⟨1⟩≅V_pJ as an additive group with Galois action, and U_dR⟨1⟩≅H^1_dR(X)∨≅H^1_dR(J)∨ as additive filtered groups. Their good-reduction comparison is the ordinary Jacobian Tate-module/de Rham comparison. At a proper local good-reduction field, F^0 H^1_dR(X)∨=ann H^0(X,Ω¹), and the quotient by F^0 is Lie(J). P_et⟨1⟩(b,x) is the rational Kummer torsor for [x−b]∈J(k), and the de Rham linear path periods are the ordinary integrals of one-forms. For an open curve, H^1 has additional boundary directions and the corresponding generalized Jacobian replaces J.

Hypotheses: Proper smooth geometrically connected curve, rational b; coefficient p in the étale realization. Good reduction is required only for crystalline comparison and the local filtered statement. The Jacobian and Abel–Jacobi construction are imported from JacobianChallenge.

Construction or proof:

1. The first augmentation/Lie graded piece is Ext^1(1,1)∨=H^1∨, so central depth one is its vector group.
2. Import Abel–Jacobi pullback on H^1 and the Tate-module identification for the Jacobian. Dualize with the same covariance to get the group comparison and identify the abelianized endpoint torsor with the Kummer torsor.
3. Apply the linear abelian-scheme comparison and the dual Hodge filtration. The annihilator description gives Lie(J) as the quotient; integration on linear paths is already supplied by Coleman L1.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/central-quotients`, `AnabelianGeometryAndNonabelianChabauty:NC.2/etale-galois`, `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-path-comparison`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`, `PadicHodgeTheory:R06.5/abelian-scheme-dcris`, `ColemanIntegration:L1/coleman-realization`.

Acceptance: For a genus-g proper curve the depth-one vector group has dimension 2g and its F^0 has dimension g. For P¹ the proper depth-one group is trivial; puncturing twice gives the one-dimensional boundary realization of G_m. For an elliptic curve with origin b, the Abel–Jacobi map is the identity, and the depth-one torsor is its usual rational Kummer torsor.

Sources: **kim**, Introduction, pp. 93–95; Section 1, pp. 100–104: The first central quotient is H^1∨ and gives the ordinary Albanese/Chabauty realization.; **bdmtv**, Section 2.1, pp. 896–898; proof of Lemma 5.4, pp. 923–924: Uses V_pJ and its dual de Rham Hodge realization in the unipotent path tower.

### Finite covers are not unipotent points — `unipotent_loses_finite_covers`

Node `AnabelianGeometryAndNonabelianChabauty:NC.2/finite-cover-boundary`; theorem.

The geometric pro-unipotent Q_p group does not recover the full profinite fundamental group or all finite étale covers. In characteristic zero, G_m has nontrivial finite étale covers t↦t^m for m>1, while its de Rham unipotent group is G_a and its geometric Q_p-unipotent étale realization is the additive Tate realization Q_p(1). The additive rational point group is uniquely m-divisible for each m>0 and has no nontrivial finite abstract group quotient. It therefore cannot replace the profinite finite-cover classifier. A finite-rank unipotent representation and a finite covering set are different objects.

Hypotheses: Geometric characteristic-zero G_m and Q_p coefficients. No comparison between realisations is used without its coefficient extension.

Construction or proof:

1. Apply affine-universality to the one-generator H^1 of G_m, or the continuous representation equivalence to its procyclic geometric p-adic monodromy, to obtain the additive unipotent realization.
2. Use the imported finite-cover theory to exhibit the degree-m étale power map.
3. Any finite quotient of a divisible abelian group is divisible, and the only finite divisible abelian group is trivial. The full geometric profinite group has the displayed nontrivial quotient, so its finite-cover information cannot be reconstructed from the additive Q_p points.

Dependencies: `AnabelianGeometryAndNonabelianChabauty:NC.2/affine-universality`, `AnabelianGeometryAndNonabelianChabauty:NC.2/etale-galois`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers`, `AnabelianGeometryAndNonabelianChabauty:NC.0/arithmetic-geometric-paths`.

Acceptance: The cover t↦t² remains nontrivial even though the additive Q_p point group has no quotient of order two. No statement that all rational points of a pro-unipotent group determine all finite covers is admitted.

Sources: **kim**, Introduction, pp. 90–94; Section 1, Lemma 3, pp. 108–110: Distinguishes profinite and unipotent invariants and supplies the one-generator affine realization.

## Routed obligations and corrected source statements

The 17 BDMTV obligations have separate destinations. `/58` supplies the local coefficient expansion; `/93` needs the global fixed-path bridge in addition to that expansion. The packet's source route records preserve their full extraction identifiers.

| Routed item | Published locator | NC.2 destination |
| --- | --- | --- |
| `40` | Published §4.2, (21), p.910 | `affine-universal` |
| `41` | Published Theorem 4.2, p.910 (arXiv v1 Theorem 4.1) | `affine-universality` |
| `42` | Published (22)–(24), Lemma 4.3, p.911 | `affine-composition` |
| `43` | Published Corollary 4.4, pp.911–912 | `proper-maximal-quotient` |
| `44` | Published §4.3, p.912 | `filtered-path`, `filtered-extension` |
| `45` | Published Theorem 4.5, Remark 4.6, pp.912–913 (arXiv v1 Theorem 4.4) | `hadian-filtration` |
| `54` | Published §5.1, (37), pp.918–919 | `realization-categories`, `rigid-frobenius-equivalence` |
| `55` | Published Lemma 5.2, (38), p.919 | `frobenius-normalization` |
| `56` | Published Theorem 5.3, p.920 (arXiv v1 Theorem A.7) | `berthelot-ogus` |
| `57` | Published §5.2, (42), pp.920–921 | `path-frobenius` |
| `58` | Published §5.2.1, (40), p.921 (arXiv v1 §5.1, (20)) | Import `ColemanIntegration:L1/word-algebra-local-expansion` |
| `63` | Published proof of Lemma 5.4, p.923 (arXiv v1 Theorem A.8) | `crystalline-path-coordinates`, `finite-path-comparison` |
| `67` | Published §A.1, Definition A.1, pp.934–935 | `unipotent-length`, `invariant-vector-criterion`, `length-algebra` |
| `68` | Published Definition A.2, p.935 | `universal-pointed` |
| `69` | Published Lemma A.3, p.935 | `universal-object-existence` |
| `70` | Published §A.1.2, Lemma A.4, pp.936–937 | `finite-path-module` |
| `93` | Published §5.2.1, (39),(41), p.921; Lemma 4.3 p.910; Theorem 5.3 pp.919–920; Besser, arXiv:math/0011269, Theorem 3.1 and Corollaries 3.2–3.3, pp.7–9 | `canonical-frobenius-path`, `word-path-bridge` |

The inherited E9 correction to BDMTV Definition A.2, p. 935, requires uniqueness of a pointed morphism. The pointed pair (k²,(1,0)) shows that existence alone is insufficient. E10 corrects the invariant-vector quantifier in Definition A.1, p. 934, by excluding zero. E6 corrects the input in Theorem 4.2, p. 910, to a fibre vector: a nonconstant global section of the unit cannot be the image of 1 under a horizontal endomorphism. These inherited corrections are applied throughout; this part makes no new published-erratum claim. Inherited E1 corrects the excessive final differential index in equation (40), p. 921: the alphabet has exactly m=2g+d−1 generators on an affine genus-g curve with d>0 boundary points, indexed from zero to m−1. This is the same alphabet as §4.1 and the universal connection.

## Supplier contracts and explicit gaps

There are seven export requests, each attached to its affected targets in the packet.

1. `SchemeAndStackFoundations:SF.0`: Resolve the atlas snapshot to the already existing current TauCetiRoadmap AlgebraicVectorBundles L0/L0A: finite locally free sheaves, tensor/dual, exact fibre restriction and monoidal pullback, used as inputs to connections. This is a catalogue/export request, not a request to reconstruct vector bundles. That upstream roadmap is the mathematical owner; its current README and Suggested.lean were read.
2. `SchemeAndStackFoundations:SF.2`: Zariski Čech/hypercohomology of the algebraic de Rham complex, Ext^1 of integrable connections as H^1, affine coherent H^1 vanishing for splitting unipotent bundles, and finite-dimensional H^1_dR of a smooth characteristic-zero curve. Provide actual complexes and pullback maps.
3. `tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical`: Characteristic-zero smooth unipotent algebraic groups and finite-dimensional nilpotent Lie algebras: polynomial exponential/logarithm equivalence, Lie-compatible closed normal subgroups and fpqc quotients, together with passage to finitely generated pronilpotent inverse limits. This is the algebraic unipotent input; the real LieGroups roadmap is not a supplier.
4. `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`: Use the existing JacobianChallenge coherent cohomology and Hodge descriptions on a smooth proper genus-g curve to identify H^1_dR dimension 2g and Fil^1=H^0(Ω¹). No Riemann–Roch or Jacobian is reconstructed here.
5. `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`: The Jacobian Tate module identifies covariantly with H^1_et(X_bar,Q_p) dual and its de Rham realization with H^1_dR(X) dual, with good-reduction abelian comparison and Lie quotient conventions.
6. `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`: The existing pointed Abel–Jacobi map induces the isomorphism on H^1 and carries the abelianized endpoint torsor to the rational Kummer torsor of [x−b]. Export this compatibility through SchemeAndStackFoundations SF.3 rather than reconstructing the Abel–Jacobi map.
7. `CohomologyComparisons:CP.2`: Supply the good-reduction rational crystalline/étale comparison as a multiplicative enhanced cochain map compatible with the augmentations at two integral points, Frobenius, Galois and the filtered de Rham comparison through CP.3. NC.2 needs the pointed unipotent consequence; a cup-product-compatible H^1 isomorphism is insufficient. The logarithmic open-pair extension is a separate gap below.

The two gaps are:

- **Pointed multiplicative comparison for the open pair.** Olsson’s unit-specialized theorem is the source of the stated nonlinear path comparison, with its precise good-reduction and nilpotent-boundary hypotheses read. A complete proof-chain audit of its augmented cochain/schematic-homotopy engine is not supplied by ordinary R06.5. CP.2 covers the proper multiplicative comparison requested above; the functorial logarithmic open-pair enhancement with both endpoint augmentations, and the passage to the ind-coordinate path comparison, remain to be decomposed against Olsson §§6–8. Do not replace this gap by extension closure of crystalline representations: arbitrary extensions of crystalline representations need not be crystalline.
- **Native geometric signatures at the pinned baseline.** The suggested file gives actual categorical length and universal-evaluation signatures, tensor path points, natural-transformation path modules, local connection operators and finite linear transport tests. The pinned baseline lacks native algebraic connection/isocrystal categories, geometric period objects and their comparison functors. Their scheme-level instantiations and all their geometric hypotheses are stated in the packet and reader. They are omitted, explicitly by name, from the compiled prototype rather than encoded as arbitrary propositions or assumed comparison fields. A follow-up should replace these omissions only when the supplier categories and period functors have actual native declarations.

The suggested file's actual native interfaces are categorical extension length, evaluation universality, tensor-natural point isomorphisms, abstract central indexing, two-sided augmentation quotients, finite natural-transformation vector spaces, truncated word operators, dual/image Hodge flags, kernels of connection operators and transported linear Frobenius. Its finite examples check these interfaces. Omission comments identify the missing geometric signatures by their reserved names; they introduce no axioms or empty geometric predicates. In particular, compilation of these interfaces does not certify the algebraic/rigid equivalence, Lang scheme inverse, Olsson path theorem or Jacobian comparison.

Acceptance of an implementation requires instantiating these interfaces in the genuine supplier categories and discharging the seven exports and the pointed multiplicative gap. It also requires the geometric tests above: proper genus-g dimension 2g with F⁰ dimension g, the proper P¹ zero group and open G_m Tate line, noncommuting word order, primitive coproduct failure at length one, nilpotent transport sign, Frobenius conjugation, all-grade Lang invertibility and strict filtered finite comparison. The atlas planets are Unipotent fundamental group, Unipotent path torsor, Universal unipotent object, Frobenius Lang theorem, Canonical Frobenius path and Crystalline path comparison.

## Bibliography and source versions

All source statements and proof outlines above are in this roadmap's own words. Public source checks were made on 11 October 2026; the packet records SHA-256 values. Published page numbers are used only for the published versions that were read. Manuscript page numbers below are intrinsic to those versions.

- **bdmtv**: J. S. Balakrishnan, N. Dogra, J. S. Müller, J. Tuitman and J. Vonk, [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf). Published Annals of Mathematics 189 (2019), 885–944. Read: §§1.2–1.4, pp. 889–891; §2.1, pp. 896–898; §§4.1–4.3, pp. 909–913; §§5.1–5.2, pp. 918–921; proof of Lemma 5.4, pp. 923–924; Appendix A, pp. 934–938.
- **kim**: Minhyong Kim, [The unipotent Albanese map and Selmer varieties for curves](https://ems.press/content/serial-article-files/41066?nt=1). Published Publications of RIMS 45 (2009), 89–133. Read: Introduction pp. 89–95; §1 pp. 96–111, including Lemmas 1–3 and their proofs; §2 pp. 114–119.
- **besser**: Amnon Besser, [Coleman integration using the Tannakian formalism](https://arxiv.org/pdf/math/0011269v1). arXiv:math/0011269v1 (2000), 24 pages; published version Math. Ann. 322 (2002), 19–48, not used for pagination. Read: §2, PDF pp. 3–7; §3, Theorems 3.1 and 3.6, Corollaries 3.2–3.3, Proposition 3.4 and the Lang proof, PDF pp. 7–12.
- **cls**: Bruno Chiarellotto and Bernard Le Stum, [F-isocristaux unipotents](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/7CD9502BBD4CC7DA8B364C29B371E0EF/S0010437X99000159a.pdf/div-class-title-f-isocristaux-unipotents-div.pdf). Published Compositio Mathematica 116 (1999), 81–110. Read: §2.3, Propositions 2.3.2–2.3.5, pp. 93–95; §2.4, Propositions 2.4.1–2.4.2 and proofs, pp. 95–97.
- **hadian**: Majid Hadian, [Motivic Fundamental Groups and Integral Points](https://d-nb.info/1007452307/34). 2010 thesis, public German National Library copy; this is not the 2011 published article. Read: §2.2, pp. 27–32, including the filtered extension complex, Proposition 2.2.7 and Remark 2.2.8. The free tensor calculation has nonempty-boundary hypotheses.
- **olsson**: Martin C. Olsson, [Towards non-abelian p-adic Hodge theory](https://drive.google.com/file/d/1oKDHVwLEl1xvwZ23l49R6qJrXjjCVNSg/view). Author manuscript dated 24 March 2008, author-hosted copy; published Memoirs AMS 210(990) (2011) has different pagination. Read: §§1.1–1.2, pp. 1–2; §§1.5–1.14, pp. 4–6, especially Theorems 1.7, 1.8 and 1.11; Sub-Lemma 7.19, pp. 69–70; §§8.27–8.32, pp. 83–85; Appendix D definitions and Theorem D.3, pp. 130–132. Author version found through the author’s Articles and Notes page; the path proof route is read, but its entire schematic homotopy construction is not audited.
- **bdii**: Jennifer S. Balakrishnan and Netan Dogra, [Quadratic Chabauty and rational points II: Generalised height functions on Selmer varieties](https://kclpure.kcl.ac.uk/ws/portalfiles/portal/149873897/QC2.pdf). Public 2019 author manuscript, 48 pages, repository copy; published IMRN 2021(15), 11923–12008; author-page numbers used. Read: §6.2, Lemma 6.1 and proof, pp. 29–30; §6.3, Definitions 6.2–6.3, Proposition 6.1, Lemma 6.4, Remarks 4–5, Corollary 6.2, pp. 30–31; §6.4, Theorem 6.3 and the universal word connection, pp. 31–32; §6.5.1, Lemma 6.7 and proof, p. 33.
