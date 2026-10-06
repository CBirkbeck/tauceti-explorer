# Crystalline cohomology, de Rham–Witt and logarithmic foundations

This is the target-level plan for CR.0–CR.4, including the Frobenius-isogeny
and duality successors of CR.3. It continues the retained divided-power and
finite-Verschiebung declarations into universal envelopes, crystalline
coefficients, the PD Poincaré computation, proper cohomology, Frobenius,
duality and the classical, saturated and relative Witt complexes.

The [packet](../packets/CrystallineCohomology--CR.0.json) is complete for this
target pass. All seven stages are planned; none is closed. Every prerequisite
chain ends in a statement-read pinned library declaration, an owning roadmap's
named node or requested contract, or an explicit gap. The exact source and
signature obligations are part of the plan. No implementation is claimed.

The [suggested file](../suggested/CrystallineCohomology--CR.0.lean) proposes
forms on the existing carriers and elaborates at the pinned Mathlib. Its
proof placeholders supply no mathematical proof. The signature inventory
distinguishes elaborated declarations and examples from wider contracts and
forms whose actual supplier conditions are not yet expressible. The
[handoff](../handoff/BP-CrystallineCohomology--CR.0.md) states the continuation
required to close each stage.

## Conventions and ownership

A PD ring is a commutative unital ring A, an ideal I and the existing
DividedPowers I. Its ambient-ring operations satisfy γ₀(x)=1 and γ₁(x)=x on
I; outside I every operation is zero, including degree zero. Thus equality
on a smaller ideal is restriction of operations, rather than equality of
the total functions on the ambient ring. The multiplication coefficient is
binom(m+n,m), and the iteration coefficient is the integer
(mn)!/(m!(n!)ᵐ), formed before mapping into A. Factorial division inside a
torsion ring never defines these operations.

Ordinary nilpotence, PD nilpotence, local nilpotence of p and p-adic
completeness are different conditions. In Z₂ the canonical γ₂(2)=2 rules out
PD nilpotence of (2), even though finite quotients have nilpotent p.
Weighted divided-power degree defines Fⁿ_γI; ordinary powers are contained
in it and agree over rational algebras. These distinctions govern envelopes,
site admissibility and ordinary completion.

The accepted [RS-01](../restructure/RS-01.md) retains CR.0 as the owner of
ordinary universal PD envelopes and the common completed A_cris coefficient
object. DerivedDeRhamCohomology:DD.0 owns derived powers, the cotangent
complex and the ordinary de Rham supplier; DD.1 owns derived completion.
AInfCohomology:AI.0 supplies the Fontaine and generic Witt data, and AI.1
supplies generic η and Lη. The rational period rings remain in
PadicHodgeTheory:R06.1 and geometric comparison diagrams in
CohomologyComparisons. In the Fontaine presentation p is not in kerθ; the
base (Z_p,0), its envelope and the enlarged PD ideal (p)+kerθ must be kept
distinct.

EnhancedDerivedSheaves:E1/E2 owns sheaves of modules, ringed-site functors,
enhanced derived images and exact limit/descent infrastructure. This plan
owns the actual crystalline thickening categories, covers and coefficients,
and applies the imported functors to them. Proper coherent cohomology and
Künneth input belongs to AlgebraicModuliForArithmeticGeometry:A0-extension.
FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 supplies elliptic
Dieudonné realization; its existing classification and Tau Ceti's
finite-field elliptic geometry are imported unchanged.

For Witt complexes cochain degrees are integers and the geometric DGAs are
concentrated in nonnegative degrees. The convention includes odd-square
vanishing, also at p=2. The relation is dF=pFd. On saturated complexes FV=VF=p;
in an arbitrary-base relative Witt procomplex FV=p and VF is multiplication
by V(1). Geometric Frobenius is degree-scaled φ^q=p^qF after its actual base
twist. A semilinear cohomology operator does not define a site F-crystal.

CR.4 owns ordinary and relative Witt forms and the crystalline Witt models
used by Disegni–Liu. CR.5:log-algebra supplies the fine log schemes and log
forms, CR.5 log sites/Poincaré/descent, and CR.6 monodromy and Hyodo–Kato.
The added Temkin and Qian material is assigned to these log and semistable
owners outside this part's seven-stage scope. RD.3 supplies convergent
objects and tube proper support; the Witt comparison maps do not identify
arbitrary tube support with étale extension by zero.

## What the pinned libraries supply

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The reviewed library audit has no
focal crystalline entries at the starting snapshot; the audit leads were
checked directly in source. Existing DividedPowers, PD morphisms, sub-PD
ideals, quotient descent, flat algebra carriers and Γ_A(M) are reused.
The quotient construction requires positive-PD stability of K∩I. The
existing Γ weak lift into a given PD target does not give a canonical PD
structure on its source augmentation ideal; that structure is a new target.

Ordinary Kähler differentials, schemes with affine-local ideal data,
cochain complexes, sheaves of modules, full subcategories, induced
topologies, regular sequences and the genuine infinite and truncated Witt
carriers are present. The suggested file imports individual Mathlib modules
for these objects. It uses the factorial-normalized rational formula to
compare with the statement-read Tau Ceti associative divided power; it has
no Tau Ceti import whose object cannot be checked in the shared build.
The complete baseline declaration register follows the mathematical stages.

Current inventory: 18 definition, 54 lemma, 39 construction, 28 theorem, 10 comparison, 1 application; 184 API entries, 175 unit tests, 32 planets and 91 pinned baseline references.

## CR.0 — Divided powers and universal thickenings

Begin with additive candidates, whose missing multiplication and iteration
identities are checked on generators and propagated through sums and
scalar multiples. The convolution on compatible ideals must be independent
of the decomposition of an element. Principal extension and flat extension
have different hypotheses; finite scalar substitution is the essential
presentation-independence calculation for the flat case.

The augmentation sequence on the pinned Γ carrier splits into scalars and
positive degree. Its characteristic-two degree-two detector prevents the
false assertion that degree-one generators generate the augmentation ideal.
The weighted PD filtration is decreasing and multiplicative, is preserved by
PD morphisms and by surjective maps with exact ideal image, and satisfies
γ_m(FⁿI)⊆F^(mn)I. This gives genuine PD-stable quotient ideals.

Canonical augmentation powers make free Γ into a PD polynomial algebra,
whose divided-monomial basis and tuple universal property present universal
base-compatible envelopes. The envelope uses the PD closure of the relation
ideal on Γ_B(J), rather than an unspecified initial object. Quotient
transitivity, the two exact base-change theorems, localization and regular
immersion computations follow on that presentation. The ordinary completed
PD ring is obtained only with the continuous-operation and torsion
certificates; its derived comparison is imported from DD.1. The Fontaine
target supplies this common envelope to AI and comparison consumers.

Acceptance checks require the characteristic-two Γ detector, the Z₂
filtration example, the polynomial binomial product, the zero-envelope
identity, exact ideal image in surjective filtration comparison, and
retention of every Tor/flatness condition in base change. The arbitrary-module
canonical-PD descent and ordinary completion certificates remain proof gates.

Atlas planets: Divided-power generator criterion; Divided powers on a sum of ideals; Principal divided-power extension; Flat divided-power extension; Divided power filtration; Divided power envelope.

Coverage: planned. 51 declaration nodes. The following register states each mathematical target, its direct inputs and source-guided proof.

### Additive divided-power candidates

**Node:** CrystallineCohomology:CR.0/additive-powers. **Kind:** definition.

**Declaration:** `TauCeti.PD.AdditivePowers`. All implementation status remains unchecked.

For an ideal I⊂A, an additive divided-power candidate consists of maps δₙ:A→A, zero outside I, with δ₀(x)=1 and δ₁(x)=x on I, δₙ(I)⊂I for n>0, δₙ(x+y)=Σᵢ₊ⱼ₌ₙδᵢ(x)δⱼ(y), and δₙ(ax)=aⁿδₙ(x). Multiplication and iteration identities are not assumed. This auxiliary data organizes the generator criterion; a divided power structure remains the existing DividedPowers type.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Collect precisely axioms (1),(3),(4) and ideal membership from Stacks 23.2.4.
2. Use total functions with the same outside-ideal convention as the existing DividedPowers structure.

Direct prerequisites: `mathlib:DividedPowers`, `mathlib:DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul`, `tauceti:TauCeti.Associative.dividedPower`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.4 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> (2) and (5)

API outline:

- `TauCeti.PD.AdditivePowers.ofDividedPowers` (constructor): Every existing PD structure gives its additive candidate without changing any operation.
- `TauCeti.PD.AdditivePowers.ofDividedPowers_dpow` (compatibility): The candidate operation obtained from γ is exactly γₙ on every element, including outside I.
- `TauCeti.PD.AdditivePowers.ext` (extensionality): Candidates with equal operations on I coincide.

Unit tests:

- `TauCeti.PD.test_candidate_zero_index` (degenerate): Degree zero at zero is one.
- `TauCeti.PD.test_candidate_positive_at_zero` (computation): Degree two at zero is zero.
- `TauCeti.PD.test_candidate_rational` (compatibility): Over Q, a candidate induced by γ agrees on I with the existing rational associative divided power.

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The multiplication identity is stable under sums

**Node:** CrystallineCohomology:CR.0/multiplication-addition. **Kind:** lemma.

**Declaration:** `TauCeti.PD.AdditivePowers.mul_at_add`. All implementation status remains unchecked.

For an additive candidate δ, suppose the identities δₘ(z)δₙ(z)=choose(m+n,m)δₘ₊ₙ(z) hold for every m,n at each of x,y∈I. They then hold at x+y.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Expand both operations at x+y by the addition law and rearrange the finite four-index sum.
2. Apply the multiplication identity separately at x and y. For fixed exponents a+b=m+n, the resulting coefficient is the Vandermonde sum Σ choose(a,i)choose(b,m−i)=choose(m+n,m).
3. This is an identity of natural integers before casting to A; the source also checks its coefficients in Q[X,Y].

Direct prerequisites: `CrystallineCohomology:CR.0/additive-powers`, `mathlib:Nat.add_choose_eq`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.4 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> (2) and (5)

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The iteration identity is stable under sums

**Node:** CrystallineCohomology:CR.0/iteration-addition. **Kind:** lemma.

**Declaration:** `TauCeti.PD.AdditivePowers.comp_at_add`. All implementation status remains unchecked.

For an additive candidate δ satisfying the multiplication identity on all I, suppose δₘ(δₙ(z))=uniformBell(m,n)δₘₙ(z) for all m and n>0 at x,y∈I. It holds at x+y.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Expand δₙ(x+y), then expand δₘ of that finite sum. The positive inner degree ensures every summand is in I.
2. Apply scalar homogeneity to δₖ(δᵢ(x)δⱼ(y)); use iteration at x if i>0 and at y if i=0. Reduce repeated products using the multiplication identity.
3. Collect coefficients of δₐ(x)δᵦ(y), a+b=mn. Verify their universal integer values by the same calculation in Q[X,Y], where these divided monomials are linearly independent. The coefficient is uniformBell(m,n). No injection of A into a rational algebra is assumed.

Direct prerequisites: `CrystallineCohomology:CR.0/additive-powers`, `CrystallineCohomology:CR.0/multiplication-addition`, `mathlib:MvPolynomial.basisMonomials`, `mathlib:DividedPowers.RatAlgebra.dividedPowers`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.4 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> (2) and (5)

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Divided powers from identities on generators

**Node:** CrystallineCohomology:CR.0/generator-criterion. **Kind:** construction.

**Declaration:** `TauCeti.PD.AdditivePowers.toDividedPowers`. All implementation status remains unchecked.

Let δ be an additive candidate on I and S⊂A with I=span(S). If multiplication and positive-inner-index iteration hold at every s∈S, construct the existing DividedPowers I with operation δ. No freeness, factorial invertibility, or nilpotence is required.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Propagate multiplication from S to its scalar multiples using homogeneity; use multiplication-addition and induction on ideal span to obtain the identity everywhere.
2. Propagate iteration under scalar multiplication using homogeneity twice. Apply iteration-addition and span induction to obtain the iteration identity on all I.
3. Fill exactly the two missing fields of DividedPowers. The underlying operations are unchanged.

Direct prerequisites: `CrystallineCohomology:CR.0/additive-powers`, `CrystallineCohomology:CR.0/multiplication-addition`, `CrystallineCohomology:CR.0/iteration-addition`, `mathlib:DividedPowers`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.4 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> (2) and (5)

API outline:

- `TauCeti.PD.AdditivePowers.toDividedPowers_dpow` (simp): The result uses δₙ exactly on all A.
- `TauCeti.PD.AdditivePowers.toDividedPowers_unique` (characterisation): Every PD structure with these candidate operations equals the constructed structure.
- `TauCeti.PD.AdditivePowers.toDividedPowers_generators` (compatibility): Different generating sets and valid identity proofs yield the same structure.

Unit tests:

- `TauCeti.PD.test_generators_degree_two` (computation): The generated structure has the required quadratic mixed term.
- `TauCeti.PD.test_generators_outside` (non-example): The constructed total operation at degree zero outside I is zero, not one.
- `TauCeti.PD.test_generators_inner_one` (compatibility): Iteration with inner index one gives back the unchanged operation.

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Convolution of two divided-power systems

**Node:** CrystallineCohomology:CR.0/sum-convolution. **Kind:** definition.

**Declaration:** `TauCeti.PD.convolution`. All implementation status remains unchecked.

For γ on I and ε on J define Cₙ(x,y)=Σᵢ₊ⱼ₌ₙγᵢ(x)εⱼ(y). Its gluing interpretation uses x∈I and y∈J; outside these domains it is simply the displayed total function.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Use the finite antidiagonal sum in A.
2. Record the quadratic mixed term x y explicitly; there is no binomial coefficient on it.

Direct prerequisites: `mathlib:DividedPowers`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> I + J

API outline:

- `TauCeti.PD.convolution_eq` (data): C is the antidiagonal sum of the two systems.
- `TauCeti.PD.convolution_swap` (compatibility): Exchanging the two ideals and elements leaves C unchanged.
- `TauCeti.PD.convolution_mem` (structure): For n>0, Cₙ(x,y) lies in I+J when x∈I and y∈J.

Unit tests:

- `TauCeti.PD.test_convolution_zero` (degenerate): C₀(0,0)=1.
- `TauCeti.PD.test_convolution_quadratic` (computation): C₂(x,y)=γ₂(x)+xy+ε₂(y).
- `TauCeti.PD.test_convolution_same` (compatibility): For a single PD structure Cₙ(x,y)=γₙ(x+y).

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Convolution is independent of the decomposition

**Node:** CrystallineCohomology:CR.0/sum-independence. **Kind:** lemma.

**Declaration:** `TauCeti.PD.convolution_independent`. All implementation status remains unchecked.

If γₙ(w)=εₙ(w) for every n and w∈I∩J, then Cₙ(x,y)=Cₙ(x′,y′) whenever x,x′∈I, y,y′∈J and x+y=x′+y′.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Set w=x−x′=y′−y in I∩J.
2. Expand γᵢ(x′+w), replace γₗ(w) by εₗ(w), and regroup the finite three-index sum as εⱼ(y+w).
3. This proves equality in A, without assuming I∩J=IJ.

Direct prerequisites: `CrystallineCohomology:CR.0/sum-convolution`, `mathlib:DividedPowers`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> I + J

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The candidate on the sum of compatible ideals

**Node:** CrystallineCohomology:CR.0/sum-candidate. **Kind:** construction.

**Declaration:** `TauCeti.PD.supCandidate`. All implementation status remains unchecked.

Assume γ and ε agree on I∩J. Define an additive candidate on I+J by δₙ(z)=Cₙ(x,y) for any decomposition z=x+y with x∈I,y∈J, and zero outside I+J.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Use membership in I+J to choose a decomposition; sum-independence removes the choice.
2. Membership and degrees zero/one follow termwise. For homogeneity choose ax,ay as the decomposition of az.
3. For addition choose (x+x′)+(y+y′), expand both factors and reindex the finite four-index sum; this gives the candidate addition law.

Direct prerequisites: `CrystallineCohomology:CR.0/additive-powers`, `CrystallineCohomology:CR.0/sum-convolution`, `CrystallineCohomology:CR.0/sum-independence`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> I + J

API outline:

- `TauCeti.PD.supCandidate_dpow_add` (simp): On x+y the candidate is Cₙ(x,y).
- `TauCeti.PD.supCandidate_left` (compatibility): The candidate restricts to γ on I.
- `TauCeti.PD.supCandidate_right` (compatibility): The candidate restricts to ε on J.

Unit tests:

- `TauCeti.PD.test_supCandidate_zero` (degenerate): At zero and degree zero, the sum candidate is one.
- `TauCeti.PD.test_supCandidate_mixed` (computation): The quadratic sum candidate retains the mixed product.
- `TauCeti.PD.test_supCandidate_outside` (non-example): Degree zero outside the sum ideal is zero.

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The sum candidate extends both structures

**Node:** CrystallineCohomology:CR.0/sum-restrictions. **Kind:** lemma.

**Declaration:** `TauCeti.PD.supCandidate_restrict`. All implementation status remains unchecked.

The sum candidate agrees with γ on I and with ε on J, in every degree.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Choose x=x+0 or y=0+y and use the positive-degree vanishing at zero.
2. For degree zero use γ₀(0)=ε₀(0)=1. This lemma promotes the restriction APIs because the generator criterion consumes them.

Direct prerequisites: `CrystallineCohomology:CR.0/sum-candidate`, `CrystallineCohomology:CR.0/sum-convolution`, `mathlib:DividedPowers.dpow_eval_zero`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> I + J

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Divided powers on a compatible sum of ideals

**Node:** CrystallineCohomology:CR.0/compatible-sum. **Kind:** construction.

**Declaration:** `TauCeti.PD.sup`. All implementation status remains unchecked.

For PD structures γ on I and ε on J that agree on I∩J, construct the unique PD structure on I+J restricting to both.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Apply the generator criterion to the sum candidate and generating set I∪J.
2. Use sum-restrictions to transfer multiplication and iteration from γ or ε to each generator. For iteration, the inner positive divided power stays in the corresponding ideal.
3. Retain the existing ideal supremum and DividedPowers carrier; no new PD-ideal lattice is constructed.

Direct prerequisites: `CrystallineCohomology:CR.0/generator-criterion`, `CrystallineCohomology:CR.0/sum-candidate`, `CrystallineCohomology:CR.0/sum-restrictions`, `mathlib:DividedPowers.dpow_eq_from_gens`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> I + J

API outline:

- `TauCeti.PD.sup_dpow_add` (simp): The glued operation is the convolution on x+y.
- `TauCeti.PD.sup_left` (compatibility): The identity ring map from (A,I,γ) to the glued PD ring is a PD morphism.
- `TauCeti.PD.sup_right` (compatibility): The identity ring map from (A,J,ε) to the glued PD ring is a PD morphism.

Unit tests:

- `TauCeti.PD.test_sup_same` (compatibility): Gluing γ to itself returns the same operations.
- `TauCeti.PD.test_sup_zero_ideal` (degenerate): Gluing with the zero PD ideal returns γ on its domain.
- `TauCeti.PD.test_sup_quadratic` (computation): The glued degree-two formula contains xy with coefficient one.

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The universal property of compatible gluing

**Node:** CrystallineCohomology:CR.0/sum-universal-property. **Kind:** theorem.

**Declaration:** `TauCeti.PD.sup_exists_unique_iff`. All implementation status remains unchecked.

A PD structure θ on I+J restricts to both γ and ε exactly when its operations equal those of the glued structure. Existence of such θ is equivalent to agreement of γ and ε on I∩J.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Necessity is equality of the two restrictions at every element of the intersection.
2. Sufficiency is compatible-sum. For uniqueness, the addition law evaluates θₙ(x+y) as Cₙ(x,y), which also computes the glued operation; use DividedPowers.ext.

Direct prerequisites: `CrystallineCohomology:CR.0/compatible-sum`, `CrystallineCohomology:CR.0/sum-convolution`, `mathlib:DividedPowers.ext`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> I + J

Acceptance:

- If I=J, existence forces equality of γ and ε; arbitrary structures cannot be glued without the intersection condition.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Gluing when intersection equals product

**Node:** CrystallineCohomology:CR.0/product-intersection-gluing. **Kind:** lemma.

**Declaration:** `TauCeti.PD.sup_exists_unique_of_inf_eq_mul`. All implementation status remains unchecked.

If I∩J=IJ, any two PD structures on I and J glue uniquely. Their agreement on IJ is already the pinned coincide_on_smul theorem, not new mathematics.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Rewrite the intersection as the ideal product.
2. Apply the existing coincidence theorem and the compatible-sum universal property.

Direct prerequisites: `CrystallineCohomology:CR.0/sum-universal-property`, `mathlib:DividedPowers.coincide_on_smul`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.2.5 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> I + J

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Uniqueness of extension to the generated ideal

**Node:** CrystallineCohomology:CR.0/extension-uniqueness. **Kind:** lemma.

**Declaration:** `TauCeti.PD.extension_unique`. All implementation status remains unchecked.

Let f:A→B and let θ,θ′ be PD structures on IB=I.map(f). If f is a PD morphism from γ to both, then θ=θ′. No flatness or injectivity of f is needed.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. The image of I generates IB as a B-ideal. Both systems agree on f(x) for x∈I by their PD-morphism hypotheses.
2. Apply the pinned dpow_eq_from_gens. This is the uniqueness interface used by the construction-specific tests.

Direct prerequisites: `mathlib:DividedPowers.dpow_eq_from_gens`, `mathlib:DividedPowers.IsDPMorphism`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The principal extension formula is well defined

**Node:** CrystallineCohomology:CR.0/principal-independence. **Kind:** lemma.

**Declaration:** `TauCeti.PD.principal_independent`. All implementation status remains unchecked.

If I=(x), γ is a PD structure on I and f:A→B, then bⁿf(γₙ(x))=cⁿf(γₙ(x)) whenever bf(x)=cf(x), for all n≥0.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. At n=0 both expressions equal one. For n>0, γₙ(x) lies in (x); write γₙ(x)=a x.
2. The hypothesis says (b−c)f(x)=0. The polynomial bⁿ−cⁿ is divisible by b−c. Multiplying by f(a)f(x) proves the claimed equality.
3. This argument uses principal membership rather than division by n!, and applies even when f has a kernel.

Direct prerequisites: `mathlib:DividedPowers`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Extension of divided powers on a principal ideal

**Node:** CrystallineCohomology:CR.0/principal-extension. **Kind:** construction.

**Declaration:** `TauCeti.PD.extendPrincipal`. All implementation status remains unchecked.

For I=(x) and any ring map f:A→B, construct γᴮ on IB by γᴮₙ(bf(x))=bⁿf(γₙ(x)), zero outside IB. It is the unique extension of γ; no flatness hypothesis is imposed.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Every element of IB is bf(x); use principal-independence to descend the displayed formula.
2. For addition expand (b+c)ⁿ and use the multiplication identity for γ at x. Degrees zero/one, ideal membership, scalar homogeneity and multiplication follow directly.
3. For iteration with n>0 write γₙ(x)=a x. Then γᴮₘ(γᴮₙ(bf(x)))=bⁿᵐ f(aᵐγₘ(x)); apply homogeneity and the source iteration identity to a x.
4. For any y∈I write y=a x to verify the PD-morphism condition for f. Uniqueness is extension-uniqueness.

Direct prerequisites: `CrystallineCohomology:CR.0/principal-independence`, `CrystallineCohomology:CR.0/extension-uniqueness`, `mathlib:DividedPowers`, `mathlib:PadicInt.dividedPowers`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

API outline:

- `TauCeti.PD.extendPrincipal_dpow` (simp): The defining scalar formula holds for every b and every n.
- `TauCeti.PD.extendPrincipal_isDPMorphism` (compatibility): The base map f preserves γ.
- `TauCeti.PD.extendPrincipal_generator_independent` (characterisation): The result does not depend on a chosen principal generator.

Unit tests:

- `TauCeti.PD.test_principal_identity` (compatibility): Extension along the identity has the original operation on I.
- `TauCeti.PD.test_principal_zero` (degenerate): Extending the zero ideal gives the existing zero divided powers on its image.
- `TauCeti.PD.test_principal_quadratic` (computation): The degree-two value on bf(x) scales by b².
- `TauCeti.PD.test_principal_p_two` (non-example): For the canonical PD ideal (2) in Z₂, identity extension satisfies γ₂(2)=2, so ordinary or PD nilpotence must not be inferred.

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The scalar-extension coefficient formula

**Node:** CrystallineCohomology:CR.0/extension-coefficient. **Kind:** definition.

**Declaration:** `TauCeti.PD.extensionCoefficient`. All implementation status remains unchecked.

For f:A→B, γ on I, a finite list x₁,…,xᵣ in A and coefficients bᵢ∈B, define Eₙ(b,x)=Σₑ₁₊⋯₊ₑᵣ₌ₙ ∏ᵢ bᵢᵉⁱ f(γₑⁱ(xᵢ)). It is a total finite formula. Its PD interpretation assumes every xᵢ∈I. For r=0 it is one at n=0 and zero otherwise.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Represent multiindices of total weight n by multisets of cardinality n on Fin r; their multiplicities are the exponents.
2. Take the finite product in B and sum over these multisets. Each multiindex appears exactly once; there is no multinomial coefficient.

Direct prerequisites: `mathlib:DividedPowers.dpow_sum`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

API outline:

- `TauCeti.PD.extensionCoefficient_eq` (data): Eₙ is the multiset-indexed finite sum without multinomial coefficients.
- `TauCeti.PD.extensionCoefficient_one` (simp): For a singleton family Eₙ=bⁿf(γₙ(x)).
- `TauCeti.PD.extensionCoefficient_mem` (structure): For n>0 and xᵢ∈I the coefficient lies in IB.

Unit tests:

- `TauCeti.PD.test_coefficient_empty_zero` (degenerate): The empty family in degree zero contributes one.
- `TauCeti.PD.test_coefficient_empty_positive` (degenerate): The empty family in degree one contributes zero.
- `TauCeti.PD.test_coefficient_quadratic` (computation): For two elements, E₂=b₀²fγ₂(x₀)+b₀b₁f(x₀x₁)+b₁²fγ₂(x₁).

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Invariance under a finite scalar substitution

**Node:** CrystallineCohomology:CR.0/coefficient-substitution. **Kind:** lemma.

**Declaration:** `TauCeti.PD.extensionCoefficient_substitution`. All implementation status remains unchecked.

Let aᵢⱼ∈A, cⱼ∈B and xᵢ∈I. Put bᵢ=Σⱼf(aᵢⱼ)cⱼ and yⱼ=Σᵢaᵢⱼxᵢ. Then Eₙ(b,x)=Eₙ(c,y) for every n, without a flatness assumption.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Expand γₖ(yⱼ) with the existing finite-sum and scalar identities. Expand each power of bᵢ using the ordinary multinomial theorem.
2. Index both expressions by matrices of nonnegative integers with total sum n. Reduce repeated products of divided powers at each xᵢ with the existing multiplication formula.
3. For every exponent matrix the coefficients agree as integers; equivalently compare these same universal coefficient expressions in the rational polynomial ring in formal xᵢ,cⱼ,aᵢⱼ. This is a coefficient identity and does not rationalize A or B.

Direct prerequisites: `CrystallineCohomology:CR.0/extension-coefficient`, `mathlib:DividedPowers.dpow_sum`, `mathlib:DividedPowers.prod_dpow`, `mathlib:MvPolynomial.basisMonomials`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Independence of the expression over a flat algebra

**Node:** CrystallineCohomology:CR.0/flat-presentation-independence. **Kind:** lemma.

**Declaration:** `TauCeti.PD.extensionCoefficient_independent`. All implementation status remains unchecked.

For a flat A-algebra B and xᵢ,x′ⱼ∈I, equality Σbᵢxᵢ=Σb′ⱼx′ⱼ in B implies Eₙ(b,x)=Eₙ(b′,x′) for every n.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Apply the pinned equational criterion to the combined relation with coefficients xᵢ and −x′ⱼ, and module elements bᵢ and b′ⱼ. It expresses both coefficient families in common elements cₖ with matrices aᵢₖ,a′ⱼₖ.
2. For each k the relation gives Σaᵢₖxᵢ=Σa′ⱼₖx′ⱼ inside A. These common elements lie in I.
3. Apply coefficient-substitution to both sides. They become the same coefficient formula on the common list. There is no assumption that I is finitely generated, nor any invocation of a derived completion.

Direct prerequisites: `CrystallineCohomology:CR.0/coefficient-substitution`, `mathlib:Module.Flat.isTrivialRelation_of_sum_smul_eq_zero`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The additive candidate on a flat extension

**Node:** CrystallineCohomology:CR.0/flat-candidate. **Kind:** construction.

**Declaration:** `TauCeti.PD.flatCandidate`. All implementation status remains unchecked.

For B flat over A, define the candidate on IB by δₙ(z)=Eₙ(b,x) for any finite presentation z=Σbᵢxᵢ with xᵢ∈I; set it to zero outside IB.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Membership in the generated ideal supplies a finite presentation. Flat-presentation-independence proves choice independence.
2. At n=0, every γ₀(xᵢ)=1 so the sole zero-weight multiindex gives one. At n=1 the coefficient is z; positive coefficients lie in IB.
3. Concatenate two presentations to prove addition: splitting a multiset between the two disjoint finite index sets gives the antidiagonal sum. For homogeneity multiply each bᵢ by a; total weight n gives the factor aⁿ.

Direct prerequisites: `CrystallineCohomology:CR.0/additive-powers`, `CrystallineCohomology:CR.0/extension-coefficient`, `CrystallineCohomology:CR.0/flat-presentation-independence`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

API outline:

- `TauCeti.PD.flatCandidate_formula` (data): On every finite expression, the candidate is Eₙ.
- `TauCeti.PD.flatCandidate_base` (compatibility): The candidate restricts to the original divided powers along A→B.
- `TauCeti.PD.flatCandidate_outside` (simp): Outside IB, every operation is zero.

Unit tests:

- `TauCeti.PD.test_flatCandidate_zero` (degenerate): Degree zero at zero is one.
- `TauCeti.PD.test_flatCandidate_scalar` (computation): A single scalar multiple has the expected nth-power coefficient.
- `TauCeti.PD.test_flatCandidate_quadratic` (computation): The quadratic formula includes the mixed product after base change.

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The flat candidate preserves the base operations

**Node:** CrystallineCohomology:CR.0/flat-candidate-base. **Kind:** lemma.

**Declaration:** `TauCeti.PD.flatCandidate_base_identity`. All implementation status remains unchecked.

For x∈I and every n, the flat candidate has δₙ(f(x))=f(γₙ(x)). In particular multiplication and iteration hold on the generating subset f(I) of IB.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Use the singleton presentation f(x)=1·f(x) in the flat-candidate formula.
2. For multiplication apply f to the corresponding γ identity. For iteration with positive inner degree, γₙ(x) is again in I so apply the formula twice.

Direct prerequisites: `CrystallineCohomology:CR.0/flat-candidate`, `CrystallineCohomology:CR.0/extension-coefficient`, `mathlib:DividedPowers`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Flat extension of divided powers

**Node:** CrystallineCohomology:CR.0/flat-extension. **Kind:** construction.

**Declaration:** `TauCeti.PD.extendFlat`. All implementation status remains unchecked.

If B is a flat A-algebra, construct the unique PD structure γᴮ on IB for which A→B is a PD morphism. Its operation on a finite expression is Eₙ(b,x). This extends a specified γ, and does not assert an envelope base-change theorem.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. The image of I generates IB. Apply the generator criterion to the flat candidate using this generating set.
2. Flat-candidate-base transfers the multiplication and iteration identities on generators from γ.
3. Apply extension-uniqueness to identify all possible extensions.

Direct prerequisites: `CrystallineCohomology:CR.0/generator-criterion`, `CrystallineCohomology:CR.0/flat-candidate`, `CrystallineCohomology:CR.0/flat-candidate-base`, `CrystallineCohomology:CR.0/extension-uniqueness`, `mathlib:DividedPowers.IsDPMorphism`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

API outline:

- `TauCeti.PD.extendFlat_formula` (data): The flat extension evaluates to Eₙ on every finite presentation.
- `TauCeti.PD.extendFlat_isDPMorphism` (compatibility): The base map is a morphism of the specified PD structures.
- `TauCeti.PD.extendFlat_unique` (characterisation): Any PD structure on IB preserved by the base map equals this extension.

Unit tests:

- `TauCeti.PD.test_flat_identity` (compatibility): Identity extension agrees with γ at every element.
- `TauCeti.PD.test_flat_principal` (compatibility): On a principal ideal the flat and principal constructions agree.
- `TauCeti.PD.test_flat_quadratic` (computation): A linear combination of two base elements retains its cross term.

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The base map preserves flatly extended divided powers

**Node:** CrystallineCohomology:CR.0/flat-extension-map. **Kind:** lemma.

**Declaration:** `TauCeti.PD.extendFlat_base_map`. All implementation status remains unchecked.

The algebra map A→B is a PD morphism from (I,γ) to (IB,γᴮ). Consequently it evaluates γᴮₙ on every base image in all degrees.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. The extended ideal condition is equality by definition.
2. Use flat-candidate-base and the unchanged-operation API of the generator criterion. This promotes the base-map API for downstream localization.

Direct prerequisites: `CrystallineCohomology:CR.0/flat-extension`, `CrystallineCohomology:CR.0/flat-candidate-base`, `CrystallineCohomology:CR.0/generator-criterion`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

Acceptance:

- Check the formula in degree zero and over rings with torsion; do not divide by factorials in the target ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Divided powers after localization

**Node:** CrystallineCohomology:CR.0/localization-formula. **Kind:** theorem.

**Declaration:** `TauCeti.PD.localization_dpow`. All implementation status remains unchecked.

Let S⊂A be multiplicative, B=S⁻¹A and γ on I. The unique extension to IB exists by flatness, and γᴮₙ(x/s)=γₙ(x)/sⁿ for x∈I, s∈S, n≥0. This asserts localization of the PD structure, not localization of an unconstructed envelope.

Hypotheses and conventions: All rings are commutative and unital. Indices of divided powers are natural numbers; inner iteration indices must be positive. Use the pinned total-function convention: γ₀(x)=1 on its ideal, while γₙ(x)=0 outside its ideal even at n=0. Additional hypotheses are exactly those in the statement.

Uses:

- Stacks 23.5.1; CrystallineCohomology:CR.0: Base-compatible PD polynomial algebras need extension of base divided powers and gluing with the augmentation ideal.
- Stacks 60.2.4; CrystallineCohomology:CR.1: Envelope presentations and affine thickenings require maps preserving the specified base divided powers, including on overlapping ideals.

Proof outline:

1. Use the pinned theorem that localization is flat to apply flat-extension.
2. Write x/s=(1/s)f(x). Apply scalar homogeneity and flat-extension-map.
3. The displayed denominator is sⁿ, including denominator one in degree zero.

Direct prerequisites: `CrystallineCohomology:CR.0/flat-extension`, `CrystallineCohomology:CR.0/flat-extension-map`, `mathlib:IsLocalization.flat`, `mathlib:DividedPowers`, `mathlib:IsLocalization.mk'`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), Lemma 23.4.2 and its proof. The source argument is split into the displayed declaration and the explicitly listed prerequisite lemmas. Totalization outside the ideal follows the pinned library convention.

Literal source excerpt:

> IB

Acceptance:

- Check n=0 at x=0 and s=1; check agreement with the principal construction when I is principal.
- No envelope base-change assertion is inferred: its additional flatness and Tor hypotheses remain a separate source obligation.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Augmentation of the divided power algebra

**Node:** CrystallineCohomology:CR.0/gamma-augmentation. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.Augmentation.augmentation`. All implementation status remains unchecked.

Construct the R-algebra homomorphism ε:Γ_R(M)→R taking dp(0,m) to 1 and every dp(n,m) with n>0 to 0. It is the existing lift into the canonical zero PD ideal of R along the zero linear map M→R.

Hypotheses and conventions: R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

Uses:

- Stacks §23.5, positive divided-power ideal: Defines the augmentation kernel on the retained Γ carrier before giving it divided powers.
- CrystallineCohomology:CR.0/gamma-augmentation-splitting: Retraction onto scalars separates a constant coefficient from a positive-degree remainder.

Proof outline:

1. Use dividedPowersBot R, the zero R-linear map M→R and its range containment in the zero ideal as the inputs of DividedPowerAlgebra.lift.
2. Use lift_apply_dp, the degree-zero PD axiom and dpow_eval_zero in positive degree to calculate ε on every generator.
3. The algebra-homomorphism structure gives ε(algebraMap(r))=r. For naturality and uniqueness use algHom_ext on all dp(n,m), splitting n=0 from n>0.

Direct prerequisites: `mathlib:dividedPowersBot`, `mathlib:DividedPowerAlgebra.lift`, `mathlib:DividedPowerAlgebra.lift_apply_dp`, `mathlib:DividedPowers.dpow_eval_zero`, `mathlib:DividedPowerAlgebra.algHom_ext`, `mathlib:DividedPowerAlgebra.dp_zero`, `mathlib:DividedPowerAlgebra.map_apply_dp`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, opening construction and proof of Lemma 23.5.1 (tag 07H4). The source states the augmentation and its positive-degree kernel for free PD polynomial algebras. Here the same elementary augmentation interface is derived for an arbitrary module directly from the pinned quotient presentation and lift; no free-basis or canonical-PD-structure theorem is imported from this statement.

Literal source excerpt:

> canonical A-algebra map

API outline:

- `TauCeti.Crystalline.Augmentation.augmentation_eq_lift` (compatibility): ε equals the pinned DividedPowerAlgebra.lift of dividedPowersBot R along the zero linear map.
- `TauCeti.Crystalline.Augmentation.augmentation_dp` (simp): ε(dp(n,m)) is 1 when n=0 and 0 otherwise.
- `TauCeti.Crystalline.Augmentation.augmentation_scalar` (simp): ε(algebraMap(r))=r for all r∈R.
- `TauCeti.Crystalline.Augmentation.augmentation_natural` (functoriality): For every R-linear f:M→N, ε_N∘Γ(f)=ε_M.
- `TauCeti.Crystalline.Augmentation.augmentation_unique` (extensionality): An R-algebra homomorphism Γ_R(M)→R killing every dp(n,m) with n>0 equals ε.

Unit tests:

- `augmentation_test_unit` (non-example): For R=M=Z, ε(1)=1, ruling out a zero map.
- `augmentation_test_zero_degree` (degenerate): For every m, ε(dp(0,m))=1.
- `augmentation_test_positive_with_scalar` (computation): For every m, ε(3+dp(2,m))=3, including characteristic two and torsion modules.

Acceptance:

- Over Z the unit maps to 1. Degree zero is retained even when m=0; every positive divided degree maps to zero.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Augmentation ideal

**Node:** CrystallineCohomology:CR.0/gamma-augmentation-ideal. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.Augmentation.augmentationIdeal`. All implementation status remains unchecked.

Define Γ_R(M)_+ as the existing ring-homomorphism kernel ker(ε), an ideal of the existing algebra Γ_R(M). Membership means ε(z)=0. In positive degree dp(n,m) belongs to this ideal, and a scalar belongs exactly when it is zero.

Hypotheses and conventions: R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

Uses:

- Stacks Lemma 23.5.1: Names the ideal receiving the canonical divided powers before gluing with the extended base PD ideal.
- CrystallineCohomology:CR.0/gamma-augmentation-ideal-generators: Translates the source’s all-positive-divided-degrees generators into an exact ideal equality.

Proof outline:

1. Apply RingHom.ker to ε; use RingHom.mem_ker for membership.
2. The generator and scalar assertions follow by the computed values of ε. Properness over a nonzero ring follows because ε(1)=1.

Direct prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation`, `mathlib:RingHom.ker`, `mathlib:RingHom.mem_ker`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, opening construction and proof of Lemma 23.5.1 (tag 07H4). The source states the augmentation and its positive-degree kernel for free PD polynomial algebras. Here the same elementary augmentation interface is derived for an arbitrary module directly from the pinned quotient presentation and lift; no free-basis or canonical-PD-structure theorem is imported from this statement.

Literal source excerpt:

> canonical A-algebra map

API outline:

- `TauCeti.Crystalline.Augmentation.augmentationIdeal_eq_ker` (compatibility): Γ_R(M)_+=RingHom.ker(ε).
- `TauCeti.Crystalline.Augmentation.mem_augmentationIdeal` (characterisation): z∈Γ_R(M)_+ if and only if ε(z)=0.
- `TauCeti.Crystalline.Augmentation.dp_mem_augmentationIdeal` (characterisation): For n≠0, dp(n,m)∈Γ_R(M)_+.
- `TauCeti.Crystalline.Augmentation.scalar_mem_augmentationIdeal` (characterisation): algebraMap(r)∈Γ_R(M)_+ if and only if r=0.

Unit tests:

- `augmentationIdeal_test_positive` (computation): dp(2,m) belongs to Γ_R(M)_+ for every m.
- `augmentationIdeal_test_unit` (non-example): 1 does not belong to Γ_Z(Z)_+.
- `augmentationIdeal_test_degree_one_insufficient` (non-example): Over R=M=F₂, dp(2,1) belongs to the augmentation ideal but not to the ordinary ideal generated by the degree-one image of M. This rejects replacing all positive divided degrees by degree one.

Acceptance:

- For R=M=Z, neither 1 nor any dp(0,m) belongs. Every positive divided-power generator does belong.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Positive-degree remainder

**Node:** CrystallineCohomology:CR.0/gamma-remainder-positive-span. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Augmentation.remainder_mem_positive_span`. All implementation status remains unchecked.

For every z∈Γ_R(M), z−algebraMap(ε(z)) belongs to the ideal H generated by all dp(n,m) with n>0 and m∈M.

Hypotheses and conventions: R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

Proof outline:

1. Apply the pinned DividedPowerAlgebra.induction_on with the displayed remainder-membership predicate.
2. For a scalar the remainder is zero. For a sum it is the sum of the two remainders.
3. For z·dp(0,m), dp_zero reduces to the induction hypothesis. For z·dp(n,m) with n>0, the augmentation is zero and dp(n,m) is one of H’s generators, so ideal closure under multiplication proves membership.

Direct prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation`, `mathlib:DividedPowerAlgebra.induction_on`, `mathlib:DividedPowerAlgebra.dp_zero`, `mathlib:Ideal.subset_span`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, opening construction and proof of Lemma 23.5.1 (tag 07H4). The source states the augmentation and its positive-degree kernel for free PD polynomial algebras. Here the same elementary augmentation interface is derived for an arbitrary module directly from the pinned quotient presentation and lift; no free-basis or canonical-PD-structure theorem is imported from this statement.

Literal source excerpt:

> canonical A-algebra map

Acceptance:

- The proof handles arbitrary elements of the quotient, with no unproved monomial basis, torsion-free embedding or freeness hypothesis.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Positive-degree generators of the augmentation ideal

**Node:** CrystallineCohomology:CR.0/gamma-augmentation-ideal-generators. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Augmentation.augmentationIdeal_eq_span`. All implementation status remains unchecked.

Γ_R(M)_+ is exactly the ideal generated by {dp(n,m) | n>0, m∈M}. The degree-zero generators are excluded.

Hypotheses and conventions: R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

Proof outline:

1. Every listed generator has augmentation zero; Ideal.span_le gives H⊆ker(ε).
2. If ε(z)=0, the positive-degree remainder lemma gives z−algebraMap(0)=z∈H, proving the reverse inclusion.

Direct prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation-ideal`, `CrystallineCohomology:CR.0/gamma-remainder-positive-span`, `mathlib:Ideal.span_le`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, opening construction and proof of Lemma 23.5.1 (tag 07H4). The source states the augmentation and its positive-degree kernel for free PD polynomial algebras. Here the same elementary augmentation interface is derived for an arbitrary module directly from the pinned quotient presentation and lift; no free-basis or canonical-PD-structure theorem is imported from this statement.

Literal source excerpt:

> canonical A-algebra map

Acceptance:

- Over Z the ideal is proper, so including dp(0,m)=1 would give the wrong result.
- This gives generators by all positive divided powers; generation by degree one alone is not asserted.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Scalar and augmentation splitting

**Node:** CrystallineCohomology:CR.0/gamma-augmentation-splitting. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.Augmentation.augmentationSplitting`. All implementation status remains unchecked.

Construct an R-linear equivalence Γ_R(M)≃R×Γ_R(M)_+ by z↦(ε(z),z−algebraMap(ε(z))). Its inverse is (r,u)↦algebraMap(r)+u. The second coordinate uses the kernel-membership proof; multiplication on the two summands has cross terms.

Hypotheses and conventions: R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

Uses:

- Stacks §23.5, augmentation and positive-degree summand: Provides the coefficient-zero decomposition without presupposing the source’s free monomial basis.
- CrystallineCohomology:CR.0, base-compatible PD polynomial construction: Separates the scalar component of elements of the extended base ideal; the following two lemmas prove the intersection/product equality.

Proof outline:

1. Augment the remainder: ε(z)−ε(algebraMap(ε(z)))=0; this gives the subtype membership proof.
2. Both coordinate functions and the proposed inverse are R-linear by the algebra maps and submodule structure.
3. Substitute each composite. Cancellation gives z in one direction; ε(u)=0 gives (r,u) in the other. Package the linear maps with LinearEquiv.ofLinearMap.

Direct prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation`, `CrystallineCohomology:CR.0/gamma-augmentation-ideal`, `mathlib:LinearEquiv.ofLinearMap`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, opening construction and proof of Lemma 23.5.1 (tag 07H4). The source states the augmentation and its positive-degree kernel for free PD polynomial algebras. Here the same elementary augmentation interface is derived for an arbitrary module directly from the pinned quotient presentation and lift; no free-basis or canonical-PD-structure theorem is imported from this statement.

Literal source excerpt:

> canonical A-algebra map

API outline:

- `TauCeti.Crystalline.Augmentation.augmentationSplitting_fst` (simp): The first coordinate of the image of z is ε(z).
- `TauCeti.Crystalline.Augmentation.augmentationSplitting_snd` (simp): The underlying algebra element of the second coordinate is z−algebraMap(ε(z)).
- `TauCeti.Crystalline.Augmentation.augmentationSplitting_symm` (simp): The inverse sends (r,u) to algebraMap(r)+u.

Unit tests:

- `augmentationSplitting_test_scalar` (compatibility): Every scalar r maps to (r,0).
- `augmentationSplitting_test_ideal` (compatibility): Every u∈Γ_R(M)_+ maps to (0,u).
- `augmentationSplitting_test_addition` (computation): The element algebraMap(r)+u maps to (r,u), retaining both components.

Acceptance:

- Constants and augmentation elements are separated exactly. This is a module splitting; it does not give a monomial basis or the missing PD structure.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Remainder of an extended base ideal

**Node:** CrystallineCohomology:CR.0/gamma-base-ideal-remainder. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Augmentation.baseIdeal_remainder`. All implementation status remains unchecked.

For every ideal I⊂R, put IΓ=I.map(algebraMap R Γ_R(M)). If z∈IΓ, then z−algebraMap(ε(z))∈IΓ·Γ_R(M)_+.

Hypotheses and conventions: R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

Proof outline:

1. The definition of Ideal.map and the finite-span criterion express z as a finite sum Σ_j b_j·algebraMap(a_j), where a_j∈I and b_j∈Γ_R(M). No injectivity, flatness or basis is used.
2. The augmentation is Σ_j ε(b_j)a_j. Subtract its scalar image and distribute to obtain Σ_j (b_j−algebraMap(ε(b_j)))·algebraMap(a_j).
3. Each first factor lies in Γ_R(M)_+ by the augmentation calculation, and each second factor lies in IΓ. Ideal product membership and finite-sum closure give the result.

Direct prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation`, `CrystallineCohomology:CR.0/gamma-augmentation-ideal`, `mathlib:Ideal.map`, `mathlib:Ideal.mem_map_of_mem`, `mathlib:Finsupp.mem_ideal_span_range_iff_exists_finsupp`, `mathlib:Ideal.mul_mem_mul`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, opening construction and proof of Lemma 23.5.1 (tag 07H4). The source states the augmentation and its positive-degree kernel for free PD polynomial algebras. Here the same elementary augmentation interface is derived for an arbitrary module directly from the pinned quotient presentation and lift; no free-basis or canonical-PD-structure theorem is imported from this statement.

Literal source excerpt:

> canonical A-algebra map

Acceptance:

- The conclusion holds for arbitrary modules and arbitrary base ideals, including torsion modules and I=0.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Base ideal and augmentation intersection

**Node:** CrystallineCohomology:CR.0/gamma-base-ideal-intersection. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Augmentation.baseIdeal_inf_augmentation`. All implementation status remains unchecked.

For every ideal I⊂R, IΓ∩Γ_R(M)_+=IΓ·Γ_R(M)_+. This is an equality of ideals in Γ_R(M), without a flatness or freeness assumption.

Hypotheses and conventions: R is a commutative ring; M is an R-module. No freeness, finite generation, characteristic, factorial invertibility or nilpotence hypothesis is imposed.

Proof outline:

1. The ideal product is contained in the intersection by Ideal.mul_le_inf.
2. For z in the intersection, ε(z)=0. The preceding base-ideal remainder statement reduces to z∈IΓ·Γ_R(M)_+, proving the reverse inclusion.

Direct prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation-ideal`, `CrystallineCohomology:CR.0/gamma-base-ideal-remainder`, `mathlib:Ideal.mul_le_inf`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, opening construction and proof of Lemma 23.5.1 (tag 07H4). The source states the augmentation and its positive-degree kernel for free PD polynomial algebras. Here the same elementary augmentation interface is derived for an arbitrary module directly from the pinned quotient presentation and lift; no free-basis or canonical-PD-structure theorem is imported from this statement.

Literal source excerpt:

> canonical A-algebra map

Acceptance:

- This supplies the exact intersection/product hypothesis of CR.0/product-intersection-gluing once the two separate PD structures have been constructed.
- Existence of those structures, particularly the positive-degree PD structure, is still a separate proof obligation.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### A degree-two detector in characteristic two

**Node:** CrystallineCohomology:CR.0/gamma-degree-two-detector. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Augmentation.exists_degreeTwo_detector`. All implementation status remains unchecked.

Let B=TrivSqZeroExt(F₂,F₂), with ε(a)=(0,a). There exists an F₂-algebra homomorphism f:Γ_F₂(F₂)→B with f(dp(0,a))=1, f(dp(2,a))=ε(a), and f(dp(n,a))=0 in every other degree.

Hypotheses and conventions: The base ring and module are both F₂=ZMod 2. The target is the existing trivial square-zero extension TrivSqZeroExt(F₂,F₂).

Proof outline:

1. Use the pinned lift′ for the displayed total generator family; this is an ordinary algebra homomorphism, not a PD morphism.
2. The degree-zero relation is immediate. Scalar homogeneity in degree two uses r²=r for r∈F₂; all other positive degrees are zero.
3. For the product relation, an index zero is immediate. When both indices are positive, the only nonzero possible left side is ε(a)²=0; the only possibly nonzero target degree is 1+1=2, whose coefficient choose(2,1)=2 vanishes in F₂.
4. For the additive relation, degree zero gives one and degree two gives ε(a+b)=ε(a)+ε(b). The only other possible convolution term is degree four, ε(a)ε(b)=0. All remaining terms vanish. Apply lift′_apply_dp for the stated formula.

Direct prerequisites: `mathlib:DividedPowerAlgebra.lift'`, `mathlib:DividedPowerAlgebra.lift'_apply_dp`, `mathlib:TrivSqZeroExt.inr`, `mathlib:TrivSqZeroExt.inr_mul_inr`, `mathlib:ZMod.natCast_self`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, opening construction and proof of Lemma 23.5.1 (tag 07H4). The source states the augmentation and its positive-degree kernel for free PD polynomial algebras. Here the same elementary augmentation interface is derived for an arbitrary module directly from the pinned quotient presentation and lift; no free-basis or canonical-PD-structure theorem is imported from this statement.

Literal source excerpt:

> canonical A-algebra map

Acceptance:

- The map kills the degree-one image but detects dp(2,1). It demonstrates why the weak algebra lifting property and a full PD universal property are different statements.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Degree one does not generate the augmentation ideal

**Node:** CrystallineCohomology:CR.0/gamma-degree-one-insufficient. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Augmentation.degreeTwo_not_mem_degreeOne_span`. All implementation status remains unchecked.

In Γ_F₂(F₂), dp(2,1) is not in the ordinary ideal generated by {embed(a) | a∈F₂}.

Hypotheses and conventions: The base ring and module are both F₂=ZMod 2. The target is the existing trivial square-zero extension TrivSqZeroExt(F₂,F₂).

Proof outline:

1. Take the preceding ordinary algebra homomorphism to the square-zero extension. Every embed(a)=dp(1,a) maps to zero, so the ordinary ideal they generate lies in its ring kernel by Ideal.span_le.
2. The image of dp(2,1) is inr(1), which is nonzero by inr_injective and 1≠0 in F₂. Kernel membership therefore rules out membership in the degree-one ideal.

Direct prerequisites: `CrystallineCohomology:CR.0/gamma-degree-two-detector`, `mathlib:DividedPowerAlgebra.embed_def`, `mathlib:RingHom.mem_ker`, `mathlib:Ideal.span_le`, `mathlib:TrivSqZeroExt.inr_injective`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, opening construction and proof of Lemma 23.5.1 (tag 07H4). The source states the augmentation and its positive-degree kernel for free PD polynomial algebras. Here the same elementary augmentation interface is derived for an arbitrary module directly from the pinned quotient presentation and lift; no free-basis or canonical-PD-structure theorem is imported from this statement.

Literal source excerpt:

> canonical A-algebra map

Acceptance:

- The concrete degree-two class distinguishes the correct augmentation ideal from a plausible wrong degree-one-generated ideal without assuming a free monomial basis.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Divided power filtration

**Node:** CrystallineCohomology:CR.0/pd-filtration. **Kind:** definition.

**Declaration:** `TauCeti.PD.pdFiltration`. All implementation status remains unchecked.

For n≥0 define Fⁿ_γI, also denoted I^[n], as the ideal generated by all finite products γ_(e₁)(x₁)⋯γ_(eₜ)(xₜ), where xⱼ∈I, eⱼ≥0 and ∑eⱼ≥n. Include the empty product with total degree zero. Thus the convention at n=0 is intrinsic to the same formula. The carrier is Ideal R and the operations are those of the given DividedPowers I.

Hypotheses and conventions: R is a commutative ring, I is an ideal of R and γ is an existing divided-power structure on I.

Uses:

- Stacks60.6, Lemma60.6.3 (07HT): The divided-power square of K∩J(1) appears in the quotient presenting PD differentials.
- Stacks60.6, Remark60.6.4 (07HU): The differential of a divided-power product lowers its degree by one; constructing PD differentials and that compatibility remains a separate target.
- CrystallineCohomology:CR.0 and RS-01 ownership: Provides the ordinary PD filtration used in the owner’s PD envelopes and coefficient constructions. Derived filtrations and completion remain with DD.0/1.

Proof outline:

1. Form the set of values of finite lists of pairs (e,x) with e a natural number and x in I, retaining precisely those lists of total weight at least n. Take its existing Ideal.span.
2. The span universal property gives the containment criterion; Ideal.subset_span gives word membership. A singleton list gives γ_n(x) membership. Zero weights contribute γ₀(x)=1, so they can be deleted without changing the product or total weight.
3. The zero-ideal tests use the pinned dividedPowersBot and DividedPowers.dpow_eval_zero. For the characteristic-two control use PadicInt.coe_dpow_eq to calculate γ₂(2)=2; Ideal.span_singleton_pow and the valuation criterion exclude 2 from (2)².

Direct prerequisites: `mathlib:DividedPowers`, `mathlib:Ideal.span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`, `mathlib:dividedPowersBot`, `mathlib:DividedPowers.dpow_eval_zero`, `mathlib:PadicInt.dividedPowers`, `mathlib:PadicInt.coe_dpow_eq`, `mathlib:PadicInt.valuation_p`, `mathlib:PadicInt.mem_span_pow_iff_le_valuation`, `mathlib:Ideal.span_singleton_pow`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section60.6 (07HQ), unnumbered paragraph between Lemmas60.6.2 (07HS) and60.6.3 (07HT); chapter PDF p.12. The source defines weighted products and states the ordinary-power inclusion and degree-one identity. The proof steps give the indicated elementary consequence on the pinned ideal and divided-power carriers.

Literal source excerpt:

> ideal generated by

API outline:

- `TauCeti.PD.pdFiltration_le_iff` (characterisation): For any ideal K of R, Fⁿ_γI⊆K if and only if every finite weighted product of total degree at least n belongs to K.
- `TauCeti.PD.prod_dpow_mem_pdFiltration` (constructor): For xⱼ∈I and natural weights eⱼ whose sum is at least n, the product ∏ⱼγ_(eⱼ)(xⱼ) belongs to Fⁿ_γI, including the empty word when n=0.
- `TauCeti.PD.dpow_mem_pdFiltration` (simp): For x∈I and n≥0, γ_n(x) belongs to Fⁿ_γI.

Unit tests:

- `pd_filtration_empty_word` (degenerate): For the zero ideal with its pinned dividedPowersBot structure, F⁰(0)=R; the empty word supplies 1 even in this case.
- `pd_filtration_zero_ideal` (computed): For the zero ideal with dividedPowersBot and every n>0, Fⁿ(0)=0, because a word of positive total weight has a positive-weight factor evaluated at zero.
- `pd_filtration_two_adic_counterexample` (non-example): For R=ℤ₂, I=(2) and the canonical PadicInt.dividedPowers 2, the element 2 lies in F²I but not in I². Indeed γ₂(2)=2 and v₂(2)=1<2.

Acceptance:

- The same formula handles n=0 without imposing a nonempty-word convention.
- The characteristic-two control distinguishes divided-power degree from ordinary ideal powers.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Zeroth divided power filtration step

**Node:** CrystallineCohomology:CR.0/pd-filtration-zero. **Kind:** lemma.

**Declaration:** `TauCeti.PD.pdFiltration_zero`. All implementation status remains unchecked.

For every divided-power ideal (I,γ), F⁰_γI=R, as an equality of ideals.

Hypotheses and conventions: R is a commutative ring, I is an ideal of R and γ is an existing divided-power structure on I.

Proof outline:

1. The empty list has weight zero and product 1, so Ideal.subset_span puts 1 in F⁰_γI.
2. Apply Ideal.eq_top_iff_one. This proof also covers the zero ring.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `mathlib:Ideal.subset_span`, `mathlib:Ideal.eq_top_iff_one`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section60.6 (07HQ), unnumbered paragraph between Lemmas60.6.2 (07HS) and60.6.3 (07HT); chapter PDF p.12. The source defines weighted products and states the ordinary-power inclusion and degree-one identity. The proof steps give the indicated elementary consequence on the pinned ideal and divided-power carriers.

Literal source excerpt:

> ideal generated by

Acceptance:

- The zero ideal has a nonzero zeroth stage in every nonzero ring.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### First divided power filtration step

**Node:** CrystallineCohomology:CR.0/pd-filtration-one. **Kind:** lemma.

**Declaration:** `TauCeti.PD.pdFiltration_one`. All implementation status remains unchecked.

For every divided-power ideal (I,γ), F¹_γI=I.

Hypotheses and conventions: R is a commutative ring, I is an ideal of R and γ is an existing divided-power structure on I.

Proof outline:

1. A list with total weight at least one has a positive weight eⱼ. The pinned DividedPowers.dpow_mem places that factor in I; multiplication by the remaining factors preserves I. Apply Ideal.span_le.
2. For x∈I the singleton list (1,x) generates γ₁(x)=x, by DividedPowers.dpow_one and Ideal.subset_span.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `mathlib:DividedPowers`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section60.6 (07HQ), unnumbered paragraph between Lemmas60.6.2 (07HS) and60.6.3 (07HT); chapter PDF p.12. The source defines weighted products and states the ordinary-power inclusion and degree-one identity. The proof steps give the indicated elementary consequence on the pinned ideal and divided-power carriers.

Literal source excerpt:

> ideal generated by

Acceptance:

- The index-one identity is equality with the specified ideal, not with its radical.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Decreasing divided power filtration

**Node:** CrystallineCohomology:CR.0/pd-filtration-antitone. **Kind:** lemma.

**Declaration:** `TauCeti.PD.pdFiltration_antitone`. All implementation status remains unchecked.

The function n↦Fⁿ_γI is antitone: if n≤m, then Fᵐ_γI⊆Fⁿ_γI.

Hypotheses and conventions: R is a commutative ring, I is an ideal of R and γ is an existing divided-power structure on I.

Proof outline:

1. A word of total weight at least m also has total weight at least n. Apply Ideal.span_mono to the inclusion of generating sets.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `mathlib:Ideal.span_mono`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section60.6 (07HQ), unnumbered paragraph between Lemmas60.6.2 (07HS) and60.6.3 (07HT); chapter PDF p.12. The source defines weighted products and states the ordinary-power inclusion and degree-one identity. The proof steps give the indicated elementary consequence on the pinned ideal and divided-power carriers.

Literal source excerpt:

> ideal generated by

Acceptance:

- The inclusion direction follows increasing thresholds, including n=0.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Multiplicativity of divided power filtration

**Node:** CrystallineCohomology:CR.0/pd-filtration-mul. **Kind:** lemma.

**Declaration:** `TauCeti.PD.pdFiltration_mul`. All implementation status remains unchecked.

For all m,n≥0, (Fᵐ_γI)(Fⁿ_γI)⊆F^(m+n)_γI.

Hypotheses and conventions: R is a commutative ring, I is an ideal of R and γ is an existing divided-power structure on I.

Proof outline:

1. Use Ideal.span_mul_span to reduce the product of generated ideals to pairwise products of generating words.
2. Concatenate the two finite lists. Its total weight is the sum of the weights and its value is the product of the two values. Ideal.subset_span puts this concatenated word in F^(m+n)_γI; Ideal.span_le completes the inclusion.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `mathlib:Ideal.span_mul_span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section60.6 (07HQ), unnumbered paragraph between Lemmas60.6.2 (07HS) and60.6.3 (07HT); chapter PDF p.12. The source defines weighted products and states the ordinary-power inclusion and degree-one identity. The proof steps give the indicated elementary consequence on the pinned ideal and divided-power carriers.

Literal source excerpt:

> ideal generated by

Acceptance:

- Empty words make the m=0 and n=0 cases consistent with the ordinary unit ideal.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Ordinary powers inside divided powers

**Node:** CrystallineCohomology:CR.0/pd-filtration-ordinary-powers. **Kind:** lemma.

**Declaration:** `TauCeti.PD.pow_le_pdFiltration`. All implementation status remains unchecked.

For every n≥0, Iⁿ⊆Fⁿ_γI, with the usual ideal power on the left.

Hypotheses and conventions: R is a commutative ring, I is an ideal of R and γ is an existing divided-power structure on I.

Proof outline:

1. Induct on n. The base case is pdFiltration_zero and I⁰=R.
2. For the successor multiply the induction inclusion by I=F¹_γI using pdFiltration_one. Apply pdFiltration_mul and the ordinary ideal-power recursion.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-filtration-zero`, `CrystallineCohomology:CR.0/pd-filtration-one`, `CrystallineCohomology:CR.0/pd-filtration-mul`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section60.6 (07HQ), unnumbered paragraph between Lemmas60.6.2 (07HS) and60.6.3 (07HT); chapter PDF p.12. The source defines weighted products and states the ordinary-power inclusion and degree-one identity. The proof steps give the indicated elementary consequence on the pinned ideal and divided-power carriers.

Literal source excerpt:

> ideal generated by

Acceptance:

- For the canonical divided powers on (2) in ℤ₂ the n=2 inclusion is strict.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Divided power maps preserve filtration

**Node:** CrystallineCohomology:CR.0/pd-filtration-map. **Kind:** lemma.

**Declaration:** `TauCeti.PD.map_pdFiltration_le`. All implementation status remains unchecked.

Let f:R→S be a ring homomorphism, J an ideal of S and δ a divided-power structure on J. If f is a divided-power morphism from (I,γ) to (J,δ), then f(Fⁿ_γI)S⊆Fⁿ_δJ for every n≥0, where the left side is Ideal.map.

Hypotheses and conventions: R is a commutative ring, I is an ideal of R and γ is an existing divided-power structure on I. S is commutative, f:R→S is a ring homomorphism, J is an ideal of S and δ is a divided-power structure on J. f is an existing DividedPowers.IsDPMorphism γ δ.

Proof outline:

1. Use Ideal.map_span and Ideal.span_le to test images of generating words.
2. The defining ideal-containment condition sends every xⱼ∈I into J. DividedPowers.IsDPMorphism.map_dpow and multiplicativity of f identify the image with the word of the same weights in J. Apply Ideal.subset_span.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `mathlib:DividedPowers.IsDPMorphism`, `mathlib:DividedPowers.IsDPMorphism.map_dpow`, `mathlib:Ideal.map_span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section60.6 (07HQ), unnumbered paragraph between Lemmas60.6.2 (07HS) and60.6.3 (07HT); chapter PDF p.12. The source defines weighted products and states the ordinary-power inclusion and degree-one identity. The proof steps give the indicated elementary consequence on the pinned ideal and divided-power carriers.

Literal source excerpt:

> ideal generated by

Acceptance:

- No flatness or surjectivity is needed for this inclusion; identity and composition give the expected containments.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Surjective divided power maps and filtration

**Node:** CrystallineCohomology:CR.0/pd-filtration-map-surjective. **Kind:** lemma.

**Declaration:** `TauCeti.PD.map_pdFiltration_of_surjective`. All implementation status remains unchecked.

In the setting of map_pdFiltration_le, assume f:R→S is surjective and I.map(f)=J. Then (Fⁿ_γI).map(f)=Fⁿ_δJ for every n≥0.

Hypotheses and conventions: R is a commutative ring, I is an ideal of R and γ is an existing divided-power structure on I. S is commutative, f:R→S is a ring homomorphism, J is an ideal of S and δ is a divided-power structure on J. f is an existing DividedPowers.IsDPMorphism γ δ. f is surjective and I.map(f)=J.

Proof outline:

1. One inclusion is pd-filtration-map.
2. For each entry yⱼ∈J of a generating word use I.map(f)=J and Ideal.mem_map_iff_of_surjective to choose xⱼ∈I with f(xⱼ)=yⱼ. Keep its weight eⱼ.
3. The lifted word belongs to Fⁿ_γI by Ideal.subset_span. Preservation of divided powers identifies its image with the given target word. Ideal.map_span and Ideal.span_le yield the reverse containment.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-filtration-map`, `mathlib:Ideal.mem_map_iff_of_surjective`, `mathlib:DividedPowers.IsDPMorphism.map_dpow`, `mathlib:Ideal.map_span`, `mathlib:Ideal.span_le`, `mathlib:Ideal.subset_span`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section60.6 (07HQ), unnumbered paragraph between Lemmas60.6.2 (07HS) and60.6.3 (07HT); chapter PDF p.12. The source defines weighted products and states the ordinary-power inclusion and degree-one identity. The proof steps give the indicated elementary consequence on the pinned ideal and divided-power carriers.

Literal source excerpt:

> ideal generated by

Acceptance:

- For a compatible quotient PD structure, the quotient filtration is the image of the original filtration.
- The hypothesis on the ideal image is retained; surjectivity of the ring homomorphism alone does not specify the target PD ideal.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Rational divided powers equal ordinary powers

**Node:** CrystallineCohomology:CR.0/pd-filtration-rational. **Kind:** lemma.

**Declaration:** `TauCeti.PD.pdFiltration_eq_pow_of_ratAlgebra`. All implementation status remains unchecked.

If R is a ℚ-algebra, then for every ideal I, every divided-power structure γ on I and n≥0, Fⁿ_γI=Iⁿ.

Hypotheses and conventions: R is a commutative ring, I is an ideal of R and γ is an existing divided-power structure on I. R carries a ℚ-algebra structure.

Proof outline:

1. For x∈I the pinned DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul gives γ_e(x)=(1/e!)xᵉ, including e=0.
2. By Ideal.pow_mem_pow, xᵉ belongs to Iᵉ. Multiplication by the rational scalar preserves that ideal. Induction on word length places each product of weight w in Iʷ.
3. For w≥n, Ideal.pow_le_pow_right gives Iʷ⊆Iⁿ. Ideal.span_le yields Fⁿ_γI⊆Iⁿ. The reverse inclusion is pd-filtration-ordinary-powers.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-filtration-ordinary-powers`, `mathlib:DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul`, `mathlib:Ideal.pow_mem_pow`, `mathlib:Ideal.pow_le_pow_right`, `mathlib:Ideal.span_le`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Section60.6 (07HQ), unnumbered paragraph between Lemmas60.6.2 (07HS) and60.6.3 (07HT); chapter PDF p.12. The source defines weighted products and states the ordinary-power inclusion and degree-one identity. The proof steps give the indicated elementary consequence on the pinned ideal and divided-power carriers.

Literal source excerpt:

> ideal generated by

Acceptance:

- This supplies the precise comparison with existing ideal powers in characteristic zero; the ℤ₂ counterexample prevents removing the ℚ-algebra assumption.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Canonical divided powers on the augmentation ideal

**Node:** CrystallineCohomology:CR.0/gamma-canonical-pd. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.gammaPD`. All implementation status remains unchecked.

For any commutative ring A and A-module M, equip the existing Γ_A(M) augmentation ideal Γ⁺ with canonical divided powers satisfying δ_n(dp₁(m))=dp_n(m). Every A-linear map M→K into a PD ideal extends uniquely to a PD A-algebra map Γ_A(M)→C. The underlying algebra map is the pinned DividedPowerAlgebra.lift.

Hypotheses and conventions: A commutative; M an A-module; target K carries specified divided powers.

Uses:

- Stacks §23.5; CR.0/pd-polynomial and pd-envelope: Extends the polynomial divided-power operations to the pinned Γ carrier and makes its weak lift a PD map, which is the presentation input for universal envelopes.

Proof outline:

1. Construct the free-module structure by integral divided-monomial coefficient identities; coefficients are integers, so scalar specialization does not divide inside A.
2. Present M by a free module; show the kernel relations defining Γ_A(M) are stable under the canonical positive operations, using finite-sum and iteration identities. Descend through the existing quotient PD construction.
3. On dp-generators the pinned lift has the required values. Prove preservation of operations by the same finite-sum identities; uniqueness follows from algebra generation. The arbitrary-module descent certificate is recorded as a proof gap.

Direct prerequisites: `CrystallineCohomology:CR.0/gamma-augmentation-ideal`, `CrystallineCohomology:CR.0/generator-criterion`, `CrystallineCohomology:CR.0/gamma-augmentation-ideal-generators`, `mathlib:DividedPowerAlgebra.lift`, `mathlib:DividedPowers.Quotient.dividedPowers`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, Lemma23.5.1 and infinite-variable Remark23.5.2; extension to arbitrary M by the stated quotient proof. The passage proves the free polynomial case. The arbitrary-module extension requires the explicitly recorded kernel-stability proof, rather than attributing it to this passage.

Literal source excerpt:

> divided power polynomial algebra

API outline:

- `TauCeti.Crystalline.gammaPD_generator` (simp): δ_n(dp₁(m))=dp_n(m) for m∈M.
- `TauCeti.Crystalline.gammaPD_lift` (universal-property): PD A-algebra maps Γ_A(M)→(C,K) correspond to A-linear maps M→K.
- `TauCeti.Crystalline.gammaPD_map` (functoriality): The pinned Γ map of an A-linear map preserves canonical augmentation divided powers.

Unit tests:

- `TauCeti.Crystalline.test_gammaPD_zero` (degenerate): For M=0, Γ⁺=0 and its PD structure is the zero-ideal structure.
- `TauCeti.Crystalline.test_gammaPD_free_generator` (computation): In Γ_A(A), δ₂(dp₁(1))=dp₂(1), while dp₁(1)²=2dp₂(1).
- `TauCeti.Crystalline.test_gammaPD_F2` (non-example): Over F₂ the free rank-one generator has square zero but its second divided power is nonzero.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Relative divided power polynomial algebras

**Node:** CrystallineCohomology:CR.0/pd-polynomial. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.pdPolynomial`. All implementation status remains unchecked.

Over a PD ring (A,I,γ) and any variable set W, use Γ_A(A^(W)) as A⟨x_w⟩. Its PD ideal is IA⟨x_w⟩+Γ⁺. It has the divided-monomial A-basis indexed by finite-support W→N, multiplication x^[e]x^[f]=(∏_w binom(e_w+f_w,e_w))x^[e+f], and δ_n(x_w)=x_w^[n]. Maps of PD A-algebras correspond to W-tuples in the target PD ideal.

Hypotheses and conventions: W arbitrary; I carries γ.

Uses:

- Stacks §§60.2,60.6; CR.2/pd-poincare: Provides graph-envelope divided coordinates, their finite monomial basis and the contraction d(x^[n])=x^[n−1]dx; the universal tuple API avoids expanding the presentation.

Proof outline:

1. Identify the existing Γ free-module presentation with the divided-monomial algebra by mutually inverse generator maps and the integral multiplication identities.
2. Free-module flatness supplies extended base divided powers. Glue these to canonical augmentation powers using the retained intersection/product identity.
3. Use finite supports for arbitrary W; evaluate a monomial as the product of target divided powers. Its multiplicativity and PD compatibility follow from the target axioms.

Direct prerequisites: `CrystallineCohomology:CR.0/gamma-canonical-pd`, `CrystallineCohomology:CR.0/flat-extension`, `CrystallineCohomology:CR.0/gamma-base-ideal-intersection`, `CrystallineCohomology:CR.0/product-intersection-gluing`.

Source: [The Stacks Project Authors, Divided Power Algebra](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex), §23.5, Lemma23.5.1 with proof and Remark23.5.2. The free divided-monomial algebra, compatible ideal, and universal property are exactly this passage.

Literal source excerpt:

> homomorphism of divided power rings

API outline:

- `TauCeti.Crystalline.pdPolynomial_basis` (structure): The finite-support divided monomials give an A-basis.
- `TauCeti.Crystalline.pdPolynomial_lift` (universal-property): A PD-base map and elements k_w∈K determine the unique PD map with x_w↦k_w.
- `TauCeti.Crystalline.pdPolynomial_monomial_mul` (simp): The product has the displayed product of binomial coefficients.

Unit tests:

- `TauCeti.Crystalline.test_pdPolynomial_no_variables` (degenerate): With W empty the relative PD algebra is (A,I,γ).
- `TauCeti.Crystalline.test_pdPolynomial_two` (computation): x^[1]x^[1]=2x^[2] over Z, and x^[2] remains a nonzero basis vector over F₂.
- `TauCeti.Crystalline.test_pdPolynomial_eval` (characterisation): Evaluation at a specified k∈K sends x^[n] to δ_n(k), including n=0.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Universal base-compatible divided power envelope

**Node:** CrystallineCohomology:CR.0/pd-envelope. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.PDEnvelope`. All implementation status remains unchecked.

For a PD base (A,I,γ), an A-algebra B and ideal J with IB⊆J, construct a PD A-algebra (D,J̄,δ) and B→D carrying J into J̄, initial among all such extensions. Precomposition identifies PD A-maps D→(C,K,ε) with A-algebra maps B→C carrying J into K. The quotient D/J̄ is canonically B/J.

Hypotheses and conventions: IB⊆J; no Noetherian, torsionfree or regularity hypothesis.

Uses:

- Stacks §§60.3,60.11,60.19; LZ §1.2; CR.1/crystalline-site: Turns an embedding or graph ideal into a universal PD thickening; lift, quotient and functoriality supply crystal evaluation and comparison maps.

Proof outline:

1. Choose generators f_t of J. In B⟨x_t⟩ impose x_t=f_t and all PD-base relations δ_n(Σr_tx_t)=γ_n(r₀) for Σr_tf_t=r₀∈I; take the stable relation ideal.
2. Evaluate x_t at the image of f_t in every compatible PD target. The relations hold there, yielding existence and uniqueness.
3. The universal property identifies the quotient with B/J and makes the construction independent of generators. The inherited source-index correction t∈T is retained.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-polynomial`, `mathlib:DividedPowers.Quotient.dividedPowers`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.2, Lemmas60.2.1–4 and Definition60.2.2. Initiality, quotient, and generator-relation presentation are proved with the stated containment.

Literal source excerpt:

> with $IB \subset J$

API outline:

- `TauCeti.Crystalline.PDEnvelope.lift` (universal-property): Every compatible B→C with image(J)⊆K extends uniquely to a PD A-map.
- `TauCeti.Crystalline.PDEnvelope.quotient` (equivalence): D/J̄≅B/J compatibly with B.
- `TauCeti.Crystalline.PDEnvelope.map` (functoriality): A commutative map of PD bases and ring/ideal pairs induces the unique envelope map, with identity/composition laws.

Unit tests:

- `TauCeti.Crystalline.test_envelope_zero` (degenerate): If I=J=0, D=B with zero PD ideal.
- `TauCeti.Crystalline.test_envelope_existing` (characterisation): If B has a specified compatible PD ideal J, evaluation D→B splits B→D; D need not equal B unless the forgotten pair already has the universal extension property.
- `TauCeti.Crystalline.test_envelope_Fp_t` (computation): For B=F_p[t], J=(t), D=F_p⟨t⟩ and t^p=0 in D, so B→D is not injective.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

The concrete Γ-quotient, PD powers, unique lift and quotient are typed. Functoriality is typed over a fixed PD base; arbitrary change of PD base still requires its exact coefficient square and compatible base powers.

### Envelope quotient and transitivity

**Node:** CrystallineCohomology:CR.0/envelope-quotient-transitivity. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.envelopeQuotientTransitivity`. All implementation status remains unchecked.

For a surjection B′→B with kernel K⊆J′ and J the image of J′, D_B(J) is D_B′(J′) modulo the ideal generated by γ_n(k), k∈K,n≥1. It is PD-stable. For nested such kernels K⊆L⊆J′ the iterated envelope quotient agrees with the quotient for L, through the unique maps inducing the same map on B′. This is transitivity of compatible PD quotient envelopes; no claim identifies an arbitrary iterated PD envelope with an ordinary pushout.

Hypotheses and conventions: All ring/ideal pairs contain the relevant base ideal; no assertion that an ordinary quotient ideal is automatically PD-stable.

Proof outline:

1. Characterize maps from the proposed quotient: they are exactly envelope maps killing K.
2. Apply the envelope initiality twice; both iterated and direct constructions represent the same functor.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-envelope`, `mathlib:DividedPowers.Quotient.dividedPowers`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.2, property(4) after Definition60.2.2 and presentation Lemma60.2.4. Use precisely the source containment K⊆J′; transitivity follows by applying this quotient universal property twice.

Literal source excerpt:

> universal property

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

The first quotient is typed as a surjective algebra map with the exact PD-generated kernel and operation compatibility, hence determines the quotient equivalence. The nested-kernel comparison diagram is not typed.

### Exact base change of divided power envelopes

**Node:** CrystallineCohomology:CR.0/envelope-base-change. **Kind:** comparison.

**Declaration:** `TauCeti.Crystalline.envelopeBaseChange`. All implementation status remains unchecked.

Over a fixed PD base A, if B/J is the quotient pair and B→B′ satisfies flatness B/IB→B′/IB′ and Tor₁^B(B′,B/IB)=0, then D_B(J)⊗_B B′≅D_B′(JB′). For change of PD base (B,I,γ)→(B′,I′,γ′), if B/I→B′/I′ is flat, J′=JB′+I′, then D_B(J)⊗_B B′≅D_B′(J′). Arbitrary maps always give comparison maps, but these equivalences retain their hypotheses.

Hypotheses and conventions: In the first formula IB⊆J; the two listed conditions are separate. In the second formula (B,I) is the PD base and J contains I.

Proof outline:

1. Present the envelope through a polynomial algebra. Quotient flatness and Tor₁ identify the intersection of the relation ideal with the extended base ideal.
2. The extended relation ideal is PD-stable by scalar powers and finite-sum expansion. Descend the extended PD structure and compare the universal mapping properties.
3. Keep the two distinct source theorems rather than merging their hypotheses.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-envelope`, `CrystallineCohomology:CR.0/flat-extension`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.2, Lemmas60.2.6–7 with proofs. Both precise base-change contracts are stated and proved here.

Literal source excerpt:

> \text{Tor}_1

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.envelopeBaseChange`.

The missing forms require the exact PD-base-change Tor hypotheses, ordinary p-complete topological algebra and continuous morphisms from DD.1, and the actual Fontaine θ/coefficient/PD-kernel certificate from AI.0. They must retain these conditions on the concrete Γ quotient and its ideals.

### Localization of divided power envelopes

**Node:** CrystallineCohomology:CR.0/envelope-localization. **Kind:** comparison.

**Declaration:** `TauCeti.Crystalline.envelopeLocalization`. All implementation status remains unchecked.

For any multiplicative subset S⊂B, S⁻¹D_B(J) with its extended compatible PD ideal is the envelope of S⁻¹J in S⁻¹B over the localized base as appropriate. The divided powers of x/s are γ_n(x)/s^n; retain compatibility when localizing the PD base.

Hypotheses and conventions: The ring/ideal pair contains the image of the PD base ideal.

Proof outline:

1. Use flat localization and the retained scalar-extension formula to define the PD structure.
2. Maps out of the localization are precisely envelope maps for which S becomes invertible; apply initiality.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-envelope`, `CrystallineCohomology:CR.0/localization-formula`, `mathlib:IsLocalization.flat`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.2, base-change Lemmas60.2.6–7, specialized to localization. Localization meets the flatness and Tor conditions; initiality proves the displayed specialization.

Literal source excerpt:

> flat

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

The localized envelope is typed by the ordinary localization universal property and normalization of the B map. The localized operation formula and simultaneous PD-base localization diagram are not typed.

### Divided power stability of the weighted filtration

**Node:** CrystallineCohomology:CR.0/pd-filtration-stability. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.pdFiltration_dpow`. All implementation status remains unchecked.

For n≥1,m≥1 and x∈Fⁿ_γI, γ_m(x)∈F^(mn)_γI. Thus every positive filtration ideal is a sub-PD ideal and the pinned quotient structure descends to R/Fⁿ_γI.

Hypotheses and conventions: n,m positive; γ defined on I and Fⁿ⊆I.

Proof outline:

1. Expand γ_m of a finite ideal-span expression using scalar and sum axioms. For one weighted product, isolate a positive-weight factor and use multiplication and iteration to obtain integral coefficients of products of total weight at least mn.
2. Each summand of the convolution has total degree at least n times its γ-order; sum those orders to m. Take the existing span containment criterion.
3. For m=0 do not assert membership of 1 in a positive filtration ideal.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `CrystallineCohomology:CR.0/pd-filtration-one`, `CrystallineCohomology:CR.0/pd-filtration-antitone`, `CrystallineCohomology:CR.0/iteration-addition`, `CrystallineCohomology:CR.0/multiplication-addition`, `CrystallineCohomology:CR.0/sum-convolution`, `mathlib:DividedPowers.Quotient.dividedPowers`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.6 weighted-product definition; consequence proved by the stated axioms. The filtration definition is the source input; the stronger bound is an explicit axiomatic derivation.

Literal source excerpt:

> ideal generated by

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Ordinary, divided power and p-local nilpotence

**Node:** CrystallineCohomology:CR.0/nilpotence-predicates. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.IsPDNilpotent`. All implementation status remains unchecked.

Ordinary nilpotence means I^N=0 for some N. PD nilpotence means Fⁿ_γI=0 for some positive n. Elementwise/local nilpotence means each element or each local section has some vanishing ordinary power. For a p-crystalline thickening require p locally nilpotent in its structure sheaf; this does not require a uniform ordinary bound on its entire PD ideal. These are distinct predicates, with PD nilpotence implying ordinary nilpotence; p-adic completeness is another condition.

Hypotheses and conventions: A commutative ring with PD ideal (I,γ); p prime for the p-local specialization.

Uses:

- Stacks §§60.3,60.7; CR.1/crystalline-site: Controls admissibility of thickenings and distinguishes p-local nilpotence from a uniform bound on the entire PD ideal, so ordinary and PD completions are not conflated.

Proof outline:

1. Define the two uniform conditions using the existing ideal powers and weighted filtration, and the elementwise condition by explicit powers.
2. Use Iⁿ⊆Fⁿ and γ₁=id to relate only the valid implications. The canonical p-PD example at p=2 distinguishes ordinary and divided degrees.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-filtration`, `CrystallineCohomology:CR.0/pd-filtration-ordinary-powers`, `mathlib:PadicInt.dividedPowers`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.5, affine-site remarks; §60.8 Situation60.7.5. The source requires p locally nilpotent and derives local nilpotence of the PD ideal, not a uniform bound.

Literal source excerpt:

> locally nilpotent

API outline:

- `TauCeti.Crystalline.pdNilpotent_iff` (characterisation): PD nilpotent iff FⁿI=0 for some n>0.
- `TauCeti.Crystalline.pdNilpotent_ordinary` (compatibility): PD nilpotence implies ordinary ideal nilpotence.
- `TauCeti.Crystalline.pdNilpotent_map` (functoriality): A surjective PD map with exact ideal image preserves a PD-nilpotence bound.

Unit tests:

- `TauCeti.Crystalline.test_nilpotent_zero` (degenerate): The zero PD ideal is PD nilpotent with bound1.
- `TauCeti.Crystalline.test_nilpotent_q` (compatibility): For a rational algebra PD nilpotence equals ordinary ideal nilpotence.
- `TauCeti.Crystalline.test_nilpotent_two` (non-example): In Z/4 with the canonical 2-PD structure, (2)²=0 but γ_(2^a)(2) is twice an odd unit for every a≥0, so the PD ideal is not PD nilpotent.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Envelopes of regular immersions

**Node:** CrystallineCohomology:CR.0/regular-envelope. **Kind:** comparison.

**Declaration:** `TauCeti.Crystalline.regularEnvelope`. All implementation status remains unchecked.

If A is an F_p-algebra and I=(f₁,…,f_r) a regular sequence, D_A(I)≅A⟨x₁,…,x_r⟩/(x_i−f_i), is the ordinary tensor product of the principal envelopes, and has the explicit module decomposition ⊕_(j₁,…,j_r≥0) A/(f₁^p,…,f_r^p)·∏γ_(j_i p)(f_i). If A and A/I are flat over Z/p^n and I is generated by a regular sequence, the compatible envelope is Z/p^n-flat and commutes with reduction modulo p. These are the PD-side lemmas; DD.4 alone owns the derived de Rham comparison.

Hypotheses and conventions: Regular sequence in the first statement; flat A and A/I in the second; canonical powers on p.

Proof outline:

1. Use the envelope presentation and the Koszul relations to eliminate divided relations γ_m(f_j x_i−f_i x_j).
2. The regularity of f_i and of their pth powers identifies the principal module decompositions and kills higher Tor among principal envelopes.
3. For Z/p^n, the two-term regular-element resolution has finite flat dimension, hence is flat over Z/p^n; flat quotient gives mod-p regularity and the reduction diagram.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-envelope`, `CrystallineCohomology:CR.0/pd-polynomial`, `CrystallineCohomology:CR.0/envelope-quotient-transitivity`, `DerivedDeRhamCohomology:DD.0`.

Source: [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560), §3.3, Lemmas3.37–3.38, pp.16–17. The statement isolates the classical envelope presentation, flatness and reduction; Corollary3.40 is exported to DD.4.

Literal source excerpt:

> regular sequence

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

The characteristic-p regular-sequence module equivalence and divided-monomial formula are typed. The Z/p^n flatness and reduction conclusions of the full node are not typed.

### Completed PD envelopes and the derived-completion comparison

**Node:** CrystallineCohomology:CR.0/completed-envelope. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.completedEnvelope`. All implementation status remains unchecked.

For the universal envelope D, define its completed underlying complex as LΛ_p(D)=Rlim_e(D⊗^L Z/p^e). If D has bounded p-power torsion, its degree-zero derived completion is the ordinary p-adic completion and the negative derived-limit obstruction vanishes; for p-torsionfree D the finite reductions are ordinary D/p^e. Extend divided powers continuously to the closure of the specified PD ideal in the ordinary completion whenever its divided-power operations are p-adically continuous; if the chosen crystalline base ideal contains p, retain its canonical powers. Do not equip an arbitrary derived complex with ordinary ideal operations.

Hypotheses and conventions: p prime; choose the canonical divided powers on p compatible with the base. For the ordinary PD completion require the bounded-torsion and continuity clauses, or the p-torsionfree envelope case.

Uses:

- Bhatt §9; BMS1 Definition3.22; CohomologyComparisons:CP.0: Makes finite-level envelope powers and coefficient maps compatible with an ordinary p-complete limit; the continuous universal property retains completeness and bounded-torsion hypotheses.

Proof outline:

1. Import DD.1 derived completion and its bounded-torsion comparison; apply to D rather than choosing a second envelope.
2. Use scalar and sum identities to prove continuity of γ_n for each fixed n; at p=2 retain the canonical powers and do not impose PD-nilpotence on (p).
3. The universal property extends maps into p-complete PD targets whose ideal and operators satisfy the same continuity condition.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-envelope`, `CrystallineCohomology:CR.0/nilpotence-predicates`, `DerivedDeRhamCohomology:DD.1/derived-completion`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.5, Remarks on p-adic completion of a divided power envelope. The ordinary envelope completion and its finite-level thickenings are used here; the derived replacement and torsion criterion are imported from DD.1.

Literal source excerpt:

> $p$-adic completion

API outline:

- `TauCeti.Crystalline.completedEnvelope_reduction` (compatibility): For p-torsionfree D, LΛ_p(D)⊗^L Z/p^e≅D/p^e.
- `TauCeti.Crystalline.completedEnvelope_lift` (universal-property): A continuous compatible PD map D→C into a complete separated C extends uniquely to D̂→C.
- `TauCeti.Crystalline.completedEnvelope_functorial` (functoriality): Envelope maps induce derived completion maps and, under the ordinary criteria, continuous PD maps.

Unit tests:

- `TauCeti.Crystalline.test_completedEnvelope_Zp` (compatibility): The completion of (Z_(p),(p)) with canonical powers is the existing Z_p PD ring, including p=2.
- `TauCeti.Crystalline.test_completedEnvelope_modp` (computation): A p-killed envelope has derived completion equal to itself in degree0.
- `TauCeti.Crystalline.test_completedEnvelope_p2` (non-example): The ideal(2) in Z₂ is complete but its canonical divided powers are not PD nilpotent.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.completedEnvelope`, `TauCeti.Crystalline.completedEnvelope_reduction`, `TauCeti.Crystalline.completedEnvelope_lift`, `TauCeti.Crystalline.completedEnvelope_functorial`, `TauCeti.Crystalline.test_completedEnvelope_Zp`, `TauCeti.Crystalline.test_completedEnvelope_modp`, `TauCeti.Crystalline.test_completedEnvelope_p2`.

The missing forms require the exact PD-base-change Tor hypotheses, ordinary p-complete topological algebra and continuous morphisms from DD.1, and the actual Fontaine θ/coefficient/PD-kernel certificate from AI.0. They must retain these conditions on the concrete Γ quotient and its ideals.

### The common Fontaine crystalline envelope

**Node:** CrystallineCohomology:CR.0/fontaine-envelope. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.fontaineEnvelope`. All implementation status remains unchecked.

For the AI.0-supplied A_inf=W(O_C^♭) and θ:A_inf→O_C, take the envelope D of kerθ over the zero-ideal PD base(Z_p,0) and set A_cris=D̂_p by the preceding ordinary-completion criterion. This object comes with A_inf→D→A_cris, θ extended to A_cris→O_C with zero target PD ideal for the kerθ powers, and functorial PD maps induced by Witt reduction when the target ideal contains the image of kerθ. For crystalline use over O_C/p, extend the powers to(p)+kerθ and impose compatibility with the canonical p-PD base; θ then has target PD ideal(p), not zero. AI.0 and PadicHodgeTheory identify their Fontaine presentations with this underlying ring by the qualified universal property.

Hypotheses and conventions: C is a complete algebraically closed extension of Q_p, or a supplier-certified generalization with θ surjective, kerθ principal regular and the required envelope p-torsion/continuity facts. A Witt reduction map induces a PD map only with the required kernel-image containment.

Uses:

- Bhatt Notation9.1–Proposition9.9; BMS1 Definition3.22; AInfCohomology:AI.0:integral: Supplies the common integral A_cris coefficient object and the θ quotient to period comparisons. Its base ideal is zero; the enlarged ideal (p)+kerθ is a separate PD extension.

Proof outline:

1. Import the A_inf/θ pair and Witt maps from AI.0; do not define them here.
2. Apply the envelope and completed-envelope universal properties. Request the p-torsionfree certificate for this particular D before using ordinary completion.
3. Two Fontaine presentations equipped with these universal maps are uniquely isomorphic. This is the common export, not a duplicate period-ring definition.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-envelope`, `CrystallineCohomology:CR.0/completed-envelope`, `AInfCohomology:AI.0`.

Source: [Bhargav Bhatt, p-adic derived de Rham cohomology](https://arxiv.org/pdf/1204.6560), §9, Proposition9.9 and proof; BMS1 Definition3.22 gives the ordinary subalgebra presentation. The ordinary universal-envelope side is separated from DD.4 derived comparisons and from the AI.0 period-ring presentation.

Literal source excerpt:

> pd-envelope

API outline:

- `TauCeti.Crystalline.fontaineEnvelope_initial` (universal-property): Compatible PD targets of the pair(A_inf,kerθ) receive a unique envelope map.
- `TauCeti.Crystalline.fontaineEnvelope_theta` (projection): The extended θ annihilates the envelope PD ideal and agrees with θ on A_inf.
- `TauCeti.Crystalline.fontaineEnvelope_identify` (equivalence): Any supplier Fontaine presentation satisfying the same completed universal property is uniquely PD-isomorphic, over A_inf.

Unit tests:

- `TauCeti.Crystalline.test_fontaineEnvelope_theta` (computation): Every γ_n(x),x∈kerθ,n>0 maps to0 under the extended θ.
- `TauCeti.Crystalline.test_fontaineEnvelope_identity` (characterisation): The comparison of a Fontaine presentation with itself is the identity by uniqueness.
- `TauCeti.Crystalline.test_fontaineEnvelope_p2` (compatibility): At p=2,2 does not belong to kerθ since θ(2)=2; it belongs to the enlarged crystalline ideal(2)+kerθ with its canonical powers.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.fontaineEnvelope`, `TauCeti.Crystalline.fontaineEnvelope_initial`, `TauCeti.Crystalline.fontaineEnvelope_theta`, `TauCeti.Crystalline.fontaineEnvelope_identify`, `TauCeti.Crystalline.test_fontaineEnvelope_theta`, `TauCeti.Crystalline.test_fontaineEnvelope_identity`, `TauCeti.Crystalline.test_fontaineEnvelope_p2`.

The missing forms require the exact PD-base-change Tor hypotheses, ordinary p-complete topological algebra and continuous morphisms from DD.1, and the actual Fontaine θ/coefficient/PD-kernel certificate from AI.0. They must retain these conditions on the concrete Γ quotient and its ideals.

### CR.0 continuation required for closure

- Canonical augmentation PD descent certificate: The free-module construction is explicit, but the arbitrary-module quotient must be shown PD-stable for the exact pinned Γ presentation; no free-monomial basis is asserted for arbitrary M.
- Ordinary completed-envelope continuity and bounded torsion: Check the exact DD.1 bounded-p-torsion comparison and the ideal closure/operation continuity on each ordinary completed PD envelope; the Fontaine case additionally awaits its AI.0 certificate.
- Supplier contract AInfCohomology:AI.0: Export the common(A_inf,θ,kerθ) Fontaine input, its Witt reduction maps and their precise PD-target kernel containment; prove the ordinary envelope p-torsionfree/continuity certificate used in constructing the common A_cris. Identify the AI.0 Fontaine presentation by this initiality, without a reverse dependency through completed p-adic Hodge comparison.
- Precise prototype obligations: CR.0: The missing forms require the exact PD-base-change Tor hypotheses, ordinary p-complete topological algebra and continuous morphisms from DD.1, and the actual Fontaine θ/coefficient/PD-kernel certificate from AI.0. They must retain these conditions on the concrete Γ quotient and its ideals. The signatureCoverage register lists every omitted name and the exact limitations of every typed component. No comment-only form is included in the compilation counts.

## CR.1 — Crystalline sites, structure sheaves and crystals

A PD scheme has quasi-coherent affine ideal data and compatible operations
on affine restrictions. A crystalline object is an actual closed immersion
U→T over the specified base, with kernel equal to the PD ideal and p locally
nilpotent. The big site admits U→X; the small site is the full subcategory
where U is an open of X. Open covers are induced by compatible opens of the
thickening T. The small topology is accompanied by its cover criterion;
an induced topology alone does not establish that criterion.

The structure and quotient presheaves evaluate on T and U. Their sectionwise
kernel gives the PD ideal, while exactness in sheaves requires the E1 module
kernel and epimorphism theorem. A sheaf epimorphism need not be surjective
on every object's sections. The big/small maps satisfy the specified
composite identity; this is not an equivalence of arbitrary sheaf topoi.

Crystals have actual cartesian module pullback isomorphisms. Finite locally
free crystals form the rigid coefficient category used by the duality and
Dieudonné consumers, but need not form an abelian subcategory. W-crystals are
compatible finite-Witt families. Rationalization changes morphisms; an
F-crystal has a specified pullback map, and nondegeneracy is an additional
bounded two-sided p-power inverse condition. The Taylor equivalence passes
through a PD stratification on the diagonal and its triple cocycle.
Coordinate connections must satisfy integrability and the local p-adic
quasi-nilpotence condition on every section. The finite Taylor API is chosen
for the coordinate-change and crystal-reconstruction proof.

Acceptance checks distinguish the identity thickening from the non-nilpotent
Z_p thickening, preserve ideal/PD operations on affines, verify the triple
Taylor cocycle, detect a connection with non-nilpotent operator, and exclude
zero Frobenius from the nondegenerate category. Full coefficient and
topology-change signatures remain tied to E1/E2 and the coordinate audit.

Atlas planets: Crystalline site; Crystalline structure sheaf; Crystals in modules; F-crystals and isocrystals; Quasi-nilpotent connections; Crystal–connection equivalence.

Coverage: planned. 10 declaration nodes. The following register states each mathematical target, its direct inputs and source-guided proof.

### Schemes with a quasi-coherent PD ideal

**Node:** CrystallineCohomology:CR.1/pd-scheme. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.PDScheme`. All implementation status remains unchecked.

A PD scheme is an existing scheme T with a quasi-coherent ideal sheaf J and sheaf operations γ_n:J→O_T satisfying the PD axioms on sections, compatible with restriction. A PD morphism is a scheme morphism whose induced ideal map preserves every operation. A PD closed immersion U→T is a closed immersion with ideal J and those powers. A crystalline thickening additionally has the source-required homeomorphism |U|≅|T| and p locally nilpotent on T.

Hypotheses and conventions: Use Mathlib Scheme and affine-open ideal-sheaf data; quasi-coherence and restriction compatibility are required. Fix p prime and the p-nilpotent crystalline convention when using the final sentence.

Uses:

- Stacks §§60.7–60.9; CR.1/crystalline-site: Glues affine PD operations with localization and checks each thickening against its given base powers; affine and restriction APIs supply actual site objects.

Proof outline:

1. Specify powers on each affine ideal and glue via the localization formula, using the existing ideal-sheaf carrier.
2. Closed-immersion kernels identify the quotient structure sheaf. Define morphisms by preservation of the affine powers and glue the equations.

Direct prerequisites: `CrystallineCohomology:CR.0/localization-formula`, `CrystallineCohomology:CR.0/nilpotence-predicates`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.7, divided powers on schemes and Situation60.7.5. This passage globalizes the PD ideal and fixes the thickening convention.

Literal source excerpt:

> quasi-coherent

API outline:

- `TauCeti.Crystalline.PDScheme.affine` (data): On an affine open, J gives its ring ideal and the restricted powers.
- `TauCeti.Crystalline.PDScheme.localize` (compatibility): The powers on a basic open are the localized powers γ_n(x)/s^n.
- `TauCeti.Crystalline.PDScheme.map_comp` (functoriality): Identity and composite PD morphisms preserve all powers.

Unit tests:

- `TauCeti.Crystalline.test_pdScheme_zero` (degenerate): An identity immersion has the zero PD ideal.
- `TauCeti.Crystalline.test_pdScheme_affine` (compatibility): Spec(A/I)→Spec A for a PD ideal recovers precisely the original affine PD ring.
- `TauCeti.Crystalline.test_pdScheme_two` (non-example): Spec F₂→Spec Z/4 is an eligible p-nilpotent thickening although its canonical PD ideal is not PD nilpotent.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

Affine PD scheme and restriction compatibility are typed. The affine test checks the underlying Spec equality; its comparison of affine ideal and operations with the given pair remains required.

### Small and big crystalline sites

**Node:** CrystallineCohomology:CR.1/crystalline-site. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.CrisSite`. All implementation status remains unchecked.

For S a PD scheme with ideal I, p locally nilpotent and X over S₀=V(I), big crystalline objects are diagrams U→T→S, U→X, with U→T a base-compatible PD thickening and p locally nilpotent on T. Morphisms are commuting diagrams of PD schemes. Covers are families of open immersions T_a→T jointly covering T, with U_a=U×_T T_a. The small site is the full object restriction U⊂X open. Fix this Zariski crystalline convention before considering an étale-cover variant.

Hypotheses and conventions: The image of I lies in the thickening ideal; U and T have the same underlying topological space. No uniform nilpotence of the whole PD ideal is imposed.

Uses:

- Stacks §§60.7–60.10; CR.1/structure-sheaves and crystal: Provides the small and big thickening categories and their open-cover topologies on which coefficient modules and structure sheaves are evaluated.

Proof outline:

1. Use PD-envelope products to construct the required fiber products within the PD category.
2. Verify base change and composition of the displayed open covers. The big/small inclusion is defined on this exact convention.

Direct prerequisites: `CrystallineCohomology:CR.1/pd-scheme`, `CrystallineCohomology:CR.0/pd-envelope`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §§60.8–9, big and small crystalline sites. Objects, morphisms and Zariski covers are the Stacks definition.

Literal source excerpt:

> crystalline site

API outline:

- `TauCeti.Crystalline.CrisSite.object` (constructor): A compatible p-nilpotent PD thickening with U→X gives a big object; U open gives a small object.
- `TauCeti.Crystalline.CrisSite.cover_pullback` (structure): The pullback of a jointly surjective family of opens of T is a cover.
- `TauCeti.Crystalline.CrisSite.small_inclusion` (functoriality): The small-object inclusion preserves the displayed covers and composition of morphisms.

Unit tests:

- `TauCeti.Crystalline.test_crisSite_identity` (degenerate): If S₀=S and X=S, the zero-ideal identity object belongs to the small site.
- `TauCeti.Crystalline.test_crisSite_Wn` (computation): For X=Spec k over W_n(k), the canonical X→Spec W_n(k) is an object.
- `TauCeti.Crystalline.test_crisSite_non_nilp` (non-example): Spec k→Spec W(k) is not a finite-level p-nilpotent crystalline object; it enters through the inverse-limit theory.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

Forms requiring their exact supplier input: `TauCeti.Crystalline.test_crisSite_Wn`.

E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms, Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate presentations do not replace these objects.

### Morphisms and comparisons of crystalline sites

**Node:** CrystallineCohomology:CR.1/site-morphisms. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.crisSiteMap`. All implementation status remains unchecked.

For compatible X→Y over PD bases S→S′, construct crystalline pullback/topos morphisms with the source-required base change of thickenings. Construct u:(X/S)_crys→X_Zar by restriction to U and its sheaf formulas, and the big/small maps i and π with π∘i=id. On quasi-coherent crystals their cohomology comparisons use the common affine calculations. Compare the Zariski and étale crystalline cover variants only under a separate descent theorem; the relation πi=id does not assert equivalence of all sheaf topoi.

Hypotheses and conventions: All PD-base and underlying-special-fiber diagrams commute. The variant-comparison scope is quasi-coherent crystal coefficients and the exact topologies stated.

Uses:

- Stacks §§60.8,60.16; CR.2/crystalline-cohomology: Supplies pullback along scheme and PD-base maps, the Zariski projection and restricted topology comparisons, so coefficient and cohomology functoriality use actual ringed-site morphisms.

Proof outline:

1. Use the cover-preserving functors and their adjoints to construct the associated geometric morphisms, keeping inverse/direct images distinct.
2. Prove the small/big formulas on affine thickenings. Import topology change and enhanced derived functor support from E.1/E.2, and audit the exact quasi-coherent comparison theorem.

Direct prerequisites: `CrystallineCohomology:CR.1/crystalline-site`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §§60.8–9 and60.18, small/big morphisms and affine comparison. The construction and πi relation are explicit; an étale variant is an independently recorded proof obligation.

Literal source excerpt:

> morphism of topoi

API outline:

- `TauCeti.Crystalline.crisSiteMap_comp` (functoriality): Compatible diagrams compose to the canonical composite crystalline inverse image.
- `TauCeti.Crystalline.cris_u_sections` (characterisation): For a sheaf F, u_*F over an open U is its sections on the crystalline site of U/S.
- `TauCeti.Crystalline.cris_small_big` (compatibility): The displayed maps satisfy πi=id; the qualified crystal cohomology comparison is separate.

Unit tests:

- `TauCeti.Crystalline.test_crisMap_identity` (degenerate): The identity diagram induces the identity inverse-image functor.
- `TauCeti.Crystalline.test_crisMap_open` (compatibility): Restriction along an open U⊂X is the corresponding slice-site restriction.
- `TauCeti.Crystalline.test_crisMap_variants` (non-example): πi=id alone does not identify arbitrary sheaves of the big and small topoi.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crisSiteMap`, `TauCeti.Crystalline.crisSiteMap_comp`, `TauCeti.Crystalline.cris_u_sections`, `TauCeti.Crystalline.cris_small_big`, `TauCeti.Crystalline.test_crisMap_identity`, `TauCeti.Crystalline.test_crisMap_open`, `TauCeti.Crystalline.test_crisMap_variants`.

E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms, Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate presentations do not replace these objects.

### Structure, quotient and PD-ideal sheaves

**Node:** CrystallineCohomology:CR.1/structure-sheaves. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.crisStructure`. All implementation status remains unchecked.

On either fixed crystalline site, define O_crys(U,T)=Γ(T,O_T), O_X^cris(U,T)=Γ(U,O_U), and J_crys=ker(O_crys→O_X^cris) as sheaves, with pointwise PD operations. The sequence0→J_crys→O_crys→O_X^cris→0 is exact as sheaves. It need not be surjective on global sections of every T. These ring/ideal sheaves provide the ringed crystalline topos.

Hypotheses and conventions: Use the sheaf quotient, not an unjustified objectwise Γ(T)→Γ(U) surjectivity for nonaffine T.

Uses:

- Stacks §§60.9–60.10; CR.1/crystal and CR.2/linearization: Evaluates O_crys and its quotient on a thickening and identifies the PD ideal sheaf as their kernel. The sheaf epimorphism API is needed for exact coefficient constructions.

Proof outline:

1. Open descent proves the two presheaves are sheaves. Affine-local surjectivity proves sheaf epimorphism.
2. The kernel restrictions preserve all PD operations, yielding the sheaf PD ideal.

Direct prerequisites: `CrystallineCohomology:CR.1/crystalline-site`, `CrystallineCohomology:CR.1/pd-scheme`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.10, sheaves on the crystalline site. The objectwise formulas and exact sequence are sheaf-level statements.

Literal source excerpt:

> structure sheaf

API outline:

- `TauCeti.Crystalline.crisStructure_eval` (simp): Evaluation gives O_T on the Zariski slice of a thickening.
- `TauCeti.Crystalline.crisPDideal_kernel` (characterisation): J_crys is the kernel sheaf of the displayed quotient map.
- `TauCeti.Crystalline.crisPDideal_restrict` (compatibility): Restriction maps preserve every divided power.

Unit tests:

- `TauCeti.Crystalline.test_crisStructure_affine` (computation): For T=Spec B,U=Spec(B/J), the sequence evaluates to0→J→B→B/J→0.
- `TauCeti.Crystalline.test_crisStructure_zero` (degenerate): For an identity thickening the evaluated ideal is0.
- `TauCeti.Crystalline.test_crisStructure_sheaf_epi` (non-example): The construction uses local lifts of quotient sections; it does not impose global lifts on nonaffine T.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

Actual ring-valued presheaves/sheaves, the quotient natural transformation, sectionwise kernel and global PD operation compatibility are typed. The kernel as a sheaf of O_crys-modules, short exact sequence, affine B/J test and nonaffine sheaf epimorphism detector require E1.

Forms requiring their exact supplier input: `TauCeti.Crystalline.test_crisStructure_affine`, `TauCeti.Crystalline.test_crisStructure_sheaf_epi`.

E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms, Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate presentations do not replace these objects.

### Quasi-coherent and finite locally free crystals

**Node:** CrystallineCohomology:CR.1/crystal. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.Crystal`. All implementation status remains unchecked.

An O_crys-module sheaf E is a crystal if every morphism f:(U,T)→(U′,T′) gives an isomorphism O_T⊗_(f⁻¹O_T′)f⁻¹(E_T′)→E_T via its canonical restriction map. It is quasi-coherent, respectively finite locally free, if every E_T has that property as an O_T-module. Tensor, internal Hom for finite locally free objects, and dual use these actual module operations. Finite locally free crystals form a rigid tensor exact category, not an arbitrary abelian category.

Hypotheses and conventions: Base change is O_T-linear after the displayed tensor extension; plain equality of restricted modules is insufficient. Exact sequences are those exact on every evaluated thickening.

Uses:

- Stacks §§60.10,60.15,60.17; Esnault–Groechenig §2.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07: Encodes cartesian pullback isomorphisms of modules on thickenings, and exposes evaluation, tensors and duals for the Taylor equivalence and Dieudonné coefficients.

Proof outline:

1. Use the existing sheaf-of-modules notion for O_crys and evaluate on each Zariski slice.
2. The crystal condition is invertibility of the canonical tensor comparison. Tensor and dual comparisons follow from finite locally free base change.
3. Prove exact-category closure for locally split finite locally free sequences; distinguish the finite-type abelian category under smooth Noetherian hypotheses.

Direct prerequisites: `CrystallineCohomology:CR.1/structure-sheaves`, `CrystallineCohomology:CR.1/site-morphisms`, `mathlib:SheafOfModules`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.11, crystals in modules and quasi-coherent modules. The source gives the pullback-isomorphism condition and the affine criterion.

Literal source excerpt:

> crystal

API outline:

- `TauCeti.Crystalline.Crystal.pullback_iso` (data): The canonical f^*E_T′→E_T is O_T-linear and invertible.
- `TauCeti.Crystalline.Crystal.tensor_eval` (compatibility): Evaluation of E⊗F is E_T⊗_(O_T)F_T.
- `TauCeti.Crystalline.Crystal.dual_eval` (compatibility): For finite locally free E, evaluation of E∨ is Hom_(O_T)(E_T,O_T), with evaluation/coevaluation.

Unit tests:

- `TauCeti.Crystalline.test_crystal_structure` (degenerate): O_crys with canonical comparisons is a rank-one crystal.
- `TauCeti.Crystalline.test_crystal_constant` (compatibility): The crystal from a finite free base module evaluates as its tensor extension to O_T.
- `TauCeti.Crystalline.test_crystal_not_abelian` (non-example): Over W₂(k), cokernel of p:O_crys→O_crys has evaluation k, which is not a finite locally free W₂(k)-module.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.Crystal`, `TauCeti.Crystalline.Crystal.pullback_iso`, `TauCeti.Crystalline.Crystal.tensor_eval`, `TauCeti.Crystalline.Crystal.dual_eval`, `TauCeti.Crystalline.test_crystal_structure`, `TauCeti.Crystalline.test_crystal_constant`, `TauCeti.Crystalline.test_crystal_not_abelian`.

E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms, Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate presentations do not replace these objects.

### Rational crystals and nondegenerate F-crystals

**Node:** CrystallineCohomology:CR.1/isocrystal. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.Isocrystal`. All implementation status remains unchecked.

For a smooth k-scheme with k perfect and W=W(k), a finite locally free W-crystal is a compatible family E_e over W_e. Its isocrystal is the corresponding coefficient object with Hom groups tensored with Q_p. Given Witt Frobenius and absolute Frobenius of X, an F-crystal is E with a morphism Φ:F_X^*E→E. In the Stacks convention nondegenerate means locally admitting V with VΦ=p^i id. For bounded-rank finite locally free crystals its matrix argument yields a two-sided inverse after multiplying V by a further power of p. The two-sided bounded-rank refinement is used in CR.3:Frobenius-isogeny; arbitrary F-maps are not assumed nondegenerate. An F-isocrystal is a rational coefficient object with invertible Φ. A semilinear cohomology vector space alone is not such a site coefficient.

Hypotheses and conventions: p prime, k perfect, finite locally free compatible integral family. An arbitrary F-map is not assumed nondegenerate; nondegeneracy is an explicit hypothesis.

Uses:

- Stacks §60.26; Esnault–Groechenig §2.6; CR.3:Frobenius-isogeny: Separates the site coefficient, rationalization and Frobenius pullback; nondegeneracy and its bounded two-sided inverse are inputs to the rational cohomological Frobenius theorem.

Proof outline:

1. Construct compatible finite-level pullbacks and tensor/dual from crystals, then rationalize the Hom groups.
2. Encode Frobenius as an actual pullback morphism before passing to semilinear evaluation. Clear bounded local p-denominators to relate a rational inverse to the nondegeneracy condition.
3. Request convergent and overconvergent comparisons from their owning roadmap; no equality of those coefficient categories is built into this definition.

Direct prerequisites: `CrystallineCohomology:CR.1/crystal`, `CrystallineCohomology:CR.1/site-morphisms`, `AInfCohomology:AI.0`.

Source: [Hélène Esnault and Michael Groechenig, Rigid connections and F-isocrystals](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, p.13, rationalization and finite-Witt evaluation. The coefficient category is formed from crystals, with evaluation on formal lifts. Frobenius and nondegeneracy use Stacks60.25.

Literal source excerpt:

> Isoc

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.26, Definition of nondegenerate F-crystal. The inverse up to a power of p is kept explicit.

Literal source excerpt:

> nondegenerate

API outline:

- `TauCeti.Crystalline.Isocrystal.hom` (data): Hom(E[1/p],F[1/p])=Hom(E,F)⊗Q_p in the specified localized category.
- `TauCeti.Crystalline.FCrystal.linearize` (compatibility): Evaluation of Φ is linear from the Frobenius-twisted module; its associated endomorphism is σ-semilinear.
- `TauCeti.Crystalline.FCrystal.dual` (structure): The dual F-isocrystal uses the inverse transpose of the rationalized Frobenius.

Unit tests:

- `TauCeti.Crystalline.test_isocrystal_unit` (degenerate): The unit W-crystal with Witt Frobenius gives the unit F-isocrystal.
- `TauCeti.Crystalline.test_isocrystal_p` (computation): Multiplication by p becomes invertible after rationalization.
- `TauCeti.Crystalline.test_isocrystal_zeroF` (non-example): The zero Frobenius on a nonzero free crystal is not a nondegenerate F-crystal.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.Isocrystal`, `TauCeti.Crystalline.Isocrystal.hom`, `TauCeti.Crystalline.FCrystal.linearize`, `TauCeti.Crystalline.FCrystal.dual`, `TauCeti.Crystalline.test_isocrystal_unit`, `TauCeti.Crystalline.test_isocrystal_p`, `TauCeti.Crystalline.test_isocrystal_zeroF`.

E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms, Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate presentations do not replace these objects.

### PD stratifications on a smooth lift

**Node:** CrystallineCohomology:CR.1/pd-stratification. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.PDStratification`. All implementation status remains unchecked.

For X embedded in a smooth lift P over the PD base, let D(1),D(2) be the compatible envelopes of the twofold and threefold diagonal, completed when the base is p-adic. A PD stratification of a module M on D is a D(1)-linear isomorphism ε:p₀^*M→p₁^*M, the identity on the diagonal, whose two composites on D(2) satisfy ε₁₂ε₀₁=ε₀₂. Completion requires continuity of ε and its Taylor sums.

Hypotheses and conventions: The diagonal envelopes are formed over the fixed PD base, not ordinary infinitesimal neighborhoods. Use finite-level modules or p-complete modules with the topology specified.

Uses:

- Stacks §60.17; Esnault–Groechenig §2.6; CR.1/taylor-equivalence: Packages the PD diagonal and triple-diagonal cocycle used to reconstruct crystals from a local module with connection; diagonal and cocycle APIs certify coordinate transitions.

Proof outline:

1. Construct the diagonal envelopes and projections by envelope functoriality.
2. Write the normalization and cocycle as equations of tensor-pullback module maps. Identity, tensor and dual use these equations.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-envelope`, `CrystallineCohomology:CR.0/completed-envelope`, `CrystallineCohomology:CR.1/crystal`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §§60.13–14 and60.17, first/second thickenings and reconstruction. The first/second order comparison and full completed diagonal data distinguish stratifications from a mere connection.

Literal source excerpt:

> cocycle condition

API outline:

- `TauCeti.Crystalline.PDStratification.diagonal` (simp): Pulling ε to the diagonal gives id_M.
- `TauCeti.Crystalline.PDStratification.cocycle` (relation): On D(2), ε₁₂∘ε₀₁=ε₀₂ with the specified order.
- `TauCeti.Crystalline.PDStratification.from_crystal` (constructor): The crystal pullback isomorphisms on D(1) define ε and satisfy the cocycle.

Unit tests:

- `TauCeti.Crystalline.test_stratification_unit` (degenerate): The structure module has its canonical identity-after-base-change stratification.
- `TauCeti.Crystalline.test_stratification_three` (characterisation): A triple projection yields the displayed two equal module maps.
- `TauCeti.Crystalline.test_stratification_connection` (non-example): A first-order isomorphism alone does not provide the full divided-Taylor cocycle.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.PDStratification`, `TauCeti.Crystalline.PDStratification.diagonal`, `TauCeti.Crystalline.PDStratification.cocycle`, `TauCeti.Crystalline.PDStratification.from_crystal`, `TauCeti.Crystalline.test_stratification_unit`, `TauCeti.Crystalline.test_stratification_three`, `TauCeti.Crystalline.test_stratification_connection`.

E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms, Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate presentations do not replace these objects.

### Integrable topologically quasi-nilpotent connections

**Node:** CrystallineCohomology:CR.1/quasi-nilpotent-connection. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.QNConnection`. All implementation status remains unchecked.

Let D be the compatible PD envelope of X in a smooth A-lift with étale coordinates x₁,…,x_d, and M a p-complete D-module. A PD connection ∇:M→M⊗_D Ω¹_PD(D/A) satisfies Leibniz; integrability means ∇²=0. Write ∇m=Σθ_i(m)dx_i. Topological quasi-nilpotence means for every m and e, θ_i^r(m)=0 modulo p^e for all sufficiently large r, for each i. Integrability makes the θ_i commute; hence only finitely many multiindices contribute modulo p^e to the divided-Taylor sum.

Hypotheses and conventions: Étale coordinates on the chosen smooth lift; completed PD differentials for the p-adic version. Finite-level version uses actual vanishing after enough iterations.

Uses:

- Stacks §60.17; Esnault–Groechenig §2.6; CR.2/embedding-computation: Makes the Taylor series converge p-adically on each local section and turns crystal coefficients into the coefficient de Rham differential; iterated operators and finite Taylor sums detect the required convergence.

Proof outline:

1. Import the ordinary connection carrier from its generic owner if one exists; the PD compatibility and the topological condition are this crystalline refinement.
2. Define the coefficient operators and integrability equation, and prove coordinate independence through the Taylor/stratification equivalence rather than assuming it.
3. For finite-Witt finite-type modules on a smooth formal W-lift, BO Exercise4.14 gives quasi-nilpotence at every level iff at level p. Its lifting argument is specified separately.

Direct prerequisites: `CrystallineCohomology:CR.1/pd-stratification`, `DerivedDeRhamCohomology:DD.0`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.17, condition(4) and commuting operators. The finiteness condition is on each section and p-adic precision, not a uniform global power.

Literal source excerpt:

> topologically quasi-nilpotent

Source: [Hélène Esnault and Michael Groechenig, Rigid connections and F-isocrystals](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, BO Exercise4.14 paragraph. This is the finite-Witt reduction condition, separate from the Katz p-curvature theorem owned by CartierFlows.

Literal source excerpt:

> quasi-nilpotent

API outline:

- `TauCeti.Crystalline.QNConnection.operators` (data): ∇ is recovered as Σθ_i⊗dx_i and each θ_i obeys the coordinate Leibniz rule.
- `TauCeti.Crystalline.QNConnection.commute` (relation): Integrability implies θ_iθ_j=θ_jθ_i.
- `TauCeti.Crystalline.QNConnection.finite_taylor` (characterisation): For m,e only finitely many θ^K(m) are nonzero modulo p^e, so its divided-Taylor series converges.

Unit tests:

- `TauCeti.Crystalline.test_qn_trivial` (degenerate): The standard connection on a constant free module is quasi-nilpotent on a polynomial lift.
- `TauCeti.Crystalline.test_qn_unipotent` (computation): Over F_p[t], θ(e₁)=0,θ(e₂)=e₁ gives a nonzero rank-two connection with θ^p=0.
- `TauCeti.Crystalline.test_qn_exponential` (non-example): Over F_p[t], ∇e=e⊗dt is integrable but θ^p(e)=e, so it is not quasi-nilpotent.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

A coordinate presentation with explicit derivations, Leibniz rules, commuting operators and p-adic Taylor convergence is typed. The reconstruction of the coordinate-free Ω¹-valued integrable connection and change-of-coordinate equivalence requires DD.0.

### Crystals, stratifications and quasi-nilpotent connections

**Node:** CrystallineCohomology:CR.1/taylor-equivalence. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crystalConnectionEquivalence`. All implementation status remains unchecked.

For a smooth/formally smooth lift in the finite p-nilpotent or specified p-complete setting, eligible quasi-coherent crystals are equivalent to integrable topologically quasi-nilpotent PD connections on their envelope evaluation. The connection reconstructed from ε has commuting operators θ_i; the stratification from ∇ is ε(m)=Σ_K θ^K(m)ξ^[K] for ξ_i=p₁(x_i)−p₀(x_i), with the orientation fixed by this convention. The divided-Taylor cocycle uses the PD addition identity, not division by K! in the base ring.

Hypotheses and conventions: Retain completeness and quasi-nilpotence; in the finite-Witt finite-type specialization use the mod-p criterion. Coordinate-independent gluing of the reconstruction is an explicit proof-audit gap.

Proof outline:

1. A crystal gives ε and its first-order connection; the cocycle gives integrability.
2. Quasi-nilpotence makes the Taylor formula finite modulo every p^e. The PD binomial formula and commuting operators prove the cocycle.
3. For an arbitrary crystalline object choose a local lift map to the smooth envelope. Compare two choices by the Taylor transition and glue; the product-lift argument gives independence and inverse functors.

Direct prerequisites: `CrystallineCohomology:CR.1/quasi-nilpotent-connection`, `CrystallineCohomology:CR.1/pd-stratification`, `CrystallineCohomology:CR.1/crystal`, `CrystallineCohomology:CR.0/pd-polynomial`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.17, Propositions and reconstruction of crystals. The source constructs the equivalence and flags the compatibility proof; this plan records that obligation explicitly.

Literal source excerpt:

> topologically quasi-nilpotent

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crystalConnectionEquivalence`.

E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms, Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate presentations do not replace these objects.

### Finite-Witt evaluation and formal coefficient comparison

**Node:** CrystallineCohomology:CR.1/finite-witt-evaluation. **Kind:** comparison.

**Declaration:** `TauCeti.Crystalline.finiteWittEvaluation`. All implementation status remains unchecked.

For a smooth finite-type k-scheme X with a smooth p-adic formal W(k)-lift X̂, evaluation identifies finite-type crystals over W_e with O_(X̂/p^e)-coherent integrable quasi-nilpotent connections, compatibly in e. Finite locally free objects correspond to finite locally free connections. A compatible W-crystal evaluates as E=lim_e E_e on X̂ with complete connection; rationalization gives the corresponding formal isocrystal connection. For such compatible finite-type data, quasi-nilpotence modulo p implies quasi-nilpotence at each p^e.

Hypotheses and conventions: k perfect; finite-type coefficients on the specified smooth Noetherian lift. A chosen global formal lift is part of this statement, not asserted to exist for every X.

Proof outline:

1. Apply the finite-level Taylor equivalence, with the actual tensor pullbacks and compatible reduction maps.
2. For BO Exercise4.14, an operator power killing a section modulo p gains one factor of p; iterate on the finitely generated reductions to reach p^e.
3. Take the ordinary coherent-module inverse limit under the compatible finite-level hypotheses and import the DD.1 derived-completion comparison; rationalize the actual coefficient category.

Direct prerequisites: `CrystallineCohomology:CR.1/taylor-equivalence`, `CrystallineCohomology:CR.1/isocrystal`, `DerivedDeRhamCohomology:DD.1`.

Source: [Hélène Esnault and Michael Groechenig, Rigid connections and F-isocrystals](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, finite-level evaluation and formal inverse limit. The source fixes finite-type coefficients and the chosen smooth formal lift; it does not classify bare rational vector spaces.

Literal source excerpt:

> lim

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.finiteWittEvaluation`.

E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms, Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate presentations do not replace these objects.

### CR.1 continuation required for closure

- Coordinate-independent crystal reconstruction and topology change: Audit the Taylor transition for changes of coordinates and choices of local lift maps in Stacks60.17. Prove the chosen étale-cover variant comparison for quasi-coherent crystals; πi=id for the big/small maps is not a theorem on all sheaves.
- Supplier contract DerivedDeRhamCohomology:DD.0: Export ordinary relative differential forms, de Rham DGAs, coefficient connections and smooth-lift de Rham complexes with actual exterior powers, Leibniz rule and integrability. The draft DD.2/ordinary-de-rham-complex is a candidate but needs the confirmed DD.0 ownership and its rejected prototype repaired.
- Supplier contract DerivedDeRhamCohomology:DD.1: Export the exact derived inverse-limit and bounded-p-torsion/finite-Witt coherent-module comparison needed for the ordinary formal evaluation; the supplier draft is under revision and is not treated as a checked implementation.
- Supplier contract EnhancedDerivedSheaves:E1: Supply geometric morphisms, actual sheaves of modules and pullback tensor comparisons for the specified ringed crystalline sites, including big/small restriction and Zariski/étale change-of-topology functors.
- Supplier contract EnhancedDerivedSheaves:E2: Supply compatible enhanced derived inverse/direct images and the quasi-coherent cohomology descent criterion for the topology-change comparison; no equivalence of arbitrary big/small sheaf topoi is assumed.
- Supplier contract AInfCohomology:AI.0: Supply the existing/pinned Witt-vector scheme base, Witt Frobenius and perfect-field finite-Witt reduction maps used to define the compatible W-crystal coefficient families; this is elementary Witt foundation, not AΩ.
- Precise prototype obligations: CR.1: E1/E2 must supply actual sheaves of modules, ringed-site pullbacks and descent functors on the declared crystalline categories; AI.0 supplies finite-Witt scheme/PD maps. Crystal, isocrystal and stratification forms must state their cartesian isomorphisms, Frobenius base twist, two-sided p-power inverse and triple-diagonal cocycle. Coordinate presentations do not replace these objects. The signatureCoverage register lists every omitted name and the exact limitations of every typed component. No comment-only form is included in the compilation counts.

## CR.2 — The PD Poincaré lemma and de Rham computations

The degree-one PD differential module is the quotient of the existing
ordinary Kähler module by dγ_n(x)−γ_(n−1)(x)dx. Its universal property is for
actual PD derivations. Higher forms use the ordinary exterior-form supplier,
with the induced differential and an integrable coefficient connection.
For a smooth embedding, the completed envelope tensor ordinary forms gives
the PD de Rham model; the precise tensor identity does not assume a flat
envelope where the source does not require one.

Linearization is the graph-envelope sheaf construction. The augmented
linearized PD de Rham complex resolves the crystal, and its Zariski derived
pushforward computes crystalline cohomology. The one-variable divided
polynomial contraction is what makes the PD Poincaré proof work in
characteristic p. Ordinary affine-line de Rham cohomology cannot replace it.
Embedding independence uses the actual graph comparisons and
Čech–Alexander system, not a bare assertion that two chosen resolutions have
the same cohomology.

RΓ_crys is an enhanced derived image; p-adic coefficients use a derived
compatible limit. The smooth-lift comparison identifies the stated PD and
Hodge filtration maps with their exact truncation and completeness
hypotheses. An unfiltered quasi-isomorphism does not establish a filtered
one. Formal coefficient evaluation imports the named F0 formal-functions
and existence nodes, with their hypotheses. Trace-free End⁰ coefficients
split from End only when the rank is a unit; otherwise the kernel is still
defined without a trace splitting.

Acceptance checks require dγ_p(t) to retain its nonzero divided-form term,
the zero-relative-module example, graph-envelope normalization, invariance
under two embeddings, the augmented coefficient Poincaré map and the
derived-limit obstruction detector. The higher-form and enhanced-image
interfaces and filtered proof audit are exact outstanding inputs.

Atlas planets: PD de Rham complex; Crystalline cohomology; PD Poincaré lemma; Crystalline de Rham comparison.

Coverage: planned. 9 declaration nodes. The following register states each mathematical target, its direct inputs and source-guided proof.

### Universal PD differentials and the PD de Rham complex

**Node:** CrystallineCohomology:CR.2/pd-differentials. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.pdDifferentials`. All implementation status remains unchecked.

For a PD A-algebra(B,J,δ), a PD derivation d:B→M is an A-derivation satisfying dδ_n(x)=δ_(n−1)(x)dx for x∈J,n≥1. Define Ω¹_PD(B/A) as the ordinary Kähler module modulo the span of these relations, and Ω^q_PD=∧^q_B Ω¹_PD with the induced exterior derivative. This gives the initial PD differential graded A-algebra. For an integrable PD connection on M, its coefficient differential is ∇(m⊗ω)=∇m∧ω+m⊗dω, with the usual graded sign on further factors.

Hypotheses and conventions: Use exterior powers with odd-square-zero convention also at p=2; δ₀(x)=1. Integrability is required for the coefficient differential to square to zero.

Uses:

- Stacks §60.6; LZ §1.1; CR.2/envelope-differentials and pd-poincare: Quotients ordinary Kähler forms by the derivative-of-divided-powers relations, giving the coefficient complex and the divided-polynomial contraction. The degree-one lift API is its universal property.

Proof outline:

1. Import ordinary forms and their exterior derivative from DD.0; quotient by the displayed PD-derivation relations.
2. The relations are stable under the induced exterior differential, giving d²=0 and the universal property.
3. Use the connection Leibniz rule to descend the coefficient differential through tensor products; its square is the curvature.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-envelope`, `DerivedDeRhamCohomology:DD.0`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.6, universal divided-power derivations and de Rham complex. The construction is a quotient of ordinary Kähler forms, not a duplicate definition of them.

Literal source excerpt:

> derivation

Source: [Andreas Langer and Thomas Zink, De Rham–Witt cohomology for a proper and smooth morphism](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §1.1, Definition1.1 and pp.11–13. This source gives the PD-DGA universal property and the p-local γ_p derivation criterion.

Literal source excerpt:

> pd-derivation

API outline:

- `TauCeti.Crystalline.pdDifferentials_lift` (universal-property): B-linear maps Ω¹_PD→M correspond bijectively to PD A-derivations B→M.
- `TauCeti.Crystalline.pdDifferentials_dpow` (simp): dδ_n(x)=δ_(n−1)(x)dx for x∈J,n>0.
- `TauCeti.Crystalline.pdDifferentials_map` (functoriality): A compatible PD A-map gives its base-changed differential map, preserving wedges and d.

Unit tests:

- `TauCeti.Crystalline.test_pdDifferentials_base` (degenerate): Ω¹_PD(A/A)=0.
- `TauCeti.Crystalline.test_pdDifferentials_polynomial` (computation): For A⟨t⟩, d(t^[n])=t^[n−1]dt and Ω¹_PD is free on dt.
- `TauCeti.Crystalline.test_pdDifferentials_Fp` (non-example): Over F_p⟨t⟩ the relation d(t^[p])=t^[p−1]dt remains nonzero despite d(t^p)=0.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

The degree-one quotient of the existing Kähler module, universal PD derivation, derivative formula and semilinear map are typed. Higher exterior forms, the full DGA and the coefficient connection comparison require DD.0.

### Differentials of a smooth envelope

**Node:** CrystallineCohomology:CR.2/envelope-differentials. **Kind:** comparison.

**Declaration:** `TauCeti.Crystalline.envelopeDifferentials`. All implementation status remains unchecked.

For the universal envelope D of(P,J) over(A,I,γ), the canonical map D⊗_P Ω¹_(P/A)→Ω¹_PD(D/A) is an isomorphism, without flatness of D/P. If P/A is smooth, the exterior-power version identifies Ω^q_PD(D/A) with D⊗_P Ω^q_(P/A), and these are finite locally free when P/A has finite relative dimension. The completed version is the compatible p-adic inverse limit of the finite-level formulas.

Hypotheses and conventions: J contains IP; smoothness is needed for the finite locally free conclusion, not the universal Ω¹ formula.

Proof outline:

1. Every ordinary A-derivation on P extends uniquely to the square-zero PD target D⊕M using the envelope initiality.
2. The square-zero formula δ_n(x+z)=δ_n(x)+δ_(n−1)(x)z gives the universal PD derivation. Apply Yoneda to representable derivations.
3. Exterior powers commute with extension of scalars; take the qualified completion comparison from DD.1.

Direct prerequisites: `CrystallineCohomology:CR.2/pd-differentials`, `CrystallineCohomology:CR.0/pd-envelope`, `DerivedDeRhamCohomology:DD.1`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §§60.3 and60.6, divided-power square-zero extension and envelope differentials. The square-zero universal property proves the formula without a flatness assumption.

Literal source excerpt:

> square zero

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.envelopeDifferentials`.

DD.0 must supply higher exterior differential forms, coefficient integrable connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-torsion comparison. These actual coefficient complexes are required to state the augmented Poincaré quasi-isomorphism and its embedding-independence diagrams.

### Enhanced crystalline direct image and global sections

**Node:** CrystallineCohomology:CR.2/crystalline-cohomology. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.RΓcrys`. All implementation status remains unchecked.

On the fixed ringed crystalline site set Ru_crys,*:D(O_crys)→D(O_X) to be the enhanced derived direct image along u, and RΓ_crys(X/S,E)=RΓ(X,Ru_crys,*E), retaining its base-ring action. Finite-level coefficient reductions and maps of crystalline diagrams use the corresponding derived functor transformations. Define p-adic cohomology as Rlim_e RΓ_crys(X/S_e,E_e); ordinary limits of cohomology groups are a conclusion under appropriate Mittag–Leffler hypotheses.

Hypotheses and conventions: Use the E.1/E.2 supplied common enhancement and its actual sheaf-module derived functors. For the p-adic object retain compatible finite-level coefficients.

Uses:

- Stacks §§60.16,60.21,60.24; CR.3/derived-base-change; CohomologyComparisons:CP.0: Defines the derived global sections and the derived compatible Witt-level limit that enter comparison and base-change diagrams. The limit API prevents replacing derived limits by limits of cohomology groups.

Proof outline:

1. Construct the ringed-site u and import enhanced derived functors. Use the composite direct-image comparison to identify global sections.
2. Import DD.1 derived inverse limits for the p-adic definition. Product and base-change maps must be built from the actual sheaf morphisms.

Direct prerequisites: `CrystallineCohomology:CR.1/structure-sheaves`, `CrystallineCohomology:CR.1/site-morphisms`, `CrystallineCohomology:CR.1/crystal`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, `DerivedDeRhamCohomology:DD.1`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §§60.18,60.21 and60.23, derived crystalline direct images. The calculation is organized through Ru_* and finite-level inverse limits.

Literal source excerpt:

> R\Gamma

API outline:

- `TauCeti.Crystalline.RΓcrys_comp` (compatibility): RΓ_crys=RΓ_X∘Ru_crys,* as enhanced functors.
- `TauCeti.Crystalline.RΓcrys_map` (functoriality): A compatible diagram and coefficient map induce the canonical contravariant cohomology map.
- `TauCeti.Crystalline.RΓcrys_limit` (characterisation): The p-adic object is the derived inverse limit of its specified finite-level theory.

Unit tests:

- `TauCeti.Crystalline.test_RΓcrys_empty` (degenerate): The empty scheme has zero crystalline cohomology.
- `TauCeti.Crystalline.test_RΓcrys_point` (computation): For a perfect-field point with structure crystal, the finite-level complex is W_e(k) in degree0.
- `TauCeti.Crystalline.test_RΓcrys_limit_not_groups` (non-example): Rlim_e K_e is not defined by the collection lim_e H^i(K_e) without a derived-limit justification.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.RΓcrys`, `TauCeti.Crystalline.RΓcrys_comp`, `TauCeti.Crystalline.RΓcrys_map`, `TauCeti.Crystalline.RΓcrys_limit`, `TauCeti.Crystalline.test_RΓcrys_empty`, `TauCeti.Crystalline.test_RΓcrys_point`, `TauCeti.Crystalline.test_RΓcrys_limit_not_groups`.

DD.0 must supply higher exterior differential forms, coefficient integrable connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-torsion comparison. These actual coefficient complexes are required to state the augmented Poincaré quasi-isomorphism and its embedding-independence diagrams.

### Crystalline linearization along a smooth embedding

**Node:** CrystallineCohomology:CR.2/linearization. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.linearization`. All implementation status remains unchecked.

Given X→P a closed embedding into a smooth lift and an eligible module N on its compatible PD envelope D, linearize N by the following sheaf construction: on a thickening(U,T), form the compatible PD envelope D_(U,T) of the graph U→T×_S P, pull N to it through its map to D, and take its sections. Sheafify the graph-envelope construction with the appropriate completed tensor pullback at p-adic levels. The de Rham linearizations of the evaluated crystal resolve that crystal and have the affine direct-image acyclicity used in the Poincaré calculation.

Hypotheses and conventions: The construction retains the chosen embedding and the coefficient base-change maps. The precise graph-envelope descent and acyclicity proof are recorded as a source-audit gap; no assertion is made for arbitrary disconnected module data.

Uses:

- Stacks §§60.11,60.19–60.21; CR.2/pd-poincare: Uses graph envelopes to turn a local coefficient module into a crystalline sheaf whose augmented PD de Rham resolution computes the Zariski pushforward.

Proof outline:

1. Graph envelopes and their functorial PD maps give restriction maps and sheaf descent on T.
2. Compare the product embedding with the diagonal envelopes; its relative PD-polynomial directions give the augmented de Rham resolution.
3. Use affine quasi-coherent acyclicity and the explicit PD Poincaré contraction. Audit the classical linearization functor against BO§6 before identifying all source conventions.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-envelope`, `CrystallineCohomology:CR.1/crystal`, `CrystallineCohomology:CR.2/pd-differentials`, `EnhancedDerivedSheaves:E2`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §§60.18–21 and60.23, affine crystal calculations and vanishing of positive differential direct images. The source supplies the calculation through envelope Čech complexes; the identification with classical graph linearization needs the named audit.

Literal source excerpt:

> acyclic

API outline:

- `TauCeti.Crystalline.linearization_eval` (data): The value is sections of the coefficient pullback on the graph PD envelope, with the stated topology.
- `TauCeti.Crystalline.linearization_map` (functoriality): A coefficient map induces the graph-envelope sheaf map and respects restrictions.
- `TauCeti.Crystalline.linearization_augmentation` (constructor): The crystal comparisons give E→L(E_D⊗Ω^0), compatible with the de Rham differential.

Unit tests:

- `TauCeti.Crystalline.test_linearization_zero` (degenerate): Linearization of the zero eligible module is the zero sheaf.
- `TauCeti.Crystalline.test_linearization_identity` (compatibility): For the zero-ideal identity embedding, evaluation on the identity thickening returns the original module.
- `TauCeti.Crystalline.test_linearization_PD` (non-example): The graph uses a PD envelope, whose t^[p] is a separate generator in characteristic p; an ordinary polynomial neighborhood is not this value.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.linearization`, `TauCeti.Crystalline.linearization_eval`, `TauCeti.Crystalline.linearization_map`, `TauCeti.Crystalline.linearization_augmentation`, `TauCeti.Crystalline.test_linearization_zero`, `TauCeti.Crystalline.test_linearization_identity`, `TauCeti.Crystalline.test_linearization_PD`.

DD.0 must supply higher exterior differential forms, coefficient integrable connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-torsion comparison. These actual coefficient complexes are required to state the augmented Poincaré quasi-isomorphism and its embedding-independence diagrams.

### The relative PD Poincaré lemma

**Node:** CrystallineCohomology:CR.2/pd-poincare. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.pdPoincare`. All implementation status remains unchecked.

For a PD A-algebra B and a B-module M with eligible integrable PD connection, adjoining finitely many PD variables gives a quasi-isomorphism M⊗_B Ω^•_PD(B/A)→M⊗_B Ω^•_PD(B⟨z₁,…,z_r⟩/A) with the pulled-back connection. The p-complete version holds with the stated complete tensor products. For the relative variable complex alone, the augmentation M→M⊗_B Ω^•_(B⟨z⟩/B) is exact in positive degree over any B; no factorial inversion is required.

Hypotheses and conventions: Use actual PD-polynomial variables, not ordinary affine-space coordinates. In the completed coefficient version retain the complete-module and connection hypotheses of Stacks60.20.

Proof outline:

1. For one variable, d(z^[n])=z^[n−1]dz and integration sends z^[n]dz to z^[n+1]. Thus dh+hd=id−evaluation at0.
2. Tensor the one-variable contraction one variable at a time, with Koszul signs. Coefficient terms cancel by connection compatibility.
3. Pass the explicit homotopies through the prescribed p-adic completion; do not infer ordinary affine-space crystalline vanishing.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-polynomial`, `CrystallineCohomology:CR.2/pd-differentials`, `CrystallineCohomology:CR.2/envelope-differentials`, `DerivedDeRhamCohomology:DD.1`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.20, relative Poincaré lemma and proof;60.25 integration example. The divided-monomial contraction proves the coefficient and completed versions.

Literal source excerpt:

> Poincar

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.pdPoincare`.

DD.0 must supply higher exterior differential forms, coefficient integrable connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-torsion comparison. These actual coefficient complexes are required to state the augmented Poincaré quasi-isomorphism and its embedding-independence diagrams.

### Crystalline cohomology from an embedding

**Node:** CrystallineCohomology:CR.2/embedding-computation. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crysEmbeddingComputation`. All implementation status remains unchecked.

For a p-nilpotent PD base S, a closed embedding X→P with P/S smooth, and a quasi-coherent crystal E satisfying the source coefficient hypotheses, Ru_*E is represented by the de Rham complex E_D⊗_(O_P)Ω^•_(P/S) on the compatible envelope D. On an affine p-adic base use the completed envelope, its completed PD forms and complete coefficient tensor products. These compute RΓ_crys through derived sheaf global sections, rather than a globally chosen coordinate complex.

Hypotheses and conventions: IB⊆J on every affine envelope chart; integrable quasi-nilpotent coefficient evaluation. At p-adic level use the compatible finite-level family and its qualified derived completion.

Proof outline:

1. Evaluate E on the cosimplicial diagonal envelopes D(n). Affine crystal acyclicity identifies their Čech–Alexander complex with RΓ_crys.
2. Build the bicomplex with cosimplicial degree and form degree. Positive-form columns are contractible through the cosimplicial homotopy; the augmented rows use the PD Poincaré contraction.
3. Compare the two totalizations and then glue affine embedding charts through E.2 descent.

Direct prerequisites: `CrystallineCohomology:CR.2/crystalline-cohomology`, `CrystallineCohomology:CR.2/linearization`, `CrystallineCohomology:CR.2/pd-poincare`, `CrystallineCohomology:CR.2/envelope-differentials`, `CrystallineCohomology:CR.1/taylor-equivalence`, `EnhancedDerivedSheaves:E2`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.21, Proposition on computing cohomology of a crystal; §60.23 direct images. The two spectral directions compute the same augmented bicomplex.

Literal source excerpt:

> computes

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysEmbeddingComputation`.

DD.0 must supply higher exterior differential forms, coefficient integrable connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-torsion comparison. These actual coefficient complexes are required to state the augmented Poincaré quasi-isomorphism and its embedding-independence diagrams.

### Embedding independence and Čech–Alexander descent

**Node:** CrystallineCohomology:CR.2/embedding-independence. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crysEmbeddingIndependent`. All implementation status remains unchecked.

For two smooth embeddings of X over the fixed PD base, their envelope de Rham models have canonical refinement quasi-isomorphisms through the product embedding. The maps are compatible with further refinements in the enhanced category and with eligible coefficient morphisms. Local lift choices produce explicitly homotopic maps; a coordinate-dependent affine representative is not declared globally functorial.

Hypotheses and conventions: Use product embeddings, compatible graph envelopes and the source completed/finite-level conventions.

Proof outline:

1. Factor a lift change x_i↦x_i+z_i through D⟨ξ_i⟩ and the evaluations ξ_i↦0,z_i.
2. Use the explicit PD-polynomial Poincaré homotopies, or the cosimplicial homotopy family preserving wedges/tensors, to compare the refinements.
3. Use E.2 coherent totalization to make triple refinement compatibility and Zariski gluing precise.

Direct prerequisites: `CrystallineCohomology:CR.2/embedding-computation`, `CrystallineCohomology:CR.2/pd-poincare`, `EnhancedDerivedSheaves:E2`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §§60.15–16 and Lemma60.21 on smooth presentations. These are actual refinement/homotopy constructions, not an abstract declaration of independence.

Literal source excerpt:

> homotopy

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysEmbeddingIndependent`.

DD.0 must supply higher exterior differential forms, coefficient integrable connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-torsion comparison. These actual coefficient complexes are required to state the augmented Poincaré quasi-isomorphism and its embedding-independence diagrams.

### Smooth-lift comparison and PD filtration

**Node:** CrystallineCohomology:CR.2/smooth-lift-filtration. **Kind:** comparison.

**Declaration:** `TauCeti.Crystalline.crysSmoothLiftFiltration`. All implementation status remains unchecked.

If X is the special-fiber reduction of a smooth lift Y over the fixed PD base and E evaluates to an eligible connection on Y, the crystalline de Rham model identifies with the ordinary coefficient de Rham complex of Y, completed in the p-adic case. On a chosen envelope model the PD filtration is Fil^r(D⊗Ω^q)=F_γ^(r−q)J̄⊗Ω^q, with F^a=D for a≤0; d lowers divided-power weight by1, so this is a subcomplex. After reduction by the base PD ideal, the smooth-lift filtration gives the corresponding stupid form-degree Hodge filtration; before that reduction the base PD weights remain present. Filtered embedding independence must be proved under the precise comparison hypotheses, rather than inferred from unfiltered independence.

Hypotheses and conventions: Smooth lift and compatible base powers; q≥0, r integral. The displayed filtration is a chosen-envelope filtration until its independence certificate is supplied.

Proof outline:

1. Use envelope initiality for the pre-existing compatible smooth lift and the embedding calculation.
2. Differentiate weighted PD products using the PD relation, obtaining dF^a⊆F^(a−1)Ω¹.
3. Compare the filtration on the zero-extra-ideal smooth-lift model. Audit the filtered product-refinement maps separately.

Direct prerequisites: `CrystallineCohomology:CR.2/embedding-computation`, `CrystallineCohomology:CR.2/pd-differentials`, `CrystallineCohomology:CR.0/pd-filtration`, `CrystallineCohomology:CR.0/pd-filtration-stability`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.6 PD filtration and §§60.21,60.24 smooth-lift computations. The weighted filtration and unfiltered de Rham computation are supplied; filtered independence is a recorded gap.

Literal source excerpt:

> filtration

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysSmoothLiftFiltration`.

DD.0 must supply higher exterior differential forms, coefficient integrable connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-torsion comparison. These actual coefficient complexes are required to state the augmented Poincaré quasi-isomorphism and its embedding-independence diagrams.

### Formal comparison with trace-free endomorphism coefficients

**Node:** CrystallineCohomology:CR.2/formal-and-end0. **Kind:** comparison.

**Declaration:** `TauCeti.Crystalline.crysFormalEnd0`. All implementation status remains unchecked.

For a smooth proper W(k)-lift Y and a compatible finite locally free crystal E, RΓ_crys(X/W,E)≅RΓ(Ŷ,DR(E_Ŷ))≅RΓ(Y,DR(E_Y))̂ when E and its connection algebraize. After inverting p this agrees with the coefficient de Rham complex on the characteristic-zero generic fiber. Apply this to End⁰(E)=ker(tr:End E→O) with its induced connection; when rank(E) is invertible, End E=O·id⊕End⁰(E), compatibly with the connection and crystalline comparison. Without that invertibility do not infer this direct summand formula.

Hypotheses and conventions: Y smooth proper; coherent eligible coefficient family; algebraization is required for the algebraic/generic-fiber formula. Use derived completion and proper formal functions, not arbitrary nonproper generic-fiber comparison.

Proof outline:

1. Take the finite-level crystalline comparisons and DD.1 derived inverse limit.
2. Import coherent proper formal functions from the algebraic-geometry supplier and identify the algebraized coefficient complex.
3. Tensor/dual evaluation identifies End(E); trace is horizontal. Taking its kernel and, when allowed, its split complement commutes with the exact coefficient comparison.

Direct prerequisites: `CrystallineCohomology:CR.2/embedding-computation`, `CrystallineCohomology:CR.2/crystalline-cohomology`, `CrystallineCohomology:CR.1/finite-witt-evaluation`, `CrystallineCohomology:CR.1/crystal`, `DerivedDeRhamCohomology:DD.1`, `AdicSpacesPartII:F0/theorem-on-formal-functions`, `AdicSpacesPartII:F0/coherent-as-inverse-system`, `AdicSpacesPartII:F0/grothendieck-existence`, `AdicSpacesPartII:F0/grothendieck-algebraization`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, proper algebraic/formal de Rham comparison. Properness is the hypothesis allowing formal-functions comparison.

Literal source excerpt:

> proper

Source: [Hélène Esnault and Michael Groechenig, Rigid connections and F-isocrystals](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §7, proof around End⁰ coefficient crystalline/de Rham equality. The route uses the crystal’s coefficient comparison and preserves the trace-free object; p-curvature inputs remain owned by CartierFlows.

Literal source excerpt:

> End0

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysFormalEnd0`.

DD.0 must supply higher exterior differential forms, coefficient integrable connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-torsion comparison. These actual coefficient complexes are required to state the augmented Poincaré quasi-isomorphism and its embedding-independence diagrams.

### CR.2 continuation required for closure

- Linearization and filtered comparison proof audit: Audit the exact graph-envelope sheaf linearization, its affine Ru_* acyclicity and its agreement with the chosen BO convention. Audit filtered product refinements: an unfiltered quasi-isomorphism is not a filtered comparison certificate.
- Precise prototype obligations: CR.2: DD.0 must supply higher exterior differential forms, coefficient integrable connections and their de Rham DGAs; E1/E2 supplies the enhanced derived images and acyclic graph-envelope linearization; DD.1 supplies the exact compatible derived limit and bounded-torsion comparison. These actual coefficient complexes are required to state the augmented Poincaré quasi-isomorphism and its embedding-independence diagrams. The signatureCoverage register lists every omitted name and the exact limitations of every typed component. No comment-only form is included in the compilation counts.

## CR.3 — Descent, finiteness, base change and Frobenius

The descent theorem is stated separately for the Zariski, étale and
specified crystalline variants with quasi-coherent coefficients. E2 supplies
the enhanced descent criterion, and the graph-envelope computation identifies
the local maps. Base change uses derived tensor products and the specified
completed coefficient comparison, so it remains valid in the presence of
crystalline torsion within its Noetherian and proper smooth scope.

Proper smooth perfectness is the target with the [0,2d] cohomological
interval, finite-level reductions and a compatible perfect inverse-limit
model. The Stacks proof hints are not treated as a complete proof
certificate: proper coherent perfectness, regular-envelope Tor calculations
and tower reconstruction are explicit suppliers/gates. The cup-product and
Künneth nodes supply actual multiplicative maps and their reduction,
functoriality and sign conventions.

Crystalline Frobenius composes base change, the relative-Frobenius pullback
and the coefficient F-map. Its source is the σ-twisted derived tensor
product. Invertibility after p-inversion belongs to the successor theorem,
not to this construction. Weak Lefschetz keeps its finite range and line
bundle cohomological bounds. The geometric tests include projective space,
ordinary and supersingular elliptic curves, and the BMS torsion surface;
proper smoothness alone does not force integral cohomology to be torsionfree.

Acceptance requires the empty and point complexes, projective hyperplane
cup product, reduction and Künneth normalization, σ-semilinearity, the p
factor on H²(P¹), the zero coefficient F-map and the actual torsion
example. Geometric realization and perfectness proofs remain certified
through their named suppliers rather than restated here.

Atlas planets: Proper smooth crystalline finiteness; Crystalline cup product; Crystalline Künneth formula; Crystalline Frobenius; Crystalline weak Lefschetz.

Coverage: planned. 8 declaration nodes. The following register states each mathematical target, its direct inputs and source-guided proof.

### Topology-specific crystalline descent

**Node:** CrystallineCohomology:CR.3/crystalline-descent. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crysDescent`. All implementation status remains unchecked.

For a quasi-compact separated X over a p-nilpotent PD base and an eligible quasi-coherent crystal E, a finite affine open cover gives the alternating Čech–Alexander totalization of its envelope coefficient de Rham complexes, canonically equivalent to RΓ_crys(X/S,E). Hypercover descent extends this to the bounded-below scope of the E2 criterion. The étale crystalline topology comparison requires the actual site comparison of CR.1; no unbounded descent or change-of-topology equivalence is inferred from a finite open cover alone.

Hypotheses and conventions: Affine finite intersections for the alternating complex; eligible coefficient envelope evaluations. Use the stated boundedness or supplier convergence hypotheses for a hypercover.

Proof outline:

1. Restriction to each affine intersection has the embedding computation and is acyclic in the needed Čech sense.
2. Apply E2 cohomological descent to the augmentation and compare product-embedding refinements.
3. Apply the CR.1 topology comparison only after its proof gate is discharged.

Direct prerequisites: `CrystallineCohomology:CR.2/embedding-computation`, `CrystallineCohomology:CR.2/embedding-independence`, `CrystallineCohomology:CR.1/site-morphisms`, `EnhancedDerivedSheaves:E2`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Čech complex and alternating Čech complex remarks. The source supplies the explicit complexes and proof hints; the enhanced convergence conditions are imported.

Literal source excerpt:

> alternating

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysDescent`.

E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-change maps with derived tensor products. A0-extension supplies proper coherent perfectness, dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still requires its source proof certificate.

### Derived crystalline base change

**Node:** CrystallineCohomology:CR.3/derived-base-change. **Kind:** comparison.

**Declaration:** `TauCeti.Crystalline.crysBaseChange`. All implementation status remains unchecked.

For a PD base map(A′,I′)→(A,I), X′/A′/I′ and its cartesian pullback X, there is a canonical map K′⊗^L_(A′)A→K. It is an equivalence if p is nilpotent in A′, E′ is a flat quasi-coherent crystal, X′/A′/I′ is qcqs and lci, and X′ and A/I are Tor-independent over A′/I′. In particular it applies to smooth families with finite locally free coefficients. For p-complete Noetherian bases and perfect cohomology, the compatible finite-level equivalences yield the completed base-change equivalence using DD.1.

Hypotheses and conventions: Every listed condition is retained; a perfect cohomology complex alone does not replace flatness of the coefficient crystal or the cartesian/Tor condition.

Proof outline:

1. Use the enhanced ringed-topos base-change transformation and the coefficient pullback map.
2. On a regular local presentation compare the two PD envelopes using the regular-sequence presentation and Tor-independence; finite locally free PD forms and flat evaluated coefficients compute the derived tensor.
3. Glue by crystalline descent and then use the qualified perfect-complex completion comparison for the p-adic version.

Direct prerequisites: `CrystallineCohomology:CR.3/crystalline-descent`, `CrystallineCohomology:CR.0/regular-envelope`, `CrystallineCohomology:CR.0/envelope-base-change`, `CrystallineCohomology:CR.2/embedding-computation`, `EnhancedDerivedSheaves:E1`, `DerivedDeRhamCohomology:DD.1`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Base change map and Base change isomorphism remarks, all seven hypotheses. The theorem uses the source’s seven conditions; the proof is an explicit regular-envelope argument.

Literal source excerpt:

> Tor independent

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysBaseChange`.

E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-change maps with derived tensor products. A0-extension supplies proper coherent perfectness, dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still requires its source proof certificate.

### Proper smooth crystalline perfectness and reductions

**Node:** CrystallineCohomology:CR.3/proper-perfectness. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crysPerfect`. All implementation status remains unchecked.

For a Noetherian p-nilpotent PD base(A,I,γ), X proper smooth over A/I and E a finite locally free crystal, K=RΓ_crys(X/A,E) is perfect in D(A). For a Noetherian p-complete PD base with p nilpotent in A/I, a compatible finite locally free crystal family gives a perfect K=Rlim_e K_e and K⊗^L_A A/p^e≅K_e. For k perfect this yields a perfect W(k)-complex with finite W(k)-module cohomology and amplitude in[0,2d] when dim X≤d. Individual H^i(K) may have p-torsion.

Hypotheses and conventions: Noetherianity is imposed here; the broader non-Noetherian argument in Stacks60.24 is not claimed closed. Properness, smoothness and finite locally free coefficients.

Proof outline:

1. Reduce to A/I by derived base change. The ordinary coefficient de Rham complex has finitely many finite locally free terms; proper coherent cohomology makes its derived sections perfect.
2. In the Noetherian p-nilpotent case I is nilpotent, so lift perfectness through that ideal. Bound amplitude by form degree plus proper coherent cohomological dimension.
3. Apply DD.1 compatible-perfect-tower reconstruction, using the corrected BO tower replacement rather than declaring the original terms surjective.

Direct prerequisites: `CrystallineCohomology:CR.3/derived-base-change`, `CrystallineCohomology:CR.3/crystalline-descent`, `CrystallineCohomology:CR.2/smooth-lift-filtration`, `DerivedDeRhamCohomology:DD.1`, `AlgebraicModuliForArithmeticGeometry:A0-extension`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Perfectness and Complete perfectness remarks. The proof text explicitly isolates the Noetherian nilpotent-ideal argument.

Literal source excerpt:

> Noetherian

Source: [Pierre Berthelot and Arthur Ogus, Corrigendum to Appendix B of Notes on Crystalline Cohomology](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf), Both pages, AppendixB replacement proof. Only the constructed replacement is termwise surjective.

Literal source excerpt:

> surjective

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysPerfect`.

E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-change maps with derived tensor products. A0-extension supplies proper coherent perfectness, dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still requires its source proof certificate.

### Crystalline cup products

**Node:** CrystallineCohomology:CR.3/cup-product. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.crysCup`. All implementation status remains unchecked.

Using the enhanced derived tensor and multiplication O_crys⊗O_crys→O_crys, construct K(E)⊗^L_A K(F)→K(E⊗F), with unit A→K(O). It is associative, natural in the scheme/coefficients, compatible with finite reductions, and graded commutative on structure cohomology: xy=(−1)^(ij)yx for x∈H^i,y∈H^j. For exterior products use the two pullbacks to X×Y. Neither graded commutativity nor p=2 alone implies every odd cohomology square is zero.

Hypotheses and conventions: Eligible coefficient tensor products and the common enhanced monoidal sheaf category.

Uses:

- Stacks §60.24; Ekedahl I.5; CR.3/kunneth and CR.3:duality: Builds the derived multiplicative structure needed for Künneth, projection formula and trace pairings, retaining reduction and graded signs.

Proof outline:

1. Use E1 lax monoidal derived global sections on the actual structure multiplication.
2. Compare with wedge/cup multiplication in envelope de Rham and Čech totalizations, keeping the Koszul sign.
3. Naturality of sheaf tensor and coefficient change proves reduction and external-product compatibility.

Direct prerequisites: `CrystallineCohomology:CR.2/crystalline-cohomology`, `CrystallineCohomology:CR.2/embedding-computation`, `EnhancedDerivedSheaves:E1`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.21, de Rham bicomplex; ordinary wedge/cup multiplicative structure. The calculation identifies the sheaf-derived product with the ordinary multiplicative model; enhanced monoidal coherence is imported.

Literal source excerpt:

> de Rham complex

API outline:

- `TauCeti.Crystalline.crysCup_unit` (relation): The image of1 acts as the identity.
- `TauCeti.Crystalline.crysCup_graded_comm` (relation): xy=(−1)^(ij)yx in structure cohomology.
- `TauCeti.Crystalline.crysCup_reduction` (compatibility): The derived coefficient-reduction map carries cup products to their finite-level cup products.

Unit tests:

- `TauCeti.Crystalline.test_crysCup_point` (computation): For Spec k/W, the cup product is ordinary multiplication in W(k).
- `TauCeti.Crystalline.test_crysCup_zero` (degenerate): A zero coefficient factor gives the zero product map.
- `TauCeti.Crystalline.test_crysCup_P1` (computation): For P¹ the degree-two hyperplane class squares to0 in degree4.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysCup`, `TauCeti.Crystalline.crysCup_unit`, `TauCeti.Crystalline.crysCup_graded_comm`, `TauCeti.Crystalline.crysCup_reduction`, `TauCeti.Crystalline.test_crysCup_point`, `TauCeti.Crystalline.test_crysCup_zero`, `TauCeti.Crystalline.test_crysCup_P1`.

E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-change maps with derived tensor products. A0-extension supplies proper coherent perfectness, dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still requires its source proof certificate.

### Proper smooth crystalline Künneth formula

**Node:** CrystallineCohomology:CR.3/kunneth. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crysKunneth`. All implementation status remains unchecked.

For X,Y proper smooth over a perfect field k and finite locally free crystal coefficients E,F, external cup product is an equivalence K(X,E)⊗^L_W K(Y,F)≅K(X×_kY,E⊠F). It preserves cup products, coefficient reductions and the subsequent crystalline Frobenius. The tensor product is derived; an ordinary tensor formula for individual cohomology groups requires its Tor terms or additional freeness assumptions.

Hypotheses and conventions: W=W(k), compatible finite-level coefficient families; properness and smoothness on both factors.

Proof outline:

1. Construct external cup product from actual pullbacks.
2. Reduce the map modulo p using proper smooth base change. Ordinary coefficient de Rham complexes on the product are the tensor/wedge totalization; proper coherent Künneth identifies derived sections.
3. Both sides are perfect p-complete complexes. Apply DD.1 reduction conservativity to lift the equivalence, and naturality proves the operator compatibilities.

Direct prerequisites: `CrystallineCohomology:CR.3/cup-product`, `CrystallineCohomology:CR.3/proper-perfectness`, `CrystallineCohomology:CR.3/derived-base-change`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `DerivedDeRhamCohomology:DD.1`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.24, Perfectness and Base change; applied to the product de Rham model. These furnish the reduction/perfectness ingredients; the generic coherent Künneth input is requested explicitly.

Literal source excerpt:

> perfect

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysKunneth`.

E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-change maps with derived tensor products. A0-extension supplies proper coherent perfectness, dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still requires its source proof certificate.

### Semilinear crystalline Frobenius and linearization

**Node:** CrystallineCohomology:CR.3/frobenius-map. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.crysFrobenius`. All implementation status remains unchecked.

Given a PD base(A,I,γ) with p∈I and a PD ring endomorphism σ lifting Frobenius modulo p, absolute Frobenius of X/S₀ and σ induce a crystalline-topos map. For a coefficient F-map Φ:F_X^*E→E, compose base change, relative-Frobenius pullback and Φ to obtain F_K:K⊗^L_(A,σ)A→K. On cohomology the corresponding endomorphism is σ-semilinear. Its definition does not include invertibility after inverting p; that is the separate successor theorem.

Hypotheses and conventions: The coefficient F-map is specified; for O use the canonical structure map. σ is a PD morphism, not just an arbitrary lift of the special-fiber endomorphism.

Uses:

- Stacks §60.26; LZ §3.4; CR.3:Frobenius-isogeny: Forms the actual base-twisted pullback before linearization and identifies geometric Frobenius with degree-scaled Witt Frobenius; the projective-line test checks the degree factor.

Proof outline:

1. Build the PD-base/special-fiber commutative diagram and the induced ringed-topos maps.
2. Factor absolute Frobenius through X^(1). Compose the three actual enhanced maps in this order.
3. Compare on a smooth lift with the degree-scaled map of de Rham complexes; this also fixes the convention exported to CR.4.

Direct prerequisites: `CrystallineCohomology:CR.1/site-morphisms`, `CrystallineCohomology:CR.1/isocrystal`, `CrystallineCohomology:CR.3/derived-base-change`, `CrystallineCohomology:CR.2/crystalline-cohomology`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Frobenius action section, Situation and the three maps in the final theorem proof. The definition and its factorization precede the rational-isogeny proof.

Literal source excerpt:

> three arrows

API outline:

- `TauCeti.Crystalline.crysFrobenius_semilinear` (characterisation): The cohomology map obeys F(ax)=σ(a)F(x).
- `TauCeti.Crystalline.crysFrobenius_linearize` (data): Its A-linear form has source K⊗^L_(A,σ)A.
- `TauCeti.Crystalline.crysFrobenius_lift` (compatibility): On a lift, pullback acts on a q-form as the qth exterior derivative of the lift map, identified in CR.4 with p^qF.

Unit tests:

- `TauCeti.Crystalline.test_crysFrobenius_point` (computation): For Spec k it is Witt Frobenius on W(k), σ-linear rather than W(k)-linear when σ≠id.
- `TauCeti.Crystalline.test_crysFrobenius_zero` (non-example): A zero coefficient F-map gives a zero cohomology map; the construction alone implies no isogeny.
- `TauCeti.Crystalline.test_crysFrobenius_P1` (computation): On the degree-two hyperplane class of P¹, absolute Frobenius multiplies by p.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysFrobenius`, `TauCeti.Crystalline.crysFrobenius_semilinear`, `TauCeti.Crystalline.crysFrobenius_linearize`, `TauCeti.Crystalline.crysFrobenius_lift`, `TauCeti.Crystalline.test_crysFrobenius_point`, `TauCeti.Crystalline.test_crysFrobenius_zero`, `TauCeti.Crystalline.test_crysFrobenius_P1`.

E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-change maps with derived tensor products. A0-extension supplies proper coherent perfectness, dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still requires its source proof certificate.

### Crystalline weak Lefschetz with bounded line-bundle cohomology

**Node:** CrystallineCohomology:CR.3/weak-lefschetz. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crysWeakLefschetz`. All implementation status remains unchecked.

Let X/k be smooth projective of dimension d over a perfect field and L a line bundle. Assume i_L≥0 and for every coherent F, H^i(X,F⊗L^n)=0 for i>i_L and all sufficiently large n. Then for n≥n₀ and every smooth hypersurface H∈|L^n|, restriction H^j_crys(X/W)→H^j_crys(H/W) is an isomorphism for j<d−i_L−1 and injective with torsionfree cokernel for j=d−i_L−1. The ample case has i_L=0.

Hypotheses and conventions: The eventual vanishing is quantified for every coherent F; H is smooth and n is sufficiently large.

Proof outline:

1. Let K be the restriction cone. Derived p-completeness reduces the required lower bound and boundary torsionfreeness to K/p lying in D≥d−i_L−1.
2. Use crystalline mod-p de Rham comparison and the exact conormal exterior sequences. Coherent Serre duality and the assumed vanishing bound give each form-degree cone bound.
3. Induct through the conormal sequence as in the complete BMS1 proof, then totalize.

Direct prerequisites: `CrystallineCohomology:CR.3/proper-perfectness`, `CrystallineCohomology:CR.3/derived-base-change`, `CrystallineCohomology:CR.2/smooth-lift-filtration`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `DerivedDeRhamCohomology:DD.1`.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §2, Lemma2.12, pp.17–18, complete proof. The weakened-Serre hypothesis and boundary range are retained.

Literal source excerpt:

> torsion-free cokernel

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysWeakLefschetz`.

E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-change maps with derived tensor products. A0-extension supplies proper coherent perfectness, dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still requires its source proof certificate.

### Proper smooth tests and a crystalline torsion surface

**Node:** CrystallineCohomology:CR.3/torsion-and-models. **Kind:** application.

**Declaration:** `TauCeti.Crystalline.crysAcceptanceModels`. All implementation status remains unchecked.

Acceptance includes K(P^d/W) with H^(2i)=W·h^i for0≤i≤d and odd groups0; smooth proper curves with H⁰=W,H²=W(−1) and H¹ finite free; and ordinary/supersingular elliptic curves with rational Frobenius slopes{0,1}/{1/2,1/2}. BMS1 Theorem2.10 supplies a smooth projective surface H over the stated mixed-characteristic O whose special fiber has H²_crys(H_k/W(k))_tor≅k⊕k, while the generic p-adic étale torsion is Z/p². This last comparison is an acceptance example from the source, not a new étale p-adic comparison owned here.

Hypotheses and conventions: Use the BMS1 finite-flat group action and sufficiently high smooth complete-intersection surface construction. The elliptic slope calculation uses the existing elliptic/crystalline realization supplier, not the definition of an F-crystal.

Proof outline:

1. Compute projective-space and curve de Rham models with finite reduction; use the existing algebraic geometry calculations.
2. Import the elliptic Dieudonné realization and classify ordinary versus supersingular Frobenius.
3. For the BMS surface, the E_k-torsor Leray sequence has low-degree map given by[p] on H¹_crys(E_k). Weak Lefschetz makes the degree-two comparison cokernel torsionfree, so the torsion is H¹(E_k)/p≅k². The geometric input certificate remains a gap.

Direct prerequisites: `CrystallineCohomology:CR.3/weak-lefschetz`, `CrystallineCohomology:CR.3/proper-perfectness`, `CrystallineCohomology:CR.3/frobenius-map`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/elliptic-dieudonne`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §2, Theorem2.10 and its E-torsor Leray proof, pp.16–17. This is the explicit torsion counterexample, proving that proper smooth finiteness is not torsionfreeness.

Literal source excerpt:

> k ⊕ k

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysAcceptanceModels`.

E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-change maps with derived tensor products. A0-extension supplies proper coherent perfectness, dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still requires its source proof certificate.

### CR.3 continuation required for closure

- BMS torsion-surface geometry and elliptic realization: Verify the finite-flat BMS1§2 group action and smooth complete-intersection construction through the geometric supplier. The cohomological E-torsor argument was read, but the complete geometric input is not certified here. R07.2 supplies slopes and the ordinary/supersingular Dieudonné classification; its exact elliptic realization contract still needs certification.
- Noetherian perfectness and completed base-change proof audit: Stacks60.24 states these results with proof hints. Supply the proper coherent perfectness and regular-envelope Tor computations and the compatible-perfect-tower reconstruction with actual hypotheses; the Noetherian scope above is intentional, and no non-Noetherian coefficient theorem is claimed closed.
- Supplier contract AlgebraicModuliForArithmeticGeometry:A0-extension: Export proper coherent cohomology finiteness/perfectness for proper flat finite-presentation schemes, its cohomological dimension bound, proper derived coherent Künneth, and the coherent Serre-duality/vanishing input for the weak Lefschetz proof. A0-extension explicitly owns higher-dimensional proper-flat coherent cohomology; extend its contract with the required derived Künneth and coherent-duality statements.
- Supplier contract FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2: Finite flat groups and integral p-adic Hodge theory, Part II: identify H¹_crys of an elliptic curve with the contravariant Dieudonné module of its p-divisible group, preserving crystalline Frobenius and perfect-field base change. Existing elliptic-dieudonne/dieudonne-slopes nodes supply classification; this requests only the realization comparison.
- Supplier contract tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1: Use the existing finite-field elliptic curve and ordinary/supersingular geometric classification as an upstream input; no new elliptic curve theory is planned here.
- Precise prototype obligations: CR.3: E1/E2/DD.1 must supply the actual enhanced RΓ_crys and completed base-change maps with derived tensor products. A0-extension supplies proper coherent perfectness, dimension bounds, Künneth and coherent duality. AI.0 supplies Witt Frobenius; R07.2 supplies elliptic Dieudonné realization; the finite-flat complete-intersection BMS input still requires its source proof certificate. The signatureCoverage register lists every omitted name and the exact limitations of every typed component. No comment-only form is included in the compilation counts.

## CR.3:Frobenius-isogeny — Frobenius isogeny

Purely inseparable pullback and rational crystalline Frobenius are separate
targets. The integration proof on an α_p cover constructs an explicit
p-integration homotopy in a torsionfree universal polynomial model and
specializes it through the divided basis. An iterated cover of constant
degree q gives a cone whose cohomology sheaves are killed by q; the global
kernel/cokernel bound is q^(i+1). Relative Frobenius in dimension d has
degree p^d, giving p^(d(i+1)), rather than a degree-independent bound.

The final rational map factors through the three actual maps from CR.3.
Perfect base-change and proper finiteness control the coefficient map.
Nondegeneracy uses the bounded-rank two-sided p-power inverse, which is
stronger data than generic injectivity or a determinant computation without
its square matrix and inverse. The rational statement asserts an
equivalence after p-inversion while preserving the base Frobenius twist.

Acceptance checks keep the seven integration conditions, the universal
injectivity and horizontal-error term, both local/global annihilator
bounds, the relative dimension factor and the actual coefficient inverse.
The E1/DD.1 site and enhanced-linearization contract remains the precise
prototype input; a semilinear vector-space stand-in is excluded.

Atlas planets: Crystalline Frobenius isogeny.

Coverage: planned. 2 declaration nodes. The following register states each mathematical target, its direct inputs and source-guided proof.

### p-power control for purely inseparable pullback

**Node:** CrystallineCohomology:CR.3:Frobenius-isogeny/inseparable-control. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crysInseparableControl`. All implementation status remains unchecked.

If f:X′→X is a locally iterated α_p-cover of constant degree q over a PD base with p in its PD ideal, pullback of a quasi-coherent crystal has a cone with cohomology sheaves killed by q. On H^i the pullback kernel and cokernel are killed by q^(i+1). For X/S₀ smooth of relative dimension d, relative Frobenius is such a cover of degree p^d and these groups are killed by p^(d(i+1)).

Hypotheses and conventions: The locally iterated-cover convention is the Stacks convention; q is constant. This statement controls relative pullback, separate from base Frobenius and the coefficient F-map.

Proof outline:

1. For one cover adjoin z with z^p=c and use D[z]⟨ξ⟩/(ξ−z^p+λ). The free D-basis z^iξ^[n],0≤i<p permits the explicit p-integration homotopy.
2. Verify the seven integration conditions, including universal injectivity and the horizontal error term, in the torsionfree universal polynomial model before specializing.
3. Compose covers through cone triangles, then apply the sheaf-to-global spectral sequence for the q^(i+1) bound. Relative Frobenius is locally the coordinatewise pth-power map after étale localization.

Direct prerequisites: `CrystallineCohomology:CR.2/embedding-computation`, `CrystallineCohomology:CR.2/pd-poincare`, `CrystallineCohomology:CR.2/envelope-differentials`, `CrystallineCohomology:CR.0/pd-polynomial`, `EnhancedDerivedSheaves:E2`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), §60.25, integration criterion, computation, iterated α_p covers and relative Frobenius lemmas. The complete integration proof and both sheaf/global bounds were read.

Literal source excerpt:

> annihilated by

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysInseparableControl`.

The exact E1 site pullback and DD.1 enhanced p-inverted linearization are required. The inseparable factorization must retain the α_(p^q) cone bound, H^i multiplication by p^(q(i+1)), relative Frobenius p^d factor, and bounded-rank two-sided coefficient inverse; a bare semilinear vector space cannot stand in for the crystal.

### Rational crystalline Frobenius isogeny

**Node:** CrystallineCohomology:CR.3:Frobenius-isogeny/rational-frobenius. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crysFrobeniusIsogeny`. All implementation status remains unchecked.

Let(A,I,γ) be a Noetherian p-complete PD base with p∈I and a PD Frobenius lift σ, X proper smooth over A/I, and E a finite locally free nondegenerate F-crystal with bounded rank and an inverse up to a power of p. Then the actual map K⊗^L_(A,σ)A→K from CR.3 becomes an equivalence after inverting p. In particular over W(k), Frobenius on each finite-dimensional H^i_crys(X/W)[1/p] is a σ-semilinear automorphism. Integral H^i need not be a finite free F-crystal.

Hypotheses and conventions: Nondegeneracy is the bounded-power condition, not an arbitrary coefficient F-map. p-torsion cohomology is retained before rationalization.

Proof outline:

1. The base-change factor is an equivalence modulo all p^e and hence on the perfect complete complexes.
2. Relative-Frobenius pullback becomes an equivalence after inverting p by the preceding explicit α_p-cover bounds.
3. The coefficient map becomes invertible after inverting p. Compose the three factors; use bounded rank to get a common two-sided p-power inverse from the specified nondegeneracy data.

Direct prerequisites: `CrystallineCohomology:CR.3/frobenius-map`, `CrystallineCohomology:CR.3/proper-perfectness`, `CrystallineCohomology:CR.3/derived-base-change`, `CrystallineCohomology:CR.1/isocrystal`, `CrystallineCohomology:CR.3:Frobenius-isogeny/inseparable-control`.

Source: [The Stacks Project Authors, Crystalline Cohomology](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex), Frobenius action section, final theorem and complete three-factor proof. This is the permitted classical route, so CR.4 is not needed as a circular prerequisite.

Literal source excerpt:

> after inverting

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysFrobeniusIsogeny`.

The exact E1 site pullback and DD.1 enhanced p-inverted linearization are required. The inseparable factorization must retain the α_(p^q) cone bound, H^i multiplication by p^(q(i+1)), relative Frobenius p^d factor, and bounded-rank two-sided coefficient inverse; a bare semilinear vector space cannot stand in for the crystal.

### CR.3:Frobenius-isogeny continuation required for closure

- Classical Frobenius nondegeneracy and prototype contract: Retain the bounded-rank two-sided p-power inverse and the actual three-map factorization. The exact site pullback and enhanced p-inverted linearization await the E1/DD.1 signatures, not an arbitrary semilinear-model placeholder.
- Precise prototype obligations: CR.3:Frobenius-isogeny: The exact E1 site pullback and DD.1 enhanced p-inverted linearization are required. The inseparable factorization must retain the α_(p^q) cone bound, H^i multiplication by p^(q(i+1)), relative Frobenius p^d factor, and bounded-rank two-sided coefficient inverse; a bare semilinear vector space cannot stand in for the crystal. The signatureCoverage register lists every omitted name and the exact limitations of every typed component. No comment-only form is included in the compilation counts.

## CR.3:duality — Trace and Poincaré duality

The trace is for a proper smooth scheme of pure dimension over W(k),
normalized on projective space and compatible with finite-level reduction.
For a finite locally free crystal E, cup product and coefficient evaluation
give K(E)⊗ᴸK(E∨)→W[−2d]. The adjoint is
K(E)≃RHom_W(K(E∨),W)[−2d]. Integral torsion belongs to the derived dual;
ordinary torsion-free cohomology pairings are not imposed. The structure
case gives the familiar perfect rational degree i/2d−i pairing.

Gysin maps retain the codimension shift, purity, support and the projection
formula. The diagonal class realizes the coevaluation and triangular
identities behind this derived pairing. These are concrete maps which the
CP.6 consumer must import with their normalization and reduction diagrams.

Ekedahl's finite-level Witt duality and I.5 comparison provide a read route,
but I.5 explicitly uses Berthelot VI/VII crystalline purity and residues.
The complete relevant book input or an independent replacement remains a
source gate. Coefficient duality, trace identification and compatible
perfect base change must be proved before marking this successor closed.

Acceptance checks require the point trace, P¹ hyperplane normalization,
codimension-two shift, diagonal action, triangular identities and a torsion
coefficient example that distinguishes derived duality from an ordinary
perfect pairing. The enhanced coefficient objects and purity/trace source
audit are the exact remaining signature and proof obligations.

Atlas planets: Crystalline trace; Crystalline Poincaré duality; Crystalline Gysin maps; Crystalline diagonal class.

Coverage: planned. 4 declaration nodes. The following register states each mathematical target, its direct inputs and source-guided proof.

### Proper smooth crystalline trace

**Node:** CrystallineCohomology:CR.3:duality/trace. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.crysTrace`. All implementation status remains unchecked.

For X/k proper smooth of pure dimension d over a perfect field, construct Tr_X:K(X/W)→W[−2d] and Tr_(X,e):K(X/W_e)→W_e[−2d], compatible with derived reduction. Normalize by Tr_(P^d)(h^d)=1. The complementary route uses the Ekedahl I.2 trace W_eΩ_X^d→f_e^!W_e[−d], its I.3 projective-space normalization and its I.5 comparison with the crystalline trace. The codimension-filtration/local-residue inputs of Berthelot VI–VII remain a proof gate.

Hypotheses and conventions: Proper, smooth, pure dimension; finite-level Witt base. Trace is a morphism of the actual crystalline derived complex, not an arbitrary functional on a top cohomology model.

Uses:

- Ekedahl I.5 and II2.2; CohomologyComparisons:CP.6: Normalizes the proper smooth trace by the projective-space class, and supplies the trace morphism that turns cup product into derived Poincaré duality.

Proof outline:

1. Construct Ekedahl’s trace by local smooth W_e lifts and Cartier, and prove its lift independence and étale compatibility.
2. Prove compatibility with reduction from I.3.3–4 and normalize on the standard projective-space Čech cocycle.
3. Identify with Berthelot’s crystalline trace by the I.5 local-residue/codimension-filtration characterization; the cited Berthelot proof inputs are not available in full and remain recorded.

Direct prerequisites: `CrystallineCohomology:CR.3/proper-perfectness`, `CrystallineCohomology:CR.3/cup-product`, `CrystallineCohomology:CR.4/crystalline-comparison`, `EnhancedDerivedSheaves:E1`.

Source: [Torsten Ekedahl, On the multiplicative properties of the de Rham–Witt complex I](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), I.2–5, especially(2.11), Lemma3.2, Theorem4.1 and I.5, pp.193–198. The source explicitly compares traces but invokes Berthelot VI and VII for the residue characterization; that obligation is not silently closed.

Literal source excerpt:

> Berthelot

API outline:

- `TauCeti.Crystalline.crysTrace_projective` (simp): Tr_(P^d)(h^d)=1.
- `TauCeti.Crystalline.crysTrace_reduction` (compatibility): Tr_X⊗^L W_e=Tr_(X,e) under the actual reduction equivalence.
- `TauCeti.Crystalline.crysTrace_etale_local` (functoriality): The local residue trace is compatible with the pointed étale comparison used in Ekedahl I.5.

Unit tests:

- `TauCeti.Crystalline.test_crysTrace_point` (degenerate): For X=Spec k,d=0, trace is id_W.
- `TauCeti.Crystalline.test_crysTrace_P1` (computation): The degree-two hyperplane class of P¹ has trace1.
- `TauCeti.Crystalline.test_crysTrace_no_torsion_free` (non-example): Trace is constructed on K even when individual H^i have torsion; no ordinary group duality is imposed.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysTrace`, `TauCeti.Crystalline.crysTrace_projective`, `TauCeti.Crystalline.crysTrace_reduction`, `TauCeti.Crystalline.crysTrace_etale_local`, `TauCeti.Crystalline.test_crysTrace_point`, `TauCeti.Crystalline.test_crysTrace_P1`, `TauCeti.Crystalline.test_crysTrace_no_torsion_free`.

E1/E2 must provide the coefficient tensor/derived Hom/shift objects, and A0-extension their coherent duality input. The crystalline purity, residues, support functors and trace identification need the recorded Berthelot VI/VII or independent replacement proof. The actual morphisms, codimension shifts, coefficient evaluation and base-change diagrams are required before typing the derived perfect-pairing statements.

### Derived crystalline Poincaré duality

**Node:** CrystallineCohomology:CR.3:duality/poincare-pairing. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crysPoincareDuality`. All implementation status remains unchecked.

For the same X and a finite locally free crystal E, cup product followed by trace gives K(X,E)⊗^L_W K(X,E∨)→W[−2d] and its adjoint is an equivalence K(X,E)≅RHom_W(K(X,E∨),W)[−2d]. It is compatible with finite-level reduction and qualified perfect base change. The structure case rationalizes to perfect pairings H^i⊗H^(2d−i)→W[1/p], while integral torsion contributes through the derived dual and is not erased.

Hypotheses and conventions: Proper smooth pure dimension, actual dual coefficient crystal and perfect complexes.

Proof outline:

1. Use the trace normalized above and the actual coefficient evaluation E⊗E∨→O.
2. At finite level apply the de Rham–Witt duality construction and coefficient-local trivializations, with the source comparison gate discharged.
3. Take the compatible perfect derived inverse limit, using DD.1 tensor/Hom comparisons for perfect complexes. No ordinary perfect pairing on every torsion cohomology group is inferred.

Direct prerequisites: `CrystallineCohomology:CR.3:duality/trace`, `CrystallineCohomology:CR.1/crystal`, `CrystallineCohomology:CR.3/proper-perfectness`, `CrystallineCohomology:CR.3/cup-product`, `DerivedDeRhamCohomology:DD.1`.

Source: [Torsten Ekedahl, On the multiplicative properties of the de Rham–Witt complex I](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), II, Theorem2.2 and Corollary2.2.23; I.5 crystalline comparison. Finite-level duality supplies the complementary route; passing it to the exact crystalline coefficient pairing remains a recorded audit.

Literal source excerpt:

> cup product

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysPoincareDuality`.

E1/E2 must provide the coefficient tensor/derived Hom/shift objects, and A0-extension their coherent duality input. The crystalline purity, residues, support functors and trace identification need the recorded Berthelot VI/VII or independent replacement proof. The actual morphisms, codimension shifts, coefficient evaluation and base-change diagrams are required before typing the derived perfect-pairing statements.

### Proper smooth crystalline Gysin maps

**Node:** CrystallineCohomology:CR.3:duality/gysin. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.crysGysin`. All implementation status remains unchecked.

For a proper morphism f:X→Y between proper smooth pure-dimensional k-schemes, define f_*:K(X/W)→K(Y/W)[2(dimY−dimX)] as the adjoint of f^*:K(Y/W)→K(X/W) under the normalized derived pairings. For a regular closed immersion of codimension c this sends1 to its crystalline class in H^(2c)(Y). Prove projection formula, composition and qualified Tor-independent base change; identify the regular-immersion map with the local PD residue/purity construction before exporting it as geometric Gysin.

Hypotheses and conventions: Actual normalized duality is a prerequisite; base-change squares retain Tor-independence and the compatible coefficient hypotheses.

Uses:

- Ekedahl I.3–I.5; CR.3:duality/diagonal; CohomologyComparisons:CP.6: Provides purity and pushforward for regular immersions with the codimension shift, composition and projection formula needed for cycle classes and trace compatibility.

Proof outline:

1. Transpose pullback through the duality equivalences, fixing the shift by both dimensions.
2. Adjunction and cup naturality prove the projection formula and composition.
3. Audit purity/local residues for a regular immersion and compare to the transposed map. This equality depends on the same missing Berthelot source route.

Direct prerequisites: `CrystallineCohomology:CR.3:duality/poincare-pairing`, `CrystallineCohomology:CR.3:duality/trace`, `CrystallineCohomology:CR.3/cup-product`, `CrystallineCohomology:CR.3/derived-base-change`.

Source: [Torsten Ekedahl, On the multiplicative properties of the de Rham–Witt complex I](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), I.5, local crystalline residues and trace comparison. This supplies the exact local-residue comparison boundary. Full crystalline purity/Gysin functoriality requires the recorded Berthelot audit.

Literal source excerpt:

> residue map

API outline:

- `TauCeti.Crystalline.crysGysin_comp` (functoriality): (g∘f)_*=g_*∘f_* with the corresponding summed dimension shifts.
- `TauCeti.Crystalline.crysGysin_projection` (relation): f_*(x·f^*y)=f_*x·y.
- `TauCeti.Crystalline.crysGysin_trace` (compatibility): For the structural map X→Spec k, f_*=Tr_X.

Unit tests:

- `TauCeti.Crystalline.test_crysGysin_identity` (degenerate): For id_X, pushforward is the identity.
- `TauCeti.Crystalline.test_crysGysin_hyperplane` (computation): For P^(d−1)→P^d, the image of1 is h.
- `TauCeti.Crystalline.test_crysGysin_shift` (compatibility): For X→Spec k the target shift is−2dimX, agreeing with the trace.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysGysin`, `TauCeti.Crystalline.crysGysin_comp`, `TauCeti.Crystalline.crysGysin_projection`, `TauCeti.Crystalline.crysGysin_trace`, `TauCeti.Crystalline.test_crysGysin_identity`, `TauCeti.Crystalline.test_crysGysin_hyperplane`, `TauCeti.Crystalline.test_crysGysin_shift`.

E1/E2 must provide the coefficient tensor/derived Hom/shift objects, and A0-extension their coherent duality input. The crystalline purity, residues, support functors and trace identification need the recorded Berthelot VI/VII or independent replacement proof. The actual morphisms, codimension shifts, coefficient evaluation and base-change diagrams are required before typing the derived perfect-pairing statements.

### Diagonal class and crystalline coevaluation

**Node:** CrystallineCohomology:CR.3:duality/diagonal. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.crysDiagonal`. All implementation status remains unchecked.

For X proper smooth of pure dimension d, define [Δ_X]=Δ_*(1)∈H^(2d)_crys(X×X/W) and identify it under derived Künneth with coevaluation W→K(X)⊗^L K(X)[2d], using the Poincaré dual identification. Evaluation is cup followed by Tr_X. The two contraction composites are identities. For P^d, [Δ]=Σ_(i=0)^d h₁^i h₂^(d−i). All comparisons preserve finite-level reduction and the normalized traces.

Hypotheses and conventions: Use the geometric Gysin comparison and the actual Künneth equivalence.

Uses:

- Ekedahl I.5; CR.3:duality/poincare-pairing: Uses the diagonal cycle to identify the adjunction and triangular identities behind the perfect derived pairing, including coefficients with torsion.

Proof outline:

1. Apply the regular-immersion Gysin construction to the diagonal, codimension d.
2. Use projection formula to show that the diagonal correspondence acts as id on K(X); this identifies the coevaluation under Künneth.
3. Duality supplies the two triangular identities. Compute the projective-space class in the basis fixed by Tr(h^d)=1.

Direct prerequisites: `CrystallineCohomology:CR.3:duality/gysin`, `CrystallineCohomology:CR.3:duality/poincare-pairing`, `CrystallineCohomology:CR.3/kunneth`, `CrystallineCohomology:CR.3/cup-product`.

Source: [Torsten Ekedahl, On the multiplicative properties of the de Rham–Witt complex I](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), Introduction and I.3 projective normalization, combined with the transposed Gysin construction. The diagonal is derived from the explicitly stated trace/duality/Gysin contracts; its local-purity gate is retained.

Literal source excerpt:

> crystalline duality formula

API outline:

- `TauCeti.Crystalline.crysDiagonal_action` (characterisation): The diagonal correspondence acts as id_K.
- `TauCeti.Crystalline.crysDiagonal_triangles` (relation): Evaluation and coevaluation satisfy both triangular identities.
- `TauCeti.Crystalline.crysDiagonal_projective` (example): On P^d, [Δ]=Σh₁^i h₂^(d−i).

Unit tests:

- `TauCeti.Crystalline.test_crysDiagonal_point` (degenerate): For the point the diagonal class and coevaluation are1.
- `TauCeti.Crystalline.test_crysDiagonal_P1` (computation): For P¹, [Δ]=h₁+h₂.
- `TauCeti.Crystalline.test_crysDiagonal_torsion` (non-example): Coevaluation lives in the derived tensor; it is not specified by choosing a free basis of every H^i.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crysDiagonal`, `TauCeti.Crystalline.crysDiagonal_action`, `TauCeti.Crystalline.crysDiagonal_triangles`, `TauCeti.Crystalline.crysDiagonal_projective`, `TauCeti.Crystalline.test_crysDiagonal_point`, `TauCeti.Crystalline.test_crysDiagonal_P1`, `TauCeti.Crystalline.test_crysDiagonal_torsion`.

E1/E2 must provide the coefficient tensor/derived Hom/shift objects, and A0-extension their coherent duality input. The crystalline purity, residues, support functors and trace identification need the recorded Berthelot VI/VII or independent replacement proof. The actual morphisms, codimension shifts, coefficient evaluation and base-change diagrams are required before typing the derived perfect-pairing statements.

### CR.3:duality continuation required for closure

- Crystalline duality, purity and trace identification source gate: The acquired Ekedahl I.5 explicitly invokes Berthelot LNM407 VI1.4.5/1.6.1 and VII1.4.6/1.4.9/1.4.11 for the Cohen–Macaulay codimension filtration and crystalline residues. Acquire the complete volume or audit an independent replacement. Verify coefficient duality, Gysin/purity identification, projective normalization and derived base-change compatibility before the CP.6 export. The complementary finite-level Witt route has been read at I.2–5 and II2.2/2.2.23; it is not a full closure certificate.
- Precise prototype obligations: CR.3:duality: E1/E2 must provide the coefficient tensor/derived Hom/shift objects, and A0-extension their coherent duality input. The crystalline purity, residues, support functors and trace identification need the recorded Berthelot VI/VII or independent replacement proof. The actual morphisms, codimension shifts, coefficient evaluation and base-change diagrams are required before typing the derived perfect-pairing statements. The signatureCoverage register lists every omitted name and the exact limitations of every typed component. No comment-only form is included in the compilation counts.

## CR.4 — Ordinary, saturated and relative de Rham–Witt

The inherited Dieudonné prefix uses the actual integer-indexed cochain
complex and F satisfying dF=pFd. Saturation is the η_p colimit and its
universal map. Once saturated, the image criterion gives V, its FV/VF and
FdV/Vd identities, and the filtration V^rM+dV^rM. Finite quotient complexes
have actual restriction, Frobenius and Verschiebung maps with their stated
source lengths. The inverse-limit completion is formed from compatible
degreewise families; strictness is the bijectivity of the unit into that
completion. Finite quotients, saturation and completion are kept separate.

A Dieudonné algebra adds an existing graded ring structure, graded signs,
odd-square zero, Leibniz and the modulo-p Frobenius condition. Its projection
formula proves the finite quotient ideals are multiplicative. The saturated
de Rham–Witt algebra is initial for maps R→D⁰/VD⁰ into strict algebras. Its
degree zero is W(S_R), with S_R its reduced residue; W(R_red) is not imposed
for arbitrary singular R. The smooth/perfect and regular-Noetherian
classical comparisons are separate theorems using Cartier and Popescu.

For a Z_(p)-algebra A→R, the relative initial F–V procomplex uses the pinned
W_r(R) as its coefficient rings and actual base maps. Here VF=V(1), and the
test over Z/p² distinguishes this from multiplication by p. The initiality
API exposes actual procomplex morphisms. Length one compares to ordinary
de Rham forms and degree zero to W_r(R); the higher-form comparison requires
the DD.0 DGA, not a fabricated carrier. Langer–Zink's basic Witt differentials
have rational weights, ordered support blocks and coefficient module
V^uW_(r−u)(A), with three cases depending on the first block and integrality.
There is no uniform free W_r(A) coefficient module in arbitrary-base forms.

Étale and localization comparisons use the genuine Witt tensor maps and
the uniquely extended derivation. Finite localization inverts [s]; saturated
infinite localization additionally takes strict completion. Quotients use
the differential graded ideal W_r(I)+dW_r(I). Cofinality of the specified
Teichmüller ideal topologies gives ordinary completion comparisons at fixed
length. Continuous relative forms are degreewise ordinary p-completions;
DD.1 supplies the distinct derived/infinite-limit comparison.

For Laurent coordinates, the integral-weight subcomplex is the image of
ordinary forms on W_r(A)[U_i^±1] under U_i↦[T_i]; its fractional complement
is acyclic. This identifies an injective quasi-isomorphism whose image
depends on coordinates. Perfectoid base change uses the Q0 coefficient
Tor-independence for every weight module, rather than assuming all Witt
modules are flat. The crystalline comparison at finite length uses the
canonical base PD ideal and flat quasi-coherent crystals; the infinite
comparison uses the surjective restriction system and bounded dimension.

The enhanced Lη_p-fixed category has a specified equivalence and actual
morphism data in a homotopy equalizer. It is not the property that an
equivalence exists. The slope spectral sequence is rationally E₁-degenerate
with the a-th column in [a,a+1); integral degeneration and integral finite
generation of every H^b(WΩ^a) are excluded. Illusie II and the applicable
Illusie–Raynaud input remain a source gate.

The Nygaard filtration has degree q<i equal to p^(i−q−1)imV and degree q≥i
equal to the entire complex. Divided Frobenius identifies gr_N^i with the
good truncation τ≤iΩ; the cofiber description uses the stupid Hodge
truncation Ω≤i instead. A Frobenius-lift description of the filtration is
qualified by the chosen lift. Finite logarithmic coefficients are étale
unit-symbol image sheaves. Their finite 1−F target is the quotient by
dV^(r−1)Ω^(q−1); the pro-sequence uses R−F. The pro-étale Nygaard sequence
uses φ_i−1 and the repleteness input explicitly.

Finally, the semistable Wω, Wω̃ and Sato WΞ models use the log embedding
system supplied by CR.5. Their rational comparisons feed CR.6 and the
DL diagram. The proper-support nodes preserve the natural map shapes in
(B.6)/(B.9), the tube support functor and the dlog square (B.10). The nodes
do not turn these maps into blanket equivalences.

Acceptance checks include negative complex degrees, finite-level p-power
annihilation, restriction/F/V normalization, the strict Z_p algebra,
characteristic-two odd squares, a singular nilpotent input, the relative
V(1) example, Laurent dlog, degree-scaled Frobenius, the Nygaard boundary
exponent and good/stupid truncation distinction. The supplier, source and
prototype registers retain every missing condition needed to close these
targets.

Atlas planets: Dieudonné complexes; Saturated de Rham–Witt complex; Relative de Rham–Witt complex; Crystalline de Rham–Witt comparison; Décalage fixed points; Nygaard filtration.

Coverage: planned. 66 declaration nodes. The following register states each mathematical target, its direct inputs and source-guided proof.

### Dieudonné complexes

**Node:** CrystallineCohomology:CR.4/dieudonne-complex. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.DieudonneComplex`. All implementation status remains unchecked.

A Dieudonné complex is a cochain complex of abelian groups (M*,d) with a map of graded abelian groups F:M*→M* satisfying dF(x)=pF(dx); morphisms commute with d and F. For a p-torsion-free complex, (η_p M)^n={x∈p^nM^n : dx∈p^{n+1}M^{n+1}} is a subcomplex of M*[p^{-1}] (Construction 2.1.3; for complexes in nonnegative degrees η_pM⊆M, footnote 1). For termwise p-torsion-free M, a Dieudonné structure F is equivalent to a map of cochain complexes α_F:M*→(η_pM)*, α_F(x)=p^nF(x) for x∈M^n, with inverse F(x)=p^{-n}α(x).

Hypotheses and conventions: p is a prime, fixed throughout the source (BLM lines 237 and 463: 'a prime p which is implicitly fixed throughout the sequel'). Termwise p-torsion-freeness is required for the equivalence with the décalage description, not for the definition of a Dieudonné complex.

Uses:

- BLM §§2.2–2.5; CrystallineCohomology:CR.4: The successive saturation and completion constructions form the inherited approach to strict de Rham–Witt complexes; they do not replace the classical smooth comparison theorem.

Proof outline:

1. Use dF=pFd to check that p^nF lands in the η_p submodule and commutes with the differentials.
2. Conversely divide α(x) by p^n inside the localization; membership in η_p makes the result an element of M.
3. Check the two constructions are inverse and preserve morphisms.

Direct prerequisites: `AInfCohomology:AI.1/ideal-decalage-complex`, `mathlib:CochainComplex`, `mathlib:ModuleCat`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition 2.1.1, Construction 2.1.3 and Remark 2.1.4, pp.13–14; extracted lines 517–549. The source constructs both maps with their degree scaling.

Literal source excerpt:

> These constructions are inverse

API outline:

- `TauCeti.Crystalline.DieudonneComplex.F_zero` (simp): F is zero preserving in every degree.
- `TauCeti.Crystalline.DieudonneComplex.F_add` (simp): F is additive in every degree.
- `TauCeti.Crystalline.DieudonneComplex.d_F` (relation): The relation is dF=pFd, including negative cochain degrees.

Unit tests:

- `TauCeti.Crystalline.test_dieudonne_zero` (degenerate): There is a Dieudonné complex with every group zero.
- `TauCeti.Crystalline.test_dieudonne_degree_zero` (computation): Z concentrated in degree zero permits any Frobenius multiplication a.
- `TauCeti.Crystalline.test_dieudonne_not_chain` (non-example): For p=2 there is a Dieudonné complex with dF≠Fd: Z→Z with d=id, F₀=2 and F₁=1.

Acceptance:

- Distinguish F, a graded map, from α_F, a chain map.
- Check the source equation dF=pFd on a homogeneous element and under tensor products.

Suggested-form coverage: Typed components have the following exact limits.

The cochain/F structure and morphisms are typed. The α_F dictionary on the actual localized η_p subcomplex, including negative degrees, requires AI.1.

### Saturated Frobenius

**Node:** CrystallineCohomology:CR.4/saturated-frobenius. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.IsSaturated`. All implementation status remains unchecked.

A Dieudonné complex is saturated when it is termwise p-torsion-free and F:M^n→{x∈M^n:dx∈pM^{n+1}} is bijective in every degree. Equivalently, α_F:M→η_p M is an isomorphism.

Hypotheses and conventions: A Dieudonné complex; saturation includes p-torsion-freeness.

Uses:

- BLM §§2.2–2.5; CrystallineCohomology:CR.4: The successive saturation and completion constructions form the inherited approach to strict de Rham–Witt complexes; they do not replace the classical smooth comparison theorem.

Proof outline:

1. Identify p^n times the target of F with (η_p M)^n.
2. Use the established α_F dictionary to transport bijectivity to a chain isomorphism.

Direct prerequisites: `CrystallineCohomology:CR.4/dieudonne-complex`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition 2.2.1 and Remark 2.2.2, p.14; extracted lines 555–565. The definition and its equivalent décalage formulation appear consecutively.

Literal source excerpt:

> is an isomorphism

API outline:

- `TauCeti.Crystalline.IsSaturated.p_injective` (characterisation): Multiplication by p is injective in every degree.
- `TauCeti.Crystalline.IsSaturated.F_injective` (characterisation): The graded Frobenius is injective.
- `TauCeti.Crystalline.IsSaturated.F_range` (characterisation): The image of F in degree n consists exactly of elements whose differential is p-divisible.

Unit tests:

- `TauCeti.Crystalline.test_saturated_zero` (degenerate): Every complex whose groups are zero is saturated.
- `TauCeti.Crystalline.test_saturated_zero_d` (characterisation): For zero differential and termwise p-torsionfree groups, saturation is equivalent to bijectivity of F.
- `TauCeti.Crystalline.test_saturated_multiplication_two` (non-example): The degree-zero group Z with F=2 is not saturated at p=2.

Acceptance:

- Check saturation is preserved by isomorphism of Dieudonné complexes.
- Do not replace a strict chain isomorphism here with a derived fixed-point assertion.

Suggested-form coverage: Typed components have the following exact limits.

Termwise p-injectivity and the exact bijective-F image criterion are typed. Its equivalence with α_F:M→η_pM being an isomorphism requires the actual AI.1 η_p subcomplex.

### Verschiebung and the differential

**Node:** CrystallineCohomology:CR.4/verschiebung-identities. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.verschiebung`. All implementation status remains unchecked.

On a saturated Dieudonné complex define V uniquely by F(Vx)=px. It is injective and satisfies FV=VF=p, FdV=d and Vd=p dV.

Hypotheses and conventions: The complex is saturated; in particular F is injective and M is p-torsion-free.

Uses:

- BLM §§2.2–2.5; CrystallineCohomology:CR.4: The successive saturation and completion constructions form the inherited approach to strict de Rham–Witt complexes; they do not replace the classical smooth comparison theorem.

Proof outline:

1. Since d(px) belongs to pM, saturation puts px in the image of F; injectivity gives existence and uniqueness of V.
2. FV=p implies injectivity of V. Precompose with F and cancel F to obtain VF=p.
3. Combine dF=pFd and FV=p, cancel p, and then postcompose with V to obtain the differential identities.

Direct prerequisites: `CrystallineCohomology:CR.4/saturated-frobenius`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Remark 2.2.3 and Proposition 2.2.4 with proof, p.14; extracted lines 566–581. The proof uses injectivity and p-torsion-freeness for the stated cancellations.

Literal source excerpt:

> Since F is injective

API outline:

- `TauCeti.Crystalline.verschiebung_FV` (relation): F(Vx)=px in every degree.
- `TauCeti.Crystalline.verschiebung_VF` (relation): V(Fx)=px in every degree.
- `TauCeti.Crystalline.verschiebung_d` (relation): Vd=p dV; V is not assumed to be a chain map.
- `TauCeti.Crystalline.verschiebung_FdV` (relation): FdV=d in each degree.
- `TauCeti.Crystalline.verschiebung_injective` (characterisation): V is injective in each degree.

Unit tests:

- `TauCeti.Crystalline.test_V_zero` (degenerate): V(0)=0.
- `TauCeti.Crystalline.test_V_F_identity` (computation): If F is identity in a degree, V is multiplication by p there.
- `TauCeti.Crystalline.test_V_F_p` (computation): If F is multiplication by p in a degree, V is identity there; e.g. a rational degree-zero group.

Acceptance:

- Check all identities as maps of graded groups; V itself generally does not commute with d.
- Retain the cancellation hypotheses in every step.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Iterated Frobenius divisibility

**Node:** CrystallineCohomology:CR.4/iterated-frobenius-divisibility. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.iteratedF_range`. All implementation status remains unchecked.

For a saturated Dieudonné complex and every r≥0, F^r identifies M^n with {x∈M^n:dx∈p^rM^{n+1}}. Consequently every cocycle belongs to the image of every iterate F^r.

Hypotheses and conventions: The complex is saturated.

Uses:

- BLM §§2.2–2.5; CrystallineCohomology:CR.4: The successive saturation and completion constructions form the inherited approach to strict de Rham–Witt complexes; they do not replace the classical smooth comparison theorem.

Proof outline:

1. The forward inclusion follows from dF^r=p^rF^rd.
2. For dx=p^r y with r>0, p-torsion-freeness gives dy=0.
3. Write x=F(x′) and y=F(y′) by saturation, cancel pF to obtain dx′=p^{r−1}y′, and apply induction.

Direct prerequisites: `CrystallineCohomology:CR.4/saturated-frobenius`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Proposition 2.2.5 and Remark 2.2.6, p.15; extracted lines 583–599. The source gives this exact induction and its cocycle consequence.

Literal source excerpt:

> by induction on r

Acceptance:

- Check r=0 and r=1 explicitly.
- Apply the result to a cocycle to obtain infinite F-divisibility without asserting compatible choices beyond the unique lifts.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Saturation by iterated décalage

**Node:** CrystallineCohomology:CR.4/saturation-colimit. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.Saturation`. All implementation status remains unchecked.

Every Dieudonné complex M* admits a saturation M*→Sat(M*): a map to a saturated complex through which every map to a saturated complex factors uniquely. First quotient by the graded subgroup T* of elements killed by a power of p; on the p-torsion-free quotient take the direct limit of the sequence M*→(η_pM)*→(η_pη_pM)*→⋯ whose transition maps are α_F, η_p(α_F), η_p(η_p(α_F)),… (display (8)). Saturation is left adjoint to the inclusion DC_sat↪DC.

Hypotheses and conventions: A Dieudonné complex; no initial saturation or p-torsion-freeness assumption.

Uses:

- BLM §§2.2–2.5; CrystallineCohomology:CR.4: The successive saturation and completion constructions form the inherited approach to strict de Rham–Witt complexes; they do not replace the classical smooth comparison theorem.

Proof outline:

1. Reduce to the p-torsion-free case by replacing M* by M*/T*; the source states this reduction without detail (p.15, lines 613–615). The elementary checks behind it are that T* is stable under d and F, that M*/T* is p-torsion-free, and that every map to a saturated (hence p-torsion-free) complex kills T*.
2. On the torsion-free quotient construct the η_p iteration.
3. Use commutation of η_p with filtered colimits to make the induced α_F invertible on the colimit.
4. The source asserts that the direct limit 'is a saturation of M*' (line 621) without further detail; the universal property is the check that a map to a saturated target extends uniquely at each η_p stage and that the compatible colimit map is unique.

Direct prerequisites: `CrystallineCohomology:CR.4/saturated-frobenius`, `AInfCohomology:AI.1`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Proposition 2.3.1 and Corollary 2.3.2, p.15; extracted lines 600–623. The proof constructs the saturation from the torsion quotient and displayed colimit.

Literal source excerpt:

> commutes with filtered colimits

API outline:

- `TauCeti.Crystalline.Saturation.unit` (constructor): The canonical morphism M→Sat(M) commutes with d and F.
- `TauCeti.Crystalline.Saturation.lift` (universal-property): For every saturated K, composition with the unit bijects Hom(Sat(M),K) with Hom(M,K).
- `TauCeti.Crystalline.Saturation.idempotent` (characterisation): The unit is an isomorphism when M is saturated; hence saturation is idempotent.

Unit tests:

- `TauCeti.Crystalline.test_saturation_Z_identity` (compatibility): The degree-zero complex Z with F=id is already saturated at each prime p, so its saturation unit is an isomorphism.
- `TauCeti.Crystalline.test_saturation_p_torsion` (degenerate): The degree-zero group Z/p with F=0 has zero saturation because every map to a p-torsionfree group kills it.
- `TauCeti.Crystalline.test_saturation_invert_p` (computation): For Z in degree zero with F multiplication by p, saturation is Z[1/p] in degree zero with the same Frobenius.

Acceptance:

- Prove existence and uniqueness of the universal factorization.
- Do not infer that M→Sat(M) is a quasi-isomorphism for an arbitrary singular input.

Suggested-form coverage: Typed components have the following exact limits.

The unit and universal morphism interface is typed on actual Dieudonné complexes. Its explicit identification with the iterated η_p colimit awaits the AI.1 underived contract.

### Cartier criterion for saturation

**Node:** CrystallineCohomology:CR.4/cartier-saturation-mod-p. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.cartier_saturation_mod_p`. All implementation status remains unchecked.

If M is a termwise p-torsion-free Dieudonné complex and F induces an isomorphism of graded groups M/p→H*(M/p), then M/p→Sat(M)/p is a quasi-isomorphism.

Hypotheses and conventions: M has Cartier type as defined in BLM 2.4.1; saturation alone does not imply this hypothesis.

Uses:

- BLM §§2.2–2.5; CrystallineCohomology:CR.4: The successive saturation and completion constructions form the inherited approach to strict de Rham–Witt complexes; they do not replace the classical smooth comparison theorem.

Proof outline:

1. Use the generic Bockstein comparison (η_pM)/p≃(H*(M/p),β).
2. A map that is a quasi-isomorphism modulo p stays so after η_p: it induces an isomorphism on the Bockstein complexes.
3. Factor the Cartier map through α_F:M/p→(η_pM)/p; the Bockstein comparison and two-out-of-three make α_F a quasi-isomorphism.
4. Apply η_p repeatedly and pass to the filtered colimit describing saturation.
5. Passing from the stages (η_p^k M)/p to Sat(M)/p uses that cohomology and reduction modulo p commute with filtered colimits; this is not stated in the source.

Direct prerequisites: `CrystallineCohomology:CR.4/saturation-colimit`, `AInfCohomology:AI.1/bockstein-reduction`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition 2.4.1, Proposition 2.4.5, Corollary 2.4.6 and proof of Theorem 2.4.2, pp.16–18; extracted lines 661–764. The proof reduces the full saturation tower to the first map using the Bockstein comparison.

Literal source excerpt:

> it suffices to verify

Acceptance:

- Verify the triangle with F and the Bockstein comparison commutes.
- Keep Cartier type separate from saturation; the source warns the saturation itself is generally not Cartier type.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.cartier_saturation_mod_p`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### The de Rham–Witt completion tower

**Node:** CrystallineCohomology:CR.4/verschiebung-completion-tower. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.Completion`. All implementation status remains unchecked.

For saturated M* form W_r(M)*=M*/(im V^r+im dV^r) for r≥0 (W_0(M)*=0), the restriction maps Res:W_{r+1}(M)*→W_r(M)*, and the completion W(M)*=lim_r W_r(M)*. F descends to F:W_r(M)*→W_{r−1}(M)* and V to V:W_r(M)*→W_{r+1}(M)*; passing to the limit makes W(M)* a Dieudonné complex, the construction is functorial, and the tautological map ρ_M:M*→W(M)* is a map of Dieudonné complexes (Remark 2.5.3).

Hypotheses and conventions: M is saturated; r≥0 and W_0(M)=0.

Uses:

- BLM §§2.2–2.5; CrystallineCohomology:CR.4: The successive saturation and completion constructions form the inherited approach to strict de Rham–Witt complexes; they do not replace the classical smooth comparison theorem.

Proof outline:

1. The denominator is a subcomplex because d²=0.
2. Use FdV=d and FV=p to show F lowers the level.
3. Use Vd=p dV to show V raises the level.
4. Pass the compatible graded maps and the differential to the inverse limit; check naturality under maps of saturated complexes.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-identities`, `CrystallineCohomology:CR.4/finite-witt-projection`, `CrystallineCohomology:CR.4/finite-witt-restriction`, `CrystallineCohomology:CR.4/finite-witt-F`, `CrystallineCohomology:CR.4/finite-witt-V`, `CrystallineCohomology:CR.4/finite-witt-map`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction 2.5.1 and Remarks 2.5.2–2.5.3, pp.19–20; extracted lines 767–828. The construction and operator descent are explicit; this passage does not prove the subsequent comparison theorem.

Literal source excerpt:

> inverse limit of the tower

API outline:

- `TauCeti.Crystalline.Completion.restriction` (functoriality): The quotient map W_{r+1}M→W_rM commutes with d and has the specified composite law.
- `TauCeti.Crystalline.Completion.F` (data): F descends from W_{r+1}M to W_rM; on the inverse limit it satisfies dF=pFd.
- `TauCeti.Crystalline.Completion.V` (data): V descends from W_rM to W_{r+1}M with its existing differential relation.
- `TauCeti.Crystalline.Completion.unit` (constructor): The natural map ρ:M→lim_r W_rM is a morphism of Dieudonné complexes.

Unit tests:

- `TauCeti.Crystalline.test_completion_W0` (degenerate): W₀M is the zero complex, since V⁰ is identity.
- `TauCeti.Crystalline.test_completion_Z` (computation): For M=Z in degree zero with F=id, V=p, W_rM=Z/p^r and W(M)=Z_p.
- `TauCeti.Crystalline.test_completion_rational` (non-example): For M=Q in degree zero with F=id, V=p is bijective, all W_rM vanish and the completion is zero.

Acceptance:

- Check the indexing of F, V and restriction on finite quotients.
- Keep proof of saturation/strictness of the completion and comparison with classical de Rham–Witt as further results.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The relation is dF=pFd, including negative cochain degrees

**Node:** CrystallineCohomology:CR.4/dieudonne-dF. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.DieudonneComplex.d_F`. All implementation status remains unchecked.

The relation is dF=pFd, including negative cochain degrees. The declaration is the existing API item, promoted once for explicit dependency use.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Direct prerequisites: `CrystallineCohomology:CR.4/dieudonne-complex`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> FV = VF = p

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Multiplication by p is injective in every degree

**Node:** CrystallineCohomology:CR.4/saturated-p-injective. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.IsSaturated.p_injective`. All implementation status remains unchecked.

Multiplication by p is injective in every degree. The declaration is the existing API item, promoted once for explicit dependency use.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Direct prerequisites: `CrystallineCohomology:CR.4/saturated-frobenius`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> FV = VF = p

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The graded Frobenius is injective

**Node:** CrystallineCohomology:CR.4/saturated-F-injective. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.IsSaturated.F_injective`. All implementation status remains unchecked.

The graded Frobenius is injective. The declaration is the existing API item, promoted once for explicit dependency use.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Direct prerequisites: `CrystallineCohomology:CR.4/saturated-frobenius`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> FV = VF = p

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The image of F in degree n consists exactly of elements whose differential is p-divisible

**Node:** CrystallineCohomology:CR.4/saturated-F-range. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.IsSaturated.F_range`. All implementation status remains unchecked.

The image of F in degree n consists exactly of elements whose differential is p-divisible. The declaration is the existing API item, promoted once for explicit dependency use.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Direct prerequisites: `CrystallineCohomology:CR.4/saturated-frobenius`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> FV = VF = p

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### F(Vx)=px in every degree

**Node:** CrystallineCohomology:CR.4/verschiebung-FV. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.verschiebung_FV`. All implementation status remains unchecked.

F(Vx)=px in every degree. The declaration is the existing API item, promoted once for explicit dependency use.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-identities`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> FV = VF = p

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### V(Fx)=px in every degree

**Node:** CrystallineCohomology:CR.4/verschiebung-VF. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.verschiebung_VF`. All implementation status remains unchecked.

V(Fx)=px in every degree. The declaration is the existing API item, promoted once for explicit dependency use.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-identities`, `CrystallineCohomology:CR.4/verschiebung-FV`, `CrystallineCohomology:CR.4/saturated-F-injective`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> FV = VF = p

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Vd=p dV; V is not assumed to be a chain map

**Node:** CrystallineCohomology:CR.4/verschiebung-d. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.verschiebung_d`. All implementation status remains unchecked.

Vd=p dV; V is not assumed to be a chain map. The declaration is the existing API item, promoted once for explicit dependency use.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-identities`, `CrystallineCohomology:CR.4/verschiebung-FdV`, `CrystallineCohomology:CR.4/verschiebung-VF`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> FV = VF = p

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### FdV=d in each degree

**Node:** CrystallineCohomology:CR.4/verschiebung-FdV. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.verschiebung_FdV`. All implementation status remains unchecked.

FdV=d in each degree. The declaration is the existing API item, promoted once for explicit dependency use.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use the existing defining data or the cancellation proof in Proposition2.2.4, as specified in the parent node. This is a graph promotion of the same declaration.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-identities`, `CrystallineCohomology:CR.4/verschiebung-FV`, `CrystallineCohomology:CR.4/dieudonne-dF`, `CrystallineCohomology:CR.4/saturated-p-injective`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition2.1.1, Definition2.2.1 and Proposition2.2.4, arXivv3 pp.13–14. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> FV = VF = p

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Morphisms of Dieudonné complexes

**Node:** CrystallineCohomology:CR.4/dieudonne-morphism. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.DieudonneHom`. All implementation status remains unchecked.

For two existing Dieudonné complexes M,N with the same p, a morphism is an ordinary cochain map f:M→N satisfying f_n F_M=F_N f_n in every integer degree. The cochain map is Mathlib’s HomologicalComplex.Hom; only its Frobenius compatibility is added.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Bundle the ordinary cochain map and the displayed compatibility equation.
2. Use ordinary identity/composition for the API; Frobenius compatibility follows by substitution. Extensionality is HomologicalComplex.hom_ext plus proof irrelevance.

Direct prerequisites: `CrystallineCohomology:CR.4/dieudonne-complex`, `mathlib:HomologicalComplex.Hom`, `mathlib:HomologicalComplex.hom_ext`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Definition2.1.1, arXivv3 p.13. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> dF = pFd

API outline:

- `TauCeti.Crystalline.DieudonneHom.id` (constructor): The identity cochain map with its Frobenius compatibility.
- `TauCeti.Crystalline.DieudonneHom.comp` (functoriality): For f:M→N and g:N→P, g.comp(f) has degree map g_n∘f_n.
- `TauCeti.Crystalline.DieudonneHom.ext` (extensionality): Two morphisms equal on all elements in every degree are equal.
- `TauCeti.Crystalline.DieudonneHom.id_apply` (simp): The identity evaluates to x in each degree.
- `TauCeti.Crystalline.DieudonneHom.comp_apply` (simp): Composition evaluates to g_n(f_n(x)).

Unit tests:

- `TauCeti.Crystalline.hom_test_zero` (degenerate): The zero cochain map is a Dieudonné morphism.
- `TauCeti.Crystalline.hom_test_scalar` (computation): Multiplication by any integer a is a Dieudonné endomorphism.
- `TauCeti.Crystalline.hom_test_composition` (compatibility): Composition with the identity of the target returns the original morphism.
- `TauCeti.Crystalline.hom_test_F_compatibility` (non-example): A morphism between degree-zero Z groups with F source identity and F target multiplication by2 has zero degree-zero map. Ordinary cochain maps alone would allow identity.

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Morphisms commute with Verschiebung

**Node:** CrystallineCohomology:CR.4/dieudonne-morphism-V. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.DieudonneHom.comm_V`. All implementation status remains unchecked.

A Dieudonné morphism f between saturated M,N commutes with V in every degree.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Apply F_N to both f(V_M x) and V_N(fx). Frobenius compatibility and FV=p identify both images with p f(x).
2. Cancel F_N using its promoted injectivity; no surjectivity of f is required.

Direct prerequisites: `CrystallineCohomology:CR.4/dieudonne-morphism`, `CrystallineCohomology:CR.4/verschiebung-FV`, `CrystallineCohomology:CR.4/saturated-F-injective`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### The Verschiebung filtration

**Node:** CrystallineCohomology:CR.4/verschiebung-filtration. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.vFiltration`. All implementation status remains unchecked.

Set N_r^n(M)=im(V_n^r)+im(d_(n−1) V_(n−1)^r), as the sum of two existing Z-submodules of M^n. The endomorphism exponent is composition. The zeroth level is all of M^n.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use LinearMap.range and the submodule supremum; no new quotient or complex carrier is defined at this step.
2. The second summand uses degree n−1, including at n=0. The finite-support convention in the source is ordinary algebraic image, without closure.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-identities`, `mathlib:LinearMap.range`, `mathlib:Submodule.mem_sup`, `mathlib:Module.End.pow_apply`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

API outline:

- `TauCeti.Crystalline.mem_vFiltration` (characterisation): x belongs to N_r^n iff x=V_n^r(a)+d V_(n−1)^r(b), for a in M^n and b in M^(n−1).
- `TauCeti.Crystalline.vFiltration_zero` (simp): N_0^n=M^n because V^0 is identity.
- `TauCeti.Crystalline.vFiltration_antitone` (structure): For r≤s, N_s^n is contained in N_r^n.
- `TauCeti.Crystalline.vFiltration_d` (compatibility): d(N_r^n) is contained in N_r^(n+1).

Unit tests:

- `TauCeti.Crystalline.filtration_test_zero` (degenerate): Zero belongs to N_7^n.
- `TauCeti.Crystalline.filtration_test_V_identity` (computation): If V_n is identity and the incoming differential is zero, N_3^n=M^n.
- `TauCeti.Crystalline.filtration_test_zero_d_F_identity` (compatibility): If the incoming differential is zero and F_n is identity, N_r^n=p^r M^n.
- `TauCeti.Crystalline.filtration_test_d_summand` (non-example): At p=2 there is a saturated M and an element of N_1^1 outside im(V_1); dV(x) in the explicit test model is such an element.

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Representatives in the Verschiebung filtration

**Node:** CrystallineCohomology:CR.4/verschiebung-filtration-membership. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.mem_vFiltration`. All implementation status remains unchecked.

x∈N_r^n iff x=V_n^r(a)+d V_(n−1)^r(b) for some a∈M^n and b∈M^(n−1).

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Unfold the two ranges and apply Submodule.mem_sup. Reverse the displayed sum equality if necessary.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration`, `mathlib:Submodule.mem_sup`, `mathlib:LinearMap.mem_range`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Zeroth Verschiebung filtration

**Node:** CrystallineCohomology:CR.4/verschiebung-filtration-zero. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.vFiltration_zero`. All implementation status remains unchecked.

N_0^n=M^n for every n.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. V^0 is identity, so the first range is top. This holds without any assumption on the incoming differential.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration`, `mathlib:Module.End.pow_apply`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Decreasing Verschiebung filtration

**Node:** CrystallineCohomology:CR.4/verschiebung-filtration-antitone. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.vFiltration_antitone`. All implementation status remains unchecked.

The sequence r↦N_r^n is antitone.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Write V^(r+1)=V^r∘V in both summands. This gives N_(r+1)⊆N_r, then iterate the inclusion for arbitrary r≤s.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `mathlib:Module.End.pow_apply`, `mathlib:LinearMap.range_comp_le_range`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Differential stability of the filtration

**Node:** CrystallineCohomology:CR.4/verschiebung-filtration-d. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.vFiltration_d`. All implementation status remains unchecked.

d maps N_r^n into N_r^(n+1).

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. For x=V^r a+dV^r b, dx=dV^r a because d²=0. This is exactly the second summand in degree n+1.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `mathlib:HomologicalComplex.d_comp_d`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Frobenius lowers the filtration

**Node:** CrystallineCohomology:CR.4/verschiebung-filtration-F. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.vFiltration_F`. All implementation status remains unchecked.

F_n(N_(r+1)^n)⊆N_r^n.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. On V^(r+1)a, FV=p gives p V^r a. On dV^(r+1)b, FdV=d gives dV^r b. Both lie in the required two summands.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/verschiebung-FV`, `CrystallineCohomology:CR.4/verschiebung-FdV`, `mathlib:Module.End.pow_apply`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Verschiebung raises the filtration

**Node:** CrystallineCohomology:CR.4/verschiebung-filtration-V. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.vFiltration_V`. All implementation status remains unchecked.

V_n(N_r^n)⊆N_(r+1)^n.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. The first summand maps to V^(r+1)a. The second maps to p dV^(r+1)b by Vd=p dV.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/verschiebung-d`, `mathlib:Module.End.pow_apply`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Finite Verschiebung quotient complex

**Node:** CrystallineCohomology:CR.4/finite-witt-quotient. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.Wcomplex`. All implementation status remains unchecked.

For saturated M define W_r(M)^n=M^n/N_r^n using the existing submodule quotient, with differential [x]↦[dx]. Assemble it using CochainComplex.of in every integer degree. The notation W_r here is a quotient of a Dieudonné complex, not the pre-existing ring of truncated Witt vectors.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. The filtration stability supplies Submodule.mapQ for the differential. Apply d²=0 to representatives to prove the quotient differential squares to zero.
2. Use the actual quotient as each degree object. Wmk is the canonical linear projection with that codomain; its function is Submodule.Quotient.mk. No proposition-valued placeholder changes the carrier.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-d`, `mathlib:CochainComplex.of`, `mathlib:ModuleCat.ofHom`, `mathlib:Submodule.mapQ`, `mathlib:Submodule.Quotient.mk`, `mathlib:HomologicalComplex.d_comp_d`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

API outline:

- `TauCeti.Crystalline.Wmk` (constructor): The canonical linear quotient projection M^n→W_r(M)^n.
- `TauCeti.Crystalline.Wmk_surjective` (characterisation): Every class in W_r(M)^n is represented by an element of M^n.
- `TauCeti.Crystalline.Wmk_eq_zero` (characterisation): The class of x is zero iff x∈N_r^n.
- `TauCeti.Crystalline.Wcomplex_d_mk` (simp): The quotient differential sends the class of x to the class of dx.

Unit tests:

- `TauCeti.Crystalline.Wcomplex_test_zero_level` (degenerate): Every group of W_0(M) is zero.
- `TauCeti.Crystalline.Wcomplex_test_zero_complex` (degenerate): If M is degreewise zero, so is every W_r(M).
- `TauCeti.Crystalline.Wcomplex_test_V_surjective` (non-example): If V is surjective in every degree, all W_r(M) vanish, including rational degree-zero M with F identity.
- `TauCeti.Crystalline.Wcomplex_test_Z8` (computation): For M^0 identified with Z, zero incoming differential and F_0 identity at p=2, W_3(M)^0 is Z/8 as a Z-module.

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Surjectivity of the quotient projection

**Node:** CrystallineCohomology:CR.4/finite-witt-representatives. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Wmk_surjective`. All implementation status remains unchecked.

The degreewise map Wmk:M^n→W_r(M)^n is surjective.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Reuse the baseline quotient representative theorem for the exact degree carrier.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.mkQ_surjective`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Zero classes in finite quotients

**Node:** CrystallineCohomology:CR.4/finite-witt-zero-class. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Wmk_eq_zero`. All implementation status remains unchecked.

Wmk(x)=0 iff x∈N_r^n.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Apply the existing submodule quotient zero criterion, with the explicit filtration as denominator.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.Quotient.mk_eq_zero`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Differential of a quotient representative

**Node:** CrystallineCohomology:CR.4/finite-witt-differential. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Wcomplex_d_mk`. All implementation status remains unchecked.

d(Wmk(x))=Wmk(dx) in W_r(M)^(n+1).

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Unfold CochainComplex.of at adjacent indices and use mapQ_apply.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ_apply`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Projection to the finite quotient

**Node:** CrystallineCohomology:CR.4/finite-witt-projection. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.Wprojection`. All implementation status remains unchecked.

The degreewise projections Wmk assemble into a cochain map M→W_r(M).

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use Wmk as the components and the promoted differential equation for the cochain-map axiom.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-quotient`, `CrystallineCohomology:CR.4/finite-witt-differential`, `mathlib:CochainComplex.ofHom`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-zero-class`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

API outline:

- `TauCeti.Crystalline.Wprojection_apply` (simp): Its degree-n component sends x to Wmk(x).
- `TauCeti.Crystalline.Wprojection_surjective` (characterisation): Every component is surjective.
- `TauCeti.Crystalline.Wprojection_kernel` (characterisation): The degree-n kernel is N_r^n.

Unit tests:

- `TauCeti.Crystalline.projection_test_level_zero` (degenerate): The projection to W_0 is zero.
- `TauCeti.Crystalline.projection_test_V_power` (computation): The projection kills V^r(x).
- `TauCeti.Crystalline.projection_test_dV_power` (non-example): The projection also kills dV^r(y), even when this element is not in im(V^r).

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Restriction between finite quotients

**Node:** CrystallineCohomology:CR.4/finite-witt-restriction. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.Wrestriction`. All implementation status remains unchecked.

The inclusion N_(r+1)⊆N_r induces a cochain map R_r:W_(r+1)(M)→W_r(M), represented by the identity on M.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Apply mapQ to identity degreewise and use d-stability; compatibility with differentials is checked on representatives.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-antitone`, `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ`, `mathlib:CochainComplex.ofHom`, `CrystallineCohomology:CR.4/finite-witt-representatives`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

API outline:

- `TauCeti.Crystalline.Wrestriction_mk` (simp): R_r([x]_(r+1))=[x]_r.
- `TauCeti.Crystalline.Wrestriction_surjective` (characterisation): R_r is surjective in each degree.
- `TauCeti.Crystalline.Wprojection_restriction` (compatibility): Projection to level r+1 followed by R_r equals projection to level r.

Unit tests:

- `TauCeti.Crystalline.restriction_test_zero` (degenerate): R_0 has zero target and sends every class to zero.
- `TauCeti.Crystalline.restriction_test_two_steps` (computation): R_r R_(r+1)([x]_(r+2))=[x]_r.
- `TauCeti.Crystalline.restriction_test_d` (compatibility): Restriction commutes with the quotient differential.

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Restriction on representatives

**Node:** CrystallineCohomology:CR.4/finite-witt-restriction-formula. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Wrestriction_mk`. All implementation status remains unchecked.

R_r([x]_(r+1))=[x]_r.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Use the defining identity lift and mapQ_apply.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-restriction`, `mathlib:Submodule.mapQ_apply`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Frobenius on finite quotients

**Node:** CrystallineCohomology:CR.4/finite-witt-F. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.WF`. All implementation status remains unchecked.

The map F induces Z-linear degree maps F_r:W_(r+1)(M)^n→W_r(M)^n sending [x] to [Fx].

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Apply mapQ to F using the promoted lowering inclusion. The relation with d follows on representatives from dF=pFd. Restriction compatibility follows because both routes represent Fx.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-F`, `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ`, `CrystallineCohomology:CR.4/dieudonne-dF`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-differential`, `CrystallineCohomology:CR.4/finite-witt-restriction-formula`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

API outline:

- `TauCeti.Crystalline.WF_mk` (simp): F_r([x]_(r+1))=[Fx]_r.
- `TauCeti.Crystalline.WF_d` (relation): d F_r=p F_r d, with the degree and level indices shown.
- `TauCeti.Crystalline.WF_restriction` (compatibility): R_r F_(r+1)=F_r R_(r+1) from level r+2 to r.

Unit tests:

- `TauCeti.Crystalline.WF_test_zero_level` (degenerate): F_0 has zero target.
- `TauCeti.Crystalline.WF_test_identity` (compatibility): If F is identity on M, F_r equals R_r.
- `TauCeti.Crystalline.WF_test_non_chain` (non-example): At p=2 there is a saturated M for which F_1:W_2→W_1 does not commute with d. The finite-support model described in the reader supplies a witness.

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Frobenius on representatives

**Node:** CrystallineCohomology:CR.4/finite-witt-F-formula. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.WF_mk`. All implementation status remains unchecked.

F_r([x]_(r+1))=[Fx]_r.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Apply mapQ_apply to the defining degree map.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-F`, `mathlib:Submodule.mapQ_apply`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Verschiebung on finite quotients

**Node:** CrystallineCohomology:CR.4/finite-witt-V. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.WV`. All implementation status remains unchecked.

The map V induces Z-linear degree maps V_r:W_r(M)^n→W_(r+1)(M)^n sending [x] to [Vx].

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Apply mapQ to V using the promoted raising inclusion. Vd=p dV gives the differential equation on quotient representatives.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-V`, `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:Submodule.mapQ`, `CrystallineCohomology:CR.4/verschiebung-d`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-differential`, `CrystallineCohomology:CR.4/finite-witt-restriction-formula`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

API outline:

- `TauCeti.Crystalline.WV_mk` (simp): V_r([x]_r)=[Vx]_(r+1).
- `TauCeti.Crystalline.WV_d` (relation): V_r d=p d V_r, with the appropriate consecutive cochain degrees.
- `TauCeti.Crystalline.WV_restriction` (compatibility): R_(r+1) V_(r+1)=V_r R_r from level r+1 to itself.

Unit tests:

- `TauCeti.Crystalline.WV_test_zero_level` (degenerate): V_0 has zero source.
- `TauCeti.Crystalline.WV_test_identity_frobenius` (computation): If F is identity, V_r([x])=p[x] at level r+1.
- `TauCeti.Crystalline.WV_test_non_chain` (non-example): At p=2 there is a saturated M for which V_1:W_1→W_2 does not commute with d; the reader gives a witness.

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Verschiebung on representatives

**Node:** CrystallineCohomology:CR.4/finite-witt-V-formula. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.WV_mk`. All implementation status remains unchecked.

V_r([x]_r)=[Vx]_(r+1).

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Apply mapQ_apply to the defining degree map.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-V`, `mathlib:Submodule.mapQ_apply`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Construction2.5.1 and Remarks2.5.2–3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Finite Frobenius after Verschiebung

**Node:** CrystallineCohomology:CR.4/finite-witt-FV. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.WFV`. All implementation status remains unchecked.

F_r V_r=p on W_r(M)^n, including r=0.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Lift a class to M, use FV=p there, and apply the quotient map.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-F-formula`, `CrystallineCohomology:CR.4/finite-witt-V-formula`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/verschiebung-FV`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Remark2.5.2 and Definition2.6.1(5), arXivv3 pp.19,21. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> FV = VF = p

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Finite Verschiebung after Frobenius

**Node:** CrystallineCohomology:CR.4/finite-witt-VF. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.WVF`. All implementation status remains unchecked.

V_r F_r=p on W_(r+1)(M)^n. In particular p annihilates W_1(M).

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Lift a class to M and use VF=p. For r=0 the intermediate group W_0 is zero.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-F-formula`, `CrystallineCohomology:CR.4/finite-witt-V-formula`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/verschiebung-VF`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Remark2.5.2 and Definition2.6.1(5), arXivv3 pp.19,21. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> FV = VF = p

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Frobenius lifting after a divided differential

**Node:** CrystallineCohomology:CR.4/verschiebung-divisibility-lift. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.dV_pow_p_divisible`. All implementation status remains unchecked.

If d(V^r x) is divisible by p in M^(n+1), then x belongs to im(F_n).

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Iterating FdV=d gives dx=F^r d(V^r x). A p-divisible input remains p-divisible under the Z-linear F^r.
2. Apply the promoted characterization of the image of F.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-FdV`, `CrystallineCohomology:CR.4/saturated-F-range`, `mathlib:Module.End.pow_apply`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Lemma2.6.3 with proof, arXivv3 p.21; published p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> dx = F^r d(V^r x)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Multiplication by p raises the filtration

**Node:** CrystallineCohomology:CR.4/verschiebung-filtration-p-shift. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.vFiltration_p_shift`. All implementation status remains unchecked.

For x∈N_r^n, px∈N_(r+1)^n.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. FV=VF=p implies pV^r a=V^(r+1)Fa. Z-linearity gives p dV^r b=dV^(r+1)Fb.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/verschiebung-VF`, `CrystallineCohomology:CR.4/verschiebung-FV`, `mathlib:Module.End.pow_apply`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Proof of Proposition2.6.2, axiom(7), arXivv3 p.22; published p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> pV^r = V^{r+1}F

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Cancellation across filtration levels

**Node:** CrystallineCohomology:CR.4/verschiebung-filtration-p-cancellation. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.vFiltration_p_cancel`. All implementation status remains unchecked.

If px∈N_(r+1)^n, then x∈N_r^n.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Write px=V^(r+1)a+dV^(r+1)b. Differentiating gives dV^(r+1)a=p dx; the lifting lemma writes a=Fa′.
2. Substitute and use V^(r+1)F=pV^r. The residual dV^(r+1)b is p-divisible, so b=Fb′ by the same lemma.
3. The resulting equality is px=p(V^r a′+dV^r b′). Cancel p in M^n.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/verschiebung-divisibility-lift`, `CrystallineCohomology:CR.4/verschiebung-VF`, `CrystallineCohomology:CR.4/verschiebung-FV`, `CrystallineCohomology:CR.4/saturated-p-injective`, `mathlib:HomologicalComplex.d_comp_d`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Lemma2.6.4 with proof, arXivv3 p.22; published p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> px = pV^r a + dV^r(pb)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Restriction kernel and p-torsion

**Node:** CrystallineCohomology:CR.4/finite-witt-restriction-kernel. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.Wrestriction_kernel`. All implementation status remains unchecked.

For x∈W_(r+1)(M)^n, R_r(x)=0 iff px=0. This is the kernel of restriction, not the kernel of Frobenius.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Represent x by a∈M^n. R_r(x)=0 means a∈N_r; px=0 means pa∈N_(r+1).
2. Use p-shift and p-cancellation for the two implications.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-zero-class`, `CrystallineCohomology:CR.4/finite-witt-restriction-formula`, `CrystallineCohomology:CR.4/verschiebung-filtration-p-shift`, `CrystallineCohomology:CR.4/verschiebung-filtration-p-cancellation`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Proposition2.6.2, verification of Definition2.6.1(7), arXivv3 p.22; published p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> ker(R) = X[p]

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Finite Frobenius lifting

**Node:** CrystallineCohomology:CR.4/finite-witt-F-lifting. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.WF_lift`. All implementation status remains unchecked.

If x∈W_r(M)^n has d x divisible by p in W_r(M)^(n+1), then x has a preimage under F_r:W_(r+1)(M)^n→W_r(M)^n.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. For r=0 take the zero preimage, since W_0=0. For r≥1 lift the equation to dx=py+V^r a+dV^r b.
2. Differentiate: dV^r a is p-divisible, hence a=Fa′. Then d(x−V^r b)=p(y+V^(r−1)a′).
3. Saturation lifts x−V^r b to Fz. Modulo N_r it has the same class as x, so the class of z at level r+1 is the required preimage.

Direct prerequisites: `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-zero-class`, `CrystallineCohomology:CR.4/finite-witt-differential`, `CrystallineCohomology:CR.4/finite-witt-F-formula`, `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/verschiebung-divisibility-lift`, `CrystallineCohomology:CR.4/verschiebung-VF`, `CrystallineCohomology:CR.4/saturated-F-range`, `mathlib:HomologicalComplex.d_comp_d`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Proposition2.6.2, verification of Definition2.6.1(6), arXivv3 p.22; published p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> d(x-V^r b)=p(y+V^{r-1}a)

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Annihilation at finite level

**Node:** CrystallineCohomology:CR.4/finite-witt-p-power. **Kind:** lemma.

**Declaration:** `TauCeti.Crystalline.Wcomplex_p_pow`. All implementation status remains unchecked.

Multiplication by p^r annihilates every group W_r(M)^n. No torsionfreeness of the finite quotient is asserted.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Start with every a∈N_0 and apply p-shift r times. Then p^r a∈N_r, so its class is zero.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-filtration-zero`, `CrystallineCohomology:CR.4/verschiebung-filtration-p-shift`, `CrystallineCohomology:CR.4/finite-witt-representatives`, `CrystallineCohomology:CR.4/finite-witt-zero-class`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Consequence of Proposition2.6.2, axiom(7), arXivv3 p.22. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> pV^r = V^{r+1}F

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Functorial finite quotients

**Node:** CrystallineCohomology:CR.4/finite-witt-map. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.DieudonneHom.Wmap`. All implementation status remains unchecked.

A Dieudonné morphism f between saturated M,N induces a cochain map W_r(f):W_r(M)→W_r(N), represented by f in every degree.

Hypotheses and conventions: M is an existing saturated Dieudonné complex when V is used; n is any integer and r any nonnegative integer. The source fixes a prime p. The finite algebraic signatures allow any natural p for which the stated saturation hypotheses hold; they use only those explicit hypotheses.

Uses:

- BLM2.5–2.7; CrystallineCohomology:CR.4/verschiebung-completion-tower: Supplies the actual finite quotient and operator interfaces used by the inverse-limit completion and its saturation proof.

Proof outline:

1. Commutation with V gives fV^r=V^r f; the existing cochain-map identity gives f dV^r=dV^r f. Hence f maps each N_r(M) into N_r(N).
2. Use mapQ and the ordinary cochain-map constructor. Identity/composition and compatibility with R,F,V are checked on representatives.

Direct prerequisites: `CrystallineCohomology:CR.4/dieudonne-morphism`, `CrystallineCohomology:CR.4/dieudonne-morphism-V`, `CrystallineCohomology:CR.4/verschiebung-filtration-membership`, `CrystallineCohomology:CR.4/finite-witt-quotient`, `mathlib:HomologicalComplex.Hom.comm`, `mathlib:Submodule.mapQ`, `mathlib:Submodule.mapQ_comp`, `mathlib:Submodule.mapQ_id`, `mathlib:CochainComplex.ofHom`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), Remark2.5.3, arXivv3 pp.19–20. The named finite construction or proof step is isolated here from the source passage; generic quotient and cochain infrastructure is imported from the pin.

Literal source excerpt:

> im(V^r) + im(dV^r)

API outline:

- `TauCeti.Crystalline.DieudonneHom.Wmap_mk` (simp): W_r(f)([x])=[f(x)].
- `TauCeti.Crystalline.DieudonneHom.Wmap_restriction` (compatibility): W_(r+1)(f) followed by R_N equals R_M followed by W_r(f).
- `TauCeti.Crystalline.DieudonneHom.Wmap_F` (compatibility): The induced degree maps commute with F_r at the two consecutive quotient levels.
- `TauCeti.Crystalline.DieudonneHom.Wmap_V` (compatibility): The induced degree maps commute with V_r at the two consecutive quotient levels.
- `TauCeti.Crystalline.DieudonneHom.Wmap_id` (functoriality): W_r of the identity is identity.
- `TauCeti.Crystalline.DieudonneHom.Wmap_comp` (functoriality): W_r(g∘f)=W_r(g)∘W_r(f).

Unit tests:

- `TauCeti.Crystalline.Wmap_test_identity` (computation): The induced identity map fixes each quotient class.
- `TauCeti.Crystalline.Wmap_test_zero` (degenerate): A morphism with zero underlying cochain map induces the zero map.
- `TauCeti.Crystalline.Wmap_test_level_zero` (degenerate): Every induced map at level zero is zero.

Acceptance:

- Check the stated formula on quotient representatives, including r=0 and negative cochain degrees.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Strict completion and its adjunction

**Node:** CrystallineCohomology:CR.4/strict-completion. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.strictCompletion`. All implementation status remains unchecked.

For a saturated Dieudonné complex M, W(M)=lim_r W_r(M) is saturated, W_r(W(M))≅W_r(M), and the canonical map M→W(M) is universal for maps to strict complexes. Strict means precisely that this canonical map is an isomorphism; W is an idempotent reflector. W(M) is derived p-complete. For a Cartier-type termwise p-torsionfree complex, M→W(Sat M) exhibits the latter as its derived p-completion, and is a quasi-isomorphism if M is already p-adically complete.

Hypotheses and conventions: Use the actual finite quotients and compatible restriction tower; p prime. The last sentence requires the Cartier-type hypothesis, not an arbitrary M.

Proof outline:

1. Identify W_r of the limit by recursive lifting and the finite restriction-kernel/F-lifting lemmas.
2. Construct F and V on compatible sequences, prove p-torsionfreeness and the saturated image criterion using the finite-level lifts.
3. Factor maps to a strict target through its finite quotients and take limits; finite-quotient identification proves idempotence.
4. Use the BLM p-adic tower comparison and Cartier mod-p criterion to identify the derived completion, without claiming V-adic and p-adic topologies agree termwise in all degrees.

Direct prerequisites: `CrystallineCohomology:CR.4/verschiebung-completion-tower`, `CrystallineCohomology:CR.4/finite-witt-restriction-kernel`, `CrystallineCohomology:CR.4/finite-witt-F-lifting`, `CrystallineCohomology:CR.4/cartier-saturation-mod-p`, `DerivedDeRhamCohomology:DD.1`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), §§2.6–2.8, Propositions2.6.5,2.7.5,2.7.7,2.8.1 and Corollary2.8.2. The exact finite-quotient and derived-completion proof route supplies the reflector.

Literal source excerpt:

> strict

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Dieudonné algebras and multiplicative quotients

**Node:** CrystallineCohomology:CR.4/dieudonne-algebra. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.DieudonneAlgebra`. All implementation status remains unchecked.

A Dieudonné algebra is a nonnegatively graded commutative differential graded Z-algebra A with x²=0 for every homogeneous odd-degree x (also at p=2), a multiplicative unital graded Frobenius F, dF=pFd, and F(a)≡a^p modulo p in degree0. Saturated and strict refer to its underlying Dieudonné complex. On a saturated algebra the derived V satisfies x·V(y)=V(F(x)·y); N_r=im V^r+im dV^r is a differential graded ideal, so W_r(A), W(A), and Sat(A) inherit their multiplicative structures.

Hypotheses and conventions: Nonnegative grading and the odd-square axiom are part of the carrier. F is multiplicative but is generally not a cochain map.

Uses:

- BLM §§3.1,3.3–3.6; CR.4/saturated-de-rham-witt: Adds graded multiplication and the strong odd-square-zero convention to Dieudonné complexes. Projection and quotient-ideal APIs make the finite Verschiebung groups into rings and DGAs.

Proof outline:

1. Build the algebra over the existing graded ring, cochain and module carriers; enforce exterior signs and the odd-square condition explicitly.
2. For saturation extend multiplication to η by degree scaling, then to the filtered colimit after killing p-power torsion.
3. Cancel F in the projection formula using saturation. Leibniz and that formula prove N_r ideal stability, so ordinary ring quotients and the compatible inverse limit carry the products.

Direct prerequisites: `CrystallineCohomology:CR.4/dieudonne-complex`, `CrystallineCohomology:CR.4/saturation-colimit`, `CrystallineCohomology:CR.4/verschiebung-filtration`, `CrystallineCohomology:CR.4/strict-completion`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), §3.1 and §§3.3–3.6, Definitions3.1.1–2 and multiplicative completion. All extra algebra axioms and the projection formula are required.

Literal source excerpt:

> graded-commutative

API outline:

- `TauCeti.Crystalline.DieudonneAlgebra.odd_sq` (relation): An odd homogeneous element has square0, even for p=2.
- `TauCeti.Crystalline.DieudonneAlgebra.projection` (relation): x·V(y)=V(F(x)·y) on a saturated algebra.
- `TauCeti.Crystalline.DieudonneAlgebra.W_mul` (compatibility): Finite-quotient projections and restriction preserve products, d and units.

Unit tests:

- `TauCeti.Crystalline.test_DA_Zp` (degenerate): Z_p in degree0 with F=id is strict, with V multiplication by p.
- `TauCeti.Crystalline.test_DA_p2_exterior` (non-example): A merely graded-commutative algebra with a nonzero odd square in characteristic2 is excluded.
- `TauCeti.Crystalline.test_DA_Fd` (computation): For a smooth p-torsionfree Frobenius lift a↦a^p, divided Frobenius on da is a^(p−1)da and dF(a)=pF(da).

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Universal saturated de Rham–Witt complex

**Node:** CrystallineCohomology:CR.4/saturated-de-rham-witt. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.saturatedDRW`. All implementation status remains unchecked.

For an F_p-algebra R, WsatΩ_R is the strict Dieudonné algebra initial with a ring map R→A⁰/VA⁰. Thus Hom_DA(WsatΩ_R,A)≅Hom_Fp(R,A⁰/VA⁰). Construct it as W(Sat Ω^*_(W(R_red))) using the existing Witt ring and ordinary absolute forms with divided Frobenius, not a newly defined Witt carrier. Writing S_R=WsatΩ_R⁰/VWsatΩ_R⁰, its degree-zero ring is W(S_R), and WsatΩ_R≅WsatΩ_(R_red). S_R is reduced; R→S_R is proved an isomorphism only in the regular comparison scope. No claim equates it with classical forms on every singular R.

Hypotheses and conventions: R any commutative F_p-algebra; ordinary differential algebra supplied by DD.0. W(R_red) is p-torsionfree; quotient A⁰/VA⁰ of a strict algebra is reduced.

Uses:

- BLM §§4.1–4.4; CR.4/classical-regular-comparison: Represents algebra maps into the residue of strict Dieudonné algebras; initiality, Teichmüller lifts and finite quotients connect the saturated object to classical Witt forms without imposing W(R_red) in degree zero for arbitrary singular R.

Proof outline:

1. For a strict Dieudonné algebra identify A⁰ with W(A⁰/VA⁰) by its unique Witt lift and prove reducedness using Frobenius injectivity.
2. Build the divided-Frobenius ordinary forms on the p-torsionfree Witt lift, then apply saturation and strict completion.
3. Compose the three universal properties; every map from R factors through R_red. This proves existence, functoriality, and nil-invariance.

Direct prerequisites: `CrystallineCohomology:CR.4/dieudonne-algebra`, `CrystallineCohomology:CR.4/strict-completion`, `AInfCohomology:AI.0`, `DerivedDeRhamCohomology:DD.0`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), §4.1, Definition4.1.1, Proposition4.1.4 and Corollary4.1.5; Proposition3.6.2 degree0. The reduced Witt lift and all three adjunctions are part of the construction.

Literal source excerpt:

> reduced

API outline:

- `TauCeti.Crystalline.satDRW_lift` (universal-property): A ring map R→A⁰/VA⁰ extends uniquely to a strict Dieudonné algebra map.
- `TauCeti.Crystalline.satDRW_degree0` (equivalence): WsatΩ_R⁰≅W(S_R), S_R=WsatΩ_R⁰/VWsatΩ_R⁰; for regular Noetherian R the comparison identifies S_R with R.
- `TauCeti.Crystalline.satDRW_map` (functoriality): Ring maps induce maps preserving d,F,V and all finite quotients.

Unit tests:

- `TauCeti.Crystalline.test_satDRW_perfect` (computation): For perfect k, WsatΩ_k=W(k) in degree0 with higher forms0.
- `TauCeti.Crystalline.test_satDRW_polynomial` (computation): The polynomial generator has nonzero d[t] and F(d[t])=[t]^(p−1)d[t].
- `TauCeti.Crystalline.test_satDRW_dual_numbers` (non-example): For R=F_p[ε]/ε², saturation loses ε and equals WsatΩ_Fp, whereas classical degree0 is W(R) and still sees ε.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration, API entries and tests have typed suggested forms.

### Relative Frobenius–Verschiebung procomplexes

**Node:** CrystallineCohomology:CR.4/relative-witt-complex. **Kind:** definition.

**Declaration:** `TauCeti.Crystalline.RelativeWittComplex`. All implementation status remains unchecked.

For a Z_(p)-algebra map A→R, a relative F–V procomplex is a restriction tower P_r of differential graded W_r(R)/W_r(A)-algebras with compatible additive F:P_(r+1)→P_r and V:P_r→P_(r+1), and degree-zero structural Witt maps compatible with F,V. F is a graded ring map semilinear for Witt F. The defining relations are FV=p, FdV=d, Fd[x]=[x]^(p−1)d[x], and V(x·F(y))=V(x)·y. Consequently dF=pFd, Vd=pdV and VF=V(1)·, which is not generally p· over a base with nonzero p. Restriction commutes with all operators.

Hypotheses and conventions: Use the existing truncated p-typical Witt rings and their maps. Each P_r is a PD differential graded algebra for the canonical powers on VW_(r−1)(R); odd squares vanish.

Uses:

- Langer–Zink §§1.3–1.5; BMS1 §10.1; CR.4/relative-de-rham-witt: Specifies the actual finite Witt coefficient rings and the R,F,V identities, especially FdV=d and VF=V(1), so the initial relative complex has the correct base variance.

Proof outline:

1. Import the canonical PD structure on the Witt Verschiebung ideal from AI.0, then quotient ordinary forms by its PD-derivation relations.
2. Encode all length changes explicitly: each composite starts and ends at its displayed r.
3. Derive the listed consequences from the projection and Teichmüller formulas, retaining V(1) instead of substituting p outside characteristic p.

Direct prerequisites: `CrystallineCohomology:CR.2/pd-differentials`, `AInfCohomology:AI.0`, `DerivedDeRhamCohomology:DD.0`.

Source: [Andreas Langer and Thomas Zink, De Rham–Witt cohomology for a proper and smooth morphism](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §§1.1–1.2, Definition1.4 and(1.15)–(1.21), pp.17–19. The convention is the July2003 manuscript; FdV=d is taken from Definition1.4, correcting the degree mismatch in(1.27).

Literal source excerpt:

> F − V procomplex

API outline:

- `TauCeti.Crystalline.RelativeWittComplex.FdV` (relation): F_r(d(V_r x))=dx with the correct form degree.
- `TauCeti.Crystalline.RelativeWittComplex.VF` (relation): V_r(F_r y)=V_r(1)·y; p·y follows only under the extra characteristic-p identity.
- `TauCeti.Crystalline.RelativeWittComplex.dlog` (simp): For a unit u, dlog[u]=[u]⁻¹d[u] is closed and F(dlog[u])=dlog[u].

Unit tests:

- `TauCeti.Crystalline.test_relativeWitt_length1` (computation): P₁ for the initial object is Ω^*_(R/A).
- `TauCeti.Crystalline.test_relativeWitt_units` (computation): On A[t,t⁻¹], dlog[t] is a closed degree-one form fixed by graded F.
- `TauCeti.Crystalline.test_relativeWitt_V1` (non-example): Over A=Z/p², the first Witt coordinate of V(1) in W₂(A) is0 whereas that of p is nonzero; VF must not be replaced by p.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

The finite F–V pro-DGA and coefficient rings are typed. The length-one test checks degree zero; its higher Ω-DGA comparison requires DD.0. The unit-symbol test checks closedness and F-invariance for every unit, but does not yet instantiate a Laurent torus or its nonzero form.

### Initial relative de Rham–Witt complex

**Node:** CrystallineCohomology:CR.4/relative-de-rham-witt. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.relativeDRW`. All implementation status remains unchecked.

For any Z_(p)-algebra map A→R, construct W_rΩ^*_(R/A) as the initial relative F–V procomplex. Its degree-zero ring is the existing W_r(R), its length-one complex is Ω^*_(R/A), and its differential is W_r(A)-linear. Start at r=1; quotient the PD differential forms of W_(r+1)(R) by all lifted degree-r relations and the V projection relations. The universal map from ordinary PD forms is surjective and supplies uniqueness.

Hypotheses and conventions: No smoothness is needed to construct the relative procomplex. The canonical Witt PD-ideal structure and ordinary differential algebra are imported.

Uses:

- Langer–Zink §2.5 Proposition2.17 and §3.1; BMS1 §10: Uses the initial F–V procomplex to construct relative forms over a Z_(p)-base, with length-one, degree-zero and torus tests supplying the contracts for étale descent and crystalline comparison.

Proof outline:

1. Use the source induction with all relations ξdη₁…dη_q=0 and their V/dV lifts.
2. F kills the relation ideal using FV=p and FdV=d; impose the projection formula and its differential to define V.
3. Every map to a target procomplex descends uniquely at each length. Identity/composition follow from initiality.

Direct prerequisites: `CrystallineCohomology:CR.4/relative-witt-complex`, `CrystallineCohomology:CR.2/pd-differentials`.

Source: [Andreas Langer and Thomas Zink, De Rham–Witt cohomology for a proper and smooth morphism](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §1.3, construction and Proposition1.6, pp.21–23. The full induction is read; the two occurrences of FdVω=ω in the manuscript must read dω.

Literal source excerpt:

> universal

API outline:

- `TauCeti.Crystalline.relativeDRW_lift` (universal-property): Every eligible relative F–V procomplex receives a unique compatible map.
- `TauCeti.Crystalline.relativeDRW_zero` (equivalence): W_rΩ⁰_(R/A)=W_r(R) and W₁Ω^*_(R/A)=Ω^*_(R/A).
- `TauCeti.Crystalline.relativeDRW_map` (functoriality): A commuting square of ring maps induces the specified restriction-compatible maps of relative procomplexes.

Unit tests:

- `TauCeti.Crystalline.test_relativeDRW_identity` (degenerate): For R=A all positive forms vanish and degree0 is W_r(A).
- `TauCeti.Crystalline.test_relativeDRW_torus` (computation): The torus has the displayed nonzero dlog[t] class with F fixed and d zero.
- `TauCeti.Crystalline.test_relativeDRW_nonsmooth` (non-example): Construction is defined for F_p[ε]/ε²; it does not assert the smooth crystalline comparison for this input.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

Initiality, actual morphisms, degree-zero ring identification and variance over a commuting base square are typed. The Ω-DGA length-one comparison, its map compatibility and explicit Laurent-torus basis test require DD.0 and the basic-form contracts.

Forms requiring their exact supplier input: `TauCeti.Crystalline.test_relativeDRW_torus`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Polynomial basic Witt differential expansion

**Node:** CrystallineCohomology:CR.4/witt-basic-differentials. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.basicWittExpansion`. All implementation status remains unchecked.

For S=A[T₁,…,T_d], A a Z_(p)-algebra, weights are k∈Z[1/p]≥0^d; order the support by increasing p-valuation, with a fixed tie order invariant under k↦p^a k. A partition is a sequence of intervals I₀,…,I_q with I₀ allowed empty and subsequent intervals nonempty. Put u(k)=max(0,−min_i v_p(k_i)) and t(I)=−min_(i∈I)v_p(k_i). The basic form e(ξ,k,P) uses V^u(I₀)(η[T]^(p^u(I₀)k_I₀)) in block0, dV^u(I)([T]^(p^u(I)k_I)) for nonintegral subsequent blocks, and F^(−t(I))d[T]^(p^t(I)k_I) for integral subsequent blocks, in order. If I₀ is empty, place η in the first dV factor for nonintegral k, and before the product for integral k; ξ=V^u(k)η. Every W_rΩ^q_(S/A) has a unique finite expansion in these forms, with u(k)<r and ξ∈V^u(k)W_(r−u(k))(A). Infinite forms use convergent coefficient families in the restriction topology.

Hypotheses and conventions: Polynomial variables, nonnegative weights, explicit support order and the three cases of LZ(2.15)–(2.17). This is an additive coefficient parametrization, not a free W_r(S)-module basis.

Proof outline:

1. Prove normal generation and d,F,V/product formulas by induction on form degree and support partitions.
2. For a p-torsionfree base use the ghost maps and ordinary weight-form independence; ghost injectivity has exactly that torsion hypothesis.
3. Present an arbitrary A as a quotient of a p-torsionfree ring and descend the stable coefficient ideal, as in LZ2.17. Thus existence and uniqueness hold for torsion bases without inverting ghosts.

Direct prerequisites: `CrystallineCohomology:CR.4/relative-de-rham-witt`, `AInfCohomology:AI.0`.

Source: [Andreas Langer and Thomas Zink, De Rham–Witt cohomology for a proper and smooth morphism](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §2.2,(2.15)–(2.17), Propositions2.5–6; §2.5, Proposition2.17 and proof, pp.55–57. Both the torsionfree ghost argument and the subsequent arbitrary-base quotient argument are retained.

Literal source excerpt:

> coefficients

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.basicWittExpansion`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Witt localization and étale descent

**Node:** CrystallineCohomology:CR.4/witt-localization-descent. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.wittEtaleDescent`. All implementation status remains unchecked.

For an étale R→S over A, the natural map W_r(S)⊗_(W_r(R))W_rΩ^*_(R/A)→W_rΩ^*_(S/A) is an isomorphism of differential graded algebras, with the uniquely extended derivation on the tensor product. BMS1§10.8 supplies this for every Z_(p)-base; the older LZ1.7 route assumes p nilpotent or F-finite. For saturated forms over F_p use BLM5.3.5. Finite localization inverts [s]; infinite saturated localization first inverts [s] and then takes strict completion. These formulas construct Zariski and étale sheaves and identify each finite form sheaf as quasi-coherent on the Witt scheme. The differential is not the naive1⊗d for an arbitrary étale tensor, though a sufficiently high Frobenius twist makes it linear at a fixed p-nilpotent length.

Hypotheses and conventions: Étale ring map; finite length r≥1. Do not infer an infinite ordinary localization is already strict.

Proof outline:

1. Use the AI.0 Witt étale/pushout theorem to extend the derivation and define the F/V tensor maps.
2. Apply initiality in both directions; the ordinary-form generating surjection proves inverse maps.
3. For saturated forms apply the V-adically étale lifting equivalence and finite-quotient localization.
4. Use faithfully flat module descent on each Witt scheme, then the inverse limit sheaf property; affine higher cohomology of each form sheaf vanishes in the source scopes.

Direct prerequisites: `CrystallineCohomology:CR.4/relative-de-rham-witt`, `CrystallineCohomology:CR.4/saturated-de-rham-witt`, `CrystallineCohomology:CR.4/strict-completion`, `AInfCohomology:AI.0`.

Source: [Andreas Langer and Thomas Zink, De Rham–Witt cohomology for a proper and smooth morphism](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §1.4, Propositions1.7–9 and the Frobenius-linear tensor remark. The older scope and tensor differential are stated explicitly.

Literal source excerpt:

> étale

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10, Proposition10.8 and proof. This removes the older base restriction.

Literal source excerpt:

> étale

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), §§5.1–5.3, Propositions5.1.5,5.2.4 and Corollary5.3.5. Localization is followed by completion for the infinite saturated theory; V-adically étale lifting proof is a source-audit gate.

Literal source excerpt:

> sheaf

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.wittEtaleDescent`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Witt differential quotients and completion topologies

**Node:** CrystallineCohomology:CR.4/witt-quotients-topologies. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.wittQuotientCompletion`. All implementation status remains unchecked.

For an ideal I⊂R, the kernel of W_rΩ^*_(R/A)→W_rΩ^*_((R/I)/A) is the differential graded ideal generated by W_r(I)=ker(W_r(R)→W_r(R/I)). For finitely generated I with generators Σ, the filtrations generated by {[a^s]:a∈Σ} and by the differential kernel for I^s are cofinal. On W_r(R), [p]^(2s)W_r(R)⊂p^sW_r(R), p^(rs)W_r(R)⊂W_r(pR)^s, W_r(pR)^(p^r s)⊂[p]^sW_r(R), so the three topologies are cofinal. For a finitely generated base ideal I⊂A, the procomplexes {W_rΩ^*_(R/A)⊗_(W_r(A))W_r(A)/[I^s]}_s and {W_rΩ^*_(R/I^sR)/(A/I^s)}_s are isomorphic; [I^s] is the ideal generated by Teichmüller lifts of elements of I^s. Their ordinary inverse limits agree. This does not assert arbitrary ordinary completion is derived completion.

Hypotheses and conventions: A a Z_(p)-algebra; r≥1; the cofinal ideal comparison uses finite generation. The last quotient notation uses the image of the Witt ideal, not an unmentioned map R→W_r(R).

Proof outline:

1. Use initiality to identify the quotient by the generated differential ideal with the quotient-ring procomplex.
2. Import the AI.0 finitely generated Witt-ideal inclusions; differentiation adds d(W_r(I)) and these generators must be retained.
3. Use [p]²∈pW_r(R), p^r∈W_r(pR), and the AI.0 inclusion to obtain the three displayed bounds and the cofinal inverse limits.

Direct prerequisites: `CrystallineCohomology:CR.4/relative-de-rham-witt`, `AInfCohomology:AI.0`.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10, Lemma10.3, Lemma10.9 and Corollary10.10, pp.80–83. The ideal exponents, differential ideal and finite-generation hypothesis are taken together.

Literal source excerpt:

> intertwined

Acceptance:

- For r=1, the quotient kernel is generated by I and dI in Ω^*_(R/A).
- The three explicit ideal inclusions give cofinality even with p-torsion.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.wittQuotientCompletion`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Continuous relative de Rham–Witt complex

**Node:** CrystallineCohomology:CR.4/continuous-relative-witt. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.continuousRelativeWitt`. All implementation status remains unchecked.

For every Z_(p)-algebra map A→R and finite r, define W_rΩ^(q,cont)_(R/A)=lim_s W_rΩ^q_((R/p^s)/(A/p^s))≅lim_s(W_rΩ^q_(R/A)/p^s). Use the induced differential and compatible R,F,V to make a continuous relative F–V procomplex. This is degreewise ordinary p-completion at fixed Witt length. Derived completion and passage r→∞ are separate comparisons, with the DD.1 bounded-torsion or perfectness hypotheses retained.

Hypotheses and conventions: The ideal of definition in this node is p, as in BMS1 Definition10.11. No p-nilpotence on A is assumed.

Uses:

- BMS1 §10.11 and introduction to §11; AInfCohomology:AI.4: Takes degreewise p-completion at fixed Witt length to supply the continuous coefficients used in the A_inf comparisons. Completion and infinite Witt-limit comparisons require their own hypotheses.

Proof outline:

1. Apply the quotient/topology comparison at each fixed r and take the compatible degreewise inverse limit.
2. Every structural operator is continuous for these cofinal topologies, so it acts on compatible sequences and retains its identities.
3. Compare to derived completion only via the imported ordinary-quotient criterion; the definition does not assert that arbitrary ordinary completion is exact.

Direct prerequisites: `CrystallineCohomology:CR.4/witt-quotients-topologies`, `CrystallineCohomology:CR.4/relative-witt-complex`, `DerivedDeRhamCohomology:DD.1/ordinary-quotient-completion`.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.3, Definition10.11, p.83. Both displayed inverse limits and the F–V structure are the definition.

Literal source excerpt:

> continuous de Rham

API outline:

- `TauCeti.Crystalline.continuousWitt_eval` (data): An element is a family of forms modulo p^s compatible under quotient restriction.
- `TauCeti.Crystalline.continuousWitt_map` (functoriality): A commuting square A→R, A′→R′ gives the induced compatible map on these p-adic limits.
- `TauCeti.Crystalline.continuousWitt_operators` (compatibility): R,F,V,d act coordinatewise and satisfy the finite-level identities.

Unit tests:

- `TauCeti.Crystalline.test_continuousWitt_p_nilpotent` (compatibility): If p^N=0 on A and R, the defining tower is eventually constant and recovers W_rΩ_(R/A).
- `TauCeti.Crystalline.test_continuousWitt_identity` (degenerate): For R=A the result has only degree0, the p-completion of W_r(A).
- `TauCeti.Crystalline.test_continuousWitt_r1` (computation): At r=1 it is the degreewise p-completed ordinary relative de Rham complex.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.continuousRelativeWitt`, `TauCeti.Crystalline.continuousWitt_eval`, `TauCeti.Crystalline.continuousWitt_map`, `TauCeti.Crystalline.continuousWitt_operators`, `TauCeti.Crystalline.test_continuousWitt_p_nilpotent`, `TauCeti.Crystalline.test_continuousWitt_identity`, `TauCeti.Crystalline.test_continuousWitt_r1`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Laurent Witt weights and the integral quasi-isomorphism

**Node:** CrystallineCohomology:CR.4/torus-integral-part. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.wittTorusIntegral`. All implementation status remains unchecked.

For S=A[T₁^±1,…,T_d^±1], the basic Witt expansion extends to all weights a∈p^(−r)Z^d, ordered by v_p(a_i), including v_p(0)=∞. Partition all coordinate indices into ordered blocks I₀,…,I_q, with I₀ possibly empty and the others nonempty. Nonintegral blocks use V and dV; integral nonzero blocks use F^v d of the corresponding divided-weight Teichmüller monomial; zero blocks use dlog of the product of their coordinates, as in the three cases of BMS1 10.12. The coefficient module for weight a is V^u(a)W_(r−u(a))(A), u(a)=max(−min_i v_p(a_i),0). The map τ:Ω^*_(W_r(A)[U^±1]/W_r(A))→W_rΩ^*_(S/A), U_i↦[T_i], is injective and a quasi-isomorphism. Its image is exactly the integral-weight subcomplex; the fractional-weight complement is acyclic. The image depends on these coordinates.

Hypotheses and conventions: A arbitrary Z_(p)-algebra; r≥1. Basic coefficients parametrize a direct sum over finite-length weights, not a free module over W_r(S).

Proof outline:

1. Localize the polynomial expansion at [T_i] and take its increasing union; this permits negative weights and introduces the zero-weight dlog blocks.
2. Identify the image of τ with the integral-weight terms by the ordinary Laurent monomial basis.
3. On each fractional weight use its first nonintegral block to give the differential contraction. This proves acyclicity and the quasi-isomorphism without assuming ghost injectivity for a torsion base.

Direct prerequisites: `CrystallineCohomology:CR.4/witt-basic-differentials`, `CrystallineCohomology:CR.4/witt-localization-descent`, `DerivedDeRhamCohomology:DD.0`.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.4, Cases1–3 and Theorems10.12–13, pp.83–85. The zero-weight dlog case and coordinate dependence are retained.

Literal source excerpt:

> integral part

Acceptance:

- For one variable, dlog[T] is an integral zero-weight form.
- Fractional weights are present as forms but contribute no cohomology to the complementary subcomplex.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.wittTorusIntegral`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Relative Witt forms over perfectoid bases

**Node:** CrystallineCohomology:CR.4/perfectoid-base-change. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.wittPerfectoidBaseChange`. All implementation status remains unchecked.

For a homomorphism A→A′ of integral perfectoid rings, a smooth A-algebra R, R′=R⊗_A A′, and r≥1, the W_r(A)-modules W_rΩ^q_(R/A) and W_r(A′) are Tor-independent in every degree q. The canonical map W_rΩ^*_(R/A)⊗_(W_r(A))W_r(A′)→W_rΩ^*_(R′/A′) is an isomorphism of differential graded algebras. The statement is finite-length and algebraic; a continuous or derived inverse-limit extension requires its own completion comparison.

Hypotheses and conventions: Perfectoid has the integral ring convention of BMS1§3, including its allowed characteristic-p cases. R is smooth; arbitrary singular algebras are excluded.

Proof outline:

1. Étale-locally write R as an étale algebra over a Laurent polynomial algebra.
2. Apply the weight coefficient expansion. AI.0 and Q0 supply the perfectoid coefficient Tor computation of BMS1 Lemma3.13 and Remark3.19 for each V^uW_(r−u)(A).
3. Use the AI.0 arbitrary-base Witt étale pushout to base change the étale chart, then descend and totalize the degreewise isomorphisms.

Direct prerequisites: `CrystallineCohomology:CR.4/torus-integral-part`, `CrystallineCohomology:CR.4/witt-localization-descent`, `AInfCohomology:AI.0`, `PerfectoidQuotients:Q0:integral-algebra`.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.5, Proposition10.14 and full proof, p.85. This is the precise perfectoid base-change input exported to AI.4.

Literal source excerpt:

> Tor-independent

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.wittPerfectoidBaseChange`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Classical and saturated de Rham–Witt comparison

**Node:** CrystallineCohomology:CR.4/classical-regular-comparison. **Kind:** comparison.

**Declaration:** `TauCeti.Crystalline.classicalSaturatedComparison`. All implementation status remains unchecked.

For R smooth over a perfect F_p-algebra, the initial classical relative de Rham–Witt complex agrees with the saturated complex, compatibly with d,F,V,Teichmüller and finite quotients. For a regular Noetherian F_p-algebra R the absolute classical/saturated comparison is also an isomorphism, using Popescu approximation and filtered-colimit compatibility at finite length. If R has a p-complete p-torsionfree smooth lift A with a Frobenius lift, the natural Ω^(cont)_(A)→WsatΩ_R is a quasi-isomorphism by the Cartier-type completion theorem. Its chosen-lift map is not claimed to be canonical without the derived comparison and lift-independence argument.

Hypotheses and conventions: The lift has its continuous ordinary forms; the generic Cartier isomorphism is imported from DD.3. Regular comparison is not asserted for every singular input.

Proof outline:

1. DD.3 smooth Cartier gives Cartier type. BLM3.3.6/3.3.8 identifies the saturation modulo p, then strict completion identifies the p-complete models.
2. Use the classical initiality and the strict-algebra universal property to compare the smooth models, and check the operators on generators.
3. Import Popescu from DD.3’s requested extension, commute the classical finite-length forms and saturation with the required filtered systems, and pass to strict limits for the regular case.

Direct prerequisites: `CrystallineCohomology:CR.4/saturated-de-rham-witt`, `CrystallineCohomology:CR.4/relative-de-rham-witt`, `CrystallineCohomology:CR.4/strict-completion`, `DerivedDeRhamCohomology:DD.3/smooth-cartier`, `DerivedDeRhamCohomology:DD.0`, `DerivedDeRhamCohomology:DD.3`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), §4.2, Theorem4.2.4 and Corollary4.2.5; §4.4 and §6.1 regular approximation. The comparison uses the imported smooth Cartier theorem and retains the regularity boundary.

Literal source excerpt:

> Cartier

Source: [Atsushi Shiho, On logarithmic Hodge–Witt cohomology of regular schemes](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf), §2 regular-to-smooth reduction in proofs through Corollary2.13. This supplies the exact general approximation need, not a duplicate proof of Popescu.

Literal source excerpt:

> Popescu

Acceptance:

- A perfect field has W(k) in degree0 and no positive forms.
- F_p[ε]/ε² violates the singular extension: its degree-zero classical Witt ring retains ε, while the saturated theory is nil-invariant.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.classicalSaturatedComparison`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Finite and infinite crystalline de Rham–Witt comparison

**Node:** CrystallineCohomology:CR.4/crystalline-comparison. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.crystallineWittComparison`. All implementation status remains unchecked.

Let A be a Z_(p)-algebra with p nilpotent, and X smooth over A. For each r≥1, Ru_*O_(X/W_r(A)),crys≃W_rΩ^*_(X/A) on X_Zar, where X→Spec W_r(A) uses the first Witt coordinate and the canonical base PD ideal. More generally a flat quasi-coherent crystal E has the model E_(W_r X)⊗_(W_rO_X)W_rΩ^*_(X/A), with its crystal-induced differential; flatness is essential in the LZ3.8 comparison. For X smooth over a perfect field k, the compatible tower gives Ru_*O_(X/W(k)),crys≃Rlim_r W_rΩ_X^*≃WΩ_X^*, and corresponding global RΓ comparisons. The last ordinary-limit identification uses surjective restriction degreewise and the bounded smooth dimension.

Hypotheses and conventions: p nilpotent on A for the relative crystalline comparison, but not for the relative complex itself. The W_rX evaluation and connection are induced by the actual crystal and its square-zero comparisons.

Proof outline:

1. On a polynomial chart use the canonical Witt lift and its PD-envelope map to the Witt complex. LZ3.1–3.2 constructs the comparison morphism and its independent product-chart gluing.
2. Compare on étale charts via the integral/fractional weight splitting; fractional summands are acyclic. The CR.2 envelope de Rham computation yields LZ3.5.
3. For flat E use LZ3.9 linearization of the Witt differential operators and its top-degree induction, then the flat coefficient Poincaré lemma of3.8.
4. Take the compatible restriction tower; use DD.1 and the BO corrected replacement when forming derived inverse limits, not a termwise ordinary reduction assumption.

Direct prerequisites: `CrystallineCohomology:CR.4/relative-de-rham-witt`, `CrystallineCohomology:CR.4/torus-integral-part`, `CrystallineCohomology:CR.4/witt-localization-descent`, `CrystallineCohomology:CR.4/classical-regular-comparison`, `CrystallineCohomology:CR.2/embedding-computation`, `CrystallineCohomology:CR.2/linearization`, `CrystallineCohomology:CR.2/crystalline-cohomology`, `DerivedDeRhamCohomology:DD.1`.

Source: [Andreas Langer and Thomas Zink, De Rham–Witt cohomology for a proper and smooth morphism](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §§3.1–3.3, Theorem3.5; §3.5, Theorem3.8 and Lemma3.9, pp.67–76,83–93. The comparison morphism, product independence and the full flat-coefficient proof were read.

Literal source excerpt:

> flat

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), §10.1, Theorem10.1.1 and deduction from10.1.2. This is a complementary construction; its subsequent proof interiors remain a source gate.

Literal source excerpt:

> crystalline

Source: [Pierre Berthelot and Arthur Ogus, Corrigendum to Appendix B of Notes on Crystalline Cohomology](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf), Both pages, corrected CorollariesB.9–B.10. The replacement distinguishes the derived comparison from an actual map to a nonsurjective original tower.

Literal source excerpt:

> surjective

Acceptance:

- For X=Spec k, the comparison is W_r(k) in degree0.
- For a smooth lift over Z/p^n, finite relative comparison has exactly the displayed nilpotent-base scope.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.crystallineWittComparison`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Graded and crystalline Frobenius conventions

**Node:** CrystallineCohomology:CR.4/degree-scaled-frobenius. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.wittCrystallineFrobenius`. All implementation status remains unchecked.

The graded Witt F is not a cochain endomorphism: dF=pFd. The degree-scaled φ^q=p^qF is a cochain endomorphism on the characteristic-p infinite Witt complex, and agrees with crystalline absolute Frobenius under the comparison. At finite length its source and target lengths are those of F:W_(r+1)Ω→W_rΩ. The relative version uses the actual base Frobenius twist and pullback map before degree scaling; no A-linear absolute map is imposed when Frobenius acts nontrivially on A.

Hypotheses and conventions: p prime; retain the base Frobenius semilinearity and finite-length shift. For q=0 the scaling is1.

Proof outline:

1. Multiply dF=pFd by p^q to check dφ^q=φ^(q+1)d.
2. On a chosen lift compare the exterior derivative of Frobenius with the divided Witt F, then use product-lift independence and the crystalline comparison.
3. Use LZ3.4’s twist diagram for the relative map rather than substituting an absolute endomorphism of coefficients.

Direct prerequisites: `CrystallineCohomology:CR.4/relative-witt-complex`, `CrystallineCohomology:CR.4/crystalline-comparison`, `CrystallineCohomology:CR.3/frobenius-map`.

Source: [Andreas Langer and Thomas Zink, De Rham–Witt cohomology for a proper and smooth morphism](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §3.4, Proposition3.6 and its twist diagram, pp.77–78. The map is p^qF, not the unscaled graded F.

Literal source excerpt:

> Frobenius

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1 before Lemma8.2. The classical infinite complex has the same degree-scaled convention.

Literal source excerpt:

> absolute Frobenius

Acceptance:

- For k[t], F(d[t])=[t]^(p−1)d[t] but φ(d[t])=p[t]^(p−1)d[t].
- For dlog[t], F fixes the form and φ multiplies it by p.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.wittCrystallineFrobenius`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Strict Dieudonné complexes as décalage fixed points

**Node:** CrystallineCohomology:CR.4/leta-fixed-point. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.strictDieudonneFixedPoint`. All implementation status remains unchecked.

Sending a strict Dieudonné complex M to its derived p-complete complex with α_F:M≃Lη_pM gives an equivalence with the category of derived p-complete Lη_p-fixed objects. The enhanced fixed-point ∞-category is defined by the homotopy equalizer, with a specified equivalence α, not merely by the property that some equivalence exists. Its mapping spaces are discrete, and it agrees with the ordinary derived fixed-point category. The strict model is recovered from the compatible Bockstein complexes of the p-power reductions. This is a comparison of categories and actual morphisms, not an assertion that every p-complete complex is fixed.

Hypotheses and conventions: Use normalized η with p^q factors in all integer degrees, as supplied by AI.1. An object includes its specified equivalence and morphisms commute with that equivalence in the enhanced sense.

Proof outline:

1. Construct α_F from saturation and strictness. Recover a strict complex from the p-power Bockstein tower as in BLM7.3–7.4.
2. For mapping spaces, BLM7.5.3/7.5.4 makes Lη_p divisible by p^r on π_r for r>0.
3. The other equalizer map is invertible; p-completeness makes its difference with this p-divisible map invertible on positive homotopy groups. The homotopy fiber is therefore discrete, proving the enhanced comparison.

Direct prerequisites: `CrystallineCohomology:CR.4/dieudonne-complex`, `CrystallineCohomology:CR.4/strict-completion`, `AInfCohomology:AI.1/derived-decalage`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E1`.

Source: [Bhargav Bhatt, Jacob Lurie, Akhil Mathew, Revisiting the de Rham–Witt complex](https://arxiv.org/pdf/1805.05501v3), §§7.3–7.5, Theorems7.3.4,7.4.7 and full §7.5 proof. The enhanced mapping-space calculation is part of the target, not suppressed into ordinary equality.

Literal source excerpt:

> homotopy fiber

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.strictDieudonneFixedPoint`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Degree filtration and the slope spectral sequence

**Node:** CrystallineCohomology:CR.4/witt-slope-spectral-sequence. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.wittSlopeSpectralSequence`. All implementation status remains unchecked.

For smooth proper X of dimension d over a perfect field k, the degree filtration of WΩ_X gives a strongly convergent hypercohomology spectral sequence E₁^(a,b)=H^b(X,WΩ_X^a)⇒H^(a+b)_crys(X/W(k)), with0≤a≤d. After inverting p, E₁ terms are finite-dimensional isocrystals, the a-th column has crystalline slopes in[a,a+1), and the sequence degenerates at E₁. Finite-level degree filtrations give the corresponding hypercohomology spectral sequences for W_rΩ; inverse-limit passage uses Rlim rather than an unjustified interchange of cohomology and ordinary limits. Integral E₁-degeneration or finite generation of every integral H^b(WΩ^a) is not asserted.

Hypotheses and conventions: X proper smooth; perfect field; the slope separation and rational degeneration use the classical Illusie/Raynaud finiteness and topological-V theorem. The source route for that topological-V theorem remains a precise gate.

Proof outline:

1. Use the bounded degree filtration and enhanced hypercohomology to construct the spectral sequence and convergence.
2. Compare its abutment by the crystalline comparison; identify φ=p^aF on the a-th column.
3. Import the generic slope classification; audit the classical finite-dimensionality and V-topological nilpotence result to obtain the interval[a,a+1). Different columns have disjoint slope intervals, so every rational differential is zero.

Direct prerequisites: `CrystallineCohomology:CR.4/crystalline-comparison`, `CrystallineCohomology:CR.4/degree-scaled-frobenius`, `CrystallineCohomology:CR.3/proper-perfectness`, `EnhancedDerivedSheaves:E2`, `VectorBundlesAndIsocrystals:VB0`.

Source: [Torsten Ekedahl, On the multiplicative properties of the de Rham–Witt complex I](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf), Introduction, slope spectral sequence and multiplicative/duality discussion. This motivates the filtered target but is not a substitute for the missing Illusie II slope proof.

Literal source excerpt:

> spectral sequence

Acceptance:

- For a proper curve there are only columns0 and1; their rational slope intervals separate.
- The assertion is rational: integral torsion and non-finite integral Hodge–Witt groups are retained.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.wittSlopeSpectralSequence`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Nygaard filtration and divided Frobenius

**Node:** CrystallineCohomology:CR.4/nygaard-filtration. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.Nygaard`. All implementation status remains unchecked.

For the classical infinite Witt complex of a smooth algebra R over a perfect field, define N≥i(WΩ)^q=p^(i−q−1)V(WΩ^q) for q<i, and WΩ^q for q≥i, i≥0. Its associated graded is N≥i/N≥(i+1). The filtration is descending, complete and multiplicative. The degree-scaled φ restricts to a uniquely p^i-divisible map, giving φ_i:N≥iWΩ→WΩ. This is the largest subcomplex on which φ is divisible by p^i. Under φ:WΩ≅η_pWΩ, it corresponds exactly to p^iWΩ∩η_pWΩ, hence to the filtered décalage filtration, and induces the Nygaard filtration on Ru_*O_crys by the actual comparison.

Hypotheses and conventions: i≥0; smooth over a perfect field; p-torsionfree classical infinite form modules. The displayed exponent is used only for q<i, so it is never negative.

Uses:

- BMS2 §8.1; BLM §10.1; DerivedDeRhamCohomology:DD.4: Records the maximal subcomplex on which degree-scaled Frobenius is p^i-divisible and its filtered décalage form, making the crystalline Nygaard input available to the derived comparison owner.

Proof outline:

1. Use FV=VF=p and Vd=pdV to check differential stability and the divisibility.
2. The projection formula proves multiplicativity; strict V-completeness proves separatedness and completeness.
3. Use d⁻¹(pWΩ^(q+1))=F(WΩ^q) to identify the image of φ with η_p and the filtered image with the displayed intersection.

Direct prerequisites: `CrystallineCohomology:CR.4/classical-regular-comparison`, `CrystallineCohomology:CR.4/degree-scaled-frobenius`, `CrystallineCohomology:CR.4/leta-fixed-point`, `AInfCohomology:AI.1/principal-complex`.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, Definition8.1 and Proposition8.5, pp.265–268. The degreewise formula and its maximal divided-Frobenius characterization are exact.

Literal source excerpt:

> Nygaard filtration

API outline:

- `TauCeti.Crystalline.Nygaard.degree` (simp): For q<i, N≥i in degreeq is p^(i−q−1)imV; in degreeq≥i it is all forms.
- `TauCeti.Crystalline.Nygaard.dividedF` (data): p^iφ_i is the restriction of φ and φ_i is a cochain map.
- `TauCeti.Crystalline.Nygaard.decalage` (compatibility): φ maps N≥i isomorphically to p^iWΩ∩η_pWΩ.

Unit tests:

- `TauCeti.Crystalline.test_nygaard_zero` (degenerate): N≥0=WΩ.
- `TauCeti.Crystalline.test_nygaard_perfect` (computation): For a perfect field k in degree0, N≥iW(k)=p^iW(k).
- `TauCeti.Crystalline.test_nygaard_boundary` (non-example): At degreeq=i−1, N≥i=imV with no extra factor p; at degreeq=i it is the whole module.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: Typed components have the following exact limits.

The concrete degree submodules, divided degree-scaled F and three algebraic tests are typed. Differential stability, maximality, multiplicative/completeness assertions and the filtered η/geometric comparison require the named supplier complexes.

Forms requiring their exact supplier input: `TauCeti.Crystalline.Nygaard.decalage`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Nygaard, conjugate, Hodge and lift filtrations

**Node:** CrystallineCohomology:CR.4/nygaard-filtration-comparisons. **Kind:** comparison.

**Declaration:** `TauCeti.Crystalline.nygaardComparisons`. All implementation status remains unchecked.

Divided Frobenius modulo the projection to ordinary Ω induces a quasi-isomorphism gr_N^i(WΩ)≃τ≤iΩ_(R/k), where τ is canonical good truncation. There is a cofiber sequence WΩ/N≥i --p→ WΩ/N≥(i+1)→Ω≤i_(R/k), where Ω≤i is stupid Hodge truncation. For a p-complete smooth W(k)-lift A of R with a chosen Frobenius lift, its induced map of ordinary forms gives quasi-isomorphisms p^max(i−q,0)Ω^(q,cont)_(A/W)→N≥iWΩ. This chosen-lift description is not asserted independent of the Frobenius lift for all i, especially i≥p.

Hypotheses and conventions: Smooth over perfect k; i≥0. The good conjugate truncation and stupid Hodge truncation are different objects.

Proof outline:

1. Compute the image of φ_i and of N≥(i+1); the quotient is canonical truncation of WΩ/p. Apply the mod-p Cartier comparison.
2. Multiplication by p on the quotient is injective and its cokernel is the stated Hodge-truncated form complex, quasi-isomorphic by the classical comparison.
3. For a chosen Frobenius lift compare its scaled form subcomplex to Nygaard, checking the graded Cartier maps as in BMS2 Proposition8.7.

Direct prerequisites: `CrystallineCohomology:CR.4/nygaard-filtration`, `CrystallineCohomology:CR.4/classical-regular-comparison`, `DerivedDeRhamCohomology:DD.3/smooth-cartier`, `DerivedDeRhamCohomology:DD.0`.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, Lemmas8.2–3, Corollary8.6 and Proposition8.7 with proofs, pp.266–270. Both truncation conventions and the chosen Frobenius lift are retained.

Literal source excerpt:

> cofiber sequence

Acceptance:

- For a perfect field the associated graded is k in degree0 for every i≥0.
- At i=0 the Hodge cofiber is Ω⁰; higher form terms are killed by stupid truncation.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.nygaardComparisons`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Logarithmic Hodge–Witt sheaves

**Node:** CrystallineCohomology:CR.4/logarithmic-witt-sheaf. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.LogWitt`. All implementation status remains unchecked.

For a regular F_p-scheme X, q≥0 and r≥1, define W_rΩ^q_(X,log) as the étale subsheaf of W_rΩ_X^q generated by dlog[u₁]∧…∧dlog[u_q] for units u_j, equivalently the image of G_m^⊗q under the displayed multilinear map. In degree0 this is the constant Z/p^r generated by1. The Zariski image construction has the corresponding étale sheafification; equality is not imposed on every Zariski open section group. Define WΩ^q_log as the inverse limit on the pro-étale site for the smooth perfect-field case. These are ordinary logarithmic Hodge–Witt coefficients; they do not require choosing a log structure on X.

Hypotheses and conventions: Classical regular absolute forms; étale/pro-étale conventions are explicit. q=0 uses the empty product1.

Uses:

- Shiho §2; CMM §5.3; BMS2 §8.1: Provides the unit-symbol coefficients in finite and pro-étale logarithmic exact sequences; finite F is defined through its stated quotient, which is essential for the kernel API.

Proof outline:

1. F and d act on Teichmüller units by Fdlog[u]=dlog[u] and d(dlog[u])=0.
2. Take the image in the category of sheaves, allowing local sums of symbols; construct the Zariski image and compare its étale sheafification.
3. Use regular-to-smooth approximation for classical forms, then inverse limits in the pro-étale category, keeping the derived-limit assertion as the next theorem.

Direct prerequisites: `CrystallineCohomology:CR.4/relative-witt-complex`, `CrystallineCohomology:CR.4/classical-regular-comparison`, `CrystallineCohomology:CR.4/witt-localization-descent`.

Source: [Atsushi Shiho, On logarithmic Hodge–Witt cohomology of regular schemes](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf), §2, Definition2.2 and regular logarithmic forms through Corollary2.13. The definition is an image sheaf on the étale site.

Literal source excerpt:

> logarithmic

Source: [Dustin Clausen, Akhil Mathew, Matthew Morrow, K-theory and topological cyclic homology of henselian pairs](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Clausen%2C%20Mathew%2C%20Morrow%2C%20K-theory%20and%20TC%20of%20Henselian%20pairs.pdf), §5.3, Definition5.25. This is the routed coefficient construction, including regular rings.

Literal source excerpt:

> dlog

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1 before Proposition8.4. The infinite theory uses the pro-étale inverse limit.

Literal source excerpt:

> pro-étale

API outline:

- `TauCeti.Crystalline.LogWitt.symbol` (constructor): A tuple of units maps to the wedge of their Teichmüller dlog forms.
- `TauCeti.Crystalline.LogWitt.closed_fixed` (relation): Every local logarithmic form is closed and fixed by the induced finite quotient F.
- `TauCeti.Crystalline.LogWitt.map` (functoriality): Pullback of schemes sends a unit symbol to the symbol of its pulled-back units.

Unit tests:

- `TauCeti.Crystalline.test_logWitt_zero_degree` (degenerate): W_rΩ⁰_log is the constant Z/p^r generated by1.
- `TauCeti.Crystalline.test_logWitt_torus` (computation): On G_m, the symbol of t is dlog[t], a closed degree-one section.
- `TauCeti.Crystalline.test_logWitt_not_all` (non-example): On Spec F_p[t] at length1, dt is not a logarithmic section on the whole scheme: its Cartier image is0 whereas logarithmic forms are Cartier fixed.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.LogWitt`, `TauCeti.Crystalline.LogWitt.symbol`, `TauCeti.Crystalline.LogWitt.closed_fixed`, `TauCeti.Crystalline.LogWitt.map`, `TauCeti.Crystalline.test_logWitt_zero_degree`, `TauCeti.Crystalline.test_logWitt_torus`, `TauCeti.Crystalline.test_logWitt_not_all`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Illusie and Shiho logarithmic exact sequences

**Node:** CrystallineCohomology:CR.4/logarithmic-witt-sequences. **Kind:** theorem.

**Declaration:** `TauCeti.Crystalline.logWittExactSequences`. All implementation status remains unchecked.

For regular F_p-schemes,0→W_rΩ^q_log→W_rΩ^q --1−F→ W_rΩ^q/dV^(r−1)Ω^(q−1)→0 is étale exact, where finite F is induced from length r+1 and becomes well-defined in that quotient. As pro-sheaves this is the R−F sequence0→W_•Ω^q_log→W_•Ω^q→W_•Ω^q→0. For positive m,n there is an exact sequence0→W_nΩ^q_log --p^m→W_(n+m)Ω^q_log --R^n→W_mΩ^q_log→0. On a smooth scheme over perfect k, the pro-étale sequence of complexes0→WΩ^i_log[−i]→N≥iWΩ --φ_i−1→WΩ→0 is degreewise exact, and WΩ^i_log≃Rlim_r W_rΩ^i_log. Neither a same-length unquotiented F endomorphism nor Zariski surjectivity is substituted for these statements.

Hypotheses and conventions: Étale exactness for the regular finite and pro statements; pro-étale exactness for the infinite smooth perfect-field Nygaard statement. Ω^(−1)=0 handles q=0.

Proof outline:

1. Use Shiho§2’s full Popescu reduction and finite quotient Frobenius sequence, with its exact dV correction.
2. Derive the pro R−F sequence and the p^m/R^n sequence from the finite logarithmic sheaves and symbol lifting.
3. For the Nygaard map, degrees above i are p-adically contracting and degrees below i use1−p^(i−1−q)V, with V-adic completion at q=i−1. Degree i uses Illusie pro exactness and pro-étale exact inverse limits.

Direct prerequisites: `CrystallineCohomology:CR.4/logarithmic-witt-sheaf`, `CrystallineCohomology:CR.4/nygaard-filtration`, `DerivedDeRhamCohomology:DD.3`, `EnhancedDerivedSheaves:E2`.

Source: [Atsushi Shiho, On logarithmic Hodge–Witt cohomology of regular schemes](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf), §2, Theorem2.3 and Corollary2.13, including the regular reduction. This is the regular extension with the actual finite quotient target.

Literal source excerpt:

> exact

Source: [Dustin Clausen, Akhil Mathew, Matthew Morrow, K-theory and topological cyclic homology of henselian pairs](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Clausen%2C%20Mathew%2C%20Morrow%2C%20K-theory%20and%20TC%20of%20Henselian%20pairs.pdf), §5.3, Definition5.26 and Illusie I.5.7 discussion. The pro operator means R−F with length changes.

Literal source excerpt:

> pro sheaves

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Topological Hochschild homology and integral p-adic Hodge theory](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, Proposition8.4 and complete proof, pp.267–268. The boundary degree in the proof is q=i−1; the printed i=n−1 is corrected to i=n+1 in sourceIssues.

Literal source excerpt:

> exact in each degree

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.logWittExactSequences`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Semistable logarithmic Witt models

**Node:** CrystallineCohomology:CR.4/semistable-log-witt-models. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.LogWittModel`. All implementation status remains unchecked.

For a finite-type strictly semistable fine log scheme(X,L) over the standard log point κ°, choose an admissible simplicial embedding system into smooth log W-lifts(Y^*,M^*) over W° and(Z^*,N^*) over W[t]°. Let D_l^*,E_l^* be the base-compatible log PD envelopes from DL B.2. Define the pro-complexes Wω_X^*=Ru_*[Ω^*_(Y^*,M^*)/W°⊗O_(D_l^*)] and Wω̃_X^*=Ru_*[Ω^*_(Z^*,N^*)/Wtriv⊗O_(D_l^*)], independent of embeddings by log PD Poincaré/descent. Their rational derived limits have the monodromy triangle Wω[−1]→Wω̃→Wω --N→Wω, with first map wedge dlog t. Define Sato’s cohomological WΞ_X^* from its stated log-PD quotient complex, and compare its rational limit to the convergent ω_X^+ model. CR.4 owns these Witt models; CR.5 supplies log sites/Poincaré and CR.6 owns N and Hyodo–Kato comparisons.

Hypotheses and conventions: Strict semistability, finite type over κ° and an admissible embedding system; log carriers are imported. The maps and triangle are rational after derived inverse limit and W→K₀.

Uses:

- Disegni–Liu AppendixB.2; CrystallineCohomology:CR.5 and CR.6: Forms the crystalline Witt models of the two embedding-system complexes and Sato’s coefficient complex. Log Poincaré/descent is imported from CR.5 and the monodromy operator belongs to CR.6.

Proof outline:

1. Import log structures and log PD-envelope descent from CR.5, and apply the supplied log differential complex to the two finite-level envelopes.
2. Use product embeddings to identify the Witt pro-models. DL(B.5) compares their rational derived limits with convergent ω,ω̃ via completed-envelope/tube maps.
3. The Sato quotient Ξ^q=Ω^(q+1)_log/Ω^(q+1)_ordinary in DL leads to WΞ via Sato Definition8.3/Proposition8.4; the full Sato proof is a source gate.
4. Export the identified triangle to CR.6; do not define monodromy independently of that owner.

Direct prerequisites: `CrystallineCohomology:CR.0/pd-envelope`, `CrystallineCohomology:CR.2/crystalline-cohomology`, `CrystallineCohomology:CR.5:log-algebra`, `CrystallineCohomology:CR.5`, `PadicDifferentialEquationsAndRigidCohomology:RD.3`.

Source: [Daniel Disegni and Yifeng Liu, A p-adic arithmetic inner product formula](https://arxiv.org/pdf/2204.09239v3), AppendixB.2,(B.4)–(B.5) and Sato comparison after(B.8), pp.82–83. The exact log PD models and rational comparison are routed here; the convergent side and N retain their owners.

Literal source excerpt:

> strictly semistable

API outline:

- `TauCeti.Crystalline.LogWittModel.envelope_eval` (data): A chosen admissible embedding evaluates to the two displayed log de Rham PD-envelope procomplexes.
- `TauCeti.Crystalline.LogWittModel.embedding_independence` (equivalence): The product-embedding maps are compatible quasi-isomorphisms and satisfy the cocycle.
- `TauCeti.Crystalline.LogWittModel.rational_compare` (compatibility): After Rlim and inversion of p the actual comparison agrees with DL(B.5), compatibly with wedge dlog t.

Unit tests:

- `TauCeti.Crystalline.test_logWittModel_point` (degenerate): For the standard log point κ°, Wω has W in degree0 and Wω̃ has the extra dlog t direction giving the stated triangle.
- `TauCeti.Crystalline.test_logWittModel_diagonal_embedding` (characterisation): Comparing an embedding with itself via its diagonal product induces the identity.
- `TauCeti.Crystalline.test_logWittModel_rational_scope` (non-example): DL(B.5) is asserted after inversion of p; an integral tube isomorphism is not included.

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.LogWittModel`, `TauCeti.Crystalline.LogWittModel.envelope_eval`, `TauCeti.Crystalline.LogWittModel.embedding_independence`, `TauCeti.Crystalline.LogWittModel.rational_compare`, `TauCeti.Crystalline.test_logWittModel_point`, `TauCeti.Crystalline.test_logWittModel_diagonal_embedding`, `TauCeti.Crystalline.test_logWittModel_rational_scope`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### Witt comparison maps with proper support

**Node:** CrystallineCohomology:CR.4/log-witt-proper-support. **Kind:** construction.

**Declaration:** `TauCeti.Crystalline.LogWittSupport`. All implementation status remains unchecked.

For an open immersion F:U⊂X in the preceding semistable setting, retain the actual DL rational Witt objects F!F^*Wω̃_(X,K₀) and F!F^*WΞ_(X,K₀). Construct their natural comparison maps to ω̃_(U,X) and ω^+_(U,X), respectively, by the LemmaB.3 tube proper-support comparison and(B.6)/(B.9). They fit into the commuting(B.10) diagram with the wedge dlog t map. The convergent proper-support object is defined by its embedding-system tube functor f!_(U*,X*), not by identifying it with ordinary étale F!F^* without a theorem. DL only supplies these natural maps at(B.6)/(B.9); no blanket proper-support equivalence is asserted here.

Hypotheses and conventions: X strictly semistable of finite type; U an open subscheme. Derived inverse limit and inversion of p precede the displayed étale extension-by-zero objects.

Uses:

- Disegni–Liu (B.6),(B.9),(B.10); CohomologyComparisons:CP.4: Supplies the actual natural maps from rational Witt objects with open support into convergent tube objects and their dlog compatibility diagram, preserving the source’s map shape and tube support functor.

Proof outline:

1. Use DL LemmaB.3’s natural map between étale and tube extension by zero on the embedding system.
2. Apply it to the two actual rational Witt models and compose with(B.5) or the Sato comparison.
3. Naturality with respect to wedge dlog t proves(B.10). Import the convergent support object from RD, and retain the source’s warning about derived factorization.

Direct prerequisites: `CrystallineCohomology:CR.4/semistable-log-witt-models`, `EnhancedDerivedSheaves:E1`, `PadicDifferentialEquationsAndRigidCohomology:RD.3`.

Source: [Daniel Disegni and Yifeng Liu, A p-adic arithmetic inner product formula](https://arxiv.org/pdf/2204.09239v3), AppendixB.2,(B.6),(B.9),(B.10) and LemmaB.3, pp.79–83. The support comparison is a map, not an unstated equivalence or an arbitrary j! definition.

Literal source excerpt:

> natural map

API outline:

- `TauCeti.Crystalline.LogWittSupport.compare` (data): The two comparison morphisms have exactly the sources and targets displayed in(B.6)/(B.9).
- `TauCeti.Crystalline.LogWittSupport.open_identity` (simp): For U=X, the tube support functor is the identity and the comparison recovers the full rational model comparison.
- `TauCeti.Crystalline.LogWittSupport.dlog_square` (compatibility): The two comparisons commute with wedge dlog t as in(B.10).

Unit tests:

- `TauCeti.Crystalline.test_logWittSupport_empty` (degenerate): For U=∅ both extension-by-zero sources are zero.
- `TauCeti.Crystalline.test_logWittSupport_full` (compatibility): For U=X, the comparison is the preceding full-model equivalence.
- `TauCeti.Crystalline.test_logWittSupport_map` (non-example): For a general open, the contract is a natural comparison morphism; an equivalence does not follow solely from(B.6)/(B.9).

Acceptance:

- Retain every displayed hypothesis and the specified carrier and variance.

Suggested-form coverage: The named declaration has no typed suggested form.

Forms requiring their exact supplier input: `TauCeti.Crystalline.LogWittSupport`, `TauCeti.Crystalline.LogWittSupport.compare`, `TauCeti.Crystalline.LogWittSupport.open_identity`, `TauCeti.Crystalline.LogWittSupport.dlog_square`, `TauCeti.Crystalline.test_logWittSupport_empty`, `TauCeti.Crystalline.test_logWittSupport_full`, `TauCeti.Crystalline.test_logWittSupport_map`.

DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit.

### CR.4 continuation required for closure

- Underived η and filtered colimits: The inherited link to AI.1/derived-decalage supplies the derived Lη statement, not the underived η_p compatibility needed in BLM2.3.1. Replace that mismatched dependency with a precise request to the same owner.
- Basic Witt and saturated étale source interiors: LZ basic-form definitions, operator identities and the full uniqueness proof in2.17 were read, but the intervening generation/product reduction lemmas in§§2.3–2.4 need a continuous proof audit. BLM5.3.4 is used with its exact scope and the5.3.5 deduction was read; its §5.5 lifting proof still requires audit.
- Classical slope spectral sequence source gate: Acquire Illusie II and the applicable Illusie–Raynaud finite-dimensionality/topological-V theorem, then certify the rational[a,a+1) bound and E₁-degeneration. Ekedahl’s introduction is read but only motivates this target; no integral finite-generation or degeneration conclusion is certified.
- Sato and logarithmic Witt model proof gate: Acquire Sato Definition8.3/Proposition8.4 and the log-envelope embedding-independence proof for DL’s WΞ/ω⁺ comparison; the DL formulas and map shapes were read completely, but their cited proof inputs are not certified. CR.5 supplies log Poincaré/descent and RD supplies convergent tube objects. No general open-support equivalence is asserted.
- Supplier contract AInfCohomology:AI.1: For the generic underived η_p on termwise p-torsionfree Z-complexes, prove compatibility with filtered colimits at the actual complex level, preserving the canonical α_F maps. BLM2.3.1 needs this elementary statement; compatibility of derived Lη with filtered colimits alone is not the stated input. This belongs to the independent décalage foundation and must not import AΩ or crystalline realization.
- Supplier contract AInfCohomology:AI.0: Export the existing Witt ring and truncated Witt carrier with canonical divided powers on VW_(r−1)(R), degree-zero strict-algebra Witt reconstruction, the arbitrary-base Witt étale/pushout theorem of BMS1 10.4/BLM5.4.1, and the finitely generated ideal/topology comparisons of BMS1 10.1. These are generic Witt-ring results, not a second Witt construction in CR.4.
- Supplier contract PerfectoidQuotients:Q0:integral-algebra: Supply the integral perfectoid ring carrier and the Witt coefficient Tor-independence used in BMS1 Lemma3.13/Remark3.19 for V^uW_(r−u)(A) under A→A′. If this requires more than the current foundational contract, make the extension Perfectoid foundations, Part II; do not assume arbitrary Witt modules are flat.
- Supplier contract DerivedDeRhamCohomology:DD.3: Export the existing smooth Cartier node and the regular-Noetherian F_p Popescu approximation, together with finite-length ordinary-form/Cartier filtered-colimit compatibility sufficient for Shiho§2 and the classical/saturated regular comparison. Popescu itself is generic and remains with its supplier.
- Supplier contract VectorBundlesAndIsocrystals:VB0: Supply the isocrystal slope decomposition over perfect fields and the fact that Frobenius-equivariant maps between disjoint slope intervals vanish. Reuse pinned Mathlib WittVector.isocrystal_classification where its field/algebraic-closure hypotheses suffice, and extend to the exact perfect-field descent needed here.
- Supplier contract EnhancedDerivedSheaves:E2: Export pro-étale exact inverse limits for the surjective logarithmic Witt systems, with the repleteness hypothesis of BMS2 Proposition8.4 and the change of étale/pro-étale topology. If the required replete machinery is owned by E4, link its finer node; retain the distinction from general ordinary inverse limits.
- Supplier contract CrystallineCohomology:CR.5:log-algebra: Supply fine/strictly semistable log schemes and log differential forms on the standard W°,W[t]° and κ° bases for the DL crystalline Witt models. These are the existing log owner’s objects, not new CR.4 log carriers.
- Supplier contract CrystallineCohomology:CR.5: Supply log PD envelopes, admissible embedding systems and their log PD Poincaré/descent comparison for DL AppendixB.2’s finite-level pro-models. CR.4 constructs only the resulting Witt models; CR.6 supplies monodromy and Hyodo–Kato. CR.5 requires CR.0/CR.2/log algebra, so this import introduces no CR.4→CR.5 reverse prerequisite.
- Supplier contract PadicDifferentialEquationsAndRigidCohomology:RD.3: Extend Rigid cohomology, Part II with the convergent log de Rham–Witt ω,ω̃,ω⁺ objects and the tube proper-support functor of DL AppendixB.2/LemmaB.3, including its precise comparison maps to the étale Witt objects. RD.3’s overconvergent coefficient contract alone does not identify these convergent objects; preserve that distinction.
- Precise prototype obligations: CR.4: DD.0 supplies ordinary higher forms, exterior products and length-one comparisons; AI.0 supplies canonical Witt base powers, étale Witt maps and degree-zero strict reconstruction. AI.1/DD.1/E2 supplies actual η/Lη, derived complete limits, enhanced fixed-point morphisms and pro-étale exactness. DD.3 supplies Cartier/Popescu, Q0 integral-perfectoid coefficient Tor-independence, VB0 slope maps, CR.5 log schemes/sites/Poincaré, and RD.3 convergent tube proper support. LZ generation/product, Illusie II and Sato source gates remain explicit. The signatureCoverage register lists every omitted name and the exact limitations of every typed component. No comment-only form is included in the compilation counts.

## Structure proposals

These proposals retain the accepted scoped stages and current ownership while recording the exact supplier extensions and imports for the orchestrator.

The source routes and verified RT-AREA-padic-2 findings 2/8/12/36 require common ordinary forms, generic Witt-ring algebra and classical Cartier as imports. Planning these anew in CR.2/CR.4 would duplicate their foundation owners or reverse the derived comparison dependency.

Keep the accepted seven crystalline stages and their current target assignments. Confirm DD.0 ordinary exterior de Rham DGAs → CR.2; AI.0 generic Witt/Fontaine data → CR.0/CR.1/CR.4; DD.3 smooth Cartier and the exact Popescu input → CR.4. Retain the lci derived-de-Rham/PD-envelope comparison in DD.4, importing only the classical envelope lemmas from CR.0. The packet requests the precise missing contracts and applies no atlas edits.

Perfectoid coefficient Tor-independence, convergent tube proper support and elliptic Dieudonné realization extend existing directions; the corresponding consumers must not construct second foundation, rigid or group-theoretic theories.

Extend PerfectoidQuotients, Part II beside Q0:integral-algebra with the exact Witt coefficient Tor input; extend rigid cohomology, Part II beside RD.3 with the convergent ω/ω̃/ω⁺ and tube support comparison; extend R07.2 with elliptic crystalline realization while importing its existing Dieudonné classification. CR.4 retains only the relative Witt base-change theorem and the natural crystalline-model comparison maps, and CR.3 only their geometric test application.

## Pinned declaration register

Each entry was read at the stated pin. Existing carriers and results are imported rather than planned again.

- `mathlib:CochainComplex` (abbrev, `Mathlib/Algebra/Homology/HomologicalComplex.lean`): The existing Z-indexed cochain-complex carrier, used in the Dieudonné prototype. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowerAlgebra` (abbrev, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): The existing quotient algebra Γ_R(M); the source explicitly leaves its canonical augmentation divided powers as a TODO. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowerAlgebra.lift` (def, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): The weak algebra-homomorphism universal property into a given PD target. It does not supply a PD structure on Γ_R(M). Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowerAlgebra.map` (def, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): Functoriality of the existing divided-power algebra along the stated scalar tower and linear map. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers` (structure, `Mathlib/RingTheory/DividedPowers/Basic.lean`): Divided powers on an existing ideal, including totalization by zero outside the ideal and the exact binomial/uniformBell axioms. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers.IsDPMorphism` (structure, `Mathlib/RingTheory/DividedPowers/DPMorphism.lean`): A ring homomorphism preserving the specified ideals and their divided powers. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers.Quotient.dividedPowers` (def, `Mathlib/RingTheory/DividedPowers/SubDPIdeal.lean`): Existing descent to A/K when K∩I is stable under positive divided powers; no need to rebuild quotient PD structures. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers.RatAlgebra.dividedPowers` (def, `Mathlib/RingTheory/DividedPowers/RatAlgebra.lean`): The PD structure on any ideal of a rational algebra; used only to establish universal coefficient identities. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers.RatAlgebra.dpow_eq_inv_fact_smul` (theorem, `Mathlib/RingTheory/DividedPowers/RatAlgebra.lean`): On a rational algebra every PD structure evaluates on its ideal as the factorial-normalized power. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers.coincide_on_smul` (theorem, `Mathlib/RingTheory/DividedPowers/Basic.lean`): Two divided-power structures in the same ring agree on the product of their ideals. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers.dpow_eq_from_gens` (theorem, `Mathlib/RingTheory/DividedPowers/DPMorphism.lean`): Two existing PD structures agreeing on an ideal generating set are equal; this does not construct a structure from partial axioms. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers.dpow_eval_zero` (theorem, `Mathlib/RingTheory/DividedPowers/Basic.lean`): Positive divided powers of zero vanish. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers.dpow_sum` (theorem, `Mathlib/RingTheory/DividedPowers/Basic.lean`): The finite-sum expansion indexed by multisets, with no extra multinomial coefficients. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers.ext` (theorem, `Mathlib/RingTheory/DividedPowers/Basic.lean`): Equality from equality of operations on the ideal, with the outside convention handled automatically. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowers.prod_dpow` (theorem, `Mathlib/RingTheory/DividedPowers/Basic.lean`): Repeated products of divided powers of one element are the multinomial coefficient times the divided power of the summed degree. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:IsLocalization.flat` (theorem, `Mathlib/RingTheory/Flat/Localization.lean`): Localization is flat over its base commutative ring. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:IsLocalization.mk'` (def, `Mathlib/RingTheory/Localization/Defs.lean`): The existing fraction x/s in a specified localization. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:Module.Flat.isTrivialRelation_of_sum_smul_eq_zero` (theorem, `Mathlib/RingTheory/Flat/EquationalCriterion.lean`): A relation in a flat module factors through finitely many elements with vanishing coefficient relations; used directly in presentation independence. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:ModuleCat` (structure, `Mathlib/Algebra/Category/ModuleCat/Basic.lean`): The existing category of modules; ModuleCat Z supplies the additive groups in the prototype. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:MvPolynomial.basisMonomials` (def, `Mathlib/RingTheory/MvPolynomial/Basic.lean`): The ordinary monomials form a basis over any coefficient ring; rationally rescaled monomials distinguish universal coefficient identities. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:Nat.add_choose_eq` (theorem, `Mathlib/Data/Nat/Choose/Vandermonde.lean`): Vandermonde identity as an equality of natural-number coefficients. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:PadicInt.dividedPowers` (def, `Mathlib/RingTheory/DividedPowers/Padic.lean`): Canonical divided powers on the principal ideal (p) of Z_p for every prime p, including two. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `tauceti:TauCeti.Associative.dividedPower` (def, `TauCeti/RingTheory/DividedPowers/Associative.lean`): The factorial-normalized power in an associative rational algebra; only a rational compatibility test, not a torsion-ring PD structure. Statement and applicable hypotheses read at the pinned commit; declaration index used only to locate the source.
- `mathlib:DividedPowerAlgebra.lift_apply_dp` (theorem, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): Evaluation on dp(n,m) is the target divided power of the linear image. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:DividedPowerAlgebra.algHom_ext` (theorem, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): R-algebra homomorphisms are equal if they agree on every divided-power generator. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:DividedPowerAlgebra.dp_zero` (theorem, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): The degree-zero generator is one. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:DividedPowerAlgebra.map_apply_dp` (theorem, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): The functorial algebra map sends dp(n,m) to dp(n,f(m)). Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:DividedPowerAlgebra.induction_on` (theorem, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): Induction on scalars, addition and multiplication by dp(n,m). Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:dividedPowersBot` (def, `Mathlib/RingTheory/DividedPowers/Basic.lean`): The canonical PD structure on the zero ideal. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:RingHom.ker` (def, `Mathlib/RingTheory/Ideal/Maps.lean`): Ideal kernel of a ring homomorphism. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:RingHom.mem_ker` (theorem, `Mathlib/RingTheory/Ideal/Maps.lean`): Kernel membership is equivalent to image zero. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:Ideal.subset_span` (theorem, `Mathlib/RingTheory/Ideal/Span.lean`): Every generator belongs to its ideal span. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:Ideal.span_le` (theorem, `Mathlib/RingTheory/Ideal/Span.lean`): The ideal span lies in an ideal exactly when every generator does. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:LinearEquiv.ofLinearMap` (def, `Mathlib/Algebra/Module/Equiv/Basic.lean`): Packages inverse linear maps into a linear equivalence. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:Ideal.map` (def, `Mathlib/RingTheory/Ideal/Maps.lean`): Ideal extension is the ideal span of the image. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:Ideal.mem_map_of_mem` (theorem, `Mathlib/RingTheory/Ideal/Maps.lean`): The image of an ideal element lies in the extended ideal. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:Finsupp.mem_ideal_span_range_iff_exists_finsupp` (theorem, `Mathlib/RingTheory/Ideal/Operations.lean`): An element of an ideal spanned by a range has a finite coefficient expression. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:Ideal.mul_mem_mul` (theorem, `Mathlib/RingTheory/Ideal/Operations.lean`): A product of elements of the two ideals lies in their ideal product. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:Ideal.mul_le_inf` (theorem, `Mathlib/RingTheory/Ideal/Operations.lean`): The product of two ideals lies in their intersection. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:DividedPowerAlgebra.lift'` (def, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): Constructs an algebra map from a generator family satisfying the four defining relations. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:DividedPowerAlgebra.lift'_apply_dp` (theorem, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): Evaluation of lift′ on each generator is the specified family value. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:DividedPowerAlgebra.embed_def` (theorem, `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`): The canonical module embedding sends m to dp(1,m). Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:TrivSqZeroExt.inr` (def, `Mathlib/Algebra/TrivSqZeroExt/Basic.lean`): The module inclusion m↦(0,m) into the trivial square-zero extension. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:TrivSqZeroExt.inr_mul_inr` (theorem, `Mathlib/Algebra/TrivSqZeroExt/Basic.lean`): The product of any two elements in the square-zero module summand is zero. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:TrivSqZeroExt.inr_injective` (theorem, `Mathlib/Algebra/TrivSqZeroExt/Basic.lean`): The module-summand inclusion is injective. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:ZMod.natCast_self` (theorem, `Mathlib/Data/ZMod/Basic.lean`): The modulus n is zero in ZMod n. Statement and surrounding hypotheses read in Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-09-26.
- `mathlib:ModuleCat.ofHom` (abbrev, `Mathlib/Algebra/Category/ModuleCat/Basic.lean`): Existing ModuleCat.ofHom; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Category/ModuleCat/Basic.lean:112.
- `mathlib:HomologicalComplex.d_comp_d` (theorem, `Mathlib/Algebra/Homology/HomologicalComplex.lean`): Existing HomologicalComplex.d_comp_d; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Homology/HomologicalComplex.lean:72.
- `mathlib:HomologicalComplex.Hom` (structure, `Mathlib/Algebra/Homology/HomologicalComplex.lean`): Existing HomologicalComplex.Hom; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Homology/HomologicalComplex.lean:217.
- `mathlib:HomologicalComplex.hom_ext` (lemma, `Mathlib/Algebra/Homology/HomologicalComplex.lean`): Existing HomologicalComplex.hom_ext; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Homology/HomologicalComplex.lean:250.
- `mathlib:CochainComplex.of` (abbrev, `Mathlib/Algebra/Homology/HomologicalComplex.lean`): Existing CochainComplex.of; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Homology/HomologicalComplex.lean:905.
- `mathlib:CochainComplex.ofHom` (abbrev, `Mathlib/Algebra/Homology/HomologicalComplex.lean`): Existing CochainComplex.ofHom; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Homology/HomologicalComplex.lean:942.
- `mathlib:LinearMap.mem_range` (theorem, `Mathlib/Algebra/Module/Submodule/Range.lean`): Existing LinearMap.mem_range; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Module/Submodule/Range.lean:68.
- `mathlib:LinearMap.range_comp_le_range` (theorem, `Mathlib/Algebra/Module/Submodule/Range.lean`): Existing LinearMap.range_comp_le_range; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Module/Submodule/Range.lean:86.
- `mathlib:Submodule.mapQ` (def, `Mathlib/LinearAlgebra/Quotient/Basic.lean`): Existing Submodule.mapQ; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/LinearAlgebra/Quotient/Basic.lean:172.
- `mathlib:Submodule.mapQ_apply` (theorem, `Mathlib/LinearAlgebra/Quotient/Basic.lean`): Existing Submodule.mapQ_apply; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/LinearAlgebra/Quotient/Basic.lean:176.
- `mathlib:Submodule.mapQ_comp` (theorem, `Mathlib/LinearAlgebra/Quotient/Basic.lean`): Existing Submodule.mapQ_comp; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/LinearAlgebra/Quotient/Basic.lean:192.
- `mathlib:Submodule.mapQ_id` (theorem, `Mathlib/LinearAlgebra/Quotient/Basic.lean`): Existing Submodule.mapQ_id; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/LinearAlgebra/Quotient/Basic.lean:201.
- `mathlib:Submodule.mkQ` (def, `Mathlib/LinearAlgebra/Quotient/Defs.lean`): Existing Submodule.mkQ; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/LinearAlgebra/Quotient/Defs.lean:227.
- `mathlib:Submodule.mkQ_surjective` (theorem, `Mathlib/LinearAlgebra/Quotient/Defs.lean`): Existing Submodule.mkQ_surjective; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/LinearAlgebra/Quotient/Defs.lean:236.
- `mathlib:Submodule.mem_sup` (theorem, `Mathlib/LinearAlgebra/Span/Defs.lean`): Existing Submodule.mem_sup; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/LinearAlgebra/Span/Defs.lean:381.
- `mathlib:HomologicalComplex.Hom.comm` (theorem, `Mathlib/Algebra/Homology/HomologicalComplex.lean`): Existing HomologicalComplex.Hom.comm; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Homology/HomologicalComplex.lean:222.
- `mathlib:Module.End.pow_apply` (theorem, `Mathlib/Algebra/Module/LinearMap/End.lean`): Existing Module.End.pow_apply; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Module/LinearMap/End.lean:130.
- `mathlib:LinearMap.range` (def, `Mathlib/Algebra/Module/Submodule/Range.lean`): Existing LinearMap.range; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/Algebra/Module/Submodule/Range.lean:57.
- `mathlib:Submodule.Quotient.mk` (def, `Mathlib/LinearAlgebra/Quotient/Defs.lean`): Existing Submodule.Quotient.mk; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/LinearAlgebra/Quotient/Defs.lean:61.
- `mathlib:Submodule.Quotient.mk_eq_zero` (theorem, `Mathlib/LinearAlgebra/Quotient/Defs.lean`): Existing Submodule.Quotient.mk_eq_zero; used for ordinary cochain maps, submodule images or quotient maps in the finite-level construction. Statement read at pinned Mathlib commit, Mathlib/LinearAlgebra/Quotient/Defs.lean:98.
- `mathlib:Ideal.span` (abbrev, `Mathlib/RingTheory/Ideal/Span.lean`): The existing ideal generated by a subset. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:Ideal.span_mono` (theorem, `Mathlib/RingTheory/Ideal/Span.lean`): Inclusion of generating sets induces inclusion of their spans. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:Ideal.eq_top_iff_one` (theorem, `Mathlib/RingTheory/Ideal/Lattice.lean`): An ideal is the unit ideal exactly when it contains 1. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:Ideal.span_mul_span` (theorem, `Mathlib/RingTheory/Ideal/Operations.lean`): The product of generated ideals is generated by pairwise products; the two-sided hypotheses hold for commutative rings. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:Ideal.map_span` (theorem, `Mathlib/RingTheory/Ideal/Maps.lean`): Mapping an ideal span gives the span of the image set. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:Ideal.mem_map_iff_of_surjective` (theorem, `Mathlib/RingTheory/Ideal/Maps.lean`): For a surjective ring map, membership in an ideal image is witnessed by an element of the original ideal. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:Ideal.span_singleton_pow` (theorem, `Mathlib/RingTheory/Ideal/Operations.lean`): A power of a principal ideal is generated by the corresponding power of its generator. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:Ideal.pow_mem_pow` (theorem, `Mathlib/RingTheory/Ideal/Operations.lean`): An element of I has its nth power in Iⁿ. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:Ideal.pow_le_pow_right` (theorem, `Mathlib/RingTheory/Ideal/Operations.lean`): For m≤n, Iⁿ⊆Iᵐ. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:DividedPowers.IsDPMorphism.map_dpow` (theorem, `Mathlib/RingTheory/DividedPowers/DPMorphism.lean`): A PD morphism preserves γ_n(x) for x in the source ideal. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:PadicInt.coe_dpow_eq` (lemma, `Mathlib/RingTheory/DividedPowers/Padic.lean`): Embedding the canonical p-adic divided power into ℚ_p gives xⁿ/n! for x in (p). Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:PadicInt.valuation_p` (lemma, `Mathlib/NumberTheory/Padics/PadicIntegers.lean`): The valuation of p in ℤ_p is one. Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:PadicInt.mem_span_pow_iff_le_valuation` (theorem, `Mathlib/NumberTheory/Padics/PadicIntegers.lean`): For nonzero x, membership in the principal ideal generated by pⁿ is equivalent to n≤v_p(x). Full statement and ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; the declaration index only supplies the checked locator.
- `mathlib:AlgebraicGeometry.Scheme.IdealSheafData` (structure, `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean`): Affine-open ideal data compatible with basic-open localization, defining a quasi-coherent ideal sheaf on an existing Scheme. Complete structure fields read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:SheafOfModules` (structure, `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean`): A presheaf of modules over a sheaf of rings whose underlying presheaf of abelian groups is a sheaf. Complete structure fields read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174.
- `mathlib:TruncatedWittVector` (def, `Mathlib/RingTheory/WittVector/Truncated.lean`): The existing carrier Fin r → R, with its pinned prime-dependent Witt ring operations. Declaration and its ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; no name-only inference.
- `mathlib:WittVector.truncate` (def, `Mathlib/RingTheory/WittVector/Truncated.lean`): The existing ring homomorphism from infinite Witt vectors to length r, with its surjectivity. Declaration and its ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; no name-only inference.
- `mathlib:WittVector.frobenius` (def, `Mathlib/RingTheory/WittVector/Frobenius.lean`): The existing Witt Frobenius ring homomorphism, used to form the concrete length-changing coefficient operation. Declaration and its ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; no name-only inference.
- `mathlib:DirectSum.GRing` (class, `Mathlib/Algebra/DirectSum/Ring.lean`): The existing graded ring structure with coherent integer casts; the Dieudonné and relative DGA signatures add the differential and graded-commutative axioms. Declaration and its ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; no name-only inference.
- `mathlib:KaehlerDifferential` (def, `Mathlib/RingTheory/Kaehler/Basic.lean`): The existing ordinary module I/I² for the kernel of the tensor multiplication map, used before imposing PD derivative relations. Declaration and its ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; no name-only inference.
- `mathlib:KaehlerDifferential.linearMapEquivDerivation` (def, `Mathlib/RingTheory/Kaehler/Basic.lean`): The existing equivalence between S-linear maps from Ω[S/R] and R-derivations into the specified S-module. Declaration and its ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; no name-only inference.
- `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` (structure, `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean`): The existing category of objects satisfying a stated predicate, used for the small crystalline site inside the big one. Declaration and its ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; no name-only inference.
- `mathlib:CategoryTheory.ObjectProperty.ι` (def, `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean`): The existing full-subcategory inclusion functor on actual objects and morphisms. Declaration and its ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; no name-only inference.
- `mathlib:CategoryTheory.Functor.inducedTopology` (def, `Mathlib/CategoryTheory/Sites/InducedTopology.lean`): The finest topology making a specified functor continuous, used with an additional open-cover criterion for the small crystalline topology. Declaration and its ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; no name-only inference.
- `mathlib:RingTheory.Sequence.IsRegular` (structure, `Mathlib/RingTheory/Regular/RegularSequence.lean`): Weak regularity with a nonzero final quotient; the existing sequence notion supplies the characteristic-p regular-envelope basis hypothesis. Declaration and its ambient hypotheses read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; no name-only inference.

## Supplier contracts

The following contracts are requests to the owning roadmaps, not certified implementations. Their `neededBy` declarations make the import boundary explicit.

1. `AInfCohomology:AI.1`: For the generic underived η_p on termwise p-torsionfree Z-complexes, prove compatibility with filtered colimits at the actual complex level, preserving the canonical α_F maps. BLM2.3.1 needs this elementary statement; compatibility of derived Lη with filtered colimits alone is not the stated input. This belongs to the independent décalage foundation and must not import AΩ or crystalline realization. Used by `CrystallineCohomology:CR.4/saturation-colimit`.
2. `AInfCohomology:AI.0`: Export the common(A_inf,θ,kerθ) Fontaine input, its Witt reduction maps and their precise PD-target kernel containment; prove the ordinary envelope p-torsionfree/continuity certificate used in constructing the common A_cris. Identify the AI.0 Fontaine presentation by this initiality, without a reverse dependency through completed p-adic Hodge comparison. Used by `CrystallineCohomology:CR.0/fontaine-envelope`.
3. `DerivedDeRhamCohomology:DD.0`: Export ordinary relative differential forms, de Rham DGAs, coefficient connections and smooth-lift de Rham complexes with actual exterior powers, Leibniz rule and integrability. The draft DD.2/ordinary-de-rham-complex is a candidate but needs the confirmed DD.0 ownership and its rejected prototype repaired. Used by `CrystallineCohomology:CR.1/quasi-nilpotent-connection`.
4. `DerivedDeRhamCohomology:DD.1`: Export the exact derived inverse-limit and bounded-p-torsion/finite-Witt coherent-module comparison needed for the ordinary formal evaluation; the supplier draft is under revision and is not treated as a checked implementation. Used by `CrystallineCohomology:CR.1/finite-witt-evaluation`.
5. `EnhancedDerivedSheaves:E1`: Supply geometric morphisms, actual sheaves of modules and pullback tensor comparisons for the specified ringed crystalline sites, including big/small restriction and Zariski/étale change-of-topology functors. Used by `CrystallineCohomology:CR.1/site-morphisms`.
6. `EnhancedDerivedSheaves:E2`: Supply compatible enhanced derived inverse/direct images and the quasi-coherent cohomology descent criterion for the topology-change comparison; no equivalence of arbitrary big/small sheaf topoi is assumed. Used by `CrystallineCohomology:CR.1/site-morphisms`.
7. `AInfCohomology:AI.0`: Supply the existing/pinned Witt-vector scheme base, Witt Frobenius and perfect-field finite-Witt reduction maps used to define the compatible W-crystal coefficient families; this is elementary Witt foundation, not AΩ. Used by `CrystallineCohomology:CR.1/isocrystal`.
8. `AlgebraicModuliForArithmeticGeometry:A0-extension`: Export proper coherent cohomology finiteness/perfectness for proper flat finite-presentation schemes, its cohomological dimension bound, proper derived coherent Künneth, and the coherent Serre-duality/vanishing input for the weak Lefschetz proof. A0-extension explicitly owns higher-dimensional proper-flat coherent cohomology; extend its contract with the required derived Künneth and coherent-duality statements. Used by `CrystallineCohomology:CR.3/proper-perfectness`, `CrystallineCohomology:CR.3/kunneth`, `CrystallineCohomology:CR.3/weak-lefschetz`.
9. `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`: Finite flat groups and integral p-adic Hodge theory, Part II: identify H¹_crys of an elliptic curve with the contravariant Dieudonné module of its p-divisible group, preserving crystalline Frobenius and perfect-field base change. Existing elliptic-dieudonne/dieudonne-slopes nodes supply classification; this requests only the realization comparison. Used by `CrystallineCohomology:CR.3/torsion-and-models`.
10. `AInfCohomology:AI.0`: Export the existing Witt ring and truncated Witt carrier with canonical divided powers on VW_(r−1)(R), degree-zero strict-algebra Witt reconstruction, the arbitrary-base Witt étale/pushout theorem of BMS1 10.4/BLM5.4.1, and the finitely generated ideal/topology comparisons of BMS1 10.1. These are generic Witt-ring results, not a second Witt construction in CR.4. Used by `CrystallineCohomology:CR.4/saturated-de-rham-witt`, `CrystallineCohomology:CR.4/relative-witt-complex`, `CrystallineCohomology:CR.4/witt-localization-descent`.
11. `PerfectoidQuotients:Q0:integral-algebra`: Supply the integral perfectoid ring carrier and the Witt coefficient Tor-independence used in BMS1 Lemma3.13/Remark3.19 for V^uW_(r−u)(A) under A→A′. If this requires more than the current foundational contract, make the extension PerfectoidQuotients, Part II; do not assume arbitrary Witt modules are flat. Used by `CrystallineCohomology:CR.4/perfectoid-base-change`.
12. `DerivedDeRhamCohomology:DD.3`: Export the existing smooth Cartier node and the regular-Noetherian F_p Popescu approximation, together with finite-length ordinary-form/Cartier filtered-colimit compatibility sufficient for Shiho§2 and the classical/saturated regular comparison. Popescu itself is generic and remains with its supplier. Used by `CrystallineCohomology:CR.4/classical-regular-comparison`, `CrystallineCohomology:CR.4/logarithmic-witt-sequences`.
13. `VectorBundlesAndIsocrystals:VB0`: Supply the isocrystal slope decomposition over perfect fields and the fact that Frobenius-equivariant maps between disjoint slope intervals vanish. Reuse pinned Mathlib WittVector.isocrystal_classification where its field/algebraic-closure hypotheses suffice, and extend to the exact perfect-field descent needed here. Used by `CrystallineCohomology:CR.4/witt-slope-spectral-sequence`.
14. `EnhancedDerivedSheaves:E2`: Export pro-étale exact inverse limits for the surjective logarithmic Witt systems, with the repleteness hypothesis of BMS2 Proposition8.4 and the change of étale/pro-étale topology. If the required replete machinery is owned by E4, link its finer node; retain the distinction from general ordinary inverse limits. Used by `CrystallineCohomology:CR.4/logarithmic-witt-sequences`.
15. `CrystallineCohomology:CR.5:log-algebra`: Supply fine/strictly semistable log schemes and log differential forms on the standard W°,W[t]° and κ° bases for the DL crystalline Witt models. These are the existing log owner’s objects, not new CR.4 log carriers. Used by `CrystallineCohomology:CR.4/semistable-log-witt-models`.
16. `CrystallineCohomology:CR.5`: Supply log PD envelopes, admissible embedding systems and their log PD Poincaré/descent comparison for DL AppendixB.2’s finite-level pro-models. CR.4 constructs only the resulting Witt models; CR.6 supplies monodromy and Hyodo–Kato. CR.5 requires CR.0/CR.2/log algebra, so this import introduces no CR.4→CR.5 reverse prerequisite. Used by `CrystallineCohomology:CR.4/semistable-log-witt-models`.
17. `PadicDifferentialEquationsAndRigidCohomology:RD.3`: Extend Rigid cohomology, Part II with the convergent log de Rham–Witt ω,ω̃,ω⁺ objects and the tube proper-support functor of DL AppendixB.2/LemmaB.3, including its precise comparison maps to the étale Witt objects. RD.3’s overconvergent coefficient contract alone does not identify these convergent objects; preserve that distinction. Used by `CrystallineCohomology:CR.4/semistable-log-witt-models`, `CrystallineCohomology:CR.4/log-witt-proper-support`.
18. `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`: Use the existing finite-field elliptic curve and ordinary/supersingular geometric classification as an upstream input; no new elliptic curve theory is planned here. Used by `CrystallineCohomology:CR.3/torsion-and-models`.

## Sources and version boundaries

Hashes identify the acquired bytes, not a claim that every page was read. The exact read ranges below and the gates in the stage continuations determine the scope.

### The Stacks Project Authors — Divided Power Algebra

[Live text accessed 2026-09-26; dpa.tex at a04446e57ec1fbc252a871afcec7752fb2807b14](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/dpa.tex); accessed 2026-09-26. SHA-256 `1e4ed7cee878c185ea5284e176241d3428a398a25b28a56c44869c1b59f090ed`.

- Definition23.2.1; complete proofs of Lemmas23.2.4–5 and23.4.2; complete §23.5 including polynomial basis, universal property and infinite variables. Canonical powers on arbitrary-module Γ require the recorded quotient-stability certificate.

### The Stacks Project Authors — Crystalline Cohomology

[Live Sections60.2 and60.6; crystalline.tex at a04446e57ec1fbc252a871afcec7752fb2807b14, with chapter PDF collated2026-09-27](https://raw.githubusercontent.com/stacks/stacks-project/a04446e57ec1fbc252a871afcec7752fb2807b14/crystalline.tex); accessed 2026-09-27. SHA-256 `466c0634a5e8e3899b157a42a4b4bb5f4357199f96708caf5854f5a92be58054`.

- Locked TeX §§60.2–26 read, including §60.25 purely inseparable pullback/integration and §60.26 Frobenius. Section60.24 proof hints are not a perfectness proof certificate.

### Bhargav Bhatt, Jacob Lurie, Akhil Mathew — Revisiting the de Rham–Witt complex

[arXiv:1805.05501v3, 19 February2020; newly downloaded158-page PDF](https://arxiv.org/pdf/1805.05501v3); accessed 2026-09-26. SHA-256 `533f9073572ccefa893706a39b8792b55cb313886e402a7eb6d4c22271687753`.

- Version3: §§2.6–2.9,3.1,3.3–3.6,4.1–4.4,5.1–5.3,7.2–7.5 read;5.4 initial Witt étale proof,6.3 singular example and10.1 theorem/deduction read.5.5 and10.2–10.4 proof interiors remain gates; Nygaard is sourced to fully read BMS2§8.1.

### Bhargav Bhatt, Jacob Lurie, Akhil Mathew — Revisiting the de Rham-Witt complex

[Astérisque424(2021), publisher PDF178pages including front matter](https://smf.emath.fr/system/files/filepdf/smf_ast_424.pdf); accessed 2026-09-26. SHA-256 `fd87e547f9d769f60de623f8708ded7b9fe2b5953d5c0c8281ad44f71e05ca22`.

- Printed p.16, PDF page24, Remarks2.3.3–4 and adjacent text; Remark2.3.4 visually inspected for the source finding. The rest of the published volume was not reread.
- Continuation27September2026: hash-verified reuse of the acquired publisher PDF; printedpp.22–23 (PDFpages30–31) read and rendered, including2.6.2–5 and2.7.1.
- 2026-10-06: printed pp.88 and96, Propositions7.2.4 and7.5.3 proof paragraphs read and rendered for source collation.

### Bhargav Bhatt, Jacob Lurie, Akhil Mathew — Revisiting the de Rham-Witt complex

[Author-hosted141-page copy downloaded 2026-09-26; not identified with arXivv3 or the published text](https://www.math.ias.edu/~lurie/papers/Crystalline.pdf); accessed 2026-09-26. SHA-256 `dad4e554ad5847a9c7410a42d8d4f8eb37afffae643ed55ccdf11471278ece0d`.

- Printed p.16, Remark2.3.4, to collate the displayed differential calculation. A distinct forward-direction misprint here is corrected in arXivv3 and the published text.

### Bhargav Bhatt — p-adic derived de Rham cohomology

[arXiv:1204.6560, acquired PDF](https://arxiv.org/pdf/1204.6560); accessed 2026-10-06. SHA-256 `e5ca4056c89eaed462a12038c29d5c3b0a7e06d02d18a7db6dfdf1cfe9f4f00f`.

- §3.3 Lemmas3.37–3.38/Corollary3.40 read; only classical PD-side lemmas owned here. §9 Notation9.1 through Proposition9.9 and Remark9.10, including proofs, read for the Fontaine envelope. Derived period comparison remains DD.4/AI.0.

### Andreas Langer and Thomas Zink — De Rham–Witt cohomology for a proper and smooth morphism

[Author manuscript, July2003, 107pages](https://www.math.uni-bielefeld.de/~zink/dRW.pdf); accessed 2026-10-06. SHA-256 `50410e7d5fa13c4e76786fb0e2a3e215b6735549cf9365c81cb5d2d5dd834905`.

- Author July2003 manuscript: §§1.1–1.5,2.2 basic definitions/operator formulas,2.5 Proposition2.17 full proof,3.1–3.3 comparison,3.4 scaled Frobenius and3.5 flat coefficients/full Lemma3.9 proof read.2.3–2.4 generation/product interiors remain a gate. Displays at the end of3.4 belong to R07.

### Bhargav Bhatt, Matthew Morrow, Peter Scholze — Integral p-adic Hodge theory

[Author-hosted PDF](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf); accessed 2026-10-06. SHA-256 `80b0b525752501bf0834f09595a93209969d2f91a97d9a000783a21a0ce10420`.

- §10 read completely;§11 introduction is the AI.4 boundary. Theorem2.10 cohomological torsion proof and full Lemma2.12 weak Lefschetz proof read;2.1–2.7 geometric inputs remain a gate. Definition3.22 and§14.1 statement/proof screened for the A_cris/crystalline boundary.

### Bhargav Bhatt, Matthew Morrow, Peter Scholze — Topological Hochschild homology and integral p-adic Hodge theory

[Publications Mathématiques de l’IHÉS129(2019), public publisher PDF](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf); accessed 2026-10-06. SHA-256 `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`.

- §8.1 read completely. §8.2 belongs to DD.4 and is imported, not reconstructed.

### Hélène Esnault and Michael Groechenig — Rigid connections and F-isocrystals

[Author-hosted Acta Mathematica225(2020) manuscript](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf); accessed 2026-10-06. SHA-256 `0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35`.

- §2.6 and§7 End⁰ crystalline/de Rham comparison paragraph read. Katz and p-curvature assertions retain CartierFlows ownership.

### Pierre Berthelot and Arthur Ogus — Corrigendum to Appendix B of Notes on Crystalline Cohomology

[21August2013, two-page correction](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf); accessed 2026-10-06. SHA-256 `7a31ee9881433d3db283bbfcdfbba23e39e53acd919d9230a054cc3c3bc8fc0a`.

- Both pages read completely, including the surjective replacement and the distinction between a derived isomorphism and an actual quasi-isomorphism to the original tower.

### Torsten Ekedahl — On the multiplicative properties of the de Rham–Witt complex I

[Arkiv för Matematik22(1984),185–239, public archive PDF](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf); accessed 2026-10-06. SHA-256 `f8d748a7ccef663960ff431a0d632d13122f515938fb68a1b19703002c06dbe5`.

- Introduction/§0; I.2–3 trace construction and I.3.4–I.4 tail portions; I.5 complete;II Theorem2.2 statement/Corollary2.2.23 proof read. Unread I.1/I.3 interiors and Berthelot VI/VII references remain the trace/purity proof gate.

### Atsushi Shiho — On logarithmic Hodge–Witt cohomology of regular schemes

[Journal of Mathematical Sciences, University of Tokyo14(2007),567–635](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf); accessed 2026-10-06. SHA-256 `510b1918c021da4030ecf0f281ae7c90f1071c2f7eeebb5723c78ea1db9cdbad`.

- §2 through Corollary2.13, including all reduction arguments, read completely. Purity and Gersten results are outside this part.

### Dustin Clausen, Akhil Mathew, Matthew Morrow — K-theory and topological cyclic homology of henselian pairs

[Author-hosted JAMS34(2021) manuscript](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Clausen%2C%20Mathew%2C%20Morrow%2C%20K-theory%20and%20TC%20of%20Henselian%20pairs.pdf); accessed 2026-10-06. SHA-256 `68fab6b1e08b9584af74c6540a1f9101f4ff3bce96955111d719f4a202de4eb2`.

- §5.3, especially Definitions5.25–26 and the Illusie pro-sheaf sequence read. K-theory/TC comparison is owned by other roadmaps.

### Daniel Disegni and Yifeng Liu — A p-adic arithmetic inner product formula

[arXiv:2204.09239v3](https://arxiv.org/pdf/2204.09239v3); accessed 2026-10-06. SHA-256 `1f759774cdbf8700c5978b6ea45c1bf63c99b993136a82a45a907320fef53bfa`.

- AppendixB.2 read completely. CR.4 owns only the Witt models; log-crystalline sites and monodromy are requested from CR.5/6.

## Source corrections

These findings remain pending independent verification. “New” records a bounded search that found no correction, not an exhaustive novelty claim. Langer–Zink findings refer to the July 2003 author manuscript; its journal version was not acquired. The corrected formulas are used by the mathematical nodes.

### CrystallineCohomology/E1 — misprint

Source `stacks-dpa`: Lemma23.5.3(tag07GS), proof, final p-adic-digit display; live text 2026-09-26. Reach: the proof.

Printed: “ε_n(f)=c_n f^{a₀} γ_p(f)^{a₁} ⋯ γ_p^e(f)^{a_e}”.

Correction: Replace each γ_p acting on f by ε_p.

Reason: Here f lies in the augmentation ideal of Z_(p)⟨u,v⟩, whose PD structure is ε. The constructed γ acts on I⊂A, so γ_p(f) has the wrong domain. The corrected formula is the digit expansion applied in the source PD ring.

Known correction: new

Correction search: Live Stacks pages07GS,07HC,07HE and their displayed comments; the source files at commit a04446e57ec1fbc252a871afcec7752fb2807b14 still contain the quoted text.; Stacks07GS comments9550/10285 concern the redundancy of condition(1);07HC comments concern a separate corrected sign.; Stacks history pages for07GS/07HC were attempted but the browser returned cache-miss errors; no exhaustive history search or novelty claim is made.; The atlas source-issue register was screened for these source locators..

### CrystallineCohomology/E2 — misprint

Source `stacks-dpa`: Lemma23.5.3(tag07GS), proof, n=p generator-reduction sentence; live text 2026-09-26. Reach: the proof.

Printed: “properties (1) and (3)”.

Correction: The referenced properties are (2) and (3): scalar homogeneity and the addition formula.

Reason: To extend equality of the two p-th operators from ideal generators to their scalar multiples one uses δ(ax)=a^pδ(x), which is condition(2); addition is condition(3). Condition(1) does not permit cancellation of p! in a torsion ring.

Known correction: new

Correction search: Live Stacks pages07GS,07HC,07HE and their displayed comments; the source files at commit a04446e57ec1fbc252a871afcec7752fb2807b14 still contain the quoted text.; Stacks07GS comments9550/10285 concern the redundancy of condition(1);07HC comments concern a separate corrected sign.; Stacks history pages for07GS/07HC were attempted but the browser returned cache-miss errors; no exhaustive history search or novelty claim is made.; The atlas source-issue register was screened for these source locators..

### CrystallineCohomology/E3 — misprint

Source `stacks-crys`: Lemma60.2.4(tag07HC), proof, second family generating K′; live text 2026-09-26. Reach: the proof.

Printed: “t′, t ∈ I”.

Correction: The indices t′ and t range over T.

Reason: T indexes the chosen elements f_t and variables x_t. I is a ring ideal, not the indexing set of these variables.

Known correction: new

Correction search: Live Stacks pages07GS,07HC,07HE and their displayed comments; the source files at commit a04446e57ec1fbc252a871afcec7752fb2807b14 still contain the quoted text.; Stacks07GS comments9550/10285 concern the redundancy of condition(1);07HC comments concern a separate corrected sign.; Stacks history pages for07GS/07HC were attempted but the browser returned cache-miss errors; no exhaustive history search or novelty claim is made.; The atlas source-issue register was screened for these source locators..

### CrystallineCohomology/E4 — misprint

Source `stacks-crys`: Lemma60.2.7(tag07HE), proof after display(60.2.7.1); live text 2026-09-26. Reach: the proof.

Printed: “By assumption (1)”.

Correction: Use assumption(2) to conclude that the images f′_t generate J′/I′.

Reason: Condition(2) is J′=JB′+I′. Condition(1) only says B/I→B′/I′ is flat and alone does not control J′.

Known correction: new

Correction search: Live Stacks pages07GS,07HC,07HE and their displayed comments; the source files at commit a04446e57ec1fbc252a871afcec7752fb2807b14 still contain the quoted text.; Stacks07GS comments9550/10285 concern the redundancy of condition(1);07HC comments concern a separate corrected sign.; Stacks history pages for07GS/07HC were attempted but the browser returned cache-miss errors; no exhaustive history search or novelty claim is made.; The atlas source-issue register was screened for these source locators..

### CrystallineCohomology/E5 — misprint

Source `blm-published`: Remark2.3.4, last displayed calculation in prose, printed p.16/PDF page24 of Astérisque424(2021); also present in arXivv3 p.16. Reach: the proof.

Printed: “d(F^{−n}x)=p^{−r}F^{−r}d(F^{r−n}dx)”.

Correction: Delete the inner d: d(F^{−n}x)=p^{−r}F^{−r}d(F^{r−n}x).

Reason: The printed right side applies d twice, lies one degree too high, and vanishes by dF^k=p^kF^k d and d²=0. The preceding sentence gives d(F^{r−n}x)∈p^rM, exactly the corrected numerator. The source theorem is unchanged.

Known correction: new

Correction search: arXiv1805.05501 version history and v3 PDF; SMF Astérisque424 landing page and complete downloadable publisher PDF, targeted to printed p.16.; Lurie and Mathew author publication pages and the linked141-page author copy; no separate corrigendum was found in this targeted search.; The atlas source-issue register was screened for BLM/de Rham–Witt entries; novelty is not established..

### CrystallineCohomology/E6 — misprint

Source `blm-author`: Remark2.3.4, forward-direction calculation, printed p.16 of the141-page author copy at the recorded URL. Reach: the proof.

Printed: “F^{r−n}dx=p^nF^{r−m}dz”.

Correction: Delete d before z: F^{r−n}dx=p^nF^{r−m}z.

Reason: The preceding equality is F^{−n}dx=p^nF^{−m}z; applying F^r yields the corrected formula without a new differential. This distinct slip is absent from the revised forward argument in arXivv3 and Astérisque424.

Known correction: Corrected by the rewritten forward-direction argument in arXiv1805.05501v3 and Astérisque424(2021), Remark2.3.4.

Correction search: arXiv1805.05501 version history and v3 PDF; SMF Astérisque424 landing page and complete downloadable publisher PDF, targeted to printed p.16.; Lurie and Mathew author publication pages and the linked141-page author copy; no separate corrigendum was found in this targeted search.; The atlas source-issue register was screened for BLM/de Rham–Witt entries; novelty is not established..

### CrystallineCohomology/E7 — misprint

Source `blm-published`: Proof of Proposition2.6.2, verifying axiom(6), printedp.22 of Astérisque424; also arXivv3p.22. Reach: nothing.

Printed: “so that have”.

Correction: Insert we: so that we have.

Reason: The sentence introduces the lifted equality for a chosen representative; its subject is missing. Confirmed in the rendered published page and in the preprint text.

Known correction: new

Correction search: Current atlas source-issue register and inherited E1–E6, screened27September2026.; arXiv:1805.05501 version history lists v3 as its final version.; SMF Astérisque424 publication page; Lurie and Mathew publication pages; bounded search for a BLM erratum or correction..

### CrystallineCohomology/E8 — misprint

Source `blm-published`: Proof of Proposition2.6.5, final sentence, printedp.23 of Astérisque424; also arXivv3p.23. Reach: nothing.

Printed: “is determines”.

Correction: Delete is: determines.

Reason: The compatible sequence is the subject of determines; the extra verb is grammatical, with no change to the construction. Confirmed in the rendered published page and in the preprint text.

Known correction: new

Correction search: Current atlas source-issue register and inherited E1–E6, screened27September2026.; arXiv:1805.05501 version history lists v3 as its final version.; SMF Astérisque424 publication page; Lurie and Mathew publication pages; bounded search for a BLM erratum or correction..

### CrystallineCohomology/E501 — misprint

Source `stacks-crys`: Lemma60.6.3 (07HT), final composition in its proof, chapter PDF p.13; crystalline.tex at a04446e57ec1fbc252a871afcec7752fb2807b14, line1051.. Reach: nothing.

Printed: “B → K/K² + (K ∩ J(1))^[2] → M”.

Correction: The middle object is K/(K² + (K ∩ J(1))^[2]), with the entire sum in the denominator.

Reason: The statement and the first displayed derivation already use this quotient, and the preceding construction factors through precisely this denominator. Comment8697 and the linked correction9f6cc4fd819ec0498a45fa2fb727b4f1e4c8657d fix the earlier occurrence only; inspection of the actual patch and the current source shows that this final composition still lacks the parentheses.

Known correction: new

Correction search: Stacks Section60.6 (07HQ) and the individual07HT/07HW pages, including the complete displayed comments, accessed2026-09-27.; Current crystalline.tex at a04446e57ec1fbc252a871afcec7752fb2807b14, and chapter PDF pages12–14, freshly acquired and visually checked2026-09-27.; Bounded public searches for the quoted wording and a correction of the indicated lemma; no matching correction of the remaining occurrence was located. This is not a claim to have searched all source history.; Comments8697 and9375 and the actual GitHub patch9f6cc4fd819ec0498a45fa2fb727b4f1e4c8657d; related partial correction distinguished from the remaining final occurrence..

### CrystallineCohomology/E502 — misprint

Source `stacks-crys`: Lemma60.6.6 (07HW), second proof, final paragraph, chapter PDF p.14; current crystalline.tex line1186.. Reach: nothing.

Printed: “it suffices to divided”.

Correction: it suffices to divide

Reason: After “suffices to”, the infinitive is “divide”; the indicated quotient operation is unchanged. The current TeX and PDF retain the same grammatical slip.

Known correction: new

Correction search: Stacks Section60.6 (07HQ) and the individual07HT/07HW pages, including the complete displayed comments, accessed2026-09-27.; Current crystalline.tex at a04446e57ec1fbc252a871afcec7752fb2807b14, and chapter PDF pages12–14, freshly acquired and visually checked2026-09-27.; Bounded public searches for the quoted wording and a correction of the indicated lemma; no matching correction of the remaining occurrence was located. This is not a claim to have searched all source history..

### CrystallineCohomology/E503 — misprint

Source `stacks-crys`: Lemma60.6.6 (07HW), second proof, end of the flat case and end of the general case, chapter PDF p.14; current crystalline.tex lines1171 and1188.. Reach: nothing.

Printed: “Ω_(B/A) ⊗_A D; Ω_(P/A) ⊗_A B”.

Correction: The tensor bases in these two expressions are B and P respectively: Ω_(B/A) ⊗_B D and Ω_(P/A) ⊗_P B.

Reason: The first is the very source of the preceding map and agrees with the lemma statement. The second is the quotient-differentials presentation for P→B used in the cited Algebra Lemma10.131.9 (00RU), whose full statement and proof were read. Taking P=B=ℚ[t] with zero kernel already distinguishes tensoring over ℚ from tensoring over P. These are local base-label slips in an argument whose surrounding formulas identify the intended modules.

Known correction: new

Correction search: Stacks Section60.6 (07HQ) and the individual07HT/07HW pages, including the complete displayed comments, accessed2026-09-27.; Current crystalline.tex at a04446e57ec1fbc252a871afcec7752fb2807b14, and chapter PDF pages12–14, freshly acquired and visually checked2026-09-27.; Bounded public searches for the quoted wording and a correction of the indicated lemma; no matching correction of the remaining occurrence was located. This is not a claim to have searched all source history.; The cited Algebra Lemma10.131.9 (00RU), including its quotient exact sequence and proof, accessed2026-09-27..

### CrystallineCohomology/E504 — misprint

Source `stacks-crys`: Lemma60.24.1 proof, locked crystalline.tex line4757, regular-sequence quotient after the displayed PD polynomial algebra. Reach: nothing.

Printed: “ξ_1-f_1, …, ξ_n-f_n”.

Correction: Use ξ_1-f_1, …, ξ_c-f_c.

Reason: The algebra has n ordinary variables and exactly c PD variables; the quotient relations are indexed by the c generators of J.

Known correction: new

Correction search: Locked Stacks TeX at a04446e57ec1fbc252a871afcec7752fb2807b14 and current tag07N0, accessed2026-10-06; current Frobenius formula still has det(M).; Bounded source-register and Stacks issue/erratum web search on2026-10-06; no correction located..

### CrystallineCohomology/E505 — misprint

Source `stacks-crys`: §60.26, remark-F-crystal-variants, three determinants in the bounded-rank matrix argument; locked TeX line5565 and current tag07N0. Reach: nothing.

Printed: “det(M)”.

Correction: Replace all three det(M) occurrences by det(K).

Reason: Only K,L are the rank-r matrices, with KL=p^i I and det(K)det(L)=p^(ri). M is undefined. The corrected adjugate computation gives the required two-sided p-power inverse.

Known correction: new

Correction search: Locked Stacks TeX at a04446e57ec1fbc252a871afcec7752fb2807b14 and current tag07N0, accessed2026-10-06; current Frobenius formula still has det(M).; Bounded source-register and Stacks issue/erratum web search on2026-10-06; no correction located..

### CrystallineCohomology/E506 — misprint

Source `lz-relative`: Author July2003 manuscript, equation(1.27) printedp.22 and repeated prose printedp.23; both pages rendered. Reach: nothing.

Printed: “FdVω = ω”.

Correction: FdVω = dω.

Reason: F,V preserve degree while d raises it. The printed equality has unequal form degrees; the defining F–V relation and the surrounding calculation require dω.

Known correction: new

Correction search: Zink author homepage and publication list; July2003 dRW.pdf on2026-10-06. The journal version was not obtained, so findings are scoped to this author manuscript.; Targeted Langer–Zink de Rham–Witt erratum searches on2026-10-06; no separate correction located..

### CrystallineCohomology/E507 — misprint

Source `lz-relative`: Author July2003 manuscript, Proposition2.5 proof printedp.41; rendered PDFpage42; compare §1 equation(1.16). Reach: nothing.

Printed: “V(ω₀dω₁…dωᵣ) = Vω₀ dVω₀ dVω₁…dVωᵣ”.

Correction: Delete the extra dVω₀: Vω₀ dVω₁…dVωᵣ. In equation(1.16), the final index n should likewise match r.

Reason: The displayed right side has one extra differential and wrong total degree. Repeated projection formula and FdV=d give precisely r differentiated factors, indexed1,…,r.

Known correction: new

Correction search: Zink author homepage and publication list; July2003 dRW.pdf on2026-10-06. The journal version was not obtained, so findings are scoped to this author manuscript.; Targeted Langer–Zink de Rham–Witt erratum searches on2026-10-06; no separate correction located..

### CrystallineCohomology/E508 — misprint

Source `blm-published`: Astérisque424 printedp.88 Proposition7.2.4, first sentence of proof; also arXivv3 same locator; rendered PDFpage96. Reach: nothing.

Printed: “N as the derived p-completion of N”.

Correction: N as the derived p-completion of M.

Reason: The map M→N has derived-p-complete target and mod-p equivalence, hence exhibits N as the completion of its source M. The printed conclusion merely repeats target completeness.

Known correction: new

Correction search: ArXiv1805.05501 version history and v3; publisher Astérisque424 PDF, all accessed2026-10-06.; Scholze publication page and targeted publisher/author erratum search on2026-10-06; no correction located. Lurie directory listing was unavailable; no claim of exhaustive novelty..

### CrystallineCohomology/E509 — misprint

Source `blm-published`: Astérisque424 printedp.96 Proposition7.5.3 proof, paragraph comparing cocycles; also arXivv3; rendered PDFpage104. Reach: nothing.

Printed: “cohomologous r-cocycles; w ∈ H^(−r−1) Hom(M*,N*)”.

Correction: Use cohomologous (−r)-cocycles and w ∈ Hom(M*,N*)^(−r−1), a cochain.

Reason: The cocycles live in degree−r. Their difference is dw, which needs a cochain of degree−r−1, not a cohomology class on which the differential vanishes.

Known correction: new

Correction search: ArXiv1805.05501 version history and v3; publisher Astérisque424 PDF, all accessed2026-10-06.; Scholze publication page and targeted publisher/author erratum search on2026-10-06; no correction located. Lurie directory listing was unavailable; no claim of exhaustive novelty..

### CrystallineCohomology/E510 — misprint

Source `bms2`: Published Numdam IHÉS129(2019), Proposition8.4 proof, boundary-degree sentence on printedp.267; rendered PDFpage69. Reach: nothing.

Printed: “If i=n−1”.

Correction: If i=n+1 (equivalently n=i−1).

Reason: The paragraph assumes n<i and treats the boundary exponent i−1−n=0. This forces n=i−1. The formula for the filtration itself is correct.

Known correction: new

Correction search: Numdam published version and targeted BMS2 Nygaard Proposition8.4 erratum search on2026-10-06.; Scholze publication page, accessed2026-10-06; no separate correction located..

## Exact prototype inventory

The elaborated forms include 102 named node declarations, 132 API entries and 120 named examples. These counts include the qualified components described in the declaration register. 48 named node forms, 52 API entries and 55 test forms remain omitted. Every omitted name and mathematical contract appears in the suggested file's comment register; it is outside the compilation claim.

No carrier with unspecified conclusions or proposition-valued substitute is introduced for a missing condition. The higher-form, crystal, derived-image, duality, filtered-η and logarithmic forms require the actual supplier objects and source certificates enumerated above.
