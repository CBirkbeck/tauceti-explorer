# Hilbert modular varieties and Shimura curves

Construct the finite-level Hilbert modular varieties and quaternionic Shimura curves
needed for arithmetic applications. The Hilbert construction retains ordered,
possibly nonprincipal polarization modules, integral models at ramified primes and
at 2, paired full levels, and the precise positive-unit quotient. The quaternionic
construction supplies canonical compact curves, the auxiliary PEL comparison,
integral models, coefficient cohomology and arithmetic Drinfeld uniformisation.
Definite quaternionic forms supply finite integral Hecke modules, auxiliary-level
control and dyadic norm twists. Paired torsion twists supply moduli varieties with
specified real and finite local points for potential modularity.

The main outputs are actual moduli objects, maps and coefficient modules, together
with their base-change, descent, comparison and duality laws. In particular, a
polarization-class quotient, a selected Weil-pairing component and a fine moduli
space are different objects. A construction over characteristic zero does not
give an integral construction at a ramified prime. Every theorem below retains
the prime, level, lattice and component hypotheses that make its conclusion true.
The definitions include APIs and unit tests intended to detect incorrect choices
of the underlying object. [Suggested.lean](Suggested.lean) suggests forms for
the signatures; this document specifies the mathematics.

## Scope and dependencies

ShimuraData D5 supplies the rational Hilbert groups, their conjugacy domains,
reflex fields and trace-pairing representation. H0 refines those data by the
integral lattice and its dual and computes the derived and central comparisons.
ShimuraVarieties V8 supplies canonical models, datum maps and effective finite
level maps. PELModuli M0–M3 supplies the general PEL datum, moduli functors,
good-prime representability and complex comparison; M4 supplies normalization
and higher-level integral-cover machinery. H1 and R18.1 specialize this theory.
H2 builds the Hilbert bad-prime model from the Deligne–Pappas local model rather
than applying good-prime smoothness where its lattice hypotheses fail.

AbelianSchemesAndArithmeticModuli A1–A6 supplies relative abelian schemes,
duality, Serre tensors, finite-flat torsion pairings, deformation theory, polarized
complex tori and finite-separable restriction of scalars. FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.1–R07.6 supplies strict formal modules, p-divisible groups, crystalline
classification and their deformation and Hasse theory, including its stated
dyadic cases. H2 forms the Hilbert Hasse ideal from the intrinsic invariant.
AdicSpacesPartII R2 supplies formal schemes, admissible blowups and generic
fibres. It does not supply the arithmetic Drinfeld quotient constructed in R18.5.

AutomorphicFormsOnReductiveGroups AF.4–AF.5 supplies algebraic coefficient
lattices, algebraic automorphic functions and Hecke operations. AdelicAlgebraicGroups
AA.3–AA.5 supplies compactness, strong approximation and the anisotropic
quotient used for definite class sets. R18.3 specializes these constructions with
the adelic central quotient. It also constructs the quaternionic transfer needed
for its characteristic-zero comparison, split Hecke normalization and local sign
calculation. The comparison uses actual common coefficient-field models.
Characteristic-zero Frobenius control at auxiliary places is conditional on the
explicit compatibility data in its statement; geometric auxiliary-level freeness
does not construct Galois representations.

ArithmeticLocallySymmetricSpaces ALS.1, ALS.3 and ALS.5 and ClassicalAdicEtaleCohomology
H0, H3 and H5 supply coefficient complexes, pullback and trace, comparison and
duality. R18.4 attaches their coefficient systems and operations to these curves.
WeightsInEtaleCohomology R34.3 and R34.5 supplies proper specialization and
purity after the geometric coefficient projector and its weight have been checked.
CrystallineCohomology CR.7 supplies the relative integral crystal formalism.
An elliptic-family purity theorem is not a substitute for a coefficient summand
of the higher-dimensional auxiliary abelian scheme.

Use the existing Tau Ceti roadmaps for the general mathematical objects:

| Existing roadmap | Material used here |
| --- | --- |
| AlgebraicVectorBundles, L0 | Finite locally free sheaves, tensor products, duals, exterior powers and determinants; H5 and R18.2 specialize them to Hodge and determinant lines. |
| DifferentialGeometry, coefficient and differential-form layers | The general manifold, differential-form and local-coefficient vocabulary underlying the complex curve; this roadmap attaches its algebraic coefficient system rather than rebuilding that theory. |
| QuadraticFormInvariants, Layer 2 | Quaternion algebras, their splitting and reduced-norm conventions. |
| StableReduction, Layers 0, 1, 4, 5 and 6 | Relative curves, nodes, dual multigraphs, arithmetic-surface divisors and regular/minimal models, and numerical types. |
| JacobianChallenge, Layer A | Line bundles, divisor classes, Picard groups and degree, used for the rational quaternionic Hodge line. |
| ModularCurves, integral moduli and torsion-twist targets | The existing elliptic moduli and paired torsion twist; H5 and H6 supply comparison maps and the Hilbert specialization. |
| ClassFieldTheory | Reciprocity and character conventions in the local CM-character constructions; these are inputs to H6's actual local realization. |

The native library substrate includes `Algebra.trace`, `Submodule.mem_traceDual`,
`FractionalIdeal.dual`, `FractionalIdeal.dual_eq_mul_inv` and
`FractionalIdeal.dual_dual`; use these for the different and trace duality.
`NumberField.IsTotallyPositive`, `NumberField.totallyPositiveIntegerUnits` and
`NumberField.sq_mem_totallyPositiveIntegerUnits` supply positivity and square
containment. `NumberField.unitsMulEquivTorsionProdMultiplicative`,
`NumberField.units_sq_index_eq` and the finite narrow class group with
`NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm` supply the
unit and ideal-class facts. None of these notions is redefined here.

Use `DoubleCoset.Quotient`, `QuotientGroup.mk'`, `Representation`, `Submodule`,
`MonoidAlgebra`, `Module.Finite` and `Module.Free` for coefficient modules and
group quotients. `Matrix.adjugate_mul_distrib` and `Matrix.det_adjugate` give
the matrix identities for the full-level action. The residual polynomial
evaluation uses `MvPolynomial.eval₂Hom`, `RingHom.ker` and
`RingHom.ker_isMaximal_of_surjective`. Use `AlgebraicGeometry.Scheme`,
`AlgebraicGeometry.Flat` and `IsRegularLocalRing` for scheme and local ring
properties, and `TauCeti.LocalCoefficientSystem` for the Betti coefficient
system. The existing `TauCeti.LocalCoefficientSystem.twistedCochainComplex` and
`TauCeti.LocalCoefficientSystem.twistedCohomology` supply its cochain and cohomology construction;
the curve-specific comparison, finiteness and Hecke laws are the targets here.

The restricted characteristic-zero cusp, open Hodge-line descent, norm-extension
metric and structured ordinary Honda–Tate calculations needed by these targets
are constructed here. General minimal and toroidal compactifications, general
automorphic bundles, arithmetic intersection heights, perfectoid limits,
overconvergent forms, Galois representation constructions, auxiliary-prime
selection, patching, Moret–Bailly and potential modularity consume these results
and add their own mathematics. The compact division quaternionic curves have
no cusps. The explicit integral Ihara and saturated ramified-crystal targets
below require their stated constructions and are not consequences of the
characteristic-zero or definite comparisons.

## Conventions

In H0–H6 let F be a totally real number field, g=[F:ℚ], O=O_F its ring of
integers, 𝔡 its absolute different, and Σ its real embeddings. For a nonzero
invertible ordered fractional ideal c, write D=𝔡⁻¹ for the trace-dual ideal,
not for a quaternion algebra. The rational Hilbert groups are

\[
G=\operatorname{Res}_{F/\mathbf Q}\mathrm{GL}_2,
\qquad G^*=G\times_{\operatorname{Res}_{F/\mathbf Q}\mathbf G_m}\mathbf G_m,
\]

where the maps are determinant and scalar inclusion. A star always denotes
the scalar-determinant group. Its full domain has two common-sign components,
whereas G has independent signs at the real embeddings. A chosen positive
connected domain is ℍ^Σ. Use the homological convention for h and the trace-form
sign fixed in ShimuraData D5, consistently in the complex moduli comparison.

Lattices use row vectors, with

\[
L_c=O\oplus c^{-1}\mathfrak d^{-1},\qquad
L_c^\#=c\oplus\mathfrak d^{-1}=cL_c,\qquad
\psi_{c,a}(x,y)=\operatorname{Tr}_{F/\mathbf Q}
  \bigl(a(x_1y_2-x_2y_1)\bigr),\quad a\in c.
\]

This is a family of integral forms; no canonical generator of c is chosen.
The balance law is ψ_{c,ba}(x,y)=ψ_{c,a}(bx,y)=ψ_{c,a}(x,by), not an
O-linear scalar multiplication on the ℤ-valued output. An ordered module has
a selected positive component at each real embedding, and an ordered ideal
isomorphism preserves those components.

Unless an individual target specifies otherwise, N≥4 is prime to p, tame
μ_N level is d⁻¹⊗μ_N→A[N], and generic full p^n level is a frame of A∨[p^n].
The level action is γ·α=α∘adj(γ); adjugation reverses products and defines
this left action. A compatible local β:c⁻¹O_p≅d⁻¹(1) fixes the displayed
pairing multiplier. Replacing β by uβ replaces the multiplier b by u⁻¹b.
Integral Γ₀ levels are finite locally free subgroup schemes, including
non-étale subgroups; full constant frames are characteristic-zero data.

Let U=O_F×, U⁺ be its native totally positive subgroup, U_M={u∈U:u≡1 mod MO},
and S_M={u²:u∈U_M}. Square roots in U_M need not be totally positive.
Distinguish Δ(M)=U⁺/S_M from Δ_n(N)=(U_{p^n}∩U⁺)/S_{p^nN}, from the
ineffective scalar image Z_n, and from a selected pairing-multiplier fibre.
The connected inverse limit stabilizes to its images I_n⊂Δ_n(N). At p=2
the projections onto the entire Δ_n(N) need not stabilize to isomorphisms.

For R18.1, R18.2 and R18.4 let B/F be a division quaternion algebra split at
exactly the designated real embedding τ. Its canonical compact curve is over
τ(F), identified with F only through this embedding. Fix a maximal finite
adelic order O_B and all local split identifications. At v|p write
K=\widehat{F_v^{ur}}; an auxiliary reflex completion K′ is a different field.
The effective pro-level centre is the closure of F× in B_f×, whereas a finite
arithmetic stabilizer on ℍ is divided by its rational scalar subgroup. The
split rational modular case is stated separately and has its actual cusps.

For the KW specialization in R18.3, F has even degree, D/F is totally definite
and is split at the finite places where a GL₂ splitting is used. The symbol O
now denotes the integers in a sufficiently large finite extension of ℚ_p,
with residue field k. A finite free coefficient representation τ and a
continuous character ψ:A_F,f×/F×→O× satisfy τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
The default U is compact open; the explicitly stated dyadic division-factor
variant uses its maximal compact U⁰ and its order-two quotient. The polynomial
X²−T_vX+q_vS_v uses arithmetic Frobenius; purity uses geometric Frobenius.
The inverse q_v in the residual evaluation is always a unit in k.

In R18.4 take sufficiently small effective level, so the division quaternionic
curve is smooth and proper without a cusp boundary. The coefficient ring O is
the integers in a finite extension of ℚ_l. The algebraic coefficient lattice is
U-stable and has the specified central character. A perfect integral pairing
is an additional hypothesis for integral duality. Transfer comparisons use
matching infinity weights and actual realizations over a common coefficient
field, as specified in R18.3.

For the local targets of R18.5, K/ℚ_p is finite, with uniformizer π, residue
field k of size q, completed algebraic closure C and completed maximal
unramified extension Ǩ. Heights are O_K-relative. A special strict formal
O_D-module has relative height four and Lie rank two over the base, or rank
one over the unramified quadratic order. Invert the framing quasi-isogeny
when comparing the BC and BZ arrow conventions. Keep the normalized
homography action, the height shift ord_K(det), and the right Π⁻¹ Hecke
translation in the arithmetic descent as distinct maps.

The sections follow construction order. R18.5's local theory precedes R18.2's
generic PEL comparison; arithmetic uniformisation then supplies the
division-prime input to R18.2's integral model theorem. The layer identifiers
remain the references for each target.


## H0 — Integral Hilbert data and trace lattices

Refine ShimuraData D5’s rational data by the actual integral lattice, different and polarization family. The rational group and datum constructions are dependencies; the lattice calculations and their comparisons are the targets here.


<a id="h0-derived-centres"></a>

### Derived groups and algebraic centres

`H0/derived-centres` · theorem. On D5’s groups G and G*, both derived groups are Res_{F/ℚ}SL₂ and their inclusion is the identity there. Z(G)=Res_{F/ℚ}G_m. Z(G*) is the subgroup of scalar matrices t I₂ with t² in the diagonal G_m, including its finite geometric components; its identity component is diagonal G_m. Dimensions are 4g and 3g+1. No connectedness of the full centre of G* is assumed.

**Prerequisites.** `ShimuraData:D5/hilbert-datum`, `ShimuraData:D5/hilbert-star-datum`.

**Sources.** [BHW23](#source-bhw23) Notation 5.1, pp.1740–1741; the centre and dimension formulas follow by computing the scalar-determinant fibre product.


<a id="h0-domain-comparison"></a>

### Independent signs and common signs

`H0/domain-comparison` · comparison. The map of D5 data identifies the common-sign G* domain H^Σ ⊔ (H⁻)^Σ with the corresponding two components of the G domain (H^±)^Σ. The latter has 2^g components; both have complex dimension g and reflex field ℚ. The connected positive domains are equal, but the full conjugacy classes differ for g>1.

**Prerequisites.** `ShimuraData:D5/hilbert-datum`, `ShimuraData:D5/hilbert-star-datum`, [H0/derived-centres](#h0-derived-centres).

**Sources.** [BHW23](#source-bhw23) Notation 5.1, pp.1740–1741; compute the real conjugacy classes using the determinant sign at each embedding.


<a id="h0-polarization-lattice"></a>

### Polarization lattice

`H0/polarization-lattice` · definition. For a nonzero invertible fractional ideal c of O, let D=FractionalIdeal.dual ℤ ℚ O=d⁻¹ and L_c=O⊕c⁻¹D⊂F², with row-vector convention. This is the integral lattice refining D5’s rational representation. For an integral ideal c, K_c is its finite adelic stabilizer; a column convention uses the transpose-conjugate lattice.

**API.**

- `TauCeti.HilbertModular.polarizationLattice`: Construct L_c as the O-submodule O×c⁻¹d⁻¹ of F×F.
- `TauCeti.HilbertModular.mem_polarizationLattice`: (x, y)∈L_c iff x∈O and y∈c⁻¹d⁻¹.
- `TauCeti.HilbertModular.polarizationLattice_rank`: L_c is projective of rank 2 over O and free of rank 2g over ℤ.
- `TauCeti.HilbertModular.polarizationLattice_rescale`: For a∈F×, diag(1, a⁻¹) carries L_c to L_{ac} in the row convention.

**Unit tests.**

- `TauCeti.HilbertModular.lattice_Q`: For F=ℚ, c=ℤ, L_c=ℤ².
- `TauCeti.HilbertModular.lattice_nonprincipal`: L_c is defined for a nonprincipal c without choosing a generator.
- `TauCeti.HilbertModular.lattice_different`: For c=O the second summand is the pinned trace dual of O, not O unless d is trivial.

**Prerequisites.** `FractionalIdeal.dual`, `FractionalIdeal.dual_eq_mul_inv`, `ShimuraData:D5/hilbert-trace-embedding`.

**Sources.** [BHW23](#source-bhw23) Notation 5.1(3) and Definition 5.2(1), pp.1740–1741.


<a id="h0-integral-trace-family"></a>

### Integral trace polarization family

`H0/integral-trace-family` · definition. For a∈c and x, y∈L_c set ψ_{c, a}(x, y)=Tr_{F/ℚ}(a(x₁y₂−x₂y₁))∈ℤ. This is a family parametrized O-linearly by c, rather than a canonical principal symplectic form. Nonzero a gives a nondegenerate rational alternating form; totally positive a has the polarization sign prescribed by D5 (negate the form if the positive h(i) convention is used).

**API.**

- `TauCeti.HilbertModular.integralTraceFamily`: Map c to the alternating ℤ-bilinear forms on L_c by a↦ψ_{c, a}.
- `TauCeti.HilbertModular.integralTraceFamily_apply`: Evaluation is Tr(a(x₁y₂−x₂y₁)).
- `TauCeti.HilbertModular.integralTraceFamily_parameter_add`: ψ_{a+b}=ψ_a+ψ_b and ψ_0=0.
- `TauCeti.HilbertModular.integralTraceFamily_integral`: Its rational image agrees with D5’s trace representation multiplied by a.
- `TauCeti.HilbertModular.integralTraceFamily_balance`: For b∈O, ψ_{ba}(x, y)=ψ_a(bx, y)=ψ_a(x, by). This specifies the O-action on the family of Z-bilinear forms; it is not scalar multiplication of their Z-valued outputs.

**Unit tests.**

- `TauCeti.HilbertModular.traceFamily_Q`: Over ℚ, c=ℤ, a=1 its value on the two standard basis vectors is 1.
- `TauCeti.HilbertModular.traceFamily_zero`: The a=0 form is zero, hence is not declared nondegenerate.
- `TauCeti.HilbertModular.traceFamily_ramified`: For F=ℚ(√2), the second summand uses d⁻¹=(2√2)⁻¹O, preventing a false O² self-duality assertion.

**Prerequisites.** [H0/polarization-lattice](#h0-polarization-lattice), `Submodule.mem_traceDual`, `Algebra.trace`, `ShimuraData:D5/hilbert-trace-form`.

**Sources.** [BHW23](#source-bhw23) Notation 5.1(3), p.1740; compare DP§2.12.


<a id="h0-lattice-duality"></a>

### Trace-dual lattice and its stabilizer

`H0/lattice-duality` · theorem. For ψ(x, y)=Tr(x₁y₂−x₂y₁), the ℤ-dual lattice of L_c is c⊕d⁻¹=c L_c. Its finite adelic row stabilizer is K_c=GL₂(A_{F, f})∩[[Ô,(cd)⁻¹Ô],[cdÔ,Ô]]. Intersecting with G*(A_f) imposes rational scalar determinant. These are equalities of lattices and groups, including nonprincipal c.

**Prerequisites.** [H0/polarization-lattice](#h0-polarization-lattice), [H0/integral-trace-family](#h0-integral-trace-family), `FractionalIdeal.dual_eq_mul_inv`, `FractionalIdeal.dual_dual`.

**Sources.** [BHW23](#source-bhw23) Notation 5.1(3) and Definition 5.2(1), pp.1740–1741.


<a id="h0-type-witnesses"></a>

### Hodge and abelian type witnesses

`H0/type-witnesses` · theorem. D5’s actual trace embedding of (G*, X*) into the Siegel datum, with the sign fixed by the integral trace family, is a D4 Hodge-type witness. The identity Res SL₂→Res SL₂ on the derived groups induces the common connected adjoint datum, and is a D4 abelian-type witness for (G, X). It does not assert a Hodge-type embedding of the exact group G.

**Prerequisites.** [H0/derived-centres](#h0-derived-centres), [H0/domain-comparison](#h0-domain-comparison), [H0/integral-trace-family](#h0-integral-trace-family), `ShimuraData:D5/hilbert-trace-embedding`, `ShimuraData:D4/hodge-type`, `ShimuraData:D4/abelian-type`.

**Sources.** [BHW23](#source-bhw23) Notation 5.1, continuation p.1741.


## H1 — Hilbert–Blumenthal moduli and pairings

Specialize the relative abelian-scheme and PEL theory with ordered polarization modules. Keep the full determinant polynomial, the tame row-level convention and the finite-flat Weil pairing in every comparison.


<a id="h1-ordered-polarization-module"></a>

### Ordered polarization module

`H1/ordered-polarization-module` · definition. An ordered invertible O-module is a projective rank-one O-module c with, for each real embedding τ, a chosen component c_τ^+ of (c⊗_{O, τ}ℝ)\{0}. Its positive cone is the set of elements whose images lie in all selected components. Fractional ideals have the standard embedding order, and ordered isomorphisms preserve each component.

**API.**

- `TauCeti.HilbertModular.OrderedPolarizationModule`: Package the invertible O-module with the chosen real half-lines.
- `TauCeti.HilbertModular.positiveCone`: The intersection of their inverse images in c.
- `TauCeti.HilbertModular.orderedModule_iso`: A module isomorphism is ordered iff it sends each selected real half-line to the selected half-line.
- `TauCeti.HilbertModular.standard_positiveCone`: For standard c=O, its cone equals {a∈O | NumberField.IsTotallyPositive(a:F)}.

**Unit tests.**

- `TauCeti.HilbertModular.ordered_Q`: For O=ℤ the standard cone consists of positive integers.
- `TauCeti.HilbertModular.ordered_negative`: Multiplication by −1 is not an automorphism of the standard ordered module.
- `TauCeti.HilbertModular.ordered_nonprincipal`: An invertible nonprincipal ideal with its embedding cones is admitted without a basis.

**Prerequisites.** `FractionalIdeal.dual`, `NumberField.IsTotallyPositive`.

**Sources.** [TAYLOR02](#source-taylor02) §1, p.9, ordered invertible OM-module.


<a id="h1-symmetric-polarizations"></a>

### Symmetric real multiplication polarizations

`H1/symmetric-polarizations` · definition. For an A1 abelian scheme A/S of relative dimension g with unital injective real multiplication ι:O→End_S(A), P(A, ι) is the étale sheaf of O-linear maps f:A→A∨ satisfying f=f∨ under A2 biduality. P(A, ι)^+ is the subsheaf of polarizations, defined by A2 ampleness. On the Hilbert locus the sheaf is an invertible O-module with its embedding-wise order; the evaluation condition is imposed by the separate c-polarization definition.

**API.**

- `TauCeti.HilbertModular.HilbertPolarizationModule`: The symmetric O-linear Hom sheaf P(A, ι).
- `TauCeti.HilbertModular.hilbertPolarizationModule_positive`: The subsheaf of positive homomorphisms from A2 ampleness.
- `TauCeti.HilbertModular.hilbertPolarizationModule_mem`: A section is an O-linear map equal to its bidual transpose.
- `TauCeti.HilbertModular.hilbertPolarizationModule_pullback`: Pullback is the A2 Hom/duality base-change map on the stipulated Hilbert locus.
- `TauCeti.HilbertModular.hilbertPolarizationModule_ext`: Two sections of P(A, ι) agree if their underlying A→A∨ morphisms agree; the symmetry and O-linearity proofs add no extra section data.

**Unit tests.**

- `TauCeti.HilbertModular.polModule_Q`: For a geometric elliptic curve the symmetric Hom group is ℤ, with its degree-positive ray.
- `TauCeti.HilbertModular.polModule_zero`: Zero is symmetric and is excluded from the positive cone.
- `TauCeti.HilbertModular.polModule_negative`: If λ is a polarization, −λ is symmetric but not positive.

**Prerequisites.** [H1/ordered-polarization-module](#h1-ordered-polarization-module), `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`.

**Sources.** [DP94](#source-dp94) §§1.1–1.5 and 2.1, pp.60–63.


<a id="h1-c-polarization"></a>

### Ordered c-polarization

`H1/c-polarization` · definition. For an ordered invertible O-module c and a real-multiplication abelian scheme A/S, a c-polarization is an ordered isomorphism c_S≅P(A, ι), preserving the positive cones, whose evaluation A⊗_O c→A∨ is an isomorphism. The Serre tensor, duality and positivity are A2/A3 imports. This is the DP condition, including nonprincipal c.

**API.**

- `TauCeti.HilbertModular.CPolarization`: The ordered isomorphism with the DP evaluation condition.
- `TauCeti.HilbertModular.cPolarization_eval`: The induced evaluation isomorphism A⊗_O c≅A∨.
- `TauCeti.HilbertModular.cPolarization_baseChange`: Evaluation and positivity commute with arbitrary base change.
- `TauCeti.HilbertModular.cPolarization_rosati`: Every positive section gives a polarization whose Rosati involution fixes O.

**Unit tests.**

- `TauCeti.HilbertModular.cPol_elliptic`: For F=ℚ, c=ℤ this is the principal elliptic polarization.
- `TauCeti.HilbertModular.cPol_negative`: The negative symmetric map reverses the cone and is not a c-polarization.
- `TauCeti.HilbertModular.cPol_nonprincipal`: No global generator of c is required.

**Prerequisites.** [H1/symmetric-polarizations](#h1-symmetric-polarizations), [H1/ordered-polarization-module](#h1-ordered-polarization-module), `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`.

**Sources.** [DP94](#source-dp94) §§1.1–1.5 and 2.1, pp.60–63.


<a id="h1-hilbert-pel-instance"></a>

### Hilbert PEL instance

`H1/hilbert-pel-instance` · construction. For c as in H1, specialize M0/M1 with B=F, *=id, V=F², L=L_c and the c-indexed integral trace polarization family. At primes where a chosen positive a∈c and d give the good PEL lattice hypotheses, this is the usual trace-pairing PEL datum; the homological h and positivity sign agree with H0. At other primes it is a generic-fibre datum with a DP integral extension constructed in H2, not an application of M2 smoothness.

**API.**

- `TauCeti.HilbertModular.hilbertPELInstance`: The specialization map from the ordered c-polarization data to M0/M1.
- `TauCeti.HilbertModular.hilbertPEL_involution`: The adjoint action of every a∈F is the identity involution a↦a.
- `TauCeti.HilbertModular.hilbertPEL_lattice`: The integral lattice is L_c and its trace dual is c L_c.
- `TauCeti.HilbertModular.hilbertPEL_moduli_equiv`: The specialized M1 objects are exactly H1’s HBAV objects with the listed level and determinant conditions.

**Unit tests.**

- `TauCeti.HilbertModular.pel_Q`: For F=ℚ, c=ℤ obtain the genus-one PEL object.
- `TauCeti.HilbertModular.pel_nonprincipal`: For nonprincipal c the lattice comparison retains c rather than replacing it by O.
- `TauCeti.HilbertModular.pel_ramified`: A ramified prime failing the perfect-lattice condition cannot be declared smooth by M2.

**Prerequisites.** [H0/type-witnesses](#h0-type-witnesses), [H0/lattice-duality](#h0-lattice-duality), [H1/c-polarization](#h1-c-polarization), `PELModuli:M0/integral-pel-datum`, `PELModuli:M1/pel-abelian-scheme`, `AlgebraicGeometry.Scheme`.

**Sources.** [BHW23](#source-bhw23) Notation 5.1 and Definition 5.3, pp.1740–1741.


<a id="h1-hilbert-determinant"></a>

### Full Hilbert determinant condition

`H1/hilbert-determinant` · theorem. In characteristic zero, and on the integral Rapoport locus, Lie(A) is rank one over O⊗𝒪_S and for every a∈O its characteristic polynomial is Norm_{F/ℚ}(T−a). This full polynomial is the M0 determinant condition; equality of traces alone is insufficient in ramified characteristic. The all-base DP implication is proved in H2 from flatness of the universal model and pullback, not from equality on geometric points.

**Prerequisites.** [H1/hilbert-pel-instance](#h1-hilbert-pel-instance), `PELModuli:M0/determinant-condition`, `AbelianSchemesAndArithmeticModuli:A4`.

**Sources.** [DP94](#source-dp94) Proposition 2.7 and Corollary 2.9, pp.65–66.


<a id="h1-tame-level-functors"></a>

### Hilbert tame level functors

`H1/tame-level-functors` · definition. Over ℤ[1/N], N≥4, the tame μ_N level is an O-linear closed immersion d⁻¹⊗_ℤμ_N→A[N]. Define the K₀(c, N), K₁(c, N) and K(c, N) variants through the corresponding finite-flat subgroup, marked quotient/Cartier-dual generator, and full lattice-level conditions. Their adelic groups are the row stabilizers of H0 with reductions respectively [[*,*],[0,*]], [[*,*],[0,1]], and I₂. The μ_N functor matches this K₁ convention, not an unexplained e₁ convention.

**API.**

- `TauCeti.HilbertModular.HilbertTameLevel`: An O-linear closed immersion d⁻¹⊗μ_N→A[N], N invertible.
- `TauCeti.HilbertModular.hilbertTameLevel_pullback`: Pullback preserves the level and closed immersion.
- `TauCeti.HilbertModular.hilbertTameLevel_K1`: The complex lattice stabilizer is K₁(c, N) with lower-right entry 1.
- `TauCeti.HilbertModular.hilbertTameLevel_forget`: The full-level, marked-quotient and subgroup levels have their compatible forgetful maps.

**Unit tests.**

- `TauCeti.HilbertModular.tame_Q`: For F=ℚ the μ_N inclusion is the Cartier-dual version of the usual Y₁(N) marking after the stated isogeny/convention comparison.
- `TauCeti.HilbertModular.tame_badN`: If N is not invertible, the same level is not silently treated as an étale constant basis.
- `TauCeti.HilbertModular.tame_transpose`: Conjugating the row convention by the standard symplectic matrix converts the marked e₂ quotient stabilizer to the e₁ stabilizer.

**Prerequisites.** [H1/c-polarization](#h1-c-polarization), [H0/lattice-duality](#h0-lattice-duality), `AbelianSchemesAndArithmeticModuli:A3`, `PELModuli:M1/moduli-problem`.

**Sources.** [BHW23](#source-bhw23) Definitions 5.2 and 5.4(1), pp.1741–1742.


<a id="h1-good-representability"></a>

### Good-prime representability and universal family

`H1/good-representability` · theorem. For the H1 PEL instance with M2’s good-prime hypotheses, the specialized moduli is a smooth separated finite-type algebraic stack. If N≥4 rigidifies all automorphisms it is an algebraic space with its descended universal HBAV. Scheme and quasi-projective assertions require the DP representability/ample hypotheses used in H2 or the polarized ample-line construction in H6; they are not inferred merely from trivial inertia. The all-prime DP algebraic-space construction and its separate scheme-representability refinement are H2 targets.

**Prerequisites.** [H1/hilbert-pel-instance](#h1-hilbert-pel-instance), [H1/hilbert-determinant](#h1-hilbert-determinant), [H1/tame-level-functors](#h1-tame-level-functors), `PELModuli:M2/representability`, `PELModuli:M2/universal-family`.

**Sources.** [BHW23](#source-bhw23) §5.1.2, pp.1744–1745.


<a id="h1-linear-weil-pairing"></a>

### Linearized Hilbert Weil pairing

`H1/linear-weil-pairing` · construction. For m invertible on S and a c-polarized HBAV, define ẽ_m:A[m]×A∨[m]→d⁻¹⊗_ℤμ_m by ẽ_m(x, y)(a)=e_m(ax, y). Under the trace identification d⁻¹≅Hom_ℤ(O,ℤ), it is perfect O-bilinear and Tr∘ẽ_m=e_m. Combining λ⁻¹ with it gives an alternating pairing on A∨[m] with target c d⁻¹⊗μ_m; equivalently its first argument is twisted by c⁻¹ and the target is d⁻¹⊗μ_m. The pairing on integral finite-flat torsion is an fppf pairing, not a pairing just of geometric points.

**API.**

- `TauCeti.HilbertModular.linearWeilPairing`: The O-linearized pairing on A[m]×A∨[m].
- `TauCeti.HilbertModular.linearWeilPairing_trace`: Tr(ẽ_m(x, y))=e_m(x, y).
- `TauCeti.HilbertModular.linearWeilPairing_Olinear`: ẽ_m(ax, y)=a·ẽ_m(x, y)=ẽ_m(x, ay).
- `TauCeti.HilbertModular.linearWeilPairing_baseChange`: The construction commutes with base change and compatible torsion transition maps.

**Unit tests.**

- `TauCeti.HilbertModular.weil_Q`: For O=ℤ, d=ℤ the linearized and original Weil pairings agree.
- `TauCeti.HilbertModular.weil_codifferent`: For ramified F the target is d⁻¹⊗μ_m, rather than a canonically identified O⊗μ_m.
- `TauCeti.HilbertModular.weil_zero`: Pairing either zero torsion section gives the identity section of μ_m and the zero additive linearization.

**Prerequisites.** [H1/c-polarization](#h1-c-polarization), [H0/lattice-duality](#h0-lattice-duality), `Submodule.mem_traceDual`, `AbelianSchemesAndArithmeticModuli:A3`, `AlgebraicGeometry.Scheme`.

**Sources.** [BHW23](#source-bhw23) Definition 5.6 and equation(5.1), p.1743.


<a id="h1-pairing-choice-laws"></a>

### Pairing and ideal change laws

`H1/pairing-choice-laws` · theorem. At p, choose β:c⁻¹O_p≅d⁻¹(1). If β′=u β with u∈O_p× and the pulled-back pairing is b·⟨ , ⟩_β, then b′=u⁻¹b. Rescaling a c-polarization by η∈O×,+ while fixing the A∨ basis changes b to η⁻¹b. An ordered isomorphism c→c′ transports both λ and β and yields a comparison functor; totally positive multiplication and changes of roots of unity satisfy the corresponding multiplicative cocycle laws. The μ_N comparison does not make c d⁻¹(1) canonically trivial.

**Prerequisites.** [H1/linear-weil-pairing](#h1-linear-weil-pairing), [H1/ordered-polarization-module](#h1-ordered-polarization-module), [H1/tame-level-functors](#h1-tame-level-functors).

**Sources.** [BHW23](#source-bhw23) Definition 5.6, equation(5.2), footnote(2), pp.1743–1744; Lemma 8.9, p.1769.


<a id="h1-complex-hilbert-comparison"></a>

### Complex Hilbert moduli comparison

`H1/complex-hilbert-comparison` · comparison. For N≥4 and the selected ideal/lattice data, X(c, μ_N)_ℂ identifies with Sh_{K₁*(c, N)}(G*, X*), and the variants identify with their matching K, K₀, K₁ levels. The isomorphism is induced by polarized homology with the trace lattice and the H0 datum. It includes M3’s actual component decomposition; changing ideal representatives or β/root choices changes the displayed moduli trivialization by the H1 comparison laws.

**Prerequisites.** [H1/hilbert-pel-instance](#h1-hilbert-pel-instance), [H1/tame-level-functors](#h1-tame-level-functors), [H1/pairing-choice-laws](#h1-pairing-choice-laws), `PELModuli:M3/complex-points`, `PELModuli:M3/algebraization-of-components`.

**Sources.** [BHW23](#source-bhw23) §5.1.2, pp.1744–1745.


## H2 — Deligne–Pappas models and ordinary neighborhoods

Construct the prime-to-p tame integral moduli problem at every p, including 2 and primes ramified in F. Good-prime smoothness and all-prime flatness have distinct hypotheses. Schemes may be used on fine étale presentations; the global model is an algebraic space until its scheme refinement is proved.


<a id="h2-dp-local-model"></a>

### Hilbert self-orthogonal local model

`H2/dp-local-model` · definition. For a base S, the Hilbert local model LM_O/S classifies (O⊗𝒪_T)-submodules W⊂(O⊗𝒪_T)² which are locally direct summands of rank g as 𝒪_T-modules and satisfy W=W^⊥ for the O⊗𝒪_T-valued wedge pairing. It is the corresponding closed subscheme of the rank-g Grassmannian. Rank-one freeness over O⊗𝒪_T is an open condition, not part of the whole local model at ramified primes.

**API.**

- `TauCeti.HilbertModular.HilbertLocalModel`: The closed self-orthogonal O-stable Grassmannian model.
- `TauCeti.HilbertModular.hilbertLocalModel_points`: T-points are exactly the specified rank-g self-orthogonal direct summands.
- `TauCeti.HilbertModular.hilbertLocalModel_baseChange`: Construction commutes with arbitrary base change.
- `TauCeti.HilbertModular.hilbertLocalModel_rapoport`: The open rank-one O⊗𝒪_T submodule locus is the Rapoport local-model locus.

**Unit tests.**

- `TauCeti.HilbertModular.localModel_Q`: For O=ℤ obtain ℙ¹_S, the space of lines in 𝒪_S².
- `TauCeti.HilbertModular.localModel_unramified`: After an étale splitting of O at an unramified prime obtain a product of g projective lines.
- `TauCeti.HilbertModular.localModel_ramified`: For k[T]/T², the submodule generated by Te₁ and Te₂ is self-orthogonal of k-dimension 2 but not free of rank-one over k[T]/T².

**Prerequisites.** [H0/lattice-duality](#h0-lattice-duality), `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources.** [DP94](#source-dp94) §3.2, p.68, and§4.1, pp.70–71.


<a id="h2-dp-integral-model"></a>

### Deligne–Pappas integral Hilbert model

`H2/dp-integral-model` · construction. Fix a nonzero ordered invertible integral ideal c, N≥4 with (N, Norm(c))=1, and p∤N. The DP μ_N functor of H1, including the evaluation isomorphism, has a separated finite-type algebraic-space model over ℤ_(p), with its universal HBAV; an auxiliary sufficiently fine full tame level gives an étale presentation. Its ℚ-fibre is H1’s canonical geometric Hilbert variety. BHW’s stronger scheme formulation requires the stated scheme-representability refinement, to be proved from the DP moduli construction, beyond the good-prime M2 theorem.

**API.**

- `TauCeti.HilbertModular.DelignePappasHilbertModel`: The integral algebraic-space moduli object with universal HBAV.
- `TauCeti.HilbertModular.dpHilbertModel_moduli`: Morphisms T→X_DP correspond functorially to DP c-polarized HBAVs with μ_N level over T.
- `TauCeti.HilbertModular.dpHilbertModel_genericFibre`: Its ℚ-fibre identifies with the H1 canonical moduli variety with matching level.
- `TauCeti.HilbertModular.dpHilbertModel_changeLevel`: Prime-to-p tame level forgetful maps and the universal family commute with pullback.

**Unit tests.**

- `TauCeti.HilbertModular.dp_Q`: For F=ℚ, c=ℤ recover the good integral Y₁(N) moduli problem in the μ_N convention.
- `TauCeti.HilbertModular.dp_dyadic`: For F=ℚ(√2), p=2, N=5 the DP evaluation functor is allowed; the whole model is not declared smooth.
- `TauCeti.HilbertModular.dp_badTame`: N divisible by p is excluded from this prime-to-p tame construction.

**Prerequisites.** [H1/c-polarization](#h1-c-polarization), [H1/tame-level-functors](#h1-tame-level-functors), [H1/complex-hilbert-comparison](#h1-complex-hilbert-comparison), `PELModuli:M1/change-of-lattice-and-primes`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Sources.** [DP94](#source-dp94) §2.1, p.64; BHW§5.1.2, p.1744.


<a id="h2-dp-flat-normal"></a>

### Flatness and normality at every prime

`H2/dp-flat-normal` · theorem. For the DP model at p∤N, its structure map is flat and locally a complete intersection of relative dimension g; each geometric special fibre is normal, and its nonsmooth locus has codimension at least 2. The total space over ℤ_(p) is normal. If p∤disc(F) the whole model is smooth. These assertions hold at p=2; ramified p may have singular points.

**Prerequisites.** [H2/dp-local-model](#h2-dp-local-model), [H2/dp-integral-model](#h2-dp-integral-model), `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`.

**Sources.** [DP94](#source-dp94) Theorem 2.2, Corollary 2.3, Theorem 3.3, Proposition 4.4 and§4.5, pp.64–73.


<a id="h2-dp-determinant-all-bases"></a>

### DP determinant identity on arbitrary bases

`H2/dp-determinant-all-bases` · lemma. The universal DP HBAV satisfies the full norm characteristic-polynomial identity for every a∈O on Lie(A). Therefore so does every pullback, including nonreduced bases. Proof uses H2 flatness and the generic H1 determinant identity; it does not infer a sheaf identity merely from field-valued points. This implication does not identify a determinant-only moduli functor with the DP functor.

**Prerequisites.** [H1/hilbert-determinant](#h1-hilbert-determinant), [H2/dp-flat-normal](#h2-dp-flat-normal), [H2/dp-integral-model](#h2-dp-integral-model), `AbelianSchemesAndArithmeticModuli:A4`.

**Sources.** [DP94](#source-dp94) Proposition 2.7, p.65, and Theorem 2.2, p.64.


<a id="h2-rapoport-locus"></a>

### Rapoport locus

`H2/rapoport-locus` · definition. X_R⊂X_DP is the open locus where ω_A (equivalently, via the polarized Hodge sequence, the relevant Lie module) is locally free of rank-one over O⊗𝒪_S. It has smooth structure map of relative dimension g. At unramified p it is all of X_DP; at ramified p its complement in each special fibre has codimension at least 2. No characteristic-zero embedding decomposition is imposed on a ramified integral base.

**API.**

- `TauCeti.HilbertModular.HilbertRapoportLocus`: The open rank-one O⊗𝒪_S locus of the DP model.
- `TauCeti.HilbertModular.mem_rapoportLocus`: Membership is local rank-one freeness of ω_A over O⊗𝒪_S.
- `TauCeti.HilbertModular.rapoportLocus_baseChange`: The open subspace and ω commute with pullback.
- `TauCeti.HilbertModular.rapoportLocus_smooth`: Its structure map is smooth of relative dimension g.

**Unit tests.**

- `TauCeti.HilbertModular.rapoport_Q`: For F=ℚ the differential bundle is a line and X_R=X_DP.
- `TauCeti.HilbertModular.rapoport_unramified`: For p∤disc(F), X_R is the whole model.
- `TauCeti.HilbertModular.rapoport_nonfree`: The k[T]/T² local-model module ⟨Te₁, Te₂⟩ fails the rank-one freeness test.

**Prerequisites.** [H2/dp-integral-model](#h2-dp-integral-model), [H2/dp-local-model](#h2-dp-local-model), [H2/dp-flat-normal](#h2-dp-flat-normal), `AbelianSchemesAndArithmeticModuli:A4`.

**Sources.** [AIP16](#source-aip16) §3.1, p.10, definition of the Rapoport open; [DP94](#source-dp94) Theorem 2.2, p.64, smoothness of this open.


<a id="h2-ordinary-rapoport"></a>

### Ordinary locus and its Rapoport inclusion

`H2/ordinary-rapoport` · theorem. Define the ordinary locus by A[p^∞] having ordinary slopes 0 and 1 (height 2g, dimension g), or equivalently invertible determinant Verschiebung on ω in characteristic p, using R07.2. For every rational p, this open lies in X_R, so its completed neighborhood has the smooth Rapoport geometry. At a ramified prime, ω is rank-one over O⊗k on this locus; it need not split into embedding lines over the integral base.

**Prerequisites.** [H2/rapoport-locus](#h2-rapoport-locus), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `AbelianSchemesAndArithmeticModuli:A4`.

**Sources.** [AIP16](#source-aip16) §5.2.4, pp.22–23, ordinary/Rapoport inclusion; §3.1, p.10, Hasse invariant.


<a id="h2-hilbert-hasse-ideal"></a>

### Hilbert Hasse ideal

`H2/hilbert-hasse-ideal` · definition. On the special fibre, specialize the generic R07.2 invariant Ha(A[p])=det(V*)∈(det ω_A)^{⊗(p−1)}. On an integral formal trivializing chart define I_Ha=(p,Ĥa), where Ĥa is any lift of that section. Changes of trivialization multiply the reduction by a unit, and changes of lift add p times a section, so these ideals glue. It defines the ordinary open by invertibility of Ha; the generic BT₁ invariant and Fargues LF remain owned by R07.2.

**API.**

- `TauCeti.HilbertModular.HilbertHasseIdeal`: The coherent chartwise ideal (p,Ĥa) on the Hilbert formal model.
- `TauCeti.HilbertModular.hilbertHasseIdeal_lift`: Replacing Ĥa by Ĥa+pf leaves the ideal unchanged.
- `TauCeti.HilbertModular.hilbertHasseIdeal_trivialization`: Changing a line trivialization by a unit gives the same glued ideal.
- `TauCeti.HilbertModular.hilbertHasseIdeal_ordinary`: Ha is invertible exactly on the intrinsic ordinary locus supplied by R07.2.

**Unit tests.**

- `TauCeti.HilbertModular.hasse_p2`: At p=2 the line is det ω, with exponent 1.
- `TauCeti.HilbertModular.hasse_lift`: The generators (p,Ĥa) and(p,Ĥa+pf) define equal ideals.
- `TauCeti.HilbertModular.hasse_supersingular`: For a supersingular elliptic fibre the invariant vanishes and the point is not ordinary.

**Prerequisites.** [H2/ordinary-rapoport](#h2-ordinary-rapoport), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Sources.** [AIP16](#source-aip16) §3.1, p.10, determinant Hasse invariant and Hodge ideal.


<a id="h2-hasse-formal-domains"></a>

### Formal Hasse neighborhoods and lift independence

`H2/hasse-formal-domains` · construction. For a complete p-adic base and a rational 0≤ε=a/b<1, specialize R2’s section-domain construction to det ω and Ha. On each trivializing chart take the admissible blowup chart for (Ĥa^b, p^a) in which Ĥa^b generates, with p-torsion removed; its generic fibre is |Ĥa|≥|p|^{a/b}. The chartwise models glue and the rational domain is independent of the lift. The strictε<1 is essential; no identical lift-independence assertion is made at ε=1.

**API.**

- `TauCeti.HilbertModular.hilbertHasseDomain`: The formal model and adic rational domain for a/b<1.
- `TauCeti.HilbertModular.hilbertHasseDomain_genericFibre`: Generic fibre is the inequality |Ĥa|^b≥|p|^a on each chart.
- `TauCeti.HilbertModular.hilbertHasseDomain_lift`: Two lifts congruent modulo p determine equal rational domains for ε<1.
- `TauCeti.HilbertModular.hilbertHasseDomain_monotone`: Forε≤ε′<1 the ε-domain embeds into the ε′-domain.

**Unit tests.**

- `TauCeti.HilbertModular.hasseDomain_zero`: ε=0 means|Ĥa|=1 on the integral generic fibre.
- `TauCeti.HilbertModular.hasseDomain_dyadic`: The same rational inequality and lift comparison works at p=2.
- `TauCeti.HilbertModular.hasseDomain_endpoint`: Atε=1 the lifts 0 andp of the zero special-fibre section give respectively empty and whole inequality domains.

**Prerequisites.** [H2/hilbert-hasse-ideal](#h2-hilbert-hasse-ideal), `AdicSpacesPartII:R2/section-domain-formal-model`, `AdicSpacesPartII:R2/hasse-domain`.

**Sources.** [AIP16](#source-aip16) §3.2, Definition 3.1, pp.10–11, formal thickenings; rational-domain comparison by AdicSpacesAndPerfectoidGeometry R2.


<a id="h2-polarization-representatives-at-p"></a>

### Polarization representatives at bad primes

`H2/polarization-representatives-at-p` · comparison. For any narrow ideal class and m=p N≠0, the pinned coprime-representative theorem supplies an integral representative c with gcd(Norm(c), p N)=1. Ordered isomorphisms and H1 pairing-choice laws identify the corresponding generic and DP moduli descriptions, and composition obeys the comparison cocycle. Choosing this representative simplifies the integral lattice; it does not remove ramification of F at p or identify different narrow classes.

**Prerequisites.** `NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm`, [H1/pairing-choice-laws](#h1-pairing-choice-laws), [H2/dp-integral-model](#h2-dp-integral-model).

**Sources.** [BHW23](#source-bhw23) Definition 5.2 and footnote(2), pp.1741,1744.


## H3 — Polarization quotients and Hilbert Hecke maps

Identify the exact unit-square kernels, prove their finiteness, and construct the arithmetic polarization-class quotient. Isogenies transport the polarization ideal, so correspondences act on the union of its components.


<a id="h3-congruence-units"></a>

### Tame congruence units

`H3/congruence-units` · definition. Let U=O× and U+=NumberField.totallyPositiveIntegerUnits F. For a nonzero integral ideal a, define U_a=ker(U→(O/a)×); for an integer M>0 write U_M=U_{MO}. Only the congruence subgroup is new; total positivity and subgroup kernels use the pinned carriers.

**API.**

- `TauCeti.HilbertModular.congruenceUnits`: The subgroup η≡1 moduloa.
- `TauCeti.HilbertModular.mem_congruenceUnits`: η∈U_a iff(η−1)∈a.
- `TauCeti.HilbertModular.congruenceUnits_mono`: Ifa⊂b then U_a⊂U_b.

**Unit tests.**

- `TauCeti.HilbertModular.units_Q_tame`: For O=ℤ, N≥3, U_N={1} and S_N={1}.
- `TauCeti.HilbertModular.units_sign`: Both η and−η have totally positive square, but only those congruent 1 modulo N contribute to S_N.
- `TauCeti.HilbertModular.units_squareRoot`: Congruence of η² to 1 modulo N alone does not imply η∈U_N.

**Prerequisites.** `NumberField.totallyPositiveIntegerUnits`, `NumberField.sq_mem_totallyPositiveIntegerUnits`, `QuotientGroup.mk'`.

**Sources.** [BHW23](#source-bhw23) Proposition 8.4 and Lemma 8.12, pp.1766,1771.


<a id="h3-congruence-square-image"></a>

### Congruence square image

`H3/congruence-square-image` · definition. For M>0 let S_M be the image of U_M under η↦η² in the pinned subgroup U+ of totally positive units. The square-root congruence is part of this definition. The image is a normal subgroup since U+ is abelian.

**API.**

- `TauCeti.HilbertModular.congruenceUnitSquares`: The image S_M≤U+ of the square homomorphism on U_M.
- `TauCeti.HilbertModular.mem_congruenceUnitSquares`: u∈S_M iff u=η² for some η∈U_M.
- `TauCeti.HilbertModular.congruenceUnitSquares_mono`: If M divides M′, then S_{M′}≤S_M.

**Unit tests.**

- `TauCeti.HilbertModular.squareImage_Q`: For F=ℚ, M≥3 the image is the trivial subgroup.
- `TauCeti.HilbertModular.squareImage_positive`: Every image element lies in NumberField.totallyPositiveIntegerUnits F by the pinned square-positivity theorem.
- `TauCeti.HilbertModular.squareImage_root`: For F=ℚ(√2), M=12, ε⁸ is not in S_12 although ε⁸≡1 modulo 12: its only roots ±ε⁴ both fail the congruence.

**Prerequisites.** [H3/congruence-units](#h3-congruence-units), `NumberField.sq_mem_totallyPositiveIntegerUnits`.

**Sources.** [BHW23](#source-bhw23) Proposition 8.4 and Lemma 8.12, pp.1766,1771.


<a id="h3-polarization-unit-action"></a>

### Positive unit action on polarizations

`H3/polarization-unit-action` · construction. For the fine DP μ_N object, η∈U+ sends(A, ι, λ, μ_N) to(A, ι, ηλ, μ_N). This gives an action compatible with base change and the H1 moduli comparisons. The O-linear automorphism[η] gives(A, ι, η²λ, η⁻¹μ_N, ηα)≅(A, ι, λ, μ_N, α), with the last marking on A∨. Its tame kernel is exactly S_N under this level convention.

**API.**

- `TauCeti.HilbertModular.polarizationUnitAction`: The U+ action on the c-polarized fine moduli functor.
- `TauCeti.HilbertModular.polarizationUnitAction_one`: The unit 1 acts identically.
- `TauCeti.HilbertModular.polarizationUnitAction_mul`: ηθ acts as η after θ.
- `TauCeti.HilbertModular.polarizationUnitAction_square`: The displayed[η] isomorphism identifies square polarization changes with tame/dual-level scalar changes.

**Unit tests.**

- `TauCeti.HilbertModular.unitAction_Q`: For F=ℚ the positive unit group is trivial.
- `TauCeti.HilbertModular.unitAction_negative`: −1 is not an allowed polarization-scaling unit for the standard positive cone.
- `TauCeti.HilbertModular.unitAction_level`: η² acts trivially at tame level precisely when a root η with η≡1 modulo N supplies the moduli isomorphism.

**Prerequisites.** [H1/c-polarization](#h1-c-polarization), [H1/tame-level-functors](#h1-tame-level-functors), [H3/congruence-square-image](#h3-congruence-square-image), [H2/dp-integral-model](#h2-dp-integral-model).

**Sources.** [BHW23](#source-bhw23) Lemma 8.2, Definition 8.3 and Proposition 8.4, pp.1765–1766.


<a id="h3-tame-delta"></a>

### Finite tame polarization group

`H3/tame-delta` · definition. For N≥4, define Δ(N)=U+/S_N with S_N=U_N² as in congruence units. The quotient uses the normal subgroup inside U+, with its natural projection. It is not U+/((U+∩U_N)²), nor a quotient by units merely congruent 1 after squaring.

**API.**

- `TauCeti.HilbertModular.TamePolarizationGroup`: The quotient U+/S_N.
- `TauCeti.HilbertModular.tameDelta_mk`: The projection U+→Δ(N).
- `TauCeti.HilbertModular.tameDelta_eq`: η and θ have the same class iff ηθ⁻¹=ν² for some ν∈U_N.
- `TauCeti.HilbertModular.tameDelta_changeLevel`: For N|M the inclusion S_M⊂S_N induces Δ(M)→Δ(N).
- `TauCeti.HilbertModular.tameDelta_lift`: For a group J, any homomorphism U+→J killing S_N factors uniquely through tameDelta_mk.

**Unit tests.**

- `TauCeti.HilbertModular.delta_Q`: For F=ℚ, N≥4, Δ(N) is trivial.
- `TauCeti.HilbertModular.delta_square`: Every ν∈U_N maps ν² to 1 in Δ(N).
- `TauCeti.HilbertModular.delta_notPositiveRoot`: The denominator permits square roots that are not totally positive; replacing it by positive-root squares can change the quotient.

**Prerequisites.** [H3/congruence-square-image](#h3-congruence-square-image), `QuotientGroup.mk'`.

**Sources.** [BHW23](#source-bhw23) Proposition 8.4, p.1766.


<a id="h3-delta-finiteness"></a>

### Finiteness of the tame quotient

`H3/delta-finiteness` · theorem. For every M>0, Δ(M) is finite. More precisely, [U:U_M]<∞ because O/MO is finite, and finite generation of U plus the pinned square-class/unit theorem gives [U+:U_M²]<∞. For totally real F of degreeg, every subgroup of U has square-class size at most 2^g; this bound will also be used for the connected groups in H4.

**Prerequisites.** [H3/tame-delta](#h3-tame-delta), `NumberField.units_sq_index_eq`, `NumberField.unitsMulEquivTorsionProdMultiplicative`.

**Sources.** [BHW23](#source-bhw23) Proposition 8.4, p.1766.


<a id="h3-arithmetic-quotient"></a>

### Arithmetic Hilbert quotient

`H3/arithmetic-quotient` · theorem. With the exact μ_N convention, X(c, μ_N)→X_G(c, μ_N) is a finite étale Δ(N)-torsor, and its quotient identifies with the G canonical Hilbert variety through V8. For the integral model the quotient exists in the stated category and has the characteristic-zero comparison. A universal HBAV on the fine source descends only when its descent datum is verified; no universal HBAV is asserted on an arbitrary coarse arithmetic quotient.

**Prerequisites.** [H3/polarization-unit-action](#h3-polarization-unit-action), [H3/delta-finiteness](#h3-delta-finiteness), [H1/complex-hilbert-comparison](#h1-complex-hilbert-comparison), `ShimuraVarieties:V8/finite-level-maps`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Sources.** [BHW23](#source-bhw23) Proposition 8.4, p.1766.


<a id="h3-ideal-class-comparisons"></a>

### Polarization ideal representative comparisons

`H3/ideal-class-comparisons` · comparison. The disjoint union of Hilbert moduli over a list of narrow ideal-class representatives has explicit comparison isomorphisms for a new list: choose ordered ideal isomorphisms and transport λ, lattices and β. Their composites obey H1’s cocycle; changing the comparison by a totally positive unit acts on the G* description and disappears after the G polarization-class quotient. Different ideal classes remain different labels.

**Prerequisites.** [H1/pairing-choice-laws](#h1-pairing-choice-laws), [H2/polarization-representatives-at-p](#h2-polarization-representatives-at-p), [H3/arithmetic-quotient](#h3-arithmetic-quotient), `NumberField.NarrowClassGroup.instFinite`.

**Sources.** [BHW23](#source-bhw23) §8.4.1, pp.1777–1778, ideal dependence before Lemma 8.22.


<a id="h3-hilbert-hecke-isogenies"></a>

### Hecke isogenies between polarization components

`H3/hilbert-hecke-isogenies` · theorem. For an O-linear finite locally free subgroup D⊂A[a], witha prime to N and the required isotropy/polarization descent conditions, the quotientφ:A→B=A/D has the induced HBAV structure and tame marking. If D has O-module elementary divisors O/b_i, putb=∏b_i; the descended polarization module iscb and the dual-isogeny diagram of BHW(8.7) characterizes λ′. These correspondences act on the union of c-components, not necessarily on onec-component, and have representative-independent arithmetic descent.

**Prerequisites.** [H3/ideal-class-comparisons](#h3-ideal-class-comparisons), [H1/linear-weil-pairing](#h1-linear-weil-pairing), `AbelianSchemesAndArithmeticModuli:A3`.

**Sources.** [BHW23](#source-bhw23) Lemma 8.22 and diagram(8.7), pp.1777–1778.


## H4 — Full levels, effective actions and connected limits

Construct the hybrid, scalar-multiplier and arithmetic full levels with their distinct comparison maps. Integral subgroup levels use group schemes. The connected unit limit is finite and stabilizes to its images; the whole-space unit limit has different behavior.


<a id="h4-hybrid-full-level"></a>

### Hybrid full Hilbert level

`H4/hybrid-full-level` · definition. Over characteristic-zero S with a fixed c-polarization and μ_N marking, a hybrid full p^n level is an O/p^n O-linear isomorphism α_n:(O/p^n O)²≅A∨[p^n], n≥1. Denote its fine moduli by X_Γ(p^n). It retains λ and allows an arbitrary O-unit Weil multiplier. This is a generic-fibre basis; no such constant étale basis is imposed on characteristic p torsion.

**API.**

- `TauCeti.HilbertModular.HilbertHybridLevel`: A full O/p^n O basis of A∨[p^n] on the geometric c-polarized moduli.
- `TauCeti.HilbertModular.hybridLevel_forget`: Forgetα_n to the fine tame c-polarized moduli.
- `TauCeti.HilbertModular.hybridLevel_reduce`: Forr≤n use[p^{n−r}] on torsion and reduction of the basis to obtainα_r.
- `TauCeti.HilbertModular.hybridLevel_dualConvention`: λ⁻¹∘(α_n⊗c⁻¹) identifies the corresponding basis of A[p^n] only after the c⁻¹ twist.

**Unit tests.**

- `TauCeti.HilbertModular.hybrid_Q`: For F=ℚ, c=ℤ obtain the usual full generic elliptic level on the dual curve.
- `TauCeti.HilbertModular.hybrid_twist`: For nonprincipal c a basis of A∨[p^n] does not canonically give an untwisted basis of A[p^n].
- `TauCeti.HilbertModular.hybrid_charp`: For an ordinary elliptic curve in characteristic p, E[p] includes μ_p and is not a constant étale rank p² group.

**Prerequisites.** [H1/c-polarization](#h1-c-polarization), [H1/tame-level-functors](#h1-tame-level-functors), [H1/linear-weil-pairing](#h1-linear-weil-pairing), `AbelianSchemesAndArithmeticModuli:A3`, `PELModuli:M1/moduli-problem`.

**Sources.** [BHW23](#source-bhw23) Definition 5.4(4), Remark 5.5 and§8.2, pp.1742,1768.


<a id="h4-pairing-multiplier"></a>

### Hilbert full-level pairing multiplier

`H4/pairing-multiplier` · construction. For a compatible local generator β:c⁻¹O_p≅d⁻¹(1), pull backẽ_{p^n} using λ⁻¹(α_n⊗c⁻¹) andα_n. There is a unique b_n∈(O/p^n O)× such that this pairing is b_n times the β-determinant pairing. The construction is a mape_{n, β}:X_Γ(p^n)→(O/p^n O)×, compatible with torsion reduction. β is an auxiliary trivialization, with the exact change law of H1.

**API.**

- `TauCeti.HilbertModular.hilbertPairingMultiplier`: The unique unit ratio of the pulled-back pairing to the β pairing.
- `TauCeti.HilbertModular.hilbertPairingMultiplier_eq`: e_{n, β}(α)=b iff the two forms differ by multiplication byb.
- `TauCeti.HilbertModular.hilbertPairingMultiplier_reduce`: The multiplier reduces compatibly from p^n to p^r.
- `TauCeti.HilbertModular.hilbertPairingMultiplier_changeBeta`: Replacing β byu β replaces the multiplier byu⁻¹b.

**Unit tests.**

- `TauCeti.HilbertModular.multiplier_identity`: A basis carrying the β form to the actual pairing has multiplier 1.
- `TauCeti.HilbertModular.multiplier_change`: β′=u β givesb′=u⁻¹b.
- `TauCeti.HilbertModular.multiplier_nonscalar`: For a nonscalar residue unitu the multiplieru is not a G* multiplier relative to the fixed β.

**Prerequisites.** [H4/hybrid-full-level](#h4-hybrid-full-level), [H1/linear-weil-pairing](#h1-linear-weil-pairing), [H1/pairing-choice-laws](#h1-pairing-choice-laws).

**Sources.** [BHW23](#source-bhw23) Definition 5.6, equation(5.2), p.1743; equation(8.4), p.1769.


<a id="h4-geometric-full-level"></a>

### Scalar-similitude geometric full level

`H4/geometric-full-level` · definition. Let S_n be the image of(ℤ/p^n ℤ)× in(O/p^n O)×. Define X_Γ*(p^n)=e_{n, β}^{−1}(S_n) inside the hybrid moduli. Its bases are the G* full-level structures of BHW Definition 5.7, and its acting level group is{γ∈GL₂(O/p^n O):det γ∈S_n}. A choice of one root/multiplier component is further data and is not folded into this definition.

**API.**

- `TauCeti.HilbertModular.HilbertGeometricFullLevel`: The scalar-multiplier subfunctor of hybrid full level.
- `TauCeti.HilbertModular.geometricFullLevel_mem`: A basis is geometric full level iff its multiplier belongs to S_n.
- `TauCeti.HilbertModular.geometricFullLevel_inclusion`: The natural inclusion β₁ into the hybrid space.
- `TauCeti.HilbertModular.geometricFullLevel_betaTransport`: H1’s comparison identifies the subfunctors for two compatible β choices after the stated basis transport.

**Unit tests.**

- `TauCeti.HilbertModular.starLevel_Q`: For F=ℚ, S_n=(O/p^n O)×, so geometric and hybrid full levels coincide.
- `TauCeti.HilbertModular.starLevel_missing`: For g>1 with nonscalar residue units, β₁ misses their multiplier fibres and is not surjective.
- `TauCeti.HilbertModular.starLevel_root`: Fixing one primitive root picks one scalar multiplier component; the entire G* definition does not fix that root.

**Prerequisites.** [H4/pairing-multiplier](#h4-pairing-multiplier), [H0/type-witnesses](#h0-type-witnesses).

**Sources.** [BHW23](#source-bhw23) Definition 5.7, p.1743; Lemma 8.10, p.1770.


<a id="h4-adjugate-level-action"></a>

### Adjugate action on dual levels

`H4/adjugate-level-action` · theorem. For γ∈GL₂(O/p^n O), let γ∨=adj(γ)=det γ·γ⁻¹. The rule γ·α=α∘γ∨ gives a left action on hybrid levels because adj(γδ)=adj δ·adj γ. It changes the pairing multiplier bydet γ, since det(adj γ)=det γ in rank-two. Scaling λ by η∈U+ changes that multiplier by η⁻¹. The actions commute; the G* action is obtained by the scalar determinant restriction.

**Prerequisites.** [H4/hybrid-full-level](#h4-hybrid-full-level), [H4/pairing-multiplier](#h4-pairing-multiplier), [H3/polarization-unit-action](#h3-polarization-unit-action), `Matrix.adjugate_mul_distrib`, `Matrix.det_adjugate`.

**Sources.** [BHW23](#source-bhw23) Remark 5.8 and Lemma 8.9, pp.1744,1769–1770.


<a id="h4-unit-square-level"></a>

### Unit squares versus scalar levels

`H4/unit-square-level` · lemma. For η∈U_N, its polarization action by η² on the hybrid full-level space equals the level action of the scalar matrix η⁻¹I₂. Consequently the kernel at full p^n level is S_{p^n N}=U_{p^n N}². This statement uses the dual-level action and the fixed tame μ_N convention; it is recalculated for another tame level.

**Prerequisites.** [H4/adjugate-level-action](#h4-adjugate-level-action), [H3/polarization-unit-action](#h3-polarization-unit-action), [H3/congruence-square-image](#h3-congruence-square-image).

**Sources.** [BHW23](#source-bhw23) Lemma 8.12, p.1771.


<a id="h4-arithmetic-full-level"></a>

### Arithmetic full Hilbert level

`H4/arithmetic-full-level` · definition. Define X_{G, Γ(p^n)} as the polarization-class quotient of the hybrid fine moduli by Δ(p^n N)=U+/U_{p^n N}². Its coarse moduli interpretation retains(A, ι,[λ], μ_N, α_n), with isomorphisms acting on the dual basis. Denote β₂ the quotient map. A local HBAV representative may be used for this interpretation; no universal HBAV on the whole arithmetic quotient is part of this definition.

**API.**

- `TauCeti.HilbertModular.HilbertArithmeticFullLevel`: The quotient X_Γ(p^n)/Δ(p^n N).
- `TauCeti.HilbertModular.arithmeticFullLevel_quotient`: Invariant maps from the hybrid space factor uniquely through β₂.
- `TauCeti.HilbertModular.arithmeticFullLevel_reduce`: The level reductions commute with the corresponding Δ quotient maps.
- `TauCeti.HilbertModular.arithmeticFullLevel_coarse`: Geometric points have the stated polarization-class and dual-basis interpretation.

**Unit tests.**

- `TauCeti.HilbertModular.arithmeticLevel_Q`: For F=ℚ the positive-unit quotient is trivial and all three full levels agree.
- `TauCeti.HilbertModular.arithmeticLevel_beta1`: The composite β₂β₁ need not be surjective and is not called a torsor merely because β₂ is one.
- `TauCeti.HilbertModular.arithmeticLevel_universal`: The coarse interpretation supplies no automatic descended universal abelian scheme.

**Prerequisites.** [H4/hybrid-full-level](#h4-hybrid-full-level), [H4/unit-square-level](#h4-unit-square-level), [H3/tame-delta](#h3-tame-delta), [H3/delta-finiteness](#h3-delta-finiteness), `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Sources.** [BHW23](#source-bhw23) Lemma 8.16(1), p.1772.


<a id="h4-hybrid-comparison-map"></a>

### Induction from scalar pairing components

`H4/hybrid-comparison-map` · comparison. For fixed β, X_Γ(p^n)≅[(O/p^n O)××X_Γ*(p^n)]/S_n, where a residue unitu acts throughdiag(u,1) and S_n acts antidiagonally. Thus β₁ is the scalar-multiplier inclusion and β₂ is the unit polarization quotient; their distinct images and groups are visible. The assertion is on the generic fibre with compatible pairings.

**Prerequisites.** [H4/geometric-full-level](#h4-geometric-full-level), [H4/adjugate-level-action](#h4-adjugate-level-action), [H4/arithmetic-full-level](#h4-arithmetic-full-level).

**Sources.** [BHW23](#source-bhw23) Corollary 8.11, p.1771.


<a id="h4-integral-gamma0"></a>

### Integral Iwahori and higher subgroup levels

`H4/integral-gamma0` · definition. An integral Γ₀(p^n) level is a finite locally free O-stable subgroup C⊂A[p^n] of rank p^{ng}, such that every c-indexed polarized Weil pairing vanishes on C×C. Require its generic fibre C[1/p] to be étale locally O/p^n O of rank one. The inclusion C⊂A[p^n] imposes p^n-annihilation; any stronger ideal-annihilator or flat-closure refinement is a separate ideal-annihilator and flat-closure comparison. For a naive integral functor retain precisely these conditions; any flat closure or refined local-model variant is separately stated.Γ₁ is an integral generator condition only when its group-scheme formulation has been specified; a full constant basis is restricted to the generic fibre.

**API.**

- `TauCeti.HilbertModular.HilbertIntegralGamma0`: The finite locally free O-stable isotropic subgroup-scheme level.
- `TauCeti.HilbertModular.integralGamma0_baseChange`: Subgroup, rank and isotropy pull back to any base.
- `TauCeti.HilbertModular.integralGamma0_generic`: On the generic fibre it is the stated O/p^n O rank-one subgroup level.
- `TauCeti.HilbertModular.integralGamma0_forget`: The nested subgroup levels have forgetful maps, with their actual subgroup intersections.

**Unit tests.**

- `TauCeti.HilbertModular.gamma0_ordinary`: For an ordinary elliptic curve, the multiplicative μ_{p^n} subgroup is a valid rank p^n integral Γ₀ level.
- `TauCeti.HilbertModular.gamma0_zero`: The zero subgroup has the wrong rank for n≥1.
- `TauCeti.HilbertModular.gamma0_points`: Replacing μ_p by its geometric points loses its scheme rank and fails the test.

**Prerequisites.** [H2/dp-integral-model](#h2-dp-integral-model), [H1/linear-weil-pairing](#h1-linear-weil-pairing), `AbelianSchemesAndArithmeticModuli:A3`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

**Sources.** [BHW23](#source-bhw23) Definition 5.4(2–3), p.1742; integral subgroup-scheme refinement as specified here.


<a id="h4-gamma0-cartesian"></a>

### Polarization quotient at subgroup level

`H4/gamma0-cartesian` · comparison. On the generic fibre, the Γ₀(p^n) subgroup-level squares over X→X_G are Cartesian: units preserve O-stable C, so the same Δ(N) torsor acts before and after adjoining C. Any invariant rational Hasse neighborhood restricts this finite-level Cartesian diagram. No perfectoid limit theorem is proved or imported here.

**Prerequisites.** [H4/integral-gamma0](#h4-integral-gamma0), [H3/arithmetic-quotient](#h3-arithmetic-quotient), [H2/hasse-formal-domains](#h2-hasse-formal-domains).

**Sources.** [BHW23](#source-bhw23) Lemma 8.5, p.1766.


<a id="h4-connected-unit-groups"></a>

### Connected polarization and residue component groups

`H4/connected-unit-groups` · definition. For n≥1 put A_n=U_{p^n}∩U+, B_n=U_{p^n N}, and Δ_n(N)=A_n/B_n². For r≤n inclusion induces Δ_n→Δ_r; these maps need be neither injective nor surjective. This group preserves a selected paired component and differs from the whole-space quotient Δ(p^n N)=U+/B_n².

**API.**

- `TauCeti.HilbertModular.ConnectedPolarizationGroup`: A_n/B_n² with the indicated level transitions.
- `TauCeti.HilbertModular.connectedDelta_eq`: Classes of η, θ∈A_n agree iff ηθ⁻¹=ν² for ν∈B_n.
- `TauCeti.HilbertModular.connectedDelta_transition`: Reduction from n tor is induced by inclusion and satisfies identity/composition laws.

**Unit tests.**

- `TauCeti.HilbertModular.connectedDelta_Q`: For F=ℚ all Δ_n(N) are trivial.
- `TauCeti.HilbertModular.connectedDelta_noninjective`: For F=ℚ(√2), p=3, N=4 the inclusion-induced Δ₁(4)→Δ(4) is not injective, as demonstrated in the counterexample node.
- `TauCeti.HilbertModular.connectedDelta_square`: For η∈U_{p^n N}, the class of η² is trivial in Δ_n(N).

**Prerequisites.** [H3/congruence-square-image](#h3-congruence-square-image), [H3/tame-delta](#h3-tame-delta), `QuotientGroup.mk'`.

**Sources.** [BHW23](#source-bhw23) Definition 8.14 and Lemma 8.16, pp.1771–1773.


<a id="h4-residue-component-group"></a>

### Residue polarization components

`H4/residue-component-group` · definition. For n≥1 define 𝒰_n=(O/p^n O)×/image(U+), using reduction of the pinned totally positive units. This is the fixed-c arithmetic multiplier-component group; over all polarization classes it occurs as the kernel in the narrow ray-class extension.

**API.**

- `TauCeti.HilbertModular.ResiduePolarizationComponents`: The quotient of residue units by the positive-unit image.
- `TauCeti.HilbertModular.residueComponents_mk`: The residue-unit projection to 𝒰_n.
- `TauCeti.HilbertModular.residueComponents_eq`: Two units have equal classes iff their ratio is the reduction of a totally positive global unit.
- `TauCeti.HilbertModular.residueComponents_reduce`: Residue reduction induces compatible maps 𝒰_n→𝒰_r for r≤n.

**Unit tests.**

- `TauCeti.HilbertModular.residueComponents_Q`: For F=ℚ the image is {1}, so 𝒰_n=(ℤ/p^n ℤ)×.
- `TauCeti.HilbertModular.residueComponents_unit`: Reduction of every positive global unit has trivial class.
- `TauCeti.HilbertModular.residueComponents_narrow`: The group for fixed c omits nontrivial narrow ideal classes and is not the whole arithmetic component set.

**Prerequisites.** [H3/congruence-units](#h3-congruence-units), `QuotientGroup.mk'`.

**Sources.** [BHW23](#source-bhw23) Definition 8.14 and Lemma 8.16, pp.1771–1773.


<a id="h4-component-and-torsor-comparison"></a>

### Full and connected component comparisons

`H4/component-and-torsor-comparison` · theorem. With BHW’s fixed c and tame μ_N convention, after a splitting/cyclotomic base and the required component choice, π₀(X_Γ*(p^n))=(ℤ/p^n ℤ)×, π₀(X_Γ(p^n))=(O/p^n O)×, and π₀(X_{G, Γ(p^n)})=𝒰_n for thatc-fibre. Over allc classes the arithmetic labels form the narrow ray-class extension by Cl⁺(O).β₂ is a Δ(p^n N) torsor on the whole space and a Δ_n(N) torsor on paired chosen components. Base-field Galois actions on the labels are retained.

**Prerequisites.** [H4/connected-unit-groups](#h4-connected-unit-groups), [H4/hybrid-comparison-map](#h4-hybrid-comparison-map), [H3/ideal-class-comparisons](#h3-ideal-class-comparisons), [H4/arithmetic-full-level](#h4-arithmetic-full-level), `ShimuraVarieties:V8/finite-level-maps`, `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, [H4/residue-component-group](#h4-residue-component-group).

**Sources.** [BHW23](#source-bhw23) Lemmas 8.15–8.16, pp.1771–1773.


<a id="h4-effective-level-groups"></a>

### Effective finite level groups

`H4/effective-level-groups` · definition. For 0≤m≤n, n≥1, define Γ₀(p^m, p^n)={γ∈GL₂(O/p^n O): γ₂₁∈p^m O/p^n O}. Its Γ₀* subgroup imposes determinant in the scalar image of (ℤ/p^n ℤ)×. These act on generic full-level frames and forget to the stipulated subgroup level.

**API.**

- `TauCeti.HilbertModular.HilbertFiniteGamma0`: The lower-left congruence subgroup of GL₂(O/p^n O).
- `TauCeti.HilbertModular.finiteGamma0_mem`: Membership is exactly the lower-left ideal condition.
- `TauCeti.HilbertModular.finiteGamma0_star`: The scalar-determinant subgroup Γ₀*≤Γ₀.

**Unit tests.**

- `TauCeti.HilbertModular.gamma0_m0`: For m=0 the lower-left condition is void and Γ₀=GL₂(O/p^n O).
- `TauCeti.HilbertModular.gamma0_mn`: For m=n the lower-left entry is 0 in O/p^n O.
- `TauCeti.HilbertModular.effective_Q`: For F=ℚ, N≥4, U_N={1}; hence Z_n is trivial and PΓ₀=Γ₀.

**Prerequisites.** [H4/adjugate-level-action](#h4-adjugate-level-action), [H4/unit-square-level](#h4-unit-square-level), [H3/congruence-square-image](#h3-congruence-square-image), `QuotientGroup.mk'`.

**Sources.** [BHW23](#source-bhw23) Definition 8.17 and§8.3.1, pp.1773–1775.


<a id="h4-diagonal-level-group"></a>

### Diagonal level and polarization group

`H4/diagonal-level-group` · definition. Define E(p^m, p^n)=(Γ₀(p^m, p^n)×U+)/image(η↦(ηI₂, η²), η∈U_N). The subgroup is central. For the left adjugate frame action and positive polarization action this is exactly the joint ineffective subgroup.

**API.**

- `TauCeti.HilbertModular.HilbertDiagonalLevelGroup`: The central quotient E by the square relation.
- `TauCeti.HilbertModular.diagonalLevel_mk`: The product-group projection to E.
- `TauCeti.HilbertModular.diagonalLevel_relation`: (ηI₂, η²) maps to 1 for η∈U_N; these generate exactly the kernel.
- `TauCeti.HilbertModular.diagonalLevel_action`: The joint level/polarization action factors through E using H4’s unit-square calculation.

**Unit tests.**

- `TauCeti.HilbertModular.diagonal_Q`: For F=ℚ, N≥4, E=Γ₀.
- `TauCeti.HilbertModular.diagonal_square`: Its second coordinate is η², matching Rosati polarization scaling.
- `TauCeti.HilbertModular.diagonal_notLinear`: The relation (ηI₂, η) generally changes the paired moduli and is not substituted.

**Prerequisites.** [H4/effective-level-groups](#h4-effective-level-groups), [H4/unit-square-level](#h4-unit-square-level), [H3/congruence-square-image](#h3-congruence-square-image), `QuotientGroup.mk'`.

**Sources.** [BHW23](#source-bhw23) Definition 8.17 and§8.3.1, pp.1773–1775.


<a id="h4-level-scalar-kernel"></a>

### Ineffective scalar level subgroup

`H4/level-scalar-kernel` · definition. Let Z_n be the image of U_N under scalar reduction η↦ηI₂ in Γ₀(p^m, p^n). It is central and its kernel is U_{p^n N}, because p and N are coprime. Thus Z_n≅U_N/U_{p^n N}; the tame congruence is not dropped.

**API.**

- `TauCeti.HilbertModular.hilbertLevelScalarKernel`: The central image Z_n of U_N in Γ₀.
- `TauCeti.HilbertModular.levelScalarKernel_mem`: γ∈Z_n iff γ=ηI₂ for η∈U_N.
- `TauCeti.HilbertModular.levelScalarKernel_quotient`: Z_n≅U_N/U_{p^n N}.

**Unit tests.**

- `TauCeti.HilbertModular.scalarKernel_Q`: For F=ℚ, N≥4, Z_n={I₂}.
- `TauCeti.HilbertModular.scalarKernel_central`: Every scalar image commutes with Γ₀.
- `TauCeti.HilbertModular.scalarKernel_tame`: A scalar global unit failing the N-congruence is not inserted into this image.

**Prerequisites.** [H4/effective-level-groups](#h4-effective-level-groups), [H3/congruence-units](#h3-congruence-units).

**Sources.** [BHW23](#source-bhw23) Definition 8.17 and§8.3.1, pp.1773–1775.


<a id="h4-projective-level-group"></a>

### Effective projective level group

`H4/projective-level-group` · definition. Define PΓ₀(p^m, p^n)=Γ₀(p^m, p^n)/Z_n using the actual ineffective scalar subgroup, not all residue scalar matrices. It acts effectively on the arithmetic full-level moduli over Γ₀ subgroup level.

**API.**

- `TauCeti.HilbertModular.HilbertEffectiveGamma0`: The quotient PΓ₀=Γ₀/Z_n.
- `TauCeti.HilbertModular.effectiveLevel_mk`: The normal-subgroup quotient projection.
- `TauCeti.HilbertModular.effectiveLevel_quotient`: An action trivial on Z_n factors uniquely through PΓ₀.

**Unit tests.**

- `TauCeti.HilbertModular.effective_Q`: For F=ℚ, N≥4, PΓ₀=Γ₀.
- `TauCeti.HilbertModular.effective_kernel`: The projection kills exactly Z_n.
- `TauCeti.HilbertModular.effective_notPGL`: For F=ℚ and p odd the scalar −I₂ survives; this quotient is not PGL₂.

**Prerequisites.** [H4/effective-level-groups](#h4-effective-level-groups), [H4/level-scalar-kernel](#h4-level-scalar-kernel), `QuotientGroup.mk'`.

**Sources.** [BHW23](#source-bhw23) Definition 8.17 and§8.3.1, pp.1773–1775.


<a id="h4-finite-level-torsors"></a>

### Finite-level torsors and diagonal exact sequences

`H4/finite-level-torsors` · theorem. In characteristic-zero with the stated fine tame level, X_Γ*→X_Γ₀* is a Γ₀* torsor, X_Γ→X_Γ₀* a Γ₀ torsor, and X_{G, Γ}→X_{G, Γ₀} a PΓ₀ torsor. The diagonal hybrid-to-arithmetic-subgroup map is an E torsor with exact sequences 1→Γ₀→E→Δ(N)→1 and 1→Δ(p^n N)→E→PΓ₀→1. No universal nonsplitting assertion is imposed on these extensions.

**Prerequisites.** [H4/effective-level-groups](#h4-effective-level-groups), [H4/component-and-torsor-comparison](#h4-component-and-torsor-comparison), [H4/gamma0-cartesian](#h4-gamma0-cartesian), [H4/projective-level-group](#h4-projective-level-group), [H4/diagonal-level-group](#h4-diagonal-level-group).

**Sources.** [BHW23](#source-bhw23) Proposition 8.18, diagram(8.6), Lemma 8.19, pp.1773–1775.


<a id="h4-connected-limit-finiteness"></a>

### Finite connected unit limit and stable images

`H4/connected-limit-finiteness` · theorem. For every p including 2, the finite groups Δ_n(N) have the uniform bound|Δ_n(N)|≤[U:U_N]·2^g. Their inverse limit Δ_∞(N) is finite. Let I_n be the image of Δ_∞→Δ_n; the surjective transition maps I_{n+1}→I_n are isomorphisms for n≫0, so Δ_∞≅I_n eventually. The literal assertion Δ_∞≅Δ_n via projection for all large n is false at p=2. The whole-space inverse limit lim Δ(p^n N) is a separate profinite group and is not covered by this bound.

**Prerequisites.** [H4/connected-unit-groups](#h4-connected-unit-groups), [H3/delta-finiteness](#h3-delta-finiteness), `NumberField.unitsMulEquivTorsionProdMultiplicative`.

**Sources.** [BHW23](#source-bhw23) Lemma 8.20, p.1775, corrected statement; the explicit countercalculations below.


<a id="h4-stabilization-counterexamples"></a>

### Counterexamples to the printed unit stabilization proof

`H4/stabilization-counterexamples` · application. For F=ℚ(√2), ε=1+√2: (i) p=3, N=4, η=ε⁴=17+12√2 lies in U_4 and η≡−1 modulo 3, so η² defines a nonzero class in Δ₁(4) which is zero in Δ(4); neither root±η lies in U_12. (ii) p=2, N=5 andn≥2, U_{2^n}=⟨ε^{2^n}⟩ and U_{2^n 5}=⟨ε^{3·2^n}⟩, hence Δ_n(5)≅ℤ/6 with transition multiplication by 2. Its inverse limit is ℤ/3; the original maps never stabilize to isomorphisms.

**Prerequisites.** [H4/connected-unit-groups](#h4-connected-unit-groups), [H3/tame-delta](#h3-tame-delta).

**Sources.** [BHW23](#source-bhw23) Lemma 8.20 proof, p.1775; explicit countercalculation.


## H5 — Modular comparisons, Hodge factors and algebraic weights

Normalize the rational case against the modular-curve moduli conventions. Build the restricted cusp and open Hodge-line calculations needed here, and check characteristic-zero descent with nonprincipal and ramified examples.


<a id="h5-rational-modular-comparison"></a>

### Rational modular-curve comparison

`H5/rational-modular-comparison` · comparison. For F=ℚ both imported Hilbert groups are GL₂, d=ℤ, and a c-polarization becomes the elliptic principal polarization after the positive generator of c is fixed. Match μ_N⊂E[N] to the marked-point Y₁(N) convention by quotienting E by its μ_N image and using the Cartier-dual kernel of the dual isogeny; match full and Γ₀ levels through the explicit dual/polarization maps. Then all three full-level spaces and their quotients agree with V8/R12.2 modular curves, with compatible level and Hecke maps. A fixed-root full pairing component has its actual cyclotomic field.

**Prerequisites.** [H0/domain-comparison](#h0-domain-comparison), [H1/tame-level-functors](#h1-tame-level-functors), [H4/arithmetic-full-level](#h4-arithmetic-full-level), [H4/integral-gamma0](#h4-integral-gamma0), `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-tower-compatibility`, `ModularCurvesPartII:R12.2`.

**Sources.** [BHW23](#source-bhw23) Definitions 5.2–5.7 and Remark 5.8, pp.1741–1744, specialized to F=ℚ.


<a id="h5-quadratic-domain-boundary"></a>

### Real quadratic domains and minimal cusps

`H5/quadratic-domain-boundary` · theorem. For real quadratic F the Hilbert domains have complex dimension 2, with four independent-sign G components and two common-sign G* components. Let 𝔫 be a nonzero tame ideal coprime to the different, dividing neither 2 nor 3, and let c be coprime to 𝔫, as in Dimitrov’s Γ₁(c,𝔫) construction. Construct the characteristic-zero minimal compactification of the chosen finite-level quotient and identify its boundary as the finite union of zero-dimensional cusp schemes. The cusp indexed by its ideal data is Spec(L[ζ_e]^{H_C}), with e the exponent of the cusp quotient b′/b and H_C its finite unit action. In dimension two the boundary has codimension two. Toroidal boundary divisors and the divisor boundary of a product of compactified modular curves are distinct objects.

**Hypotheses.** For the C6 minimal-boundary comparison retain its tame-ideal range: n is coprime to the field discriminant and does not divide 2 or 3, and c is prime to n; use the supplier’s actual torsion-free moduli input. Other levels require a separate canonical finite-level comparison.

**Prerequisites.** [H0/domain-comparison](#h0-domain-comparison), [H1/complex-hilbert-comparison](#h1-complex-hilbert-comparison), [H3/arithmetic-quotient](#h3-arithmetic-quotient), `ShimuraVarieties:V8`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Sources.** [DIMITROV](#source-dimitrov) §8, Theorem 8.6(iv), p.548; tame-ideal hypotheses in the introduction, p.525, and §3.


<a id="h5-hodge-splitting-descent"></a>

### Hilbert Hodge splitting and descent

`H5/hodge-splitting-descent` · comparison. In characteristic zero, ω_A is locally free of rank one over O_F⊗𝒪. Over a field L containing every embedding F→L, the orthogonal idempotents of F⊗L give ω_A⊗L=⊕_τ ω_τ, with each ω_τ an invertible sheaf. Galois permutations of the embeddings and their semilinear descent maps recover the unsplit O_F⊗𝒪 bundle. Identify each factor on the open moduli variety with the Hodge line in the algebraic coefficient construction, by applying the polarized de Rham Hodge sequence to the universal family. Use the existing tensor, exterior power and determinant functors. At a ramified integral prime the embedding idempotents do not exist in general; use the unsplit module and its filtration. Extension over a compactification requires its own semiabelian and boundary hypotheses.

**Prerequisites.** [H2/rapoport-locus](#h2-rapoport-locus), [H1/hilbert-pel-instance](#h1-hilbert-pel-instance), `AbelianSchemesAndArithmeticModuli:A4`, [Tau Ceti AlgebraicVectorBundles, L0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md).

**Sources.** [DIAMOND](#source-diamond) §§3.1–3.2, pp.9–12, specialized to the characteristic-zero fibre; [BHW23](#source-bhw23) §7.1, pp.1759–1760, Hodge and modified Hodge bundles.


<a id="h5-algebraic-weights-units"></a>

### Algebraic Hilbert weights and central units

`H5/algebraic-weights-units` · theorem. For a field L splitting F, take integers (k_τ, w) with k_τ≡w mod 2 and m_τ=(w−k_τ)/2. Let P_τ be the rank-two de Rham factor and N_τ=det(P_τ). Construct the line ⊗_τ(ω_τ^{⊗k_τ}⊗N_τ^{⊗m_τ}), using dual powers for negative exponents. Under a scalar t its coefficient character is ∏_τ τ(t)^{k_τ+2m_τ}=Norm_{F/ℚ}(t)^w. Prove descent through the effective central kernel exactly when this character is trivial on the scalar stabilizers of the selected level. Totally positive units have norm one; for odd w the remaining norm −1 units must be absent or their sign action trivialized. Compare with the classical algebraic Hilbert weight convention on the open characteristic-zero variety. Nonalgebraic p-adic weights and integral ramified embedding splittings require other constructions.

**Prerequisites.** [H5/hodge-splitting-descent](#h5-hodge-splitting-descent), [H3/arithmetic-quotient](#h3-arithmetic-quotient), [H4/level-scalar-kernel](#h4-level-scalar-kernel), [Tau Ceti AlgebraicVectorBundles, L0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md).

**Sources.** [DIAMOND](#source-diamond) §3.2, Definition 3.2.1 and the paritious-weight paragraph, p.12.


<a id="h5-nonprincipal-ramified-test"></a>

### Nonprincipal and ramified comparison example

`H5/nonprincipal-ramified-test` · application. Take F=ℚ(√10), O=ℤ[√10], c=(2,√10), N=7, p=5. The idealc has norm 2 and is not principal: a generator would have norm±2, impossible modulo 5. The primep ramifies since disc(F)=40, whilec and N are prime to p. Construct L_c and its dualc L_c, the DP model and its Rapoport/ordinary locus with this label. Over a splitting field ω has two lines; over the ramified residue base this splitting is not imposed.

**Prerequisites.** [H0/lattice-duality](#h0-lattice-duality), [H2/polarization-representatives-at-p](#h2-polarization-representatives-at-p), [H2/ordinary-rapoport](#h2-ordinary-rapoport), [H5/hodge-splitting-descent](#h5-hodge-splitting-descent).

**Sources.** [BHW23](#source-bhw23) Notation 5.1(3), p.1740, and §5.1.2, p.1744; explicit norm and ramification calculations for ℚ(√10); [DP94](#source-dp94) Theorem 2.2, p.64, for the integral model used in the example.


## H6 — Paired torsion twists and local realizations

Construct the actual paired Isom torsors and descend the fine moduli and family. A selected component has a field of definition. Local nonemptiness is a theorem about the explicitly constructed abelian variety and its markings, with the indicated CM and finite-flat hypotheses.


<a id="h6-torsion-isom-torsor"></a>

### Simultaneous torsion Isom torsor

`H6/torsion-isom-torsor` · definition. Let K be a characteristic-zero field and ℓ₁≠ℓ₂ distinct odd primes, with full paired torsion markings at these primes. A retained extra tame marking is prime to ℓ₁ℓ₂; in the elliptic specialization the two full odd torsion levels themselves supply a fine marking. Fori=1,2 let V_i be a finite étale G_K-module locally free of rank 2 over O/ℓ_i O, equipped with a perfect alternating pairing∧²V_i≅(c d⁻¹/ℓ_ic d⁻¹)⊗μ_{ℓ_i}. Define the symplectic O-linear Isom torsor from the standard torsion module with its matching pairing to V_i, and take their product. Its finite structural group is the product of the two symplectic automorphism groups; it need not be commutative.

**API.**

- `TauCeti.HilbertModular.HilbertTorsionIsomTorsor`: The product of the actual finite pairing-preserving Isom torsors.
- `TauCeti.HilbertModular.torsionIsomTorsor_points`: Sections are precisely the two O-linear symplectic identifications.
- `TauCeti.HilbertModular.torsionIsomTorsor_baseChange`: The torsor pulls back with V_i and their actual pairing targets.
- `TauCeti.HilbertModular.torsionIsomTorsor_cocycle`: A splitting-field frame gives the cocycleσ↦frame⁻¹σ(frame), and changing the frame gives a cohomologous cocycle.
- `TauCeti.HilbertModular.torsionIsomTorsor_ext`: Two sections of the simultaneous Isom torsor agree if both underlying O/ℓ_i O-linear maps agree; pairing-preservation proofs add no extra data.

**Unit tests.**

- `TauCeti.HilbertModular.torsionTorsor_trivial`: For the standard paired modules with fixed frames, the torsor has a rational section and the twist is untwisted.
- `TauCeti.HilbertModular.torsionTorsor_determinant`: A two-dimensional representation whose determinant is not the required cyclotomic pairing character has no equivariant paired Isom section.
- `TauCeti.HilbertModular.torsionTorsor_coboundary`: Changing both splitting frames by group elements leaves the descended twist canonically isomorphic.

**Prerequisites.** [H1/linear-weil-pairing](#h1-linear-weil-pairing), [H4/pairing-multiplier](#h4-pairing-multiplier), `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Sources.** [TAYLOR02](#source-taylor02) §1, p.13, simultaneous torsion moduli.


<a id="h6-simultaneous-torsion-twist"></a>

### Twisted Hilbert torsion moduli

`H6/simultaneous-torsion-twist` · construction. Twist the fine paired full ℓ₁/ℓ₂ Hilbert moduli and its universal HBAV by the inverse action of the actual paired torsion Isom torsor. The descended K-space classifies (A, ι, λ, μ_N, α₁, α₂) when the Hilbert tame marking is retained, and (A, ι, λ, α₁, α₂) when full torsion level itself supplies the fine marking. In both cases α_i:V_i≅A∨[ℓ_i] preserves the c d⁻¹-valued pairing. Over a splitting field it is isomorphic to the untwisted paired full-level space. This construction uses effective finite noncommutative descent, not the commutative Γ-only torsor-twist node of R09.4.

**API.**

- `TauCeti.HilbertModular.TwistedHilbertTorsionModuli`: The descended simultaneous paired torsion moduli space.
- `TauCeti.HilbertModular.twistedHilbertModuli_points`: T-points correspond to the stipulated HBAV and pairedα_i data.
- `TauCeti.HilbertModular.twistedHilbertModuli_split`: A splitting field and chosen paired frames identify the twist with the untwisted full-level moduli.
- `TauCeti.HilbertModular.twistedHilbertModuli_universal`: The fine universal HBAV descends through the verified cocycle and pulls back to the untwisted family.

**Unit tests.**

- `TauCeti.HilbertModular.twist_trivial`: The trivial framed torsor yields the original fine moduli and family.
- `TauCeti.HilbertModular.twist_pairing`: An unpaired abstract GL₂ torsor can mix Weil-pairing components and is not accepted as this twist.
- `TauCeti.HilbertModular.twist_frame_change`: A cohomologous frame cocycle yields an isomorphism preserving the universal moduli interpretation.

**Prerequisites.** [H6/torsion-isom-torsor](#h6-torsion-isom-torsor), [H4/hybrid-full-level](#h4-hybrid-full-level), [H4/geometric-full-level](#h4-geometric-full-level), `AlgebraicModuliForArithmeticGeometry:R09.3`, `AlgebraicGeometry.Scheme`, `PELModuli:M1/char-zero-adelic-moduli`, `PELModuli:M2/representability`, `PELModuli:M3/algebraization-of-components`.

**Sources.** [TAYLOR02](#source-taylor02) §1, p.13, moduli quintuple and smoothness.


<a id="h6-twisted-component-descent"></a>

### Selected component descent and irreducibility

`H6/twisted-component-descent` · theorem. Choose a geometric paired-multiplier and narrow-class component of the twisted full-level variety. Its label has a finite Galois orbit, so the component descends to its finite field of definition K_C; it descends to K when that label is G_K-fixed. The descended component is smooth of dimension g and geometrically irreducible, and the fine universal HBAV restricts to it. Construct an ample line on the untwisted characteristic-zero fine PEL variety from its polarized moduli embedding. For descent across a finite splitting field, tensor the conjugates of that ample line and use its canonical permutation descent datum. This proves that the component is a quasi-projective K_C-scheme. A point over a splitting field alone does not show that the component label is G_K-fixed.

**Prerequisites.** [H6/simultaneous-torsion-twist](#h6-simultaneous-torsion-twist), [H4/component-and-torsor-comparison](#h4-component-and-torsor-comparison), [H1/complex-hilbert-comparison](#h1-complex-hilbert-comparison), `AlgebraicModuliForArithmeticGeometry:R09.3`, `AbelianSchemesAndArithmeticModuli:A2`.

**Sources.** [DP94](#source-dp94) Corollary 2.4, p.64, quasi-projectivity in characteristic zero; [TAYLOR02](#source-taylor02) §1, p.13, fine simultaneous torsion moduli and connectedness.


<a id="h6-real-torsion-points"></a>

### Real torsion points with polarization signature

`H6/real-torsion-points` · theorem. At a real place of K_C, require the prescribed V_i to have the polarization-compatible odd involution: in a real split O/ℓ_i frame, complex conjugation has one+ and one− eigendirection and reverses the cyclotomic pairing. If the chosen component’s real signature is compatible, the real HBAV obtained from the ordered trace-polarized real analytic lattice gives paired torsion identifications and a real point on that component. The real local locus is a nonempty open around it. Even residual modules or a mismatched component are not covered.

**Prerequisites.** [H6/twisted-component-descent](#h6-twisted-component-descent), [H0/integral-trace-family](#h0-integral-trace-family), [H1/ordered-polarization-module](#h1-ordered-polarization-module), `AbelianSchemesAndArithmeticModuli:A5`.

**Sources.** [TAYLOR02](#source-taylor02) Lemma 1.4, p.12, real HBAV construction.


<a id="h6-hilbert-finite-local-points"></a>

### Finite local Hilbert torsion points

`H6/hilbert-finite-local-points` · theorem. For a finite placev of K_C, local nonemptiness is asserted only for explicitly constructed paired HBAVs in the selected component. Under Taylor§1’s ordinary-extension/CM-character hypotheses, construct them by the trace-polarized Tate lattice in the multiplicative case, or by the ordinary Honda–Tate HBAV followed by O-linear Serre–Tate lifting in the finite H_f extension class. At the second auxiliary characteristic use the separately specified ordinary construction. Matching both auxiliary torsion modules, pairing multipliers and component labels is part of the conclusion; arbitrary local Galois modules are not claimed realizable. Build the required structured ordinary Honda–Tate instance here: take Taylor’s ordinary Weil number α_v and its CM order, enlarge that order by the Serre tensor to O_N, transport the trace polarization so that Rosati is complex conjugation, and adjust the polarization ideal by an O_N-ideal quotient using the norm-class condition of Lemma 1.2. Check the resulting ordered O_M-polarization, both residue-prime torsion identifications, and the chosen component before invoking O_M-linear Serre–Tate lifting. The ordinary isogeny classification alone does not produce these integral structures. The local H_f class and its lift must satisfy Taylor’s actual CM-character and descent conditions.

**Prerequisites.** [H6/twisted-component-descent](#h6-twisted-component-descent), [H6/torsion-isom-torsor](#h6-torsion-isom-torsor), `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`.

**Sources.** [TAYLOR02](#source-taylor02) Lemmas 1.2–1.3, pp.9–12.


<a id="h6-allen-elliptic-twists"></a>

### Allen elliptic twists and Weil restriction

`H6/allen-elliptic-twists` · construction. Under Allen Assumption 7.2.6 (ℓ₂ splitting in the coefficient fields; the two residual images containing SL₂; ℓ₁,ℓ₂ unramified in F, outside each S_i, of good reduction for E, and >2m_i+3), put K=FF₁⁺ and fix r_i′ with determinant ε_{ℓ₂}^{−1}. Define Y_i/K to classify elliptic D with symplectic α₁:E[ℓ₁]≅D[ℓ₁] and α₂:V_{r_i′}∨≅D[ℓ₂]. This is the paired elliptic specialization of the simultaneous Isom-torsor twist; its selected geometric component is a smooth geometrically irreducible curve. The second residual module is dualized so its pairing has cyclotomic multiplier.

**API.**

- `TauCeti.HilbertModular.AllenEllipticTwist`: The symplectic elliptic moduli Y_i.
- `TauCeti.HilbertModular.allenElliptic_points`: Points are D with the two stipulated paired torsion isomorphisms.
- `TauCeti.HilbertModular.allenElliptic_split`: Over a splitting field it is the compatible Weil-multiplier component of the full elliptic level moduli.

**Unit tests.**

- `TauCeti.HilbertModular.allen_dual`: The undualized second module has inverse cyclotomic determinant and generally fails the pairing condition.
- `TauCeti.HilbertModular.allenElliptic_dimension`: Y_i has dimension 1.
- `TauCeti.HilbertModular.allenElliptic_trivial`: When both paired modules are torsion of one elliptic curve, that curve with identity maps gives a point.

**Prerequisites.** [H6/simultaneous-torsion-twist](#h6-simultaneous-torsion-twist), [H6/twisted-component-descent](#h6-twisted-component-descent), [H5/rational-modular-comparison](#h5-rational-modular-comparison), `AlgebraicGeometry.Scheme`.

**Sources.** [ALLEN23](#source-allen23) §7.2.5, published pp.1103–1106.


<a id="h6-allen-restriction-moduli"></a>

### Allen restriction of torsion moduli

`H6/allen-restriction-moduli` · construction. For K=FF₁⁺, k=F⁺F₁⁺ in Allen §7.2.5, define X_i=Res_{K/k}Y_i using A6’s quasi-projective finite-separable restriction of scalars. It is smooth and geometrically irreducible of dimension [K:k]=2. The universal family on Y_i gives an abelian-family restriction comparison over X_i. At a real place, X_i(ℝ)=Y_i(ℂ), so this CM case requires no real odd involution.

**API.**

- `TauCeti.HilbertModular.AllenRestrictionModuli`: X_i=Res_{K/k}Y_i.
- `TauCeti.HilbertModular.allenTwist_points`: X_i(L)=Y_i(K⊗_k L).
- `TauCeti.HilbertModular.allenTwist_split`: Its geometric base change is the product of the conjugate Y_i.
- `TauCeti.HilbertModular.allenRestriction_family`: The finite-étale A6 restriction of the pulled-back elliptic family has relative dimension [K:k].

**Unit tests.**

- `TauCeti.HilbertModular.allen_dimension`: For the quadratic CM extension, X_i has dimension 2.
- `TauCeti.HilbertModular.allen_real`: For a real place of k, K⊗_k ℝ≅ℂ and X_i(ℝ)=Y_i(ℂ).
- `TauCeti.HilbertModular.allen_restriction_split`: For K=k the restriction is Y_i itself.

**Prerequisites.** [H6/allen-elliptic-twists](#h6-allen-elliptic-twists), `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`, `AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes`, `AlgebraicGeometry.Scheme`.

**Sources.** [ALLEN23](#source-allen23) §7.2.5, published pp.1103–1106.


<a id="h6-allen-finite-local-points"></a>

### Allen finite local elliptic points

`H6/allen-finite-local-points` · theorem. Retain Allen’s auxiliary-prime and local finite-flat hypotheses. Above L₀∪{ℓ₁}, use E after a finite unramified extension whose Frobenius powers match the two paired residual modules. Above ℓ₂, when the residual dual is the prescribed supersingular finite-flat type or a peu-ramifié ordinary extension, construct a good-reduction D after a finite unramified extension and pair both torsion identifications. In the ordinary case lift the negative residual extension class using Lemma 7.2.2 and Serre–Tate. For supersingular D descended from 𝔽_{ℓ₂}, Frobenius over k(w) uses its residue degree: its squared scalar is(−ℓ₂)^{[k(w):𝔽_{ℓ₂}]}, not universally −ℓ₂.

**Prerequisites.** [H6/allen-elliptic-twists](#h6-allen-elliptic-twists), `AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`, [H6/allen-restriction-moduli](#h6-allen-restriction-moduli).

**Sources.** [ALLEN23](#source-allen23) §7.2.5, published pp.1104–1105; Lemma 7.2.2, published pp.1098–1099; [ALLEN23](#source-allen23) Lemma 7.1.8(1), pp.1091–1092, with ℤ_l coefficients and unramified base; the connected–étale refinement is on p.1105.


<a id="h6-moret-bailly-input-export"></a>

### Geometric and local input export

`H6/moret-bailly-input-export` · application. Supply for potential modularity the selected smooth geometrically irreducible quasi-projective K_C-scheme, its dimension, field of definition, fine universal family and all constructed nonempty real/finite local opens with their exact local extension and reduction conditions. In the Allen case export X_i overk and the corresponding Weil-restriction family, with dimension[K:k]. Moret–Bailly is a downstream theorem consuming these witnesses; it is not a prerequisite proving their existence.

**Prerequisites.** [H6/real-torsion-points](#h6-real-torsion-points), [H6/hilbert-finite-local-points](#h6-hilbert-finite-local-points), [H6/allen-finite-local-points](#h6-allen-finite-local-points), [H6/allen-restriction-moduli](#h6-allen-restriction-moduli).

**Sources.** [ALLEN23](#source-allen23) §7.2.5, published pp.1103–1106.


## R18.1 — Quaternionic canonical curves and the PEL bridge

Use the existing quaternion algebra, Shimura datum and canonical-model theories. Identify the one-real-split datum and its reflex field, and construct the auxiliary CM bridge without confusing it with a moduli interpretation of the original group.


<a id="r18-1-quaternionic-datum"></a>

### One-real-split quaternionic datum

`R18.1/quaternionic-datum` · construction. Given a quaternion F-algebra B split at the specified real embedding τ and ramified at all other real embeddings, form G_B=Res_{F/ℚ}B× on the existing quaternion and restriction-of-scalars carriers. Set h_B(z)=([[x, y],[−y, x]]⁻¹,1,…,1) forz=x+iy under B_τ≅M₂(ℝ). Its full conjugacy class is H^±. Verify D4’s SV1–SV3; its real central weight need not be ℚ-rational when[F:ℚ]>1, which D4 treats as a separate predicate. A totally definite B yields a finite class set in R18.3 instead.

**API.**

- `TauCeti.HilbertModular.QuaternionicShimuraDatum`: The D4 datum with one specified real split factor and the displayedh.
- `TauCeti.HilbertModular.quaternionicDatum_domain`: Its conjugacy domain is H^± and its connected domain is H.
- `TauCeti.HilbertModular.quaternionicDatum_splittingChange`: Changing the real matrix splitting conjugatesh and yields the same datum class.
- `TauCeti.HilbertModular.quaternionicDatum_adjoint`: The adjoint real group is PGL₂(ℝ) times compact quaternionic projective groups.

**Unit tests.**

- `TauCeti.HilbertModular.quaternion_Q_split`: For B=M₂(ℚ), the complex domain is the modular H^± domain.
- `TauCeti.HilbertModular.quaternion_definite`: A totally definite algebra with no chosen split real place does not produce this curve datum.
- `TauCeti.HilbertModular.quaternion_dimension`: For degreeg>1 with exactly one real split factor the domain is still one-dimensional.

**Prerequisites.** `ShimuraData:D4/shimura-datum`, `ShimuraData:D2/cartan-adjoint-criterion`, `ReductiveGroupsPartII:RG2.0a`, [Tau Ceti QuadraticFormInvariants, layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion), `AlgebraicGeometry.Scheme`.

**Sources.** [YZ18](#source-yz18) §4.1, p.561, displayedh and uniformization.


<a id="r18-1-quaternionic-reflex-dimension"></a>

### Quaternionic reflex field and dimension

`R18.1/quaternionic-reflex-dimension` · theorem. For the one-real-split quaternionic datum, the reflex field is τ(F)⊂ℂ and the Shimura variety has complex dimension 1. The cocharacter type is nontrivial only at τ, so its Galois stabilizer fixes that embedding. This differs from the Hilbert datum’s reflex field ℚ and from the auxiliary PEL bridge field F′, which generally only contains τ(F).

**Prerequisites.** [R18.1/quaternionic-datum](#r18-1-quaternionic-datum), `ShimuraData:D3/cocharacter-class`, `ShimuraData:D3/reflex-field`.

**Sources.** [YZ18](#source-yz18) §4.1, p.561, canonical curves over F; compare Proposition 3.1, p.551.


<a id="r18-1-canonical-quaternionic-curve"></a>

### Canonical quaternionic curve and uniformization

`R18.1/canonical-quaternionic-curve` · construction. For compact open U⊂G_B(A_f), apply the general canonical-model theory at the datum’s reflex field τ(F), obtaining Sh_U(G_B, X_B). Its complex points are G_B(ℚ)\(H^±×G_B(A_f)/U). Level and datum maps are the V8 maps with their effective-kernel hypotheses. The curve is proper when B is division; the split rational case is the nonproper modular curve and obtains cusps from R12.2. No general abelian moduli interpretation of this exact G_B is asserted.

**API.**

- `TauCeti.HilbertModular.QuaternionicShimuraCurve`: The canonical finite-level curve over τ(F).
- `TauCeti.HilbertModular.quaternionicCurve_complex`: Its complex analytic space is the displayed double-coset quotient.
- `TauCeti.HilbertModular.quaternionicCurve_changeLevel`: For U′⊂U the canonical level map commutes with Hecke maps and complex uniformization.
- `TauCeti.HilbertModular.quaternionicCurve_splitQ`: For F=ℚ, B=M₂(ℚ), matching levels identify it with R12.2’s modular curve.

**Unit tests.**

- `TauCeti.HilbertModular.curve_Q_split`: The split rational curve is noncompact before modular compactification.
- `TauCeti.HilbertModular.curve_Q_division`: An indefinite quaternion algebra over ℚ ramified at two finite primes yields a compact curve.
- `TauCeti.HilbertModular.curve_definite`: The totally definite datum is not passed to this one-dimensional constructor.

**Prerequisites.** [R18.1/quaternionic-datum](#r18-1-quaternionic-datum), [R18.1/quaternionic-reflex-dimension](#r18-1-quaternionic-reflex-dimension), `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8`, `ModularCurvesPartII:R12.2`, `AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact`, `AlgebraicGeometry.Scheme`.

**Sources.** [YZ18](#source-yz18) §4.1, p.561, complex uniformization and compactness.


<a id="r18-1-quaternionic-effective-stabilizers"></a>

### Quaternionic central kernel and small levels

`R18.1/quaternionic-effective-stabilizers` · theorem. At finite complex level, quotient Γ_g=B_+×∩g Ug⁻¹ by its rational scalar subgroup before measuring freeness on H. On the adelic inverse tower the ineffective central subgroup is the closure of F× in B_f×; it is not in general the discrete subgroup F×. For the compact division case and U⊂(1+NÔ_B)× with N≥3, the effective Γ_g acts freely and each compact connected component has genus≥2. No genus≥2 conclusion is applied to the noncompact split rational curve.

**Prerequisites.** [R18.1/canonical-quaternionic-curve](#r18-1-canonical-quaternionic-curve), `ReductiveGroupsPartII:RG2.0`, `ReductiveGroupsPartII:RG2.3`, `ShimuraVarieties:V8/finite-level-maps`.

**Sources.** [YZ18](#source-yz18) §4.1, pp.561–562 and Proposition 4.1.


<a id="r18-1-yz-bridge-groups"></a>

### Yuan–Zhang PEL bridge groups

`R18.1/yz-bridge-groups` · definition. Choose a quadratic CM extension E/F and nearby CM types Φ₁, Φ₂ differing at τ. Define G″=Res_{F/ℚ}(B××_{F×}E×), quotienting by(a⁻¹, a). Its derived group is Res B¹; ν(b, e)=(Nrd(b) eē, e/ē) identifies its derived quotient with Res F××Res E¹. Define G′ by ν₁ lying in diagonal G_m. Lift the datum withh_E(z)=(1, z⁻¹,…, z⁻¹). The bridge is auxiliary; it does not redefine the quaternionic datum.

**API.**

- `TauCeti.HilbertModular.YuanZhangBridgeGroups`: The central quotient G″ and scalar ν₁ subgroup G′ on imported group carriers.
- `TauCeti.HilbertModular.yzBridge_norm`: ν₁=Nrd(b) eē and ν₂=e/ē.
- `TauCeti.HilbertModular.yzBridge_derived`: Both bridge groups have derived group Res B¹.
- `TauCeti.HilbertModular.yzBridge_datum`: The liftedh′ is induced by(h_B, h_E) with the displayed CM-type convention.

**Unit tests.**

- `TauCeti.HilbertModular.bridge_kernel`: The pair(a⁻¹, a) has ν₁=1 and ν₂=1 for everya∈F×.
- `TauCeti.HilbertModular.bridge_scalar`: An arbitrary ν₁∈F× is allowed in G″ but not in G′ unless it is rational scalar.
- `TauCeti.HilbertModular.bridge_active`: At τ theh_E factor is 1; at all other CM factors it isz⁻¹.

**Prerequisites.** [R18.1/quaternionic-datum](#r18-1-quaternionic-datum), `ShimuraData:D4/datum-morphism`, `ReductiveGroupsPartII:RG2.0a`.

**Sources.** [YZ18](#source-yz18) §3.1, pp.550–551, defining G″, ν and G′.


<a id="r18-1-yz-bridge-reflex"></a>

### Weighted CM reflex field of the bridge

`R18.1/yz-bridge-reflex` · theorem. The reflex field F′ of(G′, h′), and likewise(G″, h″), is the field fixing the weighted CM type Φ₁+Φ₂=2(Φ₁∩Φ₂)+τ₁+τ₂. It contains τ(F), because a stabilizer fixes the unique weight-one pair and hence its restriction to F. Equality F′=F is not asserted. In Carayol’s special E=F(√λ), λ∈ℚ<0, with the displayed nearby types, F′=E in the chosen embedding.

**Prerequisites.** [R18.1/yz-bridge-groups](#r18-1-yz-bridge-groups), `ShimuraData:D3/reflex-field`, [R18.1/quaternionic-reflex-dimension](#r18-1-quaternionic-reflex-dimension).

**Sources.** [YZ18](#source-yz18) Proposition 3.1, p.551; special case§3.2, p.552; §5.1, p.571.


<a id="r18-1-yz-pel-instance"></a>

### Quaternionic PEL bridge instance

`R18.1/yz-pel-instance` · construction. Let B′=B⊗_FE, V′=B′ with its left B′ module structure. Choose invertible γ′ with γ̄′=−γ′ and with the required archimedean positivity. Set ψ′(v, w)=Tr_{E/ℚ}Trd_{B′/E}(γ′v w̄), and*=γ′⁻¹ℓ̄γ′. Specialize M0/M1 to obtain the G′ PEL moduli over F′: abelian schemes up to isogeny, B′ action with the full determinant condition determined by Φ₁+Φ₂, polarization with this Rosati involution, and U′-orbit of rational adelic similitude frames. An arbitrary anti-fixed γ′ need not be polarizing.

**API.**

- `TauCeti.HilbertModular.quaternionicPELInstance`: The M0/M1 specialization with B′, ψ′,* andh′.
- `TauCeti.HilbertModular.quaternionicPEL_form`: The exact reduced-trace formula for ψ′.
- `TauCeti.HilbertModular.quaternionicPEL_adjoint`: ψ′(ℓv, w)=ψ′(v,ℓ*w) with*=γ′⁻¹ℓ̄γ′.
- `TauCeti.HilbertModular.quaternionicPEL_moduli`: The four data of YZ p.552 are the corresponding rational PEL moduli objects at sufficiently small U′.

**Unit tests.**

- `TauCeti.HilbertModular.qpel_nonzero`: γ′=0 is excluded: it would make ψ′ degenerate.
- `TauCeti.HilbertModular.qpel_positive`: Replacing a polarizing γ′ by −γ′ reverses the archimedean sign and cannot pass the same positivity test.
- `TauCeti.HilbertModular.qpel_adjoint`: The left B′ action has exactly the stated Rosati involution, including the γ′ conjugation.

**Prerequisites.** [R18.1/yz-bridge-groups](#r18-1-yz-bridge-groups), [R18.1/yz-bridge-reflex](#r18-1-yz-bridge-reflex), `PELModuli:M0/integral-pel-datum`, `PELModuli:M0/determinant-condition`, `PELModuli:M1/char-zero-adelic-moduli`, `PELModuli:M3/complex-points`, `AlgebraicGeometry.Scheme`.

**Sources.** [YZ18](#source-yz18) §3.1, p.552, equations(3.1.1)–(3.1.2) and four moduli conditions.


<a id="r18-1-yz-component-comparison"></a>

### Quaternionic and PEL connected comparisons

`R18.1/yz-component-comparison` · comparison. After base change to an algebraic closure containing F′ and choosing compatible identity components, the quaternionic tower component X⁰ and the PEL component X′⁰ have the YZ Proposition 4.2 isomorphism, intertwining the identified effective positive-norm stabilizers through G_B→G″. For idealsn supported at p and prime tod_B, and sufficiently small U^p depending on n, there is a matching U′^p and a finite-level connected comparison X_{n, U^p}⁰≅X′_{n, U′^p}⁰. Its field and descent maps must be specified: the printed Proposition 4.4 says “over K” without defining K in this passage; construct its local field and descent datum from Carayol’s connected moduli comparison.

**Prerequisites.** [R18.1/canonical-quaternionic-curve](#r18-1-canonical-quaternionic-curve), [R18.1/quaternionic-effective-stabilizers](#r18-1-quaternionic-effective-stabilizers), [R18.1/yz-pel-instance](#r18-1-yz-pel-instance), `ShimuraVarieties:V8/finite-level-maps`.

**Sources.** [YZ18](#source-yz18) Propositions 4.2 and 4.4, p.563.


<a id="r18-1-yz-torus-bridge"></a>

### Torus bridge for quaternionic towers

`R18.1/yz-torus-bridge` · comparison. Let Ψ=Φ₁∩Φ₂ and Y/F′ be the zero-dimensional CM torus Shimura tower for Res_{E/ℚ}G_m withh_Ψ(z)=(1, z⁻¹,…, z⁻¹). The product datum map induces X×_FY→X″ over F′, and the tower comparison(X×_FY)/Δ(A_{F, f}×)≅X″ uses the twisted diagonalz↦(z, z⁻¹). At finite levels use the image U″ of U×J and the induced surjective map; an identical finite quotient description at all levels is not automatic. The Tate-module tensor and integral extensions belong to R18.2.

**Prerequisites.** [R18.1/yz-bridge-groups](#r18-1-yz-bridge-groups), [R18.1/yz-bridge-reflex](#r18-1-yz-bridge-reflex), [R18.1/canonical-quaternionic-curve](#r18-1-canonical-quaternionic-curve), `ShimuraData:D4/product-datum`, `ShimuraVarieties:V8/datum-functoriality`.

**Sources.** [YZ18](#source-yz18) §5.1, pp.571–572, product map and twisted diagonal quotient.


## Local Drinfeld geometry (R18.5)

Construct the analytic half-plane, its tree and its formal moduli interpretation before using them for integral quaternionic curves. K denotes a finite extension of ℚ_p throughout these local targets.


<a id="r18-5-drinfeld-half-plane"></a>

### Drinfeld upper half-plane

`R18.5/drinfeld-half-plane` · definition. The Drinfeld half-plane Ω_K is the rigid analytic open P¹_K\P¹(K), formed by removing the K-rational analytic points. Ω_K(C)=P¹(C)\P¹(K)=C\K in the affine chart with infinity removed. PGL₂(K) acts by homographies. This is not the algebraic complement of a Zariski-closed subscheme P¹(K). The affinoid exhaustion supplies its actual analytic open structure.

**API.**

- `DrinfeldHalfPlane.points`: Its C-points are P¹(C) minus P¹(K).
- `DrinfeldHalfPlane.homography`: PGL₂(K) acts through the usual fractional linear formula.
- `DrinfeldHalfPlane.affineChart`: The affine chart identifies the C-points with C minus K.
- `DrinfeldHalfPlane.baseChange`: Scalar extension identifies the Ω_K affinoid exhaustion with its C-exhaustion; it does not replace the removed set by P¹(C).

**Unit tests.**

- `DrinfeldHalfPlane.infinity`: The point infinity is excluded.
- `DrinfeldHalfPlane.quadraticPoint`: For z∈K₂\K in a quadratic extension, z lies in Ω_K(C).
- `DrinfeldHalfPlane.scalarAction`: Every central scalar in GL₂(K) acts trivially.
- `DrinfeldHalfPlane.algebraicComplement`: Removing finitely many K-rational points is insufficient: all P¹(K) must be excluded.

**Prerequisites.** `AdicSpacesPartII:R2/generic-fibre-functor-d`, `ReductiveGroupsPartII:RG2.2`.

**Sources.** [bc](#source-bc) Part I §§1–2, pp.49–53; [cdn20](#source-cdn20) §1.2, pp.12–13.


<a id="r18-5-affinoid-reduction"></a>

### Affinoid exhaustion and tree reduction

`R18.5/affinoid-reduction` · construction. For n≥1, set P_n=P¹(O_K/π^n) and U_n=P¹_C minus the union of open balls centered at P_n of radius |π|^n in the standard projective metric. These affinoids increase to Ω_C. The norm-class reduction r:Ω_C→|T_K| is PGL₂(K)-equivariant, and U_n is the inverse image of the closed tree ball of radius n about the standard vertex. Tree vertices are homothety classes of rank-two lattices; adjacent representatives satisfy πL⊊L′⊊L.

**API.**

- `DrinfeldExhaustion.affinoid`: Each U_n descends from an affinoid over K.
- `DrinfeldExhaustion.increasing`: U_n⊂U_{n+1} and their union is Ω_C.
- `DrinfeldExhaustion.treeBall`: U_n=r⁻¹ of the radius-n tree ball.
- `DrinfeldExhaustion.equivariant`: r(gz)=g r(z) for g∈PGL₂(K).

**Unit tests.**

- `DrinfeldExhaustion.residueTwo`: For q=2 a vertex has 3 incident edges.
- `DrinfeldExhaustion.firstSphere`: The radius-one tree ball has q+2 vertices.
- `DrinfeldExhaustion.centralScalar`: Scaling a lattice changes neither its vertex nor the reduction class.

**Prerequisites.** [R18.5/drinfeld-half-plane](#r18-5-drinfeld-half-plane), `ReductiveGroupsPartII:RG2.2`.

**Sources.** [cdn20](#source-cdn20) §1.2, p.12.


<a id="r18-5-drinfeld-formal-model"></a>

### Standard Drinfeld formal model

`R18.5/drinfeld-formal-model` · construction. Start with X₀=P¹_O_K and form X_n by blowing up every smooth k-rational special-fibre point of X_{n−1}; take the π-adic completions. Remove the smooth k-rational points from X_n to form the formal open Ũ_n. Then Ũ_n⊂Ũ_{n+1}, its generic fibre is U_n, K, and Ω̂=⋃Ũ_n is a flat regular semistable formal model of Ω_K. Its components are P¹_k indexed by tree vertices and its nodes by tree edges, locally xy=π. The full GL₂(K) action factors through PGL₂(K).

**API.**

- `DrinfeldFormalModel.genericFibre`: The generic fibre of Ω̂ is Ω_K.
- `DrinfeldFormalModel.nodeChart`: At an edge the completed local equation is xy=π.
- `DrinfeldFormalModel.components`: Special-fibre components and nodes identify with tree vertices and edges.
- `DrinfeldFormalModel.action`: The PGL₂(K) action extends the analytic homography action.

**Unit tests.**

- `DrinfeldFormalModel.centralComponent`: The initial vertex component is P¹_k with its q+1 rational attaching points.
- `DrinfeldFormalModel.qTwo`: For q=2 each component meets three branches in the full model.
- `DrinfeldFormalModel.ramifiedNode`: For e=2, xy=π′² is a singular total-space local ring; regularity is not preserved.

**Prerequisites.** [R18.5/affinoid-reduction](#r18-5-affinoid-reduction), `AdicSpacesPartII:R2/admissible-blow-up`, `AdicSpacesPartII:R2/generic-fibre-inverts-admissible-blow-ups`, [Tau Ceti StableReduction, layer-1-nodes-normalization-and-dual-graphs](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-1-nodes-normalization-and-dual-graphs).

**Sources.** [cdn20](#source-cdn20) §1.2, pp.12–13; [bc](#source-bc) Part I §3, pp.53–56.


<a id="r18-5-special-formal-moduli"></a>

### Special formal quaternionic moduli

`R18.5/special-formal-moduli` · definition. Let D/K be the local division quaternion algebra, O_D its maximal order containing the unramified quadratic order O₂. A strict special formal O_D-module X over a π-nilpotent O_Ǩ-scheme has O_K-height 4 and Lie(X) locally free of rank one over O₂⊗O_K O_S (hence rank two over O_S), with strict O_K action. Fix a framing Φ over kbar. The functor M_Dr(0) classifies (X, ρ) where ρ:X_Sbar→Φ_Sbar is an O_D-linear quasi-isogeny of relative height zero, modulo compatible isomorphism. M̃ allows heights 2m, m∈Z. BC uses the inverse framing arrow; invert it when comparing conventions.

**Hypotheses.** The strict formal-module and relative height carriers are supplied by R07.1–R07.2.

**API.**

- `SpecialFormalModuli.specialLie`: Lie is rank one over O₂⊗O_S.
- `SpecialFormalModuli.baseChange`: Pull back X and its special-fibre framing along every nilpotent-base map.
- `SpecialFormalModuli.framingAction`: A framing quasi-isogeny δ acts by δ∘ρ.
- `SpecialFormalModuli.heightComponents`: The arbitrary-height functor decomposes into the height-2m components.

**Unit tests.**

- `SpecialFormalModuli.heightZero`: The framing object with identity ρ lies in M_Dr(0).
- `SpecialFormalModuli.absoluteHeight`: When [K:Q_p]=2 the absolute p-height is 8.
- `SpecialFormalModuli.wrongLie`: An O_D-module whose Lie O₂ action has ranks (2,0) is not special.

**Prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Sources.** [bc](#source-bc) Part II §§2, 5.16, Definition 8.1, pp.79–84, 97–98, 107; [bz](#source-bz) §5, pp.38–39, (5.18)–(5.20).


<a id="r18-5-drinfeld-representability"></a>

### Drinfeld representability theorem

`R18.5/drinfeld-representability` · theorem. The special formal O_D-module functor M_Dr(0) is represented by Ω̂⊗O_K O_Ǩ. The equivalence is functorial on π-nilpotent bases, not just a bijection on geometric points, and identifies the universal special formal module. The group of framing quasi-isogenies is GL₂(K); on height zero the normalized action factors through PGL₂(K).

**Hypotheses.** Strict special modules, fixed frame and arrow convention as above.

**Prerequisites.** [R18.5/special-formal-moduli](#r18-5-special-formal-moduli), [R18.5/drinfeld-formal-model](#r18-5-drinfeld-formal-model), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Sources.** [bc](#source-bc) Part II Theorems 8.2,8.4, pp.107–109.


<a id="r18-5-height-and-descent"></a>

### Height action and Frobenius descent

`R18.5/height-and-descent` · comparison. Normalize arbitrary-height M̃_Dr≅M_Dr(0)×Z by a division uniformizer Π and its Hecke shift h(Π). Under BZ §5.9, δ∈GL₂(K) acts by (ω, m)↦(pr(δ) ω, m+ord_K det δ), where pr(δ)=h(Π)^{−ord det δ}δ on height zero. The product identification is independent of Π. For arithmetic descent use τ_c=Spf τ⁻¹ and the separate right Π⁻¹ Hecke translation in Theorem 6.7; do not conflate this translation with the normalized PGL₂ action.

**Prerequisites.** [R18.5/drinfeld-representability](#r18-5-drinfeld-representability).

**Sources.** [bz](#source-bz) Proposition 5.9, p.39; Theorem 6.7, p.49.


<a id="r18-5-arithmetic-quotient"></a>

### Arithmetic Drinfeld quotient

`R18.5/arithmetic-quotient` · construction. For B/F division split at τ only and division at v, let B̌ exchange invariants at {τ, v}, so it is totally definite and split at v. For compact level U with U_v=O_B, v× and small U^v, form B̌×\[(Ω̂⊗O_Fv O_Fv̌)×B_f×/U], using fixed away-v identifications; B̌_v× acts by homography and the local valuation component ord_v Nrd. Its finite component decomposition uses Γ_g={b∈B̌×∩gU^v g⁻¹:ord_v det b=0}, projected to PGL₂(F_v). These projected groups are discrete cocompact and become torsion-free with sufficiently small tame level.

**Hypotheses.** Global B/F, τ, v and level as stated; effective central quotient and finite component representatives fixed.

**API.**

- `ArithmeticDrinfeldQuotient.components`: Connected pieces are the specified projective Γ_g quotients after unramified base change.
- `ArithmeticDrinfeldQuotient.cocompact`: Each effective Γ_g is discrete and cocompact in PGL₂(F_v).
- `ArithmeticDrinfeldQuotient.changeLevel`: Nested tame levels give the corresponding finite quotient maps.
- `ArithmeticDrinfeldQuotient.algebraisation`: At sufficiently small level the proper formal curve algebraizes with the same generic fibre.

**Unit tests.**

- `ArithmeticDrinfeldQuotient.scalar`: Central scalar homographies are ineffective; their valuation effect is retained separately.
- `ArithmeticDrinfeldQuotient.node`: At free level an edge orbit has node chart xy=π.
- `ArithmeticDrinfeldQuotient.nonfree`: A quotient with a nontrivial effective vertex stabiliser cannot use the free-action regularity argument.

**Prerequisites.** [R18.5/height-and-descent](#r18-5-height-and-descent), `AdelicAlgebraicGroups:AA.3`, `AdelicAlgebraicGroups:AA.4`, `AdicSpacesPartII:R2`, [Tau Ceti StableReduction, layer-5-regular-and-minimal-models](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-5-regular-and-minimal-models).

**Sources.** [bz](#source-bz) §1, pp.1–3; §6, pp.45–50; [bc](#source-bc) Part III §§5.1–5.3, pp.139–142.


## Generic quaternionic PEL comparisons (R18.2)

Fix the auxiliary CM extension, trace lattice and effective central kernels. First compare the generic connected components and their torsion; this comparison supplies the input for arithmetic uniformisation.


<a id="r18-2-quaternion-pel-instance"></a>

### Quaternionic auxiliary PEL instance

`R18.2/quaternion-pel-instance` · construction. For E=F(√λ), λ<0 rational with p split in Q(√λ), specialize the shared PEL datum to B′=B⊗F E, V′=B′, ψ′(x, y)=Tr_E/Q Trd_B′/E(γ′xȳ), and involution b*=γ′⁻¹ b̄γ′. At p use O_B′, p=O_B, p*⊕O_B, p and the self-dual lattice O_B, p^∨⊕O_B, p. Verify the special O_B, v Lie condition and zero Lie component away from v. This full regular representation has abelian dimension 4[F:Q]; the Morita-reduced E-representation has dimension 2[F:Q]. Generic PEL moduli and representability are imports.

**Hypotheses.** γ′ chosen with the required positivity; sufficiently small tame level; integral trace/different factors retained.

**API.**

- `QuaternionPELInstance.tracePairing`: The specialized pairing is Tr_E/Q Trd(γ′xȳ), with its induced involution.
- `QuaternionPELInstance.selfDual`: The chosen p-lattice equals its pairing dual.
- `QuaternionPELInstance.lieCondition`: The active v-part is special of rank one over the unramified quadratic order, and the complementary Lie part is zero.
- `QuaternionPELInstance.genericComparison`: The represented generic curve is the auxiliary canonical X′ at the specified level.

**Unit tests.**

- `QuaternionPELInstance.regularDimension`: For F=Q the full B′ regular representation yields abelian dimension 4, not 2.
- `QuaternionPELInstance.moritaDimension`: For F=Q the Morita-reduced E-instance yields abelian dimension 2.
- `QuaternionPELInstance.dualLattice`: If the trace lattice is not self-dual, O_B, p⊕O_B, p fails the perfect-pairing test; replacing the first factor by its dual passes.

**Prerequisites.** `PELModuli:M0`, `PELModuli:M1`, `PELModuli:M2`, [R18.1/yz-pel-instance](#r18-1-yz-pel-instance), [R18.1/canonical-quaternionic-curve](#r18-1-canonical-quaternionic-curve).

**Sources.** [yz](#source-yz) §§3.1–3.2, pp.551–555.


<a id="r18-2-effective-small-level"></a>

### Effective small level and genus

`R18.2/effective-small-level` · theorem. If U⊂(1+N O_B)^× with integer N≥3, each geometric connected component of X_U has genus at least 2 and its arithmetic group acts freely on the upper half-plane after quotienting by F×. The effective tower action divides out the closure of F× in B_f×; for F≠Q the closure must not be replaced by the discrete rational centre.

**Hypotheses.** Compact curve hypothesis; principal level N≥3.

**Prerequisites.** [R18.1/quaternionic-effective-stabilizers](#r18-1-quaternionic-effective-stabilizers).

**Sources.** [yz](#source-yz) §4.1, pp.561–562, Proposition 4.1.


<a id="r18-2-quaternion-pdiv-tower"></a>

### Quaternionic p-divisible sheaf

`R18.2/quaternion-pdiv-tower` · definition. On the pro-level canonical curve define H_n=(B_p/O_B, p×X)/U_p(n), with U_p(n)=(1+n O_B, p)^× acting on the fibre by right multiplication and n supported above p. For each fixed torsion level m, shrink tame level until U_p(1)/U_p(m) acts freely; H_n[m] then descends as a finite étale O_B, p-module on that finite generic level. Do not assert a common finite tame level for the entire p-divisible group without proof.

**Hypotheses.** The effective free pro-level action and all fibre actions are specified; n may be 1.

**API.**

- `QuaternionPDiv.torsion`: H_n[m] has fibre m⁻¹O_B, p/O_B, p.
- `QuaternionPDiv.changeLevel`: Pullback along n′-level to n-level identifies H_n with H_n′.
- `QuaternionPDiv.splitMorita`: At split v, e11H_v identifies with Carayol E∞.
- `QuaternionPDiv.finiteDescent`: For each m a sufficiently small tame level supports its descended finite étale sheaf.

**Unit tests.**

- `QuaternionPDiv.unitTorsion`: H_n[O_F]=0.
- `QuaternionPDiv.splitRank`: For F_v=Q_p and B_v=M₂(Q_p), H_v[p] has geometric cardinality p^4; e11H_v[p] has cardinality p^2.
- `QuaternionPDiv.rightAction`: A local unit u sends a fibre element x to xu; replacing it by ux generally gives a different action.

**Prerequisites.** [R18.2/effective-small-level](#r18-2-effective-small-level), [R18.1/canonical-quaternionic-curve](#r18-1-canonical-quaternionic-curve), `PELModuli:M1`.

**Sources.** [yz](#source-yz) §4.1, p.562, p-divisible groups.


<a id="r18-2-connected-pel-comparison"></a>

### Connected quaternionic and PEL comparison

`R18.2/connected-pel-comparison` · comparison. Over F̄ identify the identity pro-components X⁰ and X′⁰ equivariantly for the norm-positive effective groups Δ̄≅Δ̄′. After quotient by O_B, p^1, whose identity components X₁⁰ and X′₁⁰ are defined over K, identify H|X₁⁰ with H′|X′₁⁰ with the transported effective group action. The comparison is of connected components with specified descent, not an isomorphism of the full unrelated global towers.

**Hypotheses.** The auxiliary split CM choice and effective central kernels are fixed.

**Prerequisites.** [R18.2/quaternion-pel-instance](#r18-2-quaternion-pel-instance), [R18.2/quaternion-pdiv-tower](#r18-2-quaternion-pdiv-tower), [R18.1/yz-component-comparison](#r18-1-yz-component-comparison).

**Sources.** [yz](#source-yz) §4.1, Propositions 4.2–4.3, pp.562–563; [carayol](#source-carayol) §§4.2 and 4.4, pp.183–188, connected canonical and auxiliary PEL curves.


<a id="r18-2-finite-pel-comparison"></a>

### Finite-level PEL comparison

`R18.2/finite-pel-comparison` · comparison. For n supported above p and coprime to d_B, and tame U^p sufficiently small depending on n, choose U′^p so that the connected n-level quaternionic and auxiliary PEL curves are isomorphic over K; the maps and coefficient sheaves agree under this isomorphism.

**Hypotheses.** n prime to the quaternion discriminant; smallness depends on n.

**Prerequisites.** [R18.2/connected-pel-comparison](#r18-2-connected-pel-comparison), [R18.1/yz-component-comparison](#r18-1-yz-component-comparison).

**Sources.** [yz](#source-yz) Proposition 4.4, pp.563–564.


## Arithmetic uniformisation and graph invariants (R18.5)

Apply the local Drinfeld construction with the exact global level and descent conventions. At a division prime the maximal-local-level quotient gives the semistable model; high-level generic-fibre uniformisation makes no unqualified integral semistability claim.


<a id="r18-5-totally-real-uniformisation"></a>

### Čerednik–Drinfeld uniformisation

`R18.5/totally-real-uniformisation` · theorem. For totally real F, B division split only at τ, v with B_v division, U_v=O_B, v× and the other p-adic factors and tame level as in BZ (6.31), the completion of the canonical integral Shimura curve over O_Eν identifies with B̌×\[(Ω̂_Fv⊗O_Fv O_Eν̌)×B_f×/U]. Here E=τ(F), E_ν=F_v. It is compatible with level transitions and Hecke operators at the permitted levels. With τ_c=Spf τ⁻¹, natural descent corresponds on the quotient to id_Ω×|Π⁻¹×τ_c. For small tame level the model is regular semistable and stable.

**Hypotheses.** All local factors match BZ (6.31); sufficiently small U^v for the final stable/regular claim.

**Prerequisites.** [R18.5/arithmetic-quotient](#r18-5-arithmetic-quotient), [R18.2/connected-pel-comparison](#r18-2-connected-pel-comparison), [R18.2/quaternion-pel-instance](#r18-2-quaternion-pel-instance), [R18.1/canonical-quaternionic-curve](#r18-1-canonical-quaternionic-curve), [R18.1/quaternionic-reflex-dimension](#r18-1-quaternionic-reflex-dimension), `PELModuli:M2`.

**Sources.** [bz](#source-bz) Theorem 6.7 and Corollary 6.8, pp.49–50.


<a id="r18-5-rational-uniformisation"></a>

### Rational-field comparison

`R18.5/rational-uniformisation` · comparison. For F=Q, a division quaternion algebra ramified at p and split at infinity, and maximal p-level with sufficiently small tame U^p, specialize the uniformisation to BC III Theorem 5.2. Match its left/right actions via the chosen algebra anti-isomorphism and its Frobenius–determinant twist with the BZ convention. The isomorphism also compares the universal special formal O_D modules. The split B=M₂(Q) modular curve is outside this division-prime assertion.

**Prerequisites.** [R18.5/totally-real-uniformisation](#r18-5-totally-real-uniformisation), `ModularCurvesPartII:R12.2`.

**Sources.** [bc](#source-bc) Part III Theorem 5.2 and comments, pp.140–142.


<a id="r18-5-tower-uniformisation"></a>

### All-level Drinfeld tower uniformisation

`R18.5/tower-uniformisation` · theorem. In CDN20 §5.2.1, E is totally real with E_𝔭=K; B̌ is split only at ∞₀ and division at 𝔭; B exchanges these invariants and is definite. With the fixed identifications of local and away-𝔭 groups, sufficiently small tame U and the exact congruence subgroups Ǧ_n at 𝔭, there are rigid isomorphisms Sh_n(U)^an≅B×\[M_n×B(A_f^𝔭)×/U] for every n≥1, compatible in n, U. M_n is the corresponding Drinfeld cover defined by the universal special formal module’s level structure. The theorem is on rigid generic fibres; it does not assert every high-level integral cover is semistable without alteration.

**Hypotheses.** Exact CDN20 tower convention Ǧ_n retained; U sufficiently small.

**Prerequisites.** [R18.5/drinfeld-representability](#r18-5-drinfeld-representability), [R18.5/totally-real-uniformisation](#r18-5-totally-real-uniformisation), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `PELModuli:M2`, [R18.2/quaternion-pdiv-tower](#r18-2-quaternion-pdiv-tower).

**Sources.** [cdn20](#source-cdn20) §5.2.1–5.2.2, pp.40–43, Proposition 5.4; [bc](#source-bc) Part III §5.5, Théorème (5.5), p.146.


<a id="r18-5-tree-dual-graph"></a>

### Quaternionic dual graph identification

`R18.5/tree-dual-graph` · comparison. At small maximal division-prime level, the geometric special-fibre dual graph is the finite disjoint union of Γ_g\T_K corresponding to the arithmetic quotient components. Vertices index rational components and edges index nodes, with loops and repeated edges retained in the quotient graph. The graph carries the Frobenius permutation induced by the Π⁻¹ descent, and Hecke/level maps are the transported adelic correspondences on vertex/edge orbits.

**Hypotheses.** Tame level sufficiently small for free local charts; generic dual multigraph supplied by StableReduction.

**Prerequisites.** [R18.5/totally-real-uniformisation](#r18-5-totally-real-uniformisation), [R18.5/drinfeld-formal-model](#r18-5-drinfeld-formal-model), [Tau Ceti StableReduction, layer-1-nodes-normalization-and-dual-graphs](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-1-nodes-normalization-and-dual-graphs).

**Sources.** [bc](#source-bc) Part III §5.4, pp.144–146 (graph); with the general monodromy theorem in R11.4; [yz](#source-yz) §8.3, ‘Multiplicity function: the superspecial case’, pp.619–620.


<a id="r18-5-character-monodromy"></a>

### Quaternionic character lattice and monodromy

`R18.5/character-monodromy` · comparison. For the Jacobian of a small-level semistable uniformized curve, identify the toric character lattice with H₁(Γ_g\T_K, Z), compatibly with Hecke and descent. Under the generic semistable-Jacobian monodromy theorem the pairing is the oriented cycle edge pairing Σ_e thickness(e) a_e b_e. At the unramified regular maximal-level model thickness is 1. Its cokernel presents the geometric component group using the dual lattice; Frobenius descent determines the arithmetic group.

**Hypotheses.** Generic semistable Jacobian/Néron and graph monodromy theorem supplied; connected component handled separately.

**Prerequisites.** [R18.5/tree-dual-graph](#r18-5-tree-dual-graph), `NeronModelsAndSemistableAbelianVarieties:R11.4`, [Tau Ceti StableReduction, layer-6-numerical-types-and-picard-torsion](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-6-numerical-types-and-picard-torsion), `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

**Sources.** [bc](#source-bc) Part III §5.4, pp.144–146 (graph); with the general monodromy theorem in R11.4.


## Integral quaternionic models and Hodge comparisons (R18.2)

Construct the model tower using split-prime deformation theory and the division-prime uniformisation. Extend level maps, lines and p-divisible groups with their fine/coarse distinctions, then prove the integral CM-bridge comparisons.


<a id="r18-2-carayol-split-model"></a>

### Carayol split-place integral model

`R18.2/carayol-split-model` · theorem. If B_v is split, U_v=GL₂(O_v) and tame level is sufficiently small, X_U has a proper smooth model over O_v with canonical generic fibre; at principal v^n level the normalised cover is the regular model representing the Drinfeld-basis level problem on the special one-dimensional height-two O_v-divisible group. Transition and tame Hecke maps extend over O_v. Higher v-level models are not asserted smooth or semistable.

**Hypotheses.** Carayol assumes [F:Q]>1; for Q use the modular or fake-elliptic supplier separately. The p-components away from v meet the source’s fixed-level hypotheses.

**Prerequisites.** [R18.2/finite-pel-comparison](#r18-2-finite-pel-comparison), `PELModuli:M2`, `PELModuli:M4`, [Tau Ceti StableReduction, layer-5-regular-and-minimal-models](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-5-regular-and-minimal-models).

**Sources.** [carayol](#source-carayol) §0.2, pp.151–154; §5.4, pp.191–192; §§6–7, pp.194–198; §9, pp.207–210.


<a id="r18-2-regular-model-tower"></a>

### Regular quaternionic model tower

`R18.2/regular-model-tower` · theorem. Let n be coprime to d_B and U^p⊂U^p(N) for an integer N≥3 prime to p. The minimal regular models X_{n, U^p}/O_v form a projective system extending canonical level maps. At v∤n the model is smooth if B_v splits and a semistable relative Mumford curve if B_v is division. The division case has maximal local level.

**Hypotheses.** Fine principal tame level as stated; no assertion for arbitrary level at d_B.

**Prerequisites.** [R18.2/effective-small-level](#r18-2-effective-small-level), [R18.2/carayol-split-model](#r18-2-carayol-split-model), [R18.5/totally-real-uniformisation](#r18-5-totally-real-uniformisation), [Tau Ceti StableReduction, layer-5-regular-and-minimal-models](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-5-regular-and-minimal-models).

**Sources.** [yz](#source-yz) §4.2, Theorem 4.5, pp.564–565.


<a id="r18-2-coarse-model"></a>

### Coarse quaternionic integral models

`R18.2/coarse-model` · theorem. For any decomposed compact open U maximal at each prime dividing d_B, construct X_U as the effective finite quotient of a sufficiently small normal fine model. It is normal, projective and flat over O_F, independent of the auxiliary prime used to rigidify level, and has canonical generic fibre. The quotient map is finite of degree the effective group order; it need not be flat everywhere or have regular target.

**Hypotheses.** Fine normal cover U′⊂U and effective group Ū/Ū′; maximality at d_B.

**Prerequisites.** [R18.2/regular-model-tower](#r18-2-regular-model-tower), `PELModuli:M4`, [Tau Ceti StableReduction, layer-0-relative-curves-and-extensions-of-dvrs](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-0-relative-curves-and-extensions-of-dvrs), `AlgebraicGeometry.Flat`.

**Sources.** [yz](#source-yz) §4.2, p.565 and Corollary 4.6.


<a id="r18-2-hecke-integral-extension"></a>

### Integral Hecke extensions

`R18.2/hecke-integral-extension` · theorem. For admissible levels maximal at d_B, a finite generic level map extends to the model tower. Tame Hecke correspondences whose local v-component preserves the specified model problem extend via the two finite maps from the common intersection level, with composition and generic-fibre agreement. Finite étaleness over O_v is asserted only when local p-level/lattice data are unchanged and the relevant PEL deformation criterion applies.

**Hypotheses.** Both source, target and intersection levels satisfy the model hypotheses. No unqualified extension of every p-isogeny as an étale map.

**Prerequisites.** [R18.2/regular-model-tower](#r18-2-regular-model-tower), [R18.2/coarse-model](#r18-2-coarse-model), `AdelicAlgebraicGroups:AA.4`.

**Sources.** [yz](#source-yz) Theorem 4.5 and Corollary 4.6, pp.564–566.


<a id="r18-2-qfactorial-model"></a>

### Q-factorial coarse models

`R18.2/qfactorial-model` · theorem. If L/F is finite and unramified at all finite places where B ramifies or U is not maximal, X_U⊗O_L is Q-factorial: every Weil divisor has a positive multiple Cartier. This does not assert regularity of the coarse model.

**Hypotheses.** U maximal at d_B; unramified base change at the bad set.

**Prerequisites.** [R18.2/coarse-model](#r18-2-coarse-model), [Tau Ceti StableReduction, layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces).

**Sources.** [yz](#source-yz) Corollary 4.6(2), p.566.


<a id="r18-2-arithmetic-hodge-line"></a>

### Quaternionic arithmetic Hodge line

`R18.2/arithmetic-hodge-line` · construction. On the normal Q-factorial compact curve model construct the hermitian rational line L_U, using invertible sheaves, the rational Picard group and norms under finite covers. It is compatible with admissible level pullback; at fine level and maximal U_v it is the relative dualizing line. At an archimedean point z its metric has ‖dz‖=2 Im z. On the coarse generic fibre, as a rational divisor class, L_U=ω_{X_U/F}+Σ_Q(1−1/e_Q)[Q], where e_Q is the effective ramification index. Construct the local extension as the norm of the fine dualizing line divided by the effective cover degree; prove independence of the cover and glue using two distinct auxiliary primes. The metric is part of this quaternionic line construction; intersection heights require additional arithmetic intersection theory.

**Hypotheses.** U maximal at d_B; fine models and rational line bundles supplied; e_Q is the effective ramification index.

**API.**

- `QuaternionHodgeLine.pullback`: Every admissible level map pulls L_target back to L_source.
- `QuaternionHodgeLine.fineDualizing`: At fine maximal local level L_U|O_v is the relative dualizing line.
- `QuaternionHodgeLine.coarseCorrection`: At branch point Q the correction coefficient is 1−1/e_Q.
- `QuaternionHodgeLine.metric`: Under uniformisation the differential dz has norm 2 Im z.
- `QuaternionHodgeLine.unique`: Any system of hermitian Q-line bundles on the models X_U (U maximal at d_B) that is compatible with level pullback, equals the relative dualizing line at fine level and maximal U_v, and has archimedean metric |dz|=2 Im z, is canonically isomorphic to L_U (YZ Theorem 4.7, uniqueness).

**Unit tests.**

- `QuaternionHodgeLine.unramified`: When every e_Q=1, the generic L_U equals ω.
- `QuaternionHodgeLine.indexTwo`: At an effective ramification point of index 2, the correction is [Q]/2.
- `QuaternionHodgeLine.imaginaryUnit`: At z=i, |dz|=2.

**Prerequisites.** [R18.2/qfactorial-model](#r18-2-qfactorial-model), [R18.2/hecke-integral-extension](#r18-2-hecke-integral-extension), [Tau Ceti AlgebraicVectorBundles, L0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicVectorBundles/README.md), [Tau Ceti JacobianChallenge, Layer A](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/JacobianChallenge/README.md).

**Sources.** [yz](#source-yz) §4.2, Theorem 4.7 and its proof, pp.567–568.


<a id="r18-2-integral-pdiv"></a>

### Integral quaternionic p-divisible group

`R18.2/integral-pdiv` · theorem. For n prime to d_B the generic H_n extends over the pro-limit of fine models over O_K. Its v-factor is a strict special formal O_B, v-module and the factors away from v are étale. The completed maximal-local-level model is the deformation space with the prescribed O_B-action; n=v^a n′ level classifies a Drinfeld v^a-basis and a full étale n′-level structure. At division v the allowed n has a=0.

**Hypotheses.** Strict O_v-module convention; active relative Lie rank 2 and O_v-height 4; absolute p-height 4[F_v:Q_p].

**Prerequisites.** [R18.2/quaternion-pdiv-tower](#r18-2-quaternion-pdiv-tower), [R18.2/regular-model-tower](#r18-2-regular-model-tower), [R18.5/drinfeld-representability](#r18-5-drinfeld-representability), `PELModuli:M1`.

**Sources.** [yz](#source-yz) Theorem 4.9, pp.568–569.


<a id="r18-2-integral-kodaira-spencer"></a>

### Integral quaternionic Kodaira–Spencer

`R18.2/integral-kodaira-spencer` · theorem. Using the strict O_v-relative crystal with rank-2 Hodge pieces W, W^t, set N=det W⊗det W^t. The determinant of the Kodaira–Spencer map identifies N with ω^{⊗2}(−d_B, v), where d_B, v=0 at split v and the reduced special fibre at division v. At ramified F_v/Q_p this target requires the relative/saturated filtration, not the raw τ-quotient of the absolute crystal.

**Hypotheses.** Fine regular finite-level models; maximal v-level; relative Dieudonné filtration and Cartier dual convention explicitly supplied.

**Prerequisites.** [R18.2/integral-pdiv](#r18-2-integral-pdiv), [R18.2/arithmetic-hodge-line](#r18-2-arithmetic-hodge-line), `CrystallineCohomology:CR.7`, [Tau Ceti StableReduction, layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/StableReduction/README.md#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces).

**Sources.** [yz](#source-yz) Theorem 4.10, pp.569–570.


<a id="r18-2-bridge-tate-comparison"></a>

### Torus bridge and Tate coefficients

`R18.2/bridge-tate-comparison` · comparison. Import the canonical torus Y and datum morphism (X×Y)/Δ(A_F, f×)≅X″ from R18.1, with Δ(z)=(z, z⁻¹) and effective rational-central closures. On X₁×Y₁, identify f₁*T(H″) with π₁*T(H)⊗O_E, p π₂*T(I), where I=(E_p/O_E, p×Y)/O_E, p×. The two centre actions cancel and H″|X′=H′.

**Hypotheses.** E embeds in B; the maximal order contains O_E, p, not merely its units; prescribed nearby CM types.

**Prerequisites.** [R18.2/quaternion-pdiv-tower](#r18-2-quaternion-pdiv-tower), [R18.1/yz-torus-bridge](#r18-1-yz-torus-bridge), `PELModuli:M1`.

**Sources.** [yz](#source-yz) §5.1, pp.571–573, Proposition 5.1.


<a id="r18-2-bridge-integral-model"></a>

### Integral torus-bridge model

`R18.2/bridge-integral-model` · theorem. Over K′, the completed maximal unramified reflex extension at v′, the bridge identifies X″₁ with the quotient of X₁×Y₁. Extending Y₁ by copies of Spec O_K′ transports the model of X₁ to a flat model of X″₁ and its open-and-closed X′₁ components. It is smooth if B_v splits and has stable Mumford fibres if B_v is division; ramified K′/K base change need not preserve regularity.

**Hypotheses.** The bridge’s effective quotient and descent data are supplied.

**Prerequisites.** [R18.2/bridge-tate-comparison](#r18-2-bridge-tate-comparison), [R18.2/regular-model-tower](#r18-2-regular-model-tower), `AdicSpacesPartII:R2/admissible-formal-scheme`.

**Sources.** [yz](#source-yz) §5.2, pp.573–574.


<a id="r18-2-bridge-point-extension"></a>

### Pointwise p-divisible extension

`R18.2/bridge-point-extension` · theorem. For a finite L/K′ and points y∈Y₁(L), x′∈X′₁(L), x″∈X″₁(L), the corresponding I_y, H′_x′, H″_x″ extend uniquely over O_L. For H″ use the Tate tensor, checking that at each embedding only one factor contributes weight −1 so that no weight −2 occurs. The p=2 case requires the integral Barsotti–Tate classification including the dyadic theorem. This is pointwise and does not by itself construct a global universal abelian scheme.

**Hypotheses.** Integral crystalline lattice functor and full faithfulness over O_L; a finite extension may be used to lift the bridge point.

**Prerequisites.** [R18.2/bridge-tate-comparison](#r18-2-bridge-tate-comparison), [R18.2/integral-pdiv](#r18-2-integral-pdiv), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Sources.** [yz](#source-yz) Proposition 5.2, p.574.


<a id="r18-2-bridge-filtered-crystal"></a>

### Filtered bridge crystal comparison

`R18.2/bridge-filtered-crystal` · comparison. The covariant filtered integral crystal of H″_x″ is the coefficient tensor of those of H_x and I_y over O_E, p, with base change to O_L. This is a structured crystalline tensor comparison supplied by the integral p-adic Hodge owner. On the τ-part the resulting Hodge-piece tensor formulas hold as direct-summand formulas when F_v/Q_p is unramified; at ramified v raw τ-quotients are not exact.

**Hypotheses.** Chosen integral crystalline functor, compatible tensor and Hodge filtration; local p=2 coverage supplied.

**Prerequisites.** [R18.2/bridge-point-extension](#r18-2-bridge-point-extension), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Sources.** [yz](#source-yz) Proposition 5.3 and discussion of Proposition 5.4, pp.574–575.


<a id="r18-2-bridge-determinant"></a>

### Bridge Hodge determinant cancellation

`R18.2/bridge-determinant` · theorem. At unramified F_v/Q_p, the rank-one torus Hodge factor twists W(H″) by its dual and W(H″^t) by itself. Thus det W(H″)⊗det W(H″^t)≅(det W(H)⊗det W(H^t))⊗O_L, as lattices in the generic square-canonical line. The same intended ramified-prime export must use a proved saturated determinant comparison; prove it using the saturated filtration and the integral determinant tensor law. No equality Hom_OE=Hom_OB or unrestricted OE-linear universal deformation is claimed.

**Hypotheses.** For the established direct-summand proof F_v/Q_p is unramified; construct the saturated ramified comparison separately.

**Prerequisites.** [R18.2/bridge-filtered-crystal](#r18-2-bridge-filtered-crystal), [R18.2/integral-kodaira-spencer](#r18-2-integral-kodaira-spencer).

**Sources.** [yz](#source-yz) Proposition 5.4 and Corollary 5.5, pp.575–576.


## R18.3 — Definite forms, transfer and auxiliary-level modules

Specialize AF.4–AF.5 to totally definite quaternions with the adelic central quotient. Separate geometry of class sets and auxiliary levels from conditional Frobenius control. All isotropy denominators, factorial obstructions and dyadic sign choices remain explicit.


<a id="r18-3-definite-class-set"></a>

### Definite quaternionic class set

`R18.3/definite-class-set` · definition. Specialize the existing double-coset quotient to C_U=D×\D_f×/(U A_F, f×). Its effective stabiliser at t is Γ_t=(U A_F, f×∩t⁻¹D×t)/F×. Use the quotient by the rational centre before asserting finiteness. Changing t by dtu z transports the stabiliser and its coefficient action by conjugation.

**API.**

- `DefiniteClassSet.quotient`: The carrier is DoubleCoset.Quotient D× (U A_F, f×).
- `DefiniteClassSet.finite`: For definite D and admissible U the class set is finite.
- `DefiniteClassSet.stabiliser`: At t the acting finite group is (UZ∩t⁻¹D×t)/F×.
- `DefiniteClassSet.changeRepresentative`: Equivalent representatives give conjugate stabilisers and canonically transported invariant modules.

**Unit tests.**

- `DefiniteClassSet.centralUnits`: For a real quadratic F, quotienting by F× removes its infinite central units; the unquotiented arithmetic group is not finite.
- `DefiniteClassSet.trivialOrbit`: A class with Γ_t=1 contributes exactly W, with no averaging denominator.
- `DefiniteClassSet.doubleCosetEquality`: Two representatives agree exactly when t′=dtu z for d∈D×, u∈U and z∈A_F, f×.

**Prerequisites.** `DoubleCoset.Quotient`, `DoubleCoset.eq`, `AdelicAlgebraicGroups:AA.5`.

**Sources.** [kw](#source-kw) §7 (opening), pp.57–59, display (5); §7.2, pp.61–62.


<a id="r18-3-quaternion-weight"></a>

### Quaternionic integral weights

`R18.3/quaternion-weight` · construction. Specialize AF.4 coefficient lattices to parallel weight k≥2: W_k=⊗_{σ:F→E} Sym^{k−2} O², using chosen splittings at v|p and the restricted U_p action. The centre acts by N_{F/Q}(z)^{k−2}; hence ψ near p must have inverse this action. For p=2 KW uses k=2. At a dyadic ramified division place use its discrete order-two quotient and one of the two sign characters, rather than a nonexistent GL₂ splitting.

**Hypotheses.** p unramified in F for the KW weight construction; D split at each active p-adic weight place.

**API.**

- `QuaternionWeight.rank`: Parallel weight k over a degree-d field has rank (k−1)^d.
- `QuaternionWeight.centralAction`: A scalar z acts by N(z)^{k−2}.
- `QuaternionWeight.baseChange`: Scalar extension commutes with the tensor of symmetric-power lattices.
- `QuaternionWeight.weightTwo`: At k=2 the lattice is the trivial rank-one O-representation.

**Unit tests.**

- `QuaternionWeight.weightTwoRank`: For any d, weight 2 has rank 1.
- `QuaternionWeight.quadraticWeightFour`: For d=2 and k=4 the rank is 9.
- `QuaternionWeight.factorialObstruction`: At p=2 and k=4 the natural pairing on Sym²(Z₂²) pairs X² with Y² to ±2 and XY with itself to ±1, so its Gram matrix has determinant ±4 and it is not perfect over Z₂.

**Prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.4`, `Representation`.

**Sources.** [kw](#source-kw) §7 (opening), pp.58–59; [taylor](#source-taylor) §1, pp.741–742.


<a id="r18-3-definite-specialisation"></a>

### Fixed-central-character algebraic forms

`R18.3/definite-specialisation` · comparison. Use the extended AF.5 carrier, not a new generic definition, for functions f:D_f×→W_A satisfying f(dgu)=τ(u)⁻¹f(g), f(gz)=ψ(z) f(g). Evaluation at class representatives identifies S_{τ, ψ}(U, A) with ⊕_{t∈C_U} W_A^{Γ_t}. This requires AF.5 to admit the adelic central quotient: a discrete-centre hypothesis alone does not cover O_F× of positive rank.

**Hypotheses.** A is an O-algebra; τ and ψ extend by scalars.

**Prerequisites.** [R18.3/definite-class-set](#r18-3-definite-class-set), [R18.3/quaternion-weight](#r18-3-quaternion-weight), `AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms`, `AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms-structure`.

**Sources.** [kw](#source-kw) §7 (opening), pp.58–59, display (5).


<a id="r18-3-neatness-base-change"></a>

### Neat-level reduction and base change

`R18.3/neatness-base-change` · theorem. If every effective Γ_t has order invertible in O, S_{τ, ψ}(U, O) is finite free and base change to every O-algebra A identifies S(U, O)⊗A with S(U, A). Thus reduction modulo the uniformizer is surjective. Taylor Lemma 1.1 ensures this when p>3 is unramified in F in its stated compact definite setup. For p=2 or 3 use a specified auxiliary torsion-free level, not the automatic p>3 argument.

**Hypotheses.** All stabiliser orders prime to p, or an explicitly constructed auxiliary effective torsion-free level.

**Prerequisites.** [R18.3/definite-specialisation](#r18-3-definite-specialisation), `Module.Free`, `Module.Finite`.

**Sources.** [taylor](#source-taylor) Lemma 1.1 and Corollary 1.2, pp.738–739; [kw](#source-kw) §8.2, p.73; §8.4, p.77.


<a id="r18-3-integral-pairing"></a>

### Perfect quaternionic pairing

`R18.3/integral-pairing` · theorem. For a perfect τ-pairing satisfying the determinant/central-character similitude law and prime-to-p effective stabilisers, the sum over class representatives, weighted by |Γ_t|⁻¹ and ψ(Nrd t)⁻¹, is a perfect O-pairing on S(U, O). For the standard differential pairing on Sym^{k−2}, require its factorial entries to be units (Taylor uses 2≤k≤p+1). The adjoint of [UgU] is ψ(Nrd g)[Ug⁻¹U] with the matching coefficient action.

**Hypotheses.** A perfect integral coefficient pairing and unit isotropy denominators; Taylor weight range only where invoked.

**Prerequisites.** [R18.3/neatness-base-change](#r18-3-neatness-base-change), `AutomorphicFormsOnReductiveGroups:AF.4`, `AutomorphicFormsOnReductiveGroups:AF.5`.

**Sources.** [taylor](#source-taylor) §1, pp.741–742.


<a id="r18-3-split-hecke-normalisation"></a>

### Split Hecke normalization

`R18.3/split-hecke-normalisation` · comparison. At v∉S with D_v=M₂(F_v), U_v=GL₂(O_v) and unramified coefficients, specialize AF.5 double-coset Hecke action: T_v=[U diag(π_v,1) U], S_v=[U diag(π_v, π_v) U]=ψ(π_v). The arithmetic Satake polynomial is X²−T_vX+q_vS_v. All change-of-level and commuting away-place actions are imported and checked with these local and coefficient conventions.

**Prerequisites.** [R18.3/definite-specialisation](#r18-3-definite-specialisation), `AutomorphicFormsOnReductiveGroups:AF.5`.

**Sources.** [kw](#source-kw) §7 (opening), p.59; §7.4, p.65.


<a id="r18-3-norm-branch"></a>

### Norm-factor forms and Eisenstein support

`R18.3/norm-branch` · theorem. For parallel weight 2 and compatible finite character, and equally for residual k-valued forms whose finite coefficient action is killed by the level, the forms factoring through Nrd are exactly the SL₂-invariant local branch under the strong-approximation hypotheses of KW §7.1. Their good-place Hecke eigenvalues give sums of characters, so their localization at a non-Eisenstein maximal ideal vanishes. Following KW §7, a maximal ideal m of T_ψ(U) is Eisenstein if T_v−2 and S_v−1 lie in m for all but finitely many places v split in a fixed finite abelian extension of F; non-Eisenstein means not Eisenstein. No Galois representation is constructed here.

**Hypotheses.** Weight 2; strong approximation for D¹ at a chosen split finite place.

**Prerequisites.** [R18.3/split-hecke-normalisation](#r18-3-split-hecke-normalisation), `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`, `AdelicAlgebraicGroups:AA.5`.

**Sources.** [kw](#source-kw) §7 (opening), pp.59–60: definition of Eisenstein maximal ideals and proof of Lemma 7.1.


<a id="r18-3-definite-degeneracy"></a>

### Definite Ihara degeneracy map

`R18.3/definite-degeneracy` · theorem. At a finite place w∉Σ (so D is split at w), with w added to S for the Hecke algebra, compact U with hyperspecial U_w and a finite-dimensional residual coefficient module W̄_τ over k on which U_w acts trivially, the degeneracy map S_{W̄_τ, ψ̄}(U, k)²→S_{W̄_τ, ψ̄}(U₀(w), k), (f₁, f₂)↦f₁+diag(1, π_w) f₂, has kernel supported on the norm-factor Eisenstein branch. Hence it is injective after non-Eisenstein localization (KW Lemma 7.1). This node supplies the residual input to KW Corollary 7.5; arbitrary coefficient-algebra base change and an integral indefinite Ihara theorem are not consequences of Lemma 7.1.

**Hypotheses.** F is totally real of even degree, p is unramified in F, and D/F is totally definite, with finite ramification set Σ as in KW §7. U is compact open. W̄_τ is a finite-dimensional continuous representation over the finite residue field k, with ψ̄:A_F, f×/F×→k× and τ̄(z)=ψ̄(z)⁻¹ on U∩A_F, f×. The residual action factors through a finite quotient. w∉Σ, U_w=GL₂(O_w), U_w acts trivially on W̄_τ, and the smaller level changes only its w-component to the Iwahori U₀(w). The Hecke algebra omits w.

**Prerequisites.** [R18.3/norm-branch](#r18-3-norm-branch), `AutomorphicFormsOnReductiveGroups:AF.5`.

**Sources.** [kw](#source-kw) §7 (opening), Lemma 7.1, p.60.


<a id="r18-3-definite-jl"></a>

### Definite Jacquet–Langlands realization

`R18.3/definite-jl` · comparison. Construct the quaternionic Jacquet–Langlands comparison in characteristic zero. For a division quaternion D/F, a fixed unitary central character and the non-one-dimensional discrete automorphic spectrum of D×, establish the bijection with cuspidal GL₂(A_F) representations whose components are square-integrable at every place where D ramifies. This includes both the totally definite case used here and the one-real-split case used in R18.4. Transfer is the identity at split places, is the local division-algebra/discrete-series correspondence at ramified finite places, and sends Sym^{k−2} at a real division place to holomorphic weight-k discrete series with the stated central twist. Prove agreement of split-place T_v, S_v using R18.3’s arithmetic normalization, inverse transfer and compatibility with twists. Remove χ∘Nrd before making the cuspidal comparison. For the finite-level definite module fix actual compatible realizations over a common finite coefficient field L; extend L if a Schur descent obstruction requires it. Equality of fields of rationality alone is insufficient. Establish multiplicity one and strong multiplicity one in the transferred spectrum, so a matching away-place cuspidal eigensystem determines its representation.

**Hypotheses.** Characteristic zero; exclude one-dimensional norm characters and fix embeddings/splittings.

**Prerequisites.** [R18.3/definite-specialisation](#r18-3-definite-specialisation), [R18.3/norm-branch](#r18-3-norm-branch), [R18.3/split-hecke-normalisation](#r18-3-split-hecke-normalisation), `AutomorphicFormsOnReductiveGroups:AF.4`, `AutomorphicFormsOnReductiveGroups:AF.5`, `AdelicAlgebraicGroups:AA.5`.

**Sources.** [BR10](#source-br10) §1.5, pp.5–7; §18.1, Theorem 18.1(a)–(b), pp.44–45, specialized to quaternion inner forms; [kw](#source-kw) §7, pp.59–60, finite-level application.


<a id="r18-3-isotropy-exponent"></a>

### Quaternionic isotropy exponent bound

`R18.3/isotropy-exponent` · theorem. For an auxiliary split place w∤p with hyperspecial local control, write N_w=|GL₂(k_w)|. The Sylow-p subgroups of all Γ_t have exponent dividing 2N_w in the compact-level case and 4N_w in KW’s allowed noncompact dyadic division-factor case. The norm maps to ((A_F, f×)²V∩F×)/(F×)²; this final map need not be surjective. Its target has exact sequence 0→O_F×/(O_F×)²→target→Cl(O_F)[2]→0.

**Hypotheses.** U, V and the distinguished w satisfy KW §7.2; in the noncompact case U⁰ is used for local compactness.

**Prerequisites.** [R18.3/definite-class-set](#r18-3-definite-class-set), `AdelicAlgebraicGroups:AA.5`.

**Sources.** [kw](#source-kw) §7.2, displays (6)–(7), pp.61–62.


<a id="r18-3-base-change-annihilator"></a>

### Base-changed local characters annihilate isotropy

`R18.3/base-change-annihilator` · theorem. Let F′/F be totally real with w split and impose KW Lemma 7.3 residue-field divisibility at the chosen Iwahori places. Choose χ₀ of p-power order equal to the p-part of 2p(4N_w), and χ=χ₀^{4N_w}. Then χ kills every effective stabiliser; it is nontrivial, and when p=2 has order 4. Its local action is through the ratio a/d of the triangular reduction. This statement concerns a given F′ and local characters; choosing global auxiliary fields is R23 work.

**Hypotheses.** The prescribed residue fields admit χ₀, and all isotropy exponents divide 4N_w.

**Prerequisites.** [R18.3/isotropy-exponent](#r18-3-isotropy-exponent).

**Sources.** [kw](#source-kw) §7.3, Lemma 7.3 and its proof, pp.62–63.


<a id="r18-3-tw-level"></a>

### Quaternionic Taylor–Wiles level

`R18.3/tw-level` · construction. For any finite Q away S with D split, q_v≡1 mod p^n, and fixed p-power N divisible by all Sylow-p isotropy exponents, let Δ′_v be the maximal p-quotient of k_v× and Δ_v=Δ′_v/Δ′_v[N]. Put U′_v=Iwahori and U_v=ker(a/d:U′_v→Δ_v), with unchanged factors away Q. Then U′_Q/U_Q=Δ_Q=∏_vΔ_v. The quotient kills N-torsion; it is not the quotient by Nth powers.

**Hypotheses.** N and Q are inputs; no existence or selection of Taylor–Wiles primes is claimed.

**API.**

- `QuaternionTWLevel.diamondGroup`: Δ_Q is the product of the maximal residue p-quotients modulo their N-torsion.
- `QuaternionTWLevel.levelQuotient`: U′_Q/U_Q≅Δ_Q via the product diagonal ratios.
- `QuaternionTWLevel.normal`: U_Q is open normal in U′_Q.
- `QuaternionTWLevel.changeQ`: For Q′⊂Q the level and diamond quotient forget the factors Q\Q′.

**Unit tests.**

- `QuaternionTWLevel.empty`: At Q=∅, Δ_Q=1 and U_Q=U.
- `QuaternionTWLevel.cyclicOrder`: For Δ′=C₈ and N=2, Δ=C₄.
- `QuaternionTWLevel.torsionNotPowers`: For Δ′=C₈ and N=2 the quotient by Nth powers has order 2, and is the wrong quotient.

**Prerequisites.** [R18.3/isotropy-exponent](#r18-3-isotropy-exponent), `QuotientGroup.mk`, `AutomorphicFormsOnReductiveGroups:AF.5`.

**Sources.** [kw](#source-kw) §7.4, p.63 (auxiliary levels before Lemma 7.4).


<a id="r18-3-tw-stabilisers"></a>

### Stabiliser equality at Taylor–Wiles level

`R18.3/tw-stabilisers` · theorem. For the level above, every character of Δ_Q kills the effective isotropy at U′_Q; the effective stabilisers at U_Q and U′_Q agree. Consequently Δ_Q acts freely on the class-set fibres C_{U_Q}→C_{U′_Q}. The invariant coefficient modules attached to all twists have equal O-rank; modulo the uniformizer their identifications are Hecke-equivariant, while arbitrary integral twist identifications need not be.

**Hypotheses.** N kills all p-isotropy exponents; Δ_Q is the quotient by Δ′[N].

**Prerequisites.** [R18.3/tw-level](#r18-3-tw-level), [R18.3/definite-specialisation](#r18-3-definite-specialisation).

**Sources.** [kw](#source-kw) §7.4, proof of Lemma 7.4, display (8), pp.64–65.


<a id="r18-3-tw-freeness"></a>

### Integral diamond freeness

`R18.3/tw-freeness` · theorem. Under KW Lemma 7.4’s coefficient and level hypotheses, S_{τ, ψ}(U_Q, O) is finite free over O[Δ_Q], of rank rank_O S_{τ, ψ}(U′_Q, O). On each free Δ_Q-orbit, the common finite-free invariant coefficient summand gives a regular O[Δ_Q] factor. The localized non-Eisenstein direct factors inherit freeness when the Hecke idempotent is Δ_Q-equivariant.

**Hypotheses.** Invariant coefficient summands finite free as established in the KW setting; an arbitrary representation without this condition is not covered.

**Prerequisites.** [R18.3/tw-stabilisers](#r18-3-tw-stabilisers), `MonoidAlgebra`, `Module.Free`.

**Sources.** [kw](#source-kw) §7.4, Lemma 7.4(2), p.64 (proof p.65).


<a id="r18-3-tw-localised-control"></a>

### Localized eigenroot and coinvariant control

`R18.3/tw-localised-control` · theorem. Let m be non-Eisenstein and let the specified residual system be unramified at each v∈Q, with q_v≡1 mod p and two distinct arithmetic Frobenius eigenvalues α_v, β_v. Retain a characteristic-zero local compatibility hypothesis at these auxiliary places: for every constituent in this localized module, its two-dimensional Galois representation has stable O-lattice with this residual system, and its Frobenius-semisimple Weil–Deligne parameter agrees with the normalized local GL₂ parameter. Establish the local Steinberg exclusion from these hypotheses: a Steinberg twist has Frobenius eigenvalue ratio q_v, hence equal residual eigenvalues when q_v≡1, contrary to α_v≠β_v. With that exclusion, choose the Hensel root A_v lifting α_v in X²−T_vX+q_vψ(π_v). Localization at U_v−α_v is finite free over O[Δ_Q], of rank rank_O S(U, O)_m, and its Δ_Q-coinvariants identify with S(U, O)_m through ξ_v(f)=A_v f−diag(1, π_v) f. The geometric freeness theorem alone makes no assertion that such Galois representations or compatibility data exist.

**Hypotheses.** Residual irreducibility/non-Eisenstein localization; q_v≡1 mod p, distinct α_v, β_v; actual characteristic-zero local–global compatibility supplied.

**Prerequisites.** [R18.3/tw-freeness](#r18-3-tw-freeness), [R18.3/definite-degeneracy](#r18-3-definite-degeneracy), [R18.3/definite-jl](#r18-3-definite-jl), [R18.3/split-hecke-normalisation](#r18-3-split-hecke-normalisation).

**Sources.** [kw](#source-kw) §7.4, construction of ξ_v and Corollary 7.5 with proof, pp.65–66.


<a id="r18-3-dyadic-norm-twist"></a>

### Dyadic reduced-norm twist

`R18.3/dyadic-norm-twist` · construction. For p=2 and a given quadratic character χ:G_n/2G_n→O×, split at S and infinity and unramified outside Q, with 2^n>N ensuring χ(Nrd U_Q)=1, define T_χf(g)=χ(Nrd g) f(g). This O-linear involution preserves the weight, level and central character because Nrd(z)=z². Existence of χ and selection of Q belong to R22/R04, not to this construction.

**Hypotheses.** p=2; χ²=1; prescribed χ is trivial on the level norms.

**API.**

- `DyadicNormTwist.apply`: T_χf(g)=χ(Nrd g) f(g).
- `DyadicNormTwist.involutive`: T_χ∘T_χ=id for χ²=1.
- `DyadicNormTwist.centralCharacter`: The central character remains ψ since χ(z²)=1.
- `DyadicNormTwist.reduction`: At residue characteristic two the reduction of T_χ is the identity.

**Unit tests.**

- `DyadicNormTwist.trivial`: The trivial χ gives the identity.
- `DyadicNormTwist.scalar`: A central scalar z contributes χ(z²)=1.
- `DyadicNormTwist.nonquadratic`: An order-four character with χ(z)=i changes the scalar action by −1 and does not preserve ψ.

**Prerequisites.** [R18.3/tw-level](#r18-3-tw-level), [R18.3/definite-specialisation](#r18-3-definite-specialisation), `LinearEquiv`.

**Sources.** [kw](#source-kw) §7.5, p.66, before Proposition 7.6.


<a id="r18-3-dyadic-hecke-twist"></a>

### Dyadic twist and Hecke transport

`R18.3/dyadic-hecke-twist` · theorem. For the norm twist, T_v and U_v are multiplied by χ(π_v), S_v is fixed, and (f|⟨h⟩)_χ=χ(h)⁻¹(f_χ|⟨h⟩). Since χ≡1 modulo the dyadic uniformizer, the residual maximal ideal is preserved. These equations transport the localized Taylor–Wiles modules and their ranks and coinvariants as in Proposition 7.6, conditional on the given auxiliary character.

**Hypotheses.** The dyadic norm-twist hypotheses and compatible local diamond lifts.

**Prerequisites.** [R18.3/dyadic-norm-twist](#r18-3-dyadic-norm-twist), [R18.3/split-hecke-normalisation](#r18-3-split-hecke-normalisation), [R18.3/tw-localised-control](#r18-3-tw-localised-control).

**Sources.** [kw](#source-kw) Proposition 7.6, pp.66–67.


<a id="r18-3-dyadic-sign-extension"></a>

### Dyadic division-place sign extensions

`R18.3/dyadic-sign-extension` · theorem. At a dyadic division place with U_v=D_v×, its maximal compact U_v⁰ has quotient U_vF_v×/(U_v⁰F_v×) of order two. For weight two, each choice of sign extends the compact coefficient action; over characteristic two the two reductions agree. With a set Σ₀ of such places there are 2^{|Σ₀|} sign choices. Compactness-based arguments must use U⁰ and retain this quotient. Prove the local quotient by using the reduced-norm valuation: O_D× is its valuation kernel, a division uniformizer has reduced-norm valuation one, and a scalar uniformizer has valuation two. Modulo F_v× only the parity remains. This calculation supplies the two local coefficient extensions without an appeal to a local GL₂ classification.

**Hypotheses.** KW noncompact variant allowed only at the specified dyadic division factors; weight two.

**Prerequisites.** [R18.3/quaternion-weight](#r18-3-quaternion-weight), [Tau Ceti QuadraticFormInvariants, Layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md).

**Sources.** [kw](#source-kw) §7 (opening), pp.58–59.


<a id="r18-3-residual-hecke-ideal"></a>

### Residual quaternionic Hecke ideal

`R18.3/residual-hecke-ideal` · construction. Let T^S=O[T_v, S_v:v∉S] be the abstract polynomial Hecke algebra. Given a continuous residual ρ̄:G_E→GL₂(k) unramified outside S, evaluate T_v at tr ρ̄(Frob_v), S_v at q_v⁻¹det ρ̄(Frob_v), and coefficients by O→k, with arithmetic Frobenius and q_v invertible in k. Define m_ρ̄ as the kernel. Surjectivity of coefficient reduction makes this a maximal ideal. For an acting quotient T^S/I, the evaluation factors precisely under the explicit hypothesis I⊆m_ρ̄; prove existence and uniqueness of that factorization using the ideal quotient. A given residual representation does not imply this inclusion, and this construction supplies no automorphic eigensystem existence theorem.

**Hypotheses.** For the CDN application p>2, local F=Q_p, global E even degree with p completely split, D₀ definite and finite-unramified; keep E distinct from the earlier auxiliary CM field. q_v is a unit in k; arithmetic Frobenius convention fixed.

**API.**

- `ResidualHeckeIdeal.evalT`: T_v evaluates to tr ρ̄(Frob_v).
- `ResidualHeckeIdeal.evalS`: S_v evaluates to q_v⁻¹ det ρ̄(Frob_v).
- `ResidualHeckeIdeal.maximal`: Surjective O→k makes the evaluation kernel maximal.
- `ResidualHeckeIdeal.actingFactor`: For an acting quotient T^S/I with I⊆m_ρ̄, the abstract evaluation factors uniquely through that quotient.

**Unit tests.**

- `ResidualHeckeIdeal.normThree`: In k=F₇, q=3 and determinant=6 give S=2.
- `ResidualHeckeIdeal.scalarDeterminant`: The arithmetic polynomial has constant term qS=det ρ̄(Frob).
- `ResidualHeckeIdeal.nonsurjective`: The kernel of Z→Q is zero and not maximal; surjectivity cannot be dropped.

**Prerequisites.** [R18.3/split-hecke-normalisation](#r18-3-split-hecke-normalisation), `AutomorphicFormsOnReductiveGroups:AF.5`, `MvPolynomial.eval₂Hom`, `RingHom.ker`, `RingHom.ker_isMaximal_of_surjective`.

**Sources.** [cdn23](#source-cdn23) §4.1.3, pp.48–49.


## R18.4 — Coefficient cohomology and finite-level comparisons

Attach algebraic coefficient systems to compact curves and compare their cohomology and Hecke actions. Use the existing topological local-coefficient construction. Integral freeness and saturation require their own torsion and residual-vanishing hypotheses; a characteristic-zero transfer theorem does not supply them.


<a id="r18-4-quaternion-local-systems"></a>

### Quaternionic algebraic local systems

`R18.4/quaternion-local-systems` · construction. Specialize the shared automorphic local-system construction to X_U and an algebraic B×-representation W. On each complex component Γ\H, the Betti system is (H×W)/Γ; on the canonical curve the étale O/l^n systems descend the matching finite-level torsors, compatibly in n. Identify their pullbacks to the complex analytic curve using the fixed coefficient/dual convention. At split quaternionic p-level the rank-two Morita factor of H supplies the standard geometric representation of weight one. Parallel automorphic weight k uses its tensor of Sym^{k−2} constituents; automorphic weight two has the trivial rank-one coefficient system.

**Hypotheses.** O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

**API.**

- `QuaternionLocalSystem.betti`: On Γ\H the system is the Γ-associated W-bundle.
- `QuaternionLocalSystem.etaleReduction`: Reduction modulo l^n is the descended finite-level torsor coefficient system.
- `QuaternionLocalSystem.changeLevel`: Level pullback identifies the corresponding local systems.
- `QuaternionLocalSystem.trivial`: Trivial W gives the constant local system in both realizations.

**Unit tests.**

- `QuaternionLocalSystem.constant`: The trivial rank-one representation gives the constant O-system.
- `QuaternionLocalSystem.rank`: A rank-r lattice gives fibre rank r, not r times the covering degree.
- `QuaternionLocalSystem.monodromy`: On a loop acting by −1 on W, parallel transport is −1; the constant system is wrong when 2 is invertible.

**Prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.4/coefficient-lattices`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `TauCeti.LocalCoefficientSystem`, [R18.2/quaternion-pdiv-tower](#r18-2-quaternion-pdiv-tower).

**Sources.** [carayol](#source-carayol) §1.4, pp.159–160; §4.4, pp.186–188.


<a id="r18-4-finite-cohomology"></a>

### Quaternionic finite-level cohomology

`R18.4/finite-cohomology` · construction. Apply the imported cohomology functors to define M_U=H¹_et(X_U, Fbar, L_O) and M_U^B=H¹_B(X_U(C), L_O), with continuous G_F action on the étale side and finite O-modules. The good-place and change-level Hecke correspondences act by coefficient transport followed by pullback and trace. The Betti–étale comparison is Hecke-equivariant; integral O-freeness is a separate theorem, not part of the definition.

**Hypotheses.** O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

**API.**

- `QuaternionCohomology.hecke`: A correspondence acts by p₂,*∘coefficientTransport∘p₁*.
- `QuaternionCohomology.changeLevel`: Level pullback and trace compose with the degree on a finite étale cover.
- `QuaternionCohomology.comparison`: Betti–étale comparison intertwines the Hecke actions.
- `QuaternionCohomology.galoisCommutes`: G_F commutes with correspondences defined over F.

**Unit tests.**

- `QuaternionCohomology.genusTwo`: Constant rational coefficients on a connected genus-two curve give dimension 4.
- `QuaternionCohomology.identityCorrespondence`: The identity correspondence acts as the identity.
- `QuaternionCohomology.coverDegree`: For a finite étale cover of degree d, trace∘pullback=d on cohomology.

**Prerequisites.** [R18.4/quaternion-local-systems](#r18-4-quaternion-local-systems), [R18.2/hecke-integral-extension](#r18-2-hecke-integral-extension), `ClassicalAdicEtaleCohomology:H0`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `ClassicalAdicEtaleCohomology:H3`, `ClassicalAdicEtaleCohomology:H5`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`.

**Sources.** [cdn20](#source-cdn20) §5.2.1, proof of Proposition 5.2, pp.41–42.


<a id="r18-4-integral-cohomology-control"></a>

### Integral torsion and reduction criteria

`R18.4/integral-cohomology-control` · theorem. For a maximal ideal m of the good-place Hecke algebra, if H⁰(X, L_k)_m and H⁰(X, L_k∨(1))_m vanish, then the localized H¹(X, L_O)_m is finite free over O, H²(X, L_O)_m has no O-torsion, and H¹(X, L_O)_m⊗k→H¹(X, L_k)_m is an isomorphism. Proving these vanishings for the intended non-Eisenstein systems is an explicit quaternionic coefficient-system obligation; arbitrary non-Eisenstein language alone is not substituted for them.

**Hypotheses.** O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Generic integral coefficient long exact sequences, Poincaré duality, and compatible Hecke localization.

**Prerequisites.** [R18.4/finite-cohomology](#r18-4-finite-cohomology), `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H3`.

**Sources.** [cdn20](#source-cdn20) §5.2.1, p.41.


<a id="r18-4-cohomology-pairing"></a>

### Quaternionic cohomological duality

`R18.4/cohomology-pairing` · comparison. Specialize Poincaré duality to obtain the perfect rational pairing H¹(X, L_E)×H¹(X, L_E∨(1))→E. At integral level the duality is a derived duality; it gives a perfect O-pairing on localized H¹ only under the preceding torsion/vanishing criteria and a chosen perfect coefficient lattice pairing. Pullback is adjoint to trace, and Hecke adjoints reverse the correspondence with its coefficient similitude factor.

**Hypotheses.** O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

**Prerequisites.** [R18.4/integral-cohomology-control](#r18-4-integral-cohomology-control), `ClassicalAdicEtaleCohomology:H3`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`.

**Sources.** [cdn20](#source-cdn20) §5.2.1, pp.41–42.


<a id="r18-4-cohomological-eigenspaces"></a>

### Cohomological automorphic eigenspaces

`R18.4/cohomological-eigenspaces` · comparison. Over a splitting characteristic-zero field, identify the cuspidal Hecke eigenspaces of the algebraic coefficient H¹ of X_U with the automorphic representations cohomological at the split real place and of the specified algebraic type at the other real places. For trivial coefficients the split real component has weight-two discrete series. Galois action on the multiplicity space is retained, but identifying it with a two-dimensional ρ_π and proving local–global compatibility are additional Galois representation and local compatibility theorems.

**Hypotheses.** O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Characteristic zero; actual coefficient-field models; generic Matsushima/cohomological decomposition and strong multiplicity one imported.

**Prerequisites.** [R18.4/finite-cohomology](#r18-4-finite-cohomology), `ArithmeticLocallySymmetricSpaces:ALS.5`, [R18.3/definite-jl](#r18-3-definite-jl).

**Sources.** [cdn20](#source-cdn20) §5.2.1, pp.41–42, Proposition 5.2.


<a id="r18-4-definite-indefinite-comparison"></a>

### Definite and indefinite Jacquet–Langlands eigenspaces

`R18.4/definite-indefinite-comparison` · comparison. For quaternion algebras D⁰ and B with invariants exchanged at a finite place v and the designated real place, and a cuspidal GL₂ representation discrete series at every ramified place of either algebra, apply the two global JL correspondences. At levels transported away {v, τ}, identify their away-place Hecke eigensystems and multiplicity factors over actual common rational models. At v the split GL₂ representation and its division JL partner remain different carriers; the full definite functions and the full curve H¹ are not isomorphic.

**Hypotheses.** O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. The transfer domain and infinity weights match; actual common coefficient realizations as in R18.3/definite-jl.

**Prerequisites.** [R18.3/definite-jl](#r18-3-definite-jl), [R18.4/cohomological-eigenspaces](#r18-4-cohomological-eigenspaces), [R18.3/definite-jl](#r18-3-definite-jl).

**Sources.** [cdn20](#source-cdn20) §5.2.1, pp.40–42.


<a id="r18-4-cohomological-degeneracy"></a>

### Cohomological degeneracy maps

`R18.4/cohomological-degeneracy` · construction. At w with B split, hyperspecial level and coefficient system unramified at w, the two canonical maps X_{U₀(w)}→X_U induce δ=(δ₁*, δ₂*):M_U²→M_{U₀(w)}. Their trace maps give the dual degeneracy map. They commute with G_F and away-w Hecke operators; the pullback/trace composition matrix is obtained from the local double-coset computation with degree q_w+1. Integral injectivity and saturated image require an Ihara theorem with explicit hypotheses, and are not inferred from the definite Lemma 7.1.

**Hypotheses.** O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. The coefficient action extends to the local semigroup; the two level morphisms use a specified diag(1, π_w).

**API.**

- `QuaternionDegeneracy.pullback`: δ maps (a, b) to δ₁*a+δ₂*b with transported coefficients.
- `QuaternionDegeneracy.trace`: The reverse map is the pair of coefficient-compatible traces.
- `QuaternionDegeneracy.awayHecke`: Both maps intertwine all Hecke correspondences away w.
- `QuaternionDegeneracy.degree`: Each hyperspecial-to-Iwahori map has degree q_w+1.

**Unit tests.**

- `QuaternionDegeneracy.qTwo`: For residue field F₂ the covering degree is 3.
- `QuaternionDegeneracy.tracePullback`: The diagonal trace–pullback composition is q_w+1.
- `QuaternionDegeneracy.badPlace`: At a division place there is no hyperspecial GL₂-to-Iwahori map of this shape.

**Prerequisites.** [R18.4/finite-cohomology](#r18-4-finite-cohomology), [R18.3/split-hecke-normalisation](#r18-3-split-hecke-normalisation), `ArithmeticLocallySymmetricSpaces:ALS.3`.

**Sources.** [kw](#source-kw) §7, Lemma 7.1, p.60, definite analogue only; curve pullback and trace use the canonical level maps and proper-smooth cohomology functoriality.


<a id="r18-4-quaternion-purity"></a>

### Quaternionic coefficient purity

`R18.4/quaternion-purity` · theorem. At a finite good place away l, a specified algebraic projector on the auxiliary abelian scheme gives a rank-two lisse coefficient constituent pure of weight one. An algebraic symmetric/tensor coefficient system of total geometric weight r is pure of weight r; since X is proper smooth, H¹(X, L) is pure of weight r+1 for geometric Frobenius. The quaternionic rank-two constituent and its projector must be verified; an elliptic-family purity theorem alone is insufficient for this higher-dimensional auxiliary PEL family.

**Hypotheses.** O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Good smooth fibre; l invertible; compatible Frobenius-commuting projectors and actual pure coefficient constituents.

**Prerequisites.** [R18.4/quaternion-local-systems](#r18-4-quaternion-local-systems), `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`, `WeightsInEtaleCohomology:R34.5`.

**Sources.** [yz](#source-yz) §3.2, moduli problem F1, U′p, pp.553–554, the auxiliary family only; construct and verify the coefficient projector here; [DELIGNE80](#source-deligne80) §3.3, Theorem 3.3.1, p.204, and Corollaries 3.3.4–3.3.6, p.206, pure coefficients on a smooth proper curve.


<a id="r18-4-finite-level-descent"></a>

### Finite-level invariants and trace control

`R18.4/finite-level-descent` · theorem. For a finite effective étale Galois level cover X_{U′}→X_U with group Δ of order invertible in the coefficient ring and compatible local systems, pullback identifies H¹(X_U, L) with H¹(X_{U′}, L)^Δ and |Δ|⁻¹trace is its inverse on invariants. When p divides |Δ|, replace this assertion by the Hochschild–Serre spectral sequence and coefficient torsion terms; no unconditional integral invariants equality is asserted.

**Hypotheses.** O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used. Cover finite étale on the generic fibre and genuinely effective; |Δ| invertible for the displayed equality.

**Prerequisites.** [R18.4/finite-cohomology](#r18-4-finite-cohomology), [R18.2/effective-small-level](#r18-2-effective-small-level), `ClassicalAdicEtaleCohomology:H0`.

**Sources.** [yz](#source-yz) §4.2, construction of the coarse models, p.565.


## R18.6 — Interfaces for arithmetic applications

This layer introduces no additional definitions. Supply the canonical varieties and their fields,
finite levels and effective stabilizers from H1–H4 and R18.1; the model, Hodge-line and
torsion comparisons from R18.2; the definite coefficient modules, their actual isotropy
exponents and conditional auxiliary-level controls from R18.3; the integral coefficient
cohomology and saturation hypotheses from R18.4; and the arithmetic Drinfeld quotient,
descent action, graph and monodromy comparisons from R18.5. For potential modularity,
use H6's selected quasi-projective component, its field of definition, universal family
and the constructed real and finite local opens. The dimension in the Allen restriction
case is [K:k], whereas the Hilbert component has dimension [F:ℚ].

Each application carries the same prime, lattice, component and level hypotheses as
the construction it uses. The input does not include arbitrary local torsion realizability,
unconditional integral Ihara, an automatic ramified crystal splitting, a universal family
on every coarse quotient, or a proof of Moret–Bailly or modularity lifting. Sources:
[KW](#source-kw) §§7.4–7.5, pp.63–67;
[ALLEN23](#source-allen23) §7.2.5, published pp.1103–1106;
[CDN20](#source-cdn20) §§5.2.1–5.2.2, pp.40–43.


## References

Page numbers are printed article pages unless the entry specifies author or PDF pagination.
The two Yuan–Zhang keys refer to the same published article. Use the formulas
with the precise relative-crystal and descent conditions stated above. In ALLEN23,
Lemma 7.2.2 is on pp.1098–1099 and §7.2.5 on pp.1103–1106. The arXiv version numbers in the
Drinfeld and coefficient references are part of the citation.


<a id="source-aip16"></a>

- **AIP16.** Fabrizio Andreatta, Adrian Iovita and Vincent Pilloni, [The adic, cuspidal, Hilbert eigenvarieties](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf). Author version dated 16 May 2016.


<a id="source-allen23"></a>

- **ALLEN23.** Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, [Potential automorphy over CM fields](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals of Mathematics 197 (2023), 897–1113; published pagination.


<a id="source-bhw23"></a>

- **BHW23.** Christopher Birkbeck, Ben Heuer and Chris Williams, [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://www.numdam.org/item/10.5802/aif.3560.pdf). Annales de l’Institut Fourier 73 (2023), 1709–1794; published PDF.


<a id="source-br10"></a>

- **BR10.** Alexandru Ioan Badulescu, with an appendix by David Renard, [Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf). author preprint of Compositio Mathematica 146 (2010), 1115–1164; PDF page numbers.


<a id="source-deligne80"></a>

- **DELIGNE80.** Pierre Deligne, [La conjecture de Weil. II](https://www.numdam.org/item/PMIHES_1980__52__137_0/). Publications Mathématiques de l’IHÉS 52 (1980), 137–252.


<a id="source-diamond"></a>

- **DIAMOND.** Fred Diamond, [Geometric weight-shifting operators on Hilbert modular forms in characteristic p](https://arxiv.org/pdf/2011.14128v2). arXiv:2011.14128v2, 18 September 2021.


<a id="source-dimitrov"></a>

- **DIMITROV.** Mladen Dimitrov, [Compactifications arithmétiques des variétés de Hilbert et formes modulaires de Hilbert pour Γ₁(c,𝔫)](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf). author-hosted typeset text, printed pp.525–551.


<a id="source-dp94"></a>

- **DP94.** Pierre Deligne and Georg Pappas, [Singularités des espaces de modules de Hilbert, en les caractéristiques divisant le discriminant](https://www.numdam.org/item/CM_1994__90_1_59_0.pdf). Compositio Mathematica 90 (1994), 59–79.


<a id="source-taylor02"></a>

- **TAYLOR02.** Richard Taylor, [Remarks on a conjecture of Fontaine and Mazur](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf). Journal of the Institute of Mathematics of Jussieu 1 (2002), 1–19; author PDF.


<a id="source-yz18"></a>

- **YZ18.** Xinyi Yuan and Shou-Wu Zhang, [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Annals of Mathematics 187 (2018), 533–638; published PDF.


<a id="source-bc"></a>

- **bc.** Jean-François Boutot and Henri Carayol, [Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf). Astérisque 196–197 (1991), article pp.45–158; full-volume PDF.


<a id="source-bz"></a>

- **bz.** Jean-François Boutot and Thomas Zink, [On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1). arXiv:2212.06886v1, 13 December 2022 (text dated 15 December).


<a id="source-carayol"></a>

- **carayol.** Henri Carayol, [Sur la mauvaise réduction des courbes de Shimura](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf). Compositio Mathematica 59 (1986), 151–230; published scan.


<a id="source-cdn20"></a>

- **cdn20.** Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2). arXiv:1704.08928v2, 7 June 2018; source for JAMS 33 (2020), 311–362.


<a id="source-cdn23"></a>

- **cdn23.** Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, [Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://arxiv.org/pdf/2204.11214v2). arXiv:2204.11214v2; source for Forum of Mathematics Pi 11 (2023), e16.


<a id="source-kw"></a>

- **kw.** Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Author copy proofs.pdf, 98 pages, dated 30 May 2009; published Inventiones 178 (2009), 505–586.


<a id="source-taylor"></a>

- **taylor.** Richard Taylor, [On the Meromorphic Continuation of Degree Two L-Functions](https://ems.press/content/book-chapter-files/27484?nt=1). Documenta Mathematica Extra Volume Coates (2006), 729–779; revised 28 June 2006.


<a id="source-yz"></a>

- **yz.** Xinyi Yuan and Shou-Wu Zhang, [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf). Annals of Mathematics 187 (2018), 533–638; version of record.
