# R01.6 — Tate modules of elliptic curves and abelian varieties

This layer identifies the Galois action on the Tate realizations supplied by abelian geometry, compares it with native elliptic curve constructions, and exports its arithmetic consequences. The targets include finite division fields and isogenies, polarized determinant and real-place eigenspaces, good Frobenius polynomials, local Euler polynomials, coefficient components, full-GSp genericity, independence, connectedness and fixed-prime specialization.

The mathematical statements below are definitive. The accompanying suggested file gives typed interfaces against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Interfaces supplied by accepted lower-tier plans or by the newer current library are labelled as supplier fixtures there. The signature ledger identifies conditions the older pin cannot yet express. Every target remains an implementation specification.

## Objects, conventions and ownership

Fix a field K, an algebraic closure K̄ and G_K=Aut(K̄/K) with the Krull topology; restriction identifies this group with Gal(K^sep/K), including imperfect K. An abelian variety is the native proper geometrically integral commutative group scheme over Spec K. Its geometric points are sections over Spec K̄; their group structure is inherited from that scheme. A homomorphism acts covariantly on points and on Tate modules. In characteristic p, every Tate prime ℓ in a rank-2g assertion satisfies ℓ≠p. Dimension g is expressed by equality with g in the native extended dimension type, not by coercing an arbitrary infinite dimension to a natural number.

`AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `A3/torsion-divisibility`, `A3/polarized-weil-pairing` and `A4/etale-tate-module` own finite étale torsion, division compatibility, the inverse limit, its topology, its rank, finite quotients, maps, products and duality. `A4/realization-conventions` owns the geometric Betti/étale conventions. This layer owns the arithmetic identification of the Spec K fundamental-group action with actual G_K action and the resulting comparisons. `A6/characteristic-polynomial-on-tate-module` and `A6/trace-and-degree-on-a-subfield` own integral endomorphism polynomials and coefficient ranks; the good-place Frobenius comparison imports them.

Current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already has `TauCeti.TateModule`, its finite projections, scalar action, topology and linear maps, plus `WeierstrassCurve.tateModuleGaloisRepresentation` and `TauCeti.det_tateModuleGaloisRepresentation`. These are imports for an assembled package. Their presence at the current commit does not assert their presence at the older prototype pin. Existing EllipticCurves Layers 2–4 own the native torsion, finite-field and Tate-curve material; R01.6 supplies comparisons to the scheme realization. G7 owns general symplectic similitudes and algebraic monodromy objects. R01.3 owns elliptic Artin conductors and the prime-to-ℓ residual conductor comparison; R01.6 instantiates them on the actual Tate representation.

The pairing target is Z_ℓ(1), with cyclotomic Galois action. Scalar-valued matrices require a choice of generator of that rank-one module. The canonical elliptic polarization and Weil pairing use the same argument order as the native library. Milne AV I Example 13.3, pp. 58–59, gives a minus sign in the comparison with his displayed homology form; that sign must be carried through the chosen convention, not silently discarded. A polarization of degree divisible by ℓ need not give a perfect integral form, although its rational form is nondegenerate.

Arithmetic Frobenius acts on residue coordinates by q-power, where q is the size of the base residue field. Its action on V_ℓA is the geometric endomorphism π of the special fibre. Geometric Frobenius on V_ℓA is the inverse. On H¹=V_ℓA^∨, geometric Frobenius is the transpose of the arithmetic operator on V_ℓA. Consequently the local Euler polynomial is det(1−T Frob_geom | (V_ℓA^∨)^I), equivalently det(1−T Frob_arith | (V_ℓA)_I). Using primal invariants with arithmetic Frobenius gives the wrong answer for a split Tate curve.

Coefficient endomorphisms defined over K commute with G_K. Geometric endomorphisms over a larger field give a semilinear action over K. A rational coefficient field does not automatically preserve the integral lattice. Maximal-order λ reduction uses the coefficient prime λ, even when λ ramifies over ℓ. Full-GSp openness, independence inside individual images and Zariski connectedness are three separate properties.

## Field realization, finite torsion and isogenies

### Field Galois realization

Target `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`; proposed interface `fieldTateRep`.

For an abelian variety A/K and a prime ℓ invertible in K, identify the A4 geometric-fibre local system over Spec K with T_ℓA = lim A[ℓ^n](K̄), with transition [ℓ]. Its π₁ action becomes the actual coefficientwise G_K action. Define ρ_T on this lattice and ρ_V on Q_ℓ⊗T_ℓA. They are jointly continuous, free of rank 2g when dim A=g, and covariantly functorial. T̂A denotes the product of these imported lattices over primes invertible in K; in characteristic zero every prime occurs.

**Hypotheses.** A is the native proper geometrically integral group scheme; dim A=g is an equality in its extended dimension type. ℓ is prime and ℓ≠char K; K̄ is fixed.

**Construction or proof.**

1. Import the inverse limit, topology, rank, quotient and functoriality from A4, without constructing a competing carrier.
2. Use the equivalence between finite étale Spec K covers and continuous G_K sets to identify the local-system action with pullback of geometric sections.
3. Check all finite projections; continuity follows from finite discrete torsion, not merely continuity of each operator.
4. Extend scalars through R01.1; assemble the primewise product with its product topology.

**Needs.** `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `ArithmeticGaloisRepresentations:R01.1/continuous-representation`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`, `mathlib:Field.absoluteGaloisGroup`, `mathlib:Representation`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I §7, Remark 7.3, pp. 33–34; §10, pp. 44–45; [Rutger Noot, Abelian varieties—Galois representation and properties of ordinary reduction](https://www.numdam.org/article/CM_1995__97_1-2_161_0.pdf), §1.2, p. 163.

**API.**

- `fieldTateRep_toLevel` (compatibility): Projection of ρ_T(σ)x to level n equals σ acting on the projection of x.
- `fieldTateRep_jointContinuous` (structure): (σ,x)↦ρ_T(σ)x is continuous for the Krull and inverse-limit topologies.
- `fieldTateRep_map` (functoriality): For f:A→B defined over K, T_ℓf intertwines the two field actions.

**Unit tests.**

- `fieldTate_level_zero` (degenerate): The n=0 finite projection is the zero point.
- `fieldTate_identity_action` (computation): ρ_T(1)x=x on the actual lattice.
- `fieldTate_negation` (compatibility): T_ℓ[-1] acts as x↦−x and commutes with the Galois action.
- `fieldTate_elliptic_level_three` (computation): For the A1 realization of y²=x³−x−1 over Q, the level-one quotient of T₃ is a group with 9 elements, agreeing with the curve’s geometric 3-torsion.

**Uses.**

- `EllipticCurveModularity:R29.1`: Supplies the actual geometric lattice rather than an arbitrary stable lattice.
- `ClassicalSerreModularity:R27.1`: Identifies the residual representation with finite torsion.
- `FaltingsFinitenessAndIsogenyTheorems:R28.4`: Exports Hom-compatible Tate actions, without importing the isogeny theorem.

**Acceptance.** The action at every level is the action on actual geometric sections. For dimension zero the lattice is zero; no rank-2g assertion at ℓ=char K.

**Atlas planet:** Tate realization.

### Residual torsion comparison

Target `ArithmeticGaloisRepresentations:R01.6/finite-torsion-action`; proposed interface `finiteTorsionAction_equivariant`.

The canonical A4 quotient T_ℓA/ℓ^nT_ℓA ≅ A[ℓ^n](K̄) is G_K-equivariant. In particular the canonical residual representation is the action on A[ℓ]. For any G_K-stable Z_ℓ lattice Λ⊂V_ℓA, the semisimplifications of Λ/ℓΛ and A[ℓ] are isomorphic over F_ℓ; there is no assertion that the unsimplified reductions agree.

**Hypotheses.** A/K is abelian and ℓ≠char K. Λ is a full stable lattice in the same rational representation.

**Construction or proof.**

1. Combine the finite quotient from A4 with fieldTateRep_toLevel.
2. Apply R01.1 lattice independence to the canonical lattice and Λ.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I Remark 7.3 and §10, Lemmas 10.3–10.4, pp. 34, 44–45; [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, pp. 55–56.

**Acceptance.** Keep the distinction between canonical reduction and lattice-independent semisimplification. At n=0 both sides are zero.

### Division fields

Target `ArithmeticGaloisRepresentations:R01.6/division-field-interface`; proposed interface `divisionField`.

For m≥1 invertible in K, let H_m≤G_K be the kernel of the action on A[m](K̄). Define K(A[m]) to be the fixed intermediate field K̄^{H_m}. This finite Galois extension is the least field over which every geometric m-torsion point is rational. If m|n, K(A[m])⊂K(A[n]); the ℓ-power division field is their directed supremum, and the kernel of ρ_T is the intersection of the H_{ℓ^n}.

**Hypotheses.** m≥1 and m is prime to char K. Use the subgroup fixing the entire torsion group, not the stabilizer of one point.

**Construction or proof.**

1. Finite torsion and continuity give an open normal kernel.
2. Apply fixed-field Galois correspondence and compare pointwise fixedness.
3. Take intersections of kernels and directed unions of the corresponding fixed fields.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/finite-torsion-action`, `ArithmeticGaloisRepresentations:R01.1/finite-galois-factorisation`, `mathlib:IntermediateField.fixedField`.

**Sources.** [James S. Milne, Elliptic Curves](https://www.jmilne.org/math/Books/EC2.pdf), V Proposition 8.1 and proof, pp. 220–221, corrected whole-torsion kernel; [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), IV §3, pp. 139–142.

**API.**

- `divisionField_fixed_iff` (characterisation): x∈K(A[m]) iff every element of H_m fixes x.
- `divisionField_kernel` (relation): The subgroup fixing K(A[m]) equals H_m.
- `divisionField_mono` (functoriality): m|n implies K(A[m])≤K(A[n]) when both are invertible.

**Unit tests.**

- `divisionField_one` (degenerate): K(A[1])=K.
- `divisionField_trivial_action` (computation): A trivial m-torsion action gives K(A[m])=K.
- `divisionField_two_cubic` (non-example): For E:y²=x³−x−1 over Q, Q(E[2]) is the S₃ splitting field; the field of one nonzero 2-torsion point has degree 3 and is not this field.

**Uses.**

- `R01.6/good-reduction-specialization`: Identifies trivial inertia with unramified finite division fields.
- `ClassicalSerreModularity:R33.1`: Exports finite image fields of the canonical residual action.

**Acceptance.** The definition agrees with adjoining coordinates in a Weierstrass model. The one-point stabilizer can be nonnormal; source issue E9002 records the correction.

### Base change of the arithmetic action

Target `ArithmeticGaloisRepresentations:R01.6/separable-base-change-action`; proposed interface `separableBaseChangeAction`.

For K→L and a prescribed compatible embedding K̄→L̄, ℓ≠char K, the A4 base-change isomorphism T_ℓ(A_L)≅T_ℓA intertwines G_L with G_K along the induced continuous homomorphism. Compatible changes of the closure embedding conjugate the action. For finite separable L/K this is restriction to the corresponding open subgroup. Purely inseparable extensions in positive characteristic induce the equivalence on prime-to-characteristic torsion.

**Hypotheses.** Use a prescribed compatible square of closures; Mathlib’s unparameterized map chooses a square. No equality of representations with different carrier types before transport.

**Construction or proof.**

1. Base change finite étale torsion at each level.
2. Transport the action along the square, then pass to the inverse limit.
3. Two closure maps differ by Galois conjugation; purely inseparable extensions leave the étale site unchanged.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `mathlib:Field.absoluteGaloisGroup.mapOfAlgebra`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I §7, pp. 33–35; IV §3, pp. 139–142.

**Acceptance.** Identity base change is the identity; composable prescribed embeddings give composable intertwiners.

### Elliptic Tate comparison

Target `ArithmeticGaloisRepresentations:R01.6/native-elliptic-tate-comparison`; proposed interface `nativeEllipticTateComparison`.

Let W/K be an elliptic Weierstrass curve and E_W the native abelian variety provided by A1. The zero-preserving pointed-curve equivalence identifies E_W[ℓ^n](K̄) with torsionBy(ℓ^n) of the native affine Point group. Its inverse limit identifies T_ℓE_W with the current Tau Ceti TateModule of that Point group, compatibly with G_K, isogeny point maps, Z_ℓ scalars and topology. For the canonical polarization φ_{O(O)}, the finite and limiting pairings agree with the native Weil pairing with the same argument order. Consequently the native determinant theorem transports to the scheme realization.

**Hypotheses.** W is elliptic; ℓ is prime different from char K. A1 supplies the pointed scheme carrier and its canonical polarization, not an arbitrary supplied linear equivalence.

**Construction or proof.**

1. Apply the A1 pointed-curve equivalence to zero, addition and finite torsion.
2. Identify each finite action and transition before invoking the inverse-limit universal property.
3. Compare the divisor definition of both pairings using the same translation and argument order; check the complex lattice example to rule out inversion.
4. Use the existing native determinant declaration after transport.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `AbelianSchemesAndArithmeticModuli:A1/relative-elliptic-equivalence`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I §13, pp. 56–59, including Proposition 13.2; [James S. Milne, Elliptic Curves](https://www.jmilne.org/math/Books/EC2.pdf), II §6, pp. 70–71.

**Acceptance.** Do not define a second Weierstrass Tate module; current-library inventory records the exact existing modules. The imported native isogeny determinant and trace formula is covered by the parent node, not planned again.

### Residual isogeny lines

Target `ArithmeticGaloisRepresentations:R01.6/residual-cyclic-isogenies`; proposed interface `residualCyclicIsogenies`.

For an elliptic curve E/K and prime ℓ≠char K, G_K-stable F_ℓ lines in E[ℓ](K̄) are precisely kernels on geometric points of K-defined cyclic ℓ-isogenies, modulo isomorphism of the quotient fixing E. Reducibility is equivalent to existence of such an isogeny. If ψ is the action on the line, the quotient character is χ̄_ℓψ⁻¹. A rational line need not have a rational nonzero point. At ℓ=2 the characters are trivial, but a nontrivial extension can still occur.

**Hypotheses.** The finite étale subgroup is descended from the stable line. Do not assume a generator is K-rational.

**Construction or proof.**

1. Descend the stable finite torsion subgroup through the finite étale Galois equivalence.
2. Apply A3’s finite-flat quotient by that subgroup; conversely take the kernel of a K-isogeny.
3. Use the determinant of the rank-two residual representation for the quotient character.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/finite-torsion-action`, `ArithmeticGaloisRepresentations:R01.6/tate-determinant-character`, `AbelianSchemesAndArithmeticModuli:A3/nonaffine-abelian-quotient`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Proposition 2.9, pp. 55–56.

**Acceptance.** Test a stable line with nontrivial ψ and the nonsemisimple F₂ case.

### Quadratic twist comparison

Target `ArithmeticGaloisRepresentations:R01.6/quadratic-twist-tate-comparison`; proposed interface `quadraticTwistTateComparison`.

For char K≠2 and a quadratic character ε of G_K, the A6 quadratic twist A^ε has T_ℓ(A^ε)≅T_ℓA⊗ε for every ℓ≠char K, including ℓ=2. The isomorphism becomes the chosen twist isomorphism over the quadratic splitting field. On an elliptic curve the determinant stays χ_ℓ and good unramified Frobenius trace is multiplied by ε(Frob_v).

**Hypotheses.** The twist uses the central involution [-1]; the quadratic algebra is separable. At ℓ=2, −1 is nontrivial integrally although its residual reduction is 1.

**Construction or proof.**

1. Import the geometric twist and its descent cocycle from A6.
2. Apply the field Tate functor to the cocycle and use T[-1]=−1.
3. Transport determinant and Frobenius along the tensor comparison.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `AbelianSchemesAndArithmeticModuli:A6/quadratic-twists-and-restriction`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Proposition 2.12, pp. 56–57.

**Acceptance.** A split quadratic algebra gives the identity comparison; the dyadic integral twist is retained.

### Isogeny cokernel

Target `ArithmeticGaloisRepresentations:R01.6/isogeny-tate-cokernel`; proposed interface `isogenyTateCokernel`.

For a K-isogeny φ:A→B and ℓ≠char K, T_ℓφ is injective. Its cokernel is canonically G_K-equivariantly isomorphic to (ker φ)(K̄)[ℓ^∞] and has cardinality ℓ^{v_ℓ(deg φ)}. V_ℓφ is an isomorphism, and T_ℓφ is an isomorphism iff ℓ∤deg φ. These assertions include inseparable isogenies in characteristic different from ℓ; their connected kernel contributes no geometric ℓ-primary points.

**Hypotheses.** A and B are abelian varieties; degree is the scheme degree, not geometric kernel cardinality.

**Construction or proof.**

1. Use divisibility of the geometric prime-to-characteristic torsion and the finite kernel exact sequence.
2. Injectivity follows because an ℓ-divisible compatible sequence in a finite group is zero.
3. Use V_ℓφ inverse and the identifications V/T≅A[ℓ^∞] to identify its lattice cokernel with the geometric kernel; prime-to-characteristic étaleness gives the degree valuation.
4. Invert ℓ and use a dual quasi-inverse to get the rational comparison.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I §10, Lemma 10.4 and following discussion, pp. 44–45.

**Acceptance.** For [ℓ], the cokernel is A[ℓ], cardinality ℓ^{2g}; for degree prime to ℓ it vanishes.

## Polarized pairings and real places

### Arithmetic pairing comparison

Target `ArithmeticGaloisRepresentations:R01.6/arithmetic-polarized-pairing`; proposed interface `arithmeticPairing_equivariant`.

The A4 duality T_ℓ(A^∨)≅T_ℓA^∨(1) is G_K-equivariant for the field realization. Its perfect pairing satisfies e(σx,σy)=χ_ℓ(σ)e(x,y) and e(Tf x,y)=e(x,Tf^∨ y). For a K-polarization λ, b_λ(x,y)=e(x,Tλ y) is alternating and has multiplier χ_ℓ; it is perfect integrally iff ℓ∤deg λ and always perfect on V_ℓ. Products give orthogonal sums. The Rosati identity b_λ(ax,y)=b_λ(x,a^†y) is imported from A2.

**Hypotheses.** λ is a genuine polarization defined over K. The target is Z_ℓ(1), not a trivially acted-on copy of Z_ℓ; no principal-polarization assumption rationally.

**Construction or proof.**

1. Import finite pairings, compatibility and duality from A3/A4.
2. Check the Galois multiplier at each finite level and pass to the inverse limit.
3. Use the isogeny cokernel criterion to distinguish integral from rational nondegeneracy.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `ArithmeticGaloisRepresentations:R01.6/isogeny-tate-cokernel`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`, `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I §13, Propositions 13.1–13.2, pp. 56–59.

**Acceptance.** A polarization divisible by ℓ must fail the integral perfectness test. The elliptic canonical pairing has the native sign fixed by the comparison node.

### Tate determinant

Target `ArithmeticGaloisRepresentations:R01.6/tate-determinant-character`; proposed interface `tateDeterminant`.

For dim A=g and ℓ≠char K, det ρ_T=χ_ℓ^g and det ρ_V=χ_ℓ^g. The residual determinant is χ̄_ℓ^g. For elliptic curves g=1; over a finite residue field of cardinality q, arithmetic Frobenius has determinant q. This holds without an integral principal polarization.

**Hypotheses.** Choose any K-polarization and use its rational perfect pairing. The rank 2g and field-realization continuity come from A4.

**Construction or proof.**

1. The rational pairing puts the image in the existing GSp group with multiplier χ_ℓ.
2. Import the determinant=multiplier^g theorem from G7; injectivity Z_ℓ→Q_ℓ gives the integral equality.
3. Reduce the integral equality for the residual formula.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/arithmetic-polarized-pairing`, `ArithmeticGaloisRepresentations:G7/similitude-groups`, `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`, `tauceti:Matrix.det_eq_of_transpose_mul_J_mul_eq_smul`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Proposition 2.8, p. 55; [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I §13, pp. 56–59.

**Acceptance.** Use the general G7 theorem for g>1; the pinned matrix lemma supplies only rank two.

### Complex conjugation

Target `ArithmeticGaloisRepresentations:R01.6/real-conjugation-eigenspaces`; proposed interface `realConjugationEigenspaces`.

For a real place of K of characteristic zero and its complex conjugation c∈G_K, V_ℓA decomposes into ±1 eigenspaces, both of dimension g; each is Lagrangian for b_λ. Thus tr ρ_V(c)=0 and det ρ_V(c)=(−1)^g. If ℓ is odd the integral lattice decomposes into the two eigenlattices of rank g, and the residual elliptic action is conjugate to diag(1,−1). For ℓ=2 the rational decomposition remains true, but integral splitting and residual eigenvalue separation are not asserted.

**Hypotheses.** A/K is abelian, λ is a K-polarization, dim A=g. c²=1 and χ_ℓ(c)=−1 at a real place.

**Construction or proof.**

1. In characteristic zero, projectors (1±ρ(c))/2 split V.
2. Anti-symplecticity makes both eigenspaces isotropic, and perfectness forces their dimensions to be g.
3. The projectors are integral precisely when 2 is invertible; reduce the odd-prime rank-two result.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/arithmetic-polarized-pairing`, `ArithmeticGaloisRepresentations:R01.6/tate-determinant-character`, `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Proposition 2.8, p. 55; [Kenneth A. Ribet, Abelian varieties over Q and modular forms](https://math.berkeley.edu/~ribet/Articles/korea.pdf), §3, Lemma 3.2, pp. 4–5.

**Acceptance.** Test the integral obstruction at ℓ=2 using the involution swapping two basis vectors.

## Reduction, Frobenius and local polynomials

### Good reduction specialization

Target `ArithmeticGaloisRepresentations:R01.6/good-reduction-specialization`; proposed interface `goodReductionSpecialization`.

Let R be a henselian DVR with fraction field K, finite residue field k, and an abelian scheme 𝒜/R with generic fibre A and special fibre B. For ℓ≠char k, specialization identifies A[ℓ^n](K̄) with B[ℓ^n](k̄), equivariantly for D_K→G_k and compatibly with transition maps, homomorphisms and products. Hence inertia acts trivially on T_ℓA and V_ℓA. Only the good-reduction ⇒ unramified direction is needed here.

**Hypotheses.** Use an actual smooth proper group scheme model, not a good-reduction label with no model. ℓ is a unit of R.

**Construction or proof.**

1. Multiplication by ℓ^n on 𝒜 is finite étale by A3.
2. The henselian finite-étale fibre equivalence identifies the two geometric fibres and their actions.
3. Take the inverse limit and extend scalars; use the whole division-field kernel in the elementary elliptic proof.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `ArithmeticGaloisRepresentations:R01.6/division-field-interface`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), IV Theorem 3.5 and discussion, pp. 141–142; [James S. Milne, Elliptic Curves](https://www.jmilne.org/math/Books/EC2.pdf), V Proposition 8.1, pp. 220–221, corrected proof.

**Acceptance.** The comparison is compatible at all n; merely counting points does not give equivariance.

### Frobenius conventions

Target `ArithmeticGaloisRepresentations:R01.6/finite-field-frobenius-conventions`; proposed interface `finiteFieldFrobeniusConventions`.

For B/F_q and ℓ∤q, arithmetic Frobenius x↦x^q acts on T_ℓB as T_ℓπ_B, where π_B is the q-power scheme endomorphism. Geometric Frobenius acts on V_ℓB as (V_ℓπ_B)⁻¹. On H¹=V_ℓB^∨, geometric Frobenius is the dual of V_ℓπ_B, so its characteristic polynomial equals that of arithmetic Frobenius on V_ℓB. At good reduction these identities transport through specialization.

**Hypotheses.** q is the cardinality of the base residue field, not the residue extension used for a decomposition group.

**Construction or proof.**

1. Evaluate the two actions on geometric torsion coordinates.
2. Compare inverse and contragredient actions before taking determinants.
3. Transport via good-reduction specialization.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/good-reduction-specialization`, `AbelianSchemesAndArithmeticModuli:A4/realization-conventions`, `ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), II §1, pp. 75–76; IV §3, pp. 140–142, corrected q_v convention.

**Acceptance.** Do not equate geometric Frobenius on V with π_B; the dual reverses this inversion.

### Good reduction polynomial

Target `ArithmeticGaloisRepresentations:R01.6/integral-good-frobenius-polynomial`; proposed interface `integralGoodFrobeniusPolynomial`.

At good reduction v of an abelian variety A over a number field, there is a single monic P_v(X)∈Z[X] of degree 2g such that for every ℓ≠p_v it maps to det(X−ρ_V(Frob_v^arith)). It is the A6 characteristic polynomial of π_{A_v}; its constant term is q_v^g and it obeys X^{2g}P_v(q_v/X)=q_v^g P_v(X). Its reciprocal Euler polynomial is Q_v(T)=T^{2g}P_v(T⁻¹)∈Z[T]. For an elliptic curve, P_v=X²−a_vX+q_v, a_v=q_v+1−#E_v(k_v). Choice of the place above v changes only conjugacy.

**Hypotheses.** A has good reduction at v; ℓ≠p_v; q_v=#k_v. The reciprocal identity is an equality after clearing denominators.

**Construction or proof.**

1. Identify Frobenius by specialization and apply the lower A6 integral characteristic-polynomial theorem.
2. The cyclotomic multiplier and the perfect rational pairing pair the roots α and q_v/α, proving the reciprocal identity and constant term.
3. For g=1, use the native Frobenius and 1−Frobenius degree/point-count identities; finite-field point counting fixes the trace.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/finite-field-frobenius-conventions`, `ArithmeticGaloisRepresentations:R01.6/tate-determinant-character`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism`, `ArithmeticGaloisRepresentations:R01.6/determinant-of-a-weierstrass-isogeny-on-the-tate-module`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I Proposition 10.20, pp. 50–52; II Theorem 1.1, pp. 75–77; IV §3, pp. 142–143; [James S. Milne, Elliptic Curves](https://www.jmilne.org/math/Books/EC2.pdf), V Propositions 7.5 and 8.3, pp. 217, 223.

**Acceptance.** For y²=x³−x over F₅ the polynomial is X²+2X+5. Use A6 for integrality; the characteristic-polynomial result is not replanned here.

**Atlas planet:** Frobenius polynomial.

### Tate curve action

Target `ArithmeticGaloisRepresentations:R01.6/tate-uniformization-action`; proposed interface `tateUniformizationAction`.

For a nonarchimedean local field K, q∈K× with 0<|q|<1, and ℓ≠p_K, the existing analytic Tate uniformization K̄×/q^Z identifies its torsion with an exact sequence 0→Z_ℓ(1)→T_ℓE_q→Z_ℓ→0. Compatible q^{1/ℓ^n} give the cocycle c_q and the matrix [[χ_ℓ,c_q],[0,1]]. The sequence is independent of root choices up to change of splitting. Nonsplit multiplicative reduction gives the unramified quadratic twist. On inertia, the coinvariant quotient has arithmetic Frobenius eigenvalue +1 or −1 respectively.

**Hypotheses.** K is a local field with finite residue field; ℓ≠p_K. The basis and roots choose a splitting, not a canonical splitting of the extension.

**Construction or proof.**

1. Use the existing Tate uniformization from EllipticCurves Layer 4.
2. At finite level write a torsion point as ζ q^{a/ℓ^n}; compare Galois action and root transitions.
3. The Kummer cocycle on inertia is nonzero rationally because v(q)>0.
4. Twist by the nonsplit quadratic character and identify coinvariants.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `ArithmeticGaloisRepresentations:R01.6/quadratic-twist-tate-comparison`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `ArithmeticGaloisRepresentations:R01.1/tate-twist`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Proposition 2.12 and its proof, pp. 56–57.

**Acceptance.** The inertia-invariant line of V has eigenvalue q_v, while its coinvariant quotient has eigenvalue 1. The residual action is unramified iff ℓ divides v(q), with the stated prime-to-residue-characteristic hypotheses.

### Additive inertia

Target `ArithmeticGaloisRepresentations:R01.6/additive-elliptic-inertia`; proposed interface `additiveEllipticInertia`.

For an elliptic curve over a characteristic-zero nonarchimedean local field with additive reduction, and every ℓ≠p_K, (V_ℓE)^{I_K}=0 and (V_ℓE)_{I_K}=0. For potentially multiplicative reduction use a ramified quadratic twist of the Tate representation; for potentially good reduction inertia acts through a nontrivial finite group preserving the symplectic form, and a fixed vector would force the group to be trivial. This includes wild residue characteristics 2 and 3.

**Hypotheses.** Reduction is additive for a minimal model; ℓ≠p_K. Potential good reduction, finite inertia and the potential-multiplicative twist classification are geometric suppliers; gap G1 records the missing all-residue-characteristic contract.

**Construction or proof.**

1. Separate potential multiplicative and potential good cases using the existing reduction roadmap.
2. In the first case both diagonal characters after the ramified quadratic twist have nontrivial inertia.
3. In the second case average over the finite inertia image in characteristic zero; rank-two symplecticity makes a fixed line force trivial action, which contradicts additive reduction.
4. Duality identifies the vanishing coinvariant space.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/tate-uniformization-action`, `ArithmeticGaloisRepresentations:R01.6/arithmetic-polarized-pairing`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Propositions 2.13–2.14, pp. 57–58.

**Acceptance.** Check wild additive reduction at p=2,3; do not extend the p>3 statement without G1.

### Abelian Euler polynomial

Target `ArithmeticGaloisRepresentations:R01.6/abelian-euler-polynomial`; proposed interface `abelianEuler`.

For a number-field abelian variety A and finite v, ℓ≠p_v, define Q_{v,ℓ}(A,T)=det(1−T Frob_v^geom | (V_ℓA^∨)^{I_v}). Equivalently it is det(1−T Frob_v^arith | (V_ℓA)_{I_v}), where coinvariants mean quotient by the span of (σ−1)V for σ∈I_v. It has constant coefficient 1, depends only on the Frobenius coset, is multiplicative in products and invariant under K-isogeny. At good reduction it is Q_v from the integral Frobenius target. No integral ℓ-independence at every bad place is claimed for arbitrary abelian varieties.

**Hypotheses.** Finite-dimensional rational representation; v finite and ℓ≠p_v. Use dual invariants or primal coinvariants; primal invariants with arithmetic Frobenius give a different polynomial in the multiplicative case.

**Construction or proof.**

1. Import the generic R01.2 local Euler definition on V^∨ with geometric Frobenius.
2. Use (V_I)^∨=(V^∨)^I and the inverse contragredient action to get the coinvariant form.
3. A change of Frobenius lift is trivial on coinvariants; determinants commute with direct sums and intertwining isomorphisms.
4. Use good specialization only where it is applicable.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `ArithmeticGaloisRepresentations:R01.6/isogeny-tate-cokernel`, `ArithmeticGaloisRepresentations:R01.6/integral-good-frobenius-polynomial`, `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`, `AbelianSchemesAndArithmeticModuli:A4/realization-conventions`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Propositions 2.11–2.13, pp. 56–58; [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), IV §3, pp. 142–143.

**API.**

- `abelianEuler_coinvariants` (compatibility): The dual-invariants geometric definition equals the arithmetic coinvariant determinant.
- `abelianEuler_product` (functoriality): Q(A×B)=Q(A)Q(B).
- `abelianEuler_isogeny` (compatibility): A K-isogeny leaves Q_{v,ℓ} unchanged.
- `abelianEuler_constant` (simp): The coefficient of T⁰ is 1.

**Unit tests.**

- `abelianEuler_zero` (degenerate): The zero-dimensional representation has polynomial 1.
- `abelianEuler_split_tate` (computation): For E_q with split multiplicative reduction Q=1−T.
- `abelianEuler_nonsplit_tate` (computation): For nonsplit multiplicative reduction Q=1+T.
- `abelianEuler_good_five` (compatibility): For y²=x³−x with good reduction at 5, Q=1+2T+5T².

**Uses.**

- `EllipticCurveModularity:R29.1`: Supplies the native local polynomial in Galois terms.
- `AutomorphicGaloisRepresentations`: Pins the contragredient and Frobenius conventions used for local comparisons.

**Acceptance.** The split multiplicative polynomial is 1−T, not 1−q_vT.

**Atlas planet:** Local Euler polynomial.

### Native local polynomial comparison

Target `ArithmeticGaloisRepresentations:R01.6/weierstrass-local-polynomial-comparison`; proposed interface `weierstrassLocalPolynomialComparison`.

Let W/K be elliptic over the fraction field of a henselian DVR R with finite residue field and ℓ≠p_R. Transport the elliptic Tate action to E_W. Then the polynomial Q_{v,ℓ}(E_W) equals WeierstrassCurve.localPolynomial R W after Z→Q_ℓ. For the minimal model it is 1−aT+qT² at good reduction, 1−T at split multiplicative reduction, 1+T at nonsplit multiplicative reduction, and 1 at additive reduction. Its reciprocal power series agrees with localPowerSeries, hence its coefficient arithmetic function agrees with localEulerFactor and the corresponding formal Euler product in the native LFunction.

**Hypotheses.** Finite residue field is required; native Nat.card has a junk value for infinite fields. Only the algebraic Euler-product interface is compared, not analytic continuation or convergence.

**Construction or proof.**

1. Use the finite-field point identification for good reduction.
2. Use the Tate comparison for the two multiplicative cases and the additive inertia target for the fourth.
3. Unfold the native four-case polynomial and its formal reciprocal definitions.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/native-elliptic-tate-comparison`, `ArithmeticGaloisRepresentations:R01.6/abelian-euler-polynomial`, `ArithmeticGaloisRepresentations:R01.6/tate-uniformization-action`, `ArithmeticGaloisRepresentations:R01.6/additive-elliptic-inertia`, `mathlib:WeierstrassCurve.localPolynomial`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Propositions 2.11–2.14, pp. 56–58.

**Acceptance.** Each of the four branches has an explicit test; do not hide additive G1.

### Elliptic conductor export

Target `ArithmeticGaloisRepresentations:R01.6/elliptic-conductor-export`; proposed interface `ellipticConductorExport`.

For E over a number field and v finite, the Artin conductor of V_ℓE, ℓ≠p_v, equals the existing R01.3 geometric conductor exponent: 0 at good reduction, 1 at multiplicative reduction, and 2+δ_v at additive reduction, δ_v the Swan contribution. Its dual has the same conductor. The exported prime-to-ℓ residual conductor comparison is precisely R01.3/residual-elliptic-conductor-away-from-ell, with its E/Q and ℓ≥5 hypotheses, not an unrestricted equality.

**Hypotheses.** Import the conductor theorem and its declared Ogg–Saito proof input from R01.3; this part supplies the actual Tate representation. The residual unsimplified representation differs from its semisimplification in the multiplicative case.

**Construction or proof.**

1. Use the field-realization and elliptic carrier intertwiners to instantiate R01.3.
2. Transport the native local reduction cases and distinguish tame codimension from Swan.
3. Export the existing residual formula with its exact hypotheses, recording its source gap as G2 rather than closing it here.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/native-elliptic-tate-comparison`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-an-elliptic-curve`, `ArithmeticGaloisRepresentations:R01.3/residual-elliptic-conductor-away-from-ell`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Propositions 2.12–2.14, pp. 56–58.

**Acceptance.** The split Tate semisimplification has tame conductor 0 but the full Tate action has conductor 1.

## Endomorphism coefficients

### Endomorphism coefficients

Target `ArithmeticGaloisRepresentations:R01.6/endomorphism-coefficient-action`; proposed interface `coefficientAction`.

Let E be a number field and ι:E→End⁰_K(A) a unital embedding. Functoriality defines an E⊗Q_ℓ action on V_ℓA commuting with G_K; the rational coefficient representation is E⊗Q_ℓ-linear. If E is only a G_K-stable subfield of End⁰_{K̄}(A), the action satisfies ρ(σ)(a·x)=σ(a)·ρ(σ)x and becomes linear after a finite field extension defining E. Endomorphism action is faithful by A6. No arbitrary E-module structure can replace ι. The order O=E∩End_K(A) acts integrally on T_ℓA through O⊗Z_ℓ. At primes dividing the conductor of a nonmaximal order, finite freeness over that order is not asserted; the integral λ-lattice target uses the maximal-order hypothesis explicitly.

**Hypotheses.** The coefficient algebra embeds into the geometric endomorphism algebra, and linearity requires definition over K. ℓ≠char K.

**Construction or proof.**

1. Apply the covariant Tate functor to endomorphisms and extend Q-linearly.
2. Use injectivity of Hom→Tate Hom from A6.
3. Compare conjugation of geometric endomorphisms with Galois action; finite generation gives a finite defining extension.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I Proposition 10.23, pp. 52–53; [Kenneth A. Ribet, Abelian varieties over Q and modular forms](https://math.berkeley.edu/~ribet/Articles/korea.pdf), §2, pp. 2–3.

**API.**

- `coefficientAction_mul` (structure): (ab)·x=a·(b·x), and 1·x=x.
- `coefficientAction_galois` (compatibility): For a K-defined coefficient embedding, ρ(σ)(a·x)=a·ρ(σ)x.
- `coefficientAction_semilinear` (relation): For a stable geometric coefficient field, conjugation acts on its coefficient a.

**Unit tests.**

- `coefficientAction_rational` (compatibility): For E=Q, the action is the existing scalar action on V_ℓA.
- `coefficientAction_zero` (degenerate): Every coefficient sends 0 to 0.
- `coefficientAction_cm_conjugation` (non-example): On E:y²=x³−x over Q, the geometric Q(i) coefficient action satisfies c(i·x)=−i·c(x); it is not Q(i)-linear over Q.

**Uses.**

- `ComplexMultiplicationAndExplicitReciprocity:CM.4`: Uses geometric coefficient fields and their defining field.
- `EllipticCurveModularity:R29.1`: Requires coefficient-linear rank-two systems over the correct base field.

**Acceptance.** For geometric CM not defined over Q, complex conjugation is semilinear.

### λ-adic component

Target `ArithmeticGaloisRepresentations:R01.6/lambda-rational-component`; proposed interface `lambdaComponent`.

For the preceding K-defined E-action, write E⊗Q_ℓ=∏_{λ|ℓ}E_λ. Define V_λA=E_λ⊗_{E⊗Q_ℓ}V_ℓA, equivalently e_λV_ℓA for the canonical factor idempotent. If d=[E:Q], A6 gives d|2g and V_ℓA free of rank 2g/d over E⊗Q_ℓ; thus dim_{E_λ}V_λA=2g/d. The sum of these components is V_ℓA with its G_K action; under geometric semilinear action σ sends the λ component to the σλ component.

**Hypotheses.** All places above ℓ are included, including ramified places. No assertion of a rank-two component unless d=g.

**Construction or proof.**

1. Use the canonical finite product decomposition of the completed number field.
2. Apply its idempotents to the actual endomorphism action.
3. Import freeness from A6 and compute the dimensions by extension of scalars.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/endomorphism-coefficient-action`, `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`, `ArithmeticGaloisRepresentations:R01.1/coefficient-extension`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I Proposition 10.23 and proof, pp. 52–53; [Kenneth A. Ribet, Abelian varieties over Q and modular forms](https://math.berkeley.edu/~ribet/Articles/korea.pdf), §2, pp. 2–3.

**API.**

- `lambdaComponent_rank` (structure): dim_{E_λ}V_λA=2g/d.
- `lambdaComponent_sum` (equivalence): The direct sum of V_λA over λ|ℓ recovers V_ℓA equivariantly.
- `lambdaComponent_galois` (compatibility): The component projector commutes with G_K when E is defined over K.

**Unit tests.**

- `lambdaComponent_rational` (compatibility): E=Q has one factor and V_λA=V_ℓA.
- `lambdaComponent_split_cm` (computation): For E=Q(i), ℓ=5, g=1, the two factors each have E_λ-dimension 1.
- `lambdaComponent_inert_cm` (computation): For E=Q(i), ℓ=3, g=1, the sole component has E_λ-dimension 1 and Q₃-dimension 2.

**Uses.**

- `ClassicalSerreModularity:R33.1`: Defines the coefficient-valued residual rank-two representation.
- `ComplexMultiplicationAndExplicitReciprocity:CM.4`: Separates the CM characters at split and inert primes.

**Acceptance.** Use dimension over E_λ, rather than dimension over Q_ℓ.

**Atlas planet:** λ-adic component.

### Integral λ lattice

Target `ArithmeticGaloisRepresentations:R01.6/integral-lambda-component`; proposed interface `integralLambda`.

Assume the maximal order O_E embeds into End_K(A). The factor idempotents of O_E⊗Z_ℓ=∏O_{E,λ} define T_λA, a G_K-stable full finite free O_{E,λ} lattice of rank 2g/[E:Q] in V_λA. Its residual representation is on T_λA/λT_λA. The canonical geometric comparison is A[λ] ≅ (T_λA/λT_λA)⊗_{κ_λ}(λ⁻¹O_{E,λ}/O_{E,λ}), obtained from V_λA/T_λA. Choosing a local uniformizer π_λ trivializes the rank-one factor and gives x mod π_λT_λ↦π_λ⁻¹x mod T_λ. Replacing π_λ by uπ_λ changes this map by u⁻¹. Neither the residual quotient nor the tensor comparison depends on that choice.

**Hypotheses.** Maximal-order action is integral; a rational E embedding alone does not preserve T_ℓA. λ may be ramified above ℓ; reduce modulo λ, not modulo ℓ. The torsion identification requires a uniformizer choice; the residual quotient itself does not.

**Construction or proof.**

1. Apply integral factor idempotents to the stable Tate lattice.
2. Use torsion-freeness and finite generation over the DVR O_{E,λ} for freeness; rational rank is already known.
3. Identify V/T with geometric ℓ-primary division torsion and extract the λ-primary factor.
4. Write the uniformizer-dependent quotient-to-torsion map x↦π_λ⁻¹x mod T_λ.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/lambda-rational-component`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `AbelianSchemesAndArithmeticModuli:A3/torsion-divisibility`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I §10, pp. 44–45, and Proposition 10.23, pp. 52–53.

**API.**

- `integralLambda_rank` (structure): T_λA is finite free of rank 2g/d over O_{E,λ}.
- `integralLambda_fraction` (compatibility): E_λ⊗_{O_{E,λ}}T_λA≅V_λA.
- `integralLambda_uniformizer` (equivalence): x mod π_λT maps to π_λ⁻¹x mod T, and changing π_λ to uπ_λ scales this map by u⁻¹.

**Unit tests.**

- `integralLambda_rational` (compatibility): For E=Q this is T_ℓA, with residual A[ℓ].
- `integralLambda_ramified` (computation): For E=Q(i) at λ=(1+i) over 2, T_λ/λ has dimension 1 over F₂ for g=1; T_λ/2 has length 2.
- `integralLambda_uniformizer_change` (non-example): Uniformizers π and uπ give maps to geometric λ-torsion differing by u⁻¹, so that map is not choice-free.

**Uses.**

- `ClassicalSerreModularity:R33.1`: Provides the correct residue field and λ-adic lattice.
- `EllipticCurveModularity:R29.1`: Distinguishes an integral endomorphism order from a rational coefficient field.

**Acceptance.** Replace the parent’s unconditional canonical A[λ] identification by the explicit uniformizer-dependent comparison.

### Coefficient pairing

Target `ArithmeticGaloisRepresentations:R01.6/balanced-lambda-pairing`; proposed interface `balancedLambdaPairing`.

If E is totally real, [E:Q]=g, E⊂End⁰_K(A) and a K-polarization λ_A has Rosati involution fixing E pointwise, then the rational polarization form is E-balanced. On each V_λA it is uniquely Tr_{E_λ/Q_ℓ} of an alternating perfect E_λ-bilinear form, with multiplier χ_ℓ. Consequently det_{E_λ}ρ_λ=χ_ℓ. The trace pairing of the finite separable extension E_λ/Q_ℓ is essential; this does not assert integral perfectness of the E_λ form.

**Hypotheses.** Totally real E, degree g, and Rosati fixes E pointwise; all endomorphisms are defined over K. λ_A denotes a polarization, distinguished from a place λ of E.

**Construction or proof.**

1. Rosati adjunction gives b(ax,y)=b(x,ay), so distinct completion factors are orthogonal.
2. Nondegeneracy of the field trace uniquely lifts a balanced Q_ℓ pairing to an E_λ-bilinear pairing.
3. Apply rank-two determinant=multiplier to this form.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/arithmetic-polarized-pairing`, `ArithmeticGaloisRepresentations:R01.6/lambda-rational-component`, `ArithmeticGaloisRepresentations:G7/similitude-groups`, `AbelianSchemesAndArithmeticModuli:A2/rosati-involution`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I §13, pp. 58–59; §14, Rosati definition and adjoint identity, p. 61; [Kenneth A. Ribet, Abelian varieties over Q and modular forms](https://math.berkeley.edu/~ribet/Articles/korea.pdf), §3, Lemma 3.1, pp. 4–5.

**Acceptance.** Do not assert det=χ_ℓ for every GL2-type variety over Q.

### Coefficient oddness

Target `ArithmeticGaloisRepresentations:R01.6/lambda-oddness`; proposed interface `lambdaOddness`.

If A/Q is GL2-type with a K-defined coefficient field E of degree g, every two-dimensional V_λA is odd: complex conjugation has eigenvalues 1 and −1 over E_λ. No Rosati-fixed or totally-real assumption is needed for this oddness assertion. The stronger determinant identity det ρ_λ=χ_ℓ uses the balanced-pairing hypotheses. A general formula εχ_ℓ with finite-order ε requires the locally algebraic determinant input and is not exported here.

**Hypotheses.** A is defined over Q, E⊂End⁰_Q(A), [E:Q]=g. The claim is rational, including λ above 2.

**Construction or proof.**

1. Use the general real-place eigenspaces of Q_ℓ-dimension g.
2. These spaces are E⊗Q_ℓ-stable. Over Q, conjugation on complex homology has each E-eigenspace of E-dimension one; import the A4 realization convention to identify its scalar extension with Tate realizations.
3. Equivalently use the E-linear real homology decomposition in Ribet’s proof; avoid deducing component ranks merely from a sum of Q_ℓ dimensions.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/real-conjugation-eigenspaces`, `ArithmeticGaloisRepresentations:R01.6/lambda-rational-component`, `AbelianSchemesAndArithmeticModuli:A4/realization-conventions`.

**Sources.** [Kenneth A. Ribet, Abelian varieties over Q and modular forms](https://math.berkeley.edu/~ribet/Articles/korea.pdf), §3, Lemma 3.2 and proof, pp. 4–5.

**Acceptance.** Componentwise oddness must use the E-linear Betti comparison, not total dimension counting alone.

### Coefficient Frobenius

Target `ArithmeticGaloisRepresentations:R01.6/coefficient-frobenius-comparison`; proposed interface `coefficientFrobeniusComparison`.

At good v and for E⊂End⁰_K(A), the E-action extends to the good abelian model and specializes faithfully to End⁰_{k_v}(A_v). It commutes with π_{A_v}; the λ-adic Frobenius operator is the corresponding idempotent component of V_ℓπ. Its E_λ characteristic polynomial is the component determinant. The common Z polynomial on V_ℓA is recovered by the product of field norms of these component polynomials. No single E-valued polynomial independent of all λ is inferred just from this norm identity.

**Hypotheses.** v is good, λ|ℓ, ℓ≠p_v, and coefficients are defined over K.

**Construction or proof.**

1. Use lower A6 normal-base extension of Hom to extend endomorphisms to the model.
2. Specialize and apply the field-Frobenius comparison.
3. Compute the characteristic polynomial of a coefficient-linear operator after restriction of scalars via field norms.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/lambda-rational-component`, `ArithmeticGaloisRepresentations:R01.6/integral-good-frobenius-polynomial`, `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`.

**Sources.** [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I Proposition 10.23, pp. 52–53; IV §3, pp. 142–143.

**Acceptance.** At a split coefficient prime, retain the two distinct component factors.

## Galois genericity

### p-Galois genericity

Target `ArithmeticGaloisRepresentations:R01.6/prime-galois-genericity`; proposed interface `pGeneric`.

For a polarized abelian variety (A,λ_A) over a finitely generated field K of characteristic zero and a prime p, call A p-Galois generic if its actual image ρ_{A,p}(G_K) is open in the group of automorphisms of T_pA scaling its integral polarization pairing by a unit. This ambient lattice-similitude group is a compact open subgroup of rational GSp(V_pA,b_λ). Thus the condition is equivalent to finite index. It makes sense for p=2 and nonprincipal polarizations; an integral symplectic basis is available only in the perfect case. For g=0 use the automorphism group alone, hence a trivial ambient group; no additional multiplier coordinate is retained. The usual positive-rank GSp identification applies for g>0.

**Hypotheses.** A is polarized over K; p is prime; char K=0. The ambient group is full GSp for this polarization, not the smaller Mumford–Tate or Shimura monodromy group.

**Construction or proof.**

1. Import G7’s form-similitude group and the integral lattice topology.
2. The actual image is compact and hence closed, so open is equivalent to finite index.
3. Use the rational form and its lattice stabilizer for nonperfect integral pairings.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/arithmetic-polarized-pairing`, `ArithmeticGaloisRepresentations:G7/similitude-groups`, `ArithmeticGaloisRepresentations:R01.1/lattices-are-compact-open`.

**Sources.** [David Masser, Umberto Zannier, Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §5.1, pp. 658–659; [Richard Pink, A combination of the conjectures of Mordell–Lang and André–Oort](https://people.math.ethz.ch/~pink/ftp/pink.pdf), §6, Definition 6.3, pp. 271–272.

**API.**

- `pGeneric_open_iff_finiteIndex` (characterisation): For the compact closed image, openness is equivalent to finite index in the lattice similitude group.
- `pGeneric_finite_extension` (compatibility): For finite L/K, A is p-generic iff A_L is p-generic.
- `pGeneric_isogeny` (compatibility): K-isogenous polarized varieties are p-generic simultaneously, after comparison in rational GSp.

**Unit tests.**

- `pGeneric_trivial_rank_zero` (degenerate): The zero-dimensional lattice has trivial ambient group and is p-generic.
- `pGeneric_full_image` (computation): An action surjective onto the full lattice-similitude group is p-generic.
- `pGeneric_cm_nonsurjective` (non-example): A CM elliptic curve over a field defining its CM has image in a torus and is not p-generic in full GL₂.
- `pGeneric_dyadic` (compatibility): For p=2 the full lattice-similitude group acting on the actual Z₂ lattice is used; a surjection to that group is generic, including nonperfect polarization pairings.

**Uses.**

- `AbelianVarietiesIsogenousNoJacobian`: Consumes p-Galois genericity before its separate adelic theorem.
- `R01.6/noot-full-image-specialization`: Specialization preserving the generic p-image preserves this predicate.

**Acceptance.** No maximal-image assertion is deduced from being Hodge generic.

### Adelic Galois genericity

Target `ArithmeticGaloisRepresentations:R01.6/adelic-galois-genericity`; proposed interface `adelicGeneric`.

For the same characteristic-zero polarized A/K, its adelic Tate action maps to the product over all primes p of the actual lattice-similitude groups. A is adelically Galois generic if this joint image is open in that full product. The condition is finite index because the image is compact. It implies p-Galois genericity for every p. Individual p-openness alone does not prove adelic openness or independence; the Cadoret adelic result used by the no-Jacobian consumer is owned there.

**Hypotheses.** Every prime is included, with the product topology; image is the joint image of a single G_K. Do not replace the joint image by the product of its coordinate images.

**Construction or proof.**

1. Use the imported adelic Tate carrier and G7 primewise ambient groups.
2. The coordinate maps assemble continuously; compactness gives closedness.
3. Project an open subgroup to a factor; distinguish finite exceptional coordinates and actual adelic entanglement.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/prime-galois-genericity`, `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `ArithmeticGaloisRepresentations:G7/similitude-groups`.

**Sources.** [David Masser, Umberto Zannier, Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §5.1, pp. 658–659; [Richard Pink, A combination of the conjectures of Mordell–Lang and André–Oort](https://people.math.ethz.ch/~pink/ftp/pink.pdf), §6, Definition 6.3, pp. 271–272.

**API.**

- `adelicGeneric_prime` (relation): Adelic openness implies p-openness for each prime.
- `adelicGeneric_finite_extension` (compatibility): Adelic genericity is invariant under finite base extension.
- `adelicGeneric_isogeny` (compatibility): It is invariant under K-isogeny: the integral lattices agree away from finitely many primes and are commensurable at the others.

**Unit tests.**

- `adelicGeneric_zero` (degenerate): The zero-dimensional product is trivial and is adelically generic.
- `adelicGeneric_full` (computation): A full joint image in the ambient product is adelically generic.
- `adelicGeneric_coordinate_trap` (non-example): The subgroup of ∏_p Z/2 consisting of constant sequences has full coordinate projections but is not open; coordinate openness is insufficient.

**Uses.**

- `AbelianVarietiesIsogenousNoJacobian`: Uses the full adelic genericity predicate, while owning the additional Cadoret proof.
- `R01.6/independence-of-abelian-tate-actions`: Separates full ambient openness from independence inside actual coordinate images.

**Acceptance.** A diagonal subgroup of two finite factors has surjective projections but is not their product.

### Genericity transport

Target `ArithmeticGaloisRepresentations:R01.6/genericity-transport`; proposed interface `genericityTransport`.

The prime and adelic full-GSp predicates are invariant under finite field extension, choice of Tate basis, K-isogeny, and change of K-polarization whenever one of the two polarization predicates holds. In the last case an open GSp image forces every commuting geometric endomorphism to be scalar, so the two rational polarization forms are proportional; their integral stabilizers are commensurable. Do not claim arbitrary polarization ambient groups agree before this argument.

**Hypotheses.** A is over a finitely generated characteristic-zero field; all compared polarizations are defined over K.

**Construction or proof.**

1. Finite index of the Galois subgroup preserves openness in both directions.
2. Use rational Tate isogeny intertwiners and commensurable lattices, agreeing integrally outside primes dividing the isogeny degree.
3. If one full-GSp image is open, Zariski density and the scalar centralizer imply End⁰_{K̄}(A)=Q after a finite defining extension; the quotient of the two polarizations is therefore scalar.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/prime-galois-genericity`, `ArithmeticGaloisRepresentations:R01.6/adelic-galois-genericity`, `ArithmeticGaloisRepresentations:R01.6/isogeny-tate-cokernel`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `ArithmeticGaloisRepresentations:G7/similitude-groups`.

**Sources.** [David Masser, Umberto Zannier, Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), §5.1, pp. 658–659; [Richard Pink, A combination of the conjectures of Mordell–Lang and André–Oort](https://people.math.ethz.ch/~pink/ftp/pink.pdf), §6, Proposition 6.4, p. 272.

**Acceptance.** Do not assert arbitrary nonproportional forms have the same full GSp ambient group.

## Independence and connectedness

### Independence of images

Target `ArithmeticGaloisRepresentations:R01.6/independence-predicate`; proposed interface `independent`.

For a profinite G and a continuous family ρ_p:G→H_p with compact images U_p, define independence to mean that the joint map G→∏_p U_p is surjective. Almost independence means independence after restriction to one open subgroup of G, using the restricted coordinate images. For G_K this is equivalent to independence after one finite extension. Independence is a property of the actual images, not openness in full GL or GSp. Surjectivity to all finite subproducts is equivalent by compactness.

**Hypotheses.** The groups are Hausdorff and each U_p carries its induced compact topology.

**Construction or proof.**

1. Form the joint map into the product of ranges.
2. Compactness makes its image closed; cylinder density gives the finite-subproduct criterion.
3. Use Galois correspondence for the open-subgroup interpretation.

**Needs.** `ArithmeticGaloisRepresentations:R01.1/continuous-representation`, `mathlib:Field.absoluteGaloisGroup`.

**Sources.** [Jean-Pierre Serre, Un critère d’indépendance pour une famille de représentations ℓ-adiques](https://ems.press/content/serial-article-files/43324), §1, pp. 542–543; [Rodolphe Richard, Andrei Yafaev, Generalised André–Pink–Zannier conjecture for Shimura varieties of abelian type](https://arxiv.org/pdf/2111.11216v4), Definition 2.4.

**API.**

- `independence_finiteProducts` (characterisation): Independence iff every finite-coordinate map is surjective.
- `independence_subfamily` (functoriality): Any subfamily of an independent family is independent.
- `independence_images` (compatibility): Replacing H_p by the actual image U_p leaves independence unchanged.

**Unit tests.**

- `independence_singleton` (degenerate): A one-element family is independent of its own image.
- `independence_diagonal` (non-example): Two identical nontrivial quotient characters are not independent.
- `independence_pairwise_trap` (non-example): The three maps (x,y)↦x,y,x+y from F₂² to F₂ are pairwise independent but not jointly independent.

**Uses.**

- `R01.6/serre-bounded-independence`: States precisely the conclusion of Serre’s criterion.
- `HeegnerPointEulerSystems:HE.7`: Uses finite collections of torsion fields without assuming maximal image.

**Acceptance.** Finite pairwise independence need not imply independence of the whole family.

### Uniform potential unipotence

Target `ArithmeticGaloisRepresentations:R01.6/uniform-potential-unipotence`; proposed interface `uniformPotentialUnipotence`.

For an abelian variety over a number field K, there exist a finite extension L/K and a finite set S of finite places of L such that outside S, every T_pA has trivial inertia at v for p≠p_v; at v∈S, inertia acts with (σ−1)(τ−1)=0 on V_pA for all σ,τ∈I_v and all p≠p_v. Thus the integral inertia image is pro-p. The same L works for all p. No condition at p=p_v is asserted.

**Hypotheses.** A is fixed; K is a number field. Potential semistable reduction is an existence input uniform in p; this minimal arithmetic consequence moves down from the higher Néron direction, with geometric proof gap G3.

**Construction or proof.**

1. Remove the finite set of bad places.
2. Apply SGA7 potential semistable reduction at each bad place, compose the finitely many local defining extensions into one number-field extension.
3. Use the semistable two-step unipotence criterion and then the pro-p inertia corollary.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `ArithmeticGaloisRepresentations:R01.6/good-reduction-specialization`.

**Sources.** [Alexander Grothendieck, Groupes de monodromie en géométrie algébrique, I, Exposé IX](https://grothendiecksga.com/read/sga7/fr/9-3.html), Exposé IX §3, Proposition 3.5, Corollary 3.5.2, Theorem 3.6 and Corollary 3.7; unpaginated electronic text; [Jean-Pierre Serre, Un critère d’indépendance pour une famille de représentations ℓ-adiques](https://ems.press/content/serial-article-files/43324), §3.1, p. 544.

**Acceptance.** The finite extension is uniform in p; primewise choices of extensions do not meet PST.

### Serre independence criterion

Target `ArithmeticGaloisRepresentations:R01.6/serre-bounded-independence`; proposed interface `serreBoundedIndependence`.

Let K be a number field and {ρ_p} a family of continuous compact representations of G_K indexed by primes. Assume B: for a single n every image is a closed subquotient of GL_n(Z_p). Assume PST: after one finite extension there is one finite S such that for p≠p_v inertia is trivial outside S and has pro-p image inside S. Then the family is almost independent: there is a finite extension L/K for which G_L→∏_p ρ_p(G_L) is surjective. No hypothesis at p=p_v and no maximal-image conclusion occur.

**Hypotheses.** Uniform bounded dimension n and one common PST extension are required. Compact subquotients are as in Serre §2; use the faithful lattice case for abelian applications. G4 records the finite-linear-group proof inputs that the existing roadmaps do not yet supply.

**Construction or proof.**

1. Delete finitely many small primes using Serre §7 Lemma 3 and virtual pro-p compact Lie structure.
2. Use uniform Jordan bounds to bound the prime-to-p quotient; Hermite–Minkowski and unramified class-field finiteness kill all such everywhere-unramified bounded quotients over one finite extension.
3. Use Nori’s bounded-dimension simple-factor classification and disjointness of characteristic-p simple groups for sufficiently large distinct p.
4. Kill own-prime inertia subgroups as in §8, then apply the common-simple-quotient/Goursat criterion to finite products and compactness to the full product.
5. Reinsert the finitely many deleted primes.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/independence-predicate`, `ArithmeticGaloisRepresentations:R01.1/continuous-representation`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Sources.** [Jean-Pierre Serre, Un critère d’indépendance pour une famille de représentations ℓ-adiques](https://ems.press/content/serial-article-files/43324), Theorem 1, §§2–3, pp. 543–545; Theorems 2–5, §§4–6, pp. 546–549; Lemmas 2–3 and §8, pp. 549–552.

**Acceptance.** The proof must include the finite exceptional primes and the common extension; separate finite-product surjectivity is insufficient.

**Atlas planet:** Serre independence.

### Abelian independence

Target `ArithmeticGaloisRepresentations:R01.6/independence-of-abelian-tate-actions`; proposed interface `independenceOfAbelianTateActions`.

For A over a number field K, there is a finite extension L/K such that the joint action G_L→∏_p ρ_{A,p}(G_L) is surjective on the product of its individual integral Tate images. It holds for all primes, without polarization degree exclusions or an open-GSp hypothesis. The extension is allowed to depend on A.

**Hypotheses.** A is an abelian variety over a number field.

**Construction or proof.**

1. Choose lattice bases only for applying B with n=2g.
2. Apply uniform potential unipotence for PST.
3. Apply Serre’s criterion and transport away from the chosen bases.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `ArithmeticGaloisRepresentations:R01.6/uniform-potential-unipotence`, `ArithmeticGaloisRepresentations:R01.6/serre-bounded-independence`.

**Sources.** [Jean-Pierre Serre, Un critère d’indépendance pour une famille de représentations ℓ-adiques](https://ems.press/content/serial-article-files/43324), §3.1, p. 544, and Theorem 1.

**Acceptance.** Independence is inside actual coordinate images; a CM example remains valid.

### Connectedness field

Target `ArithmeticGaloisRepresentations:R01.6/common-connectedness-field`; proposed interface `commonConnectednessField`.

For A over a number field K, the subgroup G_K⁰=ρ_{A,p}^{−1}(G_{A,p}⁰) is an open normal subgroup independent of p, where G_{A,p} is the rational Zariski closure and G_{A,p}⁰ its identity component. Its fixed field K^conn is finite Galois and after restriction to G_{K^conn} every algebraic monodromy group is connected. The statement concerns Zariski connectedness, not topological connectedness of a compact p-adic image.

**Hypotheses.** The family is rationally compatible at all good places outside a finite set, with density supplied by Chebotarev. LP Proposition 6.14 is first used on semisimplifications; G5 records the component-invariance input and the reductive coset-characteristic-polynomial closure argument.

**Construction or proof.**

1. Good Frobenius polynomials make the Tate family a compatible F-group system in LP’s sense.
2. Semisimplify through R01.1, apply LP 6.14 to the everywhere semisimple system using the coset characteristic-polynomial criterion.
3. Compare component groups before and after semisimplification: the kernel is unipotent and connected in characteristic zero, and the projection is surjective onto the semisimple closure.
4. Take the common fixed field and note that finite-index restriction preserves the identity component.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/integral-good-frobenius-polynomial`, `ArithmeticGaloisRepresentations:R01.1/semisimplification`, `ArithmeticGaloisRepresentations:G7/zariski-closure-and-monodromy-groups`.

**Sources.** [Michael Larsen, Richard Pink, On ℓ-independence of algebraic monodromy groups in compatible systems of representations](https://people.math.ethz.ch/~pink/ftp/LP2.pdf), §6, Proposition 6.14, author p. 15; Lemmas 6.11–6.12, pp. 15–16; §4, Lemmas 4.9–4.10, pp. 11–12; [Rodolphe Richard, Andrei Yafaev, Generalised André–Pink–Zannier conjecture for Shimura varieties of abelian type](https://arxiv.org/pdf/2111.11216v4), Theorem 4.9.

**Acceptance.** Do not use Faltings semisimplicity, a higher-tier theorem, as an unrecorded prerequisite.

### Independent connected field

Target `ArithmeticGaloisRepresentations:R01.6/common-independent-connected-field`; proposed interface `commonIndependentConnectedField`.

There is one finite extension L/K such that all G_{A,p,L} are connected and the restricted Tate family is independent. First pass to K^conn and then apply Serre independence over that number field. Finite extension preserves an already connected Zariski closure. Independence need not survive arbitrary finite extensions, so the reverse-order argument is not used.

**Hypotheses.** A is over a number field.

**Construction or proof.**

1. Use the common connectedness field.
2. Reapply the independence criterion over that field, where uniform boundedness and PST still hold.
3. Use density of a finite-index subgroup in a connected algebraic group to preserve connectedness.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/common-connectedness-field`, `ArithmeticGaloisRepresentations:R01.6/independence-of-abelian-tate-actions`.

**Sources.** [Jean-Pierre Serre, Un critère d’indépendance pour une famille de représentations ℓ-adiques](https://ems.press/content/serial-article-files/43324), Theorem 1, pp. 543–545; [Michael Larsen, Richard Pink, On ℓ-independence of algebraic monodromy groups in compatible systems of representations](https://people.math.ethz.ch/~pink/ftp/LP2.pdf), Proposition 6.14, author p. 15.

**Acceptance.** Do not assume independence is invariant under arbitrary finite base extension.

## Specialization in a family

### Family specialization

Target `ArithmeticGaloisRepresentations:R01.6/family-tate-specialization`; proposed interface `familyTateSpecialization`.

Let S be a normal geometrically integral scheme of finite type over a characteristic-zero finitely generated field F, with function field K, and 𝒜/S an abelian scheme. Normalize S in K̄. For a closed point s and a chosen point σ above s, the decomposition subgroup D_σ⊂G_K maps onto G_{κ(s)}, and for every n and prime p the torsion fibre comparison identifies 𝒜_η[p^n] with 𝒜_s[p^n], compatibly in n and equivariantly through this map. Consequently the specialized Tate image is identified with ρ_{η,p}(D_σ) as a subgroup of the generic image, up to conjugacy; the primewise comparisons are adelically compatible.

**Hypotheses.** S is normal and the family is smooth proper; n is invertible on S because char F=0. A decomposition group must be chosen; there is no canonical inclusion of G_{κ(s)} into G_K.

**Construction or proof.**

1. Import finite étale torsion from A3/A4 and the arithmetic specialization exact sequence from IG.1.
2. Use the common normalization and chosen σ to compare finite fibres.
3. Pass to inverse limits and the prime product; the kernel of D_σ→G_{κ(s)} acts trivially on the fibre.

**Needs.** `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`.

**Sources.** [Rutger Noot, Abelian varieties—Galois representation and properties of ordinary reduction](https://www.numdam.org/article/CM_1995__97_1-2_161_0.pdf), §1.2, p. 163.

**Acceptance.** All finite levels use the same geometric point and are compatible with the field action.

### Noot specialization

Target `ArithmeticGaloisRepresentations:R01.6/noot-full-image-specialization`; proposed interface `nootFullImageSpecialization`.

In the family-specialization setting, fix a prime p. There exist closed points s∈S such that, under the chosen specialization comparison, ρ_{s,p}(G_{κ(s)})=ρ_{η,p}(G_K). Such points exist in every nonempty open subset of S. The statement preserves the full integral p-adic image, not just its Zariski closure or openness. If the generic polarized image is p-Galois generic, these fibres are p-Galois generic. No simultaneous equality for all primes is asserted.

**Hypotheses.** S is normal, geometrically integral, finite type over a finitely generated characteristic-zero field; p is fixed. The finite-étale Hilbert specialization and compact p-adic finite-quotient detection contracts are requests Q5 and Q6.

**Construction or proof.**

1. Replace S by a smooth affine open and use an étale map to affine space as in Noot §1.4.
2. A compact closed matrix image intersects the finite-rank p-valued open subgroup of GL_n(Q_p) from Schneider 27.1. The restricted valuation has finite rank by Exercise 26.2 and is topologically finitely generated by Corollary 26.7. Take a normal core of this open pro-p subgroup U. The open characteristic subgroup Φ(U), normal in the whole image, gives a finite quotient that detects every closed subgroup via Frattini generation.
3. Realize that quotient by a connected finite étale cover of S.
4. Hilbert irreducibility gives a closed point with full decomposition image in the finite quotient; detection promotes it to equality of the full closed p-adic image.
5. Repeat on any nonempty open subset.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/family-tate-specialization`, `ArithmeticGaloisRepresentations:R01.6/prime-galois-genericity`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`.

**Sources.** [Rutger Noot, Abelian varieties—Galois representation and properties of ordinary reduction](https://www.numdam.org/article/CM_1995__97_1-2_161_0.pdf), Proposition 1.3 and §1.4, pp. 163–165; [Peter Schneider, p-Adic Lie Groups](https://doi.org/10.1007/978-3-642-21147-8), §26, Exercise 26.2, p. 182, Corollary 26.7, p. 186; §27, Theorem 27.1, pp. 192–194.

**Acceptance.** Equality is at one fixed prime; a finite level chosen arbitrarily may fail to detect a proper closed subgroup.

**Atlas planet:** Noot specialization.

## Required arithmetic examples

### Cyclotomic example

Target `ArithmeticGaloisRepresentations:R01.6/example-cyclotomic-pairing`; proposed interface `exampleCyclotomicPairing`.

The Tate module of roots of unity is Z_p(1) with the cyclotomic action; arithmetic Frobenius at v∤p acts by q_v, complex conjugation by −1, and geometric Frobenius by q_v⁻¹. This is the pairing target, not the untwisted rank-one trivial representation.

**Hypotheses.** K is a number field; p is prime; v∤p.

**Construction or proof.**

1. Import the current roots-of-unity Tate twist and R01.2 cyclotomic character.
2. Evaluate on compatible roots and compare the Frobenius convention.

**Needs.** `ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters`, `ArithmeticGaloisRepresentations:R01.1/tate-twist`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Proposition 2.8, p. 55.

**Acceptance.** At q_v=5 the arithmetic value is 5 and the geometric value its inverse.

### Split Tate example

Target `ArithmeticGaloisRepresentations:R01.6/example-split-tate`; proposed interface `exampleSplitTate`.

For a split Tate curve E_q and p≠p_K, the nonsplit extension 0→Z_p(1)→T_pE_q→Z_p→0 has determinant χ_p. Its rational inertia coinvariants have dimension one and Frobenius eigenvalue 1, yielding Q=1−T; its conductor is 1 even though the semisimplified action has tame conductor 0. Its residual action is unramified precisely when p|v(q).

**Hypotheses.** 0<|q|<1; p≠p_K.

**Construction or proof.**

1. Apply the Tate matrix comparison and its nonzero inertia Kummer class.
2. Use the existing R01.3 conductor comparison and the residual Kummer valuation.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/tate-uniformization-action`, `ArithmeticGaloisRepresentations:R01.6/elliptic-conductor-export`, `ArithmeticGaloisRepresentations:R01.6/abelian-euler-polynomial`.

**Sources.** [Henri Darmon, Fred Diamond, Richard Taylor, Fermat’s Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.2, Proposition 2.12, pp. 56–57.

**Acceptance.** This example detects the wrong primal-invariant arithmetic Euler factor.

### Supersingular example

Target `ArithmeticGaloisRepresentations:R01.6/example-supersingular-good`; proposed interface `exampleSupersingularGood`.

For E:y²=x³−x over F₃, #E(F₃)=4, P₃(X)=X²+3, and for every p≠3 arithmetic Frobenius on V_pE has trace 0 and determinant 3. The lift of this curve over Q has good reduction at 3, so its p-adic Tate action is unramified there and Q₃(T)=1+3T². No ordinary split or finite group-scheme product decomposition of E[3] is asserted.

**Hypotheses.** p≠3; the short Weierstrass model has nonzero discriminant mod 3.

**Construction or proof.**

1. Count the three affine points with y=0 and the point at infinity.
2. Use the native finite-field supersingularity criterion for the zero trace in characteristic 3, and the Frobenius polynomial comparison.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/integral-good-frobenius-polynomial`, `ArithmeticGaloisRepresentations:R01.6/weierstrass-local-polynomial-comparison`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

**Sources.** [James S. Milne, Elliptic Curves](https://www.jmilne.org/math/Books/EC2.pdf), V §§7–8, pp. 214–222; [James S. Milne, Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf), I Remark 7.4, p. 34, corrected; II §1, pp. 75–77.

**Acceptance.** E[3] is not α₃²; source issue E9001 records the tangent-space obstruction.

### CM example

Target `ArithmeticGaloisRepresentations:R01.6/example-cm-over-q`; proposed interface `exampleCmOverQ`.

For E:y²=x³−x over Q, the automorphism (x,y)↦(−x,iy) over Q(i) defines the Q(i) action on V_pE. Over Q(i) the representation is coefficient-linear; over Q, complex conjugation sends i to −i and permutes the split coefficient components. For p=5 there are two rank-one Q₅ components; for p=3 one rank-one Q₃(i) component. The full Q-representation remains two-dimensional and odd, but it is not a Q(i)-linear GL2-type representation over Q. Its image over Q(i) is not open in full GL₂.

**Hypotheses.** p is prime; the curve is considered in characteristic zero.

**Construction or proof.**

1. Check the displayed geometric automorphism squares to [-1] and conjugates under c.
2. Use the λ decomposition at split and inert primes.
3. Use centralization of Q(i) and dimension of its torus to exclude full GL₂ openness.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/endomorphism-coefficient-action`, `ArithmeticGaloisRepresentations:R01.6/lambda-rational-component`, `ArithmeticGaloisRepresentations:R01.6/real-conjugation-eigenspaces`, `ArithmeticGaloisRepresentations:R01.6/prime-galois-genericity`.

**Sources.** [Kenneth A. Ribet, Abelian varieties over Q and modular forms](https://math.berkeley.edu/~ribet/Articles/korea.pdf), §2 and §3, Lemma 3.2, pp. 2–5.

**Acceptance.** Do not conflate a CM elliptic curve’s geometric degree-two coefficient field with a degree-g K-defined GL2-type field.

### Frobenius example

Target `ArithmeticGaloisRepresentations:R01.6/example-frobenius-five`; proposed interface `exampleFrobeniusFive`.

For E:y²=x³−x over F₅, the affine fibres over x=0,1,2,3,4 have respectively 1,1,2,2,1 points, so #E(F₅)=8. Thus P₅(X)=X²+2X+5 and Q₅(T)=1+2T+5T². On V_pE, p≠5, arithmetic Frobenius has trace −2 and determinant 5; geometric Frobenius has trace −2/5 and determinant 1/5. On H¹=V_pE^∨ geometric Frobenius has trace −2 and determinant 5.

**Hypotheses.** p≠5.

**Construction or proof.**

1. Count points and substitute into q+1−#E.
2. Use the inverse and contragredient characteristic-polynomial identities.

**Needs.** `ArithmeticGaloisRepresentations:R01.6/finite-field-frobenius-conventions`, `ArithmeticGaloisRepresentations:R01.6/integral-good-frobenius-polynomial`.

**Sources.** [James S. Milne, Elliptic Curves](https://www.jmilne.org/math/Books/EC2.pdf), V Proposition 7.5, p. 217; Proposition 8.3, p. 221.

**Acceptance.** This pins both the sign of a_v and the arithmetic/geometric dual convention.

## Signature ledger

The older pin supplies the native scheme and linear algebra carriers, but lacks several arithmetic and geometric supplier APIs. Object-valued fixtures in the suggested file name those interfaces. They are not alternative definitions to implement. Full hypotheses are the target statements above; an omitted condition makes a prototype weaker than that mathematical statement. No such prototype is an independent mathematical claim.

| Interfaces | Supplier and precise omission or comparison still required |
|---|---|
| Geometric points, finite torsion, `TTate`, `toLevel`, `tateMap`, `VTate`, `fieldTateRep`, `rationalTateRep` | A3/A4/current generic TateModule supplies the native carrier, point group operations, finite-level scalar action, limit topology, free finite module instances and scalar extension. Identify all fixtures with these imports. The field-action API must compare actual point maps, not merely an unspecified representation. |
| `divisionField_two_cubic`, `fieldTate_elliptic_level_three` | `cubicCurveAV` is A1's actual scheme realization of y²=x³−x−1 over Q. Establish that identification; the splitting field is the field generated by all roots of X³−X−1. The tests use the actual division field and nonzero level quotient. |
| `nativeEllipticTateComparison` | A1 supplies the zero-preserving equivalence to the native affine point group. The prototype states a linear equivalence; the target additionally requires topology, finite projections, Galois and isogeny equivariance, and matching finite/limiting Weil pairings. The current generic TateModule replaces its explicitly labelled inverse-limit supplier fixture. |
| `residualCyclicIsogenies` | The kernel and Galois-stability criterion is typed on actual torsion. The target also records separable degree ℓ, elliptic target dimension and the equivalence with a residual F_ℓ line. These follow from the imported A3 quotient; they are not replaced by a freely chosen linear representation. |
| `quadraticTwistTateComparison` | Require the actual quadratic character, its actual geometric twist B, and the chosen geometric twist isomorphism inducing the intertwiner. These geometric conditions are omitted from the signature; A6/quadratic-twists-and-restriction supplies them. |
| `isogenyTateCokernel` | The typed additive equivalence requires its Galois equivariance and cardinality ℓ^{v_ℓ(deg f)}, plus the degree-coprime integral isomorphism. The canonical boundary map is supplied by the V/T realization and division torsion. |
| `polarizationPairing`, `arithmeticPairing_equivariant` | The scheme map to `dualVariety` must be the polarization induced by an ample line bundle, using A2. The ample-line condition and divisor-to-dual identification are omitted. A scalar-valued form also chooses a generator of Q_ℓ(1). Integral perfectness requires ℓ prime to the polarization degree. |
| `realConjugationEigenspaces` | A rational anti-symplectic involution with multiplier −1 already gives the typed dimensions. The actual real embedding and induced complex conjugation are the geometric instance. Integral splitting is only at odd primes; the dyadic statement remains rational. |
| `goodReductionSpecialization`, `goodReductionInertia` | Require a common proper smooth abelian model over a henselian DVR, its special fibre B, the actual local inertia subgroup and ℓ≠char k. Model and local-group data are omitted from these signatures. The finite-level étale comparison and all transition compatibilities are necessary. |
| `residueFrobenius`, `finiteFieldFrobeniusConventions`, `integralGoodFrobeniusPolynomial` | Require k finite of cardinality q, the actual q-power arithmetic automorphism and the special-fibre Frobenius endomorphism; the polynomial is A6's integral endomorphism polynomial. The prototype states one prime's polynomial comparison; the same imported integral polynomial gives all primes and good-place transport. |
| `tateUniformizationAction`, `exampleSplitTate` | The matrix entries are the actual cyclotomic character and Kummer cocycle of a split Tate curve with 0<|q|<1 over the given local field; ℓ differs from the residue characteristic. The matrix determinant and Euler conclusion prototypes omit the uniformization and nonzero inertia class. The full target includes the unsplit extension, quotient operator, residual valuation criterion and unramified quadratic nonsplit twist. |
| `additiveEllipticInertia` | The actual elliptic curve has additive reduction over the local field, with its inertia and ℓ≠p_v. Those conditions are omitted; G1 identifies the needed classification argument, including p_v=2,3. |
| `weierstrassLocalPolynomialComparison` | Besides the typed DVR and fraction field, require henselian local arithmetic data, a finite residue field, actual inertia/Frobenius choices and ℓ≠p_v. The target also transports formal reciprocal power series and native local Euler coefficient functions. |
| `ellipticConductorExport` | Both conductor objects are R01.3 suppliers. Their local-place data, ramification filtration and Ogg–Saito hypothesis are omitted. Import the prime-to-ℓ residual comparison only with its E/Q and ℓ≥5 hypotheses, and preserve its inherited gap G2. |
| `withCoefficients`, `lambdaComponent`, `lambdaComponent_sum` | Their module instances are induced by the actual endomorphism action. The local field map is the canonical completion-factor projection; the sum prototype is an additive equivalence, while the target requires a Q_ℓ-linear, topological and Galois equivalence. The split/inert tests retain actual component constructions and degree-two completion inputs; identify E with Q(i) for the concrete CM examples. |
| `integralLambda`, `rationalizeOrder`, `fractionFactor`, `integralLambda_fraction` | Use the actual maximal-order embedding and canonical integral completion factor. Rationalizing that embedding and extending the factor to fraction fields are imported number-field operations. The target additionally preserves Galois action and identifies a full stable lattice. The ramified test uses that actual rank-one lattice, residue cardinality 2 and 2=uπ², not just an ideal identity. |
| `integralLambda_uniformizer`, `uniformizerResidualEquiv` | The first signature states the change-of-uniformizer formula; the second types the residual-to-torsion equivalence for a free DVR lattice. Identify V/T with geometric division torsion. Its canonical form has the rank-one tensor λ⁻¹O/O; an unconditional choice-free residual-to-geometric-torsion map is not specified. |
| `balancedLambdaPairing`, `lambdaOddness` | The determinant signature requires a polarization, a totally real degree-g coefficient field fixed by Rosati, the canonical λ factor, and the cyclotomic character after scalar extension. Oddness instead requires A/Q, a Q-defined degree-g coefficient field and actual complex conjugation; it uses A4's E-linear Betti realization. Those geometric conditions are omitted from the respective signatures. |
| `coefficientFrobeniusComparison` | Require the actual good model, specialized coefficient endomorphisms, ℓ≠p_v, arithmetic Frobenius choices and the fibre comparison induced by good specialization. The target includes the norm comparison on characteristic polynomials; no independent E-valued compatible polynomial is inferred. |
| `pGeneric`, `adelicGeneric`, their isogeny APIs and `genericityTransport` | The explicit predicates use a supplied ambient topological group. For this layer it must be the full polarization lattice-similitude group, not the image or relative Mumford–Tate group. The isogeny signatures type topological conjugacy; the arithmetic target additionally uses commensurable lattices and proportional polarization forms under full-GSp openness. The zero-rank convention removes a separate multiplier coordinate. The dyadic test uses a surjection to the actual rank-two integral GL₂(Z₂). |
| `independent`, `almostIndependent` | These explicit group formulas use the product of ranges and restricted ranges. Instantiate continuity and compactness on the Krull group and imported Tate topology for the finite-product criterion. Pairwise independence is tested separately from joint independence. |
| `uniformPotentialUnipotence` | `localInertia` and `residuePrime` are R01.2 suppliers. The open-subgroup signature describes a single finite defining extension and its intersections with K's inertia groups; the full statement uses places of that extension and includes the integral pro-p conclusion. G3 supplies geometric existence. |
| `serreBoundedIndependence` | Uniform B (one n, compact closed subquotients of GL_n(Z_p)) and common PST (one extension and finite S with the stated off-diagonal inertia conditions) cannot yet be expressed through complete suppliers at the pin and are omitted. They must be restored; continuity alone does not imply the criterion. No condition at p=p_v is added. |
| `monodromyComponentKernel`, `commonConnectednessField`, `commonIndependentConnectedField` | G7 supplies the rational algebraic Zariski closure and its identity component. The fixture is their actual inverse image. Identifying the component kernel, finite Galois fixed field and preservation of connected closure after restriction is part of the target. G5 supplies compatible-system component comparison without higher-tier Faltings semisimplicity. |
| `familyTateSpecialization`, `nootFullImageSpecialization` | S is normal geometrically integral finite type over a finitely generated characteristic-zero field F, K is its function field, A and `fibres` are the fibres of one proper smooth abelian group family, s is closed, and one point above s in the normalization is chosen. These omitted conditions determine the decomposition and residue maps, intertwiners and transported image action. Q5/Q6 give the fixed-prime finite-cover and detection contracts; no arbitrary inclusion of a residue Galois group is used. |
| Required example signatures | The cyclotomic example requires actual arithmetic Frobenius of norm q and actual complex conjugation. The two point counts are on the explicit nonsingular native curves over F₃ and F₅. The CM matrix test and centralizer nonexample require the actual Q(i)-endomorphism realization for y²=x³−x. The full target also identifies semilinear conjugation and the split/inert completions. |

## Closure contracts

The stage has target-level coverage **planned**. All parent targets are mapped, and every prerequisite chain is represented by an import, requested contract or the precise gaps below. This is a complete planning pass, not a closed proof graph.

### G1 — Additive inertia at residue characteristics 2 and 3

Close the potential-good finite-inertia and ramified potentially-multiplicative classification argument for additive elliptic reduction, proving zero rational invariants and coinvariants at every ℓ≠p_v. DDT Proposition 2.13 explicitly treats p_v>3; the wild low-characteristic extension must be justified using the exact local geometric classification. The existing EllipticCurves Layer 4 contract is imported but not asserted to contain this stronger proof.

Needed by `ArithmeticGaloisRepresentations:R01.6/additive-elliptic-inertia`, `ArithmeticGaloisRepresentations:R01.6/weierstrass-local-polynomial-comparison`, `ArithmeticGaloisRepresentations:R01.6/elliptic-conductor-export`.

### G2 — Inherited Ogg–Saito proof input

R01.3/conductor-of-an-elliptic-curve owns the conductor theorem, including wild Swan terms. Its parent records an unclosed Ogg–Saito/Néron input. Instantiate its actual Tate representation here, propagate that gap, and repoint its old R01.6 carrier dependency to A4/current native Tate APIs. The minimal conductor comparison belongs at Tier 7 R01.3; no upward Néron prerequisite is used here.

Needed by `ArithmeticGaloisRepresentations:R01.6/elliptic-conductor-export`.

### G3 — Uniform potential semistable geometric existence proof

SGA 7 I Exposé IX §3, Theorem 3.6, its two-step criterion and pro-ℓ consequence were read in the public electronic text. The geometric proof through Exposé III was not read or reconstructed. Supply that proof chain for a single finite extension uniform in ℓ. The precise printed page of §3.6 is unverified; the electronic source has no page labels. This minimal arithmetic consequence moves down from Tier 8 NéronModelsAndSemistableAbelianVarieties.

Needed by `ArithmeticGaloisRepresentations:R01.6/uniform-potential-unipotence`, `ArithmeticGaloisRepresentations:R01.6/independence-of-abelian-tate-actions`, `ArithmeticGaloisRepresentations:R01.6/common-independent-connected-field`.

### G4 — Uniform finite-linear-group ingredients in Serre’s criterion

Serre §§4–8 were read through the criterion proof. Its uniform Jordan bound, Nori simple-factor theorem for bounded-dimensional characteristic-p linear groups, and large-prime disjointness use external finite-group inputs not supplied by the audited lower roadmap interfaces. Establish those proof chains or extend their lower generic group owner. State the full B/PST criterion and retain the finite exceptional-prime reinsertion.

Needed by `ArithmeticGaloisRepresentations:R01.6/serre-bounded-independence`.

### G5 — Compatible-system component comparison

LP Proposition 6.14 applies to everywhere semisimple compatible systems. Without importing higher-tier Faltings semisimplicity, first semisimplify and prove that the algebraic closure projection has connected unipotent kernel, hence identical component-kernel inverse images. Also supply the reductive coset characteristic-polynomial closure lemma used by LP 4.9–4.10 and 6.11–6.12. G7 supplies ordinary Zariski closure and component objects, not these specialized compatible-system proofs.

Needed by `ArithmeticGaloisRepresentations:R01.6/common-connectedness-field`, `ArithmeticGaloisRepresentations:R01.6/common-independent-connected-field`.

### G6 — Compact linear subgroup supplier integration

The mathematical route is verified using Schneider Theorem 27.1, Exercise 26.2 and Corollary 26.7, read in the maintainer-cleared 2011 book. The libraries and current ProfiniteProPGroups/ProfiniteArithmetic roadmaps provide Frattini theory but no audited general p-valued compact matrix subgroup interface. Q6 requests that generic extension; close the exact integration contract before claiming Noot’s prerequisite graph closed. No copy or passage from the book is included.

Needed by `ArithmeticGaloisRepresentations:R01.6/noot-full-image-specialization`, `ArithmeticGaloisRepresentations:R01.6/serre-bounded-independence`.

## Requested supplier interfaces

- **Q1: Existing EllipticCurves Layer 2 interface.** Supplier `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`. The native point Tate module, finite-level Weil pairing, cyclotomic multiplier and determinant theorem, with prime distinct from characteristic and compatible argument order. Import the current implemented APIs and use A1 for the scheme carrier.
- **Q2: Existing elliptic local-field interface.** Supplier `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`. Split/nonsplit Tate uniformization and its Kummer matrix, ramified quadratic twist for potentially multiplicative reduction, and potential-good finite inertia. The p=2,3 additive invariant argument is not assumed supplied: G1 records it.
- **Q3: Existing finite-field elliptic interface.** Supplier `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`. Point-count, Frobenius and the supersingular trace criterion for elliptic curves, including the native affine/projective point identification.
- **Q4: Arithmetic fibre specialization.** Supplier `InverseGaloisAndArithmeticFundamentalGroups:IG.1`. For a normal integral base, chosen normalization point and a finite étale cover, the decomposition subgroup maps onto the residue absolute Galois group; its kernel acts trivially on the cover fibre. Include finite étale torsion over a henselian DVR and compatibility of all levels.
- **Q5: Finite-étale Hilbert specialization.** Supplier `InverseGaloisAndArithmeticFundamentalGroups:IG.2`. Over a finitely generated characteristic-zero field F and every nonempty open of a normal geometrically integral finite-type S/F, a connected finite étale Galois cover admits closed points with full decomposition image. IG.2 currently provides regular-polynomial specialization, which does not by itself state this full finite-étale contract.
- **Q6: Finite quotient detection.** Supplier `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`. Import the implemented Frattini generation criterion. For a compact closed subgroup H⊂GL_n(Z_p), obtain an open normal topologically finitely generated pro-p U by the Schneider valuation argument, then H/Φ(U) is finite and every closed J≤H mapping onto it equals H. The compact linear input is a Part II extension request in the existing profinite direction, not a second Frattini plan.
- **Q7: Existing class-field finiteness interface.** Supplier `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`. For a fixed number field and bound c, the maximal everywhere-unramified abelian extension of degree at most c is contained in one finite extension; combine class-field theory with Hermite–Minkowski as in Serre Theorem 2.

## Parent-target accounting and downstream exports

The parent packet is unchanged. Its 18 R01.6 target ids are accounted for as follows; foundational imports remain owned by their supplying layers.

| Parent target suffix | Arithmetic targets or imports |
|---|---|
| `tate-module-of-an-abelian-variety` | `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `ArithmeticGaloisRepresentations:R01.6/division-field-interface`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module` |
| `torsion-and-residual-representation` | `ArithmeticGaloisRepresentations:R01.6/finite-torsion-action`, `ArithmeticGaloisRepresentations:R01.6/residual-cyclic-isogenies` |
| `elliptic-tate-module-comparison` | `ArithmeticGaloisRepresentations:R01.6/native-elliptic-tate-comparison` |
| `functoriality-products-and-isogenies` | `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `ArithmeticGaloisRepresentations:R01.6/separable-base-change-action`, `ArithmeticGaloisRepresentations:R01.6/isogeny-tate-cokernel`, `ArithmeticGaloisRepresentations:R01.6/quadratic-twist-tate-comparison`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module` |
| `weil-pairing-on-tate-modules` | `ArithmeticGaloisRepresentations:R01.6/arithmetic-polarized-pairing` |
| `determinant-of-a-symplectic-similitude` | `ArithmeticGaloisRepresentations:G7/similitude-groups` |
| `determinant-and-oddness` | `ArithmeticGaloisRepresentations:R01.6/tate-determinant-character`, `ArithmeticGaloisRepresentations:R01.6/real-conjugation-eigenspaces` |
| `determinant-of-a-weierstrass-isogeny-on-the-tate-module` | `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module` |
| `specialisation-of-torsion-at-good-reduction` | `ArithmeticGaloisRepresentations:R01.6/good-reduction-specialization` |
| `good-reduction-frobenius-polynomial` | `ArithmeticGaloisRepresentations:R01.6/finite-field-frobenius-conventions`, `ArithmeticGaloisRepresentations:R01.6/integral-good-frobenius-polynomial` |
| `tate-module-of-the-tate-curve` | `ArithmeticGaloisRepresentations:R01.6/tate-uniformization-action` |
| `comparison-with-weierstrass-local-polynomial` | `ArithmeticGaloisRepresentations:R01.6/weierstrass-local-polynomial-comparison`, `ArithmeticGaloisRepresentations:R01.6/elliptic-conductor-export` |
| `local-euler-factor-of-an-abelian-variety` | `ArithmeticGaloisRepresentations:R01.6/abelian-euler-polynomial` |
| `tate-module-with-endomorphism-coefficients` | `ArithmeticGaloisRepresentations:R01.6/endomorphism-coefficient-action`, `ArithmeticGaloisRepresentations:R01.6/lambda-rational-component`, `ArithmeticGaloisRepresentations:R01.6/integral-lambda-component`, `ArithmeticGaloisRepresentations:R01.6/balanced-lambda-pairing`, `ArithmeticGaloisRepresentations:R01.6/lambda-oddness`, `ArithmeticGaloisRepresentations:R01.6/coefficient-frobenius-comparison` |
| `galois-generic-abelian-varieties` | `ArithmeticGaloisRepresentations:R01.6/prime-galois-genericity`, `ArithmeticGaloisRepresentations:R01.6/adelic-galois-genericity`, `ArithmeticGaloisRepresentations:R01.6/genericity-transport` |
| `serre-independence-and-connectedness` | `ArithmeticGaloisRepresentations:R01.6/independence-predicate`, `ArithmeticGaloisRepresentations:R01.6/uniform-potential-unipotence`, `ArithmeticGaloisRepresentations:R01.6/serre-bounded-independence`, `ArithmeticGaloisRepresentations:R01.6/independence-of-abelian-tate-actions`, `ArithmeticGaloisRepresentations:R01.6/common-connectedness-field`, `ArithmeticGaloisRepresentations:R01.6/common-independent-connected-field` |
| `noot-specialization` | `ArithmeticGaloisRepresentations:R01.6/family-tate-specialization`, `ArithmeticGaloisRepresentations:R01.6/noot-full-image-specialization` |
| `required-examples` | `ArithmeticGaloisRepresentations:R01.6/example-cyclotomic-pairing`, `ArithmeticGaloisRepresentations:R01.6/example-split-tate`, `ArithmeticGaloisRepresentations:R01.6/example-supersingular-good`, `ArithmeticGaloisRepresentations:R01.6/example-cm-over-q`, `ArithmeticGaloisRepresentations:R01.6/example-frobenius-five` |

The residual finite-torsion and coefficient interfaces feed ClassicalSerreModularity R27.1/R33.1 and EllipticCurveModularity R29.1. Hom-compatible arithmetic maps feed FaltingsFinitenessAndIsogenyTheorems R28.4 without using its isogeny theorem as an input. Geometric coefficient semilinearity feeds ComplexMultiplicationAndExplicitReciprocity CM.4. HeegnerPointEulerSystems HE.7 consumes independence of actual image fields. The no-Jacobian direction consumes prime/adelic genericity and owns its additional adelic theorem.

The Tier 8 Néron direction imports the Tier 7 uniform potential-unipotence arithmetic consequence and the existing R01.3 conductor comparison. Repoint obsolete carrier and general-pairing dependencies to A3/A4 and current native Tate APIs. The generic compact linear subgroup contract is a requested Part II extension in the existing profinite direction; it does not replan Frattini theory.

The ownership proposal records “ProfiniteProPGroups, Part II: Compact linear subgroup detection”: first supply the p-valued closed-linear-subgroup finite-generation bridge, then the finite detection quotient, importing existing Frattini theory. R01.6 consumes this through Q6. The existing roadmap remains unchanged.

## Source versions, corrections and access

Sources supply individual mathematical targets above. The following is a version inventory, not a source-by-source account of their contents. Author copies and published page numbers are distinguished.

- [James S. Milne, *Abelian Varieties*](https://www.jmilne.org/math/CourseNotes/AV.pdf): Course notes, version 2.00, 16 March 2008. Read 2026-10-09. public author, archive or publisher copy.
- [James S. Milne, *Elliptic Curves*](https://www.jmilne.org/math/Books/EC2.pdf): Second edition, World Scientific, 2021, EC2.pdf author copy. Read 2026-10-09. public author, archive or publisher copy.
- [Henri Darmon, Fred Diamond, Richard Taylor, *Fermat’s Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf): Author PDF, 2007 posting of the published exposition. Read 2026-10-09. public author, archive or publisher copy.
- [Kenneth A. Ribet, *Abelian varieties over Q and modular forms*](https://math.berkeley.edu/~ribet/Articles/korea.pdf): 1992 author copy. Read 2026-10-09. public author, archive or publisher copy.
- [Rutger Noot, *Abelian varieties—Galois representation and properties of ordinary reduction*](https://www.numdam.org/article/CM_1995__97_1-2_161_0.pdf): Compositio Mathematica 97 (1995), 161–171. Read 2026-10-09. public author, archive or publisher copy.
- [Jean-Pierre Serre, *Un critère d’indépendance pour une famille de représentations ℓ-adiques*](https://ems.press/content/serial-article-files/43324): Commentarii Mathematici Helvetici 88 (2013), 541–554. Read 2026-10-09. public author, archive or publisher copy.
- [Michael Larsen, Richard Pink, *On ℓ-independence of algebraic monodromy groups in compatible systems of representations*](https://people.math.ethz.ch/~pink/ftp/LP2.pdf): 1992 author copy, Inventiones Mathematicae 107, 603–636. Read 2026-10-09. public author, archive or publisher copy.
- [David Masser, Umberto Zannier, *Abelian varieties isogenous to no Jacobian*](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf): Annals of Mathematics 191 (2020), 635–674. Read 2026-10-09. public author, archive or publisher copy.
- [Richard Pink, *A combination of the conjectures of Mordell–Lang and André–Oort*](https://people.math.ethz.ch/~pink/ftp/pink.pdf): 2005 author copy, published pp. 251–282. Read 2026-10-09. public author, archive or publisher copy.
- [Rodolphe Richard, Andrei Yafaev, *Generalised André–Pink–Zannier conjecture for Shimura varieties of abelian type*](https://arxiv.org/pdf/2111.11216v4): arXiv:2111.11216v4, 20 October 2023; published IHÉS version 2025 is not the version read. Read 2026-10-09. public author, archive or publisher copy.
- [Alexander Grothendieck, *Groupes de monodromie en géométrie algébrique, I, Exposé IX*](https://grothendiecksga.com/read/sga7/fr/9-3.html): SGA 7 I, LNM 288 (1972); electronic transcription, Exposé IX §3. Read 2026-10-09. public author, archive or publisher copy.
- [Peter Schneider, *p-Adic Lie Groups*](https://doi.org/10.1007/978-3-642-21147-8): Grundlehren 344, Springer, 2011. Read 2026-10-09. Maintainer-cleared reference library, reading only; no source file or passage reproduced.

**E9001 (Version 2.00, I Remark 7.4, p. 34).** The remark presents A[p] as a product of ordinary factors and copies of α_p determined only by the p-rank. The p-rank gives the number of geometric p-torsion points, but it does not determine the finite group scheme. A supersingular elliptic curve has a nontrivial local-local p-torsion group scheme that is not α_p×α_p. For a supersingular elliptic curve the p-rank is zero, so the displayed product would have tangent dimension two. The kernel of [p] on the elliptic curve has tangent dimension one, since d[p]=0 on its one-dimensional tangent space. Search of the recorded author/version correction resources found no published correction of this finding.

**E9002 (Second edition EC2.pdf, V Proposition 8.1 proof, p. 220).** The proof takes the stabilizer of a single torsion point as a normal subgroup and thereby treats its fixed field as Galois. Use the kernel of the action on the entire finite torsion group and its finite Galois division field, then injectivity of reduction shows inertia acts trivially. A one-point stabilizer need not be normal. For y²=x³−x−1 over Q the 2-division cubic is irreducible with nonsquare discriminant −23, so its Galois group is S₃. A nonzero point stabilizer has order two and is not normal. Search of the recorded author/version correction resources found no published correction of this finding.

**E9003 (Version 2.00, IV §3, Frobenius notation before Theorem 3.3, p. 140).** The exponent q_v is defined by the cardinality of the extension residue field k(w) while describing the Frobenius of k(w)/k(v). Use q_v=#k(v). The arithmetic generator acts on k(w) by x↦x^{#k(v)}. If q_v=#k(w), the stated power map is the identity on k(w), so it cannot generate a nontrivial residue extension. Search of the recorded author/version correction resources found no published correction of this finding.

Inherited corrections E650, E651 and E794 are used and referenced, not resubmitted as new findings. No passage or file from the cleared Schneider book is reproduced. SGA7 Exposé IX §3 is cited by its numbered statements in the public electronic transcription; its printed page labels and the geometric proof in Exposé III remain G3.

## Acceptance and atlas display

The six planets are Tate realization, Frobenius polynomial, Local Euler polynomial, λ-adic component, Serre independence, Noot specialization. All nine definition/construction targets have named APIs and at least three discriminating tests. The computed division-field degree, nonzero torsion quotient, four local polynomial cases, ramified residual length, dyadic lattice, CM centralizer and pairwise-independence trap distinguish plausible incorrect interfaces. The suggested file must elaborate at the stated pin with only its intended proof-placeholder warnings. Mathematical closure additionally requires G1–G6 and Q5/Q6; implementation status remains unchecked.
