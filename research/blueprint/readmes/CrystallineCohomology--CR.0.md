# Crystalline cohomology: divided-power foundations and the Dieudonné prefix

Current packet: **84 nodes, 91 API items, 82 tests, 11 planets, 79 baseline declarations, 10 gaps, 1 request, 0 closed stages**. Exact compilation and source limits are recorded in the handoff.

This part plans the algebra from which crystalline thickenings are built, together
with the inherited beginning of the saturated de Rham–Witt construction. The
immediate algebraic outputs are the generator criterion for divided powers,
gluing on compatible sums of ideals, extension along arbitrary ring maps for a
principal PD ideal, extension along flat algebra maps, and the localization
formula. The augmentation and filtration interfaces use the existing Γ and
PD-ideal carriers. CR.0 has forty declaration nodes over the pinned library. Seven
reviewed declarations in CR.4 are retained with their identifiers, mathematical
content and explicit continuation requirements. The finite quotient section adds
thirty-seven declaration nodes, including eighteen API promotions, with concrete
quotient carriers, level-changing operators, p-torsion control and naturality.

The packet is partial. It does not yet construct the universal PD envelope, the
crystalline site, crystalline derived global sections, or the complete Witt
complex. None of its seven stages is closed. The successful elaboration of the
suggested signatures checks their types and interfaces; it supplies no proofs.
The declaration register below distinguishes the constructed signatures from
mathematical obligations whose complete signatures are still missing.

## Conventions and ownership

A PD ring is a commutative unital ring A, an ideal I and the existing
Mathlib structure DividedPowers I. We use its ambient-ring operation γₙ:A→A.
For x in I, γ₀(x)=1 and γ₁(x)=x; positive operations land in I. Outside I,
every operation is zero, including degree zero. Consequently an equality of
operations on a smaller PD ideal is a restriction statement, not equality of
the total functions on the whole ambient ring. This convention matters in the
gluing APIs and in tests that evaluate degree zero outside the sum ideal.

The multiplication relation is γₘ(x)γₙ(x)=choose(m+n,m)γₘ₊ₙ(x).
The iteration relation is γₘ(γₙ(x))=uniformBell(m,n)γₘₙ(x), with n>0.
The uniform Bell coefficient is the integer (mn)!/(m!(n!)ᵐ), interpreted as an
integer before mapping into A. Division by factorials in A is never used to
define these operations. Rational polynomial rings provide a way to verify
universal integer coefficient identities, and only that role is used in the
generator and substitution arguments.

Ordinary nilpotence of I, nilpotence of its divided powers, nilpotence of p,
p-adic completeness and the PD filtration are separate conditions. In particular,
the canonical operation on the ideal (2) in Z₂ has γ₂(2)=2. Iterating this
operation gives a direct check against an incorrect claim of PD nilpotence.
The scalar-extension construction neither completes a ring nor replaces derived
completion with an ordinary limit.

The accepted RS-01 ownership decision retains CR.0 as owner of ordinary PD
envelopes, the common completed A_cris construction and its coefficient maps.
DerivedDeRhamCohomology:DD.0 owns derived divided powers and the cotangent
complex; DD.1 owns derived completion. AInfCohomology:AI.0:integral supplies the
specified integral Fontaine data, and AI.1 owns generic décalage. The rational
period rings remain in PadicHodgeTheory:R06.1. CohomologyComparisons imports
these constructions and owns the geometric comparison diagrams. Thus constructing
a compatible PD algebra is an input to the period-ring comparisons, not a
second construction of all their coefficients or cohomology theories.

EnhancedDerivedSheaves supplies the generic enhanced sheaf and derived-category
infrastructure. CrystallineCohomology:CR.1 must still construct the actual site
and its coefficients. FiniteFlatGroupsAndIntegralPadicHodgeTheory imports those
crystals for its group-theoretic Dieudonné and Grothendieck–Messing constructions.
The graded Frobenius used in CR.4 is distinct from crystalline Frobenius with its
degree factors and from a bare semilinear vector space.

## What the pinned libraries supply

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The reviewed library coverage contains
no crystalline entries at the working snapshot. The pending-review AUDIT-36
records were read as leads, and every declaration cited here was checked in
its source rather than accepted from its name or the audit verdict.

Mathlib already has DividedPowers, PD morphisms, PD-stable subideals, their
lattice operations, and PD quotient descent. The quotient theorem requires
stability of K∩I under positive divided powers before giving a structure on the
image of I in A/K. It is an exact future input to envelope presentations; the
quotient construction is not a new target here. Equality of two existing PD
structures from their values on generators is also present. What is added is
the construction of a PD structure from a candidate satisfying only the
additive and scalar axioms, with the two missing identities checked on generators.

The carrier DividedPowerAlgebra A M is already the quotient algebra Γ_A(M).
Its degree-indexed generators, linear embedding, weak lift into a supplied PD
target and functorial maps must be reused. The source explicitly lists the
canonical PD structure on its augmentation ideal as unfinished. The weak lift
is an algebra map with prescribed images of generators; it does not establish
that the source carries divided powers or that the map is a PD morphism.
This distinction is the reason the present tranche stops before a full
PD polynomial-algebra or envelope construction.

Tau Ceti's associative divided powers normalize powers by factorials over Q.
Their integral-span applications to enveloping algebras do not supply an
arbitrary torsion-ring PD ideal. The suggested file imports this existing
operation for a rational compatibility test. It also imports the existing
canonical PD ideal in Z_p, including p=2, and uses the existing cochain-complex
carrier over the category of Z-modules for the Dieudonné prefix.

## CR.0: the algebraic construction sequence

The additive candidate is an auxiliary input to a constructor. It is not a
replacement notion of a PD ring. First propagate the multiplication identity
under sums, using the integer Vandermonde identity. Then propagate iteration
under sums, reducing its finite expansion to a universal coefficient identity.
Homogeneity propagates both identities under scalar multiples. Induction on
ideal span therefore fills the two missing fields of the existing PD structure.
This separates the one substantial coefficient calculation from the applications
that need a PD structure.

For gluing, form the antidiagonal convolution of γ on I and ε on J. If two
presentations of z in I+J differ, their discrepancy lies in I∩J. Agreement of
the two systems on that intersection allows its divided powers to pass from
one side of the convolution to the other. This proves independence of the
presentation before a new operation is selected. The generator criterion
then constructs the PD structure, since I∪J generates the sum ideal and the
operations restrict to the original structures on each part. Agreement on the
product IJ is already in the library. It yields a gluing corollary when
I∩J=IJ, but it does not imply agreement on an arbitrary larger intersection.

For scalar extension, uniqueness is independent of flatness: images of I
generate IB, and a base-preserving structure has fixed values on those images.
Existence on a principal ideal follows by expressing every element as bf(x).
The possible ambiguity in b disappears because each positive γₙ(x) belongs
to the same principal ideal. This proves the formula without an injectivity
hypothesis on f and without an inverse for n!.

For a general ideal, a finite expression z=Σbᵢf(xᵢ) produces a candidate value
through the multiset coefficient formula. Substituting a finite scalar matrix
leaves this formula unchanged. Flatness is used at one precise point: the
equational criterion compares two presentations by expressing their coefficient
families in common elements with equal relations over A. The result is a
well-defined additive candidate on IB. The generator criterion then gives
its PD structure. Localization is flat, so its formula follows from the
scalar law and preservation of the base operations.

The full envelope construction needs more than these results. One must give
the augmentation PD structure on Γ, prove its free-module monomial description,
and construct the relative PD polynomial algebra over a fixed PD base.
Only then can the quotient presentation of the envelope be equipped with the
correct PD structure and proved initial. Stacks 60.2 was read to pin those
requirements. Its base-change statements have separate hypotheses: 60.2.6
uses flatness after reduction by I together with Tor₁ vanishing, while 60.2.7
uses a flat map B/I→B′/I′ and the equality J′=JB′+I′. The flat extension theorem
below is not a substitute for either envelope theorem.

## Declaration register

Each identifier is stable. The named API and tests accompany the exact
mathematical statement. A dependency on an integrated node denotes planned
mathematics owned elsewhere, never an implemented theorem.

### Additive divided-power candidates

CrystallineCohomology:CR.0/additive-powers

**Declaration:** TauCeti.PD.AdditivePowers.

For an ideal I⊂A, an additive divided-power candidate consists of maps δₙ:A→A, zero outside I, with δ₀(x)=1 and δ₁(x)=x on I, δₙ(I)⊂I for n>0, δₙ(x+y)=Σᵢ₊ⱼ₌ₙδᵢ(x)δⱼ(y), and δₙ(ax)=aⁿδₙ(x). Multiplication and iteration identities are not assumed. This auxiliary data organizes the generator criterion; a divided power structure remains the existing DividedPowers type.

**Construction or proof.** Collect precisely axioms (1),(3),(4) and ideal membership from Stacks 23.2.4. Use total functions with the same outside-ideal convention as the existing DividedPowers structure.

**Inputs:** mathlib:DividedPowers, mathlib:DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul, tauceti:TauCeti.Associative.dividedPower.

**API.**

- TauCeti.PD.AdditivePowers.ofDividedPowers: Every existing PD structure gives its additive candidate without changing any operation.
- TauCeti.PD.AdditivePowers.ofDividedPowers_dpow: The candidate operation obtained from γ is exactly γₙ on every element, including outside I.
- TauCeti.PD.AdditivePowers.ext: Candidates with equal operations on I coincide.

**Tests.**

- TauCeti.PD.test_candidate_zero_index (degenerate): Degree zero at zero is one.
- TauCeti.PD.test_candidate_positive_at_zero (computation): Degree two at zero is zero.
- TauCeti.PD.test_candidate_rational (compatibility): Over Q, a candidate induced by γ agrees on I with the existing rational associative divided power.

**Source:** stacks-dpa, Lemma 23.2.4 and its proof.

### The multiplication identity is stable under sums

CrystallineCohomology:CR.0/multiplication-addition

**Declaration:** TauCeti.PD.AdditivePowers.mul_at_add.

For an additive candidate δ, suppose the identities δₘ(z)δₙ(z)=choose(m+n,m)δₘ₊ₙ(z) hold for every m,n at each of x,y∈I. They then hold at x+y.

**Construction or proof.** Expand both operations at x+y by the addition law and rearrange the finite four-index sum. Apply the multiplication identity separately at x and y. For fixed exponents a+b=m+n, the resulting coefficient is the Vandermonde sum Σ choose(a,i)choose(b,m−i)=choose(m+n,m). This is an identity of natural integers before casting to A; the source also checks its coefficients in Q[X,Y].

**Inputs:** CrystallineCohomology:CR.0/additive-powers, mathlib:Nat.add_choose_eq.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.2.4 and its proof.

### The iteration identity is stable under sums

CrystallineCohomology:CR.0/iteration-addition

**Declaration:** TauCeti.PD.AdditivePowers.comp_at_add.

For an additive candidate δ satisfying the multiplication identity on all I, suppose δₘ(δₙ(z))=uniformBell(m,n)δₘₙ(z) for all m and n>0 at x,y∈I. It holds at x+y.

**Construction or proof.** Expand δₙ(x+y), then expand δₘ of that finite sum. The positive inner degree ensures every summand is in I. Apply scalar homogeneity to δₖ(δᵢ(x)δⱼ(y)); use iteration at x if i>0 and at y if i=0. Reduce repeated products using the multiplication identity. Collect coefficients of δₐ(x)δᵦ(y), a+b=mn. Verify their universal integer values by the same calculation in Q[X,Y], where these divided monomials are linearly independent. The coefficient is uniformBell(m,n). No injection of A into a rational algebra is assumed.

**Inputs:** CrystallineCohomology:CR.0/additive-powers, CrystallineCohomology:CR.0/multiplication-addition, mathlib:MvPolynomial.basisMonomials, mathlib:DividedPowers.RatAlgebra.dividedPowers.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.2.4 and its proof.

### Divided powers from identities on generators

CrystallineCohomology:CR.0/generator-criterion

**Declaration:** TauCeti.PD.AdditivePowers.toDividedPowers.

Let δ be an additive candidate on I and S⊂A with I=span(S). If multiplication and positive-inner-index iteration hold at every s∈S, construct the existing DividedPowers I with operation δ. No freeness, factorial invertibility, or nilpotence is required.

**Construction or proof.** Propagate multiplication from S to its scalar multiples using homogeneity; use multiplication-addition and induction on ideal span to obtain the identity everywhere. Propagate iteration under scalar multiplication using homogeneity twice. Apply iteration-addition and span induction to obtain the iteration identity on all I. Fill exactly the two missing fields of DividedPowers. The underlying operations are unchanged.

**Inputs:** CrystallineCohomology:CR.0/additive-powers, CrystallineCohomology:CR.0/multiplication-addition, CrystallineCohomology:CR.0/iteration-addition, mathlib:DividedPowers.

**API.**

- TauCeti.PD.AdditivePowers.toDividedPowers_dpow: The result uses δₙ exactly on all A.
- TauCeti.PD.AdditivePowers.toDividedPowers_unique: Every PD structure with these candidate operations equals the constructed structure.
- TauCeti.PD.AdditivePowers.toDividedPowers_generators: Different generating sets and valid identity proofs yield the same structure.

**Tests.**

- TauCeti.PD.test_generators_degree_two (computation): The generated structure has the required quadratic mixed term.
- TauCeti.PD.test_generators_outside (non-example): The constructed total operation at degree zero outside I is zero, not one.
- TauCeti.PD.test_generators_inner_one (compatibility): Iteration with inner index one gives back the unchanged operation.

**Source:** stacks-dpa, Lemma 23.2.4 and its proof.

### Convolution of two divided-power systems

CrystallineCohomology:CR.0/sum-convolution

**Declaration:** TauCeti.PD.convolution.

For γ on I and ε on J define Cₙ(x,y)=Σᵢ₊ⱼ₌ₙγᵢ(x)εⱼ(y). Its gluing interpretation uses x∈I and y∈J; outside these domains it is simply the displayed total function.

**Construction or proof.** Use the finite antidiagonal sum in A. Record the quadratic mixed term x y explicitly; there is no binomial coefficient on it.

**Inputs:** mathlib:DividedPowers.

**API.**

- TauCeti.PD.convolution_eq: C is the antidiagonal sum of the two systems.
- TauCeti.PD.convolution_swap: Exchanging the two ideals and elements leaves C unchanged.
- TauCeti.PD.convolution_mem: For n>0, Cₙ(x,y) lies in I+J when x∈I and y∈J.

**Tests.**

- TauCeti.PD.test_convolution_zero (degenerate): C₀(0,0)=1.
- TauCeti.PD.test_convolution_quadratic (computation): C₂(x,y)=γ₂(x)+xy+ε₂(y).
- TauCeti.PD.test_convolution_same (compatibility): For a single PD structure Cₙ(x,y)=γₙ(x+y).

**Source:** stacks-dpa, Lemma 23.2.5 and its proof.

### Convolution is independent of the decomposition

CrystallineCohomology:CR.0/sum-independence

**Declaration:** TauCeti.PD.convolution_independent.

If γₙ(w)=εₙ(w) for every n and w∈I∩J, then Cₙ(x,y)=Cₙ(x′,y′) whenever x,x′∈I, y,y′∈J and x+y=x′+y′.

**Construction or proof.** Set w=x−x′=y′−y in I∩J. Expand γᵢ(x′+w), replace γₗ(w) by εₗ(w), and regroup the finite three-index sum as εⱼ(y+w). This proves equality in A, without assuming I∩J=IJ.

**Inputs:** CrystallineCohomology:CR.0/sum-convolution, mathlib:DividedPowers.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.2.5 and its proof.

### The candidate on the sum of compatible ideals

CrystallineCohomology:CR.0/sum-candidate

**Declaration:** TauCeti.PD.supCandidate.

Assume γ and ε agree on I∩J. Define an additive candidate on I+J by δₙ(z)=Cₙ(x,y) for any decomposition z=x+y with x∈I,y∈J, and zero outside I+J.

**Construction or proof.** Use membership in I+J to choose a decomposition; sum-independence removes the choice. Membership and degrees zero/one follow termwise. For homogeneity choose ax,ay as the decomposition of az. For addition choose (x+x′)+(y+y′), expand both factors and reindex the finite four-index sum; this gives the candidate addition law.

**Inputs:** CrystallineCohomology:CR.0/additive-powers, CrystallineCohomology:CR.0/sum-convolution, CrystallineCohomology:CR.0/sum-independence.

**API.**

- TauCeti.PD.supCandidate_dpow_add: On x+y the candidate is Cₙ(x,y).
- TauCeti.PD.supCandidate_left: The candidate restricts to γ on I.
- TauCeti.PD.supCandidate_right: The candidate restricts to ε on J.

**Tests.**

- TauCeti.PD.test_supCandidate_zero (degenerate): At zero and degree zero, the sum candidate is one.
- TauCeti.PD.test_supCandidate_mixed (computation): The quadratic sum candidate retains the mixed product.
- TauCeti.PD.test_supCandidate_outside (non-example): Degree zero outside the sum ideal is zero.

**Source:** stacks-dpa, Lemma 23.2.5 and its proof.

### The sum candidate extends both structures

CrystallineCohomology:CR.0/sum-restrictions

**Declaration:** TauCeti.PD.supCandidate_restrict.

The sum candidate agrees with γ on I and with ε on J, in every degree.

**Construction or proof.** Choose x=x+0 or y=0+y and use the positive-degree vanishing at zero. For degree zero use γ₀(0)=ε₀(0)=1. This lemma promotes the restriction APIs because the generator criterion consumes them.

**Inputs:** CrystallineCohomology:CR.0/sum-candidate, CrystallineCohomology:CR.0/sum-convolution, mathlib:DividedPowers.dpow_eval_zero.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.2.5 and its proof.

### Divided powers on a compatible sum of ideals

CrystallineCohomology:CR.0/compatible-sum

**Declaration:** TauCeti.PD.sup.

For PD structures γ on I and ε on J that agree on I∩J, construct the unique PD structure on I+J restricting to both.

**Construction or proof.** Apply the generator criterion to the sum candidate and generating set I∪J. Use sum-restrictions to transfer multiplication and iteration from γ or ε to each generator. For iteration, the inner positive divided power stays in the corresponding ideal. Retain the existing ideal supremum and DividedPowers carrier; no new PD-ideal lattice is constructed.

**Inputs:** CrystallineCohomology:CR.0/generator-criterion, CrystallineCohomology:CR.0/sum-candidate, CrystallineCohomology:CR.0/sum-restrictions, mathlib:DividedPowers.dpow_eq_from_gens.

**API.**

- TauCeti.PD.sup_dpow_add: The glued operation is the convolution on x+y.
- TauCeti.PD.sup_left: The identity ring map from (A,I,γ) to the glued PD ring is a PD morphism.
- TauCeti.PD.sup_right: The identity ring map from (A,J,ε) to the glued PD ring is a PD morphism.

**Tests.**

- TauCeti.PD.test_sup_same (compatibility): Gluing γ to itself returns the same operations.
- TauCeti.PD.test_sup_zero_ideal (degenerate): Gluing with the zero PD ideal returns γ on its domain.
- TauCeti.PD.test_sup_quadratic (computation): The glued degree-two formula contains xy with coefficient one.

**Source:** stacks-dpa, Lemma 23.2.5 and its proof.

### The universal property of compatible gluing

CrystallineCohomology:CR.0/sum-universal-property

**Declaration:** TauCeti.PD.sup_exists_unique_iff.

A PD structure θ on I+J restricts to both γ and ε exactly when its operations equal those of the glued structure. Existence of such θ is equivalent to agreement of γ and ε on I∩J.

**Construction or proof.** Necessity is equality of the two restrictions at every element of the intersection. Sufficiency is compatible-sum. For uniqueness, the addition law evaluates θₙ(x+y) as Cₙ(x,y), which also computes the glued operation; use DividedPowers.ext.

**Inputs:** CrystallineCohomology:CR.0/compatible-sum, CrystallineCohomology:CR.0/sum-convolution, mathlib:DividedPowers.ext.

**Acceptance:** If I=J, existence forces equality of γ and ε; arbitrary structures cannot be glued without the intersection condition.

**Source:** stacks-dpa, Lemma 23.2.5 and its proof.

### Gluing when intersection equals product

CrystallineCohomology:CR.0/product-intersection-gluing

**Declaration:** TauCeti.PD.sup_exists_unique_of_inf_eq_mul.

If I∩J=IJ, any two PD structures on I and J glue uniquely. Their agreement on IJ is already the pinned coincide_on_smul theorem, not new mathematics.

**Construction or proof.** Rewrite the intersection as the ideal product. Apply the existing coincidence theorem and the compatible-sum universal property.

**Inputs:** CrystallineCohomology:CR.0/sum-universal-property, mathlib:DividedPowers.coincide_on_smul.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.2.5 and its proof.

### Uniqueness of extension to the generated ideal

CrystallineCohomology:CR.0/extension-uniqueness

**Declaration:** TauCeti.PD.extension_unique.

Let f:A→B and let θ,θ′ be PD structures on IB=I.map(f). If f is a PD morphism from γ to both, then θ=θ′. No flatness or injectivity of f is needed.

**Construction or proof.** The image of I generates IB as a B-ideal. Both systems agree on f(x) for x∈I by their PD-morphism hypotheses. Apply the pinned dpow_eq_from_gens. This is the uniqueness interface used by the construction-specific tests.

**Inputs:** mathlib:DividedPowers.dpow_eq_from_gens, mathlib:DividedPowers.IsDPMorphism.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### The principal extension formula is well defined

CrystallineCohomology:CR.0/principal-independence

**Declaration:** TauCeti.PD.principal_independent.

If I=(x), γ is a PD structure on I and f:A→B, then bⁿf(γₙ(x))=cⁿf(γₙ(x)) whenever bf(x)=cf(x), for all n≥0.

**Construction or proof.** At n=0 both expressions equal one. For n>0, γₙ(x) lies in (x); write γₙ(x)=a x. The hypothesis says (b−c)f(x)=0. The polynomial bⁿ−cⁿ is divisible by b−c. Multiplying by f(a)f(x) proves the claimed equality. This argument uses principal membership rather than division by n!, and applies even when f has a kernel.

**Inputs:** mathlib:DividedPowers.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### Extension of divided powers on a principal ideal

CrystallineCohomology:CR.0/principal-extension

**Declaration:** TauCeti.PD.extendPrincipal.

For I=(x) and any ring map f:A→B, construct γᴮ on IB by γᴮₙ(bf(x))=bⁿf(γₙ(x)), zero outside IB. It is the unique extension of γ; no flatness hypothesis is imposed.

**Construction or proof.** Every element of IB is bf(x); use principal-independence to descend the displayed formula. For addition expand (b+c)ⁿ and use the multiplication identity for γ at x. Degrees zero/one, ideal membership, scalar homogeneity and multiplication follow directly. For iteration with n>0 write γₙ(x)=a x. Then γᴮₘ(γᴮₙ(bf(x)))=bⁿᵐ f(aᵐγₘ(x)); apply homogeneity and the source iteration identity to a x. For any y∈I write y=a x to verify the PD-morphism condition for f. Uniqueness is extension-uniqueness.

**Inputs:** CrystallineCohomology:CR.0/principal-independence, CrystallineCohomology:CR.0/extension-uniqueness, mathlib:DividedPowers, mathlib:PadicInt.dividedPowers.

**API.**

- TauCeti.PD.extendPrincipal_dpow: The defining scalar formula holds for every b and every n.
- TauCeti.PD.extendPrincipal_isDPMorphism: The base map f preserves γ.
- TauCeti.PD.extendPrincipal_generator_independent: The result does not depend on a chosen principal generator.

**Tests.**

- TauCeti.PD.test_principal_identity (compatibility): Extension along the identity has the original operation on I.
- TauCeti.PD.test_principal_zero (degenerate): Extending the zero ideal gives the existing zero divided powers on its image.
- TauCeti.PD.test_principal_quadratic (computation): The degree-two value on bf(x) scales by b².
- TauCeti.PD.test_principal_p_two (non-example): For the canonical PD ideal (2) in Z₂, identity extension satisfies γ₂(2)=2, so ordinary or PD nilpotence must not be inferred.

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### The scalar-extension coefficient formula

CrystallineCohomology:CR.0/extension-coefficient

**Declaration:** TauCeti.PD.extensionCoefficient.

For f:A→B, γ on I, a finite list x₁,…,xᵣ in A and coefficients bᵢ∈B, define Eₙ(b,x)=Σₑ₁₊⋯₊ₑᵣ₌ₙ ∏ᵢ bᵢᵉⁱ f(γₑⁱ(xᵢ)). It is a total finite formula. Its PD interpretation assumes every xᵢ∈I. For r=0 it is one at n=0 and zero otherwise.

**Construction or proof.** Represent multiindices of total weight n by multisets of cardinality n on Fin r; their multiplicities are the exponents. Take the finite product in B and sum over these multisets. Each multiindex appears exactly once; there is no multinomial coefficient.

**Inputs:** mathlib:DividedPowers.dpow_sum.

**API.**

- TauCeti.PD.extensionCoefficient_eq: Eₙ is the multiset-indexed finite sum without multinomial coefficients.
- TauCeti.PD.extensionCoefficient_one: For a singleton family Eₙ=bⁿf(γₙ(x)).
- TauCeti.PD.extensionCoefficient_mem: For n>0 and xᵢ∈I the coefficient lies in IB.

**Tests.**

- TauCeti.PD.test_coefficient_empty_zero (degenerate): The empty family in degree zero contributes one.
- TauCeti.PD.test_coefficient_empty_positive (degenerate): The empty family in degree one contributes zero.
- TauCeti.PD.test_coefficient_quadratic (computation): For two elements, E₂=b₀²fγ₂(x₀)+b₀b₁f(x₀x₁)+b₁²fγ₂(x₁).

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### Invariance under a finite scalar substitution

CrystallineCohomology:CR.0/coefficient-substitution

**Declaration:** TauCeti.PD.extensionCoefficient_substitution.

Let aᵢⱼ∈A, cⱼ∈B and xᵢ∈I. Put bᵢ=Σⱼf(aᵢⱼ)cⱼ and yⱼ=Σᵢaᵢⱼxᵢ. Then Eₙ(b,x)=Eₙ(c,y) for every n, without a flatness assumption.

**Construction or proof.** Expand γₖ(yⱼ) with the existing finite-sum and scalar identities. Expand each power of bᵢ using the ordinary multinomial theorem. Index both expressions by matrices of nonnegative integers with total sum n. Reduce repeated products of divided powers at each xᵢ with the existing multiplication formula. For every exponent matrix the coefficients agree as integers; equivalently compare these same universal coefficient expressions in the rational polynomial ring in formal xᵢ,cⱼ,aᵢⱼ. This is a coefficient identity and does not rationalize A or B.

**Inputs:** CrystallineCohomology:CR.0/extension-coefficient, mathlib:DividedPowers.dpow_sum, mathlib:DividedPowers.prod_dpow, mathlib:MvPolynomial.basisMonomials.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### Independence of the expression over a flat algebra

CrystallineCohomology:CR.0/flat-presentation-independence

**Declaration:** TauCeti.PD.extensionCoefficient_independent.

For a flat A-algebra B and xᵢ,x′ⱼ∈I, equality Σbᵢxᵢ=Σb′ⱼx′ⱼ in B implies Eₙ(b,x)=Eₙ(b′,x′) for every n.

**Construction or proof.** Apply the pinned equational criterion to the combined relation with coefficients xᵢ and −x′ⱼ, and module elements bᵢ and b′ⱼ. It expresses both coefficient families in common elements cₖ with matrices aᵢₖ,a′ⱼₖ. For each k the relation gives Σaᵢₖxᵢ=Σa′ⱼₖx′ⱼ inside A. These common elements lie in I. Apply coefficient-substitution to both sides. They become the same coefficient formula on the common list. There is no assumption that I is finitely generated, nor any invocation of a derived completion.

**Inputs:** CrystallineCohomology:CR.0/coefficient-substitution, mathlib:Module.Flat.isTrivialRelation_of_sum_smul_eq_zero.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### The additive candidate on a flat extension

CrystallineCohomology:CR.0/flat-candidate

**Declaration:** TauCeti.PD.flatCandidate.

For B flat over A, define the candidate on IB by δₙ(z)=Eₙ(b,x) for any finite presentation z=Σbᵢxᵢ with xᵢ∈I; set it to zero outside IB.

**Construction or proof.** Membership in the generated ideal supplies a finite presentation. Flat-presentation-independence proves choice independence. At n=0, every γ₀(xᵢ)=1 so the sole zero-weight multiindex gives one. At n=1 the coefficient is z; positive coefficients lie in IB. Concatenate two presentations to prove addition: splitting a multiset between the two disjoint finite index sets gives the antidiagonal sum. For homogeneity multiply each bᵢ by a; total weight n gives the factor aⁿ.

**Inputs:** CrystallineCohomology:CR.0/additive-powers, CrystallineCohomology:CR.0/extension-coefficient, CrystallineCohomology:CR.0/flat-presentation-independence.

**API.**

- TauCeti.PD.flatCandidate_formula: On every finite expression, the candidate is Eₙ.
- TauCeti.PD.flatCandidate_base: The candidate restricts to the original divided powers along A→B.
- TauCeti.PD.flatCandidate_outside: Outside IB, every operation is zero.

**Tests.**

- TauCeti.PD.test_flatCandidate_zero (degenerate): Degree zero at zero is one.
- TauCeti.PD.test_flatCandidate_scalar (computation): A single scalar multiple has the expected nth-power coefficient.
- TauCeti.PD.test_flatCandidate_quadratic (computation): The quadratic formula includes the mixed product after base change.

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### The flat candidate preserves the base operations

CrystallineCohomology:CR.0/flat-candidate-base

**Declaration:** TauCeti.PD.flatCandidate_base_identity.

For x∈I and every n, the flat candidate has δₙ(f(x))=f(γₙ(x)). In particular multiplication and iteration hold on the generating subset f(I) of IB.

**Construction or proof.** Use the singleton presentation f(x)=1·f(x) in the flat-candidate formula. For multiplication apply f to the corresponding γ identity. For iteration with positive inner degree, γₙ(x) is again in I so apply the formula twice.

**Inputs:** CrystallineCohomology:CR.0/flat-candidate, CrystallineCohomology:CR.0/extension-coefficient, mathlib:DividedPowers.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### Flat extension of divided powers

CrystallineCohomology:CR.0/flat-extension

**Declaration:** TauCeti.PD.extendFlat.

If B is a flat A-algebra, construct the unique PD structure γᴮ on IB for which A→B is a PD morphism. Its operation on a finite expression is Eₙ(b,x). This extends a specified γ, and does not assert an envelope base-change theorem.

**Construction or proof.** The image of I generates IB. Apply the generator criterion to the flat candidate using this generating set. Flat-candidate-base transfers the multiplication and iteration identities on generators from γ. Apply extension-uniqueness to identify all possible extensions.

**Inputs:** CrystallineCohomology:CR.0/generator-criterion, CrystallineCohomology:CR.0/flat-candidate, CrystallineCohomology:CR.0/flat-candidate-base, CrystallineCohomology:CR.0/extension-uniqueness, mathlib:DividedPowers.IsDPMorphism.

**API.**

- TauCeti.PD.extendFlat_formula: The flat extension evaluates to Eₙ on every finite presentation.
- TauCeti.PD.extendFlat_isDPMorphism: The base map is a morphism of the specified PD structures.
- TauCeti.PD.extendFlat_unique: Any PD structure on IB preserved by the base map equals this extension.

**Tests.**

- TauCeti.PD.test_flat_identity (compatibility): Identity extension agrees with γ at every element.
- TauCeti.PD.test_flat_principal (compatibility): On a principal ideal the flat and principal constructions agree.
- TauCeti.PD.test_flat_quadratic (computation): A linear combination of two base elements retains its cross term.

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### The base map preserves flatly extended divided powers

CrystallineCohomology:CR.0/flat-extension-map

**Declaration:** TauCeti.PD.extendFlat_base_map.

The algebra map A→B is a PD morphism from (I,γ) to (IB,γᴮ). Consequently it evaluates γᴮₙ on every base image in all degrees.

**Construction or proof.** The extended ideal condition is equality by definition. Use flat-candidate-base and the unchanged-operation API of the generator criterion. This promotes the base-map API for downstream localization.

**Inputs:** CrystallineCohomology:CR.0/flat-extension, CrystallineCohomology:CR.0/flat-candidate-base, CrystallineCohomology:CR.0/generator-criterion.

**Acceptance:** Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### Divided powers after localization

CrystallineCohomology:CR.0/localization-formula

**Declaration:** TauCeti.PD.localization_dpow.

Let S⊂A be multiplicative, B=S⁻¹A and γ on I. The unique extension to IB exists by flatness, and γᴮₙ(x/s)=γₙ(x)/sⁿ for x∈I, s∈S, n≥0. This asserts localization of the PD structure, not localization of an unconstructed envelope.

**Construction or proof.** Use the pinned theorem that localization is flat to apply flat-extension. Write x/s=(1/s)f(x). Apply scalar homogeneity and flat-extension-map. The displayed denominator is sⁿ, including denominator one in degree zero.

**Inputs:** CrystallineCohomology:CR.0/flat-extension, CrystallineCohomology:CR.0/flat-extension-map, mathlib:IsLocalization.flat, mathlib:DividedPowers, mathlib:IsLocalization.mk'.

**Acceptance:** Check n=0 at x=0 and s=1; check agreement with the principal construction when I is principal. No envelope base-change assertion is inferred: its additional flatness and Tor hypotheses remain a separate source obligation.

**Source:** stacks-dpa, Lemma 23.4.2 and its proof.

### Dieudonné complexes

CrystallineCohomology:CR.4/dieudonne-complex

**Declaration:** TauCeti.Crystalline.DieudonneComplex.

A Dieudonné complex is a cochain complex of abelian groups (M*,d) with a map of graded abelian groups F:M*→M* satisfying dF(x)=pF(dx); morphisms commute with d and F. For a p-torsion-free complex, (η_p M)^n={x∈p^nM^n : dx∈p^{n+1}M^{n+1}} is a subcomplex of M*[p^{-1}] (Construction 2.1.3; for complexes in nonnegative degrees η_pM⊆M, footnote 1). For termwise p-torsion-free M, a Dieudonné structure F is equivalent to a map of cochain complexes α_F:M*→(η_pM)*, α_F(x)=p^nF(x) for x∈M^n, with inverse F(x)=p^{-n}α(x).

p is a prime, fixed throughout the source (BLM lines 237 and 463: 'a prime p which is implicitly fixed throughout the sequel'). Termwise p-torsion-freeness is required for the equivalence with the décalage description, not for the definition of a Dieudonné complex.

The concrete core is typed on the pinned cochain-complex carrier; the eta dictionary or categorical consequences in the inherited aggregate still require refinement.

**Construction or proof.** Use dF=pFd to check that p^nF lands in the η_p submodule and commutes with the differentials. Conversely divide α(x) by p^n inside the localization; membership in η_p makes the result an element of M. Check the two constructions are inverse and preserve morphisms.

**Inputs:** AInfCohomology:AI.1/ideal-decalage-complex, mathlib:CochainComplex, mathlib:ModuleCat.

**API.**

- TauCeti.Crystalline.DieudonneComplex.F_zero: F is zero preserving in every degree.
- TauCeti.Crystalline.DieudonneComplex.F_add: F is additive in every degree.
- TauCeti.Crystalline.DieudonneComplex.d_F: The relation is dF=pFd, including negative cochain degrees.

**Tests.**

- TauCeti.Crystalline.test_dieudonne_zero (degenerate): There is a Dieudonné complex with every group zero.
- TauCeti.Crystalline.test_dieudonne_degree_zero (computation): Z concentrated in degree zero permits any Frobenius multiplication a.
- TauCeti.Crystalline.test_dieudonne_not_chain (non-example): For p=2 there is a Dieudonné complex with dF≠Fd: Z→Z with d=id, F₀=2 and F₁=1.

**Source:** blm-derhamwitt, Definition 2.1.1, Construction 2.1.3 and Remark 2.1.4, pp.13–14; extracted lines 517–549.

### Saturated Frobenius

CrystallineCohomology:CR.4/saturated-frobenius

**Declaration:** TauCeti.Crystalline.IsSaturated.

A Dieudonné complex is saturated when it is termwise p-torsion-free and F:M^n→{x∈M^n:dx∈pM^{n+1}} is bijective in every degree. Equivalently, α_F:M→η_p M is an isomorphism.

A Dieudonné complex; saturation includes p-torsion-freeness.

The concrete core is typed on the pinned cochain-complex carrier; the eta dictionary or categorical consequences in the inherited aggregate still require refinement.

**Construction or proof.** Identify p^n times the target of F with (η_p M)^n. Use the established α_F dictionary to transport bijectivity to a chain isomorphism.

**Inputs:** CrystallineCohomology:CR.4/dieudonne-complex.

**API.**

- TauCeti.Crystalline.IsSaturated.p_injective: Multiplication by p is injective in every degree.
- TauCeti.Crystalline.IsSaturated.F_injective: The graded Frobenius is injective.
- TauCeti.Crystalline.IsSaturated.F_range: The image of F in degree n consists exactly of elements whose differential is p-divisible.

**Tests.**

- TauCeti.Crystalline.test_saturated_zero (degenerate): Every complex whose groups are zero is saturated.
- TauCeti.Crystalline.test_saturated_zero_d (characterisation): For zero differential and termwise p-torsionfree groups, saturation is equivalent to bijectivity of F.
- TauCeti.Crystalline.test_saturated_multiplication_two (non-example): The degree-zero group Z with F=2 is not saturated at p=2.

**Source:** blm-derhamwitt, Definition 2.2.1 and Remark 2.2.2, p.14; extracted lines 555–565.

### Verschiebung and the differential

CrystallineCohomology:CR.4/verschiebung-identities

**Declaration:** TauCeti.Crystalline.verschiebung.

On a saturated Dieudonné complex define V uniquely by F(Vx)=px. It is injective and satisfies FV=VF=p, FdV=d and Vd=p dV.

The complex is saturated; in particular F is injective and M is p-torsion-free.

The concrete core is typed on the pinned cochain-complex carrier; the eta dictionary or categorical consequences in the inherited aggregate still require refinement.

**Construction or proof.** Since d(px) belongs to pM, saturation puts px in the image of F; injectivity gives existence and uniqueness of V. FV=p implies injectivity of V. Precompose with F and cancel F to obtain VF=p. Combine dF=pFd and FV=p, cancel p, and then postcompose with V to obtain the differential identities.

**Inputs:** CrystallineCohomology:CR.4/saturated-frobenius.

**API.**

- TauCeti.Crystalline.verschiebung_FV: F(Vx)=px in every degree.
- TauCeti.Crystalline.verschiebung_VF: V(Fx)=px in every degree.
- TauCeti.Crystalline.verschiebung_d: Vd=p dV; V is not assumed to be a chain map.
- TauCeti.Crystalline.verschiebung_FdV: FdV=d in each degree.
- TauCeti.Crystalline.verschiebung_injective: V is injective in each degree.

**Tests.**

- TauCeti.Crystalline.test_V_zero (degenerate): V(0)=0.
- TauCeti.Crystalline.test_V_F_identity (computation): If F is identity in a degree, V is multiplication by p there.
- TauCeti.Crystalline.test_V_F_p (computation): If F is multiplication by p in a degree, V is identity there; e.g. a rational degree-zero group.

**Source:** blm-derhamwitt, Remark 2.2.3 and Proposition 2.2.4 with proof, p.14; extracted lines 566–581.

### Iterated Frobenius divisibility

CrystallineCohomology:CR.4/iterated-frobenius-divisibility

**Declaration:** TauCeti.Crystalline.iteratedF_range.

For a saturated Dieudonné complex and every r≥0, F^r identifies M^n with {x∈M^n:dx∈p^rM^{n+1}}. Consequently every cocycle belongs to the image of every iterate F^r.

The complex is saturated.

The concrete core is typed on the pinned cochain-complex carrier; the eta dictionary or categorical consequences in the inherited aggregate still require refinement.

**Construction or proof.** The forward inclusion follows from dF^r=p^rF^rd. For dx=p^r y with r>0, p-torsion-freeness gives dy=0. Write x=F(x′) and y=F(y′) by saturation, cancel pF to obtain dx′=p^{r−1}y′, and apply induction.

**Inputs:** CrystallineCohomology:CR.4/saturated-frobenius.

**Acceptance:** Check r=0 and r=1 explicitly. Apply the result to a cocycle to obtain infinite F-divisibility without asserting compatible choices beyond the unique lifts.

**Source:** blm-derhamwitt, Proposition 2.2.5 and Remark 2.2.6, p.15; extracted lines 583–599.

### Saturation by iterated décalage

CrystallineCohomology:CR.4/saturation-colimit

**Declaration:** TauCeti.Crystalline.Saturation.

Every Dieudonné complex M* admits a saturation M*→Sat(M*): a map to a saturated complex through which every map to a saturated complex factors uniquely. First quotient by the graded subgroup T* of elements killed by a power of p; on the p-torsion-free quotient take the direct limit of the sequence M*→(η_pM)*→(η_pη_pM)*→⋯ whose transition maps are α_F, η_p(α_F), η_p(η_p(α_F)),… (display (8)). Saturation is left adjoint to the inclusion DC_sat↪DC.

A Dieudonné complex; no initial saturation or p-torsion-freeness assumption.

No replacement carrier or opaque proposition is introduced. The coherent eta, quotient, saturation and limit interfaces must be prototyped before these signatures can be supplied.

**Construction or proof.** Reduce to the p-torsion-free case by replacing M* by M*/T*; the source states this reduction without detail (p.15, lines 613–615). The elementary checks behind it are that T* is stable under d and F, that M*/T* is p-torsion-free, and that every map to a saturated (hence p-torsion-free) complex kills T*. On the torsion-free quotient construct the η_p iteration. Use commutation of η_p with filtered colimits to make the induced α_F invertible on the colimit. The source asserts that the direct limit 'is a saturation of M*' (line 621) without further detail; the universal property is the check that a map to a saturated target extends uniquely at each η_p stage and that the compatible colimit map is unique.

**Inputs:** CrystallineCohomology:CR.4/saturated-frobenius, AInfCohomology:AI.1.

**API.**

- TauCeti.Crystalline.Saturation.unit: The canonical morphism M→Sat(M) commutes with d and F.
- TauCeti.Crystalline.Saturation.lift: For every saturated K, composition with the unit bijects Hom(Sat(M),K) with Hom(M,K).
- TauCeti.Crystalline.Saturation.idempotent: The unit is an isomorphism when M is saturated; hence saturation is idempotent.

**Tests.**

- TauCeti.Crystalline.test_saturation_Z_identity (compatibility): The degree-zero complex Z with F=id is already saturated at each prime p, so its saturation unit is an isomorphism.
- TauCeti.Crystalline.test_saturation_p_torsion (degenerate): The degree-zero group Z/p with F=0 has zero saturation because every map to a p-torsionfree group kills it.
- TauCeti.Crystalline.test_saturation_invert_p (computation): For Z in degree zero with F multiplication by p, saturation is Z[1/p] in degree zero with the same Frobenius.

**Source:** blm-derhamwitt, Proposition 2.3.1 and Corollary 2.3.2, p.15; extracted lines 600–623.

### Cartier criterion for saturation

CrystallineCohomology:CR.4/cartier-saturation-mod-p

**Declaration:** TauCeti.Crystalline.cartier_saturation_mod_p.

If M is a termwise p-torsion-free Dieudonné complex and F induces an isomorphism of graded groups M/p→H*(M/p), then M/p→Sat(M)/p is a quasi-isomorphism.

M has Cartier type as defined in BLM 2.4.1; saturation alone does not imply this hypothesis.

No replacement carrier or opaque proposition is introduced. The coherent eta, quotient, saturation and limit interfaces must be prototyped before these signatures can be supplied.

**Construction or proof.** Use the generic Bockstein comparison (η_pM)/p≃(H*(M/p),β). A map that is a quasi-isomorphism modulo p stays so after η_p: it induces an isomorphism on the Bockstein complexes. Factor the Cartier map through α_F:M/p→(η_pM)/p; the Bockstein comparison and two-out-of-three make α_F a quasi-isomorphism. Apply η_p repeatedly and pass to the filtered colimit describing saturation. Passing from the stages (η_p^k M)/p to Sat(M)/p uses that cohomology and reduction modulo p commute with filtered colimits; this is not stated in the source.

**Inputs:** CrystallineCohomology:CR.4/saturation-colimit, AInfCohomology:AI.1/bockstein-reduction.

**Acceptance:** Verify the triangle with F and the Bockstein comparison commutes. Keep Cartier type separate from saturation; the source warns the saturation itself is generally not Cartier type.

**Source:** blm-derhamwitt, Definition 2.4.1, Proposition 2.4.5, Corollary 2.4.6 and proof of Theorem 2.4.2, pp.16–18; extracted lines 661–764.

### The de Rham–Witt completion tower

CrystallineCohomology:CR.4/verschiebung-completion-tower

**Declaration:** TauCeti.Crystalline.Completion.

For saturated M* form W_r(M)*=M*/(im V^r+im dV^r) for r≥0 (W_0(M)*=0), the restriction maps Res:W_{r+1}(M)*→W_r(M)*, and the completion W(M)*=lim_r W_r(M)*. F descends to F:W_r(M)*→W_{r−1}(M)* and V to V:W_r(M)*→W_{r+1}(M)*; passing to the limit makes W(M)* a Dieudonné complex, the construction is functorial, and the tautological map ρ_M:M*→W(M)* is a map of Dieudonné complexes (Remark 2.5.3).

M is saturated; r≥0 and W_0(M)=0.

No replacement carrier or opaque proposition is introduced. The coherent eta, quotient, saturation and limit interfaces must be prototyped before these signatures can be supplied.

**Construction or proof.** The denominator is a subcomplex because d²=0. Use FdV=d and FV=p to show F lowers the level. Use Vd=p dV to show V raises the level. Pass the compatible graded maps and the differential to the inverse limit; check naturality under maps of saturated complexes.

**Inputs:** CrystallineCohomology:CR.4/verschiebung-identities.

**API.**

- TauCeti.Crystalline.Completion.restriction: The quotient map W_{r+1}M→W_rM commutes with d and has the specified composite law.
- TauCeti.Crystalline.Completion.F: F descends from W_{r+1}M to W_rM; on the inverse limit it satisfies dF=pFd.
- TauCeti.Crystalline.Completion.V: V descends from W_rM to W_{r+1}M with its existing differential relation.
- TauCeti.Crystalline.Completion.unit: The natural map ρ:M→lim_r W_rM is a morphism of Dieudonné complexes.

**Tests.**

- TauCeti.Crystalline.test_completion_W0 (degenerate): W₀M is the zero complex, since V⁰ is identity.
- TauCeti.Crystalline.test_completion_Z (computation): For M=Z in degree zero with F=id, V=p, W_rM=Z/p^r and W(M)=Z_p.
- TauCeti.Crystalline.test_completion_rational (non-example): For M=Q in degree zero with F=id, V=p is bijective, all W_rM vanish and the completion is zero.

**Source:** blm-derhamwitt, Construction 2.5.1 and Remarks 2.5.2–2.5.3, pp.19–20; extracted lines 767–828.

## CR.0: augmentation on the existing algebra

The following nine declarations retain Mathlib’s Γ_R(M) carrier. Stacks §23.5
states the augmentation in the free-module case; the arbitrary-module form
here follows directly from the pinned presentation and weak lift. The proof
uses no unproved divided-power monomial basis or canonical PD structure.

### Augmentation of the divided power algebra

`CrystallineCohomology:CR.0/gamma-augmentation` — construction.

Construct the R-algebra homomorphism ε:Γ_R(M)→R taking dp(0,m) to 1 and every dp(n,m) with n>0 to 0. It is the existing lift into the canonical zero PD ideal of R along the zero linear map M→R.

Proof or construction:

1. Use dividedPowersBot R, the zero R-linear map M→R and its range containment in the zero ideal as the inputs of DividedPowerAlgebra.lift.
2. Use lift_apply_dp, the degree-zero PD axiom and dpow_eval_zero in positive degree to calculate ε on every generator.
3. The algebra-homomorphism structure gives ε(algebraMap(r))=r. For naturality and uniqueness use algHom_ext on all dp(n,m), splitting n=0 from n>0.

Prerequisites: `mathlib:dividedPowersBot`, `mathlib:DividedPowerAlgebra.lift`, `mathlib:DividedPowerAlgebra.lift_apply_dp`, `mathlib:DividedPowers.dpow_eval_zero`, `mathlib:DividedPowerAlgebra.algHom_ext`, `mathlib:DividedPowerAlgebra.dp_zero`, `mathlib:DividedPowerAlgebra.map_apply_dp`.

API:

- `TauCeti.Crystalline.Augmentation.augmentation_eq_lift`: ε equals the pinned DividedPowerAlgebra.lift of dividedPowersBot R along the zero linear map.
- `TauCeti.Crystalline.Augmentation.augmentation_dp`: ε(dp(n,m)) is 1 when n=0 and 0 otherwise.
- `TauCeti.Crystalline.Augmentation.augmentation_scalar`: ε(algebraMap(r))=r for all r∈R.
- `TauCeti.Crystalline.Augmentation.augmentation_natural`: For every R-linear f:M→N, ε_N∘Γ(f)=ε_M.
- `TauCeti.Crystalline.Augmentation.augmentation_unique`: An R-algebra homomorphism Γ_R(M)→R killing every dp(n,m) with n>0 equals ε.

Unit tests:

- `augmentation_test_unit` (non-example): For R=M=Z, ε(1)=1, ruling out a zero map.
- `augmentation_test_zero_degree` (degenerate): For every m, ε(dp(0,m))=1.
- `augmentation_test_positive_with_scalar` (computation): For every m, ε(3+dp(2,m))=3, including characteristic two and torsion modules.

Acceptance: Over Z the unit maps to 1. Degree zero is retained even when m=0; every positive divided degree maps to zero.

### Augmentation ideal

`CrystallineCohomology:CR.0/gamma-augmentation-ideal` — definition.

Define Γ_R(M)_+ as the existing ring-homomorphism kernel ker(ε), an ideal of the existing algebra Γ_R(M). Membership means ε(z)=0. In positive degree dp(n,m) belongs to this ideal, and a scalar belongs exactly when it is zero.

Proof or construction:

1. Apply RingHom.ker to ε; use RingHom.mem_ker for membership.
2. The generator and scalar assertions follow by the computed values of ε. Properness over a nonzero ring follows because ε(1)=1.

Prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation`, `mathlib:RingHom.ker`, `mathlib:RingHom.mem_ker`.

API:

- `TauCeti.Crystalline.Augmentation.augmentationIdeal_eq_ker`: Γ_R(M)_+=RingHom.ker(ε).
- `TauCeti.Crystalline.Augmentation.mem_augmentationIdeal`: z∈Γ_R(M)_+ if and only if ε(z)=0.
- `TauCeti.Crystalline.Augmentation.dp_mem_augmentationIdeal`: For n≠0, dp(n,m)∈Γ_R(M)_+.
- `TauCeti.Crystalline.Augmentation.scalar_mem_augmentationIdeal`: algebraMap(r)∈Γ_R(M)_+ if and only if r=0.

Unit tests:

- `augmentationIdeal_test_positive` (computation): dp(2,m) belongs to Γ_R(M)_+ for every m.
- `augmentationIdeal_test_unit` (non-example): 1 does not belong to Γ_Z(Z)_+.
- `augmentationIdeal_test_degree_one_insufficient` (non-example): Over R=M=F₂, dp(2,1) belongs to the augmentation ideal but not to the ordinary ideal generated by the degree-one image of M. This rejects replacing all positive divided degrees by degree one.

Acceptance: For R=M=Z, neither 1 nor any dp(0,m) belongs. Every positive divided-power generator does belong.

### Positive-degree remainder

`CrystallineCohomology:CR.0/gamma-remainder-positive-span` — lemma.

For every z∈Γ_R(M), z−algebraMap(ε(z)) belongs to the ideal H generated by all dp(n,m) with n>0 and m∈M.

Proof or construction:

1. Apply the pinned DividedPowerAlgebra.induction_on with the displayed remainder-membership predicate.
2. For a scalar the remainder is zero. For a sum it is the sum of the two remainders.
3. For z·dp(0,m), dp_zero reduces to the induction hypothesis. For z·dp(n,m) with n>0, the augmentation is zero and dp(n,m) is one of H’s generators, so ideal closure under multiplication proves membership.

Prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation`, `mathlib:DividedPowerAlgebra.induction_on`, `mathlib:DividedPowerAlgebra.dp_zero`, `mathlib:Ideal.subset_span`.

Acceptance: The proof handles arbitrary elements of the quotient, with no unproved monomial basis, torsion-free embedding or freeness hypothesis.

### Positive-degree generators of the augmentation ideal

`CrystallineCohomology:CR.0/gamma-augmentation-ideal-generators` — lemma.

Γ_R(M)_+ is exactly the ideal generated by {dp(n,m) | n>0, m∈M}. The degree-zero generators are excluded.

Proof or construction:

1. Every listed generator has augmentation zero; Ideal.span_le gives H⊆ker(ε).
2. If ε(z)=0, the positive-degree remainder lemma gives z−algebraMap(0)=z∈H, proving the reverse inclusion.

Prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation-ideal`, `CrystallineCohomology:CR.0/gamma-remainder-positive-span`, `mathlib:Ideal.span_le`.

Acceptance: Over Z the ideal is proper, so including dp(0,m)=1 would give the wrong result. This gives generators by all positive divided powers; generation by degree one alone is not asserted.

### Scalar and augmentation splitting

`CrystallineCohomology:CR.0/gamma-augmentation-splitting` — construction.

Construct an R-linear equivalence Γ_R(M)≃R×Γ_R(M)_+ by z↦(ε(z),z−algebraMap(ε(z))). Its inverse is (r,u)↦algebraMap(r)+u. The second coordinate uses the kernel-membership proof; multiplication on the two summands has cross terms.

Proof or construction:

1. Augment the remainder: ε(z)−ε(algebraMap(ε(z)))=0; this gives the subtype membership proof.
2. Both coordinate functions and the proposed inverse are R-linear by the algebra maps and submodule structure.
3. Substitute each composite. Cancellation gives z in one direction; ε(u)=0 gives (r,u) in the other. Package the linear maps with LinearEquiv.ofLinearMap.

Prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation`, `CrystallineCohomology:CR.0/gamma-augmentation-ideal`, `mathlib:LinearEquiv.ofLinearMap`.

API:

- `TauCeti.Crystalline.Augmentation.augmentationSplitting_fst`: The first coordinate of the image of z is ε(z).
- `TauCeti.Crystalline.Augmentation.augmentationSplitting_snd`: The underlying algebra element of the second coordinate is z−algebraMap(ε(z)).
- `TauCeti.Crystalline.Augmentation.augmentationSplitting_symm`: The inverse sends (r,u) to algebraMap(r)+u.

Unit tests:

- `augmentationSplitting_test_scalar` (compatibility): Every scalar r maps to (r,0).
- `augmentationSplitting_test_ideal` (compatibility): Every u∈Γ_R(M)_+ maps to (0,u).
- `augmentationSplitting_test_addition` (computation): The element algebraMap(r)+u maps to (r,u), retaining both components.

Acceptance: Constants and augmentation elements are separated exactly. This is a module splitting; it does not give a monomial basis or the missing PD structure.

### Remainder of an extended base ideal

`CrystallineCohomology:CR.0/gamma-base-ideal-remainder` — lemma.

For every ideal I⊂R, put IΓ=I.map(algebraMap R Γ_R(M)). If z∈IΓ, then z−algebraMap(ε(z))∈IΓ·Γ_R(M)_+.

Proof or construction:

1. The definition of Ideal.map and the finite-span criterion express z as a finite sum Σ_j b_j·algebraMap(a_j), where a_j∈I and b_j∈Γ_R(M). No injectivity, flatness or basis is used.
2. The augmentation is Σ_j ε(b_j)a_j. Subtract its scalar image and distribute to obtain Σ_j (b_j−algebraMap(ε(b_j)))·algebraMap(a_j).
3. Each first factor lies in Γ_R(M)_+ by the augmentation calculation, and each second factor lies in IΓ. Ideal product membership and finite-sum closure give the result.

Prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation`, `CrystallineCohomology:CR.0/gamma-augmentation-ideal`, `mathlib:Ideal.map`, `mathlib:Ideal.mem_map_of_mem`, `mathlib:Finsupp.mem_ideal_span_range_iff_exists_finsupp`, `mathlib:Ideal.mul_mem_mul`.

Acceptance: The conclusion holds for arbitrary modules and arbitrary base ideals, including torsion modules and I=0.

### Base ideal and augmentation intersection

`CrystallineCohomology:CR.0/gamma-base-ideal-intersection` — lemma.

For every ideal I⊂R, IΓ∩Γ_R(M)_+=IΓ·Γ_R(M)_+. This is an equality of ideals in Γ_R(M), without a flatness or freeness assumption.

Proof or construction:

1. The ideal product is contained in the intersection by Ideal.mul_le_inf.
2. For z in the intersection, ε(z)=0. The preceding base-ideal remainder statement reduces to z∈IΓ·Γ_R(M)_+, proving the reverse inclusion.

Prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation-ideal`, `CrystallineCohomology:CR.0/gamma-base-ideal-remainder`, `mathlib:Ideal.mul_le_inf`.

Acceptance: This supplies the exact intersection/product hypothesis of CR.0/product-intersection-gluing once the two separate PD structures have been constructed. Existence of those structures, particularly the positive-degree PD structure, is still a separate proof obligation.

### A degree-two detector in characteristic two

`CrystallineCohomology:CR.0/gamma-degree-two-detector` — lemma.

Let B=TrivSqZeroExt(F₂,F₂), with ε(a)=(0,a). There exists an F₂-algebra homomorphism f:Γ_F₂(F₂)→B with f(dp(0,a))=1, f(dp(2,a))=ε(a), and f(dp(n,a))=0 in every other degree.

Proof or construction:

1. Use the pinned lift′ for the displayed total generator family; this is an ordinary algebra homomorphism, not a PD morphism.
2. The degree-zero relation is immediate. Scalar homogeneity in degree two uses r²=r for r∈F₂; all other positive degrees are zero.
3. For the product relation, an index zero is immediate. When both indices are positive, the only nonzero possible left side is ε(a)²=0; the only possibly nonzero target degree is 1+1=2, whose coefficient choose(2,1)=2 vanishes in F₂.
4. For the additive relation, degree zero gives one and degree two gives ε(a+b)=ε(a)+ε(b). The only other possible convolution term is degree four, ε(a)ε(b)=0. All remaining terms vanish. Apply lift′_apply_dp for the stated formula.

Prerequisites: `mathlib:DividedPowerAlgebra.lift'`, `mathlib:DividedPowerAlgebra.lift'_apply_dp`, `mathlib:TrivSqZeroExt.inr`, `mathlib:TrivSqZeroExt.inr_mul_inr`, `mathlib:ZMod.natCast_self`.

Acceptance: The map kills the degree-one image but detects dp(2,1). It demonstrates why the weak algebra lifting property and a full PD universal property are different statements.

### Degree one does not generate the augmentation ideal

`CrystallineCohomology:CR.0/gamma-degree-one-insufficient` — lemma.

In Γ_F₂(F₂), dp(2,1) is not in the ordinary ideal generated by {embed(a) | a∈F₂}.

Proof or construction:

1. Take the preceding ordinary algebra homomorphism to the square-zero extension. Every embed(a)=dp(1,a) maps to zero, so the ordinary ideal they generate lies in its ring kernel by Ideal.span_le.
2. The image of dp(2,1) is inr(1), which is nonzero by inr_injective and 1≠0 in F₂. Kernel membership therefore rules out membership in the degree-one ideal.

Prerequisites: `CrystallineCohomology:CR.0/gamma-degree-two-detector`, `mathlib:DividedPowerAlgebra.embed_def`, `mathlib:RingHom.mem_ker`, `mathlib:Ideal.span_le`, `mathlib:TrivSqZeroExt.inr_injective`.

Acceptance: The concrete degree-two class distinguishes the correct augmentation ideal from a plausible wrong degree-one-generated ideal without assuming a free monomial basis.


## CR.4: retained scope and shared décalage

The inherited seven identifiers describe a source-checked mathematical prefix,
but several combine a construction with its categorical consequences. Their
preservation does not assert declaration-level closure. The suggested file
now gives the concrete Dieudonné carrier on existing cochain complexes, the
explicit saturation predicate, Verschiebung and the iterated Frobenius image
statement. The η dictionary, the morphism/category packaging and the universal
properties must be refined into additional declarations with their dependencies.
The saturation, Cartier-comparison and completion signatures remain absent;
their exact statements, seven API items and six tests are recorded as explicit
continuation comments. No opaque proposition stands in for a missing object.

For the generic décalage carrier, the imported node is
AInfCohomology:AI.1/ideal-decalage-complex. On the punctual Z-topos with I=(p),
its principal chart is exactly the subcomplex used by BLM. The degree twist
for negative indices is part of that construction, so a nonnegative-degree
shortcut cannot be applied to all Z-indexed complexes. The source relation
between F and α_F must keep the factor pⁿ in degree n. F itself generally
does not commute with d; the two-term test Z→Z with d=id, F₀=2 and F₁=1
detects that error at p=2.

The Bockstein comparison is imported from
AInfCohomology:AI.1/bockstein-reduction. Its target is a complex with the
Bockstein differential, not a graded group with zero differential. BLM gives
a direct proof in §§2.4.4–2.4.6; shared ownership means that this comparison is
not constructed a second time under another name. The inherited reference to
the derived décalage functor for saturation's colimit step was too broad.
The packet instead requests the exact underived filtered-colimit statement
from AI.1. Its construction is independent of AΩ and of crystalline realization.

The saturation sequence is M→ηM→η²M→⋯ with transitions α_F,η(α_F),η²(α_F),….
It is not a sequence obtained by applying a single untyped F to different
complexes. The reduction by p-power torsion, the colimit universal property,
and compatibility of reduction and quasi-isomorphisms with filtered colimits
remain proof obligations. In the completion tower the quotient is by both
im(Vʳ) and im(dVʳ). Dropping the differential term can fail to give a subcomplex.
F lowers the finite level and V raises it; neither can be assigned an incorrect
level-preserving finite-stage type merely because the limit admits an endomorphism.

A saturated complex is not automatically of Cartier type. Likewise, the
Verschiebung completion of a saturated complex need not be the original
complex: Q in degree zero with F=id has zero quotients because multiplication
by p is surjective. This test distinguishes a completion construction from an
unjustified assertion that all saturated objects are strict.

## Required stage continuations

The following are part of the roadmap's scope. The status describes source
extraction and construction planning, not the truth of the mathematical result.

### CrystallineCohomology:CR.0 — partial

- Construct the canonical augmentation divided powers on the existing Γ_A(M), its free-module divided-monomial description and the relative PD polynomial algebra. Read/close all proof prerequisites in Stacks23.5.1 before claiming its universal property.
- Construct arbitrary base-compatible envelopes D_{B,γ}(J), their initiality, functorial maps, quotient presentations and exact base change; Stacks60.2 was read but is not decomposed here. In60.2.6 retain quotient flatness and Tor₁ vanishing; in60.2.7 retain flatness of B/I→B′/I′ and J′=JB′+I′.
- The weighted ideal, F⁰=R, F¹=I, decreasingness, multiplication, ordinary-power inclusion, PD-morphism image and surjective-image formulas, and rational comparison are decomposed. Prove the stronger γ_m(FⁿI)⊆F^(mn)I with its finite-sum/iteration argument, then develop PD nilpotence and specialize the existing DividedPowers.Quotient.dividedPowers to these filtration ideals after proving their IsSubDPIdeal condition. Generic quotient divided powers already exist at the pin. Establish the exact completion contracts. Envelope localization/transitivity and regular-immersion examples remain. Import DD.0/1 for derived powers and completion; the ordinary filtration does not provide those constructions.
- Import DD.0/1 for the derived PD comparison and derived completion, with lci and torsion/boundedness hypotheses. Construct the shared kerθ-envelope, A_cris and canonical coefficient maps from AI.0:integral data; preserve the p=2 distinctions.

### CrystallineCohomology:CR.1 — not_read

- Construct small/big crystalline sites, topology and variance, base-compatible thickenings, structure and PD-ideal sheaves, and comparisons of site conventions.
- Construct quasi-coherent/finite locally free crystals and isocrystals/F-crystals, evaluation on lifts, PD stratifications and the integrable quasi-nilpotent connection equivalence with its Taylor/cocycle proof.
- Read the relevant Stacks crystalline-site and connection sections and Berthelot–Ogus§§3–4 proof interiors. For the Stacks convention require p locally nilpotent on T without imposing uniform ordinary nilpotence on its whole PD ideal.

### CrystallineCohomology:CR.2 — not_read

- Construct enhanced crystalline derived global sections and direct images using EnhancedDerivedSheaves, linearization and its acyclicity, and the PD Poincaré lemma with coefficients.
- Build smooth-embedding de Rham comparisons, multiple intersections of embedding systems, explicit totalization/refinement maps and independence. Import ordinary/derived differential algebra and completion from DD.0/1/2 where their exact contracts apply.
- Construct formal inverse-limit comparisons with hypotheses. DD.4 consumes the crystalline realization built here; it is not a prerequisite for constructing it. Full proof interiors remain unread.

### CrystallineCohomology:CR.3 — not_read

- Prove topology-specific descent, proper smooth perfectness over W(k) for perfect k, finite cohomology, reductions and derived base change with exact flat/perfect coefficient hypotheses.
- Construct Künneth, cup products and semilinear crystalline Frobenius with its linearization; do not infer torsionfreeness of individual cohomology groups or rational isogeny from perfectness.
- Use the complete Berthelot–Ogus AppendixB corrigendum when making tower replacements. The correction was read in the preceding DD job, not its original book proof here. Read Stacks applications and BMS1§14 and include a torsion example.

### CrystallineCohomology:CR.3:Frobenius-isogeny — not_read

- Prove the rational-isogeny theorem using CR.4 Cartier/de Rham–Witt control or the exact classical crystalline proof. Keep it distinct from the construction of Frobenius.
- Separate finite-free F-crystals from torsion cohomology and import convergent/overconvergent extensions from RD.7. A bare semilinear vector space is not a site-theoretic coefficient object.

### CrystallineCohomology:CR.3:duality — not_read

- Acquire and read Berthelot LNM407 VI–VII, particularly VII, or establish the precise comparison of the acquired Ekedahl de Rham–Witt route to the crystalline trace. The full classical proof source remains source-pending.
- Construct trace with its top-degree normalization, diagonal and Gysin classes, evaluation/coevaluation, derived perfect pairing, base change and functoriality. Check projective space and reduction; ordinary perfect pairings on torsion cohomology are not asserted.

### CrystallineCohomology:CR.4 — partial

- Refine the seven inherited aggregate nodes, preserving their ids, and supply all categorical, quotient, saturation and completion signatures; the four core prototypes are not complete prototypes of their aggregate statements.
- Prove the p-power-torsion reduction, saturation universal property, underived η filtered-colimit compatibility and passage of mod-p quasi-isomorphisms through the saturation sequence. Import generic décalage/Bockstein from AI.1.
- Continue BLM§2.5 after the inspected passages and §§2–5,8–10: strict completion, saturated algebras, universal de Rham–Witt, localizations/étale descent, fixed-point and classical/crystalline comparisons.
- Develop classical and relative Langer–Zink Witt complexes, full R/F/V/Teichmüller/dlog relations, basic Witt differentials and the precise smooth p-nilpotent relative comparison. Read Langer–Zink§§1–3 and BMS1§§10–11; use existing Witt-vector carriers and distinguish graded F from degree-scaled crystalline Frobenius.

The CR.1 crystalline-site convention requires special care. In the Stacks
p-nilpotent setting, p is locally nilpotent on a thickening T; its entire PD
ideal is not required to have one global ordinary-nilpotence exponent. A source
using a smaller nilpotent-thickening subsite requires an actual comparison.
Similarly, the connection description needs quasi-nilpotence in addition to
integrability. Neither a name match nor an arbitrary connection supplies a crystal.

CR.2 must construct the enhanced cohomological maps from a genuine site and its
structure sheaf. Multiple intersections in an embedding system, the PD de Rham
totalization and refinement maps are indispensable to independence of the chosen
embedding. DD.4 consumes that crystalline realization; using DD.4 to supply it
would reverse the producer-consumer boundary. Ordinary differential forms and
completion should instead come from the independent DD foundations.

For CR.3, proper smoothness over a perfect field is the main finiteness scope.
The output is a perfect W(k)-complex with finite cohomology. Perfectness of the
complex does not remove torsion from its individual cohomology groups.
Frobenius must be constructed as an actual semilinear map and distinguished
from its linearization. The rational-isogeny theorem has its own proof input
from CR.4 or a complete classical argument. A definition of cohomology cannot
contain that theorem as an assumed field.

The Berthelot–Ogus Appendix B correction provides the required derived tower
replacement with its actual conditions. It does not allow arbitrary input
towers to acquire termwise surjectivity by assertion. The complete two-page
corrigendum was read during the preceding derived de Rham checkpoint; the
original book argument is not certified by that reading. The exact replacement
must be integrated before inverse-limit finiteness is closed.

The duality stage retains a separate source gate: Berthelot LNM407 VI–VII,
especially VII, is the classical proof source. Berthelot–Ogus §§7–8 and BMS1
§14 are not substitutes for that missing proof. The acquired Ekedahl route is
a promising source for a comparison through de Rham–Witt, but it must be matched
to the precise crystalline trace and normalization. Projective-space trace,
the diagonal class and derived evaluation/coevaluation are required outputs.
Torsion makes a derived dual essential; ordinary perfect pairings on every
cohomology group are not asserted.

## Source audit and corrections

The source ledger distinguishes a PDF hash from a text-extraction hash and a
complete download from a complete reading. The new constructions use the full
proofs of Stacks 23.2.4–5 and 23.4.2. Section23.5 and crystalline Section60.2
were read for the next construction sequence, but those sections are not fully
decomposed. BLM arXivv3 pp.13–19 and p.20 through Example2.5.6 were read; only
the beginning of Example2.5.7 was inspected. The publisher and author copies
were read at the specific page used to collate Remark2.3.4, not throughout.

- [Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex) — Live text accessed 2026-09-26; dpa.tex at a04446e57ec1fbc252a871afcec7752fb2807b14. SHA-256: 1e4ed7cee878c185ea5284e176241d3428a398a25b28a56c44869c1b59f090ed. Definition23.2.1; complete proofs of Lemmas23.2.4–5 and23.4.2; complete Section23.5. Section23.5 is source reconnaissance for the required polynomial-envelope continuation; it is not claimed decomposed. Raw source hash covers dpa.tex; only the listed passages were read. Live HTML of 07H1 and07H4 was also inspected.

- [Crystalline Cohomology: Divided power envelope](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex) — Live Section60.2 accessed 2026-09-26; crystalline.tex at a04446e57ec1fbc252a871afcec7752fb2807b14. SHA-256: 466c0634a5e8e3899b157a42a4b4bb5f4357199f96708caf5854f5a92be58054. Complete Section60.2, Lemmas60.2.1–7 and their proofs and comments; used to identify the required envelope constructions and exact base-change hypotheses. The section remains an explicit continuation target; no envelope existence theorem is claimed decomposed. Hash covers the whole chapter source, not a whole-chapter reading.

- [Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3) — arXiv:1805.05501v3, 19 February2020; newly downloaded158-page PDF. SHA-256: 533f9073572ccefa893706a39b8792b55cb313886e402a7eb6d4c22271687753. Printed pp.13–19 completely; p.20 through Example2.5.6, with only the beginning of Example2.5.7 inspected. All passages supporting the seven inherited nodes were freshly reread. The old integrated source hash referred to a text extraction; this hash is of the PDF and is not claimed equal to that extraction.

- [Revisiting the de Rham-Witt complex](https://smf.emath.fr/system/files/filepdf/smf_ast_424.pdf) — Astérisque424(2021), publisher PDF178pages including front matter. SHA-256: fd87e547f9d769f60de623f8708ded7b9fe2b5953d5c0c8281ad44f71e05ca22. Printed p.16, PDF page24, Remarks2.3.3–4 and adjacent text; Remark2.3.4 visually inspected for the source finding. The rest of the published volume was not reread.

- [Revisiting the de Rham-Witt complex](https://www.math.ias.edu/~lurie/papers/Crystalline.pdf) — Author-hosted141-page copy downloaded 2026-09-26; not identified with arXivv3 or the published text. SHA-256: dad4e554ad5847a9c7410a42d8d4f8eb37afffae643ed55ccdf11471278ece0d. Printed p.16, Remark2.3.4, to collate the displayed differential calculation. A distinct forward-direction misprint here is corrected in arXivv3 and the published text.

The source findings in this section, the finite-quotient section and the filtration section await independent review. The correction searches have the bounded scope recorded for each finding. The distinct slip in the older author copy is corrected in the revised forward argument. The findings concern proof text and do not withdraw the stated results.

**CrystallineCohomology/E1 — Lemma23.5.3(tag07GS), proof, final p-adic-digit display; live text 2026-09-26.** Replace each γ_p acting on f by ε_p. Here f lies in the augmentation ideal of Z_(p)⟨u,v⟩, whose PD structure is ε. The constructed γ acts on I⊂A, so γ_p(f) has the wrong domain. The corrected formula is the digit expansion applied in the source PD ring. No correction identified in the targeted search; novelty unestablished.

**CrystallineCohomology/E2 — Lemma23.5.3(tag07GS), proof, n=p generator-reduction sentence; live text 2026-09-26.** The referenced properties are (2) and (3): scalar homogeneity and the addition formula. To extend equality of the two p-th operators from ideal generators to their scalar multiples one uses δ(ax)=a^pδ(x), which is condition(2); addition is condition(3). Condition(1) does not permit cancellation of p! in a torsion ring. No correction identified in the targeted search; novelty unestablished.

**CrystallineCohomology/E3 — Lemma60.2.4(tag07HC), proof, second family generating K′; live text 2026-09-26.** The indices t′ and t range over T. T indexes the chosen elements f_t and variables x_t. I is a ring ideal, not the indexing set of these variables. No correction identified in the targeted search; novelty unestablished.

**CrystallineCohomology/E4 — Lemma60.2.7(tag07HE), proof after display(60.2.7.1); live text 2026-09-26.** Use assumption(2) to conclude that the images f′_t generate J′/I′. Condition(2) is J′=JB′+I′. Condition(1) only says B/I→B′/I′ is flat and alone does not control J′. No correction identified in the targeted search; novelty unestablished.

**CrystallineCohomology/E5 — Remark2.3.4, last displayed calculation in prose, printed p.16/PDF page24 of Astérisque424(2021); also present in arXivv3 p.16.** Delete the inner d: d(F^{−n}x)=p^{−r}F^{−r}d(F^{r−n}x). The printed right side applies d twice, lies one degree too high, and vanishes by dF^k=p^kF^k d and d²=0. The preceding sentence gives d(F^{r−n}x)∈p^rM, exactly the corrected numerator. The source theorem is unchanged. No correction identified in the targeted search; novelty unestablished.

**CrystallineCohomology/E6 — Remark2.3.4, forward-direction calculation, printed p.16 of the141-page author copy at the recorded URL.** Delete d before z: F^{r−n}dx=p^nF^{r−m}z. The preceding equality is F^{−n}dx=p^nF^{−m}z; applying F^r yields the corrected formula without a new differential. This distinct slip is absent from the revised forward argument in arXivv3 and Astérisque424. Corrected by the rewritten forward-direction argument in arXiv1805.05501v3 and Astérisque424(2021), Remark2.3.4.

The Stacks generator-family index must be T rather than the ideal I. Its
p-adic-digit formula must apply the source operation ε_p to a source element.
The generator reduction uses homogeneity and addition, numbered (2) and (3).
The envelope base-change proof uses its ideal-generation condition (2) at the
cited step. These are explicit corrections to the continuation's source route;
the new tranche does not quietly absorb altered source statements.

The published BLM calculation has an extra differential inside d(F^{r−n}dx).
Removing that inner d gives the numerator from the preceding divisibility
statement. The error is visible by degree and also by d²=0. The older author
copy has a different extra d in its forward calculation, and the rewritten
published argument corrects that one. The two copies must therefore not be
conflated when recording what has already been fixed.


## Finite Verschiebung quotients

This section supplies the finite quotient portion of the completion construction
on the existing Dieudonné-complex carrier. It uses ordinary cochain complexes of
Z-modules, their cochain maps, linear images, submodule sums and quotients. The
quotient of a complex here is unrelated to the carrier of the truncated Witt
vector ring: both are traditionally denoted W_r, but their inputs and universal
properties differ. No second carrier for Witt vectors is introduced.

The seven original CR.4 aggregate identifiers remain intact as source and
continuation targets. Their finite-level content is split into the declarations
below. In particular, the original completion aggregate still includes an inverse
limit and a canonical map into that limit. Those parts are required work. A
compiled finite quotient does not provide that limit, prove its strictness, or
identify it with classical de Rham–Witt cohomology. The three inherited
comment-only node forms, seven API entries and six tests remain explicit gaps.

The source fixes a prime p. The finite algebraic statements only use the recorded
saturation conditions and hence their signatures accept any natural p for which
those conditions hold. The examples below use p=2 or a prime p. No inference
about a general p-torsion complex follows from a saturated statement. All cochain
indices are integers; the incoming differential at degree zero comes from degree
minus one, without an implicit nonnegative-degree assumption.

### The denominator and the maps

Write V_n for Verschiebung on M^n and set

N_r^n = im(V_n^r) + im(d_(n−1) V_(n−1)^r).

These are sums of ordinary Z-submodules. There is no topological closure. For
r=0 the first summand is all of M^n, so W_0(M)=0. For a larger r, increasing the
exponent shrinks each image. Differential stability follows from d²=0: the
differential of V^r a+dV^r b is precisely dV^r a. This explains why the second
summand must be present even though V itself need not be a cochain map.

The finite group in degree n is M^n/N_r^n. The differential is induced by d,
and the canonical quotient projection is surjective with kernel N_r^n. The
suggested file gives this exact quotient as the degree object of the existing
CochainComplex construction; its differential is the existing induced quotient
linear map. The only new data are the indicated filtration and its application
to this quotient, with the proof obligations written as signatures.

There are three maps with different types. Restriction R_r goes from level r+1
to level r and is induced by identity on representatives. It is a cochain map.
Frobenius F_r has the same source and target levels but sends [x] to [Fx]. It is
a map of graded groups satisfying dF_r=pF_r d. Verschiebung V_r goes from level
r to level r+1 and satisfies V_r d=p dV_r. Each symbol carries its level index;
none of the equations silently makes F or V an endomorphism of a single finite
quotient or an ordinary cochain map.

For F, the denominator inclusion follows from FV=p and FdV=d. For V, it follows
from Vd=p dV. Passing these equalities to representatives gives F_r V_r=p on
W_r and V_r F_r=p on W_(r+1). In particular, the second identity at r=0 shows
that W_1 is killed by p, because it factors through the zero group W_0. The
restriction compatibilities have the types R_r F_(r+1)=F_r R_(r+1) and
R_(r+1) V_(r+1)=V_r R_r.

A Dieudonné morphism is an existing cochain map which also commutes with F.
When both complexes are saturated it commutes with V: applying the target F
to fV and Vf gives the same map p f, and target Frobenius is injective. Thus
f preserves N_r, so it induces W_r(f). Identity, composition and compatibility
with R,F,V follow on representatives. This is the finite functoriality required
by the source's completion construction. It does not require a new category of
bare graded maps or an assumed equivalence with a derived category.

### Torsion and finite Frobenius lifting

The filtration satisfies two complementary properties: p N_r is contained in
N_(r+1), and p x in N_(r+1) implies x in N_r. The first is the identity
pV^r=V^(r+1)F in each of the two summands. The second is BLM Lemma2.6.4 and uses
saturation essentially. If

p x = V^(r+1)a + dV^(r+1)b,

then differentiating shows that dV^(r+1)a is divisible by p. Iterating FdV=d
and using the characterization of im(F) gives a=Fa′. Substitution then makes
dV^(r+1)b divisible by p and gives b=Fb′ in the same way. Canceling p in the
resulting equation yields x=V^r a′+dV^r b′. The injectivity used in this last
step is an explicit promoted dependency of the lemma.

Consequently ker(R_r) is exactly the p-torsion subgroup of W_(r+1). Repeatedly
using p N_r⊆N_(r+1), starting at N_0=M, also shows that p^r annihilates W_r.
These finite groups generally have torsion even though M is p-torsion-free.
The restriction-kernel theorem is not a statement about ker(F_r), and it does
not assert injectivity of restriction.

If the differential of a finite class x is divisible by p, that class lifts
under F_r. At level zero the claim is immediate from W_0=0. At a positive
level r, choose representatives with

dx = p y + V^r a + dV^r b.

Differentiating gives the same lifting criterion for a, so a=Fa′. Subtract
V^r b and use V^r F=pV^(r−1). The result has p-divisible differential in M,
where saturation gives a Frobenius preimage. Its class at level r+1 maps to x.
Separating r=0 avoids an undefined negative Verschiebung exponent in this
argument. This finite lifting property and the restriction-kernel theorem
are precisely the inputs used to prove saturation of the inverse limit in
BLM Proposition2.6.5. That limit proof and its coherent construction remain
part of the continuation work.

### Concrete acceptance models

For M concentrated in degree zero with M^0=Z and F identity, saturation holds
at a prime p, V is multiplication by p and N_r=p^r Z. Thus W_r^0=Z/p^r, R is
reduction, F_r is reduction, and V_r is multiplication by p into the next
quotient. The test at p=2,r=3 requires an actual Z-linear equivalence with
Z/8. This distinguishes the quotient from a torsionfree replacement or an
incorrect p^(r+1) index. For M^0=Q and F identity, V=p is invertible, every
N_r is all of M and every finite quotient vanishes. Completion of the rational
example cannot be inferred to recover its original degree-zero group.

A model with nonzero differential tests the second summand and the two scaled
operator equations. The following algebraic model is the finite-support
integer subcomplex of the coordinate description in BLM Example2.5.7; it is
not asserted to be complete or strict. In degree zero take the free abelian
group on e_m for m≥0 and v_j for j≥1. In degree one take the free abelian
group on f_m for m≥0 and w_j for j≥1. All other degrees are zero. Define

- d(e_m)=p^m f_m and d(v_j)=w_j.
- In degree zero, F(e_m)=e_(m+1), F(v_1)=p e_0 and
  F(v_j)=p v_(j−1) for j>1.
- In degree one, F(f_m)=f_(m+1), F(w_1)=f_0 and
  F(w_j)=w_(j−1) for j>1.

Every element has finite support, and the displayed maps preserve this
condition. Both groups are p-torsion-free. In degree zero, d(x) is p-divisible
exactly when the e_0 and all v_j coefficients are divisible by p, which is
exactly the image of F. In degree one F is bijective, and the outgoing
differential is zero. Hence this is a saturated Dieudonné complex. Its V maps
are determined by FV=p: in degree zero, V(e_0)=v_1,
V(e_m)=p e_(m−1) for m>0 and V(v_j)=v_(j+1); in degree one,
V(f_0)=p w_1, V(f_m)=p f_(m−1) for m>0 and V(w_j)=p w_(j+1).

In both degrees the finite quotient has its e_m or f_m coordinates reduced
modulo p^r. Its v_j or w_j coordinate for 1≤j<r is reduced modulo p^(r−j),
and coordinates with j≥r vanish. This follows by taking the displayed images
of V^r and dV^r on basis vectors. It supplies three decisive checks at p=2.
First, w_1=dV(e_0) belongs to N_1^1 but not to im(V_1)=2M^1. Second, on the
class of e_0 at level2, dF_1 is zero at level1 whereas F_1d is the nonzero
class of f_1. Third, on the class of e_0 at level1, dV_1 is the nonzero class
of w_1 at level2 whereas V_1d=2w_1 is zero there. These check failure of the
unscaled chain-map equations without contradicting dF=pFd and Vd=p dV.

The scratch arithmetic checks act on this unbounded basis and project only
after applying each operation; they never impose a relation at a final
Frobenius index. They examine 190 finite-support representatives and 1,900
level/degree cases. They check FV=VF=p, dF=pFd, the restriction kernel,
p^r annihilation and the two non-chain witnesses. They are acceptance
computations, not proofs of the general declaration bodies. A named Lean
construction of this model and its coordinate equivalences remains required
when proving the three existential tests. The tests themselves are typed.

### Sources, retained work and continuation

The finite quotient discussion follows BLM Construction2.5.1 and Remarks2.5.2–3.
Its torsion and lifting arguments isolate Lemmas2.6.3–4 and the relevant parts
of Proposition2.6.2. The source's eight-axiom strict tower definition is not
replaced by an arbitrary list of assumed properties. The packet supplies the
finite algebraic declarations above, while a bundled strict tower, its inverse
limit, the limit's saturation and strictness, and the universal completion map
remain required. The generic underived η filtered-colimit request to AI.1 is
unchanged and is not an input to this finite-level tranche.

Fresh reading covers arXivv3 pp.13–15 and19–25, reaching the statement of2.7.7
but not its proof. The acquired publisher copy was hash-verified and printed
pp.22–23 were read and rendered. The new source register records two editorial
slips in the published proofs, both also present in the preprint: the missing
subject before the lifted equality in2.6.2 and an extra verb in the final
sentence of2.6.5. They do not affect mathematics. No novelty claim is made.
The earlier six findings and all thirty-eight preceding mathematical
specifications remain unchanged. Thirty-seven node objects are identical; the
completion aggregate gains exact prerequisites for its finite steps and an
updated signature-gap note. Its full statement is retained. The earlier reading
ranges, hypotheses and correction status remain part of this document.

Continue with the inverse-limit version of Construction2.5.1 and its unit and
functorial maps, then use the finite lifting and p-torsion results for2.6.5.
Prove the finite-level comparison with completion before declaring it strict
or universal. The Cartier and η arguments require their own supplied maps;
they cannot be replaced by a formal attribute on these quotients. The full
classical and relative comparisons, the PD polynomial/envelope construction,
crystalline sites, coefficient theory and source-qualified duality obligations
of the preceding sections remain required. No stage is closed by this tranche.

## Finite quotient declaration register

### The relation is dF=pFd, including negative cochain degrees

Identifier: `CrystallineCohomology:CR.4/dieudonne-dF`. Declaration: `TauCeti.Crystalline.DieudonneComplex.d_F`.

The relation is dF=pFd, including negative cochain degrees. The declaration is the existing API item, promoted once for explicit dependency use.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Dependencies: `CrystallineCohomology:CR.4/dieudonne-complex`.

Source: Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Multiplication by p is injective in every degree

Identifier: `CrystallineCohomology:CR.4/saturated-p-injective`. Declaration: `TauCeti.Crystalline.IsSaturated.p_injective`.

Multiplication by p is injective in every degree. The declaration is the existing API item, promoted once for explicit dependency use.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Dependencies: `CrystallineCohomology:CR.4/saturated-frobenius`.

Source: Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### The graded Frobenius is injective

Identifier: `CrystallineCohomology:CR.4/saturated-F-injective`. Declaration: `TauCeti.Crystalline.IsSaturated.F_injective`.

The graded Frobenius is injective. The declaration is the existing API item, promoted once for explicit dependency use.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Dependencies: `CrystallineCohomology:CR.4/saturated-frobenius`.

Source: Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### The image of F in degree n consists exactly of elements whose differential is p-divisible

Identifier: `CrystallineCohomology:CR.4/saturated-F-range`. Declaration: `TauCeti.Crystalline.IsSaturated.F_range`.

The image of F in degree n consists exactly of elements whose differential is p-divisible. The declaration is the existing API item, promoted once for explicit dependency use.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Dependencies: `CrystallineCohomology:CR.4/saturated-frobenius`.

Source: Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### F(Vx)=px in every degree

Identifier: `CrystallineCohomology:CR.4/verschiebung-FV`. Declaration: `TauCeti.Crystalline.verschiebung_FV`.

F(Vx)=px in every degree. The declaration is the existing API item, promoted once for explicit dependency use.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-identities`.

Source: Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### V(Fx)=px in every degree

Identifier: `CrystallineCohomology:CR.4/verschiebung-VF`. Declaration: `TauCeti.Crystalline.verschiebung_VF`.

V(Fx)=px in every degree. The declaration is the existing API item, promoted once for explicit dependency use.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-identities`, `CrystallineCohomology:CR.4/verschiebung-FV`, `CrystallineCohomology:CR.4/saturated-F-injective`.

Source: Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Vd=p dV; V is not assumed to be a chain map

Identifier: `CrystallineCohomology:CR.4/verschiebung-d`. Declaration: `TauCeti.Crystalline.verschiebung_d`.

Vd=p dV; V is not assumed to be a chain map. The declaration is the existing API item, promoted once for explicit dependency use.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-identities`, `CrystallineCohomology:CR.4/verschiebung-FdV`, `CrystallineCohomology:CR.4/verschiebung-VF`.

Source: Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### FdV=d in each degree

Identifier: `CrystallineCohomology:CR.4/verschiebung-FdV`. Declaration: `TauCeti.Crystalline.verschiebung_FdV`.

FdV=d in each degree. The declaration is the existing API item, promoted once for explicit dependency use.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-identities`, `CrystallineCohomology:CR.4/verschiebung-FV`, `CrystallineCohomology:CR.4/dieudonne-dF`, `CrystallineCohomology:CR.4/saturated-p-injective`.

Source: Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Morphisms of Dieudonné complexes

Identifier: `CrystallineCohomology:CR.4/dieudonne-morphism`. Declaration: `TauCeti.Crystalline.DieudonneHom`.

For two existing Dieudonné complexes M,N with the same p, a morphism is an ordinary cochain map f:M→N satisfying f_n F_M=F_N f_n in every integer degree. The cochain map is Mathlib’s HomologicalComplex.Hom; only its Frobenius compatibility is added.

Proof outline:

1. Bundle the ordinary cochain map and the displayed compatibility equation.
2. Use ordinary identity/composition for the API; Frobenius compatibility follows by substitution. Extensionality is HomologicalComplex.hom_ext plus proof irrelevance.

Dependencies: `CrystallineCohomology:CR.4/dieudonne-complex`, `mathlib:HomologicalComplex.Hom`, `mathlib:HomologicalComplex.hom_ext`.

API:

- `TauCeti.Crystalline.DieudonneHom.id` (constructor): The identity cochain map with its Frobenius compatibility.
- `TauCeti.Crystalline.DieudonneHom.comp` (functoriality): For f:M→N and g:N→P, g.comp(f) has degree map g_n∘f_n.
- `TauCeti.Crystalline.DieudonneHom.ext` (extensionality): Two morphisms equal on all elements in every degree are equal.
- `TauCeti.Crystalline.DieudonneHom.id_apply` (simp): The identity evaluates to x in each degree.
- `TauCeti.Crystalline.DieudonneHom.comp_apply` (simp): Composition evaluates to g_n(f_n(x)).

Acceptance tests:

- `TauCeti.Crystalline.hom_test_zero` (degenerate): The zero cochain map is a Dieudonné morphism.
- `TauCeti.Crystalline.hom_test_scalar` (computation): Multiplication by any integer a is a Dieudonné endomorphism.
- `TauCeti.Crystalline.hom_test_composition` (compatibility): Composition with the identity of the target returns the original morphism.
- `TauCeti.Crystalline.hom_test_F_compatibility` (non-example): A morphism between degree-zero Z groups with F source identity and F target multiplication by2 has zero degree-zero map. Ordinary cochain maps alone would allow identity.

Source: Definition2.1.1, arXivv3 p.13. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Morphisms commute with Verschiebung

Identifier: `CrystallineCohomology:CR.4/dieudonne-morphism-V`. Declaration: `TauCeti.Crystalline.DieudonneHom.comm_V`.

A Dieudonné morphism f between saturated M,N commutes with V in every degree.

Proof outline:

1. Apply F_N to both f(V_M x) and V_N(fx). Frobenius compatibility and FV=p identify both images with p f(x).
2. Cancel F_N using its promoted injectivity; no surjectivity of f is required.

Dependencies: `CrystallineCohomology:CR.4/dieudonne-morphism`, `CrystallineCohomology:CR.4/verschiebung-FV`, `CrystallineCohomology:CR.4/saturated-F-injective`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### The Verschiebung filtration

Identifier: `CrystallineCohomology:CR.4/verschiebung-filtration`. Declaration: `TauCeti.Crystalline.vFiltration`.

Set N_r^n(M)=im(V_n^r)+im(d_(n−1) V_(n−1)^r), as the sum of two existing Z-submodules of M^n. The endomorphism exponent is composition. The zeroth level is all of M^n.

Proof outline:

1. Use LinearMap.range and the submodule supremum; no new quotient or complex carrier is defined at this step.
2. The second summand uses degree n−1, including at n=0. The finite-support convention in the source is ordinary algebraic image, without closure.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-identities`, `mathlib:LinearMap.range`, `mathlib:Submodule.mem_sup`, `mathlib:Module.End.pow_apply`.

API:

- `TauCeti.Crystalline.mem_vFiltration` (characterisation): x belongs to N_r^n iff x=V_n^r(a)+d V_(n−1)^r(b), for a in M^n and b in M^(n−1).
- `TauCeti.Crystalline.vFiltration_zero` (simp): N_0^n=M^n because V^0 is identity.
- `TauCeti.Crystalline.vFiltration_antitone` (structure): For r≤s, N_s^n is contained in N_r^n.
- `TauCeti.Crystalline.vFiltration_d` (compatibility): d(N_r^n) is contained in N_r^(n+1).

Acceptance tests:

- `TauCeti.Crystalline.filtration_test_zero` (degenerate): Zero belongs to N_7^n.
- `TauCeti.Crystalline.filtration_test_V_identity` (computation): If V_n is identity and the incoming differential is zero, N_3^n=M^n.
- `TauCeti.Crystalline.filtration_test_zero_d_F_identity` (compatibility): If the incoming differential is zero and F_n is identity, N_r^n=p^r M^n.
- `TauCeti.Crystalline.filtration_test_d_summand` (non-example): At p=2 there is a saturated M and an element of N_1^1 outside im(V_1); dV(x) in the explicit test model is such an element.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Representatives in the Verschiebung filtration

Identifier: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`. Declaration: `TauCeti.Crystalline.mem_vFiltration`.

x∈N_r^n iff x=V_n^r(a)+d V_(n−1)^r(b) for some a∈M^n and b∈M^(n−1).

Proof outline:

1. Unfold the two ranges and apply Submodule.mem_sup. Reverse the displayed sum equality if necessary.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration`, `mathlib:Submodule.mem_sup`, `mathlib:LinearMap.mem_range`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Zeroth Verschiebung filtration

Identifier: `CrystallineCohomology:CR.4/verschiebung-filtration-zero`. Declaration: `TauCeti.Crystalline.vFiltration_zero`.

N_0^n=M^n for every n.

Proof outline:

1. V^0 is identity, so the first range is top. This holds without any assumption on the incoming differential.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration`, `mathlib:Module.End.pow_apply`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Decreasing Verschiebung filtration

Identifier: `CrystallineCohomology:CR.4/verschiebung-filtration-antitone`. Declaration: `TauCeti.Crystalline.vFiltration_antitone`.

The sequence r↦N_r^n is antitone.

Proof outline:

1. Write V^(r+1)=V^r∘V in both summands. This gives N_(r+1)⊆N_r, then iterate the inclusion for arbitrary r≤s.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `mathlib:Module.End.pow_apply`, `mathlib:LinearMap.range_comp_le_range`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Differential stability of the filtration

Identifier: `CrystallineCohomology:CR.4/verschiebung-filtration-d`. Declaration: `TauCeti.Crystalline.vFiltration_d`.

d maps N_r^n into N_r^(n+1).

Proof outline:

1. For x=V^r a+dV^r b, dx=dV^r a because d²=0. This is exactly the second summand in degree n+1.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `mathlib:HomologicalComplex.d_comp_d`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Frobenius lowers the filtration

Identifier: `CrystallineCohomology:CR.4/verschiebung-filtration-F`. Declaration: `TauCeti.Crystalline.vFiltration_F`.

F_n(N_(r+1)^n)⊆N_r^n.

Proof outline:

1. On V^(r+1)a, FV=p gives p V^r a. On dV^(r+1)b, FdV=d gives dV^r b. Both lie in the required two summands.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/verschiebung-FV`, `CrystallineCohomology:CR.4/verschiebung-FdV`, `mathlib:Module.End.pow_apply`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Verschiebung raises the filtration

Identifier: `CrystallineCohomology:CR.4/verschiebung-filtration-V`. Declaration: `TauCeti.Crystalline.vFiltration_V`.

V_n(N_r^n)⊆N_(r+1)^n.

Proof outline:

1. The first summand maps to V^(r+1)a. The second maps to p dV^(r+1)b by Vd=p dV.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/verschiebung-d`, `mathlib:Module.End.pow_apply`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Finite Verschiebung quotient complex

Identifier: `CrystallineCohomology:CR.4/finite-witt-quotient`. Declaration: `TauCeti.Crystalline.Wcomplex`.

For saturated M define W_r(M)^n=M^n/N_r^n using the existing submodule quotient, with differential [x]↦[dx]. Assemble it using CochainComplex.of in every integer degree. The notation W_r here is a quotient of a Dieudonné complex, not the pre-existing ring of truncated Witt vectors.

Proof outline:

1. The filtration stability supplies Submodule.mapQ for the differential. Apply d²=0 to representatives to prove the quotient differential squares to zero.
2. Use the actual quotient as each degree object. Wmk is the canonical linear projection with that codomain; its function is Submodule.Quotient.mk. No proposition-valued placeholder changes the carrier.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-d`, `mathlib:CochainComplex.of`, `mathlib:ModuleCat.ofHom`, `mathlib:Submodule.mapQ`, `mathlib:Submodule.Quotient.mk`, `mathlib:HomologicalComplex.d_comp_d`.

API:

- `TauCeti.Crystalline.Wmk` (constructor): The canonical linear quotient projection M^n→W_r(M)^n.
- `TauCeti.Crystalline.Wmk_surjective` (characterisation): Every class in W_r(M)^n is represented by an element of M^n.
- `TauCeti.Crystalline.Wmk_eq_zero` (characterisation): The class of x is zero iff x∈N_r^n.
- `TauCeti.Crystalline.Wcomplex_d_mk` (simp): The quotient differential sends the class of x to the class of dx.

Acceptance tests:

- `TauCeti.Crystalline.Wcomplex_test_zero_level` (degenerate): Every group of W_0(M) is zero.
- `TauCeti.Crystalline.Wcomplex_test_zero_complex` (degenerate): If M is degreewise zero, so is every W_r(M).
- `TauCeti.Crystalline.Wcomplex_test_V_surjective` (non-example): If V is surjective in every degree, all W_r(M) vanish, including rational degree-zero M with F identity.
- `TauCeti.Crystalline.Wcomplex_test_Z8` (computation): For M^0 identified with Z, zero incoming differential and F_0 identity at p=2, W_3(M)^0 is Z/8 as a Z-module.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Surjectivity of the quotient projection

Identifier: `CrystallineCohomology:CR.4/finite-witt-representatives`. Declaration: `TauCeti.Crystalline.Wmk_surjective`.

The degreewise map Wmk:M^n→W_r(M)^n is surjective.

Proof outline:

1. Reuse the baseline quotient representative theorem for the exact degree carrier.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.mkQ_surjective`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Zero classes in finite quotients

Identifier: `CrystallineCohomology:CR.4/finite-witt-zero-class`. Declaration: `TauCeti.Crystalline.Wmk_eq_zero`.

Wmk(x)=0 iff x∈N_r^n.

Proof outline:

1. Apply the existing submodule quotient zero criterion, with the explicit filtration as denominator.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.Quotient.mk_eq_zero`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Differential of a quotient representative

Identifier: `CrystallineCohomology:CR.4/finite-witt-differential`. Declaration: `TauCeti.Crystalline.Wcomplex_d_mk`.

d(Wmk(x))=Wmk(dx) in W_r(M)^(n+1).

Proof outline:

1. Unfold CochainComplex.of at adjacent indices and use mapQ_apply.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ_apply`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Projection to the finite quotient

Identifier: `CrystallineCohomology:CR.4/finite-witt-projection`. Declaration: `TauCeti.Crystalline.Wprojection`.

The degreewise projections Wmk assemble into a cochain map M→W_r(M).

Proof outline:

1. Use Wmk as the components and the promoted differential equation for the cochain-map axiom.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-quotient`, `CrystallineCohomology:CR.4/finite-witt-differential`, `mathlib:CochainComplex.ofHom`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-zero-class`.

API:

- `TauCeti.Crystalline.Wprojection_apply` (simp): Its degree-n component sends x to Wmk(x).
- `TauCeti.Crystalline.Wprojection_surjective` (characterisation): Every component is surjective.
- `TauCeti.Crystalline.Wprojection_kernel` (characterisation): The degree-n kernel is N_r^n.

Acceptance tests:

- `TauCeti.Crystalline.projection_test_level_zero` (degenerate): The projection to W_0 is zero.
- `TauCeti.Crystalline.projection_test_V_power` (computation): The projection kills V^r(x).
- `TauCeti.Crystalline.projection_test_dV_power` (non-example): The projection also kills dV^r(y), even when this element is not in im(V^r).

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Restriction between finite quotients

Identifier: `CrystallineCohomology:CR.4/finite-witt-restriction`. Declaration: `TauCeti.Crystalline.Wrestriction`.

The inclusion N_(r+1)⊆N_r induces a cochain map R_r:W_(r+1)(M)→W_r(M), represented by the identity on M.

Proof outline:

1. Apply mapQ to identity degreewise and use d-stability; compatibility with differentials is checked on representatives.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-antitone`, `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ`, `mathlib:CochainComplex.ofHom`, `CrystallineCohomology:CR.4/finite-witt-representatives`.

API:

- `TauCeti.Crystalline.Wrestriction_mk` (simp): R_r([x]_(r+1))=[x]_r.
- `TauCeti.Crystalline.Wrestriction_surjective` (characterisation): R_r is surjective in each degree.
- `TauCeti.Crystalline.Wprojection_restriction` (compatibility): Projection to level r+1 followed by R_r equals projection to level r.

Acceptance tests:

- `TauCeti.Crystalline.restriction_test_zero` (degenerate): R_0 has zero target and sends every class to zero.
- `TauCeti.Crystalline.restriction_test_two_steps` (computation): R_r R_(r+1)([x]_(r+2))=[x]_r.
- `TauCeti.Crystalline.restriction_test_d` (compatibility): Restriction commutes with the quotient differential.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Restriction on representatives

Identifier: `CrystallineCohomology:CR.4/finite-witt-restriction-formula`. Declaration: `TauCeti.Crystalline.Wrestriction_mk`.

R_r([x]_(r+1))=[x]_r.

Proof outline:

1. Use the defining identity lift and mapQ_apply.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-restriction`, `mathlib:Submodule.mapQ_apply`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Frobenius on finite quotients

Identifier: `CrystallineCohomology:CR.4/finite-witt-F`. Declaration: `TauCeti.Crystalline.WF`.

The map F induces Z-linear degree maps F_r:W_(r+1)(M)^n→W_r(M)^n sending [x] to [Fx].

Proof outline:

1. Apply mapQ to F using the promoted lowering inclusion. The relation with d follows on representatives from dF=pFd. Restriction compatibility follows because both routes represent Fx.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-F`, `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ`, `CrystallineCohomology:CR.4/dieudonne-dF`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-differential`, `CrystallineCohomology:CR.4/finite-witt-restriction-formula`.

API:

- `TauCeti.Crystalline.WF_mk` (simp): F_r([x]_(r+1))=[Fx]_r.
- `TauCeti.Crystalline.WF_d` (relation): d F_r=p F_r d, with the degree and level indices shown.
- `TauCeti.Crystalline.WF_restriction` (compatibility): R_r F_(r+1)=F_r R_(r+1) from level r+2 to r.

Acceptance tests:

- `TauCeti.Crystalline.WF_test_zero_level` (degenerate): F_0 has zero target.
- `TauCeti.Crystalline.WF_test_identity` (compatibility): If F is identity on M, F_r equals R_r.
- `TauCeti.Crystalline.WF_test_non_chain` (non-example): At p=2 there is a saturated M for which F_1:W_2→W_1 does not commute with d. The finite-support model described in the reader supplies a witness.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Frobenius on representatives

Identifier: `CrystallineCohomology:CR.4/finite-witt-F-formula`. Declaration: `TauCeti.Crystalline.WF_mk`.

F_r([x]_(r+1))=[Fx]_r.

Proof outline:

1. Apply mapQ_apply to the defining degree map.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-F`, `mathlib:Submodule.mapQ_apply`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Verschiebung on finite quotients

Identifier: `CrystallineCohomology:CR.4/finite-witt-V`. Declaration: `TauCeti.Crystalline.WV`.

The map V induces Z-linear degree maps V_r:W_r(M)^n→W_(r+1)(M)^n sending [x] to [Vx].

Proof outline:

1. Apply mapQ to V using the promoted raising inclusion. Vd=p dV gives the differential equation on quotient representatives.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-V`, `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ`, `CrystallineCohomology:CR.4/verschiebung-d`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-differential`, `CrystallineCohomology:CR.4/finite-witt-restriction-formula`.

API:

- `TauCeti.Crystalline.WV_mk` (simp): V_r([x]_r)=[Vx]_(r+1).
- `TauCeti.Crystalline.WV_d` (relation): V_r d=p d V_r, with the appropriate consecutive cochain degrees.
- `TauCeti.Crystalline.WV_restriction` (compatibility): R_(r+1) V_(r+1)=V_r R_r from level r+1 to itself.

Acceptance tests:

- `TauCeti.Crystalline.WV_test_zero_level` (degenerate): V_0 has zero source.
- `TauCeti.Crystalline.WV_test_identity_frobenius` (computation): If F is identity, V_r([x])=p[x] at level r+1.
- `TauCeti.Crystalline.WV_test_non_chain` (non-example): At p=2 there is a saturated M for which V_1:W_1→W_2 does not commute with d; the reader gives a witness.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Verschiebung on representatives

Identifier: `CrystallineCohomology:CR.4/finite-witt-V-formula`. Declaration: `TauCeti.Crystalline.WV_mk`.

V_r([x]_r)=[Vx]_(r+1).

Proof outline:

1. Apply mapQ_apply to the defining degree map.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-V`, `mathlib:Submodule.mapQ_apply`.

Source: Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Finite Frobenius after Verschiebung

Identifier: `CrystallineCohomology:CR.4/finite-witt-FV`. Declaration: `TauCeti.Crystalline.WFV`.

F_r V_r=p on W_r(M)^n, including r=0.

Proof outline:

1. Lift a class to M, use FV=p there, and apply the quotient map.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-F-formula`, `CrystallineCohomology:CR.4/finite-witt-V-formula`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/verschiebung-FV`.

Source: Remark2.5.2 and Definition2.6.1(5), arXivv3 pp.19,21. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Finite Verschiebung after Frobenius

Identifier: `CrystallineCohomology:CR.4/finite-witt-VF`. Declaration: `TauCeti.Crystalline.WVF`.

V_r F_r=p on W_(r+1)(M)^n. In particular p annihilates W_1(M).

Proof outline:

1. Lift a class to M and use VF=p. For r=0 the intermediate group W_0 is zero.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-F-formula`, `CrystallineCohomology:CR.4/finite-witt-V-formula`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/verschiebung-VF`.

Source: Remark2.5.2 and Definition2.6.1(5), arXivv3 pp.19,21. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Frobenius lifting after a divided differential

Identifier: `CrystallineCohomology:CR.4/verschiebung-divisibility-lift`. Declaration: `TauCeti.Crystalline.dV_pow_p_divisible`.

If d(V^r x) is divisible by p in M^(n+1), then x belongs to im(F_n).

Proof outline:

1. Iterating FdV=d gives dx=F^r d(V^r x). A p-divisible input remains p-divisible under the Z-linear F^r.
2. Apply the promoted characterization of the image of F.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-FdV`, `CrystallineCohomology:CR.4/saturated-F-range`, `mathlib:Module.End.pow_apply`.

Source: Lemma2.6.3 with proof, arXivv3 p.21; published p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Multiplication by p raises the filtration

Identifier: `CrystallineCohomology:CR.4/verschiebung-filtration-p-shift`. Declaration: `TauCeti.Crystalline.vFiltration_p_shift`.

For x∈N_r^n, px∈N_(r+1)^n.

Proof outline:

1. FV=VF=p implies pV^r a=V^(r+1)Fa. Z-linearity gives p dV^r b=dV^(r+1)Fb.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/verschiebung-VF`, `CrystallineCohomology:CR.4/verschiebung-FV`, `mathlib:Module.End.pow_apply`.

Source: Proof of Proposition2.6.2, axiom(7), arXivv3 p.22; published p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Cancellation across filtration levels

Identifier: `CrystallineCohomology:CR.4/verschiebung-filtration-p-cancellation`. Declaration: `TauCeti.Crystalline.vFiltration_p_cancel`.

If px∈N_(r+1)^n, then x∈N_r^n.

Proof outline:

1. Write px=V^(r+1)a+dV^(r+1)b. Differentiating gives dV^(r+1)a=p dx; the lifting lemma writes a=Fa′.
2. Substitute and use V^(r+1)F=pV^r. The residual dV^(r+1)b is p-divisible, so b=Fb′ by the same lemma.
3. The resulting equality is px=p(V^r a′+dV^r b′). Cancel p in M^n.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/verschiebung-divisibility-lift`, `CrystallineCohomology:CR.4/verschiebung-VF`, `CrystallineCohomology:CR.4/verschiebung-FV`, `CrystallineCohomology:CR.4/saturated-p-injective`, `mathlib:HomologicalComplex.d_comp_d`.

Source: Lemma2.6.4 with proof, arXivv3 p.22; published p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Restriction kernel and p-torsion

Identifier: `CrystallineCohomology:CR.4/finite-witt-restriction-kernel`. Declaration: `TauCeti.Crystalline.Wrestriction_kernel`.

For x∈W_(r+1)(M)^n, R_r(x)=0 iff px=0. This is the kernel of restriction, not the kernel of Frobenius.

Proof outline:

1. Represent x by a∈M^n. R_r(x)=0 means a∈N_r; px=0 means pa∈N_(r+1).
2. Use p-shift and p-cancellation for the two implications.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-zero-class`, `CrystallineCohomology:CR.4/finite-witt-restriction-formula`, `CrystallineCohomology:CR.4/verschiebung-filtration-p-shift`, `CrystallineCohomology:CR.4/verschiebung-filtration-p-cancellation`.

Source: Proposition2.6.2, verification of Definition2.6.1(7), arXivv3 p.22; published p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Finite Frobenius lifting

Identifier: `CrystallineCohomology:CR.4/finite-witt-F-lifting`. Declaration: `TauCeti.Crystalline.WF_lift`.

If x∈W_r(M)^n has d x divisible by p in W_r(M)^(n+1), then x has a preimage under F_r:W_(r+1)(M)^n→W_r(M)^n.

Proof outline:

1. For r=0 take the zero preimage, since W_0=0. For r≥1 lift the equation to dx=py+V^r a+dV^r b.
2. Differentiate: dV^r a is p-divisible, hence a=Fa′. Then d(x−V^r b)=p(y+V^(r−1)a′).
3. Saturation lifts x−V^r b to Fz. Modulo N_r it has the same class as x, so the class of z at level r+1 is the required preimage.

Dependencies: `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-zero-class`, `CrystallineCohomology:CR.4/finite-witt-differential`, `CrystallineCohomology:CR.4/finite-witt-F-formula`, `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/verschiebung-divisibility-lift`, `CrystallineCohomology:CR.4/verschiebung-VF`, `CrystallineCohomology:CR.4/saturated-F-range`, `mathlib:HomologicalComplex.d_comp_d`.

Source: Proposition2.6.2, verification of Definition2.6.1(6), arXivv3 p.22; published p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Annihilation at finite level

Identifier: `CrystallineCohomology:CR.4/finite-witt-p-power`. Declaration: `TauCeti.Crystalline.Wcomplex_p_pow`.

Multiplication by p^r annihilates every group W_r(M)^n. No torsionfreeness of the finite quotient is asserted.

Proof outline:

1. Start with every a∈N_0 and apply p-shift r times. Then p^r a∈N_r, so its class is zero.

Dependencies: `CrystallineCohomology:CR.4/verschiebung-filtration-zero`, `CrystallineCohomology:CR.4/verschiebung-filtration-p-shift`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-zero-class`.

Source: Consequence of Proposition2.6.2, axiom(7), arXivv3 p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

### Functorial finite quotients

Identifier: `CrystallineCohomology:CR.4/finite-witt-map`. Declaration: `TauCeti.Crystalline.DieudonneHom.Wmap`.

A Dieudonné morphism f between saturated M,N induces a cochain map W_r(f):W_r(M)→W_r(N), represented by f in every degree.

Proof outline:

1. Commutation with V gives fV^r=V^r f; the existing cochain-map identity gives f dV^r=dV^r f. Hence f maps each N_r(M) into N_r(N).
2. Use mapQ and the ordinary cochain-map constructor. Identity/composition and compatibility with R,F,V are checked on representatives.

Dependencies: `CrystallineCohomology:CR.4/dieudonne-morphism`, `CrystallineCohomology:CR.4/dieudonne-morphism-V`, `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:HomologicalComplex.Hom.comm`, `mathlib:Submodule.mapQ`, `mathlib:Submodule.mapQ_comp`, `mathlib:Submodule.mapQ_id`, `mathlib:CochainComplex.ofHom`.

API:

- `TauCeti.Crystalline.DieudonneHom.Wmap_mk` (simp): W_r(f)([x])=[f(x)].
- `TauCeti.Crystalline.DieudonneHom.Wmap_restriction` (compatibility): W_(r+1)(f) followed by R_N equals R_M followed by W_r(f).
- `TauCeti.Crystalline.DieudonneHom.Wmap_F` (compatibility): The induced degree maps commute with F_r at the two consecutive quotient levels.
- `TauCeti.Crystalline.DieudonneHom.Wmap_V` (compatibility): The induced degree maps commute with V_r at the two consecutive quotient levels.
- `TauCeti.Crystalline.DieudonneHom.Wmap_id` (functoriality): W_r of the identity is identity.
- `TauCeti.Crystalline.DieudonneHom.Wmap_comp` (functoriality): W_r(g∘f)=W_r(g)∘W_r(f).

Acceptance tests:

- `TauCeti.Crystalline.Wmap_test_identity` (computation): The induced identity map fixes each quotient class.
- `TauCeti.Crystalline.Wmap_test_zero` (degenerate): A morphism with zero underlying cochain map induces the zero map.
- `TauCeti.Crystalline.Wmap_test_level_zero` (degenerate): Every induced map at level zero is zero.

Source: Remark2.5.3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

## Added source findings

**CrystallineCohomology/E7 — Proof of Proposition2.6.2, verifying axiom(6), printedp.22 of Astérisque424; also arXivv3p.22.** The printed text is “so that have”. Insert we: so that we have. The sentence introduces the lifted equality for a chosen representative; its subject is missing. Confirmed in the rendered published page and in the preprint text. No correction located in the bounded search; novelty is not established.

**CrystallineCohomology/E8 — Proof of Proposition2.6.5, final sentence, printedp.23 of Astérisque424; also arXivv3p.23.** The printed text is “is determines”. Delete is: determines. The compatible sequence is the subject of determines; the extra verb is grammatical, with no change to the construction. Confirmed in the rendered published page and in the preprint text. No correction located in the bounded search; novelty is not established.

## Validation boundary

The packet has 84 nodes: nine definitions, seventeen constructions, fifty-three
lemmas and five theorems. It contains 91 API entries, 82 tests, eleven planets
and 79 pinned baseline citations. The finite quotient section contains eighteen
API promotions. Each promotion points to one Lean declaration, without a
duplicate. The completion aggregate imports its exact finite suppliers.

The combined suggested file compiles with zero errors and 217 warnings, all
proof placeholders. The new quotient degree objects and their differentials
are explicit on the existing module quotient and cochain-complex carriers.
All 37 finite-quotient node signatures, 31 API entries and 27 tests are typed.
The nine filtration declarations, three API entries and three tests are also typed.
Three inherited aggregate signatures, seven API entries and six tests remain
comment-only. Their associated source targets and gaps are retained, and the
compilation claim excludes those unstated forms. Every node remains unchecked.

The transitive source audit excludes imports mentioned inside documentation:
2,101 Mathlib files match the pinned source bytes, and two Tau Ceti modules use
the preceding pinned build after source, object and sidecar hash verification.
The numerical examples are acceptance checks rather than proofs.

Ten gaps, one supplier request and no closed stage remain. The indexed
blueprint checker, authorized-file intake, API/test correspondence and
preservation checks are recorded in the handoff. The internal dependency DAG
is distinct from a certificate for every stage edge in the atlas. Independent
review must verify the source matches, proofs and unresolved interfaces.

## Classical divided power filtration

Fix a commutative ring R, an ideal I and a divided-power structure γ on I. This construction uses the pinned Ideal and DividedPowers carriers. The filtration records total divided-power degree, which differs from ordinary ideal degree in mixed characteristic. Stacks60.6 defines it in the unnumbered paragraph between Lemmas60.6.2 and60.6.3; there is no numbered filtration definition in that passage.

Write Fⁿ_γI=I^[n]. The empty word has value1 and weight0. Zero weights are allowed: each corresponding factor equals1, so erasing it preserves the represented product and weight. These conventions give an ideal at every natural index and avoid a separate, incompatible degree-zero definition. The universal containment criterion is the span universal property; the membership API supports computations without unfolding the finite-word presentation.

RS-01 assigns ordinary PD envelopes and their coefficient constructions to CR.0. This ideal-valued filtration stays with that owner. DD.0/1 supply derived divided powers and derived completion; DD.4 consumes crystalline comparison data. The present definition therefore neither creates a derived filtration nor replaces a completion theorem. The similarly named TauCeti.AdditiveGroup.coactFiltration is a filtration of additive-group comodules, with different input and output types.

### Divided power filtration

`CrystallineCohomology:CR.0/pd-filtration` — `TauCeti.PD.pdFiltration`.

For n≥0 define Fⁿ_γI, also denoted I^[n], as the ideal generated by all finite products γ_(e₁)(x₁)⋯γ_(eₜ)(xₜ), where xⱼ∈I, eⱼ≥0 and ∑eⱼ≥n. Include the empty product with total degree zero. Thus the convention at n=0 is intrinsic to the same formula. The carrier is Ideal R and the operations are those of the given DividedPowers I.

Form the set of values of finite lists of pairs (e,x) with e a natural number and x in I, retaining precisely those lists of total weight at least n. Take its existing Ideal.span. The span universal property gives the containment criterion; Ideal.subset_span gives word membership. A singleton list gives γ_n(x) membership. Zero weights contribute γ₀(x)=1, so they can be deleted without changing the product or total weight. The zero-ideal tests use the pinned dividedPowersBot and DividedPowers.dpow_eval_zero. For the characteristic-two control use PadicInt.coe_dpow_eq to calculate γ₂(2)=2; Ideal.span_singleton_pow and the valuation criterion exclude 2 from (2)².

Prerequisites: `mathlib:DividedPowers`, `mathlib:Ideal.span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`, `mathlib:dividedPowersBot`, `mathlib:DividedPowers.dpow_eval_zero`, `mathlib:PadicInt.dividedPowers`, `mathlib:PadicInt.coe_dpow_eq`, `mathlib:PadicInt.valuation_p`, `mathlib:PadicInt.mem_span_pow_iff_le_valuation`, `mathlib:Ideal.span_singleton_pow`.

Acceptance: The same formula handles n=0 without imposing a nonempty-word convention. The characteristic-two control distinguishes divided-power degree from ordinary ideal powers.

The basic API is:

- `TauCeti.PD.pdFiltration_le_iff`: For any ideal K of R, Fⁿ_γI⊆K if and only if every finite weighted product of total degree at least n belongs to K.
- `TauCeti.PD.prod_dpow_mem_pdFiltration`: For xⱼ∈I and natural weights eⱼ whose sum is at least n, the product ∏ⱼγ_(eⱼ)(xⱼ) belongs to Fⁿ_γI, including the empty word when n=0.
- `TauCeti.PD.dpow_mem_pdFiltration`: For x∈I and n≥0, γ_n(x) belongs to Fⁿ_γI.

The definition tests are:

- `pd_filtration_empty_word`: For the zero ideal with its pinned dividedPowersBot structure, F⁰(0)=R; the empty word supplies 1 even in this case.
- `pd_filtration_zero_ideal`: For the zero ideal with dividedPowersBot and every n>0, Fⁿ(0)=0, because a word of positive total weight has a positive-weight factor evaluated at zero.
- `pd_filtration_two_adic_counterexample`: For R=ℤ₂, I=(2) and the canonical PadicInt.dividedPowers 2, the element 2 lies in F²I but not in I². Indeed γ₂(2)=2 and v₂(2)=1<2.

These tests reject three distinct errors: omitting the empty product, allowing nonzero positive stages on the zero ideal, and substituting ordinary ideal powers for the weighted filtration. In the third test γ₂(2)=2²/2!=2 in ℤ₂, while I²=(4) excludes2 by its valuation. This example makes no ordinary-nilpotence assertion about (2).

### Zeroth divided power filtration step

`CrystallineCohomology:CR.0/pd-filtration-zero` — `TauCeti.PD.pdFiltration_zero`.

For every divided-power ideal (I,γ), F⁰_γI=R, as an equality of ideals.

The empty list has weight zero and product 1, so Ideal.subset_span puts 1 in F⁰_γI. Apply Ideal.eq_top_iff_one. This proof also covers the zero ring.

Prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `mathlib:Ideal.subset_span`, `mathlib:Ideal.eq_top_iff_one`.

Acceptance: The zero ideal has a nonzero zeroth stage in every nonzero ring.

### First divided power filtration step

`CrystallineCohomology:CR.0/pd-filtration-one` — `TauCeti.PD.pdFiltration_one`.

For every divided-power ideal (I,γ), F¹_γI=I.

A list with total weight at least one has a positive weight eⱼ. The pinned DividedPowers.dpow_mem places that factor in I; multiplication by the remaining factors preserves I. Apply Ideal.span_le. For x∈I the singleton list (1,x) generates γ₁(x)=x, by DividedPowers.dpow_one and Ideal.subset_span.

Prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `mathlib:DividedPowers`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

Acceptance: The index-one identity is equality with the specified ideal, not with its radical.

### Decreasing divided power filtration

`CrystallineCohomology:CR.0/pd-filtration-antitone` — `TauCeti.PD.pdFiltration_antitone`.

The function n↦Fⁿ_γI is antitone: if n≤m, then Fᵐ_γI⊆Fⁿ_γI.

A word of total weight at least m also has total weight at least n. Apply Ideal.span_mono to the inclusion of generating sets.

Prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `mathlib:Ideal.span_mono`.

Acceptance: The inclusion direction follows increasing thresholds, including n=0.

### Multiplicativity of divided power filtration

`CrystallineCohomology:CR.0/pd-filtration-mul` — `TauCeti.PD.pdFiltration_mul`.

For all m,n≥0, (Fᵐ_γI)(Fⁿ_γI)⊆F^(m+n)_γI.

Use Ideal.span_mul_span to reduce the product of generated ideals to pairwise products of generating words. Concatenate the two finite lists. Its total weight is the sum of the weights and its value is the product of the two values. Ideal.subset_span puts this concatenated word in F^(m+n)_γI; Ideal.span_le completes the inclusion.

Prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `mathlib:Ideal.span_mul_span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

Acceptance: Empty words make the m=0 and n=0 cases consistent with the ordinary unit ideal.

### Ordinary powers inside divided powers

`CrystallineCohomology:CR.0/pd-filtration-ordinary-powers` — `TauCeti.PD.pow_le_pdFiltration`.

For every n≥0, Iⁿ⊆Fⁿ_γI, with the usual ideal power on the left.

Induct on n. The base case is pdFiltration_zero and I⁰=R. For the successor multiply the induction inclusion by I=F¹_γI using pdFiltration_one. Apply pdFiltration_mul and the ordinary ideal-power recursion.

Prerequisites: `CrystallineCohomology:CR.0/pd-filtration-zero`, `CrystallineCohomology:CR.0/pd-filtration-one`, `CrystallineCohomology:CR.0/pd-filtration-mul`.

Acceptance: For the canonical divided powers on (2) in ℤ₂ the n=2 inclusion is strict.

### Divided power maps preserve filtration

`CrystallineCohomology:CR.0/pd-filtration-map` — `TauCeti.PD.map_pdFiltration_le`.

Let f:R→S be a ring homomorphism, J an ideal of S and δ a divided-power structure on J. If f is a divided-power morphism from (I,γ) to (J,δ), then f(Fⁿ_γI)S⊆Fⁿ_δJ for every n≥0, where the left side is Ideal.map.

Use Ideal.map_span and Ideal.span_le to test images of generating words. The defining ideal-containment condition sends every xⱼ∈I into J. DividedPowers.IsDPMorphism.map_dpow and multiplicativity of f identify the image with the word of the same weights in J. Apply Ideal.subset_span.

Prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `mathlib:DividedPowers.IsDPMorphism`, `mathlib:DividedPowers.IsDPMorphism.map_dpow`, `mathlib:Ideal.map_span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

Acceptance: No flatness or surjectivity is needed for this inclusion; identity and composition give the expected containments.

### Surjective divided power maps and filtration

`CrystallineCohomology:CR.0/pd-filtration-map-surjective` — `TauCeti.PD.map_pdFiltration_of_surjective`.

In the setting of map_pdFiltration_le, assume f:R→S is surjective and I.map(f)=J. Then (Fⁿ_γI).map(f)=Fⁿ_δJ for every n≥0.

One inclusion is pd-filtration-map. For each entry yⱼ∈J of a generating word use I.map(f)=J and Ideal.mem_map_iff_of_surjective to choose xⱼ∈I with f(xⱼ)=yⱼ. Keep its weight eⱼ. The lifted word belongs to Fⁿ_γI by Ideal.subset_span. Preservation of divided powers identifies its image with the given target word. Ideal.map_span and Ideal.span_le yield the reverse containment.

Prerequisites: `CrystallineCohomology:CR.0/pd-filtration-map`, `mathlib:Ideal.mem_map_iff_of_surjective`, `mathlib:DividedPowers.IsDPMorphism.map_dpow`, `mathlib:Ideal.map_span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

Acceptance: For a compatible quotient PD structure, the quotient filtration is the image of the original filtration. The hypothesis on the ideal image is retained; surjectivity of the ring homomorphism alone does not specify the target PD ideal.

### Rational divided powers equal ordinary powers

`CrystallineCohomology:CR.0/pd-filtration-rational` — `TauCeti.PD.pdFiltration_eq_pow_of_ratAlgebra`.

If R is a ℚ-algebra, then for every ideal I, every divided-power structure γ on I and n≥0, Fⁿ_γI=Iⁿ.

For x∈I the pinned DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul gives γ_e(x)=(1/e!)xᵉ, including e=0. By Ideal.pow_mem_pow, xᵉ belongs to Iᵉ. Multiplication by the rational scalar preserves that ideal. Induction on word length places each product of weight w in Iʷ. For w≥n, Ideal.pow_le_pow_right gives Iʷ⊆Iⁿ. Ideal.span_le yields Fⁿ_γI⊆Iⁿ. The reverse inclusion is pd-filtration-ordinary-powers.

Prerequisites: `CrystallineCohomology:CR.0/pd-filtration-ordinary-powers`, `mathlib:DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul`, `mathlib:Ideal.pow_mem_pow`, `mathlib:Ideal.pow_le_pow_right`, `mathlib:Ideal.span_le`.

Acceptance: This supplies the precise comparison with existing ideal powers in characteristic zero; the ℤ₂ counterexample prevents removing the ℚ-algebra assumption.

### Source use and remaining contracts

The filtration paragraph supplies the definition and the two basic ideal-power comparisons. The additional monotonicity, multiplication and morphism formulas are elementary consequences whose proof routes are spelled out above; they are not attributed to separately numbered Stacks theorems. The rational equality also uses the pinned factorial formula for every divided-power structure over a ℚ-algebra.

Lemma60.6.3 uses the PD square in the diagonal presentation of PD differentials. Remark60.6.4 uses filtration lowering by the PD differential. The actual PD-differential object and its comparison arguments require their own decomposition. Reading those passages for the uses of the filtration does not establish that decomposition.

The weighted ideal, F⁰=R, F¹=I, decreasingness, multiplication, ordinary-power inclusion, PD-morphism image and surjective-image formulas, and rational comparison are decomposed. Prove the stronger γ_m(FⁿI)⊆F^(mn)I with its finite-sum/iteration argument, then develop PD nilpotence and specialize the existing DividedPowers.Quotient.dividedPowers to these filtration ideals after proving their IsSubDPIdeal condition. Generic quotient divided powers already exist at the pin. Establish the exact completion contracts. Envelope localization/transitivity and regular-immersion examples remain. Import DD.0/1 for derived powers and completion; the ordinary filtration does not provide those constructions.

Three source slips were recorded while reading these uses. Finding `CrystallineCohomology/E501`: in the final composition of60.6.3 the denominator requires parentheses; the earlier occurrence was corrected by commit9f6cc4f, but its patch does not change this remaining occurrence. Finding `CrystallineCohomology/E502`: in the second proof of60.6.6, “to divided” reads “to divide”. Finding `CrystallineCohomology/E503`: the tensor bases at the ends of its two cases are B and P, as specified by the surrounding maps and the cited quotient-differentials exact sequence00RU. The complete local comment lists and current chapter were checked; the findings await independent review.
