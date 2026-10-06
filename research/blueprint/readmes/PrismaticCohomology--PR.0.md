# Prismatic cohomology: δ-rings, prisms, the prismatic site and its comparisons

**Part PR.0 of the roadmap `PrismaticCohomology`; layers PR.0–PR.7.** The logarithmic layer PR.8 is the other part of the roadmap and is not treated here.

## Purpose

This document plans a library for prismatic cohomology in the sense of Bhatt and Scholze, from what Mathlib and Tau Ceti contain to the theorems the roadmap's layers state. It is a plan: every declaration named below is proposed, none is claimed to be formalised, and the suggested Lean file that accompanies it gives signatures, API and tests with proof placeholders only.

The library is built, not a single theorem raced to. The order is the order of the sources. Layer PR.0 builds δ-rings, distinguished elements, prisms, perfect prisms and their equivalence with perfectoid rings, and prismatic envelopes. PR.1 builds the relative prismatic site of a formal scheme over a bounded prism and proves the Hodge–Tate, crystalline and de Rham comparisons for smooth formal schemes. PR.2 extends the theory to all derived p-complete animated rings, computes it on quasiregular semiperfectoid rings and proves quasisyntomic descent. PR.3 constructs the Nygaard filtrations, the divided Frobenius and the Breuil–Kisin twists. PR.4 proves the étale comparison and builds the syntomic complexes Z_p(n). PR.5 treats absolute prismatic cohomology and the Cartier–Witt stack. PR.6 builds q-crystalline cohomology and compares prismatic cohomology with the q-de Rham complex and with AΩ. PR.7 classifies lattices in crystalline Galois representations by prismatic F-crystals.

## Scope and granularity

PR.0 has two parts. Its first part (Sections 1–9 and the section on δ-stabilization) is written at lemma level: one declaration per node, with complete proofs from the pinned libraries. Everything else is written at target level: one node for each target a layer states and for each definition or key theorem a target needs on the way, with its exact statement and hypotheses, a proof outline that cites the source, and its direct prerequisites. Every definition and construction carries the uses it serves, an API outline and unit tests chosen so that a plausible wrong definition fails one of them.

## Conventions

- p is a fixed prime. Rings are commutative with unit. The sources work with Z_(p)-algebras; the elementary δ-ring algebra of PR.0 is stated for all commutative rings and specialised where δ(p) = 1 − p^(p−1) must be a unit.
- A δ-ring is a ring with δ satisfying the two identities of Section 2; φ(x) = x^p + p·δ(x) is its Frobenius lift. A δ-structure is data, and it is not recovered from φ when the ring has p-torsion.
- A prism (A, I) is a δ-ring A with an ideal I that is an invertible module (a Cartier divisor), such that A is derived (p, I)-complete and p ∈ I + φ(I)A. It is bounded when A/I has bounded p^∞-torsion. An orientation is a chosen generator of I; none is assumed globally.
- Completions are derived unless called classical. Complexes are objects of derived ∞-categories as in the sources; the suggested Lean file uses Mathlib's derived category of modules as their 1-categorical shadow.
- The Breuil–Kisin twist is M{n} = M ⊗_A A{n} with A{1}/I = I/I². For an oriented prism it is trivialised by the generator; statements are written with the twist.
- Comparison theorems carry their Frobenius twists: the crystalline and de Rham comparisons are stated for φ_A^*Δ, the Hodge–Tate comparison for Δ ⊗ A/I without a twist.
- Cohomological degrees are written cohomologically; D^{≥0} means cohomology in non-negative degrees.

## Boundaries with other roadmaps

Each piece of mathematics has one owner, and what another roadmap owns is imported, never planned again.

- Derived completion, complete flatness and completed descent: DerivedDeRhamCohomology DD.1. The cotangent complex and derived exterior powers: DD.0. The de Rham complex and derived de Rham cohomology: DD.2. The Cartier isomorphism and conjugate filtration of derived de Rham cohomology: DD.3. The quasisyntomic site and its descent: DD.5.
- Animated rings, left Kan extension, cohomological descent, descendability: EnhancedDerivedSheaves E5, E3, E2.
- PD envelopes, crystalline sites and cohomology, de Rham–Witt complexes: CrystallineCohomology CR.0, CR.1, CR.2, CR.4.
- Integral perfectoid rings, tilting, A_inf and θ: PerfectoidQuotients Q0:integral-algebra. Universal prisms of semiperfectoid rings, André's flatness lemma and the surjectivity of perfectoidization: PerfectoidQuotients Q2, Q3, Q4, which build on PR.0–PR.2.
- The décalage functor Lη, BKF modules and AΩ: AInfCohomology AI.1–AI.4.
- Étale cohomology of schemes and of adic spaces: SchemeAndStackFoundations SF.2 and ClassicalAdicEtaleCohomology. Stacks and quasi-coherent complexes on them: SchemeAndStackFoundations SF.1 and LanglandsParameterStacks LP1.
- Topological Hochschild and cyclic homology and the Beilinson fibre square: RefinedTraceMethods. No trace-theoretic input enters PR.0–PR.6; PR.7 uses the Beilinson fibre square as a named prerequisite.
- Framed q-derivatives and the framed q-de Rham Koszul complex: QWittVectors QW.6, imported by PR.6.
- The arc-topology and its descent theorems, the perfectoidization of integral algebras with almost purity along an ideal, and the K-theory of henselian pairs have accepted owners that are not yet roadmaps of the atlas; the places where this plan needs them are recorded as gaps, by name, in the closing section.

## Sources

- B. Bhatt, P. Scholze, *Prisms and prismatic cohomology*, arXiv:1905.08229v4 (Annals of Mathematics 196 (2022)). The text read is the arXiv version, and locators are its numbers.
- B. Bhatt, J. Lurie, *Absolute prismatic cohomology*, arXiv:2201.06120v1.
- B. Bhatt, P. Scholze, *Prismatic F-crystals and crystalline Galois representations*, arXiv:2106.14735v2.
- B. Bhatt, M. Morrow, P. Scholze, *Topological Hochschild homology and integral p-adic Hodge theory*, arXiv:1802.03261v2, and *Integral p-adic Hodge theory*, arXiv:1602.03148v3.
- J. Anschütz, A.-C. Le Bras, *Prismatic Dieudonné theory*, arXiv:1907.10525v4.
- B. Bhatt, A. Mathew, *Syntomic complexes and p-adic étale Tate twists*, arXiv:2202.04818v2.

Mistakes found in these texts are recorded in the atlas's register of mistakes in published sources; the statements below are the corrected ones, and the places are marked.

# Layer PR.0. Delta-rings, prisms and envelopes

Fix a prime p. In Sections 1–9 R is a commutative unital ring; the zero ring is allowed. Bhatt–Scholze §2 works with Z_(p)-algebras. The polynomial constructions of these sections are proved for all commutative rings and are instantiated in the p-local category before the source's prism and completion theorems are used. The baseline already contains commutative rings and ring homomorphisms, integer polynomials, ideals and their quotients, the central trivial-square-zero extension, localizations, adic completions, and infinite and truncated Witt vectors; they are reused. In particular the carrier of length-two Witt vectors is `TruncatedWittVector p 2 R` with its Witt operations, not the product ring. Names in Sections 1–9 lie in `TauCeti.Delta`.

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

Node: `PR.0/delta-frobenius-dictionary`.

A `Structure p R` is a function δ:R→R with

    δ(0)=0,  δ(1)=0,
    δ(x+y)=δ(x)+δ(y)+C_p(x,y),
    δ(xy)=x^p δ(y)+y^p δ(x)+p δ(x)δ(y).

These are the actual axioms; a field saying that an unspecified equivalence exists is not a construction. A morphism is an existing unital ring homomorphism f satisfying f(δ_R(x))=δ_S(f(x)) for every x. A separate ring or ideal carrier is unnecessary. Free objects, limits and colimits and the Witt adjunction are the nodes `free-delta-ring` and `delta-ring-category` of the second part of this layer.

The API has `Structure.ext`, equality by equality of δ; `Structure.delta_neg`, obtained from the addition law at x and −x; and `Structure.delta_two`, obtained at 1 and 1. Explicitly,

    δ(-x) = -δ(x)-C_p(x,-x),
    δ(1+1) = C_p(1,1).

The tests `delta_two_forced` and `delta_zero_operation_rejected` assert, respectively, that every 2-δ-structure on Z sends 2 to −1 and that the zero function is therefore not such a structure. The test `delta_zero_ring` permits the zero ring. Rejecting it by an unnecessary nontriviality premise would change the category.

The definition, the ordinary Frobenius comparison and the Witt-section comparison are separate declarations with separate proofs; the comparison nodes below carry the actual inverse maps.

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

Section 9 supplies the Jacobson-target unit argument. The universal radical localization of Remark 2.16 is the node `delta-radical-localization` of the second part of this layer, and the derived-complete variant is `delta-etale-extension`. Localizing an arbitrary ring does not automatically preserve a hypothesis that p belongs to its Jacobson radical, and the argument above does not replace classical or derived completion by ordinary localization.

### Two tests of the denominator hypothesis

For failure, take A=Z_(p)[X] with the Frobenius lift fixing coefficients and sending X to X^p+p. It lifts Frobenius modulo p, and A is p-torsionfree, so the reconstruction supplies a delta structure with delta(X)=1. In B=A[X^(-1)], the element X^p+p is not a unit. Indeed a Laurent polynomial unit over a domain has only one nonzero degree: in a product, the highest and lowest nonzero degrees add, so a product equal to 1 forces both widths to be zero. The two nonzero terms of X^p+p have different degrees. There is therefore **no** compatible delta structure on B. Naming the fraction delta(X^(-1)) does not make it an element of B. In the field of rational functions its value is -1/(X^p*(X^p+p)), displaying the missing denominator.

For success without literal stability, take p=2, A=Z plus F_2*epsilon with epsilon^2=2*epsilon=0, delta=delta_1 from Section 6, and s=(3,1). Its Frobenius is phi(s)=(3,0), which is not a power of s: comparing integer coordinates forces exponent one, whose second coordinate is different. Nevertheless s^2=(9,0), so phi(s) divides s^2. Criterion (L) holds in the localization at powers of s. Its ring is identified with Z[1/3] plus F_2*epsilon: s is invertible there, and in the localization the nilpotent difference s-3*1 shows that 3 also becomes invertible. The two ordinary universal properties give inverse maps. Epsilon remains nonzero and delta(epsilon)=epsilon. The operation therefore both exists and retains its torsion information even though literal phi-stability fails.

## 8. Classical adic completion and the loss of one power

This section supplies the classical completion argument of Bhatt–Scholze Lemma 2.17 on the existing Mathlib completion. Derived completion and Lemma 2.18 are the subject of `delta-etale-extension` in the second part of this layer. Fix a commutative delta ring A and an ideal I containing the image of p. Write

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

For an infinitely generated I the canonical construction and the kernel estimate above still hold, but unconditional uniqueness among arbitrary compatible operations and the equality (K) are not asserted. A generic inverse-limit slogan cannot replace that missing hypothesis.

### Acceptance examples and the derived boundary

For A=Z, I=(2), the completed operation sends i(2) to i(-1), whose first positive quotient coordinate is nonzero. An identically zero operation would fail `completion_dyadic_scalar`. For I=A the completion is the zero ring and its unique operation passes `completion_unit_ideal`. For an already complete A, `completion_complete_base` compares the operation using the **existing** `ofAlgEquiv`, rather than a newly chosen model of completion.

For surviving torsion, take the p=2 square-zero ring A=Z plus F_2*epsilon and the lambda=1 structure of Section 6. Let I=(2). For n>=1 the ideal I^n consists of pairs (2^n a,0). Consequently epsilon has a nonzero image already in A/I, and hence in the completion. Base compatibility gives D(epsilon)=epsilon. The completed ring is naturally Z_2 plus F_2*epsilon, but the test does not need a new carrier or that isomorphism: nonzero evaluation at level one suffices. This rejects a construction which silently kills p-torsion before completing.

In finite computations the maps being tested are q_n from precision n+1 to precision n. A reduction such as (Z/p^n) plus F_p*epsilon is **not** presented as a delta ring. Its shifted maps obey the polynomial identities relative to the reduction between the two levels, and their compatible system constructs the operation on the inverse limit. This distinction is essential both mathematically and in the suggested signatures.

Lemma 2.18 concerns a separate derived-complete, completely etale problem and uses additional results. Nothing in the coordinate argument proves it, removes its hypotheses, or identifies classical and derived completion. Free δ-algebras, perfection and prism ideals are treated in the second part of this layer.

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

This is not yet the full object denoted (S^(-1)A)_(p) in Remark 2.16. That construction localizes along V(p), proves the resulting radical property and its initial property, and compares it with localization at the monoid generated by the Frobenius iterates of S; it is the node `delta-radical-localization`. In particular, one cannot start by giving an arbitrary S^(-1)A a delta operation, since Section 7 provides explicit cases where none exists, and then feed that nonexistent operation to the completion constructor. They are inputs to `local-distinguished-prism-generators`.

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

## Delta-stabilization and the universal quotient

Fix a prime p and a commutative ring A with a delta structure d. Write C_d(I) for the delta-stabilization of an ideal I. This is an ordinary ideal, and its quotient is the existing ordinary quotient ring. The new data are the closure operation and the compatible delta operation. In the source all rings are p-local; the following elementary refinements use only the integral delta identities and therefore hold for arbitrary commutative delta rings.

The decisive check is the ideal (p): its closure is the whole ring, since delta(p)=1-p^(p-1). Thus killing p in a delta-compatible quotient collapses the ring. In particular, one must not confuse these quotients with the shifted finite-quotient functions used to construct classical completion.

The source is Bhatt–Scholze, arXiv v4, Notation 2.8, Lemma 2.9 and Example 2.10, printed p.15. The entire page was inspected. The stability-on-generators and kernel lemmas make explicit the elementary proof steps implicit in Example 2.10. The Witt adjunction, free δ-algebras and prismatic envelopes are nodes of the second part of this layer.

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

## PR.0, second part. Free δ-rings, distinguished elements, prisms and envelopes

Sections 1–9 above build the δ-ring dictionary at lemma level. This part plans the rest of the layer at target level: one declaration for each target the layer states and for each definition or key theorem a target needs. The source is Bhatt–Scholze, *Prisms and prismatic cohomology*, §§2–3, with three statements from Anschütz–Le Bras, *Prismatic Dieudonné theory*. Fix a prime p. Rings are commutative; the source's rings are Z_(p)-algebras, and a statement that needs δ(p) = 1 − p^(p−1) to be a unit says so.

Names lie in `TauCeti.Delta` (δ-rings) and `TauCeti.Prismatic` (prisms). A statement that the source deduces from derived (p, I)-completeness is given here with that hypothesis named; derived completion itself is owned by DerivedDeRhamCohomology DD.1, PD envelopes by CrystallineCohomology CR.0, animated rings by EnhancedDerivedSheaves E5:animation, and integral perfectoid rings with their tilt, A_inf and θ by PerfectoidQuotients Q0:integral-algebra.

### Free δ-rings, limits and colimits, Witt vectors

`free-delta-ring`. For a set S, Z{S} is the polynomial ring Z[x_{s,n} : s ∈ S, n ≥ 0] with the δ-structure determined by δ(x_{s,n}) = x_{s,n+1}, so φ(x_{s,n}) = x_{s,n}^p + p·x_{s,n+1}. It is the free δ-ring on S: a family (f_s) in a δ-ring R extends uniquely to a δ-map with x_{s,n} ↦ δ^n(f_s). Its Frobenius is faithfully flat (Lemma 2.11); the proof is the fibrewise criterion applied to finite stages, which after inverting p shift polynomial generators and modulo p are Frobenius followed by a polynomial inclusion. Corollary 2.12, that every element of a δ-ring becomes a Frobenius image after a faithfully flat δ-extension, is the first consequence. The source's Z_(p){S} is the base change to Z_(p). API: `Free`, `freeDelta`, `freeDelta_X`, `Free.lift`, `Free.lift_isDeltaHom`, `Free.frobenius_faithfullyFlat`. Tests: `free_delta_frobenius_X` (φ(x_0) = x_0^p + p·x_1), `free_delta_lift_int_two` (for p = 2 the map to Z with x_0 ↦ 2 sends x_1 to −1), `free_delta_empty` (the free δ-ring on no generators is Z), `free_delta_not_free_ring` (x_1 is not a polynomial in x_0).

`delta-ring-category`. δ-rings have all limits and colimits, computed on underlying rings (Remark 2.7): limits because the axioms are equational, colimits through the W_2-section description of Section 5 above. Hence products and pushouts A ⊗_C B of δ-rings carry canonical δ-structures. The forgetful functor has the left adjoint of the previous paragraph and a right adjoint, the p-typical Witt vectors (Joyal): W(R) is a δ-ring whose Frobenius is the Witt vector Frobenius, and a δ-ring A has the unit w_A : A → W(A) with Witt coordinates (x, δ(x), …) and ghost components φ^n(x). API: `Structure.prod`, `Structure.tensorProduct`, `witt`, `witt_frobenius`, `wittUnit`, `wittUnit_coeff_zero`, `wittUnit_coeff_one`, `wittUnit_ghost`. Tests: `witt_unit_int_ghost`, `delta_prod_fst`, `witt_delta_torsionfree` (p·δ(x) = F(x) − x^p on W(Z)), `witt_unit_not_teichmuller` (w_Z(2) ≠ [2] for p = 2: its first coordinate is δ(2) = −1).

`animated-delta-rings`. Simplicial commutative δ-rings and their ∞-category, the animation of free δ-rings on finite sets. The forgetful functor to animated rings preserves limits and colimits, so a derived pushout of animated δ-rings is the derived tensor product of underlying animated rings; this is what Corollary 2.39 and the construction of envelopes use, and the source uses it without stating it. The free adjunctions A{x/p} and A{J/I} are derived pushouts along maps of free δ-rings. API: `SimplicialDeltaRing`, `SimplicialDeltaRing.const`, `SimplicialDeltaRing.frobenius`, `SimplicialDeltaRing.frobenius_app`. Tests: `simplicial_delta_const_obj`, `simplicial_delta_const_frobenius`, `simplicial_delta_face_commutes`, `simplicial_delta_frobenius_mod_p`.

`delta-radical-localization`. For a δ-ring A and a multiplicative set S, the p-localization of S^{-1}A equals that of T^{-1}A, where T is generated by all φ^n(S); it has a unique compatible δ-structure and is initial among δ-A-algebras with p in the radical in which S is invertible (Remark 2.16). This closes the localization theory of Sections 7 and 9. API: `frobeniusSaturation`, `frobeniusSaturation_stable`, `radicalSaturation`, `localizeRadical_p_mem_jacobson`, `localizeRadical`, `localizeRadical_unique`. Tests: `frobenius_saturation_phi_stable_already`, `frobenius_saturation_int`, `frobenius_saturation_free_strict`.

`delta-etale-extension` (Lemma 2.18). For I finitely generated containing p, a derived I-complete, I-completely étale A-algebra has a unique compatible δ-structure; in particular the δ-structure passes uniquely to derived I-completions. The proof lifts the W_2-section along an étale map, using Elkik's algebraization and van der Kallen's theorem, both requested from DD.1. This is the derived statement that Section 8's classical completion does not give.

### Perfect δ-rings and distinguished elements

`distinguished-element`. d is distinguished if δ(d) is a unit. δ-maps preserve the property. The four examples of the layer: p ∈ Z_p; [p]_q in Z_p[[q−1]]; a generator ξ of ker θ in A_inf; a generator of the kernel of W[[u]] → O_K. API: `IsDistinguished`, `IsDistinguished.map`, `isDistinguished_p_int`, `IsDistinguished.p_mem_span`. Tests: `distinguished_p_value` (δ(p) = 1 − p^(p−1)), `distinguished_p_squared_fails`, `distinguished_zero_ring`, `distinguished_unit_times_p`.

`distinguished-factor-rigidity` (Lemmas 2.23, 2.24). With d, p in the Jacobson radical, unit multiples of a distinguished element are distinguished; if d = f·h is distinguished and f, p are in the radical, then f is distinguished and h is a unit. `local-distinguished-prism-generators` (Lemmas 2.25, 3.1). With d, p in the radical, d is distinguished exactly when p ∈ (d, φ(d)); for a locally principal I with p, I in the radical, p ∈ I + φ(I)A is equivalent to p ∈ I^p + φ(I)A and to I being generated by a distinguished element on a faithfully flat ind-Zariski δ-cover.

`p-torsion-freeness-criteria` (Lemma 2.28): a p-local δ-ring with injective Frobenius, or reduced, is p-torsion-free; if p·x = 0 then φ(x) = 0. `perfect-delta-rings` (Corollary 2.31): perfect p-complete δ-rings, p-complete p-torsion-free rings with perfect reduction, and perfect F_p-algebras are equivalent categories, through A ↦ A/p and R ↦ W(R); W(R) has one δ-structure. `rank-one-elements` (Lemma 2.32): δ(x^(p^n)) ∈ p^n A, so elements with all p-power roots in a p-adically separated δ-ring have δ = 0. `distinguished-in-perfect-delta-rings` (Lemmas 2.33, 2.34): in W(R), d = Σ [a_i] p^i is distinguished exactly when a_1 is a unit; a distinguished element of a p-torsion-free, p-adically separated δ-ring with reduced A/p is a nonzerodivisor and A/d has (A/d)[p^∞] = (A/d)[p].

### Divided powers and complete regularity

`free-delta-pd-envelope` (Lemmas 2.35, 2.36, Remark 2.37): in a p-torsion-free δ-ring, γ_p(z) ∈ A implies γ_n(z) ∈ A for all n; Z_(p){x, φ(x)/p} is the PD envelope of (x) in Z_(p){x}, and the defining pushout is also a pushout of animated rings. `pd-envelope-as-delta-envelope` (Lemma 2.38, Corollary 2.39, Remark 2.40, Warning 2.41): for a p-torsion-free δ-ring A and a sequence regular modulo p, A{φ(f_i)/p} is discrete, p-torsion-free and equal to the PD envelope D_I(A), which is therefore a δ-ring and the Frobenius pullback of A{f_i/p}; the Frobenius twist cannot be dropped.

`complete-regular-sequence` (Definition 2.42). For an animated ring A, an ideal I = (f) of π_0(A) and a derived I-complete A-algebra B, a sequence x in π_0(B) is I-completely regular relative to A if Kos(A; f) → Kos(B; f, x) is flat. The suggested file states a discrete condition that implies it when the generators of I are regular on A and B: x regular on B/IB with every B/(IB + (x_1..x_k)) flat over A/I. API: `IsRelativelyRegular`, `IsRelativelyRegular.nil`, `IsRelativelyRegular.polynomial`, `IsRelativelyRegular.baseChange`. Tests: `relatively_regular_variable`, `relatively_regular_empty_self`, `relatively_regular_p_fails`, `relatively_regular_non_flat_quotient`. `pd-envelope-complete-flatness` (Lemma 2.43, Corollary 2.44): PD envelopes of sequences whose p-th powers are p-completely regular relative to A, and the δ-algebras B{x_i/p}^∧ for x p-completely regular relative to A, are p-completely flat over A.

### Prisms

`prism` (Definition 3.2). A prism is a δ-ring A with an ideal I such that I is an invertible A-module, A is derived (p, I)-complete, and p ∈ I + φ(I)A. No generator of I is part of the data; p and I lie in the Jacobson radical. API: `Prism`, `Prism.φ`, `Prism.bar`, `Prism.p_mem_pow`, `Prism.exists_distinguished_generator_map`, `Prism.ext`. Tests: `prism_ideal_ne_bot`, `prism_p_squared_fails` (no prism on Z_p with ideal (p²)), `prism_zero_ring`, `prism_ideal_p_implies_torsionfree`. The pairs (Z_p[[q−1]], (q−1)) and (Z, (p)) are not prisms: the first fails p ∈ I + φ(I)A, the second completeness.

`prism-category`. Maps of prisms are δ-maps carrying I into J. A prism is perfect (φ bijective), bounded (A/I has bounded p^∞-torsion), orientable (I principal; an orientation is a generator) or crystalline (I = (p)); maps are (faithfully) flat when (p, I)-completely so. API: `Prism.Hom`, `Prism.Hom.id`, `Prism.Hom.comp`, `Prism.IsBounded`, `Prism.IsPerfect`, `Prism.IsOrientable`, `Prism.IsCrystalline`, `Prism.IsCrystalline.isBounded`, `Prism.IsCrystalline.isOrientable`. Tests: `prism_hom_id_toRingHom`, `prism_hom_map_phi`, `prism_bounded_of_torsionfree_quotient`, `prism_perfect_frobenius_injective`.

The acceptance examples of the layer are constructions with their own API. `crystalline-prism`: (A, (p)) for A p-torsion-free and p-complete, in particular (Z_p, (p)) and (W(k), (p)); API `Prism.crystalline`, `Prism.crystalline_I`, `Prism.crystalline_isCrystalline`, `Prism.padicInt`, `Prism.witt`; tests `crystalline_prism_padic_phi`, `crystalline_prism_padic_perfect`, `crystalline_prism_witt_phi`, `crystalline_prism_bar`. `ainf-prism`: (A_inf(R), ker θ) for R integral perfectoid, a perfect prism with quotient R; API `Prism.ainf`, `Prism.ainf_I`, `Prism.ainf_phi`, `Prism.ainf_isPerfect`, `Prism.ainf_bar_equiv`; tests `ainf_prism_theta_teichmuller`, `ainf_prism_kernel_not_p`, `ainf_prism_perfect_bounded`. `breuil-kisin-prism`: (W(k)[[u]], (E(u))) with φ(u) = u^p and E Eisenstein, bounded and oriented, not perfect; API `Prism.breuilKisin`, `Prism.breuilKisin_I`, `Prism.breuilKisin_phi_X`, `Prism.breuilKisin_isBounded`; tests `breuil_kisin_not_perfect`, `breuil_kisin_not_crystalline`, `breuil_kisin_linear_reduction`. `q-de-rham-prism`: (Z_p[[q−1]], ([p]_q)) with φ(q) = q^p; the ideal is ([p]_q) and not (q−1); API `qAnalog`, `qAnalog_mul_sub_one`, `qAnalog_one_eq`, `Prism.qDeRham`, `Prism.qDeRham_I`, `Prism.qDeRham_phi_q`; tests `q_analog_two`, `q_analog_prime_cyclotomic`, `q_de_rham_ideal_not_q_minus_one`, `q_de_rham_p_mem`. `universal-oriented-prism`: the (p, d)-completion of Z_(p){d, δ(d)^{-1}} with I = (d), universal among oriented prisms, with (p, d) regular; API `Prism.Oriented`, `Prism.Oriented.isDistinguished`, `Prism.Oriented.generator_mem_nonZeroDivisors`, `Prism.Oriented.isOrientable`; tests `oriented_padic`, `oriented_generator_unique_up_to_unit`, `oriented_not_unit`.

`rigidity-prism-ideal` (Lemma 3.5): a map of prisms (A, I) → (B, J) induces I ⊗_A B ≅ J, so J = IB; and for a δ-map A → B with B derived (p, I)-complete, (B, IB) is a prism exactly when B[I] = 0. `prism-frobenius-ideal-principal` (Lemma 3.6): φ(I)A is principal, generated by a distinguished element, and φ^*I and I^p are trivial. `bounded-prism-complete-flatness` (Lemma 3.7): over a bounded prism, A is classically (p, I)-complete; a derived (p, I)-complete, (p, I)-completely flat complex is discrete and classically complete with M[I^n] = 0 and bounded p^∞-torsion in M/I^n; flat maps of prisms are the completely flat complete δ-algebras; and there is a faithfully flat map to an oriented prism. The derived completeness of M and of B is a hypothesis: the printed statement omits it and the atlas's register of source mistakes records the correction. `transversal-prism-regular-sequences` (Anschütz–Le Bras, Lemma 2.1.7): if (p, d) is regular then so are (p, φ^r(d)) and (φ^r(d), φ^s(d)) for r ≠ s. `unbounded-torsion-example` (Anschütz–Le Bras, Example A.4): a classically (p, f)-complete ring R with f a nonzerodivisor and R/f of bounded p^∞-torsion whose own p^∞-torsion is unbounded, since p^i·x_{i,0} = f^i·x_{i,i} ≠ 0 and p^(i+1)·x_{i,0} = 0. It shows why boundedness is a condition on A/I. API: `UnboundedTorsion.Rel`, `UnboundedTorsion.Ring`, `UnboundedTorsion.p_pow_mul_x`, `UnboundedTorsion.p_pow_succ_mul_x`; tests `unbounded_torsion_order_two`, `unbounded_torsion_nonzero`, `unbounded_torsion_no_bound`.

### Perfect prisms and perfectoid rings

`perfect-prism-properties` (Lemma 3.8): the ideal of a perfect prism is generated by a distinguished nonzerodivisor and the prism is bounded. `prism-perfection` (Lemma 3.9): for a prism (A, I), A_perf = colim_φ A has I·A_perf = (d) with d distinguished, d and p nonzerodivisors and (A_perf/d)[p^∞] = (A_perf/d)[p]; the (p, I)-completion is the universal perfect prism under (A, I). API: `Perfection`, `Perfection.exists`, `Perfection.lift`, `Perfection.lift_comp`, `Perfection.p_mem_nonZeroDivisors`, `Prism.perfection_generator`. Tests: `perfection_of_perfect_prism`, `perfection_padic`, `perfection_kills_frobenius_kernel`.

`perfect-prisms-perfectoid-rings` (Theorem 3.10). The functors R ↦ (A_inf(R), ker θ) and (A, I) ↦ A/I are inverse equivalences between integral perfectoid rings and perfect prisms. This is a theorem proved from `ainf-prism`, `perfect-prism-properties`, `perfect-delta-rings` and `rigidity-prism-ideal`; neither category is defined through the other. `perfectoid-tor-independence`: for perfectoid S ← R → T the p-completed derived tensor product is discrete and perfectoid, and the completed tensor product of the perfect prisms is a perfect prism; it reduces modulo p to Tor-independence of perfect F_p-algebras, requested from EnhancedDerivedSheaves E1.

### Prismatic envelopes

`regular-prismatic-envelopes` (Proposition 3.13). Let (A, I) be a bounded prism, B a (p, I)-completely flat complete δ-A-algebra and J ⊃ IB an ideal that is, Zariski locally, generated by I and a sequence (p, I)-completely regular relative to A. Then there is a universal map of δ-pairs (B, J) → (C, IC) to a prism over (A, I), written C = B{J/I}^∧; it is (p, I)-completely flat over A, commutes with base change of bounded prisms and with completely flat localization on B. For I = (d) it is the derived completion of B{x_i/d}, shown to be discrete and d-torsion-free; the flatness is proved by base change from the universal oriented prism and reduction to `pd-envelope-complete-flatness` after a Frobenius pullback. C is in general not completely flat over B. API: `Envelope`, `Envelope.lift`, `Envelope.lift_z`, `Envelope.hom_ext`, `Envelope.unique`, `Envelope.exists`. Tests: `envelope_trivial`, `envelope_divisible_element`, `envelope_z_unique`, `envelope_delta_z` (φ(d)·δ(z) = δ(x) − z^p·δ(d)), `envelope_not_localization`. The comparison with PD envelopes that the layer asks for is `pd-envelope-as-delta-envelope` together with the crystalline case of this proposition. `prismatic-envelope-rank-one-presentation` (Anschütz–Le Bras, Lemma 4.9.4): for d distinguished and x of rank one there are elements z_n of A{x/d}^∧ with φ^n(d)·φ^(n−1)(d)^p ⋯ d^(p^n)·z_n = x^(p^n), and δ^n(x/d) ∈ A[z_0, …, z_n].

### Dependencies and acceptance

Inside the roadmap this part rests on Sections 1–9 and is the input of every layer that follows. From other roadmaps it requests: CrystallineCohomology:CR.0 (PD envelopes with universal property, the polynomial case, flat base change, p-completion); DerivedDeRhamCohomology:DD.1 (derived completion, complete flatness, the bounded-torsion criterion, completed descent, Elkik algebraization and van der Kallen's theorem); EnhancedDerivedSheaves:E1 (Tor-independence of perfect F_p-algebras). It cites the animation nodes of EnhancedDerivedSheaves E5:animation and the integral perfectoid definition of PerfectoidQuotients Q0:integral-algebra.

Acceptance for the layer: the four prisms (W(k), (p)), (A_inf, ker θ), (W(k)[[u]], (E(u))) and (Z_p[[q−1]], ([p]_q)) with each Cartier, completeness and distinguished condition proved; a δ-ring that is not a prism (Z_p with (p²), or Z_p[[q−1]] with (q−1)); the envelope Z_p{x/p}^∧ and its Frobenius pullback to a PD envelope; the equivalence of Theorem 3.10 on O_C, on a perfect F_p-algebra and on the perfection of the q-de Rham prism.

# Layer PR.1. Relative sites and the basic comparisons

**Scope.** For a bounded prism (A, I) and a smooth p-adic formal scheme X over A/I, this stage
builds the prismatic site (X/A)_Δ, its two structure sheaves, prismatic and Hodge–Tate
cohomology with their Frobenius, the Čech–Alexander complexes that compute them, and the
crystalline, Hodge–Tate and de Rham comparison theorems, with base change and perfectness for
proper X. Sources: Bhatt–Scholze, *Prisms and prismatic cohomology*, Corollary 3.12 and §§4–6;
Anschütz–Le Bras, *Prismatic Dieudonné theory*, Remark 3.1.8 and Lemma 5.1.6. The stage has 26
nodes; Lean names live in `TauCeti.Prismatic.Site`, `.HodgeTate`, `.Crystalline` and `.DeRham`.

**Conventions.** A prism is bounded when A/I has bounded p^∞-torsion. Completions are derived;
over a bounded prism they agree with classical ones on completely flat modules. A map of prisms
(B, J) → (C, JC) is a *flat cover* when C is (p, J)-completely faithfully flat over B. An
A/I-algebra R is *p-completely smooth* when it is derived p-complete and R ⊗^L_{A/I} (A/I)/p is a
smooth (A/I)/p-algebra in degree 0. Sites are written with morphisms opposite to ring maps; for
X = Spf(R) the algebraic language is used, so an object mapping to all others as a ring is
"weakly initial". For an A/I-module M and an integer i, M{i} := M ⊗_{A/I} (I/I²)^{⊗ i}; these
twists of A/I-modules are the only twists of this stage (the twists A{n} of the prism belong to
PR.3). Ω^i denotes p-completed differential forms.

### The site and its sheaves

`prismatic-structure-sheaf` (Corollary 3.12). The opposite of the category of bounded prisms,
with the topology generated by flat covers, is a site: a cover (A, I) → (B, IB) has a pushout
along any map (A, I) → (C, IC), namely the derived (p, I)-completion of B ⊗^L_A C, which is
discrete and again a bounded prism. The presheaves O : (B, J) ↦ B and Ō : (B, J) ↦ B/J are
sheaves, and for a flat cover the augmented Čech nerve A → B^• is a limit diagram in D(A), so
both sheaves have no higher cohomology on any object. API: `Site.BoundedPrism`,
`Site.IsFlatCover`, `BoundedPrism.flatTopology`, `BoundedPrism.pushout`,
`BoundedPrism.structurePresheaf`, `BoundedPrism.reducedStructurePresheaf`,
`BoundedPrism.structurePresheaf_isSheaf`, `BoundedPrism.cechComplex`,
`BoundedPrism.cechComplex_exact`. Tests: `pr1_structure_presheaf_obj` (O(B, J) = B),
`pr1_flat_cover_id`, `pr1_flat_cover_base_change`, and the non-example `pr1_non_flat_not_cover`
(Z_p⟨x⟩ → Z_p, x ↦ 0, is not a cover).

`relative-prismatic-site` (Definition 4.1, Remark 4.3). Objects of (X/A)_Δ are bounded prisms
(B, IB) under (A, I) with a map Spf(B/IB) → X over A/I; covers are flat covers; O_Δ and Ō_Δ are
the restrictions of O and Ō, with Ō_Δ = O_Δ ⊗_A A/I. Equivalently (X/A)_Δ is the category of
elements of the sheaf h_X on the slice (∗/A)_Δ, which gives functoriality in X. API:
`Site.RelativePrism`, `RelativePrism.ideal_eq_map` (rigidity: the ideal is IB),
`RelativePrism.flatTopology`, `RelativePrism.structureSheaf`,
`RelativePrism.reducedStructureSheaf`, `RelativePrism.structureSheaf_isSheaf`,
`RelativePrism.forget`, `RelativePrism.restrict`, `RelativePrism.base`. Tests:
`pr1_relative_site_base_terminal` ((A, id, id) is final for R = A/I),
`pr1_relative_site_sheaf_obj`, `pr1_relative_site_ideal_rigid`, `pr1_relative_site_restrict_id`.

`prismatic-to-etale-morphism` (Construction 4.4). The functor (B, IB) ↦ Spf(B/IB) to formal
schemes over X with the étale topology is cocontinuous, because p-completely étale covers of
B/IB lift uniquely to (p, I)-completely étale δ-B-algebras; it gives ν : Shv((X/A)_Δ) →
Shv(X_ét) with (ν_*F)(U) = H^0((U/A)_Δ, F). `change-of-topology` (Remark 4.5): the Zariski,
Nisnevich, étale and flat topologies on the same category compute the same cohomology of O_Δ,
Ō_Δ and of crystals in complete complexes.

`relative-prismatic-cohomology`. Δ_{X/A} := Rν_*O_Δ ∈ D(X_ét, A) and Δ_{R/A} := RΓ((R/A)_Δ,
O_Δ) ∈ D(A): derived (p, I)-complete commutative algebra objects in degrees ≥ 0, functorial in R
and in the prism. API: `Site.cohomologyEval`, `Site.cohomologyUnit`, `Site.cohomologyMap` with
`cohomologyMap_id`, `cohomologyMap_comp`, `Site.cohomologyBaseChangeMap`,
`Site.cohomology_isZero_of_neg`. Tests: `pr1_cohomology_base` (Δ_{(A/I)/A} = A),
`pr1_cohomology_unit_natural`, `pr1_cohomology_base_degrees`, `pr1_cohomology_not_discrete`.

`hodge-tate-cohomology`. Δ̄_{X/A} := Rν_*Ō_Δ = Δ_{X/A} ⊗^L_A A/I ∈ D(X_ét, O_X), with the
triangles Δ̄{i+1} → Δ ⊗^L_A I^i/I^{i+2} → Δ̄{i}. API: `HodgeTate.Twist`, `twistZero`, `twistAdd`,
`twistOfOrientation`, `HodgeTate.reduction`, `HodgeTate.structureMap`, `HodgeTate.cohomologyMap`.
Tests: `pr1_twist_zero`, `pr1_twist_oriented`, `pr1_hodge_tate_base`,
`pr1_hodge_tate_not_discrete`.

### Čech–Alexander complexes, Frobenius, stability

`cech-alexander-complex` (Constructions 4.17–4.18, Remark 4.19). For a surjection B_0 → R from
a completed polynomial A-algebra, let B be the completed free δ-A-algebra on B_0 and C the
prismatic envelope of (B, ker(B → R′)); then (C → C/IC ← R) is weakly initial, C is completely
flat over A, and applying the construction to the Čech nerve of A → B_0 gives its Čech nerve
C^•. The choice B_0 = A[x_r : r ∈ R]^∧ is functorial in R; for R = A/I⟨X_1,…,X_n⟩ the choice
A⟨X_1,…,X_n⟩ commutes with base change of the prism. For infinitely many variables the envelope
is a completed filtered colimit of the envelopes of PR.0; this step is missing in the printed
text (source issue E12). API: `Site.weaklyInitial`, `weaklyInitial_hom_nonempty`,
`weaklyInitial_flat`, `Site.cechAlexander`, `cechAlexander_obj_zero`,
`Site.cechAlexanderComplex`, `cechAlexander_baseChange`. Tests: `pr1_cech_alexander_base`,
`pr1_cech_alexander_affine_line` (C^0 = A{X}^∧, C^1 = A{X,Y}{(X−Y)/I}^∧),
`pr1_weakly_initial_not_initial`.

`cech-alexander-computes-cohomology`: Δ_{R/A} ≃ lim C^• and Δ̄_{R/A} ≃ lim C^•/IC^•, by Čech
descent for a weakly final object and the acyclicity of O on objects; the result is independent
of the presentation because presentations form a sifted category. This is the coordinate
independence of the stage.

`frobenius-on-prismatic-cohomology`. The Frobenius lifts φ_B(x) = x^p + pδ(x) form a
φ_A-semilinear endomorphism of O_Δ, hence φ : Δ_{R/A} → φ_{A,*}Δ_{R/A} and its linearisation
φ_A^*Δ_{R/A} → Δ_{R/A}. API: `RelativePrism.sheafFrobenius`,
`RelativePrism.sheafFrobenius_structureMap`, `Site.frobenius_naturality`,
`Site.frobeniusLinearization`. Tests: `pr1_frobenius_sheaf_component`,
`pr1_frobenius_trivial_base`, `pr1_frobenius_not_linear`.

`base-change-finite-tor-amplitude` (Lemmas 4.20, 4.22): for a map of bounded prisms A → A′ of
finite (p, I)-complete Tor amplitude, Δ_{R/A} ⊗̂^L_A A′ ≃ Δ_{R′/A′}; termwise the statement holds
for every map of bounded prisms. `etale-localization` (Lemma 4.21): for a p-completely étale
map R → S, Δ̄_{R/A} ⊗̂^L_R S ≃ Δ̄_{S/A}, through the left adjoint (R/A)_Δ → (S/A)_Δ given by
étale lifting. `perfect-prism-initial` (Lemma 4.8): a ring map A/I → B/J out of the reduction
of a perfect prism lifts uniquely to a map of prisms.

### The comparison theorems

`bockstein-differential` (Construction 4.9). The connecting maps of the triangles above are
β_I : H^i(Δ̄){i} → H^{i+1}(Δ̄){i+1}; (H^*(Δ̄){∗}, β_I) is a graded-commutative differential graded
A/I-algebra, with η^0 : R → H^0(Δ̄) and η^1 : Ω^1 → H^1(Δ̄){1}, f dg ↦ f β_I(g). API:
`HodgeTate.twistedCohomology`, `HodgeTate.bockstein`, `bockstein_comp_bockstein`,
`HodgeTate.cup`, `bockstein_cup`, `HodgeTate.eta0`, `HodgeTate.eta1`. Tests:
`pr1_bockstein_eta1_d`, `pr1_bockstein_base_zero`, `pr1_bockstein_not_linear`.

`relative-frobenius-cosimplicial-lemma` (Lemma 5.4): for a polynomial algebra B over a ring k of
characteristic p with Čech nerve B^•, and any cosimplicial B^{•,(1)}-module N, the map
N → N ⊗_{B^{•,(1)}} B^• is a quasi-isomorphism of unnormalised complexes.

`crystalline-comparison` (Theorem 5.2). For a crystalline prism (A, (p)), a PD ideal I ∋ p and R
smooth over A/I, with R^{(1)} := R ⊗_{A/I,ψ} A/p (ψ induced by Frobenius), there is a canonical
Frobenius-compatible isomorphism Δ_{R^{(1)}/A} ≃ RΓ_crys(R/A) of E_∞-A-algebras. The proof
compares φ_A^*C^• with the cosimplicial PD envelope D^• = B^•{φ(J^•)/p}^∧ through the relative
Frobenius and Lemma 5.4. The twist is essential: for I = (p) the statement reads
φ_A^*Δ_{R/A} ≃ RΓ_crys(R/A), not Δ_{R/A} ≃ RΓ_crys(R/A). `crystalline-comparison-syntomic`
(Anschütz–Le Bras, Remark 3.1.8) extends this to syntomic A/J-algebras, for the cohomology of
the site; the passage to quasisyntomic F_p-algebras by descent is done in PR.2.

`hodge-tate-comparison-char-p` (Corollary 5.5). Over a crystalline prism and for S smooth over
A/p: β_p(f)² = 0, the map η^* exists and is an isomorphism Ω^i_{S/(A/p)} ≅ H^i(Δ̄_{S/A}), and
S ↦ Δ_{S/A} commutes with base change of crystalline prisms. The proof reduces to F_p[X] over
Z_p and uses the crystalline comparison and the Cartier isomorphism of
`DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`; under it η^1(dx) is the class of
x^{p−1}dx.

`crystallization-of-oriented-prism` (Construction 6.1). For an oriented prism (A, (d)) with
A/(d) p-torsion-free and A/(p, d) → A/(p, d^p) flat, B := A{φ(d)/p}^∧ is the p-completed PD
envelope of (d), and α := can ∘ φ_A is a map of prisms (A, (d)) → (B, (p)) whose completed base
change is conservative, of finite Tor amplitude, and commutes with Δ. API:
`Crystalline.crystallization`, `crystallizationCan`, `crystallizationMap`,
`crystallizationMap_apply`, `crystallization_isCrystalline`, `crystallization_frobenius_unit`,
`crystallization_cohomology`. Tests: `pr1_crystallization_alpha_d`,
`pr1_crystallization_alpha_eq`, `pr1_crystallization_can_not_prism_map`.

`hodge-tate-affine-line` (Proposition 6.2, Lemma 4.10): for R = A/I⟨X⟩, η^0 and η^1 are
isomorphisms and H^i(Δ̄) = 0 for i > 1; hence β_I(f)² = 0 for every local function f, also for
p = 2. `hodge-tate-comparison-map` (Construction 4.9) then extends η^0, η^1 uniquely to a map of
commutative differential graded algebras η^* : (Ω^*_{X/(A/I)}, d) → (H^*(Δ̄_{X/A}){∗}, β_I). API:
`HodgeTate.comparisonMap`, `comparisonMap_one`, `comparisonMap_wedge`, `comparisonMap_d`,
`bockstein_eta0_cup_self`. Tests: `pr1_comparison_map_one_formula`, `pr1_comparison_map_base`,
`pr1_comparison_map_square_zero`.

`hodge-tate-comparison` (Theorems 4.11 = 6.3). For every bounded prism and smooth X, η^*_X is an
isomorphism; Δ̄_{X/A} is a perfect complex with H^i(Δ̄_{X/A}) ≅ Ω^i_{X/(A/I)}{−i}. There is no
Frobenius twist. `prismatic-base-change` (Corollary 4.12): (g^*Δ_{X/A})^∧ ≅ Δ_{X_B/B} for every
map of bounded prisms; on global sections for X quasi-compact and quasi-separated (the printed
Theorem 1.8 (5) omits this hypothesis, source issue E13); as a consequence, over a crystalline
prism, RΓ_crys(X/A) ≃ RΓ_Δ(X/A) ⊗̂^L_{A,φ_A} A.

`de-rham-comparison` (Theorem 6.4). **Hypothesis: W(A/I) is p-torsion-free** (for example A/I
p-torsion-free, or I = (p) with A/p reduced). Then Δ_{X/A} ⊗̂^L_{A,φ_A} A/I ≃ Ω^*_{X/(A/I)} as
commutative algebra objects of D(X_ét, A/I); more precisely Δ_{R/A} ⊗̂^L_{A,ψ} W(A/I) ≃
RΓ_crys((R/p)/W(A/I)) with ψ the Frobenius-twisted δ-map A → W(A/I). The reduction is along
φ_A; the untwisted reduction is Hodge–Tate cohomology, a different object. The statement for
all bounded prisms is `PrismaticCohomology:PR.3/de-rham-comparison-general` and is not claimed
here.

`proper-smooth-perfectness` (Theorem 1.8, last sentence): for X proper and smooth over A/I,
RΓ_Δ(X/A) is a perfect complex of A-modules. `p-torsion-free-h0-syntomic` (Anschütz–Le Bras,
Lemma 5.1.6): for A p-torsion-free and S p-completely syntomic over A/I, H^0((S/A)_Δ, O_Δ) is
p-torsion-free. `acceptance-computations` collects the four acceptance examples below.

### Dependencies

Inside the roadmap: PR.0 (prisms and their maps, rigidity, complete flatness over bounded
prisms, free δ-rings, regular prismatic envelopes, the PD envelope as a δ-envelope, crystalline
prisms, perfect prisms; and, at stage level, Lemma 2.18, Example 3.4 and Lemma 3.7 (4)). From
other roadmaps: `DerivedDeRhamCohomology:DD.0` (cotangent complex of Witt vectors), `DD.1`
(derived completion, complete flatness and descent, Lemma 4.22, Elkik), `DD.2` (completed de
Rham complex and its universal property), `DD.3/polynomial-cartier-map`, `DD.5` (coherent
perfectness for proper smooth formal schemes); `CrystallineCohomology:CR.0` (PD envelopes),
`CR.1` (big crystalline site), `CR.2` (Čech–Alexander computation, de Rham comparison of a
lift), `CR.3` (Frobenius); `EnhancedDerivedSheaves:E2` (Čech descent, slice topoi);
`SchemeAndStackFoundations:SF.2` and `SF.4` (étale site and geometry of p-adic formal schemes).
Consumers: PR.2, PR.3, PR.5, PR.6, `PerfectoidQuotients:Q1`, `AInfCohomology:AI.7`,
`RefinedTraceMethods:RT.6`.

### Gaps and source issues

One gap: for a general p-torsion-free bounded prism, the p-torsion-freeness of a derived
complete, (p, I)-completely flat A-module, needed by `p-torsion-free-h0-syntomic`. It is proved
when the pro-system ((A/I^n)[p])_n is pro-zero (crystalline prisms; prisms with (p, d) regular,
such as A_inf and Breuil–Kisin prisms). Source issues recorded: E11 (index set in the proof of
Lemma 5.4), E12 (envelopes for presentations in infinitely many variables), E13 (quasi-compact
and quasi-separated hypothesis in Theorem 1.8 (5)), E14 (the step above in the proof of
Anschütz–Le Bras Lemma 5.1.6).

### Acceptance tests

1. *Smooth polynomial algebra.* For R = A/I⟨X_1,…,X_n⟩, H^*(Δ̄_{R/A}){∗} is the exterior algebra
   over R on β_I(X_1),…,β_I(X_n).
2. *Étale chart.* For a p-completely étale A/I⟨X_1,…,X_n⟩ → S, Δ̄_{S/A} ≃ Δ̄_{A/I⟨X⟩/A} ⊗̂^L S and
   H^i(Δ̄_{S/A}){i} ≅ Ω^i_{S/(A/I)}.
3. *Crystalline base.* Δ_{F_p[X]/Z_p} is the de Rham complex of Z_p⟨X⟩, and β_p(X) is the class
   of X^{p−1}dX.
4. *Frobenius-twisted coefficient map.* For k = F_{p²} and an elliptic curve R̃ over k with
   j-invariant outside F_p, RΓ_crys(R̃/W(k)) ≃ φ^*Δ_{R̃/W(k)} ≃ Δ_{R̃^{(1)}/W(k)}, and R̃^{(1)} is not
   isomorphic to R̃.

# Layer PR.2. Derived extension, semiperfectoid inputs and descent

This layer extends the prismatic cohomology of PR.1 from p-completely smooth algebras to all derived p-complete simplicial (animated) algebras, computes it on quasiregular semiperfectoid rings, proves the descent and base-change formulas, and constructs the perfected theory. Sources: Bhatt–Scholze, *Prisms and prismatic cohomology*, §7.2, Proposition 7.11 and §8.1 with Proposition 8.13 and Corollary 8.14; Bhatt–Morrow–Scholze, *Topological Hochschild homology and integral p-adic Hodge theory* (BMS2), §4; Anschütz–Le Bras, *Prismatic Dieudonné theory* (ALB), §§3.1–3.5 and the appendix.

**Conventions.** p is a fixed prime and (A, I) a bounded prism. D(A) is the derived ∞-category with cohomological indexing, D_comp(A) its derived (p, I)-complete objects with the completed tensor product ⊗̂; "discrete" means concentrated in degree 0. A derived p-complete simplicial A/I-algebra is an animated A/I-algebra whose underlying complex is derived p-complete. M{n} = M ⊗ (I/I²)^{⊗n} is the Breuil–Kisin twist. For a perfect prism, R = A/I is perfectoid, I = (d), A = A_inf(R). Names lie in `TauCeti.Prismatic.Derived`, `TauCeti.Prismatic.Semiperfectoid` and `TauCeti.Prismatic.Perfection`.

**Imported, not planned here.** Animated rings and sifted left Kan extension: EnhancedDerivedSheaves E5:animation and E3. E_∞-algebras and Mathew's descendability: E5:abstract. The cotangent complex, derived exterior and divided powers, quasisyntomic maps: DerivedDeRhamCohomology DD.0. Derived completion, p-complete flatness and the bounded-torsion lemmas of BMS2 §4.1: DD.1. Derived de Rham cohomology and its comparison with A_crys: DD.2, DD.4. The quasisyntomic site, the definition of quasiregular semiperfectoid rings (BMS2 Definition 4.20 = BS Notation 7.1), covers by such rings, unfolding and flat descent for cotangent powers: DD.5. No layer text states that definition explicitly; the PerfectoidQuotients packet assigns it to DD.0/DD.5, and this layer requests it from DD.5 instead of defining it a second time. PD envelopes and A_crys: CrystallineCohomology CR.0. Perfectoid rings: PerfectoidQuotients Q0:integral-algebra; BS Lemma 4.8 (maps out of a perfect prism): Q0:animated-application. Faithfully flat descent of modules: SchemeAndStackFoundations SF.1. BS Proposition 7.2, Corollary 7.3 and Theorems 7.4, 7.14 belong to PerfectoidQuotients Q2–Q4 and are not prerequisites of anything below.

### 1. The derived functor and the conjugate filtration

`derived-prismatic-cohomology` (BS Construction 7.6). Let CAlg_φ(D_comp(A)) be commutative algebras E in D_comp(A) with an algebra map φ_E : E → φ_{A,*}E. PR.1 gives R ↦ (Δ_{R/A}, φ_R) on p-completely smooth algebras, coherently through Čech–Alexander complexes. Derived prismatic cohomology is its left Kan extension to derived p-complete simplicial A/I-algebras, with completed colimits: the unique sifted-colimit-preserving functor restricting to PR.1's on p-completed polynomial algebras, so Δ_{R/A} = (colim Δ_{P_n/A})^∧ for a polynomial resolution P_• → R, independently of the resolution. It carries the unit A → Δ_{R/A}, the Frobenius φ_R, and Δ̄_{R/A} := Δ_{R/A} ⊗^L_A A/I with R → Δ̄_{R/A}. API: `cohomology`, `map`, `map_id`, `map_comp`, `frobenius`, `frobenius_naturality`, `hodgeTate`, `unit`, `constIso`. Tests: `pr2_derived_base_ring` (Δ_{(A/I)/A} = A), `pr2_derived_const_agrees`, `pr2_derived_product` (Δ of A/I × A/I is A × A), `pr2_derived_not_pi0_invariant`, `pr2_derived_frobenius_natural_id`.

`conjugate-filtration`. Fil_•^conj Δ̄_{R/A} is the completed left Kan extension of the canonical filtration τ^{≤i}Δ̄ on smooth algebras: increasing, N-indexed, exhaustive, multiplicative, with Fil_0 = R. It is not the Postnikov filtration outside the smooth case. API: `conjFil`, `conjFilMap`, `conjFilMap_refl`, `conjFilMap_trans`, `conjFilι`, `conjFilMap_ι`, `conjFilZeroIso`, `conjGr`. Tests: `pr2_conj_fil_zero`, `pr2_conj_fil_base`, `pr2_conj_fil_smooth_truncation`, `pr2_conj_fil_not_postnikov` (for a nonzero regular quotient (A/I)/(f), Δ̄ is discrete and no Fil_i → Δ̄ is an isomorphism).

`derived-hodge-tate-comparison`. For every R and i ≥ 0, gr_i^conj Δ̄_{R/A} ≃ (∧^i L_{R/(A/I)}){−i}[−i]^∧, naturally and multiplicatively. Three consequences are part of the theorem. If R is discrete with bounded p^∞-torsion and L_{R/(A/I)} has p-complete Tor-amplitude in [−1, 0], then Δ̄_{R/A} ∈ D^{≥0}. If moreover L_{R/(A/I)}[−1] is p-completely flat, then gr_i = Γ^i(L[−1]){−i}^∧, Δ̄_{R/A} is discrete and p-completely faithfully flat over R, and Δ_{R/A} is discrete and I-torsion-free. If L^∧ = 0 then Δ̄_{R/A} = R.

`first-conjugate-piece-cotangent` (ALB Proposition 3.2.1). There is a canonical isomorphism (L_{R/A}{−1}[−1])^∧ ≃ Fil_1^conj Δ̄_{R/A}, with the cotangent complex taken over A, carrying the transitivity triangle of A → A/I → R to Fil_0 → Fil_1 → gr_1; it glues over p-adic formal schemes. `conjugate-splitting-and-lifting` (ALB Corollary 3.2.3). For X p-completely flat over A/I, the extension Fil_0 → Fil_1 → gr_1 splits exactly when X lifts to a p-completely flat formal scheme over A/I²; its class is, up to sign, Illusie's obstruction class.

### 2. Descent, base change and Künneth

`derived-prismatic-etale-descent` (BS 7.6 (2), ALB Proposition 3.1.11). Δ̄_{R/A} ⊗̂_R R′ ≃ Δ̄_{R′/A} for p-completely étale R → R′; R ↦ Δ_{R/A} is a p-completely étale sheaf; hence Δ_{X/A} in D(X_ét, A) for a p-adic formal scheme X, with RΓ(Spf R, Δ_{X/A}) = Δ_{R/A} and the filtered Δ̄_{X/A}.

`derived-prismatic-base-change` (BS 7.6 (4)). For a map of bounded prisms (A, I) → (B, J) and R_B = (R ⊗^L_A B)^∧, the map Δ_{R/A} ⊗̂^L_A B → Δ_{R_B/B} is an isomorphism, compatible with Frobenius and conjugate filtrations; no flatness is assumed. This is the formula PerfectoidQuotients Q2–Q4 use.

`kunneth-formula` (BS 7.6 (5), ALB Proposition 3.5.1). Δ_{−/A} commutes with all colimits: Δ_{R_1/A} ⊗̂^L_{Δ_{R_3/A}} Δ_{R_2/A} ≃ Δ_{(R_1 ⊗̂^L_{R_3} R_2)/A}. `kunneth-formula-formal-schemes` (ALB Corollary 3.5.2): for quasi-compact quasi-separated p-completely smooth X, Y, RΓ(X × Y, Δ) ≃ RΓ(X, Δ) ⊗̂^L_A RΓ(Y, Δ).

`quasisyntomic-descent` (BS 7.6 (3), BMS2 §4). Let C_{A/I} be the p-complete A/I-algebras B with bounded p^∞-torsion and L_{B/(A/I)} of p-complete Tor-amplitude in [−1, 0]. For a quasisyntomic cover B → C in C_{A/I}, Δ_{B/A} ≃ lim Δ_{C^•/A}, and likewise for Δ̄ and each Fil_i^conj. For a perfect prism, C_{A/I} contains all of QSyn_{A/I} (BMS2 Lemma 4.34), which is the statement of the source; and Δ_{B/A} = lim Δ_{S^•} for a cover B → S by a quasiregular semiperfectoid ring: Δ on QSyn is the unfolding of S ↦ Δ_S. The proof needs the uniform coconnectivity of the graded pieces; for a flat cover without cotangent control it does not apply.

`quasisyntomic-covers-lift-to-prisms` (BS Proposition 7.11). For a quasisyntomic A/I-algebra R there is (B, IB) in (R/A)_Δ with R → B/IB p-completely faithfully flat, namely B = Δ_{S/A} for S obtained by extracting p-power roots of generators; (A, I) → (B, IB) is flat, faithfully flat when A/I → R is, and the same holds for the perfection when A is perfect. PerfectoidQuotients Q3 uses it for André's lemma.

`finite-projective-modules-p-complete` (ALB Appendix A, Lemma A.1) and `finite-projective-descent-prisms` (ALB Appendix A, Proposition A.3). Finite projective modules over a derived p-complete ring with bounded p^∞-torsion are compatible systems modulo p^n and form a stack for the p-completely faithfully flat topology; finite projective A-modules form a stack on bounded prisms for the faithfully flat topology.

### 3. Site cohomology, discreteness and quasiregular semiperfectoid rings

`comparison-to-prisms`. For every prism (B, J) over (A, I) with a map π_0(R) → B/J there is a natural map Δ_{R/A} → B of algebras commuting with Frobenius; together they give c_R : Δ_{R/A} → RΓ((π_0(R)/A)_Δ, O_Δ). The target depends only on π_0(R) and lies in D^{≥0}; the source does not. API: `toPrism`, `toPrism_frobenius`, `toPrism_naturality`, `siteCohomology`, `toSite`, `toSite_isIso_of_smooth`. Tests: `pr2_to_prism_base`, `pr2_to_site_smooth`, `pr2_to_site_not_iso`, `pr2_to_prism_frobenius_base`.

`derived-agrees-with-site` (BS 7.6 (1), Lemma 7.7). For p-completely smooth R the derived value is the site cohomology. If Δ̄_{R/A} is discrete, then Δ_{R/A} is a δ-A-algebra, (Δ_{R/A}, IΔ_{R/A}) is a prism over (A, I) with a map from R, it is weakly initial among such prisms, and the initial object is the image of an idempotent of it. Initiality itself is conjectured by the source and proved in the two cases below. `idempotent-retract-initial-object` (Lemma 7.8) is the categorical input: in an idempotent complete category C, a section F of the projection X/C → C makes a retract of X initial.

`regular-quotient-prismatic-envelope` (BS Example 7.9). For f_1,…,f_r Koszul-regular on A/I and R = A/(I, f) of bounded p^∞-torsion: gr_i^conj is free, Δ_{R/A} is the initial object of (R/A)_Δ, and Δ_{R/A} = A{f_1/d,…,f_r/d}^∧, the prismatic envelope of PR.0, when I = (d).

`qrsp-prism` (BS Proposition 7.10, ALB Proposition 3.4.1). For S quasiregular semiperfectoid and any perfectoid R → S with (A, I) = (A_inf(R), ker θ): Δ̄_{S/A} is discrete and p-completely faithfully flat over S, Δ_{S/A} is a bounded prism and is the initial object among all prisms with a map from S; so Δ_S := Δ_{S/A} is independent of R and equals the site cohomology in its bounded and unbounded forms. The category of all prisms is meant, as in the registered correction PAPER-BHATT-SCHOLZE-22/E5.

`derived-crystalline-comparison`. For k perfect and A = W(k): Δ_{S/A} ⊗̂_{A,φ} A ≃ Δ_{S^{(1)}/A} ≃ dR^∧_{S/A} for every derived p-complete simplicial k-algebra S, the left Kan extension of BS Theorem 5.2. `qrsp-char-p-acrys` (ALB Lemma 3.4.2, Remarks 3.4.3, 3.1.8). For S quasiregular semiperfect, Δ_S ≃ A_crys(S) as δ-rings, φ-semilinearly over W(S^♭); for S = k/(x), Δ_S = W(k){[x]/p}^∧ and A_crys(S) = W(k){[x]^p/p}^∧; the comparison extends by descent to quasisyntomic F_p-algebras. ALB's proof uses the Nygaard filtration of PR.3; the route here does not.

### 4. Perfection

`perfection-of-prismatic-cohomology` (BS Definition 8.2). Over a perfect prism, Δ_{S/A,perf} := (colim_φ Δ_{S/A})^∧ with its Frobenius automorphism and can : Δ_{S/A} → Δ_{S/A,perf}, and S_perfd := Δ_{S/A,perf} ⊗^L_A A/I. API: `perfection`, `perfectoidization`, `toPerfection`, `perfectionFrobenius`, `toPerfection_frobenius`, `isIso_toPerfection`, `fromRing`. Tests: `pr2_perfection_base`, `pr2_perfectoidization_base`, `pr2_perfectoidization_char_p_discrete`, `pr2_perfection_not_prismatic`.

`perfection-comparison`. can is the universal map to an algebra with invertible Frobenius, an equivalence exactly when φ_S is; for S perfectoid both theories give A_inf(S); over (Z_p, (p)), S_perfd = colim_φ S (BS Example 8.3); for S = F_p[x] the two differ. The perfected theory is a second theory, not a replacement.

`perfectoidization-coconnective` (Lemma 8.4): Δ_{S/A,perf}, S_perfd ∈ D^{≥0}, and H^0(Δ_{S/A,perf}) is a perfect p-torsion-free δ-ring in which d is a nonzerodivisor. `perfection-descendable` (Lemma 8.6): for T = R[X_1,…,X_n]^∧ and T_∞ = R[X_i^{1/p^∞}]^∧, Δ_{T/A} → Δ_{T_∞/A} and its perfection are descendable. `perfectoidization-symmetric-monoidal` (Proposition 8.13): S_{1,perfd} ⊗̂^L_{S_{3,perfd}} S_{2,perfd} ≃ (S_1 ⊗̂^L_{S_3} S_2)_perfd. `connective-perfectoidization-perfectoid` (Corollary 8.14): if S_perfd is connective it is a perfectoid ring and S → S_perfd is universal; for S = O_C⟨x⟩ no universal perfectoid algebra exists, so the hypothesis is not automatic.

### Acceptance examples

`regular-semiperfectoid-example`: T = R⟨X_i^{1/p^∞}⟩/(X_i − f_i) with Δ_T the prismatic envelope A_inf(R⟨X^{1/p^∞}⟩){g_i/d}^∧; Δ of F_p[X^{1/p^∞}]/(X) is the completed PD envelope of (X^{1/p}); Δ_{O_C/p} = A_inf{ξ/p}^∧ = φ^{−1}(A_crys). `singular-qrsp-example`: the cover S = R⟨x^{1/p^∞}, y^{1/p^∞}⟩/(xy) of the node B = R⟨x, y⟩/(xy), with gr_i^conj Δ̄_S ≃ S{−i}, Δ_{B/A} = lim Δ_{S^•}, and infinitely many nonzero conjugate graded pieces of Δ̄_{B/A}. `derived-input-higher-homotopy`: R = A/I ⊗^L_{(A/I)⟨x⟩} A/I has gr_i^conj ≃ R{−i}, H^{−1}(Δ̄_{R/A}) ≠ 0 and Δ_{R/A} = A ⊗̂^L_{Δ_{(A/I)⟨x⟩/A}} A, while the site cohomology of π_0(R) is A.

### Dependencies

Inside the roadmap: PR.0 (prisms, perfect prisms and perfectoid rings, prismatic envelopes, PD envelopes as δ-envelopes, animated δ-rings) and PR.1 (site cohomology, Čech–Alexander complexes, Hodge–Tate, crystalline and de Rham comparisons, base change). PR.3 builds the Nygaard filtration on `qrsp-prism` and `quasisyntomic-descent`; PR.4 states the étale comparison for the derived functor and its perfection. Outside: the stages listed at the head of this section, each with a recorded request.

### Gaps

Three inputs are not supplied by any stage of the atlas. (1) BS Proposition 8.5: Δ_{S/A,perf} is the cohomology of the perfect prismatic site, so S_perfd = lim R′ over perfectoid rings under S and is independent of the base. It belongs to the proposed roadmap PerfectoidQuotientsPartIIIntegralPerfectoidization; every statement of §4 above is therefore relative to a fixed perfect prism. (2) The arc-topology and the arc-descent of perfectoidization (BS Definition 8.7, Lemma 8.8, Proposition 8.10: proposed ArcTopologyAndDescent; Corollaries 8.11–8.12: the same Part II). No node here uses them; PR.4 does. (3) Lurie's operation P^0 on E_∞-F_p-algebras, used in the proof of `perfectoidization-coconnective`.

Three slips in the sources are recorded: in the proof of BS Lemma 8.6 the reduced base is R/p, not a perfect ring; in the proof of ALB Proposition 3.5.1 "final object" stands for the initial object; before ALB Proposition A.3 the word "faithfully" is missing in the recalled definition.

# Layer PR.3. Nygaard filtration, divided Frobenius and twists

This stage plans the Nygaard filtration in its three forms (on the prism of a quasiregular
semiperfectoid ring, on prismatic cohomology over a perfectoid base by quasisyntomic descent, and on
the Frobenius twist of relative prismatic cohomology over any bounded prism), the divided Frobenius,
the Breuil–Kisin twists `A{n}` of a prism, the factorisation of Frobenius through `Lη_I`, the
unconditional de Rham comparison, and the Nygaard completion. Sources: Bhatt–Scholze §§12, 13, 15;
Bhatt–Lurie §§2, 5.1, 5.2, 5.8; BMS2 §§5.1, 8.1, 9.3; Anschütz–Le Bras Theorem 3.4.4. Lean names live
in `TauCeti.Prismatic.Nygaard` and `TauCeti.Prismatic.BKTwist`.

### Conventions

Throughout `p` is a prime, prisms are those of PR.0, `Ā = A/I`, and `φ_A` is the Frobenius of `A`.
For an `Ā`-module `M`, `M{n} = M ⊗_Ā (I/I²)^{⊗n}`; for an `A`-module, `M{n} = M ⊗_A A{n}` with the
twist below, and the two agree on `Ā`-modules. Filtrations are decreasing and indexed by `ℕ`;
filtered objects live in the filtered derived category `DF(A)` requested from
`DerivedDeRhamCohomology:DD.1`. The relative Nygaard filtration is a filtration of the Frobenius
twist `φ_A^*Δ_{R/A} = Δ_{R/A} ⊗̂^L_{A,φ_A} A`, never of `Δ_{R/A}` itself unless `φ_A` is bijective.
`Δ` and its Nygaard completion `Δ̂` are different objects; the cases in which they agree are listed
in `nygaard-completeness`.

### 3.1 The Nygaard filtration of a quasiregular semiperfectoid ring

`nygaard-filtration-qrsp` (definition). For a prism `(B,J)` put `Fil^i_N B = φ_B^{-1}(J^i)`; for `S`
quasiregular semiperfectoid this is applied to its initial prism `(Δ_S, IΔ_S)` of
PR.2 `qrsp-prism`: `Fil^i_N Δ_S = {x : φ(x) ∈ d^i Δ_S}`. It is a multiplicative filtration by
ideals, functorial for maps of prisms, and neither `J`-adic nor the powers of `Fil^1_N`. API:
`Nygaard.fil`, `mem_fil_iff`, `fil_zero`, `fil_antitone`, `fil_mul_le`, `fil_map_le`,
`fil_eq_span_pow_of_perfect`, `gr`. Tests: `pr3_nygaard_fil_zero`, `pr3_nygaard_fil_frobenius_id`,
`pr3_nygaard_fil_perfect` (`Fil^i = (φ^{-1}(d))^i` for a perfect prism), `pr3_nygaard_fil_one_perfect`,
`pr3_nygaard_fil_not_powers`.

`nygaard-key-case` (theorem; Bhatt–Scholze Lemmas 12.4–12.7). For `S = (ℤ_p[ζ_{p^∞}, X^{1/p^∞}]/X)^∧`
over the perfection `A` of the q-de Rham prism: `Δ_S` is the `(p,[p]_q)`-completion of
`⊕_{i∈ℕ[1/p]} A·Y^i/[⌊i⌋]_q!`, `φ(Y^i/[⌊i⌋]_q!) = u·[p]_q^{⌊i⌋}·Y^{ip}/[⌊ip⌋]_q!`, and
`Fil^n_N Δ_S` is the completion of `⊕_i [p]_{q^{1/p}}^{max(n−⌊i⌋,0)}·A·Y^i/[⌊i⌋]_q!`; the image of
`φ/[p]_q^n` in `Δ̄_S` and the conjugate filtration `Fil_n Δ̄_S` are both the span of the degrees
`< p(n+1)`. The node contains the q-divided power lemma (`φ(x) = x^p ∈ [p]_q D` implies
`x^n ∈ [n]_q! D`) and the identities `[mp]_q! = u·φ([m]_q!)·[p]_q^m`. This is the perfectoid-quotient
acceptance example.

`nygaard-regular-semiperfectoid` (theorem; Proposition 12.8). A multiplicative filtration `Fil_M` of
`Δ_S` is good if `φ(Fil^i_M) ⊂ d^iΔ_S` and `φ/d^i : gr^i_M ≅ Fil_i Δ̄_S`. Good filtrations equal the
Nygaard filtration, base change along relatively perfect maps, and descend along relatively perfect
`p`-completely faithfully flat maps. With the Künneth formula of PR.2 and André's lemma
(`PerfectoidQuotients:Q3`) this gives Theorem 12.2 for
`R⟨X_1^{1/p^∞},…,X_n^{1/p^∞}⟩/(f_1,…,f_m)`, `f` `p`-completely regular relative to `R`.

`nygaard-filtration` (construction; §§12.4–12.5). Over a perfectoid `R` with prism `(A,I)`: for
`B` `p`-completely smooth, `Fil^i_N Δ_{B/A} = Tot(Fil^i_N Δ_{B̃^•})` along the Čech nerve of
`B → B̃ = R⟨X^{1/p^∞}⟩ ⊗̂ B`, with `gr^i_N Δ_{B/A} ≅ τ^{≤i}Δ̄_{B/A}{i}`; for derived `p`-complete
simplicial `S` the completed left Kan extension, with `gr^i_N ≅ Fil_i^conj Δ̄_{S/A}{i}` through `φ/d^i`
(a `φ_A`-semilinear isomorphism); each
`Fil^i_N` is a quasisyntomic sheaf. API: `Nygaard.filDerived`, `filDerivedZeroIso`, `grDerived`,
`grDerivedIsoConj`, `grDerived_smooth`, `filDerivedMap`, `filDerived_isSheaf`. Tests:
`pr3_nygaard_derived_fil_zero`, `pr3_nygaard_derived_gr_zero`, `pr3_nygaard_derived_base`,
`pr3_nygaard_derived_not_truncation` (the graded pieces truncate `Δ̄`, not `Δ`).

`nygaard-graded-pieces` (theorem; Theorem 12.2 with Proposition 12.11; Anschütz–Le Bras
Theorem 3.4.4). For `S` quasiregular semiperfectoid and any perfectoid `R → S`: the image of
`φ/d^i : Fil^i_N Δ_S → Δ̄_S` is `Fil_i Δ̄_S`, with kernel `Fil^{i+1}_N`; so
`gr^i_N Δ_S ≅ Fil_i Δ̄_S{i}` (φ-semilinearly) and `Δ_S/Fil^1_N Δ_S ≅ S`. The derived filtration of
`nygaard-filtration` is discrete on `S` and equals these ideals, so the filtration on quasisyntomic
`R`-algebras is the unfolding of the qrsp one and does not depend on `R`.

`divided-frobenius` (construction). For `J = (d)`: `φ_i = φ/d^i : Fil^i_N B → B`, with
`φ_{i+j}(xy) = φ_i(x)φ_j(y)`, `φ_i = d·φ_{i+1}` on `Fil^{i+1}_N`, and `φ_i(x) ∈ dB ⇔ x ∈ Fil^{i+1}_N`;
without an orientation, the filtered Frobenius `Fil^i_N B → J^i` and the twisted form
`φ_i : Fil^i_N B ⊗ B{i} → B{i}`; over a perfectoid base, the totalised map
`φ_i : Fil^i_N Δ_{B/A} → Δ_{B/A}` (Proposition 12.10). API: `Nygaard.dividedFrobenius`,
`dividedFrobenius_spec`, `dividedFrobenius_mul`, `dividedFrobenius_succ`, `dividedFrobenius_mem_iff`,
`dividedFrobenius_unit`, `frobeniusFil`, `twistedDividedFrobenius`. Tests:
`pr3_divided_frobenius_zero`, `pr3_divided_frobenius_perfect`, `pr3_divided_frobenius_crystalline`,
`pr3_divided_frobenius_kernel`, `pr3_divided_frobenius_not_multiplicative`.

### 3.2 Breuil–Kisin twists

`transversal-prism` (definition; Bhatt–Lurie §§2.1–2.2). `(A,I)` is transversal if `A/I` is
`p`-torsion-free. Then `(φ^r)^*(I) → A` is injective, `I_r = I·φ^*(I)⋯(φ^{r−1})^*(I)`, `A/I_r` is
`p`-torsion-free, `A = lim A/I_r`, `(φ^r)^*(I)/I_{r+1} → A/I_r` is injective with image `(p)`,
`I_r = ∩_{s<r}(φ^s)^*(I)`, and `I_{r+1}/I_{r+1}² → I_r/I_r²` is `p` times a surjection. API:
`BKTwist.IsTransversal`, `frobeniusIdeal`, `Ir`, `Ir_zero`, `Ir_one`, `Ir_succ_le`,
`IsTransversal.torsionFree`, `IsTransversal.quotient_Ir_torsionFree`,
`IsTransversal.frobeniusIdeal_le`, `IsTransversal.Ir_eq_iInf`, `IsTransversal.cotangent_transition`,
`Ir_map`. Tests: `pr3_transversal_ir_zero_one`, `pr3_transversal_q_de_rham_ir`,
`pr3_transversal_torsion_free`, `pr3_transversal_not_crystalline`.

`transversal-approximation` (theorem; §2.4). Every prism receives a map from a transversal prism;
transversal prisms have coproducts with bounded prisms, flat over the bounded factor; the category
of transversal prisms over a given prism is sifted.

`breuil-kisin-twist-transversal` (construction). `A{1} = lim_r I_r/I_r²` along the canonical maps
divided by `p`; it is invertible, `A{1}/I_rA{1} ≅ I_r/I_r²`, it base changes, and it carries
`φ_{A{1}} : A{1} → I^{-1} ⊗ A{1}`. API: `BKTwist.transversalProj`, `transversalProj_surjective`,
`ker_transversalProj`, `transversalProj_transition`, `transversal_ext`, `transversal_lift`. Tests:
`pr3_bk_transversal_proj_one`, `pr3_bk_transversal_q_system`, `pr3_bk_transversal_undivided`,
`pr3_bk_transversal_proj_zero`.

`breuil-kisin-twist` (construction; §2.5). For any prism, `A{1} = A ⊗_{A_0} A_0{1}` for a
transversal approximation `(A_0,I_0) → (A,I)`, independent of the choice by siftedness. `A{1}` is
invertible, `B ⊗_A A{1} ≅ B{1}` for maps of prisms (so that for non-oriented `I` the twist is the
descent of the twist on a cover orienting `I`), `A{1}/IA{1} ≅ I/I²`, `A{1}` is free iff `I` is
principal, and `φ_A^*A{1} ≅ I^{-1} ⊗ A{1}`. API: `BKTwist.twist`, `twist_invertible`, `twistPow`,
`twistModule`, `twistBaseChange`, `twistReduction`, `twist_free_iff`, `twistFrobenius`,
`twistFrobeniusMap`, `twistFrobeniusMap_smul`, `twistModule_of_bar`. Tests: `pr3_bk_twist_pow_zero`,
`pr3_bk_twist_module_add`, `pr3_bk_twist_free_of_principal`, `pr3_bk_twist_q_generator`,
`pr3_bk_twist_no_fixed_generator`.

`breuil-kisin-twist-examples` (application; §2.6). Over the q-de Rham prism `A{1} = A·e_A`, where
`e_A` has image `[p^r]_q` in each `I_r/I_r²`, and `φ(e_A) = e_A/[p]_q`; over a crystalline prism
`φ(e_A) = e_A/p`, so `(A{n}, φ) ≅ (A, p^{-n}φ)`: the crystalline acceptance example.

### 3.3 The relative Nygaard filtration and the factorisation of Frobenius

`large-quasisyntomic-algebra` (definition; Definition 15.1). A quasisyntomic `Ā`-algebra `S` is
large if `Ā⟨X_t^{1/p^∞}⟩ → S` is surjective for some set of variables; then `L_{S/Ā}[−1]` is
`p`-completely flat, and large algebras form a basis of the quasisyntomic site. API:
`Nygaard.IsLarge`, `HasCompatibleRoots`, `isLarge_iff_exists_family`, `IsLarge.of_surjective`,
`IsLarge.kaehler_eq_smul`, `isLarge_bar`. Tests: `pr3_large_base`, `pr3_large_generated_by_roots`,
`pr3_large_kaehler`, `pr3_large_not_polynomial`.

`relative-nygaard-large-quasisyntomic` (theorem; Theorem 15.2). For `(A,I)` bounded and `S` large
quasisyntomic: `Δ_{S/A}` is a discrete `(p,I)`-completely flat δ-`A`-algebra and the initial object
of `(S/A)_Δ`; with `Fil^i_N Δ^{(1)}_{S/A} = {x : φ_{S/A}(x) ∈ I^iΔ_{S/A}}`, `φ_{S/A}` maps
`gr^i_N` isomorphically onto `Fil_i^conj Δ̄_{S/A}{i}`; the filtration commutes with base change in `A`.

`relative-nygaard-filtration` (construction; §15.1, Bhatt–Lurie Proposition 5.1.1). The filtered
object `Fil^•_N φ_A^*Δ_{R/A}` with `Fil^•(φ) : Fil^•_N → I^• ⊗ Δ_{R/A}`: the Frobenius-divisibility
ideals on large algebras, their unfolding on quasisyntomic algebras (for smooth `X`,
`Fil^i_N RΓ_Δ(X/A)^{(1)} = RΓ(X_qsyn, Fil^i_N Δ^{(1)}_{−/A})`), and the left Kan extension to all
animated `Ā`-algebras, characterised by sifted colimits and the polynomial case. It is
multiplicative, compatible with change of prism, equal to `I^n` for `R = Ā`, and equal to
`φ_A^*` of `nygaard-filtration` over a perfect prism. API: `Nygaard.frobeniusTwist`,
`relativeFrobenius`, `relFil`, `relFilZeroIso`, `relGr`, `relGr_triangle`, `relFilMap`, `relFil_bar`,
`relFil_large`, `relFilBaseChange`. Tests: `pr3_rel_fil_zero`, `pr3_rel_fil_base`,
`pr3_rel_gr_zero_base`, `pr3_rel_fil_needs_twist` (for the q-de Rham prism `φ_A^{-1}(I) = (q−1) ≠ I`).

`relative-nygaard-graded-pieces` (theorem). `gr^n_N φ_A^*Δ_{R/A} ≅ Fil_n^conj Δ̄_{R/A}{n}` for all
animated `R`; `τ^{≤n}Δ̄_{R/A}{n}` for `p`-completely smooth `R`; `gr^1_N ≅ L_{R/A}[−1]^∧`; the
filtration is connective for the Beilinson t-structure.

`leta-frobenius-factorisation` (theorem; Theorem 15.3). For `R` `p`-completely smooth over `Ā`, the
filtered Frobenius factors through the Beilinson connective cover of the `I`-adic filtration, whose
underlying complex is `Lη_I Δ_{R/A}` (`AInfCohomology:AI.1`); the resulting
`φ̃ : φ_A^*Δ_{R/A} → Lη_I Δ_{R/A}` is an isomorphism, the Nygaard filtration is the décalage
filtration, and `φ = (Lη_IΔ → Δ) ∘ φ̃`. The proof reduces modulo `I` to the Bockstein complex and,
through the crystalline case, to the Cartier isomorphism (`DerivedDeRhamCohomology:DD.3`).

`de-rham-comparison-general` (theorem; Corollary 15.4). For every bounded prism and smooth formal
`Ā`-scheme `X`: `Δ_{X/A} ⊗̂^L_{A,φ_A} Ā ≅ Ω^•_{X/Ā}` as commutative algebra objects, with no
hypothesis on `W(Ā)`; for animated `R`, `Ā ⊗^L_A φ_A^*Δ_{R/A} ≅ dR^∧_{R/Ā}`. PR.1 keeps the version
with `W(Ā)` `p`-torsion-free.

`image-of-frobenius` (theorem; Corollary 15.5). `V_i : τ^{≤i}Δ_{X/A} ⊗ I^{⊗i} → τ^{≤i}Δ^{(1)}_{X/A}`
with `φV_i` and `V_iφ` the natural maps; on `H^i`, `V_i : H^i_Δ(X/A) ⊗ I^{⊗i} → H^i(Δ^{(1)}_{X/A})`.

`nygaard-hodge-comparison` (theorem; Bhatt–Lurie §5.2). The Bockstein complex
`(⊕ H^n(gr^n_N), β)` is the de Rham complex; there is a map of filtered algebras
`Fil^•_N φ_A^*Δ_{R/A} → Fil^•_Hodge dR^∧_{R/Ā}` and a fibre sequence
`I ⊗ Fil^{•−1}_N → Fil^•_N → Fil^•_Hodge dR^∧_{R/Ā}`; for smooth `R` of dimension `≤ d`,
`Fil^n_N = I^{n−d} ⊗ Fil^d_N` for `n ≥ d`.

`nygaard-filtration-in-coordinates` (theorem; BMS2 Proposition 8.7, Remark 9.11). Over a perfect
prism `(A,(d))`, a complex `M^•` computing `φ_A^*Δ_{R/A}` with a Frobenius divisible by `φ(d)^n` in
degree `n` and satisfying the Cartier isomorphism has Nygaard filtration `d^{max(i−•,0)}M^•`. For
the de Rham complex of a lift with Frobenius this is `p^{max(i−•,0)}Ω^•`; the q-de Rham instance
`ξ^{max(i−•,0)} q-Ω^•` is completed by PR.6.

### 3.4 Completion

`nygaard-completion` (construction). `B̂ = lim_i B/Fil^i_N B` with `Fil^i_N B̂`, the map
`c : B → B̂` with kernel `∩ Fil^i_N`, and, for `J = (d)`, `φ̂ : B̂ → B` with `φ̂ ∘ c = φ` and
`φ_i : Fil^i_N B̂ → B`; completion of filtered objects in `DF(A)`. API: `Nygaard.completion`,
`mem_completion_iff`, `toCompletion`, `toCompletion_apply`, `ker_toCompletion`, `completionProj`,
`completionProj_surjective`, `completionFil`, `completionFrobenius`,
`completionFrobenius_toCompletion`, `IsNygaardComplete`. Tests: `pr3_completion_perfect`,
`pr3_completion_quotient`, `pr3_completion_frobenius`, `pr3_completion_not_surjective`.

`nygaard-completeness` (theorem). `Δ = Δ̂` for perfectoid `S`; `φ_A^*Δ_{R/A}` is Nygaard-complete
iff `dR^∧_{R/Ā}` is Hodge-complete, in particular for `p`-completely smooth `R`; over a perfect
prism the same criterion applies to `Δ_{S/A}`.

`nygaard-frobenius-colimit` (theorem; Bhatt–Lurie Corollary 5.2.16). `Δ_{R/A}` is the
`(p,I)`-completed colimit of `I^{-m} ⊗ Fil^m_N φ_A^*Δ_{R/A}`; for smooth `R` of dimension `≤ d`,
`Fil^m(φ) : Fil^m_N ≅ I^{⊗m} ⊗ Δ_{R/A}` for `m ≥ d`.

`nygaard-incomplete-example` (application). For `S_0 = 𝔽_p[X^{1/p^∞}]/(X)`: `Δ_{S_0}` is the
`p`-completion of `⊕ ℤ_p·Y^i/⌊i⌋!`, `Fil^n_N` that of `⊕ p^{max(n−⌊i⌋,0)}ℤ_p·Y^i/⌊i⌋!`, and
`Σ_m Y^m/m!` lies in `Δ̂_{S_0}` and not in `Δ_{S_0}`: the map `Δ → Δ̂` is injective and not
surjective.

`bms2-comparison` (theorem; Lemma 13.2). `δ(Fil^i_N Δ_S) ⊂ Fil^{pi}_N Δ_S + (d,p)^{i−1}Δ_S`; the
Nygaard completion equals the completion for `Fil^i_N + (d,p)^j`; the δ-structure extends uniquely
to `Δ̂_S`; and a `(p,[p]_q)`-completely flat `A`-algebra with Frobenius receiving `Y` with
`Y^p ∈ [p]_q D` receives a unique Frobenius-compatible map from `Δ_S` in the key case. This is the
prismatic half of Bhatt–Scholze Theorem 13.1. The identification of `Δ̂_S` with `π_0 TC^-(S; ℤ_p)`,
and of the completion of `Δ^{(1)}_{S/𝔖}` with `π_0 TP(S/𝕊[u]; ℤ_p)` (Proposition 15.7), is an export
to `RefinedTraceMethods:RT.6`, which imports this node; PR.3 has no trace-theoretic prerequisite.

### Dependencies

Inside the roadmap: PR.0 (prisms, envelopes, perfect prisms, the q-de Rham and crystalline prisms,
completion of δ-structures), PR.1 (Hodge–Tate and crystalline comparisons, base change, the sheaf
property of the structure sheaf), PR.2 (derived prismatic cohomology, conjugate filtration, the
qrsp prism, quasisyntomic descent, Künneth). Other roadmaps, each with a request:
`AInfCohomology:AI.1` (the Beilinson description of `Lη_I`, BMS1 Lemmas 6.9–6.10, multiplicativity
of the Bockstein reduction), `DerivedDeRhamCohomology:DD.0`, `DD.1` (completed tensor products,
`DF(A)`, the Beilinson t-structure), `DD.2` (de Rham and derived de Rham complexes with the Hodge
filtration), `DD.3` (Cartier isomorphism), `DD.5` (quasisyntomic site), `EnhancedDerivedSheaves:E3`
and `E5:animation`, `PerfectoidQuotients:Q3` (André's lemma), `CrystallineCohomology:CR.0` and
`CR.2`. Consumers: PR.4 (`Z_p(n)` from `Fil^n_N Δ̂{n}` and `φ_n`), PR.5 (absolute Nygaard filtration
and twists), PR.6, PR.8 and `RefinedTraceMethods:RT.6`.

### Gaps and acceptance

The stage records no gap. Seven misprints in Bhatt–Lurie and BMS2 are recorded as source issues
E31–E37, and the nodes use the registered corrections of Bhatt–Scholze (Proposition 12.10,
§12.5, Corollaries 15.4, 15.5, Remark 15.6). Acceptance: the crystalline prism
(`breuil-kisin-twist-examples`, `nygaard-filtration-in-coordinates`), the perfectoid quotient
(`nygaard-key-case`), and a ring with `Δ ≠ Δ̂` (`nygaard-incomplete-example`).

# Layer PR.4. Étale comparison and p-adic Tate twists

This layer recovers étale cohomology from prismatic cohomology in two ways. The Frobenius-fixed points of prismatic cohomology with the prism ideal inverted compute Z/p^n-cohomology of the generic fibre of **every** p-adic formal scheme over a perfectoid ring (Bhatt–Scholze §9). The fibres of the divided Frobenius on the Nygaard filtration, the syntomic complexes Z_p(n), compute p-adic Tate twists: logarithmic de Rham–Witt sheaves in characteristic p, truncated nearby cycles over O_C, and all of étale cohomology of the generic fibre only after inverting a Bott-type class. Namespaces: `TauCeti.Prismatic.Etale` and `TauCeti.Prismatic.Syntomic`. Sources: Bhatt–Scholze §§9, 11, 14; BMS2 §§7.4, 8.1, 8.4, 10; Bhatt–Lurie §§2.3–2.7, 7.4, 7.5, 8; Bhatt–Mathew §§1, 5; Antieau–Mathew–Morrow–Nikolaus §5.

**Conventions.** R is a perfectoid ring with perfect prism (A, (d)), A/d = R; for R = O_C, A = A_inf with q = [ε^{1/p}], d = [p]_q, μ = q − 1, so φ(μ) = dμ. Δ_{S/A} is the derived prismatic cohomology of PR.2; Δ_R{n}, Fil^•_N are the absolute prismatic complex, its Breuil–Kisin twist and Nygaard filtration (PR.5, PR.3). All fixed points and fibres are derived. Étale cohomology with Z_p-coefficients is the derived limit of Z/p^k-cohomology. "/p^n" is the derived reduction ⊗^L Z/p^n.

### Frobenius fixed points and the étale comparison

`frobenius-fixed-points` (construction). For a ring B with endomorphism σ over a coefficient ring Λ, D(B[F]) is the ∞-category of pairs (M, φ_M), φ_M : M → σ_*M, and M^{φ=1} := fib(φ_M − 1) ∈ D(Λ); for t with σ(t) a unit of B[1/t], (M[1/t])^{φ=1} is defined after extending φ. There are exact sequences 0 → coker(φ − 1 | H^{i−1}M) → H^i(M^{φ=1}) → ker(φ − 1 | H^iM) → 0, so M^{φ=1} is never the fixed vectors of H^0. API: `FrobeniusModule`, `fixedPoints`, `fixedPointsι`, `fixedPointsMap`, `fixedPoints_isGE`, `fixedPoints_isZero_of_isIso`, `invert`, `reduce`. Tests: `pr4_fixed_points_fp_h1` (F_p with φ = id has H^1 = F_p), `pr4_fixed_points_zero_map` (φ = 0 gives 0), `pr4_fixed_points_identity` (φ = id gives M ⊕ M[−1]), `pr4_fixed_points_not_fixed_vectors` (F_p[x] with Frobenius has H^1 ≠ 0).

`fixed-points-completed-colimits` (Lemma 9.2). For an F_p-algebra B with t ∈ B, on pairs with M derived t-complete the functors M ↦ M^{φ=1} and M ↦ (M[1/t])^{φ=1} commute with colimits (computed as completed colimits). Key step: N^{φ=1} ≃ (N/t)^{φ=1}, because φ(t) = t^p makes φ topologically nilpotent on the fibre of N → N/t.

`perfectoid-artin-schreier-witt` (the perfectoid local calculation). For S perfectoid, Δ_{S/A}[1/d]/p^n = W_n(S^♭[1/d]); Artin–Schreier–Witt gives RΓ_ét(Spec S^♭[1/d], Z/p^n) ≃ fib(F − 1), and Huber's Spec/Spa comparison with the tilting equivalence gives RΓ_ét(Spec S[1/p], Z/p^n) ≃ RΓ_ét(Spec S^♭[1/d], Z/p^n).

`etale-comparison` (Theorem 9.1; planet "Étale comparison theorem"). For an **arbitrary** p-adic formal scheme X over R, with adic generic fibre X_η and nearby-cycles map μ : X_{η,ét} → X_ét,

  Rμ_* Z/p^n ≃ (Δ_{X/A}[1/d]/p^n)^{φ=1},   and for X = Spf S:   RΓ_ét(Spec S[1/p], Z/p^n) ≃ (Δ_{S/A}[1/d]/p^n)^{φ=1}.

No smoothness or finiteness is assumed; the stage text had restricted this to smooth X, which misstates the source (RT-AREA-padic-2/6). The proof builds the map between two arc_p-sheaves and checks it on perfectoid rings: F(S) = RΓ(Spec S[1/p], Z/p^n) is an arc_p-sheaf, G(S) = (Δ_{S/A}[1/d]/p^n)^{φ=1} equals the same expression with Δ_{S/A,perf} by `fixed-points-completed-colimits` and is an arc_p-sheaf by arc-descent of perfectoidization, and on perfectoid S the claim is `perfectoid-artin-schreier-witt`.

`etale-comparison-coefficients`. The identifications commute with Z/p^n → Z/p^{n−1} and with p : Z/p^{n−1} → Z/p^n, are multiplicative, and in the derived limit give Rμ_* Z_p ≃ ((Δ_{X/A}[1/d])^∧_p)^{φ=1}.

`etale-comparison-without-inverting-d` (Remark 9.3). Z/p^n ≃ (Δ_{X/A}/p^n)^{φ=1} as étale sheaves on X; affinely RΓ_ét(Spec S, Z_p) ≃ fib(φ − 1 on Δ_{S/A}). The source leaves the proof to the reader; the plan deduces it from Bhatt–Lurie Theorem 8.1.9 and the absolute/relative comparison over a perfect prism.

`etale-comparison-smooth` (Theorem 1.8(4)). For (A, I) perfect and X smooth (qcqs) over A/I: RΓ_ét(X_η, Z/p^n) ≅ (RΓ_Δ(X/A)/p^n[1/I])^{φ=1}, the corollary of `etale-comparison` obtained from the agreement of derived and site-theoretic prismatic cohomology for smooth X.

`perfectoid-etale-cohomological-dimension` (Theorem 11.1). For R perfectoid, every étale F_p-sheaf on the scheme Spec(R[1/p]) has no cohomology above degree 1. Proof by dévissage to RΓ(Y, j_!F_p), the étale comparison for S and S/J, discreteness of S_perfd for integral R → S and surjectivity of perfectoidization (PerfectoidQuotients:Q4).

### Syntomic complexes

`syntomic-complex` (construction; planet "Syntomic complexes Z_p(n)"). For a quasisyntomic ring S,

  Z_p(n)(S) := fib(φ_n − can : N^{≥n}Δ̂_S{n} → Δ̂_S{n}),   Z/p^r(n) := Z_p(n) ⊗^L Z/p^r,

a quasisyntomic sheaf of p-complete complexes; for S quasiregular semiperfectoid it is a two-term complex in degrees 0, 1, and for R perfectoid Z_p(n)(R) = (φ^{−1}(d)^n A → A, x ↦ φ(x)/d^n − x). It is defined as a fibre of prismatic data; its identification with gr^n TC belongs to RefinedTraceMethods:RT.6. API: `NygaardDatum`, `syntomicComplex`, `syntomicComplexMod`, `syntomicToFil`, `syntomicMap`, `syntomicComplex_isGE`, `syntomicComplex_isLE`, `perfectoidDatum`. Tests: `pr4_syntomic_zero_weight_fp` (H^1(Z_p(0)(F_p)) = Z_p), `pr4_syntomic_equal_maps`, `pr4_syntomic_contracting`, `pr4_syntomic_not_fixed_points`.

`syntomic-cohomology-formal-schemes` (construction; Bhatt–Lurie §7.4). For every animated ring R, RΓ_syn(Spf R, Z_p(n)) := fib(φ{n} − ι : Fil^n_N Δ_R{n} → Δ_R{n}), built from PR.5's absolute prismatic cohomology and Nygaard filtration and PR.3's twists. It is unchanged by p-completion of R and by Nygaard completion (Proposition 7.4.6, so it agrees with `syntomic-complex` on quasisyntomic rings), satisfies p-complete fpqc descent, commutes with sifted colimits, satisfies derived descent modulo p, and globalises to bounded p-adic formal schemes with the defining fibre sequence RΓ_syn(𝔛, Z_p(n)) → Fil^n_N RΓ_Δ(𝔛){n} → RΓ_Δ(𝔛){n}. API: `AbsoluteDatum`, `syntomicCohomology`, `syntomicCohomology_completion`, `syntomicCohomology_eq_syntomicComplex`, `syntomicCohomologyFormal`, `syntomicTriangle`. Tests: `pr4_syntomic_cohomology_trivial_ring`, `pr4_syntomic_cohomology_qrsp_two_term`, `pr4_syntomic_cohomology_completed_agrees`, `pr4_syntomic_cohomology_not_hodge`.

`prismatic-logarithm` (construction; Bhatt–Lurie §§2.3–2.7). For a prism (A, I), log_Δ : (1 + I)_{rk=1} → A{1} is the homomorphism given on transversal prisms by the classes u^{p^r} − 1 ∈ I_{r+1}/I_{r+1}^2; it is functorial, φ-invariant, reduces to u − 1 modulo I, and induces log_Δ : T_p((A/I)^×) → A{1}. For the q-de Rham prism, log_Δ(q^p) = (q − 1)e_A. API: `rankOneUnits`, `prismaticLog`, `prismaticLog_frobenius`, `prismaticLog_map`, `prismaticLog_mod`, `tateModule`, `tateLog`. Tests: `pr4_prismatic_log_one`, `pr4_prismatic_log_q_de_rham`, `pr4_prismatic_log_mul`, `pr4_prismatic_log_not_all_units`.

`syntomic-low-weights`. Z_p(n) = 0 for n < 0; RΓ_ét(Spec R, Z_p) ≃ RΓ_syn(Spf R, Z_p) for p-complete R; the syntomic first Chern class identifies RΓ_syn(Spf R, Z_p(1)) with the p-completion of RΓ_ét(Spec R, G_m)[−1], so Pic(R)^∧[−2] ≃ Z_p(1)(R) for quasisyntomic R (Lemma 9.6) and Z_p(1) = T_p G_m locally. These replace BMS2 Propositions 7.16–7.17, whose proofs use K-theory.

`divided-frobenius-contraction` (BMS2 Lemma 7.22). For a p-torsion-free quasisyntomic O_C-algebra and m ≥ (pi + 1)/(p − 1), φ_i maps N^{≥m}Δ̂{i}/p into N^{≥m+1}Δ̂{i}/p, so φ_i − 1 is an equivalence there. `syntomic-filtered-colimits` (Proposition 7.21, direct proof): Z/p^r(i) commutes with filtered colimits of quasisyntomic rings.

`tate-twist-perfectoid` (Theorem 9.4). For R perfectoid and n ≥ 1, Z_p(n)(R) ≃ RΓ_ét(Spec R[1/p], Z_p(n)); for n = 0, Z_p(0)(R) ≃ RΓ_ét(Spec R, Z_p) ≃ RΓ_ét(Spec (R/p)_perf, Z_p). The comparison map in weight 1 comes from `syntomic-low-weights`, which makes the proof algebraic. `picard-perfectoid-uniquely-divisible` (Corollary 9.7): Pic(R) and Pic(R[1/p]) are uniquely p-divisible.

`tate-twist-discreteness` (Theorem 14.1; planet). Z_p(n) is discrete and p-torsion-free as a quasisyntomic sheaf: H^1 dies on quasisyntomic covers. The proof uses André's lemma (PerfectoidQuotients:Q3), the perfectoid case, Lemma 14.4 (surjectivity on H^1 for R⟨X^{1/p^∞}⟩ → R⟨X^{1/p^∞}⟩/(X), by the graded description of the Nygaard filtration) and Lemma 14.5. Its K-theoretic corollaries 14.2–14.3 are handed to the proposed roadmap RefinedTraceMethodsPartIIHenselianPairs.

`syntomic-connectivity` (Antieau–Mathew–Morrow–Nikolaus, as used by Bhatt–Mathew). Z_p(i) is left Kan extended from polynomial algebras; Z_p(i)(R) ∈ D^{≤ i+1}; for a henselian pair the fibre of Z_p(i)(R) → Z_p(i)(R/I) lies in D^{≤ i}; H^{i+1}(F_p(i)(R)) vanishes for strictly henselian R; hence Z/p^n(i)_X ∈ D^{[0,i]}(X_ét).

### Characteristic p

`log-forms-divided-frobenius` (BMS2 Proposition 8.4). For X smooth over a perfect field, 0 → WΩ^i_{X,log}[−i] → N^{≥i}WΩ^•_X → WΩ^•_X → 0 (second map φ_i − 1) is degreewise exact on the pro-étale site. `acrys-divided-frobenius-surjective` (Lemma 8.19): φ_i − 1 : N^{≥i}Â_crys(S) → Â_crys(S) is surjective for i > 0, and as a map of sheaves for i ≥ 0. `syntomic-complex-char-p` (Proposition 8.20, corrected): for S quasiregular semiperfect, Z_p(i)(S) = A_crys(S)^{φ=p^i} in degree 0 for i > 0; for i = 0 the degree-1 term coker(φ − 1) vanishes only after sheafification (Z_p(0)(F_p) has H^1 = Z_p). `log-de-rham-witt-comparison` (Corollary 8.21; planet): Rλ_*Z_p(i) ≃ WΩ^i_{X,log}[−i] for A smooth over k.

### Nearby cycles over O_C

`syntomic-truncation-ainf` (Proposition 10.5): on a smooth formal scheme over O_C, hofib(φ_i − 1 : N^{≥i}AΩ{i} → AΩ{i})/p^n lives in degrees ≤ i, seen in q-de Rham coordinates where φ(d_q log T_a) = ξ̃ d_q log T_a. `ainf-artin-schreier-condition` (Remark 10.6): 1 − ξ^iφ^{−1} is an automorphism of A_inf,X/(p^n, μ^j) for i ≥ j. `leta-frobenius-fixed-points` (Lemmas 10.7–10.8): the truncated fixed points of ξ^iφ^{−1} agree on τ^{≤i}Lη_μC and on C. `nearby-cycles-comparison` (Theorem 10.1; planet): Z/p^n(i) ≃ τ^{≤i}Rψ_*Z/p^n(i) on 𝔛_ét, compatibly in n, for 𝔛 smooth over O_C with C complete and algebraically closed.

### Bhatt–Lurie's étale comparison and schemes

`syntomic-etale-comparison` (Theorems 8.3.1, 8.5.1; planet). There is a unique functorial graded ring map γ{•} : ⊕_n RΓ_syn(Spf R, Z_p(n)) → ⊕_n RΓ_ét(Spec R[1/p], Z_p(n)) compatible with first Chern classes; over Z[ζ_{p^∞}] it becomes an isomorphism after inverting ε and p-completing, a reformulation of `etale-comparison`. `syntomic-cohomology-schemes` (construction; §8.4): RΓ_syn(Spec R, Z_p(n)) is the pullback of the formal syntomic complex and étale cohomology of Spec R[1/p] over étale cohomology of Spec R̂[1/p]. API: `SchemeDatum`, `syntomicCohomologyScheme`, `etaleComparison`, `toFormal`, `toFormal_isIso_of_complete`, `etaleComparison_isIso_of_invertible`, `pullback_condition`. Tests: `pr4_syntomic_scheme_p_invertible`, `pr4_syntomic_scheme_p_complete`, `pr4_syntomic_scheme_zero`, `pr4_syntomic_scheme_not_product`.

`syntomic-not-generic-fibre-etale` (warning). γ{n} is not an isomorphism in general: for R = Z_p and n = 1 its cokernel on H^1 is Z_p; for F_p-algebras the target vanishes while the source does not; over O_C only the truncation τ^{≤n} of nearby cycles is syntomic. This concerns Z_p(n), not the φ = 1 statement of `etale-comparison`.

`tate-twists-acceptance-examples`. Z_p(n)(O_C) = Z_p·μ^n in degree 0; finite levels Z/p^k·μ^n with reduction maps for k → k − 1; the formal torus Spf O_C⟨T^{±1}⟩, where the Kummer class of T is a non-zero section of R^1ψ_*μ_{p^k}; ⊕_n RΓ_syn(Spf O_C, Z_p(n)) = Z_p[log_Δ(ε)] for spherically complete C.

### Dependencies

Inside the roadmap: PR.0 (perfect prisms, q-de Rham prism), PR.1 (Frobenius, crystalline comparison), PR.2 (derived Δ, perfection, quasisyntomic descent, Hodge–Tate comparison), PR.3 (Nygaard filtrations, completion, divided Frobenius, twists, Lη_I factorisation), PR.5 (absolute prismatic cohomology, absolute Nygaard filtration, absolute/relative comparison), PR.6 (AΩ ≃ φ^*Δ, q-de Rham coordinates). Other roadmaps, each with a request: DerivedDeRhamCohomology:DD.0, DD.1, DD.4, DD.5; CrystallineCohomology:CR.0, CR.4; AInfCohomology:AI.1, AI.3, AI.4; PerfectoidQuotients:Q0:integral-algebra, Q3, Q4; PerfectoidSpaces:P3; SchemeAndStackFoundations:SF.2; ClassicalAdicEtaleCohomology:H0, H1:henselian; EnhancedDerivedSheaves:E2, E3 and the animation and stable-category nodes of E5. No node depends on RefinedTraceMethods: no TC or trace input enters this layer.

### Gaps

1. The arc_p-topology and arc_p-descent of S ↦ RΓ(Spec S[1/p], Z/p^n) (Bhatt–Mathew Corollary 6.17, Theorems 5.4, 5.13, 6.4, 6.10; Bhatt–Scholze Definition 8.7 – Proposition 8.10), proposed owner ArcTopologyAndDescent; needed by `etale-comparison`, `tate-twist-perfectoid`, `picard-perfectoid-uniquely-divisible`, `syntomic-etale-comparison`, `syntomic-cohomology-schemes`.
2. Bhatt–Scholze Corollary 8.11 and Theorem 10.11, proposed owner PerfectoidQuotientsPartIIIntegralPerfectoidization; needed by `etale-comparison` and `perfectoid-etale-cohomological-dimension`.
3. A proof of rigidity (Antieau–Mathew–Morrow–Nikolaus Theorem 5.2) that does not use topological Hochschild homology; needed by `syntomic-connectivity`.

The Hodge-filtered (Fontaine–Messing) form of the syntomic triangle in mixed characteristic needs the Beilinson fibre square and is handed downstream of this layer and RefinedTraceMethods:RT.3b.

### Acceptance

O_C in every weight; the formal torus for both comparisons; Z/p^k-levels with the maps k → k − 1 on both sides of `etale-comparison` and of `nearby-cycles-comparison`; a singular affine (O_C⟨x, y⟩/(xy)) for `etale-comparison`; F_p and Z_p as the cases where syntomic and generic-fibre étale cohomology differ.

# Layer PR.5. Absolute prismatics and geometric coefficient packages

This layer plans the absolute theory of Bhatt–Lurie, *Absolute prismatic cohomology*, §§3–5, on top of
the relative theory of PR.0–PR.3. Its carrier is the Cartier–Witt stack WCart, the stack over
Spf Z_p that plays the role of the formal spectrum of a (non-existent) initial prism. Four objects
must be kept apart throughout: the stack WCart; the complex RΓ(WCart, E) of global sections of a
quasi-coherent complex E; the Hodge–Tate divisor WCart^HT ⊂ WCart; and a base prism (A, I), which
is only a point ρ_A : Spf(A) → WCart. Namespaces: `TauCeti.Prismatic.WCart` and
`TauCeti.Prismatic.Absolute`.

**Conventions.** p is a fixed prime. W(R) is Mathlib's `WittVector p R` with coordinates
x = (x_0, x_1, …), Frobenius F, Verschiebung V, Teichmüller lift [·] and the canonical δ-structure
(natural in R, with Frobenius F). Prisms, bounded and perfect prisms are those of PR.0; a prism is
*transversal* when A/I is p-torsion-free. D̂(A) ⊂ D(A) is the derived (p, I)-complete part
(`DerivedDeRhamCohomology:DD.1`). Twists {n} are the Breuil–Kisin twists of
`PrismaticCohomology:PR.3/breuil-kisin-twist`; the relative Nygaard filtration is
`PrismaticCohomology:PR.3/relative-nygaard-filtration`. Syntomic complexes belong to PR.4 and are
consumers of this layer; periodic cyclic homology belongs to RefinedTraceMethods; derived de Rham
cohomology and its Hodge completion belong to DerivedDeRhamCohomology.

### Objects

**Absolute prismatic site** (`absolute-prismatic-site`). For a p-adic formal scheme X, X_Δ is the
opposite of the category of triples (A, I, u), (A, I) a bounded prism and u : Spf(A/I) → X, with
the flat topology ((p, I)-completely faithfully flat maps of prisms). Sheaves: O_Δ = A with φ,
the prism-ideal sheaf I_Δ = I, the reduced sheaf Ō_Δ = A/I, and I_Δ^m{n}. Over a bounded prism
(A, I) the relative site (X/A)_Δ is the category of objects of X_Δ under (A, I); for a perfect
prism (X/A)_Δ ≃ X_Δ. API: `Absolute.SiteObj`, `SiteObj.Hom`, `SiteObj.ofPrism`,
`SiteObj.idealSheaf`, `RelativeObj`, `SiteObj.existsUnique_hom_of_perfect`. Tests:
`pr5_site_perfect_initial`, `pr5_site_char_p_crystalline` (over an F_p-algebra every object has
I = (p)), `pr5_site_structure_map_matters`.

**Generalized Cartier divisors** (`generalized-cartier-divisor`). Cart(R) is the groupoid of pairs
(I, α), I an invertible R-module and α : I → R linear; isomorphisms are ρ with α = α′ρ. It is the
fpqc stack [A^1/G_m]; a Cartier divisor is a pair with α injective, a property not stable under
pullback. API: `WCart.GeneralizedCartierDivisor`, `.Iso`, `.ofElement`, `.ofIdeal`, `.baseChange`,
`.IsCartier`, `.ofElement_iso_iff`. Tests: `pr5_cartier_zero_not_cartier`,
`pr5_cartier_unit_trivial`, `pr5_cartier_base_change_loses_injectivity` ((Z, p) pulled back to
F_p), `pr5_cartier_automorphisms`.

**Cartier–Witt divisors** (`cartier-witt-divisor`). For p nilpotent in R, a Cartier–Witt divisor
is (I, α) ∈ Cart(W(R)) such that (a) the image of I → W(R) → R is a nilpotent ideal and (b) the
image of δ ∘ α generates the unit ideal. Since δ(x)_0 = x_1 and V W(R) lies in the Jacobson
radical, (a) and (b) say: each α(y)_0 is nilpotent and the α(y)_1 generate the unit ideal of R.
Principalized divisors (W(R), f·) correspond to distinguished Witt vectors
f ∈ WCart_0(R) = {f_0 nilpotent, f_1 a unit}. API: `IsCartierWitt`, `CartierWittDivisor`,
`IsDistinguishedWitt`, `CartierWittDivisor.ofWitt`, `isCartierWitt_ofElement_iff`,
`coeff_zero_delta`. Tests: `pr5_cw_p_distinguished` (p = (p, 1 − p^{p−1}, …) over Z/p^{n+1}),
`pr5_cw_verschiebung_one`, `pr5_cw_one_not_distinguished`, `pr5_cw_teichmuller_not_distinguished`,
`pr5_cw_empty_of_p_not_nilpotent`.

**The stack** (`cartier-witt-stack`). f : R → S induces f^* : WCart(R) → WCart(S) through W(f)
(the source prints the opposite direction, PrismaticCohomology/E53). WCart satisfies fpqc descent;
the source asserts this without proof and W(R) → W(S) is not flat for flat R → S, so the plan
proves it by induction on the length of Witt vectors (PrismaticCohomology/E55).
μ : WCart → [Â^1/G_m] is restriction to R. API: `CartierWittDivisor.groupoid`, `pullback`,
`pullbackComp`, `toCart`, `toCart_not_isCartier`, `pullback_faithful`. Tests:
`pr5_wcart_hom_principal`, `pr5_wcart_zero_ring`, `pr5_wcart_pullback_principal`,
`pr5_wcart_nontrivial_automorphism` (1 + [ε] over the dual numbers).

**Points of prisms** (`prism-point-of-wcart`). A prism (A, I) and f : A → R with f(I + (p))
nilpotent give ρ_A(f) = (W(R) ⊗_A I → W(R)) through the δ-lift A → W(R). The de Rham point is
ρ_dR = ρ_{Z_p}, R ↦ (W(R), p·); the universal oriented prism (A^0, (a_0)),
A^0 = Z[a_0, a_1^{±1}, a_2, …]^∧, has ρ_{A^0} the atlas. API: `prismPoint`, `prismPoint_comp`,
`prismPoint_map`, `exists_universalOrientedPrism`. Tests: `pr5_point_crystalline_is_p`,
`pr5_point_orientable_principal`, `pr5_point_to_cart`.

**Complexes** (`quasi-coherent-complexes-on-wcart`). D(WCart) = lim D(R) over points, with
Perf(WCart), the unit O_WCart, the Hodge–Tate ideal sheaf I → O_WCart, ρ_A^* into D̂(A) for
bounded prisms, ρ_{A*}, and RΓ(WCart, −) with values in D̂(Z_p). API: `Carriers`, `carriers`,
`Carriers.prismPullback`, `Carriers.globalSections`, `Carriers.idealPow`, `prismPullback_unit`,
`prismPullback_ideal`. Tests: `pr5_qcoh_pullback_unit`, `pr5_qcoh_ideal_pow_zero`,
`pr5_qcoh_ideal_not_trivial`.

**G_m^♯** (`divided-power-multiplicative-group`). O(G_m^♯) ⊂ Q[t^{±1}] is generated by t^{−1} and
the (t−1)^n/n!; G_m^♯(Z_p) = 1 + pZ_p. The Witt Frobenius on W and W^× is faithfully flat and
W^×[F] ≅ G_m^♯ over Z_(p). API: `gmSharpRing`, `GmSharp`, `GmSharp.group`, `GmSharp.toUnits`,
`GmSharp.toUnits_injective`, `gmSharpEquivFrobeniusKernel`. Tests: `pr5_gmsharp_padic_points`,
`pr5_gmsharp_rational`, `pr5_gmsharp_fp_trivial`.

**Hodge–Tate divisor** (`hodge-tate-divisor`). WCart^HT(R) consists of the (I, α) with α(I) ⊂ V W(R);
it is the fibre of μ over BG_m and Spf(A/I) = Spf(A) ×_{WCart} WCart^HT. The point η is
R ↦ (W(R), V(1)·), with Aut(η) = W^×[F] because u V(1) = V(F(u)). Theorem 3.4.13: η extends to
Spf(Z_p) × BG_m^♯ ≅ WCart^HT (fpqc classifying stack). API: `CartierWittDivisor.IsHodgeTate`,
`etaPoint`, `etaPoint_isHodgeTate`, `prismPoint_isHodgeTate_iff`, `autEtaEquiv`,
`exists_faithfullyFlat_iso_etaPoint`. Tests: `pr5_ht_p_eq_verschiebung_one`,
`pr5_ht_p_not_hodge_tate`, `pr5_ht_unit_times_v_one`, `pr5_ht_aut_eta_fp`.

**Sen operator** (`sen-operator`). Over the dual numbers F([ε]) = 0, so 1 + [ε] acts on every
Hodge–Tate point; on E ∈ D(WCart^HT) this action is id + εΘ_E. Θ satisfies the Leibniz rule,
vanishes on O, is n on O{n} and t∂/∂t on the regular representation. API: `senOperator`,
`senOperator_unit`, `senOperator_twist`, `fibreEta_twist`,
`one_add_teichmuller_eps_mul_verschiebung`. Tests: `pr5_sen_unit_zero`, `pr5_sen_ideal_identity`,
`pr5_sen_ideal_ne_zero`, `pr5_sen_teichmuller_frobenius`.

**Frobenius of the stack** (`wcart-frobenius`). F : WCart → WCart is pullback along the Witt
Frobenius; ρ_A ∘ φ_A ≅ F ∘ ρ_A; F^*O{n} ≅ I^{−n}O{n}; F contracts WCart^HT to the de Rham point.
API: `frobenius`, `frobenius_ofWitt`, `frobenius_hodgeTate`, `frobeniusPullbackMap`,
`frobPullback_bkTwist`. Tests: `pr5_frob_eta_is_p` (F(V(1)) = p),
`pr5_frob_preserves_distinguished`, `pr5_frob_kills_sen_automorphism`, `pr5_point_frobenius`.

**Absolute prismatic cohomology** (`absolute-prismatic-cohomology`). For an animated ring R the
family (A, I) ↦ Δ_{(A/I ⊗^L R)/A} is the prismatic cohomology sheaf H_Δ(R) ∈ D(WCart);
Δ_R^{[m]}{n} = RΓ(WCart, I^m ⊗ H_Δ(R){n}) ∈ D̂(Z_p), Δ_R = Δ_R^{[0]}{0}, and
RΓ_Δ^{[m]}(X){n} = lim over points Spec R → X. For a bounded qcqs formal scheme 𝔛 the sheaf
H_Δ(𝔛) is defined on transversal prisms. API: `Absolute.prismaticSheaf`, `prismaticSheafMap`,
`prismaticComplex`, `absolutePrismatic`, `prismPullback_prismaticSheaf`,
`absolutePrismatic_zero_zero`. Tests: `pr5_abs_sheaf_integers`, `pr5_abs_sheaf_zero_ring`,
`pr5_abs_fp` (Δ_{F_p} = Z_p), `pr5_abs_sheaf_fp_not_unit`.

**Absolute Hodge–Tate cohomology** (`absolute-hodge-tate-cohomology`). H_Δ̄(R) = ι^*H_Δ(R) with
conjugate filtration, gr_n = LΩ^n_R ⊗ O{−n}[−n]; Δ̄_R{n} = RΓ(WCart^HT, H_Δ̄(R){n}); fibre sequences
Δ_R^{[m+1]}{n} → Δ_R^{[m]}{n} → Δ̄_R{m+n}; the diffracted Hodge complex Ω̂^DHod_R = η^*H_Δ̄(R)
with Θ = −n on gr_n and Δ̄_R{n} = fib(Θ + n). API: `hodgeTateSheaf`, `absoluteHodgeTate`,
`diffractedHodge`, `diffractedHodgeFil`, `absolutePrismatic_fibre_sequence`,
`absoluteHodgeTate_fibre_sequence`. Tests: `pr5_ht_integers_h1` (Δ̄_Z = Z_p ⊕ Z_p[−1]),
`pr5_ht_integers_twist_h0`, `pr5_ht_sheaf_integers`, `pr5_ht_diffracted_integers`.

**Absolute Nygaard filtration** (`absolute-nygaard-filtration`). Fil^•_N Δ_R{n} is the fibre
product of RΓ(WCart, Fil^•_N F^*(H_Δ(R){n})) and Fil^•_Hodge dR̂_R over
Fil^•_Hodge dR̂_R ⊗̂ RΓ(WCart^HT, O); graded pieces sit in
gr^m_N Δ_R{n} → Fil_m^conj Ω̂^DHod_R → Fil_{m−1}^conj Ω̂^DHod_R (second map Θ + m). API:
`nygaardFil`, `nygaardTransition`, `nygaardFil_of_nonpos`, `nygaardGr`, `nygaard_fibre_sequence`,
`nygaardGr_fibre_sequence`, `nygaardToHodge`. Tests: `pr5_nyg_fil_zero`, `pr5_nyg_gr_fp`,
`pr5_nyg_gr_zero_integers`, `pr5_nyg_gr_one_integers` (gr^1_N Δ_Z = 0).

**Frobenius** (`absolute-frobenius`). Φ : F^*H_Δ(R) → H_Δ(R), φ{n} : Fil^n_N Δ_R{n} → Δ_R{n}
and its filtered form Fil^•_N Δ_R{n} → Δ_R^{[•−n]}{n} (index corrected, PrismaticCohomology/E51).
API: `relativeFrobenius`, `frobeniusEnd`, `absoluteFrobenius`, `nygaardToIdealFil`,
`prismaticSheafMap_relativeFrobenius`. Tests: `pr5_frob_fp_iso`, `pr5_frob_zp_not_iso`,
`pr5_frob_twist_zp_iso`.

### Theorems, with their hypotheses

- `wcart-quotient-presentation` (Proposition 3.2.3): WCart = [WCart_0 / W^×] as Zariski stacks,
  WCart_0 = Spf(A^0); every Cartier–Witt divisor is Zariski-locally principalized. W^× is flat,
  affine, not of finite type.
- `transversal-prism-coproducts` (§2.4): every prism receives a map from a transversal prism;
  (A, I) transversal and (B, J) bounded have a coproduct, flat over (B, J), faithfully flat if
  A ≠ 0; transversal approximations form a sifted category.
- `wcart-fibre-products-of-prisms` (Proposition 3.2.8, Corollaries 3.2.9, 3.2.10): for (A, I)
  bounded and (B, J) transversal, Spf(A) ×_{WCart} Spf(B) = Spf of the coproduct; ρ_B is affine;
  a bounded prism is transversal exactly when ρ_B is flat.
- `prismatic-crystals-on-wcart` (Proposition 3.3.5): D(WCart) ≃ lim D̂(A) over bounded prisms
  (equivalently all prisms, or transversal prisms), D(WCart) ≃ Tot D̂(A^•), and
  Perf(WCart) ≃ lim Perf(A): crystals on (Spf Z_p)_Δ. Boundedness is what identifies D̂(A) with
  D(Spf A).
- `sen-operator-classification` (Theorem 3.5.8): E ↦ (E_η, Θ_E) is fully faithful from
  D(WCart^HT) to D(Z[Θ]) with image the p-complete M on which Θ^p − Θ is locally nilpotent
  modulo p; RΓ(WCart^HT, E) = fib(Θ_E); the twists generate.
- `frobenius-pullback-square` (Theorem 3.6.7, for E on WCart; PrismaticCohomology/E52):
  RΓ(WCart, E) = RΓ(WCart, F^*E) ×_{RΓ(WCart^HT, F^*E)} ρ_dR^*E, with fibre sequence
  RΓ(WCart, E) → RΓ(WCart, F^*E) → ρ_dR^*E[−1].
- `relative-site-comparison` (Theorem 4.3.6): for 𝔛 bounded over A/I whose affine opens satisfy
  the Tor-amplitude condition (∗), the animated relative complex is the cohomology of
  (𝔛/A)_Δ; under (∗⁺) it is the initial prism.
- `absolute-relative-comparison` (Propositions 4.4.8, 4.4.12): ρ_B^*H_Δ(R) = Δ_{(B/J ⊗^L R)/B}
  for every bounded prism; H_Δ(R) ≅ ρ_{B*}Δ_{R/B} and Δ_R^{[m]}{n} ≅ J^mΔ_{R/B}{n} when (B, J)
  is **perfect**.
- `absolute-prismatic-descent` (Propositions 4.4.14, 4.4.15, 4.4.25, 4.4.32): étale descent,
  derived descent along F_p^{⊗•+1}, invariance under p-completion, quasisyntomic descent on
  p-quasisyntomic formal schemes.
- `absolute-site-comparison` (Theorem 4.4.30): for 𝔛 bounded with p-quasisyntomic affine opens,
  RΓ_Δ^{[m]}(𝔛){n} ≅ RΓ(𝔛_Δ, I_Δ^m{n}). Without the hypothesis only the map is defined.
- `absolute-crystalline-comparison` (Theorem 4.6.1): for a quasisyntomic F_p-scheme X,
  RΓ_Δ(X) ≅ RΓ_crys(X/Z_p), Frobenius-semilinear over W(k).
- `absolute-de-rham-comparison` (Theorem 5.4.2, Proposition 5.4.8): ρ_dR^*H_Δ(R) ≅ dR̂_R and
  Δ_{F_p ⊗^L R} ≅ dR̂_R for every animated ring R.
- `absolute-nygaard-graded-pieces` (Propositions 5.5.12, 5.5.19, 5.5.20, 5.8.2):
  Δ_R{n}/Fil^m_N → dR̂_R/Fil^m_Hodge is an isogeny, an isomorphism for m < p; gr^m_N lies in
  D^{≤m}; descent; Nygaard completeness for R p-torsion-free with R/p regular Noetherian.
- `absolute-nygaard-perfect-prism` (Theorem 5.6.2, Corollary 5.6.3, §5.3): over a perfect prism
  the absolute and relative Nygaard filtrations agree; for R quasiregular semiperfectoid
  Fil^m_N Δ_R{n} = {x : φ(x) ∈ Δ_R^{[m−n]}{n}}; in characteristic p the filtration is the
  divided-power filtration of A_crys and the Nygaard filtration of WΩ.

### Dependencies

Inside the roadmap: PR.0 (prisms, δ-rings with W as right adjoint, rigidity, envelopes, perfect
prisms, the q-de Rham and crystalline prisms), PR.1 (sites, structure sheaf, base change,
crystalline comparison), PR.2 (derived prismatic cohomology, conjugate filtration, Künneth,
quasiregular semiperfectoid prisms, quasisyntomic descent), PR.3 (twists, relative Nygaard
filtration, divided Frobenius, de Rham comparison). PR.4 and PR.7 consume this layer. Other
roadmaps, each with a request: `LanglandsParameterStacks:LP1` (stacks, quotient and classifying
stacks, D and Perf of a stack), `SchemeAndStackFoundations:SF.1` (effective fpqc descent, torsors),
`DerivedDeRhamCohomology:DD.0`, `DD.1`, `DD.2`, `DD.4`, `DD.5`, `CrystallineCohomology:CR.0`,
`CR.2`, `CR.4`; nodes of `EnhancedDerivedSheaves` E0, E2, E3, E5 for limits, descent, Kan
extension and animated rings. Mathlib: `WittVector` with `frobenius`, `verschiebung`,
`teichmuller`, `map`, `constantCoeff`, the identities `verschiebung_mul_frobenius` and
`frobenius_verschiebung`, and `Module.Invertible`.

### Gaps and source corrections

One gap: no atlas stage supplies the category of bounded p-adic formal schemes with its étale and
p-quasisyntomic topologies; the global statements of `absolute-prismatic-site`,
`absolute-prismatic-cohomology`, `absolute-prismatic-descent` and `absolute-site-comparison` need
it, their affine forms do not. Eight issues in Bhatt–Lurie are recorded
(PrismaticCohomology/E51–E58), of which E51 (index of the filtered Frobenius) and E52 (Theorem
3.6.7) touch stated results and E55 is an unproved descent claim. Not planned: Bhatt–Lurie
§§3.7–3.9, 4.8, 4.9 and 6.

### Acceptance tests

Affine polynomial: ρ_A^*H_Δ(Z[x_1, …, x_d]) = Δ_{(A/I)[x_1, …, x_d]/A}; Δ_{F_p[x]} is the
p-completed de Rham complex of Z_p[x]. Quasisyntomic: for R p-quasisyntomic, Δ_R and its Nygaard
filtration are totalizations over a quasiregular semiperfectoid Čech nerve, and agree with the
site cohomology of (Spf R)_Δ. Perfectoid: Δ_{A/I} = A, Fil^m_N = φ^{−1}(I^m). Hodge–Tate:
RΓ(WCart^HT, O{n}) is Z_p ⊕ Z_p[−1] for n = 0 and (Z_p/n)[−1] otherwise. Frobenius:
Δ_{Z_p} → Δ_{Z_p} → Z_p[−1] is a fibre sequence. Distinctions: the de Rham point is not flat,
the atlas is; I is not trivial on WCart; a non-perfect base prism does not compute Δ_R.

# Layer PR.6. q-crystalline charts and the AΩ comparison

Source: Bhatt–Scholze, *Prisms and prismatic cohomology*, §§16–18 (arXiv v4), read completely; BMS1 §§7–9 only for the statements that `AInfCohomology` owns. The stage has 24 nodes. Lean names live in `TauCeti.Prismatic.QCrys` and `TauCeti.Prismatic.AOmega`.

**Conventions.** $A=\mathbb Z_p[[q-1]]$ with $\delta(q)=0$, $[p]_q=1+q+\dots+q^{p-1}$, and $(A,([p]_q))$ is the q-de Rham prism of PR.0. All completions are derived $(p,[p]_q)$-completions, which agree with $(p,q-1)$-completions on $A$-modules. Mathlib has `Polynomial.cyclotomic` and the geometric-sum identities but no q-factorials or Gaussian binomials at the pin (its Pochhammer file lists them as missing), so $[p]_q$ is stated as a geometric sum and compared with the cyclotomic polynomial. The general q-integers, the q-derivative and the framed q-de Rham Koszul complex are owned by `QWittVectors:QW.6` and are imported.

### q-PD pairs

`q-divided-power-operation` (definition). For a δ-$A$-algebra $D$ put $N(D)=\varphi^{-1}([p]_qD)$; if $D$ is $[p]_q$-torsion-free, $\gamma(x)=\varphi(x)/[p]_q-\delta(x)$ on $N(D)$. Fixed with it: $\varphi(q-1)=(q-1)[p]_q$; $[p]_q\equiv p$ mod $q-1$; $\delta([p]_q)\equiv 1$ mod $[p]_q$; $\gamma(x+y)=\gamma(x)+\gamma(y)+((x+y)^p-x^p-y^p)/p$; $\gamma(fx)=\varphi(f)\gamma(x)-x^p\delta(f)$; hence the two conditions on a q-PD ideal can be checked on generators. At $q=1$, $\gamma(x)=x^p/p$; the unit $\prod_{j<p}[j]_q$ is not divided out. API: `pAnalog`, `pAnalog_eq_eval_cyclotomic`, `pAnalog_mul_sub_one`, `pAnalog_one`, `frobeniusPreimageIdeal`, `gamma`, `pAnalog_mul_gamma`, `gamma_add`, `gamma_mul`, `delta_pAnalog_sub_one_mem`. Tests: `pr6_gamma_q_sub_one` ($\gamma(q-1)=(q-1)-\delta(q-1)$), `pr6_gamma_at_q_one`, `pr6_gamma_p_padic` ($\gamma(p)=p^{p-1}$ in $\mathbb Z_p$), `pr6_pAnalog_two`, `pr6_p_not_mem_frobenius_preimage`.

`q-pd-pair` (definition, planet). A q-PD pair is a δ-pair $(D,I)$ over $(A,(q-1))$, with $D$ and $I$ derived $(p,[p]_q)$-complete, such that (1) $\varphi(I)\subset[p]_qD$ and $\gamma(I)\subset I$; (2) $(D,([p]_q))$ is a bounded prism; (3) $D/(q-1)$ is $p$-torsion-free of finite $(p,[p]_q)$-complete Tor-amplitude over $D$. It is a property, not a structure. δ-PD pairs are those with $q=1$. API: `QPDPair`, `QPDPair.Hom`, `QPDPair.prism`, `QPDPair.prism_I`, `QPDPair.IsDeltaPD`, `QPDPair.frobenius_mem`, `QPDPair.gamma_mem`, `QPDPair.isAdicComplete`. Tests: `pr6_qpd_pair_initial`, `pr6_qpd_pair_classical`, `pr6_qpd_pair_zero_ideal`, `pr6_qpd_pair_p_not_mem`, `pr6_qpd_pair_sub_one_frobenius`.

`delta-pd-pairs` (comparison, Remarks 16.3–16.4): a δ-PD pair is a $p$-torsion-free δ-ring with $D$ and $I$ $p$-complete and $x^n/n!\in I$ for $x\in I$; reduction modulo $q-1$ is left adjoint to the inclusion of δ-PD pairs. `q-pd-homological-properties` (lemma, 16.5): $D$ is derived $f$-complete for $f\in I$; completed base change to $D/(q-1)$ is conservative on complete complexes and commutes with totalisations in $D^{\ge0}$; the completed ideal generated by an ideal satisfying (1)–(3) is a q-PD ideal; q-PD pairs extend along completely flat δ-maps. `smallest-largest-q-pd-ideals` (theorem, 16.7–16.8, 16.9 (1)): if $[p]_qz=\varphi(f)$ then $\varphi(z-\delta(f))\in[p]_qD$, proved here for every δ-$A$-algebra by applying δ to the relation; $(q-1)$ is the smallest and $N(D)$ the largest q-PD ideal; $(A,(q-1))$ is initial. `ainf-q-pd-pair` (lemma, 16.9 (2), Notation 17.1): for a perfectoid field $C\supset\mu_{p^\infty}$ of characteristic 0, $q=[\epsilon]$ and $\xi=\varphi^{-1}([p]_q)$ make $(A_{\inf},(\xi))$ a q-PD pair with thickening $\theta$, and $[p]_q=\tilde\xi$ generates $\ker\tilde\theta$.

### q-PD envelopes

`q-pd-envelope` (construction, 16.10). For a q-PD pair $(D,I)$, a complete, completely flat δ-$D$-algebra $P$ and a sequence $x_1,\dots,x_r$ completely regular relative to $D$, with $J=(I,x_1,\dots,x_r)$: $D_{J,q}(P)=P\{\varphi(x_i)/[p]_q\}^\wedge$ is completely flat over $D$; with $K$ the minimal complete γ-stable ideal containing $J$, $P/J\cong D_{J,q}(P)/K$, and $(P,J)\to(D_{J,q}(P),K)$ is the universal map to a q-PD pair. The construction extends to Zariski-local and filtered-colimit ideals. API: `envelope`, `envelopeMap`, `envelopePair`, `envelopeMap_delta`, `envelope_frobenius_mem`, `envelopeMap_mem`, `envelopeQuotientEquiv`, `envelopeLift`, `envelopeLift_comp`, `envelopeLift_unique`. Tests: `pr6_envelope_empty_sequence`, `pr6_envelope_frobenius_divisible`, `pr6_envelope_universal_identity`, `pr6_envelope_not_surjective`.

`q-pd-envelope-base-change` (theorem, 16.10 (3), 16.11): envelopes commute with completed base change of q-PD pairs; modulo $q-1$ the envelope is the $p$-completed PD envelope, whose ideal is the smallest one containing the generators and stable under $f\mapsto f^p/p$; and $D_{J,q}(P)$ is the prismatic envelope of PR.0 for the ideal $([p]_q,\varphi(x_i))$.

### The q-crystalline site

`q-crystalline-site` (definition, planet). For a $p$-completely smooth $D/I$-algebra $R$, $(R/D)_{q\text{-crys}}$ is the opposite of the category of q-PD pairs $(E,J)$ over $(D,I)$ with a map $R\to E/J$, with the indiscrete topology; $q\Omega_{R/D}=R\Gamma((R/D)_{q\text{-crys}},\mathcal O)$ is a complete commutative algebra in $D(D)$ with a $\varphi_D$-semilinear Frobenius. API: `Thickening`, `Thickening.Hom`, `Thickening.base`, `qCrystallineCohomology`, `qCrystallineFrobenius`, `qCrystallineEval`, `qCrystallineMap`, `qCrystallineBaseIso`. Tests: `pr6_qcrys_base` ($q\Omega_{(D/I)/D}=D$), `pr6_qcrys_eval_natural`, `pr6_qcrys_map_id`, `pr6_qcrys_not_structure_ring`.

`q-crystalline-cech-alexander` (construction, 16.13, 16.16): for a completed polynomial presentation $P\to R$ and the free δ-algebra $F$ on $P$, the cosimplicial ring $D_{J^\bullet,q}(F^\bullet)$ is the Čech nerve of a weakly initial thickening and computes $q\Omega_{R/D}$; a smooth δ-lift gives a small variant. API: `cechAlexanderComplex`, `cechAlexanderIso`, `cechAlexanderZero`, `cechAlexanderZero_weaklyInitial`, `cechAlexanderSmallComplex`, `cechAlexanderSmallIso`. Tests: `pr6_cech_alexander_independent`, `pr6_cech_alexander_weakly_initial_base`, `pr6_cech_alexander_base_presentation`, `pr6_cech_alexander_not_cech_nerve`.

Theorems. `q-crystalline-crystalline-comparison` (16.14): $q\Omega_{R/D}\widehat\otimes^L_DD/(q-1)\simeq R\Gamma_{\mathrm{crys}}(R/(D/(q-1)))$; hence $q\Omega_{-/D}$ is a Zariski sheaf. `q-pd-thickening-invariance` (16.17): for q-PD ideals $J\subset I$ of one δ-ring and a smooth lift $\tilde R$ of $R$ to $D/J$, $q\Omega_{\tilde R/D}\simeq q\Omega_{R/D}$. `q-crystalline-prismatic-comparison` (16.18, planet): with $R^{(1)}=R\widehat\otimes_{D/I,\varphi_D}D/([p]_q)$ there is a canonical isomorphism $\Delta_{R^{(1)}/D}\simeq q\Omega_{R/D}$ over the prism $(D,([p]_q))$, induced by $(E,J)\mapsto(E,([p]_q))$ and compatible with Frobenius; the twist $R^{(1)}$ is part of the statement.

### Framed q-PD data and q-de Rham complexes

From here $D$ is flat over $A$. `framed-q-pd-datum` (definition). A framed $D$-algebra $(P,S)$ is the $(p,q-1)$-complete case of the framed algebras of `QWittVectors:QW.6`: the automorphisms $\gamma_s$ lifting $X_s\mapsto qX_s$, the q-derivatives $\nabla_{q,s}=(\gamma_s-1)/((q-1)X_s)$, the twisted Leibniz rule, the framed complex and its reduction modulo $q-1$ are imported. PR.6 adds the δ-structure with $\delta(X_s)=0$, for which the $\gamma_s$ are δ-maps, and the ideal $J=\ker(P\to R)$ of a framed q-PD datum $(P,S,J)$. API: `FramedAlgebra`, `FramedAlgebra.delta_coord`, `FramedAlgebra.gamma_coord_self`, `FramedAlgebra.gamma_coord_of_ne`, `FramedAlgebra.gamma_comm`, `FramedAlgebra.gamma_delta`, `FramedAlgebra.sub_one_mul_coord_mul_nabla`, `FramedDatum`, `FramedDatum.Hom`. Tests: `pr6_framed_nabla_coord_pow` ($\nabla_q(X^{n+1})=[n+1]_qX^n$), `pr6_framed_nabla_const`, `pr6_framed_gamma_frobenius`, `pr6_framed_two_framings_gamma`.

`gamma-extension-to-q-pd-envelope` (lemma, 16.21): each $\gamma_s$ extends uniquely to an automorphism of $D_{J,q}(P)$ congruent to the identity modulo $(q-1)X_s$, because $\varphi(\gamma_s f)=\varphi(f)+[p]_q(q-1)X_s^p\varphi(g)$; the resulting q-derivatives lift the PD derivations modulo $q-1$.

`framed-q-de-rham-complex` (construction, 16.20): $q\Omega^{*,\square}_{D_{J,q}(P)/D}$ is the Koszul complex of the $\nabla_{q,s}$ on the envelope; it is functorial for morphisms of framed q-PD data, reduces modulo $q-1$ to the PD de Rham complex, carries the Frobenius $\nabla_{q,s}\varphi=[p]_qX_s^{p-1}\varphi\nabla_{q,s}$, and for units $X_s$ equals $\eta_{q-1}$ of the Koszul complex of the $\gamma_s-1$. API: `FramedDatum.envelope`, `FramedDatum.envelopeMap`, `FramedDatum.envelopeFramed`, `FramedDatum.envelopeFramed_gamma`, `FramedDatum.qDeRhamComplex`, `FramedDatum.qDeRhamMap`, `FramedDatum.qDeRhamFrobenius`, `FramedAlgebra.nabla_frobenius`. Tests: `pr6_qdr_polynomial_nabla`, `pr6_qdr_at_q_one_derivative` (agreement with `Polynomial.derivative`), `pr6_qdr_no_coordinates`, `pr6_qdr_two_framings_differ`, `pr6_qdr_leibniz`.

Theorems. `q-de-rham-comparison` (16.22, planet): $q\Omega_{R/D}\simeq q\Omega^{*,\square}_{D_{J,q}(P)/D}$, naturally in the framed datum and compatibly with Frobenius; the proof is the bicomplex over the Čech nerve of $D\to P$, with rows contractible and columns quasi-isomorphic by the PD Poincaré lemma modulo $q-1$. `change-of-framing`: two framed data for the same $R$ are joined through the coproduct datum by quasi-isomorphisms whose composite is the composite of the identifications with $q\Omega_{R/D}$; the cocycle identity for three framings follows, and local charts descend to the Zariski sheaf. `q-de-rham-prismatic-comparison-zp` (Example 1.9 (4)): for a $p$-completely smooth $\mathbb Z_p$-algebra $R$ with an étale framing, $q\Omega_R^\square\simeq q\Omega_{R/A}\simeq\Delta_{R^{(1)}/A}$ with $R^{(1)}=R\widehat\otimes\mathbb Z_p[\zeta_p]$ over $(\mathbb Z_p[[q-1]],([p]_q))$. This is a statement for one prime; it does not glue all primes into a Habiro theory, which `HabiroCohomologyFoundations` HQ.1–HQ.2 own.

### Comparison with AΩ

Let $C$ be a perfectoid field of characteristic 0 containing $\mu_{p^\infty}$ and $A=A_{\inf}(\mathcal O_C)$. `ainf-omega-comparison-map` (construction): for a very small $R$ and every finite generating set $\Sigma$ of units, the universal property of the q-PD envelope of the torus $P_\Sigma$ gives a unique δ-map $\mu_0:D_{J_\Sigma,q}(P_\Sigma)\to A_{\inf}(R_{\Sigma,\infty})$ intertwining $\gamma_s$ with the Galois automorphism $\sigma_s$; applying $\eta_{q-1}$ to Koszul complexes and passing to the colimit over $\Sigma$ gives $\mu_R:q\Omega_{R/A}\to A\Omega_R$, a Frobenius-compatible map of $E_1$-algebras. API: `Chart`, `coordinateMap`, `coordinateMap_comp`, `coordinateMap_gamma`, `AOmegaData`, `frobeniusPullback`, `comparisonMap`, `comparisonMap_frobenius`. Tests: `pr6_mu_torus_coordinate`, `pr6_mu_point`, `pr6_mu_frobenius_square`, `pr6_mu_needs_decalage`.

`hodge-tate-comparison-criterion` (lemma, 17.4): a map $E\to F$ of $d$-complete algebras whose reductions have cohomology the de Rham complex of $R$ through structure maps $\eta_E,\eta_F$, and which intertwines them, is an isomorphism; only the ring structure on $H^*(-/d)$ is used. `ainf-omega-comparison` (theorem 17.2, planet): $A\Omega_R\simeq q\Omega_{R/A}\simeq\Delta_{R^{(1)}/A}=\varphi_A^*\Delta_{R/A}$ for the perfect prism $(A_{\inf},\ker\theta)$, as $E_\infty$-$A$-algebras with Frobenius; the $E_1$ comparison is upgraded by left Kan extension to quasiregular semiperfectoid algebras, where both sides are discrete commutative rings, and quasisyntomic descent. The Frobenius pullback is essential. `theta-theta-tilde-square` (comparison): along $\tilde\theta$ the comparison identifies $\tilde\Omega_R$ with Hodge–Tate cohomology $\bar\Delta_{R/A}$, with the two Hodge–Tate isomorphisms; along $\theta$ both sides give the de Rham complex; for the torus the two corners have $H^0=R$ and $H^0=\mathcal O_C$.

### Uniqueness

`comparison-uniqueness` (theorem 18.2 with Lemma 18.3, planet): for a perfect prism $(A,I)$ with $R=A/I$, prismatic cohomology with its Hodge–Tate structure map has no nontrivial endomorphisms among symmetric monoidal functors on $p$-completely smooth $R$-algebras with such a map; no Frobenius compatibility is imposed. Hence an isomorphism from $\Delta_{-/A}$ to another such functor is unique, and the q-crystalline, AΩ and Nygaard-complex comparisons are independent of coordinates and mutually compatible.


### The Nygaard filtration in q-de Rham coordinates

`nygaard-filtration-q-de-rham-coordinates` (BMS2 Remark 9.11). For a framed small O_C-algebra R with deformation R̃ over A_inf, let M^• be the framed q-de Rham complex in toric form, the Koszul complex of the operators (γ_i − 1)/(q − 1) on R̃, with Frobenius φ(T_i) = T_i^p multiplied by ξ̃^n in degree n. Then M^• ≅ φ_A^*Δ_{R/A} ≅ AΩ_R compatibly with Frobenius; φ_M(M^n) ⊂ ξ̃^n M^n and x ↦ φ_M(x)/ξ̃^n induces a bijection M^n/ξ → H^n(M^•/ξ̃), the q-analogue of the Cartier isomorphism; and the relative Nygaard filtration of PR.3 is represented by ξ^{max(i − •, 0)} M^•. The proof applies the criterion `PR.3/nygaard-filtration-in-coordinates` to this model; on the torus the bijection is the computation that [a]_q is a unit modulo [p]_q exactly when p does not divide a. For one coordinate, N^{≥i} is ξ^i·A_inf⟨T^{±1}⟩ → ξ^{i−1}·A_inf⟨T^{±1}⟩·d_q log T.

### Dependencies

Inside the roadmap: PR.0 (q-de Rham prism, prismatic envelopes, PD envelopes as δ-envelopes, bounded prisms, perfect prisms, free δ-rings), PR.1 (site, Čech–Alexander complexes, base change, crystalline and Hodge–Tate comparisons), PR.2 (derived prismatic cohomology, the prism of a quasiregular semiperfectoid ring, quasisyntomic descent), PR.3 (general de Rham comparison). Other roadmaps, each with a request: `QWittVectors:QW.6` (framed machinery, as a prefix independent of QW.5), `AInfCohomology:AI.1` (Koszul complexes and $\eta$), `AInfCohomology:AI.3` (AΩ), `AInfCohomology:AI.4` (Hodge–Tate specialisation, all-coordinates complexes), `CrystallineCohomology:CR.0` and `CR.2`, `DerivedDeRhamCohomology:DD.1` and `DD.5`, `EnhancedDerivedSheaves:E2` and `E3`, `PerfectoidQuotients:Q0:integral-algebra`. `HabiroCohomologyFoundations:HQ.1` should import the framed machinery from QW.6 and the q-crystalline part from here.

### Gaps and source issues

No gap is recorded. Eight findings in the source are new (PrismaticCohomology/E61–E68): the proof of Lemma 16.7 covers complete rings only (a direct proof is given); Lemma 16.5 (4) is used for ideals not known to be complete; Lemma 16.10 is applied to Zariski-local and colimit ideals; framings must be $(p,[p]_q)$-completely étale; two verifications are left out in the proofs of Theorems 16.18 and 17.2; and misprints. Registered misprints E27–E29 are cited, not repeated.

### Acceptance tests

One polynomial coordinate: $\nabla_q(X^n)=[n]_qX^{n-1}$, and for $R=\mathbb Z_p\langle T\rangle$ the complex modulo $[p]_q$ has $H^0=\mathbb Z_p[\zeta_p]\langle T^p\rangle$, matching the Hodge–Tate comparison for $R^{(1)}$. A torus: $x^n\mapsto[n]_qx^n$ on $A_{\inf}\langle x^{\pm1}\rangle$, with $\mu$ the inclusion into $A_{\inf}\langle x^{\pm1/p^\infty}\rangle$. Two framings: $T$ and $T+1$ give $\nabla'(T^2)=\nabla(T^2)+(q-1)$ and canonically isomorphic objects. The $\theta/\tilde\theta$ square: the two specialisations of the torus differ in $H^0$.

# Layer PR.7. Prismatic F-crystals and crystalline lattices

Source: Bhatt–Scholze, *Prismatic F-crystals and crystalline Galois representations* (arXiv:2106.14735v2, read in full; all numbers below are those of that version). The stage plans the coefficient theory of the absolute prismatic site and its main theorem: for K complete discretely valued of mixed characteristic with perfect residue field, finite locally free prismatic F-crystals on Spf(O_K) are the same as Z_p-lattices in crystalline representations of G_K. Lean names live in `TauCeti.Prismatic.FCrystal`.

**Conventions.** p is fixed; prisms are bounded; X_Δ is the absolute prismatic site of PR.5 (`PR.5/absolute-prismatic-site`), the opposite of the category of prisms (A, I) with Spf(A/I) → X. Vect(A) is the category of finite projective A-modules. A[1/I] is the ring of functions on Spec A ∖ V(I) (A[1/d] if I = (d)); A[1/I]^∧_p and A[1/p]^∧_I are classical completions. φ^*M = A ⊗_{φ,A} M. For O_K: W = W(k), A_inf = A_inf(O_C) = Δ_{O_C} with q = [ε], μ = q − 1, ξ̃ = [p]_q, θ̃ with kernel (ξ̃), θ = θ̃ ∘ φ; A_crys = A_inf{[p]_q/p}; B_dR^+ is the completion of A_inf[1/p] at ker θ̃. Filtered φ-modules carry their filtration on D ⊗_{W,φ} K. Hodge–Tate weights use HT(χ_cyc) = +1.

### Crystals and descent

`prismatic-crystal` (definition). Vect(X_Δ, O_Δ) := lim_{(A,I)} Vect(A): finite projective A-modules E(A) with base-change isomorphisms E(A) ⊗_A B ≅ E(B) satisfying the cocycle condition, recorded as functorial semilinear maps that are base changes. The same limit defines D_perf(X_Δ, O_Δ) and the variants over O_Δ[1/p]^∧_{I_Δ} and O_Δ[1/I_Δ]^∧_p. It carries the unit, tensor product, duals, evaluation at a prism, pullback along Y → X and base change of coefficients. API: `IsBaseChangeAlong`, `Crystal`, `Crystal.Hom`, `Crystal.Iso`, `Crystal.unit`, `Crystal.tensor`, `Crystal.pullback`, `Crystal.baseChange`. Tests: `pr7_crystal_unit_eval`, `pr7_crystal_base_change_id`, `pr7_crystal_initial_object_eval` (a site with an initial prism is controlled by its value there), `pr7_crystal_hodge_tate_quotient_not_projective` (A ↦ A/I is not a crystal in vector bundles).

`crystal-descent` (theorem, Proposition 2.7, Example 2.8). (A, I) ↦ Vect(A) is a sheaf of categories for the flat topology, so the limit is the category of vector bundles on the ringed topos; likewise for D_perf and for the two completed sheaves, the last by the Drinfeld–Mathew theorem (Theorem 2.2). For a cover (B, J) of the final object with Čech nerve B^•, a crystal is a module over B with a descent isomorphism over B^1 and the cocycle condition over B^2.

`quasisyntomic-crystal-comparison` (theorem, Propositions 2.13–2.14). For X quasi-syntomic, Vect(X_Δ, O_Δ) ≃ Vect(X_qsyn, Δ_•) = lim_{R ∈ X_qrsp} Vect(Δ_R), also for D_perf and the completed sheaves; for a quasi-syntomic cover R → S by a quasiregular semiperfectoid ring both sides are lim Vect(Δ_{S^•}).

### F-crystals, Laurent F-crystals and local systems

`f-crystal-over-prism` (definition, Definition 4.1, Example 4.3). Vect^φ(A): a finite projective A-module M with φ_M: (φ^*M)[1/I] ≅ M[1/I]; effective when φ_M(φ^*M) ⊂ M. Over the Breuil–Kisin prism these are Breuil–Kisin modules. In Lean this is concrete against Mathlib: the Frobenius is a φ-semilinear map M → A[1/I] ⊗_A M that is a base change. API: `IsAwayIdeal`, `OverPrism`, `OverPrism.Hom`, `OverPrism.IsEffective`, `OverPrism.unit`, `OverPrism.baseChange`. Tests: `pr7_over_prism_away_principal` (agreement with `Localization.Away`), `pr7_over_prism_unit_effective`, `pr7_over_prism_rank_one_scaling`, `pr7_over_prism_frob_ne_zero`.

`prismatic-f-crystal` (definition, Definition 4.1, Remark 4.2, Example 4.5). Vect^φ(X_Δ, O_Δ) = lim Vect^φ(A): a crystal E with φ_E: (φ^*E)[1/I_Δ] ≅ E[1/I_Δ]; rigid symmetric monoidal, with pullback, the variant in perfect complexes, and the Breuil–Kisin twists O_Δ{n} (from `PR.3/breuil-kisin-twist`) with φ^*O_Δ{1} ≅ I_Δ^{-1} ⊗ O_Δ{1}. The definition puts no bound on the poles of φ_E; the source says that with torsion or derived coefficients the right objects are different (F-gauges), and nothing about them is planned. API: `SiteData`, `SiteData.restrict`, `PrismaticFCrystal`, `PrismaticFCrystal.Hom`, `PrismaticFCrystal.eval`, `PrismaticFCrystal.IsEffective`, `PrismaticFCrystal.unit`, `PrismaticFCrystal.tensor`, `PrismaticFCrystal.pullback`, `breuilKisinTwist`. Tests: `pr7_fcrystal_eval_effective`, `pr7_fcrystal_twist_invertible`, `pr7_fcrystal_twist_not_effective`, `pr7_fcrystal_unit_effective`.

`laurent-f-crystal` (definition, Definition 3.2). For X bounded: crystals over O_Δ[1/I_Δ]^∧_p with φ^*E ≅ E, in vector bundles and in perfect complexes; the Frobenius of A[1/I]^∧_p exists because φ(I) ≡ I^p modulo p. API: `LaurentRing`, `laurentFrobenius`, `LaurentFCrystal`, `LaurentFCrystal.Hom`, `LaurentFCrystal.fixedPoints`. Tests: `pr7_laurent_char_p_zero` (the ring is zero when p ∈ I), `pr7_laurent_frobenius_extends`, `pr7_laurent_fixed_points_res`, `pr7_laurent_p_frobenius_non_example`.

`artin-schreier-riemann-hilbert` (theorem, Propositions 3.4 and 3.6). For every F_p-algebra S, D^b_lisse(Spec S, F_p) ≃ D_perf(S)^{φ=1} (Katz for vector bundles); and for R derived t-complete of characteristic p with t-completed perfection S, D_perf(R[1/t])^{φ=1} ≃ D_perf(S[1/t])^{φ=1}, using `PerfectoidSpaces:P3/henselian-finite-etale-approximation` and Lemma 9.2 of *Prisms* (PR.4).

`laurent-f-crystals-local-systems` (theorem, Corollaries 3.7 and 3.8, Example 3.5). For X bounded, Laurent F-crystals do not change under perfection of the prisms, and D_perf(X_Δ, O_Δ[1/I_Δ]^∧_p)^{φ=1} ≃ D^{(b)}_lisse(X_η, Z_p), Vect(…)^{φ=1} ≃ Loc_{Z_p}(X_η); for X = Spf(O_K) this is Rep_{Z_p}(G_K). The descent step uses v-descent on the diamond X_η, requested from `DiamondEtaleCohomology:C2`. No equivalence is claimed for Q_p-local systems that are not isogenous to Z_p-local systems.

`etale-realization` (construction, Construction 4.8, Example 4.9). T(E) = E ⊗ O_Δ[1/I_Δ]^∧_p, a symmetric monoidal functor to Laurent F-crystals for every X, and to Loc_{Z_p}(X_η) for X bounded (the boundedness hypothesis is missing in the source's statement and is added); T(O_Δ{i}) = Z_p(i). API: `etaleRealization`, `etaleRealizationMap`, `etaleRealization_eval`, `OKData.galoisRep`. Tests: `pr7_etale_real_unit`, `pr7_etale_real_char_p_zero`, `pr7_etale_real_map_injective_transversal`, `pr7_etale_real_not_full`.

`crystalline-realization` (construction, Example 4.7, Construction 4.12). For X quasi-syntomic and Z_p-flat: on X_{p=0} every prism is crystalline and prismatic F-crystals are F-crystals on the crystalline site (`CrystallineCohomology:CR.1`); pullback gives D_crys, and forgetting Frobenius gives D_dR. API: `ideal_eq_span_p_of_mem`, `crystallineRealization`, `deRhamRealization`. Tests: `pr7_crys_real_site_crystalline`, `pr7_crys_real_eval`, `pr7_crys_real_twist_value` (the twist is p^{-1}φ on a crystalline prism), `pr7_crys_real_not_effective`.

`f-crystals-over-qrsp` (theorem, Example 4.10, Lemma 4.11). For R quasiregular semiperfectoid, Vect^φ(Spf(R)_Δ, O_Δ) = Vect^φ(Δ_R); if R is p-torsion-free, Δ_R is transversal, Δ_R → Δ_R[1/I]^∧_p is injective and T is faithful.

### The case of O_K

`breuil-kisin-and-ainf-covers` (construction, Example 2.6, Construction 7.13, Notations 5.1 and 7.1). The Breuil–Kisin prism (𝔖, (E(u))) of a uniformizer and the A_inf-prism are objects of Spf(O_K)_Δ covering the final object; the coproduct of 𝔖 with (B, J) is the prismatic envelope B[u]{(u − v)/J}^∧; the Čech nerves are 𝔖^{(•)} (with 𝔖^{(1)} = W[[u, v]]{(u − v)/E(u)}^∧) and Δ of the completed tensor powers of O_C over O_K; u ↦ [π^♭] is a map 𝔖 → A_inf over O_K, and G_K acts on A_inf. Crystals are modules over either cover with descent data over the self-coproduct. API: `OKData`, `OKData.bk_covers`, `OKData.ainf_covers`, `OKData.evalBK`, `OKData.evalAinf`. Tests: `pr7_ok_bk_to_ainf_base_change`, `pr7_ok_ainf_perfect`, `pr7_ok_bk_not_perfect`, `pr7_ok_bk_orientable`.

`bkf-modules-comparison` (comparison, Theorem 5.2). Vect^φ(Spf(O_C)_Δ, O_Δ) = Vect^φ(A_inf) is the category of finite free Breuil–Kisin–Fargues modules of `AInfCohomology:AI.2`; M ↦ (T, F) with T = (M ⊗ W(C^♭))^{φ=1} and F = φ^*M ⊗ B_dR^+ ⊂ T ⊗ B_dR is Fargues' functor, of which only full faithfulness is used. Fargues' theorem and Lemma 4.26 of BMS1 are imported, not planned again.

`crystalline-representation-of-f-crystal` (theorem, Proposition 5.3, Remark 5.4). For E on Spf(O_K): T(E) ⊗ B_crys ≅ E(W(k)) ⊗_W B_crys, G_K- and φ-equivariantly (crystal property for A_inf → A_crys and Dwork's trick), so T(E)[1/p] is crystalline with D_crys = E(W(k))[1/p]; and the lattice F equals D_dR ⊗_K B_dR^+.

`etale-realization-fully-faithful` (theorem, proof of Theorem 5.6 in §5, Construction 5.5, Remark 5.7). T is fully faithful on Vect^φ(Spf(O_K)_Δ, O_Δ): faithful on every term of the Čech nerve of Spf(O_C) → Spf(O_K), full over O_C by Fargues' full faithfulness, and the two pullbacks to the self-product agree by faithfulness there.

`period-sheaves-qrsp` (construction, Constructions 6.2, 6.4, Lemma 6.7). On X_qrsp: Δ_•, A_crys = Δ_•{I/p}, Δ_•⟨I/p⟩, Δ_•{φ(I)/p}, Δ_•[1/I]^∧_p, B_dR^+ = (Δ_•[1/p])^∧_I, the maps between them, the Frobenius φ̃, and B_dR^+ ≅ Δ_•⟨φ^n(I)/p⟩[1/p]^∧_I for transversal prisms. API: `Period.Rational`, `Period.toRational`, `Period.rationalFrobenius`, `Period.BdRPlus`, `Period.bdRPlus_equiv_rational`. Tests: `pr7_period_rational_p_dvd`, `pr7_period_bdr_plus_p_unit`, `pr7_period_rational_frobenius_extends`, `pr7_period_frobenius_not_lift` (φ on Z_p⟨u/p⟩ is not a Frobenius lift).

`filtered-phi-module-to-crystal` (construction, Construction 6.5, Remark 6.6). A filtered φ-module D gives the F-crystal M(D)_{⟨I/p⟩} over Δ_•⟨I/p⟩[1/p]: base change of D to Δ_•{I/p}, twist by φ̃, and Beauville–Laszlo modification along I = 0 by Fil^0(D_K ⊗ B_dR); it continues uniquely to Δ_•⟨φ^n(I)/p⟩[1/p]. API: `OKData.filteredCrystal`, `OKData.filteredCrystal_rank`, `OKData.filteredCrystal_restrict`. Tests: `pr7_filtered_crystal_rank_zero`, `pr7_filtered_crystal_finite_projective`, `pr7_filtered_crystal_twist`, `pr7_filtered_crystal_not_integral`.

`tate-twist-analytic-continuation` (theorem, Proposition 6.8). For R a p-torsion-free quasiregular semiperfectoid O_C-algebra and n ≥ 0, Δ_R{n}^{φ=1}[1/p] ≅ Δ_R⟨I/p⟩{n}^{φ=1}[1/p]. This is where the Beilinson fibre square enters: `RefinedTraceMethods:RT.3b` is asked for the pullback square Q_p(n)(R) → Q_p(n)(R/p) over (LΩ_R^{≥n})_{Q_p} → (LΩ_R)_{Q_p}, with p-completion before inverting p, the description of the right vertical map on quasiregular semiperfectoid rings, and the dictionary by which the cofibre of TC(R; Q_p) → TC(R/p; Q_p) is Σ²HC(R; Q_p); `RefinedTraceMethods:RT.6` is asked only for the identification of the TC-defined Z_p(n) with the syntomic complex of `PR.4/syntomic-complex`.

`descent-data-boundedness` (theorem, Lemma 6.9, Proposition 6.10). For M ∈ Vect^φ(A_inf), a descent datum on M⟨I/p⟩[1/p] relative to Spf(O_C) → Spf(O_K) extends uniquely to M[1/p]; the proof patches over the two charts ⟨(q_1−1)^p/p⟩ and ⟨p/(q_1−1)^p⟩ of Δ_{O_C ⊗̂ O_C} using the previous node.

`weakly-admissible-extension-over-ainf` (theorem, §6.4). For D weakly admissible, the value of M(D) on Spf(O_C) extends to a Breuil–Kisin–Fargues module: its φ-module over the Robba ring is a semistable bundle of slope 0 on the Fargues–Fontaine curve, hence trivial. The three Fargues–Fontaine statements (Corollary 11.2.22, Proposition 10.5.6, Theorem 8.2.10 (1)) are requested from `VectorBundlesAndIsocrystals:VB2:classification`.

`crystalline-lattice-to-f-crystal` (construction, §6.4). The quasi-inverse L ↦ 𝔐(L): the extension over A_inf, the bounded descent datum, a modification along p = 0 making the lattice G_K-stable, and integrality of the descent datum. API: `OKData.latticeFCrystal`, `OKData.latticeFCrystal_realization`, `OKData.latticeFCrystal_unique`. Tests: `pr7_lattice_rank`, `pr7_lattice_twist` (𝔐(Z_p(n)) = O_Δ{n}), `pr7_lattice_hom`, `pr7_lattice_not_all_representations`.

`crystalline-lattices-theorem` (theorem, Theorem 5.6). T: Vect^φ(Spf(O_K)_Δ, O_Δ) → Rep^crys_{Z_p}(G_K) is an equivalence of symmetric monoidal categories.

`mod-p-full-faithfulness-fails` (application, Remark 5.8). For K = Q_p the F-crystal O_Δ{p−1}/p has trivial étale realisation and is not trivial, so the theorem fails with mod p coefficients; the stage makes no claim about torsion or derived representations.

### Breuil–Kisin modules

`etale-realization-over-breuil-kisin-prism` (theorem, Theorem 7.2, Lemmas 7.3–7.7). Vect^φ(𝔖) → Vect^φ(𝔖[1/E]^∧_p) ≃ Rep_{Z_p}(G_{K_∞}) is fully faithful, by the source's proof through A_inf and the adic spaces of 𝔖 and A_inf.

`breuil-kisin-evaluation` (theorem, Theorem 7.9, Corollary 7.10, Remark 7.12). D_𝔖 = ev_𝔖 ∘ 𝔐 is fully faithful; restriction from G_K to G_{K_∞} is fully faithful on crystalline lattices; and D_{𝔖_π}(L) ⊗ A_inf does not depend on the uniformizer.

`kisin-functor-comparison` (comparison, Remark 7.11). Effective objects of Vect^φ(𝔖) are Kisin's modules of finite E-height; D_𝔖(L) is the unique lattice of finite E-height in the étale φ-module of L restricted to G_{K_∞}, i.e. Kisin's module for L^∨. Prerequisites are nodes of the packet of `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

### Dependencies

Inside the roadmap: PR.0 (prisms, envelopes, perfection, the Breuil–Kisin and A_inf prisms), PR.1 (flat descent of O_Δ, crystalline comparison), PR.2 (the prism of a quasiregular semiperfectoid ring, quasi-syntomic covers), PR.3 (Nygaard filtration, twists), PR.4 (φ-fixed points, étale comparison, syntomic complexes), PR.5 (the site, the absolute Nygaard filtration, the Hodge–Tate divisor). Other roadmaps, each with a request: `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`, `DerivedDeRhamCohomology:DD.1`, `DD.4`, `DD.5`, `EnhancedDerivedSheaves:E3`, `CrystallineCohomology:CR.1`, `DiamondEtaleCohomology:C2`, `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidQuotients:Q2`, `AInfCohomology:AI.2`, `PadicHodgeTheory:R06.1`, `R06.2`, `P7:annulus-foundations`, `VectorBundlesAndIsocrystals:VB2:classification`, `RefinedTraceMethods:RT.3b`, `RefinedTraceMethods:RT.6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; nodes of the PerfectoidSpaces P3, PadicHodgeTheory R06 and R07.4 packets are cited by id.

### Gaps

Three: the almost description of the perfection of Δ_{O_C ⊗̂ O_C} as Cont(G_K, A_inf), which the source asserts without reference and whose owners (perfectoidization as arc-cohomology) are not yet in the atlas; the matching of the Fargues–Fontaine bundle of a filtered φ-module with M(D); and the extension of the period-ring nodes of R06 from finite extensions of Q_p to perfect residue fields. Two statements (Theorem 7.2 and Corollary 7.10) also have nodes in the R07.4 packet with Kisin's proofs; the overlap is recorded for an owner decision.

### Acceptance

The unit object and O_Δ{n} ↔ Z_p(n) on every functor; Hom(O_Δ, O_Δ{n}) = 0 for n ≠ 0; the fundamental exact sequence as the case R = O_C of the fibre square; K = Q_p(p^{1/p}) with a pole of 1/(u − p) at x_1 (Example 7.8); 𝔖{−1} as Kisin's module of height one; the mod p counterexample; a ramified finite-order character as a lattice outside the image.

# Requests, gaps and coverage

## Requests to other roadmaps

Each entry names the layer that owns the statement, the statement needed and the declarations of this plan that use it. The owning layer is the prerequisite; nothing below is planned here.

**AInfCohomology:AI.1**

- For an invertible ideal I of a ring A (and of the structure sheaf of a ringed topos) and K in D(A): (i) BMS2 Proposition 5.8: Lη_I K is the underlying complex of the connective cover τ^{≤0}_B(I^• ⊗ K) of the I-adic filtration for the Beilinson t-structure, with the filtration G^i = I^i K^• ∩ η_I K^• on an I-torsion-free representative; (ii) BMS1 Lemma 6.9 and Lemma 6.10: the natural transformations I^{⊗m} ⊗ τ^{≤m} → τ^{≤m} Lη_I and, where H^n is I-torsion-free, τ^{≥n} Lη_I → I^{⊗n} ⊗ τ^{≥n}, with both composites on τ^{[n,m]} equal to the natural maps, and the resulting map Lη_I C → C for C in D^{≥0} with H^0(C)[I] = 0; (iii) BMS1 Lemma 6.13: the Bockstein reduction Lη_I C ⊗^L A/I ≃ (H^•(C/I), β) of the node bockstein-reduction is multiplicative for commutative algebra objects; (iv) compatibility of Lη_I with flat base change of ringed topoi (BMS1 Lemma 6.14). Needed by: `PR.3/leta-frobenius-factorisation`, `PR.3/de-rham-comparison-general`, `PR.3/image-of-frobenius`, `PR.3/nygaard-filtration-in-coordinates`.
- The décalage functor Lη_f, the formula H^j(Lη_μ C) ≅ H^j(C)/H^j(C)[μ] (BMS1 Lemma 6.4), the composition Lη_ξ Lη_{φ^{−1}(μ)} = Lη_μ and the map ξ^i : τ^{≤i}D → τ^{≤i}Lη_ξ D. Needed by: `PR.4/leta-frobenius-fixed-points`.
- Koszul complexes of commuting endomorphisms (BMS1 Definition 7.1), their differential graded algebra structure (Lemma 7.5), the computation of continuous cohomology of Z_p^d by a Koszul complex (Lemma 7.3), and η_f Kos(g_1, …, g_m) ≅ Kos(g_1/f, …, g_m/f) when f divides all g_i, with the version tensored with an f-torsion-free complex (Lemma 7.9); η_f of a differential graded algebra with torsion-free terms is a differential graded algebra (Lemma 6.13). Needed by: `PR.6/framed-q-de-rham-complex`, `PR.6/ainf-omega-comparison-map`.

**AInfCohomology:AI.2**

- For C complete algebraically closed and A_inf = A_inf(O_C), with θ̃ = θ ∘ φ^{-1}, ξ̃ = φ(ξ), μ = [ε] − 1: (i) finite free Breuil–Kisin–Fargues modules (M, φ_M: φ^*M[1/ξ̃] ≅ M[1/ξ̃]); (ii) BMS1 Lemma 4.26: T = (M ⊗ W(C^♭))^{φ=1} is finite free over Z_p of rank rk M and M ⊗ W(C^♭) ≅ T ⊗ W(C^♭) restricts to M[1/μ] ≅ T ⊗ A_inf[1/μ]; (iii) Fargues' theorem (BMS1 Theorem 4.28) with the functor M ↦ (T, φ^*M ⊗ B_dR^+) in this normalisation, and in particular its full faithfulness with the elementary proof of BMS1 Remark 4.29; (iv) BMS1 Lemma 4.6 (Kedlaya): vector bundles on Spec(A_inf) ∖ {closed point} extend uniquely to Spec(A_inf), and sections of vector bundles do not change; (v) Scholze–Weinstein, Berkeley lectures, Theorem 14.2.1 and Lecture 13: F-crystals on Spa(A_inf) ∖ {x_k} are the same as on Spec(A_inf), and an F-crystal on Spa(A_inf) ∖ {p = 0} whose base change to the Robba ring is a trivial φ-module extends over p = 0 through the integral Robba ring; (vi) BMS1 Lemma 3.23: the kernel of A_inf → W(O_C) is generated by μ. Needed by: `PR.7/bkf-modules-comparison`, `PR.7/weakly-admissible-extension-over-ainf`, `PR.7/etale-realization-over-breuil-kisin-prism`.

**AInfCohomology:AI.3**

- The pro-étale sheaves A_inf,X, Ô_X^{♭+}, Ô_X^♭ on the generic fibre of a smooth formal scheme over O_C, integral closedness of Ô_X^{♭+} in Ô_X^♭, the projection ν : X_proét → 𝔛_ét, and AΩ_𝔛 = Lη_μ Rν_*A_inf,X. Needed by: `PR.4/syntomic-truncation-ainf`, `PR.4/ainf-artin-schreier-condition`, `PR.4/nearby-cycles-comparison`.
- For a perfectoid field C of characteristic 0 containing μ_{p^∞} and a smooth formal O_C-scheme: the complex AΩ = Lη_μ Rν_* A_inf,X as a commutative algebra with its Frobenius (BMS1 Definition 9.1, Proposition 9.17); for a small framed R the toric perfectoid cover R_∞ with its Z_p(1)^d-action and the quasi-isomorphism η_{q−1} Kos(A_inf(R_∞); γ_i − 1) ≃ AΩ_R (Theorem 9.4 (iii)); for the torus the injective quasi-isomorphism from the q-de Rham complex (Lemma 9.6). Needed by: `PR.6/ainf-omega-comparison-map`, `PR.6/ainf-omega-comparison`.

**AInfCohomology:AI.4**

- The local description of AΩ on a framed affine: AΩ_A ≃ q-Ω^•_{Ã/A_inf} with basis d_q log T_a and φ(d_q log T_a) = ξ̃ d_q log T_a, and the equivalence of the étale sites of 𝔛, Spf Ã/p and Spec A/p. Needed by: `PR.4/syntomic-truncation-ainf`, `PR.4/nearby-cycles-comparison`.
- (1) The Hodge–Tate specialisation AΩ_R ⊗^L_{A_inf,θ̃} O_C ≃ Ω̃_R (BMS1 Theorem 9.2 (i)) and H^i(Ω̃_R) ≅ Ω^{i,cont}_{R/O_C}{−i} (Theorem 8.3), in the form of an isomorphism of commutative differential graded algebras with the Bockstein differential, induced by a ring map from R to H^0. (2) The all-coordinates construction: for a very small R and a finite set Σ of units containing a framing, the perfectoid ring R_{Σ,∞} (p-completed integral closure of R in the pro-étale Z_p(1)^Σ-torsor extracting p-power roots of the units), and the statement that η_{q−1} Kos_c(A_inf(R_{Σ,∞}); σ_s − 1) computes AΩ_R functorially in Σ and R (BMS1 §12.2; the enlargement criterion BS22 quotes from Bhatt, Specializing varieties and their cohomology, Lemma 5.14). (3) The de Rham specialisation of AΩ along θ, for the comparison in theta-theta-tilde-square. Needed by: `PR.6/ainf-omega-comparison-map`, `PR.6/ainf-omega-comparison`, `PR.6/theta-theta-tilde-square`.

**ClassicalAdicEtaleCohomology:H0**

- The étale site of the adic generic fibre X_η of a p-adic formal scheme, the nearby-cycles map μ (ψ) : X_{η,ét} → X_ét and Rμ_*; pro-étale site of the generic fibre. Needed by: `PR.4/perfectoid-artin-schreier-witt`, `PR.4/etale-comparison`, `PR.4/etale-comparison-smooth`, `PR.4/ainf-artin-schreier-condition`, `PR.4/nearby-cycles-comparison`.

**ClassicalAdicEtaleCohomology:H1:henselian**

- Huber's comparison RΓ_ét(Spec(S[1/p]), F) ≃ RΓ_ét(Spa(S[1/p], S), F) for torsion F (Huber, Étale cohomology of rigid analytic varieties and adic spaces, Corollary 3.2.2), and the Fujiwara–Gabber theorem: for a p-henselian ring with p-completion Ŝ, étale cohomology of Spec S[1/p] and Spec Ŝ[1/p] with torsion coefficients agree, so R ↦ RΓ_ét(Spec R[1/p], Z/p) carries p-completed filtered colimits to filtered colimits. Needed by: `PR.4/perfectoid-artin-schreier-witt`, `PR.4/etale-comparison`, `PR.4/tate-twist-perfectoid`, `PR.4/nearby-cycles-comparison`.

**CrystallineCohomology:CR.0**

- The PD envelope D_J(B) of an ideal J in a ring B over Z_(p), with its universal property, its p-torsion-freeness and explicit description for a polynomial variable (the free module structure of D_(x)(F_p[x]) over F_p[x]/(x^p)), flat base change, and the p-completed PD envelope; used to identify δ-envelopes A{φ(f)/p} with PD envelopes (BS22 Lemmas 2.36, 2.38, Corollary 2.39) and in Lemma 2.43. Needed by: `PR.0/free-delta-pd-envelope`, `PR.0/pd-envelope-as-delta-envelope`, `PR.0/pd-envelope-complete-flatness`, `PR.0/regular-prismatic-envelopes`.
- p-completed PD envelopes D_J(B) with their universal property; for a p-torsion-free ring and a sequence regular modulo p the envelope is p-torsion-free and commutes with flat base change (Bhatt–Scholze Lemma 2.38); the PD envelope of (d) in A/p is free over A/(p,d^p) on the divided powers γ_{kp}(d). Needed by: `PR.1/crystalline-comparison`, `PR.1/crystalline-comparison-syntomic`, `PR.1/crystallization-of-oriented-prism`.
- For a semiperfect F_p-algebra S: the ring A_crys(S), the p-adic completion of the PD envelope of W(S^♭) → S compatible with the PD structure of (p), with its universal property as the universal p-complete PD thickening of S, its Frobenius induced by functoriality, and the fact that the Frobenius of A_crys(S)/p factors through A_crys(S)/p → S. Needed by: `PR.2/qrsp-char-p-acrys`.
- The p-completed divided power envelope of the ideal (Y) in Z_p[Y^{1/p^∞}] (and in A/(q−1)⟨Y^{1/p^∞}⟩) is the p-completion of the free module on Y^i/⌊i⌋!, i ∈ N[1/p]: the standard basis of the divided power envelope of a regular element in a flat algebra. Needed by: `PR.3/nygaard-key-case`, `PR.3/nygaard-incomplete-example`.
- A_crys(S), the p-completed divided power envelope of W(S^♭) → S for a semiperfect F_p-algebra, with its Frobenius, the divided power filtration and the conjugate filtration on A_crys(S)/p (BMS2 Proposition 8.11); the logarithm log[x] on the divided power ideal. Needed by: `PR.4/syntomic-low-weights`, `PR.4/acrys-divided-frobenius-surjective`, `PR.4/syntomic-complex-char-p`.
- Divided power envelopes over Z and Z_(p), in particular of (t − 1) ⊂ Z[t^{±1}] and of (x) ⊂ Z[x]; the ring A_crys(R) of a semiperfect F_p-algebra with its universal property as the initial p-complete divided power thickening of R. Needed by: `PR.5/divided-power-multiplicative-group`, `PR.5/absolute-crystalline-comparison`, `PR.5/absolute-nygaard-perfect-prism`.
- p-completed PD envelopes of an ideal in a p-completely flat algebra over a p-complete PD base (D̄, Ī), their flatness and base change; the statement of BS22 Lemma 16.11: for B a p-torsion-free Z_p-algebra and I generated by a sequence regular modulo p, the ideal of the PD envelope is the smallest ideal containing I and stable under f ↦ f^p/p (Stacks project, Tag 07GS); p-adic continuity of divided powers on p-torsion-free rings and the composition rule γ_{kp}(x) = u·γ_k(γ_p(x)). Needed by: `PR.6/delta-pd-pairs`, `PR.6/q-pd-envelope`, `PR.6/q-pd-envelope-base-change`, `PR.6/q-crystalline-crystalline-comparison`.

**CrystallineCohomology:CR.1**

- The big crystalline site (R/A)_CRYS of an A/I-algebra R over a p-adic PD base (A,I,γ) with p ∈ I (objects are PD thickenings on which p is nilpotent), its structure sheaf, and the identification of its cohomology with that of the small site (Berthelot, Cohomologie cristalline, III.4.1.4). Needed by: `PR.1/crystalline-comparison`.
- The crystalline site Z_crys of a quasi-syntomic F_p-scheme and of a p-adic formal scheme, crystals of vector bundles and F-crystals on it; the identification of crystals on X_crys and on X_{p=0,crys}; for X formally smooth over Y, Vect((X/Y)_crys) ≃ vector bundles with topologically quasi-nilpotent flat connection; for R quasiregular semiperfect, crystals on Spec(R)_crys are modules over A_crys(R). Needed by: `PR.7/crystalline-realization`.

**CrystallineCohomology:CR.2**

- Čech–Alexander computation of crystalline cohomology over a p-torsion-free p-complete PD base: for a surjection B → R from a p-completely ind-smooth (in particular completed polynomial or free δ-) A-algebra, the pro-object of reductions of the p-completed PD envelope is weakly initial in the big crystalline site and compatible with coproducts, so RΓ_crys(R/A) ≃ lim D^• for the PD envelope D^• of the Čech nerve, independently of the presentation, for every R (smooth or not). For a p-completely smooth lift R̃ of R̄ over a PD thickening S → S/J′ ⊂ S/J: RΓ_crys(R̄/S) ⊗̂^L_S S/J′ ≃ Ω^*_{R̃/(S/J′)} as commutative algebra objects; in particular RΓ_crys(F_p[X_1,…,X_n]/Z_p) is the de Rham complex of Z_p⟨X_1,…,X_n⟩. Invariance under enlarging the PD ideal of the base: for a smooth A/p-algebra R̃ and a PD ideal I ∋ p, RΓ_crys(R̃/(A,(p))) ≃ RΓ_crys(R̃ ⊗ A/I/(A,I)). Needed by: `PR.1/crystalline-comparison`, `PR.1/crystalline-comparison-syntomic`, `PR.1/hodge-tate-comparison-char-p`, `PR.1/de-rham-comparison`, `PR.1/acceptance-computations`.
- For k a perfect field of characteristic p and Ã a p-completely smooth W(k)-algebra with a Frobenius lift lifting a smooth k-algebra R: RΓ_crys(R/W(k)) is computed by the p-completed de Rham complex of Ã, compatibly with the Frobenius induced by the lift. Needed by: `PR.3/nygaard-filtration-in-coordinates`.
- The crystalline cochain complex RΓ_crys(X/Z_p) of an F_p-scheme as a commutative algebra object of the p-complete derived category of Z_p, functorial in X, with the augmentation ε_crys : RΓ_crys(X/Z_p) → RΓ(X, O_X) and its Frobenius. Needed by: `PR.5/absolute-crystalline-comparison`.
- Crystalline cohomology RΓ_crys(R/D̄) of a p-completely smooth algebra over a p-adic PD thickening D̄ → D̄/Ī; its computation by the cosimplicial p-completed PD envelope of the Čech nerve of a presentation (weak initiality of the PD envelope of a free or smooth lift); the PD Poincaré lemma in cosimplicial form (Stacks project, Tags 07JP and 07LG); independence of the embedding; Zariski descent; RΓ_crys of a smooth lift is its de Rham complex. Needed by: `PR.6/q-crystalline-cech-alexander`, `PR.6/q-crystalline-crystalline-comparison`, `PR.6/q-de-rham-comparison`, `PR.6/change-of-framing`, `PR.6/q-de-rham-prismatic-comparison-zp`.

**CrystallineCohomology:CR.3**

- The Frobenius of crystalline cohomology of a characteristic-p scheme over a base with a Frobenius lift, and its functoriality: for a map of simplicial PD thickenings lying over a map of schemes and of bases, the induced maps on crystalline cohomology and on limits of sections commute (Bhatt–Scholze Theorem 5.2, proof, Frobenius compatibility). Needed by: `PR.1/crystalline-comparison`.

**CrystallineCohomology:CR.4**

- The de Rham–Witt complex WΩ^•_X of a smooth scheme over a perfect field with F, V, d and the relations FV = VF = p, φ = p^n F in degree n, dF = pFd, d^{−1}(pWΩ^{n+1}) = FWΩ^n; p-adic and V-adic completeness of WΩ^n; the Nygaard filtration N^{≥i}WΩ^•; the sheaves W_rΩ^i_log and the exactness of 0 → W_•Ω^i_log → W_•Ω^i → W_•Ω^i → 0 with F − 1 as pro-sheaves (Illusie I.5.7.2); the comparison of crystalline cohomology with WΩ^•. Needed by: `PR.4/syntomic-connectivity`, `PR.4/log-forms-divided-frobenius`, `PR.4/log-de-rham-witt-comparison`.
- The de Rham–Witt complex WΩ_R of a regular Noetherian F_p-algebra, the isomorphism RΓ_crys(R/Z_p) ≅ WΩ_R, and its Nygaard filtration N^n WΩ_R = {x : φ(x) ∈ p^n WΩ_R}. Needed by: `PR.5/absolute-nygaard-perfect-prism`.

**DerivedDeRhamCohomology:DD.0**

- For A = W(k) with k a perfect F_p-algebra the p-completed cotangent complex of A over Z_p vanishes; consequently for every derived p-complete ring B and ideal J ⊂ B with B/J derived p-complete, Hom(A,B) → Hom(A,B/J) → Hom(A,B/(J,p)) are bijections (Bhatt–Scholze Lemma 4.8, proof). Needed by: `PR.1/perfect-prism-initial`.
- The cotangent complex L_{B/A} of a map of animated rings with its transitivity triangle and base change; derived exterior and divided powers with the décalage ∧^i(M[1]) ≃ Γ^i(M)[i] and the filtration of ∧^i of a cofibre; that B ↦ (∧^i L_{B/(A/I)})^∧ is the left Kan extension of the completed differential forms of p-completed polynomial algebras; L of a quotient by a Koszul-regular sequence, L ≃ J/J²[1] with free conormal module; the classification of square-zero extensions by maps out of L and the identification of the class of L_{X/S} in Ext²(L_{X/(S/I)}, I/I² ⊗ O_X) with the obstruction to a flat lifting over S/I² (Illusie, Complexe cotangent III.2.1.2.3); the vanishing of the map induced by Frobenius on L_{S/F_p}; quasisyntomic maps and covers (BMS2 Definition 4.10 (3)) with their stability under composition and completed base change (BMS2 Lemma 4.16). Needed by: `PR.2/derived-prismatic-cohomology`, `PR.2/derived-hodge-tate-comparison`, `PR.2/first-conjugate-piece-cotangent`, `PR.2/conjugate-splitting-and-lifting`, `PR.2/derived-prismatic-etale-descent`, `PR.2/derived-prismatic-base-change`, `PR.2/regular-quotient-prismatic-envelope`, `PR.2/derived-input-higher-homotopy`, `PR.2/qrsp-prism`, `PR.2/singular-qrsp-example`, `PR.2/quasisyntomic-covers-lift-to-prisms`, `PR.2/quasisyntomic-descent`, `PR.2/perfection-comparison`.
- The cotangent complex L_{S/R} and its derived exterior powers; p-complete Tor amplitude; the fact that a surjection of rings that is surjective on π_0 of generators induces a surjection on H^{-1} of cotangent complexes of quotients by regular sequences (used to choose S′ → S surjective on cotangent complexes); p-complete flatness of L_{S/Ā}[−1] and of its exterior powers when Ω^1 vanishes p-adically. Needed by: `PR.3/nygaard-graded-pieces`, `PR.3/large-quasisyntomic-algebra`.
- The cotangent complex L_{S/R} and its p-completion; surjectivity on H^{−1} for a surjection of quasiregular semiperfectoid algebras (Bhatt–Scholze Lemma 14.5); wedge powers ∧^j L and their connectivity. Needed by: `PR.4/tate-twist-discreteness`, `PR.4/syntomic-connectivity`.
- The cotangent complex L_{R/Z} of an animated ring and its derived exterior powers LΩ^n_R with their p-completions; Tor-amplitude conditions on R/p ⊗^L L_{R/Ā}; p-completely formally étale maps. Needed by: `PR.5/relative-site-comparison`, `PR.5/absolute-hodge-tate-cohomology`, `PR.5/absolute-nygaard-graded-pieces`.

**DerivedDeRhamCohomology:DD.1**

- Derived I-completeness and derived I-completion of modules and animated rings for a finitely generated ideal; that I lies in the Jacobson radical of a derived I-complete ring; I-complete (faithful) flatness and its residue-field criterion; the bounded-torsion criterion (BMS2 Lemma 4.7: a p-completely flat complex over a ring with bounded p^∞-torsion is discrete with bounded torsion); completed faithfully flat descent; Elkik algebraization of I-completely étale algebras and van der Kallen's theorem on W_2 of étale maps (BS22 Lemma 2.18); agreement of derived and classical completion under bounded torsion. Needed by: `PR.0/prism`, `PR.0/prism-category`, `PR.0/delta-etale-extension`, `PR.0/animated-delta-rings`, `PR.0/complete-regular-sequence`, `PR.0/pd-envelope-complete-flatness`, `PR.0/rigidity-prism-ideal`, `PR.0/bounded-prism-complete-flatness`, `PR.0/prism-perfection`, `PR.0/crystalline-prism`, `PR.0/perfectoid-tor-independence`, `PR.0/regular-prismatic-envelopes`.
- Derived (p,I)-completion and the completed derived tensor product; I-complete flatness and faithful flatness in the sense of Bhatt–Scholze §1.2 with stability under completed base change and composition; derived Nakayama (Stacks 0G1U); completed faithfully flat descent: for an I-completely faithfully flat map of animated rings the Koszul reductions of the completed Čech nerve form limit diagrams, and D_{I-comp}(−) is a sheaf; Bhatt–Scholze Lemma 4.22 (completed base change of finite complete Tor amplitude commutes with totalisations in D^{≥0}); Elkik algebraization of I-completely étale and smooth algebras; the adjunction between derived extension and restriction of scalars along a ring map, with its completed form; the multiplicative I-adic filtration of a commutative algebra object and the derivation property of its Bockstein maps; a derived I-complete complex over an I-adically complete ring whose reduction modulo I is perfect is perfect. Needed by: `PR.1/prismatic-structure-sheaf`, `PR.1/prismatic-to-etale-morphism`, `PR.1/relative-prismatic-cohomology`, `PR.1/change-of-topology`, `PR.1/cech-alexander-complex`, `PR.1/frobenius-on-prismatic-cohomology`, `PR.1/base-change-finite-tor-amplitude`, `PR.1/etale-localization`, `PR.1/bockstein-differential`, `PR.1/crystalline-comparison`, `PR.1/hodge-tate-comparison-char-p`, `PR.1/crystallization-of-oriented-prism`, `PR.1/hodge-tate-affine-line`, `PR.1/prismatic-base-change`, `PR.1/de-rham-comparison`, `PR.1/proper-smooth-perfectness`, `PR.1/p-torsion-free-h0-syntomic`, `PR.1/perfect-prism-initial`.
- Derived (p, I)-completion of complexes and of animated rings, completed tensor products and completed colimits, with: derived Nakayama (a map of derived I-complete objects that is an isomorphism modulo I is an isomorphism; a derived complete complex is zero, or lies in D^{≥0}, if its reduction does); compatibility of completion with left Kan extension and with filtered objects, graded pieces and multiplicative filtrations; p-complete Tor-amplitude and p-complete (faithful) flatness with BMS2 Lemmas 4.4–4.7 and Corollary 4.8 (over a ring with bounded p^∞-torsion a derived p-complete complex of p-complete Tor-amplitude in [a, b] lies in D^{[a,b]}; p-completely flat complexes are classically complete modules with bounded p^∞-torsion; the reductions modulo p^n of a p-completely faithfully flat map of such rings are faithfully flat); descent M ≃ lim M ⊗̂^L_R R′^• for derived p-complete M along a p-completely faithfully flat or p-completely étale cover; and the equivalence between finite projective modules over an I-adically complete ring and compatible systems of finite projective modules over the quotients by I^n (Stacks Project, Tag 0D4B). Needed by: `PR.2/derived-prismatic-cohomology`, `PR.2/conjugate-filtration`, `PR.2/derived-hodge-tate-comparison`, `PR.2/first-conjugate-piece-cotangent`, `PR.2/conjugate-splitting-and-lifting`, `PR.2/derived-prismatic-etale-descent`, `PR.2/derived-prismatic-base-change`, `PR.2/kunneth-formula`, `PR.2/kunneth-formula-formal-schemes`, `PR.2/derived-agrees-with-site`, `PR.2/regular-quotient-prismatic-envelope`, `PR.2/quasisyntomic-covers-lift-to-prisms`, `PR.2/quasisyntomic-descent`, `PR.2/perfection-of-prismatic-cohomology`, `PR.2/perfectoidization-coconnective`, `PR.2/perfection-descendable`, `PR.2/perfectoidization-symmetric-monoidal`, `PR.2/connective-perfectoidization-perfectoid`, `PR.2/finite-projective-modules-p-complete`, `PR.2/finite-projective-descent-prisms`.
- Derived (p, I)-completion and the completed derived tensor product ⊗̂^L over a bounded prism, with (p, I)-completely faithfully flat descent for complete complexes; the filtered derived category DF(A) = Fun((Z, ≥), D(A)) with gr^i, completion of filtered objects (F̂(i) = F(i)/F(∞)), conservativity of the graded pieces on complete objects, the Day convolution product (BMS2 Definition 5.1, Lemma 5.2); the Beilinson t-structure on DF(A): DF^{≤0} = {gr^i in D^{≤i}}, its connective cover τ^{≤0}_B with gr^i τ^{≤0}_B = τ^{≤i} gr^i, compatibility with the tensor product, the identification of the heart with cochain complexes by F ↦ (H^n(gr^n F), boundary), and the criterion that a map from a complete filtered object inducing isomorphisms H^m(gr^n) for m ≤ n and with H^m(gr^n) = 0 for m > n is a connective cover of a complete target (BMS2 Theorem 5.4; BL22 appendix on filtered complexes). Needed by: `PR.3/nygaard-regular-semiperfectoid`, `PR.3/nygaard-filtration`, `PR.3/relative-nygaard-filtration`, `PR.3/relative-nygaard-graded-pieces`, `PR.3/leta-frobenius-factorisation`, `PR.3/nygaard-hodge-comparison`, `PR.3/nygaard-completion`, `PR.3/nygaard-filtration-in-coordinates`.
- Derived p-completion and derived t-completion of complexes, completed colimits in D_comp, the identification R lim_n (M ⊗^L Z/p^n) = M^∧_p, and unique t-divisibility of the fibre of M → M^∧. Needed by: `PR.4/frobenius-fixed-points`, `PR.4/fixed-points-completed-colimits`, `PR.4/etale-comparison-coefficients`, `PR.4/syntomic-cohomology-formal-schemes`.
- Derived (p, I)-completion: the full subcategory D̂(A) ⊂ D(A) of derived complete objects for a finitely generated ideal, completed tensor products and completed base change, (p, I)-completely (faithfully) flat maps and descent for D̂ along them, the identification of D̂(A) with quasi-coherent complexes on Spf A for bounded A; the filtered derived ∞-category of p-complete complexes, filtration-completeness, and the Beilinson t-structure on it with its connective covers. Needed by: `PR.5/absolute-prismatic-site`, `PR.5/transversal-prism-coproducts`, `PR.5/wcart-fibre-products-of-prisms`, `PR.5/quasi-coherent-complexes-on-wcart`, `PR.5/prismatic-crystals-on-wcart`, `PR.5/sen-operator`, `PR.5/sen-operator-classification`, `PR.5/frobenius-pullback-square`, `PR.5/relative-site-comparison`, `PR.5/absolute-prismatic-cohomology`, `PR.5/absolute-site-comparison`, `PR.5/absolute-hodge-tate-cohomology`, `PR.5/absolute-nygaard-filtration`, `PR.5/absolute-nygaard-graded-pieces`, `PR.5/absolute-frobenius`.
- Derived (p,[p]_q)-completion and derived Nakayama; complete flatness and completely regular sequences relative to a base (BS22 Definition 2.42); completed derived base change; finite complete Tor-amplitude and the commutation of completed base change with totalisations in D^{≥0} (BS22 Lemma 4.22); a derived complete, completely flat module over a noetherian ring is flat (the implication BS22 Notation 17.1 quotes from Bhatt, Cohen–Macaulayness of absolute integral closures, Lemma 5.15); lifting of p-completely smooth algebras along surjections whose kernel is nil modulo p (Elkik). Needed by: `PR.6/q-pd-pair`, `PR.6/delta-pd-pairs`, `PR.6/q-pd-homological-properties`, `PR.6/smallest-largest-q-pd-ideals`, `PR.6/ainf-q-pd-pair`, `PR.6/q-pd-envelope`, `PR.6/q-pd-envelope-base-change`, `PR.6/q-crystalline-site`, `PR.6/q-crystalline-cech-alexander`, `PR.6/q-crystalline-prismatic-comparison`, `PR.6/framed-q-pd-datum`, `PR.6/q-de-rham-comparison`, `PR.6/change-of-framing`, `PR.6/hodge-tate-comparison-criterion`.
- Derived and classical completion for finitely generated ideals; derived Nakayama; (p, I)-complete (faithful) flatness; and the criterion: over a ring R derived J-complete for a finitely generated ideal J, a perfect complex E is a vector bundle if and only if E ⊗^L_R R/J is one. Needed by: `PR.7/crystal-descent`, `PR.7/artin-schreier-riemann-hilbert`, `PR.7/laurent-f-crystals-local-systems`, `PR.7/f-crystals-over-qrsp`, `PR.7/period-sheaves-qrsp`, `PR.7/descent-data-boundedness`.

**DerivedDeRhamCohomology:DD.2**

- The p-completed de Rham complex Ω^*_{R/k} of a p-completely smooth k-algebra R (k = A/I p-complete with bounded p^∞-torsion) and its sheaf version on a smooth p-adic formal scheme: Ω^i finite projective, compatible with p-completed base change in k and with p-completely étale maps R → S; the universal property: for a graded-commutative differential graded k-algebra (E,d) with derived p-complete terms and a k-algebra map η : R → E^0 such that d(η(f))² = 0 for all f ∈ R, there is a unique map of differential graded algebras Ω^*_{R/k} → E extending η. Needed by: `PR.1/bockstein-differential`, `PR.1/hodge-tate-comparison-map`, `PR.1/hodge-tate-comparison-char-p`, `PR.1/hodge-tate-comparison`, `PR.1/prismatic-base-change`, `PR.1/de-rham-comparison`.
- The p-completed derived de Rham cohomology dR^∧_{S/A} of an animated algebra S over a p-complete ring A as a commutative algebra in D(A), defined by left Kan extension from polynomial algebras, with its Frobenius when A = W(k) and S is a k-algebra. Needed by: `PR.2/derived-crystalline-comparison`.
- The p-completed de Rham complex Ω̂^•_{R/Ā} of a p-completely smooth algebra over a ring Ā with bounded p^∞-torsion, on the étale site of a smooth formal scheme; the p-completed derived de Rham complex dR^∧_{R/Ā} of an animated Ā-algebra with its Hodge filtration as a commutative algebra object of DF(Ā), commuting with sifted colimits, with gr^n_Hodge = (∧^n L_{R/Ā})[−n]^∧; and the identification Fil^•_Hodge dR^∧_{R/Ā} ≅ (Ω̂^{≥ •}_{R/Ā}, d) when R is p-completely flat over Ā with R/p a filtered colimit of smooth (Ā/p)-algebras (BL22 appendix, 'derived to classical de Rham'). Needed by: `PR.3/de-rham-comparison-general`, `PR.3/nygaard-hodge-comparison`, `PR.3/nygaard-completeness`.
- The p-complete derived de Rham complex dR̂_R of an animated ring over Z with its Hodge filtration, gr^m_Hodge = LΩ̂^m_R[−m], its commutative algebra structure and commutation with sifted colimits; the comparison with the completed de Rham complex (Ω̂^*_R, d) and its stupid filtration when R is p-torsion-free with R/pR regular Noetherian; discreteness of dR̂_R for quasiregular semiperfectoid R. Needed by: `PR.5/absolute-de-rham-comparison`, `PR.5/absolute-nygaard-filtration`, `PR.5/absolute-nygaard-graded-pieces`, `PR.5/absolute-frobenius`.

**DerivedDeRhamCohomology:DD.4**

- (1) For a p-complete smooth lift P̃ over A = W(k) of a polynomial k-algebra P, natural isomorphisms dR^∧_{P/A} ≃ (Ω^*_{P̃/A})^∧ ≃ RΓ_crys(P/A) compatible with Frobenius (Bhatt, p-adic derived de Rham cohomology, Theorem 3.27, in the case of the complete intersection P = P̃/p), so that dR^∧_{−/A} on k-algebras is the p-completed left Kan extension of crystalline cohomology of polynomial k-algebras. (2) For a quasiregular semiperfect F_p-algebra S: dR^∧_{S/Z_p} is concentrated in degree 0, is p-torsion-free, and is naturally isomorphic, compatibly with Frobenius, to A_crys(S) (BMS2 Proposition 8.12 and Theorem 8.14 (1), (3), where it is deduced through the derived de Rham–Witt complex). Needed by: `PR.2/qrsp-char-p-acrys`, `PR.2/derived-crystalline-comparison`.
- BMS2 Theorem 8.14 for a quasiregular semiperfect F_p-algebra S: A_crys(S) is p-torsion-free; φ_i mod p : N^iA_crys(S) → A_crys(S)/p is injective with image Fil_i^conj; A_crys(S) ≅ LWΩ_S compatibly with φ and Nygaard filtrations; the image of N^{≥i} modulo p is the Hodge (divided power) filtration; φ(x) ≡ x^p mod p. Also LWΩ_B ≃ WΩ^•_B for smooth B. Needed by: `PR.4/syntomic-low-weights`, `PR.4/acrys-divided-frobenius-surjective`, `PR.4/syntomic-complex-char-p`, `PR.4/log-de-rham-witt-comparison`.
- For a semiperfect F_p-algebra R: RΓ_crys(R/Z_p) ≅ A_crys(R) when R is quasiregular semiperfect; the conjugate filtration on A_crys(R)/p with the surjection Γ^*_R(I/I²) → gr^conj, I = ker(R^♭ → R); descent of crystalline cohomology of a quasisyntomic F_p-algebra along the Čech nerve of a semiperfect cover obtained from a perfected polynomial presentation (Bhatt–Lurie Appendix F). Needed by: `PR.5/absolute-crystalline-comparison`, `PR.5/absolute-nygaard-perfect-prism`.
- For a p-torsion-free quasiregular semiperfectoid ring R: the p-completed derived de Rham cohomology LΩ_R over Z_p with its Hodge filtration, and the identification LΩ_R ≅ A_crys(R/p) (Bhatt, p-adic derived de Rham cohomology). Needed by: `PR.7/tate-twist-analytic-continuation`.

**DerivedDeRhamCohomology:DD.5**

- For a proper smooth p-adic formal scheme X over Spf(S), S a p-complete ring with bounded p^∞-torsion, and a vector bundle E on X: RΓ(X,E) is a perfect complex of S-modules whose formation commutes with base change in S (coherent cohomology of proper flat finitely presented morphisms without noetherian hypotheses, passed to the p-adic limit). Needed by: `PR.1/proper-smooth-perfectness`.
- The quasisyntomic site: quasisyntomic rings and the categories QSyn, QSyn_A (BMS2 Definition 4.10, Lemmas 4.15–4.17, Variant 4.33). The definition of quasiregular semiperfectoid rings (BMS2 Definition 4.20; equivalently BS22 Notation 7.1) with Remarks 4.21–4.22 and Lemma 4.25 (for every perfectoid R → S the complex L_{S/R}[−1] is p-completely flat over S), including the test case O_C/p. Existence of quasisyntomic covers by quasiregular semiperfectoid rings whose Čech nerves consist of such rings (Lemmas 4.28, 4.30) and the unfolding equivalence of sheaves (Proposition 4.31). Lemma 4.34: for A perfectoid and B in QSyn_A, L_{B/A} has p-complete Tor-amplitude in [−1, 0]. Flat descent for B ↦ (∧^i L_{B/R})^∧ along p-completely faithfully flat maps of p-complete rings with bounded p^∞-torsion (BMS2 Theorem 3.1, Remark 4.9). Quasisyntomic descent for p-completed derived de Rham cohomology of F_p-algebras (BMS2 Example 5.12). The projection formula and flat base change for quasi-coherent cohomology of quasi-compact quasi-separated p-adic formal schemes that are p-completely flat over the base. Needed by: `PR.2/derived-prismatic-etale-descent`, `PR.2/kunneth-formula-formal-schemes`, `PR.2/qrsp-prism`, `PR.2/qrsp-char-p-acrys`, `PR.2/regular-semiperfectoid-example`, `PR.2/singular-qrsp-example`, `PR.2/quasisyntomic-covers-lift-to-prisms`, `PR.2/quasisyntomic-descent`, `PR.2/perfection-comparison`.
- The quasisyntomic site of a p-complete ring with bounded p^∞-torsion (here A/I for a bounded prism, and perfectoid rings): quasisyntomic algebras and covers (BMS2 Definition 4.10), existence of quasisyntomic covers obtained by adjoining compatible p-power roots of generators (BMS2 Lemma 4.28), sheaves on a basis and unfolding (BMS2 Proposition 4.31), and flat descent for the p-completed exterior powers of the cotangent complex (BMS2 Theorem 3.1). Needed by: `PR.3/nygaard-filtration`, `PR.3/large-quasisyntomic-algebra`, `PR.3/relative-nygaard-filtration`.
- The quasisyntomic site, quasisyntomic covers by quasiregular semiperfectoid rings, unfolding of sheaves from that basis, and the fact that Artin–Schreier towers and adjoining p-power roots are quasisyntomic covers. Needed by: `PR.4/syntomic-complex`, `PR.4/syntomic-low-weights`, `PR.4/syntomic-filtered-colimits`, `PR.4/tate-twist-discreteness`, `PR.4/acrys-divided-frobenius-surjective`, `PR.4/log-de-rham-witt-comparison`.
- p-quasisyntomic rings and formal schemes, the p-quasisyntomic topology, quasiregular semiperfectoid rings as a basis; p-completely faithfully flat descent for the completed derived exterior powers of the cotangent complex and p-quasisyntomic descent for the p-complete derived de Rham complex with its Hodge filtration. Needed by: `PR.5/relative-site-comparison`, `PR.5/absolute-prismatic-descent`, `PR.5/absolute-site-comparison`, `PR.5/absolute-crystalline-comparison`, `PR.5/absolute-de-rham-comparison`, `PR.5/absolute-nygaard-graded-pieces`, `PR.5/absolute-nygaard-perfect-prism`.
- Every p-completely smooth algebra over a perfectoid ring R has a quasisyntomic Čech cover by R-algebras that are quotients of p-completely flat perfectoid R-algebras by p-completely regular sequences (the category rsPerfd_R of BS22 §18), and these are quasiregular semiperfectoid. Needed by: `PR.6/ainf-omega-comparison`, `PR.6/comparison-uniqueness`.
- The quasi-syntomic site X_qsyn of a quasi-syntomic p-adic formal scheme, its basis X_qrsp of quasiregular semiperfectoid objects with Shv(X_qsyn) = Shv(X_qrsp) (BMS2 Proposition 4.31, Variant 4.35), finite non-empty coproducts in X_qrsp given by p-completed tensor products, and the fact that O_K → O_C is a quasi-syntomic cover. Needed by: `PR.7/quasisyntomic-crystal-comparison`.

**DiamondEtaleCohomology:C2**

- Red-team finding RT-AREA-padic-2/30 (a). For a bounded p-adic formal scheme X with generic fibre X_η (a locally spatial diamond, ECD §15): the ∞-category D^{(b)}_lisse(X_η, Z_p) of locally bounded derived p-complete objects of D(X_{η,proét}, Z_p) whose reduction modulo p has locally constant cohomology sheaves with finitely generated stalks, and its heart-level version Loc_{Z_p}(X_η); v-descent: Y ↦ D^{(b)}_lisse(Y, Z_p) is a sheaf of ∞-categories for the v-topology on perfectoid spaces over X_η, so that D^{(b)}_lisse(X_η, Z_p) = lim over affinoid perfectoid Spa(S, S^+) → X_η; a quasi-syntomic cover of X induces a v-cover of X_η. For X_η = Spa(K, O_K): Loc_{Z_p} is the category of continuous G_K-representations on finite free Z_p-modules. Needed by: `PR.7/laurent-f-crystals-local-systems`, `PR.7/etale-realization`.

**EnhancedDerivedSheaves:E1**

- Tor-independence of perfect F_p-algebras: for maps B ← A → C of perfect F_p-algebras, B ⊗^L_A C is concentrated in degree 0 and perfect (Bhatt–Scholze, Projectivity of the Witt vector affine Grassmannian, Lemma 3.16; routed to E1 by the extraction of that paper, item PAPER-BHATT-SCHOLZE-17/S320). Needed by: `PR.0/perfectoid-tor-independence`.

**EnhancedDerivedSheaves:E2**

- Čech descent in a topos: for a sheaf of abelian groups (or a bounded-below complex) F and an object X_0 covering the final object, RΓ(𝒳,F) ≃ R lim RΓ(X_0^•,F) over the Čech nerve (Stacks 07JM in the generality of a topos); Cartan criterion: a presheaf of modules on a site with fibre products whose Čech complexes are exact for all covers of all objects has no higher cohomology on any object; localisation of a topos at an object and sheaves on the category of elements of a sheaf; derived pushforward along a morphism of topoi with the Leray composition. Needed by: `PR.1/prismatic-structure-sheaf`, `PR.1/relative-prismatic-site`, `PR.1/relative-prismatic-cohomology`, `PR.1/change-of-topology`, `PR.1/cech-alexander-computes-cohomology`.
- Sheafification and hyperdescent for presheaves of complexes, the pro-étale topos and its repleteness (derived limits of surjective towers), pushforward along maps of sites and its commutation with R lim. Needed by: `PR.4/etale-comparison`, `PR.4/etale-comparison-coefficients`, `PR.4/etale-comparison-without-inverting-d`, `PR.4/log-forms-divided-frobenius`, `PR.4/log-de-rham-witt-comparison`, `PR.4/nearby-cycles-comparison`.
- Čech descent for a weakly final object: for a topos with a weakly final object X_0 with Čech nerve X_0^•, RΓ(X, F) ≃ Rlim RΓ(X_0^•, F) (the argument of Stacks project, Tag 07JM, as used in BS22 Construction 4.18). Needed by: `PR.6/q-crystalline-cech-alexander`.

**EnhancedDerivedSheaves:E3**

- Left Kan extension of functors from finitely generated polynomial algebras (p-completed) to derived p-complete simplicial (animated) algebras with values in a complete filtered derived category, commuting with cofibres and with sifted colimits; right Kan extension along a basis of a site as sheafification. Needed by: `PR.3/nygaard-filtration`, `PR.3/relative-nygaard-filtration`, `PR.3/de-rham-comparison-general`.
- Left Kan extension of functors on animated rings from polynomial or smooth algebras, and the criterion that a functor commuting with sifted colimits is left Kan extended from finitely generated polynomial algebras. Needed by: `PR.4/syntomic-cohomology-formal-schemes`, `PR.4/syntomic-connectivity`, `PR.4/syntomic-cohomology-schemes`.
- Left Kan extension of functors on p-completely smooth O_C-algebras, with values in derived (p,[p]_q)-complete E_1- and E_∞-A_inf-algebras, to derived p-complete simplicial O_C-algebras, and its naturality for natural transformations. Needed by: `PR.6/ainf-omega-comparison`.
- Limits of diagrams of ∞-categories indexed by a category (for D_perf(X_Δ, O_Δ) = lim D_perf(A)), their computation by a cosimplicial limit over the Čech nerve of a cover, and sheaves of ∞-categories on a site. Needed by: `PR.7/crystal-descent`.

**EnhancedDerivedSheaves:E5:abstract**

- Mathew's descendability for a map B → C of commutative algebras in a stable presentably symmetric monoidal ∞-category, here D_comp(A): definition and index; the criterion that B → C is descendable of index ≤ m when every map F^{⊗m} → B from the m-th tensor power of the fibre F is null; stability under base change, composition and tensor products; the consequence B ≃ lim C^{⊗_B(•+1)} and descent for modules; and Bhatt–Scholze, Projectivity of the Witt vector affine Grassmannian, Lemma 11.22: if B → C is descendable of index ≤ n and B, C carry compatible endomorphisms φ, then colim_φ B → colim_φ C is descendable of index ≤ 2n. Needed by: `PR.2/perfection-descendable`.

**EnhancedDerivedSheaves:E5:animation**

- The ∞-category of animated commutative Ā-algebras and its universal property: a functor on finitely generated polynomial algebras extends uniquely to a sifted-colimit-preserving functor on animated algebras. Needed by: `PR.3/relative-nygaard-filtration`.

**FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4**

- Red-team findings RT-AREA-padic-2/4 and RT-AREA-padic-2/30 (c): the edge R07.4 → PR.7, and the four targets on which the comparison node rests. They are now nodes of the R07.4 packet and are cited by id: (1) the Kummer-tower field of norms and Fontaine's equivalence between étale φ-modules over 𝒪_ℰ and Z_p-representations of G_{K_∞} (R07.4/kummer-etale-phi-modules, which itself requests PG.0 and PG.1); (2) modules of finite E-height over 𝔖 and over the open unit disc (R07.4/kisin-modules, R07.4/phi-n-nabla-modules); (3) the slope-zero characterisation of weak admissibility (R07.4/weakly-admissible-slope-zero); (4) the lattice functor T ↦ 𝔐(T) and full faithfulness of Rep_cris(G_K) → Rep(G_{K_∞}) (R07.4/finite-height-lattices, R07.4/semistable-finite-height, R07.4/crystalline-restriction-full-faithfulness, R07.4/kisin-etale-full-faithfulness). Still needed from the stage, and not stated by those nodes: (a) the lattice functor as a functor on all of Rep^crys_{Z_p}(G_K), for crystalline lattices of every Hodge–Tate weight (the nodes treat effective weights; the general case is by twisting) and with Z_p-coefficients (crystalline-restriction-full-faithfulness is stated for Q_p-representations); (b) the statement that Fontaine's functor T(M) = (𝒪̂_{ℰ^ur} ⊗ M)^{φ=1} equals (W(C^♭) ⊗ M)^{φ=1} with its G_{K_∞}-action, which the comparison with the perfectoid description of node etale-realization-over-breuil-kisin-prism uses. Needed by: `PR.7/kisin-functor-comparison`.

**LanglandsParameterStacks:LP1**

- Stacks in groupoids on affine schemes for the fpqc (and Zariski) topology, including stacks over Spf Z_p (functors on rings in which p is nilpotent); the quotient stack [X/G] of a sheaf X by a flat affine group scheme G and the classifying stack BG, with the criterion that a G-invariant map X → Y with X ×_Y X ≅ X × G that is locally essentially surjective identifies Y with [X/G]; for a stack Y the symmetric monoidal stable ∞-category D(Y) = lim over points of D(R) with Perf(Y), pullback, pushforward along affine morphisms with base change and projection formula, and descent D(Y) ≃ Tot D(X_•) along a flat cover with affine fibre powers; the description of D(BG) as comodules. LP1 states fpqc quotient stacks, quasi-coherent modules, perfect complexes and their pullback and descent for derived affine schemes with reductive group actions; it does not state: formal stacks and D(Spf A) ≃ derived (p, I)-complete complexes for a bounded prism, group schemes not of finite type (W^×, G_m^♯), pushforward along affine morphisms with the projection formula, or the comodule description of D(BG). Needed by: `PR.5/generalized-cartier-divisor`, `PR.5/cartier-witt-stack`, `PR.5/wcart-quotient-presentation`, `PR.5/prism-point-of-wcart`, `PR.5/wcart-fibre-products-of-prisms`, `PR.5/quasi-coherent-complexes-on-wcart`, `PR.5/prismatic-crystals-on-wcart`, `PR.5/hodge-tate-divisor`, `PR.5/sen-operator`, `PR.5/sen-operator-classification`.

**PadicHodgeTheory:P7:annulus-foundations**

- Kedlaya, Slope filtrations revisited, Definition 2.2.13, Lemma 2.3.5 and Remark 2.3.8, in the form used in the proof of the F-crystals paper's Lemma 7.7: for an affinoid open U of 𝒳 = Spa(𝔖)^an ∖ {u = 0}, an element of the p-adic completion of 𝔖[1/u] whose image in W(C^♭) defines an analytic function on the preimage of U in 𝒴 = Spa(A_inf)^an ∖ {y_crys} is an analytic function on U. Needed by: `PR.7/etale-realization-over-breuil-kisin-prism`.

**PadicHodgeTheory:R06.1**

- The period rings A_crys, B_crys^+, B_crys, B_dR^+, B_dR for a complete discretely valued field K of characteristic 0 with perfect (not necessarily finite) residue field, with the dictionary to the prismatic normalisation of the F-crystals paper (Notation 5.1): A_crys = A_inf{[p]_q/p} is the PD envelope of ker θ with θ = θ̃ ∘ φ; B_crys = A_crys[1/μ]; B_dR^+ is the completion of A_inf[1/p] at ker θ̃; and the A_inf-linear map φ^*B_crys → B_dR. The packet nodes R06.1/crystalline-period-ring, de-rham-period-ring, frobenius-on-acris, acris-embedding-into-bdr-plus state the rings for θ; the Frobenius-twisted identification is what is requested. Needed by: `PR.7/crystalline-representation-of-f-crystal`, `PR.7/bkf-modules-comparison`, `PR.7/period-sheaves-qrsp`.

**PadicHodgeTheory:R06.2**

- For K complete discretely valued of characteristic 0 with perfect residue field (the packet nodes assume K finite over Q_p): crystalline and de Rham representations, D_crys with its filtered φ-module structure and D_dR; the category Rep^crys_{Z_p}(G_K) of G_K-stable Z_p-lattices; D_crys of a crystalline representation is weakly admissible (only this direction); D_crys is fully faithful; the filtered comparison V ⊗ B_dR ≅ D_dR(V) ⊗_K B_dR. Normalisation: the F-crystals paper puts the filtration on D ⊗_{W(k),φ} K. Needed by: `PR.7/crystalline-representation-of-f-crystal`, `PR.7/crystalline-lattice-to-f-crystal`, `PR.7/breuil-kisin-evaluation`, `PR.7/crystalline-lattices-theorem`.

**PerfectoidQuotients:Q0:integral-algebra**

- Integral perfectoid rings (BMS2 Definition 4.18) with: reducedness; R[p^∞] = R[p]; the derived p-completion of L_{R/Z_p} is R[1], compatibly with maps of perfectoid rings, so that L_{S/R} vanishes after p-completion for a map of perfectoid rings R → S (BMS2 Proposition 4.19 and the proof of Lemma 4.25); A_inf(R) = W(R^♭) and θ; that R⟨X_j^{1/p^∞} : j ∈ J⟩ is perfectoid with A_inf the completed A_inf(R)[X_j^{1/p^∞}]; and that the ring of Witt vectors of a reduced ring is p-torsion-free. Needed by: `PR.2/qrsp-prism`, `PR.2/perfection-of-prismatic-cohomology`, `PR.2/perfection-comparison`, `PR.2/perfection-descendable`, `PR.2/connective-perfectoidization-perfectoid`.
- Integral perfectoid rings with tilt S^♭, A_inf(S) = W(S^♭), θ and a generator d of its kernel; products of perfectoid rings; O_C and Z_p^cycl; the elements [ε], μ = [ε] − 1, ξ, ξ̃; Pic(R) ≅ Pic(A_inf(R)) ≅ Pic(R^♭). Needed by: `PR.4/perfectoid-artin-schreier-witt`, `PR.4/divided-frobenius-contraction`, `PR.4/tate-twist-perfectoid`, `PR.4/picard-perfectoid-uniquely-divisible`, `PR.4/tate-twist-discreteness`, `PR.4/syntomic-truncation-ainf`, `PR.4/ainf-artin-schreier-condition`, `PR.4/syntomic-etale-comparison`, `PR.4/tate-twists-acceptance-examples`.
- A_inf(O_C) = W(O_C^♭) for a perfectoid field C of characteristic 0 containing μ_{p^∞}, Fontaine's map θ, the Teichmüller element [ε] of ε = (1, ζ_p, ζ_{p²}, …), and that ξ = 1 + [ε^{1/p}] + … + [ε^{(p−1)/p}] generates ker θ; the map θ̃ = θ∘φ^{-1}. Needed by: `PR.6/ainf-q-pd-pair`, `PR.6/ainf-omega-comparison-map`, `PR.6/theta-theta-tilde-square`.
- For a perfectoid ring R with perfect prism (A_inf(R), I): A_inf(R)[1/I]^∧_p = W(R^♭[1/I]); for the Breuil–Kisin prism of O_K the perfection is A_inf of the p-completion of O_K[π^{1/p^∞}], a perfectoid ring whose tilt is the completed perfection of k[[u]]. Needed by: `PR.7/laurent-f-crystals-local-systems`, `PR.7/breuil-kisin-and-ainf-covers`.

**PerfectoidQuotients:Q2**

- For a quasiregular semiperfectoid ring R: the universal perfectoid ring R → R_perfd under R, and Δ_{R,perf} = A_inf(R_perfd) as the perfection of the prism Δ_R (BS22 Corollary 7.3, Proposition 7.10). Needed by: `PR.7/crystalline-lattice-to-f-crystal`.

**PerfectoidQuotients:Q3**

- André's flatness lemma in the form of BS22 Theorem 7.14: for a perfectoid ring R there is a p-completely faithfully flat map R → R_∞ of perfectoid rings such that R_∞ is absolutely integrally closed; in particular every element of R acquires compatible p-power roots in R_∞. Used to pass from regular sequences to regular sequences with compatible p-power roots. Needed by: `PR.3/nygaard-regular-semiperfectoid`.
- André's flatness lemma (Bhatt–Scholze Theorem 7.14): every perfectoid ring R has a p-completely faithfully flat map R → S to an absolutely integrally closed perfectoid ring; in particular elements acquire compatible p-power roots and S^× is p-divisible. Needed by: `PR.4/tate-twist-discreteness`.

**PerfectoidQuotients:Q4**

- Bhatt–Scholze Theorem 7.4: for a semiperfectoid ring S the map S → S_perfd is surjective. Needed by: `PR.4/perfectoid-etale-cohomological-dimension`.

**PerfectoidSpaces:P3**

- The tilting equivalence of étale sites of perfectoid spaces (Scholze, Perfectoid spaces, Theorem 1.11), giving RΓ_ét(Spa(S[1/p], S), Z/p^n) ≃ RΓ_ét(Spa(S^♭[1/d], S^♭), Z/p^n), and pro-étale local solvability of Artin–Schreier-type equations in Ô_X^♭. Needed by: `PR.4/perfectoid-artin-schreier-witt`, `PR.4/ainf-artin-schreier-condition`.

**QWittVectors:QW.6**

- The framed q-de Rham machinery in its general form, as a prefix of QW.6 that does not depend on QW.5 (RT-AREA-etale/28). PR.6 depends on this framing prefix of QW.6 only, not on the q-de Rham–Witt targets of QW.6 nor on QW.7. Exact statements needed, for a commutative ring D with an element q that is derived I-complete for I = (q−1) or I = (p, q−1), and a derived I-complete D-algebra P with elements X_s (s ∈ S) such that D[X_s]^∧ → P is I-completely ind-étale (étale framing) or with the X_s inverted (toric framing): (1) unique pairwise commuting D-algebra automorphisms γ_s of P with γ_s(X_t) = q^{δ_st} X_t and γ_s ≡ id mod (q−1)X_s; (2) when (q−1)X_s is a nonzerodivisor, the q-derivatives ∇_{q,s} = (γ_s − 1)/((q−1)X_s) and the logarithmic ones (γ_s − 1)/(q−1), with the twisted Leibniz rule and ∇_{q,s}(X_s^n) = [n]_q X_s^{n−1}; (3) for any ring E with elements X_s and commuting automorphisms γ_s congruent to the identity modulo the nonzerodivisors (q−1)X_s, the Koszul complex of the resulting q-derivations, functorial for ring maps commuting with the automorphisms (PR.6 applies this to E = D_{J,q}(P)); (4) the framed q-de Rham complex qΩ^{*,□}_{P/D}, its functoriality for maps of framed algebras, and its reduction modulo q − 1 to the completed de Rham complex of P/(q−1) over D/(q−1); (5) when D carries a Frobenius lift φ_D with φ_D(q) = q^p, the framed Frobenius lift φ_□ of P with φ_□(X_s) = X_s^p, and φ_□∘γ_s = γ_s∘φ_□. The form over a Λ-ring A with P = R[[q−1]] stated in QW.6's text is the case D = A[[q−1]], I = (q−1); PR.6 needs D = Z_p[[q−1]] and D = A_inf(O_C) with q = [ε], I = (p, q−1). Needed by: `PR.6/framed-q-pd-datum`, `PR.6/gamma-extension-to-q-pd-envelope`, `PR.6/framed-q-de-rham-complex`, `PR.6/q-de-rham-prismatic-comparison-zp`.

**RefinedTraceMethods:RT.3b**

- The Beilinson fibre square on graded pieces, exactly as the F-crystals paper uses it in the proof of its Proposition 6.8 (Antieau–Mathew–Morrow–Nikolaus, Theorem 6.17 and 6.18–6.21). (i) For every p-torsion-free quasisyntomic ring R and n ≥ 0: a natural map χ_n: Q_p(n)(R/p) → (LΩ_R)_{Q_p} and a functorial pullback square in D(Q_p) with top row Q_p(n)(R) → Q_p(n)(R/p), left column Q_p(n)(R) → (LΩ_R^{≥n})_{Q_p}, right column χ_n and bottom row (LΩ_R^{≥n})_{Q_p} → (LΩ_R)_{Q_p}; equivalently a fibre sequence Q_p(n)(R) → Q_p(n)(R/p) → (LΩ_R/LΩ_R^{≥n})_{Q_p}. Here Q_p(n)(−) = Z_p(n)(−)[1/p] with Z_p(n) the syntomic complex of PR.4, LΩ_R is p-completed derived de Rham cohomology over Z_p with its Hodge filtration (not Hodge-completed), and the subscript Q_p means p-completion followed by inversion of p, in this order. (ii) For R quasiregular semiperfectoid and p-torsion-free and n > 0: χ_n is injective on H^0 with image the φ = p^n eigenspace of A_crys(R/p)[1/p] = LΩ_R[1/p]; so, up to a nonzero scalar depending only on n, χ_n is the forgetful map Q_p(n)(R/p) → Δ_{R/p}[1/p] composed with Δ_{R/p} = A_crys(R/p) ≅ LΩ_R. (iii) The suspension dictionary: the square is τ_{[2n−1,2n]} of the pullback square TC(R;Q_p) → TC(R/p;Q_p) over HC^-(R;Q_p) → HP(R;Q_p) (AMMN Corollary 3.9 in the atlas numbering), shifted by −2n; the fibre of TC(R;Q_p) → TC(R/p;Q_p) is ΣHC(R;Q_p), the cofibre is Σ^2HC(R;Q_p), and for R quasiregular semiperfectoid π_{2n}Σ^2HC(R;Q_p) = HC_{2n−2}(R;Q_p) = (LΩ_R/LΩ_R^{≥n})_{Q_p}. The sequence TC → TC(R/p) → HC printed in the introduction of the F-crystals paper is this one with the double suspension suppressed. (iv) Check for R = O_C: the sequence is 0 → Q_p(n) → (B_crys^+)^{φ=p^n} → B_dR^+/Fil^n → 0. Needed by: `PR.7/tate-twist-analytic-continuation`.

**RefinedTraceMethods:RT.6**

- For R quasiregular semiperfectoid: the identification of the weight-n graded piece Z_p(n)(R) of the motivic filtration on TC(R;Z_p) (BMS2 Theorem 1.12, §7.4) with the prismatic syntomic complex fib(φ_n − 1: Fil^n_N Δ̂_R{n} → Δ̂_R{n}) of PR.4/syntomic-complex, naturally in R and compatibly with R → R/p; and the identification of π_{2n}HC^-(R;Z_p) and π_{2n}HP(R;Z_p) with the Hodge-filtered Hodge-completed derived de Rham cohomology. This is what translates RT.3b's square, stated for the TC-defined Z_p(n), into the prismatic form used in node tate-twist-analytic-continuation; no other statement of RT.6 is used by PR.7. Needed by: `PR.7/tate-twist-analytic-continuation`.

**SchemeAndStackFoundations:SF.1**

- Effective faithfully flat descent for finite projective modules: for a faithfully flat ring map R → R′, finite projective R-modules are equivalent to finite projective R′-modules with a descent datum over R′ ⊗_R R′ satisfying the cocycle condition; and a 2-limit of stacks is a stack. Needed by: `PR.2/finite-projective-modules-p-complete`.
- Effective fpqc descent for modules and module maps, so that R ↦ Cart(R) is an fpqc stack equal to [A^1/G_m]; representability of fpqc torsors under a flat affine group scheme and the stack property of BG for the fpqc topology; exactness of the Amitsur complex of a faithfully flat ring map with coefficients in a quasi-coherent module. SF.1 states effective fpqc/fppf descent "for the required objects" and quotients; it does not state descent of invertible modules along W(R) → W(S) for a faithfully flat map R → S (a map that is not flat in general), nor torsors under the non-finite-type group schemes W^× and G_m^♯; the stage proves the first from the Amitsur exactness and needs the second from SF.1. Needed by: `PR.5/generalized-cartier-divisor`, `PR.5/cartier-witt-stack`, `PR.5/wcart-quotient-presentation`, `PR.5/hodge-tate-divisor`.
- (i) Faithfully flat descent for finite projective modules and for perfect complexes over rings, in the form: for a faithfully flat ring map R → S, Vect(R) is the limit of Vect over the Čech nerve. (ii) The Drinfeld–Mathew theorem (Mathew, Faithfully flat descent of almost perfect complexes in rigid geometry, Theorem 5.8): for a connective E_∞-ring R and a finitely generated ideal I ⊂ π_0R, the functors S ↦ D_perf(Spec(S^∧_I) ∖ V(IS)), D^-_coh(…), Vect(…) on connective E_∞-R-algebras are sheaves for the I-completely flat topology. (iii) Beauville–Laszlo glueing of vector bundles along a nonzerodivisor f: Vect(R) ≃ Vect(R[1/f]) ×_{Vect(R^∧_f[1/f])} Vect(R^∧_f). The stage text of SF.1 does not name (ii). Needed by: `PR.7/crystal-descent`, `PR.7/filtered-phi-module-to-crystal`, `PR.7/crystalline-lattice-to-f-crystal`.

**SchemeAndStackFoundations:SF.2**

- The small étale site X_ét of a p-adic formal scheme X (equivalently of its reduction modulo p), the category of p-adic formal schemes adic over X with the étale topology and the restriction morphism of topoi to X_ét, and the derived categories D(X_ét, A) and D(X_ét, O_X) with derived global sections. Needed by: `PR.1/prismatic-to-etale-morphism`, `PR.1/relative-prismatic-cohomology`, `PR.1/hodge-tate-comparison`, `PR.1/prismatic-base-change`, `PR.1/proper-smooth-perfectness`.
- Étale cohomology of schemes with Z/p^n and twisted coefficients μ_{p^n}^{⊗i}, with G_m-coefficients and its comparison with flat cohomology in degrees ≤ 1; the Artin–Schreier, Artin–Schreier–Witt and Kummer sequences; vanishing of higher cohomology of W_n(O) on affines; extension by zero j_!, constructible dévissage and the method of the trace; Gabber's affine analogue of proper base change for henselian pairs; the pro-étale site of a scheme; the universal property of RΓ_ét(Spec −, Z_p) among étale sheaves of algebras. Needed by: `PR.4/perfectoid-artin-schreier-witt`, `PR.4/etale-comparison`, `PR.4/etale-comparison-coefficients`, `PR.4/etale-comparison-without-inverting-d`, `PR.4/perfectoid-etale-cohomological-dimension`, `PR.4/syntomic-low-weights`, `PR.4/tate-twist-perfectoid`, `PR.4/picard-perfectoid-uniquely-divisible`, `PR.4/syntomic-connectivity`, `PR.4/syntomic-truncation-ainf`, `PR.4/syntomic-etale-comparison`, `PR.4/syntomic-cohomology-schemes`, `PR.4/syntomic-not-generic-fibre-etale`.
- For an F_p-algebra S: the bounded derived category D^b_lisse(Spec(S), F_p) of étale F_p-sheaves with locally constant constructible cohomology, finite étale descent for it, the Artin–Schreier sequence 0 → F_p → G_a → G_a → 0 on Spec(S)_ét, and topological invariance of the étale site under universal homeomorphisms. Needed by: `PR.7/artin-schreier-riemann-hilbert`.

**SchemeAndStackFoundations:SF.4**

- p-adic formal schemes over Spf of a p-complete ring: Spf, fibre products, smooth, étale and proper morphisms, the local structure of smooth morphisms (Zariski-locally étale over a completed affine space), and descent of morphisms into a formal scheme along p-completely faithfully flat covers. Needed by: `PR.1/relative-prismatic-site`, `PR.1/prismatic-to-etale-morphism`, `PR.1/proper-smooth-perfectness`.

**VectorBundlesAndIsocrystals:VB2:classification**

- Red-team finding RT-AREA-padic-2/30 (b), with the citations as the F-crystals paper prints them. For C a complete algebraically closed extension of Q_p and the Fargues–Fontaine curve X_FF of C^♭: (i) Fargues–Fontaine, Corollary 11.2.22: the category of φ-modules over the Robba ring ℛ of A_inf(O_C) (Fargues–Fontaine Definition 1.8.1; the extended Robba ring R̃ of the Berkeley lectures, Definition 13.4.3) is equivalent to the category of vector bundles on X_FF. (ii) Fargues–Fontaine, Proposition 10.5.6: for a filtered φ-module (D, φ_D, Fil^•) over K, the bundle E(D, φ_D, Fil^•) on X_FF obtained by modifying E(D, φ_D) at the point ∞ by the B_dR^+-lattice Fil^0(D_K ⊗_K B_dR) is semistable of slope 0 if (D, φ_D, Fil^•) is weakly admissible. (iii) Fargues–Fontaine, Theorem 8.2.10 (1): a semistable vector bundle of slope 0 on X_FF is trivial (the node VB2:classification/dieudonne-manin-classification-of-bundles states this for semistable bundles of any slope). The construction of the bundle E(D, φ_D, Fil^•) and the dictionary in (i) are not yet nodes of the VectorBundlesAndIsocrystals packets. Needed by: `PR.7/weakly-admissible-extension-over-ainf`.

## Gaps

What this plan could not rest on a library declaration, a node or a requested layer. Each is an exact missing input.

- **Joyal's theorem: Witt vectors are the cofree δ-ring.** Bhatt–Scholze Remark 2.7 cites Joyal for the statement that the right adjoint of the forgetful functor from δ-rings to rings is the p-typical Witt vector functor. Mathlib has Witt vectors with Frobenius and ghost components but not this universal property, and no layer of the atlas plans its proof. The node states the adjunction and the unit w_A; a lemma-level proof (construction of the δ-structure on W(R) for R with p-torsion, and of the counit) is still to be planned in this layer. Needed by: `PR.0/delta-ring-category`.
- **Remark 2.5: derived Frobenius lifts.** The source's characterisation of δ-structures on a Z_(p)-algebra as derived Frobenius lifts (a lift of Frobenius together with a homotopy on R ⊗^L F_p) is not planned: no target of PR.0–PR.7 uses it, and it needs animated rings. It is recorded so that the ordinary Frobenius congruence is never mistaken for it. Needed by: `PR.0/delta-frobenius-dictionary`.
- **p-torsion-freeness of completely flat modules over a general p-torsion-free bounded prism.** Needed: for a bounded prism (A,I) with A p-torsion-free and a derived (p,I)-complete, (p,I)-completely flat A-module B, B is p-torsion-free. Established here: B[p] ≅ lim_n B ⊗_A (A/I^n)[p], which vanishes when the pro-system ((A/I^n)[p])_n is pro-zero, in particular for crystalline prisms and for prisms in which (p,d) is a regular sequence. Not established for arbitrary p-torsion-free bounded prisms; Anschütz–Le Bras Lemma 5.1.6 asserts it by calling the first term of the Čech–Alexander complex p-completely flat over A, which Bhatt–Scholze Proposition 3.13 does not state. A proof, or the restriction of the lemma to prisms with A/p of bounded I^∞-torsion, closes the gap; the application in Anschütz–Le Bras (A = A_inf) is covered. Needed by: `PR.1/p-torsion-free-h0-syntomic`.
- **BS22 Proposition 8.5: perfectoidization through the perfect prismatic site.** Missing statement: for a perfect prism (A, I) and a derived p-complete simplicial A/I-algebra S, the map Δ_{S/A,perf} → RΓ((S/A)_Δ^perf, O_Δ) is an equivalence for every topology between the flat and the chaotic one; hence S_perfd ≃ lim_{S→R′} R′ over all maps to perfectoid rings, S_perfd and Δ_{S/A,perf} depend only on π_0(S) and not on (A, I), and for semiperfectoid S the object S_perfd is the universal perfectoid ring of BS22 Corollary 7.3. Its proof uses BS22 Theorem 7.4 and André's lemma (PerfectoidQuotients Q3, Q4), which consume this stage. Owner: the proposed roadmap PerfectoidQuotientsPartIIIntegralPerfectoidization (with Corollaries 8.11–8.12 and Theorems 10.9, 10.11); it is not in the atlas, so no id can be cited. The nodes of this stage are stated relative to a fixed perfect prism and do not use the missing statement; what stays open is the base-free formulation of perfectoidization (the form in which BS22 state Proposition 8.13 and Example 8.3) and the comparison with Corollary 7.3 for every semiperfectoid ring. Needed by: `PR.2/perfection-of-prismatic-cohomology`, `PR.2/perfection-comparison`, `PR.2/perfectoidization-symmetric-monoidal`, `PR.2/connective-perfectoidization-perfectoid`.
- **The arc-topology and arc-descent of perfectoidization (RT-AREA-padic-2/24).** Missing statements: the arc-topology on p-adic formal schemes (BS22 Definition 8.7), the basis of perfectoid objects (Lemma 8.8), the sheaf property and vanishing of higher arc-cohomology of the structure sheaf on perfectoid objects (Proposition 8.10), with the inputs from Bhatt–Mathew, The arc-topology (Theorem 1.6, Corollary 6.17: S ↦ RΓ(Spec S[1/p], Z/p^n) is an arc_p-sheaf); owner: the proposed roadmap ArcTopologyAndDescent. And their consequences S_perfd = RΓ_arc(Spf S, O) and the excision square (BS22 Corollaries 8.11–8.12); owner: the proposed roadmap PerfectoidQuotientsPartIIIntegralPerfectoidization. Neither roadmap is in the atlas. No node of PR.2 uses these statements in its proof; they are needed downstream, by the étale comparison of PR.4 (BS22 Theorems 9.1 and 9.4), for the perfectoidization constructed here. The edges ArcTopologyAndDescent → PR.4 and PerfectoidQuotientsPartII → PR.4 are to be added when those roadmaps exist; PR.2 feeds them (Definition 8.2, Lemmas 8.4 and 8.6) and is not fed by them. Needed by: `PR.2/perfection-of-prismatic-cohomology`, `PR.4/etale-comparison`.
- **The operation P^0 on E_∞-F_p-algebras.** Missing input of BS22 Lemma 8.4: for an E_∞-algebra over F_p the operation P^0 on homotopy groups (Lurie, Rational and p-adic homotopy theory, §2.2), with two properties: (i) for the realisation of a simplicial cosimplicial commutative F_p-algebra, P^0 is induced by the levelwise Frobenius; (ii) P^0 annihilates every homotopy class of positive degree (Remark 2.2.7 there). No atlas stage plans power operations on E_∞-F_p-algebras; the natural owner is the E_∞-algebra layer EnhancedDerivedSheaves E5:abstract or the stable homotopy roadmap that supplies concrete spectra. Until it is supplied, node perfectoidization-coconnective and its consumer rest on this gap. Needed by: `PR.2/perfectoidization-coconnective`, `PR.2/connective-perfectoidization-perfectoid`.
- **The arc_p-topology and arc_p-descent of étale cohomology of the generic fibre (proposed roadmap ArcTopologyAndDescent).** No atlas stage plans the arc-topology. Needed, with the proposed owner ArcTopologyAndDescent: (a) the arc-topology and the arc_p (arc_t for t = p) topology on p-complete rings and the notion of arc_p-equivalence [Bhatt–Mathew, The arc-topology, Definitions 1.2, 6.14, 6.19]; (b) S ↦ RΓ(Spec(Ŝ[1/p]), F) is an arc_p-sheaf for torsion F [Corollary 6.17], and étale cohomology with torsion coefficients satisfies arc-descent [Theorem 5.4]; (c) formal glueing squares for étale cohomology along completion [Theorems 5.13, 6.4] and the Fujiwara–Gabber theorem [Theorem 6.10]; (d) Bhatt–Scholze Definition 8.7 (arc-topology of p-adic formal schemes), Lemma 8.8 and Remark 8.9 (perfectoid rings, and products of p-complete rank-one valuation rings with algebraically closed fraction field, form a basis), Proposition 8.10 (the structure presheaf is an arc-sheaf with vanishing higher cohomology on affine perfectoids). Theorem 9.1 uses (a), (b), (d); Theorem 9.4 and Corollary 9.7 use p-complete arc-descent and (d); Bhatt–Lurie Theorem 8.3.1 uses (a), (b); Construction 8.4.1 and Propositions 8.4.6, 8.4.13 use (b), (c). Needed by: `PR.4/etale-comparison`, `PR.4/tate-twist-perfectoid`, `PR.4/picard-perfectoid-uniquely-divisible`, `PR.4/syntomic-etale-comparison`, `PR.4/syntomic-cohomology-schemes`.
- **Arc-descent and discreteness of perfectoidization (proposed roadmap PerfectoidQuotientsPartIIIntegralPerfectoidization).** Needed, with the proposed owner PerfectoidQuotientsPartIIIntegralPerfectoidization: Bhatt–Scholze Corollary 8.11, S_perfd = RΓ_arc(Spf S, O) for every p-complete ring S, so that S ↦ S_perfd and S ↦ Δ_{S/A,perf} satisfy arc-descent (used to prove that G(S) = (Δ_{S/A}[1/d]/p^n)^{φ=1} is an arc-sheaf in Theorem 9.1); and Bhatt–Scholze Theorem 10.11, for R perfectoid and R → S the p-completion of an integral map Δ_{S/A,perf} is discrete and S_perfd is a perfectoid ring (used for Theorem 11.1, together with Theorem 7.4 from PerfectoidQuotients:Q4). Needed by: `PR.4/etale-comparison`, `PR.4/perfectoid-etale-cohomological-dimension`.
- **A proof of rigidity of syntomic complexes without topological Hochschild homology.** Antieau–Mathew–Morrow–Nikolaus prove Theorem 5.2 (rigidity for henselian pairs) through Propositions 5.36, 5.38, 5.41 and Lemma 5.42, which describe Nygaard graded pieces as gr^n THH, use relative THH over S[z] and THH of graded rings. PR.4 may not depend on RefinedTraceMethods. Missing input: the same statements in prismatic terms, namely (i) continuity of R ↦ gr^m_N Δ_R{n} along I-adic completion for noetherian F-finite R, from the fibre sequence for Nygaard graded pieces (Bhatt–Lurie Remark 5.5.8) and continuity of wedge powers of the cotangent complex; (ii) for a graded ring A ⊕ N, the internal grading on N^{≥•}Δ{i} (Bhatt–Mathew Remark 3.8 and Construction 3.9) and the statement that φ_i multiplies internal degrees by p. Parts (1), (2) of the node (left Kan extension and the bound D^{≤ i+1}) do not depend on this gap. Needed by: `PR.4/syntomic-connectivity`.
- **Bounded p-adic formal schemes as a category with étale and p-quasisyntomic topologies.** No atlas stage named in this roadmap's ownership table supplies p-adic formal schemes (as locally ringed spaces or as functors on rings in which p is nilpotent), bounded formal schemes, their étale topology and the p-quasisyntomic topology on them. PR.1/relative-prismatic-site already uses the notion. Exact input needed: the category of bounded p-adic formal schemes with affine objects Spf R (R p-complete of bounded p-power torsion), fibre products, étale covers and p-quasisyntomic covers, and the fact that a D̂(Z_p)-valued étale sheaf on it is right Kan extended from affines. Proposed owner: SchemeAndStackFoundations (formal schemes) or the site layer PR.1. The affine statements of the four nodes do not depend on this input. Needed by: `PR.5/absolute-prismatic-site`, `PR.5/absolute-prismatic-cohomology`, `PR.5/absolute-prismatic-descent`, `PR.5/absolute-site-comparison`.
- **Almost description of the perfection of the prism of O_C ⊗̂_{O_K} O_C.** Step 3 of the construction uses: for R = O_C ⊗̂_{O_K} O_C the map R_perfd → Cont(G_K, O_C), x ⊗ y ↦ (g ↦ x·g(y)), is an almost isomorphism, hence Δ_{R,perf} = A_inf(R_perfd) → Cont(G_K, A_inf) is an almost isomorphism, and it becomes an isomorphism after inverting I and p-completing. The source writes "we know that Δ_{R,perf} ≃^a RΓ(Spf(R)_η, A_inf(O^+)) ≃^a Cont(G_K, Δ_{O_C})" with no reference. The first almost isomorphism is the identification of perfectoidization with arc-cohomology of the structure sheaf (BS22 Corollary 8.11), whose proposed owner is PerfectoidQuotientsPartIIIntegralPerfectoidization with the arc-topology of ArcTopologyAndDescent, neither yet in the atlas; the second is the computation of the v-cohomology of O^+ on the diamond Spa(C) ×_{Spa(K)} Spa(C) = G_K × Spa(C), which needs the almost acyclicity of O^+ on affinoid perfectoids (PerfectoidSpaces:P3/etale-almost-acyclicity states the étale case). No atlas node states the composite. Needed by: `PR.7/crystalline-lattice-to-f-crystal`.
- **Matching of the Fargues–Fontaine bundle of a filtered φ-module with M(D)(Y).** The source deduces semistability of slope 0 from Fargues–Fontaine Proposition 10.5.6 "and matching constructions": the vector bundle on X_FF corresponding (Corollary 11.2.22) to the φ-module M(D)(Y)_ℛ must be identified with the bundle E(D, φ_D, Fil^•) of Fargues–Fontaine §10.5, including the Frobenius twist in the filtration and the sign of slopes. The identification is planned as the first proof step of the node, but it can only be written once VectorBundlesAndIsocrystals:VB2:classification supplies the dictionary of Corollary 11.2.22 and the construction of E(D, φ_D, Fil^•), which its packets do not yet state (see the request). Needed by: `PR.7/weakly-admissible-extension-over-ainf`.
- **Period rings and Fontaine's functors for infinite perfect residue fields.** The main theorem is stated for every complete discretely valued K of mixed characteristic with perfect residue field. The existing nodes of PadicHodgeTheory R06.1–R06.2 (for example R06.2/filtered-phi-n-modules, R06.1/ax-sen-tate-invariants) are stated for K finite over Q_p. Until R06 extends them (request above), the chain of the main theorem closes only for K finite over Q_p. Needed by: `PR.7/crystalline-representation-of-f-crystal`, `PR.7/crystalline-lattices-theorem`, `PR.7/breuil-kisin-evaluation`.

## Confirmed red-team findings

The findings handed to this plan, and the declarations that settle each.

- **RT-AREA-padic-2/4** (high). No layer plans Kisin's lattice functor for crystalline representations of every weight, nor Fontaine's G_{K_∞} theory; PR.7 compared with an unplanned "R07's Kisin functor".
  - PR.7: Handled as consumer. PR.7 does not rest on an unplanned Kisin functor: D_𝔖 is defined prismatically and its full faithfulness is node breuil-kisin-evaluation. The comparison node kisin-functor-comparison cites the R07.4 packet nodes that now state the four targets of the finding (kummer-etale-phi-modules; kisin-modules and phi-n-nabla-modules; weakly-admissible-slope-zero; finite-height-lattices, semistable-finite-height, crystalline-restriction-full-faithfulness, kisin-etale-full-faithfulness) and requests from the stage what they do not state (all Hodge–Tate weights, Z_p-coefficients, and the agreement of Fontaine's functor with the perfectoid description). The overlap between R07.4/kisin-etale-full-faithfulness, R07.4/crystalline-restriction-full-faithfulness and the two PR.7 theorem nodes is reported in restructure.
- **RT-AREA-padic-2/6** (high). PR.4 restricted the étale comparison of BS22 §9 to smooth formal schemes; Theorem 9.1 holds for every p-adic formal scheme over a perfectoid ring.
  - PR.4: PR.4/etale-comparison states Bhatt–Scholze Theorem 9.1 for an arbitrary p-adic formal scheme over a perfectoid ring, with the derived prismatic cohomology of PR.2, in the nearby-cycle form and the affine form; PR.4/fixed-points-completed-colimits is Lemma 9.2; PR.4/etale-comparison-without-inverting-d is Remark 9.3; PR.4/etale-comparison-smooth records Theorem 1.8(4) as the smooth corollary; PR.4/perfectoid-artin-schreier-witt is the perfectoid local calculation and PR.4/etale-comparison-coefficients the n → n − 1 and Z_p statements. The warning about syntomic complexes is PR.4/syntomic-not-generic-fibre-etale and concerns Z_p(n) only.
- **RT-AREA-padic-2/24** (medium). The arc_p-topology, arc_p-descent of étale cohomology and arc-descent of perfectoidization are needed by PR.2 and PR.4 and no stage plans them.
  - PR.2: Recorded as the gap "The arc-topology and arc-descent of perfectoidization": BS22 Definition 8.7, Lemma 8.8 and Proposition 8.10 are assigned to the proposed roadmap ArcTopologyAndDescent and are not planned here. The finding proposed that PR.2 keep Proposition 8.10 and Corollaries 8.11–8.12 as its own nodes; the route decision taken after it moved Proposition 8.10 to ArcTopologyAndDescent and Proposition 8.5 with Corollaries 8.11–8.12 to PerfectoidQuotientsPartIIIntegralPerfectoidization, so PR.2 plans from §8 only Definition 8.2 (perfection-of-prismatic-cohomology, perfection-comparison), Lemma 8.4 (perfectoidization-coconnective), Lemma 8.6 (perfection-descendable), Proposition 8.13 (perfectoidization-symmetric-monoidal) and Corollary 8.14 (connective-perfectoidization-perfectoid). No node of PR.2 uses arc-descent; the gap names PR.4/etale-comparison as the consumer.
  - PR.4: Two gaps name the proposed owners with exact statements: ArcTopologyAndDescent (arc_p-topology, Bhatt–Mathew Corollary 6.17 and Theorems 5.4, 5.13, 6.4, 6.10, Bhatt–Scholze Definition 8.7 – Proposition 8.10), needed by PR.4/etale-comparison, PR.4/tate-twist-perfectoid, PR.4/picard-perfectoid-uniquely-divisible, PR.4/syntomic-etale-comparison, PR.4/syntomic-cohomology-schemes; PerfectoidQuotientsPartIIIntegralPerfectoidization (Bhatt–Scholze Corollary 8.11 and Theorem 10.11), needed by PR.4/etale-comparison and PR.4/perfectoid-etale-cohomological-dimension.
- **RT-AREA-padic-2/25** (medium). PR.4 had no supplier of étale cohomology of schemes or of adic generic fibres.
  - PR.4: Étale cohomology is imported: SchemeAndStackFoundations:SF.2 (Spec(S[1/p]) with Z/p^n-coefficients, Artin–Schreier–Witt, Kummer, G_m, Gabber), ClassicalAdicEtaleCohomology:H0 (adic generic fibre and nearby cycles) and ClassicalAdicEtaleCohomology:H1:henselian (Huber's Spec/Spa comparison, Fujiwara–Gabber), each with a request; they are prerequisites of PR.4/perfectoid-artin-schreier-witt, PR.4/etale-comparison, PR.4/etale-comparison-smooth, PR.4/nearby-cycles-comparison and others.
- **RT-AREA-padic-2/26** (medium). The Hodge–Tate comparison is proved through Corollary 5.5, which needs the Cartier isomorphism of DD.3; PR.1 did not require it.
  - PR.1: Corollary 5.5 is its own node PR.1/hodge-tate-comparison-char-p with prerequisite DerivedDeRhamCohomology:DD.3/polynomial-cartier-map (the id exists in the DD packet); PR.1/hodge-tate-affine-line and PR.1/hodge-tate-comparison reduce to it through PR.1/crystallization-of-oriented-prism. The node also fixes the logical order for p = 2 (β(f)² = 0 over crystalline prisms is proved with the Cartier isomorphism).
- **RT-AREA-padic-2/27** (medium). PR.1 stated the de Rham comparison unconditionally; Theorem 6.4 assumes W(A/I) p-torsion-free and the general statement is Corollary 15.4 in PR.3.
  - PR.1: PR.1/de-rham-comparison is stated with the hypothesis "W(A/I) is p-torsion-free" (examples: A/I p-torsion-free, or I = (p) with A/p reduced). The unconditional Corollary 15.4 is not stated; the node points to PrismaticCohomology:PR.3/de-rham-comparison-general.
  - PR.3: The unconditional de Rham comparison is node PrismaticCohomology:PR.3/de-rham-comparison-general (BS22 Corollary 15.4, with the derived form BL22 Proposition 5.2.5), a consumer of PrismaticCohomology:PR.3/leta-frobenius-factorisation (Theorem 15.3); Corollary 15.5 is node PrismaticCohomology:PR.3/image-of-frobenius, with the direction of V_i on H^i corrected. PR.1/de-rham-comparison (Theorem 6.4, W(A/I) p-torsion-free) is cited only as the special case; the node says that the two isomorphisms are not compared by the sources.
- **RT-AREA-padic-2/28** (medium). Breuil–Kisin twists, the absolute Nygaard filtration and the syntomic complexes were each assigned to two layers.
  - PR.3: PR.3 owns the relative Nygaard filtration (nodes relative-nygaard-large-quasisyntomic, relative-nygaard-filtration, relative-nygaard-graded-pieces, nygaard-hodge-comparison, nygaard-completeness, nygaard-frobenius-colimit) and the Breuil–Kisin twists A{n} of a prism (nodes transversal-prism, transversal-approximation, breuil-kisin-twist-transversal, breuil-kisin-twist, breuil-kisin-twist-examples; BL22 §2). No node plans absolute prismatic cohomology, the absolute Nygaard filtration (BL22 §§3–5.5, PR.5) or syntomic complexes (PR.4); the nodes name PR.4 and PR.5 only as consumers. BL22 §5.1–5.2 are used at the relative level only, and the proof of the de Rham comparison avoids the Cartier–Witt stack.
  - PR.4: PR.4 owns the syntomic complexes and their étale comparison: PR.4/syntomic-complex (quasisyntomic rings, PR.3 objects), PR.4/syntomic-cohomology-formal-schemes (Bhatt–Lurie generality, citing PR.5/absolute-prismatic-cohomology, PR.5/absolute-nygaard-filtration and PR.3/breuil-kisin-twist), PR.4/syntomic-cohomology-schemes, PR.4/syntomic-etale-comparison, PR.4/tate-twist-discreteness; the edge PR.5 → PR.4 is used, nothing of PR.5 is redefined.
  - PR.5: One owner each. PR.5 owns absolute prismatic cohomology (PR.5/absolute-prismatic-cohomology), its Hodge–Tate, crystalline and de Rham specialisations and the absolute Nygaard filtration with its Frobenius (PR.5/absolute-nygaard-filtration, absolute-nygaard-graded-pieces, absolute-nygaard-perfect-prism, absolute-frobenius). The Breuil–Kisin twists are imported from PR.3/breuil-kisin-twist in every node that uses {n}; the relative Nygaard filtration from PR.3/relative-nygaard-filtration. No node defines a twist or a syntomic complex: Z_p(n) appears only in `uses`, as a consumer in PR.4.
- **RT-AREA-padic-2/29** (medium). PR.5 builds the Cartier–Witt stack without a supplier of stacks, quotient stacks or quasi-coherent complexes.
  - PR.5: Stacks, quotient stacks, classifying stacks and D/Perf of a stack are not built here: PR.5/cartier-witt-stack, wcart-quotient-presentation, quasi-coherent-complexes-on-wcart, prismatic-crystals-on-wcart, hodge-tate-divisor and sen-operator cite LanglandsParameterStacks:LP1 and SchemeAndStackFoundations:SF.1, with requests that say exactly what those stages do not state (formal stacks, group schemes of infinite type, affine pushforward, comodule description of D(BG), descent along W(R) → W(S)). The quotient presentation WCart = [WCart_0/W^×] (Bhatt–Lurie Proposition 3.2.3) is its own node, PR.5/wcart-quotient-presentation.
- **RT-AREA-padic-2/30** (medium). PR.7 used v-descent of local systems, the Fargues–Fontaine classification and Kisin's functor without prerequisites supplying them.
  - PR.7: Handled. (a) v-descent of lisse Z_p-sheaves on the diamond generic fibre: node laurent-f-crystals-local-systems cites DiamondEtaleCohomology:C2 with a request stating the sheaf property used in the source's Notation 3.1; etale-realization inherits it. (b) Fargues–Fontaine classification: node weakly-admissible-extension-over-ainf cites VectorBundlesAndIsocrystals:VB2:classification (and its node dieudonne-manin-classification-of-bundles) with a request naming Corollary 11.2.22, Proposition 10.5.6 and Theorem 8.2.10 (1) as the paper prints them; the matching of constructions is a recorded gap. (c) Kisin's functor: PR.7 proves the Breuil–Kisin statements itself from the main theorem (nodes etale-realization-over-breuil-kisin-prism and breuil-kisin-evaluation: the source's Theorems 7.2 and 7.9, Corollary 7.10, Remark 7.12), with no prerequisite in R07.4; the comparison with Kisin's functor is the separate node kisin-functor-comparison, whose prerequisites are the stage FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4 (request) and its existing nodes.
- **RT-AREA-etale/28** (medium). The framed q-de Rham machinery was built twice, in PR.6 and in the draft QWittVectors QW.6.
  - PR.6: One owner: QWittVectors:QW.6. PR.6 imports the framed algebra, γ_s, the q-derivatives, the twisted Leibniz rule, the framed q-de Rham Koszul complex and its reduction modulo q − 1 through the request to QW.6 (which lists the exact statements and asks for the form over a base ring D with an I-completely étale framing, independent of QW.5), and (p, q−1)-completes it: PrismaticCohomology:PR.6/framed-q-pd-datum (import, plus the δ-structure and the ideal J). PR.6 keeps: q-PD envelopes (PrismaticCohomology:PR.6/q-pd-envelope, PrismaticCohomology:PR.6/q-pd-envelope-base-change), the extension of γ_s to D_{J,q}(P), BS22 Lemma 16.21 (PrismaticCohomology:PR.6/gamma-extension-to-q-pd-envelope), the Koszul complex on the envelope (PrismaticCohomology:PR.6/framed-q-de-rham-complex), the q-crystalline site (PrismaticCohomology:PR.6/q-crystalline-site) and the comparisons (PrismaticCohomology:PR.6/q-de-rham-comparison, PrismaticCohomology:PR.6/change-of-framing, PrismaticCohomology:PR.6/q-crystalline-prismatic-comparison, PrismaticCohomology:PR.6/q-de-rham-prismatic-comparison-zp). HQ.1 should import the framed machinery from QW.6 (upstreamNotes).

## Coverage

| Layer | Nodes | Status | Remaining |
|---|---|---|---|
| PR.0 | 88 | planned | Lemma-level refinement of the target-level nodes added in this pass (free δ-rings, perfect δ-rings, distinguished elements, prisms, perfect prisms and perfectoid rings, PD and prismatic envelopes), in the style of the fifty-four lemma-level nodes that precede them.; unbounded-torsion-example: prove that f is a nonzerodivisor of R, which the source asserts without proof.; delta-ring-category: a self-contained proof of Joyal's theorem that W is right adjoint to the forgetful functor, which the source cites.; BS22 Remark 2.5 (derived Frobenius lifts give δ-structures) and Remark 3.11 (perfectoid covers of regular local rings) are not planned: no target of the stage needs them. |
| PR.1 | 26 | planned | Global (non-affine) forms are stated in the nodes but the Lean section states the affine forms only; the sheaf-level statements on X_ét wait for the étale site of a p-adic formal scheme (requests to SF.2 and SF.4).; Lemma-level refinement of the proofs of Theorem 5.2 (the compatibility of the two comparison maps for a general PD ideal, left to the reader in the source) and of Lemma 5.4.; The gap on p-torsion-freeness over a general p-torsion-free bounded prism (PR.1/p-torsion-free-h0-syntomic). |
| PR.2 | 29 | planned | Lemma-level refinement of the coherence of the functor of node derived-prismatic-cohomology: the functorial simplicial cosimplicial δ-algebra F_A(R) of BS22 Lemma 7.7 as an explicit model.; The computation, with a free resolution, that J/I maps onto gr_1^conj in BS22 Example 7.9 (the source refers to an analogue in Bhatt's paper); it is a proof step of node regular-quotient-prismatic-envelope.; The base-free formulation of perfectoidization and its arc-descent, which wait for the two proposed roadmaps named in the gaps. |
| PR.3 | 25 | planned | EXPORT to RefinedTraceMethods:RT.6: the identification of the Nygaard completion with π_0 TC^-(S; Z_p) (BS22 Theorem 13.1) and with π_0 TP(S/S[u]; Z_p) (BS22 Proposition 15.7) is proved there from the node bms2-comparison; PR.3 states no trace-theoretic result.; The E_∞-refinements (multiplicativity of φ̃, of the Bockstein reduction and of the map to the Hodge filtration) are stated in leta-frobenius-factorisation (4), de-rham-comparison-general (1) and nygaard-hodge-comparison (2); a lemma-level plan would split them from the underlying statements and depends on how DD.1 and AI.1 deliver the lax monoidal structures requested.; The sources do not compare the isomorphism of de-rham-comparison-general with that of PR.1/de-rham-comparison (BS22 Theorem 6.4) when both are defined; a node proving that they agree could be added (for instance through the uniqueness theorem of PR.6).; Lemma-level decomposition of the key case (the q-factorial identities of BS22 Lemma 12.6 and the q-divided power lemma 12.5) and of the transversal-prism lemmas (BL22 2.2.1–2.2.10), which are elementary and close to the libraries. |
| PR.4 | 30 | planned | Bhatt–Mathew Theorem 1.8 (for p-torsion-free F-smooth schemes Z/p^n(i)_X → τ^{≤i}Rj_*μ_{p^n}^{⊗i} is an isomorphism in degrees < i and injective in degree i with image generated by symbols), the integral comparison beyond smooth formal schemes over O_C; it is quoted in PR.4/syntomic-not-generic-fibre-etale and needs the F-smoothness theory of Bhatt–Mathew Sections 3–5.; The Fontaine–Messing (Hodge-filtered crystalline) form of the syntomic triangle in mixed characteristic and its comparison with Z_p(n) up to bounded torsion, see upstreamNotes and restructure.; Bhatt–Lurie Variant 8.5.5 and Corollary 8.5.7 (purity) and the relative first Chern class (Variant 8.4.17), consumers of PR.4/syntomic-cohomology-schemes.; The second route for the last step of Theorem 9.1 (products of absolutely integrally closed valuation rings of rank ≤ 1), which the source leaves as an exercise. |
| PR.5 | 28 | planned | Bhatt–Lurie §§3.7–3.8 (exponentiating the Sen operator; D(WCart) through the q-de Rham prism for odd p) and §4.8 (comparison of absolute prismatic and q-de Rham cohomology) are not planned: no target of the stage text needs them; a follow-up could add them as an explicit model of RΓ(WCart, −).; Bhatt–Lurie §3.9 (Sen theory: the Galois-representation interpretation of the Sen operator) is not planned here; it belongs with PR.7 or PadicHodgeTheory.; Bhatt–Lurie §4.9 (the integral diffracted Hodge complex over Z) is not planned; only its p-completed form enters absolute-hodge-tate-cohomology.; The proof of Lemma 5.6.14 and the computations inside Proposition 3.6.18 and Lemma 3.6.19 are recorded as proof steps from their statements; a lemma-level pass must read them line by line.; Globalisation of the Nygaard filtration and of the Frobenius to formal schemes is stated through limits over points; the sheaf-theoretic form on a non-affine qcqs formal scheme depends on the recorded gap. |
| PR.6 | 25 | planned | The ringed q-crystalline site of a non-affine smooth formal scheme (BS22 Remark 16.15 (2)), which the source does not develop; the Zariski-sheaf globalisation of Remark 16.15 (1) is planned in q-crystalline-crystalline-comparison.; A lemma-level decomposition of the proofs of q-pd-envelope (BS22 Lemma 16.10), q-de-rham-comparison (Theorem 16.22) and comparison-uniqueness (Lemma 18.3), whose steps are recorded in proofSteps.; An explicit description of the q-PD envelope of (D⟨X⟩, (q−1, X)) by q-divided powers X^n/[n]_q!, which BS22 §16 does not state. |
| PR.7 | 26 | planned | The source's §7.3 (Constructions 7.13–7.16, Lemma 7.15, Corollary 7.17: the logarithmic connection on the value of a crystal over O_Δ⟨I_Δ/p⟩[1/p] at the Breuil–Kisin prism) has no node: no target of the stage needs it. Construction 7.13 (the Čech nerve 𝔖^{(•)}) is part of node breuil-kisin-and-ainf-covers.; Example 4.6 (Gauss–Manin F-crystals R f_* O_Δ of a proper smooth map) and the statement that the étale realisation commutes with proper smooth pushforward (Example 4.9) are recorded as acceptance checks only.; Remark 3.11 (D_perf(X_Δ, O_Δ)^{φ=1} ≃ D^b_lisse(X_{p=0}, Z_p)) is an acceptance check of laurent-f-crystals-local-systems, not a node.; Lemma-level refinement of the proofs of Lemma 6.9, Proposition 6.10 and Lemmas 7.3–7.7, which are kept as proof steps of descent-data-boundedness and etale-realization-over-breuil-kisin-prism.; The three recorded gaps, and the two overlapping statements with R07.4 reported in restructure. |

## Structure proposals

- **rescope** (PrismaticCohomology, RefinedTraceMethods, CohomologyComparisons). The comparison needs the Beilinson fibre square, which is trace-theoretic and may not enter PR.4, while PR.4 owns the prismatic complexes it compares. Proposal: Give the comparison of the prismatic syntomic complexes Z_p(n) with Fontaine–Messing syntomic cohomology (Antieau–Mathew–Morrow–Nikolaus Section 6, Theorem F) an owner downstream of PrismaticCohomology:PR.4 and RefinedTraceMethods:RT.3b, for instance CohomologyComparisons:CP.6 or a sub-stage of RefinedTraceMethods:RT.3b, with edges PR.4 → owner and RT.3b → owner; consumers of the syntomic route of Colmez–Dospinescu–Nizioł §0.6.1 import it from there.
- **split** (QWittVectors, PrismaticCohomology, HabiroCohomologyFoundations). RT-AREA-etale/28: one owner for the framed q-de Rham machinery; the prefix must not depend on QW.5. Proposal: Split QWittVectors:QW.6 into a framing prefix (framed algebras over a base ring D with an element q, I-completely étale or toric framings for I = (q−1) or (p, q−1), the automorphisms γ_i, q-derivatives, twisted Leibniz rule, framed q-de Rham and q-Hodge Koszul complexes, reduction modulo q − 1, framed Frobenius), requiring only DD.1 and AI.1, and the remainder of QW.6 requiring QW.5. PrismaticCohomology:PR.6 and HabiroCohomologyFoundations:HQ.1 import the prefix.
- **rescope** (PrismaticCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory). Two statements have a node on each side, with different proofs. (1) Full faithfulness of 𝔐 ↦ 𝒪_ℰ ⊗_𝔖 𝔐: R07.4/kisin-etale-full-faithfulness (Kisin 2.1.12 with the erratum proof, through Fontaine's field-of-norms equivalence and Kisin's embedding) and PR.7/etale-realization-over-breuil-kisin-prism (Bhatt–Scholze Theorem 7.2, for all objects of Vect^φ(𝔖), through A_inf, with no field of norms and no slope filtration). (2) Full faithfulness of restriction from G_K to G_{K_∞} on crystalline representations: R07.4/crystalline-restriction-full-faithfulness (Q_p-coefficients) and part (2) of PR.7/breuil-kisin-evaluation (Z_p-lattices, from the main theorem). PR.7 keeps its nodes because the stage must prove the Breuil–Kisin statements from the main theorem as the source does, and the comparison node PR.7/kisin-functor-comparison identifies the two formulations. Proposal: one owner per statement. Either R07.4 keeps both statements and the two PR.7 nodes are recorded as second proofs linked through the comparison node, or the statement (1) moves to PR.7 (its proof there has lighter prerequisites) and R07.4/kisin-etale-full-faithfulness cites it; the second choice needs R07.4 split so that the stage-level edges stay acyclic (PR.7 → the part of R07.4 using it, and the rest of R07.4 → PR.7 for the comparison).
- **split** (PrismaticCohomology). Sub-layers of PR.7 for the atlas (PROTOCOL section 14). Proposal: For the atlas the stage divides naturally into three sub-layers: PR.7:crystals (prismatic-crystal, crystal-descent, quasisyntomic-crystal-comparison, f-crystal-over-prism, prismatic-f-crystal, laurent-f-crystal, artin-schreier-riemann-hilbert, laurent-f-crystals-local-systems, etale-realization, crystalline-realization, f-crystals-over-qrsp), which needs only PR.0–PR.5, SF, DD and C2; PR.7:crystalline-lattices (the nodes for Spf(O_K) up to crystalline-lattices-theorem and mod-p-full-faithfulness-fails), which adds AI.2, R06, VB2:classification, RT.3b and RT.6; and PR.7:breuil-kisin (etale-realization-over-breuil-kisin-prism, breuil-kisin-evaluation, kisin-functor-comparison), the only part that touches R07.4.

## Notes on other proposed roadmaps

Observations for the maintainers of the roadmaps this plan touches. None concerns a Tau Ceti roadmap.

- (PerfectoidQuotients) Q3's description says that it proves Bhatt–Scholze Proposition 7.11 (lifting quasisyntomic covers to bounded prisms). Its proof is the first half of Proposition 7.10 and uses only PR.2; it is planned as PrismaticCohomology:PR.2/quasisyntomic-covers-lift-to-prisms, and Q3 should import it. Bhatt–Scholze Lemma 4.8 (maps out of a perfect prism are determined by their reduction), which Q0:animated-application holds as an inherited aggregate, is planned as PrismaticCohomology:PR.1/perfect-prism-initial.
- (DerivedDeRhamCohomology, PerfectoidQuotients) No stage text states the definition of a quasiregular semiperfectoid ring (BMS2 Definition 4.20). DD.5 speaks of "the semiperfectoid covers used by BMS2", and the PerfectoidQuotients packet records DD.0/DD.5 as its owners. PR.2–PR.4 follow that decision and request the definition from DD.5; DD.5's description should name it.
- (PerfectoidQuotients) A stage edge PerfectoidQuotients:Q3 → PrismaticCohomology:PR.3 is needed: André's flatness lemma (Bhatt–Scholze Theorem 7.14) is used in the proof of Proposition 12.8 (PR.3/nygaard-regular-semiperfectoid). The roadmap lists only AI.1 and PR.2 as requirements of PR.3.
- (RefinedTraceMethods) Export to RT.6, with no prerequisite in the other direction: Bhatt–Scholze Theorem 13.1 and Proposition 15.7 identify π_0 TC^-(S; Z_p), respectively π_0 TP(S/S[u]; Z_p), with the Nygaard completion of Δ_S, respectively of Δ^{(1)}_{S/𝔖}. PR.3 supplies the prismatic half (PR.3/bms2-comparison, nygaard-completion, nygaard-graded-pieces, nygaard-key-case, nygaard-regular-semiperfectoid); RT.6 owns the non-completed theory of BMS2 Construction 7.12, BMS2 Theorem 8.17 and the identification itself.
- (RefinedTraceMethods) Bhatt–Scholze Corollaries 14.2 and 14.3 (K(−; Z_p) is concentrated in even degrees locally on the quasisyntomic site; surjectivity of π_*K(R; Z_p) → π_*K(R/(f_1, …, f_r); Z_p) in odd degrees) follow from PR.4/tate-twist-discreteness and Lemmas 14.4–14.5 together with K(−; Z_p) ≃ τ_{≥0}TC(−; Z_p) on henselian pairs and the motivic filtration on TC. They are left to the proposed Part II of RefinedTraceMethods on henselian pairs and are not nodes of PR.4. The identification gr^n TC(S; Z_p)[−2n] ≃ Z_p(n)(S) (BMS2 Theorem 1.12(5)) and the exact sequence before BMS2 Proposition 8.20 belong to RT.6, which consumes PR.4/syntomic-complex; no PR.4 node has a RefinedTraceMethods prerequisite.
- (CohomologyComparisons, RefinedTraceMethods) Routed item PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B/in-syntomic: PR.4 exports the syntomic complex with its defining fibre sequence (PR.4/syntomic-cohomology-formal-schemes), its crystalline form in characteristic p (PR.4/syntomic-complex-char-p), the integral comparison map with étale cohomology and its isomorphism after inverting ε (PR.4/syntomic-etale-comparison), and the identification with τ^{≤n}Rψ_* for smooth formal schemes over O_C (PR.4/nearby-cycles-comparison). The Fontaine–Messing form with the Hodge filtration in mixed characteristic and its comparison with Z_p(n) (Antieau–Mathew–Morrow–Nikolaus Theorem F) rests on the Beilinson fibre square and needs an owner downstream of PR.4 and RT.3b; see the structure proposals.
- (QWittVectors, HabiroCohomologyFoundations) RT-AREA-etale/28. The framed q-de Rham machinery has one owner, QWittVectors:QW.6. QW.6 requires QW.5, but the framing prefix that PR.6 needs (framings, the automorphisms γ_i, q-derivatives, the framed q-de Rham complex, reduction modulo q − 1, the framed Frobenius) uses none of QW.5 and should be a stage of its own, stated for a base ring D with an element q and not only for A[[q−1]] over a Λ-ring A; the edge to PrismaticCohomology:PR.6 then starts at that stage. QWittVectors depends on PrismaticCohomology only through QW.1 → PR.0, so the edge closes no cycle. HabiroCohomologyFoundations:HQ.1 should import the framed q-difference complex, the q-integers and the twisted Leibniz rule from the same owner, and from PR.6 only the q-crystalline site, the comparison of the framed complex with q-crystalline cohomology (Bhatt–Scholze Theorem 16.22), change of framing and the comparison with prismatic cohomology over (Z_p[[q−1]], ([p]_q)).
- (AInfCohomology) The acceptance check of AI.7 ("agreement of all prior comparison maps through the uniqueness and polynomial/torus tests of BS22 §18") can cite PR.6/comparison-uniqueness. The agreement of the de Rham specialisation of AΩ built in AI.4 with the one transported from PR.3 through PR.6/ainf-omega-comparison is AI.7's statement; it is not proved in Bhatt–Scholze §§16–18.
- (RefinedTraceMethods) The stage text of PR.7 cites "Corollary 3.9 supplies an underlying pullback-square input": this is Corollary 3.9 of Antieau–Mathew–Morrow–Nikolaus in the numbering of the RT.3b stage text, not a statement of the F-crystals paper, where 3.9 is a remark.

## Mistakes found in the sources

Recorded in the packet under `sourceIssues`, with the printed text, the correction and the reason; each awaits independent review. The statements of this plan use the corrected forms. Mistakes that the atlas's register already records are cited by their register ids in the declarations that use them and are not repeated.

- `PrismaticCohomology/E1` (misprint; affects nothing): Remark 2.5 proof, printed p.14, description of the right arrow in the first square; arXiv:1905.08229v4 only.
- `PrismaticCohomology/E11` (misprint; affects nothing): Proof of Lemma 5.4, first displayed decomposition, p. 47 (TeX l. 1572) (arXiv:1905.08229v4).
- `PrismaticCohomology/E12` (gap; affects the proof): Construction 4.17 and Construction 4.18, pp. 41–42 (TeX ll. 1422, 1436), against Proposition 3.13 and Example 3.14 (arXiv:1905.08229v4).
- `PrismaticCohomology/E13` (error; affects a stated result): Theorem 1.8 (5) (and the global forms of (1) and (3)), p. 4 (TeX ll. 203–237), in arXiv:1905.08229v4, the only text read.
- `PrismaticCohomology/E14` (gap; affects the proof): Proof of Lemma 5.1.6 (published: Lemma 5.6), second sentence (arXiv:1907.10525v4).
- `PrismaticCohomology/E21` (error; affects the proof): Proof of Lemma 8.6, p. 66 (TeX l. 2038) (arXiv:1905.08229v4).
- `PrismaticCohomology/E22` (misprint; affects nothing): Proof of Proposition 3.5.1 (published: Proposition 3.30) (arXiv:1907.10525v4).
- `PrismaticCohomology/E23` (misprint; affects nothing): Appendix A, the sentence before Proposition A.3 (arXiv:1907.10525v4; the appendix numbers of the arXiv and published versions coincide).
- `PrismaticCohomology/E31` (misprint; affects nothing): proof of Corollary 2.2.9, last sentence (arXiv:2201.06120v1, TeX l. 1237).
- `PrismaticCohomology/E32` (misprint; affects nothing): proof of Lemma 2.4.2 (arXiv:2201.06120v1, TeX l. 1372).
- `PrismaticCohomology/E33` (misprint; affects nothing): Remark 2.6.2 and Notation 2.6.3 (arXiv:2201.06120v1, TeX ll. 1734, 1746).
- `PrismaticCohomology/E34` (misprint; affects nothing): Proposition 5.1.1 (1), and the display in the uniqueness part of its proof (arXiv:2201.06120v1, TeX ll. 6019, 6164).
- `PrismaticCohomology/E35` (misprint; affects nothing): proof of Corollary 5.2.8, last sentence (arXiv:2201.06120v1, TeX l. 6375).
- `PrismaticCohomology/E36` (misprint; affects nothing): Remark 5.8.4, last sentence (arXiv:2201.06120v1, TeX l. 7726).
- `PrismaticCohomology/E37` (misprint; affects nothing): Remark 9.11, p. 290 of the published version (Publ. math. IHÉS 129 (2019)); the sentence is identical in arXiv:1802.03261v2 (TeX l. 2703).
- `PrismaticCohomology/E41` (error; affects a stated result): Proposition 8.20, p. 281 of the published version (Publ. math. IHÉS 129 (2019)); the statement is identical in arXiv:1802.03261v2.
- `PrismaticCohomology/E42` (misprint; affects nothing): Proof of Lemma 14.4, the sentence after the display describing Fil^n_N D (arXiv:1905.08229v4, TeX l. 3065).
- `PrismaticCohomology/E43` (misprint; affects nothing): Section 8.1, the paragraph between Theorem 8.1.9 and its proof; and Section 8, introduction (arXiv:2201.06120v1, TeX ll. 10575 and 10446).
- `PrismaticCohomology/E44` (misprint; affects nothing): Remark 8.5.4 (arXiv:2201.06120v1, TeX ll. 11171–11177).
- `PrismaticCohomology/E45` (misprint; affects nothing): Proof of Proposition 8.4.10, fourth paragraph (arXiv:2201.06120v1, TeX l. 11002).
- `PrismaticCohomology/E51` (misprint; affects a stated result): Remark 5.7.8, Proposition 5.7.9 and Remark 5.7.10 (arXiv:2201.06120v1, TeX ll. 7627, 7638–7640, 7660–7673).
- `PrismaticCohomology/E52` (misprint; affects a stated result): Theorem 3.6.7 (arXiv:2201.06120v1, TeX l. 3015).
- `PrismaticCohomology/E53` (misprint; affects nothing): Remark 3.1.7 (arXiv:2201.06120v1, TeX ll. 2125–2129).
- `PrismaticCohomology/E54` (misprint; affects nothing): Construction 4.4.19 and Notation 5.5.23 (arXiv:2201.06120v1, TeX ll. 4853, 7183).
- `PrismaticCohomology/E55` (gap; affects the proof): Remark 3.1.7, last sentence (arXiv:2201.06120v1, TeX ll. 2131–2132); used in the proof of Theorem 3.4.13.
- `PrismaticCohomology/E56` (misprint; affects nothing): Proof of Proposition 3.2.8 (arXiv:2201.06120v1, TeX ll. 2242–2248).
- `PrismaticCohomology/E57` (misprint; affects nothing): Notation 3.5.7 (arXiv:2201.06120v1, TeX l. 2724).
- `PrismaticCohomology/E58` (misprint; affects nothing): Construction 4.7.1, last paragraph (arXiv:2201.06120v1, TeX l. 5398).
- `PrismaticCohomology/E61` (gap; affects the proof): Proof of Lemma 16.7 (TeX l. 3457) (arXiv:1905.08229v4).
- `PrismaticCohomology/E62` (misprint; affects nothing): §16: Lemma 16.5 (3), Example 16.9 (3), Lemma 16.10, proofs of Theorems 16.17 and 16.18, Constructions 16.19 and 16.20 (TeX ll. 3419, 3489, 3495, 3504, 3573, 3581, 3595, 3597, 3618) (arXiv:1905.08229v4).
- `PrismaticCohomology/E63` (gap; affects the proof): Lemma 16.5 (4) and the proofs of Lemma 16.5 (5) and Theorem 16.17 (TeX ll. 3420, 3436, 3573) (arXiv:1905.08229v4).
- `PrismaticCohomology/E64` (gap; affects the proof): Construction 16.13 and Remark 16.16 (TeX ll. 3540, 3565), against Lemma 16.10 (TeX l. 3495) (arXiv:1905.08229v4).
- `PrismaticCohomology/E65` (misprint; affects nothing): Construction 16.19 (TeX l. 3594) (arXiv:1905.08229v4).
- `PrismaticCohomology/E66` (gap; affects the proof): Proof of Theorem 16.18 (TeX l. 3583) (arXiv:1905.08229v4).
- `PrismaticCohomology/E67` (gap; affects the proof): Proof of Theorem 17.2 (TeX l. 3741) (arXiv:1905.08229v4).
- `PrismaticCohomology/E68` (misprint; affects nothing): Proof of Lemma 18.3 (TeX ll. 3789, 3791) (arXiv:1905.08229v4).
- `PrismaticCohomology/E71` (misprint; affects nothing): Example 3.5, Example 4.10 and Remark 3.9 (1) (arXiv:2106.14735v2).
- `PrismaticCohomology/E72` (misprint; affects nothing): Construction 4.8 (arXiv:2106.14735v2).
- `PrismaticCohomology/E73` (misprint; affects nothing): §6.4, proof of essential surjectivity in Theorem 5.6, fourth paragraph (arXiv:2106.14735v2).
- `PrismaticCohomology/E74` (misprint; affects nothing): Notation 7.4, description of the points x_n (arXiv:2106.14735v2).
- `PrismaticCohomology/E75` (misprint; affects nothing): Remark 7.11 (arXiv:2106.14735v2).
- `PrismaticCohomology/E76` (misprint; affects nothing): Introduction §1.1, display of the Beilinson fibre sequence (arXiv:2106.14735v2).
- `PrismaticCohomology/E77` (misprint; affects nothing): Introduction §1.2, first paragraph (arXiv:2106.14735v2).
- `PrismaticCohomology/E78` (gap; affects the proof): §6.4, proof of essential surjectivity in Theorem 5.6, fourth paragraph (arXiv:2106.14735v2).
- `PrismaticCohomology/E79` (gap; affects the proof): Example 2.6 (1), the direct argument for the covering property of the Breuil–Kisin prism (arXiv:2106.14735v2).
