# CA.5 — Number-field arithmetic handoff

This layer connects concrete quadratic and cyclotomic presentations to the intrinsic
ring of integers, units, ideals and ideal class groups. It also explains precisely what
an integral matrix, a relation table and a numerical regulator enclosure certify.
Its hypotheses are mathematical evidence that a producer must establish. Search
termination is insufficient evidence for either class-group completeness or a
fundamental unit system.

This document continues the nineteen targets in the accepted
[parent packet](../packets/ClassicalArithmeticCompletion.json), retaining their IDs.
The eight additions have distinct IDs in the
[CA.5 packet](../packets/ClassicalArithmeticCompletion--CA.5.json).
The [suggested file](../suggested/ClassicalArithmeticCompletion--CA.5.lean) supplies
compact endpoint statements on existing carriers. The mathematical plan is closed;
its theorem proofs are admitted and every implementation status remains unchecked.

## Ownership and dependencies

The reviewed audit marks the old algorithm handoff as process with a partly built
matrix interpretation. RS-03 keeps the intrinsic comparisons in CA.5. Consequently
this layer owns the four soundness criteria below, while ComputationalNumberTheory
CN.2 consumes them to certify its algorithms. There is no prerequisite from CA.5
to CN.2 and no new algorithm, termination theorem or runtime estimate in this plan.

NumberFieldArithmetic owns integral bases, relative discriminants, ideal
factorization, Frobenius and the global-local dictionary. Its Layer 7.2 supplies
quadratic integral bases. Its Layer 7.4 owns the rank-one, prime-degree
unit-candidate elimination method; the current library already contains
`UnitCandidateEliminationCertificate.sound` and the golden-ratio fundamental-unit
and regulator theorems in `TauCeti.NumberField.Sqrt5`. These are imported examples,
not fresh targets. GlobalNumberFields Layer 11 owns the general narrow/wide,
ray-class and order/Picard functoriality. Here the existing narrow class group and
its forgetful map are used only for the quadratic negative Pell comparisons.

The current roadmap checkout was inspected at commit
`0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The prototype itself uses the required
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Twenty-three source files used for the
pinned citation inventory matched the corresponding Git objects. The declaration
inventory at the end records what each exact statement supplies.

The internal suppliers are CA.3's integer Smith and Hermite certificates and
cokernel comparison, and CA.4's Pell and negative-Pell classification. They remain
imported parent nodes. Their algorithms, canonical-form constructions and Pell
classification proofs are not duplicated in CA.5.

## Conventions

For a number field K, write O_K for its full ring of integers, Cl(K) for the
ordinary ideal class group, Cl⁺(K) for the narrow group, h_K for `classNumber K`
and R_K for `NumberField.Units.regulator K`. Koymans–Pagano use Cl for the narrow
group in the cited discussion; our superscript distinguishes it throughout.
The ideal norm is the positive cardinality of O_K/I for a nonzero integral ideal.
The norm of a field element is the field norm to Q. These norms have different
carriers and are never exchanged without the integral-closure comparison.

An integral basis ω has n entries. Integer matrix columns give coordinates of
vectors in that basis: L_ω(H) is the inverse image under ω's coordinate
equivalence of the range of H acting on Z^n. H is square and det H≠0 whenever
it is used as a basis of a full lattice. Hermite form is CA.3's column convention:
upper triangular in the square full-rank case, positive diagonal, and entries to
the right reduced modulo that row's pivot. A general nonzero-determinant matrix
still describes a lattice; HNF only makes the representative canonical.

Relation matrices also use columns. Biasse–Fieker Section 2, p. 386 uses rows;
transpose its presentation when comparing conventions. For a family of nonzero
ideals I_i, φ sends an exponent vector to the product of their ideal classes.
Its additive version has target Additive Cl(K); Λ is its kernel. For a found
relation matrix A, L=range A is contained in Λ. Equality L=Λ is the completeness
condition. Full rank alone does not establish it.

A family u has exactly `NumberField.Units.rank K` entries. `IsMaxRank u` means
real linear independence of its logarithmic embeddings. The regulator of a
family is zero without this hypothesis, so maximal rank is required in every
certificate. For a log determinant, delete one infinite place and use weight one
at real places and weight two at complex places, exactly as
`regOfFamily_eq_det` states. Rank zero has the empty determinant one, not zero.

For quadratic comparisons, d is a squarefree integer greater than one, θ lies in
O_K with minimal polynomial X²−d over Z, and Q[θ]=K. Conjugation σ is the
pinned `ringOfIntegersQuadraticConj`. The square-root θ is a unit in the field K,
which is all `mkPrincipal` needs; it is generally not a unit of O_K. The equation
x²−dy²=−1 always uses integral x,y. Rational solubility and congruence conditions
alone do not replace this hypothesis.

## The four certificate interfaces

### Integral basis

Given any n integral elements b_i and an existing integral basis ω, form their
integer coordinate matrix C, with b_j=Σ_i C_ij ω_i. Discriminant change of family
and `discr_eq_discr` give

    discr(b) = det(C)² d_K.

This formula also holds for dependent b; its zero determinant then gives zero
discriminant. Since d_K≠0, discr(b)=d_K holds exactly when det(C)=±1. The integer
adjugate supplies an inverse, so these conditions hold exactly when b is an
integral basis. For independent b, the range basis and
`Submodule.natAbs_det_basis_change` identify |det C| with [O_K:Σ Zb_i]. This
supplies the finite-index transport demanded by the parent review.

If discr(b) is squarefree, it is nonzero. Were det C a nonunit, one of its prime
divisors would contribute a prime square to discr(b). Thus b is a basis. This is
a sufficient test, not a necessary one: the basis (1,i) of Q(i) has discriminant
−4. Stein Proposition 6.2.6, p. 73, supplies the index-squared relation;
Example 6.2.8, p. 74, illustrates the half-integral correction in Q(√5).
The endpoints are `integralBasis_iff_discr_eq` and
`integralBasis_of_squarefree_discr`, refining the parent's
`discriminant-of-a-sublattice-basis` target.

Checks: (1,√5) has discriminant 20 and index two in the full order of
discriminant five; (1,(1+√5)/2) passes with discriminant five. In Q(i),
(1,2i) has discriminant −16 and index two, while (1,i) is accepted although its
discriminant is not squarefree. A dependent pair has discriminant zero and fails.
The cyclotomic presentation Q(ζ₄)=Q(i) uses the same intrinsic basis after
transport through the presentation equivalence; no second ring of integers is
constructed. A producer comparing discriminants must first justify its claimed
field discriminant; comparing two unchecked numbers proves nothing.

### Ideal matrix

For H with det H≠0, let M_k be `Algebra.leftMulMatrix ω (ω k)`. The precise
criterion is

    for every k there is an integer X_k with M_k H = H X_k
    iff L_ω(H) is the underlying Z-lattice of a nonzero ideal of O_K.

For the forward implication, the equation keeps each column in the lattice after
multiplication by each basis element. Z-linearity extends this to every lattice
vector and every integral element. The existing submodule then carries the ideal
axioms, and its carrier determines that ideal uniquely. For the converse,
multiplication stability supplies integral coordinates for each multiplied
column; assemble them as the columns of X_k. The pinned coordinate formula
`leftMulMatrix_mulVec_repr` gives the reconstruction equation.

Injectivity over Q of a square matrix with nonzero determinant gives a basis of
its range, transported through ω to the ideal. `Ideal.natAbs_det_basis_change`
then gives N(I)=|det H|. If H is Hermite, this is the product of positive pivots.
For an existing nonzero ideal, choose 0≠a in I: aO_K⊆I has full rational rank
because multiplication by a is invertible over K. This justifies applying the
CA.3 full-rank Hermite construction. Belabas Sections 5.3.1–5.3.2, p. 36,
provide the coordinate representation and its multiplication use. The endpoint
`multiplication_witnesses_iff_ideal` is the parent's ideal criterion stated with
the multiplier already available in Mathlib.

Checks in (1,i): multiplication by i has matrix J with columns (0,1),(-1,0).
For the ideal (2+i), H has columns (2,1),(-1,2), determinant five and JH=HJ.
It therefore represents an ideal even before conversion to HNF. The lattice
with matrix diag(1,2) fails: multiplying its first generator by i leaves the
lattice. The integer ideal (2) has H=2·Id, norm four, and intersection with Z
of index two; the norm is not just the first pivot. For (1+i), the canonical
Hermite columns are (2,0),(1,1), with norm two.

### Complete relation lattice

Surjectivity of φ is established independently, for example by the parent's
small-prime Minkowski generation theorem. Genuine columns give L⊆Λ. Let
D=|det A|>0. The pinned lattice determinant theorem and index multiplication give

    D = [Z^N:L] = [Z^N:Λ] [Λ:L] = h_K i,  i a positive integer.

The positivity is justified by D≠0 and h_K>0, not assumed from a convention that
assigns infinite index zero. Relative-index-one gives i=1 exactly when L=Λ.
This proves both divisibility and `relationDet_eq_classNumber_iff`. Only after
completeness may the CA.3 Smith cokernel comparison describe Cl(K). If its Smith
rank were below N, projection onto a surviving free Z coordinate would make the
finite class group surject onto infinite Z, a contradiction. No new finite-group
structure theorem is needed for that step.

Checks: for Q(√−14), the columns (2,0),(1,2) form a complete relation lattice
of determinant four and Smith factors 1,4. The smaller found lattice generated
by (2,0),(0,4) has determinant eight, is full rank and contains true relations,
but has index two in the kernel. It must be rejected as incomplete. N=0 gives
D=1; a surjective empty presentation is possible only for a trivial class group.
A singular matrix is outside the nonzero-determinant criterion and cannot be
passed off as a finite presentation certificate.

### Joint class number and regulator

For maximal-rank u, the pinned ratio theorem gives
R(u)=jR_K, where j is the index of the subgroup generated by u and the torsion
units. Both regulators are positive, so j>0. Together with the relation index,

    D R(u) = h_K R_K i j,  with positive integers i,j.

A rigorous lower bound h*≤h_KR_K and a strict inequality DR(u)<2h* force
ij<2 and hence i=j=1. Thus the relation lattice is complete, the units generate
modulo torsion, D=h_K and R(u)=R_K. A regulator-only lower bound L≤R_K likewise
certifies units when R(u)<2L; division by L is unnecessary. Biasse–Fieker
Section 4.3, p. 400 provides the product-index certification argument.

The new interval endpoint is explicit about error: require ε,η≥0,
|Rhat−R(u)|≤ε and |a−h_KR_K|≤η. The sufficient test is

    D (Rhat+ε) < 2(a−η).

Its left side bounds the tentative product above; its right side uses a lower
bound for the true product. The nonzero determinant and maximal-rank hypotheses
force positivity; a nonpositive lower endpoint cannot pass. The conclusion
includes both lattice/group equalities and both numerical equalities. A rigorous
log-table determinant enclosure supplies ε; an independent justified analytic
or enumerative argument supplies η. The soundness theorem itself has no GRH
hypothesis. Conditional producers retain their own conditions when proving the
interval hypothesis. Producing either interval belongs to CN.2.

Checks: exact intervals recover the parent criterion. Index two in either the
relations or units makes the product at least 2h_KR_K, so it cannot pass. Equality
at two is rejected. A rounded approximation that appears below two must include
its error before comparison. Rank-zero unit groups use empty determinant one
and are generated by torsion; imaginary quadratic examples test this case.

## Targets and inherited interfaces

Every parent ID below is retained. A planning resolution supplies the reviewed
proof/interface obligation at target level; it does not assert that its admitted
Lean proof has been implemented. The original parent Suggested file continues to
supply its typed declarations. Heavy Hermite/Smith and presentation carriers are
specified in the reader and imported from their existing targets; the compact
follow-up file states only endpoints available on pinned carriers.


### The class group is generated by the primes of norm at most the Minkowski bound

`ClassicalArithmeticCompletion:CA.5/class-group-generated-by-small-primes`

Let K be a number field of degree n with r_2 complex places and discriminant d_K, and M_K = (4/π)^{r_2} · n!/nⁿ · √|d_K| (Mathlib's Minkowski bound, a local notation M K in Mathlib.NumberTheory.NumberField.ClassNumber). The classes of the nonzero prime ideals P of 𝓞_K with N(P) ≤ M_K generate the class group Cl(K).

Hypotheses: K any number field; the bound is Minkowski's, in the form Mathlib states it.

Proof route: Let C be a class. Mathlib NumberField.exists_ideal_in_class_of_norm_le gives a nonzero integral ideal I in C with N(I) ≤ M_K. Every prime P dividing I has N(P) ≤ N(I) ≤ M_K: I ⊆ P gives N(P) | N(I) (Mathlib Ideal.absNorm_dvd_absNorm_of_le). So the multiplicities of I vanish at every prime outside T = {P : N(P) ≤ M_K}; Tau Ceti ClassGroup.mk0_mem_closure_of_count_eq (with x = 1) puts the class of I in the subgroup generated by the classes IsDedekindDomain.HeightOneSpectrum.classGroupMk of the primes in T.

Acceptance:

- K = ℚ(i): M_K = 4/π < 2, so no prime is needed and Cl(K) = 1 (Conrad Example 2.1).
- K = ℚ(√−14): M_K ≈ 4.764, so the primes over 2 and 3 generate.
- Compatibility: Mathlib RingOfIntegers.isPrincipalIdealRing_of_isPrincipal_of_norm_le_of_isPrime (all primes of norm ≤ M_K principal ⇒ PID) is the case in which every generator is trivial.

Direct suppliers: `mathlib:NumberField.exists_ideal_in_class_of_norm_le`, `mathlib:Ideal.absNorm_dvd_absNorm_of_le`, `mathlib:Ideal.absNorm`, `mathlib:ClassGroup.mk0`, `tauceti:ClassGroup.mk0_mem_closure_of_count_eq`, `tauceti:IsDedekindDomain.HeightOneSpectrum.classGroupMk`, `mathlib:RingOfIntegers.isPrincipalIdealRing_of_isPrincipal_of_norm_le_of_isPrime`.


### The class-group presentation by a family of ideals and its relation lattice

`ClassicalArithmeticCompletion:CA.5/class-group-presentation`

Let I_1, …, I_N be nonzero ideals of 𝓞_K. The presentation map is φ_I : ℤ^N → Cl(K), e ↦ ∏ [I_i]^{e_i} (a group homomorphism from the additive group ℤ^N, written multiplicatively), and the relation lattice is Λ_I = ker φ_I ⊆ ℤ^N: for e ≥ 0, e ∈ Λ_I exactly when the ideal ∏ I_i^{e_i} is principal. If the classes [I_i] generate Cl(K), φ_I induces Cl(K) ≅ ℤ^N / Λ_I and Λ_I has index h_K.

Hypotheses: The I_i are nonzero ideals (nonzero divisors of the ideal monoid); N ≥ 0. Relations are recorded as column vectors (the lattice convention of CA.3).

Planning resolution: Use the finite product of powers of ideal classes as the homomorphism; its additive kernel is a Z-submodule. The image equals the generated subgroup, and the quotient-kernel equivalence plus finiteness gives index h. The nonnegative-principality API refers to ideal classes, not ideal equality.

The retained API serves a matrix whose columns span Λ_I determines Cl(K); found relations span a sublattice of Λ_I; the certificate decides whether found relations span Λ_I; relations collected as exponent vectors of principal products; certified class-group outputs are relation matrices for a generating family of primes.

| Declaration | Contract |
|---|---|
| `classGroupPresentation` | φ_I : Multiplicative (ℤ^N) →* Cl(K), e ↦ ∏ [I_i]^{e_i}. |
| `relationLattice` | Λ_I = ker φ_I as a ℤ-submodule of ℤ^N. |
| `ClassGroupPresentation.single` | φ_I of the i-th basis vector is [I_i]. |
| `ClassGroupPresentation.mem_relationLattice_iff` | e ∈ Λ_I iff φ_I(e) = 1. |
| `ClassGroupPresentation.mem_relationLattice_iff_isPrincipal` | For e ≥ 0: e ∈ Λ_I iff ∏ I_i^{e_i} is principal. |
| `ClassGroupPresentation.surjective_iff` | φ_I is surjective iff the classes [I_i] generate Cl(K). |
| `ClassGroupPresentation.classGroupEquiv` | If φ_I is surjective, Cl(K) ≅ ℤ^N/Λ_I (as an additive group). |
| `ClassGroupPresentation.index_relationLattice` | If φ_I is surjective, [ℤ^N : Λ_I] = h_K. |

Unit tests:

- **TauCeti.ClassicalArithmetic.relationLattice_empty**: For N = 0, relationLattice I = ⊤.
- **TauCeti.ClassicalArithmetic.relationLattice_classNumber_one**: If classNumber K = 1 then relationLattice I = ⊤ for every family I.
- **TauCeti.ClassicalArithmetic.relationLattice_principal_generator**: If I_i is principal then the i-th basis vector is a relation, although I_i need not be the unit ideal (a definition testing equality of ideals instead of classes fails this).
- **TauCeti.ClassicalArithmetic.relationLattice_order**: k times the i-th basis vector lies in Λ_I iff the order of [I_i] divides k.

Acceptance:

- With no generators Λ = ℤ⁰ = everything.
- In a field with h_K = 1 every vector is a relation.
- For K = ℚ(√−14) and I = (p_2, p_3), Λ contains (2, 0) and (1, 2).

Direct suppliers: `mathlib:ClassGroup`, `mathlib:ClassGroup.mk0`, `mathlib:NumberField.classNumber`, `mathlib:QuotientGroup.quotientKerEquivOfSurjective`, `mathlib:Submodule.IsPrincipal`.


### The class group from a complete relation matrix

`ClassicalArithmeticCompletion:CA.5/class-group-of-a-relation-matrix`

Let I_1, …, I_N be nonzero ideals whose classes generate Cl(K), and let A be an N × R integer matrix whose columns span the relation lattice Λ_I. For any Smith normal form certificate of A with invariant factors d_0 | ⋯ | d_{r−1}: r = N, Cl(K) ≅ ⊕_{i<N} ℤ/d_i ℤ, and h_K = ∏ d_i. The invariant factors > 1 are the invariant factors of Cl(K).

Hypotheses: Generation: the [I_i] generate Cl(K) (for instance all primes of norm ≤ M_K, CA.5/class-group-generated-by-small-primes). Completeness: the columns of A span Λ_I, not merely lie in it.

Planning resolution: Import CA.3/cokernel-of-an-integer-matrix. If the Smith rank were below the row count, projection onto one free Z coordinate would give a surjection from the finite class group to infinite Z, a contradiction. Thus there is no free factor; the complete relation lattice is essential.

Acceptance:

- K = ℚ(√−14), I = (p_2, p_3): Λ is spanned by (2, 0) and (1, 2); the Smith form of the matrix with these columns is diag(1, 4), so Cl ≅ ℤ/4.
- K = ℚ(√−30), I = (p_2, p_3, p_5): Λ is spanned by 2e_1, 2e_2, 2e_3 and (1, 1, 1); invariant factors 1, 2, 2, so Cl ≅ (ℤ/2)², with the same class number 4 as ℚ(√−14).
- Omitting the relation (1, 2) for ℚ(√−14) leaves a matrix of rank 1 < N: an incomplete relation set is detected by the rank before any class number is read off.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/class-group-presentation`, `ClassicalArithmeticCompletion:CA.3/cokernel-of-an-integer-matrix`, `ClassicalArithmeticCompletion:CA.3/smith-normal-form-certificate`, `mathlib:NumberField.classNumber`.


### Found relations bound the class number from above

`ClassicalArithmeticCompletion:CA.5/class-number-divides-relation-determinant`

Let I_1, …, I_N be nonzero ideals whose classes generate Cl(K), and A an N × N integer matrix with det A ≠ 0 whose columns are relations (lie in Λ_I). Then h_K · [Λ_I : Aℤ^N] = |det A|. In particular h_K divides |det A|, and h_K = |det A| exactly when the columns of A span Λ_I.

Hypotheses: Generation of Cl(K) by the [I_i]. det A ≠ 0 (the found relations have full rank).

Planning resolution: Nonzero det gives a full-rank column lattice of index |det A| by AddSubgroup.index_eq_natAbs_det. Index multiplication with the kernel of a surjective presentation gives |det A|=h·i. Since this index is nonzero, i is positive; relative-index-one gives determinant equality iff completeness.

Acceptance:

- K = ℚ(i) with I = ((1 + i)): the relation (2) gives |det| = 2, while (1 + i) is principal, so Λ = ℤ, h = 1 and [Λ : 2ℤ] = 2.
- K = ℚ(√−14): the relations (2, 0) and (0, 4) (p_3⁴ ∼ p_2^{−2} ∼ 1) give |det| = 8 = 4 · 2.
- Found relations alone never prove completeness: a lower bound for h_K (or for h_K R_K) is needed (CA.5/class-number-regulator-certificate).

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/class-group-presentation`, `mathlib:AddSubgroup.index_eq_natAbs_det`, `mathlib:Subgroup.relIndex_mul_index`, `mathlib:NumberField.classNumber`.


### A regulator lower bound certifies a fundamental system of units

`ClassicalArithmeticCompletion:CA.5/fundamental-units-from-regulator-bound`

Let K be a number field of unit rank r, u_1, …, u_r units whose logarithmic embeddings are linearly independent (Mathlib IsMaxRank), and L a real number with L ≤ R_K. If R(u) < 2L, where R(u) is the regulator of the family, then u_1, …, u_r together with the roots of unity generate 𝓞_K^×.

Hypotheses: L is a certified lower bound for the regulator, supplied independently (analytically, or by an enumeration argument). IsMaxRank u: the family has finite index.

Proof route: Mathlib NumberField.Units.regOfFamily_div_regulator: R(u)/R_K = [𝓞_K^× : ⟨u⟩·μ_K] =: j, a positive integer (finite index by Mathlib isMaxRank_iff_closure_finiteIndex; R_K > 0 by regulator_pos). Write R(u)=j R_K with j a positive integer. From L≤R_K and R(u)<2L obtain j R_K<2R_K; since R_K>0, j<2, so j=1. This uses no division by L.

Acceptance:

- K = ℚ(√5), u = (1 + √5)/2: R(u) = log((1 + √5)/2) ≈ 0.4812 = R_K; any certified L with R_K/2 < L ≤ R_K certifies u.
- u = ((1 + √5)/2)² has R(u) = 2R_K ≥ 2L for every L ≤ R_K: a non-fundamental family is never certified.
- Rank 0 (imaginary quadratic): the empty family has R = 1 = R_K, and any L ∈ (1/2, 1] certifies that μ_K is the whole unit group.

Direct suppliers: `mathlib:NumberField.Units.regOfFamily_div_regulator`, `mathlib:NumberField.Units.IsMaxRank`, `mathlib:NumberField.Units.regOfFamily`, `mathlib:NumberField.Units.regulator`, `mathlib:NumberField.Units.regulator_pos`, `mathlib:NumberField.Units.torsion`, `mathlib:NumberField.Units.isMaxRank_iff_closure_finiteIndex`.


### The class-number–regulator certificate

`ClassicalArithmeticCompletion:CA.5/class-number-regulator-certificate`

Let I_1, …, I_N be nonzero ideals whose classes generate Cl(K), A an N × N integer matrix with det A ≠ 0 whose columns lie in Λ_I, u a family of r units with IsMaxRank, and h* a real number with h* ≤ h_K R_K. If |det A| · R(u) < 2h*, then the columns of A span Λ_I (so Cl(K) ≅ ℤ^N/Aℤ^N, read off from the Smith form of A) and u together with μ_K generates 𝓞_K^×; in particular h_K = |det A| and R_K = R(u).

Hypotheses: h* is a certified lower bound for h_K R_K; in practice it comes from the analytic class number formula (the residue of ζ_K at 1), evaluated with error control, and is an input here. The other hypotheses are those of CA.5/class-number-divides-relation-determinant and CA.5/fundamental-units-from-regulator-bound.

Planning resolution: The relation and unit indices are positive; the product is hR·ij. A certified h*≤hR and a strict product below 2h* force ij=1. Both group equalities and both numerical equalities follow. The interval refinement records the error budget explicitly.

Acceptance:

- K = ℚ(√−14): h = 4, R = 1; the relation matrix with columns (2, 0), (1, 2) and the empty unit family pass for any h* ∈ (2, 4].
- With the incomplete matrix of columns (2, 0), (0, 4) (det 8) no h* ≤ 4 passes: the certificate refuses it.
- The certificate checks the class group and the units together; neither index is certified from found relations or found units alone.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/class-number-divides-relation-determinant`, `ClassicalArithmeticCompletion:CA.5/fundamental-units-from-regulator-bound`, `ClassicalArithmeticCompletion:CA.5/class-group-of-a-relation-matrix`, `mathlib:NumberField.Units.regOfFamily_div_regulator`, `mathlib:NumberField.classNumber`.


### The Hermite matrix of an ideal in a fixed integral basis

`ClassicalArithmeticCompletion:CA.5/ideal-hermite-matrix`

Fix a ℤ-basis ω = (ω_1, …, ω_n) of 𝓞_K. For a nonzero ideal I, the Hermite matrix H_ω(I) is the unique n × n integer matrix in Hermite normal form (CA.3 convention: columns, upper triangular, entries to the right of each pivot reduced) whose columns are the ω-coordinates of a ℤ-basis of I. I ↦ H_ω(I) is injective; H_ω(𝓞_K) = 1; H_ω((m)) = m·1 for m ∈ ℤ_{>0}; x ∈ I iff the coordinate vector of x lies in the column lattice of H_ω(I); and when ω_1 = 1, I ∩ ℤ = H_ω(I)_{1,1} ℤ.

Hypotheses: ω is a ℤ-basis of 𝓞_K (for instance Mathlib NumberField.RingOfIntegers.basis); I ≠ 0, so its coordinate lattice has full rank n.

Planning resolution: For 0≠a in I, multiplication by a embeds O_K in I. Its rational extension is invertible, so I has full rank; alternatively the integral characteristic polynomial gives a nonzero integer in (a)⊆I. Apply the imported CA.3 Hermite existence and uniqueness to any integral basis of I, obtaining a square H and equality of the column lattice with I.

The retained API serves the norm of I is the product of the pivots; which Hermite matrices come from ideals; ideals are stored, multiplied and inverted in HNF form; certified ideal outputs (integral bases, ideal decompositions) are Hermite matrices in a fixed integral basis; the generating ideals of a class-group computation are given by their Hermite matrices.

| Declaration | Contract |
|---|---|
| `idealHermiteMatrix` | H_ω(I). |
| `latticeOfMatrix` | The ℤ-submodule of 𝓞_K spanned by the columns of an integer matrix read in ω. |
| `IdealHermiteMatrix.isHermiteNormalForm` | H_ω(I) is in Hermite normal form. |
| `IdealHermiteMatrix.latticeOfMatrix_eq` | The columns of H_ω(I) span I. |
| `IdealHermiteMatrix.injective` | I ↦ H_ω(I) is injective. |
| `IdealHermiteMatrix.eq_iff` | H_ω(I) = H iff H is in Hermite normal form and its columns span I: the interpretation of a certified matrix. |
| `IdealHermiteMatrix.comap_eq_span_corner` | If ω_1 = 1 then I ∩ ℤ = (H_ω(I)_{1,1}). |
| `IdealHermiteMatrix.mem_iff` | x ∈ I iff the ω-coordinates of x lie in the column lattice of H_ω(I). |

Unit tests:

- **TauCeti.ClassicalArithmetic.idealHermiteMatrix_top**: H_ω(𝓞_K) = 1.
- **TauCeti.ClassicalArithmetic.idealHermiteMatrix_intCast**: For m > 0, H_ω((m)) = m·1.
- **TauCeti.ClassicalArithmetic.idealHermiteMatrix_one_add_i**: In a field with ω = (1, θ), θ² = −1, H_ω((1 + θ)) has columns (2, 0) and (1, 1).

Acceptance:

- H_ω(𝓞_K) = 1.
- In ℤ[i] with ω = (1, i), H_ω((1 + i)) has columns (2, 0) and (1, 1).
- H_ω((m)) = m·1.

Direct suppliers: `ClassicalArithmeticCompletion:CA.3/hermite-basis-of-a-sublattice`, `ClassicalArithmeticCompletion:CA.3/is-hermite-normal-form`, `ClassicalArithmeticCompletion:CA.3/hermite-normal-form-unique`, `mathlib:NumberField.RingOfIntegers.basis`, `mathlib:Module.Basis`, `mathlib:Ideal`.


### The norm of an ideal is the product of its Hermite pivots

`ClassicalArithmeticCompletion:CA.5/ideal-norm-eq-prod-hermite-diagonal`

For a nonzero ideal I of 𝓞_K and any ℤ-basis ω of 𝓞_K, N(I) = ∏_i H_ω(I)_{i,i}.

Hypotheses: I ≠ 0.

Planning resolution: Transport the column basis through the integral basis equivalence, then apply Ideal.natAbs_det_basis_change. Positive triangular pivots make |det H| equal their product; the top and integer principal-ideal cases check the dimension power.

Acceptance:

- N((1 + i)) = 2 · 1 = 2 in ℤ[i].
- N((m)) = mⁿ.
- N(𝓞_K) = 1.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/ideal-hermite-matrix`, `mathlib:Ideal.natAbs_det_basis_change`, `mathlib:Ideal.absNorm`, `ClassicalArithmeticCompletion:CA.3/index-eq-prod-hermite-pivots`.


### Which Hermite matrices are the matrices of ideals

`ClassicalArithmeticCompletion:CA.5/hermite-matrix-of-an-ideal-criterion`

Let ω be a ℤ-basis of 𝓞_K and H an n × n integer matrix in Hermite normal form. Then H = H_ω(I) for some nonzero ideal I if and only if the column lattice L_ω(H) = Σ_j ℤ (Σ_i H_{i,j} ω_i) is stable under multiplication by every ω_k. Equivalently, for the multiplication matrices M_k of the ω_k (from the multiplication table of ω), each M_k H = H X_k for an integer matrix X_k.

Hypotheses: H square in Hermite normal form (so det H > 0 and L_ω(H) has full rank).

Planning resolution: Use the existing Algebra.leftMulMatrix, not an undefined multiplier. Stable columns give integer coefficients X_k with M_kH=HX_k. Conversely these equations preserve the lattice under multiplication by every basis element; linearity preserves it under all of O_K, defining a unique ideal. Nonzero det makes it nonzero. The suggested endpoint states this without an HNF carrier.

Acceptance:

- In ℤ[i] with ω = (1, i), diag(2, 1) is in Hermite normal form but its lattice 2ℤ + ℤi is not an ideal (i · i = −1 ∉ it).
- The matrix with columns (2, 0), (1, 1) passes: it is H_ω((1 + i)).
- The identity always passes (I = 𝓞_K).

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/ideal-hermite-matrix`, `ClassicalArithmeticCompletion:CA.3/hermite-normal-form-unique`.


### The discriminant of a basis of a sublattice of 𝓞_K

`ClassicalArithmeticCompletion:CA.5/discriminant-of-a-sublattice-basis`

Let b_1, …, b_n ∈ 𝓞_K be linearly independent over ℤ, n = [K : ℚ], and L = Σ ℤ b_i. Then disc(b) = [𝓞_K : L]² · d_K. Consequently b is an integral basis iff disc(b) = d_K; if disc(b) is squarefree then b is an integral basis; and for an order O ⊆ 𝓞_K, disc(O) = [𝓞_K : O]² d_K.

Hypotheses: n = [K : ℚ] and the b_i are ℤ-linearly independent (so L has finite index).

Planning resolution: Read integer coordinates C in an existing integral basis. The change-of-family formula gives discr b=(det C)^2d_K even for dependent b. Since d_K≠0, discr equality is equivalent to det C=±1, and the adjugate gives an integral inverse and a basis. If discr b is squarefree it is nonzero and a nonunit det would introduce a prime square divisor. Finite-index transport uses the range basis and the pinned determinant-cardinality theorem.

Acceptance:

- ℤ[√5] ⊆ 𝓞_{ℚ(√5)}: disc(1, √5) = 20 = 2² · 5, index 2.
- ℤ[ζ_n] = 𝓞_{ℚ(ζ_n)}: disc(power basis) = d_K (Mathlib IsCyclotomicExtension.Rat.discr is the computation of this discriminant).
- Dedekind's cubic x³ + x² − 2x + 8: every order ℤ[α] has even index, so 4 | disc(α) for every α (Stein Example 6.2.7).

Direct suppliers: `mathlib:Algebra.discr_of_matrix_vecMul`, `mathlib:Algebra.discr`, `mathlib:NumberField.RingOfIntegers.basis`, `mathlib:Submodule.natAbs_det_basis_change`, `mathlib:Module.Basis.toMatrix`, `mathlib:NumberField.discr`, `mathlib:IsCyclotomicExtension.Rat.discr`, `mathlib:NumberField.discr_eq_discr`.


### The index of ℤ[√d] in the ring of integers of ℚ(√d)

`ClassicalArithmeticCompletion:CA.5/index-of-the-order-z-sqrt-d`

Let d ≠ 0, 1 be squarefree, K = ℚ(θ) with θ² = d (minpoly ℤ θ = X² − d). Then [𝓞_K : ℤ[θ]] = 2 if d ≡ 1 (mod 4) and 1 otherwise.

Hypotheses: d squarefree, d ≠ 0, 1; θ generates K.

Proof route: θ is an integral primitive element; Tau Ceti TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr gives disc(X² − d) = 4d = index(θ)² · d_K. Tau Ceti NumberField.discr_eq_of_squarefree_of_mod_four_eq_one and NumberField.discr_eq_four_mul_of_mod_four_ne_one give d_K = d or 4d. Hence index(θ)² = 4 or 1.

Acceptance:

- d = 5: ℤ[√5] has index 2 in ℤ[(1 + √5)/2].
- d = −1: ℤ[i] = 𝓞_{ℚ(i)}.
- d = −3: ℤ[√−3] has index 2 in ℤ[(1 + √−3)/2], the ring containing the primitive cube roots of unity.

Direct suppliers: `tauceti:TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr`, `tauceti:TauCeti.NumberField.IntegralPrimitiveElement.index`, `tauceti:NumberField.discr_eq_of_squarefree_of_mod_four_eq_one`, `tauceti:NumberField.discr_eq_four_mul_of_mod_four_ne_one`, `mathlib:Polynomial.discr`.


### Dedekind–Kummer at every prime for a monogenic presentation

`ClassicalArithmeticCompletion:CA.5/kummer-dedekind-for-a-monogenic-presentation`

Let θ ∈ 𝓞_K with ℤ[θ] = 𝓞_K and f = minpoly ℤ θ. For every rational prime p, the primes of 𝓞_K over p correspond bijectively to the monic irreducible factors Q of f mod p; the prime attached to Q is (p, Q(θ)), its residue degree is deg Q and its ramification index is the multiplicity of Q in f mod p. No prime is excluded.

Hypotheses: ℤ[θ] = 𝓞_K (a monogenic presentation: quadratic fields with θ = √d or (1 + √d)/2, cyclotomic fields with θ = ζ).

Planning resolution: Monogenicity discharges exponent θ=1 by RingOfIntegers.exponent_eq_one_iff, hence p does not divide that exponent for any prime p. Apply the existing primesOverSpanEquivMonicFactorsMod, its span formula, inertia degree and multiplicity ramification theorems. Do not exclude primes dividing the field discriminant.

The retained API serves the factorisations of 2 and 3 in ℤ[√−14]; the factorisations of 2, 3 and 5 in ℤ[√−30]; factoring primes from a generator's minimal polynomial; the factorisation tables of the worked examples.

| Declaration | Contract |
|---|---|
| `primesOverEquivMonicFactorsModOfAdjoinEqTop` | The bijection primesOver(p) ≃ monic irreducible factors of f mod p, for every prime p. |
| `inertiaDeg_primesOverEquivMonicFactorsModOfAdjoinEqTop_symm` | The residue degree of the prime attached to Q is deg Q. |
| `ramificationIdx_primesOverEquivMonicFactorsModOfAdjoinEqTop_symm` | Its ramification index is the multiplicity of Q in f mod p. |
| `primesOverEquivMonicFactorsModOfAdjoinEqTop_symm_apply_eq_span` | The prime attached to (the reduction of) Q is (p, Q(θ)). |

Unit tests:

- **TauCeti.ClassicalArithmetic.kummerDedekind_gaussian_three**: In a field with ℤ[θ] = 𝓞_K and θ² = −1, there is exactly one prime over 3.
- **TauCeti.ClassicalArithmetic.kummerDedekind_gaussian_five**: In the same field there are exactly two primes over 5.
- **TauCeti.ClassicalArithmetic.kummerDedekind_gaussian_two**: In the same field there is one prime over 2 and its ramification index is 2 (the prime dividing the discriminant is covered).

Acceptance:

- ℤ[i], p = 3: X² + 1 is irreducible mod 3, one prime, inert.
- ℤ[i], p = 5: X² + 1 ≡ (X − 2)(X + 2), two primes of degree 1.
- ℤ[i], p = 2: X² + 1 ≡ (X + 1)², one prime with e = 2; the monogenic presentation covers the prime dividing the discriminant, which the general theorem with p ∤ exponent also covers but the hypothesis p ∤ disc f does not.

Direct suppliers: `mathlib:NumberField.Ideal.primesOverSpanEquivMonicFactorsMod`, `mathlib:RingOfIntegers.exponent_eq_one_iff`, `mathlib:RingOfIntegers.monicFactorsMod`, `mathlib:NumberField.Ideal.inertiaDeg_primesOverSpanEquivMonicFactorsMod_symm_apply`, `mathlib:NumberField.Ideal.ramificationIdx_primesOverSpanEquivMonicFactorsMod_symm_apply`, `mathlib:NumberField.Ideal.primesOverSpanEquivMonicFactorsMod_symm_apply_eq_span`.


### The ring ℤ√d inside the ring of integers of ℚ(√d)

`ClassicalArithmeticCompletion:CA.5/zsqrtd-into-the-ring-of-integers`

For d ∈ ℤ and θ ∈ 𝓞_K with θ² = d, the ring homomorphism φ : ℤ√d → 𝓞_K, x + y√d ↦ x + yθ (Mathlib Zsqrtd.lift). Its image is ℤ[θ]; it is injective when d is not a square; for squarefree d ≠ 0,1 with K = ℚ(θ) it is an isomorphism iff d ≢ 1 (mod 4); under these quadratic-field hypotheses it carries the norm form x² − dy² of ℤ√d to the field norm N_{K/ℚ}.

Hypotheses: d is an integer and θ in O_K satisfies θ²=d; no nonsquareness is needed just to define the ring map. Injectivity assumes d is not an integer square. Bijectivity and the field-norm comparison assume d squarefree, d ≠ 0,1, and K=Q(θ), hence [K:Q]=2.

Planning resolution: Use Zsqrtd.lift at θ²=d. Its value is x+yθ and its image is the integral adjoin. A vanishing image would give a rational square root unless both coefficients vanish. The quadratic integral-basis result determines surjectivity; norm_add_mul_gen proves norm transport. The degree-one counterexample is excluded.

The retained API serves Pell solutions live in ℤ√d and are carried to units of 𝓞_K; norm −1 solutions become units of norm −1; Pell equations are stated in Mathlib's ℤ√d (Pell.Solution₁); Pell solutions as units of the ring of integers.

| Declaration | Contract |
|---|---|
| `zsqrtdToRingOfIntegers` | φ : ℤ√d →+* 𝓞_K, x + y√d ↦ x + yθ. |
| `ZsqrtdToRingOfIntegers.sqrtd` | φ(√d) = θ. |
| `ZsqrtdToRingOfIntegers.range_eq` | The image of φ is ℤ[θ]. |
| `ZsqrtdToRingOfIntegers.injective` | φ is injective when d is not a square. |
| `ZsqrtdToRingOfIntegers.bijective_iff` | For squarefree d ≠ 0,1 and K=Q(θ), φ is bijective if and only if d is not congruent to 1 modulo 4. |
| `ZsqrtdToRingOfIntegers.norm` | For squarefree d ≠ 0,1 and K=Q(θ), N_(K/Q)(φ(x))=Zsqrtd.norm x for every x in Zsqrtd. |
| `ZsqrtdToRingOfIntegers.apply` | φ(x + y√d) = x + yθ for x, y ∈ ℤ (from Zsqrtd.lift's evaluation formula). |

Unit tests:

- **TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_gaussian**: For d = −1 and θ² = −1 generating K, φ is bijective.
- **TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_five_not_surjective**: For d = 5, φ is not surjective.
- **TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_norm_example**: N_{K/ℚ}(φ(3 + 2√d)) = 9 − 4d.
- **TauCeti.ClassicalArithmetic.zsqrtdToRingOfIntegers_degree_one_excluded**: At d=1, θ=1 and K=Q, the ring map exists but is not injective: sqrt(1)-1 maps to zero. The field norm of φ(2)=2 differs from Zsqrtd.norm(2)=4, so the norm comparison requires the quadratic-field hypotheses.

Acceptance:

- d = −1: an isomorphism ℤ[i] ≅ 𝓞_{ℚ(i)}.
- d = 5: not surjective, (1 + √5)/2 is missed.
- N(3 + 2√d) = 9 − 4d.

Direct suppliers: `mathlib:Zsqrtd`, `mathlib:Zsqrtd.lift`, `mathlib:Zsqrtd.norm`, `tauceti:NumberField.adjoin_gen_eq_top_of_mod_four_ne_one`, `tauceti:NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one`, `ClassicalArithmeticCompletion:CA.5/index-of-the-order-z-sqrt-d`.


### Pell solutions are the units of norm one

`ClassicalArithmeticCompletion:CA.5/pell-solutions-are-norm-one-units`

Let d > 1 be squarefree with d ≢ 1 (mod 4) and K = ℚ(√d), so that 𝓞_K = ℤ[√d]. The map (x, y) ↦ x + y√d is an isomorphism from Mathlib's group Pell.Solution₁ d of integer solutions of x² − dy² = 1 onto the kernel of the norm 𝓞_K^× → {±1}. This subgroup has index 1 or 2 in 𝓞_K^×, and the fundamental Pell solution generates it modulo ±1.

Hypotheses: d > 1 squarefree, d ≢ 1 (mod 4); K = ℚ(θ) with θ² = d.

Planning resolution: In the maximal order case, use the order isomorphism and Zsqrtd norm-unitary comparison. The unit norm lands in {±1}, so its kernel has index one or two by the quotient-kernel equivalence. Pell.IsFundamental.eq_zpow_or_neg_zpow supplies generation up to sign. This norm-one generator need not generate every full-ring unit.

Acceptance:

- d = 2: the fundamental Pell solution 3 + 2√2 = (1 + √2)², where 1 + √2 has norm −1; index 2.
- d = 3: 2 + √3 has norm 1 and generates the units modulo ±1; index 1.
- For d ≡ 1 (mod 4) the solutions of x² − dy² = 1 are the norm-one units of the order ℤ[√d], of finite index but possibly not all norm-one units of 𝓞_K (d = 5: (1 + √5)/2 squared is not in ℤ[√5]).

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/zsqrtd-into-the-ring-of-integers`, `mathlib:Pell.Solution₁`, `mathlib:Pell.is_pell_solution_iff_mem_unitary`, `mathlib:Zsqrtd.norm_eq_one_iff`, `mathlib:Pell.IsFundamental.eq_zpow_or_neg_zpow`, `mathlib:Pell.IsFundamental.exists_of_not_isSquare`.


### The negative Pell equation and units of norm −1

`ClassicalArithmeticCompletion:CA.5/negative-pell-iff-unit-of-norm-minus-one`

Let d > 1 be squarefree with d ≢ 1 (mod 4) and K = ℚ(√d). The equation x² − dy² = −1 has an integer solution if and only if 𝓞_K has a unit of norm −1; in that case the norm-one units have index 2, and the least positive solution x_1 + y_1√d generates 𝓞_K^× modulo ±1.

Hypotheses: d > 1 squarefree, d ≢ 1 (mod 4).

Planning resolution: In d≠1 mod 4, the ring isomorphism carries norm -1 elements to units by Zsqrtd.norm_eq_one_iff, which uses absolute norm one. Surjectivity onto the norm sign -1 gives index two for its norm-one kernel. CA.4/negative-pell-classification supplies the least-negative-solution generator up to sign.

Acceptance:

- d = 2: 1² − 2·1² = −1, the unit 1 + √2 of norm −1.
- d = 3: x² ≡ −1 (mod 3) has no solution, so no unit of norm −1; the fundamental unit 2 + √3 has norm 1.
- d = 10: 3² − 10·1² = −1.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/zsqrtd-into-the-ring-of-integers`, `ClassicalArithmeticCompletion:CA.5/pell-solutions-are-norm-one-units`, `mathlib:Zsqrtd.norm_eq_one_iff`, `ClassicalArithmeticCompletion:CA.4/negative-pell-classification`.


### The negative Pell equation and units of norm −1 when d ≡ 1 (mod 4)

`ClassicalArithmeticCompletion:CA.5/negative-pell-iff-unit-of-norm-minus-one-for-d-one-mod-four`

Let d > 1 be squarefree with d ≡ 1 (mod 4) and K = ℚ(√d), so that 𝓞_K = {(a + b√d)/2 : a, b ∈ ℤ, a ≡ b (mod 2)} and ℤ[√d] is the subring with a and b even. (i) If d ≡ 1 (mod 8), every unit of 𝓞_K lies in ℤ[√d]. (ii) If d ≡ 5 (mod 8), the cube of every unit of 𝓞_K lies in ℤ[√d]: for u = (a + b√d)/2 of norm ν = ±1, u³ = (a(a² − 3ν) + b(a² − ν)√d)/2. (iii) Hence x² − dy² = −1 has an integer solution if and only if 𝓞_K has a unit of norm −1. With CA.5/negative-pell-iff-unit-of-norm-minus-one (d ≢ 1 (mod 4)) this gives the equivalence for every squarefree d > 1.

Hypotheses: d > 1 squarefree, d ≡ 1 (mod 4). (i) assumes d ≡ 1 (mod 8) and (ii) assumes d ≡ 5 (mod 8); (iii) covers both.

Planning resolution: Use O_K=Z[(1+θ)/2] and write units (a+bθ)/2 with equal parity and a²-db²=4ν, ν=±1. At d=1 mod 8 odd a,b are impossible, so the unit lies in Z[θ]. At d=5 mod 8 the cube has coefficients a(a²-3ν)/2 and b(a²-ν)/2, both integral, and norm ν. The cases d=5,13,17 and excluded d=1 are checked.

The retained API serves Supply the missing converse from a ring-of-integers unit of norm -1 to an integral negative-Pell solution, for every odd squarefree d in the source family.; Transport the norm -1 condition in the quadratic unit Galois-module description to the integral equation..

| Declaration | Contract |
|---|---|
| `unit_mem_zsqrtd_of_mod_eight_eq_one` | For squarefree d>1 with d congruent to 1 modulo 8, every unit of O_Q(sqrt(d)) belongs to the image of Zsqrtd. |
| `unit_cube_mem_zsqrtd_of_mod_eight_eq_five` | For squarefree d>1 with d congruent to 5 modulo 8, every unit has its cube in the image of Zsqrtd, with the displayed integral coordinates. |
| `negativePell_iff_unit_norm_neg_one_mod_four_one` | For squarefree d>1 congruent to 1 modulo 4, an integer solution of x^2-d*y^2=-1 exists if and only if the ring of integers has a unit of field norm -1. |
| `unit_cube_norm` | For a ring-of-integers unit u of norm nu in {1,-1}, the cube used in the order comparison has field norm nu^3=nu. |

Unit tests:

- **negativePell_half_unit_five**: For d=5, (1+sqrt(5))/2 is a unit of norm -1 outside Z[sqrt(5)], while its cube 2+sqrt(5) lies in that order. Direct membership cannot replace cubing.
- **negativePell_half_unit_thirteen**: For d=13, ((3+sqrt(13))/2)^3=18+5sqrt(13), and 18^2-13*5^2=-1.
- **negativePell_order_seventeen**: For d=17 congruent to 1 modulo 8, 4+sqrt(17) has norm -1 and lies in Z[sqrt(17)]; odd half-integral coordinates cannot have norm plus or minus one.
- **negativePell_positive_norm_twentyone**: For d=21, ((5+sqrt(21))/2)^3=55+12sqrt(21) has norm +1, but negative Pell has no solution modulo 3. The mere existence of a unit is insufficient.

Acceptance:

- d = 5: u = (1 + √5)/2 has norm −1 and u³ = 2 + √5, with 2² − 5·1² = −1.
- d = 13: u = (3 + √13)/2 has norm (9 − 13)/4 = −1 and u³ = 18 + 5√13, with 18² − 13·5² = 324 − 325 = −1.
- d = 17 (≡ 1 mod 8): 4² − 17·1² = −1, and the unit 4 + √17 lies in ℤ[√17].
- d = 21: the unit (5 + √21)/2 has norm (25 − 21)/4 = 1 and cube 55 + 12√21 (55² − 21·12² = 1); x² − 21y² = −1 has no solution, since −1 is not a square mod 3.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/zsqrtd-into-the-ring-of-integers`, `ClassicalArithmeticCompletion:CA.5/index-of-the-order-z-sqrt-d`, `tauceti:NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one`, `tauceti:NumberField.exists_norm_eq_neg_one_of_sq_sub_mul_sq_eq_neg_one`, `mathlib:Zsqrtd.norm`.


### The class group of ℚ(√−14) is cyclic of order 4

`ClassicalArithmeticCompletion:CA.5/class-group-of-q-sqrt-minus-14`

For K = ℚ(√−14), Cl(K) ≅ ℤ/4ℤ.

Hypotheses: K = ℚ(θ), θ² = −14.

Planning resolution: The Minkowski bound is below five; primes over two and three generate. Dedekind–Kummer gives P₂²=(2); choose P₃ over three containing 2+θ, so (2+θ)=P₂P₃², checked by valuations and norm 18. No element has norm two, so P₂ is nonprincipal of order two. Thus P₃ has order four, the relation determinant is four and the cyclic group is complete.

Acceptance:

- h = 4 = |det| of the relation matrix.
- The class group is cyclic, unlike ℚ(√−30) of the same class number.
- The generator is the class of a prime of norm 3.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/class-group-generated-by-small-primes`, `ClassicalArithmeticCompletion:CA.5/class-group-of-a-relation-matrix`, `ClassicalArithmeticCompletion:CA.5/kummer-dedekind-for-a-monogenic-presentation`, `ClassicalArithmeticCompletion:CA.3/smith-normal-form-of-an-integer-matrix`, `tauceti:NumberField.adjoin_gen_eq_top_of_mod_four_ne_one`, `mathlib:Ideal.absNorm_span_singleton`.


### The class group of ℚ(√−30) is ℤ/2 × ℤ/2

`ClassicalArithmeticCompletion:CA.5/class-group-of-q-sqrt-minus-30`

For K = ℚ(√−30), Cl(K) ≅ ℤ/2ℤ × ℤ/2ℤ.

Hypotheses: K = ℚ(θ), θ² = −30.

Planning resolution: The bound is below seven; ramified P₂,P₃,P₅ generate. The relations 2e₂,2e₃,2e₅ and (1,1,1) come from (2),(3),(5),(θ), giving a quotient of order four. No element a+bθ has norm two, three or six: b≠0 has norm at least thirty. Hence the classes of P₂,P₃,P₂P₃ are three distinct nontrivial classes and the quotient is complete; Smith factors are 1,2,2.

Acceptance:

- h = 4 as for ℚ(√−14), but the invariant factors are (2, 2), not (4).
- Every class has order dividing 2.
- The relation (1, 1, 1) is what cuts (ℤ/2)³ down to (ℤ/2)².

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/class-group-generated-by-small-primes`, `ClassicalArithmeticCompletion:CA.5/class-group-of-a-relation-matrix`, `ClassicalArithmeticCompletion:CA.5/kummer-dedekind-for-a-monogenic-presentation`, `ClassicalArithmeticCompletion:CA.3/smith-normal-form-of-an-integer-matrix`, `tauceti:NumberField.adjoin_gen_eq_top_of_mod_four_ne_one`, `mathlib:Ideal.absNorm_span_singleton`.


### Interpreting certified number-field outputs as intrinsic invariants

`ClassicalArithmeticCompletion:CA.5/certified-number-field-output-interpretation`

For a number field K, basis, ideal, relation and unit data with the explicit certificates below are interpreted by the comparison theorems of this layer as follows. (1) A family b of n elements of 𝓞_K with a certificate disc(b) = d_K (or disc(b) squarefree) is an integral basis (CA.5/discriminant-of-a-sublattice-basis). (2) A matrix certified to be in Hermite normal form with an 𝓞_K-stable column lattice is the Hermite matrix of a unique ideal, of norm the product of its pivots (CA.5/hermite-matrix-of-an-ideal-criterion, CA.5/ideal-norm-eq-prod-hermite-diagonal). (3) A family of prime ideals containing all primes of norm ≤ M_K with a relation matrix whose columns span the relation lattice (the completeness hypothesis, which clause (4)'s inequality can certify) determines Cl(K) ≅ ⊕ ℤ/d_i by the Smith form (CA.5/class-group-of-a-relation-matrix); without the completeness certificate it determines only a multiple of h_K (CA.5/class-number-divides-relation-determinant). (4) Let A be as in (3) but only a square matrix of nonzero determinant whose columns are relations. A unit family u with IsMaxRank and a certified bound h* ≤ h_K R_K with |det A| R(u) < 2h* generates 𝓞_K^× together with μ_K, and then the columns of A span the relation lattice (CA.5/class-number-regulator-certificate).

Hypotheses: Each input has the intrinsic properties stated in its clause. These are CA.5 criteria available to a computational producer; no type or algorithm from a higher tier is assumed. Termination alone does not certify completeness.

Planning resolution: Expose four independent endpoint interfaces, all owned in CA.5: integralBasis_iff_discr_eq, multiplication_witnesses_iff_ideal, relationDet_eq_classNumber_iff and relations_units_complete_of_intervals. The first three refine imported targets; only the interval/error contracts add new targets. A producer supplies their hypotheses and never just a termination flag.

Acceptance:

- The worked examples ℚ(√−14) and ℚ(√−30) are instances of clause (3) with hand-checked completeness.
- A relation matrix of determinant 8 for ℚ(√−14) (h = 4) is an output without completeness certificate: clause (3) yields only 4 | 8.
- For ℚ(√5) the unit (1 + √5)/2 with any certified L > R_K/2 is an instance of clause (4) with the class group trivial.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/discriminant-of-a-sublattice-basis`, `ClassicalArithmeticCompletion:CA.5/hermite-matrix-of-an-ideal-criterion`, `ClassicalArithmeticCompletion:CA.5/ideal-norm-eq-prod-hermite-diagonal`, `ClassicalArithmeticCompletion:CA.5/class-group-of-a-relation-matrix`, `ClassicalArithmeticCompletion:CA.5/class-number-divides-relation-determinant`, `ClassicalArithmeticCompletion:CA.5/class-number-regulator-certificate`.


## Additional comparison and error targets

### Quadratic unit action in additive coordinates

`ClassicalArithmeticCompletion:CA.5/quadratic-unit-action-model`

Suggested declaration: `TauCeti.ClassicalArithmetic.CA5.quadraticUnitAction`.

For s in Z/2, define τ_s on the existing additive group Z × Z/2 by τ_s(a,b)=(-a,b+s·(a mod 2)). This is the action of the nonidentity element of C₂; τ_s is additive and τ_s²=id.

Hypotheses: No field or chosen fundamental unit is part of this definition.

Proof or construction:

1. Use the ordinary integer-to-ZMod cast for a mod 2.
2. Additivity follows from distributivity and cast additivity. Applying τ_s twice cancels the two shear terms.
3. Its values on (1,0) and (0,1) determine the action and its parameter.

Consumers: ClassicalArithmeticCompletion:CA.5/quadratic-units-action-normal-form — Read the norm sign of a rank-one unit generator as the shear parameter.; Koymans–Pagano v1, Introduction p. 3 (source-route item 9) — Express the stated Galois module on a library carrier with the ordered free/torsion generators fixed..

| Declaration | Contract |
|---|---|
| `quadraticUnitAction_add` | τ_s(x+y)=τ_s(x)+τ_s(y). |
| `quadraticUnitAction_involutive` | τ_s(τ_s(x))=x for every x. |
| `quadraticUnitAction_free_generator` | τ_s(1,0)=(-1,s). |
| `quadraticUnitAction_torsion_generator` | τ_s(0,1)=(0,1). |
| `quadraticUnitAction_parameter` | τ_s=τ_t iff s=t. |
| `quadraticUnitAction_norm` | x+τ_s(x)=(0,s·(x.1 mod 2)), the conjugation norm in additive coordinates. |

Unit tests:

- **quadraticUnitAction_normMinusOne**: τ_1(1,0)=(-1,1).
- **quadraticUnitAction_normPlusOne**: τ_0(1,0)=(-1,0).
- **quadraticUnitAction_torsion**: τ_1(0,1)=(0,1), agreeing with quadratic conjugation on the unit -1.
- **quadraticUnitAction_evenExponent**: τ_1(2,1)=(-2,1), so the shear uses parity rather than the integer exponent itself.

Acceptance:

- The model fixes the torsion generator and reverses the free quotient.

Direct suppliers: `mathlib:ZMod`.

Source: koymans-pagano-v1, Introduction, p. 3, paragraph giving the unit Galois module. The paper identifies the shear-one unit action when negative Pell is solvable. The shear-zero alternative and the existential coordinate interface are derived here from Dirichlet and the norm identity.

### A square-killed kernel is detected on the two-primary subgroup

`ClassicalArithmeticCompletion:CA.5/two-primary-detects-bijectivity`

Suggested declaration: `TauCeti.ClassicalArithmetic.CA5.bijective_iff_bijOn_twoPrimary`.

Let q:G→H be a surjective homomorphism of commutative groups, and assume x²=1 for every x in ker q. Then q is bijective iff its restriction is bijective from G[2∞] to H[2∞], using the canonical subgroups CommGroup.primaryComponent. No finiteness assumption is required.

Hypotheses: G,H commutative groups; q surjective; its kernel killed by two.

Proof or construction:

1. Every homomorphism preserves membership in the canonical primary subgroup by mapping the annihilating power.
2. If q is bijective and y^(2^k)=1, its unique preimage x has q(x^(2^k))=1; injectivity gives x^(2^k)=1, proving surjectivity of the restriction.
3. Conversely every kernel element is in G[2∞], with exponent witness k=1. Injectivity of the restricted map compares that element to one and makes the whole kernel trivial.
4. A homomorphism with trivial kernel is injective; combine with the assumed surjectivity.

Acceptance:

- The identity map is accepted, including trivial groups.
- The quotient Z/4→Z/2 has a square-killed nontrivial kernel and fails the restricted injectivity test.
- Without the kernel condition, Z/3→1 has bijective two-primary restriction but is not injective.

Direct suppliers: `mathlib:CommGroup.primaryComponent`, `mathlib:CommGroup.mem_primaryComponent`.

Source: koymans-pagano-v1, Introduction, p. 2, paragraph following the definition of D. The stated comparison is for the natural map between two-primary narrow and ordinary class groups; the local proof here uses the pinned forgetful map and its square-killed kernel.

### Negative Pell and norm-minus-one units for every squarefree radicand

`ClassicalArithmeticCompletion:CA.5/negative-pell-full-unit-comparison`

Suggested declaration: `TauCeti.ClassicalArithmetic.CA5.negativePell_iff_norm_neg_one`.

Under the quadratic presentation hypotheses, there exist integers x,y with x²-dy²=-1 iff there is a unit u of the full ring O_K with N_K/Q(u)=-1. This interface removes the mod-four condition by joining the two existing parent targets.

Hypotheses: d>1 is a squarefree integer; K is a number field with θ in O_K. minpoly_Z(θ)=X²-d and Q[θ]=K; these hypotheses specify the quadratic presentation.

Proof or construction:

1. Use the parent order-to-unit embedding for the forward implication.
2. If d is not 1 modulo 4, O_K=Z[θ], and read the inverse coordinates and norm from the parent comparison.
3. If d is 1 modulo 4, invoke the reviewed half-coordinate parent target: d=1 modulo 8 puts any unit in Z[θ]; d=5 modulo 8 puts its cube there. The odd power preserves norm minus one.
4. The condition d>1 excludes the degree-one radicand, where quadratic norm transport would be false.

Acceptance:

- d=2 gives (1,1); d=3 is obstructed modulo 3.
- For d=5, ((1+θ)/2)³=2+θ; for d=13, ((3+θ)/2)³=18+5θ.
- For d=17, the negative unit 4+θ is already in Z[θ]; d=1 is excluded.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/negative-pell-iff-unit-of-norm-minus-one`, `ClassicalArithmeticCompletion:CA.5/negative-pell-iff-unit-of-norm-minus-one-for-d-one-mod-four`.

Source: koymans-pagano-v1, Introduction, p. 2, paragraph following the definition of D. The stated comparison is for the natural map between two-primary narrow and ordinary class groups; the local proof here uses the pinned forgetful map and its square-killed kernel.; koymans-pagano-v1, Introduction, p. 3, paragraph giving the unit Galois module. The paper identifies the shear-one unit action when negative Pell is solvable. The shear-zero alternative and the existential coordinate interface are derived here from Dirichlet and the norm identity.

### Negative Pell and the narrow principal square-root class

`ClassicalArithmeticCompletion:CA.5/negative-pell-narrow-principal-comparison`

Suggested declaration: `TauCeti.ClassicalArithmetic.CA5.negativePell_iff_narrowPrincipal`.

Under the quadratic presentation hypotheses, x²-dy²=-1 has an integral solution iff mkPrincipal(θ)=1 in Cl⁺(K). Here θ is read as a unit of the field K, not as an integral unit; θ≠0 follows from its minimal polynomial.

Hypotheses: d>1 is a squarefree integer; K is a number field with θ in O_K. minpoly_Z(θ)=X²-d and Q[θ]=K; these hypotheses specify the quadratic presentation.

Proof or construction:

1. The parent norm bridge turns Pell solubility into an integral unit of norm -1. Since N(θ)=-d, N(θu)=d>0. The pinned quadratic sign lemma makes θu or -θu totally positive, and the pinned mkPrincipal criterion proves triviality.
2. Conversely mkPrincipal(θ)=1 supplies a unit w with wθ totally positive. The two real embeddings send θ to opposite roots of d; therefore w has opposite signs at these embeddings. Its norm is negative and, being an integral unit norm, equals -1.
3. Return through the all-radicand comparison. Changing θ to -θ does not change its principal ideal or the result.

Acceptance:

- The narrow class is trivial for d=2,5,13,17.
- For d=3 it is nontrivial despite (θ) being principal in the ordinary class group.
- The same assertion holds for -θ; ordinary principality alone would incorrectly certify every d.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/negative-pell-full-unit-comparison`, `tauceti:NumberField.NarrowClassGroup.mkPrincipal_eq_one_iff`, `tauceti:NumberField.norm_gen_eq_neg_radicand`, `tauceti:NumberField.exists_unit_isTotallyPositive_smul_of_norm_pos`, `tauceti:NumberField.mul_ringOfIntegersQuadraticConj_unit_eq_one_or_neg_one`.

Source: koymans-pagano-v1, Introduction, p. 4, paragraph introducing the class of (√d). Negative Pell solubility is identified with triviality of the narrow principal class of the square root. The proof is supplied here using the pinned positivity criterion and the parent order bridge.

### Negative Pell and the canonical two-primary forgetful map

`ClassicalArithmeticCompletion:CA.5/negative-pell-two-primary-comparison`

Suggested declaration: `TauCeti.ClassicalArithmetic.CA5.negativePell_iff_twoPrimary`.

Under the quadratic presentation hypotheses, x²-dy²=-1 has an integral solution iff the natural map q:Cl⁺(K)→Cl(K) restricts bijectively from Cl⁺(K)[2∞] to Cl(K)[2∞]. This is a statement about q, not merely about abstract isomorphism types.

Hypotheses: d>1 is a squarefree integer; K is a number field with θ in O_K. minpoly_Z(θ)=X²-d and Q[θ]=K; these hypotheses specify the quadratic presentation.

Proof or construction:

1. The pinned quadratic narrow-class theorem identifies injectivity of q with existence of a norm-minus-one unit; combine it with the parent order bridge.
2. The pinned forgetful map is surjective and its kernel is killed by two. Apply two-primary-detects-bijectivity.
3. The squarefree and d>1 hypotheses enter the order bridge; the group-theoretic detection step itself uses neither number fields nor finiteness.

Acceptance:

- For d=2 the canonical map is an isomorphism.
- For d=3 the nontrivial class of (θ) is a square-killed kernel element, so the two-primary restriction is not injective.
- Replacing the canonical map by an unspecified isomorphism is rejected.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/negative-pell-full-unit-comparison`, `ClassicalArithmeticCompletion:CA.5/two-primary-detects-bijectivity`, `tauceti:NumberField.NarrowClassGroup.toClassGroup_injective_iff_exists_norm_eq_neg_one`, `tauceti:NumberField.NarrowClassGroup.toClassGroup_surjective`, `tauceti:NumberField.NarrowClassGroup.sq_eq_one_of_mem_ker_toClassGroup`.

Source: koymans-pagano-v1, Introduction, p. 2, paragraph following the definition of D. The stated comparison is for the natural map between two-primary narrow and ordinary class groups; the local proof here uses the pinned forgetful map and its square-killed kernel.

### The Galois action on the full quadratic unit group

`ClassicalArithmeticCompletion:CA.5/quadratic-units-action-normal-form`

Suggested declaration: `TauCeti.ClassicalArithmetic.CA5.quadratic_units_action_normal_form`.

Under the quadratic presentation hypotheses, there exist s in Z/2 and an additive equivalence F:Additive(O_Kˣ)→Z×Z/2 with F(-1)=(0,1), F(σu)=τ_s(F(u)) for every unit u, and s=1 iff negative Pell is integrally soluble. Here σ is the pinned ring-of-integers quadratic conjugation. Consequently the soluble case has the Galois module in Koymans–Pagano item 9, while the insoluble case has τ_0. Equivalently, negative Pell is soluble iff an additive equivalence carrying -1 to (0,1) intertwines conjugation with τ_1.

Hypotheses: d>1 is a squarefree integer; K is a number field with θ in O_K. minpoly_Z(θ)=X²-d and Q[θ]=K; these hypotheses specify the quadratic presentation.

Proof or construction:

1. The real quadratic presentation gives two real places, no complex places, and unit rank one. Evaluate a torsion unit at a real embedding: a real root of unity is ±1, and the embedding is injective; hence the torsion is exactly {±1}.
2. Apply the pinned Dirichlet product equivalence, reindex its single free coordinate and identify the torsion coordinate with Z/2. This gives a generator ε and unique expressions ε^a(-1)^b.
3. The pinned norm identity yields εσε=(-1)^s for exactly one s. Thus σε=ε^(-1)(-1)^s, while σ(-1)=-1; multiplying these formulas gives τ_s on all coordinates.
4. Since N(-1)=1 in degree two, a norm-minus-one unit exists exactly when s=1. Use the all-radicand negative Pell comparison.
5. For the converse characterization by τ_1, take the inverse image of (1,0). Its sum with its conjugate is the inverse image of (0,1), namely -1. The conjugation norm formula then gives a unit of norm -1, and the order bridge gives negative Pell. Thus an abstract action comparison is not inferred merely from one choice of normal form.
6. Changing ε to its inverse or to -ε leaves its norm sign unchanged; the coordinate equivalence is existential and requires no canonical choice.

Additional endpoint: `TauCeti.ClassicalArithmetic.CA5.negativePell_iff_quadraticUnitAction_one`.

Acceptance:

- For d=2, ε=1+θ has norm -1 and σ sends the free generator to (-1,1).
- For d=3, ε=2+θ has norm +1 and the parameter is zero.
- For d=5 use ε=(1+θ)/2 in the full ring; choosing only the Pell order generator would miss this full-unit coordinate.
- The torsion coordinate is fixed for every d.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/quadratic-unit-action-model`, `ClassicalArithmeticCompletion:CA.5/negative-pell-full-unit-comparison`, `tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative`, `tauceti:NumberField.ringOfIntegersQuadraticConj`, `tauceti:NumberField.mul_ringOfIntegersQuadraticConj_unit_eq_one_or_neg_one`, `mathlib:NumberField.Units.torsion`.

Source: koymans-pagano-v1, Introduction, p. 3, paragraph giving the unit Galois module. The paper identifies the shear-one unit action when negative Pell is solvable. The shear-zero alternative and the existential coordinate interface are derived here from Dirichlet and the norm identity.

### A rigorous determinant enclosure from entrywise errors

`ClassicalArithmeticCompletion:CA.5/determinant-entrywise-enclosure`

Suggested declaration: `TauCeti.ClassicalArithmetic.CA5.determinant_entrywise_error`.

Let E,Ê be real r×r matrices and B,δ nonnegative reals. If |E_ij|≤B and |Ê_ij-E_ij|≤δ for every i,j, then |det Ê-det E|≤r!·r·δ·(B+δ)^(r-1), with natural subtraction in the exponent. The same bound controls ||det Ê|-|det E||. At r=0 both determinants are one and the error is zero.

Hypotheses: Uniform bound is on the exact entries E, not only on approximate entries; δ and B nonnegative.

Proof or construction:

1. Bound every approximate entry by B+δ using the triangle inequality.
2. For r≥1 and each permutation, telescope the difference of the two products into r terms. Each contains one entry difference bounded by δ and r-1 entries bounded by B+δ.
3. Use the Leibniz determinant formula, the triangle inequality and the r! permutations to sum these bounds.
4. For r=0 use Matrix.det_isEmpty separately. Apply the reverse triangle inequality to the absolute determinants.
5. For a log table use weights 1 at real places and 2 at complex places before applying the bound; errors must refer to the weighted entries.

Acceptance:

- The empty regulator matrix has exact absolute determinant one.
- For r=1 the error bound is δ.
- For r=2, B=2 and δ=1/100, the bound is 4·(1/100)·(201/100)=201/2500.
- A nonrigorous floating-point determinant supplies no δ and does not meet the hypotheses.

Direct suppliers: `mathlib:Matrix.det_apply`, `mathlib:Matrix.det_isEmpty`, `mathlib:NumberField.Units.regOfFamily_eq_det`.

Source: biasse-fieker-classgroup-2014, Section 4.3, printed p. 400, Lemma 4.4 and Proposition 4.5. The paper certifies tentative class number and regulator through rigorous approximations and an index bound below two. The entrywise error estimate and two-sided interval interface below are explicit local refinements, not a quotation of its numerical constants or an analytic bound producer.

### Class-number and regulator certification from rigorous intervals

`ClassicalArithmeticCompletion:CA.5/interval-class-number-regulator-certificate`

Suggested declaration: `TauCeti.ClassicalArithmetic.CA5.relations_units_complete_of_intervals`.

Let φ:Z^N→Additive Cl(K) be surjective; let A be a square integer matrix with nonzero determinant and φ(A_col_j)=0 for all j. Let u be a unit family of size rank K satisfying IsMaxRank. Write h=classNumber K, R=regulator K and R_u=regOfFamily u. Suppose ε,η≥0, |Rhat-R_u|≤ε, |a-hR|≤η, and |det A|·(Rhat+ε)<2(a-η). Then range A=ker φ, the subgroup generated by u and torsion is all units, |det A|=h, and R_u=R. No GRH assumption occurs in this soundness theorem; a producer must justify the stated intervals.

Hypotheses: φ surjective; nonzero determinant; every column is a genuine relation. Maximal-rank units; rigorously valid error intervals; strict inequality.

Proof or construction:

1. The parent determinant contract gives |det A|=h·i, where i=[ker φ:range A] is a positive integer.
2. Pinned regulator positivity and regOfFamily_div_regulator give R_u=R·j, where j is the positive index of the subgroup generated by units and torsion.
3. The interval hypotheses imply R_u≤Rhat+ε and a-η≤hR. Hence hR·ij=|det A|R_u<2hR. Positivity of hR implies ij<2.
4. Positive integers i,j therefore both equal one. Apply relative-index-one and index-one to obtain completeness, and substitute back for the numerical equalities.
5. determinant-entrywise-enclosure supplies ε when Rhat is an absolute determinant of a rigorous weighted log table. An analytic or enumerative producer supplies η independently.

Acceptance:

- Exact intervals ε=η=0 recover the parent joint certificate.
- An index-two relation lattice or an index-two unit family makes the left product at least 2hR and cannot pass.
- Equality at the threshold two is rejected; rounding below two without a rigorous ε is rejected.
- Rank zero uses the empty determinant one and the torsion subgroup as the full unit group; N=0 is allowed only when φ is surjective onto the trivial class group.

Direct suppliers: `ClassicalArithmeticCompletion:CA.5/class-number-divides-relation-determinant`, `ClassicalArithmeticCompletion:CA.5/class-number-regulator-certificate`, `ClassicalArithmeticCompletion:CA.5/determinant-entrywise-enclosure`, `mathlib:NumberField.classNumber_pos`, `mathlib:NumberField.Units.regulator_pos`, `mathlib:NumberField.Units.regOfFamily_pos`, `mathlib:NumberField.Units.regOfFamily_div_regulator`, `mathlib:Subgroup.relIndex_eq_one`, `mathlib:Subgroup.index_eq_one`.

Source: biasse-fieker-classgroup-2014, Section 4.3, printed p. 400, Lemma 4.4 and Proposition 4.5. The paper certifies tentative class number and regulator through rigorous approximations and an index bound below two. The entrywise error estimate and two-sided interval interface below are explicit local refinements, not a quotation of its numerical constants or an analytic bound producer.

## Source scope and remaining process boundary

The source statements above are paraphrases with precise locators. The determinant
entrywise constant and the general square-killed-kernel theorem are local
consequences of the stated library formulas; they are not claimed to be the
paper's exact theorem statements. Biasse–Fieker's analytic lower-bound method is
not imported as an unconditional bound. Its determinant norm convention is not
silently equated with our entrywise B. We use the displayed entrywise telescoping
argument instead.

The Koymans–Pagano source route 7 names items 5,9,12, but its positional acceptance
verdict is absent. This document independently supplies their mathematical
comparisons. It does not accept or edit that source route. A queue owner must
record the verdict through the existing paper workflow. This is an external
process boundary, not an unsupplied mathematical theorem in CA.5.

No source error was established in the passages used here. No uncleared source
was used and no missing source is needed for these targets.

The layer retains the parent's six planets; the new nodes add no extra planets:

- **Class group generated by small primes** — `ClassicalArithmeticCompletion:CA.5/class-group-generated-by-small-primes`.
- **Class group from a relation matrix** — `ClassicalArithmeticCompletion:CA.5/class-group-of-a-relation-matrix`.
- **Class number and regulator certificate** — `ClassicalArithmeticCompletion:CA.5/class-number-regulator-certificate`.
- **Hermite matrix of an ideal** — `ClassicalArithmeticCompletion:CA.5/ideal-hermite-matrix`.
- **Discriminant and index of a sublattice** — `ClassicalArithmeticCompletion:CA.5/discriminant-of-a-sublattice-basis`.
- **Pell solutions as norm-one units** — `ClassicalArithmeticCompletion:CA.5/pell-solutions-are-norm-one-units`.

## Read source inventory

- **STEIN.ANT** — William Stein, [Algebraic Number Theory, a Computational Approach](https://wstein.org/books/ant/ant.pdf). Author PDF dated 14 November 2012; read through public web PDF viewer; no byte checksum claimed. Read 14 October 2026: Section 6.2, Proposition 6.2.6 and Example 6.2.8, printed pp. 73–74: discriminant, index and the quadratic example.
- **belabas-computational-2004** — Karim Belabas, [Topics in computational algebraic number theory](https://www.numdam.org/item/JTNB_2004__16_1_19_0.pdf). Journal de Théorie des Nombres de Bordeaux 16 (2004), 19–63; Numdam scan, read 2026-09-24 Read 14 October 2026: Definition 1.1, printed p. 20; Sections 5.3.1–5.3.2, printed p. 36.
- **biasse-fieker-classgroup-2014** — Jean-François Biasse and Claus Fieker, [Subexponential class group and unit group computation in large degree number fields](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/4387ACB036E3358143A563F196E386CB/S1461157014000345a.pdf/div-class-title-subexponential-class-group-and-unit-group-computation-in-large-degree-number-fields-div.pdf). LMS Journal of Computation and Mathematics 17 (Special issue A) (2014), 385–403, doi:10.1112/S1461157014000345; checksum is of this run’s publisher download. Read 14 October 2026: Section 2, printed p. 386; Section 4.3, printed pp. 398–400, particularly Lemma 4.4 and Proposition 4.5.
- **conrad-classgroups-2026** — Keith Conrad, [Class group calculations by Minkowski bound](https://kconrad.math.uconn.edu/blurbs/gradnumthy/classgpex.pdf). Expository handout, PDF dated 17 September 2026, read 2026-09-24 Read 14 October 2026: Section 1 and Examples 2.1–2.4, pp. 1–3.
- **koymans-pagano-v1** — Peter Koymans and Carlo Pagano, [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1). arXiv:2201.13424v1, 31 January 2022; this version alone is the cited edition. Read 14 October 2026: Introduction, pp. 2–4: canonical two-primary comparison, unit Galois action and the narrow class of (√d).

## Pinned declaration inventory

The actual statements below were read; the blueprint checker also resolves the names in the pinned declaration index. Inherited targets retain their own wider baseline inventory in the parent packet.

| Reference | Module | Supplies |
|---|---|---|
| `mathlib:Algebra.discr` | `Mathlib/RingTheory/Discriminant.lean` | The discriminant of a family, det of the trace matrix. |
| `mathlib:Algebra.discr_of_matrix_mulVec` | `Mathlib/RingTheory/Discriminant.lean` | Change of family by a matrix multiplies the discriminant by the square of its determinant. |
| `mathlib:NumberField.Units.IsMaxRank` | `Mathlib/NumberTheory/NumberField/Units/Regulator.lean` | A family of rank-many units whose logarithmic embeddings are linearly independent. |
| `mathlib:NumberField.Units.regOfFamily_div_regulator` | `Mathlib/NumberTheory/NumberField/Units/Regulator.lean` | regOfFamily u / regulator K = [𝓞_K^× : ⟨u⟩ ⊔ torsion], the index formula for a family of units. |
| `mathlib:NumberField.Units.regulator_pos` | `Mathlib/NumberTheory/NumberField/Units/Regulator.lean` | The regulator is positive. |
| `mathlib:NumberField.Units.torsion` | `Mathlib/NumberTheory/NumberField/Units/Basic.lean` | The torsion subgroup μ_K of the units. |
| `mathlib:NumberField.discr_eq_discr` | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean` | The discriminant of any ℤ-basis of 𝓞_K is discr K. |
| `mathlib:NumberField.exists_ideal_in_class_of_norm_le` | `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | Every ideal class contains a nonzero integral ideal of absolute norm at most the Minkowski bound M K. |
| `mathlib:Pell.IsFundamental.eq_zpow_or_neg_zpow` | `Mathlib/NumberTheory/Pell.lean` | Every solution of x² − dy² = 1 is ± a power of the fundamental one: CA.4's Pell classification target is built, and the negative Pell classification extends it. |
| `mathlib:QuotientGroup.quotientKerEquivOfSurjective` | `Mathlib/GroupTheory/QuotientGroup/Basic.lean` | The first isomorphism theorem for surjective group homomorphisms. |
| `mathlib:RingOfIntegers.exponent_eq_one_iff` | `Mathlib/NumberTheory/NumberField/Ideal/KummerDedekind.lean` | exponent θ = 1 iff ℤ[θ] = 𝓞 K. |
| `mathlib:Subgroup.relIndex_mul_index` | `Mathlib/GroupTheory/Index.lean` | Multiplicativity of the index in a chain H ≤ K. |
| `mathlib:Zsqrtd.lift` | `Mathlib/NumberTheory/Zsqrtd/Basic.lean` | Ring homomorphisms ℤ√d → R correspond to square roots of d in R. |
| `mathlib:Zsqrtd.norm_eq_one_iff` | `Mathlib/NumberTheory/Zsqrtd/Basic.lean` | An element of ℤ√d is a unit iff its norm is ±1. |
| `tauceti:NumberField.NarrowClassGroup.toClassGroup_injective_iff_exists_norm_eq_neg_one` | `TauCeti/NumberTheory/NumberField/Quadratic/Conjugation/NarrowClassGroup.lean` | For an integral generator theta with minimal polynomial X²−d, generating K over Q, and d>0, the narrow-to-ordinary class-group map is injective iff a ring-of-integers unit has rational field norm −1. The real-field hypothesis and quadratic presentation are explicit; conversion to the integer norm and to Z[sqrt(d)] remains the CA.5 comparison. |
| `mathlib:Submodule.natAbs_det_basis_change` | `Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean` | Determinant equals cardinality of integral module quotient for equal-index bases. |
| `mathlib:AddSubgroup.index_eq_natAbs_det` | `Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean` | Integral determinant computes subgroup index. |
| `mathlib:AddSubgroup.relIndex_eq_natAbs_det` | `Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean` | Integral determinant computes relative index. |
| `mathlib:Matrix.range_mulVecLin` | `Mathlib/LinearAlgebra/Matrix/ToLin.lean` | Range of matrix map equals span of its columns. |
| `mathlib:Algebra.leftMulMatrix` | `Mathlib/LinearAlgebra/Matrix/ToLin.lean` | Multiplication matrix in an existing algebra basis. |
| `mathlib:Algebra.leftMulMatrix_mulVec_repr` | `Mathlib/LinearAlgebra/Matrix/ToLin.lean` | Matrix multiplication gives coordinates of a ring product. |
| `mathlib:Ideal.natAbs_det_basis_change` | `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean` | Ideal absolute norm is integral lattice determinant. |
| `mathlib:NumberField.discr_ne_zero` | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean` | Number field discriminant is nonzero. |
| `mathlib:NumberField.classNumber_pos` | `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | Class number is a positive integer. |
| `mathlib:Subgroup.index_eq_one` | `Mathlib/GroupTheory/Index.lean` | Index one characterizes top. |
| `mathlib:Subgroup.relIndex_eq_one` | `Mathlib/GroupTheory/Index.lean` | Relative index one characterizes reverse containment. |
| `mathlib:Subgroup.finiteIndex_iff` | `Mathlib/GroupTheory/Index.lean` | Finite index is equivalent to a nonzero natural index. |
| `mathlib:CommGroup.primaryComponent` | `Mathlib/GroupTheory/Torsion.lean` | Canonical subgroup of elements killed by a power of a specified natural number. |
| `mathlib:CommGroup.mem_primaryComponent` | `Mathlib/GroupTheory/Torsion.lean` | Membership is existence of a prime-power annihilator. |
| `mathlib:Matrix.det_apply` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Leibniz sum over permutations. |
| `mathlib:Matrix.det_isEmpty` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Empty determinant is one. |
| `tauceti:NumberField.unitsMulEquivTorsionProdMultiplicative` | `TauCeti/NumberTheory/NumberField/Units/Dirichlet.lean` | Dirichlet decomposition of all units, including torsion. |
| `tauceti:NumberField.NarrowClassGroup.toClassGroup_surjective` | `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean` | Canonical forgetful map is onto. |
| `tauceti:NumberField.NarrowClassGroup.mkPrincipal_eq_one_iff` | `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean` | Trivial narrow principal class iff a unit multiple is totally positive. |
| `tauceti:NumberField.NarrowClassGroup.sq_eq_one_of_mem_ker_toClassGroup` | `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean` | The forgetful kernel is killed by two. |
| `tauceti:NumberField.mkPrincipal_eq_one_or_eq_mkPrincipal_gen` | `TauCeti/NumberTheory/NumberField/Quadratic/Conjugation/NarrowClassGroup.lean` | In a real quadratic presentation every narrow principal class is one or the class of the generator. |
| `tauceti:NumberField.exists_unit_isTotallyPositive_smul_of_norm_pos` | `TauCeti/NumberTheory/NumberField/Quadratic/Conjugation/InfinitePlace.lean` | An element of positive quadratic norm has a totally positive unit multiple. |
| `tauceti:NumberField.mul_ringOfIntegersQuadraticConj_unit_eq_one_or_neg_one` | `TauCeti/NumberTheory/NumberField/Quadratic/Conjugation/Norm/Basic.lean` | A unit times its conjugate is one or minus one. |
| `tauceti:NumberField.norm_gen_eq_neg_radicand` | `TauCeti/NumberTheory/NumberField/Quadratic/Norm.lean` | Quadratic generator has norm minus its radicand. |
| `tauceti:NumberField.norm_add_mul_gen` | `TauCeti/NumberTheory/NumberField/Quadratic/Norm.lean` | Norm is the quadratic norm form. |
| `tauceti:NumberField.ringOfIntegersQuadraticConj` | `TauCeti/NumberTheory/NumberField/Quadratic/Conjugation/Basic.lean` | Conjugation automorphism of the full ring of integers. |
| `mathlib:ZMod` | `Mathlib/Data/ZMod/Defs.lean` | The existing integers-modulo-n carrier; at n=2 the torsion coordinate. |
| `mathlib:NumberField.Units.regOfFamily_pos` | `Mathlib/NumberTheory/NumberField/Units/Regulator.lean` | A maximal-rank family has positive regulator. |
| `mathlib:NumberField.Units.regOfFamily_eq_det` | `Mathlib/NumberTheory/NumberField/Units/Regulator.lean` | Family regulator is the absolute determinant of weighted logs after deleting one infinite place. |
