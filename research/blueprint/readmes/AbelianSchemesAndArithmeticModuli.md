# The Jacobian challenge (Christian Merten’s AG version), Part II: abelian schemes and arithmetic moduli

This roadmap extends the field abelian-variety foundation of **JacobianChallenge, Layer E**, and uses **ModularCurves** for the relative elliptic specializations. Its new work is dimension-general relative geometry, finite-flat quotients, degree-one realizations, structured deformation categories, polarized complex families, and arithmetic Hom. The accepted RS-02 boundary is binding. Existing carriers and constructions are cited through their exact interfaces; their presence is not evidence that every consuming theorem has been implemented.

The target-level planning pass is complete. All seven layers are planned, with fifteen explicit proof/source obligations and seventeen supplier contracts. Every declaration has implementation status **unchecked**. Packaging must preserve the explicit proof obligations and the distinction between planned targets and proved implementations. The packet is definitive for IDs and dependencies; this document states the same targets in mathematical form. The suggested file elaborates the available native signatures and records each omitted signature whose carrier or condition is unavailable.

## Starting objects and conventions

An abelian scheme is the proper smooth group object in `Over S` with geometrically connected fibres supplied by **AlgebraicModuliForArithmeticGeometry R09.4/arith-abelian-scheme**. A polarization is extra data; the definition does not choose a global ample line. R09.4 also owns the relative dual and polarization carriers, local representatives and canonical doubled graph bundle. A1–A2 supply the additional comparison and proof targets, including Raynaud’s scheme theorem, without introducing competing definitions. Relative dimension is a locally constant natural-number-valued function. Work componentwise when the base is disconnected. The dimension-zero object is the identity group over S; its multiplication map has rank one even in characteristic p.

Over a field use native `TauCeti.AlgebraicGeometry.AbelianVariety k`. Its proper geometrically integral definition supplies smoothness, geometric connectedness and commutativity. Its existing Hom, End, multiplication, products, base change and isogeny types are retained. The native Hom group is written multiplicatively and is additively reindexed when rationalizing; End already provides its ring. The underlying dimension has type `WithBot ℕ∞`; a finite dimension g in a prototype is accompanied by an equality with that native dimension. No integer-valued surrogate carrier is substituted.

The relative Picard functor is an fppf sheafification, with the base-line ambiguity removed only after a rigidification is supplied. The Poincaré line has both zero-face trivializations agreeing at the origin. We use φ_L(a)=t_a*L⊗L⁻¹, with the relative section-fibre and zero-fibre corrections given in A2. On an elliptic curve this sends a to O([−a]−[0]) for L=O(0); this is the positive self-duality convention. Graph pullback along (id,λ) has Mumford map **2λ**, not λ.

Isogeny degrees and torsion are scheme-theoretic. A finite-flat kernel of order p² is not replaced by its geometric points. For ℓ invertible on the base the integral Tate object has rank 2g and its dual pairing lands in Z_ℓ(1). In ordinary characteristic-p deformation coordinates, the **étale p-divisible factor** has height g; it is not that prime-to-characteristic rank-2g Tate module. Cohomological H¹ is the dual of homological Tate realization and has inverse-cyclotomic multiplier. Complex H₁ has weight −1 and types (−1,0),(0,−1); H¹ is its weight-one dual.

For a complex structure J, write the Hermitian form linear in its first argument and set E=Im H. Positivity is E(Jv,v)>0. Integral Riemann forms can have elementary divisors other than one; principal polarization is the additional unimodularity condition. The existing native **TauCeti.Hodge.HodgeStructure**, **IsPolarization** and **Polarization**, the weight-one Hodge/complex-structure equivalence, and current **AlgebraicVectorBundles L0B/L0C/L2A/L2B** bundle operations and vector-group total spaces are imports. Native integral nondegeneracy does not itself mean unimodularity. Their existence does not make every integral polarized lattice or analytic-family comparison native.

## Dependency architecture

A0 imports the lower-tier general representability/cohomology stages. A1 specializes the relative carrier, rigidity and line identities. A2 combines normalized duality with the abelian scheme criterion and positivity. A3 constructs the nonaffine finite-flat quotient and the torsion pairings. A4 owns the minimal integral Tate, arbitrary-height BT and abelian PD deformation interfaces required at this tier. A5 constructs polarized complex and analytic-family comparisons. A6 uses those targets for arithmetic Hom, degree, coefficient torsors and twists. Dependencies are at node level: the order of layer headings is not a claim that every result in a layer precedes every result in the next.

The arithmetic core is acyclic. Prime-to-characteristic torsion density proves Hom faithfulness and divisibility. Degree polynomiality and complete reducibility then prove Hom finiteness through saturated lattices in **finite rational subspaces**, before a global rank is known. Only afterwards does integral dependence of End prove characteristic-polynomial integrality. Integer-valuedness of a rational polynomial is not used to deduce integral coefficients. The Tate determinant comparison is established within the polynomial construction and exported as its own theorem. Rosati positivity uses the exterior cup-product trace calculation of Milne 2022, §17, with its cohomology proof obligation visible.

The upstream tier order overrides older upward references. A4’s minimal BT tower, degree-one PD evaluation and abelian filtration-lifting theorem move below FiniteFlatGroupsAndIntegralPadicHodgeTheory and CrystallineCohomology. The general classification, crystalline site and p-adic comparison remain with those owners. The abelian Tate local system and the finite-index restriction/induction comparison move below ArithmeticGaloisRepresentations. The genus-one analytic specialization moves below ModularCurvesPartII R12.1 while preserving the immutable native elliptic scheme. The handoff gives the exact redirections. No new PEL/Siegel/Hilbert moduli stack is constructed here.


## A0. Relative algebraic geometry: imported contracts

This layer is an import and reexport boundary. The general Picard, Hilbert, algebraic-space, coherent-base-change and Artin criteria retain their source hypotheses. Resolution R09.7 is outside the boundary. The field and elliptic comparisons explicitly identify group laws and normalized pairings.


### Field and elliptic comparison interfaces

**Target:** `A0/field-and-elliptic-boundary` (comparison).

The relative carrier imported from R09.4 specializes over Spec k to Tau Ceti’s AbelianVariety k, through the smooth/proper/geometrically-connected and proper/geometrically-integral descriptions. The genus-one carrier, group law, rigidified Picard dual, and finite-flat Cartier duality are the existing ModularCurves interfaces. The comparisons preserve zero, addition, products, pullback, and the chosen Poincaré rigidifications. In dimension zero the object is S with its identity structure map.

Proof route: Use smooth geometric fibres to recover geometric integrality over a field; use the existing field smoothness theorem in the opposite direction. Transport group-object maps through these equivalences; compare the elliptic dual by its universal rigidified line bundle, retaining the sign of its canonical polarization.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`, `tauceti:TauCetiRoadmap/ModularCurves#2d-picard-duality-and-comparison-of-the-duals`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`.

Sources: faltings-chai — I.1.1–1.2, pp.1–2; I.1, pp.3–5 (The relative definition and duality data identify the field and elliptic boundaries.); conrad-polarizations — Example 2.5, p.7 (The divisor-class elliptic self-duality differs by a sign from the positive polarization.).

Acceptance: The identity scheme has dimension zero; no positivity exception is silently imposed. The elliptic map a↦O([−a]−[0]) is the positive polarization when φ_L uses t_a*L.


### Relative moduli import contracts

**Target:** `A0/relative-moduli-imports` (comparison).

Reexport R09.1 projective/coherent foundations, R09.2 Hilbert graphs, R09.3 algebraic spaces and descent, R09.4 abelian carrier/dual/polarization definitions, R09.5 Artin representability and R09.6 proper-flat coherent base change, with A0-extension fppf Picard, rigidified Picard and Pic⁰ sheaves. Each use retains finite presentation, flatness, section, base-change and sheafification hypotheses. This is an import boundary and imports no R09.7 resolution or higher moduli space.

Proof route: Read each supplier’s exact contract and instantiate it only in the consuming layer; a Picard sheaf is not the un-sheafified quotient of line bundles on points.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.6`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-rigidified-picard`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-zero-sheaf`.

Sources: faltings-chai — I.1.5–1.9, pp.3–7 (The Picard/dual criterion is specialized only after its abelian hypotheses are checked.).

Acceptance: Do not assume arbitrary proper algebraic spaces are schemes.

## A1. Abelian schemes, rigidity and normalized lines

Use proper smooth geometrically connected fibres on arbitrary bases, including nonreduced ones. Translations are distinct from pointed homomorphisms. The reduced-base fibre test for seesaw is not used on an infinitesimal Picard class. Normalization supplies canonical cube and power identities and distinguishes symmetric from antisymmetric exponents.


### Relative products, pullback and dimension

**Target:** `A1/relative-products-and-dimension` (theorem). **Planet:** Abelian schemes.

For abelian schemes A,B over any scheme S, A×_S B is an abelian scheme; arbitrary base change gives A_T, and the canonical product/pullback comparisons respect all group laws. The geometric-fibre dimension g_A:S→N is locally constant, with g_(A×B)=g_A+g_B and g_(A_T)=g_A∘(T→S). A dimension-zero abelian scheme is canonically the identity group scheme S.

Proof route: Apply the native properness, smoothness and geometric connectedness pullback/product properties. Smooth proper fibres give local constancy of dimension; a smooth proper connected zero-dimensional fibre is a point, so the zero section is an isomorphism.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`.

Sources: faltings-chai — I.1.1–1.2, pp.1–2 (The relative carrier is stable under these operations.); milne-2022 — §20, pp.42–43 (Abelian schemes are families of abelian varieties.).

Acceptance: Test disjoint base components with dimensions one and two. Product with the identity scheme is canonically unchanged.


### Rigidity over nonreduced bases

**Target:** `A1/relative-rigidity-comparison` (comparison).

The imported zero-preserving rigidity theorem holds over arbitrary S, including nilpotent thickenings: every S-map A→B between abelian schemes is the composite of a unique homomorphism h and translation by f∘e_A. Zero-preserving homomorphisms restrict injectively across nilpotent closed immersions S_0→S; the relative Hom functor is formally unramified. Automatic commutativity and the equality of group structures with the same zero section follow from the same rigidity input.

Proof route: Apply relative rigidity to f−f(e_A) and to the difference of two lifts. Use cohomological flatness in degree zero in the rigidity argument, rather than equality on reduced geometric points; nilpotent sections cannot be discarded.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `SchemeAndStackFoundations:SF.4/formally-smooth-morphism`.

Sources: milne-2022 — Proposition 20.1 and Corollary 20.2, pp.42–43 (These are the relative rigidity and automatic-homomorphism statements.); katz-serre-tate — §1.1, Lemma 1.1.3; pp.141–143 (Restriction on Hom across nilpotent thickenings is injective.).

Acceptance: A translation by a nonzero section is not zero-preserving. An infinitesimal translation on S=Spec k[ε] is distinguished from the zero map.


### Invariant forms and coherent constants

**Target:** `A1/relative-invariant-forms` (theorem). **Planet:** Invariant differentials.

For π:A→S an abelian scheme, O_S≃π_*O_A universally, and evaluation at zero identifies π_*Ω¹_(A/S)≃ω_A=e*Ω¹_(A/S). Translation gives Ω¹_(A/S)≃π*ω_A, where ω_A is locally free of rank g_A; Lie(A/S)=ω_A^∨. These maps commute with arbitrary base change. The trivial tangent/cotangent bundles here are relative bundles, not assertions about the absolute tangent bundle over a varying base.

Proof route: Reuse the general group-scheme invariant differential isomorphism. Use proper smooth geometrically connected fibres and coherent degree-zero base change for universal constants, then the projection formula to identify global relative forms.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `SchemeAndStackFoundations:SF.3/invariant-differentials`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

Sources: faltings-chai — I.1.1–1.2, pp.1–2 (Smooth proper connected groups supply the relative invariant bundle.); conrad-feng — Lemma 2.2.1, p.17; §1.5, pp.8–10 (Universal constants and translation-invariant forms yield the relative adapter.); caro-pasten — §§7.1,9.3; pp.25–26,36–37 (The DVR differential lattice is this invariant bundle.).

Acceptance: Over a DVR the module is free of rank g and agrees on both generic and special fibres. For g=0 it is zero.


### Relative seesaw with rigidification

**Target:** `A1/relative-seesaw` (theorem).

Let X→S be proper flat of finite presentation with geometrically integral fibres, S reduced locally noetherian, and e:S→X a section. If L restricts trivially to every geometric fibre, then π_*L is invertible, commutes with arbitrary base change, and π*π_*L→L is an isomorphism; thus L≃π*e*L. A rigidification makes the resulting trivialization unique. For abelian schemes the normalized Picard functor supplies the corresponding seesaw comparison over arbitrary bases; the reduced-base fibre test is not used to erase infinitesimal Picard classes.

Proof route: Use fibrewise h⁰=higher-constant ranks and coherent base change for the reduced-base assertion. For general bases retain the full rigidified Picard class and prove equality as sheaf sections, rather than checking only geometric fibres.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-rigidified-picard`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`.

Sources: xie-yuan — Lemma 4.1 proof, p.20 (The seesaw argument removes the base line bundle by the zero section.); conrad-feng — Theorem 3.1.1 and Exercise 3.1.4, pp.25–26 (The field-product seesaw and cohomological descent argument provide the comparison.).

Acceptance: A nontrivial infinitesimal point of A∨ on k[ε] is fibrewise trivial but not the trivial Picard section. On a product X×S, π*M is recovered as M by e*.


### Relative cube and multiplication pullback

**Target:** `A1/relative-cube-and-power` (theorem). **Planet:** Theorem of the cube.

For an abelian scheme A/S and a line bundle L rigidified at zero, the alternating tensor of its seven nonempty subset-sum pullbacks on A³ is canonically trivial, with compatible face rigidifications. For every integer n, [n]*L≃L^{n(n+1)/2}⊗([-1]*L)^{n(n−1)/2}, compatibly with rigidification and base change. Consequently symmetric L has [n]*L≃L^{n²}, antisymmetric L has [n]*L≃L^n, and [2]*L≃L³⊗[-1]*L in general. For unrigidified L the formula includes the zero-fibre line from S. For symmetric rigidified L, the sum/difference map (x,y)↦(x+y,x−y) pulls L⊠L back to L²⊠L².

Proof route: Extend the field cube trivialization to the relative normalized Picard sections using rigidity and seesaw. Apply the cube recurrence to integer multiplication, including negative n; normalize at zero to identify the isomorphisms uniquely.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-rigidified-picard`, `AbelianSchemesAndArithmeticModuli:A1/relative-rigidity-comparison`, `AbelianSchemesAndArithmeticModuli:A1/relative-seesaw`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.

Sources: faltings-chai — Theorem I.1.3, p.1 (The relative cube includes the base normalization.); xie-yuan — Lemma 4.1(1), pp.19–20 (Symmetric and antisymmetric pullback exponents are the consumer formulas.); conrad-feng — Theorem 3.1.6, pp.27–28 (The cubical face normalization gives canonical compatible isomorphisms.).

Acceptance: For n=0 the pullback is O_A after rigidification; for n=−1 the formula is [-1]*L. The generic theta-class identity uses exponent three on L, not a symmetric exponent four without a hypothesis. For E×E the mixed biextension cancels in the sum/difference pullback; the result is not a diagonal pullback.

### Relative elliptic equivalence

**Target:** `A1/relative-elliptic-equivalence` (comparison).

Relative-dimension-one abelian schemes over S are equivalent to the native pointed smooth proper genus-one curves of ModularCurves. The equivalence preserves zero, group law, invariant differential bundle, dual/Poincaré normalization, multiplication and Cartier–Nishi/Weil pairing. Over a field it agrees with the existing field carrier. The genus-zero identity is a separate object, not an elliptic curve.

Proof route: The rank-one invariant differential and fibrewise trivial canonical bundle show smooth proper dimension-one fibres have genus one. Use the native Weierstrass/pole-sheaf construction and its unique pointed group law. For the converse use the existing elliptic proper smooth group scheme. Uniqueness of normalized Picard/Poincaré data compares differentials and pairings, without constructing new elliptic objects.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`, `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`, `tauceti:TauCetiRoadmap/ModularCurves#2d-picard-duality-and-comparison-of-the-duals`, `A0/field-and-elliptic-boundary`, `A1/relative-invariant-forms`.

Sources: faltings-chai — I.1.1–1.2, pp.1–2 (The dimension-one relative group satisfies the elliptic fibre conditions.).

Acceptance: Over k[ε] the comparison preserves the whole pointed scheme and its differential, not only the reduced fibre.


### Torsion restrictions of rigidified line bundles

**Target:** `A1/torsion-restriction-of-rigidified-lines` (theorem).

For a rigidified L on A/S and n≥1, L|_(A[n]) is torsion in Pic(A[n]). If L is symmetric its n²-th tensor power is trivial there; if antisymmetric its n-th power is trivial. For arbitrary L the decomposition L²=(L⊗[-1]*L)⊗(L⊗([-1]*L)^−1) gives an explicit annihilating tensor power 2n². The same statements hold on any torsion multisection contained in A[n], including connected nonétale torsion.

Proof route: Restrict [n]*L to the kernel and use the retained zero rigidification. Apply the symmetric/antisymmetric decomposition to obtain the general bound without dividing by two in Pic.

Inputs: `A1/relative-cube-and-power`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`.

Sources: xie-yuan — Lemma 4.1(2) and proof, p.20 (The torsion claim is for rigidified line bundles on actual torsion subschemes.).

Acceptance: No reduced-points argument is used on μ_p or α_p. The symmetric bound is n², while n suffices in the antisymmetric case.


## A2. Duality, polarizations and ample classes

Relative dual objects are imported from their lower-tier owner, while Raynaud’s abelian-algebraic-space-to-scheme theorem is an explicit consuming proof target over any base. Normal-base projectivity and prescribed generic-line extension are separate stronger assertions. Rational NS comparison works in characteristic two by the doubled graph construction; positivity and principalness remain separate conditions.


### The Rosati involution of a polarization

**Target:** `A2/rosati-involution` (definition). **Planet:** Rosati involution.

For a field abelian variety and polarization λ, Rosati is the Q-linear anti-involution α†=λ^−1 α∨ λ on End⁰ A. It fixes rational scalars, is involutive under the fixed biduality, and is the adjoint for the polarized rational Tate pairing with its cyclotomic target. For principal λ it preserves integral End A. Rational NS/symmetric-Hom comparison is a separate theorem, valid in every characteristic; no NS hypothesis is part of the definition.

Hypotheses and conventions: † depends on λ. For a principal polarization it preserves End(A); for general λ it preserves End⁰(A) only. The source prints (αβ)† = β α without daggers; the author's errata page corrects this to β†α†. No restriction on the characteristic is part of this definition. The separate rational NS comparison uses the doubled graph bundle, so it does not require the odd-characteristic integral symmetric-Hom criterion.

Proof route: Finite kernel quotient supplies a rational inverse of λ. Contravariant duality proves anti-multiplicativity; symmetry of λ proves involutivity. Poincaré naturality gives adjointness after tensoring the Tate pairing with Q_ℓ. Principal λ has an integral inverse.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-dual`, `AbelianSchemesAndArithmeticModuli:A3/torsion-divisibility`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`.

Sources: milne-abelian-varieties — §14, p. 61 (The definition α† = λ⁻¹α^∨λ.); milne-abelian-varieties — §14, p. 61 (Additivity, anti-multiplicativity and ℚ-linearity.); milne-abelian-varieties — §11, p. 53 (A polarization is an isogeny that becomes φ_L for L ample over k̄.).

API outline:

- `TauCeti.AlgebraicGeometry.AbelianVariety.Polarization.rosati` (constructor): Polarization.rosati (λ : Polarization A) : End⁰ A ≃ₗ[ℚ] (End⁰ A)ᵐᵒᵖ, α ↦ λ⁻¹ ∘ α^∨ ∘ λ.
- `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_mul` (simp): (α * β)† = β† * α†.
- `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_rosati` (simp): α†† = α.
- `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_algebraMap` (simp): (algebraMap ℚ _ a)† = algebraMap ℚ _ a.
- `TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing_rosati` (compatibility): e_ℓ^λ (α x) y = e_ℓ^λ x (α† y).
- `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_principal_mem_End` (characterisation): For λ principal, α ∈ End A → α† ∈ End A.

Unit tests:

- `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_elliptic` (computation): For an elliptic curve with its principal polarization, α† is the dual isogeny and αα† = [deg α].
- `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_mulBy` (degenerate): [n]† = [n] for every polarization.
- `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_not_multiplicative` (non-example): † is not multiplicative: for a supersingular E over 𝔽̄_p and non-commuting α, β ∈ End(E), (αβ)† = β†α† ≠ α†β†.
- `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_product` (computation): On E × E with the product principal polarization, † is conjugate transpose on M_2(End⁰(E)).

Uses: AbelianSchemesAndArithmeticModuli:A6/rosati-positivity — the positive definite trace form Tr(αα†); AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties — automorphisms of (A, λ) are the α with α†α = 1; DeligneWeightsAndPurity:DWP.1 — π†π = q for the Frobenius, which gives the √q bound; FaltingsFinitenessAndIsogenyTheorems:R28.1 — the automorphism and polarization finiteness statements.

Acceptance: Elliptic curve E with λ principal: α† is the dual isogeny α̂, and αα† = [deg α]. A = E × E with the product principal polarization: † is the conjugate transpose on M_2(End⁰(E)).

### Raynaud scheme representability

**Target:** `A2/raynaud-scheme-representability` (theorem). **Planet:** Raynaud representability.

Over any scheme S, every abelian algebraic space (a smooth proper group algebraic space with geometrically connected fibres) is represented by a scheme. For an abelian scheme A/S the fppf relative Picard sheaf Pic_(A/S) is also represented by a scheme, locally of finite presentation, with Pic⁰ represented by its smooth proper identity component. Over affine S, any finite set of points of an abelian scheme lies in an affine open. No normality, reducedness, noetherianity, or globally chosen polarization is a hypothesis of these representability conclusions.

Proof route: Prove algebraic-space Picard representability using the existing criterion, coherent deformation inputs and noetherian approximation. Apply the Raynaud reduction to finite type bases, normal generic polarization, normalization and conductor gluing; descend scheme representability and the finite-set affine-neighbourhood property. The normal-base projectivity step is only an intermediate step.

Inputs: `SchemeAndStackFoundations:SF.1/artin-bootstrap`, `SchemeAndStackFoundations:SF.1/space-fibre-products`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`, `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-zero-criterion`, `AbelianSchemesAndArithmeticModuli:A1/relative-products-and-dimension`.

Sources: faltings-chai — Theorem I.1.9 and proof, pp.5–7 (The final theorem is over arbitrary schemes; its proof uses more restrictive bases only in reductions.).

Acceptance: Test a nonreduced affine base and a disconnected base. Do not infer that every abelian scheme over every S is globally projective.

### Ample cohomology, Riemann–Roch and degree

**Target:** `A2/ample-cohomology-and-degree` (theorem). **Planet:** Abelian Riemann–Roch.

For an ample line bundle L on a dimension-g abelian variety, H^i(A,L)=0 for i>0, h⁰(A,L)=χ(L)>0, χ(L)=c₁(L)^g/g!, and deg φ_L=χ(L)². More generally the last two formulas hold for any L, with degree zero for a nonisogeny φ_L. For relatively ample L on A/S, π_*L is locally free, commutes with arbitrary base change and has fibre rank h⁰(L_s); higher direct images vanish. For an isogeny f:B→A, h⁰(B,f*L)=deg(f)h⁰(A,L). For g=0 all ranks and degrees here are one.

Proof route: Trivialize the tangent bundle by translation, so its Todd class is one, and apply Hirzebruch–Riemann–Roch. Prove the abelian ample vanishing by multiplication pullback and trace with a prime-to-characteristic multiplier and Serre vanishing; use the theta/correspondence degree calculation for χ(L)², including inseparable kernel length. Use coherent base change for the family and the finite-isogeny projection formula for section ranks.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `A1/relative-invariant-forms`, `SchemeAndStackFoundations:SF.5/hirzebruch-rr`, `SchemeAndStackFoundations:SF.5/chern-projection`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

Sources: milne-2022 — Theorem 13.3, p.25 (The degree-square, Euler-characteristic and nondegenerate cohomology assertions are the field theorem.); faltings-chai — I.1.6, p.4 (The relative ample pushforward is locally free and its rank squared is the polarization degree.); conrad-feng — §7.5, pp.69–72 (Ample line bundles and their cohomology give the section-rank interpretation.).

Acceptance: For O(d·0) on E, h⁰=d and deg φ=d². On E² with product degrees 1,2, h⁰=2, top intersection=4 and polarization degree=4.


### Normalized Poincaré and relative dual comparison

**Target:** `A2/normalized-poincare-comparison` (theorem). **Planet:** Relative duality.

For the imported A∨=Pic⁰_(A/S), its Poincaré line P on A×_S A∨ has trivializations on both zero faces agreeing at (0,0). Evaluation identifies A with A∨∨. Dual maps are contravariant and compatible with arbitrary base change and products; under the field and elliptic adapters the comparison identifies the rigidified line bundle itself. Biduality on abelian schemes and finite-flat Cartier biduality are tracked separately: after interchanging factors the intrinsic Weil pairings are inverse, not equal.

Proof route: Use the two-fold rigidified universal property to compare duals and Poincaré bundles. Obtain evaluation biduality fibrewise from Layer E and extend with relative rigidity; record the evaluation/Cartier sign in the torsion comparison.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-dual`, `AlgebraicModuliForArithmeticGeometry:A0-extension/section-rigidified-picard`, `A2/raynaud-scheme-representability`, `A0/field-and-elliptic-boundary`.

Sources: faltings-chai — I.1, pp.3–5 (Duality, Poincaré normalization, biduality and dual isogenies are relative constructions.); conrad-polarizations — §1, pp.1–5; §3, p.8 (Correspondences fix the dual and the sign under swapped Weil pairing factors.).

Acceptance: The elliptic divisor self-duality and positive polarization are compared with the sign fixed in A0. A base line bundle twist is excluded by the two rigidifications.


### Projective presentations over normal bases

**Target:** `A2/projective-presentation-over-normal-bases` (theorem).

An abelian scheme over a noetherian normal base is projective. Over a regular integral base, a symmetric ample line on the generic fibre has a positive tensor power extending to a symmetric rigidified relatively ample line bundle. For a smooth projective curve base this yields an absolutely projective total space. After tensoring by a sufficiently ample base line and taking a suitable positive power, it gives a projective presentation over S. On each field fibre L^n is very ample for n≥3, and its complete embedding is projectively normal for n≥3; using n≥4 gives the uniform interface needed by the routed height papers.

Proof route: Use the normal-base polarization-extension step of Raynaud’s theorem, then symmetrize and rigidify. Use the abelian very-ampleness and multiplication-of-sections theorem for powers of ample L; relative coherent base change promotes the fibre embedding to a relative embedding. Apply the relative-to-absolute ample theorem after adding a base ample line; do not assert global projectivity for arbitrary nonnormal bases.

Inputs: `AbelianSchemesAndArithmeticModuli:A2/raynaud-scheme-representability`, `AbelianSchemesAndArithmeticModuli:A2/ample-cohomology-and-degree`, `AbelianSchemesAndArithmeticModuli:A1/relative-cube-and-power`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

Sources: faltings-chai — I.1.10(a), p.7 (A noetherian normal base gives projectivity.); gao-habegger — §2.2, pp.10–11; Appendix C, pp.58–59 (v3) (The projective presentation uses projective normality; Appendix C presupposes, rather than proves, that input.).

Acceptance: The graph bundle of a global λ is an alternative canonical projective presentation. The normality hypothesis is retained when no global polarization is supplied.

Recorded proof obligations: `G-projective-normality`.

### Polarization type and Pfaffian comparison

**Target:** `A2/polarization-type-and-pfaffian` (theorem).

For a polarized complex abelian variety (A,L), the integral alternating lattice form has elementary divisors d₁|⋯|d_g with d_i>0 and matrix [[0,D],[-D,0]] in a suitable basis. They determine the polarization type. Put d=∏d_i (empty product one); then h⁰(L)=d, deg_L(A)=g!d and deg λ=d². In an algebraic family over a connected base with polarization degree invertible, the prime-to-characteristic kernel and its symplectic type are locally constant. At primes dividing the degree use the finite-flat polarization kernel, not a constant étale elementary-divisor description.

Proof route: Use integral alternating Smith normal form and the lattice cokernel comparison. Combine the Pfaffian determinant identity with Riemann–Roch; for relative type pass to the finite étale kernel locally and retain the degree-invertibility boundary.

Inputs: `A2/ample-cohomology-and-degree`, `A5/riemann-form`, `A3/polarized-weil-pairing`.

Sources: analytic — §1, Definitions 1.13–1.14 and Theorems 1.17–1.18, pp.5–8 (The Riemann form is the integral alternating polarization form.); faltings-chai — I.1.6–1.8, pp.4–5 (The relative polarization degree and étale level conditions retain the finite-flat distinction.).

Acceptance: Type (1,2) has d=2, deg λ=4 and deg_L(A)=4 for g=2. At g=0 d=1.


### Mumford map and biextension identities

**Target:** `A2/mumford-map-and-biextension` (comparison).

For π:A→S and any line bundle L, define φ_L by the imported relative dual: on a:T→A it is represented by t_a*L_T⊗L_T^−1⊗π_T*(a*L_T)^−1⊗π_T*e_T*L_T. The double-rigidified bundle on A² is m*L⊗p₁*L^−1⊗p₂*L^−1⊗π²*e*L. The cube makes φ_L a symmetric homomorphism. One has φ_(L⊗M)=φ_L+φ_M, φ_(t_a*L)=φ_L, φ_(π*N)=0, and φ_(f*L)=f∨φ_L f for a homomorphism f. These are identities of relative sheaf morphisms, compatible with base change; their bilinear correspondence is additive in each variable.

Proof route: Construct the normalized correspondence and classify it by the Poincaré universal property. Use the cube to show additivity in each factor; use uniqueness of double rigidification for tensor, translation and pullback formulas.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-dual`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `A1/relative-cube-and-power`, `A2/normalized-poincare-comparison`.

Sources: faltings-chai — I.1, pp.3–4 (The relative φ formula explicitly retains the zero-fibre and section-fibre lines.); conrad-polarizations — Example 2.2, pp.6–7 (The positive convention is pullback by t_a, and symmetry follows from the correspondence.).

Acceptance: On E, φ_(O(d·0))(a)=O([−da]−[0]); under the positive self-duality this is [d]. A line pulled back from a nontrivial Pic(S) has zero φ.


### Nef rigidified symmetric lines over curves

**Target:** `A2/nef-normalized-lines-over-curves` (theorem).

Let S be a smooth projective integral curve over a field and A/S an abelian scheme. A symmetric rigidified relatively ample line L is nef on the total space. Given another symmetric rigidified line L′, some integer a>0 makes aL−L′ nef. Moreover L has torsion restriction on every torsion multisection. These conclusions concern the normalized line: tensoring by a line of negative degree from S can destroy nefness.

Proof route: Choose a base ample correction so L+π*M is ample. Pull back by [n] and divide the resulting class by n²; the ample classes L+n^−2π*M converge to L, which is nef. Choose a so aL−L′ is relatively ample, symmetric and rigidified and apply the same argument.

Inputs: `A1/relative-cube-and-power`, `A1/torsion-restriction-of-rigidified-lines`, `A2/projective-presentation-over-normal-bases`, `SchemeAndStackFoundations:SF.5`.

Sources: xie-yuan — Lemma 4.1(2)–(4) and proof, p.20 (The proof gives torsion restrictions and nefness through the multiplication limit.).

Acceptance: On the zero section the normalized L has degree zero. A negative base twist fails the conclusion even on a constant elliptic family.


### Polarization representatives and graph bundle

**Target:** `A2/polarization-representatives-and-graph` (comparison).

For the imported fibrewise-ample polarization λ, the rigidified line bundles L with φ_L=λ form a torsor under A∨. This describes the ambiguity of representatives without assuming a global L. The graph pullback M=(id,λ)*P is canonically rigidified, symmetric and relatively ample, with φ_M=2λ; if λ=φ_L then M≃[2]*L⊗L^−2 with the base normalization, and its class is 2[L] in NS. Symmetric representatives form a torsor under A∨[2], so they exist fppf locally and étale locally when 2 is invertible. The graph bundle itself needs no inversion of 2.

Proof route: Reuse the lower-tier representative torsor and canonical graph construction. Identify the graph using the multiplication formula; symmetry is the fixed locus of inversion on the representative torsor, whose difference is two-torsion.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-local-ample-representatives`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-canonical-bounded-bundle`, `AbelianSchemesAndArithmeticModuli:A2/mumford-map-and-biextension`.

Sources: faltings-chai — I.1.6 and following discussion, p.4 (Polarization representatives are local, while the symmetric graph gives twice the polarization.); conrad-polarizations — Example 2.2, p.6, and Pic⁰-kernel discussion, p.8 (The graph comparison is [2]*L⊗L^−2, not L.).

Acceptance: For a principal elliptic polarization the graph line has degree two. At characteristic two a symmetric representative torsor may be nonétale; the graph is still defined.

### Néron–Severi group of an abelian variety

**Target:** `A2/abelian-neron-severi` (definition). **Planet:** Néron–Severi group.

For A/k put NS(A)=Pic(A)/Pic⁰(A), where Pic⁰(A) consists of k-defined line classes algebraically equivalent to zero. Define NS(A)_Q=NS(A)⊗_Z Q and NS(A)_R similarly, and define the ample cone as the positive real cone generated by ample line classes. The geometric group NS(A_kbar) is distinguished from NS(A) and from its Galois invariants. The Mumford map factors to an injection NS(A)→Hom(A,A∨); translation acts trivially and [n]* acts as n². Finite generation is the separate A6 consequence of Hom finiteness, not a definition axiom. Define the geometric Picard number ρ(A)=dim_Q NS(A_kbar)_Q, independently of the chosen algebraic closure. The rank of NS(A) from k-defined line classes is a separate arithmetic invariant, not the definition of ρ.

Proof route: Use the exact kernel of L↦φ_L, namely algebraically trivial classes, to descend the map to the quotient. Extend the quotient and pullbacks by scalar extension; use the cube to obtain the n² action.

Inputs: `AbelianSchemesAndArithmeticModuli:A2/mumford-map-and-biextension`, `AlgebraicModuliForArithmeticGeometry:A0-extension/relative-picard-sheaf`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.

Sources: milne-2022 — Corollary 12.8, p.22, and its Mumford-map argument (The quotient embeds in Hom and inherits pullback operations.); conrad-polarizations — Pic⁰-kernel and descent-obstruction discussion, p.8 (The kernel is Pic⁰, and descent of geometric classes can have an obstruction.); lipnowski-tsimerman — §4.2, pp.17–18 (Rational NS, its ample cone and the pullback dictionary are the consumer interface.).

API outline:

- `AbelianNS.mk` (constructor): Send a line class to its quotient class.
- `AbelianNS.eq_iff` (characterisation): Two classes agree exactly when their quotient is in Pic⁰(A).
- `AbelianNS.toSymmetricHom` (data): Expose the injective Mumford homomorphism into Hom(A,A∨).
- `AbelianNS.pullback` (functoriality): Contravariant pullback respects identity, composition and the n² multiplication formula.
- `AbelianNS.tensorQ` (compatibility): Scalar extension gives the rational NS space and clears denominators in rational pullbacks.
- `AbelianNS.picardNumber` (data): Return dim_Q NS(A_kbar)_Q; extension of algebraically closed fields preserves it.
- `AbelianNS.ext` (extensionality): Equality of quotient classes is detected by algebraic equivalence of representatives, and is compatible with the injective Mumford map.

Unit tests:

- `AbelianNS.elliptic_degree` (computation): NS(E) over an algebraically closed field is Z with O(0) mapping to 1.
- `AbelianNS.pic0_zero` (characterisation): For L in Pic⁰(A), its NS class and φ_L both vanish.
- `AbelianNS.multiplication_square` (computation): For E and O(0), [2]* acts on NS by 4, not 2.
- `AbelianNS.geometric_descent` (non-example): A Galois-fixed geometric class need not lift to a k-line class; do not identify NS(A) with NS(A_kbar)^G without a descent theorem.
- `AbelianNS.picardNumber_zero` (degenerate): The dimension-zero abelian variety has NS=0 and ρ=0.
- `AbelianNS.picardNumber_elliptic` (computation): Every geometric elliptic curve has ρ=1.
- `AbelianNS.picardNumber_square` (computation): In characteristic zero, if End(E)=Z geometrically, then ρ(E×E)=3, from the two factor classes and the diagonal; it is not 2.

Uses: RT-AREA-algebraicgeometry/8 and quadratic Chabauty consumers — Supply a precise Picard-number and Hom injection interface.; Lipnowski–Tsimerman §4.2 — Use rationalized NS and its ample cone for Rosati and polarization orbits..

Acceptance: Over an algebraically closed field NS(E)≃Z by degree. On A the class of a base-normalized Poincaré line from Pic⁰ is zero.

### Effective divisor ampleness criterion

**Target:** `A2/divisor-ample-criterion` (theorem).

For an abelian variety over an algebraically closed field, a nonzero effective divisor whose support contains no translate of a positive-dimensional abelian subvariety is ample. Its translation stabilizer is a finite group scheme, so its Mumford map is an isogeny and the effective nondegenerate line is ample.

Proof route: A positive-dimensional reduced connected stabilizer would translate any support point into the divisor support, contradicting the hypothesis. Use the effective nondegenerate line-bundle criterion to deduce ampleness; retain scheme length for the stabilizer.

Inputs: `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `A2/mumford-map-and-biextension`, `A3/nonaffine-abelian-quotient`.

Sources: caro-pasten — Lemma 5.1 and proof, p.16 (The support hypothesis forces a finite stabilizer and hence ampleness.).

Acceptance: A fibre divisor on E×E contains an elliptic translate and is not ample. A positive-degree divisor on E is ample.


### Principal polarized quotients and spreading

**Target:** `A2/principal-quotient-and-spreading` (theorem).

Over an algebraically closed field, for ample L there is an isogeny u:A→A₀ and a principal ample L₀ with L≃u*L₀ and deg u=h⁰(L). The construction chooses a maximal isotropic finite subgroup scheme for the theta commutator together with a compatible splitting that descends L. Over an integral noetherian normal base, chosen geometric-generic data spreads after passage to a finite extension of the function field, a finite dominant model after shrinking, and a further open restriction. The extension may be inseparable. An étale dominant model is asserted only when the chosen data descends to a separable extension. This is a generic local statement, not a principalization over every base.

Proof route: Use the finite theta group to choose a maximal isotropic subgroup and splitting over an algebraically closed field; quotient and descend the ample line. Descend the finite kernel, theta splitting, quotient and line to a finite field of definition, normalize a suitable finite model and shrink so that the finite presentation and flatness equations hold. If the field extension is separable, shrink further to its étale locus. No separability follows merely from geometric existence.

Inputs: `AbelianSchemesAndArithmeticModuli:A3/nonaffine-abelian-quotient`, `AbelianSchemesAndArithmeticModuli:A2/ample-cohomology-and-degree`, `AbelianSchemesAndArithmeticModuli:A2/polarization-representatives-and-graph`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AbelianSchemesAndArithmeticModuli:A3/theta-group`.

Sources: conrad-polarizations — §3, p.9, discussion after Definition 3.2 (The notes state isogeny to a principally polarized variety and refer to Mumford for the proof. The stronger prescribed-line descent requires the explicit G-theta-principal obligation.); faltings-chai — I.1.7–1.9, pp.4–7 (Finite correspondences and scheme representability provide the relative spreading route.).

Acceptance: For an elliptic degree-d line the quotient degree is d, whereas deg φ_L=d². A maximal isotropic kernel is a group scheme, not just geometric torsion points.

Recorded proof obligations: `G-theta-principal`.

### Rational Néron–Severi and the ample cone

**Target:** `A2/rational-ns-and-ample-cone` (theorem).

Over an algebraically closed field, φ induces NS(A)⊗Q≅Hom⁰(A,A∨)^sym, hence θ_λ([L])=λ^−1φ_L identifies rational NS with Rosati-fixed End⁰. This holds in characteristic two: the graph Poincaré line of a symmetric f has φ=2f, and rationalization divides by 2. LT’s half-normalized θ′=θ/2 is a separately named scalar adapter. An integral class is ample iff θ_λ is positive in the Rosati cone; on real scalar extension the cone is the product of positive-definite Hermitian matrix cones in the R,C,H factors of End⁰_R.

Proof route: Kernel φ=Pic⁰ gives injectivity; graph pullback supplies 2f for every symmetric f, proving rational surjectivity without a characteristic restriction. Use positivity of the Rosati involution and the real semisimple *-algebra decomposition. Positive symmetric elements have positive square roots, and the ample cone is the component containing λ. Use degree/intersection eigenvalues to show the component is the ample cone; integral representatives descend only over the stated algebraically closed field.

Inputs: `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A2/polarization-representatives-and-graph`, `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`, `AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple`.

Sources: conrad-polarizations — Example 2.2 and Lemma 2.3, pp.6–7 (The graph construction gives 2f, not f.); lipnowski-tsimerman — Lemma 4.6 and Propositions 4.9–4.10, pp.17–19 (Rationalization and the half-normalization must be explicit in the cone comparison.).

Acceptance: For L defining λ, θ([L])=1 whereas θ′([L])=1/2. For E² with End(E)=Z, the ample cone is the positive-definite symmetric real 2×2 matrices.

## A3. Finite-flat quotients, torsion and pairings

The generic affine finite-group quotient is an input, not the quotient of a proper abelian scheme. The latter is constructed as an fppf algebraic-space quotient and then a scheme using Raynaud. Dual kernels use actual Cartier duality, and polarization-induced self-pairings need their precise prime-to-degree condition. Theta descent requires a compatible splitting, not just an abstract isotropic set.


### Relative isogenies

**Target:** `A3/relative-isogeny` (definition). **Planet:** Isogenies.

An isogeny A→B over S is a group homomorphism whose scheme map is finite locally free and surjective. Its kernel is finite locally free; the map is an fppf torsor under that kernel, and its rank equals the kernel rank. This definition agrees with native IsIsogeny over fields. Ranks are locally constant, multiply under composition and survive arbitrary base change.

Proof route: Finite locally free surjective morphisms are fppf covers. Translation identifies the two projections of A×_B A with the kernel action. For the field comparison use flatness of homomorphisms of smooth connected groups of equal dimension; compare ranks by the torsor square.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`, `SchemeAndStackFoundations:SF.1`.

Sources: faltings-chai — I.1, p.5, isogenies and Cartier duality (Finite flat kernels and isogenies carry scheme-theoretic, not point-count, degrees.).

API:

- `RelativeIsogeny.kernel` (data): Return the finite locally free kernel with its inclusion.
- `RelativeIsogeny.quotient` (universal-property): For any group target C, maps B→C correspond to maps A→C killing the kernel.
- `RelativeIsogeny.baseChange` (functoriality): Pull back the isogeny and kernel along any T→S.
- `RelativeIsogeny.comp_rank` (compatibility): The rank of a composite is the product of ranks.
- `RelativeIsogeny.field_iff` (compatibility): Over Spec k agree with native AbelianVariety.IsIsogeny.

Definition tests:

- `RelativeIsogeny.identity` (degenerate): The identity isogeny has kernel zero and rank one.
- `RelativeIsogeny.elliptic_two` (computation): [2] on an elliptic scheme has rank four.
- `RelativeIsogeny.inclusion` (non-example): E→E×E in the first factor is not an isogeny.
- `RelativeIsogeny.nonreduced_kernel` (non-example): [p] on a supersingular elliptic curve in characteristic p has rank p², not the number of geometric kernel points.

Uses: van Hoften, Lemma 4.1.2 — Realize prescribed finite-flat kernels as geometric isogenies.; A6 degree and rational Hom — Compare relative ranks with geometric degrees..

Acceptance: In characteristic p, [p] has nonzero rank although its geometric kernel can have one point.


### Multiplication, torsion and prime-to-characteristic density

**Target:** `A3/multiplication-and-density` (theorem). **Planet:** Prime-to-characteristic torsion density.

For n≠0, [n] on A/S of locally constant dimension g is finite locally free of rank |n|^(2g). On a positive-dimensional component it is étale iff n is a unit on that component; on a dimension-zero component it is always the identity. Over an algebraically closed field, the union of prime-to-characteristic torsion is Zariski dense.

Proof route: Import the relative rank theorem from R09.4 and check its dimension-zero convention rather than redefining multiplication. For density take the closure of the torsion subgroup. If its identity component B has dimension b<g, boundedly many components would have to contain arbitrarily large ℓ^(2gn) torsion kernels, whereas each component has at most ℓ^(2bn) such points, a contradiction.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`, `A1/relative-cube-and-power`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`.

Sources: milne-2022 — Theorem 20.7, pp.43–44; §8, pp.13–14 (Relative multiplication has finite-flat rank; field prime-to-characteristic torsion has the indicated size.); xie-yuan — §1.1, p.3; §5.3, p.27 (The torsion-density use retains the prime-to-characteristic qualification.).

Acceptance: [p] is not étale on a positive-dimensional characteristic-p fibre. On the zero-dimensional object [p] is étale even in characteristic p.


### Finite-flat abelian quotients

**Target:** `A3/nonaffine-abelian-quotient` (construction). **Planet:** Finite-flat quotients.

For an abelian scheme A/S and a finite locally free closed subgroup H, the fppf sheaf quotient A/H is represented by an abelian scheme B/S. The quotient q is an H-torsor and isogeny of rank rk H, commutes with arbitrary base change and is initial among homomorphisms killing H. No affine hypothesis on A is used.

Proof route: Construct the free finite-flat equivalence-relation quotient as an algebraic space, with the induced group law. Fppf-local descent proves properness, smoothness and geometric connectedness; apply Raynaud to obtain a scheme. Use the sheaf coequalizer for the universal property, torsor square and pullback comparison.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `AbelianSchemesAndArithmeticModuli:A2/raynaud-scheme-representability`, `SchemeAndStackFoundations:SF.1/quotient-sheaf`, `SchemeAndStackFoundations:SF.1/artin-bootstrap`.

Sources: faltings-chai — I.1.7–1.9, pp.4–7 (Quotients by finite flat subgroups are abelian schemes and the scheme passage uses Raynaud.).

API outline:

- `AbelianQuotient.mk` (constructor): Construct A/H and its quotient isogeny.
- `AbelianQuotient.desc` (universal-property): Descend a map killing H uniquely.
- `AbelianQuotient.baseChange` (functoriality): (A/H)_T≅A_T/H_T, respecting quotient maps.
- `AbelianQuotient.kernel_rank` (characterisation): The kernel is H and the quotient rank is rk H.

Unit tests:

- `AbelianQuotient.zero` (degenerate): A/0≅A with identity quotient map.
- `AbelianQuotient.full_torsion` (computation): E/E[2]≅E with quotient [2], of rank four.
- `AbelianQuotient.local_kernel` (non-example): For supersingular E, quotient by the connected Frobenius kernel has rank p and does not equal quotient by its trivial geometric point group.

Uses: A3 divisibility and duality — Provide the universal isogeny factorization.; PAPER-VANHOFTEN-24/C03 — Realize p-divisible isogenies with finite-flat abelian kernels..

Acceptance: For E and E[n], the quotient map identifies with [n], rank n². The zero subgroup gives A; kernels of inseparable maps remain group schemes.

### Dual isogenies and Cartier-dual kernels

**Target:** `A3/dual-isogeny-and-cartier-kernel` (theorem). **Planet:** Weil pairings.

For an isogeny f:A→B with kernel H, f∨:B∨→A∨ is an isogeny with kernel canonically Hᴰ, preserving rank and base change. For n≠0 the Poincaré biextension gives e_n:A[n]×A∨[n]→μ_n, perfect in the finite-flat Cartier sense, natural for homomorphisms and compatible with n|m transition maps. The swapped bidual pairing is the inverse pairing under the fixed evaluation convention.

Proof route: Trivializations of the pulled-back Poincaré bundle along H represent characters H→G_m; their obstruction identifies ker f∨ with Hᴰ. Apply the construction to [n] and descend the two Poincaré trivializations to μ_n. Verify the inverse under exchanging factors using the normalized biextension, not an unsigned duality assertion.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-dual`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `AbelianSchemesAndArithmeticModuli:A3/nonaffine-abelian-quotient`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`, `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso`.

Sources: faltings-chai — I.1, p.5, Cartier duality and Weil pairings (Dual isogeny kernels are Cartier dual and [n]-pairings are perfect.); conrad-polarizations — §1, pp.2–5; Remark 2.4, p.7 (The two evaluation conventions impose an inverse when swapping.).

Acceptance: For n invertible obtain perfect pairings of étale local systems with target μ_n. For n=p in characteristic p preserve the finite-flat pairing, even when points fail to detect it.

### Torsion detects divisibility and integrality

**Target:** `A3/torsion-divisibility` (theorem).

For n≠0, a homomorphism f:A→B factors uniquely as [n]_B∘h iff it kills A[n] as a group scheme. Hom(A,B) is torsion free. For q=f/n in Hom⊗Q, integrality is equivalent to this finite-flat kernel condition. For ℓ invertible the condition for ℓ^r is equivalently divisibility of the induced integral Tate-module map by ℓ^r. No criterion using only prime-to-characteristic realizations detects p-denominators in characteristic p.

Proof route: Use A/A[n]≅A and the quotient universal property. For uniqueness, n·h=0 has image in a finite group; a smooth connected source maps trivially there. For ℓ invertible pass between the map modulo ℓ^r on T_ℓ and A[ℓ^r]. For arbitrary n use the actual finite-flat kernel, not its points.

Inputs: `A3/nonaffine-abelian-quotient`, `A3/multiplication-and-density`.

Sources: milne-2022 — §12, pp.22–24, isogeny factorization; §19, pp.40–42 (Quasi-inverses and integral divisibility use finite isogeny kernels.); lipnowski-tsimerman — §4.5, pp.21–22; Tate divisibility input (The realization criterion at primes different from the characteristic is a kernel-factorization criterion.).

Acceptance: On supersingular E, pointwise vanishing on E[p](kbar) does not imply divisibility by p. The rational identity id/n is integral only in the zero-dimensional case or when n is a unit in the integral Hom module.


### Theta groups and polarized descent

**Target:** `A3/theta-group` (construction).

For a rigidified line L on an abelian variety, let K(L)=ker φ_L and let G(L)(T) consist of pairs (x, t_x*L_T≅L_T); composition forms a central extension 1→G_m→G(L)→K(L)→1. Its commutator is a perfect strongly alternating pairing when L is ample. A subgroup H⊂K(L) admits descent of L to A/H exactly after choosing a compatible splitting of the theta extension over H; isotropy alone is not a chosen linearization.

Proof route: Construct the group law by composing translated line isomorphisms and identify the scalar kernel using universal constants. Use the biextension to identify the commutator and its nondegeneracy. Apply effective descent for invertible sheaves along the H-torsor.

Inputs: `AbelianSchemesAndArithmeticModuli:A2/mumford-map-and-biextension`, `AbelianSchemesAndArithmeticModuli:A3/nonaffine-abelian-quotient`.

Sources: faltings-chai — I.1.6, p.4; I.5 introduction, p.25 (The graph line and polarization constructions require their finite theta-group descent data.); milne-2022 — §13, Theorem 13.3, p.25 (The section dimension and polarization degree agree through the theta pairing.).

API outline:

- `ThetaGroup.mk` (constructor): Form the central extension with the translation-isomorphism data.
- `ThetaGroup.commutator` (data): Return the strongly alternating K(L)-pairing.
- `ThetaGroup.descend` (universal-property): A splitting on H gives the descended line on A/H.
- `ThetaGroup.baseChange` (functoriality): Pull back the extension, splitting and descended line together.

Unit tests:

- `ThetaGroup.trivial` (degenerate): For L=O_A, K(L)=A and the extension splits, but K(L) is not finite when g>0.
- `ThetaGroup.elliptic_degree_two` (computation): For a degree-two line on E, K(L)=E[2] of rank four.
- `ThetaGroup.diagonal` (non-example): A skew self-duality of a characteristic-two finite group is not sufficient data for a strongly alternating theta commutator.

Uses: A2 principal quotient — Supply the necessary linearization of a maximal isotropic kernel.; BCGP25 Remark 10.3.2 — Separate strong alternation from a skew Cartier self-duality..

Acceptance: The commutator evaluated on (x,x) is one, including in characteristic two.

### Polarized torsion pairings

**Target:** `A3/polarized-weil-pairing` (theorem).

For a polarization λ:A→A∨ put e_(λ,n)(x,y)=e_n(x,λy). It is alternating, including at n even, and is perfect iff λ induces an isomorphism on A[n] (equivalently ker λ has no n-primary part fibrewise). In particular gcd(n,deg λ)=1 suffices. Isogeny pullbacks obey e_(f∨μf,n)(x,y)=e_(μ,n)(fx,fy).

Proof route: Work fppf-locally with an ample representative and its theta commutator extension to prove strong alternation; descend it to S. Perfection is the composite of Cartier duality with λ[n]; prove the kernel criterion prime by prime. Pullback follows from Poincaré naturality.

Inputs: `A3/dual-isogeny-and-cartier-kernel`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `A2/polarization-representatives-and-graph`.

Sources: faltings-chai — I.1.6–1.8, pp.4–5 (Polarizations induce alternating pairings; level conditions include the degree restriction.).

Acceptance: Degree-prime-to-3 gives the perfect A[3]×A[3]→μ₃ interface needed by Tsimerman. A type (1,2) polarization is not perfect on A[2].


### Genus-two Weierstrass differences

**Target:** `A3/genus-two-two-torsion` (theorem).

For a smooth genus-two curve in characteristic ≠2, its fifteen unordered differences of distinct geometric Weierstrass points give exactly the nonzero Jacobian 2-torsion. With the six-point permutation convention fixed, pairing of two such differences is (−1)^|{i,j}∩{k,l}|. This identifies Jac(C)[2] with the even-subset quotient of F₂⁶ by the all-ones line, equivariantly under S₆≅Sp₄(F₂).

Proof route: Represent each difference by its divisor class and use the hyperelliptic rational functions to prove twice the class is zero. Distinct pairs give distinct classes; cardinality 16 exhausts the torsion. Compute the Weil pairing by disjoint representatives and the hyperelliptic functions, then identify the symplectic even-subset model.

Inputs: `A3/polarized-weil-pairing`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

Sources: bcgp25 — §8.1.1, pp.181–182 (v1 PDF) (The six-point convention fixes the pairing and excludes the outer-automorphism alternative.).

Acceptance: Two disjoint pairs have pairing +1; pairs with one common endpoint have pairing −1.


## A4. Realizations and deformation categories

Separate nilpotent-base Serre–Tate from locally PD-nilpotent Grothendieck–Messing. Both are categorical statements including morphisms and structures. Formal systems over a complete DVR are algebraized only by the explicit effectivity target. Ordinary q parameters describe all genera, with integral symmetry at 2 and weighted equations for nonprincipal polarizations. The odd-prime and ordinary dyadic finite-level lifting applications have distinct proof obligations.


### Integral prime-to-characteristic Tate modules

**Target:** `A4/etale-tate-module` (construction). **Planet:** Tate modules.

For ℓ prime and invertible on S, T_ℓ A is the inverse system of étale sheaves A[ℓ^r] with [ℓ] transition maps, a locally free Z_ℓ local system of rank 2g on each dimension component. At a geometric point it is lim A[ℓ^r](sbar), with its continuous π₁-action; V_ℓ=T_ℓ⊗Q_ℓ. Preserve group maps, products, arbitrary base change and T_ℓ A/ℓ^r≅A[ℓ^r]. The dual Weil pairing lands in Z_ℓ(1)=lim μ_(ℓ^r), not Z_ℓ.

Proof route: Finite étale torsion is locally constant of rank ℓ^(2gr). Choose compatible bases through the surjective [ℓ] maps and take inverse limits. Define continuity from the finite quotients, identify reductions and inverse-limit pairings, and verify all naturality squares.

Inputs: `A3/multiplication-and-density`, `A3/dual-isogeny-and-cartier-kernel`, `SchemeAndStackFoundations:SF.1`.

Sources: milne-2022 — §18, pp.38–40 (Integral Tate modules and dual pairings have cyclotomic target.); analytic — §1.2, pp.3–4 (For a complex torus the Tate module is its homology lattice tensored with Z_ℓ.).

API:

- `AbelianTate.mk` (constructor): Build the integral local system from the torsion inverse system.
- `AbelianTate.modPow` (characterisation): T_ℓ/ℓ^r≅A[ℓ^r], compatible with transitions.
- `AbelianTate.map` (functoriality): Homomorphisms induce continuous linear maps respecting composition and addition.
- `AbelianTate.baseChange` (functoriality): Pullback commutes with torsion and the inverse system.
- `AbelianTate.dualPairing` (compatibility): Identify T_ℓ(A∨) with Hom_Zℓ(T_ℓ A,Z_ℓ(1)).

Definition tests:

- `AbelianTate.zero` (degenerate): The zero-dimensional abelian scheme has the zero Tate module.
- `AbelianTate.elliptic_rank` (computation): For complex E, T₃ E≅Z₃² and E[3]≅F₃².
- `AbelianTate.characteristic_prime` (non-example): For supersingular E in characteristic p, lim E[p^r](kbar)=0 and is not its rank-two prime-to-characteristic Tate module.
- `AbelianTate.twist` (compatibility): The determinant character for an elliptic polarization is the cyclotomic character, with μ_(ℓ^r) finite targets.

Uses: A6 Hom faithfulness and characteristic polynomials — Supply integral and rational realizations without a Tate-surjectivity theorem.; BCGP25 §1.8.23 — Distinguish the cohomological dual representation and its multiplier..

Acceptance: For E over C rank T_ℓ E=2, not one.


### Universal vector extension

**Target:** `A4/universal-vector-extension` (construction).

For an abelian scheme π:A→S and a finite locally free O_S-module F, write V(F)=Spec_S Sym(F∨), the vector group of sections of F. There is a canonical extension 0→V(ω_(A∨))→E(A)→A→0. Pushing out its vector kernel gives Hom_O_S(ω_(A∨),F)≃Ext¹_fppf(A,V(F)), naturally in F and under base change. Every extension has a unique compatible map from E(A). The invariant differentials ω_(E(A)) identify with H¹_dR(A/S), with exact sequence 0→ω_A→H¹_dR→Lie(A∨)→0. Equivalently Lie E(A) identifies with H¹_dR(A/S)∨; these are not identical variance conventions.

Proof route: Use Lie(A∨)≃R¹π_*O_A and the extension class corresponding to the identity of R¹π_*O_A. Descend the rigidified vector torsor and its group law; projection and pullback give naturality. Identify the Poincaré connection moduli with E(A); the cotangent sequence gives invariant differentials H¹_dR and the Hodge filtration. The universal Ext classification and de Rham comparison proofs are recorded in G-vector-extension.

Inputs: `AbelianSchemesAndArithmeticModuli:A1/relative-invariant-forms`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-dual`, `AlgebraicModuliForArithmeticGeometry:R09.6`, `SchemeAndStackFoundations:SF.1`.

Sources: maculan — §2.7, Definition 2.19, Theorem 2.20 and Corollary 2.21, pp.12–13 (v2) (The universal extension and pushout property use the dual of R¹π_*O_A, identified with ω_(A∨). The Ext-classification proof is cited to Mazur–Messing.); illusie-pisa — §4.2(iv), pp.16–17 (Lie E(A)=H¹_dR(A/S)∨ and its dual sequence identify the correct variance; the crystal proof remains delegated.).

API outline:

- `AbelianVectorExtension.mk` (constructor): Construct E(A) and its vector-kernel extension.
- `AbelianVectorExtension.pushout` (universal-property): For F identify vector extensions by the unique kernel map ω_(A∨)→F.
- `AbelianVectorExtension.baseChange` (functoriality): Identify E(A) pulled back to T with E(A_T), compatibly with its extension and composition.
- `AbelianVectorExtension.invariantForms` (compatibility): Identify ω_(E(A)) with H¹_dR(A/S) and its Hodge exact sequence.
- `AbelianVectorExtension.ext` (extensionality): Maps of extensions are determined by their maps on vector kernels and the induced map on A.

Unit tests:

- `AbelianVectorExtension.zero` (degenerate): For the dimension-zero A both the vector kernel and E(A) are the zero group.
- `AbelianVectorExtension.elliptic` (computation): An elliptic A has vector kernel of rank one and invariant forms of rank two.
- `AbelianVectorExtension.zero_pushout` (characterisation): Pushing out along the zero map gives the split extension A×V(F).
- `AbelianVectorExtension.variance` (non-example): The canonical comparison uses invariant forms with H¹_dR and Lie with its dual, not an unqualified equality Lie E(A)=H¹_dR.

Uses: A4 degree-one de Rham and PD evaluation — Provide the universal vector extension actually used by their proof sketches..

Acceptance: The vector kernel has rank g and the invariant-form bundle rank 2g. Distinguish the invariant forms of E(A) from its Lie algebra dual.

Recorded proof obligations: `G-vector-extension`.

### Relative first de Rham cohomology

**Target:** `A4/abelian-h1-de-rham` (construction). **Planet:** First de Rham cohomology.

For π:A→S, H¹_dR(A/S)=R¹π_*(Ω•_(A/S)) is locally free of rank 2g, commutes with arbitrary base change and has the natural exact sequence 0→ω_A→H¹_dR→Lie(A∨)→0, with ω_A=π_*Ω¹_(A/S). Over a smooth base S/k it carries the integrable Gauss–Manin k-connection; its filtration obeys Griffiths transversality. Poincaré duality gives a perfect pairing between the first realizations of A and A∨. A polarization induces a self-pairing, perfect when its degree is invertible on S, in particular for a principal polarization. Without that condition it may be degenerate. Retain the inverse Tate twist in cohomological realizations.

Proof route: Use the bounded relative de Rham complex and the invariant-form comparison ω_(E(A))≃H¹_dR(A/S) from A4/universal-vector-extension. The dual Lie sequence gives the Hodge exact sequence; this comparison retains G-vector-extension. Identify tangent and invariant-form bundles by the Poincaré bundle; prove local freeness and base change through the extension. Construct the connection by the two-step filtration of absolute forms for A→S→Spec k and its connecting morphism. The triple filtration proves integrability and transversality; no full p-adic comparison is invoked.

Inputs: `AbelianSchemesAndArithmeticModuli:A1/relative-invariant-forms`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-dual`, `AlgebraicModuliForArithmeticGeometry:R09.6`, `SchemeAndStackFoundations:SF.3`, `AbelianSchemesAndArithmeticModuli:A4/universal-vector-extension`.

Sources: faltings-chai — I.3, pp.14–15 (H¹_dR, the Hodge subbundle and deformation-theoretic pairing have ranks 2g and g.); anschütz-lebras — Proposition 4.5.1, p.53 (v4) (The bounded-prism p-adic-completion result supplies this degree-one comparison in that setting, rather than proving the arbitrary-base statement.).

API outline:

- `AbelianH1dR.mk` (constructor): Construct the rank-2g bundle from degree-one de Rham hypercohomology.
- `AbelianH1dR.hodgeSequence` (data): Expose the invariant-form subbundle and Lie(A∨) quotient.
- `AbelianH1dR.baseChange` (functoriality): Transport the filtered bundle through every T→S.
- `AbelianH1dR.pullback` (functoriality): A homomorphism A→B induces H¹_dR(B)→H¹_dR(A).
- `AbelianH1dR.connection` (compatibility): On smooth S/k expose the integrable Gauss–Manin connection and horizontal pullbacks.
- `AbelianH1dR.dualPairing` (compatibility): Expose the perfect A/A∨ dual pairing. The self-pairing induced by λ is perfect only under the stated invertible-degree condition.

Unit tests:

- `AbelianH1dR.elliptic` (computation): For an elliptic curve H¹_dR has rank two and Fil¹ rank one.
- `AbelianH1dR.zero` (degenerate): Dimension zero gives the zero bundle and zero connection.
- `AbelianH1dR.inseparable` (non-example): In characteristic p, [p]* on H¹_dR is zero although [p] is an isogeny of nonzero degree.
- `AbelianH1dR.product` (compatibility): H¹_dR(A×B)≅H¹_dR(A)⊕H¹_dR(B), with both filtrations and connections.
- `AbelianH1dR.polarization_degree` (non-example): In characteristic p on a positive-dimensional principally polarized A, λ=[p]λ₀ induces the zero de Rham self-pairing; it is not perfect.

Uses: A4 deformation theory — Identify the Hodge summand that is lifted.; PAPER-CARO-PASTEN-23 §§7–9 — Identify the integral invariant-differential subbundle and tangent dual..

Acceptance: For E the ranks are 1,2,1. The connection is relative to S/k; no smooth k-base is implicitly supplied for arbitrary S.

Recorded proof obligations: `G-vector-extension`.

### Minimal Barsotti–Tate interface

**Target:** `A4/p-divisible-group` (definition). **Planet:** Barsotti–Tate groups.

A p-divisible group G/S of locally constant height h is a compatible inductive system G_r of finite locally free commutative groups, rk G_r=p^(rh), with exact 0→G_r→G_(r+s)→G_s→0 under [p^r]. Its Tate sheaf is not its group of geometric p-power points in characteristic p. Include morphisms, Cartier duals and connected–étale sequences over perfect fields and complete henselian local bases where the connected part is finite flat at each level. A[p∞] has height 2g.

Proof route: Build A[p∞] from multiplication kernels and verify exactness fppf-locally. Dualize the finite levels and reverse the maps. For the connected–étale sequence use henselian lifting of finite étale components and prove flatness of the connected kernel levelwise under the stated hypotheses; do not extend this decomposition to arbitrary bases.

Inputs: `A3/multiplication-and-density`, `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`.

Sources: katz-serre-tate — §1.1–1.2, pp.139–146 (The nilpotent deformation category uses full p-divisible groups and their finite levels.); faltings-chai — I.3, pp.14–15 (Ordinary p-divisible groups split over a perfect field into multiplicative and étale parts.).

API:

- `AbelianBT.ofAbelian` (constructor): Form A[p∞] with its height and finite-level maps.
- `AbelianBT.truncation` (data): Return G[p^r] of rank p^(rh).
- `AbelianBT.dual` (functoriality): Dualize finite levels and recover biduality.
- `AbelianBT.baseChange` (functoriality): Pull back all finite levels, exact sequences and duals.
- `AbelianBT.connectedEtale` (data): Return the connected–étale exact sequence only under the specified henselian/perfect hypotheses.

Definition tests:

- `AbelianBT.ordinary_elliptic` (computation): Over kbar an ordinary E gives μ_(p∞)⊕Q_p/Z_p, height two and étale height one.
- `AbelianBT.supersingular` (non-example): A supersingular elliptic BT group has height two and no nonzero étale geometric Tate module.
- `AbelianBT.zero` (degenerate): Dimension zero gives height zero and trivial finite levels.
- `AbelianBT.finite_dual` (compatibility): The dual of μ_(p^r) is Z/p^r, agreeing with native finite-flat Cartier duality.

Uses: A4 Serre–Tate — Own the minimal deformation category formerly cited from a higher tier.; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2 — Import this interface; further classification remains with that roadmap..

Acceptance: Height 2g is separate from the ordinary étale rank g.


### Effectivity of polarized formal lifts

**Target:** `A4/polarized-effectivity` (theorem).

Over a complete noetherian local ring R, a compatible system of polarized abelian lifts over R/m^n, together with a compatible relatively ample line after finite faithfully flat extension if necessary, is effective as a polarized abelian scheme over R. Morphisms and finite-flat torsion algebraize uniquely; the descended polarization does not require a global chosen line on the original base.

Proof route: Apply formal existence for proper schemes with a compatible ample line, algebraize group maps by formal full faithfulness, and descend through the faithfully flat cover. Algebraize finite kernels by finite-module completeness and check the polarization on the special fibre. The needed higher-dimensional formal-existence input is requested explicitly from SF.4; its existing curve-only effectivity is insufficient.

Inputs: `AbelianSchemesAndArithmeticModuli:A2/polarization-representatives-and-graph`, `AbelianSchemesAndArithmeticModuli:A2/raynaud-scheme-representability`, `SchemeAndStackFoundations:SF.4`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

Sources: faltings-chai — I.3, pp.14–15 (Polarized deformations have effective formal systems.); bcgp25 — Lemma 9.3.4 proof, p.202 (Effectivity is a distinct step after Serre–Tate.).

Acceptance: Formal BT lifts alone do not certify effective abelian schemes without this step.

### Exterior cohomology of abelian schemes

**Target:** `A4/all-degree-exterior-cohomology` (theorem).

For every abelian scheme π:A→S, R^iπ_*Ω^j and H^n_dR are finite locally free and commute with arbitrary base change. Cup products identify R^iπ_*Ω^j≅∧^i R¹π_*O⊗∧^j π_*Ω¹ and H^n_dR≅∧^n H¹_dR, compatibly with products and pullbacks; the Hodge spectral sequence degenerates. Exterior means squares vanish also in characteristic two. For A over an algebraically closed field k and any prime ℓ≠char k, H*_et(A,Z_ℓ)≃∧*H¹_et(A,Z_ℓ) and H¹_et≃Hom_Z_ℓ(T_ℓA,Z_ℓ), with ranks binomial(2g,n). Reduction gives the same exterior statement over F_ℓ. This includes the characteristic-zero mod-p case used by FKW and the prime-to-characteristic cohomology used by Rosati positivity.

Proof route: Identify coherent cohomology as an exterior algebra using the Hopf structure and universal vector extension. Establish universal ranks and filtered exterior compatibility before applying base change. For prime-to-characteristic étale cohomology, use the addition Hopf algebra, Künneth and the rank-2g Tate injection as in Milne 2022 Theorem 15.1. A bounded graded Hopf-algebra argument forces exterior generation and degree-one square-zero, including ℓ=2; the integral coefficient sequence then proves torsion-freeness and integral exterior compatibility. The proof uses the general étale Künneth/cohomological-dimension and Hopf structure inputs recorded in G-etale-exterior. In characteristic zero there is also the complex-torus comparison route.

Inputs: `AbelianSchemesAndArithmeticModuli:A4/abelian-h1-de-rham`, `AlgebraicModuliForArithmeticGeometry:R09.6`, `ComplexComparisonPartII:C5/repair-sheaf-singular-comparison`.

Sources: anschütz-lebras — Proposition 4.5.1 and proof, p.53 (v4) (This result assumes a bounded prism (A,I) and the p-adic completion of an abelian scheme over A/I. It verifies the displayed algebra in that setting and refers to BBM II 2.5.2; arbitrary-base closure remains G-exterior.); fkw24 — Corollary 2.3.5, pp.17–18; Lemma 3.2.2, p.24 (v2) (The characteristic-zero mod-p exterior calculation is the consumer input.); milne-2022 — Theorem 15.1, Lemma 15.2 and Remark 15.4, pp.27–28 (The read argument supplies integral and mod-ℓ exterior cohomology for every ℓ different from the characteristic, subject to the general étale/Hopf inputs.).

Acceptance: For g=2 the de Rham ranks are 1,4,6,4,1. Degree-one squares vanish in characteristic two; graded skew symmetry alone is insufficient.

Recorded proof obligations: `G-exterior`, `G-etale-exterior`.

### Degree-one PD realization

**Target:** `A4/pd-first-cohomology` (construction).

For a PD thickening S₀→S with p locally nilpotent, quasi-coherent defining ideal J and locally PD-nilpotent divided powers, attach to A₀/S₀ a functorial locally free rank-2g evaluation D(A₀)_S. For any abelian lift A/S it identifies with H¹_dR(A/S), with its lifted Hodge rank-g direct summand. The PD evaluation is independent of the lift and compatible with morphisms, pullback of PD thickenings and duality. Over perfect k its W(k)-realization uses the contravariant cohomology convention; this does not assert a general crystalline site or Dieudonné equivalence.

Proof route: Use universal vector extensions and the divided-power infinitesimal invariance of their first cohomology to construct the evaluation. Compare two lifts on a common PD enlargement, prove the cocycle, then descend the evaluation and its functoriality. The source states this construction but delegates its proof to Messing; the precise construction gap is retained.

Inputs: `AbelianSchemesAndArithmeticModuli:A4/abelian-h1-de-rham`, `AbelianSchemesAndArithmeticModuli:A4/p-divisible-group`, `mathlib:DividedPowers`, `AbelianSchemesAndArithmeticModuli:A4/universal-vector-extension`.

Sources: faltings-chai — I.3, pp.14–15, Grothendieck–Messing discussion (The PD hypotheses include local PD-nilpotence, not merely nilpotence of J.).

API outline:

- `AbelianPD.evaluate` (constructor): Construct D(A₀)_S for the stated PD thickening.
- `AbelianPD.liftComparison` (compatibility): Identify D(A₀)_S with H¹_dR of a chosen lift.
- `AbelianPD.pullback` (functoriality): Commute with PD base change and composition.
- `AbelianPD.dual` (compatibility): Identify the contravariant dual realization and its evaluation pairing.

Unit tests:

- `AbelianPD.identity` (degenerate): For J=0 recover H¹_dR with its usual Hodge summand.
- `AbelianPD.elliptic_ranks` (computation): For an elliptic special fibre rank D=2 and a lift has a rank-one Hodge summand.
- `AbelianPD.pd_boundary` (non-example): Ordinary ideal nilpotence alone is not sufficient for the evaluation/lifting equivalence.

Uses: A4 Grothendieck–Messing — Make the filtered module in the lifting theorem an actual object.; Higher crystalline roadmap — Import only this degree-one evaluation, without moving general crystalline cohomology down..

Acceptance: At S=S₀ the evaluation is H¹_dR. A nilpotent ideal with non-PD-nilpotent powers is outside this theorem.

Recorded proof obligations: `G-pd`.

### Degree-one dual and twist comparisons

**Target:** `A4/realization-conventions` (theorem).

For a polarized abelian variety over a field and ℓ prime to the characteristic and polarization degree, H¹_et(A_kbar,Q_ℓ)=V_ℓ(A)*. The polarization identifies V_ℓ(A)≅H¹_et(A,Q_ℓ)(1); the cohomological multiplier is χ_ℓ^−1. Over C, H₁=Λ, H¹=Λ*, and de Rham comparison carries invariant forms to Fil¹ in cohomological weight one. Hodge–Tate/Sen weight conventions are exported to their higher-tier consumer, not proved from this complex comparison. The complex homological native Hodge convention has Weil operator −J and polarizing form −E, where E is the positive Riemann form; cohomological duality transports this sign as well as the weight.

Proof route: Dualize the torsion/Tate pairing and track the cyclotomic twist. Identify singular homology with the exponential lattice, dualize integrally and use proper de Rham comparison on the Hodge subspace.

Inputs: `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`, `AbelianSchemesAndArithmeticModuli:A5/analytic-families-and-comparison`.

Sources: bcgp25 — §1.8.23, p.15 (The abelian-surface representation uses cohomological H¹ with inverse-cyclotomic multiplier.).

Acceptance: For a surface H¹ has dimension four; the ordinary étale p-tower used in q has rank two.

### Grothendieck–Messing for abelian schemes

**Target:** `A4/grothendieck-messing` (theorem). **Planet:** Grothendieck–Messing lifting.

Under A4/pd-first-cohomology hypotheses, abelian lifts of A₀/S₀ are equivalent to rank-g locally direct summand lifts of Fil¹ in D(A₀)_S. Morphisms lift exactly when their contravariant evaluations preserve the lifted summands. For a principal polarization the perfect alternating pairing identifies the polarized condition with a Lagrangian Hodge lift. For a general polarization use the morphism condition D(λ₀)(Fil¹ of the dual lift)⊂Fil¹ of A, with dual-filtration identification; no perfect self-pairing is assumed when the degree is not invertible. The symmetric lift remains a polarization by the fibrewise ampleness condition. Extra endomorphisms impose simultaneous stability. The thickening must satisfy the stated local PD-nilpotence conditions.

Proof route: Prove the universal-vector-extension lifting equivalence with filtrations and identify Hom through it. Use the polarization biextension to translate duality into isotropy and verify compatibility with its ample geometric fibre. Apply the same morphism criterion to each structural endomorphism.

Inputs: `AbelianSchemesAndArithmeticModuli:A4/pd-first-cohomology`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `AbelianSchemesAndArithmeticModuli:A4/universal-vector-extension`.

Sources: faltings-chai — I.3, pp.14–15 (The inspected discussion states the unpolarized lifting criterion and the principally polarized isotropic criterion. The general morphism/duality formulation is an application of the same criterion, not a claim of an everywhere-perfect nonprincipal pairing.).

Acceptance: Unpolarized tangent rank is g²; principally polarized tangent rank is g(g+1)/2. At g=1 the filtration lifts in a rank-two module; extra endomorphisms impose actual equations.

Recorded proof obligations: `G-pd`.

### Serre–Tate equivalence with structures

**Target:** `A4/serre-tate-equivalence` (theorem).

For affine S=Spec R where p is nilpotent, a nilpotent ideal I and R₀=R/I, the category of abelian schemes over R is equivalent to pairs (A₀/R₀,G/R, G_(R₀)≅A₀[p∞]). Morphisms are compatible pairs of abelian and BT homomorphisms. The equivalence respects duality, polarizations and specified endomorphisms; a polarization must reduce to the fixed special-fibre polarization. Extend to local Artin W(k)-algebras by the same equivalence, and to complete local noetherian bases as formal systems, with algebraic effectivity proved separately.

Proof route: For full faithfulness use Drinfeld’s scaled Hom lifting: sufficiently high p^N kills the nilpotent obstruction, and compatibility of BT maps recovers the unique integral lift. First lift A₀ along successive small extensions using the unpolarized filtration lifting theorem. Correct the BT group by a finite p-power kernel quotient; recover the requested lift by A3 quotient. Duality and the Hom criterion transport structures. Positivity is checked on the same special fibre, rather than imposed on an arbitrary BT self-duality.

Inputs: `A4/p-divisible-group`, `A4/grothendieck-messing`, `A3/torsion-divisibility`.

Sources: katz-serre-tate — Theorem 1.2.1 and proof, pp.143–146 (The deformation equivalence and scaled Hom argument retain nilpotence and affine hypotheses.).

Acceptance: The theorem distinguishes formal systems over O from algebraic abelian schemes over O. An automorphism of the BT lift preserving the fixed special fibre comes from a unique abelian automorphism.


### Ordinary Serre–Tate coordinates

**Target:** `A4/ordinary-serre-tate-coordinates` (construction).

For ordinary A₀ over perfect k, work over kbar with descent, or fix trivializations of the étale part and its multiplicative dual. For local Artin W(k)-algebras R, deformations are bilinear maps q:T_p(A₀^et)×T_p((A₀∨)^et)→1+m_R, with group law multiplication. The identity q=1 is the canonical lift. A homomorphism f lifts iff q_A(x,f∨y)=q_B(fx,y). A principal λ₀ lifts iff q(x,λ₀y)=q(y,λ₀x), giving a formal torus of rank g(g+1)/2; the unpolarized rank is g². Its character lattice is the symmetric quotient of the two identified rank-g étale lattices, not the full rank-2g prime-to-p Tate module.

Proof route: Classify extensions of the unique lifted étale BT factor by the unique lifted multiplicative factor using Kummer classes. The extension Baer sum becomes multiplication of q. Use the BT Hom criterion and Cartier duality to derive the two-variable symmetry relation integrally, including p=2. Impose the principal polarization to identify the formal torus; descend the coordinate-independent form over perfect k before choosing a basis.

Inputs: `A4/serre-tate-equivalence`, `SchemeAndStackFoundations:SF.4/formal-completion`.

Sources: katz-serre-tate — Theorem 2.1, pp.148–150 (Bilinear q classifies ordinary deformations, detects lifting of morphisms and polarizations.).

API:

- `SerreTate.q` (data): Return the bilinear extension pairing of a deformation.
- `SerreTate.fromPairing` (universal-property): Recover the deformation from its q pairing.
- `SerreTate.homCriterion` (characterisation): A special-fibre homomorphism lifts exactly when its two q pullbacks agree.
- `SerreTate.polarized` (characterisation): Principal polarization is exactly symmetry after λ₀ identifies the étale lattices.
- `SerreTate.descent` (functoriality): Coordinate changes and perfect-field descent act on both arguments.

Definition tests:

- `SerreTate.elliptic_one` (computation): An ordinary elliptic deformation has one parameter q∈1+m_R.
- `SerreTate.surface_three` (computation): A principally polarized ordinary surface has q₁₂=q₂₁ and three parameters.
- `SerreTate.canonical` (degenerate): q=1 corresponds to the split extension and canonical lift.
- `SerreTate.supersingular` (non-example): A supersingular elliptic deformation is not classified by an ordinary rank-one étale q pairing.

Uses: Boxer–Pilloni Prop.3.4.9; Pilloni §7.1 — Supply the formal torus and its integral symmetry convention.; BCGP21 §4.5 — Apply only at points ordinary at the relevant prime..

Acceptance: For a principally polarized surface there are three coordinates, not four.


### Odd-prime polarized finite-level lifting

**Target:** `A4/odd-prime-finite-level-lifting` (theorem).

Let p>2, O the integers in a finite extension of Q_p, and A₀ a principally polarized abelian surface over its residue field. Given G₁ in the compatible principally quasi-polarized level-one truncated-BT deformation problem, whose finite flat underlying group is killed by p and has order p⁴, with a compatible identification G₁,k≅A₀[p], there is a principally polarized lift A/O with A[p]≅G₁. The finite group has order p⁴, not rank four.

Hypotheses and conventions: The level-one truncated-BT structure and polarization compatibility are required inputs. Their precise finite-level criterion and extension to a full polarized BT tower are G-odd-level; being an arbitrary self-dual finite flat group killed by p is not declared sufficient here.

Proof route: Lift the principally quasi-polarized level-one BT group to a full BT lift using the truncated polarized lifting theorem. Apply Serre–Tate at all nilpotent levels and then polarized effectivity. Wedhorn (2.17), the nonordinary finite-level lifting input cited by the paper, has not been read; retain that exact gap rather than assert arbitrary finite-flat groups lift.

Inputs: `AbelianSchemesAndArithmeticModuli:A4/p-divisible-group`, `AbelianSchemesAndArithmeticModuli:A4/serre-tate-equivalence`, `AbelianSchemesAndArithmeticModuli:A4/polarized-effectivity`.

Sources: bcgp25 — Lemma 9.3.4 and proof, pp.200–202 (The proof factors through Wedhorn (2.17), Serre–Tate and effectivity; the order-four typo is corrected.).

Acceptance: All compatibility with the special-fibre quasi-polarization is retained. The assertion does not extend to arbitrary finite-flat groups without BT₁ compatibility.

Recorded proof obligations: `G-odd-level`.

### Canonical Frobenius and nonprincipal ordinary equations

**Target:** `A4/ordinary-frobenius-and-weighted-polarization` (theorem).

The quotient of an ordinary deformation by its canonical multiplicative p-torsion subgroup has q parameters q^p after the Frobenius identifications of the special fibre; the canonical lift has q=1. For any prescribed λ₀ between ordinary special fibres its lift condition is q(x,λ₀y)=q(y,λ₀x). In bases write this as the integral weighted symmetry equation for the matrix of λ₀; do not divide by p. In genus two paramodular degree-p coordinates this yields the pattern (X,pZ;Z,Y) in additive/linearized coordinates, rather than unrestricted symmetric coordinates.

Proof route: Apply the morphism criterion to Frobenius and Verschiebung to obtain q↦q^p. Apply it to λ₀ without assuming invertibility over Z_p and compute its integral matrix equations. Distinguish multiplicative q equations from the additive tangent matrix.

Inputs: `AbelianSchemesAndArithmeticModuli:A4/ordinary-serre-tate-coordinates`, `AbelianSchemesAndArithmeticModuli:A3/nonaffine-abelian-quotient`.

Sources: katz-serre-tate — Lemma 4.1.2, pp.169–170 (Canonical Frobenius quotients act by p-th powers on q.); pilloni20 — §7.1, Lemmas 7.1.1–7.1.2, author PDF pp.38–40 (The genus-two principal and paramodular equations retain the weighted off-diagonal relation.).

Acceptance: At p=2 principal symmetry still gives three independent parameters. The canonical Frobenius changes q to q^p, not q unchanged.

### Ordinary dyadic finite-level lifting

**Target:** `A4/ordinary-dyadic-finite-level-lifting` (theorem).

Let O be the integers of a finite extension of Q₂ and A₀/k a principally polarized ordinary abelian surface. Let G₁/O be killed by 2, finite flat of order 16, with a Cartier self-duality λ satisfying λ∨=−λ and G₁,k≅A₀[2]. Then there is a principally polarized lift A/O with A[2]≅G₁. This conclusion specifies the underlying torsion identification; it does not assert that every prescribed λ lifts as the chosen principal polarization. Strong alternation and skew self-duality remain distinct notions.

Proof route: Work with extensions of the ordinary étale factor by its multiplicative dual. Identify polarized extension classes with the integral symmetric lattice, including at 2. Use the formal-torus presentation of finite-level extension classes modulo squares and its Frobenius descent to lift successively over O/π^n; avoid the higher-tier local-Galois-cohomology proof. The finite-level skew-to-symmetric-extension and descended smoothness identification are explicit proof obligations: the source’s alternative stack argument is the guide, not a substitute for verifying them. Apply Serre–Tate and effectivity after those checks.

Inputs: `A4/ordinary-serre-tate-coordinates`, `A4/polarized-effectivity`, `A3/theta-group`.

Sources: bcgp25 — Lemma 10.3.1, Remark 10.3.2 and alternate proof, pp.215–218 (Ordinarity and the underlying torsion conclusion are necessary boundaries; the formal-torus proof avoids averaging by 2.).

Acceptance: The example α₂ with pairing 1+xy does not validate a general characteristic-two alternating lifting theorem. The lifted object has A[2], correcting the stray A[p] in the dyadic statement.


### Genus-two Jacobian lift comparison

**Target:** `A4/genus-two-jacobian-lifting` (theorem).

In the odd-prime situation above, suppose A₀=Jac(C₀) with its principal polarization, for a smooth genus-two curve C₀. The map from marked curve deformations to marked principally polarized abelian deformations is an equivalence of formal deformation functors. Thus a principally polarized abelian lift with a specified special-fibre identification comes from a formal curve lift, unique up to an isomorphism compatible with the markings and the Jacobian identification, and effective over O. Since 2 is invertible, the dual tangent map Sym²H⁰(C₀,ω)→H⁰(C₀,ω²) is an isomorphism between three-dimensional spaces.

Proof route: Compare the two smooth deformation functors of dimension three and compute the Torelli tangent map by multiplication of canonical differentials. For a genus-two hyperelliptic curve in odd characteristic, the three products of a basis form a basis of H⁰(ω²). Formal inverse-function lifting identifies the functors; use curve effectivity.

Inputs: `AbelianSchemesAndArithmeticModuli:A4/odd-prime-finite-level-lifting`, `AbelianSchemesAndArithmeticModuli:A4/grothendieck-messing`, `SchemeAndStackFoundations:SF.4/effective-formal-deformations-of-curves`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

Sources: bcgp25 — Remark 9.3.5, p.202 (The Jacobian deformation comparison is a separate odd-prime application.).

Acceptance: The curve has to be smooth; a decomposable polarized surface is not a genus-two Jacobian.

## A5. Polarized complex uniformization and families

Construct the actual polarized analytic family and its lattice maps, not only a classification of complex points. Algebraicity of a single polarized torus uses theta embedding, Chow and proper GAGA in that order. Analytic families correspond to variations; a converse algebraization over an algebraic base stays with the higher moduli consumer. Homology/cohomology, sign and lattice-dual conventions are fixed before introducing the Siegel family.


### Complex lattice realization

**Target:** `A5/complex-lattice-realization` (construction). **Planet:** Complex uniformization.

For a complex abelian variety A, its analytic exponential identifies A^an with V/Λ, where V=T₀(A^an) and Λ=ker exp is a full Z-lattice of rank 2g. Identify Λ naturally with H₁(A^an,Z) and T_ℓ A with Λ⊗Z_ℓ. A holomorphic homomorphism is exactly a complex-linear map V→W carrying Λ into Γ. Use existing real-lattice and manifold carriers; no second definition of a Z-lattice or smooth manifold is introduced.

Proof route: Import the native real Lie exponential and its local-diffeomorphism theorem. Supply the underlying real smooth Lie-group structure of the abelian analytification and prove the complex-linear differential makes this exponential holomorphic; identify its discrete kernel. Connectedness gives surjectivity and compactness gives cocompactness. The geometric/holomorphic adapter is part of this target, not a second general Lie exponential. Covering-space lifting identifies H₁ and homomorphisms; n-torsion is (1/n)Λ/Λ. Proper GAGA identifies analytic homomorphisms of algebraic abelian varieties.

Inputs: `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `mathlib:IsZLattice`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`, `tauceti:lieExp`, `tauceti:isLocalDiffeomorphAt_lieExp_zero`.

Sources: analytic — Theorem 1.8 and §1.2, pp.2–4 (The exponential lattice, homology and Tate identifications are functorial.).

API outline:

- `AbelianLattice.ofAbelian` (constructor): Return V, Λ and the analytic exponential quotient isomorphism.
- `AbelianLattice.homology` (compatibility): Identify Λ with integral H₁ naturally.
- `AbelianLattice.map` (functoriality): Differentiate a homomorphism and preserve its lattice.
- `AbelianLattice.tate` (compatibility): Identify Λ⊗Z_ℓ with the integral Tate module.

Unit tests:

- `AbelianLattice.elliptic` (computation): For C/(Z+iZ), Λ is Z², not a rank-one complex lattice.
- `AbelianLattice.zero` (degenerate): Dimension zero gives V=0 and Λ=0.
- `AbelianLattice.irrational_map` (non-example): Multiplication by √2 on C does not descend to C/(Z+iZ).

Uses: A5 polarized Hodge equivalence — Supply the integral homological carrier.; A4 comparison; A6 Charles16 consumer — Keep cohomological duals and Hom contravariance precise..

Acceptance: For E=C/(Z+τZ), Im τ>0, the lattice has rank two. The lattice inclusion, rather than an arbitrary basis, is the invariant data.

### Riemann forms and polarization sign

**Target:** `A5/riemann-form` (definition). **Planet:** Riemann forms.

For a finite-dimensional real vector space V with complex structure J and full lattice Λ, a Riemann form is an integral alternating form E:Λ×Λ→Z whose real extension satisfies E(Jv,Jw)=E(v,w) and E(Jv,v)>0 for v≠0. Its Hermitian form, linear in the first variable, is H(v,w)=E(Jv,w)+iE(v,w). Its degree/type uses the integral elementary divisors; unimodularity is an additional principal-polarization condition. The associated homological polarization has weight −1 and types (−1,0),(0,−1). For the native homological weight −1 convention, let the (−1,0) component be the +i eigenspace of J. Its Weil operator is −J, and the native polarizing form is Q=−E; this preserves Q(Cv,v)=E(Jv,v)>0. The effective weight-one Riemann criterion already exists in the Hodge library and is imported.

Proof route: Extend E by real scalar extension, derive the Hermitian identities and recover E as Im H. Import native HodgeStructure, IsPolarization/Polarization, HodgeStructureOn.dual, and the effective weight-one Riemann bilinear criterion. Construct only the integral geometric lattice/torus adapter. For homological type (−1,0),(0,−1), take C=−J and Q=−E; dualization changes weight and must transport the polarizing form with the native sign convention, not retain an unexamined E.

Inputs: `AbelianSchemesAndArithmeticModuli:A5/complex-lattice-realization`, `tauceti:TauCeti.AlmostComplexStructure.hodgeStructure`, `tauceti:TauCeti.Hodge.HodgeStructure`, `tauceti:TauCeti.Hodge.IsPolarization`, `tauceti:TauCeti.Hodge.Polarization`, `tauceti:TauCeti.Hodge.HodgeStructureOn.dual`, `tauceti:TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos`.

Sources: analytic — Definitions 1.13–1.14, Lemma 1.16, pp.5–6 (The source uses a first-variable-linear Hermitian form.); faltings-chai — I.6, pp.29–30 (The Siegel positive cone is the period-domain convention.).

API outline:

- `RiemannForm.hermitian` (data): Recover H=E(J·,·)+iE.
- `RiemannForm.integral` (characterisation): The restriction to Λ has integer values and E(x,x)=0.
- `RiemannForm.pullback` (functoriality): Pull back along an injective complex-linear lattice map.
- `RiemannForm.isPrincipal` (characterisation): The induced Λ→Λ* is an isomorphism exactly for unimodular E.
- `RiemannForm.hodgeDual` (compatibility): Dualize the homological structure through native HodgeStructureOn.dual to weight-one cohomology, explicitly preserving the native polarization sign (Q=−E on H₁).
- `RiemannForm.integralPairing` (data): Construct the Z-bilinear lattice pairing from its integer values.
- `RiemannForm.scale` (constructor): A positive integer multiple of E remains a positive integral Riemann form; scaling is not a principal-polarization operation.
- `RiemannForm.ext` (extensionality): Two Riemann forms agree when their real bilinear forms agree.

Unit tests:

- `RiemannForm.gaussian` (computation): On Z+iZ with standard H, E(i,1)=1 and E(1,i)=−1.
- `RiemannForm.double` (non-example): 2E is positive integral but has lattice cokernel (Z/2)², hence is not principal.
- `RiemannForm.zero_dimension` (degenerate): On V=0 positivity is vacuous and the zero pairing is unimodular.
- `RiemannForm.negative` (non-example): −E on a positive-dimensional torus fails E(Jv,v)>0.
- `RiemannForm.scale_nonprincipal` (non-example): For a principal form on a nonzero finite lattice, its double is positive integral and is not principal; surjectivity on the integral dual fails.
- `RiemannForm.homological_sign` (non-example): On the Gaussian rank-two lattice with E(Jv,v)>0, the native weight −1 Weil operator is C=−J. Q=−E has Q(Cv,v)>0; using Q=E would give a negative value.

Uses: Gao–Ge–Kühne §2.1 — Compute polarization type, Pfaffian and Chern class.; A5 Siegel family; Charles16 — Pin the sign, weight and lattice-dual conventions..

Acceptance: For Λ=Z+iZ and H(v,w)=v·conj(w), E(i,1)=1 and E(Jv,v)>0.

### Appell–Humbert and algebraicity

**Target:** `A5/appell-humbert-and-algebraicity` (theorem). **Planet:** Appell–Humbert theorem.

Holomorphic line classes on V/Λ are uniquely described by a Hermitian H with integral imaginary part E and a unitary semicharacter α with α(λ+μ)=(−1)^E(λ,μ)α(λ)α(μ). The factors j_λ(z)=α(λ)exp(πH(z,λ)+πH(λ,λ)/2) construct the line. Positive H gives an ample line, and its third and higher powers embed the torus. A complex torus is algebraizable iff it admits a positive Riemann form; Chow and proper GAGA then algebraize its group law. The Riemann form is its c₁ and determines φ_L.

Proof route: Verify the factors-of-automorphy cocycle, recover c₁ from its logarithmic coboundary, and identify the topologically trivial ambiguity by the semicharacter. For positive H construct theta sections and their translated cubic products to separate points and tangent directions. Embed into projective space, apply Chow and proper morphism GAGA. Conversely pull back a projective ample line and recover positive H. This does not apply GAGA to arbitrary compact nonalgebraic manifolds.

Inputs: `A5/riemann-form`, `ComplexComparisonPartII:C4`, `A2/mumford-map-and-biextension`.

Sources: analytic — Theorems 1.17–1.18 and Corollary 1.20, pp.6–8 (The classification, embedding and Chow/GAGA steps have distinct roles.).

Acceptance: The nonpositive trivial line has E=0 and is not ample for g>0. Changing α with H fixed changes a Pic⁰ factor and preserves the Mumford map.


### Polarized integral Hodge equivalence

**Target:** `A5/polarized-hodge-equivalence` (theorem). **Planet:** Polarized Hodge equivalence.

Analytification and H₁ give an equivalence between complex abelian varieties with polarizations and polarizable free finite integral Hodge structures of types (−1,0),(0,−1), with integral alternating positive forms. Morphisms are group homomorphisms/integral Hodge maps, with pullback condition when polarization preservation is requested. Principal objects correspond to unimodular forms. On cohomology the equivalence is contravariant and has types (1,0),(0,1): Hom(A,B)≅Hom_HS(H¹(B,Z),H¹(A,Z)). The general integral Hodge and polarization objects are the existing TauCeti.Hodge.HodgeStructure and TauCeti.Hodge.Polarization; the work here is their geometric realization and the weight/sign adapter, not a new Hodge carrier. In the homological native convention the Riemann form E corresponds to Q=−E with Weil operator C=−J, as fixed in A5/riemann-form; the dual cohomological form is transported with its sign.

Proof route: Use the imported complex-structure/weight-one equivalence on the real vector space, with the integral lattice as extra data. Construct the torus from its lattice and complex structure, algebraize using the positive form, and identify morphisms through linear covering lifts and proper GAGA. Dualize H₁ to H¹ and verify the twist/sign of polarization, rather than silently replacing the homological structure by weight one.

Inputs: `AbelianSchemesAndArithmeticModuli:A5/complex-lattice-realization`, `AbelianSchemesAndArithmeticModuli:A5/riemann-form`, `AbelianSchemesAndArithmeticModuli:A5/appell-humbert-and-algebraicity`, `tauceti:TauCeti.AlmostComplexStructure.hodgeStructure`, `tauceti:TauCeti.Hodge.HodgeStructure`, `tauceti:TauCeti.Hodge.IsPolarization`, `tauceti:TauCeti.Hodge.Polarization`, `tauceti:TauCeti.Hodge.HodgeStructureOn.dual`.

Sources: analytic — §1.2–1.3, pp.3–8 (Complex-linear lattice maps and algebraicity provide the equivalence.); charles16 — Lemma 3.15 proof, p.516 (The cited proof uses the Hodge-class description of Hom for complex abelian varieties. The full integral contravariant Hom equivalence is derived through the lattice/GAGA argument, rather than attributed verbatim to this lemma.).

Acceptance: For A=B=E without CM, the integral Hodge endomorphism ring is Z. A rational Hodge map corresponds to a quasi-homomorphism; it need not be integral.

### Analytic polarized families and algebraic comparison

**Target:** `A5/analytic-families-and-comparison` (theorem).

Over a complex analytic base T, proper smooth analytic group families with a locally constant integral polarization type correspond to polarized integral homological variations of the above types. Construct the family as the quotient of its holomorphic Lie bundle by the locally constant lattice, and recover its zero and group law. For an algebraic abelian scheme over a finite-type complex base, analytification gives this variation, with H¹_dR⊗O_an≅H¹_B⊗O_an and its Hodge filtration and connection under the smooth-base hypothesis. No converse algebraization over an algebraic base is asserted.

Proof route: Perform the exponential/lattice construction locally on the analytic base and descend using lattice monodromy. Polarization gives relative properness and the holomorphic Hodge subbundle. For an algebraic family use proper coherent GAGA on the relative de Rham complex and fibrewise Betti comparison, then the Gauss–Manin construction to identify the locally constant system and horizontal maps. Check the point and genus-one specializations against the imported elliptic carrier and its differential; moving the analytic comparison down avoids the R12.1 upward dependency.

Inputs: `A5/polarized-hodge-equivalence`, `A4/abelian-h1-de-rham`, `ComplexComparisonPartII:C3/repair-relative-proper-gaga`, `ComplexComparisonPartII:C5/repair-proper-de-rham-betti`.

Sources: faltings-chai — I.6, pp.29–30 (The period-domain universal family carries its integral lattice and Hodge subbundle.); analytic — Theorem 1.8; Corollary 1.20, pp.2–3,8 (The fibrewise analytic construction is promoted by lattice descent; a relative proof remains recorded explicitly.).

Acceptance: An analytic variation is not automatically an algebraic abelian scheme over an algebraic base. Preserve the differential and evaluation pairing, not just ranks.


### Siegel universal analytic family

**Target:** `A5/siegel-analytic-family` (construction). **Planet:** Siegel universal family.

For H_g={Ω∈M_g(C):Ωᵀ=Ω, Im Ω positive definite}, define X_Ω=C^g/(Z^g+ΩZ^g) and the family (C^g×H_g)/Z^(2g). The standard unimodular alternating lattice form gives its principal polarization. Sp_(2g)(Z) acts by Ω↦(AΩ+B)(CΩ+D)^−1 and z↦(CΩ+D)^−T z in the column convention for this lattice. Integral monodromy is the lattice action. Full level N is a symplectic lattice trivialization modulo N with its μ_N target; N≥3 removes stabilizers. Nonprincipal types use their actual lattice automorphism groups.

Proof route: Check the lattice action is properly discontinuous on the total space, construct local quotient charts and the holomorphic zero section. Compute the symplectic action on periods and fibre coordinates, explicitly checking the transpose in the column convention. Identify the torsion lattice quotient and level monodromy.

Inputs: `A5/analytic-families-and-comparison`, `A5/riemann-form`, `A3/polarized-weil-pairing`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-full-level`.

Sources: faltings-chai — I.6, pp.29–30 (Siegel periods, the group action and the universal abelian family are explicit.).

API:

- `SiegelFamily.fibre` (data): Identify the fibre with C^g/(Z^g+ΩZ^g).
- `SiegelFamily.polarization` (data): Return the unimodular positive form on the universal lattice.
- `SiegelFamily.symplecticAction` (functoriality): Give the compatible period, lattice and fibre action.
- `SiegelFamily.level` (compatibility): Identify N-torsion with the lattice modulo N and retain μ_N.

Definition tests:

- `SiegelFamily.genus_one` (compatibility): For g=1 recover the standard elliptic period quotient and dz.
- `SiegelFamily.genus_zero` (degenerate): H₀ and the fibre are points with trivial lattices.
- `SiegelFamily.bad_period` (non-example): A symmetric matrix with singular Im Ω does not give a compact polarized torus.
- `SiegelFamily.level_two` (non-example): At level two −1 acts trivially on torsion and remains a stabilizer.

Uses: PELModuli M3 and ShimuraVarieties V1 — Export the actual analytic family and its polarization/level maps.; A6 Hodge determinant — Compute the automorphy factor on the Hodge line..

Acceptance: For g=1 obtain C/(Z+τZ), its invariant differential and standard elliptic Weil pairing.


## A6. Arithmetic Hom and moduli exports

Arithmetic Hom extends the native field category. Saturated Tate faithfulness is not a Tate-surjectivity theorem. Coefficient Q-algebras do not alter the geometric field of an abelian variety; their quasi-isogenies have two-sided inverses. Positivity is needed for real polarized torsors. Normal-base Hom extension and localized torsor descent have explicit general-base obligations. Hodge lines are determinants of supplied families, not new moduli spaces.


### The degree of an endomorphism, extended to End⁰(A)

**Target:** `A6/degree-of-an-endomorphism` (definition).

For field abelian varieties A,B of equal dimension g, deg f is the finite-flat rank if f is an isogeny and zero otherwise; for an isogeny it equals the function-field degree, including inseparable degree. For equal-dimensional composable maps it is multiplicative. On End A, deg[n]=|n|^(2g), including n=0 with 0^0=1. Extend to End⁰ A by deg(q)=deg(nq)/n^(2g) for any positive denominator n; the extension is independent of n and is nonzero exactly on units. For g=0 End A is the zero ring, its unique morphism is the identity and has degree one.

Hypotheses: The degree counts inseparable degree. For the Frobenius π of an elliptic curve over 𝔽_p, deg π = p while ker π(k̄) = 0. So deg is not the number of geometric points of the kernel.; The extension to End⁰(A) uses that End(A) is torsion-free (theorem hom-to-tate-module-homs-is-injective).; deg [n] = n^{2g} is AbelianSchemesAndArithmeticModuli A3's statement that [n] is finite locally free of rank n^{2g}..

Proof route: Equal-dimensional nonisogenies have a lower-dimensional image, and a composite is an isogeny exactly when both factors are. Finite-flat ranks multiply; the function-field interpretation is SF.5. Scale by [n] and use torsion freeness before choosing denominators. Every finite kernel is killed by a nonzero integer, giving the quasi-inverse through the quotient universal property. Treat dimension zero first: all degree values are one, so the zero endomorphism is an isogeny.

Inputs: `A3/relative-isogeny`, `A3/torsion-divisibility`, `A3/multiplication-and-density`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End`, `SchemeAndStackFoundations:SF.5/finite-flat-degree`.

Sources: milne-abelian-varieties — §10, Theorem 10.9, p. 46 (Degree 0 for a non-isogeny.); milne-abelian-varieties — §10, Remark 10.11, p. 47 (Extension of deg to End⁰(A) through deg(nα) = n^{2g} deg α.).

API:

- `TauCeti.AlgebraicGeometry.AbelianVariety.Hom.deg` (constructor): Hom.deg (α : A ⟶ B) : ℕ, the degree of α if it is an isogeny and 0 otherwise.
- `TauCeti.AlgebraicGeometry.AbelianVariety.deg_comp` (simp): For A,B,C of equal dimension, deg(f≫h)=deg f·deg h.
- `TauCeti.AlgebraicGeometry.AbelianVariety.deg_mulBy` (simp): Hom.deg (mulBy A n) = n.natAbs ^ (2 * g) for g the dimension of A.
- `TauCeti.AlgebraicGeometry.AbelianVariety.isIsogeny_iff_deg_ne_zero` (characterisation): IsIsogeny α ↔ Hom.deg α ≠ 0 for α : A ⟶ B with dim A = dim B.
- `TauCeti.AlgebraicGeometry.AbelianVariety.End.degRat` (constructor): End.degRat : Q⊗Z End A → Q, the coefficient extension n^(−2g) deg(nα); swapping tensor factors gives End A⊗Z Q.
- `TauCeti.AlgebraicGeometry.AbelianVariety.degree_dimension_zero` (compatibility): For dim A=0 every endomorphism has degree one.

Definition tests:

- `TauCeti.AlgebraicGeometry.AbelianVariety.deg_mulBy_two_elliptic` (computation): On an elliptic curve deg [2] = 4 (four 2-torsion points when char k ≠ 2).
- `TauCeti.AlgebraicGeometry.AbelianVariety.deg_zero` (degenerate): For g>0, deg 0=0 and deg 1=1; for g=0, 0=1 and its degree is one.
- `TauCeti.AlgebraicGeometry.AbelianVariety.deg_frobenius_ne_card_ker` (non-example): For the Frobenius π of an elliptic curve over 𝔽_p, deg π = p although π is injective on k̄-points: deg is not the number of geometric points of the kernel.
- `TauCeti.AlgebraicGeometry.AbelianVariety.deg_neg_one` (computation): deg [−1] = 1, consistent with deg [n] = n^{2g}.

Uses: AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism — P_α(r) = deg(α − r); AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank — deg as a positive integer-valued polynomial on nonzero endomorphisms of a simple variety; SmallRamificationAndAbelianVarietyBaseCases — #A(𝔽_q) = deg(1 − F) for the Frobenius F; DeligneWeightsAndPurity:DWP.1 — deg(1 − π^n) and the point counts of the Weil estimate.

Acceptance: deg [2] = 4 on an elliptic curve, and 2^{2g} on an abelian variety of dimension g. For the Frobenius π of an elliptic curve over 𝔽_q, deg π = q, deg(1 − π) = #E(𝔽_q).


### Endomorphisms of simple abelian varieties form a division algebra

**Target:** `A6/endomorphisms-of-simple-abelian-varieties` (theorem).

Let A be a simple abelian variety over a field k: A ≠ 0 and its only abelian subvarieties are 0 and A. Then every nonzero α ∈ End(A) is an isogeny, and End⁰(A) = End(A) ⊗ ℚ is a division algebra. If A and B are simple, Hom⁰(A, B) = 0 unless A and B are isogenous, in which case it is free of rank one over End⁰(A) on the right and over End⁰(B) on the left. For simple A, End⁰(Aⁿ) ≅ M_n(End⁰(A)).

Hypotheses and conventions: The argument through the image of α works over every field. The source argues through the connected component of the kernel, which needs geometric reducedness over an imperfect field; the author flags this in footnote 11.

Proof route: Use the field-image theorem recorded in G-abelian-image: a nonzero map between simple field abelian varieties has full abelian image and finite kernel. The immutable field anchor supplies its carrier, not that additional image theorem. Kill the finite-flat kernel by an integer and factor through its quotient to obtain a quasi-inverse. Use product inclusions and projections to identify matrix rings and the left/right division-algebra module structures.

Inputs: `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `AbelianSchemesAndArithmeticModuli:A3/torsion-divisibility`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`.

Sources: milne-abelian-varieties — §10, p. 43 (End⁰(A) of a simple A is a division algebra.); milne-abelian-varieties — §10, p. 42 (The definition of a simple abelian variety.).

Acceptance: A supersingular elliptic curve over 𝔽̄_p: End⁰ is the quaternion algebra over ℚ ramified at p and ∞, a division algebra. E × E is not simple: the diagonal is an abelian subvariety, and End⁰(E × E) = M_2(End⁰(E)) is not a division algebra.

Recorded proof obligations: `G-abelian-image`.

### Hom(A, B) embeds in Hom(T_ℓA, T_ℓB); Hom(A, B) is torsion-free

**Target:** `A6/hom-to-tate-module-homs-is-injective` (theorem).

Let A and B be abelian varieties over a field k and ℓ ≠ char k a prime. The map Hom(A, B) → Hom_{ℤ_ℓ}(T_ℓA, T_ℓB) is injective, so Hom(A, B) is torsion-free. If T_ℓα is divisible by ℓ^n in Hom(T_ℓA, T_ℓB), then α is divisible by ℓ^n in Hom(A, B).

Hypotheses: ℓ ≠ char k. For ℓ = p the ℓ-adic Tate module can be 0 (supersingular varieties) and the map is not injective.; T_ℓA = lim A[ℓ^n](k^sep), free of rank 2g over ℤ_ℓ, is AbelianSchemesAndArithmeticModuli A4's..

Proof route: A map with zero Tate realization kills every ℓ-power torsion subgroup. That torsion is Zariski dense by A3, hence the map is zero. This proof has no Poincaré or degree-polynomial prerequisite. Divisibility of the Tate map by ℓ^n means zero on its quotient A[ℓ^n]; finite étaleness converts geometric vanishing into scheme vanishing. Apply torsion divisibility.

Inputs: `A3/multiplication-and-density`, `A3/torsion-divisibility`, `A4/etale-tate-module`.

Sources: milne-abelian-varieties — §10, Lemma 10.6, p. 45 (Hom(A, B) → Hom(T_ℓA, T_ℓB) is injective.); milne-abelian-varieties — §10, Lemma 10.6, p. 45 (Hom(A, B) is torsion-free.).

Acceptance: For an ordinary elliptic curve over 𝔽̄_p, End(E) embeds in End(T_ℓE) ≅ M_2(ℤ_ℓ) for ℓ ≠ p. For ℓ = p and E supersingular over 𝔽̄_p, T_pE = 0, so injectivity fails.


### Monic polynomials are determined by ℓ-adic absolute values of resultants

**Target:** `A6/polynomials-determined-by-l-adic-values` (lemma).

Let P = ∏(X − a_i) and Q = ∏(X − b_i) be monic polynomials of the same degree with coefficients in ℚ_ℓ. If |∏_i F(a_i)|_ℓ = |∏_i F(b_i)|_ℓ for all F ∈ ℤ[T], then P = Q.

Hypotheses: The hypothesis concerns absolute values only; it is extended to F with coefficients in ℚ_ℓ by continuity..

Proof route: By coefficient continuity and clearing denominators extend the equality from Z[T] to Q_ℓ[T]. For each irreducible factor f of P or Q, perturb f by small constants. The product of its values on the roots has valuation whose unbounded contribution counts the multiplicity of the f-root orbit. Compare the valuations as the constants tend to zero; separate the other factors, whose values stay bounded away from zero. Each irreducible factor has equal multiplicity, hence P=Q. This uses conjugate root orbits, not an assumption that an individual root is Q_ℓ-rational.

Inputs: .

Sources: milne-abelian-varieties — §10, Lemma 10.21, p. 51 (Lemmas 10.21 and 10.22.).

Acceptance: P = (X − 1)² and Q = (X − 1)(X − 1 − ℓ): F = T − 1 gives 0 for both, but F = T − 1 − ℓ gives |ℓ²|_ℓ = ℓ⁻² for P and |0|_ℓ = 0 for Q, so the hypothesis separates them.


### A multiplicative polynomial function evaluated on polynomials in an element

**Target:** `A6/multiplicative-polynomial-functions` (lemma).

Let E be a unital K-algebra over an infinite field K and δ:E→K a multiplicative homogeneous polynomial law of degree d with δ(1)=1, stable under scalar extension. Let P_α(X)=δ(X·1−α) be monic of degree d with roots a_i in a splitting extension. Then δ(F(α))=∏_i F(a_i) for every F∈K[T]. For the abelian degree law d=2g, the conventions δ(α−X) and δ(X−α) agree.

Hypotheses: The sign is (−1)^{deg F · deg P}; only absolute values are used in the application..

Proof route: Extend scalars to split F=c∏(T−b_j). Homogeneity gives δ(c·1)=c^d, and multiplicativity gives δ(F(α))=c^d∏δ(α−b_j). Replace each δ(α−b_j) by (−1)^d P_α(b_j); the two resultant signs cancel, leaving ∏F(a_i). Retain homogeneity, normalization and scalar-extension hypotheses missing from a merely multiplicative set function.

Inputs: .

Sources: milne-abelian-varieties — §10, Lemma 10.22, p. 51 (Lemmas 10.21 and 10.22.).

Acceptance: E = M_2(K) and δ = det: δ(α − x) = charpoly(α)(x), and det F(α) = ∏F(a_i) over the eigenvalues.


### Degrees of polarizations under isogenies

**Target:** `A6/degree-formulas-for-polarized-isogenies` (theorem).

Let α : A → B be an isogeny of abelian varieties over k and λ′ a polarization of B. Then α^*λ′ = α^∨ ∘ λ′ ∘ α is a polarization of A and deg(α^*λ′) = deg(λ′)·deg(α)². The degree of a polarization is a square, deg φ_L = χ(L)², and a principal polarization has degree 1.

Hypotheses and conventions: deg α^∨ = deg α, for the dual isogeny (A2, A3). A2/ample-cohomology-and-degree supplies deg φ_L=χ(L)². A polarization not represented by a line over k is computed after geometric base change.

Proof route: α^∨λ′α becomes φ_{α^*L′} over k̄ when λ′ = φ_{L′}, and α^*L′ is ample because α is finite. Multiplicativity of degrees (node degree-of-an-endomorphism) and deg α^∨ = deg α (A2, A3). deg φ_L = χ(L)² is imported from A2.

Inputs: `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `AbelianSchemesAndArithmeticModuli:A2/mumford-map-and-biextension`, `AbelianSchemesAndArithmeticModuli:A2/ample-cohomology-and-degree`, `AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism`.

Sources: milne-abelian-varieties — §13, Remark 13.9, p. 60 (deg λ = deg λ′ · deg(α)².); milne-abelian-varieties — §11, Theorem 11.1, p. 54 (deg φ_L = χ(L)², with χ(L) the Euler characteristic.).

Acceptance: E an elliptic curve with principal polarization λ and α = [n]: deg([n]^*λ) = n⁴ = deg(n²λ). A principally polarized Jacobian: deg λ = 1.

### Weil restriction along a finite locally free morphism

**Target:** `A6/weil-restriction-functor` (comparison).

Import the R09.3 finite-locally-free restriction functor T↦Hom_(S′)(T×_S S′,X), its fppf sheaf property and algebraic-space representability. Apply its scheme criterion when every finite subset of a fibre lies in an affine open; do not assert that restrictions of an arbitrary affine cover cover the whole restriction.

Hypotheses: Algebraic-space representability is AlgebraicModuliForArithmeticGeometry R09.3's (Stacks 05YF), as RS-02 directs.; The morphism S′ → S must be finite locally free. For a non-flat S′ → S, T ↦ X(T ×_S S′) is not in general representable..

Proof route: Import the R09.3 representing functor and its base-change maps; apply its finite-subset affine-neighbourhood scheme criterion to the abelian case, using A2 Raynaud/projectivity. No generic Weil-restriction construction is repeated here.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.3/r093-weil-restriction`, `AlgebraicModuliForArithmeticGeometry:R09.3/r093-restriction-algebraicity`, `A2/raynaud-scheme-representability`.

Sources: poonen-rational-points — §4.6, Definition 4.6.1, p. 110 (The functor of points of the restriction of scalars.); poonen-rational-points — §4.6, Remark 4.6.6, p. 112 (Res_{S′/S} for S′ finite locally free over S.); stacks-05YF — Stacks Project, Tag 05YF (Proposition 97.11.5) (Res_{Z/B}(X) is an algebraic space for Z → B finite locally free.); stacks-05YC — Stacks Project, Tag 05YC (Lemma 97.11.2) (Compatibility with base change.).

Acceptance: Res_{S/S}(X) = X. For S′ = S ⊔ S, Res_{S′/S}(X) = X₁ ×_S X₂, where X = X₁ ⊔ X₂ over the two copies.


### Weil restriction of quasi-projective varieties over fields is a scheme

**Target:** `A6/weil-restriction-of-quasi-projective-schemes` (comparison).

Import the R09.3 finite-locally-free restriction functor T↦Hom_(S′)(T×_S S′,X), its fppf sheaf property and algebraic-space representability. Apply its scheme criterion when every finite subset of a fibre lies in an affine open; do not assert that restrictions of an arbitrary affine cover cover the whole restriction.

Hypotheses: The general criterion is Bosch–Lütkebohmert–Raynaud §7.6, Theorem 4, which Poonen cites and which was not read. The scheme-representability criterion is requested with the algebraic-space theory from AlgebraicModuliForArithmeticGeometry R09.3.; The affine-open hypothesis cannot be weakened to a cover by affines (Poonen Exercise 4.8)..

Proof route: Import the R09.3 representing functor and its base-change maps; apply its finite-subset affine-neighbourhood scheme criterion to the abelian case, using A2 Raynaud/projectivity. No generic Weil-restriction construction is repeated here.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.3/r093-weil-restriction`, `AlgebraicModuliForArithmeticGeometry:R09.3/r093-restriction-algebraicity`, `A2/raynaud-scheme-representability`.

Sources: poonen-rational-points — §4.6, Proposition 4.6.3, p. 111 (Existence of Res_{L/k}X.); poonen-rational-points — §4.6, Remark 4.6.5, p. 111 (Quasi-projective varieties satisfy the hypothesis.).

Acceptance: X = 𝔸¹_L: Res_{L/k} 𝔸¹ = 𝔸^{[L:k]}_k. X = 𝔾_{m,L}: Res_{L/k}𝔾_m is a k-torus of dimension [L:k] whose group of k-points is L^×.


### Abelian subvariety generated by a curve

**Target:** `A6/curve-generated-subvariety` (construction).

For a geometrically integral projective curve C⊂A over an algebraically closed field and chosen c̃₀∈C̃ mapping to c₀∈C, the smallest abelian subvariety containing C−c₀ is the image of Jac(C̃)→A induced by the normalization C̃ and its chosen point c̃₀. It is independent of c₀; C generates A iff this map is surjective. The translate by c₀ is essential: C itself need not contain zero.

Proof route: Use the existing Jacobian universal property for C̃ to construct the homomorphism. Its abelian image (G-abelian-image) contains all c−c₀ and is minimal by factorization through any candidate subvariety. Changing c₀ changes the curve map by a translation that does not change the induced image subgroup.

Inputs: `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`.

Sources: caro-pasten — §5.1, p.16 (The generated subvariety is a group generated by translated curve points.).

API outline:

- `CurveGenerated.mk` (constructor): Take the abelian image of the normalization-Jacobian map.
- `CurveGenerated.minimal` (universal-property): Factor through every abelian subvariety containing C−c₀.
- `CurveGenerated.basepoint` (compatibility): Changing c₀ does not change the image subgroup.
- `CurveGenerated.generates_iff` (characterisation): Generation of A is surjectivity of the Jacobian map.

Unit tests:

- `CurveGenerated.translate` (non-example): For C=a+(E×0), the generated subgroup is E×0, although C may not contain zero.
- `CurveGenerated.elliptic` (computation): An embedded elliptic subgroup generates itself.
- `CurveGenerated.point` (degenerate): A constant normalized curve map has zero image.

Uses: Caro–Pasten §5.1 — State the generation hypothesis for Morikawa positivity.; A6 Morikawa — Control the kernel of the positive adjoint product..

Acceptance: A translated elliptic fibre in E×E generates its elliptic direction, not all E×E.

Recorded proof obligations: `G-abelian-image`.

### Hodge determinant and moduli export

**Target:** `A6/hodge-determinant-and-moduli-export` (construction).

For a family π:A→S let ω_A=e*Ω¹_(A/S) and λ_H=det ω_A, using the existing geometric vector-bundle determinant. Both commute with base change; λ_(A×B)=λ_A⊗λ_B. For the Siegel analytic family its transition factor is det(CΩ+D), with the chosen cohomological Hodge-frame convention. These define line bundles by descent on the already-owned polarized/PEL/Hilbert moduli functors when those objects are supplied; this roadmap constructs no moduli stack and no converse algebraization theorem.

Proof route: Take the determinant of the invariant-form bundle through the existing vector-bundle API. Differentiate the universal symplectic coordinate change, distinguish the fibre-coordinate inverse transpose from the covariant Hodge-frame transition, and take determinants. Use base-change isomorphisms and their cocycle to descend the line on an external moduli object; the construction itself requires only a family and does not cite a higher PEL stage.

Inputs: `A1/relative-invariant-forms`, `A5/siegel-analytic-family`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

Sources: faltings-chai — I.6, pp.29–30 (The period-family differential cocycle determines the Hodge automorphy factor.).

API:

- `AbelianHodgeLine.mk` (constructor): Take det(e*Ω¹_(A/S)) through the existing vector-bundle API.
- `AbelianHodgeLine.baseChange` (functoriality): Pullback of a family pulls back its Hodge line.
- `AbelianHodgeLine.product` (compatibility): The Hodge line of a product is the tensor product.
- `AbelianHodgeLine.analyticFactor` (compatibility): In the Siegel Hodge frame the factor is det(CΩ+D).

Definition tests:

- `AbelianHodgeLine.elliptic` (compatibility): For an elliptic family the determinant is its rank-one invariant-differential line.
- `AbelianHodgeLine.zero` (degenerate): Dimension zero has determinant O_S.
- `AbelianHodgeLine.product` (computation): For E×E′ the line is ω_E⊗ω_E′.
- `AbelianHodgeLine.not_theta` (non-example): The Hodge determinant is not a chosen theta line on A and descends without choosing a theta characteristic.

Uses: PELModuli, Hilbert modular and automorphic-bundle consumers — Export the Hodge line on their supplied universal families.; A5 family comparison — Test the analytic/algebraic differential cocycle..

Acceptance: In genus one λ_H is the invariant-differential line of the native elliptic family.


### The degree is a homogeneous polynomial function of degree 2g on End⁰(A)

**Target:** `A6/degree-is-a-polynomial-function` (theorem).

Let A be an abelian variety of dimension g over a field k. The function deg : End⁰(A) → ℚ is a homogeneous polynomial function of degree 2g: for every finite family e_1, …, e_n in End⁰(A), deg(x_1e_1 + … + x_ne_n) is given by a homogeneous polynomial of degree 2g in (x_1, …, x_n) with rational coefficients.

Hypotheses: The source's Lemma 10.12 must be read with a bound on degrees: if x ↦ f(xv + w) is a polynomial of degree at most d for all v and w, then f is a polynomial function. Without the bound the proof's first sum can be infinite (a known erratum, recorded in sourceIssues).; The proof uses intersection numbers of divisors and their behaviour under finite surjective maps, requested from SchemeAndStackFoundations SF.5, and the theorem of the cube (A1)..

Proof route: For a symmetric ample D, cube gives the multivariable quadratic expression for (Σx_i e_i)*D in divisor classes, with cross terms biadditive. Expand its g-fold intersection: the projection formula gives deg(Σx_i e_i)=(pullback D)^g/D^g, also for nonfinite maps because the top intersection vanishes on a lower-dimensional image. Thus coefficients are rational and total degree at most 2g. Scaling all variables by an integer and comparing polynomial coefficients makes the polynomial homogeneous of degree 2g. On dimension zero it is the constant one. This does not infer integral coefficients from integer-valuedness.

Inputs: `A6/degree-of-an-endomorphism`, `A1/relative-cube-and-power`, `SchemeAndStackFoundations:SF.5/degree`, `SchemeAndStackFoundations:SF.5/chern-projection`.

Sources: milne-abelian-varieties — §10, Proposition 10.13, p. 47 (deg is a homogeneous polynomial function of degree 2g on End⁰(A).).

Acceptance: On an elliptic curve with End(E) = ℤ[i], deg(a + bi) = a² + b², a homogeneous quadratic form (g = 1). On E × E, deg of diag(a, b) is a²b², homogeneous of degree 4.


### Poincaré complete reducibility

**Target:** `A6/poincare-complete-reducibility` (theorem). **Planet:** Poincaré complete reducibility.

Let A be an abelian variety over a field k. For every abelian subvariety B ⊆ A there is an abelian subvariety B′ ⊆ A such that (b, b′) ↦ b + b′ : B × B′ → A is an isogeny. Consequently A is isogenous to a product A_1^{n_1} × … × A_r^{n_r} of simple abelian varieties, pairwise non-isogenous, and the multiset of isogeny classes with multiplicities is unique.

Hypotheses and conventions: Work over the original field, including imperfect fields. The complement is constructed as the image of an integral multiple of a rational projector; the field-image theorem is the explicit obligation G-abelian-image. Taking the reduced identity component of an arbitrary kernel is not a justified substitute. Uniqueness of the decomposition follows from the theorem endomorphisms-of-simple-abelian-varieties: Hom⁰ between non-isogenous simple factors vanishes.

Proof route: Choose an ample L over k; for i:B→A, λ_B=i∨φ_L i is an isogeny. In rational Hom form the retraction r=λ_B^−1 i∨φ_L, so ri=1. Clear a denominator in the rational projector 1−ir and let B′ be its abelian image, using the field-image theorem recorded in G-abelian-image. Then B∩B′ is finite and the addition B×B′→A is an isogeny. This avoids taking a reduced kernel over an imperfect field. Induct on dimension. Nonisogenous-simple Hom vanishing proves uniqueness and the multiplicities.

Inputs: `AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`, `AbelianSchemesAndArithmeticModuli:A2/mumford-map-and-biextension`, `AbelianSchemesAndArithmeticModuli:A3/torsion-divisibility`.

Sources: conrad-feng — Theorem 7.6.1, pp.73–74 (The polarization-retraction proof supplies the complement; use an image projector to avoid the reduced-kernel issue.); milne-2022 — Theorem 12.1, pp.22–23 (The rational projector formulation of complete reducibility is valid over the original field.).

Acceptance: E × E′ for non-isogenous elliptic curves E and E′: the only abelian subvarieties are 0, E × 0, 0 × E′ and E × E′. For B the diagonal in E × E, the anti-diagonal is a complement B′, and B × B′ → E × E has kernel of order 4.

Recorded proof obligations: `G-abelian-image`.

### After base change to k̄, a separable Weil restriction is a product of conjugates

**Target:** `A6/weil-restriction-over-a-separable-extension-splits` (theorem).

Let L/k be a finite separable extension and X an L-variety with Res_{L/k}(X) representable. Then Res_{L/k}(X) ×_k k̄ ≅ ∏_{σ ∈ Hom_k(L, k̄)} X ×_{L,σ} k̄. When L/k is Galois with group G, Res_{L/k}(X)_L ≅ ∏_{σ∈G} σX. The Galois group Gal(k̄/k) acts on the right-hand side by permuting the factors through its action on Hom_k(L, k̄), compatibly with its action on each factor.

Hypotheses: Separability makes L ⊗_k k̄ ≅ ∏_σ k̄. For inseparable L/k the base change is not a product of copies of k̄ (Poonen Exercise 4.9)..

Proof route: L ⊗_k k̄ ≅ ∏_{σ: L → k̄} k̄ by separability. Base change (weil-restriction-functor): Res_{L/k}(X) ×_k k̄ = Res_{L⊗k̄/k̄}(X ⊗_L (L ⊗ k̄)), and for a product of copies of k̄ the restriction is the product of the pieces. The Galois action permutes the embeddings σ.

Inputs: `A6/weil-restriction-functor`.

Sources: poonen-rational-points — Exercise 4.7, p. 113 ((Res_{L/k}X)_L ≅ ∏_{σ∈G} σX for L/k Galois.).

Acceptance: L = ℚ(√2), X = 𝔾_m: Res(𝔾_m) ×_ℚ ℚ̄ ≅ 𝔾_m × 𝔾_m, with the Galois conjugation of √2 swapping the factors.


### Weil restriction along finite étale maps preserves abelian schemes; finite locally free does not

**Target:** `A6/finite-etale-weil-restriction-of-abelian-schemes` (theorem). **Planet:** Weil restriction of abelian schemes.

(i) Let S′ → S be finite étale of constant degree d and A an abelian scheme over S′ of relative dimension g. Then Res_{S′/S}(A) is an abelian scheme over S of relative dimension dg. (ii) This fails for finite locally free S′ → S: for D = k[ε]/(ε²) and an elliptic curve E/k, Res_{D/k}(E_D) is the tangent bundle of E, isomorphic by translation to E × Lie(E) ≅ E × 𝔾_a, which is not proper.

Hypotheses: The algebraic space Res_{S′/S}(A) (weil-restriction-functor) is a scheme by the abelian-algebraic-space-to-scheme theorem of A2 (Raynaud; Faltings–Chai I.1.9), with its stated base hypotheses. This is not an inference from properness of finite locally free morphisms.; (i) is the specified descent proof that the atlas asks for. (ii) is its negative acceptance example..

Proof route: Étale-locally on S, a finite étale S′ of degree d splits as ⊔_{i=1}^d S. Then Res_{S′/S}(A) = ∏_i A_i, a product of d abelian schemes, by weil-restriction-functor (base change and products). Properness, smoothness and geometrically connected fibres descend along the étale cover, and so does the group structure (Res of a group object is a group object). Res_{S′/S}(A) is an algebraic space (R09.3). An algebraic space that is étale-locally an abelian scheme is an abelian scheme by the A2 theorem under its base hypotheses. (ii): Res_{D/k}(X_D)(T) = X(T[ε]) = the tangent bundle T_X(T), the jet space of order 1 (Poonen Example 4.6.8). For a group E, translation trivializes it as E × Lie(E). The 𝔾_a factor is not proper.

Inputs: `A6/weil-restriction-functor`, `A1/relative-products-and-dimension`, `A2/raynaud-scheme-representability`.

Sources: poonen-rational-points — §4.6, Example 4.6.8, p. 112 (Res_{A/k}X_A for A = k[t]/(t^{n+1}) is the jet space.); stacks-05YC — Stacks Project, Tag 05YC (Lemma 97.11.2) (Base change used in the étale-local splitting.).

Acceptance: S′ = Spec L → S = Spec K for a finite separable L/K: Res_{L/K}(A) is an abelian variety of dimension [L:K]·dim A. E over k and D = k[ε]: Res_{D/k}(E_D)(k) = E(k[ε]) = E(k) × Lie(E), an extension of E by 𝔾_a, which is not proper.


### Hom(A, B) is free of finite rank, and Hom ⊗ ℤ_ℓ → Hom(T_ℓA, T_ℓB) is injective

**Target:** `A6/hom-is-free-of-finite-rank` (theorem). **Planet:** Finiteness of Hom.

Hom(A,B) is a free finite Z-module of rank at most 4 dim A·dim B. For each ℓ≠char k, Hom(A,B)⊗Z_ℓ→Hom_Zℓ(T_ℓ A,T_ℓ B) is injective with torsion-free cokernel. Thus End⁰ A is finite dimensional over Q. The statement is faithfulness and saturation, not the surjectivity of a Tate isogeny theorem.

Hypotheses: The source's proof has two known faults, listed on the author's errata page. The submodule M must lie in End⁰(A), not End(T_ℓA). Choosing a ℚ-basis of End⁰(A) assumes the finite-dimensionality being proved. The proof steps below take the corrected route: a lattice argument for each finitely generated saturated submodule, then a rank bound.; NS(A) ↪ Hom(A, A^∨) through L ↦ φ_L needs the dual abelian variety (A2 and Tau Ceti JacobianChallenge Layer E)..

Proof route: For a simple A and each finite-dimensional rational subspace W of End⁰ A, the nonzero points of N=W∩End A have integral degree at least one. Extend its degree polynomial to W_R; continuity at zero gives a neighbourhood meeting N only in zero. Therefore N is a finite free lattice. No global dimension bound has yet been assumed. N is saturated in End A. Approximate any proposed Z_ℓ-linear relation by integer coefficients; Tate divisibility then forces the approximants to be ℓ^r-multiples in N for arbitrarily large r. Its basis forces the original coefficients to vanish. Thus dim_Q W≤4g². The bound on every finite rational subspace makes End⁰ finite dimensional; apply the lattice step once to a rational basis. Reduce general Hom to simple factors using quasi-inverses of the Poincaré isogenies. Finally finite generation permits passage to Hom⊗Z_ℓ; quotient divisibility proves saturation. Dimension zero gives Hom=0.

Inputs: `A6/hom-to-tate-module-homs-is-injective`, `A6/degree-is-a-polynomial-function`, `A6/endomorphisms-of-simple-abelian-varieties`, `A6/poincare-complete-reducibility`, `mathlib:instModuleFinite_of_discrete_submodule`.

Sources: conrad-feng — Theorem 7.6.7, pp.75–76 (The lattice/finite-subspace argument gives finite generation without assuming it.); milne-abelian-varieties — Theorem 10.15 and corrected proof, pp.49–51 (Correct the arbitrary-submodule M claim by using the saturated N=W∩End A.).

Acceptance: E without CM in characteristic 0: End(E) = ℤ, rank 1 ≤ 4. Supersingular E over 𝔽̄_p: End(E) is a maximal order in a quaternion algebra, of rank 4 = 4·1·1, and the bound is attained.


### T_ℓ(Res_{L/K} A) ≅ Ind_{G_L}^{G_K} T_ℓ(A)

**Target:** `A6/tate-module-of-a-weil-restriction` (theorem).

Let L/K be a finite separable extension of fields, A an abelian variety over L, and ℓ ≠ char K. Choosing a separable closure K^s and an embedding L ⊂ K^s gives a G_K-equivariant isomorphism T_ℓ(Res_{L/K} A) ≅ Ind_{G_L}^{G_K} T_ℓ(A) = ℤ_ℓ[G_K] ⊗_{ℤ_ℓ[G_L]} T_ℓ(A). A different choice of embedding changes the isomorphism by the canonical isomorphism between the corresponding induced modules. For number fields, V_ℓ(Res_{L/K}A) is the induced Galois representation of V_ℓA.

Hypotheses: Induction and coinduction coincide for the finite-index subgroup G_L ⊆ G_K.; This field-level formula implies nothing about good reduction at ramified integral places, as the atlas warns..

Proof route: Split L⊗K^s into the finite embedding-indexed product; torsion of the restricted abelian variety is the corresponding finite direct sum. The continuous G_K-action permutes the finite embeddings with stabilizer G_L. Identify it with the continuous finite-index induced module: functions G_K→T_ℓ A satisfying the G_L equivariance relation, with support on the finite coset set. The finite sum commutes with the torsion inverse limit. Conjugating the selected embedding gives the canonical conjugation/induction isomorphism. This constructs only the finite-index comparison needed here, with no upward G7 citation.

Inputs: `A6/weil-restriction-over-a-separable-extension-splits`, `A4/etale-tate-module`.

Sources: poonen-rational-points — §4.6, p. 110 (Res_{L/k}X(k) = X(L), the arithmetic of X over L seen over k.).

Acceptance: L = K × K (split, étale): T_ℓ(Res A) = T_ℓA ⊕ T_ℓA with trivial permutation. L/K quadratic: V_ℓ(Res A) = Ind V_ℓA has dimension 4 dim A.


### Quadratic abelian twists

**Target:** `A6/quadratic-twists-and-restriction` (construction).

For a separable quadratic L/K and its character χ, descend A_L using the cocycle [−1] to form A^χ. The twist retains the principal/specified polarization because inversion preserves it. Res_(L/K)(A_L) is isogenous over K to A×A^χ; on L the sum/difference map is the matrix [[1,1],[1,−1]] with degree 2^(2g), including in characteristic two as a finite-flat isogeny. A(L)⊗Q decomposes into ± eigenspaces A(K)⊗Q and A^χ(K)⊗Q. Whenever these dimensions are finite, rank A(L)=rank A(K)+rank A^χ(K).

Proof route: The inversion cocycle descends the projective group scheme; compare its invariants and anti-invariants after extending to L. Descend the sum/difference maps and calculate their composite as [2] on each factor, computing the lattice determinant degree. Average with (1±σ)/2 on rational point groups, then use quadratic descent. No Mordell–Weil theorem is needed for the eigenspace identity itself.

Inputs: `A6/finite-etale-weil-restriction-of-abelian-schemes`, `A3/relative-isogeny`, `SchemeAndStackFoundations:SF.1/galois-descent-quasi-projective`.

Sources: abs26 — §1, p.1131; §4, pp.1137–1138 (Quadratic rank decomposition depends on the general abelian twist and rational eigenspaces.).

API:

- `QuadraticAbelianTwist.mk` (constructor): Descend A_L by the inversion cocycle.
- `QuadraticAbelianTwist.overExtension` (compatibility): Identify the twist with A after extending to L.
- `QuadraticAbelianTwist.polarization` (compatibility): Transport an inversion-invariant polarization.
- `QuadraticAbelianTwist.restrictionIsogeny` (data): Construct the sum/difference isogeny with degree 2^(2g).

Definition tests:

- `QuadraticAbelianTwist.trivial` (degenerate): For the trivial character the twist is A.
- `QuadraticAbelianTwist.elliptic` (compatibility): For a Weierstrass elliptic curve agree with its usual quadratic twist.
- `QuadraticAbelianTwist.degree` (computation): For g=1 the restriction/product isogeny has degree four, not two.
- `QuadraticAbelianTwist.sign` (non-example): The anti-invariant eigenspace belongs to A^χ(K), not a second copy of A(K) with the same descent action.

Uses: Alpoge–Bhargava–Shnidman items 13,58,59 — Supply the general quadratic twist and exact rank identity.; A6 restriction comparison — Make the induced-module splitting concrete..

Acceptance: Over R⊂C the two rational point eigenspaces have opposite complex-conjugation actions.


### The characteristic polynomial and trace of an endomorphism

**Target:** `A6/characteristic-polynomial-of-an-endomorphism` (definition). **Planet:** Characteristic polynomial.

For α∈End A there is a unique monic P_α∈Z[X] of degree 2g with P_α(r)=deg(α−[r]) for all r∈Z. For g>0 Tr α is minus the coefficient of X^(2g−1); for g=0 set Tr α=0 and P_α=1. On End⁰ A put P_(α/n)(X)=n^(−2g)P_α(nX)∈Q[X]. It is monic, denominator-independent and Tr is Q-linear; its constant coefficient is deg α.

Hypotheses and conventions: Uniqueness holds because a polynomial is determined by its values on ℤ (infinitely many points). For integral α, coefficient integrality follows from finite generation of End(A) and the determinant trick after the rational Tate determinant comparison. Integer-valued polynomiality by itself is insufficient. P_α is not the minimal polynomial of α in End⁰(A): for α = [n] it is (X − n)^{2g}.

Proof route: Degree polynomiality gives the rational monic P of degree 2g; uniqueness follows from its integer values. For an isogeny β, the ℓ-adic absolute value of deg β equals that of det T_ℓβ by its ℓ-primary finite kernel/cokernel. For a nonisogeny both vanish by its positive-dimensional kernel. Apply this to every F(α), then the multiplicative-polynomial and ℓ-adic-root lemmas to identify rational P with det(X−V_ℓα). Finite generation of End A makes every α integral over Z by the determinant trick on its left-multiplication matrix. Its Tate eigenvalues are algebraic integers; the already rational coefficients of P are therefore integers. Integer-valuedness alone is not the argument. Use the Tate matrix trace for additivity and extend by clearing denominators. Separate g=0 before extracting a coefficient.

Inputs: `AbelianSchemesAndArithmeticModuli:A6/degree-is-a-polynomial-function`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/polynomials-determined-by-l-adic-values`, `AbelianSchemesAndArithmeticModuli:A6/multiplicative-polynomial-functions`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `mathlib:Polynomial.funext`.

Sources: milne-abelian-varieties — §10, Theorem 10.9, p. 46 (Existence and uniqueness of P_α.); milne-abelian-varieties — §10, p. 48 (P_α is called the characteristic polynomial, and Tr is read off it.).

API outline:

- `TauCeti.AlgebraicGeometry.AbelianVariety.End.charpoly` (constructor): End.charpoly (α : End A) : ℤ[X], monic of degree 2g.
- `TauCeti.AlgebraicGeometry.AbelianVariety.End.charpoly_eval` (characterisation): (End.charpoly α).eval r = Hom.deg (α − r) for r : ℤ.
- `TauCeti.AlgebraicGeometry.AbelianVariety.End.charpoly_monic` (characterisation): (End.charpoly α).Monic ∧ (End.charpoly α).natDegree = 2 * g.
- `TauCeti.AlgebraicGeometry.AbelianVariety.End.trace` (constructor): End.trace α is minus coeff(2g−1) when g>0, and zero when g=0.
- `TauCeti.AlgebraicGeometry.AbelianVariety.End.charpoly_coeff_zero` (simp): (End.charpoly α).coeff 0 = Hom.deg α.
- `TauCeti.AlgebraicGeometry.AbelianVariety.End.trace_add` (simp): End.trace (α + β) = End.trace α + End.trace β.

Unit tests:

- `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_mulBy` (computation): End.charpoly (mulBy A n) = (X − n)^{2g}.
- `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_zero` (degenerate): End.charpoly 0 = X^{2g}, since deg(−r) = r^{2g}.
- `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_frobenius_elliptic` (computation): For an elliptic curve over 𝔽_q with trace of Frobenius a: End.charpoly π = X² − aX + q.
- `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_ne_minpoly` (non-example): For g>0 the minimal polynomial of [n] is X−n whereas P_[n]=(X−n)^(2g); for g=0 P=1 and trace=0.

Uses: AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module — P_α equals the characteristic polynomial of V_ℓα; AbelianSchemesAndArithmeticModuli:A6/rosati-positivity — the trace form Tr(αα†); AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield — trace and degree through a subfield of End⁰(A); DeligneWeightsAndPurity:DWP.1 — the characteristic polynomial of Frobenius in the Weil estimate; FaltingsFinitenessAndIsogenyTheorems:R28.1 — characteristic polynomials of Frobenius and isogeny classes.

Acceptance: P_{[n]} = (X − n)^{2g} and Tr [n] = 2gn. For the Frobenius π of an elliptic curve over 𝔽_q: P_π = X² − aX + q with a = q + 1 − #E(𝔽_q).

### The endomorphism algebra End⁰(A) is semisimple

**Target:** `A6/endomorphism-algebra-is-semisimple` (theorem).

Let A be an abelian variety over a field k, isogenous to A_1^{n_1} × … × A_r^{n_r} with the A_i simple and pairwise non-isogenous. Then End⁰(A) ≅ ∏_i M_{n_i}(D_i), with D_i = End⁰(A_i) a division algebra of finite dimension over ℚ. So End⁰(A) is a finite-dimensional semisimple ℚ-algebra. Moreover End(Aⁿ) = M_n(End(A)), and End(A × B) is the ring of matrices [[End(A), Hom(B, A)], [Hom(A, B), End(B)]], compatibly with T_ℓ.

Hypotheses: Semisimplicity is of End⁰(A), not of End(A), which is an order..

Proof route: An isogeny A → ∏ A_i^{n_i} induces End⁰(A) ≅ End⁰(∏ A_i^{n_i}). End⁰(∏ A_i^{n_i}) = ∏ M_{n_i}(D_i), since Hom⁰(A_i, A_j) = 0 for i ≠ j and End⁰(A_i^{n}) = M_n(D_i). A finite product of matrix algebras over division rings is semisimple (mathlib:isSemisimpleRing_iff_pi_matrix_divisionRing). Finite dimension over ℚ comes from the theorem hom-is-free-of-finite-rank. Block decompositions: the product's universal property (tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.prod) and T_ℓ(A × B) = T_ℓA ⊕ T_ℓB.

Inputs: `A6/poincare-complete-reducibility`, `A6/endomorphisms-of-simple-abelian-varieties`, `A6/hom-is-free-of-finite-rank`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.prod`, `mathlib:isSemisimpleRing_iff_pi_matrix_divisionRing`.

Sources: milne-abelian-varieties — §10, p. 43 (End⁰(A) ≅ ∏ M_{n_i}(D_i), and it is finite-dimensional.).

Acceptance: End⁰(E × E′) = ℚ × ℚ for non-isogenous elliptic curves without CM; End⁰(E × E) = M_2(ℚ). For a CM elliptic curve E with End⁰(E) = K imaginary quadratic: End⁰(E²) = M_2(K).


### Néron–Severi finiteness

**Target:** `A6/neron-severi-rank` (theorem).

For a field abelian variety, NS(A)=Pic(A)/Pic⁰(A) defined through the Mumford-map kernel is torsion free of finite rank at most 4g², by its injection into Hom(A,A∨). The geometric NS group is computed after kbar base change; its Galois invariants are not identified with NS(A) without an actual line-descent statement. Thus ρ(A)=rank NS(A_kbar) is finite and at most 4g²; ρ(E)=1. For a characteristic-zero geometric elliptic E with End(E)=Z, the symmetric 2×2 rational endomorphism matrices give ρ(E²)=3.

Proof route: Inject NS into finite free Hom using φ and take its subgroup lattice. Separate geometric classes from rational line bundles and retain the possible descent obstruction.

Inputs: `AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A2/rational-ns-and-ample-cone`.

Sources: conrad-polarizations — Lemma 2.3, pp.6–7 (The kernel of φ is the degree-zero Picard group.); milne-2022 — Corollary 12.8, p.22 (The Mumford-map injection gives NS finiteness. The elliptic-square value follows from the separate rational symmetric-Hom comparison.).

Acceptance: Pic⁰ classes vanish; for an elliptic curve over kbar NS has rank one.

### Coefficient Hom, quasi-isogenies and unit schemes

**Target:** `A6/coefficient-hom-and-units` (construction).

For field abelian varieties define Hom⁰(A,B)=Q⊗Z Hom(A,B), End⁰(A)=Hom⁰(A,A). For a commutative Q-algebra R use R⊗Q Hom⁰, with bilinear composition and two-sided inverses defining R-isogenies. The Hom functor is the affine Q-space Spec Sym(Hom⁰*); End⁰ units are the determinant-open locus for left multiplication, forming Aut_Q(A). R changes coefficients, not the geometric base field of A.

Proof route: Rationalize the existing additive Hom groups and composition; finite rank makes the coefficient spaces finite-dimensional. Represent them by symmetric algebras of duals and use determinant invertibility of multiplication to represent units. In a finite-dimensional algebra left-multiplication invertibility is equivalent to a two-sided unit.

Inputs: `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End`.

Sources: kmps22 — §2.1.3, pp.20–21; §2.3.1, pp.30–31 (Rational quasi-endomorphism groups and coefficient-Hom spaces are distinct from geometric scalar extension.).

API outline:

- `CoefficientHom.points` (universal-property): Hom_Q(A,B)(R)≅R⊗Q Hom⁰(A,B).
- `CoefficientHom.id` (constructor): Tensor the native identity; composition and coefficient base change preserve it.
- `CoefficientHom.comp` (functoriality): Composition is bilinear and compatible with coefficient maps.
- `CoefficientHom.units` (characterisation): Aut_Q(A)(R) is the two-sided unit group of R⊗End⁰(A).
- `CoefficientHom.baseChange` (functoriality): R→R′ extends coefficients and preserves identities and inverses.

Unit tests:

- `CoefficientHom.scalar_isogeny` (computation): For nonzero A, multiplication by 2 is a rational unit with inverse id/2.
- `CoefficientHom.dual_numbers` (computation): Over Q[ε]/ε², (1+ε)id has inverse (1−ε)id.
- `CoefficientHom.zero` (non-example): Zero is not a unit when A has positive dimension.
- `CoefficientHom.not_field_extension` (non-example): An R-coefficient point for nonfield R does not change A into an abelian variety over R.

Uses: KMPS T01 and T26 — Represent coefficient isogenies and automorphisms.; Kisin–Pappas §4.4.5 — Restrict coefficients to intermediate localizations of Z..

Acceptance: For g=0 the zero algebra has a singleton unit group under its zero-ring convention.

### Relative Hom and normal-base extension

**Target:** `A6/relative-hom-and-normal-extension` (theorem).

For abelian schemes A,B/S, the Hom functor is an unramified separated algebraic space, locally of finite type, a disjoint union of finite unramified S-schemes (the bounded graph components); it is not globally finite type. It is rigid under nilpotent thickenings and embeds under specialization at a geometric point when S is connected locally noetherian. If S is locally noetherian normal and U⊂S is dense open, Hom_S(A,B)→Hom_U(A_U,B_U) is an isomorphism. For a smooth connected complex base, a Hodge homomorphism of one fibre that is invariant under monodromy extends uniquely to the family.

Proof route: Apply the Hilbert/graph representability criterion to group homomorphisms; rigidity removes infinitesimal automorphisms, and proper graphs make each bounded piece finite. Extend a generic graph over codimension-one DVRs using the abelian proper smooth group extension property, then across the normal base by the graph/rigidity theorem. The source states the normal extension theorem but its higher-dimensional proof remains a recorded gap, without an upward Néron-model citation. Use the algebraic monodromy-invariant Hom theorem cited in Gao–Habegger, via the fixed-part/relative Hom argument. The analytic family equivalence identifies the resulting map on local systems; relative GAGA over a nonproper base is not asserted to algebraize an arbitrary analytic map. The proof of this algebraic extension is included in G-normal-extension.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-abelian-scheme`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `A5/analytic-families-and-comparison`, `A6/hom-is-free-of-finite-rank`.

Sources: faltings-chai — I.1.7, pp.4–5; I.2.7, pp.9–11 (Hom components are discrete; Hom extends over normal bases.); kisin-pappas — Lemma 4.5.2 proof, p.194 (The normal-base extension is a shared input.); gao-habegger — Lemma 5.6 proof, p.25 (v3) (Monodromy-invariant fibre Hom extends to the complex family.).

Acceptance: Hom(E,E) contains infinitely many [n]; global finite-type/finite claims are false. A jump in a special-fibre endomorphism ring is not a lift of every special homomorphism.


### Full-level descent of homomorphisms

**Target:** `A6/hom-descent-at-full-level` (theorem).

For abelian varieties A,B over k and n≥3 prime to char k, every geometric homomorphism is defined over k(A[n],B[n]). In particular geometric endomorphisms are defined over the n-torsion field. To descend polarizations also include the dual n-torsion pairing and μ_n, rather than assuming the polarization is a chosen rational ample line.

Proof route: The Galois action on the finite free geometric Hom lattice factors through a finite group, since a basis has a common finite field of definition. If σ fixes both n-torsion groups, σf−f kills A[n], so the action on Hom is the identity modulo n by divisibility. The kernel of GL_r(Z)→GL_r(Z/n) has no nontrivial finite-order element for n≥3, proving descent. Apply this to the dual Hom module and use the perfect n-torsion pairing for the dual level data; distinguish morphism descent from line-bundle descent.

Inputs: `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A3/torsion-divisibility`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`.

Sources: tsimerman18 — Lemma 4.1 proof, pp.384–385, citing Silverberg Proposition 2.3 (Full-level descent is shared arithmetic Hom input, not a CM-specific construction.); milne-abelian-varieties — Lemma 14.5, p.63 (The integral congruence root-of-unity argument proves the torsion-free congruence kernel.).

Acceptance: n=2 fails: inversion can act trivially on torsion and nontrivially on a twisted Hom lattice.

### P_α is the characteristic polynomial of α on V_ℓA, for every ℓ ≠ char k

**Target:** `A6/characteristic-polynomial-on-tate-module` (theorem). **Planet:** ℓ-independence of the characteristic polynomial.

Let A be an abelian variety over a field k, α ∈ End(A), and ℓ ≠ char k. Then P_α(X) = det(X − V_ℓα | V_ℓA), where V_ℓA = T_ℓA ⊗ ℚ_ℓ. Hence Tr α and deg α are the trace and determinant of α on V_ℓA, and the characteristic polynomial of V_ℓα has integer coefficients independent of ℓ. The same holds for α ∈ End⁰(A) with rational coefficients.

Hypotheses: ℓ ≠ char k. For ℓ = p the p-adic Tate module has rank less than 2g in general, and the statement fails..

Proof route: Export the rational-polynomial/Tate determinant identification established in the construction of P_α; its prerequisites precede integrality in that proof. Compare coefficients for trace and degree, and scale by rational denominators for quasi-endomorphisms.

Inputs: `A6/characteristic-polynomial-of-an-endomorphism`, `A4/etale-tate-module`.

Sources: milne-abelian-varieties — §10, Proposition 10.20, p. 50 (P_α is the characteristic polynomial of α on V_ℓA.).

Acceptance: For the Frobenius π of E/𝔽_q and every ℓ ≠ p, the characteristic polynomial of π on V_ℓE is X² − aX + q. For [n], det(X − n | V_ℓA) = (X − n)^{2g} = P_{[n]}.


### Coefficient isogeny torsors

**Target:** `A6/coefficient-isom-torsors` (construction).

The two-sided invertible locus Isog_Q(A,B) in Hom_Q(A,B) is open; it is empty for nonisogenous objects and otherwise a right Aut_Q(A)-torsor under precomposition. For equal-dimensional A,B a coefficient left inverse is a two-sided inverse. Endomorphism compatibility cuts out a rational linear subspace before taking the unit open. If this compatible open is geometrically nonempty it has a rational point, since Q-points are dense in a rational affine space. Polarization equations are quadratic and are not covered by that last argument.

Proof route: Choose a quasi-isogeny when A,B are isogenous and transport the determinant-open from End⁰ A; changes of choice differ by a unit. Use complete reducibility and faithfulness to exclude inverses when the simple multiplicities differ. In equal dimension the Tate matrix determinant turns a one-sided inverse into a two-sided inverse after faithful scalar extension. The equations fι=ι′f are linear; nonvanishing determinant defines a nonempty open. Density gives a rational point.

Inputs: `A6/coefficient-hom-and-units`, `A6/poincare-complete-reducibility`, `A6/hom-to-tate-module-homs-is-injective`.

Sources: kmps22 — §2.3.1, pp.30–31; Remark 2.3.16(3), p.36 (The open-subspace argument is unpolarized and the algebra is semisimple, not necessarily a product of division fields.).

API:

- `CoefficientIsog.open` (constructor): Take the two-sided invertible open in coefficient Hom.
- `CoefficientIsog.action` (data): Use source automorphisms by precomposition.
- `CoefficientIsog.torsor` (characterisation): Two invertible arrows differ by a unique source unit.
- `CoefficientIsog.baseChange` (functoriality): Extend coefficients and preserve the inverse and torsor identities.

Definition tests:

- `CoefficientIsog.self` (compatibility): Isog_Q(A,A)=Aut_Q(A).
- `CoefficientIsog.empty` (non-example): Nonisogenous elliptic curves have empty Isog_Q.
- `CoefficientIsog.dual_numbers` (computation): (1+ε)id is invertible over Q[ε]/ε².
- `CoefficientIsog.dimensions` (non-example): A→A×E cannot be an invertible coefficient arrow for E>0.

Uses: KMPS T26/T42 — Form structured isogeny torsors with the exact rational-point boundary.; A6 real polarized comparison — Add Rosati equations only after the unpolarized carrier..

Acceptance: A split inclusion A→A×B with B>0 has a left inverse but is not an isogeny.


### Localized isogeny categories

**Target:** `A6/localized-isogeny-category` (definition).

For Z⊂D⊂Q a localization, keep the abelian schemes over S as objects and set Hom_D=D⊗Z Hom_S, with extended composition; call the invertible arrows D-isogenies. Aut_D(A)(R)=(End_D(A)⊗D R)× for commutative D-algebras R, on bases where the Hom module is finite projective. Integral, prime-to-p and rational categories are distinct coefficient choices. No geometric field extension is performed.

Proof route: Tensor the additive Hom category with the flat localization D, transport identities, and use the two-sided inverse definition. Over a fixed field, the Hom lattice is finite free and the determinant-open unit scheme gives the coefficient functor. For families retain the locally constant finite-projective hypothesis rather than treating Hom jumps as a vector bundle.

Inputs: `A6/coefficient-hom-and-units`, `A6/relative-hom-and-normal-extension`.

Sources: kisin-pappas — §4.4.5, p.192 (The D-isogeny category and coefficient automorphisms have a common carrier.).

API:

- `LocalizedHom.mk` (constructor): Form D⊗Hom without altering objects.
- `LocalizedHom.comp` (functoriality): Extend bilinear composition and identity.
- `LocalizedHom.unitFunctor` (characterisation): Coefficient automorphisms are the two-sided units.
- `LocalizedHom.extend` (functoriality): A further localization extends every arrow and inverse.

Definition tests:

- `LocalizedHom.integral` (compatibility): D=Z recovers integral Hom.
- `LocalizedHom.prime_to_p` (non-example): [p] is not a Z_(p)-isogeny for g>0, while any [n] with p∤n is invertible.
- `LocalizedHom.rational` (computation): D=Q makes [p] invertible with inverse id/p.

Uses: Kisin §4.1.6; Kisin–Pappas §4.4.5 — Supply the coefficient category on which central torsors act.; Integral PEL consumers — Keep prime-to-p structures distinct from fully rational ones..

Acceptance: For D=Z_(p), [p] is not invertible on a positive-dimensional object.


### CM isotypic comparison

**Target:** `A6/cm-isotypic-boundary` (theorem).

For a complex CM abelian variety, complete reducibility gives a product of powers of pairwise nonisogenous simple CM factors, whose rational endomorphism fields are CM fields; its rational End is the product of the corresponding matrix algebras. Multiplicities and nonisogenous CM types must remain visible: equality of CM fields alone does not identify the simple factors. This is a complex/characteristic-zero CM specialization, not a claim for reductions with enlarged endomorphism rings.

Proof route: Use a commuting semisimple CM algebra of dimension 2g on the rational homology to decompose its rank-one character spaces and their Hodge types. An irreducible polarized CM Hodge summand has a CM field of commuting endomorphisms; conjugate Hodge types determine isogeny only after their type data, not just the abstract field. The exact CM-Hodge classification proof is a retained source gap, not an upward citation to the CM roadmap.

Inputs: `A6/poincare-complete-reducibility`, `A6/endomorphism-algebra-is-semisimple`, `A5/polarized-hodge-equivalence`.

Sources: tsimerman18 — Lemma 4.1 and referenced isotypic CM decompositions, pp.384–385 (The multiplicities and CM-type distinctions are needed in the general orbit argument.).

Acceptance: E^n has M_n(End⁰ E), not a product of n copies of its CM field. A supersingular reduction can have a quaternionic End algebra and is outside this statement.


### Trace and degree through a subfield of End⁰(A); V_ℓA is free over K ⊗ ℚ_ℓ

**Target:** `A6/trace-and-degree-on-a-subfield` (theorem).

For a unital subfield F⊂End⁰ A of degree f, f divides 2g, V_ℓ A is free of rank 2g/f over F⊗Q_ℓ, and Tr(α)=(2g/f)Tr_F/Q(α), deg α=Nm_F/Q(α)^(2g/f). More generally when Q[α] is a product of fields, P_α has the same distinct roots as the characteristic polynomial of multiplication by α on Q[α]; the multiplicities can differ. This does not say the two characteristic polynomials are equal.

Hypotheses: K must share the identity of End⁰(A); a field embedded in a corner eAe has a different identity..

Proof route: V_ℓA is a K ⊗ ℚ_ℓ-module; decompose K ⊗ ℚ_ℓ = ∏ K_λ, so that V_ℓA = ⊕ V_λ. For α generating K, the characteristic polynomial P_α of α on V_ℓA has rational coefficients (theorem characteristic-polynomial-on-tate-module) and is a product of the characteristic polynomials of α on the V_λ. Every monic irreducible rational factor of P_α shares a root with the minimal polynomial of α over ℚ, hence equals it. So P_α is a power of the minimal polynomial, and all V_λ have the same rank over K_λ. The trace and norm formulas follow by taking traces and determinants.

Inputs: `A6/characteristic-polynomial-on-tate-module`, `A6/endomorphism-algebra-is-semisimple`.

Sources: milne-abelian-varieties — §10, Proposition 10.23, p. 52 (V_ℓA is free over K ⊗ ℚ_ℓ of rank 2g/f, with the trace and degree formulas.).

Acceptance: A CM elliptic curve with K = End⁰(E) imaginary quadratic: f = 2 = 2g, V_ℓE free of rank 1 over K ⊗ ℚ_ℓ, and deg(α) = Nm_{K/ℚ}(α). GL₂(K)-type A of dimension [K : ℚ] = g: V_ℓA free of rank 2 over K ⊗ ℚ_ℓ.


### Positivity of the Rosati involution

**Target:** `A6/rosati-positivity` (theorem). **Planet:** Rosati positivity.

Let (A,λ) be a polarized abelian variety over k. On End⁰(A), (α,β)↦Tr(αβ†) is symmetric positive definite, and Tr(αα†)>0 for α≠0. If g=dim A>0 and an ample geometric divisor D represents λ, then for integral α one has Tr(αα†)=(2g/(D^g))(D^(g−1)·α*D). For rational α use an integral multiple and divide the intersection expression by the square of its denominator. At g=0 the endomorphism algebra is zero and positivity is vacuous.

Hypotheses and conventions: The trace calculation is read in Milne 2022, Lemma 17.4, pp.36–37. The required prime-to-characteristic étale exterior cohomology and Chern/intersection comparisons remain explicit prerequisites; their general étale/Hopf inputs are G-etale-exterior. Positive definiteness over ℚ implies it over ℝ: a rational quadratic form that is positive on ℚ^n ∖ 0 is positive semidefinite over ℝ, and its radical is a rational subspace, hence 0.

Proof route: After geometric base change choose ample D representing λ. On exterior Tate cohomology, express cup product with c₁(D) in a symplectic basis adapted to the polarization. The degree-two contraction of c₁(α*D) against c₁(D)^(g−1) equals (D^g)/(2g) times the matrix trace of αα†. This is Milne 2022, Lemma 17.4; invariance makes the basis computation descend. A nonzero integral α pulls back D to a nonzero effective nef class, whose mixed intersection with D is positive. Clear denominators for rational α and polarize the quadratic form. At g=0 End⁰=0, so positivity has no nonzero case.

Inputs: `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `AbelianSchemesAndArithmeticModuli:A4/all-degree-exterior-cohomology`, `SchemeAndStackFoundations:SF.5/chern-projection`, `SchemeAndStackFoundations:SF.5/chern-commutation`.

Sources: milne-2022 — Theorem 17.3 and Lemma 17.4 with proof, pp.35–37 (The read exterior trace calculation gives the intersection identity for positive dimension; it does not remove the prerequisites of that calculation.); conrad-polarizations — Theorem 3.4, pp.9–10 (The geometric trace form is positive definite.).

Acceptance: An elliptic curve with λ principal: α† = α̂, αα† = deg α, and Tr(αα†) = 2 deg α > 0. E with End(E) = ℤ[i]: Tr((a + bi)(a − bi)) = 2(a² + b²).

Recorded proof obligations: `G-etale-exterior`.

### Twists up to localized isogeny

**Target:** `A6/abelian-torsor-twist` (construction).

Let Z/D be flat affine of finite type, P a Z-torsor trivialized over a finite integral torsion-free D-algebra D′, and Z act on A in the D-isogeny category. Define A^P(T)=(A(T)⊗D O_P)^Z as the contracted descent object in the localized category. It is represented up to D-isogeny by an abelian scheme over S, independently of a trivialization. The notation describes coefficient descent of the additive sheaf; it is not a literal tensor product of schemes.

Proof route: After choosing D′, encode the finitely many coefficient equations inside a finite power of A and clear denominators. The resulting rational idempotent cuts out an abelian isogeny factor, using images of homomorphisms/finite quotients; do not assume an arbitrary connected kernel over a nonreduced base is smooth. Use torsor cocycle descent to prove independence and base change. The source’s Moret–Bailly finite-flat trivialization and integral representability argument require an explicit source/proof gap below.

Inputs: `A6/localized-isogeny-category`, `A3/nonaffine-abelian-quotient`, `SchemeAndStackFoundations:SF.1`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-relative-abelian-rigidity`.

Sources: kisin-pappas — §4.4.5 and Lemma 4.4.6, pp.192–193 (The twist is representable up to D-isogeny through finite coefficient descent.).

API:

- `AbelianTwist.mk` (constructor): Construct the localized descent object and a representing abelian scheme.
- `AbelianTwist.trivial` (compatibility): A chosen section of P identifies the twist with A.
- `AbelianTwist.baseChange` (functoriality): Pullback of S and of the torsor commutes with twisting.
- `AbelianTwist.dual` (compatibility): The dual twist uses the contragredient torsor action.

Definition tests:

- `AbelianTwist.trivial_torsor` (degenerate): For P=Z, A^P≅A in the D-isogeny category.
- `AbelianTwist.quadratic` (compatibility): For D=Z and Z={±1}, the construction agrees with the ordinary quadratic twist.
- `AbelianTwist.coefficients` (non-example): A torsor of coefficient automorphisms is not a torsor changing the base field of the abelian scheme.

Uses: Kisin T05–T07 and Kisin–Pappas S18–S20 — Represent central twists with polarizations and realizations.; PELModuli — Import this twisting operation rather than reconstruct it..

Acceptance: The trivial torsor recovers A, with the same localized Hom category.


### Weak localized polarizations

**Target:** `A6/weak-localized-polarization` (definition).

For D⊂Q a localization, a weak D-polarization is a D-polarization class under multiplication by positive units in D. A D-polarization is a symmetric D-isogeny A→A∨ some positive integer multiple of which is an integral polarization. This definition records a positive ray, not equality up to every signed unit; its pullbacks and twists preserve positivity.

Proof route: Clear denominators and use the positive cone to make the definition independent of a chosen positive multiple. Quotient by positive units, prove the equivalence relation and transport pullbacks.

Inputs: `A6/localized-isogeny-category`, `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarization`, `A2/rational-ns-and-ample-cone`.

Sources: kisin-pappas — §4.4.7, p.193 (Weak polarizations retain positivity of the unit ratio.).

API:

- `WeakDPolarization.mk` (constructor): Map a D-polarization to its positive-unit class.
- `WeakDPolarization.eq_iff` (characterisation): Two representatives agree exactly by a positive D-unit ratio.
- `WeakDPolarization.pullback` (functoriality): Pull back through a D-isogeny.
- `WeakDPolarization.integral` (compatibility): An integral polarization defines its weak D-class.

Definition tests:

- `WeakDPolarization.positive_scalar` (computation): For D=Q, λ and 2λ have the same weak class.
- `WeakDPolarization.negative_scalar` (non-example): For positive-dimensional A, −λ is not a positive weak representative.
- `WeakDPolarization.integral_units` (compatibility): For D=Z the only positive unit is one, so equality of weak representatives is equality of polarizations.

Uses: Kisin–Pappas S20 — Descend character-compatible central twists.; Kisin twisted level — Retain the allowed positive scalar ambiguity..

Acceptance: Negative λ does not represent the same weak polarization for g>0.


### Automorphism groups of polarized abelian varieties are finite, and rigid at level n ≥ 3 prime to p

**Target:** `A6/automorphisms-of-polarized-abelian-varieties` (comparison).

Supply the arithmetic proof and field compatibility of the already-owned R09.4 polarized-automorphism theorem: Aut(A,λ) is finite, and its action on A[n] is faithful for n≥3 prime to char k. Relative representability/unramifiedness is imported from R09.4; do not construct a second automorphism functor.

Hypotheses and conventions: (ii) needs char k ∤ n, or trivial action on the finite group scheme A[n]. The source states it for all n ≥ 3 with trivial action on A_n(k^al), which is false when char k divides n: a supersingular elliptic curve E over 𝔽̄_2 has E[4](k̄) = 0 and 24 automorphisms, all preserving the principal polarization (recorded in sourceIssues). In the source's proof of (a), the compact set is {α ∈ End(A) ⊗ ℝ : Tr(αα†) = 2g}, not End(A) ⊗ ℝ (sourceIssues). In the source's proof of (b), the contradiction needs β†β to be nilpotent. This holds because β and β† commute, since α† = α⁻¹ (sourceIssues).

Proof route: (i): α ∈ Aut(A, λ) iff α†α = 1. Then Tr(αα†) = 2g, so α lies in End(A) ∩ {Tr(xx†) = 2g}, the intersection of a lattice (theorem hom-is-free-of-finite-rank) with an ellipsoid (theorem rosati-positivity), which is finite. (ii): α − 1 kills A[n], which is étale since char k ∤ n, so α − 1 = nβ with β ∈ End(A) (theorem hom-to-tate-module-homs-is-injective). The eigenvalues of α on V_ℓA are roots of unity (α has finite order by (i)) of the form 1 + nπ with π an algebraic integer (theorem characteristic-polynomial-on-tate-module). For n ≥ 3, a root of unity ζ ≠ 1 of that form would give, after passing to a primitive p-th root, ±p = n^{p−1}N(π), impossible. So α is unipotent and β is nilpotent. β† = (α⁻¹ − 1)/n commutes with β, so β†β is nilpotent and Tr(β†β) = 0. Rosati positivity forces β = 0, so α = 1.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.4/arith-polarized-automorphism-rigidity`, `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A3/torsion-divisibility`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`.

Sources: milne-abelian-varieties — Proposition 14.4, p.62, and Lemma 14.5, p.63 (The corrected prime-to-characteristic statement follows from lattice compactness and the integral congruence argument.).

Acceptance: An elliptic curve with j = 1728 over ℂ: Aut(E, λ) = μ₄, finite, and [i] acts nontrivially on E[3]. The counterexample to the source's version of (ii): supersingular E over 𝔽̄_2, n = 4: E[4](k̄) = 0, and Aut(E) ≠ 1.

### Geometric and reduced traces

**Target:** `A6/reduced-trace-comparison` (theorem).

For simple A of dimension g with D=End⁰ A, centre F of degree e and dim_F D=m², the geometric trace on D is (2g/(em))Trd_(D/Q). For product matrix factors it is the sum of the corresponding factor traces with the actual multiplicities. A positive involution on a CM-field factor restricts to complex conjugation; the assertion presupposes that the factor is a CM field, not that every centre is CM.

Proof route: Extend to a splitting field and write the faithful realization as a sum of standard m-dimensional matrix modules. Rationality makes the embedding multiplicities equal, and the total dimension fixes 2g/(em). On a CM field, positivity excludes any involution other than conjugation by the real trace pairing. This is a conditional CM-factor statement and does not prove a CM classification.

Inputs: `A6/trace-and-degree-on-a-subfield`, `A6/endomorphism-algebra-is-semisimple`, `A6/rosati-positivity`.

Sources: lipnowski-tsimerman — Remark 4.8, p.18; §4.5 before Proposition 4.16, pp.21–22 (The geometric trace requires the multiplicity factor omitted by an unweighted reduced trace.).

Acceptance: For a simple non-CM elliptic curve D=Q, geometric trace of 1 is 2 although reduced trace is 1. For a simple CM elliptic curve D=F, e=2,m=1 and the factor is one.


### Real isometries and polarized torsors

**Target:** `A6/real-isometries-and-polarized-torsors` (theorem).

For a polarization, {u∈End⁰_R×:u†u=1} is compact; the positive-similitude group modulo R× is compact. Any nonempty coefficient isogeny torsor respecting two polarizations up to positive scalar is trivial over R: from an isogeny f, adjust by the inverse positive square root of f†f. Extra endomorphism data is permitted only when the adjoint/square-root operator commutes with it, as ensured by compatible positive involutions.

Proof route: The positive Rosati form gives a faithful real orthogonal action; the unitary equations define a closed bounded subgroup. Normalize a positive similitude by its scalar square root. Given f, take a positive square root in the real semisimple *-algebra and replace f by f(f†f)^−1/2. Check commutation with structural endomorphisms before making a structured assertion.

Inputs: `A6/coefficient-isom-torsors`, `A6/rosati-positivity`, `A2/rational-ns-and-ample-cone`.

Sources: kmps22 — §2.1.3, pp.20–21; Lemma 2.3.13 proof, p.35 (The real obstruction vanishes by positivity, independently of rational triviality.).

Acceptance: For E^n without CM recover O(n) and positive symmetric square roots. Real triviality does not imply a Q-rational polarization-preserving isogeny.


### Frobenius semisimplicity

**Target:** `A6/frobenius-semisimplicity` (theorem).

For A/F_q, q-Frobenius π is central in End⁰_(Fq)(A), π†π=q, and Q[π] is a product of number fields. It and its powers act semisimply on V_ℓ A for ℓ≠p; any faithful characteristic-zero realization carrying the same End⁰ action has the same conclusion. Compatibility with a future Dieudonné realization is an export, not a construction of that realization here.

Proof route: Over F_q all endomorphisms commute with Frobenius. Its adjoint is Verschiebung and their composite is [q]. The centre of a finite-dimensional semisimple Q-algebra is a product of number fields. The subalgebra Q[π] is therefore reduced and separable; its representations are semisimple.

Inputs: `A6/endomorphism-algebra-is-semisimple`, `A6/rosati-positivity`, `A6/characteristic-polynomial-on-tate-module`.

Sources: milne-2022 — §19, pp.40–42 (The finite-field Frobenius/Verschiebung relation supplies π†π=q.); kmps22 — §2.1.5–2.1.7, pp.22–23 (The cited realization semisimplicity follows from the central semisimple subalgebra.).

Acceptance: Centrality is over F_q; geometric endomorphisms defined only after extension need not commute with π.


### Structured twist exports

**Target:** `A6/twist-realizations-polarizations-and-level` (theorem).

An additive D-linear realization F commuting with finite sums and the defining idempotent images obeys F(A^P)≅F(A)^P; this applies to the integral prime-to-denominator Tate systems and relative de Rham bundles, with their functorial structures. A weak D-polarization is a polarization ray under totally positive D× scalar ratios. If the Z-action transforms λ by a positive character, it descends to a weak polarization of the twist. Twisted adelic level is the transported orbit: under a trivialization g it changes by conjugation of both the level subgroup K and the Z-action.

Proof route: Apply F to the finite-power/idempotent presentation and the torsor cocycle. Prove exactness assumptions for each listed realization rather than claiming all functors commute with invariants. The character-compatible pairing descends; positivity is detected on geometric fibres and survives positive scalar changes. Transport the level orbit through the same trivialization and compute the simultaneous conjugation. No unmodified Z-action is retained after changing frames.

Inputs: `AbelianSchemesAndArithmeticModuli:A6/abelian-torsor-twist`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `AbelianSchemesAndArithmeticModuli:A4/abelian-h1-de-rham`, `AbelianSchemesAndArithmeticModuli:A2/rational-ns-and-ample-cone`, `AbelianSchemesAndArithmeticModuli:A6/weak-localized-polarization`.

Sources: kisin-pappas — §4.4.7 and Lemma 4.4.8, p.193 (Weak polarizations and the character-compatible twist are the same central descent construction.); kisin17 — §§4.1.6–4.1.8, including Lemma 4.1.7, author PDF pp.69–70 (Additive realizations and the adelic level orbit are transported with the twist; source comparison uses KP’s cited restatement.).

Acceptance: For a quadratic twist Tate representations tensor with the quadratic character. The de Rham comparison transports filtration and connection, not only the underlying rank.

### Matsusaka–Morikawa endomorphism

**Target:** `A6/morikawa-endomorphism` (construction).

For ample H on A and a curve C generating A, let ν:Jac(C̃)→A be its normalized map and λ_J the canonical principal Jacobian polarization. Define α=ν λ_J^−1 ν∨ λ_H∈End A, the positive adjoint product. This agrees with the positive intersection-sum Morikawa convention; a convention using t_x* instead of translate-by-x needs its sign corrected. It is λ_H-Rosati symmetric and positive, has Tr α=2(C·H), and P_α=Q² with Q monic integral of degree g and all roots positive real.

Proof route: Compare the intersection-sum construction with the Jacobian pull-push map using the universal divisor and Poincaré bundle, fixing the sign by the elliptic example. Adjointness expresses α as f f† up to the polarization comparison; surjectivity of ν gives positive definiteness. The trace intersection formula follows by restricting the first Chern class to the curve. On the symplectic Tate space a Rosati-symmetric operator has even characteristic multiplicities; its rational characteristic polynomial is a square. Its integral monic square root has integral coefficients. Positivity of the real *-algebra gives positive roots.

Inputs: `A6/curve-generated-subvariety`, `A2/rosati-involution`, `A6/rosati-positivity`, `A6/characteristic-polynomial-on-tate-module`, `SchemeAndStackFoundations:SF.5/chern-projection`.

Sources: caro-pasten — Equation (5.1), Lemma 5.2 and proof, pp.16–17 (The trace and positive-square polynomial are the needed Morikawa consequences.).

API:

- `Morikawa.mk` (constructor): Form ν λ_J^−1 ν∨ λ_H with the positive sign.
- `Morikawa.selfAdjoint` (characterisation): The endomorphism is Rosati symmetric.
- `Morikawa.trace` (compatibility): Its geometric trace is 2(C·H).
- `Morikawa.squarePolynomial` (data): Return the monic integral degree-g Q with P_α=Q².

Definition tests:

- `Morikawa.elliptic` (computation): For C=E and H of degree d>0, α=[d] and Q=X−d.
- `Morikawa.nongenerating` (non-example): For C=E×0⊂E², the adjoint product has a zero eigenvalue, so strict positivity needs generation.
- `Morikawa.sign` (non-example): The negative adjoint product has negative elliptic eigenvalues and fails the positive-root assertion.

Uses: Caro–Pasten Lemma 5.2 — Control degree/trace and positive roots without an accidental translation sign.; A6 geometric trace — Test the characteristic polynomial against a geometric correspondence..

Acceptance: For C=A=E and deg H=d, α=[d], Tr α=2d and P=(X−d)².


### Polarization orbits and elliptic-power tests

**Target:** `A6/polarization-orbits` (theorem).

Fix a principal λ₀ over kbar. Principal polarizations correspond to integral Rosati-symmetric positive units s=λ₀^−1λ; isomorphism classes are the congruence orbits s↦u†su for u∈End(A)×. For E^n with End(E)=Z this is the GL_n(Z)-congruence action on positive-definite integral symmetric unimodular matrices. For a simple maximal CM-order case the principal classes relative to λ₀ are totally positive units in the real suborder modulo u·conj(u). These examples require the stated endomorphism order and an existing principal λ₀.

Proof route: Use the integral inverse of λ₀ to identify Hom(A,A∨) with End A and transport positivity and pullback. Degree one is exactly the unit condition; the pullback formula is conjugation by u. Specialize to matrix transpose or CM conjugation.

Inputs: `A2/rational-ns-and-ample-cone`, `A6/reduced-trace-comparison`, `A6/degree-formulas-for-polarized-isogenies`.

Sources: lipnowski-tsimerman — Proposition 4.11 and Examples 4.12–4.13, pp.19–20 (The orbit and order hypotheses are essential.).

Acceptance: On E² the identity matrix gives the product principal polarization. 2I is ample but has degree 16 in dimension two and is not principal.


## Routed-source coverage

Every one of the 102 routed items is accounted for in the packet’s consumerCoverage table. The following groups describe what each source receives; results outside the abelian boundary remain consumer statements.

- **PAPER-BOXER-PILLONI-26** (1 items): `A4/ordinary-frobenius-and-weighted-polarization`, `A4/ordinary-serre-tate-coordinates`.
- **PAPER-BOXER-CALEGARI-GEE-PILLONI-25** (6 items): `A3/genus-two-two-torsion`, `A4/genus-two-jacobian-lifting`, `A4/odd-prime-finite-level-lifting`, `A4/ordinary-dyadic-finite-level-lifting`, `A4/realization-conventions`.
- **PAPER-KISIN-17** (4 items): `A6/abelian-torsor-twist`, `A6/relative-hom-and-normal-extension`, `A6/twist-realizations-polarizations-and-level`.
- **PAPER-TSIMERMAN-18** (3 items): `A3/dual-isogeny-and-cartier-kernel`, `A3/polarized-weil-pairing`, `A6/cm-isotypic-boundary`, `A6/hom-descent-at-full-level`.
- **PAPER-YUAN-26** (2 items): `A1/relative-cube-and-power`.
- **PAPER-VANHOFTEN-24** (2 items): `A3/nonaffine-abelian-quotient`, `A4/serre-tate-equivalence`.
- **PAPER-XIE-YUAN-22** (8 items): `A1/relative-cube-and-power`, `A1/relative-seesaw`, `A1/torsion-restriction-of-rigidified-lines`, `A2/nef-normalized-lines-over-curves`, `A2/projective-presentation-over-normal-bases`, `A3/multiplication-and-density`.
- **PAPER-GAO-GE-KUHNE-26** (8 items): `A1/relative-cube-and-power`, `A2/ample-cohomology-and-degree`, `A2/mumford-map-and-biextension`, `A2/polarization-representatives-and-graph`, `A2/polarization-type-and-pfaffian`, `A2/principal-quotient-and-spreading`, `A5/appell-humbert-and-algebraicity`.
- **PAPER-CHARLES-16** (1 items): `A5/polarized-hodge-equivalence`.
- **PAPER-FARB-KISIN-WOLFSON-24** (2 items): `A3/multiplication-and-density`, `A3/relative-isogeny`, `A4/all-degree-exterior-cohomology`.
- **PAPER-KISIN-PAPPAS-18** (8 items): `A4/grothendieck-messing`, `A4/serre-tate-equivalence`, `A6/abelian-torsor-twist`, `A6/localized-isogeny-category`, `A6/relative-hom-and-normal-extension`, `A6/twist-realizations-polarizations-and-level`, `A6/weak-localized-polarization`.
- **PAPER-GAO-HABEGGER-19** (3 items): `A2/projective-presentation-over-normal-bases`, `A6/relative-hom-and-normal-extension`.
- **PAPER-PILLONI-20** (1 items): `A4/ordinary-frobenius-and-weighted-polarization`, `A4/ordinary-serre-tate-coordinates`.
- **PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26** (3 items): `A6/quadratic-twists-and-restriction`.
- **PAPER-CARO-PASTEN-23** (11 items): `A1/relative-invariant-forms`, `A2/ample-cohomology-and-degree`, `A2/divisor-ample-criterion`, `A2/polarization-representatives-and-graph`, `A3/dual-isogeny-and-cartier-kernel`, `A3/relative-isogeny`, `A6/characteristic-polynomial-of-an-endomorphism`, `A6/curve-generated-subvariety`, `A6/degree-formulas-for-polarized-isogenies`, `A6/morikawa-endomorphism`.
- **PAPER-LIPNOWSKI-TSIMERMAN-18** (26 items): `A2/ample-cohomology-and-degree`, `A2/mumford-map-and-biextension`, `A2/normalized-poincare-comparison`, `A2/polarization-representatives-and-graph`, `A2/rational-ns-and-ample-cone`, `A2/rosati-involution`, `A3/torsion-divisibility`, `A4/etale-tate-module`, `A6/characteristic-polynomial-of-an-endomorphism`, `A6/coefficient-hom-and-units`, `A6/endomorphism-algebra-is-semisimple`, `A6/poincare-complete-reducibility`, `A6/polarization-orbits`, `A6/reduced-trace-comparison`, `A6/rosati-positivity`.
- **PAPER-ANSCHUTZ-LEBRAS-23** (1 items): `A4/all-degree-exterior-cohomology`.
- **PAPER-BOXER-CALEGARI-GEE-PILLONI-21** (1 items): `A4/ordinary-frobenius-and-weighted-polarization`, `A4/ordinary-serre-tate-coordinates`.
- **PAPER-DIMITROV-GAO-HABEGGER-21** (3 items): `A2/principal-quotient-and-spreading`, `A2/projective-presentation-over-normal-bases`.
- **PAPER-BRESCIANI-24** (1 items): `A0/field-and-elliptic-boundary`.
- **PAPER-KISIN-MADAPUSIPERA-SHIN-22** (7 items): `A6/characteristic-polynomial-on-tate-module`, `A6/coefficient-hom-and-units`, `A6/coefficient-isom-torsors`, `A6/frobenius-semisimplicity`, `A6/real-isometries-and-polarized-torsors`.

The ordinary formal torus applies only at points ordinary at the prime in question; BCGP21’s p-rank-one local calculation is not supplied by an ordinary theorem. Igusa actions and the Siegel level square belong to the corresponding moduli/Igusa consumers. The BCGP25 Hodge–Tate/Sen convention needs its higher p-adic comparison. The characteristic-p Dieudonné adapter for detecting p-denominators remains with the integral-classification owner: A3’s all-prime integrality criterion instead uses the actual finite-flat kernel. Kisin’s centre action on an integral Shimura universal family uses A6 twisting, but is not a new abelian theorem here.


## Proof and source obligations

These are explicit proof obligations of the finished planning pass. A source statement and an omitted suggested signature do not prove them.

### G-picard-dual: Relative Pic⁰ representability verification

R09.4 arith-relative-dual is the precise carrier owner and itself retains its general-base dual proof obligation. Verify all A0-extension Pic⁰/rigidification conditions and its Raynaud passage, rather than importing a completed implementation. Affected targets: `A2/normalized-poincare-comparison`.

### G-exterior: All-degree abelian cohomology proof

Anschütz–Le Bras v4 Proposition 4.5.1 p.53 assumes a bounded prism and the p-adic completion of an abelian scheme over its quotient; its proof cites BBM II 2.5.2. BBM is neither publicly accessible in the permitted sources nor cleared, and was not read. Faltings–Chai VI.2 pp.207–210 proves an exterior coherent calculation for a particular compactified moduli construction. Neither inspected passage by itself proves the arbitrary-base coherent/de Rham target. Verify local freeness, universal base change, filtration degeneracy and square-zero multiplication in characteristic two over every S. The separate prime-to-characteristic étale proof input is G-etale-exterior. Affected targets: `A4/all-degree-exterior-cohomology`.

### G-pd: Degree-one PD evaluation and lifting proof

Faltings–Chai I.3 states the locally PD-nilpotent theorem, referring to Messing for the universal-vector-extension proof. The construction and categorical lifting proof have not been checked from a cleared primary source. The degree-one evaluation and abelian filtration equivalence move down together; no general crystalline/Dieudonné classification is asserted. Affected targets: `A4/pd-first-cohomology`, `A4/grothendieck-messing`.

### G-odd-level: Odd-prime truncated polarized BT lifting

BCGP25 Lemma 9.3.4 needs Wedhorn (2.17) for a compatible principally quasi-polarized BT₁ lift. Its proof and finite-flat BT₁ criterion have not been read. A[p] has order p⁴, not rank four; preserving that correction does not establish the lifting theorem. Affected targets: `A4/odd-prime-finite-level-lifting`.

### G-dyadic: Ordinary dyadic finite-level descent

Complete the comparison of skew self-dual ordinary finite-flat extensions with the symmetric formal-torus quotient by squares, including Frobenius descent and formal smoothness over every O/π^n. BCGP25 pp.217–218 supplies the alternate proof route. A classifying-space presentation cannot be treated as an established native object; no averaging by 2 or unrestricted nonordinary lift is used. Affected targets: `A4/ordinary-dyadic-finite-level-lifting`.

### G-family: Relative polarized analytic equivalence

Prove local exponential/lattice descent and the relative horizontal Betti/de Rham comparison; the read analytic notes give the point theorem and Faltings–Chai I.6 the universal Siegel model. These alone are not a full proof for every analytic base. Affected targets: `A5/analytic-families-and-comparison`.

### G-appell: Appell–Humbert and theta separation proof

The public Stanford notes Theorem 1.17 cite the full Appell–Humbert proof and Theorem 1.18 sketches cubic theta products. Supply the factors-of-automorphy classification and tangent/point separation details from an accessible primary proof. Affected targets: `A5/appell-humbert-and-algebraicity`.

### G-normal-extension: Higher-dimensional normal-base Hom extension

Faltings–Chai I.2.7 states extension over a locally noetherian normal base, with reduction to the abelian extension theorem. A full graph/extension proof across codimension at least two is required; codimension-one properness alone does not prove it. Do not cite higher-tier NéronModels. Also verify the algebraic monodromy-invariant fibre-Hom extension theorem used in Gao–Habegger, Lemma 5.6 p.25; the analytic family equivalence alone supplies no general algebraization of analytic maps over a nonproper base. Affected targets: `A6/relative-hom-and-normal-extension`.

### G-twist: Localized torsor twist representability

Kisin–Pappas Lemma 4.4.6 reduces representability to finite integral torsor trivialization (Moret–Bailly) and a kernel/isogeny-factor argument. Verify that finite coefficient descent yields a smooth abelian factor over general bases; arbitrary connected kernels cannot simply be declared smooth. Affected targets: `A6/abelian-torsor-twist`.

### G-cm: CM Hodge factor classification

Check the rank-one CM-character Hodge decomposition and its simple-factor endomorphism-field statement from the primary CM references of Tsimerman. Complete reducibility alone proves matrix factors but not that their division algebras are CM fields. Affected targets: `A6/cm-isotypic-boundary`.

### G-projective-normality: Projective normality and normal-base ample extension

Read Faltings–Chai I.1.10(a) gives projectivity on a noetherian normal base; Gao–Habegger §2.2 and DGH Remark 3.1 use stronger chosen-generic-line extension and projective normality of L^n (n≥3, respectively n≥4). Their Koizumi/Mumford/Raynaud proof sources have not been checked here. Supply the section-multiplication proof and the prescribed symmetric-line extension, rather than deriving them from projectivity alone. Affected targets: `A2/projective-presentation-over-normal-bases`.

### G-theta-principal: Theta splitting and prescribed-line principal quotient

Verify existence of a maximal isotropic finite subgroup scheme with a splitting of the restricted theta extension, including inseparable kernels, and descent of the prescribed ample L. Conrad §3 p.9 states principal isogeny existence but delegates the proof; Faltings–Chai I.5 p.25 defines the theta group. Neither inspected passage proves this stronger line-descending construction. Spreading uses a finite, possibly inseparable, field of definition; étale spreading needs separable descent. Affected targets: `A2/principal-quotient-and-spreading`.

### G-vector-extension: Universal Ext classification and de Rham comparison

Maculan §2.7 pp.12–13 supplies the construction and universal property but cites Mazur–Messing Proposition 1.10 for the essential Ext isomorphism; that uncleared book was not read. Verify that classification over arbitrary bases and the Poincaré-connection comparison ω_E(A)=H¹_dR(A/S), with base change and filtration. Illusie §4.2(iv) p.17 states the Lie-dual convention. These precise proof obligations are not established by the inspected statements. Affected targets: `A4/universal-vector-extension`, `A4/abelian-h1-de-rham`.

### G-etale-exterior: Étale exterior-algebra proof inputs

Milne 2022 Theorem 15.1 and Lemma 15.2 pp.27–28 give the Hopf-algebra and integral-reduction proof. Supply its nonroutine general étale Künneth/cohomological-dimension contracts and the bounded connected graded Hopf-algebra structure theorem, or use a justified smooth proper lifting/comparison argument. The complex-comparison supplier alone only proves the characteristic-zero case. Affected targets: `A4/all-degree-exterior-cohomology`, `A6/rosati-positivity`.

### G-abelian-image: Abelian images over the original field

Prove that the scheme-theoretic image of a field abelian homomorphism is an abelian subvariety over that field, with field-extension compatibility and the universal factorization. The current JacobianChallenge Layer E does not name this theorem. In particular establish geometric reducedness/smoothness over imperfect fields, by flat base change of the proper scheme image and smoothness of reduced finite-type group schemes over perfect fields, before using integral projector images. This is a field theorem; arbitrary-base connected kernels are not declared smooth. Affected targets: `A6/poincare-complete-reducibility`, `A6/endomorphisms-of-simple-abelian-varieties`, `A6/curve-generated-subvariety`.

## Supplier contracts

Imported blueprint nodes retain their source hypotheses. Each stage contract describes the exact additional interface requested.

- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-e-abelian-varieties`: Import the field abelian-variety carrier, Hom/End, products, multiplication, cube/square, dual and polarization interfaces of Layer E. The pinned implemented field carrier is cited separately. Neither abelian scheme images over imperfect fields nor general relative abelian geometry is claimed from this layer; G-abelian-image supplies the missing field-image obligation.
- `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`: Import the existing elliptic scheme group law and functorial zero/addition; use its dimension-one specialization to compare the imported general relative carrier.
- `tauceti:TauCetiRoadmap/ModularCurves#2d-picard-duality-and-comparison-of-the-duals`: Import the rigidified elliptic Pic⁰/Poincaré and dual-comparison maps. Match φ_L(a)=t_a*L⊗L⁻¹ explicitly: for O(0) the positive self-duality sends a to O([−a]−[0]).
- `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality`: Import general-base finite locally free commutative group schemes and Cartier-dual gluing/base change. The pinned affine Cartier-dual base-change equivalence is cited separately; nonaffine abelian quotients are constructed here.
- `AlgebraicModuliForArithmeticGeometry:R09.1`: Projective embeddings, relative ampleness after a base twist, coherent section multiplication and symmetric-algebra affine representability.
- `SchemeAndStackFoundations:SF.5`: Intersection positivity for a nonzero effective class against an ample (g−1)-fold intersection, and relative-to-absolute nef/ampleness criteria.
- `SchemeAndStackFoundations:SF.1`: General effective fppf descent for schemes, invertible sheaves and free finite-flat quotients as algebraic spaces.
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`: Import the rigidified relative Jacobian and the pointed smooth-curve Albanese universal property from Layer D. For a singular curve first normalize and choose a point of its normalization; this contract does not supply general abelian-scheme Pic⁰ representability.
- `AlgebraicModuliForArithmeticGeometry:R09.6`: Proper-flat cohomology and arbitrary coherent base change after the required local-freeness/rank hypotheses; no curve-only shortcut.
- `SchemeAndStackFoundations:SF.3`: Relative differentials, Lie/tangent duality and the bounded de Rham complex.
- `SchemeAndStackFoundations:SF.4`: Grothendieck existence and formal full faithfulness for proper schemes with a compatible ample line over a complete noetherian local base, in arbitrary dimension. Existing curve effectivity does not supply this.
- `ComplexComparisonPartII:C4`: Chow algebraization of closed analytic projective subspaces and algebraization of proper morphisms, used after the theta embedding.
- `AlgebraicModuliForArithmeticGeometry:R09.3`: Represent Hom and free finite-flat equivalence-relation quotients by algebraic spaces; retain the relative restriction-of-scalars contracts.
- `AlgebraicModuliForArithmeticGeometry:R09.4`: Import the existing native-type plan for general abelian schemes, dual/Poincaré data, polarizations, local ample representatives and full level; inspect its retained proof gaps.
- `AlgebraicModuliForArithmeticGeometry:R09.2`: Represent group-homomorphism graphs by the Hilbert functor with the proper-flat finite-presentation hypotheses.
- `AlgebraicModuliForArithmeticGeometry:R09.5`: Artin representability with its deformation/effectivity conditions for the abelian Picard application.
- `tauceti:TauCetiRoadmap/ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes`: Use the native relative genus-one Weierstrass/pole-sheaf equivalence, preserving the pointed smooth proper curve over arbitrary bases.

Current upstream import, absent from the atlas snapshot: **AlgebraicVectorBundles L0B/L0C/L2A/L2B** supplies finite locally free sheaves, duals, exterior powers, determinants, arbitrary pullback and the section vector group `V(F)=Spec Sym(F∨)`. A4 uses these operations; it does not plan them again. The explicit import and its consumers are recorded in `upstreamImports`.

## Source corrections and provenance

The six inherited findings retain their IDs and attribution. Independent review confirms them and adds two v1 BCGP misprints. Descriptions are original mathematical formulations; no source passage is retained.

- `AbelianSchemesAndArithmeticModuli/E1`, §14, Proposition 14.4(b), p. 62: Add the hypothesis char k ∤ n, or require α to act as the identity on the finite group scheme A_n. Reason: For E:y²+y=x³ over an algebraic closure of F₂, supersingularity gives E[4](kbar)=0. If ζ is a nontrivial cube root of unity, (x,y)↦(ζx,y) is a nontrivial automorphism fixing the origin and preserving O(0), hence its principal polarization. It acts trivially on all geometric four-torsion points. The proof needs action on the finite group scheme, or a prime-to-characteristic level. Review: confirmed.
- `AbelianSchemesAndArithmeticModuli/E2`, §14, proof of Proposition 14.4(a), p. 62: The compact set is {α ∈ End(A) ⊗ ℝ : Tr(αα†) = 2g}, an ellipsoid by Theorem 14.3; its intersection with the discrete End(A) is finite. Reason: A nonzero real vector space is not compact. The finiteness argument needs a compact set containing Aut(A, λ). Review: confirmed.
- `AbelianSchemesAndArithmeticModuli/E3`, §14, proof of Proposition 14.4(b), p. 62: Add that β and β† commute, because α† = α⁻¹ commutes with α. Then β′ = β†β is nilpotent, since β is, and the nonvanishing of all β′^{2^k} contradicts the nilpotence of β′. Equivalently, Tr(β†β) = 0 contradicts Theorem 14.3. Reason: Nilpotence of β alone does not make β†β nilpotent: in M_2(ℝ) with the transpose, β = e₁₂ is nilpotent while βᵀβ = e₂₂ is idempotent. Review: confirmed.
- `AbelianSchemesAndArithmeticModuli/E4`, §10, Lemma 10.12, p. 47: Require that the degree of x ↦ f(xv + w) be bounded by a fixed d (at most 2g in the application). Reason: Without a bound, the degree d in the proof depends on x_1, …, x_{n−1}, and the first displayed sum may be infinite. Review: confirmed.
- `AbelianSchemesAndArithmeticModuli/E5`, §10, proof of Theorem 10.15, p. 49: M must be the ℤ-submodule of End⁰(A) generated by the e_i. The finite-dimensionality of End⁰(A) must be proved first: the rank of any finitely generated saturated submodule is bounded by rank End(T_ℓA) = 4g². Reason: The degree map is defined on End⁰(A), not on End(T_ℓA), and choosing a ℚ-basis assumes the finite-dimensionality that is being proved. Review: confirmed.
- `AbelianSchemesAndArithmeticModuli/E6`, §14, p. 61: (αβ)† = β†α†. Reason: The Rosati involution is an anti-involution; the daggers on the right-hand side are missing. Review: confirmed.
- `AbelianSchemesAndArithmeticModuli/E7`, Lemma 9.3.4, p.200 (v1): Its finite flat rank/order is p⁴; height is four. Reason: The special fibre is A₀[p] for a surface. A compatible deformation preserves its finite flat rank p^(2 dim A₀), so rank four is incompatible for every odd p. Review: confirmed.
- `AbelianSchemesAndArithmeticModuli/E8`, Lemma 10.3.1, p.215 (v1): The conclusion is G≃A[2]. Reason: The group has order 16, lies in mixed residue characteristic two and is identified on the special fibre with A₀[2]; both supplied proofs construct the two-torsion lift. Review: confirmed.

The comparisons preserve the factor two in graph pullback, rational normalization of NS, geometric multiplicity of reduced trace, finite flat torsion order, and conjugation of level subgroups when changing frames.

## References and read extents

Source statements are rewritten at target level. Published and author-copy editions are distinguished. The cleared Faltings–Chai volume was read in place; uncleared books cited by the public sources were not opened.

- **milne-abelian-varieties**: J. S. Milne, *Abelian Varieties*, Course notes, version 2.00 (March 16, 2008), 172 pages; printed page = PDF page − 6; locators give printed pages and result numbers. [Source](https://www.jmilne.org/math/CourseNotes/AV.pdf). Read extent: cc-fb70e5, 2026-09-29 (checkpoint 1): contents and conventions, pp. iii–vi; §10 Endomorphisms, pp. 42–53, in full; §11, pp. 53–54; §12, pp. 54–56; §13 Weil pairings, pp. 57–61; §14 The Rosati involution, pp. 61–63; the author's errata page for v2.00 Codex codex-TgpAme: fresh AVc v2.00 file, §10 proof/integrality/finiteness passages; author AVs 2022 revision supplies the Rosati formula. The new AVc checksum is recorded in sourceVersions.
- **poonen-rational-points**: Bjorn Poonen, *Rational Points on Varieties*, Graduate Studies in Mathematics 186 (AMS, 2017), the author's 'Unofficial version for incidental online use' (printed page = PDF page − 14). [Source](https://math.mit.edu/~poonen/papers/Qpoints.pdf). Read extent: cc-fb70e5, 2026-09-29 (checkpoint 2): §4.6 Restriction of scalars, pp. 110–112, and Exercises 4.7–4.9, p. 113
- **stacks-05YF**: The Stacks Project Authors, *The Stacks Project, Proposition 97.11.5 (Tag 05YF)*, Online, Chapter 97 (Criteria for Representability), Section 97.11; page as served on 2026-09-29. [Source](https://stacks.math.columbia.edu/tag/05YF). Read extent: cc-fb70e5, 2026-09-29: Proposition 97.11.5 with proof
- **stacks-05YC**: The Stacks Project Authors, *The Stacks Project, Lemma 97.11.2 (Tag 05YC)*, Online, Chapter 97, Section 97.11; page as served on 2026-09-29. [Source](https://stacks.math.columbia.edu/tag/05YC). Read extent: cc-fb70e5, 2026-09-29: Lemma 97.11.2 with proof; Section 97.11 (Tag 05Y8) and Lemma 97.11.1
- **faltings-chai**: Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, 1990; printed pages; cleared maintainer copy, read in place. [Source](https://link.springer.com/book/10.1007/978-3-662-02632-8). Read extent: Cleared maintainer library, read in place without copying: I.1.1–1.10 pp.1–7; I.2.7 pp.9–11; I.3 pp.14–15; I.5 introduction p.25 and §§5.3–5.5 pp.27–29; I.6 pp.29–30; VI.2 pp.207–210. No excerpts or extracted text retained.
- **conrad-polarizations**: Brian Conrad, *Polarizations*, VIGRE seminar notes; numbered PDF pages. [Source](https://math.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf). Read extent: §§1–3, pp.1–10, including the graph factor two, Pic⁰ kernel and positivity.
- **conrad-feng**: Brian Conrad; notes by Tony Feng, *Abelian Varieties*, 2015 course notes; printed pages. [Source](https://math.berkeley.edu/~fengt/249C.pdf). Read extent: §§2–4 foundational Picard/cube/projectivity passages; Theorems 7.6.1 and 7.6.7, pp.73–76.
- **milne-2022**: J. S. Milne, *Abelian Varieties*, 2022-01-02 author revision of the 1986 article; standalone printed pp.1–49. [Source](https://mail.jmilne.org/math/xnotes/AVs.pdf). Read extent: Theorem 13.3, p.25; Theorem 17.3 and Lemma 17.4 with proof, pp.35–37; §§18–20, pp.38–44; field projectivity and quotient comparisons. Independent review: Corollary 12.8 p.22; Theorem 15.1, Lemma 15.2 and Remark 15.4 with proof, pp.27–28; Theorem 17.3 and Lemma 17.4 with proof, pp.35–37.
- **katz-serre-tate**: Nicholas M. Katz, *Serre–Tate local moduli*, LNM 868 (1981), pp.138–202; printed pages. [Source](https://web.math.princeton.edu/~nmk/old/serretatelocmod.pdf). Read extent: Theorem 1.2.1 and proof, pp.143–146; Theorem 2.1, pp.148–150; Lemmas 4.1.1–4.1.2, pp.168–170.
- **analytic**: Stanford VIGRE seminar notes (PDF has no author byline), *Complex Theory of Abelian Varieties*, 2004 seminar; numbered PDF pages. [Source](https://math.stanford.edu/~conrad/vigregroup/vigre04/abvaran.pdf). Read extent: §1, pp.1–8, exponential lattices, Definitions 1.13–1.14, Theorems 1.17–1.18, Corollary 1.20. The Appell–Humbert full proof is cited, not reproduced, by these notes.
- **xie-yuan**: Junyi Xie and Xinyi Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*, arXiv:2108.09722v1; PDF pages. [Source](https://arxiv.org/pdf/2108.09722v1). Read extent: §4.1, pp.19–20, full proof of Lemma 4.1; projectivity/torsion-density references.
- **kisin-pappas**: Mark Kisin and George Pappas, *Integral models of Shimura varieties with parahoric level structure*, Published 2018, printed pp.192–197. [Source](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf). Read extent: §4.4.5–4.4.8, pp.192–193; extension and twisting citations in §4.5.
- **lipnowski-tsimerman**: Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*, arXiv:1511.02212v1; PDF pages. [Source](https://arxiv.org/pdf/1511.02212v1). Read extent: §4.1–4.5, pp.16–22; detailed read of rational NS, positivity, real cone and orbit examples pp.17–20.
- **caro-pasten**: Jerson Caro and Hector Pasten, *A Chabauty–Coleman bound for surfaces*, arXiv:2102.01055v2; PDF pages. [Source](https://arxiv.org/pdf/2102.01055v2). Read extent: §5.1, Lemmas 5.1–5.2 and trace equation (5.1), pp.16–17; consumers in §§7–9 checked through their reviewed extraction.
- **anschütz-lebras**: Johannes Anschütz and Arthur-César Le Bras, *Prismatic Dieudonné theory*, arXiv:1907.10525v4; PDF page 53. [Source](https://arxiv.org/pdf/1907.10525v4). Read extent: Proposition 4.5.1 and proof, p.53 (v4), read with the bounded-prism/p-adic-completion context. The BBM II 2.5.2 proof is not read.
- **kmps22**: Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, *Honda–Tate theory for Shimura varieties*, Duke Mathematical Journal 171 (2022), no. 7, 1559–1614. [Source](https://math.berkeley.edu/~swshin/HT.pdf). Read extent: Routed §§2.1.3,2.3.1 and related realization/real-isogeny inputs, with focused proof checks.
- **bcgp25**: George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1; PDF pages. [Source](https://arxiv.org/pdf/2502.20645v1). Read extent: §1.8.23; §8.1.1; Lemma 9.3.4 and Remark 9.3.5 pp.200–202; Lemma 10.3.1, Remark 10.3.2 and both proofs pp.215–218.
- **gao-habegger**: Ziyang Gao and Philipp Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*, arXiv:1801.05762v3; PDF pages. [Source](https://arxiv.org/pdf/1801.05762v3). Read extent: Routed §1, §2.2, Lemma 5.6 p.25 and Appendix C, pp.58–59.
- **tsimerman18**: Jacob Tsimerman, *The André-Oort conjecture for A_g*, Annals 187 (2018), pp.379–390; published printed locators. [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf). Read extent: Focused Lemma 4.1 proof, pp.384–385; historical extraction distinguishes the earlier isotypic CM references.
- **kisin17**: Mark Kisin, *Mod p points on Shimura varieties of abelian type*, Author preprint; numbered PDF pp.69–70 for §§4.1.6–4.1.8; published JAMS 30 (2017), 819–914.. [Source](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1). Read extent: §§4.1.6–4.1.8, author pp.69–70, fresh read of torsor twist, exact-additive realization and level-frame conjugation.
- **pilloni20**: Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, Author preprint, 111 pages; numbered PDF locators; published Duke 169 (2020), 1647–1807.. [Source](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf). Read extent: §7.1, pp.38–40, fresh read of symmetric and weighted Serre–Tate coordinates and the degree-two/degree-one Kummer trace divisibilities.
- **fkw24**: Benson Farb, Mark Kisin and Jesse Wolfson, *Essential dimension via prismatic cohomology*, arXiv:2110.05534v2; numbered PDF pages; published Duke 173 (2024), 3059–3106.. [Source](https://arxiv.org/pdf/2110.05534v2). Read extent: Corollary 2.3.5 and proof pp.17–18; Lemma 3.2.2 and proof p.24, fresh read. Essential dimension requires the displayed prime/good-reduction hypotheses; only the abelian cohomology input is planned here.
- **charles16**: François Charles, *Birational boundedness for holomorphic symplectic varieties, Zarhin’s trick for K3 surfaces, and the Tate conjecture*, Annals of Mathematics 184 (2016), no.2, 487–526. [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p04-p.pdf). Read extent: Lemma 3.15 proof, printed p.516 (PDF p.30), fresh read. The general integral Hodge-Hom equivalence is an independently derived A5 target, not the literal lemma statement.
- **abs26**: Levent Alpöge, Manjul Bhargava, Wei Ho and Ari Shnidman, *Rank stability in quadratic extensions and Hilbert's tenth problem for the ring of integers of a number field*, Inventiones mathematicae 243 (2026), no. 3, 1129–1139; online 1 December 2025. The downloaded publisher PDF header itself says (2025); the journal landing page assigns volume 243 to 2026.. [Source](https://link.springer.com/content/pdf/10.1007/s00222-025-01392-3.pdf). Read extent: Published pp.1131 and 1137–1138 (PDF pp.3,9–10), fresh read of Weil restriction and the quadratic-twist rational eigenspace/rank formulas. Integral 2-primary splitting is not asserted.
- **maculan**: Marco Maculan, *The universal vector extension of an abeloid variety*, Public author PDF; numbered PDF/printed pages. [Source](https://arxiv.org/pdf/2212.05848v2). Read extent: §§2.4,2.6–2.7, pp.9–13; Definition 2.19, Theorem 2.20, Corollary 2.21. The delegated Mazur–Messing proof was not read.
- **illusie-pisa**: Luc Illusie, *Grothendieck at Pisa: crystals and Barsotti–Tate groups*, Public author PDF; numbered PDF/printed pages. [Source](https://www.imo.universite-paris-saclay.fr/~luc.illusie/Illusie-Pisa5.pdf). Read extent: §4.2(iv), pp.16–17, universal extension and the Lie/de Rham duality convention; not a complete reread of deformation proofs.

## Completion and suggested signatures

A0–A6 are **planned**; none is closed. Independent review **accepts this finished target-level pass** with its explicit proof obligations. It has 89 nodes: 9 definitions, 16 constructions, 53 theorems, 2 lemmas and 9 comparisons; definitions/constructions have 121 API items and 97 tests, and the atlas has 27 planets. Eighteen confirmed pinned declarations and the current upstream imports ground the plan. Fifteen proof/source obligations and seventeen supplier contracts remain. Acceptance is a planning verdict; every implementation remains **unchecked**.

The suggested file imports individual pinned modules. Native field degree/characteristic-polynomial, coefficient algebra and finite-dimensional real Riemann-form signatures appear where their conditions are expressible. The general Hodge and polarization carriers are imported. Every unavailable definition, API, test and named theorem has an exact named omission record. Those records are not elaborated declarations. Compilation checks the present signatures and prototype bodies only; it does not discharge their proofs, omitted signatures or the recorded obligations.
