# Prismatic cohomology — the δ-ring foundation

**Part PR.0; scope PR.0–PR.7. Partial blueprint.** This specification develops the elementary algebraic δ/Frobenius/Witt dictionary, ordinary localization with the exact image-unit criterion, classical adic completion with the finite-generation uniqueness theorem, localization in a target with p in its Jacobson radical, the canonical operation and initiality of Z_(p), and delta-stabilization with its universal quotient. It does not construct a prism or the prismatic cohomology functor. The seven other accepted integrated nodes remain required, with their identifiers and source corrections retained in the packet's continuation record. The separate log stage PR.8 is outside this issue.

Fix a prime p. In the algebraic prefix below R is a commutative unital ring; the zero ring is allowed. Bhatt–Scholze §2 works with Z_(p)-algebras. The polynomial constructions below are proved at the more general commutative-ring level, and must be instantiated in that p-local category before using the source's prism or completion theorems. This is not an extension of those geometric theorems to arbitrary rings.

The baseline already contains commutative rings and ring homomorphisms, integer polynomials, ideals and their quotients, the central trivial-square-zero extension, and infinite and truncated Witt vectors. Reuse them. In particular, the carrier of length-two Witt vectors is `TruncatedWittVector p 2 R`, with its **Witt** operations. The pair of coordinates is not the pointwise product ring.

Names below lie in `TauCeti.Delta`. They are proposed library names, not claims of implementation. The suggested file gives their actual-carrier signatures, API lemmas and tests, and elaborates at the pinned baseline with proof placeholders. This checks the signatures, not the proofs.

## 1. The integral addition correction

Node: `PR.0/delta-addition-correction`.

Define

    C_p(x,y) = - sum_(1 <= i <= p-1) (binomial(p,i)/p) x^i y^(p-i).

Every displayed coefficient is an integer: `Nat.Prime.dvd_choose_self` supplies the divisibility for the internal binomial coefficients. The implementation first forms the natural quotient and casts it into R. It never tries to divide by p in R. This distinction is essential over F_p and over a ring with nonzero p-torsion.

The API consists of `addCorrection_map`, saying that every ring homomorphism carries this evaluation to the evaluation on its images; `addCorrection_zero`, giving C_p(x,0)=0; and `addCorrection_symm`, interchanging the two inputs. These statements follow from the finite integer polynomial. Symmetry uses the involution i↦p−i on the internal indices.

The tests are `correction_dyadic`, C_2(x,y)=−xy; `correction_cubic`, C_3(x,y)=−xy(x+y); and `correction_zero_argument`, C_p(x,0)=0. The dyadic test fixes the minus sign, and the cubic test rejects the accidental use of only one mixed monomial.

### The cleared-denominator identity

Node: `PR.0/correction-identity`.

For every R,

    p C_p(x,y) = x^p + y^p - (x+y)^p.

Multiply the finite sum by p, use the divisibility of each integer coefficient, and apply the existing binomial theorem, separating its two endpoint terms. This proves a polynomial identity and then evaluates it in R. It does not cancel p in R.

In characteristic p this identity has a zero left side. It therefore cannot *define* C_p there. The explicit integral polynomial is the data that survives reduction; the cleared identity is a theorem about it.

## 2. δ-structures and their elementary API

Node: `PR.0/delta-frobenius-dictionary`, retaining the original integrated identifier.

A `Structure p R` is a function δ:R→R with

    δ(0)=0,  δ(1)=0,
    δ(x+y)=δ(x)+δ(y)+C_p(x,y),
    δ(xy)=x^p δ(y)+y^p δ(x)+p δ(x)δ(y).

These are the actual axioms; a field saying that an unspecified equivalence exists is not a construction. A morphism is an existing unital ring homomorphism f satisfying f(δ_R(x))=δ_S(f(x)) for every x. A separate ring or ideal carrier is unnecessary. General categorical packaging, free objects and the Witt adjunction remain construction work beyond the elementary dictionary.

The API has `Structure.ext`, equality by equality of δ; `Structure.delta_neg`, obtained from the addition law at x and −x; and `Structure.delta_two`, obtained at 1 and 1. Explicitly,

    δ(-x) = -δ(x)-C_p(x,-x),
    δ(1+1) = C_p(1,1).

The tests `delta_two_forced` and `delta_zero_operation_rejected` assert, respectively, that every 2-δ-structure on Z sends 2 to −1 and that the zero function is therefore not such a structure. The test `delta_zero_ring` permits the zero ring. Rejecting it by an unnecessary nontriviality premise would change the category.

The original integrated node grouped the definition, the ordinary Frobenius comparison and the Witt-section comparison. They are now declaration-sized objects and constructions with separate proofs. Its definition ID is preserved, while the comparison nodes below carry the actual inverse maps.

This object is not a prism. No effective Cartier ideal, derived completeness, distinguished element or condition on p and the ideal has been supplied. In particular none of the examples of δ-structures below is silently declared a prismatic example.

## 3. Ordinary Frobenius lifts

Node: `PR.0/ordinary-frobenius-lift`.

An ordinary `FrobeniusLift p R` is a unital ring endomorphism φ:R→R with

    for every x, there exists y with φ(x)=x^p+p y.

The subtype retains the ring homomorphism and its congruence property. It does not choose the y-values as a function and does not assert that arbitrary choices satisfy the δ-identities. Quotienting by the ideal (p) identifies the condition with the statement that reduction of φ is Frobenius.

The API `FrobeniusLift.ext` reduces equality to equality of ring endomorphisms. `FrobeniusLift.mod_p` gives the quotient equality, and `FrobeniusLift.congruence_iff` proves the converse by the kernel description of the quotient. The tests are `lift_on_integers` for the identity map on Z, `lift_in_characteristic_p` for the identity on F_p, and `power_not_ring_map`, rejecting the function x↦x² on Z as a ring endomorphism. Its failure already appears at 1+1.

A lift on F_p exists even though a δ-structure on that nonzero ring does not. Thus ordinary Frobenius congruence is not a torsion-safe replacement for δ-data. The source's *derived* Frobenius-homotopy description requires its animated constructions and is not asserted by this subtype.

### Constructing the associated lift

Node: `PR.0/associated-frobenius`.

Given δ, define

    φ_δ(x)=x^p+p δ(x).

The zero and unit identities follow from δ(0)=δ(1)=0. The addition law follows by substituting the δ-addition formula and then the cleared-denominator correction identity. For multiplication, the right side of the δ-product identity is exactly the correction needed to expand

    (x^p+p δ(x))(y^p+p δ(y)).

This constructs the ring endomorphism. Its congruence witness at x is δ(x), so it is an ordinary lift. The proof works with arbitrary p-torsion.

The API `toFrobenius_apply` gives the formula; `toFrobenius_rank_one` says that δ(x)=0 implies φ(x)=x^p; and `toFrobenius_map` transports δ-compatible morphisms to Frobenius-compatible ones. The tests `phi_rank_one`, `phi_integer_two` and `phi_zero_ring` check these on a rank-one element, the canonical integer operation at 2, and the zero ring. The converse to the rank-one statement is not included without cancellation.

### Reconstruction with precisely the needed hypothesis

Node: `PR.0/torsionfree-frobenius-equivalence`.

Assume that multiplication by p on R is injective. For an ordinary lift φ, the congruence gives a solution to

    p δ(x)=φ(x)-x^p.

The solution is unique. Choose it pointwise, then establish the axioms by multiplying each proposed identity by p. For the addition axiom, the difference after multiplication is

    φ(x+y)-φ(x)-φ(y),

after applying the correction identity. For the product axiom, the difference after multiplication is

    φ(xy)-φ(x)φ(y).

Both are zero. Injectivity of multiplication by p now proves the required identities. This is the only cancellation in the reconstruction, and its hypothesis is explicit.

The two composite maps are identities. Starting with δ, the reconstructed value solves the same equation and hence is the same value. Starting with φ, its reconstructed δ satisfies the defining equation, so x^p+pδ(x)=φ(x). Extensionality of the structures and of ring maps gives the equivalence.

Its API is `frobeniusEquiv_apply`, identifying the forward map; `frobeniusEquiv_symm_spec`, specifying its inverse by the multiplication equation; and `frobeniusEquiv_symm_toFrobenius`, recording the inverse identity on a δ-structure. The tests `reconstruction_integer_value`, `reconstruction_rejects_characteristic_p` and `reconstruction_zero_ring` compute the inverse at 2 in Z, reject the cancellation hypothesis on F_p, and admit it on the zero ring.

Characteristic zero by itself is not the required hypothesis. The map Z→R can be injective while another element of R is annihilated by p. Section 6 constructs just such a ring and distinguishes δ-structures on it with the same ordinary lift.

### Morphism reflection

Node: `PR.0/frobenius-morphism-reflection`.

Let f:R→S be a ring map between δ-rings. If multiplication by p is injective on **S**, then f is δ-compatible exactly when it is Frobenius-compatible. Only the target needs the hypothesis.

For the nontrivial direction, expand Frobenius compatibility and cancel the identical terms f(x)^p. The result is

    p f(δ_R(x)) = p δ_S(f(x)).

Cancel p in S. The other direction is direct substitution. Without this target hypothesis the identity map between two structures in Section 6 is a counterexample.

## 4. Integer scalars and quotient rings

### The canonical integer operation

Node: `PR.0/integer-delta`.

For a∈Z, let D_p(a)=(a−a^p)/p, with integer division. Reducing a modulo p and applying `FiniteField.pow_card` shows that the numerator is divisible by p, including for negative a. The identity map on Z is therefore an ordinary lift. Multiplication by the nonzero integer p is injective, so the reconstruction gives this δ-operation and its associated Frobenius is the identity.

The API `intDelta_apply` identifies the quotient formula; `intDelta_frobenius` identifies the endomorphism; and `intDelta_prime` computes

    D_p(p)=1-p^(p-1).

Tests `integer_negative_dyadic`, `integer_cubic_value` and `integer_zero` give D_2(−1)=−1, D_3(2)=−2 and D_p(0)=0. In particular the negative scalar at p=2 is not assigned the odd-prime value zero.

### Integer casts into a ring with torsion

Node: `PR.0/integer-cast-delta`.

For every δ-ring R and every integer a, δ(a·1_R) is the cast of D_p(a). This result does **not** follow by cancellation of p in R.

First verify over Z that

    D_p(n+1)=D_p(n)+C_p(n,1).

Multiplying by p proves it by the correction identity, and cancellation is valid in Z. The same recurrence for δ(n·1_R) follows directly from its addition axiom. Start at zero, induct upwards for nonnegative integers, and run the recurrence backwards for negative integers. Naturality of the fixed correction polynomial identifies the two recurrences. Only additive cancellation is used in R.

At a=p this gives δ(p)=1−p^(p−1). If p=0 in R, the left side is δ(0)=0 and the right side is 1, since p≥2. Thus a nonzero ring of characteristic p has no δ-structure. This says nothing against a mixed-characteristic ring having a nonzero p-torsion ideal.

### δ-stable quotients

Node: `PR.0/delta-stable-quotient`.

An ideal I is δ-stable when δ(i)∈I for every i∈I. This condition is necessary and sufficient for the quotient map R→R/I to carry the given operation to a unique δ-structure on the quotient.

To construct it, choose a representative a of a residue class and use the class of δ(a). Changing a to a+i changes the value by

    δ(i)+C_p(a,i).

The first term is in I by stability. Every monomial of the second has a positive power of i, so it is in I as well. This proves independence of representatives. All four polynomial axioms descend through the quotient, and surjectivity gives uniqueness. Conversely, compatibility with the quotient at i∈I puts δ(i) in its kernel.

The ideals zero and R give the identity and zero-ring tests. Frobenius stability is not enough: in Z with its canonical structure the ideal (p) is stable under φ=id, but δ(p)=1−p^(p−1) does not lie in (p). Thus ordinary Frobenius descends to F_p while the δ-operation does not.

## 5. The torsion-safe Witt dictionary

Nodes: `PR.0/witt2-add-coordinate`, `PR.0/witt2-mul-coordinate` and `PR.0/delta-witt-section-equivalence`.

Write a length-two Witt vector in coordinates (a,b). On the actual pinned Witt ring the laws are

    (a,b)+(c,d) = (a+c, b+d+C_p(a,c)),
    (a,b)(c,d) = (ac, a^p d+c^p b+pbd).

The zeroth-coordinate laws follow from the existing `WittVector.constantCoeff` ring homomorphism and truncation. The second-coordinate formulas require a torsion-safe proof; one cannot simply cancel p in the target ring.

Work first over P=Z[A,B,C,D]. The zeroth and first ghost polynomials are X_0 and X_0^p+pX_1, as computed by the pinned `wittPolynomial_zero` and `wittPolynomial_one`. The existing ghost components are ring homomorphisms. For addition, compare the sum of the first ghost coordinates with the first ghost coordinate of the sum, subtract the zeroth-coordinate pth power, and use the correction identity. For multiplication, expand

    (A^p+pB)(C^p+pD)-(AC)^p.

In each case p can be cancelled in P because P is an integer polynomial domain. This proves the universal second-coordinate formula.

Now map the variables to the four actual coordinates in R. `WittVector.map_coeff` makes this evaluation compatible with the ring operations. `WittVector.truncate` is a surjective ring homomorphism preserving the first two coordinates, so the formulas hold for all truncated vectors over R. A zero-padding map may select an infinite lift of a truncated vector, but it is **not** asserted to be a ring map. Likewise no injectivity of ghost coordinates over R is used.

For example, in W_2(F_2), the vectors (1,0) and (1,0) add to (0,1), not to zero. This rejects pointwise ring operations. The pbd term in the multiplication formula remains present before a characteristic-p specialization.

A δ-structure now gives a ring map

    s_δ:R -> W_2(R),   x -> (x,δ(x)),

whose first coordinate is x. Addition and multiplication are precisely the δ-axioms in the displayed coordinate formulas. Zero and one have coordinates (0,0) and (1,0). Conversely, the second coordinate of such a ring-map section satisfies those axioms. Coefficient extensionality proves that the constructions are inverse.

The API `wittSectionEquiv_apply` gives both coordinates of the constructed section; `wittSectionEquiv_symm_apply` recovers δ from coordinate one; and `wittSectionEquiv_ghost_one` identifies x^p+pδ(x) with associated Frobenius. Tests `witt_section_recovers_delta`, `witt_no_section_in_characteristic_p` and `witt_sections_distinguished_despite_ghost` respectively recover δ exactly, rule out a section for F_p, and separate the structures of Section 6 even when their ghost-one composites coincide.

This is a section of the **first Witt coordinate**, not a section of the ghost map. In particular, torsion does not invalidate this dictionary. It only invalidates the reduction of its data to an ordinary Frobenius lift.

## 6. An explicit square-zero family

Nodes: `PR.0/square-zero-correction`, `PR.0/square-zero-delta-family` and `PR.0/frobenius-forgetful-not-injective`.

Let B be a δ-ring with a unital ring map B→F_p. Use that map for the scalar action, with the corresponding central opposite action. On the existing `TrivSqZeroExt B (ZMod p)` the multiplication is

    (a,b)(c,d)=(ac, abar*d+cbar*b).

The ring itself is baseline material. For λ∈F_p, define a new operation on it by

    δ_λ(a,b)=(δ_B(a),(λ-abar^(p-1))*b).

We verify all the axioms; agreement of the associated Frobenius maps alone would not verify them.

### The correction term

The pinned square-zero power formula gives

    (a,b)^n=(a^n,n*abar^(n-1)*b).

At n=p its second coordinate is zero. The second coordinate of an integer polynomial evaluated on two square-zero inputs is its formal first-order expansion. For C_p the relevant identities are

    partial_X C_p = X^(p-1)-(X+Y)^(p-1),
    partial_Y C_p = Y^(p-1)-(X+Y)^(p-1).

They follow by differentiating the **integer polynomial identity** for pC_p and cancelling p in Z[X,Y]. Equivalently, check the finite monomials and their integer coefficients term by term. Only then evaluate the identities in F_p. Thus the second coordinate of C_p((a,b),(c,d)) is

    (abar^(p-1)-(abar+cbar)^(p-1))*b
      +(cbar^(p-1)-(abar+cbar)^(p-1))*d.

This is not division by p in a square-zero ideal. At p=2 it gives −cbar*b−abar*d, exactly the second coordinate of −xy.

### The axioms and the common Frobenius

The first coordinates of the δ-axioms are those of δ_B. For addition, substitute the correction just computed. The second coordinate simplifies to

    (λ-(abar+cbar)^(p-1))*(b+d),

as required. For multiplication, the pth powers have second coordinate zero and the pδ(x)δ(y) term also has second coordinate zero. The remaining expression equals

    (λ-(abar*cbar)^(p-1))*(abar*d+cbar*b),

because every element of F_p satisfies u^p=u. This proves the product axiom. Zero and unit follow directly. These arguments include p=2.

The associated Frobenius is

    φ_λ(a,b)=(φ_B(a),0),

independent of λ. The API `squareZeroDelta_fst` and `squareZeroDelta_snd` gives the two defining coordinates; `squareZeroDelta_frobenius` records this common endomorphism.

The tests use B=Z and ε=(0,1). `square_zero_parameter` gives δ_λ(ε)=λε. `square_zero_addition_correction` gives δ_λ(1+ε)=(λ−1)ε; a formula omitting the correction fails this test. `square_zero_base_compatibility` compares the restriction along the existing inclusion of Z with its canonical δ-operation.

If λ≠μ, evaluation at ε and injectivity of the existing square-zero inclusion show that δ_λ≠δ_μ, while φ_λ=φ_μ. This proves that the ordinary Frobenius data can forget information. For λ=1, φ_λ(ε)=ε^p=0 but δ_λ(ε)=ε≠0, also rejecting the rank-one converse.

For B=Z, the explicit formula is

    δ_λ(a,b)=((a-a^p)/p,(λ-(a mod p)^(p-1))*b).

This ring has characteristic zero and a nonzero ideal killed by p. It therefore also shows why `CharZero` is not the cancellation hypothesis in the reconstruction theorem.

There is an example in the source's p-local category as well. Take B=Z_(p), its residue map to F_p, and δ_B(a)=(a−a^p)/p. This quotient lies in Z_(p): reduction modulo p is Frobenius on F_p, so the numerator lies in pZ_(p). Multiplication by p is injective, and the already-proved reconstruction verifies the base δ-axioms. The general square-zero construction applies unchanged. The integer tests use exact integer division for ease of verification; they do not pretend that Z itself is p-local.

The family is an authored acceptance calculation from the stated axioms. It is not claimed to be an example printed in Bhatt–Scholze, and no error in their torsion-free hypothesis is alleged.

## 7. Localization of delta structures

This is an ordinary ring-localization theorem. It neither constructs an adic completion nor asserts that a localization of a prism remains a prism. Let A be a delta ring, S a submonoid of A, and B an A-algebra carrying the existing `IsLocalization S B` instance. Write i:A -> B for its algebra map and phi for the associated Frobenius of A. Neither i nor multiplication by p is assumed injective.

The exact condition is

    i(phi(s)) is a unit in B for every s in S.                     (L)

The elements i(s) are already units by the localization property. Condition (L) is additional; it is not the assertion that phi(s) equals s^p. It is also weaker than literal stability phi(S) contained in S. The pinned `IsLocalization.algebraMap_isUnit_iff` identifies (L) with the condition that each phi(s) divides some element of S, including when A has zero divisors.

### The length-two coefficient map

Nodes: `PR.0/correction-map-naturality`, `PR.0/witt2-coefficient-map` and `PR.0/witt2-coefficient-map-coeff`.

Promote the existing `addCorrection_map` API to a lemma node: ring maps commute with the evaluation of the fixed integer correction polynomial. For f:R -> T, construct `witt2Map f` on the existing truncated Witt ring by applying f to its two coordinates. The addition formula follows from this polynomial naturality, and the multiplication formula follows by applying f to the three terms of the second-coordinate product. The first-coordinate, zero and unit formulas are checked using the existing infinite Witt maps and surjective truncation. This is a length-two adapter, not a second Witt carrier or a new construction of all truncated Witt rings.

Its API is `witt2Map_coeff`, `witt2Map_id` and `witt2Map_comp`. The coefficient formula is a separate lemma node because the localization proof uses it. Identity and composition follow coordinatewise. The three tests are `witt2_map_identity`, `witt2_map_torsion_coordinate`, and `witt2_map_zero_target`. In the second, reducing the vector (0,1) from W_2(Z) to W_2(F_2) retains second coordinate 1 even though its first two ghost coordinates in the target vanish. Thus ghost coordinates cannot replace Witt coordinates in this adapter.

### Exactly which Witt vectors are units

Node: `PR.0/witt2-unit-criterion`.

For z=(a,b) in W_2(R),

    z is a unit  iff  a and a^p+p*b are units in R.                (W)

There is no hypothesis placing p in the Jacobson radical. To prove necessity, multiply z by a Witt inverse (c,d). The zeroth-coordinate equation gives ac=1. Expanding the first ghost expression of the product gives

    (a^p+p*b)(c^p+p*d)=1.

This is a polynomial calculation, not an application of ghost injectivity.

For sufficiency put g=a^p+p*b, choose the inverses of the two units a and g, and take the vector

    (a^(-1), -b*a^(-p)*g^(-1)).

The second coordinate of its product with z is

    (a^p+p*b)*(-b*a^(-p)*g^(-1)) + a^(-p)*b = 0.

The first coordinate is 1. Commutativity supplies the other inverse identity. Only a and g were inverted; p was not.

The first coordinate being a unit is insufficient in general. At p=2 over Z, the vector (1,1) has first ghost expression 3 and is not a unit. Over F_p the two conditions reduce to invertibility of a. The zero ring is also allowed: there 0=1 and its unique Witt vector is a unit. These tests prevent an implicit nontriviality assumption or a characteristic-p unit criterion from being used over an arbitrary base.

### Construction of the localized operation

Nodes: `PR.0/witt-section-coordinates`, `PR.0/delta-localization`, and `PR.0/localized-delta-on-base`.

The first of these promotes the existing `wittSectionEquiv_apply` API to a lemma node. Its content is the actual coordinate formula for the section s_A(a)=(a,delta_A(a)); no new section is postulated.

Compose that section with `witt2Map i` to obtain

    j:A -> W_2(B),     a |-> (i(a),i(delta_A(a))).

For s in S its first coordinate i(s) is a unit, and its first ghost expression is i(phi(s)), a unit by (L). Criterion (W) therefore makes j(s) a unit. The **existing** `IsLocalization.lift` extends j to a ring map

    s_B:B -> W_2(B).

The zeroth-coordinate projection is a ring map: this follows from `WittVector.constantCoeff`, surjective truncation and the unchanged-coordinate formula. Its composite with s_B agrees with the identity on i(A). Apply the existing localization ring-homomorphism extensionality lemma to conclude that this composite is the identity on all of B. Thus s_B is a genuine first-coordinate section. Apply the preceding Witt-section equivalence to obtain the localized delta structure.

This construction never chooses fraction representatives to define delta. Consequently no unproved representative-independence or cancellation in A is hidden in the definition. Compatibility with i follows from `IsLocalization.lift_eq` and the second section coordinate.

The public construction is `localize`. Its API `localize_algebraMap` states delta_B(i(a))=i(delta_A(a)); `localize_unique` identifies it with every compatible structure; `localize_fraction` computes its values by the equation below. All three API items have their own lemma nodes. Changing a proof of (L) changes none of the resulting operation.

There are four tests. `delta_localization_identity` recovers the original operation when B=A. `delta_localization_zero` allows a zero localization. `delta_localization_rational_value` computes delta_2(1/3)=1/9 for the canonical integer delta structure localized in Q. `delta_localization_torsion_survives` uses the square-zero example below and asserts both that epsilon survives and that its delta is still epsilon. In particular the construction cannot silently replace a ring by its p-torsionfree quotient.

### Uniqueness and the necessary-and-sufficient criterion

Nodes: `PR.0/delta-localization-unique` and `PR.0/delta-localization-criterion`.

Two delta structures on B compatible with A give two ring-map sections into W_2(B). Their first coordinates agree on A by the section condition, and their second coordinates agree by compatibility with delta_A. Coordinate extensionality gives equality on A, and `IsLocalization.ringHom_ext` gives equality on B. Their second coordinates, and therefore the delta structures, coincide. This does not use p-torsionfreeness and does not pretend that equality of their associated Frobenius maps is sufficient.

Conversely, suppose a compatible delta structure on B exists. Expanding the associated Frobenius formula shows that i commutes with Frobenius. Since its Frobenius is a unital ring endomorphism, it carries the unit i(s) to the unit i(phi(s)). Thus (L) is necessary. Together with the construction and uniqueness this proves

    a unique compatible delta structure on B exists iff (L).

This is an explicit strengthening of the sufficient hypothesis in Bhatt--Scholze Lemma 2.15, proved using their Witt-section dictionary. Their printed proof uses a free delta-ring presentation and reduction to the torsionfree case; the construction here is an alternative proof, not a claim that those source prerequisites have already been formalized.

### The universal property on morphisms

Node: `PR.0/delta-localization-universal`.

Let C be another delta ring, and let f:A -> C commute with delta and carry S into units. The underlying ring map g:B -> C is the existing localization lift. To prove delta compatibility, compare the ring maps

    witt2Map(g) composed with s_B,     s_C composed with g

from B to W_2(C). Their restrictions to A agree in both coordinates by the two base-compatibility hypotheses. Localization extensionality gives equality, and coordinate one gives g(delta_B(x))=delta_C(g(x)). Uniqueness is the underlying ring-localization uniqueness.

This proves the initial property without assuming the target C has no p-torsion. Identity, composition and transport to another model of the same localization follow by uniqueness; an implementation uses the existing localization maps and algebra equivalences, rather than a parallel delta-localization ring carrier.

### The fraction formula and its invertible denominator

Node: `PR.0/delta-localization-fraction`.

For a in A and s in S put z=mk'(a,s). The formula is stated in an arbitrary commutative B, without requiring a total inverse operation on B:

    i(s)^p * i(phi(s)) * delta_B(z)
      = i(s)^p * i(delta_A(a)) - i(a)^p * i(delta_A(s)).           (F)

Its left coefficient is a unit. Thus (F) determines delta_B(z) uniquely; it can equivalently be written using the inverses of those specified units. The numerator also equals i(phi(s))*i(delta_A(a))-i(phi(a))*i(delta_A(s)), since the two mixed p-terms cancel.

For the proof use the actual identity i(s)*z=i(a) from `IsLocalization.mk'_spec'`. Applying the product axiom and base compatibility gives

    i(delta_A(a)) = i(phi(s))*delta_B(z) + z^p*i(delta_A(s)).

Multiply by i(s)^p and use (i(s)*z)^p=i(a)^p. No cancellation of p occurs. In particular the inverse formula has denominator s^p*phi(s), not s^(2p) in general. The latter would be valid only after imposing additional conditions on the particular denominator.

### Recovering the source localization lemma

Node: `PR.0/delta-localization-phi-stable`.

If phi(S) is contained in S, every i(phi(s)) is a unit by `IsLocalization.map_units`. The criterion gives existence and uniqueness, and the preceding morphism theorem gives the full initial property of Bhatt--Scholze Lemma 2.15. This specializes a constructed theorem; it does not assume the source localization assertion as a field of a structure.

Section 9 supplies the Jacobson-target unit argument. Constructing the universal radical localization and its completed variant in Remark 2.16 remains separate work. Localizing an arbitrary ring does not automatically preserve a hypothesis that p belongs to its Jacobson radical, and the argument above does not replace classical or derived completion by ordinary localization.

### Two tests of the denominator hypothesis

For failure, take A=Z_(p)[X] with the Frobenius lift fixing coefficients and sending X to X^p+p. It lifts Frobenius modulo p, and A is p-torsionfree, so the reconstruction supplies a delta structure with delta(X)=1. In B=A[X^(-1)], the element X^p+p is not a unit. Indeed a Laurent polynomial unit over a domain has only one nonzero degree: in a product, the highest and lowest nonzero degrees add, so a product equal to 1 forces both widths to be zero. The two nonzero terms of X^p+p have different degrees. There is therefore **no** compatible delta structure on B. Naming the fraction delta(X^(-1)) does not make it an element of B. In the field of rational functions its value is -1/(X^p*(X^p+p)), displaying the missing denominator.

For success without literal stability, take p=2, A=Z plus F_2*epsilon with epsilon^2=2*epsilon=0, delta=delta_1 from Section 6, and s=(3,1). Its Frobenius is phi(s)=(3,0), which is not a power of s: comparing integer coordinates forces exponent one, whose second coordinate is different. Nevertheless s^2=(9,0), so phi(s) divides s^2. Criterion (L) holds in the localization at powers of s. Its ring is identified with Z[1/3] plus F_2*epsilon: s is invertible there, and in the localization the nilpotent difference s-3*1 shows that 3 also becomes invertible. The two ordinary universal properties give inverse maps. Epsilon remains nonzero and delta(epsilon)=epsilon. The operation therefore both exists and retains its torsion information even though literal phi-stability fails.

## 8. Classical adic completion and the loss of one power

This section supplies the classical completion argument of Bhatt–Scholze Lemma 2.17 on the existing Mathlib completion. It does not construct derived completion or prove Lemma 2.18. Fix a commutative delta ring A and an ideal I containing the image of p. Write

    B = AdicCompletion I A,      rho_n : B -> A/I^n

for the existing inverse-limit ring and its normalized algebra evaluations. The canonical algebra map is i:A -> B. Neither A being separated nor i being injective is a standing assumption.

There are two distinct levels of generality. The ideal-power estimate and canonical delta operation on this inverse-limit ring require no finite generation. To identify its quotient-kernel topology with the topology defined by powers of the extended ideal, and to prove uniqueness among **all** compatible delta structures, this section uses the finitely generated hypothesis in the source and in the pinned completeness theorem. These claims are not interchanged.

### The correction in an ideal

Node: `PR.0/delta-adic-correction`.

For every ideal J, every x and every y in J,

    C_p(x,y) belongs to J.

Every monomial of the fixed integral correction contains a positive power of y. Ideal closure under multiplication, finite sums and negation gives the statement. This is independent of whether p belongs to J. It promotes the elementary membership input used in the addition steps below; it does not assume delta is additive.

### A uniform and sharp power estimate

Node: `PR.0/delta-adic-power-loss`.

For every n >= 0,

    delta(I^(n+1)) is contained in I^n.                            (P)

For n=0 the target is the whole ring. Suppose the result holds for n. Write I^(n+2)=I^(n+1)*I and apply the existing dependent product-membership induction. For a in I^(n+1) and b in I, the product formula gives

    delta(ab) = a^p delta(b) + b^p delta(a) + p delta(a)delta(b).

The three terms lie in I^(p(n+1)), I^(p+n), and I^(n+1), respectively. They therefore all lie in I^(n+1), using p>=2. The third containment is precisely where p in I is used. In the addition step, retain the fact that the two summands lie in I^(n+2). Their correction lies in that same ideal by delta-adic-correction, so adding the two already-controlled delta values stays in I^(n+1). This proves (P) for arbitrary elements of the product ideal, not just for pure products or for chosen generators.

No finite generating family of I is used in this induction. The estimate is also sharp. For the canonical delta on Z and I=(p),

    delta(p^(n+1)) = p^n * (1 - p^((n+1)(p-1))).

The parenthesized factor is 1 modulo p. Thus the result has exactly p-adic order n, and an unqualified same-power estimate is false.

The hypothesis p in I is substantive. On Z_(p)[X], use the Frobenius lift fixing coefficients and sending X to X^p+p. The ring is p-torsionfree, so the previously constructed equivalence gives a delta structure with delta(X)=1. For every m>=1, the polynomial

    delta(X^m) = ((X^p+p)^m - X^(pm))/p

has nonzero constant coefficient p^(m-1). It is therefore not in (X), regardless of m. The map is not (X)-adically continuous. This is a counterexample to dropping the ideal hypothesis, not to the source lemma.

### The congruence estimate

Node: `PR.0/delta-adic-congruence`.

If x-y belongs to I^(n+1), then

    delta(x)-delta(y) belongs to I^n.                             (C)

Put h=x-y and apply the addition formula at y+h. The difference is delta(h)+C_p(y,h). The first term is in I^n by (P), and the second is in I^(n+1), hence I^n. The bound is independent of y, so it gives uniform ideal-adic continuity with modulus n+1.

The source proves continuity by a coarser sequence of powers. The explicit one-step bound here is a refinement obtained by the product induction above, not a correction to its proof. At p=2, the scalars 0 and 2 have the same class modulo 2 while their deltas have distinct classes modulo 2. One extra precision is genuinely needed.

### Functions between different quotient levels

Nodes: `PR.0/delta-shifted-quotient`, `PR.0/delta-shifted-quotient-mk`, and `PR.0/delta-shifted-quotient-transition`.

Define a **function**

    q_n : A/I^(n+1) -> A/I^n,       [a] |-> [delta(a)].

Estimate (C) proves independence of representatives. This is neither a ring homomorphism nor an additive map, and it does not equip either quotient with a delta structure. In particular it avoids the impossible construction of a delta-ring structure on a nonzero Z/p^r.

The API is `shiftedQuotient_mk`, the defining formula; `shiftedQuotient_transition`, compatibility with the existing `Ideal.Quotient.factorPow` maps; and `shiftedQuotient_zero`, the value at zero. The first two are separate lemma nodes because the completion construction depends on them.

For m<=n, the transition formula is

    factor_(n,m) composed with q_n
      = q_m composed with factor_(n+1,m+1).

Choose a representative in A of an input modulo I^(n+1). Both sides give the class of its delta modulo I^m. Quotient induction proves the formula; no linearity of q_n is used. The level n=0 has target A/I^0=0 and is included.

The three tests are `shifted_quotient_dyadic`, which computes q_1(2 mod 4)=-1 mod 2; `shifted_quotient_not_additive`, which compares q_1(1+1) with q_1(1)+q_1(1) at p=2; and `shifted_quotient_zero_level`, which checks the zero target at n=0. In particular a prototype using a linear-map or ring-map arrow for q_n must be rejected even if its representative formula looks correct.

### Constructing delta on the actual completion

Node: `PR.0/delta-classical-completion`.

The desired operation D on B is prescribed by

    rho_n(D(x)) = q_n(rho_(n+1)(x)).                              (D)

Here rho_n is Mathlib's `AdicCompletion.evalₐ`, whose codomain is A/I^n. The underlying definition of `AdicCompletion` uses module quotients by I^n times the top submodule. The normalized evaluation includes the existing quotient isomorphism between those presentations. The implementation must use that comparison, not identify differently typed quotients by assertion.

For a direct construction using the supplied carrier, choose a_n in A representing rho_(n+1)(x). Coherence of x gives a_m-a_n in I^(m+1) whenever m<=n. Estimate (C) makes delta(a_n) an I-adic Cauchy sequence with precisely the indexing used by the existing `AdicCompletion.AdicCauchySequence` carrier. Feed it to `AdicCompletion.mk`. Its normalized nth evaluation is [delta(a_n)] modulo I^n, by the existing `evalₐ_mk` formula, which is exactly (D).

The shifted-quotient transition identity verifies compatibility of these output coordinates. Different choices of a_n yield the same coordinates and hence the same element by `ext_evalₐ`. Thus the operation is independent of all representative choices. No nonlinear map is passed to the existing **linear** or **ring-homomorphism** universal property of completion.

To verify the delta identities at level n, choose representatives a and b of rho_(n+1)(x) and rho_(n+1)(y). The representatives a+b and ab then represent the sum and product at that same precision. Apply the delta identities in A and the q_n evaluation formula. Since rho_n is a ring homomorphism and the correction is a fixed integer polynomial, the resulting formulas are exactly the reductions modulo I^n of the required identities on B. The same reasoning at zero and one gives D(0)=D(1)=0. Equality of all coordinates proves the four identities in B. This constructs a delta structure; the axioms are not stored as an unsupported premise.

The construction works for any ideal I containing p. It is a statement about the existing inverse-limit ring, not an assertion that the extended ideal is finitely generated, that B is complete for its powers in full generality, or that this classical inverse limit computes a derived completion.

Its API consists of `completion_eval`, equation (D); `completion_algebraMap`, compatibility with i; and `completion_congr`, the one-step kernel-topology estimate. Each has its own lemma node below. The four tests are `completion_dyadic_scalar`, `completion_unit_ideal`, `completion_complete_base`, and `completion_torsion_survives`.

### Coordinates, base compatibility, and continuity

Nodes: `PR.0/delta-completion-coordinate`, `PR.0/delta-completion-base`, and `PR.0/delta-completion-congruence`.

Equation (D) follows directly from `evalₐ_mk` and `shiftedQuotient_mk` for the chosen representatives. It is the usable projection formula for D, not an additional hypothesis.

For a in A, the existing `evalₐ_of` and `algebraMap_apply` identify the coordinates of i(a). Equation (D) therefore gives

    rho_n(D(i(a))) = [delta(a)] mod I^n = rho_n(i(delta(a))).

Extensionality gives D(i(a))=i(delta(a)). This does not require i to be injective. When A is already I-adically complete, use the existing `AdicCompletion.ofAlgEquiv`; its forward map is i, and the same equation proves compatibility. No second completed ring or arbitrary isomorphism is substituted.

If rho_(n+1)(x)=rho_(n+1)(y), equation (D) gives rho_n(D(x))=rho_n(D(y)). The kernels K_n=ker(rho_n) specify the inverse-limit neighborhood basis. Thus D has the explicit one-step uniform modulus for that topology. To replace K_n by powers of the extended ideal one must justify their equality; this is where finite generation enters the full source statement.

### Uniqueness without assuming continuity of a competitor

Node: `PR.0/delta-completion-unique-fg`.

Assume now that I is finitely generated, and let J=I.map(i), the actual extended ideal in B. The pinned theorem

    AdicCompletion.pow_smul_top_eq_ker_eval

identifies I^n times the completed module with the kernel of its nth evaluation. Transport through the normalized `evalₐ` and use the elementary scalar-extension identity J^n=(I^n).map(i). This gives

    J^n = K_n.                                                    (K)

The module expression I^n times top and the ideal expression on B agree by their finite-sum descriptions. No topological closure is added to either side. The theorem requires finite generation of I, not Noetherianity of A or finite generation of A as a module. Its proof was inspected, including the use of a finite generating family in the kernel-image argument. The accompanying pinned `isAdicComplete` theorem makes B genuinely I-adically complete as a module; equivalently, in the ring case this is the J-adic completeness used by the source.

Let e be any delta structure on B compatible with i. Continuity of e is **not** assumed. The element p_B lies in J. For x in B and n>=0 choose a in A representing rho_(n+1)(x). Equation (K) gives x-i(a) in J^(n+1). Apply the algebraic congruence estimate to e on B with ideal J. Then e(x)-e(i(a)) is in J^n=K_n, and compatibility on A yields

    rho_n(e(x)) = [delta_A(a)] mod I^n
                = q_n(rho_(n+1)(x))
                = rho_n(D(x)).

Extensionality proves e=D. The same kernel equality converts the already-proved kernel estimate for D into its J-adic continuity. Existence, uniqueness among all compatible structures, and the source continuity statement are therefore obtained without presuming the continuity needed to conclude uniqueness.

For an infinitely generated I the canonical construction and kernel estimate above remain stated, but this checkpoint does not assert unconditional uniqueness among arbitrary compatible operations or the equality (K). A generic inverse-limit slogan cannot replace that missing hypothesis.

### Acceptance examples and the derived boundary

For A=Z, I=(2), the completed operation sends i(2) to i(-1), whose first positive quotient coordinate is nonzero. An identically zero operation would fail `completion_dyadic_scalar`. For I=A the completion is the zero ring and its unique operation passes `completion_unit_ideal`. For an already complete A, `completion_complete_base` compares the operation using the **existing** `ofAlgEquiv`, rather than a newly chosen model of completion.

For surviving torsion, take the p=2 square-zero ring A=Z plus F_2*epsilon and the lambda=1 structure of Section 6. Let I=(2). For n>=1 the ideal I^n consists of pairs (2^n a,0). Consequently epsilon has a nonzero image already in A/I, and hence in the completion. Base compatibility gives D(epsilon)=epsilon. The completed ring is naturally Z_2 plus F_2*epsilon, but the test does not need a new carrier or that isomorphism: nonzero evaluation at level one suffices. This rejects a construction which silently kills p-torsion before completing.

In finite computations the maps being tested are q_n from precision n+1 to precision n. A reduction such as (Z/p^n) plus F_p*epsilon is **not** presented as a delta ring. Its shifted maps obey the polynomial identities relative to the reduction between the two levels, and their compatible system constructs the operation on the inverse limit. This distinction is essential both mathematically and in the suggested signatures.

Lemma 2.18 concerns a separate derived-complete, completely etale problem and uses additional results. Nothing in the coordinate argument proves it, removes its hypotheses, or identifies classical and derived completion. Free delta-algebras, perfection, prism ideals and the cohomological stages also remain separate work.

## 9. Radical targets and the p-local coefficient ring

The next results specify two distinct inputs to the source's algebra. A ring being a Z_(p)-algebra means that every integer prime to p has unit image. Having p in its Jacobson radical is a stronger, different condition. For example, Q is a Z_(p)-algebra and p is a unit in Q, so p is not in its Jacobson radical. Neither property is a definition of a prism.

### Detecting Frobenius image units before constructing a target operation

Node: `PR.0/frobenius-image-unit-jacobson`; declaration `TauCeti.Delta.isUnit_map_frobenius_iff`.

Let A carry a delta structure, let B be a commutative ring, and let f:A→B be an arbitrary unital ring map. Assume p belongs to the Jacobson radical of B. Then

    f(phi_A(x)) is a unit if and only if f(x) is a unit.

There is no delta structure on B in this statement, and f is not required to be a delta morphism. This is the form needed to construct an operation on a localization. Applying preservation of units by a putative Frobenius endomorphism of B would assume the very structure being constructed.

Here is the full argument. Set a=f(x) and r=p*f(delta_A(x)). The associated Frobenius formula gives f(phi_A(x))=a^p+r. Since the radical is an ideal, r is in it. For any unit u and radical element r, write

    u+r = u*(1+u^(-1)*r).

The existing `Ideal.mem_jacobson_bot` makes the second factor a unit. Thus a unit a gives a unit a^p+r. Conversely, if a^p+r is a unit, add the radical element −r to obtain that a^p is a unit. Since p is positive, an inverse v of a^p gives an inverse a^(p−1)*v of a. This proves both directions, including for rings with torsion and the zero ring.

Remark 2.16 motivates this argument. The image form and reverse implication are explicit deductions here, not extra statements attributed verbatim to the source. No cancellation of p and no implication from Frobenius compatibility to delta compatibility occur.

### The first-coordinate Witt unit criterion in its proper range

Node: `PR.0/witt2-unit-jacobson`; declaration `TauCeti.Delta.witt2_isUnit_iff_of_mem_jacobson`.

For B with p in its Jacobson radical, a length-two Witt vector is a unit exactly when its zeroth coordinate is a unit. Indeed, the exact criterion of Section 7 requires units a and a^p+p*b. When a is a unit, factor the second expression as

    a^p*(1+p*b*a^(-p)).

The radical criterion makes the second factor a unit. Conversely, the original criterion already requires a to be a unit. This proves the specialization on the existing Witt carrier without invoking ghost injectivity.

In characteristic p the conclusion reduces to the familiar first-coordinate test. Without the radical condition it fails: at p=2, (1,1) in W_2(Z) has zeroth coordinate 1 but first ghost expression 3, so it is not a unit. The exact criterion and its specialization therefore remain separate lemmas.

### A compatible operation on a supplied radical localization

Node: `PR.0/delta-localization-jacobson`; construction `TauCeti.Delta.localizeJacobson`.

Let B be an A-algebra with the existing localization instance at a submonoid S of A. Suppose p_B belongs to the Jacobson radical of B. Every image i(s) is a unit by `IsLocalization.map_units`, so the preceding image lemma makes every i(phi_A(s)) a unit. Feed these proofs into `localize` from Section 7. This produces the delta operation on B and proves its uniqueness.

The three API declarations are `localizeJacobson_algebraMap`, giving delta_B(i(a))=i(delta_A(a)); `localizeJacobson_unique`, identifying every compatible operation with this one; and `localizeJacobson_eq_localize`, identifying it with the original constructor for any supplied proof of the image-unit condition. These follow from the established base formula and uniqueness theorem. The general delta-morphism universal property is the existing localization theorem, so this convenience constructor adds no new ring or competing universal property.

The tests `jacobson_localization_identity`, `jacobson_localization_zero` and `jacobson_localization_dyadic` respectively recover the original operation for an identity localization, admit the zero localization, and compute delta(2)=−1 at p=2. The last identity comes from the integer-cast theorem and holds even when the target has torsion.

The radical hypothesis is on B. It cannot be inferred just from the corresponding hypothesis on A. For example, inverting p in Z_(p) gives Q and destroys that condition, although its canonical delta operation still extends by the more general image-unit criterion. Thus `localizeJacobson` is a sufficient-condition adapter, not the exact necessary condition for extension.

This does not yet construct the full object denoted (S^(-1)A)_(p) in Remark 2.16. That construction must localize along V(p), prove the resulting radical property and its ordinary initial property, and compare it with localization at the monoid generated by the Frobenius iterates of S. Its completed variant needs a further argument. In particular, one cannot start by giving an arbitrary S^(-1)A a delta operation, since Section 7 provides explicit cases where none exists, and then feed that nonexistent operation to the completion constructor. These are explicit remaining inputs to the integrated local-generator theorem.

### The canonical operation on Z_(p)

Nodes: `PR.0/integer-frobenius-identity`, `PR.0/p-local-integer-delta` and `PR.0/p-local-integer-delta-base`.

The first node promotes the existing `TauCeti.Delta.intDelta_frobenius` API: the associated Frobenius of the canonical integer operation is the identity. Its proof is the inverse property of the reconstruction used to define that operation. The suggested file contains the declaration once.

Use `Nat.prime_iff_prime_int` and `Ideal.isPrime_span_singleton_of_prime` to establish that the integer ideal (p) is prime. The coefficient ring is exactly Mathlib's `Localization.AtPrime` of this ideal. Its denominators are the integers not divisible by p. The pinned local-ring result applies to this carrier; no new presentation of a p-local ring is introduced.

Since integer Frobenius is the identity, it fixes every denominator. The existing localization construction therefore gives `TauCeti.Delta.intAtPrime` on this ring. The base formula immediately proves `intAtPrime_algebraMap`. This API has its own lemma node because initiality uses it.

The associated Frobenius agrees with the identity on all integer images: expand the formula using compatibility with the integer operation. Both are ring maps out of the localization, so `IsLocalization.ringHom_ext` proves their equality everywhere. This is `intAtPrime_frobenius`. Rearranging its value at x gives the third API declaration, `intAtPrime_spec`:

    p*delta(x) = x-x^p.

The source writes this as a quotient by p. The displayed formulation works directly on the existing local ring without installing a field inverse on it. Its delta value belongs to the ring by construction. It is not an arbitrary rational number whose integrality has been assumed.

Four tests pin the arithmetic. `p_local_integer_prime` gives delta(p)=1−p^(p−1). `p_local_integer_negative_dyadic` gives delta_2(−1)=−1. `p_local_integer_third` takes the actual localization fraction z=1/3 at p=2 and checks 9*delta(z)=1; since 9 is a unit this gives delta(z)=1/9. The calculation follows by applying the product law to 3z=1, with delta(3)=−3 and phi(3)=3, or by the fraction formula. Finally, `p_local_integer_zero` checks delta(0)=0. The ring throughout is Z_(p), not the completed ring Z_p.

### Initiality with torsion in the target

Node: `PR.0/p-local-integer-initial`; declaration `TauCeti.Delta.intAtPrime_initial`.

Let B be a commutative delta ring in which every integer not divisible by p has unit image. There exists exactly one unital ring map Z_(p)→B commuting with delta. This states the source's coefficient-category hypothesis explicitly and allows both nonzero p-torsion and the zero ring.

The integer-cast theorem from Section 4 proves that Z→B commutes with delta, using its recurrence argument. The coefficient hypothesis says precisely that this map sends the localization denominators to units, because membership in the principal integer ideal (p) is divisibility by p. Apply the established delta-localization universal property and the `intAtPrime_algebraMap` identity to obtain a compatible map on Z_(p). Every unital ring map from Z_(p) has the same restriction to Z, so localization extensionality proves uniqueness even before imposing delta compatibility.

This proof implements the initiality assertion in Example 2.6 without using p-torsionfreeness of B. In particular it does not compare Frobenius maps and attempt to cancel p in B. Its self-map is the identity, and the unique map to the zero ring is included.

## 10. Ownership, evidence and continuation

The accepted RS-01 leaves δ-rings and prisms in PR.0. The atlas lists PR.1, the integral-perfectoid comparison, Habiro and trace-method consumers. They receive this same elementary interface. It does not construct a second Witt ring, a second localization, or a λ-ring with commuting operations at all primes. The generic derived-completion machinery belongs to DerivedDeRhamCohomology DD.1, divided-power inputs to CrystallineCohomology CR.0, and the general integral-perfectoid prefix to PerfectoidQuotients Q0:integral-algebra.

The remaining integrated PR.0 IDs are `distinguished-factor-rigidity`, `local-distinguished-prism-generators`, `rigidity-prism-ideal`, `bounded-prism-complete-flatness`, `perfect-prisms-perfectoid-rings` and `regular-prismatic-envelopes`. PR.1 retains `prismatic-structure-sheaf`. Their accepted R2 corrections remain in the unchanged integrated file. In particular preserve the radical hypotheses, the derived-completeness input for bounded flatness, the distinction between general integral perfectoid rings and the O_C example, and the regular-envelope/PD hypotheses. No remainder is discharged merely because the elementary dictionary is now expanded.

Free δ-algebras, the universal localization along V(p) and its Frobenius-saturation comparison and completed variant in Remark 2.16, derived completion and the completely etale step of Lemma 2.18, perfection, the full Witt adjunction, distinguished elements and actual prism examples remain required. Section 7 supplies ordinary localization and Section 8 supplies the classical completion argument; neither implies a derived-completion or prism condition. The source's derived Frobenius-homotopy characterization is separate from both ordinary Frobenius and the underived W_2 section. PR.1–PR.7 retain their entire cohomological and coefficient worklists. This packet cannot be promoted as a closed replacement for the integrated decomposition.

The source is Bhatt–Scholze, *Prisms and prismatic cohomology*, [arXiv:1905.08229v4](https://arxiv.org/pdf/1905.08229v4). Freshly acquired bytes were hashed, and printed pp.13–17 were read in full; pp.14,16–17 were also rendered and inspected. This includes the full localization and classical-completion proofs. The beginning of Lemma 2.18 was read to delimit the derived boundary; its remaining proof and imported results are not certified. Historical access records from preceding checkpoints are retained as such. This continuation does not claim publisher full-text collation or a whole-paper reading.

The accepted AUDIT-38 and its independent review distinguish the existing Witt, localization and completion infrastructure from the missing delta interface. The current global library-coverage file contains no per-layer reviewed entries for this roadmap; the accepted audit shard and its review were therefore read directly. The owner document, all eight integrated nodes and their correction/gap records, the accepted RS-01 decisions and relevant incident links were checked. The proposed nodes import no new outside stage and create no second owner of Witt vectors, localization, derived completion or perfectoid algebra.

All 45 inherited baseline declaration statements were reread directly at the pin, together with the six new Jacobson and prime-localization declarations. The same carrier conventions survive compilation. In particular the integer square-zero examples now install the actual central opposite action by restriction of scalars, and the let-bound ring in the completion test is given its existing ring instance. These corrections supply instances; they do not weaken the examples or remove torsion.

The packet contains 54 nodes, 51 API items and 52 definition/construction tests. All 46 preceding node objects are retained. The whole suggested file compiles with zero errors and 138 warnings, all the permitted proof-placeholder warning. Its 2,090 transitive Mathlib source files were byte-matched to the pinned tree before compilation. There are no Tau Ceti imports in this file. No proof implementation or closure of a prismatic stage is claimed.

The new mathematical statements retain the exact target radical condition and the source coefficient category. Their detailed proofs are above. The internal node graph is acyclic; this is not a full atlas-cycle certificate. The independent Annals article page, arXiv version history, author papers page and the atlas source-issue register were screened for relevant corrections. No new mathematical source error was established in this construction range, and existing findings outside it are not independently reverified here.

The version-specific record `PrismaticCohomology/E1` notes a missing letter in the preprint proof of Remark 2.5: its right-hand arrow remains the canonical projection R→R/p. This editorial slip has no mathematical effect; novelty and its presence in the publisher text are not asserted.

## Delta-stabilization and the universal quotient

Fix a prime p and a commutative ring A with a delta structure d. Write C_d(I) for the delta-stabilization of an ideal I. This is an ordinary ideal, and its quotient is the existing ordinary quotient ring. The new data are the closure operation and the compatible delta operation. In the source all rings are p-local; the following elementary refinements use only the integral delta identities and therefore hold for arbitrary commutative delta rings.

The decisive check is the ideal (p): its closure is the whole ring, since delta(p)=1-p^(p-1). Thus killing p in a delta-compatible quotient collapses the ring. In particular, one must not confuse these quotients with the shifted finite-quotient functions used to construct classical completion.

The source is Bhatt–Scholze, arXiv v4, Notation 2.8, Lemma 2.9 and Example 2.10, printed p.15. The entire page was inspected. The stability-on-generators and kernel lemmas make explicit the elementary proof steps implicit in Example 2.10. The full Witt adjunction, free delta-algebras, derived quotients and prism envelopes are separate remaining constructions.

### Delta stability from ideal generators

Identifier: `PrismaticCohomology:PR.0/delta-span-stability`.

For a subset S of A, the ordinary ideal J generated by S is delta-stable if and only if delta(s) belongs to J for every s in S.

Proof plan:

- The forward implication is restriction along the inclusion of S in its ideal span.
- For the converse apply span induction to the predicate delta(x) belongs to J, keeping x in J as the induction membership. Zero follows from delta(0)=0.
- For a sum, use the delta addition identity and delta-adic-correction with J: the correction term is in J because the second summand is in J.
- For a scalar multiple ax, use delta(ax)=a^p delta(x)+x^p delta(a)+p delta(a)delta(x). The first and third terms lie in J by the inductive hypothesis, and the second because x lies in J and p is positive. This argument never assumes delta is additive.

Dependencies: `PrismaticCohomology:PR.0/delta-frobenius-dictionary`, `PrismaticCohomology:PR.0/delta-adic-correction`, `mathlib:Ideal.subset_span`, `mathlib:Submodule.span_induction`.

### Delta-stabilization of an ideal

Identifier: `PrismaticCohomology:PR.0/delta-ideal-closure`.

For an ideal I of A, define its delta-stabilization C_d(I) to be the ordinary ideal generated by all delta^n(a), for n a nonnegative integer and a in I. The exponent means iteration of delta, with delta^0 the identity; it is not a ring power or a Witt-coordinate operation.

Proof plan:

- Use the existing ideal span of the set of all iterated delta images. The index n=0 includes the original ideal.
- Stability and the least-stable-ideal characterization are separate lemma nodes. Idempotence and monotonicity follow from those lemmas, giving the usual closure-operator laws without introducing another ideal type.
- For the prime-ideal acceptance test, use integer-cast-delta: delta(p)=1-p^(p-1). The zeroth and first iterates place p and delta(p) in the closure; p is at least two, so their ideal combination is 1.

Dependencies: `PrismaticCohomology:PR.0/delta-frobenius-dictionary`, `mathlib:Ideal.span`, `mathlib:Function.iterate_zero_apply`, `PrismaticCohomology:PR.0/integer-cast-delta`.

API:

- `TauCeti.Delta.idealClosure_eq_span`: C_d(I) is exactly the ideal span of the set of all delta^n(a) with n nonnegative and a in I.
- `TauCeti.Delta.le_idealClosure`: I is contained in C_d(I), by the zeroth iterate.
- `TauCeti.Delta.idealClosure_stable`: For x in C_d(I), delta(x) is in C_d(I); the separate stability lemma supplies this API.
- `TauCeti.Delta.idealClosure_le`: For a delta-stable ideal J, C_d(I) is contained in J if and only if I is contained in J; the separate minimality lemma supplies this API.
- `TauCeti.Delta.idealClosure_idem`: C_d(C_d(I))=C_d(I).
- `TauCeti.Delta.idealClosure_mono`: If I is contained in J, then C_d(I) is contained in C_d(J).

Unit tests:

- `ideal_closure_zero`: The delta-stabilization of the zero ideal is the zero ideal.
- `ideal_closure_stable_fixed`: If I is already delta-stable, then C_d(I)=I.
- `ideal_closure_prime_is_top`: In every delta ring A, C_d((p)) is the unit ideal: both p and delta(p)=1-p^(p-1) belong to it, so 1 does too.
- `ideal_closure_not_ordinary_span`: For the canonical 2-delta structure on the integers, C_d((2)) differs from the ordinary ideal (2), since delta(2)=-1.

### Stability of delta-stabilization

Identifier: `PrismaticCohomology:PR.0/delta-ideal-closure-stable`.

For every ideal I, delta carries C_d(I) into C_d(I).

Proof plan:

- For a generating element delta^n(a), its delta is delta^(n+1)(a), another generator.
- Apply delta-span-stability to these generators. Their ideal span is C_d(I) by definition; no assumption that I itself is stable is used.

Dependencies: `PrismaticCohomology:PR.0/delta-ideal-closure`, `PrismaticCohomology:PR.0/delta-span-stability`, `mathlib:Ideal.subset_span`, `mathlib:Function.iterate_succ_apply'`.

### Minimality of delta-stabilization

Identifier: `PrismaticCohomology:PR.0/delta-ideal-closure-minimal`.

For any delta-stable ideal J, C_d(I) is contained in J if and only if I is contained in J.

Proof plan:

- The forward direction uses the zeroth iterate in the generating set.
- Conversely, if I is contained in J, induction on n shows delta^n(a) belongs to J for every a in I. Use stability of J in the successor step, then the universal property of ideal span.

Dependencies: `PrismaticCohomology:PR.0/delta-ideal-closure`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`, `mathlib:Function.iterate_zero_apply`, `mathlib:Function.iterate_succ_apply'`.

### Kernels of delta morphisms

Identifier: `PrismaticCohomology:PR.0/delta-kernel-stability`.

If f:A to B is a unital ring map between delta rings and f commutes with their delta operations, then its ordinary ring-homomorphism kernel is delta-stable.

Proof plan:

- For x in the kernel, compute f(delta(x))=delta(f(x))=delta(0)=0. Translate this equality using the existing kernel membership theorem.

Dependencies: `PrismaticCohomology:PR.0/delta-frobenius-dictionary`, `mathlib:RingHom.ker`, `mathlib:RingHom.mem_ker`.

### Universal delta quotient by an ideal

Identifier: `PrismaticCohomology:PR.0/delta-universal-quotient`.

On the existing quotient ring Q=A/C_d(I), construct the unique delta structure for which the ordinary quotient map q:A to Q commutes with delta. This is the universal delta A-algebra annihilating I, as proved by the separate universal-property theorem.

Proof plan:

- Apply delta-stable-quotient to the ideal C_d(I), using delta-ideal-closure-stable. Select the unique compatible delta structure on the existing quotient carrier.
- Its evaluation on q(a) is q(delta(a)). The map kills I since I is contained in its closure. The universal mapping property is proved separately through the existing ring quotient lift.

Dependencies: `PrismaticCohomology:PR.0/delta-ideal-closure`, `PrismaticCohomology:PR.0/delta-ideal-closure-stable`, `PrismaticCohomology:PR.0/delta-stable-quotient`, `mathlib:Ideal.Quotient.mk`, `mathlib:Ideal.Quotient.eq_zero_iff_mem`.

API:

- `TauCeti.Delta.quotientByIdealClosure_mk`: The quotient delta operation sends q(a) to q(delta(a)); this is also a separate projection lemma.
- `TauCeti.Delta.quotientByIdealClosure_unique`: Every delta structure on A/C_d(I) compatible with q equals the constructed one.
- `TauCeti.Delta.quotientByIdealClosure_kills`: For a in I, the existing quotient projection q sends a to zero.

Unit tests:

- `universal_quotient_zero_ideal`: When I is the zero ideal, q is bijective and intertwines the given delta operation with the quotient delta operation.
- `universal_quotient_prime_collapses`: For I=(p), the quotient A/C_d(I) is the zero ring, expressed by its carrier being a subsingleton.
- `universal_quotient_identity_factor`: For the target quotient itself and f=q, the unique endomorphism extending q and commuting with delta is the identity; equivalently exactly one such endomorphism exists.

### Delta compatibility of the quotient projection

Identifier: `PrismaticCohomology:PR.0/delta-universal-quotient-projection`.

For every a in A, the constructed delta operation on A/C_d(I) sends q(a) to q(delta(a)).

Proof plan:

- Use the compatibility property of the unique structure selected from delta-stable-quotient. No representative is chosen in this identity.

Dependencies: `PrismaticCohomology:PR.0/delta-universal-quotient`.

### Universal property of the delta quotient

Identifier: `PrismaticCohomology:PR.0/delta-universal-quotient-lift`.

Let B be a delta ring and f:A to B a unital ring map commuting with delta and annihilating I. There exists a unique ring map g:A/C_d(I) to B extending f and commuting with the quotient delta operation. Its underlying map is the existing ordinary quotient lift.

Proof plan:

- Delta-kernel-stability makes the ordinary kernel of f delta-stable. Minimality of C_d(I), with I contained in that kernel, shows f annihilates the closure.
- Construct g by the existing Ideal.Quotient.lift and use its evaluation theorem to prove g(q(a))=f(a).
- For an arbitrary quotient element choose a representative using surjectivity of q. Evaluate the quotient delta via delta-universal-quotient-projection and use compatibility of f to prove compatibility of g.
- Any competing map agrees after precomposition with the surjective q, hence agrees everywhere. This proves initiality among the stated delta-compatible maps, without building an unrelated category or assuming an adjunction.

Dependencies: `PrismaticCohomology:PR.0/delta-kernel-stability`, `PrismaticCohomology:PR.0/delta-ideal-closure-minimal`, `PrismaticCohomology:PR.0/delta-universal-quotient-projection`, `PrismaticCohomology:PR.0/delta-universal-quotient`, `mathlib:RingHom.mem_ker`, `mathlib:Ideal.Quotient.lift`, `mathlib:Ideal.Quotient.lift_mk`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:Ideal.Quotient.ringHom_ext`.


Current totals after the ideal-closure extension: **54 nodes, 51 API items, 52 tests, 5 planets and 65 baseline declarations**. All three gaps remain, no supplier requests are added, and no stage is closed. All 46 prior node objects and source findings are unchanged.

The inherited E1 typo finding remains unverified. Its `known` field now uses the protocol marker `new`, meaning that no published correction was found in the recorded scoped search. The preprint-only and novelty limitations are retained in its reason. This metadata correction places it among findings awaiting review rather than incorrectly among sources already corrected in print.
