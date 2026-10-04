# Certified computational number theory and arithmetic data

Certified computational number theory extends exact library carriers with independently checked finite certificates, source-scoped algorithm guarantees and validated enclosures. This pass separates discovery from verification, conditional running times from unconditional certificate soundness, and numerical inequalities from exact identities. It imports the finite-field algorithms, intrinsic number-field theory, normal forms and geometric constructions from their owners.

This document is a plan against the recorded library pins. This breadth-first pass is complete under Protocol 0: all six stages are planned and all nine routed items are mapped, with the explicit refinements below. No stage is closed and every declaration is unchecked. The sources and proof obligations below distinguish mathematical assumptions from data a checker must verify.

## CN.0

### RAM instruction

**ComputationalNumberTheory:CN.0/ram-instruction**. Proposed declaration: TauCeti.Computational.RAMInstruction.

RAMInstruction has arithmetic, branch and halt constructors. An operand is either an integer literal or a pair (indirect,address), with address in ℕ. A destination is such a pair, without the literal alternative. Arithmetic operations are indexed 0,1,2,3 for addition, subtraction, multiplication and floor division. Branch comparisons are indexed 0,…,5 for equality, inequality, less, greater, less-or-equal and greater-or-equal. Programs are finite lists of instructions.

Construction or proof: Use an inductive instruction type, existing sum and product types for operands and destinations, and finite indices for the operation tables.

Prerequisites: .

- **TauCeti.Computational.ramInstruction_halt_ne_arithmetic** (characterisation): Halt and arithmetic instructions are distinct.
- **TauCeti.Computational.ramInstruction_branch_injective** (extensionality): Branch instructions with a common comparison and operands agree precisely when their targets agree.
- **TauCeti.Computational.ramInstruction_arithmetic_injective** (extensionality): Arithmetic instructions with common destinations and operands agree precisely when their operations agree.

- Test **TauCeti.Computational.test_ram_halt** (degenerate): The one-instruction halt program has length one.
- Test **TauCeti.Computational.test_ram_assignment** (computation): The literal assignment 2+3 to cell 0 is a well-formed arithmetic instruction.
- Test **TauCeti.Computational.test_ram_branch_distinct** (non-example): Changing a branch target changes its syntax.

Acceptance: The one-instruction halt program has length one. The literal assignment 2+3 to cell 0 is a well-formed arithmetic instruction. Changing a branch target changes its syntax.

Sources: Shoup, §3.2, printed pp.53–55.

### RAM operand evaluation

**ComputationalNumberTheory:CN.0/ram-operand-evaluation**. Proposed declaration: TauCeti.Computational.ramRead.

ramRead m evaluates an integer literal as itself, a direct operand (false,i) as m(i), and an indirect operand (true,i) as m(m(i)) when m(i)≥0. A negative indirect address returns none. Memory m is the exact existing function type ℕ→ℤ.

Construction or proof: Inspect the operand tag. Check nonnegativity before converting an indirect address from ℤ to ℕ.

Prerequisites: ComputationalNumberTheory:CN.0/ram-instruction.

- **TauCeti.Computational.ramRead_literal** (simp): Literals evaluate to themselves.
- **TauCeti.Computational.ramRead_direct** (simp): Direct addressing reads the selected cell.
- **TauCeti.Computational.ramRead_indirect** (characterisation): Indirect evaluation succeeds exactly at nonnegative stored addresses.

- Test **TauCeti.Computational.test_ram_literal_negative** (computation): Negative literal values are allowed.
- Test **TauCeti.Computational.test_ram_zero_memory** (degenerate): Indirect cell 0 in zero memory reads zero.
- Test **TauCeti.Computational.test_ram_negative_address** (non-example): A negative stored address is rejected, rather than truncated to zero.

Acceptance: Negative literal values are allowed. Indirect cell 0 in zero memory reads zero. A negative stored address is rejected, rather than truncated to zero.

Sources: Shoup, §3.2, printed pp.53–55.

### Partial RAM transition

**ComputationalNumberTheory:CN.0/ram-step**. Proposed declaration: TauCeti.Computational.ramStep.

ramStep P (pc,m) returns an error if pc is outside P, an operand or destination has a negative indirect address, or a floor-division denominator is zero. Halt returns a successful none. A successful arithmetic step writes its result to the resolved destination and increments pc; a branch preserves memory and jumps to its target exactly when its comparison holds, otherwise increments pc. Floor division is floor of the rational quotient, including negative denominators.

Construction or proof: Resolve the instruction and operands with ramRead. For arithmetic, resolve the destination using the old memory, evaluate the indexed operation, and update exactly one cell. For branch, evaluate the indexed comparison. Errors remain distinct from normal halt.

Prerequisites: ComputationalNumberTheory:CN.0/ram-instruction, ComputationalNumberTheory:CN.0/ram-operand-evaluation.

- **TauCeti.Computational.ramStep_halt** (simp): Executing a halt instruction terminates successfully.
- **TauCeti.Computational.ramStep_empty** (simp): An empty program fails at every counter.
- **TauCeti.Computational.ramStep_deterministic** (characterisation): The partial semantics has a unique result at each configuration.

- Test **TauCeti.Computational.test_ram_add** (computation): Literal 2+3 writes 5 to cell 0.
- Test **TauCeti.Computational.test_ram_floor** (non-example): Floor division 3/(−2) gives −2, not −1.
- Test **TauCeti.Computational.test_ram_halts** (degenerate): Halt is a successful termination rather than an error.

Acceptance: Literal 2+3 writes 5 to cell 0. Floor division 3/(−2) gives −2, not −1. Halt is a successful termination rather than an error.

Sources: Shoup, §3.2, printed pp.53–55.

### Finite RAM execution

**ComputationalNumberTheory:CN.0/ram-machine-model-and-bit-complexity**. Proposed declaration: TauCeti.Computational.RAMExecution.

A RAMExecution P is a nonempty list of configurations (pc,m) beginning at counter zero. Each adjacent pair c,d satisfies ramStep P c=ok(some d); the final configuration satisfies ramStep P c=ok none. Its instruction count is the list length, including the final halt. The input-size and memory-magnitude bounds are separate obligations, not part of the raw execution type. This refines the retained legacy model node.

Construction or proof: Store a positive length T and configurations indexed by Fin T. Require counter zero initially, the transition equations for successive indices, and final halt.

Prerequisites: ComputationalNumberTheory:CN.0/ram-step.

- **TauCeti.Computational.RAMExecution.instructionCount_pos** (projection): Every successful execution has at least its final halt instruction.
- **TauCeti.Computational.RAMExecution.first_pc** (simp): The first counter is zero.
- **TauCeti.Computational.RAMExecution.final_halts** (characterisation): The final configuration halts successfully.

- Test **TauCeti.Computational.test_ram_execution_halt** (computation): The halt-only program has an execution of length one.
- Test **TauCeti.Computational.test_ram_execution_empty** (degenerate): The empty program has no successful execution.
- Test **TauCeti.Computational.test_ram_execution_loop** (non-example): An unconditional self-jump has no finite successful execution.

Acceptance: The halt-only program has an execution of length one. The empty program has no successful execution. An unconditional self-jump has no finite successful execution.

Sources: Shoup, §3.2, printed pp.53–55.

### Cost of a RAM execution

**ComputationalNumberTheory:CN.0/costed-ram-trace**. Proposed declaration: TauCeti.Computational.bitCost.

Given a successful execution e and an explicit nonnegative natural cost C(pc,m) for simulating each instruction in bits, bitCost C e is the sum of C over all executed configurations. The model accepts no default equality between this sum and the unit-cost instruction count.

Construction or proof: Sum the supplied cost over Fin e.length. The cost function must include address, operand and arithmetic costs of the chosen bit implementation.

Prerequisites: ComputationalNumberTheory:CN.0/ram-machine-model-and-bit-complexity.

- **TauCeti.Computational.bitCost_one** (compatibility): The constant unit charge recovers the instruction count.
- **TauCeti.Computational.bitCost_add** (relation): Costs add pointwise.
- **TauCeti.Computational.bitCost_mono** (functoriality): Pointwise larger instruction charges give a larger total.

- Test **TauCeti.Computational.test_bitCost_zero** (degenerate): Zero charge gives total zero.
- Test **TauCeti.Computational.test_bitCost_two** (computation): Constant charge two gives twice the execution length.
- Test **TauCeti.Computational.test_bitCost_not_unit** (non-example): Constant charge two is strictly greater than the unit count for every successful execution.

Acceptance: Zero charge gives total zero. Constant charge two gives twice the execution length. Constant charge two is strictly greater than the unit count for every successful execution.

Sources: Shoup, §3.6, printed p.72.

### Bounded instruction costs give a total bound

**ComputationalNumberTheory:CN.0/costed-trace-upper-bound**. Proposed declaration: TauCeti.Computational.bitCost_le.

If every executed configuration in e has bit-simulation charge at most B, then bitCost C e≤e.length·B. Instantiating B by a proved function of the largest address and operand width is necessary before transferring a RAM running-time estimate to bit complexity.

Construction or proof: Compare each summand with B and evaluate the finite constant sum.

Prerequisites: ComputationalNumberTheory:CN.0/costed-ram-trace.



Acceptance: A bound growing with operand width remains visible in B.

Sources: Shoup, §§3.2,3.6, pp.55,72.

### Isolated algebraic root certificate

**ComputationalNumberTheory:CN.0/algebraic-root-certificate**. Proposed declaration: TauCeti.Computational.AlgebraicRootCertificate.

An AlgebraicRootCertificate stores a nonzero polynomial f∈ℚ[X], two closed rational intervals R,I, and a proof that exactly one complex z satisfies f(z)=0 and Re(z)∈R, Im(z)∈I. Repeated polynomial roots are permitted: uniqueness concerns distinct roots, not their multiplicities. The exact carrier is the native relative algebraic closure of ℚ in ℂ; the finite polynomial and rectangle are presentation data, not a replacement field. The uniqueness proof is a separate checked obligation, not inferred from small diameter.

Construction or proof: Use native Polynomial and NonemptyInterval for finite data. Define the root-and-rectangle predicate explicitly and require unique existence. The certificate is a semantic specification; a terminating finite verifier needs a root-count certificate, recorded as a gap.

Prerequisites: mathlib:algebraicClosure, mathlib:mem_algebraicClosure_iff, mathlib:NonemptyInterval.

- **TauCeti.Computational.AlgebraicRootCertificate.value** (projection): Decode the unique root as a native complex algebraic number.
- **TauCeti.Computational.AlgebraicRootCertificate.value_spec** (characterisation): The decoded value is a root lying in both displayed intervals.
- **TauCeti.Computational.AlgebraicRootCertificate.value_unique** (extensionality): Any root in the rectangle equals the decoded value.

- Test **TauCeti.Computational.test_algebraic_zero** (degenerate): X with both intervals [0,0] isolates zero.
- Test **TauCeti.Computational.test_algebraic_repeated** (computation): X² with the singleton zero rectangle is allowed.
- Test **TauCeti.Computational.test_algebraic_ambiguous** (non-example): X²−1 cannot isolate a unique root in [−2,2]×[0,0].

Acceptance: X with both intervals [0,0] isolates zero. X² with the singleton zero rectangle is allowed. X²−1 cannot isolate a unique root in [−2,2]×[0,0].

Sources: Arb, §§5–5.3, pp.7–8.

### Exact rational root presentation

**ComputationalNumberTheory:CN.0/rational-root-presentation**. Proposed declaration: TauCeti.Computational.rationalRootCertificate.

For r∈ℚ, rationalRootCertificate r consists of X−r, the singleton real interval [r,r] and singleton imaginary interval [0,0]. Its decoded value is the native embedding of r into the complex algebraic numbers. Integers and rationals themselves use native ℤ and normalized ℚ; no new arithmetic carrier is introduced.

Construction or proof: The linear polynomial has exactly the root r. The rational casts commute with addition and multiplication by the existing field homomorphism laws.

Prerequisites: ComputationalNumberTheory:CN.0/algebraic-root-certificate.

- **TauCeti.Computational.rationalRootCertificate_value** (compatibility): Decoding is the rational algebra map.
- **TauCeti.Computational.rationalRootCertificate_add** (compatibility): Rational addition commutes with decoding.
- **TauCeti.Computational.rationalRootCertificate_mul** (compatibility): Rational multiplication commutes with decoding.

- Test **TauCeti.Computational.test_rational_zero** (degenerate): Zero decodes to zero.
- Test **TauCeti.Computational.test_rational_half** (computation): One half plus one third decodes as five sixths.
- Test **TauCeti.Computational.test_rational_distinct** (non-example): One half and one third have different decoded values.

Acceptance: Zero decodes to zero. One half plus one third decodes as five sixths. One half and one third have different decoded values.

Sources: Arb, §§5–5.3, pp.7–8.

### Addition of isolated algebraic numbers

**ComputationalNumberTheory:CN.0/algebraic-add-certificate**. Proposed declaration: TauCeti.Computational.algebraic_add_certificate.

Given isolated algebraic inputs a,b, there exists an isolated-root certificate whose value is their sum. An effective implementation must construct an annihilating polynomial, isolate its relevant distinct root and prove this value equation. The theorem specifies the exact operation; no running time or implemented checker is asserted.

Construction or proof: Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. Effective elimination and root-count witnesses remain explicit refinements.

Prerequisites: ComputationalNumberTheory:CN.0/algebraic-root-certificate, mathlib:algebraicClosure.



Acceptance: The decoded equality distinguishes different embeddings of the same abstract field. The inverse contract rejects zero.

Sources: Arb, §§5–5.3, pp.7–8.

### Multiplication of isolated algebraic numbers

**ComputationalNumberTheory:CN.0/algebraic-mul-certificate**. Proposed declaration: TauCeti.Computational.algebraic_mul_certificate.

Given isolated algebraic inputs a,b, there exists an isolated-root certificate whose value is their product. An effective implementation must construct an annihilating polynomial, isolate its relevant distinct root and prove this value equation. The theorem specifies the exact operation; no running time or implemented checker is asserted.

Construction or proof: Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. Effective elimination and root-count witnesses remain explicit refinements.

Prerequisites: ComputationalNumberTheory:CN.0/algebraic-root-certificate, mathlib:algebraicClosure.



Acceptance: The decoded equality distinguishes different embeddings of the same abstract field. The inverse contract rejects zero.

Sources: Arb, §§5–5.3, pp.7–8.

### Inversion of a nonzero algebraic number

**ComputationalNumberTheory:CN.0/algebraic-inv-certificate**. Proposed declaration: TauCeti.Computational.algebraic_inv_certificate.

Given isolated algebraic inputs a with nonzero decoded value, there exists an isolated-root certificate whose value is their inverse. An effective implementation must construct an annihilating polynomial, isolate its relevant distinct root and prove this value equation. The theorem specifies the exact operation; no running time or implemented checker is asserted.

Construction or proof: Closure of the native algebraic-number field gives an annihilating rational polynomial. Its finite distinct root set allows a rational rectangle isolating the desired root. Effective elimination and root-count witnesses remain explicit refinements.

Prerequisites: ComputationalNumberTheory:CN.0/algebraic-root-certificate, mathlib:algebraicClosure.



Acceptance: The decoded equality distinguishes different embeddings of the same abstract field. The inverse contract rejects zero.

Sources: Arb, §§5–5.3, pp.7–8.

### Canonical finite p-adic approximation

**ComputationalNumberTheory:CN.0/padic-approximation**. Proposed declaration: TauCeti.Computational.PadicApproximation.

For prime p, PadicApproximation p stores integers N,v and a natural mantissa s. It is either (N,N,0), or v<N with 0<s<p^(N−v) and p∤s. Its centre is p^v·s∈ℚ and its denotation is {x∈ℚ_p | ‖x−centre‖≤p^(−N)}. N is absolute precision and N−v is relative precision in the nonzero case. Zero mantissa means the entire ball p^Nℤ_p, not the exact number zero.

Construction or proof: Store the two normalization alternatives. Use a rational centre and the native p-adic field/norm to define the closed ball. Prime p is a hypothesis of semantic theorems; syntax is parameterized by p.

Prerequisites: mathlib:padicValRat, mathlib:PadicInt.toZModPow.

- **TauCeti.Computational.PadicApproximation.center** (projection): The exact rational centre is p^v s.
- **TauCeti.Computational.PadicApproximation.denotation** (projection): The ball has radius p^(−N) in the native p-adic field.
- **TauCeti.Computational.PadicApproximation.center_mem** (simp): The centre always belongs to its ball.
- **TauCeti.Computational.PadicApproximation.zero_mem_iff** (characterisation): Zero belongs precisely to the zero-mantissa ball.

- Test **TauCeti.Computational.test_padic_zero_ball** (degenerate): The canonical zero ball at precision N has valuation N.
- Test **TauCeti.Computational.test_padic_negative_precision** (computation): The tuple (N,v,s)=(0,−1,1) is permitted at p=3 and has centre 1/3.
- Test **TauCeti.Computational.test_padic_nonunit_mantissa** (non-example): A nonzero mantissa divisible by p cannot be canonical.

Acceptance: The canonical zero ball at precision N has valuation N. The tuple (N,v,s)=(0,−1,1) is permitted at p=3 and has centre 1/3. A nonzero mantissa divisible by p cannot be canonical.

Sources: CarusoPublished, §2.1.1, pp.17–19.

### Polynomial magnitude bound for RAM memory

**ComputationalNumberTheory:CN.0/ram-polynomial-magnitude**. Proposed declaration: TauCeti.Computational.PolynomialRAMMagnitude.

PolynomialRAMMagnitude e n A b C means that every memory entry in every configuration of an execution e on n input cells has absolute value at most A·(n+e.length)^b+C. The parameters A,b,C are fixed independently of input in an algorithm-family theorem. This bounds stored integers, including indirect addresses; arbitrary large mathematical integers must be encoded as digit arrays.

Construction or proof: Express the uniform integer magnitude inequality. A single-trace bound does not prove an algorithm family has fixed constants or that multiplying machine words has constant bit cost.

Prerequisites: ComputationalNumberTheory:CN.0/ram-machine-model-and-bit-complexity.

- **TauCeti.Computational.polynomialRAMMagnitude_iff** (characterisation): The predicate is the uniform bound on all stored values.
- **TauCeti.Computational.polynomialRAMMagnitude_mono_constant** (functoriality): Increasing C preserves the bound.
- **TauCeti.Computational.polynomialRAMMagnitude_mono_input** (functoriality): Increasing the input-size allowance preserves the bound.

- Test **TauCeti.Computational.test_ram_zero_bound** (degenerate): An execution with all-zero memories has zero magnitude bound.
- Test **TauCeti.Computational.test_ram_magnitude_projection** (computation): Every selected cell satisfies the bound.
- Test **TauCeti.Computational.test_ram_nonzero_excluded** (non-example): A nonzero cell contradicts the all-zero bound.

Acceptance: An execution with all-zero memories has zero magnitude bound. Every selected cell satisfies the bound. A nonzero cell contradicts the all-zero bound.

Sources: Shoup, §3.2, printed pp.54–55.

### Equality of isolated algebraic numbers

**ComputationalNumberTheory:CN.0/algebraic-equality-check**. Proposed declaration: TauCeti.Computational.algebraicEqual.

algebraicEqual compares the decoded native algebraic numbers of two certified isolated-root presentations. Its Boolean answer is true exactly when the values are equal. Finite verification uses polynomial gcd and a common-root isolation argument; overlapping rectangles alone do not prove equality, and disjoint rectangles are only a sufficient inequality test.

Construction or proof: Compare the annihilating polynomials and isolate their common roots. Terminating certified root-count and separation algorithms are recorded missing proof inputs. The prototype is a specification of the exact answer.

Prerequisites: ComputationalNumberTheory:CN.0/algebraic-root-certificate.

- **TauCeti.Computational.algebraicEqual_iff** (characterisation): Acceptance is equality in the native relative algebraic closure.
- **TauCeti.Computational.algebraicEqual_refl** (simp): Every presentation equals itself.
- **TauCeti.Computational.algebraicEqual_symm** (relation): The verdict is symmetric.

- Test **TauCeti.Computational.test_algebraic_equal_zero** (degenerate): Two rational zero inputs compare equal.
- Test **TauCeti.Computational.test_algebraic_equal_fraction** (computation): Different rational expressions for the same number compare equal.
- Test **TauCeti.Computational.test_algebraic_unequal_fraction** (non-example): One half and one third compare unequal.

Acceptance: Two rational zero inputs compare equal. Different rational expressions for the same number compare equal. One half and one third compare unequal.

Sources: Arb, §§5–5.3, pp.7–8.

## CN.1

### Recursive Pratt certificate

**ComputationalNumberTheory:CN.1/pratt-certificate**. Proposed declaration: TauCeti.Computational.PrattCertificate.

A PrattCertificate is either the leaf two or a node (n,a,children), where n and a are natural numbers and children is a finite list of Pratt certificates. Its value is 2 at the leaf and n at a node. Repeated children encode repeated prime factors of n−1. This raw syntax contains no unverified primality proof.

Construction or proof: Define a finite inductive tree with the leaf and node constructors. Define value by pattern matching.

Prerequisites: mathlib:lucas_primality, mathlib:reverse_lucas_primality, mathlib:Nat.primeFactorsList.

- **TauCeti.Computational.PrattCertificate.value_two** (simp): The leaf has value 2.
- **TauCeti.Computational.PrattCertificate.value_node** (projection): A node stores its claimed value n.
- **TauCeti.Computational.PrattCertificate.node_injective** (extensionality): Two nodes are equal precisely when all their raw data are equal.

- Test **TauCeti.Computational.test_pratt_leaf** (degenerate): The base leaf represents 2.
- Test **TauCeti.Computational.test_pratt_three** (computation): The candidate (3,2,[two]) represents 3.
- Test **TauCeti.Computational.test_pratt_untrusted** (non-example): A malformed node may represent 1; existence of raw syntax is not primality.

Acceptance: The base leaf represents 2. The candidate (3,2,[two]) represents 3. A malformed node may represent 1; existence of raw syntax is not primality.

Sources: PrattNotes, pp.1–4, formal proof system and its length bound.

### Pratt certificate checker

**ComputationalNumberTheory:CN.1/pratt-certificate-checker**. Proposed declaration: TauCeti.Computational.PrattCertificate.check.

The checker accepts the leaf two. It accepts node(n,a,cs) iff n≥3, 0<a<n, every child checks, the product of child values is n−1, a^(n−1) mod n=1, and a^((n−1)/q) mod n≠1 for every child value q. Empty products are 1. The checker terminates by recursion on the finite tree.

Construction or proof: Recursively check the children; use exact natural modular powers and products. No probable-prime predicate enters the checker.

Prerequisites: ComputationalNumberTheory:CN.1/pratt-certificate, mathlib:lucas_primality.

- **TauCeti.Computational.PrattCertificate.check_two** (simp): The leaf is accepted.
- **TauCeti.Computational.PrattCertificate.check_node_iff** (characterisation): Acceptance is exactly the conjunction of recursive, product and modular conditions.
- **TauCeti.Computational.PrattCertificate.check_value_ge_two** (other): Acceptance excludes 0 and 1.

- Test **TauCeti.Computational.test_pratt_check_three** (computation): Witness 2 with the factor 2 certifies 3.
- Test **TauCeti.Computational.test_pratt_check_one** (degenerate): The malformed value-one node is rejected.
- Test **TauCeti.Computational.test_pratt_check_nine** (non-example): The candidate for 9 with three factors 2 and witness 2 is rejected.

Acceptance: Witness 2 with the factor 2 certifies 3. The malformed value-one node is rejected. The candidate for 9 with three factors 2 and witness 2 is rejected.

Sources: PrattNotes, pp.1–4, formal proof system and its length bound.

### Soundness of Pratt certificates

**ComputationalNumberTheory:CN.1/pratt-certificate-sound**. Proposed declaration: TauCeti.Computational.PrattCertificate.sound.

For every finite Pratt certificate c, c.check=true implies Nat.Prime(c.value).

Construction or proof: Induct on the certificate tree. The children are prime by induction. Every prime divisor of the product n−1 occurs among the child values, so the checked modular inequalities supply all hypotheses of lucas_primality.

Prerequisites: ComputationalNumberTheory:CN.1/pratt-certificate-checker, mathlib:lucas_primality, mathlib:Nat.prime_of_mem_primeFactorsList.



Acceptance: A tree asserting a composite value cannot pass even if its product identity is correct.

Sources: PrattNotes, pp.1–4, formal proof system and its length bound.

### Completeness of Pratt certificates

**ComputationalNumberTheory:CN.1/pratt-certificate-complete**. Proposed declaration: TauCeti.Computational.PrattCertificate.complete.

Every prime n is the value of a Pratt certificate accepted by the checker.

Construction or proof: Use strong induction on n, with leaf 2. For n≥3, reverse_lucas_primality supplies a Lucas witness; take its representative in 1,…,n−1. Factor n−1 using primeFactorsList. Every factor q≤n−1<n has a recursively accepted certificate.

Prerequisites: ComputationalNumberTheory:CN.1/pratt-certificate-checker, mathlib:reverse_lucas_primality, mathlib:Nat.primeFactorsList, mathlib:Nat.prod_primeFactorsList, mathlib:Nat.prime_of_mem_primeFactorsList.



Acceptance: The completeness proof is mathematical existence; it supplies no polynomial bound for finding a factorization of n−1.

Sources: PrattNotes, pp.1–4, formal proof system and its length bound.

### Strong Miller–Rabin liar

**ComputationalNumberTheory:CN.1/strong-liar**. Proposed declaration: TauCeti.Computational.StrongLiar.

For n,a∈ℕ write h=v₂(n−1) and t=(n−1)/2^h. StrongLiar n a means n>1 is odd, 0<a<n, and in ZMod n either a^t=1 or a^(t·2^j)=−1 for some j<h. The sample space is the nonzero residues 1,…,n−1; it is not restricted to units. Guards reject n=0,1 and all even n, which the primality wrapper handles separately.

Construction or proof: Use the multiplicity of 2 in n−1 via Nat.factorization and exact exponentiation in ZMod n.

Prerequisites: .

- **TauCeti.Computational.strongLiar_iff** (characterisation): The defining modular alternatives use the odd part of n−1.
- **TauCeti.Computational.strongLiar_coprime** (compatibility): A strong liar is coprime to n, although the sampling space contains nonunits.
- **TauCeti.Computational.strongLiar_one** (simp): The base 1 passes for every odd n>1.

- Test **TauCeti.Computational.test_strongLiar_prime** (computation): Base 3 passes for 7.
- Test **TauCeti.Computational.test_strongLiar_one_input** (degenerate): Input 1 is rejected.
- Test **TauCeti.Computational.test_strongLiar_composite** (non-example): 2047 is composite but passes the strong base-2 test.

Acceptance: Base 3 passes for 7. Input 1 is rejected. 2047 is composite but passes the strong base-2 test.

Sources: Shoup, §10.2, pp.308–310.

### Prime inputs pass every admissible base

**ComputationalNumberTheory:CN.1/strong-liar-prime**. Proposed declaration: TauCeti.Computational.strongLiar_of_prime.

If n is an odd prime and 0<a<n, then StrongLiar n a.

Construction or proof: Fermat gives a^(n−1)=1. In the repeated-squaring chain in the field ZMod n, the predecessor of the first 1 is either absent (a^t=1) or is −1, since the only square roots of 1 are ±1.

Prerequisites: ComputationalNumberTheory:CN.1/strong-liar.



Acceptance: The wrapper returns prime for n=2 without using the odd-input test.

Sources: Shoup, Theorem 10.2, pp.308–309.

### Miller–Rabin strong-liar bound

**ComputationalNumberTheory:CN.1/miller-rabin-probabilistic-primality**. Proposed declaration: TauCeti.Computational.strongLiar_card_le.

For odd composite n>1, the number of bases a with 0<a<n and StrongLiar n a is at most (n−1)/4. Equivalently, four times this cardinality is at most n−1. This refines the legacy bundled node to its central declaration.

Construction or proof: Split prime powers from numbers with at least two distinct prime factors. On prime powers use the cyclic-unit power-map kernel count; on at least two factors apply the CRT and the common 2-adic exponent to bound the two permitted fibres. The cyclic kernel, CRT fibre count, and Carmichael-at-least-three-primes steps remain explicit refinement obligations.

Prerequisites: ComputationalNumberTheory:CN.1/strong-liar.



Acceptance: For n=9 there are two strong liars, so equality holds against (n−1)/4.

Sources: Shoup, Theorem 10.3, pp.309–312.

### Error bound for independent Miller–Rabin rounds

**ComputationalNumberTheory:CN.1/miller-rabin-independent-rounds**. Proposed declaration: TauCeti.Computational.millerRabin_rounds_bound.

For odd composite n>1 and k∈ℕ, among all (n−1)^k equally likely tuples of bases in {1,…,n−1}, at most (n−1)^k/4^k tuples pass every strong test. Equivalently, 4^k times the number of accepting tuples is at most (n−1)^k. This counting formulation is the uniform independent product distribution; it makes no promise for correlated or adversarially chosen bases.

Construction or proof: An accepting tuple is a function into the strong-liar subset, so its cardinality is the kth power of the one-round cardinality. Raise the one-round bound to k.

Prerequisites: ComputationalNumberTheory:CN.1/miller-rabin-probabilistic-primality.



Acceptance: At k=0 the single empty tuple passes and the bound is 1. Repeating base 2 on 2047 is not independent uniform sampling.

Sources: Shoup, §10.2 algorithm and Theorem 10.3, pp.309–312.

### AKS order parameter

**ComputationalNumberTheory:CN.1/aks-parameter**. Proposed declaration: TauCeti.Computational.aksParameter.

For n>1, aksParameter n is the least r>1 such that gcd(n,r)>1 or gcd(n,r)=1 and the multiplicative order of n modulo r is greater than 4·len(n)², where len(n)=floor(log₂n)+1. Set aksParameter n=0 for n≤1. The choice is deterministic and finite because r=n is always admissible.

Construction or proof: Search r=2,…,n in increasing order using exact gcd and modular-power computations. The candidate n terminates the search.

Prerequisites: .

- **TauCeti.Computational.aksParameter_valid** (characterisation): The output is between 2 and n and satisfies the exact order-or-gcd disjunction.
- **TauCeti.Computational.aksParameter_minimal** (other): No smaller r>1 satisfies the search criterion.
- **TauCeti.Computational.aksParameter_small** (simp): Inputs 0 and 1 use sentinel zero.

- Test **TauCeti.Computational.test_aksParameter_two** (computation): Input 2 has parameter 2.
- Test **TauCeti.Computational.test_aksParameter_nine** (computation): Input 9 has parameter 3, exposing a factor.
- Test **TauCeti.Computational.test_aksParameter_one** (degenerate): Input 1 uses zero and is rejected by the primality wrapper.

Acceptance: Input 2 has parameter 2. Input 9 has parameter 3, exposing a factor. Input 1 uses zero and is rejected by the primality wrapper.

Sources: Shoup, §21.2, pp.548–549.

### AKS polynomial congruences

**ComputationalNumberTheory:CN.1/aks-polynomial-identities**. Proposed declaration: TauCeti.Computational.AKSIdentities.

AKSIdentities n r ℓ means that for each integer j with 1≤j≤ℓ, (X+j)^n and X^n+j have the same remainder on division by X^r−1 in (ZMod n)[X]. The definition is a finite family of decidable polynomial identities, separate from claims that the coefficient ring is a field.

Construction or proof: Use Polynomial.modByMonic over the commutative ring ZMod n. The algorithm supplies r>1, so the modulus is monic of degree r.

Prerequisites: .

- **TauCeti.Computational.aksIdentities_zero** (simp): The empty check range holds.
- **TauCeti.Computational.aksIdentities_mono** (functoriality): Passing a larger check range implies passing a smaller one.
- **TauCeti.Computational.aksIdentities_iff** (characterisation): The predicate is exactly the finite remainder comparison.

- Test **TauCeti.Computational.test_aksIdentities_prime** (computation): The characteristic-5 identity passes at every r and every check range.
- Test **TauCeti.Computational.test_aksIdentities_vacuous** (degenerate): With no bases, even input 9 passes the identity predicate.
- Test **TauCeti.Computational.test_aksIdentities_not_prime** (non-example): The empty identity test is not a primality criterion.

Acceptance: The characteristic-5 identity passes at every r and every check range. With no bases, even input 9 passes the identity predicate. The empty identity test is not a primality criterion.

Sources: Shoup, §21.2, pp.548–549.

### Shoup’s AKS algorithm

**ComputationalNumberTheory:CN.1/aks-algorithm**. Proposed declaration: TauCeti.Computational.aks.

aks n rejects n≤1 and every perfect power a^b with a,b>1. For the remaining n let r=aksParameter n. Return true if r=n; reject if gcd(n,r)>1; otherwise return whether AKSIdentities n r (2·len(n)·floor(√r)+1) holds. This declaration fixes the variant before any complexity statement.

Construction or proof: Decide perfect-power membership using a,b≤n. Execute the bounded parameter search. Decide the finite polynomial equalities using exact coefficients modulo n.

Prerequisites: ComputationalNumberTheory:CN.1/aks-parameter, ComputationalNumberTheory:CN.1/aks-polynomial-identities.

- **TauCeti.Computational.aks_small** (simp): Inputs at most 1 are rejected.
- **TauCeti.Computational.aks_perfect_power** (simp): Nontrivial perfect powers are rejected before the polynomial checks.
- **TauCeti.Computational.aks_check_iff** (characterisation): For a non-power input with coprime parameter r<n, acceptance is exactly the prescribed identity test.

- Test **TauCeti.Computational.test_aks_two** (computation): 2 is accepted.
- Test **TauCeti.Computational.test_aks_one** (degenerate): 1 is rejected.
- Test **TauCeti.Computational.test_aks_nine** (non-example): 9 is rejected as a perfect power.

Acceptance: 2 is accepted. 1 is rejected. 9 is rejected as a perfect power.

Sources: Shoup, §21.2, pp.548–549.

### Correctness of the AKS algorithm

**ComputationalNumberTheory:CN.1/aks-deterministic-primality**. Proposed declaration: TauCeti.Computational.aks_correct.

For every natural n, aks n=true iff n is prime. This retains the legacy AKS node ID for the correctness declaration; parameter and algorithm data are separate nodes.

Construction or proof: Prime inputs satisfy the polynomial identities by Frobenius. For a composite that reaches the final branch choose a prime p dividing n; the parameter search gives p>r and gcd(n,r)=1. Shoup’s quotient-algebra endomorphisms, upper bound on the evaluation image and lower bound from products of distinct linear factors contradict the order and length bounds. Those nonroutine algebraic estimates are still recorded proof-refinement gaps.

Prerequisites: ComputationalNumberTheory:CN.1/aks-algorithm, ComputationalNumberTheory:CN.1/aks-polynomial-identities, ComputationalNumberTheory:CN.1/aks-parameter.



Acceptance: Both directions include n=0,1,2 and nontrivial prime powers.

Sources: Shoup, §21.2 and Lemmas 21.6–21.11, pp.549–558.

### Pocklington prime-divisor congruence

**ComputationalNumberTheory:CN.1/pocklington-prime-divisor**. Proposed declaration: TauCeti.Computational.pocklington_prime_divisor.

Let n>1, F>1 and F∣n−1. Suppose that for each prime q∣F there is an integer a with a^(n−1)≡1 modulo n and gcd(a^((n−1)/q)−1,n)=1. Then every prime divisor p of n satisfies F∣p−1. The witness a may depend on q; F and (n−1)/F need not be coprime.

Construction or proof: For every prime-power q^e∣F, the order of a modulo p divides n−1 but does not divide (n−1)/q. Thus its q-adic exponent is at least e, and q^e divides p−1. Combine these prime powers.

Prerequisites: .



Acceptance: Do not replace the gcd condition by mere inequality in ZMod n; nonzero residues need not be units.

Sources: Thery, Theorem 6.1 and corrected Theorem 6.2, p.9.

### Pocklington primality criterion

**ComputationalNumberTheory:CN.1/pocklington-primality**. Proposed declaration: TauCeti.Computational.pocklington_prime.

Under the prime-divisor criterion’s hypotheses, if F²>n then n is prime.

Construction or proof: If n were composite it would have a prime divisor p≤√n<F. The preceding congruence F∣p−1 contradicts 0<p−1<F.

Prerequisites: ComputationalNumberTheory:CN.1/pocklington-prime-divisor.



Acceptance: The square-root threshold concerns the certified part F, not the largest discovered factor alone.

Sources: Thery, Theorem 6.1 and corrected Theorem 6.2, p.9.

### Integer factorization with prime certificates

**ComputationalNumberTheory:CN.1/integer-factorization-certificate**. Proposed declaration: TauCeti.Computational.IntegerFactorCertificate.

An IntegerFactorCertificate stores a sign ε∈{−1,1} and a list of raw Pratt certificates. Its value is ε times the product of their natural values, viewed in ℤ. It checks against z precisely when every Pratt tree checks and this product equals z. Units ±1 have an empty factor list. Zero has no accepted certificate, and repeated primes remain repeated list entries.

Construction or proof: Use a Bool for the sign and a finite list of existing Pratt trees. Decode by an integer product and check each tree. This certifies a discovered factorization independently of the algorithm that found it.

Prerequisites: ComputationalNumberTheory:CN.1/pratt-certificate-checker, ComputationalNumberTheory:CN.1/pratt-certificate-sound, mathlib:Nat.primeFactorsList, mathlib:Nat.prod_primeFactorsList.

- **TauCeti.Computational.IntegerFactorCertificate.value** (projection): Decode the signed product.
- **TauCeti.Computational.IntegerFactorCertificate.check** (constructor): Check exact equality and all prime certificates.
- **TauCeti.Computational.IntegerFactorCertificate.check_iff** (characterisation): Acceptance is the product equation together with acceptance of all prime witnesses.

- Test **TauCeti.Computational.test_integer_factor_unit** (degenerate): The negative sign and empty list certify −1.
- Test **TauCeti.Computational.test_integer_factor_twelve** (computation): Two copies of 2 and the accepted certificate for 3 certify 12.
- Test **TauCeti.Computational.test_integer_factor_zero** (non-example): No zero product certificate is accepted.

Acceptance: The negative sign and empty list certify −1. Two copies of 2 and the accepted certificate for 3 certify 12. No zero product certificate is accepted.

Sources: PrattNotes, pp.1–4, formal proof system and its length bound.

### Soundness of integer factorization certificates

**ComputationalNumberTheory:CN.1/integer-factorization-sound**. Proposed declaration: TauCeti.Computational.IntegerFactorCertificate.sound.

An accepted certificate for z gives z≠0 and a list of prime absolute factors whose signed product is z. Thus every prime divisor of |z| occurs among its child values; no completeness inference is made from a partial list.

Construction or proof: Apply Pratt soundness to each child. Prime factors are positive and nonzero, so their signed product is nonzero. Euclid’s lemma identifies prime divisors of the product.

Prerequisites: ComputationalNumberTheory:CN.1/integer-factorization-certificate, ComputationalNumberTheory:CN.1/pratt-certificate-sound.



Acceptance: For z=−12 the prime support is exactly {2,3}; for ±1 it is empty.

Sources: PrattNotes, pp.1–4, formal proof system and its length bound.

### Every nonzero integer admits a factor certificate

**ComputationalNumberTheory:CN.1/integer-factorization-complete**. Proposed declaration: TauCeti.Computational.IntegerFactorCertificate.complete.

Every nonzero integer z admits an accepted IntegerFactorCertificate. Use the native primeFactorsList of |z| and Pratt completeness, retaining the sign of z.

Construction or proof: The native product theorem reconstructs the positive absolute value. Each list element is prime and therefore has an accepted Pratt tree. Restore the sign.

Prerequisites: ComputationalNumberTheory:CN.1/integer-factorization-certificate, ComputationalNumberTheory:CN.1/pratt-certificate-complete, mathlib:Nat.prod_primeFactorsList, mathlib:Nat.prime_of_mem_primeFactorsList.



Acceptance: Existence is unconditional. It does not bound the search by a polynomial in the bit length.

Sources: PrattNotes, pp.1–4, formal proof system and its length bound.

### Finite Pocklington certificate

**ComputationalNumberTheory:CN.1/pocklington-certificate**. Proposed declaration: TauCeti.Computational.PocklingtonCertificate.

PocklingtonCertificate n stores a list of Pratt trees and one integer witness for each occurrence. Its certified part F is the product of the child values. The checker requires n>1, F>1, F∣n−1, n<F², all children accepted, and for each (q,a), a^(n−1)≡1 mod n and gcd(a^((n−1)/q)−1,n)=1. Repeated q encode multiplicity. The uncatalogued cofactor is allowed to remain unfactored.

Construction or proof: Represent the entries as a finite list of pairs. Every prime divisor of F is a certified child, so the list supplies the universal witnesses needed by the Pocklington criterion.

Prerequisites: ComputationalNumberTheory:CN.1/pratt-certificate-checker, ComputationalNumberTheory:CN.1/pratt-certificate-sound, ComputationalNumberTheory:CN.1/pocklington-primality.

- **TauCeti.Computational.PocklingtonCertificate.factor** (projection): F is the product of certified child values.
- **TauCeti.Computational.PocklingtonCertificate.check** (constructor): Execute all bounds, divisibility, recursive and gcd tests.
- **TauCeti.Computational.PocklingtonCertificate.check_iff** (characterisation): No prime-divisor quantification remains in the checker.

- Test **TauCeti.Computational.test_pocklington_seventeen** (computation): F=8 with three factors 2 and witness 3 certifies 17.
- Test **TauCeti.Computational.test_pocklington_empty** (degenerate): An empty factor list is rejected.
- Test **TauCeti.Computational.test_pocklington_insufficient** (non-example): A single factor 2 cannot certify 17 because 2²≤17.

Acceptance: F=8 with three factors 2 and witness 3 certifies 17. An empty factor list is rejected. A single factor 2 cannot certify 17 because 2²≤17.

Sources: Thery, Theorem 6.1 and corrected Theorem 6.2, p.9.

### Soundness of finite Pocklington certificates

**ComputationalNumberTheory:CN.1/pocklington-certificate-sound**. Proposed declaration: TauCeti.Computational.PocklingtonCertificate.sound.

If the finite Pocklington checker accepts n, then n is prime.

Construction or proof: Pratt soundness makes every child value prime. Every prime divisor of F occurs in the list, so select its recorded integer witness and apply the Pocklington criterion.

Prerequisites: ComputationalNumberTheory:CN.1/pocklington-certificate, ComputationalNumberTheory:CN.1/pratt-certificate-sound, ComputationalNumberTheory:CN.1/pocklington-primality.



Acceptance: The inference is deterministic even when factor discovery used randomized or heuristic algorithms.

Sources: Thery, Theorem 6.1 and corrected Theorem 6.2, p.9.

### Transport of certified finite-field factors

**ComputationalNumberTheory:CN.1/polynomial-factorization-over-finite-fields**. Proposed declaration: TauCeti.Computational.transport_finite_factorization.

Let e:F≃+*K be a certified change from a computable finite-field presentation to the intrinsic finite field. For nonzero f=c∏g_i with c≠0 and all g_i monic irreducible, mapping coefficients by e yields map(e,f)=e(c)∏map(e,g_i), again with monic irreducible factors. The FF.3 checker and its search algorithm supply the data; CN.1 only checks the presentation boundary and reconstructs the intrinsic factorization. The retained legacy ID no longer owns DDF, EDF or Berlekamp algorithms.

Construction or proof: Import the accepted nonzero finite-field certificate contract. A field isomorphism preserves leading coefficients, products and irreducibility. Check the presentation’s explicit inverse before transport.

Prerequisites: FiniteFieldsAndCharacterSums:FF.3/factorization-certificate-sound, FiniteFieldsAndCharacterSums:FF.0/presentation-change-isomorphism.



Acceptance: The explicit f≠0 and c≠0 hypotheses avoid the supplier definition’s zero-polynomial ambiguity. Zero is handled by a separate zero result, never an irreducible factor list.

Sources: Shoup, Theorem 19.14, pp.515–516; Chapter 20.

### Rational polynomial factor certificate

**ComputationalNumberTheory:CN.1/rational-polynomial-factor-certificate**. Proposed declaration: TauCeti.Computational.RationalFactorCertificate.

For f∈ℚ[X], RationalFactorCertificate f consists of a nonzero rational leading factor c, a finite list of monic polynomials, proofs that each is irreducible over ℚ, and the exact identity f=c∏g_i. Multiplicity is represented by repeated factors. The definition uses actual irreducibility proofs; a CAS assertion or irreducibility modulo a single prime without a valid lifting criterion is insufficient. For f∈ℤ[X], certify its coefficientwise rational image and separately retain integer content and primitive-factor normalization.

Construction or proof: Store finite polynomial data and exact proof obligations. This wraps an output of discovery, not a new factorization theory. The factory must obtain each rational irreducibility proof by a justified criterion, with exhaustive modular recombination when one-prime irreducibility is unavailable.

Prerequisites: .

- **TauCeti.Computational.RationalFactorCertificate.reconstruct** (projection): The certificate reconstructs f exactly.
- **TauCeti.Computational.RationalFactorCertificate.input_nonzero** (other): No certificate exists for the zero polynomial.
- **TauCeti.Computational.RationalFactorCertificate.leadingCoeff** (compatibility): The scalar equals the leading coefficient of f because every listed factor is monic.

- Test **TauCeti.Computational.test_rational_factor_one** (degenerate): The unit polynomial uses scalar 1 and an empty list.
- Test **TauCeti.Computational.test_rational_factor_repeated** (computation): (X−1)² has the repeated linear list [X−1,X−1].
- Test **TauCeti.Computational.test_rational_factor_zero** (non-example): The zero polynomial has no such factor certificate.

Acceptance: The unit polynomial uses scalar 1 and an empty list. (X−1)² has the repeated linear list [X−1,X−1]. The zero polynomial has no such factor certificate.

Sources: Shoup, §16.5–16.6, pp.439–441.

### Certified rational polynomial factorization

**ComputationalNumberTheory:CN.1/certified-rational-factorization**. Proposed declaration: TauCeti.Computational.certifiedRationalFactorization.

For nonzero f∈ℚ[X], certifiedRationalFactorization returns a RationalFactorCertificate f. Clear denominators and content, separate repeated factors, factor a suitable finite-field reduction via FF.3, lift factors to a precision exceeding a proved coefficient bound, and perform exhaustive exact recombination. The result is deterministic once every search branch and stopping bound is fixed; a randomized finite-field search may discover candidates but cannot weaken the final certificate checks.

Construction or proof: The semantic result type requires exact reconstruction and genuine rational irreducibility. The modular lifting and recombination proof is a recorded missing source decomposition; single-prime irreducibility is a sufficient shortcut only when its hypotheses hold, not a complete general algorithm.

Prerequisites: ComputationalNumberTheory:CN.1/rational-polynomial-factor-certificate, FiniteFieldsAndCharacterSums:FF.3/hensel-lifting-modulo-prime-powers, ComputationalNumberTheory:CN.1/polynomial-factorization-over-finite-fields.

- **TauCeti.Computational.certifiedRationalFactorization_product** (compatibility): The returned factors reconstruct f.
- **TauCeti.Computational.certifiedRationalFactorization_irreducible** (projection): Every returned factor is monic and irreducible over ℚ.
- **TauCeti.Computational.certifiedRationalFactorization_scalar** (projection): The scalar is the input leading coefficient.

- Test **TauCeti.Computational.test_factorization_constant** (degenerate): A nonzero constant produces an empty irreducible-factor list.
- Test **TauCeti.Computational.test_factorization_repeated** (computation): (X−1)² produces two copies of X−1.
- Test **TauCeti.Computational.test_factorization_Q_not_C** (non-example): X²+1 stays irreducible over ℚ even though it splits over ℂ.

Acceptance: A nonzero constant produces an empty irreducible-factor list. (X−1)² produces two copies of X−1. X²+1 stays irreducible over ℚ even though it splits over ℂ.

Sources: Shoup, §16.5–16.6, pp.439–441.

### Bit size of a Pratt tree

**ComputationalNumberTheory:CN.1/pratt-encoding-size**. Proposed declaration: TauCeti.Computational.prattBitSize.

prattBitSize assigns one tag bit to the leaf. A node contributes 1 plus the binary lengths of n, a and its child count, plus the sizes of the children. Binary length is log₂(x)+1, including one bit for zero. A self-delimiting serialization has size at most a fixed constant multiple of this measure; that encoding comparison is a separate obligation.

Construction or proof: Recurse over the existing finite tree; retain repeated factors and charge every occurrence.

Prerequisites: ComputationalNumberTheory:CN.1/pratt-certificate.

- **TauCeti.Computational.prattBitSize_two** (simp): The leaf costs one bit.
- **TauCeti.Computational.prattBitSize_node** (characterisation): The charge is the sum of header lengths and all child charges.
- **TauCeti.Computational.prattBitSize_pos** (other): Every finite tree has positive size.

- Test **TauCeti.Computational.test_size_leaf** (degenerate): The leaf has size one.
- Test **TauCeti.Computational.test_size_three** (computation): The tree certifying 3 has size seven.
- Test **TauCeti.Computational.test_size_repeated** (non-example): Repeated children are charged repeatedly, not silently shared as a DAG.

Acceptance: The leaf has size one. The tree certifying 3 has size seven. Repeated children are charged repeatedly, not silently shared as a DAG.

Sources: PrattNotes, pp.1–4, formal proof system and its length bound.

### Quadratic bit-size bound for Pratt certificates

**ComputationalNumberTheory:CN.1/pratt-quadratic-size**. Proposed declaration: TauCeti.Computational.pratt_small_certificate.

There is an absolute natural constant C such that every prime n has an accepted Pratt tree c of value n and prattBitSize(c)≤C·(log₂(n)+1)². This is an existence bound for certificates, not a bound on the cost of discovering the factorization of n−1.

Construction or proof: Induct using the prime factors of n−1 with multiplicity, as in the source proof-length bound. Bound every header by a constant times the binary length of n. Sum the recursive charges. The translation of the source proof lines to this tree measure remains an explicit proof refinement.

Prerequisites: ComputationalNumberTheory:CN.1/pratt-encoding-size, ComputationalNumberTheory:CN.1/pratt-certificate-complete.



Acceptance: The constant is uniform in n. The accepted leaf handles n=2.

Sources: PrattNotes, pp.1–4, formal proof system and its length bound.

## CN.2

### Multiplier ring of an integral lattice

**ComputationalNumberTheory:CN.2/multiplier-ring**. Proposed declaration: TauCeti.Computational.multiplierRing.

For a field K of characteristic zero and an integer submodule I⊆K, multiplierRing I is the ℤ-subalgebra {x∈K | xI⊆I}. This definition also permits I=0, in which case the multiplier ring is all of K. Finiteness and the full-lattice condition are hypotheses of the maximal-order theorems, not hidden in this carrier.

Construction or proof: The stabilizing condition is closed under addition, multiplication and negation. Every integer scalar stabilizes I. Package the subset as the existing Subalgebra ℤ K type.

Prerequisites: .

- **TauCeti.Computational.mem_multiplierRing** (characterisation): Membership means preservation of every lattice element by multiplication.
- **TauCeti.Computational.multiplierRing_zero** (simp): The zero lattice has the whole field as multiplier ring.
- **TauCeti.Computational.multiplierRing_smul** (compatibility): Multiplying a lattice by a nonzero field element does not change its multiplier ring.

- Test **TauCeti.Computational.test_multiplier_zero** (degenerate): The zero lattice must not be treated as a finite order.
- Test **TauCeti.Computational.test_multiplier_Z** (compatibility): The lattice generated by 1 in ℚ has only integral multipliers.
- Test **TauCeti.Computational.test_multiplier_half** (non-example): 1/2 does not stabilize the lattice ℤ inside ℚ.

Acceptance: The zero lattice must not be treated as a finite order. The lattice generated by 1 in ℚ has only integral multipliers. 1/2 does not stabilize the lattice ℤ inside ℚ.

Sources: NumberRings, §9, Proposition 9.3, pp.234–235.

### Local maximality of an order

**ComputationalNumberTheory:CN.2/p-maximal-order**. Proposed declaration: TauCeti.Computational.IsPMaximal.

For a ℤ-subalgebra R of a characteristic-zero field K and a prime p, IsPMaximal R p means that for every x∈K integral over ℤ there is an integer a not divisible by p with a·x∈R. For a full finite order R this says its localization at p equals that of the maximal order, or equivalently p does not divide its index. The predicate is meaningful at arbitrary p, but arithmetic theorems assume primality.

Construction or proof: Express equality after localization by clearing a denominator prime to p. Keep the intrinsic integral closure as the target.

Prerequisites: .

- **TauCeti.Computational.isPMaximal_iff** (characterisation): Local maximality is the stated prime-to-p denominator-clearing property.
- **TauCeti.Computational.isPMaximal_mono** (functoriality): Enlarging R preserves local maximality.
- **TauCeti.Computational.isPMaximal_top** (simp): The whole field satisfies the predicate at primes; finiteness must be imposed separately for orders.

- Test **TauCeti.Computational.test_pMaximal_Z** (computation): The usual copy of ℤ in ℚ is p-maximal at every prime.
- Test **TauCeti.Computational.test_pMaximal_one** (non-example): At p=1 no denominator passes, so the predicate is false.
- Test **TauCeti.Computational.test_pMaximal_overorder** (compatibility): Every overorder of a p-maximal order remains p-maximal.

Acceptance: The usual copy of ℤ in ℚ is p-maximal at every prime. At p=1 no denominator passes, so the predicate is false. Every overorder of a p-maximal order remains p-maximal.

Sources: NumberRings, §9, pp.233–235.

### Nilradical from a Frobenius kernel

**ComputationalNumberTheory:CN.2/finite-algebra-frobenius-nilradical**. Proposed declaration: TauCeti.Computational.nilpotent_iff_frobenius_zero.

Let A be a finite-dimensional commutative algebra over ZMod p, p prime, and let p^k≥dim A. Then x is nilpotent iff x^(p^k)=0. Consequently the nilradical is the kernel of the kth iterate of the Frobenius algebra endomorphism, computable by linear algebra in any supplied basis.

Construction or proof: A nilpotent multiplication operator on the d-dimensional space has nilpotency exponent at most d. Thus x^d=0 and x^(p^k)=0. The reverse implication is the definition of nilpotence. The basis-to-matrix kernel computation is imported from CA.3.

Prerequisites: mathlib:FiniteField.frobeniusAlgHom, mathlib:Ideal.radical.



Acceptance: For A=F_p[ε]/(ε²), a nonzero ε belongs to the kernel as soon as p^k≥2. A reduced finite algebra has zero kernel.

Sources: NumberRings, §9, pp.233–234.

### Fundamental units from a regulator index bound

**ComputationalNumberTheory:CN.2/units-complete-of-regulator-bound**. Proposed declaration: TauCeti.Computational.units_complete_of_regulator_bound.

Let K be a number field and u a family of rank(K) units whose logarithmic images are linearly independent. If regOfFamily(u)<2·regulator(K), then the subgroup generated by u together with the torsion units is the full unit group. To claim generation by a displayed finite list alone, that list must separately generate all torsion units.

Construction or proof: The native regulator ratio is the subgroup index. Full logarithmic rank makes the index positive. The strict bound makes it a positive integer below 2, hence one; index one is equivalent to the subgroup being the whole group.

Prerequisites: mathlib:NumberField.Units.regOfFamily_div_regulator.



Acceptance: In rank zero the regulator supplies no information about whether the displayed list contains roots of unity.

Sources: NumberRings, §12, pp.248–250.

### Joint class and unit stopping bound

**ComputationalNumberTheory:CN.2/joint-class-unit-index-certificate**. Proposed declaration: TauCeti.Computational.joint_class_unit_bound.

Suppose h>0 divides h′, and u is a full logarithmic-rank family of units of a number field K. If h′·regOfFamily(u)<2h·regulator(K), then h′=h and u together with all torsion units generates the unit group. In the class-group algorithm h′ is the order of the quotient by certified found relations, and h is the true class number; the surjection from that quotient must first establish h∣h′.

Construction or proof: The ratio is the product of two positive integers: h′/h and the native unit index. A product below 2 forces both factors to be 1. Apply the unit stopping argument.

Prerequisites: ComputationalNumberTheory:CN.2/units-complete-of-regulator-bound, mathlib:NumberField.Units.regOfFamily_div_regulator.



Acceptance: The hypothesis h′>0 excludes infinite quotients encoded with zero cardinality. Neither an approximate Euler product nor a terminated relation search supplies the strict bound.

Sources: NumberRings, §12, pp.248–252.

### Finite order basis certificate

**ComputationalNumberTheory:CN.2/order-basis-certificate**. Proposed declaration: TauCeti.Computational.OrderBasisCertificate.

For a number field K and n∈ℕ, an OrderBasisCertificate stores b₀,…,bₙ₋₁∈K forming a ℚ-basis, integer coordinates for 1, and integer structure constants b_i b_j=Σ_k m_ijk b_k. These finite identities prove that the integer span of b is a full order. The certificate does not assert maximality.

Construction or proof: Check rational linear independence and spanning, the coordinate equation for 1, and all n² multiplication equations. The integer span is then closed under multiplication. CA.3 normal forms supply coordinate reconstruction.

Prerequisites: ClassicalArithmeticCompletion:CA.3/hermite-normal-form-certificate.

- **TauCeti.Computational.OrderBasisCertificate.order** (projection): Package the integer span as a native ℤ-subalgebra of K.
- **TauCeti.Computational.OrderBasisCertificate.mem_order** (characterisation): Membership is existence of integer coordinates in b.
- **TauCeti.Computational.OrderBasisCertificate.coordinates_unique** (extensionality): Integer coordinates in the basis are unique.

- Test **TauCeti.Computational.test_order_Q** (computation): The singleton basis 1 presents ℤ in ℚ.
- Test **TauCeti.Computational.test_order_rank_zero** (degenerate): A number field has no rank-zero order certificate.
- Test **TauCeti.Computational.test_order_half** (non-example): The singleton rational basis 1/2 is not closed under multiplication over ℤ.

Acceptance: The singleton basis 1 presents ℤ in ℚ. A number field has no rank-zero order certificate. The singleton rational basis 1/2 is not closed under multiplication over ℤ.

Sources: NumberRings, §9, pp.233–235.

### Order coordinates imply integrality

**ComputationalNumberTheory:CN.2/order-basis-integrality**. Proposed declaration: TauCeti.Computational.OrderBasisCertificate.isIntegral.

Every element in the order of an OrderBasisCertificate is integral over ℤ.

Construction or proof: Its multiplication matrix in the displayed integer basis has integral entries. Cayley–Hamilton supplies a monic annihilating polynomial. The intrinsic finite-algebra integrality theorem belongs to the number-field/library supplier; this declaration specializes it to checked coordinates.

Prerequisites: ComputationalNumberTheory:CN.2/order-basis-certificate.



Acceptance: A full rational basis alone does not imply integrality: the multiplication table is essential.

Sources: NumberRings, §6 and §9, pp.224–225,233–235.

### The p-radical in field coordinates

**ComputationalNumberTheory:CN.2/p-radical-lattice**. Proposed declaration: TauCeti.Computational.pRadicalLattice.

For a full order R⊆K and prime p, pRadicalLattice R p is the integer lattice of x∈R with x^k∈pR for some k≥1. It is the inverse image of the nilradical of R/pR. The exponent excludes the empty-power convention. This is a coordinate adapter for the native ideal radical, not a second definition of radical.

Construction or proof: Take the native radical of pR in R and map its underlying integer module through the inclusion R→K. Finite-field linear algebra computes it from the Frobenius kernel.

Prerequisites: mathlib:Ideal.radical, ComputationalNumberTheory:CN.2/finite-algebra-frobenius-nilradical, ClassicalArithmeticCompletion:CA.3/hermite-normal-form-certificate.

- **TauCeti.Computational.mem_pRadicalLattice** (characterisation): Membership is a positive power in pR.
- **TauCeti.Computational.pRadicalLattice_contains_p** (simp): The element p belongs to the p-radical.
- **TauCeti.Computational.pRadicalLattice_mul** (structure): The lattice is stable under multiplication by its order.

- Test **TauCeti.Computational.test_pRadical_zero** (degenerate): For a characteristic-zero field the zero-radical of an order is zero.
- Test **TauCeti.Computational.test_pRadical_Z** (computation): The p-radical of ℤ inside ℚ is pℤ for prime p.
- Test **TauCeti.Computational.test_pRadical_one_not** (non-example): 1 does not belong to the p-radical of ℤ at a prime.

Acceptance: For a characteristic-zero field the zero-radical of an order is zero. The p-radical of ℤ inside ℚ is pℤ for prime p. 1 does not belong to the p-radical of ℤ at a prime.

Sources: NumberRings, Equation (9-2) and following paragraph, pp.234–235.

### Multiplier criterion for p-maximality

**ComputationalNumberTheory:CN.2/p-radical-maximality-criterion**. Proposed declaration: TauCeti.Computational.pRadical_multiplier_eq_iff.

For a full order R presented by an OrderBasisCertificate and a prime p, the multiplier ring of pRadicalLattice R p equals R iff IsPMaximal R p. In the nonmaximal case it is a strictly larger integral overorder contained in (1/p)R; its quotient over R is p-primary.

Construction or proof: Apply Stevenhagen Proposition 9.3 to the p-primary saturation. If the order is already p-maximal, the multiplier ring lies between R and its p-primary saturation, forcing equality. Otherwise Proposition 9.3 supplies a multiplier outside R. Finite-lattice coordinate conversion is provided by CA.3.

Prerequisites: ComputationalNumberTheory:CN.2/order-basis-certificate, ComputationalNumberTheory:CN.2/order-basis-integrality, ComputationalNumberTheory:CN.2/p-radical-lattice, ComputationalNumberTheory:CN.2/multiplier-ring, ComputationalNumberTheory:CN.2/p-maximal-order.



Acceptance: A ramified maximal order can have nonzero p-radical modulo p and still pass. Nilradical zero is sufficient but not necessary.

Sources: NumberRings, Proposition 9.3 and its proof, p.235.

### Integral basis certificate

**ComputationalNumberTheory:CN.2/integral-basis-certificate**. Proposed declaration: TauCeti.Computational.IntegralBasisCertificate.

An IntegralBasisCertificate K is an OrderBasisCertificate of some finite rank together with a proof that its order is exactly the set of elements integral over ℤ. Thus its basis spans the native ring of integers, not merely a suborder. A practical finite certificate proves this maximality by checking the p-radical multiplier criterion at every prime whose square divides the starting discriminant.

Construction or proof: Store the full order basis and the exact maximality equation. The finite local checks are converted to this equation by the discriminant-index theorem; the resulting basis transports to the native RingOfIntegers carrier.

Prerequisites: ComputationalNumberTheory:CN.2/order-basis-certificate, ComputationalNumberTheory:CN.2/order-basis-integrality, ComputationalNumberTheory:CN.2/p-radical-maximality-criterion, ComputationalNumberTheory:CN.1/integer-factorization-certificate.

- **TauCeti.Computational.IntegralBasisCertificate.mem_iff** (characterisation): The certificate identifies the order with the integral closure.
- **TauCeti.Computational.IntegralBasisCertificate.rank_eq** (compatibility): The rank is the rational field degree.
- **TauCeti.Computational.IntegralBasisCertificate.integerBasis** (projection): Transport the checked coordinates to a native ℤ-basis of the ring of integers.

- Test **TauCeti.Computational.test_integral_basis_Q** (computation): ℚ has an integral basis certificate of rank one.
- Test **TauCeti.Computational.test_integral_basis_rank_zero** (degenerate): A certificate has positive rank.
- Test **TauCeti.Computational.test_integral_basis_half** (non-example): The rational 1/2 is excluded by the certificate for ℚ.

Acceptance: ℚ has an integral basis certificate of rank one. A certificate has positive rank. The rational 1/2 is excluded by the certificate for ℚ.

Sources: NumberRings, §9, pp.233–235.

### Certified integral-basis algorithm

**ComputationalNumberTheory:CN.2/integral-basis-algorithm**. Proposed declaration: TauCeti.Computational.integralBasisAlgorithm.

Given a full order basis in K, integralBasisAlgorithm returns an IntegralBasisCertificate K for an overorder containing the input. Factor the absolute discriminant exactly, compute p-radicals and multiplier overorders at all critical primes, and stop each local loop only when the multiplier ring is unchanged. Each strict enlargement drops the p-exponent of the index in the maximal order, so the local loops terminate. No polynomial bit-time claim is made for the required integer factorization.

Construction or proof: Use the checked integer factorization for the critical prime list. Apply the multiplier criterion and CA.3 HNF coordinate changes at each step. A positive finite index strictly decreases under proper enlargement. The discriminant-index square identity proves that no unchecked prime can divide the final index.

Prerequisites: ComputationalNumberTheory:CN.2/integral-basis-certificate, ComputationalNumberTheory:CN.2/p-radical-maximality-criterion, ComputationalNumberTheory:CN.1/integer-factorization-certificate, ClassicalArithmeticCompletion:CA.3/hermite-normal-form-certificate.

- **TauCeti.Computational.integralBasisAlgorithm_contains** (compatibility): The returned maximal order contains the input order.
- **TauCeti.Computational.integralBasisAlgorithm_maximal** (characterisation): The returned order equals the intrinsic integral closure.
- **TauCeti.Computational.integralBasisAlgorithm_rank** (compatibility): The returned rank equals the input rank.

- Test **TauCeti.Computational.test_integral_basis_algorithm_Q** (computation): Every order in ℚ returns the usual integer ring.
- Test **TauCeti.Computational.test_integral_basis_algorithm_one** (degenerate): The returned order contains 1.
- Test **TauCeti.Computational.test_integral_basis_algorithm_idempotent** (compatibility): Applying the algorithm to its output preserves the order, though not necessarily the basis.

Acceptance: Every order in ℚ returns the usual integer ring. The returned order contains 1. Applying the algorithm to its output preserves the order, though not necessarily the basis.

Sources: NumberRings, §9, pp.233–235.

### Prime-ideal decomposition certificate

**ComputationalNumberTheory:CN.2/prime-ideal-factor-certificate**. Proposed declaration: TauCeti.Computational.PrimeIdealFactorCertificate.

For K a number field and a rational prime p, a PrimeIdealFactorCertificate K p stores a finite list of pairwise distinct nonzero prime ideals P_i of the native ring of integers, positive exponents e_i, and the identity pO_K=∏P_i^e_i. Each ideal is presented in the certified integral basis. Primality may be checked by an explicit finite-field quotient presentation. At primes dividing the index of a chosen power basis, the computation must use the maximal order or a proved higher-order method.

Construction or proof: Use native ideals, ideal multiplication and primality. The exact product and prime checks certify the decomposition without trusting a discovered factor list. Import FF.0 quotient-field presentations and the integral basis coordinates.

Prerequisites: ComputationalNumberTheory:CN.2/integral-basis-certificate, FiniteFieldsAndCharacterSums:FF.0/certified-presentation-of-a-finite-field.

- **TauCeti.Computational.PrimeIdealFactorCertificate.reconstruct** (projection): The product is exactly the rational prime ideal.
- **TauCeti.Computational.PrimeIdealFactorCertificate.exponent_pos** (projection): Every listed exponent is strictly positive.
- **TauCeti.Computational.PrimeIdealFactorCertificate.nonempty** (other): For prime p the decomposition cannot be empty.

- Test **TauCeti.Computational.test_prime_factor_Q** (computation): A rational prime stays a single prime of exponent one over ℚ.
- Test **TauCeti.Computational.test_prime_factor_zero_exponent** (non-example): A zero exponent cannot pad the output.
- Test **TauCeti.Computational.test_prime_factor_bottom** (degenerate): The zero ideal cannot occur.

Acceptance: A rational prime stays a single prime of exponent one over ℚ. A zero exponent cannot pad the output. The zero ideal cannot occur.

Sources: NumberRings, §9, pp.234–235; §12, p.248.

### Checked class-group relation lattice

**ComputationalNumberTheory:CN.2/class-relation-lattice**. Proposed declaration: TauCeti.Computational.classRelationLattice.

For n nonzero integral ideals I_i, classRelationLattice I is the integer submodule of ℤⁿ consisting of a with ∏[I_i]^(a_i)=1 in the native class group. A found relation matrix contributes a sublattice L contained in this kernel, certified by principal fractional-ideal generators. The relation kernel exists intrinsically; discovering rows does not show L equals it.

Construction or proof: Use ClassGroup.mk0 for the ideal classes. Their product-of-powers map is a homomorphism from the additive integer coordinate module to the class group, written multiplicatively. Its kernel is closed under integer linear combinations.

Prerequisites: mathlib:ClassGroup.mk0.

- **TauCeti.Computational.mem_classRelationLattice** (characterisation): Membership is the exact ideal-class product equation.
- **TauCeti.Computational.classRelationLattice_zero** (simp): The zero vector is a relation.
- **TauCeti.Computational.classRelationLattice_neg** (structure): A relation remains valid after negating all exponents.

- Test **TauCeti.Computational.test_relations_empty** (degenerate): For an empty factor base the unique exponent vector is a relation.
- Test **TauCeti.Computational.test_relations_unit_ideals** (computation): A factor base consisting of unit ideals has the whole relation lattice.
- Test **TauCeti.Computational.test_relations_subtraction** (compatibility): Subtracting two checked relations is valid.

Acceptance: For an empty factor base the unique exponent vector is a relation. A factor base consisting of unit ideals has the whole relation lattice. Subtracting two checked relations is valid.

Sources: NumberRings, §12, exact sequence and relation matrix, p.248.

### Relation quotient covers the class group

**ComputationalNumberTheory:CN.2/class-relation-quotient-cover**. Proposed declaration: TauCeti.Computational.classNumber_dvd_relation_index.

Let the classes of I₁,…,I_n generate Cl(K), and let L⊆classRelationLattice I be a full-rank integer submodule. Then the native class number divides the finite index [ℤⁿ:L]. The quotient ℤⁿ/L maps surjectively to Cl(K); equality of cardinalities is a separate completeness condition.

Construction or proof: The class product map is surjective by factor-base generation. The inclusion L⊆kernel lets it descend to the quotient. A surjection of finite groups makes the target order divide the source order.

Prerequisites: ComputationalNumberTheory:CN.2/class-relation-lattice, mathlib:NumberField.classNumber, ClassicalArithmeticCompletion:CA.3/smith-normal-form-certificate.



Acceptance: A relation matrix of deficient rank yields an infinite quotient and cannot supply the positive stopping integer.

Sources: NumberRings, §12, formula for h′, p.248.

### Certified Minkowski factor-base generation

**ComputationalNumberTheory:CN.2/minkowski-factor-base-generation**. Proposed declaration: TauCeti.Computational.minkowski_factorBase_generates.

Let B be a nonnegative real number at least the native Minkowski bound for K. If a finite list I includes every nonzero prime ideal of norm at most B, its classes generate the class group. A larger rational upper bound is sufficient. Replacing it by a Bach-type logarithmic bound requires its stated GRH hypothesis and separate proof.

Construction or proof: Take a small-norm ideal representative of each class using the native Minkowski theorem. Factor it into prime ideals. Every prime factor has norm at most that ideal’s norm, so all its factors occur in the list.

Prerequisites: mathlib:NumberField.exists_ideal_in_class_of_norm_le, ComputationalNumberTheory:CN.2/prime-ideal-factor-certificate, mathlib:ClassGroup.mk0.



Acceptance: The prime list is exhaustive up to an upper bound; a random list of small ideals gives no surjectivity certificate.

Sources: NumberRings, §12, pp.245–248.

### Certified completion of class and unit computations

**ComputationalNumberTheory:CN.2/certified-class-unit-completeness**. Proposed declaration: TauCeti.Computational.certified_class_unit_complete.

With a complete factor base I, a checked full-rank relation sublattice L, and a full-logarithmic-rank unit family u, let h′=card(ℤⁿ/L). If h′·regOfFamily(u)<2·classNumber(K)·regulator(K), then h′ equals the class number and u together with all torsion units generates the unit group. The analytic bound must be certified by enclosing intervals and a rigorous remainder estimate; a numerical Euler-product guess is not a stopping certificate.

Construction or proof: Combine factor-base generation, the relation-quotient divisibility theorem and the joint positive-integer bound. A separately validated lower bound on hR and upper bound on h′R′ can discharge the strict inequality without knowing h or R individually.

Prerequisites: ComputationalNumberTheory:CN.2/class-relation-quotient-cover, ComputationalNumberTheory:CN.2/minkowski-factor-base-generation, ComputationalNumberTheory:CN.2/joint-class-unit-index-certificate.



Acceptance: Every relation row must have a principal-ideal witness. Unit rank and torsion generators are separate checks.

Sources: NumberRings, §12, pp.248–252.

### Exact φ-adic polynomial expansion

**ComputationalNumberTheory:CN.2/phi-adic-expansion**. Proposed declaration: TauCeti.Computational.phiExpansion.

For a commutative ring R and monic φ∈R[X] of positive degree m, phiExpansion φ f returns coefficients a_i∈R[X] of degree less than m, zero for i>floor(natDegree f/m), with f=Σa_iφ^i. It uses successive division by the monic polynomial φ; the coefficients are polynomials, not scalar coefficients of f. The zero polynomial has all coefficients zero.

Construction or proof: Repeated monic quotient/remainder division lowers degree. The remainders are the a_i. Induction gives reconstruction, the degree bound and uniqueness.

Prerequisites: .

- **TauCeti.Computational.phiExpansion_reconstruct** (characterisation): The finite φ-adic sum is f.
- **TauCeti.Computational.phiExpansion_degree** (projection): Each coefficient has degree strictly below deg φ.
- **TauCeti.Computational.phiExpansion_eventually_zero** (simp): Indices beyond the quotient-degree bound have zero coefficient.

- Test **TauCeti.Computational.test_phi_zero** (degenerate): The expansion of zero is identically zero.
- Test **TauCeti.Computational.test_phi_X** (compatibility): For φ=X the coefficients are the constant polynomials C(f.coeff i).
- Test **TauCeti.Computational.test_phi_shift** (computation): For φ=X−1, X² has coefficients 1,2,1.

Acceptance: The expansion of zero is identically zero. For φ=X the coefficients are the constant polynomials C(f.coeff i). For φ=X−1, X² has coefficients 1,2,1.

Sources: GMN, §1.2, Definition 1.6, p.7.

### Valuation of a φ-coefficient

**ComputationalNumberTheory:CN.2/phi-coefficient-valuation**. Proposed declaration: TauCeti.Computational.coefficientValuation.

For prime p and a∈ℤ[X], coefficientValuation p a is infinity if a=0, and otherwise the minimum v_p(a_i) over the nonzero coefficients. It uses WithTop ℕ, so the zero polynomial has infinite valuation; the native default v_p(0)=0 is never inserted into the minimum.

Construction or proof: Take the finite minimum over the support of a, with top for the empty support. This is the Gauss valuation used only to compute the points of the φ-adic polygon. The general ordinary Newton-polygon theory remains CA.3.

Prerequisites: ComputationalNumberTheory:CN.2/phi-adic-expansion, mathlib:padicValRat.

- **TauCeti.Computational.coefficientValuation_zero** (simp): Zero has infinite valuation.
- **TauCeti.Computational.coefficientValuation_const** (compatibility): A nonzero constant has its usual integer valuation.
- **TauCeti.Computational.coefficientValuation_ge_iff** (characterisation): A lower valuation bound means coefficientwise divisibility by p^N.

- Test **TauCeti.Computational.test_gauss_zero** (degenerate): The zero polynomial gives top.
- Test **TauCeti.Computational.test_gauss_three** (computation): 3X+9 has 3-adic coefficient valuation 1.
- Test **TauCeti.Computational.test_gauss_missing_coefficient** (non-example): X² has valuation zero, regardless of its zero constant coefficient.

Acceptance: The zero polynomial gives top. 3X+9 has 3-adic coefficient valuation 1. X² has valuation zero, regardless of its zero constant coefficient.

Sources: GMN, §1.2, p.7.

### Finite local expansion certificate

**ComputationalNumberTheory:CN.2/local-expansion-certificate**. Proposed declaration: TauCeti.Computational.LocalExpansionCertificate.

For a normed field L, chosen nonzero uniformizer π with ‖π‖<1, element x and digit count N, a LocalExpansionCertificate stores an integer initial exponent v, digits d₀,…,dₙ₋₁ of norm at most one, and a proved remainder bound ‖x−π^vΣd_iπ^i‖≤‖π‖^(v+N). Intrinsic local-field structure and residue representatives come from the owner. Without a fixed residue section these finite digits are not canonical; equality of decoded approximations is not asserted to imply equality of digits.

Construction or proof: Store exact native field elements and the norm inequality. Constructing digits uses the imported residue lifting theorem. Comparing coordinate or quotient computations with x must preserve the chosen prime, embedding and uniformizer normalization.

Prerequisites: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions, ComputationalNumberTheory:CN.0/padic-approximation, ComputationalNumberTheory:CN.2/prime-ideal-factor-certificate.

- **TauCeti.Computational.LocalExpansionCertificate.center** (projection): The exact finite centre is π^v times the digit polynomial.
- **TauCeti.Computational.LocalExpansionCertificate.error_bound** (compatibility): The supplied exact x lies in the certified local ball.
- **TauCeti.Computational.LocalExpansionCertificate.integral_digits** (projection): Every exact digit has norm at most one.

- Test **TauCeti.Computational.test_local_zero** (degenerate): Zero has a certificate with zero digits at every finite length.
- Test **TauCeti.Computational.test_local_inverse_uniformizer** (computation): π⁻¹ has a length-one exact expansion with initial exponent −1 and digit 1.
- Test **TauCeti.Computational.test_local_false_zero_approximation** (non-example): A precision-one zero centre at v=0 cannot represent 1 when ‖π‖<1.

Acceptance: Zero has a certificate with zero digits at every finite length. π⁻¹ has a length-one exact expansion with initial exponent −1 and digit 1. A precision-one zero centre at v=0 cannot represent 1 when ‖π‖<1.

Sources: CarusoPublished, §2.1.1, pp.17–19.

### A finite negative φ-Newton side

**ComputationalNumberTheory:CN.2/phi-newton-side**. Proposed declaration: TauCeti.Computational.IsPhiNewtonSide.

For prime p and monic positive-degree φ∈ℤ[X], IsPhiNewtonSide p φ f s u e h d certifies the entire supporting side from (s,u) to (s+ed,u−hd), with slope −h/e. Require e,h,d>0, gcd(e,h)=1 and hd≤u. The two endpoint coefficient valuations equal their displayed ordinates. Every φ-expansion point lies on or above the line e·v_p(a_i)+h·i=e·u+h·s, and every point on that line has s≤i≤s+ed. Zero coefficients have valuation infinity. The φ-divisible initial segment has slope −∞ and is recorded separately by its multiplicity; it is not encoded with a finite e,h.

Construction or proof: Use the already specified φ-expansion and coefficient Gauss valuation. Clear the slope denominator to use exact integer inequalities. This is a checked side of a φ-polygon, not a second owner of the generic Newton-polygon geometry in CA.3.

Prerequisites: ComputationalNumberTheory:CN.2/phi-adic-expansion, ComputationalNumberTheory:CN.2/phi-coefficient-valuation, ClassicalArithmeticCompletion:CA.3.

- **TauCeti.Computational.phiSide_denominator_pos** (projection): The slope denominator is positive.
- **TauCeti.Computational.phiSide_left_nonzero** (other): The left endpoint coefficient is nonzero.
- **TauCeti.Computational.phiSide_length_pos** (other): A side has strictly positive horizontal length ed.

- Test **TauCeti.Computational.test_phiSide_eisenstein** (computation): X²−3 has the single 3-adic side of slope −1/2.
- Test **TauCeti.Computational.test_phiSide_zero** (degenerate): The zero polynomial has no finite side.
- Test **TauCeti.Computational.test_phiSide_wrong_slope** (non-example): The slope of X²−3 is not −1.

Acceptance: X²−3 has the single 3-adic side of slope −1/2. The zero polynomial has no finite side. The slope of X²−3 is not −1.

Sources: GMN, Definitions 1.6–1.9, pp.7–8.

### Residual polynomial of a φ-Newton side

**ComputationalNumberTheory:CN.2/phi-residual-polynomial**. Proposed declaration: TauCeti.Computational.phiResidualPolynomial.

For side data (s,u,e,h,d), phiResidualPolynomial has coefficient at Y^j equal to the reduction in F_φ=(ℤ/pℤ)[X]/(φ mod p) of a_(s+ej)/p^(u−hj), for 0≤j≤d. Divide each integer coefficient exactly before reducing. For a certified side the divisions are exact; points strictly above the side give zero. The endpoint coefficients are nonzero when φ mod p is irreducible, so the residual degree is d and Y does not divide it. Uniformizer p and reduction of the chosen φ are fixed conventions.

Construction or proof: Use integer coefficient division, the native quotient AdjoinRoot and the finite monomial sum. Reduction and exact divisibility lemmas remain separate refinement inputs.

Prerequisites: ComputationalNumberTheory:CN.2/phi-newton-side, FiniteFieldsAndCharacterSums:FF.0/certified-presentation-of-a-finite-field.

- **TauCeti.Computational.phiResidual_degree_le** (other): No coefficient above d occurs.
- **TauCeti.Computational.phiResidual_degree** (compatibility): On a certified side over an irreducible residue polynomial the degree is exactly d.
- **TauCeti.Computational.phiResidual_constant_ne_zero** (projection): The left endpoint gives a nonzero constant coefficient.

- Test **TauCeti.Computational.test_residual_eisenstein** (computation): For X²−3 the residual polynomial is Y−1, not Y or Y²−1.
- Test **TauCeti.Computational.test_residual_zero** (degenerate): Raw zero input gives zero residual output.
- Test **TauCeti.Computational.test_residual_repeated** (non-example): (X−3)² has repeated residual (Y−1)², so a square-free residual hypothesis cannot be omitted.

Acceptance: For X²−3 the residual polynomial is Y−1, not Y or Y²−1. Raw zero input gives zero residual output. (X−3)² has repeated residual (Y−1)², so a square-free residual hypothesis cannot be omitted.

Sources: GMN, Definition 1.9, p.8.

### Ore residual irreducibility criterion

**ComputationalNumberTheory:CN.2/ore-residual-irreducibility**. Proposed declaration: TauCeti.Computational.ore_residual_irreducible.

Let p be prime, φ and f monic in ℤ[X], deg φ>0, and φ mod p irreducible. Suppose f mod p=(φ mod p)^n, n>0, and the whole φ-polygon is the finite side from (0,hd) to (ed,0), with n=ed and coprime positive h,e. If its residual polynomial is irreducible over F_φ, then f is irreducible over ℚ_p. For a root θ the resulting local extension has ramification index e and residue degree deg(φ)·deg(R); these intrinsic invariants and their normalization are supplied by LocalFieldsRamification.

Construction or proof: Use the product theorem for φ-polygons and residual polynomials, the polygon factorization theorem and residual factorization theorem. An irreducible residual factor of exponent one admits only one irreducible local factor. The native local degree formula then gives the ramification and residue degrees.

Prerequisites: ComputationalNumberTheory:CN.2/phi-residual-polynomial, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions, FiniteFieldsAndCharacterSums:FF.3/hensel-lifting-modulo-prime-powers.



Acceptance: X²−3 is irreducible over ℚ₃, e=2 and residue degree 1. The repeated residual polynomial of (X−3)² does not meet the hypothesis.

Sources: GMN, Theorem 1.19 and Corollary 1.20, pp.14–15.

## CN.3

### Integral q-expansion lattice

**ComputationalNumberTheory:CN.3/integral-q-expansion-lattice**. Proposed declaration: TauCeti.Computational.integralModularLattice.

For integer weight k, integralModularLattice k is the ℤ-submodule of ModularForm SL₂(ℤ) k consisting of forms whose width-one q-expansion coefficients all belong to the image of ℤ in ℂ. This is a coefficient lattice inside the space of forms. It is distinct from the upstream integral modular-symbol module, which lives on the homological side.

Construction or proof: Use the existing modular-form carrier and q-expansion. Close the integral coefficient condition under addition and integer scalar multiplication.

Prerequisites: mathlib:ModularForm.dimension_level_one, mathlib:ModularForm.sturm_bound_levelOne_nat.

- **TauCeti.Computational.mem_integralModularLattice** (characterisation): Membership is integrality of every q coefficient.
- **TauCeti.Computational.integralModularLattice_zero** (simp): The zero form is integral.
- **TauCeti.Computational.integralModularLattice_ext** (extensionality): Elements agree if their underlying modular forms agree.

- Test **TauCeti.Computational.test_integral_modular_zero** (degenerate): Zero is in the weight-zero lattice.
- Test **TauCeti.Computational.test_integral_E4** (compatibility): Mathlib’s unit-constant E₄ is integral.
- Test **TauCeti.Computational.test_half_E4** (non-example): One half of E₄ is not integral because its constant term is 1/2.

Acceptance: Zero is in the weight-zero lattice. Mathlib’s unit-constant E₄ is integral. One half of E₄ is not integral because its constant term is 1/2.

Sources: Stein, Lemma 2.20 and Remark 2.21, pp.20–21.

### Integral cusp-form lattice

**ComputationalNumberTheory:CN.3/integral-cusp-lattice**. Proposed declaration: TauCeti.Computational.integralCuspLattice.

integralCuspLattice k is the ℤ-submodule of CuspForm SL₂(ℤ) k consisting of forms with every width-one q coefficient in ℤ⊆ℂ. Its inclusion in the modular-form coefficient lattice is the native cusp-to-modular inclusion. It contains no Eisenstein summand.

Construction or proof: Restrict the integral q-coefficient condition to the native cusp-form carrier.

Prerequisites: ComputationalNumberTheory:CN.3/integral-q-expansion-lattice.

- **TauCeti.Computational.mem_integralCuspLattice** (characterisation): Membership is integrality of all coefficients.
- **TauCeti.Computational.integralCuspLattice_coeff_zero** (compatibility): Its constant coefficient is zero by native cuspidality.
- **TauCeti.Computational.integralCuspLattice_ext** (extensionality): Equality is equality of underlying cusp forms.

- Test **TauCeti.Computational.test_integral_delta** (computation): The normalized discriminant is in the weight-12 lattice.
- Test **TauCeti.Computational.test_cusp_weight_zero** (degenerate): The weight-zero cusp lattice is zero.
- Test **TauCeti.Computational.test_half_delta** (non-example): One half of Δ fails integrality at the first coefficient.

Acceptance: The normalized discriminant is in the weight-12 lattice. The weight-zero cusp lattice is zero. One half of Δ fails integrality at the first coefficient.

Sources: Stein, Lemma 2.20, pp.20–21.

### Integral Miller basis

**ComputationalNumberTheory:CN.3/miller-basis**. Proposed declaration: TauCeti.Computational.millerBasis.

For even k∈ℕ and d=dimℂ S_k(SL₂(ℤ)), millerBasis k is a ℤ-basis f₁,…,f_d of integralCuspLattice k satisfying a_j(f_i)=δ_ij for 1≤i,j≤d. Use unit-constant F₄=1+240Σσ₃(n)qⁿ and F₆=1−504Σσ₅(n)qⁿ. They agree with Mathlib E₄,E₆; Stein’s unnormalized symbols require his scaling factors.

Construction or proof: Choose a,b≥0 with 4a+6b≤14 and congruent to k modulo 12, choosing a=b=0 when k≡0. The forms Δ^j F₆^(2(d−j)+b) F₄^a have leading coefficient 1 at q^j. Integral triangular elimination gives the Kronecker first-d coefficients. The native dimension bound shows these span over ℂ; the leading coefficients then force integral coordinates for each integral cusp form.

Prerequisites: ComputationalNumberTheory:CN.3/integral-cusp-lattice, mathlib:ModularForm.dimension_level_one, mathlib:ModularForm.sturm_bound_levelOne_nat.

- **TauCeti.Computational.millerBasis_coeff** (characterisation): The first d positive coefficients form the identity matrix.
- **TauCeti.Computational.millerBasis_repr** (projection): The i-th integral coordinate is the (i+1)-st q coefficient.
- **TauCeti.Computational.millerBasis_unique** (extensionality): A basis with the same first-d coefficient normalization is this basis.

- Test **TauCeti.Computational.test_miller_weight_zero** (degenerate): At weight zero the basis index type is empty.
- Test **TauCeti.Computational.test_miller_delta** (computation): At weight 12 the sole basis form is Δ.
- Test **TauCeti.Computational.test_miller_weight_two** (non-example): Weight two has no cusp basis vector.

Acceptance: At weight zero the basis index type is empty. At weight 12 the sole basis form is Δ. Weight two has no cusp basis vector.

Sources: Stein, Algorithm 2.18 and Lemma 2.20, pp.19–21.

### Level-one congruence Sturm bound

**ComputationalNumberTheory:CN.3/level-one-congruence-sturm**. Proposed declaration: TauCeti.Computational.levelOne_congruence_sturm.

Let k∈ℕ and f belong to integralModularLattice k. For a prime p, if every coefficient a_n(f) for 0≤n≤floor(k/12) is divisible by p, then every coefficient is divisible by p. This is a congruence statement in the integral lattice, not the characteristic-zero identity theorem.

Construction or proof: Use the integral triangular basis at level one to propagate divisibility from the initial coefficients to all integral coordinates. Stein’s alternative proof uses the integral polynomial-in-j expansion and multiplication by Δ. The full modular integral basis is an explicit missing input, recorded rather than inferred from the complex Sturm theorem.

Prerequisites: ComputationalNumberTheory:CN.3/integral-q-expansion-lattice, mathlib:ModularForm.sturm_bound_levelOne_nat, ComputationalNumberTheory:CN.3/miller-basis, AlgebraicModularFormsAndSerreWeights:R15.2.



Acceptance: The bound includes the constant coefficient. Congruence to zero is not equality to zero as a complex modular form.

Sources: Stein, Theorem 9.18, pp.171–172, level-one case.

### The coefficient at 107 of ΔE₄²E₆

**ComputationalNumberTheory:CN.3/weight-26-coefficient-107**. Proposed declaration: TauCeti.Computational.weight26_coeff_107.

With the unit-constant Mathlib E₄,E₆ and normalized discriminant Δ, the coefficient at q^107 of ΔE₄²E₆ equals 35830422465487817813321292. This exact integer is −1 modulo 107. The coefficient theorem certifies ordinarity once the existing eigenform and reduction interfaces are supplied.

Construction or proof: Use the exact integral coefficient formulas and truncate products beyond degree 107. Multiply over ℤ, then compare the resulting coefficient through the native q-expansion multiplication map. The finite convolution certificate is checked independently of any CAS label.

Prerequisites: ComputationalNumberTheory:CN.3/integral-q-expansion-lattice, ComputationalNumberTheory:CN.3/integral-cusp-lattice.



Acceptance: The first coefficients are 1, −48, −195804; changing Eisenstein normalization fails these checks.

Sources: BCG, §2.3, proof of Theorem 2.4, p.515.

### Ordinary reduction at 107

**ComputationalNumberTheory:CN.3/weight-26-ordinary-107**. Proposed declaration: TauCeti.Computational.weight26_ordinary_107.

The certified coefficient 35830422465487817813321292 reduces to −1 in ZMod 107, hence is nonzero.

Construction or proof: Reduce the exact numeral modulo 107. This arithmetic check uses the certified coefficient theorem for its interpretation as a Hecke eigenvalue.

Prerequisites: ComputationalNumberTheory:CN.3/weight-26-coefficient-107.



Acceptance: 107 is prime; the residue equals 106.

Sources: BCG, §2.3, p.515.

### Level-one Hecke recurrence contract

**ComputationalNumberTheory:CN.3/level-one-prime-recurrence**. Proposed declaration: TauCeti.Computational.HasLevelOnePrimeRecurrence.

For natural k≥2 and prime p, HasLevelOnePrimeRecurrence k p T records the coefficient formula a_m(Tf)=a_pm(f)+p^(k−1)a_(m/p)(f) when p∣m, with second term zero otherwise, for every level-one cusp form f. T is a supplied complex linear endomorphism on the native space. The canonical operator comes from the upstream Hecke action and its pinned coefficient theorem; this predicate only specifies the computational comparison.

Construction or proof: State the native recurrence on the level-one cusp space after identifying Γ₁(1) with SL₂(ℤ). Keep p and k explicit.

Prerequisites: tauceti:HeckeRing.GL2.qExpansion_coeff_heckeSlashGamma1CuspFormEnd_diagCosetGamma1_of_mem_cuspFormCharSpace, ComputationalNumberTheory:CN.3/integral-cusp-lattice.

- **TauCeti.Computational.heckeRecurrence_coeff_one** (simp): The first coefficient of T_p f is a_p(f) for p>1.
- **TauCeti.Computational.heckeRecurrence_unique** (extensionality): At fixed k,p the recurrence determines the endomorphism uniquely.
- **TauCeti.Computational.heckeRecurrence_preserves_integrality** (compatibility): The endomorphism preserves the integral cusp lattice.

- Test **TauCeti.Computational.test_hecke_weight_two** (degenerate): The zero-dimensional weight-two space has the zero endomorphism satisfying the recurrence.
- Test **TauCeti.Computational.test_hecke_delta** (computation): At weight 12 and p=2, T₂ acts by −24.
- Test **TauCeti.Computational.test_hecke_zero_wrong** (non-example): The zero endomorphism does not represent T₂ at weight 12.

Acceptance: The zero-dimensional weight-two space has the zero endomorphism satisfying the recurrence. At weight 12 and p=2, T₂ acts by −24. The zero endomorphism does not represent T₂ at weight 12.

Sources: Stein, Chapter 2, Hecke action; Lemma 2.20.

### Integral Hecke matrix in the Miller basis

**ComputationalNumberTheory:CN.3/integral-hecke-matrix**. Proposed declaration: TauCeti.Computational.integralHeckeMatrix.

For even k≥2, prime p and an endomorphism T satisfying the level-one recurrence, integralHeckeMatrix k p T is its integer matrix in the Miller basis, using column vectors. Entry (i,j) is a_(i+1)(T f_j), uniquely read as an integer; the recurrence computes it from coefficients of f_j through degree p·d. It represents an operator on the forms lattice, distinct from the dual modular-symbol matrix.

Construction or proof: The recurrence preserves the integral cusp lattice. Restrict T to a ℤ-linear map and apply the native matrix-of-linear-map construction to the Miller basis. Its first-d coefficient property gives the entry formula.

Prerequisites: ComputationalNumberTheory:CN.3/level-one-prime-recurrence, ComputationalNumberTheory:CN.3/miller-basis, tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields.

- **TauCeti.Computational.integralHeckeMatrix_entry** (characterisation): Column j consists of the integral coefficients a_(i+1)(T f_j).
- **TauCeti.Computational.integralHeckeMatrix_repr** (compatibility): The matrix acts on the native integer coordinate column of every lattice form.
- **TauCeti.Computational.integralHeckeMatrix_unique** (extensionality): The coefficient comparison uniquely determines the integer matrix.

- Test **TauCeti.Computational.test_hecke_matrix_empty** (degenerate): The weight-two matrix has dimension zero and determinant one.
- Test **TauCeti.Computational.test_hecke_matrix_delta** (computation): The weight-12 T₂ determinant is −24.
- Test **TauCeti.Computational.test_hecke_matrix_ordinary** (non-example): At p=2, weight 12 is nonordinary: −24 reduces to zero.

Acceptance: The weight-two matrix has dimension zero and determinant one. The weight-12 T₂ determinant is −24. At p=2, weight 12 is nonordinary: −24 reduces to zero.

Sources: Stein, Lemma 2.20 and the Hecke coefficient recurrence.

### Nonordinary determinant at weight 38 and prime 79

**ComputationalNumberTheory:CN.3/weight-38-nonordinary-determinant**. Proposed declaration: TauCeti.Computational.weight38_nonordinary_det.

The determinant of the level-one T₇₉ matrix on the integral weight-38 cusp lattice is divisible by 79. Together with the imported simultaneous eigenform and reduction theorem, this yields a characteristic-zero eigenform with a₇₉ in a prime above 79. Also gcd(37,80)=1. The determinant statement alone is kept separate from that eigenform-lifting input.

Construction or proof: Construct the dimension-two Miller basis, compute the recurrence through degree 158, and reduce its exact integer determinant modulo 79. Use the upstream Hecke eigenform decomposition to interpret singular reduction.

Prerequisites: ComputationalNumberTheory:CN.3/integral-hecke-matrix.



Acceptance: The exact matrix must be reconstructed; a stored floating determinant is insufficient.

Sources: BCG, Corollary 3.2 proof, p.518.

### Certified nonordinary weight-prime pair

**ComputationalNumberTheory:CN.3/nonordinary-level-one-pair**. Proposed declaration: TauCeti.Computational.NonordinaryLevelOnePair.

NonordinaryLevelOnePair k p means p is prime, k≥2 is even, and the determinant of an integral matrix for the intrinsic level-one T_p action on S_k vanishes modulo p. The matrix must satisfy the complete coefficient recurrence, which determines the operator uniquely. To export existence of a characteristic-zero eigenform with nonordinary reduction, use the owner’s integral Hecke eigensystem and lifting theorem.

Construction or proof: Use the matrix construction and reduce its integer determinant into ZMod p. The empty matrix has determinant one, so zero-dimensional spaces never pass.

Prerequisites: ComputationalNumberTheory:CN.3/integral-hecke-matrix, ComputationalNumberTheory:CN.3/level-one-prime-recurrence, tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields.

- **TauCeti.Computational.nonordinary_pair_prime** (projection): A certified pair has prime residue characteristic.
- **TauCeti.Computational.nonordinary_pair_even** (projection): A certified pair has even positive weight.
- **TauCeti.Computational.nonordinary_pair_nonzero_dimension** (other): The cusp space of a certified pair has positive dimension.

- Test **TauCeti.Computational.test_nonordinary_38_79** (computation): The routed pair (38,79) passes.
- Test **TauCeti.Computational.test_nonordinary_weight_two** (degenerate): No weight-two pair passes.
- Test **TauCeti.Computational.test_nonordinary_26_107** (non-example): The weight-26 form is ordinary at 107.

Acceptance: The routed pair (38,79) passes. No weight-two pair passes. The weight-26 form is ordinary at 107.

Sources: BCG, Corollary 3.2 and Remark 3.3, p.518.

### The first two nonordinary level-one primes

**ComputationalNumberTheory:CN.3/smallest-nonordinary-primes**. Proposed declaration: TauCeti.Computational.small_nonordinary_primes.

Among primes p≤79, a level-one nonordinary eigenform of even weight 2≤k<p exists exactly for p=59 or p=79. The determinant witnesses occur at weights 16 and 46 for 59, and 38 and 44 for 79. The weight-16 witness at 59 fails gcd(k−1,p+1)=1, whereas weight 38 at 79 passes it.

Construction or proof: Enumerate every prime p≤79 and every even weight below p. For each, reconstruct the Miller basis and T_p matrix by exact q-expansion arithmetic, then check the determinant. The Sturm/basis comparison proves these are the intrinsic operators; dimension-zero cases contribute determinant one.

Prerequisites: ComputationalNumberTheory:CN.3/nonordinary-level-one-pair, ComputationalNumberTheory:CN.3/integral-hecke-matrix.



Acceptance: The record must include the failed tests at every smaller prime and eligible weight. Finding 59 and 79 alone is not minimality.

Sources: BCG, Remark 3.3, p.518.

### Nonordinary pairs below 200

**ComputationalNumberTheory:CN.3/nonordinary-list-below-200**. Proposed declaration: TauCeti.Computational.nonordinary_pairs_lt_200.

For prime p<200 and even 2≤k<p, the nonordinary pairs (p,k) are exactly (59,16),(59,46),(79,38),(79,44),(107,28),(107,82),(131,40),(131,94),(139,36),(139,106),(151,60),(151,94),(173,24),(173,152),(193,72),(193,124). Filtering by gcd(k−1,p+1)=1 gives the primes 79,151,173,193 used in the nonordinary part of BCG Remark 3.3.

Construction or proof: Run the same exact finite matrix checks on the larger range and retain every result. Then perform the integer gcd filter. The list is a planning target from the reviewed route, not a claim that this worker has replayed the complete dataset.

Prerequisites: ComputationalNumberTheory:CN.3/nonordinary-level-one-pair, ComputationalNumberTheory:CN.3/integral-hecke-matrix.



Acceptance: The paired weights both belong in the unfiltered list. The gcd filter is applied only afterwards.

Sources: BCG, Remark 3.3, p.518; reviewed routed item.

### Complete companion eigensystem at weight 82

**ComputationalNumberTheory:CN.3/weight-82-companion-system**. Proposed declaration: TauCeti.Computational.weight82_companion_system.

Let a_n be the exact integer coefficients of f=ΔE₄²E₆. The level-one integral Hecke matrices at weight 82 admit a common nonzero eigenvector over an algebraic closure of 𝔽₁₀₇, with eigenvalue ℓ⁸¹a_ℓ for every prime ℓ≠107. Equivalently a_ℓ(f)=ℓ²⁵a_ℓ(g) modulo 107. This coefficient convention matches BCG’s cohomological Galois normalization ρ̄_f≅ε̄⁻²⁵ρ̄_g, whose determinant is ε̄^(1−k). A common root of two separate characteristic polynomials is insufficient.

Construction or proof: Construct a common residual eigensystem, apply the mod-p theta/Hasse weight comparison, and prove the full congruence with a congruence Sturm bound. The theta weight convention, eigensystem lift and Galois trace comparison are requested from their owners. These proof inputs are not inferred from two Hecke eigenvalues.

Prerequisites: ComputationalNumberTheory:CN.3/integral-hecke-matrix, ComputationalNumberTheory:CN.3/level-one-congruence-sturm, ComputationalNumberTheory:CN.3/weight-26-coefficient-107, AlgebraicModularFormsAndSerreWeights:R15.3, tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields.



Acceptance: At primes away from 107, 25+81=106 gives reciprocal twists. Track arithmetic versus geometric Frobenius before comparing Galois representations.

Sources: BCG, Theorem 2.4 proof, p.515.

### Ordinary level-one companion pair

**ComputationalNumberTheory:CN.3/ordinary-companion-pair**. Proposed declaration: TauCeti.Computational.OrdinaryCompanionPair.

For a prime p, OrdinaryCompanionPair p k means 2≤k<p, both k and k′=p+1−k are even, and the integral level-one Hecke operators in these weights have common residual eigensystems over an algebraic closure of 𝔽_p. The first eigensystem has eigenvalues a_ℓ and a_p≠0. For every prime ℓ≠p the companion eigenvalue is ℓ^(p−k)a_ℓ, equivalently a_ℓ=ℓ^(k−1)b_ℓ. Each eigensystem is represented by one nonzero vector simultaneously for all prime Hecke matrices, not a collection of independently chosen eigenvalues.

Construction or proof: Use the integer Hecke matrices and coefficientwise reduction into the algebraic closure. Record both operator families, their intrinsic recurrence comparisons, two nonzero simultaneous eigenvectors and their eigenvalue function. Characteristic-zero lifting and the cohomological Galois comparison are owner inputs.

Prerequisites: ComputationalNumberTheory:CN.3/integral-hecke-matrix, ComputationalNumberTheory:CN.3/level-one-prime-recurrence, ComputationalNumberTheory:CN.3/weight-82-companion-system.

- **TauCeti.Computational.ordinaryCompanionPair_weight** (projection): The weight is even and strictly between 1 and p.
- **TauCeti.Computational.ordinaryCompanionPair_dimension** (compatibility): The first cusp space has positive dimension. Ordinarity belongs to the selected eigensystem; other eigensystems in the same space may be nonordinary.
- **TauCeti.Computational.ordinaryCompanionPair_companion_dimension** (other): The companion cusp space is also nonzero.

- Test **TauCeti.Computational.test_companion_107** (computation): Weight 26 at 107 has companion weight 82.
- Test **TauCeti.Computational.test_companion_low_prime** (degenerate): There is no eligible weight for p=2.
- Test **TauCeti.Computational.test_companion_weight_two** (non-example): Weight two has no cusp eigensystem.

Acceptance: Weight 26 at 107 has companion weight 82. There is no eligible weight for p=2. Weight two has no cusp eigensystem.

Sources: BCG, Theorem 2.1 and §2.3, pp.513–515; Remark 3.3, p.518.

### Corrected ordinary companion witnesses

**ComputationalNumberTheory:CN.3/corrected-ordinary-companion-list**. Proposed declaration: TauCeti.Computational.corrected_ordinary_companion_list.

For (p,k)=(107,26),(139,20),(173,68),(179,30),(191,30),(193,48), an OrdinaryCompanionPair p k exists and gcd(k−1,p−1)=1. These supply the corrected finite ordinary examples from the reviewed route. The candidate at p=151 has weights 52 and 100, and gcd(51,150)=gcd(99,150)=3, so those companion forms do not satisfy BCG Theorem 2.1. No exhaustive statement about all primes is made.

Construction or proof: Produce a complete simultaneous eigensystem certificate for each pair, apply the owner’s lift/Galois comparison, and check the integer gcd. The reviewed T₂/T₃ checks are discovery evidence only; full congruence certificates remain required.

Prerequisites: ComputationalNumberTheory:CN.3/ordinary-companion-pair, ComputationalNumberTheory:CN.3/level-one-congruence-sturm.



Acceptance: The 151 exclusion is the exact check gcd(51,150)=3 and gcd(99,150)=3. It is not fixed by increasing numerical precision.

Sources: BCG, Remark 3.3, p.518, corrected source issue E7.

### Exact equality of certified modular data

**ComputationalNumberTheory:CN.3/modular-data-equality**. Proposed declaration: TauCeti.Computational.modularDataEqual.

modularDataEqual B a b checks equality of two arrays of isolated algebraic coefficients indexed by 0,…,B. For two same-weight modular forms on a finite-index subgroup Γ of SL₂(ℤ), set B=(k·[SL₂(ℤ):Γ]).toNat/12 and require that the decoded arrays equal the forms’ coefficients at their actual strict cusp width. Acceptance then proves equality by the native Sturm bound. An LMFDB orbit label is accepted only after the owner’s level, character and embedding convention identifies which intrinsic forms these arrays describe; a label alone does not provide either binding proof.

Construction or proof: Apply the exact algebraic-value comparison at each index. Use the two coefficient binding proofs and the native Sturm theorem, including coefficient zero. Modular symbols, integral Hecke algebras, orbit labels and trace formulas are imported from their respective ModularForms layers.

Prerequisites: ComputationalNumberTheory:CN.0/algebraic-equality-check, tauceti:TauCeti.ModularForm.eq_of_sturm_bound, tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields, tauceti:TauCetiRoadmap/ModularForms#layer-9-the-lmfdb-invariant-layer, tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas.

- **TauCeti.Computational.modularDataEqual_iff** (characterisation): Acceptance is coefficientwise equality of native algebraic values.
- **TauCeti.Computational.modularDataEqual_sound** (compatibility): Correctly bound finite-index modular forms coincide on acceptance.
- **TauCeti.Computational.modularDataEqual_symm** (relation): Swapping the arrays preserves the verdict.

- Test **TauCeti.Computational.test_modular_data_constant** (degenerate): Bound zero still checks the constant coefficient.
- Test **TauCeti.Computational.test_modular_data_equal** (computation): Identical arrays pass.
- Test **TauCeti.Computational.test_modular_data_delta** (non-example): Matching constant terms do not suffice at weight twelve: the first Δ coefficient differs from zero.

Acceptance: Bound zero still checks the constant coefficient. Identical arrays pass. Matching constant terms do not suffice at weight twelve: the first Δ coefficient differs from zero.

Sources: Stein, Theorem 9.18, pp.171–172; §9.4.

## CN.4

### Rational interval multiplication

**ComputationalNumberTheory:CN.4/rational-interval-product**. Proposed declaration: TauCeti.Computational.intervalMul.

For I=[a,b] and J=[c,d] with rational endpoints, intervalMul I J is [min(ac,ad,bc,bd), max(ac,ad,bc,bd)]. These are enclosing intervals in ℝ under the rational embedding. The existing monotone interval multiplication does not apply to arbitrary signed rational endpoints.

Construction or proof: Evaluate all four corner products. Their minimum is at most their maximum; package these as the endpoints of the existing NonemptyInterval ℚ carrier.

Prerequisites: mathlib:NonemptyInterval.

- **TauCeti.Computational.intervalMul_lower** (projection): The lower endpoint is the minimum of the four corner products.
- **TauCeti.Computational.intervalMul_comm** (relation): Multiplication is symmetric in its two intervals.
- **TauCeti.Computational.intervalMul_pure** (compatibility): Singleton intervals multiply as rational numbers.

- Test **TauCeti.Computational.test_intervalMul_signed** (computation): [−2,3] times [−4,5] is [−12,15].
- Test **TauCeti.Computational.test_intervalMul_zero** (degenerate): The singleton zero times any interval is the singleton zero.
- Test **TauCeti.Computational.test_intervalMul_crossing** (non-example): [−1,1] times itself has lower endpoint −1, not +1.

Acceptance: [−2,3] times [−4,5] is [−12,15]. The singleton zero times any interval is the singleton zero. [−1,1] times itself has lower endpoint −1, not +1.

Sources: Arb, §2, pp.2–4.

### Enclosure under multiplication

**ComputationalNumberTheory:CN.4/rational-interval-product-sound**. Proposed declaration: TauCeti.Computational.intervalMul_sound.

For x,y∈ℝ, if a≤x≤b and c≤y≤d, then xy lies between the endpoints of intervalMul [a,b] [c,d], with all rational endpoints cast into ℝ.

Construction or proof: Split each input interval at zero. In each of the four sign cases, order compatibility of multiplication bounds xy by the corresponding corner products.

Prerequisites: ComputationalNumberTheory:CN.4/rational-interval-product.



Acceptance: The signed crossing-zero test is covered; no nonnegative-input hypothesis is imposed.

Sources: Arb, §2, pp.2–4.

### Partial interval reciprocal

**ComputationalNumberTheory:CN.4/rational-interval-inverse**. Proposed declaration: TauCeti.Computational.intervalInv.

intervalInv I returns none when 0∈I and otherwise returns the interval [1/I.upper,1/I.lower]. Failure is data and carries no assertion that the mathematical reciprocal exists at zero.

Construction or proof: Decide whether the rational endpoints straddle zero. On either remaining sign component, inversion reverses order.

Prerequisites: mathlib:NonemptyInterval.

- **TauCeti.Computational.intervalInv_involutive** (relation): Successful inversion twice recovers the input interval.
- **TauCeti.Computational.intervalInv_none** (characterisation): Failure is equivalent to the input interval containing zero.
- **TauCeti.Computational.intervalInv_endpoints** (projection): Successful output has reciprocals of the reversed input endpoints.

- Test **TauCeti.Computational.test_intervalInv_positive** (computation): The reciprocal of [2,4] is [1/4,1/2].
- Test **TauCeti.Computational.test_intervalInv_zero** (degenerate): The singleton zero is rejected.
- Test **TauCeti.Computational.test_intervalInv_negative** (computation): The reciprocal of [−4,−2] is [−1/2,−1/4].

Acceptance: The reciprocal of [2,4] is [1/4,1/2]. The singleton zero is rejected. The reciprocal of [−4,−2] is [−1/2,−1/4].

Sources: Arb, §2, p.4.

### Enclosure under reciprocal

**ComputationalNumberTheory:CN.4/rational-interval-inverse-sound**. Proposed declaration: TauCeti.Computational.intervalInv_sound.

If intervalInv I=some J and x∈ℝ lies in I, then x≠0 and 1/x lies in J.

Construction or proof: Unfold the successful branch and distinguish positive and negative intervals; apply order reversal of inversion in that sign component.

Prerequisites: ComputationalNumberTheory:CN.4/rational-interval-inverse.



Acceptance: An interval touching zero at an endpoint is rejected.

Sources: Arb, §2, p.4.

### Outward dyadic rounding

**ComputationalNumberTheory:CN.4/outward-dyadic-rounding**. Proposed declaration: TauCeti.Computational.dyadicHull.

For precision p∈ℕ, dyadicHull p [a,b]=[floor(2^p a)/2^p,ceil(2^p b)/2^p]. Negative endpoints use floor and ceiling, not truncation toward zero. The representation remains NonemptyInterval ℚ.

Construction or proof: Use the integer floor and ceiling of each scaled endpoint. Positivity of 2^p proves the endpoints are ordered.

Prerequisites: mathlib:NonemptyInterval.

- **TauCeti.Computational.dyadicHull_grid** (characterisation): Both output endpoints lie on the 2^(−p) rational grid.
- **TauCeti.Computational.dyadicHull_contains** (compatibility): The original interval is contained in the rounded interval.
- **TauCeti.Computational.dyadicHull_idempotent** (relation): Rounding again at the same precision does not change the interval.

- Test **TauCeti.Computational.test_dyadicHull_third** (computation): At p=2 the singleton 1/3 becomes [1/4,1/2].
- Test **TauCeti.Computational.test_dyadicHull_negative** (non-example): At p=0 the singleton −1/3 becomes [−1,0].
- Test **TauCeti.Computational.test_dyadicHull_zero** (degenerate): Exact zero remains exact at every precision.

Acceptance: At p=2 the singleton 1/3 becomes [1/4,1/2]. At p=0 the singleton −1/3 becomes [−1,0]. Exact zero remains exact at every precision.

Sources: Arb, §2, pp.2–4.

### Width added by dyadic rounding

**ComputationalNumberTheory:CN.4/outward-rounding-width**. Proposed declaration: TauCeti.Computational.dyadicHull_width.

The width of dyadicHull p I is less than width(I)+2·2^(−p). The strict bound includes exact endpoints.

Construction or proof: Each endpoint moves outward by strictly less than 2^(−p); add the two floor/ceiling error inequalities.

Prerequisites: ComputationalNumberTheory:CN.4/outward-dyadic-rounding.



Acceptance: The bound tends to zero as precision increases.

Sources: Arb, §2, pp.2–4.

### Unique integer extraction

**ComputationalNumberTheory:CN.4/unique-integer-in-enclosure**. Proposed declaration: TauCeti.Computational.uniqueInteger.

uniqueInteger I returns the integer ceil(I.lower) precisely when ceil(I.lower)=floor(I.upper); otherwise it returns none. It asserts uniqueness inside the closed interval, not that an unknown real number in it is integral.

Construction or proof: Compute the smallest and largest integers in the rational interval. Compare them exactly.

Prerequisites: mathlib:NonemptyInterval.

- **TauCeti.Computational.uniqueInteger_mem** (projection): A returned integer lies in the input interval.
- **TauCeti.Computational.uniqueInteger_iff** (characterisation): The output is z iff z is the unique integer in I.
- **TauCeti.Computational.uniqueInteger_pure** (simp): A singleton integer is recovered.

- Test **TauCeti.Computational.test_uniqueInteger_one** (computation): [3/4,5/4] contains exactly the integer 1.
- Test **TauCeti.Computational.test_uniqueInteger_two** (non-example): [0,1] is rejected because both endpoints are integers.
- Test **TauCeti.Computational.test_uniqueInteger_empty** (degenerate): The singleton 1/2 contains no integer and is rejected.

Acceptance: [3/4,5/4] contains exactly the integer 1. [0,1] is rejected because both endpoints are integers. The singleton 1/2 contains no integer and is rejected.

Sources: Arb, §3, pp.5–6.

### Recovery of a known integral value

**ComputationalNumberTheory:CN.4/integer-recovery-sound**. Proposed declaration: TauCeti.Computational.uniqueInteger_sound.

If z is an integer, its real image belongs to I, and uniqueInteger I=some w, then z=w. An enclosure around zero alone never proves that a general real or complex analytic value vanishes.

Construction or proof: Cast the rational endpoint inequalities and apply uniqueInteger_iff to the known integer z.

Prerequisites: ComputationalNumberTheory:CN.4/unique-integer-in-enclosure.



Acceptance: A nonintegral real in [−1/4,1/4] is not asserted to be zero.

Sources: Arb, §3, pp.5–6.

### Entrywise lower bounds on effective vectors

**ComputationalNumberTheory:CN.4/effective-gram-lower-bound**. Proposed declaration: TauCeti.Computational.effectiveGram_lower.

Let A,B be real n×n matrices. If B_ij≤A_ij for every i,j and x_i≥0 for every i, then Σ_ij B_ij x_i x_j≤Σ_ij A_ij x_i x_j. Symmetry is unnecessary for this inequality. The nonnegative-coordinate hypothesis is essential.

Construction or proof: Every x_i x_j is nonnegative. Multiply each entry inequality by this number and sum.

Prerequisites: ComputationalNumberTheory:CN.4/rational-interval-product-sound.



Acceptance: For x=(1,−1), entrywise comparison alone is insufficient.

Sources: CT, Remark 2.11, pp.281–282.

### Loewner lower bounds on unrestricted vectors

**ComputationalNumberTheory:CN.4/loewner-gram-lower-bound**. Proposed declaration: TauCeti.Computational.loewnerGram_lower.

For symmetric real matrices A and B with A−B positive semidefinite, xᵀBx≤xᵀAx for every real vector x, including mixed signs.

Construction or proof: Evaluate the positive-semidefinite inequality on x and expand the difference.

Prerequisites: .



Acceptance: The hypothesis explicitly quantifies over every vector and is stronger than entrywise comparison.

Sources: CT, Remark 2.11, pp.281–282.

### Rational witness of Gram negativity

**ComputationalNumberTheory:CN.4/gram-negativity-certificate**. Proposed declaration: TauCeti.Computational.NegativeGramCertificate.

For an n×n matrix I of rational enclosing intervals and a rational vector t, NegativeGramCertificate I consists of t_i≥0 for every i, t≠0, and the strictly negative rational upper bound Σ_ij I_ij.upper t_i t_j<0. It does not store an approximate eigenvalue as evidence.

Construction or proof: The fields are exact rational inequalities. Nonnegativity permits endpointwise upper bounding.

Prerequisites: mathlib:NonemptyInterval, ComputationalNumberTheory:CN.4/effective-gram-lower-bound.

- **TauCeti.Computational.NegativeGramCertificate.upper_negative** (projection): The stored endpoint quadratic value is strictly negative.
- **TauCeti.Computational.NegativeGramCertificate.vector_ne_zero** (projection): The witness vector is nonzero.
- **TauCeti.Computational.NegativeGramCertificate.scale** (functoriality): Multiplying the vector by a positive rational preserves certification.
- **TauCeti.Computational.NegativeGramCertificate.scale_vector** (simp): The scaled certificate uses exactly r times the original vector.

- Test **TauCeti.Computational.test_negativeGram_one** (computation): The one-dimensional interval [−2,−1] admits vector 1.
- Test **TauCeti.Computational.test_negativeGram_zero_dim** (degenerate): Dimension zero admits no nonzero vector certificate.
- Test **TauCeti.Computational.test_negativeGram_crossing** (non-example): The one-dimensional enclosure [−1,1] certifies no negative value by this rule.

Acceptance: The one-dimensional interval [−2,−1] admits vector 1. Dimension zero admits no nonzero vector certificate. The one-dimensional enclosure [−1,1] certifies no negative value by this rule.

Sources: CT, Algorithm 2.4.4, pp.282–283.

### Soundness of the negativity certificate

**ComputationalNumberTheory:CN.4/gram-negativity-sound**. Proposed declaration: TauCeti.Computational.NegativeGramCertificate.sound.

If A_ij lies in interval I_ij and c is a NegativeGramCertificate I, then c.vectorᵀ A c.vector<0 over ℝ.

Construction or proof: Cast the exact rational upper inequality to ℝ. Sum entrywise upper bounds weighted by nonnegative vector products.

Prerequisites: ComputationalNumberTheory:CN.4/gram-negativity-certificate, ComputationalNumberTheory:CN.4/effective-gram-lower-bound.



Acceptance: Every stored CT witness must pass this exact check after all analytic entries are enclosed.

Sources: CT, Algorithm 2.4.4, step 4, pp.282–283.

### Normalize a rational p-adic ball

**ComputationalNumberTheory:CN.4/padic-normalization**. Proposed declaration: TauCeti.Computational.padicNormalize.

For prime p, rational centre c and absolute precision N∈ℤ, padicNormalize p c N returns the unique canonical PadicApproximation at precision N with denotation {x | ‖x−c‖≤p^(−N)}. Its valuation field is N if c=0, and min(v_p(c),N) otherwise. For v<N the mantissa is the unique residue in [1,p^(N−v)) prime to p representing c·p^(−v) modulo p^(N−v).

Construction or proof: Separate the zero and high-valuation cases. Otherwise invert the denominator prime to p modulo p^(N−v) and reduce the scaled numerator. Native p-adic truncation compares this residue with the original rational centre.

Prerequisites: ComputationalNumberTheory:CN.0/padic-approximation, mathlib:PadicInt.toZModPow, mathlib:padicValRat.

- **TauCeti.Computational.padicNormalize_precision** (projection): Absolute precision is retained.
- **TauCeti.Computational.padicNormalize_denotation** (characterisation): Normalization preserves the entire rational-centred ball.
- **TauCeti.Computational.padicNormalize_valuation** (compatibility): The zero branch avoids the native valuation-at-zero default.
- **TauCeti.Computational.padicNormalize_id** (simp): Normalizing an already canonical centre and precision recovers the approximation.

- Test **TauCeti.Computational.test_normalize_zero** (degenerate): Zero at precision 5 has valuation 5 and mantissa zero.
- Test **TauCeti.Computational.test_normalize_five** (computation): 5 modulo 3 normalizes to mantissa 2.
- Test **TauCeti.Computational.test_normalize_cancellation** (non-example): 9 at absolute precision 2 is a zero-centred ball, not a unit with valuation zero.

Acceptance: Zero at precision 5 has valuation 5 and mantissa zero. 5 modulo 3 normalizes to mantissa 2. 9 at absolute precision 2 is a zero-centred ball, not a unit with valuation zero.

Sources: CarusoPublished, §2.1.1, pp.17–19, corrected error computation.

### Certified p-adic addition

**ComputationalNumberTheory:CN.4/padic-add**. Proposed declaration: TauCeti.Computational.padicAdd.

Add two canonical p-adic approximations by normalizing the sum of centres at absolute precision min(N,N′). For every independently chosen x in the first ball and y in the second, the sum lies in the output ball. This enclosure does not recover correlations between repeated occurrences of an uncertain input.

Construction or proof: Expand the error around the exact rational centres and apply the ultrametric inequality.

Prerequisites: ComputationalNumberTheory:CN.4/padic-normalization, ComputationalNumberTheory:CN.0/padic-approximation.

- **TauCeti.Computational.padicAdd_precision** (projection): The output has the stated absolute precision.
- **TauCeti.Computational.padicAdd_sound** (compatibility): The output contains every result from independently chosen inputs.
- **TauCeti.Computational.padicAdd_comm** (relation): The canonical result is symmetric in its inputs.

- Test **TauCeti.Computational.test_padic_add_zero** (degenerate): The operation on two precision-zero zero-centred balls contains zero.
- Test **TauCeti.Computational.test_padic_add_centres** (computation): The exact operation on the centres lies in the output.
- Test **TauCeti.Computational.test_padic_add_unequal_precision** (compatibility): The declared precision includes different input precisions and zero centres.

Acceptance: The operation on two precision-zero zero-centred balls contains zero. The exact operation on the centres lies in the output. The declared precision includes different input precisions and zero centres.

Sources: CarusoPublished, §2.1.1, pp.17–19, corrected error computation.

### Certified p-adic multiplication

**ComputationalNumberTheory:CN.4/padic-mul**. Proposed declaration: TauCeti.Computational.padicMul.

Multiply two canonical p-adic approximations by normalizing the product of centres at absolute precision min(v+N′,N+v′). For every independently chosen x in the first ball and y in the second, the product lies in the output ball. This enclosure does not recover correlations between repeated occurrences of an uncertain input.

Construction or proof: Expand the error around the exact rational centres and apply the ultrametric inequality. For multiplication the mixed error has valuation at least N+N′, which is no smaller than either retained bound because v≤N and v′≤N′.

Prerequisites: ComputationalNumberTheory:CN.4/padic-normalization, ComputationalNumberTheory:CN.0/padic-approximation.

- **TauCeti.Computational.padicMul_precision** (projection): The output has the stated absolute precision.
- **TauCeti.Computational.padicMul_sound** (compatibility): The output contains every result from independently chosen inputs.
- **TauCeti.Computational.padicMul_comm** (relation): The canonical result is symmetric in its inputs.

- Test **TauCeti.Computational.test_padic_mul_zero** (degenerate): The operation on two precision-zero zero-centred balls contains zero.
- Test **TauCeti.Computational.test_padic_mul_centres** (computation): The exact operation on the centres lies in the output.
- Test **TauCeti.Computational.test_padic_mul_unequal_precision** (compatibility): The declared precision includes different input precisions and zero centres.

Acceptance: The operation on two precision-zero zero-centred balls contains zero. The exact operation on the centres lies in the output. The declared precision includes different input precisions and zero centres.

Sources: CarusoPublished, §2.1.1, pp.17–19, corrected error computation.

### Partial p-adic inversion

**ComputationalNumberTheory:CN.4/padic-inverse**. Proposed declaration: TauCeti.Computational.padicInverse.

padicInverse rejects a zero-mantissa approximation, because its ball contains zero. Otherwise it returns the normalized reciprocal of the rational centre at absolute precision N−2v. Every element in the input ball is nonzero and its inverse lies in this output. The input relative precision N−v is preserved.

Construction or proof: Write x=c+h with v(h)≥N>v(c). Then x has the same valuation as c and x⁻¹−c⁻¹=−h/(cx), of valuation at least N−2v.

Prerequisites: ComputationalNumberTheory:CN.4/padic-normalization, ComputationalNumberTheory:CN.0/padic-approximation.

- **TauCeti.Computational.padicInverse_none_iff** (characterisation): Rejection is exactly the presence of zero in the input ball.
- **TauCeti.Computational.padicInverse_precision** (projection): A successful output has precision N−2v.
- **TauCeti.Computational.padicInverse_sound** (compatibility): A successful output encloses reciprocals of every input value.

- Test **TauCeti.Computational.test_padic_inverse_zero** (degenerate): The zero-centred ball is rejected.
- Test **TauCeti.Computational.test_padic_inverse_unit** (computation): Inverting a precision-four unit preserves absolute precision four.
- Test **TauCeti.Computational.test_padic_inverse_loss** (non-example): Inverting 3+O(3⁴) loses two absolute digits, yielding precision two.

Acceptance: The zero-centred ball is rejected. Inverting a precision-four unit preserves absolute precision four. Inverting 3+O(3⁴) loses two absolute digits, yielding precision two.

Sources: CarusoPublished, §2.1.1, pp.17–19, corrected error computation.

### Rational complex-box denotation

**ComputationalNumberTheory:CN.4/complex-box-denotation**. Proposed declaration: TauCeti.Computational.complexBoxSet.

A complex box is represented by the native pair (R,I) of closed nonempty rational intervals. complexBoxSet(R,I) is {z∈ℂ | Re(z)∈R and Im(z)∈I}. No new complex-number carrier or rounded value equality is introduced. Degenerate boxes and boxes meeting branch cuts are allowed; analytic evaluators must account for their entire image.

Construction or proof: Define the four real endpoint inequalities using rational casts.

Prerequisites: mathlib:NonemptyInterval.

- **TauCeti.Computational.mem_complexBoxSet** (characterisation): Membership is membership of both real components in their endpoint intervals.
- **TauCeti.Computational.complexBoxSet_nonempty** (other): Every nonempty component pair denotes a nonempty complex set.
- **TauCeti.Computational.complexBoxSet_mono** (functoriality): Expanding each component interval expands the denotation.

- Test **TauCeti.Computational.test_box_zero** (degenerate): The pair of singleton zero intervals contains only zero.
- Test **TauCeti.Computational.test_box_i** (computation): The box [0,0]×[1,1] contains i.
- Test **TauCeti.Computational.test_box_positive_nonzero** (non-example): A strictly positive real lower endpoint excludes zero.

Acceptance: The pair of singleton zero intervals contains only zero. The box [0,0]×[1,1] contains i. A strictly positive real lower endpoint excludes zero.

Sources: Arb, §5 and §5.3, pp.7–8.

### Odlyzko tail kernel

**ComputationalNumberTheory:CN.4/odlyzko-tail-kernel**. Proposed declaration: TauCeti.Computational.ctTailKernel.

ctTailKernel(x)=2π²exp(−x)/(x²+π²)² for real x. It is positive everywhere and decreases on [0,∞). This is the scalar exponentially decaying kernel in both unconditional F_ℓ and conditional G_ℓ evaluation formulas; positivity of the test functions and the GRH-dependent explicit-formula implication belong to the automorphic owner.

Construction or proof: Use native real exp and π. Positivity follows from π≠0. On the nonnegative half-line both the exponential factor decreases and the positive denominator increases.

Prerequisites: .

- **TauCeti.Computational.ctTailKernel_pos** (other): The kernel is strictly positive.
- **TauCeti.Computational.ctTailKernel_zero** (simp): At zero its value is 2/π².
- **TauCeti.Computational.ctTailKernel_geometric** (relation): For x,t≥0, r(x+t)≤exp(−t)r(x).

- Test **TauCeti.Computational.test_tail_kernel_zero** (degenerate): The zero value is positive and finite.
- Test **TauCeti.Computational.test_tail_kernel_one** (computation): r(1) is strictly below r(0).
- Test **TauCeti.Computational.test_tail_kernel_not_even** (non-example): The kernel is not even: r(−1)>r(1).

Acceptance: The zero value is positive and finite. r(1) is strictly below r(0). The kernel is not even: r(−1)>r(1).

Sources: CL, §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.

### Geometric bound for the Odlyzko tail

**ComputationalNumberTheory:CN.4/odlyzko-geometric-tail**. Proposed declaration: TauCeti.Computational.ctTailKernel_tail.

For α>0, b≥0 and N∈ℕ, the series Σr(α(b+n)) converges and its tail after indices 0,…,N−1 lies in [0,r(α(b+N))/(1−exp(−α))]. N=0 includes the entire series.

Construction or proof: The preceding kernel inequality gives a geometric majorant with ratio exp(−α)<1. Sum that majorant and use termwise positivity.

Prerequisites: ComputationalNumberTheory:CN.4/odlyzko-tail-kernel.



Acceptance: No omitted sum is silently replaced by zero. Positive α is essential for the geometric denominator.

Sources: CL, §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.

### Alternating Odlyzko tail bound

**ComputationalNumberTheory:CN.4/odlyzko-alternating-tail**. Proposed declaration: TauCeti.Computational.ctTailKernel_alternating_tail.

For α>0 and b≥0, the absolute error after the first N terms of Σ(−1)^n r(α(b+n)) is at most r(α(b+N)). The weighted n·r(αn) variant used by J_F(1−ε) needs its own monotonicity threshold; α(N+1)≥1 is a sufficient rationally checkable replacement for the sharper decimal threshold in the source.

Construction or proof: The kernel decreases to zero, so apply the alternating-series remainder theorem. For the weighted variant, differentiate log(xr(x)); it is decreasing for x≥1.

Prerequisites: ComputationalNumberTheory:CN.4/odlyzko-tail-kernel, ComputationalNumberTheory:CN.4/odlyzko-geometric-tail.



Acceptance: The first omitted index is N, avoiding a one-term truncation error.

Sources: CL, §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint.

### Closed scalar formulas for CT evaluation

**ComputationalNumberTheory:CN.4/ct-explicit-formula-values**. Proposed declaration: TauCeti.Computational.ctExplicitFormula.

ctExplicitFormula ℓ w selects one of eight scalar expressions, for ℓ>0 and w∈ℕ. Put r=ctTailKernel, φ(z)=(ψ((z+1)/2)−ψ(z/2))/2, b_F=1/2+w/4 and b_G=(1+w)/2. Indices 0,…,7 are F̂_ℓ(0), F̂_ℓ(i/4π), J_Fℓ(I_w), J_Fℓ(1−ε), Ĝ_ℓ(0), Ĝ_ℓ(i/4π), J_Gℓ(I_w), J_Gℓ(1−ε). Their explicit expressions are those of CL Proposition 3.17 and CT Proposition 4.4, with the Fourier/Laplace dictionary F̂(0)=Φ_F(1/2), F̂(i/4π)=Φ_F(0). This declaration defines the numerical right-hand sides; identification with the intrinsic automorphic linear functional remains an imported obligation.

Construction or proof: Use the native digamma function and its derivative, the displayed exponentially convergent tails, and elementary real/complex operations. Both formulas for F̂(i/4π) and Ĝ(0) equal 8ℓ/π². Distinguish the F and G gamma shifts and the weighted alternating tail.

Prerequisites: ComputationalNumberTheory:CN.4/odlyzko-tail-kernel, ComputationalNumberTheory:CN.4/odlyzko-geometric-tail, ComputationalNumberTheory:CN.4/odlyzko-alternating-tail, mathlib:Complex.digamma, mathlib:Complex.digamma_apply_add_nat.

- **TauCeti.Computational.ctExplicitFormula_shared_value** (compatibility): The unconditional imaginary Fourier value equals the conditional zero Fourier value.
- **TauCeti.Computational.ctExplicitFormula_fourier** (simp): Their value is 8ℓ/π².
- **TauCeti.Computational.ctExplicitFormula_G_imag** (projection): The conditional imaginary Fourier value has the cosh closed formula.

- Test **TauCeti.Computational.test_ct_fourier_positive** (computation): For every positive ℓ the shared Fourier value is positive.
- Test **TauCeti.Computational.test_ct_fourier_zero** (degenerate): At ℓ=0 the totalized formula is zero, and is excluded from every evaluation theorem.
- Test **TauCeti.Computational.test_ct_fourier_linear** (compatibility): Doubling ℓ doubles the shared Fourier value.

Acceptance: For every positive ℓ the shared Fourier value is positive. At ℓ=0 the totalized formula is zero, and is excluded from every evaluation theorem. Doubling ℓ doubles the shared Fourier value.

Sources: CL, §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint; CT, Proposition 4.4 and proof, pp.298–299.

### Certified rational enclosures of CT quantities

**ComputationalNumberTheory:CN.4/ct-scalar-enclosure**. Proposed declaration: TauCeti.Computational.ctEnclosure.

For rational ℓ>0, weight w, quantity index q∈{0,…,7} and precision P∈ℕ, ctEnclosure returns rational endpoints containing ctExplicitFormula ℓ w q, with width at most 2^(−P). It evaluates exp, log, π, ψ and ψ′ with directed error bounds and adds the explicit series remainder. The two identical Fourier-value indices 1 and 4 use the same evaluation path. An approximate eigenvalue search does not enter this checker.

Construction or proof: Bound argument-reduction and elementary-function errors, shift digamma arguments within the right half-plane using the native recurrence, and apply a certified Euler–Maclaurin or Spouge remainder. Choose tail truncation from the kernel bounds. Round the final interval outward, increasing internal precision until the requested width is achieved. The special-function remainder and termination proof are explicit refinements.

Prerequisites: ComputationalNumberTheory:CN.4/ct-explicit-formula-values, ComputationalNumberTheory:CN.4/outward-dyadic-rounding, ComputationalNumberTheory:CN.4/odlyzko-geometric-tail, ComputationalNumberTheory:CN.4/odlyzko-alternating-tail, mathlib:Complex.digamma_apply_add_nat.

- **TauCeti.Computational.ctEnclosure_sound** (characterisation): The exact scalar lies between the returned endpoints.
- **TauCeti.Computational.ctEnclosure_width** (projection): The rational width meets the requested binary accuracy.
- **TauCeti.Computational.ctEnclosure_shared** (compatibility): The equal Fourier-value indices use the same enclosure.

- Test **TauCeti.Computational.test_ct_enclosure_unit** (computation): At ℓ=1 and precision 8 the shared Fourier value lies inside (4/5,41/50).
- Test **TauCeti.Computational.test_ct_enclosure_weight_zero** (degenerate): Weight zero is an allowed I₀ evaluation, with a nonempty enclosure.
- Test **TauCeti.Computational.test_ct_enclosure_not_exact** (non-example): The rational interval cannot be a singleton for 8/π².

Acceptance: At ℓ=1 and precision 8 the shared Fourier value lies inside (4/5,41/50). Weight zero is an allowed I₀ evaluation, with a nonempty enclosure. The rational interval cannot be a singleton for 8/π².

Sources: CL, §3.16, Proposition 3.17 and numerical comments (3), printed pp.304–307, French preprint; Arb, §5, pp.7–8.

### Complete isolation of rational-polynomial roots

**ComputationalNumberTheory:CN.4/certified-polynomial-root-isolation**. Proposed declaration: TauCeti.Computational.isolatePolynomialRoots.

For nonzero f∈ℚ[X], isolatePolynomialRoots f returns a finite list of AlgebraicRootCertificate objects, each using f, with pairwise disjoint closed rational rectangles, and whose decoded values are exactly the distinct complex roots of f. Multiplicities are retained separately by square-free factorization; the output list counts distinct roots. A constant nonzero polynomial returns the empty list.

Construction or proof: Use exact square-free factorization and certified complex root counting in rational rectangles. Subdivide until each remaining rectangle contains a single distinct root and all roots are accounted for. A separation bound and a global degree/count argument prove termination and completeness; these are explicit proof obligations, not supplied by approximate root locations.

Prerequisites: ComputationalNumberTheory:CN.0/algebraic-root-certificate, ComputationalNumberTheory:CN.1/rational-polynomial-factor-certificate.

- **TauCeti.Computational.isolatePolynomialRoots_polynomial** (projection): Every output uses the input polynomial.
- **TauCeti.Computational.isolatePolynomialRoots_complete** (characterisation): The decoded values are exactly all distinct roots.
- **TauCeti.Computational.isolatePolynomialRoots_nodup** (other): No root occurs twice.
- **TauCeti.Computational.isolatePolynomialRoots_disjoint** (other): Different output rectangles are disjoint.

- Test **TauCeti.Computational.test_isolate_constant** (degenerate): A nonzero constant has no roots.
- Test **TauCeti.Computational.test_isolate_repeated** (non-example): X² returns one distinct root, not two boxes containing zero.
- Test **TauCeti.Computational.test_isolate_complex** (computation): X²+1 returns two distinct complex roots.

Acceptance: A nonzero constant has no roots. X² returns one distinct root, not two boxes containing zero. X²+1 returns two distinct complex roots.

Sources: Arb, §5, pp.7–8.

### Certified continued Dirichlet L-values

**ComputationalNumberTheory:CN.4/dirichlet-l-value-enclosure**. Proposed declaration: TauCeti.Computational.dirichletLBox.

For a primitive complex Dirichlet character χ of positive modulus q, a rational complex point z away from the principal-character pole at s=1, and requested precision P, dirichletLBox returns a rational complex rectangle containing the native continued LFunction(χ,z), with each component width at most 2^(−P). Character values require certified algebraic presentations. Euler–Maclaurin or an approximate functional equation supplies analytic continuation evaluation; the raw Dirichlet series is used only where it converges.

Construction or proof: Import the native continued function. Evaluate finite character sums and special-function terms with enclosing arithmetic, then add a proved uniform remainder. The principal-character pole is rejected by hypothesis. For nonrational evaluation points, consume a shrinking input enclosure and a local derivative bound in the same evaluator.

Prerequisites: mathlib:DirichletCharacter.LFunction, mathlib:DirichletCharacter.IsPrimitive, ComputationalNumberTheory:CN.4/complex-box-denotation, ComputationalNumberTheory:CN.0/algebraic-root-certificate.

- **TauCeti.Computational.dirichletLBox_sound** (compatibility): The native meromorphic L-value is enclosed.
- **TauCeti.Computational.dirichletLBox_width** (projection): Both component widths are at most 2^(−P).
- **TauCeti.Computational.dirichletLBox_nonvanishing** (other): Exclusion of zero certifies nonvanishing.

- Test **TauCeti.Computational.test_lbox_zeta_two** (computation): The modulus-one value at 2 encloses ζ(2).
- Test **TauCeti.Computational.test_lbox_pole** (non-example): The principal modulus-one input at 1 fails the pole guard.
- Test **TauCeti.Computational.test_lbox_critical_line** (compatibility): The central point uses the continued L-function, even though its raw Dirichlet series is outside absolute convergence.

Acceptance: The modulus-one value at 2 encloses ζ(2). The principal modulus-one input at 1 fails the pole guard. The central point uses the continued L-function, even though its raw Dirichlet series is outside absolute convergence.

Sources: Platt, §§4–6 and §7, pp.3–15.

### Platt’s finite-conductor zero certificate target

**ComputationalNumberTheory:CN.4/platt-bounded-height-grh**. Proposed declaration: TauCeti.Computational.platt_bounded_height.

For primitive χ of modulus q≤400000, every zero s of the native LFunction in 0<Re(s)<1 with |Im(s)|≤H(q) has Re(s)=1/2, where H(q)=max(10⁸/q,7.5·10⁷/q+200) for even q and max(10⁸/q,3.75·10⁷/q+200) for odd q. This parity is the modulus parity, not character parity. The unconditional finite computation is not an assumption of global GRH.

Construction or proof: Reconstruct the character enumeration, interval evaluations, sign-change zero isolations and Turing upper count. Equality between the isolated zero count and the upper count excludes missed off-line zeros. This chain and its datasets remain recorded gaps.

Prerequisites: ComputationalNumberTheory:CN.4/dirichlet-l-value-enclosure, mathlib:DirichletCharacter.LFunction, mathlib:DirichletCharacter.IsPrimitive.



Acceptance: Height zero is included. Endpoint and central zeros need their explicit count conventions.

Sources: Platt, Theorems 7.1–7.2, pp.14–15.

### Platt’s central nonvanishing target

**ComputationalNumberTheory:CN.4/platt-central-nonvanishing**. Proposed declaration: TauCeti.Computational.platt_central_nonvanishing.

For every primitive complex Dirichlet character of modulus q≤2000000, LFunction(χ,1/2)≠0. This is a separate finite certificate target from the bounded-height zero-line theorem.

Construction or proof: Enumerate every primitive character and produce an interval for its central value excluding zero. Increase certified precision in every unresolved case; never accept a box merely because its midpoint is nonzero.

Prerequisites: ComputationalNumberTheory:CN.4/dirichlet-l-value-enclosure, mathlib:DirichletCharacter.LFunction, mathlib:DirichletCharacter.IsPrimitive.



Acceptance: Every unresolved interval requires a higher-precision certificate. A finite list of already resolved characters is not completeness.

Sources: Platt, Theorems 7.1–7.2, pp.14–15.

### No real zeros for conductor at most 400000

**ComputationalNumberTheory:CN.4/small-conductor-real-zero-exclusion**. Proposed declaration: TauCeti.Computational.small_conductor_no_real_zero.

For primitive χ of modulus q≤400000 and real s with 0<s<1, the native continued LFunction(χ,s) is nonzero. This is the exact computation input used by Bennett–Siksek Proposition 7.2.

Construction or proof: A hypothetical real zero has height zero, so the bounded-height theorem forces s=1/2. The separate central nonvanishing theorem excludes that value.

Prerequisites: ComputationalNumberTheory:CN.4/platt-bounded-height-grh, ComputationalNumberTheory:CN.4/platt-central-nonvanishing.



Acceptance: The open real interval excludes the pole at 1 and trivial zeros outside the range.

Sources: Platt, Theorems 7.1–7.2, pp.14–15; BennettSiksek, §7, proof of Proposition 7.2, p.376.

### Effective vectors from a certified ellipsoid cover

**ComputationalNumberTheory:CN.4/effective-ellipsoid-cover**. Proposed declaration: TauCeti.Computational.effectiveEllipsoidCover.

Given a certified finite cover S of all integer vectors x with xᵀBx≤c, effectiveEllipsoidCover filters S by nonnegative coordinates and the exact rational bound xᵀBx≤c. If B is entrywise below the real target Gram matrix A, then every effective integer x with xᵀAx≤c remains in the output. The result may contain vectors failing the true A-bound, so it is a cover of the required set, not an exact list for A. A safety factor such as 1.001 must appear in the supplied c and never be silently described as the original cutoff.

Construction or proof: Import GN.5’s complete exact enumeration. Filter with decidable integer/rational inequalities. The effective Gram comparison proves that each required A-short vector is B-short and therefore was enumerated.

Prerequisites: GeometryOfNumbersAndQuadraticArithmetic:GN.5, ComputationalNumberTheory:CN.4/effective-gram-lower-bound.

- **TauCeti.Computational.mem_effectiveEllipsoidCover** (characterisation): Membership is membership in S plus the two exact filter conditions.
- **TauCeti.Computational.effectiveEllipsoidCover_subset** (projection): Filtering never invents a vector.
- **TauCeti.Computational.effectiveEllipsoidCover_complete** (compatibility): Every nonnegative B-short vector is retained when S is exhaustive.

- Test **TauCeti.Computational.test_effective_cover_zero** (degenerate): The zero vector survives any nonnegative cutoff when supplied.
- Test **TauCeti.Computational.test_effective_cover_negative** (non-example): A negative coordinate is rejected even inside the ellipsoid.
- Test **TauCeti.Computational.test_effective_cover_boundary** (computation): A vector on the exact rational boundary is retained.

Acceptance: The zero vector survives any nonnegative cutoff when supplied. A negative coordinate is rejected even inside the ellipsoid. A vector on the exact rational boundary is retained.

Sources: CT, Remark 2.11 and §2.4.3, pp.281–282.

### Finite Gram-negativity checker

**ComputationalNumberTheory:CN.4/check-gram-negativity**. Proposed declaration: TauCeti.Computational.checkNegativeGram.

checkNegativeGram I t is true exactly when every rational coordinate of t is nonnegative, t is not the zero vector, and the rational quadratic sum using upper interval endpoints is strictly negative. It verifies a raw proposed witness, independently of how t was found. For mixed-sign vectors this endpoint checker deliberately rejects the witness; use full interval products or a different certified bound instead.

Construction or proof: All arithmetic and comparisons are rational and finite. A successful check constructs the previously specified NegativeGramCertificate with exactly the supplied vector.

Prerequisites: ComputationalNumberTheory:CN.4/gram-negativity-certificate, ComputationalNumberTheory:CN.4/effective-gram-lower-bound.

- **TauCeti.Computational.checkNegativeGram_iff** (characterisation): Acceptance is exactly the three finite rational conditions.
- **TauCeti.Computational.checkNegativeGram_certificate** (constructor): Success supplies a certificate with the same vector.
- **TauCeti.Computational.checkNegativeGram_scale** (functoriality): Scaling by a positive rational preserves the Boolean verdict.

- Test **TauCeti.Computational.test_check_negative** (computation): Upper endpoint −1 and vector 1 pass.
- Test **TauCeti.Computational.test_check_zero_vector** (degenerate): The zero vector never passes.
- Test **TauCeti.Computational.test_check_ambiguous_sign** (non-example): An interval straddling zero fails even if its lower endpoint is negative.

Acceptance: Upper endpoint −1 and vector 1 pass. The zero vector never passes. An interval straddling zero fails even if its lower endpoint is negative.

Sources: CT, Algorithms 2.4.4–2.4.5, pp.282–284.

### Finite family of Gram certificates

**ComputationalNumberTheory:CN.4/check-gram-dataset**. Proposed declaration: TauCeti.Computational.checkGramDataset.

A raw Gram row is a dimension n, an n×n rational interval matrix and an n-coordinate rational vector. checkGramDataset applies checkNegativeGram to every row and returns their Boolean conjunction. Acceptance says exactly that every listed witness certifies a negative real quadratic value, assuming the analytic entries are enclosed. It does not assert that the list exhausts a mathematical search space; coverage comes separately from the enumeration certificate. Source identifiers, software pins and file hashes are handoff provenance, not new mathematical structures.

Construction or proof: Use a dependent pair over n and a finite List. Check each row independently; prove the all-members equivalence by list induction.

Prerequisites: ComputationalNumberTheory:CN.4/check-gram-negativity, ComputationalNumberTheory:CN.4/ct-scalar-enclosure, ComputationalNumberTheory:CN.4/effective-ellipsoid-cover.

- **TauCeti.Computational.checkGramDataset_iff** (characterisation): All rows pass iff every member’s finite checker passes.
- **TauCeti.Computational.checkGramDataset_append** (relation): Checking concatenation is the conjunction of the two checks.
- **TauCeti.Computational.checkGramDataset_perm** (functoriality): Reordering rows does not change acceptance.

- Test **TauCeti.Computational.test_dataset_empty** (degenerate): The empty list passes, proving nothing about coverage.
- Test **TauCeti.Computational.test_dataset_single** (computation): A one-row negative certificate passes.
- Test **TauCeti.Computational.test_dataset_bad_row** (non-example): Adding a zero-vector row makes the entire dataset fail.

Acceptance: The empty list passes, proving nothing about coverage. A one-row negative certificate passes. Adding a zero-vector row makes the entire dataset fail.

Sources: CT, Stored certificates of §§2.4.6,4.1–4.3.

### Correct multiplicity lift for Gram witnesses

**ComputationalNumberTheory:CN.4/multiplicity-gram-lift**. Proposed declaration: TauCeti.Computational.multiplicityGram_lift.

Let m_i>0 be block sizes, A∈ℝ and K an n×n real matrix. On the expanded index set {(i,r):0≤r<m_i}, put B_(i,r),(j,s)=A·δ_(i,r),(j,s)−K_ij. For any vector t, the expanded vector x_(i,r)=t_i/m_i satisfies xᵀBx=tᵀβt, where β_ij=(A/m_i)δ_ij−K_ij. Thus a certified negative value for β gives one for B. The lift is t_i/m_i; replacing it by t_i/√m_i changes the off-diagonal normalization. This equality does not assert equality of Euclidean unit-sphere minima.

Construction or proof: Sum each constant block contribution and the diagonal terms separately. Each diagonal block contributes A·m_i·(t_i/m_i)²=A t_i²/m_i, while each off-diagonal block contributes −K_ij t_i t_j.

Prerequisites: ComputationalNumberTheory:CN.4/gram-negativity-certificate.



Acceptance: With one block m=2, A=2, K=0 and t=1, both displayed quadratic values are 1. The square-root lift instead has value 2.

Sources: CT, §2.3 reduction, pp.275–276; corrected source issue E3.

### Certified cusp-form L-value enclosure

**ComputationalNumberTheory:CN.4/cusp-l-value-enclosure**. Proposed declaration: TauCeti.Computational.cuspLBox.

For positive integer weight k, a level-one cusp form f with integral q-expansion, a rational complex argument z and precision P, cuspLBox returns a rational rectangle containing the native continued ModularForm.L(k,f,z), with each coordinate width at most 2^(−P). The finite coordinates of f are supplied through the certified Miller basis. The algorithm uses the imported functional equation and a smoothed series with effective coefficient and truncation bounds; it does not use the raw Dirichlet series outside its convergence half-plane. General levels, algebraic coefficient embeddings and Fricke-transformed data are supplier refinements of the same evaluation contract.

Construction or proof: Obtain exact finite coordinates through the integral lattice and Miller basis. Import the native continuation and functional equation. Enclose finite sums and bound both smoothed tails before outward rounding. Effective constants and the general-level normalization comparison remain recorded proof inputs.

Prerequisites: mathlib:ModularForm.L, ComputationalNumberTheory:CN.4/complex-box-denotation, ComputationalNumberTheory:CN.3/miller-basis, ComputationalNumberTheory:CN.3/integral-cusp-lattice, tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions.

- **TauCeti.Computational.cuspLBox_contains** (compatibility): The rectangle encloses the native continuation at the rational point.
- **TauCeti.Computational.cuspLBox_width** (other): Both coordinate widths satisfy the requested absolute precision.
- **TauCeti.Computational.cuspLBox_excludes_zero** (other): Excluding zero proves nonvanishing and never an exact vanishing claim.

- Test **TauCeti.Computational.test_cuspL_zero** (degenerate): A zero cusp form has an enclosure containing zero.
- Test **TauCeti.Computational.test_cuspL_precision** (computation): At precision eight both widths are at most 1/256.
- Test **TauCeti.Computational.test_cuspL_no_zero_inference** (non-example): A rational rectangle containing zero also contains a nonzero number.

Acceptance: A zero cusp form has an enclosure containing zero. At precision eight both widths are at most 1/256. A rational rectangle containing zero also contains a nonzero number.

Sources: Arb, §§5–6, pp.7–10.

## CN.5

Concrete mathematical checking is in CN.4 and realises CN.5. Hashes, software pins, data coverage and discovery-versus-verification costs are required handoff metadata. The process-layer removal is a proposal, with accepted CN.5→FF.5/ED.6 links preserved.

## Target coverage and ownership

Every original stage target and all nine routed source items have a target declaration or an explicit native/owner import. This breadth-first pass stops below the 300-node budget under Protocol 0. All stages remain planned, with named proof refinements and supplier gaps; no stage is claimed closed.

- **ComputationalNumberTheory:CN.0: Native integer/rational and algebraic presentations, conversions and comparisons** — ComputationalNumberTheory:CN.0/rational-root-presentation, ComputationalNumberTheory:CN.0/algebraic-root-certificate, ComputationalNumberTheory:CN.0/algebraic-add-certificate, ComputationalNumberTheory:CN.0/algebraic-mul-certificate, ComputationalNumberTheory:CN.0/algebraic-inv-certificate, ComputationalNumberTheory:CN.0/algebraic-equality-check.
- **ComputationalNumberTheory:CN.0: Finite-field presentations and embeddings** — FiniteFieldsAndCharacterSums:FF.0/certified-presentation-of-a-finite-field, FiniteFieldsAndCharacterSums:FF.0/presentation-embedding-from-root, FiniteFieldsAndCharacterSums:FF.0/presentation-change-isomorphism.
- **ComputationalNumberTheory:CN.0: Ideal/lattice coordinates** — ClassicalArithmeticCompletion:CA.3/hermite-normal-form-certificate, ClassicalArithmeticCompletion:CA.3/hermite-basis-of-a-sublattice, ClassicalArithmeticCompletion:CA.3/index-eq-prod-hermite-pivots, ClassicalArithmeticCompletion:CA.3/smith-normal-form-certificate. Use the CN.2 full order basis for the ambient number field; retain CA.3→CN.0 direction.
- **ComputationalNumberTheory:CN.0: Finite p-adic presentations** — ComputationalNumberTheory:CN.0/padic-approximation.
- **ComputationalNumberTheory:CN.0: RAM, bit costs, randomness and precision** — ComputationalNumberTheory:CN.0/ram-machine-model-and-bit-complexity, ComputationalNumberTheory:CN.0/costed-ram-trace, ComputationalNumberTheory:CN.0/costed-trace-upper-bound, ComputationalNumberTheory:CN.0/ram-polynomial-magnitude, ComputationalNumberTheory:CN.1/miller-rabin-independent-rounds, ComputationalNumberTheory:CN.4/padic-mul.
- **ComputationalNumberTheory:CN.1: Pratt/Pocklington certificates and size** — ComputationalNumberTheory:CN.1/pratt-certificate, ComputationalNumberTheory:CN.1/pratt-certificate-checker, ComputationalNumberTheory:CN.1/pratt-certificate-sound, ComputationalNumberTheory:CN.1/pratt-certificate-complete, ComputationalNumberTheory:CN.1/pratt-quadratic-size, ComputationalNumberTheory:CN.1/pocklington-certificate, ComputationalNumberTheory:CN.1/pocklington-certificate-sound.
- **ComputationalNumberTheory:CN.1: Deterministic/probabilistic primality** — ComputationalNumberTheory:CN.1/aks-algorithm, ComputationalNumberTheory:CN.1/aks-deterministic-primality, ComputationalNumberTheory:CN.1/miller-rabin-probabilistic-primality, ComputationalNumberTheory:CN.1/miller-rabin-independent-rounds.
- **ComputationalNumberTheory:CN.1: Integer and rational polynomial factors** — ComputationalNumberTheory:CN.1/integer-factorization-certificate, ComputationalNumberTheory:CN.1/integer-factorization-sound, ComputationalNumberTheory:CN.1/integer-factorization-complete, ComputationalNumberTheory:CN.1/rational-polynomial-factor-certificate, ComputationalNumberTheory:CN.1/certified-rational-factorization.
- **ComputationalNumberTheory:CN.1: Finite-field factorization consumer** — ComputationalNumberTheory:CN.1/polynomial-factorization-over-finite-fields, FiniteFieldsAndCharacterSums:FF.3/certified-factorization-algorithm.
- **ComputationalNumberTheory:CN.2: Orders and certified integral bases** — ComputationalNumberTheory:CN.2/order-basis-certificate, ComputationalNumberTheory:CN.2/p-radical-lattice, ComputationalNumberTheory:CN.2/p-radical-maximality-criterion, ComputationalNumberTheory:CN.2/integral-basis-certificate, ComputationalNumberTheory:CN.2/integral-basis-algorithm.
- **ComputationalNumberTheory:CN.2: Prime decomposition and first-order Newton data** — ComputationalNumberTheory:CN.2/prime-ideal-factor-certificate, ComputationalNumberTheory:CN.2/phi-adic-expansion, ComputationalNumberTheory:CN.2/phi-coefficient-valuation, ComputationalNumberTheory:CN.2/phi-newton-side, ComputationalNumberTheory:CN.2/phi-residual-polynomial, ComputationalNumberTheory:CN.2/ore-residual-irreducibility.
- **ComputationalNumberTheory:CN.2: Class/unit completeness and conditional cost separation** — ComputationalNumberTheory:CN.2/class-relation-lattice, ComputationalNumberTheory:CN.2/class-relation-quotient-cover, ComputationalNumberTheory:CN.2/minkowski-factor-base-generation, ComputationalNumberTheory:CN.2/certified-class-unit-completeness, ComputationalNumberTheory:CN.2/units-complete-of-regulator-bound, ComputationalNumberTheory:CN.2/joint-class-unit-index-certificate.
- **ComputationalNumberTheory:CN.2: Local expansions** — ComputationalNumberTheory:CN.2/local-expansion-certificate, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions.
- **ComputationalNumberTheory:CN.3: Symbols, Hecke matrices, q-expansions and labels** — ComputationalNumberTheory:CN.3/integral-q-expansion-lattice, ComputationalNumberTheory:CN.3/integral-cusp-lattice, ComputationalNumberTheory:CN.3/miller-basis, ComputationalNumberTheory:CN.3/integral-hecke-matrix, ComputationalNumberTheory:CN.3/modular-data-equality, tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields, tauceti:TauCetiRoadmap/ModularForms#layer-9-the-lmfdb-invariant-layer, tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas, tauceti:TauCetiRoadmap/ModularForms#layer-11-the-eichlerselberg-trace-formula-level-one.
- **ComputationalNumberTheory:CN.3: Sturm equality and congruence** — ComputationalNumberTheory:CN.3/level-one-congruence-sturm, ComputationalNumberTheory:CN.3/modular-data-equality, tauceti:TauCeti.ModularForm.eq_of_sturm_bound, AlgebraicModularFormsAndSerreWeights:R15.2.
- **ComputationalNumberTheory:CN.3: Curve point counts, isogenies and descent** — FiniteFieldsAndCharacterSums:FF.3/naive-point-count, FiniteFieldsAndCharacterSums:FF.3/point-count-certificate-sound, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1, tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii, tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4, EffectiveDiophantineMethods:ED.3. The general enumeration includes infinity and accepts any Weierstrass model; identifying the native elliptic point group requires nonsingularity. The fast character-sum certificate is restricted to odd q and a₁=a₃=0. Characteristic two uses the general enumeration. Import the isogeny/dual/differential comparison, intrinsic q+1−trace point count, existing Mordell–Weil and two-descent algorithms, and Selmer/local conditions. ED.3 supplies the new local-image and saturation service. CN.3 does not re-plan any of them; accepted RS-03 supplier edges remain intact.
- **ComputationalNumberTheory:CN.4: Validated real/complex arithmetic and precision** — ComputationalNumberTheory:CN.4/rational-interval-product, ComputationalNumberTheory:CN.4/rational-interval-inverse, ComputationalNumberTheory:CN.4/outward-dyadic-rounding, ComputationalNumberTheory:CN.4/complex-box-denotation, ComputationalNumberTheory:CN.4/unique-integer-in-enclosure.
- **ComputationalNumberTheory:CN.4: p-adic arithmetic and precision** — ComputationalNumberTheory:CN.4/padic-normalization, ComputationalNumberTheory:CN.4/padic-add, ComputationalNumberTheory:CN.4/padic-mul, ComputationalNumberTheory:CN.4/padic-inverse.
- **ComputationalNumberTheory:CN.4: Certified roots** — ComputationalNumberTheory:CN.4/certified-polynomial-root-isolation.
- **ComputationalNumberTheory:CN.4: L-values and imported continuation** — ComputationalNumberTheory:CN.4/dirichlet-l-value-enclosure, ComputationalNumberTheory:CN.4/cusp-l-value-enclosure, mathlib:DirichletCharacter.LFunction, mathlib:ModularForm.L, tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions, AutomorphicLFunctionsAndLocalFactors:AL.1, AnalyticNumberTheory:AN.4. Evaluate the imported continuation. RankZeroOneBSD assembles exact vanishing below r and nonvanishing of the rth derivative; a box containing zero proves neither exact vanishing nor a rank lower bound. No extra BSD-to-CN.4 dependency is needed for this scope.
- **ComputationalNumberTheory:CN.4: CT validated formulas, tails and Gram witnesses** — ComputationalNumberTheory:CN.4/ct-explicit-formula-values, ComputationalNumberTheory:CN.4/ct-scalar-enclosure, ComputationalNumberTheory:CN.4/odlyzko-geometric-tail, ComputationalNumberTheory:CN.4/odlyzko-alternating-tail, ComputationalNumberTheory:CN.4/gram-negativity-certificate, ComputationalNumberTheory:CN.4/effective-ellipsoid-cover, ComputationalNumberTheory:CN.4/multiplicity-gram-lift.
- **ComputationalNumberTheory:CN.5: Finite dataset checks, reproducible inputs and verification cost** — ComputationalNumberTheory:CN.4/check-gram-dataset, ComputationalNumberTheory:CN.4/check-gram-negativity, ComputationalNumberTheory:CN.0/costed-ram-trace. Concrete mathematical checking is in CN.4 and realises CN.5. Hashes, software pins, data coverage and discovery-versus-verification costs are required handoff metadata. The process-layer removal is a proposal, with accepted CN.5→FF.5/ED.6 links preserved.

**Exact finite-field presentations and embeddings**. Use the native field, generator and quotient/evaluation maps; no parallel field carrier. Transport checked factorizations only for nonzero input. Suppliers: FiniteFieldsAndCharacterSums:FF.0/certified-presentation-of-a-finite-field, FiniteFieldsAndCharacterSums:FF.0/presentation-embedding-from-root, FiniteFieldsAndCharacterSums:FF.0/presentation-change-isomorphism.

**Ideal and lattice coordinate presentations**. Use CA.3 matrix and lattice normal forms on the coordinate lattice of the CN.2 order basis. Do not import CA.5 backwards: its certified number-field algorithms consume CN.2. Suppliers: ClassicalArithmeticCompletion:CA.3/hermite-normal-form-certificate, ClassicalArithmeticCompletion:CA.3/hermite-basis-of-a-sublattice, ClassicalArithmeticCompletion:CA.3/index-eq-prod-hermite-pivots, ClassicalArithmeticCompletion:CA.3/smith-normal-form-certificate.

**Modular symbols, orbit labels and trace checks**. The upstream layers own Manin relations, integral Hecke algebras, label invariants, dimensions and trace formulas. CN.3 binds finite data and exact matrices to those objects. General-level/bad-prime presentation comparisons remain refinements, not a new modular-symbol carrier. Suppliers: tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields, tauceti:TauCetiRoadmap/ModularForms#layer-9-the-lmfdb-invariant-layer, tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas, tauceti:TauCetiRoadmap/ModularForms#layer-11-the-eichlerselberg-trace-formula-level-one.

**Point counts**. The general enumeration includes infinity and accepts any Weierstrass model; identifying the native elliptic point group requires nonsingularity. The fast character-sum certificate is restricted to odd q and a₁=a₃=0. Characteristic two uses the general enumeration. Suppliers: FiniteFieldsAndCharacterSums:FF.3/naive-point-count, FiniteFieldsAndCharacterSums:FF.3/point-count-certificate-sound.

**Isogenies, finite-field normalization and descent**. Import the isogeny/dual/differential comparison, intrinsic q+1−trace point count, existing Mordell–Weil and two-descent algorithms, and Selmer/local conditions. ED.3 supplies the new local-image and saturation service. CN.3 does not re-plan any of them; accepted RS-03 supplier edges remain intact. Suppliers: tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1, tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii, tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4, EffectiveDiophantineMethods:ED.3.

**Continuation and exact analytic-rank inputs**. Evaluate the imported continuation. RankZeroOneBSD assembles exact vanishing below r and nonvanishing of the rth derivative; a box containing zero proves neither exact vanishing nor a rank lower bound. No extra BSD-to-CN.4 dependency is needed for this scope. Suppliers: mathlib:DirichletCharacter.LFunction, mathlib:ModularForm.L, tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions, AutomorphicLFunctionsAndLocalFactors:AL.1, AnalyticNumberTheory:AN.4.

## Routed source targets

- PAPER-BENNETT-SIKSEK-20/90 → ComputationalNumberTheory:CN.4/small-conductor-real-zero-exclusion. Source-scoped target with the explicit prerequisite and gap ledger; no formalisation or complete dataset replay is claimed.
- PAPER-BOXER-CALEGARI-GEE-25/weight-26-coefficients → ComputationalNumberTheory:CN.3/weight-26-coefficient-107, ComputationalNumberTheory:CN.3/weight-26-ordinary-107. Source-scoped target with the explicit prerequisite and gap ledger; no formalisation or complete dataset replay is claimed.
- PAPER-BOXER-CALEGARI-GEE-25/companion-weight-82 → ComputationalNumberTheory:CN.3/weight-82-companion-system. Source-scoped target with the explicit prerequisite and gap ledger; no formalisation or complete dataset replay is claimed.
- PAPER-BOXER-CALEGARI-GEE-25/nonordinary-weight-38 → ComputationalNumberTheory:CN.3/weight-38-nonordinary-determinant. Source-scoped target with the explicit prerequisite and gap ledger; no formalisation or complete dataset replay is claimed.
- PAPER-BOXER-CALEGARI-GEE-25/remark-3-3-small-primes → ComputationalNumberTheory:CN.3/smallest-nonordinary-primes, ComputationalNumberTheory:CN.3/nonordinary-list-below-200. Source-scoped target with the explicit prerequisite and gap ledger; no formalisation or complete dataset replay is claimed.
- PAPER-BOXER-CALEGARI-GEE-25/remark-3-3-lists → ComputationalNumberTheory:CN.3/corrected-ordinary-companion-list, ComputationalNumberTheory:CN.3/nonordinary-list-below-200. Source-scoped target with the explicit prerequisite and gap ledger; no formalisation or complete dataset replay is claimed.
- PAPER-CHENEVIER-TAIBI-20/certified-evaluation → ComputationalNumberTheory:CN.4/ct-explicit-formula-values, ComputationalNumberTheory:CN.4/ct-scalar-enclosure. Source-scoped target with the explicit prerequisite and gap ledger; no formalisation or complete dataset replay is claimed.
- PAPER-CHENEVIER-TAIBI-20/fincke-pohst-effective → ComputationalNumberTheory:CN.4/effective-ellipsoid-cover. Source-scoped target with the explicit prerequisite and gap ledger; no formalisation or complete dataset replay is claimed.
- PAPER-CHENEVIER-TAIBI-20/certificates → ComputationalNumberTheory:CN.4/check-gram-dataset, ComputationalNumberTheory:CN.4/multiplicity-gram-lift. Source-scoped target with the explicit prerequisite and gap ledger; no formalisation or complete dataset replay is claimed.

## Requested supplier contracts

- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions**: Reuse the complete discretely valued field, uniformizer, residue-field representatives and their lifting/expansion theorem. CN.2 supplies finite coordinate certificates and verifies the remainder; it does not construct a second local field or valuation. Consumers: ComputationalNumberTheory:CN.2/local-expansion-certificate.
- **AlgebraicModularFormsAndSerreWeights:R15.3**: The mod-p theta operator, Hasse invariant weight change and common-weight comparison needed to turn the complete companion coefficient test into a finite congruence Sturm certificate. Use a_f(ℓ)=ℓ^(k−1)a_g(ℓ), with BCG’s cohomological normalization retained. Consumers: ComputationalNumberTheory:CN.3/weight-82-companion-system.
- **tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields**: Integral Hecke eigensystems, simultaneous eigenform decomposition and lifting a residual eigensystem to a characteristic-zero eigenform with a prime of its coefficient field. The symbol-side lattice is not a lattice inside complex forms; compare via the dual period map with the correct transpose. Consumers: ComputationalNumberTheory:CN.3/nonordinary-level-one-pair, ComputationalNumberTheory:CN.3/weight-82-companion-system.
- **GeometryOfNumbersAndQuadraticArithmetic:GN.5**: Exact Fincke–Pohst enumeration with a completeness theorem: for symmetric positive-definite rational B and rational c≥0, return every integer vector x with xᵀBx≤c. An LLL short-vector output is insufficient. Expose the exact cutoff and allow an enlarged cover whose excess vectors are retained explicitly. Consumers: ComputationalNumberTheory:CN.4/effective-ellipsoid-cover.
- **ClassicalArithmeticCompletion:CA.3**: Generic lower convex hull, supporting-line and slope ordering contracts. The φ-adic coefficient conversion and residual-polynomial arithmetic are CN.2; geometric negative slopes must be negated when comparing with positive root valuations. Consumers: ComputationalNumberTheory:CN.2/phi-newton-side.
- **tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions**: Use the existing functional equation with its actual Fricke sign, weight, level, character and coefficient embedding. Supply the normalization comparison for smoothed numerical evaluation; the native entire continuation is already built. Consumers: ComputationalNumberTheory:CN.4/cusp-l-value-enclosure.
- **tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields**: Supply the native modular-symbol module and integral Hecke algebra, the finite Manin presentation at specified level and weight, and its period-dual comparison with forms. Retain torsion and transpose conventions. CN.3 computes matrices and binds finite coefficient arrays to these intrinsic objects. Consumers: ComputationalNumberTheory:CN.3/modular-data-equality, ComputationalNumberTheory:CN.3/integral-hecke-matrix.
- **tauceti:TauCetiRoadmap/ModularForms#layer-9-the-lmfdb-invariant-layer**: Supply orbit-label invariants and their exact identification with an intrinsic newform, its coefficient field and chosen embedding. A database label alone never supplies the coefficient binding used by the equality checker. Consumers: ComputationalNumberTheory:CN.3/modular-data-equality.
- **tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas**: Supply the exact congruence subgroup, cusp widths, index and dimension conventions of the requested modular-form space. Use the built Sturm equality theorem with these actual parameters. Consumers: ComputationalNumberTheory:CN.3/modular-data-equality.
- **AlgebraicModularFormsAndSerreWeights:R15.2**: Supply integral models, bounded denominators and the q-expansion principle at all required cusps for the general congruence-subgroup version of the congruence Sturm test. Characteristic-zero Sturm equality is a distinct native import. Consumers: ComputationalNumberTheory:CN.3/level-one-congruence-sturm.
- **tauceti:TauCetiRoadmap/ModularForms#layer-11-the-eichlerselberg-trace-formula-level-one**: The upstream layers own Manin relations, integral Hecke algebras, label invariants, dimensions and trace formulas. CN.3 binds finite data and exact matrices to those objects. General-level/bad-prime presentation comparisons remain refinements, not a new modular-symbol carrier. Consumers: ComputationalNumberTheory:CN.3.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv**: Import the isogeny/dual/differential comparison, intrinsic q+1−trace point count, existing Mordell–Weil and two-descent algorithms, and Selmer/local conditions. ED.3 supplies the new local-image and saturation service. CN.3 does not re-plan any of them; accepted RS-03 supplier edges remain intact. Consumers: ComputationalNumberTheory:CN.3.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1**: Import the isogeny/dual/differential comparison, intrinsic q+1−trace point count, existing Mordell–Weil and two-descent algorithms, and Selmer/local conditions. ED.3 supplies the new local-image and saturation service. CN.3 does not re-plan any of them; accepted RS-03 supplier edges remain intact. Consumers: ComputationalNumberTheory:CN.3.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii**: Import the isogeny/dual/differential comparison, intrinsic q+1−trace point count, existing Mordell–Weil and two-descent algorithms, and Selmer/local conditions. ED.3 supplies the new local-image and saturation service. CN.3 does not re-plan any of them; accepted RS-03 supplier edges remain intact. Consumers: ComputationalNumberTheory:CN.3.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4**: Import the isogeny/dual/differential comparison, intrinsic q+1−trace point count, existing Mordell–Weil and two-descent algorithms, and Selmer/local conditions. ED.3 supplies the new local-image and saturation service. CN.3 does not re-plan any of them; accepted RS-03 supplier edges remain intact. Consumers: ComputationalNumberTheory:CN.3.
- **EffectiveDiophantineMethods:ED.3**: Import the isogeny/dual/differential comparison, intrinsic q+1−trace point count, existing Mordell–Weil and two-descent algorithms, and Selmer/local conditions. ED.3 supplies the new local-image and saturation service. CN.3 does not re-plan any of them; accepted RS-03 supplier edges remain intact. Consumers: ComputationalNumberTheory:CN.3.
- **AutomorphicLFunctionsAndLocalFactors:AL.1**: Evaluate the imported continuation. RankZeroOneBSD assembles exact vanishing below r and nonvanishing of the rth derivative; a box containing zero proves neither exact vanishing nor a rank lower bound. No extra BSD-to-CN.4 dependency is needed for this scope. Consumers: ComputationalNumberTheory:CN.4.
- **AnalyticNumberTheory:AN.4**: Evaluate the imported continuation. RankZeroOneBSD assembles exact vanishing below r and nonvanishing of the rth derivative; a box containing zero proves neither exact vanishing nor a rank lower bound. No extra BSD-to-CN.4 dependency is needed for this scope. Consumers: ComputationalNumberTheory:CN.4.

## Open mathematical inputs

- **Exact presentation and model refinements**: The exact carriers and presentation targets are present. Refine certified root-count/separation and algebraic equality discovery, generic presentation-change costs, the digit-array encoding and uniform RAM-to-bit simulation. CA.3 and FF.0 supply the specialized lattice and field presentations in importedTargets.
- **Effective algebraic root verification and arithmetic**: Split finite rational rectangle root-count certificates, root separation, resultant elimination and refinement into exact declarations with a freely readable source and terminating algorithms. Current existence targets and semantic isolation data do not establish a computable equality test or arithmetic cost. Equality of overlapping boxes is not certified without a common-root argument.
- **Strong-liar counting lemmas**: Split the cyclic prime-power kernel count, the CRT two-fibre estimate, and the deduction that a Carmichael number has at least three prime divisors from the native Korselt theorem. These are nonroutine named inputs in Shoup’s proof, not library claims.
- **AKS quotient-algebra proof and costs**: Decompose Shoup Lemmas 21.6–21.11: substitution automorphisms on F_p[X]/(X^r−1), multiplicative congruence sets, evaluation at a primitive rth root, image size at most n^(2 floor√t), and size at least 2^min(t,ℓ)−1. Also give the r=O(len(n)^5) lemma and the source RAM O(len(n)^16.5) accounting. The RAM exponent is not a proved identical bit-complexity exponent.
- **Remaining factorization and certificate costs**: The integer and rational factor certificates, finite Pocklington data, FF.3 consumer and quadratic Pratt size target are present. Refine the tree-to-self-delimiting encoding and charged verifier, integer discovery complexity under explicit assumptions, rational recombination termination and Shoup’s precise RAM exponent; no bit exponent is inferred from unit-cost instructions.
- **Rational factorization discovery and finite irreducibility evidence**: Give the integer content/primitive-part bridge to ℚ, coefficient bounds, square-free reduction, modular factor selection, exact FF.3 Hensel lifts, bounded recombination and termination. A rational irreducible polynomial need not have an irreducible reduction at any prime; the certificate factory cannot assume that. No full freely readable proof has yet been decomposed. Existing certified rational outputs remain sound because actual irreducibility proofs are required.
- **Finite-dimensional nilpotence bound**: Locate the exact pinned theorem or add the separate multiplication-operator nilpotence lemma proving x^dim(A)=0 for nilpotent x. The currently read Frobenius construction does not itself prove this dimension bound.
- **Remaining number-field certificate targets**: The order/integral-basis, prime decomposition, relation quotient, torsion-aware unit/class stopping and local expansion targets are present. Refine finite class/unit discovery, exact log/regulator enclosures and analytic class-number stopping bounds; any GRH-based speedup belongs in its cost theorem and never weakens unconditional product/index checks.
- **Multiplier criterion intrinsic lemmas**: Split the p-primary saturation, finite-index bound, integrality of the multiplier ring, containment in (1/p)R, and the radical-extension/intersection step in Proposition 9.3. Check the source’s direction of the sentence about high radical powers against ideal nilpotence; the required implication is eventual containment in a sufficiently high p-power, not an unjustified reversed inclusion.
- **Integral-basis algorithm termination and exact linear algebra**: Promote strict p-index descent, discriminant-index square identity in these coordinates, certified prime coverage, quotient basis construction and termination to individual lemmas. The construction signature specifies a total output but its admitted prototype is not an executable implementation. The integer factorization cost remains separate.
- **Prime-ideal discovery at index divisors**: Refine the reduced quotient algebra decomposition into primitive idempotents, finite-field quotient maps, lifted prime ideals, ramification exponents and the product reconstruction. The ordinary Kummer–Dedekind theorem requires p prime to the power-basis index; the certificate deliberately does not infer that condition from a factorization of the defining polynomial.
- **Effective class/unit discovery and analytic stopping**: Split ideal factor-base enumeration, principal relation witnesses, HNF/SNF quotient order and unit extraction from the integer kernel. Decompose a rigorous residue/Euler-product tail bound for hR and directed regulator determinant enclosures. Discovery may be heuristic but returned completeness must be unconditional unless an explicit GRH assumption is attached. Existing rank-one upstream certificates do not supply this general-rank algorithm.
- **Higher-order Newton and residual factorization targets**: Finite φ-side and residual-polynomial data and the exponent-one Ore criterion are now explicit. Refine the square-free residual factor assembly and native ramification comparison. Repeated residual factors cannot be declared prime; use higher-order refinement or the separately specified maximal-order algorithm.
- **Finite local-expansion factory and presentation comparison**: Instantiate the imported uniformizer/residue-section theorem on each certified completion and finite residue-field presentation, then implement digit extraction with its termination and remainder proof. Add change-of-uniformizer and embedding comparisons. The present certificate type alone is not an extraction algorithm and does not impose canonical digits without a section.
- **Miller basis proof refinements**: Promote normalized E₄/E₆ and Δ coefficient integrality, the exact dimension-compatible monomial family, its leading q powers, and integral unitriangular elimination to prerequisite lemmas. The full modular lattice needs an Eisenstein generator with the correct denominator normalization; a cusp basis does not supply it.
- **Full-level modular lattice congruence proof**: The source proof and corrected signs have been read, but its integral polynomial-in-j lemma and the full modular integral basis must be split before the level-one congruence proof closes. General congruence subgroups also require the algebraic q-expansion principle, bounded denominators and cusp rationality from their owner.
- **Remaining modular and curve targets**: The integral lattices, matrix and finite-data adapters, BCG examples and exact owner imports are present. Refine general level/character and bad-prime matrices, integral Manin-presentation comparisons, norm-based congruence Sturm proofs and the complete simultaneous-eigensystem certificates. Native characteristic-zero Sturm equality is already available.
- **BCG companion and corrected ordinary-list completion**: The weight-82 common-eigenvector and corrected ordinary-list targets are present. Supply finite theta/Sturm certificates and lifts to characteristic-zero eigenforms for every listed common eigensystem. At p=151 the weights 52 and 100 fail the gcd condition. BCG’s cohomological normalization gives a_g(ℓ)=ℓ^81 a_f(ℓ) at p=107,k=26. Complete datasets have not been replayed here.
- **Full validated-numerics target inventory**: Real interval multiplication/inversion and rounding, complex boxes, p-adic propagation, polynomial roots, Dirichlet and cusp L evaluation, CT formulas/tails/Gram checks, and Platt targets are present. Refine terminating special-function enclosures, exact root counts, all analytic truncation constants and complete source datasets. CN.4 exports nonvanishing; exact rank assembly is owned by RankZeroOneBSD.
- **CT analytic formula and evaluator refinements**: Import the intrinsic F/G test functions, K∞, J_F and Fourier conventions from the proposed LevelOneAutomorphicFormsForClassicalGroups owner routed by PAPER-CHENEVIER-TAIBI-20; it has no atlas stage to cite yet. Split the comparison with the eight numerical right-hand sides, weighted alternating remainder, certified elementary and digamma/trigamma evaluators, argument reduction and precision-increasing termination. The numerical G formulas hold without GRH; their automorphic positivity application requires GRH. Only the French public CL Proposition 3.17 and comments pp.304–307 were read, not the English published Proposition 9.3.18.
- **Polynomial root-isolation proof**: Acquire and decompose an exact complex root-count method, rational rectangle subdivision, root separation and termination. The output contracts are explicit but no root-count algorithm or proof has yet been read in full. For real-valued analytic functions, sign-change enclosures additionally require continuity; uniqueness requires monotonicity or a derivative condition.
- **Platt analytic and data certification**: Read and split the complete Euler–Maclaurin/FFT evaluation, error bounds, sampling and upsampling, real completed-function normalization, Turing count and primitive-character enumeration. Recover and verify the actual full finite datasets or regenerate certificates. This pass read the result and selected sampling/error passages only; it does not claim the 400000-modulus computation or the two-million central checks have been formalized or replayed.
- **CT dataset admissibility and complete replay**: Bind every row to exact infinity types, positive multiplicities and δ∈{0,1}; prove ε(U_iU_j) is real whenever δ_iδ_j=1. Apply the explicit multiplicity Gram lift with diagonal A/m_i and weights t_i/m_i. Verify every required list and distinguish the 12293 cover rows from the smaller exact cut. Inherited counts/sample evaluations are not a fresh full replay; δ=2 is never silently accepted.
- **First-order Newton factorization refinements**: Prove admissible-development invariance and the product theorem; separate the polygon factorization theorem from residual factorization. Add the explicit square-free residual assembly and compare each factor’s e and residue degree with the native local-extension invariants. The integer presentation suffices for the current global number-field inputs; general finite local base fields use the same construction after the owner’s valuation-ring bridge. Repeated residual factors require further refinement or the independent maximal-order algorithm, never a first-order separability assertion.
- **Effective modular L evaluation**: Split the smoothed functional-equation identity, effective coefficient-growth constant, incomplete-gamma enclosure and truncation bound. General level requires the correct cusp width and Fricke image, with nebentypus, bad-prime and embedding conventions supplied by the owner. Exact lower derivatives and analytic rank are assembled in RankZeroOneBSD, not inferred from a box containing zero.
- **Supplier-stage and forwarding bindings**: Requests for imported-only targets identify the owning stage and exact contract but do not by themselves add a drawn atlas edge. Preserve the existing accepted RS-03/RS-06/RS-07 links. The new MF.11 trace import and CN.4→CM.5 rounding supply need explicit maintainer graph binding if no node-level consumer edge draws them; this pass does not edit foreign packets or generated data.

## Native baseline

- **mathlib:NonemptyInterval** (Mathlib/Order/Interval/Basic.lean): Closed nonempty intervals represented by ordered endpoints; use ℚ directly.
- **mathlib:lucas_primality** (Mathlib/NumberTheory/LucasPrimality.lean): Lucas criterion in ZMod n with a full prime-divisor test for n−1.
- **mathlib:reverse_lucas_primality** (Mathlib/NumberTheory/LucasPrimality.lean): Every prime admits a witness satisfying the full Lucas criterion.
- **mathlib:Nat.primeFactorsList** (Mathlib/Data/Nat/Factors.lean): The executable sorted prime factor list, empty at 0 and 1.
- **mathlib:Nat.prod_primeFactorsList** (Mathlib/Data/Nat/Factors.lean): For n≠0 the product of the prime factor list is n.
- **mathlib:Nat.prime_of_mem_primeFactorsList** (Mathlib/Data/Nat/Factors.lean): Every member of the prime factor list is prime.
- **mathlib:NumberField.Units.regOfFamily_div_regulator** (Mathlib/NumberTheory/NumberField/Units/Regulator.lean): The regulator ratio equals the index of the subgroup generated by the proposed units together with all torsion units. Infinite index is represented by zero.
- **mathlib:PadicInt.toZModPow** (Mathlib/NumberTheory/Padics/RingHoms.lean): The ring homomorphism ℤ_p→ZMod(p^n), with underlying approximation function.
- **mathlib:algebraicClosure** (Mathlib/FieldTheory/AlgebraicClosure.lean): The relative algebraic closure as a native intermediate field; use algebraicClosure ℚ ℂ as the exact complex algebraic-number carrier.
- **mathlib:mem_algebraicClosure_iff** (Mathlib/FieldTheory/AlgebraicClosure.lean): Membership is existence of a nonzero rational polynomial annihilating the element.
- **mathlib:padicValRat** (Mathlib/NumberTheory/Padics/PadicVal/Basic.lean): Rational p-adic valuation; its value at zero is the library default zero, so precision routines must branch at zero.
- **mathlib:Ideal.radical** (Mathlib/RingTheory/Ideal/Operations.lean): Ideal radical, defined by existence of a power in the ideal.
- **mathlib:FiniteField.frobeniusAlgHom** (Mathlib/FieldTheory/Finite/Basic.lean): The algebra endomorphism x↦x^q on every commutative algebra over a finite field of q elements, including nonreduced finite algebras.
- **mathlib:NumberField.classNumber** (Mathlib/NumberTheory/NumberField/ClassNumber.lean): The finite cardinality of the native ideal class group.
- **mathlib:NumberField.exists_ideal_in_class_of_norm_le** (Mathlib/NumberTheory/NumberField/ClassNumber.lean): Every class has a nonzero integral ideal representative satisfying the explicit Minkowski bound.
- **mathlib:ClassGroup.mk0** (Mathlib/RingTheory/ClassGroup/Basic.lean): Multiplicative map from nonzero integral ideals to their native ideal classes.
- **mathlib:ModularForm.dimension_level_one** (Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean): Dimension of level-one modular forms of even natural weight; the k≡2 mod12 branch is retained.
- **mathlib:ModularForm.sturm_bound_levelOne_nat** (Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean): A natural-weight level-one modular form with q-order greater than floor(k/12) is zero.
- **tauceti:HeckeRing.GL2.qExpansion_coeff_heckeSlashGamma1CuspFormEnd_diagCosetGamma1_of_mem_cuspFormCharSpace** (TauCeti/NumberTheory/ModularForms/HeckeSlash/Recurrence.lean): Good-prime coefficient recurrence with nebentypus; requires prime p, coprime(p,N), and membership in the specified character space. Level-one specialization has trivial character.
- **mathlib:Complex.digamma** (Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean): Native logarithmic derivative of Γ. Its totalized value at zero is zero; numerical algorithms avoid the pole set.
- **mathlib:Complex.digamma_apply_add_nat** (Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean): Shift ψ(s+n)=ψ(s)+Σ(s+j)⁻¹ away from nonpositive integers.
- **mathlib:DirichletCharacter.LFunction** (Mathlib/NumberTheory/LSeries/DirichletContinuation.lean): The meromorphic continuation of a Dirichlet L-function; the raw totalized Dirichlet series is not used outside Re(s)>1.
- **mathlib:DirichletCharacter.IsPrimitive** (Mathlib/NumberTheory/DirichletCharacter/Basic.lean): The character conductor equals its modulus.
- **mathlib:ModularForm.L** (Mathlib/NumberTheory/ModularForms/LFunction.lean): The continued modular L-function, defined from the completed Mellin transform; positive weight and arithmetic subgroup are parameters.
- **mathlib:ModularForm.Λ** (Mathlib/NumberTheory/ModularForms/LFunction.lean): Completed L-function from the native weak functional-equation pair, for positive weight and arithmetic subgroup.
- **mathlib:CuspForm.differentiable_Λ** (Mathlib/NumberTheory/ModularForms/LFunction.lean): The completed L-function of a positive-weight cusp form on an arithmetic subgroup is entire.
- **mathlib:CuspForm.differentiable_L** (Mathlib/NumberTheory/ModularForms/LFunction.lean): The uncompleted continuation is entire for a positive-weight cusp form.
- **tauceti:CuspForm.hasEntireExtension_qExpansion_coeff** (TauCeti/NumberTheory/ModularForms/LFunction.lean): For a positive-weight cusp form on an arithmetic subgroup, the coefficient Dirichlet series has entire extension width^(−s)·L(s); agreement requires Re(s)>k/2+1.
- **tauceti:TauCeti.ModularForm.eq_of_sturm_bound** (TauCeti/NumberTheory/ModularForms/SturmBound.lean): Equal weight, finite relative index, discrete strict periods and coefficients through (k·relativeIndex).toNat/12 imply equality; uses the actual strict cusp width.
- **mathlib:AdjoinRoot** (Mathlib/RingTheory/AdjoinRoot.lean): The native quotient R[X]/(f), reused for the residual coefficient field.
- **mathlib:AdjoinRoot.mk** (Mathlib/RingTheory/AdjoinRoot.lean): Canonical polynomial-to-root-quotient ring homomorphism.

## Source versions and reading

- **Shoup**: Victor Shoup, A Computational Introduction to Number Theory and Algebra, Version 2. https://shoup.net/ntb/ntb-v2.pdf. SHA-256 8e1abc54f4510c3f274dfbed07ea602a6a439ee24b2c916e61abe829b402ec06. Read: PDF pages 71, 72, 73, 90, 325, 326, 327, 328, 329, 330, 457, 458, 459, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576.
- **Stein**: William Stein, Modular Forms: A Computational Approach, Author PDF. https://wstein.org/books/modform/stein-modform.pdf. SHA-256 b50e81d48d2fb794948414fee625d1d3ca19c191a87430ca38c8713c8f466b75. Read: PDF pages 33, 34, 35, 185, 186, 187.
- **Arb**: Fredrik Johansson, Arb: efficient arbitrary-precision midpoint-radius interval arithmetic, arXiv:1611.02831v1. https://arxiv.org/pdf/1611.02831. SHA-256 44802d5cce02bf91a3d155870b8f315f2955866e283bfb48f6776a07f35f6ebf. Read: PDF pages 1, 4, 5, 6, 7, 8.
- **CT**: Gaëtan Chenevier, Olivier Taïbi, Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms, Publ. Math. IHÉS 131 (2020), 261–323. https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf. SHA-256 ea90fb0faabeaaa56be15f2c6f9c22450e7891c2181130fd79fe356cd83ba3de. Read: PDF pages 21, 22, 23, 24, 35, 36, 37, 38, 39, 40, 41.
- **BCG**: George Boxer, Frank Calegari, Toby Gee, Cuspidal cohomology classes for GL_n(Z), JAMS 38 (2025), 509–520. https://math.uchicago.edu/~fcale/papers/WeightZero.pdf. SHA-256 4d27afabbef371babf3a73dad19bc8ccee180636be27bd6ebee17f58f7150290. Read: PDF pages 7, 10, 11.
- **NumberRings**: Peter Stevenhagen, The arithmetic of number rings, MSRI 44 (2008), pp.209–266. https://library.slmath.org/books/Book44/files/08psh.pdf. SHA-256 040ebae8ee54439c0e10480d2302c46c1ad465616dfbe2b68e449507c3a1bf17. Read: PDF pages 24, 25, 26, 27, 36, 37, 38, 39, 40, 41, 42, 43, 44.
- **GMN**: Jordi Guàrdia, Jesús Montes, Enric Nart, Newton polygons of higher order in algebraic number theory, arXiv:0807.2620v2. https://arxiv.org/pdf/0807.2620. SHA-256 62b8f28d1839dbaac425ac17088b08070bf531aee9ffedae0bc80a1cb109d8ad. Read: PDF pp.1–15, including Corollary 1.20 proof and first-order types; only first-order targets claimed, no full higher-order proof reading..
- **CarusoPublished**: Xavier Caruso, Computations with p-adic numbers, Les cours du CIRM 5 (2017), no.1, II. https://www.numdam.org/item/10.5802/ccirm.25.pdf. SHA-256 c6124267c5457166cb08b0baf645dfff37a4bcf838f13cb27ad1182dfe6fd0d0. Read: PDF pages 18, 19, 20.
- **BennettSiksek**: Michael Bennett, Samir Siksek, A conjecture of Erdős, supersingular primes and short character sums, Annals of Mathematics 191 (2020), 355–392. https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf. SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf. Read: PDF pages 21, 22.
- **Thery**: Laurent Théry, Primality Tests and Prime Certificate, arXiv:2203.16341. https://arxiv.org/pdf/2203.16341. SHA-256 f2cae5e07052046fddc01a9f94437e9df3bcbfcbba6fbea4d2a8578bf11bd0b7. Read: PDF pages 9, 10.
- **Platt**: David Platt, Numerical computations concerning the GRH, arXiv:1305.3087, 15-page preprint. https://arxiv.org/pdf/1305.3087. SHA-256 8fd109aa21345bc3feac4fde2faa7dfb51b4ef1fc9a430f643323612a39ef417. Read: PDF pages 11, 14, 15.
- **PrattNotes**: Vašek Chvátal, Pratt’s primality proofs, Author lecture notes, 5 pages. https://users.encs.concordia.ca/~chvatal/notes/ppp.pdf. SHA-256 8eede94ec34bafd64d3fd6a882130b6cd30655800f28504e4d90919ab1f4fd85. Read: PDF pages 1, 2, 3, 4, 5.
- **CL**: Gaëtan Chenevier and Jean Lannes, Formes automorphes et voisins de Kneser des réseaux de Niemeier, arXiv:1409.7616, French 461-page preprint. https://arxiv.org/pdf/1409.7616. SHA-256 ee20dcf191d37290a74c79c4b15d9fbfe5c2b3673bd6c53283ff44d19762708d. Read: PDF pages 308, 309, 310, 311, 312.

## Source corrections

**ComputationalNumberTheory/E1** (Stein, Lemma 9.17 proof, p.171, author PDF). Take α=a_(−n)(g), conclude g=αj^n+h, and include m=0 in the induction claim. j^n has leading q power q^(−n); h is defined as g−αj^n. The constant term must also remain in the ideal. Status: new Search: Author PDF at https://wstein.org/books/modform/stein-modform.pdf, hash recorded; visual check of PDF p.185. Author HTML newforms.html retains the discriminant sign. Author directory and README; errata.html was not reachable. Targeted search for Lemmas 9.17–9.18 errata found no correction. No claim to have checked a different print edition.

**ComputationalNumberTheory/E2** (Stein, Theorem 9.18 proof, p.171, author PDF). The second coefficient is −24. The product q∏(1−q^n)^24 has coefficient −24 at q²; the sign does not affect the order argument. Status: new Search: Author PDF at https://wstein.org/books/modform/stein-modform.pdf, hash recorded; visual check of PDF p.185. Author HTML newforms.html retains the discriminant sign. Author directory and README; errata.html was not reachable. Targeted search for Lemmas 9.17–9.18 errata found no correction. No claim to have checked a different print edition.

**ComputationalNumberTheory/E3** (Stein, Theorem 9.18 proof, p.172, author PDF). Conclude f≡0 modulo the prime ideal. Infinite order after reduction says all coefficients vanish modulo the prime ideal, not that the original complex form is identically zero. Status: new Search: Author PDF at https://wstein.org/books/modform/stein-modform.pdf, hash recorded; visual check of PDF p.185. Author HTML newforms.html retains the discriminant sign. Author directory and README; errata.html was not reachable. Targeted search for Lemmas 9.17–9.18 errata found no correction. No claim to have checked a different print edition.

**ComputationalNumberTheory/E4** (NumberRings, §12, p.248, published MSRI 44 PDF). The T-unit group has finite torsion μ(K); its quotient by μ(K) is free of that rank. Already K=ℚ has the nontrivial torsion unit −1. The following examples explicitly contain a factor generated by −1. Status: new Search: Published MSRI 44 PDF https://library.slmath.org/books/Book44/files/08psh.pdf freshly fetched with the same hash and p.248 visually checked. Stevenhagen proceedings page and targeted author-site errata searches; no correction located. The separate lecture notes ant.pdf were not collated.

**ComputationalNumberTheory/E5** (NumberRings, §12, p.248, last display, published MSRI 44 PDF). Use [log(O_K^*):log(U)] or [O_K^*:U·μ(K)]. A claim that U is the entire unit group requires μ(K)⊆U. L[U] is an additive logarithmic lattice, not a subgroup of the multiplicative unit group. Logarithms kill all roots of unity. The pinned regulator theorem includes torsion. Status: new Search: Published MSRI 44 PDF https://library.slmath.org/books/Book44/files/08psh.pdf freshly fetched with the same hash and p.248 visually checked. Stevenhagen proceedings page and targeted author-site errata searches; no correction located. The separate lecture notes ant.pdf were not collated.

**ComputationalNumberTheory/E6** (CarusoPublished, Proof of Proposition 2.1.3, printed II–19, published PDF p.20). Use hh′∈p^(N+N′)ℤ_p⊆p^(v+N′)ℤ_p since N≥v. The printed divisibility by p^(v+v′) does not imply divisibility by p^(v+N′). The stronger bound follows directly from the input errors h and h′. Status: new Search: Published CIRM DOI 10.5802/ccirm.25 PDF, visual PDF p.20. arXiv:1701.06794 and the freshly downloaded author course-padic.pdf, p.21, retain both slips. Author publication page and targeted errata search; no correction located.

**ComputationalNumberTheory/E7** (CarusoPublished, Proof of Proposition 2.1.3, inverse step, printed II–19). Replace N by N′ throughout this inverse-factorization line and its involution calculation. The radius of I′ is p^(−N′), so dividing its error by a′ yields exponent N′−v′. Status: new Search: Published CIRM DOI 10.5802/ccirm.25 PDF, visual PDF p.20. arXiv:1701.06794 and the freshly downloaded author course-padic.pdf, p.21, retain both slips. Author publication page and targeted errata search; no correction located.

**ComputationalNumberTheory/E8** (Thery, Theorem 6.2, p.9, arXiv preprint). Require N>1 and F₁²>N (equivalently F₁>√N), with F₁∣N−1 and the stated witnesses. The proof uses √N<F₁; F₁>N is impossible together with F₁∣N−1 for N>1 and makes the stated criterion vacuous. Status: new Search: arXiv:2203.16341 current PDF, p.9 visually checked. HAL record/preview and targeted title/author errata searches. The HAL preview was browser-blocked; no published version or correction located. These findings are scoped to the read preprint.

**ComputationalNumberTheory/E9** (Thery, Definition 6.1, p.9, arXiv preprint). The Fermat number is F_p=2^(2^p)+1. The proof on p.10 uses F₁=2^(2^p) dividing F_p−1, which requires the plus sign. Status: new Search: arXiv:2203.16341 current PDF, p.9 visually checked. HAL record/preview and targeted title/author errata searches. The HAL preview was browser-blocked; no published version or correction located. These findings are scoped to the read preprint.

**ComputationalNumberTheory/E10** (Thery, Theorem 6.4, p.10, arXiv preprint). The exponent uses the candidate p, namely (p−1)/2. The statement defines p=h·2^k+1, while n has no binding in the statement. Status: new Search: arXiv:2203.16341 current PDF, p.9 visually checked. HAL record/preview and targeted title/author errata searches. The HAL preview was browser-blocked; no published version or correction located. These findings are scoped to the read preprint.

**ComputationalNumberTheory/E11** (BCG, Remark 3.3, p. 518 (published; the same list is in arXiv v2 and v3, and arXiv v1 §3.1 has it as 'companion forms also exist for p = 139, 151, 173, 179, . . . in weights k with (p − 1, k − 1) = 1')). p = 107, 139, 173, 179, 191, 193, . . . (remove 151). For an ordinary f the shape ρ̄_f|G_{Q_p} ≅ ψ̄ ⊕ ψ̄^{−1}ε̄^{1−k} determines k mod p − 1 up to replacing k by p + 1 − k (the companion), and gcd(p − 1, k − 1) = gcd(p − 1, p − k) is the same for both. At p = 151 the only ordinary level-one eigensystems with ρ̄_f|G_{Q_p} semisimple are the companion pair in weights 52 and 100 ([CG13] table: 151, C[52]). This was confirmed by matching the characteristic polynomials of T_2 and T_3 on S_52 and on S_100 (twisted by ℓ^{99}) mod 151; no other pair (k, 152 − k) with 12 ≤ k < 76 matches, and the self-pair k = 76 = (p+1)/2 has (150, 75) ≠ 1. Since (150, 51) = (150, 99) = 3, hypothesis (2) of Theorem 2.1 fails at 151. (Theorem 3.1 does apply at 151, through the non-ordinary pair (60, 94).) The same search finds pairs with gcd 1 at 107, 139, 173, 179, 191 and 193. Status: Already recorded and independently confirmed in PAPER-BOXER-CALEGARI-GEE-25/E7 by REV-PAPER-BOXER-CALEGARI-GEE-25; the present worker does not claim to have replayed the supplemental data. Search: arXiv 2309.15944 v1 (27 Sep 2023), v2 (18 Oct 2023) and v3 (12 Sep 2024) the published offprint, J. Amer. Math. Soc. 38 (2025) 509–520 (Calegari's research page) G. Boxer's homepage copy WeightZero.pdf (17 Oct 2024) web search for an erratum or corrigendum (none found) C. Citro, A. Ghitza, arXiv 1102.3321v2, appendix table

**ComputationalNumberTheory/E12** (CT, Section 2.4.2, the paragraph before Corollary 2.9 and Corollary 2.9, pp. 280–281; Section 2.4.5, 'Output', p. 283; the elements x displayed in Section 2.4.6 (Step 3, p. 284) and Section 4.1 (p. 296). Published version; the same in arXiv v1). With β_Q as printed in (2.4.4) (the factor 1/m_i on F̂(i/4π); this is what the authors' code computes), β_Q(ρx, ρy) = β_{Q′}(Dx, Dy) with D = diag(√m_l); μ_Q < 0 ⟺ μ_{Q′} < 0 still holds, but μ_{Q′} = μ_Q does not. The inequality C(x, x) ≤ β_Q(t, t) holds for x = (t_1/m)(π_1 + ⋯ + π_m) + Σ_{i=2}^r (t_i/m_i) Σ_{ϖ ↦ i} ϖ (weights 1/m, not 1/√m); and j runs over 2, …, r. Alternatively, replace (2.4.4) by β_Q(e_i, e_j) = F̂(i/4π) e_i·e_j − √(m_i m_j)(J_F(U_i·U_j) + F̂(0) δ_i δ_j (1 − ε(U_i·U_j))/4), for which the printed statements hold. One block of size 2 (r = 2, r′ = 1, K = J_F(U·U) + its e⊥ term): β_Q = ((A − K, −K), (−K, A − K)) has μ_Q = A − 2K for K > 0, while β_{Q′} = A/2 − K, so μ_Q = 2μ_{Q′}. The worker ported the authors' formulas (without_GRH.gp, testfin.gp), checked the port against seven of their certificate values (six digits), and evaluated the displayed elements. In Section 2.4.6 the printed C-values −0.173, −0.198, −0.147 are exactly β_Q(t, t), that is C(x′, x′) for the weights t_1/2; the displayed x (weights t_1/√2) have C ≈ −0.293, −0.321, −0.251. In Section 4.1 the displayed x (ℓ = 8.75) has C(x, x) ≈ +0.078 > 0 (every root number ε(U·U_j) involved is +1, so no e⊥ term enters): it is not a counterexample to Proposition 2.2. Its t is the least eigenvector of the printed Gram matrix (eigenvalue ≈ −0.0198, which is C(x′, x′)); the printed −0.0023 matches neither value. Every certificate in the paper is a negative value of β_Q as printed, which gives C(x′, x′) < 0 for the corrected x′, so Theorems 3–7, Proposition 4.1 and Lemma 4.3 are unaffected; the false statements are the equality in Corollary 2.9 and the inequality claimed in the Output of Algorithm 2.4.5. Status: Already recorded and independently confirmed in PAPER-CHENEVIER-TAIBI-20/E3 by REV-PAPER-CHENEVIER-TAIBI-20; the present worker does not claim to have replayed the supplemental data. Search: arXiv 1907.08783 (only v1, 20 Jul 2019) the article page and volume 131 on pmihes.centre-mersenne.org (no erratum linked) the paper's companion pages https://otaibi.perso.math.cnrs.fr/levelone/ and http://gaetan.chenevier.perso.math.cnrs.fr/levelone/ with the readme of the data archive (no errata) O. Taïbi's publication list (no erratum) the authors' source code (levelone_src_data/gp/testfin.gp, CFnorminit) for the normalisation used

**ComputationalNumberTheory/E13** (CT, Proof of Theorem 3 and Proposition 4.1, Section 4.1, p. 296 (published version; the same in arXiv v1)). The list the proof runs over has 12293 elements (12106 excluded by a certificate, 187 not). The authors' log log_w23_mult1 records #lw23 = 12293 for liste_qfminim(9.74, 23, 1), and their certificate file db_w23_mult1 has 12293 distinct U (12106 negative values, 187 not). liste_qfminim enlarges the bound to 1.001·F̂(i/4π). Recomputing B_∞(U, U)/F̂(i/4π) for these U with the worker's port of the authors' formulas gives 12217 with ratio ≤ 1, 12230 with ratio ≤ 1.0001 and 12293 with ratio ≤ 1.001: the printed 12230 is the count for a smaller safety margin, inconsistent with the 12293 used later. Both lists contain U_1 as defined, so the proof is unaffected. Status: Already recorded and independently confirmed in PAPER-CHENEVIER-TAIBI-20/E4 by REV-PAPER-CHENEVIER-TAIBI-20; the present worker does not claim to have replayed the supplemental data. Search: arXiv 1907.08783 (only v1, 20 Jul 2019) the article page and volume 131 on pmihes.centre-mersenne.org (no erratum linked) the paper's companion pages https://otaibi.perso.math.cnrs.fr/levelone/ and http://gaetan.chenevier.perso.math.cnrs.fr/levelone/ with the readme of the data archive (no errata) O. Taïbi's publication list (no erratum)

**ComputationalNumberTheory/E14** (CT, Section 4.1, pp. 296–297 (published version; the same in arXiv v1)). U_1 in both places: the 187 unresolved elements are elements of U_1. The run described is over U_1 (δ = m = 1). In the authors' files only 100 of the 187 unresolved U of db_w23_mult1 occur in the U_2 list db_w23_mult2, and the worker's recomputation gives B_∞(U, U) > F̂(i/4π)/2 for 88 of them, so they are not in U_2. Status: Already recorded and independently confirmed in PAPER-CHENEVIER-TAIBI-20/E5 by REV-PAPER-CHENEVIER-TAIBI-20; the present worker does not claim to have replayed the supplemental data. Search: arXiv 1907.08783 (only v1, 20 Jul 2019) the article page and volume 131 on pmihes.centre-mersenne.org (no erratum linked) the paper's companion pages https://otaibi.perso.math.cnrs.fr/levelone/ and http://gaetan.chenevier.perso.math.cnrs.fr/levelone/ with the readme of the data archive (no errata) O. Taïbi's publication list (no erratum)

**ComputationalNumberTheory/E15** (CT, Proof of Theorem 3 and Proposition 4.1, Section 4.1, p. 297; Proposition 4.1(1), p. 295; Section 1.3, p. 266 (published version; the same in arXiv v1)). U_(1) = I_1 + I_7 + I_13 + I_17 + I_21 + 2I_23 is in V: the δ = m = 1 computation does not exclude a self-dual π with L(π_∞) = U_(1). The proof of Proposition 4.1(1) therefore needs a further step: there are no two distinct self-dual π with L(π_∞) = U_(1). Algorithm 2.4.5 with U = U_(1), δ = 1, m = 2 gives this; the worker's floating-point run finds β_Q/F̂(i/4π) ≈ −0.175 at ℓ = 7.75 with S′ = {1, Δ_21, Sym²Δ_11, Δ_{23,7}}, far from 0, to be certified in interval arithmetic. With it, Proposition 4.1 holds as stated (a pair containing one self-dual π is impossible by (b), since π′^∨ would be a third element). The weights of Section 1.3 then number 181 (V itself) and the putative representations at most 182. In the authors' certificate file db_w23_mult1 the entry for U_(1) has the non-negative value +0.036 (ℓ = 6.5), and it is one of the 187 unresolved elements; the 181 elements of V are these 187 minus the six multiplicity-free ones, so U_(1) ∈ V. The GRH worksheet sheet_w23_grh.gp treats U_(1) inside the list of 198 resistant elements, consistent with this. The paper's other use of U_(1) (Theorem 4, under GRH) excludes it altogether and is unaffected. Status: Already recorded and independently confirmed in PAPER-CHENEVIER-TAIBI-20/E6 by REV-PAPER-CHENEVIER-TAIBI-20; the present worker does not claim to have replayed the supplemental data. Search: arXiv 1907.08783 (only v1, 20 Jul 2019) the article page and volume 131 on pmihes.centre-mersenne.org (no erratum linked) the paper's companion pages https://otaibi.perso.math.cnrs.fr/levelone/ and http://gaetan.chenevier.perso.math.cnrs.fr/levelone/ with the readme of the data archive (no errata) O. Taïbi's publication list (no erratum) the authors' data files db_w23_mult1, db_w23_mult2, list_of_resistant_w23_mult1 and the worksheets sheet_w23_mult2.gp and sheet_w23_grh.gp

**ComputationalNumberTheory/E16** (CT, Section 4.1, after Proposition 4.1, p. 295 (published version; the same in arXiv v1)). They all satisfy 10 ≤ dim U ≤ 38. The element B = I_1 + I_9 + I_15 + I_19 + 2I_23 of V, named in the proof of Theorem 4, has dimension 12. In the authors' data the 181 elements of V have dimensions from 10 (e.g. I_5 + I_11 + I_19 + 2I_23) to 38. The printed bounds exceed the true ones by exactly 4, as if each U were counted with two extra coordinates. Status: Already recorded and independently confirmed in PAPER-CHENEVIER-TAIBI-20/E7 by REV-PAPER-CHENEVIER-TAIBI-20; the present worker does not claim to have replayed the supplemental data. Search: arXiv 1907.08783 (only v1, 20 Jul 2019) the article page and volume 131 on pmihes.centre-mersenne.org (no erratum linked) the paper's companion pages https://otaibi.perso.math.cnrs.fr/levelone/ and http://gaetan.chenevier.perso.math.cnrs.fr/levelone/ with the readme of the data archive (no errata) O. Taïbi's publication list (no erratum)

**ComputationalNumberTheory/E17** (CT, Proof of Theorem 4, Section 4.3, p. 299 (published version; the same in arXiv v1)). δ = 0, m = 2 (δ takes values in {0, 1}). The authors' worksheet sheet_w23_grh.gp runs testfin_liste with multiplicity 2 on this U, and their code sets δ = 0 whenever m ≠ 1 (readme). Status: Already recorded and independently confirmed in PAPER-CHENEVIER-TAIBI-20/E8 by REV-PAPER-CHENEVIER-TAIBI-20; the present worker does not claim to have replayed the supplemental data. Search: arXiv 1907.08783 (only v1, 20 Jul 2019) the article page and volume 131 on pmihes.centre-mersenne.org (no erratum linked) the paper's companion pages https://otaibi.perso.math.cnrs.fr/levelone/ and http://gaetan.chenevier.perso.math.cnrs.fr/levelone/ with the readme of the data archive (no errata) O. Taïbi's publication list (no erratum)

**ComputationalNumberTheory/E18** (CT, Proof of Lemma 4.3, Section 4.2, p. 298 (published version; the same in arXiv v1)). 16 elements (15 triples in 𝒮, as Δ¹_23 and Δ²_23 have the same parameter). The elements of Π_alg of motivic weight ≤ 23 and dimension ≤ 4 are 1, Δ_11, Δ_15, Δ_17, Δ_19, Δ_21, Sym²Δ_11, Δ_{19,7}, Δ_{21,5}, Δ_{21,9}, Δ_{21,13}, Δ¹_23, Δ²_23, Δ_{23,7}, Δ_{23,9}, Δ_{23,13}: 16 representations. The worksheet sheet_w24_reg.gp uses pc[1..15], the first 15 pairs [U, m], one of them with m = 2. Elsewhere the paper distinguishes |S| and |𝒮| (footnote 13; |S| = 24, |𝒮| = 23 in Section 4.1). Status: Already recorded and independently confirmed in PAPER-CHENEVIER-TAIBI-20/E10 by REV-PAPER-CHENEVIER-TAIBI-20; the present worker does not claim to have replayed the supplemental data. Search: arXiv 1907.08783 (only v1, 20 Jul 2019) the article page and volume 131 on pmihes.centre-mersenne.org (no erratum linked) the paper's companion pages https://otaibi.perso.math.cnrs.fr/levelone/ and http://gaetan.chenevier.perso.math.cnrs.fr/levelone/ with the readme of the data archive (no errata) O. Taïbi's publication list (no erratum)

**ComputationalNumberTheory/E19** (CT, Section 2.4.3, p. 281 (published version; the same in arXiv v1)). [CL19, (3) p. 277]. Section 4.3 (p. 299) cites the same tail estimates as '[CL19, (3) p. 277]', and the proof of Proposition 4.4 cites pp. 275–276 of [CL19] for the neighbouring formulas. In the book, Chapter 9 ('Proofs of the Main Theorems', containing §9.3 on the explicit formula) is pp. 245–309, while p. 127 lies in Chapter 5 ('Theta Series and Even Unimodular Lattices', pp. 123–144), according to the chapter records at Crossref (doi:10.1007/978-3-319-95891-0_5 and _9). Status: Already recorded and independently confirmed in PAPER-CHENEVIER-TAIBI-20/E11 by REV-PAPER-CHENEVIER-TAIBI-20; the present worker does not claim to have replayed the supplemental data. Search: arXiv 1907.08783 (only v1, 20 Jul 2019) the article page and volume 131 on pmihes.centre-mersenne.org (no erratum linked) the paper's companion pages https://otaibi.perso.math.cnrs.fr/levelone/ and http://gaetan.chenevier.perso.math.cnrs.fr/levelone/ with the readme of the data archive (no errata) O. Taïbi's publication list (no erratum) Crossref chapter records of the book [CL19] (the book itself was not read)

**ComputationalNumberTheory/E20** (NumberRings, Proposition 9.3 proof, published p.235, PDF p.27). Use I_p^d ⊆ pR for sufficiently large d; after multiplying the exponent, I_p^(dr)O_p ⊆ p^r O_p ⊆ R. The nilradical of R/pR is nilpotent, so its high powers vanish in the quotient. This is the required containment direction in the multiplier argument. Status: new Search: Fresh published SLMath PDF is byte-identical to the recorded copy; p.235 visually checked. Targeted author/report/errata search found the Leiden report and course notes, but no correction of this specific sentence. Later course notes were not collated as another edition.

**ComputationalNumberTheory/E21** (Arb, arXiv:1611.02831v1, §5.1, p.7). Replace the second sine by sin(m). With radius zero, t=0 and m=π/2, the printed difference is 1 while its bound is zero. The corrected bound follows from the derivative bound and range of sine. Status: new Search: arXiv v1 p.7 visually checked. Author repository arb.tex at https://github.com/fredrik-johansson/arbpaper retains the same centre typo in the retrieved text (SHA-256 recorded in sourceVersions). No claim about an inaccessible journal PDF.

**ComputationalNumberTheory/E22** (Arb, arXiv:1611.02831v1, §5.1 tangent branches, p.8). The third branch is mid(im(z)) ≤ −1. The stable lower-half-plane branch must complement |mid(im z)|<1 and mid(im z)≥1. This is a partition/stability typo, not a false meromorphic identity. Status: Corrected in the author repository arb.tex inspected in this pass. Search: arXiv v1 p.8 visually checked. The author repository https://github.com/fredrik-johansson/arbpaper has the corrected ≤−1 branch; the downloaded arb.tex SHA-256 is recorded in sourceVersions.

## Upstream and structural notes

- **FiniteFieldsAndCharacterSums:FF.3/factorization-certificate-sound**: The supplier certificate allows scalar zero, while the normalized-factor soundness conclusion needs a nonzero polynomial (or an explicit zero case). The CN.1 transport requires f≠0 and nonzero scalar. No foreign packet is edited.
- **RT-AREA-computational/4 and PAPER-BOXER-CALEGARI-GEE-25/companion-weight-82**: BCG uses cohomological determinant ε^(1−k). In ordinary Hecke coefficients the companion relation is a_f=ℓ^(k−1)a_g, hence a_g=ℓ^(p−k)a_f away from p. The exponent at (107,26) is 81, not 25. Two characteristic-polynomial roots are not a simultaneous companion certificate.
- **ComplexMultiplicationAndExplicitReciprocity:CM.5**: Forward CN.4 validated arithmetic and unique-integer recovery to CM.5. The CM owner retains class-polynomial height/precision, CRT and endomorphism-ring certificates. This requested structural link is not claimed as a drawn edge until the assembled graph confirms it.
- **LevelOneAutomorphicFormsForClassicalGroups**: The new CT design route owns intrinsic K∞, admissibility, Fourier conventions, J_F and automorphic consequences. Its precise stage identifiers are not available in this base. CN.4 provides numerical RHS functions and Gram checks; the intrinsic comparison remains a named gap rather than an invented supplier id.

Every numerical example remains a theorem target. Exact coefficient replays, compiler results and archive recovery evidence are reported in the handoff; none proves an admitted Lean statement.
