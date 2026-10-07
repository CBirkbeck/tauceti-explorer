# H.1 — Stable moduli and complex non-abelian Hodge theory

This part constructs the projective-base Betti, de Rham, Dolbeault and Hodge moduli problems and plans their comparison theorems. It supplies the complex geometric input consumed by H.5. Its scope is exactly `HodgeStructuresPartII:H.1`. The [packet](../packets/HodgeStructuresPartII--H.1.json) is a complete target-level planning pass: H.1 is **planned**, with the closure obligations below. Every mathematical node remains unchecked. A complete planning pass is not a closed prerequisite graph or a formalisation.

## Conventions and determinant data

Fix a smooth connected projective complex variety X, a complex base point x, a positive integer r and an ample polarization H. Write d=dim X. Use H to choose the Kähler form ω on Xᵃⁿ. The fundamental group Γ=π₁(Xᵃⁿ,x) is the ordinary path-based topological group. No étale fundamental group or p-adic coefficient system replaces it. Finite presentation of Γ is required to construct its finite-type representation scheme and remains a projective-topology supplier obligation.

Fix one finite-order character δ:Γ→ℂ×, meaning that one positive integer m satisfies δ(γ)ᵐ=1 for every γ. Individual finite-order values with no uniform exponent are not the definition. Its rank-one flat object is the algebraic torsion line with canonical finite-monodromy connection (L,∇L). The determinant data on the Higgs side is (L,0). On the parameter line the determinant is (L,λ∇L). It is an operator datum, so an isomorphism det E≃L of underlying line bundles alone is insufficient. For example, on a positive-genus curve (O,d+α) has underlying line O for a nonzero holomorphic one-form α but does not have the prescribed trivial flat determinant (O,d).

There are two family conventions that must be distinguished. The unrigidified determinant fibre allows, étale locally on a parameter scheme, a line pulled back from that parameter scheme. It has no global chosen determinant frame. The determinant-rigidified groupoid includes a determinant identification and requires arrows to preserve it. Their geometric isomorphism classes agree over ℂ, but the inertia of a stable object is ℂ× in the former and μr in the latter. Neither has thereby supplied a universal vector bundle on an unframed coarse scheme. The family determinant condition holds over the whole parameter scheme, including nilpotents. Checking it only on geometric fibres loses infinitesimal determinant directions: (O,d+εα) over ℂ[ε]/ε² has the prescribed geometric determinant but fails the prescribed family determinant.

The Dolbeault comparison component imposes c_i(E)=0 in H²ⁱ(Xᵃⁿ,ℚ) for every i>0. Its Hilbert polynomial is rP_O by Riemann–Roch. Neither a torsion determinant nor this Hilbert polynomial by itself states the higher-Chern-class condition. Rational coefficients matter: a flat bundle can retain integral torsion characteristic classes. The degree and ch₂ pairings used in the metric criterion are kept distinct from the all-Chern-zero component. In dimension one the ch₂ pairing is absent, rather than an expression with a negative power of ω. In dimension zero the point examples use the constant reduced Hilbert polynomial and invariant-subspace criterion directly; they invoke no negative-dimensional slope pairing.

Gieseker stability tests the eventual lexicographic inequality of reduced Hilbert polynomials of operator-invariant coherent subsheaves. Slope stability tests their H-degrees divided by ranks. Slope polystability means a direct sum of stable bundles of the same slope. The theorem identifying these stability conditions is specific to the Chern-zero component. A stable object has no proper nonzero invariant subobject of equal reduced polynomial. The underlying coherent sheaf can be unstable: forgetting its operator is not a stability-preserving operation.

## The spaces and comparisons

The word projective refers to X. The stable Betti scheme is an open subscheme of an affine reductive quotient and is quasi-affine. The de Rham, Dolbeault and Hodge schemes are generally quasi-projective. The proper algebraic morphism used here is the Hitchin map on semistable Higgs moduli; restricting its source to the stable open need not preserve properness.

| Space | Prescribed complex points | Structure used |
| --- | --- | --- |
| M_Bˢ(Γ,r,δ) | Irreducible representations of determinant δ up to intertwining isomorphism | Stable open in the affine invariant quotient |
| M_dRˢ(X,r,L,∇L) | Irreducible algebraic integrable connections with the fixed flat determinant | Quasi-projective coarse scheme |
| M_Dolˢ(X,r,L) | Stable all-Chern-zero Higgs bundles with determinant (L,0) | Quasi-projective coarse scheme |
| M_Hodˢ(X,r,L)→A¹ | Stable integrable relative λ-connections with determinant (L,λ∇L) | Relative coarse scheme with exact zero and one fibres |

The full coarse spaces identify semisimple or polystable representatives of Jordan classes. Their stable opens identify ordinary isomorphism classes. These are distinct from fine framed parameter schemes, whose functors retain a frame at x and have no frame-preserving automorphisms. The native set quotient of irreducible representations in the suggested file is only the set of classes; the scheme construction and its complex-point identification are separate declarations.

Riemann–Hilbert is a complex analytic isomorphism between the Betti and de Rham spaces. Its proof compares framed functors over nonreduced analytic bases and then passes through analytic categorical quotients. A bijection on ℂ-points cannot prove it. The harmonic correspondence first constructs an equivalence of complex-linear categories on a compact Kähler base, using Higgs HYM metrics, curvature vanishing, Corlette metrics and coefficient Kähler identities. Gauge compactness then proves the coarse non-abelian Hodge homeomorphism. The global regularity asserted here is that homeomorphism; the precise real-analytic enhancement in the EG20 routed diagram remains G10.

The Hodge parameter remembers its relative Leibniz coefficient. Multiplying D by t also multiplies λ by t. Dividing by λ gives an algebraic product with de Rham moduli over G_m. At zero the fixed-X Hodge scheme is étale locally a product with the Dolbeault scheme, proved through trace-free harmonic deformation complexes and Artin approximation. This preserves local nonreduced structure and implies flatness. It gives neither a global product over A¹ nor the varying-X/S conjecture. The global splitting of the rigid quasi-finite locus belongs to H.5.

## Dependency organisation

H.0 owns preconnections, their exterior extension, intrinsic curvature and the symmetric-algebra description of Higgs actions. This part imports those exact nodes. Its remaining global sheaf/Rees/PBW and determinant needs are an H.0 request, not another affine definition. AlgebraicModuliForArithmeticGeometry owns generic parameter schemes, Quot/Hom, reductive quotient exports and formal-to-algebraic comparisons. ComplexComparisonPartII owns coherent analytification and GAGA; its finer analytification node is cited where applicable. EnhancedDerivedSheaves E1 supplies underived sheaf tensor and exterior carriers; its derived results alone do not specify a classical vector bundle with an operator. SchemeAndStackFoundations SF.5 and MotivesAndAlgebraicCycles MC.2 supply the algebraic Chern and realization sides.

The upstream UniversalCovers, PDE and DGAInfinity roadmaps are imported unchanged. Finite presentation/Lefschetz, nonlinear bundle heat flow/gauge compactness and geometric dg Lie deformation need the Part II extensions proposed below. The dependency graph separates the metric existence argument from the algebraic moduli construction. The source-specific boundedness and operator GIT theorem precede coarse moduli, and the fine frame construction precedes analytic Riemann–Hilbert. The Higgs local-freeness theorem uses restriction, finite extension completion and the harmonic comparison on bundles; it is not used as a premise of that bundle comparison.

The declaration register below gives every target and key supporting construction at target level. Proof sketches retain smaller source steps without subdividing them into artificial lemma nodes. Each definition or construction has its use-derived API and meaningful test obligations. The tests are mathematical specifications; only the eight native Betti examples can currently be stated in the suggested file. None is claimed executed as a proved test.

## Declaration register

### Stable representations with fixed determinant

**Definition:** `BettiStableRepresentation`. Node: `HodgeStructuresPartII:H.1/betti-stable-representation`.

For any group Γ, natural rank r and character δ:Γ→ℂ×, a stable fixed-determinant representation is a native homomorphism ρ:Γ→GL(Fin r,ℂ) such that det∘ρ=δ and its associated Mathlib Representation on (Fin r→ℂ) is irreducible. Its isomorphisms are the existing Representation.Equiv. No frame of the determinant line is part of an object and no topology or scheme is encoded by this carrier.

**Hypotheses.** Γ is a group; r is a natural number; δ is an arbitrary complex unit-valued character. Finite order is required only for the geometric fixed-determinant component.

**Proof or construction.**

1. Compose the matrix action with toLin and Units.coeHom; impose determinant equality and the existing nonzero irreducibility predicate.
2. Use native intertwining linear equivalences for isomorphisms, not equality of chosen matrices.

**Direct dependencies.** `mathlib:Representation`, `mathlib:Representation.IsIrreducible`, `mathlib:Representation.Equiv`, `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.det`, `mathlib:Matrix.GeneralLinearGroup.toLin`, `mathlib:Units.coeHom`.

**Uses.**

- S94II Proposition 6.1; EG20 §2.1: Identifies stable geometric points and removes reducible representations before the geometric quotient.
- HodgeStructuresPartII:H.5: Fixed determinant and irreducibility are retained when arithmetic models and rigid points are studied.

**API.**

- `BettiStableRepresentation.toRepresentation` (coercion): Associate the existing Representation ℂ Γ (Fin r→ℂ) by the matrix-to-linear equivalence and inclusion of units.
- `BettiStableRepresentation.det_eq` (characterisation): For every γ, det(ρ(γ))=δ(γ).
- `BettiStableRepresentation.ext` (extensionality): Two stable representations are equal if their native matrix-valued monoid homomorphisms are equal.
- `BettiStableRepresentation.rankOne` (constructor): For r=1, use the scalar homomorphism composed with δ to construct an irreducible representation of determinant δ.
- `BettiStableRepresentation.iso_iff_conjugate` (compatibility): For ρ and σ of equal rank, Nonempty(Representation.Equiv ρ σ) iff there is g in GLr with σ(γ)=gρ(γ)g⁻¹ for every γ.

**Unit-test obligations.**

- `BettiStableRepresentation.rankOne_det` (computation): The determinant of rankOne δ evaluated at γ is δ(γ).
- `BettiStableRepresentation.rankZero_empty` (degenerate): For every δ, the stable representation type in rank zero is empty.
- `BettiStableRepresentation.irreducible_native` (compatibility): The associated native Representation of every stable object satisfies Mathlib Representation.IsIrreducible.
- `BettiStableRepresentation.trivial_rankTwo_excluded` (non-example): There is no stable fixed-determinant object whose underlying rank-two monoid homomorphism is the trivial one.

**Acceptance.** Rank-one objects exist for every δ; rank-zero stable objects do not exist. An underlying trivial representation of rank two is excluded.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §6, pp.11–12, representation scheme and Proposition 6.1. This is the stable complex-point object, before taking the coarse algebraic quotient.

### Isomorphism classes of stable representations

**Construction:** `BettiStableClasses`. Node: `HodgeStructuresPartII:H.1/betti-stable-classes`.

Take the set quotient of BettiStableRepresentation(Γ,r,δ) by existence of a native intertwining linear equivalence. This is the set of stable representation isomorphism classes. The identification with complex points of a coarse scheme is a separate theorem; this set quotient supplies neither an algebraic structure nor a nonreduced structure.

**Hypotheses.** Γ is a group; r is a natural number; δ:Γ→ℂ×.

**Proof or construction.**

1. Reflexivity, symmetry and transitivity are supplied by native Representation.Equiv.refl, symm and trans.
2. Apply the core quotient construction and expose its equality and invariant-function universal properties.

**Direct dependencies.** `HodgeStructuresPartII:H.1/betti-stable-representation`, `mathlib:Representation.Equiv`.

**Uses.**

- betti-coarse below; S94II Proposition 6.1: Supplies the exact complex-point identification of the stable coarse Betti scheme.

**API.**

- `BettiStableClasses.mk` (constructor): Send a stable representation to its isomorphism class.
- `BettiStableClasses.mk_eq_mk` (characterisation): Classes of ρ and σ are equal iff there exists a native intertwining linear equivalence ρ≃σ.
- `BettiStableClasses.lift` (universal-property): Every function on stable representations constant on intertwining isomorphisms factors uniquely through the quotient.
- `BettiStableClasses.lift_mk` (simp): Evaluate lift f on mk ρ to obtain f ρ.
- `BettiStableClasses.lift_unique` (universal-property): Two quotient functions that agree on every mk ρ agree.
- `BettiStableClasses.rankOne_equiv` (equivalence): For fixed δ, BettiStableClasses(Γ,1,δ) is equivalent to a one-element type.

**Unit-test obligations.**

- `BettiStableClasses.rankOne_subsingleton` (computation): Any two rank-one fixed-δ classes coincide.
- `BettiStableClasses.rankZero_empty` (degenerate): BettiStableClasses(Γ,0,δ) is empty.
- `BettiStableClasses.native_iso_identification` (compatibility): For every native intertwining equivalence of stable objects, the class map identifies them.
- `BettiStableClasses.abelian_rankTwo_empty` (non-example): If Γ is commutative, BettiStableClasses(Γ,2,δ) is empty.

**Acceptance.** The quotient is a singleton in rank one for a fixed δ. This construction never claims to represent families.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §6, Proposition 6.1, pp.11–12. Restrict Jordan classes to irreducible representations, where they are ordinary isomorphism classes.

### Scalar stabilizers and determinant rigidification

**Lemma:** `stable_automorphisms`. Node: `HodgeStructuresPartII:H.1/stable-automorphisms`.

An irreducible rank-r complex representation has automorphism group ℂ× acting by scalar matrices. A p-stable parameter-connection bundle also has only scalar endomorphisms and the same scalar automorphism group, by the projective operator-stability argument. If an isomorphism det(E)≃L is included in the object and preserved by arrows, its automorphism group is μr, because det(u·Id)=uʳ. The unrigidified fixed-determinant coarse fibre and determinant-rigidified stack have the same geometric isomorphism classes but different inertia; neither assertion gives a universal vector bundle on the coarse scheme.

**Proof or construction.**

1. Apply the native Schur lemma to the coordinate Representation and restrict the scalar endomorphisms to the invertible ones.
2. Compute the scalar action on the top exterior power; preserving the specified determinant isomorphism imposes uʳ=1.
3. For a p-stable operator bundle, a nonzero endomorphism has full-rank image by stability and is invertible; projectivity makes the endomorphism algebra finite-dimensional over C, so this division algebra is C. This is the read scalar calculation on Simpson I p.90.

**Direct dependencies.** `HodgeStructuresPartII:H.1/betti-stable-representation`, `mathlib:Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed`, `mathlib:Matrix.GeneralLinearGroup.scalar`, `mathlib:Matrix.GeneralLinearGroup.det_scalar`, `HodgeStructuresPartII:H.1/stability`, `AlgebraicModuliForArithmeticGeometry:R09.2`.


**Acceptance.** For rank one, determinant rigidification kills all automorphisms. Without a chosen determinant trivialization, scalar automorphisms remain.

**Source passages.** [S94I](https://www.numdam.org/item/PMIHES_1994__79__47_0.pdf), §3, scalar endomorphism argument, p.90; §4, Theorem 4.7(4), p.104. The source explains scalar endomorphisms and the base-line ambiguity; determinant rigidification additionally uses the native scalar determinant formula.

### Finite characters and torsion determinant lines

**Comparison:** `torsion_determinant_dictionary`. Node: `HodgeStructuresPartII:H.1/torsion-determinant-dictionary`.

Finite-order characters δ of π₁(Xᵃⁿ,x) correspond to algebraic torsion line bundles L equipped with the canonical finite-monodromy flat connection ∇L; their harmonic Higgs object is (L,0). A torsion trivialization Lᵐ≃O induces ∇L uniquely by requiring its mth tensor connection to be d; the induced connection is independent of rescaling that trivialization by a nonzero constant. Merely requiring det(E)≃L as an algebraic line bundle does not fix det(∇).

**Proof or construction.**

1. Descend the trivial line from the universal cover with character δ; finite monodromy makes its mth tensor power canonically flat-trivial.
2. Algebraize the holomorphic line and its connection by projective coherent GAGA and its full faithfulness.
3. Conversely construct local flat frames from an mth-root trivialization; their transitions lie in μm.
4. The rank-one unitary harmonic metric has zero Higgs field; the global determinant operator is an H.0 supplier obligation, not supplied by the coordinate result alone.

**Direct dependencies.** `mathlib:isOfFinOrder_iff_pow_eq_one`, `ComplexComparisonPartII:C2`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-0-port-the-foundations-into-tauceti`, `HodgeStructuresPartII:H.0/determinant-coordinate`.


**Acceptance.** For δ=1 the determinant object is (O,d), respectively (O,0). On a positive-genus curve, d+α on O for nonzero holomorphic α is not the fixed trivial flat determinant.

**Source passages.** [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), Introduction, p.103, and §2.1, pp.108–109. The determinant is a rank-one flat connection on the de Rham side and (L,0) on the Higgs side.; [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §1, rank-one example, p.21. Zero Higgs fields correspond to unitary characters; finite-order characters are unitary.

### Stability for invariant coherent subsheaves

**Definition:** `IsStableParameterConnection`. Node: `HodgeStructuresPartII:H.1/stability`.

For a torsion-free coherent integrable λ-connection E on X, test only nonzero proper coherent subsheaves F preserved by the operator. Gieseker semistability means P_F/rk(F)≤P_E/rk(E) for all sufficiently large integers; stability uses strict inequality. Slope semistability/stability replaces reduced Hilbert polynomials by μ_H(F)=c₁(F)·H^(d−1)/rk(F). Polystability is a direct sum of slope-stable bundles of the same slope. Stability is a predicate on the operator object, not on its underlying coherent sheaf alone.

**Proof or construction.**

1. Use the generic Hilbert polynomial and degree of coherent sheaves. Define operator-invariant subsheaves through the induced map into the quotient tensored with Ω¹.
2. Saturation is legitimate because Ω¹ is locally free and the operator descends on the torsion-free quotient. The operator version of standard coherent-sheaf stability is kept separate from stability of the underlying sheaf.

**Direct dependencies.** `HodgeStructuresPartII:H.0/intrinsic-preconnection`, `HodgeStructuresPartII:H.0/intrinsic-curvature`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `SchemeAndStackFoundations:SF.5`.

**Uses.**

- S94I Theorem 4.7; S92 Theorem 1: Separates GIT stability from the metric stability hypothesis and identifies the stable open locus.
- HodgeStructuresPartII:H.5: Rigidity is tested inside stable fixed-data moduli, not all coherent sheaves.

**API.**

- `IsStableParameterConnection.invariant_iff` (characterisation): F is invariant iff E→E⊗Ω¹→(E/F)⊗Ω¹ vanishes on F.
- `IsStableParameterConnection.iso_iff` (compatibility): Stability and semistability are invariant under operator-compatible vector-bundle isomorphism.
- `IsStableParameterConnection.scale_unit_iff` (relation): Multiplication of an operator and λ by the same nonzero scalar preserves its invariant subsheaves and its stability.
- `IsStableParameterConnection.rankOne` (example): Every line bundle with an integrable parameter operator is stable; rank zero is excluded from the positive-rank moduli problem.

**Unit-test obligations.**

- `IsStableParameterConnection.line_stable` (computation): The prescribed rank-one determinant object (L,λ∇L) is stable for every λ.
- `IsStableParameterConnection.zero_excluded` (degenerate): The zero coherent sheaf does not satisfy the positive-rank stability predicate.
- `IsStableParameterConnection.zero_higgs_iff` (compatibility): Stability of (E,0) is precisely usual coherent-sheaf stability of E with the same polarization and reduced Hilbert polynomial.
- `IsStableParameterConnection.trivial_rankTwo_excluded` (non-example): (O⊕O,0) is semistable but not stable; either summand is an invariant subsheaf of equal slope and polynomial.

**Acceptance.** Compare p- and μ-stability only after the vanishing-Chern-class theorem below.

**Source passages.** [S94I](https://www.numdam.org/item/PMIHES_1994__79__47_0.pdf), §3, pp.88–89, definitions of p- and μ-stability. The invariant-submodule condition is applied to integrable parameter connections.; [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §1, pp.13–14. Slope-polystability is the metric existence hypothesis.

### Fixed-determinant parameter-connection families

**Definition:** `FixedDeterminantFamily`. Node: `HodgeStructuresPartII:H.1/parameter-families`.

For a finite-type complex scheme S with λ∈Γ(S,O_S), let E be a rank-r vector bundle on X×S and D:E→E⊗Ω¹_(X×S/S) a relative integrable λ-connection in the H.0 sense. Require every geometric fibre to be semistable (or stable for the stable subfunctor) with every rational Chern class zero. The determinant condition holds as a family over S, including its nilpotents: étale locally det(E,D) is isomorphic to (p_X*L,λ∇L) tensored with a line pulled back from S, with its relative coefficient-λ trivial operator. No global determinant frame is chosen. A separate determinant-rigidified version includes and preserves the identification. Arrows are operator-compatible bundle isomorphisms and pullback uses relative differentials. Equality of determinants only on geometric fibres is insufficient.

**Proof or construction.**

1. Import relative sheaf pullback, tensor and determinant, not just affine matrix operators.
2. Use the fixed rank, fibrewise Chern conditions and invariant-subobject stability to form the relevant groupoid stack over complex schemes.
3. Distinguish the fibre of the coarse determinant map from the groupoid with a chosen determinant isomorphism. Its scalar inertia has been computed separately.

**Direct dependencies.** `HodgeStructuresPartII:H.0/intrinsic-preconnection`, `HodgeStructuresPartII:H.0/exterior-extension`, `HodgeStructuresPartII:H.0/intrinsic-curvature`, `HodgeStructuresPartII:H.1/stability`, `HodgeStructuresPartII:H.1/torsion-determinant-dictionary`, `mathlib:SheafOfModules.IsLocallyFree`, `EnhancedDerivedSheaves:E1`, `ComplexComparisonPartII:C0`, `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.2`.

**Uses.**

- S96 Proposition 4.1; EG20 §4.2: Defines the moduli problem over A¹ and ensures that its zero and one fibres have the same determinant convention.
- HodgeStructuresPartII:H.5: Feeds formal thickenings and the relative quasi-finite locus without discarding nilpotents.

**API.**

- `FixedDeterminantFamily.pullback` (functoriality): For f:T→S, pull back E and D using Ω¹_(X×S/S)→Ω¹_(X×T/T); the parameter becomes f*λ. Pullback identity and composition are coherent.
- `FixedDeterminantFamily.fibre` (projection): At s:Spec ℂ→S obtain a rank-r integrable λ(s)-connection with the prescribed determinant, Chern classes and stability.
- `FixedDeterminantFamily.determinant` (compatibility): The global determinant operator restricts in a local frame to λd+tr(A), matching H.0/determinant-coordinate; at λ=0 its Higgs field is trace(D).
- `FixedDeterminantFamily.twist_from_base` (relation): Tensoring with the pullback of a line bundle on S preserves the fibrewise class; it changes a chosen determinant identification by its rth tensor power.

**Unit-test obligations.**

- `FixedDeterminantFamily.rankOne_class` (computation): Every rank-one fixed-determinant geometric fibre is isomorphic to (L,λ∇L).
- `FixedDeterminantFamily.zero_fibre` (degenerate): At λ=0 the fixed determinant is the trace-zero Higgs object (L,0).
- `FixedDeterminantFamily.one_fibre` (compatibility): At λ=1 the groupoid is the prescribed ordinary integrable-connection problem, with its flat determinant fixed.
- `FixedDeterminantFamily.absolute_derivative_excluded` (non-example): On X×A¹ the derivative dλ in Ω¹_(X×A¹/ℂ) is not an extra term in the relative integrability condition; using absolute forms gives a different problem.
- `FixedDeterminantFamily.geometric_determinant_nonexample` (non-example): For S=Spec(C[ε]/ε²), λ=1 and a nonzero holomorphic one-form α on a positive-genus projective curve, (O,d+εα) has the trivial determinant on every geometric fibre but fails the fixed family determinant (O,d).

**Acceptance.** The determinant datum is λ∇L at every parameter value. An Artinian base is retained, not replaced by its set of geometric points.

**Source passages.** [S94I](https://www.numdam.org/item/PMIHES_1994__79__47_0.pdf), §4, Theorem 4.7(1),(4), pp.104–105. Coarse universality and the base-line-bundle ambiguity are essential to the family convention.; [S96](https://arxiv.org/pdf/alg-geom/9604005), §4, p.18, relative λ-connection definition. Differentiation is relative to the parameter scheme, so λ is constant in the X direction.

### The fixed-determinant representation scheme

**Construction:** `BettiRepresentationScheme`. Node: `HodgeStructuresPartII:H.1/betti-framed`.

For a finitely presented group Γ and character δ, construct the affine finite-type complex representation scheme R_B(Γ,r,δ) representing R↦{ρ:Γ→GLr(R) | detρ=δ_R}. A choice of finite presentation realizes it by generator matrices, inverse determinant coordinates, relation equations and fixed determinant equations. Its irreducible locus R_Bˢ is open. For Γ=π₁(Xᵃⁿ,x), the framed local-system problem has this representation scheme; the existence of a finite presentation for this Γ is a separate topological input.

**Proof or construction.**

1. Use GLr as the open determinant-unit scheme, with its universal matrices; impose the finitely many presentation and determinant equations.
2. Recover the functor independently of the presentation by its universal property.
3. For each 0<k<r, use the projective Grassmannian incidence locus of invariant k-planes. Its proper image is closed; the finite union is the reducible locus.

**Direct dependencies.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.det`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `HodgeStructuresPartII:H.1/betti-stable-representation`.

**Uses.**

- S94II Proposition 6.1 and Theorem 7.1: Supplies the affine quotient presentation and the framed functor used by Riemann–Hilbert.

**API.**

- `BettiRepresentationScheme.points` (universal-property): Morphisms Spec R→R_B are naturally fixed-determinant matrix representations over each complex algebra R, with pullback by algebra homomorphisms.
- `BettiRepresentationScheme.conjugation` (structure): GLr acts by simultaneous conjugation of universal generator matrices; it preserves fixed determinant and the irreducible open.
- `BettiRepresentationScheme.presentation_independent` (equivalence): Two finite presentations yield canonically isomorphic representing schemes, carrying the same universal representation.
- `BettiRepresentationScheme.stable_open` (characterisation): A complex point belongs to R_Bˢ iff its native coordinate Representation is irreducible.

**Unit-test obligations.**

- `BettiRepresentationScheme.free_group` (computation): For the free group on s generators without fixing δ, the representing scheme is (GLr)ˢ; fixing δ cuts out their prescribed determinants.
- `BettiRepresentationScheme.trivial_group` (degenerate): For Γ=1 and δ=1 the representation scheme is one point, but its stable locus is empty for r>1.
- `BettiRepresentationScheme.native_points` (compatibility): Complex points of its stable open are precisely BettiStableRepresentation(Γ,r,δ).

**Acceptance.** All equations are valid on nonreduced coefficient rings, not merely on complex points.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §6, pp.11–12, construction before Proposition 6.1. The functor is represented by generator-and-relation matrix equations.

### Stable Betti coarse moduli

**Construction:** `BettiModuli`. Node: `HodgeStructuresPartII:H.1/betti-coarse`.

Let M_B(Γ,r,δ)=Spec(ℂ[R_B]^GLr) be the affine reductive GIT quotient. Its complex points are isomorphism classes of semisimple representations of determinant δ, equivalently Jordan equivalence classes of all representations. The stable open M_Bˢ has complex points exactly BettiStableClasses(Γ,r,δ); R_Bˢ→M_Bˢ is a geometric quotient. M_Bˢ is quasi-affine as an open subscheme of the affine quotient, and need not be projective.

**Proof or construction.**

1. Import finite generation of reductive invariants and the good-quotient universal property for this affine GLr action.
2. Identify closed orbits with semisimple representations and orbit-closure classes with semisimplification.
3. Restrict the quotient to the saturated irreducible open; retain the quotient scheme structure and the invariant-function universal property.

**Direct dependencies.** `HodgeStructuresPartII:H.1/betti-framed`, `HodgeStructuresPartII:H.1/betti-stable-classes`, `HodgeStructuresPartII:H.1/stable-automorphisms`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Uses.**

- EG20 §2.1; S94II §7: Provides stable algebraic Betti moduli and the analytic quotient for the comparison theorem.

**API.**

- `BettiModuli.quotient` (projection): The quotient morphism R_B→M_B is GLr-invariant and universal for invariant morphisms into complex schemes.
- `BettiModuli.stable_points` (equivalence): M_Bˢ(ℂ) is naturally equivalent to BettiStableClasses(Γ,r,δ).
- `BettiModuli.closed_orbit_iff` (characterisation): An orbit in R_B(ℂ) is closed iff its representation is semisimple.
- `BettiModuli.basepoint_change` (functoriality): A path between two base points induces an isomorphism of unframed coarse schemes; another path changes the framed map by inner conjugation and gives the same coarse map.

**Unit-test obligations.**

- `BettiModuli.rankOne_fixed` (computation): The rank-one fixed-character stable coarse scheme is Spec ℂ.
- `BettiModuli.trivial_group_stable_empty` (degenerate): For Γ=1 and r>1, M_Bˢ is empty although M_B contains the trivial semisimple representation.
- `BettiModuli.classes_compatibility` (compatibility): The image of ρ in M_Bˢ(ℂ) agrees with its BettiStableClasses quotient class.
- `BettiModuli.semisimplification_nonexample` (non-example): The nontrivial unipotent rank-two representation of ℤ is not a closed orbit but has the same coarse point as its split trivial semisimplification.

**Acceptance.** The unipotent rank-two representation of ℤ and its trivial semisimplification define the same coarse point; neither is stable. In rank one and fixed δ, M_Bˢ is a reduced point.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §6, Proposition 6.1, pp.11–12. The stable restriction changes Jordan classes to ordinary irreducible isomorphism classes.

**Atlas planet:** Betti moduli space.

### Bounded parameter-connection families

**Theorem:** `parameter_connection_boundedness`. Node: `HodgeStructuresPartII:H.1/operator-boundedness`.

For fixed X,H,r and Hilbert polynomial P, semistable coherent integrable λ-connections for λ∈A¹ form a bounded family of underlying coherent sheaves. There is a uniform twist N with higher cohomology vanishing and evaluation from H⁰(E(N))⊗O(−N) surjective, including arbitrary λ. Operator actions occupy a finite-type parameter scheme over the resulting Quot locus; the integrability and action relations are closed equations, and the stable locus is open.

**Proof or construction.**

1. Use Simpson’s filtration generated by the degree-one operator action to bound the maximal slope of the underlying sheaf by its average slope plus a rank-dependent constant. This works uniformly for the split almost-polynomial Rees algebra.
2. Import boundedness, Serre vanishing and relative Hom/Quot; impose the finitely many operator relations on the parameter locus.
3. Use the bounded invariant destabilizing quotients and proper parameter images to establish openness. The generic operator-algebra presentation required from H.0 is recorded explicitly.

**Direct dependencies.** `HodgeStructuresPartII:H.1/stability`, `HodgeStructuresPartII:H.1/parameter-families`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `HodgeStructuresPartII:H.0`.


**Acceptance.** A fixed Hilbert polynomial alone is not asserted to bound all vector bundles. The universal quotient sheaf is base-flat; this does not make its Quot parameter space flat over A¹.

**Source passages.** [S94I](https://www.numdam.org/item/PMIHES_1994__79__47_0.pdf), §3, Lemma 3.3 through Theorem 3.8, pp.90–96. These proofs supply the operator-specific boundedness step before invoking generic Quot and GIT.

### Operator GIT and Jordan classes

**Theorem:** `parameter_connection_git`. Node: `HodgeStructuresPartII:H.1/operator-git`.

For the split almost-polynomial operator algebras describing integrable λ-connections on fixed X over A¹, and P=rP_O, the bounded framed-section parameter scheme Q admits a relatively ample linearization and a quasi-projective good quotient. Its closed orbits are the direct sums of stable operator modules with reduced Hilbert polynomial P/r; quotient points are Jordan classes. The stable open universally corepresents stable families and admits universal bundles étale locally, up to tensoring by a base line. The statement is operator-specific; existence of generic reductive good quotients and Luna slices are imported.

**Proof or construction.**

1. Embed Q in the Quot scheme for the finite operator piece acting on a sufficiently large space of sections. The invariant-subsheaf slope estimate implies the Hilbert numerical semistability criterion for every point of Q.
2. Analyze a one-parameter limit by its saturated operator-invariant filtration; equality of reduced polynomials forces the limit to remain in Q. Hence Q is saturated and locally closed in the generic semistable quotient.
3. Import reductive GIT and use the extension family scaled to its associated graded to identify Jordan classes with orbit-closure classes. Scalar stabilizers on stable objects yield a free projective-linear action; import the étale slice/torsor theorem for local universality.

**Direct dependencies.** `HodgeStructuresPartII:H.1/operator-boundedness`, `HodgeStructuresPartII:H.1/stability`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `HodgeStructuresPartII:H.0`, `HodgeStructuresPartII:H.1/stable-automorphisms`.


**Acceptance.** The orbit of a nonsplit equal-slope extension degenerates to its graded split object. The operator quotient is quasi-projective; the projectivity theorem for ordinary semistable coherent sheaves is not transferred to it.

**Source passages.** [S94I](https://www.numdam.org/item/PMIHES_1994__79__47_0.pdf), §4, Lemmas 4.1–4.5, Corollary 4.6 and Theorem 4.7, pp.98–104; §1, proof of Theorem 1.21, pp.71–73. All operator-specific invariant-theory arguments and the delegated moduli-universality proof were inspected; generic reductive GIT and Luna remain supplier inputs.

### The vanishing-rational-Chern-class component

**Theorem:** `chern_zero_component`. Node: `HodgeStructuresPartII:H.1/chern-component`.

The Dolbeault comparison component is the union of connected components in the rank-r semistable Higgs moduli with c_i(E)=0 in H²ⁱ(Xᵃⁿ,ℚ) for every i>0. Its Hilbert polynomial is rP_O by Riemann–Roch. Rational Chern classes are locally constant in vector-bundle families on fixed X; impose their actual vanishing, not merely equality of Hilbert polynomials. Fixing torsion determinant forces rational c₁=0 but does not force higher c_i=0. A flat complex bundle has all rational Chern classes zero, while integral torsion classes can persist.

**Proof or construction.**

1. Import algebraic Chern classes, Betti realization and Riemann–Roch with its Todd normalization.
2. Use topological bundle homotopy along parameter paths for local constancy on fixed X.
3. For a flat connection, Chern–Weil forms vanish; preserve rational rather than integral coefficients. These general analytic characteristic-class bridges are recorded as an unresolved supplier gap.

**Direct dependencies.** `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.2`, `ComplexComparisonPartII:C5`, `HodgeStructuresPartII:H.1/parameter-families`.


**Acceptance.** On a curve, this component is exactly degree-zero Higgs moduli. The conditions c₁·H^(d−1)=0 and ch₂·H^(d−2)=0 used in the metric theorem are stated separately from the component definition.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §6, pp.16–17, definition of M_Dol and Proposition 6.6. The source explicitly imposes all rational Chern classes, in addition to the Hilbert polynomial.

### Harmonic bundle presentations

**Definition:** `HarmonicBundlePresentation`. Node: `HodgeStructuresPartII:H.1/harmonic-bundle`.

On Xᵃⁿ with the Kähler form determined by H, a harmonic presentation consists of a smooth complex rank-r bundle E, a holomorphic structure ∂̄_E, an integrable holomorphic Higgs field θ and a smooth positive Hermitian metric h such that D=∂_h+∂̄_E+θ+θ*_h is flat. Put D″=∂̄_E+θ and D′=∂_h+θ*_h. A morphism is a complex-linear smooth bundle map commuting with D′ and D″; it need not be unitary. Metrics are auxiliary choices, and forgetting them is treated by the correspondence theorem. For fixed determinant require its induced flat line to be (L,∇L) and its Higgs determinant to be (L,0).

**Proof or construction.**

1. Use smooth forms of all exterior degrees and the metric adjoint to build D′ and D″ with their graded Leibniz rules.
2. Holomorphic Higgs integrability gives (D″)²=0; the metric-adjoint equation gives (D′)²=0. Flatness says D′D″+D″D′=0.
3. Morphisms use these actual operators. No assertion of an algebraic or holomorphic dependence of h on a moduli parameter is built into the definition.

**Direct dependencies.** `HodgeStructuresPartII:H.0/intrinsic-curvature`, `ComplexComparisonPartII:C0`, `EnhancedDerivedSheaves:E1`.

**Uses.**

- S92 Theorem 1 and Corollary 1.3; S94II §7: Provides the common operator object for the category equivalence and compactness proof.

**API.**

- `HarmonicBundlePresentation.flat` (projection): Return the flat operator D=D′+D″.
- `HarmonicBundlePresentation.higgs` (projection): Return (E,∂̄_E,θ) with holomorphic Higgs integrability.
- `HarmonicBundlePresentation.tensor_dual` (compatibility): Tensor and dual of presentations agree with the H.0 operator constructions and preserve flatness; rank and determinant change by the ordinary tensor/dual formulas.
- `HarmonicBundlePresentation.pullback` (functoriality): A holomorphic pullback between smooth projective varieties pulls back the flat and Higgs operators and metric; harmonic flatness equations persist, although stability need not.

**Unit-test obligations.**

- `HarmonicBundlePresentation.trivial_line` (computation): For O with standard metric and θ=0, D is d and D″ is ∂̄.
- `HarmonicBundlePresentation.point` (degenerate): On a point all positive Hermitian vector spaces yield presentations with zero operators; rank>1 need not be stable.
- `HarmonicBundlePresentation.zero_higgs_unitary` (compatibility): A presentation with θ=0 has the Chern connection as its flat unitary connection.
- `HarmonicBundlePresentation.tensor_stability_nonexample` (non-example): For an irreducible E of rank>1, E⊗E* contains the trivial identity subrepresentation and is not irreducible; harmonic tensor products are not automatically stable.

**Acceptance.** A harmonic presentation simultaneously gives a flat and a Higgs object.

**Source passages.** [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §1, pp.12–17, constructions and Lemma 1.1. This is the chosen-metric presentation of the source’s metric-independent harmonic object.

### Harmonic Kähler identities and integrability

**Theorem:** `harmonic_kahler_identities`. Node: `HodgeStructuresPartII:H.1/kahler-identities`.

For a harmonic presentation, the Kähler identities for D′,D″ give Δ_D=2Δ_D′=2Δ_D″ and common harmonic representatives in the coefficient de Rham and Higgs complexes. If a flat bundle has a metric harmonic in the weaker sense ΛG_h=0, with G_h=(D″_h)², compactness and the identities imply G_h=0. Sections annihilated by D are precisely those annihilated by D″, including sections of every Hom bundle between harmonic objects.

**Proof or construction.**

1. Compute the first-order commutators with wedge by the Kähler form and its adjoint; their principal parts are the ordinary Kähler identities and their zeroth-order Higgs parts are metric adjoints.
2. Use the integrability relations to identify Laplacians and invoke elliptic Hodge decomposition on compact X.
3. For the weaker flat harmonic metric, express G as D of a metric-adjoint difference, show D*G=0 by Bianchi and the Kähler identities, and integrate its squared norm to obtain zero. Apply the same argument in degree zero to Hom bundles. Generic coefficient Hodge decomposition and integration by parts remain explicit analytic inputs.

**Direct dependencies.** `HodgeStructuresPartII:H.1/harmonic-bundle`, `ComplexComparisonPartII:C1`, `tauceti:TauCetiRoadmap/PDE#milestone-e-20`.


**Acceptance.** For θ=0 these identities specialize to the unitary coefficient identities. Compactness removes boundary terms; this theorem is not applied on arbitrary noncompact X.

**Source passages.** [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §1, Lemmas 1.1–1.2, pp.15–17; §2, pp.22–23. The coefficient identities supply integrability and full faithfulness, not just a correspondence on objects.

### Donaldson’s functional for Higgs metrics

**Construction:** `DonaldsonFunctional`. Node: `HodgeStructuresPartII:H.1/donaldson-functional`.

Fix a smooth Higgs bundle and a background Hermitian metric K whose determinant is the prescribed flat metric. For H=K exp(s) with s K-self-adjoint and trace zero, define M(K,H)=∫_X tr(s·iΛF_K)dvol+∫_X⟨Ψ(s)D″s,D″s⟩_K dvol, with Ψ(a,b)=(exp(b−a)−(b−a)−1)/(b−a)² and diagonal value 1/2. Fibrewise spectral calculus lets Ψ(s) act on End(E)-valued forms; F_K is the curvature of D″+D′_K. The volume and Λ conventions are fixed by the chosen Kähler form.

**Proof or construction.**

1. Use the positive self-adjoint metric ratio K⁻¹H and its unique self-adjoint logarithm. Extend the smooth two-variable function Ψ to the eigenvalue decomposition; its value at coincident eigenvalues is the removable limit 1/2.
2. Simpson’s bounded Sobolev functional-calculus estimates justify differentiating and integrating. On compact X, Stokes gives the cocycle identity and the first variation.
3. This node specializes the metric functional to fixed determinant; the generic bundle Sobolev/functional-calculus bridge is recorded as an analytic gap.

**Direct dependencies.** `HodgeStructuresPartII:H.1/harmonic-bundle`, `HodgeStructuresPartII:H.1/stability`, `tauceti:TauCetiRoadmap/PDE#milestone-a-4`, `tauceti:TauCetiRoadmap/PDE#milestone-a-6`.

**Uses.**

- S88 Proposition 5.3 and §7 proof of Theorem 1: Stability gives coercivity of this functional and its decreasing heat-flow energy produces the HYM metric.

**API.**

- `DonaldsonFunctional.refl` (simp): M(K,K)=0.
- `DonaldsonFunctional.cocycle` (relation): For metrics K,H,J with the same fixed determinant, M(K,H)+M(H,J)=M(K,J).
- `DonaldsonFunctional.first_variation` (characterisation): For a smooth metric path H_t with fixed determinant, dM(K,H_t)/dt=∫tr(H_t⁻¹∂_tH_t·iΛF_Ht)dvol.
- `DonaldsonFunctional.heat_derivative` (compatibility): Along H_t⁻¹∂_tH_t=−iΛF_Ht, with trace curvature zero, dM/dt=−∥ΛF_Ht∥²_L².

**Unit-test obligations.**

- `DonaldsonFunctional.equal_metrics` (computation): If H=K then the self-adjoint logarithm is zero and both integrals vanish.
- `DonaldsonFunctional.rankOne_fixed` (degenerate): In rank one with fixed determinant metric, H=K and the functional is zero.
- `DonaldsonFunctional.diagonal_kernel` (compatibility): When the two fibre eigenvalues coincide, Ψ equals 1/2, agreeing with the limit of its exponential formula.
- `DonaldsonFunctional.missing_higgs_term` (non-example): For a nonzero Higgs field θ, the first variation involves curvature F=F_Chern+[θ,θ*]+∂_hθ+∂̄θ*, so deleting the Higgs commutator generally changes the functional derivative.

**Acceptance.** Every term is real and depends on the Higgs metric curvature, not solely the ordinary Chern curvature.

**Source passages.** [S88](https://math.mit.edu/events/talbot/2011/library/simpson_AMS_variations_hodge_yang-mills.pdf), §4, pp.879–882; §5, pp.882–884, definition and Proposition 5.1. The scalar kernel was checked on the printed p.882 PDF image, including its diagonal extension.

### Hermitian Yang–Mills metrics for Higgs bundles

**Theorem:** `higgs_metric_existence`. Node: `HodgeStructuresPartII:H.1/higgs-metric-existence`.

A slope-polystable degree-zero Higgs bundle on compact Kähler X has a Hermitian metric with iΛF_h=0; conversely such a metric implies polystability. For a stable fixed-torsion-determinant object, choose the determinant metric to be the prescribed unitary flat metric and obtain a solution with that determinant. The solution on an irreducible object is unique up to positive scalar, and fixing the determinant metric removes that scalar ambiguity. This theorem alone yields an HYM equation, not yet F_h=0.

**Proof or construction.**

1. Apply the Higgs Chern–Weil subbundle formula: any equal-slope invariant subsheaf has vanishing second fundamental form for an HYM metric and splits, proving polystability.
2. For the stable direction, the functional estimate sup|s|≤C₁+C₂M(K,K exp s) follows by contradiction. Normalize an unbounded logarithm; its weak Sobolev limit has constant eigenvalues and spectral projections defining a weak invariant subbundle of slope at least μ(E). Uhlenbeck–Yau regularity makes it a saturated Higgs subsheaf, contradicting stability.
3. Solve the fixed-determinant nonlinear heat equation for all time; maximum and elliptic estimates prevent finite-time blowup. The functional decreases with derivative −∥ΛF∥², coercivity bounds the metrics, and a sequence of times converges to a smooth HYM metric.
4. Take the direct sum for the polystable direction. The coefficient Bochner identity on Hom proves uniqueness up to parallel positive automorphisms, hence scalar on stable objects. Weak-subbundle regularity and nonlinear parabolic inputs are unresolved generic gaps.

**Direct dependencies.** `HodgeStructuresPartII:H.1/stability`, `HodgeStructuresPartII:H.1/harmonic-bundle`, `HodgeStructuresPartII:H.1/donaldson-functional`, `tauceti:TauCetiRoadmap/PDE#milestone-c-13`, `tauceti:TauCetiRoadmap/PDE#milestone-e-20`, `tauceti:TauCetiRoadmap/PDE#milestone-a-6`.


**Acceptance.** For a unitary flat line, its flat metric solves the equation. The split degree-zero trivial rank-two Higgs bundle has a solution but is polystable rather than stable.

**Source passages.** [S88](https://math.mit.edu/events/talbot/2011/library/simpson_AMS_variations_hodge_yang-mills.pdf), §3, Theorem 1 and Proposition 3.3, p.878; §§5–7, pp.884–895. The complete published coercivity and heat-flow construction was read in the compact specialization.; [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §1, Theorem 1(2), pp.16–18. The source packages the polystable existence criterion needed by the correspondence.

### Vanishing Chern numbers force harmonic flatness

**Theorem:** `chern_weil_flatness`. Node: `HodgeStructuresPartII:H.1/chern-weil-flatness`.

For a degree-zero Higgs bundle with an HYM metric on compact Kähler X of dimension d≥2, if c₁(E)·[ω]^(d−1)=0 and ch₂(E)·[ω]^(d−2)=0, then the associated total connection D_h is flat. In particular all-rational-Chern-zero Higgs bundles in the projective comparison component satisfy this criterion. In dimension one the degree-zero HYM equation already implies flatness; there is no ω^(−1) or ch₂ pairing to impose.

**Proof or construction.**

1. The trace curvature is a harmonic representative of the first Chern class; under the fixed determinant convention it is identically zero.
2. Use the Chern–Weil identity and the Kähler Riemann bilinear relations on the primitive (1,1) and (2,0)/(0,2) components of F_h. After ΛF_h=0, the vanishing ch₂ pairing forces each nonnegative squared curvature norm to vanish.
3. On a curve the two-form curvature is determined by ΛF_h. The analytic/algebraic normalization and characteristic-class bridge is an explicit generic gap.

**Direct dependencies.** `HodgeStructuresPartII:H.1/higgs-metric-existence`, `HodgeStructuresPartII:H.1/kahler-identities`, `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.2`.


**Acceptance.** The statement specializes to degree-zero stable bundles with zero Higgs field. Vanishing rational c₁ alone in dimension at least two is insufficient to remove trace-free curvature.

**Source passages.** [S88](https://math.mit.edu/events/talbot/2011/library/simpson_AMS_variations_hodge_yang-mills.pdf), §3, Proposition 3.4 and its proof, pp.878–879. The printed proof separates trace-free curvature from the determinant curvature.; [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §1, Theorem 1(2) and its discussion, pp.17–18. The source’s ch₁/ch₂ pairing criterion is kept distinct from the all-Chern-zero component.

### Corlette’s harmonic metric criterion

**Theorem:** `flat_metric_existence`. Node: `HodgeStructuresPartII:H.1/flat-metric-existence`.

A flat complex bundle on compact Kähler X admits a harmonic metric iff its monodromy representation is semisimple. The associated harmonic Higgs structure is independent, up to canonical operator-compatible isomorphism, of the metric choice. For irreducible monodromy the metric is unique up to positive scalar; it can be normalized to the prescribed finite-monodromy determinant metric. A general nonsemisimple flat bundle is not asserted to have such a metric.

**Proof or construction.**

1. Apply Corlette’s reductive representation existence theorem to the equivariant metric map from the universal cover to GLr(ℂ)/U(r); its harmonic equation is ΛG_h=0.
2. The Kähler integrability theorem gives G_h=0 and hence the Higgs structure. Bochner uniqueness identifies different harmonic reductions and normalizes the determinant.
3. The source states Corlette’s result but does not reproduce its existence proof. That primary proof could not be retrieved in this run and is a recorded source-closure gap, not an established analytic supplier.

**Direct dependencies.** `HodgeStructuresPartII:H.1/harmonic-bundle`, `HodgeStructuresPartII:H.1/kahler-identities`, `HodgeStructuresPartII:H.1/torsion-determinant-dictionary`, `mathlib:Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-0-port-the-foundations-into-tauceti`.


**Acceptance.** Every unitary representation has its constant positive metric as a harmonic metric. A nontrivial unipotent extension of the trivial character of ℤ has no harmonic metric.

**Source passages.** [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §1, Theorem 1(1), pp.16–17, reference to Corlette. This is a read primary statement of the metric criterion; its external existence proof remains explicitly unread.

### The projective harmonic category correspondence

**Theorem:** `harmonic_correspondence`. Node: `HodgeStructuresPartII:H.1/harmonic-correspondence`.

On smooth projective complex X, harmonic presentations, semisimple algebraic flat bundles and slope-polystable algebraic Higgs bundles with all rational Chern classes zero give equivalent complex-linear categories. The equivalence identifies irreducible flat bundles with stable Higgs bundles, respects tensor products, duals, holomorphic pullback and determinants, and therefore restricts to the fixed finite-monodromy determinant δ↔(L,∇L)↔(L,0). Fixed-rank fixed-determinant stable groupoids are corresponding full sub-groupoids, not tensor subcategories.

**Hypotheses.** X is a smooth connected projective complex variety with its polarization Kähler form. The full complex-linear categories allow all finite ranks, including the zero object, and unrestricted determinant; their tensor and dual operations have their usual changing ranks and determinants. The stable fixed-data restriction uses positive rank r, finite-order δ and the corresponding flat torsion determinant line (L,∇L), respectively (L,0).

**Proof or construction.**

1. Metric existence supplies both directions; curvature-zero and Kähler integrability turn their operators into a common harmonic presentation.
2. For any pair of objects apply the degree-zero Kähler identity to Hom: horizontal morphisms and Higgs-compatible morphisms are exactly the same. This proves full faithfulness and makes metric choices harmless.
3. Tensor and dual operators agree term by term; projective coherent GAGA algebraizes the holomorphic structures and their maps. Stable objects correspond to simple objects; apply determinant compatibility and the torsion line dictionary.

**Direct dependencies.** `HodgeStructuresPartII:H.1/flat-metric-existence`, `HodgeStructuresPartII:H.1/higgs-metric-existence`, `HodgeStructuresPartII:H.1/chern-weil-flatness`, `HodgeStructuresPartII:H.1/kahler-identities`, `HodgeStructuresPartII:H.1/torsion-determinant-dictionary`, `ComplexComparisonPartII:C2`.


**Acceptance.** The trivial unitary rank-one representation corresponds to (O,0). The identity in E⊗E* shows why the fixed stable locus is not closed under tensors.

**Source passages.** [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §1, Corollary 1.3 and full proof, pp.17–20. This is a category equivalence, before proving a homeomorphism of coarse moduli.

### Restriction and extension comparison for Higgs bundles

**Theorem:** `higgs_restriction_and_extensions`. Node: `HodgeStructuresPartII:H.1/higgs-restriction`.

In dimension at least two, a torsion-free slope-semistable (respectively stable) Higgs sheaf on smooth projective X restricts to a slope-semistable (respectively stable) Higgs sheaf on general hypersurfaces of arbitrarily high suitable degrees. Reflexive Higgs Hom spaces are unchanged by sufficiently high such restriction, uniformly for bounded families. On a fixed smooth projective X, the category of flat bundles is equivalent to Higgs bundles that are successive extensions of stable degree-zero bundles with vanishing ch₂ pairing. The latter assertion includes nonsemisimple extensions and is distinct from the harmonic correspondence on polystable objects.

**Proof or construction.**

1. For restriction, start from Mehta–Ramanathan for coherent sheaves with a vector-bundle-valued operator; the conormal exact sequence and slope bound force a destabilizing restricted Higgs subsheaf to remain invariant for the ambient operator.
2. For Hom restriction, use Enriques–Severi injectivity and vanishing to extend a section and then its Higgs compatibility.
3. For extensions, apply the two-types quasi-isomorphisms to the Hom complexes of harmonic bundles, then the generic nilpotent Maurer–Cartan/dg-category extension-completion equivalence. The generic restriction and dg completion inputs are unresolved gaps rather than duplicated definitions.

**Direct dependencies.** `HodgeStructuresPartII:H.1/stability`, `HodgeStructuresPartII:H.1/harmonic-correspondence`, `HodgeStructuresPartII:H.1/two-types-formality`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-4-bar--cobar-dg-strictification-and-controlled-maurer--cartan-twisting`.


**Acceptance.** In dimension one the extension statement applies directly to semistable degree-zero Higgs bundles. An extension need not be polystable and need not itself admit a harmonic metric.

**Source passages.** [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §3, Lemmas 3.1–3.5 and Proposition 3.6 through Lemma 3.9, pp.32–39. The complete extension and restriction arguments are needed in the local-freeness proof.

### Local freeness and stability on the comparison component

**Theorem:** `higgs_chern_zero_locally_free`. Node: `HodgeStructuresPartII:H.1/higgs-local-freeness`.

A slope-semistable torsion-free Higgs sheaf E with every rational c_i(E)=0 on smooth projective X is a vector bundle and an extension of stable Higgs bundles with every rational Chern class zero. Gieseker and slope semistability agree on this component; Gieseker and slope stability also agree. Degree-zero invariant subsheaves with torsion-free quotient are subbundles with vanishing rational Chern classes. These are component-specific assertions, not general properties of semistable coherent sheaves.

**Proof or construction.**

1. In dimension two compare a stable sheaf with its double dual, apply the HYM curvature inequality and use the length of the singularity quotient; equality forces that quotient to vanish.
2. In larger dimensions restrict to a high smooth hypersurface, apply induction and the extension comparison, and transport the local system using Lefschetz π₁. Extend its Higgs bundle and identify double duals by Hom restriction.
3. Riemann–Roch gives P_E=rP_O; the equality of Hilbert polynomials kills E**/E. Stable Jordan factors and invariant degree-zero subsheaves have zero Chern classes; compare their reduced polynomials. The generic Lefschetz and restriction inputs remain gaps.

**Direct dependencies.** `HodgeStructuresPartII:H.1/chern-component`, `HodgeStructuresPartII:H.1/higgs-restriction`, `HodgeStructuresPartII:H.1/higgs-metric-existence`, `HodgeStructuresPartII:H.1/chern-weil-flatness`, `AlgebraicModuliForArithmeticGeometry:R09.1`.


**Acceptance.** The curve case is the degree-zero Jordan filtration. Outside the comparison component a torsion-free semistable sheaf need not be locally free.

**Source passages.** [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §3, Theorem 2, pp.39–40. The proof requires the reflexive or Hilbert-polynomial hypothesis, which the all-Chern-zero component supplies.; [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §6, Proposition 6.6 and Corollary 6.7, p.17. The component-level local-freeness and p/μ stability equivalence are then used in the family construction.

### Stable Dolbeault coarse moduli

**Construction:** `DolbeaultModuli`. Node: `HodgeStructuresPartII:H.1/dolbeault-coarse`.

Construct the quasi-projective semistable Higgs coarse moduli M_Dol(X,r) on the all-rational-Chern-zero component, and its fixed determinant fibre over (L,0). Complex points are S-equivalence classes, with unique polystable representatives. Its stable open M_Dolˢ(X,r,L) parametrizes slope-stable trace-zero Higgs bundles of rank r and determinant L. It universally corepresents the corresponding étale-local family functor; a stable universal family exists étale locally on the coarse space, up to tensoring by a line from the base.

**Proof or construction.**

1. Apply Simpson’s operator GIT theorem to Sym(T_X)-modules, importing the H.0 Higgs/symmetric-action dictionary.
2. Select the union of Chern-zero components and take the determinant fibre; at λ=0 determinant is (det E,tr θ).
3. Use local freeness to identify the resulting coherent objects with vector bundles, and identify closed orbits with polystable representatives. Restrict to the saturated stable open.

**Direct dependencies.** `HodgeStructuresPartII:H.1/operator-boundedness`, `HodgeStructuresPartII:H.1/higgs-local-freeness`, `HodgeStructuresPartII:H.1/parameter-families`, `HodgeStructuresPartII:H.1/stable-automorphisms`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `HodgeStructuresPartII:H.1/operator-git`, `HodgeStructuresPartII:H.0/symmetric-action`.

**Uses.**

- EG20 §2.1 and Lemma 2.1: Gives the ambient stable fixed-determinant variety for scaling and rigid-point tests.
- S94II Theorem 7.18: Its polystable closed-point description is the Dolbeault side of the homeomorphism.

**API.**

- `DolbeaultModuli.classify` (universal-property): A family induces a coarse classifying map, locally in the étale topology, and these maps agree on overlaps and under base change.
- `DolbeaultModuli.points` (characterisation): Geometric points are S-equivalence classes of semistable objects; on the stable open they are ordinary isomorphism classes.
- `DolbeaultModuli.determinant_fibre` (compatibility): The fibre of the rank-one determinant morphism at (L,0) imposes det E≃L and tr θ=0, with the coarse scheme structure.
- `DolbeaultModuli.stable_universal_etale` (other): There is a stable universal family after an étale covering, unique up to tensoring by a line pulled back from the cover; no global fine representability is asserted.

**Unit-test obligations.**

- `DolbeaultModuli.rankOne_fixed` (computation): M_Dolˢ(X,1,L)=Spec ℂ with object (L,0).
- `DolbeaultModuli.point_base` (degenerate): For X=Spec ℂ and r>1 the stable moduli is empty.
- `DolbeaultModuli.trace_determinant` (compatibility): In a coordinate frame its determinant Higgs coefficient is tr θ, agreeing with H.0/determinant-coordinate.
- `DolbeaultModuli.strictly_semistable_excluded` (non-example): (O⊕O,0) lies in the rank-two semistable fixed-trivial-determinant coarse moduli and is absent from its stable open.

**Acceptance.** Rank-one fixed determinant and trace zero gives the reduced point (L,0).

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §6, pp.16–17, M_Dol construction and Corollary 6.7. Coarse universality, stable openness and local universal bundles are part of the construction.

**Atlas planet:** Dolbeault moduli space.

### Stable de Rham coarse moduli

**Construction:** `DeRhamModuli`. Node: `HodgeStructuresPartII:H.1/derham-coarse`.

Construct the quasi-projective rank-r de Rham coarse moduli of integrable algebraic connections on X, and its fixed flat-determinant fibre at (L,∇L). Closed points are semisimple flat bundles, or equivalently S-equivalence classes of flat bundles. The stable open M_dRˢ(X,r,L,∇L) consists of irreducible connections; every coherent integrable connection is locally free in characteristic zero on smooth X and has vanishing rational Chern classes. Stable universal families have the same étale-local base-line ambiguity as Dolbeault families.

**Proof or construction.**

1. Use the sheaf of differential operators and its locally free filtered pieces to apply Simpson’s operator GIT theorem; the actual sheaf/PBW presentation is an H.0 supplier obligation.
2. Local connection triviality in characteristic zero forces local freeness. An invariant coherent subsheaf is a subconnection and has zero Chern classes, hence the same reduced polynomial. Thus stability is irreducibility.
3. Take the determinant fibre at the specified flat line, not the fibre of the underlying-line map alone.

**Direct dependencies.** `HodgeStructuresPartII:H.1/operator-boundedness`, `HodgeStructuresPartII:H.1/parameter-families`, `HodgeStructuresPartII:H.1/chern-component`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `HodgeStructuresPartII:H.0`, `HodgeStructuresPartII:H.1/operator-git`.

**Uses.**

- EG20 Introduction and §2.1; S94II Proposition 7.8: Defines the precise stable connection space and its analytic comparison with the fixed-character Betti space.

**API.**

- `DeRhamModuli.classify` (universal-property): Connection families have natural coarse classifying maps compatible with pullback; the coarse scheme universally corepresents the étale-local functor.
- `DeRhamModuli.stable_iff_irreducible` (characterisation): A connection point is stable iff its horizontal local system has no proper nonzero sub-local system.
- `DeRhamModuli.determinant_fibre` (compatibility): The fixed fibre imposes an isomorphism of flat lines det(E,∇)≃(L,∇L).
- `DeRhamModuli.stable_universal_etale` (other): A universal stable connection exists étale locally, with uniqueness up to a line from the base.

**Unit-test obligations.**

- `DeRhamModuli.rankOne_fixed` (computation): M_dRˢ(X,1,L,∇L)=Spec ℂ.
- `DeRhamModuli.point_base` (degenerate): For X=Spec ℂ and r>1 the stable connection moduli is empty.
- `DeRhamModuli.native_operator` (compatibility): In an algebraic frame the connection is d+A with curvature dA+A∧A, agreeing with H.0 at λ=1.
- `DeRhamModuli.underlying_line_insufficient` (non-example): On a positive-genus curve, (O,d+α) with nonzero holomorphic one-form α has underlying line O but is absent from the fixed determinant (O,d) rank-one fibre.

**Acceptance.** The rank-one fixed flat-determinant fibre is a reduced point, including its scheme structure.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §6, pp.24–25 and Theorem 6.13. Theorem 6.13 applies the operator-moduli construction and identifies the de Rham objects.

**Atlas planet:** De Rham moduli space.

### Stable Hodge coarse moduli

**Construction:** `HodgeModuli`. Node: `HodgeStructuresPartII:H.1/hodge-coarse`.

For fixed X, construct the quasi-projective Hodge coarse moduli q:M_Hod(X,r,L)→A¹ of semistable integrable relative λ-connections with every rational Chern class zero and determinant (L,λ∇L). Restrict to its stable open M_Hodˢ. Scheme-theoretically q⁻¹(0)=M_Dol(X,r,L) and q⁻¹(1)=M_dR(X,r,L,∇L), including their stable loci. The construction retains nonreduced bases. No global algebraic product M_Hod≃M_Dol×A¹ is asserted.

**Proof or construction.**

1. Apply the relative operator GIT theorem to the Rees sheaf of differential operators, whose modules are integrable relative λ-connections.
2. Its specializations are Sym(T_X) and the differential-operator sheaf, giving the zero and one fibres by the coarse universal properties and the relative construction.
3. Take the determinant section λ↦(L,λ∇L), and restrict the Chern-zero components and stable opens. The coarse fibre construction is not justified by closed-point counting alone.

**Direct dependencies.** `HodgeStructuresPartII:H.1/operator-boundedness`, `HodgeStructuresPartII:H.1/parameter-families`, `HodgeStructuresPartII:H.1/dolbeault-coarse`, `HodgeStructuresPartII:H.1/derham-coarse`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `HodgeStructuresPartII:H.0`, `HodgeStructuresPartII:H.1/operator-git`.

**Uses.**

- EG20 Lemma 4.9 and HodgeStructuresPartII:H.5: Supplies the ambient morphism for the relative quasi-finite rigid locus and its fixed determinant.
- S96 Theorem 9.1: Provides the finite-type scheme whose formal and étale local parameter structure is compared.

**API.**

- `HodgeModuli.parameter` (projection): The class of (λ,E,D) maps to λ in A¹.
- `HodgeModuli.zero_fibre` (equivalence): The scheme fibre at 0 is the fixed-det trace-zero Dolbeault coarse scheme, with stable opens identified.
- `HodgeModuli.one_fibre` (equivalence): The scheme fibre at 1 is the fixed-flat-det de Rham coarse scheme, with stable opens identified.
- `HodgeModuli.classify` (universal-property): Relative integrable parameter families give classifying morphisms over A¹, compatible with nilpotent parameter extensions and pullback.

**Unit-test obligations.**

- `HodgeModuli.rankOne_fixed` (computation): For rank one and fixed determinant section, M_Hodˢ is A¹ with q the identity.
- `HodgeModuli.zero_parameter` (degenerate): The restriction of q and the universal relative operator at λ=0 has zero Leibniz correction and determinant Higgs field zero.
- `HodgeModuli.fibres_scheme` (compatibility): The canonical zero/one fibre isomorphisms retain the infinitesimal scheme structures supplied by the relative quotient.
- `HodgeModuli.rankTwo_point_empty` (non-example): For X=Spec ℂ and r=2 the stable Hodge moduli is empty over all of A¹.

**Acceptance.** Its fibre comparisons are scheme isomorphisms, not merely bijections.

**Source passages.** [S96](https://arxiv.org/pdf/alg-geom/9604005), §4, Proposition 4.1, pp.18–19. This is the relative quotient construction, with the fixed determinant restriction spelled out.; [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, pp.131–132. The Hodge parameter and zero/one fibres supply the routed target.

**Atlas planet:** Hodge moduli space.

### Framed parameter-connection moduli

**Construction:** `FramedParameterModuli`. Node: `HodgeStructuresPartII:H.1/operator-framed`.

For the all-Chern-zero rank-r parameter-connection problem on fixed X, add a frame E|_(x×S)≃O_Sʳ. The resulting scheme R_Hod represents the étale-sheaf functor of isomorphism classes of framed semistable families; there are no frame-preserving automorphisms. Its zero and one fibres represent framed Higgs and de Rham families. It carries a GLr frame-change action with good quotient M_Hod. Impose fixed determinant through the determinant section, without a separate choice of determinant frame. The construction includes Artinian bases and the actual universal framed bundle.

**Proof or construction.**

1. Pull the universal bundle on Q back to its frame bundle at x. A frame-preserving endomorphism of a semistable operator object with the same reduced polynomial is determined by its value at x; prove this first on fibres and then by Artinian reduction.
2. The auxiliary section-frame group therefore acts freely; its geometric quotient descends the universal framed bundle and represents the framed functor. Exchange the two commuting frame-change quotients to recover M_Hod.
3. For analytic test bases use the relative coherent pushforward/base-change and analytified Quot representability arguments of S94I Propositions 5.1–5.4 and Lemma 5.7. Their generic Grauert/Quot bridge remains a precise gap.

**Direct dependencies.** `HodgeStructuresPartII:H.1/parameter-families`, `HodgeStructuresPartII:H.1/operator-git`, `HodgeStructuresPartII:H.1/higgs-local-freeness`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `ComplexComparisonPartII:C0`, `ComplexComparisonPartII:C2`, `ComplexComparisonPartII:C0/repair-analytification`.

**Uses.**

- S94II Theorem 7.1 and Proposition 7.8: Provides the actual framed de Rham representing scheme for the analytic Riemann–Hilbert comparison.
- S94I Theorem 4.10; S96 Proposition 4.1: Descends universal operators and forms the relative zero/one family schemes before passing to coarse spaces.

**API.**

- `FramedParameterModuli.represent` (universal-property): Maps S→R_Hod over A¹ are naturally isomorphism classes of framed semistable parameter families, and this equivalence commutes with pullback.
- `FramedParameterModuli.universal` (data): The universal bundle, relative operator and x-frame pull back to each represented family.
- `FramedParameterModuli.frame_change` (structure): GLr changes the x-frame; identity and multiplication act compatibly with universal operators, determinant and stability.
- `FramedParameterModuli.quotient` (compatibility): The GLr good quotient is the unframed Hodge moduli; at λ=0,1 it recovers the Dolbeault and de Rham quotient presentations.

**Unit-test obligations.**

- `FramedParameterModuli.rankOne` (computation): For rank one and the prescribed determinant section, R_Hod=A¹: two x-frames on the same line are uniquely isomorphic.
- `FramedParameterModuli.point_base` (degenerate): For X a point the semistable framed moduli is A¹ in every positive rank, whereas the stable open is empty in rank greater than one.
- `FramedParameterModuli.frame_kills_inertia` (compatibility): An operator-compatible automorphism preserving the x-frame is the identity, including over an Artinian base.
- `FramedParameterModuli.coarse_not_fine` (non-example): After forgetting the frame the rank-two split trivial object has GL₂ automorphisms, so coarse universality does not give the same fine family functor.

**Acceptance.** A frame is additional family data rather than a universal bundle on an unframed coarse scheme.

**Source passages.** [S94I](https://www.numdam.org/item/PMIHES_1994__79__47_0.pdf), §4, Lemma 4.9, Theorem 4.10 and complete proofs, pp.105–109; §5, Propositions 5.1–5.4 and Lemma 5.7, pp.110–114,119. The free auxiliary action and functor representability cannot be inferred from a coarse quotient alone.

### Relative horizontal sections on analytic polydiscs

**Comparison:** `horizontal_sections_relative`. Node: `HodgeStructuresPartII:H.1/horizontal-sections`.

For a smooth morphism of complex analytic spaces Y→S, including nonreduced S, a locally free coherent sheaf with relative integrable holomorphic connection has horizontal sections locally free over f⁻¹O_S. The natural map O_Y⊗_(f⁻¹O_S)E^∇→E is an isomorphism. On a product polydisc U×S, restriction to one point of U identifies the horizontal sections with the bundle along that section. The inverse functor is scalar extension with connection D(a⊗e)=(1⊗e)⊗d_(Y/S)a.

**Proof or construction.**

1. Start with holomorphic linear ODE uniqueness and existence on a disc; integrability makes successive coordinate extensions compatible on a polydisc.
2. For an Artinian base apply the same linear equation to finite-dimensional coefficient modules. For a general possibly nonreduced analytic base, use the infinitesimal neighborhoods at a point to prove uniqueness and integrability of the extended section.
3. Glue the resulting horizontal frames and identify their scalar extension with E. C5 supplies the scalar Poincaré input only; its relative coefficient extension is an explicit gap.

**Direct dependencies.** `ComplexComparisonPartII:C0`, `ComplexComparisonPartII:C5`, `EnhancedDerivedSheaves:E1`, `HodgeStructuresPartII:H.0/intrinsic-preconnection`, `HodgeStructuresPartII:H.0/intrinsic-curvature`.


**Acceptance.** For (O,d) over a polydisc times S, horizontal sections are f⁻¹O_S. A nonintegrable rank-one connection in relative dimension two has no such horizontal frame.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §7, Lemma 7.4 through Corollary 7.6, pp.28–30. The proof is required for comparison of analytic functors, not merely their complex points.

### Framed Riemann–Hilbert in analytic families

**Theorem:** `riemann_hilbert_framed`. Node: `HodgeStructuresPartII:H.1/riemann-hilbert-framed`.

For fixed smooth projective X with base point x, analytification gives a GLr-equivariant complex analytic isomorphism R_dR(X,x,r)ᵃⁿ≃R_B(π₁(Xᵃⁿ,x),r)ᵃⁿ. Both spaces represent on complex analytic bases the same functor of rank-r locally free p_S⁻¹O_S-module sheaves on Xᵃⁿ×S with a frame at x×S. It restricts to the fixed flat-determinant and irreducible loci, is compatible with pullback and tensor/determinant, and is sensitive to nonreduced bases.

**Proof or construction.**

1. Identify framed p_S⁻¹O_S-module local systems with representations into GLr(Γ(S,O_S)) by monodromy and descent from the universal cover. The frame makes this an actual set-valued functor.
2. Identify the analytic de Rham framed functor with the same local-system functor by horizontal frames and relative analytic algebraization of its operator parameter scheme.
3. Uniqueness of representing objects gives the equivariant analytic isomorphism; determinant and subobjects commute with both functors. Relative analytic representability requires the exact GAGA/parameter interface requested below.

**Direct dependencies.** `HodgeStructuresPartII:H.1/horizontal-sections`, `HodgeStructuresPartII:H.1/betti-framed`, `HodgeStructuresPartII:H.1/torsion-determinant-dictionary`, `ComplexComparisonPartII:C2`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `tauceti:TauCetiRoadmap/UniversalCovers#stage-0-port-the-foundations-into-tauceti`, `HodgeStructuresPartII:H.1/operator-framed`, `ComplexComparisonPartII:C0/repair-analytification`.


**Acceptance.** Rank-one monodromy recovers the given δ. No algebraic isomorphism of the framed Betti and de Rham schemes is inferred.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §7, Theorem 7.1, Lemmas 7.2–7.7 and proof, pp.26–30. The complete proof compares analytic families, including nilpotent coefficient bases.

### Riemann–Hilbert on stable coarse spaces

**Theorem:** `riemann_hilbert_coarse`. Node: `HodgeStructuresPartII:H.1/riemann-hilbert-coarse`.

Horizontal sections induce a complex analytic isomorphism M_dRˢ(X,r,L,∇L)ᵃⁿ≃M_Bˢ(π₁(Xᵃⁿ,x),r,δ)ᵃⁿ. The analogous semisimple coarse spaces are analytically isomorphic. The comparison preserves the determinant fibre, stable locus and analytic local scheme structure; its construction is independent of a change of base point on unframed moduli. It does not assert an algebraic isomorphism.

**Proof or construction.**

1. Import that analytification of these reductive good quotients is a universal categorical quotient in complex analytic spaces, as in S94I Proposition 5.5.
2. Pass the equivariant framed isomorphism to these quotients; identify determinant fibres and saturated stable opens.
3. Use quotient uniqueness to check basepoint independence. The analytic good-quotient bridge is a distinct requested input, not a consequence of a bijection on closed points.

**Direct dependencies.** `HodgeStructuresPartII:H.1/riemann-hilbert-framed`, `HodgeStructuresPartII:H.1/betti-coarse`, `HodgeStructuresPartII:H.1/derham-coarse`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `ComplexComparisonPartII:C0`, `ComplexComparisonPartII:C0/repair-analytification`.


**Acceptance.** In rank one with fixed δ this is the analytic isomorphism of points. For an elliptic curve and unfixed determinant, M_B(1)=(ℂ×)² is affine while the de Rham universal vector extension of Pic⁰ is not algebraically isomorphic to it.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §7, Proposition 7.8 and full proof, p.31. The proof explicitly needs analytification of universal categorical quotients.; [S94I](https://www.numdam.org/item/PMIHES_1994__79__47_0.pdf), §5, Proposition 5.5 and complete proof, pp.114–118. The proof retains nonreduced analytic bases and imports a moment-map compact lift.

**Atlas planet:** Riemann–Hilbert correspondence.

### The fixed-determinant Hitchin morphism

**Construction:** `HitchinMap`. Node: `HodgeStructuresPartII:H.1/hitchin-map`.

For a rank-r trace-zero Higgs bundle, write det(T−θ)=Tʳ+a₂(θ)T^(r−2)+⋯+a_r(θ), with a_i∈H⁰(X,SymⁱΩ¹_X). Define the trace-free Hitchin base A_r=⊕_(i=2)^r H⁰(X,SymⁱΩ¹_X), as its associated affine complex scheme, and h:M_Dol(X,r,L)→A_r by these coefficients. For unrestricted determinant retain a₁=−tr θ. The construction commutes with base change and descends through S-equivalence because characteristic coefficients are unchanged by taking a Jordan graded Higgs bundle.

**Proof or construction.**

1. In a local frame evaluate elementary symmetric polynomials on the commuting Higgs matrices; invariant polynomial identities glue the results into symmetric differential forms.
2. Base-flat families give the relative coefficient sections and hence a morphism from the parameter functor; the coarse universal property descends it.
3. Use multiplicativity of characteristic polynomials on invariant short exact sequences to see S-equivalence invariance. For trace-zero determinant remove the first coordinate.

**Direct dependencies.** `HodgeStructuresPartII:H.1/dolbeault-coarse`, `HodgeStructuresPartII:H.0/symmetric-action`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `ComplexComparisonPartII:C2`.

**Uses.**

- S94II Theorem 6.11 and Proposition 7.9: Controls spectral support and bounds eigenvalues in the compactness proof.
- EG20 Lemma 2.1; HodgeStructuresPartII:H.5: Positive coefficient weights force rigid stable Higgs fields to have zero characteristic coefficients.

**API.**

- `HitchinMap.coefficients` (projection): The ith coordinate is the coefficient of T^(r−i) in det(T−θ), and the omitted a₁ equals −tr θ.
- `HitchinMap.scale` (relation): a_i(tθ)=tⁱa_i(θ); the Hitchin map is equivariant for Higgs scaling and positive coordinate weights.
- `HitchinMap.jordan_invariant` (compatibility): A Higgs bundle and its Jordan graded polystable representative have identical characteristic coefficients.
- `HitchinMap.nilpotent_iff` (characterisation): For a complex geometric point, h(E,θ)=0 iff every contracted Higgs endomorphism is nilpotent, equivalently the Higgs action is nilpotent with the rank-bound convention of H.0.

**Unit-test obligations.**

- `HitchinMap.rankTwo_sign` (computation): For θ=diag(α,−α), det(T−θ)=T²−α², so a₂=−α².
- `HitchinMap.rankOne_base` (degenerate): For r=1 and trace zero, A_r is the point and θ=0.
- `HitchinMap.trace_coordinate` (compatibility): In the unfixed-det problem, a₁=−tr θ, while H.0 determinant Higgs coefficient is +tr θ.
- `HitchinMap.nonzero_nilpotent` (non-example): If α is a nonzero holomorphic one-form, θ on O² given by the matrix with upper-right entry α and all other entries zero is nonzero but has h=0.

**Acceptance.** The nilpotent cone is the zero fibre, without asserting that the field itself is zero.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §6, pp.20–21, definition of σ and Y_Dol. The convention has first coefficient −tr θ, not +tr θ.; [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §2.1, p.109. The coefficient map is the input to the rigid-nilpotence argument in H.5.

### Properness of the semistable Hitchin morphism

**Theorem:** `hitchin_proper`. Node: `HodgeStructuresPartII:H.1/hitchin-properness`.

For fixed smooth projective complex X and Hilbert polynomial P, the Hitchin morphism from semistable Higgs coarse moduli to its characteristic-coefficient affine scheme is proper. Its restriction to the all-Chern-zero fixed-determinant semistable component remains proper. Properness is not asserted for the stable open restriction, and the coarse moduli itself is not asserted projective over ℂ.

**Proof or construction.**

1. Interpret a Higgs sheaf as a coherent sheaf on T*X and embed T*X into a projective bundle compactification Z. Its support is contained in the monic spectral scheme from its characteristic coefficients.
2. Over a curve/DVR with extending characteristic coefficients, projectivity of coherent-sheaf moduli on Z extends the class after the needed finite cover. Flatness and monicity prevent support from reaching Z∖T*X.
3. Convert back to a semistable Higgs sheaf and descend the extension using separated coarse moduli. Restrict to the closed determinant fibre and the open-and-closed Chern components. The spectral coherent-sheaf dictionary is imported from generic affine-relative Spec and H.0 symmetric action.

**Direct dependencies.** `HodgeStructuresPartII:H.1/hitchin-map`, `HodgeStructuresPartII:H.1/dolbeault-coarse`, `HodgeStructuresPartII:H.0/symmetric-action`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.5`.


**Acceptance.** The zero Hitchin fibre is proper in semistable moduli. A family of stable objects can acquire a strictly semistable limit; stable properness does not follow.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §6, Lemmas 6.8–6.10 and Theorem 6.11 with full proof, pp.18–23. The theorem is on semistable coarse moduli, including polystable limits.

### Compactness of normalized harmonic presentations

**Theorem:** `harmonic_compactness`. Node: `HodgeStructuresPartII:H.1/harmonic-compactness`.

For fixed compact X and rank r, a sequence of harmonic presentations whose Higgs characteristic coefficients stay bounded has, after unitary gauge transformations and passage to a subsequence, a harmonic limit with its operators converging in the Sobolev operator norms needed for monodromy and Higgs-family convergence. Normalized harmonic frames form a closed proper space over the semisimple Dolbeault and de Rham coarse spaces, and U(r) acts with fibres its compact orbits, allowing nontrivial stabilizers. This is a metric/gauge compactness theorem, not algebraic properness of M_dR.

**Proof or construction.**

1. A coefficient bound gives bounded eigenforms. Simpson’s curvature inequality for log|θ| and the Ahlfors estimate bound the whole Higgs field, including its nonnormal part.
2. The unitary connection curvature equals −[θ,θ*]. Apply Uhlenbeck weak compactness in unitary gauges, then elliptic estimates for ∂̄θ=0 and Rellich to extract operator limits; the integrability equations pass to that limit.
3. For the de Rham direction, the affine reductive quotient needs a Kempf–Ness compact lift of bounded closed orbits. Bounded monodromy yields uniformly bounded-energy equivariant maps; harmonic maps minimize energy and bound the Higgs eigenforms.
4. Normalize a frame by the harmonic metric; compactness of U(r) supplies frame limits. Gauge compactness, Ahlfors/subharmonic estimates and the analytic Kempf–Ness input remain explicit gaps.

**Direct dependencies.** `HodgeStructuresPartII:H.1/harmonic-bundle`, `HodgeStructuresPartII:H.1/harmonic-correspondence`, `HodgeStructuresPartII:H.1/hitchin-map`, `HodgeStructuresPartII:H.1/betti-coarse`, `HodgeStructuresPartII:H.1/derham-coarse`, `HodgeStructuresPartII:H.1/dolbeault-coarse`, `tauceti:TauCetiRoadmap/PDE#milestone-a-4`, `tauceti:TauCetiRoadmap/PDE#milestone-a-6`, `tauceti:TauCetiRoadmap/PDE#milestone-e-20`.


**Acceptance.** Rank-one normalized metrics reduce the statement to bounded harmonic one-forms. Coefficient bounds are not replaced by bounds on a chosen arbitrary matrix frame.

**Source passages.** [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §2, Lemmas 2.7–2.8, pp.26–28. The eigenvalue-to-full-norm estimate and compactness proofs were read.; [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §7, Proposition 7.9 through Lemma 7.17, pp.32–37. The complete argument handles both coarse-space directions and normalized frames.

### The stable non-abelian Hodge homeomorphism

**Theorem:** `nonabelian_hodge_homeomorphism`. Node: `HodgeStructuresPartII:H.1/nonabelian-hodge-topology`.

The harmonic correspondence gives a homeomorphism of underlying complex analytic topological spaces M_dRˢ(X,r,L,∇L)ᵗᵒᵖ≃M_Dolˢ(X,r,L)ᵗᵒᵖ, and a homeomorphism of the semisimple/polystable coarse spaces. Composing with Riemann–Hilbert gives the stable fixed-δ Betti–Dolbeault homeomorphism. It preserves isolated points, with stability, rank, torsion determinant and Chern component as specified. No holomorphic or algebraic isomorphism and no global real-analytic isomorphism across singular coarse loci is claimed here.

**Proof or construction.**

1. Use the harmonic category correspondence for the bijection of polystable/semisimple coarse points.
2. On normalized harmonic framed spaces the operator convergence theorem proves continuity in both directions. Their proper U(r) quotient description identifies the actual coarse analytic topology.
3. Pass to coarse quotients and restrict to the stable determinant subspaces, using determinant compatibility rather than merely matching cardinalities.

**Direct dependencies.** `HodgeStructuresPartII:H.1/harmonic-correspondence`, `HodgeStructuresPartII:H.1/harmonic-compactness`, `HodgeStructuresPartII:H.1/riemann-hilbert-coarse`.


**Acceptance.** Rank-one fixed determinant gives a homeomorphism of points. On a genus-g curve without fixing the rank-one determinant, M_B=(ℂ×)²ᵍ and M_Dol=Pic⁰(X)×H⁰(Ω¹) illustrate a homeomorphism between very different algebraic spaces.

**Source passages.** [S94II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf), §7, Lemmas 7.16–7.17 and Theorem 7.18, pp.36–38. This is the explicit proved regularity used for singular coarse moduli.; [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §2.1, pp.108–109, comparison diagram. The diagram is used with the precise topological conclusion proved in Simpson’s source.

**Atlas planet:** Non-abelian Hodge correspondence.

### Scaling and the nonzero Hodge parameter

**Construction:** `HodgeScaling`. Node: `HodgeStructuresPartII:H.1/hodge-scaling`.

The algebraic G_m action t·(λ,E,D)=(tλ,E,tD) on M_Hod preserves stability, the all-Chern-zero component and the determinant section (L,λ∇L). Over G_m, division by λ gives a scheme isomorphism M_Hod×_(A¹)G_m≃M_dR×G_m, also on stable fixed-determinant moduli. At λ=0 it specializes to Higgs scaling θ↦tθ. Scaling an ordinary connection without changing the parameter is not an ordinary connection operation.

**Proof or construction.**

1. Scale both the operator and its relative Leibniz coefficient; exterior curvature scales quadratically, so integrability persists.
2. The inverse over λ≠0 sends D to λ⁻¹D and has determinant ∇L. Construct these maps on the relative parameter functors and descend them through GIT universality.
3. At zero use the same action for the weighted Hitchin coefficients.

**Direct dependencies.** `HodgeStructuresPartII:H.1/hodge-coarse`, `HodgeStructuresPartII:H.1/parameter-families`, `HodgeStructuresPartII:H.1/stability`, `HodgeStructuresPartII:H.1/hitchin-map`, `HodgeStructuresPartII:H.0/intrinsic-preconnection`, `HodgeStructuresPartII:H.0/intrinsic-curvature`.

**Uses.**

- EG20 Lemma 4.9; S96 §9: Provides the nonzero trivialization used alongside the formal and étale local structure at zero.

**API.**

- `HodgeScaling.parameter` (simp): q(t·m)=tq(m).
- `HodgeScaling.action_laws` (structure): 1·m=m and (tu)·m=t·(u·m); the action is a morphism of complex schemes.
- `HodgeScaling.nonzero_equiv` (equivalence): Over λ≠0, (λ,E,D)↦((E,λ⁻¹D),λ) is inverse to ((E,∇),λ)↦(λ,E,λ∇).
- `HodgeScaling.determinant` (compatibility): det(tD)=t det(D) as parameter connections on det E; λ∇L changes to tλ∇L.

**Unit-test obligations.**

- `HodgeScaling.rankOne` (computation): On fixed rank-one M_Hod=A¹, the action is scalar multiplication on λ.
- `HodgeScaling.zero_higgs` (degenerate): The zero-parameter fibre is preserved and the operator becomes tθ.
- `HodgeScaling.unit_parameter` (compatibility): At λ=1, nonzero_equiv sends (E,D) to the same ordinary connection and parameter one.
- `HodgeScaling.fixed_lambda_nonexample` (non-example): For λ=1 and t≠1, t∇ has Leibniz coefficient t; if some df is nonzero, it does not satisfy the ordinary coefficient-one rule.

**Acceptance.** The G_m action and the nonzero product are algebraic.

**Source passages.** [S96](https://arxiv.org/pdf/alg-geom/9604005), §4, pp.18–19, after Proposition 4.1. The action and algebraic trivialization hold only over the nonzero parameter.; [EG20](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), §4.2, Lemma 4.9 proof, p.132. The nonzero product is the H.1 input to the rigid-locus splitting in H.5.

### The principle of two types and trace-free formality

**Theorem:** `two_types_formality`. Node: `HodgeStructuresPartII:H.1/two-types-formality`.

For a harmonic presentation the coefficient complexes satisfy ker D′∩ker D″∩(im D′+im D″)=im(D′D″), yielding natural quasi-isomorphisms from (ker D′,D″) to the de Rham and Higgs complexes and to their cohomology with zero differential. On End(E), and on its trace-zero direct summand End₀(E), these maps preserve the dg Lie bracket. The parameter complex over ℂ[λ] with differential λD′+D″ has the corresponding relative quasi-isomorphisms on the appropriate kernel; its cohomology is the constant harmonic-form module tensored with ℂ[λ].

**Proof or construction.**

1. Apply the common harmonic decomposition and equality of Laplacians to an element exact for either D′ or D″; use the Kähler commutator to obtain a D′D″ primitive.
2. The kernel maps preserve products and hence commutators; trace commutes with the operators and splitting by (1/r)·Id retains the result on End₀.
3. Over ℂ[λ], harmonic representatives and the same two-types primitive argument give the relative quasi-isomorphisms without inverting λ. Generic dg Lie and nilpotent twisting interfaces are recorded as supplier obligations.

**Direct dependencies.** `HodgeStructuresPartII:H.1/kahler-identities`, `HodgeStructuresPartII:H.1/harmonic-correspondence`.


**Acceptance.** For the trivial rank-one object, End₀=0, so the fixed-det deformation complex is zero. The relative claim keeps λ=0; it cannot be proved only by localizing at λ.

**Source passages.** [S92](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf), §2, Lemmas 2.1–2.2 and Corollary 2.3, pp.22–24. The complete two-types proof and multiplicative formality argument were read.; [S96](https://arxiv.org/pdf/alg-geom/9604005), §9, proof of Theorem 9.1, pp.37–38. The relative parameter argument supplies local product structure, not a global moduli product.

### Formal local Hodge product with fixed determinant

**Comparison:** `hodge_formal_product`. Node: `HodgeStructuresPartII:H.1/hodge-formal-product`.

At a polystable fixed-determinant point m of the zero Hodge fibre on fixed X, the formal deformation groupoid of parameter connections is the product of the fixed-det Higgs deformation groupoid and the formal parameter line. Consequently the completed local ring of the coarse Hodge moduli is isomorphic, as a ℂ[[λ]]-algebra, to the completed local ring of the coarse Dolbeault moduli at m with one formal variable. For stable points the scalar stabilizer acts trivially; for polystable points retain the reductive stabilizer action when passing from groupoids to coarse completed rings.

**Proof or construction.**

1. Identify Artinian fixed-det deformations with nilpotent Maurer–Cartan solutions in the actual End₀ harmonic parameter dg Lie complex, with gauge equivalence.
2. Use relative dg Lie quasi-isomorphism invariance to replace it by its constant harmonic cohomology model; keep the stabilizer action equivariant.
3. Apply the supplier’s versal/completed-coarse-ring comparison rather than equating deformation groupoids directly with schemes. The fixed-det trace-zero adaptation of Simpson’s GLr argument is stated explicitly.

**Direct dependencies.** `HodgeStructuresPartII:H.1/hodge-coarse`, `HodgeStructuresPartII:H.1/two-types-formality`, `HodgeStructuresPartII:H.1/stable-automorphisms`, `AlgebraicModuliForArithmeticGeometry:R09.6`.


**Acceptance.** In rank one the completed fixed-det Hodge ring is ℂ[[λ]]. The isomorphism is not claimed canonical in a choice-free moduli sense.

**Source passages.** [S96](https://arxiv.org/pdf/alg-geom/9604005), §9, Theorem 9.1 proof, pp.36–38. The source uses formal deformation equivalence as the input to Artin approximation.

### Étale local triviality of the Hodge morphism

**Theorem:** `hodge_etale_local_product`. Node: `HodgeStructuresPartII:H.1/hodge-etale-product`.

For fixed smooth projective complex X, M_Hod(X,r,L)→A¹ is étale locally isomorphic near each point of its zero fibre to M_Dol(X,r,L)×A¹→A¹, with the analogous stable restriction. The statement includes nonreduced local scheme structure. Together with the nonzero trivialization it supplies local product structure at every parameter. It is not the varying-X/S conjecture and it does not supply a global product over A¹.

**Proof or construction.**

1. Use the completed local product for the finite-type coarse schemes over ℂ and apply Artin approximation/algebraization to obtain a common étale neighborhood realizing the isomorphism over A¹.
2. Take stable neighborhoods because the stable locus is open; determinant was already fixed through the trace-zero deformation problem.
3. At nonzero parameters use the algebraic product from scaling. The precise Artin hypotheses and equivariant coarse-ring bridge are requested inputs.

**Direct dependencies.** `HodgeStructuresPartII:H.1/hodge-formal-product`, `HodgeStructuresPartII:H.1/hodge-scaling`, `AlgebraicModuliForArithmeticGeometry:R09.6`.


**Acceptance.** A singular Dolbeault fibre gives a singular local product; étale triviality does not imply smoothness. An isolated nonreduced Dolbeault germ stays nonreduced in its local Hodge product.

**Source passages.** [S96](https://arxiv.org/pdf/alg-geom/9604005), §9, Theorem 9.1 and full proof, pp.36–38. Only the fixed-X theorem is used; Conjecture 9.3 is not promoted to a theorem.

### Flatness of fixed-X Hodge moduli

**Theorem:** `hodge_parameter_flat`. Node: `HodgeStructuresPartII:H.1/hodge-flatness`.

For fixed X and the stated fixed-det Chern-zero component, the semistable and stable Hodge morphisms to A¹ are flat. Flatness at zero follows from the étale local product and elsewhere from the nonzero product. Smoothness is asserted only where the corresponding fibre is smooth. This is flatness of the coarse Hodge parameter morphism, established by a theorem independent of flatness of universal quotient sheaves.

**Proof or construction.**

1. A product Y×A¹→A¹ is flat because Y is a complex scheme and every module over the field ℂ is flat.
2. Flatness descends through the common étale neighborhoods; cover the zero fibre by them and the complement by the nonzero product.
3. Use the same argument for stable opens. Do not transfer flatness from the universal family or a Quot parameter space.

**Direct dependencies.** `HodgeStructuresPartII:H.1/hodge-etale-product`, `HodgeStructuresPartII:H.1/hodge-scaling`, `AlgebraicModuliForArithmeticGeometry:R09.6`.


**Acceptance.** Rank-one fixed determinant gives the identity A¹→A¹. Flatness alone neither makes the morphism finite nor makes its fibres reduced.

**Source passages.** [S96](https://arxiv.org/pdf/alg-geom/9604005), §9, Corollary 9.2, p.38. The proof is a direct consequence of the fixed-X local product theorem.

## Source and route audit

Sources were read in the precise extents below on 7 October 2026. The packet records their public URL, edition and SHA-256. A read source statement does not close an external proof it imports. The Corlette existence proof and generic supplier proofs in the closure register remain open. The EG20 integrability/variety-name notation slip is the already confirmed parent finding, not a new discovery; the corrected convention is used throughout.

- **S94I** — Carlos T. Simpson, [Moduli of representations of the fundamental group of a smooth projective variety I](https://www.numdam.org/item/PMIHES_1994__79__47_0.pdf). Publications Mathématiques de l’IHÉS 79 (1994), 47–129. Inspected: §1, pp.69–74: Theorem 1.19 and full Theorem 1.21 argument; Luna/Matsushima inputs are identified, not proved here; §2, pp.86–87: split almost-polynomial examples and the Rees operator family; §3, pp.88–98: stability, scalar endomorphisms, complete operator boundedness/openness and parameter-representability proofs; §4, pp.98–110: full operator GIT, coarse-universality and framed-representability arguments; §5, pp.110–119: complete analytic operator/Quot representability and universal categorical quotient proofs.
- **S94II** — Carlos T. Simpson, [Moduli of representations of the fundamental group of a smooth projective variety II](https://www.numdam.org/item/PMIHES_1994__80__5_0.pdf). Publications Mathématiques de l’IHÉS 80 (1994), 5–79. Inspected: §6, pp.11–12: representation scheme and Proposition 6.1 proof; §6, pp.16–25: Dolbeault and de Rham constructions, Proposition 6.6, spectral support and complete Theorem 6.11 proof; §7, pp.26–38: framed and coarse Riemann–Hilbert proofs; compactness, continuity and Theorem 7.18 proof.
- **S92** — Carlos T. Simpson, [Higgs bundles and local systems](https://www.numdam.org/item/PMIHES_1992__75__5_0.pdf). Publications Mathématiques de l’IHÉS 75 (1992), 5–95. Inspected: §1, pp.11–21: metric operators, stability, Theorem 1, Lemmas 1.1–1.2 and Corollary 1.3; §2, pp.22–28: Kähler identities, two-types/formality proofs, eigenvalue estimate and compactness proofs; §3, pp.32–40: dg completion argument, extension comparison, restriction argument and complete Theorem 2 proof.
- **S96** — Carlos T. Simpson, [The Hodge filtration on nonabelian cohomology](https://arxiv.org/pdf/alg-geom/9604005). arXiv alg-geom/9604005, v1, 4 April 1996; preprint pagination. Inspected: §4, pp.18–19: Proposition 4.1 construction, scaling and nonzero trivialization; §9, pp.36–39: complete Theorem 9.1 argument and Corollary 9.2; Conjecture 9.3 is distinguished from the theorem.
- **EG20** — Hélène Esnault and Michael Groechenig, [Rigid connections and F-isocrystals](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf). Acta Mathematica 225 (2020), 103–158; published version. Inspected: §2.1, pp.108–109: definitions, comparison diagram, moduli and complete Lemma 2.1 proof; §4.2, pp.131–132: Hodge moduli and complete Lemma 4.9 proof; arithmetic continuation p.133 inspected only to set boundary.
- **S88** — Carlos T. Simpson, [Constructing variations of Hodge structure using Yang-Mills theory and applications to uniformization](https://math.mit.edu/events/talbot/2011/library/simpson_AMS_variations_hodge_yang-mills.pdf). Journal of the American Mathematical Society 1(4) (1988), 867–918; MIT mirror of published article. Inspected: §2, pp.874–875: compact specialization of analytic hypotheses; §3, pp.875–879: metric identities, Chern–Weil, Theorem 1 and curvature-zero criterion; §§4–7, pp.879–895: functional calculus, Donaldson functional, full coercivity/weak-subbundle argument, heat equation and convergence proof.

The parent route manifest is preserved in its original packet. This part contributes only the target-dependent portions listed here; it does not mark whole routed papers closed.

- `PAPER-ESNAULT-GROECHENIG-20/003`: Complex projective moduli portion planned; arithmetic/Langer base-change portion belongs outside H.1. Supplied by `betti-coarse`, `dolbeault-coarse`, `derham-coarse`.
- `PAPER-ESNAULT-GROECHENIG-20/006`: Projective stable correspondence and isolated-point-preserving homeomorphism planned; stronger regularity is G10 and rigid arithmetic counts belong H.5. Supplied by `harmonic-correspondence`, `nonabelian-hodge-topology`.
- `PAPER-ESNAULT-GROECHENIG-20/007`: Complex analytic comparison planned with G1–G3/G6; no algebraic or étale-fundamental-group identification. Supplied by `horizontal-sections`, `riemann-hilbert-framed`, `riemann-hilbert-coarse`.
- `PAPER-ESNAULT-GROECHENIG-20/062`: Ambient Hodge morphism, exact fibres and action planned; the rigid/quasi-finite sublocus belongs H.5. Supplied by `hodge-coarse`, `hodge-scaling`.
- `PAPER-ESNAULT-GROECHENIG-20/063`: Fixed-X local product and flatness supply H.5. The global rigid-locus splitting theorem itself remains H.5. Supplied by `hodge-formal-product`, `hodge-etale-product`, `hodge-flatness`.

All parent Landesman–Litt, Heuer, Kerr–Pearlstein, p-adic and rigid-arithmetic routes remain with their assigned layers. Their accepted route metadata is not overwritten or declared completed by this H.1 pass.

## Closure register and supplier requests

H.1 has coverage **planned**, with every stated target represented in the graph. It has no closed stage. The following exact missing interfaces and source proofs remain; the packet records every affected node.

### G1 — Global relative operator and bundle carriers

The accepted H.0 affine/intrinsic operator nodes do not yet provide the global sheaf/Rees/PBW construction, the global determinant functor, or smooth/analytic bundle carriers. E1 and C0/C2 also lack a source-checked common underived locally free operator interface. A coherent algebraic connection is locally free on smooth characteristic-zero X, but the general proof/interface must be read and exported; S94II states it in its construction. These interfaces are exact supplier needs, not surrogate carriers defined in H.1.

**Affected nodes:** `torsion-determinant-dictionary`, `parameter-families`, `operator-boundedness`, `operator-git`, `operator-framed`, `dolbeault-coarse`, `derham-coarse`, `hodge-coarse`, `harmonic-bundle`.

### G2 — Reductive GIT, slices and analytic quotient exports

Simpson I imports Mumford finite generation/good quotients, the Hilbert numerical criterion, Matsushima reductivity and Luna slices. The source-specific argument pp.98–109 and the delegated Theorem 1.21 proof pp.71–73 were read, but full proofs of these generic imports were not acquired here. R09.5 currently names particular finite-inertia/quotient cases, not these unrestricted reductive theorems. Its expansion must provide these exact characteristic-zero quotient presentations and their analytic universal quotient bridge; the moment-map compact lift inside Proposition 5.5 remains G9.

**Affected nodes:** `betti-coarse`, `operator-git`, `operator-framed`, `riemann-hilbert-coarse`, `dolbeault-coarse`, `derham-coarse`, `hodge-coarse`.

### G3 — Relative analytic coefficient and Quot representability

C5 states scalar comparison, not the relative locally free coefficient Poincaré theorem on arbitrary nonreduced analytic bases. Simpson II Lemmas 7.4–7.7 give the read proof route. The arbitrary analytic-base representability proof in Simpson I Propositions 5.3–5.4 additionally uses Grauert coherent base change and analytified Quot; projective GAGA on a fixed variety or Artinian base alone is insufficient. Export that bridge with flatness and relative Hilbert polynomial hypotheses, retaining nilpotents.

**Affected nodes:** `horizontal-sections`, `riemann-hilbert-framed`, `operator-framed`, `riemann-hilbert-coarse`.

### G4 — Kähler Hodge theory and the Chern–Weil bridge

No inspected supplier exports compact Kähler coefficient elliptic Hodge decomposition, integration by parts, the primitive-form Riemann bilinear norm identity, Chern–Weil realization with its 2πi conventions, or local constancy of rational characteristic classes in coherent flat families. SF.5 and MC.2 provide the algebraic/realization sides only. C1 is a Stein/coherent stage. A dedicated added layer of ComplexComparisonPartII must supply these differential-geometric interfaces; the coefficient-specific operator identities remain the H.1 nodes.

**Affected nodes:** `chern-component`, `chern-weil-flatness`, `kahler-identities`, `two-types-formality`, `higgs-local-freeness`.

### G5 — Artinian dg Lie and equivariant coarse deformation bridge

The full fixed-X proof of S96 Theorem 9.1 was read. Its nilpotent Maurer–Cartan/gauge invariance and passage to completed coarse rings require actual End_0 dg Lie carriers, relative quasi-isomorphism invariance and equivariance for reductive stabilizers. DGAInfinity L4 supplies finite twisting and its Hochschild-specific gauge regime, not automatically this vector-bundle deformation theorem. R09.6 must also provide the precise Artin approximation/algebraization theorem. The trace-zero fixed-determinant adaptation is a stated required argument, not evidence that the generic formal deformation machinery exists.

**Affected nodes:** `two-types-formality`, `hodge-formal-product`, `hodge-etale-product`.

### G6 — Projective topology and generic restriction inputs

The source proof imports finite presentation of pi_1 of compact smooth projective X, Mehta–Ramanathan operator restriction, Enriques–Severi/Hom restriction and hyperplane Lefschetz for pi_1. The complete Simpson II representation construction and Simpson 1992 §3 adaptation were read; the generic imported proofs and native interfaces were not found. Generic coherent-sheaf restriction belongs with algebraic moduli foundations; projective topological finite-presentation/Lefschetz belongs in a Part II extending UniversalCovers, not a rewrite of the upstream cover construction.

**Affected nodes:** `betti-framed`, `higgs-restriction`, `higgs-local-freeness`, `riemann-hilbert-framed`.

### G7 — Nonlinear Higgs heat flow and weak subbundle regularity

The complete compact specialization of Simpson 1988 §§4–7 was read, including coercivity, normalized logarithms, weak eigenprojections and heat convergence. The proof imports Uhlenbeck–Yau weak-subbundle regularity and nonlinear parabolic existence/continuation and coefficient Sobolev calculus. The existing PDE layers provide linear estimates, not these results. A PDE Part II must expose them under compact smooth-bundle hypotheses before the prototype can state this metric construction natively.

**Affected nodes:** `donaldson-functional`, `higgs-metric-existence`, `harmonic-bundle`.

### G8 — Corlette primary existence proof remains unread

Simpson 1992 Theorem 1(1) is a read primary statement citing Corlette, Flat G-bundles with canonical metrics, JDG 28(3) (1988), 361–382, DOI 10.4310/jdg/1214442469. Attempts to retrieve the public Project Euclid and publisher PDF endpoints returned access-interstitial HTML or HTTP errors rather than paper bytes. No checksum or full-proof reading is claimed for Corlette. Obtain an accessible primary copy and expand the reductive harmonic-map existence/uniqueness inputs in PDE Part II, keeping semisimplicity and compactness explicit.

**Affected nodes:** `flat-metric-existence`, `harmonic-correspondence`, `nonabelian-hodge-topology`.

### G9 — Gauge compactness and moment-map compact lifts

The full Simpson 1992 eigenvalue/norm compactness route and Simpson II §§7.9–7.17 were read. They import Ahlfors/subharmonic estimates, Uhlenbeck unitary gauge compactness, harmonic-map energy bounds and Kempf–Ness/moment-map compact lifts of reductive affine quotients. Neither generic Rellich nor algebraic Hitchin properness supplies them. Full generic proofs/native contracts remain to be read in the proposed PDE Part II and reductive quotient extension. Normalized-frame fibres are U(r) orbits with stabilizers, not asserted free principal U(r) bundles.

**Affected nodes:** `harmonic-compactness`, `nonabelian-hodge-topology`, `riemann-hilbert-coarse`.

### G10 — Regularity beyond the proved coarse homeomorphism

The published EG20 diagram and routed item /006 call the correspondence real analytic. The full proof used here, Simpson II Theorem 7.18, establishes the global coarse homeomorphism. This suffices for stable comparison and isolated-point preservation. A precise real-analytic enhancement, especially across singular coarse loci, has not been established here; determine its smooth/stratified/local meaning before marking the whole stronger routed item closed. No source error is inferred from this proof boundary.

**Affected nodes:** `nonabelian-hodge-topology`.

### G11 — Suggested signatures awaiting actual supplier carriers

Only the two Betti set-level carriers, their eleven API declarations and eight native examples have genuine Lean signatures at the pinned Mathlib baseline. Every other planned declaration and its API/test name is inventoried as an explicit omission in the suggested file. Missing scheme/family, relative operator, coherent/analytic, smooth metric or dg Lie carriers prevent truthful native signatures. These comments are an omission register, not declarations or elaborated tests; a follow-up must replace them after supplying G1–G9.

**Affected nodes:** `stable-automorphisms`, `torsion-determinant-dictionary`, `stability`, `parameter-families`, `betti-framed`, `betti-coarse`, `operator-boundedness`, `chern-component`, `higgs-restriction`, `higgs-local-freeness`, `dolbeault-coarse`, `derham-coarse`, `hodge-coarse`, `horizontal-sections`, `riemann-hilbert-framed`, `riemann-hilbert-coarse`, `harmonic-bundle`, `kahler-identities`, `donaldson-functional`, `higgs-metric-existence`, `chern-weil-flatness`, `flat-metric-existence`, `harmonic-correspondence`, `hitchin-map`, `hitchin-properness`, `harmonic-compactness`, `nonabelian-hodge-topology`, `hodge-scaling`, `two-types-formality`, `hodge-formal-product`, `hodge-etale-product`, `hodge-flatness`, `operator-git`, `operator-framed`.

### Supplier statements

- **`AlgebraicModuliForArithmeticGeometry:R09.1`.** Supply GLr as the determinant-unit affine scheme, Grassmannians with proper invariant-plane incidence images, Hilbert polynomials and degree in the projective Noetherian setting, generic boundedness/Serre vanishing for slope-bounded coherent sheaves, and finite-dimensional spaces of symmetric differential sections as affine schemes.
- **`AlgebraicModuliForArithmeticGeometry:R09.2`.** Supply projective Quot schemes and relative Hom/Isom parameter schemes for the fixed Hilbert polynomial, with universal quotient flatness and all base-change maps. Export the frame-bundle and descent interfaces used in the free auxiliary-frame construction; no parameter-space flatness is inferred from universal-sheaf flatness.
- **`AlgebraicModuliForArithmeticGeometry:R09.5`.** For the particular characteristic-zero reductive quotient presentations here, supply good quotient existence/universality, finite generation of invariants, saturation of stable opens, orbit-closure/S-equivalence descriptions, the Luna slice/principal projective-linear torsor theorem, and the exact allowed base-change statements. Analytification of these quotients must be separately proved as in Simpson I Proposition 5.5. The GLr scalar inertia case is not covered merely by a finite-inertia theorem; the required expansion is recorded in G2.
- **`AlgebraicModuliForArithmeticGeometry:R09.6`.** Supply the comparison of Artinian deformation groupoids with versal/completed local rings, including equivariant reductive stabilizers and coarse invariants. State and prove the Artin approximation theorem giving a common étale neighborhood from an isomorphism of completed finite-type complex local algebras over the parameter line. Retain nonreduced structure and list all algebraization hypotheses.
- **`ComplexComparisonPartII:C0`.** Export coherent analytic locally free sheaves on nonreduced analytic bases, tensor/Hom/pullback, relative differentials and analytic subspace/fibre constructions. The finer repair-analytification node supplies analytification as a representing analytic space; it alone supplies none of these coherent-sheaf interfaces.
- **`ComplexComparisonPartII:C1`.** Supply the coherent analytic cohomology and local analytic solvability used in relative horizontal frames and analytic parameter arguments. Its Stein scope is retained; compact Kähler coefficient Hodge decomposition and integration are additional obligations in G4, not consequences of this stage.
- **`ComplexComparisonPartII:C2`.** Supply projective coherent GAGA, including Artinian nonreduced bases and algebraization of vector bundles, line bundles and operator morphisms. Export relative projective coherent pushforward/base-change with its precise hypotheses. For arbitrary analytic parameter bases, analytified Quot representability and the Grauert theorem used by Simpson I Propositions 5.3–5.4 remain the bridge identified in G3.
- **`ComplexComparisonPartII:C5`.** Supply the scalar holomorphic Poincaré and algebraic de Rham–Betti comparison inputs on the projective base. Relative coefficient horizontal-frame existence and nonreduced analytic base change are the extra statement in G3; scalar hypercohomology comparison alone does not imply it.
- **`EnhancedDerivedSheaves:E1`.** Export the underived sheaf tensor, Hom, dual and exterior/determinant carriers and their coherent locally free pullback comparison. Use the existing Mathlib sheaf-of-modules and locally-free predicate, not a new opaque bundle record. Derived tensor statements alone do not identify the required underived vector-bundle operators.
- **`HodgeStructuresPartII:H.0`.** Export the global relative filtered differential-operator sheaf, its split almost-polynomial/PBW and base-change presentation, and the Rees family with fibres Sym(T_X) and D_X. The accepted affine preconnection and curvature nodes are used directly; they do not by themselves supply these global sheaf constructions. Also globalize top-exterior-power determinant operators and their relative base-line twisting laws.
- **`MotivesAndAlgebraicCycles:MC.2`.** Supply the named rational Betti cycle-class map and its compatibility with Chern classes, cup products and the de Rham realization over the fixed embedding into C. Preserve integral torsion versus rational vanishing. The differential-geometric Chern–Weil and family-local-constancy bridge is separately G4.
- **`SchemeAndStackFoundations:SF.5`.** Supply Chern classes, degree/intersection, exact-sequence formulas and the source-scoped Grothendieck–Riemann–Roch normalization giving P_E=rP_O when all rational Chern classes vanish. This is the algebraic input; the analytic Chern–Weil realization bridge is separately G4.
- **`tauceti:TauCetiRoadmap/DGAInfinity#layer-4-bar--cobar-dg-strictification-and-controlled-maurer--cartan-twisting`.** Import finite strictly upper-triangular dg-category twisting and extension completion over C, with Hom-wise flat complexes. Export invariance of the category of finite successive extensions under quasi-equivalences by the finite nilpotent filtration argument. The End_0 dg Lie Artinian gauge/coarse deformation bridge needed for Hodge formal products is not the upstream Hochschild-specific deformation theorem and remains G5.
- **`tauceti:TauCetiRoadmap/PDE#milestone-a-4`.** Import the stated Sobolev/Morrey embedding estimates. Their extension from the upstream domains to finite atlases and vector-bundle coefficients, spectral functional calculus and gauge operators is the precise additional analytic bridge in G7 and G9.
- **`tauceti:TauCetiRoadmap/PDE#milestone-a-6`.** Import the upstream Rellich compactness theorem under its domain and norm hypotheses. Supply its bundle-local patching interface before using it in weak metric or gauge convergence; Uhlenbeck gauge compactness itself is not Rellich and is G9.
- **`tauceti:TauCetiRoadmap/PDE#milestone-c-13`.** Import the upstream weak/strong maximum principles under their hypotheses. They are estimates inside the Higgs metric heat argument, not a supplier of nonlinear bundle heat-flow existence or weak-subbundle regularity; those remain G7.
- **`tauceti:TauCetiRoadmap/PDE#milestone-e-20`.** Import the stated interior elliptic Hk/bootstrap estimates. Compact coefficient Hodge decomposition, global integration by parts and nonlinear gauge regularity require the additional inputs G4/G7/G9 and are not inferred from this linear estimate.
- **`tauceti:TauCetiRoadmap/UniversalCovers#stage-0-port-the-foundations-into-tauceti`.** Import the existing path-based fundamental group, universal cover, covering action and descent interface for local systems. Finite presentation of pi_1 of a smooth projective complex variety and the hyperplane Lefschetz theorem are additional projective topology obligations in G6; they are not claimed in this upstream layer.

### Ownership proposals

- Remove the ambiguity in projective stable moduli without changing the projective-X target. Describe H.1 as quasi-projective stable moduli on a smooth projective complex base, with analytic Riemann–Hilbert, topological non-abelian Hodge, and fixed-X Hodge étale local products. Keep arithmetic rigid-locus splitting and every p-adic comparison in H.5 or its other assigned layers.
- The particular reductive presentations and generic coherent-sheaf restriction used here need exact supplier statements beyond finite-inertia wording. Add source-scoped characteristic-zero reductive GIT/Luna and analytic good quotient exports under R09.5, plus generic coherent-sheaf Mehta–Ramanathan/Hom restriction under the projective sheaf foundations. Keep H.1 operator-specific stability and boundedness adaptations here.
- The Stein/coherent and scalar comparison layers omit compact differential-geometric inputs. Add a compact Kähler coefficient-Hodge/Chern–Weil layer, and extend the relative coefficient Poincaré/Grauert/analytified Quot handoff with explicit nonreduced-base and flatness hypotheses. Keep generic GAGA/coherent objects in this supplier.
- Extend the upstream direction rather than changing its existing linear PDE plan. Create PDE, Part II: compact vector-bundle nonlinear heat flow, weak invariant-subbundle regularity, reductive harmonic maps and Uhlenbeck gauge compactness. It imports upstream Sobolev, Rellich, maximum and elliptic estimates and supplies G7–G9 under the precise compact/gauge hypotheses.
- The existing path-based covering theory is not a projective topology theorem. Create Universal covers, Part II: finite presentation of compact smooth projective fundamental groups and hyperplane Lefschetz interfaces, importing the existing path-cover construction unchanged.
- Finite twisting and Hochschild deformation do not automatically identify End_0 bundle deformation groupoids. Create DGA and infinity structures, Part II: source-scoped nilpotent dg Lie Artinian gauge invariance and equivariant geometric deformation interfaces. Import upstream finite twisting and coordinate the completed-coarse-ring and Artin exports with R09.6; leave the harmonic coefficient formality argument in H.1.

## Baseline and signature boundary

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every baseline citation was checked by reading its actual pinned statement; the declaration index is only a search aid. The reviewed library audit has no H.1 entry, and upstream HodgeStructures L0–L3 is reused rather than replanned. The Tau Ceti HolomorphicSheaf carrier inspected at the pinned revision concerns holomorphic functions on ℂ and does not supply a general complex analytic space or bundle carrier.

- `mathlib:Representation` — Monoid homomorphisms into module endomorphisms; use the existing carrier for the matrix representation adapter. Source module: `Mathlib/RepresentationTheory/Basic.lean`.
- `mathlib:Representation.IsIrreducible` — IsSimpleOrder on Subrepresentation; excludes the zero representation as well as proper invariant subspaces. Source module: `Mathlib/RepresentationTheory/Irreducible.lean`.
- `mathlib:Representation.Equiv` — A linear equivalence that intertwines the two monoid actions; supplies the actual relation used by the Betti class quotient. Source module: `Mathlib/RepresentationTheory/Intertwining.lean`.
- `mathlib:Representation.IsIrreducible.algebraMap_intertwiningMap_bijective_of_isAlgClosed` — Schur lemma for finite-dimensional irreducible representations over an algebraically closed field: all intertwining endomorphisms are scalars. Source module: `Mathlib/RepresentationTheory/Irreducible.lean`.
- `mathlib:Representation.IsIrreducible.finrank_eq_one_of_isMulCommutative` — A finite-dimensional irreducible representation of a commutative monoid over an algebraically closed field has dimension one. Source module: `Mathlib/RepresentationTheory/Irreducible.lean`.
- `mathlib:Matrix.GeneralLinearGroup` — The native group of units of square matrices over a commutative ring, including the empty matrix index. Source module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.det` — The multiplicative determinant homomorphism to ring units; composed with a representation to fix its determinant character. Source module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.scalar` — Scalar units as a multiplicative homomorphism into the native matrix general linear group. Source module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.det_scalar` — The determinant of scalar u is u to the cardinality of the matrix index. Source module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.toLin` — Multiplicative equivalence from matrix units to units of module endomorphisms on the coordinate module. Source module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Units.coeHom` — The multiplicative homomorphism from units to their underlying monoid; converts invertible linear actions to Representation. Source module: `Mathlib/Algebra/Group/Units/Hom.lean`.
- `mathlib:isOfFinOrder_iff_pow_eq_one` — Finite order is existence of one positive exponent annihilating the entire group element; here the element is the determinant character, with pointwise multiplication. Source module: `Mathlib/GroupTheory/OrderOfElement.lean`.
- `mathlib:SheafOfModules.IsLocallyFree` — The existing locally free module-sheaf predicate, expressed by local free generators whose maps are isomorphisms; no replacement sheaf carrier is proposed. Source module: `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean`.

The [suggested file](../suggested/HodgeStructuresPartII--H.1.lean) has genuine signatures for `BettiStableRepresentation`, `BettiStableClasses`, eleven API declarations and eight examples on native Mathlib carriers. It elaborates at the pinned Mathlib revision. The global geometric and analytic declarations are explicitly omitted because their supplier carriers are unavailable; every omitted declaration, API and test name appears in its omission inventory. Those comments are not signatures or elaborated tests. The signature coverage records in the packet and G11 make this limitation reviewable. An independent reviewer must assess the planning pass with this limitation intact.

This pass has 36 nodes (4 definition, 10 construction, 1 lemma, 3 comparison, 18 theorem), 59 API items, 56 unit-test obligations, six planets and thirteen baseline declarations. The [handoff](../handoff/BP-HodgeStructuresPartII--H.1.md) records validation and the exact continuation work.
