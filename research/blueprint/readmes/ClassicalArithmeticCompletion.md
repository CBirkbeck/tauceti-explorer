# Classical arithmetic, sequences, polynomials and reciprocity

This roadmap connects exact arithmetic, recurrence and polynomial methods to classical Diophantine equations, special algebraic numbers and integral Galois modules. Its targets build on the pinned Mathlib and Tau Ceti libraries and on the existing roadmaps named at each target. Proof sketches identify how an implementation would proceed; the suggested file checks planning signatures and examples without claiming an implementation.

The layer order is CA.0 through CA.7. CA.2 supplies companion matrices to CA.3; CA.3 supplies integer matrix certificates to CA.4 and CA.5; CA.4 supplies quadratic norm fibres to CA.5. CA.6 uses existing polynomial Mahler measure, number-field house and heights. CA.7 imports field normal bases, ramification and finite-projective Grothendieck groups rather than rebuilding those theories.

Conventions: gcd is nonnegative; congruence modulo zero is equality. Matrices act on column vectors. Bernoulli numbers use B₁=−1/2. Cartier preservation uses q>0 and residues r<q. The Markoff carrier uses x²+y²+z²=3xyz; scaling by 3 identifies the coefficient-one form over ℤ[1/3], with a separate integral-point comparison. Egyptian denominators form a finite set, so repetitions are excluded. Numerical Frobenius numbers are integers, with F(ℕ)=−1. Completion-based local freeness is used over a nonfield Dedekind domain.

This reader retains all 333 target IDs of the packet. CA.0 has reviewed planning closure. CA.1–CA.7 have the explicit frontiers below: a correct local contract does not close a prerequisite whose proof or owner interface is missing. The packet’s `complete` status records the completed budgeted pass; the independent `needs_changes` review remains in place for its successor.

| Layer | Direction | Targets | Review frontiers |
| --- | --- | ---: | ---: |
| CA.0 | Divisibility and multiplicative arithmetic | 1 | 0 |
| CA.1 | Residues and reciprocity | 34 | 12 |
| CA.2 | Sequences and generating functions | 61 | 20 |
| CA.3 | Polynomial and matrix arithmetic | 41 | 22 |
| CA.4 | Classical Diophantine equations | 77 | 45 |
| CA.5 | Number-field arithmetic handoff | 19 | 16 |
| CA.6 | Special algebraic numbers and Mahler measure | 45 | 32 |
| CA.7 | Integral Galois modules and orders | 55 | 49 |

The [packet](../packets/ClassicalArithmeticCompletion.json) carries the full baseline, ownership requests and source-version ledger. The [suggested Lean file](../suggested/ClassicalArithmeticCompletion.lean) checks available signatures at Mathlib `082e2d3` and Tau Ceti `f790474`. Owner-dependent typed comments are expressly pending interfaces and are not counted as elaborated code. The [revision handoff](../handoff/BP-ClassicalArithmeticCompletion~2.md) records fresh source reads and validation.

## CA.0. Divisibility and multiplicative arithmetic

Import gcd, Bézout, factorisation, valuations, arithmetic functions and the coprime Chinese remainder theorem from the libraries. The remaining target extends the integer CRT to arbitrary moduli, including zero and negative moduli, using compatibility modulo their gcd.

<a id="CA-0-crt-at-non-coprime-moduli-over-the-integers"></a>

### The Chinese remainder theorem at non-coprime moduli, over the integers

`ClassicalArithmeticCompletion:CA.0/crt-at-non-coprime-moduli-over-the-integers` · theorem.

For all integers m, n, a and b, the two congruences x ≡ a (mod m) and x ≡ b (mod n) have a common integer solution x if and only if a ≡ b (mod gcd(m, n)), where gcd(m, n) is the nonnegative greatest common divisor of |m| and |n| and congruence modulo 0 means equality. When a solution x exists, an integer y is a solution exactly when y ≡ x (mod lcm(m, n)); that uniqueness half is the pinned Mathlib theorem Int.modEq_and_modEq_iff_modEq_lcm and is not a new declaration.

Hypotheses and conventions: m, n, a and b are arbitrary integers. No positivity and no coprimality is assumed: the source takes m and n positive, and the statement extends to all integers because congruence depends only on |m| and |n| and congruence modulo 0 is equality. The criterion is congruence modulo the greatest common divisor; the solution set, when nonempty, is one class modulo the least common multiple, never modulo the product.

Further acceptance checks:

- x ≡ 1 (mod 4) and x ≡ 3 (mod 6) are compatible (x = 9), since 1 ≡ 3 (mod 2); x ≡ 0 (mod 4) and x ≡ 1 (mod 6) are not, since 0 and 1 differ modulo 2.
- For coprime moduli the criterion is vacuous and the statement is the classical Chinese remainder theorem, whose ring form is ZMod.chineseRemainder.
- For m = n the criterion is a ≡ b (mod m) and the solution set is one class modulo m.
- On nonnegative data with positive moduli the existence half agrees with Nat.chineseRemainder', which takes exactly the hypothesis a ≡ b (mod gcd n m).

Proof sketch:

1. Necessity: if x solves both congruences then m divides x - a and n divides x - b, and gcd(m, n) divides both, hence divides a - b.
2. Sufficiency: write g = gcd(m, n) = s m + t n by Bézout over the integers (Int.gcd_eq_gcd_ab, the extended Euclidean algorithm Nat.xgcd on |m| and |n|); if a - b = g k then x = a - s m k = b + t n k solves both congruences.
3. The degenerate moduli are routine: for m = 0 the first congruence forces x = a and the criterion reads a ≡ b (mod n); for m = n = 0 both sides say a = b.
4. Agreement with the natural-number form: for nonnegative a, b and positive m, n the solution is Nat.chineseRemainder' applied to the hypothesis a ≡ b (mod gcd); this is recorded as the acceptance comparison and is not needed by the proof above.
5. The uniqueness statement is Int.modEq_and_modEq_iff_modEq_lcm, cited, not reproved.

Direct prerequisites: `mathlib:Int.ModEq`, `mathlib:Int.gcd_eq_gcd_ab`, `mathlib:Nat.xgcd`, `mathlib:Int.modEq_and_modEq_iff_modEq_lcm`, `mathlib:Nat.chineseRemainder'`, `mathlib:Nat.ModEq`.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Exercise 2.18 (printed p. 24, PDF p. 42). The node is this exercise, generalised to all integer moduli (a weakening of the hypotheses that the proof steps justify). The uniqueness modulo the least common multiple is not in the exercise; it is the pinned Int.modEq_and_modEq_iff_modEq_lcm, which the node cites.

### Continuation frontier

No remaining local target is recorded for this layer. Its imported library statements remain baseline inputs.

## CA.1. Residues and reciprocity

Build power-residue comparisons above the existing quadratic symbols and reciprocity. The normalization of finite-field characters comes from FiniteFieldsAndCharacterSums; local and global reciprocity come from ClassFieldTheory and the quadratic-form roadmaps. The new work concerns higher symbols, explicit dyadic comparisons and source-scoped cubic and Eisenstein laws. Quartic and general norm-residue proof inputs remain frontiers.

Landmarks: Units modulo a power of two; Quadratic character of a square class; Power residue symbol; Power reciprocity law; Cubic reciprocity; Eisenstein reciprocity.

<a id="CA-1-unit-group-of-a-power-of-two"></a>

### The unit group modulo a power of two, with explicit generators

`ClassicalArithmeticCompletion:CA.1/unit-group-of-a-power-of-two` · construction.

For every natural number e, write 5_e for the class of 5 in the units (ℤ/2^(e+3))ˣ. There is a group isomorphism unitsTwoPowEquiv e from (ℤ/2^(e+3))ˣ onto the product of a cyclic group of order 2 and a cyclic group of order 2^(e+1), written multiplicatively as Multiplicative (ZMod 2 × ZMod 2^(e+1)), sending -1 to (1, 0) and 5_e to (0, 1). Equivalently: 5_e has order 2^(e+1), -1 does not lie in the cyclic subgroup generated by 5_e, and every unit is uniquely (-1)^s · 5_e^k with s ∈ ℤ/2 and k ∈ ℤ/2^(e+1). The parametrisation by e + 3 encodes the hypothesis that the modulus is at least 8; for the moduli 2 and 4 the unit group is cyclic, which is the pinned ZMod.isCyclic_units_two_pow_iff.

Hypotheses and conventions: The modulus is 2^(e+3), that is at least 8; the moduli 1, 2 and 4 are covered by the pinned cyclicity criterion and are not part of the construction. The generators are the explicit classes of -1 and 5; the construction is about these elements, not only about the isomorphism type.

API:

- `unitsTwoPowFive` (constructor): The unit 5 modulo 2^(e+3), as ZMod.unitOfCoprime 5.
- `unitsTwoPowEquiv` (data): The group isomorphism (ℤ/2^(e+3))ˣ ≃* Multiplicative (ZMod 2 × ZMod 2^(e+1)).
- `unitsTwoPowEquiv_symm_apply` (characterisation): The inverse sends (s, k) to (-1)^s · 5^k, with s and k read through their canonical representatives.
- `unitsTwoPowEquiv_neg_one` (simp): The isomorphism sends -1 to (1, 0).
- `unitsTwoPowEquiv_five` (simp): The isomorphism sends 5 to (0, 1).
- `neg_one_notMem_zpowers_unitsTwoPowFive` (characterisation): -1 does not lie in the subgroup generated by 5.
- `orderOf_unitsTwoPowFive` (compatibility): The unit 5 has order 2^(e+1), the unit-group reading of Mathlib's ZMod.orderOf_five.

Unit tests:

- `unitsTwoPow_test_eight_klein` (computation): Every unit modulo 8 squares to 1.
- `unitsTwoPow_test_sixteen_order_five` (computation): The unit 5 modulo 16 has order 4.
- `unitsTwoPow_test_not_cyclic` (characterisation): For every e the units modulo 2^(e+3) do not form a cyclic group.
- `unitsTwoPow_test_four_cyclic` (degenerate): The units modulo 4 form a cyclic group, which is why the construction starts at modulus 8.
- `unitsTwoPow_test_seven_not_generator` (non-example): The unit 7 modulo 16 has order 2, so 7 cannot replace 5 as generator of the cyclic factor.

Further acceptance checks:

- Modulo 8 every unit squares to 1 (the Klein four group), and modulo 16 the class of 5 has order 4, not 8.
- For every e the group (ℤ/2^(e+3))ˣ is not cyclic, in agreement with ZMod.isCyclic_units_two_pow_iff; the construction supplies what that criterion leaves open.
- The class of 7 modulo 16 has order 2, so a construction that took 7 as the generator of the cyclic factor would be wrong.

Proof sketch:

1. Take the order of 5 from the pinned ZMod.orderOf_five (orderOf (5 : ZMod (2^(n+2))) = 2^n, applied with n = e + 1) and transfer it to the unit 5_e = ZMod.unitOfCoprime 5 through orderOf_units.
2. Show that -1 is not a power of 5_e: every power of 5 is 1 or 5 modulo 8, while -1 is 7 modulo 8 (reduce along ZMod.unitsMap to (ℤ/8)ˣ). The source argues instead that the unique element of order 2 of ⟨5_e⟩ is 5_e^(2^e) ≡ 1 + 2^(e+2), which is not -1; either argument is routine.
3. Hence ⟨-1⟩ ∩ ⟨5_e⟩ is trivial, so (s, k) ↦ (-1)^s · 5_e^k is an injective homomorphism from ℤ/2 × ℤ/2^(e+1) into the units; the two sides have 2^(e+2) = φ(2^(e+3)) elements (ZMod.card_units_eq_totient), so it is bijective. Its inverse is unitsTwoPowEquiv e.
4. Record the two evaluations -1 ↦ (1, 0) and 5_e ↦ (0, 1), which characterise the isomorphism since the two elements generate.

Direct prerequisites: `mathlib:ZMod.orderOf_five`, `mathlib:ZMod.isCyclic_units_two_pow_iff`, `mathlib:ZMod.unitOfCoprime`, `mathlib:ZMod.card_units_eq_totient`, `mathlib:orderOf`, `mathlib:orderOf_units`, `mathlib:Subgroup.zpowers`, `mathlib:IsCyclic`, `mathlib:ZMod.unitsMap`.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Theorem 7.28 (printed p. 203, PDF p. 221). The construction is the isomorphism of the theorem for e ≥ 3, reindexed by e + 3, together with the explicit generators that the source's proof uses.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), proof of Theorem 7.28 for p = 2 (printed p. 205, PDF p. 223). Proof steps 1 to 3 follow this argument; the order of 5 is the pinned ZMod.orderOf_five, so only the non-membership of -1 and the product decomposition are new.

<a id="CA-1-squares-modulo-a-power-of-two"></a>

### The squares among the units modulo a power of two

`ClassicalArithmeticCompletion:CA.1/squares-modulo-a-power-of-two` · lemma.

For every natural number e, a unit u of ℤ/2^(e+3) is a square in (ℤ/2^(e+3))ˣ if and only if its image in (ℤ/8)ˣ under the reduction ZMod.unitsMap is 1, that is, u ≡ 1 (mod 8).

Hypotheses and conventions: The modulus is 2^(e+3), at least 8. u is a unit; squares are taken in the unit group.

Further acceptance checks:

- The unit 17 modulo 32 is a square (17 ≡ 1 mod 8; 17 = 7^2 mod 32), while 5 modulo 32 is not.
- The criterion is modulo 8, not modulo 4: 5 ≡ 1 (mod 4) is not a square modulo 16.

Proof sketch:

1. Write u = (-1)^s · 5^k through unitsTwoPowEquiv; then u^2 has s = 0 and k even, so every square is a power of 25, and 25 ≡ 1 (mod 8), so squares reduce to 1 modulo 8.
2. Conversely the reduction to (ℤ/8)ˣ sends (-1)^s · 5^k to (-1)^s · 5^k modulo 8, which is 1 exactly when s = 0 and k is even, since -1, 5 and -5 are distinct and different from 1 modulo 8; such a u is (5^(k/2))^2.
3. This is the finite-level form of the source's statement that a 2-adic unit is a square exactly when it is 1 modulo 8.

Direct prerequisites: [CA.1/unit-group-of-a-power-of-two](#CA-1-unit-group-of-a-power-of-two), `mathlib:ZMod.unitsMap`, `mathlib:ZMod.unitsMap_surjective`.

Source: [conrad-hensel-2026](https://kconrad.math.uconn.edu/blurbs/gradnumthy/hensel.pdf), Theorem 4.5 (p. 7). The node is the same criterion at the finite level 2^(e+3), proved from the explicit decomposition of the unit group rather than from Hensel's lemma.

<a id="CA-1-principal-units-modulo-an-odd-prime-power-are-squares"></a>

### Units congruent to one modulo an odd prime are squares modulo its powers

`ClassicalArithmeticCompletion:CA.1/principal-units-modulo-an-odd-prime-power-are-squares` · lemma.

Let p be an odd prime and k a natural number. Every unit u of ℤ/p^(k+1) whose reduction to (ℤ/p)ˣ under ZMod.unitsMap is 1 is a square in (ℤ/p^(k+1))ˣ.

Hypotheses and conventions: p is an odd prime. u is a unit with u ≡ 1 (mod p).

Further acceptance checks:

- For p = 3 and k = 1, the unit 4 modulo 9 is 2^2 and the unit 7 modulo 9 is 4^2.
- The statement fails for p = 2: 5 ≡ 1 (mod 2) is not a square modulo 8.

Proof sketch:

1. The kernel H of the reduction (ℤ/p^(k+1))ˣ → (ℤ/p)ˣ has p^k elements: the reduction is surjective (ZMod.unitsMap_surjective) and the orders are φ(p^(k+1)) = p^k (p - 1) and p - 1 (ZMod.card_units_eq_totient).
2. Since p is odd, the order of H is prime to 2, so squaring is a bijection of H (powCoprime); hence u ∈ H is v^2 for some v ∈ H.

Direct prerequisites: `mathlib:ZMod.unitsMap`, `mathlib:ZMod.unitsMap_surjective`, `mathlib:ZMod.card_units_eq_totient`, `mathlib:powCoprime`.

Source: [conrad-hensel-2026](https://kconrad.math.uconn.edu/blurbs/gradnumthy/hensel.pdf), Example 2.8 (pp. 3–4). The node is the case n = 2, p odd, at the finite level p^(k+1); the proof is the group-order argument, not Hensel's lemma.

<a id="CA-1-power-residue-criterion-in-a-cyclic-group"></a>

### The d-th power criterion in a finite cyclic group

`ClassicalArithmeticCompletion:CA.1/power-residue-criterion-in-a-cyclic-group` · theorem.

Let G be a finite cyclic commutative group of order N and let d be a natural number. The image of the d-th power map equals the kernel of the (N / gcd(N, d))-th power map; in particular an element a of G is a d-th power exactly when a^(N / gcd(N, d)) = 1, and the d-th powers form the unique subgroup of order N / gcd(N, d).

Hypotheses and conventions: G is a finite cyclic group, written multiplicatively and commutative (powMonoidHom needs CommGroup). d is an arbitrary natural number, not assumed to divide N; for d = 0 the criterion reads a = 1.

Further acceptance checks:

- The exponent is N / gcd(N, d) and not N / d, which is not an integer when d does not divide N.
- For G the units modulo an odd prime and d = 2 the criterion is Euler's criterion, ZMod.euler_criterion.
- In a cyclic group of order 12, the cubes are the elements with a^4 = 1 and the fifth powers are all of G (gcd(12, 5) = 1).

Proof sketch:

1. The image of powMonoidHom d is contained in the kernel of powMonoidHom (N / g), g = gcd(N, d): (x^d)^(N/g) = (x^N)^(d/g) = 1 by pow_card_eq_one'.
2. The image has N / g elements (IsCyclic.card_powMonoidHom_range) and the kernel of the (N/g)-th power map has gcd(N, N/g) = N/g elements (IsCyclic.card_powMonoidHom_ker).
3. A subgroup contained in a finite subgroup of no larger cardinality equals it (Subgroup.eq_of_le_of_card_ge); read off the criterion as membership in the kernel.

Direct prerequisites: `mathlib:IsCyclic.card_powMonoidHom_range`, `mathlib:IsCyclic.card_powMonoidHom_ker`, `mathlib:Subgroup.eq_of_le_of_card_ge`, `mathlib:pow_card_eq_one'`, `mathlib:powMonoidHom`.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Theorem 6.32 (iii) and (vi) (printed p. 158, PDF p. 176). The node is parts (iii) and (vi) together, written multiplicatively: the image of the d-th power map is the image of the gcd(N, d)-th power map, which is the kernel of the (N / gcd)-th power map.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Example 7.61 (printed p. 205, PDF p. 223). The source's special case for (ℤ/p)ˣ and d dividing p - 1; the node removes the divisibility hypothesis through the greatest common divisor.

<a id="CA-1-power-residue-criterion-in-a-finite-field"></a>

### The n-th power residue criterion in a finite field

`ClassicalArithmeticCompletion:CA.1/power-residue-criterion-in-a-finite-field` · theorem.

Let F be a finite field with q elements, n a natural number and a a nonzero element of F. Then a is an n-th power in F if and only if a^((q - 1) / gcd(q - 1, n)) = 1. The nonzero n-th powers form the subgroup of index gcd(q - 1, n) of Fˣ, and a nonzero n-th power has exactly gcd(q - 1, n) nonzero n-th roots.

Hypotheses and conventions: F is a finite field with q elements; n is any natural number, not assumed to divide q - 1. a ≠ 0; zero is an n-th power for n ≥ 1 and is excluded from the multiplicative statement. Root counts are in Fˣ; for n = 0 and a = 1 all q elements of F solve x^0 = 1, including zero, whereas there are q - 1 nonzero roots.

Further acceptance checks:

- For n = 2 and q odd this is Euler's criterion in a finite field, FiniteField.isSquare_iff, since gcd(q - 1, 2) = 2.
- For n prime to q - 1 every nonzero element is an n-th power: in F_5 every nonzero element is a cube (gcd(4, 3) = 1), while in F_7 the nonzero cubes are exactly ±1 (gcd(6, 3) = 3).
- For n = 0 the criterion reads a = 1, the only 0-th power.
- In F_5 with n = 0, a = 1 has four nonzero roots and five field roots; a = 2 has none.

Proof sketch:

1. The unit group of a finite field is cyclic (the pinned instance for the units of a finite domain, from isCyclic_of_injective_ringHom) of order q - 1 (Nat.card_units).
2. Apply the criterion in a finite cyclic group to Fˣ with N = q - 1 and transport along the inclusion Fˣ → F; the index statement is IsCyclic.index_powMonoidHom_range and the root count is the kernel order IsCyclic.card_powMonoidHom_ker.

Direct prerequisites: [CA.1/power-residue-criterion-in-a-cyclic-group](#CA-1-power-residue-criterion-in-a-cyclic-group), `mathlib:isCyclic_of_injective_ringHom`, `mathlib:Nat.card_units`, `mathlib:IsCyclic.index_powMonoidHom_range`, `mathlib:IsCyclic.card_powMonoidHom_ker`, `mathlib:FiniteField.pow_card_sub_one_eq_one`, `mathlib:FiniteField.isSquare_iff`.

Source: [relyea-reciprocity-2024](https://arxiv.org/pdf/2407.03559v3), Theorem 1.7 (p. 11). The source assumes n is a positive integer in the preceding paragraph of §1.2. The node extends the criterion to n = 0 by the cyclic-group proof; its root count is restricted to nonzero roots, so the extension has q - 1 roots when a = 1.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Theorem 7.29 (printed p. 203, PDF p. 221). The cyclicity input of the first proof step, pinned in Mathlib as isCyclic_of_injective_ringHom.

Reconciled native contracts: `card_nonzero_pow_roots`.

Proof or interface frontier: The n=0 root count counts all roots in F in the prose, but x^0=1 has q roots including zero, not gcd(q−1,0)=q−1. Restrict root count to nonzero roots; verify source positive n and native contract.

Revision disposition: The packet already restricts roots to nonzero elements. card_nonzero_pow_roots now checks that convention natively, including n=0. The source assumes positive n; the zero exponent extension uses the cyclic-group argument.

<a id="CA-1-squarefree-part-of-a-rational"></a>

### The squarefree part of a rational number

`ClassicalArithmeticCompletion:CA.1/squarefree-part-of-a-rational` · definition.

For a nonzero rational u, ratSquarefreePart u is the unique squarefree integer d such that u = d · c^2 for some nonzero rational c; its sign is the sign of u, and a prime p divides d exactly when the p-adic valuation of u is odd. By convention ratSquarefreePart 0 = 0. The value depends only on the square class of u.

Hypotheses and conventions: u is a rational number; the defining property is stated for u ≠ 0 and the value at 0 is the convention 0. Squarefree is Mathlib's Squarefree on ℤ, so ±1 are squarefree and d may be negative.

API:

- `ratSquarefreePart` (constructor): The squarefree part ℚ → ℤ, with value 0 at 0.
- `squarefree_ratSquarefreePart` (characterisation): For u ≠ 0, ratSquarefreePart u is squarefree.
- `exists_eq_ratSquarefreePart_mul_sq` (characterisation): For u ≠ 0 there is a nonzero rational c with u = ratSquarefreePart u · c^2.
- `ratSquarefreePart_eq_iff` (extensionality): For u ≠ 0 and d squarefree, ratSquarefreePart u = d if and only if u = d · c^2 for some nonzero rational c.
- `ratSquarefreePart_mul_sq` (relation): ratSquarefreePart (u · t^2) = ratSquarefreePart u for nonzero u and t.
- `ratSquarefreePart_intCast_of_squarefree` (compatibility): On a squarefree integer d, ratSquarefreePart d = d.
- `prime_dvd_ratSquarefreePart_iff` (characterisation): For u ≠ 0 and a prime p, p divides ratSquarefreePart u if and only if padicValRat p u is odd.
- `ratSquarefreePart_pos_iff` (other): ratSquarefreePart u > 0 if and only if u > 0.
- `ratSquarefreePart_zero` (simp): ratSquarefreePart 0 = 0.

Unit tests:

- `ratSquarefreePart_test_eight_ninths` (computation): ratSquarefreePart (8/9) = 2.
- `ratSquarefreePart_test_neg_twelve` (computation): ratSquarefreePart (-12) = -3.
- `ratSquarefreePart_test_one` (degenerate): ratSquarefreePart 1 = 1.
- `ratSquarefreePart_test_neg_one` (non-example): ratSquarefreePart (-1) = -1, not 1: the sign is part of the square class.

Further acceptance checks:

- ratSquarefreePart (8/9) = 2 and ratSquarefreePart (3/4) = 3, the worked example of Tau Ceti's square-class file.
- ratSquarefreePart (-12) = -3: the sign is kept.
- ratSquarefreePart (-1) = -1 ≠ 1, so a definition through |u| fails.

Proof sketch:

1. Existence: Tau Ceti's Rat.exists_squarefree_int_mul_sq gives a squarefree integer d and a nonzero rational c with u = d c^2.
2. Uniqueness: if d c^2 = d' c'^2 with d, d' squarefree then d/d' is a square of a rational whose numerator and denominator are coprime squarefree integers up to sign; comparing p-adic valuations (each 0 or 1 in d and d') forces |d| = |d'|, and comparing signs forces d = d'.
3. Define ratSquarefreePart u by choice from existence and uniqueness, and 0 at 0.
4. The valuation description: v_p(u) = v_p(d) + 2 v_p(c) with v_p(d) ∈ {0, 1}, so p ∣ d exactly when v_p(u) is odd (padicValRat).

Direct prerequisites: `tauceti:Rat.exists_squarefree_int_mul_sq`, `mathlib:padicValRat`, `mathlib:Squarefree`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, Lemma 6.2 (ii) (p. 367). The character attached to the rational ω λ depends only on its square class, which the squarefree part represents; the definition is the first step of the construction the paper uses without naming it.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Exercise 1.30 (printed p. 13, PDF p. 31). Grouping the factorisation (d) by the parity of νp(x) gives x = ± ∏_{νp(x) odd} p · c^2, which is the existence and the valuation description of the squarefree part; νp on ℚ is Mathlib's padicValRat.

Proof or interface frontier: Promote ratSquarefreePart_mul_sq and prime_dvd_ratSquarefreePart_iff to lemma nodes: both are consumed by node16, the API prerequisite rule applies. Signed uniqueness by valuations is nonroutine and needs its own lemma supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-1-dyadic-characters-are-primitive"></a>

### The characters χ₄, χ₈ and χ₈' are primitive

`ClassicalArithmeticCompletion:CA.1/dyadic-characters-are-primitive` · lemma.

Mathlib's ZMod.χ₄, as a Dirichlet character of level 4, and ZMod.χ₈ and ZMod.χ₈', as Dirichlet characters of level 8, are primitive: each has conductor equal to its level.

Hypotheses and conventions: The three characters are Mathlib's, with values in ℤ; they are the characters of the even prime discriminants -4, 8 and -8.

Further acceptance checks:

- χ₄ is odd (χ₄(-1) = -1), χ₈ is even and χ₈' is odd, matching the signs of -4, 8 and -8.
- The product χ₄ · χ₈ at level 8 is χ₈', so it is primitive although χ₄ is not of level 8.

Proof sketch:

1. The conductor divides the level (DirichletCharacter.conductor_dvd_level), so it suffices to show that none factors through a proper divisor.
2. χ₄ does not factor through 2, because 3 ≡ 1 (mod 2) while χ₄(3) = -1; χ₈ and χ₈' do not factor through 4, because 5 ≡ 1 (mod 4) while χ₈(5) = χ₈'(5) = -1. Use DirichletCharacter.factorsThrough_iff_ker_unitsMap and DirichletCharacter.mem_conductorSet_iff_conductor_dvd.
3. Each check is a finite computation on residues modulo 8.

Direct prerequisites: `mathlib:ZMod.χ₄`, `mathlib:ZMod.χ₈`, `mathlib:ZMod.χ₈'`, `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:DirichletCharacter.conductor_dvd_level`, `mathlib:DirichletCharacter.factorsThrough_iff_ker_unitsMap`, `mathlib:DirichletCharacter.mem_conductorSet_iff_conductor_dvd`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, proof of Proposition 6.1 for a ∈ A(I) (p. 369). The characters of the square classes -1, 2 and -2 are χ₄, χ₈ and χ₈'; their primitivity is the dyadic input of the primitivity of every µ_i.

<a id="CA-1-legendre-character-is-primitive"></a>

### The Legendre character modulo an odd prime is primitive

`ClassicalArithmeticCompletion:CA.1/legendre-character-is-primitive` · lemma.

For an odd prime p, the quadratic character quadraticChar (ZMod p), as a Dirichlet character of level p with values in ℤ, is primitive.

Hypotheses and conventions: p is an odd prime; for p = 2 the quadratic character of ZMod 2 is trivial and has conductor 1.

Further acceptance checks:

- Its value at an integer a is legendreSym p a.
- It is even exactly when p ≡ 1 (mod 4) (legendreSym.at_neg_one).

Proof sketch:

1. The conductor divides p, so it is 1 or p.
2. It is not 1, because the character is not trivial: quadraticChar_exists_neg_one supplies a residue with value -1 (ringChar (ZMod p) = p ≠ 2); DirichletCharacter.eq_one_iff_conductor_eq_one.

Direct prerequisites: `mathlib:quadraticChar`, `mathlib:quadraticChar_exists_neg_one`, `mathlib:DirichletCharacter.conductor_dvd_level`, `mathlib:DirichletCharacter.eq_one_iff_conductor_eq_one`, `mathlib:legendreSym`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, proof of Proposition 6.1 for a ∈ A(II) (p. 372). The odd prime factors of a quadratic conductor are the levels of Legendre characters; the node is the primitivity of each such factor, which the paper uses without proof.

<a id="CA-1-primitivity-of-a-product-at-coprime-levels"></a>

### The product of primitive characters of coprime levels is primitive

`ClassicalArithmeticCompletion:CA.1/primitivity-of-a-product-at-coprime-levels` · lemma.

Let χ be a primitive Dirichlet character of level m and ψ a primitive Dirichlet character of level n, with values in a commutative monoid with zero, and suppose m and n are coprime. Then the character changeLevel χ · changeLevel ψ of level m n is primitive.

Hypotheses and conventions: m and n are coprime; χ and ψ are primitive at their levels. Values in any commutative monoid with zero.

Further acceptance checks:

- χ₄ times the Legendre character modulo 3, at level 12, is primitive: it is the Kronecker character of 12.
- The coprimality is needed: χ₄ times χ₄ at level 16 is trivial on units.

Proof sketch:

1. Suppose the product factors through d ∣ m n and write d = d₁ d₂ with d₁ ∣ m and d₂ ∣ n.
2. Given a unit y modulo m with y ≡ 1 (mod d₁), choose by the Chinese remainder theorem (ZMod.chineseRemainder) a unit x modulo m n with x ≡ y (mod m) and x ≡ 1 (mod n); then x ≡ 1 (mod d), so χ(y) ψ(1) = 1 and χ(y) = 1. Hence χ factors through d₁ (DirichletCharacter.factorsThrough_iff_ker_unitsMap), and primitivity forces d₁ = m; symmetrically d₂ = n.

Direct prerequisites: `mathlib:DirichletCharacter.changeLevel`, `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:DirichletCharacter.factorsThrough_iff_ker_unitsMap`, `mathlib:ZMod.chineseRemainder`, `mathlib:DirichletCharacter.conductor`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §8, proof of Proposition 8.2 (p. 377). The paper decomposes characters into primitive factors of coprime moduli and uses that such a product is primitive of the product modulus; the node is that fact.

<a id="CA-1-kronecker-character"></a>

### The Kronecker character of a fundamental discriminant

`ClassicalArithmeticCompletion:CA.1/kronecker-character` · construction.

For a fundamental discriminant D (Mathlib's Int.IsFundamentalDiscr), kroneckerCharacter D is the Dirichlet character of level |D| with values in ℤ whose value at an integer n is the Kronecker symbol (D / n): it is completely multiplicative, it vanishes exactly at the integers not coprime to D, (D / q) = legendreSym q D for every odd prime q, (D / 2) is 0 if D is even, 1 if D ≡ 1 (mod 8) and -1 if D ≡ 5 (mod 8), and (D / -1) is the sign of D. It is the product of the characters of the prime discriminants in the unique factorisation of D, that is Tau Ceti's genusCharFun on that factorisation, bundled as a MulChar (ZMod |D|) ℤ. Its value at an integer that is not a fundamental discriminant is not specified.

Hypotheses and conventions: D is a fundamental discriminant: D ≡ 1 (mod 4) squarefree, or D = 4m with m squarefree and m ≡ 2, 3 (mod 4). The Mathlib predicate Int.IsFundamentalDiscr and Tau Ceti's TauCeti.Multiquadratic.IsFundamentalDiscriminant have the same content (compare Int.isFundamentalDiscr_iff_squarefree with the Tau Ceti definition), which the construction records. Values are in ℤ, like ZMod.χ₄ and quadraticChar; complex values are obtained by MulChar.ringHomComp.

API:

- `kroneckerCharacter` (constructor): The Dirichlet character of level |D| attached to a fundamental discriminant D.
- `kroneckerCharacter_apply_prime` (characterisation): For an odd prime q, kroneckerCharacter D q = legendreSym q D.
- `kroneckerCharacter_apply_two` (characterisation): kroneckerCharacter D 2 is 0 if D is even, 1 if D ≡ 1 (mod 8) and -1 if D ≡ 5 (mod 8).
- `kroneckerCharacter_apply_neg_one` (characterisation): kroneckerCharacter D (-1) is the sign of D: the character is even for D > 0 and odd for D < 0.
- `kroneckerCharacter_isQuadratic` (structure): kroneckerCharacter D is quadratic (values in {0, 1, -1}).
- `kroneckerCharacter_apply_eq_zero_iff` (characterisation): kroneckerCharacter D n = 0 if and only if n is not coprime to D.
- `kroneckerCharacter_natCast_eq_jacobiSym` (compatibility): At an odd natural number n, kroneckerCharacter D n = jacobiSym D n.
- `kroneckerCharacter_mul` (relation): For coprime fundamental discriminants D₁ and D₂, kroneckerCharacter (D₁ D₂) n = kroneckerCharacter D₁ n · kroneckerCharacter D₂ n.
- `kroneckerCharacter_one` (simp): kroneckerCharacter 1 is the trivial character of level 1.
- `kroneckerCharacter_neg_four` (compatibility): kroneckerCharacter (-4) agrees with ZMod.χ₄ at every integer.
- `kroneckerCharacter_eight` (compatibility): kroneckerCharacter 8 agrees with ZMod.χ₈ at every integer.
- `kroneckerCharacter_neg_eight` (compatibility): kroneckerCharacter (-8) agrees with ZMod.χ₈' at every integer.
- `kroneckerCharacter_oddPrimeDiscr` (compatibility): At the odd prime discriminant p* = (-1)^((p-1)/2) p, kroneckerCharacter p* n = legendreSym p n; this is Tau Ceti's primeDiscriminantCharFun at p*.

Unit tests:

- `kroneckerCharacter_test_five_two` (computation): kroneckerCharacter 5 2 = -1.
- `kroneckerCharacter_test_neg_three_two` (non-example): kroneckerCharacter (-3) 2 = -1 while jacobiSym (-3) 2 = 1: the Kronecker character is not the Jacobi symbol at even arguments.
- `kroneckerCharacter_test_twelve` (computation): kroneckerCharacter 12 takes the values -1, -1 and 1 at 5, 7 and 11.
- `kroneckerCharacter_test_one` (degenerate): kroneckerCharacter 1 is the trivial character of level 1.

Further acceptance checks:

- kroneckerCharacter (-4) is χ₄, kroneckerCharacter 8 is χ₈ and kroneckerCharacter (-8) is χ₈'.
- kroneckerCharacter 12 takes the values -1, -1, 1 at 5, 7, 11, the values of legendreSym at 12.
- At odd n it is the Jacobi symbol jacobiSym D n; at n = 2 it is not: (-3 / 2) = -1 while jacobiSym (-3) 2 = 1.

Proof sketch:

1. Take the prime-discriminant factorisation D = ∏ P ∈ s, P given by TauCeti.Multiquadratic.IsFundamentalDiscriminant.existsUnique_finset_primeDiscriminant.
2. The function n ↦ genusCharFun s n is completely multiplicative (genusCharFun_mul_right, genusCharFun_one), depends only on n modulo |D| (genusCharFun_mod_right'), and vanishes exactly off the integers coprime to D (genusCharFun_eq_zero_iff); so it descends to a multiplicative character of ZMod |D| that is 0 on nonunits.
3. Its value at an odd prime q is legendreSym q D (genusCharFun_natCast_eq_legendreSym with d = D or D/4, the square factor being invisible to the Legendre symbol).
4. The prime-discriminant factors are χ₄, χ₈, χ₈' and the Legendre characters at odd prime discriminants (primeDiscriminantCharFun_neg_four, _eight, _neg_eight, _oddPrimeDiscriminant), which gives the values at 2 and at -1 by a computation on the factors (primeDiscriminantCharFun_neg_one for the sign).
5. Uniqueness of the factorisation makes the construction independent of choices; for coprime fundamental discriminants the factorisation of the product is the union, which gives multiplicativity in D.

Direct prerequisites: `tauceti:TauCeti.Multiquadratic.genusCharFun`, `tauceti:TauCeti.Multiquadratic.genusCharFun_mul_right`, `tauceti:TauCeti.Multiquadratic.genusCharFun_one`, `tauceti:TauCeti.Multiquadratic.genusCharFun_mod_right'`, `tauceti:TauCeti.Multiquadratic.genusCharFun_eq_zero_iff`, `tauceti:TauCeti.Multiquadratic.genusCharFun_natCast_eq_legendreSym`, `tauceti:TauCeti.Multiquadratic.IsFundamentalDiscriminant`, `tauceti:TauCeti.Multiquadratic.IsFundamentalDiscriminant.existsUnique_finset_primeDiscriminant`, `tauceti:TauCeti.Multiquadratic.primeDiscriminantCharFun`, `tauceti:TauCeti.Multiquadratic.primeDiscriminantCharFun_neg_four`, `tauceti:TauCeti.Multiquadratic.primeDiscriminantCharFun_eight`, `tauceti:TauCeti.Multiquadratic.primeDiscriminantCharFun_neg_eight`, `tauceti:TauCeti.Multiquadratic.primeDiscriminantCharFun_oddPrimeDiscriminant`, `tauceti:TauCeti.Multiquadratic.primeDiscriminantCharFun_neg_one`, `mathlib:Int.IsFundamentalDiscr`, `mathlib:Int.isFundamentalDiscr_iff_squarefree`, `mathlib:DirichletCharacter`, `mathlib:MulChar`, `mathlib:legendreSym`, `mathlib:jacobiSym`, `mathlib:ZMod.χ₄`, `mathlib:ZMod.χ₈`, `mathlib:ZMod.χ₈'`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, proof of Proposition 6.1 for a ∈ A(I) (p. 369). The characters µ_i are Kronecker characters of fundamental discriminants; the construction is the character the paper names by its values at odd primes.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), §24.3.3 (p. 388 of the author's edition). At R = ℤ_p this is the Kronecker symbol (D / p) as the splitting type of p in the quadratic order of discriminant D, including p = 2: the value of the node at 2 (1 for D ≡ 1 mod 8, -1 for D ≡ 5 mod 8, 0 for D even) is this description, and at odd p it is legendreSym p D. At a ramified prime the special fibre has rank two and is nonreduced (for example F₂[X]/X² for D=8), not k itself; the Kronecker value0 is unaffected.

<a id="CA-1-kronecker-character-is-primitive"></a>

### The Kronecker character of a fundamental discriminant is primitive

`ClassicalArithmeticCompletion:CA.1/kronecker-character-is-primitive` · theorem.

For every fundamental discriminant D, kroneckerCharacter D is primitive: its conductor is |D|.

Hypotheses and conventions: D is a fundamental discriminant.

Further acceptance checks:

- The conductor of kroneckerCharacter 12 is 12, not 3 or 4.
- The conductor of kroneckerCharacter (-3) is 3, while the character of the non-fundamental discriminant -12, restricted to integers prime to 6, has conductor 3, not 12.

Proof sketch:

1. The prime-discriminant factors of D have pairwise coprime absolute values, and each factor character is primitive at its level: χ₄, χ₈ and χ₈' by the dyadic lemma and the Legendre characters by the odd-prime lemma.
2. Induct on the factorisation with the lemma that a product of primitive characters of coprime levels is primitive, identifying the product with kroneckerCharacter D through its values (it suffices to compare the values at every integer, since both are characters of level |D|).
3. For D = 1 the character is the trivial character of level 1, which is primitive (DirichletCharacter.isPrimitive_one_level_one).

Direct prerequisites: [CA.1/kronecker-character](#CA-1-kronecker-character), [CA.1/dyadic-characters-are-primitive](#CA-1-dyadic-characters-are-primitive), [CA.1/legendre-character-is-primitive](#CA-1-legendre-character-is-primitive), [CA.1/primitivity-of-a-product-at-coprime-levels](#CA-1-primitivity-of-a-product-at-coprime-levels), `mathlib:DirichletCharacter.isPrimitive_one_level_one`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, Lemma 6.2 (ii) (p. 367). The existence of a primitive character with these values is the primitivity of the Kronecker character of the fundamental discriminant of the square class of ω λ.

<a id="CA-1-quadratic-character-of-a-squareclass"></a>

### The primitive quadratic character of a rational square class

`ClassicalArithmeticCompletion:CA.1/quadratic-character-of-a-squareclass` · construction.

For a nonzero rational u, let d = ratSquarefreePart u and let D(u) = d if d ≡ 1 (mod 4) and D(u) = 4d otherwise (squareclassDiscr u, Tau Ceti's fundamentalDiscriminant d). Then D(u) is a fundamental discriminant, and squareclassCharacter u := kroneckerCharacter D(u) is a primitive quadratic Dirichlet character of conductor |D(u)|. It agrees with the Legendre symbol (u / p) := legendreSym p (num u · den u) at every odd prime p with v_p(u) = 0; it depends only on the square class of u; its conductor has squarefree odd part, equal to the product of the odd primes p with v_p(u) odd, and 2-part 1, 4 or 8 according as d ≡ 1 (mod 4), d ≡ 3 (mod 4) or d is even; the odd part is 1 exactly when u ∈ {±1, ±2} · (ℚˣ)²; its value at -1 is the sign of u; and the square class of 1 gives the trivial character of conductor 1. Among primitive Dirichlet characters it is the only one agreeing with (u / p) at all but finitely many primes.

Hypotheses and conventions: u is a nonzero rational; the value at 0 is not specified. The Legendre symbol of a rational p-adic unit u at an odd prime p is legendreSym p (num u · den u), which equals (num u / p)(den u / p)^(-1) because (den u / p)^2 = 1.

API:

- `squareclassDiscr` (constructor): The fundamental discriminant of the square class of u: d if d ≡ 1 (mod 4) and 4d otherwise, for d = ratSquarefreePart u.
- `squareclassCharacter` (constructor): The Dirichlet character kroneckerCharacter (squareclassDiscr u) of level |squareclassDiscr u|.
- `isFundamentalDiscr_squareclassDiscr` (characterisation): For u ≠ 0, squareclassDiscr u is a fundamental discriminant.
- `squareclassCharacter_isPrimitive` (characterisation): For u ≠ 0 the character is primitive, of conductor |squareclassDiscr u|.
- `squareclassCharacter_apply_prime` (compatibility): At an odd prime p with padicValRat p u = 0, the value is legendreSym p (num u · den u).
- `squareclassDiscr_mul_sq` (relation): squareclassDiscr (u t^2) = squareclassDiscr u for nonzero u and t.
- `squareclassDiscr_one` (simp): squareclassDiscr 1 = 1, so the class of 1 has the trivial character of conductor 1.
- `odd_prime_dvd_squareclassDiscr_iff` (characterisation): For u ≠ 0 and an odd prime p, p divides squareclassDiscr u exactly when padicValRat p u is odd.
- `ordCompl_two_squareclassDiscr_eq_one_iff` (relation): The odd part of the conductor is 1 exactly when u = ω t^2 with ω ∈ {1, -1, 2, -2} and t ≠ 0.
- `factorization_two_squareclassDiscr` (relation): The 2-adic valuation of the conductor is 0, 2 or 3 according as ratSquarefreePart u is 1 or 3 modulo 4 or even.
- `squareclassCharacter_apply_neg_one` (other): The value at -1 is 1 if u > 0 and -1 if u < 0: the archimedean sign of the square class.
- `squareclassCharacter_mul` (functoriality): At an integer n prime to 2 and to the numerators and denominators of u and v, squareclassCharacter (u v) n = squareclassCharacter u n · squareclassCharacter v n.

Unit tests:

- `squareclassCharacter_test_neg_one` (compatibility): squareclassDiscr (-1) = -4 and squareclassCharacter (-1) agrees with ZMod.χ₄ at every integer.
- `squareclassDiscr_test_two` (computation): squareclassDiscr 2 = 8.
- `squareclassDiscr_test_eight_ninths` (computation): squareclassDiscr (8/9) = 8, the same as for 2.
- `squareclassDiscr_test_three` (non-example): squareclassDiscr 3 = 12: the conductor of the class of 3 is 12, not 3.
- `squareclassDiscr_test_five` (computation): squareclassDiscr 5 = 5.
- `squareclassDiscr_test_one` (degenerate): The class of 1 has conductor |squareclassDiscr 1| = 1.

Further acceptance checks:

- The square class of -1 gives χ₄ (conductor 4), that of 2 gives χ₈, that of -2 gives χ₈', that of 3 gives the character of conductor 12 (not 3), that of 5 the character of conductor 5, and that of 8/9 the same character as that of 2.
- For every nonzero u the 2-adic valuation of the conductor is 0, 2 or 3; this is the 2-adic bound in its sharp form for square-class characters.
- BS Lemma 6.2(ii) and the characters µ_1 to µ_4 of Proposition 6.1 are squareclassCharacter at λ, -λ, 2λ and -2λ.

Proof sketch:

1. squareclassDiscr u is fundamental: Tau Ceti's isFundamentalDiscriminant_fundamentalDiscriminant applied to the squarefree part, transported to Int.IsFundamentalDiscr.
2. Primitivity with conductor |D(u)| is the primitivity of the Kronecker character.
3. At an odd prime p with v_p(u) = 0: kroneckerCharacter D(u) p = legendreSym p D(u) = legendreSym p d = legendreSym p (num u · den u), since D(u) and num u · den u differ from d by squares prime to p (TauCeti.legendreSym_mul_sq).
4. Square-class invariance is ratSquarefreePart_mul_sq; the odd part and the 2-part of |D(u)| are read off the squarefree part (prime_dvd_ratSquarefreePart_iff); u ∈ {±1, ±2}(ℚˣ)² exactly when d ∈ {±1, ±2}.
5. Uniqueness among primitive characters is the lemma on primitive characters agreeing at almost all primes.

Direct prerequisites: [CA.1/squarefree-part-of-a-rational](#CA-1-squarefree-part-of-a-rational), [CA.1/kronecker-character](#CA-1-kronecker-character), [CA.1/kronecker-character-is-primitive](#CA-1-kronecker-character-is-primitive), [CA.1/primitive-characters-agreeing-at-almost-all-primes-are-equal](#CA-1-primitive-characters-agreeing-at-almost-all-primes-are-equal), `tauceti:TauCeti.Multiquadratic.fundamentalDiscriminant`, `tauceti:TauCeti.Multiquadratic.isFundamentalDiscriminant_fundamentalDiscriminant`, `tauceti:TauCeti.legendreSym_mul_sq`, `mathlib:padicValRat`, `mathlib:legendreSym`, `mathlib:Nat.factorization`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, Lemma 6.2 (ii) (p. 367). The construction is this χ for u = ω λ, with its existence, primitivity and uniqueness; the paper uses it without constructing it (extraction item 72).

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, proof of Proposition 6.1 for a ∈ A(II) (p. 372). The API item characterising odd part 1 by the square classes ±1, ±2 is the step the paper uses here.

<a id="CA-1-primitive-characters-agreeing-at-almost-all-primes-are-equal"></a>

### Primitive characters agreeing at almost all primes are equal

`ClassicalArithmeticCompletion:CA.1/primitive-characters-agreeing-at-almost-all-primes-are-equal` · lemma.

Let χ and ψ be primitive Dirichlet characters of nonzero levels N and M, with values in a nontrivial commutative ring, and suppose χ(p) = ψ(p) for every prime p outside a finite set S. Then N = M and χ(n) = ψ(n) for every integer n.

Hypotheses and conventions: N and M are nonzero; the values lie in a nontrivial commutative ring. S is a finite set of primes; no other hypothesis on the agreement.

Further acceptance checks:

- χ₄ and χ₈' disagree at 5 and at every prime p ≡ 5 (mod 8), so they are different, although they agree at every p ≡ 1, 3 (mod 8).
- Primitivity is needed: χ₄ and its lift to level 12 agree at every prime other than 3 but have different levels.

Proof sketch:

1. Lift both characters to the level L = N M by changeLevel. For a unit a modulo L, Dirichlet's theorem (Nat.forall_exists_prime_gt_and_eq_mod) gives a prime p ≡ a (mod L) larger than every element of S; then the lifts agree at a, since χ(p) = ψ(p). Nonunits give 0 on both sides.
2. So changeLevel χ = changeLevel ψ at level L. A character of level L factors through a unique primitive character (DirichletCharacter.FactorsThrough.existsUnique and conductor_changeLevel), so χ and ψ have the same conductor, hence N = M because both are primitive, and they are equal.

Direct prerequisites: `mathlib:Nat.forall_exists_prime_gt_and_eq_mod`, `mathlib:DirichletCharacter.changeLevel`, `mathlib:DirichletCharacter.FactorsThrough.existsUnique`, `mathlib:DirichletCharacter.conductor_changeLevel`, `mathlib:DirichletCharacter.IsPrimitive`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, Lemma 6.2 (ii) (p. 367). The word unique in the source is this lemma; the paper does not prove it.

<a id="CA-1-quadratic-conductor-is-not-twice-odd"></a>

### A primitive conductor is never twice an odd number

`ClassicalArithmeticCompletion:CA.1/quadratic-conductor-is-not-twice-odd` · lemma.

If χ is a primitive Dirichlet character of nonzero level N, then the 2-adic valuation of N is not 1.

Hypotheses and conventions: N is nonzero and χ is primitive at level N; no quadratic hypothesis is needed.

Further acceptance checks:

- No primitive character has level 2, 6, 10 or 14.
- The Kronecker characters have levels with 2-adic valuation 0, 2 or 3.

Proof sketch:

1. Suppose N = 2m with m odd. Reduction (ℤ/2m)ˣ → (ℤ/m)ˣ is injective because (ℤ/2)ˣ is trivial (ZMod.chineseRemainder), so every unit congruent to 1 modulo m is 1.
2. Hence χ factors through m (DirichletCharacter.factorsThrough_iff_ker_unitsMap), so the conductor divides m < N, contradicting primitivity.

Direct prerequisites: `mathlib:DirichletCharacter.factorsThrough_iff_ker_unitsMap`, `mathlib:ZMod.chineseRemainder`, `mathlib:ZMod.unitsMap`, `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:Nat.factorization`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §7, proof of Lemma 7.3 (p. 375). With N₁ allowed to be even this covers 2-adic valuations 0 to 3; the lemma removes valuation 1, which the paper's case analysis (N ≡ 4 mod 8 for κ = 1, N ≡ 8 mod 16 for κ = 2) assumes.

<a id="CA-1-odd-part-of-a-quadratic-conductor-is-squarefree"></a>

### The odd part of a primitive quadratic conductor is squarefree

`ClassicalArithmeticCompletion:CA.1/odd-part-of-a-quadratic-conductor-is-squarefree` · lemma.

If χ is a primitive quadratic Dirichlet character of nonzero level N with values in a commutative ring, then the odd part N / 2^(v₂(N)) of N is squarefree.

Hypotheses and conventions: N is nonzero; χ is quadratic (MulChar.IsQuadratic) and primitive.

Further acceptance checks:

- Primitive quadratic characters of level 9 or 45 do not exist.
- The quadratic hypothesis is needed: the characters of order 3 modulo 9 are primitive.

Proof sketch:

1. Suppose p^2 divides N for an odd prime p, and let x be a unit modulo N with x ≡ 1 (mod N/p). Then x ≡ 1 (mod p^(k-1)) where p^k is the exact power of p in N, k ≥ 2, and x ≡ 1 modulo the prime-to-p part.
2. By the lemma on principal units modulo an odd prime power, x is a square modulo p^k; it is 1 modulo the prime-to-p part; by the Chinese remainder theorem x = y^2 for a unit y modulo N.
3. Hence χ(x) = χ(y)^2 = 1, since χ(y) is a unit of value ±1. So χ factors through N/p, contradicting primitivity.

Direct prerequisites: [CA.1/principal-units-modulo-an-odd-prime-power-are-squares](#CA-1-principal-units-modulo-an-odd-prime-power-are-squares), `mathlib:DirichletCharacter.factorsThrough_iff_ker_unitsMap`, `mathlib:ZMod.chineseRemainder`, `mathlib:MulChar.IsQuadratic`, `mathlib:DirichletCharacter.IsPrimitive`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, proof of Proposition 6.1 for a ∈ A(II) (p. 372). The node is this assertion, which the paper states without proof.

<a id="CA-1-two-adic-conductor-bound"></a>

### The 2-adic valuation of a primitive quadratic conductor is at most three

`ClassicalArithmeticCompletion:CA.1/two-adic-conductor-bound` · theorem.

If χ is a primitive quadratic Dirichlet character of nonzero level N with values in a commutative ring, then v₂(N) ≤ 3; equivalently N ≤ 8 · N^odd. Together with the two preceding lemmas, v₂(N) ∈ {0, 2, 3} and N^odd is squarefree, which is the shape N = 2^κ N₁ with N₁ squarefree and κ ∈ {0, 1, 2} used by Bennett and Siksek.

Hypotheses and conventions: N is nonzero; χ is quadratic and primitive.

Further acceptance checks:

- The conductors of the square-class characters of -1, 2 and -2 are 4, 8 and 8, so the bound is attained.
- The quadratic hypothesis is needed: the characters of order 4 modulo 16 are primitive.
- Bennett–Siksek, Lemma 7.3: combined with the squarefree odd part, P(N) > 0.94 log N reduces to a check of N ≡ 4 (mod 8) and N ≡ 8 (mod 16).

Proof sketch:

1. Suppose 16 divides N and write N = 2^(e+3) m with e ≥ 1 and m odd. Let x be a unit modulo N with x ≡ 1 (mod N/2). Then x ≡ 1 (mod 2^(e+2)), so in particular x ≡ 1 (mod 8), and x ≡ 1 (mod m).
2. By the lemma on squares modulo a power of two, x is a square modulo 2^(e+3); it is 1 modulo m; by the Chinese remainder theorem x = y^2 for a unit y modulo N.
3. Hence χ(x) = χ(y)^2 = 1, so χ factors through N/2, contradicting primitivity.

Direct prerequisites: [CA.1/squares-modulo-a-power-of-two](#CA-1-squares-modulo-a-power-of-two), [CA.1/unit-group-of-a-power-of-two](#CA-1-unit-group-of-a-power-of-two), [CA.1/quadratic-conductor-is-not-twice-odd](#CA-1-quadratic-conductor-is-not-twice-odd), [CA.1/odd-part-of-a-quadratic-conductor-is-squarefree](#CA-1-odd-part-of-a-quadratic-conductor-is-squarefree), `mathlib:DirichletCharacter.factorsThrough_iff_ker_unitsMap`, `mathlib:ZMod.chineseRemainder`, `mathlib:MulChar.IsQuadratic`, `mathlib:DirichletCharacter.IsPrimitive`, `mathlib:Nat.factorization`.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §7, Lemma 7.3 and its proof (p. 375). The node is the 2-adic half of the asserted shape (extraction item 152, split from item 86 by the paper review); the paper asserts it without proof.

<a id="CA-1-hilbert-symbol"></a>

### The Hilbert symbol of ℚ at every place, read in Mathlib's residue symbols

`ClassicalArithmeticCompletion:CA.1/hilbert-symbol` · comparison.

For a, b ∈ ℚˣ and a place v of ℚ, (a, b)_v denotes Quadratic Form Invariants 6C's norm-equation symbol hilbertSymbol over the completion ℚ_v (ℚ_[p] for v = p, ℝ for v = ∞): (a, b)_v = 1 if b = x^2 - a y^2 has a solution in ℚ_v and -1 otherwise. This node pins that reading and states its value at an odd prime p in Mathlib's vocabulary: if a = p^α u and b = p^β w with u, w rational p-adic units, then (a, b)_p = (-1)^(αβ(p-1)/2) · (u / p)^β · (w / p)^α, where (u / p) := legendreSym p (num u · den u). The value at ∞ ((a, b)_∞ = -1 exactly when a < 0 and b < 0) and the product formula ∏_v (a, b)_v = 1 are imported from Global Quadratic Forms 4.4 and Class Field Theory 14 and are not re-proved; the value at 2 is the dyadic comparison node.

Hypotheses and conventions: a and b are nonzero rationals; p is an odd prime and u, w have p-adic valuation 0. The symbol is QFI 6C's hilbertSymbol read over the completion, the same localized reading Global Quadratic Forms 4.4 uses; no second symbol carrier is introduced.

Further acceptance checks:

- (-1, -1)_p = 1 for odd p, (-1, -1)_∞ = -1, and (-1, -1)_2 = -1 (dyadic node), so the product over all places is 1.
- For distinct odd primes p and q, (p, q)_q = legendreSym q p, (p, q)_p = legendreSym p q and (p, q)_ℓ = 1 at every other odd ℓ; with the dyadic value this turns the imported product formula into Mathlib's legendreSym.quadratic_reciprocity, which is the explicit comparison of the two laws (Voight, Proposition 14.2.1).
- (p, p)_p = (p, -1)_p = legendreSym p (-1) = χ₄(p) for odd p (legendreSym.at_neg_one).

Proof sketch:

1. Map a and b into ℚ_[p]; there a = p^α u and b = p^β w with u, w in ℤ_pˣ, and QFI 6C item 9 at K = ℚ_p, π = p and χ = legendreSym gives the displayed formula with the residue of u in 𝔽_p.
2. The residue of a rational p-adic unit u in 𝔽_p is num u · (den u)^(-1), whose quadratic character is legendreSym p (num u · den u) because legendreSym p (den u)^2 = 1 (legendreSym.mod and multiplicativity); this is the only new step.
3. Record the imported archimedean value (GQF 4.4, 'The archimedean symbol') and the imported product formula (GQF 4.4's localized product formula at K = ℚ, resting on ClassFieldTheory.hilbertProductFormula through QFI 6C's hilbertSymbol_productFormula).

Direct prerequisites: `mathlib:legendreSym`, `mathlib:legendreSym.mod`, `mathlib:padicValRat`, `mathlib:Padic`, `mathlib:legendreSym.quadratic_reciprocity`, `mathlib:legendreSym.at_neg_one`.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), (12.4.10) (p. 189 of the author's edition). The node is this formula at F = ℚ_p, q = p, π = p, with the Legendre symbol read through Mathlib's legendreSym on the numerator and denominator of a rational p-adic unit.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), (12.4.5) and Proposition 14.2.1 (pp. 188 and 211). The archimedean value and the product formula over ℚ, both imported (GQF 4.4, CFT 14); Voight notes that the product formula is equivalent to quadratic reciprocity, which is the comparison recorded in the acceptance.

<a id="CA-1-dyadic-hilbert-symbol-via-chi4-chi8"></a>

### The dyadic Hilbert symbol through χ₄ and χ₈

`ClassicalArithmeticCompletion:CA.1/dyadic-hilbert-symbol-via-chi4-chi8` · comparison.

For odd integers u and w and natural numbers α and β, the Hilbert symbol of ℚ_2 satisfies (2^α u, 2^β w)_2 = s(u, w) · χ₈(w)^α · χ₈(u)^β, where s(u, w) = -1 exactly when χ₄(u) = χ₄(w) = -1 and s(u, w) = 1 otherwise. Equivalently, Serre's two sign functions of QFI 6C item 10 are read off Mathlib's characters: (-1)^ε(u) = χ₄(u) and (-1)^ω(u) = χ₈(u) for odd u.

Hypotheses and conventions: u and w are odd integers; α and β are natural numbers. The symbol is QFI 6C's hilbertSymbol over ℚ_[2]; χ₄ and χ₈ are Mathlib's ZMod.χ₄ and ZMod.χ₈.

Further acceptance checks:

- (-1, -1)_2 = -1, (2, 5)_2 = -1, (2, 2)_2 = 1, (-1, 2)_2 = 1 and (5, 5)_2 = 1: the table of QFI 6C item 12 on the basis -1, 2, 5.
- For odd u, (u, 2)_2 = χ₈(u) = (-1)^((u^2 - 1)/8), and for odd positive u, w, (u, w)_2 = (-1)^((u-1)(w-1)/4) (Voight (12.4.14)–(12.4.15)).
- With the odd-prime reading, the dyadic values reproduce the supplementary laws legendreSym.at_neg_one and legendreSym.at_two inside the product formula.

Proof sketch:

1. QFI 6C item 10 gives (a, b)_2 = (-1)^(ε(u)ε(w) + α ω(w) + β ω(u)), with ε and ω functions of u modulo 8, pinned as serreEps and serreOmega through PadicInt.toZModPow 3.
2. On the odd residues 1, 3, 5, 7 modulo 8: ε = 0, 1, 0, 1 and χ₄ = 1, -1, 1, -1 (ZMod.χ₄_int_eq_if_mod_four); ω = 0, 1, 1, 0 and χ₈ = 1, -1, -1, 1 (ZMod.χ₈_int_eq_if_mod_eight). So (-1)^ε = χ₄ and (-1)^ω = χ₈, and (-1)^(ε(u)ε(w)) = s(u, w).
3. Multiply out the exponent; the ⚠ of QFI 6C (exponent computed in ZMod 2 before the sign) is respected because each factor is already a sign.

Direct prerequisites: `mathlib:ZMod.χ₄`, `mathlib:ZMod.χ₈`, `mathlib:ZMod.χ₄_int_eq_if_mod_four`, `mathlib:ZMod.χ₈_int_eq_if_mod_eight`, `mathlib:legendreSym.at_two`, [CA.1/unit-group-of-a-power-of-two](#CA-1-unit-group-of-a-power-of-two), [CA.1/hilbert-symbol](#CA-1-hilbert-symbol).

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), (12.4.14) and (12.4.15) (p. 190 of the author's edition). The two displayed formulas are the cases α = β = 0 and (α, β, w) = (0, 1, 1) of the node; χ₄ and χ₈ are exactly these signs.

Source: [shastri-reciprocity-2000](https://www.bprim.org/sites/default/files/rlmain.pdf), §10 (p. 183). The unit square classes of ℚ_2 are those of -1 and 5, on which s, χ₄ and χ₈ are evaluated; the same values appear in the acceptance.

<a id="CA-1-norm-of-a-prime-is-one-modulo-n"></a>

### The norm of a prime not dividing n is one modulo n

`ClassicalArithmeticCompletion:CA.1/norm-of-a-prime-is-one-modulo-n` · lemma.

Let K be a number field whose ring of integers contains a primitive n-th root of unity ζ, n ≥ 1, and let 𝔭 be a maximal ideal of 𝓞_K whose absolute norm N𝔭 is coprime to n. Then N𝔭 ≡ 1 (mod n), and the n-th roots of unity of 𝓞_K reduce injectively onto the n-th roots of unity of the residue field 𝓞_K/𝔭.

Hypotheses and conventions: ζ is a primitive n-th root of unity in 𝓞_K; 𝔭 is maximal with N𝔭 coprime to n (equivalently 𝔭 does not divide n).

Further acceptance checks:

- In ℤ[ζ₃] the primes of norm 4 and 7 satisfy 4 ≡ 7 ≡ 1 (mod 3), while the prime above 3 has norm 3.
- In ℤ[i] every odd prime has norm ≡ 1 (mod 4): 5, 9, 13, ...

Proof sketch:

1. The reduction of the n-th roots of unity to (𝓞_K/𝔭)ˣ is injective (Ideal.rootsOfUnityMapQuot_injective, using N𝔭 ≠ 1 for a maximal ideal), so the image of ζ is a primitive n-th root of unity of the residue field (IsPrimitiveRoot.idealQuotient_mk).
2. Its order n divides the order N𝔭 - 1 of the unit group of the residue field (orderOf_dvd_natCard, Nat.card_units, Ideal.absNorm_apply).
3. The residue field has exactly n n-th roots of unity, the images of the n roots of 𝓞_K (IsPrimitiveRoot.card_rootsOfUnity).

Direct prerequisites: `mathlib:Ideal.rootsOfUnityMapQuot_injective`, `mathlib:IsPrimitiveRoot.idealQuotient_mk`, `mathlib:orderOf_dvd_natCard`, `mathlib:Nat.card_units`, `mathlib:Ideal.absNorm_apply`, `mathlib:IsPrimitiveRoot.card_rootsOfUnity`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §4 (p. 68). The node is this statement for any number field containing μ_n, with 𝔭 ∤ n read as N𝔭 coprime to n.

<a id="CA-1-power-residue-symbol"></a>

### The n-th power residue symbol at a prime not dividing n

`ClassicalArithmeticCompletion:CA.1/power-residue-symbol` · definition.

Let K be a number field, n ≥ 1, and suppose 𝓞_K has enough n-th roots of unity (HasEnoughRootsOfUnity (𝓞_K) n: a primitive n-th root of unity exists). For a maximal ideal 𝔭 of 𝓞_K with N𝔭 coprime to n, the n-th power residue symbol is the multiplicative character (· / 𝔭)_n of the residue field 𝓞_K/𝔭 with values in 𝓞_K defined by: (x / 𝔭)_n = 0 for x = 0, and for x ≠ 0, (x / 𝔭)_n is the unique n-th root of unity μ of 𝓞_K with μ ≡ x^((N𝔭 - 1)/n) (mod 𝔭). For α ∈ 𝓞_K, (α / 𝔭)_n means the symbol at the residue of α. When N𝔭 is not coprime to n the symbol is, by convention, the trivial character; no formula is claimed for it at such primes.

Hypotheses and conventions: K is a number field and 𝓞_K contains a primitive n-th root of unity. 𝔭 is maximal; the defining property holds for N𝔭 coprime to n. Primes dividing n are never passed through the formula: the convention there is a junk value, and every API item carries the coprimality hypothesis. Values lie in 𝓞_K, in {0} ∪ μ_n(𝓞_K).

API:

- `powerResidueSymbol` (constructor): The character (· / 𝔭)_n of the residue field 𝓞_K/𝔭 with values in 𝓞_K.
- `powerResidueSymbol_spec` (characterisation): For N𝔭 coprime to n and x ≠ 0, the reduction of (x / 𝔭)_n modulo 𝔭 is x^((N𝔭 - 1)/n).
- `powerResidueSymbol_mem_rootsOfUnity` (data): For N𝔭 coprime to n and x ≠ 0, (x / 𝔭)_n is an n-th root of unity of 𝓞_K.
- `powerResidueSymbol_eq_iff` (extensionality): For N𝔭 coprime to n, x ≠ 0 and μ ∈ μ_n(𝓞_K): (x / 𝔭)_n = μ if and only if μ ≡ x^((N𝔭 - 1)/n) (mod 𝔭).
- `powerResidueSymbol_zeta` (simp): For a primitive n-th root of unity ζ, (ζ / 𝔭)_n = ζ^((N𝔭 - 1)/n): the supplementary law for roots of unity.
- `powerResidueSymbol_pow_div` (functoriality): For d dividing n, ((x / 𝔭)_n)^(n/d) = (x / 𝔭)_d.
- `orderOf_powerResidueSymbol` (structure): For N𝔭 coprime to n the character has order exactly n.
- `powerResidueSymbol_of_not_coprime` (other): The convention at primes dividing n: the trivial character.

Unit tests:

- `powerResidueSymbol_test_one` (degenerate): For n = 1 the symbol is the trivial character.
- `powerResidueSymbol_test_zeta_norm_four` (computation): For a primitive cube root of unity ζ and a prime of norm 4, (ζ / 𝔭)_3 = ζ.
- `powerResidueSymbol_test_zeta_norm_seven` (computation): For a primitive cube root of unity ζ and a prime of norm 7, (ζ / 𝔭)_3 = ζ^2.
- `powerResidueSymbol_test_not_sign` (non-example): At a prime of norm 4, (ζ / 𝔭)_3 is neither 1 nor -1: a sign-valued 'is a cube' indicator is not the symbol.
- `powerResidueSymbol_test_two_quadraticChar` (compatibility): For n = 2 and 𝔭 odd, (x / 𝔭)_2 is quadraticChar of the residue field at x, cast to 𝓞_K.

Further acceptance checks:

- For n = 2 it is the quadratic character of the residue field: at an odd prime of ℚ it is legendreSym p, which is the explicit comparison of the symbol with the pinned quadratic reciprocity.
- For n = 3 and a prime of norm 4 in ℤ[ζ₃], (ζ₃ / 𝔭)_3 = ζ₃; at a prime of norm 7, (ζ₃ / 𝔭)_3 = ζ₃^2.
- Values are roots of unity, not signs: (ζ₃ / 𝔭)_3 is neither 1 nor -1 at a prime of norm 4.

Proof sketch:

1. By the norm lemma, n divides N𝔭 - 1 and μ_n(𝓞_K) reduces bijectively onto the n-th roots of unity of the residue field.
2. For x ≠ 0 the element x^((N𝔭 - 1)/n) is an n-th root of unity of the residue field, since its n-th power is x^(N𝔭 - 1) = 1 (FiniteField.pow_card_sub_one_eq_one); take its unique preimage in μ_n(𝓞_K).
3. Multiplicativity is multiplicativity of x ↦ x^((N𝔭-1)/n) and of the inverse of the reduction; the character is 0 exactly at 0, so it is a MulChar of the residue field.
4. Its order is n: the (N𝔭-1)/n-th power map of the cyclic group (𝓞_K/𝔭)ˣ has image of order n (the power criterion in a cyclic group).

Direct prerequisites: [CA.1/norm-of-a-prime-is-one-modulo-n](#CA-1-norm-of-a-prime-is-one-modulo-n), [CA.1/power-residue-criterion-in-a-cyclic-group](#CA-1-power-residue-criterion-in-a-cyclic-group), `mathlib:Ideal.rootsOfUnityMapQuot_injective`, `mathlib:HasEnoughRootsOfUnity`, `mathlib:MulChar`, `mathlib:FiniteField.pow_card_sub_one_eq_one`, `mathlib:Ideal.absNorm`, `mathlib:rootsOfUnity`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §4 (p. 68). The node is this definition for any number field containing μ_n, as a character of the residue field.

Source: [milne-cft-2020](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter V, §3, 'The reciprocity law and power reciprocity' (p. 166). Milne's definition through the Artin symbol of K(ⁿ√a)/K; its agreement with the congruence definition is the Frobenius comparison node.

Source: [shastri-reciprocity-2000](https://www.bprim.org/sites/default/files/rlmain.pdf), §6 (p. 180). Shastri's local definition through the Hilbert symbol; its agreement with the congruence definition is the tame formula node.

<a id="CA-1-power-residue-euler-criterion"></a>

### Euler's criterion for the n-th power residue symbol

`ClassicalArithmeticCompletion:CA.1/power-residue-euler-criterion` · theorem.

Let K, n and 𝔭 be as for the power residue symbol, with N𝔭 coprime to n. For a nonzero residue x in 𝓞_K/𝔭, (x / 𝔭)_n = 1 if and only if x is an n-th power in 𝓞_K/𝔭.

Hypotheses and conventions: N𝔭 coprime to n; x ≠ 0.

Further acceptance checks:

- For n = 2 and K = ℚ this is Euler's criterion, ZMod.euler_criterion.
- The criterion needs 𝔭 ∤ n: at the prime above 3 in ℤ[ζ₃] every residue is a cube (the residue field is 𝔽_3).

Proof sketch:

1. By the defining congruence and injectivity of the reduction of μ_n, (x / 𝔭)_n = 1 exactly when x^((N𝔭 - 1)/n) = 1 in the residue field.
2. Since n divides N𝔭 - 1 (norm lemma), gcd(N𝔭 - 1, n) = n, and the power residue criterion in a finite field says that x^((N𝔭 - 1)/n) = 1 exactly when x is an n-th power.

Direct prerequisites: [CA.1/power-residue-symbol](#CA-1-power-residue-symbol), [CA.1/power-residue-criterion-in-a-finite-field](#CA-1-power-residue-criterion-in-a-finite-field), [CA.1/norm-of-a-prime-is-one-modulo-n](#CA-1-norm-of-a-prime-is-one-modulo-n), `mathlib:ZMod.euler_criterion`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §4 (p. 68). The node is this statement, proved from the finite-field criterion.

<a id="CA-1-power-residue-symbol-of-an-ideal"></a>

### The n-th power residue symbol at an ideal prime to n

`ClassicalArithmeticCompletion:CA.1/power-residue-symbol-of-an-ideal` · definition.

Let K and n be as for the power residue symbol. For a nonzero ideal 𝔞 of 𝓞_K with N𝔞 coprime to n and factorisation 𝔞 = 𝔭₁ ⋯ 𝔭ᵣ into maximal ideals (with repetition), and for α ∈ 𝓞_K, the symbol is (α / 𝔞)_n := ∏ᵢ (α / 𝔭ᵢ)_n ∈ 𝓞_K. For β ∈ 𝓞_K prime to n, (α / β)_n := (α / β 𝓞_K)_n. The empty product gives (α / 𝓞_K)_n = 1. Its value at an ideal not prime to n is not specified.

Hypotheses and conventions: 𝔞 is a nonzero ideal with N𝔞 coprime to n; each prime factor then has norm coprime to n. The factorisation is Mathlib's normalizedFactors in the Dedekind domain 𝓞_K.

API:

- `powerResidueSymbolIdeal` (constructor): The symbol (α / 𝔞)_n ∈ 𝓞_K.
- `powerResidueSymbolIdeal_of_isMaximal` (compatibility): At a maximal ideal 𝔭 with N𝔭 coprime to n, (α / 𝔭)_n is the prime symbol at the residue of α.
- `powerResidueSymbolIdeal_mul_right` (relation): (α / 𝔞 𝔟)_n = (α / 𝔞)_n (α / 𝔟)_n for 𝔞, 𝔟 prime to n.
- `powerResidueSymbolIdeal_mul_left` (relation): (α β / 𝔞)_n = (α / 𝔞)_n (β / 𝔞)_n for 𝔞 prime to n.
- `powerResidueSymbolIdeal_top` (simp): (α / 𝓞_K)_n = 1.
- `powerResidueSymbolIdeal_eq_zero_iff` (characterisation): (α / 𝔞)_n = 0 exactly when (α) and 𝔞 are not coprime, for 𝔞 prime to n.
- `powerResidueSymbolIdeal_congr` (other): If α ≡ β (mod 𝔞) then (α / 𝔞)_n = (β / 𝔞)_n, for 𝔞 prime to n.

Unit tests:

- `powerResidueSymbolIdeal_test_top` (degenerate): (α / 𝓞_K)_n = 1.
- `powerResidueSymbolIdeal_test_sq` (computation): (α / 𝔭^2)_n = ((α / 𝔭)_n)^2.
- `powerResidueSymbolIdeal_test_not_residue` (non-example): For n = 2 and a nonresidue α modulo 𝔭, (α / 𝔭^2)_2 = 1 although α is not a square modulo 𝔭^2.

Further acceptance checks:

- At a prime ideal the symbol is the prime symbol.
- At 𝔭^2 it is the square of the symbol at 𝔭, so for n = 2 a nonresidue modulo 𝔭 has symbol 1 at 𝔭^2: the value 1 does not detect residues at composite ideals, as for the Jacobi symbol.

Proof sketch:

1. Define the symbol as the product over UniqueFactorizationMonoid.normalizedFactors 𝔞 of the prime symbols, each prime factor having norm coprime to n (Ideal.absNorm_dvd_absNorm_of_le).
2. Multiplicativity in 𝔞 is additivity of normalizedFactors; multiplicativity in α is multiplicativity of each prime symbol; the value depends only on α modulo 𝔞 because each factor does.
3. The symbol is 0 exactly when some prime factor of 𝔞 contains α, that is when (α) and 𝔞 are not coprime.

Direct prerequisites: [CA.1/power-residue-symbol](#CA-1-power-residue-symbol), `mathlib:UniqueFactorizationMonoid.normalizedFactors`, `mathlib:Ideal.absNorm`, `mathlib:Ideal.absNorm_dvd_absNorm_of_le`, `mathlib:Ideal.span`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §4 (p. 68). The node is this definition for any number field containing μ_n, with the unit ideal allowed.

Source: [shastri-reciprocity-2000](https://www.bprim.org/sites/default/files/rlmain.pdf), §9 (pp. 181–182). Shastri's global symbol at the principal ideal (b), with the same product.

<a id="CA-1-power-residue-symbol-galois-equivariance"></a>

### Galois equivariance of the power residue symbol

`ClassicalArithmeticCompletion:CA.1/power-residue-symbol-galois-equivariance` · lemma.

For every ring automorphism σ of 𝓞_K, every ideal 𝔞 prime to n and every α ∈ 𝓞_K: σ((α / 𝔞)_n) = (σ α / σ 𝔞)_n.

Hypotheses and conventions: σ is any ring automorphism of 𝓞_K (these are the restrictions of the field automorphisms of K). 𝔞 is prime to n.

Further acceptance checks:

- For complex conjugation on ℤ[ζ₃]: the conjugate of (α / π)_3 is (ᾱ / π̄)_3 (Adhikari, Lemma 3.1 (ii)).
- For a primitive root ζ with σ ζ = ζ^k: σ((ζ / 𝔭)_n) = (ζ^k / σ𝔭)_n, and both sides equal ζ^(k (N𝔭 - 1)/n) because N(σ𝔭) = N𝔭.

Proof sketch:

1. σ preserves absolute norms and maps the factorisation of 𝔞 to that of σ 𝔞, so reduce to a maximal ideal 𝔭.
2. σ induces an isomorphism 𝓞_K/𝔭 → 𝓞_K/σ𝔭 and maps μ_n(𝓞_K) to itself; applying σ to the defining congruence μ ≡ α^((N𝔭-1)/n) (mod 𝔭) gives σ μ ≡ (σ α)^((N𝔭-1)/n) (mod σ 𝔭), and uniqueness gives the claim.

Direct prerequisites: [CA.1/power-residue-symbol-of-an-ideal](#CA-1-power-residue-symbol-of-an-ideal), [CA.1/power-residue-symbol](#CA-1-power-residue-symbol), `mathlib:Ideal.absNorm`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §4, Proposition 4.1 (p. 70). The node is this proposition for any number field containing μ_n and any automorphism of 𝓞_K.

<a id="CA-1-power-residue-symbol-and-frobenius"></a>

### The Frobenius acts on n-th roots by the power residue symbol

`ClassicalArithmeticCompletion:CA.1/power-residue-symbol-and-frobenius` · comparison.

Let L/K be an extension of number fields with 𝓞_K containing a primitive n-th root of unity, 𝔭 a maximal ideal of 𝓞_K with N𝔭 coprime to n, 𝔓 a prime of 𝓞_L lying over 𝔭, and σ an 𝓞_K-algebra automorphism of 𝓞_L that is an arithmetic Frobenius at 𝔓 (Mathlib's IsArithFrobAt: σ(x) ≡ x^(N𝔭) mod 𝔓). If α ∈ 𝓞_K is not in 𝔭 and β ∈ 𝓞_L satisfies β^n = α, then σ(β) = (α / 𝔭)_n · β.

Hypotheses and conventions: σ is an arithmetic Frobenius at 𝔓 in the sense of Mathlib's IsArithFrobAt; no Galois hypothesis on L/K is needed. α ∉ 𝔭 and N𝔭 is coprime to n: ramified primes and primes above n are excluded.

Further acceptance checks:

- For n = 2 and K = ℚ this is Tau Ceti's IsArithFrobAt.smul_sqrt: the Frobenius at an odd prime acts on a square root of d by legendreSym p d.
- It identifies the congruence definition of the symbol with Milne's definition through the Artin symbol of K(ⁿ√α)/K, which is the reading NumberFieldArithmetic's Frobenius and artinHomAway give at unramified primes.

Proof sketch:

1. σ(β)^n = σ(α) = α = β^n and β ≠ 0, so σ(β) = ξ β with ξ an n-th root of unity of L; all n of them already lie in 𝓞_K.
2. Modulo 𝔓, σ(β) ≡ β^(N𝔭) = β · α^((N𝔭 - 1)/n) ≡ β · (α / 𝔭)_n, using the defining congruence of the symbol.
3. β is a unit modulo 𝔓, so ξ ≡ (α / 𝔭)_n (mod 𝔓); the reduction of μ_n(𝓞_L) modulo 𝔓 is injective because N𝔓 is coprime to n (norm lemma in L), so ξ = (α / 𝔭)_n.

Direct prerequisites: [CA.1/power-residue-symbol](#CA-1-power-residue-symbol), [CA.1/norm-of-a-prime-is-one-modulo-n](#CA-1-norm-of-a-prime-is-one-modulo-n), `mathlib:IsArithFrobAt`, `mathlib:Ideal.rootsOfUnityMapQuot_injective`, `tauceti:IsArithFrobAt.smul_sqrt`.

Source: [milne-cft-2020](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter V, §3 (p. 166). The node shows that Milne's definition agrees with the congruence definition, with the Artin symbol replaced by any arithmetic Frobenius.

Source: [shastri-reciprocity-2000](https://www.bprim.org/sites/default/files/rlmain.pdf), §6 (p. 180). The same computation, which is the second proof step.

<a id="CA-1-tame-hilbert-symbol-formula"></a>

### The degree-n Hilbert symbol at a place not dividing n

`ClassicalArithmeticCompletion:CA.1/tame-hilbert-symbol-formula` · theorem.

Let K be a number field containing μ_n, v a finite place of K whose prime 𝔭 = 𝔭_v does not divide n, and (a, b)_v the degree-n Hilbert (norm-residue) symbol of K_v in the orientation (a, b)_v = Art_v(a)(ⁿ√b) / ⁿ√b. For a, b ∈ Kˣ with valuations α = v(a), β = v(b), (a, b)_v = ((-1)^(αβ) b^α / a^β mod 𝔭 / 𝔭)_n, where the element (-1)^(αβ) b^α a^(-β) is a v-adic unit read in the residue field. In particular (u, w)_v = 1 for units u, w, and (π, u)_v = (u / 𝔭)_n for a uniformiser π and a unit u.

Hypotheses and conventions: v is a finite place with 𝔭_v ∤ n; the formula is never applied at places above n or at archimedean places. The orientation of the symbol is pinned: (a, b)_v = Art_v(a)(ⁿ√b)/ⁿ√b, the local Artin map of a acting on an n-th root of b.

Further acceptance checks:

- For K = ℚ and n = 2 at an odd prime p it is the odd-prime formula of the quadratic Hilbert symbol node (Voight (12.4.10)).
- The formula fails at 2 for n = 2: (-1, -1)_2 = -1 although -1 is a unit at 2.

Proof sketch:

1. For a unit w, K_v(ⁿ√w)/K_v is unramified because 𝔭 ∤ n (LocalFieldsRamification, Layer 2), so units are norms from it (Class Field Theory, Layer 6) and (u, w)_v = 1 for units u.
2. For a uniformiser π, Art_v(π) is the arithmetic Frobenius of the unramified extension (Class Field Theory, Layer 6), so Art_v(π)(ⁿ√w) ≡ ⁿ√w^(N𝔭) = w^((N𝔭 - 1)/n) ⁿ√w, and (π, w)_v = (w / 𝔭)_n by the defining congruence of the symbol.
3. By skew-symmetry (u, π)_v = (u / 𝔭)_n^(-1), and (π, π)_v = (π, -1)_v = (-1 / 𝔭)_n from (π, -π)_v = 1.
4. Expand (π^α u, π^β w)_v bimultiplicatively and collect: (-1 / 𝔭)^(αβ) (w / 𝔭)^α (u / 𝔭)^(-β) = ((-1)^(αβ) b^α / a^β / 𝔭)_n.

Direct prerequisites: [CA.1/power-residue-symbol](#CA-1-power-residue-symbol), [CA.1/power-residue-symbol-and-frobenius](#CA-1-power-residue-symbol-and-frobenius), `K2SymbolsBrauer:T.7`.

Source: [shastri-reciprocity-2000](https://www.bprim.org/sites/default/files/rlmain.pdf), §6 (p. 180). The node is this computation together with its bimultiplicative extension to all a, b, which the source leaves implicit.

Source: [milne-cft-2020](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter III, Theorem 4.4 and Remark 4.5 (pp. 113–114). Skew-symmetry is used in step 3. Milne's orientation is the opposite of Shastri's: Milne's (a, b) is Shastri's ⟨b, a⟩; the node pins Shastri's orientation, and the request to K2SymbolsBrauer:T.7 asks for that orientation.

Proof or interface frontier: The T.7 atlas stage describes the degree-n symbol but is still needs_source_decomposition. No exact symbol/formula supplier node was obtained; the stage-only prerequisite does not close this planned contract.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-1-hilbert-product-formula-of-degree-n"></a>

### Hilbert's product formula for the degree-n Hilbert symbol

`ClassicalArithmeticCompletion:CA.1/hilbert-product-formula-of-degree-n` · theorem.

Let K be a number field containing μ_n and a, b ∈ Kˣ. The degree-n Hilbert symbol (a, b)_v is 1 at all but finitely many places v of K, and ∏_v (a, b)_v = 1, the product running over all finite and archimedean places. For n ≥ 3 every archimedean place of K is complex and contributes 1; for n = 2 a real place contributes -1 exactly when a and b are both negative there.

Hypotheses and conventions: K contains μ_n; a, b ∈ Kˣ. The symbol at archimedean places is the archimedean norm-residue symbol (trivial at complex places, the sign symbol at real places for n = 2).

Further acceptance checks:

- For n = 2 and K = ℚ it is the imported product formula of the quadratic Hilbert symbol node.
- For K = ℚ(ζ₃), n = 3, a = ζ₃ and b = 1 - ζ₃ the finitely many nontrivial factors multiply to 1 (only the place above 3 can contribute).

Proof sketch:

1. Finite support: outside the places dividing n a b ∞ both arguments are units and the symbol is 1 by the tame formula.
2. Global Artin reciprocity (Class Field Theory, Layer 11: globalArtinMap_principal, with local-global compatibility globalArtinMap_local and the archimedean Artin package) says ∏_v Art_v(a) acts trivially on K(ⁿ√b); applying it to ⁿ√b gives ∏_v (a, b)_v = 1.
3. For n = 2 this is ClassFieldTheory.hilbertProductFormula in sign form; the node is its extension to all n, which no other layer plans.

Direct prerequisites: [CA.1/tame-hilbert-symbol-formula](#CA-1-tame-hilbert-symbol-formula), `K2SymbolsBrauer:T.7`.

Source: [shastri-reciprocity-2000](https://www.bprim.org/sites/default/files/rlmain.pdf), §8, Theorem 4 and its proof (p. 181). The node is this theorem with its finite support made explicit.

Source: [milne-cft-2020](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter V, Example 5.4 (p. 179). The same derivation from the reciprocity law.

Proof or interface frontier: The T.7 atlas stage describes the degree-n symbol but is still needs_source_decomposition. No exact symbol/formula supplier node was obtained; the stage-only prerequisite does not close this planned contract.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-1-power-reciprocity-law"></a>

### The general power reciprocity law

`ClassicalArithmeticCompletion:CA.1/power-reciprocity-law` · theorem.

Let K be a number field containing μ_n, and let a, b be nonzero elements of 𝓞_K such that the ideals (a), (b) and (n) are pairwise coprime. Then (a / b)_n · ((b / a)_n)^(-1) = ∏_{v | n∞} (a, b)_v, where (a / b)_n is the power residue symbol at the principal ideal (b) and the product runs over the places above n and the archimedean places. The places above n enter only through Hilbert symbols; no power residue symbol is taken at a prime dividing n.

Hypotheses and conventions: K contains μ_n; a, b ∈ 𝓞_K are nonzero with (a), (b), (n) pairwise coprime. The Hilbert symbols are the degree-n norm-residue symbols in the pinned orientation (a, b)_v = Art_v(a)(ⁿ√b)/ⁿ√b.

Further acceptance checks:

- For K = ℚ, n = 2 and odd positive coprime a, b the right side is (a, b)_2 (a, b)_∞ = (-1)^((a-1)(b-1)/4), which is Mathlib's jacobiSym.quadratic_reciprocity: the explicit comparison with the pinned quadratic law (Shastri §10).
- For K = ℚ(ζ₃) and n = 3, K is totally complex, so the right side is the Hilbert symbol at the prime above 3 alone; cubic reciprocity is the statement that this factor is 1 for primary arguments, which the cubic reciprocity node proves by Jacobi sums instead.

Proof sketch:

1. Split the product formula ∏_v (a, b)_v = 1 over the places dividing a, those dividing b, those dividing n∞, and the rest, where every factor is 1 (tame formula, units).
2. At v | a (so v ∤ nb): by the tame formula, (a, b)_v = (b / 𝔭_v)_n^(v(a)); the product over v | a is (b / a)_n.
3. At v | b (so v ∤ na): (a, b)_v = (a / 𝔭_v)_n^(-v(b)); the product over v | b is (a / b)_n^(-1).
4. Rearrange: (a / b)_n (b / a)_n^(-1) = ∏_{v | n∞} (a, b)_v.

Direct prerequisites: [CA.1/hilbert-product-formula-of-degree-n](#CA-1-hilbert-product-formula-of-degree-n), [CA.1/tame-hilbert-symbol-formula](#CA-1-tame-hilbert-symbol-formula), [CA.1/power-residue-symbol-of-an-ideal](#CA-1-power-residue-symbol-of-an-ideal), `mathlib:jacobiSym.quadratic_reciprocity`, `K2SymbolsBrauer:T.7`.

Source: [shastri-reciprocity-2000](https://www.bprim.org/sites/default/files/rlmain.pdf), §9, Theorem 5 and its proof (p. 182). The node is this theorem for integral a, b (the general a, b ∈ Kˣ follows by multiplicativity), with the corrected index in the proof (source issue E201).

Proof or interface frontier: The T.7 atlas stage describes the degree-n symbol but is still needs_source_decomposition. No exact symbol/formula supplier node was obtained; the stage-only prerequisite does not close this planned contract.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-1-primary-eisenstein-integer"></a>

### Primary elements of the Eisenstein integers

`ClassicalArithmeticCompletion:CA.1/primary-eisenstein-integer` · definition.

Let K = ℚ(ζ₃) with ring of integers ℤ[ω], ω a primitive cube root of unity. An element π of 𝓞_K is primary if π ≡ 2 (mod 3𝓞_K); for π = a + b ω with a, b ∈ ℤ this says a ≡ 2 (mod 3) and b ≡ 0 (mod 3). Every prime π of ℤ[ω] of norm different from 3 has exactly one primary associate; rational primes q ≡ 2 (mod 3) are primary; and if α and β are primary then so is -α β. The predicate is stated for every number field (as π ≡ 2 modulo 3), and its content is for ℚ(ζ₃).

Hypotheses and conventions: The field is ℚ(ζ₃), given as a number field with IsCyclotomicExtension {3} ℚ K; ω is a primitive cube root of unity in 𝓞_K. Primary is a congruence modulo 3𝓞_K; units such as -1 satisfy it, so the predicate is used together with primality or a nonunit hypothesis.

API:

- `IsPrimaryEisenstein` (constructor): π ≡ 2 (mod 3𝓞_K).
- `isPrimaryEisenstein_add_mul_iff` (characterisation): In ℚ(ζ₃), a + b ω is primary if and only if a ≡ 2 and b ≡ 0 (mod 3).
- `exists_unique_associated_isPrimaryEisenstein` (structure): A prime of ℤ[ω] of norm different from 3 has exactly one primary associate.
- `IsPrimaryEisenstein.neg_mul` (relation): If α and β are primary then -α β is primary.
- `isPrimaryEisenstein_intCast_iff` (compatibility): A rational integer a is primary exactly when a ≡ 2 (mod 3).

Unit tests:

- `isPrimaryEisenstein_test_two` (computation): 2 is primary.
- `isPrimaryEisenstein_test_norm_seven` (computation): -1 - 3ω, of norm 7, is primary.
- `isPrimaryEisenstein_test_three_add_zeta` (non-example): 3 + ω, of norm 7, is not primary.
- `isPrimaryEisenstein_test_one_sub_zeta` (degenerate): 1 - ω, the prime of norm 3, is not primary.

Further acceptance checks:

- 2 and -1 - 3ω (of norm 7) are primary; 3 + ω (also of norm 7) is not.
- 1 - ω, the prime above 3, is not primary: primes of norm 3 are excluded from cubic reciprocity.

Proof sketch:

1. The coordinate description uses that 1, ω is a ℤ-basis of 𝓞_K, so a + b ω ≡ 2 (mod 3) exactly when 3 divides a - 2 and b.
2. Existence and uniqueness of the primary associate: the six associates ±π, ±ωπ, ±ω²π reduce to six distinct classes modulo 3 when N(π) ≠ 3, exactly one of which is 2 (Adhikari p. 59; Relyea, Lemma 3.12).
3. Closure: if α ≡ β ≡ 2 then -α β ≡ -4 ≡ 2 (mod 3) (Relyea, Lemma 3.16).

Direct prerequisites: `mathlib:IsCyclotomicExtension`, `mathlib:IsPrimitiveRoot`, `mathlib:Ideal.span`, `mathlib:Associated`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §3 (p. 59). The node is this definition with its two stated properties, extended to all elements.

Source: [relyea-reciprocity-2024](https://arxiv.org/pdf/2407.03559v3), Lemma 3.16 (p. 37). The closure API item.

Proof or interface frontier: Promote primary coordinate criterion and unique primary associate because consumed by node33. Supply pinned basis/unit classification and split nonroutine uniqueness proof.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-1-cubic-jacobi-sum-of-a-primary-prime"></a>

### The Jacobi sum of the cubic character of a primary prime

`ClassicalArithmeticCompletion:CA.1/cubic-jacobi-sum-of-a-primary-prime` · lemma.

Let π be a primary prime of ℤ[ω] of norm p ≡ 1 (mod 3), and χ_π = (· / π)_3 the cubic residue character of the residue field ℤ[ω]/π ≅ 𝔽_p. Then the Jacobi sum J(χ_π, χ_π) = Σ_x χ_π(x) χ_π(1 - x) equals π.

Hypotheses and conventions: π is a prime of ℤ[ω], primary, of norm p ≡ 1 (mod 3). The Jacobi sum is Mathlib's jacobiSum for the character with values in 𝓞_K; for nontrivial characters Mathlib's convention χ(0) = 0 agrees with Adhikari's.

Further acceptance checks:

- For π = -1 - 3ω (norm 7), J(χ_π, χ_π) = -1 - 3ω.
- The sign normalisation matters: for the non-primary associate -π the value is still π, not -π, because J is attached to the character, which depends only on the ideal.

Proof sketch:

1. Since χ_π is cubic, χ_π(-1) = 1, and g(χ_π)^3 = p J(χ_π, χ_π) (gaussSum_pow_eq_prod_jacobiSum with n = 3).
2. Modulo 3, g(χ_π)^3 ≡ Σ_{t ≠ 0} ζ_p^(3t) = -1, so J(χ_π, χ_π) ≡ -1 (mod 3); the same for the conjugate character and subtraction give J ≡ 2 (mod 3) coordinatewise: J is primary.
3. J J̄ = p (from gaussSum_mul_gaussSum_eq_card and the Jacobi-Gauss relation), so J is a primary prime of norm p, hence J = π or J = π̄.
4. J ≡ Σ_x x^((p-1)/3)(1 - x)^((p-1)/3) ≡ 0 (mod π), a polynomial of degree less than p - 1 summed over 𝔽_p; so J = π.

Direct prerequisites: [CA.1/power-residue-symbol](#CA-1-power-residue-symbol), [CA.1/primary-eisenstein-integer](#CA-1-primary-eisenstein-integer), `mathlib:jacobiSum`, `mathlib:gaussSum_pow_eq_prod_jacobiSum`, `mathlib:gaussSum_mul_gaussSum_eq_card`, `mathlib:jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `FiniteFieldsAndCharacterSums:FF.1`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, Lemma 3.2 (p. 62). The node is this lemma; the proof steps follow the source's proof (pp. 62–64).

Source: [relyea-reciprocity-2024](https://arxiv.org/pdf/2407.03559v3), Proposition 3.19 (p. 39). The same statement; the hypothesis that π is a prime of norm p ≡ 1 (mod 3) is implicit in the source and explicit in the node.

Proof or interface frontier: Lemma3.2 proof spans printed62–64; split Jacobi sum primary congruence, norm= p, divisibility by π and final normalized prime identification. Direct prerequisite full(1,ω) basis and prime factorization not listed; no pinned three_pid in baseline.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-1-cubic-gauss-sum-cube"></a>

### The cube of the cubic Gauss sum

`ClassicalArithmeticCompletion:CA.1/cubic-gauss-sum-cube` · lemma.

Let π be a primary prime of ℤ[ω] of norm p ≡ 1 (mod 3), χ_π its cubic residue character on 𝔽_p ≅ ℤ[ω]/π, pushed to ℂ along an embedding φ of 𝓞_K, and ψ a primitive additive character of 𝔽_p with values in ℂ. Then g(χ_π, ψ)^3 = p · φ(π).

Hypotheses and conventions: As for the Jacobi sum lemma; ψ is primitive. The Gauss sum is Mathlib's gaussSum for the ℂ-valued characters.

Further acceptance checks:

- |g(χ_π, ψ)|^2 = p (gaussSum_mul_gaussSum_eq_card), consistent with |p φ(π)|^(2/3) = p.
- For π = -1 - 3ω the cube is 7 φ(-1 - 3ω).

Proof sketch:

1. gaussSum_pow_eq_prod_jacobiSum gives g(χ)^3 = χ(-1) · p · J(χ, χ) for the cubic character χ (orderOf χ = 3 ≥ 2), and χ(-1) = 1 because χ(-1)^2 = χ(1) = 1 and χ(-1)^3 = 1.
2. Substitute J(χ_π, χ_π) = π from the Jacobi sum lemma, pushed along φ.

Direct prerequisites: [CA.1/cubic-jacobi-sum-of-a-primary-prime](#CA-1-cubic-jacobi-sum-of-a-primary-prime), `mathlib:gaussSum`, `mathlib:gaussSum_pow_eq_prod_jacobiSum`, `mathlib:MulChar.ringHomComp`, `mathlib:AddChar.IsPrimitive`, `FiniteFieldsAndCharacterSums:FF.1`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, Proposition 3.3 and (11) (pp. 61 and 64). Proposition 3.3 is Mathlib's gaussSum_pow_eq_prod_jacobiSum; the node is its consequence (11) for the cubic character of a primary prime.

Proof or interface frontier: The external FF.1/QM.0 stage does not identify the exact consumed character-normalisation/Jacobi-product identity. Supply its lemma contract as a direct prerequisite; the local composition is conditional on that missing adapter.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-1-cubic-reciprocity"></a>

### The law of cubic reciprocity

`ClassicalArithmeticCompletion:CA.1/cubic-reciprocity` · theorem.

Let π₁ and π₂ be primary primes of ℤ[ω], neither of norm 3, with N(π₁) ≠ N(π₂). Then (π₂ / π₁)_3 = (π₁ / π₂)_3, the symbols being the cubic power residue symbols at the principal ideals (π₁) and (π₂).

Hypotheses and conventions: K = ℚ(ζ₃); π₁, π₂ are primes of 𝓞_K, primary, of norms different from 3 and from each other. The prime above 3 is excluded: no residue symbol is taken at it.

Further acceptance checks:

- For q = 2 and π = -1 - 3ω (norm 7): ω ≡ 2 (mod π), so (2 / π)_3 ≡ 2^2 = 4 ≡ ω^2, and π ≡ 1 + ω = -ω^2 ≡ ω^2 (mod 2), so (π / 2)_3 = ω^2 as well; 2 is not a cube modulo 7.
- Primary is needed: replacing π₂ by its associate ω π₂ multiplies (π₂ / π₁)_3 by (ω / π₁)_3 = ω^((N π₁ - 1)/3), which is nontrivial in general.

Proof sketch:

1. Case A, both rational primes q₁ ≠ q₂ ≡ 2 (mod 3): by Galois equivariance under complex conjugation, χ_q(ᾱ) = χ_q(α²) and χ_q(α) = χ_q(ᾱ) for rational α, so χ_{q₁}(q₂) is a cube root of unity equal to its square, hence 1; both sides are 1.
2. Case B, π₁ = q rational and π₂ = π of norm p ≡ 1 (mod 3): from g(χ_π)^3 = p π (cubic Gauss sum lemma), raise to (q^2 - 1)/3 and reduce modulo q: g(χ_π)^(q^2 - 1) ≡ χ_q(p π) = χ_q(π) (mod q), since χ_q(p) = 1 by Case A's argument; on the other hand g(χ_π)^(q^2) ≡ Σ χ_π(t)^(q^2) ζ^(q^2 t) = Σ χ_π(t) ζ^(q^2 t) = χ_π(q^(-2)) g(χ_π) = χ_π(q) g(χ_π) (mod q), by the Frobenius congruence for Gauss sums (gaussSum_frob), q^2 ≡ 1 (mod 3) and the shift property g_c(χ) = χ(c^(-1)) g(χ); cancel g(χ_π) using g(χ) g(χ̄) = p prime to q, and lift the congruence of cube roots of unity modulo q to equality (they are distinct modulo q).
3. Case C, both of norm p₁ ≠ p₂ ≡ 1 (mod 3): apply Case B's computation to γ₁ = π̄₁ modulo π₂ and to π₂ modulo π₁, obtaining χ_{γ₁}(p₂^2) = χ_{π₂}(p₁ γ₁) and χ_{π₂}(p₁^2) = χ_{π₁}(p₂ π₂), and combine with Galois equivariance (χ_{π̄}(ᾱ) = conj χ_π(α)) as in the source to get χ_{π₁}(π₂) = χ_{π₂}(π₁).

Direct prerequisites: [CA.1/cubic-gauss-sum-cube](#CA-1-cubic-gauss-sum-cube), [CA.1/cubic-jacobi-sum-of-a-primary-prime](#CA-1-cubic-jacobi-sum-of-a-primary-prime), [CA.1/power-residue-symbol-of-an-ideal](#CA-1-power-residue-symbol-of-an-ideal), [CA.1/power-residue-symbol-galois-equivariance](#CA-1-power-residue-symbol-galois-equivariance), [CA.1/primary-eisenstein-integer](#CA-1-primary-eisenstein-integer), `mathlib:gaussSum_frob`, `mathlib:gaussSum_mul_gaussSum_eq_card`, `FiniteFieldsAndCharacterSums:FF.1`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, Theorem 3.1 (p. 59); proof pp. 64–66. The node is this theorem; the proof steps are the source's three cases.

Source: [relyea-reciprocity-2024](https://arxiv.org/pdf/2407.03559v3), Theorem 3.13 (p. 36). The same statement, with a second proof by cubic Gauss sums.

Proof or interface frontier: Split rational-prime rational argument, Gauss-sum Frobenius congruence comparison, complex-prime comparison, final three-case theorem. Sourceproofprinted64–66 > onepage; Gauss sum shift property named but not listed. Existing333node list has no suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-1-cubic-supplement-for-one-minus-zeta"></a>

### Eisenstein's supplement to cubic reciprocity at 1 - ω

`ClassicalArithmeticCompletion:CA.1/cubic-supplement-for-one-minus-zeta` · theorem.

Let π = a + b ω be a primary prime of ℤ[ω] of norm different from 3, and write a = 3m - 1 with m ∈ ℤ. Then ((1 - ω) / π)_3 = ω^(2m). The companion supplements (-1 / π)_3 = 1 and (ω / π)_3 = ω^((N π - 1)/3), that is 1, ω or ω² according as N π ≡ 1, 4 or 7 (mod 9), are the values of the power residue symbol at -1 = (-1)^3 and at a root of unity.

Hypotheses and conventions: π is a primary prime of ℤ[ω] of norm different from 3; for a rational prime q = π, b = 0 and q = 3m - 1. The same primitive cube root of unity ω is used in π = a + b ω and in the value ω^(2m).

Further acceptance checks:

- For q = 2 (m = 1): ((1 - ω) / 2)_3 = ω^2.
- For π = -1 - 3ω (a = -1, m = 0): ((1 - ω) / π)_3 = 1.

Proof sketch:

1. Rational π = q: χ_q(1 - ω) = χ_q((1 - ω)^4) = χ_q((-3ω)^2) = χ_q(-3)^2 χ_q(ω)^2 = χ_q(ω)^2 = ω^(2(q^2 - 1)/3) = ω^(2m), using χ_q(-3) = 1 (Case A of cubic reciprocity) and the value at a root of unity.
2. Complex π = a + b ω with a = 3m - 1, b = 3n: extend the cubic character to primary composite denominators by the ideal symbol; by cubic reciprocity for the primary rational integer a (factored into primary primes by the closure property) and for a + b, and by the congruences b ω ≡ π (mod a) and b(1 - ω) ≡ -π (mod a + b), Williams' computation gives χ_π(1 - ω) = ω^(n + 2(m + n)) = ω^(2m).

Direct prerequisites: [CA.1/cubic-reciprocity](#CA-1-cubic-reciprocity), [CA.1/power-residue-symbol-of-an-ideal](#CA-1-power-residue-symbol-of-an-ideal), [CA.1/power-residue-symbol](#CA-1-power-residue-symbol), [CA.1/primary-eisenstein-integer](#CA-1-primary-eisenstein-integer).

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §3, Remark 3.1 (p. 59) and Williams' proof (pp. 66–67). The node is equation (4) with the two cases of its proof.

Proof or interface frontier: Source Williams proof uses cubic reciprocity with composite rational denominators; promote multiplicative extension (including primarysignnormalization) to lemma node. Rational/complex cases need named supporting steps.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-1-primary-element-of-a-cyclotomic-ring"></a>

### Primary elements of ℤ[ζ_l]

`ClassicalArithmeticCompletion:CA.1/primary-element-of-a-cyclotomic-ring` · definition.

Let l be an odd prime, K = ℚ(ζ_l) and ζ a primitive l-th root of unity in 𝓞_K = ℤ[ζ]. An element α of 𝓞_K is primary if it is prime to l and congruent to a rational integer modulo (1 - ζ)^2. For every α prime to l there is c ∈ ℤ/l, unique, such that ζ^c α is primary; rational integers prime to l are primary; and products of primary elements are primary. The predicate is stated for every number field and every ζ, and its content is for ℚ(ζ_l).

Hypotheses and conventions: l is an odd prime and ζ a primitive l-th root of unity; the ideal (1 - ζ) is the prime above l and does not depend on ζ. Prime to l is IsCoprime α l in 𝓞_K.

API:

- `IsEisensteinPrimary` (constructor): α is prime to l and α ≡ c (mod (1 - ζ)^2) for some c ∈ ℤ.
- `exists_unique_zeta_pow_mul_isEisensteinPrimary` (structure): For α prime to l, there is a unique c ∈ ℤ/l with ζ^c α primary.
- `isEisensteinPrimary_intCast` (compatibility): A rational integer prime to l is primary.
- `IsEisensteinPrimary.mul` (relation): Products of primary elements are primary.

Unit tests:

- `isEisensteinPrimary_test_one` (degenerate): 1 is primary.
- `isEisensteinPrimary_test_two` (computation): 2 is primary for an odd prime l.
- `isEisensteinPrimary_test_zeta` (non-example): ζ is not primary: the normalising power is unique modulo l.
- `isEisensteinPrimary_test_one_sub_zeta` (non-example): 1 - ζ is not primary, not being prime to l.

Further acceptance checks:

- 1 and 2 are primary (for l odd); ζ is not; 1 - ζ is not, not being prime to l.
- For α prime to l, exactly one of α, ζ α, ..., ζ^(l-1) α is primary.

Proof sketch:

1. Since (1 - ζ) is a prime of degree 1 with residue field 𝔽_l, α ≡ a (mod 1 - ζ) and (α - a)/(1 - ζ) ≡ b (mod 1 - ζ) for integers a, b, so α ≡ a + b(1 - ζ) (mod (1 - ζ)^2), with l ∤ a because α is prime to l.
2. ζ^d ≡ 1 - d(1 - ζ) (mod (1 - ζ)^2), so ζ^d α ≡ a + (b - a d)(1 - ζ); choose d with a d ≡ b (mod l), unique modulo l.
3. Products and rational integers: immediate from the congruence.

Direct prerequisites: `mathlib:IsCyclotomicExtension`, `mathlib:IsPrimitiveRoot`, `mathlib:Ideal.span`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §4 (p. 69). The node is this definition with the claim and its proof.

Proof or interface frontier: Firstproofstep uses unlisted cyclotomic residue degree1 and expansion mod(1−ζ)^2; unique normalizingpower is nonroutine. Supply baseline/reuse owner and promote uniqueness API to own lemma since neededbyEisenstein proof.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-1-eisenstein-reciprocity"></a>

### The Eisenstein reciprocity law

`ClassicalArithmeticCompletion:CA.1/eisenstein-reciprocity` · theorem.

Let l be an odd prime, K = ℚ(ζ_l), α ∈ ℤ[ζ_l] a primary nonunit, and a ∈ ℤ with a ≠ ±1, a prime to l and (a) prime to (α). Then (α / a)_l = (a / α)_l, the l-th power residue symbols at the principal ideals (a) and (α).

Hypotheses and conventions: l is an odd prime; α is primary and not a unit; a is a rational integer, a ≠ ±1, prime to l and to α. Neither symbol is taken at the prime above l, which divides neither (a) nor (α).

Further acceptance checks:

- For l = 3 and α = -1 - 3ω (primary of norm 7), a = 2: (α / 2)_3 = (2 / α)_3, the case of cubic reciprocity with one rational prime.
- The primary hypothesis cannot be dropped: replacing α by ζ α leaves (a / α)_l unchanged but multiplies (α / p)_l by (ζ / p)_l = ζ^((p^(l-1) - 1)/l) for a rational prime p ≠ l, which is nontrivial unless p^(l-1) ≡ 1 (mod l^2).
- The hypothesis a ≠ ±1 is the source's; for a = ±1 both sides are 1 trivially.

Proof sketch:

1. For a prime P of ℤ[ζ_m] not dividing m, form the Gauss sum g(P) of the character χ_P(t) = (t / P)_m^(-1) of ℤ[ζ_m]/P with the trace additive character, and Φ(P) = g(P)^m, which lies in ℚ(ζ_m) (Adhikari, Proposition 4.2); extend Φ multiplicatively to ideals prime to m.
2. Stickelberger's theorem: (Φ(P)) = P^γ with γ = Σ_t t σ_t^(-1) over 1 ≤ t < m prime to m (Adhikari, Proposition 4.3); hence Φ(α) = ε(α) α^γ for a unit ε(α), which is a root of unity ±ζ^i (Proposition 4.5) and is ±1 for primary α when m = l (Proposition 4.6).
3. For primes P, P' prime to l with coprime norms, (Φ(P) / P')_l = (N P' / P)_l; with Galois equivariance this gives (α / N 𝔅)_l = (N 𝔅 / α)_l for ideals 𝔅 prime to l with N 𝔅 prime to α (Adhikari (25)).
4. For a rational prime p ≠ l prime to α and P above p with N P = p^f, (α / p)_l^f = (p / α)_l^f; f divides l - 1, so l ∤ f and (α / p)_l = (p / α)_l; conclude by multiplicativity in a.

Direct prerequisites: [CA.1/power-residue-symbol-of-an-ideal](#CA-1-power-residue-symbol-of-an-ideal), [CA.1/power-residue-symbol-galois-equivariance](#CA-1-power-residue-symbol-galois-equivariance), [CA.1/primary-element-of-a-cyclotomic-ring](#CA-1-primary-element-of-a-cyclotomic-ring), [CA.1/power-residue-symbol](#CA-1-power-residue-symbol), `mathlib:gaussSum`, `mathlib:gaussSum_mul_gaussSum_eq_card`, `FiniteFieldsAndCharacterSums:FF.1`, `FiniteFieldsAndCharacterSums:FF.1/stickelberger-relation`.

Source: [adhikari-reciprocity-2000](https://www.bprim.org/sites/default/files/recipro1.pdf), §4, Theorem 4.1 (p. 69); proof pp. 70–73. The node is this theorem. The source proves it from Stickelberger's theorem and from two further facts it cites from Ireland and Rosen (Proposition 4.6 and the relation before (25)); those inputs are recorded as a gap.

Proof or interface frontier: The proof of Eisenstein reciprocity in the source read (Adhikari §4) rests on three inputs it does not prove. The first, Stickelberger's theorem (Φ(P)) = P^γ, γ = Σ t σ_t^(-1) (Proposition 4.3), is now planned by FiniteFieldsAndCharacterSums FF.1 as FiniteFieldsAndCharacterSums:FF.1/stickelberger-relation, which the Eisenstein reciprocity node cites. The other two have no owner: ε(α) = ±1 for primary α (Proposition 4.6, cited to Ireland–Rosen), and (Φ(P) / P')_l = (N P' / P)_l for primes with coprime norms (cited to Ireland–Rosen). A public source for them exists in the same proceedings (S. A. Katre, 'Gauss-Jacobi sums and Stickelberger's theorem', bprim.org, jacn.pdf), not read here. Until an owner plans these two statements, the Eisenstein reciprocity node rests on them as a recorded gap.

Proof or interface frontier: An inherited explicit gap affects this planned proof: Eisenstein reciprocity still lacks two exact inputs, and least-Pisot still relies on the unresolved analytic Smyth core. The theorem statement is source-supported but this node is not a closed lemma plan.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

### Continuation frontier

- Biquadratic (quartic) reciprocity in ℤ[i] with its supplements. The one public statement read (Relyea, Theorem 4.4) is misstated and leaves primary undefined (source issues E203, E204), and gives no proof; Ireland–Rosen chapter 9, Lemmermeyer and Cassels–Fröhlich are not public. A continuation job should obtain a public source that defines primary Gaussian integers (α ≡ 1 mod (1 + i)^3), the quartic character at composite primary elements, and proves the law by Jacobi sums as for cubic reciprocity, and plan it on the power residue symbol with n = 4 in ℚ(i).
- The two inputs of Eisenstein reciprocity besides Stickelberger's relation (now FiniteFieldsAndCharacterSums:FF.1/stickelberger-relation), recorded as a gap: once an owner is fixed, decompose Adhikari §4 (Φ(P) and Proposition 4.2, Proposition 4.4, Propositions 4.5–4.6 and the relation (25)) into lemma nodes under the Eisenstein reciprocity node; Katre's article in the same proceedings is the public source to read.
- The explicit reciprocity laws at the places above n (the Hilbert symbol (a, b)_v for v | n, n > 2), which the power reciprocity law leaves as a product of local symbols: Artin–Hasse and Iwasawa formulas, for which no public source was read. The power reciprocity law is planned with those factors kept as Hilbert symbols, so no statement depends on them.
- Koymans–Milovic items 3–4 need the number-field quadratic law with explicit dyadic and infinite factors, dependence on the denominator modulo 8 times the numerator, and norm compatibility in a Galois extension. The existing power-reciprocity-law supplies the coprime odd case with unevaluated local symbols; power-residue-symbol-galois-equivariance is not the relative-norm formula. Read FIMR at its full hypotheses before decomposition. Import Hilbert reciprocity and the local symbols from their existing Tau Ceti owners; do not reconstruct them here.
- Calegari–Geraghty ext-zeros-binary-quadratic-form-mod-p remains an exact missing adapter: for odd p and a nonzero binary quadratic form, the number of projective zeros is 1 plus the Legendre symbol of r²−4mn. Separate the chart with m nonzero, the point at infinity when m=0, the repeated-root case and the excluded zero form. The discriminant is not the determinant of the symmetric coefficient matrix.
- Independent review frontier: 12 existing targets have the mathematical or interface obligations recorded under gaps. Resume those IDs directly; revisionResponse records corrections and checked signatures, without claiming their remaining proofs closed.

## CA.2. Sequences and generating functions

Connect recurrence sequences to rational generating series and companion matrices, then specialize formal identities on their analytic discs. Digit expansions and finite automata lead to finite kernels, Cartier operators, Christol and Cobham. Existing Bernoulli numbers, recurrence theory and combinatorial number families are inputs. Euler zigzag numbers and Eulerian descent counts are distinct families; the latter routed source remains open.

Landmarks: Minimal polynomial of a sequence; Rational generating functions; Lucas sequences; Euler numbers; Christol's theorem; Farey sequences.

<a id="CA-2-generating-polynomials-and-the-minimal-polynomial"></a>

### Linearly generated sequences and their minimal polynomial

`ClassicalArithmeticCompletion:CA.2/generating-polynomials-and-the-minimal-polynomial` · construction.

Let F be a field and V an F-vector space. For a polynomial g = ∑ⱼ aⱼXʲ ∈ F[X] and a sequence s = (sᵢ)_{i≥0} in V put g ⋆ s = ∑ⱼ aⱼ sⱼ. The sequence s is linearly generated if there are k ≥ 0 and c₀, …, c_{k−1} ∈ F with s_{k+i} = ∑_{j<k} cⱼ s_{j+i} for every i ≥ 0 (k = 0 means s = 0), and g is a generating polynomial of s if (Xⁱg) ⋆ s = 0 for every i ≥ 0. The generating polynomials of s form an ideal G(s) of F[X]; s is linearly generated exactly when G(s) ≠ 0; and the minimal polynomial of s is the monic generator of G(s) when G(s) ≠ 0 and 0 otherwise. It is the unique monic generating polynomial that divides every generating polynomial.

Hypotheses and conventions: F is a field; V is an F-vector space, not assumed finite dimensional; sequences are indexed by ℕ. The zero polynomial is a generating polynomial of every sequence; the minimal polynomial is 0 exactly when s is not linearly generated. The characterisation is 'the monic generating polynomial dividing every generating polynomial', not 'the monic polynomial dividing every generating polynomial' (the constant 1 divides everything).

API:

- `Sequence.star` (data): The pairing g ⋆ s = ∑ⱼ aⱼ • sⱼ of a polynomial g = ∑ aⱼXʲ with a sequence s.
- `Sequence.star_add` (simp): (g + h) ⋆ s = g ⋆ s + h ⋆ s (and (c g) ⋆ s = c • (g ⋆ s)).
- `Sequence.IsGeneratingPoly` (data): g is a generating polynomial of s: (Xⁱ g) ⋆ s = 0 for every i ≥ 0.
- `Sequence.IsLinearlyGenerated` (data): s satisfies s_{k+i} = ∑_{j<k} cⱼ s_{j+i} for some k ≥ 0 and cⱼ ∈ F; the field F is an explicit argument.
- `Sequence.generatingIdeal` (data): The ideal G(s) of generating polynomials.
- `Sequence.mem_generatingIdeal` (characterisation): g ∈ G(s) iff g is a generating polynomial of s.
- `Sequence.minPoly` (data): The monic generator of G(s), and 0 when s is not linearly generated.
- `Sequence.minPoly_dvd` (characterisation): g is a generating polynomial of s iff minPoly s divides g.
- `Sequence.minPoly_monic` (structure): If s is linearly generated, minPoly s is monic.
- `Sequence.isLinearlyGenerated_iff` (characterisation): s is linearly generated iff minPoly s ≠ 0.
- `Sequence.minPoly_of_powers` (compatibility): For α in an F-algebra A, minPoly of (αⁱ)_{i≥0} equals Mathlib's minpoly F α.
- `Sequence.isSolution_iff_charPoly_mem` (compatibility): For E : LinearRecurrence F and u : ℕ → F, E.IsSolution u iff E.charPoly ∈ G(u); hence minPoly u divides the characteristic polynomial of every recurrence u satisfies.

Unit tests:

- `Sequence.minPoly_zero` (degenerate): The zero sequence has minimal polynomial 1.
- `Sequence.isGeneratingPoly_one_iff` (characterisation): 1 is a generating polynomial of s iff s = 0 (Shoup Exercise 18.1).
- `Sequence.minPoly_fib` (computation): The Fibonacci sequence, over ℚ, has minimal polynomial X² − X − 1.
- `Sequence.minPoly_geom` (compatibility): For a ∈ F the geometric sequence (aⁿ) has minimal polynomial X − C a, which is `minpoly F a`.
- `Sequence.not_isLinearlyGenerated_two_pow_sq` (non-example): The sequence n ↦ 2^{n²} over ℚ is not linearly generated (it grows faster than any solution of a recurrence with rational coefficients), so its minimal polynomial is 0.

Further acceptance checks:

- For the Fibonacci sequence over ℚ the minimal polynomial is X² − X − 1, and for a geometric sequence (aⁿ) it is X − a.
- The only sequence with generating polynomial 1 is the zero sequence (Shoup Exercise 18.1), so minPoly 0 = 1 and minPoly s = 1 forces s = 0.
- For powers of an element the construction returns Mathlib's `minpoly`, including the non-integral case where both are 0.

Proof sketch:

1. Define the pairing g ⋆ s by `Polynomial.sum`; it is additive in g and F-homogeneous (Shoup's two observations in the proof of Theorem 18.1).
2. G(s) is closed under addition and scalar multiplication by additivity and homogeneity, and under multiplication by X because (Xⁱ(Xg)) ⋆ s = (X^{i+1}g) ⋆ s; a subset of F[X] with these closures is an ideal (Shoup Exercise 7.27), which defines `generatingIdeal`.
3. F[X] is a principal ideal ring (`IsPrincipalIdealRing`); take the generator `Submodule.IsPrincipal.generator` of G(s), normalise it to be monic when nonzero, and define `minPoly` as that monic generator (0 when G(s) = 0). Divisibility characterisation: g ∈ G(s) iff minPoly ∣ g.
4. Linearly generated ⇔ G(s) ≠ 0: a recurrence with coefficients cⱼ gives the monic generating polynomial X^k − ∑ cⱼXʲ; conversely a nonzero generating polynomial of degree k with leading coefficient a_k gives cⱼ = −aⱼ/a_k (Shoup, p. 487).
5. Compatibility with Mathlib's recurrences: for V = F, E.IsSolution u holds iff E.charPoly ∈ G(u), because (Xⁱ·E.charPoly) ⋆ u = u(i + order) − ∑ E.coeffs j · u(i + j).
6. Compatibility with `minpoly` (Shoup Example 18.2): for α in an F-algebra A, g ⋆ (αⁱ)ᵢ = aeval α g, so G((αⁱ)) is the kernel of `Polynomial.aeval α`, whose monic generator is `minpoly F α` when α is integral and which is 0 otherwise (Mathlib's convention), so minPoly (αⁱ) = minpoly F α in all cases.

Direct prerequisites: `mathlib:Ideal.span`, `mathlib:IsPrincipalIdealRing`, `mathlib:Submodule.IsPrincipal.generator`, `mathlib:Polynomial.Monic`, `mathlib:minpoly`, `mathlib:Polynomial.aeval`, `mathlib:LinearRecurrence`, `mathlib:LinearRecurrence.IsSolution`, `mathlib:LinearRecurrence.charPoly`.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Section 18.1, printed p. 486, the definition of a linearly generated sequence. The node's predicate `Sequence.IsLinearlyGenerated`, with k = 0 allowed as in the source's convention that the zero polynomial is a generating polynomial.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Section 18.1, printed p. 487, Theorem 18.1 and the paragraph after it. The ideal `generatingIdeal`, the monic generator `minPoly` and the API items `minPoly_dvd` and `isLinearlyGenerated_iff`.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Section 18.1, printed p. 488, Example 18.2. The compatibility item `minPoly_of_powers`; the node extends it to every F-algebra, using Mathlib's convention that `minpoly` is 0 off the integral elements.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Section 18.1, printed p. 489, Exercise 18.1. The unit test `Sequence.isGeneratingPoly_one_iff`.

Proof or interface frontier: Five bundled definitions plus ideal/principal/compatibility proofs require separate declaration nodes at lemma level. Promote minPoly API if consumed. Normalized denominator discussion needs Q(0)=1; no nonzero-constant assumption on minPoly.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-rational-power-series"></a>

### The rationality predicate for a formal power series

`ClassicalArithmeticCompletion:CA.2/rational-power-series` · definition.

Let K be a field. A formal power series f ∈ K⟦X⟧ is rational if there are polynomials P, Q ∈ K[X] with Q(0) ≠ 0 and f·Q = P in K⟦X⟧; equivalently f = P·Q⁻¹ in K⟦X⟧, or f lies in K⟦X⟧ ∩ K(X) inside the Laurent series field K⸨X⸩. No degree condition on P is part of the predicate. The rational power series form a subring of K⟦X⟧ closed under inversion of units, and f = ∑ aₙXⁿ is rational exactly when (aₙ) is linearly generated.

Hypotheses and conventions: K is a field. The denominator has nonzero constant term, so its inverse exists in K⟦X⟧. The predicate is about the series, not about a chosen pair (P, Q).

API:

- `PowerSeries.IsRational` (data): f is rational: f·Q = P for polynomials P, Q with Q(0) ≠ 0.
- `PowerSeries.IsRational.polynomial` (constructor): Every polynomial, viewed in K⟦X⟧, is rational.
- `PowerSeries.IsRational.inv` (constructor): If f is rational then so is f⁻¹ (Mathlib's inverse, 0 when constantCoeff f = 0).
- `PowerSeries.IsRational.subring` (structure): The rational power series form a subring of K⟦X⟧.
- `PowerSeries.isRational_iff_mem_range` (characterisation): f is rational iff its image in K⸨X⸩ is the image of some r ∈ K(X) (RatFunc).
- `PowerSeries.isRational_mk_iff` (characterisation): ∑ aₙXⁿ is rational iff (aₙ) is linearly generated over K.

Unit tests:

- `PowerSeries.isRational_mk_one` (computation): The geometric series ∑ Xⁿ is rational: (1 − X)·∑ Xⁿ = 1.
- `PowerSeries.mk_fib_mul` (computation): Over ℚ, (∑ Fₙ Xⁿ)·(1 − X − X²) = X, the Fibonacci witness of rationality (Stanley Example 4.1.2).
- `PowerSeries.not_isRational_exp` (non-example): The exponential series ∑ Xⁿ/n! over ℚ is not rational: its coefficient sequence satisfies no linear recurrence.

Further acceptance checks:

- The predicate does not depend on the pair (P, Q).
- Polynomials and the geometric series are rational; the exponential series over ℚ is not.
- Rationality is equivalent to the coefficient sequence being linearly generated, which is the bridge to Stanley's Theorem 4.1.1 and to the minimal polynomial.

Proof sketch:

1. Define `PowerSeries.IsRational f` as ∃ P Q, Q.coeff 0 ≠ 0 ∧ f * Q = P, with polynomials coerced to power series (`Polynomial.coeToPowerSeries.ringHom`).
2. Polynomials are rational (Q = 1). Closure under +, ·: (P₁/Q₁) ± (P₂/Q₂) and products have denominator Q₁Q₂ with nonzero constant term; this gives the subring.
3. Inverse: if f·Q = P then f⁻¹ = Q·P⁻¹ when P(0) ≠ 0, and Mathlib's f⁻¹ is 0 when constantCoeff f = 0 (`PowerSeries.inv_eq_zero`), so f⁻¹ is always rational.
4. Laurent-series characterisation: the embedding K⟦X⟧ → K⸨X⸩ (`HahnSeries.ofPowerSeries`) is compatible with the embedding of K(X) (`RatFunc.coe_coe`), so f·Q = P iff f = P/Q in K⸨X⸩.
5. Coefficient characterisation: if f·Q = P then the coefficient sequence has generating polynomial X^N·reverse(Q) for N ≥ deg P + 1 − deg Q; conversely a nonzero generating polynomial g = X^m h with h(0) ≠ 0 gives Q = reverse(g), with Q(0) = leading coefficient of g ≠ 0, and f·Q a polynomial (uses the minimal-polynomial node).

Direct prerequisites: `mathlib:PowerSeries`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mul`, `mathlib:PowerSeries.inv`, `mathlib:PowerSeries.inv_eq_zero`, `mathlib:Polynomial.coeToPowerSeries.ringHom`, `mathlib:RatFunc`, `mathlib:LaurentSeries`, `mathlib:RatFunc.coe_coe`, `mathlib:HahnSeries.ofPowerSeries`, `mathlib:Polynomial.reverse`, [CA.2/generating-polynomials-and-the-minimal-polynomial](#CA-2-generating-polynomials-and-the-minimal-polynomial).

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 4.1, p. 535, the definition preceding Theorem 4.1.1. The predicate, with Q(0) ≠ 0 and no degree normalisation; the normalisation deg P < deg Q is a condition of Theorem 4.1.1, not of rationality.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 4.1, p. 535. The API item `PowerSeries.isRational_iff_mem_range` (the image of K(X) in K⸨X⸩ meets K⟦X⟧ exactly in the rational series) and the subring structure.

Proof or interface frontier: Rational-power-series construction folds IsRational, subring and coefficient-characterisation theorem. Promote isRational_mk_iff if consumed elsewhere; coefficient convolution/reversal proof separate if not routine. Definition itself/sourcecorrect.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-linear-recurrence-of-a-monic-polynomial"></a>

### The linear recurrence of a monic polynomial

`ClassicalArithmeticCompletion:CA.2/linear-recurrence-of-a-monic-polynomial` · construction.

For a commutative ring R and p ∈ R[X], `LinearRecurrence.ofMonic p` is Mathlib's `LinearRecurrence R` of order natDegree p with coefficients −p.coeff i (i < natDegree p): its solutions are the u with u(n + d) = −∑_{i<d} p.coeff i · u(n + i). If p is monic its characteristic polynomial is p, and every recurrence E over a nontrivial ring is ofMonic E.charPoly. Over a field, u solves ofMonic p (p monic) iff p is a generating polynomial of u.

Hypotheses and conventions: R is a commutative ring; the monic hypothesis is needed only for the characteristic polynomial. Order 0 (p = 1) is the recurrence whose only solution is 0.

API:

- `LinearRecurrence.ofMonic` (constructor): The recurrence of p: order p.natDegree, coefficients −p.coeff i.
- `LinearRecurrence.order_ofMonic` (simp): (ofMonic p).order = p.natDegree (by definition).
- `LinearRecurrence.charPoly_ofMonic` (characterisation): For monic p, (ofMonic p).charPoly = p.
- `LinearRecurrence.ofMonic_charPoly` (equivalence): Over a nontrivial ring, ofMonic E.charPoly = E for every recurrence E.
- `LinearRecurrence.isSolution_ofMonic_iff` (compatibility): Over a field, for monic p: u solves ofMonic p iff p is a generating polynomial of u (Shoup's sense).

Unit tests:

- `LinearRecurrence.isSolution_ofMonic_fib` (computation): Over ℚ the Fibonacci sequence solves ofMonic (X² − X − 1).
- `LinearRecurrence.isSolution_ofMonic_one` (degenerate): Over a nontrivial ring, u solves ofMonic 1 iff u = 0.
- `LinearRecurrence.isSolution_ofMonic_X` (non-example): u solves ofMonic X iff u(n + 1) = 0 for all n: a zero constant term gives solutions (δ₀) that are not exponential polynomials.

Further acceptance checks:

- ofMonic (X² − X − 1) over ℚ is the Fibonacci recurrence; ofMonic 1 has only the zero solution; ofMonic X forces u(n + 1) = 0 for all n.
- Its characteristic polynomial is the given monic polynomial, and it inverts `LinearRecurrence.charPoly`.

Proof sketch:

1. Define ofMonic p := ⟨p.natDegree, fun i ↦ −p.coeff i⟩; the order is p.natDegree by definition, so the state vectors of the companion-matrix nodes live in Fin p.natDegree → R without a cast.
2. charPoly (ofMonic p) = X^d + ∑_{i<d} p.coeff i Xⁱ = p for monic p (compare coefficients; `LinearRecurrence.charPoly`).
3. ofMonic E.charPoly = E: E.charPoly has natDegree E.order when R is nontrivial (`LinearRecurrence.charPoly_monic`) and coefficient −E.coeffs i in degree i < order.
4. Over a field: (Xⁱ p) ⋆ u = u(i + d) + ∑ p.coeff j u(i + j), so the recurrence is the generating-polynomial condition.

Direct prerequisites: `mathlib:LinearRecurrence`, `mathlib:LinearRecurrence.charPoly`, `mathlib:LinearRecurrence.charPoly_monic`, `mathlib:LinearRecurrence.IsSolution`, `mathlib:Polynomial.Monic`, `mathlib:Polynomial.natDegree`, [CA.2/generating-polynomials-and-the-minimal-polynomial](#CA-2-generating-polynomials-and-the-minimal-polynomial).

Source: [evertse-diophantine-2019](https://pub.math.leidenuniv.nl/~evertsejh/dio19-8.pdf), Section 8.4, printed p. 172, (8.18) and the definition of the companion polynomial. The recurrence attached to the monic polynomial f_U; Evertse's coefficient c_i is ofMonic's −p.coeff (k − i). The condition c_k ≠ 0 is the nonzero constant term, which the construction does not impose.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Section 18.1, printed p. 487. For monic g (a_k = 1) this is exactly ofMonic g, and the API item `isSolution_ofMonic_iff`.

Proof or interface frontier: Promote charPoly_ofMonic and isSolution_ofMonic_iff to lemma nodes because consumed by nodes45,46. Nontrivial ring for inverse charPoly handled correctly.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-exponential-polynomial-solutions"></a>

### Exponential polynomials solve the recurrence of their characteristic factor

`ClassicalArithmeticCompletion:CA.2/exponential-polynomial-solutions` · lemma.

Let K be a field of characteristic 0, E a linear recurrence over K, θ ∈ K and j ≥ 0. If (X − θ)^{j+1} divides E.charPoly, then n ↦ nʲθⁿ is a solution of E. Consequently every n ↦ g(n)θⁿ with deg g < rootMultiplicity θ (E.charPoly) is a solution.

Hypotheses and conventions: K is a field of characteristic 0, which is the generality the closed-form nodes use; the argument itself works over any commutative ring. θ = 0 is allowed: n ↦ nʲ0ⁿ is 0 for j ≥ 1 and δ₀ for j = 0, and both solve E when X^{j+1} ∣ E.charPoly.

Further acceptance checks:

- For E.charPoly = (X − 1)² the sequences 1 and n are solutions, and n² is not.
- For simple roots (j = 0) this is Mathlib's `LinearRecurrence.geom_sol_iff_root_charPoly`.

Proof sketch:

1. Write the recurrence as the vanishing of L(u)(n) = u(n + d) − ∑ cᵢ u(n + i) = ∑_i aᵢ u(n + i) with a = coefficients of E.charPoly.
2. For u(n) = C(n, k) θ^{n−k} (the k-th Hasse derivative of Xⁿ at θ), L(u)(n) = (Hasse derivative D^{(k)} of X^n·E.charPoly)(θ) = ∑_{m ≤ k} (D^{(m)}Xⁿ)(θ)(D^{(k−m)}E.charPoly)(θ), which vanishes for k ≤ j because θ is a root of E.charPoly of multiplicity ≥ j + 1 (`Polynomial.lt_rootMultiplicity_iff_isRoot_iterate_derivative`, `Polynomial.hasseDeriv`).
3. Since nʲ = ∑_{k≤j} k!·S(j, k)·C(n, k) with S the Stirling numbers of the second kind, n ↦ nʲθⁿ = ∑_{k≤j} k!·S(j, k)·θᵏ·(C(n, k)θ^{n−k}) is a combination of these solutions (both sides vanish at n < k); for θ = 0 check the cases j = 0 (δ₀) and j ≥ 1 (the zero sequence) directly.
4. The consequence follows by linearity of the solution space (`LinearRecurrence.solSpace`).

Direct prerequisites: `mathlib:LinearRecurrence.IsSolution`, `mathlib:LinearRecurrence.charPoly`, `mathlib:LinearRecurrence.solSpace`, `mathlib:LinearRecurrence.geom_sol_iff_root_charPoly`, `mathlib:Polynomial.hasseDeriv`, `mathlib:Polynomial.lt_rootMultiplicity_iff_isRoot_iterate_derivative`, `mathlib:Nat.pow_eq_sum_stirlingSecond_mul_descFactorial`.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Proof of Theorem 4.1.1, p. 536. The coefficient sequences n ↦ C(n + j − 1, j − 1)γⁿ of the partial fractions (1 − γx)^{−j} are the solutions this lemma produces (a polynomial of degree j − 1 in n times γⁿ); the recurrence side is the denominator (1 − γx)^j, whose reverse is (X − γ)^j.

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Topic: Linear Recurrences, printed p. 478. The case j = 0 (simple roots); the lemma is the repeated-root extension that the text says it does not cover.

Proof or interface frontier: Source supports char0 repeated-root extension. Proof uses Stirling-number expansion and Hasse product/derivative multiplicity. Must name exact pinned suppliers or add supporting lemma; mere hasseDeriv definition and ordinary derivative equivalence do not supply these identities.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-exponential-polynomials-are-linearly-independent"></a>

### Exponential polynomials in distinct nonzero bases are linearly independent

`ClassicalArithmeticCompletion:CA.2/exponential-polynomials-are-linearly-independent` · lemma.

Let K be a field of characteristic 0, S ⊆ K a finite set of nonzero elements and g : K → K[X]. If ∑_{θ∈S} g_θ(n)θⁿ = 0 for every n ∈ ℕ, then g_θ = 0 for every θ ∈ S. Equivalently the functions n ↦ nʲθⁿ (θ ∈ S, j ≥ 0) are linearly independent over K.

Hypotheses and conventions: The θ ∈ S are distinct (S is a set) and nonzero; for θ = 0 the functions nʲ0ⁿ (j ≥ 1) vanish identically. Characteristic 0 is needed: over 𝔽_p, n ↦ n^p − n is the zero function on ℕ.

Further acceptance checks:

- 2ⁿ + 3ⁿ − 5ⁿ is not identically zero (Evertse's example has u₀ = 1).
- The statement fails for θ = 0 (nʲ0ⁿ = 0 for j ≥ 1) and in characteristic p, which is why both hypotheses are in the statement.
- It gives the uniqueness half of Evertse's Theorem 8.17 and 'u = 0 iff all gᵢ = 0' for the Skolem–Mahler–Lech node of DT.2.

Proof sketch:

1. Induct on N = ∑_{θ∈S} (deg g_θ + 1) (with deg 0 = −1). Let Δ_μ u(n) = u(n + 1) − μ u(n).
2. For θ ≠ μ, Δ_μ(g(n)θⁿ) = (θ g(n + 1) − μ g(n))θⁿ, whose polynomial factor has the same degree as g and leading coefficient multiplied by θ − μ ≠ 0; Δ_θ(g(n)θⁿ) = (g(n + 1) − g(n))θ^{n+1}, whose polynomial factor has degree deg g − 1 in characteristic 0.
3. Pick θ₀ ∈ S with g_{θ₀} ≠ 0 and apply Δ_{θ₀} to the vanishing sum: the result is again a vanishing exponential polynomial with smaller N; by induction all its coefficients vanish, so every g_θ with θ ≠ θ₀ is 0 and g_{θ₀} is constant; then g_{θ₀}θ₀ⁿ = 0 with θ₀ ≠ 0 forces g_{θ₀} = 0.
4. Equivalently (Stanley's route): the generating functions ∑_n g_θ(n)θⁿxⁿ are combinations of the partial fractions (1 − θx)^{−j}, and multiplying a relation by (1 − θx)^j and setting x = 1/θ kills all but one coefficient.

Direct prerequisites: `mathlib:Polynomial.eval`, `mathlib:Polynomial.natDegree`, `mathlib:Polynomial.degree_lt_wf`.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Proof of Theorem 4.1.1, p. 536. The linear independence of the partial fractions R_{ij} = (1 − γᵢx)^{−j}, which is the lemma for their coefficient sequences; the node's proof steps give the equivalent elementary difference-operator argument.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Proof of Theorem 4.1.1, p. 536. This lemma is exactly the missing uniqueness statement, which Stanley obtains from the dimension count.

<a id="CA-2-closed-form-of-a-complex-linear-recurrence"></a>

### Closed form of complex linear recurrence sequences (Evertse, Theorem 8.17)

`ClassicalArithmeticCompletion:CA.2/closed-form-of-a-complex-linear-recurrence` · theorem.

Let E be a linear recurrence over ℂ (Mathlib's `LinearRecurrence ℂ`) whose characteristic polynomial E.charPoly = ∏_{i=1}^m (X − θᵢ)^{eᵢ} (θᵢ distinct) has nonzero constant term, and let u : ℕ → ℂ be a solution of E. Then there are polynomials g₁, …, g_m ∈ ℂ[X] with deg gᵢ < eᵢ such that u(h) = ∑ᵢ gᵢ(h)θᵢʰ for every h ≥ 0, and they are uniquely determined by u. In Lean form: ∃! g : ℂ → ℂ[X], (∀ θ, deg (g θ) < rootMultiplicity θ E.charPoly) ∧ ∀ h, u h = ∑_{θ ∈ roots} (g θ)(h) θʰ. In particular (simple roots) u(h) = ∑ gᵢθᵢʰ with constants gᵢ, and u = 0 iff all gᵢ = 0.

Hypotheses and conventions: E.charPoly.coeff 0 ≠ 0 (Evertse's c_k ≠ 0): all θᵢ are nonzero. Without it the statement fails: for ofMonic X the solution δ₀ is not an exponential polynomial with deg g < mult. The recurrence need not be the minimal one; for a non-minimal recurrence some gᵢ may vanish. The uniqueness is over all g : ℂ → ℂ[X]; the degree condition forces g θ = 0 when θ is not a root.

Further acceptance checks:

- Evertse's example: uₕ = 10u_{h−1} − 31u_{h−2} + 30u_{h−3}, u₀ = 1, u₁ = 0, u₂ = −12 has companion polynomial (X − 2)(X − 3)(X − 5) and uₕ = 2ʰ + 3ʰ − 5ʰ (the source prints the constants wrongly; see the source issues).
- Repeated root: for E.charPoly = (X − 1)², u(h) = a + b h with a, b uniquely determined by u(0), u(1).
- Fibonacci: F_h = (φʰ − φ̄ʰ)/√5, with constants ±1/√5 as the unique gᵢ.

Proof sketch:

1. ℂ is algebraically closed (`Complex.isAlgClosed`), so the monic E.charPoly splits: E.charPoly = ∏_{θ ∈ roots.toFinset} (X − θ)^{mult θ} (`Polynomial.Splits.eq_prod_roots_of_monic`, `Polynomial.count_roots`), and ∑ mult θ = order (`IsAlgClosed.card_roots_eq_natDegree`).
2. The d = order functions n ↦ nʲθⁿ (θ a root, j < mult θ) are solutions (exponential-polynomial-solutions) and linearly independent (exponential-polynomials-are-linearly-independent; θ ≠ 0 by the constant-term hypothesis).
3. The solution space has dimension d (`LinearRecurrence.solSpace_rank`, via `LinearRecurrence.toInit`), so these d independent solutions form a basis; expanding u in it gives the gᵢ (existence) and independence gives uniqueness.
4. Evertse's own proof passes through the entire function y(z) = ∑ uₕ zʰ/h! and the solution space of the linear ODE y^{(k)} = c₁y^{(k−1)} + ⋯ + c_k y; the dimension count above is the discrete form of the same argument and needs no ODE theory.

Direct prerequisites: [CA.2/exponential-polynomial-solutions](#CA-2-exponential-polynomial-solutions), [CA.2/exponential-polynomials-are-linearly-independent](#CA-2-exponential-polynomials-are-linearly-independent), `mathlib:LinearRecurrence.solSpace`, `mathlib:LinearRecurrence.solSpace_rank`, `mathlib:LinearRecurrence.toInit`, `mathlib:LinearRecurrence.charPoly_monic`, `mathlib:Polynomial.Splits.eq_prod_roots_of_monic`, `mathlib:IsAlgClosed`, `mathlib:Complex.isAlgClosed`, `mathlib:IsAlgClosed.card_roots_eq_natDegree`, `mathlib:Polynomial.count_roots`, `mathlib:Polynomial.rootMultiplicity`.

Source: [evertse-diophantine-2019](https://pub.math.leidenuniv.nl/~evertsejh/dio19-8.pdf), Section 8.4, Theorem 8.17, printed p. 172. The existence part; (8.19) continues 'u_h = g₁(h)θ₁^h + · · · + g_m(h)θ_m^h for h ⩾ 0'. The node adds the uniqueness requested by DT.2 and states it for any recurrence with nonzero constant term, not only the minimal one.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Theorem 4.1.1(iii) and proof, pp. 535 to 536. The same closed form for the recurrence with reversed characteristic polynomial; the dimension count in Stanley's proof gives uniqueness.

<a id="CA-2-closed-forms-satisfy-a-linear-recurrence"></a>

### Exponential polynomials are linear recurrence sequences

`ClassicalArithmeticCompletion:CA.2/closed-forms-satisfy-a-linear-recurrence` · theorem.

Let S ⊆ ℂ be finite, e : ℂ → ℕ and g : ℂ → ℂ[X] with deg g_θ < e_θ for θ ∈ S. Then h ↦ ∑_{θ∈S} g_θ(h)θʰ is a solution of the recurrence ofMonic (∏_{θ∈S}(X − θ)^{e_θ}), whose characteristic polynomial is that product; if every θ ∈ S is nonzero, the recurrence has nonzero constant term.

Hypotheses and conventions: No hypothesis on θ = 0 is needed for the solution statement; nonzero θ give Evertse's c_k ≠ 0.

Further acceptance checks:

- 2ʰ + 3ʰ − 5ʰ solves the recurrence of (X − 2)(X − 3)(X − 5) = X³ − 10X² + 31X − 30.
- h ↦ h solves the recurrence of (X − 1)², and h ↦ h² does not solve it.

Proof sketch:

1. For θ ∈ S and j < e_θ, (X − θ)^{j+1} divides ∏(X − θ')^{e_θ'} = charPoly (ofMonic ∏…) (`LinearRecurrence.charPoly_ofMonic`, the product being monic), so n ↦ nʲθⁿ is a solution (exponential-polynomial-solutions).
2. Expand each g_θ in the monomials and use linearity of the solution space.
3. The constant term of the product is ∏(−θ)^{e_θ}, nonzero iff no θ with e_θ > 0 is 0.

Direct prerequisites: [CA.2/exponential-polynomial-solutions](#CA-2-exponential-polynomial-solutions), [CA.2/linear-recurrence-of-a-monic-polynomial](#CA-2-linear-recurrence-of-a-monic-polynomial), `mathlib:LinearRecurrence.solSpace`, `mathlib:Polynomial.Monic`.

Source: [evertse-diophantine-2019](https://pub.math.leidenuniv.nl/~evertsejh/dio19-8.pdf), Section 8.4, Theorem 8.17 (last sentence), printed p. 172. The node, with the recurrence named explicitly: the monic polynomial ∏(X − θᵢ)^{eᵢ}.

<a id="CA-2-rational-iff-linearly-generated"></a>

### Rational generating functions, linear recurrences and closed forms (Stanley, Theorem 4.1.1)

`ClassicalArithmeticCompletion:CA.2/rational-iff-linearly-generated` · theorem.

Fix complex numbers α₁, …, α_d with d ≥ 1 and α_d ≠ 0, and put Q(x) = 1 + α₁x + ⋯ + α_dx^d. For f : ℕ → ℂ the following are equivalent: (i) ∑ f(n)xⁿ = P(x)/Q(x) with P a polynomial of degree less than d; (ii) for every n ≥ 0, f(n + d) + α₁f(n + d − 1) + ⋯ + α_d f(n) = 0; (iii) for every n ≥ 0, f(n) = ∑ᵢ Pᵢ(n)γᵢⁿ, where Q(x) = ∏ᵢ(1 − γᵢx)^{dᵢ} with the γᵢ distinct and nonzero, and Pᵢ is a polynomial of degree less than dᵢ.

Hypotheses and conventions: The αᵢ are complex, α_d ≠ 0: Q has degree exactly d and Q(0) = 1. The γᵢ are the reciprocals of the roots of Q and dᵢ their multiplicities. (iii) has polynomial coefficients; constants suffice only when Q has distinct roots.

Further acceptance checks:

- The closed form has polynomial coefficients of degree < multiplicity; with Q = (1 − x)² the solutions are f(n) = a + bn, and constant coefficients would be wrong.
- Fibonacci (Stanley Example 4.1.2): Q = 1 − x − x², P = x, Fₙ = (φⁿ − φ̄ⁿ)/√5.
- Stanley Example 4.1.3: f(n) = 2f(n − 1) + f(n − 2), f(0) = 1, f(1) = 3 gives (1 + x)/(1 − 2x − x²) and f(n) = ((1 + √2)^{n+1} + (1 − √2)^{n+1})/2.

Proof sketch:

1. (i) ⇔ (ii): multiplying ∑ f(n)xⁿ by Q and comparing coefficients, the coefficient of x^{n+d} of Q·∑ f(n)xⁿ is the left side of (ii); it vanishes for all n iff the product is a polynomial of degree < d (`PowerSeries.coeff_mul`; rational-power-series).
2. (ii) is the recurrence ofMonic (reverse Q), where reverse Q = X^d Q(1/X) = X^d + α₁X^{d−1} + ⋯ + α_d is monic (its leading coefficient is Q(0) = 1) with constant term α_d ≠ 0 and roots exactly the γᵢ with multiplicities dᵢ (`Polynomial.reverse`).
3. (ii) ⇔ (iii): by closed-form-of-a-complex-linear-recurrence (existence) and closed-forms-satisfy-a-linear-recurrence (converse) applied to the recurrence of reverse(Q).
4. Stanley's proof instead compares the four spaces V₁ to V₄ of dimension d, the independence of the partial fractions being exponential-polynomials-are-linearly-independent; both routes use the dimension d of the solution space.

Direct prerequisites: [CA.2/rational-power-series](#CA-2-rational-power-series), [CA.2/linear-recurrence-of-a-monic-polynomial](#CA-2-linear-recurrence-of-a-monic-polynomial), [CA.2/closed-form-of-a-complex-linear-recurrence](#CA-2-closed-form-of-a-complex-linear-recurrence), [CA.2/closed-forms-satisfy-a-linear-recurrence](#CA-2-closed-forms-satisfy-a-linear-recurrence), [CA.2/exponential-polynomials-are-linearly-independent](#CA-2-exponential-polynomials-are-linearly-independent), `mathlib:PowerSeries.coeff_mul`, `mathlib:Polynomial.reverse`, `mathlib:Polynomial.roots`, `mathlib:LinearRecurrence.charPoly`.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 4.1, Theorem 4.1.1, p. 535. The hypotheses of the node; conditions (i) and (ii) follow on p. 535 and (iii) on p. 536.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Theorem 4.1.1(i), (ii), p. 535. Conditions (i) and (ii) of the node's TFAE.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Proof of Theorem 4.1.1, p. 536. The dimension count that the proof steps reorganise through the closed-form nodes.

<a id="CA-2-companion-matrix"></a>

### The companion matrix of a polynomial

`ClassicalArithmeticCompletion:CA.2/companion-matrix` · construction.

For a commutative ring R and p ∈ R[X] of natural degree d, the companion matrix C(p) ∈ M_d(R) has C(p)_{i+1,i} = 1 for i < d − 1, last column C(p)_{i,d−1} = −p.coeff i, and all other entries 0. For monic p it is the matrix of multiplication by X on R[X]/(p) in the basis 1, X, …, X^{d−1}; its transpose C(p)ᵀ is the state-transition matrix of the recurrence ofMonic p, sending (u(n), …, u(n + d − 1)) to (u(n + 1), …, u(n + d)).

Hypotheses and conventions: R is any commutative ring; p need not be monic for the definition, but every theorem about C(p) assumes p monic. Orientation is pinned: subdiagonal ones and coefficients in the last column (as Tau Ceti's `TauCeti.companionFinTwo` in rank 2); the recurrence uses the transpose, which is Mathlib's `LinearRecurrence.tupleSucc`.

API:

- `Polynomial.companion` (data): C(p): ones on the subdiagonal, −p.coeff i in the last column, indexed by Fin p.natDegree.
- `Polynomial.companion_apply` (simp): The entries of C(p).
- `Polynomial.leftMulMatrix_root_eq_companion` (compatibility): For monic p, the matrix of multiplication by the root of AdjoinRoot p in the power basis 1, X, …, X^{d−1} is C(p).
- `Polynomial.toLin'_companion_transpose` (compatibility): Matrix.toLin' C(p)ᵀ = (ofMonic p).tupleSucc, Mathlib's state shift of the recurrence.
- `Polynomial.det_companion` (simp): For monic p, det C(p) = (−1)^{natDegree p} · p.coeff 0.
- `Polynomial.minpoly_companion` (characterisation): Over a field, for monic p, minpoly K C(p) = p.
- `Polynomial.hasEigenvalue_companion_iff` (characterisation): Over a field, for monic p and q ∈ K: q is an eigenvalue of C(p) iff p(q) = 0 (no extension of scalars).

Unit tests:

- `Polynomial.companion_fib` (computation): C(X² − X − 1) over ℤ, reindexed along natDegree = 2, is [[0, 1], [1, 1]].
- `Polynomial.companion_quadratic` (compatibility): C(X² − tX + d) reindexed to Fin 2 is [[0, −d], [1, t]], the body of Tau Ceti's `TauCeti.companionFinTwo t d` (`TauCeti.companionFinTwo_def`).
- `Polynomial.charpoly_companion_one` (degenerate): C(1) is the empty matrix and its characteristic polynomial is 1.
- `Polynomial.companion_ne_transpose` (non-example): C(X² + 1) over ℤ is not equal to its transpose: the orientation (last column, not last row) is part of the definition.

Further acceptance checks:

- In rank 2, C(X² − tX + d) is [[0, −d], [1, t]], the body of `TauCeti.companionFinTwo t d`.
- Its characteristic polynomial is p (next node) and its minimal polynomial over a field is p (companion matrices are non-derogatory).
- The orientation matters: C(X² + 1) = [[0, −1], [1, 0]] is not its own transpose.

Proof sketch:

1. Define C(p) := Matrix.of fun i j ↦ if i = j + 1 then 1 else if j + 1 = d then −p.coeff i else 0, indexed by Fin p.natDegree.
2. Multiplication by X: X·Xʲ = X^{j+1} for j < d − 1 and X·X^{d−1} = X^d = −∑ p.coeff i Xⁱ modulo p; this is column j of C(p), so `Algebra.leftMulMatrix` of the root of `AdjoinRoot p` in `AdjoinRoot.powerBasis'` is C(p).
3. The transpose acts on a state vector (s₀, …, s_{d−1}) by (s₁, …, s_{d−1}, −∑ p.coeff i sᵢ), which is `LinearRecurrence.tupleSucc` of ofMonic p; hence `Matrix.toLin' C(p)ᵀ = (ofMonic p).tupleSucc` (no cast is needed because (ofMonic p).order is p.natDegree by definition).
4. Determinant: expanding along the last column, det C(p) = (−1)^d p.coeff 0 for monic p.

Direct prerequisites: [CA.2/linear-recurrence-of-a-monic-polynomial](#CA-2-linear-recurrence-of-a-monic-polynomial), `mathlib:Matrix.of`, `mathlib:Matrix.transpose`, `mathlib:Matrix.toLin'`, `mathlib:LinearRecurrence.tupleSucc`, `mathlib:Algebra.leftMulMatrix`, `mathlib:AdjoinRoot.powerBasis'`, `mathlib:Matrix.minpoly_dvd_charpoly`, `mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly`, `tauceti:TauCeti.companionFinTwo`, `tauceti:TauCeti.companionFinTwo_def`.

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Topic: Linear Recurrences, printed p. 477. The matrix displayed next (first row the coefficients, ones on the subdiagonal) acts on (f(n), …, f(n − k + 1)); it is C(p)ᵀ up to reversing the order of the coordinates, which the node pins to Mathlib's oldest-first tupleSucc.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Section 18.1, Example 18.1, printed pp. 487 to 488. The shift-register update is the action of C(p)ᵀ, with p = X^k − ∑ cⱼXʲ.

Proof or interface frontier: Promote toLin_companion_transpose used49. minpoly_companion API asserts cyclicity without a proof supplier: minpoly_dvd_charpoly proves only divisibility; basis/cyclic-vector argument needs its own lemma. Definition orientation and tests correct.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-characteristic-polynomial-of-the-companion-matrix"></a>

### The characteristic polynomial of the companion matrix

`ClassicalArithmeticCompletion:CA.2/characteristic-polynomial-of-the-companion-matrix` · theorem.

For every commutative ring R and every monic p ∈ R[X], the characteristic polynomial of C(p) is p: det(X·I − C(p)) = p.

Hypotheses and conventions: p monic; R any commutative ring (no field, no extension of scalars).

Further acceptance checks:

- charpoly C(X² − X − 1) = X² − X − 1; charpoly C(X − a) = X − a; charpoly C(1) = 1.
- Rank 2: charpoly [[0, −d], [1, t]] = X² − tX + d, matching `TauCeti.det_companionFinTwo` (det = d) and `TauCeti.trace_companionFinTwo` (trace = t).

Proof sketch:

1. Induct on d = natDegree p. For d = 0, p = 1 and C(p) is the empty matrix with charpoly 1.
2. For d ≥ 1 write p = X·p₁ + p.coeff 0 with p₁ monic of degree d − 1. Expand det(X·I − C(p)) along the first row (`Matrix.det_succ_row_zero`): the (0, 0) minor is X·I − C(p₁) shifted, contributing X·charpoly C(p₁) = X·p₁ by induction, and the (0, d − 1) entry p.coeff 0 has triangular minor with determinant (−1)^{d−1}·(−1)^{d−1}, contributing p.coeff 0.
3. Hefferon's hint (expanding down the final column and using induction) is the transposed form of the same computation; Mathlib's `Matrix.charpoly_transpose` identifies the two.
4. Over a field an alternative is `charpoly_leftMulMatrix`: C(p) is the matrix of multiplication by the root of AdjoinRoot p, whose minimal polynomial is p.

Direct prerequisites: [CA.2/companion-matrix](#CA-2-companion-matrix), `mathlib:Matrix.charpoly`, `mathlib:Matrix.det_succ_row_zero`, `mathlib:Matrix.charpoly_transpose`, `mathlib:Matrix.charpoly_monic`, `mathlib:charpoly_leftMulMatrix`, `tauceti:TauCeti.det_companionFinTwo`, `tauceti:TauCeti.trace_companionFinTwo`.

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Topic: Linear Recurrences, printed p. 477. The theorem, for the recurrence matrix (a transpose-and-reversal of C(p)); the sign ±(−λ^k + ⋯) of det(A − λI) is the sign convention det(λI − A) of Mathlib's charpoly.

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Topic: Linear Recurrences, Exercise 5, printed p. 480. The proof steps.

<a id="CA-2-linear-recurrence-as-a-matrix-power"></a>

### Solutions of a recurrence are orbits of the transposed companion matrix

`ClassicalArithmeticCompletion:CA.2/linear-recurrence-as-a-matrix-power` · theorem.

Let R be a commutative ring, p ∈ R[X] with d = natDegree p ≥ 1, and u : ℕ → R. Write s_n = (u(n), u(n + 1), …, u(n + d − 1)) ∈ R^d. Then u solves ofMonic p iff s_n = (C(p)ᵀ)ⁿ s₀ for every n ≥ 0; in that case u(n) is the first coordinate of (C(p)ᵀ)ⁿ s₀.

Hypotheses and conventions: d ≥ 1 (for d = 0 the state space is 0 and the equivalence fails: only u = 0 solves ofMonic 1). The state vector is ordered oldest first, as Mathlib's `LinearRecurrence.tupleSucc`.

Further acceptance checks:

- Fibonacci: (F_n, F_{n+1}) = ([[0, 1], [1, 1]])ⁿ (0, 1), the matrix being C(X² − X − 1)ᵀ = C(X² − X − 1).
- Hefferon's form v_n = T^{n−1} v₁ is the same statement with the coordinates in reverse order.

Proof sketch:

1. C(p)ᵀ s_n = (u(n + 1), …, u(n + d − 1), −∑ p.coeff i u(n + i)) by the companion-matrix API (`toLin'_companion_transpose`, `Matrix.mulVec`).
2. So s_{n+1} = C(p)ᵀ s_n for all n iff the last coordinates agree, which is the recurrence u(n + d) = −∑ p.coeff i u(n + i); induct on n for the power form.
3. Conversely s_n = (C(p)ᵀ)ⁿ s₀ for all n gives s_{n+1} = C(p)ᵀ s_n and hence the recurrence.

Direct prerequisites: [CA.2/companion-matrix](#CA-2-companion-matrix), [CA.2/linear-recurrence-of-a-monic-polynomial](#CA-2-linear-recurrence-of-a-monic-polynomial), `mathlib:LinearRecurrence.IsSolution`, `mathlib:LinearRecurrence.tupleSucc`, `mathlib:Matrix.mulVec`.

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Topic: Linear Recurrences, printed p. 475. The theorem for Fibonacci; the node states it for every monic p with the oldest-first state vector.

Source: [SHOUP.V2](https://shoup.net/ntb/ntb-v2.pdf), Section 18.1, Example 18.1, printed p. 488. The register is the state vector sₙ; its update is C(p)ᵀ.

<a id="CA-2-roots-are-eigenvalues-of-the-companion-matrix"></a>

### Roots of p are eigenvalues of the companion matrix, without extending scalars

`ClassicalArithmeticCompletion:CA.2/roots-are-eigenvalues-of-the-companion-matrix` · lemma.

Let R be a commutative ring, p ∈ R[X] monic with d = natDegree p ≥ 1, and q ∈ R. Then p(q) = 0 iff the vector (1, q, …, q^{d−1}) is an eigenvector of C(p)ᵀ with eigenvalue q. Over a field K, q ∈ K is an eigenvalue of C(p) iff p(q) = 0. No extension of scalars is made: eigenvalues are taken in R (or K) itself.

Hypotheses and conventions: p monic, natDegree p ≥ 1.

Further acceptance checks:

- Over ℚ, C(X² − 2) has no eigenvalue although its characteristic polynomial has real roots: eigenvalues are not taken after extending scalars.
- Over ℤ, (1, 1) is an eigenvector of C(X² − 3X + 2)ᵀ with eigenvalue 1 and (1, 2) with eigenvalue 2.

Proof sketch:

1. C(p)ᵀ(1, q, …, q^{d−1}) = (q, q², …, q^{d−1}, −∑ p.coeff i qⁱ); this equals q·(1, …, q^{d−1}) iff q^d = −∑ p.coeff i qⁱ, that is p(q) = 0. This is Mathlib's `LinearRecurrence.geom_sol_iff_root_charPoly` read on the first d terms.
2. Over a field: q is an eigenvalue of the endomorphism iff it is a root of its characteristic polynomial (`Module.End.hasEigenvalue_iff_isRoot_charpoly`), which is p (characteristic-polynomial-of-the-companion-matrix); eigenvalues of C(p) and C(p)ᵀ agree (`Matrix.charpoly_transpose`).

Direct prerequisites: [CA.2/companion-matrix](#CA-2-companion-matrix), [CA.2/characteristic-polynomial-of-the-companion-matrix](#CA-2-characteristic-polynomial-of-the-companion-matrix), [CA.2/linear-recurrence-of-a-monic-polynomial](#CA-2-linear-recurrence-of-a-monic-polynomial), `mathlib:LinearRecurrence.geom_sol_iff_root_charPoly`, `mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly`, `mathlib:Matrix.charpoly_transpose`, `mathlib:Polynomial.IsRoot`.

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Topic: Linear Recurrences, printed p. 478. The eigenvalue/eigenvector relation behind the diagonalisation; the node states the scalar-preserving part (eigenvectors (1, q, …, q^{d−1}) for roots q in the base ring).

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Topic: Linear Recurrences, Exercise 6, printed p. 480. The geometric solutions whose first d terms are the eigenvectors (the printed r_k^n should read r_i^n; see the source issues).

Proof or interface frontier: Two declarations (ring eigenvector identity and field HasEigenvalue) have separate proofs; split unless source proves simultaneously. Field API under47 and native only there; alignment needed.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-lucas-sequence-of-the-first-kind"></a>

### The Lucas sequence of the first kind Uₙ(P, Q)

`ClassicalArithmeticCompletion:CA.2/lucas-sequence-of-the-first-kind` · definition.

For a commutative ring R and P, Q ∈ R, the Lucas sequence of the first kind is U₀ = 0, U₁ = 1, U_{n+2} = P·U_{n+1} − Q·Uₙ. If α, β ∈ R satisfy α + β = P and αβ = Q then (α − β)Uₙ = αⁿ − βⁿ; for integer P, Q with α, β the roots of z² − Pz + Q, Uₙ = (αⁿ − βⁿ)/(α − β) is Carmichael's Dₙ.

Hypotheses and conventions: R is any commutative ring; P and Q are arbitrary (no coprimality, no non-degeneracy). Indexing starts at U₀ = 0, so U(1, −1) is Mathlib's Nat.fib with fib 0 = 0.

API:

- `lucasU` (data): Uₙ(P, Q): U₀ = 0, U₁ = 1, U_{n+2} = P U_{n+1} − Q Uₙ.
- `lucasU_zero` (simp): U₀ = 0.
- `lucasU_one` (simp): U₁ = 1.
- `lucasU_add_two` (simp): U_{n+2} = P U_{n+1} − Q Uₙ.
- `isSolution_lucasU` (compatibility): lucasU P Q solves the Mathlib recurrence ⟨2, ![−Q, P]⟩ (= ofMonic (X² − P X + Q)).
- `lucasU_mul_sub` (characterisation): If α + β = P and αβ = Q then (α − β)Uₙ = αⁿ − βⁿ (Binet).
- `map_lucasU` (functoriality): f (Uₙ(P, Q)) = Uₙ(f P, f Q) for a ring homomorphism f.
- `lucasU_succ_eq_eval_dickson` (compatibility): U_{n+1}(P, Q) = (dickson 2 Q n)(P), Mathlib's Dickson polynomial of the second kind.
- `lucasU_two_mul` (relation): U_{2n} = Uₙ Vₙ.
- `lucasU_one_neg_one` (compatibility): Uₙ(1, −1) = Nat.fib n.

Unit tests:

- `lucasU_three_two` (computation): Uₙ(3, 2) = 2ⁿ − 1 over ℤ (the Mersenne numbers, Mathlib's `mersenne`).
- `lucasU_two_one` (degenerate): Uₙ(2, 1) = n over ℤ (the repeated root α = β = 1, where the Binet quotient is undefined).
- `lucasU_fib` (compatibility): Uₙ(1, −1) = Nat.fib n.
- `lucasU_zero_one_two` (non-example): U₂(0, 1) = 0 and U₃(0, 1) = −1: a Lucas sequence can vanish at n > 0, so Uₙ ≠ 0 is not automatic (Carmichael excludes these cases, the definition does not).

Further acceptance checks:

- U(1, −1) is the Fibonacci sequence, U(3, 2) = 2ⁿ − 1 (Mathlib's `mersenne`), U(2, 1) = n (repeated root).
- The definition is over any commutative ring, so that the universal identities are proved once over ℤ[P, Q] and specialised.

Proof sketch:

1. Define lucasU P Q by the three-term recursion (structural recursion on ℕ).
2. Binet form: both sides of (α − β)Uₙ = αⁿ − βⁿ satisfy the same recursion with the same first two values, since α and β are roots of z² − Pz + Q.
3. Compatibility: U(1, −1) = Nat.fib (same recursion `Nat.fib_add_two`); U_{n+1}(P, Q) is the Dickson polynomial of the second kind `Polynomial.dickson 2 Q n` at P (`Polynomial.dickson_add_two`); lucasU P Q solves the Mathlib recurrence ⟨2, ![−Q, P]⟩, which is ofMonic (X² − PX + Q).
4. Functoriality: a ring homomorphism commutes with the recursion.
5. Doubling: U_{2n} = Uₙ·Vₙ from the Binet forms in the universal ring ℤ[P, Q][α]/(α² − Pα + Q), then specialise.

Direct prerequisites: `mathlib:LinearRecurrence`, `mathlib:LinearRecurrence.IsSolution`, `mathlib:Nat.fib`, `mathlib:Nat.fib_add_two`, `mathlib:Polynomial.dickson`, `mathlib:Polynomial.dickson_add_two`, [CA.2/linear-recurrence-of-a-monic-polynomial](#CA-2-linear-recurrence-of-a-monic-polynomial).

Source: [carmichael-arithmeticforms-1913](https://archive.org/download/jstor-1967797/1967797.pdf), Introduction, p. 30. Carmichael's Dₙ is Uₙ(P, Q) with P = α + β, Q = αβ; the node drops his standing hypotheses (coprime, nonzero), which only the divisibility theorems use.

Source: [carmichael-arithmeticforms-1913](https://archive.org/download/jstor-1967797/1967797.pdf), Section 2, recurrence (14), p. 36. The defining recursion, taken as the definition over an arbitrary commutative ring.

Source: [bala-strongdivisibility-2014](https://oeis.org/A238600/a238600.pdf), Section 2, Proposition 2.2, p. 3. The same sequence with a = P, b = −Q.

<a id="CA-2-lucas-sequence-of-the-second-kind"></a>

### The Lucas sequence of the second kind Vₙ(P, Q)

`ClassicalArithmeticCompletion:CA.2/lucas-sequence-of-the-second-kind` · definition.

For a commutative ring R and P, Q ∈ R: V₀ = 2, V₁ = P, V_{n+2} = P·V_{n+1} − Q·Vₙ. If α + β = P and αβ = Q then Vₙ = αⁿ + βⁿ (Carmichael's Sₙ), and Vₙ² − (P² − 4Q)Uₙ² = 4Qⁿ.

Hypotheses and conventions: R any commutative ring; P, Q arbitrary.

API:

- `lucasV` (data): Vₙ(P, Q): V₀ = 2, V₁ = P, V_{n+2} = P V_{n+1} − Q Vₙ.
- `lucasV_zero` (simp): V₀ = 2.
- `lucasV_one` (simp): V₁ = P.
- `lucasV_add_two` (simp): V_{n+2} = P V_{n+1} − Q Vₙ.
- `lucasV_eq_add_pow` (characterisation): If α + β = P and αβ = Q then Vₙ = αⁿ + βⁿ.
- `lucasV_eq_eval_dickson` (compatibility): Vₙ(P, Q) = (dickson 1 Q n)(P), Mathlib's Dickson polynomial of the first kind.
- `lucasV_sq_sub` (relation): Vₙ² − (P² − 4Q)Uₙ² = 4Qⁿ.
- `map_lucasV` (functoriality): f (Vₙ(P, Q)) = Vₙ(f P, f Q) for a ring homomorphism f.

Unit tests:

- `lucasV_three_two` (computation): Vₙ(3, 2) = 2ⁿ + 1 over ℤ.
- `lucasV_two_one` (degenerate): Vₙ(2, 1) = 2 for every n (repeated root).
- `lucasV_lucas_numbers` (computation): V₀, …, V₅ of (1, −1) are 2, 1, 3, 4, 7, 11.
- `lucasV_dickson` (compatibility): Vₙ(P, Q) = (dickson 1 Q n)(P) for P, Q ∈ ℤ (Mathlib's Dickson polynomial of the first kind).
- `lucasV_lucasLehmer` (compatibility): V_{2^i}(4, 1) = LucasLehmer.s i, Mathlib's Lucas–Lehmer sequence 4, 14, 194, ….

Further acceptance checks:

- Vₙ(1, −1) are the Lucas numbers 2, 1, 3, 4, 7, 11; Vₙ(3, 2) = 2ⁿ + 1; Vₙ(2, 1) = 2.
- The Lucas–Lehmer numbers are V_{2^i}(4, 1): Mathlib's `LucasLehmer.s i`.

Proof sketch:

1. Define lucasV P Q by the recursion.
2. Vₙ = αⁿ + βⁿ: both sides satisfy the recursion and agree at n = 0, 1.
3. Vₙ² − (P² − 4Q)Uₙ² = 4Qⁿ: in the universal ring where α, β exist, (α − β)² = P² − 4Q and (αⁿ + βⁿ)² − (αⁿ − βⁿ)² = 4αⁿβⁿ (Carmichael p. 36); the identity is polynomial in P, Q, so it holds over every commutative ring by specialising from ℤ[P, Q].
4. Vₙ(P, Q) = (dickson 1 Q n)(P): same recursion and initial values 2, P (`Polynomial.dickson_add_two`).

Direct prerequisites: [CA.2/lucas-sequence-of-the-first-kind](#CA-2-lucas-sequence-of-the-first-kind), `mathlib:Polynomial.dickson`, `mathlib:Polynomial.dickson_add_two`.

Source: [carmichael-arithmeticforms-1913](https://archive.org/download/jstor-1967797/1967797.pdf), Introduction, p. 30, and Section 2, p. 36. The definition (Carmichael's Sₙ) and the API item `lucasV_sq_sub`, with (α − β)² = P² − 4Q.

<a id="CA-2-lucas-addition-formula"></a>

### The addition formula for Lucas sequences

`ClassicalArithmeticCompletion:CA.2/lucas-addition-formula` · lemma.

For every commutative ring R, P, Q ∈ R and m, n ≥ 0: U_{m+n+1} = U_{m+1}U_{n+1} − Q·U_mU_n.

Hypotheses and conventions: No hypothesis on P, Q.

Further acceptance checks:

- For Fibonacci, F_{m+n+1} = F_{m+1}F_{n+1} + F_mF_n.
- For m = n it gives U_{2n+1} = U_{n+1}² − QUₙ².

Proof sketch:

1. Induct on m (Bala's Proposition A3 with a = P, b = −Q): the case m = 0 is U_{n+1} = U_{n+1}; the step uses U_{m+n+2} = P U_{m+n+1} − Q U_{m+n} and the recursion for U_{m+2}.
2. For P = 1, Q = −1 this is Mathlib's `Nat.fib_add`.

Direct prerequisites: [CA.2/lucas-sequence-of-the-first-kind](#CA-2-lucas-sequence-of-the-first-kind), `mathlib:Nat.fib_add`.

Source: [bala-strongdivisibility-2014](https://oeis.org/A238600/a238600.pdf), Appendix, Proposition A3, p. 9. The node with b = −Q, k = m, and n shifted by one so that no negative index appears.

<a id="CA-2-lucas-sequences-are-divisibility-sequences"></a>

### Lucas sequences are divisibility sequences

`ClassicalArithmeticCompletion:CA.2/lucas-sequences-are-divisibility-sequences` · theorem.

For every commutative ring R, P, Q ∈ R and m, n ≥ 0: U_{mn}(P, Q) = U_m(P, Q)·Uₙ(V_m(P, Q), Q^m). In particular U_m divides U_{mn}, so n ↦ Uₙ(P, Q) is an `IsDvdSequence`.

Hypotheses and conventions: No hypothesis on P, Q; the identity is universal.

Further acceptance checks:

- Fibonacci: F₆ = 8 = F₃·U₂(V₃, −1) = 2·4.
- U_m ∣ U_{mn} holds over every commutative ring, with no coprimality hypothesis.

Proof sketch:

1. Work in the universal ring A = ℤ[P, Q][α]/(α² − Pα + Q) with β = P − α, where α + β = P, αβ = Q; A is free over ℤ[P, Q] with basis 1, α.
2. α^m and β^m satisfy α^m + β^m = V_m and α^mβ^m = Q^m, so Uₙ(V_m, Q^m)·(α^m − β^m) = α^{mn} − β^{mn} (Binet for the pair (α^m, β^m)); multiplying U_m(α − β) = α^m − β^m gives (α − β)·U_mUₙ(V_m, Q^m) = (α − β)U_{mn}.
3. multiplication by α − β = 2α − P is injective on ℤ[P, Q] ⊂ A (A is free with basis 1, α, and c(2α − P) = 0 forces 2c = 0, hence c = 0 in the torsion-free ℤ[P, Q]), so U_{mn} = U_mUₙ(V_m, Q^m) in ℤ[P, Q]; specialise along ℤ[P, Q] → R (`map_lucasU`, `map_lucasV`).

Direct prerequisites: [CA.2/lucas-sequence-of-the-first-kind](#CA-2-lucas-sequence-of-the-first-kind), [CA.2/lucas-sequence-of-the-second-kind](#CA-2-lucas-sequence-of-the-second-kind), `mathlib:IsDvdSequence`.

Source: [carmichael-arithmeticforms-1913](https://archive.org/download/jstor-1967797/1967797.pdf), Section 2, Theorem IV, p. 37. The divisibility statement for integers; the node gives the explicit quotient Uₙ(V_m, Q^m), which is Carmichael's product formula grouped by the pair (α^m, β^m), and proves it over every commutative ring.

<a id="CA-2-coprimality-of-lucas-sequences"></a>

### Coprimality properties of Lucas sequences

`ClassicalArithmeticCompletion:CA.2/coprimality-of-lucas-sequences` · lemma.

Let P, Q ∈ ℤ be coprime. Then for every n ≥ 0, U_{n+1}(P, Q) is coprime to Q and to Uₙ(P, Q).

Hypotheses and conventions: P and Q coprime (IsCoprime P Q); P = 0 or Q = 0 is allowed (then Q or P is a unit).

Further acceptance checks:

- For P = 1, Q = −1: consecutive Fibonacci numbers are coprime (Mathlib's `Nat.fib_coprime_fib_succ`).
- Without coprimality it fails: P = 2, Q = 2 gives U₂ = 2, not coprime to Q.

Proof sketch:

1. Induct on n. U₁ = 1 is coprime to everything.
2. U_{n+2} = P U_{n+1} − Q Uₙ ≡ P U_{n+1} (mod Q), and P is coprime to Q, so gcd(U_{n+2}, Q) = gcd(U_{n+1}, Q) = 1 (`IsCoprime.mul_right`, `IsCoprime.of_mul_right_left`).
3. gcd(U_{n+2}, U_{n+1}) = gcd(Q Uₙ, U_{n+1}) = gcd(Uₙ, U_{n+1}) = 1 using the previous point for U_{n+1}.

Direct prerequisites: [CA.2/lucas-sequence-of-the-first-kind](#CA-2-lucas-sequence-of-the-first-kind), `mathlib:IsCoprime`, `mathlib:IsCoprime.mul_right`, `mathlib:IsCoprime.of_mul_right_left`.

Source: [bala-strongdivisibility-2014](https://oeis.org/A238600/a238600.pdf), Appendix, Proposition A2, p. 9. The lemma with b = −Q and the index shifted.

Source: [carmichael-arithmeticforms-1913](https://archive.org/download/jstor-1967797/1967797.pdf), Section 2, Theorem I, p. 35. The first part (Uₙ coprime to Q = αβ).

<a id="CA-2-strong-divisibility-of-lucas-sequences"></a>

### Strong divisibility of Lucas sequences

`ClassicalArithmeticCompletion:CA.2/strong-divisibility-of-lucas-sequences` · theorem.

Let P, Q ∈ ℤ be coprime. Then for all m, n ≥ 0, gcd(U_m(P, Q), Uₙ(P, Q)) = |U_{gcd(m, n)}(P, Q)|. Equivalently n ↦ |Uₙ(P, Q)| is a strong divisibility sequence (Mathlib's `Nat.IsStrongDvdSequence`).

Hypotheses and conventions: P, Q coprime integers, otherwise arbitrary: degenerate cases (α/β a root of unity, P = 0, Q = 0) are included, with gcd(0, 0) = 0. gcd is `Int.gcd` (a natural number), compared with the absolute value `Int.natAbs`.

Further acceptance checks:

- Fibonacci: gcd(F_m, Fₙ) = F_{gcd(m,n)} is Mathlib's `Nat.fib_gcd`.
- U(3, 2) = 2ⁿ − 1: gcd(2^m − 1, 2ⁿ − 1) = 2^{gcd(m,n)} − 1.
- The coprimality hypothesis is needed: P = Q = 2 gives U₂ = 2, U₃ = 2, gcd 2 ≠ |U₁| = 1.
- Degenerate case P = Q = 1 (sixth roots of unity): U = 0, 1, 1, 0, −1, −1, …, and gcd(U₃, U₆) = 0 = U₃.

Proof sketch:

1. If m = n, or one index is 0, the claim is immediate (U₀ = 0). Assume n > m ≥ 1 and write n = m + k.
2. By the addition formula, Uₙ = U_{k+1}U_m − Q U_kU_{m−1}, so gcd(Uₙ, U_m) = gcd(Q U_k U_{m−1}, U_m) = gcd(U_k, U_m), removing Q and U_{m−1} by coprimality (coprimality-of-lucas-sequences).
3. Hence gcd(U_m, Uₙ) = gcd(U_m, U_{n−m}); run Euclid's algorithm on the indices (strong induction on m + n) to reach gcd(U_{gcd(m,n)}, U₀) = |U_{gcd(m,n)}|.

Direct prerequisites: [CA.2/lucas-addition-formula](#CA-2-lucas-addition-formula), [CA.2/coprimality-of-lucas-sequences](#CA-2-coprimality-of-lucas-sequences), [CA.2/lucas-sequence-of-the-first-kind](#CA-2-lucas-sequence-of-the-first-kind), `mathlib:Nat.IsStrongDvdSequence`, `mathlib:Int.isCoprime_iff_gcd_eq_one`, `mathlib:Nat.fib_gcd`.

Source: [carmichael-arithmeticforms-1913](https://archive.org/download/jstor-1967797/1967797.pdf), Section 2, Theorem VI, p. 38. The theorem for P, Q nonzero coprime integers with α, β not roots of unity (Carmichael's standing exclusion, p. 36); the node removes that exclusion.

Source: [bala-strongdivisibility-2014](https://oeis.org/A238600/a238600.pdf), Appendix, proof of Proposition 2.2, pp. 9 to 10. The proof steps, which use only Propositions A2 and A3 and so cover the degenerate cases.

Source: [bala-strongdivisibility-2014](https://oeis.org/A238600/a238600.pdf), Section 2, Proposition 2.2, p. 3. The statement over a GCD domain; the node is the case D = ℤ, a = P, b = −Q, and also allows P = 0 or Q = 0.

<a id="CA-2-euler-zigzag-numbers"></a>

### The Euler (zigzag) numbers

`ClassicalArithmeticCompletion:CA.2/euler-zigzag-numbers` · definition.

The Euler zigzag numbers E₀, E₁, … ∈ ℕ are defined by E₀ = E₁ = 1 and E_{n+1} = ∑_{1≤j≤n, j odd} C(n, j)E_jE_{n−j} for n ≥ 1 (1, 1, 1, 2, 5, 16, 61, 272, 1385, …; OEIS A000111). E_{2n} are the secant numbers and E_{2n+1} the tangent numbers. The classical signed Euler numbers of DLMF §24.2(ii), 2eᵗ/(e^{2t} + 1) = ∑ 𝐄ₙtⁿ/n!, are 𝐄_{2n} = (−1)ⁿE_{2n} and 𝐄_{2n+1} = 0.

Hypotheses and conventions: The numbers are natural numbers; the signed classical ones are integers. The recursion used is Stanley's odd-index recursion (no division); Stanley's symmetric recursion 2E_{n+1} = ∑ C(n, k)E_kE_{n−k} (n ≥ 1) is a consequence recorded with the formal identity.

API:

- `zigzag` (data): The Euler zigzag numbers, by E₀ = E₁ = 1 and the odd-index recursion.
- `zigzagPowerSeries` (data): ∑ E_n Xⁿ/n! in A⟦X⟧ for a ℚ-algebra A.
- `eulerNumber` (data): The signed Euler numbers of DLMF: (−1)^{n/2}E_n for n even, 0 for n odd.
- `zigzag_odd_eq_bernoulli` (compatibility): E_{2n+1} = (−1)ⁿ2^{2n+2}(2^{2n+2} − 1)B_{2n+2}/(2n + 2) with Mathlib's `bernoulli`.

Unit tests:

- `zigzag_values` (computation): (E₀, …, E₇) = (1, 1, 1, 2, 5, 16, 61, 272).
- `zigzag_three_bernoulli` (compatibility): E₃ = 2 = −(2⁴(2⁴ − 1)B₄/4) with Mathlib's bernoulli 4 = −1/30.
- `eulerNumber_two` (non-example): The signed Euler number 𝐄₂ is −1 while E₂ = 1: a definition that takes the DLMF numbers as the zigzag numbers gets the sign wrong.

Further acceptance checks:

- E₀, …, E₇ = 1, 1, 1, 2, 5, 16, 61, 272.
- The signed convention differs from the zigzag one: 𝐄₂ = −1 while E₂ = 1.

Proof sketch:

1. Define zigzag by well-founded recursion on n with the odd-index sum.
2. Define the exponential generating series zigzagPowerSeries A = ∑ algebraMap ℚ A (E_n/n!) Xⁿ over a ℚ-algebra A and the signed eulerNumber n = if n even then (−1)^{n/2}E_n else 0.
3. Tangent numbers and Bernoulli numbers (API `zigzag_odd_eq_bernoulli`): the odd part of ∑ E_nXⁿ/n! is tan X (secant-plus-tangent-formal-identity); formally X cot X = ∑ (−1)ⁿ2^{2n}B_{2n}X^{2n}/(2n)! (Mathlib's bernoulliPowerSeries rescaled by 2i, then the even part, which has rational coefficients) and tan X = cot X − 2 cot 2X, which gives tan X = ∑ (−1)^{n−1}2^{2n}(2^{2n} − 1)B_{2n}X^{2n−1}/(2n)! (DLMF 4.19.3) and E_{2n+1} = (−1)ⁿ2^{2n+2}(2^{2n+2} − 1)B_{2n+2}/(2n + 2).

Direct prerequisites: `mathlib:Nat.choose`, `mathlib:Nat.factorial`, `mathlib:PowerSeries.mk`, `mathlib:bernoulli`.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 1.6.1, p. 54. The object; the definition is by recursion and the count of alternating permutations is the theorem andre-alternating-permutations.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 1.6.1, Note after the proof of Proposition 1.6.1, p. 55. The defining recursion of `zigzag`.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 1.6.1, (1.53), (1.54), p. 54. The names of the even and odd subsequences.

Source: [nist-dlmf-2026](https://dlmf.nist.gov/24.2), §24.2(ii), (24.2.6) and (24.2.7). The signed convention `eulerNumber`, which the node pins against the zigzag one.

Proof or interface frontier: Three bundled data declarations zigzag,zigzagPowerSeries,eulerNumber must split. Bernoulli tangent API proof uses formal identity59 without listed prerequisite; promoting API theorem avoids definition→59→definition cycle.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-andre-alternating-permutations"></a>

### André's theorem: E_n counts alternating permutations

`ClassicalArithmeticCompletion:CA.2/andre-alternating-permutations` · theorem.

For every n ≥ 0 the number of permutations w of {1, …, n} with w(1) > w(2) < w(3) > ⋯ (descent set {1, 3, 5, …} ∩ [n − 1]) is the zigzag number E_n; the same holds for the reverse alternating permutations w(1) < w(2) > w(3) < ⋯.

Hypotheses and conventions: Permutations of Fin n; position i (0-based) is a descent iff i is even.

Further acceptance checks:

- n = 4: 2143, 3142, 3241, 4132, 4231 are the E₄ = 5 alternating permutations.
- n = 3: 213, 312 (E₃ = 2).

Proof sketch:

1. For n ≤ 1 there is exactly one permutation. Complementation w ↦ n + 1 − w is a bijection between alternating and reverse alternating permutations.
2. Position of the letter 1 (Stanley's Note): in an alternating w of n + 1 letters, 1 sits at an even position 2m (1-based; this may be the last position); the letters before it form an alternating word of odd length j = 2m − 1 on a j-subset (ending in a peak), and the letters after it an alternating word of length n − j (the position after 1 is odd, so the suffix again starts with a descent); conversely every such choice gives an alternating w. For n + 1 = 4: j = 1 gives C(3, 1)E₁E₂ = 3 and j = 3 gives C(3, 3)E₃E₀ = 2. This gives the odd-index recursion, hence the count equals zigzag by strong induction.
3. Alternatively Stanley's proof: inserting n + 1 between the reverse of a reverse alternating u and a reverse alternating v counts alternating and reverse alternating permutations of n + 1 letters together, giving 2E_{n+1} = ∑ C(n, k)E_kE_{n−k}.

Direct prerequisites: [CA.2/euler-zigzag-numbers](#CA-2-euler-zigzag-numbers), `mathlib:Equiv.Perm`, `mathlib:Nat.card`, `mathlib:Nat.choose`.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 1.6, p. 54. The alternating condition of the node (descent set D(w)).

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Proof of Proposition 1.6.1, p. 54. The bijective proof of the recursion (1.55); the printed 'n ≥ 2' is corrected to 'n ≥ 1' in the author's errata (printed page 47, line 11).

<a id="CA-2-secant-plus-tangent-formal-identity"></a>

### The exponential generating function of the Euler numbers, formally

`ClassicalArithmeticCompletion:CA.2/secant-plus-tangent-formal-identity` · theorem.

For every ℚ-algebra A, in A⟦X⟧: (∑_{n≥0} E_n Xⁿ/n!)·cos X = 1 + sin X, where cos X, sin X are Mathlib's `PowerSeries.cos A`, `PowerSeries.sin A`. Since cos X is a unit, ∑ E_n Xⁿ/n! = sec X + tan X with sec X = (cos X)⁻¹ and tan X = sin X·sec X; its even part is sec X and its odd part tan X. Equivalently y = ∑ E_nXⁿ/n! satisfies 2y′ = y² + 1, that is 2E_{n+1} = ∑_{k=0}^n C(n, k)E_kE_{n−k} for n ≥ 1 (Stanley (1.55)).

Hypotheses and conventions: A is a commutative ℚ-algebra; no convergence is involved.

Further acceptance checks:

- Constant and linear coefficients: E₀ = E₁ = 1; the coefficient of X² of y·cos X is E₂/2 − 1/2 = 0.
- The identity is formal; its analytic form on |z| < π/2 is the separate theorem secant-plus-tangent-on-its-disc.

Proof sketch:

1. Over ℚ let y = zigzagPowerSeries ℚ with even part E and odd part O. The odd-index recursion says exactly y′ = O·y + 1 (coefficient comparison, `PowerSeries.derivative`, `PowerSeries.coeff_mul`); splitting by parity, O′ = 1 + O² and E′ = O·E, with E(0) = 1, O(0) = 0.
2. tan X = sin X·(cos X)⁻¹ and sec X = (cos X)⁻¹ satisfy tan′ = 1 + tan² and sec′ = tan·sec (formal derivatives of sin and cos, and cos² + sin² = 1); a formal first-order system with given constant terms has a unique solution (its coefficients are determined recursively), so O = tan X, E = sec X, and y·cos X = (E + O)·cos X = 1 + sin X.
3. (1.55): w = E² − O² − 1 satisfies w′ = 2O·w and w(0) = 0, so w = 0; then 2y′ = 2(OE + 1 + O²) = (E + O)² + 1 = y² + 1, whose coefficients are (1.55).
4. Map along ℚ → A (`PowerSeries.map`).

Direct prerequisites: [CA.2/euler-zigzag-numbers](#CA-2-euler-zigzag-numbers), `mathlib:PowerSeries.cos`, `mathlib:PowerSeries.sin`, `mathlib:PowerSeries.derivative`, `mathlib:PowerSeries.ext`, `mathlib:PowerSeries.coeff_mul`, `mathlib:PowerSeries.map`.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 1.6.1, Proposition 1.6.1, p. 54. The theorem, read as an identity of formal power series (Stanley works formally throughout Chapter 1).

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Proof of Proposition 1.6.1, pp. 54 to 55. The ODE and its uniqueness; the node reaches it through the odd-index recursion.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Note after the proof of Proposition 1.6.1, p. 55. The system O′ = 1 + O², E′ = O·E of the proof steps.

Proof or interface frontier: Formal tan/sec differential identities, solution uniqueness by coefficient recursion, and E²−O²=1 invariant are nonroutine named steps missing suppliers. Sourceproof54–55 checked. Split system uniqueness/trig derivative support or record exact closure gaps.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-taylor-series-of-a-complex-function"></a>

### The Taylor series at 0 of a complex function

`ClassicalArithmeticCompletion:CA.2/taylor-series-of-a-complex-function` · construction.

For f : ℂ → ℂ, taylorPowerSeries f ∈ ℂ⟦X⟧ is ∑_{n≥0} f⁽ⁿ⁾(0)/n!·Xⁿ, with Mathlib's `iteratedDeriv`. On functions analytic at 0 it is a ring homomorphism to ℂ⟦X⟧ (sums and products go to sums and products, constants to constants, z to X), it sends exp, sin, cos to Mathlib's formal `PowerSeries.exp`, `sin`, `cos`, it is injective on germs (an analytic f with zero Taylor series vanishes near 0), and if f is holomorphic on the disc |z| < r its Taylor series converges to f there.

Hypotheses and conventions: f : ℂ → ℂ arbitrary for the definition; the homomorphism properties assume analyticity at 0.

API:

- `taylorPowerSeries` (data): ∑ f⁽ⁿ⁾(0)/n! Xⁿ ∈ ℂ⟦X⟧.
- `coeff_taylorPowerSeries` (simp): The n-th coefficient is f⁽ⁿ⁾(0)/n!.
- `taylorPowerSeries_add` (simp): T(f + g) = T f + T g for f, g analytic at 0.
- `taylorPowerSeries_mul` (simp): T(f g) = T f · T g for f, g analytic at 0.
- `taylorPowerSeries_const` (simp): T(const c) = C c.
- `taylorPowerSeries_id` (simp): T(id) = X.
- `taylorPowerSeries_exp` (compatibility): T(Complex.exp) = PowerSeries.exp ℂ.
- `taylorPowerSeries_sin` (compatibility): T(Complex.sin) = PowerSeries.sin ℂ.
- `taylorPowerSeries_cos` (compatibility): T(Complex.cos) = PowerSeries.cos ℂ.
- `eventuallyEq_zero_of_taylorPowerSeries_eq_zero` (extensionality): If f is analytic at 0 and T f = 0 then f = 0 near 0.
- `hasSum_taylorPowerSeries` (characterisation): If f is complex differentiable on the ball of radius r about 0, then ∑ Tₙ zⁿ = f(z) for |z| < r.

Unit tests:

- `taylorPowerSeries_geometric` (computation): T(z ↦ 1/(1 − z)) = ∑ Xⁿ.
- `taylorPowerSeries_one` (degenerate): T(z ↦ 1) = 1.
- `taylorPowerSeries_sq` (non-example): T(z ↦ z²) = X², not 2X²: the coefficients are divided by n!.

Further acceptance checks:

- The Taylor series of 1/(1 − z) is ∑ Xⁿ; of z² is X² (the n! normalisation).
- The homomorphism property is what lets a formal identity F·T(g) = T(h) be compared with h/g.

Proof sketch:

1. Define the series by `PowerSeries.mk` of the normalised iterated derivatives.
2. Products: by the Leibniz rule `iteratedDeriv_mul` (analytic functions are ContDiffAt, `AnalyticAt.contDiffAt`), (fg)⁽ⁿ⁾(0)/n! = ∑_{i+j=n} f⁽ⁱ⁾(0)/i!·g⁽ʲ⁾(0)/j!, the Cauchy product (`PowerSeries.coeff_mul`); sums and constants are immediate.
3. exp, sin, cos: iterated derivatives at 0 (`iteratedDeriv_cexp_const_mul`) or uniqueness of power-series expansions (`HasFPowerSeriesAt.eq_formalMultilinearSeries`) against `Complex.hasSum_cos`, `Complex.hasSum_sin`.
4. Convergence on the disc is `Complex.hasSum_taylorSeries_on_ball`; injectivity on germs is the identity theorem (`AnalyticAt.eventually_eq_zero_or_eventually_ne_zero`).

Direct prerequisites: `mathlib:iteratedDeriv`, `mathlib:iteratedDeriv_mul`, `mathlib:AnalyticAt.contDiffAt`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mul`, `mathlib:iteratedDeriv_cexp_const_mul`, `mathlib:HasFPowerSeriesAt.eq_formalMultilinearSeries`, `mathlib:Complex.hasSum_cos`, `mathlib:Complex.hasSum_sin`, `mathlib:Complex.hasSum_taylorSeries_on_ball`, `mathlib:AnalyticAt.eventually_eq_zero_or_eventually_ne_zero`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.sin`, `mathlib:PowerSeries.cos`.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 1.1, p. 11. The formal side; the construction is the bridge to the analytic side, which the stage's acceptance requires to be a separate convergence theorem.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 1.1, p. 17. The injectivity on germs recorded in the API (`eventuallyEq_zero_of_taylorPowerSeries_eq_zero`) and the uniqueness used for exp, sin, cos.

Proof or interface frontier: Construction folds Taylor ring API and convergence/germ-injectivity; consumed in61–63 so promote multiplicativity/sin/cos/const and convergence to exact nodes or baseline supplied declarations.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-formal-identities-specialise-on-a-disc"></a>

### Formal identities specialise on a disc of holomorphy

`ClassicalArithmeticCompletion:CA.2/formal-identities-specialise-on-a-disc` · theorem.

Let r > 0 and let g, h be complex differentiable on the disc |z| < r, with g(z) ≠ 0 there. If F ∈ ℂ⟦X⟧ satisfies F·T(g) = T(h) in ℂ⟦X⟧ (T the Taylor series at 0), then for every z with |z| < r the series ∑ Fₙ zⁿ converges to h(z)/g(z).

Hypotheses and conventions: g has no zero on the open disc; the radius r is the conclusion's radius of convergence (it may be smaller than the true one). No assumption that F converges anywhere: convergence is part of the conclusion.

Further acceptance checks:

- With g = 1 − z, h = 1, F = ∑ Xⁿ: ∑ zⁿ = 1/(1 − z) for |z| < 1.
- The hypothesis g ≠ 0 on the disc cannot be dropped: F = ∑ Xⁿ satisfies F·T(1 − z) = 1 but ∑ zⁿ diverges at |z| = 1 where g vanishes.

Proof sketch:

1. h/g is complex differentiable on the disc (quotient rule, g ≠ 0), hence analytic there (`DifferentiableOn.analyticAt`).
2. T(h/g)·T(g) = T(h) by multiplicativity of T (taylor-series-of-a-complex-function); T(g) has constant coefficient g(0) ≠ 0, so it is a unit (`PowerSeries.isUnit_iff_constantCoeff`) and F = T(h/g).
3. Conclude by convergence of the Taylor series of h/g on the disc (`Complex.hasSum_taylorSeries_on_ball`).

Direct prerequisites: [CA.2/taylor-series-of-a-complex-function](#CA-2-taylor-series-of-a-complex-function), `mathlib:Complex.hasSum_taylorSeries_on_ball`, `mathlib:DifferentiableOn.analyticAt`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`, `mathlib:DifferentiableOn`.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 1.1, p. 17. The principle this theorem makes precise, in the direction formal ⇒ analytic, with the domain of validity stated.

Source: [nist-dlmf-2026](https://dlmf.nist.gov/24.2), §24.2(i), (24.2.1). A formal identity (Mathlib's bernoulliPowerSeries_mul_exp_sub_one) valid analytically on a disc limited by the nearest zero of the denominator; the theorem is the general form of this specialisation.

<a id="CA-2-bernoulli-generating-function-on-its-disc"></a>

### The Bernoulli generating function on its disc of convergence

`ClassicalArithmeticCompletion:CA.2/bernoulli-generating-function-on-its-disc` · theorem.

For z ∈ ℂ with |z| < 2π: ∑_{n≥0} B_n zⁿ/n! = z/(e^z − 1) for z ≠ 0 and = 1 for z = 0, with Mathlib's `bernoulli` (B₁ = −1/2). The radius 2π is exact: the series diverges for |z| > 2π.

Hypotheses and conventions: Mathlib's convention B₁ = −1/2 (`bernoulli`); with `bernoulli'` (B₁ = +1/2) the sum is z e^z/(e^z − 1).

Further acceptance checks:

- At z = 0 the sum is B₀ = 1.
- Numerically at z = 1: ∑ Bₙ/n! = 1/(e − 1) ≈ 0.58198.
- DLMF 24.2.1 states exactly this with |t| < 2π.

Proof sketch:

1. Let g(z) = (e^z − 1)/z for z ≠ 0 and g(0) = 1, that is g = dslope (exp − 1) 0, which is entire (`Complex.differentiableOn_dslope`).
2. g(z) = 0 iff e^z = 1 and z ≠ 0, iff z ∈ 2πiℤ ∖ {0} (`Complex.exp_eq_one_iff`); so g has no zero on |z| < 2π.
3. X·T(g) = T(z·g) = T(e^z − 1) = exp − 1 formally (taylor-series-of-a-complex-function); Mathlib's bernoulliPowerSeries ℂ · (exp − 1) = X, so bernoulliPowerSeries·X·T(g) = X and, cancelling X in the domain ℂ⟦X⟧, bernoulliPowerSeries·T(g) = 1 = T(1).
4. Apply formal-identities-specialise-on-a-disc with h = 1 and r = 2π: ∑ B_n zⁿ/n! = 1/g(z).
5. Exactness of the radius: a power series converging at some |z₀| > 2π would define a holomorphic function on |z| < |z₀| equal to 1/g near 0, hence bounded near 2πi, but 1/g has a pole at 2πi.

Direct prerequisites: [CA.2/taylor-series-of-a-complex-function](#CA-2-taylor-series-of-a-complex-function), [CA.2/formal-identities-specialise-on-a-disc](#CA-2-formal-identities-specialise-on-a-disc), `mathlib:bernoulli`, `mathlib:bernoulliPowerSeries`, `mathlib:bernoulliPowerSeries_mul_exp_sub_one`, `mathlib:Complex.exp_eq_one_iff`, `mathlib:dslope`, `mathlib:Complex.differentiableOn_dslope`.

Source: [nist-dlmf-2026](https://dlmf.nist.gov/24.2), §24.2(i), (24.2.1). The theorem (t real or complex, as DLMF's symbol list says).

Reconciled native contracts: `not_summable_bernoulli_mul_pow`.

Proof or interface frontier: Exact radius assertion is absent from native signature and requires a separate pole/radius lemma and named analytic uniqueness/convergence prerequisites.

Revision disposition: The missing or incomplete native consequences now have checked signatures: not_summable_bernoulli_mul_pow. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-2-secant-plus-tangent-on-its-disc"></a>

### sec + tan on its disc of convergence

`ClassicalArithmeticCompletion:CA.2/secant-plus-tangent-on-its-disc` · theorem.

For z ∈ ℂ with |z| < π/2: ∑_{n≥0} E_n zⁿ/n! = 1/cos z + tan z. The radius π/2 is exact.

Hypotheses and conventions: tan z = sin z / cos z (Mathlib's `Complex.tan`); cos z ≠ 0 on the disc.

Further acceptance checks:

- Even part sec z, odd part tan z (DLMF 4.19.5 and 4.19.3, both on |z| < π/2).
- z = 0 gives E₀ = 1.

Proof sketch:

1. cos z = 0 iff z = (2k + 1)π/2 (`Complex.cos_eq_zero_iff`), so cos has no zero on |z| < π/2.
2. The formal identity (∑ E_n Xⁿ/n!)·T(cos) = T(1 + sin) holds by secant-plus-tangent-formal-identity and T(cos) = cos X, T(sin) = sin X (taylor-series-of-a-complex-function).
3. Apply formal-identities-specialise-on-a-disc with g = cos, h = 1 + sin: the sum is (1 + sin z)/cos z = 1/cos z + tan z (`Complex.tan_eq_sin_div_cos`).
4. The radius is exact because (1 + sin z)/cos z has a pole at z = π/2, where 1 + sin z = 2 (at z = −π/2 the singularity is removable: (1 + sin z)/cos z = cos z/(1 − sin z) there).

Direct prerequisites: [CA.2/secant-plus-tangent-formal-identity](#CA-2-secant-plus-tangent-formal-identity), [CA.2/taylor-series-of-a-complex-function](#CA-2-taylor-series-of-a-complex-function), [CA.2/formal-identities-specialise-on-a-disc](#CA-2-formal-identities-specialise-on-a-disc), `mathlib:Complex.cos_eq_zero_iff`, `mathlib:Complex.tan_eq_sin_div_cos`, `mathlib:Complex.cos`, `mathlib:Complex.tan`.

Source: [nist-dlmf-2026](https://dlmf.nist.gov/24.2), §4.19, (4.19.5). The even part, in the signed convention (−1)ⁿ𝐄_{2n} = E_{2n}.

Source: [nist-dlmf-2026](https://dlmf.nist.gov/24.2), §4.19, (4.19.3). The odd part and its radius.

Source: [STANLEY.EC1](https://math.mit.edu/~rstan/ec/ec1.pdf), Section 1.6.1, Proposition 1.6.1, p. 54. The identity whose analytic specialisation this is.

Reconciled native contracts: `not_summable_zigzag_mul_pow`.

Proof or interface frontier: Exact radius π/2 is absent from native signature. Positive pole atπ/2, removable at−π/2 correctly distinguished; separate pole/radius supplier missing.

Revision disposition: The missing or incomplete native consequences now have checked signatures: not_summable_zigzag_mul_pow. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-2-p-adic-digit-expansion"></a>

### The p-adic digit expansion

`ClassicalArithmeticCompletion:CA.2/p-adic-digit-expansion` · construction.

For a prime p, every x ∈ ℤ_p has a unique expansion x = ∑_{i≥0} dᵢpⁱ with digits dᵢ ∈ {0, …, p − 1}; this is an equivalence digitsEquiv : ℤ_p ≃ (ℕ → Fin p), with ∑_{i<n} dᵢpⁱ = appr x n (Mathlib's `PadicInt.appr`) and dᵢ = ⌊(x mod p^{i+1})/pⁱ⌋. It is a homeomorphism for the product topology on (ℕ → Fin p).

Hypotheses and conventions: p prime (`Fact p.Prime`); digits are the standard representatives 0, …, p − 1.

API:

- `PadicInt.digitsEquiv` (equivalence): The equivalence ℤ_p ≃ (ℕ → Fin p), x ↦ its digits.
- `PadicInt.hasSum_digitsEquiv` (characterisation): ∑ dᵢ(x)pⁱ converges to x.
- `PadicInt.sum_digitsEquiv_eq_appr` (compatibility): ∑_{i<n} dᵢ(x)pⁱ = appr x n (Mathlib's truncation).
- `PadicInt.digitsEquiv_apply` (simp): dᵢ(x) = (toZModPow (i+1) x).val / pⁱ.
- `PadicInt.digitsEquiv_symm_apply` (constructor): digitsEquiv.symm d is the sum ∑ dᵢpⁱ.
- `PadicInt.continuous_digitsEquiv` (structure): digitsEquiv and its inverse are continuous (a homeomorphism with the product topology).

Unit tests:

- `PadicInt.digitsEquiv_neg_one` (computation): Every digit of −1 ∈ ℤ_p is p − 1.
- `PadicInt.digitsEquiv_natCast` (compatibility): For n ∈ ℕ, the i-th digit of n ∈ ℤ_p is the i-th entry of Mathlib's `Nat.digits p n` (0 beyond its length).
- `PadicInt.digitsEquiv_zero` (degenerate): All digits of 0 are 0.
- `PadicInt.digitsEquiv_not_additive` (non-example): In ℤ₂, the digit of 1 + 1 at position 1 is 1 while that of 1 is 0: digitsEquiv is not additive.

Further acceptance checks:

- The digits of −1 are all p − 1; the digits of a natural number are its base-p digits followed by zeros.
- Digits are not additive: 1 + 1 = 2 in ℤ₂ has digit 1 in position 1 while 1 has digit 0 there (carries).

Proof sketch:

1. Digits: dᵢ(x) = (toZModPow (i+1) x).val / pⁱ; equivalently (appr x (i+1) − appr x i)/pⁱ, which is < p by `PadicInt.appr_lt` and `PadicInt.dvd_appr_sub_appr`.
2. Partial sums: ∑_{i<n} dᵢpⁱ = appr x n by telescoping, and x − appr x n ∈ pⁿℤ_p (`PadicInt.appr_spec`), so the series converges to x (‖pⁿ‖ → 0, `PadicInt.norm_le_pow_iff_mem_span_pow`).
3. Inverse: for d : ℕ → Fin p the series ∑ dᵢpⁱ converges in the complete ring ℤ_p; its partial sums are its appr, so its digits are d; x is recovered from its digits by `PadicInt.ext_of_toZModPow`.
4. Continuity both ways: the first n digits depend only on x mod pⁿ, and x mod pⁿ only on the first n digits.

Direct prerequisites: `mathlib:PadicInt`, `mathlib:PadicInt.appr`, `mathlib:PadicInt.appr_spec`, `mathlib:PadicInt.appr_lt`, `mathlib:PadicInt.dvd_appr_sub_appr`, `mathlib:PadicInt.toZModPow`, `mathlib:PadicInt.ext_of_toZModPow`, `mathlib:PadicInt.norm_le_pow_iff_mem_span_pow`, `mathlib:Nat.digits`, `mathlib:ZMod.val`.

Source: [milne-ant-2020](https://www.jmilne.org/math/CourseNotes/ANT.pdf), Chapter 7, Proposition 7.26, printed p. 116. The general statement; the node is the case A = ℤ_(p), π = p, S = {0, …, p − 1}, restricted to ℤ_p (no negative powers).

Source: [milne-ant-2020](https://www.jmilne.org/math/CourseNotes/ANT.pdf), Chapter 7, after Proposition 7.26, printed p. 117. The API items `sum_digitsEquiv_eq_appr` and `digitsEquiv_apply`.

Proof or interface frontier: Digit equivalence and homeomorphism proof correct source118–119. Convergence/inverse uses complete nonarchimedean summability and continuity of modpⁿ; named suppliers omitted from prerequisite list.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-canonical-real-expansion-is-recovered"></a>

### The canonical base-b expansion is recovered from any expansion not ending in b − 1

`ClassicalArithmeticCompletion:CA.2/canonical-real-expansion-is-recovered` · lemma.

Let b ≥ 2 and d : ℕ → {0, …, b − 1} with dᵢ ≠ b − 1 for infinitely many i. Then x = ofDigits d = ∑ dᵢ/b^{i+1} lies in [0, 1) and Mathlib's canonical digits of x are d: Real.digits (Real.ofDigits d) b = d.

Hypotheses and conventions: b ≥ 2; the digits are indexed so that d₀ is the first digit after the point (Mathlib's `Real.ofDigits`).

Further acceptance checks:

- 0.4999… (b = 10) is excluded: its canonical digits are 0.5000…
- For b = 2 the expansion (1, 0, 1, 0, …) is recovered from its value 2/3.

Proof sketch:

1. The tail after position n satisfies 0 ≤ ofDigits (d(· + n)) < 1 strictly, since not all later digits are b − 1 (`Real.ofDigits_const_last_eq_one'` is the only way to reach 1; compare termwise).
2. Hence ⌊bⁿ⁺¹x⌋ = ∑_{i≤n} dᵢb^{n−i} (`Real.ofDigits_eq_sum_add_ofDigits`), and Mathlib's digit (Real.digits x b) n = ⌊x·b^{n+1}⌋ mod b is dₙ.
3. In particular x < 1, so x is in the domain [0, 1) of `Real.digits`.

Direct prerequisites: `mathlib:Real.ofDigits`, `mathlib:Real.digits`, `mathlib:Real.ofDigits_eq_sum_add_ofDigits`, `mathlib:Real.ofDigits_const_last_eq_one'`, `mathlib:Real.ofDigits_digits`.

Source: [planetmath-decimalexpansion-2013](https://planetmath.org/existenceanduniquenessofdecimalexpansion), Section 2.2, Near-uniqueness for non-negative numbers. The lemma (the source indexes the fractional digits a_{−1}, a_{−2}, …; the node uses Mathlib's d₀, d₁, …).

<a id="CA-2-uniqueness-of-base-b-expansions"></a>

### Uniqueness of base-b expansions of real numbers

`ClassicalArithmeticCompletion:CA.2/uniqueness-of-base-b-expansions` · theorem.

Let b ≥ 2 and d, e : ℕ → {0, …, b − 1}. Then ∑ dᵢ/b^{i+1} = ∑ eᵢ/b^{i+1} iff d = e, or, after possibly swapping d and e, there is n with dᵢ = eᵢ for i < n, dₙ = eₙ + 1, dᵢ = 0 and eᵢ = b − 1 for i > n. In particular every x ∈ [0, 1) has exactly one expansion not ending in b − 1, and exactly two expansions iff x is a nonzero b-adic fraction k/bᵐ.

Hypotheses and conventions: b ≥ 2; values in [0, 1]; the value 1 has the single expansion (b − 1, b − 1, …).

Further acceptance checks:

- 0.1 = 0.0111… in base 2 (n = 0); 1/2 = 0.5 = 0.4999… in base 10.
- x = 1/3 has the unique binary expansion 0.0101…

Proof sketch:

1. If d ≠ e let n be the first index where they differ, say dₙ > eₙ. Cancelling the common prefix and multiplying by b^{n+1}, (dₙ − eₙ) + tail(d) = tail(e) with tails in [0, 1] (`Real.ofDigits_eq_sum_add_ofDigits`).
2. Since tail(e) ≤ 1 and dₙ − eₙ ≥ 1, equality forces dₙ − eₙ = 1, tail(d) = 0 (all later dᵢ = 0) and tail(e) = 1 (all later eᵢ = b − 1, by `Real.ofDigits_const_last_eq_one'` and termwise comparison).
3. The converse is the geometric series identity (b − 1)∑_{i>n} b^{−i−1} = b^{−n−1}.
4. The consequence follows with canonical-real-expansion-is-recovered.

Direct prerequisites: [CA.2/canonical-real-expansion-is-recovered](#CA-2-canonical-real-expansion-is-recovered), `mathlib:Real.ofDigits`, `mathlib:Real.ofDigits_eq_sum_add_ofDigits`, `mathlib:Real.ofDigits_const_last_eq_one'`, `mathlib:Real.ofDigits_SurjOn`.

Source: [planetmath-decimalexpansion-2013](https://planetmath.org/existenceanduniquenessofdecimalexpansion), Section 2.2, Near-uniqueness for non-negative numbers. The theorem; the node makes the exceptional pair explicit.

<a id="CA-2-automata-with-output"></a>

### Deterministic finite automata with output

`ClassicalArithmeticCompletion:CA.2/automata-with-output` · definition.

A deterministic automaton with output (DFAO) with input alphabet α, states σ and output alphabet Δ is a transition function δ : σ → α → σ, an initial state q₀ ∈ σ and an output function τ : σ → Δ. It runs on a word (a list) from the head of the list: evalFrom s [a₁, …, a_m] = δ(…δ(δ(s, a₁), a₂)…, a_m), and eval = evalFrom q₀. Finiteness of σ is imposed where it is used. For S ⊆ Δ, the acceptor toDFA S is Mathlib's `DFA` with the same transitions and accepting states τ⁻¹(S).

Hypotheses and conventions: No finiteness in the structure (as Mathlib's `DFA`); `IsAutomatic` requires a Fintype of states. Words are read from the head of the list, as `DFA.eval` (List.foldl).

API:

- `DFAO` (structure): A DFAO: step : σ → α → σ, start : σ, output : σ → Δ.
- `DFAO.evalFrom` (data): Run from a state on a word, head first.
- `DFAO.eval` (data): Run from the initial state.
- `DFAO.evalFrom_append` (simp): evalFrom s (x ++ y) = evalFrom (evalFrom s x) y.
- `DFAO.toDFA` (compatibility): The acceptor DFA with accepting states output⁻¹(S).
- `DFAO.eval_toDFA` (compatibility): (toDFA S).eval = eval.
- `DFAO.mem_accepts_toDFA` (characterisation): x ∈ (toDFA S).accepts iff output (eval x) ∈ S.
- `DFAO.mapOutput` (functoriality): Change the output alphabet along f : Δ → Δ'.
- `DFAO.prod` (constructor): The product automaton, with output pairs.

Unit tests:

- `DFAO.parity_eval` (computation): The automaton on Fin 2 with states ZMod 2, step s a = s + a, start 0 and identity output returns the parity of the number of ones of the word.
- `DFAO.eval_nil` (degenerate): eval [] = start.
- `DFAO.toDFA_accepts` (compatibility): The acceptor for S = univ accepts every word (agreement with Mathlib's DFA.accepts).

Further acceptance checks:

- The two-state parity automaton outputs the parity of the number of ones.
- On the empty word the output is τ(q₀).

Proof sketch:

1. Define the structure with fields step, start, output; define evalFrom by List.foldl and eval.
2. evalFrom (x ++ y) = evalFrom (evalFrom x) y by List.foldl_append (as `DFA.evalFrom_of_append`).
3. toDFA S: the DFA ⟨step, start, output⁻¹' S⟩; its eval agrees with the DFAO's, so its language is {w | τ(eval w) ∈ S} (`DFA.mem_accepts`).
4. Constructions: mapOutput f post-composes τ with f; prod runs two automata in parallel with pair output.

Direct prerequisites: `mathlib:DFA`, `mathlib:DFA.eval`, `mathlib:DFA.evalFrom`, `mathlib:DFA.evalFrom_of_append`, `mathlib:DFA.accepts`, `mathlib:DFA.mem_accepts`.

Source: [bridy-automaticcurves-2016](https://arxiv.org/abs/1604.08241v2), Section 2.1, p. 3. The structure; finiteness of the alphabets and states is imposed by `IsAutomatic`, not by the structure.

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 4, p. 405. The same data (states Σ, output alphabet Ξ, input alphabet [k] = {0, …, k − 1}).

Proof or interface frontier: DFAO,evalFrom,eval,toDFA,mapOutput,prod are six data declarations bundled into one node. Split data declarations and consumed append API per lemma-level rule.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-automatic-sequences"></a>

### k-automatic sequences

`ClassicalArithmeticCompletion:CA.2/automatic-sequences` · definition.

Let k ≥ 1 (NeZero k). A sequence a : ℕ → Δ is k-automatic if there are a finite type σ and a DFAO M with input alphabet Fin k and states σ such that a(n) = τ(eval((n)_k)) for every n, where (n)_k = Nat.digits k n is the base-k expansion of n read least significant digit first (Mathlib's order; (0)_k is empty), mapped into Fin k.

Hypotheses and conventions: Reading convention: least significant digit first ('lecture inverse' of Christol–Kamae–Mendès France–Rauzy, 'reverse reading' of Bridy); the other convention gives the same class (automaticity-is-independent-of-reading-direction). Canonical representations, without padding zeros, as Mathlib's `Nat.digits`; states live in Type (as Mathlib's `Language.IsRegular`). The output alphabet Δ is arbitrary; automaticity forces the range of a to be finite.

API:

- `IsAutomatic` (data): a is k-automatic (least significant digit first, canonical digits).
- `IsAutomatic.map` (functoriality): If a is k-automatic so is f ∘ a.
- `IsAutomatic.prod` (constructor): If a and b are k-automatic so is n ↦ (a n, b n).
- `IsAutomatic.finite_range` (other): A k-automatic sequence takes finitely many values.
- `isAutomatic_const` (constructor): Constant sequences are k-automatic.
- `isAutomatic_of_eventually_periodic` (constructor): Eventually periodic sequences are k-automatic for every k.

Unit tests:

- `isAutomatic_const_two` (degenerate): A constant sequence is 2-automatic.
- `not_isAutomatic_id` (non-example): n ↦ n (with values in ℕ) is not 2-automatic: it takes infinitely many values.
- `isAutomatic_parity` (computation): n ↦ n mod 2 is 2-automatic (the output reads the first digit read, the last digit of n).

Further acceptance checks:

- n ↦ n mod 2 is 2-automatic, n ↦ n is not automatic in any base (infinite range).
- The Thue–Morse sequence is 2-automatic with two states.

Proof sketch:

1. Define IsAutomatic k a := ∃ (σ : Type) (_ : Fintype σ) (M : DFAO (Fin k) σ Δ), ∀ n, a n = M.output (M.eval ((Nat.digits k n).map (Fin.ofNat k))).
2. Closure: mapOutput gives IsAutomatic.map; the product automaton gives IsAutomatic.prod; the range is contained in the finite image of the output function.
3. Constant sequences: a one-state automaton. Eventually periodic sequences (period p after N) are automatic: every kernel element n ↦ a(k^e n + r) is eventually periodic with period p and preperiod ≤ N and takes values in the finite range of a, so the kernel is finite (automatic-iff-finite-kernel); Christol–Kamae–Mendès France–Rauzy (p. 402) identify these sequences with the rational series.

Direct prerequisites: [CA.2/automata-with-output](#CA-2-automata-with-output), `mathlib:Nat.digits`, `mathlib:Language.IsRegular`.

Source: [bridy-automaticcurves-2016](https://arxiv.org/abs/1604.08241v2), Section 2.1, p. 3. The definition, with Bridy's reverse-reading convention (f_M(w) = τ(δ(q₀, w^R)) for the most-significant-first word w), which is Mathlib's Nat.digits order.

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 4, p. 405. The same notion ('k-reconnaissable'), with nx₀ = e_l(n) ⋯ e₁(n)(e₀(n)x₀): the least significant digit acts first.

Source: [byszewski-konieczny-automatic-2017](https://arxiv.org/abs/1705.08979), Section 1, Definition 1.3 and the remark after it, p. 7. The independence of the conventions, which the node's pinned convention relies on.

Proof or interface frontier: eventual-periodicity API invokes70 but70depends68: promoting API to own lemma avoids implicitcycle. Listed sources requirek≥2, while predicateallowsk1; need explicitly document unary extension and prove its constructor separately or restrictscope.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-k-kernel"></a>

### The k-kernel of a sequence

`ClassicalArithmeticCompletion:CA.2/k-kernel` · definition.

The k-kernel of a : ℕ → Δ is the set of subsequences n ↦ a(k^e n + r) with e ≥ 0 and 0 ≤ r < k^e.

Hypotheses and conventions: k ≥ 2 for the theorems; the definition makes sense for every k.

API:

- `kernel` (data): The set {n ↦ a(k^e n + r) | e ≥ 0, r < k^e}.
- `self_mem_kernel` (simp): a ∈ kernel k a.
- `kernel_subset` (other): If b ∈ kernel k a then kernel k b ⊆ kernel k a.

Unit tests:

- `kernel_const` (degenerate): The 3-kernel of a constant sequence is the singleton of that sequence.
- `kernel_parity` (computation): The 2-kernel of n ↦ n mod 2 is {n ↦ n mod 2, the constant 0, the constant 1}.
- `kernel_thueMorse_eq_pair` (computation): The 2-kernel of the Thue–Morse sequence is {t, n ↦ 1 + t n} (in ZMod 2).
- `kernel_two_mul_add_one_mem` (characterisation): n ↦ a(2n + 1) belongs to the 2-kernel of a (e = 1, r = 1), while r ≥ k^e is not allowed.

Further acceptance checks:

- The kernel of a constant sequence is a singleton; the 2-kernel of the Thue–Morse sequence is {t, 1 − t}.
- Finiteness of the kernel is the automaticity criterion (next node).

Proof sketch:

1. Define kernel k a as a set of sequences.
2. a ∈ kernel k a (e = 0, r = 0); the kernel of a kernel element is contained in the kernel (k^e(k^{e′}n + r′) + r = k^{e+e′}n + (k^e r′ + r)).

Direct prerequisites: `mathlib:Set.Finite`.

Source: [byszewski-konieczny-automatic-2017](https://arxiv.org/abs/1705.08979), Section 1, Definition 1.4, p. 7. The definition.

Source: [adamczewski-yassawi-christol-2019](https://adamczewski.perso.math.cnrs.fr/Note_On_Christol.pdf), Section 1, p. 2. The same definition in the Christol setting.

Proof or interface frontier: kernel_subset API consumed70 requires promoted lemma node. Proof itself routine exponents/arithmetic and testscorrect.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-automatic-iff-finite-kernel"></a>

### Eilenberg's theorem: automatic iff finite kernel

`ClassicalArithmeticCompletion:CA.2/automatic-iff-finite-kernel` · theorem.

Let k ≥ 2 and a : ℕ → Δ. Then a is k-automatic iff its k-kernel is finite. Moreover a DFAO whose states are the kernel elements computes a, reading least significant digit first, and it gives the same output on every base-k representation of n with trailing (leading-zero) padding.

Hypotheses and conventions: k ≥ 2; no finiteness assumption on Δ.

Further acceptance checks:

- The Thue–Morse kernel has 2 elements and the kernel automaton is the two-state parity automaton.
- n ↦ n has an infinite kernel (the sequences n ↦ k^e n + r are pairwise distinct).

Proof sketch:

1. (⇒) Let M generate a with states σ. For n ≥ 1 the digits of k^e n + r are the e digits of r padded with zeros followed by the digits of n (`Nat.digits_append_digits`, `Nat.digits_add_two_add_one`), so a(k^e n + r) = τ(evalFrom (q_{e,r}) ((n)_k)) with q_{e,r} = eval (padded r); for n = 0 it is a(r). Hence the kernel element (e, r) is determined by the pair (q_{e,r}, a(r)) ∈ σ × range(τ), a finite set.
2. (⇐) Take as states the finite kernel, initial state a, output b ↦ b(0), and transition b ↦ (n ↦ b(kn + d)) on digit d; this stays in the kernel (kernel_subset). Induction on the digits shows that after reading (n)_k from state b the state is m ↦ b(k^{len} m + n), whose value at 0 is b(n); with b = a this is a(n). Appending zero digits does not change the output, which gives the padding statement.

Direct prerequisites: [CA.2/automatic-sequences](#CA-2-automatic-sequences), [CA.2/k-kernel](#CA-2-k-kernel), [CA.2/automata-with-output](#CA-2-automata-with-output), `mathlib:Nat.digits_append_digits`, `mathlib:Nat.digits_add_two_add_one`, `mathlib:Set.Finite`.

Source: [bridy-automaticcurves-2016](https://arxiv.org/abs/1604.08241v2), Section 2.1, Theorem 2.2, p. 4. The theorem (the node does not claim the minimality statement, which needs the leading-zero-insensitive convention of Bridy's Remark 2.1).

Source: [rowland-stipulanti-yassawi-bridy-2023](https://arxiv.org/abs/2308.10977v2), Section 3, p. 5. The kernel automaton of the (⇐) direction, with least-significant-digit reading as in the node.

<a id="CA-2-automaticity-is-independent-of-reading-direction"></a>

### Automaticity does not depend on the reading direction

`ClassicalArithmeticCompletion:CA.2/automaticity-is-independent-of-reading-direction` · theorem.

Let k ≥ 2 and a : ℕ → Δ. Then a is k-automatic (least significant digit first) iff some DFAO with finitely many states computes a(n) by reading the base-k digits of n most significant digit first.

Hypotheses and conventions: Canonical digits (no leading zeros) in both conventions.

Further acceptance checks:

- The two-state Thue–Morse automaton works in both directions (its transitions commute).
- The state count can grow: reversal may need up to |range τ|^{|σ|} states (Bridy, Remark 2.5 for acceptors: 2ⁿ).

Proof sketch:

1. Given M = (σ, δ, q₀, τ) reading least significant digit first, build M′ with states the functions σ → Δ, initial state τ, transition f ↦ (q ↦ f(δ(q, d))) and output f ↦ f(q₀). By induction, after reading the reversed word w^R the state is q ↦ τ(evalFrom q w), so the output on (n)_k reversed is τ(eval (n)_k) = a(n). The state set Δ^σ may be restricted to the finite set of reachable functions (their values lie in range τ, finite).
2. The converse is the same construction applied to the reversed word.

Direct prerequisites: [CA.2/automatic-sequences](#CA-2-automatic-sequences), [CA.2/automata-with-output](#CA-2-automata-with-output).

Source: [bridy-automaticcurves-2016](https://arxiv.org/abs/1604.08241v2), Section 2.1, p. 3. The theorem; Bridy's Proposition 2.4 proves it for values in a finite field through representations, the node's proof steps give the direct construction for any output alphabet.

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 4, Remarque, p. 406. The same statement.

<a id="CA-2-automatic-in-base-a-power"></a>

### k-automatic iff k^m-automatic

`ClassicalArithmeticCompletion:CA.2/automatic-in-base-a-power` · theorem.

Let k ≥ 2 and m ≥ 1. A sequence is k^m-automatic iff it is k-automatic.

Hypotheses and conventions: k ≥ 2, m ≥ 1.

Further acceptance checks:

- The Thue–Morse sequence is 4-automatic (and 2^m-automatic for every m).
- It is not 3-automatic (Cobham's theorem, which this node does not use).

Proof sketch:

1. By Eilenberg's theorem it suffices to compare kernels. The k^m-kernel is contained in the k-kernel (exponent me).
2. Conversely, write a k-kernel element with exponent e = mq + j (0 ≤ j < m) and r = r₀ + k^{mq}r₁ with r₀ < k^{mq}, r₁ < k^j: then k^e n + r = k^{mq}(k^j n + r₁) + r₀, so it is n ↦ b(k^j n + r₁) with b = (n ↦ a(k^{mq}n + r₀)) in the k^m-kernel; finitely many b, j < m and r₁ < k^j give finitely many elements.

Direct prerequisites: [CA.2/automatic-iff-finite-kernel](#CA-2-automatic-iff-finite-kernel), [CA.2/k-kernel](#CA-2-k-kernel), [CA.2/automatic-sequences](#CA-2-automatic-sequences).

Source: [bridy-automaticcurves-2016](https://arxiv.org/abs/1604.08241v2), Section 2.1, before Proposition 2.16, p. 9. The theorem.

<a id="CA-2-automatic-iff-uniform-morphism"></a>

### Cobham's characterisation by uniform morphisms

`ClassicalArithmeticCompletion:CA.2/automatic-iff-uniform-morphism` · theorem.

Let k ≥ 2. A sequence a : ℕ → Δ is k-automatic iff there are a finite alphabet Γ, a k-uniform morphism φ : Γ → Γ^k, a letter-to-letter coding τ : Γ → Δ and a fixed point s of φ (s(kn + r) = φ(s(n))_r for all n and r < k, in particular φ(s(0))₀ = s(0)) with a = τ ∘ s.

Hypotheses and conventions: k ≥ 2; the fixed point is encoded by the equations s(kn + r) = φ(s n) r, which determine s from s(0).

Further acceptance checks:

- Thue–Morse: Γ = {0, 1}, φ(0) = 01, φ(1) = 10, τ = id, s = 0110 1001 ….
- The Baum–Sweet sequence: Γ = {a, b, c, d}, φ(a) = ab, φ(b) = cb, φ(c) = bd, φ(d) = dd, τ(a) = τ(b) = 1, τ(c) = τ(d) = 0 (Christol–Kamae–Mendès France–Rauzy, p. 404).

Proof sketch:

1. (⇐) Read the digits of n most significant first: s(n) = δ*(s(0), (n)_k^R) for the automaton with transitions δ(x, r) = φ(x)_r, since s(kn + r) = φ(s n)_r; leading zeros are harmless because φ(s(0))₀ = s(0). Output τ; conclude by automaticity-is-independent-of-reading-direction.
2. (⇒) Take a most-significant-first automaton (σ, δ, q₀, τ) with δ(q₀, 0) = q₀: the reversal (automaticity-is-independent-of-reading-direction) of the kernel automaton of automatic-iff-finite-kernel has this property, because its initial state is the output map b ↦ b(0) and b(k·0) = b(0). Put Γ = σ, φ(q)_r = δ(q, r) and s(n) = δ*(q₀, (n)_k reversed); then s(kn + r) = φ(s n)_r and a = τ ∘ s.

Direct prerequisites: [CA.2/automatic-sequences](#CA-2-automatic-sequences), [CA.2/automaticity-is-independent-of-reading-direction](#CA-2-automaticity-is-independent-of-reading-direction), [CA.2/automatic-iff-finite-kernel](#CA-2-automatic-iff-finite-kernel).

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 5, Theorem 1 and the remark after it, p. 406. The theorem (i) ⇔ (ii) for every base k; Cobham's proof is not reproduced in the source, the proof steps give it.

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 3, p. 404. The fixed point of a k-uniform morphism, encoded in the node by s(kn + r) = φ(s n)_r.

<a id="CA-2-thue-morse-sequence"></a>

### The Thue–Morse sequence

`ClassicalArithmeticCompletion:CA.2/thue-morse-sequence` · definition.

The Thue–Morse sequence t : ℕ → 𝔽₂ is t(n) = s₂(n) mod 2, the parity of the sum of the binary digits of n: 0, 1, 1, 0, 1, 0, 0, 1, …. It satisfies t(2n) = t(n) and t(2n + 1) = 1 + t(n), is 2-automatic with 2-kernel {t, 1 + t}, is the fixed point of 0 ↦ 01, 1 ↦ 10, and its generating series T = ∑ t(n)Xⁿ ∈ 𝔽₂⟦X⟧ satisfies (1 + X)³T² + (1 + X)²T + X = 0.

Hypotheses and conventions: Values in ZMod 2 = 𝔽₂, so that 1 − t = 1 + t and the algebraic equation is over 𝔽₂.

API:

- `thueMorse` (data): t(n) = s₂(n) mod 2 ∈ ZMod 2.
- `thueMorse_two_mul` (simp): t(2n) = t(n).
- `thueMorse_two_mul_add_one` (simp): t(2n + 1) = 1 + t(n).
- `isAutomatic_thueMorse` (example): t is 2-automatic.
- `kernel_thueMorse` (characterisation): The 2-kernel of t is {t, 1 + t}.
- `thueMorse_algebraic` (relation): (1 + X)³T² + (1 + X)²T + X = 0 in 𝔽₂⟦X⟧ for T = ∑ t(n)Xⁿ.

Unit tests:

- `thueMorse_values` (computation): t(0), …, t(7) = 0, 1, 1, 0, 1, 0, 0, 1.
- `thueMorse_two_pow` (computation): t(2^j) = 1 for every j.
- `thueMorse_not_eventually_periodic` (non-example): t is not eventually periodic, so its series is not rational (a periodic mis-definition fails this).

Further acceptance checks:

- t is not eventually periodic, so T is algebraic of degree 2 but not rational.
- t(2^j) = 1.

Proof sketch:

1. Define t n := (Nat.digits 2 n).sum cast to ZMod 2.
2. t(2n) = t(n), t(2n + 1) = 1 + t(n) from Nat.digits 2 (2n + r) = r :: Nat.digits 2 n for n ≥ 1 (`Nat.digits_add_two_add_one`).
3. Kernel: by the two relations, n ↦ t(2^e n + r) is t or 1 + t according to the parity of s₂(r); both occur. Automaticity: the two-state parity automaton, or Eilenberg's theorem.
4. Algebraic equation: splitting n by parity, T = ∑ t(n)X^{2n} + X∑(1 + t(n))X^{2n} = (1 + X)T(X²) + X/(1 + X)² over 𝔽₂ (1 − X² = (1 + X)²), and T(X²) = T² (Frobenius on 𝔽₂⟦X⟧); multiplying by (1 + X)² gives (1 + X)³T² + (1 + X)²T + X = 0 (Christol–Kamae–Mendès France–Rauzy p. 403).

Direct prerequisites: [CA.2/automatic-sequences](#CA-2-automatic-sequences), [CA.2/k-kernel](#CA-2-k-kernel), `mathlib:Nat.digits`, `mathlib:Nat.digits_add_two_add_one`, `mathlib:PowerSeries.mk`, `mathlib:ZMod`.

Source: [byszewski-konieczny-automatic-2017](https://arxiv.org/abs/1705.08979), Section 1, p. 6 and p. 8. The API items `thueMorse_two_mul`, `thueMorse_two_mul_add_one` and `kernel_thueMorse`; the definition is on p. 6 ('t_n = 1 if s₂(n) is odd and t_n = 0 if s₂(n) is even').

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 2, pp. 402 to 403. The API item `thueMorse_algebraic`, the model instance of Christol's theorem.

Proof or interface frontier: Promote ThueMorse recurrences/kernel/algebraic equation if consumed. Non-eventual-periodicity acceptance/test has no proof outline or named supplier; requires its own lemma rather than unverified test claim.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-cartier-operators"></a>

### The Cartier operators on Laurent series

`ClassicalArithmeticCompletion:CA.2/cartier-operators` · definition.

For a field K, positive modulus q and r ∈ ℕ, the Cartier operator on K⸨X⸩ is Λ_r(∑ aₙXⁿ) = ∑ a_{qn+r}Xⁿ. It is K-linear. When r < q it preserves power series and polynomials, with degree at most natDegree P / q on a polynomial P. For finite K with q = |K| it satisfies Λ_r(gᵠh) = g·Λ_r(h), and f = ∑_{r<q} X^r(Λ_r f)^q. Define the unused q = 0 value to be zero; the coefficient specification applies only for q > 0.

Hypotheses and conventions: q > 0 is necessary for bounded-below Laurent support; r < q is necessary for the power-series and polynomial preservation statements. The Frobenius identities require finite K and q = |K|, so c^q = c for c ∈ K. The value at q = 0 is an explicitly specified junk value, not a coefficient-decimation operator.

API:

- `LaurentSeries.cartier` (data): For q > 0, coefficient decimation Λ_r on Laurent series; cartier 0 r f = 0 by convention.
- `LaurentSeries.cartier_zero` (simp): cartier 0 r f = 0 (the explicit junk-value convention).
- `LaurentSeries.coeff_cartier` (simp): For q > 0: (Λ_r f).coeff n = f.coeff (q*n+r), for every n ∈ ℤ.
- `LaurentSeries.cartier_add` (simp): Λ_r(f + g) = Λ_r f + Λ_r g.
- `LaurentSeries.cartier_smul` (simp): Λ_r(c f) = c Λ_r f for c ∈ K.
- `LaurentSeries.cartier_ofPowerSeries` (compatibility): For q > 0 and r < q, Λ_r of ∑ aₙXⁿ is the power series ∑ a(qn+r)Xⁿ.
- `LaurentSeries.cartier_pow_card_mul` (relation): For |K| = q: Λ_r(gᵠh) = g·Λ_r h.
- `LaurentSeries.eq_sum_single_mul_cartier_pow` (relation): For |K| = q: f = ∑_{r<q} X^r (Λ_r f)^q.
- `LaurentSeries.natDegree_cartier_le` (other): For q > 0 and r < q, Λ_r of P is a polynomial P′ with natDegree P′ ≤ natDegree P / q.

Unit tests:

- `LaurentSeries.cartier_single` (computation): Λ_r(X^m) = X^{(m−r)/q} if q ∣ m − r, and 0 otherwise (0 ≤ r < q).
- `LaurentSeries.cartier_one_zero` (degenerate): With modulus 1, Λ₀ is the identity.
- `LaurentSeries.cartier_pow_card` (characterisation): Over a finite field with q elements, Λ₀(gᵠ) = g.
- `LaurentSeries.cartier_zero_modulus` (degenerate): cartier 0 0 1 = 0. The coefficient formula cannot hold at q = 0, because it would give nonzero coefficients at every negative exponent.
- `LaurentSeries.cartier_outside_residue_range` (non-example): cartier 1 1 1 = X⁻¹: without r < q, a power series can decimate to a Laurent series with a negative exponent.

Further acceptance checks:

- Λ_r(X^m) = X^{(m−r)/q} if m ≡ r (mod q) and 0 otherwise.
- With q = 1, Λ₀ is the identity.
- Over a finite field, Λ₀(gᵠ) = g.
- q = 0 is excluded from coefficient decimation: for f = 1, r = 0 the proposed coefficient function is 1 at every exponent and has no lower support bound.
- Power-series preservation requires r < q; cartier 1 1 1 = X⁻¹ is a counterexample without that hypothesis.

Proof sketch:

1. For q > 0 the coefficient function n ↦ f.coeff (q*n+r) has bounded-below support because multiplication by positive q is order preserving on ℤ. Set cartier 0 r f = 0 separately.
2. Linearity is coefficientwise (and trivial at q = 0). For q > 0 and r < q, a negative n has q*n+r < 0; thus decimation of a power series has no negative coefficients and agrees with the decimated sequence under HahnSeries.ofPowerSeries.
3. For |K| = q: (∑ bₙXⁿ)^q = ∑ bₙ^q X^{qn} = ∑ bₙX^{qn} (Frobenius and `FiniteField.pow_card`), so the coefficient of X^{qn+r} in gᵠh is ∑_m b_m h_{q(n−m)+r}, which is the coefficient of Xⁿ in g·Λ_r(h).
4. f = ∑_r X^r(Λ_r f)^q by splitting exponents by residue mod q and the same Frobenius computation.
5. For q > 0 and r < q, decimation of P is a polynomial: its negative coefficients vanish and its nonzero exponents satisfy q*n+r ≤ natDegree P, giving natDegree Λ_r(P) ≤ natDegree P / q.

Direct prerequisites: `mathlib:LaurentSeries`, `mathlib:HahnSeries.single`, `mathlib:HahnSeries.ofPowerSeries`, `mathlib:FiniteField.pow_card`, `mathlib:frobenius`, `mathlib:Polynomial.natDegree`.

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 6, p. 407. The source has q = |K| ≥ 2 and r ∈ [q] = {0,…,q−1}. The definition extends to positive q and arbitrary natural r on Laurent series; power-series preservation retains r < q.

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Sections 6 and 7, pp. 407 to 408. The API items `eq_sum_single_mul_cartier_pow` and `cartier_pow_card_mul`.

Source: [rowland-stipulanti-yassawi-bridy-2023](https://arxiv.org/abs/2308.10977v2), Section 3, Proposition 4 and the display before it, p. 5. The same identity; the display before it gives the degree bound for polynomials (the sum stops at ⌊N/q⌋).

Proof or interface frontier: The q=0 coefficient formula has unbounded-below support (f1,r0 gives coefficients1 at every integer). For r≥q, polynomial/power-series preservation fails: q1,r1,f1 gives X⁻1. The Cartier hypotheses are corrected, but the Frobenius-product and residue-reconstruction APIs consumed by the Christol proof still need individual lemma nodes and direct prerequisites at lemma granularity.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-ore-relation"></a>

### Ore relations for algebraic power series over a finite field

`ClassicalArithmeticCompletion:CA.2/ore-relation` · lemma.

Let K be a finite field with q elements and f ∈ K⟦X⟧ algebraic over K[X] (equivalently over K(X)). Then there are m ≥ 0 and a₀, …, a_m ∈ K[X] with a₀ ≠ 0 such that ∑_{i=0}^m aᵢ f^{qⁱ} = 0.

Hypotheses and conventions: Algebraic is Mathlib's `IsAlgebraic K[X] f` for the K[X]-algebra K⟦X⟧ (`PowerSeries.algebraPolynomial`).

Further acceptance checks:

- For rational f = P/Q ≠ 0: P^{q−1}Q·f − Q^q·f^q = 0 is an Ore relation with a₀ = P^{q−1}Q ≠ 0.
- Thue–Morse (q = 2): subtracting the square of (1 + X)³T² + (1 + X)²T + X = 0 from X times it removes the constant term and gives X(1 + X)²T + (1 + X)³T² + (1 + X)⁶T⁴ = 0, an Ore relation with a₀ = X(1 + X)² ≠ 0.
- The relation cannot in general be taken with a₀(0) ≠ 0 (above, a₀(0) = 0), which is why the proof divides by a₀ in K⸨X⸩ rather than in K⟦X⟧.

Proof sketch:

1. The K(X)-span of f, f^q, f^{q²}, … lies in the finite extension K(X)(f) ⊆ K⸨X⸩, so for m = [K(X)(f) : K(X)] these m + 1 elements are linearly dependent; clearing denominators gives a nontrivial relation ∑ aᵢf^{qⁱ} = 0 with aᵢ ∈ K[X].
2. Among all nontrivial relations choose one whose least index j with a_j ≠ 0 is minimal, and suppose j ≥ 1. Since a_j = ∑_r X^r(Λ_r a_j)^q, some Λ_r(a_j) ≠ 0.
3. Apply Λ_r: as f^{qⁱ} = (f^{q^{i−1}})^q, Λ_r(aᵢf^{qⁱ}) = Λ_r(aᵢ)f^{q^{i−1}} (cartier-operators), giving a relation ∑_{i≥j} Λ_r(aᵢ) f^{q^{i−1}} = 0 whose least index is j − 1 with nonzero coefficient, a contradiction; so j = 0.

Direct prerequisites: [CA.2/cartier-operators](#CA-2-cartier-operators), `mathlib:IsAlgebraic`, `mathlib:PowerSeries.algebraPolynomial`, `mathlib:FiniteField.pow_card`.

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 7, p. 408. The proof steps.

Source: [adamczewski-yassawi-christol-2019](https://adamczewski.perso.math.cnrs.fr/Note_On_Christol.pdf), Section 1, p. 2. The name and the statement.

<a id="CA-2-algebraic-series-are-automatic"></a>

### Algebraic power series over 𝔽_q have q-automatic coefficients

`ClassicalArithmeticCompletion:CA.2/algebraic-series-are-automatic` · theorem.

Let K be a finite field with q elements and f = ∑ aₙXⁿ ∈ K⟦X⟧ algebraic over K[X]. Then (aₙ) is q-automatic.

Hypotheses and conventions: K finite, q = |K|.

Further acceptance checks:

- Thue–Morse: the relation (1 + X)³T² + (1 + X)²T + X = 0 yields a finite Λ-stable set; the kernel has 2 elements.
- Rational series (degree 1) give eventually periodic, in particular automatic, sequences.

Proof sketch:

1. By ore-relation, ∑_{i=0}^k aᵢf^{qⁱ} = 0 with a₀ ≠ 0. Put g = f/a₀ ∈ K⸨X⸩; then g = ∑_{i=1}^k bᵢ g^{qⁱ} with bᵢ = −aᵢa₀^{qⁱ−2} ∈ K[X].
2. Let N = max(deg a₀, deg bᵢ) and H = {∑_{i=0}^k cᵢg^{qⁱ} : cᵢ ∈ K[X], deg cᵢ ≤ N}, a finite set (K finite). f = a₀g ∈ H.
3. H is stable under every Λ_r: for h = ∑ cᵢg^{qⁱ}, substituting g = ∑ bᵢg^{qⁱ} in the i = 0 term gives h = ∑_{i≥1}(c₀bᵢ + cᵢ)g^{qⁱ}, so Λ_r(h) = ∑_{i≥1} Λ_r(c₀bᵢ + cᵢ)g^{q^{i−1}} (cartier-operators), with deg Λ_r(c₀bᵢ + cᵢ) ≤ 2N/q ≤ N.
4. Hence the Λ-orbit of f, which is the set of generating series of the q-kernel of (aₙ) (`LaurentSeries.cartier_ofPowerSeries`), is finite; by automatic-iff-finite-kernel, (aₙ) is q-automatic.

Direct prerequisites: [CA.2/ore-relation](#CA-2-ore-relation), [CA.2/cartier-operators](#CA-2-cartier-operators), [CA.2/k-kernel](#CA-2-k-kernel), [CA.2/automatic-iff-finite-kernel](#CA-2-automatic-iff-finite-kernel), [CA.2/automatic-sequences](#CA-2-automatic-sequences), `mathlib:FiniteField.pow_card`.

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 7, p. 409. The first step.

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 7, p. 409. The finite stable set and the conclusion through the kernel.

<a id="CA-2-automatic-series-are-algebraic"></a>

### Power series over 𝔽_q with q-automatic coefficients are algebraic

`ClassicalArithmeticCompletion:CA.2/automatic-series-are-algebraic` · theorem.

Let K be a finite field with q elements and a : ℕ → K q-automatic. Then f = ∑ aₙXⁿ is algebraic over K[X]; if the q-kernel has m elements, the degree of f is at most q^m − 1.

Hypotheses and conventions: K finite, q = |K|.

Further acceptance checks:

- The Thue–Morse kernel has 2 elements, and T has degree 2 ≤ 2² − 1.
- Eventually periodic sequences give rational series.

Proof sketch:

1. Let y₁, …, y_m be the generating series of the q-kernel of a (finite by automatic-iff-finite-kernel); it is stable under the Λ_r (`LaurentSeries.cartier_ofPowerSeries`).
2. By f = ∑_r X^r(Λ_r f)^q (cartier-operators), each yᵢ lies in the K(X)-span of y₁^q, …, y_m^q; raising to q-th powers (a K(X)-semilinear bijection onto its image), y_i^{q^j} lies in the span of the y^{q^{j+1}}, and by induction {yᵢ, yᵢ^q, …, yᵢ^{q^m}} lies in the span of y₁^{q^{m+1}}, …, y_m^{q^{m+1}}, of dimension ≤ m.
3. So yᵢ, yᵢ^q, …, yᵢ^{q^m} are K(X)-linearly dependent: a nonzero polynomial ∑ cⱼT^{qʲ} over K(X) vanishes at yᵢ, and clearing denominators f = y₁ is algebraic over K[X]; dividing by T when f ≠ 0 bounds the degree by q^m − 1.

Direct prerequisites: [CA.2/cartier-operators](#CA-2-cartier-operators), [CA.2/k-kernel](#CA-2-k-kernel), [CA.2/automatic-iff-finite-kernel](#CA-2-automatic-iff-finite-kernel), [CA.2/automatic-sequences](#CA-2-automatic-sequences), `mathlib:IsAlgebraic`, `mathlib:PowerSeries.algebraPolynomial`.

Source: [bridy-automaticcurves-2016](https://arxiv.org/abs/1604.08241v2), Section 2.3, Proposition 2.13, p. 7. The theorem (the height bound is not part of the node).

Source: [bridy-automaticcurves-2016](https://arxiv.org/abs/1604.08241v2), Section 2.3, proof of Proposition 2.13, p. 7. The proof steps.

Proof or interface frontier: Algebraicity and degree bound q^m−1 are different declarations; sourceprovesboundafteralgebraicity, split degree bound and add native bound signature (currentlyonlyIsAlgebraic).

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-christol-theorem"></a>

### Christol's theorem

`ClassicalArithmeticCompletion:CA.2/christol-theorem` · theorem.

Let p be a prime, K a finite field of characteristic p with q = p^r elements (r ≥ 1), and a : ℕ → K. Then the power series ∑ aₙXⁿ ∈ K⟦X⟧ is algebraic over K(X) (equivalently over K[X]) iff the sequence (aₙ) is p-automatic, iff it is q-automatic.

Hypotheses and conventions: K finite of characteristic p; the automata read base-p (or base-q) digits least significant first. Algebraic over K[X] is Mathlib's `IsAlgebraic K[X] f` for the K[X]-algebra K⟦X⟧; the statement is specific to finite fields (over ℚ, the algebraic series ∑ C(2n, n)Xⁿ has non-automatic coefficients).

Further acceptance checks:

- Thue–Morse over 𝔽₂: algebraic of degree 2 and 2-automatic.
- Over 𝔽₄ (q = 4, p = 2) the theorem allows either base 2 or base 4.
- Characteristic 0 is excluded: ∑ C(2n, n)Xⁿ = (1 − 4X)^{−1/2} is algebraic over ℚ(X) but C(2n, n) takes infinitely many values.

Proof sketch:

1. q = p^r (`FiniteField.card`).
2. Algebraic ⇒ q-automatic: algebraic-series-are-automatic. q-automatic ⇒ algebraic: automatic-series-are-algebraic.
3. q-automatic ⇔ p-automatic: automatic-in-base-a-power with k = p, m = r.

Direct prerequisites: [CA.2/algebraic-series-are-automatic](#CA-2-algebraic-series-are-automatic), [CA.2/automatic-series-are-algebraic](#CA-2-automatic-series-are-algebraic), [CA.2/automatic-in-base-a-power](#CA-2-automatic-in-base-a-power), `mathlib:FiniteField.card`, `mathlib:CharP`, `mathlib:IsAlgebraic`.

Source: [adamczewski-yassawi-christol-2019](https://adamczewski.perso.math.cnrs.fr/Note_On_Christol.pdf), Section 1, Theorem 1.1, p. 1. The theorem in base q.

Source: [bridy-automaticcurves-2016](https://arxiv.org/abs/1604.08241v2), Section 2.1, p. 9. The theorem in base p, as the node's Lean statement.

Source: [christol-suitesalgebriques-1980](http://www.numdam.org/item/10.24033/bsmf.1926.pdf), Section 5, Theorem 1, p. 406. The original form (i) ⇔ (iii), for sequences in a finite alphabet embedded in a finite field of characteristic p.

<a id="CA-2-mediant"></a>

### The mediant of two fractions

`ClassicalArithmeticCompletion:CA.2/mediant` · definition.

For rationals x = a/b and y = c/d written in lowest terms (b, d > 0), the mediant is (a + c)/(b + d) ∈ ℚ. If x < y then x < mediant(x, y) < y. If bc − ad = 1 then (a + c)/(b + d) is already in lowest terms: its numerator is a + c and its denominator b + d.

Hypotheses and conventions: The mediant depends on the representations; it is defined through the reduced forms (Rat.num, Rat.den), which is the convention of the Farey sequence. It is neither the arithmetic mean nor symmetric in the representation: 1/3 and 2/3 give 3/6 = 1/2.

API:

- `mediant` (data): (x.num + y.num)/(x.den + y.den).
- `mediant_comm` (simp): mediant x y = mediant y x.
- `mediant_mem_Ioo` (characterisation): x < y implies x < mediant x y < y.
- `mediant_self` (simp): mediant x x = x.
- `den_mediant_of_det` (characterisation): If y.num·x.den − x.num·y.den = 1 then the mediant has numerator x.num + y.num and denominator x.den + y.den.

Unit tests:

- `mediant_zero_one` (computation): mediant 0 1 = 1/2.
- `mediant_third_twothirds` (non-example): mediant (1/3) (2/3) = 1/2, whose denominator is 2, not 3 + 3.
- `mediant_ne_average` (non-example): mediant 0 (1/2) = 1/3, not the midpoint 1/4.

Further acceptance checks:

- mediant(0, 1) = 1/2; mediant(1/3, 2/3) = 1/2 with denominator 2, not 6; mediant(0, 1/2) = 1/3, not 1/4.
- mediant(x, x) = x.

Proof sketch:

1. Define mediant x y := (x.num + y.num)/(x.den + y.den) as a rational number.
2. x < mediant < y: cross-multiply; a/b < c/d means ad < bc, and ad < bc implies ab + ad < ab + bc and ad + cd < bc + cd.
3. If bc − ad = 1 then any common divisor of a + c and b + d divides b(a + c) − a(b + d) = bc − ad = 1.

Direct prerequisites: `mathlib:Rat.num_div_den`, `mathlib:Rat.num_div_eq_of_coprime`.

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.1, printed p. 21. The definition.

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.1, printed p. 21. The API item `mediant_mem_Ioo`.

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.1, printed p. 26. The unit test `mediant_third_twothirds`: the mediant of reduced fractions need not be reduced.

<a id="CA-2-farey-sequence"></a>

### The Farey sequence F_n

`ClassicalArithmeticCompletion:CA.2/farey-sequence` · definition.

For n ≥ 1, the Farey sequence F_n is the set of rational numbers x with 0 ≤ x ≤ 1 whose denominator (in lowest terms) is at most n, listed in increasing order; F_0 = ∅. Its cardinality is 1 + ∑_{k=1}^n φ(k); F_n ⊆ F_{n+1}; x ∈ F_n iff 1 − x ∈ F_n.

Hypotheses and conventions: Elements are rationals (so 2/4 and 1/2 are the same term); the order is the order of ℚ. The convention includes both endpoints 0/1 and 1/1 (Hatcher; Hardy–Wright).

API:

- `fareySeq` (data): F_n as a Finset ℚ.
- `mem_fareySeq` (characterisation): x ∈ F_n iff 0 ≤ x ≤ 1, 1 ≤ n and x.den ≤ n.
- `card_fareySeq` (other): |F_n| = 1 + ∑_{k=1}^n φ(k) for n ≥ 1.
- `fareySeq_mono` (other): m ≤ n implies F_m ⊆ F_n.
- `one_sub_mem_fareySeq` (other): x ∈ F_n implies 1 − x ∈ F_n.

Unit tests:

- `fareySeq_three` (computation): F₃ = {0, 1/3, 1/2, 2/3, 1}.
- `card_fareySeq_seven` (computation): |F₇| = 19 (Hatcher lists F₇).
- `fareySeq_zero` (degenerate): F₀ = ∅.
- `fareySeq_one` (non-example): F₁ = {0, 1}, and 2/4 = 1/2 is a single term: F_n is a set of rationals, not of pairs.

Further acceptance checks:

- F₁ = {0, 1}, F₃ = {0, 1/3, 1/2, 2/3, 1}, |F₇| = 19.
- The Ladies' Diary question (1747) asks for |F₉₉| − 2 = 3003.

Proof sketch:

1. Define fareySeq n as the image of {(h, k) : 0 ≤ h ≤ n, 1 ≤ k ≤ n} under (h, k) ↦ h/k, filtered by ≤ 1, as a Finset ℚ (sorted by the order of ℚ when listed).
2. Membership: x ∈ F_n iff 0 ≤ x ≤ 1, n ≥ 1 and x.den ≤ n (write x = x.num/x.den, `Rat.num_div_den`).
3. Cardinality: the elements with denominator exactly k ≥ 2 are h/k with 0 < h < k coprime to k, φ(k) of them (`Nat.totient`); denominator 1 contributes 0 and 1.
4. Monotonicity and the symmetry x ↦ 1 − x (same denominator).

Direct prerequisites: `mathlib:Nat.totient`, `mathlib:Rat.num_div_den`, `mathlib:Finset.card_image_of_injective`.

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.2, printed p. 28. The definition (0 and 1 included, as Hatcher's F₇ shows).

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.2, printed p. 28. The passage from F_n to F_{n+1} (API `fareySeq_mono`) and the new terms of denominator n + 1.

<a id="CA-2-denominators-between-farey-neighbours"></a>

### Fractions between neighbours have denominator at least b + d

`ClassicalArithmeticCompletion:CA.2/denominators-between-farey-neighbours` · lemma.

Let a/b < c/d be fractions in lowest terms with bc − ad = 1. Every rational x/y strictly between them has y ≥ b + d, and the only one with y = b + d is the mediant (a + c)/(b + d).

Hypotheses and conventions: b, d > 0 and bc − ad = 1.

Further acceptance checks:

- Between 1/3 and 1/2 (det 1) the first fraction to appear is 2/5.
- The determinant hypothesis is needed: between 0/1 and 2/3 (det 2) lies 1/2 with denominator 2 < 1 + 3.

Proof sketch:

1. Write the rational as x/y in lowest terms. From a/b < x/y: bx − ay ≥ 1; from x/y < c/d: cy − dx ≥ 1.
2. Then y = y(bc − ad) = d(bx − ay) + b(cy − dx) ≥ b + d.
3. If y = b + d then bx − ay = cy − dx = 1, and solving, (x, y) = (a + c, b + d).

Direct prerequisites: [CA.2/mediant](#CA-2-mediant).

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.2, printed p. 30. The consequence of the lemma for Farey sequences; Hatcher derives it from the square Farey diagram (the vertex a/b sits at height 1/b), the node gives the arithmetic proof.

<a id="CA-2-farey-neighbour-property"></a>

### The neighbour property of Farey sequences

`ClassicalArithmeticCompletion:CA.2/farey-neighbour-property` · theorem.

Let n ≥ 1 and let a/b < c/d be consecutive terms of F_n (in lowest terms). Then bc − ad = 1 and b + d > n.

Hypotheses and conventions: Consecutive: no term of F_n lies strictly between them.

Further acceptance checks:

- In F₇, 2/5 and 3/7 are consecutive: 5·3 − 2·7 = 1 and 5 + 7 > 7.
- Hatcher, Proposition 1.1: edges of the Farey diagram are exactly the pairs with determinant ±1.

Proof sketch:

1. Induct on n. F₁ = {0/1, 1/1}: 1·1 − 0·1 = 1 and 1 + 1 > 1.
2. Passing from F_n to F_{n+1}: new terms have denominator n + 1 and lie strictly between consecutive a/b < c/d of F_n with bc − ad = 1; by denominators-between-farey-neighbours they have denominator ≥ b + d > n, so a new term exists only if b + d = n + 1 and it is then the mediant, unique.
3. The new consecutive pairs (a/b, (a + c)/(b + d)) and ((a + c)/(b + d), c/d) have determinant 1 (b(a + c) − a(b + d) = bc − ad) and denominator sums > n + 1; untouched pairs have b + d ≥ n + 2 > n + 1.

Direct prerequisites: [CA.2/farey-sequence](#CA-2-farey-sequence), [CA.2/denominators-between-farey-neighbours](#CA-2-denominators-between-farey-neighbours), [CA.2/mediant](#CA-2-mediant).

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.1, Proposition 1.1, printed p. 23. The determinant criterion; consecutive terms of F_n are joined by an edge (the Farey series is the part of the square diagram above height 1/n, p. 30).

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.2, printed p. 30. The inductive passage from F_n to F_{n+1} used in the proof steps.

<a id="CA-2-farey-mediant-property"></a>

### The mediant property of Farey sequences

`ClassicalArithmeticCompletion:CA.2/farey-mediant-property` · theorem.

Let n ≥ 1 and let a/b < c/d < e/f be three consecutive terms of F_n. Then c/d = (a + e)/(b + f), the mediant of its neighbours reduced to lowest terms.

Hypotheses and conventions: Three consecutive terms of F_n; the mediant need not be in lowest terms (in F₇, 1/5, 1/4, 2/7 gives 3/12 = 1/4).

Further acceptance checks:

- In F₇: 1/5, 1/4, 2/7 → (1 + 2)/(5 + 7) = 3/12 = 1/4.
- In F₃: 1/3, 1/2, 2/3 → 3/6 = 1/2.

Proof sketch:

1. By farey-neighbour-property, bc − ad = 1 and de − cf = 1.
2. Then c(b + f) − d(a + e) = (bc − ad) − (de − cf) = 0, so (a + e)/(b + f) = c/d as rational numbers: this is the mediant reduced to lowest terms, the cancelled factor being be − af (Hatcher p. 31).

Direct prerequisites: [CA.2/farey-neighbour-property](#CA-2-farey-neighbour-property), [CA.2/mediant](#CA-2-mediant).

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.2, printed p. 31. The theorem, with edges supplied by the neighbour property.

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.2, printed p. 28. The acceptance example.

<a id="CA-2-stern-brocot-tree"></a>

### The Stern–Brocot tree

`ClassicalArithmeticCompletion:CA.2/stern-brocot-tree` · construction.

The Stern–Brocot tree assigns to every path w ∈ {left, right}* a pair of bounds (a/b, c/d) and a node value: the root has bounds (0/1, 1/0) and value 1/1; the node at w has value the mediant (a + c)/(b + d) of its bounds; its left child has bounds (a/b, (a + c)/(b + d)) and its right child ((a + c)/(b + d), c/d). The bounds always satisfy cb − ad = 1, the value is in lowest terms with denominator b + d, lies strictly between the bounds, and the left (right) subtree lies below (above) the node. This is the upper half (between 0/1 and 1/0) of Hatcher's Farey diagram with its mediant labelling.

Hypotheses and conventions: Bounds are pairs of natural numbers with 1/0 standing for ∞; a path is a List Bool (false = left, true = right), read from the root.

API:

- `sternBrocotBounds` (data): The bounding pair ((a, b), (c, d)) along a path.
- `sternBrocot` (data): The node value (a + c)/(b + d) along a path.
- `sternBrocotBounds_det` (relation): cb − ad = 1 for the bounds of every node.
- `den_sternBrocot` (characterisation): The value has denominator b + d (it is in lowest terms).
- `sternBrocot_lt_append_true` (other): Every node of the right subtree of w is larger than the node at w.
- `sternBrocot_append_false_lt` (other): Every node of the left subtree of w is smaller than the node at w.

Unit tests:

- `sternBrocot_nil` (degenerate): The root is 1/1.
- `sternBrocot_small` (computation): sternBrocot [left] = 1/2, sternBrocot [right] = 2, sternBrocot [left, right] = 2/3.
- `sternBrocot_ne_three_sixths` (non-example): The node [left] has denominator 2: nodes are stored in lowest terms, never as 3/6.

Further acceptance checks:

- Root 1/1; left child 1/2, right child 2/1; left-then-right 2/3.
- The node 1/2 is recorded with denominator 2, never 3/6.

Proof sketch:

1. Define sternBrocotBounds w by folding the two update rules over w from ((0, 1), (1, 0)), and sternBrocot w := (a + c)/(b + d) as a rational.
2. Determinant invariant: cb − ad = 1 at the root and is preserved by both updates (b(a + c) − a(b + d) = bc − ad).
3. Lowest terms and denominator: by `den_mediant_of_det` (mediant) the value has numerator a + c and denominator b + d.
4. Order: the value lies strictly between the bounds (mediant), and every descendant's bounds lie inside the parent's, giving the in-order property.

Direct prerequisites: [CA.2/mediant](#CA-2-mediant).

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.1, printed p. 21. The construction: the triangles below the edge from 0/1 to 1/0 form the Stern–Brocot tree, the long edge of a triangle being the pair of bounds.

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.1, Corollary 1.2, printed p. 25. The API item `den_sternBrocot`.

Proof or interface frontier: sternBrocotBounds and sternBrocot are two data declarations; split. Rational mediant API has positive denominators and cannot be used at∞bound(1,0); prove coprimality/order directly with raw pairs incld0. Promote subtree-order API consumed86.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-stern-brocot-enumerates-positive-rationals"></a>

### Every positive rational occurs exactly once in the Stern–Brocot tree

`ClassicalArithmeticCompletion:CA.2/stern-brocot-enumerates-positive-rationals` · theorem.

The map w ↦ sternBrocot w from finite left/right paths to ℚ is injective and its image is the set of positive rationals.

Hypotheses and conventions: Paths are finite words; values are positive rationals in lowest terms.

Further acceptance checks:

- 3/8 = [0; 2, 1, 2] is the node along left, left, right, left (through 1, 1/2, 1/3, 2/5); its depth 4 is below its denominator 8.
- The positive rationals are listed in increasing order by the in-order traversal.

Proof sketch:

1. Determinant-one bounds: for the raw lower (a,b) and upper (c,d), including the initial upper bound (1,0), bc−ad=1. The mediant (a+c)/(b+d) is reduced and lies strictly between the two bounds. Prove these using integer cross-products, without applying the positive-denominator Rat.mediant API to the infinite bound.
2. Injectivity: nodes in the left and right descendant subtrees lie strictly to the left and right of the parent mediant. Distinct paths either diverge into disjoint subtrees or one is a proper ancestor of the other; in both cases their values differ.
3. Surjectivity: fix a reduced positive target p/q between the current bounds and set U=bp−aq and V=cq−dp. Both are positive integers; initially (U,V)=(p,q). If U<V the target lies left of the mediant and updating the upper bound to (a+c,b+d) changes (U,V) to (U,V−U). If U>V the right update changes it to (U−V,V). Thus U+V strictly decreases at every update.
4. At U=V, p(b+d)=q(a+c), so the reduced target equals the reduced mediant and the search stops. Well-founded induction on the positive integer U+V proves every positive rational occurs. A denominator-only measure is invalid: the right spine enumerates positive integers with denominator1.

Direct prerequisites: [CA.2/stern-brocot-tree](#CA-2-stern-brocot-tree), [CA.2/denominators-between-farey-neighbours](#CA-2-denominators-between-farey-neighbours), [CA.2/mediant](#CA-2-mediant).

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.1, Proposition 1.3, printed p. 26. Surjectivity.

Source: [hatcher-topologyofnumbers-2024](https://pi.math.cornell.edu/~hatcher/TN/TNbook.pdf), Section 1.1, printed p. 21. The order property that gives injectivity.

Proof or interface frontier: Claim that b+d strictly increases and depth≤q is false along right spine: integer5 (q1) requires4rightsteps while denominator stays1. Correct surjectivity using positive coordinatesU=bp−aq,V=cq−dp, atroot(p,q); left sends(U,V)to(U,V−U), rightto(U−V,V), so U+V strictlydecreasesuntilU=V. Split injectivity and range into supporting lemmas.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-2-dfao-output-reversal"></a>

### Reversing all words of a finite output automaton

`ClassicalArithmeticCompletion:CA.2/dfao-output-reversal` · lemma.

For any input alphabet α, finite state type σ, output alphabet Δ and DFAO M on α with states σ, there is a DFAO N with finitely many states such that N.output(N.eval(w)) = M.output(M.eval(reverse(w))) for every word w. This includes empty words and arbitrary zero padding, without a canonical-digit restriction.

Hypotheses and conventions: No finiteness assumption on α or Δ; finiteness of σ suffices.

Unit tests:

- `reversal_order` (computation): For the automaton on ZMod 3 with initial state 0, transition q↦q+1 on false and q↦2q on true, the words [false,true] and [true,false] reach 2 and 1 respectively.

Further acceptance checks:

- The empty word returns the original initial output.
- A noncommuting transition pair is composed in reverse order; a parity-only test would not detect an incorrect order.
- The equality holds on padded words, not only canonical expansions.

Proof sketch:

1. Let E be the finite image of M.output. Use the finite set of functions σ → E as states, with initial function q ↦ M.output(q), transition g on a given by q ↦ g(M.step(q,a)), and output g(M.start).
2. Induction on w gives the stronger state identity g_w(q) = M.output(M.evalFrom(q,reverse(w))). Evaluate at M.start.
3. Encode the finite state set by Fin of its cardinality when the target existential requires states in Type; this avoids imposing a universe restriction on Δ.

Direct prerequisites: [CA.2/automata-with-output](#CA-2-automata-with-output), `mathlib:Fintype.equivFin`.

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), Definition 2 and Lemma 5, p.1; direct reversal construction extending the inherited reading-direction proof. The source uses finite output automata on all words. This is the explicit worker deduction needed to preserve that convention under reversal.

<a id="CA-2-automatic-bounded-digit-carry"></a>

### Finite carries for arbitrary bounded digits

`ClassicalArithmeticCompletion:CA.2/automatic-bounded-digit-carry` · lemma.

Let k≥2, d≥0 and f:ℕ→Δ be k-automatic. There is a finite-state DFAO M on Fin(d+1) such that M.output(M.eval(w)) = f(Nat.ofDigits k (the list of digit values of w)) for every word w, read least significant digit first. Digits are allowed to exceed k−1.

Hypotheses and conventions: The existing canonical least-significant-first definition of IsAutomatic is retained. The output alphabet is arbitrary; no independent finiteness assumption is added.

Unit tests:

- `boundedCarry_three` (non-example): The next carry for base 2, carry 3 and digit 4 is ⌊7/2⌋=3, so the bound 2 would fail.

Further acceptance checks:

- At k=2, d=4, carry 3 and digit 4 give next carry 3; a carry bound of 2 fails.
- The empty word has V=0 and output f(0).
- At k=3 the little-endian words [3] and [0,1] both output f(3).
- Trailing zero digits preserve the represented integer and the output.

Proof sketch:

1. By automatic-iff-finite-kernel the k-kernel K of f is finite. Use states (g,c) with g∈K and 0≤c≤d, initial state (f,0), output g(c).
2. For digit e≤d set r=(c+e) mod k and c′=⌊(c+e)/k⌋, and replace g by g′(n)=g(kn+r). Since c+e≤2d and k≥2, c′≤d. Writing g(n)=f(k^j n+s) shows directly that g′ is again a kernel element, with residue k^j r+s<k^(j+1).
3. After a word of length L and little-endian value V, prove the invariant g(n+c)=f(k^L n+V) for every n≥0. The transition uses kc′+r=c+e, and appending the new high digit changes V to V+ek^L. At n=0 the output is f(V), including any unflushed final carry.
4. The state set is finite and can be encoded by Fin of its cardinality. No assumption that the last digit is nonzero is used.

Direct prerequisites: [CA.2/automatic-sequences](#CA-2-automatic-sequences), [CA.2/automatic-iff-finite-kernel](#CA-2-automatic-iff-finite-kernel), [CA.2/k-kernel](#CA-2-k-kernel), [CA.2/automata-with-output](#CA-2-automata-with-output), `mathlib:Nat.ofDigits_append`, `mathlib:Fintype.equivFin`.

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), Lemma 5, p.1, normalization step; explicit bounded-carry proof supplied here. The source cites two books for normalization. The displayed invariant is a self-contained deduction on the inherited kernel, replacing that unread proof input.

<a id="CA-2-automatic-redundant-digits"></a>

### Automaticity with redundant most-significant-first digits

`ClassicalArithmeticCompletion:CA.2/automatic-redundant-digits` · theorem.

Let k≥2 and k≤d+1. A sequence f:ℕ→Δ is k-automatic exactly when some finite-state DFAO M on Fin(d+1) satisfies M.output(M.eval(w)) = f(Nat.ofDigits k (reverse of the list of values of w)) for every word w. Thus every representation is accepted, including leading zeros and noncanonical digits.

Hypotheses and conventions: Digits range from 0 through d, so all ordinary digits 0,…,k−1 are present.

Unit tests:

- `redundant_same_value` (compatibility): In base 3 the most-significant-first words [3] and [1,0] have equal native Nat.ofDigits values.
- `redundant_leading_zero` (degenerate): For every base k and word w, the most-significant-first words 0::w and w have equal native values.

Further acceptance checks:

- For d=k−1 this is the standard base-k alphabet with harmless leading zeros.
- For d=2k the one-letter word [2k] must produce f(2k).
- A most-significant-first [1,0] and the noncanonical [k] both have value k.

Proof sketch:

1. The forward implication applies automatic-bounded-digit-carry and then dfao-output-reversal. Reverse commutes with mapping digit values, giving the desired most-significant-first evaluation.
2. For the reverse implication restrict the transition to Fin k, embedded in Fin(d+1). Apply the all-word hypothesis to the reversed canonical digits of n. The native ofDigits_digits identity gives n, and the inherited reading-direction theorem returns IsAutomatic k f.
3. Keep the universal quantifier over words: correctness only on canonical words would not justify appending arbitrary suffixes in the prefix-colouring argument.

Direct prerequisites: [CA.2/automatic-bounded-digit-carry](#CA-2-automatic-bounded-digit-carry), [CA.2/dfao-output-reversal](#CA-2-dfao-output-reversal), [CA.2/automaticity-is-independent-of-reading-direction](#CA-2-automaticity-is-independent-of-reading-direction), `mathlib:Nat.ofDigits_digits`, `mathlib:Nat.digits_lt_base`.

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), Lemma 5 and Definition 4, p.1; initial choice of D_c in §3, p.2. This proves the finite interval-alphabet case needed by the source, with an explicit normalization proof and the packet’s existing reading convention.

<a id="CA-2-redundant-word-interval"></a>

### Short redundant words cover a doubled radix interval

`ClassicalArithmeticCompletion:CA.2/redundant-word-interval` · lemma.

For k≥2, n≥1 and 0≤z≤2k^n there is a word w on Fin(2k+1) of length exactly n whose most-significant-first value is z.

Hypotheses and conventions: The exponent is strictly positive. At n=0 the empty word represents only zero.

Unit tests:

- `redundant_endpoint` (computation): The most-significant-first base-2 word [4,0] has value 8.
- `zero_length_rejected` (non-example): No word on Fin 5 of length zero has base-2 value 2.

Further acceptance checks:

- At k=2,n=1 the endpoint 4 is the one-letter word [4].
- At k=2,n=2 the endpoint 8 is [4,0].
- The all-zero word has the required length and represents zero.

Proof sketch:

1. For n=1 take the one-letter word with digit z≤2k.
2. For n+1 with n≥1 divide z=kq+r, 0≤r<k. The assumed upper bound gives q≤2k^n. Append the digit r to an n-letter representation of q given by induction.
3. Unfold the native little-endian evaluator on the reversed appended word to obtain kq+r. In particular the upper endpoint uses the legal digit 2k and is not lost to a strict inequality.

Direct prerequisites: `mathlib:Nat.ofDigits_cons`, `mathlib:Nat.ofDigits_singleton`.

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), §3, p.2, immediately after the choice of D_c. The source’s interval-cover assertion is expanded into its induction, including the endpoint and positive-length hypothesis.

<a id="CA-2-automatic-wide-prefix-colouring"></a>

### Finite prefix colours control wide radix blocks

`ClassicalArithmeticCompletion:CA.2/automatic-wide-prefix-colouring` · lemma.

If k≥2 and f:ℕ→Δ is k-automatic, there are q≥1 and a colouring C:ℕ→Fin q such that C(x)=C(y) implies f(xk^n+z)=f(yk^n+z) for every n≥1 and every z with 0≤z≤2k^n.

Hypotheses and conventions: The same colouring works for all lengths n and all suffix values z in the doubled interval.

Further acceptance checks:

- The bound includes z=2k^n.
- Equal output values at x,y alone do not suffice; equality of reached states is used.
- A constant sequence admits q=1 and the constant colour.

Proof sketch:

1. Use automatic-redundant-digits with d=2k. For each integer x, run its ordinary canonical most-significant-first word in that automaton and colour x by the resulting state, encoded in Fin q. The initial state ensures q is positive.
2. By redundant-word-interval choose a suffix of length n and value z. Equal prefix states remain equal after this identical suffix, by the native DFA evaluation-on-append statement applied to the underlying transition and initial state.
3. The native ofDigits_append identity, after reversing the concatenation, computes the values of the two extended words as xk^n+z and yk^n+z. All-word correctness gives the asserted equality.

Direct prerequisites: [CA.2/automatic-redundant-digits](#CA-2-automatic-redundant-digits), [CA.2/redundant-word-interval](#CA-2-redundant-word-interval), [CA.2/automata-with-output](#CA-2-automata-with-output), `mathlib:DFA.evalFrom_of_append`, `mathlib:Nat.ofDigits_append`, `mathlib:Fintype.equivFin`.

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), §3, p.2, equation (1). Finite colours are the source’s reached states, expressed as an explicit finite-valued function so that no separate state-language carrier is introduced.

<a id="CA-2-close-integral-powers"></a>

### Relatively close positive powers of two bases

`ClassicalArithmeticCompletion:CA.2/close-integral-powers` · lemma.

For integers a,b≥2 and C≥1 there are m,n≥1 such that C·|a^m−b^n|≤b^n. The absolute difference is an integer; multiplicative independence is not assumed in this approximation lemma.

Hypotheses and conventions: Both exponents must be positive. The conclusion permits a zero difference.

Unit tests:

- `close_powers_two_three` (computation): 10·|2^8−3^5|≤3^5.

Further acceptance checks:

- For a=2,b=3,C=10, m=8,n=5 give 10·13≤243.
- For a=2,b=4 the powers can coincide; this lemma does not supply a nonzero period.
- No irrational-logarithm hypothesis or Kronecker approximation theorem is used.

Proof sketch:

1. Replace a by A=a^b, so A≥b. Put e_x=Nat.log b (A^x). Native logarithm bounds give b^(e_x)≤A^x<b^(e_x+1), hence 1≤ρ_x=A^x/b^(e_x)<b. For y>x, A^y≥b·A^x, so e_y≥e_x+1.
2. For x=0,…,Cb assign the bin ⌊Cρ_x⌋, a natural number less than Cb. The finite pigeonhole principle gives distinct x,y with the same bin; order them x<y. The floor inequalities imply |ρ_y−ρ_x|<1/C.
3. Divide by ρ_x≥1 and multiply by b^(e_y−e_x). This gives |A^(y−x)−b^(e_y−e_x)|<b^(e_y−e_x)/C. Set m=b(y−x), n=e_y−e_x, both positive, and weaken the strict bound to the stated integer inequality.

Direct prerequisites: `mathlib:Nat.pow_log_le_self`, `mathlib:Nat.lt_pow_succ_log_self`, `mathlib:Nat.le_log_of_pow_le`, `mathlib:Fintype.exists_ne_map_eq_of_card_lt`, `mathlib:Nat.floor_le`, `mathlib:Nat.lt_floor_add_one`, `mathlib:Nat.floor_lt`.

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), Lemma 6 and proof, p.1. This is the source’s relative approximation with ε=1/C, using natural logarithms and a finite rational partition to make every exponent and bin explicit.

<a id="CA-2-finite-colour-tail-collisions"></a>

### Uniform repeated representatives for a finite colouring

`ClassicalArithmeticCompletion:CA.2/finite-colour-tail-collisions` · lemma.

For finite-valued colourings A:ℕ→Fin r and B:ℕ→Fin s there exist N and ξ≥1 such that every x≥N has distinct representatives u,v<ξ with B(u)=B(x), B(v)=B(x) and A(u)=A(v).

Hypotheses and conventions: The colourings are defined on all natural numbers. The conclusion does not assert that each individual colour is syndetic.

Further acceptance checks:

- A B-colour occurring only at 0 is excluded by the tail cutoff.
- With both colourings constant take u=0,v=1,ξ=2.
- The two representatives need not lie near the queried x; only their common colours matter.

Proof sketch:

1. For each colour of B consider its fibre. The union of those fibres that are finite is finite, by finite_iUnion, and therefore bounded above. Choose N beyond it; every B-fibre meeting the tail is infinite.
2. Inside each infinite B-fibre, the infinite pigeonhole principle for A gives distinct u,v with A(u)=A(v). There are only finitely many such fibres.
3. Choose ξ greater than all the selected representatives and at least one. For x≥N use the representatives of the infinite fibre of B(x).

Direct prerequisites: `mathlib:Set.finite_iUnion`, `mathlib:Set.Finite.bddAbove`, `mathlib:Set.Infinite.exists_ne_map_eq_of_mapsTo`.

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), §3, p.2, the choices of S∞, x_st, y_st and ξ. The source’s finite-state selection is isolated from automata, including the finite-fibre tail cutoff that its final induction uses.

<a id="CA-2-local-period-gluing"></a>

### Gluing local periods across a long overlap

`ClassicalArithmeticCompletion:CA.2/local-period-gluing` · lemma.

Let p,q≥1 and f:ℕ→Δ. Suppose f(t+p)=f(t) whenever l≤t and t+p≤r, and f(t+q)=f(t) whenever L≤t and t+q≤R. If the intersection of the integer intervals [l,r] and [L,R] has at least p+q elements, then f(t+p)=f(t) whenever min(l,L)≤t and t+p≤max(r,R).

Hypotheses and conventions: Cardinality counts integer points, including both endpoints. No coprimality assumption on p and q is required.

Further acceptance checks:

- Nested intervals are allowed.
- For p=q=1, two shared integer points suffice.
- With disjoint intervals the conclusion fails for a sequence constant with different values on the two intervals.

Proof sketch:

1. Fix t,t+p in the union. If both are in [l,r], use its period. Otherwise both are in [L,R]: crossing from outside that interval to outside [l,r] in a step of length p would jump an overlap containing at least p+q>p integers.
2. The possible starting points y in the overlap with y+p still in the overlap contain at least q consecutive integers. Choose y congruent to t modulo q among them.
3. Move from t to y in steps of q inside [L,R], apply the p-period on [l,r] from y to y+p, and move back in steps of q to t+p inside [L,R]. Reversing steps uses symmetry of equality, so the order of y and t is immaterial.

Direct prerequisites: `mathlib:Nat.card_Icc`.

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), Lemma 7 and proof, p.2. This is the source’s gluing lemma specialized to explicit natural-number endpoints, with the cross-boundary case and residue choice made explicit.

<a id="CA-2-close-scales-local-period"></a>

### A nonzero local period from two close radix scales

`ClassicalArithmeticCompletion:CA.2/close-scales-local-period` · lemma.

Let A,B,ξ≥1 and x,u,v∈ℕ with u,v<ξ, u≠v, A≠B and 6ξ|A−B|≤B. Suppose f(xB+z)=f(uB+z) and f(xB+z)=f(vB+z) for every 0≤z≤2B, and f(uA+w)=f(vA+w) for every 0≤w≤2A. Put p=|(u−v)(A−B)|. Then 0<p, 6p≤B, and f(t+p)=f(t) whenever 3xB+B≤3t and 3(t+p)≤3xB+5B.

Hypotheses and conventions: The differences in p and the closeness bound are computed in ℤ before taking absolute values. The interval is the integer part of [xB+B/3,xB+5B/3].

Unit tests:

- `signed_period` (computation): |(0−1)(17−18)|=1 and |(1−0)(18−17)|=1.

Further acceptance checks:

- A=B or u=v produces p=0 and is excluded.
- The statement works with A<B after reversing the representatives.
- Both t and t+p must be in the displayed interval; the claim is not made at an unguarded right endpoint.

Proof sketch:

1. Swap u and v if necessary so that (u−v)(A−B)=p>0. Their distinctness and A≠B give positivity; |u−v|<ξ gives 6p≤B.
2. Write t=xB+z. The interval hypotheses give B/3≤z and z+p≤5B/3. Hence z and z+p lie in [0,2B]. Set δ=A−B and w=z−vδ, temporarily in ℤ.
3. Use |w−A|≤|z−B|+(v+1)|δ|≤2B/3+B/6=5B/6≤A. The last inequality follows from |A−B|≤B/6. Thus w is a natural integer in [0,2A], so every substitution is within its stated range.
4. The three block comparisons give f(xB+z)=f(vB+z)=f(vA+w)=f(uA+w)=f(uB+z+p)=f(xB+z+p). The middle index identity uses uA+w=uB+z+(u−v)δ.

Direct prerequisites: .

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), §3, p.2, definition of p_st and the three uses of equation (1). The source’s crucial calculation is isolated with integer-safe indices and both signs of A−B. Its hypotheses are the exact block comparisons supplied by the prefix colours.

<a id="CA-2-bounded-window-periods-give-tail-period"></a>

### Overlapping radix windows force a single tail period

`ClassicalArithmeticCompletion:CA.2/bounded-window-periods-give-tail-period` · lemma.

Let B≥1 and N∈ℕ. Suppose that for every x≥N there is p_x≥1 with 6p_x≤B such that f(t+p_x)=f(t) whenever 3xB+B≤3t and 3(t+p_x)≤3xB+5B. Then there is p≥1 with 6p≤B and f(t+p)=f(t) for every t≥(N+1)B.

Hypotheses and conventions: Every window may have its own period. No common multiple of infinitely many periods is used.

Unit tests:

- `window_rounding_seven` (computation): The closed integer interval [7+⌈7/3⌉,⌊35/3⌋]=[10,11] has two points.
- `window_rounding_eight` (computation): The closed integer interval [8+⌈8/3⌉,⌊40/3⌋]=[11,13] has three points.

Further acceptance checks:

- Check B=6,7,8 separately: periods can only be 1 and the rounded adjacent overlaps still have at least two points.
- The bound is on p_x, not on gaps between occurrences of colours.
- The conclusion allows a finite nonperiodic prefix before (N+1)B.

Proof sketch:

1. Let I_x be the integer interval with endpoints xB+⌈B/3⌉ and xB+⌊5B/3⌋. Keep the chosen period p_N on the first window.
2. Adjacent windows overlap in the integer interval [(x+1)B+⌈B/3⌉,xB+⌊5B/3⌋]. Its cardinality is at least ⌊B/3⌋, which is at least 2⌊B/6⌋ and hence at least p_N+p_(x+1). The existence of a positive period with 6p_x≤B ensures these windows overlap.
3. Induct over finite unions I_N∪…∪I_z. They are intervals. Apply local-period-gluing at each step to preserve the first period p_N on the growing union.
4. For any t≥(N+1)B choose z sufficiently large that both t and t+p_N lie in that finite union. Its left endpoint is at most (N+1)B and its right endpoints are unbounded. The finite-union statement proves the desired equality.

Direct prerequisites: [CA.2/local-period-gluing](#CA-2-local-period-gluing), `mathlib:Nat.card_Icc`.

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), §3, p.2, final interval induction. This makes the source’s rounding and exhaustion argument explicit and preserves the period of the first window throughout.

<a id="CA-2-cobham-eventually-periodic"></a>

### Cobham’s theorem: independent automatic bases force periodicity

`ClassicalArithmeticCompletion:CA.2/cobham-eventually-periodic` · theorem.

Let a,b≥2 be multiplicatively independent: a^m≠b^n for every m,n≥1. If f:ℕ→Δ is both a-automatic and b-automatic, then there exist N and p≥1 such that f(t+p)=f(t) for every t≥N.

Hypotheses and conventions: The output alphabet Δ is arbitrary. Automaticity already forces its used range to be finite. Distinct bases alone are insufficient: 2 and 4 are multiplicatively dependent.

Unit tests:

- `dependent_bases` (non-example): 2≠4 but 2^2=4^1, so unequal bases do not establish the theorem’s hypothesis.

Further acceptance checks:

- The bases 2 and 3 meet the hypothesis; the conclusion is eventual periodicity, not periodicity from zero.
- The bases 2 and 4 fail the hypothesis even though they are unequal.
- A constant sequence has period 1.

Proof sketch:

1. Obtain wide prefix colourings C_a and C_b from automatic-wide-prefix-colouring. Apply finite-colour-tail-collisions to get N and ξ, with two uniformly bounded distinct representatives for every tail C_b-colour that agree under C_a.
2. Apply close-integral-powers with C=6ξ to obtain m,n≥1 and A=a^m,B=b^n with 6ξ|A−B|≤B. Multiplicative independence gives A≠B.
3. For each x≥N take its representatives u,v. The C_b comparisons at exponent n supply the two wide B-block equalities, and the C_a comparison at exponent m supplies the A-block equality.
4. Apply close-scales-local-period to obtain a positive period at most B/6 on each window. Then bounded-window-periods-give-tail-period gives one positive period on the whole tail.

Direct prerequisites: [CA.2/automatic-wide-prefix-colouring](#CA-2-automatic-wide-prefix-colouring), [CA.2/finite-colour-tail-collisions](#CA-2-finite-colour-tail-collisions), [CA.2/close-integral-powers](#CA-2-close-integral-powers), [CA.2/close-scales-local-period](#CA-2-close-scales-local-period), [CA.2/bounded-window-periods-give-tail-period](#CA-2-bounded-window-periods-give-tail-period).

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), Theorem 1, p.1, and its complete proof in §3, p.2. This is the forward direction of the source theorem, with normalization, collision selection and gluing supplied by the preceding declarations.

<a id="CA-2-eventually-periodic-sequences-are-automatic"></a>

### Every eventually periodic sequence is automatic

`ClassicalArithmeticCompletion:CA.2/eventually-periodic-sequences-are-automatic` · lemma.

For any k≥1, a sequence f:ℕ→Δ satisfying f(t+p)=f(t) for all t≥N, with p≥1, is k-automatic in the existing canonical-digit convention. This promotes the existing automatic-sequences API item to a prerequisite node; it introduces no second declaration.

Hypotheses and conventions: Base 1 uses Mathlib’s unary digit-list convention and is treated separately. No finiteness assumption on Δ is needed.

Unit tests:

- `finite_prefix` (non-example): The sequence with value 7 at zero and n mod 2 at positive n has period 2 on n≥1 but its values at 0 and 2 differ.
- `unary_eventually_periodic` (compatibility): The sequence with value 7 at zero and n mod 2 at positive n is 1-automatic in the existing unary convention.

Further acceptance checks:

- A special initial value followed by a periodic tail is allowed.
- Base 1 is not covered by the kernel criterion and is handled by its unary counter.
- For N=0,p=1 the counter is the one-state constant automaton.

Proof sketch:

1. The sequence is determined by its first N+p values, so its range is finite.
2. For k≥2 each kernel sequence g(t)=f(k^e t+r) has period p on t≥N: apply the eventual p-period of f repeatedly k^e times. Thus g is determined by N+p values from the finite range of f. Only finitely many such tuples exist; kernel finiteness and automatic-iff-finite-kernel give automaticity.
3. For k=1, Nat.digits 1 t has length t. Mapping into Fin 1 makes every input digit zero. A finite counter with states 0,…,N+p−1 advances through the prefix then cycles through N,…,N+p−1, outputting the corresponding value of f. It computes the unary word of length t exactly.

Direct prerequisites: [CA.2/automatic-sequences](#CA-2-automatic-sequences), [CA.2/automatic-iff-finite-kernel](#CA-2-automatic-iff-finite-kernel), [CA.2/k-kernel](#CA-2-k-kernel), [CA.2/automata-with-output](#CA-2-automata-with-output), `mathlib:Nat.digits_one`.

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), Theorem 1, p.1; §3, p.2, converse omitted as usual; inherited automatic-sequences API. The source leaves the converse to the standard argument. This supplies that argument explicitly, also preserving the inherited base-one API.

<a id="CA-2-cobham-theorem"></a>

### Cobham’s base-independence theorem

`ClassicalArithmeticCompletion:CA.2/cobham-theorem` · theorem.

For multiplicatively independent integers a,b≥2 and any f:ℕ→Δ, the conjunction that f is a-automatic and b-automatic is equivalent to the existence of N∈ℕ and p≥1 with f(t+p)=f(t) for every t≥N.

Hypotheses and conventions: Multiplicative independence means a^m≠b^n for all positive m,n. Automaticity uses the existing IsAutomatic, not a new predicate.

Unit tests:

- `both_bases_finite_prefix` (computation): The sequence with value 7 at zero and n mod 2 at positive n is both 2-automatic and 3-automatic.

Further acceptance checks:

- A sequence with a finite exceptional prefix and a periodic tail is automatic in bases 2 and 3.
- No assertion is made that an arbitrary automatic sequence is periodic in its single base.
- The theorem does not apply to the dependent pair 2,4.

Proof sketch:

1. The forward implication is cobham-eventually-periodic.
2. For the converse apply eventually-periodic-sequences-are-automatic to each of the two bases, with the same tail and period.

Direct prerequisites: [CA.2/cobham-eventually-periodic](#CA-2-cobham-eventually-periodic), [CA.2/eventually-periodic-sequences-are-automatic](#CA-2-eventually-periodic-sequences-are-automatic).

Source: [krebs-cobham-2018](https://arxiv.org/pdf/1801.06704v1), Theorem 1, p.1. This is the complete equivalence of the source, on the unchanged packet carrier and with the converse exposed as a reusable prerequisite.

### Continuation frontier

- Strong divisibility of integral elliptic divisibility sequences: Ward's theorem that a nondegenerate integral EDS (W₀ = 0, W₁ = 1, W₂W₃ ≠ 0, W₂ ∣ W₄) with gcd(W₃, W₄) = 1 satisfies gcd(W_m, Wₙ) = |W_{gcd(m,n)}|, extending Tau Ceti's isDvdSequence_normEDS. The coprimality hypothesis is needed (W = 0, 1, 1, −6, −6, 210, … has gcd(W₃, W₄) = 6 ≠ |W₁|; checked numerically: over b ≤ 5, |c|, |d| ≤ 6 every failure of strong divisibility has gcd(W₃, W₄) ≠ 1). Ward's memoir (Amer. J. Math. 70 (1948)) is not public and no public source with a proof was obtained (K. Stange's arXiv:0710.1316 does not treat it; J. Silverman's 2007 ICMS lecture slides state strong divisibility without the coprimality hypothesis). A continuation needs a public proof (for instance through denominators of multiples of a point and the formal group, with the reduction layers of the Tau Ceti EllipticCurves roadmap) before planning nodes.
- Lawrence–Sawin 66–67: define the Eulerian descent counts once, with factorial sum, symmetry, recurrence and Appendix C.1–C.5 bounds, including their n,q,r ranges. These are not the existing Euler zigzag numbers or graph Eulerian circuits. State the zero-degree convention separately: the extracted range convention for n≥1 cannot silently force the empty-permutation count to vanish. The Hodge interpretation remains with the hypersurface owner.
- Yu 103–105 and 179: generalized integer binomial divisibility including negative upper entries, the finite product f_p(N) for N≥0, its factorial split and p-adic unit property, and the Luo–Zhu block congruence. Preserve the exclusion p=2, alpha=1 and its separate sign formula. The negative-upper-entry factorization has the sign (−1)^(m(p−1)). Existing binomial arithmetic is a prerequisite, not these four exact statements.
- Independent review frontier: 20 existing targets have the mathematical or interface obligations recorded under gaps. Resume those IDs directly; revisionResponse records corrections and checked signatures, without claiming their remaining proofs closed.

## CA.3. Polynomial and matrix arithmetic

Use the existing PID module structure, square integer Smith existence, polynomial arithmetic and resultants as inputs. The planned extensions give general matrix certificates, rectangular Smith and Hermite interfaces, rational canonical comparisons, integer-valued polynomials, irreducibility criteria and Newton-slope contracts. IntegralLattices owns integral quadratic lattices and their discriminant theory; this layer owns only the additional general matrix arithmetic.

Landmarks: Smith normal form; Hermite normal form; Rational canonical form; Pólya's theorem on integer-valued polynomials; Capelli's theorem; Dumas's theorem on Newton polygons.

<a id="CA-3-perron-unit-circle-exclusion"></a>

### No unit-circle zero in Perron's equality case

`ClassicalArithmeticCompletion:CA.3/perron-unit-circle-exclusion` · lemma.

Let f ∈ ℝ[X] be monic of degree n ≥ 2, write a = a_{n−1} and S = Σ_{i=0}^{n−2}|a_i|, and assume 1 + S ≤ |a| and f(1) ≠ 0 ≠ f(−1). For every z ∈ ℂ with |z| = 1, the complexification f_ℂ(z) is nonzero.

Hypotheses and conventions: All coefficients are real; the complex polynomial is obtained by the canonical embedding ℝ → ℂ. The two endpoint exclusions are separate hypotheses. No nonzero-constant assumption is needed for this boundary lemma.

Further acceptance checks:

- X²+2X−1 satisfies equality and has f(1)=2, f(−1)=−2; neither root is on the unit circle.
- X²−2X+1 and X²+2X+1 satisfy the coefficient inequality but have a root at 1 or −1 respectively, so deleting either endpoint condition is unsound.
- For (X−i)² ∈ ℂ[X], the same norm inequality and both endpoint exclusions hold but i is a unit-circle root; real coefficients are essential.

Proof sketch:

1. Expand f_ℂ(z) = z^{n−1}(z+a) + r(z) with r(z) = Σ_{i=0}^{n−2} a_i z^i, using the finite coefficient expansion. On |z|=1, the triangle inequality gives |r(z)| ≤ S.
2. If f_ℂ(z)=0, then |z+a| = |r(z)| ≤ S ≤ |a|−1. Put A=|a|≥1. Squaring and using |z|²=1 gives a Re(z) ≤ −A. Since −1≤Re(z)≤1 and a is real with a≠0, this forces Re(z)=−1 when a>0 and Re(z)=1 when a<0.
3. In either case |z|²=(Re z)²+(Im z)²=1 forces Im(z)=0. Thus z=−1 or z=1. Evaluation commutes with ℝ→ℂ, contradicting the relevant endpoint hypothesis. This is the real-coefficient equality argument, not a claim for arbitrary complex coefficients.

Direct prerequisites: `mathlib:Polynomial.as_sum_range_C_mul_X_pow`, `mathlib:Complex.normSq_apply`, `mathlib:Complex.normSq_eq_norm_sq`.

Source: [prasolov-polynomials-russian-2003](http://prasolov.loegria.net/poly.pdf), Chapter 2, §7.2, Theorem 7.2(b), last paragraph of proof, printed/PDF p. 69. Isolates the boundary argument in the proof. The source theorem uses integer coefficients; its boundary argument uses only their reality, so this lemma records that precise generalization.

<a id="CA-3-perron-root-location-of-le"></a>

### Root location under the weak Perron inequality

`ClassicalArithmeticCompletion:CA.3/perron-root-location-of-le` · lemma.

Let f ∈ ℝ[X] be monic of degree n ≥ 2 with a_0≠0, 1 + Σ_{i=0}^{n−2}|a_i| ≤ |a_{n−1}|, and f(1)≠0≠f(−1). The multiset of complex roots of f has exactly one member, counted with multiplicity, with norm at least 1. Equivalently, n−1 roots lie in the open unit disc.

Hypotheses and conventions: Nonzero constant term, monicity, degree at least two, real coefficients, the non-strict coefficient inequality, and both endpoint exclusions.

Further acceptance checks:

- For X²+2X−1 the roots −1±√2 have exactly one norm exceeding 1; equality of the coefficient bound is admitted.
- At z=−1 for f=X²+2X−1 and g=X²+2X, |f−g|=|g|=1. Ordinary strict domination fails there, while the symmetric inequality reads 1<3.
- X²+2X has zero constant coefficient and is not an irreducibility input; the root-count theorem deliberately retains a_0≠0 as the source's shared hypothesis.

Proof sketch:

1. Set a=a_{n−1}, S=Σ_{i=0}^{n−2}|a_i| and g(z)=z^{n−1}(z+a). Since n≥2 and a_0≠0, the summand |a_0| is positive, so S>0 and |a|>1.
2. On the unit circle, the finite expansion and norm inequalities give |f_ℂ(z)−g(z)|≤S≤|a|−1≤|z+a|=|g(z)|. The boundary-exclusion lemma gives |f_ℂ(z)|>0; hence |f_ℂ(z)−g(z)|<|f_ℂ(z)|+|g(z)|.
3. Both functions are entire. Apply the pinned symmetric Rouché theorem at centre 0 and radius 1. No unproved equality-case extension of the ordinary strict Rouché theorem is invoked.
4. The comparison polynomial X^{n−1}(X+a) has n−1 zeros at 0 inside and its remaining zero −a outside, since |a|>1. Convert the analytic-order sums to root-multiset counts using CA.3/analytic-order-of-a-polynomial and Polynomial.count_roots. Algebraic closedness of ℂ gives n total roots, so the complement of the n−1 inside roots has cardinality one. The boundary lemma also ensures the remaining root is strictly outside.

Direct prerequisites: [CA.3/perron-unit-circle-exclusion](#CA-3-perron-unit-circle-exclusion), [CA.3/analytic-order-of-a-polynomial](#CA-3-analytic-order-of-a-polynomial), `tauceti:TauCeti.rouche_symm`, `mathlib:Polynomial.as_sum_range_C_mul_X_pow`, `mathlib:Polynomial.count_roots`, `mathlib:Polynomial.roots_mul`, `mathlib:IsAlgClosed.card_roots_eq_natDegree`, `mathlib:Complex.isAlgClosed`.

Source: [prasolov-polynomials-russian-2003](http://prasolov.loegria.net/poly.pdf), Chapter 2, §7.2, Theorem 7.2(a),(b), proof, printed/PDF pp. 68–69. The comparison polynomial and symmetric Rouché estimate are the source's proof. As with the boundary step, the analytic part only uses real coefficients, with integer coefficients needed at the final factorization step.

<a id="CA-3-irreducible-of-single-outer-root"></a>

### Irreducibility from one outer root counted with multiplicity

`ClassicalArithmeticCompletion:CA.3/irreducible-of-single-outer-root` · theorem.

Let f ∈ ℤ[X] be monic of positive degree with f(0)≠0. If its complex root multiset contains exactly one root with |z|≥1, counting multiplicity, then f is irreducible in ℤ[X].

Hypotheses and conventions: Positive degree excludes the unit polynomial; f(0)≠0 excludes a factor X; the hypothesis counts a multiset, not distinct roots.

Further acceptance checks:

- The degree-one polynomial X−2 has one outer root and is irreducible; no n≥2 restriction belongs on this algebraic adapter.
- X²−2X has exactly one outer root but is reducible: its constant term is zero.
- (X−2)² has one distinct outer root but two with multiplicity and is reducible; replacing the multiset count by a set cardinality is invalid.

Proof sketch:

1. Use Polynomial.Monic.irreducible_iff_natDegree. Positive degree gives f≠1. It remains to rule out f=g h with g,h monic integer polynomials both of positive degree.
2. The nonzero constant term of f forces both g(0) and h(0) nonzero, and their integer absolute values are at least 1.
3. Map the factors to ℂ. Each splits and remains monic with positive degree. The signed product-of-roots formula gives |g(0)|=∏_{α∈roots(g)}|α| and the analogous formula for h. If all roots of g had norm <1, their nonempty finite product of nonnegative norms would be <1, a contradiction. Thus each factor has at least one outer root.
4. Polynomial.roots_mul identifies the roots of f with the multiset sum of the roots of g and h. Filtering by |z|≥1 and taking cardinality adds the counts, giving at least two. This contradicts the assumed cardinality one, even if the two selected roots are equal.
5. The existing strict Perron criterion and the weak criterion both consume this common algebraic argument. No alternative root carrier or irreducibility predicate is defined.

Direct prerequisites: `mathlib:Polynomial.Monic.irreducible_iff_natDegree`, `mathlib:Polynomial.Splits.coeff_zero_eq_prod_roots_of_monic`, `mathlib:IsAlgClosed`, `mathlib:IsAlgClosed.card_roots_eq_natDegree`, `mathlib:Complex.isAlgClosed`, `mathlib:Polynomial.roots_mul`.

Source: [prasolov-polynomials-russian-2003](http://prasolov.loegria.net/poly.pdf), Chapter 2, §7.2, Theorem 7.2(a), factorization argument, printed/PDF p. 69. Extracts the source's integral-factor argument as a reusable declaration for both Perron variants; only the single-outer-root conclusion of the analytic argument is used.

<a id="CA-3-perron-criterion-of-le"></a>

### Perron's irreducibility criterion with equality

`ClassicalArithmeticCompletion:CA.3/perron-criterion-of-le` · theorem.

Let f=Xⁿ+a_{n−1}X^{n−1}+⋯+a_0 ∈ ℤ[X] be monic, n≥2, a_0≠0, with |a_{n−1}| ≥ 1+Σ_{i=0}^{n−2}|a_i| and f(1)≠0≠f(−1). Then f is irreducible in ℤ[X], equivalently its image in ℚ[X] is irreducible.

Hypotheses and conventions: Non-strict coefficient inequality, integer coefficients, monicity, degree at least two, nonzero constant term and both endpoint exclusions.

Further acceptance checks:

- X²+2X−1 and X²−2X−1 satisfy the inequality with equality and are irreducible; this is new coverage beyond the strict criterion.
- (X−1)² and (X+1)² fail the respective endpoint exclusions and must not be accepted.
- X²+2X has equality, f(1)=3 and f(−1)=−1 but a_0=0 and is reducible; the nonzero-constant condition cannot be dropped.

Proof sketch:

1. Map f to ℝ. Injectivity preserves degree, monicity, the nonzero constant term and endpoint evaluations; integer absolute values and their finite sums transport to real absolute values.
2. Apply CA.3/perron-root-location-of-le and identify the subsequent map ℝ→ℂ with the direct map ℤ→ℂ. This gives one outer complex root counted with multiplicity.
3. Apply CA.3/irreducible-of-single-outer-root to f. Monicity implies primitivity, and the pinned primitive-integer Gauss lemma gives the stated equivalence with irreducibility over ℚ.

Direct prerequisites: [CA.3/perron-root-location-of-le](#CA-3-perron-root-location-of-le), [CA.3/irreducible-of-single-outer-root](#CA-3-irreducible-of-single-outer-root), `mathlib:Polynomial.Monic.isPrimitive`, `mathlib:Polynomial.IsPrimitive.Int.irreducible_iff_irreducible_map_cast`.

Source: [prasolov-polynomials-russian-2003](http://prasolov.loegria.net/poly.pdf), Chapter 2, §7.2, Theorem 7.2(b), printed/PDF pp. 68–69. Exactly the weak inequality and f(±1)≠0 variant, with the monic polynomial's degree at least two made explicit. The source writes descending coefficients a₁,…,aₙ; this packet uses a_{n−1},…,a₀.

<a id="CA-3-smith-normal-form-certificate"></a>

### The Smith normal form certificate of an integer matrix

`ClassicalArithmeticCompletion:CA.3/smith-normal-form-certificate` · definition.

For an integer matrix A with m rows and n columns, a Smith normal form certificate consists of integer matrices P, P′ (m × m) and Q, Q′ (n × n) with P P′ = P′ P = 1 and Q Q′ = Q′ Q = 1, a natural number r ≤ min(m, n) and positive integers d_0, …, d_{r−1} with d_i | d_j for i ≤ j, such that the reconstruction equation P A Q = D_{m,n}(d) holds, where D_{m,n}(d) is the m × n matrix with d_i in position (i, i) for i < r and zeros elsewhere. The inverses are part of the data, so that a checker verifies unimodularity by two matrix products and the reconstruction by one, without computing determinants.

Hypotheses and conventions: A is an arbitrary integer matrix: not assumed square, and its determinant (when square) is not assumed nonzero. The d_i are positive integers (natural numbers), so the certificate pins the sign that a divisibility chain alone leaves open. Both products P P′ and P′ P are recorded; over ℤ one of them implies the other, but the certificate carries both so that no determinant argument is needed to use it.

API:

- `IntMatrix.smithDiag` (data): D_{m,n}(d): the m × n integer matrix with d_i at (i, i) for i < r and 0 elsewhere.
- `IntMatrix.SmithCertificate` (structure): The structure of the statement: P, P′, Q, Q′, r, d with positivity, the chain, the four inverse equations and the reconstruction equation P A Q = D_{m,n}(d).
- `IntMatrix.SmithCertificate.eq_reconstruct` (characterisation): A = P′ · D_{m,n}(d) · Q′.
- `IntMatrix.SmithCertificate.isUnit_det_P` (structure): det P is a unit of ℤ, i.e. ±1.
- `IntMatrix.SmithCertificate.isUnit_det_Q` (structure): det Q is a unit of ℤ, i.e. ±1.
- `IntMatrix.SmithCertificate.toGLP` (coercion): The row transformation as an element of GL_m(ℤ).
- `IntMatrix.SmithCertificate.rank_eq_rank` (compatibility): r equals the rank of A over ℚ (Mathlib Matrix.rank of the image of A in ℚ).
- `IntMatrix.SmithCertificate.d_zero_eq_gcd` (compatibility): If r > 0 then d_0 is the gcd of the entries of A; agrees with Tau Ceti Matrix.invariant_factor_zero_eq_gcd in the square nonsingular case.
- `IntMatrix.SmithCertificate.transpose` (functoriality): A certificate of A gives a certificate of Aᵀ with the same d, with Qᵀ, Q′ᵀ as row and Pᵀ, P′ᵀ as column transformations.

Unit tests:

- `TauCeti.ClassicalArithmetic.IntMatrix.smithCertificate_two_by_three` (computation): Every certificate of the matrix with rows (2, 4, 6) and (3, 6, 9) has r = 1 and d_0 = 1.
- `TauCeti.ClassicalArithmetic.IntMatrix.smithCertificate_chain_not_automatic` (non-example): Every certificate of diag(2, 3) has r = 2 and d = (1, 6); the diagonal (2, 3) fails the chain.
- `TauCeti.ClassicalArithmetic.IntMatrix.smithCertificate_zero` (degenerate): Every certificate of the zero 2 × 3 matrix has r = 0.
- `TauCeti.ClassicalArithmetic.IntMatrix.smithCertificate_rational_transform` (non-example): diag(1/2, 1/3) · diag(2, 3) = 1 over ℚ, but no integer certificate of diag(2, 3) has all d_i = 1.

Further acceptance checks:

- For A = diag(2, 3) no certificate has d = (2, 3): 2 does not divide 3. Every certificate has d = (1, 6).
- For the zero matrix every certificate has r = 0.
- A certificate over ℚ is not a certificate: the rational matrices diag(1/2, 1/3) turn diag(2, 3) into the identity, but no integer certificate has d = (1, 1).

Proof sketch:

1. Define D_{m,n}(d) entrywise: the (i, j) entry is d_i when i = j < r and 0 otherwise.
2. Define the certificate as a structure with the fields listed in the statement; the fields are propositions about explicit integer matrices, each decidable by computation.
3. Derive the reconstruction A = P′ D_{m,n}(d) Q′ by multiplying the reconstruction equation on the left by P′ and on the right by Q′ and using the four inverse equations (Matrix.mul_assoc).
4. Derive that P and Q are invertible (det P · det P′ = 1 from Matrix.det_mul), so each certificate yields elements of GL_m(ℤ) and GL_n(ℤ) (Matrix.GeneralLinearGroup).
5. Transpose: (P A Q)ᵀ = Qᵀ Aᵀ Pᵀ and D_{m,n}(d)ᵀ = D_{n,m}(d), so a certificate of A gives one of Aᵀ with the roles of P and Q exchanged.

Direct prerequisites: `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.det`, `mathlib:Matrix.rank`.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Proposition 2.1.5, Section 2.1, printed p. 17. The certificate packages exactly the data of the proposition (P, Q, the diagonal and the chain) with the inverses of P and Q made explicit; the source says P and Q are invertible as integer matrices, and the certificate records the inverses so that invertibility is checked by multiplication.

Proof or interface frontier: Split smithDiag and SmithCertificate data declarations. Rank and entry-ideal invariant proofs need named suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-smith-normal-form-of-an-integer-matrix"></a>

### Smith normal form of a rectangular integer matrix, by a terminating algorithm

`ClassicalArithmeticCompletion:CA.3/smith-normal-form-of-an-integer-matrix` · construction.

There is a function assigning to every integer matrix A (m × n, arbitrary shape and rank) a Smith normal form certificate: invertible integer matrices P and Q with explicit inverses and positive integers d_0 | d_1 | ⋯ | d_{r−1} with P A Q = D_{m,n}(d). The function is defined by well-founded recursion: on the size m + n of the matrix, and, for a fixed size, on the least absolute value of a nonzero entry, which every Euclidean step strictly decreases. The invariant factors of A are the list smithInvariantFactors A = (d_0, …, d_{r−1}); it depends only on A (CA.3/smith-invariant-factors-unique).

Hypotheses and conventions: A is an arbitrary integer matrix; it is not assumed square, and its determinant is not assumed nonzero. P and Q are invertible over the integers (determinant ±1), not merely over ℚ. The divisibility chain and the positivity of the d_i are part of the output.

API:

- `IntMatrix.smithNormalForm` (constructor): The algorithm: a Smith normal form certificate of A, for every integer matrix A.
- `IntMatrix.pivotMeasure` (other): The termination measure: the least absolute value of a nonzero entry of A (0 for A = 0).
- `IntMatrix.exists_unimodular_pivotMeasure_lt` (other): If the pivot of least absolute value does not divide an entry of its row or column, some unimodular U, V give pivotMeasure(U A V) < pivotMeasure(A).
- `IntMatrix.smithInvariantFactors` (data): The invariant factors of A as a list of positive naturals.
- `IntMatrix.smithInvariantFactors_chain` (structure): Each invariant factor divides the next.
- `IntMatrix.smithInvariantFactors_eq_of_certificate` (characterisation): For every certificate c of A, smithInvariantFactors A is the list of c.d.
- `IntMatrix.smithInvariantFactors_mul_mul` (functoriality): smithInvariantFactors (U A V) = smithInvariantFactors A for U ∈ GL_m(ℤ), V ∈ GL_n(ℤ).
- `IntMatrix.prod_smithInvariantFactors` (relation): For square A with det A ≠ 0, the product of the invariant factors is |det A|.

Unit tests:

- `TauCeti.ClassicalArithmetic.IntMatrix.smithInvariantFactors_two_by_three` (computation): smithInvariantFactors of the matrix with rows (2, 4, 6), (3, 6, 9) is [1].
- `TauCeti.ClassicalArithmetic.IntMatrix.smithInvariantFactors_diag_two_three` (non-example): smithInvariantFactors diag(2, 3) = [1, 6], not [2, 3].
- `TauCeti.ClassicalArithmetic.IntMatrix.smithInvariantFactors_singular_square` (computation): smithInvariantFactors of the matrix with rows (2, 0), (0, 0) is [2].
- `TauCeti.ClassicalArithmetic.IntMatrix.smithInvariantFactors_zero` (degenerate): smithInvariantFactors of the zero 2 × 3 matrix is [].
- `TauCeti.ClassicalArithmetic.IntMatrix.smithInvariantFactors_length_of_det_ne_zero` (compatibility): A square matrix with nonzero determinant has as many invariant factors as rows, as in Tau Ceti Matrix.exists_smith_normal_form_of_det_ne_zero.

Further acceptance checks:

- The statement covers rectangular and singular matrices, which the pinned libraries lack: Tau Ceti has the square nonsingular case (Matrix.exists_smith_normal_form_of_det_ne_zero), as an existence statement.
- The output is a procedure with a termination measure, not an ∃ statement.
- smithInvariantFactors of the rows (2, 4, 6), (3, 6, 9) is [1]; of diag(2, 3) is [1, 6]; of diag(2, 0) is [2]; of the zero matrix is []; Stein Example 2.1.6: the matrix with rows (−1, 2), (−3, 4) has Smith form diag(1, 2), and the 3 × 3 matrix of squares 1, 4, 9, …, 81 has Smith form diag(1, 3, 72).

Proof sketch:

1. If A = 0, return P = Q = 1 and r = 0.
2. Otherwise permute rows and columns to bring a nonzero entry of least absolute value to position (0, 0) (pivotMeasure A is this absolute value).
3. Euclidean step: for an entry a of the first column below the pivot p write a = q p + s with 0 ≤ s < |p| and subtract q times the first row; symmetrically for the first row. If some s ≠ 0, a nonzero entry of absolute value less than |p| appears, so pivotMeasure strictly decreases (IntMatrix.exists_unimodular_pivotMeasure_lt); restart. Termination: pivotMeasure is a natural number and decreases at each restart.
4. When the first row and column are cleared, if some entry b of the remaining block is not divisible by p, add its column to the first column; the next Euclidean step produces a remainder 0 < s < |p|, so pivotMeasure again decreases strictly. When every entry is divisible by p, multiply the first row by −1 if p < 0.
5. Recurse on the (m−1) × (n−1) block (the size decreases). Its entries are all divisible by p, so its invariant factors are multiples of p and the chain p | d_1 | ⋯ holds; embed the transformations of the block into GL_m(ℤ) and GL_n(ℤ) as block-diagonal matrices with a 1 in the corner and compose. Record the inverses of all elementary matrices (each elementary operation is inverted by another elementary operation) to produce P′ and Q′.
6. Compatibility: in the square nonsingular case the output agrees with Tau Ceti Matrix.exists_smith_normal_form_of_det_ne_zero by the uniqueness node; the product of the invariant factors is |det A| (Matrix.det_mul, det of a diagonal matrix).

Direct prerequisites: [CA.3/smith-normal-form-certificate](#CA-3-smith-normal-form-certificate), `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.det`, `mathlib:Ideal.smithCoeffs`, `mathlib:Submodule.exists_smith_normal_form_of_le`, `tauceti:Matrix.exists_smith_normal_form_of_det_ne_zero`, `tauceti:Matrix.invariant_factor_zero_eq_gcd`, `tauceti:TauCeti.IntegralLattice.exists_gramSmithInvariantFactors_smith_normal_form`, `tauceti:TauCeti.IntegralLattice.gramSmithInvariantFactors_dvd`.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Proposition 2.1.5 and its proof, Section 2.1, printed pp. 17–18. The construction is the source's row and column reduction; its termination argument (a decreasing sequence of positive integers |a11|) is the well-founded measure pivotMeasure. The source's division step prints 0 ≤ r < a11 where |a11| is meant (ClassicalArithmeticCompletion/E401).

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Proposition 2.1.5, Section 2.1, printed p. 17. The output of the construction is a proof of this proposition in certificate form.

Proof or interface frontier: Split pivotMeasure, smithNormalForm, smithInvariantFactors; general rectangular Smith reduction lacks pivot clearing/interior-divisibility/block-recursion lemmas and inverse certificate invariants. Ideal.smithCoeffs is only nonzero ideals.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-smith-invariant-factors-unique"></a>

### Uniqueness of the Smith normal form of a rectangular integer matrix

`ClassicalArithmeticCompletion:CA.3/smith-invariant-factors-unique` · theorem.

Let A be an m × n integer matrix. Any two Smith normal form certificates of A have the same number r of invariant factors and the same invariant factors d_0, …, d_{r−1}.

Hypotheses and conventions: A is arbitrary: rectangular and possibly singular. The invariant factors are normalised to be positive; without the sign normalisation they are unique only up to sign.

Further acceptance checks:

- For diag(2, 3) both the certificate produced by the algorithm and any other have d = (1, 6).
- The statement is about rectangular matrices; the square case is Tau Ceti Matrix.smith_normal_form_unique.
- Consequence: smithInvariantFactors A = List.ofFn c.d for every certificate c.

Proof sketch:

1. Let N = max(m, n). Pad A with zero rows and columns to an N × N matrix Â; pad P, P′ with an identity block and Q, Q′ likewise. The padded matrices are inverse pairs, and P̂ Â Q̂ is the N × N diagonal matrix with entries d_0, …, d_{r−1}, 0, …, 0.
2. This diagonal is a nonnegative divisibility chain (d_{r−1} | 0), so for two certificates c₁, c₂ the padded diagonals are GL_N(ℤ)-equivalent nonnegative chains.
3. Tau Ceti Matrix.smith_normal_form_unique says that two nonnegative chained diagonals in the same GL_N(ℤ)-equivalence class are equal, including singular ones.
4. Equality of the padded diagonals gives r₁ = r₂ (the number of nonzero entries) and d₁ = d₂.

Direct prerequisites: [CA.3/smith-normal-form-certificate](#CA-3-smith-normal-form-certificate), `tauceti:Matrix.smith_normal_form_unique`, `mathlib:Matrix.GeneralLinearGroup`.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Section 2.1, remark after Proposition 2.1.5, printed p. 17. The node is the uniqueness the source announces; the proof here reduces it to the square uniqueness theorem already in Tau Ceti by padding, instead of the source's route through the structure theorem.

<a id="CA-3-smith-normal-form-over-a-pid"></a>

### Smith normal form over a principal ideal domain

`ClassicalArithmeticCompletion:CA.3/smith-normal-form-over-a-pid` · theorem.

Let R be a principal ideal domain and A an m × n matrix over R. There are P ∈ GL_m(R), Q ∈ GL_n(R), a number r ≤ min(m, n) and nonzero d_0, …, d_{r−1} ∈ R with d_i | d_j for i ≤ j such that P A Q has d_i in position (i, i) for i < r and zeros elsewhere. The d_i are unique up to units (CA.3/invariant-factors-unique applied to the cokernel).

Hypotheses and conventions: R is a principal ideal domain; no Euclidean function is assumed, so the statement is existential and carries no algorithm. A is arbitrary: rectangular and possibly singular.

Further acceptance checks:

- Over ℤ the d_i can be taken positive and then agree with IntMatrix.smithInvariantFactors.
- Over ℚ[X], the matrix X·1 − M for M = diag(1, 2) has Smith form diag(1, (X − 1)(X − 2)).
- The chain is part of the conclusion: Mathlib's basis-level Smith form lacks it.

Proof sketch:

1. Let N be the image of the map Rⁿ → Rᵐ given by A. Mathlib Submodule.exists_smith_normal_form_of_le gives a basis b of Rᵐ and a basis of N of the form a_i b_i (i < r), without a divisibility chain.
2. Upgrade to a chain as in the aligned-basis theorem: for two diagonal entries a, a′ with Bézout relation u a + v a′ = g = gcd(a, a′), the 2 × 2 unimodular operations of Tau Ceti's proof of Matrix.exists_smith_normal_form_of_det_ne_zero (valid over any Bézout domain) replace (a, a′) by (g, a a′/g); repeat on pairs, which terminates because the number of prime factors (counted with multiplicity) of the first entry decreases or the chain holds (a PID is a UFD).
3. Express the change from the standard basis of Rᵐ to b by P⁻¹, and choose the preimages of a_i b_i under A together with a basis of ker A to form the columns of Q; then P A Q is the displayed diagonal.
4. Uniqueness up to units: the cokernel Rᵐ/A Rⁿ is ⊕ R/(d_i) ⊕ R^{m−r}, and the invariant factors of a finitely generated R-module are unique up to units (CA.3/invariant-factors-unique), after discarding the unit d_i.

Direct prerequisites: `mathlib:Submodule.exists_smith_normal_form_of_le`, `mathlib:IsPrincipalIdealRing`, `mathlib:Matrix.GeneralLinearGroup`, `tauceti:Matrix.exists_smith_normal_form_of_det_ne_zero`, [CA.3/invariant-factors-unique](#CA-3-invariant-factors-unique).

Source: [conrad-modulespid-2025](https://kconrad.math.uconn.edu/blurbs/linmultialg/modulesoverPID.pdf), Theorem 2.14, p. 6. Aligned bases for the image of A in Rᵐ are the matrix Smith form; the theorem also arranges a1 | a2 | ⋯ | am, which is the chain in the node.

Source: [garrett-fgmodules-2024](https://www-users.cse.umn.edu/~garrett/m/algebra/notes_2023-24/11.pdf), Section 4, Theorem 4.0.1, printed p. 175. The same statement with uniqueness up to units; its proof constructs the chain directly. The source writes d1e1, …, dtet for d1m1, …, dtmt (ClassicalArithmeticCompletion/E408).

Proof or interface frontier: PID extension needs generic Bezout unimodular two-by-two reduction and chain termination, not integer Tau theorem. Cokernel uniqueness recovers nonunit factors; restore unit-factor count using rank.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-cokernel-of-an-integer-matrix"></a>

### The cokernel of an integer matrix from its Smith normal form

`ClassicalArithmeticCompletion:CA.3/cokernel-of-an-integer-matrix` · theorem.

Let A be an m × n integer matrix and c a Smith normal form certificate of A with invariant factors d_0, …, d_{r−1}. Then the cokernel ℤᵐ / A ℤⁿ (the quotient by the column lattice) is isomorphic to (⊕_{i<r} ℤ/d_i ℤ) ⊕ ℤ^{m−r}; the isomorphism is induced by P: the class of x is sent to ((P x)_i mod d_i)_{i<r} and the last m − r coordinates of P x.

Hypotheses and conventions: No hypothesis on A. Summands with d_i = 1 are zero; they are kept in the statement so that it is uniform in the certificate.

Further acceptance checks:

- For the matrix (6, 10) (one row) the cokernel is ℤ/2.
- For diag(2, 3) the cokernel is ℤ/6 ≅ ℤ/1 ⊕ ℤ/6, not presented as ℤ/2 ⊕ ℤ/3 in invariant-factor form.
- For the zero m × n matrix the cokernel is ℤᵐ.

Proof sketch:

1. The column lattice of D = P A Q is P · (A ℤⁿ), because Q is unimodular (Q ℤⁿ = ℤⁿ).
2. Multiplication by P is an automorphism of ℤᵐ carrying A ℤⁿ onto D ℤⁿ, so it induces ℤᵐ / A ℤⁿ ≅ ℤᵐ / D ℤⁿ.
3. D ℤⁿ = ⊕_{i<r} d_i ℤ e_i, so ℤᵐ / D ℤⁿ = ⊕_{i<r} ℤ/d_i ℤ ⊕ ℤ^{m−r} coordinatewise.

Direct prerequisites: [CA.3/smith-normal-form-certificate](#CA-3-smith-normal-form-certificate), `mathlib:Matrix.mulVecLin`.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Proof of Theorem 2.1.2, Section 2.1, printed p. 19. The node is this step of the source's proof, stated for any certificate and with the explicit isomorphism given by P.

Proof or interface frontier: Cokernel equivalence needs explicit quotient transport and coordinate quotient lemmas; mulVecLin alone insufficient.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-invariant-factor-decomposition"></a>

### The structure theorem in invariant-factor form, over a principal ideal domain

`ClassicalArithmeticCompletion:CA.3/invariant-factor-decomposition` · theorem.

Let R be a principal ideal domain and M a finitely generated R-module. There are r, k ≥ 0 and nonzero nonunits a_1, …, a_k of R with a_1 | a_2 | ⋯ | a_k such that M ≅ R^r ⊕ R/(a_1) ⊕ ⋯ ⊕ R/(a_k). For R = ℤ: every finitely generated abelian group is ℤ^r ⊕ ℤ/n_1 ⊕ ⋯ ⊕ ℤ/n_k with 1 < n_1 | n_2 | ⋯ | n_k, and the n_i are the invariant factors > 1 of any presentation matrix.

Hypotheses and conventions: R is a principal ideal domain; M is finitely generated. The a_i form a divisibility chain and are nonunits; this is the invariant-factor form, not the elementary-divisor form R^r ⊕ ⊕ R/(p^e) that Mathlib states.

Further acceptance checks:

- For G = ℤ/2 ⊕ ℤ/3 the invariant-factor form is the single cyclic group ℤ/6.
- For G = ℤ/2 ⊕ ℤ/4 the form is itself (2 | 4), while ℤ/8 is a different group with the same order.
- For M = V a finite-dimensional K-vector space with T acting, R = K[X], this is the input of the rational canonical form (CA.3/invariant-factors-of-an-endomorphism).

Proof sketch:

1. Start from Mathlib Module.equiv_free_prod_directSum: M ≅ R^r ⊕ ⊕_{i∈I} R/(p_i^{e_i}) with p_i irreducible.
2. Group the summands by the associate class of p_i. For each prime p list its exponents in decreasing order e_{p,1} ≥ e_{p,2} ≥ ⋯ (padding with zeros); let k be the largest number of summands at a single prime.
3. For j = 1, …, k put a_{k+1−j} = ∏_p p^{e_{p,j}}; then a_1 | ⋯ | a_k because the exponent sequences decrease, and each a_j is a nonunit.
4. For each j the ideals (p^{e_{p,j}}) over distinct p are pairwise coprime, so the Chinese remainder theorem (Mathlib Ideal.quotientInfRingEquivPiQuotient) gives R/(a_j) ≅ ⊕_p R/(p^{e_{p,j}}); reassemble.
5. Over ℤ, alternatively: present M as the cokernel of an integer matrix (Stein Corollary 2.1.4) and read off the decomposition from CA.3/cokernel-of-an-integer-matrix, discarding the invariant factors equal to 1.

Direct prerequisites: `mathlib:Module.equiv_free_prod_directSum`, `mathlib:Module.equiv_directSum_of_isTorsion`, `mathlib:Ideal.quotientInfRingEquivPiQuotient`, `mathlib:Module.Finite`, `mathlib:Module.Free`, `mathlib:AddCommGroup`, `mathlib:IsPrincipalIdealRing`, [CA.3/cokernel-of-an-integer-matrix](#CA-3-cokernel-of-an-integer-matrix).

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Theorem 2.1.2, Section 2.1, printed p. 15. The ℤ case of the node; its proof in the source goes through the Smith normal form, with a slip: it asserts n1 > 1 straight from Proposition 2.1.5, which gives only n1 ≥ 1 (ClassicalArithmeticCompletion/E402).

Source: [garrett-modulespid-2024](https://www-users.cse.umn.edu/~garrett/m/algebra/notes_2023-24/10.pdf), Section 1, Theorem 1.0.1, printed p. 140. The PID statement (ideals I_j = (a_j), with I = 0 allowed for the free part); the source calls them elementary divisors. As printed the uniqueness needs I_1 ≠ R (ClassicalArithmeticCompletion/E409); the node requires nonunits.

Proof or interface frontier: Regrouping elementary divisors into divisibility-ordered invariant factors needs prime-power grouping and quotient transport lemmas beyond free-product equivalence and CRT.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-invariant-factors-unique"></a>

### Uniqueness of invariant factors over a principal ideal domain

`ClassicalArithmeticCompletion:CA.3/invariant-factors-unique` · theorem.

Let R be a principal ideal domain and M an R-module with M ≅ R^r ⊕ ⊕_{i≤k} R/(a_i) ≅ R^{r′} ⊕ ⊕_{j≤k′} R/(b_j), where the a_i and b_j are nonzero nonunits forming divisibility chains. Then r = r′, k = k′ and a_i is associated to b_i for every i.

Hypotheses and conventions: The a_i and b_j are nonzero and nonunits; without excluding units the statement is false (summands R/(1) = 0 can be added). Divisibility chains on both sides.

Further acceptance checks:

- ℤ/2 ⊕ ℤ/4 and ℤ/8 have the same order but different invariant factors (2, 4) and (8).
- ℤ/6 and ℤ/2 ⊕ ℤ/3: the second is not in invariant-factor form (2 ∤ 3); its invariant-factor form is ℤ/6.
- The number of cyclic factors of a finite abelian group G in invariant-factor form is the minimal number of generators of G.

Proof sketch:

1. r is the rank of M / M_tors (both torsion parts are the torsion submodule), so r = r′.
2. For an irreducible π, the dimension over R/(π) of π^{s−1} T / π^s T (T the torsion submodule) is the number of i with π^s | a_i; this number is intrinsic to T.
3. Knowing these numbers for all π and s determines, for each i counted from the top of the chain, the exponent of π in a_i; since the chains are ordered, a_i and b_i have the same π-adic valuations for every π, hence are associated (a PID is a UFD); k = k′ is the number of i with some π dividing a_i.

Direct prerequisites: `mathlib:IsPrincipalIdealRing`, `mathlib:Module.equiv_free_prod_directSum`.

Source: [conrad-modulespid-2025](https://kconrad.math.uconn.edu/blurbs/linmultialg/modulesoverPID.pdf), Theorem 5.7, p. 16. The source's proof counts dimensions of π^{i−1}T/π^iT over A/(π), which is the step used here; the node applies the count exponent by exponent to get the whole chain, not only the product.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Proof of Theorem 2.1.2, Section 2.1, printed p. 19. The ℤ case with a different invariant (minimal numbers of generators of nG); both routes determine the chain.

Proof or interface frontier: Intrinsic prime-power filtration dimension and torsion-free rank recovery are nonroutine missing lemmas.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-is-hermite-normal-form"></a>

### Hermite normal form (column-style, upper)

`ClassicalArithmeticCompletion:CA.3/is-hermite-normal-form` · definition.

An m × k integer matrix H is in Hermite normal form if there is a strictly increasing map p : {0, …, k−1} → {0, …, m−1} (the pivot rows) such that for every column j: H_{p(j), j} > 0; H_{i, j} = 0 for i > p(j) (the pivot is the lowest nonzero entry of the column); and for every column j′ > j to its right, 0 ≤ H_{p(j), j′} < H_{p(j), j} (entries to the right of a pivot in its row are reduced modulo it). A matrix in Hermite normal form has no zero column. The column lattice of H is the ℤ-span of its columns in ℤᵐ.

Hypotheses and conventions: Convention pinned: columns generate the lattice (Mathlib's mulVec and Basis.toMatrix convention), pivots are the lowest nonzero entries, and the triangle is upper. This is the convention of Cohen used by Belabas and of Micciancio's Definition 7 for square matrices; Micciancio's Definition 1 of lecture 4 and Damer use the lower-triangular mirror image, obtained by reversing the order of rows and of columns, and Stein's exercise uses rows (the transpose). No zero columns: k is the rank of the lattice; a Hermite certificate records the zero columns separately.

API:

- `IntMatrix.IsHermiteNormalForm` (constructor): The predicate of the statement.
- `IntMatrix.IsHermiteNormalForm.pivot_unique` (characterisation): The pivot rows are determined by H: p(j) is the largest row with a nonzero entry in column j.
- `IntMatrix.IsHermiteNormalForm.linearIndependent_cols` (structure): The columns of H are ℤ-linearly independent.
- `IntMatrix.IsHermiteNormalForm.isUpperTriangular` (compatibility): For a square H in Hermite normal form, H is upper triangular in Mathlib's sense (Matrix.IsUpperTriangular) with positive diagonal.
- `IntMatrix.IsHermiteNormalForm.det_eq_prod_diag` (simp): For square H in Hermite normal form, det H = ∏ H_{i,i} > 0.
- `IntMatrix.IsHermiteNormalForm.one` (example): The identity matrix is in Hermite normal form.

Unit tests:

- `TauCeti.ClassicalArithmetic.IntMatrix.isHermiteNormalForm_three_two` (computation): The matrix with columns (3, 0) and (2, 1) is in Hermite normal form.
- `TauCeti.ClassicalArithmetic.IntMatrix.not_isHermiteNormalForm_unreduced` (non-example): The matrix with columns (3, 0) and (4, 1) is not in Hermite normal form.
- `TauCeti.ClassicalArithmetic.IntMatrix.not_isHermiteNormalForm_negative_pivot` (non-example): diag(2, −1) is not in Hermite normal form.
- `TauCeti.ClassicalArithmetic.IntMatrix.isHermiteNormalForm_empty` (degenerate): The m × 0 matrix is in Hermite normal form (the zero lattice).

Further acceptance checks:

- The matrix with columns (3, 0) and (2, 1) is in Hermite normal form (Micciancio's example).
- The matrix with columns (3, 0) and (4, 1) is not: 4 is not reduced modulo the pivot 3.
- diag(2, −1) is not: the pivot −1 is negative.

Proof sketch:

1. Define the predicate as in the statement, with p existentially quantified.
2. p is determined by H: p(j) is the largest i with H_{i,j} ≠ 0 (IsHermiteNormalForm.pivot_unique).
3. The columns are linearly independent: in a vanishing combination Σ c_j H_{·,j}, look at row p(k−1): only column k−1 is nonzero there among columns j with p(j) ≥ p(k−1), so c_{k−1} = 0; induct downwards.
4. For m = k the pivots are p(j) = j, so H is upper triangular with positive diagonal, and det H = ∏ H_{i,i} (Mathlib Matrix.det_of_isUpperTriangular).

Direct prerequisites: `mathlib:Matrix.IsUpperTriangular`, `mathlib:Matrix.det_of_isUpperTriangular`, `mathlib:Matrix.mulVecLin`.

Source: [micciancio-hnf-2014](https://cseweb.ucsd.edu/classes/sp14/cse206A-a/lec1.pdf), Definition 7, p. 6. The square nonsingular case of the node, with the same orientation; the node extends it to rank-deficient and rectangular lattices by moving pivots down strictly.

Source: [belabas-computational-2004](https://www.numdam.org/item/JTNB_2004__16_1_19_0.pdf), Section 4.3, printed p. 28. The convention adopted for ideals of number fields (columns, upper triangular), which CA.5 uses. The inherited reading used the page image; the text layer of the scan is corrupt.

Source: [stein-modularforms-2007](https://wstein.org/books/modform/stein-modform.pdf), Chapter 7, Exercise 7.5, printed p. 120. The row-style transpose of the same notion; its third condition is misprinted (ClassicalArithmeticCompletion/E403), and the node does not follow it.

Proof or interface frontier: Upper-column HNF uses lowest nonzero row. Square determinant equals pivot product and is positive. Check source row convention carefully rather than assume transpose alone.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-hermite-normal-form-certificate"></a>

### The Hermite normal form certificate of an integer matrix

`ClassicalArithmeticCompletion:CA.3/hermite-normal-form-certificate` · definition.

For an m × n integer matrix A, a Hermite certificate consists of k ≤ n, an m × k matrix H in Hermite normal form, and integer n × n matrices U, U′ with U U′ = U′ U = 1 such that A U = [H | 0], i.e. (A U)_{i,j} = H_{i,j} for j < k and 0 for j ≥ k. Then the column lattice of A is the column lattice of H, and A = [H | 0] U′ (reconstruction).

Hypotheses and conventions: A is arbitrary. U is unimodular with explicit inverse; the zero columns come last.

API:

- `IntMatrix.HermiteCertificate` (structure): The structure of the statement.
- `IntMatrix.hermitePad` (data): [H | 0]: an m × k matrix padded with zero columns to m × n.
- `IntMatrix.HermiteCertificate.eq_reconstruct` (characterisation): A = [H | 0] · U′.
- `IntMatrix.HermiteCertificate.range_eq` (characterisation): The column lattice of A equals that of H.
- `IntMatrix.HermiteCertificate.rank_eq_rank` (compatibility): k equals the rank of A over ℚ (Mathlib Matrix.rank).
- `IntMatrix.HermiteCertificate.isUnit_det_U` (structure): det U = ±1.

Unit tests:

- `TauCeti.ClassicalArithmetic.IntMatrix.hermiteCertificate_one` (computation): Every certificate of the 2 × 2 identity has k = 2 and H = 1.
- `TauCeti.ClassicalArithmetic.IntMatrix.hermiteCertificate_zero` (degenerate): Every certificate of the zero 2 × 3 matrix has k = 0.
- `TauCeti.ClassicalArithmetic.IntMatrix.hermiteCertificate_not_rational` (non-example): Every certificate of diag(2, 1) has k = 2 and H_{0,0} = 2, although over ℚ the column space is everything.

Further acceptance checks:

- The identity has the identity as Hermite matrix and k = n.
- The zero matrix has k = 0.
- diag(2, 1) has Hermite matrix diag(2, 1): unlike the rational column space, the lattice remembers the 2.

Proof sketch:

1. Define the structure with the fields of the statement.
2. Reconstruction: multiply A U = [H | 0] on the right by U′.
3. Lattice: A ℤⁿ = A U ℤⁿ (U is surjective on ℤⁿ) = [H | 0] ℤⁿ = H ℤᵏ.
4. k equals the rank of A over ℚ: the columns of H are independent (IsHermiteNormalForm.linearIndependent_cols) and span the column space.

Direct prerequisites: [CA.3/is-hermite-normal-form](#CA-3-is-hermite-normal-form), `mathlib:Matrix.mulVecLin`, `mathlib:Matrix.rank`, `mathlib:Matrix.GeneralLinearGroup`.

Source: [micciancio-hnfalgorithm-2014](https://cseweb.ucsd.edu/classes/sp14/cse206A-a/lec4.pdf), Section 1, p. 2. The certificate adds to this notion the unimodular transformation that realises L(H) = L(B), with its inverse, so that the reconstruction is checked by multiplication.

Proof or interface frontier: Split hermitePad and HermiteCertificate; consumed range/reconstruction/rank API promote to lemma nodes.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-hermite-normal-form"></a>

### Hermite normal form of an integer matrix, by a terminating algorithm

`ClassicalArithmeticCompletion:CA.3/hermite-normal-form` · construction.

There is a function assigning to every m × n integer matrix A a Hermite certificate: a unimodular U with explicit inverse and an m × k matrix H in Hermite normal form with A U = [H | 0]. It is computed by unimodular column operations processing the rows from the bottom up; termination is by the sum of the absolute values of the active entries of the current row. The Hermite basis hermiteBasis A = H depends only on the column lattice of A (CA.3/hermite-normal-form-unique), and v lies in the lattice of A exactly when it lies in the lattice of H, which is decided by back-substitution along the pivots.

Hypotheses and conventions: A arbitrary: rectangular, possibly of deficient rank. Column operations only (the lattice is the column span).

API:

- `IntMatrix.hermiteNormalForm` (constructor): The algorithm: a Hermite certificate of A for every integer matrix A.
- `IntMatrix.hermiteBasis` (data): The Hermite matrix H of the certificate, an m × k matrix in Hermite normal form.
- `IntMatrix.exists_unimodular_bottomRow_decrease` (other): Termination: if two or more entries of the bottom row are nonzero, a unimodular column operation strictly decreases the sum of their absolute values.
- `IntMatrix.mem_range_iff_hermite` (characterisation): v lies in the column lattice of A iff it lies in that of hermiteBasis A.
- `IntMatrix.hermiteBasis_eq_of_range_eq` (extensionality): Two matrices with the same column lattice have the same Hermite basis (with the same number of columns).

Unit tests:

- `TauCeti.ClassicalArithmetic.IntMatrix.hermiteBasis_stein_example` (computation): hermiteBasis of the matrix with columns (1, 2, 3), (4, 5, 6), (7, 8, 9) has two columns, (2, 1, 0) and (−3, 0, 3).
- `TauCeti.ClassicalArithmetic.IntMatrix.hermiteBasis_unimodular` (characterisation): For U ∈ GL_2(ℤ), hermiteBasis U = 1.
- `TauCeti.ClassicalArithmetic.IntMatrix.hermiteBasis_rank_deficient` (degenerate): hermiteBasis of the 1 × 2 matrix (6, 10) is the 1 × 1 matrix (2).

Further acceptance checks:

- hermiteBasis of the matrix with columns (1, 2, 3), (4, 5, 6), (7, 8, 9) (the transpose of Stein's example) has columns (2, 1, 0) and (−3, 0, 3).
- A unimodular matrix has the identity as Hermite basis (Micciancio Corollary 9).
- The 1 × 2 matrix (6, 10) has Hermite basis (2).

Proof sketch:

1. Process the rows i = m−1, m−2, …, 0 with an index set C of active columns (initially all columns); the columns already given a pivot are removed from C.
2. Row step: while at least two active columns have a nonzero entry in row i, pick the active column whose entry has least absolute value and subtract from each other active column the multiple given by division with remainder; the sum of the absolute values of the active entries of row i strictly decreases (IntMatrix.exists_unimodular_bottomRow_decrease), so the loop terminates. If one nonzero entry remains, negate its column if needed; it becomes the pivot of row i and leaves C. If none remains, row i has no pivot.
3. After all rows: the pivot columns, in order of increasing pivot row, form H; the columns left in C are zero. Reduce: for each pivot column j and each pivot column j′ to its right, subtract ⌊H_{p(j),j′} / H_{p(j),j}⌋ times column j from column j′; this only changes rows ≤ p(j) of column j′ (column j is zero below p(j)), so processing j from the bottom pivot upwards reduces every entry in place (as in Micciancio Theorem 8).
4. Every operation is an elementary column operation, recorded with its inverse, giving U and U′; the product of the recorded operations is the certificate.
5. Membership: v ∈ H ℤᵏ iff back-substitution from the bottom pivot upwards (v_{p(j)} divided by H_{p(j),j} must be exact, subtract, continue) ends at zero.

Direct prerequisites: [CA.3/hermite-normal-form-certificate](#CA-3-hermite-normal-form-certificate), [CA.3/is-hermite-normal-form](#CA-3-is-hermite-normal-form), `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.mulVecLin`.

Source: [micciancio-hnf-2014](https://cseweb.ucsd.edu/classes/sp14/cse206A-a/lec1.pdf), Theorem 8 and its proof, pp. 6–7. The construction extends the source's induction (clear the last row with Euclid, recurse, then reduce entries modulo the pivots) to rank-deficient and rectangular matrices, where a row may have no pivot.

Source: [micciancio-hnfalgorithm-2014](https://cseweb.ucsd.edu/classes/sp14/cse206A-a/lec4.pdf), Definition 1 and its footnote, p. 1. The source's general algorithm is stated for the mirror-image convention; the footnote gives the translation, and the node uses the upper convention of its Theorem 8. Its Definition 1 has index misprints (ClassicalArithmeticCompletion/E404).

Proof or interface frontier: Split Hermite algorithm and basis. Termination and active-column invariant supporting lemmas missing. API hermiteBasis_eq_of_range_eq invokes97 without prerequisite; promote to avoid hidden-cycle issue.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-hermite-normal-form-unique"></a>

### Uniqueness of the Hermite normal form

`ClassicalArithmeticCompletion:CA.3/hermite-normal-form-unique` · theorem.

If H (m × k) and H′ (m × k′) are in Hermite normal form and have the same column lattice, then k = k′ and H = H′.

Hypotheses and conventions: Both matrices satisfy the predicate of CA.3/is-hermite-normal-form (in particular they have no zero columns).

Further acceptance checks:

- The matrices with columns (3, 0), (2, 1) and (3, 0), (5, 1) have the same lattice; only the first is in Hermite normal form.
- Two Hermite matrices of the lattice ℤ² are both the identity.
- Consequence: hermiteBasis A depends only on the column lattice of A.

Proof sketch:

1. k = k′: both column sets are bases of the same lattice (linearIndependent_cols), whose rank is well defined.
2. The pivot rows agree: p(j) is the j-th smallest element of the set of rows i such that the lattice contains a vector whose lowest nonzero entry is in row i; this set depends only on the lattice.
3. The pivot values agree too: H_{p(j),j} = H′_{p(j),j} is the least positive entry in row p(j) of a lattice vector vanishing below row p(j).
4. Suppose H ≠ H′ and let i be the lowest row in which some column j has H_{i,j} ≠ H′_{i,j}. The difference of the two j-th columns lies in the lattice and vanishes below row i, so it is an integer combination of the columns of H vanishing below row i, i.e. those with pivot row ≤ i; at row i only the column j₀ with p(j₀) = i (if any) is nonzero, so H_{i,j} − H′_{i,j} = z H_{i,j₀} for an integer z (and the difference is 0 if no pivot lies in row i).
5. If j < j₀ both entries lie below the pivot of column j and are 0; if j = j₀ they are the equal pivot values; if j > j₀ both are reduced modulo the same pivot, 0 ≤ H_{i,j}, H′_{i,j} < H_{i,j₀}, so |z| H_{i,j₀} < H_{i,j₀} and z = 0. In every case H_{i,j} = H′_{i,j}, a contradiction.

Direct prerequisites: [CA.3/is-hermite-normal-form](#CA-3-is-hermite-normal-form), `mathlib:Matrix.mulVecLin`.

Source: [damer-hnfsurvey-2024](https://eprint.iacr.org/2024/2089.pdf), Theorem 2.29 and its proof, Section 2.4, p. 6. The source proves uniqueness (after Schrijver) for the lower-triangular mirror convention by the first-differing-entry argument used here; the node states it for the upper convention and for lattices of any rank. The source's Definition 2.28 does not state positivity of the first pivot (ClassicalArithmeticCompletion/E406).

Source: [damer-hnfsurvey-2024](https://eprint.iacr.org/2024/2089.pdf), Proof of Theorem 2.29, p. 6. The key step of the uniqueness argument, reproduced in the third proof step.

Proof or interface frontier: Damer is only source and PDF unavailable403. Cannot verify theorem or E406 sourceIssue from author receipt. Needs source gap unless a readable primary copy exists.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-hermite-basis-of-a-sublattice"></a>

### Every sublattice of ℤᵐ has a unique Hermite basis

`ClassicalArithmeticCompletion:CA.3/hermite-basis-of-a-sublattice` · theorem.

For every ℤ-submodule L of ℤᵐ there is exactly one pair (k, H) with H an m × k integer matrix in Hermite normal form whose column lattice is L.

Hypotheses and conventions: L is any subgroup of ℤᵐ; it is free of finite rank (a submodule of a finite free module over a PID).

Further acceptance checks:

- L = 2ℤ ⊆ ℤ has Hermite basis (2).
- L = 0 has the empty Hermite basis (k = 0).
- L = ℤᵐ has the identity.

Proof sketch:

1. L is finitely generated (ℤ is Noetherian); let A be an m × n matrix whose columns generate L.
2. Existence: the certificate hermiteNormalForm A gives H in Hermite normal form with the column lattice of A.
3. Uniqueness: CA.3/hermite-normal-form-unique.

Direct prerequisites: [CA.3/hermite-normal-form](#CA-3-hermite-normal-form), [CA.3/hermite-normal-form-unique](#CA-3-hermite-normal-form-unique), `mathlib:Matrix.mulVecLin`.

Source: [belabas-computational-2004](https://www.numdam.org/item/JTNB_2004__16_1_19_0.pdf), Section 5.3.1, printed p. 36. The canonicity the source relies on for ideals is this theorem applied to the coordinate lattice of an ideal. The inherited reading used the page image.

Proof or interface frontier: Existence for all integer sublattices uses Noetherian finite generation, not yet listed. Belabas ideal lattice example does not itself state general existence.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-index-eq-prod-hermite-pivots"></a>

### The index of a full sublattice is the product of its Hermite pivots

`ClassicalArithmeticCompletion:CA.3/index-eq-prod-hermite-pivots` · theorem.

If H is an m × m integer matrix in Hermite normal form, the index of its column lattice in ℤᵐ is ∏_i H_{i,i} = |det H|.

Hypotheses and conventions: H is square (the lattice has full rank) and in Hermite normal form.

Further acceptance checks:

- The lattice with Hermite basis columns (3, 0), (2, 1) has index 3.
- The identity gives index 1.
- Scalar m·1 gives index mᵐ.

Proof sketch:

1. Mathlib AddSubgroup.index_eq_natAbs_det: the index of a full sublattice with basis the columns of H, relative to the standard basis, is |det H|.
2. det H = ∏ H_{i,i} (IsHermiteNormalForm.det_eq_prod_diag), and every H_{i,i} > 0.

Direct prerequisites: [CA.3/is-hermite-normal-form](#CA-3-is-hermite-normal-form), `mathlib:AddSubgroup.index_eq_natAbs_det`, `mathlib:Matrix.det_of_isUpperTriangular`.

Source: [conrad-modulespid-2025](https://kconrad.math.uconn.edu/blurbs/linmultialg/modulesoverPID.pdf), Theorem 5.19, p. 18. The index formula for an arbitrary basis; for a Hermite basis the determinant is the product of the pivots.

Proof or interface frontier: Index formula is correct via finite-index determinant, but consumes94 determinant API which needs promotion.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-invariant-factors-of-an-endomorphism"></a>

### The invariant factors of an endomorphism

`ClassicalArithmeticCompletion:CA.3/invariant-factors-of-an-endomorphism` · definition.

Let K be a field, V a finite-dimensional K-vector space and T an endomorphism of V. Let V_T be V viewed as a K[X]-module with X acting by T (Mathlib Module.AEval' T). The invariant factors of T are the monic polynomials a_1 | a_2 | ⋯ | a_k of positive degree with V_T ≅ ⊕_i K[X]/(a_i), listed in divisibility order; by CA.3/invariant-factor-decomposition they exist (V_T is torsion because V is finite-dimensional) and by CA.3/invariant-factors-unique they are determined by T once normalised to be monic.

Hypotheses and conventions: The list is empty exactly when V = 0. Normalisation: monic, positive degree, increasing in divisibility; the order is fixed.

API:

- `invariantFactors` (data): The list of monic invariant factors of T.
- `InvariantFactors.monic` (structure): Each invariant factor is monic of positive degree.
- `InvariantFactors.chain` (structure): Each invariant factor divides the next.
- `InvariantFactors.prod_eq_charpoly` (relation): The product of the invariant factors is the characteristic polynomial of T (Mathlib LinearMap.charpoly).
- `InvariantFactors.getLast_eq_minpoly` (relation): The last invariant factor is the minimal polynomial of T (Mathlib minpoly).
- `InvariantFactors.eq_nil_iff` (simp): The list is empty iff V is the zero space.
- `InvariantFactors.nonempty_aeval_equiv` (characterisation): Module.AEval' T ≅ ⊕_i K[X]/(a_i) as K[X]-modules.
- `InvariantFactors.conj` (functoriality): For a linear equivalence e : V ≃ W, e T e⁻¹ has the same invariant factors as T.

Unit tests:

- `TauCeti.ClassicalArithmetic.invariantFactors_zero_map` (degenerate): invariantFactors of the zero endomorphism of ℚ² is [X, X].
- `TauCeti.ClassicalArithmetic.invariantFactors_id` (non-example): invariantFactors of the identity of ℚ² is [X − 1, X − 1], not [(X − 1)²].
- `TauCeti.ClassicalArithmetic.invariantFactors_nilpotent_block` (computation): invariantFactors of the map of the matrix with rows (0, 0), (1, 0) is [X²].
- `TauCeti.ClassicalArithmetic.invariantFactors_nonscalar_two` (compatibility): A non-scalar 2 × 2 matrix A over ℚ has invariantFactors [charpoly A], the case of Tau Ceti exists_det_ne_zero_mul_eq_mul_companionFinTwo.

Further acceptance checks:

- The zero map on K² has invariant factors X, X.
- The identity of K² has invariant factors X − 1, X − 1, not (X − 1)².
- The nilpotent Jordan block of size 2 has the single invariant factor X².

Proof sketch:

1. V_T is a finitely generated torsion K[X]-module: finitely generated because V is finite-dimensional over K ⊆ K[X]; torsion because the characteristic polynomial kills it (Cayley–Hamilton).
2. Apply CA.3/invariant-factor-decomposition with R = K[X]: V_T ≅ ⊕ K[X]/(a_i) with no free part, and take each a_i monic (units of K[X] are nonzero constants).
3. Define invariantFactors T as this list; CA.3/invariant-factors-unique shows it does not depend on the decomposition chosen.
4. The product of the a_i is the characteristic polynomial (the dimension of K[X]/(a) is deg a, and charpoly is multiplicative over the block decomposition by LinearMap.charpoly of a block matrix); the last one generates the annihilator of V_T, which is (minpoly T).

Direct prerequisites: [CA.3/invariant-factor-decomposition](#CA-3-invariant-factor-decomposition), [CA.3/invariant-factors-unique](#CA-3-invariant-factors-unique), `mathlib:Module.AEval'`, `mathlib:LinearMap.charpoly`, `mathlib:minpoly`, `mathlib:Matrix.charpoly`.

Source: [garrett-modulespid-2024](https://www-users.cse.umn.edu/~garrett/m/algebra/notes_2023-24/10.pdf), Section 4, Corollary 4.0.1, printed p. 144. The node defines T's invariant factors as the monic d_i of this corollary (the source calls them elementary divisors), made well defined by uniqueness.

Proof or interface frontier: Invariant-factor construction needs Cayley-Hamilton and polynomial-module torsion suppliers. Product-charpoly/last-minpoly results require companion/block diagonal support and separate nodes; promote nonempty_aeval_equiv consumed101.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-rational-canonical-form"></a>

### The rational canonical form of an endomorphism

`ClassicalArithmeticCompletion:CA.3/rational-canonical-form` · construction.

Let K be a field, V finite-dimensional and T an endomorphism with invariant factors a_1 | ⋯ | a_k. There is a basis of V indexed by the pairs (i, j), 1 ≤ i ≤ k, 0 ≤ j < deg a_i, in which the matrix of T is block diagonal, the i-th block being the companion block C(f) of a monic f of degree d, the d × d matrix of multiplication by X on K[X]/(f) in the basis 1, X, …, X^{d−1}: ones on the subdiagonal, −coeff_i(f) in row i of the last column, zeros elsewhere (for f = a_i); this is the companion matrix C(a_i) of CA.2/companion-matrix, whose convention it shares, by that node's identification of the matrix of multiplication by the root of AdjoinRoot f with C(f). The basis vectors of block i are v_i, T v_i, …, T^{deg a_i − 1} v_i for a vector v_i generating the i-th cyclic summand. Matrix form: every n × n matrix A over K is similar to the block-diagonal matrix of the companion blocks of its invariant factors.

Hypotheses and conventions: K is any field; V is finite-dimensional; no algebraic closure or splitting is used (this is what distinguishes the rational form from the Jordan form). Block order: a_1 | a_2 | ⋯ (increasing); convention for C(f): subdiagonal ones and last column −coefficients, the matrix Mathlib writes as Algebra.leftMulMatrix of the power basis of AdjoinRoot f at the root.

API:

- `rationalCanonicalBasis` (constructor): The basis of V indexed by the blocks (i, j).
- `toMatrix_rationalCanonicalBasis` (characterisation): The matrix of T in that basis is the block-diagonal matrix of the companion blocks of the invariant factors.
- `rationalCanonicalBasis_succ` (structure): Within a block, each basis vector is T applied to the previous one.
- `Matrix.exists_conj_rationalCanonicalForm` (equivalence): Every square matrix A is conjugate by some P ∈ GL_n(K) to the block-diagonal companion form of its invariant factors (up to the reindexing of Fin n by the blocks).
- `Matrix.isConj_iff_invariantFactors_eq` (characterisation): Similarity is equality of invariant factors (CA.3/similarity-by-invariant-factors).

Unit tests:

- `TauCeti.ClassicalArithmetic.rationalCanonicalBasis_companion_convention` (computation): The companion block of X² + 1 over ℚ is the matrix with rows (0, −1), (1, 0).
- `TauCeti.ClassicalArithmetic.rationalCanonicalBasis_id` (degenerate): For the identity of ℚ² there are two blocks, each of size 1.
- `TauCeti.ClassicalArithmetic.rationalCanonicalBasis_block_charpoly` (compatibility): Each block has the corresponding invariant factor as characteristic polynomial (Mathlib charpoly_leftMulMatrix).

Further acceptance checks:

- The companion block of X² + 1 over ℚ is the matrix with rows (0, −1) and (1, 0).
- The identity of ℚ² has rational canonical form diag(1, 1): two 1 × 1 blocks.
- A non-scalar 2 × 2 matrix is similar to the companion matrix of its characteristic polynomial (Tau Ceti exists_det_ne_zero_mul_eq_mul_companionFinTwo).

Proof sketch:

1. Fix an isomorphism φ : V_T ≅ ⊕_i K[X]/(a_i) of K[X]-modules (InvariantFactors.nonempty_aeval_equiv).
2. In K[X]/(a_i), the power basis 1, X, …, X^{d_i−1} of AdjoinRoot a_i (Mathlib AdjoinRoot.powerBasis') is a K-basis, and multiplication by X has matrix C(a_i) (Mathlib Algebra.leftMulMatrix: X·X^j = X^{j+1} for j < d_i − 1 and X^{d_i} = −Σ coeff_j X^j).
3. Pull the union of these bases back along φ to V: since φ is K[X]-linear it intertwines T with multiplication by X, so LinearMap.toMatrix of T in the pulled-back basis is the block-diagonal matrix (Mathlib Matrix.blockDiagonal').
4. The block vectors are v_i, T v_i, …: they are φ⁻¹ of 1, X, X², … in the i-th summand.
5. Matrix form: apply the above to Matrix.toLin' A and change basis; each block's characteristic polynomial is a_i (Mathlib charpoly_leftMulMatrix), consistent with InvariantFactors.prod_eq_charpoly.

Direct prerequisites: [CA.2/companion-matrix](#CA-2-companion-matrix), [CA.3/invariant-factors-of-an-endomorphism](#CA-3-invariant-factors-of-an-endomorphism), `mathlib:AdjoinRoot.powerBasis'`, `mathlib:Algebra.leftMulMatrix`, `mathlib:charpoly_leftMulMatrix`, `mathlib:Matrix.blockDiagonal'`, `mathlib:LinearMap.toMatrix`, `mathlib:Matrix.toLin'`, `tauceti:TauCeti.exists_det_ne_zero_mul_eq_mul_companionFinTwo`.

Source: [garrett-modulespid-2024](https://www-users.cse.umn.edu/~garrett/m/algebra/notes_2023-24/10.pdf), Section 4, Example 4.0.3, printed p. 145. The source continues: T · x^i = x^{i+1} for i < n − 1 and T · x^{n−1} = −(a_0 + ⋯ + a_{n−1}x^{n−1}), and displays the companion matrix in the pinned convention (subdiagonal ones, last column −a_i), naming it the rational canonical form of T on a cyclic module; the node assembles these blocks over the invariant factors.

Source: [garrett-modulespid-2024](https://www-users.cse.umn.edu/~garrett/m/algebra/notes_2023-24/10.pdf), Section 4, Corollary 4.0.1, printed p. 144. The decomposition whose summands carry the blocks.

Proof or interface frontier: Promote toMatrix_rationalCanonicalBasis and Matrix.exists_conj_rationalCanonicalForm consumed102; characteristic polynomial blockproof also consumes48 but not listed. Nonempty_aeval_equiv from100 must be its own lemma supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-similarity-by-invariant-factors"></a>

### Similarity of matrices is classified by invariant factors

`ClassicalArithmeticCompletion:CA.3/similarity-by-invariant-factors` · theorem.

Two n × n matrices A, B over a field K are similar (B = P⁻¹ A P for some P ∈ GL_n(K)) if and only if they have the same invariant factors.

Hypotheses and conventions: K any field; no extension of scalars.

Further acceptance checks:

- diag(1, 1) and the matrix with rows (1, 1), (0, 1) have the same characteristic polynomial but invariant factors (X−1, X−1) and ((X−1)²): not similar.
- Over ℚ the matrices with rows (0, −1), (1, 0) and (0, 1), (−1, 0) are similar (both have invariant factor X² + 1).
- A matrix is similar to its transpose (same invariant factors).

Proof sketch:

1. Similar matrices give isomorphic K[X]-modules K^n_A ≅ K^n_B (the isomorphism is P), hence the same invariant factors (InvariantFactors.conj).
2. Conversely, equal invariant factors give the same block-diagonal companion matrix, to which both are similar (Matrix.exists_conj_rationalCanonicalForm); compose.

Direct prerequisites: [CA.3/rational-canonical-form](#CA-3-rational-canonical-form), [CA.3/invariant-factors-of-an-endomorphism](#CA-3-invariant-factors-of-an-endomorphism).

Source: [garrett-modulespid-2024](https://www-users.cse.umn.edu/~garrett/m/algebra/notes_2023-24/10.pdf), Section 5, Corollary 5.0.3, printed p. 150. The node is this corollary in matrix form.

<a id="CA-3-integer-valued-polynomials"></a>

### The ring Int(D) of integer-valued polynomials

`ClassicalArithmeticCompletion:CA.3/integer-valued-polynomials` · definition.

Let D be an integral domain with fraction field K. Int(D) is the set of f ∈ K[X] with f(a) ∈ D for every a ∈ D. It is a D-subalgebra of K[X] containing D[X]. The main case is Int(ℤ) ⊆ ℚ[X]; for a number field, Int(𝓞_K) ⊆ K[X].

Hypotheses and conventions: D an integral domain, K its fraction field (Mathlib IsFractionRing D K); D is identified with its image in K.

API:

- `intValuedPolynomials` (constructor): Int(D) as a D-subalgebra of K[X].
- `IntValuedPolynomials.mem_iff` (characterisation): f ∈ Int(D) iff f(a) ∈ D for all a ∈ D.
- `IntValuedPolynomials.map_mem` (compatibility): Polynomials with coefficients in D are integer-valued: D[X] ⊆ Int(D).
- `IntValuedPolynomials.C_mem_iff` (simp): A constant c is integer-valued iff c ∈ D.
- `IntValuedPolynomials.comp_mem` (structure): Int(D) is closed under composition.
- `IntValuedPolynomials.ringChoose_X_mem` (example): Every binomial polynomial (X choose n) lies in Int(ℤ).
- `IntValuedPolynomials.eq_top_of_field` (simp): Over a field D = K, Int(K) = K[X].

Unit tests:

- `TauCeti.ClassicalArithmetic.intValuedPolynomials_half_choose_two` (non-example): X(X − 1)/2 ∈ Int(ℤ), and it is not the image of any polynomial in ℤ[X].
- `TauCeti.ClassicalArithmetic.intValuedPolynomials_not_half_X` (non-example): X/2 ∉ Int(ℤ).
- `TauCeti.ClassicalArithmetic.intValuedPolynomials_fermat_three` (computation): (X³ − X)/3 ∈ Int(ℤ).
- `TauCeti.ClassicalArithmetic.intValuedPolynomials_constant` (degenerate): The constant 1/2 is not in Int(ℤ).

Further acceptance checks:

- X(X − 1)/2 ∈ Int(ℤ) but ∉ ℤ[X].
- X/2 ∉ Int(ℤ).
- (X³ − X)/3 ∈ Int(ℤ) by Fermat's little theorem.

Proof sketch:

1. Carrier: {f ∈ K[X] | ∀ a ∈ D, f(a) ∈ D}.
2. Closure: (f g)(a) = f(a) g(a), (f + g)(a) = f(a) + g(a), constants c ∈ D are integer-valued (Polynomial.eval_mul and its siblings).
3. D[X] ⊆ Int(D): a polynomial with coefficients in D takes values in D on D.
4. Composition: if f, g ∈ Int(D) then f ∘ g ∈ Int(D), since g(a) ∈ D.
5. The binomial polynomials Ring.choose X n lie in Int(ℤ): their values at integers are binomial coefficients (Mathlib Ring.choose on ℤ).

Direct prerequisites: `mathlib:Subalgebra`, `mathlib:IsFractionRing`, `mathlib:Polynomial.eval`, `mathlib:Ring.choose`, `mathlib:BinomialRing`, `mathlib:Polynomial.map`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 1, printed p. 312. The node is this definition, as a D-subalgebra.

Source: [elliott-intvalued-2011](https://arxiv.org/pdf/1109.3921), Section 1, p. 1. The same definition in the same generality.

<a id="CA-3-polya-binomial-basis"></a>

### Pólya's theorem: the binomial polynomials are a ℤ-basis of Int(ℤ)

`ClassicalArithmeticCompletion:CA.3/polya-binomial-basis` · theorem.

The binomial polynomials (X choose n) = X(X − 1)⋯(X − n + 1)/n!, n ≥ 0, form a basis of Int(ℤ) as a ℤ-module. Equivalently Int(ℤ) is the additive subgroup of ℚ[X] generated by the (X choose n), and every f ∈ Int(ℤ) of degree n is uniquely f = Σ_{k≤n} c_k (X choose k) with c_k = Δ^k f(0) ∈ ℤ.

Hypotheses and conventions: Coefficients in ℚ; values on all of ℤ.

Further acceptance checks:

- X(X − 1)/2 = (X choose 2).
- (X³ − X)/3 = 2 (X choose 3) + 2 (X choose 2) + 0·(X choose 1): c_1 = f(1) − f(0) = 0, c_2 = f(2) − 2c_1 = 2, c_3 = f(3) − 3c_1 − 3c_2 = 8 − 6 = 2.
- The leading coefficient of a degree-n element of Int(ℤ) lies in (1/n!)ℤ.

Proof sketch:

1. Tau Ceti TauCeti.binomialPolynomialBasis: the (X choose n) form a ℚ-basis of ℚ[X]; TauCeti.ringChooseSpanBasisX: they form a ℤ-basis of their additive span TauCeti.ringChooseSpan X, with unique expansions (TauCeti.mem_ringChooseSpan_X_iff_existsUnique).
2. Span ⊆ Int(ℤ): each (X choose n) is integer-valued (IntValuedPolynomials.ringChoose_X_mem).
3. Int(ℤ) ⊆ span: write f ∈ Int(ℤ) of degree n as Σ c_k (X choose k) with c_k ∈ ℚ. Evaluating at 0, 1, …, n gives the triangular system f(j) = Σ_{k≤j} c_k (j choose k) with unit diagonal, whose solution is c_k = f(k) − Σ_{i<k} c_i (k choose i); by induction on k every c_k is an integer.
4. Hence the inclusion of the span into Int(ℤ) is an equality, and the ℤ-basis of the span is a basis of Int(ℤ).

Direct prerequisites: [CA.3/integer-valued-polynomials](#CA-3-integer-valued-polynomials), `tauceti:TauCeti.binomialPolynomialBasis`, `tauceti:TauCeti.ringChooseSpan`, `tauceti:TauCeti.ringChooseSpanBasisX`, `tauceti:TauCeti.mem_ringChooseSpan_X_iff_existsUnique`, `tauceti:TauCeti.mul_mem_ringChooseSpan`, `mathlib:Ring.choose`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 1, formulas (1) and (2), printed p. 311. The source continues with formula (1), f = Σ_{k≤n} c_k (X choose k), and the recursion (2), c_k = f(k) − Σ_{i<k} c_i (k choose i); the node is (1) with (2) as the proof that the c_k are integers.

Proof or interface frontier: Coefficient finite-difference formula c_k=Delta^k f(0) is claimed but proofonlytriangular recursion; supply difference-binomial identity and finite difference extraction. Promote ringChoose_X_mem API103.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-integer-valued-iff-consecutive-values"></a>

### An integer-valued polynomial is detected on n + 1 consecutive integers

`ClassicalArithmeticCompletion:CA.3/integer-valued-iff-consecutive-values` · theorem.

Let f ∈ ℚ[X] have degree at most n and let a ∈ ℤ. Then f ∈ Int(ℤ) if and only if f(a), f(a + 1), …, f(a + n) are integers. Moreover, for any integers b_0, …, b_n there is exactly one f ∈ Int(ℤ) of degree at most n with f(a + k) = b_k.

Hypotheses and conventions: deg f ≤ n; the n + 1 arguments are consecutive.

Further acceptance checks:

- X(X − 1)/2 takes the values 0, 0, 1 at 0, 1, 2, so it is integer-valued.
- X/2 takes the value 1/2 at 1: not integer-valued.
- n points do not suffice: X(X − 1)/4 has degree 2 and integer values at 0 and 1, but the value 1/2 at 2.

Proof sketch:

1. Replace f by f(X + a) (Int(ℤ) is stable under integer translation, IntValuedPolynomials.comp_mem) to reduce to a = 0.
2. Tau Ceti TauCeti.exists_forall_sum_mul_choose_eq: any integer values on 0, …, n are attained by an integral combination g of (X choose k), k ≤ n.
3. f − g has degree ≤ n and vanishes at n + 1 points, so f = g; g ∈ Int(ℤ) by Pólya's theorem.
4. Uniqueness of the interpolant: two such polynomials differ by one of degree ≤ n with n + 1 roots.

Direct prerequisites: [CA.3/polya-binomial-basis](#CA-3-polya-binomial-basis), [CA.3/integer-valued-polynomials](#CA-3-integer-valued-polynomials), `tauceti:TauCeti.exists_forall_sum_mul_choose_eq`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 2, Proposition 1 and Corollary 2, printed p. 313. The node is Corollary 2 with Proposition 1's unique interpolation.

Proof or interface frontier: Split integer-valued consecutive criterion and unique interpolant declarations. Need named polynomial rootcardinality bound and integer-translation invariance suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-integer-valued-polynomials-not-noetherian"></a>

### Int(ℤ) is not Noetherian

`ClassicalArithmeticCompletion:CA.3/integer-valued-polynomials-not-noetherian` · theorem.

The ideal M_{2,0} = {f ∈ Int(ℤ) | f(0) is even} of Int(ℤ) is not finitely generated; hence Int(ℤ) is not a Noetherian ring.

Hypotheses and conventions: None.

Further acceptance checks:

- (X choose 2) ∈ M_{2,0} and its value at 2 is 1.
- M_{2,0} is maximal of index 2.
- By contrast ℤ[X] is Noetherian (Hilbert's basis theorem).

Proof sketch:

1. M_{2,0} is an ideal: it is the kernel of Int(ℤ) → ℤ/2, f ↦ f(0) mod 2.
2. Suppose g_1, …, g_s generate it. Clearing denominators write g_i = f_i / (2^k d) with d odd and f_i ∈ ℤ[X].
3. g_i(0) even gives 2^{k+1} | f_i(0), hence 2^{k+1} | f_i(2^{k+1}) (congruence modulo 2^{k+1} for integer polynomials), hence g_i(2^{k+1}) is even; so every g = Σ h_i g_i (h_i ∈ Int(ℤ)) has g(2^{k+1}) even.
4. But g = (X choose 2^{k+1}) lies in M_{2,0} (g(0) = 0) and g(2^{k+1}) = 1: contradiction.

Direct prerequisites: [CA.3/integer-valued-polynomials](#CA-3-integer-valued-polynomials), [CA.3/polya-binomial-basis](#CA-3-polya-binomial-basis), `mathlib:IsNoetherianRing`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 2, Proposition 3 and its proof, printed p. 314. The node is Proposition 3 with the source's proof.

Proof or interface frontier: Proofcorrect via common denominator 2^k d and parityevaluation. M_2,0 idealdefinition plus non-FG theorem shouldsplit; threeacceptance claims relyunlisted maximal/kernel/Cardindex supplier if included.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-binomial-polynomial-irreducible"></a>

### The binomial polynomials are irreducible in Int(ℤ)

`ClassicalArithmeticCompletion:CA.3/binomial-polynomial-irreducible` · theorem.

For every n ≥ 1 the binomial polynomial (X choose n) is an irreducible element of the ring Int(ℤ).

Hypotheses and conventions: n ≥ 1 (for n = 0 the polynomial is the unit 1).

Further acceptance checks:

- (X choose 1) = X is irreducible in Int(ℤ).
- 2·(X choose 2) = X(X − 1) gives two different irreducible factorizations, both of length two. Different lengths occur in 4·(X choose 4) = (X − 3)·(X choose 3): the left factorization is 2·2·(X choose 4), length three, and the right has length two (Cahen–Chabert Theorem 7).
- In ℚ[X], (X choose 2) is reducible.

Proof sketch:

1. Suppose (X choose n) = g h in Int(ℤ) with deg g = r, deg h = s.
2. By Pólya's theorem r! g and s! h lie in ℤ[X], so r! s! (X choose n) ∈ ℤ[X]; comparing leading coefficients, r! s!/n! ∈ ℤ, i.e. (n choose r) = 1, so r ∈ {0, n}.
3. If r = 0 then g ∈ ℤ is a constant and n! h ∈ ℤ[X]; the leading coefficient of n!(X choose n) is 1 = g · lc(n! h), so g = ±1, a unit of Int(ℤ).

Direct prerequisites: [CA.3/polya-binomial-basis](#CA-3-polya-binomial-basis), [CA.3/integer-valued-polynomials](#CA-3-integer-valued-polynomials).

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 2, Proposition 6 and its proof, printed p. 315. The node is Proposition 6 with the source's proof; restated with the binomial symbol written (X choose n).

<a id="CA-3-characteristic-ideals-of-int"></a>

### The characteristic ideals of Int(D)

`ClassicalArithmeticCompletion:CA.3/characteristic-ideals-of-int` · definition.

For an integral domain D with fraction field K and n ≥ 0, the n-th characteristic ideal I_n(D) is the set of leading coefficients of the elements of Int(D) of degree n, together with 0. It is a D-submodule of K (a fractional ideal of D), I_n(D) ⊆ I_{n+1}(D), and 1 ∈ I_n(D).

Hypotheses and conventions: D an integral domain with fraction field K.

API:

- `characteristicIdeal` (constructor): I_n(D) as a D-submodule of K.
- `CharacteristicIdeal.mem_iff` (characterisation): c ∈ I_n(D) iff c = 0 or c is the leading coefficient of a degree-n element of Int(D).
- `CharacteristicIdeal.mono` (structure): I_n(D) ⊆ I_{n+1}(D).
- `CharacteristicIdeal.one_mem` (simp): 1 ∈ I_n(D).
- `CharacteristicIdeal.zero_eq` (simp): I_0(D) = D.

Unit tests:

- `TauCeti.ClassicalArithmetic.characteristicIdeal_int` (computation): I_n(ℤ) = (1/n!)ℤ.
- `TauCeti.ClassicalArithmetic.characteristicIdeal_field` (degenerate): I_n(ℚ) = ℚ when D = K = ℚ.
- `TauCeti.ClassicalArithmetic.characteristicIdeal_int_not_integral` (non-example): 1/2 ∈ I_2(ℤ) and 1/2 ∉ I_1(ℤ).

Further acceptance checks:

- I_n(ℤ) = (1/n!)ℤ (from Pólya's theorem).
- I_n(K) = K for a field.
- I_2(ℤ) contains 1/2 but I_1(ℤ) does not.

Proof sketch:

1. Closure under addition: for f, g of degree n with leading coefficients c, c′ with c + c′ ≠ 0, f + g has degree n and leading coefficient c + c′; if c + c′ = 0 the sum is 0 ∈ I_n by definition. Closure under multiplication by d ∈ D: d f.
2. Monotone: if f has degree n and leading coefficient c then X f has degree n + 1 and the same leading coefficient.
3. 1 ∈ I_n: Xⁿ ∈ D[X] ⊆ Int(D).
4. I_0(D) = D (constants in Int(D) are exactly D).
5. Fractional: if D is finite it is a field, K=D up to the fraction-field identification, so I_n(D)=D and δ=1 suffices. Otherwise choose n+1 distinct a_0,…,a_n in D. Lagrange interpolation gives δ f ∈ D[X] for the nonzero δ=∏_{i≠j}(a_j−a_i), and hence δ I_n(D)⊆D.

Direct prerequisites: [CA.3/integer-valued-polynomials](#CA-3-integer-valued-polynomials), `mathlib:Polynomial.leadingCoeff`, `mathlib:Polynomial.natDegree`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 5, Characteristic ideals, printed p. 322. The node is this definition with E = D.

<a id="CA-3-regular-basis-iff-characteristic-ideals-principal"></a>

### Regular bases of Int(D)

`ClassicalArithmeticCompletion:CA.3/regular-basis-iff-characteristic-ideals-principal` · theorem.

Let D be an integral domain with fraction field K. Int(D) has a regular basis — a D-basis (f_n)_{n≥0} with deg f_n = n — if and only if every characteristic ideal I_n(D) is principal. In that case a sequence (f_n) in Int(D) with deg f_n = n is a regular basis iff the leading coefficient of f_n generates I_n(D) for every n.

Hypotheses and conventions: D an integral domain. The source states the criterion for Int(E, D) with E ⊆ D infinite; for E = D finite, D is a finite field, Int(D) = D[X] and both sides hold.

Further acceptance checks:

- Int(ℤ) has the regular basis (X choose n), with leading coefficients 1/n! generating I_n(ℤ).
- For a number field K, Int(𝓞_K) has a regular basis iff every n!_{𝓞_K} = I_n(𝓞_K)^{-1} is principal (Cahen–Chabert Proposition 31); for ℚ(√−5) it does not.
- The criterion needs the leading coefficients to generate, not merely lie in, I_n.

Proof sketch:

1. If (f_n) is a regular basis, the leading coefficient c_n of f_n generates I_n: for f ∈ Int(D) of degree n write f = Σ_{k≤n} d_k f_k; its leading coefficient is d_n c_n.
2. Conversely, if I_n = c_n D choose f_n ∈ Int(D) of degree n with leading coefficient c_n.
3. Spanning, by induction on degree: for f ∈ Int(D) of degree n, lc(f) = d c_n with d ∈ D, and f − d f_n ∈ Int(D) has smaller degree.
4. Independence: a nontrivial combination Σ d_k f_k has degree the largest k with d_k ≠ 0 (distinct degrees), so it is nonzero.

Direct prerequisites: [CA.3/characteristic-ideals-of-int](#CA-3-characteristic-ideals-of-int), [CA.3/integer-valued-polynomials](#CA-3-integer-valued-polynomials), `mathlib:Module.Basis`, `mathlib:Submodule.IsPrincipal`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 5, Proposition 19, printed p. 322. The node is Proposition 19 with E = D; the source states it without proof (citing its book), and the proof steps here are the standard degree induction.

Proof or interface frontier: Regular-basis characterization by leading generators is additional declaration missingnative; promote consumed characteristicIdeal membership and includebasisdegreeproofsupplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-capelli-two-power-case"></a>

### The two-power case of Capelli's theorem

`ClassicalArithmeticCompletion:CA.3/capelli-two-power-case` · lemma.

Let K be a field and a ∈ K with a not a square in K and a ∉ −4K⁴. Then X^{2^k} − a is irreducible over K for every k ≥ 0.

Hypotheses and conventions: K any field (the characteristic-2 case is included: there −4K⁴ = {0}). Both conditions are needed: X⁴ + 4 = (X² + 2X + 2)(X² − 2X + 2) although −4 is not a square in ℚ.

Further acceptance checks:

- X⁴ + 1 is irreducible over ℚ (a = −1 is not a square and −1 ∉ −4ℚ⁴).
- X⁴ + 4 = X⁴ − (−4) is reducible: −4 = −4·1⁴.
- X⁸ − 2 is irreducible over ℚ.

Proof sketch:

1. k = 0, 1: X − a is irreducible; X² − a is irreducible since a is not a square (Mathlib X_pow_sub_C_irreducible_of_prime with p = 2).
2. Characteristic 2: X^{2^k} − a = (X − α)^{2^k} over K(α); a monic factor of degree j has constant term ±α^j ∈ K, and the least such j is a power of 2 dividing 2^k; if j < 2^k then α^{2^{k−1}} would lie in K and a would be a square. So X^{2^k} − a is irreducible. From now on char K ≠ 2.
3. Induction (Mathlib X_pow_mul_sub_C_irreducible): with β a root of X² − a and L = K(β) of degree 2, X^{2^k} − a is irreducible over K once X^{2^{k−1}} − β is irreducible over L. By induction on k (applied to L and β) it suffices that β is not a square in L and, when k − 1 ≥ 2, β ∉ −4L⁴.
4. If β = γ² with γ ∈ L, take norms: N_{L/K}(β) = −a (the norm of a power-basis generator is ± the constant coefficient of its minimal polynomial, Mathlib Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly), so −a = N(γ)² = c² with c ∈ K, c ≠ 0. Then i := β/c ∈ L satisfies i² = a/c² = −1, and {1, i} is a K-basis of L. Writing γ = x + y i with x, y ∈ K, γ² = x² − y² + 2xy i = β = c i forces x² = y² and c = 2xy = ±2x², so a = −c² = −4x⁴ ∈ −4K⁴, a contradiction. Hence β is not a square in L.
5. If β = −4δ⁴ with δ ∈ L, then −β = (2δ²)² is a square, so −a = N(β) = N(−β) = N(2δ²)² = c² with c ≠ 0, and i := β/c ∈ L has i² = −1 as before; then β = (2iδ²)² (since (2iδ²)² = −4δ⁴) is a square in L, which the previous step excludes. Hence β ∉ −4L⁴, and the induction hypothesis applies to X^{2^{k−1}} − β over L.

Direct prerequisites: `mathlib:X_pow_sub_C_irreducible_of_prime`, `mathlib:X_pow_mul_sub_C_irreducible`, `mathlib:Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`.

Source: [szechtman-radical-2021](https://arxiv.org/pdf/2006.07951), Section 1, Irreducibility Criterion (C), p. 1. The node is the case n = 2^k of the criterion, over an arbitrary field as in the source (which attributes it to Vahlen, Capelli and Rédei and does not prove it); the proof steps give the norm argument.

Source: [koley-reddy-capelli-2020](https://arxiv.org/pdf/2006.03787), Lemma 10, p. 4. The corresponding step over ℚ in the source's elementary proof; it locates the −4b⁴ exception in the two-power part.

Proof or interface frontier: Two-power proof uses nonroutinepurelyinseparabledegree lemma notlisted and quadraticpowerbasisnormexclusion. Split square-exclusion/−4exclusion and purelyinseparable case or recordclosuregap.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-capelli-theorem"></a>

### Capelli's theorem on the irreducibility of Xⁿ − a

`ClassicalArithmeticCompletion:CA.3/capelli-theorem` · theorem.

Let K be a field, n ≥ 1 and a ∈ K. Then Xⁿ − a is irreducible over K if and only if a ∉ K^p for every prime p dividing n, and a ∉ −4K⁴ when 4 | n.

Hypotheses and conventions: K an arbitrary field, of any characteristic. n ≥ 1.

Further acceptance checks:

- X⁴ + 4 is reducible over ℚ; X⁴ + 1 and X⁴ − 2 are irreducible.
- X⁶ + 27 = X⁶ − (−3)³ is reducible (−27 is a cube).
- For n odd the criterion is Mathlib's X_pow_sub_C_irreducible_iff_forall_prime_of_odd.

Proof sketch:

1. Necessity: if a = b^p with p | n then X^{n/p} − b divides Xⁿ − a; if 4 | n and a = −4b⁴ then Xⁿ − a = (X^{n/4})⁴ + 4b⁴ = (X^{n/2} + 2bX^{n/4} + 2b²)(X^{n/2} − 2bX^{n/4} + 2b²). (Mathlib pow_ne_of_irreducible_X_pow_sub_C covers the first.)
2. Sufficiency: write n = 2^k m with m odd. By Mathlib X_pow_sub_C_irreducible_of_odd, X^m − a is irreducible (a is not a p-th power for primes p | m).
3. If k=0, the odd-exponent baseline finishes. If k=1, the norm argument excludes α being a square, so use the pinned prime-exponent theorem with prime2. Only k≥2 requires exclusion of −4L⁴ and the stronger two-power lemma.
4. With α a root of X^m − a and L = K(α) of degree m, Mathlib X_pow_mul_sub_C_irreducible reduces the claim to the irreducibility of X^{2^k} − α over L. The norm N_{L/K}(α) is a, because m is odd (Mathlib Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly: N(α) = (−1)^m·(−a)). If α = γ² in L then a = N(γ)² is a square in K; if α = −4δ⁴ in L then a = (−4)^m N(δ)⁴ = −4·(2^{(m−1)/2} N(δ))⁴ ∈ −4K⁴. Both are excluded by the hypotheses (the second only matters when 4 | n, i.e. k ≥ 2).
5. For k≥2 the preceding norm argument supplies both hypotheses of CA.3/capelli-two-power-case for α over L, so X^{2^k}−α is irreducible.

Direct prerequisites: [CA.3/capelli-two-power-case](#CA-3-capelli-two-power-case), `mathlib:X_pow_sub_C_irreducible_of_odd`, `mathlib:X_pow_mul_sub_C_irreducible`, `mathlib:pow_ne_of_irreducible_X_pow_sub_C`, `mathlib:Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`, `mathlib:X_pow_sub_C_irreducible_of_prime`.

Source: [szechtman-radical-2021](https://arxiv.org/pdf/2006.07951), Section 1, Irreducibility Criterion (C), p. 1. The node is this criterion over an arbitrary field; the source states it with its history, and the proof follows the norm reduction to the two-power case.

Source: [koley-reddy-capelli-2020](https://arxiv.org/pdf/2006.03787), Theorem 1, p. 1. The case K = ℚ, with a complete elementary proof in the source.

<a id="CA-3-analytic-order-of-a-polynomial"></a>

### The analytic order of a complex polynomial is its root multiplicity

`ClassicalArithmeticCompletion:CA.3/analytic-order-of-a-polynomial` · lemma.

For a nonzero p ∈ ℂ[X] and z ∈ ℂ, the order of vanishing at z of the entire function w ↦ p(w) equals the multiplicity of z as a root of p.

Hypotheses and conventions: p ≠ 0.

Further acceptance checks:

- For p = (X − 1)² (X + 1) the order at 1 is 2 and at 0 is 0.
- For p = X³ the order at 0 is 3.
- Summing over a disc counts roots with multiplicity, which is how Rouché's theorem is applied to polynomials.

Proof sketch:

1. Write p = (X − z)^m q with m = rootMultiplicity z p and q(z) ≠ 0 (Mathlib Polynomial.exists_eq_pow_rootMultiplicity_mul_and_not_dvd).
2. Then p(w) = (w − z)^m q(w) near z with q analytic and q(z) ≠ 0, which is the characterisation of analytic order m (Mathlib AnalyticAt.analyticOrderAt_eq_natCast).

Direct prerequisites: `mathlib:Polynomial.exists_eq_pow_rootMultiplicity_mul_and_not_dvd`, `mathlib:AnalyticAt.analyticOrderAt_eq_natCast`, `mathlib:analyticOrderNatAt`, `mathlib:Polynomial.rootMultiplicity`.

Source: [barbeau-irreducibility-2010](https://www.math.utoronto.ca/barbeau/hxpol6.pdf), Section 2, Perron's criterion, printed p. 49. Rouché counts zeros with multiplicity as analytic orders; this lemma converts that count to the root count of a polynomial, a step the source takes for granted.

<a id="CA-3-perron-root-location"></a>

### Root location under Perron's condition

`ClassicalArithmeticCompletion:CA.3/perron-root-location` · lemma.

Let f = Xⁿ + a_{n−1}X^{n−1} + ⋯ + a_0 ∈ ℂ[X] be monic of degree n ≥ 2 with a_0 ≠ 0 and |a_{n−1}| > 1 + |a_{n−2}| + ⋯ + |a_0|. Then f has exactly one root (counted with multiplicity) with |z| ≥ 1, and n − 1 roots in the open unit disc.

Hypotheses and conventions: Strict inequality; monic; n ≥ 2.

Further acceptance checks:

- X³ + 5X² + X + 1: |5| > 1 + 1 + 1, so one root outside the disc and two inside.
- The condition fails for X² + 2X + 1 (|2| = 1 + 1): two roots at −1.
- Degree 1 is excluded by n ≥ 2.

Proof sketch:

1. Compare f with v(z) = zⁿ + a_{n−1}z^{n−1} on |z| = 1: |f(z) − v(z)| ≤ |a_{n−2}| + ⋯ + |a_0| < |a_{n−1}| − 1 ≤ |z^{n−1}|·|z + a_{n−1}| = |v(z)|.
2. Tau Ceti TauCeti.rouche_add: f and v have the same number of zeros, counted by analytic order, in the open unit disc; by CA.3/analytic-order-of-a-polynomial these are root counts.
3. v has the root 0 of multiplicity n − 1 inside and the root −a_{n−1} with |a_{n−1}| > 1 outside, so f has n − 1 roots in the open disc; f has no root on the circle (|f| ≥ |v| − |f − v| > 0 there), so exactly one root has |z| ≥ 1.

Direct prerequisites: [CA.3/analytic-order-of-a-polynomial](#CA-3-analytic-order-of-a-polynomial), `tauceti:TauCeti.rouche_add`, `mathlib:Polynomial.roots`.

Source: [barbeau-irreducibility-2010](https://www.math.utoronto.ca/barbeau/hxpol6.pdf), Section 2, printed p. 49. The node is this root-location step with the source's comparison function.

<a id="CA-3-perron-criterion"></a>

### Perron's irreducibility criterion

`ClassicalArithmeticCompletion:CA.3/perron-criterion` · theorem.

Let f = Xⁿ + a_{n−1}X^{n−1} + ⋯ + a_0 ∈ ℤ[X] with n ≥ 2, a_0 ≠ 0 and |a_{n−1}| > 1 + |a_{n−2}| + ⋯ + |a_1| + |a_0|. Then f is irreducible in ℤ[X] (equivalently in ℚ[X]).

Hypotheses and conventions: Monic with integer coefficients, nonzero constant term, strict inequality.

Further acceptance checks:

- X³ + 5X² + X + 1 is irreducible over ℚ.
- Xⁿ + 3X^{n−1} + 1 is irreducible for every n ≥ 2.
- The hypothesis a_0 ≠ 0 is needed: X³ + 3X² = X²(X + 3).

Proof sketch:

1. f is monic, hence primitive (Mathlib Polynomial.Monic.isPrimitive), so irreducibility in ℤ[X] and in ℚ[X] agree (Mathlib Polynomial.IsPrimitive.Int.irreducible_iff_irreducible_map_cast).
2. Map f to ℂ and apply CA.3/perron-root-location; the coefficient inequality transports along the canonical integer embedding.
3. Apply CA.3/irreducible-of-single-outer-root. It packages the common integral-factor argument for the strict and weak criteria: nonzero integer constant terms force each nonconstant monic factor to contain an outer root, and multiplicities add.

Direct prerequisites: [CA.3/perron-root-location](#CA-3-perron-root-location), `mathlib:Polynomial.Monic.isPrimitive`, `mathlib:Polynomial.IsPrimitive.Int.irreducible_iff_irreducible_map_cast`, [CA.3/irreducible-of-single-outer-root](#CA-3-irreducible-of-single-outer-root).

Source: [barbeau-irreducibility-2010](https://www.math.utoronto.ca/barbeau/hxpol6.pdf), Section 2, printed p. 49. The node is this criterion (with n ≥ 2, implicit in the source); the source writes f for u in the conclusion (ClassicalArithmeticCompletion/E410).

Source: [singh-kumar-irreducibility-2023](https://arxiv.org/pdf/2310.02860), Section on root location, pp. 12–13. The same statement with the hypothesis n ≥ 2 explicit.

<a id="CA-3-polya-szego-prime-value-criterion"></a>

### A prime value far from the roots forces irreducibility

`ClassicalArithmeticCompletion:CA.3/polya-szego-prime-value-criterion` · lemma.

Let f ∈ ℤ[X] and b ∈ ℤ with f(b) prime, f(b − 1) ≠ 0, and Re α < b − 1/2 for every complex root α of f. Then f is irreducible in ℤ[X].

Hypotheses and conventions: f(b) is a prime (up to sign) of ℤ; f(b − 1) ≠ 0.

Further acceptance checks:

- f = X² + 1, b = 2: f(2) = 5 prime, f(1) = 2 ≠ 0, roots ±i with real part 0 < 3/2: irreducible.
- X³ − 9X² − 9X + 1 = (X + 1)(X² − 10X + 1) has the prime value 11 at 10 but a root 5 + √24 ≈ 9.9 with real part > 9.5: the root condition is essential.
- f(b − 1) ≠ 0 is needed to get |g(b − 1)| ≥ 1.

Proof sketch:

1. If deg f = 0 then f = f(b) is a prime constant, irreducible. Assume deg f ≥ 1 and f = g h with neither factor a unit.
2. Key inequality: for a nonconstant g ∈ ℤ[X] whose roots α satisfy Re α < b − 1/2, |g(b − 1/2 − t)| < |g(b − 1/2 + t)| for t > 0 (each linear factor satisfies |b − 1/2 − t − α| < |b − 1/2 + t − α|). At t = 1/2: |g(b − 1)| < |g(b)|; since g(b − 1) is a nonzero integer, |g(b)| ≥ 2.
3. A constant factor c with |c| ≥ 2 and a nonconstant cofactor g gives |f(b)| = |c||g(b)| ≥ 4 composite; two nonconstant factors give |f(b)| = |g(b)||h(b)| with both ≥ 2. Either contradicts primality.

Direct prerequisites: `mathlib:Polynomial.roots`, `mathlib:Polynomial.eval_mul`.

Source: [brillhart-cohn-1981](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/F1644BDFD66CFC166841810C29CBA91A/S0008414X00034581a.pdf/on-an-irreducibility-theorem-of-a-cohn.pdf), Theorem 2, printed p. 1055. The node is Theorem 2 (credited there to Pólya and Szegő) with its proof; The inherited reading used the page image because the text layer of the scan is corrupt.

<a id="CA-3-digit-polynomial-root-location"></a>

### The roots of a digit polynomial

`ClassicalArithmeticCompletion:CA.3/digit-polynomial-root-location` · lemma.

Let b ≥ 2 and let f = Σ a_k X^k ∈ ℤ[X] be nonzero with 0 ≤ a_k ≤ b − 1 for all k. Then every complex root α of f satisfies Re α < b − 1/2.

Hypotheses and conventions: Digits: all coefficients in [0, b − 1]; f ≠ 0.

Further acceptance checks:

- For b = 10 and f = 3X² + 9X + 7 (the digits of 397) the roots have real part −1.5 < 9.5.
- For b = 2 the bound B = 1 equals b − 1.
- Negative digits break it: X³ − 9X² − 9X + 1 has a root near 9.9.

Proof sketch:

1. Degree 0 has no roots; degree 1: the root −a_0/a_1 ≤ 0 < b − 1/2.
2. Degree n ≥ 2: the leading digit a_n ≥ 1 and a_{n−1}, a_{n−2} ≥ 0, and m := max_{k≤n−2} |a_k|/a_n ≤ b − 1 ≤ B, where B = 1 for b = 2 and B = ⌊(2b − 1)(2b − 1 − √2)/2⌋ for b ≥ 3.
3. Theorem 3 of Brillhart–Filaseta–Odlyzko: all roots lie in Re z ≤ max(r_1/√2, r_2), where r_1 is the positive root of x² − x − m and r_2 that of x³ − x² − m (estimate |f(z)/zⁿ| from below on the two regions |z| > r_1, and |z| ≤ r_1 with |arg z| < π/4).
4. r_1 ≤ r_1*, r_2 ≤ r_2* for the roots with m replaced by B, and h(b − 1/2) = (2b − 1)(2b − 1 − √2)/2 − B > 0, g(b − 1/2) = (b − 1/2)²(b − 3/2) − B > 0 give b − 1/2 > max(r_1*/√2, r_2*).

Direct prerequisites: `mathlib:Polynomial.roots`.

Source: [brillhart-cohn-1981](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/F1644BDFD66CFC166841810C29CBA91A/S0008414X00034581a.pdf/on-an-irreducibility-theorem-of-a-cohn.pdf), Theorem 3 and Corollary 1, printed pp. 1056–1057. The node is the root-location content of Theorem 3 and Corollary 1 specialised to digits; The inherited reading used the page image.

Proof or interface frontier: Digit rootproof uses unlistedTheorem3 sector/modulus estimates and monotonicity of positive quadratic/cubic roots; split ≥onepage sourceproof into named supporting nodes.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-cohn-irreducibility-criterion"></a>

### Cohn's irreducibility criterion in every base

`ClassicalArithmeticCompletion:CA.3/cohn-irreducibility-criterion` · theorem.

Let b ≥ 2 and p a prime with base-b expansion p = Σ_{k=0}^n a_k b^k, 0 ≤ a_k ≤ b − 1. Then Σ a_k X^k is irreducible in ℤ[X].

Hypotheses and conventions: p prime; b ≥ 2; the a_k are the base-b digits of p (Mathlib Nat.digits b p).

Further acceptance checks:

- 397 in base 10 gives 3X² + 9X + 7, irreducible; in base 2 it gives X⁸ + X⁷ + X³ + X² + 1.
- A prime p < b gives the constant p, irreducible in ℤ[X].
- The base-10 digits of the composite 121 give X² + 2X + 1 = (X + 1)²: primality of p is essential.

Proof sketch:

1. Let f = Σ a_k X^k, so f(b) = p (Mathlib Nat.ofDigits_digits).
2. f(b − 1) = Σ a_k (b − 1)^k ≥ a_n (b − 1)^n > 0 since the digits are nonnegative and the leading digit is positive.
3. Every root has Re α < b − 1/2 (CA.3/digit-polynomial-root-location).
4. CA.3/polya-szego-prime-value-criterion applies.

Direct prerequisites: [CA.3/polya-szego-prime-value-criterion](#CA-3-polya-szego-prime-value-criterion), [CA.3/digit-polynomial-root-location](#CA-3-digit-polynomial-root-location), `mathlib:Nat.digits`, `mathlib:Nat.ofDigits_digits`.

Source: [brillhart-cohn-1981](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/F1644BDFD66CFC166841810C29CBA91A/S0008414X00034581a.pdf/on-an-irreducibility-theorem-of-a-cohn.pdf), Corollary 2, printed p. 1058. The node is Corollary 2; The inherited reading used the page image.

Source: [barbeau-irreducibility-2010](https://www.math.utoronto.ca/barbeau/hxpol6.pdf), Section 3, printed p. 50. The base-10 original.

<a id="CA-3-sloped-valuation"></a>

### The sloped valuation of a polynomial over a valued field

`ClassicalArithmeticCompletion:CA.3/sloped-valuation` · definition.

Let K be a field with an additive valuation v : K → ℝ ∪ {∞} (v(0) = ∞, v(xy) = v(x) + v(y), v(x + y) ≥ min(v(x), v(y))). For r ∈ ℝ and f = Σ a_i X^i ∈ K[X], the sloped valuation is v_r(f) = min_{i : a_i ≠ 0} (v(a_i) + r i), and v_r(0) = ∞. It is the intercept of the supporting line of slope r of the Newton polygon.

Hypotheses and conventions: Valuation with values in ℝ ∪ {∞} (Mathlib AddValuation K (WithTop ℝ)); the minimum over the support of f.

API:

- `slopedValuation` (constructor): v_r(f).
- `SlopedValuation.zero` (simp): v_r(0) = ⊤.
- `SlopedValuation.C_mul_X_pow` (simp): v_r(c Xⁿ) = v(c) + r n for c ≠ 0.
- `SlopedValuation.le_coeff` (characterisation): v_r(f) ≤ v(a_i) + r i for every i.
- `SlopedValuation.min_le_add` (structure): min(v_r f, v_r g) ≤ v_r(f + g).
- `SlopedValuation.zero_slope` (compatibility): v_0 is the Gauss valuation min_i v(a_i).

Unit tests:

- `TauCeti.ClassicalArithmetic.slopedValuation_X` (computation): v_r(X) = r.
- `TauCeti.ClassicalArithmetic.slopedValuation_X_sub_C` (characterisation): v_r(X − c) = min(v(c), r) for c ≠ 0.
- `TauCeti.ClassicalArithmetic.slopedValuation_zero_poly` (degenerate): v_r(0) = ⊤.

Further acceptance checks:

- v_r(X) = r.
- v_r(X − c) = min(v(c), r) for c ≠ 0.
- v_r(0) = ∞.

Proof sketch:

1. Define v_r(f) as the infimum over the support of f in WithTop ℝ (Finset.inf), so v_r(0) = ⊤.
2. Monomial: v_r(c X^n) = v(c) + r n.
3. Each term bounds it: v_r(f) ≤ v(a_i) + r i.
4. Ultrametric: v_r(f + g) ≥ min(v_r(f), v_r(g)).
5. r = 0 gives the Gauss valuation min_i v(a_i).

Direct prerequisites: `mathlib:AddValuation`, `mathlib:AddValuation.map_mul`, `mathlib:AddValuation.map_add`, `mathlib:Polynomial.support`.

Source: [kedlaya-newtonpolygons-2007](https://kskedlaya.org/18.787/newton-poly.pdf), Section 2, p. 2. The node is this definition for ordinary (untwisted) polynomials, the case d = 0 of the source.

<a id="CA-3-sloped-valuation-mul"></a>

### Gauss's lemma for sloped valuations

`ClassicalArithmeticCompletion:CA.3/sloped-valuation-mul` · lemma.

For f, g ∈ K[X] and r ∈ ℝ, v_r(f g) = v_r(f) + v_r(g).

Hypotheses and conventions: K a field with an additive valuation to ℝ ∪ {∞}.

Further acceptance checks:

- v_r((X − c)(X − c′)) = min(v c, r) + min(v c′, r).
- For r = 0 this is Gauss's lemma for the Gauss valuation.
- It fails for non-ultrametric absolute values.

Proof sketch:

1. If f or g is 0 both sides are ∞. Otherwise the coefficient of X^k in f g is Σ_{i+j=k} a_i b_j (Mathlib Polynomial.coeff_mul), each term of value v(a_i) + v(b_j) (AddValuation.map_mul), so v_r(f g) ≥ v_r(f) + v_r(g) by the ultrametric inequality (AddValuation.map_add).
2. Let i_0, j_0 be the least indices minimising v(a_i) + r i and v(b_j) + r j. In the coefficient of X^{i_0 + j_0} the term a_{i_0} b_{j_0} has value exactly v_r(f) + v_r(g) − r(i_0 + j_0), and every other term (i < i_0 or j < j_0) has strictly larger value; so the coefficient has that exact value and v_r(f g) ≤ v_r(f) + v_r(g).

Direct prerequisites: [CA.3/sloped-valuation](#CA-3-sloped-valuation), `mathlib:Polynomial.coeff_mul`, `mathlib:AddValuation.map_mul`, `mathlib:AddValuation.map_add`.

Source: [kedlaya-newtonpolygons-2007](https://kskedlaya.org/18.787/newton-poly.pdf), Section 2, Proposition 1 and its proof, p. 2. The node is Proposition 1 in the untwisted case (d = 0, r₀ = ∞); display (1) of the source has a misprint (ClassicalArithmeticCompletion/E407).

<a id="CA-3-newton-slope-multiplicity"></a>

### The Newton polygon, by slope multiplicities

`ClassicalArithmeticCompletion:CA.3/newton-slope-multiplicity` · definition.

For a nonzero f = Σ a_i X^i ∈ K[X] and r ∈ ℝ, let S_r be the set of indices i with a_i ≠ 0 attaining v_r(f) = v(a_i) + r i. The multiplicity of r as a slope of f is m_r(f) = max S_r − min S_r (the width of the edge of slope r of the Newton polygon, in the orientation in which a linear factor X − c has the single slope v(c)); m_r(0) = 0. Only finitely many r have m_r(f) > 0, and Σ_r m_r(f) = deg f − ord_0 f.

Hypotheses and conventions: Orientation pinned: slopes are valuations of roots (the lower convex hull of the points (−i, v(a_i))); in the usual picture with points (i, v(a_i)) this is the negative of the geometric slope.

API:

- `newtonSlopeMultiplicity` (constructor): m_r(f), the width of the edge of slope r.
- `NewtonSlopeMultiplicity.X_sub_C` (simp): m_r(X − c) = 1 if v(c) = r and 0 otherwise (c ≠ 0).
- `NewtonSlopeMultiplicity.C_mul` (simp): m_r(c f) = m_r(f) for c ≠ 0.
- `NewtonSlopeMultiplicity.finite_support` (structure): Only finitely many r have m_r(f) ≠ 0.
- `NewtonSlopeMultiplicity.C_mul_X_pow` (simp): A monomial has no slopes.

Unit tests:

- `TauCeti.ClassicalArithmetic.newtonSlopeMultiplicity_sq_sub_uniformizer` (computation): If v(π) = 1 then m_{1/2}(X² − π) = 2.
- `TauCeti.ClassicalArithmetic.newtonSlopeMultiplicity_orientation` (non-example): If v(π) = 1 then m_{−1/2}(X² − π) = 0.
- `TauCeti.ClassicalArithmetic.newtonSlopeMultiplicity_zero_poly` (degenerate): m_r(0) = 0.

Further acceptance checks:

- If v(π) = 1 then X² − π has m_{1/2} = 2.
- m_{−1/2}(X² − π) = 0 (orientation check).
- A monomial has no slopes.

Proof sketch:

1. Define S_r by filtering the support of f and m_r as the difference of its largest and least element (0 if S_r is empty, i.e. f = 0).
2. Linear factor: for X − c with c ≠ 0 both indices attain v_r exactly when v(c) = r, so m_r = 1 if r = v(c) and 0 otherwise.
3. Scaling by c ≠ 0 shifts every term by v(c) and does not change S_r.
4. Finiteness: m_r(f) > 0 needs two indices i < i′ with v(a_i) + r i = v(a_{i′}) + r i′, which determines r; there are finitely many pairs.
5. Sum of widths: as r increases, the minimising index set moves from the largest to the least index of the support, and the widths of the edges add up to the length of the support interval.

Direct prerequisites: [CA.3/sloped-valuation](#CA-3-sloped-valuation), `mathlib:AddValuation`, `mathlib:Polynomial.support`.

Source: [kedlaya-newtonpolygons-2007](https://kskedlaya.org/18.787/newton-poly.pdf), Section 1, p. 1. The node records exactly this multiset, as the function r ↦ width; the source draws the points (−i, v(P_i)), which is the pinned orientation.

Source: [garrett-newtonpolygons-2005](https://www-users.cse.umn.edu/~garrett/m/number_theory/newton_polygon.pdf), Theorem, p. 1. The same data in the other orientation (points (i, ord c_i), slope −m_j for roots of ord m_j); the node's orientation makes the sign disappear.

Proof or interface frontier: Totalwidthsum claimabsentnativefinite_supportsignature andneeds nonroutine minimizer movement or piecewise-linearity lemma. Promote X_sub_C/C_mulAPIconsummed122, and extremafindata if introduced.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-dumas-theorem"></a>

### Dumas's theorem: Newton polygons multiply

`ClassicalArithmeticCompletion:CA.3/dumas-theorem` · theorem.

For nonzero f, g ∈ K[X] and every r ∈ ℝ, m_r(f g) = m_r(f) + m_r(g): the multiset of slopes of the Newton polygon of f g is the union of those of f and g.

Hypotheses and conventions: K a field with an additive valuation to ℝ ∪ {∞}; f, g ≠ 0; no completeness or splitting hypothesis.

Further acceptance checks:

- If v(π) = 1, the polygon of (X² − π)(X − 1) has the slopes 1/2, 1/2 and 0.
- Barbeau's example: the slope lists {−2, −2, 1, 1} and {0, 3} combine to {−2, −2, 0, 1, 1, 3} (in his orientation).
- Irreducibility test: a polynomial whose polygon has a single edge without interior lattice points has no nontrivial factor (CA.3/eisenstein-dumas-criterion).

Proof sketch:

1. By CA.3/sloped-valuation-mul the least minimising index of f g for v_r is i_0 + j_0, the sum of the least minimising indices of f and g (the proof of that lemma exhibits the term a_{i_0} b_{j_0} as the unique term of least value in its coefficient, and no smaller index attains the minimum).
2. Symmetrically (largest indices, same argument with the largest minimising indices) the largest minimising index of f g is the sum of the largest ones.
3. Subtracting: the width m_r(f g) is m_r(f) + m_r(g).

Direct prerequisites: [CA.3/newton-slope-multiplicity](#CA-3-newton-slope-multiplicity), [CA.3/sloped-valuation-mul](#CA-3-sloped-valuation-mul).

Source: [kedlaya-newtonpolygons-2007](https://kskedlaya.org/18.787/newton-poly.pdf), Corollary 2, p. 2. The node is Corollary 2 in the untwisted case (r₀ = ∞), proved through the extreme minimising indices.

Source: [barbeau-irreducibility-2010](https://www.math.utoronto.ca/barbeau/hxpol6.pdf), Section 2, printed p. 47. The classical statement over ℤ with the p-adic valuation.

Proof or interface frontier: Least/greatest minimizing-indexadditivity usedonlyinproof119, notstatement119. Needs separate supporting lemmas/directprerequisites before Dumaswidthsubtraction.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-3-newton-slopes-of-a-split-polynomial"></a>

### The slopes of a split polynomial are the valuations of its roots

`ClassicalArithmeticCompletion:CA.3/newton-slopes-of-a-split-polynomial` · theorem.

If f = c ∏_{k} (X − c_k) with c ≠ 0 and all c_k ≠ 0 (a finite multiset of roots), then for every r ∈ ℝ, m_r(f) is the number of k with v(c_k) = r.

Hypotheses and conventions: f splits over K itself (no extension of the valuation is used); the roots are nonzero.

Further acceptance checks:

- X² − π over a field containing √π with v(π) = 1: two roots of valuation 1/2.
- X² − 1 has the slope 0 twice.
- Garrett's example X⁵ + 2X² + 4 with the 2-adic valuation: m_{1/3} = 3 and m_{1/2} = 2, computed from the coefficients; over a field where it splits, three roots have valuation 1/3 and two have 1/2.

Proof sketch:

1. m_r is additive (CA.3/dumas-theorem) and invariant under scaling (NewtonSlopeMultiplicity.C_mul).
2. Each linear factor contributes 1 exactly at r = v(c_k) (NewtonSlopeMultiplicity.X_sub_C); induct on the multiset.

Direct prerequisites: [CA.3/dumas-theorem](#CA-3-dumas-theorem), [CA.3/newton-slope-multiplicity](#CA-3-newton-slope-multiplicity).

Source: [kedlaya-newtonpolygons-2007](https://kskedlaya.org/18.787/newton-poly.pdf), Corollary 3, p. 2. The node is Corollary 3 with nonzero roots (the source allows a zero root with slope +∞ separately).

Source: [garrett-newtonpolygons-2005](https://www-users.cse.umn.edu/~garrett/m/number_theory/newton_polygon.pdf), Theorem and proof, p. 1. The same theorem proved through symmetric functions; its proof has slips of direction and index (ClassicalArithmeticCompletion/E405).

<a id="CA-3-eisenstein-dumas-criterion"></a>

### The Eisenstein–Dumas irreducibility criterion

`ClassicalArithmeticCompletion:CA.3/eisenstein-dumas-criterion` · theorem.

Let K be a field with a discrete valuation v : K → ℤ ∪ {∞} and f = Σ_{i=0}^n a_i X^i ∈ K[X] of degree n ≥ 1 with a_0 ≠ 0. Suppose gcd(v(a_0) − v(a_n), n) = 1 and n v(a_i) ≥ (n − i) v(a_0) + i v(a_n) for every i with a_i ≠ 0 (the Newton polygon is the single segment joining its endpoints). Then f is irreducible over K. Eisenstein's criterion is the case v(a_n) = 0, v(a_i) ≥ 1 for i < n, v(a_0) = 1.

Hypotheses and conventions: Discrete (ℤ-valued) valuation; a_0 a_n ≠ 0; the coprimality and the lower-bound conditions (D1), (D2).

Further acceptance checks:

- X² − p over ℚ with the p-adic valuation: v(a_0) − v(a_2) = 1, coprime to 2: irreducible.
- X⁴ − p²: the difference 2 is not coprime to 4 and indeed X⁴ − p² = (X² − p)(X² + p).
- Eisenstein's criterion for X^n − p is the case of one segment from (0, 1) to (n, 0).

Proof sketch:

1. View v as real-valued. By (D2) the only slope of f is λ = (v(a_0) − v(a_n))/n, with m_λ(f) = n.
2. Suppose f = g h with deg g = k, 0 < k < n. By CA.3/dumas-theorem, g has the single slope λ with multiplicity k, so its extreme coefficients satisfy v(g_0) − v(g_k) = k λ (the edge from index 0 to k has slope λ).
3. v(g_0) − v(g_k) is an integer, so n divides k (v(a_0) − v(a_n)); as gcd(v(a_0) − v(a_n), n) = 1, n | k, contradicting 0 < k < n.

Direct prerequisites: [CA.3/dumas-theorem](#CA-3-dumas-theorem), [CA.3/newton-slope-multiplicity](#CA-3-newton-slope-multiplicity), `mathlib:AddValuation`.

Source: [juras-eisensteindumas-2015](https://arxiv.org/pdf/1505.07633), Theorem 1.1, p. 2. The node is Theorem 1.1 for the value group ℤ, where (D1) is gcd(v(a_0) − v(a_n), n) = 1; the source cites Brown for the proof, and the proof steps derive it from Dumas's theorem.

Source: [garrett-newtonpolygons-2005](https://www-users.cse.umn.edu/~garrett/m/number_theory/newton_polygon.pdf), Corollary (Irreducibility criterion), p. 2. The complete-field version, proved there through ramification indices.

### Continuation frontier

- Int(𝓞_K) beyond the definition and the regular-basis criterion: the local formula for the characteristic ideals, Proposition 31 of Cahen–Chabert (Int(𝓞_K) has a regular basis iff every factorial ideal n!_{𝓞_K} is principal) and the Pólya group. Cahen–Chabert state these without proof, citing their book (Chapter II), which is not freely available; no public source with proofs was obtained.
- Bary-Soroker–Koukoulopoulos–Kozma 51 and 58 require the stronger Mignotte Euclidean coefficient-norm bound with sqrt(m) in the exponent and its integer-evaluation consequence. Acquire Mignotte 1988 Theorem 1-prime and the subsequent remarks at their full hypotheses. The basic binomial-times-Mahler coefficient estimate does not imply this stronger bound; retain the correction norm(A)≤H sqrt(n+1).
- Smith 17 (Lemma 2.10): a nonnegative integral combination, after removing the common polynomial gcd, is squarefree of the expected degree with coefficients at most 2(n−deg G). No exact node exists here. Import the existing resultant/discriminant and finite-grid nonvanishing machinery rather than creating a separate interpolation theory.
- Independent review frontier: 22 existing targets have the mathematical or interface obligations recorded under gaps. Resume those IDs directly; revisionResponse records corrections and checked signatures, without claiming their remaining proofs closed.

## CA.4. Classical Diophantine equations

Organize elementary descent around concrete carriers: quartic equations, the coefficient-three Markoff surface and Vieta moves, sums of squares, Pell norm fibres, numerical semigroups and distinct-denominator Egyptian fractions. The later source routes need the general level-k and higher-variable Markoff carriers and their exceptional branches. Catalan–Mihăilescu requires a separate cyclotomic owner; it is not asserted as an elementary consequence.

Landmarks: Integer linear systems; Markoff tree; Legendre's three-square theorem; Jacobi's four-square theorem; Ramanujan–Nagell equation; Numerical semigroup.

<a id="CA-4-integer-linear-systems"></a>

### Integer linear systems and the parametrisation of their solutions

`ClassicalArithmeticCompletion:CA.4/integer-linear-systems` · construction.

Let A be an integer matrix with n rows and m columns and b ∈ ℤⁿ. Let P ∈ GL_n(ℤ) and Q ∈ GL_m(ℤ) be unimodular matrices with PAQ = D rectangular diagonal, D_{ii} = d_i for i < min(n, m) and all other entries 0 (a Smith normal form in the sense of CA.3, or any diagonalisation by unimodular matrices; the d_i may be 0). Write c = Pb. The integer solution set Sol(A, b) = {x ∈ ℤᵐ : Ax = b} is nonempty if and only if d_i divides c_i for every i < min(n, m) (for d_i = 0 this means c_i = 0) and c_i = 0 for every i ≥ m. When it is nonempty, Sol(A, b) = x₀ + ker(A), where x₀ = Q y₀ with (y₀)_i = c_i/d_i when d_i ≠ 0 and 0 otherwise, and ker(A) = {x ∈ ℤᵐ : Ax = 0} is the free abelian group with basis the columns Q e_j for the indices j < m with j ≥ n or d_j = 0; its rank is m − s where s is the number of nonzero d_i.

Hypotheses and conventions: A and b have integer entries; no rank, squareness or nonsingularity hypothesis is made. P and Q are invertible over ℤ (determinant ±1), not merely over ℚ; the statement is about the full solution set in ℤᵐ, not over ℚ. The d_i need not form a divisibility chain for this statement; the Smith normal form of CA.3 is one admissible choice of (P, D, Q).

API:

- `Matrix.intSolutionSet` (data): Sol(A, b) = {x ∈ ℤᵐ : A x = b}, as a set of vectors.
- `Matrix.IntSolvable` (data): The predicate that Sol(A, b) is nonempty.
- `Matrix.intSolutionSet_zero` (characterisation): Sol(A, 0) is the kernel of the linear map x ↦ A x.
- `Matrix.intSolvable_iff` (characterisation): For unimodular P, Q with P A Q diagonal with entries d_i: IntSolvable A b ↔ (∀ i < min(n, m), d_i ∣ (P b)_i) ∧ (∀ i ≥ m, (P b)_i = 0).
- `Matrix.intKernel_basis` (structure): The columns Q e_j, j < m with j ≥ n or d_j = 0, are linearly independent and span ker(A).
- `Matrix.intSolutionSet_eq` (characterisation): If x₀ ∈ Sol(A, b), then Sol(A, b) = x₀ + ker(A) as sets.
- `Matrix.intSolvable_one_by_two_iff` (compatibility): For A = (a b) and n ∈ ℕ: IntSolvable A (n) ↔ gcd(a, b) ∣ n, which is Mathlib's Int.gcd_dvd_iff.

Unit tests:

- `Matrix.intSolutionSet_six_ten_four` (computation): For A = (6 10) and b = (4): Sol(A, b) = {(−1 + 5t, 1 − 3t) : t ∈ ℤ}.
- `Matrix.not_intSolvable_six_ten_three` (non-example): For A = (6 10) and b = (3): Sol(A, b) is empty, although 6·(1/2) + 10·0 = 3 over ℚ.
- `Matrix.intKernel_six_ten` (computation): The kernel of A = (6 10) is ℤ·(5, −3); in particular it is not ℤ·(10, −6).
- `Matrix.intSolutionSet_zero_matrix` (degenerate): For the zero n × m matrix, Sol(0, b) = ℤᵐ if b = 0 and is empty otherwise.
- `Matrix.intSolvable_one_by_two_compat` (compatibility): For A = (a b), IntSolvable A (n) ↔ ∃ x y : ℤ, n = a x + b y, the right-hand side being Mathlib's Int.gcd_dvd_iff.

Further acceptance checks:

- Both halves are stated and needed: the divisibility criterion and the coset parametrisation. Mathlib proves only solvability of one equation in two unknowns (Int.gcd_dvd_iff) and neither the general criterion nor any parametrisation.
- The kernel is free of rank m − s, so the solution set is a coset of a free group of that rank, not a single solution.
- For 6x + 10y = 4: g = 2 divides 4, and the solutions are (−1 + 5t, 1 − 3t), t ∈ ℤ.
- For 6x + 10y = 3 there is no integer solution although there is a rational one, so a criterion over ℚ is the wrong one.

Proof sketch:

1. Substitute x = Q y. Since Q is unimodular, x ↦ Q⁻¹x is a bijection ℤᵐ → ℤᵐ, and Ax = b is equivalent to D y = c with c = P b, because P is unimodular.
2. Solve D y = c coordinatewise: for i < min(n, m) the equation is d_i y_i = c_i; for min(n, m) ≤ i < n it reads 0 = c_i; the coordinates y_j with j ≥ n or d_j = 0 do not occur.
3. Read off the solvability criterion: each d_i y_i = c_i is solvable in ℤ exactly when d_i divides c_i (with 0 ∣ c meaning c = 0), and the remaining rows force c_i = 0.
4. A particular solution is y₀ as in the statement; every solution is y₀ plus a vector supported on the free coordinates, so Sol(A, b) = Q y₀ + Q·(ℤ-span of e_j, j free).
5. The kernel is the case b = 0 of the same description, so ker(A) = Q·span{e_j : j free}, and since Q is unimodular the vectors Q e_j (j free) are linearly independent: they form a basis of ker(A), of rank m − s.
6. Specialise to one equation a x + b y = n (A = (a b)): with g = gcd(a, b) the criterion is g ∣ n, which is Mathlib's Int.gcd_dvd_iff, and for (a, b) ≠ (0, 0) the solution set is (x₀, y₀) + ℤ·(b/g, −a/g).

Direct prerequisites: [CA.3/smith-normal-form-of-an-integer-matrix](#CA-3-smith-normal-form-of-an-integer-matrix), `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Module.Free`, `mathlib:Matrix.mulVec`, `mathlib:Int.gcd_dvd_iff`.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Section 2.1, printed p. 16, the paragraph after Corollary 2.1.4. The criterion for b to lie in the image of A (the Z-span of its columns) and the description of the kernel are the two readings of the diagonalisation that this passage sets up; the source does not state them as a theorem about linear systems, and the proof steps carry that derivation.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Section 2.1, printed p. 17, Proposition 2.1.5 (Smith normal form). The unimodular diagonalisation used in the first proof step; the zero diagonal entries are the free coordinates of the kernel.

Proof or interface frontier: BundleintSolutionSet,IntSolvable,criterion,kernelbasis,parametrization; split all distinctdeclarations. Kernelbasisrequiresunlistedlinear-independentbasistransport/diagonalker suppliers. SourceStein17/16isderivedsupport, nottheoremaboutsystems.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-fermat-right-triangle-descent-step"></a>

### The descent step for x⁴ − y⁴ = z² with z odd

`ClassicalArithmeticCompletion:CA.4/fermat-right-triangle-descent-step` · lemma.

If x, y, z are pairwise coprime positive integers with x⁴ − y⁴ = z² and z odd, then there are pairwise coprime positive integers x′, y′, z′ with x′⁴ − y′⁴ = z′², z′ odd and x′ < x.

Hypotheses and conventions: x, y, z > 0 and pairwise coprime; z odd.

Further acceptance checks:

- The new solution again has z′ odd, so the step can be iterated; this is what makes the case split of the theorem close.
- Remark 3.11 of the source gives x = x′⁴ + y′⁴ and y = 2x′y′z′, which a formalisation can use as an alternative size measure.

Proof sketch:

1. Since z is odd and z² + y⁴ = x⁴, y is even (otherwise z² + y⁴ ≡ 2 mod 4), so (z, y², x²) is a primitive Pythagorean triple with even middle term: by Mathlib's PythagoreanTriple.coprime_classification' there are coprime k > ℓ > 0 of opposite parity with z = k² − ℓ², y² = 2kℓ, x² = k² + ℓ².
2. Then (k, ℓ, x) is again a primitive Pythagorean triple. If k is odd, apply the classification with k odd: k = a² − b², ℓ = 2ab, x = a² + b²; if ℓ is odd, ℓ = a² − b², k = 2ab, x = a² + b²; in both cases a > b > 0 are coprime of opposite parity.
3. In both cases y² = 2kℓ = 4ab(a² − b²), so (y/2)² = ab(a² − b²) with the three factors positive and pairwise coprime (from gcd(a, b) = 1 and opposite parity).
4. A product of pairwise coprime positive integers that is a square has every factor a square (Mathlib's Int.sq_of_gcd_eq_one applied twice): a = x′², b = y′², a² − b² = z′² with x′, y′, z′ > 0.
5. Then x′⁴ − y′⁴ = z′², gcd(x′, y′) = 1 because gcd(a, b) = 1, z′² = a² − b² is odd because a and b have opposite parity, and x′ ≤ x′² = a < a² + b² = x.

Direct prerequisites: `mathlib:PythagoreanTriple.coprime_classification'`, `mathlib:Int.sq_of_gcd_eq_one`.

Source: [conrad-descent-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/descent.pdf), Theorem 3.10, Case 1, printed pp. 7–8. The lemma is Case 1 of the source's proof up to the comparison x′ < x; the source then concludes by descent, which is the theorem node.

Source: [conrad-descent-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/descent.pdf), Theorem 3.10, Case 1, printed p. 8, after (3.8). The two conclusions z′ odd and x′ < x of the lemma.

Proof or interface frontier: Sourceproofspans2pages with twice Pythagoreanclassification and pairwise-coprime squarefactors. Split second-parameterization/coprimefactorstep or exact named lemmas. Correctstatement.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-fermat-right-triangle-theorem"></a>

### Fermat's right-triangle theorem: x⁴ − y⁴ = z² has no solution in positive integers

`ClassicalArithmeticCompletion:CA.4/fermat-right-triangle-theorem` · theorem.

There are no positive integers x, y, z with x⁴ − y⁴ = z². Equivalently, every integer solution of x⁴ − y⁴ = z² has y = 0 or z = 0.

Hypotheses and conventions: x, y, z positive integers (for the equivalent integral form: x, y, z ∈ ℤ, conclusion y = 0 or z = 0).

Further acceptance checks:

- No positive solution: (1, 1, 0) solves x⁴ − y⁴ = z² only with z = 0, and (5, 4, ?) does not solve it since 625 − 256 = 369 is not a square.
- The pinned Mathlib theorem not_fermat_42 treats x⁴ + y⁴ = z². This node treats x⁴ − y⁴ = z² and supplies a separate descent; no reduction to the pinned theorem is supplied.
- Consequence (Conrad, Corollary 3.12): no Pythagorean triple has a leg and the hypotenuse both squares.

Proof sketch:

1. Reduce to pairwise coprime solutions: a common prime factor p of x and y gives p⁴ ∣ z², so p² ∣ z, and (x/p, y/p, z/p²) is a smaller solution; a common factor of x and z (or y and z) is a common factor of x and y by the equation.
2. Case z odd: by strong induction on x, using the descent step (fermat-right-triangle-descent-step), which produces a solution with z′ odd and x′ < x; there is no minimal such solution.
3. Case z even: y⁴ + z² = x⁴ makes (y², z, x²) a primitive Pythagorean triple with z even, so y² = m² − n², x² = m² + n² with coprime m, n > 0 (Mathlib's PythagoreanTriple.coprime_classification'); multiplying, (xy)² = m⁴ − n⁴ with xy odd, which is a solution of Case z odd.
4. The integral form follows by taking absolute values: a solution with y ≠ 0 and z ≠ 0 has x ≠ 0 and gives a positive solution.

Direct prerequisites: [CA.4/fermat-right-triangle-descent-step](#CA-4-fermat-right-triangle-descent-step), `mathlib:PythagoreanTriple.coprime_classification'`.

Source: [conrad-descent-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/descent.pdf), Theorem 3.10, printed p. 7. The theorem in the notation and hypotheses used here.

Source: [conrad-descent-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/descent.pdf), Theorem 3.10, Case 2, printed p. 8. The reduction of the even case to the odd case, the third proof step.

Reconciled native contracts: `fermat_right_triangle_int`.

Proof or interface frontier: Separate primitive reduction/even-to-odd reduction and integralextension; node127 invokesintegralextension yetnativeonlypositive theorem. Claim neitherformalconsequenceofFermat42 is unsupported; change to no pinned reduction supplied. Integral form needed by node127 is absent from native. Remove unsupported claim that the two Fermat theorems cannot be formal consequences; distinguish their actual equations.

Revision disposition: The missing or incomplete native consequences now have checked signatures: fermat_right_triangle_int. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-4-quartic-descent-t4-plus-v4-equals-2u2"></a>

### The quartic descent T⁴ + V⁴ = 2U²

`ClassicalArithmeticCompletion:CA.4/quartic-descent-t4-plus-v4-equals-2u2` · theorem.

If T, V, U are positive integers with gcd(T, V, U) = 1 and T⁴ + V⁴ = 2U², then T = V = U = 1. Equivalently (Conrad, Corollary 3.17), every integer solution of x⁴ + y⁴ = 2z² is (x, ±x, ±x²).

Hypotheses and conventions: T, V, U > 0 and gcd(T, V, U) = 1. Under the equation this is equivalent to gcd(T, V) = 1: if g = gcd(T, V) then g⁴ ∣ 2U² forces g² ∣ U.

Further acceptance checks:

- (1, 1, 1) is a solution, and (2, 2, 4) is a solution with gcd(T, V, U) = 2, which is why the coprimality hypothesis is needed.
- Bennett–Siksek use this at the end of Case II of the proof of Proposition 6.1, where it forces λ = 1/2 and the curve to have complex multiplication by ℤ[i].
- The statement is not Fermat's equation x⁴ + y⁴ = z⁴ and does not follow from Mathlib's x⁴ + y⁴ = z² theorem: the source's 'classical descent argument' is the reduction to x⁴ − y⁴ = z² given here.

Proof sketch:

1. From gcd(T, V, U) = 1 and the equation, gcd(T, V) = 1 (the hypothesis remark); then T and V are both odd, since T⁴ + V⁴ is even and they are not both even.
2. Square the equation and subtract 4T⁴V⁴: (T⁴ − V⁴)² = (T⁴ + V⁴)² − 4T⁴V⁴ = 4(U⁴ − (TV)⁴). Hence T⁴ − V⁴ is even and W = (T⁴ − V⁴)/2 is an integer with U⁴ − (TV)⁴ = W².
3. Since U > 0 and TV > 0, the integral form of fermat-right-triangle-theorem gives W = 0.
4. So T⁴ = V⁴, hence T = V by positivity, hence T = V = 1 by coprimality, and U² = 1 gives U = 1.
5. The integral form of Corollary 3.17 follows by dividing by the fourth power of gcd(x, y) and tracking signs; y = 0 forces x = z = 0 because 2 is not a rational square.

Direct prerequisites: [CA.4/fermat-right-triangle-theorem](#CA-4-fermat-right-triangle-theorem).

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, proof of Proposition 6.1 for a ∈ A(II), Annals printed p. 372. The statement is the source's (item 81 of the paper extraction), with T0, V0, U0 renamed T, V, U; the source gives no proof and names 'a classical descent argument', supplied here from Conrad.

Source: [conrad-descent-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/descent.pdf), Corollaries 3.16 and 3.17, printed p. 9. The integral form; Conrad's proof goes through the rational points of 2y² = x⁴ + 1 and the equation y⁴ − x⁴ = ((x⁴ − 1)/2)², which is the second proof step written over ℤ.

Proof or interface frontier: Proofusesintegralversion126 missingnative, andstatementbundlesprimitive/general classification. Promote integralversion then positivesolutionroutineidentity proper.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-markoff-triples"></a>

### The Markoff surface X(R) and its nonzero locus X*(R)

`ClassicalArithmeticCompletion:CA.4/markoff-triples` · definition.

For a commutative ring R, X(R) = {x = (x₀, x₁, x₂) ∈ R³ : x₀² + x₁² + x₂² = 3x₀x₁x₂}, and X*(R) = X(R) ∖ {(0, 0, 0)}. Triples are indexed by Fin 3, so that coordinate permutations are precompositions. 'Nonzero' refers to the whole triple: individual coordinates of an element of X*(R) may vanish.

Hypotheses and conventions: R is a commutative ring; no field, characteristic or finiteness hypothesis. The coefficient is 3 (the coefficient-one equation x² + y² + z² = xyz is a different surface, related by scaling by 3 only when 3 is invertible).

API:

- `markoffSet` (data): X(R) ⊆ R³ (as Fin 3 → R), the zero set of x₀² + x₁² + x₂² − 3x₀x₁x₂.
- `markoffSetNonzero` (data): X*(R) = X(R) ∖ {0}.
- `markoffSet.mem_iff` (characterisation): x ∈ X(R) ↔ x₀² + x₁² + x₂² = 3x₀x₁x₂.
- `markoffSetNonzero.mem_iff` (characterisation): x ∈ X*(R) ↔ x ∈ X(R) ∧ x ≠ 0.
- `markoffSet.zero_mem` (simp): (0, 0, 0) ∈ X(R).
- `markoffSet.ones_mem` (simp): (1, 1, 1) ∈ X(R) for every commutative ring R.
- `markoffSet.map_mem` (functoriality): For a ring homomorphism f : R → S and x ∈ X(R), f ∘ x ∈ X(S); for f = id this is the identity and it is compatible with composition.
- `markoffSet.comp_perm_mem_iff` (relation): For σ ∈ Equiv.Perm (Fin 3): x ∘ σ⁻¹ ∈ X(R) ↔ x ∈ X(R).

Unit tests:

- `markoffSet_int_examples` (computation): (1, 1, 1), (1, 1, 2), (1, 2, 5) and (2, 5, 29) all lie in X(ℤ).
- `markoffSet_three_three_three` (non-example): (3, 3, 3) ∉ X(ℤ): 27 ≠ 81, although 27 = 27 for the coefficient-one equation x² + y² + z² = xyz.
- `zero_not_mem_markoffSetNonzero` (degenerate): (0, 0, 0) ∈ X(R) but (0, 0, 0) ∉ X*(R), for every nontrivial R.
- `markoffSetNonzero_zmod_five` (computation): (0, 1, 2) ∈ X*(𝔽₅): 0 + 1 + 4 = 5 = 0 = 3·0·1·2 in 𝔽₅, although one coordinate vanishes.
- `card_markoffSetNonzero_zmod_three` (computation): X*(𝔽₃) has exactly 8 elements.
- `card_markoffSetNonzero_zmod_two` (computation): X*(𝔽₂) has exactly 4 elements.

Further acceptance checks:

- (1, 1, 1), (1, 1, 2), (1, 2, 5) and (2, 5, 29) lie in X(ℤ); (3, 3, 3) does not (it solves the coefficient-one equation).
- Over 𝔽₃ the equation becomes x₀² + x₁² + x₂² = 0, and X*(𝔽₃) is the eight triples in {±1}³ (the regression case recorded by the review of the Martin extraction).
- Over 𝔽₂, X*(𝔽₂) = {(1, 1, 1), (0, 1, 1), (1, 0, 1), (1, 1, 0)}.

Proof sketch:

1. Define X(R) as the zero set of Φ(x) = x₀² + x₁² + x₂² − 3x₀x₁x₂ in R³ and X*(R) as its complement of the origin.
2. Functoriality: a ring homomorphism f : R → S satisfies Φ(f ∘ x) = f(Φ(x)), so f ∘ x ∈ X(S) when x ∈ X(R).
3. Permutation invariance: Φ is a symmetric polynomial, so x ∈ X(R) iff x ∘ σ⁻¹ ∈ X(R) for σ ∈ S₃.

Direct prerequisites: `mathlib:ZMod`, `mathlib:Int.castRingHom`.

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, equation (1.1), arXiv v1 p. 1 (published version p. 623). The coefficient-three equation defining X(R); the source works over ℤ and 𝔽_p and says any ring works.

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, arXiv v1 p. 1 (published version p. 623), the paragraph defining the Markoff graph. The nonzero locus X*(R) and the edges given by the moves.

Source: [bgs-markoff-2016](https://arxiv.org/pdf/1607.01530v1), §1, Conjecture 1, p. 1. The notation X(R) and X*(R) = X(R) ∖ {0}.

Proof or interface frontier: Split two set definitionsX(R),X*(R) atlemma level. Tests includingF2/F3 andzero-coordinateF5proper.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-positive-markoff-triples"></a>

### The positive Markoff triples M

`ClassicalArithmeticCompletion:CA.4/positive-markoff-triples` · definition.

M = {x ∈ X(ℤ) : x₀ > 0, x₁ > 0, x₂ > 0}, the triples of strictly positive integers with x₀² + x₁² + x₂² = 3x₀x₁x₂, kept as ordered triples (not up to permutation).

Hypotheses and conventions: Strict positivity of every coordinate; the signed integer solutions (such as (−1, −1, 1)) are not in M.

API:

- `positiveMarkoffTriples` (data): M ⊆ ℤ³ (as Fin 3 → ℤ).
- `positiveMarkoffTriples.mem_iff` (characterisation): x ∈ M ↔ x ∈ X(ℤ) ∧ ∀ i, 0 < x i.
- `positiveMarkoffTriples.subset_markoffSet` (coercion): M ⊆ X(ℤ), and in fact M ⊆ X*(ℤ).
- `positiveMarkoffTriples.comp_perm_mem_iff` (relation): For σ ∈ S₃: x ∘ σ⁻¹ ∈ M ↔ x ∈ M.
- `positiveMarkoffTriples.mem_iff_nat` (compatibility): x ∈ M ↔ ∃ a b c : ℕ, 0 < a ∧ 0 < b ∧ 0 < c ∧ a² + b² + c² = 3abc ∧ x = (a, b, c).

Unit tests:

- `positiveMarkoffTriples_examples` (computation): (1, 1, 1), (1, 1, 2), (1, 2, 5), (2, 5, 29) and (5, 13, 194) lie in M.
- `neg_neg_one_not_mem_positiveMarkoffTriples` (non-example): (−1, −1, 1) ∈ X(ℤ) but (−1, −1, 1) ∉ M.
- `zero_not_mem_positiveMarkoffTriples` (degenerate): (0, 0, 0) ∉ M.
- `one_one_three_not_mem_positiveMarkoffTriples` (non-example): (1, 1, 3) ∉ M: 11 ≠ 9.

Further acceptance checks:

- (1, 1, 1), (1, 1, 2), (1, 2, 1), (2, 1, 1), (1, 2, 5), (2, 5, 29) ∈ M.
- (−1, −1, 1) ∈ X(ℤ) ∖ M and (0, 0, 0) ∈ X(ℤ) ∖ M.

Proof sketch:

1. Define M as a subset of X(ℤ) cut out by positivity of the three coordinates.
2. The natural-number form: x ∈ M iff x = (a, b, c) with a, b, c ∈ ℕ positive and a² + b² + c² = 3abc in ℕ, since the equation has no subtraction.

Direct prerequisites: [CA.4/markoff-triples](#CA-4-markoff-triples).

Source: [bgs-markoff-2016](https://arxiv.org/pdf/1607.01530v1), §1, p. 1. The set M, the moves R_i and the coordinate permutations.

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, equation (1.1), arXiv v1 p. 1 (published version p. 623). The coefficient-three equation defining X(R); the source works over ℤ and 𝔽_p and says any ring works.

<a id="CA-4-markoff-vieta-involution"></a>

### The Vieta moves R₀, R₁, R₂ and the integer Markoff graph

`ClassicalArithmeticCompletion:CA.4/markoff-vieta-involution` · construction.

For a commutative ring R and i ∈ Fin 3, R_i : R³ → R³ replaces the i-th coordinate by 3x_{i+1}x_{i+2} − x_i and keeps the other two (indices mod 3). The integer Markoff graph is the simple graph on M in which x and y are adjacent iff x ≠ y and y = R_i x for some i.

Hypotheses and conventions: R commutative; the moves are defined on all of R³, not only on X(R). Indices are taken in Fin 3 (the source's R₁, R₂, R₃ are R₀, R₁, R₂ here).

API:

- `markoffVieta` (data): R_i : R³ → R³.
- `markoffVieta_apply_self` (simp): (R_i x)_i = 3 x_{i+1} x_{i+2} − x_i.
- `markoffVieta_apply_of_ne` (simp): (R_i x)_j = x_j for j ≠ i.
- `markoffVieta_add_self` (relation): (R_i x)_i + x_i = 3 x_{i+1} x_{i+2}.
- `markoffVieta_zero` (simp): R_i 0 = 0.
- `markoffVieta_map` (functoriality): For a ring homomorphism f : R → S, f ∘ (R_i x) = R_i (f ∘ x).
- `markoffGraph` (data): The simple graph on M with x ~ y iff x ≠ y and y = R_i x for some i.
- `markoffGraph_adj_iff` (characterisation): x ~ y in the Markoff graph ↔ x ≠ y ∧ ∃ i, R_i x = y.

Unit tests:

- `markoffVieta_two_ones` (computation): R₂(1, 1, 1) = (1, 1, 2) and R₀(1, 1, 1) = (2, 1, 1) in ℤ³.
- `markoffVieta_two_one_two_five` (non-example): R₂(1, 2, 5) = (1, 2, 1), not the sign change (1, 2, −5).
- `markoffVieta_zero_eq` (degenerate): R_i(0, 0, 0) = (0, 0, 0) for each i.
- `markoffVieta_zmod_three` (computation): Over 𝔽₃, R₂(1, 1, 1) = (1, 1, −1): the move is a sign change of one coordinate there.
- `markoffVieta_cast_compat` (compatibility): R₂ commutes with reduction modulo 7 on (2, 5, 29): R₂(2, 5, 29) = (2, 5, 1) in ℤ³, and R₂ applied to (2, 5, 29) reduced modulo 7 is (2, 5, 1) in 𝔽₇³.

Further acceptance checks:

- R₂(1, 1, 1) = (1, 1, 2), R₀(2, 1, 1) = (1, 1, 1), R₂(1, 2, 5) = (1, 2, 1).
- R_i(0) = 0 in every ring.
- The graph has no loops, since adjacency requires x ≠ y; that no move fixes a vertex of M is shown in markoff-tree.

Proof sketch:

1. Define R_i x = Function.update x i (3 · x(i + 1) · x(i + 2) − x i).
2. Evaluation: (R_i x)_i = 3x_{i+1}x_{i+2} − x_i and (R_i x)_j = x_j for j ≠ i; hence (R_i x)_i + x_i = 3x_{i+1}x_{i+2}, the sum of the two roots of the quadratic in the i-th variable.
3. Naturality: for a ring homomorphism f, f ∘ R_i x = R_i (f ∘ x), because R_i is given by an integer polynomial.
4. The graph: adjacency is the symmetrisation of y = R_i x on M, which is symmetric already by involutivity (markoff-vieta-involutive); M is preserved by markoff-vieta-preserves-positivity.

Direct prerequisites: [CA.4/markoff-triples](#CA-4-markoff-triples), `mathlib:Function.update`.

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, equation (1.2), arXiv v1 p. 1 (published version p. 623). The move R₁ and the reason it preserves the equation; R₂, R₃ are 'defined analogously'.

Source: [bgs-markoff-2016](https://arxiv.org/pdf/1607.01530v1), §1, p. 1. The set M, the moves R_i and the coordinate permutations.

Proof or interface frontier: Split Vieta map and graph; graphproof uses131involution and134positivity butboth dependon130, so separate graphnode aftermoveslemmas avoids hidden cycle.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-markoff-vieta-involutive"></a>

### The Vieta moves are involutions

`ClassicalArithmeticCompletion:CA.4/markoff-vieta-involutive` · lemma.

For every commutative ring R, every i ∈ Fin 3 and every x ∈ R³, R_i(R_i x) = x.

Hypotheses and conventions: R commutative; no hypothesis on x.

Further acceptance checks:

- In particular R_i is a bijection of R³ with inverse itself, with no field assumption.
- R₂R₂(1, 2, 5) = R₂(1, 2, 1) = (1, 2, 5).

Proof sketch:

1. Only the i-th coordinate changes, and the other two coordinates of R_i x are those of x; so (R_i(R_i x))_i = 3x_{i+1}x_{i+2} − (3x_{i+1}x_{i+2} − x_i) = x_i.

Direct prerequisites: [CA.4/markoff-vieta-involution](#CA-4-markoff-vieta-involution).

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, equation (1.2), arXiv v1 p. 1 (published version p. 623). The move R₁ and the reason it preserves the equation; R₂, R₃ are 'defined analogously'.

<a id="CA-4-markoff-vieta-preserves-equation"></a>

### The Vieta moves preserve the Markoff equation

`ClassicalArithmeticCompletion:CA.4/markoff-vieta-preserves-equation` · lemma.

For every commutative ring R, i ∈ Fin 3 and x ∈ R³: Φ(R_i x) = Φ(x), where Φ(x) = x₀² + x₁² + x₂² − 3x₀x₁x₂. In particular x ∈ X(R) ↔ R_i x ∈ X(R).

Hypotheses and conventions: R commutative.

Further acceptance checks:

- The polynomial identity holds before imposing Φ = 0, which is why it is valid over every ring.
- R₁ maps (1, 1, 2) ∈ X(ℤ) to (1, 5, 2) ∈ X(ℤ).

Proof sketch:

1. Write u = x_i and c = x_{i+1}x_{i+2}; then Φ(x) = u² − 3cu + (x_{i+1}² + x_{i+2}²) and Φ(R_i x) is the same expression at u′ = 3c − u; the quadratic t² − 3ct + e takes equal values at u and 3c − u (a polynomial identity).

Direct prerequisites: [CA.4/markoff-vieta-involution](#CA-4-markoff-vieta-involution), [CA.4/markoff-triples](#CA-4-markoff-triples).

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, equation (1.2), arXiv v1 p. 1 (published version p. 623). The move R₁ and the reason it preserves the equation; R₂, R₃ are 'defined analogously'.

<a id="CA-4-markoff-vieta-permutes-nonzero-locus"></a>

### The Vieta moves permute X*(R)

`ClassicalArithmeticCompletion:CA.4/markoff-vieta-permutes-nonzero-locus` · lemma.

For every commutative ring R and i ∈ Fin 3, R_i restricts to a bijection X*(R) → X*(R), equal to its own inverse.

Hypotheses and conventions: R commutative; no assumption that the coordinates of x are nonzero.

Further acceptance checks:

- Over 𝔽₅, R₀ maps (0, 1, 2) ∈ X*(𝔽₅) to (1, 1, 2), which is again in X*(𝔽₅).

Proof sketch:

1. R_i maps X(R) into X(R) (markoff-vieta-preserves-equation).
2. R_i(0) = 0 and R_i is injective (markoff-vieta-involutive), so R_i x = 0 only for x = 0; hence R_i maps X*(R) into X*(R).
3. Involutivity gives the inverse.

Direct prerequisites: [CA.4/markoff-vieta-involutive](#CA-4-markoff-vieta-involutive), [CA.4/markoff-vieta-preserves-equation](#CA-4-markoff-vieta-preserves-equation).

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, arXiv v1 p. 1 (published version p. 623), the paragraph defining the Markoff graph. The nonzero locus X*(R) and the edges given by the moves.

<a id="CA-4-markoff-permutation-equivariance"></a>

### Coordinate permutations normalise the Vieta moves

`ClassicalArithmeticCompletion:CA.4/markoff-permutation-equivariance` · lemma.

For σ ∈ S₃ let P_σ x = x ∘ σ⁻¹, so that (P_σ x)_{σ(i)} = x_i. Then P_σ preserves X(R), X*(R) and M, and P_σ ∘ R_i = R_{σ(i)} ∘ P_σ for every i.

Hypotheses and conventions: R commutative; the convention (P_σ x)_{σ(i)} = x_i is pinned.

Further acceptance checks:

- For the transposition σ = (0 2): P_σ R₀ = R₂ P_σ, and P_σ(1, 1, 2) = (2, 1, 1).
- The relation is the one needed to compare the Vieta group with the Bourgain–Gamburd–Sarnak group Γ generated by the moves and the permutations.

Proof sketch:

1. Φ is symmetric, so P_σ preserves X(R); P_σ fixes 0 and is bijective, so it preserves X*(R); it preserves positivity of all coordinates, so it preserves M.
2. Both sides of P_σ R_i x = R_{σ(i)} P_σ x agree at σ(i): the left gives (R_i x)_i = 3x_{i+1}x_{i+2} − x_i, and the right gives 3·x_{σ⁻¹(σ(i)+1)}x_{σ⁻¹(σ(i)+2)} − x_i, where {σ⁻¹(σ(i)+1), σ⁻¹(σ(i)+2)} = {i+1, i+2}.
3. At the other two coordinates both sides agree with P_σ x.

Direct prerequisites: [CA.4/markoff-vieta-involution](#CA-4-markoff-vieta-involution), [CA.4/positive-markoff-triples](#CA-4-positive-markoff-triples), `mathlib:Equiv.Perm`.

Source: [bgs-markoff-2016](https://arxiv.org/pdf/1607.01530v1), §1, p. 1. The set M, the moves R_i and the coordinate permutations.

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, arXiv v1 p. 1 (published version p. 623). The three moves are conjugate under the coordinate permutations, which is what the lemma makes precise (item 11 of the paper extraction).

<a id="CA-4-markoff-vieta-preserves-positivity"></a>

### The other root is positive: the moves preserve M

`ClassicalArithmeticCompletion:CA.4/markoff-vieta-preserves-positivity` · lemma.

If x ∈ M and i ∈ Fin 3, then R_i x ∈ M; moreover (R_i x)_i · x_i = x_{i+1}² + x_{i+2}² > 0.

Hypotheses and conventions: x ∈ M.

Further acceptance checks:

- R₂(1, 2, 5) = (1, 2, 1): 5 · 1 = 1² + 2².
- The statement fails for signed solutions only through the sign pattern: R_i preserves the sign pattern of x.

Proof sketch:

1. The i-th coordinate of R_i x and x_i are the two roots of t² − 3x_{i+1}x_{i+2}t + (x_{i+1}² + x_{i+2}²), so their product is x_{i+1}² + x_{i+2}² by Vieta's formulas (equivalently, by expanding with the equation).
2. Since x_i > 0 and the product is positive, (R_i x)_i > 0; the other coordinates are unchanged, and R_i x ∈ X(ℤ) by markoff-vieta-preserves-equation.

Direct prerequisites: [CA.4/markoff-vieta-preserves-equation](#CA-4-markoff-vieta-preserves-equation), [CA.4/positive-markoff-triples](#CA-4-positive-markoff-triples).

Source: [zhang-markoff-congruence-2006](https://arxiv.org/pdf/math/0612620v2), §1, p. 1. Positivity of the other root.

<a id="CA-4-markoff-descent-inequality"></a>

### The descent inequality for positive Markoff triples

`ClassicalArithmeticCompletion:CA.4/markoff-descent-inequality` · lemma.

Let 1 ≤ a ≤ b ≤ c be integers with a² + b² + c² = 3abc and (a, b, c) ≠ (1, 1, 1). Then c′ = 3ab − c satisfies 0 < c′ ≤ b and c′ < c, with c′ = b only for (a, b, c) = (1, 1, 2). Moreover b < c, so c is the unique largest coordinate, and the other two moves strictly increase the largest coordinate: 3bc − a > c and 3ac − b > c.

Hypotheses and conventions: (a, b, c) ordered increasingly, positive, not (1, 1, 1).

Further acceptance checks:

- For (1, 2, 5): c′ = 1 < 2 = b; for (2, 5, 29): c′ = 1 < 5; for (1, 1, 2): c′ = 1 = b.
- Every nonroot ordered positive triple therefore has exactly one descending move, in its unique largest coordinate (item 9 of the paper extraction).

Proof sketch:

1. Let q(t) = t² − 3abt + a² + b², whose roots are c and c′ = 3ab − c; c′ > 0 by markoff-vieta-preserves-positivity.
2. q(b) = a² + (2 − 3a)b² ≤ a² − b² ≤ 0, with equality iff a = b = 1; in that case c² − 3c + 2 = 0 gives c ∈ {1, 2}, so (a, b, c) = (1, 1, 2), c′ = 1 = b.
3. Otherwise q(b) < 0, so b lies strictly between the roots; as c ≥ b, c is the larger root and c′ < b < c.
4. If b = c then q(b) = 0, which forces (1, 1, 1) or c = 2 ≠ b; hence b < c in all cases considered.
5. For the other moves: 3bc − a ≥ 3c − a > c and 3ac − b ≥ 3c − b > c, since a, b < 2c.

Direct prerequisites: [CA.4/markoff-vieta-preserves-positivity](#CA-4-markoff-vieta-preserves-positivity).

Source: [zhang-markoff-congruence-2006](https://arxiv.org/pdf/math/0612620v2), §1, p. 2, the paragraph after Theorem A. The descent inequality in the nonsingular case.

Source: [zhang-markoff-uniqueness-2006](https://arxiv.org/pdf/math/0606283v1), §3, proof of the Markoff Theorem, p. 2. The size measure used for the descent; the lemma records the inequality in the form the tree argument needs.

<a id="CA-4-markoff-root-generation"></a>

### Markoff's theorem: every positive Markoff triple comes from (1, 1, 1)

`ClassicalArithmeticCompletion:CA.4/markoff-root-generation` · theorem.

Every x ∈ M is obtained from (1, 1, 1) by a finite word in the moves R₀, R₁, R₂: there are i₁, …, i_k ∈ Fin 3 with x = R_{i₁} ⋯ R_{i_k}(1, 1, 1). No coordinate permutation is needed.

Hypotheses and conventions: x ∈ M.

Further acceptance checks:

- (2, 5, 29) = R₂ R₁ R₀ (1, 1, 1): R₀(1, 1, 1) = (2, 1, 1), R₁(2, 1, 1) = (2, 5, 1), R₂(2, 5, 1) = (2, 5, 29).
- Consequently M is the orbit of (1, 1, 1) under the group generated by the moves, and a fortiori under Γ (Bourgain–Gamburd–Sarnak).

Proof sketch:

1. Strong induction on the largest coordinate max(x).
2. If x = (1, 1, 1) take the empty word.
3. Otherwise let i be the position of the unique largest coordinate (markoff-descent-inequality applied to the increasing rearrangement of x); R_i x ∈ M has smaller largest coordinate, so R_i x is a word applied to (1, 1, 1), and x = R_i(R_i x) by markoff-vieta-involutive.

Direct prerequisites: [CA.4/markoff-descent-inequality](#CA-4-markoff-descent-inequality), [CA.4/markoff-vieta-involutive](#CA-4-markoff-vieta-involutive).

Source: [zhang-markoff-congruence-2006](https://arxiv.org/pdf/math/0612620v2), §1, Theorem A, p. 2. Markoff's theorem, in the source's form with the coordinates rearranged in ascending order before each step.

Source: [zhang-markoff-uniqueness-2006](https://arxiv.org/pdf/math/0606283v1), §3, p. 2. The same theorem with a complete two-line proof; the ordered-triple form here removes the rearrangements by moving in the position of the largest coordinate.

Source: [bgs-markoff-2016](https://arxiv.org/pdf/1607.01530v1), §1, p. 1. The set M, the moves R_i and the coordinate permutations.

<a id="CA-4-markoff-tree"></a>

### The positive Markoff graph is a tree rooted at (1, 1, 1)

`ClassicalArithmeticCompletion:CA.4/markoff-tree` · theorem.

The integer Markoff graph (vertices M, x adjacent to y iff x ≠ y and y = R_i x for some i) is a tree. Every vertex has degree exactly 3, and every vertex other than (1, 1, 1) has exactly one neighbour with smaller largest coordinate.

Hypotheses and conventions: Vertices are ordered positive triples; the statement is false for the signed nonzero integer solutions, whose graph is a disjoint union of four copies of this tree (one for each sign pattern with product +1).

Further acceptance checks:

- The three neighbours of (1, 1, 1) are (2, 1, 1), (1, 2, 1), (1, 1, 2); the neighbours of (1, 1, 2) are (1, 1, 1), (5, 1, 2), (1, 5, 2).
- This is the positive-triple form of the statement the source attributes to Markoff; the finite-field graphs G_p of the Part II are not trees.

Proof sketch:

1. Connected: by markoff-root-generation every vertex is joined to (1, 1, 1) by the path of successive words.
2. Degree 3: the three moves change three different coordinates, and no move fixes a vertex of M ((R_i x)_i = x_i would give 2x_i = 3x_{i+1}x_{i+2} and x_i² = x_{i+1}² + x_{i+2}², hence 9x_{i+1}²x_{i+2}² = 4(x_{i+1}² + x_{i+2}²), impossible for positive integers).
3. Height function h(x) = max(x): along every edge h changes (a move changes one coordinate to a different value and the descent inequality compares the maxima), and every vertex x ≠ (1, 1, 1) has exactly one neighbour with smaller h (markoff-descent-inequality: the move in the unique largest coordinate decreases h, the other two increase it; for the permutations of (1, 1, 2) the descending neighbour is (1, 1, 1)).
4. Acyclic: in a cycle, a vertex of maximal h has two distinct neighbours on the cycle with smaller h, contradicting uniqueness of the descending neighbour; so the graph is a tree (Mathlib's SimpleGraph.IsTree: connected and acyclic).

Direct prerequisites: [CA.4/markoff-root-generation](#CA-4-markoff-root-generation), [CA.4/markoff-descent-inequality](#CA-4-markoff-descent-inequality), [CA.4/markoff-vieta-involution](#CA-4-markoff-vieta-involution), `mathlib:SimpleGraph.IsTree`, `mathlib:SimpleGraph.Connected`, `mathlib:SimpleGraph.IsAcyclic`.

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, arXiv v1 p. 1 (published version p. 623). The tree statement, which holds for the positive solutions M (see sourceIssue ClassicalArithmeticCompletion/E501 for the restriction).

Source: [zhang-markoff-uniqueness-2006](https://arxiv.org/pdf/math/0606283v1), §3, p. 2, after the proof of the Markoff Theorem. The tree up to permutation; the ordered form, with degree 3 at every vertex including the root, is the statement planned here.

Proof or interface frontier: Degree-three and unique-parent assertions absent from native; promote separate graph lemmas. Height-cycle argument needs an explicit supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-markoff-triple-coordinates-coprime"></a>

### The coordinates of a positive Markoff triple are pairwise coprime

`ClassicalArithmeticCompletion:CA.4/markoff-triple-coordinates-coprime` · lemma.

If (a, b, c) ∈ M then gcd(a, b) = gcd(b, c) = gcd(a, c) = 1.

Hypotheses and conventions: (a, b, c) ∈ M.

Further acceptance checks:

- (5, 13, 194): gcd(5, 13) = gcd(13, 194) = gcd(5, 194) = 1.
- Consequently no prime divides all three coordinates, so the reduction of x ∈ M modulo a prime p is never (0, 0, 0).

Proof sketch:

1. Under the third Vieta involution c′ = 3ab − c, gcd(a,c′)=gcd(a,c) and gcd(b,c′)=gcd(b,c), by invariance of gcd under adding a multiple and under negation; gcd(a,b) is unchanged. The other coordinate involutions follow by permutation. Prove this pairwise-gcd preservation as a separate lemma; a prime-support argument alone does not establish equality of gcd exponents.
2. Induct on the Vieta word supplied by markoff-root-generation. At (1,1,1) all three pairwise gcds are 1, and each move preserves them.

Direct prerequisites: [CA.4/markoff-root-generation](#CA-4-markoff-root-generation).

Source: [zhang-markoff-congruence-2006](https://arxiv.org/pdf/math/0612620v2), §1, Theorem B and its proof, p. 2. Theorem B(a). Replace the source’s compressed prime-divisibility argument by pairwise-gcd preservation under each Vieta move and induction on a root-generation word.

Reconciled native contracts: `markoffVieta_pairwise_gcd`.

Proof or interface frontier: Prime support does not establish equality of gcd exponents. Prove preservation of every pairwise gcd under Vieta involutions, then root-word induction.

Revision disposition: The missing or incomplete native consequences now have checked signatures: markoffVieta_pairwise_gcd. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-4-markoff-reduction-mod-p"></a>

### Reduction of Markoff triples modulo p

`ClassicalArithmeticCompletion:CA.4/markoff-reduction-mod-p` · construction.

For a natural number p, red_p : ℤ³ → (ℤ/pℤ)³ is coordinatewise reduction. It maps X(ℤ) into X(ℤ/pℤ), commutes with every move R_i and every coordinate permutation P_σ, sends (1, 1, 1) to (1, 1, 1), and for p prime it maps M into X*(𝔽_p).

Hypotheses and conventions: p ≥ 2 for the last clause (for p = 1 the ring is trivial and X*(ℤ/1ℤ) is empty); the first clauses hold for every p.

API:

- `markoffReduce` (data): red_p : (Fin 3 → ℤ) → (Fin 3 → ZMod p), coordinatewise reduction.
- `markoffReduce_apply` (simp): red_p x i = (x i : ZMod p).
- `markoffReduce_mem_markoffSet` (functoriality): x ∈ X(ℤ) → red_p x ∈ X(ℤ/pℤ).
- `markoffReduce_markoffVieta` (compatibility): red_p (R_i x) = R_i (red_p x).
- `markoffReduce_comp_perm` (compatibility): red_p (x ∘ σ⁻¹) = (red_p x) ∘ σ⁻¹.
- `markoffReduce_ones` (simp): red_p (1, 1, 1) = (1, 1, 1).
- `markoffReduce_mem_markoffSetNonzero` (other): For p prime and x ∈ M, red_p x ∈ X*(𝔽_p).

Unit tests:

- `markoffReduce_two_five_twentynine_two` (computation): red₂(2, 5, 29) = (0, 1, 1).
- `markoffReduce_one_two_five_five` (computation): red₅(1, 2, 5) = (1, 2, 0), which is a nonzero element of X(𝔽₅).
- `markoffReduce_three_eq_neg_ones` (computation): red₃(2, 5, 29) = (−1, −1, −1) in 𝔽₃³.
- `markoffReduce_one_trivial` (degenerate): For p = 1 every reduction is (0, 0, 0), so the prime hypothesis of markoffReduce_mem_markoffSetNonzero cannot be dropped.
- `markoffReduce_vieta_compat` (compatibility): red₇(R₁(2, 1, 1)) = R₁(red₇(2, 1, 1)) = (2, 5, 1) in 𝔽₇³.

Further acceptance checks:

- red₂(2, 5, 29) = (0, 1, 1); red₃(2, 5, 29) = (−1, −1, −1); red₅(1, 2, 5) = (1, 2, 0) ∈ X*(𝔽₅).
- red₂ R₂ (1, 1, 1) = R₂ red₂ (1, 1, 1) = (1, 1, 0).

Proof sketch:

1. red_p = (Int.castRingHom (ZMod p)) ∘ −; the first clause is functoriality of X (markoff-triples), the commutation with moves is naturality of R_i (markoff-vieta-involution), and the commutation with permutations is immediate.
2. Nonzero image for p prime: by markoff-triple-coordinates-coprime no prime divides all coordinates of x ∈ M, so red_p x ≠ 0; alternatively, by markoff-root-generation x is a word applied to (1, 1, 1), red_p x is the same word applied to (1, 1, 1) ∈ X*(𝔽_p), and the moves preserve X*(𝔽_p) (markoff-vieta-permutes-nonzero-locus).
3. Reduction may collapse an edge: distinct neighbours in M can reduce to the same triple, and R_i may fix a triple modulo p.

Direct prerequisites: [CA.4/markoff-triples](#CA-4-markoff-triples), [CA.4/markoff-vieta-involution](#CA-4-markoff-vieta-involution), [CA.4/markoff-triple-coordinates-coprime](#CA-4-markoff-triple-coordinates-coprime), [CA.4/markoff-vieta-permutes-nonzero-locus](#CA-4-markoff-vieta-permutes-nonzero-locus), [CA.4/markoff-permutation-equivariance](#CA-4-markoff-permutation-equivariance), `mathlib:Int.castRingHom`, `mathlib:ZMod`.

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, arXiv v1 p. 1 (published version p. 623). The reduction map and the lifting question; the node adds the commutation with the moves that the graph comparison uses (item 12 of the paper extraction).

Source: [bgs-markoff-2016](https://arxiv.org/pdf/1607.01530v1), §1, pp. 1–2. Descent of the moves and permutations to the reduction, which is the commutation clause.

<a id="CA-4-markoff-strong-approximation"></a>

### Strong approximation for positive Markoff triples at a prime

`ClassicalArithmeticCompletion:CA.4/markoff-strong-approximation` · definition.

For a prime p, strong approximation holds at p if the reduction red_p : M → X*(𝔽_p) is surjective: every nonzero solution of x₀² + x₁² + x₂² = 3x₀x₁x₂ over 𝔽_p lifts to a positive Markoff triple. Only the definition is planned here; the theorems about it (Bourgain–Gamburd–Sarnak, Chen, Martin) belong to the ArithmeticDynamics Part II.

Hypotheses and conventions: p prime; the target is X*(𝔽_p), not X(𝔽_p): the origin is never the reduction of an element of M.

API:

- `MarkoffStrongApproximation` (data): The predicate Set.SurjOn red_p M X*(𝔽_p).
- `markoffStrongApproximation_iff` (characterisation): MarkoffStrongApproximation p ↔ ∀ y ∈ X*(𝔽_p), ∃ x ∈ M, red_p x = y.
- `markoffStrongApproximation_iff_orbit` (characterisation): MarkoffStrongApproximation p ↔ every y ∈ X*(𝔽_p) is a word in the moves applied to (1, 1, 1) ∈ 𝔽_p³.
- `not_surjOn_markoffReduce_markoffSet` (other): red_p never maps M onto X(𝔽_p), because (0, 0, 0) has no preimage.

Unit tests:

- `markoffStrongApproximation_two` (computation): Strong approximation holds at p = 2: X*(𝔽₂) consists of the reductions of (1, 1, 1), (2, 1, 1), (1, 2, 1), (1, 1, 2).
- `markoffStrongApproximation_three` (computation): Strong approximation holds at p = 3: each of the eight elements of {±1}³ is the reduction of a word in the moves applied to (1, 1, 1).
- `not_surjOn_markoffSet_zmod_five` (non-example): The reduction M → X(𝔽₅) (with the origin) is not surjective.
- `markoffStrongApproximation_iff_compat` (compatibility): MarkoffStrongApproximation p unfolds to Mathlib's Set.SurjOn (markoffReduce p) M X*(𝔽_p).

Further acceptance checks:

- Strong approximation holds at p = 2 and p = 3 (by the lifts in the tests).
- Surjectivity onto X(𝔽_p) always fails, since (0, 0, 0) is not a reduction of M.

Proof sketch:

1. Define the predicate as surjectivity of red_p from M onto X*(𝔽_p) (Set.SurjOn).
2. Equivalent orbit form: by markoff-root-generation and the commutation of red_p with the moves, the image of M is the orbit of (1, 1, 1) under the group generated by the moves acting on X*(𝔽_p); so strong approximation at p holds iff that orbit is all of X*(𝔽_p).

Direct prerequisites: [CA.4/markoff-reduction-mod-p](#CA-4-markoff-reduction-mod-p), [CA.4/markoff-root-generation](#CA-4-markoff-root-generation).

Source: [bgs-markoff-2016](https://arxiv.org/pdf/1607.01530v1), §1, pp. 1–2, after Conjecture 1. The definition is the first of these two forms, for a single prime (item 13 of the paper extraction).

Source: [martin-markoff-2025](https://arxiv.org/pdf/2502.15960v1), §1, arXiv v1 p. 1 (published version p. 623). The orbit form: surjectivity of reduction is equivalent to connectedness of the orbit of the image of (1, 1, 1).

<a id="CA-4-three-squares-necessary-condition"></a>

### Integers of the form 4ᵃ(8b + 7) are not sums of three squares

`ClassicalArithmeticCompletion:CA.4/three-squares-necessary-condition` · lemma.

If n = 4ᵃ(8b + 7) with a, b ∈ ℕ, then there are no integers x, y, z with x² + y² + z² = n.

Hypotheses and conventions: a, b ∈ ℕ.

Further acceptance checks:

- 7, 15, 23, 28 = 4·7 and 60 = 4·15 are not sums of three squares; 12 = 4·3 is (2² + 2² + 2²).

Proof sketch:

1. Squares are ≡ 0, 1 or 4 (mod 8), so a sum of three squares is never ≡ 7 (mod 8): this is the case a = 0.
2. Squares are ≡ 0 or 1 (mod 4), so x² + y² + z² ≡ 0 (mod 4) forces x, y, z all even; then (x/2)² + (y/2)² + (z/2)² = 4^{a−1}(8b + 7), and induction on a finishes.

Direct prerequisites: .

Source: [sun-three-squares-2017](http://maths.nju.edu.cn/~zwsun/Three-Square-Theorem.pdf), §1, p. 1, the proof of the only-if direction. The two proof steps, with the argument restated here.

<a id="CA-4-three-squares-squarefree-reduction"></a>

### Reduction of the three-square theorem to squarefree m ≢ 7 (mod 8)

`ClassicalArithmeticCompletion:CA.4/three-squares-squarefree-reduction` · lemma.

If n ≥ 1 is not of the form 4ᵃ(8b + 7), then n = 4ᵃ k² m with a ∈ ℕ, k odd and m squarefree with m mod 8 ∈ {1, 2, 3, 5, 6}. Consequently, if every squarefree m with m mod 8 ∈ {1, 2, 3, 5, 6} is a sum of three squares, so is every such n.

Hypotheses and conventions: n ≥ 1 not of the form 4ᵃ(8b + 7).

Further acceptance checks:

- n = 72 = 4·18 = 4·3²·2: a = 1, k = 3, m = 2.
- n = 28 is excluded; n = 44 = 4·11 gives m = 11 ≡ 3 (mod 8).

Proof sketch:

1. Write n = 4ᵃ n′ with 4 ∤ n′; then n′ is not ≡ 7 (mod 8).
2. Write n′ = k² m with m squarefree (Mathlib's Nat.sq_mul_squarefree_of_pos). If k were even, 4 would divide n′; so k is odd, k² ≡ 1 (mod 8) and m ≡ n′ (mod 8).
3. m is squarefree, so 4 ∤ m, and m ≢ 7 (mod 8): hence m mod 8 ∈ {1, 2, 3, 5, 6}.
4. A representation m = x² + y² + z² gives n = (2ᵃkx)² + (2ᵃky)² + (2ᵃkz)².

Direct prerequisites: `mathlib:Nat.sq_mul_squarefree_of_pos`, `mathlib:Squarefree`.

Source: [ankeny-three-squares-1957](https://www.ams.org/journals/proc/1957-008-02/S0002-9939-1957-0085275-8/S0002-9939-1957-0085275-8.pdf), Introduction, p. 316. The reduction the source asserts; the proof steps supply the argument that removing an odd square factor preserves the class modulo 8.

<a id="CA-4-three-squares-auxiliary-prime"></a>

### Ankeny's auxiliary prime

`ClassicalArithmeticCompletion:CA.4/three-squares-auxiliary-prime` · lemma.

Let m be a squarefree positive integer with m mod 8 ∈ {1, 2, 3, 5, 6}. Then there is a prime q ≡ 1 (mod 4) such that: (a) if m ≡ 3 (mod 8), the Jacobi symbol (−2q/p) = 1 for every prime p ∣ m; (b) otherwise (−q/p) = 1 for every odd prime p ∣ m, and, if m = 2m₁ is even, (−2/q) = (−1)^{(m₁−1)/2}. In both cases the Jacobi symbol (−m/q) = 1, so −m is a quadratic residue modulo q.

Hypotheses and conventions: m squarefree, m ≥ 1, m mod 8 ∈ {1, 2, 3, 5, 6}.

Further acceptance checks:

- m = 3: the conditions say q ≡ 1 (mod 12). q = 13 works, and (−3/13) = 1 since 6² ≡ −3 (mod 13); q = 5 fails, since (−10/3) = (2/3) = −1.
- m = 1: the conditions are vacuous apart from q ≡ 1 (mod 4), and (−1/q) = 1.

Proof sketch:

1. Each condition on q is a condition on q modulo 4 or 8 and modulo the odd primes p ∣ m, and each is satisfied by a nonempty set of residue classes prime to p (half of the nonzero classes modulo p satisfy (−2r/p) = 1, respectively (−r/p) = 1, and (−2/q) is fixed by q mod 8); by the Chinese remainder theorem these conditions define a nonempty set of unit residue classes modulo 8m.
2. Dirichlet's theorem on primes in arithmetic progressions (Mathlib's Nat.forall_exists_prime_gt_and_eq_mod) gives a prime q in such a class, which may be taken larger than m so that q ∤ m.
3. Case (a): 1 = ∏_{p∣m}(−2q/p) = (−2/m)∏(q/p) = (−2/m)∏(p/q) = (−2/m)(m/q) = (−2/m)(−m/q) = (−m/q), using quadratic reciprocity for q ≡ 1 (mod 4) (Mathlib's jacobiSym.quadratic_reciprocity_one_mod_four), (−1/q) = 1, and (−2/m) = 1 for m ≡ 3 (mod 8) (jacobiSym.at_neg_two).
4. Case (b): (q/p) = (−1/p) for odd p ∣ m, so ∏_{p odd}(p/q) = (−1/m_odd) = (−1)^{(m_odd−1)/2} by reciprocity and jacobiSym.at_neg_one; for m odd this gives (−m/q) = (m/q) = (−1)^{(m−1)/2} = 1 as m ≡ 1 (mod 4); for m = 2m₁ it gives (−m/q) = (2/q)(−1)^{(m₁−1)/2} = 1 because (2/q) = (−2/q) for q ≡ 1 (mod 4).

Direct prerequisites: `mathlib:Nat.forall_exists_prime_gt_and_eq_mod`, `mathlib:jacobiSym`, `mathlib:jacobiSym.quadratic_reciprocity_one_mod_four`, `mathlib:jacobiSym.at_neg_one`, `mathlib:jacobiSym.at_neg_two`, `mathlib:jacobiSym.at_two`.

Source: [ankeny-three-squares-1957](https://www.ams.org/journals/proc/1957-008-02/S0002-9939-1957-0085275-8/S0002-9939-1957-0085275-8.pdf), §1, conditions (1)–(2) and computation (3), pp. 316–317. Case (a) and its proof.

Source: [ankeny-three-squares-1957](https://www.ams.org/journals/proc/1957-008-02/S0002-9939-1957-0085275-8/S0002-9939-1957-0085275-8.pdf), §2, p. 319. Case (b); the source outlines it (sourceIssue ClassicalArithmeticCompletion/E502) and the last proof step supplies the computation of (−m/q).

Proof or interface frontier: Split CRT auxiliary-prime construction from quadratic-reciprocity verification and provide residue-character surjectivity/CRT suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-three-squares-lattice-point"></a>

### The Minkowski step in Ankeny's proof

`ClassicalArithmeticCompletion:CA.4/three-squares-lattice-point` · lemma.

Let m and q be as in three-squares-auxiliary-prime. (a) If m ≡ 3 (mod 8), there are integers b (odd) and h with b² − 4qh = −m, and integers R, x, y such that R² + 2v = m for v = qx² + bxy + hy²; moreover 4qv = (2qx + by)² + my². (b) Otherwise there are integers b, h with b² − qh = −m and integers R, x, y such that R² + v = m for v = qx² + 2bxy + hy²; moreover qv = (qx + by)² + my². In both cases v ≥ 0.

Hypotheses and conventions: m, q as in the auxiliary prime lemma.

Further acceptance checks:

- For m = 3, q = 13: b = 7 (odd, 49 + 3 = 52 = 4·13·1, so h = 1) and t = 1 (t² ≡ −1/26 ≡ 1 mod 3); the lattice point (x, y, z) = (0, 1, −2) gives R = 1, v = 13·0 + 7·0 + 1 = 1 and R² + S² + T² = 3 < 6, so R² + 2v = 3 = m.
- The body has volume (4π/3)2^{3/2} ≈ 11.85 > 8 = 2³, the Minkowski threshold in dimension 3.

Proof sketch:

1. Choose b with b² ≡ −m (mod q) (possible since (−m/q) = 1), odd in case (a); set h₁ = (b² + m)/q. In case (a), reducing modulo 4 with b odd, q ≡ 1 (mod 4) and m ≡ 3 (mod 8) gives 4 ∣ h₁; put h = h₁/4. In case (b) put h = h₁.
2. Choose t with t² ≡ −1/(2q) (mod m) in case (a) (possible by (−2q/p) = 1 for p ∣ m and the Chinese remainder theorem), respectively t odd with t² ≡ −1/q (mod p) for odd p ∣ m in case (b).
3. Case (a): R = 2tqx + tby + mz, S = (2q)^{1/2}x + b(2q)^{−1/2}y, T = m^{1/2}(2q)^{−1/2}y. This linear map ℤ³ → ℝ³ has determinant m^{3/2}; the ball R² + S² + T² < 2m has volume (4π/3)(2m)^{3/2}, so its preimage is a convex symmetric body of volume (4π/3)·2^{3/2} > 8. By Minkowski's convex body theorem (Mathlib's MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure, with the volume from InnerProductSpace.volume_ball and MeasureTheory.Measure.addHaar_image_linearMap) there is a nonzero (x, y, z) ∈ ℤ³ with R² + S² + T² < 2m. Case (b): the same with R = tqx + tby + mz, S = q^{1/2}x + bq^{−1/2}y, T = m^{1/2}q^{−1/2}y.
4. Algebra: S² + T² = 2v in case (a) and = v in case (b), because b² + m = 4qh (resp. qh); and 4qv = (2qx + by)² + my² (resp. qv = (qx + by)² + my²).
5. Congruence: R ≡ t(2qx + by) (mod m) gives R² + 2v ≡ −(2qx + by)²/(2q) + (2qx + by)²/(2q) ≡ 0 (mod m) in case (a); in case (b) the same computation modulo each odd p ∣ m, and modulo 2 when m is even: with t odd, R² + v ≡ 0 (mod 2) whether b is odd or even.
6. So m ∣ R² + 2v (resp. R² + v); this number is positive because the triangular transformation is nondegenerate and (x, y, z) ≠ 0, and it is less than 2m; hence it equals m.

Direct prerequisites: [CA.4/three-squares-auxiliary-prime](#CA-4-three-squares-auxiliary-prime), `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `mathlib:InnerProductSpace.volume_ball`, `mathlib:MeasureTheory.Measure.addHaar_image_linearMap`.

Source: [ankeny-three-squares-1957](https://www.ams.org/journals/proc/1957-008-02/S0002-9939-1957-0085275-8/S0002-9939-1957-0085275-8.pdf), §1, equations (4)–(12), pp. 317–318. The volume computation of the third proof step, case (a).

Source: [ankeny-three-squares-1957](https://www.ams.org/journals/proc/1957-008-02/S0002-9939-1957-0085275-8/S0002-9939-1957-0085275-8.pdf), §1, equation (12), p. 318. The conclusion of case (a); case (b) is the source's §2, whose details are supplied in the proof steps (sourceIssues E502, E503).

Proof or interface frontier: Two-page Minkowski proof and second residue case need separate determinant, congruence and lattice-existence lemmas.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-three-squares-remainder-sum-of-two-squares"></a>

### The remainder in Ankeny's proof is a sum of two squares

`ClassicalArithmeticCompletion:CA.4/three-squares-remainder-sum-of-two-squares` · lemma.

In the situation of three-squares-lattice-point, every odd prime p that divides v to an odd power satisfies p ≡ 1 (mod 4). Hence 2v (case m ≡ 3 mod 8), respectively v (other cases), is a sum of two squares of integers.

Hypotheses and conventions: m, q, b, h, R, x, y as in three-squares-lattice-point.

Further acceptance checks:

- In the example m = 3, q = 13 of the previous lemma, 2v = 2 = 1² + 1², and 3 = 1² + 1² + 1².
- The argument never needs p = 2, which is harmless for sums of two squares.

Proof sketch:

1. Let p be odd with v_p(v) odd. If p ∤ m: from R² + 2v = m (resp. R² + v = m), R² ≡ m (mod p), so (m/p) = 1.
2. Still p ∤ m: if p = q, then (−m/q) = 1 by the choice of b. If p ≠ q, p divides X² + mY² = 4qv (resp. qv) to an odd power, with X = 2qx + by (resp. qx + by), Y = y; dividing out p² while p divides both X and Y (then p² divides the sum) leaves p ∤ Y with p ∣ X² + mY², so (−m/p) = 1.
3. From (m/p) = (−m/p) = 1, (−1/p) = 1, i.e. p ≡ 1 (mod 4).
4. If p ∣ m: from R² + 2v = m, p ∣ R, and dividing R² + (1/2q)((2qx + by)² + my²) = m (resp. R² + (1/q)((qx + by)² + my²) = m) shows p ∣ 2qx + by (resp. qx + by); since m is squarefree, dividing by p gives y² ≡ 2q (mod p) (resp. y² ≡ q), so (2q/p) = 1 (resp. (q/p) = 1) unless p ∣ y, which would force p ∣ q; combined with (−2q/p) = 1 (resp. (−q/p) = 1) this gives (−1/p) = 1.
5. So the exponent of every prime ≡ 3 (mod 4) in v (and in 2v) is even, and Mathlib's Nat.eq_sq_add_sq_iff gives the representation as a sum of two squares.

Direct prerequisites: [CA.4/three-squares-lattice-point](#CA-4-three-squares-lattice-point), [CA.4/three-squares-auxiliary-prime](#CA-4-three-squares-auxiliary-prime), `mathlib:Nat.eq_sq_add_sq_iff`, `mathlib:jacobiSym`.

Source: [ankeny-three-squares-1957](https://www.ams.org/journals/proc/1957-008-02/S0002-9939-1957-0085275-8/S0002-9939-1957-0085275-8.pdf), §1, equations (13)–(16), p. 318. The first two proof steps.

Source: [ankeny-three-squares-1957](https://www.ams.org/journals/proc/1957-008-02/S0002-9939-1957-0085275-8/S0002-9939-1957-0085275-8.pdf), §1, after (17), p. 319. The conclusion of the lemma in case (a).

Proof or interface frontier: Split valuation arguments for primes dividing m and not dividing m, including q; explicit division by p² induction needed.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-three-squares-squarefree-case"></a>

### Squarefree m ≢ 7 (mod 8) is a sum of three squares

`ClassicalArithmeticCompletion:CA.4/three-squares-squarefree-case` · lemma.

Every squarefree positive integer m with m mod 8 ∈ {1, 2, 3, 5, 6} is a sum of three squares of integers.

Hypotheses and conventions: m squarefree, m ≥ 1, m mod 8 ∈ {1, 2, 3, 5, 6}.

Further acceptance checks:

- m = 3 = 1 + 1 + 1, m = 6 = 4 + 1 + 1, m = 10 = 9 + 1 + 0, m = 11 = 9 + 1 + 1; m = 7 is excluded.

Proof sketch:

1. Take q from three-squares-auxiliary-prime, then R, x, y from three-squares-lattice-point, with R² + 2v = m (case m ≡ 3 mod 8) or R² + v = m (otherwise).
2. By three-squares-remainder-sum-of-two-squares, 2v (respectively v) = s² + u², so m = R² + s² + u².

Direct prerequisites: [CA.4/three-squares-auxiliary-prime](#CA-4-three-squares-auxiliary-prime), [CA.4/three-squares-lattice-point](#CA-4-three-squares-lattice-point), [CA.4/three-squares-remainder-sum-of-two-squares](#CA-4-three-squares-remainder-sum-of-two-squares).

Source: [ankeny-three-squares-1957](https://www.ams.org/journals/proc/1957-008-02/S0002-9939-1957-0085275-8/S0002-9939-1957-0085275-8.pdf), §2, p. 319. The squarefree case of Theorem 1, assembled from §1 and §2.

<a id="CA-4-legendre-three-square-theorem"></a>

### Legendre's three-square theorem

`ClassicalArithmeticCompletion:CA.4/legendre-three-square-theorem` · theorem.

A natural number n is a sum of three squares of integers if and only if n is not of the form 4ᵃ(8b + 7) with a, b ∈ ℕ.

Hypotheses and conventions: n ∈ ℕ; squares of integers (equivalently of natural numbers).

Further acceptance checks:

- 7, 15, 23, 28, 31, 39, 47, 55, 60, 63 are the numbers below 64 that are not sums of three squares.
- Every n ≡ 3 (mod 8) is a sum of three odd squares (a consequence of the theorem and the parity of squares), e.g. 11 = 9 + 1 + 1.
- The theorem is not in Mathlib or Tau Ceti; Mathlib has the two-square characterisation (Nat.eq_sq_add_sq_iff) and the four-square theorem (Nat.sum_four_squares).

Proof sketch:

1. Only if: three-squares-necessary-condition.
2. If: n = 0 is 0² + 0² + 0²; for n ≥ 1, three-squares-squarefree-reduction reduces to squarefree m with m mod 8 ∈ {1, 2, 3, 5, 6}, which is three-squares-squarefree-case.

Direct prerequisites: [CA.4/three-squares-necessary-condition](#CA-4-three-squares-necessary-condition), [CA.4/three-squares-squarefree-reduction](#CA-4-three-squares-squarefree-reduction), [CA.4/three-squares-squarefree-case](#CA-4-three-squares-squarefree-case).

Source: [ankeny-three-squares-1957](https://www.ams.org/journals/proc/1957-008-02/S0002-9939-1957-0085275-8/S0002-9939-1957-0085275-8.pdf), Introduction, Theorem 1, p. 316. Legendre's theorem, the sufficiency direction.

Source: [sun-three-squares-2017](http://maths.nju.edu.cn/~zwsun/Three-Square-Theorem.pdf), §1, p. 1. The statement in the form planned, including n = 0.

<a id="CA-4-sum-of-squares-representation-count"></a>

### The representation numbers r_k(n)

`ClassicalArithmeticCompletion:CA.4/sum-of-squares-representation-count` · definition.

For k, n ∈ ℕ, r_k(n) is the number of x ∈ ℤᵏ with x₁² + ⋯ + x_k² = n, counting order and signs. It is finite, since every coordinate satisfies |x_i| ≤ √n.

Hypotheses and conventions: Ordered representations with signs, including zero coordinates.

API:

- `sumSquaresCount` (data): r_k(n) = Nat.card {x : Fin k → ℤ // ∑ i, x i ^ 2 = n}.
- `sumSquaresCount_finite` (other): {x : Fin k → ℤ | ∑ x_i² = n} is finite.
- `sumSquaresCount_zero_right` (simp): r_k(0) = 1.
- `sumSquaresCount_zero_left` (simp): r₀(n) = 1 if n = 0 and 0 otherwise.
- `sumSquaresCount_pos_iff` (characterisation): 0 < r_k(n) ↔ ∃ x : Fin k → ℤ, ∑ x_i² = n.
- `sumSquaresCount_add` (relation): r_{k+l}(n) = Σ_{a+b=n} r_k(a) r_l(b).
- `sumSquaresCount_two_pos_iff` (compatibility): 0 < r₂(n) ↔ every prime q ≡ 3 (mod 4) divides n to an even power (Mathlib's Nat.eq_sq_add_sq_iff).
- `sumSquaresCount_four_pos` (compatibility): 0 < r₄(n) for every n (Mathlib's Nat.sum_four_squares).

Unit tests:

- `sumSquaresCount_two_five` (computation): r₂(5) = 8: (±1, ±2) and (±2, ±1).
- `sumSquaresCount_two_twentyfive` (computation): r₂(25) = 12.
- `sumSquaresCount_two_two` (non-example): r₂(2) = 4, not 1: order and signs are counted.
- `sumSquaresCount_two_zero` (degenerate): r₂(0) = 1 (only (0, 0)).
- `sumSquaresCount_four_one` (computation): r₄(1) = 8.
- `sumSquaresCount_two_three` (compatibility): r₂(3) = 0, in agreement with Nat.eq_sq_add_sq_iff (3 ≡ 3 mod 4 divides 3 once).

Further acceptance checks:

- r₂(5) = 8, r₂(25) = 12, r₂(3) = 0, r₄(1) = 8, r₂(0) = 1.

Proof sketch:

1. Define r_k(n) = Nat.card {x : Fin k → ℤ // ∑ x_i² = n}; the set is contained in the finite box |x_i| ≤ n.
2. Convolution: splitting ℤ^{k+l} = ℤᵏ × ℤˡ gives r_{k+l}(n) = Σ_{a+b=n} r_k(a) r_l(b); equivalently the generating function Σ_n r_k(n)xⁿ is θ(x)ᵏ with θ(x) = Σ_{m∈ℤ} x^{m²}.

Direct prerequisites: `mathlib:Nat.card`, `mathlib:Nat.eq_sq_add_sq_iff`, `mathlib:Nat.sum_four_squares`.

Source: [wuthrich-gaussian-integers-2011](https://www.maths.nottingham.ac.uk/plp/pmzcw/download/fnt_chap5.pdf), Theorem 5.12 and the Remark after it, p. 5. The count r₂(n) as the number of integral solutions, with order and signs.

Source: [hirschhorn-four-squares-1987](https://www.ams.org/journals/proc/1987-101-03/S0002-9939-1987-0908644-9/S0002-9939-1987-0908644-9.pdf), Theorem 1, p. 436. The count r₄(n) in the same convention.

Proof or interface frontier: Theta generating-function/convolution API requires own consumed lemma; coordinate-box finiteness needs an explicit construction.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-gaussian-norm-count-multiplicative"></a>

### The number of Gaussian integers of norm n, divided by 4, is multiplicative

`ClassicalArithmeticCompletion:CA.4/gaussian-norm-count-multiplicative` · lemma.

For n ≥ 1 let ρ(n) = r₂(n)/4. Then r₂(n) = #{α ∈ ℤ[i] : N(α) = n} is divisible by 4, ρ(n) is the number of associate classes of Gaussian integers of norm n, and ρ is multiplicative: ρ(mn) = ρ(m)ρ(n) for coprime m, n.

Hypotheses and conventions: n ≥ 1; m, n coprime for multiplicativity.

Further acceptance checks:

- ρ(5) = 2 (classes of 2 + i and 2 − i), ρ(13) = 2, ρ(65) = 4 = ρ(5)ρ(13); r₂(65) = 16.
- ρ is not completely multiplicative: ρ(25) = 3 ≠ 4 = ρ(5)².

Proof sketch:

1. (x, y) ↦ x + yi identifies the representations of n with the Gaussian integers of norm n (Mathlib's Zsqrtd.norm for d = −1).
2. The unit group {±1, ±i} acts freely on the nonzero Gaussian integers and preserves the norm, so r₂(n) = 4ρ(n) with ρ(n) the number of associate classes.
3. ℤ[i] is a Euclidean domain, hence a unique factorisation domain (Mathlib's GaussianInt instances). For coprime m, n, every α of norm mn factors, uniquely up to units, as α = βγ with N(β) = m and N(γ) = n: group the prime factors of α according to whether the rational prime below them divides m or n.
4. Hence (β, γ) ↦ βγ induces a bijection between pairs of associate classes of norms m and n and associate classes of norm mn.

Direct prerequisites: [CA.4/sum-of-squares-representation-count](#CA-4-sum-of-squares-representation-count), `mathlib:GaussianInt`, `mathlib:Zsqrtd.norm`, `mathlib:Zsqrtd.norm_mul`, `mathlib:UniqueFactorizationMonoid`, `mathlib:ArithmeticFunction.IsMultiplicative`.

Source: [wuthrich-gaussian-integers-2011](https://www.maths.nottingham.ac.uk/plp/pmzcw/download/fnt_chap5.pdf), Proof of Theorem 5.12, p. 6. The Euler product is the analytic form of the statement that ρ is multiplicative with the local factors of the next lemma; the node states the coefficientwise content.

Source: [wuthrich-gaussian-integers-2011](https://www.maths.nottingham.ac.uk/plp/pmzcw/download/fnt_chap5.pdf), Theorem 5.8, p. 4. Unique factorisation, used in the third proof step.

Proof or interface frontier: Split representation/norm bijection, free four-unit orbit count, coprime norm-factorization bijection, final multiplicativity. The key bijections are nonroutine suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-gaussian-norm-count-prime-power"></a>

### The number of associate classes of Gaussian integers of prime-power norm

`ClassicalArithmeticCompletion:CA.4/gaussian-norm-count-prime-power` · lemma.

With ρ as in gaussian-norm-count-multiplicative and k ≥ 0: ρ(2ᵏ) = 1; ρ(pᵏ) = k + 1 for primes p ≡ 1 (mod 4); ρ(qᵏ) = 1 if k is even and 0 if k is odd, for primes q ≡ 3 (mod 4). In every case ρ(pᵏ) = Σ_{j=0}^{k} χ₄(p)ʲ, where χ₄ is the nontrivial character modulo 4 (χ₄(2) = 0).

Hypotheses and conventions: p prime, k ∈ ℕ.

Further acceptance checks:

- ρ(2) = 1 (only 1 + i), ρ(9) = 1 (only 3), ρ(3) = 0, ρ(25) = 3 (classes of (2 + i)², 5, (2 − i)²).

Proof sketch:

1. Classification of Gaussian primes (Wuthrich, Proposition 5.7): 1 + i is the unique prime of norm 2 up to units; for p ≡ 1 (mod 4) there are exactly two non-associate primes π, π̄ of norm p (Mathlib's Nat.Prime.sq_add_sq gives p = a² + b²); for q ≡ 3 (mod 4), q is prime in ℤ[i] (Mathlib's GaussianInt.prime_iff_mod_four_eq_three_of_nat_prime), of norm q².
2. An element of norm pᵏ is, up to units, a product of primes above p with norms multiplying to pᵏ: (1 + i)ᵏ for p = 2; π^j π̄^{k−j} for j = 0, …, k when p ≡ 1 (mod 4); q^{k/2} when q ≡ 3 (mod 4) and k even, and none when k is odd.
3. Compare with Σ_{j≤k} χ₄(p)ʲ, which is 1 for p = 2, k + 1 for χ₄(p) = 1, and (1 + (−1)ᵏ)/2 for χ₄(p) = −1.

Direct prerequisites: [CA.4/gaussian-norm-count-multiplicative](#CA-4-gaussian-norm-count-multiplicative), `mathlib:GaussianInt.prime_iff_mod_four_eq_three_of_nat_prime`, `mathlib:Nat.Prime.sq_add_sq`, `mathlib:ZMod.χ₄`.

Source: [wuthrich-gaussian-integers-2011](https://www.maths.nottingham.ac.uk/plp/pmzcw/download/fnt_chap5.pdf), Proposition 5.7, p. 3. The classification used in the first two proof steps.

Source: [wuthrich-gaussian-integers-2011](https://www.maths.nottingham.ac.uk/plp/pmzcw/download/fnt_chap5.pdf), Proof of Theorem 5.12, p. 6. The local factor at q ≡ 3 (mod 4), whose coefficients are ρ(qᵏ).

Proof or interface frontier: Gaussian rational-prime classification needs norm-two uniqueness and conjugate nonassociation suppliers, not just mod-four primality and sum-of-two-squares.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-jacobi-two-square-theorem"></a>

### Jacobi's two-square theorem

`ClassicalArithmeticCompletion:CA.4/jacobi-two-square-theorem` · theorem.

For every n ≥ 1, r₂(n) = 4 Σ_{d∣n} χ₄(d) = 4(d₁(n) − d₃(n)), where χ₄ is the nontrivial Dirichlet character modulo 4 and d_j(n) is the number of divisors of n congruent to j modulo 4.

Hypotheses and conventions: n ≥ 1 (for n = 0, r₂(0) = 1).

Further acceptance checks:

- r₂(1) = 4, r₂(2) = 4, r₂(5) = 8, r₂(25) = 12, r₂(65) = 16, r₂(3) = r₂(21) = 0.
- Consequence: d₁(n) ≥ d₃(n) for every n ≥ 1, and for a prime p ≡ 1 (mod 4) the representation p = a² + b² with 0 < a < b is unique.

Proof sketch:

1. Both n ↦ r₂(n)/4 (gaussian-norm-count-multiplicative) and n ↦ Σ_{d∣n} χ₄(d) (a Dirichlet convolution of multiplicative functions, Mathlib's ArithmeticFunction.IsMultiplicative.mul) are multiplicative.
2. They agree on prime powers by gaussian-norm-count-prime-power, since Σ_{d∣pᵏ} χ₄(d) = Σ_{j≤k} χ₄(p)ʲ.
3. Mathlib's ArithmeticFunction.IsMultiplicative.eq_iff_eq_on_prime_powers concludes.

Direct prerequisites: [CA.4/gaussian-norm-count-multiplicative](#CA-4-gaussian-norm-count-multiplicative), [CA.4/gaussian-norm-count-prime-power](#CA-4-gaussian-norm-count-prime-power), `mathlib:ArithmeticFunction.IsMultiplicative.mul`, `mathlib:ArithmeticFunction.IsMultiplicative.eq_iff_eq_on_prime_powers`, `mathlib:ZMod.χ₄`.

Source: [wuthrich-gaussian-integers-2011](https://www.maths.nottingham.ac.uk/plp/pmzcw/download/fnt_chap5.pdf), Theorem 5.12 (p. 6) and the end of its proof (p. 7). The conclusion of the source's proof; χ₁ there is χ₄ here.

<a id="CA-4-hirschhorn-sixth-power-identity"></a>

### Hirschhorn's coalescence identity for ∏(1 − xⁿ)⁶

`ClassicalArithmeticCompletion:CA.4/hirschhorn-sixth-power-identity` · lemma.

In ℤ[[x]], ∏_{n≥1}(1 − xⁿ)⁶ = ½ Σ_{r,s∈ℤ} ((2r + 1)² − (2s)²) x^{r² + r + s²}.

Hypotheses and conventions: Identity of formal power series; each coefficient on the right is a finite sum and an integer.

Further acceptance checks:

- Constant coefficient: the pairs with r² + r + s² = 0 are (0, 0) and (−1, 0), each contributing 1, so the right side has constant term ½·2 = 1.
- Coefficient of x: pairs (0, ±1), (−1, ±1) give ½·4·(1 − 4) = −6, matching (1 − x)⁶ = 1 − 6x + ⋯.

Proof sketch:

1. Square Jacobi's identity ∏(1 − xⁿ)³ = ½ Σ_{n∈ℤ} (−1)ⁿ(2n + 1)x^{(n²+n)/2} (supplied by QSeriesPartitionsAndMockModularForms:QM.0) to get ¼ Σ_{m,n}(−1)^{m+n}(2m + 1)(2n + 1)x^{(m²+n²+m+n)/2}.
2. Split according to the parity of m + n. For m ≡ n put r = (m + n)/2, s = (m − n)/2; for m ≢ n put r = (m − n − 1)/2, s = (m + n + 1)/2. Each substitution is a bijection onto ℤ², the exponent becomes r² + r + s², and the signed coefficient becomes (2r + 1)² − (2s)² in both cases.
3. The two sums coalesce into twice the same sum, giving the factor ½.

Direct prerequisites: `QSeriesPartitionsAndMockModularForms:QM.0`.

Source: [hirschhorn-four-squares-1987](https://www.ams.org/journals/proc/1987-101-03/S0002-9939-1987-0908644-9/S0002-9939-1987-0908644-9.pdf), §2, p. 437. The identity and its proof.

Proof or interface frontier: Coefficient-local infinite-product stabilization and parity-index reindexing need own lemmas; node uses QM stage reference instead of exact Jacobi identity supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-hirschhorn-logarithmic-derivative-identity"></a>

### Hirschhorn's product-rule identity

`ClassicalArithmeticCompletion:CA.4/hirschhorn-logarithmic-derivative-identity` · lemma.

In ℤ[[x]], ∏_{n≥1}(1 − xⁿ)⁶ = ∏_{n≥1}(1 + x^{2n−1})²(1 + x^{2n})²(1 − x^{2n})² · (1 − 8 Σ_{n≥1}((2n − 1)x^{2n−1}/(1 + x^{2n−1}) − 2n x^{2n}/(1 + x^{2n}))).

Hypotheses and conventions: Identity of formal power series; x^{j}/(1 + x^{j}) denotes the power series Σ_{t≥1}(−1)^{t−1}x^{jt}.

Further acceptance checks:

- Both sides have constant term 1 and coefficient of x equal to −6: on the right, 1 − 8·1 contributes −8 and the product contributes 2 (from (1 + x)²).

Proof sketch:

1. Split the right side of hirschhorn-sixth-power-identity as ½(Σ_s x^{s²} · (1 + 4x d/dx)Σ_r x^{r²+r} − Σ_r x^{r²+r} · 4x d/dx Σ_s x^{s²}), using (2r + 1)²x^{r²+r} = (1 + 4x d/dx)x^{r²+r} and (2s)²x^{s²} = 4x d/dx x^{s²}.
2. Substitute the product forms Σ_s x^{s²} = ∏(1 + x^{2n−1})²(1 − x^{2n}) and Σ_r x^{r²+r} = 2∏(1 + x^{2n})²(1 − x^{2n}) (both consequences of the Jacobi triple product identity, supplied by QM.0).
3. Apply the product rule in logarithmic-derivative form, x d/dx log ∏(1 + x^j)^{e} = e Σ j x^j/(1 + x^j) and x d/dx log ∏(1 − x^j)^{e} = −e Σ j x^j/(1 − x^j), and collect terms: the Σ 2n x^{2n}/(1 − x^{2n}) terms cancel.

Direct prerequisites: [CA.4/hirschhorn-sixth-power-identity](#CA-4-hirschhorn-sixth-power-identity), `QSeriesPartitionsAndMockModularForms:QM.0`, `mathlib:PowerSeries`, `mathlib:PowerSeries.derivative`.

Source: [hirschhorn-four-squares-1987](https://www.ams.org/journals/proc/1987-101-03/S0002-9939-1987-0908644-9/S0002-9939-1987-0908644-9.pdf), §2, p. 437. The substitution step; the product-rule evaluation follows on the same page.

Proof or interface frontier: Entire consumed product-rule identity has no native signature; split coefficient-local derivative of product and theta product substitutions.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-theta-fourth-power-lambert-series"></a>

### θ(x)⁴ as a Lambert series

`ClassicalArithmeticCompletion:CA.4/theta-fourth-power-lambert-series` · lemma.

In ℤ[[x]], (Σ_{n∈ℤ} x^{n²})⁴ = 1 + 8 Σ_{n≥1, 4∤n} n xⁿ/(1 − xⁿ).

Hypotheses and conventions: Identity of formal power series; nxⁿ/(1 − xⁿ) = Σ_{t≥1} n x^{nt}.

Further acceptance checks:

- Coefficient of x: 8·1 = 8 = r₄(1). Coefficient of x⁴: 8(1 + 2) = 24 = r₄(4) (the divisor 4 is excluded).

Proof sketch:

1. Divide hirschhorn-logarithmic-derivative-identity by ∏(1 + xⁿ)⁴(1 − xⁿ)² = ∏(1 + x^{2n−1})²(1 + x^{2n})²(1 − x^{2n})² to get ∏((1 − xⁿ)/(1 + xⁿ))⁴ = 1 − 8Σ((2n − 1)x^{2n−1}/(1 + x^{2n−1}) − 2nx^{2n}/(1 + x^{2n})).
2. Use Gauss's identity ∏(1 − xⁿ)/(1 + xⁿ) = Σ_{n∈ℤ}(−1)ⁿx^{n²} (a consequence of the triple product identity, supplied by QM.0) and substitute −x for x.
3. Rewrite: Σ((2n − 1)x^{2n−1}/(1 − x^{2n−1}) + 2nx^{2n}/(1 + x^{2n})) = Σ nxⁿ/(1 − xⁿ) − Σ 4nx^{4n}/(1 − x^{4n}), since 2nx^{2n}/(1 − x^{2n}) − 2nx^{2n}/(1 + x^{2n}) = 4nx^{4n}/(1 − x^{4n}).
4. The difference Σ nxⁿ/(1 − xⁿ) − Σ 4nx^{4n}/(1 − x^{4n}) is Σ_{4∤n} nxⁿ/(1 − xⁿ).

Direct prerequisites: [CA.4/hirschhorn-logarithmic-derivative-identity](#CA-4-hirschhorn-logarithmic-derivative-identity), `QSeriesPartitionsAndMockModularForms:QM.0`, `mathlib:PowerSeries`.

Source: [hirschhorn-four-squares-1987](https://www.ams.org/journals/proc/1987-101-03/S0002-9939-1987-0908644-9/S0002-9939-1987-0908644-9.pdf), §2, p. 438. The identity used in the second proof step.

Source: [hirschhorn-four-squares-1987](https://www.ams.org/journals/proc/1987-101-03/S0002-9939-1987-0908644-9/S0002-9939-1987-0908644-9.pdf), §2, p. 438. The statement of the lemma.

Proof or interface frontier: The external FF.1/QM.0 stage does not identify the exact consumed character-normalisation/Jacobi-product identity. Supply its lemma contract as a direct prerequisite; the local composition is conditional on that missing adapter.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-jacobi-four-square-theorem"></a>

### Jacobi's four-square theorem

`ClassicalArithmeticCompletion:CA.4/jacobi-four-square-theorem` · theorem.

For every n ≥ 1, r₄(n) = 8 Σ_{d∣n, 4∤d} d. Equivalently r₄(n) = 8σ(n) for n odd and r₄(n) = 24σ(n_odd) for n even, where n_odd is the odd part of n.

Hypotheses and conventions: n ≥ 1 (r₄(0) = 1).

Further acceptance checks:

- r₄(1) = 8, r₄(2) = 24, r₄(3) = 32, r₄(4) = 24, r₄(5) = 48.
- It implies Lagrange's four-square theorem (r₄(n) ≥ 8 > 0), which Mathlib already has as Nat.sum_four_squares.
- The two forms of the formula agree: for n = 12, 8(1 + 2 + 3 + 6) = 96 = 24σ(3).

Proof sketch:

1. The generating function Σ_n r₄(n)xⁿ is θ(x)⁴ with θ(x) = Σ_{m∈ℤ} x^{m²} (sumSquaresCount_add of sum-of-squares-representation-count).
2. The coefficient of xⁿ in Σ_{4∤m} m x^m/(1 − x^m) is Σ_{m∣n, 4∤m} m.
3. Compare coefficients in theta-fourth-power-lambert-series.

Direct prerequisites: [CA.4/theta-fourth-power-lambert-series](#CA-4-theta-fourth-power-lambert-series), [CA.4/sum-of-squares-representation-count](#CA-4-sum-of-squares-representation-count), `mathlib:ArithmeticFunction.sigma`.

Source: [hirschhorn-four-squares-1987](https://www.ams.org/journals/proc/1987-101-03/S0002-9939-1987-0908644-9/S0002-9939-1987-0908644-9.pdf), Theorem 1, p. 436. The theorem in the notation and hypotheses used here.

Source: [wuthrich-gaussian-integers-2011](https://www.maths.nottingham.ac.uk/plp/pmzcw/download/fnt_chap5.pdf), Theorem 5.14, p. 7. The equivalent odd/even form of the formula, stated without proof in this source.

Reconciled native contracts: `jacobi_four_square_odd`, `jacobi_four_square_even`.

Proof or interface frontier: Equivalent odd/even sigma formula absent from native; promote consumed theta generating-function/convolution supplier.

Revision disposition: The missing or incomplete native consequences now have checked signatures: jacobi_four_square_odd, jacobi_four_square_even. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-4-generalised-pell-solution-set"></a>

### The solution set of the generalised Pell equation x² − dy² = n

`ClassicalArithmeticCompletion:CA.4/generalised-pell-solution-set` · definition.

For d, n ∈ ℤ, S(d, n) = {z ∈ ℤ[√d] : N(z) = n}, where ℤ[√d] is Mathlib's Zsqrtd d and N(x + y√d) = x² − dy² is Zsqrtd.norm. Its elements are identified with the integer solutions (x, y) of x² − dy² = n. The group of solutions of the Pell equation (Mathlib's Pell.Solution₁ d, the elements of norm 1) acts on S(d, n) by multiplication; an orbit is a class of 'Pell multiples'.

Hypotheses and conventions: d, n ∈ ℤ arbitrary in the definition; the finiteness theorems assume d > 0 not a square and n ≠ 0.

API:

- `pellNormSet` (data): S(d, n) = {z : ℤ√d | Zsqrtd.norm z = n}.
- `mem_pellNormSet_iff` (characterisation): ⟨x, y⟩ ∈ S(d, n) ↔ x² − d·y² = n.
- `pellNormSet.mul_mem` (relation): z ∈ S(d, n) → w ∈ S(d, n′) → z·w ∈ S(d, n·n′).
- `pellNormSet.solution_mul_mem` (structure): For a : Pell.Solution₁ d and z ∈ S(d, n), a·z ∈ S(d, n); this is a MulAction of Pell.Solution₁ d on S(d, n).
- `pellNormSet.star_mem` (relation): z ∈ S(d, n) → conj(z) ∈ S(d, n), and −z ∈ S(d, n).
- `pellNormSet_one` (compatibility): S(d, 1) is the set of elements of Mathlib's unitary submonoid, i.e. the image of Pell.Solution₁ d.
- `pellNormSet_zero` (other): For d not a square, S(d, 0) = {0}.

Unit tests:

- `mem_pellNormSet_six_three` (computation): ⟨3, 1⟩ ∈ S(6, 3) and ⟨27, 11⟩ ∈ S(6, 3).
- `pellNormSet_three_neg_one` (non-example): S(3, −1) = ∅: x² ≡ −1 (mod 3) is impossible.
- `pellNormSet_zero_of_not_square` (degenerate): S(2, 0) = {0}.
- `pellNormSet_one_compat` (compatibility): z ∈ S(d, 1) ↔ z ∈ unitary (ℤ√d), the carrier of Mathlib's Pell.Solution₁ d.

Further acceptance checks:

- (3, 1) and (27, 11) lie in S(6, 3), and (27 + 11√6) = (3 + √6)(5 + 2√6) with (5, 2) ∈ S(6, 1).
- S(3, −1) is empty (reduce mod 3), S(34, −1) is empty although x² − 34y² = −1 has rational solutions such as (5/3, 1/3).

Proof sketch:

1. Define S(d, n) as the fibre of the multiplicative map Zsqrtd.norm over n.
2. Multiplicativity of the norm (Mathlib's Zsqrtd.norm_mul) gives S(d, n)·S(d, n′) ⊆ S(d, nn′) and the action of S(d, 1) = Pell.Solution₁ d on S(d, n) (the identification S(d, 1) = unitary elements is Zsqrtd.norm_eq_one_iff_mem_unitary).
3. Conjugation x + y√d ↦ x − y√d and negation preserve S(d, n).

Direct prerequisites: `mathlib:Zsqrtd`, `mathlib:Zsqrtd.norm`, `mathlib:Zsqrtd.norm_mul`, `mathlib:Pell.Solution₁`, `mathlib:Zsqrtd.norm_eq_one_iff_mem_unitary`.

Source: [conrad-pell-two-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf), §3, p. 4, the paragraph before Example 3.1. The set S(d, n) and the action of the Pell solutions.

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), §7, Theorem 7.1, p. 10. The multiplicativity API item.

<a id="CA-4-negative-pell-solution-ordering"></a>

### Positive solutions of x² − dy² = −1 are ordered by either coordinate

`ClassicalArithmeticCompletion:CA.4/negative-pell-solution-ordering` · lemma.

Let d > 0 be a nonsquare. (a) If x² − dy² = −1 with x, y ∈ ℤ and x + y√d > 1, then x ≥ 1 and y ≥ 1. (b) If x² − dy² = −1 and a² − db² = −1 with x, y, a, b ≥ 1, then a + b√d < x + y√d ⇔ (a < x and b < y) ⇔ (a < x or b < y).

Hypotheses and conventions: d > 0 not a square; solutions in integers.

Further acceptance checks:

- For d = 2: (1, 1) < (7, 5) < (41, 29) in both coordinates.

Proof sketch:

1. (a): 1/(x + y√d) = −(x − y√d) = −x + y√d, so x + y√d > 1 > −x + y√d > 0; subtracting the reciprocal from the original expression gives 2x > 0, and then y√d > x > 0.
2. (b): if x + y√d > a + b√d ≥ 1 + √d > 1, taking reciprocals gives −x + y√d < −a + b√d; adding the two inequalities gives a < x; then db² = 1 + a² < 1 + x² = dy² gives b < y. The remaining equivalences are the same monotonicity.

Direct prerequisites: `mathlib:Zsqrtd.norm`.

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), §7, Lemma 7.3, p. 11. Part (a).

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), §7, Lemma 7.4, p. 11. Part (b).

Reconciled native contracts: `negativePell_pos_of_one_lt`.

Proof or interface frontier: Two separate source lemmas7.3/7.4 bundled, positivity lemma absentnative, consumed by160.

Revision disposition: The missing or incomplete native consequences now have checked signatures: negativePell_pos_of_one_lt. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-4-negative-pell-least-solution-squares-to-fundamental"></a>

### The square of the least negative Pell solution is the fundamental Pell solution

`ClassicalArithmeticCompletion:CA.4/negative-pell-least-solution-squares-to-fundamental` · lemma.

Let d > 0 be a nonsquare such that x² − dy² = −1 has a solution in positive integers, and let (x₁, y₁) be the one with least y₁. Then (x₁ + y₁√d)² = X₁ + Y₁√d, where (X₁, Y₁) = (x₁² + dy₁², 2x₁y₁) is the fundamental solution of x² − dy² = 1 in the sense of Mathlib's Pell.IsFundamental.

Hypotheses and conventions: d > 0 nonsquare; a positive solution of the negative equation exists.

Further acceptance checks:

- d = 2: (1 + √2)² = 3 + 2√2, the fundamental solution of x² − 2y² = 1.
- d = 5: (2 + √5)² = 9 + 4√5.

Proof sketch:

1. (x₁ + y₁√d)² has norm 1 and positive coordinates, so by Mathlib's Pell.IsFundamental.eq_zpow_or_neg_zpow and positivity it is u^k for the fundamental solution u = X₁ + Y₁√d and some k ≥ 1.
2. If k = 2ℓ were even, x₁ + y₁√d = ±u^ℓ would have norm 1, not −1; so k = 2ℓ + 1.
3. Then u = (x₁ + y₁√d)²u^{−2ℓ} = (a + b√d)² with a + b√d = (x₁ + y₁√d)u^{−ℓ} of norm −1; 2ab = Y₁ > 0, so a, b may be taken positive.
4. If ℓ > 0 then (x₁ + y₁√d)² = u^{2ℓ+1} > u = (a + b√d)² > 1, so x₁ + y₁√d > a + b√d and y₁ > b by negative-pell-solution-ordering, contradicting minimality; hence ℓ = 0 and (x₁ + y₁√d)² = u.

Direct prerequisites: [CA.4/negative-pell-solution-ordering](#CA-4-negative-pell-solution-ordering), `mathlib:Pell.IsFundamental`, `mathlib:Pell.IsFundamental.eq_zpow_or_neg_zpow`.

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), §7, proof of Theorem 7.5, p. 12. The lemma is the first half of the source's proof of Theorem 7.5.

Proof or interface frontier: Fundamental solution existence and injective real embedding suppliers absent; Pell.eq_zpow alone does not supply fundamental unit.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-negative-pell-classification"></a>

### Classification of the solutions of x² − dy² = ±1 when the negative equation is solvable

`ClassicalArithmeticCompletion:CA.4/negative-pell-classification` · theorem.

Let d > 0 be a nonsquare such that x² − dy² = −1 has a solution in positive integers, and let (x₁, y₁) be the one with least y₁; put ε = x₁ + y₁√d, a unit of ℤ[√d] of norm −1. Then the integer solutions of x² − dy² = ±1 are exactly the x + y√d = ±ε^k with k ∈ ℤ; those of x² − dy² = −1 have k odd and those of x² − dy² = 1 have k even.

Hypotheses and conventions: d > 0 nonsquare; S(d, −1) contains an element with positive coordinates. (No solvability criterion is asserted: whether S(d, −1) is nonempty is decided by generalised-pell-finite-classes-and-bounded-search, and necessary local conditions are negative-pell-local-obstruction.)

Further acceptance checks:

- d = 2, ε = 1 + √2: the solutions of x² − 2y² = −1 in positive integers are (1, 1), (7, 5), (41, 29), from ε, ε³, ε⁵.
- d = a² + 1 (a ≥ 1): ε = a + √(a² + 1).
- The statement complements Mathlib's Pell.IsFundamental.eq_zpow_or_neg_zpow, which classifies only the norm-one solutions.

Proof sketch:

1. ±ε^k has norm (−1)^k (multiplicativity of the norm).
2. A positive solution of norm 1 is a positive power of the fundamental solution ε² (negative-pell-least-solution-squares-to-fundamental and Mathlib's Pell.IsFundamental.eq_zpow_or_neg_zpow), hence an even power of ε.
3. A positive solution α of norm −1: α² has norm 1 and is ε^{2k}, so α = ε^k by taking positive square roots, and k is odd because the norm is −1.
4. Solutions that are not positive: by negative-pell-solution-ordering(a), α ∉ (1, ∞); if α ≠ ±1 then exactly one of α⁻¹, −α⁻¹, −α lies in (1, ∞) and has coordinates equal to those of α up to sign, so it is ε^K for some K ≥ 1.

Direct prerequisites: [CA.4/negative-pell-least-solution-squares-to-fundamental](#CA-4-negative-pell-least-solution-squares-to-fundamental), [CA.4/negative-pell-solution-ordering](#CA-4-negative-pell-solution-ordering), [CA.4/generalised-pell-solution-set](#CA-4-generalised-pell-solution-set), `mathlib:Pell.IsFundamental.eq_zpow_or_neg_zpow`, `mathlib:Zsqrtd.isUnit_iff_norm_isUnit`.

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), §7, Theorem 7.5, p. 12. The theorem in the notation and hypotheses used here.

Proof or interface frontier: Native complete classification sensible; split real-embedding square-root injectivity and sign/inverse reduction.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-negative-pell-local-obstruction"></a>

### Congruence obstructions to x² − dy² = −1

`ClassicalArithmeticCompletion:CA.4/negative-pell-local-obstruction` · lemma.

Let d ∈ ℤ. If 4 ∣ d, or if some prime p ≡ 3 (mod 4) divides d, then x² − dy² = −1 has no integer solution. (More generally, x² − dy² = n has no solution when x² ≡ n has no solution modulo some p dividing d with p ∤ n.)

Hypotheses and conventions: d ∈ ℤ; no nonsquare hypothesis is needed.

Further acceptance checks:

- x² − 3y² = −1 and x² − 21y² = −1 have no solution; x² − 34y² = −1 passes these tests but has no solution (so the condition is necessary, not sufficient).
- The generalised form rules out x² − 5y² = 2 (2 is not a square mod 5).

Proof sketch:

1. A solution gives x² ≡ −1 (mod p) for every p ∣ d; for p ≡ 3 (mod 4) this is impossible by Mathlib's ZMod.mod_four_ne_three_of_sq_eq_neg_one.
2. If 4 ∣ d, x² ≡ −1 (mod 4) is impossible because squares are 0 or 1 modulo 4.

Direct prerequisites: `mathlib:ZMod.mod_four_ne_three_of_sq_eq_neg_one`, `mathlib:ZMod`.

Source: [conrad-pell-two-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf), §3, Remark 3.6, p. 7. The obstruction at primes ≡ 3 (mod 4), stated in the source without proof; the node drops the squarefree hypothesis and adds the obstruction at 4.

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), §6, Examples 6.1–6.2 and Remark 6.4, pp. 8–9. The generalised congruence form and the example d = 3; Remark 6.4 supplies d = 34 as the non-sufficiency example.

Reconciled native contracts: `pellNormSet_mod_prime`.

Proof or interface frontier: Generalized norm-n congruence obstruction is stated but absentnative; separate from negative-Pell obstruction.

Revision disposition: The missing or incomplete native consequences now have checked signatures: pellNormSet_mod_prime. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-4-chebyshev-bound-generalised-pell"></a>

### Chebyshev's bound for the generalised Pell equation

`ClassicalArithmeticCompletion:CA.4/chebyshev-bound-generalised-pell` · theorem.

Let d > 0 be a nonsquare, and u = a + b√d with a, b positive integers and a² − db² = 1. For every n ≠ 0, every integer solution of x² − dy² = n is (x′ + y′√d)u^k for some k ∈ ℤ and some solution (x′, y′) of x′² − dy′² = n with |x′| ≤ √|n|(√u + 1/√u)/2 and |y′| ≤ √|n|(√u + 1/√u)/(2√d). If n > 0 one may take |y′| ≤ √n(√u − 1/√u)/(2√d).

Hypotheses and conventions: d > 0 nonsquare; u > 1 a Pell solution with positive coordinates (for instance the fundamental one, which exists by Mathlib's Pell.exists_of_not_isSquare); n ≠ 0.

Further acceptance checks:

- x² − 6y² = 3 with u = 5 + 2√6: the bounds give |y′| ≤ 1 and the fundamental solutions (±3, ±1).
- x² − 37y² = 11 with u = 73 + 12√37: no solution inside the box, hence none at all (Conrad, Example 4.5).

Proof sketch:

1. For α = x + y√d with norm n put L(α) = (log|x + y√d|, log|x − y√d|) ∈ ℝ²; L is multiplicative-to-additive, and L(u) = (log u)(1, −1) because |a − b√d| = 1/u.
2. Write L(α) = c₁(1, 1) + c₂L(u); adding coordinates gives c₁ = (log|n|)/2. Choose k ∈ ℤ with |c₂ − k| ≤ 1/2 and set α′ = αu^{−k} = x′ + y′√d, which has integer coordinates and norm n.
3. Then {|x′ + y′√d|, |x′ − y′√d|} = {s, |n|/s} with √|n| ≤ s ≤ √(|n|u), and |x′| ≤ (s + |n|/s)/2, |y′| ≤ (s + |n|/s)/(2√d); t ↦ t + |n|/t is increasing for t ≥ √|n|, which gives the bounds.
4. For n > 0 the two conjugates have the same sign, so |y′| = |s − n/s|/(2√d) ≤ (√(nu) − √(n/u))/(2√d).

Direct prerequisites: [CA.4/generalised-pell-solution-set](#CA-4-generalised-pell-solution-set), `mathlib:Pell.exists_of_not_isSquare`, `mathlib:Zsqrtd.norm_mul`.

Source: [conrad-pell-two-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf), §3, Theorem 3.3, p. 4. The theorem; the displayed bounds (3.1) and the refinement for n > 0 follow on the same page.

Source: [conrad-pell-two-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf), §3, Remark 3.4, p. 7. The attribution in the node's title.

Proof or interface frontier: Source proof spans pages4–6; split log-coordinate reduction, nearest-integer exponent, bound and positive-n refinement. Native omits positive-n refinement.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-generalised-pell-finite-classes-and-bounded-search"></a>

### Finitely many classes of solutions, and the complete bounded search

`ClassicalArithmeticCompletion:CA.4/generalised-pell-finite-classes-and-bounded-search` · theorem.

Let d > 0 be a nonsquare, n ≠ 0, and u = a + b√d as in chebyshev-bound-generalised-pell. (a) There is a finite set F ⊆ S(d, n) such that every element of S(d, n) is a Pell multiple ±f·u^k of an element of F; one may take F = S(d, n) ∩ B with B the box |x| ≤ √|n|(√u + 1/√u)/2, |y| ≤ √|n|(√u + 1/√u)/(2√d). (b) Consequently x² − dy² = n has an integer solution if and only if it has one in B, which is a finite check: the generalised Pell equation, and in particular the negative Pell equation, is decidable once a nontrivial Pell solution u is known.

Hypotheses and conventions: d > 0 nonsquare; n ≠ 0; u a Pell solution with positive coordinates.

Further acceptance checks:

- x² − 194y² = −1 has no solution: the box for n = −1 contains no solution (Conrad, Example 4.6), although 194 = 2·97 passes the congruence test of negative-pell-local-obstruction.
- The search is complete only because of the proved bound, as the stage's acceptance requires.

Proof sketch:

1. (a) is chebyshev-bound-generalised-pell together with finiteness of the integer points of B.
2. (b): a solution outside B is a Pell multiple of one inside B; conversely a solution in B is a solution.
3. Mathlib's Pell.exists_of_not_isSquare provides u, so the bound is effective in d and n once u is computed.

Direct prerequisites: [CA.4/chebyshev-bound-generalised-pell](#CA-4-chebyshev-bound-generalised-pell), `mathlib:Pell.exists_of_not_isSquare`.

Source: [conrad-pell-two-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf), §3, Corollary 3.5, p. 7. Part (a).

Source: [conrad-pell-two-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf), §3, proof of Corollary 3.5, p. 7. Part (b): the source uses the same box to prove nonexistence in Examples 4.5–4.7.

Proof or interface frontier: Finite representative-set statement absentnative. Executable decision claim needs a computable certified integer bound; existence theorem alone is not an algorithm.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-small-norm-solutions-are-convergents"></a>

### Solutions of x² − dy² = n with |n| < √d come from convergents of √d

`ClassicalArithmeticCompletion:CA.4/small-norm-solutions-are-convergents` · theorem.

Let d > 0 be a nonsquare and n an integer with 0 < |n| < √d. If x, y are positive integers with x² − dy² = n, then the rational number x/y is a convergent of the regular continued fraction of √d: x/y = Real.convergent (√d) k for some k.

Hypotheses and conventions: d > 0 nonsquare, 0 < |n| < √d, x, y > 0.

Further acceptance checks:

- d = 6: √6 = [2; 2, 4], convergents 2, 5/2, 22/9, 49/20, …; 5² − 6·2² = 1 and 2² − 6·1² = −2 appear.
- d = 13: the only n with 0 < |n| < √13 for which x² − 13y² = n is solvable are ±1 and ±3 (Conrad, Example 5.4).
- Only the equality x/y = p_k/q_k of rationals is asserted: for non-squarefree n, (x, y) can be a multiple (gp_k, gq_k) with g² ∣ n.

Proof sketch:

1. By Legendre's theorem (Mathlib's Real.exists_rat_eq_convergent), it suffices to show |ξ − q| < 1/(2 den(q)²) for the relevant ξ and q.
2. If n > 0 then x > y√d, and |x/y − √d| = |n|/(y²(x/y + √d)) < 1/(2y²) since x/y + √d > 2√d > 2|n|; as den(x/y) ≤ y this gives the hypothesis.
3. If n < 0 then x < y√d, and the same computation gives |y/x − 1/√d| < 1/(2x²), so y/x is a convergent of 1/√d; since 0 < 1/√d < 1, Mathlib's Real.convergent_succ gives Real.convergent (1/√d) (k + 1) = (Real.convergent (√d) k)⁻¹, so x/y is a convergent of √d.

Direct prerequisites: `mathlib:Real.exists_rat_eq_convergent`, `mathlib:Real.convergent`, `mathlib:Real.convergent_succ`.

Source: [conrad-pell-two-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf), §5, Theorem 5.1, p. 10. The theorem in the notation and hypotheses used here; the source's proof is the one in the proof steps.

<a id="CA-4-pell-unit-solutions-are-convergents"></a>

### Positive solutions of x² − dy² = ±1 are numerators and denominators of convergents

`ClassicalArithmeticCompletion:CA.4/pell-unit-solutions-are-convergents` · lemma.

Let d > 1 be a nonsquare. If x, y are positive integers with x² − dy² = ±1, then there is k with Real.convergent (√d) k = x/y in lowest terms, i.e. x and y are the numerator and denominator of that convergent.

Hypotheses and conventions: d > 1 nonsquare (so that 1 < √d), x, y > 0.

Further acceptance checks:

- d = 2: (1, 1), (3, 2), (7, 5), (17, 12) are the numerators and denominators of the convergents 1, 3/2, 7/5, 17/12 of √2.

Proof sketch:

1. Apply small-norm-solutions-are-convergents with n = ±1 (|n| = 1 < √d).
2. x² − dy² = ±1 forces gcd(x, y) = 1, so x/y is already in lowest terms and its numerator and denominator are x and y.

Direct prerequisites: [CA.4/small-norm-solutions-are-convergents](#CA-4-small-norm-solutions-are-convergents).

Source: [conrad-pell-two-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf), §5, Corollary 5.2, p. 11. The statement, restated in this roadmap’s notation.

<a id="CA-4-small-norm-pell-decision-by-convergents"></a>

### The continued-fraction decision procedure for x² − dy² = n with |n| < √d

`ClassicalArithmeticCompletion:CA.4/small-norm-pell-decision-by-convergents` · theorem.

Let d > 1 be a nonsquare, 0 < |n| < √d, and u = a + b√d a Pell solution with positive coordinates; let Y = √|n|(√u + 1/√u)/(2√d). Then x² − dy² = n has a solution in positive integers if and only if either n is a perfect square, or there are k, g ∈ ℕ with g ≥ 1, g² ∣ n, g·q_k ≤ Y and p_k² − dq_k² = n/g², where p_k/q_k is the k-th convergent Real.convergent (√d) k in lowest terms. Only the finitely many k with q_k ≤ Y need to be checked, since q_k ≥ F_{k+1} (Fibonacci numbers).

Hypotheses and conventions: d > 1 nonsquare, 0 < |n| < √d, u as in chebyshev-bound-generalised-pell.

Further acceptance checks:

- d = 13, n = 3: 4² − 13·1² = 3 with 4/1 a convergent of √13 = [3; 1, 1, 1, 1, 6].
- d = 13, n = 2: no convergent up to the bound gives norm 2 or 2/g², so x² − 13y² = 2 has no solution.
- This decides the negative Pell equation (n = −1) without the periodicity of the continued fraction of √d.

Proof sketch:

1. If n = g² is a perfect square, (ga, gb) is a positive solution. If k, g are as in the statement, (gp_k, gq_k) is a positive solution (p_k ≥ 1 because √d > 1).
2. Conversely, let a positive solution exist and n not be a square. By generalised-pell-finite-classes-and-bounded-search there is a solution (x′, y′) in the box B; y′ ≠ 0 because n is not a square, and x′ ≠ 0 because |n| < d; so (|x′|, |y′|) is a positive solution with |y′| ≤ Y.
3. By small-norm-solutions-are-convergents, |x′|/|y′| = p_k/q_k for some k; with g = gcd(x′, y′), |x′| = gp_k, |y′| = gq_k, g² ∣ n, p_k² − dq_k² = n/g² and gq_k ≤ Y.
4. Finiteness: the denominators of the convergents satisfy q_k ≥ F_{k+1} (Mathlib's GenContFract.succ_nth_fib_le_of_nth_den, transported to Real.convergent by Real.convs_eq_convergent, with p_k, q_k coprime by SimpContFract.determinant).

Direct prerequisites: [CA.4/generalised-pell-finite-classes-and-bounded-search](#CA-4-generalised-pell-finite-classes-and-bounded-search), [CA.4/small-norm-solutions-are-convergents](#CA-4-small-norm-solutions-are-convergents), `mathlib:Real.convs_eq_convergent`, `mathlib:GenContFract.succ_nth_fib_le_of_nth_den`, `mathlib:SimpContFract.determinant`.

Source: [conrad-pell-two-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf), §5, p. 11, after Example 5.3. The source's decision procedure uses the periodicity of the continued fraction of √d, which it states without proof; the node replaces periodicity by the proved bound of Theorem 3.3, so that only finitely many convergents are checked.

Source: [conrad-pell-two-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn2.pdf), §5, Theorem 5.1, p. 10. The link used in the second proof step.

Proof or interface frontier: Needs denominator/copime transport and Fibonacci finiteness supplier; separate bounded-search equivalence and explicit finite cutoff.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-ramanujan-nagell-ring-norm-euclidean"></a>

### ℤ[(1 + √−7)/2] is norm-Euclidean

`ClassicalArithmeticCompletion:CA.4/ramanujan-nagell-ring-norm-euclidean` · lemma.

Let R = ℤ[θ] with θ = (1 + √−7)/2, realised as Mathlib's QuadraticAlgebra ℤ (−2) 1 (θ² = θ − 2); θ′ = 1 − θ; norm N(x + yθ) = x² + xy + 2y² (Mathlib's QuadraticAlgebra.norm). For all α, β ∈ R with β ≠ 0 there are q, r ∈ R with α = βq + r and N(r) < N(β). Consequently R is a Euclidean domain, hence a principal ideal domain and a unique factorisation domain.

Hypotheses and conventions: The norm is the one of Mathlib's QuadraticAlgebra.norm for a = −2, b = 1.

Further acceptance checks:

- Rounding both coordinates of ℤ[√−7] would only give N ≤ 2: the half-integers are essential.
- The same computation fails for ℤ[√−5], whose class number is 2.

Proof sketch:

1. Write γ = α/β = ξ + η√−7 with ξ, η ∈ ℚ; it suffices to find q ∈ R with N(γ − q) < 1, since N is multiplicative (N(α − βq) = N(β)N(γ − q)).
2. Elements of R are (j + k√−7)/2 with j ≡ k (mod 2). Choose k ∈ ℤ nearest to 2η (|η − k/2| ≤ 1/4) and j ≡ k (mod 2) nearest to 2ξ (|ξ − j/2| ≤ 1/2).
3. Then N(γ − q) = (ξ − j/2)² + 7(η − k/2)² ≤ 1/4 + 7/16 = 11/16 < 1.
4. A Euclidean domain is a principal ideal domain and a unique factorisation monoid (Mathlib's instances from EuclideanDomain).

Direct prerequisites: `mathlib:QuadraticAlgebra`, `mathlib:QuadraticAlgebra.norm`, `mathlib:EuclideanDomain`, `mathlib:UniqueFactorizationMonoid`.

Source: [banwait-ramanujan-nagell-2026](https://arxiv.org/pdf/2604.09808v2), §2.3, pp. 3–4. The conclusion; the rounding argument precedes it on p. 3.

Proof or interface frontier: Unplanned RamanujanNagellRing/rnTheta/rnTheta-prime definitions and tests; EuclideanDomain construction/positive-definite norm needed, not only division existential.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-ramanujan-nagell-ring-units-and-primes"></a>

### Units and the primes above 2 in ℤ[(1 + √−7)/2]

`ClassicalArithmeticCompletion:CA.4/ramanujan-nagell-ring-units-and-primes` · lemma.

In R (as in ramanujan-nagell-ring-norm-euclidean): the units are ±1; θθ′ = 2, θ + θ′ = 1 and (θ − θ′)² = −7; θ and θ′ are prime elements of norm 2 and are not associates.

Hypotheses and conventions: R as above.

Further acceptance checks:

- θ′ = 1 − θ; θ − θ′ = 2θ − 1 squares to 4θ² − 4θ + 1 = −7.

Proof sketch:

1. 4N(x + yθ) = (2x + y)² + 7y², so N = 1 forces y = 0 and x = ±1; units have norm 1.
2. N(θ) = N(θ′) = 2 is a rational prime, so θ, θ′ are irreducible, hence prime in the UFD R.
3. θ/θ′ is not in R (its norm is 1 but it is not ±1), so θ and θ′ are not associates; the identities are direct computations with θ² = θ − 2.

Direct prerequisites: [CA.4/ramanujan-nagell-ring-norm-euclidean](#CA-4-ramanujan-nagell-ring-norm-euclidean), `mathlib:QuadraticAlgebra.norm`.

Source: [banwait-ramanujan-nagell-2026](https://arxiv.org/pdf/2604.09808v2), §2.3, p. 4. The lemma, with the argument restated here.

Proof or interface frontier: Units classification, prime-element facts and nonassociation are distinct proof units; split.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-ramanujan-nagell-even-case"></a>

### The Ramanujan–Nagell equation with even exponent

`ClassicalArithmeticCompletion:CA.4/ramanujan-nagell-even-case` · lemma.

If x ∈ ℤ, n ∈ ℕ is even and x² + 7 = 2ⁿ, then n = 4 and x = ±3.

Hypotheses and conventions: n even.

Further acceptance checks:

- n = 0 and n = 2 give x² = −6 and x² = −3, impossible.

Proof sketch:

1. (2^{n/2} + |x|)(2^{n/2} − |x|) = 7 with both factors positive integers, so 2^{n/2} + |x| = 7 and 2^{n/2} − |x| = 1; adding, 2^{n/2+1} = 8, so n = 4 and |x| = 3.

Direct prerequisites: .

Source: [banwait-ramanujan-nagell-2026](https://arxiv.org/pdf/2604.09808v2), §2.2, p. 3. The lemma, with the sign of x restored.

<a id="CA-4-ramanujan-nagell-factorisation"></a>

### Factorisation of x² + 7 = 2ⁿ in ℤ[(1 + √−7)/2]

`ClassicalArithmeticCompletion:CA.4/ramanujan-nagell-factorisation` · lemma.

Let n ≥ 5 be odd, m = n − 2, and x a positive odd integer with x² + 7 = 2ⁿ; write x = 2k + 1. Then α = k + θ = (x + √−7)/2 and β = k + θ′ = (x − √−7)/2 satisfy αβ = 2^m = θ^mθ′^m and α − β = θ − θ′ = √−7, and α ∈ {±θ^m, ±θ′^m}. Consequently θ^m − θ′^m = ±(θ − θ′).

Hypotheses and conventions: n odd, n ≥ 5 (so m ≥ 3 odd); x > 0 (x is odd because 2ⁿ − 7 is odd).

Further acceptance checks:

- x = 5, n = 5, m = 3, k = 2: θ³ = −θ − 2 and θ′³ = θ − 3, so α = 2 + θ = −θ³ and θ³ − θ′³ = −(2θ − 1) = −(θ − θ′).

Proof sketch:

1. x² + 7 = 4(k² + k + 2), so αβ = k² + k + 2 = 2^m = (θθ′)^m.
2. A common prime factor of α and β divides α − β = θ − θ′, of norm 7, and divides 2^m, so it is θ or θ′ (ramanujan-nagell-ring-units-and-primes) of norm 2; 2 ∤ 7, so α and β are coprime.
3. By unique factorisation (ramanujan-nagell-ring-norm-euclidean) and units ±1, α = ±θ^m or α = ±θ′^m.
4. Taking conjugates (θ ↔ θ′) gives β, and subtracting gives θ − θ′ = α − β = ±(θ^m − θ′^m).

Direct prerequisites: [CA.4/ramanujan-nagell-ring-units-and-primes](#CA-4-ramanujan-nagell-ring-units-and-primes), [CA.4/ramanujan-nagell-ring-norm-euclidean](#CA-4-ramanujan-nagell-ring-norm-euclidean).

Source: [banwait-ramanujan-nagell-2026](https://arxiv.org/pdf/2604.09808v2), §2.4, p. 4. The factorisation conclusion; §2.5 opens with the consequence θ^m − θ′^m = ±√−7.

Proof or interface frontier: Native only final difference identity; factorization/copime intermediates used later need own suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-ramanujan-nagell-sign"></a>

### The sign in θ^m − θ′^m = ±(θ − θ′)

`ClassicalArithmeticCompletion:CA.4/ramanujan-nagell-sign` · lemma.

If m ≥ 3 is odd and θ^m − θ′^m = ±(θ − θ′) in R, then the sign is negative: θ^m − θ′^m = −(θ − θ′).

Hypotheses and conventions: m odd, m ≥ 3 (for m = 1 the positive sign holds trivially).

Further acceptance checks:

- m = 3: θ³ − θ′³ = (−θ − 2) − (−θ′ − 2) = −(θ − θ′), the negative sign.

Proof sketch:

1. Suppose θ^m − θ′^m = θ − θ′. Modulo θ′² (using θθ′ = 2 and θ = 1 − θ′), θ² = (1 − θ′)² ≡ 1, so θ^m ≡ θ as m is odd, and θ′^m ≡ 0 as m ≥ 2.
2. Then θ − θ′ ≡ θ^m − θ′^m ≡ θ (mod θ′²), so θ′ ≡ 0 (mod θ′²), impossible since θ′ is not a unit.

Direct prerequisites: [CA.4/ramanujan-nagell-ring-units-and-primes](#CA-4-ramanujan-nagell-ring-units-and-primes).

Source: [banwait-ramanujan-nagell-2026](https://arxiv.org/pdf/2604.09808v2), §2.5, p. 4. The lemma and its proof.

<a id="CA-4-ramanujan-nagell-residues-mod-42"></a>

### The exponent lies in three classes modulo 42

`ClassicalArithmeticCompletion:CA.4/ramanujan-nagell-residues-mod-42` · lemma.

If m is odd and θ^m − θ′^m = −(θ − θ′), then −2^{m−1} ≡ m (mod 7), and hence m ≡ 3, 5 or 13 (mod 42).

Hypotheses and conventions: m odd.

Further acceptance checks:

- m = 3: −4 ≡ 3; m = 5: −16 ≡ 5; m = 13: −4096 ≡ 13 (mod 7).

Proof sketch:

1. Binomial expansion of ((1 + √−7)/2)^m − ((1 − √−7)/2)^m gives 2^{1−m}√−7(C(m,1) − 7C(m,3) + 7²C(m,5) − ⋯); comparing with −√−7 and multiplying by 2^{m−1} gives −2^{m−1} = C(m,1) − 7C(m,3) + ⋯, so −2^{m−1} ≡ m (mod 7).
2. 2 has order 3 modulo 7, so −2^{m−1} mod 7 depends on m mod 3; together with m mod 7 and m odd this is a condition on m mod 42, and a direct check of the 21 odd residues gives exactly 3, 5, 13.

Direct prerequisites: [CA.4/ramanujan-nagell-sign](#CA-4-ramanujan-nagell-sign).

Source: [banwait-ramanujan-nagell-2026](https://arxiv.org/pdf/2604.09808v2), §2.6, p. 5. The conclusion; congruence (4) is −2^{m−1} ≡ m (mod 7), derived just before by the binomial expansion.

Proof or interface frontier: Binomial congruence asserted but omittednative; separate from finite residue classification.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-ramanujan-nagell-one-per-class"></a>

### At most one exponent in each class modulo 42

`ClassicalArithmeticCompletion:CA.4/ramanujan-nagell-one-per-class` · lemma.

There are no odd m < m′ with m ≡ m′ (mod 42) such that both satisfy θ^m − θ′^m = −(θ − θ′) = θ^{m′} − θ′^{m′}.

Hypotheses and conventions: m, m′ odd; the identity for both.

Further acceptance checks:

- The three classes contain m = 3, 5, 13 respectively, so these are the only odd m ≥ 3 with the negative-sign identity.

Proof sketch:

1. Let d = m′ − m, so 42 ∣ d; let l = v₇(d) ≥ 1; work modulo 7^{l+1} in R.
2. Binomial expansion: (1 + √−7)^d ≡ 1 + d√−7 (mod 7^{l+1}), because every term with j ≥ 1 has 7-adic valuation at least j + l − v₇(k) ≥ l + 1 (using k·C(d,k) = d·C(d−1,k−1)).
3. Lifting the exponent (Mathlib's Int.emultiplicity_pow_sub_pow with 8 − 1 = 7 and d/3): v₇(2^d − 1) = v₇(8^{d/3} − 1) = 1 + l, so 2^d ≡ 1 (mod 7^{l+1}) and θ^d ≡ 1 + d√−7, θ′^d ≡ 1 − d√−7.
4. Then θ^{m′} − θ′^{m′} ≡ (θ^m − θ′^m) + d√−7(θ^m + θ′^m), so d√−7·P ≡ 0 with P = θ^m + θ′^m.
5. P_k = θ^k + θ′^k satisfies P_{k+2} = P_{k+1} − 2P_k with P₀ = 2, P₁ = 1, and modulo 7 it cycles 2, 1, 4, never 0; so P is invertible modulo 7^{l+1} and d√−7 ≡ 0, i.e. the coordinates (−d, 2d) of d(2θ − 1) are divisible by 7^{l+1}, contradicting v₇(d) = l.

Direct prerequisites: [CA.4/ramanujan-nagell-residues-mod-42](#CA-4-ramanujan-nagell-residues-mod-42), `mathlib:Int.emultiplicity_pow_sub_pow`.

Source: [banwait-ramanujan-nagell-2026](https://arxiv.org/pdf/2604.09808v2), §2.7, pp. 5–6. The lemma; the proof steps follow the source's (6)–(9).

Proof or interface frontier: Two-page uniqueness proof must split binomial valuation bound, power congruence/LTE, trace period/nonzero and coordinate divisibility.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-ramanujan-nagell-theorem"></a>

### The Ramanujan–Nagell theorem

`ClassicalArithmeticCompletion:CA.4/ramanujan-nagell-theorem` · theorem.

The integer solutions (x, n) ∈ ℤ × ℕ of x² + 7 = 2ⁿ are exactly (±1, 3), (±3, 4), (±5, 5), (±11, 7) and (±181, 15).

Hypotheses and conventions: x ∈ ℤ, n ∈ ℕ.

Further acceptance checks:

- 2¹⁵ − 7 = 32761 = 181².
- A complete Lean 4 formalisation against Mathlib, with no unfinished proofs, exists outside Tau Ceti (Banwait, arXiv:2604.09808); the roadmap cites it as prior work for coordination.

Proof sketch:

1. The listed pairs are solutions (direct computation).
2. n even: ramanujan-nagell-even-case gives (±3, 4).
3. n odd: n ≤ 3 gives only n = 3, x = ±1; for n ≥ 5, ramanujan-nagell-factorisation and ramanujan-nagell-sign give θ^m − θ′^m = −(θ − θ′) with m = n − 2; ramanujan-nagell-residues-mod-42 and ramanujan-nagell-one-per-class leave m ∈ {3, 5, 13}, i.e. n ∈ {5, 7, 15}, with x = ±5, ±11, ±181.

Direct prerequisites: [CA.4/ramanujan-nagell-even-case](#CA-4-ramanujan-nagell-even-case), [CA.4/ramanujan-nagell-factorisation](#CA-4-ramanujan-nagell-factorisation), [CA.4/ramanujan-nagell-sign](#CA-4-ramanujan-nagell-sign), [CA.4/ramanujan-nagell-residues-mod-42](#CA-4-ramanujan-nagell-residues-mod-42), [CA.4/ramanujan-nagell-one-per-class](#CA-4-ramanujan-nagell-one-per-class).

Source: [banwait-ramanujan-nagell-2026](https://arxiv.org/pdf/2604.09808v2), §1, p. 1 (Abstract). The theorem in the notation and hypotheses used here.

Source: [banwait-ramanujan-nagell-2026](https://arxiv.org/pdf/2604.09808v2), §2.8, p. 6. The assembly of the proof.

<a id="CA-4-powers-of-two-and-three-differing-by-one"></a>

### Levi ben Gershon's theorem: powers of 2 and 3 differing by 1

`ClassicalArithmeticCompletion:CA.4/powers-of-two-and-three-differing-by-one` · theorem.

The solutions (a, b) ∈ ℕ² of |2ᵃ − 3ᵇ| = 1 are (1, 0), (1, 1), (2, 1) and (3, 2); that is, the only pairs (2ᵃ, 3ᵇ) of consecutive integers are (2, 1), (2, 3), (4, 3) and (8, 9).

Hypotheses and conventions: a, b ∈ ℕ (exponent 0 allowed).

Further acceptance checks:

- This is the case {x, y} = {2, 3} of Catalan's equation xᵖ − y^q = 1, which (with exponents ≥ 2) has only 3² − 2³ = 1; Catalan–Mihăilescu in general is not planned here (see the gaps).
- The equation 2ᵃ − 3ᵇ = −1 with a = 3, b = 2 is the only solution with both exponents at least 2.

Proof sketch:

1. 3ᵇ − 2ᵃ = 1: if a = 0 then 3ᵇ = 2, impossible; if a = 1 then b = 1. If a ≥ 2 then 3ᵇ ≡ 1 (mod 4), so b is even, b = 2c, and (3ᶜ − 1)(3ᶜ + 1) = 2ᵃ; the factors are powers of 2 differing by 2, so 3ᶜ − 1 = 2, c = 1, b = 2, a = 3.
2. 2ᵃ − 3ᵇ = 1: if b = 0 then a = 1. If b ≥ 1 then 2ᵃ ≡ 1 (mod 3), so a is even, a = 2c, and (2ᶜ − 1)(2ᶜ + 1) = 3ᵇ; the factors are powers of 3 differing by 2, so 2ᶜ − 1 = 1, c = 1, a = 2, b = 1.
3. Levi's own argument works modulo 8: 3ᵇ ≡ 1 or 3 (mod 8) according to the parity of b, while 2ᵃ ≡ 0 (mod 8) for a ≥ 3; the only surviving infinite case is 3^{2k} − 1 = 2ᵃ, treated as above.

Direct prerequisites: .

Source: [simonson-gersonides-2005](https://u.cs.biu.ac.il/~tsaban/Pdf/MathofLevi.pdf), Highlights item 5 (p. 3), De Numeris Harmonicis and proof sketch (pp. 6–7). The statement; the source sketches Levi's mod-8 argument, reproduced in the third proof step.

Source: [leonetti-catalan-2013](https://arxiv.org/pdf/1305.0892v4), §1, p. 1. The same equations in the context of Catalan's conjecture.

<a id="CA-4-numerical-semigroup"></a>

### Numerical semigroups, their gaps, genus and Frobenius number

`ClassicalArithmeticCompletion:CA.4/numerical-semigroup` · definition.

A numerical semigroup is an additive submonoid S of ℕ whose complement G(S) = ℕ ∖ S (the gaps) is finite; equivalently the subgroup of ℤ generated by S contains 1 (Assi–García-Sánchez, Proposition 1). Its genus is g(S) = #G(S), its Frobenius number is F(S) = max G(S) ∈ ℤ with the convention F(ℕ) = −1, its conductor is C(S) = F(S) + 1, and its multiplicity m(S) is the least positive element of S.

Hypotheses and conventions: S is an AddSubmonoid of ℕ (so 0 ∈ S and S is closed under addition). The Frobenius number is integer-valued so that S = ℕ is covered (F = −1, g = 0).

API:

- `AddSubmonoid.IsNumericalSemigroup` (data): The predicate that (S : Set ℕ)ᶜ is finite.
- `AddSubmonoid.isNumericalSemigroup_iff_setGcd` (characterisation): S is a numerical semigroup ↔ Nat.setGcd S = 1 (Proposition 1, via Mathlib's Nat.exists_mem_closure_of_ge).
- `AddSubmonoid.numericalGaps` (data): G(S) = ℕ ∖ S as a Set ℕ; it is finite for a numerical semigroup.
- `AddSubmonoid.numericalGenus` (data): g(S) = #G(S).
- `AddSubmonoid.numericalFrobenius` (data): F(S) ∈ ℤ: the largest gap, or −1 if there are none.
- `AddSubmonoid.numericalMultiplicity` (data): m(S): the least positive element of S.
- `AddSubmonoid.mem_of_numericalFrobenius_lt` (relation): (x : ℤ) > F(S) → x ∈ S.
- `AddSubmonoid.numericalGenus_eq_zero_iff` (characterisation): g(S) = 0 ↔ S = ⊤ ↔ F(S) = −1.
- `AddSubmonoid.frobeniusNumber_numericalFrobenius` (compatibility): If S = AddSubmonoid.closure s ≠ ⊤, then Mathlib's FrobeniusNumber F(S).toNat s holds.
- `AddSubmonoid.isNumericalSemigroup_closure_pair_iff` (characterisation): ⟨a, b⟩ is a numerical semigroup ↔ gcd(a, b) = 1.

Unit tests:

- `numericalGenus_three_five` (computation): For S = ⟨3, 5⟩: G(S) = {1, 2, 4, 7}, g(S) = 4 and F(S) = 7.
- `numericalFrobenius_five_seven_nine` (computation): For S = ⟨5, 7, 9⟩: F(S) = 13 and g(S) = 8.
- `numericalFrobenius_top` (degenerate): For S = ℕ: g(S) = 0 and F(S) = −1.
- `not_isNumericalSemigroup_two_four` (non-example): ⟨2, 4⟩ is not a numerical semigroup.
- `numericalFrobenius_pair_compat` (compatibility): F(⟨3, 5⟩) = 3·5 − 3 − 5, agreeing with Mathlib's frobeniusNumber_pair.

Further acceptance checks:

- ⟨3, 5⟩ = {0, 3, 5, 6, 8, 9, 10, …}: gaps {1, 2, 4, 7}, g = 4, F = 7, C = 8, m = 3.
- ⟨5, 7, 9⟩: F = 13, g = 8 (the source's GAP example 15).
- ⟨2, 4⟩ is a submonoid but not a numerical semigroup (all odd numbers are gaps).

Proof sketch:

1. Define the predicate 'the complement of S is finite' on Mathlib's AddSubmonoid ℕ, and the invariants g, F, C, m from the finite set of gaps.
2. Proposition 1 (finite complement ⟺ gcd 1): if G(S) is finite, some s and s + 1 lie in S; conversely, if the elements of S have gcd 1, all large integers lie in S, which is Mathlib's Nat.exists_mem_closure_of_ge applied to S (a submonoid is the closure of itself).
3. Every x > F(S) lies in S, and F(S) ∉ S when S ≠ ℕ; the conductor is the least c with c + ℕ ⊆ S.
4. For S = ⟨s⟩ the submonoid generated by a set s, F(S) is the Frobenius number of Mathlib's FrobeniusNumber predicate whenever S ≠ ℕ.

Direct prerequisites: `mathlib:FrobeniusNumber`, `mathlib:Nat.exists_mem_closure_of_ge`, `mathlib:Nat.setGcd`, `mathlib:exists_frobeniusNumber_iff`.

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §1, p. 2, the definitions of numerical semigroup, gaps and genus. The definition; Proposition 1 gives the equivalent finite-complement form used here.

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §1, Proposition 1, p. 3. The characterisation taken as the definition.

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §1, p. 5, the definitions of Frobenius number and conductor. The Frobenius number and the conductor; the convention F(ℕ) = −1 pins the empty maximum.

Proof or interface frontier: Predicate plus gaps/genus/Frobenius/conductor/multiplicity are distinct definitions; conductor absentnative. Consumed finite-gap/conductor/least-positive suppliers require promoted nodes.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-apery-set"></a>

### The Apéry set of a numerical semigroup

`ClassicalArithmeticCompletion:CA.4/apery-set` · definition.

For a numerical semigroup S and n ∈ S ∖ {0}, Ap(S, n) = {s ∈ S : s − n ∉ S} (with s − n computed in ℤ, so every s < n in S belongs to it). It has exactly n elements, one in each residue class modulo n: Ap(S, n) = {w(0) = 0, w(1), …, w(n − 1)}, where w(i) is the least element of S congruent to i modulo n (Lemma 4).

Hypotheses and conventions: S a numerical semigroup; n ∈ S, n > 0.

API:

- `AddSubmonoid.aperySet` (data): Ap(S, n) = {s ∈ S | ¬(n ≤ s ∧ s − n ∈ S)} as a Set ℕ.
- `AddSubmonoid.mem_aperySet_iff` (characterisation): s ∈ Ap(S, n) ↔ s ∈ S ∧ ((s : ℤ) − n ∉ S).
- `AddSubmonoid.zero_mem_aperySet` (simp): 0 ∈ Ap(S, n).
- `AddSubmonoid.mem_aperySet_iff_isLeast` (characterisation): w ∈ Ap(S, n) ↔ w is the least element of S in its residue class modulo n.
- `AddSubmonoid.ncard_aperySet` (other): #Ap(S, n) = n for n ∈ S, n > 0.
- `AddSubmonoid.aperySet_mod_bijOn` (structure): w ↦ w mod n is a bijection from Ap(S, n) onto {0, …, n − 1}.

Unit tests:

- `aperySet_three_five` (computation): Ap(⟨3, 5⟩, 3) = {0, 5, 10}.
- `aperySet_five_nine_twentyone` (computation): Ap(⟨5, 9, 21⟩, 5) = {0, 9, 18, 21, 27}.
- `aperySet_top_one` (degenerate): Ap(ℕ, 1) = {0}.
- `ncard_aperySet_of_not_mem` (non-example): For S = ⟨5, 9, 21⟩ and 6 ∉ S, the set {s ∈ S | s − 6 ∉ S} has 9 elements, not 6: the hypothesis n ∈ S is needed for #Ap = n.

Further acceptance checks:

- Ap(⟨3, 5⟩, 3) = {0, 5, 10}; Ap(⟨5, 9, 21⟩, 5) = {0, 9, 18, 21, 27} (the source's GAP example 5).
- For n ∉ S the same formula gives a set of a different size: for S = ⟨5, 9, 21⟩ and n = 6 it has 9 elements.

Proof sketch:

1. Define Ap(S, n) as a subset of ℕ.
2. Each w(i) exists because S contains all large integers; w(i) ∈ Ap(S, n) since w(i) − n is smaller and congruent to i.
3. Two elements of Ap(S, n) are never congruent modulo n (the larger minus a multiple of n would lie in S), so Ap(S, n) = {w(0), …, w(n − 1)} and #Ap(S, n) = n.

Direct prerequisites: [CA.4/numerical-semigroup](#CA-4-numerical-semigroup).

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §1, p. 3, the definition before Lemma 4. The definition.

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §1, Lemma 4, p. 3. The description by least representatives, from which #Ap(S, n) = n.

Proof or interface frontier: Least-residue representatives, cardinality and residue bijection are nonroutine consumed APIs; split into own lemmas for178–187.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-apery-set-unique-decomposition"></a>

### Unique decomposition through the Apéry set

`ClassicalArithmeticCompletion:CA.4/apery-set-unique-decomposition` · lemma.

Let S be a numerical semigroup and n ∈ S ∖ {0}. Every s ∈ S can be written uniquely as s = kn + w with k ∈ ℕ and w ∈ Ap(S, n). Consequently S is generated by n and Ap(S, n) ∖ {0}, and is finitely generated.

Hypotheses and conventions: S numerical, n ∈ S, n > 0.

Further acceptance checks:

- In ⟨3, 5⟩ with n = 3: 13 = 1·3 + 10 and 10 ∈ Ap.

Proof sketch:

1. Existence: subtract n while the result stays in S; the process stops at an element of Ap(S, n).
2. Uniqueness: two decompositions give two elements of Ap(S, n) congruent modulo n, which are equal (apery-set).

Direct prerequisites: [CA.4/apery-set](#CA-4-apery-set).

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §1, Proposition 6 and Corollary 7, p. 4. The lemma; Corollary 7 is the finite generation.

Reconciled native contracts: `closure_insert_aperySet_eq`, `exists_finset_generators`.

Proof or interface frontier: Finite-generation consequence absentnative; split from unique-decomposition lemma.

Revision disposition: The missing or incomplete native consequences now have checked signatures: closure_insert_aperySet_eq, exists_finset_generators. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-4-selmer-frobenius-formula"></a>

### Selmer's formula for the Frobenius number

`ClassicalArithmeticCompletion:CA.4/selmer-frobenius-formula` · lemma.

Let S be a numerical semigroup and n ∈ S ∖ {0}. Then F(S) = max Ap(S, n) − n.

Hypotheses and conventions: S numerical, n ∈ S, n > 0 (for S = ℕ and n = 1: max Ap = 0 and F = −1).

Further acceptance checks:

- ⟨3, 5⟩: max Ap(S, 3) − 3 = 10 − 3 = 7 = F.
- ⟨5, 7, 9⟩: Ap(S, 5) = {0, 16, 7, 18, 9}, 18 − 5 = 13 = F.

Proof sketch:

1. max Ap(S, n) − n ∉ S by definition of Ap.
2. If x > max Ap(S, n) − n, write x + n = qn + i and let w(i) ∈ Ap(S, n) be the least element of S in the class i; x + n > w(i), so x + n = kn + w(i) with k ≥ 1 and x = (k − 1)n + w(i) ∈ S.

Direct prerequisites: [CA.4/apery-set](#CA-4-apery-set).

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §1, Proposition 12(i), p. 5. Part (i), with the source's proof.

<a id="CA-4-selmer-genus-formula"></a>

### Selmer's formula for the genus

`ClassicalArithmeticCompletion:CA.4/selmer-genus-formula` · lemma.

Let S be a numerical semigroup and n ∈ S ∖ {0}. Then g(S) = (1/n)Σ_{w∈Ap(S,n)} w − (n − 1)/2; equivalently 2n·g(S) = 2Σ_{w∈Ap(S,n)} w − n(n − 1).

Hypotheses and conventions: S numerical, n ∈ S, n > 0.

Further acceptance checks:

- ⟨5, 7, 9⟩: (0 + 16 + 7 + 18 + 9)/5 − 2 = 10 − 2 = 8 = g.
- ⟨3, 5⟩: (0 + 5 + 10)/3 − 1 = 4 = g.

Proof sketch:

1. Write the element of Ap(S, n) in the class i as w(i) = k_i n + i (0 ≤ i < n, k₀ = 0).
2. An integer x ≡ i (mod n), x ≥ 0, lies in S iff x ≥ w(i); so the gaps in the class i are i, i + n, …, i + (k_i − 1)n, k_i of them.
3. g(S) = Σ k_i = (1/n)Σ(k_i n + i) − (1/n)Σ i = (1/n)Σ w − (n − 1)/2.

Direct prerequisites: [CA.4/apery-set](#CA-4-apery-set).

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §1, Proposition 12(ii), p. 5. Part (ii), with the source's proof.

<a id="CA-4-sylvester-gap-count"></a>

### Sylvester's formulas for two generators

`ClassicalArithmeticCompletion:CA.4/sylvester-gap-count` · theorem.

Let a, b ≥ 1 be coprime and S = ⟨a, b⟩. Then Ap(S, a) = {0, b, 2b, …, (a − 1)b}, F(S) = ab − a − b and g(S) = (a − 1)(b − 1)/2 = (F(S) + 1)/2.

Hypotheses and conventions: a, b ≥ 1, gcd(a, b) = 1 (for a = 1 or b = 1, S = ℕ, F = −1 and g = 0, consistently with the formulas).

Further acceptance checks:

- ⟨3, 5⟩: F = 7, g = 4; ⟨4, 9⟩: F = 23, g = 12.
- F agrees with Mathlib's frobeniusNumber_pair; the gap count g = (a − 1)(b − 1)/2 is new.

Proof sketch:

1. The multiples jb, 0 ≤ j < a, are pairwise incongruent modulo a (gcd(a, b) = 1), and jb − a ∉ S because a representation jb − a = ua + vb with u, v ≥ 0 would force vb < jb, so 0 ≤ v < j < a, together with v ≡ j (mod a), which is impossible. So Ap(S, a) = {jb : 0 ≤ j < a}.
2. selmer-frobenius-formula gives F(S) = (a − 1)b − a.
3. selmer-genus-formula gives g(S) = (1/a)·b·a(a − 1)/2 − (a − 1)/2 = (a − 1)(b − 1)/2.

Direct prerequisites: [CA.4/apery-set](#CA-4-apery-set), [CA.4/selmer-frobenius-formula](#CA-4-selmer-frobenius-formula), [CA.4/selmer-genus-formula](#CA-4-selmer-genus-formula), `mathlib:frobeniusNumber_pair`.

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §1, Example 13, p. 6. The Apéry set and the Frobenius number; part (ii), the genus, is printed with a misprint recorded as sourceIssue ClassicalArithmeticCompletion/E504.

<a id="CA-4-genus-frobenius-inequality"></a>

### The genus is at least half the conductor

`ClassicalArithmeticCompletion:CA.4/genus-frobenius-inequality` · lemma.

For every numerical semigroup S, 2g(S) ≥ F(S) + 1. More precisely n(S) + g(S) = F(S) + 1 and n(S) ≤ g(S), where n(S) = #{s ∈ S : s ≤ F(S)}.

Hypotheses and conventions: S numerical (for S = ℕ both sides are 0).

Further acceptance checks:

- ⟨5, 7, 9⟩: 2·8 = 16 ≥ 14.
- ⟨3, 5⟩: 2·4 = 8 = F + 1 (equality: symmetric).

Proof sketch:

1. {0, …, F(S)} is the disjoint union of the gaps and the elements of S below F(S), so n(S) + g(S) = F(S) + 1.
2. s ↦ F(S) − s maps {s ∈ S : s ≤ F(S)} injectively into the gaps, because s, F(S) − s ∈ S would give F(S) ∈ S.

Direct prerequisites: [CA.4/numerical-semigroup](#CA-4-numerical-semigroup).

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §1, Lemma 14, p. 6. The lemma with its proof.

Reconciled native contracts: `numericalFrobenius_reflects_to_gap`, `numericalFrobenius_card_partition`.

Proof or interface frontier: Native only inequality; injective reflection and cardinal partition consumed184 need their own signatures/nodes.

Revision disposition: The missing or incomplete native consequences now have checked signatures: numericalFrobenius_reflects_to_gap, numericalFrobenius_card_partition. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-4-symmetric-numerical-semigroup"></a>

### Symmetric numerical semigroups

`ClassicalArithmeticCompletion:CA.4/symmetric-numerical-semigroup` · definition.

A numerical semigroup S is symmetric if for every x ∈ ℤ with x ∉ S (negative integers are never in S) one has F(S) − x ∈ S. Equivalently, for 0 ≤ x ≤ F(S) exactly one of x and F(S) − x lies in S.

Hypotheses and conventions: S numerical; ℕ counts as symmetric (F = −1). The source defines symmetric as 'irreducible with F(S) odd' and proves the equivalence with this condition in Proposition 43(i); the condition is taken as the definition here.

API:

- `AddSubmonoid.IsSymmetricNumerical` (data): The predicate ∀ x : ℤ, x ∉ S → F(S) − x ∈ S (for S numerical).
- `AddSubmonoid.isSymmetricNumerical_iff` (characterisation): S symmetric ↔ ∀ x : ℕ, x ≤ F(S) → (x ∈ S ↔ F(S) − x ∉ S).
- `AddSubmonoid.IsSymmetricNumerical.odd_frobenius` (relation): If S is symmetric and S ≠ ℕ then F(S) is odd.
- `AddSubmonoid.isSymmetricNumerical_top` (simp): ℕ is symmetric.

Unit tests:

- `isSymmetricNumerical_three_five` (computation): ⟨3, 5⟩ is symmetric.
- `not_isSymmetricNumerical_three_four_five` (non-example): ⟨3, 4, 5⟩ is not symmetric: 1 ∉ S and F − 1 = 1 ∉ S.
- `not_isSymmetricNumerical_five_seven_nine` (non-example): ⟨5, 7, 9⟩ is not symmetric.
- `isSymmetricNumerical_top_test` (degenerate): ℕ (F = −1) is symmetric.

Further acceptance checks:

- ⟨3, 5⟩ is symmetric; ⟨3, 4, 5⟩ (gaps {1, 2}, F = 2) is not; ⟨5, 7, 9⟩ is not (2g = 16 ≠ 14).

Proof sketch:

1. Define the predicate on the numerical semigroup S, testing x ∈ ℤ against (S : Set ℕ) through the cast.
2. For x < 0 the condition says F(S) − x ∈ S, which holds as F(S) − x > F(S); for x > F(S) it is vacuous; so only 0 ≤ x ≤ F(S) matters, and there at most one of x, F(S) − x is in S (else F(S) ∈ S).
3. A symmetric S ≠ ℕ has F(S) odd: if F(S) = 2y, then y ∉ S and F(S) − y = y ∉ S.

Direct prerequisites: [CA.4/numerical-semigroup](#CA-4-numerical-semigroup).

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §2, Proposition 43(i), p. 12. The characterisation taken as the definition.

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §2, p. 11, the definition after Theorem 40. The source's definition, equivalent by Proposition 43(i).

<a id="CA-4-symmetric-iff-genus"></a>

### Symmetric semigroups are those of least genus

`ClassicalArithmeticCompletion:CA.4/symmetric-iff-genus` · theorem.

A numerical semigroup S is symmetric if and only if 2g(S) = F(S) + 1.

Hypotheses and conventions: S numerical.

Further acceptance checks:

- ⟨3, 5⟩: 2·4 = 8 = 7 + 1; ⟨5, 7, 9⟩: 16 ≠ 14.
- The source proves this through irreducibility (Theorem 40, Proposition 43); with the classical definition the proof is the counting argument above.

Proof sketch:

1. By genus-frobenius-inequality, s ↦ F(S) − s is an injection from {s ∈ S : s ≤ F(S)} into the gaps, and n(S) + g(S) = F(S) + 1.
2. S is symmetric iff this injection is onto the gaps (a gap x has F(S) − x ∈ S, and F(S) − x ≤ F(S) as x ≥ 0), iff n(S) = g(S), iff 2g(S) = F(S) + 1.

Direct prerequisites: [CA.4/symmetric-numerical-semigroup](#CA-4-symmetric-numerical-semigroup), [CA.4/genus-frobenius-inequality](#CA-4-genus-frobenius-inequality).

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §2, Corollary 44(i), pp. 12–13. The theorem, part (i).

<a id="CA-4-two-generator-semigroup-symmetric"></a>

### Two-generator numerical semigroups are symmetric

`ClassicalArithmeticCompletion:CA.4/two-generator-semigroup-symmetric` · lemma.

For coprime a, b ≥ 1, the numerical semigroup ⟨a, b⟩ is symmetric.

Hypotheses and conventions: gcd(a, b) = 1.

Further acceptance checks:

- ⟨3, 5⟩, ⟨4, 9⟩, ⟨2, 2k + 1⟩ are symmetric.

Proof sketch:

1. sylvester-gap-count gives 2g = (a − 1)(b − 1) = F + 1; apply symmetric-iff-genus.

Direct prerequisites: [CA.4/sylvester-gap-count](#CA-4-sylvester-gap-count), [CA.4/symmetric-iff-genus](#CA-4-symmetric-iff-genus).

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §2, Corollary 45, p. 13. The lemma (embedding dimension 2 means two minimal generators, necessarily coprime).

<a id="CA-4-apery-set-summand-closed"></a>

### Apéry sets are closed under summands

`ClassicalArithmeticCompletion:CA.4/apery-set-summand-closed` · lemma.

Let S be a numerical semigroup and n ∈ S ∖ {0}. If x, y ∈ S and x + y ∈ Ap(S, n), then x, y ∈ Ap(S, n).

Hypotheses and conventions: S numerical, n ∈ S, n > 0.

Further acceptance checks:

- In ⟨3, 5⟩ with n = 3: 10 = 5 + 5 ∈ Ap and 5 ∈ Ap.

Proof sketch:

1. If y − n ∈ S then x + y − n ∈ S, so x + y ∉ Ap(S, n); similarly for x.

Direct prerequisites: [CA.4/apery-set](#CA-4-apery-set).

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §2, Lemma 46, p. 13. The lemma, restated in this roadmap’s notation.

<a id="CA-4-symmetric-iff-apery-pairing"></a>

### The Apéry-set criterion for symmetry

`ClassicalArithmeticCompletion:CA.4/symmetric-iff-apery-pairing` · theorem.

Let S be a numerical semigroup, n ∈ S ∖ {0}, and Ap(S, n) = {0 = a₀ < a₁ < ⋯ < a_{n−1}}. Then S is symmetric if and only if a_i + a_{n−1−i} = a_{n−1} for all i.

Hypotheses and conventions: S numerical, n ∈ S, n > 0.

Further acceptance checks:

- ⟨3, 5⟩, n = 3: Ap = {0, 5, 10} and 0 + 10 = 5 + 5 = 10.
- ⟨3, 4, 5⟩, n = 3: Ap = {0, 4, 5} and 4 + 4 ≠ 5, so it is not symmetric.

Proof sketch:

1. If S is symmetric: F(S) = a_{n−1} − n (selmer-frobenius-formula); a_i − n ∉ S gives a_{n−1} − a_i = F(S) − (a_i − n) ∈ S, and apery-set-summand-closed puts it in Ap(S, n); the map a_i ↦ a_{n−1} − a_i is an order-reversing bijection of Ap(S, n), so it sends a_i to a_{n−1−i}.
2. Conversely, if the pairing holds, every w ∈ Ap(S, n) satisfies a_{n−1} − w ∈ S. For a gap x, choose w ∈ Ap(S, n) with w ≡ x (mod n); then x = w − kn with k ≥ 1 and F(S) − x = (a_{n−1} − w) + (k − 1)n ∈ S. So S is symmetric.

Direct prerequisites: [CA.4/apery-set-summand-closed](#CA-4-apery-set-summand-closed), [CA.4/selmer-frobenius-formula](#CA-4-selmer-frobenius-formula), [CA.4/symmetric-numerical-semigroup](#CA-4-symmetric-numerical-semigroup), [CA.4/apery-set-unique-decomposition](#CA-4-apery-set-unique-decomposition).

Source: [assi-garcia-sanchez-numerical-semigroups-2014](https://arxiv.org/pdf/1411.6093v1), §2, Proposition 47, p. 13. The theorem; the source's converse goes through pseudo-Frobenius numbers (Propositions 21–22), replaced here by the direct argument of the second proof step.

<a id="CA-4-egyptian-fraction-expansion"></a>

### Egyptian fraction expansions

`ClassicalArithmeticCompletion:CA.4/egyptian-fraction-expansion` · definition.

An Egyptian fraction expansion of a rational number r is a finite set D of positive integers with Σ_{d∈D} 1/d = r. (The denominators are distinct because D is a set; a representation with repetitions is not an Egyptian expansion.)

Hypotheses and conventions: D a finite set of positive integers; r ∈ ℚ.

API:

- `IsEgyptianExpansion` (data): IsEgyptianExpansion r D ↔ 0 ∉ D ∧ Σ_{d∈D} (1 : ℚ)/d = r.
- `isEgyptianExpansion_empty_iff` (simp): IsEgyptianExpansion r ∅ ↔ r = 0.
- `isEgyptianExpansion_singleton` (simp): For n ≠ 0, IsEgyptianExpansion (1/n) {n}.
- `IsEgyptianExpansion.union` (relation): Expansions of r and s with disjoint denominator sets combine to an expansion of r + s.
- `IsEgyptianExpansion.split` (relation): If n > 1, n ∈ D, n + 1 ∉ D and n(n + 1) ∉ D, then replacing n by n + 1 and n(n + 1) gives another expansion of the same r.
- `IsEgyptianExpansion.pos` (other): If D is nonempty then r > 0.

Unit tests:

- `isEgyptianExpansion_five_sixths` (computation): IsEgyptianExpansion (5/6) {2, 3}.
- `isEgyptianExpansion_one` (computation): IsEgyptianExpansion 1 {2, 3, 6}.
- `isEgyptianExpansion_zero_iff` (degenerate): IsEgyptianExpansion 0 D ↔ D = ∅.
- `not_isEgyptianExpansion_two_thirds_three` (non-example): IsEgyptianExpansion (2/3) {3} is false: 1/3 ≠ 2/3 (the multiset {3, 3} is not a set).
- `isEgyptianExpansion_compat_sum` (compatibility): IsEgyptianExpansion r D ↔ 0 ∉ D ∧ Σ_{d∈D} ((d : ℚ))⁻¹ = r, the form of Mathlib's Finset.sum of inverses.
- `egyptian_split_one_failure` (non-example): IsEgyptianExpansion 1 {1}, but replacing 1 by the set {2,2}={2} gives only 1/2; the split requires n>1.

Further acceptance checks:

- 5/6 = 1/2 + 1/3; 2/3 = 1/2 + 1/6; 1 = 1/2 + 1/3 + 1/6.
- 2/3 = 1/3 + 1/3 is not an Egyptian expansion.

Proof sketch:

1. Define the predicate on (r, D) with D a Finset ℕ not containing 0.
2. Basic calculus: the empty set expands 0 and only 0; {n} expands 1/n; a disjoint union of expansions of r and s expands r + s; for n > 1, the splitting identity 1/n = 1/(n + 1) + 1/(n(n + 1)) replaces one denominator by two larger ones.

Direct prerequisites: `mathlib:Rat.num_div_den`.

Source: [chun-egyptian-2011](https://math.osu.edu/sites/math.osu.edu/files/Egyptian_Fractions.pdf), §1.1, p. 1. The definition, with distinct denominators.

Source: [chun-egyptian-2011](https://math.osu.edu/sites/math.osu.edu/files/Egyptian_Fractions.pdf), §1.1, p. 1. Why D is a set.

Proof or interface frontier: Split API false for n1,D{1}: new set{2}sum1/2.

Revision disposition: The n>1 hypothesis and the n=1 failure test are present in packet and native file. No further mathematical correction is needed for that counterexample; the target API remains admitted.

<a id="CA-4-greedy-egyptian-step"></a>

### The greedy step decreases the numerator

`ClassicalArithmeticCompletion:CA.4/greedy-egyptian-step` · lemma.

Let r = m/n with 0 < m < n coprime, and c = ⌈n/m⌉ ≥ 2. Then r − 1/c = m′/(nc) with m′ = (−n) mod m, so 0 ≤ m′ < m; and if m′ > 0, then ⌈nc/m′⌉ > c, i.e. the next greedy denominator is strictly larger.

Hypotheses and conventions: 0 < m < n, gcd(m, n) = 1 (the lowest-terms numerator of r − 1/c is at most m′).

Further acceptance checks:

- 5/31: c = 7, 5/31 − 1/7 = 4/217 (numerator 4 < 5).
- 2/(2k + 1): c = k + 1 and the remainder is 1/((k + 1)(2k + 1)), a unit fraction.

Proof sketch:

1. mc − n = m⌈n/m⌉ − n = (−n) mod m ∈ [0, m), and r − 1/c = (mc − n)/(nc).
2. Since c − 1 < n/m, r − 1/c < 1/(c − 1) − 1/c = 1/(c(c − 1)) ≤ 1/c, so the next greedy denominator ⌈1/(r − 1/c)⌉ exceeds c(c − 1) ≥ c.

Direct prerequisites: .

Source: [chun-egyptian-2011](https://math.osu.edu/sites/math.osu.edu/files/Egyptian_Fractions.pdf), §1.4.1, p. 2. The numerator decrease; the identity m/n = 1/⌈n/m⌉ + ((−n) mod m)/(n⌈n/m⌉) is displayed just before.

Source: [errthum-sylvester-2015](https://arxiv.org/pdf/1508.01503v1), §3, Theorem 3.1, p. 6. The division step b = mc − m′ with 0 ≤ m′ < m used in the first proof step.

<a id="CA-4-greedy-egyptian-algorithm"></a>

### The Fibonacci–Sylvester greedy algorithm

`ClassicalArithmeticCompletion:CA.4/greedy-egyptian-algorithm` · construction.

For a rational 0 < r ≤ 1, the greedy expansion is the list c₁ < c₂ < ⋯ < c_k defined by c₁ = ⌈1/r⌉ and c_{j+1} = ⌈1/(r − Σ_{i≤j} 1/c_i)⌉ as long as the remainder is positive. It terminates after k ≤ num(r) steps (num(r) the numerator in lowest terms), its denominators are strictly increasing, and Σ_{i≤k} 1/c_i = r; so {c₁, …, c_k} is an Egyptian expansion of r.

Hypotheses and conventions: 0 < r ≤ 1 rational (r = 1 gives the one-term list [1]).

API:

- `egyptianGreedy` (data): egyptianGreedy r : List ℕ, the greedy denominators of r (empty for r ≤ 0).
- `egyptianGreedy_sum` (characterisation): For 0 < r ≤ 1: Σ_{c ∈ egyptianGreedy r} 1/c = r.
- `egyptianGreedy_sorted` (structure): For r ≤ 1, egyptianGreedy r is strictly increasing (it is empty when r ≤ 0).
- `egyptianGreedy_length_le` (other): (egyptianGreedy r).length ≤ r.num.
- `egyptianGreedy_head` (simp): For 0 < r ≤ 1 the first entry is ⌈1/r⌉.
- `egyptianGreedy_isEgyptianExpansion` (compatibility): IsEgyptianExpansion r (egyptianGreedy r).toFinset for 0 < r ≤ 1.

Unit tests:

- `egyptianGreedy_five_thirtyone` (computation): egyptianGreedy (5/31) = [7, 55, 3979, 23744683, 1127619917796295].
- `egyptianGreedy_four_thirteen` (computation): egyptianGreedy (4/13) = [4, 18, 468].
- `egyptianGreedy_unit` (degenerate): egyptianGreedy (1/n) = [n] for n ≥ 1.
- `egyptianGreedy_not_shortest` (non-example): egyptianGreedy (5/31) has length 5, although 5/31 = 1/7 + 1/62 + 1/434 has three terms.
- `egyptianGreedy_two_sevenths` (computation): egyptianGreedy (2/7) = [4, 28].
- `egyptianGreedy_two_not_sorted` (non-example): egyptianGreedy 2 = [1,1], so sortedness requires r≤1.

Further acceptance checks:

- 5/31 ↦ [7, 55, 3979, 23744683, 1127619917796295] (five terms, the maximum num(r) = 5).
- 4/13 ↦ [4, 18, 468]; 2/7 ↦ [4, 28]; 1/n ↦ [n].
- The greedy expansion need not be the shortest: 5/31 = 1/7 + 1/62 + 1/434 has three terms.

Proof sketch:

1. Use egyptianGreedyAux with fuel r.num.natAbs, as in Suggested.lean. At a positive proper remainder, greedy-egyptian-step strictly reduces its reduced numerator; at zero the list stops. Induct on the fuel to show it cannot expire before the remainder is zero. For r=1 the single step is [1].
2. Termination with at most num(r) terms follows from the strict decrease; the sum is r by telescoping; the denominators increase strictly by greedy-egyptian-step.

Direct prerequisites: [CA.4/greedy-egyptian-step](#CA-4-greedy-egyptian-step), [CA.4/egyptian-fraction-expansion](#CA-4-egyptian-fraction-expansion).

Source: [errthum-sylvester-2015](https://arxiv.org/pdf/1508.01503v1), §3, Algorithm 3.2 and Theorem 3.3, p. 7. Termination and the sum identity, stated in the source with a reference for the computation.

Source: [chun-egyptian-2011](https://math.osu.edu/sites/math.osu.edu/files/Egyptian_Fractions.pdf), §1.4.1, p. 2. The construction, with the worked example 5/31.

Source: [chun-egyptian-2011](https://math.osu.edu/sites/math.osu.edu/files/Egyptian_Fractions.pdf), §1.4.2, p. 3. The bound k ≤ num(r) (the source's 'x' is a misprint for 'm').

Proof or interface frontier: Native unconditional sortedness false for r2: [1,1]. Construction plus termination/sum/sortedness/length and consumed head need lemma-level nodes.

Revision disposition: Native sortedness assumes r≤1, and the r=2 test retains [1,1]. Align the implementation sketch with the actual fuel recursion on r.num.natAbs, rather than assert a different well-founded definition.

<a id="CA-4-positive-rational-egyptian-expansion"></a>

### Every positive rational number is a finite sum of distinct unit fractions

`ClassicalArithmeticCompletion:CA.4/positive-rational-egyptian-expansion` · theorem.

For every rational r > 0 there is a finite set D of positive integers with Σ_{d∈D} 1/d = r.

Hypotheses and conventions: r ∈ ℚ, r > 0.

Further acceptance checks:

- r = 2: H₃ = 11/6 ≤ 2 < H₄, s = 1/6, D = {1, 2, 3, 6}.
- r = 5/2: H₆ = 49/20 ≤ 5/2 < H₇, s = 1/20, D = {1, 2, 3, 4, 5, 6, 20}.

Proof sketch:

1. The harmonic series diverges (Mathlib's Real.tendsto_sum_range_one_div_nat_succ_atTop), so there is a largest N ≥ 0 with H_N = Σ_{d=1}^{N} 1/d ≤ r.
2. If H_N = r, take D = {1, …, N}. Otherwise 0 < s = r − H_N < 1/(N + 1), so the greedy expansion of s (greedy-egyptian-algorithm) has first denominator ⌈1/s⌉ > N + 1 and increasing denominators, all larger than N.
3. D = {1, …, N} ∪ egyptianGreedy s is a disjoint union, and its reciprocal sum is r.

Direct prerequisites: [CA.4/greedy-egyptian-algorithm](#CA-4-greedy-egyptian-algorithm), [CA.4/egyptian-fraction-expansion](#CA-4-egyptian-fraction-expansion), `mathlib:Real.tendsto_sum_range_one_div_nat_succ_atTop`.

Source: [bloom-unit-fractions-2023](https://arxiv.org/pdf/2305.02689v1), Introduction, p. 1. The theorem as stated in the source's introduction ('such a decomposition' of a positive rational into distinct unit fractions); the proof steps give the elementary argument, with the harmonic series handling r ≥ 1.

<a id="CA-4-sylvester-sequence"></a>

### Sylvester's sequence

`ClassicalArithmeticCompletion:CA.4/sylvester-sequence` · definition.

Sylvester's sequence is s₀ = 2, s_{k+1} = s_k² − s_k + 1; equivalently s_{k+1} = s₀s₁⋯s_k + 1. Its terms are 2, 3, 7, 43, 1807, 3263443, ….

Hypotheses and conventions: Indexing from 0 (Nathanson indexes from 1).

API:

- `sylvesterSeq` (data): s : ℕ → ℕ, s 0 = 2, s (k+1) = s k ^ 2 − s k + 1.
- `sylvesterSeq_succ_eq_prod` (characterisation): s (k+1) = ∏_{j<k+1} s j + 1.
- `sylvesterSeq_strictMono` (other): s is strictly increasing.
- `sylvesterSeq_coprime` (relation): s i and s j are coprime for i ≠ j.
- `sylvesterSeq_sub_one_ge` (other): For k ≥ 1, s k − 1 ≥ 2^(2^(k−1)).

Unit tests:

- `sylvesterSeq_values` (computation): s 0 = 2, s 1 = 3, s 2 = 7, s 3 = 43, s 4 = 1807.
- `sylvesterSeq_zero_test` (degenerate): s 0 = 2.
- `sylvesterSeq_prod_compat` (compatibility): s 4 = s 0 · s 1 · s 2 · s 3 + 1.
- `sylvesterSeq_not_linear` (non-example): s 3 = 43 ≠ 2·7 + 1: the recursion is multiplicative in all earlier terms, not in the last one only.

Further acceptance checks:

- s₄ = 1807 = 2·3·7·43 + 1.
- The terms are pairwise coprime (s_{k+1} ≡ 1 modulo every earlier term).

Proof sketch:

1. Define s by recursion; the product form follows by induction from s_{k+1} − 1 = s_k(s_k − 1) = s_k(s₀⋯s_{k−1}).
2. Growth: s_{k+1} − 1 = s_k(s_k − 1) ≥ (s_k − 1)², so s_k − 1 ≥ 2^{2^{k−1}} for k ≥ 1 (doubly exponential growth).

Direct prerequisites: .

Source: [nathanson-egyptian-2022](https://arxiv.org/pdf/2202.00191v2), §1, p. 2, equation (4). The definition, shifted to start at index 0.

Source: [chun-egyptian-2011](https://math.osu.edu/sites/math.osu.edu/files/Egyptian_Fractions.pdf), §1.5.2, p. 5. The quadratic recursion, indexed from 0 as here.

Proof or interface frontier: Promote product/growth APIs consumed193; definition itself sound.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-sylvester-egyptian-identity"></a>

### The Egyptian fraction identity of Sylvester's sequence

`ClassicalArithmeticCompletion:CA.4/sylvester-egyptian-identity` · theorem.

For every k ≥ 0, Σ_{j<k} 1/s_j = 1 − 1/(s_k − 1). Consequently Σ_j 1/s_j = 1, and s_k is the greedy underapproximation choice for the remainder: s_k = ⌊1/(1 − Σ_{j<k} 1/s_j)⌋ + 1.

Hypotheses and conventions: s = sylvesterSeq.

Further acceptance checks:

- k = 4: 1/2 + 1/3 + 1/7 + 1/43 = 1805/1806 = 1 − 1/1806.
- This is the case p = q = 1 of Nathanson's Theorem 1.

Proof sketch:

1. 1/s_k = 1/(s_k − 1) − 1/(s_{k+1} − 1), because s_{k+1} − 1 = s_k(s_k − 1); sum telescopically from 1/(s₀ − 1) = 1.
2. The remainder 1 − Σ_{j<k} 1/s_j = 1/(s_k − 1), and ⌊s_k − 1⌋ + 1 = s_k.

Direct prerequisites: [CA.4/sylvester-sequence](#CA-4-sylvester-sequence).

Source: [nathanson-egyptian-2022](https://arxiv.org/pdf/2202.00191v2), §1, Theorem 1, p. 3. With p = q = 1 the theorem gives a_{k+1} = ∏_{i≤k} a_i + 1 and 1 = Σ_{i≤k} 1/a_i + 1/∏_{i≤k} a_i, which is the identity.

Source: [nathanson-egyptian-2022](https://arxiv.org/pdf/2202.00191v2), §1, Corollary 1, p. 4. The greedy clause.

Reconciled native contracts: `hasSum_one_div_sylvesterSeq`, `sylvesterSeq_strict_greedy`.

Proof or interface frontier: Infinite sum and greedy-underestimate clauses absentnative; split finite telescoping, convergence and strict-greedy characterization.

Revision disposition: The missing or incomplete native consequences now have checked signatures: hasSum_one_div_sylvesterSeq, sylvesterSeq_strict_greedy. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-4-primitive-zero-of-a-form"></a>

### Primitive integer zeros of a form

`ClassicalArithmeticCompletion:CA.4/primitive-zero-of-a-form` · definition.

Let F ∈ ℤ[x₀, …, x_n] be homogeneous of degree e ≥ 1. A primitive zero of F is x ∈ ℤ^{n+1} with F(x) = 0 and gcd(x₀, …, x_n) = 1.

Hypotheses and conventions: F homogeneous of degree ≥ 1 (for the scaling API); the definition itself makes sense for any F.

API:

- `IsPrimitiveZero` (data): IsPrimitiveZero F x ↔ eval x F = 0 ∧ Finset.univ.gcd x = 1.
- `IsPrimitiveZero.neg` (relation): IsPrimitiveZero F x → IsPrimitiveZero F (−x) (F homogeneous).
- `exists_isPrimitiveZero_smul` (constructor): For F homogeneous and x ≠ 0 with F(x) = 0, x = g·y with g = gcd(x) ≥ 1 and IsPrimitiveZero F y.
- `exists_isPrimitiveZero_of_rat` (constructor): For F homogeneous and a nonzero rational zero ξ ∈ ℚ^{n+1}, there are a primitive zero y and λ ∈ ℚ with ξ = λ·y.
- `IsPrimitiveZero.ne_zero` (other): A primitive zero is nonzero.
- `isPrimitiveZero_iff_pythagorean` (compatibility): For F = x₀² + x₁² − x₂²: IsPrimitiveZero F (a, b, c) ↔ PythagoreanTriple a b c ∧ gcd(a, b, c) = 1 (Mathlib's PythagoreanTriple).

Unit tests:

- `isPrimitiveZero_three_four_five` (computation): (3, 4, 5) is a primitive zero of x₀² + x₁² − x₂².
- `not_isPrimitiveZero_six_eight_ten` (non-example): (6, 8, 10) is a zero of x₀² + x₁² − x₂² but not a primitive zero.
- `not_isPrimitiveZero_zero` (degenerate): (0, 0, 0) is not a primitive zero of any F.
- `isPrimitiveZero_pythagorean_compat` (compatibility): (5, 12, 13) is a primitive zero of x₀² + x₁² − x₂² and PythagoreanTriple 5 12 13 holds.

Further acceptance checks:

- (3, 4, 5) is a primitive zero of x² + y² − z²; (6, 8, 10) is a zero but not primitive; (0, 0, 0) is not primitive.

Proof sketch:

1. Define the predicate F(x) = 0 ∧ gcd = 1 on ℤ^{n+1}, with the gcd of Mathlib's Finset.gcd over the coordinates.
2. Homogeneity gives F(λx) = λᵉF(x), so every nonzero integer zero is g·x for a primitive zero x and g = gcd ≥ 1, and every nonzero rational zero is a rational multiple of a primitive zero (clear denominators, then divide by the gcd); −x is primitive when x is.

Direct prerequisites: `mathlib:MvPolynomial.IsHomogeneous`, `mathlib:MvPolynomial.eval`, `mathlib:Finset.gcd`.

Source: [conrad-descent-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/descent.pdf), Corollary 3.3, proof, p. 6. Clearing denominators to pass from rational to integral solutions, the second proof step.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, Annals printed p. 372. The primitive representative of a rational point, which the source then feeds into the quartic descent.

Proof or interface frontier: Promote primitive normalization and denominator clearing consumed195. Source quartic equation x4+y4=z2 is weighted homogeneous, not an instance of ordinary homogeneous projective hypersurface.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-primitive-zeros-and-rational-projective-points"></a>

### Primitive zeros are the rational points of the projective hypersurface, up to sign

`ClassicalArithmeticCompletion:CA.4/primitive-zeros-and-rational-projective-points` · theorem.

Let F ∈ ℤ[x₀, …, x_n] be homogeneous of degree ≥ 1 and V(F) ⊆ ℙⁿ_ℚ its zero set. The map x ↦ [x] from primitive zeros of F to ℚ-points of V(F) (Mathlib's Projectivization of ℚ^{n+1}) is surjective, and [x] = [y] iff y = ±x.

Hypotheses and conventions: F homogeneous of degree ≥ 1.

Further acceptance checks:

- For x² + y² − z²: the rational points of the conic correspond to the primitive Pythagorean triples up to sign.
- The correspondence is the interface through which an equation of genus ≥ 1 is handed to the rational-point owners without losing primitivity.

Proof sketch:

1. Well defined: F(x) = 0 is invariant under scaling by homogeneity, so the zero set in ℙⁿ(ℚ) is defined through any representative.
2. Surjective: a point [ξ] with ξ ∈ ℚ^{n+1} ∖ 0 has a primitive integral representative (exists_isPrimitiveZero_of_rat of primitive-zero-of-a-form).
3. Fibres: [x] = [y] means y = λx with λ ∈ ℚ^×; primitivity of both forces λ = ±1 (write λ = a/b in lowest terms; a divides every coordinate of y and b every coordinate of x).

Direct prerequisites: [CA.4/primitive-zero-of-a-form](#CA-4-primitive-zero-of-a-form), `mathlib:Projectivization`, `mathlib:Projectivization.mk`.

Source: [conrad-descent-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/descent.pdf), Corollary 3.3, p. 6. An instance of the transfer: the rational statement is proved from the primitive integral one by clearing denominators.

Source: [bennett-siksek-erdos-2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, Annals printed p. 372. The primitive representative of a rational point, unique up to sign once positivity is imposed.

Proof or interface frontier: Canonical map x↦[x] is not fixed in existential native statement; typed canonical constructor/nonzero rational vector bridge required. Ordinary/weighted homogeneity source match must be distinguished.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-local-solubility-of-a-primitive-zero"></a>

### A primitive zero is locally soluble everywhere

`ClassicalArithmeticCompletion:CA.4/local-solubility-of-a-primitive-zero` · lemma.

Let F ∈ ℤ[x₀, …, x_n] and let x be a primitive zero of F. Then for every prime p and every k ≥ 1, the reduction of x modulo pᵏ is a zero of F modulo pᵏ with some coordinate not divisible by p; x is a zero of F in ℤ_p^{n+1} with a unit coordinate for every p; and x is a nonzero real zero. Contrapositively, if for some p and k every zero of F modulo pᵏ has all coordinates divisible by p, then F has no primitive zero.

Hypotheses and conventions: F with integer coefficients; x primitive.

Further acceptance checks:

- x² − 5y² = 6z² (the homogenised x² − 5y² = 6): modulo 3, x² ≡ 2y² forces x ≡ y ≡ 0, and then 9 ∣ 6z² forces z ≡ 0 (mod 3); so there is no primitive zero, and x² − 5y² = 6 has no rational solution (Conrad, Example 6.3 and Remark 6.4).
- x² − 34y² = −z² has primitive zeros (5, 1, 3) over ℤ, although x² − 34y² = −1 has no integer solution: local and rational solubility do not give integral solutions of the dehomogenised equation.

Proof sketch:

1. Reduction is a ring homomorphism, so F(x) = 0 gives F(x mod pᵏ) = 0; gcd(x) = 1 gives a coordinate prime to p.
2. The inclusion ℤ → ℤ_p and ℤ → ℝ are ring homomorphisms; a coordinate prime to p is a unit in ℤ_p.

Direct prerequisites: [CA.4/primitive-zero-of-a-form](#CA-4-primitive-zero-of-a-form), `mathlib:ZMod`, `mathlib:PadicInt`, `mathlib:Int.castRingHom`.

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), §6, Example 6.3, p. 8. The local test with a zero that is not primitive modulo 3, the contrapositive clause.

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), §6, Remark 6.4, p. 8. The limit of the test: rational (primitive projective) solubility does not imply integral solubility of the affine equation.

Reconciled native contracts: `IsPrimitiveZero.locally_soluble`.

Proof or interface frontier: Finite local obstruction in example requires mod9, not onlymod3. Real nonzero clause omittednative.

Revision disposition: The missing or incomplete native consequences now have checked signatures: IsPrimitiveZero.locally_soluble. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-4-rational-points-of-y2-x3-plus-x"></a>

### Routing example: the rational points of y² = x³ + x

`ClassicalArithmeticCompletion:CA.4/rational-points-of-y2-x3-plus-x` · comparison.

Let E be the Weierstrass curve y² = x³ + x over ℚ (Mathlib's WeierstrassCurve with a₁ = a₂ = a₃ = a₆ = 0, a₄ = 1). Its only affine rational point is (0, 0); so E(ℚ) = {O, (0, 0)}. Conversely, this statement implies that x⁴ + y⁴ = z² has no solution in positive integers.

Hypotheses and conventions: Rational points in the sense of Mathlib's WeierstrassCurve.Affine.Equation over ℚ.

Further acceptance checks:

- The analogous statement for y² = x³ − x (points O, (0, 0), (±1, 0)) is the routing of fermat-right-triangle-theorem (Conrad, Corollary 3.19).
- This compares a CA.4 descent statement with Mathlib's Weierstrass-curve points, the carrier used by the elliptic-curve and rational-point owners (Tau Ceti's Mordell–Weil theorem WeierstrassCurve.Affine.fg_point_of_numberField is stated for these points).

Proof sketch:

1. Let (x, y) be a rational point with x ≠ 0; then y ≠ 0 and x > 0. Write x = a/b, y = c/d in lowest terms; b³c² = d²(a³ + ab²) forces b = t², d = t³ (the primitive representative of the point of weighted projective space).
2. Then c² = a(a² + t⁴) with a, a² + t⁴ coprime and positive, so a = u² and a² + t⁴ = v², i.e. u⁴ + t⁴ = v² with t ≠ 0.
3. Mathlib's x⁴ + y⁴ = z² theorem (Fermat42.exists_pos_odd_minimal and Fermat42.not_minimal) forces u = 0, so x = 0, a contradiction.
4. Conversely a positive solution of x⁴ + y⁴ = z² gives the rational point ((x/y)², xz/y³) with x-coordinate ≠ 0.

Direct prerequisites: [CA.4/primitive-zero-of-a-form](#CA-4-primitive-zero-of-a-form), `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Affine.Equation`, `mathlib:Fermat42.exists_pos_odd_minimal`, `mathlib:Fermat42.not_minimal`, `mathlib:Int.sq_of_gcd_eq_one`.

Source: [conrad-descent-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/descent.pdf), Corollary 3.8 and its proof, pp. 6–7. The comparison, with the source's proof in the proof steps.

Source: [conrad-descent-2026](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/descent.pdf), Remark 3.9, p. 7. The converse clause.

Proof or interface frontier: Weighted denominator normalization and coprime square-factor lemma require own suppliers; native omits converse.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-markoff-coefficient-one-zero-orbits"></a>

### Two integer orbits on the coefficient-one zero fibre

`ClassicalArithmeticCompletion:CA.4/markoff-coefficient-one-zero-orbits` · comparison.

Every integral coefficient-one solution of x₁²+x₂²+x₃²=x₁x₂x₃ has all coordinates divisible by 3. Dividing by 3 identifies these solutions with coefficient-three integer Markoff triples and intertwines the Vieta moves, permutations and double sign changes. The Γ-orbits on V₀(ℤ) are exactly {0} and the orbit of (3,3,3).

Hypotheses and conventions: Coordinates are integers. The coefficient-one Γ includes double sign changes; no assertion over ℤ/3ℤ.

Further acceptance checks:

- The mod-3 coefficient-one solution set is exactly {(0,0,0)}; this differs from the coefficient-three surface over 𝔽₃.
- The integer examples (3,3,3),(3,3,6),(6,15,87) correspond to (1,1,1),(1,1,2),(2,5,29), and signed variants normalize by double sign changes.
- The Δ minimum is a separate outstanding source item, PAPER-GHOSH-SARNAK-22/10.

Proof sketch:

1. Modulo 3, if all coordinates are units, the sum of their squares is 0 but their product is nonzero, a contradiction. If one coordinate is 0, the other two squares must sum to 0 and hence both are 0. Thus every coordinate is divisible by 3.
2. Write x=3y and cancel 9 in ℤ: sum y_i²=3y₁y₂y₃. Conversely multiplication by 3 gives a solution. Direct calculation gives V_i(3y)=3R_i(y); permutations and double sign changes also commute with this map.
3. A nonzero integer solution has no zero coordinate, and its coordinate product is positive. Double sign changes make all coordinates positive. Apply markoff-root-generation to y, transport the word by the identity above, and obtain (3,3,3). The origin is fixed by every generator.

Direct prerequisites: [CA.4/markoff-triples](#CA-4-markoff-triples), [CA.4/markoff-vieta-involution](#CA-4-markoff-vieta-involution), [CA.4/markoff-root-generation](#CA-4-markoff-root-generation).

Source: [ghosh-sarnak-2022-v3](https://arxiv.org/pdf/1706.06712v3), §3.1, p.12; elementary comparison with existing coefficient-three nodes. The recalled two-orbit result is imported via the existing root-generation theorem and an explicit integral rescaling; no new general carrier is defined.

Proof or interface frontier: Integral mod3 divisibility/rescaling is sound. Native lacks this comparison signature; carrier gap is explicit.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-markoff-positive-root-orbits"></a>

### Positive fundamental roots inject into large-coordinate orbits

`ClassicalArithmeticCompletion:CA.4/markoff-positive-root-orbits` · lemma.

For any integer k≥5, let F⁺_k={u∈ℤ³:3≤u₁≤u₂≤u₃, u₁²+u₂²+u₃²+u₁u₂u₃=k}. Sending u to the Γ-orbit of (−u₁,u₂,u₃) is injective. Every point in each image orbit has all |x_j|≥3, including when k is exceptional.

Hypotheses and conventions: Γ is generated by coefficient-one Vieta moves, coordinate permutations and double sign changes. The carriers, orbit quotient and Δ identities are still requested from CA.4 under the Ghosh–Sarnak source contract.

Further acceptance checks:

- For k=54 the root (−3,3,3) has neighbours with all coordinates of absolute value at least 3.
- For k=5 the fundamental set is empty; this does not imply that V₅(ℤ) is empty.
- No genericity assumption appears in the positive-bracket check.

Proof sketch:

1. Work modulo permutations and double sign changes, with sorted absolute coordinates ≥3 and either a positive representative or a representative (−u₁,u₂,u₃). The Δ polynomial is invariant under these narrow equivalences.
2. Use (4.1): each bracket 2(k−5)+(x_j²−4)(x_l²−4) is strictly positive on this locus, without needing genericity of k. At a negative root all three moves strictly increase Δ and keep every absolute coordinate ≥3.
3. At a positive representative 3≤x₁≤x₂≤x₃, V₁ and V₂ increase Δ and replace their coordinate by at least 2x₃. The descent calculation of Lemma 2.1 gives x₁x₂−2x₃<0 for k≥5: otherwise evaluating c²−x₁x₂c+x₁²+x₂²−k between c=x₂ and its vertex would force 0≤x₁²−(x₁−2)x₂²−k≤(3−x₁)x₁²−k<0. Thus V₃ is the unique Δ-decreasing neighbour, provided it remains in the large-coordinate locus. For vertices reached upwards from a negative root, it is exactly their previous parent, hence it remains in that locus.
4. Induct on a word from a negative root: an increasing step stays large, and a decreasing step follows the already constructed parent. Distinct increasing branches cannot merge: a finite path between distinct negative roots, or a cycle, has a maximal-Δ vertex with two decreasing neighbours. Thus the whole orbit remains large and has one negative root.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.4`.

Source: [ghosh-sarnak-2022-v3](https://arxiv.org/pdf/1706.06712v3), §4.1, (4.1), pp.13–14; extension of the printed generic-k argument. The proof uses the printed Δ identities but checks the invariant large-coordinate component separately, so it applies to F⁺ roots even for exceptional k.

Proof or interface frontier: The existing Martin/BGS coefficient-three nodes do not supply V_k, the signed Γ quotient, Δ, F±, class numbers/finiteness, generic/exceptional predicates, the local-solubility theorem or the Hasse-failure results. The 25 explicit CA.4 requests enumerate the still-missing extraction items; root-orbit and class-number nodes depend on that contract. Coalesce the carrier and descent with GMR/1,5. ArithmeticDynamics Part II imports are conditional until this work is decomposed. The pending NonabelianLevelStructures early trace prefix supplies the ring-valued Fricke identity; the explicit Corollary 6.3 point alternatively uses direct algebra. No fictional stage or closed source coverage is asserted. The descent contract for item 7 must account explicitly for the coordinate-two exceptional branch; it does not assert that S⁺ plus points with a coordinate 0 or 1 exhausts every exceptional orbit. The corrected inequality uses only the independently checked absolute-coordinate-at-least-3 component.

Proof or interface frontier: Positive-root orbit argument needs separate Delta identities, upward invariance and unique descending-parent suppliers; existing stage prerequisite does not identify them. Typed signature is an explicit carrier gap.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-4-markoff-exceptional-class-number-lower-bound"></a>

### Exceptional class numbers exceed the positive fundamental count

`ClassicalArithmeticCompletion:CA.4/markoff-exceptional-class-number-lower-bound` · theorem.

For every exceptional integer k≥5, h_M(k)≥|F⁺_k(ℤ)|+1, where h_M(k) counts Γ-orbits in V_k(ℤ).

Hypotheses and conventions: Exceptional means an integral point exists with some absolute coordinate ≤2. The finite orbit and fundamental-set carriers/cardinality are required by the open CA.4 source requests.

Further acceptance checks:

- k=5 has solution (0,1,2), whereas F⁺₅ is empty since the polynomial on u_j≥3 is at least 54.
- At k=58 and k=100792 there are likewise exceptional solutions but F⁺ is empty.
- The §7 averages of |F±| remain separate from orbit counts for exceptional k.

Proof sketch:

1. Use markoff-positive-root-orbits to inject F⁺_k into the orbit set.
2. Choose an exceptional small-coordinate point. Its orbit cannot be in the image, since every orbit in the image consists entirely of points with all absolute coordinates ≥3.
3. Adjoin this orbit to the injection and compare finite cardinalities. Finiteness of h_M(k), k≠4, is a requested source theorem, not inferred from the false printed inequality.

Direct prerequisites: `ClassicalArithmeticCompletion:CA.4`, [CA.4/markoff-positive-root-orbits](#CA-4-markoff-positive-root-orbits).

Source: [ghosh-sarnak-2022-v3](https://arxiv.org/pdf/1706.06712v3), §1(d), p.5, corrected using §4.1, pp.13–14. The quoted inequality is false; this node states the corrected direction and strict contribution. See source issue ClassicalArithmeticCompletion/E507.

Proof or interface frontier: The existing Martin/BGS coefficient-three nodes do not supply V_k, the signed Γ quotient, Δ, F±, class numbers/finiteness, generic/exceptional predicates, the local-solubility theorem or the Hasse-failure results. The 25 explicit CA.4 requests enumerate the still-missing extraction items; root-orbit and class-number nodes depend on that contract. Coalesce the carrier and descent with GMR/1,5. ArithmeticDynamics Part II imports are conditional until this work is decomposed. The pending NonabelianLevelStructures early trace prefix supplies the ring-valued Fricke identity; the explicit Corollary 6.3 point alternatively uses direct algebra. No fictional stage or closed source coverage is asserted. The descent contract for item 7 must account explicitly for the coordinate-two exceptional branch; it does not assert that S⁺ plus points with a coordinate 0 or 1 exhausts every exceptional orbit. The corrected inequality uses only the independently checked absolute-coordinate-at-least-3 component.

Proof or interface frontier: Strict exceptional orbit contribution follows only after root injection and orbit finiteness supplier; finiteness remains requested and native signature absent.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

### Continuation frontier

- Chen 9,10,90: markoff-coefficient-one-zero-orbits already proves the integral scaling and equivariance comparison using the coefficient-three root-generation node. The ring-valued coefficient-one carrier, localization isomorphism over Z[1/3], positive-orbit adapter at (3,3,3), and their typed API still need decomposition. Multiplication by 3 is not an isomorphism over Z or in characteristic 3. Coalesce the general carrier with GMR and Ghosh–Sarnak.
- Gamburd–Magee–Ronan 1–5: the n-variable equation sum of squares = a times product + k, all coordinate moves, exceptional families, signed-to-positive comparison with its bounded error, compact-set estimates and terminating descent remain missing. The existing n=a=3,k=0 nodes provide only that specialization. Coalesce n=3,a=1 with the Ghosh–Sarnak level-k carrier. Keep Proposition 16/18 restricted to unexceptional points outside the compact set.
- All 25 Ghosh–Sarnak requests remain open at their corrected packet contracts: level-k carriers and quotient, exceptionality, Delta, fundamental sets, finiteness, local solubility, reciprocity obstructions, Hasse-failure families and certified enumeration. The three existing comparison nodes do not close this list. For item 7 retain the coordinate-two exceptional branch explicitly, as the accepted fix requires, rather than copying the older extraction sentence. For item 13 distinguish orbit points from nodes modulo narrow equivalence before using the stated one/two-element counts. The conjectural item 62 is not a proved bound. FF.1 supplies finite-field Gauss normalization; the pending NonabelianLevelStructures trace prefix is not a prerequisite of the direct Corollary 6.3 substitution.
- Koymans–Pagano 2–4: the existing generalized-Pell norm fibre and local obstruction are reusable inputs. Package the squarefree negative-Pell set and truncation, the exact rational-solubility criterion and the prime 1 mod 4 integral-solubility theorem. A congruence obstruction is not a sufficient integral criterion: d=34 has the rational solution (5/3,1/3) but no integral solution. Treat d=1 separately from quadratic-field comparisons; class-group and full-ring-of-integers comparisons belong in CA.5.
- Typed signatures for markoff-coefficient-one-zero-orbits, markoff-positive-root-orbits and markoff-exceptional-class-number-lower-bound are absent from the inherited suggested file. The general level-k carrier and finite quotient must be provided before their dependent signatures can be checked without fake assumptions.
- Independent review frontier: 45 existing targets have the mathematical or interface obligations recorded under gaps. Resume those IDs directly; revisionResponse records corrections and checked signatures, without claiming their remaining proofs closed.

## CA.5. Number-field arithmetic handoff

Interpret exact finite certificates using existing number-field ideals, units, regulators, discriminants and class groups. A relation matrix computes the class group only after generation and completeness are certified; a regulator bound certifies units only with the finite-index hypotheses. Matrix and quadratic-order comparisons connect CA.3 and CA.4 to intrinsic invariants. Analytic or GRH-dependent production of lower bounds belongs to its supplier, while this layer states the conditional certificate implication.

Landmarks: Class group generated by small primes; Class group from a relation matrix; Class number and regulator certificate; Hermite matrix of an ideal; Discriminant and index of a sublattice; Pell solutions as norm-one units.

<a id="CA-5-class-group-generated-by-small-primes"></a>

### The class group is generated by the primes of norm at most the Minkowski bound

`ClassicalArithmeticCompletion:CA.5/class-group-generated-by-small-primes` · theorem.

Let K be a number field of degree n with r_2 complex places and discriminant d_K, and M_K = (4/π)^{r_2} · n!/nⁿ · √|d_K| (Mathlib's Minkowski bound, a local notation M K in Mathlib.NumberTheory.NumberField.ClassNumber). The classes of the nonzero prime ideals P of 𝓞_K with N(P) ≤ M_K generate the class group Cl(K).

Hypotheses and conventions: K any number field; the bound is Minkowski's, in the form Mathlib states it.

Further acceptance checks:

- K = ℚ(i): M_K = 4/π < 2, so no prime is needed and Cl(K) = 1 (Conrad Example 2.1).
- K = ℚ(√−14): M_K ≈ 4.764, so the primes over 2 and 3 generate.
- Compatibility: Mathlib RingOfIntegers.isPrincipalIdealRing_of_isPrincipal_of_norm_le_of_isPrime (all primes of norm ≤ M_K principal ⇒ PID) is the case in which every generator is trivial.

Proof sketch:

1. Let C be a class. Mathlib NumberField.exists_ideal_in_class_of_norm_le gives a nonzero integral ideal I in C with N(I) ≤ M_K.
2. Every prime P dividing I has N(P) ≤ N(I) ≤ M_K: I ⊆ P gives N(P) | N(I) (Mathlib Ideal.absNorm_dvd_absNorm_of_le).
3. So the multiplicities of I vanish at every prime outside T = {P : N(P) ≤ M_K}; Tau Ceti ClassGroup.mk0_mem_closure_of_count_eq (with x = 1) puts the class of I in the subgroup generated by the classes IsDedekindDomain.HeightOneSpectrum.classGroupMk of the primes in T.

Direct prerequisites: `mathlib:NumberField.exists_ideal_in_class_of_norm_le`, `mathlib:Ideal.absNorm_dvd_absNorm_of_le`, `mathlib:Ideal.absNorm`, `mathlib:ClassGroup.mk0`, `tauceti:ClassGroup.mk0_mem_closure_of_count_eq`, `tauceti:IsDedekindDomain.HeightOneSpectrum.classGroupMk`, `mathlib:RingOfIntegers.isPrincipalIdealRing_of_isPrincipal_of_norm_le_of_isPrime`.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Lemma 7.3.1 and its proof, Section 7.3, printed p. 84. The source proves generation by the primes over rational primes p ≤ B_K; its proof (factor a representative of norm ≤ B_K) shows the sharper statement of the node, generation by primes of norm ≤ B_K.

Source: [conrad-classgroups-2026](https://kconrad.math.uconn.edu/blurbs/gradnumthy/classgpex.pdf), Section 1, p. 1. The target follows the source statement, using the notation above.

<a id="CA-5-class-group-presentation"></a>

### The class-group presentation by a family of ideals and its relation lattice

`ClassicalArithmeticCompletion:CA.5/class-group-presentation` · construction.

Let I_1, …, I_N be nonzero ideals of 𝓞_K. The presentation map is φ_I : ℤ^N → Cl(K), e ↦ ∏ [I_i]^{e_i} (a group homomorphism from the additive group ℤ^N, written multiplicatively), and the relation lattice is Λ_I = ker φ_I ⊆ ℤ^N: for e ≥ 0, e ∈ Λ_I exactly when the ideal ∏ I_i^{e_i} is principal. If the classes [I_i] generate Cl(K), φ_I induces Cl(K) ≅ ℤ^N / Λ_I and Λ_I has index h_K.

Hypotheses and conventions: The I_i are nonzero ideals (nonzero divisors of the ideal monoid); N ≥ 0. Relations are recorded as column vectors (the lattice convention of CA.3).

API:

- `classGroupPresentation` (constructor): φ_I : Multiplicative (ℤ^N) →* Cl(K), e ↦ ∏ [I_i]^{e_i}.
- `relationLattice` (data): Λ_I = ker φ_I as a ℤ-submodule of ℤ^N.
- `ClassGroupPresentation.single` (simp): φ_I of the i-th basis vector is [I_i].
- `ClassGroupPresentation.mem_relationLattice_iff` (characterisation): e ∈ Λ_I iff φ_I(e) = 1.
- `ClassGroupPresentation.mem_relationLattice_iff_isPrincipal` (characterisation): For e ≥ 0: e ∈ Λ_I iff ∏ I_i^{e_i} is principal.
- `ClassGroupPresentation.surjective_iff` (characterisation): φ_I is surjective iff the classes [I_i] generate Cl(K).
- `ClassGroupPresentation.classGroupEquiv` (equivalence): If φ_I is surjective, Cl(K) ≅ ℤ^N/Λ_I (as an additive group).
- `ClassGroupPresentation.index_relationLattice` (relation): If φ_I is surjective, [ℤ^N : Λ_I] = h_K.

Unit tests:

- `TauCeti.ClassicalArithmetic.relationLattice_empty` (degenerate): For N = 0, relationLattice I = ⊤.
- `TauCeti.ClassicalArithmetic.relationLattice_classNumber_one` (compatibility): If classNumber K = 1 then relationLattice I = ⊤ for every family I.
- `TauCeti.ClassicalArithmetic.relationLattice_principal_generator` (non-example): If I_i is principal then the i-th basis vector is a relation, although I_i need not be the unit ideal (a definition testing equality of ideals instead of classes fails this).
- `TauCeti.ClassicalArithmetic.relationLattice_order` (characterisation): k times the i-th basis vector lies in Λ_I iff the order of [I_i] divides k.

Further acceptance checks:

- With no generators Λ = ℤ⁰ = everything.
- In a field with h_K = 1 every vector is a relation.
- For K = ℚ(√−14) and I = (p_2, p_3), Λ contains (2, 0) and (1, 2).

Proof sketch:

1. Define φ_I(e) = ∏_i ClassGroup.mk0(I_i)^{e_i}; it is a homomorphism because Cl(K) is commutative.
2. Define Λ_I as the ℤ-submodule {e | φ_I(e) = 1}.
3. For e ≥ 0, φ_I(e) is the class of ∏ I_i^{e_i} (ClassGroup.mk0 is multiplicative), which is trivial iff that ideal is principal.
4. φ_I is surjective iff the [I_i] generate: its image is the subgroup they generate.
5. If surjective, the first isomorphism theorem (Mathlib QuotientGroup.quotientKerEquivOfSurjective) gives Cl(K) ≅ ℤ^N/Λ_I, and the index of Λ_I is |Cl(K)| = h_K (NumberField.classNumber).

Direct prerequisites: `mathlib:ClassGroup`, `mathlib:ClassGroup.mk0`, `mathlib:NumberField.classNumber`, `mathlib:QuotientGroup.quotientKerEquivOfSurjective`, `mathlib:Submodule.IsPrincipal`.

Source: [biasse-fieker-classgroup-2014](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/4387ACB036E3358143A563F196E386CB/S1461157014000345a.pdf/div-class-title-subexponential-class-group-and-unit-group-computation-in-large-degree-number-fields-div.pdf), Section 2, printed p. 386. The node is the map π∘φ of the source and its kernel, for the maximal order; the source takes the p_i to be primes generating the class group.

Proof or interface frontier: Split presentation homomorphism and relation submodule; consumed surjectivity/index/quotient APIs require their own lemmas.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-class-group-of-a-relation-matrix"></a>

### The class group from a complete relation matrix

`ClassicalArithmeticCompletion:CA.5/class-group-of-a-relation-matrix` · theorem.

Let I_1, …, I_N be nonzero ideals whose classes generate Cl(K), and let A be an N × R integer matrix whose columns span the relation lattice Λ_I. For any Smith normal form certificate of A with invariant factors d_0 | ⋯ | d_{r−1}: r = N, Cl(K) ≅ ⊕_{i<N} ℤ/d_i ℤ, and h_K = ∏ d_i. The invariant factors > 1 are the invariant factors of Cl(K).

Hypotheses and conventions: Generation: the [I_i] generate Cl(K) (for instance all primes of norm ≤ M_K, CA.5/class-group-generated-by-small-primes). Completeness: the columns of A span Λ_I, not merely lie in it.

Further acceptance checks:

- K = ℚ(√−14), I = (p_2, p_3): Λ is spanned by (2, 0) and (1, 2); the Smith form of the matrix with these columns is diag(1, 4), so Cl ≅ ℤ/4.
- K = ℚ(√−30), I = (p_2, p_3, p_5): Λ is spanned by 2e_1, 2e_2, 2e_3 and (1, 1, 1); invariant factors 1, 2, 2, so Cl ≅ (ℤ/2)², with the same class number 4 as ℚ(√−14).
- Omitting the relation (1, 2) for ℚ(√−14) leaves a matrix of rank 1 < N: an incomplete relation set is detected by the rank before any class number is read off.

Proof sketch:

1. Cl(K) ≅ ℤ^N/Λ_I = ℤ^N/Aℤ^R (CA.5/class-group-presentation).
2. ℤ^N/Aℤ^R ≅ ⊕_{i<r} ℤ/d_i ⊕ ℤ^{N−r} (CA.3/cokernel-of-an-integer-matrix).
3. Cl(K) is finite, so N − r = 0; the order is ∏ d_i.

Direct prerequisites: [CA.5/class-group-presentation](#CA-5-class-group-presentation), [CA.3/cokernel-of-an-integer-matrix](#CA-3-cokernel-of-an-integer-matrix), [CA.3/smith-normal-form-certificate](#CA-3-smith-normal-form-certificate), `mathlib:NumberField.classNumber`.

Source: [biasse-fieker-classgroup-2014](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/4387ACB036E3358143A563F196E386CB/S1461157014000345a.pdf/div-class-title-subexponential-class-group-and-unit-group-computation-in-large-degree-number-fields-div.pdf), Section 2, printed p. 386. The node is this statement with "enough" made precise (the columns span Λ_I) and with the transposed convention (relations as columns).

Source: [belabas-computational-2004](https://www.numdam.org/item/JTNB_2004__16_1_19_0.pdf), Section 1, Definition 1.1, printed p. 20. The target of the interpretation: the class group is known through the Smith form of its relation matrix. The inherited reading used the page image.

Proof or interface frontier: The finite presentation proof needs an explicit finite-group/free-quotient rank-zero supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-class-number-divides-relation-determinant"></a>

### Found relations bound the class number from above

`ClassicalArithmeticCompletion:CA.5/class-number-divides-relation-determinant` · theorem.

Let I_1, …, I_N be nonzero ideals whose classes generate Cl(K), and A an N × N integer matrix with det A ≠ 0 whose columns are relations (lie in Λ_I). Then h_K · [Λ_I : Aℤ^N] = |det A|. In particular h_K divides |det A|, and h_K = |det A| exactly when the columns of A span Λ_I.

Hypotheses and conventions: Generation of Cl(K) by the [I_i]. det A ≠ 0 (the found relations have full rank).

Further acceptance checks:

- K = ℚ(i) with I = ((1 + i)): the relation (2) gives |det| = 2, while (1 + i) is principal, so Λ = ℤ, h = 1 and [Λ : 2ℤ] = 2.
- K = ℚ(√−14): the relations (2, 0) and (0, 4) (p_3⁴ ∼ p_2^{−2} ∼ 1) give |det| = 8 = 4 · 2.
- Found relations alone never prove completeness: a lower bound for h_K (or for h_K R_K) is needed (CA.5/class-number-regulator-certificate).

Proof sketch:

1. [ℤ^N : Aℤ^N] = |det A| (Mathlib AddSubgroup.index_eq_natAbs_det).
2. [ℤ^N : Λ_I] = h_K (ClassGroupPresentation.index_relationLattice).
3. Multiplicativity of the index along Aℤ^N ⊆ Λ_I ⊆ ℤ^N (Mathlib Subgroup.relIndex_mul_index, additively).

Direct prerequisites: [CA.5/class-group-presentation](#CA-5-class-group-presentation), `mathlib:AddSubgroup.index_eq_natAbs_det`, `mathlib:Subgroup.relIndex_mul_index`, `mathlib:NumberField.classNumber`.

Source: [biasse-fieker-classgroup-2014](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/4387ACB036E3358143A563F196E386CB/S1461157014000345a.pdf/div-class-title-subexponential-class-group-and-unit-group-computation-in-large-degree-number-fields-div.pdf), Section 4.3, printed p. 399. The node is the fact behind the "tentative class number": the determinant of found relations is a multiple of h, equal to it only for a complete relation set.

Reconciled native contracts: `natAbs_det_eq_classNumber_iff`.

Proof or interface frontier: The native signature omits det equality iff completeness. Positive index and index-one suppliers remain missing; check the analytic bound source locator.

Revision disposition: The missing or incomplete native consequences now have checked signatures: natAbs_det_eq_classNumber_iff. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-5-fundamental-units-from-regulator-bound"></a>

### A regulator lower bound certifies a fundamental system of units

`ClassicalArithmeticCompletion:CA.5/fundamental-units-from-regulator-bound` · theorem.

Let K be a number field of unit rank r, u_1, …, u_r units whose logarithmic embeddings are linearly independent (Mathlib IsMaxRank), and L a real number with L ≤ R_K. If R(u) < 2L, where R(u) is the regulator of the family, then u_1, …, u_r together with the roots of unity generate 𝓞_K^×.

Hypotheses and conventions: L is a certified lower bound for the regulator, supplied independently (analytically, or by an enumeration argument). IsMaxRank u: the family has finite index.

Further acceptance checks:

- K = ℚ(√5), u = (1 + √5)/2: R(u) = log((1 + √5)/2) ≈ 0.4812 = R_K; any certified L with R_K/2 < L ≤ R_K certifies u.
- u = ((1 + √5)/2)² has R(u) = 2R_K ≥ 2L for every L ≤ R_K: a non-fundamental family is never certified.
- Rank 0 (imaginary quadratic): the empty family has R = 1 = R_K, and any L ∈ (1/2, 1] certifies that μ_K is the whole unit group.

Proof sketch:

1. Mathlib NumberField.Units.regOfFamily_div_regulator: R(u)/R_K = [𝓞_K^× : ⟨u⟩·μ_K] =: j, a positive integer (finite index by Mathlib isMaxRank_iff_closure_finiteIndex; R_K > 0 by regulator_pos).
2. Write R(u)=j R_K with j a positive integer. From L≤R_K and R(u)<2L obtain j R_K<2R_K; since R_K>0, j<2, so j=1. This uses no division by L.

Direct prerequisites: `mathlib:NumberField.Units.regOfFamily_div_regulator`, `mathlib:NumberField.Units.IsMaxRank`, `mathlib:NumberField.Units.regOfFamily`, `mathlib:NumberField.Units.regulator`, `mathlib:NumberField.Units.regulator_pos`, `mathlib:NumberField.Units.torsion`, `mathlib:NumberField.Units.isMaxRank_iff_closure_finiteIndex`.

Source: [biasse-fieker-classgroup-2014](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/4387ACB036E3358143A563F196E386CB/S1461157014000345a.pdf/div-class-title-subexponential-class-group-and-unit-group-computation-in-large-degree-number-fields-div.pdf), Section 4.3, printed p. 400. The unit half of the certificate: with the class group known, R′ < 2R_K bounds the index of the found units by 1. The node states it with an independent regulator bound L.

<a id="CA-5-class-number-regulator-certificate"></a>

### The class-number–regulator certificate

`ClassicalArithmeticCompletion:CA.5/class-number-regulator-certificate` · theorem.

Let I_1, …, I_N be nonzero ideals whose classes generate Cl(K), A an N × N integer matrix with det A ≠ 0 whose columns lie in Λ_I, u a family of r units with IsMaxRank, and h* a real number with h* ≤ h_K R_K. If |det A| · R(u) < 2h*, then the columns of A span Λ_I (so Cl(K) ≅ ℤ^N/Aℤ^N, read off from the Smith form of A) and u together with μ_K generates 𝓞_K^×; in particular h_K = |det A| and R_K = R(u).

Hypotheses and conventions: h* is a certified lower bound for h_K R_K; in practice it comes from the analytic class number formula (the residue of ζ_K at 1), evaluated with error control, and is an input here. The other hypotheses are those of CA.5/class-number-divides-relation-determinant and CA.5/fundamental-units-from-regulator-bound.

Further acceptance checks:

- K = ℚ(√−14): h = 4, R = 1; the relation matrix with columns (2, 0), (1, 2) and the empty unit family pass for any h* ∈ (2, 4].
- With the incomplete matrix of columns (2, 0), (0, 4) (det 8) no h* ≤ 4 passes: the certificate refuses it.
- The certificate checks the class group and the units together; neither index is certified from found relations or found units alone.

Proof sketch:

1. |det A| = h_K · j_1 with j_1 = [Λ_I : Aℤ^N] (CA.5/class-number-divides-relation-determinant).
2. R(u) = R_K · j_2 with j_2 = [𝓞_K^× : ⟨u⟩μ_K] (Mathlib regOfFamily_div_regulator).
3. |det A| R(u) = h_K R_K j_1 j_2 ≥ h* j_1 j_2; with |det A| R(u) < 2h* this gives j_1 j_2 < 2, so j_1 = j_2 = 1.
4. Then Cl(K) ≅ ℤ^N/Aℤ^N by CA.5/class-group-of-a-relation-matrix.

Direct prerequisites: [CA.5/class-number-divides-relation-determinant](#CA-5-class-number-divides-relation-determinant), [CA.5/fundamental-units-from-regulator-bound](#CA-5-fundamental-units-from-regulator-bound), [CA.5/class-group-of-a-relation-matrix](#CA-5-class-group-of-a-relation-matrix), `mathlib:NumberField.Units.regOfFamily_div_regulator`, `mathlib:NumberField.classNumber`.

Source: [biasse-fieker-classgroup-2014](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/4387ACB036E3358143A563F196E386CB/S1461157014000345a.pdf/div-class-title-subexponential-class-group-and-unit-group-computation-in-large-degree-number-fields-div.pdf), Section 4.3, printed pp. 399–400. The node is the implication the source uses to certify its output (h* ≤ h′R′ < 2h*), stated with h* ≤ hR as a hypothesis; the analytic derivation of h* (under GRH in the source) is not part of this node.

Reconciled native contracts: `relations_and_units_complete_of_lt_two_mul`.

Proof or interface frontier: The native signature omits the class-number and regulator equality conclusions; separate those corollaries and expose positive bounds/index hypotheses.

Revision disposition: The missing or incomplete native consequences now have checked signatures: relations_and_units_complete_of_lt_two_mul. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-5-ideal-hermite-matrix"></a>

### The Hermite matrix of an ideal in a fixed integral basis

`ClassicalArithmeticCompletion:CA.5/ideal-hermite-matrix` · construction.

Fix a ℤ-basis ω = (ω_1, …, ω_n) of 𝓞_K. For a nonzero ideal I, the Hermite matrix H_ω(I) is the unique n × n integer matrix in Hermite normal form (CA.3 convention: columns, upper triangular, entries to the right of each pivot reduced) whose columns are the ω-coordinates of a ℤ-basis of I. I ↦ H_ω(I) is injective; H_ω(𝓞_K) = 1; H_ω((m)) = m·1 for m ∈ ℤ_{>0}; x ∈ I iff the coordinate vector of x lies in the column lattice of H_ω(I); and when ω_1 = 1, I ∩ ℤ = H_ω(I)_{1,1} ℤ.

Hypotheses and conventions: ω is a ℤ-basis of 𝓞_K (for instance Mathlib NumberField.RingOfIntegers.basis); I ≠ 0, so its coordinate lattice has full rank n.

API:

- `idealHermiteMatrix` (constructor): H_ω(I).
- `latticeOfMatrix` (data): The ℤ-submodule of 𝓞_K spanned by the columns of an integer matrix read in ω.
- `IdealHermiteMatrix.isHermiteNormalForm` (structure): H_ω(I) is in Hermite normal form.
- `IdealHermiteMatrix.latticeOfMatrix_eq` (characterisation): The columns of H_ω(I) span I.
- `IdealHermiteMatrix.injective` (extensionality): I ↦ H_ω(I) is injective.
- `IdealHermiteMatrix.eq_iff` (characterisation): H_ω(I) = H iff H is in Hermite normal form and its columns span I: the interpretation of a certified matrix.
- `IdealHermiteMatrix.comap_eq_span_corner` (compatibility): If ω_1 = 1 then I ∩ ℤ = (H_ω(I)_{1,1}).
- `IdealHermiteMatrix.mem_iff` (characterisation): x ∈ I iff the ω-coordinates of x lie in the column lattice of H_ω(I).

Unit tests:

- `TauCeti.ClassicalArithmetic.idealHermiteMatrix_top` (degenerate): H_ω(𝓞_K) = 1.
- `TauCeti.ClassicalArithmetic.idealHermiteMatrix_intCast` (computation): For m > 0, H_ω((m)) = m·1.
- `TauCeti.ClassicalArithmetic.idealHermiteMatrix_one_add_i` (computation): In a field with ω = (1, θ), θ² = −1, H_ω((1 + θ)) has columns (2, 0) and (1, 1).

Further acceptance checks:

- H_ω(𝓞_K) = 1.
- In ℤ[i] with ω = (1, i), H_ω((1 + i)) has columns (2, 0) and (1, 1).
- H_ω((m)) = m·1.

Proof sketch:

1. The coordinate map ω.equivFun identifies 𝓞_K with ℤ^n and I with a full-rank sublattice.
2. CA.3/hermite-basis-of-a-sublattice gives a unique Hermite basis of that sublattice; it is square because the rank is n. Define H_ω(I) as that matrix.
3. Injectivity and the characterisation "H = H_ω(I) iff H is in Hermite normal form and its columns span I" follow from uniqueness (CA.3/hermite-normal-form-unique).
4. Membership: x ∈ I iff ω.equivFun x lies in the column lattice.
5. Corner: with ω_1 = 1, the elements of I in ℤ = ℤω_1 are the lattice vectors with coordinates 2, …, n equal to 0; the upper triangular shape forces them to be multiples of the first column H_{1,1} e_1.

Direct prerequisites: [CA.3/hermite-basis-of-a-sublattice](#CA-3-hermite-basis-of-a-sublattice), [CA.3/is-hermite-normal-form](#CA-3-is-hermite-normal-form), [CA.3/hermite-normal-form-unique](#CA-3-hermite-normal-form-unique), `mathlib:NumberField.RingOfIntegers.basis`, `mathlib:Module.Basis`, `mathlib:Ideal`.

Source: [belabas-computational-2004](https://www.numdam.org/item/JTNB_2004__16_1_19_0.pdf), Section 5.3.1, printed p. 36. The node is the canonical HNF representation of the source, with the canonicity proved by CA.3. The inherited reading used the page image.

Source: [belabas-computational-2004](https://www.numdam.org/item/JTNB_2004__16_1_19_0.pdf), Section 5.3.2, printed p. 36. The corner property (API comap_eq_span_corner). The inherited reading used the page image.

Proof or interface frontier: The node bundles idealHermiteMatrix and latticeOfMatrix; consumed span/equality API and full-rank proof need separate suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-ideal-norm-eq-prod-hermite-diagonal"></a>

### The norm of an ideal is the product of its Hermite pivots

`ClassicalArithmeticCompletion:CA.5/ideal-norm-eq-prod-hermite-diagonal` · theorem.

For a nonzero ideal I of 𝓞_K and any ℤ-basis ω of 𝓞_K, N(I) = ∏_i H_ω(I)_{i,i}.

Hypotheses and conventions: I ≠ 0.

Further acceptance checks:

- N((1 + i)) = 2 · 1 = 2 in ℤ[i].
- N((m)) = mⁿ.
- N(𝓞_K) = 1.

Proof sketch:

1. The columns of H = H_ω(I) are the ω-coordinates of a ℤ-basis of I, so the change-of-basis determinant from ω to that basis is det H.
2. Mathlib Ideal.natAbs_det_basis_change: |det| = N(I).
3. det H = ∏ H_{i,i} > 0 (CA.3: a square Hermite matrix is upper triangular with positive diagonal).

Direct prerequisites: [CA.5/ideal-hermite-matrix](#CA-5-ideal-hermite-matrix), `mathlib:Ideal.natAbs_det_basis_change`, `mathlib:Ideal.absNorm`, [CA.3/index-eq-prod-hermite-pivots](#CA-3-index-eq-prod-hermite-pivots).

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Definition 6.3.2, Section 6.3, printed p. 75. The norm as a lattice index, which the Hermite pivots compute.

Source: [conrad-modulespid-2025](https://kconrad.math.uconn.edu/blurbs/linmultialg/modulesoverPID.pdf), Theorem 5.19, p. 18. The index formula applied to the Hermite basis of I.

Proof or interface frontier: Norm product is sound once the missing latticeOfMatrix equality/full-rank supplier is supplied.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-hermite-matrix-of-an-ideal-criterion"></a>

### Which Hermite matrices are the matrices of ideals

`ClassicalArithmeticCompletion:CA.5/hermite-matrix-of-an-ideal-criterion` · theorem.

Let ω be a ℤ-basis of 𝓞_K and H an n × n integer matrix in Hermite normal form. Then H = H_ω(I) for some nonzero ideal I if and only if the column lattice L_ω(H) = Σ_j ℤ (Σ_i H_{i,j} ω_i) is stable under multiplication by every ω_k. Equivalently, for the multiplication matrices M_k of the ω_k (from the multiplication table of ω), each M_k H = H X_k for an integer matrix X_k.

Hypotheses and conventions: H square in Hermite normal form (so det H > 0 and L_ω(H) has full rank).

Further acceptance checks:

- In ℤ[i] with ω = (1, i), diag(2, 1) is in Hermite normal form but its lattice 2ℤ + ℤi is not an ideal (i · i = −1 ∉ it).
- The matrix with columns (2, 0), (1, 1) passes: it is H_ω((1 + i)).
- The identity always passes (I = 𝓞_K).

Proof sketch:

1. If L_ω(H) is stable under each ω_k, it is stable under their ℤ-span 𝓞_K, so it is an ideal I; it is nonzero because it has full rank; H = H_ω(I) by IdealHermiteMatrix.eq_iff.
2. Conversely an ideal is stable under multiplication by 𝓞_K.
3. Matrix form: ω_k · (ω-coordinates x) = M_k x, and M_k H has columns in L_ω(H) iff M_k H = H X_k with X_k integral (H is invertible over ℚ, X_k = H⁻¹ M_k H).

Direct prerequisites: [CA.5/ideal-hermite-matrix](#CA-5-ideal-hermite-matrix), [CA.3/hermite-normal-form-unique](#CA-3-hermite-normal-form-unique).

Source: [belabas-computational-2004](https://www.numdam.org/item/JTNB_2004__16_1_19_0.pdf), Section 5.3.1, printed p. 36. The criterion is the check that a matrix handed over as an ideal is one: its column module must be an 𝓞_K-module. The inherited reading used the page image.

Proof or interface frontier: The native file omits the multiplication-matrix criterion Mk H = H Xk and its multiplication-matrix definition.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-discriminant-of-a-sublattice-basis"></a>

### The discriminant of a basis of a sublattice of 𝓞_K

`ClassicalArithmeticCompletion:CA.5/discriminant-of-a-sublattice-basis` · theorem.

Let b_1, …, b_n ∈ 𝓞_K be linearly independent over ℤ, n = [K : ℚ], and L = Σ ℤ b_i. Then disc(b) = [𝓞_K : L]² · d_K. Consequently b is an integral basis iff disc(b) = d_K; if disc(b) is squarefree then b is an integral basis; and for an order O ⊆ 𝓞_K, disc(O) = [𝓞_K : O]² d_K.

Hypotheses and conventions: n = [K : ℚ] and the b_i are ℤ-linearly independent (so L has finite index).

Further acceptance checks:

- ℤ[√5] ⊆ 𝓞_{ℚ(√5)}: disc(1, √5) = 20 = 2² · 5, index 2.
- ℤ[ζ_n] = 𝓞_{ℚ(ζ_n)}: disc(power basis) = d_K (Mathlib IsCyclotomicExtension.Rat.discr is the computation of this discriminant).
- Dedekind's cubic x³ + x² − 2x + 8: every order ℤ[α] has even index, so 4 | disc(α) for every α (Stein Example 6.2.7).

Proof sketch:

1. Let ω be an integral basis and C the integer matrix expressing b in ω (Mathlib Module.Basis.toMatrix), so b = ω·C.
2. Mathlib Algebra.discr_of_matrix_vecMul: disc(b) = det(C)² · disc(ω).
3. Tau Ceti NumberField.discr_eq_of_integralBasis: disc(ω) = d_K.
4. |det C| = [𝓞_K : L] (Mathlib Submodule.natAbs_det_basis_change).
5. If disc(b) is squarefree then [𝓞_K : L]² divides it, so the index is 1.

Direct prerequisites: `mathlib:Algebra.discr_of_matrix_vecMul`, `mathlib:Algebra.discr`, `tauceti:NumberField.discr_eq_of_integralBasis`, `mathlib:NumberField.RingOfIntegers.basis`, `mathlib:Submodule.natAbs_det_basis_change`, `mathlib:Module.Basis.toMatrix`, `mathlib:NumberField.discr`, `mathlib:IsCyclotomicExtension.Rat.discr`.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Proposition 6.2.6, Section 6.2, printed p. 73. The node is the proposition for any full sublattice, with the source's proof (change-of-basis determinant).

Proof or interface frontier: The native file omits the integral-basis iff and squarefree-discriminant corollaries; lattice rank/finite-index transport needs its own supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-index-of-the-order-z-sqrt-d"></a>

### The index of ℤ[√d] in the ring of integers of ℚ(√d)

`ClassicalArithmeticCompletion:CA.5/index-of-the-order-z-sqrt-d` · theorem.

Let d ≠ 0, 1 be squarefree, K = ℚ(θ) with θ² = d (minpoly ℤ θ = X² − d). Then [𝓞_K : ℤ[θ]] = 2 if d ≡ 1 (mod 4) and 1 otherwise.

Hypotheses and conventions: d squarefree, d ≠ 0, 1; θ generates K.

Further acceptance checks:

- d = 5: ℤ[√5] has index 2 in ℤ[(1 + √5)/2].
- d = −1: ℤ[i] = 𝓞_{ℚ(i)}.
- d = −3: ℤ[√−3] has index 2 in ℤ[(1 + √−3)/2], the ring containing the primitive cube roots of unity.

Proof sketch:

1. θ is an integral primitive element; Tau Ceti TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr gives disc(X² − d) = 4d = index(θ)² · d_K.
2. Tau Ceti NumberField.discr_eq_of_squarefree_of_mod_four_eq_one and NumberField.discr_eq_four_mul_of_mod_four_ne_one give d_K = d or 4d.
3. Hence index(θ)² = 4 or 1.

Direct prerequisites: `tauceti:TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr`, `tauceti:TauCeti.NumberField.IntegralPrimitiveElement.index`, `tauceti:NumberField.discr_eq_of_squarefree_of_mod_four_eq_one`, `tauceti:NumberField.discr_eq_four_mul_of_mod_four_ne_one`, `mathlib:Polynomial.discr`.

Source: [conrad-quadraticfields-2021](https://kconrad.math.uconn.edu/blurbs/gradnumthy/quadraticgrad.pdf), Section 3, Theorem 3.4, p. 2. The two rings of integers whose comparison with ℤ[√d] the node records as an index.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Proposition 6.2.6, Section 6.2, printed p. 73. Applied to O = ℤ[√d].

<a id="CA-5-kummer-dedekind-for-a-monogenic-presentation"></a>

### Dedekind–Kummer at every prime for a monogenic presentation

`ClassicalArithmeticCompletion:CA.5/kummer-dedekind-for-a-monogenic-presentation` · construction.

Let θ ∈ 𝓞_K with ℤ[θ] = 𝓞_K and f = minpoly ℤ θ. For every rational prime p, the primes of 𝓞_K over p correspond bijectively to the monic irreducible factors Q of f mod p; the prime attached to Q is (p, Q(θ)), its residue degree is deg Q and its ramification index is the multiplicity of Q in f mod p. No prime is excluded.

Hypotheses and conventions: ℤ[θ] = 𝓞_K (a monogenic presentation: quadratic fields with θ = √d or (1 + √d)/2, cyclotomic fields with θ = ζ).

API:

- `primesOverEquivMonicFactorsModOfAdjoinEqTop` (constructor): The bijection primesOver(p) ≃ monic irreducible factors of f mod p, for every prime p.
- `inertiaDeg_primesOverEquivMonicFactorsModOfAdjoinEqTop_symm` (characterisation): The residue degree of the prime attached to Q is deg Q.
- `ramificationIdx_primesOverEquivMonicFactorsModOfAdjoinEqTop_symm` (characterisation): Its ramification index is the multiplicity of Q in f mod p.
- `primesOverEquivMonicFactorsModOfAdjoinEqTop_symm_apply_eq_span` (characterisation): The prime attached to (the reduction of) Q is (p, Q(θ)).

Unit tests:

- `TauCeti.ClassicalArithmetic.kummerDedekind_gaussian_three` (computation): In a field with ℤ[θ] = 𝓞_K and θ² = −1, there is exactly one prime over 3.
- `TauCeti.ClassicalArithmetic.kummerDedekind_gaussian_five` (computation): In the same field there are exactly two primes over 5.
- `TauCeti.ClassicalArithmetic.kummerDedekind_gaussian_two` (degenerate): In the same field there is one prime over 2 and its ramification index is 2 (the prime dividing the discriminant is covered).

Further acceptance checks:

- ℤ[i], p = 3: X² + 1 is irreducible mod 3, one prime, inert.
- ℤ[i], p = 5: X² + 1 ≡ (X − 2)(X + 2), two primes of degree 1.
- ℤ[i], p = 2: X² + 1 ≡ (X + 1)², one prime with e = 2; the monogenic presentation covers the prime dividing the discriminant, which the general theorem with p ∤ exponent also covers but the hypothesis p ∤ disc f does not.

Proof sketch:

1. ℤ[θ] = 𝓞_K is equivalent to exponent θ = 1 (Mathlib RingOfIntegers.exponent_eq_one_iff), so no prime divides the exponent.
2. Apply Mathlib NumberField.Ideal.primesOverSpanEquivMonicFactorsMod with that hypothesis, and its three companion lemmas for the span, the residue degree and the ramification index.

Direct prerequisites: `mathlib:NumberField.Ideal.primesOverSpanEquivMonicFactorsMod`, `mathlib:RingOfIntegers.exponent_eq_one_iff`, `mathlib:RingOfIntegers.monicFactorsMod`, `mathlib:NumberField.Ideal.inertiaDeg_primesOverSpanEquivMonicFactorsMod_symm_apply`, `mathlib:NumberField.Ideal.ramificationIdx_primesOverSpanEquivMonicFactorsMod_symm_apply`, `mathlib:NumberField.Ideal.primesOverSpanEquivMonicFactorsMod_symm_apply_eq_span`.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Theorem 4.2.3, Section 4.2, printed pp. 53–54. For a monogenic presentation the index is 1, so the hypothesis holds at every prime; the node records this specialisation with the residue degrees and ramification indices.

Proof or interface frontier: Dedekind–Kummer is already in the baseline; the wrapper must isolate only the specialisation and explicit hypothesis discharge. monicFactorsMod θ p has correct pinned argument order.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-zsqrtd-into-the-ring-of-integers"></a>

### The ring ℤ√d inside the ring of integers of ℚ(√d)

`ClassicalArithmeticCompletion:CA.5/zsqrtd-into-the-ring-of-integers` · construction.

For d ∈ ℤ and θ ∈ 𝓞_K with θ² = d, the ring homomorphism φ : ℤ√d → 𝓞_K, x + y√d ↦ x + yθ (Mathlib Zsqrtd.lift). Its image is ℤ[θ]; it is injective when d is not a square; for squarefree d ≠ 0,1 with K = ℚ(θ) it is an isomorphism iff d ≢ 1 (mod 4); under these quadratic-field hypotheses it carries the norm form x² − dy² of ℤ√d to the field norm N_{K/ℚ}.

Hypotheses and conventions: d is an integer and θ in O_K satisfies θ²=d; no nonsquareness is needed just to define the ring map. Injectivity assumes d is not an integer square. Bijectivity and the field-norm comparison assume d squarefree, d ≠ 0,1, and K=Q(θ), hence [K:Q]=2.

API:

- `zsqrtdToRingOfIntegers` (constructor): φ : ℤ√d →+* 𝓞_K, x + y√d ↦ x + yθ.
- `ZsqrtdToRingOfIntegers.sqrtd` (simp): φ(√d) = θ.
- `ZsqrtdToRingOfIntegers.range_eq` (characterisation): The image of φ is ℤ[θ].
- `ZsqrtdToRingOfIntegers.injective` (structure): φ is injective when d is not a square.
- `ZsqrtdToRingOfIntegers.bijective_iff` (equivalence): For squarefree d ≠ 0,1 and K=Q(θ), φ is bijective if and only if d is not congruent to 1 modulo 4.
- `ZsqrtdToRingOfIntegers.norm` (compatibility): For squarefree d ≠ 0,1 and K=Q(θ), N_(K/Q)(φ(x))=Zsqrtd.norm x for every x in Zsqrtd.

Unit tests:

- `TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_gaussian` (computation): For d = −1 and θ² = −1 generating K, φ is bijective.
- `TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_five_not_surjective` (non-example): For d = 5, φ is not surjective.
- `TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_norm_example` (compatibility): N_{K/ℚ}(φ(3 + 2√d)) = 9 − 4d.
- `TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_degree_one_excluded` (non-example): At d=1, θ=1 and K=Q, the ring map exists but is not injective: sqrt(1)-1 maps to zero. The field norm of φ(2)=2 differs from Zsqrtd.norm(2)=4, so the norm comparison requires the quadratic-field hypotheses.

Further acceptance checks:

- d = −1: an isomorphism ℤ[i] ≅ 𝓞_{ℚ(i)}.
- d = 5: not surjective, (1 + √5)/2 is missed.
- N(3 + 2√d) = 9 − 4d.

Proof sketch:

1. φ is Zsqrtd.lift applied to (θ, θ² = d).
2. Image: generated by 1 and θ, i.e. ℤ[θ] (θ² = d).
3. Injective: x + yθ = 0 with y ≠ 0 would make θ rational, so d a square.
4. Bijective iff ℤ[θ] = 𝓞_K iff d ≢ 1 (mod 4) (Tau Ceti NumberField.adjoin_gen_eq_top_of_mod_four_ne_one; for d ≡ 1 the index is 2 by CA.5/index-of-the-order-z-sqrt-d).
5. Norm: N(x + yθ) = (x + yθ)(x − yθ) = x² − dy² (the conjugate of θ is −θ).

Direct prerequisites: `mathlib:Zsqrtd`, `mathlib:Zsqrtd.lift`, `mathlib:Zsqrtd.norm`, `tauceti:NumberField.adjoin_gen_eq_top_of_mod_four_ne_one`, `tauceti:NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one`, [CA.5/index-of-the-order-z-sqrt-d](#CA-5-index-of-the-order-z-sqrt-d).

Source: [conrad-quadraticfields-2021](https://kconrad.math.uconn.edu/blurbs/gradnumthy/quadraticgrad.pdf), Section 3, Theorem 3.4, p. 2. The node identifies Mathlib's ℤ√d with the first ring and embeds it in the second.

Source: [conrad-quadraticintegers-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/quadratic-integers.pdf), Section 2, Theorem 2.3, p. 2. The norm form of ℤ√d, which φ carries to the field norm.

Proof or interface frontier: Promote injectivity, image, norm transport and bijection API consumed by 211–213.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-pell-solutions-are-norm-one-units"></a>

### Pell solutions are the units of norm one

`ClassicalArithmeticCompletion:CA.5/pell-solutions-are-norm-one-units` · theorem.

Let d > 1 be squarefree with d ≢ 1 (mod 4) and K = ℚ(√d), so that 𝓞_K = ℤ[√d]. The map (x, y) ↦ x + y√d is an isomorphism from Mathlib's group Pell.Solution₁ d of integer solutions of x² − dy² = 1 onto the kernel of the norm 𝓞_K^× → {±1}. This subgroup has index 1 or 2 in 𝓞_K^×, and the fundamental Pell solution generates it modulo ±1.

Hypotheses and conventions: d > 1 squarefree, d ≢ 1 (mod 4); K = ℚ(θ) with θ² = d.

Further acceptance checks:

- d = 2: the fundamental Pell solution 3 + 2√2 = (1 + √2)², where 1 + √2 has norm −1; index 2.
- d = 3: 2 + √3 has norm 1 and generates the units modulo ±1; index 1.
- For d ≡ 1 (mod 4) the solutions of x² − dy² = 1 are the norm-one units of the order ℤ[√d], of finite index but possibly not all norm-one units of 𝓞_K (d = 5: (1 + √5)/2 squared is not in ℤ[√5]).

Proof sketch:

1. Pell.Solution₁ d is the unitary group of ℤ√d, the elements of norm 1 (Mathlib Pell.is_pell_solution_iff_mem_unitary); they are units (Zsqrtd.norm_eq_one_iff).
2. CA.5/zsqrtd-into-the-ring-of-integers: φ is a ring isomorphism ℤ√d ≅ 𝓞_K compatible with norms, so it restricts to an isomorphism of the norm-one units.
3. The norm is a homomorphism 𝓞_K^× → {±1} with kernel the norm-one units, so the index is 1 or 2.
4. Generation modulo ±1 by the fundamental solution: Mathlib Pell.IsFundamental.eq_zpow_or_neg_zpow.

Direct prerequisites: [CA.5/zsqrtd-into-the-ring-of-integers](#CA-5-zsqrtd-into-the-ring-of-integers), `mathlib:Pell.Solution₁`, `mathlib:Pell.is_pell_solution_iff_mem_unitary`, `mathlib:Zsqrtd.norm_eq_one_iff`, `mathlib:Pell.IsFundamental.eq_zpow_or_neg_zpow`.

Source: [STEIN.ANT](https://wstein.org/books/ant/ant.pdf), Section 8.2.1, printed p. 93. The node makes the subgroup precise (the norm-one units, of index ≤ 2 when d ≢ 1 mod 4). The sentence that follows in the source misstates the cyclic group (ClassicalArithmeticCompletion/E601).

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), Theorem 5.3, p. 6. The generation statement on the Pell side, which Mathlib proves as Pell.IsFundamental.eq_zpow_or_neg_zpow.

Proof or interface frontier: The native file provides the isomorphism but omits the index-one-or-two and generation-mod-sign statements.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-negative-pell-iff-unit-of-norm-minus-one"></a>

### The negative Pell equation and units of norm −1

`ClassicalArithmeticCompletion:CA.5/negative-pell-iff-unit-of-norm-minus-one` · theorem.

Let d > 1 be squarefree with d ≢ 1 (mod 4) and K = ℚ(√d). The equation x² − dy² = −1 has an integer solution if and only if 𝓞_K has a unit of norm −1; in that case the norm-one units have index 2, and the least positive solution x_1 + y_1√d generates 𝓞_K^× modulo ±1.

Hypotheses and conventions: d > 1 squarefree, d ≢ 1 (mod 4).

Further acceptance checks:

- d = 2: 1² − 2·1² = −1, the unit 1 + √2 of norm −1.
- d = 3: x² ≡ −1 (mod 3) has no solution, so no unit of norm −1; the fundamental unit 2 + √3 has norm 1.
- d = 10: 3² − 10·1² = −1.

Proof sketch:

1. Under the isomorphism ℤ√d ≅ 𝓞_K (CA.5/zsqrtd-into-the-ring-of-integers), x + y√d has norm x² − dy²; an element of norm −1 is a unit (Zsqrtd.norm_eq_one_iff).
2. Conversely a unit of norm −1 of 𝓞_K = ℤ[√d] is x + y√d with x² − dy² = −1.
3. The index statement is CA.5/pell-solutions-are-norm-one-units with the norm surjective onto {±1}.
4. The last clause, that the least positive solution generates the units modulo ±1, is CA.4/negative-pell-classification read through the identification of ℤ[√d] with 𝓞_K (CA.5/zsqrtd-into-the-ring-of-integers); nothing is re-proved here.

Direct prerequisites: [CA.5/zsqrtd-into-the-ring-of-integers](#CA-5-zsqrtd-into-the-ring-of-integers), [CA.5/pell-solutions-are-norm-one-units](#CA-5-pell-solutions-are-norm-one-units), `mathlib:Zsqrtd.norm_eq_one_iff`, [CA.4/negative-pell-classification](#CA-4-negative-pell-classification).

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), Theorem 7.5, p. 12. The Pell-side statement; the node transports it to the units of 𝓞_K.

Proof or interface frontier: The norm criterion is valid: pinned Zsqrtd.norm_eq_one_iff states norm.natAbs = 1 iff IsUnit, so it does include norm minus one. Native index/generation conclusions are omitted.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-negative-pell-iff-unit-of-norm-minus-one-for-d-one-mod-four"></a>

### The negative Pell equation and units of norm −1 when d ≡ 1 (mod 4)

`ClassicalArithmeticCompletion:CA.5/negative-pell-iff-unit-of-norm-minus-one-for-d-one-mod-four` · theorem.

Let d > 1 be squarefree with d ≡ 1 (mod 4) and K = ℚ(√d), so that 𝓞_K = {(a + b√d)/2 : a, b ∈ ℤ, a ≡ b (mod 2)} and ℤ[√d] is the subring with a and b even. (i) If d ≡ 1 (mod 8), every unit of 𝓞_K lies in ℤ[√d]. (ii) If d ≡ 5 (mod 8), the cube of every unit of 𝓞_K lies in ℤ[√d]: for u = (a + b√d)/2 of norm ν = ±1, u³ = (a(a² − 3ν) + b(a² − ν)√d)/2. (iii) Hence x² − dy² = −1 has an integer solution if and only if 𝓞_K has a unit of norm −1. With CA.5/negative-pell-iff-unit-of-norm-minus-one (d ≢ 1 (mod 4)) this gives the equivalence for every squarefree d > 1.

Hypotheses and conventions: d > 1 squarefree, d ≡ 1 (mod 4). (i) assumes d ≡ 1 (mod 8) and (ii) assumes d ≡ 5 (mod 8); (iii) covers both.

API:

- `unit_mem_zsqrtd_of_mod_eight_eq_one` (structure): For squarefree d>1 with d congruent to 1 modulo 8, every unit of O_Q(sqrt(d)) belongs to the image of Zsqrtd.
- `unit_cube_mem_zsqrtd_of_mod_eight_eq_five` (structure): For squarefree d>1 with d congruent to 5 modulo 8, every unit has its cube in the image of Zsqrtd, with the displayed integral coordinates.
- `negativePell_iff_unit_norm_neg_one_mod_four_one` (equivalence): For squarefree d>1 congruent to 1 modulo 4, an integer solution of x^2-d*y^2=-1 exists if and only if the ring of integers has a unit of field norm -1.
- `unit_cube_norm` (compatibility): For a ring-of-integers unit u of norm nu in {1,-1}, the cube used in the order comparison has field norm nu^3=nu.

Unit tests:

- `negativePell_half_unit_five` (non-example): For d=5, (1+sqrt(5))/2 is a unit of norm -1 outside Z[sqrt(5)], while its cube 2+sqrt(5) lies in that order. Direct membership cannot replace cubing.
- `negativePell_half_unit_thirteen` (computation): For d=13, ((3+sqrt(13))/2)^3=18+5sqrt(13), and 18^2-13*5^2=-1.
- `negativePell_order_seventeen` (computation): For d=17 congruent to 1 modulo 8, 4+sqrt(17) has norm -1 and lies in Z[sqrt(17)]; odd half-integral coordinates cannot have norm plus or minus one.
- `negativePell_positive_norm_twentyone` (non-example): For d=21, ((5+sqrt(21))/2)^3=55+12sqrt(21) has norm +1, but negative Pell has no solution modulo 3. The mere existence of a unit is insufficient.

Further acceptance checks:

- d = 5: u = (1 + √5)/2 has norm −1 and u³ = 2 + √5, with 2² − 5·1² = −1.
- d = 13: u = (3 + √13)/2 has norm (9 − 13)/4 = −1 and u³ = 18 + 5√13, with 18² − 13·5² = 324 − 325 = −1.
- d = 17 (≡ 1 mod 8): 4² − 17·1² = −1, and the unit 4 + √17 lies in ℤ[√17].
- d = 21: the unit (5 + √21)/2 has norm (25 − 21)/4 = 1 and cube 55 + 12√21 (55² − 21·12² = 1); x² − 21y² = −1 has no solution, since −1 is not a square mod 3.

Proof sketch:

1. 𝓞_K is ℤ[(1 + √d)/2] (Tau Ceti NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one), so its elements are (a + b√d)/2 with a ≡ b (mod 2), and ℤ√d embeds as the elements with a and b even (CA.5/zsqrtd-into-the-ring-of-integers, CA.5/index-of-the-order-z-sqrt-d). A unit u = (a + b√d)/2 has norm (a² − db²)/4 = ν = ±1, so a² − db² = 4ν.
2. (i) If a and b are odd then a² ≡ b² ≡ 1 (mod 8), so a² − db² ≡ 1 − d ≡ 0 (mod 8), which excludes ±4. So a and b are even and u ∈ ℤ[√d].
3. (ii) If a and b are even, u ∈ ℤ[√d] already. Otherwise expand u³ = (a³ + 3ab²d + (3a²b + b³d)√d)/8 and substitute db² = a² − 4ν: u³ = (a(a² − 3ν) + b(a² − ν)√d)/2. For a odd, a² − 3ν and a² − ν are even, so u³ ∈ ℤ[√d], and N(u³) = ν³ = ν.
4. (iii) An integer solution gives an element of ℤ[√d] ⊆ 𝓞_K of norm −1, a unit (Tau Ceti NumberField.exists_norm_eq_neg_one_of_sq_sub_mul_sq_eq_neg_one). Conversely, a unit u of norm −1 gives u (d ≡ 1 mod 8) or u³ (d ≡ 5 mod 8) in ℤ[√d], of norm −1; its coordinates x, y satisfy x² − dy² = −1, since the embedding carries the norm form of ℤ√d to the field norm (CA.5/zsqrtd-into-the-ring-of-integers).

Direct prerequisites: [CA.5/zsqrtd-into-the-ring-of-integers](#CA-5-zsqrtd-into-the-ring-of-integers), [CA.5/index-of-the-order-z-sqrt-d](#CA-5-index-of-the-order-z-sqrt-d), `tauceti:NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one`, `tauceti:NumberField.exists_norm_eq_neg_one_of_sq_sub_mul_sq_eq_neg_one`, `mathlib:Zsqrtd.norm`.

Source: [conrad-quadraticfields-2021](https://kconrad.math.uconn.edu/blurbs/gradnumthy/quadraticgrad.pdf), Section 3, Theorem 3.4, p. 2. The ring 𝓞_K for d ≡ 1 (mod 4), whose units the node compares with ℤ[√d] through their norms (d ≡ 1 mod 8) and their cubes (d ≡ 5 mod 8).

Source: [conrad-pell-one-2025](https://kconrad.math.uconn.edu/blurbs/ugradnumthy/pelleqn1.pdf), Theorem 7.5, p. 12. The Pell-side statement in ℤ[√d]; the node transports solubility of x² − dy² = −1 to the units of 𝓞_K when d ≡ 1 (mod 4).

Proof or interface frontier: Split the three cases and promote the half-coordinate/unit-range suppliers. The reviewed cube formula with ν is correct.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-class-group-of-q-sqrt-minus-14"></a>

### The class group of ℚ(√−14) is cyclic of order 4

`ClassicalArithmeticCompletion:CA.5/class-group-of-q-sqrt-minus-14` · application.

For K = ℚ(√−14), Cl(K) ≅ ℤ/4ℤ.

Hypotheses and conventions: K = ℚ(θ), θ² = −14.

Further acceptance checks:

- h = 4 = |det| of the relation matrix.
- The class group is cyclic, unlike ℚ(√−30) of the same class number.
- The generator is the class of a prime of norm 3.

Proof sketch:

1. M_K = (2/π)√56 ≈ 4.76, so Cl(K) is generated by the primes of norm ≤ 4, which lie over 2 and 3 (CA.5/class-group-generated-by-small-primes).
2. 𝓞_K = ℤ[θ] since −14 ≡ 2 (mod 4); by CA.5/kummer-dedekind-for-a-monogenic-presentation, X² + 14 ≡ X² (mod 2) and ≡ (X − 1)(X + 1) (mod 3), so (2) = p_2² and (3) = p_3 p_3′, and p_3′ ∼ p_3^{−1}.
3. Relations: p_2² = (2); (2 + θ) has norm 18 = 2·3² and is not divisible by 3, so (2 + θ) = p_2 p_3² for the suitably named p_3. The relation lattice of (p_2, p_3) contains the columns (2, 0) and (1, 2).
4. Completeness: p_2 is not principal (a² + 14b² = 2 has no solution), so [p_2] has order 2; [p_3]² = [p_2]^{−1} ≠ 1, so [p_3] has order 4 and generates. Hence Λ is spanned by (2, 0), (1, 2), of index 4 = h.
5. The Smith form of the matrix with columns (2, 0), (1, 2) is diag(1, 4) (CA.3/smith-normal-form-of-an-integer-matrix); CA.5/class-group-of-a-relation-matrix gives Cl(K) ≅ ℤ/4.

Direct prerequisites: [CA.5/class-group-generated-by-small-primes](#CA-5-class-group-generated-by-small-primes), [CA.5/class-group-of-a-relation-matrix](#CA-5-class-group-of-a-relation-matrix), [CA.5/kummer-dedekind-for-a-monogenic-presentation](#CA-5-kummer-dedekind-for-a-monogenic-presentation), [CA.3/smith-normal-form-of-an-integer-matrix](#CA-3-smith-normal-form-of-an-integer-matrix), `tauceti:NumberField.adjoin_gen_eq_top_of_mod_four_ne_one`, `mathlib:Ideal.absNorm_span_singleton`.

Source: [conrad-classgroups-2026](https://kconrad.math.uconn.edu/blurbs/gradnumthy/classgpex.pdf), Example 2.3, p. 2. The node is Example 2.3, rewritten as a relation-matrix computation.

Proof or interface frontier: The example needs independent prime factorisation, valuation, norm obstruction and kernel-completeness suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-class-group-of-q-sqrt-minus-30"></a>

### The class group of ℚ(√−30) is ℤ/2 × ℤ/2

`ClassicalArithmeticCompletion:CA.5/class-group-of-q-sqrt-minus-30` · application.

For K = ℚ(√−30), Cl(K) ≅ ℤ/2ℤ × ℤ/2ℤ.

Hypotheses and conventions: K = ℚ(θ), θ² = −30.

Further acceptance checks:

- h = 4 as for ℚ(√−14), but the invariant factors are (2, 2), not (4).
- Every class has order dividing 2.
- The relation (1, 1, 1) is what cuts (ℤ/2)³ down to (ℤ/2)².

Proof sketch:

1. M_K = (2/π)√120 ≈ 6.97, so the primes over 2, 3 and 5 generate.
2. 𝓞_K = ℤ[θ] (−30 ≡ 2 mod 4); X² + 30 ≡ X² modulo 2, 3 and 5, so (2) = p_2², (3) = p_3², (5) = p_5².
3. Relations: 2e_1, 2e_2, 2e_3 and (θ) = p_2 p_3 p_5 (norm 30), i.e. the columns 2e_1, 2e_2, 2e_3, (1, 1, 1).
4. Completeness: a² + 30b² takes none of the values 2, 3, 5, 6, 10, 15, so no nontrivial product p_2^{a} p_3^{b} p_5^{c} with exponents in {0, 1} other than p_2p_3p_5 is principal; the lattice spanned by the four columns has index 4 in ℤ³ and is the whole relation lattice.
5. The Smith form of the 3 × 4 matrix is diag(1, 2, 2) padded with a zero column; Cl(K) ≅ (ℤ/2)².

Direct prerequisites: [CA.5/class-group-generated-by-small-primes](#CA-5-class-group-generated-by-small-primes), [CA.5/class-group-of-a-relation-matrix](#CA-5-class-group-of-a-relation-matrix), [CA.5/kummer-dedekind-for-a-monogenic-presentation](#CA-5-kummer-dedekind-for-a-monogenic-presentation), [CA.3/smith-normal-form-of-an-integer-matrix](#CA-3-smith-normal-form-of-an-integer-matrix), `tauceti:NumberField.adjoin_gen_eq_top_of_mod_four_ne_one`, `mathlib:Ideal.absNorm_span_singleton`.

Source: [conrad-classgroups-2026](https://kconrad.math.uconn.edu/blurbs/gradnumthy/classgpex.pdf), Example 2.4, pp. 2–3. The conclusion of Example 2.4; the node derives it from the relation matrix.

Proof or interface frontier: The example needs independent prime factorisation, valuation, norm obstruction and kernel-completeness suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-5-certified-number-field-output-interpretation"></a>

### Interpreting certified number-field outputs as intrinsic invariants

`ClassicalArithmeticCompletion:CA.5/certified-number-field-output-interpretation` · application.

For a number field K, the certified outputs of ComputationalNumberTheory:CN.2 are interpreted by the comparison theorems of this layer as follows. (1) A family b of n elements of 𝓞_K with a certificate disc(b) = d_K (or disc(b) squarefree) is an integral basis (CA.5/discriminant-of-a-sublattice-basis). (2) A matrix certified to be in Hermite normal form with an 𝓞_K-stable column lattice is the Hermite matrix of a unique ideal, of norm the product of its pivots (CA.5/hermite-matrix-of-an-ideal-criterion, CA.5/ideal-norm-eq-prod-hermite-diagonal). (3) A family of prime ideals containing all primes of norm ≤ M_K with a relation matrix and a completeness certificate determines Cl(K) ≅ ⊕ ℤ/d_i by the Smith form (CA.5/class-group-of-a-relation-matrix); without the completeness certificate it determines only a multiple of h_K (CA.5/class-number-divides-relation-determinant). (4) A unit family with IsMaxRank and a certified bound h* ≤ h_K R_K with |det A| R(u) < 2h* is a fundamental system (CA.5/class-number-regulator-certificate).

Hypotheses and conventions: The certificates are those CN.2 produces; termination of a search alone is not a certificate of completeness.

Further acceptance checks:

- The worked examples ℚ(√−14) and ℚ(√−30) are instances of clause (3) with hand-checked completeness.
- A relation matrix of determinant 8 for ℚ(√−14) (h = 4) is an output without completeness certificate: clause (3) yields only 4 | 8.
- For ℚ(√5) the unit (1 + √5)/2 with any certified L > R_K/2 is an instance of clause (4) with the class group trivial.

Proof sketch:

1. Each clause is the application of the named comparison theorem to the output, whose hypotheses are exactly the certified properties.
2. The analytic bound h* and its error control are CN.2/CN.4 outputs and enter only as the hypothesis h* ≤ h_K R_K.

Direct prerequisites: `ComputationalNumberTheory:CN.2`, [CA.5/discriminant-of-a-sublattice-basis](#CA-5-discriminant-of-a-sublattice-basis), [CA.5/hermite-matrix-of-an-ideal-criterion](#CA-5-hermite-matrix-of-an-ideal-criterion), [CA.5/ideal-norm-eq-prod-hermite-diagonal](#CA-5-ideal-norm-eq-prod-hermite-diagonal), [CA.5/class-group-of-a-relation-matrix](#CA-5-class-group-of-a-relation-matrix), [CA.5/class-number-divides-relation-determinant](#CA-5-class-number-divides-relation-determinant), [CA.5/class-number-regulator-certificate](#CA-5-class-number-regulator-certificate).

Source: [biasse-fieker-classgroup-2014](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/4387ACB036E3358143A563F196E386CB/S1461157014000345a.pdf/div-class-title-subexponential-class-group-and-unit-group-computation-in-large-degree-number-fields-div.pdf), Section 4.3, printed p. 400. The certification step of a class group and unit computation; the node lists which intrinsic invariant each certified output determines.

Proof or interface frontier: Four unrelated interfaces are bundled; typed comments are honest where upstream owner types are missing, but separate lemma-level interfaces are required.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

### Continuation frontier

- Preserve the CN.2 request for certified basis/ideal/relation/unit outputs, with completeness and error certificates. CA.5 interprets them; it supplies no reverse CA.5→CN.2 algorithm prerequisite. A terminated relation search proves neither a complete class group nor a fundamental unit system.
- The reviewed order-to-unit comparison for d=1 mod 4 now has all four missing API signatures and its four stated acceptance examples in the suggested file. This is typed planning with admitted proofs. Koymans–Pagano route 7 names items 5,9,12, but its positional route verdict is still absent; record that queue boundary rather than inventing acceptance. Their final 2-primary class-group, narrow-principal-class and unit Galois-module comparisons are still to be connected explicitly to the existing order bridge and pinned unit/class-group results. The degree-one d=1 case is excluded by d>1.
- Independent review frontier: 16 existing targets have the mathematical or interface obligations recorded under gaps. Resume those IDs directly; revisionResponse records corrections and checked signatures, without claiming their remaining proofs closed.

## CA.6. Special algebraic numbers and Mahler measure

Build Pisot and Salem predicates from conjugate data and compare house, Mahler measure and heights already in the libraries. Keep constants and lower bounds at their proven strength: Smyth, Dobrowolski and Schinzel–Zassenhaus each have distinct hypotheses and proof inputs. The arithmetic power-polynomial and integral-square-root arguments are separate from the unresolved analytic capacity and rationality suppliers. Classical trace constants routed from Smith remain a continuation frontier; historical conjectural assertions are not promoted to theorems.

Landmarks: Pisot number; Salem number; Lehmer's number; Smyth's theorem on nonreciprocal algebraic integers; Dobrowolski's lower bound; Schinzel–Zassenhaus conjecture (Dimitrov).

<a id="CA-6-pisot-number"></a>

### Pisot numbers

`ClassicalArithmeticCompletion:CA.6/pisot-number` · definition.

A Pisot number is a real number θ that is an algebraic integer (integral over ℤ), satisfies θ > 1, and all of whose other complex conjugates lie in the open unit disc: every complex root z ≠ θ of the minimal polynomial minpoly ℤ θ has |z| < 1. The conjugates are the complex roots of minpoly ℤ θ (Mathlib's aroots of the minimal polynomial over ℤ, which for an algebraic integer is the monic minimal polynomial over ℚ by Gauss's lemma). Convention (pinned): degree one is allowed, so the Pisot numbers of degree one are exactly the integers n ≥ 2; the inequality θ > 1 is strict, so 1 is not a Pisot number.

Hypotheses and conventions: θ real; the definition is a predicate on ℝ, not on an abstract number field. Strict inequalities: θ > 1 and |z| < 1 for every other conjugate z. A conjugate on the unit circle makes θ a Salem number (CA.6/salem-number) or neither, never a Pisot number. Integrality is part of the definition: 3/2 has no other conjugate but is not a Pisot number.

API:

- `IsPisot` (constructor): IsPisot θ :⟺ θ integral over ℤ, 1 < θ, and |z| < 1 for every complex root z ≠ θ of minpoly ℤ θ.
- `IsPisot.isIntegral` (projection): IsPisot θ → θ is an algebraic integer.
- `IsPisot.one_lt` (projection): IsPisot θ → 1 < θ.
- `IsPisot.norm_lt_one` (projection): IsPisot θ, z a complex root of minpoly ℤ θ, z ≠ θ → |z| < 1.
- `IsPisot.eq_of_one_le_norm` (characterisation): IsPisot θ, z a complex root of minpoly ℤ θ with |z| ≥ 1 → z = θ: θ is the only conjugate outside the open unit disc.
- `isPisot_iff_minpoly_rat` (compatibility): IsPisot θ ⟺ θ integral over ℤ, 1 < θ and every complex root z ≠ θ of minpoly ℚ θ has |z| < 1 (the definition read with Mathlib's minimal polynomial over ℚ).
- `isPisot_natCast_iff` (example): For n ∈ ℕ: IsPisot n ⟺ n ≥ 2.

Unit tests:

- `IsPisot.test_goldenRatio` (computation): IsPisot φ for the golden ratio φ = Real.goldenRatio.
- `IsPisot.test_two` (degenerate): IsPisot 2: a degree-one Pisot number.
- `IsPisot.test_not_one` (non-example): ¬ IsPisot 1: a definition with 1 ≤ θ would accept it.
- `IsPisot.test_not_threeHalves` (non-example): ¬ IsPisot (3/2): a definition without integrality would accept it (it has no other conjugate).
- `IsPisot.test_not_sqrtTwo` (non-example): ¬ IsPisot √2: its conjugate −√2 has modulus > 1; a definition asking only for θ > 1 and integrality would accept it.
- `IsPisot.test_mahlerMeasure_goldenRatio` (compatibility): Mathlib's Mahler measure of minpoly ℤ φ = X² − X − 1 mapped to ℂ[X] equals φ.

Further acceptance checks:

- The golden ratio φ = (1 + √5)/2 is a Pisot number (its conjugate −1/φ has modulus 0.618…).
- 2 is a Pisot number; 1, 3/2 and √2 are not.
- M(φ) = φ, agreeing with Mathlib's Polynomial.mahlerMeasure of X² − X − 1.

Proof sketch:

1. Define IsPisot θ as the conjunction of IsIntegral ℤ θ, 1 < θ and the modulus condition on the roots of minpoly ℤ θ in ℂ other than θ.
2. Projections isIntegral, one_lt, norm_lt_one are the three conjuncts.
3. eq_of_one_le_norm: a root z with |z| ≥ 1 cannot be ≠ θ by the modulus condition.
4. isPisot_iff_minpoly_rat: for θ integral over ℤ, minpoly ℤ θ maps to minpoly ℚ θ (minpoly.isIntegrallyClosed_eq_field_fractions'), so the two root multisets in ℂ agree.
5. isPisot_natCast_iff: minpoly ℤ n = X − n has the single root n, so the modulus condition is vacuous and IsPisot n ⟺ n > 1 ⟺ n ≥ 2.

Direct prerequisites: `mathlib:IsIntegral`, `mathlib:minpoly.monic`, `mathlib:Polynomial.aroots`, `mathlib:Polynomial.mem_aroots`, `mathlib:minpoly.isIntegrallyClosed_eq_field_fractions'`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Section 1, p. 5 (arXiv v3). Exactly the definition; the source's 'greater than 1' presupposes a real number.

Source: [srivastava-pisot-2018](https://simonrs.com/eulercircle/numbertheory/varun-sanjay-pisot.pdf), Section 1, Definition 3 and the Example, p. 1. Same definition; the Example (the golden ratio) is the unit test IsPisot.test_goldenRatio.

Source: [srivastava-pisot-2018](https://simonrs.com/eulercircle/numbertheory/varun-sanjay-pisot.pdf), Section 2, Proposition 5, p. 1. The pinned degree-one convention (API item isPisot_natCast_iff).

<a id="CA-6-salem-number"></a>

### Salem numbers

`ClassicalArithmeticCompletion:CA.6/salem-number` · definition.

A Salem number is a real number τ that is an algebraic integer, satisfies τ > 1, all of whose other complex conjugates lie in the closed unit disc (every complex root z ≠ τ of minpoly ℤ τ has |z| ≤ 1), and at least one of whose conjugates lies on the unit circle (some complex root z of minpoly ℤ τ has |z| = 1). This is Salem's form of the definition; by Salem's lemma (CA.6/salem-number-conjugates) it is equivalent to the form 'degree at least 4, conjugate to τ⁻¹, all conjugates other than τ^{±1} of modulus 1'. Convention (pinned): the reciprocal quadratic units (3 + √5)/2, … (sometimes called quadratic Salem numbers) are not Salem numbers.

Hypotheses and conventions: τ real, τ > 1 strictly. The existence of a conjugate on the circle is what excludes Pisot numbers; without it the definition would contain every Pisot number. No degree bound is imposed: degree ≥ 4 is a consequence (CA.6/salem-number-conjugates).

API:

- `IsSalem` (constructor): IsSalem τ :⟺ τ integral over ℤ, 1 < τ, |z| ≤ 1 for every complex root z ≠ τ of minpoly ℤ τ, and some complex root has |z| = 1.
- `IsSalem.isIntegral` (projection): IsSalem τ → τ is an algebraic integer.
- `IsSalem.one_lt` (projection): IsSalem τ → 1 < τ.
- `IsSalem.norm_le_one` (projection): IsSalem τ, z a complex root of minpoly ℤ τ, z ≠ τ → |z| ≤ 1.
- `IsSalem.exists_norm_eq_one` (projection): IsSalem τ → some complex root of minpoly ℤ τ has modulus 1.
- `IsSalem.not_isPisot` (relation): IsSalem τ → ¬ IsPisot τ: the two classes are disjoint.
- `IsSalem.isConjRoot_inv` (relation): IsSalem τ → τ and τ⁻¹ are conjugate over ℚ (IsConjRoot ℚ τ τ⁻¹).
- `IsSalem.four_le_natDegree` (other): IsSalem τ → deg τ ≥ 4.
- `IsSalem.even_natDegree` (other): IsSalem τ → deg τ is even.

Unit tests:

- `IsSalem.test_quartic` (computation): The largest real root 2.1537… of X⁴ − 3X³ + 3X² − 3X + 1 is a Salem number.
- `IsSalem.test_not_two` (degenerate): ¬ IsSalem 2: a degree-one algebraic integer has no conjugate on the circle.
- `IsSalem.test_not_quadraticUnit` (non-example): ¬ IsSalem ((3 + √5)/2): a 'reciprocal of degree ≥ 2' definition would accept this quadratic unit.
- `IsSalem.test_not_goldenRatio` (non-example): ¬ IsSalem φ: φ is a Pisot number, with no conjugate on the circle.
- `IsSalem.test_mahlerMeasure_quartic` (compatibility): Mathlib's Mahler measure of X⁴ − 3X³ + 3X² − 3X + 1 mapped to ℂ[X] equals its largest real root.

Further acceptance checks:

- The largest real root 2.1537… of X⁴ − 3X³ + 3X² − 3X + 1 is a Salem number (Smyth's example).
- Lehmer's number τ₁₀ = 1.17628… is a Salem number (CA.6/lehmer-number-is-salem).
- 2, φ and (3 + √5)/2 are not Salem numbers.

Proof sketch:

1. Define IsSalem τ as the conjunction of IsIntegral ℤ τ, 1 < τ, |z| ≤ 1 for every complex root z ≠ τ of minpoly ℤ τ, and the existence of a complex root z with |z| = 1.
2. Projections are the four conjuncts.
3. not_isPisot: a root z with |z| = 1 is ≠ τ (as τ > 1), so the Pisot condition |z| < 1 fails for it.
4. isConjRoot_inv, four_le_natDegree, even_natDegree: read off from CA.6/salem-number-conjugates (τ⁻¹ is a conjugate; the conjugates other than τ^{±1} lie on the circle, are non-real and come in complex-conjugate pairs, so the degree is 2 + an even number ≥ 2).

Direct prerequisites: `mathlib:IsIntegral`, `mathlib:minpoly.monic`, `mathlib:Polynomial.aroots`, `mathlib:Polynomial.mem_aroots`, `mathlib:IsConjRoot`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Lemma 1, p. 2 (arXiv v3). The hypotheses of Lemma 1 are taken as the definition (the source calls it the usual definition); the source's own definition becomes CA.6/salem-number-conjugates.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Section 1, p. 1. The equivalent form, API items isConjRoot_inv and four_le_natDegree.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 8.1, printed p. 335. Third equivalent description used for the Mahler measure computation M(τ) = τ.

Proof or interface frontier: Definition/tests sound; its API uses the later Salem conjugates theorem without a direct supplier and risks a graph cycle if added wholesale. Move those consequences to separate lemma nodes.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-pisot-and-salem-numbers"></a>

### The classification of Pisot and Salem numbers by conjugate moduli

`ClassicalArithmeticCompletion:CA.6/pisot-and-salem-numbers` · theorem.

Let τ be a real algebraic integer with τ > 1, and let r_> and r_= be the numbers of complex roots of minpoly ℤ τ (counted in the multiset of roots) of modulus > 1 and of modulus = 1. Then (a) τ is a Pisot number iff r_> = 1 and r_= = 0; (b) τ is a Salem number iff r_> = 1 and r_= ≥ 1. In particular every real algebraic integer τ > 1 whose other conjugates lie in the closed unit disc is exactly one of Pisot or Salem, and τ is neither iff r_> ≥ 2. In case (b) the number of roots of modulus < 1 is 1 and r_= = deg τ − 2 ≥ 2 (CA.6/salem-number-conjugates).

Hypotheses and conventions: τ real, integral over ℤ, τ > 1; τ itself is always one of the r_> roots, so r_> ≥ 1. The counts refer to the minimal polynomial; for a non-minimal polynomial P with root τ the certificate form is CA.6/pisot-certificate.

Further acceptance checks:

- φ: r_> = 1, r_= = 0 (Pisot). Lehmer's number: r_> = 1, r_= = 8 (Salem).
- 1 + √3 (conjugate 1 − √3 = −0.73): Pisot. 3 + √2 (conjugate 3 − √2 = 1.59): r_> = 2, neither Pisot nor Salem.

Proof sketch:

1. τ is a root of minpoly ℤ τ of modulus > 1, and the roots are simple (separability in characteristic 0), so r_> ≥ 1 with equality iff every root z ≠ τ has |z| ≤ 1.
2. (a) IsPisot τ ⟺ every root z ≠ τ has |z| < 1 ⟺ (r_> = 1 and no root of modulus 1), since |τ| > 1.
3. (b) IsSalem τ ⟺ every root z ≠ τ has |z| ≤ 1 and some root has modulus 1 ⟺ r_> = 1 and r_= ≥ 1.
4. Exclusivity and exhaustion follow from (a) and (b) as r_= = 0 or r_= ≥ 1.

Direct prerequisites: [CA.6/pisot-number](#CA-6-pisot-number), [CA.6/salem-number](#CA-6-salem-number), `mathlib:Polynomial.aroots`, `mathlib:Polynomial.mem_aroots`, `mathlib:minpoly.irreducible`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Section 1, p. 5, and Lemma 1, p. 2 (arXiv v3). Together with Lemma 1's hypotheses (closed disc, at least one on the circle) this is the dichotomy (a)/(b).

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 8.1, printed p. 335. r_> = 1 for Salem numbers.

Proof or interface frontier: Promote separability/root-count suppliers; the native signature omits the neither/exhaustion and exact circle-count consequences.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-pisot-certificate"></a>

### A root certificate for Pisot numbers

`ClassicalArithmeticCompletion:CA.6/pisot-certificate` · lemma.

Let P ∈ ℤ[X] be monic and θ > 1 a real root of P such that every complex root of P other than one copy of θ (the multiset of complex roots of P with one occurrence of θ removed) has modulus < 1. Then θ is a Pisot number. No irreducibility of P is needed.

Hypotheses and conventions: P monic with integer coefficients; θ real, θ > 1, P(θ) = 0. If θ were a multiple root of P the hypothesis would put θ itself inside the unit disc, which is false; so the hypothesis forces θ to be a simple root.

Further acceptance checks:

- X² − X − 1 certifies φ; X³ − X − 1 certifies θ₀ (its complex roots have |z|² = 1/θ₀ < 1 since the product of the three roots is 1); (X² − X − 1)(X² + X + 1)·… with any cyclotomic factor does not certify, the roots of modulus 1 violating the hypothesis.
- P = (X − 2)(X² + 1) certifies nothing for 2's partner roots i, −i (modulus 1): the lemma does not apply, although 2 is Pisot (the certificate is sufficient, not necessary).

Proof sketch:

1. θ is integral over ℤ (root of the monic P).
2. minpoly ℤ θ divides P in ℤ[X] (Gauss: minpoly ℤ θ is primitive and minpoly ℚ θ ∣ P in ℚ[X]); hence the complex roots of minpoly ℤ θ form a sub-multiset of those of P.
3. A root z ≠ θ of minpoly ℤ θ is therefore a root of P different from θ, hence in the multiset with one copy of θ removed, so |z| < 1.

Direct prerequisites: [CA.6/pisot-number](#CA-6-pisot-number), `mathlib:minpoly.dvd`, `mathlib:minpoly.isIntegrallyClosed_eq_field_fractions'`, `mathlib:Polynomial.mem_aroots`, `mathlib:IsIntegral`, `mathlib:minpoly.isIntegrallyClosed_dvd`.

Source: [srivastava-pisot-2018](https://simonrs.com/eulercircle/numbertheory/varun-sanjay-pisot.pdf), Section 2, Proposition 6 and its proof, p. 2. The source identifies Pisot numbers through a monic integer polynomial; the lemma is the form used to certify conjugate moduli from any monic multiple of the minimal polynomial.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Section 3.2, p. 9 (arXiv v3). Certification from a (possibly reducible) monic integer polynomial, the Pisot counterpart.

<a id="CA-6-reciprocal-iff-reverse"></a>

### Reciprocal algebraic integers and reciprocal minimal polynomials

`ClassicalArithmeticCompletion:CA.6/reciprocal-iff-reverse` · lemma.

Let α ≠ 0 be an algebraic integer in a field of characteristic 0, with minimal polynomial P = minpoly ℤ α of degree d, and let P* = X^d P(1/X) (Mathlib's Polynomial.reverse). Then α is conjugate to α⁻¹ over ℚ (IsConjRoot ℚ α α⁻¹) iff P* = P or P* = −P. In that case P(0) = ±1, so α is a unit.

Hypotheses and conventions: α ≠ 0, so P(0) ≠ 0 and deg P* = deg P. Sign convention: P* = −P occurs exactly for P = X − 1 (a reciprocal polynomial with the minus sign is divisible by X − 1, and P is irreducible).

Further acceptance checks:

- α = 1: P = X − 1, P* = −P, and 1 is conjugate to 1⁻¹.
- α = 2: P = X − 2, P* = 1 − 2X ≠ ±P, and 2 is not conjugate to 1/2.
- Lehmer's polynomial L satisfies L* = L; X³ − X − 1 has reverse −X³ − X² + 1 ≠ ±(X³ − X − 1).

Proof sketch:

1. (⇒) If α⁻¹ is a root of P then α is a root of P* (Polynomial.eval₂_reverse_mul_pow); P is irreducible, so P ∣ P* in ℚ[X]; both have degree d, so P* = c P with c = leading coefficient of P* = P(0) (Polynomial.coeff_zero_reverse, reverse_leadingCoeff).
2. Comparing constant terms: the constant term of P* is the leading coefficient 1 of P, so 1 = c·P(0) = P(0)²; hence P(0) = ±1 and P* = ±P.
3. (⇐) If P* = ±P then P*(α) = 0 gives P(α⁻¹) = 0 (Polynomial.eval₂_reverse_eq_zero_iff); P is irreducible and monic, so P = minpoly ℤ α⁻¹ and minpoly ℚ α = minpoly ℚ α⁻¹ (Gauss's lemma, minpoly.isIntegrallyClosed_eq_field_fractions').

Direct prerequisites: `mathlib:IsConjRoot`, `mathlib:Polynomial.reverse`, `mathlib:Polynomial.eval₂_reverse_mul_pow`, `mathlib:Polynomial.eval₂_reverse_eq_zero_iff`, `mathlib:Polynomial.coeff_zero_reverse`, `mathlib:Polynomial.reverse_leadingCoeff`, `mathlib:minpoly.irreducible`, `mathlib:minpoly.dvd`, `mathlib:minpoly.isIntegrallyClosed_eq_field_fractions'`, `mathlib:minpoly.isIntegrallyClosed_dvd`.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 5.1, printed p. 327. The polynomial side, with both signs.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 5.1, printed p. 327. The implication (⇒); the node adds the converse and the sign analysis.

Proof or interface frontier: The native signature omits the unit and minus-sign classification consequences; isolate those if required.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-salem-number-conjugates"></a>

### Salem's lemma: the conjugates of a Salem number

`ClassicalArithmeticCompletion:CA.6/salem-number-conjugates` · theorem.

A real number τ is a Salem number iff τ is an algebraic integer, τ > 1, deg τ ≥ 4, τ is conjugate to τ⁻¹, and every complex conjugate z of τ other than τ and τ⁻¹ has |z| = 1. Consequently τ⁻¹ is the only conjugate of τ in the open unit disc, the conjugates on the circle are non-real and occur in pairs z, z̄ = z⁻¹, and deg τ is even.

Hypotheses and conventions: τ real; conjugates are the complex roots of minpoly ℤ τ.

Further acceptance checks:

- For Lehmer's number: deg 10, conjugates τ₁₀, τ₁₀⁻¹ and eight on the unit circle.
- For the quartic example 2.1537…: conjugates τ, τ⁻¹ = 0.4643… and 0.19098 ± 0.98159i of modulus 1.

Proof sketch:

1. (⇐) The conditions give |z| ≤ 1 for z ≠ τ (τ⁻¹ < 1 and the others have modulus 1), and deg τ ≥ 4 provides a conjugate other than τ^{±1}, which has modulus 1.
2. (⇒) Let τ′ be a conjugate on |z| = 1. It is not ±1 (otherwise minpoly ℤ τ = X ∓ 1 and τ = ±1), so it is non-real and τ̄′ = τ′⁻¹ is also a conjugate (the minimal polynomial has real coefficients).
3. Hence the minimal polynomial P of τ and its reverse P* share the root τ′⁻¹; by irreducibility P ∣ P*, so the roots of P are closed under z ↦ z⁻¹ (CA.6/reciprocal-iff-reverse); in particular τ⁻¹ is a conjugate: IsConjRoot ℚ τ τ⁻¹. (Source: apply a Galois automorphism mapping τ′⁻¹ to any conjugate τ₁.)
4. τ is the only conjugate of modulus > 1, so by the pairing τ⁻¹ is the only one of modulus < 1, and all others have modulus 1.
5. Degree: τ, τ⁻¹, τ′ and τ̄′ are four distinct roots (τ^{±1} real ≠ ±1, τ′ non-real); the circle roots come in pairs z ≠ z̄, so deg τ = 2 + 2k with k ≥ 1.

Direct prerequisites: [CA.6/salem-number](#CA-6-salem-number), [CA.6/reciprocal-iff-reverse](#CA-6-reciprocal-iff-reverse), `mathlib:IsConjRoot`, `mathlib:minpoly.irreducible`, `mathlib:minpoly.dvd`, `mathlib:Polynomial.mem_aroots`, `mathlib:minpoly.isIntegrallyClosed_dvd`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Lemma 1 and its proof, p. 2 (arXiv v3). The implication (⇒) except the degree bound, which the proof does not address (sourceIssue ClassicalArithmeticCompletion/E702).

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Section 1, p. 1. The right-hand side of the equivalence.

Proof or interface frontier: Split reciprocity, root-location equivalence, non-real circle roots and even degree, and expose separability/real-coefficient suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-salem-minpoly-reciprocal"></a>

### The minimal polynomial of a Salem number is reciprocal

`ClassicalArithmeticCompletion:CA.6/salem-minpoly-reciprocal` · lemma.

If τ is a Salem number with minimal polynomial P = minpoly ℤ τ of degree d, then X^d P(1/X) = P, i.e. Polynomial.reverse P = P (the plus sign).

Hypotheses and conventions: τ a Salem number.

Further acceptance checks:

- reverse L = L for Lehmer's polynomial; reverse (X⁴ − 3X³ + 3X² − 3X + 1) = X⁴ − 3X³ + 3X² − 3X + 1.

Proof sketch:

1. τ is conjugate to τ⁻¹ (CA.6/salem-number-conjugates), so reverse P = ±P (CA.6/reciprocal-iff-reverse).
2. The sign is + : reverse P = −P forces P = X − 1 (P(1) = 0 from P*(1) = P(1) = −P(1) and irreducibility), but deg P ≥ 4.
3. Equivalently: P(0) = (−1)^d ∏ roots = (+1)·τ·τ⁻¹·∏ z z̄ = 1 with d even.

Direct prerequisites: [CA.6/salem-number-conjugates](#CA-6-salem-number-conjugates), [CA.6/reciprocal-iff-reverse](#CA-6-reciprocal-iff-reverse), `mathlib:Polynomial.reverse`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Section 1, p. 1 (arXiv v3). Exactly the statement; the source's 'zdeg P P(z−1) = P(z)' fixes the plus sign.

<a id="CA-6-salem-number-pow"></a>

### Powers of a Salem number

`ClassicalArithmeticCompletion:CA.6/salem-number-pow` · theorem.

If τ is a Salem number of degree d and n ≥ 1, then τⁿ is a Salem number of degree d.

Hypotheses and conventions: n ≥ 1 (τ⁰ = 1 is not Salem).

Further acceptance checks:

- τ₁₀² is a Salem number of degree 10; the quartic example's square is a Salem number of degree 4.

Proof sketch:

1. The conjugates of τⁿ are the n-th powers of the conjugates of τ (a ℚ-embedding of ℚ(τ) sends τⁿ to σ(τ)ⁿ).
2. The degree of τⁿ is d unless two conjugates satisfy τ₁ⁿ = τ₂ⁿ with τ₁ ≠ τ₂; applying a Galois automorphism mapping τ₁ ↦ τ gives τⁿ = τ₃ⁿ with τ₃ ≠ τ a conjugate, impossible since |τⁿ| > 1 ≥ |τ₃ⁿ|.
3. τⁿ > 1 is an algebraic integer; its other conjugates σ(τ)ⁿ have modulus ≤ 1, and a conjugate on the circle stays on the circle.

Direct prerequisites: [CA.6/salem-number](#CA-6-salem-number), `mathlib:IsConjRoot.exists_algEquiv`, `mathlib:IntermediateField.adjoin.finrank`, `mathlib:Polynomial.mem_aroots`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Lemma 2 and its proof, p. 2 (arXiv v3). Exactly the statement (ℕ = {1, 2, …} in the source).

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Proof of Lemma 2, p. 2. The degree-preservation step.

Proof or interface frontier: Split degree preservation from the Salem predicate consequence and expose conjugate-power transport in a normal closure.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-pisot-number-pow"></a>

### Powers of a Pisot number

`ClassicalArithmeticCompletion:CA.6/pisot-number-pow` · theorem.

If θ is a Pisot number and n ≥ 1, then θⁿ is a Pisot number.

Hypotheses and conventions: n ≥ 1.

Further acceptance checks:

- φ² = φ + 1 = 2.618… is a Pisot number (minimal polynomial X² − 3X + 1); θ₀³ = θ₀ + 1 is Pisot.

Proof sketch:

1. The conjugates of θⁿ are among the n-th powers σ(θ)ⁿ of the conjugates of θ.
2. A conjugate σ(θ)ⁿ equal to θⁿ with σ(θ) ≠ θ is impossible (|σ(θ)ⁿ| < 1 < θⁿ); so every conjugate of θⁿ other than θⁿ is σ(θ)ⁿ with σ(θ) ≠ θ, of modulus < 1.
3. θⁿ > 1 is an algebraic integer.

Direct prerequisites: [CA.6/pisot-number](#CA-6-pisot-number), `mathlib:IsConjRoot.exists_algEquiv`, `mathlib:Polynomial.mem_aroots`.

Source: [srivastava-pisot-2018](https://simonrs.com/eulercircle/numbertheory/varun-sanjay-pisot.pdf), Section 2, Proposition 7, p. 2. Exactly the statement; the node supplies the step excluding σ(θ)ⁿ = θⁿ.

Proof or interface frontier: Expose conjugate-power transport; the intended theorem is sound.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-salem-number-iff-trace"></a>

### Salem numbers through their traces τ + τ⁻¹

`ClassicalArithmeticCompletion:CA.6/salem-number-iff-trace` · theorem.

Let τ > 1 be real and α = τ + τ⁻¹. Then τ is a Salem number iff α is an irrational algebraic integer all of whose conjugates other than α are real and lie in (−2, 2). In that case ℚ(α) is a totally real subfield of index 2 in ℚ(τ), α > 2, and deg τ = 2 deg α. Equivalently (Salem): a number field K is ℚ(τ) for a Salem number τ iff K has a totally real subfield ℚ(α) of index 2 with K = ℚ(τ), τ + τ⁻¹ = α, α > 2 an irrational algebraic integer with all other conjugates in (−2, 2).

Hypotheses and conventions: τ > 1 real (so α > 2 automatically). Irrationality of α is essential: α = 3 gives the quadratic unit (3 + √5)/2, which is not a Salem number.

Further acceptance checks:

- Lehmer: α = τ₁₀ + τ₁₀⁻¹ = 2.0264… is the root > 2 of y⁵ + y⁴ − 5y³ − 5y² + 4y + 3, whose other roots −1.887, −1.469, −0.585, 0.914 lie in (−2, 2).
- Quartic example: α = (3 + √5)/2 with conjugate (3 − √5)/2 = 0.382 ∈ (−2, 2).

Proof sketch:

1. (⇒) Every conjugate of α is τ₁ + τ₁⁻¹ for a conjugate τ₁ of τ; τ₁ = τ^{±1} gives α, and |τ₁| = 1 gives τ₁ + τ̄₁ = 2 Re τ₁ ∈ (−2, 2) (τ₁ ≠ ±1). α is an algebraic integer. α is irrational since some conjugate of τ lies on the circle and yields a conjugate of α different from α. ℚ(α) ⊊ ℚ(τ) and τ² − ατ + 1 = 0 give index 2.
2. (⇐) τ is a root of X² − αX + 1, monic over ℤ[α], so τ is an algebraic integer. Every conjugate τ₁ of τ satisfies τ₁ + τ₁⁻¹ = α₁ for a conjugate α₁ of α: α₁ = α gives τ₁ = τ^{±1}; α₁ ∈ (−2, 2) gives |τ₁| = 1 (the roots of X² − α₁X + 1 are non-real of product 1). Every conjugate α₁ of α arises from some τ₁, and α is irrational, so some α₁ ∈ (−2, 2) exists and gives a conjugate of τ on the circle.

Direct prerequisites: [CA.6/salem-number](#CA-6-salem-number), [CA.6/salem-number-conjugates](#CA-6-salem-number-conjugates), `mathlib:Irrational`, `mathlib:IsIntegral`, `mathlib:Polynomial.mem_aroots`, `mathlib:IsConjRoot.exists_algEquiv`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Proposition 3(i), p. 2 (arXiv v3). The field form; the node's element form is what the proof on p. 3 establishes.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Proof of Proposition 3(i), p. 3. Step (⇐).

Proof or interface frontier: The native signature omits the index-two, total-real-subfield and degree formula; those are consumed by 227/236 and need own lemma nodes.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-salem-number-in-field"></a>

### Salem numbers inside ℚ(τ)

`ClassicalArithmeticCompletion:CA.6/salem-number-in-field` · theorem.

Let τ and τ′ be Salem numbers with τ′ ∈ ℚ(τ). Then ℚ(τ′) = ℚ(τ), and if τ′ > τ then τ′/τ is a Salem number (in ℚ(τ)).

Hypotheses and conventions: Both τ, τ′ Salem; the statement uses that a Salem number has a non-real conjugate (it fails for the quadratic units, which have none).

Further acceptance checks:

- τ₁₀² ∈ ℚ(τ₁₀) generates ℚ(τ₁₀) and τ₁₀²/τ₁₀ = τ₁₀ is Salem.

Proof sketch:

1. Write τ′ = p(α) + τ q(α) with p, q ∈ ℚ[X], α = τ + τ⁻¹ (CA.6/salem-number-iff-trace: [ℚ(τ) : ℚ(α)] = 2).
2. If k = [ℚ(τ) : ℚ(τ′)] > 1, then k of the values p(αᵢ) + τᵢ q(αᵢ) over the conjugates τᵢ equal τ′ and k equal τ′⁻¹, so one of them with τᵢ non-real is real, forcing q(αᵢ) = 0, hence q(α) = 0 and τ′ = p(α) totally real, a contradiction. So ℚ(τ′) = ℚ(τ).
3. An automorphism with τ ↦ τ⁻¹ maps τ′ to τ′^{±1}, not to τ′ (else it would fix τ, a polynomial in τ′); so τ′/τ is conjugate to its inverse.
4. The only conjugate of τ′τ⁻¹ outside the closed disc is τ′τ⁻¹ itself (a conjugate τ′₁τ₁⁻¹ outside needs τ′₁ = τ′, then τ₁ = τ, or τ₁ = τ⁻¹, then τ′₁ = τ′⁻¹ and the value is ττ′⁻¹ < 1); with the pairing, all other conjugates lie on the circle: τ′/τ is a Salem number (CA.6/salem-number-conjugates).

Direct prerequisites: [CA.6/salem-number-iff-trace](#CA-6-salem-number-iff-trace), [CA.6/salem-number-conjugates](#CA-6-salem-number-conjugates), `mathlib:IsConjRoot.exists_algEquiv`, `mathlib:IntermediateField.adjoin.finrank`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Proposition 3(ii), p. 3 (arXiv v3). Exactly the statement; the proof on pp. 3-4 is the node's proof steps.

Proof or interface frontier: Split the field-generation and quotient assertions. Quotient integrality relies on units from reciprocity and its degree lower bound needs an explicit supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-salem-numbers-in-field-powers"></a>

### The Salem numbers of a field are the powers of one of them

`ClassicalArithmeticCompletion:CA.6/salem-numbers-in-field-powers` · theorem.

If K = ℚ(τ) for a Salem number τ, there is a Salem number τ₁ ∈ K such that the Salem numbers in K are exactly the powers τ₁ⁿ, n ≥ 1.

Hypotheses and conventions: K generated by a Salem number.

Further acceptance checks:

- For the quartic example τ = 2.1537…, the Salem numbers of ℚ(τ) are the τⁿ, n ≥ 1, τ being the smallest one (Smyth, p. 13); the reciprocal quadratic unit τ + τ⁻¹ = (3 + √5)/2 ∈ ℚ(τ) is not among them.

Proof sketch:

1. The Salem numbers of K below τ are finitely many: they are algebraic integers of degree ≤ [K : ℚ] all of whose conjugates have modulus ≤ τ (Northcott for the house, DiophantineApproximationAndTranscendence:DT.0/finite-algebraic-integers-house-le, or Mathlib's NumberField.Embeddings.finite_of_norm_le in K). Let τ₁ be the smallest.
2. Powers of τ₁ are Salem numbers in K (CA.6/salem-number-pow). (Equivalently: a Salem number τ′ ≤ τ has M(τ′) = τ′ ≤ τ and degree ≤ [K : ℚ], and Polynomial.finite_mahlerMeasure_le leaves finitely many minimal polynomials.)
3. For a Salem number τ′ ∈ K choose r with τ₁^r ≤ τ′ < τ₁^{r+1}; if τ₁^r < τ′ then τ′τ₁^{−r} is a Salem number in K (CA.6/salem-number-in-field, applied r times with CA.6/salem-number-pow) smaller than τ₁, a contradiction; so τ′ = τ₁^r.

Direct prerequisites: [CA.6/salem-number-pow](#CA-6-salem-number-pow), [CA.6/salem-number-in-field](#CA-6-salem-number-in-field), `DiophantineApproximationAndTranscendence:DT.0/finite-algebraic-integers-house-le`, `mathlib:NumberField.Embeddings.finite_of_norm_le`, `mathlib:Polynomial.finite_mahlerMeasure_le`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Proposition 3(iii) and its proof, p. 4 (arXiv v3). Exactly the statement; the finiteness step is the source's 'only ﬁnitely many possibilities for the minimal polynomials'.

<a id="CA-6-salem-number-near-integers"></a>

### λτⁿ is close to integers for a Salem number τ

`ClassicalArithmeticCompletion:CA.6/salem-number-near-integers` · theorem.

For every Salem number τ and every ε > 0 there is a real λ > 0 such that ‖λτⁿ‖ < ε for all n ∈ ℕ, where ‖x‖ = |x − round x| is the distance to the nearest integer. λ can be taken to be an algebraic integer of ℚ(τ).

Hypotheses and conventions: n ranges over all of ℕ, including 0.

Further acceptance checks:

- For τ₁₀ and ε = 1/10 some λ ∈ ℤ[τ₁₀] works; with λ = 1 the statement fails (τⁿ mod 1 is dense in (0, 1), Salem's Theorem V, quoted in Smyth's Section 3.4).

Proof sketch:

1. Let K = ℚ(τ), d = [K : ℚ]. By Minkowski's convex body theorem in the Minkowski space of K (NumberField.mixedEmbedding.exists_ne_zero_mem_ringOfIntegers_lt) there is a nonzero λ ∈ 𝓞_K with |w(λ)| < ε′ at every infinite place w except the real place of τ, where the bound is chosen large enough.
2. Replacing λ by −λ, its value at τ's real embedding is positive (it is nonzero since λ ≠ 0).
3. σₙ = Tr_{K/ℚ}(λτⁿ) = Σ over the embeddings of λ(τᵢ)τᵢⁿ is an integer (Algebra.isIntegral_trace, ℤ integrally closed).
4. All terms but λτⁿ have modulus < ε′ (the other conjugates of τ have modulus ≤ 1), so |σₙ − λτⁿ| < (d − 1)ε′ ≤ ε for ε′ = ε/(d − 1).

Direct prerequisites: [CA.6/salem-number](#CA-6-salem-number), `mathlib:NumberField.mixedEmbedding.exists_ne_zero_mem_ringOfIntegers_lt`, `mathlib:Algebra.isIntegral_trace`, `mathlib:trace_eq_sum_roots`, `mathlib:IsIntegrallyClosed.isIntegral_iff`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Proposition 4, p. 4 (arXiv v3). Exactly the statement.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Proof of Proposition 4, pp. 4-5. The trace step; the lattice step is Minkowski's theorem (sourceIssue ClassicalArithmeticCompletion/E715).

Proof or interface frontier: The native signature omits algebraic-integral λ. Promote the nonzero asymmetric Minkowski box and trace-under-all-embeddings suppliers; trace_eq_sum_roots alone concerns the minpoly of λτⁿ.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-pisot-number-pow-near-integer"></a>

### Powers of a Pisot number are near integers

`ClassicalArithmeticCompletion:CA.6/pisot-number-pow-near-integer` · theorem.

If θ is a Pisot number then ‖θⁿ‖ = |θⁿ − round(θⁿ)| → 0 as n → ∞; more precisely |θⁿ − Tr(θⁿ)| ≤ (d − 1)ρⁿ with d = deg θ, ρ < 1 the largest modulus of a conjugate other than θ, and Tr(θⁿ) ∈ ℤ.

Hypotheses and conventions: θ a Pisot number; for d = 1 the statement is trivial (θⁿ ∈ ℤ).

Further acceptance checks:

- φⁿ + (−1/φ)ⁿ = Lₙ (Lucas numbers), so ‖φⁿ‖ = φ^{−n} for n ≥ 2.
- θ₀¹⁰⁰ is within 2·(0.8689)¹⁰⁰ < 2·10⁻⁶ of the integer Tr(θ₀¹⁰⁰).

Proof sketch:

1. sₙ = Σ over the complex roots z of minpoly ℤ θ of zⁿ is an integer (trace of θⁿ, trace_eq_sum_roots, Algebra.isIntegral_trace, ℤ integrally closed; or CA.6/power-sum-frobenius-congruence).
2. |sₙ − θⁿ| ≤ Σ_{z ≠ θ} |z|ⁿ ≤ (d − 1)ρⁿ → 0.
3. For n large, (d − 1)ρⁿ < 1/2, so round(θⁿ) = sₙ and ‖θⁿ‖ = |θⁿ − sₙ|.

Direct prerequisites: [CA.6/pisot-number](#CA-6-pisot-number), `mathlib:trace_eq_sum_roots`, `mathlib:Algebra.isIntegral_trace`, `mathlib:IsIntegrallyClosed.isIntegral_iff`.

Source: [srivastava-pisot-2018](https://simonrs.com/eulercircle/numbertheory/varun-sanjay-pisot.pdf), Section 3, Theorem 8 and its proof, p. 2. Exactly the statement; the proof's power-sum argument is the node's (with the index misprint of ClassicalArithmeticCompletion/E712 corrected).

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Proof of Proposition 4, p. 5 (arXiv v3). The same trace argument (there with λ and a Salem number).

Proof or interface frontier: The native signature omits integral trace and explicit geometric error. Split the integral power-sum and error estimates, and supply transport of the trace to powers of the conjugates.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-mahler-measure-of-pisot-or-salem"></a>

### M(τ) = ⌈τ⌉ = τ for Pisot and Salem numbers

`ClassicalArithmeticCompletion:CA.6/mahler-measure-of-pisot-or-salem` · lemma.

Let τ > 1 be a real algebraic integer all of whose other conjugates lie in the closed unit disc (a Pisot or a Salem number, CA.6/pisot-and-salem-numbers). Then M(τ) = τ and ⌈τ⌉ = τ.

Hypotheses and conventions: τ algebraic integer, so M(τ) is the Mahler measure of the monic minpoly ℤ τ.

Further acceptance checks:

- M(φ) = φ, M(θ₀) = θ₀, M(L) = τ₁₀.

Proof sketch:

1. M(τ) = ∏ over the roots of max(1, |z|) (Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots, leading coefficient 1); every factor is 1 except max(1, τ) = τ.
2. Every conjugate has modulus ≤ τ and τ is one of them, so ⌈τ⌉ = τ.

Direct prerequisites: `mathlib:Polynomial.mahlerMeasure`, `mathlib:Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `mathlib:minpoly.monic`, `DiophantineApproximationAndTranscendence:DT.0/mahler-measure-of-algebraic-number`, `DiophantineApproximationAndTranscendence:DT.0/house-of-algebraic-number`.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 8.1, printed p. 335. M(τ) = τ read off from formula (2).

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 5.1, printed p. 328. The Pisot case M(θ) = θ.

Proof or interface frontier: The native signature expresses M(τ)=τ and all conjugate norms≤τ, but lacks the house-equality signature.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-reciprocal-pisot-numbers"></a>

### Reciprocal Pisot numbers are quadratic units

`ClassicalArithmeticCompletion:CA.6/reciprocal-pisot-numbers` · lemma.

If θ is a Pisot number conjugate to θ⁻¹, then minpoly ℤ θ = X² − aX + 1 for an integer a ≥ 3; so θ = (a + √(a² − 4))/2 ≥ (3 + √5)/2.

Hypotheses and conventions: θ Pisot and IsConjRoot ℚ θ θ⁻¹.

Further acceptance checks:

- a = 3: θ = (3 + √5)/2 = φ².

Proof sketch:

1. The conjugates are closed under z ↦ z⁻¹ (CA.6/reciprocal-iff-reverse). A conjugate z ≠ θ has |z| < 1, so z⁻¹ has modulus > 1 and equals θ: z = θ⁻¹.
2. So the conjugates are θ, θ⁻¹ (distinct, θ > 1): minpoly ℤ θ = X² − aX + 1 with a = θ + θ⁻¹ ∈ ℤ and constant term θθ⁻¹ = 1.
3. a = θ + θ⁻¹ > 2 (θ ≠ 1), so a ≥ 3.

Direct prerequisites: [CA.6/pisot-number](#CA-6-pisot-number), [CA.6/reciprocal-iff-reverse](#CA-6-reciprocal-iff-reverse), `mathlib:Polynomial.mem_aroots`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Section 4, p. 12 (arXiv v3). Exactly the statement, with the misprint n ≥ 3 corrected to a ≥ 3 (ClassicalArithmeticCompletion/E701).

Proof or interface frontier: The native signature omits the radical formula and lower bound consumed by 234.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-plastic-number"></a>

### The smallest Pisot number θ₀

`ClassicalArithmeticCompletion:CA.6/plastic-number` · definition.

θ₀ = 1.3247179572… is the unique real root of X³ − X − 1 (the plastic number). As a declaration: the supremum of the set of real roots of x³ − x − 1, which is a singleton.

Hypotheses and conventions: X³ − X − 1 has exactly one real root (its discriminant −23 is negative).

API:

- `plasticNumber` (constructor): θ₀ := the supremum of the real roots of x³ − x − 1 (a singleton).
- `plasticNumber_cube` (characterisation): θ₀³ = θ₀ + 1.
- `eq_plasticNumber_of_cube` (characterisation): x ∈ ℝ, x³ = x + 1 → x = θ₀ (the real root is unique).
- `plasticNumber_mem_Ioo` (example): 1.3247 < θ₀ < 1.3248.
- `minpoly_plasticNumber` (other): minpoly ℤ θ₀ = X³ − X − 1.
- `isPisot_plasticNumber` (relation): θ₀ is a Pisot number.
- `plasticNumber_not_isConjRoot_inv` (other): θ₀ is not conjugate to θ₀⁻¹ (it is nonreciprocal).
- `mahlerMeasure_plasticNumber` (compatibility): Mathlib's Mahler measure of X³ − X − 1 mapped to ℂ[X] equals θ₀.

Unit tests:

- `plasticNumber.test_lt_goldenRatio` (computation): θ₀ < φ.
- `plasticNumber.test_goldenRatio_lt_sq` (computation): φ < θ₀² (used by Smyth's trinomial argument).
- `plasticNumber.test_neg_isRoot` (non-example): −θ₀ is the real root of X³ − X + 1 and is negative: the misprinted polynomial X³ − X + 1 does not define θ₀.
- `plasticNumber.test_irrational` (degenerate): θ₀ is irrational, so it is not one of the degree-one Pisot numbers.

Further acceptance checks:

- θ₀ ∈ (1.3247, 1.3248); θ₀ < φ < θ₀²; M(X³ − X − 1) = θ₀.

Proof sketch:

1. Define θ₀ := sup {x ∈ ℝ : x³ − x − 1 = 0}.
2. Uniqueness: x ↦ x³ − x − 1 has local extrema at ±1/√3 with negative values, so exactly one real zero, in (1.3247, 1.3248) by evaluation and the intermediate value theorem.
3. minpoly ℤ θ₀ = X³ − X − 1: the polynomial has no rational root (±1 are not roots), hence is irreducible (degree 3).
4. θ₀ is Pisot: the two complex roots z, z̄ have |z|² = 1/θ₀ < 1 since the product of the roots is 1 (CA.6/pisot-certificate).
5. θ₀ is nonreciprocal: the reverse −X³ − X² + 1 is not ±(X³ − X − 1) (CA.6/reciprocal-iff-reverse).

Direct prerequisites: `mathlib:intermediate_value_Icc`, `mathlib:Polynomial.mahlerMeasure`, [CA.6/pisot-certificate](#CA-6-pisot-certificate), [CA.6/reciprocal-iff-reverse](#CA-6-reciprocal-iff-reverse), [CA.6/mahler-measure-of-pisot-or-salem](#CA-6-mahler-measure-of-pisot-or-salem).

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 5.1, (15), printed p. 328. The definition (the real root of z³ − z − 1) and the nonreciprocity API item.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Section 3.1, p. 7 (arXiv v3). θ₀ as a Pisot number; the unit test lehmerNumber.test_lt_plasticNumber.

Proof or interface frontier: Promote the cube/unique-root, minimal polynomial, Pisot and Mahler measure API consumed by 234/235/242; irreducibility and conjugate norm arguments are nonroutine.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-plastic-number-least-pisot"></a>

### Siegel's theorem: θ₀ is the smallest Pisot number

`ClassicalArithmeticCompletion:CA.6/plastic-number-least-pisot` · theorem.

Every Pisot number θ satisfies θ ≥ θ₀; θ₀ itself is a Pisot number.

Hypotheses and conventions: θ Pisot, of any degree.

Further acceptance checks:

- θ₀ ≤ φ, θ₀ ≤ 2 and θ₀ ≤ (3 + √5)/2, with equality exactly at θ = θ₀ among the examples.

Proof sketch:

1. θ₀ is Pisot (API item isPisot_plasticNumber of CA.6/plastic-number).
2. If θ is conjugate to θ⁻¹ then θ ≥ (3 + √5)/2 > θ₀ (CA.6/reciprocal-pisot-numbers).
3. Otherwise θ is a nonzero nonreciprocal algebraic integer, so θ = M(θ) ≥ θ₀ by Smyth's theorem (CA.6/mahler-measure-of-pisot-or-salem, CA.6/smyth-nonreciprocal-lower-bound).
4. Degree one: θ = n ≥ 2 > θ₀ (covered by the previous step, n being nonreciprocal).

Direct prerequisites: [CA.6/plastic-number](#CA-6-plastic-number), [CA.6/reciprocal-pisot-numbers](#CA-6-reciprocal-pisot-numbers), [CA.6/mahler-measure-of-pisot-or-salem](#CA-6-mahler-measure-of-pisot-or-salem), [CA.6/smyth-nonreciprocal-lower-bound](#CA-6-smyth-nonreciprocal-lower-bound).

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 5.1, printed p. 328. The statement (Siegel); the proof given here derives it from Smyth's theorem, as the survey's remark on the spectrum (p. 328) indicates.

Source: [srivastava-pisot-2018](https://simonrs.com/eulercircle/numbertheory/varun-sanjay-pisot.pdf), Section 6, Theorem 12, p. 2. Same statement (the source's polynomial x³ − x + 1 is a misprint, ClassicalArithmeticCompletion/E711).

Proof or interface frontier: Smyth's theorem (M(α) ≥ θ₀ for a nonzero nonreciprocal algebraic integer) is stated in Smyth's survey (15), printed p. 328, with an outline: the integer power series F = P(0)P/P* (CA.6/smyth-integer-power-series), its factorisation F = f/g into functions bounded by 1 on the unit disc with f(0) = g(0) = M(P)⁻¹, and Schur's characterisation of the coefficients of such functions. The step turning these into the constant θ₀ is in Smyth, On the product of the conjugates outside the unit circle of an algebraic integer, Bull. London Math. Soc. 3 (1971), 169-175, which is not served publicly (the publisher's pages answer automated requests with a challenge page and the author's paper list does not include it); no other public source reproducing the argument was found (searched: arXiv, the author's page, the expositions of Borwein-Hare-Mossinghoff and Saunders, which reach only (1 + √17)/4). Schur's coefficient theorem for bounded analytic functions is also absent from Mathlib and planned by no roadmap. The node carries the outline and the gap; Siegel's theorem on the smallest Pisot number inherits it.

Proof or interface frontier: An inherited explicit gap affects this planned proof: Eisenstein reciprocity still lacks two exact inputs, and least-Pisot still relies on the unresolved analytic Smyth core. The theorem statement is source-supported but this node is not a closed lemma plan.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-lehmer-number"></a>

### Lehmer's number τ₁₀

`ClassicalArithmeticCompletion:CA.6/lehmer-number` · definition.

Lehmer's number τ₁₀ = 1.1762808182… is the largest real root of Lehmer's polynomial L = X¹⁰ + X⁹ − X⁷ − X⁶ − X⁵ − X⁴ − X³ + X + 1. As a declaration: the supremum of the set of real roots of L (which is {τ₁₀⁻¹, τ₁₀}).

Hypotheses and conventions: L has exactly two real roots, τ₁₀ ∈ (1.17628, 1.17629) and τ₁₀⁻¹ = 0.85013…, and eight roots on the unit circle.

API:

- `lehmerNumber` (constructor): τ₁₀ := the supremum of the real roots of L.
- `lehmerNumber_isRoot` (characterisation): L(τ₁₀) = 0.
- `one_lt_lehmerNumber` (other): 1 < τ₁₀.
- `lehmerNumber_mem_Ioo` (example): 1.17628 < τ₁₀ < 1.17629.
- `eq_lehmerNumber_of_isRoot` (characterisation): x ∈ ℝ, x > 1, L(x) = 0 → x = τ₁₀.
- `inv_lehmerNumber_isRoot` (relation): L(τ₁₀⁻¹) = 0 (L is reciprocal).
- `lehmerNumber_add_inv_isRoot` (relation): τ₁₀ + τ₁₀⁻¹ is a root of y⁵ + y⁴ − 5y³ − 5y² + 4y + 3.
- `mahlerMeasure_lehmerPolynomial` (compatibility): Mathlib's Mahler measure of L mapped to ℂ[X] equals τ₁₀.

Unit tests:

- `lehmerNumber.test_lt_plasticNumber` (computation): τ₁₀ < θ₀: a Salem number below the smallest Pisot number.
- `lehmerNumber.test_add_inv_bounds` (computation): 2 < τ₁₀ + τ₁₀⁻¹ < 2.03.
- `lehmerNumber.test_not_isPisot` (non-example): τ₁₀ is not a Pisot number (a definition as the root of maximal modulus would not distinguish).
- `lehmerNumber.test_inv_lt_one` (degenerate): The other real root τ₁₀⁻¹ of L lies in (0, 1).

Further acceptance checks:

- τ₁₀ ∈ (1.17628, 1.17629); τ₁₀ < θ₀; M(L) = τ₁₀.
- 2 < τ₁₀ + τ₁₀⁻¹ < 2.03.

Proof sketch:

1. Define τ₁₀ := sup {x ∈ ℝ : L(x) = 0}.
2. L is reciprocal (reverse L = L), so L(x) = x⁵ Q(x + 1/x) with Q(y) = y⁵ + y⁴ − 5y³ − 5y² + 4y + 3.
3. Q changes sign at −19/10 < −3/2 < −1 < −1/2 < 1/2 < 1 < 2 < 21/10 (values −0.08, 3/32, −1, 13/32, 3.22, −1, −1, 3.33), so its five roots are real: four in (−2, 2) and one, α₁₀ = 2.0264…, in (2, 21/10).
4. A root y ∈ (−2, 2) of Q gives two roots of L on the unit circle; α₁₀ gives the two real roots τ₁₀^{±1} (solutions of x² − α₁₀x + 1 = 0); these are the ten roots of L.
5. The real roots of L are therefore τ₁₀ > 1 and τ₁₀⁻¹ < 1, so the supremum is τ₁₀; its enclosure follows from sign evaluations of L at 1.17628 and 1.17629.

Direct prerequisites: `mathlib:intermediate_value_Icc`, `mathlib:Polynomial.reverse`, `mathlib:Polynomial.mahlerMeasure`, `mathlib:Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 2, printed pp. 323-324. The polynomial and the numerical value M(L) = τ₁₀.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Section 2, p. 5 (arXiv v3). The name τ₁₀.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Example 2.16, printed p. 7. The root configuration; the node proves it by the sign changes of Q.

Proof or interface frontier: Promote the trace-polynomial identity/root isolation and Mahler measure API consumed by 236; they are substantial independent lemmas.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-lehmer-number-is-salem"></a>

### Lehmer's number is a Salem number

`ClassicalArithmeticCompletion:CA.6/lehmer-number-is-salem` · theorem.

τ₁₀ is a Salem number and its minimal polynomial is L = X¹⁰ + X⁹ − X⁷ − X⁶ − X⁵ − X⁴ − X³ + X + 1; in particular deg τ₁₀ = 10 and M(τ₁₀) = τ₁₀.

Hypotheses and conventions: No numerical root finding: the certificate is the list of sign changes of Q(y) = y⁵ + y⁴ − 5y³ − 5y² + 4y + 3 at the rationals −19/10, −3/2, −1, −1/2, 1/2, 1, 2, 21/10.

Further acceptance checks:

- deg τ₁₀ = 10, and L is irreducible over ℚ.

Proof sketch:

1. α₁₀ = τ₁₀ + τ₁₀⁻¹ is a root of the monic integer polynomial Q (API item lehmerNumber_add_inv_isRoot); the other four roots of Q lie in (−2, 2) by the sign changes, so every other conjugate of α₁₀ (a root of minpoly ℤ α₁₀, which divides Q) is real in (−2, 2).
2. α₁₀ ∈ (2, 21/10) is not an integer, hence irrational (an algebraic integer that is rational is an integer).
3. τ₁₀ is a Salem number by CA.6/salem-number-iff-trace.
4. minpoly ℤ α₁₀ = Q: Q has no rational root (the candidates ±1, ±3 are not roots) and no quadratic factor over ℤ (Q mod 2 = y⁵ + y⁴ + y³ + y² + 1 has no root in 𝔽₂ and is not divisible by y² + y + 1, the only irreducible quadratic over 𝔽₂), so deg α₁₀ = 5; deg τ₁₀ = 2 deg α₁₀ = 10 (CA.6/salem-number-iff-trace), and minpoly ℤ τ₁₀ divides the degree-10 monic L, so they are equal.

Direct prerequisites: [CA.6/lehmer-number](#CA-6-lehmer-number), [CA.6/salem-number-iff-trace](#CA-6-salem-number-iff-trace), [CA.6/mahler-measure-of-pisot-or-salem](#CA-6-mahler-measure-of-pisot-or-salem), `mathlib:intermediate_value_Icc`, `mathlib:Polynomial.Monic.irreducible_of_irreducible_map`, `mathlib:IsIntegrallyClosed.isIntegral_iff`, `mathlib:minpoly.dvd`, `mathlib:minpoly.isIntegrallyClosed_dvd`.

Source: [smyth-salem-survey-2015](https://arxiv.org/abs/1408.0195), Section 2, p. 5 (arXiv v3). Exactly the statement.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 8.1, printed p. 335. Same statement, with the Mahler measure.

Proof or interface frontier: Split the F2 irreducibility certificate, degree transport, Salem predicate and minimal polynomial equality; the latter uses the omitted index-two signature from 226.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-house-mahler-measure-comparison"></a>

### Mahler measure versus house

`ClassicalArithmeticCompletion:CA.6/house-mahler-measure-comparison` · lemma.

Let α be an algebraic integer of degree d with r > 0 conjugates of modulus > 1. Then M(α)^{1/d} ≤ M(α)^{1/r} ≤ ⌈α⌉ ≤ M(α).

Hypotheses and conventions: α integral over ℤ, so M(α) = ∏ max(1, |αᵢ|) over its conjugates. r > 0 (if r = 0 then M(α) = 1 and the middle term is undefined).

Further acceptance checks:

- φ: d = 2, r = 1: φ^{1/2} ≤ φ ≤ φ ≤ φ.
- α = √2 + √3 (d = 4, conjugates ±√2 ± √3 of moduli 3.146, 3.146, 0.318, 0.318, so r = 2): M(α) = 5 + 2√6 = 9.899, M^{1/4} = 1.774 ≤ M^{1/2} = 3.146 = ⌈α⌉ ≤ 9.899.

Proof sketch:

1. M(α) = ∏_{|αᵢ| > 1} |αᵢ| (Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots with leading coefficient 1).
2. Each of the r factors is ≤ ⌈α⌉, so M(α) ≤ ⌈α⌉^r.
3. ⌈α⌉ > 1 is one of the factors and the others are ≥ 1, so ⌈α⌉ ≤ M(α).
4. M(α) ≥ 1 and r ≤ d give M(α)^{1/d} ≤ M(α)^{1/r}.
5. For α in a number field K, ⌈α⌉ = NumberField.house α (DiophantineApproximationAndTranscendence:DT.0/house-eq-numberField-house).

Direct prerequisites: `mathlib:Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `mathlib:NumberField.house`, `mathlib:NumberField.house_eq_sup'`, `mathlib:NumberField.Embeddings.range_eval_eq_rootSet_minpoly`, `DiophantineApproximationAndTranscendence:DT.0/mahler-measure-of-algebraic-number`, `DiophantineApproximationAndTranscendence:DT.0/house-of-algebraic-number`, `DiophantineApproximationAndTranscendence:DT.0/house-eq-numberField-house`.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 3, (6), printed p. 324. Exactly the statement (for algebraic integers, the survey's standing context in Section 3).

<a id="CA-6-mahler-measure-of-unit-le-house"></a>

### Mahler measure of a unit versus the houses of α and α⁻¹

`ClassicalArithmeticCompletion:CA.6/mahler-measure-of-unit-le-house` · lemma.

Let α ≠ 0 be an algebraic unit (α and α⁻¹ algebraic integers) of degree d. Then M(α) = M(α⁻¹) and M(α) ≤ max(⌈α⌉, ⌈α⁻¹⌉)^{d/2}.

Hypotheses and conventions: α a unit; α ≠ 0.

Further acceptance checks:

- α = φ: M = φ ≤ max(φ, φ)^{1} = φ (equality).

Proof sketch:

1. The conjugates of α⁻¹ are the αᵢ⁻¹ and ∏|αᵢ| = |N(α)| = 1, so M(α⁻¹) = ∏_{|αᵢ| < 1} |αᵢ|⁻¹ = ∏_{|αᵢ| > 1} |αᵢ| = M(α).
2. M(α)² = M(α)M(α⁻¹) is a product of at most d factors |αᵢ| (|αᵢ| > 1) and |αᵢ|⁻¹ (|αᵢ| < 1), each at most max(⌈α⌉, ⌈α⁻¹⌉).

Direct prerequisites: `mathlib:Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `mathlib:Algebra.norm_eq_prod_roots`, `mathlib:NumberField.house`, [CA.6/house-mahler-measure-comparison](#CA-6-house-mahler-measure-comparison).

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 3, printed p. 324. Exactly the statement.

Reconciled native contracts: `mahlerMeasure_minpoly_inv`.

Proof or interface frontier: The native signature omits M(α)=M(α⁻¹). Add exact direct house/Mahler definitions or number-field restriction rather than relying on a chained comparison node.

Revision disposition: The missing or incomplete native consequences now have checked signatures: mahlerMeasure_minpoly_inv. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-6-one-add-weil-height-le-house"></a>

### ⌈α⌉ ≥ 1 + h(α)

`ClassicalArithmeticCompletion:CA.6/one-add-weil-height-le-house` · lemma.

For a nonzero algebraic integer α of degree d, ⌈α⌉ ≥ M(α)^{1/d} = exp(h(α)) ≥ 1 + h(α), where h(α) = log M(α)/d is the absolute logarithmic Weil height (Mathlib's NumberField.absLogHeight₁). Consequently any lower bound M(α) ≥ c₀ > 1 gives ⌈α⌉ ≥ 1 + log(c₀)/d.

Hypotheses and conventions: α ≠ 0 (for α = 0, ⌈α⌉ = 0 < 1).

Further acceptance checks:

- α = φ: ⌈φ⌉ = 1.618 ≥ 1 + (log φ)/2 = 1.2406.

Proof sketch:

1. If some conjugate has modulus > 1 use CA.6/house-mahler-measure-comparison; otherwise M(α) = 1 and ⌈α⌉ ≥ 1 (NumberField.one_le_house_of_isIntegral).
2. M(α)^{1/d} = absMulHeight₁ α (DiophantineApproximationAndTranscendence:DT.0/height-comparisons), so M(α)^{1/d} = exp(h(α)).
3. exp(t) ≥ 1 + t (Real.add_one_le_exp).

Direct prerequisites: [CA.6/house-mahler-measure-comparison](#CA-6-house-mahler-measure-comparison), `DiophantineApproximationAndTranscendence:DT.0/height-comparisons`, `mathlib:NumberField.one_le_house_of_isIntegral`, `mathlib:NumberField.absLogHeight₁`, `mathlib:Real.add_one_le_exp`.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 3, (9), printed p. 325. Exactly the statement.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 1, (5), printed p. 323. The normalisation h = log M/d, which DT.0/height-comparisons identifies with Mathlib's absLogHeight₁.

<a id="CA-6-unit-of-mahler-measure-lt-two"></a>

### Algebraic numbers with M(α) < 2 are units

`ClassicalArithmeticCompletion:CA.6/unit-of-mahler-measure-lt-two` · lemma.

If α is a nonzero algebraic number with M(α) < 2, then α and α⁻¹ are algebraic integers.

Hypotheses and conventions: M(α) is the Mahler measure of the primitive minimal polynomial (DT.0), equal to absMulHeight₁(α)^{deg α}.

Further acceptance checks:

- M(τ₁₀) = 1.176 < 2 and τ₁₀ is a unit; M(1/2) = 2 and 1/2 is not an algebraic integer.

Proof sketch:

1. The leading coefficient a₀ of the primitive minimal polynomial satisfies a₀ ≤ M(α) < 2, so a₀ = 1 and α is an algebraic integer (API leadingCoeff_le_mahlerMeasure and primitiveMinpoly_eq_minpoly_int of DT.0).
2. N(α) = ± the product of the conjugates is a nonzero rational integer with |N(α)| ≤ M(α) < 2, so N(α) = ±1.
3. α⁻¹ = ±∏_{i ≥ 2} αᵢ is a product of algebraic integers (Berrevoets Lemma 2.8).

Direct prerequisites: `DiophantineApproximationAndTranscendence:DT.0/mahler-measure-of-algebraic-number`, `DiophantineApproximationAndTranscendence:DT.0/primitive-minimal-polynomial`, `DiophantineApproximationAndTranscendence:DT.0/height-comparisons`, `mathlib:Algebra.norm_eq_prod_roots`, `mathlib:Algebra.isIntegral_norm`, `mathlib:IsIntegrallyClosed.isIntegral_iff`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Lemma 2.9, printed p. 6. Exactly the statement; the proof uses Lemma 2.8 and Corollary 2.6.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 3, printed p. 324. Same statement in passing.

Proof or interface frontier: Needs direct primitive leading-coefficient and reciprocal/minimal-polynomial norm suppliers. The stated conclusion is sound.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-smyth-integer-power-series"></a>

### Smyth's rational function F = P(0)P/P* has integer coefficients

`ClassicalArithmeticCompletion:CA.6/smyth-integer-power-series` · lemma.

Let P ∈ ℤ[X] be monic with P(0) = ±1 and P* = X^d P(1/X) its reverse (so P*(0) = 1). Then F = P(0)·P/P* has a Maclaurin expansion with integer coefficients, F(0) = 1, and F is constant iff P is reciprocal (P* = ±P).

Hypotheses and conventions: P monic, P(0) = ±1. (If |P(0)| ≥ 2 then M(P) ≥ |P(0)| ≥ 2 and Smyth's bound is immediate.)

Further acceptance checks:

- P = X³ − X − 1: F = −(X³ − X − 1)/(1 − X² − X³) = 1 + X + … is nonconstant.
- P = L (Lehmer): F = 1.

Proof sketch:

1. P*(0) = 1 is a unit of ℤ, so P* is invertible in ℤ⟦X⟧ and F = P(0)·P·(P*)⁻¹ ∈ ℤ⟦X⟧.
2. F(0) = P(0)·P(0)/1 = P(0)² = 1.
3. If F = c is constant then c = F(0) = 1 and P(0)P = P*, so P* = ±P; conversely P* = ±P = P(0)P (compare constant terms) gives F = 1.

Direct prerequisites: `mathlib:Polynomial.reverse`, `mathlib:Polynomial.coeff_zero_reverse`, `mathlib:PowerSeries.constantCoeff`, `mathlib:Polynomial.coeToPowerSeries.ringHom`, [CA.6/reciprocal-iff-reverse](#CA-6-reciprocal-iff-reverse).

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 5.1, printed p. 328. Exactly the statement (the survey takes P monic, the minimal polynomial of an algebraic integer; the unit hypothesis P(0) = ±1 is the case that matters, see the hypotheses).

Reconciled native contracts: `smyth_quotient_series`.

Proof or interface frontier: The native signature omits F(0)=1; the PowerSeries unit criterion is needed explicitly.

Revision disposition: The missing or incomplete native consequences now have checked signatures: smyth_quotient_series. This checks the types, not the proof; the mathematical suppliers in the original finding remain open.

<a id="CA-6-smyth-nonreciprocal-lower-bound"></a>

### Smyth's theorem: M(α) ≥ θ₀ for nonreciprocal α

`ClassicalArithmeticCompletion:CA.6/smyth-nonreciprocal-lower-bound` · theorem.

Let α be a nonzero algebraic integer that is not conjugate to α⁻¹. Then M(α) ≥ M(X³ − X − 1) = θ₀ = 1.3247…, and the constant is best possible (equality for α = θ₀).

Hypotheses and conventions: α ≠ 0: X is nonreciprocal and M(0) = 1 < θ₀; with Mathlib's convention 0⁻¹ = 0, the value 0 counts as conjugate to its inverse and is excluded by the hypothesis anyway. Reciprocity is IsConjRoot ℚ α α⁻¹ (equivalently minpoly ℤ α reciprocal, CA.6/reciprocal-iff-reverse).

Further acceptance checks:

- α = θ₀ gives equality; α = φ (nonreciprocal: reverse(X² − X − 1) = −X² − X + 1) has M = 1.618 ≥ θ₀.
- Lehmer's number is reciprocal and has M = 1.176 < θ₀: the hypothesis cannot be dropped.

Proof sketch:

1. If α is not a unit, |P(0)| ≥ 2 for P = minpoly ℤ α and M(α) ≥ |P(0)| ≥ 2 > θ₀ (Mahler measure ≥ |product of roots|). Assume P(0) = ±1.
2. F = P(0)P/P* ∈ 1 + Xℤ⟦X⟧ is nonconstant (CA.6/smyth-integer-power-series): F = 1 + a_k X^k + … with a_k ≠ 0.
3. Factor F = f/g with f, g holomorphic on |z| < 1 and bounded by 1 there: g is the Blaschke product over the roots αᵢ with |αᵢ| > 1 of the factors (z − 1/ᾱᵢ)/(1 − z/αᵢ) (normalised), f = Fg; then f(0) = g(0) = M(P)⁻¹.
4. Schur's characterisation of the coefficients of power series bounded by 1 on the disc, combined with the integrality of the coefficients of F = f/g, gives M(P) ≥ θ₀. This analytic step is not given by any source read (Smyth 1971, Bull. London Math. Soc. 3, 169-175, not obtained): recorded as a gap.
5. Sharpness: M(X³ − X − 1) = θ₀ (API item mahlerMeasure_plasticNumber).

Direct prerequisites: [CA.6/smyth-integer-power-series](#CA-6-smyth-integer-power-series), [CA.6/reciprocal-iff-reverse](#CA-6-reciprocal-iff-reverse), [CA.6/plastic-number](#CA-6-plastic-number), `mathlib:Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `mathlib:Algebra.norm_eq_prod_roots`.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 5.1, (15), printed p. 328. Exactly the statement (α ≠ 0 made explicit).

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 5.1, printed p. 328. The outline given in the proof steps; the Schur-coefficient analysis is not in the survey.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Proof of Theorem 1, p. 15 (arXiv v1). The house form ⌈α⌉ ≥ θ₀^{1/n}, the consequence via CA.6/one-add-weil-height-le-house.

Proof or interface frontier: Smyth's theorem (M(α) ≥ θ₀ for a nonzero nonreciprocal algebraic integer) is stated in Smyth's survey (15), printed p. 328, with an outline: the integer power series F = P(0)P/P* (CA.6/smyth-integer-power-series), its factorisation F = f/g into functions bounded by 1 on the unit disc with f(0) = g(0) = M(P)⁻¹, and Schur's characterisation of the coefficients of such functions. The step turning these into the constant θ₀ is in Smyth, On the product of the conjugates outside the unit circle of an algebraic integer, Bull. London Math. Soc. 3 (1971), 169-175, which is not served publicly (the publisher's pages answer automated requests with a challenge page and the author's paper list does not include it); no other public source reproducing the argument was found (searched: arXiv, the author's page, the expositions of Borwein-Hare-Mossinghoff and Saunders, which reach only (1 + √17)/4). Schur's coefficient theorem for bounded analytic functions is also absent from Mathlib and planned by no roadmap. The node carries the outline and the gap; Siegel's theorem on the smallest Pisot number inherits it.

Proof or interface frontier: The Schur analytic step is honestly recorded as a gap. Split the bounded holomorphic factorisation construction and its prerequisites; the statement is not proved by the read survey.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-frobenius-congruence-integer-polynomial"></a>

### f(X)^p ≡ f(X^p) (mod p) for integer polynomials

`ClassicalArithmeticCompletion:CA.6/frobenius-congruence-integer-polynomial` · lemma.

Let p be prime and f ∈ ℤ[X₁, …, Xₙ] (any index type). Then f^p − f(X₁^p, …, Xₙ^p) is divisible by p in ℤ[X₁, …, Xₙ]; in Mathlib's terms (p : MvPolynomial σ ℤ) ∣ f^p − expand p f.

Hypotheses and conventions: p prime.

Further acceptance checks:

- f = X + Y, p = 2: (X + Y)² − (X² + Y²) = 2XY.
- One variable: (X + 1)³ − (X³ + 1) = 3(X² + X).

Proof sketch:

1. Map to (ℤ/p)[X]: there expand p f̄ = f̄^p (MvPolynomial.expand_zmod), so f^p − expand p f maps to 0.
2. A polynomial with integer coefficients mapping to 0 modulo p has all coefficients divisible by p, hence is p times an integer polynomial.

Direct prerequisites: `mathlib:MvPolynomial.expand`, `mathlib:MvPolynomial.expand_zmod`, `mathlib:ZMod.expand_card`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Lemma 2.18 and its proof, printed pp. 8-9. Exactly the statement; the source proves it by induction on the number of terms, the node by Mathlib's Frobenius identity.

<a id="CA-6-power-sum-frobenius-congruence"></a>

### Power sums of roots: s_{np} ≡ s_n (mod p)

`ClassicalArithmeticCompletion:CA.6/power-sum-frobenius-congruence` · lemma.

Let P ∈ ℤ[X] be monic with complex roots α₁, …, α_d (with multiplicity) and sₙ = Σ αᵢⁿ. Then every sₙ is a rational integer, and for every prime p and n ≥ 0, s_{np} ≡ sₙ (mod p).

Hypotheses and conventions: P monic with integer coefficients.

Further acceptance checks:

- P = X² − X − 1: s₁ = 1, s₂ = 3, s₄ = 7; p = 2: s₂ ≡ s₁ (mod 2) and s₄ ≡ s₂ (mod 2).
- P = X − a: s_{np} = a^{np} ≡ aⁿ (mod p) (Fermat).

Proof sketch:

1. sₙ is a symmetric polynomial with integer coefficients in the roots, hence an integer polynomial in the coefficients of P (Newton's identities, MvPolynomial.psum_eq_mul_esymm_sub_sum, Multiset.prod_X_sub_C_coeff).
2. Apply CA.6/frobenius-congruence-integer-polynomial to f = X₁ⁿ + ⋯ + X_dⁿ: sₙ^p − s_{np} = p·g(α₁, …, α_d) with g ∈ ℤ[X₁, …, X_d]; since f^p − expand p f is symmetric, so is g, and g(α) is an integer.
3. Fermat: sₙ^p ≡ sₙ (mod p) (ZMod.pow_card).

Direct prerequisites: [CA.6/frobenius-congruence-integer-polynomial](#CA-6-frobenius-congruence-integer-polynomial), `mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum`, `mathlib:Multiset.prod_X_sub_C_coeff`, `mathlib:ZMod.pow_card`, `mathlib:IsIntegrallyClosed.isIntegral_iff`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Proof of Theorem 2.17, printed p. 10. The congruence (6) σ_{np} ≡ σ_n^p ≡ σ_n (mod p); the symmetry of g_n, needed for rationality, is made explicit.

Proof or interface frontier: Split integrality of power sums and the congruence. The symmetry of the quotient and integer evaluation need a fundamental symmetric-polynomial supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-multiset-eq-of-power-sums-eq"></a>

### Power sums determine a multiset in characteristic zero

`ClassicalArithmeticCompletion:CA.6/multiset-eq-of-power-sums-eq` · lemma.

Let K be a field of characteristic 0 and s, t multisets in K of the same cardinality d. If Σ_{a∈s} a^k = Σ_{b∈t} b^k for k = 1, …, d, then s = t.

Hypotheses and conventions: Characteristic 0 is needed (Newton's identities divide by k ≤ d).

Further acceptance checks:

- s = {1, 2}, t = {0, 3}: p₁ = 3 = 3 but p₂ = 5 ≠ 9, so they differ.
- In characteristic 2, s = {0, 0}, t = {1, 1} have p₁ = p₂ = 0: the characteristic hypothesis is needed.

Proof sketch:

1. Newton's identities (MvPolynomial.mul_esymm_eq_sum) express k·e_k as an integer combination of e_j p_{k−j}; dividing by k (char 0), the elementary symmetric functions e₁, …, e_d of s and t coincide.
2. Hence ∏_{a∈s}(X − a) = ∏_{b∈t}(X − b) (Multiset.prod_X_sub_C_coeff), and s = t as the root multisets of the same polynomial (Polynomial.roots_multiset_prod_X_sub_C).

Direct prerequisites: `mathlib:MvPolynomial.mul_esymm_eq_sum`, `mathlib:Multiset.prod_X_sub_C_coeff`, `mathlib:Polynomial.roots_multiset_prod_X_sub_C`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Lemma 2.20 and the end of the proof of Theorem 2.17, printed pp. 9-10. The step as used; Lemma 2.20's 'Q[Σ1, . . . , Σn]' is a misprint for Σ_d (ClassicalArithmeticCompletion/E708).

<a id="CA-6-conjugate-powers-root-of-unity"></a>

### If α^k and α^l are conjugate (k ≠ l) then α is 0 or a root of unity

`ClassicalArithmeticCompletion:CA.6/conjugate-powers-root-of-unity` · lemma.

Let α be algebraic over ℚ in a field of characteristic 0 and k ≠ l positive integers with α^k and α^l conjugate over ℚ. Then α = 0 or αⁿ = 1 for some n ≥ 1.

Hypotheses and conventions: k, l ≥ 1 distinct.

Further acceptance checks:

- α = i, k = 1, l = 3: i and −i are conjugate and i is a root of unity.
- α = √2: α² = 2 and α⁴ = 4 are not conjugate.

Proof sketch:

1. Work in the normal closure L of ℚ(α); choose σ ∈ Gal(L/ℚ) with σ(α^k) = α^l (IsConjRoot.exists_algEquiv).
2. Induction: σⁿ(α^{kⁿ}) = α^{lⁿ} (σⁿ(α^{kⁿ}) = σ^{n−1}((σ(α^k))^{k^{n−1}}) = σ^{n−1}((α^{k^{n−1}})^l) = (α^{l^{n−1}})^l).
3. With N the order of σ: α^{k^N} = α^{l^N}, k^N ≠ l^N, so α = 0 or α^{|k^N − l^N|} = 1.
4. (Alternative: h(α^k) = k h(α) and conjugates have equal height, so (k − l)h(α) = 0 and Kronecker applies.)

Direct prerequisites: `mathlib:IsConjRoot`, `mathlib:IsConjRoot.exists_algEquiv`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Lemma 2.21 and its proof, printed pp. 9-10. Exactly the statement (the source follows Dobrowolski 1979).

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Proof of Lemma 2.3, p. 5 (arXiv v1). The alternative height argument.

Proof or interface frontier: The argument is sound after choosing a finite normal closure and the automorphism order; cite those exact suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-dobrowolski-house-bound"></a>

### Dobrowolski's house bound ⌈α⌉ > 1 + 1/(4ed²)

`ClassicalArithmeticCompletion:CA.6/dobrowolski-house-bound` · theorem.

Let α be a nonzero algebraic integer of degree d that is not a root of unity. Then ⌈α⌉ > 1 + 1/(4ed²), e = exp(1). Equivalently: if ⌈α⌉ ≤ 1 + 1/(4ed²) then α = 0 or α is a root of unity.

Hypotheses and conventions: α algebraic integer; the bound is for the house (maximal modulus of a conjugate).

Further acceptance checks:

- d = 2: every quadratic non-torsion algebraic integer has ⌈α⌉ > 1 + 1/(16e) = 1.0230; e.g. ⌈φ⌉ = 1.618.
- Lehmer's number (d = 10): 1.176 > 1 + 1/(400e) = 1.00092.

Proof sketch:

1. Choose a prime p with 2ed < p ≤ 4ed (Bertrand, Nat.exists_prime_lt_and_le_two_mul with n = ⌊2ed⌋).
2. Suppose ⌈α⌉ ≤ 1 + 1/(4ed²). For 1 ≤ n ≤ d: |s_{np}| ≤ d⌈α⌉^{np} ≤ d(1 + 1/(4ed²))^{4ed²} ≤ de and |sₙ| ≤ de (1 + t ≤ eᵗ, Real.add_one_le_exp), so |s_{np} − sₙ| ≤ 2de < p.
3. With s_{np} ≡ sₙ (mod p) (CA.6/power-sum-frobenius-congruence) this forces s_{np} = sₙ for n = 1, …, d.
4. So the multisets {αᵢ^p} and {αᵢ} have the same first d power sums and are equal (CA.6/multiset-eq-of-power-sums-eq): α^p is a conjugate of α.
5. p ≠ 1, so α = 0 or a root of unity (CA.6/conjugate-powers-root-of-unity), a contradiction.

Direct prerequisites: [CA.6/power-sum-frobenius-congruence](#CA-6-power-sum-frobenius-congruence), [CA.6/multiset-eq-of-power-sums-eq](#CA-6-multiset-eq-of-power-sums-eq), [CA.6/conjugate-powers-root-of-unity](#CA-6-conjugate-powers-root-of-unity), `mathlib:Nat.exists_prime_lt_and_le_two_mul`, `mathlib:Real.add_one_le_exp`, `DiophantineApproximationAndTranscendence:DT.0/house-of-algebraic-number`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Theorem 2.17, printed p. 8. Exactly the statement (due to Dobrowolski 1978, the source's [4]).

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Proof of Theorem 2.17, printed p. 10. The key step.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 7.1, printed pp. 333-334. The survey quotes Dobrowolski's original constant; the node proves the source's 1/(4ed²).

<a id="CA-6-norm-minpoly-pow-prime-dvd"></a>

### N(f_α(α^p)) is divisible by p^d

`ClassicalArithmeticCompletion:CA.6/norm-minpoly-pow-prime-dvd` · lemma.

Let K be a number field, α ∈ K an algebraic integer with minimal polynomial f_α = minpoly ℤ α, and p a prime. Then N_{K/ℚ}(f_α(α^p)) is a rational integer divisible by p^{[K:ℚ]} (for K = ℚ(α): by p^d, d = deg α).

Hypotheses and conventions: α integral over ℤ.

Further acceptance checks:

- α = 2, p = 3: f_α = X − 2, f_α(8) = 6, divisible by 3.
- α = i, p = 2: f_α(i²) = f_α(−1) = 2 and N_{ℚ(i)/ℚ}(2) = 4 is divisible by 2².

Proof sketch:

1. f_α(X^p) − f_α(X)^p = p·g(X) with g ∈ ℤ[X] (CA.6/frobenius-congruence-integer-polynomial in one variable).
2. At X = α: f_α(α^p) = p·g(α).
3. N_{K/ℚ}(p·g(α)) = p^{[K:ℚ]} N_{K/ℚ}(g(α)), and N(g(α)) is an integer (Algebra.isIntegral_norm, ℤ integrally closed).

Direct prerequisites: [CA.6/frobenius-congruence-integer-polynomial](#CA-6-frobenius-congruence-integer-polynomial), `mathlib:Algebra.isIntegral_norm`, `mathlib:IsIntegrallyClosed.isIntegral_iff`, `mathlib:Polynomial.expand_eval`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Lemma 4.4 and its proof, printed pp. 15-16. Exactly the statement for K = ℚ(α).

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 4.2, printed p. 326. The same arithmetic input in resultant form.

<a id="CA-6-exists-prime-power-not-root"></a>

### A prime p with F(α^p) ≠ 0 in a dyadic range

`ClassicalArithmeticCompletion:CA.6/exists-prime-power-not-root` · lemma.

Let α be a nonzero algebraic integer of degree d, not a root of unity, with deg(αⁿ) = d for all n ≥ 1. Let F ∈ ℤ[X] be nonzero of degree N with N/d ≥ 13, and x = 3(N/d) log(N/d). Then there is a prime p with x < p ≤ 2x and F(α^p) ≠ 0.

Hypotheses and conventions: N/d ≥ 13 (the source's justification 'y ≥ 10' is insufficient, ClassicalArithmeticCompletion/E703). α ≠ 0, which the source omits (for α = 0 and F = X^{13} the conclusion fails, ClassicalArithmeticCompletion/E716).

Further acceptance checks:

- y = 13: x = 100.0…, 3x/(5 log x) = 13.03 > 13 = y; at y = 10 the inequality 9.79 > 10 fails.

Proof sketch:

1. For distinct primes p, q the numbers α^p, α^q are not conjugate (CA.6/conjugate-powers-root-of-unity), so their minimal polynomials, of degree d each, are distinct and coprime.
2. If ζ primes p ∈ (x, 2x] have F(α^p) = 0, the product of the ζ minimal polynomials divides F, so dζ ≤ N.
3. Rosser–Schoenfeld: π(2x) − π(x) > 3x/(5 log x) for x ≥ 41/2 (requested from AnalyticNumberTheory:AN.2); here x ≥ 3·13·log 13 > 100.
4. With y = N/d ≥ 13: 3x/(5 log x) = 9y log y/(5 log(3y log y)) > y ⟺ y⁴ > 243 (log y)⁵, true for y ≥ 13 (28561 > 26950 at y = 13, and y⁴/(log y)⁵ increases for log y > 5/4). So π(2x) − π(x) > ζ.

Direct prerequisites: [CA.6/conjugate-powers-root-of-unity](#CA-6-conjugate-powers-root-of-unity), `AnalyticNumberTheory:AN.2`, `mathlib:minpoly.dvd`, `mathlib:minpoly.irreducible`, `mathlib:minpoly.isIntegrallyClosed_dvd`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Lemma 4.6, printed p. 16. Exactly the hypotheses; the conclusion is 'there exists a prime p such that F(αp) ≠ 0 and x < p ≤ 2x'.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Lemma 4.5, printed p. 16. The input requested from AN.2 (the source's [16], Rosser–Schoenfeld 1962, Corollary 3).

Proof or interface frontier: Split coprime-minpoly product divisibility and the explicit prime-range/counting estimate; the AN.2 request remains necessary.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-degree-drop-mahler-measure"></a>

### Reduction when a power of α has smaller degree

`ClassicalArithmeticCompletion:CA.6/degree-drop-mahler-measure` · lemma.

Let α be an algebraic integer of degree d with M(α) > 1, and suppose deg(αⁿ) < d for some n ≥ 1. Then there is an algebraic integer β with deg β < d and 1 < M(β) ≤ M(α).

Hypotheses and conventions: α algebraic integer (the source states the lemma for algebraic numbers, but its computation of M(β) is valid for algebraic integers only, ClassicalArithmeticCompletion/E707).

Further acceptance checks:

- α = √2 (degree 2, M(α) = 2): α² = 2 has degree 1; f = X² − 2, r = 2, β = f(0) = −2, and 1 < M(β) = 2 ≤ M(α) = 2.
- α=i has degree 2 and α²=−1 has degree 1, but M(α)=1; the M(α)>1 hypothesis cannot be omitted.

Proof sketch:

1. Let f be the monic minimal polynomial of α over ℚ(αⁿ), of degree r = [ℚ(α) : ℚ(αⁿ)] ≥ 2, and β = f(0) ∈ ℚ(αⁿ), an algebraic integer with deg β ≤ deg αⁿ < d.
2. f divides Xⁿ − αⁿ = ∏(X − ζᵏα), so β = ±ζᵐ α^r for an n-th root of unity ζ; hence |σ(β)| = |σ(α)|^r for every embedding σ of ℚ(α).
3. Each conjugate of β occurs [ℚ(α) : ℚ(β)] ≥ r times among the σ(β), so M(β) = (∏_σ max(1, |σ(α)|))^{r/[ℚ(α):ℚ(β)]} ≤ M(α).
4. M(α) > 1 gives some |σ(α)| > 1, so |σ(β)| > 1 and M(β) > 1.

Direct prerequisites: `mathlib:Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `mathlib:IntermediateField.adjoin.finrank`, `mathlib:minpoly.dvd`, `DiophantineApproximationAndTranscendence:DT.0/mahler-measure-of-algebraic-number`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Lemma 4.7 and its proof, printed pp. 16-17. Corrected statement for the integral application with the essential M(α)>1 hypothesis; the source omits that hypothesis (E707).

Proof or interface frontier: Split integrality of the relative-minpoly constant term and the Mahler measure/tower-degree computation; expose relative basis and embedding multiplicities.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-dobrowolski-auxiliary-polynomial"></a>

### Dobrowolski's auxiliary polynomial

`ClassicalArithmeticCompletion:CA.6/dobrowolski-auxiliary-polynomial` · lemma.

Let α be an algebraic integer of degree d, and N, M positive integers with M ≥ 3, N ≥ 10 and dM < N/2. Then there is a nonzero F ∈ ℤ[X] of degree ≤ N with f_α^M ∣ F (α is a zero of multiplicity ≥ M) and max_i |F_i| ≤ N^{2dM²/N} M(α)^{2M}.

Hypotheses and conventions: α algebraic integer; M(α) = ∏ max(1, |σ_k(α)|).

Further acceptance checks:

- α = τ₁₀, M = 20, N = 4000: F = (Φ₆ L)^{20} satisfies the bound (‖F‖ = 1.997·10⁹ ≤ 1.058·10¹⁰, Berrevoets Example 4.10).

Proof sketch:

1. The conditions F^{(i)}(α)/i! = Σ_j C(j, i) F_j α^{j−i} = 0 for 0 ≤ i ≤ M − 1 are M linear equations over ℚ(α) in the N + 1 integer unknowns F_0, …, F_N, with algebraic-integer coefficients a_ij = C(j, i)α^{j−i} (the row i has the entry a_ii = 1 ≠ 0).
2. Siegel's lemma over ℚ(α) in product form (requested from DiophantineApproximationAndTranscendence:DT.0) gives a nonzero integer solution with max |F_j| ≤ ((2√2(N+1))^{dM} ∏_k ∏_i max_j |σ_k(a_ij)|)^{1/(N+1−dM)}.
3. max_j |C(j,i) σ_k(α)^{j−i}| ≤ N^i max(1, |σ_k α|)^N, and ∏_k ∏_{i<M} gives N^{dM²/2} M(α)^{MN}.
4. 2√2(N + 1) ≤ N^{M/2} (N ≥ 10, M ≥ 3) and N − dM ≥ N/2 give the bound N^{2dM²/N} M(α)^{2M}.
5. The vanishing of F, F′, …, F^{(M−1)} at α gives f_α^M ∣ F in ℚ[X], hence in ℤ[X] as f_α is monic.

Direct prerequisites: `DiophantineApproximationAndTranscendence:DT.0`, `DiophantineApproximationAndTranscendence:DT.0/mahler-measure-of-algebraic-number`, `mathlib:minpoly.dvd`, `mathlib:minpoly.monic`, `mathlib:minpoly.isIntegrallyClosed_dvd`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Lemma 4.8, printed p. 17. Exactly the statement, with the bound max |Fi| ≤ N^{2dM²/N}M(α)^{2M} (16); the displayed system (17) has the misprint F_k for F_j (ClassicalArithmeticCompletion/E704).

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Lemma 3.2, printed p. 11. The product-form Siegel lemma requested from DT.0.

Proof or interface frontier: Split multiplicity/divisibility and auxiliary coefficient estimates; the requested product-form Siegel lemma remains unresolved.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-dobrowolski-lower-bound"></a>

### Dobrowolski's lower bound for the Mahler measure

`ClassicalArithmeticCompletion:CA.6/dobrowolski-lower-bound` · theorem.

Let α be a nonzero algebraic number of degree d ≥ 2 that is not a root of unity. Then M(α) ≥ 1 + (1/11700)·(log log d / log d)³. Here M(α) is the Mahler measure of the primitive minimal polynomial (DT.0), equal to absMulHeight₁(α)^d; equivalently d·h(α) ≥ log(1 + (1/11700)(log log d/log d)³).

Hypotheses and conventions: d ≥ 2 (for d = 2 the right-hand side is below 1, since log log 2 < 0, and the statement is immediate). The constant 1/11700 is the one the source read proves; Dobrowolski's own constant 1/1200 and Voutier's 1/4 (Smyth's survey, (11) and Section 4.2) are proved in papers not read here and are not targets of this node.

Further acceptance checks:

- d = 10 (Lehmer): the bound 1 + (1/11700)(log log 10/log 10)³ = 1.0000041 is below M(τ₁₀) = 1.176.
- d = 21: the bound is 1 + (1/11700)(0.3657)³ = 1.0000042; the proof's choice is M = 20, N = 8400.

Proof sketch:

1. Non-integral α: the leading coefficient a₀ ≥ 2 of the primitive minimal polynomial gives M(α) ≥ 2 (DT.0 API leadingCoeff_le_mahlerMeasure) (source gap ClassicalArithmeticCompletion/E705). Assume α integral.
2. d ≤ 20: M(α) ≥ ⌈α⌉ > 1 + 1/(4ed²) ≥ 1 + 1/(4e·400) > 1 + (1/11700)(1/e)³ ≥ the bound, since log log x/log x ≤ 1/e (CA.6/dobrowolski-house-bound, CA.6/house-mahler-measure-comparison).
3. If deg αⁿ < d for some n, pass to β of CA.6/degree-drop-mahler-measure and use strong induction on d: for deg β ≥ 21 the bound is non-increasing in the degree (log log x/log x decreases for x ≥ e^e), for 2 ≤ deg β ≤ 20 use the previous step, for deg β = 1 M(β) = |β| ≥ 2 (source gap ClassicalArithmeticCompletion/E706). Assume deg αⁿ = d for all n ≥ 1.
4. d ≥ 21: M := ⌈7 log d/log log d⌉ (≥ 20), N := dM². CA.6/dobrowolski-auxiliary-polynomial gives F; CA.6/exists-prime-power-not-root gives a prime p ∈ (3M² log M², 6M² log M²] with F(α^p) ≠ 0. Replace F by X^(N−natDegree F)·F so its degree is exactly N before invoking exists-prime-power-not-root. Since α≠0, this preserves the zero multiplicity, coefficient maximum, and nonvanishing at each α^p.
5. Upper bound: |N(F(α^p))| ≤ ‖F‖^d M(α)^{pN} (each |F(σ_k α^p)| ≤ ‖F‖ max(1, |σ_k α|)^{pN}).
6. Lower bound: F = f_α^M g with g ∈ ℤ[X], so N(F(α^p)) = N(f_α(α^p))^M N(g(α^p)) is a nonzero integer divisible by p^{dM} (CA.6/norm-minpoly-pow-prime-dvd).
7. Using ‖F‖₁≤(N+1)·max_i|F_i| gives p^M≤(N+1)N^{2dM²/N}M(α)^{2M+pN/d}, hence (2M+pN/d)log M(α)≥M log p−log(N+1)−2 log N. The rounded choice M=ceil(7 log d/log log d) needs an explicit numerical lemma: for d≥21, 20≤M≤d−1 and M≤(7+1/e)log d/log log d, so N+1≤d³ and log(N+1)+2 log N≤9 log d. The remaining log p, M log M and constant-1/11700 inequalities need separate supporting nodes; this calculation is a recorded closure gap, not a supplied lemma.
8. Finally M(α) ≥ 1 + log M(α).

Direct prerequisites: [CA.6/dobrowolski-house-bound](#CA-6-dobrowolski-house-bound), [CA.6/house-mahler-measure-comparison](#CA-6-house-mahler-measure-comparison), [CA.6/degree-drop-mahler-measure](#CA-6-degree-drop-mahler-measure), [CA.6/dobrowolski-auxiliary-polynomial](#CA-6-dobrowolski-auxiliary-polynomial), [CA.6/exists-prime-power-not-root](#CA-6-exists-prime-power-not-root), [CA.6/norm-minpoly-pow-prime-dvd](#CA-6-norm-minpoly-pow-prime-dvd), `DiophantineApproximationAndTranscendence:DT.0/mahler-measure-of-algebraic-number`, `DiophantineApproximationAndTranscendence:DT.0/height-comparisons`, `mathlib:Algebra.norm_eq_prod_roots`, `mathlib:Real.add_one_le_exp`.

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Theorem 4.1, printed p. 15. Statement checked; the proof needs degree padding and the N+1 coefficient-sum correction (E718), with rounding/constant estimates still an explicit closure gap.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 4.2, (11), printed p. 326. The original constant, not proved in the sources read.

Proof or interface frontier: The upper estimate uses ‖F‖ as max coefficient, while evaluation requires the L1 coefficient norm. That norm is ≤(N+1)max |Fi|, not N max. Moreover the auxiliary F has degree≤N but 249 uses its actual degree; padding to exact degree N is possible for α≠0 but not supplied. Record both gaps and rederive the explicit constants after fixing them. Split the multi-page estimates and induction. Corrected exact-degree application by X-power padding and restored L1 coefficient bound (N+1). Rounding and final numerical constant estimates remain separate missing lemma suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-root-power-polynomial"></a>

### The polynomial P_m = ∏(X − αᵢ^m)

`ClassicalArithmeticCompletion:CA.6/root-power-polynomial` · definition.

For a commutative ring R, a monic P ∈ R[X] of degree n and m ∈ ℕ, P_m is the characteristic polynomial of multiplication by x^m on the free R-module R[x]/(P) of rank n (basis 1, x, …, x^{n−1}, AdjoinRoot.powerBasis'). If P = ∏(X − αᵢ) over a field containing the roots, then P_m = ∏(X − αᵢ^m); in particular P_m ∈ ℤ[X] for P ∈ ℤ[X] monic.

Hypotheses and conventions: P monic (so R[x]/(P) is free of rank deg P); m ≥ 0 arbitrary.

API:

- `rootPowPoly` (constructor): P_m := charpoly of multiplication by x^m on R[x]/(P), for P monic.
- `rootPowPoly_monic` (other): P_m is monic (R nontrivial).
- `natDegree_rootPowPoly` (other): deg P_m = deg P.
- `rootPowPoly_one` (simp): P_1 = P.
- `rootPowPoly_zero` (simp): P_0 = (X − 1)^{deg P}.
- `map_rootPowPoly` (functoriality): For f : R →+* S: (P.map f)_m = (P_m).map f.
- `rootPowPoly_eq_prod_roots` (characterisation): Over a field in which P splits: P_m = ∏ over the roots a of P (with multiplicity) of (X − a^m).
- `rootPowPoly_rootPowPoly` (relation): (P_m)_k = P_{mk}.
- `rootPowPoly_eq_minpoly_pow` (relation): For L/K finite and α ∈ L: (minpoly K α)_m = (minpoly K α^m)^{[K(α):K(α^m)]}.
- `rootPowPoly_two_comp_X_sq` (relation): P_2(X²) = (−1)^{deg P} P(X) P(−X) (Graeffe's root squaring).

Unit tests:

- `rootPowPoly.test_X_sub_C` (computation): (X − a)_m = X − a^m in ℤ[X].
- `rootPowPoly.test_X_sq_sub_two` (computation): (X² − 2)_2 = (X − 2)².
- `rootPowPoly.test_cyclotomic_three` (computation): (Φ₃)_2 = Φ₃ (an odd-level cyclotomic polynomial is fixed by squaring its roots).
- `rootPowPoly.test_one` (degenerate): 1_m = 1 (degree 0).
- `rootPowPoly.test_ne_comp` (non-example): For P = X² + 1: P_2 = (X + 1)², which differs from P(X²) = X⁴ + 1 (the tempting definition by substitution).

Further acceptance checks:

- (X − a)_m = X − a^m; (X² − 2)_2 = (X − 2)²; (Φ₃)_2 = Φ₃.

Proof sketch:

1. Define P_m := charpoly of Algebra.leftMulMatrix of x^m in the power basis of AdjoinRoot P.
2. Monic of degree n (Matrix.charpoly_monic); P_1 = P (charpoly_leftMulMatrix: the charpoly of the generator of a power basis is its minimal polynomial, which for AdjoinRoot of a monic P is P); P_0 = (X − 1)^n.
3. Base change: the power basis and the matrix commute with ring homomorphisms, so (P.map f)_m = (P_m).map f.
4. Over a field where P splits, the matrix of x is triangularisable with diagonal αᵢ, so that of x^m has diagonal αᵢ^m: P_m = ∏(X − αᵢ^m) (equivalently, the eigenvalues of a power are the powers of the eigenvalues).
5. (P_m)_k = P_{mk} from the root formula over a splitting field and base change injectivity for ℤ ⊂ ℂ.
6. For P = minpoly K α (L/K finite): P_m = (minpoly K α^m)^{[K(α):K(α^m)]} (the conjugates of α^m are the α_i^m, each repeated [K(α):K(α^m)] times).
7. Graeffe relation: P_2(X²) = (−1)^n P(X)P(−X).

Direct prerequisites: `mathlib:AdjoinRoot.powerBasis'`, `mathlib:Algebra.leftMulMatrix`, `mathlib:Matrix.charpoly`, `mathlib:Matrix.charpoly_monic`, `mathlib:charpoly_leftMulMatrix`, `mathlib:Polynomial.Splits.eq_prod_roots_of_monic`, `mathlib:IntermediateField.adjoin.finrank`.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Lemma 2.1, pp. 3-4 (arXiv v1). Exactly the object; the characteristic-polynomial construction is the intrinsic form that makes P_m ∈ ℤ[X] a definition rather than a claim.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Proof of Theorem 1, p. 16 (arXiv v1). The API item rootPowPoly_eq_minpoly_pow for m = 2.

Proof or interface frontier: Promote consumed root-product, composition, minpoly-power and Graeffe API to lemma nodes. The proof of composition invokes ℤ→ℂ though its signature is for arbitrary commutative rings; needs a universal polynomial identity. In positive characteristic the minpoly-power proof should use norm/tower transport rather than distinct conjugates.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-root-power-polynomial-congruence"></a>

### Arnold–Smyth congruence P₄ ≡ P₂ (mod 4)

`ClassicalArithmeticCompletion:CA.6/root-power-polynomial-congruence` · lemma.

For every monic P ∈ ℤ[X], P₄ − P₂ ∈ 4ℤ[X].

Hypotheses and conventions: P monic with integer coefficients.

Further acceptance checks:

- P = X − a: a⁴ ≡ a² (mod 4).
- P = X² − X − 1: P₂ = X² − 3X + 1, P₄ = X² − 7X + 1, difference −4X.

Proof sketch:

1. Coefficient of X^{n−1}: s₂ = e₁² − 2e₂ and s₄ = e₁⁴ + 2e₂² − 4(e₁²e₂ − e₁e₃ + e₄) (Newton), so s₄ − s₂ ≡ e₁²(e₁² − 1) + 2e₂(e₂ + 1) ≡ 0 (mod 4) for integers eᵢ (e₁²(e₁² − 1) ≡ 0 mod 4 in both parities, e₂(e₂ + 1) is even).
2. Coefficient of X^{n−k}: it is ± e_k(α₁^m, …, α_n^m) = ± s_m(β) for the k-fold products β = α_{i₁}⋯α_{i_k}, the roots of the k-th symmetric power polynomial ∏_I(X − α_I) ∈ ℤ[X] (fundamental theorem of symmetric polynomials); apply the first step to that polynomial.
3. Hence every coefficient of P₄ − P₂ is divisible by 4.

Direct prerequisites: [CA.6/root-power-polynomial](#CA-6-root-power-polynomial), `mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum`, `mathlib:MvPolynomial.esymm`, `mathlib:Multiset.prod_X_sub_C_coeff`.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Lemma 2.1, (2), and its proof, p. 4 (arXiv v1). Exactly the statement (due to Arnold and Smyth); the proof is the symmetric-powers argument.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Proof of Lemma 2.1, p. 4. The first step (e₁⁴ ≡ e₁² and 2e₂² ≡ −2e₂ mod 4).

Proof or interface frontier: The k-fold-product polynomial is an exterior-power construction, not a symmetric power. Supply a separate integer polynomial/root-multiset lemma and use it as a direct prerequisite.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-sqrt-one-add-four-integral"></a>

### √(1 + 4Y) has integer coefficients

`ClassicalArithmeticCompletion:CA.6/sqrt-one-add-four-integral` · lemma.

There is T ∈ ℤ⟦Y⟧ with constant term 1 and T² = 1 + 4Y; explicitly T = 1 + 2Σ_{k≥0} (−1)^k C_k Y^{k+1} with C_k the Catalan numbers, equivalently T = Σ_k C(1/2, k) 4^k Y^k.

Hypotheses and conventions: Power series over ℤ.

Further acceptance checks:

- T = 1 + 2Y − 2Y² + 4Y³ − 10Y⁴ + …

Proof sketch:

1. With c(x) = Σ C_k x^k, the Catalan recurrence (catalan_succ) is c = 1 + x c² in ℤ⟦x⟧.
2. T = 1 − 2x c(x) at x = −Y; T² = 1 − 4x c + 4x²c² = 1 − 4x(c − x c²) = 1 − 4x = 1 + 4Y.

Direct prerequisites: `mathlib:catalan`, `mathlib:catalan_succ`, `mathlib:PowerSeries.constantCoeff`, `mathlib:PowerSeries.X`.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Section 2, (3), p. 4 (arXiv v1). Exactly the statement; the Catalan form is the proof of integrality.

<a id="CA-6-integral-square-root-power-series"></a>

### Square roots with integer coefficients (Dimitrov Proposition 2.2)

`ClassicalArithmeticCompletion:CA.6/integral-square-root-power-series` · lemma.

Let Q ∈ ℤ[X] with Q(0) = 1 and Q a square modulo 4 (Q = U² + 4V with U, V ∈ ℤ[X]). Then there is S ∈ ℤ⟦X⟧ with S(0) = 1 and S² = Q. In particular, for P ∈ ℤ[X] monic with P* = X^n P(1/X), √(P₂*·P₄*) ∈ 1 + Xℤ⟦X⟧.

Hypotheses and conventions: Q(0) = 1.

Further acceptance checks:

- Q = 1 − 4X = 1² + 4(−X) (Catalan): S = 1 − 2X − 2X² − 4X³ − ….
- Q = 1 − 6X + X² = (1 − X)² + 4(−X) (large Schröder numbers): S ∈ ℤ⟦X⟧.

Proof sketch:

1. From Q(0)=U(0)²+4V(0)=1, U(0) is odd; it need not equal ±1 (U=3,V=−2,Q=1 is a counterexample). Put k=(1−U(0))/2, U′=U+2k and V′=V−kU−k². Then Q=U′²+4V′, U′(0)=1 and V′(0)=0. Use U′,V′ in the following steps.
2. U′ is a unit of ℤ⟦X⟧ because U′(0)=1. Put Y=V′/(U′)², whose constant term is zero, and substitute Y into the integral series T of sqrt-one-add-four-integral. Define S=U′·T(Y).
3. The substitution identity gives S²=(U′)²(1+4V′/(U′)²)=Q; its constant term is U′(0)·T(0)=1.
4. For P monic: (P₂P₄)* = P₂*P₄* has constant term 1 and is ≡ (P₂*)² (mod 4) by CA.6/root-power-polynomial-congruence (reversal commutes with reduction mod 4).

Direct prerequisites: [CA.6/sqrt-one-add-four-integral](#CA-6-sqrt-one-add-four-integral), [CA.6/root-power-polynomial-congruence](#CA-6-root-power-polynomial-congruence), [CA.6/root-power-polynomial](#CA-6-root-power-polynomial), `mathlib:Polynomial.reverse`, `mathlib:Polynomial.coeToPowerSeries.ringHom`.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Proposition 2.2 and its proof, p. 4 (arXiv v1). Exactly the statement.

Proof or interface frontier: False inference U(0)=±1 from U(0)²+4V(0)=1; corrected by an even constant shift U′=U+2k and corresponding V′.

Revision disposition: The corrected even constant shift is retained and the remaining proof steps now consistently use U′, V′. The source proof was reread at Proposition 2.2, p.4. Substitution and integrality suppliers remain part of the proof frontier.

<a id="CA-6-root-power-polynomial-square-cyclotomic"></a>

### When P₂P₄ is a square (Dimitrov Lemma 2.3)

`ClassicalArithmeticCompletion:CA.6/root-power-polynomial-square-cyclotomic` · lemma.

Let P ∈ ℤ[X] be monic irreducible of degree n > 1 with P₂ not a perfect square. Then the following are equivalent: (i) P = Φ_N for N > 0 with 4 ∤ N; (ii) P₂ = P₄; (iii) P₂P₄ is a perfect square in ℤ[X]; (iv) P₂P₄ is a square in ℚ(X) (the function √(P₂P₄) is rational).

Hypotheses and conventions: P irreducible and P₂ not a square; then P₂ is irreducible (P₂ = (minpoly α²)^{[ℚ(α):ℚ(α²)]} with exponent 1 or 2, API rootPowPoly_eq_minpoly_pow), a step the source leaves implicit (ClassicalArithmeticCompletion/E709). The source odd-level condition is false: P=Φ₆ has P₂=P₄=Φ₃ and P₂ is not a square. Under the standing nonsquare hypothesis the correct cyclotomic levels have 4 ∤ N. This includes odd N and twice an odd N.

Further acceptance checks:

- P = Φ₃: P₂ = P₄ = Φ₃.
- P = Φ₄ = X² + 1: P₂ = (X + 1)² is a square (excluded by the hypothesis).
- P = X² − X − 1: P₂ = X² − 3X + 1, P₄ = X² − 7X + 1, P₂P₄ not a square.
- P=Φ₆=X²−X+1: P₂=P₄=Φ₃, while 6 is even. This catches the false odd-level assertion in the preprint.

Proof sketch:

1. (i) ⇒ (ii): if N is odd then P₂=P₄=Φ_N; if N=2M with M odd then P₂=P₄=Φ_M. Thus the equality holds whenever 4∤N.
2. (ii) ⇒ (iii) ⇒ (iv): P₂P₄ = P₂².
3. (iv) ⇒ (iii): a monic integer polynomial that is a square in ℚ(X) is the square of a monic polynomial in ℚ[X], which has integer coefficients (Gauss).
4. (iii) ⇒ (i): P₂ is irreducible and squarefree, so its roots occur in P₄. Hence α² and α⁴ are conjugate; CA.6/conjugate-powers-root-of-unity gives α a root of unity, since α≠0. Thus P=Φ_N for N>0. If 4∣N then P₂=Φ_(N/2)², contrary to the nonsquare hypothesis, so 4∤N. The cyclotomic root-squaring formula needs a separate supplier.

Direct prerequisites: [CA.6/root-power-polynomial](#CA-6-root-power-polynomial), [CA.6/conjugate-powers-root-of-unity](#CA-6-conjugate-powers-root-of-unity), `mathlib:Polynomial.cyclotomic`, `mathlib:Polynomial.cyclotomic_eq_minpoly`, `mathlib:IsConjRoot.exists_algEquiv`.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Lemma 2.3, p. 5 (arXiv v1). The equivalence after correcting (i) to cyclotomic of level N with 4∤N; Φ₆ disproves the printed odd-level restriction. The non-square-to-irreducible and cyclotomic-level steps need explicit lemma suppliers.

Proof or interface frontier: Φ6 provides a counterexample to the odd-level equivalence: P2=P4=Φ3 is nonsquare. Correct level restriction is 4∤N under nonsquare P2.

Revision disposition: The 4∤N correction is retained and Φ₆ is a regression counterexample to odd level. Lemma 2.3, p.5 was reread. The cyclotomic power-polynomial supplier remains unresolved.

<a id="CA-6-schinzel-zassenhaus-dimitrov"></a>

### Dimitrov's theorem: the Schinzel–Zassenhaus conjecture

`ClassicalArithmeticCompletion:CA.6/schinzel-zassenhaus-dimitrov` · theorem.

Let P ∈ ℤ[X] be monic irreducible of degree n > 1 and not cyclotomic. Then P has a complex root of modulus at least 2^{1/(4n)} = 1 + log 2/(4n) + O(1/n²). Equivalently, a nonzero algebraic integer α of degree n > 1 that is not a root of unity has ⌈α⌉ ≥ 2^{1/(4n)}.

Hypotheses and conventions: Cyclotomic means P = Φ_N for some N, i.e. its roots are roots of unity. This settles the Schinzel–Zassenhaus conjecture ⌈α⌉ ≥ 1 + c/d with c = log 2/4 − ε asymptotically.

Further acceptance checks:

- P = X² − X − 1: max|α| = φ ≥ 2^{1/8} = 1.0905.
- Lehmer's L (n = 10): τ₁₀ = 1.1763 ≥ 2^{1/40} = 1.0175.
- Cyclotomic Φ_N has all roots of modulus 1: the hypothesis cannot be dropped.

Proof sketch:

1. Suppose all roots have modulus < 2^{1/(4n)}. Reverse: P* = ∏(1 − αᵢX), P*(0) = 1; P₂*, P₄* are the reverses of P₂, P₄ (CA.6/root-power-polynomial).
2. f(1/X) := √(P₂*(1/X) P₄*(1/X)) ∈ ℤ⟦1/X⟧ (CA.6/integral-square-root-power-series).
3. f continues analytically to the complement of the hedgehog K = union of the segments [0, αᵢ²], [0, αᵢ⁴], whose transfinite diameter is ≤ (max|αᵢ|^{8n}/4)^{1/(2n)} < 1 by Dubinin's theorem (gap: transfinite diameter and Dubinin's theorem are planned by no roadmap).
4. By Bertrandias's rationality theorem (Pólya–Carlson type: an integer power series in 1/X analytic off a compact set of transfinite diameter < 1 is rational; gap) f is rational, so P₂P₄ is a square.
5. If P₂ is not a square, CA.6/root-power-polynomial-square-cyclotomic makes P cyclotomic, a contradiction.
6. If P₂ is a square, P₂ = Q² with Q = minpoly α₁², deg Q = n/2, roots αᵢ²; Q is not cyclotomic. If n/2 > 1, induction gives a root of Q of modulus ≥ 2^{1/(2n)}, i.e. |αᵢ| ≥ 2^{1/(4n)}; if n/2 = 1, Q = X − b with |b| ≥ 2 and |αᵢ| = √|b| ≥ 2^{1/8} (the base case the source omits, ClassicalArithmeticCompletion/E710).

Direct prerequisites: [CA.6/root-power-polynomial](#CA-6-root-power-polynomial), [CA.6/root-power-polynomial-congruence](#CA-6-root-power-polynomial-congruence), [CA.6/integral-square-root-power-series](#CA-6-integral-square-root-power-series), [CA.6/root-power-polynomial-square-cyclotomic](#CA-6-root-power-polynomial-square-cyclotomic), `mathlib:Polynomial.cyclotomic`, `mathlib:Polynomial.reverse`.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Theorem 1, p. 1 (arXiv v1). Exactly the statement.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Proof of Theorem 1, pp. 15-16. The analytic core, whose inputs (Theorem 3 of Dubinin, Corollary 5 of Bertrandias) are the recorded gap.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 3, (8), printed p. 325. The conjecture that the theorem settles.

Proof or interface frontier: Dimitrov's proof of the Schinzel-Zassenhaus conjecture (arXiv:1912.12545v1, pp. 12-16) uses three inputs from potential theory: the transfinite diameter (logarithmic capacity) of a compact subset of ℂ; Dubinin's theorem (Theorem 3) that the hedgehog K(a₁, …, a_n), the union of the segments [0, a_i], has transfinite diameter at most (max|a_i|^n/4)^{1/n}; and Bertrandias's rationality theorem (Theorem 4, Corollary 5), that a power series in ℤ[[1/X]] continuing analytically to the complement of a compact set of transfinite diameter < 1 is a rational function. Mathlib has none of these, the atlas has no roadmap for logarithmic capacity or for Pólya-Carlson-Bertrandias rationality criteria (DT.5 plans G-functions but not this criterion), and the source cites Dubinin's book and Amice's 'Les nombres p-adiques' (not public) for the proofs, giving only an outline of Bertrandias's argument (Hankel determinants bounded through Chebyshev polynomials of the compact set). The arithmetic half of the proof is planned here (CA.6/root-power-polynomial-congruence, CA.6/integral-square-root-power-series, CA.6/root-power-polynomial-square-cyclotomic); the analytic half needs an owner, which the restructure list proposes. Current continuation: The current Smith route proposes LogarithmicPotentialTheoryAndAlgebraicIntegers as the common complex capacity/equilibrium foundation and explicitly exposes it to the Dimitrov consumer. No roadmap definition or packet of that name exists at this base. The inherited assertion that there is no proposed owner is superseded, but there are still no supplier nodes to import. Dubinin’s specialized hedgehog bound and Bertrandias’s arithmetic rationality input remain distinct obligations; generic potential foundations must precede CA.6, while the classical trace constant feeds later Smith arithmetic stages, avoiding a cycle.

Proof or interface frontier: The stated theorem is sound; transfinite diameter, analytic continuation and Bertrandias rationality remain honest gaps and should be separate suppliers. The corrected cyclotomic conclusion of 257 still suffices.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-6-abs-log-height-pow"></a>

### h(αⁿ) = n·h(α) for the absolute Weil height

`ClassicalArithmeticCompletion:CA.6/abs-log-height-pow` · lemma.

For every element α of a field of characteristic 0 and n ∈ ℕ, absLogHeight₁(αⁿ) = n·absLogHeight₁(α) (Mathlib's absolute logarithmic Weil height, junk value 0 at transcendental α).

Hypotheses and conventions: No algebraicity hypothesis: for transcendental α and n ≥ 1, αⁿ is transcendental and both sides are 0; for n = 0 both sides are 0.

Further acceptance checks:

- h(2ⁿ) = n log 2 (Mathlib's Rat.logHeight₁_natCast).
- h(φ⁵) = 5 h(φ) = (5/2) log φ.

Proof sketch:

1. For algebraic α let K = ℚ(α) (a number field containing αⁿ). By DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow and DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-of-minpoly-eq, absMulHeight₁ x = (mulHeight₁ x computed in K)^{1/[K:ℚ]} for x ∈ K, independently of the subfield ℚ(x) Mathlib uses.
2. In K, mulHeight₁(αⁿ) = mulHeight₁(α)ⁿ (Height.mulHeight₁_pow); take logarithms.

Direct prerequisites: `DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow`, `DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-of-minpoly-eq`, `mathlib:Height.mulHeight₁_pow`, `mathlib:NumberField.absMulHeight₁`, `mathlib:NumberField.absLogHeight₁`.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 12, printed pp. 338-339. The homogeneity h(α^d) = d h(α) is what makes the canonical height of the power map equal to h.

Source: [dimitrov-schinzel-zassenhaus-2019](https://arxiv.org/abs/1912.12545), Proof of Lemma 2.3, p. 5 (arXiv v1). The identity h(αⁿ) = n h(α) as used.

<a id="CA-6-weil-height-eq-zero-iff"></a>

### Kronecker's theorem for the Weil height

`ClassicalArithmeticCompletion:CA.6/weil-height-eq-zero-iff` · lemma.

An algebraic number α (in a field of characteristic 0) has h(α) = 0 iff α = 0 or α is a root of unity.

Hypotheses and conventions: α algebraic over ℚ.

Further acceptance checks:

- h(i) = 0; h(2) = log 2 > 0; h((3 + 4i)/5) = log 5/2 > 0 although |(3 + 4i)/5| = 1 and both conjugates lie on the circle (not an algebraic integer).

Proof sketch:

1. h(α) = log M(α)/deg α (DiophantineApproximationAndTranscendence:DT.0/height-comparisons), so h(α) = 0 ⟺ M(α) = 1.
2. M(α) = 1 ⟺ α = 0 or a root of unity (API mahlerMeasure_eq_one_iff of DiophantineApproximationAndTranscendence:DT.0/mahler-measure-of-algebraic-number, resting on Mathlib's Polynomial.pow_eq_one_of_mahlerMeasure_eq_one and Polynomial.cyclotomic_mahlerMeasure_eq_one).

Direct prerequisites: `DiophantineApproximationAndTranscendence:DT.0/height-comparisons`, `DiophantineApproximationAndTranscendence:DT.0/mahler-measure-of-algebraic-number`, `mathlib:Polynomial.pow_eq_one_of_mahlerMeasure_eq_one`, `mathlib:Polynomial.cyclotomic_mahlerMeasure_eq_one`, `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_le_one`, `mathlib:NumberField.absLogHeight₁`.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 1, printed p. 322. Kronecker's theorem, transported to h by (5).

Source: [berrevoets-lehmer-2016](https://math.leidenuniv.nl/scripties/BachBerrevoets.pdf), Remark 2.14, printed p. 7. The acceptance example distinguishing algebraic numbers from algebraic integers.

<a id="CA-6-canonical-height-power-map"></a>

### The canonical height of the power map is the Weil height

`ClassicalArithmeticCompletion:CA.6/canonical-height-power-map` · comparison.

Let d ≥ 2 and f(x) = x^d on P¹. For every α (in a field of characteristic 0), d^{−n} h(f^{∘n}(α)) = h(α) for all n, so Tate's limit defining the canonical height exists and ĥ_f(α) = h(α) = log M(α)/deg α; also ĥ_f(∞) = 0 = h(∞). Consequently, for algebraic α, ĥ_f(α) = 0 iff α is 0 or a root of unity, and ĥ_f(∞) = 0 (these are the preperiodic points of f), and the dynamical Lehmer problem for f is Lehmer's problem.

Hypotheses and conventions: d ≥ 2; h is Mathlib's absLogHeight₁ on affine points, h(∞) = 0 (the height of [1 : 0]). ĥ_f is ArithmeticDynamics:DY.1's canonical height of the polarised morphism f (f*O(1) ≅ O(d)).

Further acceptance checks:

- f = x²: ĥ(2) = log 2, ĥ(φ) = (log φ)/2, ĥ(i) = 0 (i is preperiodic: i ↦ −1 ↦ 1).
- Lehmer's number: ĥ(τ₁₀) = (log τ₁₀)/10 = 0.01623.

Proof sketch:

1. f^{∘n}(α) = α^{d^n} and h(α^{d^n}) = dⁿ h(α) (CA.6/abs-log-height-pow), so the sequence is constant.
2. Its limit is h(α); by DY.1's characterisation (the unique function with ĥ − h bounded and ĥ∘f = d ĥ, or directly as the limit) ĥ_f = h.
3. h(α) = log M(α)/deg α (DiophantineApproximationAndTranscendence:DT.0/height-comparisons).
4. Zero height: CA.6/weil-height-eq-zero-iff. (DY.1's general zero-height criterion rests on Northcott, which for a fixed number field is Mathlib's NumberField.finite_setOfPred_mulHeight₁_le; for the power map Kronecker gives it directly.)

Direct prerequisites: [CA.6/abs-log-height-pow](#CA-6-abs-log-height-pow), [CA.6/weil-height-eq-zero-iff](#CA-6-weil-height-eq-zero-iff), `DiophantineApproximationAndTranscendence:DT.0/height-comparisons`, `ArithmeticDynamics:DY.1`, `mathlib:NumberField.absLogHeight₁`, `mathlib:NumberField.finite_setOfPred_mulHeight₁_le`.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 12, printed pp. 338-339. The definition consumed from DY.1.

Source: [smyth-mahler-survey-2008](https://arxiv.org/abs/math/0701397), Section 12, printed p. 339. Exactly the comparison for the power map.

Proof or interface frontier: The native file only provides the affine constant-sequence/limit theorem; projective infinity, canonical-height comparison and preperiodic classification need separate signatures and exact DY.1 supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

### Continuation frontier

- Decompose the analytic step of Smyth's theorem (Schur's coefficient conditions for functions bounded by 1 on the disc, applied to F = f/g) once Smyth 1971 or another public proof is obtained; until then CA.6/smyth-nonreciprocal-lower-bound and CA.6/plastic-number-least-pisot rest on the gap 'The analytic core of Smyth's nonreciprocal bound has no public source'.
- Give the potential-theoretic inputs of Dimitrov's theorem (transfinite diameter, Dubinin's hedgehog theorem, Bertrandias's rationality theorem) an owner (restructure proposal) and replace the gap by its node ids in CA.6/schinzel-zassenhaus-dimitrov.
- Smith 1–3: the totally positive integer trace ratio, the finite-exception threshold lambda_SSS and the resultant-based auxiliary-polynomial bound remain to be planned. The assertion lambda_SSS=2 is the historical trace problem, contradicted by Smith’s theorem in its separate owner; do not introduce it as a theorem or as an open conjecture the source still endorses. Keep the classical lower bounds source-scoped and preserve the coprimality of the minimal polynomial with every auxiliary polynomial.
- BKK 69 requires a stronger asymptotic Dobrowolski constant and a uniform bounded-degree completion than CA.6/dobrowolski-lower-bound, whose recorded constant is 1/11700. That node does not imply the requested exponential lower bound with L(m)=2(log m/loglog m)^3. BKK 70 bounds the number of primes causing a degree drop for a nonzero algebraic number; CA.6/degree-drop-mahler-measure only constructs a smaller-degree algebraic integer with controlled Mahler measure. Neither nearby theorem closes the requested contract.
- The current Smith route proposes LogarithmicPotentialTheoryAndAlgebraicIntegers as the common complex capacity/equilibrium foundation and explicitly exposes it to the Dimitrov consumer. No roadmap definition or packet of that name exists at this base. The inherited assertion that there is no proposed owner is superseded, but there are still no supplier nodes to import. Dubinin’s specialized hedgehog bound and Bertrandias’s arithmetic rationality input remain distinct obligations; generic potential foundations must precede CA.6, while the classical trace constant feeds later Smith arithmetic stages, avoiding a cycle.
- Independent review frontier: 32 existing targets have the mathematical or interface obligations recorded under gaps. Resume those IDs directly; revisionResponse records corrections and checked signatures, without claiming their remaining proofs closed.

## CA.7. Integral Galois modules and orders

Compare the existing rational normal basis with integral generators, trace, tame ramification, local freeness and associated orders. Nonfield Dedekind hypotheses matter for completion predicates. The locally free class group must use the genuine finite-projective Grothendieck group; its class-map and scalar-extension bridges remain pending. Fröhlich–Taylor and cancellation require their own Hom-description, root-number and semisimple-order suppliers.

Landmarks: Ring of integers as a Galois module; Normal integral basis; Noether's theorem; Hilbert–Speiser theorem; Locally free class group; Taylor's theorem (Fröhlich's conjecture).

<a id="CA-7-ring-of-integers-as-group-ring-module"></a>

### The ring of integers as a module over the group ring

`ClassicalArithmeticCompletion:CA.7/ring-of-integers-as-group-ring-module` · construction.

Let A be a commutative ring, B a commutative A-algebra and G a group acting on B by ring automorphisms that commute with the action of A (G acts by A-algebra automorphisms). The Galois representation of G on B is the A-linear representation g ↦ (x ↦ g·x), and the group ring A[G] (Mathlib's MonoidAlgebra A G) acts on B on the left by (Σ_g a_g g)·x = Σ_g a_g g(x); this makes B a left A[G]-module whose restriction to A is the given A-module structure. The principal case is a finite Galois extension L/K of number fields with G = Gal(L/K), A = 𝓞_K and B = 𝓞_L, where the action is the restriction of the Galois action on L; the same construction with A = K and B = L gives L as a K[G]-module, and the inclusion 𝓞_L ⊆ L is 𝓞_K[G]-linear. When G is a Galois group for B/A in Mathlib's sense (IsGaloisGroup G A B: faithful action, commuting with A, with invariants the image of A), the norm element N = Σ_g g acts on B with values in A, and for rings of integers it acts as the trace.

Hypotheses and conventions: A is a commutative ring and B a commutative A-algebra. G is a group acting on B by ring automorphisms commuting with A: [MulSemiringAction G B] and [SMulCommClass G A B]. The Galois-group hypothesis IsGaloisGroup G A B is needed only for the statements about invariants and the norm element. The group ring acts on the left; a right action is never used.

API:

- `IntegralGaloisModule.galoisRep` (data): The A-linear representation of G on B, g ↦ (x ↦ g·x).
- `IntegralGaloisModule.galoisRep_apply` (simp): galoisRep A B G g x = g·x.
- `IntegralGaloisModule.GroupRingModule` (constructor): B as a left A[G]-module: the asModule of galoisRep.
- `IntegralGaloisModule.toGroupRingModule` (equivalence): The A-linear identification of B with its group-ring module.
- `IntegralGaloisModule.single_smul` (simp): single g a · x = a · g(x).
- `IntegralGaloisModule.of_smul` (simp): The image of g in A[G] acts as g.
- `IntegralGaloisModule.isScalarTower` (instance): The scalar tower A → A[G] → B.
- `IntegralGaloisModule.norm_smul` (relation): The norm element Σ_g g acts as x ↦ Σ_g g(x).
- `IntegralGaloisModule.mem_range_algebraMap_iff` (characterisation): For a Galois group G of B/A, x lies in the image of A exactly when g(x) = x for all g.
- `IntegralGaloisModule.sum_smul_mem_range_algebraMap` (relation): For a Galois group G of B/A, Σ_g g(x) lies in the image of A.
- `IntegralGaloisModule.galoisRep_numberField_apply` (compatibility): For number fields, the value of galoisRep at σ ∈ Gal(L/K) on x ∈ 𝓞_L is σ(x) computed in L.

Unit tests:

- `IntegralGaloisModule.galoisRep_test_trivialGroup` (degenerate): For the trivial group the norm element acts as the identity.
- `IntegralGaloisModule.galoisRep_test_augmentationKillsInvariants` (characterisation): For a Galois group of B/A, g − 1 kills the image of A in B.
- `IntegralGaloisModule.galoisRep_test_normIsTrace` (compatibility): For number fields, Σ_σ σ(x) equals the image of Tr_{𝓞_L/𝓞_K}(x) (Mathlib's Algebra.intTrace).

Further acceptance checks:

- The underlying A-module of the group-ring module is the A-module B: the scalar tower A → A[G] → B holds.
- single g 1 acts as g, and the identity of the group ring acts as the identity.
- For number fields the norm element acts as the trace 𝓞_L → 𝓞_K followed by the inclusion; a construction that let G act through a quotient or through a non-faithful action would fail the invariants characterisation.

Proof sketch:

1. Define the representation as Mathlib's Representation.ofDistribMulAction A G B; its value at g is the A-linear map x ↦ g·x.
2. Take the A[G]-module to be the representation's asModule, with the identification toGroupRingModule : B ≃ₗ[A] ρ.asModule; the module structure is Module.compHom along asAlgebraHom.
3. Check the evaluation formula on single g a and the scalar tower A → A[G] → B from the definition of asAlgebraHom as MonoidAlgebra.lift.
4. For invariants use the IsInvariant field of IsGaloisGroup: the fixed points of G in B are the image of A.
5. For rings of integers, the instance IsGaloisGroup Gal(L/K) 𝓞_K 𝓞_L is found by instance inference at the pin, and trace_eq_sum_automorphisms gives Σ_σ σ(x) = Tr_{L/K}(x); restrict to 𝓞_L through Algebra.algebraMap_intTrace.

Direct prerequisites: `mathlib:Representation.ofDistribMulAction`, `mathlib:Representation.asModule`, `mathlib:Representation.asAlgebraHom`, `mathlib:MonoidAlgebra`, `mathlib:IsGaloisGroup`, `mathlib:Algebra.IsInvariant`, `mathlib:galRestrict`, `mathlib:trace_eq_sum_automorphisms`, `mathlib:Algebra.intTrace`, `mathlib:Algebra.algebraMap_intTrace`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 1.1 and Examples 1.3 (printed p. 1). The node is the left group-ring module structure on the ring of integers, Example 1.3(ii), over the group ring of the base ring of integers.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 1.6 (printed p. 2). The definition presupposes exactly the O_K[G]-module structure constructed here.

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Chapter I, first paragraph (printed p. 154). The same structure in the AKLB generality used by the node.

Proof or interface frontier: Representation, group-ring module and equivalence are separate constructions; trace compatibility consumed by projectivity needs its own supplier. Add a nontrivial group-action test.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-rational-normal-basis-map"></a>

### The rational normal basis map K[G] ≅ L

`ClassicalArithmeticCompletion:CA.7/rational-normal-basis-map` · construction.

Let L/K be a finite Galois extension of fields with group G. An element θ of L is a normal basis generator if its conjugates (σθ)_{σ∈G} are K-linearly independent, equivalently span L, equivalently form a K-basis of L. For a generator θ the map K[G] → L, x ↦ x·θ, is an isomorphism of left K[G]-modules, sending single σ c to c·σ(θ). Mathlib's IsGalois.normalBasis supplies the canonical generator θ₀ = normalBasis K L 1, and the normal basis map of L/K is the map attached to θ₀. For number fields, A = 𝓞_K and B = 𝓞_L, the map carries the group ring 𝓞_K[G] onto the 𝓞_K-lattice 𝓞_K[G]·θ₀ of L, which in general is not 𝓞_L.

Hypotheses and conventions: L/K is a finite Galois extension of fields: [FiniteDimensional K L] [IsGalois K L]. The group ring acts on L through the Galois representation of the construction ring-of-integers-as-group-ring-module with A = K and B = L.

API:

- `NormalBasis.IsGenerator` (data): θ is a normal basis generator: its conjugates are K-linearly independent.
- `NormalBasis.isGenerator_normalBasis_one` (constructor): Mathlib's normal basis generator normalBasis K L 1 is a generator.
- `NormalBasis.isGenerator_iff_span` (characterisation): θ is a generator exactly when its conjugates span L.
- `NormalBasis.basisOfGenerator` (constructor): The K-basis (σθ)_σ of L defined by a generator.
- `NormalBasis.basisOfGenerator_apply` (simp): basisOfGenerator h σ = σθ.
- `NormalBasis.equivOfGenerator` (equivalence): The isomorphism K[G] ≃ L, x ↦ x·θ, for a generator θ.
- `NormalBasis.equivOfGenerator_single` (simp): single σ c ↦ c·σθ.
- `NormalBasis.equivOfGenerator_mul` (compatibility): equivOfGenerator (x * y) = x · equivOfGenerator y: the map is K[G]-linear.
- `NormalBasis.equiv` (data): The normal basis map attached to Mathlib's normal basis.

Unit tests:

- `NormalBasis.test_trivialGroup` (degenerate): Over the trivial group an element is a generator exactly when it is nonzero.
- `NormalBasis.test_one_not_generator` (non-example): In a nontrivial Galois extension 1 is not a generator: its conjugates are all equal.
- `NormalBasis.test_quadratic_generator` (computation): In a quadratic extension in characteristic different from two, with nontrivial sigma and sigma x=-x for x!=0, 1+x is a generator, as 1+i is for Q(i)/Q. In characteristic two this test is false (F4/F2,x=1).
- `NormalBasis.test_equiv_single_one` (compatibility): The normal basis map sends single σ 1 to σ(normalBasis K L 1), agreeing with Mathlib's normalBasis_apply.

Further acceptance checks:

- equiv K L (single σ 1) = σ(normalBasis K L 1).
- In a nontrivial extension 1 is never a generator, and over the trivial group every nonzero element is one.
- For ℚ(i)/ℚ the element 1 + i is a generator, since its conjugates 1 + i and 1 − i are linearly independent.

Proof sketch:

1. Linear independence of the conjugates is IsGenerator; since the index set G has cardinality [L : K] (IsGalois.card_aut_eq_finrank), independence is equivalent to spanning and to being a basis (basisOfLinearIndependentOfCardEqFinrank).
2. Mathlib's IsGalois.normalBasis is a basis indexed by G with normalBasis_apply: normalBasis σ = σ(normalBasis 1); hence normalBasis 1 is a generator.
3. Define equivOfGenerator θ as the composite of the K-linear equivalence K[G] ≃ (G →₀ K) with the representation isomorphism of the basis σ ↦ σθ.
4. K[G]-linearity: for σ, τ ∈ G, (single σ 1)·(τθ) = (στ)θ, which is the image of single σ 1 * single τ 1; extend by linearity.

Direct prerequisites: `mathlib:IsGalois.normalBasis`, `mathlib:IsGalois.normalBasis_apply`, `mathlib:exists_linearIndependent_algEquiv_apply`, `mathlib:IsGalois.card_aut_eq_finrank`, [CA.7/ring-of-integers-as-group-ring-module](#CA-7-ring-of-integers-as-group-ring-module).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 1.4 (printed p. 1). The node packages the existence statement, which is Mathlib's IsGalois.normalBasis, as the K[G]-module isomorphism the theorem asserts.

Source: [conrad-linear-characters-2026](https://kconrad.math.uconn.edu/blurbs/galoistheory/linearchar.pdf), Section 3, Example 3.1 (p. 2). The example has base R and characteristic zero. Its quadratic generalisation needs 2!=0, as the determinant is -2x; it is false over F4/F2.

Proof or interface frontier: Quadratic normal-generator example fails in characteristic two: F4/F2, x=1 gives sigma x=-x but 1+x=0. Add 2!=0. Predicate, basis construction, equivariant isomorphism and consumed characterisation require separate nodes.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-normal-basis-generators-differ-by-units"></a>

### Normal basis generators differ by units of the group algebra

`ClassicalArithmeticCompletion:CA.7/normal-basis-generators-differ-by-units` · lemma.

Let L/K be finite Galois with group G and let θ be a normal basis generator. An element β of L is a normal basis generator if and only if β = u·θ for a unit u of K[G]; the unit is unique.

Hypotheses and conventions: L/K finite Galois; θ a normal basis generator.

Further acceptance checks:

- For θ a generator and c ∈ K nonzero, cθ is a generator (u = c).
- For G nontrivial, (Σ_g g)·θ is not a generator: Σ_g g is a zero divisor in K[G].

Proof sketch:

1. By the normal basis map, β = u·θ for a unique u ∈ K[G].
2. β is a generator exactly when x ↦ x·β = (x u)·θ is bijective, that is when right multiplication by u on K[G] is bijective.
3. K[G] is finite dimensional over K, so right multiplication by u is bijective exactly when it is injective, exactly when u is a unit.

Direct prerequisites: [CA.7/rational-normal-basis-map](#CA-7-rational-normal-basis-map), `mathlib:MonoidAlgebra`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Remark 1.5 (printed p. 2). The mathematical contract, with the conventions stated here; uniqueness of u is the injectivity of the normal basis map.

<a id="CA-7-normal-integral-basis"></a>

### Normal integral bases

`ClassicalArithmeticCompletion:CA.7/normal-integral-basis` · definition.

Let A be a commutative ring, B a commutative A-algebra and G a finite Galois group of B/A (IsGaloisGroup G A B). An element α of B generates a normal integral basis if its conjugates (g·α)_{g∈G} form an A-basis of B: they are A-linearly independent and span B. Equivalently the A[G]-linear map A[G] → B, x ↦ x·α, is bijective, so B is free of rank one over A[G] with basis α. B has a normal integral basis over A if some α generates one. For a finite Galois extension of number fields L/K the relevant case is A = 𝓞_K, B = 𝓞_L, G = Gal(L/K); for a finite Galois extension of nonarchimedean local fields it is A = 𝒪_K, B = 𝒪_L.

Hypotheses and conventions: G is finite and is a Galois group of B/A in Mathlib's sense. The basis is indexed by G itself, as in Mathlib's IsGalois.normalBasis, not by an arbitrary finite type.

API:

- `IntegralGaloisModule.IsNIBGenerator` (data): α generates a normal integral basis: (gα)_g is an A-basis of B.
- `IntegralGaloisModule.HasNIB` (data): B has a normal integral basis over A.
- `IntegralGaloisModule.IsNIBGenerator.basis` (constructor): The A-basis of B indexed by G defined by a generator.
- `IntegralGaloisModule.IsNIBGenerator.basis_apply` (simp): basis g = g·α.
- `IntegralGaloisModule.isNIBGenerator_iff_bijective` (characterisation): α generates exactly when x ↦ x·α, A[G] → B, is bijective (B free of rank one over A[G]).
- `IntegralGaloisModule.IsNIBGenerator.unit_smul` (relation): u·α generates for every unit u of A[G].
- `IntegralGaloisModule.IsNIBGenerator.exists_unit` (relation): Two generators differ by a unit of A[G].
- `IntegralGaloisModule.IsNIBGenerator.isGenerator` (compatibility): For number fields a normal integral basis generator is a normal basis generator of L/K.

Unit tests:

- `IntegralGaloisModule.nib_test_trivialGroup` (degenerate): For a trivial Galois group and an injective algebraMap A B, alpha generates exactly when it is a unit. Injectivity is necessary: Z->F2,alpha=1 is a counterexample without it.
- `IntegralGaloisModule.nib_test_one_not_generator` (non-example): For a nontrivial group 1 does not generate: its conjugates coincide.
- `IntegralGaloisModule.nib_test_cyclotomicPrime` (computation): For an odd prime p, ζ_p generates a normal integral basis of ℚ(ζ_p)/ℚ.

Further acceptance checks:

- ζ_p generates a normal integral basis of ℚ(ζ_p)/ℚ for an odd prime p.
- 1 never generates a normal integral basis of a nontrivial extension.
- ℚ(i)/ℚ has none, although 1 + i generates a rational normal basis.

Proof sketch:

1. Define IsNIBGenerator α as the conjunction of LinearIndependent A (g ↦ g·α) and span = ⊤, and HasNIB as the existence of such α.
2. Build the basis with Module.Basis.mk and record basis_apply: basis g = g·α.
3. The bijectivity characterisation: x ↦ x·α sends single g a to a·gα, so bijectivity is exactly the basis property of (gα)_g.
4. Change of generator: if α and β generate, the A[G]-linear automorphism of A[G] carrying 1 to the coordinate vector of β is right multiplication by a unit.
5. Compatibility with the field: for number fields an 𝓞_K-basis of 𝓞_L is a K-basis of L (𝓞_L is a lattice spanning L), so a normal integral basis generator is a normal basis generator of L/K.

Direct prerequisites: [CA.7/ring-of-integers-as-group-ring-module](#CA-7-ring-of-integers-as-group-ring-module), [CA.7/rational-normal-basis-map](#CA-7-rational-normal-basis-map), `mathlib:IsGaloisGroup`, `mathlib:MonoidAlgebra`, `mathlib:Module.Free`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 1.6 (printed p. 2). The definition in the conventions used here, stated for any Galois group of B/A so that the number-field and local cases are the same declaration.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Remark 3.14(ii) (printed p. 6). The compatibility item: a normal integral basis generator is a rational normal basis generator.

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Definition following Corollary 1.4 (printed p. 156). The same definition for the ring of integers.

Proof or interface frontier: Trivial-group NIB test lacks injectivity A->B: Z->F2 with alpha=1 disproves it. Add injective algebraMap. Split the two predicates, basis constructor and consumed normal-generator compatibility.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-trace-of-normal-integral-basis-generator"></a>

### The trace of a normal integral basis generator generates for a Galois subextension

`ClassicalArithmeticCompletion:CA.7/trace-of-normal-integral-basis-generator` · lemma.

Let L/K be a finite Galois extension of number fields with group G, let F be an intermediate field with F/K Galois, H = Gal(L/F) and Γ = Gal(F/K) ≅ G/H. If α ∈ 𝓞_L generates a normal integral basis of L/K then Tr_{L/F}(α) ∈ 𝓞_F generates a normal integral basis of F/K.

Hypotheses and conventions: L/K and F/K finite Galois, K ⊆ F ⊆ L number fields. The trace is Mathlib's Algebra.intTrace 𝓞_F 𝓞_L.

Further acceptance checks:

- For F = K the conclusion is that Tr_{L/K}(α) generates 𝓞_K over 𝓞_K, i.e. is a unit.
- For L = ℚ(ζ_n), n odd squarefree, and F ⊆ L, the conclusion is Proposition 6.6: the Gauss period Tr(ζ_n) generates.

Proof sketch:

1. Write x ∈ 𝓞_F as x = Σ_g c(g) g(α) with unique c(g) ∈ 𝓞_K.
2. Since h(x) = x for h ∈ H and the coefficients are unique, c(h⁻¹g) = c(g) for h ∈ H.
3. Choose lifts σ̃ of σ ∈ Γ; regroup the sum as Σ_σ c(σ̃) Σ_{h∈H} hσ̃(α) = Σ_σ c(σ̃) σ(Tr_{L/F}(α)), using that H is normal.
4. Linear independence of (σ(Tr_{L/F} α))_σ over 𝓞_K follows from that of (gα)_g, since the lifts times H partition G.

Direct prerequisites: [CA.7/normal-integral-basis](#CA-7-normal-integral-basis), [CA.7/ring-of-integers-as-group-ring-module](#CA-7-ring-of-integers-as-group-ring-module), `mathlib:Algebra.intTrace`, `mathlib:trace_eq_sum_automorphisms`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 6.1 with its proof (printed pp. 10–11). The mathematical contract, with the conventions stated here.

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proposition 1.6 (printed p. 156). The same statement for ambiguous ideals; the ring of integers is the case 𝔄 = O_K.

Source: [conrad-linear-characters-2026](https://kconrad.math.uconn.edu/blurbs/galoistheory/linearchar.pdf), Theorem 3.8 (p. 5). The rational analogue, whose proof is the same regrouping.

Proof or interface frontier: Trace from NIB is provided for number fields only; local Noether proof in node282 needs a separate general Dedekind/local trace supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-trace-surjective-of-normal-integral-basis"></a>

### A normal integral basis forces the trace to be surjective

`ClassicalArithmeticCompletion:CA.7/trace-surjective-of-normal-integral-basis` · lemma.

Let L/K be a finite Galois extension of number fields with a normal integral basis, and F an intermediate field. Then Tr_{L/F}(𝓞_L) = 𝓞_F; in particular Tr_{L/K}(𝓞_L) = 𝓞_K. In the Galois-group form: if B has a normal integral basis over A for the Galois group G, then Tr_{B/A} : B → A is surjective.

Hypotheses and conventions: L/K finite Galois; F any intermediate field (F/K need not be Galois: the regrouping runs over the cosets of Gal(L/F) in G).

Further acceptance checks:

- For ℚ(ζ_p)/ℚ, Tr(ζ_p) = −1 is a unit.
- For ℚ(i)/ℚ, Tr(ℤ[i]) = 2ℤ, so ℚ(i)/ℚ has no normal integral basis.

Proof sketch:

1. Tr_{L/F}(𝓞_L) ⊆ 𝓞_F always.
2. For x ∈ 𝓞_F, the regrouping of the previous lemma writes x = Tr_{L/F}(Σ_σ c(σ̃)σ̃(α)) with Σ_σ c(σ̃)σ̃(α) ∈ 𝓞_L.
3. In the Galois-group form, Tr_{B/A}(a·α) over the basis: Tr(Σ_g c_g gα) = (Σ_g c_g)·Tr(α), and Tr(α) is a unit by the previous lemma with F = K, so the trace is onto.

Direct prerequisites: [CA.7/trace-of-normal-integral-basis-generator](#CA-7-trace-of-normal-integral-basis-generator), [CA.7/normal-integral-basis](#CA-7-normal-integral-basis), `mathlib:Algebra.intTrace`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Corollary 6.2 (printed p. 11). The mathematical contract, with the conventions stated here.

Proof or interface frontier: Trace ideal formula requires a supplier for regrouping the Galois sum over stabilisers and arbitrary intermediate fields.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-tamely-ramified"></a>

### Tamely ramified extensions of Dedekind domains

`ClassicalArithmeticCompletion:CA.7/tamely-ramified` · definition.

Let B/A be an extension of commutative rings and P a prime of B lying over p = P ∩ A. B/A is tamely ramified at P if the residue extension (B/P)/(A/p) is separable and the characteristic of A/p does not divide the ramification index e(P|p) (Mathlib's P.ramificationIdx A). B/A is tamely ramified if it is tamely ramified at every nonzero prime of B. When the residue fields are finite (number fields, nonarchimedean local fields) the separability condition holds automatically and the condition is p ∤ e(P|p) for every P, which is the definition of the sources; the separability clause is the convention of Tau Ceti's NumberFieldArithmetic roadmap, so that the predicate is correct in every characteristic.

Hypotheses and conventions: The ramification index is the unprimed Mathlib P.ramificationIdx A (prime P of B first, base ring A second). The base prime is P.under A with the LiesOver instance Ideal.over_under. The residue characteristic is ringChar (A ⧸ P.under A).

API:

- `IntegralGaloisModule.IsTamelyRamifiedAt` (data): Tameness at a prime P of B: separable residue extension and residue characteristic not dividing e(P|p).
- `IntegralGaloisModule.IsTamelyRamified` (data): Tameness at every nonzero prime of B.
- `IntegralGaloisModule.isTamelyRamifiedAt_iff_of_finite` (characterisation): With finite residue fields, tameness at P is p ∤ e(P|p).
- `IntegralGaloisModule.isTamelyRamifiedAt_of_ramificationIdx_eq_one` (constructor): An unramified prime with separable residue extension is tame.
- `IntegralGaloisModule.isTamelyRamified_trans_iff` (functoriality): In a tower A ⊆ B ⊆ C of Dedekind domains, C/A is tame exactly when B/A and C/B are.
- `IntegralGaloisModule.isTamelyRamified_numberField_iff` (compatibility): For number fields, tameness is p ∤ e(P|p) at every nonzero prime P of 𝓞_L, the convention of the NumberFieldArithmetic roadmap.

Unit tests:

- `IntegralGaloisModule.tame_test_self` (degenerate): The trivial extension A/A of a Dedekind domain is tamely ramified.
- `IntegralGaloisModule.tame_test_cyclotomicPrime` (computation): ℚ(ζ_p)/ℚ is tamely ramified for an odd prime p.
- `IntegralGaloisModule.tame_test_gaussian_not_tame` (non-example): ℚ(i)/ℚ is not tamely ramified: e = 2 at the prime above 2.

Further acceptance checks:

- ℚ(ζ_p)/ℚ is tame for an odd prime p: the only ramified prime is p with e = p − 1.
- ℚ(i)/ℚ is not tame: 2 ramifies with e = 2.
- An unramified extension (e = 1 everywhere) is tame.

Proof sketch:

1. Define IsTamelyRamifiedAt P as separability of the residue algebra (Ideal.Quotient.algebraOfLiesOver) together with non-divisibility of the ramification index.
2. Define IsTamelyRamified as tameness at every nonzero prime of B.
3. Finite residue fields: a finite field is perfect, so every finite extension of it is separable; this gives the simplified form.
4. Towers: for A ⊆ B ⊆ C Dedekind, ramification indices multiply (Mathlib's ramificationIdxIn_mul_ramificationIdxIn in the Galois case, and the multiplicativity of e in general), residue separability is transitive, and every prime of B lies under a prime of C; so C/A is tame exactly when C/B and B/A are.

Direct prerequisites: `mathlib:Ideal.ramificationIdx`, `mathlib:Algebra.IsSeparable`, `mathlib:Ideal.LiesOver`, `mathlib:Ideal.ramificationIdxIn_mul_ramificationIdxIn`, `mathlib:IsDedekindDomain`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 7.1 (printed p. 13). The node is this definition, with the residue-separability clause made explicit.

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Definition, Chapter I (printed p. 154). The same definition; Ullom assumes separable residue extensions throughout, which is the separability clause.

Proof or interface frontier: Tower ramification criterion needs finite, torsion-free/injective tower hypotheses used by the native file and dedicated tower APIs.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-trace-modulo-a-prime"></a>

### The trace modulo a prime in a Galois extension

`ClassicalArithmeticCompletion:CA.7/trace-modulo-a-prime` · lemma.

Let B/A be a finite extension of Dedekind domains with a finite Galois group G (IsGaloisGroup G A B), p a nonzero prime of A with pB = (P_1⋯P_g)^e, and x ∈ B. In A/p, Tr_{(B/pB)/(A/p)}(x mod pB) = e·Σ_{i=1}^{g} Tr_{(B/P_i)/(A/p)}(x mod P_i); and by Mathlib this is (Tr_{B/A} x) mod p.

Hypotheses and conventions: p nonzero maximal; e = p.ramificationIdxIn B, the common ramification index of the primes over p in the Galois case.

Further acceptance checks:

- For p unramified (e = 1) the formula is the sum of the residue traces.
- For ℤ[i] and p = 2 (e = 2, g = 1) both sides vanish identically in 𝔽_2.

Proof sketch:

1. The Chinese remainder theorem identifies B/pB with Π_i B/P_i^e.
2. Each B/P_i^e has the filtration by P_i^j/P_i^e whose successive quotients P_i^j/P_i^{j+1} are one-dimensional B/P_i-spaces; in a basis adapted to the filtration, multiplication by x is block upper triangular with e diagonal blocks equal to multiplication by x mod P_i on B/P_i.
3. The trace of a block triangular matrix is the sum of the traces of the diagonal blocks.
4. Mathlib's Algebra.trace_quotient_eq_of_isDedekindDomain identifies the left side with the reduction of Algebra.intTrace A B x.

Direct prerequisites: `mathlib:Algebra.trace_quotient_eq_of_isDedekindDomain`, `mathlib:Ideal.ramificationIdxIn`, `mathlib:Algebra.intTrace`, [CA.7/tamely-ramified](#CA-7-tamely-ramified).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Proposition 7.2, equation (5) (printed p. 13). The node is equation (5) with its proof.

Proof or interface frontier: Residue trace formula consumes CRT and trace on filtration quotients; promote these nonroutine suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-prime-divides-trace-ideal-iff-not-tame"></a>

### A prime divides the trace ideal exactly when it is not tame

`ClassicalArithmeticCompletion:CA.7/prime-divides-trace-ideal-iff-not-tame` · theorem.

Let B/A be a finite extension of Dedekind domains with a finite Galois group G, and p a nonzero prime of A. Then Tr_{B/A}(B) ⊆ p if and only if some prime P of B over p is not tamely ramified.

Hypotheses and conventions: Galois case: all primes over p have the same ramification index. Tr_{B/A}(B) is an ideal of A.

Further acceptance checks:

- For ℤ[i]/ℤ and p = 2: Tr(ℤ[i]) = 2ℤ ⊆ (2).
- For ℤ[ζ_p]/ℤ, p odd: Tr(ℤ[ζ_p]) = ℤ is contained in no prime.

Proof sketch:

1. If some P over p is not tame: either the residue characteristic divides e, and then equation (5) is e·(…) = 0 in A/p for every x; or some residue extension is inseparable, and then all residue extensions are (they are conjugate under G) and every residue trace vanishes (Mathlib's Algebra.trace_eq_zero_of_not_isSeparable). Either way Tr(x) ∈ p for all x.
2. If every P over p is tame: the residue extension of P_1 is separable, so its trace is nonzero (Algebra.trace_ne_zero); choose β_1 with nonzero residue trace, and by the Chinese remainder theorem β ≡ β_1 mod P_1, β ≡ 0 mod P_i (i ≠ 1). Then Tr(β) ≡ e·Tr(β_1) ≠ 0 mod p since p ∤ e.

Direct prerequisites: [CA.7/trace-modulo-a-prime](#CA-7-trace-modulo-a-prime), [CA.7/tamely-ramified](#CA-7-tamely-ramified), `mathlib:Algebra.trace_eq_zero_of_not_isSeparable`, `mathlib:Algebra.trace_ne_zero`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 7.2 (printed p. 13). The node, with "wildly ramified" read as "not tame", which includes the residue-separability clause of the definition node.

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Corollary 1.2 (printed p. 155). For 𝔄 = O_K this is the tame direction: the trace of O_K is O_F.

Proof or interface frontier: Finite Dedekind Galois residue extensions require a dedicated separability/Galois-action supplier; CRT prerequisites are absent.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-tame-iff-trace-surjective"></a>

### Tame ramification is surjectivity of the trace

`ClassicalArithmeticCompletion:CA.7/tame-iff-trace-surjective` · theorem.

Let B/A be a finite extension of Dedekind domains with a finite Galois group G. Then B/A is tamely ramified if and only if Tr_{B/A} : B → A is surjective. For a finite Galois extension of number fields L/K: L/K is tame if and only if Tr_{L/K}(𝓞_L) = 𝓞_K.

Hypotheses and conventions: Galois case, as in the previous theorem.

Further acceptance checks:

- ℚ(ζ_p)/ℚ: trace surjective and tame.
- ℚ(i)/ℚ: trace image 2ℤ and not tame.
- The trace of an element equals Σ_g g(x) (the norm element of the group ring), which is the form used by the projectivity theorems.

Proof sketch:

1. First separate the field case. A finite torsion-free algebra over a field A is finite-dimensional. For the finite Galois field extension, Algebra.trace_surjective applies by separability; both height-one-prime ramification predicates are vacuous. For a nonfield Dedekind domain, every maximal ideal is nonzero, so the following prime-ideal argument applies.
2. The trace ideal is all of A exactly when it lies in no maximal ideal.
3. Apply the previous theorem at every nonzero prime p of A; every nonzero prime of B lies over a nonzero prime of A.

Direct prerequisites: [CA.7/prime-divides-trace-ideal-iff-not-tame](#CA-7-prime-divides-trace-ideal-iff-not-tame), `mathlib:Algebra.intTrace`, `mathlib:Algebra.trace_surjective`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Corollary 7.3 (printed p. 13). The mathematical contract, with the conventions stated here.

Proof or interface frontier: Trace-onto proof ignores A being a field; finite Galois field trace is a separate case.

Revision disposition: The proof now explicitly separates the field branch and cites the exact pinned Algebra.trace_surjective statement. The nonfield integral trace argument still depends on the residue/CRT supplier frontier.

<a id="CA-7-tame-of-normal-integral-basis"></a>

### Speiser: a normal integral basis forces tame ramification

`ClassicalArithmeticCompletion:CA.7/tame-of-normal-integral-basis` · theorem.

If B/A (a finite extension of Dedekind domains with finite Galois group G) has a normal integral basis, then B/A is tamely ramified. In particular a finite Galois extension of number fields or of nonarchimedean local fields with a normal integral basis is tamely ramified.

Hypotheses and conventions: Galois case.

Further acceptance checks:

- ℚ(i)/ℚ is wild, so has no normal integral basis.
- Every normal integral basis generator found in the Hilbert–Speiser theorem lies in a tame field.

Proof sketch:

1. A normal integral basis makes the trace surjective (trace-surjective-of-normal-integral-basis).
2. Surjectivity of the trace is tameness (tame-iff-trace-surjective).

Direct prerequisites: [CA.7/trace-surjective-of-normal-integral-basis](#CA-7-trace-surjective-of-normal-integral-basis), [CA.7/tame-iff-trace-surjective](#CA-7-tame-iff-trace-surjective).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Corollary 7.4 (printed p. 14). The mathematical contract, with the conventions stated here (the source has a slip of grammar, "Let L/K is").

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Introduction (printed p. 153). The attribution to Speiser.

<a id="CA-7-gaussian-integers-have-no-normal-integral-basis"></a>

### ℚ(i)/ℚ: a rational normal basis that is not integral

`ClassicalArithmeticCompletion:CA.7/gaussian-integers-have-no-normal-integral-basis` · application.

For the Gaussian field L = ℚ(i) with G = Gal(L/ℚ) = {1, σ}: 1 + i generates a normal basis of L/ℚ, but L/ℚ has no normal integral basis. Concretely, for α = a + bi ∈ ℤ[i] the conjugates a + bi, a − bi have change-of-basis determinant −2ab relative to {1, i}, never ±1; equivalently Tr(ℤ[i]) = 2ℤ ≠ ℤ, and 2 is wildly ramified.

Hypotheses and conventions: L is the cyclotomic field ℚ(ζ_4) = ℚ(i).

Further acceptance checks:

- The acceptance gate of the layer: a rational normal basis need not be integral, and wild ramification is the obstruction.
- The associated order of ℚ(i)/ℚ is strictly larger than ℤ[G] (associated-order-of-gaussian-integers).

Proof sketch:

1. 1 + i: the conjugates 1 + i, 1 − i are linearly independent (determinant −2i ≠ 0).
2. No normal integral basis: ℚ(i)/ℚ is not tame (tamely-ramified, test tame_test_gaussian_not_tame), so Speiser applies; or directly, Tr(a + bi) = 2a.

Direct prerequisites: [CA.7/tame-of-normal-integral-basis](#CA-7-tame-of-normal-integral-basis), [CA.7/rational-normal-basis-map](#CA-7-rational-normal-basis-map), [CA.7/tamely-ramified](#CA-7-tamely-ramified), `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_eq`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Example 3.16 (printed p. 6). The example the node formalises.

Source: [conrad-linear-characters-2026](https://kconrad.math.uconn.edu/blurbs/galoistheory/linearchar.pdf), Example 3.1 (p. 2). The rational half of the gate.

Proof or interface frontier: Gaussian discriminant, trace, wild ramification and lack of NIB are multiple named mathematical facts bundled into one node.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-rim-projectivity-criterion"></a>

### Rim's criterion for projectivity over a group ring

`ClassicalArithmeticCompletion:CA.7/rim-projectivity-criterion` · lemma.

Let R be a commutative ring, G a finite group and M a left R[G]-module that is projective as an R-module. If there is an R-linear endomorphism φ of M with Σ_{g∈G} g·φ(g⁻¹·m) = m for all m ∈ M, then M is projective as an R[G]-module.

Hypotheses and conventions: G finite; M projective over R; the scalar tower R → R[G] → M.

Further acceptance checks:

- If |G| is a unit in R, φ = |G|⁻¹·id works, so every R-projective module is R[G]-projective (Maschke).
- For M = 𝓞_L and φ = multiplication by c with Tr(c) = 1 the hypothesis is Σ_g g(c) = 1.

Proof sketch:

1. The induced module R[G] ⊗_R M (R[G] acting on the left factor) is R[G]-projective, being the base change of the projective R-module M.
2. The multiplication map μ : R[G] ⊗_R M → M, x ⊗ m ↦ x·m, is R[G]-linear and surjective.
3. s(m) = Σ_g g ⊗ φ(g⁻¹m) is R[G]-linear (reindex the sum) and μ ∘ s = id by the hypothesis.
4. So M is a direct summand of a projective R[G]-module (Module.Projective.of_split).

Direct prerequisites: `mathlib:Module.Projective`, `mathlib:Module.Projective.of_split`, `mathlib:MonoidAlgebra`.

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proof of Proposition 1.3 (printed p. 156). The criterion as Ullom quotes it; the proof steps are the standard splitting of the induced module.

Proof or interface frontier: Base-change projectivity over a noncommutative group ring and the split maps require separate construction/supplier nodes.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-projective-of-tame"></a>

### Ullom: tame ramification makes the integers projective over the group ring

`ClassicalArithmeticCompletion:CA.7/projective-of-tame` · theorem.

Let B/A be a finite extension of Dedekind domains with finite Galois group G. If B/A is tamely ramified then B is a projective A[G]-module (and projective over A[H] for every subgroup H). In particular, for a tame finite Galois extension of number fields, 𝓞_L is a finitely generated projective 𝓞_K[G]-module.

Hypotheses and conventions: Galois case; tame.

Further acceptance checks:

- The class of 𝓞_L in K₀(𝓞_K[G]) is defined for every tame L/K.
- For ℚ(i)/ℚ the module ℤ[i] is not ℤ[G]-projective (the converse direction, trace-surjective-of-projective).

Proof sketch:

1. B is finitely generated and torsion free over the Dedekind domain A, hence A-projective.
2. Tameness gives c ∈ B with Tr_{B/A}(c) = 1 (tame-iff-trace-surjective); the trace is Σ_g g (ring-of-integers-as-group-ring-module).
3. Take φ = multiplication by c: Σ_g g(c·g⁻¹(m)) = m·Σ_g g(c) = m.
4. Apply Rim's criterion.

Direct prerequisites: [CA.7/rim-projectivity-criterion](#CA-7-rim-projectivity-criterion), [CA.7/tame-iff-trace-surjective](#CA-7-tame-iff-trace-surjective), [CA.7/ring-of-integers-as-group-ring-module](#CA-7-ring-of-integers-as-group-ring-module).

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proposition 1.3 with its proof (printed p. 156). The node for 𝔄 = O_K and H = G; the proof takes ρ to be multiplication by β with S_{K/L}(β) = 1.

Proof or interface frontier: Finite torsion-free Dedekind modules are projective: cite the exact baseline or add a supplier. Native theorem omits projectivity over all subgroup rings.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-trace-surjective-of-projective"></a>

### Projectivity over the group ring forces the trace to be surjective

`ClassicalArithmeticCompletion:CA.7/trace-surjective-of-projective` · lemma.

Let B/A be a finite extension of Dedekind domains with finite Galois group G. If B is projective as an A[G]-module then Tr_{B/A}(B) = A; hence B/A is tamely ramified.

Hypotheses and conventions: Galois case.

Further acceptance checks:

- ℤ[i] is not projective over ℤ[C₂].
- Together with projective-of-tame this is the projectivity form of Noether's theorem.

Proof sketch:

1. For the free module A[G], the invariants are A·N with N = Σ_g g, and N·A[G] = A·N: the invariants equal the image of the norm.
2. The equality of invariants and norm image passes to direct sums and direct summands, so it holds for every projective A[G]-module.
3. For B: the invariants are A (IsGaloisGroup) and the image of the norm is Tr(B); so Tr(B) = A.
4. Conclude tameness by tame-iff-trace-surjective.

Direct prerequisites: [CA.7/tame-iff-trace-surjective](#CA-7-tame-iff-trace-surjective), [CA.7/ring-of-integers-as-group-ring-module](#CA-7-ring-of-integers-as-group-ring-module), `mathlib:Module.Projective`, `mathlib:Algebra.IsInvariant`.

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Corollary 1.4 (printed p. 156). Cohomological triviality of projective modules includes the vanishing of Ĥ⁰(G, B) = B^G/N·B, which is the node.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Proposition 9.9 (printed p. 19). The wild case is detected by the trace ideal, which is what the node's last step uses.

Proof or interface frontier: Norm-image equals invariants must be proved for free modules and projective summands separately; native signature only gives trace surjectivity.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-local-unramified-normal-integral-basis"></a>

### Unramified local extensions have a normal integral basis

`ClassicalArithmeticCompletion:CA.7/local-unramified-normal-integral-basis` · theorem.

Let L/K be a finite unramified Galois extension of nonarchimedean local fields with group G. Then 𝒪_L has a normal integral basis over 𝒪_K; more precisely, any lift α ∈ 𝒪_L of a normal basis generator of the residue extension l/k generates one.

Hypotheses and conventions: A is a complete discrete valuation ring with finite residue field k of cardinality q and characteristic p (the ring of integers of a nonarchimedean local field K, in the vocabulary of the LocalFieldsRamification roadmap); K = Frac A. L/K is a finite Galois extension with group G and B is the integral closure of A in L (the valuation ring of L); IsGaloisGroup G A B. L/K unramified: e = 1.

Further acceptance checks:

- For K = ℚ_p and L the unramified extension of degree f, a lift of a normal basis generator of 𝔽_{p^f}/𝔽_p generates.
- The trivial extension: α = 1.

Proof sketch:

1. Unramified Galois: reduction identifies G with Gal(l/k) (LocalFieldsRamification Layer 2, residue correspondence), and p𝒪_L = 𝔓 is the maximal ideal of 𝒪_L.
2. l/k is a finite Galois extension of finite fields, so it has a normal basis generator ᾱ (Mathlib's normal basis theorem in the finite case).
3. Let α lift ᾱ and M = 𝒪_K[G]·α ⊆ 𝒪_L. Then M/pM → 𝒪_L/p𝒪_L = l is onto, since its image is k[G]·ᾱ = l.
4. Hence 𝒪_L = M + p𝒪_L and Nakayama's lemma gives 𝒪_L = M; comparing ranks ([L : K] = |G|), (gα)_g is an 𝒪_K-basis.

Direct prerequisites: `mathlib:exists_linearIndependent_algEquiv_apply_of_finite`, `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`, [CA.7/normal-integral-basis](#CA-7-normal-integral-basis).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 9.1 with its proof (printed p. 15). The mathematical contract, with the conventions stated here; the proof is by Nakayama from a residue normal basis, as in the steps.

Proof or interface frontier: Native file omits the assertion that every residue normal-generator lift is a NIB generator; residue action, Nakayama generation and independence need suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-local-totally-tamely-ramified-normal-integral-basis"></a>

### Totally and tamely ramified local extensions have a normal integral basis

`ClassicalArithmeticCompletion:CA.7/local-totally-tamely-ramified-normal-integral-basis` · theorem.

Let L/K be a totally and tamely ramified Galois extension of nonarchimedean local fields of degree e, with a uniformiser π_L of L satisfying π_L^e = π_K, a uniformiser of K. Then for any units u_0, …, u_{e−1} of 𝒪_K, α = Σ_{j=0}^{e−1} u_j π_L^j generates a normal integral basis of L/K.

Hypotheses and conventions: A is a complete discrete valuation ring with finite residue field k of cardinality q and characteristic p (the ring of integers of a nonarchimedean local field K, in the vocabulary of the LocalFieldsRamification roadmap); K = Frac A. L/K is a finite Galois extension with group G and B is the integral closure of A in L (the valuation ring of L); IsGaloisGroup G A B. L/K totally ramified of degree e = [L : K] with p ∤ e; π_L^e = π_K.

Further acceptance checks:

- K = ℚ_p, L = ℚ_p(ζ_p) = ℚ_p((−p)^{1/(p−1)}), e = p − 1.
- The hypothesis p ∤ e is used exactly once, to make e a unit; the statement is false in the wild case (Speiser).

Proof sketch:

1. L/K is a cyclic Kummer extension: K contains a primitive e-th root of unity ζ and a generator σ of G acts by σ(π_L) = ζπ_L (LocalFieldsRamification Layer 3, tame totally ramified extensions and their Galois criterion).
2. 𝒪_L = 𝒪_K[π_L] with basis 1, π_L, …, π_L^{e−1} (totally ramified: Eisenstein power basis, LocalFieldsRamification Layer 3).
3. σ^i(α) = Σ_j u_j ζ^{ij} π_L^j, so the change-of-basis matrix is (u_j ζ^{ij}) with determinant (Π u_k)·det(ζ^{ij}).
4. det(ζ^{ij}) is a Vandermonde determinant Π_{i<j}(ζ^j − ζ^i) = ζ^m Π_{i<j}(ζ^{j−i} − 1) (Matrix.det_vandermonde).
5. Each 1 − ζ^k (0 < k < e) divides Π_{k=1}^{e−1}(1 − ζ^k) = e (IsPrimitiveRoot.prod_one_sub_pow_eq_order), a unit since p ∤ e; so the determinant is a unit.

Direct prerequisites: `mathlib:Matrix.det_vandermonde`, `mathlib:IsPrimitiveRoot.prod_one_sub_pow_eq_order`, [CA.7/normal-integral-basis](#CA-7-normal-integral-basis).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 9.4 with its proof (printed p. 16). The mathematical contract, with the conventions stated here.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 9.2 (printed p. 15). The Kummer structure used in the first step; it is the tame theorem of LocalFieldsRamification Layer 3 and is imported, not re-planned.

Proof or interface frontier: Vandermonde determinant and primitive-root unit product are nonroutine suppliers; keep tame and degree hypotheses explicit.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-local-tame-uniformiser"></a>

### Normalising a uniformiser of a tame local extension

`ClassicalArithmeticCompletion:CA.7/local-tame-uniformiser` · lemma.

Let L/K be a finite tamely ramified Galois extension of nonarchimedean local fields with ramification index e, residue degree f and residue field of K of cardinality q. Then e divides q^f − 1, and there are a uniformiser π_L of L and a (q^f − 1)-st root of unity v in L with π_L^e = v·π_K.

Hypotheses and conventions: A is a complete discrete valuation ring with finite residue field k of cardinality q and characteristic p (the ring of integers of a nonarchimedean local field K, in the vocabulary of the LocalFieldsRamification roadmap); K = Frac A. L/K is a finite Galois extension with group G and B is the integral closure of A in L (the valuation ring of L); IsGaloisGroup G A B. L/K tamely ramified: p ∤ e.

Further acceptance checks:

- For K = ℚ_7 and L = ℚ_7(7^{1/3}): e = 3, f = 1, q = 7, and 3 | 6.
- In the wild case p | e the divisibility e | q^f − 1 fails, since q^f − 1 is prime to p.

Proof sketch:

1. Let L_0 be the maximal unramified subextension; L/L_0 is totally and tamely ramified Galois of degree e with group the inertia group I (LocalFieldsRamification Layers 2 and 3).
2. By the tame Galois criterion (LocalFieldsRamification Layer 3), I embeds in μ_e(L_0), and μ_e(L_0) injects into the residue field of L_0, which has q^f elements; so e | q^f − 1.
3. Write π_L^e = u·π_K with u ∈ 𝒪_L^×; let v be the Teichmüller lift of the residue of u (a (q^f − 1)-st root of unity, TauCeti.teichmuller).
4. v·π_K/π_L^e has residue 1; since p ∤ e, Hensel's lemma gives β ∈ 𝒪_L^× with β^e = v·π_K/π_L^e.
5. Replace π_L by βπ_L.

Direct prerequisites: `tauceti:TauCeti.teichmuller`, `tauceti:TauCeti.residue_teichmuller`, `mathlib:HenselianLocalRing`, [CA.7/tamely-ramified](#CA-7-tamely-ramified).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 9.5, first paragraph after the diagram (printed p. 17). The node, with the adaptation written out from the proof of Proposition 9.2(i).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 9.5 (printed p. 17). The divisibility half.

Proof or interface frontier: Uniformizer adjustment, roots of unity and divisibility are several facts; promote the Hensel positive-unit supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-local-tame-split-extension"></a>

### The split tame extension above a tame local extension

`ClassicalArithmeticCompletion:CA.7/local-tame-split-extension` · lemma.

Let L/K be a finite tamely ramified Galois extension of nonarchimedean local fields with ramification index e and residue degree f, and let L′ be the unramified extension of L of degree e. Then L′/K is Galois and tame; its maximal unramified subextension L′_0 has degree ef over K; there is π′ ∈ L′ with π′^e = π_K; K′ = K(π′) is totally and tamely ramified of degree e over K; L′_0 ∩ K′ = K and L′ = L′_0·K′. Writing I = Gal(L′/L′_0) and Γ = Gal(L′/K′), I is normal in G′ = Gal(L′/K), I ∩ Γ = 1 and IΓ = G′.

Hypotheses and conventions: A is a complete discrete valuation ring with finite residue field k of cardinality q and characteristic p (the ring of integers of a nonarchimedean local field K, in the vocabulary of the LocalFieldsRamification roadmap); K = Frac A. L/K is a finite Galois extension with group G and B is the integral closure of A in L (the valuation ring of L); IsGaloisGroup G A B. L/K tamely ramified with invariants e, f.

Further acceptance checks:

- For K = ℚ_7, L = ℚ_7(7^{1/3}) (e = 3, f = 1): L′ = L·ℚ_{7^3}, L′_0 = ℚ_{7^3}, K′ = L.
- If L/K is already totally ramified with π_L^e = π_K one may take L′ = L·(unramified of degree e) and K′ = L.

Proof sketch:

1. L′/K is Galois as the compositum of L with the unramified (hence Galois) extension L′_0 of K of degree ef (LocalFieldsRamification Layer 2).
2. e(L′/K) = e and f(L′/K) = ef by multiplicativity in towers; so L′/K is tame (tamely-ramified, tower stability).
3. With π_L, v from local-tame-uniformiser: (q^{ef} − 1) = (q^f − 1)(q^{f(e−1)} + … + 1) and the second factor is ≡ e ≡ 0 mod e, so e(q^f − 1) | q^{ef} − 1 and v = u^e for a (q^{ef} − 1)-st root of unity u ∈ L′_0.
4. π′ = u⁻¹π_L satisfies π′^e = π_K; X^e − π_K is Eisenstein, so K′ = K(π′) is totally ramified of degree e (LocalFieldsRamification Layer 3).
5. An unramified and a totally ramified extension meet in K, and degrees give L′ = L′_0 K′; Galois theory gives the group-theoretic splitting.

Direct prerequisites: [CA.7/local-tame-uniformiser](#CA-7-local-tame-uniformiser), [CA.7/tamely-ramified](#CA-7-tamely-ramified).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 9.5 (printed pp. 16–17). The node collects the construction of the proof.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Remark 9.6 (printed p. 17). The group-theoretic splitting I ∩ Γ = 1, IΓ = G′.

Proof or interface frontier: At least eight conclusions/constructions bundled; missing local owner types justify typed comments but do not resolve granularity. Check maximal-unramified base field against source.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-normal-integral-basis-of-split-extension"></a>

### Normal integral bases multiply across a split extension

`ClassicalArithmeticCompletion:CA.7/normal-integral-basis-of-split-extension` · lemma.

Let N/K be a finite Galois extension with group G (of number fields or of nonarchimedean local fields), I a normal subgroup and Γ a subgroup with I ∩ Γ = 1 and IΓ = G; put N_0 = N^I and M = N^Γ. If β ∈ 𝒪_{N_0} generates a normal integral basis of N_0/K (group G/I ≅ Γ) and α ∈ 𝒪_M generates a normal integral basis of N/N_0 (group I), then αβ generates a normal integral basis of N/K.

Hypotheses and conventions: G = IΓ with I normal and I ∩ Γ = 1, so every g ∈ G is uniquely hγ with h ∈ I, γ ∈ Γ. α ∈ N^Γ and β ∈ N^I.

Further acceptance checks:

- With I = 1: the statement is that β generates.
- In the proof of the local Noether theorem it is applied to L′/K with I the inertia group and Γ = Gal(L′/K′).

Proof sketch:

1. 𝒪_N = ⊕_{h∈I} h(α)·𝒪_{N_0} and 𝒪_{N_0} = ⊕_{γ∈Γ} γ(β)·𝒪_K; combine the two bases (Module.Basis.smulTower).
2. For g = hγ: g(αβ) = h(γ(α)·γ(β)) = h(α)·h(γ(β)) = h(α)·γ(β), since γ fixes α and γ(β) ∈ N_0 is fixed by I (I normal).
3. So the products h(α)γ(β) are exactly the conjugates g(αβ), and they form an 𝒪_K-basis of 𝒪_N.

Direct prerequisites: `mathlib:Module.Basis.smulTower`, `mathlib:Module.Basis.smulTower_apply`, [CA.7/normal-integral-basis](#CA-7-normal-integral-basis).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 9.5, last display (printed p. 17). The node abstracts this step from the cyclic generators τ, σ to a split group G = IΓ.

Proof or interface frontier: Tamely ramified abelian local NIB result has no typed native owner; supplied as an honest interface gap.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-local-noether"></a>

### Noether's theorem for local fields

`ClassicalArithmeticCompletion:CA.7/local-noether` · theorem.

Let L/K be a finite Galois extension of nonarchimedean local fields with group G. Then 𝒪_L has a normal integral basis over 𝒪_K if and only if L/K is tamely ramified.

Hypotheses and conventions: A is a complete discrete valuation ring with finite residue field k of cardinality q and characteristic p (the ring of integers of a nonarchimedean local field K, in the vocabulary of the LocalFieldsRamification roadmap); K = Frac A. L/K is a finite Galois extension with group G and B is the integral closure of A in L (the valuation ring of L); IsGaloisGroup G A B.

Further acceptance checks:

- ℚ_2(i)/ℚ_2 has no normal integral basis; ℚ_p(ζ_p)/ℚ_p (p odd) has one.
- The global analogue fails: tameness does not give a normal integral basis of a number field in general (Noether's theorem gives only local freeness).

Proof sketch:

1. If: build L′ ⊇ L as in local-tame-split-extension.
2. L′_0/K is unramified, so has a normal integral basis generator β (local-unramified-normal-integral-basis).
3. L′/L′_0 is totally and tamely ramified Galois of degree e with π′^e = π_K, π′ ∈ K′; α = Σ_{i<e} π′^i ∈ K′ generates a normal integral basis of L′/L′_0 (local-totally-tamely-ramified-normal-integral-basis with u_j = 1).
4. αβ generates a normal integral basis of L′/K (normal-integral-basis-of-split-extension).
5. L ⊆ L′ with L/K Galois, so Tr_{L′/L}(αβ) generates a normal integral basis of L/K (trace-of-normal-integral-basis-generator, whose proof is the same for local fields).
6. Only if: Speiser (tame-of-normal-integral-basis).

Direct prerequisites: [CA.7/local-tame-split-extension](#CA-7-local-tame-split-extension), [CA.7/local-unramified-normal-integral-basis](#CA-7-local-unramified-normal-integral-basis), [CA.7/local-totally-tamely-ramified-normal-integral-basis](#CA-7-local-totally-tamely-ramified-normal-integral-basis), [CA.7/normal-integral-basis-of-split-extension](#CA-7-normal-integral-basis-of-split-extension), [CA.7/trace-of-normal-integral-basis-generator](#CA-7-trace-of-normal-integral-basis-generator), [CA.7/tame-of-normal-integral-basis](#CA-7-tame-of-normal-integral-basis).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 9.5 (printed p. 16). The tame direction.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Corollary 9.10 (printed p. 19). The mathematical contract, with the conventions stated here.

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Introduction (printed p. 153). The attribution to Noether.

Proof or interface frontier: Local Noether reverse implication consumes local trace from NIB, whereas node266 only supplies number-field trace.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-locally-free-lattice"></a>

### Locally free lattices over an order

`ClassicalArithmeticCompletion:CA.7/locally-free-lattice` · definition.

Let A be a Dedekind domain that is not a field with fraction field K and Λ an A-algebra that is finitely generated as an A-module (an A-order in the K-algebra K ⊗ Λ). A left Λ-module M is a locally free Λ-lattice of rank n if M is finitely generated over A and, for every nonzero prime v of A, the completion Â_v ⊗_A M is isomorphic to (Â_v ⊗_A Λ)^n as an Â_v ⊗_A Λ-module: there is an Â_v-linear isomorphism Â_v ⊗ M ≅ Â_v ⊗ Λ^n commuting with the action of every element of Λ. For Λ = A[G] and M = B with its group-ring structure, rank one local freeness says that at every v the completed module has a normal basis: Â_v ⊗ B = Â_v[G]·α_v.

Hypotheses and conventions: A Dedekind domain, K its fraction field, Â_v = v.adicCompletionIntegers K. Λ an A-algebra (possibly noncommutative), M a left Λ-module with the scalar tower A → Λ → M. The rank n is a natural number; rank zero forces M = 0. A is not a field for completion detection, rank/zero consequences and projectivity. The raw completion predicate is vacuous over fields and does not imply these conclusions there.

API:

- `LocallyFree.IsLocallyFreeOfRank` (data): M is a locally free Λ-lattice of rank n.
- `LocallyFree.IsLocallyFreeOfRank.of_free` (constructor): Λ^n is locally free of rank n.
- `LocallyFree.IsLocallyFreeOfRank.prod` (structure): M ⊕ N is locally free of rank n + m.
- `LocallyFree.IsLocallyFreeOfRank.of_linearEquiv` (compatibility): Local freeness is invariant under Λ-isomorphism.
- `LocallyFree.IsLocallyFreeOfRank.finrank` (projection): dim_K(K ⊗ M) = n·dim_K(K ⊗ Λ). Requires A not a field.
- `LocallyFree.isLocallyFreeOfRank_one_groupRing_iff` (characterisation): For Λ = A[G] and M = B: rank one local freeness is the existence at every v of a basis of Â_v ⊗ B indexed by G with b_g = g·b_1.
- `LocallyFree.not_free_of_not_isPrincipal` (example): A nonzero nonprincipal ideal of A is locally free of rank one over A and not free.

Unit tests:

- `LocallyFree.test_self` (degenerate): Λ is locally free of rank one over itself.
- `LocallyFree.test_rank_zero` (degenerate): If A is not a field, a locally free lattice of rank zero is zero. Over A=Q the raw height-one completion predicate holds for M=Q even at rank zero.
- `LocallyFree.test_ideal_not_free` (non-example): A nonzero nonprincipal ideal of a Dedekind domain is locally free of rank one but not free.
- `LocallyFree.test_gaussian_not_locallyFree` (non-example): ℤ[i] is not locally free of rank one over ℤ[Gal(ℚ(i)/ℚ)].

Further acceptance checks:

- A nonprincipal ideal I of a Dedekind domain A is locally free of rank one over Λ = A, but not free: local freeness does not imply freeness.
- ℤ[i] is not locally free of rank one over ℤ[C_2]: at 2 the completed module has no normal basis (local-noether).

Proof sketch:

1. Define IsLocallyFreeOfRank as finite generation over A together with, for each HeightOneSpectrum v, an Â_v-linear equivalence commuting with the base changes of the maps DistribSMul.toLinearMap A M λ.
2. Free lattices: Λ^n is locally free of rank n (the identity equivalence).
3. Direct sums add ranks; isomorphic modules are simultaneously locally free.
4. Rank: tensoring the local isomorphism with Frac(Â_v) and comparing dimensions over K gives dim_K(K ⊗ M) = n·dim_K(K ⊗ Λ).
5. Group ring form: an Â_v[G]-isomorphism Â_v[G] ≅ Â_v ⊗ B is determined by the image b_1 of 1, and b_g = g·b_1.

Direct prerequisites: `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`, `mathlib:LinearMap.baseChange`, `mathlib:Module.Finite`, `mathlib:IsDedekindDomain`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 10.2 (printed p. 20). The mathematical contract, with the conventions stated here, with M_p the completion (Section 4.2 of the source defines M_p = O_p ⊗_O M).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Example 10.6 (printed p. 20). The group-ring characterisation in the API.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), 20.2.8 (printed p. 318). The same definition for orders.

Proof or interface frontier: Local-freeness rank claims fail for fields: HeightOneSpectrum A empty, any finite M satisfies predicate for any rank. A=K=Lambda=M=Q,n=0 refutes rank and zero claims. Add A not a field to rank consequences and document predicate vacuity.

Revision disposition: The nonfield hypothesis is retained on rank consequences. Completion conditions over a field are vacuous and are not used to infer generic rank. The definition and its native rank tests agree at this convention; completion transport is still pending.

<a id="CA-7-locally-free-lattice-is-projective"></a>

### Locally free lattices are projective

`ClassicalArithmeticCompletion:CA.7/locally-free-lattice-is-projective` · lemma.

Let A be a Dedekind domain that is not a field and Λ an A-algebra finitely generated as an A-module. A locally free Λ-lattice of rank n is a finitely generated projective Λ-module.

Hypotheses and conventions: Λ is module-finite over the noetherian ring A, hence left noetherian; M is finitely presented over Λ. A is not a field for completion detection, rank/zero consequences and projectivity. The raw completion predicate is vacuous over fields and does not imply these conclusions there.

Further acceptance checks:

- Λ^n is projective.
- A nonzero ideal of a Dedekind domain is projective (rank one, Λ = A).

Proof sketch:

1. Projectivity of a finitely presented module is the exactness of Hom_Λ(M, −) on surjections.
2. For a flat commutative A-algebra A′, A′ ⊗ Hom_Λ(M, N) ≅ Hom_{A′⊗Λ}(A′ ⊗ M, A′ ⊗ N) since M is finitely presented.
3. Exactness of a sequence of A-modules is checked after localisation at every maximal ideal (Mathlib's local properties), and A_(v) → Â_v is faithfully flat (flat local homomorphism of noetherian local rings).
4. At every v, Â_v ⊗ M ≅ (Â_v ⊗ Λ)^n is free, so Hom out of it is exact; descend.

Direct prerequisites: [CA.7/locally-free-lattice](#CA-7-locally-free-lattice), `mathlib:Module.Projective`, `mathlib:Module.FaithfullyFlat`, `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom`, `mathlib:AdicCompletion.flat_of_isNoetherian`, `mathlib:Module.FinitePresentation`, `mathlib:Module.projective_of_localization_maximal`.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), 20.2.6 and 20.2.8 (printed p. 318). The mathematical contract, with the conventions stated here; the passage from completion to localisation is faithful flatness.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 14, first paragraph (printed p. 26). The same statement, whose proof the source omits.

Proof or interface frontier: Projectivity from completion conditions fails over fields: Q[epsilon]/epsilon^2 acts on Q via epsilon=0, all height-one conditions vacuous but Q nonprojective. Restrict A to a nonfield Dedekind domain.

Revision disposition: The nonfield Dedekind and module-finite order hypotheses are retained. Faithfully flat completion descent for noncommutative modules remains a supplier gap.

<a id="CA-7-sublattice-eq-of-completions"></a>

### Lattices are determined by their completions

`ClassicalArithmeticCompletion:CA.7/sublattice-eq-of-completions` · lemma.

Let A be a Dedekind domain that is not a field, V an A-module, and N ⊆ P two A-submodules of V with P finitely generated. If Â_v ⊗ N → Â_v ⊗ P is surjective for every nonzero prime v of A, then N = P.

Hypotheses and conventions: A Dedekind domain; P finitely generated over A. A is not a field for completion detection, rank/zero consequences and projectivity. The raw completion predicate is vacuous over fields and does not imply these conclusions there.

Further acceptance checks:

- For A = ℤ, V = ℚ, N = 2ℤ ⊆ P = ℤ: the map fails to be onto exactly at v = 2.
- Used to identify the associated order of a tame extension with the group ring.

Proof sketch:

1. P/N is a finitely generated A-module with Â_v ⊗ (P/N) = 0 for all v (right exactness of the tensor product).
2. A_(v) → Â_v is faithfully flat, so (P/N)_(v) = 0 for every maximal ideal v.
3. A module whose localisations at all maximal ideals vanish is zero (Module.eq_zero_of_localization_maximal); hence N = P.

Direct prerequisites: `mathlib:Submodule.eq_of_localization_maximal`, `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom`, `mathlib:AdicCompletion.flat_of_isNoetherian`, `mathlib:LinearMap.baseChange`.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), Corollary 9.4.7 and Lemma 9.5.3 (printed pp. 140–142). The node is the containment half of the local–global dictionary, stated with completions.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 4.2 and Lemma 4.1 (printed p. 6). The convention for completed lattices used throughout the layer.

Proof or interface frontier: Completion equality fails over fields: A=Q,V=P=Q,N=0 meets all vacuous conditions. Add A not a field; faithful-flat completion transport needs a supplier.

Revision disposition: The nonfield hypothesis is retained. The faithfully flat completion-to-localisation transport remains explicit.

<a id="CA-7-completed-ring-of-integers-is-induced"></a>

### The completed ring of integers is induced from a decomposition group

`ClassicalArithmeticCompletion:CA.7/completed-ring-of-integers-is-induced` · lemma.

Let L/K be a finite Galois extension of number fields with group G, v a nonzero prime of 𝓞_K and w a prime of 𝓞_L above v with decomposition group G_w, identified with Gal(L_w/K_v). Then, as 𝒪̂_v[G]-modules, 𝒪̂_v ⊗ 𝓞_L ≅ Π_{w′|v} 𝒪_{L_{w′}} ≅ 𝒪̂_v[G] ⊗_{𝒪̂_v[G_w]} 𝒪_{L_w} (induction along G_w ⊆ G, with left modules).

Hypotheses and conventions: L/K finite Galois; v, w as stated; the completions are the canonical ones of the NumberFieldArithmetic roadmap.

Further acceptance checks:

- For v unramified and split completely, G_w = 1 and the module is 𝒪̂_v[G] ⊗ 𝒪̂_v = 𝒪̂_v[G].
- For v inert, G_w = G and the statement is 𝒪̂_v ⊗ 𝓞_L = 𝒪_{L_w}.

Proof sketch:

1. NumberFieldArithmetic Layer 5.7 gives the integral semilocal equivalence 𝒪̂_v ⊗ 𝓞_L ≅ Π_{w′|v} 𝒪_{L_{w′}} with its pure-tensor formula; it is G-equivariant, G permuting the factors.
2. G acts transitively on the primes over v with stabiliser G_w; NumberFieldArithmetic Layer 5.6 identifies G_w with Gal(L_w/K_v) through decompositionHom.
3. Choose left coset representatives R of G_w in G; the product is ⊕_{g∈R} g·𝒪_{L_w}, which is the induced module 𝒪̂_v[G] ⊗_{𝒪̂_v[G_w]} 𝒪_{L_w}.

Direct prerequisites: [CA.7/ring-of-integers-as-group-ring-module](#CA-7-ring-of-integers-as-group-ring-module), `mathlib:MonoidAlgebra`, `mathlib:Ideal.isPretransitive_of_isGaloisGroup`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 10.7 (printed p. 20). The node, with the induction written for left modules (see the recorded misprint).

Proof or interface frontier: Noncommutative induction needs its own tensor/module interface; current typed-comment owner gap is honest.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-locally-free-of-tame"></a>

### Noether: tame extensions have locally free rings of integers

`ClassicalArithmeticCompletion:CA.7/locally-free-of-tame` · theorem.

Let L/K be a finite tamely ramified Galois extension of number fields with group G. Then 𝓞_L is a locally free 𝓞_K[G]-lattice of rank one.

Hypotheses and conventions: L/K finite Galois and tame.

Further acceptance checks:

- ℚ(ζ_p)/ℚ: locally free (indeed free).
- ℚ(i)/ℚ: not locally free at 2 (wild).

Proof sketch:

1. Fix v and w | v. L_w/K_v is Galois with group G_w (NumberFieldArithmetic Layer 5.6) and tamely ramified, since its ramification index is e(w|v) (NumberFieldArithmetic Layer 5.5).
2. By the local Noether theorem 𝒪_{L_w} = 𝒪̂_v[G_w]·α_w.
3. By completed-ring-of-integers-is-induced, 𝒪̂_v ⊗ 𝓞_L ≅ 𝒪̂_v[G] ⊗_{𝒪̂_v[G_w]} 𝒪̂_v[G_w] ≅ 𝒪̂_v[G].

Direct prerequisites: [CA.7/local-noether](#CA-7-local-noether), [CA.7/completed-ring-of-integers-is-induced](#CA-7-completed-ring-of-integers-is-induced), [CA.7/locally-free-lattice](#CA-7-locally-free-lattice), [CA.7/tamely-ramified](#CA-7-tamely-ramified).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 10.7 (printed p. 20). The mathematical contract, with the conventions stated here.

Source: [taylor-froehlich-conjecture-1981](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Introduction and Results (printed p. 41). The theorem as Taylor uses it (over ℤΓ; see ring-of-integers-locally-free-over-integral-group-ring).

Proof or interface frontier: Global Noether proof needs separate decomposition-group induction and completion suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-noether-theorem"></a>

### Noether's theorem

`ClassicalArithmeticCompletion:CA.7/noether-theorem` · theorem.

Let L/K be a finite Galois extension of number fields with group G. The following are equivalent: (i) L/K is tamely ramified; (ii) 𝓞_L is a locally free 𝓞_K[G]-lattice of rank one; (iii) 𝓞_L is a projective 𝓞_K[G]-module.

Hypotheses and conventions: L/K finite Galois.

Further acceptance checks:

- For ℚ(i)/ℚ all three fail.
- Local freeness does not give freeness: see locally-free-not-free-example and the Fröhlich–Taylor theorems.

Proof sketch:

1. (i) ⇒ (ii): locally-free-of-tame.
2. (ii) ⇒ (iii): use locally-free-lattice-is-projective with A=𝓞_K, which is a nonfield Dedekind domain. This is the number-field theorem; the vacuous height-one-prime predicate over a field cannot justify this step.
3. (iii) ⇒ (i): trace-surjective-of-projective and tame-iff-trace-surjective.
4. (i) ⇒ (iii) also holds directly: projective-of-tame.

Direct prerequisites: [CA.7/locally-free-of-tame](#CA-7-locally-free-of-tame), [CA.7/locally-free-lattice-is-projective](#CA-7-locally-free-lattice-is-projective), [CA.7/trace-surjective-of-projective](#CA-7-trace-surjective-of-projective), [CA.7/tame-iff-trace-surjective](#CA-7-tame-iff-trace-surjective).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 1.3 (printed p. 2). The local form, combined with Theorem 10.7 and Example 10.6, is the equivalence (i) ⇔ (ii).

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proposition 1.3 (printed p. 156). The projectivity form (i) ⇒ (iii).

Proof or interface frontier: Noether three-way equivalence is sound under the stated number-field hypotheses. After correcting the nonfield hypotheses of 283–285, the Noether chain needs to expose the nonfield case or a separate field/normal-basis branch before invoking284. Native equivalence and packet quantifiers need owner-specific reconciliation.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-ring-of-integers-locally-free-over-integral-group-ring"></a>

### The ring of integers is locally free over ℤ[G]

`ClassicalArithmeticCompletion:CA.7/ring-of-integers-locally-free-over-integral-group-ring` · lemma.

Let L/K be a finite tamely ramified Galois extension of number fields with group G. Then 𝓞_L, with the action of ℤ[G] through G, is a locally free ℤ[G]-lattice of rank [K : ℚ].

Hypotheses and conventions: L/K finite Galois and tame.

Further acceptance checks:

- For K = ℚ the rank is one and the statement is locally-free-of-tame.
- The rank is [K : ℚ], not 1: 𝓞_K[G] itself is free of rank [K : ℚ] over ℤ[G].

Proof sketch:

1. At a rational prime p: ℤ_p ⊗ 𝓞_L = (ℤ_p ⊗ 𝓞_K) ⊗_{𝓞_K} 𝓞_L = Π_{v|p} 𝒪̂_v ⊗_{𝓞_K} 𝓞_L (NumberFieldArithmetic Layer 5.7 over ℚ).
2. Each factor is 𝒪̂_v[G] (locally-free-of-tame), so the product is (ℤ_p ⊗ 𝓞_K)[G].
3. ℤ_p ⊗ 𝓞_K is free of rank [K : ℚ] over ℤ_p, so the module is ℤ_p[G]^{[K:ℚ]}.

Direct prerequisites: [CA.7/locally-free-of-tame](#CA-7-locally-free-of-tame), [CA.7/locally-free-lattice](#CA-7-locally-free-lattice).

Source: [taylor-froehlich-conjecture-1981](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Introduction and Results (printed p. 41). The node, with the rank made explicit.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Remark 3.17 (printed p. 6). The rank computation.

Proof or interface frontier: Restriction to Z has rank [K:Q], not one; add exact integral-basis supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-locally-free-not-free-example"></a>

### Local freeness is separate from freeness

`ClassicalArithmeticCompletion:CA.7/locally-free-not-free-example` · application.

Let A be a Dedekind domain with a nonzero nonprincipal ideal I (for example A = ℤ[√−5], I = (2, 1 + √−5)). Then I is a locally free A-lattice of rank one (over the trivial group ring A[1] = A) but is not free. Hence a locally free lattice over an order need not be free, and the class of a locally free lattice in the locally free class group can be nonzero.

Hypotheses and conventions: A Dedekind domain; I ≠ 0 nonprincipal.

Further acceptance checks:

- The acceptance gate of the layer: local freeness is separate from global freeness.
- Its class in Cl(A) = Pic(A) is the ideal class of I, nonzero (locally-free-class-group, classGroup_test_ideal).

Proof sketch:

1. Locally free: every completion Â_v is a discrete valuation ring, so Â_v ⊗ I is a nonzero ideal of a DVR (flatness), hence free of rank one.
2. Not free: a free ideal of rank one is principal; I is finitely generated of rank one, so free would mean I ≅ A, i.e. I principal.

Direct prerequisites: [CA.7/locally-free-lattice](#CA-7-locally-free-lattice), `mathlib:IsDedekindDomain`, `mathlib:ClassGroup`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Examples 3.3(i) (printed p. 4). The non-freeness half.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 15.1 (printed p. 28). The source's own separation of local and global freeness.

Proof or interface frontier: The nonprincipal ideal example needs a proved nonprincipality/norm argument and its own node.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-order-in-finite-dimensional-algebra"></a>

### Orders in finite-dimensional algebras

`ClassicalArithmeticCompletion:CA.7/order-in-finite-dimensional-algebra` · definition.

Let R be a noetherian domain with fraction field F and E a finite-dimensional F-algebra. An R-order in E is an R-subalgebra Λ of E (a subring containing 1 and the image of R) that is an R-lattice in E: finitely generated as an R-module and spanning E over F (Mathlib's Submodule.IsLattice F). Examples: the group ring R[G] in F[G] for a finite group G, the integral closure of R in a finite separable field extension of F, M_n(R) in M_n(F).

Hypotheses and conventions: R noetherian domain, F = Frac R, E a finite-dimensional F-algebra, not necessarily commutative.

API:

- `IntegralOrder.IsOrder` (data): Λ is an R-order in E: an R-subalgebra that is an R-lattice.
- `IntegralOrder.isOrder_iff` (characterisation): Λ is an order exactly when it is finitely generated over R and spans E over F.
- `IntegralOrder.IsOrder.isIntegral` (relation): Every element of an order is integral over R.
- `IntegralOrder.isOrder_of_isIntegral` (constructor): In a separable algebra a spanning subring of integral elements over an integrally closed noetherian R is an order.
- `IntegralOrder.groupRingSubalgebra` (data): The group ring R[G] as a subalgebra of F[G].
- `IntegralOrder.groupRing_isOrder` (example): R[G] is an order in F[G] for a finite group G.
- `IntegralOrder.integralClosure_isOrder` (compatibility): The integral closure of R in a finite separable field extension of F is an order; for number fields this is 𝓞_K, compatible with Tau Ceti's NumberFieldOrder of the GlobalNumberFields roadmap.

Unit tests:

- `IntegralOrder.order_test_base` (degenerate): R is an order in F.
- `IntegralOrder.order_test_not_finitelyGenerated` (non-example): ℤ[1/2] ⊆ ℚ is not an order.
- `IntegralOrder.order_test_groupRing` (compatibility): ℤ[G] is an order in ℚ[G] for a finite group G.

Further acceptance checks:

- ℤ[1/2] ⊆ ℚ is a subring spanning ℚ but not an order: it is not finitely generated.
- R itself is an order in F (E = F).

Proof sketch:

1. Define IsOrder Λ as Submodule.IsLattice F applied to the underlying R-submodule of Λ.
2. Every element of an order is integral over R: R[x] ⊆ Λ is a finitely generated R-module.
3. Conversely (E separable: the trace form of the regular representation is nondegenerate) a subring spanning E whose elements are integral is finitely generated: for an F-basis α_i of E inside Λ and β ∈ Λ, the coordinates of β lie in r⁻¹R with r = det(tr(α_iα_j)) (Cramer), so Λ ⊆ r⁻¹Σ Rα_i.
4. Group rings: the images of the group elements form an R-basis of R[G] and an F-basis of F[G].
5. Integral closures: finite over R for separable extensions of the fraction field (Mathlib's IsIntegralClosure.finite) and spanning.

Direct prerequisites: `mathlib:Submodule.IsLattice`, `mathlib:MonoidAlgebra`, `mathlib:IsIntegralClosure`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 3.8 and Examples 3.10 (printed p. 5). The definition in the conventions used here.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), Definition 10.2.1 and Lemma 10.3.7 (printed pp. 152–154). The definition and the integrality characterisation in the API.

Proof or interface frontier: IsOrder and groupRingSubalgebra are distinct definitions; integrality and integral-closure finiteness are consumed suppliers not direct prerequisites. Native noetherian/integrally-closed hypotheses correctly strengthen the converse.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-left-order-of-lattice"></a>

### The left order of a lattice

`ClassicalArithmeticCompletion:CA.7/left-order-of-lattice` · construction.

Let R be a noetherian domain with fraction field F, E a finite-dimensional F-algebra and M an R-lattice in E. The left order of M is O_l(M) = {x ∈ E | x·M ⊆ M}; it is an R-order in E. If M is itself an order then O_l(M) = M.

Hypotheses and conventions: R noetherian; M an R-lattice in E.

API:

- `IntegralOrder.leftOrder` (data): The left order {x ∈ E | x·M ⊆ M} of an R-submodule M of E.
- `IntegralOrder.mem_leftOrder_iff` (characterisation): x ∈ O_l(M) exactly when x·m ∈ M for all m ∈ M.
- `IntegralOrder.leftOrder_isOrder` (constructor): The left order of a lattice is an order.
- `IntegralOrder.leftOrder_eq_self` (compatibility): The left order of an order is itself.
- `IntegralOrder.leftOrder_smul` (relation): In a field, O_l(aM) = O_l(M) for a ≠ 0.

Unit tests:

- `IntegralOrder.leftOrder_test_self` (computation): The left order of R ⊆ F is R.
- `IntegralOrder.leftOrder_test_top_contains` (characterisation): Every left order contains R.
- `IntegralOrder.leftOrder_test_scale` (compatibility): The left order of 2M ⊆ ℚ equals that of M.

Further acceptance checks:

- The left order of 2ℤ ⊆ ℚ is ℤ.
- Rescaling a lattice in a field does not change its left order.

Proof sketch:

1. O_l(M) is an R-subalgebra: closed under products and sums and containing R·1.
2. Spanning: for y ∈ E, yM is a lattice in yE and there is nonzero r ∈ R with r·yM ⊆ M, so ry ∈ O_l(M).
3. Finitely generated: there is nonzero s ∈ R with s·1 ∈ M, so O_l(M)·s ⊆ M and O_l(M) ⊆ s⁻¹M, a noetherian module.
4. For an order Λ: Λ·Λ ⊆ Λ gives Λ ⊆ O_l(Λ), and 1 ∈ Λ gives O_l(Λ) ⊆ Λ.

Direct prerequisites: [CA.7/order-in-finite-dimensional-algebra](#CA-7-order-in-finite-dimensional-algebra), `mathlib:Submodule.IsLattice`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 3.11 and Proposition 3.12 (printed p. 5). The mathematical contract, with the conventions stated here.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), Lemma 10.2.7 (printed p. 152). The same statement with its proof.

Proof or interface frontier: Left-order construction and its order property consumed by associated-order are separate nodes; lattice containment/scaling need exact suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-maximal-order"></a>

### Maximal orders

`ClassicalArithmeticCompletion:CA.7/maximal-order` · definition.

Let R be a noetherian domain with fraction field F and E a finite-dimensional F-algebra. An R-order Λ in E is maximal if it is not properly contained in another R-order. The integral closure of an integrally closed R in a finite separable field extension is the unique maximal order there; for a nontrivial finite group G with |G| invertible in F, R[G] is not a maximal order in F[G] when |G| is not a unit in R.

Hypotheses and conventions: R noetherian domain; E finite-dimensional over F.

API:

- `IntegralOrder.IsMaximalOrder` (data): Λ is a maximal R-order in E.
- `IntegralOrder.IsMaximalOrder.eq_of_le` (characterisation): An order containing a maximal order equals it.
- `IntegralOrder.integralClosure_isMaximalOrder` (compatibility): The integral closure of a Dedekind domain in a finite separable field extension is the maximal order.
- `IntegralOrder.groupRing_not_isMaximalOrder` (other): R[G] is not maximal for G ≠ 1 when |G| is not a unit of R.

Unit tests:

- `IntegralOrder.maximalOrder_test_ringOfIntegers` (compatibility): 𝓞_K is a maximal ℤ-order in K.
- `IntegralOrder.maximalOrder_test_integers` (degenerate): ℤ is the maximal order of ℚ.
- `IntegralOrder.maximalOrder_test_groupRing_not_maximal` (non-example): ℤ[G] is not maximal in ℚ[G] for a nontrivial finite group G.

Further acceptance checks:

- 𝓞_K is the maximal ℤ-order of K; ℤ is the maximal order of ℚ.
- ℤ[G] is not maximal for G ≠ 1.

Proof sketch:

1. Define IsMaximalOrder as IsOrder together with maximality among orders.
2. Fields: every order consists of integral elements, so lies in the integral closure, which is an order; hence it is the unique maximal order.
3. Group rings: e = |G|⁻¹Σ_g g is an idempotent of F[G], integral over R, commuting with R[G]; R[G][e] is an order strictly containing R[G] when e ∉ R[G], i.e. when |G| is not a unit of R.

Direct prerequisites: [CA.7/order-in-finite-dimensional-algebra](#CA-7-order-in-finite-dimensional-algebra), `mathlib:IsIntegralClosure`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 13.6 and Examples 13.7 (printed p. 24). The definition and the two examples used as tests.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), Definition 10.4.1 (printed p. 155). The same definition.

Proof or interface frontier: Maximality definition and field/group-ring characterisations are separate named facts. Group-ring extension by averaging idempotent needs a finite-order supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-existence-of-maximal-orders"></a>

### Every order in a separable algebra lies in a maximal order

`ClassicalArithmeticCompletion:CA.7/existence-of-maximal-orders` · lemma.

Let R be an integrally closed noetherian domain with fraction field F and E a separable finite-dimensional F-algebra (nondegenerate trace form). Every R-order in E is contained in a maximal R-order.

Hypotheses and conventions: E separable: the bilinear form (x, y) ↦ tr(xy) of the regular representation is nondegenerate.

Further acceptance checks:

- ℚ[G] is separable (characteristic zero, Maschke), so ℤ[G] lies in a maximal order.
- For E = K a number field the maximal order is 𝓞_K.

Proof sketch:

1. Fix an F-basis α_i of E inside Λ; by the Cramer argument of order-in-finite-dimensional-algebra every order containing Λ lies in the finitely generated module r⁻¹ΣRα_i.
2. That module is noetherian, so the nonempty set of orders containing Λ has a maximal element.

Direct prerequisites: [CA.7/maximal-order](#CA-7-maximal-order), [CA.7/order-in-finite-dimensional-algebra](#CA-7-order-in-finite-dimensional-algebra).

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), 10.4.2 (printed p. 155). The node.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 14, first paragraph (printed p. 25). The use in the source.

Proof or interface frontier: Proof needs uniform trace-dual lattice containment, not just a reference to an integrality criterion; expose a bound independent of the overorder.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-maximal-order-of-cyclic-group-algebra"></a>

### The maximal order of ℚ[C_p]

`ClassicalArithmeticCompletion:CA.7/maximal-order-of-cyclic-group-algebra` · application.

Let p be a prime and G cyclic of order p. Then ℚ[G] ≅ ℚ × ℚ(ζ_p) by x ↦ (ε(x), α(x)) (augmentation and g ↦ ζ_p); the maximal ℤ-order is M = ℤ[G][e₁] with e₁ = p⁻¹Σ_g g, corresponding to ℤ × ℤ[ζ_p]; and [M : ℤ[G]] = p, with ℤ[G] = {(x, y) ∈ ℤ × ℤ[ζ_p] : x ≡ y mod (1 − ζ_p)}.

Hypotheses and conventions: p prime; G cyclic of order p.

Further acceptance checks:

- p = 2: ℚ[C_2] ≅ ℚ × ℚ and M = ℤe₁ ⊕ ℤe₋₁, the associated order of ℚ(i)/ℚ.
- The index p shows ℤ[C_p] is not maximal.

Proof sketch:

1. The map is a surjective ℚ-algebra map between algebras of dimension p, hence an isomorphism.
2. ℤ × ℤ[ζ_p] is the product of the maximal orders of the factors (integral closures), hence the unique maximal order of the commutative algebra.
3. Both components of an element of ℤ[G] reduce to the same element of 𝔽_p = ℤ[ζ_p]/(1 − ζ_p); conversely a count of indices shows equality.
4. e₁ corresponds to (1, 0) and e₂ = 1 − e₁ to (0, 1), so M = ℤ[G][e₁] and the index is p.

Direct prerequisites: [CA.7/maximal-order](#CA-7-maximal-order), `mathlib:IsCyclotomicExtension.Rat.adjoin_singleton_eq_top`, `mathlib:IsIntegralClosure`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Example 13.9 (printed p. 24). The mathematical contract, with the conventions stated here.

Proof or interface frontier: Native contains only maximality and index, omitting algebra equivalence, congruence fibre-product description and its surjectivity. Split these constructions/lemmas.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-associated-order"></a>

### The associated order of a Galois extension

`ClassicalArithmeticCompletion:CA.7/associated-order` · construction.

Let A be a Dedekind domain with fraction field K, L/K a finite Galois extension with group G and B the integral closure of A in L. The associated order of L/K is A_{L/K} = {x ∈ K[G] | x·B ⊆ B}, where K[G] acts on L through the Galois representation. It is an A-order in K[G] containing A[G]; by the normal basis map it is the left order of the A-lattice in K[G] corresponding to B. If B is free over some A-order Γ ⊆ K[G] then Γ = A_{L/K}, and A_{L/K} = A[G] exactly when L/K is tamely ramified.

Hypotheses and conventions: A Dedekind domain; B the integral closure of A in the finite Galois extension L of K = Frac A (Mathlib's AKLB setting).

API:

- `IntegralGaloisModule.associatedOrder` (data): A_{L/K} = {x ∈ K[G] | x·B ⊆ B} as an A-subalgebra of K[G].
- `IntegralGaloisModule.mem_associatedOrder_iff` (characterisation): x ∈ A_{L/K} exactly when x·b ∈ B for every b ∈ B.
- `IntegralGaloisModule.groupRingSubalgebra_le_associatedOrder` (relation): A[G] ⊆ A_{L/K}.
- `IntegralGaloisModule.associatedOrder_isOrder` (structure): A_{L/K} is an A-order in K[G].
- `IntegralGaloisModule.associatedOrder_eq_of_free` (characterisation): If B is free of rank one over an A-order Γ ⊆ K[G], then Γ = A_{L/K}.
- `IntegralGaloisModule.associatedOrder_eq_groupRing_iff` (compatibility): A_{L/K} = A[G] exactly when B/A is tamely ramified.

Unit tests:

- `IntegralGaloisModule.associatedOrder_test_trivial` (degenerate): For the trivial group and Dedekind A, the associated order is A[G]=A. Integral closedness cannot be dropped: A=Z[2i],K=L=Q(i),B=Z[i].
- `IntegralGaloisModule.associatedOrder_test_contains_groupRing` (characterisation): Every group element lies in A_{L/K}.
- `IntegralGaloisModule.associatedOrder_test_gaussian_strict` (non-example): For ℚ(i)/ℚ, ℤ[G] is strictly smaller than A_{L/K}.

Further acceptance checks:

- For L = K, A_{L/K} = A.
- For ℚ(i)/ℚ, A_{L/K} = ℤe₁ ⊕ ℤe₋₁ ⊋ ℤ[G] (associated-order-of-gaussian-integers).

Proof sketch:

1. Define the subalgebra by its carrier; closure under products and sums and containment of A are immediate.
2. A[G] ⊆ A_{L/K} since B is G-stable.
3. Order: the normal basis map identifies L with K[G] as K[G]-modules and B with an A-lattice M; A_{L/K} is the left order of M (left-order-of-lattice).

Direct prerequisites: [CA.7/left-order-of-lattice](#CA-7-left-order-of-lattice), [CA.7/rational-normal-basis-map](#CA-7-rational-normal-basis-map), [CA.7/ring-of-integers-as-group-ring-module](#CA-7-ring-of-integers-as-group-ring-module), `mathlib:IsIntegralClosure`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Definition 3.13 and Remark 3.14 (printed pp. 5–6). The mathematical contract, with the conventions stated here.

Proof or interface frontier: Native trivial-group equality is false without integrally closed A: A=Z[2i],K=L=Q(i),B=Z[i]. Add Dedekind hypothesis to the test. Definition and consumed order property need separate nodes.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-associated-order-of-free"></a>

### The only order over which the integers can be free

`ClassicalArithmeticCompletion:CA.7/associated-order-of-free` · lemma.

In the setting of the associated order: if B = Γ·α is free of rank one over an A-order Γ ⊆ K[G], then Γ = A_{L/K}.

Hypotheses and conventions: Γ an A-order in K[G]; α ∈ B with B = Γ·α freely.

Further acceptance checks:

- A normal integral basis gives A_{L/K} = A[G].
- For ℚ(i)/ℚ, ℤ[i] = A_{L/K}·(1 + i).

Proof sketch:

1. L = K[G]·α freely (tensor with K).
2. x ∈ A_{L/K}: xα ∈ B = Γα, so xα = yα with y ∈ Γ, and freeness gives x = y ∈ Γ.
3. γ ∈ Γ: γB = γΓα ⊆ Γα = B, so γ ∈ A_{L/K}.

Direct prerequisites: [CA.7/associated-order](#CA-7-associated-order), [CA.7/normal-integral-basis](#CA-7-normal-integral-basis).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 3.15 (printed p. 6). The mathematical contract, with the conventions stated here.

<a id="CA-7-associated-order-eq-group-ring-iff-tame"></a>

### The associated order is the group ring exactly in the tame case

`ClassicalArithmeticCompletion:CA.7/associated-order-eq-group-ring-iff-tame` · theorem.

Let L/K be a finite Galois extension of number fields (or of nonarchimedean local fields) with group G. Then A_{L/K} = 𝓞_K[G] if and only if L/K is tamely ramified.

Hypotheses and conventions: L/K finite Galois; number fields or local fields.

Further acceptance checks:

- ℚ(i)/ℚ: A_{L/K} ⊋ ℤ[G].
- ℚ(ζ_p)/ℚ: A_{L/K} = ℤ[G].

Proof sketch:

1. Wild ⇒ strict: the trace ideal t = Tr(𝓞_L) is a proper nonzero ideal (tame-iff-trace-surjective); pick a ∈ t⁻¹ ∖ 𝓞_K; then a·Σ_g g maps 𝓞_L into a·t ⊆ 𝓞_K, so lies in A_{L/K} but not in 𝓞_K[G].
2. Tame ⇒ equality, local case: 𝒪_L is free over 𝒪_K[G] (local-noether), so A_{L/K} = 𝒪_K[G] (associated-order-of-free).
3. Tame ⇒ equality, global case: at every v the completed module is free over 𝒪̂_v[G] (locally-free-of-tame); the completion of A_{L/K} stabilises it, so lies in 𝒪̂_v[G] by associated-order-of-free; hence 𝓞_K[G] ⊆ A_{L/K} have equal completions everywhere and are equal (sublattice-eq-of-completions).

Direct prerequisites: [CA.7/associated-order](#CA-7-associated-order), [CA.7/associated-order-of-free](#CA-7-associated-order-of-free), [CA.7/tame-iff-trace-surjective](#CA-7-tame-iff-trace-surjective), [CA.7/local-noether](#CA-7-local-noether), [CA.7/locally-free-of-tame](#CA-7-locally-free-of-tame), [CA.7/sublattice-eq-of-completions](#CA-7-sublattice-eq-of-completions).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 9.9 (printed pp. 18–19). The local case, restated in this roadmap’s notation.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Remark 9.11 (printed p. 19). The global case, which the source asserts without proof; the proof steps supply it.

Proof or interface frontier: General finite Dedekind native statement exceeds number/local-field source; completion transport and field case require separate suppliers.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-associated-order-of-gaussian-integers"></a>

### The associated order of ℚ(i)/ℚ

`ClassicalArithmeticCompletion:CA.7/associated-order-of-gaussian-integers` · application.

For L = ℚ(i) with G = {1, σ}: e₁ = (1 + σ)/2 and e₋₁ = (1 − σ)/2 lie in A_{L/ℚ}; A_{L/ℚ} = ℤe₁ ⊕ ℤe₋₁, the maximal order of ℚ[G]; and ℤ[i] = A_{L/ℚ}·(1 + i) since e₁(1 + i) = 1 and e₋₁(1 + i) = i.

Hypotheses and conventions: L = ℚ(i) = ℚ(ζ_4).

Further acceptance checks:

- A wild extension with an associated order strictly larger than the group ring.
- ℤ[i] is free over its associated order although it has no normal integral basis.

Proof sketch:

1. e₁(a + bi) = a and e₋₁(a + bi) = bi, so both preserve ℤ[i].
2. ℤe₁ ⊕ ℤe₋₁ is the maximal order of ℚ[C_2] (maximal-order-of-cyclic-group-algebra with p = 2), so it equals A_{L/ℚ}.
3. The computation e₁(1 + i) = 1, e₋₁(1 + i) = i shows ℤ[i] is free over it with basis 1 + i; associated-order-of-free confirms the equality.

Direct prerequisites: [CA.7/associated-order](#CA-7-associated-order), [CA.7/associated-order-of-free](#CA-7-associated-order-of-free), [CA.7/maximal-order-of-cyclic-group-algebra](#CA-7-maximal-order-of-cyclic-group-algebra).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Example 3.16 (printed p. 6). The mathematical contract, with the conventions stated here.

Proof or interface frontier: Native only asserts averaging idempotent membership; it omits the associated-order equality and free generator asserted by packet.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-normal-integral-basis-of-arithmetically-disjoint-compositum"></a>

### Normal integral bases of arithmetically disjoint composita

`ClassicalArithmeticCompletion:CA.7/normal-integral-basis-of-arithmetically-disjoint-compositum` · lemma.

Let K₁, K₂ ⊆ N be Galois number fields over ℚ, linearly disjoint (their discriminants coprime, which forces this), with K₁K₂ = N, so that Gal(N/ℚ) = Gal(K₁/ℚ) × Gal(K₂/ℚ). If α_i generates a normal integral basis of K_i/ℚ, then α₁α₂ generates a normal integral basis of N/ℚ. More generally (Johnston 6.4(i)), over a base F with coprime different ideals, a normal integral basis of L/F stays one of LK/K.

Hypotheses and conventions: K₁, K₂ Galois over ℚ with coprime discriminants and compositum N.

Further acceptance checks:

- ℚ(ζ_3) and ℚ(ζ_5): ζ_3ζ_5 = ζ_15 generates for ℚ(ζ_15).
- The coprimality hypothesis is needed: ℚ(i) and ℚ(√2) are not arithmetically disjoint.

Proof sketch:

1. Coprime discriminants give linear disjointness for Galois fields (NumberField.linearDisjoint_of_isGalois_isCoprime_discr) and coprime extended differents (NumberField.isCoprime_differentIdeal_of_isCoprime_discr).
2. Module.Basis.ofIsCoprimeDifferentIdeal lifts the ℤ-basis (σα₂)_σ of 𝓞_{K₂} to a 𝓞_{K₁}-basis of 𝓞_N.
3. Combine with the ℤ-basis (τα₁)_τ of 𝓞_{K₁} (Module.Basis.smulTower): (τα₁·σα₂)_{τ,σ} is a ℤ-basis of 𝓞_N.
4. Under Gal(N/ℚ) = Gal(K₁/ℚ) × Gal(K₂/ℚ), (τ, σ)(α₁α₂) = τα₁·σα₂.

Direct prerequisites: `mathlib:Module.Basis.ofIsCoprimeDifferentIdeal`, `mathlib:Module.Basis.ofIsCoprimeDifferentIdeal_apply`, `mathlib:NumberField.linearDisjoint_of_isGalois_isCoprime_discr`, `mathlib:NumberField.isCoprime_differentIdeal_of_isCoprime_discr`, `mathlib:Module.Basis.smulTower`, [CA.7/normal-integral-basis](#CA-7-normal-integral-basis).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 6.4 (printed p. 11). Part (i); part (ii), with K/F Galois of group H and generator β, gives O_{LK} = O_F[G × H]·αβ, which is the node over ℚ.

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proposition 1.8 (printed p. 157). The same statement, proved through discriminants.

Proof or interface frontier: General-base arithmetic-disjointness extension stated in packet is omitted natively; automorphism product equivalence needs its own exact supplier.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-prime-cyclotomic-normal-integral-basis"></a>

### ζ_p generates a normal integral basis of ℚ(ζ_p)

`ClassicalArithmeticCompletion:CA.7/prime-cyclotomic-normal-integral-basis` · lemma.

For an odd prime p, the primitive p-th root of unity ζ_p generates a normal integral basis of ℚ(ζ_p)/ℚ: its conjugates ζ_p, ζ_p², …, ζ_p^{p−1} form a ℤ-basis of ℤ[ζ_p].

Hypotheses and conventions: p an odd prime.

Further acceptance checks:

- p = 3: ζ_3, ζ_3² = −1 − ζ_3 form a ℤ-basis of ℤ[ζ_3].
- For p = 2 the field is ℚ and ζ_2 = −1 is a unit, which generates trivially.

Proof sketch:

1. ℤ[ζ_p] = 𝓞 with power basis 1, ζ_p, …, ζ_p^{p−2} (IsPrimitiveRoot.integralPowerBasis, dimension φ(p) = p − 1).
2. ζ_p is a unit, so multiplying by ζ_p gives the basis ζ_p, …, ζ_p^{p−1}.
3. These are exactly the conjugates of ζ_p (Gal(ℚ(ζ_p)/ℚ) ≅ (ℤ/p)^×).

Direct prerequisites: `mathlib:IsPrimitiveRoot.integralPowerBasis`, `mathlib:IsCyclotomicExtension.Rat.galEquivZMod`, [CA.7/normal-integral-basis](#CA-7-normal-integral-basis).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Proposition 6.6, first paragraph (printed p. 12). The mathematical contract, with the conventions stated here.

Source: [conrad-linear-characters-2026](https://kconrad.math.uconn.edu/blurbs/galoistheory/linearchar.pdf), Example 3.2 (p. 2). The rational statement.

<a id="CA-7-squarefree-cyclotomic-normal-integral-basis"></a>

### ζ_n generates a normal integral basis for odd squarefree n

`ClassicalArithmeticCompletion:CA.7/squarefree-cyclotomic-normal-integral-basis` · theorem.

Let n be odd and squarefree. Then ζ_n generates a normal integral basis of ℚ(ζ_n)/ℚ.

Hypotheses and conventions: n odd squarefree.

Further acceptance checks:

- n = 15: ζ_15 generates.
- n = 9 (not squarefree): ζ_9 does not generate; its conjugates sum to 0.

Proof sketch:

1. Induct on the number of prime factors; n = 1 is trivial and n = p is prime-cyclotomic-normal-integral-basis.
2. Write n = pm with p ∤ m. ℚ(ζ_p) and ℚ(ζ_m) have coprime discriminants (IsCyclotomicExtension.Rat.natAbs_discr) and compositum ℚ(ζ_n) (IntermediateField.isCyclotomicExtension_lcm_sup).
3. By the compositum lemma ζ_pζ_m generates; it is a primitive n-th root of unity, and all primitive n-th roots are conjugate, so ζ_n generates.

Direct prerequisites: [CA.7/prime-cyclotomic-normal-integral-basis](#CA-7-prime-cyclotomic-normal-integral-basis), [CA.7/normal-integral-basis-of-arithmetically-disjoint-compositum](#CA-7-normal-integral-basis-of-arithmetically-disjoint-compositum), `mathlib:IsCyclotomicExtension.Rat.natAbs_discr`, `mathlib:IntermediateField.isCyclotomicExtension_lcm_sup`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Proposition 6.6, second paragraph (printed p. 12). The mathematical contract, with the conventions stated here.

Proof or interface frontier: Squarefree induction needs explicit coprime discriminant and primitive-product root transport lemmas. Claimed statement is sound.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-gauss-period-normal-integral-basis"></a>

### Gauss periods generate normal integral bases

`ClassicalArithmeticCompletion:CA.7/gauss-period-normal-integral-basis` · theorem.

Let n be odd and squarefree and K ⊆ ℚ(ζ_n) a subfield. Then K/ℚ is Galois and the Gauss period Tr_{ℚ(ζ_n)/K}(ζ_n) generates a normal integral basis of K/ℚ.

Hypotheses and conventions: n odd squarefree; K ⊆ ℚ(ζ_n).

Further acceptance checks:

- The quadratic subfield ℚ(√−3) of ℚ(ζ_3) is ℚ(ζ_3) itself; for ℚ(√5) ⊆ ℚ(ζ_5), Tr(ζ_5) = ζ_5 + ζ_5⁴ = (−1 + √5)/2 generates.
- The period generates for every subfield, not only for ℚ(ζ_n) itself.

Proof sketch:

1. ℚ(ζ_n)/ℚ is abelian, so every subfield is Galois over ℚ.
2. Apply trace-of-normal-integral-basis-generator to the generator ζ_n of squarefree-cyclotomic-normal-integral-basis.

Direct prerequisites: [CA.7/squarefree-cyclotomic-normal-integral-basis](#CA-7-squarefree-cyclotomic-normal-integral-basis), [CA.7/trace-of-normal-integral-basis-generator](#CA-7-trace-of-normal-integral-basis-generator).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proposition 6.6 (printed p. 11). The mathematical contract, with the conventions stated here.

Source: [conrad-linear-characters-2026](https://kconrad.math.uconn.edu/blurbs/galoistheory/linearchar.pdf), Example 3.9 (p. 6). The name.

Proof or interface frontier: Gauss-period NIB follows from normal trace descent; subfield Galois instance should cite abelian extension closure.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-tame-abelian-field-in-squarefree-cyclotomic-field"></a>

### A tame abelian number field has odd squarefree cyclotomic level

`ClassicalArithmeticCompletion:CA.7/tame-abelian-field-in-squarefree-cyclotomic-field` · lemma.

Let K/ℚ be a finite abelian extension that is tamely ramified. Then K embeds in ℚ(ζ_n) for some odd squarefree n.

Hypotheses and conventions: K/ℚ finite abelian and tame.

Further acceptance checks:

- ℚ(√5) has level 5; ℚ(√−1) has level 4 and is wild.
- ℚ(√2) has level 8 and is wild at 2.

Proof sketch:

1. By Kronecker–Weber (ClassFieldTheory Layer 13) K ⊆ ℚ(ζ_n) for some n; take n least. Then n ≢ 2 mod 4 since ℚ(ζ_{2m}) = ℚ(ζ_m) for m odd.
2. Let p | n be odd, n = p^r m with p ∤ m. In ℚ(ζ_n) the inertia group of p is Gal(ℚ(ζ_n)/ℚ(ζ_m)) ≅ (ℤ/p^r)^× of order p^{r−1}(p − 1) (Mathlib: ramification index p^{r−1}(p − 1), and the inertia group has order the ramification index).
3. Its image in Gal(K/ℚ) is the inertia group of K at p, of order e_p(K), prime to p by tameness; so the p-Sylow subgroup Gal(ℚ(ζ_n)/ℚ(ζ_{pm})) fixes K and K ⊆ ℚ(ζ_{pm}); minimality forces r = 1.
4. If 2 | n then 4 | n and the inertia group at 2, Gal(ℚ(ζ_n)/ℚ(ζ_{n/2^r})), is a 2-group; tameness makes its image trivial, so K ⊆ ℚ(ζ_{n/2^r}), contradicting minimality. Hence n is odd.

Direct prerequisites: [CA.7/tamely-ramified](#CA-7-tamely-ramified), `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_eq`, `mathlib:Ideal.card_inertia_eq_ramificationIdxIn`, `mathlib:Ideal.ramificationIdxIn_mul_ramificationIdxIn`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Proof of Theorem 8.4, (iii) implies (i) (printed p. 14). The node; n is the conductor, the least level, as in Definition 8.2.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 8.1 (printed p. 14). Kronecker–Weber, imported from the ClassFieldTheory roadmap.

Proof or interface frontier: Cyclotomic inertia projection and its Sylow fixed-field identification are nonroutine suppliers, absent as nodes; Kronecker-Weber is explicit upstream.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-hilbert-speiser"></a>

### The Hilbert–Speiser theorem

`ClassicalArithmeticCompletion:CA.7/hilbert-speiser` · theorem.

Let K/ℚ be a finite abelian extension. The following are equivalent: (i) K has a normal integral basis over ℚ; (ii) K/ℚ is tamely ramified; (iii) K ⊆ ℚ(ζ_n) for some odd squarefree n. When they hold, the Gauss period Tr_{ℚ(ζ_n)/K}(ζ_n) generates a normal integral basis.

Hypotheses and conventions: K/ℚ finite abelian (IsAbelianGalois ℚ K).

Further acceptance checks:

- ℚ(√5), ℚ(√−3), ℚ(ζ_7) have normal integral bases; ℚ(i), ℚ(√2), ℚ(√−2) do not.
- The analogue over K ≠ ℚ fails: tameness gives only local freeness (Noether), and ℚ is the only Hilbert–Speiser field (Greither–Replogle–Rubin–Srivastav, quoted by Ferri–Greither).

Proof sketch:

1. (iii) ⇒ (i): gauss-period-normal-integral-basis.
2. (i) ⇒ (ii): Speiser (tame-of-normal-integral-basis).
3. (ii) ⇒ (iii): tame-abelian-field-in-squarefree-cyclotomic-field.

Direct prerequisites: [CA.7/gauss-period-normal-integral-basis](#CA-7-gauss-period-normal-integral-basis), [CA.7/tame-of-normal-integral-basis](#CA-7-tame-of-normal-integral-basis), [CA.7/tame-abelian-field-in-squarefree-cyclotomic-field](#CA-7-tame-abelian-field-in-squarefree-cyclotomic-field).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 8.4 (printed p. 14). The node; condition (iii) replaces "the conductor is odd squarefree" by the existence of an odd squarefree level, which is equivalent and needs no conductor.

Source: [ferri-greither-tame-galois-2019](https://arxiv.org/pdf/1805.12588), Introduction (p. 1). The theorem and its failure over larger bases.

<a id="CA-7-lagrange-resolvent"></a>

### Lagrange resolvents and the resolvend

`ClassicalArithmeticCompletion:CA.7/lagrange-resolvent` · construction.

Let L/K be a finite Galois extension with group G, E a field containing L, and χ : G → E^× a character. The resolvent of a ∈ L at χ is ⟨a | χ⟩ = Σ_{σ∈G} χ(σ⁻¹)·σ(a) ∈ E. The resolvend of a is r_G(a) = Σ_σ σ(a)·σ⁻¹ ∈ L[G], so that χ applied to r_G(a) is ⟨a | χ⟩. The resolvent is K-linear in a, satisfies ⟨τ(a) | χ⟩ = χ(τ)⟨a | χ⟩, equals the trace at the trivial character, and for abelian G (with E containing enough roots of unity) a is a normal basis generator exactly when all its resolvents are nonzero.

Hypotheses and conventions: L/K finite Galois; E an L-algebra field; characters valued in E^×. Convention (Fröhlich, Taylor): χ(σ⁻¹) in the resolvent, σ⁻¹ in the resolvend.

API:

- `GaloisResolvent.resolvent` (data): ⟨a | χ⟩ = Σ_σ χ(σ⁻¹)σ(a).
- `GaloisResolvent.resolvend` (data): r_G(a) = Σ_σ σ(a)σ⁻¹ ∈ L[G].
- `GaloisResolvent.resolvent_smul` (relation): ⟨τ(a) | χ⟩ = χ(τ)·⟨a | χ⟩.
- `GaloisResolvent.resolvent_one` (compatibility): At the trivial character the resolvent is the trace.
- `GaloisResolvent.resolvent_add` (simp): The resolvent is additive in a.
- `GaloisResolvent.resolvend_smul` (relation): r_G(τa) = τ·r_G(a).
- `GaloisResolvent.isGenerator_iff_forall_resolvent_ne_zero` (characterisation): For abelian G with |Hom(G, E^×)| = |G|, a is a normal basis generator exactly when every resolvent is nonzero.

Unit tests:

- `GaloisResolvent.resolvent_test_trivial` (compatibility): At the trivial character the resolvent is the trace.
- `GaloisResolvent.resolvent_test_base` (non-example): The resolvent of an element of K at a nontrivial character is 0.
- `GaloisResolvent.resolvent_test_quadratic` (computation): In a quadratic extension with σx = −x, the resolvent of 1 + x at the sign character is 2x.

Further acceptance checks:

- For a ∈ K and χ nontrivial, ⟨a | χ⟩ = a·Σ_σ χ(σ⁻¹) = 0.
- For ℚ(i)/ℚ and a = 1 + i: ⟨a | 1⟩ = 2 and ⟨a | sgn⟩ = 2i.

Proof sketch:

1. Define both sums.
2. Equivariance: ⟨τa | χ⟩ = Σ_σ χ(σ⁻¹)στ(a) = Σ_ρ χ(τρ⁻¹)ρ(a) = χ(τ)⟨a | χ⟩; r_G(τa) = τ·r_G(a) likewise.
3. Trivial character: Σ_σ σ(a) = Tr_{L/K}(a) (trace_eq_sum_automorphisms).
4. Normal basis criterion: combine the resolvent–discriminant formula with nonvanishing of the discriminant exactly for bases.

Direct prerequisites: `mathlib:trace_eq_sum_automorphisms`, `mathlib:MonoidAlgebra`, [CA.7/rational-normal-basis-map](#CA-7-rational-normal-basis-map).

Source: [taylor-froehlich-conjecture-1981](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Section 2, (2.2) (printed p. 44). The resolvend Σ_γ a^γ γ^{−1}, the factor of Taylor's representative, is the node's r_G.

Source: [taylor-froehlich-conjecture-1981](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Section 1 (printed p. 43). Evaluating at a character: for abelian χ, Det(r_G(a))(χ) is the resolvent.

Proof or interface frontier: Resolvent and resolvend are two constructions; consumed normal-generator criterion is nonroutine, depends on 308 and must be promoted to avoid hidden API cycles.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-group-determinant-factorisation"></a>

### Dedekind's factorisation of the group determinant

`ClassicalArithmeticCompletion:CA.7/group-determinant-factorisation` · lemma.

Let G be a finite abelian group and E a field such that G has |G| characters with values in E^× (E contains a primitive root of unity of order the exponent of G). For variables (X_g)_{g∈G}, det(X_{gh⁻¹})_{g,h} = Π_{χ} Σ_{g} χ(g) X_g.

Hypotheses and conventions: G finite abelian; E has |G| characters of G.

Further acceptance checks:

- G = ℤ/2: det [[X_0, X_1],[X_1, X_0]] = (X_0 + X_1)(X_0 − X_1).
- G trivial: det(X_e) = X_e.

Proof sketch:

1. For each χ the vector (χ(h))_h is an eigenvector of the group matrix (X_{gh⁻¹}) with eigenvalue Σ_k χ(k⁻¹)X_k, since Σ_h X_{gh⁻¹}χ(h) = χ(g)Σ_k χ(k⁻¹)X_k; as χ runs over the characters so does χ⁻¹.
2. The |G| character vectors are linearly independent (independence of characters), so the group matrix is diagonalisable with these eigenvalues, and its determinant is their product.

Direct prerequisites: `mathlib:linearIndependent_monoidHom`, `mathlib:Matrix.det_vandermonde`.

Source: [conrad-group-determinant-2010](https://math.uconn.edu/~kconrad/articles/groupdet.pdf), Theorem 2 (p. 5). The node over ℂ; the first proof works over any field with a full set of characters, as the source remarks for characteristic p.

Proof or interface frontier: Character eigenvector diagonalisation is valid with full character-cardinality hypothesis; matrix transport supplier is needed.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-discriminant-of-normal-basis-resolvent-formula"></a>

### The discriminant of a normal basis is the product of squared resolvents

`ClassicalArithmeticCompletion:CA.7/discriminant-of-normal-basis-resolvent-formula` · theorem.

Let L/K be a finite abelian extension with group G, E ⊇ L a field with |G| characters of G, and a ∈ L. Then disc_{L/K}(σa)_{σ∈G} = det(Tr_{L/K}(σa·τa))_{σ,τ} = Π_χ ⟨a | χ⟩² in E.

Hypotheses and conventions: L/K finite abelian; E as in the group determinant lemma.

Further acceptance checks:

- ℚ(√5)/ℚ, a = (1 + √5)/2: ⟨a | 1⟩ = 1, ⟨a | sgn⟩ = √5, product of squares 5 = disc(a, a′).
- ℚ(i)/ℚ, a = 1 + i: 4·(2i)² = −16 = disc(1 + i, 1 − i).

Proof sketch:

1. disc(σa) = det(ρσ(a))_{ρ,σ}² (Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two, with the embeddings the automorphisms).
2. det(ρσ(a)) = ±det(ρσ⁻¹(a)) (reindex σ ↦ σ⁻¹), the group determinant at X_g = g(a).
3. Apply the factorisation; Σ_g χ(g)g(a) = ⟨a | χ̄⟩ and χ ↦ χ̄ permutes the characters.

Direct prerequisites: [CA.7/group-determinant-factorisation](#CA-7-group-determinant-factorisation), [CA.7/lagrange-resolvent](#CA-7-lagrange-resolvent), `mathlib:Algebra.discr`, `mathlib:Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two`.

Source: [conrad-group-determinant-2010](https://math.uconn.edu/~kconrad/articles/groupdet.pdf), Section 3 (p. 4). The link between the discriminant of the conjugates and the group determinant.

Source: [ullom-normal-bases-1969](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/CDAF1160D7312AB5A5E2D32BA8B540FF/S0027763000024521a.pdf/normal-bases-in-galois-extensions-of-number-fields.pdf), Proof of Proposition 1.8 (printed p. 157). The same identity used for normal integral bases.

<a id="CA-7-normal-integral-basis-discriminant-criterion"></a>

### The discriminant criterion for a normal integral basis over ℚ

`ClassicalArithmeticCompletion:CA.7/normal-integral-basis-discriminant-criterion` · theorem.

Let K/ℚ be a finite Galois extension and θ ∈ 𝓞_K. Then θ generates a normal integral basis if and only if disc_{K/ℚ}(σθ)_σ = d_K, the discriminant of K. For abelian K this reads Π_χ ⟨θ | χ⟩² = d_K.

Hypotheses and conventions: K/ℚ finite Galois; θ ∈ 𝓞_K.

Further acceptance checks:

- ℚ(√5): θ = (1 + √5)/2 gives 5 = d_K.
- ℚ(i): θ = 1 + i gives −16 = 4·d_K; index 2.

Proof sketch:

1. If the conjugates are linearly dependent both sides differ (the left side is 0, d_K ≠ 0).
2. Otherwise ℤ[G]θ is a sublattice of 𝓞_K of full rank with disc(σθ) = [𝓞_K : ℤ[G]θ]²·d_K (Algebra.discr_of_matrix_mulVec with the integral change-of-basis matrix, NumberField.discr_eq_discr).
3. The index is 1 exactly when the discriminants agree.
4. The abelian form follows from the resolvent formula.

Direct prerequisites: [CA.7/normal-integral-basis](#CA-7-normal-integral-basis), [CA.7/discriminant-of-normal-basis-resolvent-formula](#CA-7-discriminant-of-normal-basis-resolvent-formula), `mathlib:Algebra.discr_of_matrix_mulVec`, `mathlib:NumberField.discr_eq_discr`, `mathlib:NumberField.discr`.

Source: [acciaro-normal-integral-bases-2017](https://arxiv.org/pdf/1704.00359), Section 2 (p. 2). The mathematical contract, with the conventions stated here; the source states it without proof.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Lemma 4.6 and Remark 4.3 (printed pp. 7–8). The index formula of the proof.

Proof or interface frontier: Integral change-of-basis determinant and index-square identity are consumed but absent as supplier nodes.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-locally-free-class-group"></a>

### The locally free class group of an order

`ClassicalArithmeticCompletion:CA.7/locally-free-class-group` · construction.

Let A be a Dedekind domain that is not a field with fraction field K and Λ an A-order in a finite-dimensional semisimple K-algebra (for instance 𝓞_K[G] ⊆ K[G], or ℤ[G] ⊆ ℚ[G]). Let K₀(Λ) be the Grothendieck group of finitely generated projective Λ-modules (Tau Ceti's split K₀, with the ring-level interface of KTheoryLowDegrees Z.1). The locally free class group Cl(Λ) is the subgroup of K₀(Λ) generated by the classes [M] − n[Λ] of the locally free Λ-lattices M of rank n (projective by locally-free-lattice-is-projective). [M] − n[Λ] = 0 exactly when M is stably free: M ⊕ Λ^k ≅ Λ^{n+k}. For Λ = A, Cl(A) is the ideal class group. For an order Λ′ ⊇ Λ (a maximal order), extension of scalars gives Cl(Λ) → Cl(Λ′), whose kernel is the kernel group D(Λ).

Hypotheses and conventions: A Dedekind domain; Λ module-finite over A. K₀ is the split Grothendieck group of finitely generated projective left Λ-modules. A is not a field: height-one-prime completion conditions otherwise become vacuous and do not specify the generic rank. The separate field case must use an actual generic-rank condition, not this predicate.

API:

- `LocallyFree.classGroup` (data): Cl(Λ) ⊆ K₀(Λ), generated by the classes of locally free lattices.
- `LocallyFree.classOf` (constructor): The class [M] − n[Λ] of a locally free lattice of rank n.
- `LocallyFree.classOf_eq_zero_iff` (characterisation): The class vanishes exactly when M ⊕ Λ^k ≅ Λ^{n+k} for some k.
- `LocallyFree.classOf_prod` (simp): The class of a direct sum is the sum of the classes.
- `LocallyFree.classOf_free` (simp): The class of Λ^n is zero.
- `LocallyFree.exists_classOf_eq` (characterisation): Every element is the class of a locally free lattice of rank one.
- `LocallyFree.classGroupMap` (functoriality): Extension of scalars along a morphism of A-orders.
- `LocallyFree.kernelGroup` (data): The kernel group D(Λ) = ker(Cl(Λ) → Cl(Λ′)) for an order Λ′ ⊇ Λ.
- `LocallyFree.classGroupSelfEquiv` (compatibility): Cl(A) ≅ the ideal class group of A.

Unit tests:

- `LocallyFree.classGroup_test_integers` (degenerate): Cl(ℤ) is trivial.
- `LocallyFree.classGroup_test_ideal` (compatibility): The class of a nonzero nonprincipal ideal of A in Cl(A) is nonzero.
- `LocallyFree.classGroup_test_cyclicTwo` (computation): Cl(ℤ[C_2]) is trivial.

Further acceptance checks:

- Cl(ℤ) = 0; Cl(ℤ[√−5]) ≅ ℤ/2.
- Cl(ℤ[C_2]) = 0, although ℤ[C_2] is not a maximal order.

Proof sketch:

1. Define Cl(Λ) as the additive subgroup generated by the classes; the class of a locally free lattice of rank n is [M] − n[Λ].
2. Direct sums: [M ⊕ N] − (n + m)[Λ] is the sum of the two classes (SplitK0 additivity).
3. Stable freeness: equality of classes in K₀ is stable isomorphism (KTheoryLowDegrees Z.1).
4. Every element is the class of a locally free lattice of rank one (Reiner's theorem, locally-free-class-represented-by-rank-one).
5. Λ = A: locally free lattices are the finitely generated projective modules of constant rank, and K₀(A) ≅ ℤ ⊕ Pic(A) (KTheoryLowDegrees Z.4); the rank-zero part is Pic(A) = Cl(A).
6. Extension of scalars along Λ → Λ′ maps locally free lattices to locally free lattices of the same rank (KTheoryLowDegrees Z.1 scalar extension).

Direct prerequisites: [CA.7/locally-free-lattice](#CA-7-locally-free-lattice), [CA.7/locally-free-lattice-is-projective](#CA-7-locally-free-lattice-is-projective), `tauceti:TauCeti.SplitK0`, `tauceti:TauCeti.SplitK0.of`, `tauceti:TauCeti.SplitK0.of_biprod`, `tauceti:TauCeti.finiteProjectiveModules`, `KTheoryLowDegrees:Z.1`, `KTheoryLowDegrees:Z.4/rank-pic-equivalence`, `mathlib:ClassGroup`.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 15.1 (printed pp. 27–28). The node, with Reiner's classes identified with [M] − n[Λ] in K₀.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), Remark 20.7.13 (printed p. 328). The identification of the stable class group with a subgroup of K₀.

Source: [ferri-greither-tame-galois-2019](https://arxiv.org/pdf/1805.12588), Introduction (pp. 2–3). The kernel group.

Proof or interface frontier: Native RingK0 is an unrelated placeholder Type with ad hoc group/class definitions, rather than pinned TauCeti SplitK0. classOf also omits module-finiteness/nonfield requirements needed for projectivity. At least class group, classOf, scalar map, kernel group and equivalence constructions must be split. Removed the executable invented RingK0 type and class map. Preserved the downstream class-group and Froehlich–Taylor signatures as pending typed comments until the real finite-projective owner carrier and projectivity bridge are available.

Revision disposition: The invented RingK0 carrier remains removed. Use the existing finite-projective categorical Grothendieck group; the locally-free-to-projective class map, stable-isomorphism bridge and order scalar extension still need the owner interface. Comments are not elaborated declarations.

<a id="CA-7-locally-free-class-represented-by-rank-one"></a>

### Every locally free class is represented by a locally free ideal

`ClassicalArithmeticCompletion:CA.7/locally-free-class-represented-by-rank-one` · lemma.

Let Λ be an A-order in a finite-dimensional semisimple K-algebra, A a Dedekind domain that is not a field. For locally free Λ-lattices M, M′ of positive total rank there are t ≥ 0 and a locally free Λ-lattice M″ of rank one with M ⊕ M′ ≅ Λ^t ⊕ M″. Hence every element of Cl(Λ) is [M″] − [Λ] for a locally free lattice M″ of rank one.

Hypotheses and conventions: A Dedekind domain with fraction field a global field for the finiteness statements; semisimple ambient algebra. M and Mprime have positive total locally free rank. The displayed decomposition is false for both zero; the zero class is instead represented by Lambda itself. A is not a field: height-one-prime completion conditions otherwise become vacuous and do not specify the generic rank. The separate field case must use an actual generic-rank condition, not this predicate.

Further acceptance checks:

- For Λ = A this is the Steinitz identity I ⊕ J ≅ A ⊕ IJ (KTheoryLowDegrees Z.4).

Proof sketch:

1. Handle the zero class by Lambda. For positive rank n reduce to Lambda^(n-1) plus a rank-one lattice (Reiner Theorem27.4, still an unresolved supplier).
2. Rank one sums: by weak approximation move one locally free ideal to be locally trivial at the primes where the other is not; the sum map to Λ is then locally surjective, hence surjective and split, with locally free kernel (the argument of Voight Proposition 20.7.4 for simple algebras).

Direct prerequisites: [CA.7/locally-free-class-group](#CA-7-locally-free-class-group), [CA.7/locally-free-lattice](#CA-7-locally-free-lattice).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 15.1, (15) (printed p. 28). The node; the source cites Reiner without proof.

Source: [voight-quaternion-2021](https://jvoight.github.io/quat-book.pdf), Proposition 20.7.4 (printed p. 326). The rank-one case for simple B, with proof.

Proof or interface frontier: Johnston (15) cites Reiner, Maximal Orders, Theorem 27.4 (not freely available). Voight Proposition 20.7.4 proves the rank-one statement for orders in simple algebras, by weak approximation and Krull–Schmidt; group algebras of nontrivial groups are not simple. The semisimple case needs the same argument componentwise together with the reduction from rank n to rank one, and its public source is missing.

Proof or interface frontier: Displayed direct-sum rank-one conclusion fails if M=Mprime=0; require positive total rank. Reiner decomposition and weak approximation are unresolved suppliers and cannot be inferred from a quaternion rank-one case.

Revision disposition: Positive total rank is retained, and the statement now repeats the nonfield convention. The zero class is represented by Λ. The general semisimple decomposition and cancellation suppliers remain unresolved.

<a id="CA-7-ring-of-integers-class"></a>

### The Galois module class of the ring of integers

`ClassicalArithmeticCompletion:CA.7/ring-of-integers-class` · construction.

Let L/K be a finite tamely ramified Galois extension of number fields with group G. The Galois module class of L/K is [𝓞_L] = [𝓞_L] − [𝓞_K[G]] ∈ Cl(𝓞_K[G]) (𝓞_L being locally free of rank one by Noether), and its restriction [𝓞_L]_ℤ = [𝓞_L] − [K:ℚ][ℤ[G]] ∈ Cl(ℤ[G]) (𝓞_L locally free of rank [K : ℚ] over ℤ[G]). The class is zero when L/K has a normal integral basis, vanishes exactly when 𝓞_L is stably free, and is killed by the augmentation Cl(𝓞_K[G]) → Cl(𝓞_K).

Hypotheses and conventions: L/K finite Galois and tame.

API:

- `IntegralGaloisModule.ringOfIntegersClass` (constructor): [𝓞_L] ∈ Cl(𝓞_K[G]) for tame L/K.
- `IntegralGaloisModule.ringOfIntegersClassInt` (constructor): [𝓞_L]_ℤ ∈ Cl(ℤ[G]).
- `IntegralGaloisModule.ringOfIntegersClass_eq_zero_of_hasNIB` (relation): A normal integral basis makes the class zero.
- `IntegralGaloisModule.ringOfIntegersClass_eq_zero_iff` (characterisation): The class is zero exactly when 𝓞_L is stably free over 𝓞_K[G].
- `IntegralGaloisModule.classGroupMap_augmentation_ringOfIntegersClass` (relation): The augmentation kills the class.

Unit tests:

- `IntegralGaloisModule.ringOfIntegersClass_test_trivial` (degenerate): For L = K the class is zero.
- `IntegralGaloisModule.ringOfIntegersClass_test_cyclotomic` (computation): For ℚ(ζ_p)/ℚ (p odd) the class is zero.
- `IntegralGaloisModule.ringOfIntegersClass_test_intZero` (compatibility): Over K = ℚ a normal integral basis makes the integral class zero.

Further acceptance checks:

- L = K: zero.
- ℚ(ζ_p)/ℚ: zero (normal integral basis).
- Defined only for tame L/K: for ℚ(i)/ℚ there is no class.

Proof sketch:

1. Define the two classes with classOf applied to locally-free-of-tame and ring-of-integers-locally-free-over-integral-group-ring.
2. Normal integral basis: 𝓞_L ≅ 𝓞_K[G], so the class is zero.
3. Augmentation: 𝓞_K ⊗_{𝓞_K[G]} 𝓞_L is the module of coinvariants of the projective module 𝓞_L. For the free module 𝓞_K[G] the norm map from coinvariants to invariants is the isomorphism 𝓞_K[G]/I_G ≅ 𝓞_K·N (x ↦ ε(x)N), so it is an isomorphism for every direct summand of a free module, in particular for 𝓞_L, whose invariants are 𝓞_K (the same argument as trace-surjective-of-projective); so the image class is [𝓞_K] − [𝓞_K] = 0.

Direct prerequisites: [CA.7/locally-free-class-group](#CA-7-locally-free-class-group), [CA.7/locally-free-of-tame](#CA-7-locally-free-of-tame), [CA.7/ring-of-integers-locally-free-over-integral-group-ring](#CA-7-ring-of-integers-locally-free-over-integral-group-ring), [CA.7/normal-integral-basis](#CA-7-normal-integral-basis), [CA.7/trace-surjective-of-projective](#CA-7-trace-surjective-of-projective).

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 15.1 (printed p. 28). The mathematical contract, with the conventions stated here.

Source: [ferri-greither-tame-galois-2019](https://arxiv.org/pdf/1805.12588), Introduction, McCulloh's theorem (p. 3). The augmentation map; McCulloh's description R(O_K[G]) = Cl^0(O_K[G])^J places realisable classes in its kernel.

Proof or interface frontier: Relative/integral classes and augmentation relation are multiple constructions/facts; proof requires norm from coinvariants to invariants, omitted by node276 native statement.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-froehlich-kernel-group"></a>

### Fröhlich: the Galois module class lies in the kernel group

`ClassicalArithmeticCompletion:CA.7/froehlich-kernel-group` · theorem.

Let M/N be a tame Galois extension of number fields with group Γ, and 𝔐 a maximal order of ℚΓ containing ℤΓ. Then [𝓞_M]_ℤ ∈ D(ℤΓ) = ker(Cl(ℤΓ) → Cl(𝔐)): 𝓞_M becomes stably free over 𝔐.

Hypotheses and conventions: M/N tame Galois; 𝔐 ⊇ ℤΓ maximal.

Further acceptance checks:

- For Γ abelian, Cl(𝔐) is a product of ideal class groups of cyclotomic fields.

Proof sketch:

1. Fröhlich's proof (Appendix of his book, cited by Taylor) is not decomposed here; it runs through Fröhlich's Hom-description of Cl(ℤΓ) and the resolvend of a local normal integral basis generator. See the gap on the Fröhlich–Taylor theorems.

Direct prerequisites: [CA.7/ring-of-integers-class](#CA-7-ring-of-integers-class), [CA.7/maximal-order](#CA-7-maximal-order), [CA.7/locally-free-class-group](#CA-7-locally-free-class-group).

Source: [taylor-froehlich-conjecture-1981](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Section 2 (printed p. 44). The mathematical contract, with the conventions stated here; the proof is in Fröhlich's work, not in the sources read.

Proof or interface frontier: Taylor's Theorem 1 ([𝓞_M] = t(W) in Cl(ℤΓ)) and Fröhlich's membership [𝓞_M] ∈ D(ℤΓ) are stated from Taylor 1981 (read for its statements, pp. 41–45) and Johnston Section 15. Their proofs need Fröhlich's Hom-description of Cl(ℤΓ) (Taylor (2.1)), the Cassou-Noguès–Fröhlich root number class t(W), Galois Gauss sums of Artin characters and Taylor's group logarithm (Taylor Sections 3–12), none of which is planned by any roadmap of the atlas and whose standard reference (Fröhlich, Galois module structure of algebraic integers) is not freely available. A roadmap owning Artin root numbers and Galois Gauss sums would have to supply these before the proofs can be decomposed.

Proof or interface frontier: Native hmax asserts Z[G] itself maximal instead of target order and f has no compatibility with order inclusion, making intended nontrivial cases vacuous. Correct to an overorder Gamma with canonical compatible map. Froehlich Hom-description remains an honest proof gap.

Revision disposition: The maximal order is an overorder of ℤΓ and its scalar map must respect that inclusion. The corrected owner-dependent signature stays commented; Hom-description and root-number suppliers remain unresolved.

<a id="CA-7-taylor-class-of-order-two"></a>

### Taylor's theorem: the Galois module class has order at most two

`ClassicalArithmeticCompletion:CA.7/taylor-class-of-order-two` · theorem.

Let M/N be a tame Galois extension of number fields with group Γ. Then 2·[𝓞_M]_ℤ = 0 in Cl(ℤΓ). (Taylor's Theorem 1: [𝓞_M]_ℤ = t(W), the Cassou-Noguès–Fröhlich root number class, whose values are signs of Artin root numbers of symplectic characters.)

Hypotheses and conventions: M/N tame Galois.

Further acceptance checks:

- For Γ abelian the class is zero (Hilbert–Speiser over ℚ; for general N, Taylor's theorem with no symplectic characters).
- Martinet's quaternion example: for Γ = Q₈ and N = ℚ the class can be nonzero, so "order two" cannot be improved to "zero".

Proof sketch:

1. Taylor's proof (Fröhlich's Hom-description (2.1), the representative u = Det(A)·W′·τ_Γ⁻¹ of the class, Galois Gauss sums and the group logarithm, Sections 2–12 of Taylor 1981) is not decomposed here; see the gap on the Fröhlich–Taylor theorems.

Direct prerequisites: [CA.7/ring-of-integers-class](#CA-7-ring-of-integers-class), [CA.7/locally-free-class-group](#CA-7-locally-free-class-group).

Source: [taylor-froehlich-conjecture-1981](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Theorem 1 (printed p. 41). The node is part (a); the source writes Cl(ℤΓ) multiplicatively.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Theorem 15.3 (printed p. 29). The same statement.

Proof or interface frontier: Taylor's Theorem 1 ([𝓞_M] = t(W) in Cl(ℤΓ)) and Fröhlich's membership [𝓞_M] ∈ D(ℤΓ) are stated from Taylor 1981 (read for its statements, pp. 41–45) and Johnston Section 15. Their proofs need Fröhlich's Hom-description of Cl(ℤΓ) (Taylor (2.1)), the Cassou-Noguès–Fröhlich root number class t(W), Galois Gauss sums of Artin characters and Taylor's group logarithm (Taylor Sections 3–12), none of which is planned by any roadmap of the atlas and whose standard reference (Fröhlich, Galois module structure of algebraic integers) is not freely available. A roadmap owning Artin root numbers and Galois Gauss sums would have to supply these before the proofs can be decomposed.

Proof or interface frontier: Taylor theorem statement verified from scan p41; complete proof and root-number class supplier remain an explicit gap, so not a closed blueprint.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-taylor-no-symplectic-stably-free"></a>

### Taylor: without symplectic characters the ring of integers is stably free

`ClassicalArithmeticCompletion:CA.7/taylor-no-symplectic-stably-free` · theorem.

Let M/N be a tame Galois extension of number fields with group Γ. If Γ has no irreducible symplectic (quaternionic) character, that is no irreducible complex representation carries a nonzero Γ-invariant alternating form (Frobenius–Schur indicator −1), then [𝓞_M]_ℤ = 0: 𝓞_M is stably free over ℤΓ.

Hypotheses and conventions: M/N tame Galois; every irreducible character of Γ has Frobenius–Schur indicator 0 or 1.

Further acceptance checks:

- Abelian, dihedral, symmetric groups and groups of odd order have no symplectic characters.
- Q₈ has one (its two-dimensional representation).

Proof sketch:

1. t(W) is defined from the Artin root numbers of the irreducible symplectic characters only; with none, t(W) = 1 (Taylor Section 2).
2. Apply Taylor's Theorem 1 (see the gap on the Fröhlich–Taylor theorems).
3. The characterisation of symplectic characters by invariant alternating forms is the Frobenius–Schur trichotomy (CharacterTheory Layer 7).

Direct prerequisites: [CA.7/taylor-class-of-order-two](#CA-7-taylor-class-of-order-two), [CA.7/ring-of-integers-class](#CA-7-ring-of-integers-class).

Source: [taylor-froehlich-conjecture-1981](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Theorem 1(b) (printed p. 41). The node is the case with no symplectic characters.

Source: [johnston-galois-modules-2016](https://empslocal.ex.ac.uk/people/staff/hj241/GM_CourseNotes109.pdf), Section 15.4 (printed p. 29). The hypothesis.

Proof or interface frontier: Taylor's Theorem 1 ([𝓞_M] = t(W) in Cl(ℤΓ)) and Fröhlich's membership [𝓞_M] ∈ D(ℤΓ) are stated from Taylor 1981 (read for its statements, pp. 41–45) and Johnston Section 15. Their proofs need Fröhlich's Hom-description of Cl(ℤΓ) (Taylor (2.1)), the Cassou-Noguès–Fröhlich root number class t(W), Galois Gauss sums of Artin characters and Taylor's group logarithm (Taylor Sections 3–12), none of which is planned by any roadmap of the atlas and whose standard reference (Fröhlich, Galois module structure of algebraic integers) is not freely available. A roadmap owning Artin root numbers and Galois Gauss sums would have to supply these before the proofs can be decomposed.

Proof or interface frontier: No-symplectic conclusion requires root-number class computation, not merely two-torsion statement of314. Character theory supplier remains upstream.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

<a id="CA-7-taylor-odd-order-free"></a>

### Taylor: for groups of odd order the ring of integers is free over ℤΓ

`ClassicalArithmeticCompletion:CA.7/taylor-odd-order-free` · theorem.

Let M/N be a tame Galois extension of number fields with group Γ of odd order. Then 𝓞_M is a free ℤΓ-module of rank [N : ℚ].

Hypotheses and conventions: M/N tame Galois; |Γ| odd.

Further acceptance checks:

- Γ cyclic of odd order: consistent with Hilbert–Speiser when N = ℚ.
- The hypothesis "odd order" cannot be dropped: Cougnard's example over Q₃₂ is stably free but not free (quoted by Johnston).

Proof sketch:

1. A group of odd order has no nontrivial real-valued irreducible character (CharacterTheory Layer 7: real characters count real classes, and an odd-order group has only the identity as a real class), hence no symplectic character; so [𝓞_M]_ℤ = 0 (taylor-no-symplectic-stably-free).
2. ℚΓ satisfies the Eichler condition (no totally definite quaternion component), so ℤΓ has locally free cancellation (Jacobinski's cancellation theorem; see the gap).
3. Stably free and locally free of rank [N : ℚ] with cancellation gives free of that rank.

Direct prerequisites: [CA.7/taylor-no-symplectic-stably-free](#CA-7-taylor-no-symplectic-stably-free), [CA.7/ring-of-integers-locally-free-over-integral-group-ring](#CA-7-ring-of-integers-locally-free-over-integral-group-ring).

Source: [taylor-froehlich-conjecture-1981](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0063/LOG_0010.pdf), Corollary and its proof (printed pp. 41–42). The mathematical contract, with the conventions stated here; the rank is [N : ℚ] by local freeness.

Proof or interface frontier: The freeness corollary for groups of odd order passes from stably free to free by Jacobinski's cancellation theorem (an order in a semisimple algebra satisfying the Eichler condition has locally free cancellation; Curtis–Reiner (51.24), cited by Johnston 15.3 and Taylor p. 42). No free source proving it was found (Voight Section 20.7 proves the quaternion case through Eichler's theorem only), and no roadmap of the atlas plans it.

Proof or interface frontier: Odd-order cancellation requires a separate Jacobinski/Eichler supplier; declaration Module.finrank over a noncommutative group ring also needs owner convention verification.

Revision disposition: Retain the exact mathematical obligation in this frontier. Current PROTOCOL §2 and detail.json use target-level granularity: separate Lean declarations may remain within this existing target, with smaller steps in its proof sketch. This does not discharge any missing theorem, carrier, hypothesis or proof supplier.

### Continuation frontier

- The proofs of Fröhlich's kernel-group theorem and Taylor's Theorem 1 (see the gap on the Fröhlich–Taylor theorems): Fröhlich's Hom-description of Cl(ℤΓ), the root number class t(W), Galois Gauss sums and the group logarithm.
- Jacobinski's cancellation theorem under the Eichler condition, needed for the freeness corollary of Taylor's theorem.
- Reiner's Theorem 27.4 for orders in semisimple algebras (every locally free class is represented by a locally free ideal), public only for simple algebras (Voight Proposition 20.7.4).
- Keep rational normal bases separate from integral normal bases and local freeness separate from global freeness. The inherited Fröhlich–Taylor, cancellation and semisimple rank-one class gaps remain. KTheoryLowDegrees is a supplier of K0 infrastructure, not a reason to reconstruct it in CA.7. The existing split proposals are proposals only; accepted RS-03 keeps this stage and its forwarded CN.2 input in place.
- Independent review frontier: 49 existing targets have the mathematical or interface obligations recorded under gaps. Resume those IDs directly; revisionResponse records corrections and checked signatures, without claiming their remaining proofs closed.

## Baseline and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 609 exact declaration references with their statements, module paths and attributed read receipts. The current upstream roadmap and library check is additional duplication evidence; it does not silently change these compilation pins. In particular, general square Smith existence and categorical finite-projective K₀ are imports, while the rectangular algorithm and locally free class-map bridges still require the contracts specified here.

RS-03 keeps this direction and narrows its reciprocity, matrix, number-field and height comparisons. FiniteFieldsAndCharacterSums owns character normalization; ClassFieldTheory and the quadratic-form roadmaps own reciprocity and Hilbert-symbol foundations; LocalFieldsRamification owns local field and ramification carriers; GlobalNumberFields owns commutative orders and Picard comparisons. Logarithmic potential foundations, specialized hedgehog estimates and arithmetic rationality criteria are requested suppliers, not assumed completed plans.

## Source discipline

All mathematical contracts and proof sketches are restated in the roadmap’s notation. Locators identify the theorem, section and page where a source supports a target or supplies an input. The packet preserves 90 attributed source findings and distinguishes confirmed corrections from the inaccessible Hermite source. Source metadata and prior review receipts are historical evidence unless the revision handoff explicitly names a fresh selected read. No source passage is reproduced here.
