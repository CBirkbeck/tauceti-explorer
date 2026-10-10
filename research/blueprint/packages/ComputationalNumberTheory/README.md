# Certified computational number theory and arithmetic data

Arithmetic computations become reusable mathematics when their outputs identify
objects in the library and carry evidence that can be checked independently of
the program that found them. This roadmap builds that interface: exact
presentations, finite primality and factorization certificates, maximal-order
and class-group computations, integral modular-form matrices, and numerical
enclosures with proved errors. Its examples include ordinary and nonordinary
level-one eigenforms, finite-conductor Dirichlet L-function computations, and
the rational Gram witnesses used in explicit-formula arguments.

The common pattern is to specify a mathematical value, choose finite data that
present it, define an executable verifier, prove the verifier sound, and prove
completeness and termination for the advertised discovery algorithm. A semantic
certificate containing a proof is useful for specifying the interface, but it
does not itself supply an executable verifier. Both are targets when a finite
verification procedure is required below. Discovery can use heuristics or
randomness; the meaning of an accepted certificate is fixed independently of
those choices. Conditional running-time estimates carry their assumptions in
their own statements.

Suggested homes are `TauCeti/NumberTheory/Computational/` for the arithmetic
adapters and `TauCeti/Analysis/ValidatedNumerics/` for general enclosure
operations. Names below use `TauCeti.Computational`. Every definition needs the
stated API and its worked tests. [Suggested.lean](Suggested.lean) gives proposed
signatures and admitted examples; this document is the definitive specification.

## Scope and ownership

Integers, rationals, residue rings, polynomials, finite fields, number fields,
the ring of integers, ideals, class groups, units, modular forms, and continued
L-functions use their Mathlib or Tau Ceti carriers. Finite presentations are
related to those carriers by explicit decoding and transport equations. A
computable presentation never creates a second mathematical field or a second
class group.

The following suppliers fix the boundaries. Layer identifiers are part of each
dependency: importing a theorem means importing its hypotheses and normalization.

| Input | Supplier and contract |
| --- | --- |
| Integer lattice coordinates, HNF/SNF and certified change of basis | **ClassicalArithmeticCompletion, CA.3**: Hermite certificates, a basis of a sublattice, the product-of-pivots index formula, and Smith certificates. CN.2 supplies the ambient order basis. The Newton-side consumer also requires the generic lower convex hull, supporting-line and slope-ordering contracts; its polynomial valuations and residual arithmetic remain CN.2. CA.5 consumes the number-field algorithms here and is not an input to them. |
| Finite-field presentations, embeddings and presentation changes | **FiniteFieldsAndCharacterSums, FF.0**: a certified quotient/evaluation presentation and its ring equivalence with the intrinsic field. |
| Finite-field polynomial discovery and checking | **FiniteFieldsAndCharacterSums, FF.3**: square-free, distinct-degree and equal-degree factorization, Berlekamp/Cantor–Zassenhaus, certified products and irreducibility, and Hensel lifting modulo prime powers. CN.1 transports their outputs; it does not reconstruct those algorithms. |
| Number-field index, discriminant and good-index prime decomposition | **NumberFieldArithmetic, Layers 3 and 7**: the index–discriminant identity, Kummer–Dedekind with its index hypothesis, existing explicit integral bases and rank-one unit certificates. CN.2 adds general full-order improvement and general-rank completeness certificates. |
| Intrinsic local fields and their extension invariants | **LocalFieldsRamification, Layer 0**: complete discretely valued fields, a uniformizer, residue field, surjective reduction, ramification and residue degrees. A chosen residue section is additional data; canonical Teichmüller representatives use **Layer 1**. |
| Integral Hecke algebra, modular symbols, coefficient fields and labels | **ModularForms, Layers 8–11**: finite Manin presentations and period comparison in Layer 8, exact label/embedding identification in Layer 9, index, cusp-width and dimension conventions in Layer 10, and the level-one trace formula in Layer 11. CN.3 computes coordinates in the forms lattice; the period-dual symbol matrix has the corresponding transpose. |
| Integral models and characteristic-p modular comparisons | **AlgebraicModularFormsAndSerreWeights, R15.2–R15.3**: the q-expansion principle, bounded denominators and cusp rationality, then the theta operator, Hasse invariant and common-weight comparison. These supply the general congruence and finite companion certificates. |
| Elliptic curves, isogenies and descent objects | **EllipticCurves, Layers 1, 3, 6 and 7**: isogenies/duals/differentials; finite-field Frobenius and the identity \(#E(\mathbf F_q)=q+1-\operatorname{tr}(\mathrm{Frob})\); Mordell–Weil, torsion, heights and two-descent; Selmer local conditions and the Kummer sequence. **EffectiveDiophantineMethods, ED.3** supplies finite local-image and saturation algorithms with soundness, completeness and termination. CN.3 binds computed outputs to those objects. |
| Finite-field point counts | **FiniteFieldsAndCharacterSums, FF.3**: enumeration including the point at infinity for general Weierstrass equations, and its certificate. Identification with the elliptic group requires nonsingularity. The character-sum shortcut assumes odd characteristic and \(a_1=a_3=0\); characteristic two uses general enumeration. |
| Continued analytic L-functions | Mathlib `DirichletCharacter.LFunction` and `ModularForm.L`; **ModularForms, Layer 7** supplies the functional-equation and Fricke normalization. **AutomorphicLFunctionsAndLocalFactors, AL.1** supplies Tate/Hecke continuation with pole/residue data, and **AnalyticNumberTheory, AN.4** its number-field analytic comparison. CN.4 computes enclosures of these imported functions. |
| General polynomial real algebra and root matching | **RealAlgebraicGeometry, Layers 1–4**: Sturm–Tarski, signed remainder/subresultant identities, distinct-root counts, separation and multiplicity-sensitive matching. CN.0/CN.4 add finite rational certificates, effective refinement and verification against these intrinsic results; they do not develop another Sturm theory or CAD. |
| Exact ellipsoid enumeration | **GeometryOfNumbersAndQuadraticArithmetic, GN.5**: all integer vectors in a symmetric positive-definite rational ellipsoid, with termination and cutoff completeness. LLL alone does not meet this contract. CN.4 filters and validates the supplied complete cover. |

The intrinsic archimedean test functions, Fourier conventions and automorphic
positivity implications of Chenevier–Taïbi belong to
**LevelOneAutomorphicFormsForClassicalGroups**. CN.4 owns the numerical
right-hand sides, rigorous scalar evaluation and finite Gram checks. The
identification of those right-hand sides with the intrinsic functionals is an
explicit supplier contract, stated in CN.4, rather than an assumed equality.

The consumers include **ComplexMultiplicationAndExplicitReciprocity, CM.5**,
which uses enclosure arithmetic and unique-integer recovery for class
polynomials while retaining height, CRT and endomorphism-ring certificates;
**PeriodsAndSpecialValues, PS.7** and **EffectiveDiophantineMethods, ED.0**,
which use validated enclosures; and **RankZeroOneBSD**, which assembles exact
vanishing of lower derivatives and certified nonvanishing at the first
nonzero derivative. An enclosure containing zero cannot supply the exact
vanishing part of that last contract.

## Conventions and existing interfaces

* A rational interval is Mathlib `NonemptyInterval ℚ`, with ordered closed
  endpoints. A complex box is a pair of such intervals; its denotation is a
  subset of `ℂ`. An isolated algebraic number decodes into
  `algebraicClosure ℚ ℂ`, not into the box itself.
* Polynomials use `Polynomial`; quotient fields use `AdjoinRoot` and
  `AdjoinRoot.mk`. Distinct roots and roots counted with multiplicity are
  distinguished explicitly. A nonzero constant has no roots; zero polynomial
  input is rejected by finite root-list algorithms.
* A p-adic approximation describes a ball, with absolute precision \(N\),
  valuation lower bound \(v\), and relative precision \(N-v\) when its mantissa
  is nonzero. Zero mantissa describes \(p^N\mathbf Z_p\). Native
  `padicValRat` defaults to zero at zero; the polynomial valuation here uses
  `WithTop ℕ` so the zero polynomial has valuation infinity.
* Matrices act on column vectors. A Hecke matrix entry \((i,j)\) is the
  \(i\)-th coordinate of the image of basis vector \(j\). All level-one
  q-expansions have width one; a general subgroup uses its actual strict cusp
  width. Eisenstein series have constant term one, and \(\Delta=q+\cdots\).
* In a RAM program, words are integers and addresses are nonnegative integers.
  Floor division rounds toward negative infinity even with a negative
  denominator. Unit instruction count, integer magnitude, bit cost and random
  success probability are separate quantities.
* Entrywise matrix bounds control quadratic forms only for vectors with
  nonnegative coordinates. Bounds for arbitrary real vectors require a
  positive-semidefinite difference or full interval arithmetic.
* A class-group relation matrix supplies checked relations, not their
  completeness. A unit regulator index is measured after adjoining all torsion
  units. A numerical inequality is used only with its rigorous remainder bound.

Consume the existing Lucas criterion and its converse (`lucas_primality`,
`reverse_lucas_primality`), the exact `Nat.primeFactorsList` product theorem for
nonzero input, `PadicInt.toZModPow`, and the native radical/Frobenius maps.
Use `NumberField.classNumber`, `ClassGroup.mk0`, the Minkowski ideal-class bound
`NumberField.exists_ideal_in_class_of_norm_le`, and
`NumberField.Units.regOfFamily_div_regulator` for the intrinsic invariants.

Mathlib's level-one dimension formula and characteristic-zero Sturm theorem
already apply. Tau Ceti's `TauCeti.ModularForm.eq_of_sturm_bound` gives the
finite-index equality theorem with discrete strict periods and the actual
width. The good-prime Hecke coefficient recurrence is supplied by
`HeckeRing.GL2.qExpansion_coeff_heckeSlashGamma1CuspFormEnd_diagCosetGamma1_of_mem_cuspFormCharSpace`;
its nebentypus and coprimality hypotheses remain visible in the general-level
adapter. Continued modular L-functions use `ModularForm.weakFEPair`,
`WeakFEPair.functional_equation`, `ModularForm.Λ`, `ModularForm.L` and the
native cusp-form differentiability results. Tau Ceti's
`CuspForm.hasEntireExtension_qExpansion_coeff` identifies the coefficient
Dirichlet series with the continuation using the cusp-width factor. These
interfaces supply exact analytic functions, not numerical error bounds.

The layer order separates presentation, arithmetic and numerical validation:

| Layer | Targets | Inputs |
| --- | --- | --- |
| CN.0 | Exact presentations, algebraic root certificates, RAM and cost interfaces | Native arithmetic and FF.0/CA.3 presentations |
| CN.1 | Primality, integer/rational factors and certificate size | CN.0, native Lucas, FF.3 |
| CN.2 | Full orders, integral bases, prime ideals, classes, units and local expansions | CN.0–CN.1, CA.3, FF.0/FF.3, NumberFieldArithmetic, LocalFieldsRamification |
| CN.3 | Integral forms, exact Hecke matrices, companion systems and data equality | CN.0–CN.1, ModularForms, R15.2–R15.3, elliptic/finite-field suppliers |
| CN.4 | Validated arithmetic, root isolation, L-values and Gram certificates | CN.0, imported continuation/root theory, GN.5 enumeration |
| CN.5 | Binding and replay of arithmetic datasets | Existing CN.0 cost interfaces and CN.4 finite checkers |

CN.2 specifies the exact regulator and analytic stopping inequalities before
they are applied through CN.4's enclosure engine. Algebraic presentation
arithmetic in CN.0 similarly specifies its result independently of the
precision-driven root-isolation implementation in CN.4. No foundational
definition depends on either consumer.
## CN.0: Exact presentations and computation models

Build the presentation and decoding interfaces before algorithms use their output. Finite-field embeddings and integer lattice normal forms are imported through FF.0 and CA.3; the targets below specify the new algebraic-root, p-adic and RAM interfaces. Every use of a finite presentation carries its decoding equation. The raw RAM semantics permits unbounded integers; only a separately proved magnitude bound supports a bit simulation.

Construction requirements. For algebraic presentations, implement a finite rational rectangle root-count certificate, a sound verifier, root separation and precision refinement. Use the intrinsic root-count and matching theorems of RealAlgebraicGeometry Layers 1–4 for the correctness comparison. Construct annihilating polynomials for sum/product/inverse by exact elimination and verify the selected common root. The equality procedure must terminate after gcd/common-root isolation or certified disjointness; rectangle overlap is insufficient. These are the algorithmic content of the presentation targets, rather than new algebraic carriers. Arb §§5–5.3, pp.7–9 motivates enclosure semantics; it is not a source theorem proving this root-isolation algorithm. For the RAM interface, specify a digit-array encoding of large words, address access and arithmetic charges, and prove a uniform simulation bound from polynomial magnitude and the per-step charge. A charge supplied as data does not by itself establish the cost of an implementation. Use Shoup §§3.2–3.6, pp.53–72 for the computation model.

### RAM instructions, executions and costs

**RAM instruction — `RAMInstruction`.** RAMInstruction has arithmetic, branch and halt constructors. An operand is either an integer literal or a pair (indirect,address), with address in ℕ. A destination is such a pair, without the literal alternative. Arithmetic operations are indexed 0,1,2,3 for addition, subtraction, multiplication and floor division. Branch comparisons are indexed 0,…,5 for equality, inequality, less, greater, less-or-equal and greater-or-equal. Programs are finite lists of instructions.

Construction or proof. Use an inductive instruction type, existing sum and product types for operands and destinations, and finite indices for the operation tables.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [Shoup](#source-shoup), §3.2, printed pp.53–55.

API.

- `ramInstruction_halt_ne_arithmetic`: Halt and arithmetic instructions are distinct.
- `ramInstruction_branch_injective`: Branch instructions with a common comparison and operands agree precisely when their targets agree.
- `ramInstruction_arithmetic_injective`: Arithmetic instructions with common destinations and operands agree precisely when their operations agree.

Tests.

- `test_ram_halt` (degenerate): The one-instruction halt program has length one.
- `test_ram_assignment` (computation): The literal assignment 2+3 to cell 0 is a well-formed arithmetic instruction.
- `test_ram_branch_distinct` (non-example): Changing a branch target changes its syntax.

**RAM operand evaluation — `ramRead`.** ramRead m evaluates an integer literal as itself, a direct operand (false,i) as m(i), and an indirect operand (true,i) as m(m(i)) when m(i)≥0. A negative indirect address returns none. Memory m is the exact existing function type ℕ→ℤ.

Construction or proof. Inspect the operand tag. Check nonnegativity before converting an indirect address from ℤ to ℕ.

Prerequisites. `RAMInstruction` (CN.0).

Source. [Shoup](#source-shoup), §3.2, printed pp.53–55.

API.

- `ramRead_literal`: Literals evaluate to themselves.
- `ramRead_direct`: Direct addressing reads the selected cell.
- `ramRead_indirect`: Indirect evaluation succeeds exactly at nonnegative stored addresses.

Tests.

- `test_ram_literal_negative` (computation): Negative literal values are allowed.
- `test_ram_zero_memory` (degenerate): Indirect cell 0 in zero memory reads zero.
- `test_ram_negative_address` (non-example): A negative stored address is rejected, rather than truncated to zero.

**Partial RAM transition — `ramStep`.** ramStep P (pc,m) returns an error if pc is outside P, an operand or destination has a negative indirect address, or a floor-division denominator is zero. Halt returns a successful none. A successful arithmetic step writes its result to the resolved destination and increments pc; a branch preserves memory and jumps to its target exactly when its comparison holds, otherwise increments pc. Floor division is floor of the rational quotient, including negative denominators.

Construction or proof. Resolve the instruction and operands with ramRead. For arithmetic, resolve the destination using the old memory, evaluate the indexed operation, and update exactly one cell. For branch, evaluate the indexed comparison. Errors remain distinct from normal halt.

Prerequisites. `RAMInstruction` (CN.0); `ramRead` (CN.0).

Source. [Shoup](#source-shoup), §3.2, printed pp.53–55.

API.

- `ramStep_halt`: Executing a halt instruction terminates successfully.
- `ramStep_empty`: An empty program fails at every counter.
- `ramStep_deterministic`: The partial semantics has a unique result at each configuration.

Tests.

- `test_ram_add` (computation): Literal 2+3 writes 5 to cell 0.
- `test_ram_floor` (non-example): Floor division 3/(−2) gives −2, not −1.
- `test_ram_halts` (degenerate): Halt is a successful termination rather than an error.

**Finite RAM execution — `RAMExecution`.** A RAMExecution P is a nonempty list of configurations (pc,m) beginning at counter zero. Each adjacent pair c,d satisfies ramStep P c=ok(some d); the final configuration satisfies ramStep P c=ok none. Its instruction count is the list length, including the final halt. The input-size and memory-magnitude bounds are separate obligations, not part of the raw execution type.

Construction or proof. Store a positive length T and configurations indexed by Fin T. Require counter zero initially, the transition equations for successive indices, and final halt.

Prerequisites. `ramStep` (CN.0).

Source. [Shoup](#source-shoup), §3.2, printed pp.53–55.

API.

- `RAMExecution.instructionCount_pos`: Every successful execution has at least its final halt instruction.
- `RAMExecution.first_pc`: The first counter is zero.
- `RAMExecution.final_halts`: The final configuration halts successfully.

Tests.

- `test_ram_execution_halt` (computation): The halt-only program has an execution of length one.
- `test_ram_execution_empty` (degenerate): The empty program has no successful execution.
- `test_ram_execution_loop` (non-example): An unconditional self-jump has no finite successful execution.

**Cost of a RAM execution — `bitCost`.** Given a successful execution e and an explicit nonnegative natural cost C(pc,m) for simulating each instruction in bits, bitCost C e is the sum of C over all executed configurations. The model accepts no default equality between this sum and the unit-cost instruction count.

Construction or proof. Sum the supplied cost over Fin e.length. The cost function must include address, operand and arithmetic costs of the chosen bit implementation.

Prerequisites. `RAMExecution` (CN.0).

Source. [Shoup](#source-shoup), §3.6, printed p.72.

API.

- `bitCost_one`: The constant unit charge recovers the instruction count.
- `bitCost_add`: Costs add pointwise.
- `bitCost_mono`: Pointwise larger instruction charges give a larger total.

Tests.

- `test_bitCost_zero` (degenerate): Zero charge gives total zero.
- `test_bitCost_two` (computation): Constant charge two gives twice the execution length.
- `test_bitCost_not_unit` (non-example): Constant charge two is strictly greater than the unit count for every successful execution.

**Bounded instruction costs give a total bound — `bitCost_le`.** If every executed configuration in e has bit-simulation charge at most B, then bitCost C e≤e.length·B. Instantiating B by a proved function of the largest address and operand width is necessary before transferring a RAM running-time estimate to bit complexity.

Construction or proof. Compare each summand with B and evaluate the finite constant sum.

Prerequisites. `bitCost` (CN.0).

Source. [Shoup](#source-shoup), §§3.2,3.6, pp.55,72.

**Polynomial magnitude bound for RAM memory — `PolynomialRAMMagnitude`.** PolynomialRAMMagnitude e n A b C means that every memory entry in every configuration of an execution e on n input cells has absolute value at most A·(n+e.length)^b+C. The parameters A,b,C are fixed independently of input in an algorithm-family theorem. This bounds stored integers, including indirect addresses; arbitrary large mathematical integers must be encoded as digit arrays.

Construction or proof. Express the uniform integer magnitude inequality. A single-trace bound does not prove an algorithm family has fixed constants or that multiplying machine words has constant bit cost.

Prerequisites. `RAMExecution` (CN.0).

Source. [Shoup](#source-shoup), §3.2, printed pp.54–55.

API.

- `polynomialRAMMagnitude_iff`: The predicate is the uniform bound on all stored values.
- `polynomialRAMMagnitude_mono_constant`: Increasing C preserves the bound.
- `polynomialRAMMagnitude_mono_input`: Increasing the input-size allowance preserves the bound.

Tests.

- `test_ram_zero_bound` (degenerate): An execution with all-zero memories has zero magnitude bound.
- `test_ram_magnitude_projection` (computation): Every selected cell satisfies the bound.
- `test_ram_nonzero_excluded` (non-example): A nonzero cell contradicts the all-zero bound.

### Exact algebraic presentations and comparison

**Isolated algebraic root certificate — `AlgebraicRootCertificate`.** An AlgebraicRootCertificate stores a nonzero polynomial f∈ℚ[X], two closed rational intervals R,I, and a proof that exactly one complex z satisfies f(z)=0 and Re(z)∈R, Im(z)∈I. Repeated polynomial roots are permitted: uniqueness concerns distinct roots, not their multiplicities. The exact carrier is the native relative algebraic closure of ℚ in ℂ; the finite polynomial and rectangle are presentation data, not a replacement field. The uniqueness proof is a separate checked obligation, not inferred from small diameter.

Construction or proof. Use native Polynomial and NonemptyInterval for finite data. Define the root-and-rectangle predicate explicitly and require unique existence. The certificate is a semantic specification; a terminating finite verifier needs a root-count certificate, specified as a separate construction requirement.

Prerequisites. Mathlib `algebraicClosure`; Mathlib `mem_algebraicClosure_iff`; Mathlib `NonemptyInterval`.

Source. [Arb](#source-arb), §§5–5.3, pp.7–9.

API.

- `AlgebraicRootCertificate.value`: Decode the unique root as a native complex algebraic number.
- `AlgebraicRootCertificate.value_spec`: The decoded value is a root lying in both displayed intervals.
- `AlgebraicRootCertificate.value_unique`: Any root in the rectangle equals the decoded value.

Tests.

- `test_algebraic_zero` (degenerate): X with both intervals [0,0] isolates zero.
- `test_algebraic_repeated` (computation): X² with the singleton zero rectangle is allowed.
- `test_algebraic_ambiguous` (non-example): X²−1 cannot isolate a unique root in [−2,2]×[0,0].

**Exact rational root presentation — `rationalRootCertificate`.** For r∈ℚ, rationalRootCertificate r consists of X−r, the singleton real interval [r,r] and singleton imaginary interval [0,0]. Its decoded value is the native embedding of r into the complex algebraic numbers. Integers and rationals themselves use native ℤ and normalized ℚ; no new arithmetic carrier is introduced.

Construction or proof. The linear polynomial has exactly the root r. The rational casts commute with addition and multiplication by the existing field homomorphism laws.

Prerequisites. `AlgebraicRootCertificate` (CN.0).

Source. [Arb](#source-arb), §§5–5.3, pp.7–9.

API.

- `rationalRootCertificate_value`: Decoding is the rational algebra map.
- `rationalRootCertificate_add`: Rational addition commutes with decoding.
- `rationalRootCertificate_mul`: Rational multiplication commutes with decoding.

Tests.

- `test_rational_zero` (degenerate): Zero decodes to zero.
- `test_rational_half` (computation): One half plus one third decodes as five sixths.
- `test_rational_distinct` (non-example): One half and one third have different decoded values.

**Addition of isolated algebraic numbers — `algebraic_add_certificate`.** Given isolated algebraic inputs a,b, there exists an isolated-root certificate whose value is their sum. An effective implementation must construct an annihilating polynomial, isolate its relevant distinct root and prove this value equation. The theorem specifies the exact operation; no running time or implemented checker is asserted.

Construction or proof. Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. Effective elimination and root-count witnesses are additional construction requirements.

Prerequisites. `AlgebraicRootCertificate` (CN.0); Mathlib `algebraicClosure`.

Source. [Arb](#source-arb), §§5–5.3, pp.7–9.

**Multiplication of isolated algebraic numbers — `algebraic_mul_certificate`.** Given isolated algebraic inputs a,b, there exists an isolated-root certificate whose value is their product. An effective implementation must construct an annihilating polynomial, isolate its relevant distinct root and prove this value equation. The theorem specifies the exact operation; no running time or implemented checker is asserted.

Construction or proof. Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. Effective elimination and root-count witnesses are additional construction requirements.

Prerequisites. `AlgebraicRootCertificate` (CN.0); Mathlib `algebraicClosure`.

Source. [Arb](#source-arb), §§5–5.3, pp.7–9.

**Inversion of a nonzero algebraic number — `algebraic_inv_certificate`.** Given isolated algebraic inputs a with nonzero decoded value, there exists an isolated-root certificate whose value is their inverse. An effective implementation must construct an annihilating polynomial, isolate its relevant distinct root and prove this value equation. The theorem specifies the exact operation; no running time or implemented checker is asserted.

Construction or proof. Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. Effective elimination and root-count witnesses are additional construction requirements.

Prerequisites. `AlgebraicRootCertificate` (CN.0); Mathlib `algebraicClosure`.

Source. [Arb](#source-arb), §§5–5.3, pp.7–9.

**Equality of isolated algebraic numbers — `algebraicEqual`.** algebraicEqual compares the decoded native algebraic numbers of two certified isolated-root presentations. Its Boolean answer is true exactly when the values are equal. Finite verification uses polynomial gcd and a common-root isolation argument; overlapping rectangles alone do not prove equality, and disjoint rectangles are only a sufficient inequality test.

Construction or proof. Compare the annihilating polynomials and isolate their common roots. Terminating certified root-count and separation algorithms are required proof inputs. The result is specified independently of the discovery algorithm.

Prerequisites. `AlgebraicRootCertificate` (CN.0).

Source. [Arb](#source-arb), §§5–5.3, pp.7–9.

API.

- `algebraicEqual_iff`: Acceptance is equality in the native relative algebraic closure.
- `algebraicEqual_refl`: Every presentation equals itself.
- `algebraicEqual_symm`: The verdict is symmetric.

Tests.

- `test_algebraic_equal_zero` (degenerate): Two rational zero inputs compare equal.
- `test_algebraic_equal_fraction` (computation): Different rational expressions for the same number compare equal.
- `test_algebraic_unequal_fraction` (non-example): One half and one third compare unequal.

### Finite p-adic presentations

**Canonical finite p-adic approximation — `PadicApproximation`.** For prime p, PadicApproximation p stores integers N,v and a natural mantissa s. It is either (N,N,0), or v<N with 0<s<p^(N−v) and p∤s. Its centre is p^v·s∈ℚ and its denotation is {x∈ℚ_p | ‖x−centre‖≤p^(−N)}. N is absolute precision and N−v is relative precision in the nonzero case. Zero mantissa means the entire ball p^Nℤ_p, not the exact number zero.

Construction or proof. Store the two normalization alternatives. Use a rational centre and the native p-adic field/norm to define the closed ball. Prime p is a hypothesis of semantic theorems; syntax is parameterized by p.

Prerequisites. Mathlib `padicValRat`; Mathlib `PadicInt.toZModPow`.

Source. [CarusoPublished](#source-carusopublished), §2.1.1, pp.17–19.

API.

- `PadicApproximation.center`: The exact rational centre is p^v s.
- `PadicApproximation.denotation`: The ball has radius p^(−N) in the native p-adic field.
- `PadicApproximation.center_mem`: The centre always belongs to its ball.
- `PadicApproximation.zero_mem_iff`: Zero belongs precisely to the zero-mantissa ball.

Tests.

- `test_padic_zero_ball` (degenerate): The canonical zero ball at precision N has valuation N.
- `test_padic_negative_precision` (computation): The tuple (N,v,s)=(0,−1,1) is permitted at p=3 and has centre 1/3.
- `test_padic_nonunit_mantissa` (non-example): A nonzero mantissa divisible by p cannot be canonical.

## CN.1: Primality and factorization certificates

Pratt and Pocklington verification certify primality unconditionally. Miller–Rabin specifies a distinct probabilistic rejection test, and AKS fixes one deterministic algorithm before assigning its cost. Integer factorization reuses the native exact factorization theorem; the new data bind discovered factors to recursive primality evidence. Finite-field factor search remains FF.3. Rational factorization owns the denominator/content bridge, finite recombination and its termination.

Construction requirements. Prove the strong-liar bound through cyclic prime-power kernel counts, the CRT two-fibre estimate and the consequence of Korselt's criterion that an odd Carmichael composite has at least three prime divisors (Shoup Theorem 10.3, pp.309–312). Independent repetition uses the uniform product sample space. For AKS, supply the substitution and multiplicative-congruence-set lemmas in the quotient algebra, evaluation at a primitive r-th root and both image-cardinality estimates: the upper estimate n^(2 floor(sqrt(t))) and the lower estimate 2^min(t,ell)−1. Use Shoup Lemmas 21.6–21.11, pp.550–558, prove r=O(len(n)^5), and account for his O(len(n)^16.5) RAM estimate separately from any bit simulation. Establish the self-delimiting Pratt encoding comparison and a charged finite verifier; certificate existence does not bound discovery of factors of n−1. For rational polynomials, clear denominators, certify integer content, remove repeated factors, choose a degree-preserving square-free modular reduction, invoke FF.3, lift to a proved coefficient bound, and enumerate exact recombinations with termination. Irreducibility is proved by exclusion of all possible bounded factors; do not assume that every rational irreducible polynomial admits an irreducible reduction at a prime. Shoup §§16.5–16.6, pp.439–441 supplies the exact extension-field context; the finite search/termination proof is a construction requirement, not a theorem attributed to those sections.

### Pratt certificates and their size

**Recursive Pratt certificate — `PrattCertificate`.** A PrattCertificate is either the leaf two or a node (n,a,children), where n and a are natural numbers and children is a finite list of Pratt certificates. Its value is 2 at the leaf and n at a node. Repeated children encode repeated prime factors of n−1. This raw syntax contains no unverified primality proof.

Construction or proof. Define a finite inductive tree with the leaf and node constructors. Define value by pattern matching.

Prerequisites. Mathlib `lucas_primality`; Mathlib `reverse_lucas_primality`; Mathlib `Nat.primeFactorsList`.

Source. [PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.

API.

- `PrattCertificate.value_two`: The leaf has value 2.
- `PrattCertificate.value_node`: A node stores its claimed value n.
- `PrattCertificate.node_injective`: Two nodes are equal precisely when all their raw data are equal.

Tests.

- `test_pratt_leaf` (degenerate): The base leaf represents 2.
- `test_pratt_three` (computation): The candidate (3,2,[two]) represents 3.
- `test_pratt_untrusted` (non-example): A malformed node may represent 1; existence of raw syntax is not primality.

**Pratt certificate checker — `PrattCertificate.check`.** The checker accepts the leaf two. It accepts node(n,a,cs) iff n≥3, 0<a<n, every child checks, the product of child values is n−1, a^(n−1) mod n=1, and a^((n−1)/q) mod n≠1 for every child value q. Empty products are 1. The checker terminates by recursion on the finite tree.

Construction or proof. Recursively check the children; use exact natural modular powers and products. No probable-prime predicate enters the checker.

Prerequisites. `PrattCertificate` (CN.1); Mathlib `lucas_primality`.

Source. [PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.

API.

- `PrattCertificate.check_two`: The leaf is accepted.
- `PrattCertificate.check_node_iff`: Acceptance is exactly the conjunction of recursive, product and modular conditions.
- `PrattCertificate.check_value_ge_two`: Acceptance excludes 0 and 1.

Tests.

- `test_pratt_check_three` (computation): Witness 2 with the factor 2 certifies 3.
- `test_pratt_check_one` (degenerate): The malformed value-one node is rejected.
- `test_pratt_check_nine` (non-example): The candidate for 9 with three factors 2 and witness 2 is rejected.

**Soundness of Pratt certificates — `PrattCertificate.sound`.** For every finite Pratt certificate c, c.check=true implies Nat.Prime(c.value).

Construction or proof. Induct on the certificate tree. The children are prime by induction. Every prime divisor of the product n−1 occurs among the child values, so the checked modular inequalities supply all hypotheses of lucas_primality.

Prerequisites. `PrattCertificate.check` (CN.1); Mathlib `lucas_primality`; Mathlib `Nat.prime_of_mem_primeFactorsList`.

Source. [PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.

**Completeness of Pratt certificates — `PrattCertificate.complete`.** Every prime n is the value of a Pratt certificate accepted by the checker.

Construction or proof. Use strong induction on n, with leaf 2. For n≥3, reverse_lucas_primality supplies a Lucas witness; take its representative in 1,…,n−1. Factor n−1 using primeFactorsList. Every factor q≤n−1<n has a recursively accepted certificate.

Prerequisites. `PrattCertificate.check` (CN.1); Mathlib `reverse_lucas_primality`; Mathlib `Nat.primeFactorsList`; Mathlib `Nat.prod_primeFactorsList`; Mathlib `Nat.prime_of_mem_primeFactorsList`.

Source. [PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.

**Bit size of a Pratt tree — `prattBitSize`.** prattBitSize assigns one tag bit to the leaf. A node contributes 1 plus the binary lengths of n, a and its child count, plus the sizes of the children. Binary length is log₂(x)+1, including one bit for zero. A self-delimiting serialization has size at most a fixed constant multiple of this measure; that encoding comparison is a separate obligation.

Construction or proof. Recurse over the existing finite tree; retain repeated factors and charge every occurrence.

Prerequisites. `PrattCertificate` (CN.1).

Source. [PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.

API.

- `prattBitSize_two`: The leaf costs one bit.
- `prattBitSize_node`: The charge is the sum of header lengths and all child charges.
- `prattBitSize_pos`: Every finite tree has positive size.

Tests.

- `test_size_leaf` (degenerate): The leaf has size one.
- `test_size_three` (computation): The tree certifying 3 has size seven.
- `test_size_repeated` (non-example): Repeated children are charged repeatedly, not silently shared as a DAG.

**Quadratic bit-size bound for Pratt certificates — `pratt_small_certificate`.** There is an absolute natural constant C such that every prime n has an accepted Pratt tree c of value n and prattBitSize(c)≤C·(log₂(n)+1)². This is an existence bound for certificates, not a bound on the cost of discovering the factorization of n−1.

Construction or proof. Induct using the prime factors of n−1 with multiplicity, as in the source proof-length bound. Bound every header by a constant times the binary length of n. Sum the recursive charges. The translation of the source proof lines to this tree measure is an additional proof requirement.

Prerequisites. `prattBitSize` (CN.1); `PrattCertificate.complete` (CN.1).

Source. [PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.

### Miller–Rabin and independent sampling

**Strong Miller–Rabin liar — `StrongLiar`.** For n,a∈ℕ write h=v₂(n−1) and t=(n−1)/2^h. StrongLiar n a means n>1 is odd, 0<a<n, and in ZMod n either a^t=1 or a^(t·2^j)=−1 for some j<h. The sample space is the nonzero residues 1,…,n−1; it is not restricted to units. Guards reject n=0,1 and all even n, which the primality wrapper handles separately.

Construction or proof. Use the multiplicity of 2 in n−1 via Nat.factorization and exact exponentiation in ZMod n.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [Shoup](#source-shoup), §10.2, pp.308–310.

API.

- `strongLiar_iff`: The defining modular alternatives use the odd part of n−1.
- `strongLiar_coprime`: A strong liar is coprime to n, although the sampling space contains nonunits.
- `strongLiar_one`: The base 1 passes for every odd n>1.

Tests.

- `test_strongLiar_prime` (computation): Base 3 passes for 7.
- `test_strongLiar_one_input` (degenerate): Input 1 is rejected.
- `test_strongLiar_composite` (non-example): 2047 is composite but passes the strong base-2 test.

**Prime inputs pass every admissible base — `strongLiar_of_prime`.** If n is an odd prime and 0<a<n, then StrongLiar n a.

Construction or proof. Fermat gives a^(n−1)=1. In the repeated-squaring chain in the field ZMod n, the predecessor of the first 1 is either absent (a^t=1) or is −1, since the only square roots of 1 are ±1.

Prerequisites. `StrongLiar` (CN.1).

Source. [Shoup](#source-shoup), Theorem 10.3, prime-input case, p.309.

**Miller–Rabin strong-liar bound — `strongLiar_card_le`.** For odd composite n>1, the number of bases a with 0<a<n and StrongLiar n a is at most (n−1)/4. Equivalently, four times this cardinality is at most n−1.

Construction or proof. Split prime powers from numbers with at least two distinct prime factors. On prime powers use the cyclic-unit power-map kernel count; on at least two factors apply the CRT and the common 2-adic exponent to bound the two permitted fibres. The cyclic kernel, CRT fibre count, and Carmichael-at-least-three-primes steps are separate proof requirements.

Prerequisites. `StrongLiar` (CN.1).

Source. [Shoup](#source-shoup), Theorem 10.3, pp.309–312.

**Error bound for independent Miller–Rabin rounds — `millerRabin_rounds_bound`.** For odd composite n>1 and k∈ℕ, among all (n−1)^k equally likely tuples of bases in {1,…,n−1}, at most (n−1)^k/4^k tuples pass every strong test. Equivalently, 4^k times the number of accepting tuples is at most (n−1)^k. This counting formulation is the uniform independent product distribution; it makes no promise for correlated or adversarially chosen bases.

Construction or proof. An accepting tuple is a function into the strong-liar subset, so its cardinality is the kth power of the one-round cardinality. Raise the one-round bound to k.

Prerequisites. `strongLiar_card_le` (CN.1).

Source. [Shoup](#source-shoup), §10.2 algorithm and Theorem 10.3, pp.309–312.

### The fixed AKS algorithm

**AKS order parameter — `aksParameter`.** For n>1, aksParameter n is the least r>1 such that gcd(n,r)>1 or gcd(n,r)=1 and the multiplicative order of n modulo r is greater than 4·len(n)², where len(n)=floor(log₂n)+1. Set aksParameter n=0 for n≤1. The choice is deterministic and finite because r=n is always admissible.

Construction or proof. Search r=2,…,n in increasing order using exact gcd and modular-power computations. The candidate n terminates the search.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [Shoup](#source-shoup), §21.2, pp.549–550; Figure 21.1, p.550.

API.

- `aksParameter_valid`: The output is between 2 and n and satisfies the exact order-or-gcd disjunction.
- `aksParameter_minimal`: No smaller r>1 satisfies the search criterion.
- `aksParameter_small`: Inputs 0 and 1 use sentinel zero.

Tests.

- `test_aksParameter_two` (computation): Input 2 has parameter 2.
- `test_aksParameter_nine` (computation): Input 9 has parameter 3, exposing a factor.
- `test_aksParameter_one` (degenerate): Input 1 uses zero and is rejected by the primality wrapper.

**AKS polynomial congruences — `AKSIdentities`.** AKSIdentities n r ℓ means that for each integer j with 1≤j≤ℓ, (X+j)^n and X^n+j have the same remainder on division by X^r−1 in (ZMod n)[X]. The definition is a finite family of decidable polynomial identities, separate from claims that the coefficient ring is a field.

Construction or proof. Use Polynomial.modByMonic over the commutative ring ZMod n. The algorithm supplies r>1, so the modulus is monic of degree r.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [Shoup](#source-shoup), §21.2, pp.549–550; Figure 21.1, p.550.

API.

- `aksIdentities_zero`: The empty check range holds.
- `aksIdentities_mono`: Passing a larger check range implies passing a smaller one.
- `aksIdentities_iff`: The predicate is exactly the finite remainder comparison.

Tests.

- `test_aksIdentities_prime` (computation): The characteristic-5 identity passes at every r and every check range.
- `test_aksIdentities_vacuous` (degenerate): With no bases, even input 9 passes the identity predicate.
- `test_aksIdentities_not_prime` (non-example): The empty identity test is not a primality criterion.

**Shoup’s AKS algorithm — `aks`.** aks n rejects n≤1 and every perfect power a^b with a,b>1. For the remaining n let r=aksParameter n. Return true if r=n; reject if gcd(n,r)>1; otherwise return whether AKSIdentities n r (2·len(n)·floor(√r)+1) holds. This declaration fixes the variant before any complexity statement.

Construction or proof. Decide perfect-power membership using a,b≤n. Execute the bounded parameter search. Decide the finite polynomial equalities using exact coefficients modulo n.

Prerequisites. `aksParameter` (CN.1); `AKSIdentities` (CN.1).

Source. [Shoup](#source-shoup), §21.2, pp.549–550; Figure 21.1, p.550.

API.

- `aks_small`: Inputs at most 1 are rejected.
- `aks_perfect_power`: Nontrivial perfect powers are rejected before the polynomial checks.
- `aks_check_iff`: For a non-power input with coprime parameter r<n, acceptance is exactly the prescribed identity test.

Tests.

- `test_aks_two` (computation): 2 is accepted.
- `test_aks_one` (degenerate): 1 is rejected.
- `test_aks_nine` (non-example): 9 is rejected as a perfect power.

**Correctness of the AKS algorithm — `aks_correct`.** For every natural n, aks n=true iff n is prime.

Construction or proof. Prime inputs satisfy the polynomial identities by Frobenius. For a composite that reaches the final branch choose a prime p dividing n; the parameter search gives p>r and gcd(n,r)=1. Shoup’s quotient-algebra endomorphisms, upper bound on the evaluation image and lower bound from products of distinct linear factors contradict the order and length bounds. Those nonroutine algebraic estimates are separate proof requirements.

Prerequisites. `aks` (CN.1); `AKSIdentities` (CN.1); `aksParameter` (CN.1).

Source. [Shoup](#source-shoup), §21.2 and Lemmas 21.6–21.11, pp.549–558.

### Partial-factor primality certificates

**Pocklington prime-divisor congruence — `pocklington_prime_divisor`.** Let n>1, F>1 and F∣n−1. Suppose that for each prime q∣F there is an integer a with a^(n−1)≡1 modulo n and gcd(a^((n−1)/q)−1,n)=1. Then every prime divisor p of n satisfies F∣p−1. The witness a may depend on q; F and (n−1)/F need not be coprime.

Construction or proof. For every prime-power q^e∣F, the order of a modulo p divides n−1 but does not divide (n−1)/q. Thus its q-adic exponent is at least e, and q^e divides p−1. Combine these prime powers.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.

**Pocklington primality criterion — `pocklington_prime`.** Under the prime-divisor criterion’s hypotheses, if F²>n then n is prime.

Construction or proof. If n were composite it would have a prime divisor p≤√n<F. The preceding congruence F∣p−1 contradicts 0<p−1<F.

Prerequisites. `pocklington_prime_divisor` (CN.1).

Source. [Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.

**Finite Pocklington certificate — `PocklingtonCertificate`.** PocklingtonCertificate n stores a list of Pratt trees and one integer witness for each occurrence. Its certified part F is the product of the child values. The checker requires n>1, F>1, F∣n−1, n<F², all children accepted, and for each (q,a), a^(n−1)≡1 mod n and gcd(a^((n−1)/q)−1,n)=1. Repeated q encode multiplicity. The uncatalogued cofactor is allowed to remain unfactored.

Construction or proof. Represent the entries as a finite list of pairs. Every prime divisor of F is a certified child, so the list supplies the universal witnesses needed by the Pocklington criterion.

Prerequisites. `PrattCertificate.check` (CN.1); `PrattCertificate.sound` (CN.1); `pocklington_prime` (CN.1).

Source. [Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.

API.

- `PocklingtonCertificate.factor`: F is the product of certified child values.
- `PocklingtonCertificate.check`: Execute all bounds, divisibility, recursive and gcd tests.
- `PocklingtonCertificate.check_iff`: No prime-divisor quantification remains in the checker.

Tests.

- `test_pocklington_seventeen` (computation): F=8 with three factors 2 and witness 3 certifies 17.
- `test_pocklington_empty` (degenerate): An empty factor list is rejected.
- `test_pocklington_insufficient` (non-example): A single factor 2 cannot certify 17 because 2²≤17.

**Soundness of finite Pocklington certificates — `PocklingtonCertificate.sound`.** If the finite Pocklington checker accepts n, then n is prime.

Construction or proof. Pratt soundness makes every child value prime. Every prime divisor of F occurs in the list, so select its recorded integer witness and apply the Pocklington criterion.

Prerequisites. `PocklingtonCertificate` (CN.1); `PrattCertificate.sound` (CN.1); `pocklington_prime` (CN.1).

Source. [Thery](#source-thery), Theorem 6.1 and corrected Theorem 6.2, p.9.

### Integer and polynomial factorization

**Integer factorization with prime certificates — `IntegerFactorCertificate`.** An IntegerFactorCertificate stores a sign ε∈{−1,1} and a list of raw Pratt certificates. Its value is ε times the product of their natural values, viewed in ℤ. It checks against z precisely when every Pratt tree checks and this product equals z. Units ±1 have an empty factor list. Zero has no accepted certificate, and repeated primes remain repeated list entries.

Construction or proof. Use a Bool for the sign and a finite list of existing Pratt trees. Decode by an integer product and check each tree. This certifies a discovered factorization independently of the algorithm that found it.

Prerequisites. `PrattCertificate.check` (CN.1); `PrattCertificate.sound` (CN.1); Mathlib `Nat.primeFactorsList`; Mathlib `Nat.prod_primeFactorsList`.

Source. [PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.

API.

- `IntegerFactorCertificate.value`: Decode the signed product.
- `IntegerFactorCertificate.check`: Check exact equality and all prime certificates.
- `IntegerFactorCertificate.check_iff`: Acceptance is the product equation together with acceptance of all prime witnesses.

Tests.

- `test_integer_factor_unit` (degenerate): The negative sign and empty list certify −1.
- `test_integer_factor_twelve` (computation): Two copies of 2 and the accepted certificate for 3 certify 12.
- `test_integer_factor_zero` (non-example): No zero product certificate is accepted.

**Soundness of integer factorization certificates — `IntegerFactorCertificate.sound`.** An accepted certificate for z gives z≠0 and a list of prime absolute factors whose signed product is z. Thus every prime divisor of |z| occurs among its child values; no completeness inference is made from a partial list.

Construction or proof. Apply Pratt soundness to each child. Prime factors are positive and nonzero, so their signed product is nonzero. Euclid’s lemma identifies prime divisors of the product.

Prerequisites. `IntegerFactorCertificate` (CN.1); `PrattCertificate.sound` (CN.1).

Source. [PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.

**Every nonzero integer admits a factor certificate — `IntegerFactorCertificate.complete`.** Every nonzero integer z admits an accepted IntegerFactorCertificate. Use the native primeFactorsList of |z| and Pratt completeness, retaining the sign of z.

Construction or proof. The native product theorem reconstructs the positive absolute value. Each list element is prime and therefore has an accepted Pratt tree. Restore the sign.

Prerequisites. `IntegerFactorCertificate` (CN.1); `PrattCertificate.complete` (CN.1); Mathlib `Nat.prod_primeFactorsList`; Mathlib `Nat.prime_of_mem_primeFactorsList`.

Source. [PrattNotes](#source-prattnotes), pp.1–4, formal proof system and its length bound.

**Transport of certified finite-field factors — `transport_finite_factorization`.** Let e:F≃+*K be a certified change from a computable finite-field presentation to the intrinsic finite field. For nonzero f=c∏g_i with c≠0 and all g_i monic irreducible, mapping coefficients by e yields map(e,f)=e(c)∏map(e,g_i), again with monic irreducible factors. The FF.3 checker and its search algorithm supply the data; CN.1 only checks the presentation boundary and reconstructs the intrinsic factorization.

Construction or proof. Import the accepted nonzero finite-field certificate contract. A field isomorphism preserves leading coefficients, products and irreducibility. Check the presentation’s explicit inverse before transport.

Prerequisites. **FiniteFieldsAndCharacterSums, FF.3** (factorization certificate sound); **FiniteFieldsAndCharacterSums, FF.0** (presentation change isomorphism).

Source. [Shoup](#source-shoup), Theorem 19.14, pp.515–516; Chapter 20.

**Rational polynomial factor certificate — `RationalFactorCertificate`.** For f∈ℚ[X], RationalFactorCertificate f consists of a nonzero rational leading factor c, a finite list of monic polynomials, proofs that each is irreducible over ℚ, and the exact identity f=c∏g_i. Multiplicity is represented by repeated factors. The definition uses actual irreducibility proofs; a CAS assertion or irreducibility modulo a single prime without a valid lifting criterion is insufficient. For f∈ℤ[X], certify its coefficientwise rational image and separately retain integer content and primitive-factor normalization.

Construction or proof. Store finite polynomial data and exact proof obligations. This wraps an output of discovery, not a new factorization theory. The factory must obtain each rational irreducibility proof by a justified criterion, with exhaustive modular recombination when one-prime irreducibility is unavailable.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [Shoup](#source-shoup), §16.5–16.6, pp.439–441.

API.

- `RationalFactorCertificate.reconstruct`: The certificate reconstructs f exactly.
- `RationalFactorCertificate.input_nonzero`: No certificate exists for the zero polynomial.
- `RationalFactorCertificate.leadingCoeff`: The scalar equals the leading coefficient of f because every listed factor is monic.

Tests.

- `test_rational_factor_one` (degenerate): The unit polynomial uses scalar 1 and an empty list.
- `test_rational_factor_repeated` (computation): (X−1)² has the repeated linear list [X−1,X−1].
- `test_rational_factor_zero` (non-example): The zero polynomial has no such factor certificate.

**Certified rational polynomial factorization — `certifiedRationalFactorization`.** For nonzero f∈ℚ[X], certifiedRationalFactorization returns a RationalFactorCertificate f. Clear denominators and content, separate repeated factors, factor a suitable finite-field reduction via FF.3, lift factors to a precision exceeding a proved coefficient bound, and perform exhaustive exact recombination. The result is deterministic once every search branch and stopping bound is fixed; a randomized finite-field search may discover candidates but cannot weaken the final certificate checks.

Construction or proof. The semantic result type requires exact reconstruction and genuine rational irreducibility. Prove modular lifting and terminating bounded recombination; single-prime irreducibility is a sufficient shortcut only when its hypotheses hold, not a complete general algorithm.

Prerequisites. `RationalFactorCertificate` (CN.1); **FiniteFieldsAndCharacterSums, FF.3** (hensel lifting modulo prime powers); `transport_finite_factorization` (CN.1).

Source. [Shoup](#source-shoup), §16.5–16.6, pp.439–441.

API.

- `certifiedRationalFactorization_product`: The returned factors reconstruct f.
- `certifiedRationalFactorization_irreducible`: Every returned factor is monic and irreducible over ℚ.
- `certifiedRationalFactorization_scalar`: The scalar is the input leading coefficient.

Tests.

- `test_factorization_constant` (degenerate): A nonzero constant produces an empty irreducible-factor list.
- `test_factorization_repeated` (computation): (X−1)² produces two copies of X−1.
- `test_factorization_Q_not_C` (non-example): X²+1 stays irreducible over ℚ even though it splits over ℂ.

## CN.2: Certified computations in number fields

All coordinates refer to the native number field and its native ring of integers. A multiplication-stable full lattice is an order; maximality is proved separately. Improve an arbitrary full order by intrinsic p-radical multiplier steps, including primes dividing a power-basis index. The class/unit algorithm checks relation completeness and the torsion-aware regulator index jointly. First-order Newton data retain their sign, normalization and separability conditions.

Construction requirements. For multiplier improvement, prove finite-index p-primary saturation, containment of the integral multiplier order in (1/p)R, the radical-extension/intersection identity, and the strict decrease of the p-index under enlargement (Stevenhagen Proposition 9.3, p.235). The nilpotence criterion needs the multiplication-operator bound x^dim(A)=0 for nilpotent x; Frobenius linearity alone is insufficient. CA.3 must supply a finite-field kernel basis, with spanning, soundness and the native matrix/kernel comparison, in addition to its integer HNF/SNF contracts. Factor the discriminant using CN.1, check all critical primes and prove termination using the native index–discriminant identity. Prime discovery at index divisors uses the reduced maximal-order quotient algebra, primitive idempotents and explicit finite-field quotient maps; assemble ramification exponents and reconstruct pO_K. For classes and units, enumerate the complete Minkowski factor base, certify principal relation witnesses, compute the quotient index via CA.3, and extract units from the integer relation kernel. Certify log/regulator determinant enclosures and the analytic hR lower bound with explicit tail estimates before using the stopping inequality (Stevenhagen §12, pp.248–252); any GRH speedup changes only its stated conditional estimate. For Newton factors, prove admissible-development invariance and product/factorization theorems, factor square-free residual data and compare intrinsic ramification/residue degrees. Repeated residual factors require higher-order refinement or the independent maximal-order algorithm, not the first-order irreducibility criterion (Guàrdia–Montes–Nart Theorems 1.15, 1.19 and Corollary 1.20, pp.11–15). Finite local expansions choose a residue section, extract digits, prove the remainder estimate and termination, and compare changes of embedding/uniformizer. LocalFieldsRamification supplies the field and reduction, not that extraction theorem.

### Full orders and multiplier improvement

**Finite order basis certificate — `OrderBasisCertificate`.** For a number field K and n∈ℕ, an OrderBasisCertificate stores b₀,…,bₙ₋₁∈K forming a ℚ-basis, integer coordinates for 1, and integer structure constants b_i b_j=Σ_k m_ijk b_k. These finite identities prove that the integer span of b is a full order. The certificate does not assert maximality.

Construction or proof. Check rational linear independence and spanning, the coordinate equation for 1, and all n² multiplication equations. The integer span is then closed under multiplication. CA.3 normal forms supply coordinate reconstruction.

Prerequisites. **ClassicalArithmeticCompletion, CA.3** (hermite normal form certificate).

Source. [NumberRings](#source-numberrings), §9, pp.233–235.

API.

- `OrderBasisCertificate.order`: Package the integer span as a native ℤ-subalgebra of K.
- `OrderBasisCertificate.mem_order`: Membership is existence of integer coordinates in b.
- `OrderBasisCertificate.coordinates_unique`: Integer coordinates in the basis are unique.

Tests.

- `test_order_Q` (computation): The singleton basis 1 presents ℤ in ℚ.
- `test_order_rank_zero` (degenerate): A number field has no rank-zero order certificate.
- `test_order_half` (non-example): The singleton rational basis 1/2 is not closed under multiplication over ℤ.

**Order coordinates imply integrality — `OrderBasisCertificate.isIntegral`.** Every element in the order of an OrderBasisCertificate is integral over ℤ.

Construction or proof. Its multiplication matrix in the displayed integer basis has integral entries. Cayley–Hamilton supplies a monic annihilating polynomial. The intrinsic finite-algebra integrality theorem belongs to the number-field/library supplier; this declaration specializes it to checked coordinates.

Prerequisites. `OrderBasisCertificate` (CN.2).

Source. [NumberRings](#source-numberrings), §2, pp.212–213, Theorem 2.2; §7, p.226; §9, pp.233–235.

**Multiplier ring of an integral lattice — `multiplierRing`.** For a field K of characteristic zero and an integer submodule I⊆K, multiplierRing I is the ℤ-subalgebra {x∈K | xI⊆I}. This definition also permits I=0, in which case the multiplier ring is all of K. Finiteness and the full-lattice condition are hypotheses of the maximal-order theorems, not hidden in this carrier.

Construction or proof. The stabilizing condition is closed under addition, multiplication and negation. Every integer scalar stabilizes I. Package the subset as the existing Subalgebra ℤ K type.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [NumberRings](#source-numberrings), §9, Proposition 9.3, pp.234–235.

API.

- `mem_multiplierRing`: Membership means preservation of every lattice element by multiplication.
- `multiplierRing_zero`: The zero lattice has the whole field as multiplier ring.
- `multiplierRing_smul`: Multiplying a lattice by a nonzero field element does not change its multiplier ring.

Tests.

- `test_multiplier_zero` (degenerate): The zero lattice must not be treated as a finite order.
- `test_multiplier_Z` (compatibility): The lattice generated by 1 in ℚ has only integral multipliers.
- `test_multiplier_half` (non-example): 1/2 does not stabilize the lattice ℤ inside ℚ.

**Local maximality of an order — `IsPMaximal`.** For a ℤ-subalgebra R of a characteristic-zero field K and a prime p, IsPMaximal R p means that for every x∈K integral over ℤ there is an integer a not divisible by p with a·x∈R. For a full finite order R this says its localization at p equals that of the maximal order, or equivalently p does not divide its index. The predicate is meaningful at arbitrary p, but arithmetic theorems assume primality.

Construction or proof. Express equality after localization by clearing a denominator prime to p. Keep the intrinsic integral closure as the target.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [NumberRings](#source-numberrings), §9, pp.233–235.

API.

- `isPMaximal_iff`: Local maximality is the stated prime-to-p denominator-clearing property.
- `isPMaximal_mono`: Enlarging R preserves local maximality.
- `isPMaximal_top`: The whole field satisfies the predicate at primes; finiteness must be imposed separately for orders.

Tests.

- `test_pMaximal_Z` (computation): The usual copy of ℤ in ℚ is p-maximal at every prime.
- `test_pMaximal_one` (non-example): At p=1 no denominator passes, so the predicate is false.
- `test_pMaximal_overorder` (compatibility): Every overorder of a p-maximal order remains p-maximal.

**Nilradical from a Frobenius kernel — `nilpotent_iff_frobenius_zero`.** Let A be a finite-dimensional commutative algebra over ZMod p, p prime, and let p^k≥dim A. Then x is nilpotent iff x^(p^k)=0. Consequently the nilradical is the kernel of the kth iterate of the Frobenius algebra endomorphism, computable by linear algebra in any supplied basis.

Construction or proof. A nilpotent multiplication operator on the d-dimensional space has nilpotency exponent at most d. Thus x^d=0 and x^(p^k)=0. The reverse implication is the definition of nilpotence. The semantic kernel is native linear algebra. A certified finite-field kernel-basis algorithm and its basis-to-matrix comparison are required from CA.3, separately from its integer Smith/Hermite interfaces.

Prerequisites. Mathlib `FiniteField.frobeniusAlgHom`; Mathlib `Ideal.radical`.

Source. [NumberRings](#source-numberrings), §9, pp.233–234.

**The p-radical in field coordinates — `pRadicalLattice`.** For a full order R⊆K and prime p, pRadicalLattice R p is the integer lattice of x∈R with x^k∈pR for some k≥1. It is the inverse image of the nilradical of R/pR. The exponent excludes the empty-power convention. This is a coordinate adapter for the native ideal radical, not a second definition of radical.

Construction or proof. Take the native radical of pR in R and map its underlying integer module through the inclusion R→K. Finite-field linear algebra computes it from the Frobenius kernel.

Prerequisites. Mathlib `Ideal.radical`; `nilpotent_iff_frobenius_zero` (CN.2); **ClassicalArithmeticCompletion, CA.3** (hermite normal form certificate).

Source. [NumberRings](#source-numberrings), Equation (9-2) and following paragraph, pp.234–235.

API.

- `mem_pRadicalLattice`: Membership is a positive power in pR.
- `pRadicalLattice_contains_p`: The element p belongs to the p-radical.
- `pRadicalLattice_mul`: The lattice is stable under multiplication by its order.

Tests.

- `test_pRadical_zero` (degenerate): For a characteristic-zero field the zero-radical of an order is zero.
- `test_pRadical_Z` (computation): The p-radical of ℤ inside ℚ is pℤ for prime p.
- `test_pRadical_one_not` (non-example): 1 does not belong to the p-radical of ℤ at a prime.

**Multiplier criterion for p-maximality — `pRadical_multiplier_eq_iff`.** For a full order R presented by an OrderBasisCertificate and a prime p, the multiplier ring of pRadicalLattice R p equals R iff IsPMaximal R p. In the nonmaximal case it is a strictly larger integral overorder contained in (1/p)R; its quotient over R is p-primary.

Construction or proof. Apply Stevenhagen Proposition 9.3 to the p-primary saturation. If the order is already p-maximal, the multiplier ring lies between R and its p-primary saturation, forcing equality. Otherwise Proposition 9.3 supplies a multiplier outside R. Finite-lattice coordinate conversion is provided by CA.3.

Prerequisites. `OrderBasisCertificate` (CN.2); `OrderBasisCertificate.isIntegral` (CN.2); `pRadicalLattice` (CN.2); `multiplierRing` (CN.2); `IsPMaximal` (CN.2).

Source. [NumberRings](#source-numberrings), Proposition 9.3 and its proof, p.235.

**Integral basis certificate — `IntegralBasisCertificate`.** An IntegralBasisCertificate K is an OrderBasisCertificate of some finite rank together with a proof that its order is exactly the set of elements integral over ℤ. Thus its basis spans the native ring of integers, not merely a suborder. A practical finite certificate proves this maximality by checking the p-radical multiplier criterion at every prime whose square divides the starting discriminant.

Construction or proof. Store the full order basis and the exact maximality equation. The finite local checks are converted to this equation by the discriminant-index theorem; the resulting basis transports to the native RingOfIntegers carrier.

Prerequisites. `OrderBasisCertificate` (CN.2); `OrderBasisCertificate.isIntegral` (CN.2); `pRadical_multiplier_eq_iff` (CN.2); `IntegerFactorCertificate` (CN.1).

Source. [NumberRings](#source-numberrings), §9, pp.233–235.

API.

- `IntegralBasisCertificate.mem_iff`: The certificate identifies the order with the integral closure.
- `IntegralBasisCertificate.rank_eq`: The rank is the rational field degree.
- `IntegralBasisCertificate.integerBasis`: Transport the checked coordinates to a native ℤ-basis of the ring of integers.

Tests.

- `test_integral_basis_Q` (computation): ℚ has an integral basis certificate of rank one.
- `test_integral_basis_rank_zero` (degenerate): A certificate has positive rank.
- `test_integral_basis_half` (non-example): The rational 1/2 is excluded by the certificate for ℚ.

**Certified integral-basis algorithm — `integralBasisAlgorithm`.** Given a full order basis in K, integralBasisAlgorithm returns an IntegralBasisCertificate K for an overorder containing the input. Factor the absolute discriminant exactly, compute p-radicals and multiplier overorders at all critical primes, and stop each local loop only when the multiplier ring is unchanged. Each strict enlargement drops the p-exponent of the index in the maximal order, so the local loops terminate. No polynomial bit-time claim is made for the required integer factorization.

Construction or proof. Use the checked integer factorization for the critical prime list. Apply the multiplier criterion and CA.3 HNF coordinate changes at each step. A positive finite index strictly decreases under proper enlargement. The discriminant-index square identity proves that no unchecked prime can divide the final index.

Prerequisites. `IntegralBasisCertificate` (CN.2); `pRadical_multiplier_eq_iff` (CN.2); `IntegerFactorCertificate` (CN.1); **ClassicalArithmeticCompletion, CA.3** (hermite normal form certificate).

Source. [NumberRings](#source-numberrings), §9, pp.233–235.

API.

- `integralBasisAlgorithm_contains`: The returned maximal order contains the input order.
- `integralBasisAlgorithm_maximal`: The returned order equals the intrinsic integral closure.
- `integralBasisAlgorithm_rank`: The returned rank equals the input rank.

Tests.

- `test_integral_basis_algorithm_Q` (computation): Every order in ℚ returns the usual integer ring.
- `test_integral_basis_algorithm_one` (degenerate): The returned order contains 1.
- `test_integral_basis_algorithm_idempotent` (compatibility): Applying the algorithm to its output preserves the order, though not necessarily the basis.

**Prime-ideal decomposition certificate — `PrimeIdealFactorCertificate`.** For K a number field and a rational prime p, a PrimeIdealFactorCertificate K p stores a finite list of pairwise distinct nonzero prime ideals P_i of the native ring of integers, positive exponents e_i, and the identity pO_K=∏P_i^e_i. Each ideal is presented in the certified integral basis. Primality may be checked by an explicit finite-field quotient presentation. At primes dividing the index of a chosen power basis, the computation must use the maximal order or a proved higher-order method.

Construction or proof. Use native ideals, ideal multiplication and primality. The exact product and prime checks certify the decomposition without trusting a discovered factor list. Import FF.0 quotient-field presentations and the integral basis coordinates.

Prerequisites. `IntegralBasisCertificate` (CN.2); **FiniteFieldsAndCharacterSums, FF.0** (certified presentation of a finite field).

Source. [NumberRings](#source-numberrings), §9, pp.234–235; §12, p.248.

API.

- `PrimeIdealFactorCertificate.reconstruct`: The product is exactly the rational prime ideal.
- `PrimeIdealFactorCertificate.exponent_pos`: Every listed exponent is strictly positive.
- `PrimeIdealFactorCertificate.nonempty`: For prime p the decomposition cannot be empty.

Tests.

- `test_prime_factor_Q` (computation): A rational prime stays a single prime of exponent one over ℚ.
- `test_prime_factor_zero_exponent` (non-example): A zero exponent cannot pad the output.
- `test_prime_factor_bottom` (degenerate): The zero ideal cannot occur.

### Class relations, units and stopping inequalities

**Checked class-group relation lattice — `classRelationLattice`.** For n nonzero integral ideals I_i, classRelationLattice I is the integer submodule of ℤⁿ consisting of a with ∏[I_i]^(a_i)=1 in the native class group. A found relation matrix contributes a sublattice L contained in this kernel, certified by principal fractional-ideal generators. The relation kernel exists intrinsically; discovering rows does not show L equals it.

Construction or proof. Use ClassGroup.mk0 for the ideal classes. Their product-of-powers map is a homomorphism from the additive integer coordinate module to the class group, written multiplicatively. Its kernel is closed under integer linear combinations.

Prerequisites. Mathlib `ClassGroup.mk0`.

Source. [NumberRings](#source-numberrings), §12, exact sequence and relation matrix, p.248.

API.

- `mem_classRelationLattice`: Membership is the exact ideal-class product equation.
- `classRelationLattice_zero`: The zero vector is a relation.
- `classRelationLattice_neg`: A relation remains valid after negating all exponents.

Tests.

- `test_relations_empty` (degenerate): For an empty factor base the unique exponent vector is a relation.
- `test_relations_unit_ideals` (computation): A factor base consisting of unit ideals has the whole relation lattice.
- `test_relations_subtraction` (compatibility): Subtracting two checked relations is valid.

**Relation quotient covers the class group — `classNumber_dvd_relation_index`.** Let the classes of I₁,…,I_n generate Cl(K), and let L⊆classRelationLattice I be a full-rank integer submodule. Then the native class number divides the finite index [ℤⁿ:L]. The quotient ℤⁿ/L maps surjectively to Cl(K); equality of cardinalities is a separate completeness condition.

Construction or proof. The class product map is surjective by factor-base generation. The inclusion L⊆kernel lets it descend to the quotient. A surjection of finite groups makes the target order divide the source order.

Prerequisites. `classRelationLattice` (CN.2); Mathlib `NumberField.classNumber`; **ClassicalArithmeticCompletion, CA.3** (smith normal form certificate).

Source. [NumberRings](#source-numberrings), §12, formula for h′, p.248.

**Certified Minkowski factor-base generation — `minkowski_factorBase_generates`.** Let B be a nonnegative real number at least the native Minkowski bound for K. If a finite list I includes every nonzero prime ideal of norm at most B, its classes generate the class group. A larger rational upper bound is sufficient. Replacing it by a Bach-type logarithmic bound requires its stated GRH hypothesis and separate proof.

Construction or proof. Take a small-norm ideal representative of each class using the native Minkowski theorem. Factor it into prime ideals. Every prime factor has norm at most that ideal’s norm, so all its factors occur in the list.

Prerequisites. Mathlib `NumberField.exists_ideal_in_class_of_norm_le`; `PrimeIdealFactorCertificate` (CN.2); Mathlib `ClassGroup.mk0`.

Source. [NumberRings](#source-numberrings), §12, pp.245–248.

**Fundamental units from a regulator index bound — `units_complete_of_regulator_bound`.** Let K be a number field and u a family of rank(K) units whose logarithmic images are linearly independent. If regOfFamily(u)<2·regulator(K), then the subgroup generated by u together with the torsion units is the full unit group. To claim generation by a displayed finite list alone, that list must separately generate all torsion units.

Construction or proof. The native regulator ratio is the subgroup index. Full logarithmic rank makes the index positive. The strict bound makes it a positive integer below 2, hence one; index one is equivalent to the subgroup being the whole group.

Prerequisites. Mathlib `NumberField.Units.regOfFamily_div_regulator`.

Source. [NumberRings](#source-numberrings), §12, pp.248–250.

**Joint class and unit stopping bound — `joint_class_unit_bound`.** Suppose h>0 divides h′, and u is a full logarithmic-rank family of units of a number field K. If h′·regOfFamily(u)<2h·regulator(K), then h′=h and u together with all torsion units generates the unit group. In the class-group algorithm h′ is the order of the quotient by certified found relations, and h is the true class number; the surjection from that quotient must first establish h∣h′.

Construction or proof. The ratio is the product of two positive integers: h′/h and the native unit index. A product below 2 forces both factors to be 1. Apply the unit stopping argument.

Prerequisites. `units_complete_of_regulator_bound` (CN.2); Mathlib `NumberField.Units.regOfFamily_div_regulator`.

Source. [NumberRings](#source-numberrings), §12, pp.248–252.

**Certified completion of class and unit computations — `certified_class_unit_complete`.** With a complete factor base I, a checked full-rank relation sublattice L, and a full-logarithmic-rank unit family u, let h′=card(ℤⁿ/L). If h′·regOfFamily(u)<2·classNumber(K)·regulator(K), then h′ equals the class number and u together with all torsion units generates the unit group. The analytic bound must be certified by enclosing intervals and a rigorous remainder estimate; a numerical Euler-product guess is not a stopping certificate.

Construction or proof. Combine factor-base generation, the relation-quotient divisibility theorem and the joint positive-integer bound. A separately validated lower bound on hR and upper bound on h′R′ can discharge the strict inequality without knowing h or R individually.

Prerequisites. `classNumber_dvd_relation_index` (CN.2); `minkowski_factorBase_generates` (CN.2); `joint_class_unit_bound` (CN.2).

Source. [NumberRings](#source-numberrings), §12, pp.248–252.

### Newton sides and residual factors

**Exact φ-adic polynomial expansion — `phiExpansion`.** For a commutative ring R and monic φ∈R[X] of positive degree m, phiExpansion φ f returns coefficients a_i∈R[X] of degree less than m, zero for i>floor(natDegree f/m), with f=Σa_iφ^i. It uses successive division by the monic polynomial φ; the coefficients are polynomials, not scalar coefficients of f. The zero polynomial has all coefficients zero.

Construction or proof. Repeated monic quotient/remainder division lowers degree. The remainders are the a_i. Induction gives reconstruction, the degree bound and uniqueness.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [GMN](#source-gmn), §1.2, Definition 1.6, p.7.

API.

- `phiExpansion_reconstruct`: The finite φ-adic sum is f.
- `phiExpansion_degree`: Each coefficient has degree strictly below deg φ.
- `phiExpansion_eventually_zero`: Indices beyond the quotient-degree bound have zero coefficient.

Tests.

- `test_phi_zero` (degenerate): The expansion of zero is identically zero.
- `test_phi_X` (compatibility): For φ=X the coefficients are the constant polynomials C(f.coeff i).
- `test_phi_shift` (computation): For φ=X−1, X² has coefficients 1,2,1.

**Valuation of a φ-coefficient — `coefficientValuation`.** For prime p and a∈ℤ[X], coefficientValuation p a is infinity if a=0, and otherwise the minimum v_p(a_i) over the nonzero coefficients. It uses WithTop ℕ, so the zero polynomial has infinite valuation; the native default v_p(0)=0 is never inserted into the minimum.

Construction or proof. Take the finite minimum over the support of a, with top for the empty support. This is the Gauss valuation used only to compute the points of the φ-adic polygon. The general ordinary Newton-polygon theory remains CA.3.

Prerequisites. `phiExpansion` (CN.2); Mathlib `padicValRat`.

Source. [GMN](#source-gmn), §1.2, p.7.

API.

- `coefficientValuation_zero`: Zero has infinite valuation.
- `coefficientValuation_const`: A nonzero constant has its usual integer valuation.
- `coefficientValuation_ge_iff`: A lower valuation bound means coefficientwise divisibility by p^N.

Tests.

- `test_gauss_zero` (degenerate): The zero polynomial gives top.
- `test_gauss_three` (computation): 3X+9 has 3-adic coefficient valuation 1.
- `test_gauss_missing_coefficient` (non-example): X² has valuation zero, regardless of its zero constant coefficient.

**A finite negative φ-Newton side — `IsPhiNewtonSide`.** For prime p and monic positive-degree φ∈ℤ[X], IsPhiNewtonSide p φ f s u e h d certifies the entire supporting side from (s,u) to (s+ed,u−hd), with slope −h/e. Require e,h,d>0, gcd(e,h)=1 and hd≤u. The two endpoint coefficient valuations equal their displayed ordinates. Every φ-expansion point lies on or above the line e·v_p(a_i)+h·i=e·u+h·s, and every point on that line has s≤i≤s+ed. Zero coefficients have valuation infinity. The φ-divisible initial segment has slope −∞ and is recorded separately by its multiplicity; it is not encoded with a finite e,h.

Construction or proof. Use the already specified φ-expansion and coefficient Gauss valuation. Clear the slope denominator to use exact integer inequalities. This is a checked side of a φ-polygon, not a second owner of the generic Newton-polygon geometry in CA.3.

Prerequisites. `phiExpansion` (CN.2); `coefficientValuation` (CN.2); **ClassicalArithmeticCompletion, CA.3**.

Source. [GMN](#source-gmn), Definitions 1.6–1.9, pp.7–8.

API.

- `phiSide_denominator_pos`: The slope denominator is positive.
- `phiSide_left_nonzero`: The left endpoint coefficient is nonzero.
- `phiSide_length_pos`: A side has strictly positive horizontal length ed.

Tests.

- `test_phiSide_eisenstein` (computation): X²−3 has the single 3-adic side of slope −1/2.
- `test_phiSide_zero` (degenerate): The zero polynomial has no finite side.
- `test_phiSide_wrong_slope` (non-example): The slope of X²−3 is not −1.

**Residual polynomial of a φ-Newton side — `phiResidualPolynomial`.** For side data (s,u,e,h,d), phiResidualPolynomial has coefficient at Y^j equal to the reduction in F_φ=(ℤ/pℤ)[X]/(φ mod p) of a_(s+ej)/p^(u−hj), for 0≤j≤d. Divide each integer coefficient exactly before reducing. For a certified side the divisions are exact; points strictly above the side give zero. The endpoint coefficients are nonzero when φ mod p is irreducible, so the residual degree is d and Y does not divide it. Uniformizer p and reduction of the chosen φ are fixed conventions.

Construction or proof. Use integer coefficient division, the native quotient AdjoinRoot and the finite monomial sum. Reduction and exact divisibility lemmas are separate proof requirements.

Prerequisites. `IsPhiNewtonSide` (CN.2); **FiniteFieldsAndCharacterSums, FF.0** (certified presentation of a finite field).

Source. [GMN](#source-gmn), Definition 1.9, p.8.

API.

- `phiResidual_degree_le`: No coefficient above d occurs.
- `phiResidual_degree`: On a certified side over an irreducible residue polynomial the degree is exactly d.
- `phiResidual_constant_ne_zero`: The left endpoint gives a nonzero constant coefficient.

Tests.

- `test_residual_eisenstein` (computation): For X²−3 the residual polynomial is Y−1, not Y or Y²−1.
- `test_residual_zero` (degenerate): Raw zero input gives zero residual output.
- `test_residual_repeated` (non-example): (X−3)² has repeated residual (Y−1)², so a square-free residual hypothesis cannot be omitted.

**Ore residual irreducibility criterion — `ore_residual_irreducible`.** Let p be prime, φ and f monic in ℤ[X], deg φ>0, and φ mod p irreducible. Suppose f mod p=(φ mod p)^n, n>0, and the whole φ-polygon is the finite side from (0,hd) to (ed,0), with n=ed and coprime positive h,e. If its residual polynomial is irreducible over F_φ, then f is irreducible over ℚ_p. For a root θ the resulting local extension has ramification index e and residue degree deg(φ)·deg(R); these intrinsic invariants and their normalization are supplied by LocalFieldsRamification.

Construction or proof. Use the product theorem for φ-polygons and residual polynomials, the polygon factorization theorem and residual factorization theorem. An irreducible residual factor of exponent one admits only one irreducible local factor. The native local degree formula then gives the ramification and residue degrees.

Prerequisites. `phiResidualPolynomial` (CN.2); **LocalFieldsRamification, Layer 0**; **FiniteFieldsAndCharacterSums, FF.3** (hensel lifting modulo prime powers).

Source. [GMN](#source-gmn), Theorem 1.19 and Corollary 1.20, pp.14–15.

### Finite expansions in local fields

**Finite local expansion certificate — `LocalExpansionCertificate`.** For a normed field L, chosen nonzero uniformizer π with ‖π‖<1, element x and digit count N, a LocalExpansionCertificate stores an integer initial exponent v, digits d₀,…,dₙ₋₁ of norm at most one, and a proved remainder bound ‖x−π^vΣd_iπ^i‖≤‖π‖^(v+N). Intrinsic local-field structure, uniformizer and reduction map come from the owner. A chosen residue section is a separate input; canonical Teichmüller representatives, when wanted, belong to LocalFields layer 1. Without a fixed residue section these finite digits are not canonical; equality of decoded approximations is not asserted to imply equality of digits.

Construction or proof. Store exact native field elements and the norm inequality. Digit construction requires a separately chosen section of the surjective residue reduction map, then a finite extraction/remainder argument specified as a separate construction requirement. Layer 0 supplies field and valuation structure, not an expansion theorem. Preserve the chosen prime, embedding and uniformizer normalization in comparisons.

Prerequisites. **LocalFieldsRamification, Layer 0**; `PadicApproximation` (CN.0); `PrimeIdealFactorCertificate` (CN.2).

Source. [CarusoPublished](#source-carusopublished), §2.1.1, pp.17–19.

API.

- `LocalExpansionCertificate.center`: The exact finite centre is π^v times the digit polynomial.
- `LocalExpansionCertificate.error_bound`: The supplied exact x lies in the certified local ball.
- `LocalExpansionCertificate.integral_digits`: Every exact digit has norm at most one.

Tests.

- `test_local_zero` (degenerate): Zero has a certificate with zero digits at every finite length.
- `test_local_inverse_uniformizer` (computation): π⁻¹ has a length-one exact expansion with initial exponent −1 and digit 1.
- `test_local_false_zero_approximation` (non-example): A precision-one zero centre at v=0 cannot represent 1 when ‖π‖<1.

## CN.3: Exact modular and elliptic arithmetic data

The integral Fourier-coefficient lattice lives inside the complex space of forms. Construct its Miller basis using normalized E4, E6 and Delta and keep it distinct from the integral modular-symbol lattice. The existing characteristic-zero Sturm theorem supplies exact equality; congruence modulo a prime requires the integral model and its own theorem. Bind Hecke matrices and finite coefficient arrays to intrinsic operators before exporting numerical examples or database identifications.

Construction requirements. Prove coefficient integrality for normalized E4, E6 and Delta, the dimension-compatible monomial family, its leading powers and integral unitriangular elimination (Stein Algorithm 2.18, Lemma 2.20 and Remark 2.21, pp.19–21). The full modular lattice additionally needs an Eisenstein generator with the correct denominator normalization. Prove the integral polynomial-in-j lemma needed for congruence Sturm and use R15.2's q-expansion principle, bounded denominators and rational cusps for the general level/character extension (Stein Theorem 9.18, pp.171–172). Compare finite Manin presentations with integral Hecke matrices through the period-dual map; keep transpose, torsion, bad-prime and embedding conventions. In the BCG examples, a singular residual determinant supplies a finite witness but a characteristic-zero eigenform requires ModularForms Layer 8's simultaneous eigensystem/lifting contract. Companion existence needs one common eigenvector for all Hecke operators, with R15.3 theta/Hasse and a finite congruence Sturm certificate; matching roots of two characteristic polynomials is insufficient. Produce full certificates for every listed witness and every exclusion in the finite ranges. In the cohomological convention of BCG, a_g(ell)=ell^(p−k)a_f(ell), giving exponent 81 at (107,26); at (151,52) and (151,100) the gcd condition is 3, not 1. Curve adapters import FF.3 counts, the elliptic isogeny/descent objects and ED.3 finite local-image/saturation contracts from the ownership table; the adapter must bind all finite outputs, rather than treating those supplier services as consequences of a database label.

### Integral forms and finite coefficient equality

**Integral q-expansion lattice — `integralModularLattice`.** For integer weight k, integralModularLattice k is the ℤ-submodule of ModularForm SL₂(ℤ) k consisting of forms whose width-one q-expansion coefficients all belong to the image of ℤ in ℂ. This is a coefficient lattice inside the space of forms. It is distinct from the upstream integral modular-symbol module, which lives on the homological side.

Construction or proof. Use the existing modular-form carrier and q-expansion. Close the integral coefficient condition under addition and integer scalar multiplication.

Prerequisites. Mathlib `ModularForm.dimension_level_one`; Mathlib `ModularForm.sturm_bound_levelOne_nat`.

Source. [Stein](#source-stein), Lemma 2.20 and Remark 2.21, pp.20–21.

API.

- `mem_integralModularLattice`: Membership is integrality of every q coefficient.
- `integralModularLattice_zero`: The zero form is integral.
- `integralModularLattice_ext`: Elements agree if their underlying modular forms agree.

Tests.

- `test_integral_modular_zero` (degenerate): Zero is in the weight-zero lattice.
- `test_integral_E4` (compatibility): Mathlib’s unit-constant E₄ is integral.
- `test_half_E4` (non-example): One half of E₄ is not integral because its constant term is 1/2.

**Integral cusp-form lattice — `integralCuspLattice`.** integralCuspLattice k is the ℤ-submodule of CuspForm SL₂(ℤ) k consisting of forms with every width-one q coefficient in ℤ⊆ℂ. Its inclusion in the modular-form coefficient lattice is the native cusp-to-modular inclusion. It contains no Eisenstein summand.

Construction or proof. Restrict the integral q-coefficient condition to the native cusp-form carrier.

Prerequisites. `integralModularLattice` (CN.3).

Source. [Stein](#source-stein), Lemma 2.20, pp.20–21.

API.

- `mem_integralCuspLattice`: Membership is integrality of all coefficients.
- `integralCuspLattice_coeff_zero`: Its constant coefficient is zero by native cuspidality.
- `integralCuspLattice_ext`: Equality is equality of underlying cusp forms.

Tests.

- `test_integral_delta` (computation): The normalized discriminant is in the weight-12 lattice.
- `test_cusp_weight_zero` (degenerate): The weight-zero cusp lattice is zero.
- `test_half_delta` (non-example): One half of Δ fails integrality at the first coefficient.

**Integral Miller basis — `millerBasis`.** For even k∈ℕ and d=dimℂ S_k(SL₂(ℤ)), millerBasis k is a ℤ-basis f₁,…,f_d of integralCuspLattice k satisfying a_j(f_i)=δ_ij for 1≤i,j≤d. Use unit-constant F₄=1+240Σσ₃(n)qⁿ and F₆=1−504Σσ₅(n)qⁿ. They agree with Mathlib E₄,E₆; Stein’s unnormalized symbols require his scaling factors.

Construction or proof. Choose a,b≥0 with 4a+6b≤14 and congruent to k modulo 12, choosing a=b=0 when k≡0. The forms Δ^j F₆^(2(d−j)+b) F₄^a have leading coefficient 1 at q^j. Integral triangular elimination gives the Kronecker first-d coefficients. The native dimension bound shows these span over ℂ; the leading coefficients then force integral coordinates for each integral cusp form.

Prerequisites. `integralCuspLattice` (CN.3); Mathlib `ModularForm.dimension_level_one`; Mathlib `ModularForm.sturm_bound_levelOne_nat`.

Source. [Stein](#source-stein), Algorithm 2.18 and Lemma 2.20, pp.19–21.

API.

- `millerBasis_coeff`: The first d positive coefficients form the identity matrix.
- `millerBasis_repr`: The i-th integral coordinate is the (i+1)-st q coefficient.
- `millerBasis_unique`: A basis with the same first-d coefficient normalization is this basis.

Tests.

- `test_miller_weight_zero` (degenerate): At weight zero the basis index type is empty.
- `test_miller_delta` (computation): At weight 12 the sole basis form is Δ.
- `test_miller_weight_two` (non-example): Weight two has no cusp basis vector.

**Level-one congruence Sturm bound — `levelOne_congruence_sturm`.** Let k∈ℕ and f belong to integralModularLattice k. For a prime p, if every coefficient a_n(f) for 0≤n≤floor(k/12) is divisible by p, then every coefficient is divisible by p. This is a congruence statement in the integral lattice, not the characteristic-zero identity theorem.

Construction or proof. Use the integral triangular basis at level one to propagate divisibility from the initial coefficients to all integral coordinates. Stein’s alternative proof uses the integral polynomial-in-j expansion and multiplication by Δ. The full modular integral basis must be constructed separately from the complex Sturm theorem.

Prerequisites. `integralModularLattice` (CN.3); Mathlib `ModularForm.sturm_bound_levelOne_nat`; `millerBasis` (CN.3); **AlgebraicModularFormsAndSerreWeights, R15.2**.

Source. [Stein](#source-stein), Theorem 9.18, pp.171–172, level-one case.

**Exact equality of certified modular data — `modularDataEqual`.** modularDataEqual B a b checks equality of two arrays of isolated algebraic coefficients indexed by 0,…,B. For two same-weight modular forms on a finite-index subgroup Γ of SL₂(ℤ), set B=(k·[SL₂(ℤ):Γ]).toNat/12 and require that the decoded arrays equal the forms’ coefficients at their actual strict cusp width. Acceptance then proves equality by the native Sturm bound. An LMFDB orbit label is accepted only after the owner’s level, character and embedding convention identifies which intrinsic forms these arrays describe; a label alone does not provide either binding proof.

Construction or proof. Apply the exact algebraic-value comparison at each index. Use the two coefficient binding proofs and the native Sturm theorem, including coefficient zero. Modular symbols, integral Hecke algebras, orbit labels and trace formulas are imported from their respective ModularForms layers.

Prerequisites. `algebraicEqual` (CN.0); Tau Ceti `TauCeti.ModularForm.eq_of_sturm_bound`; **ModularForms, Layer 8**; **ModularForms, Layer 9**; **ModularForms, Layer 10**.

Source. [Stein](#source-stein), Theorem 9.18, pp.171–172; §9.4.

API.

- `modularDataEqual_iff`: Acceptance is coefficientwise equality of native algebraic values.
- `modularDataEqual_sound`: Correctly bound finite-index modular forms coincide on acceptance.
- `modularDataEqual_symm`: Swapping the arrays preserves the verdict.

Tests.

- `test_modular_data_constant` (degenerate): Bound zero still checks the constant coefficient.
- `test_modular_data_equal` (computation): Identical arrays pass.
- `test_modular_data_delta` (non-example): Matching constant terms do not suffice at weight twelve: the first Δ coefficient differs from zero.

### Hecke recurrences and integer matrices

**Level-one Hecke recurrence contract — `HasLevelOnePrimeRecurrence`.** For natural k≥2 and prime p, HasLevelOnePrimeRecurrence k p T records the coefficient formula a_m(Tf)=a_pm(f)+p^(k−1)a_(m/p)(f) when p∣m, with second term zero otherwise, for every level-one cusp form f. T is a supplied complex linear endomorphism on the native space. The canonical operator comes from the upstream Hecke action and its pinned coefficient theorem; this predicate only specifies the computational comparison.

Construction or proof. State the native recurrence on the level-one cusp space after identifying Γ₁(1) with SL₂(ℤ). Keep p and k explicit.

Prerequisites. Tau Ceti `HeckeRing.GL2.qExpansion_coeff_heckeSlashGamma1CuspFormEnd_diagCosetGamma1_of_mem_cuspFormCharSpace`; `integralCuspLattice` (CN.3).

Source. [Stein](#source-stein), Proposition 2.31, p.24; Lemma 2.20, pp.20–21.

API.

- `heckeRecurrence_coeff_one`: The first coefficient of T_p f is a_p(f) for p>1.
- `heckeRecurrence_unique`: At fixed k,p the recurrence determines the endomorphism uniquely.
- `heckeRecurrence_preserves_integrality`: The endomorphism preserves the integral cusp lattice.

Tests.

- `test_hecke_weight_two` (degenerate): The zero-dimensional weight-two space has the zero endomorphism satisfying the recurrence.
- `test_hecke_delta` (computation): At weight 12 and p=2, T₂ acts by −24.
- `test_hecke_zero_wrong` (non-example): The zero endomorphism does not represent T₂ at weight 12.

**Integral Hecke matrix in the Miller basis — `integralHeckeMatrix`.** For even k≥2, prime p and an endomorphism T satisfying the level-one recurrence, integralHeckeMatrix k p T is its integer matrix in the Miller basis, using column vectors. Entry (i,j) is a_(i+1)(T f_j), uniquely read as an integer; the recurrence computes it from coefficients of f_j through degree p·d. It represents an operator on the forms lattice, distinct from the dual modular-symbol matrix.

Construction or proof. The recurrence preserves the integral cusp lattice. Restrict T to a ℤ-linear map and apply the native matrix-of-linear-map construction to the Miller basis. Its first-d coefficient property gives the entry formula.

Prerequisites. `HasLevelOnePrimeRecurrence` (CN.3); `millerBasis` (CN.3); **ModularForms, Layer 8**.

Source. [Stein](#source-stein), Proposition 2.31, p.24; Lemma 2.20, pp.20–21.

API.

- `integralHeckeMatrix_entry`: Column j consists of the integral coefficients a_(i+1)(T f_j).
- `integralHeckeMatrix_repr`: The matrix acts on the native integer coordinate column of every lattice form.
- `integralHeckeMatrix_unique`: The coefficient comparison uniquely determines the integer matrix.

Tests.

- `test_hecke_matrix_empty` (degenerate): The weight-two matrix has dimension zero and determinant one.
- `test_hecke_matrix_delta` (computation): The weight-12 T₂ determinant is −24.
- `test_hecke_matrix_ordinary` (non-example): At p=2, weight 12 is nonordinary: −24 reduces to zero.

### Ordinary and nonordinary arithmetic witnesses

**The coefficient at 107 of ΔE₄²E₆ — `weight26_coeff_107`.** With the unit-constant Mathlib E₄,E₆ and normalized discriminant Δ, the coefficient at q^107 of ΔE₄²E₆ equals 35830422465487817813321292. This exact integer is −1 modulo 107. The coefficient theorem certifies ordinarity once the existing eigenform and reduction interfaces are supplied.

Construction or proof. Use the exact integral coefficient formulas and truncate products beyond degree 107. Multiply over ℤ, then compare the resulting coefficient through the native q-expansion multiplication map. The finite convolution certificate is checked independently of any CAS label.

Prerequisites. `integralModularLattice` (CN.3); `integralCuspLattice` (CN.3).

Source. [BCG](#source-bcg), §2.3, proof of Theorem 2.4, p.515.

**Ordinary reduction at 107 — `weight26_ordinary_107`.** The certified coefficient 35830422465487817813321292 reduces to −1 in ZMod 107, hence is nonzero.

Construction or proof. Reduce the exact numeral modulo 107. This arithmetic check uses the certified coefficient theorem for its interpretation as a Hecke eigenvalue.

Prerequisites. `weight26_coeff_107` (CN.3).

Source. [BCG](#source-bcg), §2.3, p.515.

**Nonordinary determinant at weight 38 and prime 79 — `weight38_nonordinary_det`.** The determinant of the level-one T₇₉ matrix on the integral weight-38 cusp lattice is divisible by 79. Together with the imported simultaneous eigenform and reduction theorem, this yields a characteristic-zero eigenform with a₇₉ in a prime above 79. Also gcd(37,80)=1. The determinant statement alone is kept separate from that eigenform-lifting input.

Construction or proof. Construct the dimension-two Miller basis, compute the recurrence through degree 158, and reduce its exact integer determinant modulo 79. Use the upstream Hecke eigenform decomposition to interpret singular reduction.

Prerequisites. `integralHeckeMatrix` (CN.3).

Source. [BCG](#source-bcg), Corollary 3.2 proof, p.518.

**Certified nonordinary weight-prime pair — `NonordinaryLevelOnePair`.** NonordinaryLevelOnePair k p means p is prime, k≥2 is even, and the determinant of an integral matrix for the intrinsic level-one T_p action on S_k vanishes modulo p. The matrix must satisfy the complete coefficient recurrence, which determines the operator uniquely. To export existence of a characteristic-zero eigenform with nonordinary reduction, use the owner’s integral Hecke eigensystem and lifting theorem.

Construction or proof. Use the matrix construction and reduce its integer determinant into ZMod p. The empty matrix has determinant one, so zero-dimensional spaces never pass.

Prerequisites. `integralHeckeMatrix` (CN.3); `HasLevelOnePrimeRecurrence` (CN.3); **ModularForms, Layer 8**.

Source. [BCG](#source-bcg), Corollary 3.2 and Remark 3.3, p.518.

API.

- `nonordinary_pair_prime`: A certified pair has prime residue characteristic.
- `nonordinary_pair_even`: A certified pair has even positive weight.
- `nonordinary_pair_nonzero_dimension`: The cusp space of a certified pair has positive dimension.

Tests.

- `test_nonordinary_38_79` (computation): The pair (38,79) passes.
- `test_nonordinary_weight_two` (degenerate): No weight-two pair passes.
- `test_nonordinary_26_107` (non-example): The weight-26 form is ordinary at 107.

**The first two nonordinary level-one primes — `small_nonordinary_primes`.** Among primes p≤79, a level-one nonordinary eigenform of even weight 2≤k<p exists exactly for p=59 or p=79. The determinant witnesses occur at weights 16 and 46 for 59, and 38 and 44 for 79. The weight-16 witness at 59 fails gcd(k−1,p+1)=1, whereas weight 38 at 79 passes it.

Construction or proof. Enumerate every prime p≤79 and every even weight below p. For each, reconstruct the Miller basis and T_p matrix by exact q-expansion arithmetic, then check the determinant. The Sturm/basis comparison proves these are the intrinsic operators; dimension-zero cases contribute determinant one.

Prerequisites. `NonordinaryLevelOnePair` (CN.3); `integralHeckeMatrix` (CN.3).

Source. [BCG](#source-bcg), Remark 3.3, p.518.

**Nonordinary pairs below 200 — `nonordinary_pairs_lt_200`.** For prime p<200 and even 2≤k<p, the nonordinary pairs (p,k) are exactly (59,16),(59,46),(79,38),(79,44),(107,28),(107,82),(131,40),(131,94),(139,36),(139,106),(151,60),(151,94),(173,24),(173,152),(193,72),(193,124). Filtering by gcd(k−1,p+1)=1 gives the primes 79,151,173,193 used in the nonordinary part of BCG Remark 3.3.

Construction or proof. Run the same exact finite matrix checks on the larger range and retain every result. Then perform the integer gcd filter.

Prerequisites. `NonordinaryLevelOnePair` (CN.3); `integralHeckeMatrix` (CN.3).

Source. [BCG](#source-bcg), Remark 3.3, p.518.

**Complete companion eigensystem at weight 82 — `weight82_companion_system`.** Let a_n be the exact integer coefficients of f=ΔE₄²E₆. The level-one integral Hecke matrices at weight 82 admit a common nonzero eigenvector over an algebraic closure of 𝔽₁₀₇, with eigenvalue ℓ⁸¹a_ℓ for every prime ℓ≠107. Equivalently a_ℓ(f)=ℓ²⁵a_ℓ(g) modulo 107. This coefficient convention matches BCG’s cohomological Galois normalization ρ̄_f≅ε̄⁻²⁵ρ̄_g, whose determinant is ε̄^(1−k). A common root of two separate characteristic polynomials is insufficient.

Construction or proof. Construct a common residual eigensystem, apply the mod-p theta/Hasse weight comparison, and prove the full congruence with a congruence Sturm bound. The theta weight convention, eigensystem lift and Galois trace comparison are requested from their owners. These proof inputs are not inferred from two Hecke eigenvalues.

Prerequisites. `integralHeckeMatrix` (CN.3); `levelOne_congruence_sturm` (CN.3); `weight26_coeff_107` (CN.3); **AlgebraicModularFormsAndSerreWeights, R15.3**; **ModularForms, Layer 8**.

Source. [BCG](#source-bcg), Theorem 2.4 proof, p.515.

**Ordinary level-one companion pair — `OrdinaryCompanionPair`.** For a prime p, OrdinaryCompanionPair p k means 2≤k<p, both k and k′=p+1−k are even, and the integral level-one Hecke operators in these weights have common residual eigensystems over an algebraic closure of 𝔽_p. The first eigensystem has eigenvalues a_ℓ and a_p≠0. For every prime ℓ≠p the companion eigenvalue is ℓ^(p−k)a_ℓ, equivalently a_ℓ=ℓ^(k−1)b_ℓ. Each eigensystem is represented by one nonzero vector simultaneously for all prime Hecke matrices, not a collection of independently chosen eigenvalues.

Construction or proof. Use the integer Hecke matrices and coefficientwise reduction into the algebraic closure. Record both operator families, their intrinsic recurrence comparisons, two nonzero simultaneous eigenvectors and their eigenvalue function. Characteristic-zero lifting and the cohomological Galois comparison are owner inputs.

Prerequisites. `integralHeckeMatrix` (CN.3); `HasLevelOnePrimeRecurrence` (CN.3); `weight82_companion_system` (CN.3).

Source. [BCG](#source-bcg), Theorem 2.1 and §2.3, pp.513–515; Remark 3.3, p.518.

API.

- `ordinaryCompanionPair_weight`: The weight is even and strictly between 1 and p.
- `ordinaryCompanionPair_dimension`: The first cusp space has positive dimension. Ordinarity belongs to the selected eigensystem; other eigensystems in the same space may be nonordinary.
- `ordinaryCompanionPair_companion_dimension`: The companion cusp space is also nonzero.

Tests.

- `test_companion_107` (computation): Weight 26 at 107 has companion weight 82.
- `test_companion_low_prime` (degenerate): There is no eligible weight for p=2.
- `test_companion_weight_two` (non-example): Weight two has no cusp eigensystem.

**Corrected ordinary companion witnesses — `corrected_ordinary_companion_list`.** For (p,k)=(107,26),(139,20),(173,68),(179,30),(191,30),(193,48), an OrdinaryCompanionPair p k exists and gcd(k−1,p−1)=1. The candidate at p=151 has weights 52 and 100, and gcd(51,150)=gcd(99,150)=3, so those companion forms do not satisfy BCG Theorem 2.1. No exhaustive statement about all primes is made.

Construction or proof. Produce a complete simultaneous eigensystem certificate for each pair, apply the owner’s lift/Galois comparison, and check the integer gcd. T₂/T₃ checks are discovery evidence; the target requires full congruence certificates.

Prerequisites. `OrdinaryCompanionPair` (CN.3); `levelOne_congruence_sturm` (CN.3).

Source. [BCG](#source-bcg), Remark 3.3, p.518; [CG13](#source-cg13), §§6–7, pp.11–12 and appendix table C, p.14.

## CN.4: Validated numerics and finite analytic certificates

Numerical output is an enclosure of a specified intrinsic value. Arithmetic must propagate precision and analytic error together. Root lists need both isolation and completeness. Dirichlet and modular L-value algorithms evaluate imported continuations with rigorous tails. The explicit-formula applications accept only admissible, completely covered datasets and exact rational Gram inequalities.

Construction requirements. Implement terminating enclosures of exp, log, pi, digamma, trigamma and incomplete Gamma with argument reduction and directed rounding; add every truncation error to the final interval. Use Complex.digamma_apply_add_nat only away from nonpositive integers. For polynomial roots, provide finite rational root counts, subdivision, separation and completeness against RealAlgebraicGeometry's intrinsic root theory. A real analytic sign-change test requires continuity; unique isolation additionally needs a monotonicity or derivative bound. For cusp L-values, prove the smoothed functional-equation identity, an effective coefficient-growth constant and an incomplete-Gamma tail bound with the imported cusp-width/Fricke normalization. General level/nebentypus uses the same contract with the owner's transformed form and algebraic embeddings. For Platt's finite ranges, construct or regenerate the primitive-character enumeration, Euler–Maclaurin/FFT error certificates, sampling/upsampling bounds, the real completed-function normalization and a Turing zero count (Platt §§4–7, pp.3–15). A list of sign changes proves neither a complete zero count nor a full finite-conductor theorem. For CT, prove the eight numerical formulas equal the intrinsic F/G values under the supplier's Fourier/Laplace and J_F conventions (CL Proposition 3.17, pp.304–307; CT Proposition 4.4, pp.298–299). The G evaluation formulas are unconditional; only the automorphic positivity use carries GRH. Prove the weighted alternating tail beyond the sufficient threshold alpha(N+1)≥1. Each dataset row binds an exact infinity type, positive multiplicity and delta in {0,1}; prove the required epsilon product is real when delta_i delta_j=1. Preserve the multiplicity lift t_i/m_i and diagonal A/m_i. GN.5 supplies complete rational ellipsoid enumeration; record enlarged cutoffs explicitly, retain extra vectors and verify every requested row. Counts for a cover, including the 12293-row example, are not counts for the smaller exact ellipsoid.

### Rational intervals, boxes and exact recovery

**Rational interval multiplication — `intervalMul`.** For I=[a,b] and J=[c,d] with rational endpoints, intervalMul I J is [min(ac,ad,bc,bd), max(ac,ad,bc,bd)]. These are enclosing intervals in ℝ under the rational embedding. The existing monotone interval multiplication does not apply to arbitrary signed rational endpoints.

Construction or proof. Evaluate all four corner products. Their minimum is at most their maximum; package these as the endpoints of the existing NonemptyInterval ℚ carrier.

Prerequisites. Mathlib `NonemptyInterval`.

Source. [Arb](#source-arb), §3.1.2, p.5; §4, p.6; §5, p.7.

API.

- `intervalMul_lower`: The lower endpoint is the minimum of the four corner products.
- `intervalMul_comm`: Multiplication is symmetric in its two intervals.
- `intervalMul_pure`: Singleton intervals multiply as rational numbers.

Tests.

- `test_intervalMul_signed` (computation): [−2,3] times [−4,5] is [−12,15].
- `test_intervalMul_zero` (degenerate): The singleton zero times any interval is the singleton zero.
- `test_intervalMul_crossing` (non-example): [−1,1] times itself has lower endpoint −1, not +1.

**Enclosure under multiplication — `intervalMul_sound`.** For x,y∈ℝ, if a≤x≤b and c≤y≤d, then xy lies between the endpoints of intervalMul [a,b] [c,d], with all rational endpoints cast into ℝ.

Construction or proof. Split each input interval at zero. In each of the four sign cases, order compatibility of multiplication bounds xy by the corresponding corner products.

Prerequisites. `intervalMul` (CN.4).

Source. [Arb](#source-arb), §3.1.2, p.5; §4, p.6; §5, p.7.

**Partial interval reciprocal — `intervalInv`.** intervalInv I returns none when 0∈I and otherwise returns the interval [1/I.upper,1/I.lower]. Failure is data and carries no assertion that the mathematical reciprocal exists at zero.

Construction or proof. Decide whether the rational endpoints straddle zero. On either remaining sign component, inversion reverses order.

Prerequisites. Mathlib `NonemptyInterval`.

Source. [Arb](#source-arb), §3.1, pp.4–6; §5, pp.7–8.

API.

- `intervalInv_involutive`: Successful inversion twice recovers the input interval.
- `intervalInv_none`: Failure is equivalent to the input interval containing zero.
- `intervalInv_endpoints`: Successful output has reciprocals of the reversed input endpoints.

Tests.

- `test_intervalInv_positive` (computation): The reciprocal of [2,4] is [1/4,1/2].
- `test_intervalInv_zero` (degenerate): The singleton zero is rejected.
- `test_intervalInv_negative` (computation): The reciprocal of [−4,−2] is [−1/2,−1/4].

**Enclosure under reciprocal — `intervalInv_sound`.** If intervalInv I=some J and x∈ℝ lies in I, then x≠0 and 1/x lies in J.

Construction or proof. Unfold the successful branch and distinguish positive and negative intervals; apply order reversal of inversion in that sign component.

Prerequisites. `intervalInv` (CN.4).

Source. [Arb](#source-arb), §3.1, pp.4–6; §5, pp.7–8.

**Outward dyadic rounding — `dyadicHull`.** For precision p∈ℕ, dyadicHull p [a,b]=[floor(2^p a)/2^p,ceil(2^p b)/2^p]. Negative endpoints use floor and ceiling, not truncation toward zero. The representation remains NonemptyInterval ℚ.

Construction or proof. Use the integer floor and ceiling of each scaled endpoint. Positivity of 2^p proves the endpoints are ordered.

Prerequisites. Mathlib `NonemptyInterval`.

Source. [Arb](#source-arb), §3.1, p.4; §5, p.7.

API.

- `dyadicHull_grid`: Both output endpoints lie on the 2^(−p) rational grid.
- `dyadicHull_contains`: The original interval is contained in the rounded interval.
- `dyadicHull_idempotent`: Rounding again at the same precision does not change the interval.

Tests.

- `test_dyadicHull_third` (computation): At p=2 the singleton 1/3 becomes [1/4,1/2].
- `test_dyadicHull_negative` (non-example): At p=0 the singleton −1/3 becomes [−1,0].
- `test_dyadicHull_zero` (degenerate): Exact zero remains exact at every precision.

**Width added by dyadic rounding — `dyadicHull_width`.** The width of dyadicHull p I is less than width(I)+2·2^(−p). The strict bound includes exact endpoints.

Construction or proof. Each endpoint moves outward by strictly less than 2^(−p); add the two floor/ceiling error inequalities.

Prerequisites. `dyadicHull` (CN.4).

Source. [Arb](#source-arb), §3.1, p.4; §5, p.7.

**Rational complex-box denotation — `complexBoxSet`.** A complex box is represented by the native pair (R,I) of closed nonempty rational intervals. complexBoxSet(R,I) is {z∈ℂ | Re(z)∈R and Im(z)∈I}. No new complex-number carrier or rounded value equality is introduced. Degenerate boxes and boxes meeting branch cuts are allowed; analytic evaluators must account for their entire image.

Construction or proof. Define the four real endpoint inequalities using rational casts.

Prerequisites. Mathlib `NonemptyInterval`.

Source. [Arb](#source-arb), §5 and §5.3, pp.7–8.

API.

- `mem_complexBoxSet`: Membership is membership of both real components in their endpoint intervals.
- `complexBoxSet_nonempty`: Every nonempty component pair denotes a nonempty complex set.
- `complexBoxSet_mono`: Expanding each component interval expands the denotation.

Tests.

- `test_box_zero` (degenerate): The pair of singleton zero intervals contains only zero.
- `test_box_i` (computation): The box [0,0]×[1,1] contains i.
- `test_box_positive_nonzero` (non-example): A strictly positive real lower endpoint excludes zero.

**Unique integer extraction — `uniqueInteger`.** uniqueInteger I returns the integer ceil(I.lower) precisely when ceil(I.lower)=floor(I.upper); otherwise it returns none. It asserts uniqueness inside the closed interval, not that an unknown real number in it is integral.

Construction or proof. Compute the smallest and largest integers in the rational interval. Compare them exactly.

Prerequisites. Mathlib `NonemptyInterval`.

Source. [Arb](#source-arb), §2.3, pp.3–4.

API.

- `uniqueInteger_mem`: A returned integer lies in the input interval.
- `uniqueInteger_iff`: The output is z iff z is the unique integer in I.
- `uniqueInteger_pure`: A singleton integer is recovered.

Tests.

- `test_uniqueInteger_one` (computation): [3/4,5/4] contains exactly the integer 1.
- `test_uniqueInteger_two` (non-example): [0,1] is rejected because both endpoints are integers.
- `test_uniqueInteger_empty` (degenerate): The singleton 1/2 contains no integer and is rejected.

**Recovery of a known integral value — `uniqueInteger_sound`.** If z is an integer, its real image belongs to I, and uniqueInteger I=some w, then z=w. An enclosure around zero alone never proves that a general real or complex analytic value vanishes.

Construction or proof. Cast the rational endpoint inequalities and apply uniqueInteger_iff to the known integer z.

Prerequisites. `uniqueInteger` (CN.4).

Source. [Arb](#source-arb), §2.3, pp.3–4.

### p-adic precision propagation

**Normalize a rational p-adic ball — `padicNormalize`.** For prime p, rational centre c and absolute precision N∈ℤ, padicNormalize p c N returns the unique canonical PadicApproximation at precision N with denotation {x | ‖x−c‖≤p^(−N)}. Its valuation field is N if c=0, and min(v_p(c),N) otherwise. For v<N the mantissa is the unique residue in [1,p^(N−v)) prime to p representing c·p^(−v) modulo p^(N−v).

Construction or proof. Separate the zero and high-valuation cases. Otherwise invert the denominator prime to p modulo p^(N−v) and reduce the scaled numerator. Native p-adic truncation compares this residue with the original rational centre.

Prerequisites. `PadicApproximation` (CN.0); Mathlib `PadicInt.toZModPow`; Mathlib `padicValRat`.

Source. [CarusoPublished](#source-carusopublished), §2.1.1, Definition 2.1.2, and §2.1.2, Proposition 2.1.3 and Equation (2.5), pp.II–17–II–19.

API.

- `padicNormalize_precision`: Absolute precision is retained.
- `padicNormalize_denotation`: Normalization preserves the entire rational-centred ball.
- `padicNormalize_valuation`: The zero branch avoids the native valuation-at-zero default.
- `padicNormalize_id`: Normalizing an already canonical centre and precision recovers the approximation.

Tests.

- `test_normalize_zero` (degenerate): Zero at precision 5 has valuation 5 and mantissa zero.
- `test_normalize_five` (computation): 5 modulo 3 normalizes to mantissa 2.
- `test_normalize_cancellation` (non-example): 9 at absolute precision 2 is a zero-centred ball, not a unit with valuation zero.

**Certified p-adic addition — `padicAdd`.** Add two canonical p-adic approximations by normalizing the sum of centres at absolute precision min(N,N′). For every independently chosen x in the first ball and y in the second, the sum lies in the output ball. This enclosure does not recover correlations between repeated occurrences of an uncertain input.

Construction or proof. Expand the error around the exact rational centres and apply the ultrametric inequality.

Prerequisites. `padicNormalize` (CN.4); `PadicApproximation` (CN.0).

Source. [CarusoPublished](#source-carusopublished), §2.1.1, Definition 2.1.2, and §2.1.2, Proposition 2.1.3 and Equation (2.5), pp.II–17–II–19.

API.

- `padicAdd_precision`: The output has the stated absolute precision.
- `padicAdd_sound`: The output contains every result from independently chosen inputs.
- `padicAdd_comm`: The canonical result is symmetric in its inputs.

Tests.

- `test_padic_add_zero` (degenerate): The operation on two precision-zero zero-centred balls contains zero.
- `test_padic_add_centres` (computation): The exact operation on the centres lies in the output.
- `test_padic_add_unequal_precision` (compatibility): The declared precision includes different input precisions and zero centres.

**Certified p-adic multiplication — `padicMul`.** Multiply two canonical p-adic approximations by normalizing the product of centres at absolute precision min(v+N′,N+v′). For every independently chosen x in the first ball and y in the second, the product lies in the output ball. This enclosure does not recover correlations between repeated occurrences of an uncertain input.

Construction or proof. Expand the error around the exact rational centres and apply the ultrametric inequality. For multiplication the mixed error has valuation at least N+N′, which is no smaller than either retained bound because v≤N and v′≤N′.

Prerequisites. `padicNormalize` (CN.4); `PadicApproximation` (CN.0).

Source. [CarusoPublished](#source-carusopublished), §2.1.1, Definition 2.1.2, and §2.1.2, Proposition 2.1.3 and Equation (2.5), pp.II–17–II–19.

API.

- `padicMul_precision`: The output has the stated absolute precision.
- `padicMul_sound`: The output contains every result from independently chosen inputs.
- `padicMul_comm`: The canonical result is symmetric in its inputs.

Tests.

- `test_padic_mul_zero` (degenerate): The operation on two precision-zero zero-centred balls contains zero.
- `test_padic_mul_centres` (computation): The exact operation on the centres lies in the output.
- `test_padic_mul_unequal_precision` (compatibility): The declared precision includes different input precisions and zero centres.
- `test_padic_mul_negative_valuation` (computation): At p=3, multiply 3+O(3^4) by 1/3+O(3^2): the normalized output has centre 1 and absolute precision min(1+2,4−1)=3.

**Partial p-adic inversion — `padicInverse`.** padicInverse rejects a zero-mantissa approximation, because its ball contains zero. Otherwise it returns the normalized reciprocal of the rational centre at absolute precision N−2v. Every element in the input ball is nonzero and its inverse lies in this output. The input relative precision N−v is preserved.

Construction or proof. Write x=c+h with v(h)≥N>v(c). Then x has the same valuation as c and x⁻¹−c⁻¹=−h/(cx), of valuation at least N−2v.

Prerequisites. `padicNormalize` (CN.4); `PadicApproximation` (CN.0).

Source. [CarusoPublished](#source-carusopublished), §2.1.1, Definition 2.1.2, and §2.1.2, Proposition 2.1.3 and Equation (2.5), pp.II–17–II–19.

API.

- `padicInverse_none_iff`: Rejection is exactly the presence of zero in the input ball.
- `padicInverse_precision`: A successful output has precision N−2v.
- `padicInverse_sound`: A successful output encloses reciprocals of every input value.

Tests.

- `test_padic_inverse_zero` (degenerate): The zero-centred ball is rejected.
- `test_padic_inverse_unit` (computation): Inverting a precision-four unit preserves absolute precision four.
- `test_padic_inverse_loss` (non-example): Inverting 3+O(3⁴) loses two absolute digits, yielding precision two.

### Explicit-formula kernels and scalar enclosures

**Odlyzko tail kernel — `ctTailKernel`.** ctTailKernel(x)=2π²exp(−x)/(x²+π²)² for real x. It is positive everywhere and decreases on [0,∞). This is the scalar exponentially decaying kernel in both unconditional F_ℓ and conditional G_ℓ evaluation formulas; positivity of the test functions and the GRH-dependent explicit-formula implication belong to the automorphic owner.

Construction or proof. Use native real exp and π. Positivity follows from π≠0. On the nonnegative half-line both the exponential factor decreases and the positive denominator increases.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.

API.

- `ctTailKernel_pos`: The kernel is strictly positive.
- `ctTailKernel_zero`: At zero its value is 2/π².
- `ctTailKernel_geometric`: For x,t≥0, r(x+t)≤exp(−t)r(x).

Tests.

- `test_tail_kernel_zero` (degenerate): The zero value is positive and finite.
- `test_tail_kernel_one` (computation): r(1) is strictly below r(0).
- `test_tail_kernel_not_even` (non-example): The kernel is not even: r(−1)>r(1).

**Geometric bound for the Odlyzko tail — `ctTailKernel_tail`.** For α>0, b≥0 and N∈ℕ, the series Σr(α(b+n)) converges and its tail after indices 0,…,N−1 lies in [0,r(α(b+N))/(1−exp(−α))]. N=0 includes the entire series.

Construction or proof. The preceding kernel inequality gives a geometric majorant with ratio exp(−α)<1. Sum that majorant and use termwise positivity.

Prerequisites. `ctTailKernel` (CN.4).

Source. [CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.

**Alternating Odlyzko tail bound — `ctTailKernel_alternating_tail`.** For α>0 and b≥0, the absolute error after the first N terms of Σ(−1)^n r(α(b+n)) is at most r(α(b+N)). The weighted n·r(αn) variant used by J_F(1−ε) needs its own monotonicity threshold; α(N+1)≥1 is a sufficient rationally checkable replacement for the sharper decimal threshold in the source.

Construction or proof. The kernel decreases to zero, so apply the alternating-series remainder theorem. For the weighted variant, differentiate log(xr(x)); it is decreasing for x≥1.

Prerequisites. `ctTailKernel` (CN.4); `ctTailKernel_tail` (CN.4).

Source. [CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.

**Closed scalar formulas for CT evaluation — `ctExplicitFormula`.** ctExplicitFormula ℓ w selects one of eight scalar expressions, for ℓ>0 and w∈ℕ. Put r=ctTailKernel, φ(z)=(ψ((z+1)/2)−ψ(z/2))/2, b_F=1/2+w/4 and b_G=(1+w)/2. Indices 0,…,7 are F̂_ℓ(0), F̂_ℓ(i/4π), J_Fℓ(I_w), J_Fℓ(1−ε), Ĝ_ℓ(0), Ĝ_ℓ(i/4π), J_Gℓ(I_w), J_Gℓ(1−ε). Their explicit expressions are those of CL Proposition 3.17 and CT Proposition 4.4, with the Fourier/Laplace dictionary F̂(0)=Φ_F(1/2), F̂(i/4π)=Φ_F(0). This declaration defines the numerical right-hand sides; identification with the intrinsic automorphic linear functional remains an imported obligation.

For an explicit specification, let \(z_0=\tfrac12+i\pi/\ell\),
\(z_1=1+i\pi/\ell\), \(z_F=b_F+i\pi/(2\ell)\), and
\(z_G=b_G+i\pi/\ell\). Here \(\psi\) is the native complex digamma
function and primes denote its complex derivative. Define the convergent sums

\[
 S(a,b)=\sum_{n\ge0}r(a(b+n)),\qquad
 T(a,b)=\sum_{n\ge0}(-1)^n r(a(b+n)),\qquad
 W(a)=\sum_{n\ge1}(-1)^{n+1}n r(an).
\]

The numerical right-hand sides, in the stated order, are:

| Index | Expression |
| --- | --- |
| 0 | \(4\Re\phi(z_0)-\frac4\pi\Im\phi(z_0)+\frac4\ell\Re\phi'(z_0)+4\ell T(\ell,\tfrac12)\) |
| 1 | \(8\ell/\pi^2\) |
| 2 | \(\log\pi-\Re\psi(z_F)+\frac1\pi\Im\psi(z_F)-\frac1{2\ell}\Re\psi'(z_F)+2\ell S(2\ell,b_F)\) |
| 3 | \(1+\frac{2\pi}\ell\Im\phi(z_1)+\frac{2\pi}{\ell^2}\Im\phi'(z_1)+2\ell W(\ell)\) |
| 4 | \(8\ell/\pi^2\) |
| 5 | \(4\pi^2\ell(1+\cosh(\ell/2))/(\ell^2/4+\pi^2)^2\) |
| 6 | \(\log(2\pi)-\Re\psi(z_G)+\frac1\pi\Im\psi(z_G)-\frac1\ell\Re\psi'(z_G)+\ell S(\ell,b_G)\) |
| 7 | \(\Re\phi(z_0)-\frac1\pi\Im\phi(z_0)+\frac1\ell\Re\phi'(z_0)+\ell T(\ell,\tfrac12)\) |

All eight expressions and their enclosures are unconditional. Any GRH
assumption belongs to the imported automorphic positivity implication for G,
rather than to this numerical definition.

Construction or proof. Use the native digamma function and its derivative, the displayed exponentially convergent tails, and elementary real/complex operations. Both formulas for F̂(i/4π) and Ĝ(0) equal 8ℓ/π². Distinguish the F and G gamma shifts and the weighted alternating tail.

Prerequisites. `ctTailKernel` (CN.4); `ctTailKernel_tail` (CN.4); `ctTailKernel_alternating_tail` (CN.4); Mathlib `Complex.digamma`; Mathlib `Complex.digamma_apply_add_nat`.

Source. [CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint; [CT](#source-ct), Proposition 4.4 and proof, pp.298–299.

API.

- `ctExplicitFormula_shared_value`: F̂_ℓ(i/4π)=Ĝ_ℓ(0), without an analytic hypothesis.
- `ctExplicitFormula_fourier`: Their value is 8ℓ/π².
- `ctExplicitFormula_G_imag`: The conditional imaginary Fourier value has the cosh closed formula.

Tests.

- `test_ct_fourier_positive` (computation): For every positive ℓ the shared Fourier value is positive.
- `test_ct_fourier_zero` (degenerate): At ℓ=0 the totalized formula is zero, and is excluded from every evaluation theorem.
- `test_ct_fourier_linear` (compatibility): Doubling ℓ doubles the shared Fourier value.

**Certified rational enclosures of CT quantities — `ctEnclosure`.** For rational ℓ>0, weight w, quantity index q∈{0,…,7} and precision P∈ℕ, ctEnclosure returns rational endpoints containing ctExplicitFormula ℓ w q, with width at most 2^(−P). It evaluates exp, log, π, ψ and ψ′ with directed error bounds and adds the explicit series remainder. The two identical Fourier-value indices 1 and 4 use the same evaluation path. An approximate eigenvalue search does not enter this checker.

Construction or proof. Bound argument-reduction and elementary-function errors, shift digamma arguments within the right half-plane using the native recurrence, and apply a certified Euler–Maclaurin or Spouge remainder. Choose tail truncation from the kernel bounds. Round the final interval outward, increasing internal precision until the requested width is achieved. The special-function remainder and termination proof are additional construction requirements.

Prerequisites. `ctExplicitFormula` (CN.4); `dyadicHull` (CN.4); `ctTailKernel_tail` (CN.4); `ctTailKernel_alternating_tail` (CN.4); Mathlib `Complex.digamma_apply_add_nat`.

Source. [CL](#source-cl), §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint; [Arb](#source-arb), §5, pp.7–8.

API.

- `ctEnclosure_sound`: The exact scalar lies between the returned endpoints.
- `ctEnclosure_width`: The rational width meets the requested binary accuracy.
- `ctEnclosure_shared`: The equal Fourier-value indices use the same enclosure.

Tests.

- `test_ct_enclosure_unit` (computation): At ℓ=1 and precision 8 the shared Fourier value lies inside (4/5,41/50).
- `test_ct_enclosure_weight_zero` (degenerate): Weight zero is an allowed I₀ evaluation, with a nonempty enclosure.
- `test_ct_enclosure_not_exact` (non-example): The rational interval cannot be a singleton for 8/π².

### Complete polynomial root lists

**Complete isolation of rational-polynomial roots — `isolatePolynomialRoots`.** For nonzero f∈ℚ[X], isolatePolynomialRoots f returns a finite list of AlgebraicRootCertificate objects, each using f, with pairwise disjoint closed rational rectangles, and whose decoded values are exactly the distinct complex roots of f. Multiplicities are retained separately by square-free factorization; the output list counts distinct roots. A constant nonzero polynomial returns the empty list.

Construction or proof. Use exact square-free factorization and certified complex root counting in rational rectangles. Subdivide until each remaining rectangle contains a single distinct root and all roots are accounted for. A separation bound and a global degree/count argument prove termination and completeness; these are explicit proof obligations, not supplied by approximate root locations.

Prerequisites. `AlgebraicRootCertificate` (CN.0); `RationalFactorCertificate` (CN.1).

Source. [Arb](#source-arb), §5, pp.7–8.

API.

- `isolatePolynomialRoots_polynomial`: Every output uses the input polynomial.
- `isolatePolynomialRoots_complete`: The decoded values are exactly all distinct roots.
- `isolatePolynomialRoots_nodup`: No root occurs twice.
- `isolatePolynomialRoots_disjoint`: Different output rectangles are disjoint.

Tests.

- `test_isolate_constant` (degenerate): A nonzero constant has no roots.
- `test_isolate_repeated` (non-example): X² returns one distinct root, not two boxes containing zero.
- `test_isolate_complex` (computation): X²+1 returns two distinct complex roots.

### Continued L-values and finite conductor ranges

**Certified continued Dirichlet L-values — `dirichletLBox`.** For a primitive complex Dirichlet character χ of positive modulus q, a rational complex point z away from the principal-character pole at s=1, and requested precision P, dirichletLBox returns a rational complex rectangle containing the native continued LFunction(χ,z), with each component width at most 2^(−P). Character values require certified algebraic presentations. Euler–Maclaurin or an approximate functional equation supplies analytic continuation evaluation; the raw Dirichlet series is used only where it converges.

Construction or proof. Import the native continued function. Evaluate finite character sums and special-function terms with enclosing arithmetic, then add a proved uniform remainder. The principal-character pole is rejected by hypothesis. For nonrational evaluation points, consume a shrinking input enclosure and a local derivative bound in the same evaluator.

Prerequisites. Mathlib `DirichletCharacter.LFunction`; Mathlib `DirichletCharacter.IsPrimitive`; `complexBoxSet` (CN.4); `AlgebraicRootCertificate` (CN.0).

Source. [Platt](#source-platt), §§4–6 and §7, pp.3–15.

API.

- `dirichletLBox_sound`: The native meromorphic L-value is enclosed.
- `dirichletLBox_width`: Both component widths are at most 2^(−P).
- `dirichletLBox_nonvanishing`: Exclusion of zero certifies nonvanishing.

Tests.

- `test_lbox_zeta_two` (computation): The modulus-one value at 2 encloses ζ(2).
- `test_lbox_pole` (non-example): The principal modulus-one input at 1 fails the pole guard.
- `test_lbox_critical_line` (compatibility): The central point uses the continued L-function, even though its raw Dirichlet series is outside absolute convergence.

**Certified cusp-form L-value enclosure — `cuspLBox`.** For positive integer weight k, a level-one cusp form f with integral q-expansion, a rational complex argument z and precision P, cuspLBox returns a rational rectangle containing the native continued ModularForm.L(k,f,z), with each coordinate width at most 2^(−P). The finite coordinates of f are supplied through the certified Miller basis. The algorithm uses the imported functional equation and a smoothed series with effective coefficient and truncation bounds; it does not use the raw Dirichlet series outside its convergence half-plane. General levels, algebraic coefficient embeddings and Fricke-transformed data are additional supplier contracts of the same evaluation contract.

Construction or proof. Obtain exact finite coordinates through the integral lattice and Miller basis. Import the native continuation and functional equation. Enclose finite sums and bound both smoothed tails before outward rounding. Effective constants and the general-level normalization comparison are additional proof requirements.

Prerequisites. Mathlib `ModularForm.L`; Mathlib `ModularForm.weakFEPair`; Mathlib `WeakFEPair.functional_equation`; `complexBoxSet` (CN.4); `millerBasis` (CN.3); `integralCuspLattice` (CN.3); **ModularForms, Layer 7**.

Source. [Arb](#source-arb), §§5–6, pp.7–10.

API.

- `cuspLBox_contains`: The rectangle encloses the native continuation at the rational point.
- `cuspLBox_width`: Both coordinate widths satisfy the requested absolute precision.
- `cuspLBox_excludes_zero`: Excluding zero proves nonvanishing and never an exact vanishing claim.

Tests.

- `test_cuspL_zero` (degenerate): A zero cusp form has an enclosure containing zero.
- `test_cuspL_precision` (computation): At precision eight both widths are at most 1/256.
- `test_cuspL_no_zero_inference` (non-example): The explicit rectangle [−1,1]×[−1,1] contains both zero and one, so membership of zero alone in this enclosure does not prove exact vanishing.
- `test_cuspL_singleton_zero` (degenerate): The singleton rectangle {0}×{0} contains only zero; a certified value in this exact rectangle is zero.

**Platt’s finite-conductor zero certificate target — `platt_bounded_height`.** For primitive χ of modulus q≤400000, every zero s of the native LFunction in 0<Re(s)<1 with |Im(s)|≤H(q) has Re(s)=1/2, where H(q)=max(10⁸/q,7.5·10⁷/q+200) for even q and max(10⁸/q,3.75·10⁷/q+200) for odd q. This parity is the modulus parity, not character parity. The unconditional finite computation is not an assumption of global GRH.

Construction or proof. Reconstruct the character enumeration, interval evaluations, sign-change zero isolations and Turing upper count. Equality between the isolated zero count and the upper count excludes missed off-line zeros. This chain and its datasets remain separate construction requirements.

Prerequisites. `dirichletLBox` (CN.4); Mathlib `DirichletCharacter.LFunction`; Mathlib `DirichletCharacter.IsPrimitive`.

Source. [Platt](#source-platt), Theorems 7.1–7.2, pp.14–15.

**Platt’s central nonvanishing target — `platt_central_nonvanishing`.** For every primitive complex Dirichlet character of modulus q≤2000000, LFunction(χ,1/2)≠0. This is a separate finite certificate target from the bounded-height zero-line theorem.

Construction or proof. Enumerate every primitive character and produce an interval for its central value excluding zero. Increase certified precision in every unresolved case; never accept a box merely because its midpoint is nonzero.

Prerequisites. `dirichletLBox` (CN.4); Mathlib `DirichletCharacter.LFunction`; Mathlib `DirichletCharacter.IsPrimitive`.

Source. [Platt](#source-platt), Theorems 7.1–7.2, pp.14–15.

**No real zeros for conductor at most 400000 — `small_conductor_no_real_zero`.** For primitive χ of modulus q≤400000 and real s with 0<s<1, the native continued LFunction(χ,s) is nonzero. This is the exact computation input used by Bennett–Siksek Proposition 7.2.

Construction or proof. A hypothetical real zero has height zero, so the bounded-height theorem forces s=1/2. The separate central nonvanishing theorem excludes that value.

Prerequisites. `platt_bounded_height` (CN.4); `platt_central_nonvanishing` (CN.4).

Source. [Platt](#source-platt), Theorems 7.1–7.2, pp.14–15; [BennettSiksek](#source-bennettsiksek), §7, proof of Proposition 7.2, p.376.

### Gram inequalities, complete covers and dataset verification

**Entrywise lower bounds on effective vectors — `effectiveGram_lower`.** Let A,B be real n×n matrices. If B_ij≤A_ij for every i,j and x_i≥0 for every i, then Σ_ij B_ij x_i x_j≤Σ_ij A_ij x_i x_j. Symmetry is unnecessary for this inequality. The nonnegative-coordinate hypothesis is essential.

Construction or proof. Every x_i x_j is nonnegative. Multiply each entry inequality by this number and sum.

Prerequisites. `intervalMul_sound` (CN.4).

Source. [CT](#source-ct), Remark 2.11, pp.281–282.

**Loewner lower bounds on unrestricted vectors — `loewnerGram_lower`.** For symmetric real matrices A and B with A−B positive semidefinite, xᵀBx≤xᵀAx for every real vector x, including mixed signs.

Construction or proof. Evaluate the positive-semidefinite inequality on x and expand the difference.

Prerequisites. Native arithmetic, finite lists and functions..

Source. [CT](#source-ct), Remark 2.11, pp.281–282.

**Rational witness of Gram negativity — `NegativeGramCertificate`.** For an n×n matrix I of rational enclosing intervals and a rational vector t, NegativeGramCertificate I consists of t_i≥0 for every i, t≠0, and the strictly negative rational upper bound Σ_ij I_ij.upper t_i t_j<0. It does not store an approximate eigenvalue as evidence.

Construction or proof. The fields are exact rational inequalities. Nonnegativity permits endpointwise upper bounding.

Prerequisites. Mathlib `NonemptyInterval`; `effectiveGram_lower` (CN.4).

Source. [CT](#source-ct), Algorithm 2.4.4, pp.282–283.

API.

- `NegativeGramCertificate.upper_negative`: The stored endpoint quadratic value is strictly negative.
- `NegativeGramCertificate.vector_ne_zero`: The witness vector is nonzero.
- `NegativeGramCertificate.scale`: Multiplying the vector by a positive rational preserves certification.
- `NegativeGramCertificate.scale_vector`: The scaled certificate uses exactly r times the original vector.

Tests.

- `test_negativeGram_one` (computation): The one-dimensional interval [−2,−1] admits vector 1.
- `test_negativeGram_zero_dim` (degenerate): Dimension zero admits no nonzero vector certificate.
- `test_negativeGram_crossing` (non-example): The one-dimensional enclosure [−1,1] certifies no negative value by this rule.

**Soundness of the negativity certificate — `NegativeGramCertificate.sound`.** If A_ij lies in interval I_ij and c is a NegativeGramCertificate I, then c.vectorᵀ A c.vector<0 over ℝ.

Construction or proof. Cast the exact rational upper inequality to ℝ. Sum entrywise upper bounds weighted by nonnegative vector products.

Prerequisites. `NegativeGramCertificate` (CN.4); `effectiveGram_lower` (CN.4).

Source. [CT](#source-ct), Algorithm 2.4.4, step 4, pp.282–283.

**Effective vectors from a certified ellipsoid cover — `effectiveEllipsoidCover`.** Given a certified finite cover S of all integer vectors x with xᵀBx≤c, effectiveEllipsoidCover filters S by nonnegative coordinates and the exact rational bound xᵀBx≤c. If B is entrywise below the real target Gram matrix A, then every effective integer x with xᵀAx≤c remains in the output. The result may contain vectors failing the true A-bound, so it is a cover of the required set, not an exact list for A. A safety factor such as 1.001 must appear in the supplied c and never be silently described as the original cutoff.

Construction or proof. Import GN.5’s complete exact enumeration. Filter with decidable integer/rational inequalities. The effective Gram comparison proves that each required A-short vector is B-short and therefore was enumerated.

Prerequisites. **GeometryOfNumbersAndQuadraticArithmetic, GN.5**; `effectiveGram_lower` (CN.4).

Source. [CT](#source-ct), Remark 2.11 and §2.4.3, pp.281–282.

API.

- `mem_effectiveEllipsoidCover`: Membership is membership in S plus the two exact filter conditions.
- `effectiveEllipsoidCover_subset`: Filtering never invents a vector.
- `effectiveEllipsoidCover_complete`: Every nonnegative B-short vector is retained when S is exhaustive.

Tests.

- `test_effective_cover_zero` (degenerate): The zero vector survives any nonnegative cutoff when supplied.
- `test_effective_cover_negative` (non-example): A negative coordinate is rejected even inside the ellipsoid.
- `test_effective_cover_boundary` (computation): A vector on the exact rational boundary is retained.

**Finite Gram-negativity checker — `checkNegativeGram`.** checkNegativeGram I t is true exactly when every rational coordinate of t is nonnegative, t is not the zero vector, and the rational quadratic sum using upper interval endpoints is strictly negative. It verifies a raw proposed witness, independently of how t was found. For mixed-sign vectors this endpoint checker deliberately rejects the witness; use full interval products or a different certified bound instead.

Construction or proof. All arithmetic and comparisons are rational and finite. A successful check constructs the previously specified NegativeGramCertificate with exactly the supplied vector.

Prerequisites. `NegativeGramCertificate` (CN.4); `effectiveGram_lower` (CN.4).

Source. [CT](#source-ct), Algorithms 2.4.4–2.4.5, pp.282–284.

API.

- `checkNegativeGram_iff`: Acceptance is exactly the three finite rational conditions.
- `checkNegativeGram_certificate`: Success supplies a certificate with the same vector.
- `checkNegativeGram_scale`: Scaling by a positive rational preserves the Boolean verdict.

Tests.

- `test_check_negative` (computation): Upper endpoint −1 and vector 1 pass.
- `test_check_zero_vector` (degenerate): The zero vector never passes.
- `test_check_ambiguous_sign` (non-example): An interval straddling zero fails even if its lower endpoint is negative.

**Finite family of Gram certificates — `checkGramDataset`.** A raw Gram row is a dimension n, an n×n rational interval matrix and an n-coordinate rational vector. checkGramDataset applies checkNegativeGram to every row and returns their Boolean conjunction. Acceptance says exactly that every listed witness certifies a negative real quadratic value, assuming the analytic entries are enclosed. It does not assert that the list exhausts a mathematical search space; coverage comes separately from the enumeration certificate. Source identifiers, software pins and file hashes are handoff provenance, not new mathematical structures.

Construction or proof. Use a dependent pair over n and a finite List. Check each row independently; prove the all-members equivalence by list induction.

Prerequisites. `checkNegativeGram` (CN.4); `ctEnclosure` (CN.4); `effectiveEllipsoidCover` (CN.4).

Source. [CT](#source-ct), §§2.4.6 and 4.1–4.3, pp.284–286 and 295–299.

API.

- `checkGramDataset_iff`: All rows pass iff every member’s finite checker passes.
- `checkGramDataset_append`: Checking concatenation is the conjunction of the two checks.
- `checkGramDataset_perm`: Reordering rows does not change acceptance.

Tests.

- `test_dataset_empty` (degenerate): The empty list passes, proving nothing about coverage.
- `test_dataset_single` (computation): A one-row negative certificate passes.
- `test_dataset_bad_row` (non-example): Adding a zero-vector row makes the entire dataset fail.

**Correct multiplicity lift for Gram witnesses — `multiplicityGram_lift`.** Let m_i>0 be block sizes, A∈ℝ and K an n×n real matrix. On the expanded index set {(i,r):0≤r<m_i}, put B_(i,r),(j,s)=A·δ_(i,r),(j,s)−K_ij. For any vector t, the expanded vector x_(i,r)=t_i/m_i satisfies xᵀBx=tᵀβt, where β_ij=(A/m_i)δ_ij−K_ij. Thus a certified negative value for β gives one for B. The lift is t_i/m_i; replacing it by t_i/√m_i changes the off-diagonal normalization. This equality does not assert equality of Euclidean unit-sphere minima.

Construction or proof. Sum each constant block contribution and the diagonal terms separately. Each diagonal block contributes A·m_i·(t_i/m_i)²=A t_i²/m_i, while each off-diagonal block contributes −K_ij t_i t_j.

Prerequisites. `NegativeGramCertificate` (CN.4).

Source. [CT](#source-ct), §2.4.2, Equation (2.4.4), p.278 and reduction pp.280–281; Algorithm 2.4.5, p.283.

## CN.5: Binding and replay of arithmetic datasets

An arithmetic dataset is used through the mathematical certificate that binds
its rows to native objects. Reuse the CN.0 presentation and cost interfaces and
the CN.4 finite checkers; no additional mathematical carrier is needed. Store
the exact input range, enumeration order, normalization, coefficient embedding,
precision and every rational endpoint needed to replay an accepted result.
Specify the interpreter and dependency versions, an unambiguous serialization,
and content hashes for the inputs and outputs. A hash binds bytes, not their
mathematical meaning: the decoding and verifier soundness theorems remain the
source of correctness.

For modular data, replay all coefficient and Hecke bindings from CN.3. For the
CT datasets, replay the exact scalar bounds, row admissibility, the complete
ellipsoid cover and every negativity witness from CN.4. For the Platt ranges,
replay the complete character enumeration, error bounds, isolated zeros and
Turing counts, separately from the central nonvanishing records. State the
finite range established by each replay. Samples and checksums cannot replace
the completeness assertions in those targets.

Prerequisites. CN.0 RAM/presentation interfaces, CN.3 finite coefficient
certificates, and CN.4 `checkNegativeGram`, `checkGramDataset`, complete covers
and analytic zero-count certificates. Sources. CT §§2.4.6 and 4.1–4.3,
pp.284–286 and 295–299; Platt §§4–7, pp.3–15; Arb §5, pp.7–8.

## References

Locators use the printed page numbers of the linked version unless explicitly
marked as PDF pages. The sources motivate or prove the mathematical statements
at the cited locations; finite-data adapters and algorithms described as
construction requirements also need the stated decoding and termination proofs.
In particular, Arb supplies enclosure semantics, not the exact polynomial
root-count algorithm, and Shoup §§16.5–16.6 supplies extension-field context,
not the complete rational-factor recombination proof. The CL reference is the
French preprint and its Proposition 3.17; the English edition has different
numbering.

<a id="source-shoup"></a>

- **Shoup**: Victor Shoup, [A Computational Introduction to Number Theory and Algebra](https://shoup.net/ntb/ntb-v2.pdf), Version 2.

<a id="source-stein"></a>

- **Stein**: William Stein, [Modular Forms: A Computational Approach](https://wstein.org/books/modform/stein-modform.pdf), Author PDF.

<a id="source-arb"></a>

- **Arb**: Fredrik Johansson, [Arb: efficient arbitrary-precision midpoint-radius interval arithmetic](https://arxiv.org/pdf/1611.02831), arXiv:1611.02831v1.

<a id="source-ct"></a>

- **CT**: Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), Publ. Math. IHÉS 131 (2020), 261–323.

<a id="source-bcg"></a>

- **BCG**: George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf), JAMS 38 (2025), 509–520.

<a id="source-numberrings"></a>

- **NumberRings**: Peter Stevenhagen, [The arithmetic of number rings](https://library.slmath.org/books/Book44/files/08psh.pdf), MSRI 44 (2008), pp.209–266.

<a id="source-gmn"></a>

- **GMN**: Jordi Guàrdia, Jesús Montes, Enric Nart, [Newton polygons of higher order in algebraic number theory](https://arxiv.org/pdf/0807.2620), arXiv:0807.2620v2.

<a id="source-carusopublished"></a>

- **CarusoPublished**: Xavier Caruso, [Computations with p-adic numbers](https://www.numdam.org/item/10.5802/ccirm.25.pdf), Les cours du CIRM 5 (2017), no.1, II.

<a id="source-bennettsiksek"></a>

- **BennettSiksek**: Michael Bennett, Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Annals of Mathematics 191 (2020), 355–392.

<a id="source-thery"></a>

- **Thery**: Laurent Théry, [Primality Tests and Prime Certificate](https://arxiv.org/pdf/2203.16341), arXiv:2203.16341.

<a id="source-platt"></a>

- **Platt**: David Platt, [Numerical computations concerning the GRH](https://arxiv.org/pdf/1305.3087), arXiv:1305.3087, 15-page preprint.

<a id="source-prattnotes"></a>

- **PrattNotes**: Vašek Chvátal, [Pratt’s primality proofs](https://users.encs.concordia.ca/~chvatal/notes/ppp.pdf), Author lecture notes, 5 pages.

<a id="source-cl"></a>

- **CL**: Gaëtan Chenevier and Jean Lannes, [Formes automorphes et voisins de Kneser des réseaux de Niemeier](https://arxiv.org/pdf/1409.7616), arXiv:1409.7616, French 461-page preprint.

<a id="source-cg13"></a>

- **CG13**: Craig Citro and Alexandru Ghitza, [Computing level one Hecke eigensystems (mod p)](https://arxiv.org/pdf/1102.3321v2), arXiv:1102.3321v2, 29 March 2011; journal publication 2013 not independently collated.
