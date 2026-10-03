# Positive-divisibility coaction and invariant algebra

For an arbitrary commutative ring A and f∈A, let D_f be the existing direct limit over all positive integers ordered by divisibility. Its root v_n comes from A[t_n]/(t_n^n−f). Let C_f be the factorial colimit, E:D_f≃ₐ[A]C_f its existing cofinality equivalence, and G=A[ℚ/ℤ] the native rational-character group algebra. This continuation constructs T=id_G⊗E and the actual left coaction δ_D=T⁻¹∘δ_C∘E. It imports the existing colimits and all generic tensor and equalizer operations.

The key computation works at every positive index, including nonfactorial ones. Cofinality sends v_n to the ((n+1)!/n)-th power of the factorial root. Its rational character is ((n+1)!/n)/(n+1)!=1/n, so δ_D(v_n)=e_[1/n]⊗v_n. Root extensionality gives compatibility with the entire finite coaction. Native direct-limit extensionality then proves the counit and coassociativity identities from this root formula; no target ring instance or universe is silently changed.

Injectivity of T reflects universal coinvariance. The authenticated incoming factorial invariant theorem therefore gives δ_D(x)=1⊗x exactly when x comes from A. Coefficient injectivity makes this coefficient unique. Restricting the actual coefficient algebra map to the native equalizer gives the algebra equivalence A≃I_D, with forward/inverse formulas and agreement with factorial invariant coordinates. This does not prove a coarse-space universal property or a geometric quotient theorem.

The examples keep zero rings and wild characteristic. In Z/4 with f=2 the index-three root has character [1/3], and the 3∣6 transition is respected. In Z/2 with f=0 the index-two root is nonzero and square-zero, yet fails universal coinvariance: an invariant coefficient would have square zero in Z/2 and therefore be zero, contradicting injectivity and the finite power basis. Equality of scalar-point actions cannot replace the universal tensor equation.

Talpo–Vistoli arXiv1410.1164v2 printed pp.14–16 were freshly reread in full as extracted text. The cofinality and grading arguments motivate these authored algebraic deductions. The incoming source-version/source-issue records are retained without claiming a new whole-paper or published-version audit. Every incoming node remains intact. Earlier reader sections below retain the frontier as it stood at their own checkpoint.

The actual positive-divisibility colimit now has a rational-character LEFT coaction, compatible with every finite coaction, with native counit and coassociativity. Its universal coinvariants are exactly and uniquely the coefficient ring, realized by the native equalizer algebra equivalence; the factorial and positive-divisibility invariant coordinates agree. Still open: higher-universe target transports, coefficient-change naturality of these new positive-divisibility comparisons, coherent root-object groupoid reindexing, Spec-limit comparison, fpqc frame torsors and geometric quotient/descent, DVR and Kummer-limit routes. The reserved general root-stack key, all ten partial stages, all eight gaps, all thirteen supplier requests and every earlier source route remain open as recorded.

## Tensor comparison for positive divisibilities

**TauCeti.RootStack.divisibilityQZTensorEquiv** — Construct T:G⊗_A D_f ≃ₐ[A] G⊗_A C_f as the native tensor congruence of id_G with the existing cofinality equivalence E.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-factorial-equivalence, mathlib:Algebra.TensorProduct.congr.

Proof: Apply the existing tensor congruence to the actual algebra equivalences. No flatness premise is needed.

API:

- **TauCeti.RootStack.divisibilityQZTensorEquiv.tmul**: T(g⊗x)=g⊗E(x) for every g∈G and x∈D_f.
- **TauCeti.RootStack.divisibilityQZTensorEquiv.symm_tmul**: T⁻¹(g⊗y)=g⊗E⁻¹(y) for every g∈G and y∈C_f.
- **TauCeti.RootStack.divisibilityQZCoaction.transport**: For every x∈D_f, T(δ_D(x))=δ_C(E(x)).

TESTS:

- **TauCeti.RootStack.divisibilityQZTensorEquiv.test_pure**: Evaluate T on an arbitrary pure tensor.
- **TauCeti.RootStack.divisibilityQZTensorEquiv.test_inverse**: The inverse recovers every arbitrary tensor, not just pure tensors.
- **TauCeti.RootStack.divisibilityQZTensorEquiv.test_zero_ring**: For A=Z/1 and f=0 the target tensor is zero, retaining the zero-ring case.

## Tensor comparison on pure tensors

**TauCeti.RootStack.divisibilityQZTensorEquiv.tmul** — T(g⊗x)=g⊗E(x) for every g∈G and x∈D_f.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-tensor-equivalence.

Proof: Evaluate native tensor congruence.

## Inverse tensor comparison

**TauCeti.RootStack.divisibilityQZTensorEquiv.symm_tmul** — T⁻¹(g⊗y)=g⊗E⁻¹(y) for every g∈G and y∈C_f.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-tensor-equivalence.

Proof: Evaluate the inverse native tensor congruence.

## Universal coaction over positive divisibilities

**TauCeti.RootStack.divisibilityQZCoaction** — Construct δ_D:D_f→ₐ[A]G⊗_A D_f by δ_D=T⁻¹∘δ_C∘E, using the inherited factorial rational-character coaction.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-tensor-equivalence, FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction.

Proof: Compose the actual algebra homomorphisms. Subsequent lemmas prove the counit and coassociativity equations on the native colimit.

API:

- **TauCeti.RootStack.divisibilityQZCoaction.root**: For every positive n, δ_D(v_n)=e_[1/n]⊗v_n.
- **TauCeti.RootStack.divisibilityQZCoaction.level**: For every positive n, δ_D∘j_n=(finiteQZAlgMap_n⊗j_n)∘affineCoaction_n as A-algebra homomorphisms.
- **TauCeti.RootStack.divisibilityQZCoaction.constant**: For every a∈A, δ_D(algebraMap(a))=1⊗algebraMap(a).
- **TauCeti.RootStack.divisibilityQZCoaction.counit**: The composite D_f→G⊗D_f→A⊗D_f→D_f of δ_D, ε_G⊗id and the native left unitor is id_D.
- **TauCeti.RootStack.divisibilityQZCoaction.coassoc**: After the native associator, (Δ_G⊗id)∘δ_D=(id_G⊗δ_D)∘δ_D as maps to G⊗(G⊗D_f).
- **TauCeti.RootStack.divisibilityQZCoaction.coinvariant_iff**: δ_D(x)=1⊗x if and only if δ_C(E(x))=1⊗E(x).
- **TauCeti.RootStack.divisibilityQZCoaction.invariants**: For every x∈D_f, δ_D(x)=1⊗x if and only if there exists a∈A with x=algebraMap(a).
- **TauCeti.RootStack.divisibilityQZCoaction.invariants_unique**: Every universally coinvariant x∈D_f has a unique a∈A satisfying x=algebraMap(a).

TESTS:

- **TauCeti.RootStack.divisibilityQZCoaction.test_third_root**: Over Z/4 with nonunit f=2, the nonfactorial positive index 3 root has character [1/3].
- **TauCeti.RootStack.divisibilityQZCoaction.test_one**: At positive index 1 the root equals the coefficient f and has trivial character.
- **TauCeti.RootStack.divisibilityQZCoaction.test_divisibility**: Under 3∣6, δ(v_3)=δ(v_6)^2 using the actual transition, not a new representative.
- **TauCeti.RootStack.divisibilityQZCoaction.test_native_transport**: The actual tensor comparison intertwines the two universal coactions for every element.
- **TauCeti.RootStack.divisibilityQZCoaction.test_wild_nilpotent**: Over Z/2 with f=0, v_2 is nonzero and square-zero but is not universally coinvariant. The finite power basis and injective inclusion prove nonzero; invariant coefficients would force a^2=0 in the field Z/2 and hence a=0.
- **TauCeti.RootStack.divisibilityQZCoaction.test_finite_level**: At n=3, the whole finite coaction commutes with inclusion for every finite chart element.

## Cofinality intertwines the coactions

**TauCeti.RootStack.divisibilityQZCoaction.transport** — For every x∈D_f, T(δ_D(x))=δ_C(E(x)).

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-coaction.

Proof: Cancel T with its inverse in the definition. This compares universal coactions, not scalar-point actions.

## Character of an arbitrary positive root

**TauCeti.RootStack.factorialQZCoaction.extension_root** — For every positive n, δ_C(ε_n(t_n))=e_[1/n]⊗ε_n(t_n), where ε_n is the existing cofinal extension of A[t_n]/(t_n^n−f).

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/factorial-affine-extension, FunctionFieldArithmeticPartII:RS.2/root-factorial-cofinal, FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-power, mathlib:Nat.cast_div.

Proof: Represent ε_n(t_n) by the ((n+1)!/n)-th power of the factorial-level root. Apply the inherited power formula and use n∣(n+1)! and n≠0 to identify the rational character ((n+1)!/n)/(n+1)!=1/n.

## Positive-level root character

**TauCeti.RootStack.divisibilityQZCoaction.root** — For every positive n, δ_D(v_n)=e_[1/n]⊗v_n.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-coaction-transport, FunctionFieldArithmeticPartII:RS.2/divisibility-qz-tensor-pure, FunctionFieldArithmeticPartII:RS.2/factorial-qz-extension-root, FunctionFieldArithmeticPartII:RS.2/divisibility-factorial-inclusion.

Proof: Apply the injective T. Cofinality identifies E(v_n) with ε_n(t_n), whose character is the previous lemma.

## Compatibility with every finite coaction

**TauCeti.RootStack.divisibilityQZCoaction.level** — For every positive n, δ_D∘j_n=(finiteQZAlgMap_n⊗j_n)∘affineCoaction_n as A-algebra homomorphisms.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-root, FunctionFieldArithmeticPartII:RS.2/finite-qz-alg-map, FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:AdjoinRoot.algHom_ext.

Proof: Two algebra maps from the actual AdjoinRoot algebra agree when they agree at its root. Evaluate both sides, using the finite character map at 1 to obtain [1/n].

## Coefficient coinvariance

**TauCeti.RootStack.divisibilityQZCoaction.constant** — For every a∈A, δ_D(algebraMap(a))=1⊗algebraMap(a).

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-coaction.

Proof: Both δ_D and the native right inclusion commute with the A-algebra maps.

## Counit on the positive-divisibility colimit

**TauCeti.RootStack.divisibilityQZCoaction.counit** — The composite D_f→G⊗D_f→A⊗D_f→D_f of δ_D, ε_G⊗id and the native left unitor is id_D.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-root, mathlib:DirectLimit.Algebra.hom_ext, mathlib:AdjoinRoot.algHom_ext.

Proof: Use native direct-limit homomorphism extensionality, then root extensionality on each finite component. The group-algebra counit sends e_[1/n] to 1, so the root is recovered.

## Coassociativity over positive divisibilities

**TauCeti.RootStack.divisibilityQZCoaction.coassoc** — After the native associator, (Δ_G⊗id)∘δ_D=(id_G⊗δ_D)∘δ_D as maps to G⊗(G⊗D_f).

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-root, mathlib:DirectLimit.Algebra.hom_ext, mathlib:AdjoinRoot.algHom_ext.

Proof: Reduce equality of algebra maps to every finite root. Its group-like character has Δ(e_q)=e_q⊗e_q; both sides are e_[1/n]⊗(e_[1/n]⊗v_n).

## Cofinality reflects universal coinvariance

**TauCeti.RootStack.divisibilityQZCoaction.coinvariant_iff** — δ_D(x)=1⊗x if and only if δ_C(E(x))=1⊗E(x).

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-coaction-transport, FunctionFieldArithmeticPartII:RS.2/divisibility-qz-tensor-pure.

Proof: Apply injectivity of the native tensor algebra equivalence T and the transport identity.

## Injective positive-divisibility coefficient map

**TauCeti.RootStack.divisibilityAffineColimit.coefficient_injective** — The actual coefficient homomorphism A→D_f is injective, including for the zero ring.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-factorial-equivalence, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-injective.

Proof: Apply E to equality of coefficient images. Its A-algebra compatibility reduces the assertion to the inherited factorial coefficient injectivity.

## Invariant algebra over positive divisibilities

**TauCeti.RootStack.divisibilityQZCoaction.invariants** — For every x∈D_f, δ_D(x)=1⊗x if and only if there exists a∈A with x=algebraMap(a).

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-coinvariant-transport, FunctionFieldArithmeticPartII:RS.2/qz-coaction-invariants.

Proof: Transport coinvariance to C_f and apply its previously proved coefficient-extraction theorem. E commutes with coefficient maps and is injective, so the same a represents x in D_f. Conversely every coefficient is invariant.

## Unique invariant coefficient

**TauCeti.RootStack.divisibilityQZCoaction.invariants_unique** — Every universally coinvariant x∈D_f has a unique a∈A satisfying x=algebraMap(a).

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-invariants, FunctionFieldArithmeticPartII:RS.2/divisibility-coefficient-injective.

Proof: Existence is the invariant theorem. Injectivity of the coefficient homomorphism proves uniqueness.

## Native invariant algebra equivalence

**TauCeti.RootStack.divisibilityInvariantEquiv** — Construct A≃ₐ[A]I_D, where I_D is the actual AlgHom.equalizer of δ_D and the right tensor inclusion D_f→G⊗D_f.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-qz-invariants, FunctionFieldArithmeticPartII:RS.2/divisibility-qz-constant, FunctionFieldArithmeticPartII:RS.2/divisibility-coefficient-injective, mathlib:AlgHom.equalizer, mathlib:AlgHom.codRestrict, mathlib:Algebra.ofId, mathlib:AlgEquiv.ofBijective.

Proof: Restrict the coefficient algebra homomorphism to the native equalizer using coefficient coinvariance. Injectivity is coefficient injectivity; surjectivity follows from the invariant theorem. Use the native equivalence constructor for this actual bijection.

API:

- **TauCeti.RootStack.divisibilityInvariantEquiv.apply_coe**: The underlying D_f element of divisibilityInvariantEquiv(f)(a) is algebraMap(a).
- **TauCeti.RootStack.divisibilityInvariantEquiv.inverse_coe**: For x∈I_D, the coefficient image of divisibilityInvariantEquiv(f)⁻¹(x) equals x.val.
- **TauCeti.RootStack.divisibilityInvariantEquiv.eq_iff**: For x∈I_D and a∈A, divisibilityInvariantEquiv(f)⁻¹(x)=a if and only if x.val=algebraMap(a).
- **TauCeti.RootStack.divisibilityInvariantEquiv.factorial**: For every a∈A, E((divisibilityInvariantEquiv(f)(a)).val)=(factorialInvariantEquiv(f)(a)).val.

TESTS:

- **TauCeti.RootStack.divisibilityInvariantEquiv.test_coefficient_two**: Over Z/4 with f=2 the invariant image of coefficient 2 is its actual coefficient inclusion.
- **TauCeti.RootStack.divisibilityInvariantEquiv.test_zero_ring**: For A=Z/1,f=0 the unique coefficient has invariant image zero.
- **TauCeti.RootStack.divisibilityInvariantEquiv.test_inverse**: The equivalence applied to its inverse recovers each arbitrary equalizer element.
- **TauCeti.RootStack.divisibilityInvariantEquiv.test_factorial**: Every coefficient has the same invariant coordinates after the actual cofinality comparison.
- **TauCeti.RootStack.divisibilityInvariantEquiv.test_unique**: Equality of the underlying invariant elements forces equality of their coefficients.

## Invariant equivalence forward map

**TauCeti.RootStack.divisibilityInvariantEquiv.apply_coe** — The underlying D_f element of divisibilityInvariantEquiv(f)(a) is algebraMap(a).

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-invariant-equivalence.

Proof: Evaluate the restricted coefficient homomorphism.

## Invariant equivalence inverse map

**TauCeti.RootStack.divisibilityInvariantEquiv.inverse_coe** — For x∈I_D, the coefficient image of divisibilityInvariantEquiv(f)⁻¹(x) equals x.val.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-invariant-equivalence, FunctionFieldArithmeticPartII:RS.2/divisibility-invariant-forward.

Proof: Apply the forward-inverse law of the actual algebra equivalence and take its underlying element.

## Characterization of the invariant coefficient

**TauCeti.RootStack.divisibilityInvariantEquiv.eq_iff** — For x∈I_D and a∈A, divisibilityInvariantEquiv(f)⁻¹(x)=a if and only if x.val=algebraMap(a).

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-invariant-inverse, FunctionFieldArithmeticPartII:RS.2/divisibility-coefficient-injective.

Proof: Use the inverse coefficient equation in the forward direction; reflect equality by coefficient injectivity in the reverse direction.

## Invariant coordinates agree under cofinality

**TauCeti.RootStack.divisibilityInvariantEquiv.factorial** — For every a∈A, E((divisibilityInvariantEquiv(f)(a)).val)=(factorialInvariantEquiv(f)(a)).val.

Hypotheses: A is any commutative ring in a fixed arbitrary universe, and f∈A is arbitrary. Zero rings, nilpotents, nonunits and wild characteristic are included. No reducedness, exponent-invertibility or flatness hypothesis is added. D_f is the existing native direct limit of B_n=A[t_n]/(t_n^n−f) over positive integers ordered by divisibility. Its actual inclusions are j_n and v_n=j_n(t_n). C_f is the inherited factorial colimit with d_i=(i+1)!, and E=divisibilityFactorialEquiv(f):D_f≃ₐ[A]C_f. G is the existing native MonoidAlgebra A (Multiplicative (AddCircle (1:ℚ))), written A[ℚ/ℤ]. e_q denotes its basis character. δ_C is the inherited LEFT rational-character coaction. All tensor products, equalizers, associators and unitors are native. Higher-universe target transport and coefficient-change naturality of this new comparison are not asserted.

Prerequisites: FunctionFieldArithmeticPartII:RS.2/divisibility-invariant-forward, FunctionFieldArithmeticPartII:RS.2/divisibility-factorial-equivalence, FunctionFieldArithmeticPartII:RS.2/factorial-invariant-algebra-equivalence.

Proof: Both invariant equivalences have forward map equal to coefficient inclusion, and E is an A-algebra equivalence.

# Infinite affine coinvariants and their coefficient algebra

## Scope and conventions

The root-stack owner and every incoming contract are retained. This section develops the affine algebra underlying the infinite root chart. It does not identify a geometric quotient stack, a coarse moduli space, an fpqc frame torsor or a root-object groupoid. Those constructions use their separately owned inputs.

Fix any commutative ring A and any f∈A, in the fixed universe of the native factorial colimit. No domain, reducedness, nontriviality, Noetherianity or invertibility assumption is present. Write d_i=(i+1)! and B_i=A[t_i]/(t_i^d_i−f). The inherited divisibility maps send t_i to t_j^(d_j/d_i). Their actual direct limit is C_A(f), with injective finite-stage maps ι_i and included roots u_i. Every element has a finite-level representative. The monic power basis of B_i has precisely the vectors t_i^j, 0≤j<d_i; this basis is used over a nontrivial base, with the zero ring handled separately.

Write Q/Z as the native rational AddCircle of period one, G_A=A[Q/Z] for its multiplicative group algebra, and e_q for its character basis. The normalized character is χ_n(j)=[j/n]. The inherited coaction is LEFT: η_f:C_A(f)→G_A⊗_A C_A(f). It sends u_i^j to e_(χ_d_i(j))⊗u_i^j and coefficients a to 1⊗a. Coinvariance means equality of these native universal tensors. Checking only base-field points cannot detect the infinitesimal wild stabilizers and is not the condition used here.

## Construction and proof interior

The coefficient functional first extracts the character coefficient in G_A and then applies the tensor left unitor. Thus it lands in C_A(f), rather than in A or a renamed invariant predicate. Linearity handles every finite sum without flatness. For a root expansion at level i, different j∈Fin(d_i) have different normalized characters: equality in Q/Z gives equality in Z/d_i, whose natural representatives below d_i are equal. Applying the k-character functional to the coaction leaves just ι_i(c_k t_i^k).

If the expansion is coinvariant and k≠0, that character is nonzero, while its coefficient in 1⊗x vanishes. Therefore ι_i(c_k t_i^k)=0. The genuine injectivity of the finite-level inclusion returns this equality to B_i. The k-th monic basis coordinate then gives c_k=0. This step does not cancel t_i, which can be nilpotent, and does not assume the coefficient c_k is regular. Conversely, vanishing of all nonzero-index coefficients leaves just c_0, which is coinvariant by the actual coefficient formula.

Choose a finite representative of any x∈C_A(f) and apply this criterion to its monic expansion. The finite affine invariant theorem identifies that same representative with a coefficient. Passing it through ι_i gives the same coefficient in the colimit. This proves existence. Coefficient inclusion is injective because it factors through the positive-degree monic quotient at exponent one and the already injective level-zero colimit inclusion. Thus the coefficient is unique.

The inherited native tensor equivalence between the original unity-root coaction ρ_f and η_f reflects universal tensor equality. It transfers the same invariant criterion to ρ_f without a pointwise shortcut. Finally, restrict the actual coefficient algebra homomorphism to the native equalizer of η_f and the right inclusion. Existence and injectivity make this map bijective, giving the native A-algebra equivalence. The inverse recovers the coefficient of that same invariant element.

No theorem asserting that invariants commute with arbitrary filtered colimits is imported. The proof uses the specific finite-level representatives, distinct rational weights and injective transition maps of this tower. Arbitrary coefficient homomorphisms still need their stated naturality comparisons; one-way preservation of coinvariance is not reflection under a noninjective homomorphism.

## Declaration contracts, APIs and tests

### Rational-character tensor coefficient

TauCeti.RootStack.qzTensorCoefficient — FunctionFieldArithmeticPartII:RS.2/qz-tensor-character-coefficient

For q∈Q/Z define the native A-linear map P_q:G⊗_A C→C by composing the existing group-algebra coefficient equivalence, evaluation at q, the tensor map with id_C and the native left unitor. Thus P_q(e_r a⊗x)=a·x if r=q, and 0 otherwise.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit, FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-constant, mathlib:MonoidAlgebra.coeffLinearEquiv, mathlib:Finsupp.lapply, mathlib:TensorProduct.map, mathlib:TensorProduct.lid.

Proof route: Use the native coefficient linear equivalence and native Finsupp evaluation; compose their linear maps. Tensor the coefficient functional with id_C, then compose with the existing native A⊗_A C≃C. This is a coefficient map, not an algebra homomorphism. Evaluate a character basis tensor using the native tensor-map and unitor formulas; linearity supplies sums and scalar multiples.

Acceptance: Retain the zero ring, f=0 and nonunits, and wild characteristic; use universal coaction equality, not fixedness under field-valued points.

API TauCeti.RootStack.qzTensorCoefficient.single (simp): P_q(e_r a⊗x) is a·x when r=q and zero otherwise.

API TauCeti.RootStack.qzTensorCoefficient.constant (simp): P_q(1⊗x)=x for q=0 and zero for q≠0.

API TauCeti.RootStack.qzTensorCoefficient.coaction_constant (compatibility): P_q(η_f(a)) is the actual coefficient image of a for q=0, and zero for q≠0.

Test TauCeti.RootStack.qzTensorCoefficient.test_matching (computation): For every q,a,x, P_q(e_q a⊗x)=a·x.

Test TauCeti.RootStack.qzTensorCoefficient.test_nonzero_character (non-example): For q≠0, P_q(1⊗x)=0; this excludes evaluation on the second tensor factor.

Test TauCeti.RootStack.qzTensorCoefficient.test_zero_character (compatibility): P_0(1⊗x)=x, agreeing with the native tensor left unitor.

Test TauCeti.RootStack.qzTensorCoefficient.test_zero_ring (degenerate): For A=Z/1 and f=0 every character coefficient of 1⊗x is zero.

### Distinct finite rational characters

TauCeti.RootStack.affineQZCharacter.fin_injective — FunctionFieldArithmeticPartII:RS.2/qz-character-fin-injective

For n≥1, the map Fin(n)→Q/Z sending j to χ_n(j) is injective.

Dependencies: FunctionFieldArithmeticPartII:RS.2/qz-character-injective, mathlib:ZMod.val_natCast_of_lt.

Proof route: Apply the inherited injectivity of χ_n on Z/n to an equality of characters. Apply the native residue-value map to the resulting equality in Z/n; values of natural residues below n equal their original integers, so Fin extensionality proves equality.

Acceptance: Retain the zero ring, f=0 and nonunits, and wild characteristic; use universal coaction equality, not fixedness under field-valued points.

### Character coefficient of a finite root expansion

TauCeti.RootStack.factorialQZCoaction.coefficient_sum — FunctionFieldArithmeticPartII:RS.2/qz-coaction-finite-coefficient

For i≥0, c:Fin(d_i)→A and k∈Fin(d_i), P_(χ_d_i(k))(η_f(ι_i(Σ_j c_j t_i^j)))=ι_i(c_k t_i^k).

Dependencies: FunctionFieldArithmeticPartII:RS.2/qz-tensor-character-coefficient, FunctionFieldArithmeticPartII:RS.2/qz-character-fin-injective, FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-power, FunctionFieldArithmeticPartII:RS.2/qz-character-natcast, FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion.

Proof route: Use the inherited power formula η_f(u_i^j)=e_(χ_d_i(j))⊗u_i^j and native A-linearity. Apply P_(χ_d_i(k)) term by term; distinctness of the finite characters kills every j≠k. The remaining term is c_k u_i^k=ι_i(c_k t_i^k); neither the scalar nor the root is cancelled.

Acceptance: Retain the zero ring, f=0 and nonunits, and wild characteristic; use universal coaction equality, not fixedness under field-valued points.

### Finite-level criterion for infinite coinvariance

TauCeti.RootStack.factorialQZCoaction.invariants_sum_iff — FunctionFieldArithmeticPartII:RS.2/qz-coaction-finite-invariant-criterion

For i≥0 and c:Fin(d_i)→A, η_f(ι_i(Σ_j c_j t_i^j))=1⊗ι_i(Σ_j c_j t_i^j) if and only if c_j=0 for every j≠0.

Dependencies: FunctionFieldArithmeticPartII:RS.2/qz-coaction-finite-coefficient, FunctionFieldArithmeticPartII:RS.2/qz-tensor-character-coefficient, FunctionFieldArithmeticPartII:RS.2/qz-character-fin-injective, FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-injective, FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-constant, mathlib:AdjoinRoot.powerBasis', mathlib:Polynomial.monic_X_pow_sub_C, mathlib:Polynomial.natDegree_X_pow_sub_C, mathlib:Module.Basis.reindex, mathlib:Module.Basis.reindex_apply, mathlib:Module.Basis.equivFun_self.

Proof route: For k≠0 its rational character is nonzero by finite-character injectivity. Apply P_(χ_d_i(k)) to universal coinvariance: the right-hand coefficient is zero, and the left-hand coefficient is ι_i(c_k t_i^k). Use actual finite-stage injectivity to get c_k t_i^k=0 in B_i. Over a nontrivial A, apply the k-th coordinate of the reindexed monic power basis to conclude c_k=0. For a subsingleton A the same conclusion is immediate. No regularity of t_i is used. Conversely, sum reduction leaves only c_0; the algebra-map coefficient formula and constant coaction give 1⊗c_0.

Acceptance: At d_1=2 over F_2 the criterion is precisely c_1=0, not invariance under μ_2(F_2). At f=0 over Z/4 the expansion with c_1=2 and c_0=0 is not coinvariant, although its nonconstant coefficient is nilpotent.

Test TauCeti.RootStack.factorialQZCoaction.test_wild_coefficient_criterion (characterisation): At level one, A=F₂ and f=0, universal coinvariance of the two-coefficient expansion is equivalent to c_1=0.

Test TauCeti.RootStack.factorialQZCoaction.test_nonzero_nilpotent_rejected (non-example): At level one over Z/4 with f=0, the expansion c_0=0,c_1=2 is not coinvariant, although c_1 is a nonzero nilpotent.

### Infinite affine coinvariants

TauCeti.RootStack.factorialQZCoaction.invariants — FunctionFieldArithmeticPartII:RS.2/qz-coaction-invariants

For every x∈C_A(f), η_f(x)=1⊗x if and only if x=algebraMap(a) for some a∈A.

Dependencies: FunctionFieldArithmeticPartII:RS.2/qz-coaction-finite-invariant-criterion, FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-elements, FunctionFieldArithmeticPartII:RS.1/affine-invariants, FunctionFieldArithmeticPartII:RS.1/affine-invariant-coefficient-criterion, mathlib:AdjoinRoot.powerBasis', mathlib:Polynomial.monic_X_pow_sub_C, mathlib:Polynomial.natDegree_X_pow_sub_C, mathlib:Module.Basis.sum_equivFun, mathlib:Module.Basis.reindex, mathlib:Module.Basis.reindex_apply, FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-constant.

Proof route: Represent x at an actual finite level by the direct-limit element theorem. Handle the zero ring directly. Use the monic power basis to expand this representative, apply the finite-level criterion to force its nonzero-weight coefficients to vanish. Invoke the inherited finite invariant criterion and finite invariant theorem on that same representative. Its coefficient image passes to the same coefficient in the colimit. Constants satisfy coinvariance by the inherited constant formula. This does not commute invariants with an arbitrary filtered colimit or arbitrary base change without proof.

Acceptance: Retain the zero ring, f=0 and nonunits, and wild characteristic; use universal coaction equality, not fixedness under field-valued points.

### Faithful coefficient inclusion in the root colimit

TauCeti.RootStack.factorialAffineColimit.coefficient_injective — FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-injective

For every f∈A the actual coefficient map A→C_A(f) is injective.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-injective, mathlib:AdjoinRoot.of.injective_of_monic_of_degree_pos, mathlib:Polynomial.monic_X_pow_sub_C, mathlib:Polynomial.degree_X_pow_sub_C.

Proof route: Factor the coefficient map through level i=0, whose exponent is one. The positive-degree monic quotient coefficient map is injective; then use the actual injective finite-level inclusion into C_A(f). The subsingleton coefficient ring satisfies injectivity directly.

Acceptance: Retain the zero ring, f=0 and nonunits, and wild characteristic; use universal coaction equality, not fixedness under field-valued points.

### Unique invariant coefficient

TauCeti.RootStack.factorialQZCoaction.invariants_unique — FunctionFieldArithmeticPartII:RS.2/qz-coaction-invariants-unique

If η_f(x)=1⊗x, there exists a unique a∈A with x=algebraMap(a).

Dependencies: FunctionFieldArithmeticPartII:RS.2/qz-coaction-invariants, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-injective.

Proof route: Take a coefficient supplied by the invariant theorem. Any two coefficients with that image agree by coefficient-map injectivity.

Acceptance: For A=Z/1 every x has the unique coefficient 0. For every A,f,a the image of a has exactly coefficient a.

Test TauCeti.RootStack.factorialQZCoaction.test_unique_constants (characterisation): For every A,f,a, the actual coefficient image of a has the unique coefficient a.

Test TauCeti.RootStack.factorialQZCoaction.test_coefficient_unique_zero_ring (degenerate): For A=Z/1 and f=0 every colimit element has the unique coefficient zero.

### Coinvariants in unity-root coordinates

TauCeti.RootStack.factorialCoaction.invariants — FunctionFieldArithmeticPartII:RS.2/factorial-coaction-invariants

For every x∈C_A(f), ρ_f(x)=1⊗x in C_A(1)⊗_A C_A(f) if and only if x=algebraMap(a) for some a∈A.

Dependencies: FunctionFieldArithmeticPartII:RS.2/qz-coaction-invariants, FunctionFieldArithmeticPartII:RS.2/qz-chart-coinvariance.

Proof route: Use the inherited native tensor-algebra equivalence to reflect universal coinvariance between ρ_f and η_f. Apply the proved rational-coordinate invariant theorem to the same x. This is equality of universal coactions, not a comparison using scalar points.

Acceptance: Retain the zero ring, f=0 and nonunits, and wild characteristic; use universal coaction equality, not fixedness under field-valued points.

### Infinite invariant algebra

TauCeti.RootStack.factorialInvariantEquiv — FunctionFieldArithmeticPartII:RS.2/factorial-invariant-algebra-equivalence

Let I_f be the native AlgHom.equalizer of η_f:C_A(f)→A[Q/Z]⊗_A C_A(f) and the right inclusion x↦1⊗x. Construct the A-algebra equivalence A≃I_f induced by the actual coefficient map.

Dependencies: FunctionFieldArithmeticPartII:RS.2/qz-coaction-invariants, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-injective, mathlib:AlgHom.equalizer, mathlib:AlgHom.mem_equalizer, mathlib:AlgHom.codRestrict, mathlib:Algebra.ofId, mathlib:AlgEquiv.ofBijective.

Proof route: Restrict the coefficient A-algebra homomorphism to the native equalizer; constant coinvariance proves membership. Its underlying map is injective by coefficient inclusion and surjective by the invariant theorem. Apply the existing native bijective algebra-hom equivalence constructor. The forward map is coefficient inclusion, and the inverse is the coefficient of that same invariant element. Do not construct a separate opaque invariant carrier or infer geometric coarse universality.

Acceptance: Retain the zero ring, f=0 and nonunits, and wild characteristic; use universal coaction equality, not fixedness under field-valued points.

API TauCeti.RootStack.factorialInvariantEquiv.apply_coe (simp): The underlying chart element of factorialInvariantEquiv(f)(a) is the coefficient image of a.

API TauCeti.RootStack.factorialInvariantEquiv.inverse_coe (compatibility): Including the inverse coefficient of x∈I_f back into C_A(f) gives x itself.

API TauCeti.RootStack.factorialInvariantEquiv.eq_iff (characterisation): For x∈I_f and a∈A, the inverse coefficient of x is a if and only if x itself is the actual coefficient image of a.

Test TauCeti.RootStack.factorialInvariantEquiv.test_coefficient_two (computation): For A=Z/4 and f=2, the forward image of coefficient 2 is its actual chart inclusion.

Test TauCeti.RootStack.factorialInvariantEquiv.test_zero_ring (degenerate): For A=Z/1 and f=0 the forward image of the sole coefficient is zero.

Test TauCeti.RootStack.factorialInvariantEquiv.test_unity (compatibility): For f=1 every forward image is universally coinvariant for the original unity-root coaction ρ_1.

Test TauCeti.RootStack.factorialInvariantEquiv.test_inverse (characterisation): For every x in the native equalizer, applying the forward map to its inverse coefficient recovers exactly x.

## Additional theorem acceptance examples

TauCeti.RootStack.factorialQZCoaction.test_unique_constants asserts that the image of any a∈A has exactly the same coefficient a.

TauCeti.RootStack.factorialQZCoaction.test_wild_coefficient_criterion specializes level one to d_1=2, f=0 and A=F₂. Universal coinvariance is exactly vanishing of c_1. This distinguishes the universal μ₂ action from its trivial group of field-valued points.

TauCeti.RootStack.factorialQZCoaction.test_nonzero_nilpotent_rejected takes A=Z/4, f=0, d_1=2, c_0=0 and c_1=2. This nonzero nilpotent coefficient produces a noncoinvariant chart element. Vanishing of higher powers is not enough for coinvariance.

TauCeti.RootStack.factorialQZCoaction.test_coefficient_unique_zero_ring asserts that every x over Z/1 has the unique coefficient zero. The theorem includes this degenerate case rather than imposing nontriviality globally.

## Source and ownership boundary

The motivating primary text is Talpo–Vistoli, arXiv1410.1164v2, printed/PDF pages14–16: the Cartier-dual grading, Lemma3.7 degree-zero calculation, Definition3.8, the complete Proposition3.10/Lemma3.12 proof route and Corollary3.13. The nine named native adapters are authored deductions from the specific factorial colimit and the pinned Mathlib statements, not names or full theorems printed in that paper. This is a selected source audit, not a whole-paper or errata certification.

The native tensor maps, coefficient equivalence, finite quotient bases, equalizer and bijective algebra-equivalence constructor are imported. No generic group, Hopf, tensor, stack or coarse-moduli theory is rebuilt. The geometric root-stack reserved node remains unchanged, as do the Yun–Zhang and Abdurrahman–Venkatesh routes, all source findings, eight gaps, thirteen requests and all ten partial stages. Full exact-pin Tau Ceti canonical-file typing, positive-index and higher-universe transport, root-object groupoid reindexing, affine Spec limits, fpqc frame torsors and quotient/DVR/Kummer comparisons remain required. This invariant-algebra theorem is one input to those goals, not their completion.

---

## Universal invariants on finite affine root charts

Let A be any commutative ring, f any element and n a positive integer. Use the native quotient B=A[t]/(t^n−f), the native character Hopf algebra A[Z/n] and the actual left coaction δ(t)=e₁⊗t. Invariance means δ(b)=1⊗b as an equality of universal tensors. It does not mean invariance under the set of A-valued roots of unity. No division by n, averaging, nonzerodivisor condition on f, reducedness or Noetherianity is imposed.

The existing monic quotient basis writes b uniquely as Σ c_i t^i, with 0≤i<n, on a nontrivial base. In the existing character tensor coordinates, δ(b) puts c_i at (i,i), while 1⊗b puts it at (0,i). Thus the positive coefficients vanish exactly when b is universally invariant. The zero-ring branch is handled directly before invoking the degree theorem. Existing generic monic coefficient injectivity gives the unique constant representative; it receives no new blueprint node.

Use Mathlib's AlgHom.equalizer of δ and the native right inclusion as the actual invariant subalgebra. The coefficient algebra map lands there, is injective by the generic positive-degree monic quotient theorem and surjective by the finite invariant criterion. The native bijective algebra-hom constructor gives A≃I, with forward and inverse coefficient formulas. This identifies the algebraic input to the finite coarse-space theorem. The geometric quotient, its coarse universal property and arbitrary-base-change comparison still use ROOT-COARSE from AlgebraicModuliForArithmeticGeometry:R09.5; the finite algebra calculation does not establish those geometric statements or the infinite invariant algebra.

### Diagonal character coordinates of the coaction

TauCeti.RootStack.affineCoaction.coordinates_diagonal: Let b=Σ_{i∈Fin n} c_i t^i and use the existing native target-coordinate equivalence C on A[Z/n]⊗_A A[t]/(t^n−f). For q=(r,s), C(δ(b))_q equals c_s if r=s and zero otherwise.

Use the existing weight formula δ(t^i)=e_i⊗t^i and linearity over A. The existing target-coordinate monomial formula places each c_i at (i,i). Evaluate the finite sum at (r,s); only i=s can survive, and it survives exactly when r=s.

Prerequisites: FunctionFieldArithmeticPartII:RS.0/affine-coaction-weight, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-basis-coordinate, mathlib:TensorProduct.tmul_smul.

### Zero character row of the invariant comparison

TauCeti.RootStack.affineCoaction.coordinates_constant_row: With b and C as above, C(1⊗b)_(r,s) equals c_s if r=0 and zero otherwise.

Write 1=e_0 in the native character algebra. Move each scalar through the actual tensor product and apply the existing coordinate monomial formula at (0,i). Evaluate the finite sum; only i=s contributes, and its character index must be zero.

Prerequisites: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-basis-coordinate, mathlib:TensorProduct.tmul_smul, mathlib:TensorProduct.tmul_sum, mathlib:MonoidAlgebra.one_def.

### Vanishing of the positive-degree invariant coefficients

TauCeti.RootStack.affineCoaction.invariants_sum_iff: For b=Σ_{i∈Fin n} c_i t^i, δ(b)=1⊗b if and only if c_i=0 for every i≠0.

If the tensors agree, compare their native coordinates at (i,i) for every nonzero i: the diagonal coefficient is c_i while the zero character row is zero. Conversely all positive coefficients vanish; the diagonal and zero-row formulas agree at every coordinate, and injectivity of the existing coordinate equivalence identifies the tensors.

Prerequisites: FunctionFieldArithmeticPartII:RS.0/affine-coaction-diagonal-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-coaction-constant-row-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence.

### Coefficient equivalence with the affine invariant algebra

TauCeti.RootStack.affineInvariantEquiv: Let I be the native AlgHom.equalizer of δ:A[t]/(t^n−f)→A[Z/n]⊗_A A[t]/(t^n−f) and the right inclusion b↦1⊗b. Construct the A-algebra equivalence A≃I induced by the actual coefficient map.

Use the native algebra-map equalizer and codomain restriction; coefficient coinvariance proves membership. This imports generic equalizer theory rather than constructing a second invariant predicate. The existing affine-invariants theorem supplies surjectivity. The existing positive-degree monic AdjoinRoot coefficient-injectivity theorem supplies injectivity, with the zero-ring branch handled directly. Apply the native bijective algebra-hom equivalence constructor. Its forward value is the coefficient inclusion and its inverse is the unique coefficient of the same invariant element.

Prerequisites: FunctionFieldArithmeticPartII:RS.1/affine-invariants, mathlib:AlgHom.equalizer, mathlib:AlgHom.mem_equalizer, mathlib:AlgHom.codRestrict, mathlib:AlgEquiv.ofBijective, mathlib:AdjoinRoot.of.injective_of_monic_of_degree_pos, mathlib:Polynomial.degree_X_pow_sub_C, mathlib:Algebra.ofId.

TauCeti.RootStack.affineInvariantEquiv.apply_coe: For a∈A, the underlying root-chart element of affineInvariantEquiv(a) is the actual coefficient image of a.

TauCeti.RootStack.affineInvariantEquiv.inverse_coe: For x in the native invariant subalgebra I, including its inverse coefficient back into the root chart gives the underlying element x.

TauCeti.RootStack.affineInvariantEquiv.eq_iff: For x∈I and a∈A, the inverse coefficient of x equals a if and only if the underlying root-chart element of x equals the coefficient image of a.

Use in FunctionFieldArithmeticPartII:RS.1/coarse-space: Identify the actual affine invariant algebra with the coefficient base before applying the separately owned geometric coarse-space universal property.

Use in FunctionFieldArithmeticPartII:RS.1/affine-chart and the reserved root-stack key: Give the finite quotient chart its coefficient invariant-algebra identification, including wild exponents and nonreduced sections.

Use in Talpo–Vistoli Lemma 3.7 degree-zero calculation and Corollary 3.13 finite chart: Express the finite P=N degree-zero calculation as an actual native algebra equivalence rather than an assertion about invariance under field points.

### Coaction API and acceptance examples

TauCeti.RootStack.affineCoaction.coordinates_diagonal: Let b=Σ_{i∈Fin n} c_i t^i and use the existing native target-coordinate equivalence C on A[Z/n]⊗_A A[t]/(t^n−f). For q=(r,s), C(δ(b))_q equals c_s if r=s and zero otherwise.

TauCeti.RootStack.affineCoaction.coordinates_constant_row: With b and C as above, C(1⊗b)_(r,s) equals c_s if r=0 and zero otherwise.

TauCeti.RootStack.affineCoaction.invariants_sum_iff: For b=Σ_{i∈Fin n} c_i t^i, δ(b)=1⊗b if and only if c_i=0 for every i≠0.

TauCeti.RootStack.affineCoaction.invariants_unique: Every universally coinvariant b∈A[t]/(t^n−f) has a unique coefficient a∈A with b=algebraMap(a), over every commutative base and positive exponent.

AffineInvariantTests.wild_root: Over A=F₂, f=0 and n=2, the actual nilpotent root is not universally coinvariant; the nonzero character coordinate survives although n=0 in A.

AffineInvariantTests.nilpotent_weight: Over A=Z/4, f=0 and n=2, the nonzero coefficient 2 times the actual root is not coinvariant. Coefficient torsion and nilpotence do not erase the universal character weight.

AffineInvariantTests.unique_nilpotent_constant: Over A=Z/4, f=0 and n=2, the coefficient image of 2 has exactly one coefficient representative in A.

AffineInvariantTests.zero_ring: For a subsingleton coefficient ring A and any positive n, every root-chart element is coinvariant and has exactly one coefficient representative.

AffineInvariantTests.exponent_one: For every A and f, each element of A[t]/(t−f) has exactly one coefficient representative.

AffineInvariantTests.equivalence_linear_root: For A=Z/11, n=1 and f=7, the inverse invariant-algebra equivalence sends the actual root to 7.

AffineInvariantTests.equivalence_nilpotent: For A=Z/4, n=2 and f=0, the inverse equivalence recovers coefficient 2, and its image remains square-zero in the root chart.

AffineInvariantTests.equivalence_zero_ring: For a subsingleton coefficient ring, the inverse invariant-algebra equivalence sends every invariant element to 0 for every positive exponent.

The F₂ example retains the nonzero universal weight of a nilpotent root. The Z/4 example retains the nonzero nilpotent coefficient 2 in degree one while distinguishing it from the constant coefficient 2, whose invariant image remains square-zero. At exponent one the actual linear root has its specified coefficient value; over the zero ring every carrier is subsingleton. These tests guard against replacing scheme invariants with point invariants or discarding coefficient torsion.

Sources: Talpo–Vistoli printed pp. 14–16, the finite character grading, degree-zero argument of Lemma 3.7 and Corollary 3.13. The root-specific formulas above are derived from that grading using the existing native bases. All ten stages, the general scheme/stack root key, arbitrary exponents, relative evaluation roots, infinite roots, all eight gaps, thirteen requests and both Yun–Zhang and symplectic routes retain their full required scope.

# Arbitrary-section rational coaction: current algebraic frontier

Codex — codex-a71f92,2026-10-03. This is a partial checkpoint, not a formalised library or a completed geometric root-stack construction. All391 incoming declaration contracts are retained; the packet now has392 nodes. Earlier execution qualifications in the preserved document and node hypotheses describe their original checkpoints, not the current certificate.

For every commutative ring A, including the zero ring, and every section f∈A, put d_i=(i+1)!, C_A(f)=the actual factorial root-chart colimit, H_A=C_A(1) and G_A=A[Q/Z] using the pinned native monoid algebra. The incoming actual equivalence E_A:H_A≃G_A identifies h_i with e_[1/d_i]. The LEFT rational coaction is η_f=(E_A⊗id)ρ_f. The section stays f and the character stays in the first tensor factor.

## Actual native proof routes

The separate certificate supplies all ten existing coaction declarations from the admission-free incoming E_A and ρ_f. The root formula is η_f(u_i)=e_[1/d_i]⊗u_i and the power formula is η_f(u_i^k)=e_[k/d_i]⊗(u_i^k). Natural multiples are transported through the actual additive-circle quotient; neither the root nor its section is cancelled. Counitality is checked on each actual quotient generator. Coassociativity is checked by direct-limit and AdjoinRoot extensionality: both sides send the generator to e_[1/d_i]⊗(e_[1/d_i]⊗u_i). The native tensor associator determines the parentheses. These new generator routes supplement, rather than remove, the existing Hopf-transport routes.

The counit composite is an actual left inverse and proves injectivity without a nontrivial-ring assumption. Native tensor congr(E_A,refl) reflects the universal coinvariance equation η_f(x)=1⊗x exactly when ρ_f(x)=1⊗x. This coordinate reflection is not reflection under arbitrary coefficient reduction and does not yet calculate the invariant algebra. On the unity chart, transporting the second factor as well gives the native group-algebra comultiplication.

The characteristic-two zero-section test is not a point-action test. Its actual root u_1 is nonzero by the monic power basis and injectivity of the finite-level inclusion. The universal character [1/2] is nonzero by the already proved rational-character embedding. Apply the existing coefficient linear equivalence, fixed-index evaluation and tensor left unitor to the proposed equality η_0(u_1)=1⊗u_1: its two sides yield u_1 and0, a contradiction. The nilpotent root is retained.

## Coefficient square and attribution

The ten coefficient-change proof bodies are credited to Codex — codex-rtOQ9t, PR5978. Their36-artifact archive was hash-verified; these bodies were recovered unchanged apart from their explanatory comment and replayed over the concrete native coaction and coordinate equivalence, with no admitted inputs. The map Q_(φ,f) uses the existing heterobasic tensor ring map and group-algebra coefficient map. It preserves character weights while sending coefficients through φ and roots through the actual factorialCoefficientMap. Identity, three-ring composition, the coordinate tensor square, coaction naturality and one-way coinvariance preservation are checked. ℤ→F₂ can kill a coefficient and is not injective; no reflection of coinvariance is inferred. The nine incoming coefficient tests remain actual checks, including a nonunit section2 becoming0.

## Two prototype precedence corrections

In the inherited power signature and sixth-root example, the unparenthesized second-factor power parsed as a power of the entire tensor. That would multiply the character twice and disagrees with the existing mathematical statement. Only those two Lean prototype lines acquire parentheses around the root power. The corrected sixth-root computation over Z/4 is e_[1/3]⊗u_2², not the tensor-square of that expression. This is a prototype correction, not an alleged error in Talpo–Vistoli or the arithmetic papers. All other incoming canonical bytes are preserved before the new admitted signatures.

## Defining-degree boundary API

TauCeti.RootStack.factorialQZCoaction.root_degree — For every commutative ring A, arbitrary f∈A and factorial level i, η_f(u_i^d_i)=1⊗a_f(f), where d_i=(i+1)! and a_f:A→C_A(f) is the native coefficient map. The whole tensor is not raised to d_i.

Use the actual included-root relation u_i^d_i=a_f(f) and then evaluate η_f on that coefficient. This keeps zero and nonunit sections and requires no cancellation.

TauCeti.RootStack.factorialQZCoaction.test_degree_six_nonunit — For A=Z/4,f=2,i=2, η_2(u_2⁶)=1⊗a_2(2). This checks the defining-degree boundary for a nonunit section without cancelling the root.

TauCeti.RootStack.factorialQZCoaction.test_power_zero — For every A,f and i, η_f(u_i⁰)=1⊗1, with the zero power taken before applying the coaction.

TauCeti.RootStack.factorialQZCoaction.test_zero_ring_injective — For A=Z/1 and f=0, the actual rational-character coaction η_0 is injective; no nontrivial-ring assumption is introduced.

## Generality and sources

The reserved FunctionFieldArithmeticPartII:key/root-stacks contract remains the general scheme/stack construction for every positive exponent, with the relative evaluation version and infinite limit. This affine certificate does not narrow it to a field, a unit section, tame exponents or finite-type quotients. SchemeAndStackFoundations owns generic descent, Picard/tensor geometry and affine-limit inputs; the named fppf Kummer and fpqc infinite torsor distinction, TOWER-AFF and TOWER-TYPING requests remain. Yun–Zhang's geometric character-sheaf and trace/norm endpoint and the independent38-item symplectic route are not replaced by this algebra calculation.

Fresh source reading is limited to full printed pp.14–16 of [Talpo–Vistoli v2](https://arxiv.org/pdf/1410.1164v2), including the local grading setup and the complete Lemmas3.7/3.12 and Proposition3.10 proofs and Corollary3.13. The native formulas are authored algebraic deductions. Earlier whole-paper, route and erratum receipts remain attributed to their workers. No new primary-source error is asserted.

The full suggested Tau file is UNCOMPILED because no existing full Tau build matches the required source pin. The separate Mathlib-only native proof certificate and admitted-signature extraction are distinct checks with exact source hashes, serial memory guards and axiom audits in the handoff. Higher-universe/full-positive-index transport, convolution-point identification, coherent groupoid reindexing, Spec limits, fpqc frame torsors and quotient/DVR/Kummer comparisons still require work. No stage or implementation status closes.

## Preserved detailed predecessor document

The following is unchanged incoming text. Its earlier frontiers and reading/compilation receipts are historical and attributed; the current frontier is the one above.

# Native rational characters and infinite unity-root coordinates

This continuation supplies a separate native proof extraction for the 28 existing rational-character and unity-root coordinate contracts. Three computation lemmas expose the unreduced natural representative, the canonical residue representative and the comparison on every factorial-level element. The incoming statements, hypotheses, APIs, tests, source routes and reserved root-stack definition remain in force. Earlier checkpoint statements about uncompiled coordinate prototypes describe their own historical artifacts; the current execution boundary is recorded in the handoff.

Write d_i=(i+1)!, U_A for the existing factorial colimit of A[t]/(t^d_i−1), and G_A=A[Q/Z] for the native group algebra of the rational additive circle. A is an arbitrary commutative ring in one fixed universe. No reducedness, nontriviality, flatness or invertibility of exponents is assumed. In particular the zero ring and wild characteristic remain valid inputs.

The mathematical motivation is the Cartier-dual group and local grading in [Talpo–Vistoli §3.1, printed14–16](https://arxiv.org/pdf/1410.1164v2). Those pages, including the local quotient proofs, were freshly read. The following named coordinate maps and proof adapters are authored deductions. This is not a new reading receipt for the complete paper or for either arithmetic source route.

The native construction of c_n:Z/n→Q/Z uses ZMod.lift on k↦[k/n]. Its integer formula fixes the sign. Mathlib already provides ZMod.toAddCircle for the real circle; the rational target requires this specialization of the same native quotient strategy. For injectivity, val(k)/n lies in [0,1), so the existing additive-circle interval-injectivity theorem reduces equality to equality of natural representatives. For n dividing N the exact fraction identity ((N/n)val(k))/N=val(k)/n proves the transition. Every rational circle class has a representative q; taking n=den(q), k=num(q) proves exhaustion directly. The pinned Tau Ceti torsion exhaustion and generator theorems still supply the earlier alternative route. None of these steps replans generic quotient, cyclic-subgroup or torsion machinery.

Apply the native monoid-algebra domain map to the multiplicative form of c_n. Its injectivity follows from the native injective-domain-map theorem without assumptions on coefficients. Compose it with the inherited finite unity-root/cyclic-coordinate equivalence to obtain F_n. The transition equality is proved on the finite cyclic basis; it includes the coefficient algebra map and therefore is equality of actual algebra homomorphisms. Mapping the root equation and the finite transition gives the factorial power relations.

The inherited universal root lift defines F:U_A→G_A. Root extensionality first proves its value on every element of a factorial chart; the chosen positive-index extension then proves the existing leg formula. For injectivity, represent x−y at one factorial level and apply finite injectivity. For surjectivity, finite-support induction lifts each coefficient-bearing basis element through its finite cyclic chart and adds the lifts. Promote F with the existing bijective-algebra-map constructor to E_A. Applying E_A verifies the stated inverse on a rational basis label, including negative rationals and zero.

For comultiplication and counit use the native algebra maps and the inherited root-extensionality theorem. On a root the two comultiplications are the same pure tensor and both counits equal 1. The antipode uses the existing antipodeAlgHom for a commutative Hopf algebra; it is not a newly defined generic inversion map. The two candidate antipode values are inverses of the same image of a universal root unit, so cancel that unit. For an arbitrary coefficient map φ:A→B, the inherited ring-homomorphism extensionality theorem compares constants and roots. Both root images are e_[1/d_i] with coefficient φ(1)=1. This square needs no flatness or injectivity of φ.

## Natural representative of the finite rational character

`TauCeti.RootStack.affineQZCharacter.natCast` — For every n>0 and k∈N, c_n([k])=[k/n], without reducing k before forming the rational quotient.

Cast k to an integer and apply the existing integer-character computation; the natural/integer casts agree.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-character-intcast`.

## Canonical representative of the finite rational character

`TauCeti.RootStack.affineQZCharacter.apply` — For n>0 and k∈Z/n, c_n(k)=[val(k)/n], where 0≤val(k)<n.

Apply the natural-character computation to val(k), then use the native reduction identity. This form puts the rational value in [0,1) for injectivity.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-character-natcast`, `mathlib:ZMod.natCast_zmod_val`.

## Factorial-level rational character comparison

`TauCeti.RootStack.factorialUnitQZMap.level` — For every i∈N and x∈A[t]/(t^((i+1)!)−1), F(ι_i(x))=F_((i+1)!)(x), with the actual factorial inclusion and finite root map.

Compare the two actual A-algebra homomorphisms out of the finite quotient by their root images. Both send the root to e_[1/((i+1)!)]; evaluate the resulting map equality at x.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-unit-qz-root`, `FunctionFieldArithmeticPartII:RS.2/finite-root-qz-root`, `mathlib:AdjoinRoot.algHom_ext`.

## Added regression contracts

- `TauCeti.RootStack.affineQZCharacter.test_natcast_period`: At n=3 the unreduced natural representative 7 maps to [7/3].
- `TauCeti.RootStack.affineQZCharacter.test_negative_representative`: At n=3 the canonical natural representative of −1 is 2, and its character is [2/3].
- `TauCeti.RootStack.factorialUnitQZMap.test_level_basis`: For every coefficient a∈A, the level-two inclusion of the inverse cyclic basis element a e_[2] maps to a e_[1/3].

The separate native extraction also checks the fifteen inherited rational-coordinate examples: orientation, the 2-to-6 transition, negative basis labels, exponent one, arbitrary and torsion coefficients, zero-ring injectivity, a negative inverse and nonflat coefficient naturality. Both characteristic-two examples retain a nonzero element whose square is zero. The infinite example also checks its full three-term comultiplication. No reduced-fibre replacement is used.

## Remaining construction

The 28 rational-coordinate declarations and three computation lemmas now have separate exact-Mathlib native proof evidence, including arbitrary coefficients and wild nilpotents. Next prove the admitted arbitrary-section rational coaction contracts over this actual equivalence, then replay the inherited conditional coefficient square without those admissions. Full canonical Tau typing, higher-universe/full-positive-index transport, coherent root-groupoid reindexing, affine Spec limits, fpqc frame torsors and the quotient/DVR/Kummer comparisons remain open. Preserve all eight gaps, thirteen requests and both source routes.

The complete canonical suggested file still imports unavailable exact-pin Tau geometric carriers and remains uncompiled. Its existing admitted signatures are preserved; the three new lemma and example signatures are appended and checked in the separate Mathlib harness. Native proof evidence does not change the packet's unchecked implementation statuses or partial stage coverage. The complete incoming reader and both source routes follow unchanged.

---

# Rational-character coefficient square — checkpoint codex-rtOQ9t

This continuation adds ten explicit contracts to the incoming 378-node roadmap. All stages and declarations remain partial/unchecked. The ordinary coefficient tensor map is imported from pinned Mathlib. The new proof prototype is conditional on the incoming admitted Q/Z equivalence and rational coaction; it does not certify their implementations or the complete geometric suggested file.

For any commutative rings A,B and any ring homomorphism φ:A→B, the native target map Q_(φ,f):G_A⊗_A C_A(f)→G_B⊗_B C_B(φ(f)) transports the LEFT rational-character coaction. Tensor induction and the incoming E coefficient square prove compatibility with coordinate transport. Applying this square to ρ_f and its coefficient naturality gives Q_(φ,f)η_f=η_(φ(f))F_(φ,f). The coefficient change retains each q∈Q/Z, including [-1/3] and the wild [1/2] weight; only a∈A is sent through φ. No flatness or unit-section restriction is imposed. Universal coinvariance is preserved in one direction.

The source motivation is [Talpo–Vistoli, arXiv1410.1164v2](https://arxiv.org/pdf/1410.1164v2), §3.1 printed pp.14–16: diagonalizable grading and the local chart description under strict base change. These concrete ring-map identities are authored deductions, not named theorems printed there. Fresh reading covers those three pages only. The complete Yun–Zhang and independent symplectic routes remain below verbatim.

## Rational-character tensor coefficient map

`TauCeti.RootStack.factorialQZTensorCoefficientMap` — Define Q_(φ,f):G_A⊗_A C_A(f)→G_B⊗_B C_B(φ(f)) using the existing heterobasic Algebra.TensorProduct.mapRingHom on native monoid-algebra coefficient mapping and F_(φ,f). Both algebraMap compatibility witnesses are explicit.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe; φ:A→B and ψ:B→C are arbitrary ring homomorphisms. The section parameter f∈A can be zero or a nonunit. No injectivity, flatness, reducedness, nontriviality, Noetherian or invertibility hypothesis is imposed. C_A(f)=FactorialAffineColimit(f), H_A=C_A(1), G_A=MonoidAlgebra A (Multiplicative(AddCircle(1:Q))), d_i=(i+1)!, u_i are the actual included roots, F_(φ,f) is factorialCoefficientMap, U_φ is factorialUnitCoefficientMap, and T_(φ,f) is factorialTensorCoefficientMap. E_A:H_A≃G_A and η_f=(E_A⊗id)ρ_f are the incoming planned declarations. The proof prototype admits their incoming coordinate/coaction contracts. The new proof bodies are conditional deductions, not an admission-free whole implementation or a geometric base-change equivalence.

Proof: The first witness reduces coefficients to single(1,a) and uses mapRingHom_single. The second is the inherited coefficient-map constant formula. Import the heterobasic tensor construction rather than creating a new tensor algebra.

Dependencies: `mathlib:Algebra.TensorProduct.mapRingHom`, `mathlib:MonoidAlgebra.mapRingHom_single`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-map`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-constant`.

API derived from the coefficient-square and geometric-quotient consumers:

- `TauCeti.RootStack.factorialQZTensorCoefficientMap.tmul` (simp): For g∈G_A and x∈C_A(f), Q_(φ,f)(g⊗x)=mapRingHom(φ)(g)⊗F_(φ,f)(x).
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.single` (simp): For every q∈Q/Z, a∈A and x∈C_A(f), Q_(φ,f)(single(q,a)⊗x)=single(q,φ(a))⊗F_(φ,f)(x). The rational character q is unchanged.
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.constant` (simp): For a∈A, Q_(φ,f)(algebraMap_A(a))=algebraMap_B(φ(a)).
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.id` (compatibility): Q_(id_A,f)=id_(G_A⊗_A C_A(f)) as ring homomorphisms.
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.comp` (compatibility): Q_(ψ∘φ,f)=Q_(ψ,φ(f))∘Q_(φ,f), with the intermediate chart parameter φ(f) and each tensor over its own coefficient ring.
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.transport` (compatibility): For every y∈H_A⊗_A C_A(f), Q_(φ,f)((E_A⊗id)(y))=(E_B⊗id)(T_(φ,f)(y)). This is a pointwise square of native ring maps across different coefficient rings.
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.root` (simp): For every i, Q_(φ,f)(e_[1/d_i]⊗u_i^A)=e_[1/d_i]⊗u_i^B in G_B⊗_B C_B(φ(f)).

## Coefficient change on pure character tensors

`TauCeti.RootStack.factorialQZTensorCoefficientMap.tmul` — For g∈G_A and x∈C_A(f), Q_(φ,f)(g⊗x)=mapRingHom(φ)(g)⊗F_(φ,f)(x).

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe; φ:A→B and ψ:B→C are arbitrary ring homomorphisms. The section parameter f∈A can be zero or a nonunit. No injectivity, flatness, reducedness, nontriviality, Noetherian or invertibility hypothesis is imposed. C_A(f)=FactorialAffineColimit(f), H_A=C_A(1), G_A=MonoidAlgebra A (Multiplicative(AddCircle(1:Q))), d_i=(i+1)!, u_i are the actual included roots, F_(φ,f) is factorialCoefficientMap, U_φ is factorialUnitCoefficientMap, and T_(φ,f) is factorialTensorCoefficientMap. E_A:H_A≃G_A and η_f=(E_A⊗id)ρ_f are the incoming planned declarations. The proof prototype admits their incoming coordinate/coaction contracts. The new proof bodies are conditional deductions, not an admission-free whole implementation or a geometric base-change equivalence.

Proof: Specialize the existing heterobasic mapRingHom_tmul theorem with the two explicit coefficient witnesses.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/qz-coefficient-tensor-map`, `mathlib:Algebra.TensorProduct.mapRingHom_tmul`.

## Coefficient change retains each rational character

`TauCeti.RootStack.factorialQZTensorCoefficientMap.single` — For every q∈Q/Z, a∈A and x∈C_A(f), Q_(φ,f)(single(q,a)⊗x)=single(q,φ(a))⊗F_(φ,f)(x). The rational character q is unchanged.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe; φ:A→B and ψ:B→C are arbitrary ring homomorphisms. The section parameter f∈A can be zero or a nonunit. No injectivity, flatness, reducedness, nontriviality, Noetherian or invertibility hypothesis is imposed. C_A(f)=FactorialAffineColimit(f), H_A=C_A(1), G_A=MonoidAlgebra A (Multiplicative(AddCircle(1:Q))), d_i=(i+1)!, u_i are the actual included roots, F_(φ,f) is factorialCoefficientMap, U_φ is factorialUnitCoefficientMap, and T_(φ,f) is factorialTensorCoefficientMap. E_A:H_A≃G_A and η_f=(E_A⊗id)ρ_f are the incoming planned declarations. The proof prototype admits their incoming coordinate/coaction contracts. The new proof bodies are conditional deductions, not an admission-free whole implementation or a geometric base-change equivalence.

Proof: Rewrite the pure-tensor formula and apply the pinned monoid-algebra coefficient formula. No denominator or character is reduced modulo the coefficient characteristic.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/qz-coefficient-tensor-pure`, `mathlib:MonoidAlgebra.mapRingHom_single`.

## Constants in the rational-character tensor square

`TauCeti.RootStack.factorialQZTensorCoefficientMap.constant` — For a∈A, Q_(φ,f)(algebraMap_A(a))=algebraMap_B(φ(a)).

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe; φ:A→B and ψ:B→C are arbitrary ring homomorphisms. The section parameter f∈A can be zero or a nonunit. No injectivity, flatness, reducedness, nontriviality, Noetherian or invertibility hypothesis is imposed. C_A(f)=FactorialAffineColimit(f), H_A=C_A(1), G_A=MonoidAlgebra A (Multiplicative(AddCircle(1:Q))), d_i=(i+1)!, u_i are the actual included roots, F_(φ,f) is factorialCoefficientMap, U_φ is factorialUnitCoefficientMap, and T_(φ,f) is factorialTensorCoefficientMap. E_A:H_A≃G_A and η_f=(E_A⊗id)ρ_f are the incoming planned declarations. The proof prototype admits their incoming coordinate/coaction contracts. The new proof bodies are conditional deductions, not an admission-free whole implementation or a geometric base-change equivalence.

Proof: Write a tensor algebra constant as single(1,a)⊗1, apply the pure-tensor formula and native map_one.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/qz-coefficient-tensor-pure`, `mathlib:MonoidAlgebra.mapRingHom_single`, `mathlib:Algebra.TensorProduct.algebraMap_apply`.

## Identity coefficient change on rational-character tensors

`TauCeti.RootStack.factorialQZTensorCoefficientMap.id` — Q_(id_A,f)=id_(G_A⊗_A C_A(f)) as ring homomorphisms.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe; φ:A→B and ψ:B→C are arbitrary ring homomorphisms. The section parameter f∈A can be zero or a nonunit. No injectivity, flatness, reducedness, nontriviality, Noetherian or invertibility hypothesis is imposed. C_A(f)=FactorialAffineColimit(f), H_A=C_A(1), G_A=MonoidAlgebra A (Multiplicative(AddCircle(1:Q))), d_i=(i+1)!, u_i are the actual included roots, F_(φ,f) is factorialCoefficientMap, U_φ is factorialUnitCoefficientMap, and T_(φ,f) is factorialTensorCoefficientMap. E_A:H_A≃G_A and η_f=(E_A⊗id)ρ_f are the incoming planned declarations. The proof prototype admits their incoming coordinate/coaction contracts. The new proof bodies are conditional deductions, not an admission-free whole implementation or a geometric base-change equivalence.

Proof: Use ring-homomorphism extensionality and tensor induction: map_zero, map_add, and the two coefficient identity laws on pure tensors.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/qz-coefficient-tensor-pure`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-identity`, `mathlib:MonoidAlgebra.mapRingHom_id`, `mathlib:TensorProduct.induction_on`.

## Composition through three coefficient rings

`TauCeti.RootStack.factorialQZTensorCoefficientMap.comp` — Q_(ψ∘φ,f)=Q_(ψ,φ(f))∘Q_(φ,f), with the intermediate chart parameter φ(f) and each tensor over its own coefficient ring.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe; φ:A→B and ψ:B→C are arbitrary ring homomorphisms. The section parameter f∈A can be zero or a nonunit. No injectivity, flatness, reducedness, nontriviality, Noetherian or invertibility hypothesis is imposed. C_A(f)=FactorialAffineColimit(f), H_A=C_A(1), G_A=MonoidAlgebra A (Multiplicative(AddCircle(1:Q))), d_i=(i+1)!, u_i are the actual included roots, F_(φ,f) is factorialCoefficientMap, U_φ is factorialUnitCoefficientMap, and T_(φ,f) is factorialTensorCoefficientMap. E_A:H_A≃G_A and η_f=(E_A⊗id)ρ_f are the incoming planned declarations. The proof prototype admits their incoming coordinate/coaction contracts. The new proof bodies are conditional deductions, not an admission-free whole implementation or a geometric base-change equivalence.

Proof: Apply ring-homomorphism extensionality and tensor induction. The pure-tensor case is the native monoid-algebra map composition law together with the inherited chart coefficient-map composition law.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/qz-coefficient-tensor-pure`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-composition`, `mathlib:MonoidAlgebra.mapRingHom_comp`, `mathlib:TensorProduct.induction_on`.

## Heterobasic coefficient change commutes with rational coordinates

`TauCeti.RootStack.factorialQZTensorCoefficientMap.transport` — For every y∈H_A⊗_A C_A(f), Q_(φ,f)((E_A⊗id)(y))=(E_B⊗id)(T_(φ,f)(y)). This is a pointwise square of native ring maps across different coefficient rings.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe; φ:A→B and ψ:B→C are arbitrary ring homomorphisms. The section parameter f∈A can be zero or a nonunit. No injectivity, flatness, reducedness, nontriviality, Noetherian or invertibility hypothesis is imposed. C_A(f)=FactorialAffineColimit(f), H_A=C_A(1), G_A=MonoidAlgebra A (Multiplicative(AddCircle(1:Q))), d_i=(i+1)!, u_i are the actual included roots, F_(φ,f) is factorialCoefficientMap, U_φ is factorialUnitCoefficientMap, and T_(φ,f) is factorialTensorCoefficientMap. E_A:H_A≃G_A and η_f=(E_A⊗id)ρ_f are the incoming planned declarations. The proof prototype admits their incoming coordinate/coaction contracts. The new proof bodies are conditional deductions, not an admission-free whole implementation or a geometric base-change equivalence.

Proof: Induct on the actual tensor y. On h⊗x the incoming E_A coefficient square identifies mapRingHom(φ)(E_A(h)) with E_B(U_φ(h)); the second factor is the same F_(φ,f)(x). Additive and zero cases follow from ring-map laws.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/qz-coefficient-tensor-pure`, `FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-tensor-pure`, `FunctionFieldArithmeticPartII:RS.2/factorial-unit-qz-coefficient`, `mathlib:Algebra.TensorProduct.map_tmul`, `mathlib:TensorProduct.induction_on`.

## Coefficient change preserves the factorial root weight

`TauCeti.RootStack.factorialQZTensorCoefficientMap.root` — For every i, Q_(φ,f)(e_[1/d_i]⊗u_i^A)=e_[1/d_i]⊗u_i^B in G_B⊗_B C_B(φ(f)).

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe; φ:A→B and ψ:B→C are arbitrary ring homomorphisms. The section parameter f∈A can be zero or a nonunit. No injectivity, flatness, reducedness, nontriviality, Noetherian or invertibility hypothesis is imposed. C_A(f)=FactorialAffineColimit(f), H_A=C_A(1), G_A=MonoidAlgebra A (Multiplicative(AddCircle(1:Q))), d_i=(i+1)!, u_i are the actual included roots, F_(φ,f) is factorialCoefficientMap, U_φ is factorialUnitCoefficientMap, and T_(φ,f) is factorialTensorCoefficientMap. E_A:H_A≃G_A and η_f=(E_A⊗id)ρ_f are the incoming planned declarations. The proof prototype admits their incoming coordinate/coaction contracts. The new proof bodies are conditional deductions, not an admission-free whole implementation or a geometric base-change equivalence.

Proof: Apply the single-character formula with coefficient 1, map_one and the inherited included-root coefficient formula. No root or parameter is cancelled.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/qz-coefficient-tensor-single`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-root`.

## Arbitrary-section rational coaction coefficient square

`TauCeti.RootStack.factorialQZCoaction.coefficient_naturality` — Q_(φ,f)∘η_f=η_(φ(f))∘F_(φ,f) as ring homomorphisms C_A(f)→G_B⊗_B C_B(φ(f)).

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe; φ:A→B and ψ:B→C are arbitrary ring homomorphisms. The section parameter f∈A can be zero or a nonunit. No injectivity, flatness, reducedness, nontriviality, Noetherian or invertibility hypothesis is imposed. C_A(f)=FactorialAffineColimit(f), H_A=C_A(1), G_A=MonoidAlgebra A (Multiplicative(AddCircle(1:Q))), d_i=(i+1)!, u_i are the actual included roots, F_(φ,f) is factorialCoefficientMap, U_φ is factorialUnitCoefficientMap, and T_(φ,f) is factorialTensorCoefficientMap. E_A:H_A≃G_A and η_f=(E_A⊗id)ρ_f are the incoming planned declarations. The proof prototype admits their incoming coordinate/coaction contracts. The new proof bodies are conditional deductions, not an admission-free whole implementation or a geometric base-change equivalence.

Proof: Apply ring-homomorphism extensionality, rewrite both incoming η transport identities, apply the tensor coordinate square to ρ_f(x), and transport the incoming native ρ coefficient-naturality equation through E_B⊗id.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/qz-coefficient-tensor-transport`, `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-transport`, `FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-coaction-naturality`.

## Coefficient change sends universal coinvariants to coinvariants

`TauCeti.RootStack.factorialQZCoaction.map_coinvariant` — If η_f(x)=1⊗x, then η_(φ(f))(F_(φ,f)(x))=1⊗F_(φ,f)(x). This is preservation only; arbitrary coefficient maps need not reflect coinvariance.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe; φ:A→B and ψ:B→C are arbitrary ring homomorphisms. The section parameter f∈A can be zero or a nonunit. No injectivity, flatness, reducedness, nontriviality, Noetherian or invertibility hypothesis is imposed. C_A(f)=FactorialAffineColimit(f), H_A=C_A(1), G_A=MonoidAlgebra A (Multiplicative(AddCircle(1:Q))), d_i=(i+1)!, u_i are the actual included roots, F_(φ,f) is factorialCoefficientMap, U_φ is factorialUnitCoefficientMap, and T_(φ,f) is factorialTensorCoefficientMap. E_A:H_A≃G_A and η_f=(E_A⊗id)ρ_f are the incoming planned declarations. The proof prototype admits their incoming coordinate/coaction contracts. The new proof bodies are conditional deductions, not an admission-free whole implementation or a geometric base-change equivalence.

Proof: Evaluate the ring-map naturality equality at x, substitute the incoming universal coinvariance equation and use the pure-tensor formula with map_one. There is no pointwise invariance or inverse implication.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/qz-coaction-coefficient-naturality`, `FunctionFieldArithmeticPartII:RS.2/qz-coefficient-tensor-pure`.

## Regression examples and limits

- `TauCeti.RootStack.factorialQZTensorCoefficientMap.test_negative_weight` (compatibility): For ℤ→F₂ and f=0, a pure tensor with character [-1/3] and coefficient 1 retains exactly [-1/3] in the FIRST tensor factor, while the second factor uses F_(φ,0).
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.test_nonflat_kills_coefficient` (non-example): For ℤ→F₂, f=0, every q∈Q/Z and every x, single(q,2)⊗x maps to zero, and the actual tensor coefficient map is NOT injective. The nonzero source constant2 is separated from zero by the native character counit and chart evaluation at the coherent zero roots.
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.test_wild_zero_section` (computation): For ℤ→F₂, f=0 and i=1, φ(0)=0 and the actual tensor e_[1/2]⊗u_1 maps to e_[1/2]⊗u_1 in C_B(φ(0)). The rational character remains [1/2]; the section equality is explicit rather than hidden in a dependent cast.
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.test_zero_ring` (degenerate): For ℤ→Z/1 and f=0, every element in the actual tensor source maps to zero by the codomain subsingleton, with no nontriviality assumption.
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.test_identity` (invariant): For arbitrary A,f and y, the identity coefficient map fixes the actual element y in G_A⊗_A C_A(f).
- `TauCeti.RootStack.factorialQZTensorCoefficientMap.test_three_rings` (compatibility): For arbitrary φ:A→B, ψ:B→C, f and y, direct coefficient change equals successive coefficient changes, using the actual intermediate parameter φ(f).
- `TauCeti.RootStack.factorialQZCoaction.test_nonunit_coefficient_square` (compatibility): For ℤ→F₂ and nonunit section f=2, φ(2)=0 and applying Q_(φ,2) after η_2 equals η_(φ(2)) after F_(φ,2) on EVERY x∈C_ℤ(2), explicitly retaining the wild zero-section equality and dependent target.
- `TauCeti.RootStack.factorialQZCoaction.test_unity_coefficient_square` (compatibility): At f=1 the coaction square holds with the actual target C_B(φ(1)) and inherited F_(φ,1); no implicit replacement by the separately defined U_φ is used.
- `TauCeti.RootStack.factorialQZCoaction.test_coinvariant_constants` (computation): For all φ,f,a the image F_(φ,f)(a) satisfies the universal coaction equation 1⊗F_(φ,f)(a), by preservation of the inherited constant coinvariance equation.

The nine examples use native tensors and the inherited colimits. Reduction modulo2 kills coefficient2, so these tests do not assert injectivity or reflection. Exact canonical signatures are stored in the suggested file; recoverable conditional proof bodies, checked signature parity and execution receipts are in the handoff. Implement the admitted incoming coordinate/coaction contracts before treating any conditional body as an implementation certificate. Higher-universe and full positive-index transport, coherent root-object groupoids, Spec limits, fpqc frame torsors and quotient equivalence remain open. No invariant algebra is computed here.

Consumed coaction API `TauCeti.RootStack.factorialQZCoaction.coefficient_naturality`: Q_(φ,f)∘η_f=η_(φ(f))∘F_(φ,f) as ring homomorphisms C_A(f)→G_B⊗_B C_B(φ(f)).

Consumed coaction API `TauCeti.RootStack.factorialQZCoaction.map_coinvariant`: If η_f(x)=1⊗x, then η_(φ(f))(F_(φ,f)(x))=1⊗F_(φ,f)(x). This is preservation only; arbitrary coefficient maps need not reflect coinvariance.

# Rational-character coaction on arbitrary-section charts

Write d_i=(i+1)!, C=C_A(f), H=H_A=C_A(1), G=G_A=A[Q/Z] and E=E_A:H≃G. Here A is any commutative ring and f is any element, including zero and nonunits. The universe is the inherited same-universe colimit's universe. The roots u_i and h_i are the actual AdjoinRoot elements inserted into the existing colimits. The character [q] is the class of q in AddCircle(1:Q), represented multiplicatively in the native MonoidAlgebra. All tensor products are over A. The coaction is LEFT: its target is G⊗C, never C⊗G.

The source motivation is the rank-one grading action in [Talpo–Vistoli, arXiv1410.1164v2, printed pp.14–16](https://arxiv.org/pdf/1410.1164v2). The following coordinate calculations are authored deductions from the inherited coaction and coordinate equivalence, not additional named results of that paper. The pinned tensor maps, tensor congr and associator are imported; no general tensor/Hopf or stack theory is duplicated.

## Rational character coaction on an arbitrary root chart

`TauCeti.RootStack.factorialQZCoaction` — Define η_f:C_A(f)→G_A⊗_A C_A(f) as the native tensor map E_A⊗id_C composed with ρ_f. Its parameter f is unchanged, and the characters are in the first tensor factor.

Import the incoming algebra equivalence and LEFT coaction, take the existing native tensor map and compose A-algebra homomorphisms. No generic Hopf, tensor or stack carrier is rebuilt.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction`, `FunctionFieldArithmeticPartII:RS.2/factorial-unit-qz-equivalence`, `mathlib:Algebra.TensorProduct.map`.

## Specified coordinate transport

`TauCeti.RootStack.factorialQZCoaction.transport` — η_f=(E_A⊗id_C)∘ρ_f as native A-algebra maps C_A(f)→G_A⊗_A C_A(f).

Unfold the specified composite; neither the tensor-factor order nor the section parameter changes.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction`, `mathlib:Algebra.TensorProduct.map`.

## Rational character weight of a root

`TauCeti.RootStack.factorialQZCoaction.root` — For each i, η_f(u_i)=e_[1/d_i]⊗u_i.

Evaluate the inherited ρ_f on u_i, apply the native tensor map formula, and use E_A(h_i)=e_[1/d_i].

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-transport`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-unit-qz-equivalence-root`, `mathlib:Algebra.TensorProduct.map_tmul`.

## Rational coaction on coefficients

`TauCeti.RootStack.factorialQZCoaction.constant` — For a∈A, η_f(a)=1⊗a with a included in the actual chart.

Use ρ_f(a)=1⊗a, the native pure-tensor formula, and the unit law for E_A.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-transport`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-constant`, `mathlib:Algebra.TensorProduct.map_tmul`.

## Root powers retain character multiplicities

`TauCeti.RootStack.factorialQZCoaction.power` — For i,k∈N, η_f(u_i^k)=e_[k/d_i]⊗u_i^k. In particular at k=d_i this is 1⊗f; neither k nor f is cancelled.

Apply the algebra-map power law, pure-tensor power and single power formulas. The additive character k·[1/d_i] equals [k/d_i]. At k=d_i the character is zero and the included-root relation is u_i^d_i=f.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-root`, `mathlib:Algebra.TensorProduct.tmul_pow`, `mathlib:MonoidAlgebra.single_pow`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-power`.

## Native counitality in rational coordinates

`TauCeti.RootStack.factorialQZCoaction.counit` — For the native counit ε_G, lid∘(ε_G⊗id_C)∘η_f=id_C as A-algebra maps.

Compose tensor maps using ε_G∘E_A=ε_H from the incoming coordinate counit square. After the unchanged native left unitor the resulting composite is the incoming coaction counit identity.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-transport`, `FunctionFieldArithmeticPartII:RS.2/factorial-unit-qz-counit`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-counit`, `mathlib:Bialgebra.counitAlgHom`, `mathlib:Algebra.TensorProduct.map_comp`, `mathlib:Algebra.TensorProduct.lid`.

## Native coassociativity in rational coordinates

`TauCeti.RootStack.factorialQZCoaction.coassoc` — For the native Δ_G and associator α, α∘(Δ_G⊗id_C)∘η_f=(id_G⊗η_f)∘η_f into G_A⊗_A(G_A⊗_A C_A(f)).

Postcompose the incoming coassociativity identity with E_A⊗(E_A⊗id_C). Its compatibility with α is checked on (h⊗h')⊗x: both sides give E_A(h)⊗(E_A(h')⊗x). Use (E_A⊗E_A)Δ_H=Δ_GE_A and native tensor map composition to identify the two resulting composites. C_A(f) receives a coaction, not a new Hopf algebra.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-transport`, `FunctionFieldArithmeticPartII:RS.2/factorial-unit-qz-comul`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-coassoc`, `mathlib:Bialgebra.comulAlgHom`, `mathlib:Algebra.TensorProduct.map_comp`, `mathlib:Algebra.TensorProduct.map_tmul`, `mathlib:Algebra.TensorProduct.assoc`.

## Faithful rational-character coaction

`TauCeti.RootStack.factorialQZCoaction.injective` — η_f is injective for every A and f.

The displayed counit composite is an actual left inverse. Applying it to η_f(x)=η_f(y) gives x=y, also for the zero ring.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-counit`.

## Coordinate change reflects universal coinvariance

`TauCeti.RootStack.factorialQZCoaction.coinvariant_iff` — For x∈C_A(f), η_f(x)=1⊗x if and only if ρ_f(x)=1⊗x. These are universal coaction equations, not invariance under A-valued points.

The existing native tensor congr(E_A,refl_C) is an algebra equivalence H_A⊗C_A(f)≃G_A⊗C_A(f) whose forward function is E_A⊗id_C and sends 1⊗x to 1⊗x. Preservation follows by applying its function; reflection follows from its injectivity. No flatness or reducedness of the chart is needed, and this does not identify all coinvariants with A.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-transport`, `FunctionFieldArithmeticPartII:RS.2/factorial-unit-qz-equivalence`, `mathlib:Algebra.TensorProduct.congr`, `mathlib:Algebra.TensorProduct.congr_apply`, `mathlib:Algebra.TensorProduct.map_tmul`.

## Unity chart agrees with native comultiplication

`TauCeti.RootStack.factorialQZCoaction.unity` — For x∈H_A, (id_G⊗E_A)(η_1(x))=Δ_G(E_A(x)). The second factor of η_1 remains H_A until this second coordinate change.

Native tensor map composition identifies (id_G⊗E_A)(E_A⊗id_H) with E_A⊗E_A, and the incoming comultiplication square gives the result.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/qz-chart-coaction-transport`, `FunctionFieldArithmeticPartII:RS.2/factorial-unit-qz-comul`, `mathlib:Algebra.TensorProduct.map_comp`, `mathlib:Bialgebra.comulAlgHom`.

## Usable interface and discriminating tests

`TauCeti.RootStack.factorialQZCoaction.transport` (compatibility): η_f=(E_A⊗id_C)∘ρ_f as native A-algebra maps C_A(f)→G_A⊗_A C_A(f).

`TauCeti.RootStack.factorialQZCoaction.root` (simp): For each i, η_f(u_i)=e_[1/d_i]⊗u_i.

`TauCeti.RootStack.factorialQZCoaction.constant` (simp): For a∈A, η_f(a)=1⊗a with a included in the actual chart.

`TauCeti.RootStack.factorialQZCoaction.power` (simp): For i,k∈N, η_f(u_i^k)=e_[k/d_i]⊗u_i^k. In particular at k=d_i this is 1⊗f; neither k nor f is cancelled.

`TauCeti.RootStack.factorialQZCoaction.counit` (compatibility): For the native counit ε_G, lid∘(ε_G⊗id_C)∘η_f=id_C as A-algebra maps.

`TauCeti.RootStack.factorialQZCoaction.coassoc` (compatibility): For the native Δ_G and associator α, α∘(Δ_G⊗id_C)∘η_f=(id_G⊗η_f)∘η_f into G_A⊗_A(G_A⊗_A C_A(f)).

`TauCeti.RootStack.factorialQZCoaction.injective` (compatibility): η_f is injective for every A and f.

`TauCeti.RootStack.factorialQZCoaction.coinvariant_iff` (compatibility): For x∈C_A(f), η_f(x)=1⊗x if and only if ρ_f(x)=1⊗x. These are universal coaction equations, not invariance under A-valued points.

`TauCeti.RootStack.factorialQZCoaction.unity` (compatibility): For x∈H_A, (id_G⊗E_A)(η_1(x))=Δ_G(E_A(x)). The second factor of η_1 remains H_A until this second coordinate change.

`TauCeti.RootStack.factorialQZCoaction.test_level_zero` (degenerate): At i=0, d_0=1 and η_f(u_0)=1⊗f, with f included in C_A(f).

`TauCeti.RootStack.factorialQZCoaction.test_sixth_root` (computation): For A=Z/4,f=2,i=2,k=2, η_f(u_2²)=e_[1/3]⊗u_2²; the character numerator must retain k=2.

`TauCeti.RootStack.factorialQZCoaction.test_native_transport` (compatibility): For every x∈C_A(f), η_f(x) equals the native map(E_A,id_C) applied to the incoming ρ_f(x).

`TauCeti.RootStack.factorialQZCoaction.test_wild_zero_section` (non-example): For A=F_2,f=0,u=u_1, η_0(u)≠1⊗u although μ_2(F_2) acts trivially on this finite root. The universal weight is [1/2]≠0 and u≠0.

`TauCeti.RootStack.factorialQZCoaction.test_unity` (compatibility): For f=1, applying id_G⊗E_A to η_1 equals the native Δ_G after E_A, with BOTH tensor factors transported.

The wild test uses the monic finite chart F₂[t]/(t²), where the coefficient of t is nonzero. Its included root remains nonzero because the chart transition and insertion maps are injective. In the native free character basis, the coefficient at [1/2] of η₀(u)−1⊗u is u, while the coefficient at zero is −u; these indices are distinct even in characteristic two. Thus the tensor is nonzero. In contrast, μ₂(F₂) consists only of 1, so the finite root's field-point action is trivial. Native free-module tensor coefficient evaluation, not reduced-group points or division by two, is the acceptance route.

## Scope and proof boundary

These ten items add one construction with nine promoted API lemmas and five tests. Every incoming declaration remains present. Only the existing infinite quotient consumer acquires their explicit dependencies. There is no new planet: RS.2 already has its six named landmarks. The reserved general root-stack node still includes arbitrary schemes/stacks, nontrivial lines and sections, relative closed-subscheme roots and full nonreduced fibres. The native counit supplies injectivity; tensor congr reflects universal coinvariance without flatness. Neither result proves that the invariant algebra equals A. The unity compatibility transports BOTH tensor factors and uses the inherited actual comultiplication square.

Construct the arbitrary-section coefficient square from the existing heterobasic tensor map and the incoming E_A coefficient square. Establish higher-universe and full positive-index coherent groupoid transport, affine Spec limits, fpqc frame torsors and the quotient comparison. All eight gaps and thirteen supplier requests remain open; all ten stages stay partial, and all implementation statuses stay unchecked. The two accepted source routes, 33 source-coverage entries and the independent symplectic continuation are unchanged. The ten new declaration signatures and five example headers elaborate in an authenticated Mathlib-only native fragment with expected admitted-proof warnings. The complete canonical file remains uncompiled; exact finite algebra calculations are regression checks, not Lean proofs or a new whole-source coverage receipt.

---

# Infinite unity-root coordinates in the rational character algebra

This continuation specifies the canonical diagonalizable coordinate input to RS.2. It starts from the inherited finite equivalence between the actual unity-root chart and the actual finite cyclic group algebra, and the already constructed factorial root colimit. It gives the normalized characters into the native rational circle, compatible finite algebra maps, the unity-root colimit equivalence with the native group algebra, and separate comultiplication, counit, antipode and coefficient comparisons. This is a mathematical plan with admitted signatures. Its new signatures have not been elaborated. Every implementation status remains unchecked and all ten stages remain partial.

The incoming 340 declaration contracts, the complete root-stack key definition, the Yun–Zhang ramified geometric class-field route, and the independent symplectic route remain in force. Only the infinite affine-quotient consumer acquires five dependencies and one explicit proof step. The original eight gaps and thirteen supplier requests are retained. The preceding reader follows this new section without alteration.

## Objects and conventions

Let A be any commutative ring. Put E_n=A[T]/(Tⁿ−1) for n>0, with actual quotient root t_n; this is the inherited unity-parameter AffineRing, not the arbitrary-section chart. Its inherited finite cyclic equivalence carries t_n to e_[1] in A[Z/n]. If n divides N, the inherited chart transition sends t_n to t_N^(N/n); on finite cyclic coordinates it sends e_[k] to e_[(N/n)val(k)]. In particular the 2-to-6 transition sends e_[1] to e_[3]. The transition is determined by root powers; it is never replaced by an unscaled residue map.

The character group Q/Z means exactly Mathlib's additive circle of period 1 over the rationals. Its carrier is the quotient of the additive group of Q by the integer multiples of 1. No fresh rational quotient, finite cyclic group or group-algebra carrier is introduced. The target A[Q/Z] is the native monoid algebra on the multiplicative form of this additive group. Write a e_u for its single basis element with label u and coefficient a. Its native Hopf structure has Δ(e_u)=e_u⊗e_u, ε(a e_u)=a and S(a e_u)=a e_(−u). Arbitrary coefficients are allowed, including zero rings and characteristic dividing n.

The source U_A is the existing factorial affine colimit at parameter 1. At index i its finite exponent is d_i=(i+1)!, and its included root is u_i. The inherited positive-divisibility extension ι_n into U_A is specified by passing from n to its recorded factorial multiple; its at-level and transition lemmas make it independent of a different eligible multiple. All declarations here use one fixed coefficient universe. The higher-universe and geometric transports remain explicit obligations.

## Normalize the finite character

The additive map c_n:Z/n→Q/Z is fixed by c_n([k])=[k/n] for integer k. Its construction uses the pinned ZMod integer-lift equivalence: the integer homomorphism k↦[k/n] kills n because [1]=0. The integer representative computation is an API lemma, and includes negative k. Specializing k=1 fixes orientation. Choosing an unspecified finite cyclic isomorphism would leave a generator ambiguity and is insufficient for the inherited root coordinates.

Injectivity is separate from construction. The class [k/n] vanishes precisely when k/n is an integer, hence when n divides k in Z. The pinned lift-injectivity and integer-cast divisibility statements give the result. No coefficient ring is involved in this group-theoretic argument. Compatibility with divisibility is another separate statement: the exact quotient N/n gives ((N/n)val(k))/N=val(k)/n, so c_N([(N/n)val(k)])=c_n(k). Positive exponents and divisibility are necessary for this identity.

Exhaustion imports the existing Tau Ceti rational-circle torsion theory. Its positive-period theorem puts every u in n-torsion for some positive n. Its normalized generator theorem writes that u as an integer multiple of [1/n]. The character's integer API then exhibits u=c_n(k). This adapter is the statement the finite root coordinate maps consume; the general finite subgroup classification, cardinality and cyclicity of Q/Z are not replanned. A direct rational numerator/denominator computation provides the concrete inverse formula described below.

The character tests are c_1(1)=0, c_3(1) different from [2/3], and c_6(3)=[1/2]. The second rejects reversed generator orientation; the third rejects an incorrect unscaled transition. These tests concern actual quotient classes, rather than chosen representatives in Q.

## Finite group-algebra and chart maps

Use the native domain-map algebra homomorphism to form j_n:A[Z/n]→A[Q/Z]. Its single API is j_n(a e_k)=a e_(c_n(k)); coefficients are unchanged. The native domain-map injectivity theorem applies to the injective label map without assuming that A is nontrivial. Its transition API is the equality of basis images at labels k and (N/n)val(k). These three API facts are individual nodes, and are used by the chart map and the infinite comparison.

Define F_n:E_n→A[Q/Z] by composing j_n with the inherited finite cyclic equivalence. Its root is e_[1/n]. Its injectivity is the composition of the inherited equivalence with j_n's injectivity. The transition statement is an equality of actual algebra homomorphisms: F_N after the inherited n-to-N chart map equals F_n. To prove it, pass through the inherited finite equivalence, apply its divisibility formula on each basis element, and use j_n's transition API. Linearity extends the equality to all elements. This proof preserves the actual chart map, rather than inferring it from equality on field-valued points.

The group-algebra tests evaluate the n=1 constant, the n=3 negative label and the wild n=2 basis difference over Z/2. In the last test v=j_2(e_[1]−1) is nonzero with v²=0. Distinct Q/Z labels and native coefficient equality show nonzero, while characteristic two and the order-two label give the square-zero identity. A definition that uses the reduced fibre or only geometric points fails this test. The finite chart tests evaluate t_1 and t_3 and retain injectivity over the zero ring Z/1. None of these assertions assumes that n is invertible in A.

## Construct and identify the actual unity-root colimit map

Before applying the inherited universal root lift, record two lemmas: e_[1/d_i] has d_i-th power 1, and for i≤j the d_j/d_i power of e_[1/d_j] is e_[1/d_i]. They follow by applying the finite chart map to the inherited root relation and finite transition square. Thus the native target has a coherent factorial root family, and the inherited universal property defines F:U_A→A[Q/Z]. Its root API is F(u_i)=e_[1/d_i].

The finite-leg API strengthens this to every positive exponent n: F(ι_n(x))=F_n(x). First compare the two maps on a factorial chart by their values on its root; constants agree because they are algebra homomorphisms. For a general n, the specified factorial extension and finite transition square yield the formula. The inherited at-level independence removes the choice of factorial multiple. This statement is needed both for injectivity and surjectivity; those proofs are not folded into the construction.

For injectivity, suppose F(x)=F(y). Represent x−y at a single finite factorial level using the inherited colimit exists-level theorem. The leg API says that this representative has zero image under the corresponding F_n. Finite injectivity makes the representative zero and therefore x−y=0. This proof avoids introducing an unlisted common-stage lemma for two separate representatives and uses no faithful-flatness hypothesis beyond the incoming tower machinery already providing its source algebra.

For surjectivity, first take a single a e_u. Choose n,k with c_n(k)=u using the normalized exhaustion API. Pull a e_k back through the inherited finite cyclic equivalence and include it using ι_n. The finite-leg and single APIs give a e_u as the image. Native group-algebra linear induction now covers zero and arbitrary finite sums. Each summand can use its own finite level, because their preimages can be added directly in U_A. Infinite support never arises and no geometric-point criterion is used.

Promote the bijective F to the actual native algebra equivalence E:U_A≃A[Q/Z]. Its forward root API is inherited from F. Its inverse single API takes q∈Q with positive natural denominator den(q): the preimage of a e_[q] is the n=den(q) extension of the inverse finite cyclic image of a e_[num(q) mod n]. Map this expression forward and use q=num(q)/den(q); bijectivity proves that it is the inverse. Negative numerators are cast as integers into ZMod n. If two rational representatives give the same circle class, injectivity ensures that their displayed inverse expressions agree.

The infinite-map tests evaluate index zero to 1, index two to e_[1/6], and coefficient 2 on the order-two root over Z/4. The equivalence tests compute the inverse of e_[−1/3] as the extension of t_3², preserve a wild nonzero square-zero element together with its comultiplication, and check the coefficient square for Z→Z/2. These distinguish the algebraic coordinates from a reduced or field-point construction, and do not add flatness assumptions.

## Infinite Hopf and coefficient squares

Comultiplication is a separate equality: (E⊗E)(Δ_U(x))=Δ(E(x)). Use the inherited factorial coaction at parameter 1, not an inferred local instance with unspecified structure. On u_i it gives u_i⊗u_i; applying E⊗E gives the tensor square of e_[1/d_i], which is exactly native group-algebra comultiplication. The maps are A-algebra homomorphisms to the native tensor product. The inherited root-extensionality theorem proves their equality on every x.

The counit square is ε(E(x))=ε_U(x). On every root both sides are 1; constants agree, so the same extensionality theorem applies. The native counit on a e_u is a, as supplied by its pinned single formula. This keeps coefficient and label augmentation separate and specifies the actual counit in the source.

The antipode square is S(E(x))=E(S_U(x)). The inherited factorial antipode sends the universal root unit to its inverse. The algebra equivalence preserves those unit inverses. Native group-algebra antipode sends e_[1/d_i] to e_[−1/d_i]. For extensionality, use the algebra map induced by inversion on the abelian label group; native single induction identifies that algebra map with the native linear antipode. The source antipode is the inherited explicit factorialAntipode. This proof route requires both the pinned domain-map and single-antipode declarations; no assumption that an arbitrary Hopf antipode is an algebra map is made.

For a ring homomorphism φ:A→B, the native group-algebra coefficient map after E_A equals E_B after the inherited unity-specific factorialUnitCoefficientMap. Restrict scalars in the target through φ. Constants agree by the inherited constant API and native single-coefficient formula. Every factorial root is sent to e_[1/d_i] with coefficient φ(1)=1, so root extensionality gives the square. The inherited unity-specific map has codomain U_B directly, so this statement does not silently identify a chart at φ(1) with a chart at 1. Its root and constant APIs are precisely the imported dependencies; the inherited ring-homomorphism extensionality lemma packages the scalar restriction. This applies to noninjective and nonflat φ. It remains a fixed-universe statement; it is not the higher-universe or tensor-base-change comparison.

## Declaration catalogue and acceptance

Each entry below is one planned declaration. The dependencies in the packet specify the exact source of the facts used above. Every consumed API is promoted to its own lemma node. The five construction records have at least three API statements, three concrete tests and three recorded uses. The central equivalence is the sixth and final RS.2 planet, named “Infinite unity-root coordinates”.

### Normalized finite root character in Q/Z

`TauCeti.RootStack.affineQZCharacter` — For n>0 define the additive homomorphism c_n:Z/n→Q/Z by c_n([k])=[k/n] for every integer k. This is the unique lift of the integer map k↦[k/n].

The integer map preserves addition. At n its value is [1]=0; descend it through ZMod.lift. This specifies its orientation, rather than merely choosing an isomorphism with an abstract cyclic subgroup.

API:

- `TauCeti.RootStack.affineQZCharacter.intCast`: For k∈Z, c_n([k])=[k/n], including negative k.
- `TauCeti.RootStack.affineQZCharacter.one`: The chosen character sends [1] to [1/n].
- `TauCeti.RootStack.affineQZCharacter.injective`: The homomorphism c_n is injective for every n>0.
- `TauCeti.RootStack.affineQZCharacter.divisibility`: If n divides N, then c_N([(N/n) val(k)])=c_n(k) for k∈Z/n. Thus c_N([N/n])=[1/n].
- `TauCeti.RootStack.affineQZCharacter.exhaustive`: For every u∈Q/Z there are n>0 and k∈Z/n with c_n(k)=u.

Unit tests:

- `TauCeti.RootStack.affineQZCharacter.test_one`: At n=1 the character of [1] is zero.
- `TauCeti.RootStack.affineQZCharacter.test_orientation`: At n=3, c_3(1) differs from [2/3]; reversing the chosen generator fails.
- `TauCeti.RootStack.affineQZCharacter.test_two_six`: The 2-to-6 transition sends [1] to [3], whose image is [1/2].

### Finite character on integer representatives

`TauCeti.RootStack.affineQZCharacter.intCast` — For k∈Z, c_n([k])=[k/n], including negative k.

Apply the integer-lift computation. Negative representatives are integers before reduction; do not replace them by unreduced natural values.

### Finite root character orientation

`TauCeti.RootStack.affineQZCharacter.one` — The chosen character sends [1] to [1/n].

Specialize the integer representative to one.

### Finite root characters embed

`TauCeti.RootStack.affineQZCharacter.injective` — The homomorphism c_n is injective for every n>0.

The kernel consists of k with k/n integral, exactly the integers divisible by n. Use ZMod.lift_injective and the integer divisibility criterion. This proof concerns the character group and has no coefficient-ring assumption.

### Divisibility preserves the normalized character

`TauCeti.RootStack.affineQZCharacter.divisibility` — If n divides N, then c_N([(N/n) val(k)])=c_n(k) for k∈Z/n. Thus c_N([N/n])=[1/n].

Choose the natural representative val(k). The rational identity ((N/n)val(k))/N=val(k)/n uses n>0,N>0 and exact divisibility. Integer-lift computations give equality in Q/Z. This is the scaled transition, not the map [k]↦[k].

### Every rational character occurs at a finite level

`TauCeti.RootStack.affineQZCharacter.exhaustive` — For every u∈Q/Z there are n>0 and k∈Z/n with c_n(k)=u.

Import Tau Ceti rational torsion exhaustion to choose n. Import its normalized torsion generator lemma to write u as an integer multiple of [1/n]. The integer-lift formula supplies k. No new generic finite-subgroup or torsion theorem is planned.

### Finite group-algebra character map

`TauCeti.RootStack.finiteQZAlgMap` — Define j_n:A[Z/n]→A[Q/Z] as the actual mapDomainAlgHom induced by the multiplicative form of c_n.

Pass the additive character to Multiplicative and use the existing group-algebra domain map. Import the generic functor rather than defining a new group-algebra carrier.

API:

- `TauCeti.RootStack.finiteQZAlgMap.single`: For a∈A,k∈Z/n, j_n(a e_k)=a e_{c_n(k)}.
- `TauCeti.RootStack.finiteQZAlgMap.injective`: j_n is injective over every commutative ring, including the zero ring.
- `TauCeti.RootStack.finiteQZAlgMap.transition`: For n dividing N and a∈A, j_N(a e_{[(N/n)val(k)]})=j_n(a e_k).

Unit tests:

- `TauCeti.RootStack.finiteQZAlgMap.test_constant`: The n=1 basis element [0] with coefficient a maps to the constant a.
- `TauCeti.RootStack.finiteQZAlgMap.test_negative`: At n=3, the basis label −1 maps to [−1/3], retaining integer orientation.
- `TauCeti.RootStack.finiteQZAlgMap.test_wild`: Over Z/2, the image of e_[1]−1 at n=2 is nonzero with square zero; the character algebra is not replaced by its reduced fibre.

### Character map on a group-algebra basis

`TauCeti.RootStack.finiteQZAlgMap.single` — For a∈A,k∈Z/n, j_n(a e_k)=a e_{c_n(k)}.

Use the native domain-map single formula. Coefficients are unchanged.

### Finite group-algebra character maps are injective

`TauCeti.RootStack.finiteQZAlgMap.injective` — j_n is injective over every commutative ring, including the zero ring.

Apply the native domain-map injectivity theorem to c_n. Its coefficient-level proof has no nontriviality hypothesis.

### Finite basis transitions commute with the character map

`TauCeti.RootStack.finiteQZAlgMap.transition` — For n dividing N and a∈A, j_N(a e_{[(N/n)val(k)]})=j_n(a e_k).

Rewrite the two images on singles and apply character divisibility. This is precisely the inherited finite root-transition formula.

### Finite unity-root chart character map

`TauCeti.RootStack.finiteRootQZMap` — Define F_n:E_n(1)→A[Q/Z] as j_n composed with the inherited equivalence E_n(1)≃A[Z/n].

Compose actual A-algebra maps. This is restricted to the unity-parameter chart; arbitrary-f charts still have their inherited coaction.

API:

- `TauCeti.RootStack.finiteRootQZMap.root`: F_n(t_n)=e_[1/n].
- `TauCeti.RootStack.finiteRootQZMap.injective`: F_n is injective for every n>0 and every A.
- `TauCeti.RootStack.finiteRootQZMap.transition`: For n dividing N, F_N composed with the actual affineDivisibility(1,n,N) equals F_n as A-algebra homomorphisms.

Unit tests:

- `TauCeti.RootStack.finiteRootQZMap.test_one`: The unity root at n=1 maps to 1.
- `TauCeti.RootStack.finiteRootQZMap.test_three`: At n=3 the root maps to the basis label [1/3].
- `TauCeti.RootStack.finiteRootQZMap.test_zero_ring`: The finite root map remains injective over Z/1.

### Finite unity root maps to the normalized rational character

`TauCeti.RootStack.finiteRootQZMap.root` — F_n(t_n)=e_[1/n].

Use the inherited root formula, then the group-algebra single formula and character orientation.

### Finite unity-root charts embed in the rational character algebra

`TauCeti.RootStack.finiteRootQZMap.injective` — F_n is injective for every n>0 and every A.

Compose finite character-map injectivity with the inherited actual algebra equivalence. No argument by geometric field points is used.

### Root chart transitions commute with rational characters

`TauCeti.RootStack.finiteRootQZMap.transition` — For n dividing N, F_N composed with the actual affineDivisibility(1,n,N) equals F_n as A-algebra homomorphisms.

Transport to finite group-algebra coordinates. The inherited divisibility theorem sends e_k to e_{[(N/n)val(k)]}; apply the character-transition lemma on each basis element and linearity. Both inverse laws belong to the inherited finite equivalence.

### Factorial rational characters satisfy the root relation

`TauCeti.RootStack.factorialQZRoot_power` — For d_i=(i+1)!, the basis element e_[1/d_i] in A[Q/Z] has d_i-th power 1.

Map the finite unity-root relation through F_{d_i}. Equivalently use d_i[1/d_i]=[1]=0 and native basis multiplication.

### Factorial rational character roots form a coherent family

`TauCeti.RootStack.factorialQZRoot_transition` — If i≤j, then e_[1/d_j] raised to d_j/d_i equals e_[1/d_i].

Evaluate the finite root-transition square on t_{d_i}, using exact factorial divisibility and the inherited root transition.

### Infinite unity-root character map

`TauCeti.RootStack.factorialUnitQZMap` — Define F:U_A→A[Q/Z] by the inherited factorialAffineRootLift with roots e_[1/d_i], using the preceding power and transition lemmas.

Use the existing universal root lift. The target is a native commutative A-algebra in the same coefficient universe; no new abstract colimit or conclusion-valued certificate is introduced.

API:

- `TauCeti.RootStack.factorialUnitQZMap.root`: F(u_i)=e_[1/d_i], where u_i is the actual root included at factorial level i.
- `TauCeti.RootStack.factorialUnitQZMap.leg`: For a positive divisibility index n and x∈E_n(1), F(ι_n(x))=F_n(x), where ι_n is the inherited factorialAffineExtension.
- `TauCeti.RootStack.factorialUnitQZMap.injective`: F:U_A→A[Q/Z] is injective for arbitrary A.
- `TauCeti.RootStack.factorialUnitQZMap.surjective`: F:U_A→A[Q/Z] is surjective for arbitrary A.

Unit tests:

- `TauCeti.RootStack.factorialUnitQZMap.test_level_zero`: At i=0,d_i=1, the included root maps to 1.
- `TauCeti.RootStack.factorialUnitQZMap.test_level_two`: At i=2,d_i=6, the included root maps to e_[1/6].
- `TauCeti.RootStack.factorialUnitQZMap.test_torsion_coefficients`: Over Z/4 the coefficient 2 times the level-one root maps to 2 e_[1/2].

### Infinite character map on a factorial root

`TauCeti.RootStack.factorialUnitQZMap.root` — F(u_i)=e_[1/d_i], where u_i is the actual root included at factorial level i.

Apply the inherited lift-root computation.

### Every positive finite chart has its specified character leg

`TauCeti.RootStack.factorialUnitQZMap.leg` — For a positive divisibility index n and x∈E_n(1), F(ι_n(x))=F_n(x), where ι_n is the inherited factorialAffineExtension.

First compare the two A-algebra maps at a factorial level by root extensionality. Extend an arbitrary positive n to its specified factorial multiple and apply the finite transition square. The existing at-level independence removes the choice of multiple.

### Infinite unity-root character map is injective

`TauCeti.RootStack.factorialUnitQZMap.injective` — F:U_A→A[Q/Z] is injective for arbitrary A.

For F(x)=F(y), represent x−y at one factorial level using the inherited exists-level result. Its finite image is zero by the leg theorem. Finite injectivity makes the representative zero, hence x−y=0. This avoids an unproved common-stage assertion for two representatives.

### Every group-algebra element is a unity-root colimit image

`TauCeti.RootStack.factorialUnitQZMap.surjective` — F:U_A→A[Q/Z] is surjective for arbitrary A.

For a basis element a e_u, choose n,k with c_n(k)=u using imported torsion exhaustion through the normalized character adapter. Pull a e_k back through the finite cyclic equivalence and include that chart by ι_n. The leg and single formulas give the desired preimage. Native group-algebra linear induction extends this to zero and sums; each summand may use its own finite level. No infinite support or geometric-point assertion occurs.

### Infinite unity-root coordinates

`TauCeti.RootStack.factorialUnitQZEquiv` — Define the actual A-algebra equivalence E:U_A≃A[Q/Z] by promoting F with its injectivity and surjectivity proofs. Its forward function is F.

Apply the native promotion of a bijective A-algebra homomorphism; do not package inverse laws as assumptions of a new comparison record.

API:

- `TauCeti.RootStack.factorialUnitQZEquiv.root`: E(u_i)=e_[1/d_i].
- `TauCeti.RootStack.factorialUnitQZEquiv.inverse_single_den`: For q∈Q and a∈A, E⁻¹(a e_[q]) is ι_{den(q)} applied to the inverse finite cyclic image of a e_[num(q) mod den(q)]. This includes negative q and q=0.
- `TauCeti.RootStack.factorialUnitQZEquiv.comul`: For x∈U_A, (E⊗E)(Δ_U(x))=Δ_{A[Q/Z]}(E(x)), using the inherited chosen factorial coaction at parameter 1 and the native group-algebra comultiplication.
- `TauCeti.RootStack.factorialUnitQZEquiv.counit`: For x∈U_A, ε_{A[Q/Z]}(E(x))=ε_U(x), with the inherited factorialCounit and the native group-algebra counit.
- `TauCeti.RootStack.factorialUnitQZEquiv.antipode`: For x∈U_A, S_{A[Q/Z]}(E(x))=E(S_U(x)), with inherited factorialAntipode and native group-algebra antipode e_u↦e_{−u}.
- `TauCeti.RootStack.factorialUnitQZEquiv.coefficient_natural`: For any ring hom φ:A→B, native coefficient mapping A[Q/Z]→B[Q/Z] after E_A equals E_B after the inherited φ-semilinear factorialUnitCoefficientMap(φ). Flatness and injectivity of φ are unnecessary.

Unit tests:

- `TauCeti.RootStack.factorialUnitQZEquiv.test_inverse_negative`: The inverse of e_[−1/3] is the positive-index n=3 extension of t_3 squared.
- `TauCeti.RootStack.factorialUnitQZEquiv.test_wild_hopf`: For v=u_1−1 over Z/2, E(v) is nonzero with square zero and Δ(E(v))=E(v)⊗E(v)+E(v)⊗1+1⊗E(v).
- `TauCeti.RootStack.factorialUnitQZEquiv.test_nonflat_coefficients`: For the nonflat coefficient map Z→Z/2, the native coordinate square commutes on every element.

### Infinite coordinate equivalence on roots

`TauCeti.RootStack.factorialUnitQZEquiv.root` — E(u_i)=e_[1/d_i].

The promoted equivalence has forward function F. Apply its root formula.

### Inverse coordinate map on rational representatives

`TauCeti.RootStack.factorialUnitQZEquiv.inverse_single_den` — For q∈Q and a∈A, E⁻¹(a e_[q]) is ι_{den(q)} applied to the inverse finite cyclic image of a e_[num(q) mod den(q)]. This includes negative q and q=0.

Map the displayed preimage forward. The finite leg and single formulas yield [num(q)/den(q)]=[q]. Use the equivalence inverse law to identify the preimage. Different rational representatives of the same circle class give the same inverse because their forward images coincide and F is injective.

### Infinite coordinate equivalence preserves comultiplication

`TauCeti.RootStack.factorialUnitQZEquiv.comul` — For x∈U_A, (E⊗E)(Δ_U(x))=Δ_{A[Q/Z]}(E(x)), using the inherited chosen factorial coaction at parameter 1 and the native group-algebra comultiplication.

View both sides as A-algebra homomorphisms into the native tensor product. On u_i the inherited coaction is u_i⊗u_i; the mapped tensor is e_[1/d_i]⊗e_[1/d_i], precisely native comultiplication of that basis element. Apply the inherited root-extensionality theorem. This is a coordinate Hopf comparison, not an affine scheme-limit theorem.

### Infinite coordinate equivalence preserves the counit

`TauCeti.RootStack.factorialUnitQZEquiv.counit` — For x∈U_A, ε_{A[Q/Z]}(E(x))=ε_U(x), with the inherited factorialCounit and the native group-algebra counit.

Both A-algebra homomorphisms send every included root to 1. Apply inherited root extensionality. On a general single a e_u the native counit is a; no coefficient augmentation is guessed.

### Infinite coordinate equivalence preserves the antipode

`TauCeti.RootStack.factorialUnitQZEquiv.antipode` — For x∈U_A, S_{A[Q/Z]}(E(x))=E(S_U(x)), with inherited factorialAntipode and native group-algebra antipode e_u↦e_{−u}.

The inherited root inverse formula identifies S_U(u_i) with the inverse of the universal factorial unit. An algebra equivalence preserves inverses of these units, and the native antipode sends e_[1/d_i] to e_[−1/d_i]. Package the antipode on a commutative group algebra as the algebra hom induced by group inversion using the existing mapDomainAlgHom, then use root extensionality. Native single induction identifies that map with the native linear antipode.

### Infinite root coordinates commute with coefficient homomorphisms

`TauCeti.RootStack.factorialUnitQZEquiv.coefficient_natural` — For any ring hom φ:A→B, native coefficient mapping A[Q/Z]→B[Q/Z] after E_A equals E_B after the inherited φ-semilinear factorialUnitCoefficientMap(φ). Flatness and injectivity of φ are unnecessary.

Regard the target as an A-algebra via φ; the two ring maps become A-algebra maps with equal constant images. On every factorial root both give e_[1/d_i] with coefficient φ(1)=1. Apply inherited root extensionality with this restriction of scalars; this is a fixed-universe coefficient square, not a general universe/base-change equivalence.

## Exact remaining work and validation boundary

The 28 new declarations are a source- and dependency-grounded coordinate plan. Their suggested signatures use the inherited actual algebra objects and are admitted. No new Lean process was started: observed available memory was below the WORKERS requirement of 20 GB. The existing Mathlib build has the exact Mathlib pin, while the available full Tau Ceti build has a different source revision. Neither the new suggested file nor the new mathematical proof routes have a fresh Lean execution certificate. Historical native checks in the incoming handoff belong only to their archived source hashes.

The coordinate equivalence must be elaborated when the required resources and exact source build are available. Transport its Hopf structure through the full positive-divisibility and higher-universe interfaces, and transport the arbitrary-section coaction to the canonical coordinate Hopf algebra. Construct coherent root-object groupoid reindexing, affine Spec limits, fpqc frame torsors and the geometric infinite quotient equivalence. All TOWER-AFF, KUMMER-FINITE, TOWER-TYPING, DVR and roots-of2 distinctions remain. A coordinate algebra or its represented fixed-universe point group does not establish these geometric steps. The key definition continues to include arbitrary schemes and stacks, nonreduced fibres, tame/wild cases, relative Weil restriction, base change and the infinite DVR gerbe; finite reduced pictures cannot replace it.

Talpo–Vistoli arXiv1410.1164v2 pp.14–16 were read freshly for this continuation, including the Cartier-dual chart construction, its invariant statement, the fpqc quotient definition and Proposition 3.10. The new rational-circle and group-algebra coordinate statements are authored deductions from pinned declarations and the inherited root tower. The complete paper and other source routes were not newly reread here; their original coverage contracts remain unchanged. This is a continuation of RS.2, not a fresh completion claim for the arithmetic and automorphic layers.

---

## Finite unit-root cyclic coordinates — 2026-10-03

This checkpoint identifies the actual finite unity-root algebra
`B_n = AdjoinRoot (X^n − C (1:A))` with
`MuHopf A n = MonoidAlgebra A (Multiplicative (ZMod n))` for every positive n and arbitrary commutative A. Write t_n for the quotient root and e_[k] for the group-algebra basis vector. The map E_n sends t_n to e_[1]; its inverse sends a e_[k] to a·t_n^val(k). There is no choice of primitive root in A, and no reducedness, nontriviality, field or invertibility-of-n assumption. This is the coordinate algebra of μ_n, retaining its scheme-theoretic multiplicities.

The fifteen new declaration nodes separate the multiplicative root character, the two universal algebra maps, their generator/basis formulas, the two inverse laws, the bundled equivalence, and its root, inverse-basis, coaction, divisibility, counit and root-antipode comparisons. The three construction interfaces for the character and forward/inverse lifts also cross-reference the common inverse and basis lemmas needed by their consumers; these records do not introduce duplicate declarations. Native `MonoidAlgebra.lift`, `AdjoinRoot.liftAlgHom`, both extensionality APIs, group-algebra Hopf structure and `AlgEquiv.ofAlgHom` are imported from the pinned library.

For n|N the transported transition sends a e_[k] to a e_[(N/n)val(k)]. Thus the 2|6 map sends e_[1] to e_[3]. This direction is essential: the coordinate map is dual to μ_N→μ_n. On the finite root algebra, (id⊗E_n)ρ_1,n=ΔE_n; εE_n is root evaluation at one; S(E_n(t_n))=E_n(t_n^(n−1)). Each equality uses the actual imported maps.

Twelve typed acceptance examples include n=1, exponent wraparound, cyclic multiplication, nontrivial basis coefficients, the 2|6 transition, zero rings, and the wild case A=ZMod 2,n=2. In the last case t_2−1 is nonzero and its square is zero. Replacing the coordinate group scheme by its field-valued points loses this example. The separate native proof extraction checks the assertions without admissions; the repository suggested file remains an admitted planning sketch and all implementation statuses remain unchecked.

Source scope: fresh Talpo–Vistoli arXiv:1410.1164v2, complete printed/PDF pp.14–16, with p.14 visually checked. Section3.1 identifies the finite Cartier dual character groups and their inverse system. The explicit quotient/group-algebra comparison and formulas here are authored deductions from the pinned universal properties, not quoted printed theorems. The pinned Tau Ceti roots-of-unity file explicitly leaves this polynomial-coordinate comparison separate. A bounded current PR/Zulip check found related universal-property, cyclotomic-power and generic diagonalizable-Hopf work; none is imported or credited as implementing this comparison.

The packet now contains340 nodes, including all325 incoming statement contracts and324 unchanged node objects. Both paper routes, the reserved general root-stack key, stable-curve imports,39 planets,8 gaps and13 requests are retained. Every stage remains partial. The next algebraic step is the compatible character embeddings Z/n→Q/Z and the actual A[Q/Z] Hopf-colimit comparison. It still requires its own proof. Root-object groupoid reindexing, arbitrary-universe transports, affine Spec limits, fpqc frame torsors and infinite quotient equivalence remain open, together with TOWER-AFF/KUMMER-FINITE/TOWER-TYPING/DVR. The inherited all-roots-of2 non-fppf counterexample and the distinction between chart point actions and torsors remain in force.

# Coefficient naturality of coherent root-chart scaling

This continuation specifies ring-valued scalar/scaling functoriality. All implementation statuses remain unchecked.

A,B,C are arbitrary commutative rings and φ:A→+*B, ψ:B→+*C are unital ring homomorphisms; f∈A. No field, nontriviality, reducedness, Noetherian, flatness or injectivity hypothesis is imposed.

Use d_i=(i+1)!, the actual factorial chart colimit C_A(f), its roots u_i and coefficient map A→C_A(f). S(A) is the inherited subgroup of unit families with σ_i^(d_i)=1 and σ_j^(d_j/d_i)=σ_i for every i≤j.

The coefficient map F_φ:C_A(f)→+*C_B(φ(f)) is a ring map with φ-semilinear coefficient law, rather than an A-algebra map under the original target scalar structure. A local scalar restriction via RingHom.toAlgebra is used only to apply the existing root lift. Natural point-scaling maps do not establish a universal Hopf coaction, Spec-limit, geometric base-change isomorphism or fpqc torsor/quotient comparison.

## Change of rings for coherent scalar points

Declaration: `TauCeti.RootStack.factorialRootScalars.map` (`FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-map`).

Construct the native group homomorphism S(φ):S(A)→*S(B) by σ_i↦Units.map(φ)(σ_i). Both the finite-order and cross-level coherence equations are preserved.

Proof plan: Apply the actual native Units.map at each index. Preservation of powers and1 carries each finite-order equation and each coherence equation. Pointwise preservation of1 and multiplication gives the actual group homomorphism.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars`, `mathlib:Units.map`.

API `TauCeti.RootStack.factorialRootScalars.map_value`: For every σ∈S(A) and i, the underlying ring value of S(φ)(σ)_i is φ(σ_i).

API `TauCeti.RootStack.factorialRootScalars.map_id`: S(id_A)=id_(S(A)) as native group homomorphisms.

API `TauCeti.RootStack.factorialRootScalars.map_comp`: S(ψ∘φ)=S(ψ)∘S(φ) as native group homomorphisms.

Acceptance `factorialCoefficientTests.scalar_value` (compatibility): The underlying ring value of every mapped scalar equals its image under the specified ring homomorphism.

Acceptance `factorialCoefficientTests.scalar_one` (degenerate): Every coefficient change sends the coherent identity family to the actual identity family.

Acceptance `factorialCoefficientTests.scalar_inverse` (compatibility): The actual scalar map preserves the native inverse family.

## Value of a mapped coherent scalar

Declaration: `TauCeti.RootStack.factorialRootScalars.map_value` (`FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-value`).

For every σ∈S(A) and i, the underlying ring value of S(φ)(σ)_i is φ(σ_i).

Proof plan: Evaluate the pointwise actual unit map; its underlying ring value is definitionally φ(σ_i).

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-map`, `mathlib:Units.coe_map`.

## Identity on coherent scalar points

Declaration: `TauCeti.RootStack.factorialRootScalars.map_id` (`FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-identity`).

S(id_A)=id_(S(A)) as native group homomorphisms.

Proof plan: Use group-homomorphism, subgroup, function and unit extensionality. The actual unit values agree definitionally.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-map`.

## Composition on coherent scalar points

Declaration: `TauCeti.RootStack.factorialRootScalars.map_comp` (`FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-composition`).

S(ψ∘φ)=S(ψ)∘S(φ) as native group homomorphisms.

Proof plan: At every scalar family and level both unit values are ψ(φ(σ_i)); apply native extensionality.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-map`.

## Root extensionality for semilinear colimit maps

Declaration: `TauCeti.RootStack.factorialAffineColimit.ringHom_ext` (`FunctionFieldArithmeticPartII:RS.2/factorial-semilinear-ringhom-ext`).

If g,h:C_A(f)→+*B have the same coefficient homomorphism φ:A→+*B and agree on every actual root u_i, then g=h. The coefficient law must be retained; root values alone do not specify arbitrary ring homomorphisms.

Proof plan: Give B the local A-algebra structure from φ. The actual coefficient equations turn g and h into native A-algebra homomorphisms. Apply the inherited actual colimit root extensionality and take underlying ring homomorphisms.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `mathlib:RingHom.toAlgebra`.

## Change of coefficients in the root chart colimit

Declaration: `TauCeti.RootStack.factorialCoefficientMap` (`FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-map`).

Construct F_φ:C_A(f)→+*C_B(φ(f)) sending every actual root u_i to the target root u_i and every coefficient a to φ(a) through the target coefficient map.

Proof plan: Restrict the target scalar structure locally through A→φ B→C_B(φ(f)). Its actual roots have d_i-th power equal to the restricted coefficient image of f and obey the same transition equations. Apply the existing actual compatible-root lift and take its underlying ring homomorphism.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-power`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-root`, `mathlib:RingHom.toAlgebra`.

API `TauCeti.RootStack.factorialCoefficientMap.root`: For every i, F_φ(u_i in C_A(f))=u_i in C_B(φ(f)).

API `TauCeti.RootStack.factorialCoefficientMap.constant`: For every a∈A, F_φ(algebraMap_A(a))=algebraMap_B(φ(a)).

API `TauCeti.RootStack.factorialCoefficientMap.id`: F_(id_A)=id_(C_A(f)) as native ring homomorphisms.

API `TauCeti.RootStack.factorialCoefficientMap.comp`: F_(ψ∘φ)=F_ψ∘F_φ as native ring homomorphisms, with F_ψ formed at the mapped parameter φ(f).

Acceptance `factorialCoefficientTests.identity` (degenerate): The actual identity coefficient map fixes every root-colimit element.

Acceptance `factorialCoefficientTests.root` (compatibility): At degree2 the actual coefficient change sends the chart root to the degree2 root of the mapped parameter.

Acceptance `factorialCoefficientTests.composition` (compatibility): The composite coefficient map agrees with successive changes on every actual colimit element.

Acceptance `factorialCoefficientTests.zero_ring` (degenerate): Every map from an integer root-colimit into the colimit over the zero ring sends every element to0; the zero-ring case is retained.

Acceptance `factorialCoefficientTests.mod_two` (computation): For φ:Z→Z/2Z and f=0, the actual coefficient map sends the source coefficient2 to0. No injectivity hypothesis is silently introduced.

Acceptance `factorialCoefficientTests.scaling_square` (compatibility): The actual coefficient map commutes with the actual coherent scaling equivalence on every colimit element.

## Root value of coefficient change

Declaration: `TauCeti.RootStack.factorialCoefficientMap.root` (`FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-root`).

For every i, F_φ(u_i in C_A(f))=u_i in C_B(φ(f)).

Proof plan: Evaluate the actual compatible-root lift. Use precisely the same local target scalar structure as in its construction.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-map`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift-root`.

## Coefficient value of coefficient change

Declaration: `TauCeti.RootStack.factorialCoefficientMap.constant` (`FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-constant`).

For every a∈A, F_φ(algebraMap_A(a))=algebraMap_B(φ(a)).

Proof plan: Apply the actual root lift’s native algebra-homomorphism coefficient law under the specified restricted target scalar structure.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-map`.

## Identity change of root-chart coefficients

Declaration: `TauCeti.RootStack.factorialCoefficientMap.id` (`FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-identity`).

F_(id_A)=id_(C_A(f)) as native ring homomorphisms.

Proof plan: Both maps have the identical coefficient law and actual root values. Apply semilinear ring-homomorphism extensionality.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-semilinear-ringhom-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-constant`.

## Composition of root-chart coefficient changes

Declaration: `TauCeti.RootStack.factorialCoefficientMap.comp` (`FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-composition`).

F_(ψ∘φ)=F_ψ∘F_φ as native ring homomorphisms, with F_ψ formed at the mapped parameter φ(f).

Proof plan: Both maps send a to ψ(φ(a)) and u_i to the root at parameter ψ(φ(f)). Identify the dependent target parameter definitionally; apply the actual semilinear extensionality lemma.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-semilinear-ringhom-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-constant`.

## Naturality of coherent chart scaling

Declaration: `TauCeti.RootStack.factorialScale.coefficient_naturality` (`FunctionFieldArithmeticPartII:RS.2/factorial-scaling-coefficient-naturality`).

For every σ∈S(A), F_φ∘s_σ=s_(S(φ)(σ))∘F_φ as native ring homomorphisms.

Proof plan: Both composites have the same coefficient law. At u_i both give algebraMap_B(φ(σ_i))·u_i by the actual root and coefficient formulas, map_mul and the underlying mapped-unit value. Apply semilinear colimit extensionality.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-semilinear-ringhom-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-constant`, `FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-value`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-constant`.

## Naturality of the actual scaling automorphism

Declaration: `TauCeti.RootStack.factorialScaleEquiv.coefficient_naturality` (`FunctionFieldArithmeticPartII:RS.2/factorial-scaling-equiv-coefficient-naturality`).

For every x∈C_A(f), F_φ(s_σ(x))=s_(S(φ)(σ))(F_φ(x)), where s denotes the actual constructed algebra equivalence.

Proof plan: Evaluate the proved ring-homomorphism square on x. The actual algebra equivalence has the constructed scaling map as forward map.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-scaling-coefficient-naturality`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-equivalence`.

## Naturality of inverse coherent scaling

Declaration: `TauCeti.RootStack.factorialScaleEquiv.inverse_coefficient_naturality` (`FunctionFieldArithmeticPartII:RS.2/factorial-scaling-inverse-coefficient-naturality`).

For every x∈C_A(f), F_φ(s_σ⁻¹(x))=s_(S(φ)(σ))⁻¹(F_φ(x)), using the actual inverse equivalences.

Proof plan: The actual inverse is scaling by σ⁻¹. Native group-homomorphism preservation of inverses gives S(φ)(σ⁻¹)=S(φ)(σ)⁻¹. Evaluate the forward square for σ⁻¹.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-scaling-coefficient-naturality`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-equivalence`, `FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-map`.

Source: [Talpo–Vistoli exact v2](https://arxiv.org/pdf/1410.1164v2), complete printed/PDF pp.14–16 freshly read2026-10-03. These are authored rank-one coefficient calculations, not literal source declaration names or a certification of its quotient proof.

Required continuation: Actual coherent scalar maps and φ-semilinear chart maps now obey identity/composition and the forward/inverse scaling squares for arbitrary coefficient ring homomorphisms. The universal diagonalizable group scheme and Hopf coaction, transport through the positive-divisibility comparison, coherent root-object groupoid reindexing, Spec limits, fpqc frame torsors and the infinite quotient comparison remain required constructions. TOWER-AFF, KUMMER-FINITE, TOWER-TYPING, DVR/Kummer and the all-roots-of2 non-fppf distinctions and separate Yun–Zhang/symplectic source routes are unchanged.

---

# Actual coherent scalar points and colimit scaling — 2026-10-03

This continuation supplies ring-valued coherent scalar points and their actual algebra automorphisms, as a point interface consumed by the existing infinite affine quotient route. The universal diagonalizable group-scheme/Hopf action and geometric/fpqc comparison remain explicit work.

A is any commutative ring, f∈A and d_i=(i+1)! for i∈N. C_f is the existing actual factorial chart colimit with roots u_i and inclusions. No reducedness, Noetherian condition, coefficient field, invertibility of exponents or unit condition on f is imposed.
A coherent scalar is a family σ_i∈Aˣ satisfying σ_i^(d_i)=1 and σ_j^(d_j/d_i)=σ_i for all i≤j. The native carrier is a subgroup of the function group N→Aˣ; it models ring-valued points only. It is not the universal diagonalizable group scheme, its Hopf algebra or its fpqc torsors.
Algebra maps fix every coefficient. Scaling is u_i↦σ_i u_i. Inverse and composition use the actual inherited subgroup operations and native algebra-map equivalences, with actual inverse proofs.


## Coherent factorial root-of-unity points

Declaration `TauCeti.RootStack.factorialRootScalars` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars`).

Define the subgroup S(A) of families σ:N→Aˣ such that σ_i^(d_i)=1 and σ_j^(d_j/d_i)=σ_i for every i≤j. Its identity, products and inverses are pointwise native unit operations. This is an A-valued point interface, not a replacement for the universal group scheme.

Proof: Use the native function group of units. The displayed root equations and compatibility define its subgroup. Unit powers preserve identity and, since A is commutative, pointwise products; inverse powers preserve the same equations. Construct the actual subgroup instances, rather than assume closure.

Prerequisites: `mathlib:Subgroup`, `mathlib:rootsOfUnity`.

API `TauCeti.RootStack.factorialRootScalars`: Define the subgroup S(A) of families σ:N→Aˣ such that σ_i^(d_i)=1 and σ_j^(d_j/d_i)=σ_i for every i≤j. Its identity, products and inverses are pointwise native unit operations. This is an A-valued point interface, not a replacement for the universal group scheme.

API `TauCeti.RootStack.factorialRootScalars.pow`: For σ∈S(A), the underlying scalar σ_i∈A satisfies σ_i^(d_i)=1.

API `TauCeti.RootStack.factorialRootScalars.transition`: For i≤j and σ∈S(A), the underlying ring values satisfy σ_j^(d_j/d_i)=σ_i.

## Orders of coherent scalar values

Declaration `TauCeti.RootStack.factorialRootScalars.pow` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars-power`).

For σ∈S(A), the underlying scalar σ_i∈A satisfies σ_i^(d_i)=1.

Proof: Apply the native unit-to-ring map to the defining power equation.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars`.

## Compatibility of coherent scalar values

Declaration `TauCeti.RootStack.factorialRootScalars.transition` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars-transition`).

For i≤j and σ∈S(A), the underlying ring values satisfy σ_j^(d_j/d_i)=σ_i.

Proof: Apply the actual unit-to-ring map to the defining transition equation.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars`.

## Coherent scaling of the actual chart colimit

Declaration `TauCeti.RootStack.factorialScale` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling`).

For σ∈S(A), construct an A-algebra homomorphism s_σ:C_f→C_f sending every actual root u_i to σ_i u_i.

Proof: The scaled root has d_i-th power f because σ_i^(d_i)=1. For i≤j its transition power is σ_j^(d_j/d_i)u_j^(d_j/d_i)=σ_i u_i. Apply the existing actual compatible-root algebra lift; no formal assumed colimit map is introduced.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars-power`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars-transition`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-power`.

API `TauCeti.RootStack.factorialScale`: For σ∈S(A), construct an A-algebra homomorphism s_σ:C_f→C_f sending every actual root u_i to σ_i u_i.

API `TauCeti.RootStack.factorialScale.root`: For every i, s_σ(u_i)=σ_i u_i in the actual colimit, using its coefficient algebra map.

API `TauCeti.RootStack.factorialScale.constant`: For a∈A, s_σ(a)=a through the specified A-algebra map.

API `TauCeti.RootStack.factorialScale.one`: Scaling by the identity family is the identity A-algebra homomorphism of C_f.

API `TauCeti.RootStack.factorialScale.mul`: For σ,τ∈S(A), s_(στ)=s_σ∘s_τ as actual A-algebra homomorphisms.

## Value of scaling on each root

Declaration `TauCeti.RootStack.factorialScale.root` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-root`).

For every i, s_σ(u_i)=σ_i u_i in the actual colimit, using its coefficient algebra map.

Proof: Evaluate the actual universal root lift on the finite root inclusion.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift-root`.

## Scaling fixes coefficients

Declaration `TauCeti.RootStack.factorialScale.constant` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-constant`).

For a∈A, s_σ(a)=a through the specified A-algebra map.

Proof: Use the constructed A-algebra homomorphism coefficient law.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling`.

## Identity coherent scaling

Declaration `TauCeti.RootStack.factorialScale.one` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-one`).

Scaling by the identity family is the identity A-algebra homomorphism of C_f.

Proof: On each actual root the scalar is1. Native root extensionality determines the entire colimit map.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`.

## Composition of coherent scalings

Declaration `TauCeti.RootStack.factorialScale.mul` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-mul`).

For σ,τ∈S(A), s_(στ)=s_σ∘s_τ as actual A-algebra homomorphisms.

Proof: Both sides send u_i to σ_iτ_i u_i and fix the coefficients. Use commutativity in A and the colimit and native quotient root extensionality.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-constant`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`.

## Actual coherent scaling automorphisms

Declaration `TauCeti.RootStack.factorialScaleEquiv` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-equivalence`).

Construct an A-algebra automorphism C_f≃C_f with forward map s_σ and inverse map s_(σ⁻¹). Its two inverse laws follow from the actual composition law and the identity family.

Proof: Use the existing native subgroup inverse, and the proved composition rule in both orders. The products σσ⁻¹ and σ⁻¹σ are the identity family. Apply native AlgEquiv.ofAlgHom with these proved inverse equations.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-mul`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-one`, `mathlib:AlgEquiv.ofAlgHom`.

API `TauCeti.RootStack.factorialScaleEquiv`: Construct an A-algebra automorphism C_f≃C_f with forward map s_σ and inverse map s_(σ⁻¹). Its two inverse laws follow from the actual composition law and the identity family.

API `TauCeti.RootStack.factorialScaleEquiv.root`: The constructed automorphism sends each u_i to σ_i u_i, with the given coefficient map.

API `TauCeti.RootStack.factorialScaleEquiv.inverse_root`: The inverse constructed automorphism sends u_i to σ_i⁻¹u_i.

## Automorphism value on finite roots

Declaration `TauCeti.RootStack.factorialScaleEquiv.root` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-equivalence-root`).

The constructed automorphism sends each u_i to σ_i u_i, with the given coefficient map.

Proof: The forward native equivalence map is the constructed algebra scaling.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-equivalence`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-root`.

## Inverse automorphism on finite roots

Declaration `TauCeti.RootStack.factorialScaleEquiv.inverse_root` (`FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-inverse-root`).

The inverse constructed automorphism sends u_i to σ_i⁻¹u_i.

Proof: The native equivalence inverse is the constructed scaling for the actual inverse scalar family.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-equivalence`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-root`.

## Universal coherent unit family

Declaration `TauCeti.RootStack.factorialUniversalScalars` (`FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars`).

In the actual coefficient algebra C_1=colim_i A[T]/(T^(d_i)−1), construct the coherent unit family whose i-th underlying value is its actual root u_i. Its positive power is1, so the native roots-of-unity constructor supplies each unit.

Proof: Each root has positive d_i-th power1; use native rootsOfUnity.mkOfPowEq, not an assumed unit witness. The native colimit root power compatibility proves compatibility of units by unit-value injectivity. This constructs an actual nonconstant test coefficient ring without choosing analytic roots.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-power`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-root`, `mathlib:rootsOfUnity.mkOfPowEq`, `mathlib:rootsOfUnity.coe_mkOfPowEq`.

API `TauCeti.RootStack.factorialUniversalScalars`: In the actual coefficient algebra C_1=colim_i A[T]/(T^(d_i)−1), construct the coherent unit family whose i-th underlying value is its actual root u_i. Its positive power is1, so the native roots-of-unity constructor supplies each unit.

API `TauCeti.RootStack.factorialUniversalScalars.value`: The underlying value of the i-th universal coherent unit is exactly the actual i-th root in C_1.

API `TauCeti.RootStack.factorialRootScalars.transition`: For i≤j and σ∈S(A), the underlying ring values satisfy σ_j^(d_j/d_i)=σ_i.

## Underlying universal scalar value

Declaration `TauCeti.RootStack.factorialUniversalScalars.value` (`FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars-value`).

The underlying value of the i-th universal coherent unit is exactly the actual i-th root in C_1.

Proof: Use the actual native roots-of-unity constructor value formula.

Prerequisites: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars`, `mathlib:rootsOfUnity.coe_mkOfPowEq`.

## Acceptance checks

`factorialRootScalars.test_one` (degenerate): The identity scalar family has value1 at every index.

`factorialRootScalars.test_inverse` (compatibility): The actual inverse family cancels its scalar at each index in the native unit group.

`factorialRootScalars.test_individual_roots` (non-example): Over Z the family with value−1 at index1 and1 elsewhere satisfies every individual d_i-th-root-of-unity equation.

`factorialRootScalars.test_incoherent` (non-example): That family over Z is not coherent: the index2-to-index1 cube transition would require1=−1. Individual finite orders do not define an infinite point.

`factorialScale.test_one` (degenerate): Scaling by the identity family fixes every element of the actual colimit.

`factorialScale.test_constant` (computation): Over Z/4Z with f=2, coherent scaling fixes the coefficient3 in the actual colimit.

`factorialScale.test_composition` (compatibility): On every actual element, scaling by a product family equals successive scaling by its two families.

`factorialScaleEquiv.test_roundtrip` (compatibility): For every element, applying the actual scaling equivalence and its actual inverse returns that element.

`factorialScaleEquiv.test_root` (computation): The actual degree2 root is sent to σ_1 times that root, with coefficients fixed.

`factorialScaleEquiv.test_wild_zero` (non-example): Over F_2 with f=0, every actual coherent scaling keeps the degree2 root nonzero. This root is square-zero; passing to a reduced colimit would fail.

`factorialUniversalScalars.test_root` (computation): For coefficients Z/4Z, the degree2 universal scalar has square1 in the actual C_1.

`factorialUniversalScalars.test_nontrivial` (non-example): Over the actual C_1 with initial coefficients F_3, the degree2 universal unit differs from1. Injective finite insertion and evaluation of its chart root at−1 prove this.

`factorialUniversalScalars.test_zero_ring` (degenerate): For initial coefficient ring Z/1Z the universal coherent scalar family is the identity. The construction retains the zero ring.

Source: [Talpo–Vistoli exact v2 PDF](https://arxiv.org/pdf/1410.1164v2), §3.1 printed pp.14–16, with the actual Cartier-dual/action passage and complete Proposition3.10 proof freshly read2026-10-03. These are authored rank-one point/scaling deductions, not a new proof of the geometric quotient.

The codex-J6LwjP point-scaling continuation constructs the actual coherent native unit-family subgroup, its chart-colimit algebra maps and actual automorphisms, and the universal nonconstant test family. The universal diagonalizable grading/Hopf action and naturality over all test algebras, coherent root-object reindexing, affine Spec limits, fpqc torsors/quotient groupoids, TOWER-AFF, KUMMER-FINITE, TOWER-TYPING and the DVR/Kummer bridge remain open; point-valued formulas do not close them.

Full-file geometric imports remain uncompiled. The inherited Mathlib-only projection retains its exact prior scope; the new continuation is appended intact to that projection. No missing geometric object is replaced by a stub.

---

# Positive-divisibility root chart comparison

For any commutative ring A and f∈A, put B_n=A[t_n]/(t_nⁿ−f) for n>0. All quotient rings and coefficient actions in this section are the native ones. Order the positive root exponents by divisibility. A map n|N acts by t_n↦t_N^(N/n), on exactly B_n and B_N. The identity and composition were supplied earlier; the present continuation uses those maps to construct the full directed algebra colimit C_div. The previously specified factorial algebra is C_f=colim_i B_(d_i), where d_i=(i+1)!.

The root index stores a positive exponent and uses divisibility for its preorder. Numeric inequalities between exponents do not give arrows: 2 precedes 6, but 2 does not precede 3. Products supply common upper bounds. Each n divides (n+1)!, and the factorial adapter is monotone from numeric order to divisibility. This is an adapter for this diagram, using the existing directed-order and direct-limit infrastructure. It introduces no competing generic colimit construction.

Write ι_i:B_(d_i)→C_f for the factorial insertion. Define the extension e_n:B_n→C_f by composing the transition to B_((n+1)!) with ι_n. For every factorial multiple d_i of n, the exact homomorphism equality e_n=ι_i∘j_(n,d_i) holds. To prove independence of i, use a common factorial level k=max(n,i), rewrite both insertions through ι_k, and apply the actual quotient-map composition law. Consequently e_N∘j_(n,N)=e_n whenever n|N, and e_(d_i)=ι_i. Each e_n is injective, as a composite of the earlier injective finite transition and factorial insertion.

Let κ_n:B_n→C_div be the native insertion. The compatible e_n determine an A-algebra homomorphism α:C_div→C_f; its exact finite evaluation is α(κ_n(x))=e_n(x). The factorial insertions κ_(d_i) similarly determine β:C_f→C_div, with β(ι_i(x))=κ_(d_i)(x). Both inverse laws follow on actual finite representatives. On κ_n(x), βα becomes κ_((n+1)!)(j_(n,(n+1)!)(x)), which is κ_n(x). On ι_i(x), αβ becomes e_(d_i)(x)=ι_i(x). Thus the native A-algebra equivalence C_div≃C_f has specified forward and inverse maps, rather than an unspecified isomorphism class.

For v_n=κ_n(t_n) and u_i=ι_i(t_(d_i)), the comparison sends v_n to u_i^(d_i/n) at any factorial multiple. Both sides preserve every coefficient from A. The relations v_nⁿ=f and v_n=v_N^(N/n) hold in C_div. Every κ_n is injective; every colimit element has a finite representative; and homomorphisms out of C_div are determined on all the v_n by the existing quotient and directed-limit extensionality APIs.

The nonreduced tests matter. For A=F₂ and f=0, v₂ is nonzero and v₂²=0. Injectivity and the native monic power basis prove nonvanishing; the actual quotient relation proves its square vanishes. Both colimits therefore retain the nilpotent, including at wild exponents. The diagram and comparison also include the zero ring. Nonfactorial-coordinate tests use n=3 and levels 6 and 24, with the exact transition powers. Coefficient tests over Z/4Z retain arbitrary parameters and nonreduced coefficients.

These are authored rank-one algebra inputs to [Talpo–Vistoli, Proposition 3.5, Remark 3.6 and Section 3.1, printed pp.13–17](https://arxiv.org/pdf/1410.1164v2). The source constructs cofinal root limits and local quotient models. It does not literally state these algebra-map APIs. The fresh reading includes Proposition 3.5 and its proof, the cofinal-system remark, the local models and Proposition 3.10 with its proof; the downloaded PDF matches the inherited version hash. Earlier primary-source receipts remain attributed to their workers.

The packet has 218 unchecked nodes, with 24 new leaves. All 194 incoming mathematical statements, hypotheses, API entries, tests and acceptance contracts remain; 193 whole node objects are unchanged. The infinite-affine-quotient consumer adds the comparison prerequisites and an updated first algebraic proof step. There are 176 API entries and 164 tests on definitions/constructions, 175 baseline references, and the same 39 planets, eight gaps, thirteen requests and ten partial stages. The two routed paper inventories, source issues and key-definition ownership remain unchanged.

This comparison completes an algebraic leaf. Coherent reindexing of root-object groupoids must still carry actual arrows and transition isomorphisms. The diagonalizable grading and action, affine Spec-limit identification, fpqc frame torsors, and infinite quotient groupoid comparison remain separate obligations. Finite fppf Kummer theory and infinite fpqc torsors retain their distinct topology contracts. No stage, gap, route or geometric target is marked closed.

The complete 2,875-line native prototype elaborated against exact Mathlib with no errors, warnings or admissions, including 116 examples and 111 axiom audits. The 1,746-line admitted Mathlib projection elaborated with 269 admission warnings and no other warnings or errors. The full 2,657-line geometric planning file remains uncompiled because required exact-pin Tau Ceti compiled imports are absent in the existing build. Its original 2,389-line block is retained unchanged. The positive index, its factorial exponent adapter and native DirectLimit carrier abbreviations remain visible as type plumbing; new construction and proof bodies are admitted. No implementation is claimed.

## New declarations and their API

The common hypotheses are an arbitrary commutative ring A, a parameter f, actual positive quotient-root exponents and the specified maps above. All named declarations below lie in the RootStack namespace. Each leaf realizes RS.2 and imports the existing finite-root algebra, direct-limit or transition results listed in the packet.

### Positive divisibility root indices

TauCeti.RootStack.RootDivIndex — The root-chart index stores an exponent n∈N and a proof n>0. Its preorder is n≤N exactly when n divides N, with decidable comparison, nonzero exponents and distinguished index 1. Products supply common upper bounds. The factorial adapter sends i∈N to d_i=(i+1)!.

Proof outline. Instantiate the native Preorder with divisibility reflexivity and transitivity; do not use numeric order. The product nN is positive and divisible by both n and N, giving the native directed-order instance. Use positivity of factorials for the adapter; no generic colimit or competing quotient carrier is defined.

The planned API is:

- TauCeti.RootStack.RootDivIndex (constructor): The root-chart index stores an exponent n∈N and a proof n>0. Its preorder is n≤N exactly when n divides N, with decidable comparison, nonzero exponents and distinguished index 1. Products supply common upper bounds. The factorial adapter sends i∈N to d_i=(i+1)!.
- TauCeti.RootStack.RootDivIndex.factorial (functoriality): The factorial index has actual exponent (i+1)!, definitionally on the specified carrier.
- TauCeti.RootStack.RootDivIndex.cofinal (compatibility): Every positive index n divides d_(n.exponent).
- TauCeti.RootStack.RootDivIndex.factorial_mono (functoriality): If i≤j in numeric order, d_i divides d_j.

The unit tests are:

- rootDivIndex.test_zero (non-example): Every root index has nonzero exponent; including exponent zero is rejected.
- rootDivIndex.test_two_six (computation): The index 2 precedes 6 in the divisibility preorder.
- rootDivIndex.test_numeric_order (non-example): The index 2 does not precede 3, despite 2<3 numerically.

### Factorial multiple of each root index

TauCeti.RootStack.RootDivIndex.cofinal — For every positive root index n, n divides d_(n.exponent)=(n.exponent+1)!.

Proof outline. Apply the native factorial-divisibility theorem to n>0 and n≤n+1.

### Divisibility along factorial levels

TauCeti.RootStack.RootDivIndex.factorial_mono — For i≤j in N, the factorial indices d_i and d_j satisfy d_i divides d_j.

Proof outline. Apply the native factorial-divisibility theorem to i+1≤j+1.

### Factorial transition as a homomorphism equation

TauCeti.RootStack.factorialAffineInclusion.comp_transition — For i≤j, the composite ι_j∘j_(d_i,d_j) equals ι_i as an actual A-algebra homomorphism.

Proof outline. Apply algebra-homomorphism extensionality and the existing pointwise transition law.

### Every root chart in the factorial colimit

TauCeti.RootStack.factorialAffineExtension — For a positive root index n construct e_n:B_n→C_f as ι_(n.exponent)∘j_(n,d_(n.exponent)). Coefficients and all ring operations are preserved.

Proof outline. Use the specified factorial multiple and compose the actual fixed-index quotient map with the native factorial insertion.

The planned API is:

- TauCeti.RootStack.factorialAffineExtension (constructor): For a positive root index n construct e_n:B_n→C_f as ι_(n.exponent)∘j_(n,d_(n.exponent)). Coefficients and all ring operations are preserved.
- TauCeti.RootStack.factorialAffineExtension.at_level (extensionality): For every i with n dividing d_i, e_n equals ι_i∘j_(n,d_i), independently of the chosen factorial multiple.
- TauCeti.RootStack.factorialAffineExtension.transition (compatibility): For n dividing N, e_N∘j_(n,N)=e_n.
- TauCeti.RootStack.factorialAffineExtension.factorial (simp): At the actual factorial index d_i, e_(d_i)=ι_i.
- TauCeti.RootStack.factorialAffineExtension.injective (extensionality): Every e_n is injective, including over wild or zero coefficient rings.

The unit tests are:

- factorialAffineExtension.test_three_at_six (computation): The index-3 extension is ι_2 composed with the actual map B_3→B_6.
- factorialAffineExtension.test_choice (compatibility): For every x∈B_3, its images through B_6 and B_24 agree in C_f.
- factorialAffineExtension.test_one (degenerate): The factorial index d_0=1 extends by the first factorial insertion.

### Independence of the factorial multiple

TauCeti.RootStack.factorialAffineExtension.at_level — For every positive n and every i with n dividing d_i, e_n=ι_i∘j_(n,d_i) as A-algebra homomorphisms.

Proof outline. Choose k=max(n.exponent,i). Rewrite both candidate maps through ι_k using the factorial inclusion composition law. The actual divisibility-map composition law makes both maps ι_k∘j_(n,d_k); proof irrelevance removes any choice of divisibility witness.

### Compatibility of all finite chart extensions

TauCeti.RootStack.factorialAffineExtension.transition — For positive indices n dividing N, e_N∘j_(n,N)=e_n.

Proof outline. Compute e_n using the factorial multiple d_(N.exponent), which is also divisible by n. Apply actual quotient-map composition in the same target carrier.

### Extension at a factorial index

TauCeti.RootStack.factorialAffineExtension.factorial — For every i, the extension at root index d_i is exactly the factorial insertion ι_i.

Proof outline. Choose the level i itself in the choice-independence law and simplify its identity transition.

### Injectivity of each factorial chart extension

TauCeti.RootStack.factorialAffineExtension.injective — For every positive root index n, the map e_n:B_n→C_f is injective.

Proof outline. Both the actual quotient transition and the factorial insertion in the defining composite are injective.

### All positive root chart colimit

TauCeti.RootStack.DivisibilityAffineColimit — Construct C_div=colim_(n|N) B_n over the positive divisibility index, using Mathlib DirectLimit with its inherited commutative ring and A-algebra structures. Its adapter map is exactly the existing fixed-index j_(n,N).

Proof outline. Instantiate the directed system using the exact identity and composition equations of the previously checked quotient maps. Apply the native directed algebra colimit on this index; no new general limit implementation is introduced.

The planned API is:

- TauCeti.RootStack.DivisibilityAffineColimit (constructor): Construct C_div=colim_(n|N) B_n over the positive divisibility index, using Mathlib DirectLimit with its inherited commutative ring and A-algebra structures. Its adapter map is exactly the existing fixed-index j_(n,N).
- TauCeti.RootStack.divisibilityAffineMap (functoriality): The map for n≤N is exactly affineDivisibility at their actual positive exponents.
- TauCeti.RootStack.divisibilityAffineDirected (compatibility): The map adapter satisfies the native DirectedSystem identity and composition fields.
- TauCeti.RootStack.divisibilityAffineColimit.exists_level (extensionality): Every element of C_div comes from one actual positive finite chart.
- TauCeti.RootStack.divisibilityAffineColimit.hom_ext (extensionality): Algebra maps out of C_div are determined by all finite distinguished roots.

The unit tests are:

- divisibilityAffineColimit.test_wild_nonzero (non-example): For A=F_2 and f=0, the index-2 root remains nonzero in C_div; replacing the charts by reductions fails.
- divisibilityAffineColimit.test_wild_square (computation): That nonzero index-2 root has square zero in C_div.
- divisibilityAffineColimit.test_zero_ring (degenerate): For A=Z/1Z and f=0, every element of C_div is zero.

### Finite charts in the divisibility colimit

TauCeti.RootStack.divisibilityAffineInclusion — For each positive n construct κ_n:B_n→C_div as the native A-algebra insertion, preserving coefficients and all ring operations.

Proof outline. Instantiate the existing native insertion on the actual root-chart directed system.

The planned API is:

- TauCeti.RootStack.divisibilityAffineInclusion (constructor): For each positive n construct κ_n:B_n→C_div as the native A-algebra insertion, preserving coefficients and all ring operations.
- TauCeti.RootStack.divisibilityAffineInclusion.transition (compatibility): For n dividing N and x∈B_n, κ_N(j_(n,N)(x))=κ_n(x).
- TauCeti.RootStack.divisibilityAffineInclusion.injective (extensionality): Every κ_n is injective.
- TauCeti.RootStack.divisibilityAffineInclusion.pow (simp): The image v_n=κ_n(t_n) satisfies v_n^n=algebraMap(A,C_div)(f).
- TauCeti.RootStack.divisibilityAffineInclusion.root (simp): For n dividing N, v_n=v_N^(N/n).

The unit tests are:

- divisibilityAffineInclusion.test_two_six (computation): The image of the index-2 root is the cube of the index-6 root.
- divisibilityAffineInclusion.test_coefficients (compatibility): Over Z/4Z, the index-3 insertion preserves every coefficient, for arbitrary parameter f.
- divisibilityAffineInclusion.test_identity (degenerate): The identity transition at any positive index leaves its insertion unchanged.

### Divisibility transition in the colimit

TauCeti.RootStack.divisibilityAffineInclusion.transition — For n dividing N and x∈B_n, κ_N(j_(n,N)(x))=κ_n(x).

Proof outline. Apply the actual native insertion transition theorem.

### Finite roots survive the divisibility colimit

TauCeti.RootStack.divisibilityAffineInclusion.injective — For every positive n, κ_n:B_n→C_div is injective.

Proof outline. All transition maps are injective by the existing finite faithful-flat result. Apply the native direct-limit insertion-injectivity theorem.

### Finite representatives in the divisibility colimit

TauCeti.RootStack.divisibilityAffineColimit.exists_level — Every x∈C_div equals κ_n(y) for some positive index n and y∈B_n.

Proof outline. Use the actual quotient representative theorem and identify its quotient constructor with κ_n.

### Maps determined on every finite root

TauCeti.RootStack.divisibilityAffineColimit.hom_ext — For any commutative A-algebra C, two A-algebra maps g,h:C_div→C agree if g(v_n)=h(v_n) for every positive n.

Proof outline. Apply native direct-limit extensionality to each component homomorphism. At each component apply native AdjoinRoot algebra-map extensionality on its distinguished root.

### Divisibility colimit to factorial colimit

TauCeti.RootStack.divisibilityToFactorial — Construct α:C_div→C_f by the native algebra lift of the compatible family e_n. It is characterized by α(κ_n(x))=e_n(x) at every positive index.

Proof outline. The extension transition law supplies the native lift’s compatibility field. The native lift evaluation law identifies its values on each component.

The planned API is:

- TauCeti.RootStack.divisibilityToFactorial (constructor): Construct α:C_div→C_f by the native algebra lift of the compatible family e_n. It is characterized by α(κ_n(x))=e_n(x) at every positive index.
- TauCeti.RootStack.divisibilityToFactorial.inclusion (simp): For every positive n and x∈B_n, α(κ_n(x))=e_n(x).
- TauCeti.RootStack.divisibilityToFactorial.left_inverse (compatibility): The factorial-to-divisibility map composed with α is the identity on C_div.
- TauCeti.RootStack.divisibilityToFactorial.right_inverse (compatibility): α composed with the factorial-to-divisibility map is the identity on C_f.

The unit tests are:

- divisibilityToFactorial.test_three (computation): The index-3 root maps to the square of the factorial index-6 root.
- divisibilityToFactorial.test_coefficients (compatibility): Over Z/4Z, α preserves every coefficient for arbitrary f.
- divisibilityToFactorial.test_factorial (characterisation): At each actual factorial index d_i, α carries its entire finite chart exactly to ι_i.

### Factorial colimit to divisibility colimit

TauCeti.RootStack.factorialToDivisibility — Construct β:C_f→C_div by the native algebra lift of the finite-chart insertions κ_(d_i). It satisfies β(ι_i(x))=κ_(d_i)(x).

Proof outline. The factorial divisibility and κ transition laws make this family compatible. Apply the existing native algebra lift and its component evaluation law.

The planned API is:

- TauCeti.RootStack.factorialToDivisibility (constructor): Construct β:C_f→C_div by the native algebra lift of the finite-chart insertions κ_(d_i). It satisfies β(ι_i(x))=κ_(d_i)(x).
- TauCeti.RootStack.factorialToDivisibility.inclusion (simp): For every i and x∈B_(d_i), β(ι_i(x))=κ_(d_i)(x).
- TauCeti.RootStack.divisibilityToFactorial.right_inverse (compatibility): The actual map α is a left inverse of β on every element of C_f.

The unit tests are:

- factorialToDivisibility.test_root (computation): The factorial index-2 root maps to the same root in the all-positive index-2 chart.
- factorialToDivisibility.test_coefficients (compatibility): Over Z/4Z, β preserves every coefficient for arbitrary f.
- factorialToDivisibility.test_zero (degenerate): For the zero coefficient ring, β sends zero to zero.

### Return to the divisibility colimit

TauCeti.RootStack.divisibilityToFactorial.left_inverse — For every x∈C_div, β(α(x))=x.

Proof outline. Write x=κ_n(y). The two lift evaluation laws identify its image as κ_(d_(n.exponent))(j_(n,d_(n.exponent))(y)). The actual all-divisibility insertion transition law gives κ_n(y).

### Return to the factorial colimit

TauCeti.RootStack.divisibilityToFactorial.right_inverse — For every x∈C_f, α(β(x))=x.

Proof outline. Write x=ι_i(y). Evaluate both lifts and use e_(d_i)=ι_i.

### Factorial and divisibility chart comparison

TauCeti.RootStack.divisibilityFactorialEquiv — The actual A-algebras C_div and C_f are canonically equivalent. Its forward map is α and its inverse is β, with the finite-coordinate formulas specified below.

Proof outline. Turn the two actual algebra maps and both inverse equations into the native AlgEquiv. Do not identify coherent root-object groupoids or an fpqc quotient from an algebra equivalence alone.

The planned API is:

- TauCeti.RootStack.divisibilityFactorialEquiv (constructor): The actual A-algebras C_div and C_f are canonically equivalent. Its forward map is α and its inverse is β, with the finite-coordinate formulas specified below.
- TauCeti.RootStack.divisibilityFactorialEquiv.inclusion (compatibility): For n dividing d_i and x∈B_n, the equivalence sends κ_n(x) to ι_i(j_(n,d_i)(x)).
- TauCeti.RootStack.divisibilityFactorialEquiv.root (simp): For n dividing d_i, the equivalence sends v_n to u_i^(d_i/n), where u_i=ι_i(t_(d_i)).

The unit tests are:

- divisibilityFactorialEquiv.test_three (computation): The nonfactorial index-3 root maps to the square of the factorial index-6 root.
- divisibilityFactorialEquiv.test_coefficients (compatibility): Over Z/4Z, the actual equivalence preserves every coefficient for arbitrary parameter f.
- divisibilityFactorialEquiv.test_inverse (characterisation): Applying the inverse equivalence after the forward equivalence gives every original element of C_div.

### Comparison at any factorial multiple

TauCeti.RootStack.divisibilityFactorialEquiv.inclusion — For any positive n, any i with n dividing d_i, and x∈B_n, the equivalence sends κ_n(x) to ι_i(j_(n,d_i)(x)).

Proof outline. Evaluate α on κ_n(x), then use the independent-factorial-multiple law.

### Explicit root-coordinate comparison

TauCeti.RootStack.divisibilityFactorialEquiv.root — For any positive n dividing d_i, the actual comparison sends v_n to u_i^(d_i/n).

Proof outline. Apply the finite-chart comparison to t_n, evaluate the actual divisibility map on its root, and use preservation of powers.

### All-positive root power relation

TauCeti.RootStack.divisibilityAffineInclusion.pow — For every positive n, v_n^n=algebraMap(A,C_div)(f).

Proof outline. Transport the existing native finite root relation through the actual insertion.

### All-positive root transition relation

TauCeti.RootStack.divisibilityAffineInclusion.root — For positive n dividing N, v_n=v_N^(N/n).

Proof outline. Rewrite v_n through the actual insertion transition, evaluate the finite root transition and preserve powers.

## Earlier checkpoints and their historical receipts

The earlier reader is preserved below. Its checkpoint counts and open-leaf descriptions are historical; the comparison and current counts above supersede those statements for this continuation. Other source and supplier obligations retain their original provenance.

# Factorial root chart colimit

For a commutative ring A and f∈A, write B_n=A[t_n]/(t_nⁿ−f) and d_i=(i+1)!. The factorial diagram has maps B_(d_i)→B_(d_j) sending t_(d_i) to t_(d_j)^(d_j/d_i). Its colimit C_f is the actual native algebra direct limit. The canonical A-algebra inclusions ι_i:B_(d_i)→C_f form a specified colimit cocone on the existing factorial functor. The point isomorphism and leg formulas keep the precise carriers visible in the planning API.

Every finite insertion is injective. Indeed, a divisibility map B_n→B_N is the earlier faithfully flat transition after writing N=nm; the native faithful scalar action makes that map injective. Mathlib's directed-limit insertion criterion then applies. Thus, for A=F₂ and f=0, the element ι_1(t₂) is nonzero and has square zero. Passing to the infinite chart does not remove finite-level nilpotents. The construction includes the zero ring.

Put u_i=ι_i(t_(d_i)). These elements satisfy u_i^(d_i)=f and u_i=u_j^(d_j/d_i) for i≤j. Every element of C_f comes from a finite level, and an A-algebra map out of C_f is determined by its values on all u_i. More precisely, a compatible family r_i in a commutative A-algebra C with those power equations determines a unique A-algebra map C_f→C. The construction uses finite AdjoinRoot lifts and the existing native algebra direct-limit lift. Its API gives root evaluation, uniqueness and compatibility with postcomposition.

This is the algebraic input to the local chart construction in [Talpo–Vistoli, Section 3.1](https://arxiv.org/pdf/1410.1164v2), specialized to one generator. Comparison with the colimit over every positive divisibility index, coherent reindexing of root-object groupoids, the diagonalizable grading, Spec-limit transport and fpqc torsor/quotient comparisons remain separate obligations. These thirteen leaves refine the existing infinite-affine-quotient proof without changing its statement. The source's reduced-fibre discussion on printed p.17 motivates keeping nilpotents visible; the explicit F₂ computation here is an authored test.

The packet has 194 unchecked nodes, 152 API records (150 on definitions/constructions), 170 test records (146 on definitions/constructions), 171 baseline declarations and 39 planets. All 181 inherited statement contracts and 180 entire node objects are retained. All ten stages remain partial, with the same eight gaps and thirteen supplier requests. Neither routed paper inventory nor root-stack ownership changes. The roadmap definition and the earlier reader below are retained.

The reviewed FA.0–FA.7 library audit and REV-AUDIT-20 are the ownership baseline: existing function-field algebra is imported, while its adelic/class-field and curve-side gaps are not replanned here. Generic colimits are already in Mathlib. A bounded upstream search found [Mathlib PR #39341](https://github.com/leanprover-community/mathlib4/pull/39341), which adds star-algebra variants of the existing direct-limit API; it supplies no additional ordinary-algebra prerequisite here. The [Zulip discussion of DirectLimit and categorical colimits](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Q.2FZ.20as.20colimit.20of.20Z.2FnZ.html) supports making the categorical comparison explicit. No external implementation is copied.

The separate native proof file passes 95 examples and 86 axiom audits, with no errors, admissions or warnings. The Mathlib-only extraction of the submitted signatures passes 95 examples with 222 admission warnings and no others. The complete geometric suggested file is uncompiled because the existing pinned build lacks required Tau Ceti modules. The [handoff](../handoff/DESIGN-FunctionFieldArithmeticPartII.md) gives the exact archive, hashes, recovery commands and graph checks. Proof evidence does not change the packet's unchecked statuses.

## Added declaration plans

### Factorial root chart colimit

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit. Proposed name: TauCeti.RootStack.FactorialAffineColimit. Kind: construction.

Construct the A-algebra C_f=colim_i B_(d_i) of the factorial divisibility maps. Use the native directed algebra limit with its inherited commutative ring and A-algebra instances. Its transition adapter sends t_(d_i) to t_(d_j)^(d_j/d_i) and fixes A. Identity and composition are the actual directed-system equations.

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-identity, FunctionFieldArithmeticPartII:RS.2/affine-divisibility-composition, mathlib:DirectedSystem, mathlib:DirectLimit, mathlib:Nat.factorial_dvd_factorial, mathlib:Nat.factorial_ne_zero.

Construction or proof:

1. Specialize the fixed-index maps to factorial exponents; their identity and composition give the native DirectedSystem.
2. Instantiate the existing DirectLimit commutative-ring and algebra structures. Do not define a second generic limit.

API:

- TauCeti.RootStack.FactorialAffineColimit (constructor): Construct the A-algebra C_f=colim_i B_(d_i) of the factorial divisibility maps. Use the native directed algebra limit with its inherited commutative ring and A-algebra instances. Its transition adapter sends t_(d_i) to t_(d_j)^(d_j/d_i) and fixes A. Identity and composition are the actual directed-system equations.
- TauCeti.RootStack.factorialAffineMap (functoriality): The exact factorial transition adapter is the previously specified divisibility map with source B_(d_i) and target B_(d_j).
- TauCeti.RootStack.factorialAffineDirected (compatibility): The native directed-system instance has the actual identity and composition equations of these maps.
- TauCeti.RootStack.factorialAffineColimit.exists_level (extensionality): Every x∈C_f equals ι_i(y) for some i and some y∈B_(d_i).
- TauCeti.RootStack.factorialAffineColimit.hom_ext (extensionality): For any commutative A-algebra C and A-algebra homomorphisms g,h:C_f→C, equality g(u_i)=h(u_i) for every i implies g=h.

Unit tests:

- factorialAffineColimit.test_wild_nonzero (non-example): For A=F_2 and f=0, ι_1(t_2) is nonzero. A construction replacing the charts by their reductions fails.
- factorialAffineColimit.test_wild_square (computation): The same element ι_1(t_2) over F_2 with f=0 has square zero, so the infinite chart retains a nonzero nilpotent.
- factorialAffineColimit.test_zeroRing (degenerate): For A=Z/1Z and f=0 every element of C_f is zero; no nontrivial-ring hypothesis is added.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Finite root charts inside the colimit

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion. Proposed name: TauCeti.RootStack.factorialAffineInclusion. Kind: construction.

For every i construct the canonical A-algebra homomorphism ι_i:B_(d_i)→C_f from the native direct-limit insertion. It preserves coefficients and all ring operations.

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit, mathlib:DirectLimit.Algebra.of.

Construction or proof:

1. Apply the native algebra direct-limit insertion on the exact finite root carrier.

API:

- TauCeti.RootStack.factorialAffineInclusion (constructor): For every i construct the canonical A-algebra homomorphism ι_i:B_(d_i)→C_f from the native direct-limit insertion. It preserves coefficients and all ring operations.
- TauCeti.RootStack.factorialAffineInclusion.transition (compatibility): For i≤j and x∈B_(d_i), ι_j(j_(d_i,d_j)(x))=ι_i(x), with the fixed-index divisibility transition.
- TauCeti.RootStack.factorialAffineInclusion.root (simp): For i≤j put u_i=ι_i(t_(d_i)); then u_i=u_j^(d_j/d_i).
- TauCeti.RootStack.factorialAffineInclusion.pow (simp): For every i the distinguished element u_i satisfies u_i^(d_i)=algebraMap(A,C_f)(f).
- TauCeti.RootStack.factorialAffineInclusion.injective (extensionality): Every insertion ι_i:B_(d_i)→C_f is injective. Thus a nonzero finite-chart nilpotent remains nonzero in C_f.

Unit tests:

- factorialAffineColimit.test_two_to_six (computation): The level-one root ι_1(t_2) equals the cube of the level-two root ι_2(t_6).
- factorialAffineInclusion.test_coefficients (compatibility): For A=Z/4Z, f=2 and every a∈A, ι_1 fixes the coefficient image of a, including nilpotent coefficients.
- factorialAffineColimit.test_wild_nonzero (non-example): The inclusion of the second-root chart over F_2 with f=0 does not kill its nonzero root.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Compatible finite chart inclusions

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-transition. Proposed name: TauCeti.RootStack.factorialAffineInclusion.transition. Kind: lemma.

For i≤j and x∈B_(d_i), ι_j(j_(d_i,d_j)(x))=ι_i(x), with the fixed-index divisibility transition.

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion, mathlib:DirectLimit.Algebra.of_f.

Construction or proof:

1. Use the native equality identifying an element with its transition image in the directed limit.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Compatible roots in the colimit

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-root. Proposed name: TauCeti.RootStack.factorialAffineInclusion.root. Kind: lemma.

For i≤j put u_i=ι_i(t_(d_i)); then u_i=u_j^(d_j/d_i).

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-transition, FunctionFieldArithmeticPartII:RS.2/affine-divisibility-root.

Construction or proof:

1. Apply insertion compatibility to the distinguished root and use the finite root-image formula; algebra homomorphisms preserve powers.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Root equations in the colimit

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-power. Proposed name: TauCeti.RootStack.factorialAffineInclusion.pow. Kind: lemma.

For every i the distinguished element u_i satisfies u_i^(d_i)=algebraMap(A,C_f)(f).

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion, FunctionFieldArithmeticPartII:RS.0/affine-root-relation.

Construction or proof:

1. Move the power through the insertion, apply the finite root equation, and use coefficient compatibility.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Injective root chart transitions

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-injective. Proposed name: TauCeti.RootStack.affineDivisibility.injective. Kind: lemma.

For every pair of positive integers n|N, the actual fixed-index A-algebra map B_n→B_N is injective, including over nonreduced and zero coefficient rings.

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-multiplicative, FunctionFieldArithmeticPartII:RS.2/affine-transition-faithfully-flat, mathlib:Module.FaithfullyFlat.faithfulSMul, mathlib:FaithfulSMul.algebraMap_injective.

Construction or proof:

1. Write N=nm; positivity of N forces m>0. The agreement lemma identifies the actual map with the existing multiplicative transition.
2. Use its actual coefficient algebra and previously established faithful flatness. Import the native faithful-scalar-action instance and injectivity of its algebra map.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Finite root charts embed in the colimit

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-injective. Proposed name: TauCeti.RootStack.factorialAffineInclusion.injective. Kind: lemma.

Every insertion ι_i:B_(d_i)→C_f is injective. Thus a nonzero finite-chart nilpotent remains nonzero in C_f.

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion, FunctionFieldArithmeticPartII:RS.2/affine-divisibility-injective, mathlib:DirectLimit.mk_injective.

Construction or proof:

1. Every factorial transition is injective by the positive divisibility result. Apply the native directed-limit insertion criterion.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Finite-level representatives in the root colimit

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-elements. Proposed name: TauCeti.RootStack.factorialAffineColimit.exists_level. Kind: lemma.

Every x∈C_f equals ι_i(y) for some i and some y∈B_(d_i).

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion, mathlib:DirectLimit.exists_eq_mk.

Construction or proof:

1. The existing representative theorem for the directed quotient supplies the level and element; its quotient insertion is the actual algebra insertion.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Root values determine colimit homomorphisms

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext. Proposed name: TauCeti.RootStack.factorialAffineColimit.hom_ext. Kind: lemma.

For any commutative A-algebra C and A-algebra homomorphisms g,h:C_f→C, equality g(u_i)=h(u_i) for every i implies g=h.

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion, mathlib:DirectLimit.Algebra.hom_ext, mathlib:AdjoinRoot.algHom_ext.

Construction or proof:

1. Native limit extensionality reduces to equality after every finite insertion. Native AdjoinRoot algebra extensionality reduces each resulting equality to its root value.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Root chart colimit cocone

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-cocone. Proposed name: TauCeti.RootStack.factorialAffineCocone. Kind: construction.

Construct a native cocone on the previously specified factorialAffineTower with point C_f and leg ι_i under the specified chart identifications. Supply the chosen point isomorphism with CommAlgCat.of(A,C_f) and the equality between each transported cocone leg and ι_i composed with its finite-level chart.

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-tower, FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-transition, mathlib:CategoryTheory.Limits.Cocone, mathlib:CommAlgCat.of, mathlib:CommAlgCat.ofHom.

Construction or proof:

1. Use the actual commutative-algebra object C_f and native insertions as cocone legs.
2. The existing insertion-transition equation proves naturality for the exact predecessor functor. The point isomorphism and leg equations expose the carrier independently of admitted planning bodies.

API:

- TauCeti.RootStack.factorialAffineCocone (constructor): Construct a native cocone on the previously specified factorialAffineTower with point C_f and leg ι_i under the specified chart identifications. Supply the chosen point isomorphism with CommAlgCat.of(A,C_f) and the equality between each transported cocone leg and ι_i composed with its finite-level chart.
- TauCeti.RootStack.factorialAffineCocone.point (compatibility): The specified native isomorphism identifies the cocone point with CommAlgCat.of(A,C_f).
- TauCeti.RootStack.factorialAffineCocone.leg (compatibility): After that point isomorphism, the ith cocone leg is ι_i composed with the specified finite-level chart.
- TauCeti.RootStack.factorialAffineCocone.isColimit (extensionality): The specified cocone on factorialAffineTower is a colimit in CommAlgCat(A). Its universal map to any cocone is the native direct-limit algebra lift of that cocone’s legs.

Unit tests:

- factorialAffineCocone.test_wild (compatibility): The actual cocone over F_2 with f=0 satisfies the native IsColimit universal property.
- factorialAffineCocone.test_zeroRing (degenerate): The actual cocone over Z/1Z satisfies that universal property too.
- factorialAffineCocone.test_leg (compatibility): At level zero the actual cocone leg through its point identification is exactly ι_0 after its finite chart identification.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Universal factorial root chart cocone

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-cocone-is-colimit. Proposed name: TauCeti.RootStack.factorialAffineCocone.isColimit. Kind: theorem.

The specified cocone on factorialAffineTower is a colimit in CommAlgCat(A). Its universal map to any cocone is the native direct-limit algebra lift of that cocone’s legs.

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-cocone, mathlib:DirectLimit.Algebra.lift, mathlib:DirectLimit.Algebra.hom_ext, mathlib:CategoryTheory.Limits.IsColimit.

Construction or proof:

1. The target cocone naturality equations give the compatibility required by the native algebra lift.
2. The native lift agrees with each finite leg, proving factorization. Native direct-limit algebra extensionality proves uniqueness.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Universal compatible factorial roots

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift. Proposed name: TauCeti.RootStack.factorialAffineRootLift. Kind: construction.

For any commutative A-algebra C and a family r_i∈C satisfying r_i^(d_i)=f and r_j^(d_j/d_i)=r_i for every i≤j, construct the unique A-algebra homomorphism C_f→C carrying u_i to r_i. This is a universal property for actual algebra elements, with coefficients fixed.

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit, FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion, FunctionFieldArithmeticPartII:RS.2/affine-divisibility-root, FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext, mathlib:AdjoinRoot.liftAlgHom, mathlib:AdjoinRoot.algHom_ext, mathlib:DirectLimit.Algebra.lift.

Construction or proof:

1. At level i lift the prescribed root r_i through the actual AdjoinRoot algebra, using its displayed root equation.
2. For i≤j compare the two finite algebra maps by root extensionality; the displayed power-compatibility gives equality.
3. Apply the existing native direct-limit algebra lift. Evaluation and root extensionality give the specified values and uniqueness. Postcomposition follows by the same uniqueness.

API:

- TauCeti.RootStack.factorialAffineRootLift (constructor): For any commutative A-algebra C and a family r_i∈C satisfying r_i^(d_i)=f and r_j^(d_j/d_i)=r_i for every i≤j, construct the unique A-algebra homomorphism C_f→C carrying u_i to r_i. This is a universal property for actual algebra elements, with coefficients fixed.
- TauCeti.RootStack.factorialAffineRootLift.root (simp): The map associated to a compatible root family satisfies lift(r)(ι_i(t_(d_i)))=r_i at every level.
- TauCeti.RootStack.factorialAffineRootLift.unique (extensionality): Any A-algebra homomorphism with all the prescribed root values equals the constructed lift.
- TauCeti.RootStack.factorialAffineRootLift.postcomp (functoriality): Postcomposing the universal lift with an A-algebra map k:C→D equals the lift of the family k(r_i), with its induced power equations and compatibility.

Unit tests:

- factorialAffineRootLift.test_one (computation): For A=C=Z, f=1 and r_i=1, the universal lift sends the level-two root to 1.
- factorialAffineRootLift.test_zero (computation): For A=C=F_2, f=0 and r_i=0, the lift sends ι_1(t_2) to 0. This evaluation may kill a nilpotent even though the finite insertion is injective.
- factorialAffineRootLift.test_identity (compatibility): The lift of the universal family u_i, with its proved power and compatibility equations, is the identity A-algebra homomorphism of C_f.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

### Evaluation of the universal compatible roots

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift-root. Proposed name: TauCeti.RootStack.factorialAffineRootLift.root. Kind: lemma.

The map associated to a compatible root family satisfies lift(r)(ι_i(t_(d_i)))=r_i at every level.

Hypotheses: A is any commutative ring, f∈A, B_n=A[T]/(T^n−f), and d_i=(i+1)! for i∈N. Every exponent in a divisibility transition is positive. No reducedness, Noetherian, unit-parameter or invertible-exponent hypothesis is used.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift, mathlib:AdjoinRoot.liftAlgHom_root.

Construction or proof:

1. The direct-limit lift evaluated on an insertion is the corresponding finite quotient lift; apply the native lift-root computation.

Acceptance: Use the actual AdjoinRoot algebras, their coefficient actions and Mathlib DirectLimit. Retain the zero ring and wild nilpotents. The colimit of chart algebras does not itself identify the coherent root-object groupoids, grading action or fpqc quotient. Those existing obligations remain.

---

The following retained reader records its earlier checkpoints; the current counts and continuation are above.

## Current checkpoint: factorial affine root algebra diagram

Codex — codex-J6LwjP, 2026-10-02, issue #3403. The current packet contains 181 unchecked proposed nodes: 9 definitions, 30 constructions, 95 lemmas, 36 theorems, 10 comparisons and 1 application. It has 134 API records (132 required definition/construction records), 158 tests (134 required definition/construction tests), 159 baseline entries and 39 planets. All ten stages remain partial; the eight gaps and thirteen supplier requests remain unchanged.

For any commutative ring A and any f∈A, put B_n=A[t_n]/(t_nⁿ−f). Positive indices n|N give an actual A-algebra map B_n→B_N, sending t_n to t_N^(N/n). Using fixed indices avoids choosing transports between quotient carriers. The native quotient lift fixes coefficients, is characterized by its root image, is the identity when n=N, and composes exactly for n|N|K. At N=nm it equals the previously planned finite-free transition. The prior finite-basis and faithful-flatness results are retained; they are not new declarations in this checkpoint.

The resulting genuine functor from the natural-number preorder category to CommAlgCat(A) has level i equal to B_((i+1)!). Its native identity and composition fields are proved in the separate checked prototype. A specified A-algebra chart equivalence exposes each carrier in the planning signatures; the root and coefficient formulas are stated through that equivalence. The infinite-affine-quotient node consumes this diagram as one input. Cofinal reindexing of coherent root-object groupoids, the graded colimit and the fpqc quotient/torsor comparisons remain separate obligations.

The eight added RS.2 nodes are the divisibility-map construction, its root formula, identity, composition and agreement with multiplicative transitions, followed by the factorial diagram construction and its root and coefficient formulas. Their companion packet gives the exact hypotheses, imports and proof steps. The two constructions expose eleven API items altogether. Eight additional tests cover the identity, 2-to-4 root image, all coefficients over Z/4Z, the first factorial level, 2!-to-3!, composition through 4!, a nonzero nilpotent image over F_2 with f=0, and the zero ring. The nilpotent test distinguishes this actual quotient map from one that wrongly kills nilpotents.

All 173 inherited statement contracts and 172 entire node objects are preserved. The one changed old object, infinite-affine-quotient, gains the new diagram prerequisite and an explicit explanation of the remaining geometric comparisons. Existing APIs, tests, hypotheses, acceptances, source routes, ownership and planets are retained. The earlier reader below is preserved verbatim and describes its own historical checkpoint.

Fresh source reading covers Talpo–Vistoli's root transition setup and factorial cofinal-system construction on printed pp.12–14 of arXiv:1410.1164v2, and the local chart setup and full Lemma 3.7 proof on p.15. The rank-one native algebra functor is an authored specialization, not a printed geometric comparison theorem. Earlier whole-paper and erratum receipts remain credited to their original workers.

The separate native prototype passes with 84 proved examples and 71 axiom audits, without errors, warnings or admissions. The Mathlib-only extraction of the submitted signatures passes with 84 examples and 193 admission warnings. The complete geometric suggested file is uncompiled because the shared exact-pin build lacks required Tau Ceti imports. No status is promoted to implemented. The handoff provides immutable source receipts and reproducible extraction/assembly instructions.

### Added RS.2 declaration plans

#### Affine transitions at fixed divisibility indices

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-divisibility. Proposed name: TauCeti.RootStack.affineDivisibility. Kind: construction.

For positive n,N with h:n divides N, construct the actual A-algebra map B_n→B_N sending t_n to t_N^(N/n), on the native AdjoinRoot quotients. Its target is B_N itself, so its identity and composition need no quotient-carrier transports.

Hypotheses: A is any commutative ring and f∈A; every divisibility exponent n,N,K is positive. Factorial levels are (i+1)! for i∈N, so none is zero. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-root-relation, mathlib:AdjoinRoot.liftAlgHom.

Construction or proof:

1. The exact divisibility identity (N/n)n=N makes the proposed root image solve T^n−f in B_N.
2. Use the native quotient algebra lift, which fixes every A coefficient.

Uses:

- FunctionFieldArithmeticPartII:RS.2/factorial-affine-tower — Use exact factorial source/target carriers, with native identity/composition and no transport choices.
- FunctionFieldArithmeticPartII:RS.2/affine-divisibility-multiplicative — Retain agreement with the finite-free multiplicative chart transition.

API:

- TauCeti.RootStack.affineDivisibility (constructor): For positive n,N with h:n divides N, construct the actual A-algebra map B_n→B_N sending t_n to t_N^(N/n), on the native AdjoinRoot quotients. Its target is B_N itself, so its identity and composition need no quotient-carrier transports.
- TauCeti.RootStack.affineDivisibility.root (simp): The actual divisibility map sends the distinguished root t_n exactly to t_N^(N/n).
- TauCeti.RootStack.affineDivisibility.constant (compatibility): The actual map fixes every coefficient from A.
- TauCeti.RootStack.affineDivisibility.unique (extensionality): An A-algebra homomorphism with the specified root image equals the actual fixed-index transition.
- TauCeti.RootStack.affineDivisibility.identity (simp): For every positive n the native map B_n→B_n is exactly the identity A-algebra homomorphism.
- TauCeti.RootStack.affineDivisibility.composition (functoriality): For positive n dividing N dividing K, the actual composite B_n→B_N→B_K equals the native B_n→B_K map on exactly the same carriers.
- TauCeti.RootStack.affineDivisibility.multiplicative (compatibility): At N=nm the fixed-index map B_n→B_(nm) equals the previously specified actual affine transition j_(n,m).

Unit tests:

- affineDivisibilityTests.identity (degenerate): At equal positive indices the exact map is the native identity algebra homomorphism.
- affineDivisibilityTests.fourToTwo (computation): At 2 dividing 4 the actual image of t_2 is t_4 squared.
- affineDivisibilityTests.coefficients (compatibility): Over Z/4Z, the 2-to-6 map fixes every coefficient, including nilpotent coefficients.

Acceptance: Use actual AdjoinRoot and native algebra-category carriers; the maps preserve nilpotents and all coefficients. This constructs a chart algebra diagram only. The root-object groupoids, factorial cofinality equivalence and infinite affine fpqc quotient retain their independent geometric/coherence obligations.

Source: TV17, Proposition 3.2 and divisibility maps, printed p.13; Proposition 3.5 and Remark 3.6, p.14; rank-one affine chart specialization. Authored rank-one quotient-algebra specialization of the transition and cofinal-system constructions. The native factorial algebra functor is constructed here, not a printed theorem about Lean carriers or a claimed geometric two-limit comparison.

#### Root image of a divisibility transition

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-root. Proposed name: TauCeti.RootStack.affineDivisibility.root. Kind: lemma.

The actual divisibility map sends the distinguished root t_n exactly to t_N^(N/n).

Hypotheses: A is any commutative ring and f∈A; every divisibility exponent n,N,K is positive. Factorial levels are (i+1)! for i∈N, so none is zero. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-divisibility.

Construction or proof:

1. Apply the native lift-root computation.

Acceptance: Use actual AdjoinRoot and native algebra-category carriers; the maps preserve nilpotents and all coefficients. This constructs a chart algebra diagram only. The root-object groupoids, factorial cofinality equivalence and infinite affine fpqc quotient retain their independent geometric/coherence obligations.

Source: TV17, Proposition 3.2 and divisibility maps, printed p.13; Proposition 3.5 and Remark 3.6, p.14; rank-one affine chart specialization. Authored rank-one quotient-algebra specialization of the transition and cofinal-system constructions. The native factorial algebra functor is constructed here, not a printed theorem about Lean carriers or a claimed geometric two-limit comparison.

#### Identity of a divisibility transition

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-identity. Proposed name: TauCeti.RootStack.affineDivisibility.identity. Kind: lemma.

For every positive n the native map B_n→B_n is exactly the identity A-algebra homomorphism.

Hypotheses: A is any commutative ring and f∈A; every divisibility exponent n,N,K is positive. Factorial levels are (i+1)! for i∈N, so none is zero. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-root, mathlib:AdjoinRoot.algHom_ext.

Construction or proof:

1. Since n>0, n/n=1. Both maps fix coefficients and send t_n to t_n.
2. Apply native quotient extensionality.

Acceptance: Use actual AdjoinRoot and native algebra-category carriers; the maps preserve nilpotents and all coefficients. This constructs a chart algebra diagram only. The root-object groupoids, factorial cofinality equivalence and infinite affine fpqc quotient retain their independent geometric/coherence obligations.

Source: TV17, Proposition 3.2 and divisibility maps, printed p.13; Proposition 3.5 and Remark 3.6, p.14; rank-one affine chart specialization. Authored rank-one quotient-algebra specialization of the transition and cofinal-system constructions. The native factorial algebra functor is constructed here, not a printed theorem about Lean carriers or a claimed geometric two-limit comparison.

#### Composition at fixed root indices

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-composition. Proposed name: TauCeti.RootStack.affineDivisibility.composition. Kind: lemma.

For positive n dividing N dividing K, the actual composite B_n→B_N→B_K equals the native B_n→B_K map on exactly the same carriers.

Hypotheses: A is any commutative ring and f∈A; every divisibility exponent n,N,K is positive. Factorial levels are (i+1)! for i∈N, so none is zero. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-root, mathlib:Nat.div_mul_div, mathlib:AdjoinRoot.algHom_ext.

Construction or proof:

1. Compute the composite root image as t_K^((K/N)(N/n)).
2. The imported exact-divisibility identity gives (K/N)(N/n)=K/n. Apply native quotient extensionality.

Acceptance: Use actual AdjoinRoot and native algebra-category carriers; the maps preserve nilpotents and all coefficients. This constructs a chart algebra diagram only. The root-object groupoids, factorial cofinality equivalence and infinite affine fpqc quotient retain their independent geometric/coherence obligations.

Source: TV17, Proposition 3.2 and divisibility maps, printed p.13; Proposition 3.5 and Remark 3.6, p.14; rank-one affine chart specialization. Authored rank-one quotient-algebra specialization of the transition and cofinal-system constructions. The native factorial algebra functor is constructed here, not a printed theorem about Lean carriers or a claimed geometric two-limit comparison.

#### Agreement with multiplicative root transitions

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-multiplicative. Proposed name: TauCeti.RootStack.affineDivisibility.multiplicative. Kind: lemma.

At N=nm the fixed-index map B_n→B_(nm) equals the previously specified actual affine transition j_(n,m).

Hypotheses: A is any commutative ring and f∈A; every divisibility exponent n,N,K is positive. Factorial levels are (i+1)! for i∈N, so none is zero. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-root, FunctionFieldArithmeticPartII:RS.2/affine-transition-root, mathlib:AdjoinRoot.algHom_ext.

Construction or proof:

1. Use n>0 to compute nm/n=m, compare the exact root images and apply native quotient extensionality.

Acceptance: Use actual AdjoinRoot and native algebra-category carriers; the maps preserve nilpotents and all coefficients. This constructs a chart algebra diagram only. The root-object groupoids, factorial cofinality equivalence and infinite affine fpqc quotient retain their independent geometric/coherence obligations.

Source: TV17, Proposition 3.2 and divisibility maps, printed p.13; Proposition 3.5 and Remark 3.6, p.14; rank-one affine chart specialization. Authored rank-one quotient-algebra specialization of the transition and cofinal-system constructions. The native factorial algebra functor is constructed here, not a printed theorem about Lean carriers or a claimed geometric two-limit comparison.

#### Factorial diagram of native root algebras

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-tower. Proposed name: TauCeti.RootStack.factorialAffineTower. Kind: construction.

Construct a genuine native functor from the natural-number preorder category to CommAlgCat(A). Level i is the actual root algebra B_((i+1)!). Its map i≤j is the fixed-index divisibility transition. Supply the specified A-algebra chart equivalence at every level and exact root/coefficient map laws; identity and composition are proved fields of the native functor.

Hypotheses: A is any commutative ring and f∈A; every divisibility exponent n,N,K is positive. Factorial levels are (i+1)! for i∈N, so none is zero. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-divisibility-identity, FunctionFieldArithmeticPartII:RS.2/affine-divisibility-composition, mathlib:Nat.factorial_dvd_factorial, mathlib:Nat.factorial_ne_zero, mathlib:CommAlgCat, mathlib:CommAlgCat.of, mathlib:CommAlgCat.ofHom, mathlib:CommAlgCat.hom_ext, mathlib:CategoryTheory.Functor, mathlib:CategoryTheory.leOfHom.

Construction or proof:

1. Native factorial nonvanishing supplies the exact positive-exponent instances.
2. Bundle B_((i+1)!) as the existing commutative-algebra category object. Extract i≤j from the native preorder morphism, and factorial divisibility supplies the exact root map.
3. The native identity and fixed-index composition lemmas prove the functor fields.
4. The specified chart equivalence is the actual identity equivalence in the proof model. Its separate signature exposes the exact carriers even when the planning functor body is admitted.

Uses:

- FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient — Supply the actual factorial affine algebra diagram whose colimit gives the affine-chart input after the separate cofinality and grading/quotient comparisons.

API:

- TauCeti.RootStack.factorialAffineTower (constructor): Construct a genuine native functor from the natural-number preorder category to CommAlgCat(A). Level i is the actual root algebra B_((i+1)!). Its map i≤j is the fixed-index divisibility transition. Supply the specified A-algebra chart equivalence at every level and exact root/coefficient map laws; identity and composition are proved fields of the native functor.
- TauCeti.RootStack.factorialAffineTower.chart (compatibility): The specified actual A-algebra equivalence from the native functor object at i to B_((i+1)!) fixes its chosen chart carrier.
- TauCeti.RootStack.factorialAffineTower.root (simp): After transporting through the specified chart equivalences, the map i≤j sends t_((i+1)!) to t_((j+1)!)^((j+1)!/(i+1)!).
- TauCeti.RootStack.factorialAffineTower.constant (compatibility): Under the specified native chart identifications, every factorial transition fixes the image of each a∈A.

Unit tests:

- factorialAffineTowerTests.firstLevel (degenerate): The actual level-zero functor object is the native first-root algebra B_1.
- factorialAffineTowerTests.twoToSix (computation): The 2!-to-3! root image is exactly t_6 cubed, through the specified chart equivalences.
- factorialAffineTowerTests.composite (compatibility): Composing the 2!-to-3! and 3!-to-4! maps sends t_2 to t_24 to the twelfth power.
- factorialAffineTowerTests.wildNilpotent (non-example): Over F_2 with f=0 the 2!-to-3! root image t_6 cubed is nonzero, despite being nilpotent. A map killing nilpotents fails.
- factorialAffineTowerTests.zeroRing (degenerate): Over Z/1Z, every mapped element transports to zero in the actual target chart, with no nontrivial-ring hypothesis.

Acceptance: Use actual AdjoinRoot and native algebra-category carriers; the maps preserve nilpotents and all coefficients. This constructs a chart algebra diagram only. The root-object groupoids, factorial cofinality equivalence and infinite affine fpqc quotient retain their independent geometric/coherence obligations.

Source: TV17, Proposition 3.2 and divisibility maps, printed p.13; Proposition 3.5 and Remark 3.6, p.14; rank-one affine chart specialization. Authored rank-one quotient-algebra specialization of the transition and cofinal-system constructions. The native factorial algebra functor is constructed here, not a printed theorem about Lean carriers or a claimed geometric two-limit comparison.

#### Factorial transition root formula

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-tower-root. Proposed name: TauCeti.RootStack.factorialAffineTower.root. Kind: lemma.

After transporting through the specified chart equivalences, the map i≤j sends t_((i+1)!) to t_((j+1)!)^((j+1)!/(i+1)!).

Hypotheses: A is any commutative ring and f∈A; every divisibility exponent n,N,K is positive. Factorial levels are (i+1)! for i∈N, so none is zero. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-tower, FunctionFieldArithmeticPartII:RS.2/affine-divisibility-root, mathlib:CategoryTheory.homOfLE.

Construction or proof:

1. Use the actual chart identifications and apply the native fixed-index root computation.

Acceptance: Use actual AdjoinRoot and native algebra-category carriers; the maps preserve nilpotents and all coefficients. This constructs a chart algebra diagram only. The root-object groupoids, factorial cofinality equivalence and infinite affine fpqc quotient retain their independent geometric/coherence obligations.

Source: TV17, Proposition 3.2 and divisibility maps, printed p.13; Proposition 3.5 and Remark 3.6, p.14; rank-one affine chart specialization. Authored rank-one quotient-algebra specialization of the transition and cofinal-system constructions. The native factorial algebra functor is constructed here, not a printed theorem about Lean carriers or a claimed geometric two-limit comparison.

#### Factorial transitions preserve coefficients

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-affine-tower-constant. Proposed name: TauCeti.RootStack.factorialAffineTower.constant. Kind: lemma.

Under the specified native chart identifications, every factorial transition fixes the image of each a∈A.

Hypotheses: A is any commutative ring and f∈A; every divisibility exponent n,N,K is positive. Factorial levels are (i+1)! for i∈N, so none is zero. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-affine-tower, mathlib:CategoryTheory.homOfLE.

Construction or proof:

1. The inverse chart equivalence, actual algebra homomorphism and chart equivalence all commute with their A-algebra coefficient maps.

Acceptance: Use actual AdjoinRoot and native algebra-category carriers; the maps preserve nilpotents and all coefficients. This constructs a chart algebra diagram only. The root-object groupoids, factorial cofinality equivalence and infinite affine fpqc quotient retain their independent geometric/coherence obligations.

Source: TV17, Proposition 3.2 and divisibility maps, printed p.13; Proposition 3.5 and Remark 3.6, p.14; rank-one affine chart specialization. Authored rank-one quotient-algebra specialization of the transition and cofinal-system constructions. The native factorial algebra functor is constructed here, not a printed theorem about Lean carriers or a claimed geometric two-limit comparison.

---

# Global function fields, reciprocity and automorphic foundations, Part II: root stacks and ramified geometric class field theory

This roadmap begins with FunctionFieldArithmetic’s arithmetic reciprocity and constructs its geometric rank-one refinement. Its principal output is a multiplicative local system on every degree of the Picard stack with square-root ramification. For a geometrically connected double cover, the Frobenius trace of that sheaf is the quadratic idele class character. The construction also gives the local systems on symmetric powers and on the entire hat section spaces needed by Yun–Zhang’s ramified comparison. Their matrix stacks, relative trace formula and cycle-intersection identities remain with ShtukaSpecialCyclesAndHigherSiegelWeil.

The reusable foundation is the canonical finite and infinite root-stack API. Its owner is **FunctionFieldArithmeticPartII:key/root-stacks**. The definition is general in the exponent and in the line bundle with section; it is not restricted to square roots over finite fields. Bresciani’s roots of a DVR and the infinite reduced gerbe use the same construction. General quotient stacks, representability, atlases, ordinary Picard geometry and the scheme/function-field dictionary are imported from their existing owners. The roadmap does not create a second line-bundle category, Picard functor, adele ring or arithmetic reciprocity map.

The issue contains a second paper brief: Abdurrahman–Venkatesh’s central values of symplectic L-functions modulo squares. Its everywhere-unramified higher-rank systems, Hurwitz-stack argument and Hilbert–Siegel slicing do not consume the rank-one character-sheaf endpoint here. The packet therefore proposes the sibling SymplecticLFunctionsModSquares, with every one of its 38 routed items assigned below. This follows the issue’s instruction to plan the first independent direction and record a restructuring for the other. Neither route loses its parent or its existing suppliers.

## Conventions and source boundary

For RS.0–RS.2, n is a positive integer and the base is a scheme, or a stack when explicitly stated. Finite roots have effective fpqc descent and their usual fppf description, including characteristic dividing n. Infinite roots and torsors use the fpqc topology. A line bundle means the pinned native invertible sheaf; its full category includes arbitrary module maps, so root-object arrows must be isomorphisms. Tensor powers have fixed parentheses and coherent reassociation maps. A root of (L,s) is a triple (M,t,φ) with φ:Mⁿ≅L and φ(tⁿ)=s, including zero sections. The construction is relative over the actual base stack. Its n=1 specialization over BG is BG itself, not its coarse point.

The affine chart is [Spec A[t]/(tⁿ−f)/μ_n]. Its full closed fibre over f=0 retains tⁿ=0. Its reduced fibre is the classifying gerbe Bμ_n. These must remain distinct under nonreduced base changes. The diagonalizable action is evaluated on every A-algebra; geometric-point roots of unity alone lose μ_p in characteristic p. The section-invertible locus gives the original base even if p divides n. A characteristic-dividing exponent obstructs the DM condition at a genuine branch point, not on an empty divisor. For a stack base the projection is a relative coarse morphism; an absolute coarse algebraic space is a different construction.

The infinite root stack is an fpqc stack formed as a two-limit of the finite stacks along divisibility transitions. A compatible family includes transition isomorphisms and cocycles. It is not the inverse limit of their isomorphism-class sets, and it is not asserted to be an algebraic stack of finite type. The reduced DVR fibre is canonically a banded gerbe, while an equivalence with BẐ(1) requires a neutralization. Uniformizer-independent construction and choice of origin in its Kummer classes are separate statements.

For GC.0–GC.6, let k=F_q have characteristic p≠2, X/k be smooth, projective and geometrically connected, R⊂X be a reduced finite divisor, U=X−R, g the curve genus, and ρ=deg R. Over the algebraic closure, ρ counts geometric branch points. It is not the number of closed points over k. Use Q̄ℓ coefficients with ℓ≠p and geometric Frobenius. Rational averaging is available even if ℓ divides d!: finite torsion coefficients would require different invariant and cohomology assertions.

A root-Picard object is (L,K_R,ι:K_R²≅L|_R), without a section. The root-section version adds α_R but still no global section of L. The hat symmetric space additionally carries a global section a with ι(α_R²)=a|_R. Its effective open requires a to be nonzero on every geometric fibre. A nonzero element of a global section group over a general base is not enough. Negative Picard degrees are included; effective symmetric powers use d≥0. No rational point of degree one is chosen to identify Pic^d with Pic^0.

The character-sheaf input is any rank-one local system on the root curve, equivalently a tame system on U with inertia of order dividing two. Its global character need not be quadratic: an unramified character of order three is a decisive test. Quadratic monodromy appears only after specializing to a geometrically connected double cover. The symmetric local system L_d is unshifted and lies in ordinary cohomological degree zero; L_d[d] is the perverse normalization. Koszul signs occur when taking symmetric invariants of degree-one cohomology, not in the symmetry of degree-zero tensor lines.

The inherited reading receipt records every proof in Yun–Zhang’s Appendix A, pp. 514–526, for the first route. The published page images at 515, 519, 521 and 523 were checked against the extracted formulas. AGV Appendix B supplies the finite root universal property; Talpo–Vistoli §3 supplies divisibility transitions and infinite roots; the single-divisor specialization avoids constructing the general logarithmic theory. Bresciani’s version of record supplies the finite/infinite DVR interfaces. The AV primary reading establishes the separation and proof architecture, but is not a claimed proof reading of all §§3–6 and Appendix D. Source URLs, versions, read sections and hashes are recorded in the packet.

## Existing-library and ownership boundary

The Mathlib/Tau Ceti pins are recorded in the packet. Reviewed AUDIT-20 says the parent’s function-field carrier and much of its divisor theory are built, while function-field adeles, reciprocity and the geometric L-function targets are missing. AUDIT-01 distinguishes native line bundles and function-field Riemann–Roch from missing algebraic stacks, Picard schemes and coherent-family Riemann–Roch. Positive baseline claims here come from actual declaration statements, not names in an index. The pinned abstract stack condition is effective pseudofunctor descent; it has no algebraic atlas. The native exterior-power type does not by itself prove the graded cohomology comparison.

D0 supplies ordinary quotient groupoids and two-fibre products; R09.4 supplies finite-quotient algebraicity, R09.5 the coarse universal property, and SF.1 the scheme/affine descent comparisons; SF.3 integrates upstream JacobianChallenge and AlgebraicCurves for ordinary curve/Picard geometry. The parent supplies adeles and arithmetic reciprocity. IG.0–IG.1 supply the scheme fundamental group and tame inertia. Scheme EDC duality is an input, while the coordinated EtaleDualityAndPerverseSheavesPartIIStacks proposal must supply the required tame-DM lisse and sheaf operations. Its provisional stage keys are not registered prerequisites. This packet records that missing interface rather than treating a scheme theorem as a stack theorem.

The older paper extraction assigned generic roots to SF.1. This issue’s explicit reserved key-definition assignment fixes the owner here. The proposed rescope retains SF.1’s foundational stack infrastructure and moves root consumers to RS.0–RS.2. A broad reverse dependency from all of SF.1 to this packet would create a cycle and is not proposed. The unramified YZ17 character and exterior-power routes coalesce with the empty-R specializations here. Ordinary Picard and Jacobian targets remain upstream.

## Proof structure and acceptance boundaries

The ordered divisor map has nontrivial relative stabilizer at a branch collision: μ₂×μ₂→μ₂ has kernel μ₂. It is not representably finite there. Properness, quasi-finiteness and rational tame-groupoid cohomology are stated in their exact stack setting. The symmetric local system’s collision proof calculates the kernel action on the tensor line before using the perverse extension theorem. That theorem must cover this map, rather than a representably finite substitute.

High-degree descent uses B=ρ+max(2g−1,1). The fixed-object two-fibre of Abel–Jacobi is the scheme M of (a,α_R) satisfying the square equation; after splitting evaluation it is a punctured affine space. Scalar root-Picard automorphisms have weights two on the ordinary kernel coordinates and one on the ρ root-section coordinates. The weighted quotient maps to the moduli space and has the simple-connectivity argument. It is not the fixed-object fibre itself, and punctured affine space is not asserted simply connected in positive characteristic. The empty-R case uses the ordinary weight-one projective quotient.

All-degree extension uses effective auxiliary divisors away from R. Closed points of any positive degree suffice to cross the high-degree bound. Comparisons through a common sum and their cocycle are separate declarations. They give the canonical all-degree object, product multiplication, associativity, commutativity and normalized unit. The hat sheaf is the pullback of that object along hatAJ; extension by zero from the effective locus would wrongly kill its zero-section stalks.

The norm sheaf sequence has an explicit local proof. At a ramified stalk, a root-normalized norm-one unit u has residue one, so 1+u is invertible and u=(1+u)/σ(1+u). The printed Picard-stack sequence requires a separate exactness interpretation and proof. For the ramified cover P¹→P¹, t↦t², O(1) is σ-invariant but cannot be pullback from downstairs, since pullback doubles degree. The packet preserves the two short exact sheaf sequences and their connecting maps, and records NORM-2EXACT. This rejects ordinary kernel exactness without declaring every coherent interpretation of the source false. The published p. 525 and arXiv v2 p. 89 retain the same one-sentence implication. The trace comparison has an independent proof and does not require this unresolved Picard-stack consequence.

The endpoint tests inverse uniformizer ↔ O(x), the Frobenius cyclic tensor at a closed point of degree δ, split and inert signs, and support moving with the residue-root frames retained. Its trace function is multiplicative on isomorphism classes. Specialized integrations still retain the automorphism groups and 1/#Aut factors; the groupoid equivalence is never replaced by a set bijection.

## Affine continuation and baseline convention

The affine root action uses the existing Tau Ceti μ_n Hopf points and scheme group, rather than planning another group scheme. Its coordinate coaction has all character coefficients available even when geometric points do not separate them. The equalizer of the coaction and b↦1⊗b is the invariant subalgebra. For B=A[t]/(tⁿ−f), its native monic basis and the native group-algebra tensor basis identify that equalizer with the coefficient image. No averaging, reducedness or invertibility of n is required. At n=p over a field of characteristic p the nilpotent t is fixed by every field-valued root of unity but not by the universal coaction. This supplies the ring calculation in the coarse-space proof; R09.5 supplies the geometric coarse universal property; SF.1 supplies the scheme gluing comparisons.

The new coordinate signatures below use native Hopf algebra maps, native tensor-algebra unit and associator equivalences, and the actual unlifted pointsMulEquiv carrier. Tau Ceti's scheme group uses a lifted character group, so these carriers are not identified definitionally. General μ_n, polynomial quotient bases and tensor-product bases are baseline imports, never new nodes.

Continuation provenance: Codex — codex-a71f92 read the TV17 character grading, Lemma 3.7 proof and finite chart Corollary 3.13 at the recorded edition; its downloaded hash matches the existing TV17 receipt. The finite arbitrary-A invariant proof is the coefficient argument written here, not a claim that the source's infinite-monoid lemma literally states it. Prior YZ19, AGV08, B24 and AV23 reading and nine source findings are retained from the preceding worker; this continuation does not claim a fresh whole-paper or erratum audit. All stage coverage remains partial.

## This continuation: finite algebra and infinite fpqc roots

Codex — codex-5ebb6f preserves all 91 inherited node IDs, all 33 recorded source-coverage routes, all 38 AV sibling routes and the nine inherited source findings. The fresh primary reading is TV17 §3, pp. 13–16 (finite transitions, cofinality and the infinite fpqc quotient, including the cited proofs), and B24 pp. 133 and 135 (the classifying-stack topology and DVR gerbe/Kummer comparison). Older reading receipts remain attributed to their earlier workers; this is not a fresh reading claim for the whole YZ or AV papers.

For B_n=A[t]/(tⁿ−f), the transition to B_nm sends t to uᵐ. Its iterated monic-quotient presentation provides the basis 1,u,…,uᵐ⁻¹ over B_n, hence faithful flatness even for nonreduced or zero coefficient rings. Native signatures below expose the maps, composition, basis and coefficient reconstruction. Infinite frame-torsor limits, ordinary groupoid carriers and geometric comparisons retain explicit supplier requests.

The inherited H1_fppf(k,lim μ_n) claim is corrected to H1_fpqc(k,lim μ_n). Finite classes remain H1_fppf(k,μ_n). Two separate leaves prove injectivity using finite isomorphism sets and surjectivity by a factorial torsor tower; compatibility of classes is not silently replaced by compatibility of objects.

The distinction is witnessed over Q by the coherent torsors tⁿ=2. Their inverse limit is an fpqc lim μ_n-torsor. An fppf trivialization would specialize at a closed point of a finite-type chart to roots of 2 of every degree in a finite extension K/Q. Eisenstein at 2 and the minimal-polynomial degree bound give n≤[K:Q], a contradiction. This is a correction to the inherited packet, not a claimed erratum in either paper. The B24 bibliography is also corrected to Inventiones Mathematicae 235 (2024).

All ten stages remain partial. The Lean file uses native carriers for the six new finite-algebra declarations and records exact omissions for the seven new geometric declarations. It contains admitted proofs and the complete file has not been elaborated at the pinned build.

## Declaration plan

Each entry is an unchecked proposed declaration. Inputs, supplier requests and gaps are mathematical obligations; a signature sketch does not certify a proof.

## RS.0. Root-object and affine-chart interfaces

Native invertible-sheaf tensor and section powers, canonical trivial-power coordinates and the root equation with its unit coefficient; scalar equations for root arrows; isomorphisms of root data; root-specific universal Hopf coaction on A[T]/(Tⁿ−f), its counit/coassociativity, character weights and compatibility with the existing μ_n points. μ_n and monic quotient bases are baseline imports. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### Tensor powers used by root objects

Declaration: FunctionFieldArithmeticPartII:RS.0/tensor-power. Construction.

For a native invertible sheaf M on a scheme T define M⁰=O_T and Mⁿ⁺¹=Mⁿ⊗M, with coherent transport of line-bundle isomorphisms. This is a root-object interface over the existing tensor operation, not a new definition of line bundles.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Recurse using the native trivial bundle and tensor product.
2. Transport an isomorphism by the native tensor congruences; the recursion fixes parentheses.

Inputs: tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrLeft, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrRight, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductAssoc, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialLeftIso, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialRightIso.

API uses:

- AGV B.2 — The root identification has domain the n-th tensor power of M.

API:

- TauCeti.RootStack.tensorPower.zero (simp): M⁰ is the native trivial sheaf.
- TauCeti.RootStack.tensorPower.succ (simp): Mⁿ⁺¹=Mⁿ⊗M with the chosen parentheses.
- TauCeti.RootStack.tensorPower.mapIso (functoriality): An isomorphism M≅N induces Mⁿ≅Nⁿ and respects identity and composition.

Unit tests:

- TauCeti.RootStack.tensorPower.test_zero (degenerate): At exponent zero the output is O_T.
- TauCeti.RootStack.tensorPower.test_one (compatibility): At exponent one the output is isomorphic to M via the native unit isomorphism.
- TauCeti.RootStack.tensorPower.test_two (computation): At exponent two the output is O_T⊗M⊗M with the displayed parentheses, canonically M⊗M.

Acceptance:

- Zero exponent is the native trivial sheaf; exponent one is canonically M.

Source:

- AGV08, B.1–B.2 pp. 52–54. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Powers of sections

Declaration: FunctionFieldArithmeticPartII:RS.0/section-power. Construction.

For t∈Γ(T,M), define tⁿ∈Γ(T,Mⁿ) using the native sheaf tensor product; t⁰ is the unit section and tⁿ⁺¹=tⁿ⊗t.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Use the canonical bilinear section map into the sheafified tensor product and the unit section.
2. Recurse with the same parentheses as tensor powers. The general sheaf tensor/unit identification is an upstream JacobianChallenge interface, recorded as request JAC-A.

Inputs: FunctionFieldArithmeticPartII:RS.0/tensor-power, mathlib:AlgebraicGeometry.Scheme.Modules.presheaf, SchemeAndStackFoundations:SF.3, mathlib:SheafOfModules.freeSection, mathlib:AlgebraicGeometry.Scheme.Modules.Hom.app.

API uses:

- AGV B.2 — Defines the actual equation relating the root section to the original section.

API:

- TauCeti.RootStack.sectionPower.zero (simp): t⁰ is the unit section of O_T.
- TauCeti.RootStack.sectionPower.succ (simp): tⁿ⁺¹ is the tensor product of tⁿ and t.
- TauCeti.RootStack.sectionPower.mapIso (compatibility): Transporting t through a line-bundle isomorphism commutes with section power.
- TauCeti.RootStack.sectionPower.tensorStep (data): For a section v of Mⁿ and t of M, the root-power recursion step tensors them into a section of Mⁿ⁺¹; it uses JAC-A’s native section tensor map.

Unit tests:

- TauCeti.RootStack.sectionPower.test_zero (degenerate): The zeroth power of the zero section is the unit.
- TauCeti.RootStack.sectionPower.test_one (compatibility): The first power maps to t under the native unit isomorphism.
- TauCeti.RootStack.sectionPower.test_zero_positive (non-example): The positive powers of the zero section are zero, rather than excluded root objects.

Acceptance:

- Under a trivialization this is ordinary fⁿ; zero sections are allowed.

Source:

- AGV08, B.2 p. 53. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Root objects over a test scheme

Declaration: FunctionFieldArithmeticPartII:RS.0/root-object. Definition.

For n≥1, (L,s) on T, an object consists of a native invertible sheaf M, t∈Γ(T,M), and an isomorphism φ:Mⁿ≅L satisfying φ(tⁿ)=s. Arrows are invertible sheaf isomorphisms preserving t and commuting with φ.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Take triples of actual native sheaf data satisfying the section equality.
2. Use only invertible arrows from the core; impose the two compatibility equations on their isomorphisms.

Inputs: FunctionFieldArithmeticPartII:RS.0/tensor-power, FunctionFieldArithmeticPartII:RS.0/section-power, mathlib:CategoryTheory.Core.

API uses:

- AGV B.2 — Gives root-stack fibres.
- Yun–Zhang Definition A.2 — Permits nilpotent and zero section data.

API:

- TauCeti.RootStack.RootObject.mk (constructor): Create an object from M,t,φ and φ(tⁿ)=s.
- TauCeti.RootStack.RootObject.line (projection): Forget an object to its native invertible sheaf M.
- TauCeti.RootStack.RootObject.iso (characterisation): An arrow is exactly a line-bundle isomorphism preserving both section and root identification.
- TauCeti.RootStack.RootObject.canonicalOne (constructor): The canonical exponent-one root object has line L, section s and the native unit identification O⊗L≅L.

Unit tests:

- TauCeti.RootStack.RootObject.test_one (degenerate): For n=1 the object (L,s,id) is terminal up to unique isomorphism.
- TauCeti.RootStack.RootObject.test_zero (non-example): For L=O_T,s=0, the object (O_T,0,id) exists.
- TauCeti.RootStack.RootObject.test_trivialization (compatibility): For a trivialized object φ is a unit u and the equation is u tⁿ=s, with isomorphism scalars retained.

Acceptance:

- A zero section gives valid root objects; replacing arrows by all module maps is incorrect.

Source:

- AGV08, B.2 p. 53. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Diagonalizable action on the affine root chart

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-action. Construction.

For a commutative ring A, f∈A and n≥1, each ζ∈rootsOfUnity(n,A) induces an A-algebra automorphism of the existing AdjoinRoot(Tⁿ−f) sending T to ζT. The construction is natural on A-algebras and represents the μ_n group-scheme action, including infinitesimal points.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. The image ζT satisfies Tⁿ−f because ζⁿ=1; use the native quotient lift.
2. Use ζ⁻¹ for the inverse; generator evaluation proves identity and multiplication.
3. Apply the same construction on every A-algebra to retain the group-scheme action.

Inputs: mathlib:AdjoinRoot, mathlib:AdjoinRoot.eval₂_root, mathlib:AdjoinRoot.lift, mathlib:rootsOfUnity.

API uses:

- TV Corollary 3.13 — Supplies the diagonalizable action in the finite root quotient chart.

API:

- TauCeti.RootStack.affineAction.root (simp): The distinguished quotient root maps to ζ times itself.
- TauCeti.RootStack.affineAction.constant (simp): Every coefficient from A is fixed.
- TauCeti.RootStack.affineAction.mul (structure): The automorphisms for ζξ and ζ composed with ξ agree.

Unit tests:

- TauCeti.RootStack.affineAction.test_one (degenerate): The unit root of unity acts as the identity.
- TauCeti.RootStack.affineAction.test_sign (computation): For n=2 the element −1 sends T to −T.
- TauCeti.RootStack.affineAction.test_infinitesimal (non-example): On F_p[ε]/ε² at n=p, 1+ε has p-th power one and acts by T↦(1+ε)T.

Acceptance:

- In characteristic p the μ_p action is not detected by its geometric-point set.

Source:

- TV17, §3.1 pp. 14–16, P=N and Corollary 3.13. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Canonical quotient-root relation

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-root-relation. Lemma.

The distinguished root t of the actual quotient B=A[T]/(Tⁿ−f) satisfies tⁿ=algebraMap(f), including over nonreduced and zero coefficient rings.

Hypotheses:

- A is any commutative ring and f∈A. The root relation and character-power identity allow every natural n; Euclidean reduction uses n≥1. No reducedness, regularity, invertibility of n, or unit condition on f is imposed.

Construction or proof:

1. Evaluate the defining polynomial at the canonical quotient root using eval₂_root.
2. Expand evaluation of Xⁿ−C(f) and cancel the subtraction; the existing coefficient algebra map is the native quotient map.

Inputs: mathlib:AdjoinRoot, mathlib:AdjoinRoot.eval₂_root.

Unit tests:

- TauCeti.RootStack.affineRoot.pow_eq.test_wild_branch (computation): Over F₂, the canonical root of T² has square zero.
- TauCeti.RootStack.affineRoot.pow_eq.test_regular_nonunit (computation): Over Z, the canonical root of T²−2 has fourth power equal to the image of 4.

Acceptance:

- For A=F₂,n=2,f=0, t²=0 without any assertion that t vanishes.
- For A=Z,n=2,f=2, t⁴=4; f need not be a unit.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific calculation derived here from the finite P=N character grading and quotient chart. The native quotient and character algebra are imported. This is not a verbatim theorem attributed to the paper.

### Powers of the native root character

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-character-power. Lemma.

In H=A[Multiplicative(ZMod n)], the basis element e₁ at the existing roots-of-unity character generator satisfies e₁ⁱ=e_i for every i≥0. In particular e₁ⁿ=1, even when n is zero in A.

Hypotheses:

- A is any commutative ring and f∈A. The root relation and character-power identity allow every natural n; Euclidean reduction uses n≥1. No reducedness, regularity, invertibility of n, or unit condition on f is imposed.

Construction or proof:

1. Apply the native single_pow identity with coefficient 1.
2. Expand the existing generator to Multiplicative.ofAdd(1). Its i-th power is the additive multiple i•1, whose image is i modulo n. For i=n, natCast_self gives zero and e₀=1.

Inputs: tauceti:TauCeti.RootsOfUnityGroup.generator, mathlib:MonoidAlgebra.single_pow, mathlib:ofAdd_nsmul, mathlib:ZMod.natCast_self.

Unit tests:

- TauCeti.RootStack.affineCharacter.pow.test_wild_order (compatibility): In F₂[Multiplicative(ZMod 2)], the character basis element e₁ has square one.

Acceptance:

- Over F₂ at exponent two, e₁²=1 although μ₂ is not étale.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific calculation derived here from the finite P=N character grading and quotient chart. The native quotient and character algebra are imported. This is not a verbatim theorem attributed to the paper.

### Euclidean reduction of quotient-root powers

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-root-power-reduction. Lemma.

For n≥1 and every k≥0, the actual quotient root satisfies tᵏ=f^⌊k/n⌋ • t^(k mod n), using the native A-module structure on B. No division in A is performed.

Hypotheses:

- A is any commutative ring and f∈A. The root relation and character-power identity allow every natural n; Euclidean reduction uses n≥1. No reducedness, regularity, invertibility of n, or unit condition on f is imposed.

Construction or proof:

1. Write k=n⌊k/n⌋+(k mod n) in the natural numbers.
2. Use the power product identities and the canonical root relation tⁿ=f. Rewrite multiplication by the coefficient image as scalar multiplication.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-root-relation.

Unit tests:

- TauCeti.RootStack.affineRoot.pow_reduce.test_nilpotent (computation): In (Z/4)[T]/(T²−2), the canonical root has fourth power zero.

Acceptance:

- For A=Z/4,n=2,f=2, t⁴=0, retaining the nilpotent coefficient.
- At k<n the quotient coefficient is one; at k=n it is f.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific calculation derived here from the finite P=N character grading and quotient chart. The native quotient and character algebra are imported. This is not a verbatim theorem attributed to the paper.

### Root image of the universal coaction

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-coaction-root. Lemma.

δ(t)=e_1⊗t in the native H⊗_A B.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. Evaluate the native quotient algebra lift at the distinguished root.
2. The lift uses the specified tensor e₁⊗t, so its root computation is exact.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:AdjoinRoot.liftAlgHom.

Acceptance:

- This is the promoted root-evaluation API used by weight, counit and coassociativity proofs.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific calculation derived here from the finite P=N character grading and quotient chart. The native quotient and character algebra are imported. This is not a verbatim theorem attributed to the paper.

### Affine root-chart coaction

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-coaction. Construction.

Put B=A[t]/(tⁿ−f), using native AdjoinRoot, and H=A[Multiplicative(ZMod n)], using the native Hopf group algebra. Write e_i for its character basis element indexed by i modulo n. Define the unique A-algebra map δ:B→H⊗_A B with δ(t)=e_1⊗t. Constants map to 1⊗a. This is a universal coordinate map, not an action of the geometric-point set.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. In the native group algebra e_1ⁿ=e_0=1 because the character index is modulo n. Hence (e_1⊗t)ⁿ=1⊗f and the quotient polynomial evaluates to zero.
2. Apply the native AdjoinRoot algebra lift with this root and the coefficient map to H⊗_A B. The algebra-map law fixes constants.
3. Native quotient algebra-hom extensionality proves uniqueness. Counit and coassociativity are proved in separate nodes, not assumed fields.

Inputs: mathlib:AdjoinRoot, mathlib:AdjoinRoot.eval₂_root, mathlib:AdjoinRoot.liftAlgHom, mathlib:AdjoinRoot.algHom_ext, mathlib:MonoidAlgebra.single, mathlib:MonoidAlgebra.single_pow, mathlib:Algebra.TensorProduct.includeRight, tauceti:TauCeti.RootsOfUnityGroup.generator, mathlib:MonoidAlgebra.instHopfAlgebra, FunctionFieldArithmeticPartII:RS.0/affine-root-relation, FunctionFieldArithmeticPartII:RS.0/affine-character-power, mathlib:Algebra.TensorProduct.algebraMap_apply', mathlib:Algebra.TensorProduct.tmul_pow.

API uses:

- FunctionFieldArithmeticPartII:RS.1/affine-chart; Talpo–Vistoli Corollary 3.13 — Supplies the universal diagonalizable coordinate action, including characteristic dividing n.
- FunctionFieldArithmeticPartII:RS.1/affine-invariants and FunctionFieldArithmeticPartII:RS.1/coarse-space — Defines invariants by δ(b)=1⊗b, not by geometric roots of unity.
- FunctionFieldArithmeticPartII:RS.0/native-point-action — Compares specialization with the native Hopf point equivalence and affineAction.

API:

- TauCeti.RootStack.affineCoaction.root (simp): δ(t)=e_1⊗t in the native H⊗_A B.
- TauCeti.RootStack.affineCoaction.constant (simp): For every a∈A, δ(algebraMap(a))=1⊗algebraMap(a).
- TauCeti.RootStack.affineCoaction.unique (universal-property): An A-algebra map ψ:B→H⊗_A B with ψ(t)=e_1⊗t equals δ.

Unit tests:

- TauCeti.RootStack.affineCoaction.test_one (degenerate): At n=1, δ(b)=1⊗b for every b∈A[t]/(t−f).
- TauCeti.RootStack.affineCoaction.test_sign (compatibility): At n=2, the native Hopf point corresponding to ζ=−1 through TauCeti.RootsOfUnityGroup.pointsMulEquiv, applied to the H factor of δ(t) and then the native A⊗_A B unit equivalence, gives −t.
- TauCeti.RootStack.affineCoaction.test_characteristic_p (non-example): For a field k of prime characteristic p, n=p and f=0, t≠0 and δ(t)≠1⊗t, while every ζ∈rootsOfUnity(p,k) fixes t. Field-valued point invariance is therefore not scheme invariance.

Acceptance:

- The map exists for f=0, nonreduced bases and the zero ring.

Planet: Affine root coaction.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Character weights of root powers

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-coaction-weight. Lemma.

For every integer i≥0, δ(t^i)=e_i⊗t^i, where e_i is indexed by the image of i in ZMod n; coefficients from A have weight zero.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. Apply multiplicativity of δ to t^i and use δ(t)=e_1⊗t with native tensor multiplication.
2. Rewrite e_1^i as the basis element at the residue of i. At i=n this agrees with tⁿ=f having weight zero.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:MonoidAlgebra.single_pow, FunctionFieldArithmeticPartII:RS.0/affine-coaction-root, FunctionFieldArithmeticPartII:RS.0/affine-character-power, mathlib:Algebra.TensorProduct.tmul_pow.

Acceptance:

- At i=0 the image is 1⊗1; at i=n it is 1⊗f even when n is zero in A.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Counit law for the root coaction

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-coaction-counit. Lemma.

Let ε:H→A be the native Hopf counit. The composite of δ, ε⊗id and the native tensor left-unit equivalence H⊗_A B→A⊗_A B→B is id_B.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. The native group-like basis theorem gives ε(e_1)=1.
2. The composite sends t to t. Both maps are A-algebra maps, so native quotient extensionality establishes equality without an assumed counit predicate.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:MonoidAlgebra.instBialgebra, mathlib:MonoidAlgebra.isGroupLikeElem_single_one, mathlib:Bialgebra.counitAlgHom, mathlib:Algebra.TensorProduct.map, mathlib:Algebra.TensorProduct.lid, mathlib:AdjoinRoot.algHom_ext, FunctionFieldArithmeticPartII:RS.0/affine-coaction-root, mathlib:MonoidAlgebra.counit_single.

Acceptance:

- The action identity holds also for n=1 and zero coefficient rings.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Coassociativity of the root coaction

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-coaction-coassoc. Lemma.

Let Δ:H→H⊗_A H be the native Hopf comultiplication. Under the native associator (H⊗_A H)⊗_A B≅H⊗_A(H⊗_A B), the maps (Δ⊗id)δ and (id⊗δ)δ are equal.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. The native group-like basis theorem gives Δ(e_1)=e_1⊗e_1.
2. Both composites send t to e_1⊗(e_1⊗t) after reassociation; quotient extensionality proves equality. The associator is explicit, not a definitional identification of tensor parentheses.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:MonoidAlgebra.instBialgebra, mathlib:MonoidAlgebra.isGroupLikeElem_single_one, mathlib:Bialgebra.comulAlgHom, mathlib:Algebra.TensorProduct.map, mathlib:Algebra.TensorProduct.assoc, mathlib:AdjoinRoot.algHom_ext, FunctionFieldArithmeticPartII:RS.0/affine-coaction-root, mathlib:MonoidAlgebra.comul_single.

Acceptance:

- This uses the existing tensor-algebra associator, not a new tensor carrier.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Native roots-of-unity point specialization

Declaration: FunctionFieldArithmeticPartII:RS.0/native-point-action. Comparison.

For ζ∈rootsOfUnity(n,A), let p_ζ:H→A be the algebra map underlying the inverse of TauCeti.RootsOfUnityGroup.pointsMulEquiv. The composite of δ with p_ζ⊗id and the native tensor left-unit equivalence is the algebra homomorphism underlying affineAction(f,n,ζ).

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. The native point equivalence on the actual unlifted group-algebra carrier gives p_ζ(e_1)=ζ.
2. Specialize δ(t) to ζt and compare the defining image of t under affineAction. Constants agree since both are A-algebra maps; quotient extensionality completes the comparison.
3. Apply the statement over every coefficient A-algebra to retain infinitesimal points. The scheme group object's ULift character carrier is not asserted to be definitionally this unlifted group algebra.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, FunctionFieldArithmeticPartII:RS.0/affine-action, tauceti:TauCeti.RootsOfUnityGroup.pointsMulEquiv, tauceti:TauCeti.RootsOfUnityGroup.pointsMulEquiv_symm_apply_single_generator, mathlib:Algebra.TensorProduct.map, mathlib:Algebra.TensorProduct.lid, mathlib:AdjoinRoot.algHom_ext.

Acceptance:

- For ζ=1 specialization is identity; at n=2, ζ=−1 gives the sign action. Nonreduced coefficient rings retain infinitesimal points.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Canonical coordinates for powers of the trivial line

Declaration: FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism. Construction.

For any scheme X and n≥0, let O be the native free rank-one invertible sheaf. Construct c_n:Oⁿ≅O with c_0=id and c_{n+1}=(c_n⊗id_O) followed by the native right-unit isomorphism. The parentheses agree with tensorPower; these are canonical coordinates for that recursion, not a new tensor product.

Hypotheses:

- Scheme X arbitrary; n a natural number, including zero.

Construction or proof:

1. Start with the identity at zero.
2. At the successor compose native tensorProductCongrLeft(c_n) with tensorTrivialRightIso(O). Their actual domains match the recursive tensor power.
3. For the section-unit API use the existing bilinear tensor-section/unit contract JAC-A; no generic section tensor map is constructed here.

Inputs: FunctionFieldArithmeticPartII:RS.0/tensor-power, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrLeft, tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialRightIso, SchemeAndStackFoundations:SF.3.

API uses:

- AGV B.2, trivial L=O calculation — Identifies the domain of the root identification with O while retaining its unit coefficient.
- FunctionFieldArithmeticPartII:RS.0/root-trivialization-equation — Computes powers in the same parentheses as the native root object.

API:

- TauCeti.RootStack.tensorPower.trivialIso_zero (simp): c_0 is the identity of O.
- TauCeti.RootStack.tensorPower.trivialIso_succ (simp): c_{n+1}=(c_n⊗id) followed by the right-unit map, with the native tensor congruence.
- TauCeti.RootStack.tensorPower.trivialIso_unit (compatibility): Under c_n the n-th power of the native unit section has coefficient 1 for every n≥0.

Unit tests:

- TauCeti.RootStack.tensorPower.trivialIso_test_zero (degenerate): c_0=id_O.
- TauCeti.RootStack.tensorPower.trivialIso_test_one (compatibility): c_1 equals the existing right-unit isomorphism O⊗O≅O.
- TauCeti.RootStack.tensorPower.trivialIso_test_two (computation): For a section of O with coefficient z, its square transported by c_2 has coefficient z², including nilpotent z.

Acceptance:

- The exponent-one comparison is the native right-unit map, not an arbitrarily chosen scalar multiple.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### Section powers in native coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization. Lemma.

For an invertible sheaf M on X, a specified trivialization e:M≅O, a section t and n≥0, transporting tⁿ by eⁿ followed by c_n gives the global function zⁿ, where z is the coefficient of e(t). Coefficients use the existing freePUnitIsoUnit map on global sections.

Hypotheses:

- Scheme X arbitrary; M trivialized by the actual isomorphism e; n≥0; zero sections allowed.

Construction or proof:

1. Use sectionPower.mapIso to transport to the native trivial line.
2. At zero use its unit-section API. At the successor use JAC-A’s bilinear section tensor map and the native right-unit map: their coordinate evaluation is multiplication.
3. Induct with the same c_n recursion. Neither tensor-power parenthesization nor an unidentified scalar is discarded.

Inputs: FunctionFieldArithmeticPartII:RS.0/section-power, FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism, tauceti:TauCeti.SheafOfModules.freePUnitIsoUnit, SchemeAndStackFoundations:SF.3, FunctionFieldArithmeticPartII:RS.0/section-power-transport.

Acceptance:

- At n=0 the result is 1 even for t=0. At positive n zero gives zero. Over Z/4 the coefficient 2 has square zero.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### The unit coefficient of a root identification

Declaration: FunctionFieldArithmeticPartII:RS.0/root-identification-unit. Lemma.

For an actual n-th root object a=(M,t,φ) of (L,s), n≥1, and specified trivializations e:M≅O and l:L≅O, form α=c_n⁻¹ followed by (e⁻¹)ⁿ, φ and l, an automorphism of O. Let u be the coefficient of α(1). Then u is a unit in Γ(X,O_X); for every v∈Γ(X,Mⁿ), the coefficient of lφ(v) equals u times the coefficient of c_n eⁿ(v).

Hypotheses:

- Scheme X arbitrary; n≥1; actual native invertible-sheaf isomorphisms φ,e,l.

Construction or proof:

1. Construct α from the stated isomorphisms, so it has an actual inverse.
2. Use pinned freeHomEquiv/unitHomEquiv: maps from the free one-generator sheaf are determined by the image of its unit section. On each open, module linearity makes α multiplication by its unit-section coefficient; naturality makes those coefficients restrictions of the global coefficient.
3. Apply the inverse map to obtain u v=1=v u in global functions. This proves IsUnit(u), rather than postulating it.
4. Apply the scalar evaluation formula to c_n eⁿ(v) and use the inverse/cancellation identities.

Inputs: FunctionFieldArithmeticPartII:RS.0/root-object, FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism, tauceti:TauCeti.SheafOfModules.freePUnitIsoUnit, mathlib:SheafOfModules.freeHomEquiv, mathlib:SheafOfModules.freeHomEquiv_apply, mathlib:SheafOfModules.unitHomEquiv, mathlib:AlgebraicGeometry.Scheme.Modules.Hom.app_smul.

Acceptance:

- Multiplication by 2 on O over Spec(Z/4) is not an allowed root identification. Nilpotents in the base do not invalidate multiplication by a unit.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### The native root equation in coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/root-trivialization-equation. Theorem.

With the native root object and chosen trivializations above, the computed coefficient u is a unit and u zⁿ=f, where z is the coefficient of the root section under e and f is the coefficient of s under l. The coefficient u is part of the comparison; no choice of an n-th root of u is assumed.

Hypotheses:

- Scheme X arbitrary; n≥1; root object and two specified native trivializations.

Construction or proof:

1. Use root-identification-unit to evaluate φ on the actual section tⁿ and establish that u is a unit.
2. Use section-power-in-trivialization to identify the coordinate of tⁿ with zⁿ.
3. Transport the defining root equation φ(tⁿ)=s by l; this gives u zⁿ=f. The example quantifies over a bundled unit and asserts equality to the computed coefficient, not just a renamed defining equation.

Inputs: FunctionFieldArithmeticPartII:RS.0/root-identification-unit, FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization.

Acceptance:

- Over Spec(Z/4), n=2, u=3 and z=2 give f=0 with z nonzero; zero sections and nilpotent roots must remain. Over Q the root object u=2,z=1,f=2 exists without a rational square root of 2.

Planet: Root objects in coordinates.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### Scalar equations for arrows of root objects

Declaration: FunctionFieldArithmeticPartII:RS.0/root-arrow-scalars. Comparison.

For root objects a,b of the same (L,s,n), chosen trivializations e_a,e_b of their root lines and l of L, every actual root arrow h:a→b has a unit coefficient w. The section coordinates satisfy z_b=w z_a and the computed root-identification coefficients satisfy u_b wⁿ=u_a. Retain both equations and the unit condition, including when sections vanish.

Hypotheses:

- Scheme X arbitrary; n≥1; h is a native invertible root arrow, not an arbitrary module map.

Construction or proof:

1. Conjugate the underlying line isomorphism by e_a and e_b. The native free-sheaf Hom equivalence and its actual inverse give its unit coefficient w.
2. The arrow section equation gives z_b=w z_a.
3. Evaluate the tensor-power transport on the native unit section; sectionPower.mapIso and section-power-in-trivialization identify its coefficient with wⁿ.
4. Conjugate the arrow power equation φ_b∘hⁿ=φ_a by the chosen trivializations to obtain u_b wⁿ=u_a.

Inputs: FunctionFieldArithmeticPartII:RS.0/root-identification-unit, FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization, FunctionFieldArithmeticPartII:RS.0/root-object, mathlib:SheafOfModules.freeHomEquiv.

Acceptance:

- For a=b with zero section and u_a=u_b, the power condition still forces wⁿ=1; forgetting it incorrectly makes every unit an automorphism. Composition multiplies w coefficients.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### Isomorphism transport of section powers

Declaration: FunctionFieldArithmeticPartII:RS.0/section-power-transport. Comparison.

For any scheme X, invertible sheaves M,N, an actual isomorphism e:M≅N, section t of M and n≥0, eⁿ carries tⁿ to (e(t))ⁿ in the fixed recursive tensor powers. The transport at exponent zero is the identity of the native tensor unit; identity and composition use the coherent tensor-power transport.

Hypotheses:

- Scheme X arbitrary; actual native invertible-sheaf isomorphism e; n≥0; t may vanish.

Construction or proof:

1. Use the zero-degree identity transport and the native unit section.
2. At the successor use JAC-A’s natural bilinear section tensor map with the native tensor congruences. Apply the induction hypothesis to the first factor and e to the second.
3. Keep the recursive tensor parentheses and verify transport identity/composition via the existing tensor functor laws; these generic coherence contracts stay with JAC-A.

Inputs: FunctionFieldArithmeticPartII:RS.0/tensor-power, FunctionFieldArithmeticPartII:RS.0/section-power, SchemeAndStackFoundations:SF.3.

Acceptance:

- For n=0 even the zero section maps to the same unit. For multiplication by a unit w on a trivial line, the transported n-th section power has coefficient wⁿ.

Source:

- AGV08, Appendix B.1–B.2, pp. 52–54, root triples and trivial-bundle quotient calculation. Root-specific coordinate derivation of the native object equation and its arrows. The source gives the geometric root data; the unit/coordinate proof decomposition here uses the pinned free-sheaf and tensor APIs, not a claimed printed standalone lemma.

### Finite action comparison and its exact obstruction

Let A be any commutative ring, n≥1, f∈A, B=A[x]/(xⁿ−f), and H=A[Multiplicative(ZMod n)]. These are native AdjoinRoot and Hopf group-algebra types. The character vector e_i is indexed by a residue class, not a geometric root-of-unity point. The coordinate map Θ:B⊗_A B→H⊗_A B is δ on the left and the identity inclusion on the right.

In the monic source basis s_(i,j)=x^i⊗x^j and character/monic target basis t_(i,k)=e_i⊗x^k, the map is a weighted permutation:
Θ(s_(i,j))=f^⌊(i+j)/n⌋t_(i,(i+j) mod n).
The permutation inverse uses j=k−i for k≥i and j=n+k−i for k<i. There is no cancellation assumption on A. Over the zero ring, coordinate families and modules are singletons; do not assert that the quotient polynomial has natural degree n there.

Put W={(i,j):i+j≥n}, L={(i,k):k<i}, and E=n(n−1)/2. Source kernel coordinates outside W vanish and those on W lie in ann_A(f); target image coordinates on L lie in fA. Consequently ker_A Θ≃ann_A(f)^W and coker_A Θ≃(A/(f))^L by the specified coordinate maps. The cokernel is a module quotient by the linear range, not an algebra quotient or a reduced quotient. The ideal generated by that range contains 1.

Injectivity is equivalent to n=1 or injectivity of multiplication by f. Surjectivity and bijectivity are equivalent to n=1 or f being a unit. Thus Z,n=2,f=2 gives an injective non-surjective map. A nonzero nilpotent parameter is different: over Z/4, f=2 kills the nonzero tensor 2(x⊗x). Coefficient change preserves the displayed matrix, but Z→F₂ shows that it does not preserve kernels.

For a specified unit v, promote the actual comparison Θ to E_v using its sharp bijectivity criterion and Mathlib’s algebra-equivalence constructor. In B the root has inverse v⁻¹x^(n−1). Evaluate Θ on x⊗(v⁻¹x^(n−1)) to obtain e_1⊗1; the inverse-evaluation law therefore gives that specified preimage. The right factor is unchanged. Multiplicativity extends this to every character tensor. No inverse of n is used; for F₂,n=2,f=1 it is an isomorphism even though x−1 is a nonzero nilpotent.

The determinant in the specified pair bases is (−1)^((n−1)E)f^E. The sign comes from row block i, an ith cyclic rotation, and the E wrapping columns carry the f weights. At f=0 over any field the surviving nonwrapping columns have distinct unit pivots, giving range dimension n(n+1)/2 and kernel dimension E.

This calculation applies to normalized coframes of an actual root object, not to an arbitrary root chart as a torsor over its coarse base. Locally φ(eⁿ)=u is a unit and the section is b e with u bⁿ=f. Compatible coframes e↦a have aⁿ=u; their unit-parameter finite cover is a μ_n torsor. The equivariant map to the coarse root chart is x↦ab. The coordinate comparison checks that finite input to RS.1/affine-chart and TOWER-AFF. Scheme/site torsor criteria, coherent infinite limits, finite quotient comparisons and derived fpqc H¹ remain the existing foundational requests. These fifteen exports do not close those interfaces or the reserved root-stack key.

#### Affine action comparison

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-comparison. definition. Native name: TauCeti.RootStack.affineTorsorComparison.

Let B=A[x]/(xⁿ−f) be native AdjoinRoot and H=A[Multiplicative(ZMod n)] the native Hopf group algebra, with character basis e_i. Define the A-algebra map Θ:B⊗_A B→H⊗_A B by the tensor universal property applied to δ:B→H⊗B and c↦1⊗c. Thus the right B-factor is unchanged; this is the coordinate map of the action comparison, not a freely chosen linear map.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Use the existing affine coaction and the native right-factor algebra inclusion. Their images commute because the target algebra is commutative.
2. Apply the native tensor-algebra lift, with these two specified maps. Its algebra-map laws fix coefficients and define a unique comparison; no torsor predicate or geometric-point set is introduced.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:Algebra.TensorProduct.lift, mathlib:Algebra.TensorProduct.includeRight, mathlib:Algebra.TensorProduct.ext'.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- Θ is defined even at f=0 and over the zero ring. Its coordinate-algebra direction is opposite to the scheme action comparison.

Uses:

- FunctionFieldArithmeticPartII:RS.1/affine-chart: Tests the finite normalized-coframe torsor, where the parameter is a unit.
- TOWER-AFF and FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit: Supplies the finite unit-parameter torsor equation, not a torsor assertion for arbitrary coarse charts.
- affineTorsorComparison kernel/cokernel criteria: Retains the branch obstruction and detects failure of kernel base change.

API:

- TauCeti.RootStack.affineTorsorComparison.left_root (simp): Θ(x⊗1)=e_1⊗x for the distinguished quotient root x.
- TauCeti.RootStack.affineTorsorComparison.right_factor (simp): Θ(1⊗c)=1⊗c for every c∈B.
- TauCeti.RootStack.affineTorsorComparison.unique (universal-property): Any A-algebra map h:B⊗B→H⊗B satisfying h(b⊗c)=δ(b)(1⊗c) for all b,c equals Θ.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.test_exponent_one (degenerate): For n=1 and arbitrary f, Θ is bijective; no unit condition is needed.
- TauCeti.RootStack.affineTorsorComparison.test_zero_ring (degenerate): For a subsingleton commutative ring A and every positive n,f, Θ is bijective.
- TauCeti.RootStack.affineTorsorComparison.test_branch_kernel (non-example): For n=2,f=0 over any field k, x⊗x is nonzero but Θ(x⊗x)=0.
- TauCeti.RootStack.affineTorsorComparison.test_regular_nonunit (non-example): For A=Z,n=2,f=2, Θ is injective but not surjective.
- TauCeti.RootStack.affineTorsorComparison.test_nilpotent_parameter (non-example): For A=Z/4,n=2,f=2, the source tensor 2(x⊗x) is nonzero and killed by Θ.
- TauCeti.RootStack.affineTorsorComparison.test_wild_unit (compatibility): For A=F₂,n=2,f=1, Θ is bijective while x−1≠0 and (x−1)²=0 in B. The finite fppf torsor is not thereby étale.
- TauCeti.RootStack.affineTorsorComparison.test_nonflat_kernel (non-example): The injective comparison for Z,n=2,f=2 becomes noninjective for F₂,n=2,f=0. Matrix coefficient change commutes, but kernels need not.
- TauCeti.RootStack.affineTorsorComparison.test_cokernel_nonreduced (computation): For A=Z/8,n=2,f=4, the A-module cokernel is A/(4) and contains z with 2z≠0,4z=0. Neither the reduced quotient F₂ nor the algebra quotient generated by im Θ has this property.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Pure-tensor comparison formula

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-tmul. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.tmul.

For all b,c∈B, Θ(b⊗c)=δ(b)(1⊗c) in H⊗_A B.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Evaluate the native tensor lift on b⊗c using lift_tmul. The right input is exactly the native algebra inclusion.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-comparison, mathlib:Algebra.TensorProduct.lift_tmul.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- Substitution b=x,c=1 and b=1 recovers the two construction projection APIs.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Source monic tensor coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.source_coordinates.

Every z∈B⊗_A B has a unique coefficient family c:(Fin n×Fin n)→A with z=Σ_(i,j)c_(i,j)(x^i⊗x^j). This existence-and-uniqueness statement includes the zero ring; it does not assert that the polynomial has numerical natural degree n there.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. When A is nontrivial, monicity and n>0 give degree n; reindex the existing AdjoinRoot power basis by Fin n, and take its native tensor product basis.
2. Use its coordinate equivalence for existence and uniqueness. If A is subsingleton then every A-module is subsingleton and there is exactly one coefficient family; prove this branch directly, without the false degree assertion.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-comparison, mathlib:AdjoinRoot.powerBasis', mathlib:Module.Basis.tensorProduct, mathlib:Module.subsingleton, mathlib:Polynomial.monic_X_pow_sub_C, mathlib:Polynomial.natDegree_X_pow_sub_C, mathlib:Module.Basis.reindex, mathlib:Module.Basis.reindex_apply, mathlib:Module.Basis.equivFun, mathlib:Module.Basis.sum_equivFun, mathlib:Module.Basis.equivFun_symm_apply, mathlib:Module.Basis.tensorProduct_apply'.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- At n=2 over Z/4 the four source monomials still have unique coefficients; independence is not a field-only claim.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Target character tensor coordinates

Checked native proof refinement: Split on whether A is subsingleton. In that branch Module.subsingleton makes the tensor module subsingleton, and the coefficient-function module is also subsingleton; the zero family is the unique expansion. In the nontrivial branch n>0 gives natDegree(Xⁿ−f)=n by Polynomial.natDegree_X_pow_sub_C. Polynomial.monic_X_pow_sub_C and AdjoinRoot.powerBasis' supply the actual quotient power basis; reindex its Fin(degree) index by the degree equality. Use the native power-basis vector formula and Module.Basis.reindex_apply to identify each vector as x^i. Module.Basis.tensorProduct and tensorProduct_apply' give the actual pure-tensor basis. The witness is that basis's equivFun(z). sum_equivFun gives its expansion, and equivFun_symm_apply plus injectivity of the inverse equivalence gives coefficient uniqueness. No root-chart carrier or basis axiom is postulated.

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.target_coordinates.

Every z∈H⊗_A B has a unique coefficient family d:(Fin n×Fin n)→A with z=Σ_(i,k)d_(i,k)(e_i⊗x^k), where e_i is indexed by i modulo n, not by an A-valued root of unity.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Take the native group-algebra character basis indexed by Multiplicative(ZMod n); reindex through Fin n using the residue value since n>0.
2. Tensor with the native quotient monic basis. The same direct subsingleton branch handles the zero ring. The finite coordinate map gives the stated formula and uniqueness.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, mathlib:MonoidAlgebra.basis, mathlib:Module.Basis.tensorProduct, mathlib:AdjoinRoot.powerBasis', mathlib:Module.subsingleton, mathlib:Polynomial.monic_X_pow_sub_C, mathlib:Polynomial.natDegree_X_pow_sub_C, mathlib:Module.Basis.reindex, mathlib:Module.Basis.reindex_apply, mathlib:Module.Basis.equivFun, mathlib:Module.Basis.sum_equivFun, mathlib:Module.Basis.equivFun_symm_apply, mathlib:Module.Basis.tensorProduct_apply', mathlib:MonoidAlgebra.basis_apply, mathlib:ZMod.finEquiv, mathlib:ZMod.val_natCast_of_lt, mathlib:Multiplicative.toAdd.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- Over F_p with n=p, all n character vectors remain independent although μ_p(k) has one element.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Weighted permutation formula

Checked native proof refinement: Handle the subsingleton coefficient ring by Module.subsingleton exactly as for the source coordinates. In the nontrivial branch construct the quotient basis from AdjoinRoot.powerBasis' and reindex by natDegree(Xⁿ−f)=n. Use the existing MonoidAlgebra.basis for all elements of Multiplicative(ZMod n). Reindex characters through Multiplicative.toAdd and the inverse of ZMod.finEquiv n. By ZMod.val_natCast_of_lt, the forward Fin index i corresponds to the canonical residue class of i.val; MonoidAlgebra.basis_apply identifies its vector with e_i. Tensor the actual character and root bases; tensorProduct_apply' fixes the vector e_i⊗x^k. The native equivFun sum and inverse formulas give existence and uniqueness. This uses the group-algebra basis, never the set of A-valued roots of unity.

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.monomial.

For 0≤i,j<n, Θ(x^i⊗x^j)=f^⌊(i+j)/n⌋(e_i⊗x^((i+j) mod n)). The exponent is zero or one. The target index σ(i,j)=(i,(i+j) mod n) is a permutation: its inverse sends (i,k) to (i,k−i) when k≥i and to (i,n+k−i) when k<i.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Use the pure-tensor formula and the coaction weight law to obtain e_i⊗x^(i+j).
2. Use the actual quotient relation xⁿ=f and Euclidean division i+j=nq+r. Tensor balancing moves f^q to the coefficient.
3. Check the two displayed inverse indices are between zero and n−1, with sum wrapping exactly in the k<i branch. This proves bijectivity of σ without cancellation in A.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-tmul, FunctionFieldArithmeticPartII:RS.0/affine-coaction-weight, mathlib:AdjoinRoot.eval₂_root, FunctionFieldArithmeticPartII:RS.0/affine-root-power-reduction.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- The n=2 column (1,1) maps to f times target (1,0), explaining both branch and nonunit obstructions.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Kernel coefficient criterion

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.kernel_coefficients.

For c:(Fin n×Fin n)→A, Θ(Σ c_(i,j)(x^i⊗x^j))=0 iff c_(i,j)=0 when i+j<n and f c_(i,j)=0 when i+j≥n.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Rewrite the source sum as the specified synthesis inverse. For a zero image, extract the target coefficient at σp and use the complete coefficient table.
2. The wrap/lower equivalence gives precisely the nonwrapping zero and wrapping f-annihilation conditions.
3. Conversely evaluate every target coefficient q using σ⁻¹q and apply the assumed equations. Injectivity of the native target coordinate equivalence gives the zero image.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial, FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-map, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-synthesis, FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-wrap.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- The coefficient 2 in wrapping coordinate (1,1) lies in the kernel for A=Z/4,f=2.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Image coefficient criterion

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-image-coefficients. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.image_coefficients.

For d:(Fin n×Fin n)→A, Σ d_(i,k)(e_i⊗x^k) belongs to the A-linear range of Θ iff d_(i,k)∈fA for every k<i. There is no restriction on coordinates with k≥i.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. For a preimage z, use its actual source coordinates in the coefficient table. Every lower target coefficient is f times the source coefficient at σ⁻¹q.
2. Conversely choose a factor for each of the finitely many lower coefficients; use the coefficient itself elsewhere. Define the source family by transport along σ.
3. Synthesize that source family. Its image has exactly the target coefficients by the weighted table and the promoted target-extraction identity. Target coordinate injectivity proves equality.
4. The existing principal-ideal membership criterion identifies these f-multiple conditions with membership in fA.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial, mathlib:Ideal.mem_span_singleton', FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-map, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-extraction.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- At f=0 every strictly lower target coordinate must vanish, but upper and diagonal coordinates remain unrestricted.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Coordinate kernel equivalence

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.kernel_equiv.

Let W={(i,j)∈Fin n×Fin n:n≤i+j}. The native A-linear kernel of Θ is A-linearly equivalent to functions W→ann_A(f), where ann_A(f) is the kernel of multiplication by f on A. The forward map sends a kernel tensor to its W-coordinates in the source monic basis.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Take the specified wrapping kernel coordinate equivalence.
2. Apply its extraction formula and the existing source coefficient formula on every finite basis expansion. This proves the original existential statement with its specified forward map.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coordinate-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-synthesis.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- At n=1 W is empty, so the kernel is zero for every f, including f=0.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Coordinate module cokernel equivalence

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.cokernel_equiv.

Let L={(i,k)∈Fin n×Fin n:k<i}. The native A-module quotient (H⊗_A B)/range_A(Θ) is A-linearly equivalent to functions L→A/(f). On a target basis expansion its value at (i,k) is d_(i,k) modulo (f). This is not a quotient algebra, an orbit set or the reduced quotient of A/(f).

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Take the specified native module cokernel coordinate equivalence.
2. Its representative formula and the existing target coefficient formula on a finite basis expansion give the original residue contract. The carrier remains quotient by the A-linear range.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-coordinate-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-synthesis.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For Z/8,f=4,n=2 the cokernel retains an element of additive order four, rejecting reduction to F₂.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Sharp injectivity criterion

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-injective. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.injective_iff.

The A-algebra comparison Θ is injective iff n=1 or the map a↦fa on A is injective.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. For n=1 every coefficient is nonwrapping, so the kernel criterion makes the kernel zero.
2. For n>1 the source position (1,n−1) is wrapping. Place a−b there; if fa=fb the kernel criterion kills its actual synthesized tensor. Injectivity and source coefficient extraction imply a=b.
3. Conversely apply the kernel criterion to the source coordinate family of z−w. Injectivity of multiplication by f kills every wrapping coefficient, and target equality gives z=w.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-synthesis.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For Z,n=2,f=2 the map is injective although f is not a unit.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Sharp surjectivity criterion

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-surjective. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.surjective_iff.

The comparison Θ is surjective iff n=1 or f is a unit in A.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. For n=1 no strictly lower position exists; the image criterion gives every preimage.
2. For n>1 synthesize the target family single((1,0),1). Surjectivity and the image criterion give 1=fa for some a. The pinned commutative-ring unit criterion gives IsUnit f.
3. Conversely a right inverse of f multiplies each lower target coefficient to an explicit factor; apply the image criterion and target synthesis to an arbitrary native target element.
4. The zero ring is included, and no inverse of n enters.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-image-coefficients, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-synthesis, mathlib:isUnit_iff_exists_inv, mathlib:IsUnit.exists_right_inv.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For Z,n=2,f=2 the target e_1⊗1 is not in the image.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Sharp bijectivity criterion

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-bijective. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.bijective_iff.

The comparison Θ is bijective iff n=1 or f is a unit in A; invertibility of n is unnecessary.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Bijectivity implies surjectivity and the preceding criterion.
2. Conversely a unit has injective multiplication by multiplying an equality by its inverse. Combine the injectivity and surjectivity criteria, including the exponent-one alternative.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-injective, FunctionFieldArithmeticPartII:RS.0/affine-torsor-surjective.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For F₂,n=2,f=1 the comparison is bijective despite the nilpotent x−1 in B.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Unit-parameter algebra inverse

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-inverse. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.unit_inverse.

For a specified unit v∈A×, f=v, there is an A-algebra equivalence E:B⊗B≃H⊗B whose forward homomorphism is Θ. Its inverse sends e_1⊗1 to x⊗(v⁻¹x^(n−1)) and 1⊗b to 1⊗b for every b∈B.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Take the specified promoted comparison equivalence E_v.
2. Its forward-map identity and the two native inverse evaluation lemmas give the existing conjunction verbatim. The sharp bijectivity theorem fixes the actual comparison; no generic group-scheme points map or inverse of n is required.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-forward, FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-character, FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-right.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- The inverse is fixed by its generator formulas, rather than an unrelated abstract algebra equivalence.
- The separate exact-pin native extraction checks this statement and all four formerly admitted inherited examples with no admission dependency. This remains evidence for an unchecked plan, not full-file or geometric certification.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Weighted comparison determinant

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-determinant. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.determinant.

In the specified source and target pair-indexed bases, the comparison matrix has entry M_(r,c)=f^⌊(c₁+c₂)/n⌋ if r₁=c₁ and r₂=(c₁+c₂) mod n, and zero otherwise. With E=n(n−1)/2, det M=(−1)^((n−1)E) f^E. The same pair ordering is used for rows and columns; this is not an endomorphism determinant without chosen identifications.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. The monomial formula gives a weighted permutation matrix. The Leibniz determinant has only the σ term.
2. In row block i the permutation is the ith power of the cyclic rotation on n letters. Its sign is (−1)^((n−1)i), using the native cycle-range sign at the last index; multiply block signs.
3. The wrapping columns in row i are exactly i, so there are Σ_i i=E weights f and all remaining weights are 1. Multiply weights and signs. Both calculations take place integrally before specialization to A.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial, mathlib:Matrix.det_apply, mathlib:Fin.sign_cycleRange.

- TauCeti.RootStack.affineTorsorComparison.test_branch_image (computation): At n=2 over any commutative ring, Θ(t⊗t)=f • (e₁⊗1). In particular the branch parameter f=0 gives zero without a regularity assumption.

Acceptance:

- For n=2 the determinant is −f, including f=0 and nonreduced coefficient rings.

Sources: TV17 §3.1 pp.14–16, finite P=N grading and chart; [Stacks Tag 040N](https://stacks.math.columbia.edu/tag/040N), the unit-parameter finite-free cover. The coordinate calculations are derived here, not asserted to be printed standalone theorems in either source.

#### Rank loss at the zero section

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-rank. theorem. Native name: TauCeti.RootStack.affineTorsorComparison.zero_rank.

For any field k, n≥1 and f=0, dim_k range Θ=n(n+1)/2 and dim_k ker Θ=n(n−1)/2. No characteristic restriction is imposed.

Hypotheses:

- k is any field, n≥1 and f=0.

Construction or proof:

1. Pair the proved native image and kernel dimension formulas; both use the actual coaction-induced comparison. The full nilpotent branch algebra and arbitrary characteristic are retained.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-range-finrank, FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-kernel-finrank.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.zero_rank.test_two (computation): For any field k,n=2, the actual range and kernel dimensions are three and one.
- TauCeti.RootStack.affineTorsorComparison.zero_rank.test_four (computation): For k=Q,n=4, the actual range and kernel dimensions are ten and six.

Acceptance:

- For n=2 over every field, the source dimension is four, the range dimension three and the kernel dimension one.

Sources:

- TV17, §3.1 pp.14–16, character grading and Corollary 3.13, P=N: “induces an action”. The finite root-chart action motivates this root-specific coordinate calculation. The weighted matrix, kernel and cokernel formulas are explicit derivations below, not standalone theorems quoted from the paper.
- STACKS-KUMMER, Tag 040N, Lemma 59.28.3, unit-parameter finite-free cover and proof: “finite free of rank”. The unit-parameter cover motivates the torsor comparison. Nonunit obstructions and matrix formulas are derived here using the listed native algebra declarations; no geometric stack theorem is inferred.

## RS.1. Finite root stacks

The canonical root stack of a line bundle with section, including stack bases, Cartier divisors, affine quotient charts, base change, full fibres and relative coarse space; the invariant-ring calculation via the universal Hopf coaction, valid in arbitrary characteristic; the regular tame DM case. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader. Finite root data satisfy effective fpqc descent by the imported QCoh equivalence; algebraicity and coarse properties use their separate owners.

### Root stacks of line bundles and sections

Declaration: FunctionFieldArithmeticPartII:key/root-stacks. Definition.

For n≥1 and a line bundle with section (L,s) on a scheme X or an algebraic stack X, define √[n]{(L,s)/X} on T→X as the groupoid of root objects of (L_T,s_T). Pullback and its coherent isomorphisms define the fibred stack. For an effective Cartier divisor D use (O_X(D),s_D). Arbitrary exponents use the fppf topology; the étale description is asserted only when n is invertible.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Use the supplier’s line-bundle pullback and descent, retaining the root isomorphism and section equation.
2. Root-object morphisms descend since equality of sheaf maps is local; glue the line bundles, sections and φ effectively.
3. For a stack base, pull back to an atlas and descend with the same definition; do not replace the stack base by a coarse space.

Inputs: FunctionFieldArithmeticPartII:RS.0/root-object, SchemeAndStackFoundations:SF.1, mathlib:CategoryTheory.Pseudofunctor.Grothendieck, mathlib:CategoryTheory.Pseudofunctor.IsStack, mathlib:AlgebraicGeometry.Scheme.fppfTopology, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0.

API uses:

- Bresciani pp. 135–136 — Finite and infinite DVR roots use arbitrary n.
- Yun–Zhang Appendix A — Square roots of evaluation sections define root symmetric powers.
- AGV Appendix B — Makes root constructions relative over algebraic stacks.

API:

- TauCeti.RootStack.rootStack.object (characterisation): The fibre over T→X is exactly the root-object groupoid of (L_T,s_T).
- TauCeti.RootStack.rootStack.forget (projection): Forget root data to the base T→X.
- TauCeti.RootStack.rootStack.baseChange (functoriality): A base morphism induces pullback of root data with identity/composition coherence.
- TauCeti.RootStack.rootStack.universalRoot (universal-property): The stack carries the universal line bundle, section and n-th-power isomorphism; maps into it are equivalent to such root data.

Unit tests:

- TauCeti.RootStack.rootStack.test_exponent_one (degenerate): The n=1 stack is equivalent to X over X.
- TauCeti.RootStack.rootStack.test_unit_section (compatibility): For (O_X,1), every exponent gives a stack equivalent to X.
- TauCeti.RootStack.rootStack.test_zero_section (non-example): Over an algebraically closed field, (O,0) at invertible n>1 has μ_n automorphisms and is not the coarse point.
- TauCeti.RootStack.rootStack.test_stack_base (compatibility): At n=1 over BG the output is BG, rather than Spec k.

Acceptance:

- At n=1 the projection is an equivalence. For an invertible section it is an equivalence for every n, including p|n.

Planet: Root stacks.

Source:

- AGV08, B.2 pp. 53–54; stack-base sentence p. 54; TV §3 pp. 12–13. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Root stacks as a two-fibre product

Declaration: FunctionFieldArithmeticPartII:RS.1/two-pullback. Comparison.

Let A=[A¹/G_m] classify a line bundle with section and [n]:A→A take its n-th tensor power. The root stack is X×_{A,[n]}A with its universal root. For a stack base this is a two-fibre product, including the specified isomorphism, not an equality pullback of coarse points.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Unpack a two-pullback object: (x,(M,t),φ) with φ identifying (Mⁿ,tⁿ) and (L_x,s_x).
2. Identify arrows with the root-object compatibility equations.
3. Use the supplier’s two-Yoneda recognition of fibred-category equivalence.

Inputs: FunctionFieldArithmeticPartII:key/root-stacks, SchemeAndStackFoundations:SF.1, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0.

Acceptance:

- The isomorphism φ is retained, even when all geometric coarse points agree.

Source:

- AGV08, B.2 pp. 53–54 displayed fibre-product diagram. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Base change for finite root stacks

Declaration: FunctionFieldArithmeticPartII:RS.1/base-change. Lemma.

For any f:Y→X there is a canonical equivalence Y×_X√[n]{(L,s)/X}≃√[n]{(f*L,f*s)/Y}, compatible with identity and composition of f.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Associate the two-fibre products in the classifying diagram.
2. The universal root objects match by pullback; two-Yoneda identifies the comparison and its coherence.

Inputs: FunctionFieldArithmeticPartII:RS.1/two-pullback.

Acceptance:

- Includes inseparable and nonreduced base changes.

Source:

- TV17, Proposition 3.4 p. 13. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Affine quotient presentation

Declaration: FunctionFieldArithmeticPartII:RS.1/affine-chart. Theorem.

If X=Spec A and (L,s) is trivialized with s=f, then √[n]{(L,s)/X}≃[Spec AdjoinRoot(Tⁿ−f)/μ_n], with the diagonalizable action already constructed. This is a quotient stack with torsors, not an orbit set.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Use root-trivialization-equation and root-arrow-scalars on native trivializations: objects have unit u with u zⁿ=f and arrows have z_b=w z_a, u_b wⁿ=u_a. The generic quotient-stack/torsor construction remains SF.1; these scalar equations are its actual root-specific input.
2. Use the affine coaction and its laws. In trivial coordinates φ(eⁿ)=u with u a unit and section b e satisfying u bⁿ=f. Compatible normalized coframes e↦a form Spec A[a]/(aⁿ−u), which is the unit-parameter torsor by affine-torsor-unit-inverse and the imported finite-free/torsor criterion. The equivariant root-chart coordinate is x↦ab. It scales with weight one. Do not treat Spec A[x]/(xⁿ−f) as a torsor over Spec A at the branch locus.
3. On the torsor the root section is a function t satisfying tⁿ=f.
4. Conversely descend the trivial root line and function on an equivariant torsor; show the two operations inverse on objects and arrows.

Inputs: FunctionFieldArithmeticPartII:RS.1/two-pullback, FunctionFieldArithmeticPartII:RS.0/affine-action, SchemeAndStackFoundations:SF.1, FunctionFieldArithmeticPartII:RS.0/affine-coaction-counit, FunctionFieldArithmeticPartII:RS.0/affine-coaction-coassoc, FunctionFieldArithmeticPartII:RS.0/native-point-action, FunctionFieldArithmeticPartII:RS.0/root-trivialization-equation, FunctionFieldArithmeticPartII:RS.0/root-arrow-scalars, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0, AlgebraicModuliForArithmeticGeometry:R09.4, FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-inverse.

Acceptance:

- When f=0 the chart is Spec A[t]/tⁿ; its nilpotents remain present.

Planet: Affine root-stack charts.

Source:

- AGV08, B.2 p. 54; TV Corollary 3.13 p. 16, P=N. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Full and reduced root-stack fibres

Declaration: FunctionFieldArithmeticPartII:RS.1/closed-fibre. Theorem.

For a geometric point x with s(x)=0, the full fibre is [Spec κ(x)[t]/tⁿ /μ_n]. Its reduction is Bμ_n. If s(x)≠0 the fibre is the point. For n>1 the full closed fibre must not be identified with its reduced gerbe.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Pull the chart back to the geometric field, keeping the quotient ring tⁿ.
2. For s(x)=0 pass to the reduction t=0, then identify the residual classifying gerbe.
3. For s(x)≠0 the solution scheme is a μ_n-torsor and its quotient stack is the point.

Inputs: FunctionFieldArithmeticPartII:RS.1/base-change, FunctionFieldArithmeticPartII:RS.1/affine-chart, SchemeAndStackFoundations:SF.1, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0.

Acceptance:

- Over Q at n=2 the full fibre has t≠0 and t²=0; only its reduction is Bμ₂.

Planet: Root-stack fibres.

Source:

- AGV08, B.2 p. 54 closed-locus discussion; YZ19 A.1.3 pp. 515–516 corrected; B24 p. 135. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Coarse-space projection

Declaration: FunctionFieldArithmeticPartII:RS.1/coarse-space. Theorem.

For a scheme base X, the projection of the root stack to X is its coarse-space morphism. For an algebraic-stack base, it is relative coarse over X: after scheme base change it has the preceding coarse property. It is not an assertion that X is an absolute algebraic space.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Apply the affine-invariants theorem to the actual Hopf coaction, in arbitrary characteristic. The native monic basis also gives faithful coefficient inclusion in the nontrivial case.
2. Apply the supplier’s diagonalizable quotient coarse-space theorem, with its universal property; glue across trivializations.
3. Use base change to interpret the stack-base statement relatively.

Inputs: FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/base-change, SchemeAndStackFoundations:SF.1, FunctionFieldArithmeticPartII:RS.1/affine-invariants, AlgebraicModuliForArithmeticGeometry:R09.5.

Acceptance:

- At n=1 over BG the projection is identity BG; the absolute coarse space remains the coarse space of BG.

Source:

- TV17, §3 p. 12 saturated finite roots; Corollary 3.13 p. 16. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Regularity and the tame DM condition

Declaration: FunctionFieldArithmeticPartII:RS.1/regular-dm. Theorem.

If X is regular and D is a regular effective Cartier divisor, √[n]{(O(D),s_D)/X} is regular; when n is invertible on X it is Deligne–Mumford with μ_n inertia over D and trivial inertia outside D. If a geometric branch point has characteristic dividing n, its μ_n inertia is not étale, so the stack is not DM there. An empty divisor still gives X in every characteristic.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Locally choose a regular parameter f cutting out D; the equation tⁿ=f replaces that parameter and gives a regular chart.
2. For invertible n the finite diagonalizable stabilizer is étale; descend regularity through the atlas.
3. At an actual branch point use the computed μ_n inertia and its nonreduced characteristic-dividing part to obstruct the DM diagonal.

Inputs: FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/closed-fibre, SchemeAndStackFoundations:SF.1, AlgebraicModuliForArithmeticGeometry:R09.4.

Acceptance:

- On a DVR the n=2 root is regular in odd residue characteristic; the assertion is not that arbitrary sections cut regular divisors.

Source:

- AGV08, B.2 p. 54 smooth/normal-crossing root construction; YZ19 A.1.4 pp. 516–517. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Invariants of an affine root chart

Declaration: FunctionFieldArithmeticPartII:RS.1/affine-invariants. Theorem.

For every b∈B=A[t]/(tⁿ−f), δ(b)=1⊗b if and only if b=algebraMap(a) for some a∈A. Thus the scheme-theoretic invariant subalgebra is precisely the coefficient image, for all commutative A, f∈A and n≥1, including characteristic dividing n.

Hypotheses:

- A is any commutative ring, f∈A and n≥1. No reducedness, nonzerodivisor or invertibility-of-n hypothesis is imposed.

Construction or proof:

1. Separate the subsingleton coefficient-ring case: its unital algebra B and tensor algebra are subsingleton, so both assertions hold with a=0. This avoids invoking the polynomial degree theorem without its nontriviality hypothesis.
2. For nontrivial A, Xⁿ−f is monic and has nat-degree n. Import the native monic AdjoinRoot power basis and reindex along that equality to write b uniquely as ∑_{0≤i<n} a_i t^i. The generic quotient basis is already library mathematics.
3. Use the weight lemma and the tensor-product basis of the native group-algebra basis and root power basis. In δ(b), a_i occurs at (i mod n,i); in 1⊗b it occurs at (0,i). For 0<i<n these index pairs differ, forcing a_i=0. This remains valid with torsion or nilpotents; it never divides by n or averages over field-valued points.
4. Only a_0 remains, giving b=algebraMap(a_0). Conversely the A-algebra-map law and tensor scalar relation give δ(algebraMap(a))=1⊗algebraMap(a).

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-coaction, FunctionFieldArithmeticPartII:RS.0/affine-coaction-weight, mathlib:Polynomial.monic_X_pow_sub_C, mathlib:Polynomial.natDegree_X_pow_sub_C, mathlib:AdjoinRoot.powerBasis', mathlib:MonoidAlgebra.basis, mathlib:Module.Basis.tensorProduct.

Acceptance:

- At n=1 every element is a coefficient. At f=0 the nilpotent root powers remain independent. In characteristic p, field-point invariance is strictly weaker than δ-invariance.

Planet: Affine root invariants.

Source:

- TV17, §3.1 pp. 14–16, character grading before Lemma 3.7 and finite chart of Corollary 3.13, P=N. Root-specific coordinate calculation derived here from the finite P=N character grading. Native Hopf, quotient and basis declarations are imported, not rebuilt. This is not a claimed verbatim theorem of the paper.

### Fpqc descent of finite root data

Declaration: FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent. Theorem.

For every positive n and line bundle with section (L,s), the finite root-object pseudofunctor is a stack for the pinned fpqc topology, including on scheme test objects over a stack base. Thus its fppf restriction and its fpqc construction give the same root objects and arrows on every test scheme; the stronger descent assertion is a theorem, not an automatic change of topology.

Hypotheses:

- Any fpqc scheme cover; a fixed (L,s) and positive n.
- Tensor and unit pullback comparisons are the explicit JAC-A contract.

Construction or proof:

1. Apply the imported QCoh descent equivalence to the root line; rank-one finite-local-free detection makes the descended module invertible.
2. Regard a section as a module map O→M. Fullness descends that map, and the unit comparison identifies its domain.
3. Tensor/pullback comparisons identify the power of the descended line with the descent of the local powers. Descend the power isomorphisms and their inverses using full faithfulness.
4. The displayed section equation holds after the covering pullbacks; faithfulness makes it hold globally.
5. Apply the same full faithfulness to isomorphisms of root data and check their section and power equations; this proves effective object descent and sheaf descent for arrows.

Inputs: FunctionFieldArithmeticPartII:key/root-stacks, mathlib:AlgebraicGeometry.Scheme.fpqcTopology, AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent, AlgebraicModuliForArithmeticGeometry:R09.3/finite-locally-free-descent, FunctionFieldArithmeticPartII:RS.0/tensor-power, FunctionFieldArithmeticPartII:RS.0/section-power.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Planet: Fpqc root descent.

Source:

- TV17, Proposition3.10 proof p.16 and Definition3.8 p.15; fpqc quotient description; QCoh supplier is Stacks023T. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

## RS.2. Infinite root stacks and DVR fibres

Divisibility transitions and coherent inverse limits; finite DVR reduced fibres and the infinite reduced gerbe, with neutralizations distinguished from canonical constructions. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader. Native finite-free affine transition maps and their iterated-quotient basis; infinite affine fpqc quotient; factorial reindexing; compatible Kummer-torsor/class comparisons. Infinite H1 is fpqc, finite Kummer is fppf; the all-roots-of2 example rejects a change to fppf infinite torsors.

### Divisibility transition morphisms

Declaration: FunctionFieldArithmeticPartII:RS.2/transition. Construction.

For positive m,n the transition √[mn]{(L,s)}→√[n]{(L,s)} sends (M,t,φ) to (Mᵐ,tᵐ,φ), using the coherent identification (Mᵐ)ⁿ≅Mᵐⁿ. Transitions are compatible with base change and with multiplication of positive integers.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Use tensor-power reassociation from the line-bundle supplier.
2. Apply the same reassociation to the section equation.
3. The supplier’s monoidal coherence identifies composite transitions on root objects and arrows.

Inputs: FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.0/tensor-power, FunctionFieldArithmeticPartII:RS.0/section-power, FunctionFieldArithmeticPartII:RS.1/base-change.

API uses:

- TV Proposition 3.5 — Provides the compatible diagram whose inverse limit is the infinite root stack.
- Bresciani p. 135 — Transition maps identify the finite DVR root tower.

API:

- TauCeti.RootStack.transition.object (simp): The root line and section become Mᵐ and tᵐ.
- TauCeti.RootStack.transition.one (simp): The m=1 transition is the identity.
- TauCeti.RootStack.transition.comp (functoriality): Transitions for a and b compose to the transition for ab with the specified coherence.

Unit tests:

- TauCeti.RootStack.transition.test_identity (degenerate): Transition from n to n is identity.
- TauCeti.RootStack.transition.test_four_to_two (computation): A fourth root (M,t) maps to the square root (M²,t²).
- TauCeti.RootStack.transition.test_base_change (compatibility): Pulling a transition back to Y gives the transition of the pulled-back section.

Acceptance:

- The map is over X; n divides mn, and the direction goes from the finer root to the coarser root.

Source:

- TV17, Proposition 3.2 and divisibility functors p. 13. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Infinite root stacks

Declaration: FunctionFieldArithmeticPartII:RS.2/infinite-root-stack. Definition.

Define √[infinity]{(L,s)/X} as the two-inverse limit of the finite root stacks indexed by positive integers ordered by divisibility, on the fpqc scheme site. Its objects over T are compatible finite root objects with transition isomorphisms satisfying cocycles; arrows are compatible systems of root isomorphisms. It is an fpqc stack, hence also an fppf stack by restriction, and is not asserted to be an algebraic stack of finite presentation. Its affine quotient uses fpqc torsors.

Hypotheses:

- All finite exponents are positive. Infinite root objects and quotient torsors use the fpqc scheme site.

Construction or proof:

1. Use the already planned compatible-family carrier, retaining objects, arrows and unit/composition equations.
2. Every finite root is an fpqc stack by root-fpqc-descent. Apply the imported limit-stack-descent theorem to those components and their finite transitions.
3. For a single effective Cartier divisor, TV17 Proposition3.5 identifies the compatible system with its logarithmic infinite root. The local quotient comparison is its separate infinite-affine-quotient leaf.

Inputs: FunctionFieldArithmeticPartII:RS.2/transition, mathlib:CategoryTheory.Pseudofunctor.IsStack, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0, FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent, AlgebraicModuliForArithmeticGeometry:R09.4/limit-stack-descent.

API uses:

- Bresciani p. 135 — Defines the specialization gerbe for a DVR.
- TV Proposition 3.5 — Identifies the construction with the logarithmic infinite root in the single-divisor case.

API:

- TauCeti.RootStack.infiniteRootStack.projection (projection): Project a coherent system to its n-th root.
- TauCeti.RootStack.infiniteRootStack.lift (universal-property): A compatible family of maps into the finite roots determines a map into the two-limit, with compatible 2-morphisms.
- TauCeti.RootStack.infiniteRootStack.baseChange (functoriality): The two-limit commutes with base change in X.

Unit tests:

- TauCeti.RootStack.infiniteRootStack.test_unit_section (degenerate): The infinite root of (O_X,1) is X.
- TauCeti.RootStack.infiniteRootStack.test_projection (compatibility): Its n-th projection followed by a finite transition is the corresponding lower projection.
- TauCeti.RootStack.infiniteRootStack.test_coherence (non-example): Choosing unrelated n-th roots without transition isomorphisms does not define an infinite root object.

Acceptance:

- A set-theoretic inverse limit of isomorphism classes discards coherent automorphism data and is insufficient.

Planet: Infinite root stacks.

Source:

- TV17, Definition 3.3 p. 13 and Proposition 3.5 p. 14. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Base change for infinite root stacks

Declaration: FunctionFieldArithmeticPartII:RS.2/infinite-base-change. Lemma.

For f:Y→X the canonical map √[∞]{(f*L,f*s)/Y}→Y×_X√[∞]{(L,s)/X} is an equivalence, compatible with every finite projection.

Hypotheses:

- Finite roots are defined fppf and satisfy the stronger fpqc descent theorem. Infinite systems and infinite torsors use fpqc descent.

Construction or proof:

1. Apply finite base change at every exponent.
2. The comparisons preserve all transition isomorphisms and cocycles.
3. Construct inverse functors componentwise on compatible systems.

Inputs: FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, FunctionFieldArithmeticPartII:RS.1/base-change.

Acceptance:

- This includes the closed fibre of a mixed-characteristic DVR.

Source:

- TV17, Proposition 3.4 p. 13. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### DVR roots and change of uniformizer

Declaration: FunctionFieldArithmeticPartII:RS.2/dvr-roots. Comparison.

For a DVR A with uniformizer π and closed divisor D, the n-th root is [Spec A[t]/(tⁿ−π)/μ_n]. Replacing π by uπ gives a canonically equivalent stack as a root of the same Cartier pair; it does not require choosing an n-th root of u in A.

Hypotheses:

- The exponent n is a positive integer; the scheme or stack base and all base changes use the stated fppf topology.

Construction or proof:

1. Identify the two trivializations of O(D), whose change-of-frame is u.
2. Transport the Cartier pair through this isomorphism and use the root universal property.
3. Keep the torsor of possible chart lifts rather than choosing a nonexistent scalar root of u.

Inputs: FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:key/root-stacks.

Acceptance:

- For A=Z_(p), a unit need not have an n-th root; the stack construction is nevertheless uniformizer-independent.

Source:

- B24, p. 135 finite-root definition and uniformizer independence. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The infinite reduced DVR fibre

Declaration: FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe. Theorem.

The reduced closed fibre of the infinite root of a DVR with residue field k is the inverse system of the root gerbes of the normal line, banded by lim_n μ_n=Ẑ(1). It is noncanonically equivalent to B_kẐ(1); a chosen trivialization of the normal line gives a compatible neutralization. The neutralization is not part of the canonical root stack.

Hypotheses:

- Finite roots are defined fppf and satisfy the stronger fpqc descent theorem. Infinite systems and infinite torsors use fpqc descent.

Construction or proof:

1. Use the normal line to identify each reduced finite closed fibre with its n-th-root gerbe.
2. A trivialization of that one-dimensional k-space supplies compatible trivial root objects at all n.
3. The automorphisms form lim μ_n, and coherent descent gives the banded gerbe; use the source’s reduced-fibre convention for the infinite limit.

Inputs: FunctionFieldArithmeticPartII:RS.2/dvr-roots, FunctionFieldArithmeticPartII:RS.1/closed-fibre, FunctionFieldArithmeticPartII:RS.2/infinite-base-change, FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, SchemeAndStackFoundations:SF.1.

Acceptance:

- The full fibre retains nilpotent finite charts; only the reduced gerbe is identified with the classifying gerbe.

Planet: Infinite DVR root gerbe.

Source:

- B24, p. 135–136 reduced fibre H_c and its band. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Kummer classes of infinite-gerbe points

Declaration: FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes. Comparison.

After choosing a neutralization of the infinite reduced DVR gerbe over k, its k-points up to isomorphism identify with H1_fpqc(k,G), where G=lim_n μ_n, and with lim_n H1_fppf(k,μ_n)=lim_n k×/(k×)^n. Infinite torsors are fpqc; the finite Kummer calculation is fppf. The full groupoid retains G(k) automorphisms, and changing the neutralization changes the chosen origin.

Hypotheses:

- A DVR with residue field k of arbitrary characteristic and a chosen compatible neutralization.
- G is the fpqc inverse-limit sheaf of all μ_n, with power transition maps.

Construction or proof:

1. The neutralization identifies the reduced gerbe with fpqc G-torsors.
2. The Kummer torsor-limit comparison gives its actual finite tower, including the quotient identifications.
3. Apply kummer-limit-iso-detection for injectivity on classes and kummer-limit-class-lift for surjectivity; do not commute isomorphism classes with limits without these leaves.
4. Apply the exact finite fppf Kummer comparison at each exponent and retain its transition maps. The result is an identification with a chosen origin, not a loss of the automorphism groupoid.

Inputs: FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.2, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection, FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift.

Acceptance:

- Changing neutralization translates the Kummer classes; no canonical origin is asserted.
- The compatible roots-of2 torsor overQ is retained despite having no fppf local trivialization; H1_fppf(k,G) is not substituted for H1_fpqc(k,G).

Source:

- B24, p. 135–136 displayed H_c(k) and Kummer limit. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Affine divisibility transition

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition. Construction.

For B_n=A[T]/(T^n−f) and positive n,m, construct the A-algebra homomorphism j_(n,m):B_n→B_(nm) sending its distinguished root to the mth power of the target root. Constants are unchanged. This is the contravariant affine-chart map for the stack transition from an nmth root to an nth root.

Hypotheses:

- A is any commutative ring; all exponents appearing as denominators are positive.

Construction or proof:

1. In B_(nm), compute (root^m)^n=root^(mn)=f using its defining equation.
2. Apply the native algebra quotient lift, keeping the given A-algebra structures.
3. Use the native algebra-hom extensionality to verify the root/constant specification uniquely.

Inputs: mathlib:AdjoinRoot, mathlib:AdjoinRoot.liftAlgHom, mathlib:AdjoinRoot.eval₂_root, mathlib:AdjoinRoot.algHom_ext.

API uses:

- TV17 Proposition3.2 and Section3.1 — Makes the ring maps in the divisibility inverse system concrete.
- Bresciani p.135 — The finite DVR root tower uses these maps before taking its limit.

API:

- TauCeti.RootStack.affineTransition.root (simp): j_(n,m)(root_n)=root_(nm)^m.
- TauCeti.RootStack.affineTransition.constant (simp): j_(n,m) fixes the image of every coefficient in A.
- TauCeti.RootStack.affineTransition.unique (extensionality): An A-algebra map with the displayed root image equals j_(n,m).

Unit tests:

- TauCeti.RootStack.affineTransition.test_one (degenerate): The m=1 map is identity, with the evident exponent identification.
- TauCeti.RootStack.affineTransition.test_four_to_two (computation): For n=m=2 the coarse chart root maps to the square of the fourth-root chart variable.
- TauCeti.RootStack.affineTransition.test_nilpotent (non-example): For f=0, n=m=2 over a field, the source nilpotent root maps to the nonzero square of the target variable in k[u]/u^4; it is not killed.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Composition of affine root transitions

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-composition. Lemma.

With target exponents identified by associativity, j_(nm,k)∘j_(n,m)=j_(n,mk). The m=1 map is identity. These are equalities of actual algebra maps, not merely matches of closed points.

Hypotheses:

- A is any commutative ring; all exponents appearing as denominators are positive.

Construction or proof:

1. Both maps fix every coefficient.
2. Both send root_n to (root_(nmk)^k)^m=root_(nmk)^(mk).
3. Apply the native algebra-hom extensionality; at m=1 its root value is root_n.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition, mathlib:AdjoinRoot.algHom_ext.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- TV17, Proposition3.2 p.13 and Section3.1 root charts. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### The transition as an iterated monic quotient

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-iterated. Comparison.

Using j_(n,m) to make B_(nm) a B_n-algebra, there is a B_n-algebra equivalence B_n[U]/(U^m−root_n)≃B_(nm). It sends U to root_(nm), and coefficient root_n to root_(nm)^m.

Hypotheses:

- A is any commutative ring; all exponents appearing as denominators are positive.

Construction or proof:

1. Construct the forward quotient lift by U↦root_(nm); its defining equation is exactly the transition root formula.
2. Give the iterated quotient its inherited A-algebra structure. Its new root has nmth power f, so the native quotient lift constructs the inverse A-algebra map.
3. Check that the inverse respects B_n coefficients by the transition formula, upgrading it to a B_n-algebra map.
4. Check both composites on their distinguished roots using native quotient extensionality.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition, mathlib:AdjoinRoot.liftAlgHom, mathlib:AdjoinRoot.algHom_ext, mathlib:AdjoinRoot.eval₂_root.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### The finite-free transition basis

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-basis. Construction.

B_(nm), as a B_n-module through j_(n,m), has a specified basis indexed by Fin m, whose ith vector is root_(nm)^i. The assertion includes the zero ring; it supplies a linear equivalence with Fin m→₀B_n.

Hypotheses:

- A is any commutative ring; all exponents appearing as denominators are positive.

Construction or proof:

1. For a nonzero coefficient ring, the monic polynomial U^m−root_n has natDegree m; use the pinned monic power basis.
2. Transport the basis through the iterated quotient equivalence.
3. For a zero coefficient ring both the module and the Finsupp module are singleton; the unique linear equivalence gives the same indexed basis without claiming the polynomial has positive degree.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-iterated, mathlib:AdjoinRoot.powerBasis'.

API uses:

- Infinite affine root quotient — Faithful flatness of chart transitions ensures the colimit chart is a valid fpqc cover.
- Kummer torsor tower — Finite monic root charts retain effective, nonempty covers without invertibility of n.

API:

- TauCeti.RootStack.affineTransitionBasis.apply (simp): The ith basis vector is root_(nm)^i.
- TauCeti.RootStack.affineTransitionBasis.repr (data): Every element has unique coefficients in B_n at powers 0,…,m−1.
- TauCeti.RootStack.affineTransitionBasis.repr_symm (simp): The inverse coefficient map forms the displayed finite sum of powers.

Unit tests:

- TauCeti.RootStack.affineTransitionBasis.test_one (degenerate): At m=1 the basis has one vector, namely1.
- TauCeti.RootStack.affineTransitionBasis.test_four (computation): At n=m=2 every class is uniquely a+b*u with a,b in B_2.
- TauCeti.RootStack.affineTransitionBasis.test_zeroRing (non-example): For the zero ring the indexed basis is still valid although the defining polynomial has natDegree0; no nontriviality premise excludes this case.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Faithful flatness of root chart transitions

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-faithfully-flat. Theorem.

For all positive n,m, j_(n,m):B_n→B_(nm) is finite free and faithfully flat. Its Spec map is finite, flat and surjective. This statement concerns chart morphisms; the corresponding map of root stacks need not be representable.

Hypotheses:

- A is any commutative ring; all exponents appearing as denominators are positive.

Construction or proof:

1. The specified basis gives finite freeness.
2. Fin m is nonempty because m>0; its Finsupp module is faithfully flat by the existing instance.
3. Transport faithful flatness through the coefficient linear equivalence.
4. Use the supplier’s affine ring/scheme comparison for the Spec properties; at a branch point the root-stack map has a nontrivial stabilizer kernel when m>1, so it is not inferred representable.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-basis, mathlib:Module.FaithfullyFlat.finsupp, mathlib:Module.FaithfullyFlat.of_linearEquiv, SchemeAndStackFoundations:SF.1.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Planet: Finite-free root transitions.

Source:

- TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Factorial reindexing of the root limit

Declaration: FunctionFieldArithmeticPartII:RS.2/factorial-root-limit. Comparison.

Restriction of compatible root systems from all positive divisibility indices to 1!,2!,3!,… is an equivalence of groupoids, naturally over every test scheme. It preserves actual root arrows and transition isomorphisms, not merely their isomorphism classes.

Hypotheses:

- A fixed pair (L,s), positive divisibility indices and the coherent finite transition maps.

Construction or proof:

1. The factorial subsequence is increasing for divisibility, and each positive n divides N! once N≥n.
2. Extend a factorial root system to level n by taking its finite transition from a factorial multiple. For two choices use a larger factorial and the supplied transition isomorphisms to compare them.
3. The root-system cocycles make this comparison independent of refinements and make the extended transitions coherent.
4. Perform the same extension on arrows; restriction and extension have componentwise natural inverse comparisons.

Inputs: FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, mathlib:Nat.dvd_factorial, mathlib:Nat.factorial_dvd_factorial.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- TV17, Proposition3.5 and Remark3.6 p.14, cofinal systems. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### The fpqc Kummer torsor tower

Declaration: FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit. Theorem.

Over a field k let G=lim_(n|m) μ_n in the fpqc topology, with transition μ_(nm)→μ_n given by the mth power. The groupoid of fpqc G-torsors is equivalent to the two-limit of the groupoids of finite μ_n-torsors, with specified quotient comparisons and their cocycles. No finite-presentation or etale-local-triviality assertion for G is made.

Hypotheses:

- A field k of arbitrary characteristic.
- Infinite torsors are fpqc; finite μ_n torsors may be computed fppf.

Construction or proof:

1. The compatible trivial finite torsors give an actual k-object of the two-limit; nonemptiness is supplied rather than assumed away.
2. Apply the imported affine fpqc limit-gerbe theorem. Its automorphism sheaf at that object is exactly G, because an automorphism is a compatible sequence of finite translations.
3. Use the imported neutralization equivalence with that fixed object. Evaluation at each level is extension of torsors through G→μ_n.
4. On an affine cover the inverse is the compatible affine limit of finite torsors; the exact affine faithful-flat limit contract remains TOWER-AFF.

Inputs: DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, AlgebraicModuliForArithmeticGeometry:R09.4/classifying-abelian-gerbe, AlgebraicModuliForArithmeticGeometry:R09.4/nonempty-affine-limit-gerbe, AlgebraicModuliForArithmeticGeometry:R09.4/neutralization-equivalence, SchemeAndStackFoundations:SF.1, FunctionFieldArithmeticPartII:RS.2/factorial-root-limit, DiamondsAndVStacks:D0.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Planet: Infinite Kummer torsors.

Source:

- B24, p.133 fpqc classifying-stack convention; p.135 infinite root gerbe. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Finite stages detect Kummer tower isomorphisms

Declaration: FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection. Lemma.

Two compatible finite μ_n-torsor towers over a field k are isomorphic if their n-th torsors are isomorphic for every positive n. Individual finite-stage isomorphisms need not be chosen compatibly in advance.

Hypotheses:

- Compatible finite μ_n-torsor towers over a field; equality of their finite-stage isomorphism classes.

Construction or proof:

1. For each n take the set of equivariant k-isomorphisms between the two nth torsors. It is nonempty by the premise.
2. Once one isomorphism is fixed, this set is a torsor for μ_n(k); the pinned roots-of-unity equivalence and finite instance make it finite, even when μ_n is not etale.
3. The coherent tower quotient maps induce the restriction maps on these finite sets. Positive divisibility gives a cofiltered index category.
4. Apply the existing nonempty finite-system theorem to obtain a compatible sequence of isomorphisms. The groupoid limit comparison turns it into the required arrow.

Inputs: FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, AlgebraicModuliForArithmeticGeometry:R09.4/classifying-abelian-gerbe, mathlib:nonempty_sections_of_finite_cofiltered_system, mathlib:rootsOfUnityEquivNthRoots.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- B24, p.135 H1/Kummer inverse-limit statement, with the native finite-isomorphism proof supplied here. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Compatible Kummer classes lift to a torsor tower

Declaration: FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift. Lemma.

Every element of lim_n H1_fppf(k,μ_n) is the finite-stage class family of a coherent finite torsor tower, hence of an fpqc G-torsor. Compatible classes are converted to actual quotient isomorphisms, rather than treated as a preexisting compatible object.

Hypotheses:

- A field k; a compatible family of finite torsor classes.
- The finite torsor/H1 comparison is the stated SF.2 contract.

Construction or proof:

1. On the factorial subsequence choose a representative torsor at each level.
2. Equality of adjacent pushed-forward classes supplies an equivariant isomorphism from the quotient of the next torsor to the preceding torsor.
3. Compose these adjacent isomorphisms to obtain all transitions; a linearly ordered chain has no additional independent composition choices.
4. Extend the actual tower along the factorial cofinality equivalence and apply the fpqc torsor-limit comparison.

Inputs: FunctionFieldArithmeticPartII:RS.2/factorial-root-limit, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, SchemeAndStackFoundations:SF.2.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Source:

- B24, p.135 inverse-limit Kummer statement; TV17 Remark3.6 for cofinality. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### The infinite affine fpqc root quotient

Declaration: FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient. Theorem.

For B_n=A[T]/(T^n−f) with the displayed divisibility maps, put B_infinity=colim_n B_n and G=lim_n μ_n, with its diagonalizable grading action. The infinite root stack of (O_A,f) is [Spec B_infinity/G] as an fpqc quotient stack. Its morphism groupoids and finite projections agree with the two-limit of the finite roots. This is not asserted to be an algebraic stack of finite presentation.

Hypotheses:

- Any commutative ring A and f∈A.
- Infinite quotient and torsors use the fpqc topology; TOWER-AFF is an explicit supplier obligation.

Construction or proof:

1. For every compatible root system over T, form the finite frame torsors respecting its power identifications. Their maps are the finite μ transitions and are affine faithfully flat.
2. The TOWER-AFF contract makes their inverse limit an affine fpqc G-torsor; its universal frames give an equivariant map to Spec B_infinity.
3. Conversely an equivariant G-torsor map supplies the finite root data by finite quotient and the root-coordinate functions.
4. Compare the two constructions on objects and torsor arrows, with their finite-stage and base-change coherence.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-composition, FunctionFieldArithmeticPartII:RS.2/affine-transition-faithfully-flat, FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, SchemeAndStackFoundations:SF.1, DiamondsAndVStacks:D0.

Acceptance:

- No reducedness, Noetherian or invertibility-of-the-exponent hypothesis is introduced.

Planet: Infinite affine root charts.

Source:

- TV17, Definition3.8, Proposition3.10 with proof and Corollary3.13 pp.15–16, P=N. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### A degree bound for roots of two

Declaration: FunctionFieldArithmeticPartII:RS.2/kummer-degree-bound. Lemma.

If K/Q is a finite field extension and x∈K satisfies x^n=2 for positive n, then n≤[K:Q]. In particular no finite extension of Q contains compatible nth roots of2 for every positive n.

Hypotheses:

- K is a field with a Q-algebra structure and finite dimension over Q; n>0.

Construction or proof:

1. The monic integer polynomial X^n−2 satisfies Eisenstein at (2): nonleading coefficients are divisible by2 and its constant coefficient is not divisible by4.
2. Gauss comparison makes X^n−2 irreducible over Q.
3. Its root equation and monicity identify it with minpoly_Q(x).
4. The native degree bound gives n≤finrank_Q K. Choose n larger than that dimension to exclude roots at all levels.

Inputs: mathlib:Polynomial.irreducible_of_eisenstein_criterion, mathlib:Polynomial.IsPrimitive.Int.irreducible_iff_irreducible_map_cast, mathlib:minpoly.eq_of_irreducible_of_monic, mathlib:minpoly.natDegree_le.

Acceptance:

- For K=Q, only the n=1 case can have a root of2. A quadratic field may contain a square root but cannot contain a cube root of2. All positive n, including composite n, are covered by Eisenstein.

Source:

- B24, p.133 finite versus infinite torsor topology; explicit counterexample derivation by the listed Eisenstein and minimal-polynomial statements. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### An infinite Kummer torsor requiring fpqc descent

Declaration: FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf. Theorem.

Over Q, the compatible finite torsors P_n=Spec Q[T]/(T^n−2) define an fpqc G=lim_n μ_n torsor P_infinity. It has no section after any nonempty fppf Q-cover. Each individual P_n is fppf-locally trivial, so replacing all infinite torsors by fppf-locally trivial G-torsors loses this point of the infinite classifying gerbe.

Hypotheses:

- Base field Q; all positive root exponents.
- The finite-type chart and closed-point residue comparison are the exact SF.1 contract.

Construction or proof:

1. The element2 is a unit; each finite root chart is a μ_n torsor. The transition equations provide a coherent tower.
2. The fpqc torsor-limit comparison constructs P_infinity; the finite-free transition calculation also exhibits its affine fpqc cover.
3. Suppose it has a section on a nonempty fppf Q-scheme. Choose a nonempty affine finite-type open chart and a closed point. Its residue field is finite over Q by the pinned Zariski lemma.
4. Specialize the section to that field. It would contain an nth root of2 for every n, contradicting the degree-bound leaf.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-faithfully-flat, FunctionFieldArithmeticPartII:RS.2/affine-transition-composition, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:RS.2/kummer-degree-bound, mathlib:finite_of_finite_type_of_isJacobsonRing, SchemeAndStackFoundations:SF.1.

Acceptance:

- Every finite P_n is an fppf torsor, while their actual fpqc limit admits no nonempty fppf trivializing cover. The contradiction retains the finite residue-field degree, rather than choosing a field of unbounded degree.

Source:

- B24, p.133 fpqc necessity for non-finite-type groups; explicit all-roots-of2 example supplied here. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

## GC.0. Root Picard stacks

Graded line bundles with square roots along the reduced finite divisor R; square-action quotient, forgetful gerbe and the version carrying a root section. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### The graded root Picard stack

Declaration: FunctionFieldArithmeticPartII:GC.0/root-picard. Definition.

Pic_X^√R(S) is the groupoid of (L,K_R,ι), where L is a line bundle on X×S, K_R a line bundle on R×S and ι:K_R²≅L|_{R×S}. Its degree-d component imposes degree d on every geometric fibre; d ranges over all integers. Tensor product and dual give the graded commutative Picard stack.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Import the ordinary line-bundle Picard stack and restriction to R.
2. Take the root-gerbe two-pullback for the restricted line bundle; do not require a section.
3. Tensor and dual root data with the imported coherent line-bundle isomorphisms.

Inputs: FunctionFieldArithmeticPartII:key/root-stacks, SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.1, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0.

API uses:

- YZ19 A.2.2–A.2.3 — Carries the character local system in every integer degree.
- YZ19 A.3.1 — Receives the ramified norm.

API:

- TauCeti.RamifiedClassField.rootPicard.object (constructor): Create (L,K_R,ι) from the two line bundles and the square identification.
- TauCeti.RamifiedClassField.rootPicard.degree (projection): The degree is the fibrewise degree of L, additive under tensor product.
- TauCeti.RamifiedClassField.rootPicard.tensor (structure): Tensor two objects and their root identifications; dual gives inverse up to coherent isomorphism.
- TauCeti.RamifiedClassField.rootPicard.forget (projection): Forget K_R,ι to the ordinary Picard stack.

Unit tests:

- TauCeti.RamifiedClassField.rootPicard.test_empty_R (degenerate): At R=∅ this is the ordinary graded Picard stack.
- TauCeti.RamifiedClassField.rootPicard.test_degree_minus_one (non-example): Negative-degree components contain line bundles and are not declared empty.
- TauCeti.RamifiedClassField.rootPicard.test_stabilizer (characterisation): Over an algebraically closed field with r geometric branch points, forgetting roots has relative stabilizer μ₂^r.

Acceptance:

- Pic^d is a torsor component, with no chosen degree-one point required.

Planet: Root Picard stack.

Source:

- YZ19, Definition A.1 p. 514; A.1.1 p. 515. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Square-action presentation of the root Picard stack

Declaration: FunctionFieldArithmeticPartII:GC.0/square-action-quotient. Theorem.

Let Pic_{X,R} classify (L,γ:L|_R≅O_R). Then Pic_X^√R≃[Pic_{X,R}/[2]Res_{R/k}G_m], where the acting group changes the rigidification through its square. The forgetful morphism to Pic_X is a Res_{R/k}μ₂-gerbe.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Trivialize K_R fppf-locally; ι supplies the rigidification γ.
2. Changing the root-line frame by u changes γ by u², giving the square-action quotient.
3. The kernel is Res μ₂; verify the relative automorphism group and local lift property.

Inputs: FunctionFieldArithmeticPartII:GC.0/root-picard, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3, DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products, DiamondsAndVStacks:D0.

Acceptance:

- The unsquared action gives ordinary Pic_X and loses the ramification gerbe.

Planet: Square-action Picard quotient.

Source:

- YZ19, A.1.1 p. 515. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The root Picard stack with a root section

Declaration: FunctionFieldArithmeticPartII:GC.0/root-picard-section. Definition.

Pic_X^{√R;√R}(S) additionally carries α_R∈Γ(R×S,K_R). It does not carry a global section of L. The zero root section is allowed.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Add the actual section of K_R to the root-Picard objects and require arrows to preserve it.
2. The quotient description is the associated vector bundle with weight-one action on Res A¹ and square action on the rigidification.

Inputs: FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:RS.0/section-power.

API uses:

- YZ19 A.1.5 — The hat Abel–Jacobi map forgets the global section but retains α_R.
- YZ19 A.2.2 — Weighted affine charts use the root-section coordinate.

API:

- TauCeti.RamifiedClassField.rootPicardSection.object (constructor): Adjoin α_R to a root-Picard object, including α_R=0.
- TauCeti.RamifiedClassField.rootPicardSection.forget (projection): Forget α_R to Pic_X^√R.
- TauCeti.RamifiedClassField.rootPicardSection.squareEvaluation (projection): The squared section ι(α_R²) lies in L|_R.

Unit tests:

- TauCeti.RamifiedClassField.rootPicardSection.test_zero (degenerate): Every root-Picard object admits the zero root section.
- TauCeti.RamifiedClassField.rootPicardSection.test_empty_R (compatibility): At R=∅ the forgetful map is an equivalence.
- TauCeti.RamifiedClassField.rootPicardSection.test_weights (non-example): In the rigidified quotient α_R has weight one while the rigidification has weight two.

Acceptance:

- Requiring α_R≠0 or adding a global section changes this moduli problem.

Planet: Root Picard sections.

Source:

- YZ19, A.1.2 p. 515. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.1. Root divisors and Abel–Jacobi maps

Hat and nonzero-section spaces, evaluation pullbacks, smoothness, symmetric coarse spaces, tensor addition, ordered maps and both Abel–Jacobi maps. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### Hat and effective root symmetric powers

Declaration: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space. Definition.

For d≥0 let hatX_d^√R classify (L,K_R,ι,a,α_R) of degree d with a∈Γ(X×S,L) and ι(α_R²)=a|_{R×S}. Define X_d^√R as the open where a is nonzero on every geometric fibre, and U_d^√R as the inverse image of Sym^d(X−R). Hat spaces admit zero global sections and nonreduced bases.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Impose the equality between the squared root section and the restriction of a.
2. Use the ordinary curve supplier to show fibrewise-nonzero sections define relative effective divisors of degree d.
3. Take the inverse image of divisors supported away from R.

Inputs: FunctionFieldArithmeticPartII:GC.0/root-picard-section, SchemeAndStackFoundations:SF.3.

API uses:

- YZ19 Lemmas A.6–A.10 — Carries symmetric local systems and Abel–Jacobi pullbacks.
- YZ19 §6.2.1 — Hat zero-section points are necessary for coefficient sheaves on matrix-stack consumers.

API:

- TauCeti.RamifiedClassField.rootSymmetricPower.hatObject (constructor): Construct a hat object from the five data and the restriction equation.
- TauCeti.RamifiedClassField.rootSymmetricPower.effectiveOpen (characterisation): The open X_d consists exactly of sections nonzero on every geometric fibre.
- TauCeti.RamifiedClassField.rootSymmetricPower.forgetRoot (projection): Forgetting the root line and section maps to the ordinary degree-d section space.
- TauCeti.RamifiedClassField.rootSymmetricPower.awayFromR (compatibility): On divisors disjoint from R the root-forgetting map is an equivalence.

Unit tests:

- TauCeti.RamifiedClassField.rootSymmetricPower.test_d_zero (degenerate): At d=0 the effective space is Spec k; the section nowhere vanishes.
- TauCeti.RamifiedClassField.rootSymmetricPower.test_empty_R (compatibility): At R=∅ the effective space is Sym^d X.
- TauCeti.RamifiedClassField.rootSymmetricPower.test_closed_fibre (non-example): Over a divisor containing a branch point the full fibre has the nilpotent root chart, rather than only Bμ₂.
- TauCeti.RamifiedClassField.rootSymmetricPower.test_hat_zero (non-example): The hat degree-d space admits a=0 and α_R=0 for any root-Picard object in that degree.

Acceptance:

- Nonzero means fibrewise nonzero, not merely a nonzero element of the total section group.

Planet: Root symmetric powers.

Source:

- YZ19, Definition A.2 p. 515; A.1.3 pp. 515–516. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Evaluation description of root symmetric powers

Declaration: FunctionFieldArithmeticPartII:GC.1/evaluation-pullback. Comparison.

The root symmetric-power stack is the two-pullback of the ordinary evaluation map to [Res_R A¹/Res_R G_m] along its square-power map. Over a splitting field the latter is a product of copies of [A¹/G_m], one for each geometric point of R.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Evaluate the universal line bundle with section along R.
2. Identify the square-root fibre data with K_R,α_R,ι by the root two-pullback.
3. Descent through the finite étale splitting of R identifies the Weil restriction and product description.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:RS.1/two-pullback, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3.

Acceptance:

- ρ is the number of geometric branch points after base change, not the number of closed points over k.

Source:

- YZ19, A.1.3 diagram (A.1) p. 516. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Incidence divisors meet transversely

Declaration: FunctionFieldArithmeticPartII:GC.1/incidence-transversality. Lemma.

After splitting R, in Sym^d X each incidence divisor D_x of effective divisors containing x is smooth, and intersections for a subset I of distinct branch points identify with Sym^{d−|I|}X when d≥|I|, with codimension |I|; the intersection is empty when d<|I|.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use addition of the fixed reduced divisor Σ_{x∈I}x to identify the intersection.
2. The ordinary symmetric-power supplier gives smoothness and dimension d−|I|.
3. Use the dimension calculation to obtain normal-crossing transversality.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, SchemeAndStackFoundations:SF.3.

Acceptance:

- Repeated roots of the moving divisor do not replace distinct branch points in I.

Source:

- YZ19, Proof of Lemma A.4 pp. 516–517. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The evaluation smoothness criterion

Declaration: FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion. Lemma.

For a smooth Z over the algebraically closed base, a map Z→[A^r/G_m^r] given by r line bundles with sections is smooth exactly when their zero divisors are smooth and meet transversely, including the empty strata.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Trivialize the line bundles and pull back the standard torus atlas.
2. Translate smoothness to the differential rank of the section coordinates on every vanishing stratum.
3. Smooth divisors and independent conormals supply that rank; conversely smoothness pulls back the coordinate normal-crossing strata.

Inputs: FunctionFieldArithmeticPartII:RS.1/two-pullback, SchemeAndStackFoundations:SF.1.

Acceptance:

- A zero section on all of Z fails the smooth divisor condition.

Source:

- YZ19, Lemma A.3 p. 516. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Smoothness of root symmetric powers

Declaration: FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth. Theorem.

The effective root symmetric power X_d^√R is smooth over k of dimension d and is DM. Its evaluation map to [Res_R A¹/Res_R G_m] is smooth.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the incidence calculation to show ordinary evaluation is smooth.
2. Pull that map back along the square-power classifying map to obtain root evaluation smoothness.
3. The root chart and invertibility of two give the smooth DM stack and its dimension.

Inputs: FunctionFieldArithmeticPartII:GC.1/incidence-transversality, FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion, FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:RS.1/regular-dm.

Acceptance:

- This is not a claim that the whole hat section space is smooth in arbitrary degree.

Planet: Root symmetric-power smoothness.

Source:

- YZ19, Lemma A.4 pp. 516–517. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Coarse symmetric-power space

Declaration: FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse. Theorem.

The root-forgetting projection X_d^√R→Sym^d X is its coarse-space morphism and is an equivalence over Sym^d(X−R).

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply the relative root coarse-space theorem to the evaluation two-pullback.
2. Away from the incidence divisors the section is invertible, so the root universal property gives an equivalence.

Inputs: FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:RS.1/coarse-space, FunctionFieldArithmeticPartII:RS.1/base-change.

Acceptance:

- The full fibre at an incidence divisor is still the quotient nilpotent chart.

Planet: Root symmetric coarse space.

Source:

- YZ19, A.1.3 p. 516. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Addition of root divisors

Declaration: FunctionFieldArithmeticPartII:GC.1/root-addition. Construction.

For d,e≥0 tensor L and K_R and multiply both sections to define hatadd_{d,e}:hatX_d^√R×hatX_e^√R→hatX_{d+e}^√R. Restriction gives addition on the effective opens; the same construction gives effective-divisor translation of the hat space.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use tensor products of the two root isomorphisms.
2. The product section satisfies the restriction equation because tensor and restriction commute.
3. A product of fibrewise-nonzero sections on an integral smooth curve is fibrewise nonzero.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:RS.0/section-power.

API uses:

- YZ19 A.2.1 — Defines p_d and the multiplicativity maps.
- YZ19 §6.1.4 — The specialized hat translation consumer imports this operation.

API:

- TauCeti.RamifiedClassField.rootAddition.object (simp): Root addition tensors line bundles and multiplies sections.
- TauCeti.RamifiedClassField.rootAddition.unit (simp): Adding the degree-zero unit object gives the original divisor.
- TauCeti.RamifiedClassField.rootAddition.coherence (structure): Associativity and symmetry are the imported coherent tensor isomorphisms, with the same section equations.

Unit tests:

- TauCeti.RamifiedClassField.rootAddition.test_empty (degenerate): Adding two empty divisors gives the empty divisor.
- TauCeti.RamifiedClassField.rootAddition.test_ordinary (compatibility): At R=∅ this is ordinary symmetric-power addition.
- TauCeti.RamifiedClassField.rootAddition.test_branch_section (non-example): Two zero root-section values multiply to zero, rather than cancel or become nonzero.

Acceptance:

- The empty degree-zero divisor is the addition unit; root sections are multiplied, not added.

Planet: Addition of root divisors.

Source:

- YZ19, A.1.4 pp. 517–518. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The ordered root-divisor morphism

Declaration: FunctionFieldArithmeticPartII:GC.1/ordered-divisors. Construction.

Iterated addition defines p_d:(X_1^√R)^d→X_d^√R, with its S_d-equivariance and the degree-zero unit map.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Iterate addition using the fixed associativity coherence.
2. Permute factors through the tensor symmetry and prove the symmetric-group relations.
3. Define the empty product as the degree-zero unit object.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-addition.

API uses:

- YZ19 Lemmas A.6–A.8 — Produces the invariant direct image and its symmetric-group action.

API:

- TauCeti.RamifiedClassField.orderedRootDivisors.one (simp): p_1 is the identity.
- TauCeti.RamifiedClassField.orderedRootDivisors.permutation (functoriality): Every σ∈S_d acts on the source and p_d is equivariant with coherent target isomorphisms.
- TauCeti.RamifiedClassField.orderedRootDivisors.blockAddition (compatibility): Concatenating ordered tuples agrees with root addition after their separate p_d maps.

Unit tests:

- TauCeti.RamifiedClassField.orderedRootDivisors.test_zero (degenerate): p_0 maps the point to the empty root divisor.
- TauCeti.RamifiedClassField.orderedRootDivisors.test_one (compatibility): p_1 is identity on the root curve.
- TauCeti.RamifiedClassField.orderedRootDivisors.test_collision (non-example): p_2 is not representable at two equal branch points: its relative inertia contains diagonal μ₂.

Acceptance:

- At a collision of two branch points the stabilizer map μ₂×μ₂→μ₂ has a nontrivial kernel.

Source:

- YZ19, A.1.4 (A.3) p. 518. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Properness and tame finite relative fibres

Declaration: FunctionFieldArithmeticPartII:GC.1/ordered-proper. Lemma.

The ordered map p_d is proper and quasi-finite in the nonrepresentable stack sense; the generic distinct-point locus is an S_d-cover. Its finite relative stabilizers are tame μ₂-products. No representably finite morphism is asserted at branch collisions.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. On coarse spaces use proper finite ordinary symmetric-power addition from the curve supplier.
2. The root stacks are proper over their coarse spaces and have finite tame inertia; apply the supplier’s properness comparison.
3. Compute collision stabilizers by the multiplication maps μ₂^m→μ₂; their kernels account for nonrepresentability.

Inputs: FunctionFieldArithmeticPartII:GC.1/ordered-divisors, FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse, FunctionFieldArithmeticPartII:RS.1/closed-fibre, SchemeAndStackFoundations:SF.1.

Acceptance:

- The two-equal-branch-point example detects misuse of a representable finite-map theorem.

Source:

- YZ19, A.1.4 and A.2.1 pp. 518–519; source gate G4. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Root Abel–Jacobi maps

Declaration: FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi. Construction.

Define hatAJ_d:hatX_d^√R→Pic_X^√R,d by forgetting a and α_R, and the refined map retaining α_R to Pic_X^{√R;√R,d}. Restrict the first map to AJ_d:X_d^√R→Pic_X^√R,d. Addition commutes with the product AJ_d×AJ_e and Picard tensor multiplication.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Define both functors by explicit forgetful operations on objects and arrows.
2. Their composition forgets exactly the root section.
3. Compare tensoring and forgetting on data to obtain the product square with specified 2-isomorphism.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:GC.0/root-picard-section, FunctionFieldArithmeticPartII:GC.1/root-addition.

API uses:

- YZ19 A.2.2–A.2.3 — Defines high-degree descent and hat coefficient pullbacks.

API:

- TauCeti.RamifiedClassField.rootAbelJacobi.hat (projection): The hat map forgets both sections and retains the two root line bundles and ι.
- TauCeti.RamifiedClassField.rootAbelJacobi.refined (projection): The refined map forgets a and retains α_R.
- TauCeti.RamifiedClassField.rootAbelJacobi.addition (compatibility): AJ_{d+e}∘add≅mult∘(AJ_d×AJ_e).

Unit tests:

- TauCeti.RamifiedClassField.rootAbelJacobi.test_empty_R (compatibility): At R=∅ the effective map is the ordinary Abel–Jacobi map to Pic^d.
- TauCeti.RamifiedClassField.rootAbelJacobi.test_zero (degenerate): At d=0 the effective point maps to the tensor unit.
- TauCeti.RamifiedClassField.rootAbelJacobi.test_hat_zero (non-example): A zero global section still has a defined hatAJ image.

Acceptance:

- The refined target retains α_R; the ordinary target does not.

Planet: Root Abel–Jacobi maps.

Source:

- YZ19, A.1.5 p. 518. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.2. Adelic root Picard groupoids

Modified local-unit fibre products and the idele double-quotient groupoid, with stabilizers and degree retained. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### Modified local units at ramified places

Declaration: FunctionFieldArithmeticPartII:GC.2/root-units. Definition.

At x∈R let O_{√x}×={(u,v)∈O_x××k(x)× : ū=v²}, with componentwise multiplication. For x∉R use O_x×. Let O_{√R}× be their product. Its map to adelic units forgets v and has kernel ∏_{x∈R}μ₂(k(x)); do not assume it is injective.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the parent’s local completions, valuation-ring units and residue map.
2. Take the fibre product of multiplicative groups along reduction and the square homomorphism.
3. Form the finite modification of the ordinary unit product, with its actual map to ideles.

Inputs: FunctionFieldArithmetic:FA.2.

API uses:

- YZ19 Lemma A.5 — Gives the action group used in the idele groupoid.
- YZ19 Proposition A.12 — The quadratic character is trivial on its image.

API:

- TauCeti.RamifiedClassField.rootUnits.mk (constructor): Create (u,v) with ū=v².
- TauCeti.RamifiedClassField.rootUnits.forget (projection): Project to u in O_x× and to the corresponding idele unit.
- TauCeti.RamifiedClassField.rootUnits.kernel (characterisation): The kernel consists of u=1 and v²=1.

Unit tests:

- TauCeti.RamifiedClassField.rootUnits.test_empty_R (degenerate): At R=∅ the product is the ordinary unit product.
- TauCeti.RamifiedClassField.rootUnits.test_minus_one (non-example): At a ramified place, (1,−1) is a nontrivial kernel element.
- TauCeti.RamifiedClassField.rootUnits.test_nonsquare (computation): A unit with nonsquare residue has no lift to this group.

Acceptance:

- The square operation on residue elements is not additive in odd characteristic; no fibre-product ring is defined here.

Planet: Ramified root units.

Source:

- YZ19, A.1.6 pp. 518–519. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The adelic root Picard groupoid

Declaration: FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid. Theorem.

There is an equivalence Pic_X^√R(k)≃F×\A_F×/O_{√R}× as a double-action groupoid. The right action uses the actual noninjective homomorphism to idele units. Degree and all stabilizers are retained. At x∉R, π_x⁻¹ represents O_X(x)^♮.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Choose a generic trivialization of L and compatible local trivializations; the root-line frame along R yields the residue-square data.
2. Changing the generic and integral frames produces the left F× and right root-unit actions.
3. Reverse by gluing line bundles and root data, and identify automorphisms; use the divisor/idele dictionary with the π⁻¹ sign.

Inputs: FunctionFieldArithmeticPartII:GC.2/root-units, FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmetic:FA.2, SchemeAndStackFoundations:SF.3.

Acceptance:

- For R=∅ recover the Picard groupoid, not just the class group; root-unit kernel elements remain stabilizers.

Planet: Adelic root Picard groupoid.

Source:

- YZ19, Lemma A.5 p. 519 and proof. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Root divisors supported away from R

Declaration: FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid. Comparison.

The groupoid of root divisors used in §6.2.3 is the effective open X_d^√R(k) with its root data and automorphisms; forgetting the root gives the ordinary divisor. The character on differences of such objects is evaluated through the adelic root-Picard equivalence, not through an unweighted set bijection.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Identify the effective global section with its Cartier divisor using the imported divisor dictionary.
2. Retain the line and root isomorphisms in the morphism groupoid.
3. Apply root Abel–Jacobi and the adelic equivalence to differences.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid.

Acceptance:

- Any matrix-stack integration consumer retains the factor 1/#Aut; constructing that specialized matrix stack belongs to ShtukaSpecialCyclesAndHigherSiegelWeil.

Source:

- YZ19, §6.2.3 p. 499, Lemma 6.4 (6.9); Definition A.2 p. 515. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.3. Symmetric local systems

Tame rank-one coefficients, collision descent, graded symmetric powers, exterior-power cohomology and associative multiplicativity. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### Rank-one local systems on the root curve

Declaration: FunctionFieldArithmeticPartII:GC.3/tame-local-systems. Theorem.

Rank-one Q̄ℓ-local systems L on X_1^√R correspond to rank-one tame local systems on U=X−R whose geometric inertia characters have order dividing two. Their global monodromy can have arbitrary order; in particular an unramified character of order three is allowed.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use local root charts to identify tame inertia with the residual μ₂ action.
2. A tame character factors through this action exactly when its local inertia square is one.
3. Glue using full faithful étale-local-system restriction and descent; the fundamental-group comparison for root stacks is the precise stack extension recorded in gap ST-LISSE.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth, FunctionFieldArithmeticPartII:RS.1/closed-fibre, InverseGaloisAndArithmeticFundamentalGroups:IG.0, InverseGaloisAndArithmeticFundamentalGroups:IG.1.

Acceptance:

- The quadratic cover supplies a special input, not the general definition.

Planet: Tame root-curve local systems.

Source:

- YZ19, A.2 first paragraph p. 519; A.2.3 p. 520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Symmetric tensor local systems

Declaration: FunctionFieldArithmeticPartII:GC.3/symmetric-local-system. Construction.

For L as above and d≥0 define K_d=(p_{d,!}L^{⊠d})^{S_d} with no shift, and L_d=H⁰(K_d). The collision and middle-extension lemmas prove K_d≅L_d, with L_d lisse rank one and L_d[d] perverse. The invariant projector is d!⁻¹Σσ over Q̄ℓ, including when ℓ divides d!.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Take the external tensor product with its genuine symmetry maps.
2. Apply the source-qualified tame stack proper pushforward, then the rational invariant projector.
3. Use the collision kernel and middle-extension lemmas below to prove this is lisse and concentrated in degree zero; the construction itself is the unshifted invariant complex.

Inputs: FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:GC.1/ordered-divisors, FunctionFieldArithmeticPartII:GC.1/ordered-proper.

API uses:

- YZ19 Lemmas A.6–A.11 — Supplies the cohomology, translation and character-sheaf maps.

API:

- TauCeti.RamifiedClassField.symmetricLocalSystem.zero (simp): L_0 is the coefficient line on Spec k.
- TauCeti.RamifiedClassField.symmetricLocalSystem.one (simp): L_1=L under p_1=id.
- TauCeti.RamifiedClassField.symmetricLocalSystem.invariantProjector (characterisation): L_d is the image of d!⁻¹Σσ on the unshifted p_{d,!}L^{⊠d}.
- TauCeti.RamifiedClassField.symmetricLocalSystem.perverseShift (compatibility): L_d[d] is the perverse intermediate extension from the distinct-point open.

Unit tests:

- TauCeti.RamifiedClassField.symmetricLocalSystem.test_zero (degenerate): The zeroth symmetric local system is the coefficient line in degree zero.
- TauCeti.RamifiedClassField.symmetricLocalSystem.test_one (compatibility): The first symmetric local system is L in degree zero.
- TauCeti.RamifiedClassField.symmetricLocalSystem.test_shift (non-example): At d=1 the complex L[1] is perverse, while L is the unshifted lisse sheaf.
- TauCeti.RamifiedClassField.symmetricLocalSystem.test_order_three (non-example): An unramified order-three character still gives this construction.

Acceptance:

- L_0=Q̄ℓ and L_1=L; the shift does not belong in the degree-zero local-system definition.

Planet: Symmetric tensor local systems.

Source:

- YZ19, A.2.1 p. 519, corrected perverse shift (source issue E26). The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Collision kernels act trivially on the tensor line

Declaration: FunctionFieldArithmeticPartII:GC.3/collision-kernel. Lemma.

At a geometric divisor Σm_x x, the relative inertia of the ordered map over a branch point x is ker(μ₂^{m_x}→μ₂). It acts trivially on L_x^{⊗m_x}, since the same rank-one character occurs in every factor.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Describe root tensor addition on the stabilizer groups as multiplication.
2. Evaluate the tensor character as the product of the same character on each factor.
3. On the kernel this is the character of one, and permutation acts trivially on the ungraded rank-one tensor fibre.

Inputs: FunctionFieldArithmeticPartII:GC.1/ordered-divisors, FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:RS.1/closed-fibre.

Acceptance:

- If the factors had unrelated inertia characters, the same kernel-triviality assertion would fail.

Source:

- YZ19, Proof of Lemma A.7 pp. 519–520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The symmetric complex is a shifted middle extension

Declaration: FunctionFieldArithmeticPartII:GC.3/middle-extension. Lemma.

The rational invariant object (p_{d,!}L^{⊠d}[d])^{S_d} is the perverse intermediate extension of the distinct-point local system. Its unshifted stalks have no higher relative cohomology because the relative fibres are finite tame groupoids with rational coefficients.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply the supplier’s precise proper quasi-finite tame-DM pushforward and intermediate-extension theorem; it must allow the computed nonrepresentable map.
2. Average S_d over characteristic-zero coefficients.
3. At finite stabilizer fibres use rational group-cohomology vanishing to retain degree-zero stalks.

Inputs: FunctionFieldArithmeticPartII:GC.1/ordered-proper, FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.3/collision-kernel.

Acceptance:

- A representably finite-map theorem alone is not enough; this contract is explicitly gap ST-OPS.

Source:

- YZ19, A.2.1 pp. 519–520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Lisse rank-one descent across collisions

Declaration: FunctionFieldArithmeticPartII:GC.3/collision-descent. Theorem.

L_d is a rank-one local system on all of X_d^√R, including repeated branch divisors.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply proper base change at a geometric divisor and factor the ordered fibre by its multiplicities.
2. The kernel acts trivially on each tensor line and its rational higher cohomology vanishes.
3. The intermediate-extension object has rank-one stalks on the smooth root stack; the supplier’s lisse rank-one extension criterion identifies it with a lisse sheaf.

Inputs: FunctionFieldArithmeticPartII:GC.3/collision-kernel, FunctionFieldArithmeticPartII:GC.3/middle-extension.

Acceptance:

- At 2x for x∈R the rank stays one even though the ordered map is nonrepresentable.

Planet: Collision descent.

Source:

- YZ19, Lemma A.7 pp. 519–520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Vanishing outside degree one for a nontrivial input

Declaration: FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing. Lemma.

If L is geometrically nontrivial on the proper root curve, H⁰(X_1^√R_kbar,L)=H²(X_1^√R_kbar,L)=0; its cohomology is concentrated in degree one.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Global invariant sections vanish for a geometrically nontrivial rank-one character.
2. The corresponding dual character is geometrically nontrivial, so smooth-DM Poincaré duality kills H².
3. Use the curve cohomological-dimension bound through the tame coarse-space comparison; its stack extension is recorded in ST-OPS.

Inputs: FunctionFieldArithmeticPartII:GC.3/tame-local-systems, EtaleDualityAndPerverseSheaves:EDC.2:pairings.

Acceptance:

- The constant sheaf is excluded: on P¹ it has nonzero H⁰ and H².

Source:

- YZ19, Proof of Lemma A.6 p. 519. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Graded symmetric invariants are exterior powers

Declaration: FunctionFieldArithmeticPartII:GC.3/koszul-exterior. Lemma.

For a vector space V concentrated in cohomological degree one, the S_d-invariants of its d-fold graded tensor power are ∧^dV in degree d. The permutation action includes the Koszul sign, so this is the exterior rather than the ordinary symmetric power.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. A transposition acts by minus the ordinary flip on degree-one factors.
2. Thus the invariant projector is the antisymmetrizer; use the native exterior-power universal property over Q̄ℓ.
3. The total degree of d degree-one factors is d. The required comparison to the native exterior-power type is an explicit algebra API obligation, not a new exterior-algebra definition.

Inputs: mathlib:ExteriorAlgebra.exteriorPower, FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing.

Acceptance:

- For dim V=1 and d=2 the invariant space is zero; the ordinary symmetric square would be nonzero.

Source:

- YZ19, Proof of Lemma A.6 p. 519. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Exterior-power cohomology

Declaration: FunctionFieldArithmeticPartII:GC.3/exterior-cohomology. Theorem.

For geometrically nontrivial L, H^i(X_d^√R_kbar,L_d)=0 for i≠d, and H^d≅∧^dH¹(X_1^√R_kbar,L), naturally and Frobenius-equivariantly. This includes d=0; exterior powers vanish for d above dim H¹.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply the stack Künneth theorem and proper-pushforward cohomology comparison to the ordered product.
2. The rational invariant projector commutes with cohomology.
3. Identify the resulting graded invariants by the Koszul lemma.

Inputs: FunctionFieldArithmeticPartII:GC.3/collision-descent, FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing, FunctionFieldArithmeticPartII:GC.3/koszul-exterior.

Acceptance:

- At d=0 the result is H⁰=Q̄ℓ; it does not contradict input H⁰ vanishing.

Planet: Exterior-power cohomology.

Source:

- YZ19, Lemma A.6 p. 519. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Multiplicativity on the distinct-point open

Declaration: FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product. Lemma.

On the locus where the two effective divisors have mutually disjoint support away from R, add*L_{d+e}≅L_d⊠L_e by concatenating the tensor lines on ordered divisors.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Pull back to the finite ordered distinct-point cover.
2. Identify tensor products by block concatenation and descend the S_d×S_e-equivariant isomorphism.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-addition, FunctionFieldArithmeticPartII:GC.3/symmetric-local-system.

Acceptance:

- The isomorphism is the tensor associativity map, not an arbitrary scalar choice.

Source:

- YZ19, Proof of Lemma A.8 p. 520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Multiplicativity on every effective degree

Declaration: FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity. Theorem.

The distinct-point isomorphism extends uniquely to α_{d,e}:add*L_{d+e}≅L_d⊠L_e on X_d^√R×X_e^√R.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Both sides are lisse on a normal connected product stack.
2. Restriction to its dense distinct-point open is fully faithful for lisse sheaves.
3. Extend the isomorphism and its inverse uniquely using the stack restriction theorem in ST-LISSE.

Inputs: FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product, FunctionFieldArithmeticPartII:GC.3/collision-descent, FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Acceptance:

- The extension includes repeated branch divisors.

Planet: Symmetric local-system multiplication.

Source:

- YZ19, Lemma A.8 p. 520. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Associativity of symmetric multiplicativity

Declaration: FunctionFieldArithmeticPartII:GC.3/symmetric-associativity. Lemma.

For d,e,f≥0 the two composites of α_{d,e}, α_{d+e,f} and α_{e,f}, α_{d,e+f} agree after the specified tensor/addition associators.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. On the distinct-point ordered cover both composites are the same reassociation of three tensor blocks.
2. Use full faithfulness of dense-open restriction on the normal product to extend that equality.

Inputs: FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product.

Acceptance:

- This equality is needed for auxiliary-divisor comparisons, not an unspecified coherence field.

Source:

- YZ19, Lemma A.8 p. 520 and A.2.3 p. 523 coherence argument. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Symmetry and degree-zero unit

Declaration: FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry. Lemma.

The α_{d,e} isomorphisms commute with exchanging d,e and with the ordinary symmetry of rank-one sheaves; α_{0,d} and α_{d,0} are the canonical unit isomorphisms.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Check permutation of two tensor blocks on the ordered distinct-point locus.
2. At degree zero the empty tensor is the coefficient line and concatenation is identity.
3. Extend the equality using the same restriction full faithfulness.

Inputs: FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product.

Acceptance:

- There is no Koszul sign on these degree-zero local systems; the sign belongs to degree-one cohomology.

Source:

- YZ19, Lemma A.8 p. 520; A.2.3 p. 523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.4. High-degree Abel–Jacobi descent

Evaluation-surjective affine fibre charts, weighted-quotient simple connectivity and effective descent above the precise degree threshold. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### High-degree section evaluation is surjective

Declaration: FunctionFieldArithmeticPartII:GC.4/evaluation-surjective. Lemma.

If d≥ρ+max(2g−1,1), then for a degree-d line bundle L, H¹(X,L(−R))=0. In families, π_*L and π_*L(−R) are vector bundles of ranks d−g+1 and d−ρ−g+1, commute with base change, and π_*L→π_*(L|_R) is surjective.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use Serre duality and the negative degree of ω_X⊗L⁻¹(R) to obtain H¹ vanishing.
2. Use the coherent base-change theorem for the smooth proper family to obtain locally free pushforwards and the evaluation exact sequence.
3. Apply cohomological Riemann–Roch for the ranks; none of these scheme-family facts follows just from the built function-field theorem.

Inputs: FunctionFieldArithmeticPartII:GC.0/root-picard, SchemeAndStackFoundations:SF.3.

Acceptance:

- The bound counts deg R, including residue-field degrees.

Source:

- YZ19, Lemma A.9 and proof pp. 520–521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The Abel–Jacobi affine fibre chart

Declaration: FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart. Lemma.

At a fixed geometric root-Picard object (L,K_R,ι), the two-fibre of AJ_d is M=H⁰(X,L) minus {0}×_{H⁰(R,L|_R)}H⁰(R,K_R), with the second map α↦ι(α²). For ρ>0 and the degree bound, a splitting of evaluation identifies M≃A^n minus {0}, n=d−g+1. Scaling K_R by λ and L by λ² gives weights two on n−ρ coordinates and one on ρ coordinates.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.
- ρ>0 and d≥ρ+max(2g−1,1).

Construction or proof:

1. Use the definition of the two-fibre over a fixed object: there are no remaining compatible automorphisms of that object.
2. Choose a splitting of the surjective evaluation map; write a=u+split(ι(α²)).
3. The effective condition removes the origin; the scaling law gives the displayed weights. The weighted quotient maps to the moduli stack but is not identified with this fixed-object fibre.

Inputs: FunctionFieldArithmeticPartII:GC.4/evaluation-surjective, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- M itself is not asserted simply connected in positive characteristic.

Source:

- YZ19, Proof of Lemma A.9 p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### A projective cover of the weighted quotient

Declaration: FunctionFieldArithmeticPartII:GC.4/weighted-cover. Lemma.

For n≥ρ+1 and ρ≥1, set a=n−ρ. The coordinate map [x₁,…,x_a,y₁,…,y_ρ]↦[x₁²,…,x_a²,y₁,…,y_ρ] defines a finite cover P^{n−1}→[A^n minus {0}/G_m], with weights (2^a,1^ρ). Its generic Galois group is μ₂^a.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.
- ρ≥1; n≥ρ+1; a=n−ρ.

Construction or proof:

1. The coordinate map is equivariant for the ordinary weight-one source and weighted target.
2. Descend to the projective quotient and check finiteness on charts.
3. The independent signs of the x_i give the generic μ₂^a action.

Inputs: FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3.

Acceptance:

- The positive weight-one block is essential; the all-weight-two quotient has residual generic μ₂ inertia.

Source:

- YZ19, Proof of Lemma A.9 p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Nontrivial intermediate weighted covers ramify

Declaration: FunctionFieldArithmeticPartII:GC.4/weighted-ramification. Lemma.

A proper subgroup Γ⊊μ₂^a gives an intermediate cover of the weighted quotient that is ramified along at least one coordinate divisor x_i=0 in a chart where a weight-one coordinate y_ρ is nonzero. Hence such an intermediate cover cannot be finite étale.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.
- ρ≥1; n≥ρ+1.

Construction or proof:

1. Choose a nontrivial character of μ₂^a/Γ, represented by a nonempty coordinate subset I.
2. On y_ρ≠0 its invariant root is the monomial ∏_{i∈I}x_i with square ∏_{i∈I}z_i.
3. This quadratic subcover ramifies along each z_i=0 for i∈I since two is invertible.

Inputs: FunctionFieldArithmeticPartII:GC.4/weighted-cover.

Acceptance:

- The nonempty subset I and the weight-one affine chart are both required.

Source:

- YZ19, Proof of Lemma A.9 p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Simple connectivity of the weighted quotient

Declaration: FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected. Theorem.

The weighted quotient [A^n minus {0}/G_m] with weights (2^{n−ρ},1^ρ), ρ≥1 and n≥ρ+1, has no nontrivial connected finite étale cover. Thus every rank-one lisse Q̄ℓ-local system on it is geometrically constant.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.
- ρ≥1; n≥ρ+1.

Construction or proof:

1. Pull a connected finite étale cover back to P^{n−1}; the supplier’s projective-space simple connectivity makes that pullback trivial.
2. A component supplies a lift of the projective cover, and the generic function field is an intermediate μ₂^a extension.
3. The ramification lemma forces Γ=μ₂^a; the cover has degree one, hence is an equivalence. Apply the stack lisse/fundamental-group comparison.

Inputs: FunctionFieldArithmeticPartII:GC.4/weighted-cover, FunctionFieldArithmeticPartII:GC.4/weighted-ramification, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.3.

Acceptance:

- At ρ=0 the proof does not apply; the ordinary Abel–Jacobi argument uses ordinary projective fibres.

Planet: Weighted quotient simple connectivity.

Source:

- YZ19, Claim in proof of Lemma A.9 p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Triviality of the symmetric sheaf along Abel–Jacobi fibres

Declaration: FunctionFieldArithmeticPartII:GC.4/fibre-triviality. Lemma.

Under the high-degree bound and ρ>0, L_d restricts to a constant sheaf on each geometric two-fibre M of AJ_d.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. The map M→X_d^√R factors through the weighted quotient by the scalar root-Picard automorphisms.
2. Pull L_d to that quotient; it is lisse because L_d is lisse.
3. Simple connectivity makes this pullback constant, hence constant on M.

Inputs: FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected, FunctionFieldArithmeticPartII:GC.3/collision-descent.

Acceptance:

- This does not invoke false simple connectivity of punctured affine space.

Source:

- YZ19, Proof of Lemma A.9 p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### High-degree descent with empty ramification

Declaration: FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent. Lemma.

When R=∅ and d≥max(2g−1,1), the symmetric local system descends along the ordinary Abel–Jacobi map to the degree-d Picard stack. The ordinary scalar action has weight one; the projective fibre quotient is P^{d−g}.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the ordinary coherent Riemann–Roch/base-change fibre description.
2. The weight-one scalar quotient is projective space and has trivial geometric fundamental group.
3. Apply the source-qualified effective lisse-sheaf descent theorem, with connected fibres.

Inputs: FunctionFieldArithmeticPartII:GC.3/collision-descent, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, SchemeAndStackFoundations:SF.3, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Acceptance:

- This coalesces the unramified YZ17/49 route; no second unramified character-sheaf theory is planned.

Source:

- YZ19, Lemma A.9 p. 520, opening unramified case; proof p. 521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### High-degree root Abel–Jacobi descent

Declaration: FunctionFieldArithmeticPartII:GC.4/high-degree-descent. Theorem.

For d≥ρ+max(2g−1,1), L_d descends to a rank-one local system L_d^Pic on Pic_X^√R,d with AJ_d*L_d^Pic≅L_d. Descent and its comparison are unique up to the canonical isomorphism compatible with pullback; the pullback functor is fully faithful in this setting.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. The evaluation vector-bundle charts prove AJ_d is a locally trivial fibration with geometrically connected fibres.
2. For nonempty R use fibre triviality; for empty R use ordinary descent.
3. Apply effective lisse descent and full faithfulness on this fibration. The precise nonproper affine-fibre theorem is requested in ST-LISSE; connected fibres alone are not silently treated as sufficient.

Inputs: FunctionFieldArithmeticPartII:GC.4/evaluation-surjective, FunctionFieldArithmeticPartII:GC.4/fibre-triviality, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- Retain the threshold including ρ and the max with one.

Planet: High-degree Abel–Jacobi descent.

Source:

- YZ19, Lemma A.9 pp. 520–521. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.5. All-degree character sheaves

Effective auxiliary divisors, canonical comparison and cocycles, all-degree extension, Abel–Jacobi pullback, unit, associativity and commutativity. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### Effective auxiliary divisors away from R

Declaration: FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors. Lemma.

For every integer d and bound B there exists an effective divisor D on U=X−R with d+deg D≥B. The construction requires no rational point of degree one. For two choices D,E, a common effective enlargement is D+E.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Choose a closed point of the nonempty affine open U.
2. A sufficiently large multiple of that point exceeds any prescribed degree bound.
3. Use sums of effective divisors for a common comparison enlargement.

Inputs: FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, SchemeAndStackFoundations:SF.3.

Acceptance:

- A closed point of degree greater than one still suffices to reach the bound, though it need not produce every degree.

Source:

- YZ19, A.2.2 p. 521, translation by divisors; Lemma A.10 p. 522. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The tensor line attached to an effective divisor

Declaration: FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line. Construction.

For an effective D=Σn_x x supported on U, define the Frobenius line L_D as the tensor product of the fibres of L over all geometric points above x, each repeated n_x times, with its Frobenius permutation descent. This is the value of L_{deg D} at the canonical root divisor O(D)^♮.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the ordered geometric divisor to form its tensor line.
2. Descend the permutation action and Frobenius cycles to k.
3. Identify the value with the invariant symmetric stalk. Multiplicativity canonically identifies L_{D+E} with L_D⊗L_E.

Inputs: FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid.

API uses:

- YZ19 A.2.2 — Normalizes auxiliary-divisor translations.
- YZ19 Proposition A.12 — Computes the closed-point Frobenius trace.

API:

- TauCeti.RamifiedClassField.divisorTensorLine.zero (simp): L_0 is the coefficient line.
- TauCeti.RamifiedClassField.divisorTensorLine.sum (compatibility): L_{D+E}≅L_D⊗L_E with the inherited tensor coherence.
- TauCeti.RamifiedClassField.divisorTensorLine.closedPoint (characterisation): The Frobenius action for a closed point is the cyclic permutation with its local Frobenius action.

Unit tests:

- TauCeti.RamifiedClassField.divisorTensorLine.test_empty (degenerate): The empty divisor gives Q̄ℓ.
- TauCeti.RamifiedClassField.divisorTensorLine.test_rational (computation): For a rational point x outside R the line is L_x.
- TauCeti.RamifiedClassField.divisorTensorLine.test_degree_two (non-example): For a degree-two closed point the line is the tensor of both conjugate fibres with Frobenius descent.

Acceptance:

- At a nonrational closed point, use all geometric conjugates, not one arbitrarily chosen fibre.

Source:

- YZ19, A.2.2 p. 521 and A.2.3 p. 523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Translation of high-degree descent

Declaration: FunctionFieldArithmeticPartII:GC.5/translate-high-degree. Lemma.

If D is effective away from R and both d and d+deg D satisfy the high-degree bound, there is a canonical isomorphism t_D*L_{d+deg D}^Pic≅L_d^Pic⊗L_D.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Pull the proposed comparison back along AJ_d.
2. The product Abel–Jacobi square and α_{d,deg D} identify both sides canonically.
3. Descend the isomorphism using full faithfulness of AJ_d pullback.

Inputs: FunctionFieldArithmeticPartII:GC.4/high-degree-descent, FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- The divisor D is effective so the effective symmetric-power map exists.

Source:

- YZ19, A.2.2–A.2.3 pp. 521–523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The character local system in every Picard degree

Declaration: FunctionFieldArithmeticPartII:GC.5/all-degree-extension. Construction.

For d∈Z choose effective D⊂U with d+deg D≥B=ρ+max(2g−1,1) and set L_d^Pic=t_D*L_{d+deg D}^Pic⊗L_D⁻¹. The comparison and cocycle lemmas identify different choices canonically; the resulting graded sheaf is L^Pic on the whole root Picard stack.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Translation by O(D)^♮ is an equivalence from degree d to degree d+deg D.
2. Pull back the high-degree local system and remove the fixed divisor tensor line.
3. Use the following common-enlargement comparisons and cocycles to define a choice-independent object by effective descent.

Inputs: FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors, FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line, FunctionFieldArithmeticPartII:GC.4/high-degree-descent.

API uses:

- YZ19 Lemma A.10 — Supplies every effective-degree Abel–Jacobi pullback.
- YZ19 Proposition A.11 — Assembles the multiplicative character sheaf.

API:

- TauCeti.RamifiedClassField.picardCharacter.component (projection): The degree-d component is the normalized translated high-degree sheaf.
- TauCeti.RamifiedClassField.picardCharacter.comparison (characterisation): The sheaves from two effective choices are canonically isomorphic through their common enlargement.
- TauCeti.RamifiedClassField.picardCharacter.translation (compatibility): t_D*L_{d+deg D}^Pic≅L_d^Pic⊗L_D for every d and effective D away from R.

Unit tests:

- TauCeti.RamifiedClassField.picardCharacter.test_negative_degree (non-example): The construction gives a sheaf on degree −1 without choosing a degree-one rational point.
- TauCeti.RamifiedClassField.picardCharacter.test_common_sum (characterisation): The comparisons through D+E agree with comparisons through further effective enlargements.
- TauCeti.RamifiedClassField.picardCharacter.test_high_degree (compatibility): Above B it agrees with the original high-degree descent.

Acceptance:

- Negative degrees are included; no passage through a chosen Pic^0 origin is used.

Planet: All-degree Picard character sheaf.

Source:

- YZ19, A.2.2 pp. 521–522. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Canonical independence of the auxiliary divisor

Declaration: FunctionFieldArithmeticPartII:GC.5/choice-comparison. Lemma.

For effective D,E giving high degrees, the two constructions of L_d^Pic are canonically identified by translating each once more to the high degree d+deg D+deg E and using L_{D+E}≅L_D⊗L_E.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Compare the D construction to the D+E construction using high-degree translation by E.
2. Compare the E construction to D+E using translation by D.
3. Cancel the tensor lines and use symmetry to align their order.

Inputs: FunctionFieldArithmeticPartII:GC.5/translate-high-degree, FunctionFieldArithmeticPartII:GC.5/all-degree-extension, FunctionFieldArithmeticPartII:GC.3/symmetric-associativity, FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry.

Acceptance:

- The comparison is a specified isomorphism, not just existence of isomorphic sheaves.

Source:

- YZ19, A.2.2 p. 522 independence exercise; A.2.3 p. 523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Cocycle for auxiliary-divisor comparisons

Declaration: FunctionFieldArithmeticPartII:GC.5/choice-cocycle. Lemma.

For any three effective choices D,E,F the canonical comparison D→E followed by E→F is the comparison D→F. Comparisons are unchanged by further common effective enlargement.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Translate all three objects to the common degree d+deg(D+E+F).
2. Associativity and symmetry identify all tensor-line cancellations with one common composite.
3. Use full faithfulness in the high degree to descend that equality.

Inputs: FunctionFieldArithmeticPartII:GC.5/choice-comparison, FunctionFieldArithmeticPartII:GC.3/symmetric-associativity, FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry.

Acceptance:

- A mere pairwise choice of isomorphisms would not satisfy this test.

Source:

- YZ19, A.2.2 pp. 521–522 and A.2.3 p. 523 coherence exercises. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Abel–Jacobi pullback in every effective degree

Declaration: FunctionFieldArithmeticPartII:GC.5/effective-pullback. Theorem.

For every d≥0, AJ_d*L_d^Pic≅L_d canonically. Choose an effective D away from R reaching B; the translated comparison and multiplication cancel L_D.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the commuting translation–Abel–Jacobi square.
2. At the high translated degree use the defining pullback comparison.
3. Use multiplication by the effective divisor and tensor-line cancellation, then invoke the choice cocycle.

Inputs: FunctionFieldArithmeticPartII:GC.5/choice-cocycle, FunctionFieldArithmeticPartII:GC.5/all-degree-extension, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- The proof cannot take an arbitrary signed divisor D because X_{deg D} is an effective space.

Planet: All-degree Abel–Jacobi comparison.

Source:

- YZ19, Lemma A.10 p. 522 (source issue E68). The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The unit trivialization of the character sheaf

Declaration: FunctionFieldArithmeticPartII:GC.5/unit-trivialization. Theorem.

At the root-Picard tensor unit e, the pullback e*L^Pic is canonically Q̄ℓ, via the degree-zero effective Abel–Jacobi comparison.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Set d=0, where the effective symmetric power is the point.
2. Identify L_0 with the empty tensor coefficient line.
3. Pull through the canonical degree-zero Abel–Jacobi comparison.

Inputs: FunctionFieldArithmeticPartII:GC.5/effective-pullback, FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- The unit fixes the scalar normalization of multiplication maps.

Planet: Character-sheaf unit.

Source:

- YZ19, Proposition A.11(1) p. 522. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Multiplication in high Picard degrees

Declaration: FunctionFieldArithmeticPartII:GC.5/high-degree-multiplication. Lemma.

For d,e≥B, mult*L_{d+e}^Pic≅L_d^Pic⊠L_e^Pic on the product Pic^√R,d×Pic^√R,e. The pullback comparison uses AJ_d×AJ_e, not AJ_{d+e}.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Pull back by the product of the two Abel–Jacobi maps.
2. The product square and α_{d,e} give the canonical isomorphism of symmetric local systems.
3. Use the supplier’s full faithfulness for the product fibration to descend it.

Inputs: FunctionFieldArithmeticPartII:GC.4/high-degree-descent, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

Acceptance:

- The corrected diagram has a product domain, matching the multiplicative target.

Source:

- YZ19, Proof of Proposition A.11 p. 523 (source issues E35/E69). The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Multiplication in every integer degree

Declaration: FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication. Theorem.

For all d,e∈Z there is a canonical isomorphism μ_{d,e}:mult*L_{d+e}^Pic≅L_d^Pic⊠L_e^Pic. It is the high-degree isomorphism transported by independent effective divisors D,E and normalized using L_{D+E}≅L_D⊗L_E.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Choose effective translations taking both degrees into the high range.
2. Transport high-degree multiplication through t_D×t_E and t_{D+E}.
3. Cancel the divisor lines; comparison/cocycle lemmas prove independence of both translations.

Inputs: FunctionFieldArithmeticPartII:GC.5/high-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/choice-comparison, FunctionFieldArithmeticPartII:GC.5/choice-cocycle, FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line.

Acceptance:

- All terms are sheaves on Picard components, never L_d on a symmetric-power space.

Planet: Picard character multiplication.

Source:

- YZ19, Proposition A.11(2) and (A.8)–(A.9) pp. 522–523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Associativity of character multiplication

Declaration: FunctionFieldArithmeticPartII:GC.5/character-associativity. Lemma.

For all integers d,e,f, the two composites of μ for the three-degree product agree under the Picard and sheaf associators.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Translate all three degrees to the high range using three effective divisors.
2. Pull the equality back to the product of high-degree effective divisor spaces.
3. Use symmetric associativity and full faithfulness, then the translation cocycles, to descend the equality.

Inputs: FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/choice-cocycle, FunctionFieldArithmeticPartII:GC.3/symmetric-associativity.

Acceptance:

- A multiplicative structure is proved through this equality; it is not assumed as a field.

Source:

- YZ19, Proposition A.11(3), p. 523 coherence exercise. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Commutativity and the normalized unit laws

Declaration: FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit. Lemma.

The multiplication μ_{d,e} commutes with exchanging factors, and its restrictions along e×id and id×e are the identity unit maps after the canonical unit trivialization.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Translate to high degrees and compare the tensor block symmetry on effective divisors.
2. For the unit, use degree-zero effective comparison and the symmetric-sheaf unit law.
3. Descend the equalities with the fixed unit normalization and choice cocycles.

Inputs: FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/unit-trivialization, FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry, FunctionFieldArithmeticPartII:GC.5/choice-cocycle.

Acceptance:

- No extra scalar or Frobenius twist is permitted in the unit laws.

Source:

- YZ19, Proposition A.11(3) p. 523. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Character sheaves on hat section spaces

Declaration: FunctionFieldArithmeticPartII:GC.5/hat-character-pullback. Construction.

For every integer degree in which the hat section moduli problem is defined, set hatL_d=hatAJ_d*L_d^Pic. On the effective open it is canonically L_d for d≥0. This is a pullback along the entire hat map, so its zero-section stalks remain rank one.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use ordinary inverse image of the lisse character sheaf along hatAJ_d.
2. Restrict to the effective open and apply the proved Abel–Jacobi comparison.
3. The coefficient sheaf on specialized N_d matrix stacks is obtained by its existing owner’s pullback from these hat sheaves.

Inputs: FunctionFieldArithmeticPartII:GC.5/all-degree-extension, FunctionFieldArithmeticPartII:GC.5/effective-pullback, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi.

API uses:

- YZ19 §6.2.1 —  supplies the input sheaves pulled to N_d.
- YZ19 Theorem 6.3 — Its specialized consumer computes groupoid-weighted traces.

API:

- TauCeti.RamifiedClassField.hatCharacter.definition (characterisation): hatL_d is exactly hatAJ_d*L_d^Pic.
- TauCeti.RamifiedClassField.hatCharacter.effective (compatibility): Its restriction to the effective open is canonically L_d.
- TauCeti.RamifiedClassField.hatCharacter.zeroSection (compatibility): At a zero global section its stalk is the character line of the underlying root-Picard object.

Unit tests:

- TauCeti.RamifiedClassField.hatCharacter.test_effective (compatibility): The restriction agrees with the unshifted degree-zero symmetric local system.
- TauCeti.RamifiedClassField.hatCharacter.test_zero (non-example): The zero-section stalk is rank one, not zero.
- TauCeti.RamifiedClassField.hatCharacter.test_degree_zero (degenerate): At the effective empty divisor it is the coefficient line with the canonical unit.

Acceptance:

- Do not replace this by extension by zero from the effective open.

Planet: Hat Abel–Jacobi character pullback.

Source:

- YZ19, §6.2.1 pp. 496–497. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## GC.6. Ramified norms and quadratic traces

Root multiplicative sheaf, root norm, two-categorical exactness, quadratic specialization and Frobenius trace equal to the quadratic idele character. Exact declarations, hypotheses, API and acceptance tests are in the companion packet and reader.

### The root multiplicative sheaf

Declaration: FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf. Definition.

On X_et define G_m,X^√R=G_m,X×_{i_*G_m,R,[2]}i_*G_m,R. Its sections are pairs (u,v) of a unit and a root unit on R satisfying u|_R=v². Its torsor stack is the root Picard stack.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Take the fibre product in sheaves of abelian multiplicative groups.
2. A torsor for this group is equivalently a G_m line-bundle torsor with a square-root torsor of its restriction and a compatible square identification.
3. Use effective line-bundle/torsor descent to identify the resulting Picard stack.

Inputs: FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:GC.2/root-units, SchemeAndStackFoundations:SF.1.

API uses:

- YZ19 A.3.1–A.3.3 — Receives the root norm and its exact sheaf sequence.

API:

- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.sections (characterisation): Its sections are exactly (u,v) with u|_R=v².
- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.forget (projection): Forget v to G_m,X.
- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.torsors (equivalence): Its torsor stack is Pic_X^√R.

Unit tests:

- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_empty_R (degenerate): At R=∅ this is G_m,X.
- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_kernel (computation): The forgetful kernel on R is μ₂.
- TauCeti.RamifiedClassField.rootMultiplicativeSheaf.test_nonadditive (non-example): For odd-characteristic residue rings the square map is multiplicative but does not define an additive ring map.

Acceptance:

- This is a sheaf of multiplicative groups, not a fibre-product ring using the square map.

Planet: Root multiplicative sheaf.

Source:

- YZ19, A.3.1 p. 524. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The norm restricts to a square at ramification

Declaration: FunctionFieldArithmeticPartII:GC.6/norm-residue-square. Lemma.

For the smooth geometrically connected double cover ν:X′→X with reduced ramification R′≃R and involution σ, restriction of Nm(u) to R is (u|_{R′})². For a line bundle L′, Nm(L′)|_R≅(L′|_{R′})² canonically.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.
- ν:X′→X is finite flat of degree two, X′ smooth projective geometrically connected, R its reduced branch divisor, R′≃R.

Construction or proof:

1. At a branch point use the finite-flat local double-cover algebra, with involution t↦−t.
2. The product of u and σu restricts to the same residue twice.
3. For line bundles use the corresponding determinant norm and its base-change compatibility from the supplier.

Inputs: FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf, SchemeAndStackFoundations:SF.3.

Acceptance:

- The isomorphism is on the actual residue fibre, not an equality between unrelated line bundles.

Source:

- YZ19, A.3.1–A.3.2 p. 524. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Ramified norm of Picard objects

Declaration: FunctionFieldArithmeticPartII:GC.6/root-norm. Construction.

The sheaf map Nm^√R=(Nm,r_{R′}):ν_*G_m,X′→G_m,X^√R induces the root norm Pic_X′→Pic_X^√R, sending L′ to (Nm L′,L′|_{R′},ι). It lifts the ordinary norm and respects tensor products.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the residue-square lemma to define the sheaf homomorphism.
2. Push out torsors along this map and identify them with the displayed line-bundle data.
3. The supplier’s norm tensor/base-change coherence gives the Picard functor and its multiplicativity.

Inputs: FunctionFieldArithmeticPartII:GC.6/norm-residue-square, FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf, SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.1.

API uses:

- YZ19 A.3.2–A.3.3 — Gives the hat norm and the asserted Picard-stack sequence.

API:

- TauCeti.RamifiedClassField.rootNorm.object (simp): The object is (Nm L′,L′|_{R′},ι).
- TauCeti.RamifiedClassField.rootNorm.forget (compatibility): Forgetting roots gives the ordinary norm.
- TauCeti.RamifiedClassField.rootNorm.tensor (structure): Root norm preserves tensor product with the canonical coherent norm isomorphism.
- TauCeti.RamifiedClassField.rootNorm.baseChange (functoriality): It commutes with admissible base changes of the double cover.

Unit tests:

- TauCeti.RamifiedClassField.rootNorm.test_trivial (degenerate): The trivial upstairs line maps to the root-Picard tensor unit.
- TauCeti.RamifiedClassField.rootNorm.test_branch (computation): Its chosen root at a branch point is precisely the upstairs fibre of L′.
- TauCeti.RamifiedClassField.rootNorm.test_degree (non-example): The norm of a degree-one upstairs line has degree one, while pullback of a degree-one downstairs line has degree two.

Acceptance:

- The degree of the norm is the degree of L′, not twice that degree; ν* instead doubles degree.

Planet: Ramified root norm.

Source:

- YZ19, A.3.1 p. 524. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Étale-local surjectivity of the root norm on units

Declaration: FunctionFieldArithmeticPartII:GC.6/root-norm-surjective. Lemma.

Nm^√R:ν_*G_m,X′→G_m,X^√R is surjective as an étale sheaf under the odd-characteristic double-cover hypotheses.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Away from R split the double cover étale-locally; the product norm is surjective.
2. At a branch stalk, for (u,v) with ū=v² choose an étale-local square root a of u with a|_R=v, possible since two and v are units.
3. The scalar upstairs unit a has norm a²=u and residue v.

Inputs: FunctionFieldArithmeticPartII:GC.6/root-norm.

Acceptance:

- This is local surjectivity of sheaves, not surjectivity on every ring’s global units.

Source:

- YZ19, A.3.1 p. 524 local surjectivity calculation. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Local Hilbert 90 with root normalization

Declaration: FunctionFieldArithmeticPartII:GC.6/norm-kernel. Lemma.

As étale sheaves, ker Nm^√R is the image of u↦u/(σu), and ker(1−σ)=G_m,X inside ν_*G_m,X′. At ramification a root-normalized norm-one u has residue one, so w=1+u is locally a unit and u=w/(σw).

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. On the split locus use the explicit norm-one pair (u,u⁻¹).
2. At a branch point use σu=u⁻¹ and u|_{R′}=1; then 1+u is invertible because two is.
3. Invariant units descend through the finite-flat cover, giving the left kernel.

Inputs: FunctionFieldArithmeticPartII:GC.6/root-norm-surjective.

Acceptance:

- Ordinary norm-one residue −1 is excluded by the root normalization; 1+u would fail there.

Source:

- YZ19, A.3.3 p. 524. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The exact ramified norm sheaf sequence

Declaration: FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex. Theorem.

The étale sheaf complex 1→G_m,X→ν_*G_m,X′→^{1−σ}ν_*G_m,X′→^{Nm^√R}G_m,X^√R→1 is exact, with specified zero composites. Passing to torsor groupoids requires its connecting obstruction data; this theorem does not claim a short exact sequence of Picard groups.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the two local kernel calculations and sheaf surjectivity.
2. Check each composite equals the multiplicative unit by the norm/involution and residue relations.
3. Retain the intermediate kernel sheaf K=im(1−σ) for the two short exact sequences used in derived descent.

Inputs: FunctionFieldArithmeticPartII:GC.6/norm-kernel, FunctionFieldArithmeticPartII:GC.6/root-norm-surjective.

Acceptance:

- A nontrivial line bundle can become trivial under an étale pullback; group injectivity is not inferred.

Planet: Ramified norm sheaf exactness.

Source:

- YZ19, A.3.3 p. 524 displayed exact sheaf sequence. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Descent obstructions for the Picard-stack sequence

Declaration: FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions. Application.

Let K=ker Nm^√R. Interpret the exact sheaf complex as the two short exact sequences G_m→ν_*G_m→K and K→ν_*G_m→G_m^√R, and apply their derived cohomology and torsor descent. Any Picard-stack exactness statement must specify the connecting maps, coherent norm trivializations and effectiveness obstructions, rather than replacing the result by an ordinary kernel of 1−σ on line-bundle classes.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply the supplier’s derived torsor/cohomology comparison to each short sequence separately.
2. Track the H⁰(G_m^√R)→H¹(K) and H¹(K)→H²(G_m) connecting maps rather than dropping them.
3. For the displayed (A.11) fix a coherent exactness convention and prove its stated Picard-stack consequence; this remaining source gap is NORM-2EXACT, and is not treated as a proved theorem.

Inputs: FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex, FunctionFieldArithmeticPartII:GC.0/root-picard, SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.3.

Acceptance:

- For ν:P¹→P¹, t↦t², O_{P¹}(1) is σ-invariant but is not pullback from downstairs because pullback doubles degree. This rules out naive kernel exactness at the first upstairs Picard group.

Source:

- YZ19, A.3.3 p. 525 (A.11), source-interpretation gap. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The norm on hat section spaces

Declaration: FunctionFieldArithmeticPartII:GC.6/hat-root-norm. Construction.

Send (L′,a′) on X′ to (Nm L′,L′|_{R′},ι,Nm a′,a′|_{R′}) on hatX_d^√R. It commutes with hat Abel–Jacobi and the root norm, and restricts to effective sections.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the imported norm of line-bundle sections and its restriction-square compatibility.
2. Define the root section as the actual restricted upstairs section.
3. Compare the two forgetful composites directly on objects and arrows.

Inputs: FunctionFieldArithmeticPartII:GC.6/root-norm, FunctionFieldArithmeticPartII:GC.6/norm-residue-square, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi, SchemeAndStackFoundations:SF.3.

API uses:

- YZ19 A.3.2 — Exports norm compatibility to hat-space consumers.

API:

- TauCeti.RamifiedClassField.hatRootNorm.object (simp): The root line and root section are L′|_{R′} and a′|_{R′}.
- TauCeti.RamifiedClassField.hatRootNorm.abelJacobi (compatibility): hatAJ∘hatNorm≅rootNorm∘hatAJ′.
- TauCeti.RamifiedClassField.hatRootNorm.effective (characterisation): A fibrewise-nonzero upstairs section gives a fibrewise-nonzero norm section.

Unit tests:

- TauCeti.RamifiedClassField.hatRootNorm.test_zero (degenerate): A zero section maps to a zero global and root section.
- TauCeti.RamifiedClassField.hatRootNorm.test_branch (computation): At ramification the norm section restricts to the square of a′|_{R′}.
- TauCeti.RamifiedClassField.hatRootNorm.test_ordinary (compatibility): Forgetting roots recovers the ordinary norm on section spaces.

Acceptance:

- Zero upstairs sections map to zero sections with their root lines retained.

Source:

- YZ19, A.3.2 (A.10) p. 524. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The quadratic root-curve local system

Declaration: FunctionFieldArithmeticPartII:GC.6/quadratic-input. Construction.

For the geometrically connected double cover, ν_*Q̄ℓ decomposes into the ± eigensheaves of σ; its anti-invariant restriction to U is rank one, geometrically nontrivial and has inertia −1 exactly at R. Extend it to the root curve through the tame correspondence. The parent’s arithmetic reciprocity gives η_{F′/F}:F×\A_F×→{±1}, which is trivial on the image of O_{√R}×.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the idempotents (1±σ)/2 on rational coefficients, including ℓ=2.
2. Connectedness of X′ over kbar makes the quadratic geometric character nontrivial; the local branch calculation gives inertia sign.
3. Local reciprocity identifies the ramified unit character with the residue square character, which vanishes on modified root units.

Inputs: FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:GC.2/root-units, FunctionFieldArithmetic:FA.4.

API uses:

- YZ19 Proposition A.12 — Specializes the general Picard character sheaf to the quadratic idele character.

API:

- TauCeti.RamifiedClassField.quadraticInput.antiInvariant (characterisation): The input on U is the −1 eigensheaf of ν_*Q̄ℓ.
- TauCeti.RamifiedClassField.quadraticInput.inertia (compatibility): Every ramified inertia generator acts by −1.
- TauCeti.RamifiedClassField.quadraticInput.ideleCharacter (compatibility): The arithmetic character factors through the root-unit idele quotient.

Unit tests:

- TauCeti.RamifiedClassField.quadraticInput.test_split_point (computation): At a split unramified point the local Frobenius trace is +1.
- TauCeti.RamifiedClassField.quadraticInput.test_inert_point (computation): At an inert unramified point the local Frobenius trace is −1.
- TauCeti.RamifiedClassField.quadraticInput.test_geometric_connectedness (non-example): A constant quadratic cover is excluded from the geometrically nontrivial input assertion.

Acceptance:

- A geometrically disconnected constant quadratic cover would not satisfy geometric nontriviality.

Planet: Quadratic root-curve local system.

Source:

- YZ19, A.3.4 p. 525; §6.2.1 p. 496. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### The Frobenius trace is a character

Declaration: FunctionFieldArithmeticPartII:GC.6/trace-character. Lemma.

The Frobenius trace of L^Pic is a multiplicative Q̄ℓ×-valued function on isomorphism classes of Pic_X^√R(k), normalized to one at the tensor unit. Via the adelic equivalence it defines an idele character. For general input L its range is not restricted to {±1}.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Apply Frobenius to the multiplication isomorphism and take the trace of the rank-one tensor line.
2. Use the canonical unit to fix the value at e.
3. Transport through the groupoid equivalence, preserving descent invariance.

Inputs: FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/character-associativity, FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid.

Acceptance:

- The unramified order-three input has a character of order three, not a quadratic one.

Source:

- YZ19, A.2.3 p. 520 and proof of Proposition A.12 p. 525 (source issue E34). The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Closed-point tensor trace

Declaration: FunctionFieldArithmeticPartII:GC.6/closed-point-trace. Lemma.

For a closed point x∈U of degree δ, Tr(Fr_k,(L_δ)_{[x]})=Tr(Fr_x,L_x). On the tensor of δ conjugate rank-one fibres, Frobenius cyclically permutes factors and applies Fr_x on the wrapped factor.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use the symmetric stalk description for the divisor [x].
2. Choose identifications of successive Frobenius-conjugate fibres; the product tensor action wraps around once.
3. For a rank-one line its scalar is the local Fr_x scalar, independent of the choices.

Inputs: FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line, FunctionFieldArithmeticPartII:GC.5/effective-pullback.

Acceptance:

- Using the δ-th power of that scalar on every tensor factor would give the wrong answer.

Source:

- YZ19, Proposition A.12 proof, (A.12) pp. 525–526. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Character determination away from the ramification divisor

Declaration: FunctionFieldArithmeticPartII:GC.6/away-ramification-generation. Lemma.

Every class of the root-Picard idele groupoid is a difference of canonical root-divisor classes supported on U, after multiplying by the modified-unit image. Thus a normalized idele character is determined by its values on π_x⁻¹ for x∈U.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Use strong approximation with prescribed residue-square root frames at the finite set R to move a root-Picard object away from R.
2. Represent the resulting line bundle by a signed divisor on U through the divisor/idele dictionary.
3. Express that divisor as a difference of effective divisors; the canonical root data determine the normalized character values. This exact approximation statement is request FA-APPROX.

Inputs: FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid, FunctionFieldArithmetic:FA.2, FunctionFieldArithmetic:FA.4.

Acceptance:

- The finite residual root data cannot be discarded when moving support.

Source:

- YZ19, Proposition A.12 p. 525, character determination used in proof. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

### Quadratic geometric class field comparison

Declaration: FunctionFieldArithmeticPartII:GC.6/quadratic-trace. Theorem.

For the geometrically connected double cover, the Frobenius trace of its all-degree root-Picard character sheaf equals η_{F′/F} under the adelic groupoid equivalence, with π_x⁻¹↔O_X(x)^♮ and geometric Frobenius. At unramified x the value is +1 for split x and −1 for inert x.

Hypotheses:

- For GC layers: k is finite of characteristic p≠2; X/k is smooth, projective and geometrically connected; R⊂X is a reduced finite divisor, possibly empty; ρ=deg R, and g is the curve genus. Coefficients are Q̄ℓ with ℓ≠p; geometric Frobenius is used.

Construction or proof:

1. Both functions are normalized multiplicative idele characters.
2. At x∈U use the effective-degree pullback and the cyclic tensor trace to identify the geometric trace with the local quadratic Frobenius sign.
3. Use away-ramification generation to conclude equality on every class.

Inputs: FunctionFieldArithmeticPartII:GC.6/quadratic-input, FunctionFieldArithmeticPartII:GC.6/trace-character, FunctionFieldArithmeticPartII:GC.6/closed-point-trace, FunctionFieldArithmeticPartII:GC.6/away-ramification-generation, FunctionFieldArithmeticPartII:GC.5/effective-pullback.

Acceptance:

- This endpoint is quadratic; the preceding general character construction remains unrestricted.

Planet: Ramified geometric class field theory.

Source:

- YZ19, Proposition A.12 pp. 525–526. The stated source passage gives the construction or proof specialized with the hypotheses and conventions above; the decomposition makes its non-routine steps explicit.

## First-route coverage

All 28 routed YZ19 items are assigned. Additional finite/infinite-root consumers and the unramified overlap are coalesced with the same owner.

| Routed item | Declarations |
|---|---|
| PAPER-YUN-ZHANG-19/134 | FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid |
| PAPER-YUN-ZHANG-19/156 | FunctionFieldArithmeticPartII:GC.0/root-picard |
| PAPER-YUN-ZHANG-19/157 | FunctionFieldArithmeticPartII:GC.0/square-action-quotient |
| PAPER-YUN-ZHANG-19/158 | FunctionFieldArithmeticPartII:GC.0/root-picard-section |
| PAPER-YUN-ZHANG-19/159 | FunctionFieldArithmeticPartII:GC.1/root-symmetric-space |
| PAPER-YUN-ZHANG-19/161 | FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth |
| PAPER-YUN-ZHANG-19/162 | FunctionFieldArithmeticPartII:GC.1/root-addition, FunctionFieldArithmeticPartII:GC.1/ordered-divisors, FunctionFieldArithmeticPartII:GC.1/ordered-proper |
| PAPER-YUN-ZHANG-19/163 | FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid |
| PAPER-YUN-ZHANG-19/164 | FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.3/middle-extension |
| PAPER-YUN-ZHANG-19/165 | FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing, FunctionFieldArithmeticPartII:GC.3/koszul-exterior, FunctionFieldArithmeticPartII:GC.3/exterior-cohomology |
| PAPER-YUN-ZHANG-19/166 | FunctionFieldArithmeticPartII:GC.3/collision-kernel, FunctionFieldArithmeticPartII:GC.3/collision-descent |
| PAPER-YUN-ZHANG-19/167 | FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.3/symmetric-associativity, FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry |
| PAPER-YUN-ZHANG-19/168 | FunctionFieldArithmeticPartII:GC.4/evaluation-surjective, FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart, FunctionFieldArithmeticPartII:GC.4/fibre-triviality, FunctionFieldArithmeticPartII:GC.4/high-degree-descent, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent |
| PAPER-YUN-ZHANG-19/169 | FunctionFieldArithmeticPartII:GC.5/all-degree-extension, FunctionFieldArithmeticPartII:GC.5/choice-comparison, FunctionFieldArithmeticPartII:GC.5/choice-cocycle |
| PAPER-YUN-ZHANG-19/170 | FunctionFieldArithmeticPartII:GC.5/effective-pullback |
| PAPER-YUN-ZHANG-19/171 | FunctionFieldArithmeticPartII:GC.5/unit-trivialization |
| PAPER-YUN-ZHANG-19/172 | FunctionFieldArithmeticPartII:GC.5/high-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/character-associativity, FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit |
| PAPER-YUN-ZHANG-19/173 | FunctionFieldArithmeticPartII:GC.6/root-norm, FunctionFieldArithmeticPartII:GC.6/hat-root-norm |
| PAPER-YUN-ZHANG-19/174 | FunctionFieldArithmeticPartII:GC.6/norm-kernel, FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex, FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions |
| PAPER-YUN-ZHANG-19/175 | FunctionFieldArithmeticPartII:GC.6/trace-character, FunctionFieldArithmeticPartII:GC.6/closed-point-trace, FunctionFieldArithmeticPartII:GC.6/away-ramification-generation, FunctionFieldArithmeticPartII:GC.6/quadratic-trace |
| PAPER-YUN-ZHANG-19/184 | FunctionFieldArithmeticPartII:GC.5/hat-character-pullback |
| PAPER-YUN-ZHANG-19/234 | FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse |
| PAPER-YUN-ZHANG-19/235 | FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion |
| PAPER-YUN-ZHANG-19/236 | FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi |
| PAPER-YUN-ZHANG-19/237 | FunctionFieldArithmeticPartII:GC.3/tame-local-systems |
| PAPER-YUN-ZHANG-19/238 | FunctionFieldArithmeticPartII:GC.4/weighted-cover, FunctionFieldArithmeticPartII:GC.4/weighted-ramification, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected |
| PAPER-YUN-ZHANG-19/239 | FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf |
| PAPER-YUN-ZHANG-19/240 | FunctionFieldArithmeticPartII:GC.6/quadratic-input |
| PAPER-BRESCIANI-24/36 | FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.2/dvr-roots |
| PAPER-BRESCIANI-24/37 | FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe, FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes |
| PAPER-YUN-ZHANG-19/160 | FunctionFieldArithmeticPartII:RS.1/closed-fibre |
| PAPER-YUN-ZHANG-17/49 | FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent, FunctionFieldArithmeticPartII:GC.5/all-degree-extension |
| PAPER-YUN-ZHANG-17/54 | FunctionFieldArithmeticPartII:GC.3/exterior-cohomology |

## Proposed symplectic L-value sibling

The split preserves the full reviewed contracts in the packet. The following six stages give the sibling’s exact item assignments. They are proposals, not existing atlas stages.

### SL.0. Normalized symplectic Frobenius and central square classes

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/39 | Functional equation and ε-factors with torsion coefficients |
| PAPER-ABDURRAHMAN-VENKATESH-25/40 | The normalized Frobenius is special orthogonal |
| PAPER-ABDURRAHMAN-VENKATESH-25/41 | The square classes L(X, ρ) and L^*(X, ρ) |
| PAPER-ABDURRAHMAN-VENKATESH-25/42 | Lemma 3.5.1 and §3.5: square discriminant of H^1 |
| PAPER-ABDURRAHMAN-VENKATESH-25/43 | The trace map and c_et(X, ρ) |
| PAPER-ABDURRAHMAN-VENKATESH-25/44 | Admissible and GSp-admissible pairs |
| PAPER-ABDURRAHMAN-VENKATESH-25/45 | Theorem 3.1: the main theorem |
| PAPER-ABDURRAHMAN-VENKATESH-25/46 | Equivalence of the Sp and GSp formulations |
| PAPER-ABDURRAHMAN-VENKATESH-25/47 | Lemma 3.9.1: even valuation of central values of compatible systems |
| PAPER-ABDURRAHMAN-VENKATESH-25/48 | Larsen's big-image theorem for compatible systems |
| PAPER-ABDURRAHMAN-VENKATESH-25/49 | §3.10 (*): Theorem 3.1 determines L-values of compatible systems |

### SL.1. Valuations and characteristic-zero compatible systems

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/50 | The defect δ(X, ρ) and Frobenius of k |
| PAPER-ABDURRAHMAN-VENKATESH-25/51 | Step A: the defect is a Dirichlet character |
| PAPER-ABDURRAHMAN-VENKATESH-25/52 | Step B: χ_{r,ℓ} is unramified outside 2ℓ |

### SL.2. Hurwitz-stack Step A

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/53 | Steps A and B imply Theorem 3.1 |
| PAPER-ABDURRAHMAN-VENKATESH-25/54 | Hurwitz stacks 𝔐^G_g and 𝔐^{G*}_g |
| PAPER-ABDURRAHMAN-VENKATESH-25/55 | Livingston–Dunfield–Thurston: mapping class group orbits on surjections |
| PAPER-ABDURRAHMAN-VENKATESH-25/56 | Lemma 5.1.1: irreducibility in large genus |
| PAPER-ABDURRAHMAN-VENKATESH-25/57 | The universal classes 𝔜 and 𝔜′ |
| PAPER-ABDURRAHMAN-VENKATESH-25/58 | Lemma 5.2.1: 𝔜 = 𝔜′ on the geometric generic fibre |
| PAPER-ABDURRAHMAN-VENKATESH-25/59 | Lemma 5.3.1: 𝔜 − 𝔜′ comes from Z[1/N] |
| PAPER-ABDURRAHMAN-VENKATESH-25/60 | §5.4 Claim: odd-degree cyclic covers preserve δ |

### SL.3. Hilbert–Siegel systems and unit-reduction fields

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/61 | §5.4.1: ε-factors of twists of symplectic systems |
| PAPER-ABDURRAHMAN-VENKATESH-25/62 | §5.5 Claim: raising the genus |
| PAPER-ABDURRAHMAN-VENKATESH-25/63 | §6.1 Claim: totally real fields with prescribed unit reduction |
| PAPER-ABDURRAHMAN-VENKATESH-25/64 | Compatible systems on the Hilbert–Siegel variety |
| PAPER-ABDURRAHMAN-VENKATESH-25/65 | Vanishing of H^1 of the Hilbert–Siegel variety |

### SL.4. Slicing, moments and Step B

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/66 | Lemma 6.3.1: α_C = 0 |
| PAPER-ABDURRAHMAN-VENKATESH-25/67 | Lemma 6.3.2: killing α on special fibres |
| PAPER-ABDURRAHMAN-VENKATESH-25/68 | Slicing down to a surface |
| PAPER-ABDURRAHMAN-VENKATESH-25/69 | Guralnick–Tiep: the eighth-moment criterion for SO |
| PAPER-ABDURRAHMAN-VENKATESH-25/70 | Lemma 6.4.2: points impose independent conditions on hypersurfaces |
| PAPER-ABDURRAHMAN-VENKATESH-25/71 | Lemma 6.4.1: slices with nonvanishing central value |
| PAPER-ABDURRAHMAN-VENKATESH-25/72 | Lemma 6.5.1: c_et of the slices |
| PAPER-ABDURRAHMAN-VENKATESH-25/73 | Lemma 6.5.2: L-value of the slices |

### SL.5. Quaternionic tests beyond the main hypotheses

| Item | Target |
|---|---|
| PAPER-ABDURRAHMAN-VENKATESH-25/91 | c_et on the quaternion group |
| PAPER-ABDURRAHMAN-VENKATESH-25/92 | Both sides of Theorem 3.1 for quaternionic covers of curves |
| PAPER-ABDURRAHMAN-VENKATESH-25/93 | Numerical examples beyond the hypotheses of Theorem 3.1 |

For a smooth projective geometrically irreducible curve X/F_q and geometrically surjective ρ:π₁(X)→Sp_{2r}(ℓ), ℓ finite of characteristic different from 2 and char F_q, require q coprime to #Sp_{2r}(ℓ), q a square in the prime field of ℓ, #ℓ≡±1 mod 8 and q≡1 mod 8. Outside (r,#ℓ)=(1,9) the v1 proof target is L*=trace_X(ρ*c_et) in ℓ×/(ℓ×)². When the central value is zero use the normalized-Frobenius spinor norm, not a nonexistent square class of zero. Preserve the source-scoped characteristic-zero §3.10 statement and its degree >4r²/density-one hypotheses.

The sibling imports: SymplecticReidemeisterTorsionModSquares: Theorem 2.1 and finite-coefficient extension of (1.5)/circle formula; StableReductionPartII:key/moduli-curves (reserved canonical moduli definition); FunctionFieldArithmetic:FA.3–FA.5; DeligneWeightsAndPurity:DWP.3/DWP.7–DWP.8; WeilConjectures:WC.2; EtaleDualityAndPerverseSheaves:EDC.2/EDC.4/EDC.8; LefschetzPencilsAndVanishingCycles:LPV.3; InverseGaloisAndArithmeticFundamentalGroups:IG.1/IG.5; AlgebraicModuliForArithmeticGeometry:R09.4; PELModuli:M1–M2; ShimuraVarieties:V2; ShimuraCompactifications:C5; ArithmeticLocallySymmetricSpaces:ALS.1; MotivicEtaleKTheory:M.8.

Required source corrections:

- AV E4: exclude r=1,#ℓ=9 from the v1-supported main theorem until Step A is repaired component by component; H₂(SL₂(F₉),Z)=Z/3 prevents the asserted geometric irreducibility.
- AV E25: require route A’s circle/mapping-torus formula over finite fields of odd characteristic; characteristic-zero Jacobson–Morozov is not enough.
- Keep all AV E1–E25 with the future route, including Poonen D≥r−1, the unramified-at-m wording and the zero-central-value quaternion cases; do not upgrade the version-of-record without reading it.

## Open contracts and precise continuation

### STACK-GEOM — SchemeAndStackFoundations:SF.1

Supply the algebraic-space representable-diagonal and atlas interface, scheme/space chart fibre products and effective fpqc descent of affine schemes and their morphisms. Identify faithful flatness of an affine ring map with flatness and surjectivity of its Spec map. Ordinary quotient stacks/two-fibre products are imported from D0; algebraicity of finite root quotients is requested from R09.4 and their coarse universal property from R09.5. No foundational stack carrier or root stack is rebuilt here.

Needed by: FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.1/two-pullback, FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/closed-fibre, FunctionFieldArithmeticPartII:RS.1/coarse-space, FunctionFieldArithmeticPartII:RS.1/regular-dm, FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe, FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes, FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:GC.0/square-action-quotient, FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion, FunctionFieldArithmeticPartII:GC.1/ordered-proper, FunctionFieldArithmeticPartII:GC.4/weighted-cover, FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf, FunctionFieldArithmeticPartII:GC.6/root-norm, FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions.

### CURVE-GEOM — SchemeAndStackFoundations:SF.3

Supply ordinary line-bundle Picard stacks in all integer degrees and Pic^d torsors without chosen k-rational point, Sym^d X and effective-section equivalence, smoothness of symmetric powers, coherent Riemann–Roch/Serre duality and family base change/evaluation, closed-point divisors, line-bundle norm and norm sections for finite-flat curve covers. Integrate upstream JacobianChallenge A/B/D/F and AlgebraicCurves’ comparison dictionary instead of constructing them here. The existing function-field Riemann–Roch theorem alone does not supply this family geometry.

Needed by: FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:GC.0/square-action-quotient, FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:GC.1/incidence-transversality, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid, FunctionFieldArithmeticPartII:GC.4/evaluation-surjective, FunctionFieldArithmeticPartII:GC.4/weighted-cover, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent, FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors, FunctionFieldArithmeticPartII:GC.6/norm-residue-square, FunctionFieldArithmeticPartII:GC.6/root-norm, FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions, FunctionFieldArithmeticPartII:GC.6/hat-root-norm.

### FA-ADELES — FunctionFieldArithmetic:FA.2

Supply the function-field local rings/completions, residue maps and unit groups, ideles and degree, the divisor/idele gluing equivalence and strong approximation with specified finite local congruences. A number-field idele construction is insufficient.

Needed by: FunctionFieldArithmeticPartII:GC.2/root-units, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid, FunctionFieldArithmeticPartII:GC.6/away-ramification-generation.

### FA-RECIPROCITY — FunctionFieldArithmetic:FA.4

Supply geometric-Frobenius-normalized quadratic reciprocity, local residue-square character at odd-characteristic ramified places, and the character-determination statement after finite congruence conditions. For x outside R, inverse uniformizer corresponds to O_X(x) and yields the local quadratic Frobenius sign. Infinite reciprocity keeps profinite completion/dense image.

Needed by: FunctionFieldArithmeticPartII:GC.6/quadratic-input, FunctionFieldArithmeticPartII:GC.6/away-ramification-generation.

### PI1 — InverseGaloisAndArithmeticFundamentalGroups:IG.0

Supply the scheme finite-étale-cover/fibre-functor equivalence and projective-space simple connectivity in the stated geometric setting. The packet’s existing IG.2 specialization nodes do not provide IG.0. Root-stack extensions are separately gap ST-LISSE, not silently asserted by this scheme request.

Needed by: FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent.

### TAME-INERTIA — InverseGaloisAndArithmeticFundamentalGroups:IG.1

Supply geometric/arithmetic scheme fundamental-group exact sequences and tame local inertia for punctured smooth curves, with the arithmetic/geometric Frobenius conventions. The root-stack inertia comparison is separately gap ST-LISSE.

Needed by: FunctionFieldArithmeticPartII:GC.3/tame-local-systems.

### DUALITY-SCHEME — EtaleDualityAndPerverseSheaves:EDC.2:pairings

Supply the scheme graded Poincaré pairing and its rank-one/dual-character vanishing interface. The smooth-DM and rational tame-coarse comparisons consumed here require the shared stacks Part II and remain gap ST-OPS.

Needed by: FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing.

### JAC-A — SchemeAndStackFoundations:SF.3

Complete the upstream native invertible-sheaf interface: bilinear global-section tensor map, unit section, coherent n-th tensor powers, pullback preserving invertibility and compatibility of powers and section powers with identity/composition. Use the existing native sheaf and tensor operations; no replacement line-bundle category is acceptable. In trivial-line coordinates, the bilinear tensor-section map followed by the native unit isomorphism must evaluate to multiplication, and the free unit section must have coordinate 1. These are generic native sheaf tensor compatibility lemmas, not new root-specific geometric types.

Needed by: FunctionFieldArithmeticPartII:RS.0/tensor-power, FunctionFieldArithmeticPartII:RS.0/section-power, FunctionFieldArithmeticPartII:RS.0/root-object, FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.2/transition, FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism, FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization, FunctionFieldArithmeticPartII:RS.0/section-power-transport.

### ORDINARY-STACKS — DiamondsAndVStacks:D0

On the fixed fpqc scheme site, use the existing ordinary quotient/two-fibre-product node and supply [A1/Gm] as the stack of native invertible modules with sections, with its monoidal power maps. The inverse-system carrier must retain transition isomorphisms and cocycles. Infinite affine-group quotients use fpqc torsors and do not assert algebraic finite presentation.

Needed by: FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.1/two-pullback, FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/closed-fibre, FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:GC.0/square-action-quotient.

### ROOT-ALGEBRAIC — AlgebraicModuliForArithmeticGeometry:R09.4

Apply the algebraic quotient criterion to [Spec A[t]/(t^n-f)/μ_n] for finite flat diagonalizable μ_n, using a smooth atlas obtained through μ_n→Gm. Supply inertia/DM criteria with actual branch-point and exponent-invertibility hypotheses and the regularity comparison. This is the general algebraic-stack criterion owned by R09.4, not the root construction itself. Do not call the infinite fpqc quotient algebraic of finite presentation.

Needed by: FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/regular-dm.

### ROOT-COARSE — AlgebraicModuliForArithmeticGeometry:R09.5

For a finite diagonalizable group acting on an affine scheme, give the quotient stack’s coarse-space universal property from its invariant algebra, with compatibility under arbitrary base change in this linearly reductive case. Distinguish it from general finite-inertia flat/tame base-change statements and from a fine moduli object.

Needed by: FunctionFieldArithmeticPartII:RS.1/coarse-space.

### TOWER-AFF — SchemeAndStackFoundations:SF.1

For a positive-divisibility system of finite μ_n frame torsors over any test scheme T, with affine faithfully flat transition maps inducing μ_(nm)→μ_n, prove the affine inverse limit is faithfully flat over T and an fpqc lim μ_n torsor. Finite quotient gives the original torsors, with all comparisons and arrows; filtered colimit commutes with the tensor products in the torsor equation. Supply the finite-type affine-chart/closed-point residue-field comparison over Q used in the non-fppf example.

Needed by: FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient, FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf.

### KUMMER-FINITE — SchemeAndStackFoundations:SF.2

For every positive n over an arbitrary field k, the fppf Kummer sequence is exact and identifies μ_n torsor classes with H1_fppf(k,μ_n)=k×/(k×)^n, using H1(k,Gm)=Pic(k)=0. Retain the actual quotient maps μ_(nm)→μ_n and compatibility on classes. Identify torsor classes with derived H1 on the fpqc site for the affine inverse-limit band G. No assertion that every fpqc G-torsor is fppf-locally trivial is allowed.

Needed by: FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift, FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes.

### ST-LISSE — Root-stack lisse categories and effective descent

The atlas scheme lisse/fundamental-group suppliers do not yet provide root-curve inertia comparison, full faithfulness on dense opens of normal DM stacks, or the nonproper high-degree Abel–Jacobi locally trivial-fibration descent theorem with the explicit affine fibre charts. Obtain source-qualified proofs from the coordinated EtaleDualityAndPerverseSheavesPartIIStacks proposal. Its ST.0–ST.6 keys are provisional, not registered stages or reserved node IDs, and are not used as pretend prerequisites. This is a typed-and-proof leaf, not a claim that connected fibres alone imply descent.

Needed by: FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent, FunctionFieldArithmeticPartII:GC.4/high-degree-descent.

### ST-OPS — Source-qualified sheaf operations for the nonrepresentable ordered map

Supply Q̄ℓ constructible/lisse categories on these tame DM stacks, external tensor/Künneth, proper base change, rational finite-groupoid cohomology vanishing, the precise quasi-finite nonrepresentable pushforward/intermediate-extension theorem and the lisse rank-one extension criterion. Supply smooth-DM duality and the curve cohomological bound. Scheme EDC.5 or EDC.7 alone cannot serve as these statements, and no unrestricted Artin-stack boundedness or decomposition theorem is inferred.

Needed by: FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.3/middle-extension, FunctionFieldArithmeticPartII:GC.3/collision-descent, FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing, FunctionFieldArithmeticPartII:GC.3/exterior-cohomology.

### NORM-2EXACT — Picard-stack consequence of the four-term exact sheaf complex

Specify the coherent exactness notion intended in (A.11), its null-homotopies and descent obstructions, and prove the precise consequence from the two short exact sheaf sequences. For the ramified cover P¹→P¹, t↦t², O(1) is σ-invariant while pullback degrees are even; this rejects ordinary kernel exactness. A bare isomorphism L′≅σ*L′ does not supply the missing compatible root-normalized descent data. This is a new source-interpretation gap, not a proof of false intended two-categorical exactness. It does not block the independent Proposition A.12 trace proof.

Needed by: FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions.

### FA-APPROX — Support-moving approximation with all residue-root frames

The final character-determination step needs strong approximation that moves a root-Picard representative away from R while matching its chosen square-root frames, modulo the actual modified-unit image. The parent stages state general arithmetic objects but have no exact blueprint node giving this contract. The requested precise statement and its closed-point generator proof must be supplied.

Needed by: FunctionFieldArithmeticPartII:GC.6/away-ramification-generation, FunctionFieldArithmeticPartII:GC.6/quadratic-trace.

### EXTERIOR-COMP — Comparison of graded antisymmetrization with the native exterior power

Confirm or add the exact native exterior-power equivalence for graded degree-one tensor invariants, with rational averaging and Frobenius functoriality. The baseline declaration read gives the exterior-power type, not this comparison theorem; no claim that the comparison is already built is made.

Needed by: FunctionFieldArithmeticPartII:GC.3/koszul-exterior, FunctionFieldArithmeticPartII:GC.3/exterior-cohomology.

### LEAN-GEOMETRY — Signatures blocked by absent geometric carriers

The suggested file prototypes the native root-object and affine-action fragment. All other geometric signatures need the actual algebraic-stack, Picard-stack, torsor, root pullback and constructible/lisse sheaf types from the requests and ST-LISSE/ST-OPS. The file carries an exhaustive omission ledger by declaration/API/test name; it does not replace missing types or conditions with arbitrary predicate fields. Complete those typed signatures after their suppliers fix their concrete types, and compile with an existing pinned build. No such build is available in this worker session.

Needed by: FunctionFieldArithmeticPartII:key/root-stacks, FunctionFieldArithmeticPartII:RS.1/two-pullback, FunctionFieldArithmeticPartII:RS.1/base-change, FunctionFieldArithmeticPartII:RS.1/affine-chart, FunctionFieldArithmeticPartII:RS.1/closed-fibre, FunctionFieldArithmeticPartII:RS.1/coarse-space, FunctionFieldArithmeticPartII:RS.1/regular-dm, FunctionFieldArithmeticPartII:RS.2/transition, FunctionFieldArithmeticPartII:RS.2/infinite-root-stack, FunctionFieldArithmeticPartII:RS.2/infinite-base-change, FunctionFieldArithmeticPartII:RS.2/dvr-roots, FunctionFieldArithmeticPartII:RS.2/dvr-infinite-gerbe, FunctionFieldArithmeticPartII:RS.2/dvr-kummer-classes, FunctionFieldArithmeticPartII:GC.0/root-picard, FunctionFieldArithmeticPartII:GC.0/square-action-quotient, FunctionFieldArithmeticPartII:GC.0/root-picard-section, FunctionFieldArithmeticPartII:GC.1/root-symmetric-space, FunctionFieldArithmeticPartII:GC.1/evaluation-pullback, FunctionFieldArithmeticPartII:GC.1/incidence-transversality, FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion, FunctionFieldArithmeticPartII:GC.1/root-symmetric-smooth, FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse, FunctionFieldArithmeticPartII:GC.1/root-addition, FunctionFieldArithmeticPartII:GC.1/ordered-divisors, FunctionFieldArithmeticPartII:GC.1/ordered-proper, FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi, FunctionFieldArithmeticPartII:GC.2/root-units, FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid, FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid, FunctionFieldArithmeticPartII:GC.3/tame-local-systems, FunctionFieldArithmeticPartII:GC.3/symmetric-local-system, FunctionFieldArithmeticPartII:GC.3/collision-kernel, FunctionFieldArithmeticPartII:GC.3/middle-extension, FunctionFieldArithmeticPartII:GC.3/collision-descent, FunctionFieldArithmeticPartII:GC.3/cohomology-vanishing, FunctionFieldArithmeticPartII:GC.3/koszul-exterior, FunctionFieldArithmeticPartII:GC.3/exterior-cohomology, FunctionFieldArithmeticPartII:GC.3/multiplicity-free-product, FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity, FunctionFieldArithmeticPartII:GC.3/symmetric-associativity, FunctionFieldArithmeticPartII:GC.3/symmetric-symmetry, FunctionFieldArithmeticPartII:GC.4/evaluation-surjective, FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart, FunctionFieldArithmeticPartII:GC.4/weighted-cover, FunctionFieldArithmeticPartII:GC.4/weighted-ramification, FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected, FunctionFieldArithmeticPartII:GC.4/fibre-triviality, FunctionFieldArithmeticPartII:GC.4/empty-ramification-descent, FunctionFieldArithmeticPartII:GC.4/high-degree-descent, FunctionFieldArithmeticPartII:GC.5/auxiliary-divisors, FunctionFieldArithmeticPartII:GC.5/divisor-tensor-line, FunctionFieldArithmeticPartII:GC.5/translate-high-degree, FunctionFieldArithmeticPartII:GC.5/all-degree-extension, FunctionFieldArithmeticPartII:GC.5/choice-comparison, FunctionFieldArithmeticPartII:GC.5/choice-cocycle, FunctionFieldArithmeticPartII:GC.5/effective-pullback, FunctionFieldArithmeticPartII:GC.5/unit-trivialization, FunctionFieldArithmeticPartII:GC.5/high-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/all-degree-multiplication, FunctionFieldArithmeticPartII:GC.5/character-associativity, FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit, FunctionFieldArithmeticPartII:GC.5/hat-character-pullback, FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf, FunctionFieldArithmeticPartII:GC.6/norm-residue-square, FunctionFieldArithmeticPartII:GC.6/root-norm, FunctionFieldArithmeticPartII:GC.6/root-norm-surjective, FunctionFieldArithmeticPartII:GC.6/norm-kernel, FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex, FunctionFieldArithmeticPartII:GC.6/picard-descent-obstructions, FunctionFieldArithmeticPartII:GC.6/hat-root-norm, FunctionFieldArithmeticPartII:GC.6/quadratic-input, FunctionFieldArithmeticPartII:GC.6/trace-character, FunctionFieldArithmeticPartII:GC.6/closed-point-trace, FunctionFieldArithmeticPartII:GC.6/away-ramification-generation, FunctionFieldArithmeticPartII:GC.6/quadratic-trace, FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent, FunctionFieldArithmeticPartII:RS.2/factorial-root-limit, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection, FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift, FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient, FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf.

### LEAN-SECTION-COMP — Native root-coordinate proofs after signature completion

The previously omitted RootObject.test_trivialization now has a native suggested signature, using actual line isomorphisms, the pinned freePUnitIsoUnit coordinate map and the computed image-of-one coefficient. Six nodes expose the canonical trivial-power comparison, section-power coordinates, unit coefficient, root equation and arrow scalar laws, including the promoted section-power transport API. The generic section-tensor multiplication/unit evaluation contract stays with JAC-A/SF.3. Its proof is not certified by source-only signature inspection, and no Tau Ceti build at the exact pin was found. Complete the actual supplier proofs, tensor-power coherence and full-file elaboration before closing this gap.

Needed by: FunctionFieldArithmeticPartII:RS.0/root-object, FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism, FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization, FunctionFieldArithmeticPartII:RS.0/root-identification-unit, FunctionFieldArithmeticPartII:RS.0/root-trivialization-equation, FunctionFieldArithmeticPartII:RS.0/root-arrow-scalars, FunctionFieldArithmeticPartII:RS.0/section-power-transport.

### TOWER-TYPING — Typed infinite fpqc comparison and root-limit coherence

The finite affine maps/basis and root-specific proof leaves are explicit. Complete the TOWER-AFF limit-torsor verification on native affine schemes and the factorial compatible-object comparison with the actual root groupoid carrier. The infinite quotient/Kummer/geometric signatures still need those carriers; native finite algebra signatures do not certify the infinite comparison.

Needed by: FunctionFieldArithmeticPartII:RS.2/factorial-root-limit, FunctionFieldArithmeticPartII:RS.2/kummer-torsor-limit, FunctionFieldArithmeticPartII:RS.2/kummer-limit-iso-detection, FunctionFieldArithmeticPartII:RS.2/kummer-limit-class-lift, FunctionFieldArithmeticPartII:RS.2/infinite-affine-quotient, FunctionFieldArithmeticPartII:RS.2/kummer-tower-not-fppf.

### Remaining work by stage

- FunctionFieldArithmeticPartII:RS.0 (partial): Resolve JAC-A’s actual tensor-section/unit coordinate and pullback contracts. Implement and elaborate the five native root-coordinate comparison nodes and full-file signatures at the exact pins. The separate native proof extraction now checks the unit inverse, all four inherited direct examples and five unit-chart examples, as well as the preceding weighted table and specified module kernel/cokernel maps. Complete the determinant sign and field ranks, then native geometric suppliers and full-file elaboration. No geometric or implementation closure is claimed.
- FunctionFieldArithmeticPartII:RS.1 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract JAC-A.; Resolve recorded gap LEAN-GEOMETRY.; Complete the imported arbitrary-QCoh fpqc equivalence and its tensor/unit comparisons before root-fpqc-descent closes.; Resolve the D0 ordinary quotient, R09.4 algebraicity and R09.5 coarse contracts under the accepted ownership boundary.
- FunctionFieldArithmeticPartII:RS.2 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract JAC-A.; Resolve recorded gap LEAN-GEOMETRY.; Complete the native finite affine transition, iterated quotient, finite-free basis and faithful-flatness proofs.; Complete TOWER-AFF, KUMMER-FINITE and TOWER-TYPING. Infinite torsors and H1 use fpqc; finite Kummer remains fppf. Preserve the roots-of2 counterexample.; Finish coherent factorial reindexing, infinite affine quotient and finite-stage injectivity/surjectivity on Kummer classes; neither set limits nor field points replace these comparisons.
- FunctionFieldArithmeticPartII:GC.0 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract CURVE-GEOM.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.1 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract CURVE-GEOM.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.2 (partial): Resolve supplier contract CURVE-GEOM.; Resolve supplier contract FA-ADELES.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.3 (partial): Resolve supplier contract PI1.; Resolve supplier contract TAME-INERTIA.; Resolve supplier contract DUALITY-SCHEME.; Resolve recorded gap ST-LISSE.; Resolve recorded gap ST-OPS.; Resolve recorded gap EXTERIOR-COMP.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.4 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract CURVE-GEOM.; Resolve supplier contract PI1.; Resolve recorded gap ST-LISSE.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.5 (partial): Resolve supplier contract CURVE-GEOM.; Resolve recorded gap LEAN-GEOMETRY.
- FunctionFieldArithmeticPartII:GC.6 (partial): Resolve supplier contract STACK-GEOM.; Resolve supplier contract CURVE-GEOM.; Resolve supplier contract FA-ADELES.; Resolve supplier contract FA-RECIPROCITY.; Resolve recorded gap NORM-2EXACT.; Resolve recorded gap FA-APPROX.; Resolve recorded gap LEAN-GEOMETRY.

## Baseline additions checked in this continuation

- mathlib:AlgebraicGeometry.Scheme.fpqcTopology — The pinned topology from jointly surjective quasi-compact families of flat scheme morphisms; it is subcanonical. Infinite torsors use this topology. Source: Mathlib/AlgebraicGeometry/Sites/Fpqc.lean.
- mathlib:Module.FaithfullyFlat.of_linearEquiv — Faithful flatness is transported through a linear equivalence; this works without a nonzero-ring assumption. Source: Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean.
- mathlib:Module.FaithfullyFlat.finsupp — A free Finsupp module on a nonempty index type is faithfully flat, including a zero coefficient ring. Source: Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean.
- mathlib:Nat.dvd_factorial — A positive m dividing a factorial once m≤n; gives cofinality of the factorial subsequence. Source: Mathlib/Data/Nat/Factorial/Basic.lean.
- mathlib:Nat.factorial_dvd_factorial — Factorials respect divisibility as their indices increase. Source: Mathlib/Data/Nat/Factorial/Basic.lean.
- mathlib:nonempty_sections_of_finite_cofiltered_system — A Type-valued functor on a cofiltered-or-empty category, whose values are finite and nonempty, has a compatible section; no surjectivity of transition maps is required. Source: Mathlib/CategoryTheory/CofilteredSystem.lean.
- mathlib:rootsOfUnityEquivNthRoots — For positive n and a commutative domain, rootsOfUnity n R is equivalent to the roots of X^n−1; the following pinned instance proves it finite. Source: Mathlib/RingTheory/RootsOfUnity/Basic.lean.
- mathlib:Polynomial.irreducible_of_eisenstein_criterion — Eisenstein irreducibility for a primitive positive-degree polynomial at a prime ideal, with the constant coefficient outside its square. Source: Mathlib/RingTheory/Polynomial/Eisenstein/Criterion.lean.
- mathlib:Polynomial.IsPrimitive.Int.irreducible_iff_irreducible_map_cast — Gauss irreducibility comparison from a primitive integer polynomial to its rational-coefficient polynomial. Source: Mathlib/RingTheory/Polynomial/GaussLemma.lean.
- mathlib:minpoly.eq_of_irreducible_of_monic — An irreducible monic polynomial vanishing at x is its minimal polynomial over the field. Source: Mathlib/FieldTheory/Minpoly/Field.lean.
- mathlib:minpoly.natDegree_le — The minimal polynomial degree is bounded by the ambient module finrank for a finite free algebra. Source: Mathlib/FieldTheory/Minpoly/Finite.lean.
- mathlib:finite_of_finite_type_of_isJacobsonRing — A finite-type field algebra over a Jacobson ring is finite as a module; used over Q for a closed point of a nonempty finite-type chart. Source: Mathlib/RingTheory/Jacobson/Ring.lean.

## Source findings

The packet carries the eight independently confirmed YZ19 corrections and the new (A.11) proof-interpretation gap. Their inherited review provenance is distinct from this packet’s pending independent review. The formulas used above incorporate the full-fibre, perverse-shift, general-character, product-Abel–Jacobi, restriction, effective-divisor and Picard-sheaf corrections. Version-of-record and v2 hashes distinguish the text inspected from inherited collation records.

## Public sources

- [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Zhiwei Yun and Wei Zhang. Annals of Mathematics 189 (2019), 393–526, published author-hosted copy. Read scope: Appendix A, pp. 514–526, statements and proofs in full; Introduction pp. 393–396; §6.2.1 pp. 496–497 and §6.2.3 p. 499 for consumers; Page images pp. 515, 519, 521, 523 checked against extracted formulas.
- [Gromov–Witten theory of Deligne–Mumford stacks](https://arxiv.org/pdf/math/0603151v2), Dan Abramovich, Tom Graber and Angelo Vistoli. arXiv:math/0603151v2, 13 April 2008; Appendix B. Read scope: Appendix B.1–B.2 pp. 52–54; root gerbes and roots of line bundles with sections.
- [Infinite root stacks and quasi-coherent sheaves on logarithmic schemes](https://arxiv.org/pdf/1410.1164v2), Mattia Talpo and Angelo Vistoli. arXiv:1410.1164v2, 12 December 2017; published Proc. London Math. Soc. 116 (2018), 1187–1243. Read scope: §3 pp. 12–16, definitions and proofs of 3.2–3.5 and 3.7–3.13; single-divisor specialization.
- [On the birational section conjecture with strong birationality assumptions](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf), Giulio Bresciani. Inventiones Mathematicae 235 (2024), 129–150, open-access version of record. Read scope: pp. 135–136 root stacks over a DVR and the infinite reduced fibre; references pp. 149–150.
- [Symplectic L-functions and symplectic Reidemeister torsion (mod squares)](https://arxiv.org/pdf/2303.13436v1), Amina Abdurrahman and Akshay Venkatesh. arXiv:2303.13436v1, 23 March 2023; published 2025 version not inspected. Read scope: pp. 1–2 arithmetic target, §3.1–3.4 pp. 26–28, §4.2 p. 35 proof architecture; all 38 reviewed route contracts, not all proofs of §§3–6/App. D.

## Native finite-comparison baseline and checking boundary

- mathlib:Algebra.TensorProduct.lift — Tensor-algebra universal lift for two algebra maps with commuting images. Source: Mathlib/RingTheory/TensorProduct/Maps.lean.
- mathlib:Algebra.TensorProduct.lift_tmul — The lift evaluates b⊗c to the product of the specified two images. Source: Mathlib/RingTheory/TensorProduct/Maps.lean.
- mathlib:LinearMap.quotKerEquivOfSurjective — Native first isomorphism theorem identifying a module quotient by a surjective linear map's kernel. Source: Mathlib/LinearAlgebra/Isomorphisms.lean.
- mathlib:Submodule.Quotient.mk — Canonical native module quotient map; not an algebra quotient. Source: Mathlib/LinearAlgebra/Quotient/Defs.lean.
- mathlib:Ideal.mem_span_singleton' — Membership in (f) is an explicit scalar multiple; commutativity supplies the chosen factor order. Source: Mathlib/RingTheory/Ideal/Span.lean.
- mathlib:Matrix.det_apply — Finite Leibniz formula with permutation sign for the actual pair-indexed matrix. Source: Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean.
- mathlib:Fin.sign_cycleRange — Sign of cycleRange i is (−1)^i; at the last index this is the n-cycle rotation sign. Source: Mathlib/GroupTheory/Perm/Fin.lean.
- mathlib:Module.finrank_eq_card_basis — Over a nontrivial strong-rank-condition ring, a finite basis computes finrank; used only over a field here. Source: Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean.
- mathlib:LinearMap.finrank_range_add_finrank_ker — Rank-nullity for a linear map from a finite-dimensional vector space over a division ring. Source: Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean.

The finite comparison signatures and eight examples are checked as a targeted Mathlib-native fragment, with the native character generator expanded to its actual definition. The earlier extraction admitted the coaction; a separate proof prototype checks its native quotient lift, weight, counit and coassociativity and the elementary tensor comparison. The submitted suggested bodies are admitted as required by PROTOCOL §13. This is not compilation of the full suggested file: its native Tau Ceti line-bundle/points imports have no compiled build available at the pin. All mathematical implementations and all ten stages remain unchecked and partial; the unchanged geometric omission ledger is still binding.

## Native coaction proof continuation — codex-rtOQ9t

Four new lemmas expose the quotient relation, Euclidean root-power reduction, native character powers, and the promoted root-evaluation API. The separately checked native proof prototype constructs δ using AdjoinRoot.liftAlgHom and Θ using Algebra.TensorProduct.lift. Constants, weights, counit, coassociativity, pure tensors, root/right-factor values, uniqueness and the monomial formula use these actual maps. The weight signature now parenthesizes the right root power; the mathematical contract is unchanged.

Fresh reading is TV17 v2 §3.1 pp14–16, the full finite-chart setup and cited proofs. The PDF hash matches the inherited receipt. Current reviewed FA.0–FA.7 audit records and supplier scopes were checked. Earlier broad paper readings, AV sibling contracts and source findings retain their original provenance.

The separate Mathlib proof extraction checks this algebra branch and its wild-characteristic, nonunit, nilpotent and exponent-one computations. It leaves the coordinate equivalences, kernel/cokernel, inverse, determinant/rank and nonvanishing examples admitted. The exact-pin Tau Ceti compiled imports remain unavailable, so the complete suggested file is uncompiled. All123 proposed nodes stay unchecked and all ten stages remain partial; the geometric, stack, sheaf and infinite-tower gaps are retained.

Additional native baseline statements read at Mathlib082e2d3:

- mathlib:ofAdd_nsmul — Native conversion of an additive n-fold multiple into a power in Multiplicative. Source: Mathlib/Algebra/Group/TypeTags/Basic.lean.
- mathlib:ZMod.natCast_self — The image of n in ZMod n is zero, independent of the coefficient-ring characteristic. Source: Mathlib/Data/ZMod/Basic.lean.
- mathlib:Algebra.TensorProduct.tmul_pow — A power of a pure tensor is the tensor of the powers; parentheses distinguish the tensor power from the second-factor power. Source: Mathlib/RingTheory/TensorProduct/Basic.lean.
- mathlib:Algebra.TensorProduct.algebraMap_apply' — The native coefficient map into a tensor algebra equals 1 tensor the coefficient image in the right factor. Source: Mathlib/RingTheory/TensorProduct/Basic.lean.
- mathlib:Algebra.TensorProduct.ext' — Algebra homomorphisms out of a tensor algebra agree if their values on every pure tensor agree. Source: Mathlib/RingTheory/TensorProduct/Basic.lean.
- mathlib:MonoidAlgebra.counit_single — Native coefficient-coalgebra counit formula on a character basis element. Source: Mathlib/RingTheory/Coalgebra/MonoidAlgebra.lean.
- mathlib:MonoidAlgebra.comul_single — Native coefficient-coalgebra comultiplication formula on a character basis element. Source: Mathlib/RingTheory/Coalgebra/MonoidAlgebra.lean.

The separate proof extraction reports0 errors,20 admitted-body warnings and0 other warnings. All16 audited algebra declarations exclude admission axioms. The independent coordinate check passes57,628 assertions. These receipts certify only the checked extraction; full-file compilation and roadmap implementation remain unclaimed.

The submitted suggested file follows PROTOCOL §13: declaration and example bodies remain admitted. The separate proof prototype is preserved at commit063ebe93320a784b244ea5a73fe8236bc205830c; its evidence does not turn any node into an implementation claim.

## Native coefficient proof continuation — codex-5ebb6f

The separate native proof prototype now checks the source and target existence-and-uniqueness lemmas. The suggested file keeps admitted declaration and example bodies as required by PROTOCOL §13. Their subsingleton branch covers the zero ring without a degree assertion. Their nontrivial branch uses the native monic AdjoinRoot basis; the target uses every group-algebra character and therefore retains wild-characteristic information. Two specified coefficient linear equivalences make their inverse formulas available to the kernel and module-cokernel work.

Fresh reading is TV17 v2 §3.1 pp14–16 and the full Stacks040N unit-cover statement/proof. Other paper readings, source findings and AV sibling contracts keep predecessor provenance. The separate proof extraction, preserved at immutable commita7077b385885fa9b790ff4216098ad3871a87fa8, has554 lines and20 examples, with0 errors,18 admitted-body warnings and0 other warnings. All26 audited algebra declarations exclude admission axioms. At that predecessor checkpoint, the kernel/image criteria, sharp criteria, kernel/cokernel maps, inverse, determinant/rank and geometric work remained open. The current weighted-coefficient continuation below supersedes that proof boundary while preserving the distinct historical receipt. The full Tau Ceti file remains uncompiled and all ten stages partial.

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinate-equivalence. construction. Native name: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv.

Statement: For B=A[x]/(xⁿ−f), H=A[Multiplicative(ZMod n)] and any commutative ring A with positive n, construct the specified A-linear equivalence B⊗_A B ≃ ((Fin n×Fin n)→A) extracting the unique coefficients in the ordered vectors x^i⊗x^j. The inverse coefficient map sends c to Σ_p c_p(x^i⊗x^j). This is the native linear equivalence determined by synthesis, including the zero ring.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinates, mathlib:LinearEquiv.ofBijective.

Proof: Define the native synthesis linear map by the finite linear combination in the statement. Linearity follows from addition and scalar multiplication distributing over a finite sum. The listed coordinate existence-and-uniqueness lemma proves synthesis bijective: uniqueness gives injectivity and existence gives surjectivity. Apply LinearEquiv.ofBijective to synthesis and take its inverse. The inverse evaluation is the exact sum, the forward evaluation of a synthesized family follows from the inverse law, and synthesis of a single coefficient gives the generator formula.

Uses: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel: Provides the specified native coefficient extraction for the module comparison; the explicit synthesis inverse keeps the actual tensor map visible. FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients: Supports interpreting the coefficient criterion for a tensor through a fixed inverse formula and generator normalization.

Acceptance: The construction fixes coefficient order and basis normalization, rather than choosing an unspecified isomorphism of free modules. Its specified inverse also determines the map over the zero ring.

API: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv_symm_apply (projection). The inverse coefficient map sends c to Σ_p c_p(x^i⊗x^j).

API: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv_apply_sum (characterisation). Coefficient extraction of Σ_p c_p(x^i⊗x^j) is exactly c, for every coefficient family c.

API: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv_monomial (simp). The coefficient family of the vector x^i⊗x^j indexed by p is single(p,1), zero at every other index.

Test: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv.test_one (degenerate). For n=1 and arbitrary f, the coefficients of 1⊗1 are single((0,0),1).

Test: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv.test_zero_ring (degenerate). If A is subsingleton, coefficient extraction of every element of B⊗_A B is the zero coefficient family.

Test: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv.test_nonreduced (computation). For A=Z/4,n=2,f=2, the coefficient of x⊗x at (1,1) is 1. The calculation uses the nonreduced quotient, not its reduction.

Sources: TV17 §3.1 pp14–16 finite chart action; Stacks040N positive-exponent unit cover. These motivate a native coefficient derivation, not a quoted geometric theorem.

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence. construction. Native name: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv.

Statement: For B=A[x]/(xⁿ−f), H=A[Multiplicative(ZMod n)] and any commutative ring A with positive n, construct the specified A-linear equivalence H⊗_A B ≃ ((Fin n×Fin n)→A) extracting the unique coefficients in the ordered vectors e_i⊗x^k. The inverse coefficient map sends c to Σ_p c_p(e_i⊗x^k). This is the native linear equivalence determined by synthesis, including the zero ring.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinates, mathlib:LinearEquiv.ofBijective.

Proof: Define the native synthesis linear map by the finite linear combination in the statement. Linearity follows from addition and scalar multiplication distributing over a finite sum. The listed coordinate existence-and-uniqueness lemma proves synthesis bijective: uniqueness gives injectivity and existence gives surjectivity. Apply LinearEquiv.ofBijective to synthesis and take its inverse. The inverse evaluation is the exact sum, the forward evaluation of a synthesized family follows from the inverse law, and synthesis of a single coefficient gives the generator formula.

Uses: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel: Provides the specified native coefficient extraction for the module comparison; the explicit synthesis inverse keeps the actual tensor map visible. FunctionFieldArithmeticPartII:RS.0/affine-torsor-image-coefficients: Supports interpreting the coefficient criterion for a tensor through a fixed inverse formula and generator normalization.

Acceptance: The construction fixes coefficient order and basis normalization, rather than choosing an unspecified isomorphism of free modules. Its specified inverse also determines the map over the zero ring.

API: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_symm_apply (projection). The inverse coefficient map sends c to Σ_p c_p(e_i⊗x^k).

API: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_apply_sum (characterisation). Coefficient extraction of Σ_p c_p(e_i⊗x^k) is exactly c, for every coefficient family c.

API: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_monomial (simp). The coefficient family of the vector e_i⊗x^k indexed by p is single(p,1), zero at every other index.

Test: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv.test_one (degenerate). For n=1 and arbitrary f, the coefficients of 1⊗1 are single((0,0),1).

Test: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv.test_zero_ring (degenerate). If A is subsingleton, coefficient extraction of every element of H⊗_A B is the zero coefficient family.

Test: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv.test_wild_character (computation). For A=F₂,n=2,f=0, the coefficient of e₁⊗1 at (1,0) is 1. This character remains visible although μ₂(F₂) has only one element.

Sources: TV17 §3.1 pp14–16 finite chart action; Stacks040N positive-exponent unit cover. These motivate a native coefficient derivation, not a quoted geometric theorem.

Native baseline statements read at Mathlib082e2d3 for this continuation:

- mathlib:Module.subsingleton — Every module over a subsingleton coefficient ring is subsingleton; no numerical polynomial degree assertion is required. Source: Mathlib/Algebra/Module/Defs.lean.
- mathlib:Module.Basis.reindex — Transport an existing basis along an index equivalence; used with the degree equality and the character index equivalence. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.reindex_apply — The transported basis vector at i is the original vector at the inverse image of i. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.equivFun — An existing finite basis supplies the native linear equivalence to its full coefficient-function module. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.sum_equivFun — The sum of the coordinate coefficients times their native basis vectors equals the original vector. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.equivFun_symm_apply — The inverse of the finite coefficient equivalence is the specified finite linear combination. Source: Mathlib/LinearAlgebra/Basis/Defs.lean.
- mathlib:Module.Basis.tensorProduct_apply' — The basis tensor product at a pair is the pure tensor of the two basis vectors. Source: Mathlib/LinearAlgebra/TensorProduct/Basis.lean.
- mathlib:MonoidAlgebra.basis_apply — The native monoid-algebra basis vector is single(r,1), including in wild coefficient characteristic. Source: Mathlib/Algebra/MonoidAlgebra/Module.lean.
- mathlib:ZMod.finEquiv — For a positive modulus, the native equivalence from Fin n to ZMod n; its zero-modulus branch has a different source. Source: Mathlib/Data/ZMod/Basic.lean.
- mathlib:ZMod.val_natCast_of_lt — The canonical representative of a natural number smaller than n equals that natural number. Source: Mathlib/Data/ZMod/Basic.lean.
- mathlib:Multiplicative.toAdd — The native type-tag equivalence from Multiplicative α to α, inverse to ofAdd. Source: Mathlib/Algebra/Group/TypeTags/Basic.lean.
- mathlib:LinearEquiv.ofBijective — A bijective native linear map determines a linear equivalence; its forward function is the supplied map. Source: Mathlib/Algebra/Module/Submodule/Equiv.lean.

The current admitted Mathlib-only sketch also elaborates:411 extracted lines,20 examples,0 errors,56 admitted-body warnings and0 other warnings. Its hash is 724f1b3fbd4d8f6d59d69f0efe09bc80ff0940c6679715782873b822ccd7c810. The separately checked proof prototype and its26 axiom audits retain their distinct receipts; no admission-free proof claim is made about the current sketch.


## Weighted coefficient continuation — codex-J6LwjP

For I=Fin n×Fin n, use cyclic addition and subtraction to fix σ(i,j)=(i,i+j) and its inverse (i,k−i). Natural representatives give k=(i+j) mod n. Since i+j<2n, the native monomial weight is 1 off the wrapping triangle and f on it; wrapping is exactly k<i. The specified source and target coefficient equivalences turn the actual comparison into C_t Θ C_s⁻¹(c)(q)=w(q)c(σ⁻¹q). Each target coefficient therefore has exactly one source contributor. This is a calculation on the original AdjoinRoot quotient, group algebra and tensor map, including the zero ring.

The five refined declarations above now list the complete intermediate chain. Kernel coefficients outside the wrapping triangle vanish; wrapping coefficients are annihilated by f. An image family has arbitrary upper coefficients and lower coefficients divisible by f. The latter condition is constructive: choose one factor for each lower coefficient, transport by σ and synthesize the actual source tensor. For n>1 the single wrapping source position (1,n−1) detects injectivity of multiplication by f; the lower target position (1,0) with coefficient 1 detects that f is a unit. No invertibility of n, reducedness or integral-domain hypothesis enters. At n=1 neither position exists and the comparison is bijective for every f.

Fresh readings are Talpo–Vistoli v2 §3.1 pp14–16 and the complete Stacks040N unit-cover statement/proof. Their action/chart and positive-exponent cover motivate the calculation; the weighted table and criteria are derived here, rather than quoted as printed paper theorems. The 28 Yun–Zhang and 38 Abdurrahman–Venkatesh route records, all source findings and all other source-reading provenance are inherited unchanged. The reviewed parent FA.2 and FA.4 records and all parent target statuses were freshly inspected; the predecessor detailed FA.0/FA.1 evidence is preserved without claiming a new full reading. Upstream JacobianChallenge was read in full, with nearby SemisimpleAlgebras and RepresentationTheory read earlier in the same session.

The packet now contains137 unchecked nodes,98 required API items,99 required definition/construction tests (103 total test records),39 planets and96 baseline declarations. Twelve new records add one cyclic construction, four permutation APIs as lemmas, three coefficient lemmas and four consumed coordinate APIs as lemmas. All125 inherited IDs and mathematical statements,8 gaps,13 requests and ten partial stages remain. General root-stack geometry, AV sibling ownership and parent arithmetic boundaries are unchanged.

### Cyclic root coefficient permutation

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation. construction. Native name: TauCeti.RootStack.affineTorsorComparison.coefficientPermutation.

Statement: For positive n, construct the native equivalence σ:Fin n×Fin n≃Fin n×Fin n defined by σ(i,j)=(i,i+j) using cyclic addition on Fin n, with inverse σ⁻¹(i,k)=(i,k−i). Its representative is (i,(i+j) mod n); it reorders coordinates of the actual root action comparison.

Hypotheses: n≥1. The construction is independent of the coefficient ring.

Inputs: mathlib:Fin.addCommGroup.

Proof: Use the pinned cyclic additive group on Fin n, not addition of natural representatives without reduction. Define the two pair maps and verify their composites by additive cancellation. No coefficient ring or choice of a root of unity enters.

Uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-map: Identifies the unique source coordinate contributing to each target coordinate.
- FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients: Transfers wrapping source positions to strictly lower target positions without collisions.

API:

- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_apply (projection): σ(i,j)=(i,i+j) in the cyclic Fin n group.
- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_symm (projection): σ⁻¹(i,k)=(i,k−i) in the cyclic Fin n group.
- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_val (compatibility): The natural representative of the second component of σ(i,j) is (i+j) mod n.
- TauCeti.RootStack.affineTorsorComparison.wrap_iff_lower (characterisation): The second component of σ(i,j) is smaller than its first iff n≤i+j, for natural representatives 0≤i,j<n.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation.test_one (degenerate): At n=1 the permutation fixes every pair.
- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation.test_wrap (computation): At n=2, σ(1,1)=(1,0).
- TauCeti.RootStack.affineTorsorComparison.coefficientPermutation.test_inverse (computation): At n=3, σ⁻¹(2,0)=(2,1); natural truncated subtraction would give the wrong answer.

Acceptance: At n=2 the wrapping position (1,1) maps to the lower position (1,0).

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Cyclic permutation evaluation

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-apply. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_apply.

Statement: σ(i,j)=(i,i+j) in the cyclic Fin n group.

Hypotheses: n≥1. The construction is independent of the coefficient ring.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation.

Proof: Unfold the specified native pair equivalence; for the representative use the Fin addition formula.

Acceptance: No assumption on the base ring is used.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Cyclic inverse evaluation

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-inverse. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_symm.

Statement: σ⁻¹(i,k)=(i,k−i) in the cyclic Fin n group.

Hypotheses: n≥1. The construction is independent of the coefficient ring.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation.

Proof: Unfold the specified native pair equivalence; for the representative use the Fin addition formula.

Acceptance: No assumption on the base ring is used.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Natural representative of the cyclic permutation

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-representative. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_val.

Statement: The natural representative of the second component of σ(i,j) is (i+j) mod n.

Hypotheses: n≥1. The construction is independent of the coefficient ring.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation.

Proof: Unfold the specified native pair equivalence; for the representative use the Fin addition formula.

Acceptance: No assumption on the base ring is used.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Wrapping and lower coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-wrap. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.wrap_iff_lower.

Statement: The second component of σ(i,j) is smaller than its first iff n≤i+j, for natural representatives 0≤i,j<n.

Hypotheses: n≥1. The construction is independent of the coefficient ring.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation, mathlib:Fin.coe_int_add_eq_ite.

Proof: Read the pinned integer formula for addition of two Fin representatives. Split at i+j<n; integer arithmetic gives exactly the wrap/lower equivalence, including n=1.

Acceptance: No assumption on the base ring is used.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Source coefficient synthesis

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-synthesis. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.sourceCoordinateEquiv_symm_apply.

Statement: The inverse coefficient map sends c to Σ_p c_p(x^i⊗x^j).

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinate-equivalence.

Proof: The synthesis inverse is the defining finite linear combination of the native equivalence.

Acceptance: This promotes a consumed API to a declaration; it preserves the existing construction and API statement.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Target coefficient synthesis

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-synthesis. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_symm_apply.

Statement: The inverse coefficient map sends c to Σ_p c_p(e_i⊗x^k).

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence.

Proof: The synthesis inverse is the defining finite linear combination of the native equivalence.

Acceptance: This promotes a consumed API to a declaration; it preserves the existing construction and API statement.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Target coefficients of a synthesized family

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-extraction. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_apply_sum.

Statement: Coefficient extraction of Σ_p c_p(e_i⊗x^k) is exactly c, for every coefficient family c.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence.

Proof: Apply the inverse law of the specified native coefficient equivalence.

Acceptance: This promotes a consumed API to a declaration; it preserves the existing construction and API statement.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Target coefficient of a basis vector

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-basis-coordinate. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.targetCoordinateEquiv_monomial.

Statement: The coefficient family of the vector e_i⊗x^k indexed by p is single(p,1), zero at every other index.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-synthesis.

Proof: The synthesis of single(p,1) is the named target basis vector by finite-sum evaluation. Apply the inverse law to extract its exact coefficient family.

Acceptance: This promotes a consumed API to a declaration; it preserves the existing construction and API statement.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Weighted permuted root monomial

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial-permuted. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.monomial_permuted.

Statement: For p=(i,j), Θ(x^i⊗x^j)=w(σp)(e_i⊗x^k), where σp=(i,k) and w(i,k)=f when k<i, otherwise 1. This is the actual native comparison, not an arbitrary matrix.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial, FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-representative, FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-wrap.

Proof: Since 0≤i,j<n, the quotient (i+j)/n is either 0 or 1 by elementary integer arithmetic. Use the native monomial formula and the representative identity. The wrap/lower lemma identifies exactly the factor f.

Acceptance: At n=2, Θ(x⊗x)=f(e₁⊗1), including nilpotent f.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Coefficients of a compared monomial

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial-coordinates. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.monomial_coordinates.

Statement: In the fixed target coefficient equivalence, Θ(x^i⊗x^j) has coefficient family w(σp) single(σp,1), with w(i,k)=f for k<i and 1 otherwise.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial-permuted, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-basis-coordinate.

Proof: Use the preceding weighted monomial identity and linearity of target coefficient extraction. Apply its promoted basis-vector formula; the first permutation component remains i.

Acceptance: The universal character coordinate is retained in characteristic dividing n.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Complete weighted coefficient table

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-map. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.coefficient_map.

Statement: For every coefficient family c and q=(i,k), C_t(Θ(C_s⁻¹(c)))(q)=w(q)c(σ⁻¹q), where C_s and C_t are the specified source and target coefficient equivalences and w(q)=f for k<i, otherwise 1.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-synthesis, FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial-coordinates, FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation.

Proof: Expand the specified source synthesis and distribute the native comparison and target coordinates over the finite linear combination. Each compared monomial is supported only at its permutation image. Bijectivity of σ leaves exactly the term indexed by σ⁻¹q in the coefficient sum. Ordinary scalar multiplication of coefficients gives the displayed product; no cancellation of f is used.

Acceptance: The formula works over the zero ring, over nonreduced rings and under arbitrary coefficient change. It asserts no preservation of kernels under nonflat change.

Sources: TV17 §3.1 pp14–16 finite P=N grading/action and Corollary3.13; Stacks040N, Lemma59.28.3 positive-exponent unit cover. These are root-specific native algebra derivations with the listed baseline and packet inputs.

### Native module coordinate continuation

The specified wrapping kernel coordinate map extends annihilator coefficients by zero for its inverse. The lower residue map has kernel exactly the A-linear comparison range. Its surjectivity and the imported native linear first-isomorphism theorem give the specified module cokernel equivalence, with representative, inverse and equality APIs.

### Coefficients of a native kernel tensor

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coordinate-condition. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.kernel_coordinate_condition.

Statement: For z in the native A-linear kernel of Θ and p=(i,j), its specified source coefficient C_s(z)(p) is zero when i+j<n, and f C_s(z)(p)=0 when n≤i+j.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinate-equivalence, mathlib:LinearMap.mem_ker.

Proof:

1. Use native kernel membership to obtain Θ(z)=0. Reconstruct z through C_s⁻¹ C_s(z) and its synthesis formula.
2. Apply the existing weighted kernel coefficient criterion to this actual coefficient family. No regularity or cancellation of f is used.

Uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coordinate-equivalence — Bundles the wrapping coefficients into ann_A(f) and proves extension by zero inverts extraction.

Acceptance: A kernel tensor has vanishing nonwrapping coordinates, and wrapping coordinates lie in the actual multiplication kernel, including zero and nonreduced rings.

Sources: [Talpo–Vistoli §3.1 pp14–16](https://arxiv.org/pdf/1410.1164v2) and [Stacks040N](https://stacks.math.columbia.edu/tag/040N), finite root-chart action and positive-exponent unit cover. These module-coordinate statements are explicit native algebra derivations using the named baseline and packet inputs.

### Specified wrapping kernel coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coordinate-equivalence. construction. Native name: TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv.

Statement: With W={(i,j):n≤i+j} and ann_A(f)=ker(f•id_A), construct the specified native A-linear equivalence ker_A Θ ≃ (W→ann_A(f)). Its forward map extracts C_s(z) on W. Its inverse applies C_s⁻¹ to the family equal to d_p on W and zero elsewhere.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coordinate-condition, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinate-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coefficients.

Proof:

1. Bundle each wrapping coefficient as a member of ker(f•id_A), using the actual-kernel coefficient condition.
2. Extend an annihilator family by zero and use the existing kernel criterion to prove that its native source synthesis lies in ker Θ.
3. Use the specified C_s inverse laws, the vanishing nonwrapping coefficients and subtype extensionality for both inverse laws. Coordinate extraction supplies addition and scalar compatibility.

Uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel — Supplies the specified equivalence and its evaluation on the existing source-basis expansion.

API:

- TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv_apply (projection): For z∈ker Θ and p∈W, the underlying scalar of kernelCoordinateEquiv(z)(p) is C_s(z)(p).
- TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv_symm_coordinates (characterisation): The source coefficient of the inverse of d at p equals d_p when p∈W and zero otherwise.
- TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv_nonwrap (simp): For an actual kernel tensor z and i+j<n, its source coefficient at (i,j) is zero.

Tests:

- TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv.test_one (degenerate): For n=1 and arbitrary f, every actual element of ker Θ is zero; W is empty.
- TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv.test_nonreduced (computation): For A=Z/4,f=2,n=2, extend the wrapping annihilator coefficient 2 by zero. Its inverse is a nonzero native kernel tensor and has source coefficient 2 at (1,1).
- TauCeti.RootStack.affineTorsorComparison.kernelCoordinateEquiv.test_branch (computation): For any field k,f=0,n=2, the inverse of the wrapping coefficient 1 has source coefficient 1 at (1,1). This uses the full nilpotent root chart.

Acceptance: The inverse fixes the actual tensor and coefficient normalization. It requires neither reducedness nor invertibility of n or f.

Sources: [Talpo–Vistoli §3.1 pp14–16](https://arxiv.org/pdf/1410.1164v2) and [Stacks040N](https://stacks.math.columbia.edu/tag/040N), finite root-chart action and positive-exponent unit cover. These module-coordinate statements are explicit native algebra derivations using the named baseline and packet inputs.

### Lower target residue map

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-residue. construction. Native name: TauCeti.RootStack.affineTorsorComparison.cokernelResidue.

Statement: With L={(i,k):k<i}, define the native A-linear map R_f:H⊗_A B→(L→A/(f)) by R_f(z)(p)=C_t(z)(p) modulo the principal ideal (f). It retains precisely the strictly lower target coordinates of the actual tensor comparison.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence, mathlib:Submodule.mkQ.

Proof:

1. Compose evaluation of the specified target coefficient equivalence at each p∈L with the native linear quotient map by Ideal.span{f}.
2. Addition and scalar compatibility follow from those native linear maps, pointwise. No quotient by the algebra ideal generated by range Θ is taken.

Uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-residue-surjective — The native target coefficient inverse synthesizes a lift of any residue family.
- FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-residue-kernel — Its vanishing residues are exactly the existing lower-coordinate divisibility criterion for the comparison range.

API:

- TauCeti.RootStack.affineTorsorComparison.cokernelResidue_apply (projection): At p∈L, R_f(z)(p) is Ideal.Quotient.mk (Ideal.span{f}) (C_t(z)(p)).
- TauCeti.RootStack.affineTorsorComparison.cokernelResidue_surjective (universal-property): Every L-indexed family of classes in A/(f) has a preimage under the actual residue map.
- TauCeti.RootStack.affineTorsorComparison.cokernelResidue_ker (characterisation): The native A-submodule ker R_f equals range_A Θ.

Tests:

- TauCeti.RootStack.affineTorsorComparison.cokernelResidue.test_one (degenerate): For n=1 and arbitrary f, R_f sends every actual target tensor to the zero family, since L is empty.
- TauCeti.RootStack.affineTorsorComparison.cokernelResidue.test_upper (computation): At n=2 and arbitrary f, the actual target vector e_0⊗1 has zero lower residue family.
- TauCeti.RootStack.affineTorsorComparison.cokernelResidue.test_lower (computation): At n=2 and arbitrary f, the actual target vector e_1⊗1 has residue class 1 at lower position (1,0).

Acceptance: The residue carrier is the actual principal-ideal quotient A/(f), with its full nilpotent structure.

Sources: [Talpo–Vistoli §3.1 pp14–16](https://arxiv.org/pdf/1410.1164v2) and [Stacks040N](https://stacks.math.columbia.edu/tag/040N), finite root-chart action and positive-exponent unit cover. These module-coordinate statements are explicit native algebra derivations using the named baseline and packet inputs.

### Surjectivity of lower residues

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-residue-surjective. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.cokernelResidue_surjective.

Statement: For any commutative A, positive n and f∈A, the specified lower residue map R_f:H⊗_A B→(L→A/(f)) is surjective.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-residue, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence, mathlib:Ideal.Quotient.mk_surjective.

Proof:

1. For each lower position choose a native principal-ideal quotient representative of the supplied residue.
2. Extend these representatives by zero at other target positions and apply C_t⁻¹. Its inverse law and the quotient lift property give exactly the desired family.

Uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-coordinate-equivalence — Discharges the surjectivity hypothesis of the imported linear first-isomorphism theorem.

Acceptance: The construction also applies when L is empty, A is the zero ring or f is nilpotent; no representative is asserted canonical.

Sources: [Talpo–Vistoli §3.1 pp14–16](https://arxiv.org/pdf/1410.1164v2) and [Stacks040N](https://stacks.math.columbia.edu/tag/040N), finite root-chart action and positive-exponent unit cover. These module-coordinate statements are explicit native algebra derivations using the named baseline and packet inputs.

### Residue kernel equals comparison range

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-residue-kernel. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.cokernelResidue_ker.

Statement: The kernel of the specified lower residue map is equal to the A-linear range of the actual native comparison Θ as submodules of H⊗_A B.

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-residue, FunctionFieldArithmeticPartII:RS.0/affine-torsor-image-coefficients, FunctionFieldArithmeticPartII:RS.0/affine-torsor-target-coordinate-equivalence, mathlib:LinearMap.mem_ker, mathlib:Ideal.Quotient.eq_zero_iff_mem, mathlib:Ideal.mem_span_singleton'.

Proof:

1. For an actual target tensor z, rewrite the existing image coefficient criterion using C_t⁻¹ C_t(z)=z.
2. The residue family vanishes exactly when each strictly lower coefficient belongs to (f). Native principal-ideal membership is equivalent to existence of a scalar factor f a at that position.
3. Identify membership in both native submodules pointwise. There is no constraint on the other target coordinates and no assumption that f is regular.

Uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-coordinate-equivalence — Transports the quotient by range Θ to the quotient by the residue kernel without changing representatives.

Acceptance: This is equality of A-submodules. The algebra ideal of range Θ contains 1, so it cannot model this module cokernel.

Sources: [Talpo–Vistoli §3.1 pp14–16](https://arxiv.org/pdf/1410.1164v2) and [Stacks040N](https://stacks.math.columbia.edu/tag/040N), finite root-chart action and positive-exponent unit cover. These module-coordinate statements are explicit native algebra derivations using the named baseline and packet inputs.

### Specified module cokernel coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-coordinate-equivalence. construction. Native name: TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv.

Statement: Construct the specified native A-linear equivalence (H⊗_A B)/range_A Θ ≃ (L→A/(f)) by transporting along ker R_f=range_A Θ and applying the native surjective first-isomorphism theorem to R_f. On [z], its value is the lower residue family R_f(z).

Hypotheses: A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-residue, FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-residue-surjective, FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel-residue-kernel, mathlib:Submodule.quotEquivOfEq, mathlib:LinearMap.quotKerEquivOfSurjective.

Proof:

1. Use the proved equality of native submodules to identify quotient by range Θ with quotient by ker R_f through Submodule.quotEquivOfEq.
2. Compose with the imported linear first-isomorphism equivalence of the surjective residue map.
3. Its representative formula is the lower coefficient residue. Injectivity proves the inverse-on-residues formula and that two quotient classes agree exactly when their residue families agree.

Uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-cokernel — Supplies the specified equivalence and the exact residue evaluation on every target-basis expansion.

API:

- TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv_mk (projection): At p∈L, the coordinate equivalence of the native module quotient class [z] equals C_t(z)(p) modulo (f).
- TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv_symm_residue (characterisation): The inverse equivalence applied to R_f(z) is the actual module quotient class [z].
- TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv_eq_iff (extensionality): Two actual target tensors give the same module quotient class iff their lower residue families agree.

Tests:

- TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv.test_one (degenerate): For n=1 and arbitrary f, every actual native module cokernel class is zero.
- TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv.test_regular_nonunit (computation): For A=Z,f=2,n=2, the actual module cokernel class of e_1⊗1 is nonzero, detected by its residue 1 modulo (2).
- TauCeti.RootStack.affineTorsorComparison.cokernelCoordinateEquiv.test_nonreduced (computation): For A=Z/8,f=4,n=2, the actual module cokernel class z=[e_1⊗1] satisfies 2z≠0 and 4z=0. In particular the quotient cannot be replaced by its reduction F₂.

Acceptance: The equivalence keeps the actual module quotient and the full A/(f); geometric orbit sets and reduced quotient rings do not satisfy the contract.

Sources: [Talpo–Vistoli §3.1 pp14–16](https://arxiv.org/pdf/1410.1164v2) and [Stacks040N](https://stacks.math.columbia.edu/tag/040N), finite root-chart action and positive-exponent unit cover. These module-coordinate statements are explicit native algebra derivations using the named baseline and packet inputs.

### Module-coordinate checkpoint provenance

The preceding module-coordinate checkpoint and its receipts are preserved in the immutable handoff linked below. The current unit-chart continuation extends those proofs; its proof and admitted-signature checks are separate.

## Native unit-chart comparison continuation

For A a commutative ring, n≥1 and a specified unit v, let B=A[x]/(xⁿ−v) and H=A[Multiplicative(ZMod n)], and retain the actual coaction-induced comparison Θ. The specified E_v is the existing algebra equivalence obtained from this actual map’s proved bijectivity. Its inverse sends e_1⊗1 to x⊗(v⁻¹x^(n−1)) and fixes1⊗b for every b. Multiplication and character powers give the inverse on every e_i⊗b, for all natural i including i≥n. This supports working with the unit-open chart without constructing a replacement group or quotient carrier.

The earlier existential unit-inverse statement is unchanged and now follows from these specified maps. All143 inherited mathematical statements, the reserved root-stack key, both paper routes,39 planets, eight gaps and thirteen supplier requests are preserved. The construction uses only native algebra infrastructure; it supplies no geometric root stack, descent theorem or closure claim.

### Inverse of a unit-chart root

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-root-unit-inverse. lemma. Native name: TauCeti.RootStack.affineRoot.unit_mul_inverse.

For any commutative A, v∈A× and n≥1, the native root x of B=A[T]/(Tⁿ−v) satisfies x(v⁻¹x^(n−1))=1 in B; the coefficient v⁻¹ uses the algebra map A→B.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Commute the inverse coefficient past x and combine x·x^(n−1)=xⁿ, using n≥1.
2. Use the native root relation and the unit inverse equation under the coefficient algebra map.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-root-relation.

Acceptance:

- At n=1 the root is v, so the formula retains v⁻¹; the same identity holds in the zero ring and arbitrary characteristic.

Sources: [Stacks Tag040N](https://stacks.math.columbia.edu/tag/040N), Lemma59.28.3, unit-parameter cover, and TV17 §3.1, finite chart action. These passages motivate the native calculation; the explicit inverse formulas are derived using the listed algebra prerequisites.

### Specified unit-chart comparison equivalence

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-equivalence. construction. Native name: TauCeti.RootStack.affineTorsorComparison.unitEquiv.

For any commutative A, specified unit v∈A× and n≥1, define E_v:B⊗_A B≃ₐ[A]H⊗_A B by promoting the actual native comparison Θ_v with the proved bijectivity criterion. Its forward algebra map is exactly Θ_v; the inverse is thereby specified, rather than chosen up to an unrelated equivalence.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. A specified unit satisfies the unit alternative in the native sharp bijectivity criterion.
2. Promote that actual algebra homomorphism using the existing algebra-equivalence constructor; import generic equivalence laws.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-bijective, mathlib:AlgEquiv.ofBijective.

API uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-inverse — Supplies a specified equivalence, with inverse generator and right-factor evaluations, for the existing existential contract.
- FunctionFieldArithmeticPartII:RS.1/affine-chart — The unit-open action comparison calculation supports the quotient-chart specialization; it supplies no geometric carrier or stack descent theorem.

API:

- TauCeti.RootStack.affineTorsorComparison.unitEquiv_toAlgHom (compatibility): The forward algebra homomorphism of E_v is exactly Θ_v.
- TauCeti.RootStack.affineTorsorComparison.unitEquiv_symm_character (simp): E_v⁻¹(e_1⊗1)=x⊗(v⁻¹x^(n−1)).
- TauCeti.RootStack.affineTorsorComparison.unitEquiv_symm_right (simp): For every b∈B, E_v⁻¹(1⊗b)=1⊗b.
- TauCeti.RootStack.affineTorsorComparison.unitEquiv_symm_character_tmul (projection): For every natural i and b∈B, E_v⁻¹(e_i⊗b)=x^i⊗((v⁻¹x^(n−1))^i b), with the character index reduced modulo n. Use actual algebra equivalence laws for additivity and inverse identities.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_one (degenerate): For n=1 and any specified unit v, E_v⁻¹(e_1⊗1)=1; the cyclic character is the unit.
- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_wild (computation): For A=F₂,v=1,n=2, E_v⁻¹(e_1⊗1)=x⊗x; no invertibility of2 is needed.
- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_coefficient (computation): For A=F₅,v=2 with inverse3 and n=2, E_v⁻¹(e_1⊗1)=x⊗(3x). Dropping the inverse coefficient fails this value.
- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_zero_ring (degenerate): Over a subsingleton commutative coefficient ring, the actual inverse sends every target tensor to zero.
- TauCeti.RootStack.affineTorsorComparison.unitEquiv.test_right_factor (compatibility): For every A,v,n and b∈B, the actual inverse fixes the specified right factor: E_v⁻¹(1⊗b)=1⊗b.

Acceptance:

- No inverse of n is used. The actual zero-ring and wild unit charts are included.

Sources: [Stacks Tag040N](https://stacks.math.columbia.edu/tag/040N), Lemma59.28.3, unit-parameter cover, and TV17 §3.1, finite chart action. These passages motivate the native calculation; the explicit inverse formulas are derived using the listed algebra prerequisites.

### Unit-chart forward comparison

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-forward. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.unitEquiv_toAlgHom.

The forward A-algebra homomorphism of the specified unit-chart E_v is exactly Θ_v.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Use the native promoted-equivalence forward-map identity.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-equivalence, mathlib:AlgEquiv.toAlgHom_ofBijective.

Acceptance:

- Every source tensor is mapped by the original coaction-induced comparison.

Sources: [Stacks Tag040N](https://stacks.math.columbia.edu/tag/040N), Lemma59.28.3, unit-parameter cover, and TV17 §3.1, finite chart action. These passages motivate the native calculation; the explicit inverse formulas are derived using the listed algebra prerequisites.

### Unit-chart inverse character

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-character. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.unitEquiv_symm_character.

E_v⁻¹(e_1⊗1)=x⊗(v⁻¹x^(n−1)) in the actual source algebra.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Apply the native inverse-evaluation criterion and evaluate Θ on this proposed preimage through the pure-tensor and coaction-root formulas.
2. Multiply the second factors using the proved native unit-root inverse identity; the image is exactly e_1⊗1.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-forward, FunctionFieldArithmeticPartII:RS.0/affine-torsor-tmul, FunctionFieldArithmeticPartII:RS.0/affine-coaction-root, FunctionFieldArithmeticPartII:RS.0/affine-root-unit-inverse, mathlib:AlgEquiv.symm_apply_eq, mathlib:AlgEquiv.ofBijective_apply, mathlib:Algebra.TensorProduct.tmul_mul_tmul.

Acceptance:

- The coefficient v⁻¹ is present, including for v=2 over F₅.

Sources: [Stacks Tag040N](https://stacks.math.columbia.edu/tag/040N), Lemma59.28.3, unit-parameter cover, and TV17 §3.1, finite chart action. These passages motivate the native calculation; the explicit inverse formulas are derived using the listed algebra prerequisites.

### Unit-chart inverse right factor

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-right. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.unitEquiv_symm_right.

For every b∈B, E_v⁻¹(1⊗b)=1⊗b.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. The original pure-tensor formula at1⊗b uses δ(1)=1 and gives exactly1⊗b.
2. Use the native inverse-evaluation criterion and the forward-map equality.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-forward, FunctionFieldArithmeticPartII:RS.0/affine-torsor-tmul, FunctionFieldArithmeticPartII:RS.0/affine-coaction, mathlib:AlgEquiv.symm_apply_eq, mathlib:AlgEquiv.ofBijective_apply.

Acceptance:

- The right factor stays unchanged, for arbitrary b rather than only the distinguished root.

Sources: [Stacks Tag040N](https://stacks.math.columbia.edu/tag/040N), Lemma59.28.3, unit-parameter cover, and TV17 §3.1, finite chart action. These passages motivate the native calculation; the explicit inverse formulas are derived using the listed algebra prerequisites.

### Unit-chart inverse character tensors

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-character-tensor. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.unitEquiv_symm_character_tmul.

For every i≥0 and b∈B, E_v⁻¹(e_i⊗b)=x^i⊗((v⁻¹x^(n−1))^i b), with e_i indexed by i modulo n.

Hypotheses:

- A is any commutative ring, n≥1 and f∈A, unless the statement specifies a field or a unit. No reducedness, domain, flatness of coefficient change or invertibility-of-n assumption.

Construction or proof:

1. Factor e_i⊗b=(e_1⊗1)^i(1⊗b) using the native character-power and tensor multiplication laws.
2. Apply the actual inverse algebra homomorphism, preserving multiplication and powers; use both generator evaluations.
3. Use the native tensor-power and multiplication laws to combine the result.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-character, FunctionFieldArithmeticPartII:RS.0/affine-torsor-unit-right, FunctionFieldArithmeticPartII:RS.0/affine-character-power, mathlib:Algebra.TensorProduct.tmul_pow, mathlib:Algebra.TensorProduct.tmul_mul_tmul.

Acceptance:

- Includes i=0, i≥n and n=1; it does not choose representatives or divide by n.

Sources: [Stacks Tag040N](https://stacks.math.columbia.edu/tag/040N), Lemma59.28.3, unit-parameter cover, and TV17 §3.1, finite chart action. These passages motivate the native calculation; the explicit inverse formulas are derived using the listed algebra prerequisites.

### Proof and sketch boundaries

The current native proof extraction has37 examples, all with actual bodies, and22 printed declaration axiom audits. It has zero errors, two admitted assertions (the determinant and the general field-rank theorem), and no other warnings. The unit-inverse declarations have no admission dependency. The four inherited direct examples now have actual proofs: the nonzero branch tensor, the wild unit nilpotent, failure of injectivity preservation under Z→F₂, and the full Z/8 cokernel-equivalence example with an element of order four. The five new unit-chart tests compute the exponent-one character, the wild inverse, the inverse coefficient3 over F₅, the zero ring and the unchanged right factor.

The distinct proposed native signature extraction has37 examples, zero errors,100 admitted-body warnings and no other warnings. The final suggested signatures and examples are admitted under PROTOCOL13. Exact-pin compiled Tau Ceti line-bundle and roots-of-unity modules remain unavailable, so the complete suggested file is uncompiled. All149 nodes stay unchecked and all ten stages stay partial. The eight geometric gaps and thirteen supplier requests remain open. The handoff gives immutable source commits, byte-exact reconstruction recipes and the native atlas projection receipt.

## Native zero-section rank continuation — 2 October 2026

For the actual comparison Θ₀ on the full algebra k[x]/(xⁿ), the native kernel coordinates become W→k. The restricted cyclic permutation identifies W with the strictly lower target coordinates, whose cardinal is n(n−1)/2. The actual tensor source has dimension n². Rank-nullity then gives image dimension n(n+1)/2, using parity before natural-number division. This holds in every characteristic, including when the characteristic divides n. The specified zero-kernel equivalence itself works over every commutative coefficient ring and preserves nilpotent coefficients.

The nine additional unchecked planning nodes and six API records below extend the existing coordinate construction. The checked proof is archived at an immutable public commit recorded in the handoff; the submitted signatures retain admitted bodies. The determinant remains open, along with all geometric supplier contracts. All ten stages remain partial. Earlier source reading, paper routing, finite-field checks and source-finding receipts retain their original attribution.

### Wrapping columns and lower coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-wrapping-equivalence. construction. Native name: TauCeti.RootStack.affineTorsorComparison.wrappingEquiv.

Restrict the actual cyclic permutation σ(i,j)=(i,i+j mod n) to an equivalence W≃L, where W={(i,j)∈Fin n×Fin n:n≤i+j} and L={(i,k):k<i}. Its inverse is the restriction of σ⁻¹(i,k)=(i,k−i mod n). These are source/target indices of the native comparison, not newly chosen coordinates.

Hypotheses:

- A is any commutative ring; n≥1 for root constructions. Cardinality lower_card also admits n=0. Dimension statements explicitly require a field k. No characteristic or invertibility-of-n hypothesis.

Construction or proof:

1. Apply the existing equivalence of subtypes to σ and the proved wrap_iff_lower condition.
2. The restricted forward/inverse maps retain σ and σ⁻¹; their inverse laws are imported.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation, FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-wrap, mathlib:Equiv.subtypeEquiv.

API uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-wrapping-card — Supplies the specified coordinate or index equivalence used by the zero-section dimension calculation.

API:

- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv_apply (projection): The underlying forward pair is σ(p); its wrapping witness supplies the lower-coordinate witness.
- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv_symm (simp): The underlying inverse pair is σ⁻¹(q), retaining the original cyclic subtraction.
- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv_injective (extensionality): Equal lower-coordinate images under the specified restricted map imply equal wrapping source pairs; import the native equivalence injectivity law.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv.test_one (degenerate): At n=1 the wrapping subtype has cardinal zero.
- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv.test_two (computation): At n=2 the restricted forward map sends (1,1) to (1,0).
- TauCeti.RootStack.affineTorsorComparison.wrappingEquiv.test_inverse (computation): At n=3 the restricted inverse sends (2,0) to (2,1).

Acceptance:

- W and L are empty at n=1; the lower coordinate (2,0) at n=3 comes from (2,1).

Sources:

- TV17, §3.1 pp.14–16, character grading and Corollary 3.13, P=N: “root stacks”. The finite quotient chart motivates this calculation. This root-specific cardinality, coordinate or dimension assertion is derived from the actual native comparison and the listed pinned library declarations; it is not a theorem quoted from the paper.

## RS.0 continuation — specified determinant dependencies

Codex — codex-a71f92,2026-10-02. All index quotients and E=n(n−1)/2 are natural numbers; they are not divisions in A. The actual native matrix retains the source/target pair indexing of the inherited coordinate equivalences.

### Rowwise root coefficient permutation

Node: `FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-rows`; declaration: `TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_rows`.

For positive n, the specified native coefficient permutation σ(i,j)=(i,i+j) equals Equiv.prodCongrRight(i↦finCycle(i)); in row i its second coordinate is translated cyclically by i.

Hypotheses: n≥1. Matrix and weight-product assertions use any commutative coefficient ring A and f∈A; index and sign assertions are independent of A. No nonzerodivisor, unit, reducedness or invertibility-of-n assumption.

Prerequisites: `FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation`, `mathlib:Equiv.prodCongrRight`, `mathlib:finCycle`.

Proof:

1. Compare both components of the supplied native equivalences; cyclic addition is commutative, so the existing finCycle convention j+i equals i+j.

Acceptance: Uses the actual σ, not a newly chosen reordering; inverse and natural representatives stay those of the existing coordinate map.

Tests:

- `TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_rows.test_wrap` (computation): At n=4 the actual permutation sends (3,3) to (3,2), retaining cyclic rather than natural truncated arithmetic.

Source: [Stacks040N, Lemma59.28.3](https://stacks.math.columbia.edu/tag/040N), complete positive-exponent unit-chart statement/proof read2026-10-02. This lemma is an authored root-coordinate deduction, not a printed determinant theorem; generic finite-permutation/counting/determinant infrastructure is imported from the pinned library.

### Root coefficient permutation sign

Node: `FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-sign`; declaration: `TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_sign`.

For positive n, the integer-unit sign of the actual coefficient permutation σ is (−1)^((n−1)E), where E=n(n−1)/2 is formed in natural numbers before any coefficient-ring specialization.

Hypotheses: n≥1. Matrix and weight-product assertions use any commutative coefficient ring A and f∈A; index and sign assertions are independent of A. No nonzerodivisor, unit, reducedness or invertibility-of-n assumption.

Prerequisites: `FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-rows`, `mathlib:finCycle_eq_finRotate_iterate`, `mathlib:sign_finRotate`, `mathlib:Equiv.Perm.sign_prodCongrRight`, `mathlib:Finset.prod_pow_eq_pow_sum`, `mathlib:Finset.sum_range_id`.

Proof:

1. Use the native finCycle/finRotate iterate equality and the permutation power coercion to identify each row with the ith power of the n-cycle.
2. Import the rowwise sign product. Each row sign is (−1)^((n−1)i). Convert their product to the power with exponent (n−1)Σ_i i.
3. Import the natural Gauss sum Σ_i i=n(n−1)/2. No division by2 is performed in A.

Acceptance: The sign belongs to integer units; the determinant casts it to the coefficient ring only after the integral calculation.

Tests:

- `TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_sign.test_two` (computation): At n=2 the actual permutation has integer-unit sign−1.
- `TauCeti.RootStack.affineTorsorComparison.coefficientPermutation_sign.test_three` (non-example): At n=3 the sign is+1; using only (−1)^E would give−1 and is wrong.

Source: [Stacks040N, Lemma59.28.3](https://stacks.math.columbia.edu/tag/040N), complete positive-exponent unit-chart statement/proof read2026-10-02. This lemma is an authored root-coordinate deduction, not a printed determinant theorem; generic finite-permutation/counting/determinant infrastructure is imported from the pinned library.

### Root comparison wrapping exponent

Node: `FunctionFieldArithmeticPartII:RS.0/affine-torsor-weight-exponent`; declaration: `TauCeti.RootStack.affineTorsorComparison.weight_exponent`.

For n≥1 and p=(i,j) in Fin n×Fin n, floor((i+j)/n)=1 when n≤i+j and0 otherwise, with i,j their natural representatives.

Hypotheses: n≥1. Matrix and weight-product assertions use any commutative coefficient ring A and f∈A; index and sign assertions are independent of A. No nonzerodivisor, unit, reducedness or invertibility-of-n assumption.

Prerequisites: `mathlib:Nat.add_div_eq_of_add_mod_lt`, `mathlib:Nat.add_div_eq_of_le_mod_add_mod`.

Proof:

1. Each representative is smaller than n, hence its remainder is itself and its individual quotient is0.
2. Split on the actual wrapping inequality. Import the two natural addition/division formulas to give quotient1 or0, retaining positivity of n.

Acceptance: This root-specific index assertion explains every column weight in the actual matrix; it does not add an invertibility assumption to A.

Tests:

- `TauCeti.RootStack.affineTorsorComparison.weight_exponent.test_wrap` (computation): At n=2 the column (1,1) has exponent1.
- `TauCeti.RootStack.affineTorsorComparison.weight_exponent.test_nonwrap` (non-example): At n=2 the column (0,1) has exponent0, so it contributes weight1 rather than f.

Source: [Stacks040N, Lemma59.28.3](https://stacks.math.columbia.edu/tag/040N), complete positive-exponent unit-chart statement/proof read2026-10-02. This lemma is an authored root-coordinate deduction, not a printed determinant theorem; generic finite-permutation/counting/determinant infrastructure is imported from the pinned library.

### Product of root comparison weights

Node: `FunctionFieldArithmeticPartII:RS.0/affine-torsor-weight-product`; declaration: `TauCeti.RootStack.affineTorsorComparison.weight_product`.

For any commutative A, f∈A and n≥1, the product over p∈Fin n×Fin n of f^floor((p₁+p₂)/n) is f^E, E=n(n−1)/2.

Hypotheses: n≥1. Matrix and weight-product assertions use any commutative coefficient ring A and f∈A; index and sign assertions are independent of A. No nonzerodivisor, unit, reducedness or invertibility-of-n assumption.

Prerequisites: `FunctionFieldArithmeticPartII:RS.0/affine-torsor-weight-exponent`, `FunctionFieldArithmeticPartII:RS.0/affine-torsor-wrapping-card`, `mathlib:Finset.prod_filter`, `mathlib:Fintype.card_subtype`.

Proof:

1. Rewrite each weight as f on wrapping columns and1 on other columns.
2. Import the filtered product identity and constant product law. Identify the filter cardinality with the actual wrapping subtype.
3. Consume the existing native wrapping_card result; do not re-plan ordered-pair counting.

Acceptance: Works at f=0, nonunits, nilpotents and the zero ring; no logarithm, cancellation or division in A is used.

Tests:

- `TauCeti.RootStack.affineTorsorComparison.weight_product.test_nonunit` (computation): Over Z at n=2 and nonunit f=2, the actual product of all four column weights is2.

Source: [Stacks040N, Lemma59.28.3](https://stacks.math.columbia.edu/tag/040N), complete positive-exponent unit-chart statement/proof read2026-10-02. This lemma is an authored root-coordinate deduction, not a printed determinant theorem; generic finite-permutation/counting/determinant infrastructure is imported from the pinned library.

### Root comparison diagonal reindexing

Node: `FunctionFieldArithmeticPartII:RS.0/affine-torsor-matrix-reindex`; declaration: `TauCeti.RootStack.affineTorsorComparison.matrix_reindex`.

For the specified native monomial matrix M, let d(c)=f^floor((c₁+c₂)/n). Then M=(Matrix.diagonal d).submatrix σ⁻¹ id. The first-index reindexing is the inverse of the actual coefficient permutation; source and target index orders are retained.

Hypotheses: n≥1. Matrix and weight-product assertions use any commutative coefficient ring A and f∈A; index and sign assertions are independent of A. No nonzerodivisor, unit, reducedness or invertibility-of-n assumption.

Prerequisites: `FunctionFieldArithmeticPartII:RS.0/affine-torsor-coefficient-permutation`, `FunctionFieldArithmeticPartII:RS.0/affine-torsor-permutation-representative`, `FunctionFieldArithmeticPartII:RS.0/affine-torsor-monomial`, `mathlib:Matrix.det_diagonal`.

Proof:

1. For every row r and column c, the monomial support condition r=σ(c) is equivalent to σ⁻¹(r)=c.
2. Compare diagonal entries after this exact reindexing. On support, equality transports the weight index; off support both entries are0.

Acceptance: The inverse orientation is explicit. This is an equality of the actual root monomial matrix and the reindexed diagonal, not an arbitrary endomorphism model.

Tests:

- `TauCeti.RootStack.affineTorsorComparison.matrix_reindex.test_weight` (computation): At n=2 the actual monomial matrix entry with row(1,0) and column(1,1) is f.

Source: [Stacks040N, Lemma59.28.3](https://stacks.math.columbia.edu/tag/040N), complete positive-exponent unit-chart statement/proof read2026-10-02. This lemma is an authored root-coordinate deduction, not a printed determinant theorem; generic finite-permutation/counting/determinant infrastructure is imported from the pinned library.

### Updated proof of the inherited weighted determinant

`FunctionFieldArithmeticPartII:RS.0/affine-torsor-determinant`; `TauCeti.RootStack.affineTorsorComparison.determinant`.

In the specified source and target pair-indexed bases, the comparison matrix has entry M_(r,c)=f^⌊(c₁+c₂)/n⌋ if r₁=c₁ and r₂=(c₁+c₂) mod n, and zero otherwise. With E=n(n−1)/2, det M=(−1)^((n−1)E) f^E. The same pair ordering is used for rows and columns; this is not an endomorphism determinant without chosen identifications.

1. Consume matrix_reindex for the specified monomial support and inverse coefficient permutation. Apply the pinned determinant-permutation and diagonal determinant formulas.
2. Consume coefficientPermutation_sign and the native inverse-sign law. Cast the already computed integer-unit sign into A.
3. Consume weight_product for the exact column weights. Their count E is computed in natural numbers, not by dividing by2 in A. Combine sign and weight without cancellation.

Additional tests:

- `TauCeti.RootStack.affineTorsorComparison.determinant.test_exponent_one` (degenerate): At n=1 the specified matrix has determinant1 for every commutative A and every f, including f=0.
- `TauCeti.RootStack.affineTorsorComparison.determinant.test_three` (computation): At n=3 the determinant is f³ over any commutative A; omitting the row-sign factor would incorrectly negate it.
- `TauCeti.RootStack.affineTorsorComparison.determinant.test_zero_ring` (degenerate): For A=ZMod1, n=2 and f=0, the determinant is0 in the zero ring; numerical polynomial degree is not substituted for the chosen index.
- `TauCeti.RootStack.affineTorsorComparison.determinant.test_wild` (compatibility): For A=ZMod2, n=2 and f=1, the determinant is1 even though n is zero in A.

Verification boundary: the complete separate native extraction is 1716 lines with 62 proved examples and 42 axiom audits. It passed at the exact Mathlib pin with no errors, warnings or admissions; the reconstructed 946-line admitted signature extraction passed with only its 142 expected admission warnings. The public archive [checked root determinant](https://github.com/CBirkbeck/tauceti-explorer/blob/6df00ac8cb82d19130a90b5d1ea473e803fd8eae/research/blueprint/suggested/FunctionFieldArithmeticPartII.lean) contains the exact native body and submitted head. Reconstruction verifies all three SHA-256 values, six determinant/helper signatures and eleven new test statements. Native source SHA-256: d40ac61960c10d4640c4ecaa3204968021303cdcdd7dedc4ef4b0b81835938e7; signature source SHA-256: c688fbc69edc77647a553185633a2a5cc9838fd7c7beaa0f62ba793450b83f01. The full 1964-line geometric/TauCeti-importing suggested file was not compiled: the existing exact-pin build lacks both required TauCeti line-bundle and root-of-unity artifacts. These prototype checks are not a library implementation or a certification of the remaining geometric/source work.

All implementations remain unchecked and all ten stages partial. This matrix determinant does not close normalized-coframe descent, quotient-stack algebraicity/coarse comparisons, the infinite fpqc tower or ramified geometric class-field theory. Full-file elaboration still requires the actual geometric/TauCeti imports.


### Number of lower root coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-lower-card. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.lower_card.

For every n≥0, the native subtype L={(i,k)∈Fin n×Fin n:k<i} has cardinal n(n−1)/2.

Hypotheses:

- A is any commutative ring; n≥1 for root constructions. Cardinality lower_card also admits n=0. Dimension statements explicitly require a field k. No characteristic or invertibility-of-n hypothesis.

Construction or proof:

1. Identify the subtype cardinality with the filtered product of Fin n.
2. Swap the two factors and import the existing ordered-pair counting theorem; evaluate choose n 2. No generic counting theorem is replanned.

Inputs: mathlib:Fintype.card_subtype, mathlib:Finset.card_product_filter_lt, mathlib:Nat.choose_two_right.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.lower_card.test_zero (degenerate): The lower-coordinate subtype is empty at n=0.
- TauCeti.RootStack.affineTorsorComparison.lower_card.test_three (computation): The lower-coordinate subtype has cardinal three at n=3.

Acceptance:

- Includes n=0 and n=1; at n=3 the cardinal is three.

Sources:

- TV17, §3.1 pp.14–16, character grading and Corollary 3.13, P=N: “root stacks”. The finite quotient chart motivates this calculation. This root-specific cardinality, coordinate or dimension assertion is derived from the actual native comparison and the listed pinned library declarations; it is not a theorem quoted from the paper.


### Number of killed root columns

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-wrapping-card. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.wrapping_card.

For n≥1, the native wrapping subtype W={(i,j)∈Fin n×Fin n:n≤i+j} has cardinal n(n−1)/2.

Hypotheses:

- A is any commutative ring; n≥1 for root constructions. Cardinality lower_card also admits n=0. Dimension statements explicitly require a field k. No characteristic or invertibility-of-n hypothesis.

Construction or proof:

1. Transport the lower-coordinate count through the specified restricted cyclic equivalence.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-wrapping-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-lower-card, mathlib:Fintype.card_congr.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.wrapping_card.test_three (computation): At n=3 there are three wrapping columns.

Acceptance:

- Counts the actual killed source columns at f=0, independently of characteristic.

Sources:

- TV17, §3.1 pp.14–16, character grading and Corollary 3.13, P=N: “root stacks”. The finite quotient chart motivates this calculation. This root-specific cardinality, coordinate or dimension assertion is derived from the actual native comparison and the listed pinned library declarations; it is not a theorem quoted from the paper.


### Specified zero-section kernel coordinates

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-kernel-equivalence. construction. Native name: TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv.

For any commutative A and n≥1, define K₀:ker Θ₀≃ₗ[A](W→A) by the already specified native kernel coordinate equivalence followed pointwise by ker(0·id_A)≃ₗ[A]A. The original tensor element is recovered by extending its wrapping coefficients by zero and using the native source synthesis. No field or reducedness assumption is needed.

Hypotheses:

- A is any commutative ring; n≥1 for root constructions. Cardinality lower_card also admits n=0. Dimension statements explicitly require a field k. No characteristic or invertibility-of-n hypothesis.

Construction or proof:

1. At f=0 the annihilator submodule is the top submodule; use its existing linear equivalence with A.
2. Apply the existing pointwise linear-equivalence constructor and compose with the specified native kernel coordinates.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coordinate-equivalence, mathlib:LinearEquiv.ofTop, mathlib:LinearEquiv.piCongrRight.

API uses:

- FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-kernel-finrank — Supplies the specified coordinate or index equivalence used by the zero-section dimension calculation.

API:

- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv_apply (projection): K₀(z)(p)=Cs(z)(p) for each wrapping pair p, where Cs is the specified native source coordinate equivalence.
- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv_symm_coordinates (simp): Cs(K₀⁻¹(d))(p)=d(p) if p is wrapping, and 0 otherwise, with the subtype witness retained.
- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv_injective (extensionality): Equal specified wrapping-coordinate families imply equality in the actual native kernel submodule; import the native linear-equivalence injectivity law.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv.test_one (degenerate): For n=1 over every commutative A, an element of ker Θ₀ equals zero.
- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv.test_nonreduced (computation): For A=Z/4,n=2 and constant wrapping coefficient 2, the inverse has source coordinate 2 at (1,1) and 0 at (0,0).
- TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv.test_zero_ring (degenerate): For A=Z/1 and any positive n the specified kernel coordinate family is zero.

Acceptance:

- Retains coefficients such as 2∈Z/4, including zero rings; this is the actual kernel submodule of the tensor comparison.

Sources:

- TV17, §3.1 pp.14–16, character grading and Corollary 3.13, P=N: “root stacks”. The finite quotient chart motivates this calculation. This root-specific cardinality, coordinate or dimension assertion is derived from the actual native comparison and the listed pinned library declarations; it is not a theorem quoted from the paper.


### Extract zero-section kernel coefficients

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-kernel-coordinate. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv_apply.

For z∈ker Θ₀ and p∈W, K₀(z)(p)=Cs(z)(p), where Cs is the fixed tensor-monomial source coordinate equivalence.

Hypotheses:

- A is any commutative ring; n≥1 for root constructions. Cardinality lower_card also admits n=0. Dimension statements explicitly require a field k. No characteristic or invertibility-of-n hypothesis.

Construction or proof:

1. Unfold the specified pointwise top-submodule equivalence; its forward map is the subtype inclusion.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-kernel-equivalence.

Acceptance:

- The coordinate is the original A-value, including nilpotent coefficients.

Sources:

- TV17, §3.1 pp.14–16, character grading and Corollary 3.13, P=N: “root stacks”. The finite quotient chart motivates this calculation. This root-specific cardinality, coordinate or dimension assertion is derived from the actual native comparison and the listed pinned library declarations; it is not a theorem quoted from the paper.


### Recover zero-section kernel tensors

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-kernel-inverse-coordinate. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.kernelZeroEquiv_symm_coordinates.

For d:W→A and each p∈Fin n×Fin n, Cs(K₀⁻¹d)(p) equals d(p) when n≤i+j and equals 0 otherwise. The inverse is the actual native tensor synthesis.

Hypotheses:

- A is any commutative ring; n≥1 for root constructions. Cardinality lower_card also admits n=0. Dimension statements explicitly require a field k. No characteristic or invertibility-of-n hypothesis.

Construction or proof:

1. Use the preceding kernel-coordinate inverse formula and the inverse top-submodule inclusion, which leaves the A-value unchanged.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-kernel-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-kernel-coordinate-equivalence.

Acceptance:

- Both wrapping coefficients and the zero extension are specified; an arbitrary module equivalence would not satisfy this contract.

Sources:

- TV17, §3.1 pp.14–16, character grading and Corollary 3.13, P=N: “root stacks”. The finite quotient chart motivates this calculation. This root-specific cardinality, coordinate or dimension assertion is derived from the actual native comparison and the listed pinned library declarations; it is not a theorem quoted from the paper.


### Dimension of the root tensor source

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-finrank. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.source_finrank.

For any field k, f∈k and n≥1, dim_k(B⊗_k B)=n² for B=k[x]/(xⁿ−f), using the already specified native tensor-monomial coordinates.

Hypotheses:

- A is any commutative ring; n≥1 for root constructions. Cardinality lower_card also admits n=0. Dimension statements explicitly require a field k. No characteristic or invertibility-of-n hypothesis.

Construction or proof:

1. Transport dimension through Cs:B⊗B≃ₗ[k](Fin n×Fin n→k).
2. Import the existing finite-function dimension theorem and evaluate the product cardinality.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-coordinate-equivalence, mathlib:LinearEquiv.finrank_eq, mathlib:Module.finrank_pi.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.source_finrank.test_two (computation): For every field k and every f∈k, the n=2 native tensor source has dimension four.

Acceptance:

- Applies at every parameter f, including zero, independently of characteristic.

Sources:

- TV17, §3.1 pp.14–16, character grading and Corollary 3.13, P=N: “root stacks”. The finite quotient chart motivates this calculation. This root-specific cardinality, coordinate or dimension assertion is derived from the actual native comparison and the listed pinned library declarations; it is not a theorem quoted from the paper.


### Dimension of the zero-section kernel

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-kernel-finrank. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.kernel_zero_finrank.

For every field k and n≥1, the actual native kernel submodule ker Θ₀ has k-dimension n(n−1)/2.

Hypotheses:

- A is any commutative ring; n≥1 for root constructions. Cardinality lower_card also admits n=0. Dimension statements explicitly require a field k. No characteristic or invertibility-of-n hypothesis.

Construction or proof:

1. Transport dimension through K₀ to W→k.
2. Use the imported finite-function dimension formula and the root-specific wrapping count.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-kernel-equivalence, FunctionFieldArithmeticPartII:RS.0/affine-torsor-wrapping-card, mathlib:LinearEquiv.finrank_eq, mathlib:Module.finrank_pi.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.kernel_zero_finrank.test_one (degenerate): For every field k, the n=1 kernel has dimension zero.

Acceptance:

- No invertibility-of-n assumption; the complete nilpotent quotient k[x]/(xⁿ) is retained.

Sources:

- TV17, §3.1 pp.14–16, character grading and Corollary 3.13, P=N: “root stacks”. The finite quotient chart motivates this calculation. This root-specific cardinality, coordinate or dimension assertion is derived from the actual native comparison and the listed pinned library declarations; it is not a theorem quoted from the paper.


### Dimension of the zero-section image

Declaration: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-range-finrank. lemma. Native name: TauCeti.RootStack.affineTorsorComparison.range_zero_finrank.

For every field k and n≥1, the actual native range submodule im Θ₀ has k-dimension n(n+1)/2.

Hypotheses:

- A is any commutative ring; n≥1 for root constructions. Cardinality lower_card also admits n=0. Dimension statements explicitly require a field k. No characteristic or invertibility-of-n hypothesis.

Construction or proof:

1. Obtain finite dimensionality of the actual tensor source from its injective coordinate equivalence.
2. Import rank-nullity and substitute the proved source and kernel dimensions.
3. Use evenness of n(n−1) before dividing by two, together with n²=n(n−1)+n. Natural-number truncation is not treated as rational subtraction.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-torsor-zero-kernel-finrank, FunctionFieldArithmeticPartII:RS.0/affine-torsor-source-finrank, mathlib:FiniteDimensional.of_injective, mathlib:LinearMap.finrank_range_add_finrank_ker, mathlib:Nat.two_dvd_mul_sub_one.

Unit tests:

- TauCeti.RootStack.affineTorsorComparison.range_zero_finrank.test_wild (computation): For k=F₃,n=3, the actual native range has dimension six; the field instance uses primality of3.

Acceptance:

- Over F₃ with n=3 the range has dimension six, despite 3 being zero in k.

Sources:

- TV17, §3.1 pp.14–16, character grading and Corollary 3.13, P=N: “root stacks”. The finite quotient chart motivates this calculation. This root-specific cardinality, coordinate or dimension assertion is derived from the actual native comparison and the listed pinned library declarations; it is not a theorem quoted from the paper.

## RS.2 continuation — finite affine transition proofs

For every commutative ring A, parameter f and positive n,m, write B_n=A[t_n]/(t_nⁿ−f). The transition j_(n,m) is the actual A-algebra map t_n↦t_(nm)^m. The iterated algebra D_(n,m)=B_n[U]/(U^m−t_n) is B_n-algebra equivalent to B_(nm), with U↦t_(nm). Its transported basis is indexed by Fin m and has vector t_(nm)^i. The coefficient action is multiplication through j_(n,m). No reducedness, nonzero-ring, invertibility or unit-parameter condition enters this finite algebra.

The composition and exponent-one signatures use the existing canonical equivalence of quotients by equal polynomials. This corrects the inherited dependent casts while keeping the intended equality after the associativity identification. A local coefficient-algebra instance gives the basis projections the exact transition scalar structure; it introduces no new generic algebra or quotient theory. The actual inverse coefficient identity upgrades the inverse lift from an A-algebra map to a B_n-algebra map.

When B_n is nontrivial, import the monic quotient power basis, reindex along nat-degree m and transport through the specified equivalence. When B_n is the zero ring, import the subsingleton module equivalence to its Finsupp coefficients; a zero vector family is a valid indexed basis here. Fin m is nonempty because m>0, so the existing faithfully-flat Finsupp instance and basis coordinates give native faithful flatness. The native free and finite module facts follow from the same basis. The existing finite and flat-and-surjective Spec-map criteria translate this exact ring algebra into a finite, flat, surjective native scheme morphism. This affine step needs no extra supplier; representability of the root-stack transition remains separate.

The preserved nilpotent test sends the nonzero t_2 in k[t]/t² to the nonzero t_4² in k[t]/t⁴. Additional examples cover Z/4Z with f=2, F_2 with f=0, finite/free structures and all four reverse-map tests. These are computations in the native quotient algebras. The primary-source reading is TV17 v2 printed pp12–16, including Proposition 3.2 and §3.1; finite rank-one freeness is the authored P=N specialization, rather than a claim about arbitrary monoid charts. Historical source findings and the separate symplectic route remain unchanged.

### Root of the finite chart transition

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-root. Lemma.

The actual A-algebra map j_(n,m):B_n→B_(nm) sends the distinguished root t_n to t_(nm)^m.

Hypotheses:

- A is any commutative ring; f∈A and n,m are positive natural numbers. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Construction or proof:

1. Evaluate the native quotient lift at its distinguished root; its chosen value is t_(nm)^m.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition, mathlib:AdjoinRoot.liftAlgHom_root.

Acceptance:

- For n=m=2 the root of A[t]/(t²−f) maps to the square of the root of A[t]/(t⁴−f), including f=0.

Source: TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Coefficients of the finite chart transition

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-constant. Lemma.

For every a∈A, j_(n,m)(a in B_n)=a in B_(nm); these are the given coefficient algebra maps.

Hypotheses:

- A is any commutative ring; f∈A and n,m are positive natural numbers. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Construction or proof:

1. Use the native A-algebra homomorphism coefficient law.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition.

Acceptance:

- The coefficient map remains the specified map over nonreduced and zero rings.

Source: TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Reverse map from the larger root chart

Declaration: FunctionFieldArithmeticPartII:RS.2/iterated-reverse. Construction.

Put D_(n,m)=B_n[U]/(U^m−t_n) as the native monic AdjoinRoot quotient with its inherited A-algebra. Construct v_(n,m):B_(nm)→D_(n,m) as an A-algebra homomorphism sending t_(nm) to the actual distinguished root U.

Hypotheses:

- A is any commutative ring; f∈A and n,m are positive natural numbers. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Construction or proof:

1. In D_(n,m), U^m is the image of t_n, so U^(nm)=(U^m)^n is the image of f under the coefficient tower.
2. Apply the native A-algebra quotient lift using that equation. Keep the actual coefficient algebra and the quotient nilpotents.

Inputs: FunctionFieldArithmeticPartII:RS.0/affine-root-relation, mathlib:AdjoinRoot, mathlib:AdjoinRoot.liftAlgHom, mathlib:IsScalarTower.algebraMap_apply.

API uses:

- TV17 §3.1, P=N finite local charts — The reverse lift supplies the specified inverse in the iterated quotient, needed for finite chart freeness.
- FunctionFieldArithmeticPartII:RS.2/affine-transition-iterated — Its coefficient compatibility upgrades the A-algebra map to a B_n-algebra inverse.

API:

- TauCeti.RootStack.affineIteratedReverse.root (simp): v_(n,m)(t_(nm))=U in D_(n,m).
- TauCeti.RootStack.affineIteratedReverse.constant (simp): v_(n,m) sends each a∈A in B_(nm) to its image in D_(n,m).
- TauCeti.RootStack.affineIteratedReverse.coefficient (compatibility): For every b∈B_n, v_(n,m)(j_(n,m)(b)) equals the coefficient image of b in D_(n,m).

Unit tests:

- TauCeti.RootStack.affineIteratedReverse.test_root (computation): Over every field k with f=0 and n=m=2, the reverse map sends t_4 exactly to the distinguished U in B_2[U]/(U²−t_2), fixing its sign as well as its square.
- TauCeti.RootStack.affineIteratedReverse.test_coefficient (computation): For n=m=2, v_(2,2)(t_4²) is the coefficient image of t_2 in B_2[U]/(U²−t_2).
- TauCeti.RootStack.affineIteratedReverse.test_fourth_power (compatibility): For n=m=2, v_(2,2)(t_4⁴) equals the coefficient image of f from A in the iterated quotient.
- TauCeti.RootStack.affineIteratedReverse.test_zeroRing (degenerate): When A is the zero ring, the reverse map sends every element to zero in the actual iterated quotient.

Acceptance:

- This is an actual map of the native quotient algebras for arbitrary A, rather than a map between representative coefficient arrays.

Source: TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Root value of the reverse quotient map

Declaration: FunctionFieldArithmeticPartII:RS.2/iterated-reverse-root. Lemma.

The reverse A-algebra quotient lift v_(n,m) sends t_(nm) to U, the distinguished root of D_(n,m).

Hypotheses:

- A is any commutative ring; f∈A and n,m are positive natural numbers. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Construction or proof:

1. Evaluate the native quotient lift on its actual distinguished root.

Inputs: FunctionFieldArithmeticPartII:RS.2/iterated-reverse, mathlib:AdjoinRoot.liftAlgHom_root.

Acceptance:

- The formula holds at a nilpotent branch fibre; U is not replaced by zero.

Source: TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Coefficient compatibility of the reverse map

Declaration: FunctionFieldArithmeticPartII:RS.2/iterated-reverse-coefficient. Lemma.

For every b∈B_n, v_(n,m)(j_(n,m)(b))=algebraMap(B_n,D_(n,m))(b). Thus v_(n,m) is compatible with the actual B_n coefficient algebra of the transition.

Hypotheses:

- A is any commutative ring; f∈A and n,m are positive natural numbers. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Construction or proof:

1. Compare the composite v_(n,m)∘j_(n,m) with the native coefficient algebra homomorphism B_n→D_(n,m).
2. Both fix A. Their root values are U^m and the coefficient image of t_n, equal by the defining equation of D_(n,m).
3. Native quotient extensionality gives equality of A-algebra homomorphisms; evaluate at b.

Inputs: FunctionFieldArithmeticPartII:RS.2/iterated-reverse, FunctionFieldArithmeticPartII:RS.2/iterated-reverse-root, FunctionFieldArithmeticPartII:RS.2/affine-transition-root, FunctionFieldArithmeticPartII:RS.0/affine-root-relation, mathlib:AdjoinRoot.algHom_ext, mathlib:AdjoinRoot.ofAlgHom.

Acceptance:

- Compatibility is for all coefficients b, not only t_n or field-valued points.

Source: TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Distinguished root under the iterated equivalence

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-iterated-root. Lemma.

The specified B_n-algebra equivalence D_(n,m)≃B_(nm) sends its distinguished root U to t_(nm).

Hypotheses:

- A is any commutative ring; f∈A and n,m are positive natural numbers. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Construction or proof:

1. The forward part of the constructed equivalence is exactly the quotient lift with root value t_(nm).

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-iterated, mathlib:AdjoinRoot.liftAlgHom_root.

Acceptance:

- The resulting basis transport uses this particular root value, not an unspecified algebra equivalence.

Source: TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Vectors of the finite transition basis

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-basis-vector. Lemma.

For i∈Fin m, the specified B_n-basis vector of B_(nm) is exactly t_(nm)^i.

Hypotheses:

- A is any commutative ring; f∈A and n,m are positive natural numbers. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Construction or proof:

1. In the nontrivial B_n branch, evaluate the reindexed native monic power basis and its transport through the iterated equivalence.
2. Use the forward root formula and preservation of powers.
3. In the zero B_n branch, both sides are the unique element; do not invoke a false positive-degree equality.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-basis, FunctionFieldArithmeticPartII:RS.2/affine-transition-iterated-root, mathlib:Module.Basis.map_apply, mathlib:Module.Basis.reindex_apply.

Acceptance:

- At m=1 the sole vector is 1; over the zero ring the indexed basis is still a basis although every vector is zero.

Source: TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Finite transition coefficient reconstruction

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-coordinates. Lemma.

For every b∈B_(nm), its specified basis coordinates c_i∈B_n reconstruct b as ∑_{i∈Fin m} j_(n,m)(c_i)t_(nm)^i.

Hypotheses:

- A is any commutative ring; f∈A and n,m are positive natural numbers. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Construction or proof:

1. Apply the native finite-basis reconstruction theorem.
2. Replace each basis vector by its distinguished-root power and each coefficient scalar action by multiplication through j_(n,m).

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-basis, FunctionFieldArithmeticPartII:RS.2/affine-transition-basis-vector, mathlib:Module.Basis.sum_repr.

Acceptance:

- The scalar action is the transition coefficient algebra, and the coordinates reconstruct every element of the actual quotient.

Source: TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Inverse finite transition coordinates

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-inverse-coordinates. Lemma.

For c∈Fin m→₀B_n, the inverse of the specified coordinate equivalence sends c to ∑_{i∈Fin m} j_(n,m)(c_i)t_(nm)^i.

Hypotheses:

- A is any commutative ring; f∈A and n,m are positive natural numbers. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Construction or proof:

1. Apply the reconstruction identity to the inverse coordinate image and cancel the coordinate equivalence with its inverse.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-basis, FunctionFieldArithmeticPartII:RS.2/affine-transition-coordinates.

Acceptance:

- The inverse formula uses the actual transition coefficient action and full quotient, including the zero ring.

Source: TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

### Finite flat surjective maps of root charts

Declaration: FunctionFieldArithmeticPartII:RS.2/affine-transition-Spec-properties. Theorem.

For the actual ring homomorphism j_(n,m):B_n→B_(nm), the native scheme morphism Spec B_(nm)→Spec B_n is finite, flat and surjective.

Hypotheses:

- A is any commutative ring; f∈A and n,m are positive natural numbers. No reducedness, Noetherian, unit-parameter or invertibility-of-exponent hypothesis is imposed.

Construction or proof:

1. Apply the existing finite Spec-map equivalence to the exact ring map; its induced coefficient algebra is the transition algebra and the finite basis supplies Module.Finite.
2. Apply the existing flat-and-surjective Spec-map equivalence to the same ring map; its RingHom.FaithfullyFlat definition is precisely the checked Module.FaithfullyFlat result.

Inputs: FunctionFieldArithmeticPartII:RS.2/affine-transition-basis, FunctionFieldArithmeticPartII:RS.2/affine-transition-faithfully-flat, mathlib:Module.Finite.of_basis, mathlib:RingHom.Finite, mathlib:RingHom.FaithfullyFlat, mathlib:AlgebraicGeometry.IsFinite.SpecMap_iff, mathlib:AlgebraicGeometry.flat_and_surjective_SpecMap_iff.

Unit tests:

- TauCeti.RootStack.affineTransitionSpecProperties.test_wild (non-example): Over F_2 with f=0 and n=m=2, the actual nonreduced root-chart Spec map is finite, flat and surjective without an invertible exponent.

Acceptance:

- No extra geometric supplier is needed for the affine Spec translation already in Mathlib. This gives no representability statement about the corresponding root-stack transition.

Source: TV17, Section3.1 pp.14–16, P=N specialization. Root-specific specialization and proof derivation using the stated source construction and the listed native baseline declarations; not a claim that the paper literally states every algebraic comparison below.

The existing finite transition APIs gain TauCeti.RootStack.affineTransition.coefficientAlgebra: Use j_(n,m) as the coefficient map for the B_n-algebra structure on B_(nm); retain the original A-algebra and its compatible coefficient tower.

- TauCeti.RootStack.affineTransitionIterated.root (simp): The iterated quotient equivalence sends U to t_(nm).
- TauCeti.RootStack.affineTransitionIterated.coefficient (compatibility): For every b∈B_n, the iterated quotient equivalence sends its coefficient image to j_(n,m)(b).

Additional finite-basis tests:

- TauCeti.RootStack.affineTransitionBasis.test_nonreduced (non-example): For A=Z/4Z and f=2, the actual B_2→B_4 coefficient map is faithfully flat despite the nonreduced base and nilpotent parameter.
- TauCeti.RootStack.affineTransitionBasis.test_wild (non-example): For A=F_2 and f=0, the actual B_2→B_4 coefficient map is faithfully flat without invertibility of either exponent.
- TauCeti.RootStack.affineTransitionBasis.test_finite_free (compatibility): For arbitrary A,f and positive n,m, the specified finite basis gives both native Module.Free and Module.Finite structures on B_(nm) over B_n.

All ten stages remain partial, with the same eight gaps and thirteen supplier requests. Suggested bodies remain admitted and implementation statuses remain unchecked. Separate native proofs are archived and reproducible in the handoff; the complete geometric file is not compiled because its exact-pin Tau Ceti imports are unavailable.

## Universal factorial coaction and the unity-root Hopf algebra

This continuation is a rank-one algebraic construction on the actual inherited colimit, not an assertion of the geometric quotient theorem. Compatible roots determine the algebra maps.

The notation is d_i=(i+1)!, C_A(f) for the actual factorial chart colimit, u_i its roots, H_A=C_A(1), and h_i its unity roots. The inherited subgroup S(B) consists of coherent unit-valued families. All coefficient rings may be zero or nonreduced; test A-algebras share the chosen universe. The tensor products and algebra maps are native pinned library objects. The bialgebra and Hopf structures are local specializations of Mathlib's existing factories, never a second generic theory.

The map ρ_f is obtained from the compatible pairs h_i⊗u_i. The d_i-th powers are 1⊗f, and the transition powers agree in the actual tensor algebra. Its two iterates become h_i⊗(h_i⊗u_i) after the native associator. The augmentation evaluates every h_i at1; the antipode evaluates at the inverse universal unit family. Unit cancellation proves involutivity. Evaluating these universal coordinates in B gives an actual equivalence of algebra points with S(B), natural for every A-algebra map B→C in the fixed universe. Specializing the coaction at σ∈S(A) recovers the already constructed scaling map.

Talpo–Vistoli, §3.1 pp.14–16 motivates the Cartier-dual grading action; these exact rank-one formulas and native constructions are authored deductions. The fresh reading and byte hash are separate from inherited full-paper receipts. The canonical diagonalizable Hopf-algebra identification, convolution group comparison, geometric Spec construction and fpqc quotient are not consequences claimed here.

### Universal coaction on the actual factorial chart

Construct the A-algebra map ρ_f:C_A(f)→H_A⊗_A C_A(f), with H_A=C_A(1), sending u_i to h_i⊗u_i and a to 1⊗a.

Declaration: `TauCeti.RootStack.factorialCoaction`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-power`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-root`, `mathlib:Algebra.TensorProduct.tmul_pow`, `mathlib:Algebra.TensorProduct.includeRight`.

Proof outline: The pair h_i⊗u_i has d_i-th power 1⊗f; tensor balancing identifies this with the coefficient image in the tensor algebra. The inherited transition powers identify the pairs at i≤j. Apply the actual compatible-root lift.

API:

- `TauCeti.RootStack.factorialCoaction.root` (simp): For every i, ρ_f(u_i)=h_i⊗u_i.
- `TauCeti.RootStack.factorialCoaction.constant` (simp): For every a∈A, ρ_f(a)=1⊗a, with coefficients mapped into the actual chart ring.
- `TauCeti.RootStack.factorialCoaction.counit` (compatibility): After the native left unitor, (ε_A⊗id)∘ρ_f is the identity A-algebra endomorphism of C_A(f).
- `TauCeti.RootStack.factorialCoaction.coassoc` (compatibility): Writing Δ_A=ρ_1, the equality α∘(Δ_A⊗id)∘ρ_f=(id⊗ρ_f)∘ρ_f holds as A-algebra maps into H_A⊗_A(H_A⊗_A C_A(f)).
- `TauCeti.RootStack.factorialCoaction.specialization` (compatibility): For every σ∈S(A), multiplication after (coefficient-inclusion∘E_σ)⊗id, composed with ρ_f, equals the actual inherited scaling map s_σ:C_A(f)→C_A(f).
- `TauCeti.RootStack.factorialCoaction.injective` (compatibility): ρ_f is injective for every f∈A, without reducedness or nontriviality assumptions.

Tests:

- `factorialCoactionTests.degree_two` (computation): Over Z/4Z with f=2, the degree-two root maps to the degree-two unity root tensored with the chart root.
- `factorialCoactionTests.coefficient_two` (computation): Over Z/4Z with f=0, coefficient2 maps to 1 tensored with coefficient2.
- `factorialCoactionTests.zero_ring` (degenerate): Over Z/1Z with f=0, the coaction sends0 to0.
- `factorialCoactionTests.wild_nonzero` (computation): Over Z/2Z with f=0, the coaction image of the degree-two root is nonzero; the counit left inverse and monic-quotient basis discriminate against a collapsed action.
- `factorialCoactionTests.wild_square_zero` (computation): That characteristic-two coaction image has square0, retaining its nilpotent rather than replacing it by a field-valued point.

### Root-coordinate formula for the universal coaction

For every i, ρ_f(u_i)=h_i⊗u_i.

Declaration: `TauCeti.RootStack.factorialCoaction.root`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift-root`.

Proof outline: Evaluate the inherited compatible-root lift on its distinguished root.

### Coefficient formula for the universal coaction

For every a∈A, ρ_f(a)=1⊗a, with coefficients mapped into the actual chart ring.

Declaration: `TauCeti.RootStack.factorialCoaction.constant`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-constant`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction`, `mathlib:Algebra.TensorProduct.includeRight`.

Proof outline: Use the algebra-map coefficient law and the actual right-factor inclusion coefficient law.

### Augmentation of the factorial unity-root algebra

Construct ε_A:H_A→A as an A-algebra map sending every h_i to 1.

Declaration: `TauCeti.RootStack.factorialCounit`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift`.

Proof outline: The constant family 1 satisfies all finite orders and transition powers. Apply the actual compatible-root lift at f=1.

API:

- `TauCeti.RootStack.factorialCounit.root` (simp): For every i, ε_A(h_i)=1.
- `TauCeti.RootStack.factorialCounit.constant` (simp): For every a∈A, ε_A(algebraMap_A(a))=a.
- `TauCeti.RootStack.factorialCounit.surjective` (compatibility): The ring map ε_A:H_A→A is surjective, including for the zero ring.

Tests:

- `factorialCounitTests.degree_two` (computation): Over Z/4Z the degree-two unity root has counit1.
- `factorialCounitTests.coefficient_two` (computation): Over Z/4Z the counit fixes coefficient2.
- `factorialCounitTests.zero_ring` (degenerate): Over Z/1Z the counit sends0 to0.

### Counit on every factorial root

For every i, ε_A(h_i)=1.

Declaration: `TauCeti.RootStack.factorialCounit.root`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-root`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift-root`.

Proof outline: Evaluate the compatible-root lift on its distinguished root.

### Counit fixes coefficients

For every a∈A, ε_A(algebraMap_A(a))=a.

Declaration: `TauCeti.RootStack.factorialCounit.constant`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-constant`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit`.

Proof outline: Use the native algebra-homomorphism coefficient law.

### Surjectivity of the actual augmentation

The ring map ε_A:H_A→A is surjective, including for the zero ring.

Declaration: `TauCeti.RootStack.factorialCounit.surjective`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-surjective`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-constant`.

Proof outline: A coefficient a is the image of its actual coefficient insertion.

### Counitality of the chart coaction

After the native left unitor, (ε_A⊗id)∘ρ_f is the identity A-algebra endomorphism of C_A(f).

Declaration: `TauCeti.RootStack.factorialCoaction.counit`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-counit`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-root`, `mathlib:Algebra.TensorProduct.map`, `mathlib:Algebra.TensorProduct.lid`.

Proof outline: Use actual colimit hom extensionality. On u_i the composite is the left-unitor image of 1⊗u_i, namely u_i.

### Coassociativity with the native tensor associator

Writing Δ_A=ρ_1, the equality α∘(Δ_A⊗id)∘ρ_f=(id⊗ρ_f)∘ρ_f holds as A-algebra maps into H_A⊗_A(H_A⊗_A C_A(f)).

Declaration: `TauCeti.RootStack.factorialCoaction.coassoc`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-coassoc`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `mathlib:DirectLimit.Algebra.hom_ext`, `mathlib:AdjoinRoot.algHom_ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `mathlib:Algebra.TensorProduct.map`, `mathlib:Algebra.TensorProduct.assoc`.

Proof outline: Use native direct-limit algebra extensionality followed by finite AdjoinRoot algebra extensionality. Both root images become h_i⊗(h_i⊗u_i), using the actual tensor map and associator formulas. This avoids assuming a different module-instance path is definitionally identical.

### Right counit of the unity-root comultiplication

After the native right unitor, (id⊗ε_A)∘Δ_A is the identity A-algebra endomorphism of H_A.

Declaration: `TauCeti.RootStack.factorialCoaction.right_counit`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-right-counit`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-root`, `mathlib:Algebra.TensorProduct.map`, `mathlib:Algebra.TensorProduct.rid`.

Proof outline: Apply actual colimit root extensionality. The root image is the right-unitor image of h_i⊗1.

### Cocommutativity of the unity-root comultiplication

The native tensor symmetry carries Δ_A to Δ_A.

Declaration: `TauCeti.RootStack.factorialCoaction.cocomm`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-cocommutativity`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `mathlib:Algebra.TensorProduct.comm`.

Proof outline: Apply actual colimit root extensionality. Tensor symmetry fixes h_i⊗h_i.

### Inversion of the unity-root algebra

Construct S_A:H_A→H_A as an A-algebra map sending h_i to the underlying ring value of the inverse of the i-th universal coherent unit.

Declaration: `TauCeti.RootStack.factorialAntipode`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars-power`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars-transition`.

Proof outline: Invert the actual universal coherent scalar family in its native subgroup; its finite-order and transition identities satisfy the compatible-root lift at f=1.

API:

- `TauCeti.RootStack.factorialAntipode.root` (simp): For every i, S_A(h_i) is the ring value of (σ_i^univ)⁻¹.
- `TauCeti.RootStack.factorialAntipode.left_inverse` (compatibility): Multiplication after (S_A⊗id)∘Δ_A equals the coefficient inclusion composed with ε_A, as native A-algebra maps H_A→H_A.
- `TauCeti.RootStack.factorialAntipode.right_inverse` (compatibility): Multiplication after (id⊗S_A)∘Δ_A equals the coefficient inclusion composed with ε_A, as native A-algebra maps H_A→H_A.
- `TauCeti.RootStack.factorialAntipode.involutive` (compatibility): S_A∘S_A=id_H_A as A-algebra maps.

Tests:

- `factorialAntipodeTests.inverse_root` (computation): For every A, the antipode image of the degree-two unity root multiplied by that root is1.
- `factorialAntipodeTests.involutive` (compatibility): For every element of H_A, applying the actual antipode twice returns that element.
- `factorialAntipodeTests.zero_ring` (degenerate): Over Z/1Z the antipode sends0 to0.

### Inverse root-coordinate formula

For every i, S_A(h_i) is the ring value of (σ_i^univ)⁻¹.

Declaration: `TauCeti.RootStack.factorialAntipode.root`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-root`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift-root`.

Proof outline: Evaluate the compatible-root lift.

### Left convolution inverse law

Multiplication after (S_A⊗id)∘Δ_A equals the coefficient inclusion composed with ε_A, as native A-algebra maps H_A→H_A.

Declaration: `TauCeti.RootStack.factorialAntipode.left_inverse`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-left-inverse`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars-value`, `mathlib:Algebra.TensorProduct.lift`, `mathlib:Units.inv_mul`.

Proof outline: Apply actual colimit root extensionality and the tensor-lift pure-tensor formula. The root product is (σ_i^univ)⁻¹σ_i^univ=1, by the native unit law.

### Right convolution inverse law

Multiplication after (id⊗S_A)∘Δ_A equals the coefficient inclusion composed with ε_A, as native A-algebra maps H_A→H_A.

Declaration: `TauCeti.RootStack.factorialAntipode.right_inverse`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-right-inverse`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars-value`, `mathlib:Algebra.TensorProduct.lift`, `mathlib:Units.mul_inv`.

Proof outline: Apply actual colimit root extensionality and the tensor-lift formula. The root product is σ_i^univ(σ_i^univ)⁻¹=1.

### Involutivity of the actual antipode

S_A∘S_A=id_H_A as A-algebra maps.

Declaration: `TauCeti.RootStack.factorialAntipode.involutive`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-involutive`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-right-inverse`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars`, `mathlib:Algebra.TensorProduct.lift`, `mathlib:IsUnit.map`, `mathlib:IsUnit.mul_left_cancel`.

Proof outline: Evaluate the right convolution inverse identity at h_i and apply S_A to the product-one identity. The universal root is a unit, and its image under S_A is a unit by IsUnit.map. Cancel this image using the native unit cancellation lemma and commutativity; then apply colimit root extensionality.

### Evaluation at a coherent family over a test algebra

For every commutative A-algebra B in the fixed universe and σ∈S(B), construct E_σ:H_A→B as an A-algebra map sending h_i to the underlying ring value of σ_i.

Declaration: `TauCeti.RootStack.factorialScalarEvaluation`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars-power`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scalars-transition`.

Proof outline: The finite-order equations and coherent powers of σ supply the actual compatible-root lift at f=1. The coefficient image of 1 is 1.

API:

- `TauCeti.RootStack.factorialScalarEvaluation.root` (simp): For every i, E_σ(h_i)=σ_i in B.
- `TauCeti.RootStack.factorialScalarEvaluation.constant` (simp): For every a∈A, E_σ(algebraMap_A(a))=algebraMap_A,B(a).
- `TauCeti.RootStack.factorialScalarEvaluation.universal` (compatibility): For B=H_A and σ=σ^univ, E_σ=id_H_A as A-algebra maps.

Tests:

- `factorialScalarEvaluationTests.universal` (computation): Evaluating the degree-two unity root at the actual universal scalar family returns that root.
- `factorialScalarEvaluationTests.identity_scalar` (degenerate): Evaluating that root at the identity coherent scalar family over A gives1.
- `factorialScalarEvaluationTests.coefficient_two` (computation): Over Z/4Z evaluation at the identity family sends coefficient2 to2.

### Evaluation of a universal root

For every i, E_σ(h_i)=σ_i in B.

Declaration: `TauCeti.RootStack.factorialScalarEvaluation.root`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation-root`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift-root`.

Proof outline: Evaluate the inherited root lift.

### Evaluation of coefficients in a test algebra

For every a∈A, E_σ(algebraMap_A(a))=algebraMap_A,B(a).

Declaration: `TauCeti.RootStack.factorialScalarEvaluation.constant`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation-constant`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation`.

Proof outline: Apply the actual algebra-homomorphism coefficient law.

### Evaluation at the actual universal family

For B=H_A and σ=σ^univ, E_σ=id_H_A as A-algebra maps.

Declaration: `TauCeti.RootStack.factorialScalarEvaluation.universal`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation-universal`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars-value`.

Proof outline: Apply actual colimit root extensionality and the universal scalar root-value formula.

### Representation of coherent factorial unit families

Construct an equivalence Hom_A-alg(H_A,B)≃S(B) for each commutative A-algebra B in the fixed universe; the forward map evaluates the universal coherent unit family and the inverse is E_σ.

Declaration: `TauCeti.RootStack.factorialScalarPoints`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-map`, `FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-value`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars-value`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `mathlib:Units.val_injective`.

Proof outline: Map the actual universal unit family by the underlying ring homomorphism p. Evaluation followed by reconstruction agrees on every actual root, hence agrees by colimit root extensionality. Reconstruction followed by evaluation agrees on the ring value of each unit, hence agrees by Units.val_injective and function/subtype extensionality.

API:

- `TauCeti.RootStack.factorialScalarPoints.value` (compatibility): The underlying ring value of the i-th unit of the represented family of p is p(h_i).
- `TauCeti.RootStack.factorialScalarPoints.naturality` (functoriality): For every A-algebra map k:B→C, the family represented by k∘p equals S(k)(the family represented by p).
- `TauCeti.RootStack.factorialScalarPoints.left_inverse` (compatibility): For every p:H_A→B, evaluating at its represented coherent family reconstructs p exactly.
- `TauCeti.RootStack.factorialScalarPoints.right_inverse` (compatibility): For every σ∈S(B), the family represented by E_σ is σ.

Tests:

- `factorialScalarPointsTests.left_inverse` (compatibility): Every A-algebra point H_A→A is exactly reconstructed by evaluation at its represented family.
- `factorialScalarPointsTests.right_inverse` (degenerate): Over the zero test ring Z/1Z, evaluation and representation recover each coherent unit family.
- `factorialScalarPointsTests.universal` (computation): The identity algebra map on H_A represents the actual universal coherent unit family.

### Coordinate of a represented test-algebra point

The underlying ring value of the i-th unit of the represented family of p is p(h_i).

Declaration: `TauCeti.RootStack.factorialScalarPoints.value`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-value`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points`, `FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-value`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars-value`.

Proof outline: Unfold the equivalence forward map and use the mapped-unit and universal root-value formulas.

### Naturality in every test-algebra homomorphism

For every A-algebra map k:B→C, the family represented by k∘p equals S(k)(the family represented by p).

Declaration: `TauCeti.RootStack.factorialScalarPoints.naturality`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-naturality`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-value`, `FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-value`, `mathlib:Units.val_injective`.

Proof outline: Compare underlying values of the actual units using Units.val_injective, the point-coordinate formula and mapped-unit formula. Both give k(p(h_i)); function and subtype extensionality finish.

### Reconstruction of an algebra point

For every p:H_A→B, evaluating at its represented coherent family reconstructs p exactly.

Declaration: `TauCeti.RootStack.factorialScalarPoints.left_inverse`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-left-inverse`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points`.

Proof outline: Apply the inverse identity of the constructed native equivalence.

### Recovery of a coherent unit family

For every σ∈S(B), the family represented by E_σ is σ.

Declaration: `TauCeti.RootStack.factorialScalarPoints.right_inverse`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-right-inverse`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points`.

Proof outline: Apply the other inverse identity of the constructed native equivalence.

### Recovery of the existing coherent scaling map

For every σ∈S(A), multiplication after (coefficient-inclusion∘E_σ)⊗id, composed with ρ_f, equals the actual inherited scaling map s_σ:C_A(f)→C_A(f).

Declaration: `TauCeti.RootStack.factorialCoaction.specialization`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-specialization`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-root`, `mathlib:Algebra.TensorProduct.lift`.

Proof outline: Apply actual colimit root extensionality. Both maps send u_i to algebraMap_A(σ_i)·u_i, by the coaction, tensor-lift, evaluation and inherited scaling root formulas.

### Injectivity of the chart coaction

ρ_f is injective for every f∈A, without reducedness or nontriviality assumptions.

Declaration: `TauCeti.RootStack.factorialCoaction.injective`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-injective`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-counit`.

Proof outline: The left-unitor/counit composite is an actual left inverse. Apply it to an equality of coaction images and use the proved counit identity on both elements.

### Native bialgebra on the factorial unity-root algebra

Construct a native Bialgebra A H_A whose comultiplication is Δ_A and whose counit is ε_A, retaining the existing coefficient algebra structure.

Declaration: `TauCeti.RootStack.factorialBialgebra`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-coassoc`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`, `mathlib:Bialgebra.ofAlgHom`, `mathlib:Algebra.TensorProduct.lid`, `mathlib:Algebra.TensorProduct.rid`.

Proof outline: Use the existing Bialgebra.ofAlgHom factory with the proved coassociativity law. For its two pre-unitor counit equalities use actual colimit root extensionality: the images are 1⊗h_i and h_i⊗1 respectively. Native inverse-unitor formulas are exactly these pure tensors. This is a specialization of the existing bialgebra interface, not a new generic bialgebra theory.

API:

- `TauCeti.RootStack.factorialBialgebra.comul` (compatibility): With the constructed local bialgebra instance, its native comulAlgHom is exactly Δ_A.
- `TauCeti.RootStack.factorialBialgebra.counit` (compatibility): With the constructed local bialgebra instance, its native counitAlgHom is exactly ε_A.
- `TauCeti.RootStack.factorialCoaction.cocomm` (compatibility): The native tensor symmetry carries Δ_A to Δ_A.

Tests:

- `factorialBialgebraTests.comul_root` (computation): The native constructed bialgebra over Z/4Z sends the degree-two root under comultiplication to its self tensor.
- `factorialBialgebraTests.counit_root` (computation): The native constructed bialgebra over Z/2Z sends the degree-two root under its counit to1.
- `factorialBialgebraTests.zero_ring` (degenerate): The native constructed bialgebra over Z/1Z sends0 under comultiplication to0.

### Comultiplication of the constructed native bialgebra

With the constructed local bialgebra instance, its native comulAlgHom is exactly Δ_A.

Declaration: `TauCeti.RootStack.factorialBialgebra.comul`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra-comul`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra`, `mathlib:Bialgebra.comulAlgHom`.

Proof outline: Unfold the existing factory's comultiplication projection; equality is definitional.

### Counit of the constructed native bialgebra

With the constructed local bialgebra instance, its native counitAlgHom is exactly ε_A.

Declaration: `TauCeti.RootStack.factorialBialgebra.counit`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra-counit`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra`, `mathlib:Bialgebra.counitAlgHom`.

Proof outline: Unfold the existing factory's counit projection; equality is definitional.

### Native Hopf algebra on the factorial unity-root algebra

Under the constructed native bialgebra instance, construct HopfAlgebra A H_A with antipode S_A.

Declaration: `TauCeti.RootStack.factorialHopfAlgebra`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-hopf-algebra`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra-comul`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra-counit`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-left-inverse`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-right-inverse`, `mathlib:HopfAlgebra.ofAlgHom`.

Proof outline: Use the existing HopfAlgebra.ofAlgHom factory. The actual bialgebra projections identify the required convolution-inverse identities with the already proved left and right antipode identities. No generic Hopf algebra or group-scheme infrastructure is redefined.

API:

- `TauCeti.RootStack.factorialHopfAlgebra.antipode` (compatibility): With the constructed local bialgebra and Hopf algebra instances, its native antipode linear map is the underlying A-linear map of S_A.
- `TauCeti.RootStack.factorialAntipode.left_inverse` (compatibility): Multiplication after (S_A⊗id)∘Δ_A equals the coefficient inclusion composed with ε_A, as native A-algebra maps H_A→H_A.
- `TauCeti.RootStack.factorialAntipode.right_inverse` (compatibility): Multiplication after (id⊗S_A)∘Δ_A equals the coefficient inclusion composed with ε_A, as native A-algebra maps H_A→H_A.
- `TauCeti.RootStack.factorialAntipode.involutive` (compatibility): S_A∘S_A=id_H_A as A-algebra maps.

Tests:

- `factorialHopfAlgebraTests.inverse_root` (computation): The actual native Hopf antipode of the degree-two unity root multiplies with that root to1.
- `factorialHopfAlgebraTests.involutive` (compatibility): The actual native Hopf antipode applied twice fixes every element of H_A.
- `factorialHopfAlgebraTests.zero_ring` (degenerate): The actual native Hopf antipode over Z/1Z sends0 to0.

### Antipode of the constructed native Hopf algebra

With the constructed local bialgebra and Hopf algebra instances, its native antipode linear map is the underlying A-linear map of S_A.

Declaration: `TauCeti.RootStack.factorialHopfAlgebra.antipode`. Node: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-hopf-algebra-antipode`.

A is an arbitrary commutative ring, f∈A, and B,C are arbitrary commutative A-algebras in the same fixed universe; k:B→C is an A-algebra homomorphism when used. Zero rings, torsion coefficients and nonreduced fibres are retained. No domain, characteristic-zero, invertibility-of-orders, reducedness or Noetherian assumption is made. Use the actual inherited factorial chart colimit C_A(f), with d_i=(i+1)!, roots u_i and u_i^(d_i)=f. Put H_A=C_A(1) with roots h_i and actual universal coherent unit family σ^univ. S(B) is the inherited native subgroup of coherent B-unit families. Tensor products, unitors, associator, tensor symmetry and algebra homomorphisms are the pinned native interfaces. The native bialgebra and Hopf algebra structures are installed only locally. Representation here is an equivalence of algebra-valued points in the fixed universe; its convolution-group comparison, identification with the diagonalizable group algebra A[Q/Z], higher-universe transport, geometric Spec construction and fpqc quotient remain separate obligations.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-hopf-algebra`.

Proof outline: Unfold the existing Hopf algebra factory's antipode projection; equality is definitional.

### Remaining boundary

The universal factorial algebra coaction, native bialgebra/Hopf structures and fixed-universe natural equivalence of algebra-valued points with coherent unit families now have explicit signatures and separate no-admission native evidence. Identify H_A with the canonical diagonalizable coordinate Hopf algebra A[Q/Z] and its convolution group of points; transport the coaction through the full positive-divisibility equivalence; prove coefficient-base-change/coaction compatibility and higher-universe adapters; construct coherent root-object groupoid reindexing, affine Spec limits, fpqc frame torsors and the infinite quotient comparison. Preserve TOWER-AFF, KUMMER-FINITE, TOWER-TYPING, DVR/Kummer, the all-roots-of2 non-fppf counterexample and both Yun–Zhang and symplectic source routes. No stage or implementation closes.

All incoming node contracts, reserved key, both source routes, planets, requests, gaps and historical source/error receipts remain. The only existing node extension is the downstream infinite-quotient input/proof continuation. Every implementation status stays unchecked; all ten stages remain partial.


## RS.2 continuation: coefficient naturality of the universal factorial coaction

Let A,B,C be arbitrary commutative rings in a common fixed universe, φ:A→B and ψ:B→C arbitrary ring homomorphisms, and f∈A. Retain the actual factorial colimits C_A(f), orders d_i=(i+1)!, roots u_i, unity-root algebra H_A=C_A(1) with roots h_i, universal coherent unit family σ_A, inherited coefficient map F_(φ,f), and universal coaction ρ_f, counit ε_A and antipode S_A. No reducedness, domain, characteristic-zero, invertibility-of-orders, flatness or nontriviality assumption enters.

Coefficient maps carry coherent roots to coherent roots.

The target unity-root algebra is literally H_B: the specialized compatible-root lift uses h_i^B and φ(1)=1. This avoids exposing a chosen dependent cast from C_B(φ(1)) to C_B(1). The existing generic coefficient lift remains the only general chart coefficient construction. The tensor coefficient map is the pinned existing heterobasic native mapRingHom, specialized with these two factor maps and their coefficient squares. It is a ring homomorphism between tensors over different bases. Calling it an A-algebra map with an unchanged coefficient algebra would give the wrong interface.

On coefficients the two coaction composites agree with ι_B∘φ. On every actual root u_i, both give h_i^B⊗u_i^(φ(f)). Native semilinear colimit extensionality therefore proves equality on all elements. The counit square sends each h_i to1. For the antipode square, first prove equality of the actual universal coherent unit families after coefficient mapping, then apply inversion and ring-value evaluation; this supplies the inverse-root equality required by the same colimit extensionality argument. Tensor identity follows by native tensor induction, and composition follows by equality on the two factor inclusions.

Fresh source context is Talpo–Vistoli v2 §3.1, complete printed/PDF pp.14–16: Cartier duals, grading-equivariant projections and the affine quotient passage. The coefficient identities here are authored deductions from the actual inherited colimit and the pinned native tensor map. They do not constitute the paper’s geometric quotient comparison. PDF SHA-256:92a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2; selected passage read2026-10-03.

### Coefficient map on the unity-root algebra

TauCeti.RootStack.factorialUnitCoefficientMap. For any coefficient homomorphism φ:A→B, construct the actual ring homomorphism U_φ:H_A→H_B, where H_A=C_A(1), sending every factorial unity root h_i^A to h_i^B and every coefficient a to φ(a). Its target is H_B itself, so no chosen cast from C_B(φ(1)) is exposed to consumers.

Restrict the target coefficient algebra through φ. Apply the actual factorial compatible-root lift with the target unity roots; their power relation follows from φ(1)=1 and their transition relation is the inherited chart relation. This specializes the existing coefficient lift with a literal unity target, without rebuilding the general construction.

API:

- TauCeti.RootStack.factorialUnitCoefficientMap.root: For every i≥0, U_φ(h_i^A)=h_i^B in the actual factorial colimit H_B.
- TauCeti.RootStack.factorialUnitCoefficientMap.constant: For every a∈A, U_φ(ι_A(a))=ι_B(φ(a)), with the existing native coefficient inclusions.
- TauCeti.RootStack.factorialUnitCoefficientMap.id: U_id is the identity ring homomorphism of H_A.
- TauCeti.RootStack.factorialUnitCoefficientMap.comp: For any ψ:B→C, U_(ψ∘φ)=U_ψ∘U_φ as actual ring homomorphisms H_A→H_C.
- TauCeti.RootStack.factorialUnitCoefficientMap.universal_scalars: Mapping the actual universal coherent unit family σ_A through U_φ gives exactly σ_B as an equality in the inherited subgroup of coherent H_B-unit families.
- TauCeti.RootStack.factorialUnitCoefficientMap.inverse_value: For every i, U_φ applied to the ring value of the i-th inverse unit of σ_A is the ring value of the i-th inverse unit of σ_B.

Acceptance tests:

- coefficientUnitTests.reduction_two: The actual unity coefficient map for ℤ→Z/2Z sends the coefficient 2 to 0.
- coefficientUnitTests.identity: The identity coefficient map fixes every element of H_A.
- coefficientUnitTests.composition: Successive coefficient maps agree with the map for the composite on every element of H_A.
- coefficientUnitTests.zero_ring: The unity coefficient map for ℤ→Z/1Z sends 1 to 0 in the actual target algebra.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift, FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift-root, FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-map, FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-power, FunctionFieldArithmeticPartII:RS.2/factorial-affine-inclusion-root.

### Root

TauCeti.RootStack.factorialUnitCoefficientMap.root. For every i≥0, U_φ(h_i^A)=h_i^B in the actual factorial colimit H_B.

Use the native compatible-root lift evaluation on every actual chart root.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-map, FunctionFieldArithmeticPartII:RS.2/factorial-affine-root-lift-root.

### Constant

TauCeti.RootStack.factorialUnitCoefficientMap.constant. For every a∈A, U_φ(ι_A(a))=ι_B(φ(a)), with the existing native coefficient inclusions.

Use the root lift’s algebra-homomorphism coefficient compatibility in the restricted target coefficient algebra.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-map.

### Id

TauCeti.RootStack.factorialUnitCoefficientMap.id. U_id is the identity ring homomorphism of H_A.

Apply the existing semilinear factorial-colimit ring-homomorphism extensionality theorem. Coefficients agree by the unity coefficient formula, and every chart root agrees by the unity root formula.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-root, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-constant, FunctionFieldArithmeticPartII:RS.2/factorial-semilinear-ringhom-ext.

### Comp

TauCeti.RootStack.factorialUnitCoefficientMap.comp. For any ψ:B→C, U_(ψ∘φ)=U_ψ∘U_φ as actual ring homomorphisms H_A→H_C.

Apply the existing semilinear factorial-colimit ring-homomorphism extensionality theorem. Coefficients agree by the unity coefficient formula, and every chart root agrees by the unity root formula.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-root, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-constant, FunctionFieldArithmeticPartII:RS.2/factorial-semilinear-ringhom-ext.

### Counit compatibility with coefficient change

TauCeti.RootStack.factorialCounit.coefficient_naturality. The actual counits satisfy ε_B∘U_φ=φ∘ε_A as ring homomorphisms H_A→B.

Apply the same semilinear colimit extensionality theorem. On coefficients both composites evaluate to φ(a); on every unity root both evaluate to 1 by the counit root formula and unity root formula.

Acceptance tests:

- coefficientCounitTests.square: For arbitrary x∈H_A, applying ε_B after U_φ agrees with applying φ after ε_A.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-root, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-constant, FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit, FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-root, FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-constant, FunctionFieldArithmeticPartII:RS.2/factorial-semilinear-ringhom-ext.

### Coefficient map on the coaction tensor algebra

TauCeti.RootStack.factorialTensorCoefficientMap. Construct the actual ring homomorphism T_(φ,f):H_A⊗_A C_A(f)→H_B⊗_B C_B(φ(f)), using the existing native heterobasic tensor map on U_φ and the inherited coefficient map F_(φ,f). Both coefficient compatibility witnesses are proved from their coefficient formulas; the generic tensor construction is imported.

Apply the existing heterobasic tensor ring-homomorphism constructor to φ, U_φ and F_(φ,f); prove its two coefficient squares using the unity and chart coefficient formulas.

API:

- TauCeti.RootStack.factorialTensorCoefficientMap.tmul: For every h∈H_A and x∈C_A(f), T_(φ,f)(h⊗x)=U_φ(h)⊗F_(φ,f)(x).
- TauCeti.RootStack.factorialTensorCoefficientMap.constant: For every a∈A, T_(φ,f)(ι_A(a))=ι_B(φ(a)) in H_B⊗_B C_B(φ(f)).
- TauCeti.RootStack.factorialTensorCoefficientMap.root: For every i, T_(φ,f)(h_i^A⊗u_i^f)=h_i^B⊗u_i^(φ(f)) in the actual target tensor algebra.
- TauCeti.RootStack.factorialTensorCoefficientMap.id: T_(id,f) is the identity ring homomorphism on H_A⊗_A C_A(f).
- TauCeti.RootStack.factorialTensorCoefficientMap.comp: For any ψ:B→C, T_(ψ∘φ,f)=T_(ψ,φ(f))∘T_(φ,f) as actual ring homomorphisms into H_C⊗_C C_C(ψ(φ(f))).

Acceptance tests:

- coefficientTensorTests.degree_two: The actual tensor coefficient map sends the degree-two pure root tensor to the target degree-two pure root tensor.
- coefficientTensorTests.reduction_two: The actual tensor coefficient map for ℤ→Z/2Z and f=0 sends the coefficient 2 to 0.
- coefficientTensorTests.identity: The identity tensor coefficient map fixes every element of H_A⊗_A C_A(f).
- coefficientTensorTests.composition: Successive tensor coefficient maps agree with the map for the composite on every element of the actual source tensor algebra.
- coefficientTensorTests.zero_ring: The tensor coefficient map for ℤ→Z/1Z and f=0 sends 1 to 0 in the actual target tensor algebra.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-constant, FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-map, FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-constant, mathlib:Algebra.TensorProduct.mapRingHom.

### Tmul

TauCeti.RootStack.factorialTensorCoefficientMap.tmul. For every h∈H_A and x∈C_A(f), T_(φ,f)(h⊗x)=U_φ(h)⊗F_(φ,f)(x).

Specialize the existing native mapRingHom_tmul statement; no tensor carrier or universal property is replanned.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-tensor-map, mathlib:Algebra.TensorProduct.mapRingHom_tmul.

### Constant

TauCeti.RootStack.factorialTensorCoefficientMap.constant. For every a∈A, T_(φ,f)(ι_A(a))=ι_B(φ(a)) in H_B⊗_B C_B(φ(f)).

Write the tensor coefficient as a pure tensor, apply the pure-tensor formula and the unity coefficient formula, and use preservation of 1.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-tensor-pure, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-constant.

### Universal coaction compatibility with coefficient change

TauCeti.RootStack.factorialCoaction.coefficient_naturality. The actual universal coactions satisfy T_(φ,f)∘ρ_f=ρ_(φ(f))∘F_(φ,f) as ring homomorphisms C_A(f)→H_B⊗_B C_B(φ(f)).

Apply semilinear colimit ring-homomorphism extensionality. The two coefficient composites are ι_B∘φ by coefficient compatibility. On u_i the coaction root formula and tensor pure-tensor formula give h_i^B⊗u_i^(φ(f)) on both sides.

Acceptance tests:

- coefficientCoactionTests.square: For arbitrary x∈C_A(f), applying the tensor coefficient map after ρ_f agrees with applying ρ_(φ(f)) after F_(φ,f).
- coefficientCoactionTests.wild_square_zero: Under coefficient reduction ℤ→Z/2Z with f=0, the actual image of the coaction on the degree-two root has square 0.
- coefficientCoactionTests.wild_nonzero: Under coefficient reduction ℤ→Z/2Z with f=0, the actual image of the coaction on the degree-two root is nonzero; replacing the action by zero or discarding the nilpotent root fails this test.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-tensor-pure, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-tensor-constant, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-root, FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-root, FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-constant, FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction, FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root, FunctionFieldArithmeticPartII:RS.2/factorial-semilinear-ringhom-ext.

### Universal scalars

TauCeti.RootStack.factorialUnitCoefficientMap.universal_scalars. Mapping the actual universal coherent unit family σ_A through U_φ gives exactly σ_B as an equality in the inherited subgroup of coherent H_B-unit families.

Apply subtype/function/unit extensionality. On ring values use the actual universal-unit value formula, scalar-map value formula and unity-root coefficient formula.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-root, FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars, FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars-value, FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-map, FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-value, mathlib:Units.map, mathlib:Units.coe_map.

### Inverse value

TauCeti.RootStack.factorialUnitCoefficientMap.inverse_value. For every i, U_φ applied to the ring value of the i-th inverse unit of σ_A is the ring value of the i-th inverse unit of σ_B.

Apply inverse and evaluation to the preceding equality of actual coherent unit families. The existing unit-map preserves inverses, and its scalar-value formula identifies the ring values.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-universal-scalars, FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-value.

### Antipode compatibility with coefficient change

TauCeti.RootStack.factorialAntipode.coefficient_naturality. The actual antipodes satisfy S_B∘U_φ=U_φ∘S_A as ring homomorphisms H_A→H_B.

Apply semilinear colimit ring-homomorphism extensionality. Both coefficient composites are ι_B∘φ. On unity roots the antipode root formula reduces the equality to coefficient compatibility of the inverse universal-unit values.

Acceptance tests:

- coefficientAntipodeTests.square: For arbitrary x∈H_A, applying S_B after U_φ agrees with applying U_φ after S_A.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-root, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-constant, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-inverse-value, FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode, FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-root, FunctionFieldArithmeticPartII:RS.2/factorial-semilinear-ringhom-ext.

### Root

TauCeti.RootStack.factorialTensorCoefficientMap.root. For every i, T_(φ,f)(h_i^A⊗u_i^f)=h_i^B⊗u_i^(φ(f)) in the actual target tensor algebra.

Apply the pure-tensor formula and both unity-root and chart-root coefficient formulas.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-tensor-pure, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-root, FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-root.

### Id

TauCeti.RootStack.factorialTensorCoefficientMap.id. T_(id,f) is the identity ring homomorphism on H_A⊗_A C_A(f).

Use native tensor induction. Zero and addition are preserved; a pure tensor is fixed by the unity and chart coefficient identity laws.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-tensor-pure, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-identity, FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-identity, mathlib:TensorProduct.induction_on.

### Comp

TauCeti.RootStack.factorialTensorCoefficientMap.comp. For any ψ:B→C, T_(ψ∘φ,f)=T_(ψ,φ(f))∘T_(φ,f) as actual ring homomorphisms into H_C⊗_C C_C(ψ(φ(f))).

Use the native tensor ring-homomorphism extensionality theorem on the two canonical factor inclusions. The pure-tensor formula reduces the two restrictions to the unity and chart coefficient composition laws.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-tensor-pure, FunctionFieldArithmeticPartII:RS.2/factorial-coefficient-unity-composition, FunctionFieldArithmeticPartII:RS.2/factorial-chart-coefficient-composition, mathlib:Algebra.TensorProduct.ringHom_ext.

The degree-two coaction image under ℤ→Z/2Z at f=0 is nonzero and squares to0. Its nonvanishing is checked through actual coaction and chart inclusion injectivity and the monic AdjoinRoot power basis; its square follows from the actual root relation. Thus the acceptance cases keep nilpotent information and test more than point values. The zero-ring cases use the actual target modules over Z/1Z.

All276 incoming mathematical contracts, the general reserved root-stack key, historical source/correction/routes, the independent symplectic direction, and existing planet choices remain. Only the infinite-affine-quotient consumer gains the three coefficient squares and one proof step. All ten stages stay partial and all implementations unchecked. The canonical suggested file has admitted bodies; a separate exact native proof replay is recorded in the handoff.

The remaining frontier is the diagonalizable coordinate Hopf comparison H_A≃A[Q/Z], convolution on points, positive-divisibility transport and universe adapters, coherent root-object groupoid reindexing, affine Spec limits, fpqc frame torsors and the infinite quotient equivalence. TOWER-AFF, KUMMER-FINITE, TOWER-TYPING, DVR/Kummer and the all-roots-of2 non-fppf example retain their full hypotheses. Yun–Zhang and the independent symplectic source routes retain their distinct owners and requirements.

## Convolution points of the factorial unity-root algebra

Let A be any commutative ring and B,C any specified commutative A-algebras in the same universe. Write H_A=C_A(1), h_i for its actual roots of order (i+1)!, S_B for the existing subgroup of coherent B-unit families, and P_B and E_B for the existing point equivalence and evaluation inverse. Use the actual native convolution monoid WithConv(AlgHom_A(H_A,B)) supplied by Mathlib: multiplication is the tensor lift of p and q after Δ, and its identity is the coefficient map after ε. It is not pointwise multiplication of ring maps. The inherited actual factorial Hopf algebra and Tau Ceti’s existing convolution-group instance give inverse p∘S. No generic convolution group is specified again.

Convolution multiplies coherent root values. On h_i its value is p(h_i)q(h_i), the identity value is1 and the antipode replaces the universal unit by its inverse. Unit-value injectivity and the existing point equivalence therefore give the multiplicative equivalence Q_B below. In particular the identity algebra map H_A→H_A is generally not the identity convolution point. Over Z/3Z its degree-two universal coordinate is nontrivial, whereas the counit point has that coordinate1. The comparison retains zero rings and wild characteristic and makes no invertible-order assumption.

The generic Hopf point-group API is imported from the exact pins. These are coordinate comparisons on actual algebras, distinct from the remaining identification H_A≅A[Q/Z], positive-divisibility and universe transports, root-object groupoid reindexing, affine Spec limits, fpqc normalized-frame torsors and geometric quotient equivalence. These geometric obligations remain in RS.2; the Yun–Zhang and independent symplectic routes keep their full existing contracts.

### Convolution on each factorial root

TauCeti.RootStack.factorialConvPoints.root. For all algebra points p,q:H_A→B and i≥0, their native convolution product evaluates on h_i as p(h_i)q(h_i), where h_i is the distinguished root of order (i+1)!.

Proof route: Use the native convolution evaluation formula with the actual inherited bialgebra comultiplication Δ, then substitute the actual coaction root h_i⊗h_i; the native tensor lift evaluates this tensor as p(h_i)q(h_i).

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra, FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra-comul, FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root, mathlib:AlgHom.convMul_apply.

### Convolution identity on roots

TauCeti.RootStack.factorialConvPoints.one_root. The native convolution identity point H_A→B evaluates to 1 on every distinguished unity root h_i; it is the coefficient map composed with the actual counit, rather than the identity map of H_A.

Proof route: The native convolution identity is the coefficient map after the actual inherited bialgebra counit ε; substitute ε(h_i)=1 and preservation of one.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra, FunctionFieldArithmeticPartII:RS.2/factorial-universal-bialgebra-counit, FunctionFieldArithmeticPartII:RS.2/factorial-universal-counit-root, mathlib:AlgHom.convOne_def.

### Multiplication of represented coherent scalars

TauCeti.RootStack.factorialScalarPoints.conv_mul. The existing point equivalence P_B:AlgHom_A(H_A,B)≃S_B sends the underlying algebra homomorphism of p*q in the native convolution monoid to P_B(p)P_B(q) in the actual subgroup S_B of coherent unit families.

Proof route: Compare the unit values at every index using injectivity of unit values and subtype extensionality; use the root-coordinate convolution formula.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-value, FunctionFieldArithmeticPartII:RS.2/convolution-root.

### Identity of represented coherent scalars

TauCeti.RootStack.factorialScalarPoints.conv_one. The existing point equivalence P_B sends the underlying algebra map of the convolution identity to the actual identity coherent family 1∈S_B.

Proof route: Compare every unit value using the convolution counit root formula; the identity family has constant unit value1.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-value, FunctionFieldArithmeticPartII:RS.2/convolution-one-root.

### Convolution of coherent-family evaluations

TauCeti.RootStack.factorialScalarEvaluation.conv_mul. For any s,t∈S_B, toConv(E_B(st))=toConv(E_B(s))*toConv(E_B(t)) in the actual native convolution monoid WithConv(AlgHom_A(H_A,B)).

Proof route: Use injectivity of the existing point equivalence, its reconstruction of coherent families, and multiplication compatibility.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-right-inverse, FunctionFieldArithmeticPartII:RS.2/convolution-scalar-multiplication.

### Counit evaluation of the identity family

TauCeti.RootStack.factorialScalarEvaluation.conv_one. toConv(E_B(1)) is the identity of the actual native convolution monoid; equivalently E_B(1)=ι_B∘ε_A as algebra homomorphisms H_A→B.

Proof route: Use injectivity of the existing point equivalence, its coherent-family round trip, and the identity formula.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-right-inverse, FunctionFieldArithmeticPartII:RS.2/convolution-scalar-identity.

### Antipode on represented coherent scalars

TauCeti.RootStack.factorialScalarPoints.antipode. For every algebra point p:H_A→B, P_B(p∘S_A)=P_B(p)⁻¹ as an equality in the existing subgroup S_B of coherent B-unit families.

Proof route: Evaluate the actual antipode on each h_i as the inverse of the universal unit. The existing unit-family map is a monoid homomorphism between groups, so it preserves inverses; use unit-value injectivity.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-antipode-root, FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-map, FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-value, FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalars-value.

### Evaluation of inverse coherent families

TauCeti.RootStack.factorialScalarEvaluation.antipode. For all s∈S_B, E_B(s⁻¹)=E_B(s)∘S_A as actual A-algebra homomorphisms H_A→B.

Proof route: Use injectivity of P_B, the antipode coordinate comparison, and the coherent-family round trip.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-right-inverse, FunctionFieldArithmeticPartII:RS.2/convolution-antipode-scalars.

### Left inverse of a root-algebra point

TauCeti.RootStack.factorialConvPoints.left_inverse. For every algebra point p:H_A→B, toConv(p∘S_A)*toConv(p)=1 in the native convolution monoid; the inverse is given by the actual antipode and introduces no alternative group structure.

Proof route: Use injectivity of P_B to reduce to P_B(p)⁻¹P_B(p)=1 in the actual coherent unit subgroup.

Dependencies: FunctionFieldArithmeticPartII:RS.2/convolution-scalar-multiplication, FunctionFieldArithmeticPartII:RS.2/convolution-antipode-scalars, FunctionFieldArithmeticPartII:RS.2/convolution-scalar-identity.

### Right inverse of a root-algebra point

TauCeti.RootStack.factorialConvPoints.right_inverse. For every algebra point p:H_A→B, toConv(p)*toConv(p∘S_A)=1 in the native convolution monoid.

Proof route: Use injectivity of P_B to reduce to P_B(p)P_B(p)⁻¹=1 in the actual coherent unit subgroup.

Dependencies: FunctionFieldArithmeticPartII:RS.2/convolution-scalar-multiplication, FunctionFieldArithmeticPartII:RS.2/convolution-antipode-scalars, FunctionFieldArithmeticPartII:RS.2/convolution-scalar-identity.

### Convolution points and coherent roots of unity

TauCeti.RootStack.factorialScalarPointsMulEquiv. Construct the multiplicative equivalence Q_B:WithConv(AlgHom_A(H_A,B))≃*S_B using the existing native convolution monoid on algebra homomorphisms. Its forward map is the existing P_B on the underlying algebra homomorphism; its inverse is toConv(E_B(s)). This is also the comparison of groups when the existing Tau Ceti convolution-group instance for the actual inherited Hopf algebra is installed.

Proof route: Retain the actual underlying point equivalence, wrapping algebra maps with native WithConv. Its two inverse laws are the inherited point round trips. The proved convolution multiplication law supplies the native MulEquiv constructor. No generic convolution structure is rebuilt.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points, FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-left-inverse, FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-right-inverse, FunctionFieldArithmeticPartII:RS.2/convolution-scalar-multiplication, mathlib:MulEquiv.

API:

- TauCeti.RootStack.factorialScalarPointsMulEquiv.apply: For every p∈WithConv(AlgHom_A(H_A,B)), Q_B(p)=P_B(p.ofConv).
- TauCeti.RootStack.factorialScalarPointsMulEquiv.symm_apply: For every coherent family s∈S_B, Q_B⁻¹(s)=toConv(E_B(s)).
- TauCeti.RootStack.factorialScalarPointsMulEquiv.root: For every native convolution point p and index i, the ring value of the i-th unit of Q_B(p) is p.ofConv(h_i).
- TauCeti.RootStack.factorialScalarPointsMulEquiv.mul: For every p,q∈WithConv(AlgHom_A(H_A,B)), Q_B(p*q)=Q_B(p)Q_B(q).
- TauCeti.RootStack.factorialScalarPointsMulEquiv.one: Q_B(1)=1 for the native convolution identity and the actual coherent-family identity.
- TauCeti.RootStack.factorialScalarPointsMulEquiv.pow: For every p∈WithConv(AlgHom_A(H_A,B)) and n∈ℕ, Q_B(p^n)=Q_B(p)^n, including n=0.
- TauCeti.RootStack.factorialScalarPointsMulEquiv.naturality: For any A-algebra map k:B→C and p∈WithConv(AlgHom_A(H_A,B)), Q_C(toConv(k∘p.ofConv))=S(k)(Q_B(p)), where S(k) is the inherited unit-family monoid homomorphism. Thus the comparison intertwines the native functor of convolution points with coherent-root functoriality.

Acceptance tests:

- convolutionPointsTests.degree_two (computation): Over Z/4Z, convolution of E(s) and E(t) evaluates the distinguished degree-two unity root as the product of the ring values of s_1 and t_1.
- convolutionPointsTests.identity (compatibility): The native convolution identity maps under Q_B to the identity coherent family for every A-algebra B.
- convolutionPointsTests.roundtrip (compatibility): For every actual native convolution point p, Q_B⁻¹(Q_B(p))=p.
- convolutionPointsTests.inverse (characterisation): For every algebra point p, convolution of p∘S_A with p is the native convolution identity.
- convolutionPointsTests.zero_ring (degenerate): For A=B=Z/1Z, the actual point comparison sends the native convolution identity to the unique coherent family1.
- convolutionPointsTests.counit_not_identity (non-example): For A=Z/3Z and B=H_A, the identity algebra map of H_A has a nonidentity degree-two coordinate under Q_B. It therefore differs from the convolution identity, whose every root value is1.
- convolutionPointsTests.naturality (compatibility): Postcomposing E_B(s) by any A-algebra map k:B→C and then applying Q_C gives the coherent family S(k)(s).
- convolutionPointsTests.root_order (characterisation): Every actual algebra point p evaluates h_i to an element whose (i+1)! power is1, with arbitrary characteristic and zero rings included.

### Underlying represented point of the multiplicative equivalence

TauCeti.RootStack.factorialScalarPointsMulEquiv.apply. For every p∈WithConv(AlgHom_A(H_A,B)), Q_B(p)=P_B(p.ofConv).

Proof route: Unfold the forward map of the specialized native multiplicative equivalence.

Dependencies: FunctionFieldArithmeticPartII:RS.2/convolution-points-equivalence.

### Evaluation inverse of the multiplicative equivalence

TauCeti.RootStack.factorialScalarPointsMulEquiv.symm_apply. For every coherent family s∈S_B, Q_B⁻¹(s)=toConv(E_B(s)).

Proof route: Unfold the inverse map of the specialized native multiplicative equivalence.

Dependencies: FunctionFieldArithmeticPartII:RS.2/convolution-points-equivalence.

### Naturality of the multiplicative point comparison

TauCeti.RootStack.factorialScalarPointsMulEquiv.naturality. For any A-algebra map k:B→C and p∈WithConv(AlgHom_A(H_A,B)), Q_C(toConv(k∘p.ofConv))=S(k)(Q_B(p)), where S(k) is the inherited unit-family monoid homomorphism. Thus the comparison intertwines the native functor of convolution points with coherent-root functoriality.

Proof route: Use the existing naturality of P on the underlying algebra homomorphisms; Q has that exact forward map. Native postcomposition is multiplicative by the imported convolution distributivity result.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-naturality, FunctionFieldArithmeticPartII:RS.2/factorial-scalar-coefficient-map, FunctionFieldArithmeticPartII:RS.2/convolution-points-equivalence, mathlib:AlgHom.comp_convMul_distrib.

### Naturality of the evaluation inverse

TauCeti.RootStack.factorialScalarEvaluation.naturality. For every s∈S_B and A-algebra map k:B→C, k∘E_B(s)=E_C(S(k)(s)) as actual A-algebra homomorphisms H_A→C.

Proof route: Apply injectivity of P_C, its naturality, and the coherent-family round trip on both sides.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-naturality, FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-right-inverse.

### Convolution powers under the point comparison

TauCeti.RootStack.factorialScalarPointsMulEquiv.pow. For every p∈WithConv(AlgHom_A(H_A,B)) and n∈ℕ, Q_B(p^n)=Q_B(p)^n, including n=0.

Proof route: Apply the native multiplicative equivalence preservation of natural powers.

Dependencies: FunctionFieldArithmeticPartII:RS.2/convolution-points-equivalence.

### Multiplication under the point comparison

TauCeti.RootStack.factorialScalarPointsMulEquiv.mul. For every p,q∈WithConv(AlgHom_A(H_A,B)), Q_B(p*q)=Q_B(p)Q_B(q).

Proof route: Apply multiplication preservation of the constructed native multiplicative equivalence.

Dependencies: FunctionFieldArithmeticPartII:RS.2/convolution-points-equivalence.

### Identity under the point comparison

TauCeti.RootStack.factorialScalarPointsMulEquiv.one. Q_B(1)=1 for the native convolution identity and the actual coherent-family identity.

Proof route: Apply identity preservation of a native multiplicative equivalence between monoids.

Dependencies: FunctionFieldArithmeticPartII:RS.2/convolution-points-equivalence.

### Root value under the point comparison

TauCeti.RootStack.factorialScalarPointsMulEquiv.root. For every native convolution point p and index i, the ring value of the i-th unit of Q_B(p) is p.ofConv(h_i).

Proof route: Use the existing point-equivalence root value because Q has that same underlying forward map.

Dependencies: FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-points-value, FunctionFieldArithmeticPartII:RS.2/convolution-points-equivalence.

### Commutativity of unity-root convolution points

TauCeti.RootStack.factorialConvPoints.comm. For every p,q∈WithConv(AlgHom_A(H_A,B)), p*q=q*p. This follows from the actual point comparison without installing an alternate commutative-group instance.

Proof route: Apply injectivity of Q_B, multiplication preservation and commutativity of the coherent unit subgroup.

Dependencies: FunctionFieldArithmeticPartII:RS.2/convolution-points-equivalence.

Sources: Talpo–Vistoli, arXiv:1410.1164v2, complete pp.14–16, for the Cartier-dual action and affine quotient motivation; the displayed coordinate deductions are authored here. The generic convolution product is imported from Mathlib/RingTheory/Bialgebra/Convolution at082e2d3; the generic Hopf point group and antipode inverse are imported from TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints atf790474.

## RS.2 continuation: convolution acting on root-chart points

For arbitrary commutative A-algebras B,C in one fixed universe and any f∈A, write C_A(f) for the actual factorial chart colimit, H_A=C_A(1), u_i and h_i for its roots, and ρ_f for its inherited coaction. All zero rings, torsion, nonunit parameters and wild/nonreduced fibres remain. Native convolution points act on actual chart algebra maps by applying both maps to the tensor coaction. The generic convolution monoid, tensor lift and action carrier are imports. Tau Ceti's existing comodule pointsRepresentation acts on scalar-extended modules, not on this algebra-map carrier, and is not replanned.

No freeness follows: if a chart point kills every u_i then every point action fixes it. The universal tensor-inclusion test recovers ρ_f as an algebra map, preventing a replacement by a trivial action or an equality only on reduced geometric points. Quotient stacks, frame torsors and the A[Q/Z] coordinate comparison remain distinct work.

### The represented action on root-chart points

`TauCeti.RootStack.factorialPointAction` — construction. For arbitrary f∈A, g∈WithConv(AlgHom_A(H_A,B)) and x∈AlgHom_A(C_A(f),B), define α_f(g,x)=lift(g.ofConv,x)∘ρ_f using the native tensor-algebra lift. This is an actual A-algebra homomorphism C_A(f)→B.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Compose the inherited coaction ρ_f with the imported tensor lift of g.ofConv and x. Their images commute because B is commutative; no new generic tensor construction is planned.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction`, `mathlib:Algebra.TensorProduct.lift`.

API:

- `TauCeti.RootStack.factorialPointAction.root`: For every index i, α_f(g,x)(u_i)=g.ofConv(h_i)·x(u_i).
- `TauCeti.RootStack.factorialPointAction.one`: For every chart point x, α_f(1,x)=x; the convolution identity is the counit point, not the identity endomorphism of H_A.
- `TauCeti.RootStack.factorialPointAction.mul`: For every g,h and chart point x, α_f(g*h,x)=α_f(g,α_f(h,x)).
- `TauCeti.RootStack.factorialPointAction.naturality`: For every A-algebra homomorphism k:B→C, k∘α_f(g,x)=α_f(toConv(k∘g.ofConv),k∘x).
- `TauCeti.RootStack.factorialPointAction.scaling`: For every coherent A-unit family s and chart point x, α_f(toConv(ι_B∘E_s),x)=x∘factorialScale(f,s), where E_s is the actual inherited evaluation map H_A→A.
- `TauCeti.RootStack.factorialPointAction.universal`: Taking B=H_A⊗_A C_A(f), g=toConv(includeLeft) and x=includeRight gives α_f(g,x)=ρ_f as actual algebra homomorphisms; all roots and nilpotents are retained.

Unit tests:

- `pointActionTests.degree_two` (value): At A=B=ZMod4 and f=0, the order-two root evaluates under the action as the product of the unity-root point value and the chart-point value.
- `pointActionTests.identity` (degenerate): For every f and every B-valued chart point, the convolution identity acts as the identity.
- `pointActionTests.universal` (compatibility): The actual tensor-inclusion universal points recover the whole inherited coaction.
- `pointActionTests.fixed_zero_roots` (non-example): In characteristic two with f=0, any chart point evaluating every root to zero is fixed by every convolution point; this action alone is not a freeness certificate.

### The action on each finite root

`TauCeti.RootStack.factorialPointAction.root` — lemma. For every index i, α_f(g,x)(u_i)=g.ofConv(h_i)·x(u_i).

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Apply the coaction root formula and the imported pure-tensor evaluation formula.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `mathlib:Algebra.TensorProduct.lift_tmul`.

### The action on coefficients

`TauCeti.RootStack.factorialPointAction.constant` — lemma. For every a∈A, α_f(g,x)(ι_C(a))=ι_B(a).

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Use the coefficient-preservation field of the actual composite A-algebra homomorphism.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action`.

### The convolution identity acts identically

`TauCeti.RootStack.factorialPointAction.one` — lemma. For every chart point x, α_f(1,x)=x; the convolution identity is the counit point, not the identity endomorphism of H_A.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Compare the maps on all u_i. The inherited convolution identity evaluates each h_i to1, so multiplication leaves x(u_i) fixed.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action-root`, `FunctionFieldArithmeticPartII:RS.2/convolution-one-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`.

### Convolution composition of actions

`TauCeti.RootStack.factorialPointAction.mul` — lemma. For every g,h and chart point x, α_f(g*h,x)=α_f(g,α_f(h,x)).

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Compare all distinguished roots by actual colimit extensionality. Convolution evaluates h_i to g(h_i)h(h_i); associativity in B gives the equality.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action-root`, `FunctionFieldArithmeticPartII:RS.2/convolution-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`.

### The native root-chart point action

`TauCeti.RootStack.factorialPointMulAction` — construction. The operation α_f equips AlgHom_A(C_A(f),B) with a native MulAction of the imported convolution monoid WithConv(AlgHom_A(H_A,B)); this is installed locally using the inherited factorial bialgebra.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Fill the native action fields with α_f, its identity law and its product law. Do not construct a replacement generic monoid or group.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action`, `FunctionFieldArithmeticPartII:RS.2/point-action-one`, `FunctionFieldArithmeticPartII:RS.2/point-action-mul`, `mathlib:MulAction`.

API:

- `TauCeti.RootStack.factorialPointMulAction.smul`: After locally installing factorialPointMulAction f, g•x=α_f(g,x).
- `TauCeti.RootStack.factorialPointAction.one`: For every chart point x, α_f(1,x)=x; the convolution identity is the counit point, not the identity endomorphism of H_A.
- `TauCeti.RootStack.factorialPointAction.mul`: For every g,h and chart point x, α_f(g*h,x)=α_f(g,α_f(h,x)).

Unit tests:

- `pointMulActionTests.identity` (degenerate): After local native action installation, the convolution unit fixes every point.
- `pointMulActionTests.composition` (compatibility): After local native action installation, a convolution product acts as the successive two actions.
- `pointMulActionTests.zero_ring` (value): At A=B=ZMod1 and f=0, the locally installed native action includes the zero-ring chart points and satisfies the unit law.

### Identification of scalar action

`TauCeti.RootStack.factorialPointMulAction.smul` — lemma. After locally installing factorialPointMulAction f, g•x=α_f(g,x).

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Unfold only the root-specific instance field; the equality is definitional.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-mul-action`.

### Naturality in the test algebra

`TauCeti.RootStack.factorialPointAction.naturality` — lemma. For every A-algebra homomorphism k:B→C, k∘α_f(g,x)=α_f(toConv(k∘g.ofConv),k∘x).

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Apply root extensionality. The two root values agree because k preserves products.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`.

### Recovery of the existing coefficient-valued scaling

`TauCeti.RootStack.factorialPointAction.scaling` — lemma. For every coherent A-unit family s and chart point x, α_f(toConv(ι_B∘E_s),x)=x∘factorialScale(f,s), where E_s is the actual inherited evaluation map H_A→A.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Compare all root values. Evaluation gives s_i, while the inherited scaling sends u_i to ι_C(s_i)u_i; x preserves coefficients and products.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-scalar-evaluation-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-root-scaling-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`.

### Universal recovery of the coaction

`TauCeti.RootStack.factorialPointAction.universal` — lemma. Taking B=H_A⊗_A C_A(f), g=toConv(includeLeft) and x=includeRight gives α_f(g,x)=ρ_f as actual algebra homomorphisms; all roots and nilpotents are retained.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Compare each root using the native left/right tensor inclusions: (h_i⊗1)(1⊗u_i)=h_i⊗u_i. This recovers the whole coaction, not merely geometric-point values.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-universal-coaction-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`.

### Antipode cancellation on the left

`TauCeti.RootStack.factorialPointAction.left_inverse` — lemma. For every algebra map g:H_A→B and chart point x, α_f(toConv(g∘S),α_f(toConv(g),x))=x.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Use the product action law backwards, the inherited left convolution inverse equation, then the identity action law.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action-mul`, `FunctionFieldArithmeticPartII:RS.2/point-action-one`, `FunctionFieldArithmeticPartII:RS.2/convolution-left-inverse`.

### Antipode cancellation on the right

`TauCeti.RootStack.factorialPointAction.right_inverse` — lemma. For every algebra map g:H_A→B and chart point x, α_f(toConv(g),α_f(toConv(g∘S),x))=x.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Use the product action law backwards, the inherited right convolution inverse equation, then the identity action law.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action-mul`, `FunctionFieldArithmeticPartII:RS.2/point-action-one`, `FunctionFieldArithmeticPartII:RS.2/convolution-right-inverse`.

### Zero-root points are fixed

`TauCeti.RootStack.factorialPointAction.fixed_zero_roots` — lemma. If x(u_i)=0 for every i, then α_f(g,x)=x for every convolution point g. Hence no freeness or torsor claim follows from the existence of this action.

Hypotheses: A,B,C are arbitrary commutative rings in one fixed universe, with specified A-algebra structures on B and C; f∈A is arbitrary and k:B→C is an arbitrary A-algebra homomorphism where used. Zero rings, wild characteristic, nonreduced fibres and nonunit f are included. No field, domain, reducedness, finite-type, invertible-order, flatness or nontriviality hypothesis is imposed. C_A(f) is the inherited factorial affine root colimit with u_i^(i+1)!=f. H_A=C_A(1) has inherited roots h_i, coaction ρ_f, counit ε, antipode S, coherent families and evaluation E_s. Install only the inherited factorialBialgebra A locally; use the native imported convolution monoid. This is an action on actual affine-chart algebra-valued points, not a new generic comodule action. The existing Tau Ceti comodule pointsRepresentation acts on scalar-extended modules, a distinct carrier. The A[Q/Z] coordinate comparison, arbitrary-universe adapters, Spec transport, coherent root-object groupoids, fpqc frame torsors and quotient-stack equivalence remain separate obligations. Fixed zero-root points explicitly preclude a freeness claim.

Construction or proof: Every acted root evaluates to g(h_i)·0=0. Root extensionality identifies the actual algebra maps.

Dependencies: `FunctionFieldArithmeticPartII:RS.2/point-action-root`, `FunctionFieldArithmeticPartII:RS.2/factorial-affine-colimit-ext`.

Acceptance: all thirteen named signatures and seven test types agree with the checked native proof. Preserve the general reserved root-stack definition, relative roots, full nonreduced fibres, arbitrary exponents and coherent infinite systems. All312 inherited contracts and all stage dependencies remain. Current totals:325 nodes,256 raw API records,265 raw tests,39 planets,201 baseline citations,8 gaps and13 requests. Every stage remains partial and every implementation unchecked.

Sources: Talpo–Vistoli, [arXiv:1410.1164v2](https://arxiv.org/pdf/1410.1164v2), complete printed/PDF pp.14–16 personally read2026-10-03; the point-coordinate action identities above are authored deductions from actual inherited native maps, not printed named theorems. The two original joining briefs and source-route inventories are retained. The whole geometric suggested file remains uncompiled; only its exact whole Mathlib-only extraction and the native proof are checked with the existing pin.
