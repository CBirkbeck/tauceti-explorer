# Algebraic curves — function fields, divisors, and Riemann–Roch, Part II: global function-field arithmetic

Arithmetic of a one-variable function field over its finite exact constant field: projective adeles and ideles, residue Fourier analysis, Artin–Schreier–Witt extensions, equal-characteristic class field theory, curve zeta functions and degree-sensitive Chebotarev, reductive automorphic forms and the unitary Siegel–Eisenstein coefficients. Existing curve geometry, generic restricted products, local representation theory and Hermitian densities are imported. Certified arithmetic consumes finite-field factorization and point-count certificates.

This is the complete target-level planning pass for FA.0–FA.7. All eight layers are **planned**, and none is closed. The 48 targets have exact mathematical contracts and prerequisite chains ending in audited library declarations, existing roadmap inputs, requested supplier interfaces or the four recorded gaps. Every implementation status is unchecked. The mathematical statements below are definitive; elaboration of the accompanying suggested signatures establishes their compatibility with the pinned types, without establishing their proofs or the conditions that their supplier interfaces cannot yet express.

The base is AlgebraicCurves. Its normalization, smooth-projective curve dictionary, divisors, Riemann–Roch, local completions, residue theory, separable ramification, different and Hurwitz theorems are imported. Generic restricted products and Haar products belong to Completed/RestrictedProducts and AdelicAlgebraicGroups AA.0. Ordinary Picard schemes and vector-bundle duality belong to SchemeAndStackFoundations SF.3 and the current AlgebraicVectorBundles roadmap. This part supplies the additional arithmetic of finite exact constants.

Unless a target says otherwise, k=Fq is the exact constant field of K=k(X), X is smooth, projective and geometrically connected, and g is its genus. A place has normalized order ord_v(π_v)=1 and residue degree d_v over k. Degrees are weighted by d_v. Valuation degree and Yu degree have opposite signs. Arithmetic Artin sends an unramified uniformizer to arithmetic Frobenius; Euler factors and étale cohomology use geometric Frobenius, its inverse. Constant extensions retain the stated base field when measuring a degree. A degree-one divisor can have negative coefficients and need not come from a rational point.

The target order is acyclic even though one FA.5 result supplies FA.4. Schmidt's degree-one theorem follows directly from an independent all-extension Weil estimate supplied by WC.5. It supplies the degree splitting for ray classes and reciprocity. Zeta rationality then uses Schmidt and Riemann–Roch. No class-field existence theorem is an input to Schmidt or its Weil estimate.

Four ownership corrections govern the pass. FF.3 supplies factorization and point-count algorithms; FA.7 consumes their certificates and assembles the L-polynomial. GS.0 supplies Bun_G and GS.1 supplies the affine/Beilinson–Drinfeld Grassmannians to ET.2b; FA.2/FA.6 supply arithmetic to ET.3. Schmidt is owned by FA.5, with the Bhargava–Shankar–Taniguchi et al. route and AUDIT-01 requiring maintainer retargeting. ES7 imports this part's adelic and central-degree infrastructure; its division-algebra orders, compactness, spectral decomposition and trace comparisons remain its own targets.

## Library and roadmap inventory

The planning baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The actual statements, hypotheses and source files of the following 28 receipts were read at those pins. A native declaration is reused at its actual generality.

| Native receipt | What is already supplied |
|---|---|
| tauceti:TauCeti.IsFunctionField | One-variable function field is an explicit proposition, not an instance: a transcendental generator with finite-dimensional extension of its rational subfield. |
| tauceti:TauCeti.IsFunctionField.exists_intermediateField_isIntegrallyClosedIn | There is a finite intermediate constant extension in which the resulting field is a function field with exact constants. |
| tauceti:TauCeti.Place | Surjective normalized discrete valuation trivial on constants; its integer ring, residue field and residue degree are native. |
| tauceti:TauCeti.Place.ordAddMonoidHom | Order on units as an additive homomorphism; the unrestricted order of zero is a junk value and is not used for divisors. |
| tauceti:TauCeti.Divisor.degree | Finite-support integer divisors have degree weighted by the residue-field degree over the specified constants. |
| tauceti:TauCeti.Divisor.principal | The principal divisor of a field unit has the place orders as coefficients. |
| tauceti:TauCeti.Divisor.degree_principal | For IsFunctionField k F and z in F units, the weighted degree of the principal divisor is zero. |
| tauceti:TauCeti.Divisor.degreeClass | Degree descends to the native order-system divisor class group. |
| tauceti:TauCeti.riemannRochSpace | The k-submodule defined by the multiplicative valuation inequalities; zero is included even for negative divisors. |
| tauceti:TauCeti.finiteDimensional_riemannRochSpace | For an explicit function-field proof and any divisor, the Riemann–Roch space is finite-dimensional. |
| tauceti:TauCeti.riemannRochSpace_zero_of_isIntegrallyClosedIn | With exact constants, L(0) equals the image of the constants. Without exactness it equals the relative algebraic closure instead. |
| tauceti:TauCeti.Divisor.finite_ker_degreeClass | With finite constants and a function-field proof, the kernel of degree on divisor classes is finite. |
| tauceti:TauCeti.Divisor.finite_setOf_isEffective_degree_le | Effective divisors of bounded degree form a finite set over finite constants. |
| tauceti:TauCeti.weilDifferentialSpace | Weil differentials are bounded linear forms on the native K-valued repartitions annihilating the diagonal. |
| tauceti:TauCeti.degree_weilDifferentialDivisor | A nonzero Weil differential over exact constants has divisor degree 2g−2; the function-field, membership and nonzero hypotheses are explicit. |
| mathlib:RestrictedProduct | Dependent restricted product relative to a filter, with eventual membership; the cofinite filter is the arithmetic specialization. |
| mathlib:RestrictedProduct.unitsEquiv | Units of a restricted ring product identify with the restricted product of local units relative to the integral unit submonoids. |
| mathlib:Valuation.Completion | Uniform completion of WithVal v, rather than the underlying field with an unspecified topology. |
| mathlib:Valuation.integer | The subring of elements with valuation at most one, with its natural algebra embedding. |
| mathlib:TruncatedWittVector | Length-n Witt coordinates with the Witt ring law for prime p, not coordinatewise addition. |
| mathlib:WittVector.frobenius | Witt Frobenius is a ring homomorphism; on a characteristic-p base its coefficients are the pth powers, so it descends through length-n truncation. |
| mathlib:AlgHom.convGroup | For a commutative Hopf algebra H, its algebra-valued points carry the convolution group structure WithConv (H →ₐ[K] R). |
| tauceti:TauCeti.ReductiveAffineGroupSchemeCat | Native finite-type reductive affine group schemes and their smooth/geometrically connected Hopf presentations. |
| tauceti:TauCeti.CommHopfAlgCat.schemePointsAlgΓMulEquiv | Scheme-valued affine Hopf points are multiplicatively equivalent to convolution points in relative global sections. |
| mathlib:FormalGroup | One-dimensional power-series formal group law; commutativity is the separate FormalGroup.IsComm hypothesis. Local-field evaluation is not provided by the formal-series Point type. |
| mathlib:LaurentSeries.ratfuncAdicComplRingEquiv | The X-adic completion of RatFunc k is uniformly and algebraically equivalent to LaurentSeries k; use this existing result in the rational-function completion test, not a new general completion theorem. |
| mathlib:LaurentSeries.coe_range_dense | The canonical rational-function embedding has dense range for the native X-adic Laurent-series topology. |
| mathlib:LaurentSeries.valuation_compare | LaurentSeriesRingEquiv compares the extended valuation on the X-adic completion to the native Laurent-series valuation. |

The current read-only TauCetiRoadmap checkout was also read at 81207c7f16d5abf770f13a7d2bdcdb465c030787, and current Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Current Place.Completion and repartitionToFiniteAdeles are imported additions to the pinned affine completion comparison. Completed/RestrictedProducts already supplies the generic topology. AlgebraicVectorBundles supplies the current finite locally free carriers; SF.3 supplies the degree and Serre-duality contracts. IntegralLattices concerns quadratic lattices over Z and does not replace GN.2–GN.3 Hermitian local density data. Current SR.4 owns the integral local Hecke algebra and Satake transform; IntegralHeckeAndGaloisDeterminants IHG.0 concerns polynomial laws. None of these inputs is reconstructed here.

## Layers and targets

## FA.0. Exact constants and conventions

**Coverage: planned.** The complete curve dictionary/constant-base-change interface remains the imported AC.8/AC.12 contract; only its native constant-field component is prototyped.

### Finite exact constants and the curve dictionary

**Target:** FunctionFieldArithmetic:FA.0/finite-exact-base. **Named declaration:** FunctionFieldArithmetic.finite_exact_base.

Let k be finite and K/k a one-variable function field. The finite relative algebraic closure k₀ of k in K is its unique exact constant field. With k₀ as base, the imported smooth projective curve is geometrically connected; its closed points identify with all normalized places of K/k₀. For any finite constant extension k₁/k₀, the compositum remains a field and the smooth curve base change has that function field. No rational point is assumed.

**Hypotheses.** Finite k; explicit IsFunctionField k K. Geometric connectedness is asserted only after passing to the exact constants.

**Construction or proof.**

1. Use the pinned relative-constant-field theorem, then import AC.12’s normalization and anti-equivalence.
2. Apply AC.8’s constant-extension and place-splitting formulas. Purely inseparable field maps remain in AC.8 and do not become finite étale covers.

**Direct inputs.** tauceti:TauCeti.IsFunctionField; tauceti:TauCeti.IsFunctionField.exists_intermediateField_isIntegrallyClosedIn; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts.

**Sources.** [yu](#source-yu) — §2.2, pp.7–8.

**Acceptance.**

- For K=Fq(t), constants are Fq and the curve is P¹.
- For K=Fq²(t) considered over Fq, L(0) has dimension two; claiming geometrically connected over Fq is rejected.

### Divisor degree and Yu’s adelic degree

**Target:** FunctionFieldArithmetic:FA.0/degree-conventions. **Named declaration:** FunctionFieldArithmetic.degree_conventions.

For finite exact k=Fq and K=k(X), write d_v=[κ(v):k] and ord_v(π_v)=1. Divisor degree is Σ_v d_v D_v. The absolute value is |x|_v=q^(−d_v ord_v x). For an idele a, valuation degree deg_val(a)=Σ_v d_v ord_v(a_v), while Yu’s convention is deg_Yu(a)=−deg_val(a), so |a|=q^deg_Yu(a). For scalar aI_n in GL_n(A), determinant degree is n deg_Yu(a). In an unramified extension with arithmetic Artin normalization, a uniformizer maps to arithmetic Frobenius; geometric normalization takes the inverse.

**Hypotheses.** Nonzero local entries; all sums finite on ideles; divisor degrees use the exact constants.

**Construction or proof.**

1. Import the weighted divisor degree and product formula. Apply them to the idele-divisor map in FA.2.
2. Keep the two signs as distinct homomorphisms; translate all GL_n and class-field formulas through this identity.

**Direct inputs.** tauceti:TauCeti.Divisor.degree; tauceti:TauCeti.Place.ordAddMonoidHom; tauceti:TauCeti.Divisor.degree_principal.

**Sources.** [yu](#source-yu) — §§2.2–2.3, pp.7–11.

**Acceptance.**

- A single π_v has valuation degree d_v and Yu degree −d_v.
- A principal idele has both degrees zero.
- Changing from arithmetic to geometric Frobenius inverts reciprocity rather than changing divisor degree.

## FA.1. Picard comparison and certified Riemann–Roch

**Coverage: planned.** Generalized Picard inputs for the ray comparison remain requested; the ordinary Picard nodes are imported.

Atlas planets: Riemann–Roch basis certificates.

### Divisor classes, Picard points and torsors

**Target:** FunctionFieldArithmetic:FA.1/rational-picard-comparison. **Named declaration:** FunctionFieldArithmetic.rational_picard_comparison.

For a smooth projective geometrically connected X/Fq with K=Fq(X), rational divisors modulo principal divisors identify with Pic(X), and the degree-zero subgroup identifies with Pic⁰_{X/Fq}(Fq). The comparison to rational points of the Picard scheme uses Br(Fq)=0; Pic¹ is a torsor, not a chosen point of X. A degree-one divisor selects an origin in Pic¹, while a rational point is stronger data. The finite group in the pinned class-number theorem is this degree-zero divisor class group, not the affine ideal class group attached to an omitted place.

**Hypotheses.** Finite exact constants; full smooth projective curve; scheme Picard representability and Brauer descent imported.

**Construction or proof.**

1. Import AC.12’s divisor–line-bundle comparison and SF.3/picard-scheme-without-point and picard-brauer-sequence; no rational point is required.
2. Use Br(Fq)=0 to identify line-bundle classes and Picard rational points; retain the torsor until FA.5 supplies a degree-one divisor.

**Direct inputs.** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts; tauceti:TauCeti.Divisor.degreeClass; tauceti:TauCeti.Divisor.finite_ker_degreeClass; SchemeAndStackFoundations:SF.3/picard-scheme-without-point; SchemeAndStackFoundations:SF.3/picard-brauer-sequence.

**Sources.** [adt](#source-adt) — Appendix A, proof of A.7, pp.131–132; Conrad §2, pp.2–3.

**Acceptance.**

- P¹ has Pic⁰(Fq)=0 although Pic(P¹)=Z.
- An affine-chart class group depends on the removed place; its identification with full Pic⁰ needs a separate exact sequence.
- Degree-one divisor data does not supply an X(Fq) point.

### Riemann–Roch basis certificates

**Target:** FunctionFieldArithmetic:FA.1/riemann-roch-basis-certificate. **Named declaration:** FunctionFieldArithmetic.RRBasisCertificate.

For finite exact k and a divisor D of K/k, an RR basis certificate is a finite family b:Fin r→K whose entries satisfy the native inequalities defining L(D), together with linear independence over k and equality of its k-span with the native riemannRochSpace D. The certificate verifies a computed basis, rather than replacing L(D). Its dimension is r, its coordinate map identifies L(D) with k^r, and equivalent divisors transport certificates by multiplication by the appropriate field unit.

**Hypotheses.** Explicit function-field proof; exact constants; membership uses multiplicative valuations and includes zero.

**Construction or proof.**

1. Use the pinned finite-dimensionality theorem and native Basis to construct certificates.
2. Prove the coordinate and principal-transport API by restricted linear equivalences; computation requires the presentation and verifier in the next node.

**Direct inputs.** tauceti:TauCeti.riemannRochSpace; tauceti:TauCeti.finiteDimensional_riemannRochSpace; tauceti:TauCeti.riemannRochSpace_zero_of_isIntegrallyClosedIn; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch.

**Sources.** [yu](#source-yu) — §2.2, pp.7–8 (divisor conventions); native AC.3–AC.4 Riemann–Roch inputs.

**Consumers.** FA.7 and algebraic coding theory: Certify bases and evaluation matrices using the existing L(D), not an algorithm-dependent subspace.

**API.**

- **FunctionFieldArithmetic.RRBasisCertificate.size_eq_dim** (characterisation): The certificate size is dim_k L(D).
- **FunctionFieldArithmetic.RRBasisCertificate.coordinates** (equivalence): Its coordinate map is a k-linear equivalence L(D)≃k^r.
- **FunctionFieldArithmetic.RRBasisCertificate.principal_transport** (functoriality): Multiplying all entries by f gives the certificate for D−div(f), with f a field unit.

**Unit tests.**

- **FunctionFieldArithmetic.RRBasisCertificate.negative_empty** (degenerate): If deg D<0 then the empty family certifies L(D)=0.
- **FunctionFieldArithmetic.RRBasisCertificate.zero_constants** (compatibility): For D=0 and exact constants the singleton family [1] is a certificate.
- **FunctionFieldArithmetic.RRBasisCertificate.repeated_one_rejected** (non-example): The family [1,1] is not a certificate for any D: it is linearly dependent.

**Acceptance.**

- Certificate size agrees with Module.finrank and every listed vector lies in L(D).

### Certified Riemann–Roch computation

**Target:** FunctionFieldArithmetic:FA.1/certified-riemann-roch-computation. **Named declaration:** FunctionFieldArithmetic.RRComputation.

Input consists of a finite-field encoding, a separating presentation K=k(t)[y]/(f) with monic separable irreducible f, verified integral bases on finite and infinite charts, and a divisor represented by certified places. Construct a terminating algorithm returning an RR basis certificate. Reduce D’s valuation bounds to intersection of finitely generated fractional modules on the two charts, then compute their k-intersection by polynomial module reduction. Soundness, completeness and termination refer to these exact encodings; a finite list of functions satisfying the bounds alone is not a certificate of spanning.

**Hypotheses.** All presentation and integral-basis data are verified; arbitrary singular plane coordinates do not constitute an integral basis. No complexity claim is made without the FA.7 cost model.

**Construction or proof.**

1. Import AC.2’s Dedekind chart and AC.6’s normalized place representation; factorization certificates come from FF.3.
2. Use Hess Proposition 9(iii) to identify L(D) with the intersection of the inverse finite and infinite divisor ideals. Choose verified module bases and their transition matrix over k(t).
3. Hess Lemma 1 gives the leading-coefficient noncancellation test. Each unimodular column reduction strictly decreases the sum of column degrees, bounded below by the determinant degree. Corollaries 3–4 diagonalize the two bases; Theorem 7 proves that the resulting t^j v_i with 0≤j≤d_i form the complete basis. Algorithm 13 returns those vectors and the transition-matrix certificate.

**Direct inputs.** FunctionFieldArithmetic:FA.1/riemann-roch-basis-certificate; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields; FiniteFieldsAndCharacterSums:FF.3.

**Sources.** [hess](#source-hess) — §§4–6: Lemma 1, Corollaries 3–4, Theorem 7, Proposition 9(iii), Algorithm 13, pp.4–10.

**Consumers.** FA.7 ray classes and coding-theory consumers: Compute complete bases with certified normalization at every place.

**API.**

- **FunctionFieldArithmetic.RRComputation.sound** (characterisation): An accepted output satisfies the RR basis certificate for the specified D.
- **FunctionFieldArithmetic.RRComputation.complete** (universal-property): For each verified input, the algorithm terminates with a certificate.
- **FunctionFieldArithmetic.RRComputation.chart_independent** (compatibility): Two verified chart presentations give bases of the same native L(D), related by an invertible k-matrix.

**Unit tests.**

- **FunctionFieldArithmetic.RRComputation.p1_degree_two** (computation): On k(t), D=2∞ yields a basis [1,t,t²].
- **FunctionFieldArithmetic.RRComputation.negative_degree** (degenerate): Negative-degree D yields the empty basis.
- **FunctionFieldArithmetic.RRComputation.singular_basis_rejected** (non-example): A purported integral basis failing the normalization certificate is rejected before intersection computation.

**Acceptance.**

- Output contains a spanning proof; the verifier never accepts a proper subspace.

## FA.2. Projective adeles, residue duality and Poisson summation

**Coverage: planned.** External upstream import interfaces and pinned Lean prototype omissions must be discharged before formal implementation.

Atlas planets: Function-field adeles; Idele class group; Compact degree-zero idele classes; Residue character; Self-dual adelic Haar measure; Adelic Poisson summation.

### Projective completion-valued adeles

**Target:** FunctionFieldArithmetic:FA.2/projective-adeles. **Named declaration:** FunctionFieldArithmetic.FullAdeles.

For finite exact k and K/k, A_K=∏′_{v∈Place(k,K)} K_v relative to O_v is the native cofinite restricted product of all normalized completions. Equip it with the imported restricted-product ring topology. The projective index includes the places omitted from any affine Dedekind chart. The diagonal K→A_K is a ring embedding. The K-valued repartitions map densely into A_K and restrict to the existing affine finite-adele comparison when the omitted places are removed.

**Hypotheses.** K_v is Valuation.Completion of the native place valuation, with its extended valuation; O_v is its valuation integer subring.

**Construction or proof.**

1. Import AC.5’s completed places and dense repartition comparison, and Completed/RestrictedProducts’ topology; assemble the all-place specialization.
2. Use the principal divisor’s finite support for diagonal membership; prove density on basic finite-coordinate neighborhoods, retaining every omitted place.

**Direct inputs.** tauceti:TauCeti.Place; mathlib:Valuation.Completion; mathlib:Valuation.integer; mathlib:RestrictedProduct; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components; tauceti:TauCeti.Divisor.principal.

**Sources.** [parshin](#source-parshin) — §1, pp.3–5; §2.1, pp.6–7.

**Consumers.** FA.4 and ET.3 globalization: Full adelic domain for reciprocity and arithmetic globalization. FA.6 and ES7: Arithmetic restricted products without duplicating generic topology or Haar theory.

**API.**

- **FunctionFieldArithmetic.FullAdeles.diagonal** (constructor): The diagonal map K→+*A_K evaluates at v as the canonical completion embedding.
- **FunctionFieldArithmetic.FullAdeles.integral_iff** (characterisation): An adele is integral exactly when every coordinate lies in O_v.
- **FunctionFieldArithmetic.FullAdeles.repartition_dense** (compatibility): The full repartition-to-completed-adele map has dense range and commutes with diagonal and affine projection.

**Unit tests.**

- **FunctionFieldArithmetic.FullAdeles.p1_infinity_present** (non-example): An adele supported only at ∞ of k(t) may be nonzero even though its affine projection is zero.
- **FunctionFieldArithmetic.FullAdeles.finite_support** (characterisation): Every finite-support family of local elements lies in A_K.
- **FunctionFieldArithmetic.FullAdeles.diagonal_product** (compatibility): The diagonal embedding preserves multiplication of field elements.

**Acceptance.**

- Deleting the infinite place of k(t) gives affine finite adeles, not A_K.

### Ideles and the idele class group

**Target:** FunctionFieldArithmetic:FA.2/projective-ideles. **Named declaration:** FunctionFieldArithmetic.FullIdeles.

Define I_K=∏′ K_v× relative to O_v× with the restricted-product group topology and C_K=I_K/diag(K×) with quotient topology. The native restricted-product units equivalence identifies I_K algebraically with A_K×. Its topology is the topology controlling both a and a⁻¹, not the subspace topology from A_K alone. Define the idele divisor div_I(a)=Σ_v ord_v(a_v)[v], the valuation degree via native divisor degree, and Yu degree as its negative.

**Hypotheses.** All local coordinates are units; eventual local integrality of both the element and inverse is required.

**Construction or proof.**

1. Specialize RestrictedProduct.unitsEquiv and the generic restricted-product topology to local unit submonoids.
2. Use eventual unit membership to make the divisor finite-support; descend degree using the pinned product formula.

**Direct inputs.** FunctionFieldArithmetic:FA.2/projective-adeles; mathlib:RestrictedProduct.unitsEquiv; tauceti:TauCeti.Place.ordAddMonoidHom; tauceti:TauCeti.Divisor.degree; tauceti:TauCeti.Divisor.degree_principal.

**Sources.** [parshin](#source-parshin) — §2.5, pp.14–15; Yu §§2.2–2.3, pp.7–11.

**Consumers.** FA.4 local-to-global Artin map: Multiply local reciprocity symbols on finite quotient extensions. Yu §2.2 and FYZ §2.1: Fix idele norms, central degree lattices and character restriction conventions.

**API.**

- **FunctionFieldArithmetic.FullIdeles.units_equiv** (equivalence): I_K≃*A_K× agrees coordinatewise with native RestrictedProduct.unitsEquiv.
- **FunctionFieldArithmetic.FullIdeles.divisor** (projection): div_I is a homomorphism into the additive divisor group, agreeing with principal divisors on the diagonal.
- **FunctionFieldArithmetic.IdeleClass.yuDegree** (projection): Yu degree descends to C_K and is the negative of weighted divisor degree.

**Unit tests.**

- **FunctionFieldArithmetic.FullIdeles.uniformizer_degree** (computation): An idele equal to π_v at v and 1 elsewhere has Yu degree −d_v.
- **FunctionFieldArithmetic.FullIdeles.principal_degree_zero** (compatibility): The diagonal idele of f∈K× has degree zero by the native product formula.
- **FunctionFieldArithmetic.FullIdeles.inverse_integrality** (non-example): Local nonzero entries integral almost everywhere need not define an idele: their inverses must also be integral almost everywhere.

**Acceptance.**

- The kernel of the idele divisor is ∏ O_v×.

### Ideles, divisor classes and compact degree zero

**Target:** FunctionFieldArithmetic:FA.2/idele-divisor-exact-sequence. **Named declaration:** FunctionFieldArithmetic.idele_divisor_exact_sequence.

For finite exact k and K/k, div_I:I_K→Div(K) is onto, has kernel ∏_v O_v×, and induces C_K/im(∏ O_v×)≃ClDiv(K). Its degree-zero kernel C_K⁰ is compact. A surjection C_K→Z additionally needs Schmidt’s degree-one theorem in FA.5; compactness of C_K⁰ does not use that surjectivity.

**Hypotheses.** Class group means the full projective divisor class group; compactness uses finite residue fields and finite ClDiv⁰.

**Construction or proof.**

1. Choose local uniformizers for a finite divisor to prove onto div_I; quotient the principal divisor compatibility.
2. The image of ∏ O_v× is compact and C_K⁰ maps onto the pinned finite ClDiv⁰. A finite union of compact translates is compact.

**Direct inputs.** FunctionFieldArithmetic:FA.2/projective-ideles; tauceti:TauCeti.Divisor.degreeClass; tauceti:TauCeti.Divisor.finite_ker_degreeClass; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components.

**Sources.** [parshin](#source-parshin) — §2.5, pp.14–15.

**Acceptance.**

- On k(t), C_K⁰ is the image of ∏O_v× and ClDiv⁰=0.
- No degree-one place is used in the compactness proof.

### The additive diagonal lattice

**Target:** FunctionFieldArithmetic:FA.2/additive-diagonal-lattice. **Named declaration:** FunctionFieldArithmetic.additive_diagonal_lattice.

For finite exact k and K/k, the diagonal image of K in A_K is discrete and cocompact. For each divisor D, A(D)={a:ord_v(a_v)≥−D_v for all v} is compact open. Its intersection with the diagonal is the native L(D), and the finite quotient A_K/(A(D)+K) agrees with the AC.4 repartition cokernel and has k-dimension equal to the index of specialty.

**Hypotheses.** Use valuation inequalities at zero rather than the junk-valued additive ord; the index of specialty comes from native Riemann–Roch.

**Construction or proof.**

1. Transport AC.4’s finite repartition quotient through AC.5’s dense map: an open additive quotient sees the same dense classes.
2. Choose negative-degree D to isolate zero in the diagonal. Finite quotient and compact A(D) prove cocompactness.

**Direct inputs.** FunctionFieldArithmetic:FA.2/projective-adeles; tauceti:TauCeti.riemannRochSpace; tauceti:TauCeti.Divisor.finite_setOf_isEffective_degree_le; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components.

**Sources.** [parshin](#source-parshin) — §§1–2.1, pp.3–7.

**Acceptance.**

- A(D)∩K=L(D), including zero for negative D.
- Using affine finite adeles instead would fail the asserted projective lattice statement.

### Completed residue functional

**Target:** FunctionFieldArithmetic:FA.2/completed-residue-functional. **Named declaration:** FunctionFieldArithmetic.CompletedResidue.

For finite exact k and a nonzero rational differential ω, extend each native local component of its Weil differential uniquely to the completion K_v. The resulting k-linear residue functional Res_v,ω:K_v→k is locally constant and equals Tr_{κ(v)/k}res_v(xω) on K. On A_K the sum Res_ω(a)=Σ_v Res_v,ω(a_v) is finite: integral a_v at places where ω is regular contribute zero. It annihilates the diagonal by the global residue theorem.

**Hypotheses.** The nonzero differential is represented by native weilDifferentialSpace; a continuous extension requires its finite order bound, not an arbitrary linear form.

**Construction or proof.**

1. Import AC.9’s residue comparison and AC.5’s interval-of-filtration quotient isomorphisms.
2. Factor the local functional through the relevant finite filtration quotient before completing. Sum only its finite nonzero support and import global residue vanishing.

**Direct inputs.** FunctionFieldArithmetic:FA.2/projective-adeles; tauceti:TauCeti.weilDifferentialSpace; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-9-kähler-differentials-residues-and-the-comparison; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components.

**Sources.** [parshin](#source-parshin) — §2.1, pp.6–7; Yu §5.3.1, p.37.

**Consumers.** FA.2 Poisson and FYZ §2.3: Construct the actual residue character and its exact local conductor.

**API.**

- **FunctionFieldArithmetic.CompletedResidue.on_field** (compatibility): On the canonical image of x∈K the value is the native local component of ω at x.
- **FunctionFieldArithmetic.CompletedResidue.diagonal_zero** (simp): The sum of completed residues on a diagonal field element is zero.
- **FunctionFieldArithmetic.CompletedResidue.conductor** (characterisation): If ord_v(ω)=n_v then the trace-residue additive character is trivial on π_v^(−n_v)O_v and nontrivial on π_v^(−n_v−1)O_v.

**Unit tests.**

- **FunctionFieldArithmetic.CompletedResidue.simple_pole** (computation): For k(t), v=(t), ω=dt and x=t⁻¹, the local residue is 1.
- **FunctionFieldArithmetic.CompletedResidue.regular_zero** (degenerate): For the same ω, the local residue of every x∈k[[t]] is zero.
- **FunctionFieldArithmetic.CompletedResidue.global_cancel** (compatibility): For t⁻¹dt on P¹ the residues at zero and infinity sum to zero.

**Acceptance.**

- At every regular place Res_ω(O_v)=0.

### The differential additive character

**Target:** FunctionFieldArithmetic:FA.2/differential-additive-character. **Named declaration:** FunctionFieldArithmetic.DifferentialCharacter.

Choose a nontrivial additive character ψ_p:Fp→C× and define ψ_k=ψ_p∘Tr_{k/Fp}. For nonzero rational ω define ψ_ω(a)=ψ_k(Res_ω(a)) on A_K. It is a continuous unitary additive character, trivial on K; the pairing (a,b)↦ψ_ω(ab) identifies A_K with its Pontryagin dual and the annihilator of the diagonal K is exactly K. The local conductor exponent is n_v=ord_v(ω), in the convention triviality on π_v^(−n_v)O_v and failure on the next larger fractional ideal.

**Hypotheses.** p=char k; ψ_p nontrivial, never an injective character of Fq for nonprime q.

**Construction or proof.**

1. Compose the completed residue sum with finite-field trace and ψ_p.
2. Use local finite-quotient residue duality to prove self-duality, and AC.4’s Riemann–Roch annihilator comparison plus FA.2’s lattice quotient to identify the global annihilator.

**Direct inputs.** FunctionFieldArithmetic:FA.2/completed-residue-functional; FunctionFieldArithmetic:FA.2/additive-diagonal-lattice; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch.

**Sources.** [parshin](#source-parshin) — §2.1, pp.6–7 (corrected notation, source issues E1–E2); Yu §5.3.1, p.37.

**Consumers.** FA.2 and FYZ Lemma 2.7: Pin Fourier transforms to the residue character, including conductor shifts.

**API.**

- **FunctionFieldArithmetic.DifferentialCharacter.add** (simp): ψ_ω(a+b)=ψ_ω(a)ψ_ω(b).
- **FunctionFieldArithmetic.DifferentialCharacter.annihilator_diagonal** (characterisation): An adele a pairs trivially with every x∈K if and only if a is diagonal.
- **FunctionFieldArithmetic.DifferentialCharacter.change_differential** (functoriality): For f∈K×, ψ_{fω}(a)=ψ_ω(fa).

**Unit tests.**

- **FunctionFieldArithmetic.DifferentialCharacter.zero_one** (degenerate): The character at the zero adele is 1.
- **FunctionFieldArithmetic.DifferentialCharacter.p1_residue** (computation): An adele with t⁻¹ at zero and zero elsewhere, ω=dt, has value ψ_p(Tr_{k/Fp}(1)).
- **FunctionFieldArithmetic.DifferentialCharacter.nonprime_trace_kernel** (non-example): If [k:Fp]>1 the trace character has a nonzero kernel and cannot be injective.

**Acceptance.**

- χ(0)=1, χ(a+b)=χ(a)χ(b), and χ|K=1.

### Self-dual Haar normalization

**Target:** FunctionFieldArithmetic:FA.2/differential-self-dual-haar. **Named declaration:** FunctionFieldArithmetic.SelfDualHaar.

For the character ψ_ω above, choose local self-dual additive Haar measure μ_v with μ_v(O_v)=q_v^(−ord_v(ω)/2), q_v=q^d_v. Its restricted product is μ_ω on A_K. Then μ_ω(∏O_v)=q^(1−g), μ_ω(A(D))=q^(deg D+1−g), and the quotient A_K/K has volume one. Fourier transform is f̂(b)=∫f(a)ψ_ω(ab)dμ_ω(a). Replacing ω by fω multiplies local measure by |f|_v^(1/2) and leaves the global measure unchanged by the product formula.

**Hypotheses.** Nonzero differential; finite exact constants; local normalized Haar existence and restricted Haar product imported.

**Construction or proof.**

1. Use the compact-open annihilator O_v⊥=π_v^(−n_v)O_v to solve μ_v(O_v)μ_v(O_v⊥)=1.
2. Import AA.0’s generic restricted Haar product and the native canonical degree 2g−2. Determine quotient volume via the finite RR quotient.

**Direct inputs.** FunctionFieldArithmetic:FA.2/differential-additive-character; FunctionFieldArithmetic:FA.2/additive-diagonal-lattice; tauceti:TauCeti.degree_weilDifferentialDivisor; tauceti:TauCeti.Divisor.degree_principal; AdelicAlgebraicGroups:AA.0/restricted-haar-product.

**Sources.** [parshin](#source-parshin) — §2.2, pp.8–9.

**Consumers.** FA.6 and FYZ §2.3: Convert local unipotent integral volume one to global residue self-dual normalization.

**API.**

- **FunctionFieldArithmetic.SelfDualHaar.integral_volume** (characterisation): The integral adele product has volume q^(1−g).
- **FunctionFieldArithmetic.SelfDualHaar.divisor_volume** (characterisation): A(D) has volume q^(deg D+1−g).
- **FunctionFieldArithmetic.SelfDualHaar.change_differential** (compatibility): For f∈K×, global μ_{fω}=μ_ω, although its individual local factors may differ.

**Unit tests.**

- **FunctionFieldArithmetic.SelfDualHaar.p1_integral** (computation): On k(t) with g=0, the volume of integral adeles is q.
- **FunctionFieldArithmetic.SelfDualHaar.local_order_two** (computation): At a place of order n_v=2, μ_v(O_v)=q_v⁻¹.
- **FunctionFieldArithmetic.SelfDualHaar.principal_change** (compatibility): Multiplication of ω by t changes the two local normalization factors at zero and infinity inversely and preserves the global measure.

**Acceptance.**

- For P¹, μ(∏O_v)=q, rather than 1.

### Adelic Poisson summation

**Target:** FunctionFieldArithmetic:FA.2/adelic-poisson. **Named declaration:** FunctionFieldArithmetic.adelic_poisson.

For finite exact k, a nonzero ω and every locally constant compactly supported f:A_K→C, both sums over diagonal K are finite and Σ_{x∈K}f(x)=Σ_{x∈K}f̂(x), with the preceding character and measure. For a divisor D, the Fourier transform of 1_{A(D)} is q^(deg D+1−g)1_{A((ω)−D)}. Translates of compact-open indicators are required to span the test-function space; unshifted A(D) indicators alone do not suffice.

**Hypotheses.** Bruhat–Schwartz here means locally constant and compactly supported on the totally disconnected adelic group.

**Construction or proof.**

1. Prove the compact-open indicator formula by its annihilator and volume; handle arbitrary translates using characters.
2. Reduce any test function to a finite combination of translated indicators through a finite quotient. Apply the diagonal annihilator and covolume-one statements.

**Direct inputs.** FunctionFieldArithmetic:FA.2/differential-additive-character; FunctionFieldArithmetic:FA.2/differential-self-dual-haar; FunctionFieldArithmetic:FA.2/additive-diagonal-lattice.

**Sources.** [parshin](#source-parshin) — §2.2, pp.8–9 (translated test functions, source issue E3).

**Acceptance.**

- For 1_{A(D)}, the identity is the RR dimension relation.
- Fourier inversion reads f̂̂(a)=f(−a).

## FA.3. Wild cyclic covers and ramification imports

**Coverage: planned.** External upstream import interfaces and pinned Lean prototype omissions must be discharged before formal implementation.

Atlas planets: Artin–Schreier–Witt classes; Wild Witt conductors; Wild Artin–Schreier cover.

### Ramification import and inseparable boundary

**Target:** FunctionFieldArithmetic:FA.3/ramification-import-contract. **Named declaration:** FunctionFieldArithmetic.ramification_import_contract.

For finite separable L/K use AC.6–AC.8 for normalized valuations, integral closures, decomposition/inertia groups, different, discriminant and Riemann–Hurwitz. Import the lower/upper filtrations, Herbrand quotient and tower rules and Hasse–Arf from LocalFieldsRamification. Constant extensions are unramified and their local residue extensions have the specified constant Frobenius. Kummer covers require n prime to p and μ_n in the base. Purely inseparable Frobenius extensions are handled separately and never advertised as étale or with the separable different formula.

**Hypotheses.** Finite extension with separability explicitly supplied in the ramification branch.

**Construction or proof.**

1. Apply the curve roadmap’s valuation restriction and local-to-global different comparisons.
2. Specialize the generic local filtration after completing at a chosen place; retain residue degree and constant extension data.

**Direct inputs.** FunctionFieldArithmetic:FA.0/finite-exact-base; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration.

**Sources.** [kw](#source-kw) — §3.2, pp.8–10; §4.4, pp.22–23 (wild extension input).

**Acceptance.**

- An unramified constant extension has trivial inertia.
- The pth-power map of k(t) is purely inseparable and has no cyclic Galois interpretation.

### Artin–Schreier–Witt quotient

**Target:** FunctionFieldArithmetic:FA.3/artin-schreier-witt-quotient. **Named declaration:** FunctionFieldArithmetic.ASW.

For any field F of characteristic p and n≥0, use native length-n p-typical Witt vectors with their Witt addition. Descend Witt Frobenius to W_n(F), define wp_n=Frob−id as an additive endomorphism, and form Q_n(F)=W_n(F)/wp_n W_n(F). There is a natural isomorphism Q_n(F)≃H¹(F,Z/p^nZ). For a class [a], adjoining a solution of wp_n(y)=a gives a cyclic extension of degree equal to the additive order of [a], not necessarily p^n. Two generator classes define the same subfield exactly when their generated cyclic subgroups of Q_n(F) agree.

**Hypotheses.** p prime; CharP F p; Galois cohomology uses the constant Z/p^n module in the separable closure.

**Construction or proof.**

1. Descend native Frobenius through truncation; prove the ASW exact sequence over the separable closure and use additive Hilbert 90 successively through Witt truncations.
2. Identify a cyclic extension with its character subgroup. A chosen generator differs by a unit of Z/p^n, whereas a coboundary keeps the same character.

**Direct inputs.** mathlib:TruncatedWittVector; mathlib:WittVector.frobenius; FunctionFieldArithmetic:FA.3/ramification-import-contract; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-1-formations-and-finite-normal-layers.

**Sources.** [kw](#source-kw) — §3.1, Theorem 3.2 and proof, pp.6–8.

**Consumers.** FA.3 and FA.4: Separate cyclic extensions from chosen characters and compare their completed local classes.

**API.**

- **FunctionFieldArithmetic.ASW.wp** (constructor): The additive endomorphism Frob−id has the native Witt law.
- **FunctionFieldArithmetic.ASW.order_degree** (characterisation): The attached extension degree is the additive order of the class.
- **FunctionFieldArithmetic.ASW.same_field** (characterisation): Two attached subfields agree iff their generated cyclic subgroups agree.
- **FunctionFieldArithmetic.ASW.completion** (functoriality): F→F_v induces Q_n(F)→Q_n(F_v); its kernel records splitting at v, and it need not be injective.

**Unit tests.**

- **FunctionFieldArithmetic.ASW.length_zero** (degenerate): Q_0(F) is trivial and the extension is F.
- **FunctionFieldArithmetic.ASW.coboundary_trivial** (non-example): A vector wp_n(b) gives a split equation and the trivial field extension.
- **FunctionFieldArithmetic.ASW.unit_multiple** (compatibility): Multiplication of a generator class by a unit of Z/p^n preserves its extension but can change the character.

**Acceptance.**

- The zero class gives F itself; full degree p^n requires a class of exact order p^n.

### Reduced Witt Laurent data

**Target:** FunctionFieldArithmetic:FA.3/reduced-witt-laurent-data. **Named declaration:** FunctionFieldArithmetic.ReducedWittData.

Let F=k((T)) with finite k of characteristic p, choose α∈k with nonzero trace to Fp and β=[α]∈W(k). Each class in Q_n(F) has a unique reduced expression cβ+Σ_{i>0,p∤i} c_i[T^(−i)], with c∈Z/p^nZ and c_i∈W_n(k); at fixed n only finitely many c_i are nonzero. Infinite compatible classes use c_i∈W(k) tending to zero p-adically. Reduction records the chosen parameter and β. At n≥1 its conductor exponent is 0 if all c_i vanish, otherwise 1+max_{c_i≠0} i p^(n−v_p(c_i)−1); v_p(c_i)<n for every nonzero truncated coefficient.

**Hypotheses.** Finite residue field; chosen T and trace-nonzero β. Coefficients are Witt coefficients, not coordinatewise additive polynomials.

**Construction or proof.**

1. Eliminate pole orders divisible by p using wp and truncation; reduce the constant term via the trace quotient.
2. Prove uniqueness successively modulo p^j. Apply the ramification/upper-filtration calculation of Kosters–Wan Proposition 4.14; constants give the unramified part.

**Direct inputs.** FunctionFieldArithmetic:FA.3/artin-schreier-witt-quotient; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration.

**Sources.** [kw](#source-kw) — Proposition 4.3, pp.15–16; Proposition 4.14 and proof, pp.22–23.

**Consumers.** FA.4 ray conductors and FA.7 certificates: Finite reduced data allow a checkable wild conductor rather than an unspecified ramification label.

**API.**

- **FunctionFieldArithmetic.ReducedWittData.class** (projection): Reassemble the reduced representative in Q_n(k((T))).
- **FunctionFieldArithmetic.ReducedWittData.unique** (characterisation): Equal classes have equal reduced data for the fixed T and β.
- **FunctionFieldArithmetic.ReducedWittData.conductor** (projection): Return 0 for purely constant data, otherwise the stated valuation-weighted maximum plus one.

**Unit tests.**

- **FunctionFieldArithmetic.ReducedWittData.constant_unramified** (degenerate): Any constant class has conductor zero.
- **FunctionFieldArithmetic.ReducedWittData.one_pole** (computation): At length one, c_m≠0 and p∤m give conductor m+1.
- **FunctionFieldArithmetic.ReducedWittData.length_two** (computation): At length two a sole coefficient c_m divisible by p but not p² still gives m+1; a unit coefficient gives pm+1.

**Acceptance.**

- The largest pole at a higher Witt valuation receives the smaller power of p in the conductor formula.

### The one-pole Artin–Schreier test

**Target:** FunctionFieldArithmetic:FA.3/wild-cover-example. **Named declaration:** FunctionFieldArithmetic.wild_cover_example.

Over k(t), k finite of characteristic p, the cover y^p−y=t^(−m), m>0 and p∤m, is a geometrically connected cyclic degree-p cover. It is ramified only at t=0, with conductor m+1 and different exponent (p−1)(m+1); its genus is (p−1)(m−1)/2. At infinity the equation has residue y^p−y=0 and yields p rational places. This is the length-one ASW instance and imports the AC.7 different and Hurwitz theorem.

**Hypotheses.** m positive and prime to p; RHS exactly t^(−m); k contains Fp.

**Construction or proof.**

1. The reduced pole shows the class is nonzero and cannot become constant, even after extending constants.
2. Apply the local conductor/different formula and the imported separable Hurwitz equation; inspect the unramified residue equation at infinity.

**Direct inputs.** FunctionFieldArithmetic:FA.3/reduced-witt-laurent-data; FunctionFieldArithmetic:FA.3/ramification-import-contract; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula.

**Sources.** [kw](#source-kw) — Proposition 4.14, pp.22–23; Theorem 3.2, pp.7–8.

**Acceptance.**

- For p=3,m=2 the different exponent is 6 and genus is 1.
- The condition p∤m cannot be dropped: wp can remove a p-divisible leading pole.

## FA.4. Equal-characteristic class field theory

**Coverage: planned.** Generalized Picard/Lang/Tsen supplier and GEO-RAY connectedness/reciprocity proof boundary remain open.

Atlas planets: Equal-characteristic norm fields; Local abelian existence; Schmid–Witt reciprocity; Global Artin norm quotient; Ray class groups; Global abelian existence.

### Equal-characteristic Lubin–Tate construction

**Target:** FunctionFieldArithmetic:FA.4/equal-characteristic-lubin-tate. **Named declaration:** FunctionFieldArithmetic.EqualCharLT.

For a complete discretely valued field F of characteristic p with residue F_Q, uniformizer π, and valuation ring O, choose f(X)=πX+X^Q. Construct the unique commutative native FormalGroup O with f an endomorphism and its O-action having prescribed linear coefficient. For every m≥1 its π^m-torsion splitting field F_m/F is totally ramified abelian of degree (Q−1)Q^(m−1), with Galois action (O/π^m)×. The corresponding relative construction over finite unramified extensions permits a chosen x∈F× of positive valuation to replace π in the norm specification.

**Hypotheses.** Complete discretely valued equal-characteristic local field; finite residue field; torsion points evaluated only in maximal ideals of finite extensions.

**Construction or proof.**

1. Use Yoshida Lemma 3.4’s coefficient recursion to construct the group law and O-action; uniqueness gives associativity and commutativity.
2. Appendix II, Proposition 8.1 proves torsion-polynomial separability also in characteristic p. Proposition 4.4 proves degree, uniformizer and Galois action. Use the relative unramified Frobenius twist of §§3–4 for arbitrary x.

**Direct inputs.** mathlib:FormalGroup; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality.

**Sources.** [yoshida](#source-yoshida) — §§3.1–4.2, Lemma 3.4, Proposition 3.5, Corollary 3.7, Proposition 4.4, pp.415–421; Appendix II, Proposition 8.1, pp.436–437.

**Consumers.** FA.4 full local existence: An independent published proof of the missing equal-characteristic norm-existence input.

**API.**

- **FunctionFieldArithmetic.EqualCharLT.formalGroup** (projection): The constructed law has the native FormalGroup carrier and is commutative.
- **FunctionFieldArithmetic.EqualCharLT.torsion_degree** (characterisation): For m≥1 the splitting field has degree (Q−1)Q^(m−1).
- **FunctionFieldArithmetic.EqualCharLT.torsion_galois** (equivalence): Galois action identifies the torsion splitting field group with (O/π^m)×.

**Unit tests.**

- **FunctionFieldArithmetic.EqualCharLT.first_layer** (computation): The first torsion layer has degree Q−1.
- **FunctionFieldArithmetic.EqualCharLT.binary_first_layer** (degenerate): For Q=2 the first layer is trivial; the second has degree 2.
- **FunctionFieldArithmetic.EqualCharLT.p_primary_growth** (non-example): For m≥2 the tower has p-primary ramification, so the CFT.8 prime-to-p target does not cover it.

**Acceptance.**

- At m=1 the degree is Q−1, prime to p; the higher factors supply the missing p-primary tower.

### Full equal-characteristic local existence

**Target:** FunctionFieldArithmetic:FA.4/local-abelian-existence. **Named declaration:** FunctionFieldArithmetic.local_abelian_existence.

For a complete discretely valued field F of characteristic p with finite residue field and every open finite-index subgroup H⊆F×, there is a unique finite abelian subextension E/F in a chosen separable closure with N_{E/F}(E×)=H; [E:F]=[F×:H]. This includes p-primary H. The CFT.6–CFT.7 finite Artin map becomes an isomorphism F×/H≃Gal(E/F), normalized so a uniformizer acts by arithmetic Frobenius on unramified extensions.

**Hypotheses.** The field topology and the subgroup’s finite index and openness are explicit; uniqueness concerns subfields of the fixed separable closure.

**Construction or proof.**

1. Choose m with 1+π^mO⊆H and x∈H of positive valuation. Yoshida Proposition 5.10 constructs a relative torsion field with norm ⟨x⟩(1+π^mO), then take the subfield fixed by H.
2. Use Corollary 5.16 and §§6.1–6.3 for norm compatibility and exhaustion of abelian extensions. Compare the inverse of Yoshida’s geometric normalization with CFT’s arithmetic normalization on finite unramified quotients.

**Direct inputs.** FunctionFieldArithmetic:FA.4/equal-characteristic-lubin-tate; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-4-the-abstract-artin-map; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors.

**Sources.** [yoshida](#source-yoshida) — Proposition 5.10, Theorem 5.15, Corollary 5.16(iv), pp.424–428; Theorem 6.15, pp.431–433.

**Acceptance.**

- H=ord⁻¹(rZ) gives the unramified degree-r extension.
- For H=⟨π⟩(1+π^mO) the degree is (Q−1)Q^(m−1).

### Schmid–Witt symbol and local Artin comparison

**Target:** FunctionFieldArithmetic:FA.4/schmid-witt-artin-comparison. **Named declaration:** FunctionFieldArithmetic.schmid_witt_artin_comparison.

On F=k((T)), pair Q_n(F) with F× by the action of the arithmetic local Artin map on solutions of wp_n(y)=a. It equals the truncation modulo p^n of Tr_{W(k)/Z_p} Res(ã dlog b̃), using Kosters–Wan’s characteristic-zero lifts of reduced Witt Laurent data and unit factors. This is a perfect continuous pairing between the discrete ASW character group and the pro-p completion of F×. For a finite subgroup of Q_n(F), the compositum of its ASW extensions has norm subgroup equal to the common annihilator. The symbol is compared after local existence, never used in a circular proof of it.

**Hypotheses.** Residue and dlog computed in the specified characteristic-zero lift ring; Witt trace, not ghost-coordinate division in characteristic p.

**Construction or proof.**

1. Import local Artin from the existing class formation and the full existence theorem just proved.
2. Check the explicit lifted-residue formula on a constant, a Teichmüller pole, a uniformizer and a principal unit; use bilinearity and the reduced expansion. Apply the norm-kernel theorem on each finite ASW layer and intersection under composita.

**Direct inputs.** FunctionFieldArithmetic:FA.3/artin-schreier-witt-quotient; FunctionFieldArithmetic:FA.3/reduced-witt-laurent-data; FunctionFieldArithmetic:FA.4/local-abelian-existence; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity.

**Sources.** [kw](#source-kw) — Proposition 3.10, p.12; §§4.2–4.3, Theorem 4.12 and proof, pp.17–22.

**Acceptance.**

- Constant classes pair with the valuation of b and are trivial on units.
- A reduced pole gives the conductor in FA.3; naive characteristic-p ghost division is excluded.

### The global function-field class formation

**Target:** FunctionFieldArithmetic:FA.4/function-field-class-formation. **Named declaration:** FunctionFieldArithmetic.function_field_class_formation.

For finite exact k and K=k(X), specialize the imported Tate class-formation machinery to the projective idele class modules of finite separable extensions. Local Brauer invariants and the global exact sequence Br(K)→⊕_v Br(K_v)→Q/Z give the invariant and fundamental classes. The Jacobian obstruction H¹(k,Jac_X) is zero by Lang over finite constants, including after every finite constant extension. Thus the global function-field idele formation has the Tate H¹-vanishing and normalized H² invariants required by CFT.1–CFT.4.

**Hypotheses.** All completions are nonarchimedean; finite exact constants; no number-field archimedean terms. Tsen and Picard cohomology are imported through SF.3.

**Construction or proof.**

1. Follow Milne ADT A.7: apply Tsen over algebraically closed constants and the divisor–Picard exact sequences, obtaining the global Brauer invariant sequence.
2. Use A.8–A.9 and Lang to kill the finite-field Jacobian obstruction, then feed this arithmetic formation into the generic Tate theorem of CFT.2–CFT.4. Existence is a separate arithmetic target and is not a class-formation axiom.

**Direct inputs.** FunctionFieldArithmetic:FA.2/projective-ideles; FunctionFieldArithmetic:FA.1/rational-picard-comparison; SchemeAndStackFoundations:SF.3; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-1-formations-and-finite-normal-layers; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-2-class-formations-and-fundamental-classes; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-4-the-abstract-artin-map.

**Sources.** [adt](#source-adt) — Appendix A, A.7–A.9 with proofs, pp.131–134.

**Acceptance.**

- The sum of local invariants of a global Brauer class is zero.
- The formation theorem does not claim existence of class fields.

### Global arithmetic Artin and the finite norm quotient

**Target:** FunctionFieldArithmetic:FA.4/global-artin-norm-isomorphism. **Named declaration:** FunctionFieldArithmetic.global_artin_norm_isomorphism.

For finite abelian L/K, the product of local arithmetic Artin maps defines a continuous surjective homomorphism I_K→Gal(L/K), is trivial on K×, and induces C_K/N_{L/K}C_L≃Gal(L/K). Local unramified units contribute trivially, so products in each finite quotient are finite. In a constant extension F_{q^r}K/K the image is arithmetic Frobenius to the power deg_val(a), equivalently to the power −deg_Yu(a). Norms, inclusions of fields and restriction of Galois actions satisfy the imported reciprocity diagram.

**Hypotheses.** Finite abelian and separable extension in a fixed separable closure; no infinite product in an unspecified topology.

**Construction or proof.**

1. Use ADT A.10’s principal reciprocity law via the invariant sum and A.11’s formation Artin isomorphism.
2. Compare the local and formation maps on unramified uniformizers, then apply CFT.3–CFT.4 norm functoriality and norm limitation.

**Direct inputs.** FunctionFieldArithmetic:FA.4/function-field-class-formation; FunctionFieldArithmetic:FA.4/local-abelian-existence; FunctionFieldArithmetic:FA.0/degree-conventions; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-4-the-abstract-artin-map.

**Sources.** [adt](#source-adt) — Appendix A, A.10–A.11, pp.134–136; A.5, pp.129–130.

**Acceptance.**

- A principal idele maps to the identity.
- A uniformizer at degree d acts on constant extensions as Frobenius^d.

### Ray subgroups and generalized Picard torsors

**Target:** FunctionFieldArithmetic:FA.4/ray-class-and-generalized-picard. **Named declaration:** FunctionFieldArithmetic.RayClass.

For an effective modulus m=Σ_v m_v[v], define U_m⊆I_K by O_v× for m_v=0 and 1+𝔭_v^{m_v} for m_v>0. Put C_m=C_K/im U_m and C_m⁰=ker deg_val; C_m⁰ is finite and identifies with the k-points of the generalized Jacobian J_m, while degree gives 0→C_m⁰→C_m→Z→0. Pic_m¹ is a torsor; selecting Schmidt’s degree-one divisor gives an origin in the ray Picard torsor, not a rational point of X. C_m itself is infinite. A finite ray quotient additionally fixes a finite-index subgroup in the degree direction.

**Hypotheses.** Finite exact constants; projective ray data including local trivialization at the modulus; residue at m=0 uses the ordinary Jacobian.

**Construction or proof.**

1. Use the divisor map away from m and weak approximation to compare ideles with line bundles trivialized along m.
2. Import generalized Picard representability/descent from SF.3. Use the finite constant-field points and Schmidt to split the degree sequence after a choice.

**Direct inputs.** FunctionFieldArithmetic:FA.2/projective-ideles; FunctionFieldArithmetic:FA.1/rational-picard-comparison; FunctionFieldArithmetic:FA.5/schmidt-degree-one; SchemeAndStackFoundations:SF.3; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components.

**Sources.** [conrad](#source-conrad) — §2, Examples 2.1–2.2 and §3, pp.2–4.

**Consumers.** FA.4 global existence and FA.7 characters: Define the exact ray topology and distinguish finite class-field quotients from the infinite full ray group.

**API.**

- **FunctionFieldArithmetic.RayClass.degree_exact** (characterisation): The ray degree sequence has kernel J_m(k) and cokernel zero.
- **FunctionFieldArithmetic.RayClass.modulus_map** (functoriality): For m≤m′ there is a surjection C_m′→C_m compatible with degree.
- **FunctionFieldArithmetic.RayClass.finite_quotient** (constructor): After imposing a finite-index degree subgroup, the resulting ray quotient is finite.

**Unit tests.**

- **FunctionFieldArithmetic.RayClass.p1_zero** (computation): For P¹ and m=0 the full ray class group is Z.
- **FunctionFieldArithmetic.RayClass.degree_not_finite** (non-example): Even m=0 never makes C_m finite; constants yield its Z direction.
- **FunctionFieldArithmetic.RayClass.constants_degree_r** (compatibility): The quotient by degree r has cyclic degree component Z/r.

**Acceptance.**

- At m=0 the degree-zero quotient is Pic⁰(k).

### Global existence via Lang ray covers

**Target:** FunctionFieldArithmetic:FA.4/global-abelian-existence. **Named declaration:** FunctionFieldArithmetic.global_abelian_existence.

For every open finite-index H⊆C_K there is a unique finite abelian subextension L/K in the fixed separable closure with N_{L/K}C_L=H and [L:K]=[C_K:H]. Given a modulus m whose U_m-image lies in H, choose a degree-one divisor and use the Lang isogeny Frob_q−id of J_m. Pulling its torsor to X minus supp(m) along the ray Abel map gives the geometric ray cover. Constant extensions provide finite degree quotients. A suitable compositum has norm subgroup contained in H; its fixed subfield associated to H has exactly that norm subgroup by the already proved finite Artin isomorphism.

**Hypotheses.** H open and finite index in the quotient topology; finite exact constants; geometric ray-cover construction and its connectedness imported as an explicit supplier request.

**Construction or proof.**

1. Use openness to find U_m and finite index to bound the remaining degree quotient. Lang’s surjectivity supplies the finite étale J_m(k)-torsor.
2. Use Conrad Theorems 3.1–3.2 for the generalized-Jacobian pullback and conductor compatibility. The required proof of the geometric ray-cover connectedness/reciprocity comparison is requested from SF.3, not claimed to be proved in this four-page handout.
3. Apply CFT norm limitation and the norm quotient theorem to descend through the finite abelian compositum.

**Direct inputs.** FunctionFieldArithmetic:FA.4/ray-class-and-generalized-picard; FunctionFieldArithmetic:FA.4/global-artin-norm-isomorphism; SchemeAndStackFoundations:SF.3; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-4-the-abstract-artin-map.

**Sources.** [conrad](#source-conrad) — §3, Theorems 3.1–3.2, pp.3–4; ADT Appendix A explicitly omits existence.

**Acceptance.**

- The constant degree-r extension has norm subgroup deg_val⁻¹(rZ).
- Uniqueness refers to the subfield, not merely an isomorphism class.

### Profinite global reciprocity and constants

**Target:** FunctionFieldArithmetic:FA.4/profinite-reciprocity. **Named declaration:** FunctionFieldArithmetic.profinite_reciprocity.

The compatible finite Artin maps give a continuous dense-image map C_K→Gal(K^ab/K), and global existence induces an isomorphism of profinite completions Ĉ_K≃Gal(K^ab/K). Restriction to the constant algebraic closure is the completion of deg_val:C_K→Z, followed by n↦Frob_q^n. With a selected degree-one class, C_K≃C_K⁰×Z topologically and Ĉ_K≃C_K⁰×Ẑ. The uncompleted degree direction Z is not replaced by Ẑ without completion.

**Hypotheses.** Schmidt supplies the degree-one class; C_K⁰ compact and totally disconnected; finite abelian fields run through all open finite-index norm subgroups.

**Construction or proof.**

1. Take inverse limits over the finite norm quotients; global existence makes them cofinal among all finite continuous quotients.
2. Split degree after a choice and use compactness of C_K⁰. Verify the arithmetic Frobenius diagram on local uniformizers.

**Direct inputs.** FunctionFieldArithmetic:FA.4/global-abelian-existence; FunctionFieldArithmetic:FA.4/global-artin-norm-isomorphism; FunctionFieldArithmetic:FA.2/idele-divisor-exact-sequence; FunctionFieldArithmetic:FA.5/schmidt-degree-one.

**Sources.** [adt](#source-adt) — Appendix A, A.10–A.11, pp.134–136 (finite quotients); Conrad Theorem 3.2, p.4 (existence input).

**Acceptance.**

- On k(t), completion changes the constant degree Z to Ẑ.
- With Yu degree the constant Frobenius exponent is its negative.

## FA.5. Zeta functions, Schmidt and Frobenius

**Coverage: planned.** Independent WC.5 all-extension bound and coefficient-accurate étale trace/Brauer–Nesbitt suppliers remain requested.

Atlas planets: Schmidt degree-one theorem; Curve zeta series; Zeta rationality and functional equation; Artin inertia factors; Chebotarev with constant degrees.

### Schmidt’s degree-one divisor theorem

**Target:** FunctionFieldArithmetic:FA.5/schmidt-degree-one. **Named declaration:** FunctionFieldArithmetic.schmidt_degree_one.

For a smooth projective geometrically connected curve X/Fq, gcd{deg v : v a closed point}=1. Hence an integer divisor of degree one exists, and the valuation degree C_K→Z is surjective. No degree-one closed point or rational point is asserted. This follows independently of class field theory and zeta rationality from the WC.5 curve Weil estimate over every F_{q^r}.

**Hypotheses.** Independent curve Weil bound |#X(Fq^r)−(q^r+1)|≤2g q^(r/2) for every r≥1.

**Construction or proof.**

1. If h>1 divided all closed-point degrees, then X(Fq^r) would be empty whenever h∤r. Choose arbitrarily large such r; the Weil lower bound is eventually positive, a contradiction.
2. The gcd of a set of positive integers is the gcd of a finite subset. Bézout produces an integer divisor of degree one; the idele-divisor surjection supplies a degree-one idele.

**Direct inputs.** WeilConjectures:WC.5; FunctionFieldArithmetic:FA.0/finite-exact-base; FunctionFieldArithmetic:FA.2/idele-divisor-exact-sequence.

**Sources.** [roquette](#source-roquette) — §4.3.3, pp.25–28 (Schmidt context); WC.5 supplies the independent all-extension Weil estimate.

**Acceptance.**

- A curve without Fq-points still admits an integer divisor of degree one.
- No FA.4 theorem is a prerequisite of this node.

### Closed-point zeta series

**Target:** FunctionFieldArithmetic:FA.5/curve-zeta-series. **Named declaration:** FunctionFieldArithmetic.CurveZeta.

For finite exact k=Fq, define Z_X(T) in Z[[T]] by its effective-divisor coefficients a_n=#{D≥0:deg D=n}. Each coefficient is finite by the pinned theorem. Its formal Euler product is ∏_v(1−T^{d_v})⁻¹, with coefficientwise finite truncation. Over Q, log Z_X(T)=Σ_{r≥1} #X(Fq^r)T^r/r, because #X(Fq^r)=Σ_{d|r}d·#{v:deg v=d}. Rational points alone do not supply the Euler product.

**Hypotheses.** Full projective closed points; exact constants and weighted degree; formal T-adic products, not analytic infinite products.

**Construction or proof.**

1. Count effective divisors by their unique finite prime expansion, using finiteness in bounded degree.
2. Differentiate the formal Euler factors and regroup divisors of r to obtain the extension-field count identity.

**Direct inputs.** tauceti:TauCeti.Divisor.finite_setOf_isEffective_degree_le; FunctionFieldArithmetic:FA.0/finite-exact-base; FunctionFieldArithmetic:FA.0/degree-conventions.

**Sources.** [roquette](#source-roquette) — §4.3.3, pp.25–28; Parshin §2.5, pp.14–15.

**Consumers.** FA.5 and FA.7: Define the independently checkable L-polynomial from complete extension-field counts.

**API.**

- **FunctionFieldArithmetic.CurveZeta.euler** (characterisation): Coefficientwise finite Euler product over all closed points.
- **FunctionFieldArithmetic.CurveZeta.log_counts** (characterisation): The formal logarithm has coefficient #X(Fq^r)/r at r>0.
- **FunctionFieldArithmetic.CurveZeta.constant_extension** (functoriality): For X over Fq^s the count sequence is N_sr; the Euler product reindexes split closed points with their new residue degrees.

**Unit tests.**

- **FunctionFieldArithmetic.CurveZeta.p1** (computation): Z_P¹(T)=((1−T)(1−qT))⁻¹.
- **FunctionFieldArithmetic.CurveZeta.degree_two** (non-example): A degree-two closed point contributes first at T² and contributes two points over Fq².
- **FunctionFieldArithmetic.CurveZeta.zero_coefficient** (degenerate): The empty divisor is the unique degree-zero effective divisor.

**Acceptance.**

- The constant coefficient is 1.

### Riemann–Roch rationality and functional equation

**Target:** FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality. **Named declaration:** FunctionFieldArithmetic.riemann_roch_zeta_rationality.

There is a unique P_X(T)∈Z[T] with P_X(0)=1, degree 2g, leading coefficient q^g, and Z_X(T)=P_X(T)/((1−T)(1−qT)). It satisfies P_X(T)=q^g T^{2g}P_X(1/(qT)) and P_X(1)=#Pic⁰_X(Fq). Riemann–Roch plus Schmidt’s degree-one divisor and the finite degree-zero class group prove rationality and the functional equation. The modulus √q for inverse roots is imported independently from WC.5; it is not obtained from rationality alone.

**Hypotheses.** Smooth projective geometrically connected curve; all degrees over Fq; g=0 gives polynomial 1.

**Construction or proof.**

1. For n>2g−2 every degree-n divisor class has (q^{n+1−g}−1)/(q−1) effective representatives, and the degree-one divisor identifies its class set with Pic⁰(k). Sum the resulting two geometric tails.
2. Pair D and a canonical divisor minus D under RR to prove the reciprocal coefficient relation; use the WC.5 theorem only for inverse-root sizes.

**Direct inputs.** FunctionFieldArithmetic:FA.5/curve-zeta-series; FunctionFieldArithmetic:FA.5/schmidt-degree-one; FunctionFieldArithmetic:FA.1/rational-picard-comparison; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch; tauceti:TauCeti.Divisor.finite_ker_degreeClass; WeilConjectures:WC.5.

**Sources.** [roquette](#source-roquette) — §4.3.3, pp.25–28 (RR rationality); Parshin §2.5, pp.14–15 (functional equation normalization).

**Acceptance.**

- For g=0 the numerator is 1.
- a_{2g−j}=q^{g−j}a_j for 0≤j≤g if a_j are the coefficients of P_X.

### Artin inertia factors with finite coefficients

**Target:** FunctionFieldArithmetic:FA.5/artin-inertia-factor. **Named declaration:** FunctionFieldArithmetic.ArtinFactor.

For a continuous finite-image representation ρ of Gal(K^sep/K) on a finite-dimensional vector space V over a field A of characteristic ℓ≠p, choose inertia I_v and geometric Frobenius Fr_v on V^{I_v}. The local factor polynomial is det(1−T^{d_v}ρ(Fr_v)|V^{I_v}); the local L-factor is its inverse. Frobenius is well-defined on inertia invariants and the determinant is independent of the lift and basis. Use the invariant subspace even if ℓ divides the inertia image order: averaging by #I_v is then invalid. A symplectic specialization additionally assumes ℓ≠2.

**Hypotheses.** Finite coefficient field for the AV torsion application; finite-dimensional V and continuous finite-image action; explicit geometric Frobenius, opposite to arithmetic Artin.

**Construction or proof.**

1. Import decomposition/inertia and finite-dimensional linear algebra. Restrict the chosen Frobenius lift to inertia invariants and substitute T^{d_v} in its characteristic determinant.
2. Lift independence follows because two lifts differ by inertia; basis independence follows by conjugacy.

**Direct inputs.** FunctionFieldArithmetic:FA.3/ramification-import-contract; FunctionFieldArithmetic:FA.0/degree-conventions.

**Sources.** [av](#source-av) — §3.2, equation (3.1), pp.26–27.

**Consumers.** Abdurrahman–Venkatesh §3.2: Provide the exact torsion-coefficient Euler factors used in the symplectic L-function.

**API.**

- **FunctionFieldArithmetic.ArtinFactor.lift_independent** (compatibility): Changing the Frobenius lift leaves the factor polynomial unchanged.
- **FunctionFieldArithmetic.ArtinFactor.direct_sum** (functoriality): Factors multiply under direct sum.
- **FunctionFieldArithmetic.ArtinFactor.unramified** (characterisation): When inertia acts trivially the determinant is on all of V.

**Unit tests.**

- **FunctionFieldArithmetic.ArtinFactor.trivial_rank_one** (computation): The trivial representation gives 1−T^{d_v}.
- **FunctionFieldArithmetic.ArtinFactor.no_invariants** (degenerate): If V^{I_v}=0 the factor is 1.
- **FunctionFieldArithmetic.ArtinFactor.modular_inertia** (non-example): In characteristic ℓ dividing #I_v, invariants are computed as a kernel intersection, never a normalized average.

**Acceptance.**

- Totally ramified nontrivial rank-one tame characters have invariant space zero and local factor 1.

### Finite-coefficient Euler and cohomology comparison

**Target:** FunctionFieldArithmetic:FA.5/torsion-trace-comparison. **Named declaration:** FunctionFieldArithmetic.torsion_trace_comparison.

For an everywhere unramified finite-dimensional A-local system ρ on proper X, A a finite field of characteristic ℓ≠p, its degree-weighted Euler product equals ∏_{i=0}² det(1−T Fr_q|H^i_et(X̄,ρ))^{(−1)^{i+1}}. This is the torsion coefficient contract used by AV, not an assertion that ρ lifts to an ℓ-adic representation. For a representation ramified on X minus U, the analogous proper formula uses j_*ρ and its inertia stalks; compact-support cohomology of U instead gives the Euler product with omitted boundary factors.

**Hypotheses.** Proper smooth X; geometric Frobenius; finite étale cohomology and trace formula supplied with these coefficients.

**Construction or proof.**

1. Import the torsion Grothendieck trace formula and determinant expansion from the étale/cohomology supplier.
2. Check that the j_* stalk is V^{I_v}; separate the open compact-support and proper direct-image formulas before adding ramified local factors.

**Direct inputs.** FunctionFieldArithmetic:FA.5/artin-inertia-factor; DeligneWeightsAndPurity:DWP.1; EtaleDualityAndPerverseSheaves:EDC.8.

**Sources.** [av](#source-av) — §3.2, equations (3.1)–(3.2), pp.26–27.

**Acceptance.**

- A constant rank-one sheaf on P¹ gives ((1−T)(1−qT))⁻¹.
- No lift from A to characteristic zero occurs in the statement.

### Degree-sensitive finite Chebotarev

**Target:** FunctionFieldArithmetic:FA.5/degree-sensitive-chebotarev. **Named declaration:** FunctionFieldArithmetic.degree_sensitive_chebotarev.

Let M/K be finite Galois, G its group, k_M=F_{q^h} its exact constants and N=Gal(M/k_M K), so |G|=h|N|. For a conjugacy class C⊆G let π_C(r) count unramified closed places of K of degree r with arithmetic Frobenius in C. If C does not restrict to Frob_q^r on k_M, then π_C(r)=0. If it does, an explicit valid coarse bound is |rπ_C(r)−(|C|/|N|)(q^r+1)|≤(2g_M+r(1+2g_X))q^{r/2}+r+R, where g_M is the geometric genus over the exact constants and R is the total degree of the ramified places of X. In particular the compatible-degree main term has denominator |N|, and the incompatible classes have exactly zero count.

**Hypotheses.** r≥1; finite separable Galois cover; independent Weil estimate for all twist curves and X over all finite extensions; genus, constant degree and ramified support specified.

**Construction or proof.**

1. Use Kosters Lemmas 1.3–1.4 to twist by compatible Frobenius elements after extending constants to Fq^r. Sum the Weil estimates for the resulting geometrically connected components/class intersections: the rational-point contribution has main coefficient |C|/|N| and error at most 2g_M q^{r/2}.
2. Remove ramified rational points, costing at most R. A rational point coming from a proper divisor d of r has d≤r/2; the total contribution is bounded by r((1+2g_X)q^{r/2}+1). Divide by r to count degree-r closed places. The bound is deliberately coarse and uniform; no omitted unspecified O-constant.

**Direct inputs.** FunctionFieldArithmetic:FA.3/ramification-import-contract; FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality; WeilConjectures:WC.5.

**Sources.** [kcheb](#source-kcheb) — Theorem 1.1, Corollary 1.2 and Lemmas 1.3–1.4 with proofs, pp.1–5; the displayed r-bound is the stated base-change deduction.

**Acceptance.**

- For a constant cyclic degree-h extension, the only degree-r Frobenius is Frob_q^r.
- For h=1 the compatible main coefficient is |C|/|G|.

### Frobenius determination of semisimple representations

**Target:** FunctionFieldArithmetic:FA.5/frobenius-semisimple-determination. **Named declaration:** FunctionFieldArithmetic.frobenius_semisimple_determination.

For two continuous finite-dimensional semisimple ℓ-adic representations of the curve’s étale fundamental group, ℓ≠p and characteristic-zero coefficients, equality of characteristic polynomials of geometric Frobenius at all closed points outside a finite set implies the representations are isomorphic after choosing a common coefficient field. Chebotarev density gives equality on the profinite group and Brauer–Nesbitt gives the conclusion. This does not assert semisimplicity or an isomorphism of nonsemisimple extensions.

**Hypotheses.** Continuity and characteristic zero; finite-dimensional semisimple representations; all closed-point degrees, not one congruence class alone.

**Construction or proof.**

1. Apply the finite-quotient Chebotarev theorem to every open conjugacy-invariant neighborhood, retaining constant-degree restrictions.
2. Pass equality of continuous character/characteristic-polynomial functions through the dense Frobenius set, then apply Brauer–Nesbitt.

**Direct inputs.** FunctionFieldArithmetic:FA.5/degree-sensitive-chebotarev; DeligneWeightsAndPurity:DWP.1.

**Sources.** [dad](#source-dad) — Proof of Theorem 5.3.3, p.27 (Chebotarev and Brauer–Nesbitt step only).

**Acceptance.**

- A nontrivial extension and its semisimplification can have the same Frobenius polynomials, so semisimplicity cannot be deleted.

## FA.6. Automorphic functions and unitary Siegel coefficients

**Coverage: planned.** RG-RED nonsplit reduction, split GN.3 densities, exact local Siegel–Weil and function-field analytic continuation interfaces remain requested.

Atlas planets: Function-field automorphic functions; Cuspidal constant terms; Harder cuspidal finiteness; Yu degree-zero nonvanishing; Unitary Siegel–Eisenstein series; Hermitian residue Fourier coefficients.

### Arithmetic automorphic function spaces

**Target:** FunctionFieldArithmetic:FA.6/automorphic-function-space. **Named declaration:** FunctionFieldArithmetic.AutomorphicFunctions.

Let G be a connected reductive K-group, U⊆G(A_K) compact open, Xi a discrete central subgroup whose image accounts for every noncompact split-center degree direction, and R a commutative coefficient ring with p invertible. The level-U automorphic module consists of R-valued functions on G(K)∖G(A_K)/(U Xi), or equivalently left-G(K), right-U and Xi-invariant functions. A central-character version uses equivariance f(zg)=χ(z)f(g), with χ trivial on rational central points and compatible with U and Xi. The quotient and coefficient ring are actual data; a character restriction is not silently used to make the whole reductive quotient finite.

**Hypotheses.** Reductivity and rational/adelic points use the native Hopf/scheme group objects. Xi is chosen with full degree-center rank; descent of χ must be verified.

**Construction or proof.**

1. Import RG2 rational-point topology, local integral models and double-coset structure, AA restricted products and FA.2 arithmetic adeles.
2. Define the module as a submodule of functions with the stated invariance/equivariance equations. Compare Hopf convolution points and the native affine group-scheme points, then impose the center quotient.

**Direct inputs.** FunctionFieldArithmetic:FA.2/projective-adeles; FunctionFieldArithmetic:FA.4/profinite-reciprocity; tauceti:TauCeti.ReductiveAffineGroupSchemeCat; mathlib:AlgHom.convGroup; tauceti:TauCeti.CommHopfAlgCat.schemePointsAlgΓMulEquiv; ReductiveGroupsPartII:RG2.4.

**Sources.** [yu](#source-yu) — §§2.2–2.3, pp.7–11; Harder §1.1, pp.252–253.

**Consumers.** FA.6, GS.0/GS.6 and ES7: Arithmetic coefficient module at a specified level, center quotient and character.

**API.**

- **FunctionFieldArithmetic.AutomorphicFunctions.eval** (projection): Evaluation gives an R-linear map at a double-coset representative.
- **FunctionFieldArithmetic.AutomorphicFunctions.level_change** (functoriality): If U′⊆U, pullback embeds the level-U space into level U′.
- **FunctionFieldArithmetic.AutomorphicFunctions.gl1** (compatibility): For G=G_m it is the function module on C_K/(U Xi), with the exact central-character relation.

**Unit tests.**

- **FunctionFieldArithmetic.AutomorphicFunctions.gl1_degree** (non-example): Without a degree-center quotient, the unramified GL₁ double-coset set contains a Z direction and is infinite.
- **FunctionFieldArithmetic.AutomorphicFunctions.p1_degree_mod_r** (computation): For k(t), maximal integral U and Xi of degree r>0 yield exactly r double cosets for GL₁.
- **FunctionFieldArithmetic.AutomorphicFunctions.incompatible_character** (degenerate): For field coefficients, if χ is nontrivial on a central rational point, the only equivariant function is zero. For ring coefficients require χ(z)−1 to act injectively; nontriviality alone is insufficient.

**Acceptance.**

- For GL₁ the quotient is an idele class quotient, not a number-field archimedean quotient.

### Cuspidal constant terms

**Target:** FunctionFieldArithmetic:FA.6/cuspidal-constant-terms. **Named declaration:** FunctionFieldArithmetic.CuspFunctions.

For each proper K-parabolic P=MN, N(K)∖N(A_K) is compact. Normalize its measure to total mass one. For R with p invertible, a smooth level-invariant function has constant term CT_P f(g)=∫_{N(K)∖N(A)} f(ng)dn, computed as a finite average on a finite p-group quotient. The cusp module is the intersection of all kernels CT_P. For complex coefficients this equals the ordinary normalized integral. For a torus the family of proper parabolics is empty, so every automorphic function is cuspidal; finite support still needs the center quotient.

**Hypotheses.** All proper K-parabolics, not only one split Borel; p invertible in R ensures the finite-average denominators exist. The flat base-change API additionally assumes R Noetherian and common finite support; a finite equation system suffices without Noetherianity.

**Construction or proof.**

1. Use K-split unipotent filtrations of reductive parabolic radicals and FA.2 additive compact quotients, or the required general unipotent quotient supplier for nonsplit groups.
2. Refine the level until the constant-term integrand factors through a finite p-group quotient; prove independence under refinement. Define the cusp submodule by all resulting linear maps.

**Direct inputs.** FunctionFieldArithmetic:FA.6/automorphic-function-space; FunctionFieldArithmetic:FA.2/additive-diagonal-lattice; ReductiveGroupsPartII:RG2.4.

**Sources.** [bhkt](#source-bhkt) — §8.1, equation (8.1), Proposition 8.2 and proof, pp.34–35; Ciubotaru–Harris §3, pp.8–9.

**Consumers.** BHKT Proposition 8.2 and Ciubotaru–Harris Lemma 3.2: Construct coefficient modules and justify flat extension, with p inverted.

**API.**

- **FunctionFieldArithmetic.CuspFunctions.constantTerm** (projection): The normalized finite-average constant term is R-linear and compatible with the complex integral.
- **FunctionFieldArithmetic.CuspFunctions.mem_iff** (characterisation): Membership is equivalent to vanishing of every proper-parabolic constant term.
- **FunctionFieldArithmetic.CuspFunctions.flat_base_change** (functoriality): For Noetherian R, a flat R-algebra S and the common finite support theorem, cuspidality commutes with scalar extension: the coefficient rows of the cusp equations span a finitely generated submodule of the dual finite free ambient module.

**Unit tests.**

- **FunctionFieldArithmetic.CuspFunctions.torus** (degenerate): For G_m all automorphic functions are cusp functions.
- **FunctionFieldArithmetic.CuspFunctions.constant_gl2** (non-example): The nonzero constant function on GL₂ has a nonzero Borel constant term and is not cuspidal.
- **FunctionFieldArithmetic.CuspFunctions.average_refinement** (compatibility): Refining a finite unipotent quotient replicates each value equally and preserves the mass-one constant term.

**Acceptance.**

- Cuspidality kills every proper constant term and commutes with the integral Hecke action.

### Harder support and central-degree finiteness

**Target:** FunctionFieldArithmetic:FA.6/harder-cuspidal-support. **Named declaration:** FunctionFieldArithmetic.harder_cuspidal_support.

At fixed compact level for a split semisimple Chevalley group over K, all cuspidal functions have support in a common compact subset of G(K)∖G(A_K), independent of their coefficients. Its level double-coset set is finite, so the cusp space is finite-dimensional over C. For split reductive G, compactness holds after bounding every rational-character degree, or after quotienting a full central degree lattice compatible with the character. Extension to arbitrary connected reductive G requires the nonsplit reduction theorem identified in request RG-RED; a GL₁ counterexample prevents asserting finiteness without the central restriction.

**Hypotheses.** Fixed level; Harder’s read theorem is split Chevalley. Generic reductive extension is an explicitly requested input, not inferred from semisimple notation.

**Construction or proof.**

1. Apply Harder Theorem 1.2.1’s root-degree support bound and Corollary 1.2.3’s compactness with bounded character degrees.
2. A compact set modulo a compact-open right subgroup has finitely many double cosets. For reductive groups quotient the missing central degree direction; import the nonsplit reduction extension only with the specified hypotheses.

**Direct inputs.** FunctionFieldArithmetic:FA.6/cuspidal-constant-terms; ReductiveGroupsPartII:RG2.4; FunctionFieldArithmetic:FA.2/idele-divisor-exact-sequence.

**Sources.** [harder](#source-harder) — §1.2, Theorem 1.2.1 and Corollary 1.2.3, pp.254–256.

**Acceptance.**

- GL₂ without a degree-center lattice has infinitely many scalar translates; the degree-normalized space is finite-dimensional.
- The support bound applies uniformly to all cusp functions at the fixed level.

### Integral coefficient models and algebraic Hecke eigenvalues

**Target:** FunctionFieldArithmetic:FA.6/integral-coefficient-model. **Named declaration:** FunctionFieldArithmetic.integral_coefficient_model.

For split semisimple G and R a Noetherian Z[1/p]-algebra embedded in C, the fixed-level cusp module is finite over R and C_cusp(R)⊗_R C≃C_cusp(C). Common Harder support gives a finite free ambient function module; cusp equations cut out a finite submodule, and flatness of the extension gives the comparison. An integral Hecke operator has characteristic polynomial integral over the chosen coefficient ring. Algebraicity over Q follows when the model is defined over Z[1/p] or a number field; it is not asserted for an arbitrary transcendental central character or arbitrary generic spectral parameter.

**Hypotheses.** The coefficient comparison uses a flat extension, or the specific R⊆C result of the cited lemma; arbitrary nonflat extension is not asserted.

**Construction or proof.**

1. Use the finite support theorem and finitely many finite-average cusp equations to obtain the Noetherian submodule.
2. Use Ciubotaru–Harris Lemma 3.2’s complex scalar comparison; for eigenvalue algebraicity apply the integral Hecke action on the finite Z[1/p] model and Cayley–Hamilton after passing to a finite-dimensional Q-space.

**Direct inputs.** FunctionFieldArithmetic:FA.6/harder-cuspidal-support; FunctionFieldArithmetic:FA.6/cuspidal-constant-terms; SmoothRepresentationsOfLocalGroups:SR.4.

**Sources.** [ch](#source-ch) — §3, Proposition 3.1 and Lemma 3.2, pp.8–9; BHKT Proposition 8.2, pp.34–35.

**Acceptance.**

- A fixed-level cuspidal Hecke eigenvalue in the Z[1/p] model is algebraic over Q.
- A character with a transcendental value cannot be forced into a number-field model by this argument.

### Global integral Hecke and normalized Satake comparison

**Target:** FunctionFieldArithmetic:FA.6/function-field-hecke-satake. **Named declaration:** FunctionFieldArithmetic.function_field_hecke_satake.

At an unramified place v and hyperspecial U_v, specialize the imported integral spherical Hecke algebra with vol(U_v)=1. Its global action on fixed-level function-field cusp modules is the finite double-coset sum. After choosing q_v^(1/2) and extending coefficients, use SR.4’s normalized Satake isomorphism; its parameter is matched to the stated geometric Frobenius for L-factors, while FA.4’s Artin map uses arithmetic Frobenius. Integral convolution and the q_v-half-power normalized transform are distinguished.

**Hypotheses.** Unramified reductive local group; specified hyperspecial level; coefficient extension containing a chosen square root when using normalized Satake.

**Construction or proof.**

1. Import local convolution and Satake, then prove the arithmetic global action preserves all constant-term kernels.
2. Compare the GL₁ action with the reciprocity quotient and invert Frobenius exactly once in translating to the Artin Euler factor.

**Direct inputs.** FunctionFieldArithmetic:FA.6/cuspidal-constant-terms; FunctionFieldArithmetic:FA.4/global-artin-norm-isomorphism; FunctionFieldArithmetic:FA.5/artin-inertia-factor; SmoothRepresentationsOfLocalGroups:SR.4; SmoothRepresentationsOfLocalGroups:SR.4; ReductiveGroupsPartII:RG2.4.

**Sources.** [bhkt](#source-bhkt) — §8.1, pp.34–35; Yu §§2.2–2.3, pp.7–11.

**Acceptance.**

- For GL₁, a uniformizer Hecke translation agrees with the chosen class-field character convention.
- No generic Satake construction is replanned.

### Yu’s spherical degree-zero nonvanishing

**Target:** FunctionFieldArithmetic:FA.6/yu-degree-zero-nonvanishing. **Named declaration:** FunctionFieldArithmetic.yu_degree_zero_nonvanishing.

Let π be an irreducible cuspidal automorphic representation of GL_n(A_K), n≥1, spherical at every place, and let φ be a nonzero spherical vector. Then some g with deg_Yu(det g)=0 satisfies φ(g)≠0. With ω nonzero and n_v=ord_v(ω), the local conductor-shifted diagonal t_v has exponents −(n−1)n_v,…,−n_v,0 and its spherical Whittaker value is nonzero. Their determinant has Yu degree +n(n−1)(g_X−1). A scalar idele of Yu degree one, raised to −(n−1)(g_X−1), cancels this degree. These signs correct the read preprint’s proof as already confirmed in PAPER-YU-23/E11. Nonzero Whittaker reconstruction supplies a nonzero evaluation after unipotent translation, whose determinant degree is zero.

**Hypotheses.** φ nonzero, cuspidal and globally spherical; use all local uniqueness and global Fourier reconstruction with the chosen residue character. A degree-one idele, not a degree-one place, is enough.

**Construction or proof.**

1. Import AL.3’s GL_n Fourier reconstruction, Whittaker factorization and conductor-shift formula, with the function-field arithmetic prerequisites rerouted to FA.2 and FA.6.
2. Use Σ_v d_v n_v=2g_X−2 for the determinant-degree calculation. Schmidt supplies the scalar idele. The scalar acts through π’s central character and preserves nonvanishing; a nonzero Fourier integral yields a nonzero unipotent translate.

**Direct inputs.** FunctionFieldArithmetic:FA.6/cuspidal-constant-terms; FunctionFieldArithmetic:FA.5/schmidt-degree-one; FunctionFieldArithmetic:FA.2/differential-additive-character; tauceti:TauCeti.degree_weilDifferentialDivisor; AutomorphicLFunctionsAndLocalFactors:AL.3/gln-fourier-expansion; AutomorphicLFunctionsAndLocalFactors:AL.3/global-whittaker-factorization; AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-conductor-shift.

**Sources.** [yu](#source-yu) — §5.3.1, Lemma 5.3.3 and complete proof, pp.36–38.

**Acceptance.**

- For n=1 the determinant shift is zero.
- The zero vector is excluded; the entire representation is not claimed to be one-dimensional.

### Unramified unitary inducing characters

**Target:** FunctionFieldArithmetic:FA.6/unitary-unramified-inducing-character. **Named declaration:** FunctionFieldArithmetic.unitary_unramified_inducing_character.

For an étale quadratic cover X′/X over finite k of odd characteristic, including a split or constant cover, let η be its quadratic idele class character. For each n≥0 there exists an everywhere-unramified character χ:C_{F′}→C× restricting to η^n on C_F. In the split case use the product of the two component idele class groups. Extend η^n from the image of Pic(X)→Pic(X′); it kills the kernel. In the geometrically nontrivial case that kernel is generated by the defining 2-torsion line bundle and vanishing is the alternating cup-product self-pairing after lifting to torsion-free Z₂ cohomology.

**Hypotheses.** p≠2; finite étale double cover; χ is a selected choice, not a canonical character.

**Construction or proof.**

1. Use FA.4 reciprocity to define η and the Picard comparison for unramified characters.
2. Apply FYZ Remark 2.1’s kernel calculation. Import the torsion-free curve cohomology and cup-product argument, then extend using divisibility of C×.

**Direct inputs.** FunctionFieldArithmetic:FA.4/profinite-reciprocity; FunctionFieldArithmetic:FA.1/rational-picard-comparison; EtaleDualityAndPerverseSheaves:EDC.2.

**Sources.** [fyz](#source-fyz) — §2.1, Remark 2.1, pp.8–9.

**Acceptance.**

- For even n the trivial character is an allowed restriction choice.
- A chosen χ may vary by a character trivial on the image of C_F.

### Unitary Siegel–Eisenstein series

**Target:** FunctionFieldArithmetic:FA.6/unitary-siegel-eisenstein-series. **Named declaration:** FunctionFieldArithmetic.SiegelEisenstein.

Let F=k(X), p≠2, F′/F the quadratic étale algebra of an unramified double cover, H_n the unitary group of the standard split skew-Hermitian F′-space of dimension 2n, and P_n=M_nN_n its Siegel parabolic. For χ as above define the unnormalized smooth induction Ind_{P_n(A)}^{H_n(A)}(χ(det)·|det|_{F′}^{s+n/2}). Its spherical section Φ_s is K=H_n(Ô)-fixed and satisfies Φ_s(1)=1. The Eisenstein series E(g,s)=Σ_{P_n(F)∖H_n(F)}Φ_s(γg) converges for Re(s) sufficiently large and has meromorphic continuation. The analytic continuation theorem is imported as the explicit general Eisenstein supplier; convergence alone does not define values at a pole.

**Hypotheses.** Selected unramified χ; fixed complex s and normalization. For split F′ use product norms; for constant covers retain the F-relative norm convention.

**Construction or proof.**

1. Use RG2’s unitary group and Siegel parabolic and SR’s smooth induction; the spherical Iwasawa decomposition gives the unique normalized section.
2. Apply the general Eisenstein convergence/continuation supplier to these data; use arithmetic function-field reduction rather than archimedean decay.

**Direct inputs.** FunctionFieldArithmetic:FA.6/automorphic-function-space; FunctionFieldArithmetic:FA.6/unitary-unramified-inducing-character; ReductiveGroupsPartII:RG2.4; SmoothRepresentationsOfLocalGroups:SR.4; AutomorphicSpectralTheory:AS.1/eisenstein-convergence; AutomorphicSpectralTheory:AS.2/eisenstein-continuation.

**Sources.** [fyz](#source-fyz) — §2.1, pp.8–9.

**Consumers.** FYZ Theorem 2.8: Provide the exact analytic Siegel–Eisenstein series whose regular Fourier coefficients enter the higher Siegel–Weil formula.

**API.**

- **FunctionFieldArithmetic.SiegelEisenstein.section_one** (simp): The spherical section has value 1 at the identity.
- **FunctionFieldArithmetic.SiegelEisenstein.parabolic_transform** (characterisation): For m(α)n(b), the section transforms by χ(det α)|det α|_{F′}^{s+n/2}.
- **FunctionFieldArithmetic.SiegelEisenstein.left_rational_invariant** (compatibility): In its convergence region and after continuation E(γg,s)=E(g,s) for γ∈H_n(F).

**Unit tests.**

- **FunctionFieldArithmetic.SiegelEisenstein.normalized_scalar** (characterisation): Scaling the spherical section by c≠1 violates its value-one normalization.
- **FunctionFieldArithmetic.SiegelEisenstein.unipotent** (computation): For n(b) in N_n(A), Φ_s(n(b))=1.
- **FunctionFieldArithmetic.SiegelEisenstein.center_exponent** (non-example): Substituting s in place of s+n/2 defines a different inducing character in this unnormalized convention.

**Acceptance.**

- Φ_s(1)=1 pins the scalar; using normalized induction changes the displayed exponent.

### Differential-valued Hermitian Fourier coefficients

**Target:** FunctionFieldArithmetic:FA.6/unitary-residue-fourier-coefficient. **Named declaration:** FunctionFieldArithmetic.HermitianFourier.

Identify the additive dual of N_n(A)=Herm_n(A) with Herm_n(A,ω_F), the Hermitian matrices valued in the rational canonical line. The character is Ψ_T(b)=ψ_k(Res(−Tr(Tb))). The T-coefficient is E_T(g,s)=∫_{N_n(F)∖N_n(A)} E(n(b)g,s)Ψ_T(b)dn with quotient volume one. For nonsingular T and a factorizable standard section, E_T(g,s)=q^(−n²degω_X/2)∏_v W_{T,v}(g_v,s); each local N_n(O_v) has volume one. Local W uses Φ_v(w_n⁻¹ n(b)g_v,s) and the same signed residue character. The global prefactor is essential and the formula is not asserted for singular T.

**Hypotheses.** T is canonical-line-valued; nonsingularity when factoring; p≠2; q is the cardinality of exact constants of X.

**Construction or proof.**

1. Apply FA.2 residue duality componentwise to the n²-dimensional additive Hermitian space. The trace pairing is unimodular at unramified places, including the split case, with p≠2.
2. Unfold the nonsingular coefficient in the convergence region. Compare the quotient-volume-one measure with local integral-volume-one measures using FA.2; the ratio is q^(−n²(g_X−1)). Continue meromorphically.

**Direct inputs.** FunctionFieldArithmetic:FA.6/unitary-siegel-eisenstein-series; FunctionFieldArithmetic:FA.2/differential-additive-character; FunctionFieldArithmetic:FA.2/differential-self-dual-haar; FunctionFieldArithmetic:FA.2/adelic-poisson; ReductiveGroupsPartII:RG2.4.

**Sources.** [fyz](#source-fyz) — §2.2, equations (2.1)–(2.4), pp.9–10.

**Consumers.** FYZ Lemma 2.7 and Theorem 2.8: Match Fourier coefficients to local density polynomials with the canonical-line and Haar conventions.

**API.**

- **FunctionFieldArithmetic.HermitianFourier.dual** (equivalence): Residue pairing identifies the dual of N_n(F)∖N_n(A) with Herm_n(F,ω_F).
- **FunctionFieldArithmetic.HermitianFourier.levi_covariance** (functoriality): E_T(m(α)g,s)=χ(det ᾱ)⁻¹|det α|_{F′}^{−s+n/2}E_{ᾱᵗTα}(g,s).
- **FunctionFieldArithmetic.HermitianFourier.nonsingular_product** (characterisation): For nonsingular T the coefficient has the stated local Whittaker product and global measure prefactor.

**Unit tests.**

- **FunctionFieldArithmetic.HermitianFourier.genus_one_factor** (computation): When g_X=1 the measure prefactor is 1.
- **FunctionFieldArithmetic.HermitianFourier.p1_factor** (computation): When g_X=0 the prefactor is q^{n²}.
- **FunctionFieldArithmetic.HermitianFourier.singular_boundary** (non-example): For det T=0, the nonsingular unfolding formula is unavailable and additional orbits may contribute.

**Acceptance.**

- The global factor is q^(−n²(g_X−1)), so on P¹ it is q^{n²}.

### Whittaker comparison with imported Hermitian densities

**Target:** FunctionFieldArithmetic:FA.6/unitary-whittaker-density-comparison. **Named declaration:** FunctionFieldArithmetic.unitary_whittaker_density_comparison.

At an unramified quadratic local algebra F′_v/F_v, inert or split, import the integral Hermitian lattice L and normalized Siegel polynomial Den_v(X,L) from GN.2–GN.3. For the integral nonsingular Gram form T of L and FYZ’s section and additive character, W_{T,v}(1,s)=L_{n,v}(s)⁻¹ Den_v(q_v^(−2s),L), where L_{n,v}(s)=∏_{i=1}^n(1−η_v(π_v)^i q_v^(−i−2s))⁻¹. Its interpolation at nonnegative integers j uses the density ratio for source rank n+2j, hence X=q_v^(−2j), not the rank-n+j value with an unchanged argument. Integral-lattice generic nondegeneracy is distinct from self-duality.

**Hypotheses.** p≠2 in the global application; F′_v unramified quadratic étale. The inert polynomial is already owned; the split extension is explicitly requested from GN.3.

**Construction or proof.**

1. Import GN.3’s density, interpolation, Cho–Yamauchi weight and overlattice polynomial, including inert and requested split cases.
2. Follow FYZ Lemma 2.7: at s=j≥0 identify the section with the Weil representation on the self-dual rank n+2j lattice, apply the local Siegel–Weil integral and count integral representations. Polynomial/rational continuation gives all s. The local Siegel–Weil identity is a separate supplier request.

**Direct inputs.** FunctionFieldArithmetic:FA.6/unitary-residue-fourier-coefficient; GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-local-density; GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial; GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-weight; GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-overlattice-formula; MetaplecticAutomorphicForms:MP.6/unitary-siegel-weil-measure.

**Sources.** [fyz](#source-fyz) — §§2.3–2.5, Theorem 2.3 and Lemma 2.7 with proof, pp.10–14; Li–Zhang Theorem 3.5.1, pp.17–18 (inert supplier).

**Acceptance.**

- For a self-dual L the normalized Den polynomial is 1.
- Split lengths use 2ℓ′=total O_F-length, so the exponent 2ℓ′ is integral.

### FYZ regular global coefficient formula

**Target:** FunctionFieldArithmetic:FA.6/fyz-regular-global-coefficient. **Named declaration:** FunctionFieldArithmetic.fyz_regular_global_coefficient.

Let E be a rank-n vector bundle on X′ and a:E→σ*E∨ an injective Hermitian map, with E∨=Hom(E,ω_X′), the Serre dual. Define Den(X,(E,a))=∏_{v∈|X|}Den_v(X^{d_v},(E_v,a_v)); all but finitely many factors are 1. The regular Fourier coefficient of the normalized spherical Eisenstein series is χ(det E) q^{−deg E(s−n/2)−n²degω_X/2} L_n(s)⁻¹ Den(q^(−2s),(E,a)), where L_n=∏_v L_{n,v}. The formula is independent of the rational trivialization of E and of the canonical-line trivialization. It uses the Serre dual degree n degω_X′−deg E, not the ordinary dual degree −deg E.

**Hypotheses.** Étale double cover of an odd-characteristic finite-field curve; χ and section normalized as above; a generically nonsingular/injective; vector-bundle and Hermitian lattice comparisons imported.

**Construction or proof.**

1. Choose a rational trivialization and form the nonsingular canonical-line-valued T; use Levi covariance to extract the χ and degree factor.
2. Apply the local Whittaker/density comparison and global residue-measure factor. Use integrality for vanishing of nonintegral forms and self-duality almost everywhere. Show changes of trivialization cancel by the product formula and character triviality on rational points. No shtuka intersection theorem is replanned here.

**Direct inputs.** FunctionFieldArithmetic:FA.6/unitary-whittaker-density-comparison; FunctionFieldArithmetic:FA.6/unitary-residue-fourier-coefficient; FunctionFieldArithmetic:FA.0/degree-conventions; SchemeAndStackFoundations:SF.3/vector-bundle-degree; SchemeAndStackFoundations:SF.3/curve-serre-duality.

**Sources.** [fyz](#source-fyz) — §2.6, equation (2.10), Theorem 2.8 and proof, pp.14–15.

**Acceptance.**

- At genus one the global canonical-degree measure factor is 1.
- For self-dual integral local lattices the local numerator polynomial is 1.
- The global substitution uses X^{d_v}; using X at every place gives the wrong L-polynomial.

## FA.7. Arithmetic certificates and explicit examples

**Coverage: planned.** General curve point-count certificates and the exact executable presentation interfaces remain supplier/Lean boundaries.

Atlas planets: Certified normalized places; Certified L-polynomials; Certified ray characters; Normalized local completions.

### Certified places and divisor arithmetic

**Target:** FunctionFieldArithmetic:FA.7/certified-place-enumeration. **Named declaration:** FunctionFieldArithmetic.PlaceEnumeration.

For a verified separating presentation K/k(t) and its normalized finite/infinite integral bases, a place certificate is a maximal ideal in one chart, its verified finite residue-field encoding, normalized valuation and ramification/residue degrees. Enumerate places of degree at most B by consuming FF.3 factorization certificates in finite constant extensions, proving completeness via the finite map to P¹, and adding every place above infinity. Divisor arithmetic uses the resulting native place-indexed finitely supported integer functions; a singular affine point can have several normalized places and is never accepted without normalization data.

**Hypotheses.** Finite exact constants; verified normalized chart data as in RRComputation; bounds measured in residue degree over k.

**Construction or proof.**

1. Import FF.3’s certified factorization and AC.6’s splitting in normalized integral closures.
2. Every degree≤B place lies above a P¹ place of degree≤B; factor the residue algebra, separate normalized branches and verify e,f. Include infinity and deduplicate places by their valuation.

**Direct inputs.** FunctionFieldArithmetic:FA.1/certified-riemann-roch-computation; tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields; FiniteFieldsAndCharacterSums:FF.3/factorization-certificate; tauceti:TauCeti.Place; tauceti:TauCeti.Divisor.degree.

**Sources.** [hess](#source-hess) — §3.2, pp.3–4; Proposition 9(i)–(ii), p.7; §6, p.9.

**Consumers.** FA.7 and certified RR/ray computations: Supply normalized place and residue-degree data without duplicating finite-field factorization.

**API.**

- **FunctionFieldArithmetic.PlaceEnumeration.sound** (characterisation): Every enumerated entry is the certified native place of its specified degree.
- **FunctionFieldArithmetic.PlaceEnumeration.complete** (universal-property): Every native place of degree≤B occurs, including normalized branches above singular points and infinity.
- **FunctionFieldArithmetic.PlaceEnumeration.divisor_arithmetic** (compatibility): Encoded addition and principal-divisor output agree with the native finitely supported divisor arithmetic.

**Unit tests.**

- **FunctionFieldArithmetic.PlaceEnumeration.p1_degree_one** (computation): On Fq(t) there are q+1 degree-one places, including infinity.
- **FunctionFieldArithmetic.PlaceEnumeration.infinity_required** (non-example): The finite polynomial chart alone gives only q of these places.
- **FunctionFieldArithmetic.PlaceEnumeration.singular_branches** (non-example): The two branches of a normalized split node are distinct places even when their affine coordinate point agrees.

**Acceptance.**

- The degree-B list has both a soundness and a completeness certificate.

### L-polynomial certificates

**Target:** FunctionFieldArithmetic:FA.7/l-polynomial-certificate. **Named declaration:** FunctionFieldArithmetic.LPolynomialCertificate.

For a genus-g curve over Fq, an L-polynomial certificate contains certified counts N_r=#X(Fq^r) for 1≤r≤g, consumed from FF.3, and P∈Z[T]. Set a_0=1, s_r=q^r+1−N_r and recursively r a_r=−Σ_{i=1}^r s_i a_{r−i} for 1≤r≤g, checking exact divisibility. Fill a_{2g−r}=q^{g−r}a_r by FA.5’s functional equation. The verified polynomial equals P_X. For g=0 no count is needed and P=1. A list of unchecked counts or a mere Weil-shaped polynomial is not a certificate.

**Hypotheses.** Curve and genus independently certified; each count certificate covers all projective points over its stated field. FF.3 currently supplies only an elliptic special case: request the general curve/hyperelliptic extension explicitly.

**Construction or proof.**

1. Use Newton’s recurrence from CurveZeta.log_counts and rationality to determine the first g coefficients.
2. Use the functional equation to determine the remaining g coefficients; exact integer checks are part of verification, not evidence for the input counts.

**Direct inputs.** FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality; FunctionFieldArithmetic:FA.5/curve-zeta-series; FiniteFieldsAndCharacterSums:FF.3.

**Sources.** [roquette](#source-roquette) — §4.3.3, pp.25–28 (zeta identities); own certified Newton/functional-equation deduction.

**Consumers.** FA.7 and curve arithmetic consumers: Verify the L-polynomial from independently certified finite-field point counts.

**API.**

- **FunctionFieldArithmetic.LPolynomialCertificate.sound** (characterisation): Accepted verified count data give exactly the numerator P_X.
- **FunctionFieldArithmetic.LPolynomialCertificate.unique** (extensionality): The first g complete extension-field counts and the functional equation determine P uniquely.
- **FunctionFieldArithmetic.LPolynomialCertificate.constant_extension** (functoriality): For base extension Fq^s, raise the inverse roots to the sth power, or compute N_sr and verify the resulting polynomial.

**Unit tests.**

- **FunctionFieldArithmetic.LPolynomialCertificate.genus_zero** (degenerate): For P¹ the empty count list certifies P=1.
- **FunctionFieldArithmetic.LPolynomialCertificate.elliptic_five** (computation): For y²=x³+x+1 over F5 the count N_1=9 gives P=1+3T+5T².
- **FunctionFieldArithmetic.LPolynomialCertificate.bad_elliptic_count** (non-example): Changing N_1 from 9 to 8 changes the linear coefficient and cannot certify the same curve’s polynomial.

**Acceptance.**

- The certificate verifier rejects a corrupted N_r even if all proposed inverse roots have the right sizes.

### Ray-character and conductor certificates

**Target:** FunctionFieldArithmetic:FA.7/ray-character-conductor-certificate. **Named declaration:** FunctionFieldArithmetic.RayCharacterCertificate.

A finite ray-character certificate specifies a modulus m, a chosen finite degree quotient of C_m, its verified finite abelian-group presentation, a character into specified roots of unity, and local restrictions. Its conductor is the least effective m′≤m for which each local character is trivial on 1+𝔭_v^{m′_v}; an unramified character has m′_v=0. Wild cyclic p-parts are verified using ReducedWittData and the Artin symbol; prime-to-p parts use imported tame reciprocity. The value on the selected degree-one class separately records the constant-field character.

**Hypotheses.** Finite-index degree quotient is specified; a full infinite ray class group is not encoded as a finite group. Character-order and root-of-unity encodings are checked.

**Construction or proof.**

1. Compute the finite ray quotient from certified divisors, RR relations and local units using FA.4’s exact comparison; include degree explicitly.
2. Check the proposed character kills every relation, then test least local unit depth. Compare wild depths with the reduced Witt conductor and the finite norm quotient.

**Direct inputs.** FunctionFieldArithmetic:FA.4/ray-class-and-generalized-picard; FunctionFieldArithmetic:FA.4/schmid-witt-artin-comparison; FunctionFieldArithmetic:FA.7/certified-place-enumeration; FunctionFieldArithmetic:FA.1/certified-riemann-roch-computation.

**Sources.** [kw](#source-kw) — Theorem 4.12 and Proposition 4.14, pp.21–23; Conrad §3, p.4.

**Consumers.** FA.7 and Drinfeld/class-field consumers: Machine-checkable conductors and finite ray characters retaining the constant direction.

**API.**

- **FunctionFieldArithmetic.RayCharacterCertificate.sound** (characterisation): Verified finite-group relations define the specified continuous idele class character.
- **FunctionFieldArithmetic.RayCharacterCertificate.conductor_minimal** (characterisation): The recorded modulus is minimal for local-unit triviality.
- **FunctionFieldArithmetic.RayCharacterCertificate.degree_value** (projection): The value at the selected degree-one class determines its separate constant-field restriction.

**Unit tests.**

- **FunctionFieldArithmetic.RayCharacterCertificate.trivial** (degenerate): The trivial character has zero conductor and degree value 1.
- **FunctionFieldArithmetic.RayCharacterCertificate.constant_extension** (compatibility): A nontrivial constant-field character has zero local conductor but a nontrivial degree value.
- **FunctionFieldArithmetic.RayCharacterCertificate.wild_one_pole** (computation): The Artin character of y^p−y=t⁻m, p∤m, has conductor (m+1)[0].

**Acceptance.**

- A character factoring through a larger modulus need not have that modulus as its conductor.

### Normalized completion certificates

**Target:** FunctionFieldArithmetic:FA.7/normalized-completion-certificate. **Named declaration:** FunctionFieldArithmetic.CompletionCertificate.

A completion certificate selects an actual native place v, its finite residue field κ(v), a uniformizer π_v and a coefficient-field section κ(v)→O_v. It gives a topological κ(v)-algebra isomorphism K_v≃κ(v)((T)) sending π_v to T and preserving normalized valuations and the filtration quotients. The residue differential conductor and self-dual volume are carried as verified comparison data. Changing π_v transports these data through the induced local automorphism; K itself remains a global field and is not identified with its completion.

**Hypotheses.** Equal characteristic with finite perfect residue field; coefficient section and uniformizer are chosen, not canonical. AC.5 already owns completion, density and residue-field comparisons.

**Construction or proof.**

1. Use Teichmüller/coefficient-field representatives and convergent π-adic expansion to identify the complete DVR and its fraction field with series.
2. Import AC.5’s native completion and finite filtration quotients; prove valuation and character compatibility with FA.2. The certified finite truncation interface verifies precision rather than an entire infinite series by enumeration.

**Direct inputs.** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components; FunctionFieldArithmetic:FA.2/completed-residue-functional; FunctionFieldArithmetic:FA.2/differential-self-dual-haar; FunctionFieldArithmetic:FA.7/certified-place-enumeration; mathlib:LaurentSeries.ratfuncAdicComplRingEquiv; mathlib:LaurentSeries.coe_range_dense; mathlib:LaurentSeries.valuation_compare.

**Sources.** [parshin](#source-parshin) — §2.1, p.7; Yoshida §2.2 and Appendix I, pp.413–415, 433–436.

**Consumers.** Fargues–Scholze local-field interfaces and FA.7: Pass a chosen completed global place to equal-characteristic local theory without conflating global and local fields.

**API.**

- **FunctionFieldArithmetic.CompletionCertificate.uniformizer** (simp): The selected π_v maps to T.
- **FunctionFieldArithmetic.CompletionCertificate.valuation** (compatibility): The isomorphism preserves normalized discrete valuations.
- **FunctionFieldArithmetic.CompletionCertificate.change_parameter** (functoriality): A second verified uniformizer gives the corresponding continuous series-substitution isomorphism, with transported conductor data.

**Unit tests.**

- **FunctionFieldArithmetic.CompletionCertificate.p1_zero** (computation): At t=0 on Fq(t), choose π=t and obtain Fq((T)).
- **FunctionFieldArithmetic.CompletionCertificate.p1_infinity** (computation): At infinity choose π=t⁻¹; t has valuation −1.
- **FunctionFieldArithmetic.CompletionCertificate.global_not_local** (non-example): The global field Fq(t) is a proper dense subfield of its t-adic completion, not an isomorphic topological field under the completion embedding.

**Acceptance.**

- Every element is normalized relative to the selected place, not relative to a global Laurent expansion at an unspecified chart.

### Cost model and four end-to-end examples

**Target:** FunctionFieldArithmetic:FA.7/explicit-cost-and-examples. **Named declaration:** FunctionFieldArithmetic.explicit_cost_and_examples.

Fix a finite-field encoding by a monic irreducible polynomial over Fp, count both field operations and integer bit operations, and bound presentation degrees, coefficient bit lengths, divisor height h(D)=Σ|D_v|d_v and requested precision. RR reduction is polynomial in the verified matrix size/degrees and h(D), with normalization and factorization costs stated separately; a brute-force point count costs at least its enumerated q^r field elements, so no polynomial-in-log(q) claim is made. The examples are Fq(t); y²=x³+x+1 over F5 (smooth genus one, N_1=9, P=1+3T+5T²); its F25 constant extension (N_2=27, P=1+T+25T²); and y³−y=t⁻² over F3 (genus one, conductor 3[0], different 6[0], N_1=4, P=1+3T²). Each example records full projective places, RR data, degree convention, local completion and independently certified point counts.

**Hypotheses.** Odd-characteristic hyperelliptic model is squarefree and normalized; wild-cover projective points include all points above infinity. Counts are independently reproducible by finite enumeration.

**Construction or proof.**

1. Verify the hyperelliptic finite-field equation and its projective point at infinity. Count the wild cover via the residue equation at t=0 and the split equation at infinity; use FA.3 Hurwitz.
2. Apply the certified Newton construction and functional equation; for F25 raise inverse roots to their squares. Report the chosen cost model and separate unavailable normalization performance bounds from the sound certificate interface.

**Direct inputs.** FunctionFieldArithmetic:FA.7/certified-place-enumeration; FunctionFieldArithmetic:FA.7/l-polynomial-certificate; FunctionFieldArithmetic:FA.7/ray-character-conductor-certificate; FunctionFieldArithmetic:FA.7/normalized-completion-certificate; FunctionFieldArithmetic:FA.3/wild-cover-example.

**Sources.** [hess](#source-hess) — §3.2, pp.3–4; §6, Algorithm 13 and Remark 14, pp.9–10; Kosters–Wan Proposition 4.14, pp.22–23.

**Acceptance.**

- Over F5, the five affine fibers have 2,0,2,2,2 points, plus infinity, giving 9.
- Over F3 the wild cover has one ramified point above t=0, no points above t=1 or t=2, and three above infinity, giving N_1=4.

## Precision of the suggested signatures

The named definitions, API items and tests all have counterparts in the suggested file. Genuine basis, polynomial and completion certificates carry their stated verifiable conditions. Native objects are used for divisor classes, restricted products, Witt vectors, formal groups, matrices, measures and function submodules. At a missing supplier interface, the file states the available carrier or formula and identifies the omitted condition beside it. Consequently, some formula signatures are stronger than valid unconditional theorems and are meaningful only under the full conditions in this document. The following boundaries must be discharged before implementation:

- FA.0–FA.1: the curve dictionary, rational Picard interpretation, Brauer descent and algorithm input encodings are mathematical supplier conditions. The native RR certificate's membership, independence and spanning conditions are already expressible. The computation signature specifies its output certificate without encoding a terminating implementation.
- FA.2: the arithmetic and topological interpretations of the diagonal lattice, differential orders, conductors, self-dual measures and Pontryagin comparison require the imported interfaces. The completed residue's restriction uses the actual native Weil-differential local component. Its displayed diagonal vanishing uses finite support. Generic residue characters must be specialized to the stated nontrivial prime-field character and trace. Compactly supported locally constant functions are actual carriers.
- FA.3: the ASW quotient uses native Witt addition and Frobenius. Its field/cohomology comparison, reduced-representative algorithm, p-adic coefficient depth and trace-nonzero choice require their suppliers. The conductor formula retains those conditions. The wild count is expressed in the polynomial model x=1/t, interchanging the zero and infinity fibers of the original t-model.
- FA.4: the formal law, subextensions, unit quotients and norm-subgroup carriers are actual objects. Formal-point evaluation, arithmetic norm formation, subgroup openness, geometric ray-Picard identification and inverse-limit compatibility require supplier interfaces. The selected degree-one divisor is indispensable. Finite-index conditions alone do not replace openness.
- FA.5: the effective-divisor zeta coefficients and matrix determinant factors are actual expressions. The truncated Euler product's executable construction is not supplied. A matrix input is identified with geometric Frobenius on the inertia-invariant subspace only under the representation adapter. The unramified determinant identity is its formula-level specialization, and lift independence assumes equality of the induced invariant matrices. The trace formula and coarse Chebotarev expression omit the geometric identifications of the supplied matrices, counts and genera; their full hypotheses above are required. Frobenius determination requires continuity, characteristic-zero semisimplicity and the genuine dense Frobenius set.
- FA.6: automorphic functions are an actual submodule cut out by invariance equations, and the cusp module is an intersection of kernels of linear constant-term maps. The arithmetic group identification, parabolic indexing, central lattice and normalized finite averages require their suppliers. The suggested flat comparison uses a finite indexing family; the full contract permits the Noetherian finite-support argument. Its incompatible-character criterion uses a unit difference, sufficient over a field; a general coefficient ring needs injective action of that difference. Harder support and the Hecke action require the specified arithmetic spaces. The Eisenstein sum indexes the rational group modulo its rational parabolic, inside the adelic group. Its section, convergence and continuation conditions, and the geometric interpretation of the Hermitian coefficient and density formulas, remain explicit supplier boundaries.
- FA.7: the finite enumeration and ray-character signatures omit executable finite encodings. The divisor-arithmetic prototype displays finite-list addition; normalized principal-divisor production is the full adapter contract above. A ray character must have the specified finite image and verified finite quotient. The completion certificate expresses a valuation-normalized ring equivalence; its coefficient-field algebra and topology comparisons require the local interface. L-polynomial soundness assumes certified curve counts and a certified genus; the constant-extension formula requires the actual curve count sequence.

The file elaborated at the pinned build with admitted-proof warnings only. This is a signature check, and every implementation status remains unchecked.

## Supplier requests and closure boundaries

There are 29 open dependency receipts. The first 13 specify precise additions or normalization comparisons needed from their owners; the remaining 16 record existing upstream import interfaces. Those 16 receipts do not allege missing mathematics or authorize replanning it. They identify exactly what closure must import.

### FunctionFieldArithmetic/request-generalized-picard

**Supplier:** SchemeAndStackFoundations:SF.3. **Status:** open.

Generalized Picard schemes J_m and Pic_m¹ for an arbitrary effective modulus on a smooth proper finite-field curve, their divisor/idele comparison and Rosenlicht Albanese property; Tsen’s Br(k̄(X))=0 and Lang H¹(Fq,Jac)=0 with arbitrary finite constant extension.

The accepted SF.3 packet supplies ordinary Picard torsors and the Picard–Brauer sequence, but does not supply the full modulus/Lang/Tsen inputs read in ADT A.7–A.9 and Conrad §§2–3. FA.4 retains the arithmetic ray cover, finite norm and existence theorem.

**Required by:** FunctionFieldArithmetic:FA.4/ray-class-and-generalized-picard; FunctionFieldArithmetic:FA.4/function-field-class-formation; FunctionFieldArithmetic:FA.4/global-abelian-existence.

### FunctionFieldArithmetic/request-weil-all-extensions

**Supplier:** WeilConjectures:WC.5. **Status:** open.

Independent curve Weil estimate over every finite extension and geometric Frobenius inverse roots of modulus √q; applies also to geometrically connected Chebotarev twists.

Must not depend on FA.4 existence or FA.5 rationality. Schmidt uses positive point counts in arbitrarily large incompatible extension degrees.

**Required by:** FunctionFieldArithmetic:FA.5/schmidt-degree-one; FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality; FunctionFieldArithmetic:FA.5/degree-sensitive-chebotarev.

### FunctionFieldArithmetic/request-finite-field-certificates

**Supplier:** FiniteFieldsAndCharacterSums:FF.3. **Status:** open.

Reuse FF.3 factorization certificates; extend its point-count certificate from odd elliptic Weierstrass models to general normalized projective curves and admissible hyperelliptic models over Fq^r.

The accepted factorization target is adequate. The accepted point-count target is only elliptic: it does not certify arbitrary curve counts. FA.7 owns normalized places and assembly of the L-polynomial, never the factorization or point-count algorithm.

**Required by:** FunctionFieldArithmetic:FA.1/certified-riemann-roch-computation; FunctionFieldArithmetic:FA.7/l-polynomial-certificate.

### FunctionFieldArithmetic/request-torsion-trace

**Supplier:** EtaleDualityAndPerverseSheaves:EDC.8. **Status:** open.

Grothendieck Euler-product/determinant trace formula for finite coefficient fields of characteristic ℓ≠p, with j_* inertia stalks for ramification and distinct j_! compact-support formula.

AV equation (3.2) is a torsion contract. No characteristic-zero lift is assumed; request the coefficient-accurate enhancement from the trace-formula owner.

**Required by:** FunctionFieldArithmetic:FA.5/torsion-trace-comparison.

### FunctionFieldArithmetic/request-weights-density

**Supplier:** DeligneWeightsAndPurity:DWP.1. **Status:** open.

Curve cohomological determinant comparison with geometric Frobenius, and characteristic-zero Brauer–Nesbitt interface for continuous semisimple representations.

Only these generic cohomological inputs are imported; FA.5 owns the finite function-field Chebotarev theorem and its profinite density deduction.

**Required by:** FunctionFieldArithmetic:FA.5/torsion-trace-comparison; FunctionFieldArithmetic:FA.5/frobenius-semisimple-determination.

### FunctionFieldArithmetic/request-curve-cup-product

**Supplier:** EtaleDualityAndPerverseSheaves:EDC.2. **Status:** open.

For odd-characteristic smooth proper curves, torsion-free integral Z₂ H¹ and its alternating cup-product pairing after reduction modulo 2.

FYZ Remark 2.1 requires alternation modulo 2; graded commutativity over F2 alone cannot prove it.

**Required by:** FunctionFieldArithmetic:FA.6/unitary-unramified-inducing-character.

### FunctionFieldArithmetic/request-rg-reduction

**Supplier:** ReductiveGroupsPartII:RG2.4. **Status:** open.

Rational parabolic radicals are K-split; integral unitary Siegel parabolic/Iwasawa data; nonsplit connected-reductive function-field reduction yielding common compact cusp support after all central degrees are bounded.

The read Harder theorem covers split Chevalley groups. The nonsplit reduction extension is not silently inferred. Generic group/decomposition objects stay in RG2; FA.6 owns the arithmetic cusp-finiteness specialization.

**Required by:** FunctionFieldArithmetic:FA.6/automorphic-function-space; FunctionFieldArithmetic:FA.6/cuspidal-constant-terms; FunctionFieldArithmetic:FA.6/harder-cuspidal-support; FunctionFieldArithmetic:FA.6/unitary-siegel-eisenstein-series.

### FunctionFieldArithmetic/request-integral-satake

**Supplier:** SmoothRepresentationsOfLocalGroups:SR.4. **Status:** open.

Integral spherical double-coset algebra with vol(U_v)=1, normalized Satake after adjoining q_v^(1/2), and unramified degenerate induction for the local unitary group.

Current upstream SmoothRepresentationsOfLocalGroups already owns local Hecke/Satake. Its current Suggested.lean was read; no local theory is replanned.

**Required by:** FunctionFieldArithmetic:FA.6/integral-coefficient-model; FunctionFieldArithmetic:FA.6/function-field-hecke-satake; FunctionFieldArithmetic:FA.6/unitary-siegel-eisenstein-series.

### FunctionFieldArithmetic/request-split-density

**Supplier:** GeometryOfNumbersAndQuadraticArithmetic:GN.3. **Status:** open.

Extend the existing Hermitian local-density, normalized Siegel polynomial, Cho–Yamauchi weight and overlattice formula from an inert unramified quadratic field to split F×F, using η(π)=+1 and total O_F-length 2ℓ′.

The exact GN.3 inert nodes are imported. FYZ Theorem 2.3 proves the split variant; the same foundational owner must supply it rather than duplicating it in FA.6.

**Required by:** FunctionFieldArithmetic:FA.6/unitary-whittaker-density-comparison.

### FunctionFieldArithmetic/request-local-siegel-weil

**Supplier:** MetaplecticAutomorphicForms:MP.6. **Status:** open.

Unramified equal-characteristic local unitary Siegel–Weil integral at source rank n+2j, with the FYZ spherical section, residue character and integral unipotent volume one.

The accepted unitary-siegel-weil-measure node has a different DL rank/normalization datum. It cannot be used without this explicit comparison; generic Weil representation/integral stays in MP.6.

**Required by:** FunctionFieldArithmetic:FA.6/unitary-whittaker-density-comparison.

### FunctionFieldArithmetic/request-eisenstein-continuation

**Supplier:** AutomorphicSpectralTheory:AS.1. **Status:** open.

Extend the convergence theorem to the unramified quadratic unitary Siegel induction over function fields and its stated unnormalized exponent s+n/2.

Current AS.1 generic statement is number-field based. FA.6 supplies arithmetic reduction and the exact FYZ data; AS.1 remains the generic analytic owner.

**Required by:** FunctionFieldArithmetic:FA.6/unitary-siegel-eisenstein-series.

### FunctionFieldArithmetic/request-eisenstein-meromorphic

**Supplier:** AutomorphicSpectralTheory:AS.2. **Status:** open.

Meromorphic continuation for the same function-field unitary Siegel family, with values treated as germs at poles.

FYZ §2.1 invokes continuation. Its proof is imported, never inferred from convergence.

**Required by:** FunctionFieldArithmetic:FA.6/unitary-siegel-eisenstein-series.

### FunctionFieldArithmetic/request-whittaker-function-field

**Supplier:** AutomorphicLFunctionsAndLocalFactors:AL.3. **Status:** open.

Keep the accepted GL_n Fourier reconstruction, Whittaker factorization and conductor-shift formula; reroute their function-field prerequisites to FA.2 residue Fourier theory and FA.6 cuspidality in place of number-field AL.0/AF inputs.

The existing AL.3 nodes explicitly cite Yu. Their general targets are reused; only the function-field prerequisite path needs repair.

**Required by:** FunctionFieldArithmetic:FA.6/yu-degree-zero-nonvanishing.

### FunctionFieldArithmetic/request-upstream-AlgebraicCurves-layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts

**Supplier:** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.0/finite-exact-base; FunctionFieldArithmetic:FA.1/rational-picard-comparison.

### FunctionFieldArithmetic/request-upstream-AlgebraicCurves-layer-2-affine-models--the-dedekind-bridge

**Supplier:** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.1/certified-riemann-roch-computation.

### FunctionFieldArithmetic/request-upstream-AlgebraicCurves-layer-4-repartitions-weil-differentials-and-riemannroch

**Supplier:** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.1/riemann-roch-basis-certificate; FunctionFieldArithmetic:FA.2/additive-diagonal-lattice; FunctionFieldArithmetic:FA.2/differential-additive-character; FunctionFieldArithmetic:FA.5/riemann-roch-zeta-rationality.

### FunctionFieldArithmetic/request-upstream-AlgebraicCurves-layer-5-consequences-of-riemannroch-and-local-components

**Supplier:** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.2/projective-adeles; FunctionFieldArithmetic:FA.2/idele-divisor-exact-sequence; FunctionFieldArithmetic:FA.2/additive-diagonal-lattice; FunctionFieldArithmetic:FA.2/completed-residue-functional; FunctionFieldArithmetic:FA.4/equal-characteristic-lubin-tate; FunctionFieldArithmetic:FA.4/ray-class-and-generalized-picard; FunctionFieldArithmetic:FA.7/normalized-completion-certificate.

### FunctionFieldArithmetic/request-upstream-AlgebraicCurves-layer-6-extensions-of-function-fields

**Supplier:** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.1/certified-riemann-roch-computation; FunctionFieldArithmetic:FA.3/ramification-import-contract; FunctionFieldArithmetic:FA.7/certified-place-enumeration.

### FunctionFieldArithmetic/request-upstream-AlgebraicCurves-layer-7-the-different-and-the-hurwitz-genus-formula

**Supplier:** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-7-the-different-and-the-hurwitz-genus-formula. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.3/ramification-import-contract; FunctionFieldArithmetic:FA.3/wild-cover-example.

### FunctionFieldArithmetic/request-upstream-AlgebraicCurves-layer-8-constant-field-extensions-galois-ramification-and-inseparability-

**Supplier:** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.0/finite-exact-base; FunctionFieldArithmetic:FA.3/ramification-import-contract.

### FunctionFieldArithmetic/request-upstream-AlgebraicCurves-layer-9-kähler-differentials-residues-and-the-comparison

**Supplier:** tauceti:TauCetiRoadmap/AlgebraicCurves#layer-9-kähler-differentials-residues-and-the-comparison. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.2/completed-residue-functional.

### FunctionFieldArithmetic/request-upstream-ClassFieldTheory-layer-1-formations-and-finite-normal-layers

**Supplier:** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-1-formations-and-finite-normal-layers. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.3/artin-schreier-witt-quotient; FunctionFieldArithmetic:FA.4/function-field-class-formation.

### FunctionFieldArithmetic/request-upstream-ClassFieldTheory-layer-2-class-formations-and-fundamental-classes

**Supplier:** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-2-class-formations-and-fundamental-classes. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.4/function-field-class-formation.

### FunctionFieldArithmetic/request-upstream-ClassFieldTheory-layer-3-tates-theorem-for-a-class-formation

**Supplier:** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.4/function-field-class-formation; FunctionFieldArithmetic:FA.4/global-artin-norm-isomorphism.

### FunctionFieldArithmetic/request-upstream-ClassFieldTheory-layer-4-the-abstract-artin-map

**Supplier:** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-4-the-abstract-artin-map. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.4/local-abelian-existence; FunctionFieldArithmetic:FA.4/function-field-class-formation; FunctionFieldArithmetic:FA.4/global-artin-norm-isomorphism; FunctionFieldArithmetic:FA.4/global-abelian-existence.

### FunctionFieldArithmetic/request-upstream-ClassFieldTheory-layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

**Supplier:** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.4/equal-characteristic-lubin-tate.

### FunctionFieldArithmetic/request-upstream-ClassFieldTheory-layer-6-the-local-class-formation-and-finite-local-reciprocity

**Supplier:** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.4/local-abelian-existence; FunctionFieldArithmetic:FA.4/schmid-witt-artin-comparison.

### FunctionFieldArithmetic/request-upstream-ClassFieldTheory-layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

**Supplier:** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.4/local-abelian-existence.

### FunctionFieldArithmetic/request-upstream-LocalFieldsRamification-layer-3-ramification-the-tame-and-wild-cases-and-the-filtration

**Supplier:** tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration. **Status:** open.

Import the existing layer contract only; consult the named native declarations and the current upstream inventory in the reader.

This is a dependency receipt, not a request to replan a Tau Ceti roadmap. The accepted RS-04 boundary is enforced.

**Required by:** FunctionFieldArithmetic:FA.3/ramification-import-contract; FunctionFieldArithmetic:FA.3/reduced-witt-laurent-data.

### Recorded gaps

- **LEAN-INTERFACES: omitted supplier conditions.** At the pinned baseline the external scheme Picard/ray, étale trace, automorphic parabolic/induction and norm-formation interfaces are not importable as implementation declarations. Suggested.lean prototypes actual native carriers and records each omitted condition next to its signature; it never replaces those conditions by placeholder logical fields or axioms that stand for an unstated condition. The reader and packet retain the complete mathematical hypotheses. Prototype elaboration does not certify the omitted interfaces or any result.
- **GEO-RAY proof boundary.** Conrad Theorems 3.1–3.2 give the exact geometric ray-cover/classification contract but not its complete proof. Before closure, verify the generalized-Jacobian Rosenlicht construction, connectedness of the pulled-back Lang ray torsor and conductor/Artin comparison, using the named SF.3 supplier and a cleared proof source. ADT Appendix A explicitly excludes existence and does not fill this boundary.
- **RG-RED nonsplit reduction boundary.** Harder Theorem 1.2.1 and Corollary 1.2.3 read here prove split Chevalley support/compactness. The arbitrary connected-reductive assertion is conditional on the exact RG2.4 request, including full central-degree bounds; no unrestricted reductive finiteness is claimed.
- **GENERAL-POINT-COUNT certificate supplier.** FF.3 currently certifies an odd-characteristic elliptic model only. General curve/hyperelliptic count certificates over all required finite extensions remain the FF.3 request; FA.7 assembly alone cannot certify those input counts.

## Public source reading and version boundaries

All statements and proof sketches here are written in our own words. The bibliography records the exact text read and its theorem, section and page locators. Reading these targeted sections does not assert a complete reading of each paper. Rosen, Stichtenoth and Weil were not cleared in the reference-library index; no copy of those books was used. Public replacements cover the verified arithmetic steps. The geometric global-existence proof boundary remains explicit. Publisher versions not served during this run are not treated as read.

<a id="source-yu"></a>

### yu: Comptage des systèmes locaux ℓ-adiques sur une courbe

Hongjie Yu. [arXiv:1807.04659v5](https://arxiv.org/pdf/1807.04659v5). Read 2026-10-10.

**Verified portions:** §§2.2–2.3, pp.7–11; §5.3.1, Lemma 5.3.3 and its complete proof, pp.36–38.

**SHA-256:** 9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c.

<a id="source-ch"></a>

### ch: On the generalized Ramanujan and Arthur conjectures over function fields

Dan Ciubotaru and Michael Harris. [arXiv:2311.15300v1; published version not served](https://arxiv.org/pdf/2311.15300v1). Read 2026-10-10.

**Verified portions:** §3, Proposition 3.1 and Lemma 3.2, pp.8–9.

**SHA-256:** 7261083b46cc8ec3fad81215250ff6bef47da05ef6054813572de21db10dc103.

<a id="source-dad"></a>

### dad: Parabolicity conjecture of F-isocrystals

Marco D’Addezio. [arXiv:2012.12879v4](https://arxiv.org/pdf/2012.12879v4). Read 2026-10-10.

**Verified portions:** Proof of Theorem 5.3.3, p.27.

**SHA-256:** f92379bec97564edc2b89f86f6bfc5c271abdc31c5d17cb9ba93b58e204a07a8.

<a id="source-av"></a>

### av: Symplectic L-functions and symplectic Reidemeister torsion (mod squares)

Amina Abdurrahman and Akshay Venkatesh. [arXiv:2303.13436v1](https://arxiv.org/pdf/2303.13436v1). Read 2026-10-10.

**Verified portions:** §3.2, equations (3.1)–(3.2), pp.26–27.

**SHA-256:** 3e2736beea70ba3467ad30a24b518d82cf589d9ddd4a06f6b0684c7bfd7d6306.

<a id="source-fyz"></a>

### fyz: Higher Siegel–Weil formula for unitary groups: the non-singular terms

Tony Feng, Zhiwei Yun and Wei Zhang. [arXiv:2103.11514v4](https://arxiv.org/pdf/2103.11514v4). Read 2026-10-10.

**Verified portions:** §§2.1–2.6, Remark 2.1, Definition 2.2, Theorem 2.3, Lemma 2.7 and Theorem 2.8, pp.8–15.

**SHA-256:** c6a65b8c01333cc726ba6b163fd24aba5022db6cf5baf00c353ccb9b9ba182b8.

<a id="source-kw"></a>

### kw: On the arithmetic of Zp-extensions

Michiel Kosters and Daqing Wan. [arXiv:1607.00523v1](https://arxiv.org/pdf/1607.00523v1). Read 2026-10-10.

**Verified portions:** §§3.1–3.2, pp.6–10; Proposition 3.10, p.12; §§4.1–4.4, pp.14–19; Theorem 4.12 and Proposition 4.14, pp.21–23.

**SHA-256:** c306bfb15225da4558574451e2ae22cb307c8f0b698dc5f366e543350f9522ab.

<a id="source-parshin"></a>

### parshin: Notes on the Poisson formula

A. N. Parshin. [arXiv:1011.3392v1](https://arxiv.org/pdf/1011.3392v1). Read 2026-10-10.

**Verified portions:** §1, pp.3–5; §§2.1–2.2, pp.6–9; §2.5, pp.14–15.

**SHA-256:** acbb25d15ad3efc8fc70f92cc436c8ed0ea7d8b74487e338af996f403b6270da.

<a id="source-roquette"></a>

### roquette: Class Field Theory in Characteristic p, Its Origin and Development

Peter Roquette. [author PDF](https://www.mathi.uni-heidelberg.de/~roquette/klkall.pdf). Read 2026-10-10.

**Verified portions:** §4.3.3, pp.25–28 (zeta arithmetic and Schmidt context).

**SHA-256:** 1714d2d51e38fbf954544d6e1e40e8d5f9f98fd370d63adad5b8101e5b5887a3.

<a id="source-harder"></a>

### harder: Chevalley groups over function fields and automorphic forms

Günter Harder. [Annals of Mathematics 100 (1974), 249–306; public scan](https://www.ariel.ac.il/wp/yuval-flicker/wp-content/uploads/sites/316/2026/03/HarderChevalleyGpsFunFields1974.pdf). Read 2026-10-10.

**Verified portions:** §§1.1–1.2, Theorem 1.2.1 and Corollary 1.2.3, pp.252–256.

**SHA-256:** a6e654188e504f21a2caa11888160499e7c86fa9b7f0e4bfd92535835d423bfa.

<a id="source-bhkt"></a>

### bhkt: G-hat-local systems on smooth projective curves are potentially automorphic

Gebhard Böckle, Michael Harris, Chandrashekhar Khare and Jack A. Thorne. [arXiv:1609.03491v2, 29 August 2019](https://arxiv.org/pdf/1609.03491v2). Read 2026-10-10.

**Verified portions:** §8.1, Proposition 8.2 and proof, pp.34–35.

**SHA-256:** ec54cf92ce04146c73b48945be2765f675359255d46cc94a0aa35a39229743b9.

<a id="source-lz"></a>

### lz: Kudla–Rapoport cycles and derivatives of local densities

Chao Li and Wei Zhang. [arXiv:1908.01701v3](https://arxiv.org/pdf/1908.01701v3). Read 2026-10-10.

**Verified portions:** §§3.1–3.5, Theorem 3.5.1 and proof, pp.15–18.

**SHA-256:** 7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49.

<a id="source-kcheb"></a>

### kcheb: A short proof of a Chebotarev density theorem for function fields

Michiel Kosters. [arXiv:1404.6345v1](https://arxiv.org/pdf/1404.6345v1). Read 2026-10-10.

**Verified portions:** §§1.1–1.3, Theorem 1.1, Corollary 1.2, Lemmas 1.3–1.4 and their complete proofs, pp.1–5.

**SHA-256:** 6e98f8196ac9731be61947a4dd3d6fce14abd306f4b1a154e49b450db69c35ea.

<a id="source-yoshida"></a>

### yoshida: Local Class Field Theory via Lubin-Tate Theory

Teruyoshi Yoshida. [Ann. Fac. Sci. Toulouse 17 (2008), 411–438](https://www.numdam.org/item/10.5802/afst.1188.pdf). Read 2026-10-10.

**Verified portions:** Theorem A, pp.411–412; §2.2, pp.413–414; §§5.1–5.3, Proposition 5.10, Theorem 5.15, Corollary 5.16 and proofs, pp.422–428; §§6.1–6.3, Theorems 6.11 and 6.15 and proofs, pp.428–433; §§3.1–4.2, Lemma 3.4, Proposition 3.5, Proposition 4.4 and proofs, pp.415–421; Appendix II, Proposition 8.1 and Lemmas 8.2–8.3 with proofs, pp.436–437.

**SHA-256:** 37a2b12ba633f505d6753e034812a047f998e30c663976ca87cc742b3d311c74.

<a id="source-adt"></a>

### adt: Arithmetic Duality Theorems

J. S. Milne. [Second edition, author’s freely licensed electronic edition, 1 July 2006](https://www.jmilne.org/math/Books/ADTnot.pdf). Read 2026-10-10.

**Verified portions:** Chapter I, Appendix A, pp.126–138, including A.1–A.15; this appendix explicitly excludes the existence theorem.

**SHA-256:** 2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31.

<a id="source-conrad"></a>

### conrad: Geometric global class field theory

Brian Conrad. [Math 249B course handout, 2009, author PDF](https://math.stanford.edu/~conrad/249BW09Page/handouts/geomcft.pdf). Read 2026-10-10.

**Verified portions:** §§1–3, Examples 2.1–2.2, Theorems 3.1–3.2, pp.1–4; theorem statements and geometric reformulation, not a full existence proof.

**SHA-256:** d5a83bd35472904dabd0d8ff02974b221065af2ebbc421d12a45bb3e3da16a85.

<a id="source-hess"></a>

### hess: Computing Riemann–Roch Spaces in Algebraic Function Fields and Related Topics

Florian Hess. [21-page author manuscript posted at Sage Days 2010; publisher copy not served](https://sagewiki.lipn.univ-paris13.fr/daysff/curves?action=AttachFile&do=get&target=hess-computing_riemann_roch_spaces_in_algebraic_function_fields_and_related_topics.pdf). Read 2026-10-10.

**Verified portions:** §3.2, pp.3–4; §4, Lemmas 1–2 and Corollaries 3–4 with proofs, pp.4–6; §5, Theorem 7, Proposition 9 and complete proofs, pp.6–8; §6, Algorithm 13 and Remark 14, pp.9–10.

**SHA-256:** 69d7e3d1f2455dd79081247d20b30ceb1176812411f78ec036ae58528fc0882a.

## Source corrections

Five findings are retained with their precise version scope. The descriptions paraphrase the source; they reproduce no source passage. The corrected contracts are used throughout this roadmap. New findings require independent verification; the two Yu findings were already confirmed by the named independent paper review.

### FunctionFieldArithmetic/E1

**Source and location:** parshin; arXiv:1011.3392v1, §2.2, p.9, displayed pairing; printed page image checked.

**Reading:** The pairing into U(1) is written as a sum of the local multiplicative character values.

**Correction:** Multiply the local character values, equivalently apply the finite-field character to the finite sum of trace residues.

**Reason and effect:** At (0,0) each summand is 1 at every closed point, so the printed infinite sum is undefined and cannot be a character. Affects: nothing. Classification: misprint.

**Existing correction status:** new.

**Search boundary:** arXiv:1011.3392 submission history: only v1; AMS DOI 10.1090/S1061-0022-2012-01218-5 and its PDF endpoint: HTTP 403; no published text read; AMS erratum search and MathNet publication listing; Steklov author publication list https://www.mi-ras.ru/index.php?c=pubs&id=11177&l=0&showall=show&showmode=groups; no correction located.

### FunctionFieldArithmetic/E2

**Source and location:** parshin; arXiv:1011.3392v1, §2.2, p.9, character specification immediately after the pairing; printed image checked.

**Reading:** The finite-field additive character into complex units is described as injective and determined by a qth root of unity for general q.

**Correction:** Choose a nontrivial character of Fp and compose it with Tr_{Fq/Fp}. It is generally noninjective; the induced residue pairing is nevertheless nondegenerate.

**Reason and effect:** The additive group of F_{p^f} has exponent p. Any homomorphism to C× has image in μ_p and cannot be injective if f>1. Finite-field trace pairing, rather than injectivity of the scalar character, proves nondegeneracy. Affects: the proof. Classification: error.

**Existing correction status:** new.

**Search boundary:** arXiv:1011.3392 history: only v1; AMS published PDF refused with HTTP 403; finding limited to preprint; AMS erratum search, MathNet listing and Steklov author publication list; no correction located.

### FunctionFieldArithmetic/E3

**Source and location:** parshin; arXiv:1011.3392v1, §2.1, p.7, test-function spanning assertion and footnote 4; printed image checked.

**Reading:** The complex Bruhat–Schwartz space is asserted to be spanned by the unshifted indicators of the additive groups A(D).

**Correction:** Use indicators of translates a+A(D); finite quotients show that these span the locally constant compactly supported space.

**Reason and effect:** Every unshifted A(D) indicator is invariant under multiplication by every element of k×. For |k|>2 choose a nonzero coset of a smaller compact-open subgroup that is moved by such a scalar; its indicator is a test function outside that invariant span. Affects: the proof. Classification: error.

**Existing correction status:** new.

**Search boundary:** arXiv:1011.3392 history: only v1; AMS published PDF endpoint: HTTP 403, not read; AMS erratum search, MathNet listing and Steklov author publication list; no correction located.

### FunctionFieldArithmetic/E4

**Source and location:** yu; arXiv:1807.04659v5, Lemma 5.3.3, p.36.

**Reading:** The vector is allowed to be any member of the representation, although the conclusion asserts a nonzero value.

**Correction:** Require the vector to be nonzero; in this plan it is also explicitly spherical, as in the surrounding spherical Hecke-module setting.

**Reason and effect:** The zero vector has no nonzero value. The Fourier reconstruction proof requires a nonzero Whittaker coefficient. Affects: nothing. Classification: misprint.

**Existing correction status:** Already recorded as PAPER-YU-23/E10 and confirmed by REV-PAPER-YU-23; no separate published correction located.

**Search boundary:** PAPER-YU-23/E10 and its finished review; Annals article record https://annals.math.princeton.edu/2023/197-2/p01, checked 2026-10-10; no correction linked; Author https://www.hongjieyu.com/ publication listing and arXiv v1–v5 history; v5 read, no inter-version collation; The published PDF was not served; finding is confined to the read preprint.

### FunctionFieldArithmetic/E5

**Source and location:** yu; arXiv:1807.04659v5, proof of Lemma 5.3.3, pp.37–38.

**Reading:** The negative diagonal exponents are assigned negative Yu determinant degree, and a positive scalar power is used to cancel it.

**Correction:** For diagonal exponents −(n−1)n_v,…,0 the valuation degree is −n(n−1)(g−1), hence Yu degree is +n(n−1)(g−1). Use scalar power −(n−1)(g−1).

**Reason and effect:** Yu degree is the negative of the weighted valuation sum. Summing the exponents and using the canonical degree 2g−2 gives the stated positive sign; the scalar determinant contributes n times the scalar degree. Affects: the proof. Classification: misprint.

**Existing correction status:** Already recorded as PAPER-YU-23/E11 and confirmed by REV-PAPER-YU-23; no separate published correction located.

**Search boundary:** PAPER-YU-23/E11, including its independently checked determinant calculation; Annals article record, author publication listing and arXiv history checked for corrections; Published PDF not served; this finding is scoped to arXiv v5.

## Review and completion obligations

Independent review must verify the mathematical contracts, the exact supplier scope and the source corrections. Closure requires discharging GEO-RAY, RG-RED and GENERAL-POINT-COUNT, and replacing the omitted supplier conditions in the prototypes by their actual interfaces. The generalized Picard/Lang/Tsen, all-extension Weil, finite-coefficient trace, integral cup product, local Siegel–Weil and equal-characteristic analytic inputs are requested from their owners. The maintainer must apply the four cross-roadmap ownership corrections recorded above. No stage is reported as formally implemented or closed.
