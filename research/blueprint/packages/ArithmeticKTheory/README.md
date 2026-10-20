# Roadmap: arithmetic K-theory of number fields and S-integers

**Summary.** Build the arithmetic of Quillen K-groups from the existing rings
of S-integers, class groups and units, through localization and Quillen's rank
filtration, to integral structure theorems and independently certified
computations. The endpoints are finite generation, the odd integral tables,
even primary and wild-kernel descriptions, Bott-inverted arithmetic tables,
regular-prime consequences, and tame-kernel certificates for the Gaussian and
golden fields. The same finite-type argument gives the arithmetic finiteness
inputs for symmetric, quadratic and genuine hermitian K-theory.

## Scope and ownership

This roadmap owns arithmetic specialization and assembly. General exact-category
K-theory, localization, coefficients and transfer belong to
GeneralAlgebraicKTheory; general scheme localization belongs to
SchemeKTheoryOperations, Layer S.3. KTheoryLowDegrees owns the rank–Picard
description of K₀, determinant and S-unit comparisons for K₁, and the first
low-degree computations. K2SymbolsBrauer owns Matsumoto symbols, tame and real
sign symbols, the degree-two tame-kernel sequence, and K₂ of ℤ and ℚ. Their
theorems are inputs here, rather than additional constructions of those objects.

BorelRegulators, Layers R.1 and R.3, owns buildings, orientation-correct
Steinberg finiteness and the rational rank theorem for orders. Here the
rank-filtered Q-space assembles finite generation and extends ranks to finite
S. MotivicEtaleKTheory owns twists, descent and real-place corrections;
ArithmeticGaloisDuality owns Kummer, Brauer and Poitou–Tate calculations;
KTheoryFiniteLocalFields owns local K-groups and completion. Arithmetic
structure, map identification, exceptional cases and arithmetic certificates
are assembled here. The full Chern/regulator family is not a prerequisite for
the first torsion descent edge.

Hermitian carriers and fibre sequences belong to
HermitianKTheoryOfPoincareCategories and the quadratic-arithmetic roadmaps.
IntegralIwasawaTheory owns cyclotomic foundations, Kummer congruences,
reflection and Vandiver's conjecture. This roadmap uses those inputs for finite
cyclotomic K-groups; it does not build another Iwasawa theory. The arithmetic
K₃ results below precede the downstream decomposable and indecomposable
analysis. Both bounds of the independent golden-field certificate are proved
without a special-value formula. The applications are listed under
Downstream consumers.

The general rings, valuations, finite extensions, class groups, local Galois
objects, quadratic forms and integral lattices already provided by Mathlib,
Tau Ceti and the current TauCetiRoadmap are used through their existing APIs.
In particular NumberFieldArithmetic supplies general quadratic-field arithmetic,
and `TauCeti.NumberField.Sqrt5` already supplies the golden field’s integral
basis, signature, principal ideals, class number, dyadic prime and fundamental
unit. Those are inputs to the K₂ certificate, rather than targets of this
roadmap. IntegralLattices supplies lattice infrastructure; LocalGaloisGroups and
ProfiniteArithmetic supply local and profinite arithmetic; ClassFieldTheory
supplies the class-formation interfaces. No replacement for those roadmaps is
introduced. Smooth curves over finite fields, arithmetic K-theory Part II,
regulators and special-value proofs lie outside the present scope.

## Conventions

Write F for a number field, A for its ring of integers, and S for a set of
**finite** primes. Except where arbitrary S is expressly allowed, S is finite.
Put O = O_(F,S). Thus ℤ[1/p] has one prime in S; infinite places are counted by
r₁ and r₂, not by |S|. The unit rank is r₁+r₂+|S|−1. For a general Dedekind
domain R, its field of fractions is denoted K and its height-one spectrum by
Spec¹(R); a field has empty height-one spectrum.

K_n denotes the actual connective Quillen group, with n≥0 unless a different
spectrum is specified. Write K_n(R;ℤ/m) for spectrum coefficients, and K^β for
Bott-inverted K-theory. Periodic Bott degrees and periodic L-degrees are
integers. Negative ordinary connective K-groups are not assigned the periodic
table. The additive notation for K-groups makes a ramification factor e a
multiple e·x; in multiplicative residue-unit notation it becomes x^e.

Pullback is extension of scalars; transfer is restriction of scalars for a
finite projective algebra. For a finite extension E/F, the upper set T is
exactly the primes over S whenever a finite-projective S-integer extension is
used. For a residue field k(v), its absolute norm is q_v=#k(v).

The localization boundary β on K₂ is normalized by β{π,u}=ū. Consequently
β{u,π}=ū⁻¹. The symbol t_v used in Tate's unit-symbol filtration is the inverse
boundary, with t_v{u,π}=ū, as in K2SymbolsBrauer. Both occur below and their
comparison is always explicit. Over a DVR,

```text
β_v{a,b} = (−1)^(v(a)v(b)) · overline(b^v(a)/a^v(b)),
t_v = β_v⁻¹.
```

Tate twists are the supplier's étale/Galois twists, with negative twists given
by duals. In particular ℚ/ℤ(i) is not an ordinary tensor power of ℚ/ℤ. Put
W_i(F)=H⁰(F,ℚ/ℤ(i)); its order w_i(F) is used only when this group is finite.
The primary order w_i^(ℓ) means the order of the ℓ-primary subgroup, not its
ℓ-rank. Cohomology of O with ℓ-adic coefficients means the supplier's continuous
cohomology of Spec O; in comparison formulas ℓ is inverted first. Inverse
limits and real-place modifications remain explicit.

For an abelian group A, `div A` means the subgroup of elements in mA for every
positive integer m. It need not be a divisible group. The notation ℤ/d includes
the trivial group at d=1. A displayed free-plus-torsion decomposition is an
abstract group isomorphism unless a particular map is identified. All divisions
by 2 in Adams projectors occur over ℤ/p^r with p odd. Bernoulli numbers B_n use
Mathlib's B₁=−1/2; Weibel's positive reindexing is treated separately in Layer 7.

## Exact supplier contracts

### From Mathlib and Tau Ceti

At the pinned APIs, `Set.integer` gives the S-integer subalgebra and `Set.unit`
its units. `Set.unitEquivUnitsInteger` identifies the unit carriers. Use
`IsDedekindDomain.HeightOneSpectrum`, `IsFractionRing`, `IsLocalization`,
valuation support and the existing finite-extension/integral-closure API.
`ClassGroup`, `ClassGroup.equivPic`, `ClassGroup.extendedHom`,
`NumberField.classNumber` and the finite class group of a number ring supply
the arithmetic class data. Tau Ceti's `ClassGroup.relNorm` and
`ClassGroup.relNorm_extendedHom` supply ideal norms and their degree composite.

For S-integers use Tau Ceti's `integerHeightOneSpectrumEquiv`,
`valuation_integerHeightOneSpectrumEquiv`, `integer_extendedHom_surjective`,
`ker_integer_extendedHom`, `integerClassGroupEquiv`,
`finite_integer_classGroup`, `Set.unit_mono`, `Set.unitValuation_ker`, and
`Set.unit_fg_of_units`. The last result supplies finite generation for finite
S, not an S-unit rank formula. The existing class-group quotient and unit
valuation maps are reused; their K-theoretic interpretation is what Layer 2
adds.
The current Tau Ceti library also provides `CategoryTheory.ExactStructure`,
`TauCeti.ExactK0` and `TauCeti.ExactK0.liftEquiv` (the latter two in
`TauCeti.CategoryTheory.GrothendieckGroup.Exact`), together with exact-functor
maps and the finite-projective-module K₀ carrier. These supply exact-category and
Grothendieck-group infrastructure; their comparison to the genuine higher
Q-space is the general K-theory supplier's responsibility. Neither that
comparison nor the higher arithmetic groups follow merely from K₀'s
presentation universal property.

`Submodule`, categorical full subcategories and nerves, group homology,
relative chain complexes, homotopy groups and tensor products supply the
existing carriers under the rank-filtration interfaces. The comparison of
categorical and topological homology is still a specific homotopy supplier,
not a consequence of the mere existence of `CategoryTheory.nerve`.
`LinearEquiv.ofBijective` packages the actual rationalized localization map.
`AddCommGroup.equiv_free_prod_directSum_zmod` supplies the abstract structure
theorem once finite generation and ranks are known.

`Module.Relations`, its quotient, solutions and presentation API supply finite
linear presentations. In particular use
`Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π` and
`surjective_π_iff_span_eq_top`. `AddSubgroup.index_eq_natAbs_det` supplies the
integer lattice index calculation. Minkowski's lattice point theorem is
`MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`.
These statements do not themselves verify any arithmetic relation or span.

For cyclotomic arithmetic use `CyclotomicField`, `IsCyclotomicExtension`,
`autEquivPow`, the cyclotomic character, roots of unity and the existing unique
prime, ramification and inertia-degree theorems over ℚ. For coefficient
eigenspaces use `Module.End.eigenspace`; ℤ/ℓ character projectors require a
separate group-action construction. `bernoulli`, `bernoulli'`,
`bernoulli_one`, `bernoulli_eq_bernoulli'_of_ne_one` and the
`Bernoulli.vonStaudt_clausen` denominator API are the Bernoulli suppliers.
They do not include the divided-denominator Kummer refinement.

For the golden field, the current Tau Ceti modules
`TauCeti.NumberTheory.NumberField.WorkedExamples.Sqrt5.Basic`, `Invariants`,
`Units` and `RealPlace` supply the arithmetic under an integral generator θ with
`minpoly ℤ θ = X²−X−1` and `Algebra.adjoin ℚ {(θ : F)} = ⊤`.
In namespace `TauCeti.NumberField.Sqrt5`, use `finrank_eq_two`,
`adjoin_eq_top`, `index_eq_one`, `isMonogenic`, `discr_eq_five`,
`isTotallyReal`, `nrRealPlaces_eq_two`, `nrComplexPlaces_eq_zero`,
`isPrincipalIdealRing` and `classNumber_eq_one`.
Use `ncard_primesOver_two_eq_one`,
`ramificationIdx_eq_one_of_mem_primesOver_two` and
`inertiaDeg_eq_two_of_mem_primesOver_two` for the dyadic place. For the unit
coming from θ, `mul_sub_one_eq_one` gives its inverse,
`closure_sup_torsion_eq_top` gives generation modulo torsion, and
`exists_isReal_and_apply_eq_goldenRatio` fixes the positive embedding;
`units_rank_eq_one` supplies the unit rank and `torsionOrder_eq_two` the
order of the roots of unity. These current-library inputs are
consumed after transporting the chosen field model; they are not available as
imports at the older pins used by Suggested.lean.

### From the K-theory and homotopy roadmaps

GeneralAlgebraicKTheory K.1–K.3 supplies exact categories, the genuine
Q-construction, additivity, dévissage, functorial K-groups, finite-projective
transfer and the projection formula. K.7 must supply finite-coefficient
localization, its boundary projection formula, reduction and Bockstein
compatibility. Products at a safe modulus may be reduced to a smaller modulus;
this does not confer a ring structure on arbitrary mod-2, mod-3, mod-4 or mod-8
coefficients.

SchemeKTheoryOperations S.3 supplies the general Dedekind localization sequence,
Cartan comparison, finite-pushforward naturality and the DVR boundary valuation.
KTheoryLowDegrees Z.4 and Z.6 supplies rank–Picard and projective
classification, K₀ of S-integers and K₀(ℤ). Its U.4/U.6 supplies determinant,
vanishing of arithmetic SK₁ and the S-unit rank. K2SymbolsBrauer T.2/T.3/T.5
supplies the exact symbol, residue and tame-kernel results; T.7 supplies the
classical Hilbert norm test. KTheoryFiniteLocalFields L.1 supplies finite-field
K-groups and Bott classes; L.3/L.6/L.7 supplies the degree-two Moore theorem,
local even K-groups, cohomological quotients and completion compatibilities.

StableHomotopyKTheory H.1 supplies category homology, groupoid/classifying-space
comparisons, cellular relative comparisons and filtered-colimit homology. H.3
must supply the **connected** CW H-space finite-type theorem, allowing nonzero
π₁: the space is simple, and finitely generated integral homology in every
degree implies finitely generated homotopy in every degree. A simply connected
version would not suffice for BQ. H.6 supplies coefficients, colimits and
Milnor sequences; its required connective C₂ homotopy-orbit spectral sequence
has finitely generated coefficients and only finitely many terms on each
diagonal. Its coefficient-colimit, Bockstein and localization maps must agree.

### From arithmetic, étale and hermitian roadmaps

BorelRegulators R.1 supplies Steinberg homology finiteness for **every**
projective O_F-lattice, including nonfree ones, using the orientation-correct
coefficient St_n⊗ℤ_χ^(n−1) in duality and finite-index descent. R.3 supplies the
Borel ranks for orders. These are not assertions that arbitrary untwisted
arithmetic-group cohomology is the required integral Steinberg homology.

MotivicEtaleKTheory M.1 supplies twists. M.7 supplies the separably closed
Suslin comparison, real-place correction, dyadic S-integer extensions,
arithmetic comparison ranges, Bott descent and Adams weights. For Layer 5 it
must export the equivariant torsion identification and its coefficient-colimit
and connecting-map compatibilities before the full M.8 Chern family. For
Layer 6 it must export spectrum-level dualization at every odd prime power,
including 3. RefinedTraceMethods RT.4 supplies **real** KO/BO and real Bott
8-periodicity with coefficient connecting maps; complex KU alone is not this
input.

ArithmeticGaloisDuality R02.1/R02.3/R02.4 supplies inverse-limit control,
Kummer, finite H¹/H², the one-inverted-prime Brauer computation and Poitou–Tate.
At odd ℓ the last computation retains the sum-of-local-invariants condition;
one finite place above ℓ then gives Br(O[1/ℓ])[ℓ^r]=0 and
H²(O[1/ℓ],μ_(ℓ^r))=Pic(O[1/ℓ])/ℓ^r. Real 2-torsion cannot be silently dropped.
SelmerIwasawaCohomology L2 supplies strict local conditions, functorial Selmer
kernels and their exact cohomological formulation.

GeometryOfNumbersAndQuadraticArithmetic GN.6 must supply the number-ring Witt
signature theorem: finite signature kernel, image a rank-r₁ sublattice of
ℤ^r₁, finite Picard group and the characteristic-zero injection
W^q(O)→W^s(O). Use Part II DA.0's integral injection and DA.1/DA.3's
symmetric/quadratic tables. HermitianKTheoryOfPoincareCategories HK.5/HK.7/HK.8
supplies genuine Poincaré structures, comparison ranges and the GW–L fibre
sequences, including the exact **nonnegative classical** comparison. A
quadratic comparison starting in degree four cannot supply classical degrees
zero through three.

IntegralIwasawaTheory §§0.1–0.5 supplies cyclotomic fields and actions,
§3.1 the one-prime class-control theorem, §5.4 reflection, and
§§7.1–7.4 Vandiver and its tower consequences. Its current package does
not yet name the finite Kummer/Herbrand–Ribet and congruence exports
required here. Layer 7 states those additional supplier requests, their
proofs and their character conventions explicitly. The conditional integral
table in §7.5 also requires the special-value order formulas of K-book
VI.10.1, p. 527. The detected Harris–Segal
construction and Keune's exact twisted Picard injection are stated with their
specific source-proof requirements below; an abstract isomorphism of finite
groups supplies neither map.

## How to read the build

Layers 1–2 identify the arithmetic rings and maps, and make localization usable
with finite support and ramification. Layer 3 proves finite generation and
extends the rational rank theorem, including its hermitian consequences.
Layer 4 computes the finite cyclotomic invariants that control odd torsion.
Layer 5 identifies the odd groups and their natural torsion maps. Layer 6
handles even groups, real corrections, divisibility, wild kernels, certificates
and Bott degrees. Layer 7 extracts Bernoulli and regular-prime consequences.
Layer 8 supplies computations whose upper and lower bounds can be checked
independently. The README specifies all targets; Suggested.lean records only
the light definitions and signatures available on the pinned carriers.

## Layer 1: S-integers and arithmetic functoriality

### 1.1 Denominators without a principal-ideal assumption

For any Dedekind domain R, fraction field K and arbitrary S⊆Spec¹(R), define
`sUnitSubmonoid S K` as the inverse image of the units of S.integer K under
R→S.integer K. This uses the existing subalgebra, rather than a new definition
of S-integrality. Prove `integer_isLocalization_iff`: for a submonoid M of R,
S.integer K is a localization at M exactly when M≤sUnitSubmonoid S K and every
prime in S meets M. This also identifies any two such presentations over R.
Membership reduces to `IsUnit` in the existing subalgebra; the API includes
1-membership, exclusion of zero, closure under products, monotonicity in S and
the canonical comparison with an arbitrary valid denominator presentation.
(Weibel, K-book, I.3, pp. 21–22, and Exercise I.3.8, p. 29.)

If Cl(R) is torsion, prove
`integer_isLocalization_of_torsion_classGroup`: the full candidate monoid
works for **every** S. For each p∈S choose h>0 with p^h=(a_p). Then a_p
meets p and is a unit away from p. For finite S the product of these a_p gives
a single denominator s with O_S=R[1/s]; no assertion that each p itself is
principal is needed. For number rings the finite class group supplies this
hypothesis. (K-book, I.3, p. 22; VI.8.2, proof, p. 513.)

**Checks.**

- One belongs to the denominator monoid and zero does not. This uses the
  nontrivial fraction-field embedding, including when R is itself a field.
- For R=ℤ, S=∅ the monoid is {±1}; for S={(p)}, p belongs and every different
  rational prime fails membership. Thus support is allowed on S, not outside S.
- At S=Spec¹(R), S.integer K=K and the monoid consists of all nonzero elements.
  The field case has S=∅ and agrees with this description.
- In ℤ[√−5], p=(2,1+√−5) is nonprincipal but p²=(2). With S={p}, inverting 2
  is valid. Requiring a generator of p would reject this example incorrectly.
- Arbitrary S is allowed for the localization criterion; finite generation
  of its units and K-groups will require finite S later.

*Needs:* the existing S-integer subalgebra, valuation support, class-group
torsion and the localization universal property.

### 1.2 Enlarging primes and extending fields

For any Dedekind domain R with torsion class group, fraction field K and
arbitrary S⊆S′, prove that the inclusion S.integer K→S′.integer K agrees
with the inclusion inside K and with the map of denominator presentations.
It is itself a localization, at the images of the candidate denominators
for S′. Specialize this to O_(F,S)→O_(F,S′). These maps are
identity at equal sets and compose in a tower. The inclusion has the expected
effect on units and on height-one primes: exactly the newly inverted primes
disappear. (K-book, V.6.1, p. 406; VI.9.4, p. 519.)

For a finite extension E/F and T the full inverse image of S, prove that
O_(E,T) is the integral closure of O_(F,S) and is finite projective of rank
[E:F]. This remains valid for arbitrary S, since it is a localization of the
finite integral-closure module. Its construction commutes with enlarging S.
Do not allow additional upper primes in the finite-projective statement.
(K-book, I.3, p. 21; V.6.6.3, p. 410.)

**Checks.**

- For ℚ⊂ℚ(i) and S={(2)}, the upper ring is ℤ[i,1/2], with basis 1,i over
  ℤ[1/2].
- At S=∅ the extension is ℤ⊂ℤ[i].
- Inverting an extra prime above 5 upstairs alone destroys integrality over ℤ
  and hence the claimed finite-module structure.
- For an identity field extension, both the prime set and inclusion are
  identities.

*Needs:* §1.1, existing integral closure/localization and finite projective
module criteria over a Dedekind domain.

### 1.3 Low degrees and the Steinitz correction

Use the supplied K₀≅ℤ⊕Pic(O) and K₁≅O× identifications. For finite S,
K₁(O) is finitely generated of rank r₁+r₂+|S|−1. The inclusion into K₁(F)=F×
is the unit inclusion, while F× is not finitely generated. The latter follows
already from independent prime valuations, and is not a failure of the S-unit
theorem. (K-book, VI.8.1, p. 513; the S-unit rank here uses the real-place term
that is missing from that draft's displayed formula.)

Identify pullback and transfer under these low-degree comparisons. For
B=O_(E,T), O=O_(F,S), d=[E:F] and c_B=det_O(B), the formulas are

```text
res₀(n,c) = (n, ext(c)),
tr₀(n,c′) = (d n, Norm(c′) · c_B^n),
res₁(u) = u,                  tr₁(v) = N_(E/F)(v).
```

In particular tr₀res₀ is multiplication by [B]=(d,c_B) in K₀(O); it need not
be multiplication by d. On K₁, tr₁res₁(u)=u^d. Include tower identities,
compatibility with S-enlargement, and the projection formula. The norm on
Picard groups and the determinant-of-restriction formula are the named
comparison targets; their low-degree group carriers come from the suppliers.
(K-book, Exercise II.2.2 and II.2.2(b), p. 78; V.6.6.3–6.6.4, p. 410.)

**Checks.**

- For a free quadratic algebra the transfer of (1,1) is (2,1), and
  tr₁res₁(−1)=1.
- For a nontrivial Steinitz class, transferring (1,1) instead has second
  coordinate c_B, which detects omission of the determinant factor.
- At d=1 all four maps are identities.
- For ℤ[1/p], the units are ±p^n and have rank one; the degree-one rank is
  not the higher Borel-rank function.

### Examples

The two presentations ℤ[1/p] and O_(ℚ,{p}) agree over ℤ and give the same
valuation at every other prime. The nonprincipal prime in ℤ[√−5] illustrates
why the monoid is defined through units rather than chosen prime elements.
The quadratic Gaussian extension fixes the rank, norm and transfer directions.

### Dependencies

Mathlib/Tau Ceti S-integers, ideal classes, integral closure and units;
GeneralAlgebraicKTheory K.2/K.3 for functoriality and transfer;
KTheoryLowDegrees Z.4/U.4/U.6 for the low-degree identifications and unit rank.

## Layer 2: localization with support and ramification

### 2.1 Arithmetic indexing of the localization sequence

Consume the general Dedekind sequence from SchemeKTheoryOperations S.3. For
O=O_(F,S), identify its closed points with finite primes of F outside S and
obtain

```text
… → ⨁_(v∉S) K_n(k(v)) → K_n(O) → K_n(F)
  → ⨁_(v∉S) K_(n−1)(k(v)) → K_(n−1)(O) → … .
```

The arithmetic target is the identification of rings, primes and maps, not a
second general localization theorem. For S⊆T, the relative sequence is indexed
by T∖S. For arbitrary S or T the boundary still has finite support: each
element is represented after inverting finitely many denominators, and
filtered-colimit compatibility makes the map land in the direct sum. The same
claim must be proved for the maps being used, rather than replacing a direct
sum by a product. (K-book, V.4.3–4.4, p. 401; V.6.1–6.1.2, p. 406; V.6.6,
p. 409.)

**Checks.**

- If R is a field, Spec¹(R)=∅ and localization is the identity.
- For a DVR, the residue family has one term.
- For ℤ[1/p], p is absent from the ring-to-field family but is the only term
  of the relative ℤ→ℤ[1/p] sequence.
- A tuple nonzero at infinitely many primes is not an allowed boundary value.

*Needs:* §1.1–1.2, S.3 and finite-support/filtered-colimit compatibility.

### 2.2 Classical rows and the inverse-ideal convention

Identify the bottom rows with the supplied determinant, class-group and
Matsumoto descriptions. The K₁ boundary is the additive valuation
F×→⊕_(v∉S)ℤ. The map from a residue generator to K₀(O) sends e_v to
(0,[v]⁻¹), since [O/v]=[O]−[v]. This fixes the sign relative to the usual
divisor-class sequence. The K₂ boundary β has the normalization in
Conventions; comparing it with the supplied tame symbol t_v is an explicit
inverse. (K-book, V.6.6–6.6.1, p. 409; III.6.2.3–6.2.4, pp. 232–233.)

Interpret, without redefining the existing maps, the S-unit and class sequence

```text
0 → A× → O× → ⨁_(v∈S) ℤ → Cl(A) → Cl(O) → 0.
```

The middle map is valuation; one may use the inverse divisor-class map to
match the K₀ row, with the same image and kernel. Prove exactness at the
valuation lattice, and identify its K-theoretic origin. Tau Ceti already
supplies the unit kernel and localized class quotient. (K-book, I.3,
Exercise I.3.8, p. 29; V.6.6.1, p. 409.)

**Checks.**

- At ℤ_(5), β{5,2}=2 in 𝔽₅× whereas β{2,5}=3; t has the opposite values.
- The two different residues distinguish the inverse convention.
- For S={p} in ℚ the valuation sends p to 1 and ±1 to 0.
- For a nonprincipal prime v, the K₀ image is its inverse class, not its
  rank-one projective class with positive sign.
- At S=∅ the relative unit and divisor terms vanish.

### 2.3 Residue transfer and ramification-weighted restriction

For a finite extension E/F with T exactly over S, transfer gives a commuting
localization diagram; on a residue summand at w|v it is the finite-field
transfer K_n(k(w))→K_n(k(v)), summed over w. On K₀ of residues it multiplies
by f(w/v); on K₁ it is the finite-field norm. This is the arithmetic
identification of the supplied finite-pushforward naturality. (K-book,
V.6.6.3–6.6.4, p. 410.)

Define `ramifiedResiduePullback` on the actual residue direct sums: the
w-coordinate of a tuple x is e(w/v)·res_(k(w)/k(v))(x_v). Its API includes
the formula on a single supported element, additivity, finite support,
identity, composition in towers, compatibility with discarding inverted
primes, and the full boundary square. Finite fibres over v guarantee finite
support. The **ramification index**, rather than residue degree, occurs on
restriction. (K-book, V.6.6.3, p. 410, with the dévissage/additivity argument
below.)
Name the single-summand and coordinate laws `ramifiedResiduePullback_of`
and `ramifiedResiduePullback_apply`; `unique` is uniqueness from those
summand values. `support`, `zero` and `add` give the finite-support bound
and homomorphism laws, while `id` and `tower_apply` specify identity and
composition. These also apply to the general finite-fibre direct-sum
assembly of additive homomorphisms, with the arithmetic weights substituted.

Prove `ramificationWeightedDevissage`: B/vB is filtered at w by powers of w,
with e(w/v) successive copies of k(w). Apply additivity to these exact
subquotient functors to compute flat pullback. Do not identify K(B/w^e) with
e copies of K(k(w)); it is the induced support-category map that has this
formula. This proves restriction naturality of the entire sequence, including
the low-degree divisor and tame squares. The ramification indices multiply in
a tower, so the construction composes, also after S-enlargement.
(K-book, V.6.6.3–6.6.4, p. 410; Quillen dévissage as supplied by K.3.)

**Checks.**

- A totally ramified quadratic extension sends 1∈K₀(k(v)) to 2, while an
  unramified quadratic extension sends it to 1. Transfer reverses these
  multiplicities: respectively 1 and 2.
- In residue units, e=2 sends u to res(u)². For u=2 in 𝔽₅× this is 4,
  rather than 2. The β boundary square has exactly this square factor.
- With e=1 and a nontrivial residue extension, restriction is just the
  residue-field inclusion. Omitting the inclusion while keeping a scalar
  does not give the map on higher finite-field K-groups.
- Two primes above v give two coordinates; their residue degrees and
  ramification indices must not be merged into [E:F] at either coordinate.
- In a ramified tower e=2 followed by e=3, the restriction factor is 6.
  Adding an inverted upper prime removes its coordinate instead of adding
  a new transfer for a nonfinite ring extension.

*Needs:* §1.2–1.3, §2.1, finite fibres over primes, exact additivity,
support-category dévissage and residue extension functors.

### 2.4 Even injectivity and what exactness supplies

For any Dedekind domain R with finite residue fields and even n≥4, prove
that K_n(R)→K_n(K) is injective: the preceding finite-field groups
K_n(k(v)) vanish. Specialize to number-field S-integers and include n=2
using the supplied tame-kernel theorem, not the
vanishing argument in a degree where it has not been established by that
argument. Odd-degree surjectivity comes from the next residue group being
zero, but odd injectivity does not follow from this exact sequence. Soulé's
additional argument in Layer 5 gives it. (K-book, V.6.6, p. 409; V.6.8,
pp. 412–413.)

### Examples

At ℤ→ℤ[1/p] the relative boundary detects the inverted prime, whereas
ℤ[1/p]→ℚ detects all remaining primes. At a ramified quadratic prime the
restriction square weights valuations by 2, while the transfer square weights
residue ranks by f. These two tests distinguish both directions simultaneously.

### Dependencies

Layer 1; SchemeKTheoryOperations S.3; GeneralAlgebraicKTheory K.3;
KTheoryLowDegrees; K2SymbolsBrauer T.3/T.5; finite-field K-theory in
KTheoryFiniteLocalFields L.1; Mathlib's ramification-index tower and residue
filtration API. No global arithmetic finite generation is needed yet.

## Layer 3: finite generation, ranks and hermitian consequences

### 3.1 The rank filtration and its proper layers

For a Dedekind domain R and fraction field K, let Q_m be the full subcategory
of Q(P(R)) on finite projectives of rank at most m, where rank is
dim_K(P⊗K). Define the inclusions and their coherence maps using the actual
Q-construction. Its morphisms go from lower to higher rank, and a same-rank
morphism is an isomorphism. Thus the rank-m stratum is the disjoint union of
the groupoids Aut_R(P), indexed by **all** rank-m projective classes. Q₀ is
equivalent to the terminal category. The nerves exhaust BQ and integral
homology commutes with this filtered union. When Pic(R) is finite, Steinitz
classification gives exactly #Pic(R) classes in every positive rank.
(Kahn, §4.1, p. 15; Definition 2.3.2, p. 10; K-book, IV.6.8–6.9, p. 325.)

The `rankFiltration` API includes rank monotonicity on arrows, full and
cellular inclusions, the groupoid-stratum equivalence, zero-stage
contractibility, exhaustion and induced homology maps. Name these `QCat.rankFiltration`, `rankFiltration_mono`,
`rank_le_of_hom`, `rankFiltration_cellular`, `rankStratum`,
`rankStratumEquiv`, `iSup_rankFiltration`, `rankFiltration_zero` and
`finite_rankStratum_classes`. Representative choices change the summands
only through the corresponding coefficient isomorphisms.

**Checks.**

- Q₀ has only zero modules up to isomorphism, so BQ₀ is contractible. It is
  not the Q-construction of all torsion modules.
- Rank one is indexed by Pic(R). A nonprincipal invertible ideal in
  ℤ[√−5] contributes a class distinct from R.
- A morphism from rank m to rank m−1 cannot occur. Reversing this direction
  invalidates the cellular inclusion used in the relative calculation.
- Over a field there is one projective class per rank, but the construction
  itself is defined for every Dedekind domain without a finite-Picard
  hypothesis.

For a finite-dimensional K-space V, define `LayerPoset V` as pairs
W₀⊆W₁⊆V other than (0,V), ordered by reverse inclusion in W₀ and inclusion
in W₁. Equivalently (W₀,W₁)≤(W₀′,W₁′) means
W₀′⊆W₀⊆W₁⊆W₁′. Its API includes transport by linear equivalences, the GL(V)
action, the cover by W₀≠0 and W₁≠V, the intersection of those subposets and
the fact that no chain meets both complementary pieces. For a rank-m
projective P, identify the comma category Q_(m−1)↓P equivariantly with
LayerPoset(P⊗K), using W↦W∩P for the inverse pure submodule.
(Kahn, Proposition 4.2.4 and Corollary 4.2.6, p. 16; §4.3.2, p. 17;
Sun, pp. 5–6.) The named interface is `LayerPoset.le_iff`, `map`,
`glAction`, `lowerPart`, `upperPart`, `lowerPart_sup_upperPart` and
`of_finrank_eq_one`; the last is the equivariant two-point equivalence.

**Checks.**

- At V=0 the poset is empty; at dim V=1 it has precisely (0,0) and (V,V),
  with no comparison between them.
- For V=𝔽₂² there are eleven layers: the two endpoint pairs and three
  layers for each of the three lines.
- Including (0,V) would give a largest element and a contractible nerve,
  contradicting the rank-one two-point calculation.
- A linear isomorphism sends both subspaces forward. Reversing only one
  component would fail to preserve the containment condition.

### 3.2 Relative homology, stability and the finiteness criterion

Compare the nerve of LayerPoset V with the unreduced suspension of the Tits
building. In rank m≥1 its sole reduced homology is St(V) in degree m−1;
the rank-one convention gives St₁=ℤ with trivial action. The building and
Solomon–Tits theorem are the R.1 inputs; the layer-poset comparison is the
arithmetic target here. (Kahn, §§4.3.1–4.3.3, p. 17; Sun, p. 6.)

Construct the natural relative comparison, for m≥1 and i≥0,

```text
H_i(BQ_m,BQ_(m−1);ℤ)
  ≅ ⨁_([P], rank P=m) H_(i−m)(Aut_R(P); St(P⊗K)).
```

Use integer subtraction and set negative homology to zero. The relative
complex is the mapping cone of the inclusion on integral chains. This
comparison intertwines the relative long exact sequence and is natural under
the specified equivalences. Its spectral sequence is
E¹_(p,q)=⊕_[P],rank p H_q(Aut(P);St(P⊗K)) for p≥1, with the single ℤ term
at (0,0), converging to H_(p+q)(BQ). For total degree i, only 0≤p≤i can
contribute. (Kahn, Corollary 2.3.7, p. 12, Theorem 2.4.1, p. 12, and
Theorem 4.3.3, pp. 17–18; Quillen, Theorem 3, p. 181.)

Deduce that H_i(BQ_m)→H_i(BQ_(m+1)) and H_i(BQ_m)→H_i(BQ) are surjective
for m≥i and isomorphisms for m≥i+1. These bounds hold for every Dedekind
domain; they are not homological stability bounds for GL_m. If Pic(R) is
finite and H_q(Aut_R(P);St(P⊗K)) is finitely generated for all positive-rank
projectives P and all q≥0, prove finite generation of every H_i(BQ_m) and
H_i(BQ). For R=O_F apply R.1's projective-lattice finiteness, including its
orientation twist and nonfree classes. This unifies the finite-stage and
stable homology assertions. (Quillen, Corollary on p. 182 and proof of
Theorem 1, pp. 184–185.)

Finally apply the connected CW H-space finite-type theorem to BQ. Direct sum
makes it simple, so its possibly nonzero π₁ is allowed. Conclude finite
generation of K_n(R)=π_(n+1)(BQ,0) for all n≥0 under the preceding two
hypotheses; in particular all K_n(O_F) are finitely generated. The source also
states a function-field result, which is not needed for this number-field
argument. (Quillen, end of proof of Theorem 1, p. 185; K-book, IV.6.9,
p. 325; Serre, III §1 Proposition 1, pp. 465–466, IV §3 Proposition 3,
p. 479, IV §6 Proposition 9, p. 483, and V §§1–2, pp. 489–491.)

**Checks.**

- At i<m the relative term is zero; replacing i−m by natural truncated
  subtraction would insert H₀ incorrectly.
- At m=1 the layer comparison uses reduced H₀ of two points, not zero.
- H₀ stabilizes from the zero stage, consistently with connectedness.
- Infinite Picard groups are excluded from the finiteness criterion, though
  not from the spectral sequence or stability theorem.
- BQ has π₁=K₀, so requiring simple connectedness would exclude precisely the
  intended application.
- At m=1,i=1 the relative group is ⊕_Pic(R)ℤ, because St₁=ℤ and Aut_R(P)=R×
  acts trivially.
- At m=2,i=2 it is ⊕_[P] H₀(Aut(P);St₂), which is Steinberg coinvariants, not
  ordinary H₀(Aut(P);ℤ).
- Over ℤ[√−5] both Steinitz classes occur.
- The boundary m=i guarantees a surjection only; the isomorphism bound is
  m≥i+1.
- Finite rational dimension alone does not imply integral finite generation,
  as ℚ shows; finite generation alone does not imply finiteness, as ℤ shows.

*Needs:* §3.1, H.1's categorical/relative homology comparisons, R.1 and H.3's
connected H-space theorem. These comparisons and the finite-type theorem are
substantive supplier inputs.

### 3.3 Finite-S defects and the actual rational equivalence

For finite S⊆T and n≥2, prove that the actual localization map
K_n(O_(F,S))→K_n(O_(F,T)) has finite kernel and cokernel. For positive even
n it is injective; for odd n≥3 it is surjective, with no assertion here that
its kernel vanishes. The residue terms are finitely many positive
finite-field K-groups. Degrees zero and one are handled separately by rank–Picard
and the S-unit theorem. Thus K_n(O_(F,S)) is finitely generated for all n≥0.
(Quillen, Theorem 1, Remark (2), pp. 179–180; K-book, V.6.1, p. 406 and
IV.1.13, p. 269.)

For finite S and n≥2 construct `rationalSIntegerEquiv` from the rationalization
of the canonical inclusion j:A→O_(F,S), using `LinearEquiv.ofBijective`.
Its forward map **equals** j_*^ℚ; it is not an arbitrary equivalence between
spaces of equal dimension. Its API includes this map identity, identity at
S=∅, composition for S-enlargement, naturality for field extension and for
finite-projective transfer. For E/F and T exactly over S, prove the two
squares e_E∘res₀=res_S∘e_F and e_F∘tr₀=tr_S∘e_E after rationalization.
The interface `rationalSIntegerEquiv_apply` states the forward-map identity;
`rationalSIntegerEquiv_symm_apply_apply` and `apply_symm_apply` give the two
inverse laws. `rationalSIntegerEquiv_unique` characterizes the equivalence
by that forward map, `empty` and `enlarge` give the identity and tower laws,
and `toField` identifies the composite with rational field localization.
Ramification is permitted. (Quillen, pp. 179–180; K-book, IV.6.3–6.3.2,
p. 320; V.6.6.3–6.6.4, p. 410.)

**Checks.**

- At S=∅ this equivalence is the identity after the empty-S ring comparison.
- At S⊆T⊆U its forward map is the composite of the two localization maps,
  so the two rational equivalences agree as maps, not only in dimension.
- For ℚ⊂ℚ(i), both the extension and transfer squares commute, including
  the ramified prime 2. A basis-chosen rational isomorphism need not do so.
- At n=1 the unit rank of ℤ[1/p] is one while that of ℤ is zero; the proposed
  equivalence is deliberately restricted to n≥2.
- At F=ℚ,n=5 the localization equivalence acts on a one-dimensional
  rational space. Multiplying it by two still gives an abstract equivalence
  but fails the forward-map identity. The maps for S⊆T compose with this
  specified localization, including when S is empty.
- At F=ℚ,n=2 the rational space is zero although K₂(ℤ)=ℤ/2.
  Vanishing after tensoring never asserts integral vanishing.

### 3.4 Ranks, finite even groups and infinite field groups

Define the numerical function `borelRank r₁ r₂ n` to be r₁+r₂ at n≡1 mod 4,
r₂ at n≡3 mod 4, and zero otherwise. Prove its even-degree vanishing
`borelRank_even` and its period-four behavior. Its arithmetic interpretation
is **only for n≥2**. Combine R.3's orders theorem with §3.3 to obtain this
rank for K_n(O_(F,S)). Consequently
K_n(O)≅ℤ^borelRank⊕T_n, where T_n is the canonical finite torsion subgroup
and the free complement is not canonical. All positive even groups of O are
finite. (K-book, IV.1.17–1.18, p. 271, Example 1.18.2, p. 272; VI.8.1,
p. 513, with the ring/field distinction retained.)

For i≥1, K_(2i)(F) is instead an **infinite torsion** group. The left term of
the localization sequence is finite and the residue direct sum is torsion.
The image of that direct sum in the finitely generated odd group of O_F is
finite; its kernel, hence the preceding boundary image, is infinite. There
are infinitely many nontrivial residue summands. This proof does not assume
Soulé's later surjectivity. (K-book, IV.1.18, p. 271; V.6.8, p. 412.)

**Checks.**

- For signature (1,0), the ranks in degrees 3 and 5 are 0 and 1.
- For signature (0,1), both ranks are 1. Thus one cannot count complex
  embeddings twice or omit them in one parity.
- Every even degree, including the numerical input n=0, gives zero for the
  function. K₀(O) has rank one; the arithmetic rank statement excludes n=0.
- K₁(O) has rank r₁+r₂+|S|−1. Inverting a prime changes that rank and leaves
  all ranks in n≥2 unchanged.
- K₂(ℤ) is finite whereas K₂(ℚ) is infinite torsion. Applying the ring
  finiteness assertion to the field would fail this basic example.

### 3.5 Symmetric, quadratic and genuine hermitian finiteness

For a number ring O=O_(F,S) with finite S and ε=±1, prove finite generation
of the periodic symmetric and quadratic L-groups L^s_n(O;ε), L^q_n(O;ε) in
**every integer degree**. Use the quadratic-arithmetic tables, the finite
Picard group and the signature theorem for W^s(O). The injection W^q→W^s
uses characteristic zero and must not be extended to characteristic two.
(Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle,
arXiv v4, Corollary 2.3.16 and proof, pp. 47–48.)

For every m,n∈ℤ also prove finite generation of
L_n(O;Q_ε^(≥m)) and GW_n(O;Q_ε^(≥m)). The genuine structure is m-quadratic
and (2−m)-symmetric: the quadratic comparison is surjective at n≤2m−2 and
the symmetric comparison injective at n≥2m−1. These ranges cover all
integers. The fibre sequence

```text
K(O;ε)_(hC₂) → GW(O;Q_ε^(≥m)) → L(O;Q_ε^(≥m))
```

and the connective homotopy-orbit finite-type theorem supply GW finiteness.
Here finiteness on each spectral-sequence diagonal is justified by
connectivity, not by convergence alone. Finally prove finite generation of
the **classical** ε-symmetric and ε-quadratic GW groups for all n≥0 using
their exact comparison theorem. No inversion of 2 and no absence of real
places is assumed. (The same source, Corollaries 1.2.12 and 1.3.9, pp. 18
and 31; Corollaries 2.3.18–2.3.19, p. 48; Corollary 8, p. 5.)

**Checks.**

- At m=0 the ranges n≤−2 and n≥−1 cover all L-degrees; at m=1 the division is
  n≤0 and n≥1.
- Classical n=0,1,2,3 requires the classical comparison rather than a theorem
  starting at n=4.
- ℤ and a real quadratic number ring are allowed without inverting 2.
- Characteristic-two Dedekind rings fall outside this arithmetic theorem:
  there the map W^q→W^s can be zero rather than injective.
- For ε=+1 over ℤ, the periodic symmetric residues modulo four are ℤ,ℤ/2,0,0
  and the quadratic residues are ℤ,0,ℤ/2,0.
- Finite generation does not identify these flavours.
- The theorem also covers ℤ[1/2], both signs and every genuine parameter m;
  it gives no conclusion for infinite S.

### Examples

For ℤ[1/p], rational K-theory in n≥2 agrees by the localization map with
that of ℤ; its K₁ acquires a new valuation generator. For a nontrivial
class group, every projective class contributes to the rank filtration.
These cases test both the arithmetic and categorical finiteness inputs.

### Dependencies

Layers 1–2; GeneralAlgebraicKTheory K.1/K.3; StableHomotopyKTheory H.1/H.3/H.6;
BorelRegulators R.1/R.3; finite-field K-theory; the arithmetic Witt and
hermitian comparison/fibre-sequence contracts specified above. The hermitian
results require those exact supplier theorems, including the low classical
degrees.

## Layer 4: cyclotomic invariants and the prime two

### 4.1 Fixed twists and their functoriality

For a field F, a chosen separable closure and an integer i, define
`WInvariant F i` as H⁰(G_F,ℚ/ℤ(i)), using the prime-to-characteristic twist
from M.1. Define `WInvariant.primary F i ℓ` by the ℓ-primary fixed twist for
ℓ≠char F. The API gives the primary internal direct sum, cyclicity when
finite, the order `wInvariant` under that finiteness hypothesis, its finite
product formula, equality of the fixed subgroups at i and −i under the
coherent underlying twist identification, and the identification at i=1
with roots of unity in F. For number fields this last group is the torsion
subgroup of units. (K-book, Definition VI.1.7, p. 468; Definition VI.2.1,
p. 469; Examples VI.2.1.1–2.1.2, p. 470.)
The interface names are `WInvariant.isInternal_primary`, `isCyclic`,
`wInvariant_eq_prod_primary`, `WInvariant.neg_eq`, `zero_eq_top` and
`oneEquivRootsOfUnity`, each with the range or finiteness conditions just
stated. `WInvariant.cor_comp_res` is the degree composite, and
`wInvariant_dvd_of_finite` is the resulting order divisibility.

For finite intermediate fields E/F in the chosen closure, define `WInvariant.res`
and `WInvariant.cor` using H⁰ restriction and corestriction. Prove injectivity
of restriction, cor∘res=[E:F], and w_i(F)∣w_i(E) whenever the latter group is
finite. For abstract extensions specify the embedding/closure comparison;
do not silently make a choice-dependent underlying-root identification
canonical. At i=0 the fixed group is the entire infinite prime-to-characteristic
root group, so no finite w₀ is assigned. For a number field and i≠0 prove
finiteness. (K-book, VI.2.1–2.3, pp. 469–471.)

**Checks.**

- Over 𝔽_q and i≥1, Frobenius gives w_i=q^i−1. For q=3, i=1 and 2 give
  2 and 8, which detects an accidentally untwisted action.
- w₁(ℚ)=2 and w₂(ℚ)=24. Defining all W_i by roots of unity in F would
  collapse this distinction.
- For odd i, w_i(ℚ)=2 while w_i(ℚ(i))=4. The restriction of W₁ is the
  ordinary inclusion of roots of unity.
- W₀ is infinite, and W_(−2)(ℚ) has the same fixed subgroup and order 24
  as W₂ under the stated identification. Neither a zero-weight finite
  cardinal nor a missing negative twist is allowed.
- ℚ/ℤ⊗_ℤℚ/ℤ=0 as an ordinary tensor product. That construction would
  give a trivial weight-two group and fails the value 24.
- For a quadratic extension, cor∘res is multiplication by 2. It is not
  the identity merely because restriction is injective.

*Needs:* M.1 twists, continuous H⁰, cyclotomic characters and finite
restriction/corestriction, with the chosen embedding comparisons.

### 4.2 Exponents and odd-primary computation

For ℓ≠char F and ν≥1, prove the exponent criterion: the entire finite
submodule (ℚ_ℓ/ℤ_ℓ(i))[ℓ^ν] is fixed exactly when the exponent of
Gal(F(ζ_(ℓ^ν))/F) divides i. Equivalently every cyclotomic-character image
has i-th power one modulo ℓ^ν. When W_i(F)[ℓ^∞] is finite, this says
ℓ^ν divides its order. The fixed-submodule statement permits i=0; the
finite-order formulas below require i≠0. For a number field and odd ℓ put
r=[F(ζ_ℓ):F] and let a be the largest integer with
μ_(ℓ^a)⊆F(ζ_ℓ). Write i=cℓ^b with ℓ∤c. Then

```text
w_i^(ℓ)(F) = ℓ^(a+b) if r divides i, and 1 otherwise.
```

The proof uses the finite cyclic odd-primary character image and its
ℓ-power filtration. In more general fields the unbounded-root case must be
kept separate rather than assigned a fictitious largest a.
(K-book, Proposition VI.2.2 and proof, pp. 470–471.)

**Checks.**

- At ℓ=3, F=ℚ, r=2 and a=1: weights 1 and 2 give orders 1 and 3.
- At weight 6 the order is 9.
- At ℓ=2 the character image need not be cyclic, so the odd-primary formula
  cannot be reused.
- Weight zero makes the exponent criterion true at every ν and thus lies
  outside the finite formula.

### 4.3 Exceptional fields and the dyadic formula

Define `IsExceptional F` to mean characteristic zero and eventual
noncyclicity of Gal(F(ζ_(2^ν))/F). For a number field, prove its equivalent
formulations: F∩ℚ(ζ_(2^∞)) is totally real, or −1 lies in the dyadic
cyclotomic image. Its API includes characteristic zero, descent along field
extensions, exceptionality from a real place and nonexceptionality if i∈F.
These equivalent number-field descriptions are not asserted for arbitrary
characteristic-zero fields. (K-book, VI.2, discussion after Example 2.2.2
and Proposition 2.3, p. 471.)
Use `IsExceptional.charZero`, `iff_inf_cyclotomic_isTotallyReal`,
`of_nrRealPlaces_pos`, `not_of_sqrt_neg_one_mem`, `of_extension` and `rat`.
Here `of_extension` descends exceptionality from an extension to its base;
it does not assert that every extension of an exceptional field is exceptional.

**Checks.**

- ℚ is exceptional since (ℤ/2^ν)× is noncyclic for ν≥3.
- ℚ(i) is nonexceptional; the relevant subgroup is generated by 5 and is
  congruent to 1 modulo 4.
- ℚ(√−7) is totally imaginary and exceptional: its intersection with the
  dyadic cyclotomic tower is ℚ. A real-place-only definition fails here.
- ℚ(√−2) is totally imaginary, does not contain i, and is nonexceptional;
  the subgroup with residues 1 or 3 modulo 8 is cyclic. Absence of i alone
  is not the definition.
- A positive-characteristic field is nonexceptional. The real-closed field
  ℝ also has only a cyclic quadratic cyclotomic extension and must not be
  inferred exceptional from the number-field real-place criterion.

For a number field, put a≥2 for the largest dyadic root level in F(i), and
write the nonzero weight i=c2^b with c odd. Prove

| Hypothesis | w_i^(2)(F) |
| --- | ---: |
| √−1∈F | 2^(a+b) |
| √−1∉F and i odd | 2 |
| F exceptional and i even | 2^(a+b) |
| F nonexceptional, √−1∉F and i even | 2^(a+b−1) |

This is a disjoint exhaustive case split once the first row is used before
the other rows. It requires i≠0 and a finite root level, automatic here.
(K-book, Proposition VI.2.3, pp. 471–472.)

### 4.4 Rational values

For odd i, prove w_i(ℚ)=2. For positive even i, prove

```text
w_i(ℚ) = 2^(2+v₂(i)) · ∏_(odd primes ℓ with ℓ−1∣i) ℓ^(1+v_ℓ(i)).
```

The product is finite since ℓ≤i+1. In particular w₂=24, w₄=240, w₆=504
and w₁₀=264. Also w₂(ℚ(i))=24; the dyadic case split gives 8 and the
odd-primary contribution is 3. The value 24 will feed the two different
K₃ computations in Layer 8. (K-book, Example VI.2.1.2, p. 470 and
Lemma VI.2.4, p. 472.)

### Examples

At i=2 over ℚ, the dyadic contribution is 2³ and the 3-primary contribution
is 3, giving 24. At i=10 the only odd primes allowed are 3 and 11, giving
8·3·11=264; a factor 5 would fail 5−1∣10. This tests both the divisibility
condition and the exponent of each primary factor.

### Dependencies

MotivicEtaleKTheory M.1, existing cyclotomic characters and roots of unity,
continuous H⁰ restriction/corestriction, and the elementary structure of units
modulo prime powers. No arithmetic K-group is used to define W_i.

## Layer 5: odd integral groups and their natural torsion maps

### 5.1 Soulé's theorem with coefficient boundaries

For a number field, finite S and odd n≥3, prove that the actual map
K_n(O_(F,S))→K_n(F) is an isomorphism. For i≥1 obtain

```text
0 → K_(2i)(O_(F,S)) → K_(2i)(F)
  → ⨁_(v∉S) K_(2i−1)(k(v)) → 0.
```

The injectivity at degree two is the supplied tame-kernel theorem; the new
odd injectivity uses Soulé's argument. First prove surjectivity of the
even-degree boundary with ℤ/m coefficients for every m≥2. At a safe prime
power, use the coefficient product and boundary projection formula with a
lifted Bott element. Reduce from a sufficiently large safe modulus to the
required prime power, then combine primary moduli. For unsafe small moduli
use only the resulting compatible operations and maps, rather than assuming
an unavailable associative coefficient ring. Finite support and finite
generation then prove the integral assertion. (K-book, Theorem V.6.8,
Corollaries 6.8.1–6.8.2 and proof, pp. 412–413.)

**Checks.**

- Degree one is excluded: O×→F× is generally not surjective.
- For finite residue fields K_(2i)=0 and K_(2i−1) is cyclic of order q^i−1;
  at q=2,i=1 this residue group is trivial, not an obstruction.
- The proof at m=2 or 3 still needs reduction and cannot assert a general
  mod-m product.
- The exact sequence has a direct sum over primes outside S.

*Needs:* Layers 2–3, K.7's coefficient localization/projection formula,
finite-field Bott operations and compatible modulus reduction.

### 5.2 The e-invariant and the first descent edge

For i≥1 and a field of characteristic zero, define `eInvariant` on
K_(2i−1)(F)_tors by extension to a separable closure and the equivariant
Suslin identification with ℚ/ℤ(i), taking fixed points in W_i(F). Its
primary component is `eInvariant.primary`. For S-integers compose with
localization; the odd-degree isomorphism applies for i≥2. Include
naturality for field embeddings with the same closure comparison, coherence
under S-enlargement, the identity on μ(F) at i=1 and the finite-field
prime-to-characteristic compatibility. The equivariant identification is a
required theorem, not just equality of underlying cyclic group orders.
(K-book, VI.1.7.1, p. 468 and Definition VI.2.1, pp. 469–470.)

**Checks.**

- At i=1, e is the identity μ(F)→W₁(F), under the determinant comparison.
- On a finite field, e identifies the group of order q^i−1 with W_i.
  Over 𝔽₃ the first two orders are 2 and 8.
- For a separably closed characteristic-zero field the map is precisely
  the chosen Suslin identification, since the Galois group is trivial.
- At F=ℚ,i=2 the source has order 48 and the target order 24. This e is
  surjective with nonzero kernel, so injectivity is not part of its definition.

For i≥2, ℓ prime and R=O_(F,S)[1/ℓ], prove that the Bockstein

```text
β_R : K_(2i)(R;ℚ_ℓ/ℤ_ℓ) ≅ K_(2i−1)(R){ℓ}
```

is an isomorphism. Indeed K_(2i)(R) is finite, hence its tensor with
ℚ_ℓ/ℤ_ℓ vanishes; the coefficient exact sequence gives exactly this
connecting map, of degree −1. Identify its localization compatibility.
Using one coherent Bott-normalized Suslin convention, prove that the degree-zero
descent edge ε_R satisfies

```text
ε_R = e_(F,ℓ) ∘ loc ∘ β_R.
```

At odd ℓ, and at ℓ=2 for totally imaginary F, this edge and the resulting
e-map are isomorphisms. At real places and ℓ=2 the equality of maps remains
valid but the edge may have kernel or cokernel. This is the **early** M.7
edge, not a theorem deduced from the full later Chern/regulator family.
(Rognes–Weibel, §1 after Example 1.6, p. 8; K-book, VI.1.6–1.7.1,
pp. 467–468 and VI.8.2–8.3, pp. 513–514.)

For the first étale edge Chern map on torsion, prove
`edgeChern_on_torsion`: c_edge=δ∘e, where δ identifies W_i(F){ℓ} with the
torsion of H¹(R,ℤ_ℓ(i)) by the coefficient connecting sequence. This pins
the map and normalization. It does not identify every convention for a
higher Chern class, which can differ by factorial factors. The named maps
`eInvariant_natural`, `eInvariant_one` and `eInvariant_finiteField_bijective`
record the field, degree-one and finite-field compatibilities.
(K-book, VI.8.2–8.3, pp. 513–514; the coefficient-compatible edge just
specified.)

**Checks.**

- The Bockstein goes from degree 2i with torsion coefficients to degree 2i−1
  integrally, not in the reverse direction.
- For ℚ at i=2 and ℓ=2, the map to W₂ has a kernel of order two; an
  all-primes isomorphism would be false.
- At odd ℓ this kernel vanishes.
- Replacing c_edge by a factorial multiple can kill torsion and is not a
  harmless renaming.
- At the exceptional totally imaginary field ℚ(√−7), i=2 and ℓ=2 the early
  edge is still an isomorphism.
- For F=ℚ,n=5, dyadic torsion in K₅ is zero but W₃(ℚ){2}=ℤ/2 and H¹(R,ℤ₂(3))
  has torsion ℤ/2.
- Thus c_edge has zero image on dyadic torsion and cokernel ℤ/2; the rank-one
  free part changes none of these facts.
- The real extension normal form must also work for w=8 with r=1 and r=2,
  giving ℤ/16 and ℤ/16⊕ℤ/2 respectively.

### 5.3 Integral groups away from real dyadic corrections

For finite S, n=2i−1≥3, and ℓ odd or F totally imaginary, identify
K_n(O){ℓ} with W_i(F){ℓ} through the preceding actual map. Thus

```text
K_n(O)_(ℓ) ≅ ℤ_(ℓ)^ρ(n) ⊕ ℤ/w_i^(ℓ)(F).
```

The torsion identification is natural, whereas the displayed free complement
is not. If F is totally imaginary, assemble the primary statements to give

```text
K_(2i−1)(F) ≅ K_(2i−1)(O) ≅ ℤ^r₂ ⊕ ℤ/w_i(F),   i≥2.
```

Exceptional totally imaginary fields are included; exceptionality does not
invalidate their ordinary odd-group table. (K-book, Theorem VI.8.2,
p. 513; Theorem VI.8.4, p. 514 and Theorem VI.9.5(a), p. 519.)

### 5.4 Diagonal extensions and real places

First prove the elementary extension normal form. Let r>0 and w>0 be even.
If 0→(ℤ/2)^r→E→ℤ/w→0 has a lift x of 1 satisfying
wx=(1,…,1), then E≅ℤ/(2w)⊕(ℤ/2)^(r−1). In the presentation, replace
one elementary basis vector by the diagonal vector; it becomes wx, leaving
r−1 independent order-two generators. The projection has no section:
any lift of an odd generator still has nonzero w-multiple. The exact
sequence and diagonal Ext class are more informative than this abstract
normal form. (Rognes–Weibel, Theorems 6.7 and 6.9, pp. 32–34.)

For r₁>0 and n=8k+3≥3, identify the actual real-place extension

```text
0 → (ℤ/2)^(real places) → K_n(F)_tors →[e] W_(4k+2)(F) → 0
```

with that diagonal class. In each coordinate the pushout is the pullback
of the real torsion comparison; its final map is multiplication by 2 in
compatible Suslin trivializations. A chosen generator of W and a lift x
therefore satisfy w x=(1,…,1). No natural cyclic generator or splitting is
chosen. (Rognes–Weibel, Theorem 6.7, pp. 32–33, especially the final proof
paragraph on p. 33, and Theorem 6.9, pp. 33–34; K-book, VI.3.1 and
Table 3.1.1, p. 475; proof of VI.9.4, pp. 519–520.)

Now for n=2i−1≥3 and r₁>0 prove the abstract table, for F or finite-S O:

| n modulo 8 | K_n(O) |
| ---: | --- |
| 1 | ℤ^(r₁+r₂) ⊕ ℤ/w_i |
| 3 | ℤ^r₂ ⊕ ℤ/(2w_i) ⊕ (ℤ/2)^(r₁−1) |
| 5 | ℤ^(r₁+r₂) ⊕ ℤ/(w_i/2) |
| 7 | ℤ^r₂ ⊕ ℤ/w_i |

For the actual e-map the respective (kernel,cokernel) pairs are
(0,0), ((ℤ/2)^r₁,0), (0,ℤ/2), and (0,0). In the 5-row i is odd and
W_i has dyadic order 2; e identifies the torsion with its odd-primary
subgroup. This explains the quotient w_i/2 rather than an arbitrary choice
of half its order. (K-book, Theorems VI.9.4–9.5, pp. 519–521;
Theorem VI.2.6, p. 474.)

**Checks.**

- For w=24,r=1 the diagonal extension is ℤ/48 and not ℤ/24⊕ℤ/2; for w=2,r=2
  it is ℤ/4⊕ℤ/2, with wx the diagonal class.
- The r=0 case has no such extension and is handled by §5.3.
- At n=3 over ℚ the torsion order is 48; at n=5 over ℚ it is w₃/2=1 and the
  free rank is one.
- Indexing these rows by i modulo 8 instead of n would give wrong answers
  already in these two degrees.

### 5.5 The detected Harris–Segal summand

For a number field F, prime ℓ and i≥1, assuming F nonexceptional when
ℓ=2, construct a direct summand ℤ/w_i^(ℓ)(F) of K_(2i−1)(F) on which e
is an isomorphism. Supply the compatible statement for O_(F,S) with finite
S. The construction must identify the detected map through the
finite-field/wreath-product argument, not merely select an abstract cyclic
factor from §5.3. For i=1 it is the roots-of-unity subgroup of units.
For exceptional fields at 2 use the real table when a real place exists;
the general weaker cyclic-factor assertion does not define a splitting of e.
(K-book, Harris–Segal Theorem VI.2.5 and proof, p. 473; Remark 2.5.1 and
Theorem 2.6, p. 474; Weibel, Handbook, §5.4, pp. 153–154 and
Theorem 73, pp. 167–169; Harris–Segal, §3, in the article pp. 20–33, for the original
detected construction.)

Define `cyclotomicWreathMap` using the symmetric monoidal category of
finite free μ_m-sets and the functor taking a μ_m-orbit to a free
rank-one module with its specified μ_m action. At rank r this is the
monomial inclusion W_r=μ_m≀Σ_r→GL_r(ℤ[μ_m]); stabilize and apply
group completion/plus construction. Base change and finite-projective
transfer give its maps into K(O_E), K(O_(E,S)) and K(E).
Its API includes `monomial_entry`, `blockSum`, `stabilization`,
`baseChange`, `residue` and `transfer`. The map is induced by this
functor; it is not an arbitrary map out of a cyclic group.
(K-book VI.1.5, pp. 466–467; Mitchell, §3, proof sketch of
Theorem 3.4, pp. 185–186.)

The finite-field detection follows from stable transfer. First take
k=𝔽_q with μ_m(k)
of exact order m=ℓ^a, where ℓ is odd, or ℓ=2 and a≥2.
The valuation identity

```text
v_ℓ(|GL_r(k)|)=∑_(j=1)^r v_ℓ(q^j−1)
              =ra+v_ℓ(r!)=v_ℓ(|W_r|)
```

shows that W_r contains an ℓ-Sylow subgroup of GL_r(k).
Thus its finite index d_r is a unit at ℓ. For the stable transfer
of BW_r→BGL_r(k), inclusion after transfer induces multiplication
by d_r on ordinary homology. It is therefore an equivalence of
connective spectra localized at ℓ; invert this composite to obtain
a stable section of the inclusion. Its composite with the monomial
functor into K(ℤ[μ_m]) lifts the canonical map into K(k).
The transfer composite is not asserted to be scalar multiplication
on stable homotopy or generalized cohomology. Every homotopy
class of the connective K-space lifts to its suspension spectrum by
the infinite-loop adjunction; the plus map is a stable equivalence,
and compactness puts that lift in a finite rank r. The stabilized
map from the suspension spectrum of BW_r factors through the
group-completion spectrum of finite free μ_m-sets, by its infinite-loop
counit. Thus the lift is in the homotopy of that actual source spectrum,
not just an unrelated suspension spectrum. This stable
section therefore proves surjectivity on positive
integral and finite-coefficient homotopy. No compatible choice of
sections at every finite rank is required. These are the transfer and
infinite-loop steps in Mitchell's proof, pp. 185–186, with the
wreath subgroup and its index made explicit.

For N=ℓ^(v_ℓ(q^i−1)), K_(2i)(k;ℤ/N)→K_(2i−1)(k)[N]
is an isomorphism. Lift its generator through the coefficient
wreath map, then take the Bockstein. The coefficient source has
exponent N (ℓ odd, or 4∣N in the dyadic case), so its boundary
has order exactly N and gives an actual cyclic section. Merely
lifting the integral generator would not control its order.
This proves the detected cyclic-summand assertion of K-book
VI.1.5 and Corollary VI.1.5.2, pp. 466–467. The construction
uses the binary coefficient/Bockstein operation, with no associativity
claim for a mod-3 coefficient ring.

When F contains μ_ℓ (μ₄ at 2), set m=|μ(F){ℓ}|=ℓ^a.
Its procyclic root action gives v_ℓ(w_i(F))=a+v_ℓ(i), the
same as for ℚ(μ_m). Choose a residue prime so that its cyclotomic
Frobenius has the required valuation, avoiding S. For ℚ(μ_m),
q≡1 modulo m but q≢1 modulo ℓm makes its ℓ-primary w_i equal
to the global one. Factor reduction through the completion; the
local e-invariant and rigidity identify the detected finite class.
Base change then gives the map for a field containing μ_m.
For general F at odd ℓ, pass to F(μ_ℓ), whose degree is prime
to ℓ; the norm on W_i and the restriction–transfer formula give
the required invariant part, with division only by that unit degree.
(K-book VI.2.5, p. 473.)

If ℓ=2 and F is nonexceptional without i, use E=F(i) and the
**norm**, not division by 2. The nonexceptional cyclotomic image
is procyclic, so the faithful quadratic action on W_i(E) has
surjective norm onto W_i(F). For odd i its generator has the
negative form −1+2^b, b≥2; for even i it has the positive form
1+2^b at the relevant root level. The cyclic norm calculation
gives surjectivity in both cases. Transfer of the detected summand
over E therefore surjects under e onto W_i(F). Such F is totally
imaginary, and §5.3 identifies its torsion by the actual e-map;
hence this explicit transfer image is the required cyclic summand.
This avoids assuming that adjoining i always doubles w_i: for
F=ℚ(√−2), i=1 it changes w₁^(2) from 2 to 8.
The roots-of-unity case i=1 is also immediate from the unit norm.

Name the resulting map and detection theorem
`harrisSegalMap`, `harrisSegalMap_e`, `harrisSegalMap_injective`
and `harrisSegal_directSummand`. Naturality is asserted for the
specified base-change, residue and transfer diagrams; a chosen
finite-rank section is not claimed to be canonical.

**Checks.**

- The odd-prime summand applies to ℚ.
- A real field at ℓ=2 is excluded: K₃(ℚ)→W₂(ℚ) is nonsplit.
- A nonexceptional imaginary field may use the dyadic summand, while ℚ(√−7)
  may not use that hypothesis merely because it has no real places.
- At q=7, ℓ=3, r=2, |GL₂(𝔽₇)|=2016 and |μ₃≀Σ₂|=18;
  their index 112 is prime to 3. At q=3, ℓ=2 the displayed
  valuation formula fails already at r=2; q≡1 mod4 was essential.
- For the action 3 on ℤ/8, norm 1+3=4 maps onto the invariants
  {0,4}. It models the odd-weight transfer from ℚ(ζ₈) to
  ℚ(√−2). Inversion 7 instead gives norm zero and is excluded
  by the nonexceptional hypothesis.
- With W_i(F)=0 the detected summand is the zero group. At i=1
  it lies in roots of unity, and at S=∅ the finite-prime construction
  still applies.

### Examples

Soulé identifies K₃(ℤ) with K₃(ℚ). Its real extension gives ℤ/48, while
the imaginary table and w₂=24 give K₃(ℤ[i])≅K₃(ℚ(i))≅ℤ⊕ℤ/24.
These examples require no Bloch-group computation. The natural localization
and e-maps remain distinguished from the abstract free-plus-torsion forms.

### Dependencies

Layers 1–4; K.7's coefficient operations; finite-field Bott classes;
M.7's early coefficient-compatible equivariant edge and real correction;
H.6's colimits and Bockstein; RT.4's real KO comparison. The Harris–Segal
detected-map construction is an additional proof input, not a consequence
of the table of abstract groups.

## Layer 6: even groups, wild kernels and Bott degrees

### 6.1 Even groups in cohomological dimension two

For i≥1, finite S and ℓ odd, or ℓ=2 with F totally imaginary, construct the
natural comparison

```text
K_(2i)(O_(F,S)){ℓ} ≅ H²(O_(F,S)[1/ℓ],ℤ_ℓ(i+1)).
```

Use M.7's comparison and the coefficient inverse-limit theorem, not an
unjustified exchange of homotopy and inverse limit. Its mod-ℓ version is
K_(2i)(O)/ℓ≅H²(O[1/ℓ],μ_ℓ^(⊗(i+1))). The positive even group is finite,
so this mod-ℓ quotient counts cyclic primary factors; it does not determine
their exponents. For totally imaginary F, assemble the integral identification
K_(2i)(O_(F,S))≅⊕_ℓ H²(O_(F,S)[1/ℓ],ℤ_ℓ(i+1)); only finitely many
summands are nonzero. Also identify the field group by the natural short
exact sequence of §5.1; its residue family remains a direct sum.
(K-book, Theorem VI.8.2 and Corollary 8.3, pp. 513–514; Theorem 8.4,
p. 514.)

If ζ_ℓ∈F and S is exactly the primes above ℓ, let s=|S| and
t=dim_(𝔽_ℓ) Pic(O_(F,S))/ℓ. The Kummer–Brauer calculation gives ℓ-rank
t+s−1 for each positive even K-group, with the same cohomological-dimension
hypothesis at 2. The sum-of-invariants relation accounts for the minus one.
(K-book, Example VI.8.3.1, p. 514.)

**Checks.**

- With s=1,t=0 the group has ℓ-rank zero; a formula t+s would be wrong.
- A nontrivial ℓ²-cyclic factor and an ℓ-cyclic factor both have ℓ-rank one,
  so a rank cannot be used as an order.
- At ℓ=2 with real places, this theorem is replaced by §6.3.
- The twist is i+1 for degree 2i, whereas the local finite quotient below has
  order w_i.
- For F=ℚ,ℓ odd,i=1, H²(ℤ[1/ℓ],ℤ_ℓ(2))=0, in agreement with K₂(ℤ){ℓ}=0.
- At the excluded real dyadic pair F=ℚ,i=3, K₆(ℤ){2}=0 while H²(ℤ[1/2],ℤ₂(4))
  has order two, and the mod-two comparison also fails.
- For ℚ(i), every positive even K-group of ℤ[i] has odd order: its dyadic
  class group is trivial, there is one dyadic place and H²(ℤ[i,1/2],μ₂)=0;
  all μ₂ twists coincide.
- This vanishing concerns the 2-primary part, not the entire higher even
  group.

*Needs:* Layers 2–5, M.7, arithmetic Kummer/Brauer and inverse-limit control.

### 6.2 Signature defect from Selmer classes

For any finite S define `signatureDefect O` as the codimension in
(ℤ/2)^r₁ of the sign image of the existing Selmer group F⟮S,2⟯: classes
of x∈F× with even valuation at every finite prime outside S. The API
descends the representative sign map through squares, identifies its image,
proves 0≤j≤r₁, identifies j=u−t for narrow and ordinary Picard two-ranks,
and proves that j is nonincreasing as S grows and invariant under field
isomorphism. For r₁>0, the diagonal negative sign of −1 gives j≤r₁−1.
If 1/2∈O, Kummer theory identifies this map with real restriction on
H¹(O,μ₂)=H¹(O,ℤ/2). Without this inversion, the Selmer definition remains
valid but the stated étale interpretation need not. (K-book, Definition
VI.9.6.1 and equations (9.6)–(9.6.2), pp. 520–521; proof of Corollary
9.8, p. 522.) Use `signatureDefect_eq_sub_finrank_selmer` for the
image formula, `add_signatureDefect_eq` for j+t=u,
`signatureDefect_lt_nrRealPlaces` for the real upper bound,
`signatureDefect_antitone` for S-enlargement, `signatureDefect_ringOfIntegers`
for S=∅ and `signatureDefect_of_isTotallyComplex` for r₁=0. Finally prove
`signatureDefect_eventually_eq_zero`: some finite S₀ has defect zero, hence
so does every finite S⊇S₀. Weak approximation supplies finitely many elements
realizing a basis of sign patterns; take S₀ to contain their finite prime
supports. No claim of eventual zero at a fixed, predetermined S is made.

**Checks.**

- For ℚ, both ℤ and ℤ[1/2] have j=0, since −1 supplies the unique
  nontrivial sign. Yet H¹_et(ℤ,ℤ/2)=0, whose real cokernel has dimension
  one. Thus the étale characterization requires 1/2.
- For ℚ(i), r₁=0 and j=0 for every S; no real-sign condition survives.
- For ℚ(√7), the classes −1, 8+3√7 and 3+√7 generate the dyadic
  Selmer group, with only diagonal signs, so j(O[1/2])=1. Inverting 7
  adds √7 with signs (+,−), reducing the defect to zero.
- For O_(ℚ(√34))[1/2], ordinary units and the dyadic prime generator
  have only diagonal signs, but 5+√34 has norm −9 and even prime
  valuations, with signs (+,−). The defect is zero. A unit-only
  definition incorrectly gives one.
- For ℚ(√7), the ordinary class group is trivial and the narrow class
  group has order two, so the independent formula u−t is one at S=∅.

*Needs:* existing Selmer/sign maps, the narrow class group, Kummer theory
only for the étale comparison, and arithmetic signature exactness.

### 6.3 The real dyadic integral table

Assume r₁>0 and 1/2∈R=O_(F,S). Write j=signatureDefect R and
w_a=w_a^(2)(F). Define ρ as the 𝔽₂-rank of the image of
K⁽M⁾₄(F)≅(ℤ/2)^r₁ in K₄(F). It depends on F, not S; prove
j≤ρ≤r₁−1. Do not replace it by a function of r₁ or j. With n≥2,
the two-primary group is as follows:

| n | K_n(R){2} |
| --- | --- |
| 8k | H²(R,ℤ₂(4k+1)) |
| 8k+1 | ℤ/2 |
| 8k+2 | H²(R,ℤ₂(4k+2)) |
| 8k+3 | (ℤ/2)^(r₁−1) ⊕ ℤ/(2w_(4k+2)) |
| 8k+4 | an extension 0→(ℤ/2)^ρ→K_n(R){2}→H²(R,ℤ₂(4k+3))→0 |
| 8k+5 | 0 |
| 8k+6 | H̃²(R,ℤ₂(4k+4)) |
| 8k+7 | ℤ/w_(4k+4) |

Here H̃² is the kernel of restriction to the r₁ real H² groups, in the
indicated twist. The extension row specifies its direction and cardinality
but does not assert a splitting. The 8k+1 row starts at 9, not 1; the
8k row starts at 8. (K-book, Corollary VI.9.10, p. 523, Example 9.10.1,
pp. 523–524, and Theorem 9.11 with proof, pp. 524–525.)

**Checks.**

- At r₁=1, j=ρ=0, so no hidden elementary kernel occurs.
- For ℚ(√2), ρ=0, whereas for ℚ(√7), ρ=1, although both have two real places.
- In the latter field, K₄(O_F){2}=ℤ/2 and H²(O_F[1/2],ℤ₂(3))=0; discarding
  the kernel would lose the entire group.
- The real field ℚ in degree 5 has no dyadic torsion, consistently with §5.4.
- Neither n=0 nor n=1 is in this table.

### 6.4 Mod-two orders and the even two-rank function

Continue with real F and dyadic S, and set s=|S|,
t=dim_(𝔽₂)Pic(R)/2. Prove, for positive twists in the displayed arithmetic
ranges, the ordinary mod-two dimensions

```text
dim H¹(R,ℤ/2) = r₁+r₂+s+t,
dim H²(R,ℤ/2) = r₁+s+t−1,
dim H̃¹(R,ℤ/2) = r₂+s+t+j,
dim H̃²(R,ℤ/2) = s+t−1.
```

The modified groups are the real-corrected ones from the supplier, not
another name for ordinary cohomology. Define a=r₁+r₂+s+t,
b=r₁+s+t−1, c=r₂+s+t+j and d=s+t−1. The mod-two **coefficient
K-groups** have orders 2^e, with e in residues n=0,…,7 modulo 8 given by

| n modulo 8 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| log₂ order | d+1 | a | b+1 | r₁−1+a | j+b | r₁−1+c | j+d | c |

Use the coefficient Bockstein and the real-corrected table to establish
these orders for every n>0. The entries are logarithms of
orders, not dimensions of asserted 𝔽₂-vector spaces: mod-two K-coefficients
may have nonsplit additive extensions. (K-book, VI.9.6 and Lemma 9.6.3,
pp. 520–521; Theorem 9.7, p. 521; Corollary 9.8 with proof, p. 522.)

Define `evenTwoRank r s t j n` numerically to be r+s+t−1 at n≡2 mod 8,
j+s+t−1 at n≡4 or 6, s+t−1 at n≡0, and zero at odd n. Natural
subtraction totalizes it outside the arithmetic hypotheses. Its API includes
the four even evaluations, period eight, odd-degree zero totalization and
`evenTwoRank_add_prime`: for s≥1 and even n, replacing s by s+1 increases
the numerical value by one. This identity also holds at the numerical input
n=0; its **K-group** interpretation is only for positive even n. Prove that
this function equals dim K_n(R)/2 for n>0 even under the standing real and
dyadic assumptions. (K-book, Corollary VI.9.9, pp. 522–523.)

The evaluation targets `evenTwoRank_residue_two`, `residue_four`,
`residue_six` and `residue_zero` give the four displayed branches.
`evenTwoRank_periodic` gives period eight for the totalized numerical
function; arithmetic use keeps n>0 and s≥1.

**Checks.**

- For (r,s,t,j)=(1,1,0,0), the values at 2,4,6,8 are 1,0,0,0.
- For (2,1,0,1), they are 2,1,1,0. The degree-four value detects the
  signature defect that the rational case alone would miss.
- Adding one allowed finite prime increases every even branch by one;
  s≥1 prevents truncated-subtraction artifacts.
- At (r,t,j,n)=(0,0,0,0), both s=0 and s=1 give zero. Thus
  `evenTwoRank_add_prime` would be false without s≥1, even though the
  numerical function is defined there.
- At odd n the function is zero by definition, with no K₁ claim. At n=0
  the arithmetic K₀ statement is excluded.
- An order-four coefficient group and a two-dimensional elementary group
  both have log₂ order two; the table must not be used to distinguish them.

### 6.5 A totally real order ratio

For F totally real, any finite S and positive even i, prove

```text
2^r₁ · |K_(2i−2)(O_(F,S))| / |K_(2i−1)(O_(F,S))|
 = (∏_ℓ |H²(O_(F,S)[1/ℓ],ℤ_ℓ(i))|)
   / (∏_ℓ |H¹(O_(F,S)[1/ℓ],ℤ_ℓ(i))|).
```

All groups in the ratio are finite in this parity and degree range. Prove
that only finitely many primary factors differ from one. The real factor
2^r₁ is essential. (K-book, Theorem VI.9.12 and proof, p. 525.)

**Checks.**

- i=2 is allowed; i=0 would introduce a negative ordinary degree and is
  excluded.
- Odd i would introduce a positive free rank in the odd group and is
  excluded.
- An imaginary field is not a specialization of the totally real hypothesis,
  even if a formal expression with r₁=0 can be written.
- For ℚ,i=2 the left ratio is 2·2/48=1/12 and the cohomological product is
  1/24 times the dyadic H² factor 2.
- For ℚ,i=4, K₆(ℤ)=0 and |K₇(ℤ)|=240, so the ratio is 1/120; the dyadic
  H²(ℤ[1/2],ℤ₂(4)) factor is again 2.
- A zero group contributes order one to either product.

### 6.6 Elements divisible by every integer

For any abelian group A define `divisibleSubgroup A` by
⋂_(m≥1)mA, using the existing images of multiplication. Prove
`mem_divisibleSubgroup_iff`, functoriality under homomorphisms, preservation
by isomorphisms and direct sums, containment in every multiplication image,
and triviality for finite A (`divisibleSubgroup_eq_bot_of_finite`). Name the
homomorphism inclusion `divisibleSubgroup_map_le`, the direct-sum equality
`divisibleSubgroup_directSum`, and the universal containment
`le_divisibleSubgroup_of_divisibleBy`: if every element of a subgroup D has
an m-th root in A for every m≥1, then D≤divisibleSubgroup A. Prove
`divisibleSubgroup_int` as a separate boundary theorem. The definition
asserts that each x has some m-th root in A for each m, with no compatible
choice and no requirement that those roots themselves lie in the subgroup.
It is therefore not a definition of the largest divisible subgroup.
(K-book, V.6.8.2, p. 413; Weibel, wild-kernel
preprint, introduction, pp. 1–3.)

**Checks.**

- For A=ℚ the subgroup is all of A, using x/m for m>0. The denominator
  restriction excludes division by zero.
- For ℤ and for ℤ/4 the subgroup is zero. In the finite example taking
  m=4 already kills the whole multiplication image.
- For ℚ⊕ℤ/4 it is ℚ⊕0. Componentwise root existence commutes with the
  finite support of a direct sum, rather than with an arbitrary choice of
  infinitely many coordinates.
- For ℚ/ℤ it is the whole group. By contrast div K₂(ℚ)=0: §8.2
  expresses K₂(ℚ) as a direct sum of finite groups, each of which has
  trivial div. The two torsion groups have different divisibility.
- A concrete counterexample to divisibility of div A is the abelian
  2-primary group generated by x,y₁,y₂,… with 2x=0 and 2ⁿyₙ=x.
  Here x≠0, as the map to ℚ/ℤ sending x to 1/2 and yₙ to
  1/2^(n+1) shows. The quotient by ⟨x⟩ is ⊕_(n≥1)ℤ/2ⁿ and has
  trivial div. Every positive integer divides x in A, so div A=⟨x⟩≃ℤ/2;
  it is not a divisible group. Coprime odd multipliers are automorphisms
  of this 2-primary group, which verifies the all-integers condition.
- A finite subgroup C of div A need not be divisible in itself. Its roots
  are taken in the ambient A; this distinction is needed in §6.13.

For positive even n, let T=K_n(O_(F,S)), embedded in K_n(F), and take m≥2
annihilating T. The universal coefficient injection T/m→K_n(O;ℤ/m)
identifies T with its image. First prove `coefficientKernel_eq_inter_mul`:
localization and odd integral injectivity force the coefficient kernel into
this copy of T/m, where it is exactly T∩mK_n(F). Next prove
`coefficientKernel_eventually_eq_div`: some multiple m₀ of the exponent of
T has T∩mK_n(F)=div K_n(F) for every positive multiple m of m₀. The
intersection over all positive m is div K_n(F), which lies in T by finite
support and the finite residue groups. Because T is finite, finitely many
moduli exclude all its elements outside div; their least common multiple
gives m₀. This proves eventual stabilization without a numerical bound.

An annihilator of T need not be a stabilization modulus, even for
arithmetic K₂. Name the underlying eventual group statement
`inter_mul_eventually_eq_divisibleSubgroup`: for a finite subgroup T of A
containing div A, some positive m₀ has T∩mA=div A whenever m₀ divides m.
An annihilator can be included in m₀, but is not itself a stabilization
bound. At a fixed modulus keep the exact intersection formula; equivalently,
the stronger conclusion at that modulus requires T∩mA⊆div A.

Here is an arithmetic negative control. Use Caputo's sextic field
F=ℚ(θ), θ⁶−793θ³+226981=0. His Proposition 4 and Example 2,
pp. 16–17, give μ₃⊂F, Pic(O_F[1/3]){3}≃ℤ/3, one prime v above 3,
and a nontrivial extension F(μ₉)/F that splits at v; they prove
div K₂(F){3}=0. The explicit field is the compositum with ℚ(μ₃) of
a diagonal cubic subfield of the compositum of the cubic fields of
conductors 61 and 9. Since 3 has order 10 modulo 61, that conductor-61
cubic is split at 3. Thus [F_v:ℚ₃]=6 and F_v=ℚ₃(μ₉), while
F does not contain μ₉. In particular the global and local 3-primary
root groups have orders 3 and 9, respectively; μ₂₇ cannot occur locally,
since its local degree is 18. The tame version of Moore's sequence gives
K₂(O_F){3}≃ker(ℤ/9→ℤ/3)≃ℤ/3. On the other hand Caputo's
Theorem 1, pp. 12–14, at i=1,n=1 gives

```text
(K₂(O_F){3} ∩ 3K₂(F){3}) / 3K₂(O_F){3}
  ≃ Pic(O_F[1/3]){3} ⊗ μ₃ ≃ ℤ/3.
```

Consequently 3 annihilates the tame 3-part but its coefficient kernel
is nonzero, whereas div is zero. To obtain an annihilator of the whole
tame kernel, multiply 3 by the exponent of its prime-to-3 part; that
factor acts invertibly on the 3-primary field group and leaves this
counterexample intact. The field/class-group data are an arithmetic
certification target in the format of §8.1: Caputo reports the class-group
calculation using PARI; the polynomial alone is not a certified class-group
computation. The conditional argument from his four arithmetic hypotheses
already specifies exactly what such a certificate must establish.
Name the open theorem target `caputoSexticArithmeticCertificate`: construct
certified arithmetic data for this sextic field proving that it contains μ₃,
has Pic(O_F[1/3]){3}≃ℤ/3 and one prime above 3, and that F(μ₉)/F
is nontrivial, unramified and split at that prime. Include the degree and
root-order checks used above. The conditional counterexample does not
require treating this computational certificate as already supplied.
(Caputo, arXiv:1002.2936v2, Proposition 2, p. 5, Theorem 1,
pp. 12–14, Proposition 4 and Example 2, pp. 16–17.)

This distinguishes the assertion in K-book V.6.8.2, p. 413, from the
eventual statement justified by the dated wild-kernel preprint,
Corollary 4.6, p. 13. Banaszak likewise uses a separately defined
stabilization index k_ℓ, rather than the exponent of the tame kernel
(arXiv:1208.2137v1, §4, equations (56), (59)–(60), p. 17;
§6, Remark 6.1 and Theorem 6.4, p. 31).

**Checks.**

- m=1 gives zero coefficient theory. It cannot annihilate nonzero T;
  when T=0 the assertion is vacuous.
- A modulus not annihilating T only sees T/m and cannot identify the
  whole group.
- Take A=ℤ/4 and T=2A. Then 2T=0, but T∩2A=T≃ℤ/2 whereas
  div A=0. Thus a general finite-subgroup argument cannot prove the
  stronger assertion.
- In A=ℤ/2^r with T=2^(r−1)A, the subgroups T∩2^νA equal T
  for ν<r and become zero at ν=r, although |T|=2 for all r≥1.
  Repeated equal kernels and |T| alone give no stabilization bound.
- In Caputo's field the 3-primary tame group has exponent 3, its
  coefficient kernel at 3 has order 3, and its div subgroup has order one.
  Increasing the modulus eventually removes that kernel. An annihilator
  and a stabilization modulus therefore differ in the arithmetic setting.

### 6.7 Three wild-kernel constructions

Define `rawWildKernel F i` for i≥1 as

```text
ker(K_(2i)(F) → ∏_(all finite and real places v) K_(2i)(F_v)).
```

The carrier is an additive subgroup of the actual field K-group, with
membership characterized by vanishing at each completion. Its API includes
the completion-coordinate formula, restriction compatibility where defined,
containment in the tame subgroup in degree two, and the degree-two Moore
comparison. Complex coordinates may be included without changing the
torsion kernel.
Use `mem_rawWildKernel_iff`, `rawWildKernel_le_ker`,
`rawWildKernel_le_range`, `rawWildKernel_two_le_unramifiedSubgroup`,
`rawWildKernel_two_eq_ker_hilbert` and `rawWildKernel_restrict_le` for
these coordinate, tame-containment and extension statements. The range
containment requires the applicable localization/completion comparison;
it is not a formal property of an arbitrary kernel. This infinite product is intentional and differs from
localization's finite-support direct sum. (K-book, V.6.8.2, p. 413.)

**Checks.**

- For ℚ, rawWildKernel in degree two is zero. The nontrivial element
  {−1,−1} of K₂(ℤ) has nontrivial real sign and is excluded.
- Its dyadic Hilbert symbol is also nontrivial. Using only finite tame
  residues would retain this element and incorrectly give the tame kernel.
- For ℚ(i), the degree-two raw kernel is zero since K₂(ℤ[i])=0.
- For ℚ(√−14), {−1,−1} is a nonzero wild class. A definition forcing
  the kernel to vanish for all imaginary fields fails.

Define `positiveEvenK F i` to be the kernel of the real symbol maps when
i≡1 mod 4, and all of K_(2i)(F) otherwise. Its inclusion and coordinate
membership API must agree with the real local table. The definition uses
the existing real symbol maps, rather than killing all real restrictions
uniformly. (Wild-kernel preprint, Definition 0.2 and §8, pp. 2, 20–21.)
`positiveEvenK_mem` gives coordinate membership,
`positiveEvenK_of_no_real_places` and `positiveEvenK_of_other_residue`
give the two full-group cases, and `positiveEvenK_ring_comap` identifies
the positive ring subgroup as the inverse image under localization.

**Checks.**

- At i=1 over ℚ, {−1,−1} is excluded by the real coordinate.
- At i=2 the positive subgroup is the full group by definition; the
  hidden real kernel in degree four is not removed here.
- With no real places every i gives the full group. The residue class
  of i, rather than that of 2i, selects the real-symbol case.

For finite v, construct `localSymbolFamily` through the supplier's finite
cohomological quotient

```text
D_i(F_v) = ⨁_ℓ H²(F_v,ℤ_ℓ(i+1)),       |D_i(F_v)| = w_i(F_v).
```

The ℓ-primary local comparison, real-symbol normalization, compatibility
with tame residues, and arithmetic finite-support theorem are its API.
The latter gives a map from positiveEvenK to ⊕_(v finite)D_i(F_v).
The local quotient kills the relevant divisible local part; it is not the
entire local K-group. Define `symbolWildKernel` as this map's kernel,
regarded as a subgroup of the field K-group. Include the kernel universal
property, coordinate vanishing, primary decomposition, and its relation
to the positive subgroup. (Wild-kernel preprint, Definition 0.2, p. 2;
local comparison and Moore sequence, pp. 2–3.)
The local map interface is `localSymbolFamily_apply`, `restriction`,
`transfer`, `degree_two`, `map_zero`, `map_add` and `ext`; extension and
transfer use the supplier's respective local maps. The kernel interface is
`symbolWildKernel_mem`, `le_positive`, `restriction`, `transfer` and
`degree_two`. `symbolWildKernel_lift`, `lift_coe` and `lift_unique` give
the factorization of a homomorphism whose every symbol vanishes through
the actual kernel inclusion, with evaluation and uniqueness.

**Checks.**

- At i=1, the maps are the finite Hilbert symbols together with the
  already imposed real signs. This recovers the classical wild kernel.
- A tuple with infinitely many nonzero local finite symbols is not an
  admissible image; finite support is a theorem to prove.
- The order of the finite local target is w_i(F_v), not w_(i+1)(F_v),
  despite the cohomological twist i+1.
- Vanishing of a finite local symbol is weaker than vanishing in the
  full local K-group when a divisible local part remains. The raw and
  symbol definitions must remain distinct in higher degree.

### 6.8 The Moore sequence and wild-kernel orders

Put D_i(F)=H⁰(F,ℚ/ℤ(−i))^∨, a finite cyclic group of order w_i(F).
Construct the invariant-sum map and prove the higher Moore exact sequence

```text
0 → WK^sym_(2i)(F) → K^+_(2i)(F)
  → ⨁_(v finite) D_i(F_v) → D_i(F) → 0.
```

The maps are the actual symbol and local-duality maps. At a prime ℓ,
restriction to the ring of integers gives

```text
0 → WK^sym_(2i)(F){ℓ} → K^+_(2i)(O_F){ℓ}
  → ⨁_(v|ℓ) D_i(F_v){ℓ} → D_i(F){ℓ} → 0.
```

Inverting primes above ℓ preserves the ℓ-primary even group, so that
particular S-integer replacement is allowed. An arbitrary larger S changes
the sequence unless the added residue terms are included. Derive the order
identity

```text
|WK^sym{ℓ}| · ∏_(v|ℓ)|D_i(F_v){ℓ}|
 = |K^+_(2i)(O_F){ℓ}| · |D_i(F){ℓ}|.
```

When replacing K^+ by ordinary K, retain its real factor; at ℓ=2 and
i≡1 mod 4 this is the factor 2^r₁ from the real-symbol quotient.
(Wild-kernel preprint, Lemma 0.3 and Corollary 0.4, pp. 2–3, with the
positive-group convention; K-book, VI.7, pp. 509–510.)

**Checks.**

- For i=1,F=ℚ the wild kernel is zero and the sign generator is absent from
  K^+.
- At odd ℓ the archimedean correction is trivial.
- At ℓ=2 and i=2 the positive subgroup is ordinary K but the separate
  ρ-kernel of the cohomological comparison remains.
- Adding a prime v∤ℓ with ℓ∣q_v^i−1 can enlarge the even ℓ-primary group and
  cannot be ignored.

### 6.9 Cohomological kernels and the real hidden subgroup

For finite S containing all primes over ℓ, define `cohomologicalWildKernel`
as the strict-zero Selmer kernel

```text
Sha²_(i,ℓ)(F) = ker(H²(O_(F,S),ℤ_ℓ(i+1))
                    → ∏_(v∈S∪S∞) H²(F_v,ℤ_ℓ(i+1))).
```

Specialize the L2 Selmer API instead of defining a second general Selmer
functor. Include its membership characterization, change-of-S comparison,
finite-level counterpart with μ_(ℓ^ν)^(⊗(i+1)), and the finite-cohomology
inverse-limit theorem identifying the continuous kernel. Ordinary, modified
and positive H² are different objects, with named comparison maps.
(Wild-kernel preprint, equations (0.5)–(0.6), p. 3.)
Name these specializations `cohomologicalWildKernel_mem`, `change_S`,
`inverse_limit`, `selmer` and `functoriality`; change of S includes the
localization residue terms and is proved under the stated finite-support
and primes-above-ℓ conditions. It is not an arbitrary identification of
kernels for unrelated local conditions.

**Checks.**

- At odd ℓ the archimedean factors may be omitted without changing the
  kernel.
- At ℓ=2 and i odd, ordinary real H²(ℝ,ℤ₂(i+1)) is ℤ/2 at each real
  place and must be included.
- At ℓ=2 and i even those continuous real H² groups vanish, although
  finite-level real groups can occur. Passing to the limit cannot be
  replaced by copying a finite-level table.
- A set S missing a prime over ℓ does not meet the comparison hypotheses.

Prove WK^sym{ℓ}≅Sha²_(i,ℓ) for odd ℓ, and at ℓ=2 if F is totally
imaginary or i≢2 mod 4. In the remaining real case, construct instead

```text
0 → C_(F,i) → WK^sym_(2i)(F){2} → Sha²_(i,2)(F) → 0,
```

where C_(F,i) is the actual kernel of
K_(2i)(O[1/2]){2}→H²(O[1/2],ℤ₂(i+1)), of order 2^ρ. Retain both
the kernel and map from §6.3. (Wild-kernel preprint, Proposition 8.1,
equation (8.2) and the final diagram, pp. 20–21.)

### 6.10 Special fields and a finite twisted norm test

For a number field F, define `IsSpecial F` by exceptionality and the
condition that every dyadic decomposition subgroup Γ_∞(F_v) is proper in
Γ_∞(F)=Gal(F(μ_(2^∞))/F). This is equivalent to properness at every
place: odd finite decomposition groups are procyclic, and the infinite
ones are finite, whereas Γ_∞(F) is noncyclic and infinite. The equivalent
local test at a dyadic v is **either** F_v is nonexceptional **or** there
is a dyadic root ζ with ζ+ζ⁻¹∈F_v but ζ+ζ⁻¹∉F. The second alternative
is required only for exceptional dyadic completions. It cannot replace
the disjunction. (Hutchinson, dated preprint, Definition 2.3 and
Remark 2.4, p. 4; finite subgroup calculations in Lemmas 2.6–2.7,
pp. 4–7.)
Use `IsSpecial.exceptional`, `local_alternative`, `iff_decomposition`,
`transport` and `iff` for these projections and characterizations; the
last retains both exceptionality and every dyadic alternative. These are the
`specialAtTwo` interface on this one predicate, not a second notion.

**Checks.**

- ℚ is exceptional but not special. Thus exceptionality is insufficient.
- ℚ(i) is nonexceptional and not special.
- ℚ(√−14) is special, and supplies an imaginary example with the
  nontrivial obstruction below.
- For F=ℚ(√−17), 17 is a square in ℚ₂, so F_v=ℚ₂(i).
  This completion is nonexceptional and its cyclotomic image is proper;
  F is special. Both F(i) and F_v(i) have only μ₄ among dyadic roots,
  so the old strict-root-enlargement test incorrectly rejected F.
- For squarefree d≠0,1, ℚ(√d) is special precisely when d≡−1 mod 8
  with d≠−1, or d≡±2 mod 16 with d≠±2. The excluded fields test the
  exceptional small root levels.

For the proof below also name `IsVerySpecial F`: F is exceptional,
totally imaginary, and every dyadic completion is nonexceptional.
Its API is `exceptional`, `totallyImaginary`, `dyadic_nonexceptional`,
`special` and `transport`. This auxiliary predicate records a defect of
the **full** cyclotomic tower; it does not change the final special-field
obstruction. (Hutchinson, Definition 2.3 and Remark 2.4, p. 4.)

**Checks.**

- ℚ(√−17) is very special by the preceding local computation.
- ℚ(√−14) is special but not very special: its dyadic completion is
  ℚ₂(√2), whose cyclotomic image still contains inversion.
- A real field is never very special. A field containing i is
  nonexceptional and never very special, even if all its completions
  are nonexceptional.

For F exceptional, i≥1 odd and m=2^ν sufficiently large, put
E=F(μ_m^(⊗i)), G=Gal(E/F), M=μ_m^(⊗i), and let Z_v be its dyadic
decomposition groups. Prove that F is special exactly when all Z_v are
proper in G. The map

```text
ρ₁ : ⨁_(v|2) H₁(Z_v,M) → H₁(G,M) ≅ ℤ/2
```

is zero in that case; otherwise some Z_v=G and it is a split surjection.
The lower bound on m ensures E is nontrivial and contains i; no assertion
at m=1 or 2 is intended. (Wild-kernel preprint, Corollary 3.7, p. 10,
Lemma 5.4 and Remark 5.2.1, p. 14.)

For a separate finite-field test take q odd, m=2^ν≥4 and i≥1. On the
faithful cyclic root-twist module M with Frobenius q^i, the norm
M_G→M^G is an isomorphism unless q^i≡−1 mod m; in that case it is zero
with invariant target of order two. At an odd prime-power modulus coprime
to q the corresponding faithful cyclic norm is onto. This is **not** the
finite-field multiplicative norm E×→k×. (Wild-kernel preprint, Lemmas 3.2
and 3.4 and Remark 3.4.1, p. 9.)

**Checks.**

- For m=4 and q^i=3, the norm is 1+3=0 modulo 4 while the invariant subgroup
  is {0,2}.
- For m=8 and q^i=3, the faithful action has order two, norm 4, coinvariants
  of order two and invariants {0,4}; the induced map is an isomorphism.
- At m=4 and q=2, multiplication by q is not an automorphism of ℤ/4.
  The coprimality hypothesis on q is essential to the group action.

### 6.11 Local norms and cyclotomic Picard descent

For a local field L containing μ_m, identify the Hilbert symbol condition
(a,b)_m=1 with b being a norm from L(a^(1/m)). Use T.7's classical norm
criterion, its uniformizer/unit computations and the real sign condition.
It is a degree-two certificate ingredient, not a definition of arbitrary
higher symbols. At ℝ and m=2, two negative entries give the nontrivial
symbol, whereas a positive second entry is a norm from ℂ×. This two-term
test fixes the norm and symbol directions. (Wild-kernel preprint, §2,
pp. 6–8; the local symbol contract of T.7.)

For m=ℓ^ν>1 a prime power, E=F(μ_m^(⊗i)) and G=Gal(E/F), take S containing
the primes dividing m and the ramified primes of E/F, and T exactly above
S. In the ordinary cohomological-dimension-two range (ℓ odd, or F totally
imaginary), prove `cyclotomicH2Descent`: corestriction induces

```text
H²(O_(E,T),μ_m^(⊗(i+1)))_G ≃ H²(O_(F,S),μ_m^(⊗(i+1))).
```

This is top-degree coinvariant descent for the finite étale cover obtained
after inverting S, not a claim that invariants and coinvariants agree.
Use ArithmeticGaloisDuality's top-degree duality and corestriction; the
totally imaginary case is the wild-kernel preprint's Corollary 2.3, p. 7,
and the same argument at odd ℓ has no real-place term. With the twist
trivialized over E, construct the
Kummer–Brauer sequence with Picard term Pic(O_(E,T))(i)/m, H² term and
local invariant-sum kernel M⁰. Define `cyclotomicPicardDescentSequence`
by applying coinvariants and this particular corestriction isomorphism:

```text
H₁(G,M⁰) → (Pic(O_(E,T))(i)/m)_G
  → H²(O_(F,S),μ_m^(⊗(i+1))) → M⁰_G → 0.
```

The H₁ defect cannot be dropped. For the dyadic real variant m>2 prove
`cyclotomicPositiveH2Descent`, the corresponding corestriction isomorphism
with H²₊ on both sides, and define `cyclotomicPositivePicardDescentSequence`
using Pic⁺ and positive H²₊. Keep the natural comparison maps
Pic⁺→Pic and H²₊→H², including their real-place defects; the ordinary
isomorphism above is not asserted in this case. Positive descent is
Corollary 6.5, p. 16. Descent and exactness use these named maps,
not merely a G-action. (Wild-kernel preprint,
Proposition 4.1 and Application 4.2, p. 11; Proposition 6.8 and equation
(6.9), p. 16.)

**Checks.**

- For E=F, corestriction and coinvariant descent are the identity, so
  the sequence is the original Kummer–Brauer sequence.
- For G=C₂ acting by −1 on ℤ/4, the coinvariants are ℤ/2 and
  H₁(G,ℤ/4)=ℤ/2. This nonzero homology group prevents a formal
  left-exactness claim for coinvariants.
- For real F at ℓ=2, the ordinary H² comparison has real-place
  terms (preprint equation (6.6.1), p. 16). It cannot replace positive
  descent. A set S omitting a prime above ℓ also fails the stated
  étale-cover hypothesis.

Prove `cyclotomicPicard_image_div` for i≥1 and sufficiently large
m=ℓ^ν, with **twist field** E=F(μ_m^(⊗i)) and S exactly the primes
over ℓ (and the archimedean conditions in the specified cohomology).
The image of its Kummer–corestriction map is div K_(2i)(F){ℓ} in
the cohomological-dimension-two comparison range. There is a separate
stabilization threshold as in §6.6; annihilating the integral ring group
does not by itself suffice. At ℓ=2 first prove the following ordinary
continuous-H² version for every number field, including real fields:
write T=H²(O_F[1/2],ℤ₂(i+1)), A=H²(F,ℤ₂(i+1)){2} and
D=⋂_ν 2^νA. Then the twist-field Picard image in T equals D.
(Caputo, Theorem 1, pp. 12–14, for odd ℓ; Hutchinson,
Lemma 5.1 and proof, pp. 16–17, Remark 5.4, p. 18, and
Theorem 5.6, pp. 18–19, for ℓ=2.)

Here is an independent proof route, replacing the unrestricted prime
prescription in the wild-kernel preprint's Lemma 4.4. For the full field
F_ν=F(μ_(2^ν)), its Kummer map followed by corestriction gives a complex

```text
(Cl_S(F_ν)/2^ν ⊗ μ_(2^ν)^(⊗i))_(Gal(F_ν/F))
  → T/2^ν → A/2^ν.
```

Its middle homology is ℤ/2 precisely for i even and F very special,
and zero otherwise, once ν is large. To prove this, use the Bockstein
sequence for T and A, keeping H³ at real places. For a real place,
H³(ℝ,ℤ₂(i+1)) is ℤ/2 when i is even and zero when i is odd;
in the former case the finite-H² boundary is an isomorphism. Apply
Poitou–Tate to the remaining strict finite H² kernels. Their duals are
Sha¹_S(Γ_ν,μ_(2^ν)^(⊗(−i))) and Sha¹_all(Γ_ν,μ_(2^ν)^(⊗(−i))).
The all-place Sha¹ is a subgroup of the S-local Sha¹; duality gives
a surjection in the reverse direction. Its kernel is exactly the
stated middle homology: the first Sha¹
has order two for odd i and special F, or even i and very special F;
the all-place Sha¹ has order two only for odd i and special F.
These are the explicit finite-group calculations of Hutchinson,
Theorem 2.8 and Corollary 2.9, pp. 6–8, used in Lemma 5.1.
No independent choice of ideal class and norm residue occurs.

For odd i the full field is the twist field and the complex is exact.
For even i pass instead to E=F(μ_(2^ν)^(⊗i)): its faithful cyclic
twist action removes the extra S-local Sha¹ defect, giving exactness
also in the very-special case (Hutchinson, Remark 5.4, p. 18;
Theorem 4.9(ii), p. 15). Finally T is finite and
ker(T/2^ν→A/2^ν)=(T∩2^νA)/2^νT. The separate eventual bound
identifies this with D. The norm-limit/finite-class comparison is
Hutchinson's Corollaries 4.7–4.8, pp. 14–15; it is not an
assumption that class-group norm maps are injective.

For comparison, the valid prime prescription is
`compatibleClassCyclotomicPrime`: let H be the Hilbert S-class field
(the narrow version if positivity is imposed), L=F(μ_m), and C=H∩L.
A class x and σ∈Gal(L/F) are simultaneously realized by infinitely
many primes outside a fixed finite set exactly when
Artin(x)|_C=σ|_C. The norm residue must first define σ in the actual
cyclotomic image. The proof applies Chebotarev to
Gal(HL/F)=Gal(H/F)×_(Gal(C/F))Gal(L/F), using arithmetic Frobenius.
This is a specialization of ClassFieldTheory's reciprocity and
GlobalNumberFields' Chebotarev, not a new unrestricted approximation
principle. It explains the failed lemma but is not needed for the
independent proof above.

**Checks.**

- Over ℚ(i), odd prime-ideal norms are 1 modulo 4; residue 3 does not
  even define an element of the cyclotomic image.
- Over ℚ(√−17), F(i)/F is nontrivial, unramified and split at 2,
  hence contained in H. A class with nontrivial Artin restriction to
  F(i) cannot be represented by a prime whose norm is 1 modulo 4.
  Inverting the dyadic primes does not remove this compatibility.
- For odd i and special F, both finite Sha¹ defects have order two,
  so their dual comparison has zero kernel: the Picard-image theorem
  still holds. It does not force the wild-kernel obstruction to vanish.
- For even i and very-special F the full-field complex has homology
  ℤ/2; replacing it by the twist-field complex is essential.
- If H∩L=F, the fiber-product condition is empty and the two
  prescriptions are independent, provided σ is in the cyclotomic
  image. If L⊆H, its Artin restriction is completely forced by x.
- At a real place and even i the Bockstein H³ term is nonzero.
  Ordinary finite H² cannot be substituted for integral H² modulo
  2^ν without the displayed boundary calculation.

### 6.12 Divisibility, special-field obstruction and completion boundary

For totally imaginary F, establish equality of div K_(2i)(F) and the
symbol wild kernel at odd primes, at i even, and at the remaining
nonspecial dyadic cases, using the precise Picard-image theorem just
specified. For a special totally imaginary field and odd i, retain the
exact sequence

```text
0 → div K_(2i)(F) → WK^sym_(2i)(F) → ℤ/2 → 0,
```

whose final map is the homology obstruction of ρ₁=0. No splitting is
asserted. (Wild-kernel preprint, Theorem 5.5, p. 14, and §6.)

For every number field F, Hutchinson's independent cohomological
calculation gives, for sufficiently large ν,

```text
0 → div H²(F,ℤ₂(i+1)){2} → Sha²_(i,2)(F)
  → Sha²_all(F,μ_(2^ν)^(⊗(i+1))) → 0.
```

The final term has order two exactly when i is odd and F special,
and is zero otherwise. This is Corollary 5.7 and proof, p. 19,
using the finite-group computation and the image theorem of §6.11.
It treats real places by their actual Bockstein terms, so it does
not depend on the failed prime prescription in Weibel's preprint.

For real F the ordinary integral comparison
H²_M(O_F[1/2],ℤ_(2)(i+1))→H²(O_F[1/2],ℤ₂(i+1)) is an
isomorphism for i≥1. Compare the two localization rows: their residue
terms are the same finite groups K_(2i−1)(k_v){2}, and restriction on
H³ is an isomorphism on the real-place terms. The ring comparison and
the residue comparison therefore identify the torsion field H² groups,
and carry their multiplication intersections to one another. This
transfers Hutchinson's div calculation to motivic H², without inventing
a real kernel in that H² comparison. (Wild-kernel preprint, Lemmas 7.2
and 7.4, p. 18; Hutchinson, Lemma 5.2 and Corollary 5.3, p. 18.)
The real correction belongs instead to the subsequent K-to-H² map.
In even weight retain Proposition 7.6's real-corrected exact sequence;
in odd weight identify the defect in (7.7).
Then prove C_(F,i)⊆div K_(2i)(F) for real F and i≡2 mod 4, using the
ambient field K-group for roots. In particular the image of K⁽M⁾₄(F) in
K₄(F) is divisible in that ambient sense. A finite C_(F,i) is not thereby
a divisible group in itself. (Wild-kernel preprint, Theorem B, p. 3,
Propositions 7.6 and 7.8, p. 19; Proposition 8.4, Lemmas 8.5–8.6 and
Theorem 8.7, pp. 20–21.)

Assemble `weibel_symbol_divisibility` for every number field and i≥1:
div K_(2i)(F)⊆WK^sym_(2i)(F), with quotient ℤ/2 for special F and odd
i, and zero otherwise. Use Hutchinson's independent cohomological result
for the formerly missing exceptional odd image step; retain Weibel's
real motivic/K comparison and the inclusion C_(F,i)⊆div, rather than
identifying those groups without their correction. (Wild-kernel preprint,
Theorem A, p. 1, §§7–8, pp. 18–21; Hutchinson, Corollary 5.7, p. 19.)

Keep raw completion and symbol kernels separate: there is always the
inclusion WK^raw⊆WK^sym. At i=1, prove equality by Moore's theorem and
the uniquely divisible local kernel, since the relevant global group is
torsion. In higher degrees a global torsion element might map nontrivially
into divisible residue-characteristic local torsion. To claim equality,
one must prove the explicit vanishing of those global-to-local images.
Without that additional theorem, no raw-kernel version of the preceding
symbol theorem is asserted. Name the conditional target
`rawWildKernel_eq_symbol_of_localRestriction_eq_zero`: for each place v,
assume that the actual restriction K_(2i)(F)→K_(2i)(F_v) is zero on
`symbolWildKernel F i`; then the two kernels agree. Establishing this
vanishing at i>1 is the open sub-target. Divisible local torsion does not
force the restriction to be zero. (K-book, V.6.8.2, p. 413; wild-kernel preprint,
Definition 0.2, pp. 2–3, and §1.)

**Checks.**

- ℚ is nonspecial, giving zero obstruction at i=1.
- The special imaginary field ℚ(√−14) at odd i has a quotient of order two,
  so exceptionality and specialness cannot be conflated.
- The hidden degree-four class for ℚ(√7) survives in K but lies in ambient
  div; it is not erased by identifying K with H².
- A higher local divisible quotient alone proves neither equality of
  raw/symbol kernels nor vanishing of a torsion image.

### 6.13 Keune's twisted Picard injection

For any number field F, odd prime p, n≥1, L=F(μ_(p^n)) and
G=Gal(L/F), construct `cyclotomicPicardInjection`

```text
(Pic(O_L[1/p])/p^n ⊗ μ_(p^n))_G ↪ K₂(O_F)/p^n.
```

No unramifiedness hypothesis on p in F is needed in this form.
Over L, take the Kummer connecting map
Pic(O_L[1/p])/p^n→H²(O_L[1/p],μ_(p^n)), tensor with μ_(p^n),
and apply corestriction to F. The final comparison is the degree-two
étale K comparison and invariance of K₂/p^n under inverting p.
The map on a class represented by an ideal is constructed by
principalizing that ideal in the maximal extension unramified outside
the primes over p, taking
the unit cocycle σ↦σ(α)/α, and then its Kummer boundary. Changing
the generator changes the cocycle by a coboundary. This fixes the
map, rather than choosing an abstract subgroup of the target.
(Caputo, Proposition 3 and Remark 5, p. 8.)

For injectivity, the twisted Kummer–Brauer sequence has last term
M⁰=ker(⊕_(w|p)μ_(p^n)→μ_(p^n)), with its permutation/twist action.
The faithful odd-primary cyclotomic action is cohomologically trivial;
Shapiro and the invariant norm sequence give H₁(G,M⁰)=0.
Consequently its Picard injection stays injective after coinvariants,
and the H² corestriction isomorphism of §6.11 finishes the proof.
(Caputo, Lemmas 4, 6 and 7, pp. 7–8, and Proposition 3, p. 8.)

A primitive-root basis makes the diagonal action g·x=χ(g)g(x), so
the source is the quotient of Pic/p^n by χ(g)g(x)−x, equivalently
g(x)−χ(g)⁻¹x. This is the χ⁻¹-coinvariant notation of
Calegari–Garoufalidis–Zagier v3, Lemma 3.5, p. 20; their
unramified-p setting is a specialization of the construction above.
Its API includes `apply_idealClass`, `independent_generator`,
`twist_relation`, `corestriction` and `injective`.

The hypothesis p∤|K₂(O_F)| gives zero source. To obtain the
invariant-vanishing corollary, split G=Δ×P with |Δ| prime to p
and P a p-group. Apply Δ's character idempotent first. For the
resulting finite p-module N, N_P=0 implies N=0 by Nakayama over
the local ring (ℤ/p^n)[P]. Thus its χ⁻¹ invariant part vanishes.
This is a vanishing implication, not an identification between
invariants and coinvariants. Keep the p∤|K₂| premise independent
of the vanishing being deduced.

**Checks.**

- A Kummer p-unit class need not be an ordinary unit before the valuation
  obstruction is killed.
- The prime p=2 is excluded. Ramified odd p is allowed: for
  F=ℚ(μ₃), p=3, n=1, G is trivial and the map is the twisted
  Kummer injection itself.
- A vanishing proof that assumes p∤|K₂(O_F)| may not use the desired
  vanishing to establish that hypothesis.
- Invariants and coinvariants of a finite p-module have no general canonical
  identification.
- For p=5 and a C₄ generator with χ=2, the χ⁻¹ component has
  action 3. The diagonal twist acts by 2·3=1 and survives;
  an untwisted quotient or the reverse twist acts by 3 or 4
  and has zero coinvariants. This detects both errors separately.

### 6.14 Finite presentations with independent lower bounds

Define `OrderCertificate A` for an abelian group A using finite
`Module.Relations ℤ`, a solution in A whose images span, a finite quotient
B of A with a proved surjection A→B, and the equality
|B|=|rel.Quotient|, where the latter quotient is finite. The two maps are
P=rel.Quotient↠A↠B. Their matched finite orders force the first map to
be an isomorphism. Its API includes `fromQuotient_surjective`,
`isPresentation`, `toPresentation`, `card_eq`, `linearEquiv` and
`ofIsPresentation` for a complete kernel proof. Every relation, spanning
assertion and lower-bound surjection is a mathematical proof field.
(Finite-group cardinal comparison and Mathlib's relations API; the
arithmetic examples follow K-book, III.5.2.2, p. 218 and III.6.2.1,
p. 232.)

**Checks.**

- One generator with relation 2g=0, a spanning proof for K₂(ℤ) and the
  real sign quotient of order two gives its certificate. The spanning
  proof is a separate supplied theorem.
- An empty presentation has order one; its spanning proof forces A=0.
  It cannot certify an arbitrary group just because no generators were listed.
- The map ℤ/4↠ℤ/2 satisfies the relation 4g=0 and spans the target,
  but gives only an upper bound four. There is no lower quotient of
  ℤ/2 of order four, so this is not a completed certificate.
- A verified complete-kernel presentation produces the same relations
  and solution under `toPresentation`, rather than a different abstract
  group of the same order.

Construct `OrderCertificate.ofCohomology` for A=K_(2i)(O_(F,S)), i≥1.
Given its upper presentation and span, take a finite set of primes covering
all prime factors of |P|. At each prime provide the **certified full order**
h_ℓ of the primary group through §6.1 or §6.3. In the real degree-four
row the value is 2^ρ|H²|; in degree six it is |H̃²|; in degrees zero
and two modulo eight it is |H²|. Project A onto the finite direct sum of
its specified primary components. If ∏h_ℓ=|P|, this supplies the independent
lower bound and the certificate. Include its cardinality formula and
compatibility with the original relations and solution.
(K-book, Theorem VI.8.2, p. 513 and Theorem VI.9.11, pp. 524–525.)

**Checks.**

- For K₂(ℤ), L={2}, h₂=2 agrees with the sign certificate. L=∅ gives
  product one and fails the order-two presentation.
- For a trivial presentation, the empty product one is valid once span
  has been proved.
- At K₄(O_(ℚ(√7))), ρ=1 and H² has order one; the primary order is
  two. Omitting ρ would undercount by two.
- A two-rank gives the number of primary cyclic factors, not h₂. Full
  cohomology cardinalities, all local maps and any extension kernel are
  required for an order computation.
- `OrderCertificate.ofCohomology_toPresentation` preserves the given
  relations and their images. The targets `evenK_toPrimaryCohomology_surjective`,
  `OrderCertificate.ofCohomology_card` and `ofCohomology_two_real` state
  respectively the primary projection, matched order and real correction
  used in this constructor.
- A conjectural or unproved special-value equality cannot fill a lower
  bound. A proven formula may supply a bound for other purposes, but
  cannot supply a bound of a computation intended to test that formula.

### 6.15 Adams signs and all-integer Bott degrees

For j∈ℤ and a sign ε=±1, define `bottCohomologySlot j ε` as (0,j)
if ε=(−1)^j, and (2,j+1) otherwise. The Lean convention uses a Boolean
`positive`, true for ε=+1. Its API includes both branch evaluations,
`bottCohomologySlot_totalDegree`, sign-switch behavior and invariance of the
cohomological degree when j increases by two. The total degree identity
is 2·twist−cohomologicalDegree=2j. This is a numerical convention for
dualization signs, not a construction of any Bott group.
`bottCohomologySlot_sign` identifies the sign (−1)^twist;
`bottCohomologySlot_period` keeps the cohomological index and adds two to
the twist when j increases by two. `bottCohomologySlot_compat` interprets
the selected slot in M.7 twists and the native `Module.End.eigenspace`.
(Feng–Galatius–Venkatesh, author PDF, Lemmas 2.11 and 2.14,
pp. 13–15; descent spectral sequence (2.6), p. 12.)

**Checks.**

- At j=0, positive gives (0,0) and negative gives (2,1); both have
  total degree zero.
- At j=−1, positive gives (2,0) and negative gives (0,−1); both have
  total degree −2. Natural-number subtraction would lose this case.
- At j=1, positive gives (2,2), so positive does not always mean H⁰.
- The operation is ψ^(−1), dualization. Complex conjugation on a
  cyclotomic base is a different operation with a different role.
- At j=1 the odd group is H¹(1) with negative dualization; at j=2
  it is H¹(2) with positive dualization.
- On ℤ/2 with the identity involution the positive and negative
  eigenspaces coincide. The odd-modulus splitting cannot be extended here.
- An identity scheme map gives identity edges and inverses; a composite
  of scheme maps gives their composites. A chosen abstract splitting need
  not satisfy either naturality test.

Take q=p^r with p odd and r≥1, and X either Spec ℤ[1/p] or
Spec ℤ[ζ_q,1/p]. Prove the natural even edge sequence

```text
0 → H²(X,ℤ/q(j+1)) → K^β_(2j)(X;ℤ/q) → H⁰(X,ℤ/q(j)) → 0.
```

Dualization acts by (−1)^(j+1) on the kernel and (−1)^j on the
quotient. The projectors (1±ψ^(−1))/2 therefore give its canonical
splitting into eigenspaces of the existing operator. Prove the odd-degree
identification K^β_(2j−1)≅H¹(X,ℤ/q(j)), with sign (−1)^j. The
cd≤2 descent spectral sequence collapses by parity; exact edge maps and
the equivariant splitting identify the actual maps. (The same source,
proofs of Lemmas 2.11 and 2.14, pp. 14–15.)
Name the exact edge sequence `bottEvenExact` and the native eigenspace
`bottAdamsPiece`. The restricted edges `bottEvenEdgeEquiv` and
`bottOddEdgeEquiv` identify the even and odd pieces. `bottEdge_natural`
states their compatibility, their inverse maps and the splitting for every
morphism of these descent filtrations commuting with dualization; its
identity and composition laws follow from those actual maps.

Spell out both bases' tables for every k∈ℤ:

| Degree and dualization sign | Cohomology |
| --- | --- |
| 4k−2, positive | H²(X,ℤ/q(2k)) |
| 4k−2, negative | H⁰(X,ℤ/q(2k−1)) |
| 4k, positive | H⁰(X,ℤ/q(2k)) |
| 4k, negative | H²(X,ℤ/q(2k+1)) |

For the cyclotomic base, the negative 4k−2 class is generated by the
corresponding Bott power after a root trivialization; degree-zero Picard
normalization is the first Chern class, or equivalently its independently
proved isomorphism. State the trivialization dependence rather than calling
that generator canonical. (The same source, Corollary 2.12 and Remark 2.13,
pp. 14–15.)

**Checks.**

- q=3 is allowed via the spectrum-level operation; no mod-3 ring structure is
  inferred.
- q=2 is excluded because division by 2 fails.
- k=0 and k=−1 are genuine periodic cases of the table.
- In degree 4k−2, interchanging the H⁰ and H² signs contradicts the j=−1
  test.

### 6.16 Comparison with ordinary K-theory and degree one

For R′=ℤ[1/p] or ℤ[ζ_q,1/p], prove that
K_i(R′;ℤ/q)→K^β_i(R′;ℤ/q) is an isomorphism for all i≥0.
For R=ℤ or ℤ[ζ_q] it is an isomorphism at i=0 and i≥2. Before
inverting p, degree one has the extra valuation class: localization gives
K₁(R′;ℤ/q)≅K₁(R;ℤ/q)⊕ℤ/q after choosing a uniformizer for the
principal p-prime. Bott-inverted localization is an isomorphism in all
integer degrees. Thus the unlocalized ordinary degree-one group is not
assigned the Bott H¹ formula. (Feng–Galatius–Venkatesh, Proposition 2.9
and Lemma 2.10, pp. 12–13; final assertions of Lemmas 2.11 and 2.14,
pp. 13–15 of the author PDF.)

**Checks.**

- On ℤ the ordinary odd-prime coefficient K₁ is zero, whereas on ℤ[1/p] the
  valuation of p gives a ℤ/q summand.
- In the cyclotomic ring the prime is generated by 1−ζ_q, allowing the same
  splitting after that choice.
- The degree-zero isomorphism needs the Picard/order argument and is not
  supplied by a comparison initially proved only injective at zero.
- Negative Bott groups are permitted; no negative ordinary comparison is
  asserted.

### Examples

The real fields ℚ(√2) and ℚ(√7) have the same signature but different
degree-four hidden kernels. ℚ and ℚ(√−14) distinguish nonspecial and
special dyadic obstruction. In Bott degree −2, the positive slot is H²
of twist zero, whereas the negative slot is H⁰ of twist −1. Together
these examples prevent treating the even theory as a single uncorrected
étale formula.

### Dependencies

Layers 1–5; M.7's comparison, real correction, Bott descent and
spectrum-level dualization; arithmetic Kummer/Brauer and Poitou–Tate;
strict Selmer kernels and inverse limits; local K-theory and symbols;
K.7's coefficient localization; finite-presentation/cardinality APIs. The
exceptional dyadic Picard-image argument and the higher raw-completion
vanishing are separate required theorems, with no substitution of the
symbol-kernel theorem for either one.

## Layer 7: Bernoulli numbers, regular primes and conditional tables

### 7.1 Three Bernoulli conventions and rational w-values

Use Mathlib's arithmetic B_n, with B₁=−1/2; its `bernoulli'` differs at
index one, where it is +1/2. Define the separate positive sequence
`bernoulliTop k = (−1)^(k+1) B_(2k)`. The intended topological sequence
has k≥1; its formula is merely totalized at k=0. The API gives the
conversion, positivity in the positive range, agreement of the arithmetic
and primed sequences away from one, the values at small indices and the
translation of numerator/denominator assertions. The existing
von Staudt–Clausen API gives the squarefree denominator of B_(2k), with
prime factors p such that p−1∣2k; it is not reproved here. The stronger
assertion p∤den(B_(2k)/k) when p−1∤2k is a Kummer-congruence input,
including the case p∣k. (K-book, VI.2.4.1, p. 472 and VI.2.4,
p. 472; Mathlib Bernoulli conventions and denominator theorems.)
Name the conversion `bernoulli_convert` and the positive-range absolute
value identity `bernoulliTop_eq_abs`. The arithmetic sequence remains
Mathlib's `bernoulli`, without a duplicate `bernoulliArith` carrier; its
index-one and denominator results are cited through `bernoulli_one` and
the existing Bernoulli denominator and squarefreeness theorems.

**Checks.**

- `bernoulliTop 1` is 1/6, whereas `bernoulli' 1` is 1/2. These are
  different conventions, not two spellings of one sequence.
- `bernoulliTop 2` is 1/30 although arithmetic B₄=−1/30.
- `bernoulliTop 5` is 5/66; `bernoulliTop 6` is 691/2730, from
  B₁₂=−691/2730. Arithmetic B₆=1/42 is a different index.
- At p=5,k=5, B₁₀/5=1/66 has no denominator factor 5, even though
  p∣k. The divided-denominator refinement must account for cancellation.
- At k=0 the light definition gives `bernoulliTop 0 = −1`. This
  input is outside positivity and the denominator statements, with no
  topological claim.

For k≥1 prove w_(2k)(ℚ)=den(B_(2k)/(4k)). Together with w_i(ℚ)=2
at odd i, this recovers the explicit prime formula of §4.4. For every
positive i, a prime p divides w_i(ℚ) exactly when p−1∣i. At odd i
only p=2 qualifies; the Bernoulli denominator formula itself requires even
positive weight. Include w₂(ℚ(i))=24 as the Gaussian
arithmetic input. (K-book, VI.2.4–2.4.1, p. 472.)
Use `wInvariant_even_rat` and `wInvariant_odd_rat` for the two rational
cases, `wInvariant_prime_divides` for the all-positive-weight prime test,
and `wInvariant_two_rat` for weight two. `wInvariant_even` records the
even order of a finite W_i over a number field, since its order-two twist
is fixed.

**Checks.**

- B₂/4=1/24, B₄/8=−1/240 and B₆/12=1/504 give the first three even w-values.
- B₁₀/20=1/264 fixes the weight-ten value.
- At odd i=3, p=2 divides w_i but the even Bernoulli formula is not
  applicable.

### 7.2 Regularity and Kummer's finite criterion

For a prime p define `IsRegularPrime p` by
p∤NumberField.classNumber(CyclotomicField p ℚ). The light predicate is
defined on all natural inputs; every arithmetic regularity theorem separately
assumes primality. Its API includes
equivalence with vanishing p-primary class group, the regular/irregular
dichotomy under primality, invariance under choices of primitive roots,
and the odd-prime Bernoulli criterion. This predicate does not include
Vandiver's plus-part assertion. The arithmetic definition is finite-level.
For odd p prove the Iwasawa equivalence between regularity and vanishing
of p-primary class groups throughout the p-power cyclotomic tower, using
the exact tower theorem from IntegralIwasawaTheory, rather than a definition
by conjectural tower behavior. (K-book, Example VI.2.4.1, p. 472;
IntegralIwasawaTheory's finite-class-group and tower contracts.)

Prove `kummer_criterion`: for odd prime p, irregularity is equivalent to
p dividing the numerator of some B_(2k) with 1≤k≤(p−3)/2. From the
Kummer congruences deduce that an odd regular p divides no numerator of
B_(2k)/k for k≥1. This conclusion about all k needs the congruence
argument, not just inspection of the finite initial range.
(K-book, Example VI.2.4.1, p. 472.)

The finite proof uses the direct Artin action on the p-class group A of
E=ℚ(μ_p). Its trivial and χ components vanish. For every even a,
character reflection gives

```text
dim(A/p)^(χ^a) ≤ dim(A/p)^(χ^(1−a)) ≤ dim(A/p)^(χ^a)+1.
```

Together with §7.3's Herbrand–Ribet equivalence for the other odd
characters, this proves that all class components vanish exactly when
the finite Bernoulli range is p-indivisible. Thus the criterion includes
the plus part; it does not assume Vandiver. The reflection proof uses
the Kummer pairing between the unramified radical and the class group,
whose dual character is χ times the inverse character. The intervening
unit radical has dimension at most one in each nontrivial even
character; the trivial component and the χ component vanish by descent
to ℚ and the ramification of E(μ_(p²))/E. (Sharifi, Theorem 4.4.2
and proof, pp. 111–113, Corollaries 4.4.4–4.4.5, p. 113.)

Here is the all-index step, including indices divisible by p. For even
n,n′≥2 congruent modulo p−1 and not divisible by p−1, the smoothed
Bernoulli measure has moments
(1−c^n)(1−p^(n−1))B_n/n. Choose c primitive modulo p. This moment
is integral, both displayed factors are units, and x^(n−1) and
x^(n′−1) agree modulo p on ℤ_p^×. Consequently B_n/n is p-integral
and B_n/n≡B_n′/n′ modulo p. Reduce n=2k to an even index
2≤n′≤p−3 and apply the finite criterion. If p−1 divides n instead,
von Staudt–Clausen gives v_p(B_n/n)=−1−v_p(n), whose reduced
numerator is again prime to p. Multiplying by 2 gives the asserted
statement for B_(2k)/k. This proof uses moments of a bounded measure,
not division of a congruence by the potentially nonunit k.
(Sharifi, Definition 5.2.4 and Proposition 5.2.5 with proof,
pp. 134–135; moment interpretation, Remarks 5.2.8–5.2.9,
pp. 135–136.)

For the tower equivalence take E_r=ℚ(μ_(p^r)), r≥1. Each
E_r/E_1 is a p-extension with exactly one ramified finite prime,
totally ramified. If its upper p-class group were nonzero, let H be
its maximal unramified abelian p-extension. H/E_1 is a finite
p-Galois extension. Its inertia subgroup at p maps isomorphically
onto Gal(E_r/E_1) and is proper in Gal(H/E_1). A maximal subgroup
containing that inertia is normal of index p; its fixed field is an
unramified degree-p extension of E_1, contradicting the zero base
p-class group. The converse includes r=1. This is the finite
one-prime argument behind IntegralIwasawaTheory §3.1, with no main
conjecture or control-isomorphism assumption. (Yokoyama, Theorem 4
and proof, pp. 354–355, attributing the argument to Iwasawa.)

The exact additional IntegralIwasawaTheory exports requested here are
`cyclotomic_kummer_congruence` in the preceding integral divided form,
`cyclotomic_finite_herbrand_ribet` with the action of §7.3, and
`cyclotomic_character_reflection` with the displayed component ranks.
The current §5.4 supplies general reflection but does not yet name
this component specialization. Its §3.1 already supplies the
one-prime theorem; this paragraph specializes it rather than
replanning class control.

Prove `isRegularPrime_of_lt_37` for every prime p<37. For p=2 use
ℚ(ζ₂)=ℚ and class number one; for the odd primes use the finite
Bernoulli criterion. This is a finite calculation, separate from the
all-indices Kummer-congruence consequence.
`IsRegularPrime.iff_not_dvd_classNumber` is the defining characterization.
`IsRegularPrime.iwasawa` is the regularity/tower equivalence with its odd
prime and cyclotomic hypotheses from IntegralIwasawaTheory;
`IsRegularPrime.decidable` uses a proved computation of the class number,
not an oracle inferred from an unproved table.

**Checks.**

- Prove the named target `isRegularPrime_three`: its finite Bernoulli
  range is empty. No Bernoulli index zero is inserted.
- Prove `not_isRegularPrime_37`: 37 divides the numerator of B₃₂,
  which lies in the permitted range. This is the first irregular prime.
- p=2 is not an instance of the odd-prime criterion, although its
  cyclotomic class-number predicate is defined there.
- Composite inputs and p=0 or 1 carry no regular-prime interpretation.
  The totalized predicate is true at 0, since class numbers are positive,
  and false at 1, since 1 divides every class number. These computed
  cases force the explicit `Nat.Prime` assumption in arithmetic use.
- The numerator and denominator are those of the reduced rational
  number. An unreduced fraction can falsely report divisibility.

### 7.3 Character projectors and Herbrand–Ribet

For an odd prime ℓ, let G=Gal(ℚ(ζ_ℓ)/ℚ), χ its mod-ℓ cyclotomic
character, and P=Pic(ℤ[ζ_ℓ,1/ℓ])/ℓ. Construct its χ^a eigenspaces
through the existing module-action API and the character projector

```text
e_a = (ℓ−1)⁻¹ ∑_(g∈G) χ(g)^(−a) g   over 𝔽_ℓ.
```

Prove the projector identities, sum to one, direct-sum decomposition and
compatibility with localization of the principal cyclotomic prime. For
1≤k≤(ℓ−3)/2 prove

```text
P^(χ^(1−2k)) ≠ 0  ↔  ℓ divides num(B_(2k)).
```

The exponent is ℓ−2k modulo ℓ−1. It is not 2k−1 unless the specified
action has first been inverted. The two implications are Herbrand and
Ribet respectively; their finite-class-group proofs and exact twist
translation are the IntegralIwasawaTheory requests just specified.
For Herbrand, project the Stickelberger annihilator to χ^a, a=1−2k.
Its scalar is (ω^a(b)−b)B_(1,ω^(−a)), where ω is the
Teichmüller lift of χ. A primitive b makes the first factor a unit,
since a≠1. The finite Teichmüller power-sum calculation gives
B_(1,ω^(2k−1))≡B_(2k)/(2k) modulo p. One can check this
normalization using ω(b)≡b^p modulo p² and the ordinary Kummer
congruence at N=1+p(2k−1); N≡2k modulo p−1 and N≡1 modulo p.
A nonzero class component therefore forces p∣num(B_(2k)).
(Sharifi, Theorem 4.5.7 and proof, p. 117; Ribet, Lemma 3.1
and proof, pp. 156–157.)

For the reverse direction, Ribet's Eisenstein congruence produces a
weight-two level-p eigenform with the prescribed residual characters.
Its p-adic representation is irreducible; the stable-lattice argument
chooses a nonsplit residual extension with diagonal characters
1 and χ^(2k−1), in that order. Restricting to G_E gives a nonzero
additive p-extension. It is unramified away from p by the level.
At p, the representation is realized in the p-torsion of the relevant
Jacobian over the real cyclotomic local field. Its ramification index
(p−1)/2 is less than p−1; the finite-flat group-scheme argument
splits off the connected part and makes the remaining local p-image
trivial. Thus the extension of E is everywhere unramified. Conjugation
on its upper-right entry is multiplication by χ^(1−2k), which is
exactly the direct Artin character on the class quotient, not its
inverse. (Ribet, Theorems 1.1–1.3 and the matrix calculation,
pp. 151–153; Proposition 2.1, pp. 154–155; Propositions 3.4–3.6
and Theorem 3.7, pp. 158–159; Propositions 4.1–4.3 and
Theorem 4.4, pp. 160–162.) These are supplier proofs for this
finite criterion, not appeals to the integral Iwasawa main conjecture.
(K-book, VI.10.4 and Examples VI.10.4.1–10.4.2, p. 530;
Remark VI.10.8.1, p. 532.)

**Checks.**

- For ℓ=37,k=16 the exponent is 5 modulo 36 and B₃₂ detects that component;
  exponent 31 would invert the character.
- The factor ℓ−1 is invertible over 𝔽_ℓ, but the same sum divided in ℤ is not
  an integral projector.
- At ℓ=3 the Bernoulli range is empty, consistently with regularity.
- These are character eigenspaces, not Adams-dualization pieces from §6.15.
- For G=C₄ over 𝔽₅ with χ(g)=2, an eigenvector of character χ³
  has g-action 3. Tensoring by χ gives the invariant scalar 2·3=1;
  tensoring by χ⁻¹ instead gives 3·3=4. This detects an inverted action.

### 7.4 The cyclotomic tame kernel and regular-prime torsion

For any prime ℓ, the unique prime above ℓ in ℚ(ζ_ℓ) has residue field
𝔽_ℓ and residue unit order ℓ−1, prime to ℓ. Thus inverting it introduces
no ℓ-primary residue term into even K-theory. This arithmetic fact requires
no regularity. For odd regular ℓ, combine the zero class-group ℓ-part,
the one-prime Brauer calculation and §6.1 to prove
K₂(ℤ[ζ_ℓ]){ℓ}=0. It is a tame-kernel theorem through T.5's
identification, not a general vanishing of the field K₂.
In fact the same calculation gives K_(2i)(ℤ[ζ_ℓ]){ℓ}=0 for every i≥1:
all twists modulo ℓ trivialize, the localized class-group ℓ-part is zero,
and there is one prime above ℓ. Conversely the irregular prime 37 has a
nonzero class-group 37-part, giving nonzero 37-primary groups in every
positive even degree over ℤ[ζ₃₇].
(K-book, Example VI.8.3.2, p. 514, and Proposition VI.10.5, pp. 530–531.)

For an odd regular ℓ, prove that K_n(ℤ){ℓ}=0 in every positive even
degree, and that in n=2i−1≥3 its torsion is the Harris–Segal cyclic
group of order w_i^(ℓ)(ℚ), nontrivial precisely when ℓ−1∣i. The
detected summand and the arithmetic e-map are those of Layer 5.
(K-book, Proposition VI.10.5, pp. 530–531.)

Prove the finite-coefficient module theorem: K_*(ℤ[1/ℓ];𝔽_ℓ)
is a free graded module over the indicated Bott operation of degree
2ℓ−2, with (ℓ+3)/2 generators, in degrees 0, 2ℓ−3, and 4k+1 for
0≤k≤(ℓ−3)/2. Define that operation by the following construction,
which includes ℓ=3 without an associative Moore product.
(K-book, Theorem VI.10.6 and Example VI.10.6.1, pp. 531–532.)

Put U=Spec ℤ[1/ℓ], V=Spec ℤ[ζ_ℓ,1/ℓ] and Δ=Gal(V/U).
Regularity and the single inverted prime give H²(V,𝔽_ℓ(i))=0
for every twist i. Prime-to-ℓ descent then gives H²(U,𝔽_ℓ(i))=0.
The normalized finite-coefficient edges consequently are isomorphisms

```text
K_(2i)(U;𝔽_ℓ) ≃ H⁰(U,𝔽_ℓ(i))                 (i≥1),
K_(2i−1)(U;𝔽_ℓ) ≃ H¹(U,𝔽_ℓ(i))              (i≥2).
```

At degree zero use K₀(U)/ℓ=𝔽_ℓ=H⁰(U,𝔽_ℓ(0)); at degree
one use units modulo ℓ and the Kummer isomorphism, since Pic(U)=0.
The class b=ζ_ℓ^(⊗(ℓ−1)) in H⁰(U,𝔽_ℓ(ℓ−1)) is invariant
and independent of the chosen primitive root. Cup product by b is
an isomorphism on these H⁰ and H¹ groups. Define
`regularBottShift` on K_n(U;𝔽_ℓ), n≥0, by transporting that
specific cup map through the two edges, including the stated
degree-zero and degree-one identifications. The map is 𝔽_ℓ-linear,
has degree 2ℓ−2, and its iterates define the action of t in
𝔽_ℓ[t]. This defines every power coherently; no choice of
parentheses in a mod-3 product enters the definition. The API includes
`edge_regularBottShift`, `regularBottShift_iterate`, root-choice
independence and compatibility with restriction to V. At safe primes
ℓ≥5 the multiplicative comparison identifies it with multiplication
by the descended β^(ℓ−1). At ℓ=3 this transported operation is the
specified meaning of that notation. (K-book, IV.2.8–2.8.2,
pp. 281–282, for the product exception; VI.8.3–8.5,
pp. 514–515, and VI.10.4–10.6, pp. 530–531, for the edges and
the invariant Tate class.)

For completeness the basis is computed, rather than inferred from a
dimension count in a few degrees. The Δ-representation of S-units
modulo ℓ is

```text
O_V^×/(O_V^×)^ℓ ≃ 𝔽_ℓ(1) ⊕ ⨁_(j=0)^((ℓ−3)/2) 𝔽_ℓ(−2j).
```

The first term is μ_ℓ. For the free quotient the equivariant
Dirichlet logarithm gives the characteristic-zero permutation
representation on complex places; the single inverted prime restores
the trivial character. Its ℤ_ℓ character projectors are integral
because |Δ| is a unit, so reduction gives each even character once.
This argument uses the rational representation, not an assertion that
every integral unit lattice is a permutation lattice. Choose a nonzero
x_j in each indicated even component, with x₀ the class of ℓ.
The Kummer sequence has no class term under regularity, hence
H¹(V,𝔽_ℓ(i)) is this unit module tensored by 𝔽_ℓ(i−1).
Taking invariants gives the basis 1 in degree zero,
v=ζ_ℓ⊗ζ_ℓ^(⊗(ℓ−2)) in degree 2ℓ−3, and
y_j=x_j⊗ζ_ℓ^(⊗2j) in degree 4j+1. Each occurrence is interpreted
through the edge map. The nonzero residue degrees modulo 2ℓ−2
are exactly these distinct degrees, and cup product by b identifies
all repetitions. Thus their iterates form a free 𝔽_ℓ[t] basis.
The choices of x_j make the basis noncanonical, whereas the operation
is fixed. (K-book, Examples VI.10.4.1–10.4.2, p. 530, and proof
of VI.10.6, p. 531.) The character calculation fixes the H¹ parity:
one invariant in every odd weight, and in an even weight exactly
when that weight is divisible by ℓ−1.

**Checks.**

- At ℓ=2 the residue unit order is one and the arithmetic residue statement
  still holds, but the regular-prime consequences above are odd-prime
  statements.
- At ℓ=3, the generator degrees are 0,3,1; the count is three.
- At ℓ=5 they are 0,7,1,5, giving four.
- At ℓ=3 the shift has degree four and gives dimensions 1,1,0,1
  in residue degrees 0,1,2,3; its square is the composite of two
  shifts. At ℓ=5 the corresponding eight dimensions are
  1,1,0,0,0,1,0,1. A shift by degree two would fail both tests.
- Replacing ζ by ζ^a multiplies b by a^(ℓ−1)=1. A nonregular
  prime leaves a nonzero H² term, so the inverse even edge used to
  define this operation is unavailable in that case.
- At ℓ=3, the odd torsion in degree 3 has order 3, while degree 5 has no
  3-torsion since 2∤3.
- The full degree-three group over ℤ has order 48 because its dyadic real
  contribution is separate.

### 7.5 Vandiver and the conditional integer table

Use IntegralIwasawaTheory §7.1's `VandiverCondition`: for odd p, the
class number of the maximal real subfield of ℚ(ζ_p) is prime to p.
It is weaker than regularity and is not built into `IsRegularPrime`.
Require the precise plus-part tower, reflection and cyclicity consequences
before deducing group structure, and the special-value order formulas of
K-book VI.10.1, p. 527, before assigning orders. (K-book, Conjecture VI.10.8,
p. 532, and Theorems VI.10.9–10.10, p. 533.)

The finite deduction can be checked without assuming a tower
control isomorphism. Write P=Pic(ℤ[ζ_p,1/p])/p with the direct
action of §7.3. Extension and norm for the real subfield, whose
degree is two, identify its p-class group with the plus part. Under
Vandiver all even components P^(χ^(2a)) vanish. Character reflection
from §7.2 bounds each complementary odd component by dimension one.
Kummer–Brauer and prime-to-p descent identify

```text
K_(2i)(ℤ)/p ≃ H²(U,𝔽_p(i+1)) ≃ (P⊗𝔽_p(i))^Δ ≃ P^(χ^(−i)).
```

The first identification is for i≥1; localization at p changes no
p-primary term. Thus K_(4a)(ℤ){p}=0, and K_(4a−2)(ℤ){p} has
dimension at most one modulo p. These finite groups are consequently
cyclic. Conversely all the even character components are detected by
the degrees 4a; periodicity modulo p−1 makes finitely many such
degrees sufficient for each p. The vanishing of the trivial and χ
components is unconditional. This proves the Vandiver/vanishing
equivalence and the cyclicity used in the table. It uses exactly
`cyclotomic_character_reflection`, not an unproved assertion that
irregular components have known order. The plus-part tower requested
from IntegralIwasawaTheory §§7.1–7.4 retains its one-prime and
cyclotomic hypotheses; no stronger norm-isomorphism statement is
needed for this finite argument. (Sharifi, Theorem 4.4.2 and
Corollaries 4.4.4–4.4.5, pp. 111–113; K-book,
Theorems VI.10.9–10.10 and proofs, p. 533.)

Assuming Vandiver for **every odd prime**, put
c_j=|num(B_(2j)/(4j))| for j≥1. Prove the following abstract table for
n≥2, with a≥0 except that the first row starts at a≥1:

| Degree | K_n(ℤ) under the global Vandiver hypothesis |
| --- | --- |
| 8a+1 | ℤ ⊕ ℤ/2 |
| 8a+2 | ℤ/(2c_(2a+1)) |
| 8a+3 | ℤ/(2w_(4a+2)(ℚ)) |
| 8a+4 | 0 |
| 8a+5 | ℤ |
| 8a+6 | ℤ/c_(2a+2) |
| 8a+7 | ℤ/w_(4a+4)(ℚ) |
| 8a+8 | 0 |

The degree-four vanishing K₄(ℤ)=0 is an unconditional theorem and must
not acquire a Vandiver hypothesis by being included in this table.
The joint higher assertion K_(4i)(ℤ)=0 for all i≥2 is equivalent to
global Vandiver under the cited cyclotomic comparison. At irregular
primes full orders and cyclicity need the stated reflection and order
inputs; the regular-prime theorem alone does not give this table.
(K-book, VI.10.1–10.2 and Tables 10.1.1–10.2.1, pp. 527–529; VI.10.9–10.10,
p. 533.)

**Checks.**

- At a=0, c₁=1, giving K₂(ℤ)=ℤ/2; the next row gives K₃(ℤ)=ℤ/48.
- The 8a+1 row cannot be used at a=0, since K₁(ℤ) is finite.
- A verified finite range of Vandiver primes is not the global hypothesis.
- Every number obtained under that hypothesis is labeled as conditional,
  including any cyclic structure that uses it.

### Examples

The pair B₁₂=−691/2730 and positive `bernoulliTop 6`=691/2730 tests
the sign and indexing used in order numerators. The regular prime 3 has
no Kummer test indices, while 37 is detected at B₃₂. The unconditional
first four K-groups of ℤ agree with the low entries of the conditional
table without being proved from its hypothesis.

### Dependencies

Layers 3–6; Mathlib's Bernoulli, class-number and cyclotomic-prime API;
IntegralIwasawaTheory §§0.1–0.5, 3.1, 5.4 and 7.1–7.4,
with the exact additional congruence, finite Herbrand–Ribet and
character-reflection exports requested in §7.2; M.7's normalized
finite-coefficient edges for the constructed Bott shift; the detected
Harris–Segal construction; the one-prime Brauer calculation; §7.5's
special-value order formulas for the conditional full table. Arithmetic
regular-prime conclusions do not import the downstream K₃/Bloch analysis
or the full Chern/regulator family.

## Layer 8: independently certified arithmetic examples

### 8.1 Arithmetic data and the meaning of a certificate

Define `ArithmeticData F` to bundle the degree, real and complex place
counts, class number, unit rank and the positive-index values w_i(F).
Every entry includes equality to the actual arithmetic invariant, rather
than being an unconstrained natural number. Require r₁+2r₂=[F:ℚ]
and unit rank r₁+r₂−1. `CertifiedExample F` combines these data with
§6.14's finite presentation, its surjective generator map into the actual
tame kernel, and an independent finite quotient of the same order. Give
`CertifiedExample.tag` the values computed, imported and deduced, and
retain the dependencies of each numerical claim. The target
`CertifiedExample.no_circularity` says that neither bound used in a
Birch–Tate test depends on the Birch–Tate formula. An upper-bound report
is admissible data, but becomes a certified group computation only after
a matching lower bound or a complete kernel proof. These are a
specialization of finite-presentation and finite-cardinality arguments,
not a new arithmetic algorithm. *Needs:* §6.14, NumberFieldArithmetic's
actual invariants, and the symbol maps of K2SymbolsBrauer T.3/T.5.
`CertifiedExample.admissible` packages the verified equalities and the
separate relation, span and lower-bound obligations; it never coerces an
unchecked numerical record into a theorem.

**Checks.**

- Replacing the degree of ℚ(√5) by 3 fails the equality to its actual
  degree 2, even if other numerical fields are altered to fit a formula.
- A presentation with two generators of order two gives an upper bound
  four. Without span and an independent quotient of order four it does
  not compute the tame kernel.
- The Gaussian calculation below has an empty generating set and a
  quotient onto the trivial group; its order one is computed.
- The rational data and sign symbol certify order two independently.
  A value deduced from Birch–Tate is a valid consequence of that theorem,
  but fails the independence condition for a test of that same theorem.
- The golden-field example has two generators, two order-two relations
  and the two real signs as an independent quotient. Its order four is
  computed; the equality 4/120=1/30 is a subsequent special-value test.

### 8.2 Integers, one inverted prime and the rational field

Combine the supplier identifications in low degree with §5.4 to give
K₀(ℤ)=ℤ, K₁(ℤ)=ℤ/2, K₂(ℤ)=ℤ/2 and K₃(ℤ)=ℤ/48. The
first three identifications come from their existing owners. The degree
three calculation uses w₂(ℚ)=24 and the nonsplit real extension, not
a regulator or a Bloch-group calculation. Record the unconditional
K₄(ℤ)=0 separately from §7.5's conditional higher table.
(K-book, III.6.5.1, p. 236; VI.1.1 and VI.1.3, pp. 464–465;
VI.9.5, p. 519; Remark VI.10.1.3, pp. 528–529.)

For every rational prime p, localization gives an isomorphism on K₀ and,
for all n≥1, an exact sequence

```text
0 → K_n(ℤ) → K_n(ℤ[1/p]) → K_(n−1)(𝔽_p) → 0.
```

At n=1, use the zero map K₀(𝔽_p)→K₀(ℤ), and obtain
K₁(ℤ[1/p])≃ℤ/2⊕ℤ, with the second coordinate the valuation of p.
For odd n≥3 the map from ℤ is an isomorphism. For n=2i≥2 the quotient
is cyclic of order p^i−1; the order of the middle group is
|K_(2i)(ℤ)|(p^i−1). At i=1 the real sign splits the sequence, giving
K₂(ℤ[1/p])≃ℤ/2⊕ℤ/(p−1). In higher even degrees do not assert a
splitting or an extension class from this order alone. In the unconditional
case K₄(ℤ)=0 this nevertheless determines K₄(ℤ[1/p])≃ℤ/(p²−1),
so K₄(ℤ[1/2])≃ℤ/3.
(K-book, V.6.1, p. 406, III.6.5.1, p. 236; VI.8.1, p. 513.)

**Checks.**

- At p=2 the degree-two quotient is trivial, so K₂ is unchanged.
- At p=3 it gives ℤ/2⊕ℤ/2 rather than a cyclic group of order four.
- The degree-one quotient is K₀(𝔽_p)=ℤ, not a finite-field positive K-group.
- The map in odd degree three preserves ℤ/48.
- These are exact localization maps, so their rationalized identities agree
  with §3.3.

The same localization, with the low-degree sign splitting imported from
T.5, gives
K₂(ℚ)≃ℤ/2⊕⊕_p 𝔽_p×. It is an infinite torsion group, whereas
K₂(ℤ) has order two. This is a group computation; it does not replace
the finite-support localization map by a product.
(K-book, III.6.5.1, p. 236; VI.8.3, p. 514.)

**Checks.**

- The residue term at 2 is trivial, at 3 has order two, and at 5 has order
  four.
- Finite sums of these residue classes are allowed; a family nonzero at
  infinitely many primes is outside the direct sum.
- The field/ring distinction agrees with the positive-even rank-zero theorem
  and does not imply finite generation for K₂(ℚ).

### 8.3 Tate's filtration and the unit quotient

For a number field F, enumerate its finite places v₁,v₂,… in
nondecreasing absolute norm, fixing an order at each tie. Put
S_m={v₁,…,v_m}, with S₀ empty, and U_m=𝒪_(F,S_m)×.
Define `tateFiltration m` to be the subgroup of K₂(F) generated by
{a,b} with a,b∈U_m. Its API comprises `tateFiltration_mono`,
`iSup_tateFiltration`, `tameSymbol_eq_one_of_mem_tateFiltration`,
`tateGradedResidue`, and `tateFiltration_zero_le_unramified`.
The union is all K₂(F) by the field symbol presentation and finite
support of valuations; the residue at v_m kills step m−1 and so defines
step m/step (m−1)→k(v_m)×. Step zero lies in T.5's unramified
subgroup. The steps are images in K₂(F), not the abstract truncated
symbol presentations, whose maps can have kernels.
(Bass–Tate, II §3, Theorem 3.1 and Lemma 3.2, pp. 403–407;
Groenewegen, author preprint, §§1–2, pp. 1–4.)

When the v_m-prime in the preceding ring is principal, choose a generator
π and set U=U_(m−1). Then U_m≃U×π^ℤ via valuation, and define
`tateAlpha : U → step m/step (m−1)` by u↦{u,π}. It is onto.
Define `tateUnitSubgroup` to be U₁=⟨(1+πU)∩U⟩. Prove that α
kills U₁, U₁≤ker β for the reduction β:U→k(v_m)×, and
`tateGradedResidue_comp_tateAlpha` is β. Therefore an isomorphism
β̄:U/U₁→k(v_m)× forces the graded residue to be an isomorphism.
The kernel statements and triangle are independent of a change of π
by an old unit. *Needs:* Layer 1's units, T.3's symbol identities and
§2.2's explicit inversion between the boundary and Tate conventions.
(Bass–Tate, II Lemma 3.2, pp. 404–407; Appendix Proposition 1,
pp. 430–431; Groenewegen, Lemma 7 and triangle, pp. 6–7.)

**Checks.**

- Over ℚ step zero is generated by {−1,−1}. The element {−1,3}
  is outside the step with only 2 inverted, since its 3-residue is −1.
  Allowing all integral entries instead of units would fail this test.
- At the Gaussian prime π=1+i, the identity i=1+(1+i)i puts i in
  U₁; since U=⟨i⟩, this gives U₁=U and trivial graded group.
- Over ℚ at the prime 5, the previous unit 2 maps by α to {2,5},
  whose Tate residue is 2. Reversing the entries gives 3 modulo 5,
  not 2, and would reverse the triangle's convention.
- The subgroup at step zero over ℚ is unramified, consistently with
  T.5's K₂(ℤ) identification. The equality with the full tame kernel
  requires the separate descent theorem, rather than its definition.
- An abstract symbol presentation at one step need not inject into the
  next one. Taking its image in K₂(F) makes the filtration inclusions
  injective by construction.

### 8.4 Tate's criterion and descent

At a principal step, let W,C,G⊆U satisfy: W generates U and W⊆CU₁;
CG⊆CU₁ and β(G) generates k(v)×; and 1∈C with
C∩ker β⊆U₁. Prove `tateCriterion`: β̄ and the graded residue are
isomorphisms. The proof makes CU₁ into all of U using the finite
residue group and then proves ker β=U₁; surjectivity of β by itself
is insufficient. For integral a,b∈U with equal residue, the auxiliary
`smallNorm_unitCongruence` uses |N_(F/ℚ)(a−b)|<q² to conclude
a/b∈U₁. If a=b this is immediate; otherwise the unique v-factor and
all smaller remaining prime factors put (a−b)/π in U. In an imaginary
quadratic field the sufficient complex bound is |a|+|b|<q.
(Bass–Tate, Appendix Proposition 1 and Lemma 1, pp. 430–431;
II Lemma 3.4, proof, Claim 2, pp. 410–411.)

Prove `tameKernel_le_tateFiltration`: if every graded residue after m₀
is an isomorphism, then the tame kernel lies in step m₀. An element
starts in a finite step; zero residues successively lower that step.
If every positive step is an isomorphism, the tame kernel equals step
zero. This finite descent uses exhaustion, not an infinite descending
limit. *Needs:* §8.3 and the elementary exact quotient argument.
(Bass–Tate, II Theorem 3.1, p. 403; Groenewegen, Theorem 15,
pp. 12–13.)

**Checks.**

- A trivial residue group, including q=2, does not prove a step zero without
  injectivity.
- At a=b no division by a−b is used.
- Equality |N(a−b)|=q² permits two v-factors and is excluded.
- Tied norms do not cause an error: after removing the one v-factor the
  remaining ideal has norm strictly below q.
- The case m₀=0 gives ordinary-unit generators, whereas m₀>0 retains the
  indicated additional generators.

### 8.5 The Gaussian tame kernel

For F=ℚ(i), use NumberFieldArithmetic's 𝒪_F=ℤ[i], principal ideals
and units ⟨i⟩. Prove every graded residue is an isomorphism. At
v=(1+i), use W={i}, C=G={1} and the identity in §8.3. Every other
prime has norm q≥5. Euclidean approximation has covering radius
1/√2; take C=G to consist of the nonzero Gaussian integers c with
2N(c)≤q, and W consisting of i and generators of preceding primes.
Division with a nearest Gaussian remainder gives residue representatives;
the inequalities in Tate's criterion hold already at q=5. Descent leaves
step zero, generated by {i,i}. Its value is zero, using the Steinberg
relations {i,1−i}=0 and {−i,1+i}=0, bilinearity and
1+i=i(1−i). In fact the second relation gives 3{i,i}=0, while i⁴=1
gives 4{i,i}=0; hence {i,i}=0. Thus
K₂(ℤ[i])=0. This supplies both bounds of a certificate of order one.
(Bass–Tate, Appendix Proposition 2 and Lemma 2, pp. 431–433,
and d=−4 calculation, p. 436; K-book, III.5.2.2, p. 218.)

**Checks.**

- The prime of norm two is handled separately; applying a large-prime
  inequality there would fail.
- At q=5, 1+1/√2<√5 and √2<√5 are the strict Euclidean bounds.
- All later norms satisfy them.
- At q=5 the eight-element set C consists of ±1,±i and ±1±i, and its
  reduction covers the four nonzero residue classes; the four units already
  supply those classes.
- Restriction of {−1,−1} from K₂(ℤ) vanishes, since {−1,−1}={i²,i²}=4{i,i}=0.
- The zero tame kernel does not assert K₂(ℚ(i))=0: the field still has
  residue classes.
- The empty presentation gives order one, rather than an unproved assertion
  that a displayed set of relations is complete.

### 8.6 Congruence lattices in the golden field

Put F=ℚ(√5), ε=(1+√5)/2, O=ℤ[ε] and ε²=ε+1. Import the
integral basis, principal-ideal property, units ±ε^ℤ, degree two,
signature (2,0) and class number one through the current
`TauCeti.NumberField.Sqrt5` suppliers fixed above.
Write [a,b] for a+bε. Multiplication, conjugation and norm are

```text
[a,b][c,e] = [ac+be, ae+bc+be],
conj[a,b] = [a+b,−b],             N[a,b] = a²+ab−b².
```

Let d=2√5/π and B_t={(z₁,z₂):(z₁²+z₂²)/2≤t} in the real
embedding space. For s=2 or 3 and nonzero residues a₁,…,a_(s−1)
at v of norm q, define `GoldenCongruenceLattice` by
x_j≡a_j x_s (mod v) in O^s. The API supplies its embedding,
`covolume = 5^(s/2)q^(s−1)`, `smallTuple` and `oldUnits`.
The names `GoldenCongruenceLattice.covolume`, `smallTuple` and `oldUnits`
refer to this one construction, with the bounds below explicit in their
hypotheses.
For t>0 with t^s≥d^s q^(s−1), every positive diagonal stretch ξ
with determinant one admits a nonzero tuple in (ξB_t)^s. If t<q,
all its coordinates are nonzero old units: their norms are at most t,
so zero residue would force the entire tuple to be zero, and every
prime in their support has smaller norm. This uses the ordinary
Minkowski bound with density at most one; no optimal packing constant
is required. *Needs:* IntegralLattices' Minkowski and covolume API,
NumberFieldArithmetic's embeddings and ideal norm, and §8.3.
(Groenewegen, Lemma 6, p. 5, Lemma 9, p. 8, and
Lemma 12, p. 11; here specialized to degree two and with the
weaker packing estimate one.)

**Checks.**

- At s=2 the covolume is 5q and the bound is t²≥d²q. At s=3
  they are 5√5 q² and t³≥d³q²; an exponent q instead of q² fails
  the index of the two congruences.
- The stretch diag(2,1/2) preserves covolume and the product of real
  coordinates, so |N(x_j)|≤t remains true.
- At v=(2), q=4 and t=q, the tuple (2,2) lies in the lattice for
  residue 1 and in B₄², but has zero residues and is not an old-unit
  tuple. Thus `oldUnits` requires the strict bound t<q.
- ε=[0,1] has norm −1, and [1,1]=ε² has norm 1. The absolute
  value of the norm, rather than the signed norm, bounds ideal size.

### 8.7 A small-fraction section and the cutoff

For q>4d² choose a generator π_v and define U,U₁ as in §8.3.
Using §8.6 with t=d√q choose x,y∈O∩U∩B_t with residue x/y=a
for each a∈k(v)×. Define `GoldenResidueSection a=[x/y]∈U/U₁`.
Its API is `independent`, `compare`, `reduction` and `one`:
that is, `GoldenResidueSection.independent`, `compare`, `reduction` and
`one` on the chosen section:
β̄γ=id and γ(1)=1; equal-residue fractions from ξB_t and ξ′B_t′
have the same class whenever 4tt′<q². The stretches on the two
entries of each fraction are the same, but may differ between the two
fractions. For the comparison use xy′−x′y; its norm is at most
4tt′. If it is zero the fractions already agree; otherwise apply the
small-norm congruence theorem. Multiplicativity is a further theorem,
not part of the choice of representatives.
(Groenewegen, Proposition 10 and the following definition,
pp. 8–9.)

**Checks.**

- x=y=1 gives γ(1)=1. Comparing a fraction with itself uses a zero
  cross-difference and never its inverse.
- Fractions obtained with diag(2,1/2) and with the identity stretch
  represent the same class for the same residue under the stated bound.
- At (2), the residue of ε has order three; choosing this one
  representative does not supply a section on the whole multiplicative
  group or prove multiplicativity. The q>4d² construction is separate.
- Reversing x/y to y/x gives the inverse residue, so the two entries
  are not interchangeable in `reduction`.

Prove `goldenLargePrimeCutoff`: every prime of norm q>33 has
β̄:U/U₁≃k(v)× and hence an isomorphic graded residue. Establish
four strict inequalities

```text
q > 16d²,     q > (20d)^(2/3),     q > d³,
q > 2^(12/5)d^(12/5).
```

For a rational bound, π>157/50 gives 16d²=320/π²<33; d<3/2
makes the middle bounds less than 10 and 27/8. The last bound is
less than 16d² since d<16. Three arguments then prove the theorem.
First, obtain x,y,z in B_s with x/z=a and y/z=ab, where
s=dq^(2/3), and a two-coordinate representative x′/z′ for b in
B_t, t=d√q. The bound 4st<q² makes xx′ and yz′ congruent
modulo U₁. It gives γ(a)γ(b)=γ(ab).
(Groenewegen, Lemma 12 and Proposition 13, p. 11.)

Second, for each preceding prime p′ of norm q′≤q, Minkowski in
(p′)⁻¹ gives a nonzero π′ with
|σ_i(π′)|≤(√5/q′)^(1/2)<1. The integral ideal (π′)p′ has
norm at most √5<4, and there is no prime of norm below 4. Therefore
it is O and π′ is an inverse generator. Compare π′ with x/y from
B_t representing its residue. If z=π′y−x≠0, the integral ideal
(z)p′ has norm at most 4tq′≤4dq^(3/2)<q² and is divisible by v.
Removing this v-factor leaves norm below q, so z/π_v has only old
support, even when q′=q. Thus π′/(x/y)=1+π_v(z/(π_v x))
lies in 1+π_vU. If z=0 equality is immediate. This proves γβ̄ fixes
the inverse generators of all preceding primes.
(Groenewegen, §4, p. 9, specialized using the golden-field
absence of primes of norm below 4.)

Third, ordinary units −1 and ε satisfy
H(a)=∏_i max(1,|σ_i(a)|)≤5. Choose
ξ_i=√H(a)/max(1,|σ_i(a)|), so det ξ=1. A small fraction for
the residue of a in ξB_t has x,ay∈B_(tH(a)). Therefore
|N(ay−x)|≤4tH(a)≤20d√q<q², proving γβ̄ fixes these units
as well. They and the inverse prime generators generate U, so γ and
β̄ are inverse homomorphisms. *Needs:* §8.6's two- and three-coordinate
lattices, §8.4 and the imported explicit units.
(Groenewegen, §6, pp. 10–11, and Theorem 14, p. 12.)

**Checks.**

- The proof uses q>33, retaining all primes at or below 33 for the finite
  calculation.
- Tied earlier primes have q′=q, for which the integral-ideal estimate still
  works.
- A zero difference in either comparison needs no norm division.
- An integral generator is not substituted for π′ in the inverse-ideal
  estimate.
- The multiplicativity argument uses three simultaneous coordinates, so it
  cannot be replaced by independent choices of two-coordinate representatives
  alone.

### 8.8 Exact finite residue certificates

Define `GoldenFinitePrimeCertificate` to contain the ordered earlier
prime generators, residue images, old-unit exponent relations with exact
witnesses, selected maximal minors and their gcd. Its API is `verify`,
`sound` and the constructor `goldenFinitePrimeCertificates` for the
eleven steps below. `verify` checks exact equalities and support,
residue generation and the actual determinants. The resulting
β̄-isomorphism follows by a lattice index argument, as follows.
If g₁,…,g_n generate U, let e:ℤ^n↠U be the exponent map. For
integral old units a,b,w with a−b=π_v w, the vector A−B of their
exponents belongs to e⁻¹(U₁), since a/b=1+π_v(w/b). Let L be
the lattice generated by these vectors. There are surjections
ℤ^n/L↠U/U₁↠k(v)×. Each selected nonzero maximal determinant
is the index of a sublattice contained in L; hence [ℤ^n:L] divides
the gcd of these determinants. If that gcd is q−1, residue
surjectivity forces both surjections to be isomorphisms. No one minor
is required to equal q−1. *Needs:* §8.3 and Mathlib's
`AddSubgroup.index_eq_natAbs_det` with its full-rank hypotheses.
(Bass–Tate, Appendix Proposition 1, pp. 430–431; Groenewegen,
Lemma 7 and triangle, pp. 6–7; the integer witnesses below are
explicit calculations, rather than a table in either source.)

The complete ordered primes of norm at most 33 are
(2), (−1+2ε), (3), (3+ε), (4−ε), (4+ε), (5−ε),
(5+ε), (6−ε), (5+2ε), (7−2ε).
Their norms are 4,5,9,11,11,19,19,29,29,31,31. The polynomial
X²−X−1 is irreducible modulo 2,3,7,13,17,23, ramified modulo 5,
and split modulo 11,19,29,31. The inert primes after 3 have squared
norm above 33, proving completeness. At every step the ordered
old generators are −1,ε followed by exactly the preceding prime
generators in this list. At norms 4 and 9 use coordinate residues
modulo 2 and 3. At every other prime π=[a,b], reduction sends
ε to −a/b modulo q; b is nonzero there.

For compact exact data, each row below gives exponent vectors A,B,C,
where g^A=a, g^B=b and g^C=w, and the required equality is
**g^A−g^B=π_v g^C** in ℚ(√5). Negative exponents are evaluated by
the conjugate divided by the nonzero norm. The relation column is
A−B. The generator order above determines every integer in the
witness without a search or a choice of algebraic-number representation.
Row numbers restart at one for each prime. A minor list specifies
columns in the listed order from the matrix whose columns are these
relation vectors. Thus determinant signs are part of the data.

`GoldenFinitePrimeCertificate.verify` checks each exact factorization,
residue relation and selected minor in the finite data below. Its soundness
target `GoldenFinitePrimeCertificate.sound` uses the proved old-unit
criterion and determinant-index theorem to deduce the graded residue
isomorphism; a successful arithmetic check alone is not the proof of those
two theorems.

**Checks.**

- At (2), ε has residue order three; determinants 6 and −3 have gcd
  three, giving the required index. Changing −3 to −6 fails exact
  determinant verification, even though both are multiples of three.
- At (3), the residue group has order eight, not the rational-prime
  group order two. Coordinate reduction retains the quadratic field.
- At the first norm-eleven prime there is no old norm-eleven generator;
  at the second there is exactly 3+ε. Introducing 4−ε before its
  step fails the support check.
- A wrong quotient exponent that breaks a−b=π_v w fails even if its
  relation vector still reduces to one. A relation lattice without a
  surjective residue map supplies no lower bound q−1.

For π=(2,0) in [a,b] coordinates and q=4, the residue images of the ordered old generators are (1,0), (0,1).

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (1,-6) | (0,-3) | (1,-4) |
| 2 | (1,6) | (1,3) | (1,4) |
| 3 | (1,6) | (0,3) | (1,5) |
| 4 | (0,0) | (1,-3) | (0,-1) |

Selected minors: (1,3) ↦ 6; (4,2) ↦ -3. Their gcd is 3=q−1.


For π=(-1,2) in [a,b] coordinates and q=5, the residue images of the ordered old generators are 4, 3, 2.

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (1,2,4) | (0,0,4) | (1,1,4) |
| 2 | (1,4,2) | (1,0,2) | (1,2,2) |
| 3 | (0,-2,2) | (1,-5,1) | (0,-2,1) |

Selected minors: (1,2,3) ↦ 4. Their gcd is 4=q−1.


For π=(3,0) in [a,b] coordinates and q=9, the residue images of the ordered old generators are (2,0), (0,1), (2,0), (2,2).

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (1,-1,0,3) | (1,-3,0,2) | (1,-2,0,2) |
| 2 | (1,3,2,1) | (1,1,1,2) | (1,1,1,1) |
| 3 | (1,3,2,1) | (0,-1,0,1) | (1,2,0,2) |
| 4 | (0,1,1,0) | (0,1,3,0) | (1,1,1,0) |

Selected minors: (2,1,3,4) ↦ 8. Their gcd is 8=q−1.


For π=(3,1) in [a,b] coordinates and q=11, the residue images of the ordered old generators are 10, 8, 2, 4, 3.

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (1,2,1,0,2) | (1,-2,1,0,1) | (1,1,1,0,1) |
| 2 | (1,2,1,0,2) | (1,0,3,0,0) | (1,3,1,0,0) |
| 3 | (0,-2,2,1,0) | (1,-2,1,0,1) | (0,-1,1,0,0) |
| 4 | (0,-2,2,1,0) | (1,4,1,0,0) | (0,-1,1,0,1) |
| 5 | (1,-1,0,3,0) | (1,0,3,0,0) | (0,-3,0,0,0) |
| 6 | (1,-1,0,3,0) | (1,1,0,0,0) | (1,-2,0,0,1) |
| 7 | (1,5,0,0,1) | (0,-1,1,1,1) | (1,0,0,0,2) |
| 8 | (0,0,0,1,2) | (1,1,0,1,1) | (0,0,0,1,1) |
| 9 | (1,-3,0,1,0) | (1,3,0,2,0) | (0,0,1,1,0) |
| 10 | (1,3,0,2,0) | (0,2,0,2,1) | (1,2,0,2,0) |
| 11 | (1,4,1,0,0) | (0,-4,0,0,0) | (1,0,0,0,1) |
| 12 | (1,1,0,0,0) | (1,-1,0,0,2) | (0,-2,0,1,0) |
| 13 | (0,-2,0,2,0) | (0,1,3,1,0) | (1,2,0,1,0) |
| 14 | (1,2,4,0,0) | (1,6,0,1,0) | (1,-2,0,0,0) |
| 15 | (0,-3,0,2,0) | (1,6,0,1,0) | (0,0,2,1,0) |

Selected minors: (5,7,2,10,6) ↦ 60; (12,8,11,9,13) ↦ -30; (3,1,4,15,14) ↦ -10. Their gcd is 10=q−1.


For π=(4,-1) in [a,b] coordinates and q=11, the residue images of the ordered old generators are 10, 4, 2, 7, 3, 7.

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (1,0,0,2,0,1) | (1,2,0,0,0,1) | (1,0,0,0,0,1) |
| 2 | (1,-2,0,0,1,1) | (1,1,1,0,1,0) | (0,-1,0,0,1,0) |
| 3 | (1,5,1,0,0,0) | (1,2,0,1,0,0) | (1,4,0,0,0,0) |
| 4 | (0,-1,1,0,0,1) | (1,-2,1,1,0,1) | (0,-1,1,0,0,1) |
| 5 | (1,2,0,1,0,0) | (0,2,0,2,1,0) | (1,3,1,1,0,0) |
| 6 | (0,-2,0,0,0,0) | (0,4,0,0,1,0) | (1,3,1,0,0,0) |
| 7 | (1,0,0,3,0,0) | (1,-3,0,0,0,1) | (1,3,0,0,0,0) |
| 8 | (0,4,1,1,0,0) | (0,0,1,0,1,1) | (0,-1,1,0,0,0) |
| 9 | (0,0,0,0,2,0) | (0,0,1,0,1,1) | (1,2,0,0,1,0) |
| 10 | (0,5,0,0,0,0) | (0,-2,0,0,0,2) | (0,-1,1,0,0,0) |
| 11 | (1,1,0,0,0,2) | (0,2,0,1,0,0) | (1,3,2,0,0,0) |
| 12 | (1,1,4,0,0,0) | (0,0,0,2,0,1) | (1,4,0,0,1,0) |

Selected minors: (4,7,1,12,5,9) ↦ 70; (11,3,10,2,6,8) ↦ -20. Their gcd is 10=q−1.


For π=(4,1) in [a,b] coordinates and q=19, the residue images of the ordered old generators are 18, 15, 2, 10, 3, 18, 8.

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (1,1,3,1,0,0,0) | (0,0,1,0,0,0,1) | (1,0,1,0,1,0,0) |
| 2 | (0,-1,2,0,1,0,0) | (0,-2,0,1,0,1,0) | (0,-1,0,0,0,0,0) |
| 3 | (1,0,0,0,1,0,0) | (1,-3,1,0,0,1,0) | (1,-4,0,0,0,0,0) |
| 4 | (1,1,2,0,0,0,0) | (0,0,0,0,1,1,0) | (1,1,0,1,0,0,0) |
| 5 | (0,-1,1,0,1,1,0) | (0,1,2,1,0,0,0) | (0,-3,1,0,0,0,0) |
| 6 | (1,3,0,0,0,0,2) | (0,-2,0,2,0,0,0) | (1,0,0,0,0,1,0) |
| 7 | (1,5,0,1,0,0,0) | (0,-2,0,0,1,0,0) | (1,0,0,0,0,1,0) |
| 8 | (0,-1,0,2,0,1,0) | (0,0,1,0,1,0,0) | (0,-1,0,0,0,0,1) |
| 9 | (1,0,1,1,0,1,0) | (0,-2,1,0,0,0,1) | (1,0,2,0,0,0,0) |
| 10 | (0,1,0,0,0,0,2) | (0,0,1,2,0,0,0) | (1,-4,0,0,0,0,0) |
| 11 | (0,-1,0,2,0,0,0) | (1,1,3,0,0,0,0) | (0,-1,0,0,0,1,0) |
| 12 | (1,3,2,0,0,0,0) | (1,1,0,0,0,0,2) | (1,-1,0,1,0,0,0) |
| 13 | (0,-3,0,2,0,0,0) | (1,0,1,0,0,1,0) | (0,-1,0,0,1,0,0) |
| 14 | (0,-1,0,0,0,1,1) | (1,-4,0,0,0,0,0) | (0,-1,1,0,0,0,0) |

Selected minors: (9,10,3,1,11,14,8) ↦ -54; (12,5,13,2,7,6,4) ↦ -36. Their gcd is 18=q−1.


For π=(5,-1) in [a,b] coordinates and q=19, the residue images of the ordered old generators are 18, 5, 2, 9, 3, 8, 18, 9.

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (0,-2,2,1,0,0,0,0) | (0,-1,1,1,0,1,0,0) | (1,-1,1,1,0,0,0,0) |
| 2 | (1,2,0,0,0,0,1,0) | (1,-1,0,0,1,0,0,1) | (0,-1,1,0,0,0,0,0) |
| 3 | (1,-2,0,0,0,1,0,1) | (1,-1,0,0,1,0,0,0) | (1,0,0,0,0,0,1,0) |
| 4 | (0,-1,0,0,1,0,1,0) | (1,-2,0,1,0,1,0,0) | (0,-1,2,0,0,0,0,0) |
| 5 | (1,1,0,0,1,0,0,1) | (1,0,1,0,0,0,0,0) | (1,1,0,0,0,1,0,0) |
| 6 | (0,-1,0,1,0,0,0,0) | (0,0,2,0,0,0,0,1) | (1,2,0,0,0,0,1,0) |
| 7 | (0,-1,3,0,0,0,0,0) | (1,-3,0,0,0,0,0,1) | (0,-1,0,0,1,0,0,0) |
| 8 | (0,1,0,2,0,0,1,0) | (1,2,0,0,0,0,0,0) | (0,1,2,0,0,0,0,0) |
| 9 | (1,2,0,0,0,1,0,0) | (1,-1,2,0,1,0,0,0) | (1,-1,0,1,0,0,0,0) |
| 10 | (0,0,1,1,0,0,1,0) | (1,5,1,0,0,0,0,0) | (0,1,1,0,1,0,0,0) |
| 11 | (0,-1,0,2,0,0,0,0) | (0,2,0,0,1,0,1,0) | (1,0,0,0,0,1,0,0) |
| 12 | (0,-2,0,1,0,1,0,0) | (1,-3,0,0,0,0,0,0) | (0,-1,1,0,0,0,0,0) |
| 13 | (0,0,0,1,1,0,0,0) | (1,-3,0,0,0,2,0,0) | (0,-1,0,0,0,0,0,1) |
| 14 | (0,2,0,0,1,0,0,0) | (1,-1,0,0,0,0,0,2) | (0,1,0,2,0,0,0,0) |
| 15 | (0,0,0,1,0,1,0,0) | (1,-3,1,0,1,0,0,0) | (0,-1,0,0,0,0,0,1) |
| 16 | (0,3,0,0,1,0,0,0) | (1,1,0,0,0,0,2,0) | (0,1,2,0,0,0,0,0) |

Selected minors: (15,11,10,7,16,5,13,4) ↦ 216; (3,6,2,14,12,9,1,8) ↦ -18. Their gcd is 18=q−1.


For π=(5,1) in [a,b] coordinates and q=29, the residue images of the ordered old generators are 28, 24, 2, 18, 3, 27, 9, 28, 10.

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (1,-5,0,1,0,0,0,0,0) | (1,4,0,0,0,0,0,0,1) | (0,-1,0,0,0,0,0,1,0) |
| 2 | (1,-5,0,1,0,0,0,0,0) | (1,0,1,1,0,1,0,0,0) | (0,-1,0,2,0,0,0,0,0) |
| 3 | (1,-2,1,0,0,0,0,1,0) | (0,1,0,0,1,0,0,0,0) | (1,-1,0,1,0,0,0,0,0) |
| 4 | (1,-2,1,0,0,0,0,1,0) | (1,-1,2,0,1,0,0,0,0) | (0,-3,1,0,0,0,0,0,0) |
| 5 | (1,4,0,0,0,0,0,0,1) | (1,1,0,0,1,0,0,1,0) | (0,-1,0,0,0,0,0,0,0) |
| 6 | (0,0,2,1,0,0,0,0,0) | (0,1,0,0,1,0,0,0,0) | (0,-1,0,0,0,0,0,0,0) |
| 7 | (1,2,0,1,0,0,0,0,0) | (0,1,0,0,1,0,0,0,0) | (1,1,0,0,0,0,0,0,0) |
| 8 | (0,1,0,0,1,0,0,0,0) | (0,5,1,0,0,0,0,0,0) | (1,2,0,0,0,0,0,0,0) |
| 9 | (1,-3,0,0,0,0,0,0,1) | (0,-2,0,0,0,1,0,1,0) | (1,1,0,0,0,0,0,0,0) |
| 10 | (1,3,0,0,0,0,1,0,0) | (0,2,4,0,0,0,0,0,0) | (1,2,0,0,1,0,0,0,0) |
| 11 | (1,0,4,0,0,0,0,0,0) | (1,2,0,1,1,0,0,0,0) | (0,-3,0,0,0,0,0,0,0) |
| 12 | (1,-2,0,0,1,1,0,0,0) | (1,1,0,0,0,0,1,1,0) | (0,-1,2,0,0,0,0,0,0) |
| 13 | (1,-1,0,2,0,1,0,0,0) | (0,-2,3,0,0,0,0,0,0) | (1,2,0,0,0,0,0,0,0) |
| 14 | (1,2,0,3,0,0,0,0,0) | (0,-2,0,0,0,0,0,0,1) | (1,0,0,0,0,1,0,0,0) |
| 15 | (1,-1,1,0,0,0,0,0,0) | (1,0,0,1,2,0,0,0,0) | (0,-1,0,0,0,1,0,0,0) |
| 16 | (0,0,2,0,1,0,0,0,0) | (0,1,1,1,0,1,0,0,0) | (1,1,1,0,0,0,0,0,0) |
| 17 | (0,1,1,1,0,1,0,0,0) | (0,2,0,0,1,0,0,1,0) | (1,1,0,0,0,0,0,0,0) |
| 18 | (0,-1,0,2,0,1,0,0,0) | (1,-3,0,1,0,0,0,0,0) | (0,0,0,1,0,0,0,0,0) |
| 19 | (1,2,0,0,0,0,0,0,1) | (0,1,1,1,1,0,0,0,0) | (1,0,0,0,0,1,0,0,0) |
| 20 | (1,2,0,0,0,1,1,0,0) | (1,0,2,1,0,0,0,0,0) | (1,0,0,0,1,0,0,0,0) |
| 21 | (1,4,0,0,1,0,0,0,0) | (1,-1,2,0,0,1,0,0,0) | (1,-1,0,1,0,0,0,0,0) |
| 22 | (0,5,0,1,0,0,0,0,0) | (1,-1,2,0,0,1,0,0,0) | (0,1,0,0,0,0,0,0,1) |
| 23 | (1,5,0,0,0,0,1,0,0) | (0,-6,0,0,0,0,0,0,0) | (1,0,2,0,0,0,0,0,0) |
| 24 | (0,-1,0,1,0,0,0,0,0) | (1,-1,0,0,0,1,1,0,0) | (0,-1,1,0,0,0,0,0,0) |
| 25 | (0,-5,0,0,0,0,0,0,0) | (0,0,2,0,0,0,0,1,0) | (1,0,0,0,0,0,0,0,1) |
| 26 | (0,3,0,0,0,0,2,0,0) | (0,0,2,0,0,0,0,1,0) | (0,-3,0,0,0,0,0,0,0) |
| 27 | (1,-2,1,0,1,0,0,0,0) | (0,1,0,0,0,0,1,1,0) | (1,1,0,1,0,0,0,0,0) |

Selected minors: (23,22,8,16,25,26,14,4,2) ↦ -168; (12,11,5,7,18,17,21,15,20) ↦ -224; (24,9,6,19,10,1,13,3,27) ↦ 420. Their gcd is 28=q−1.


For π=(6,-1) in [a,b] coordinates and q=29, the residue images of the ordered old generators are 28, 6, 2, 11, 3, 9, 27, 10, 28, 11.

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (1,0,0,0,0,0,0,1,0,0) | (0,2,0,0,0,0,0,0,0,1) | (1,2,1,0,0,0,0,0,0,0) |
| 2 | (1,-1,1,0,0,0,0,0,0,0) | (0,2,0,0,0,1,1,0,0,0) | (1,4,0,0,0,0,0,0,0,0) |
| 3 | (1,1,1,1,0,0,0,1,0,0) | (0,-2,0,1,0,0,0,0,0,0) | (1,3,0,1,0,0,0,0,0,0) |
| 4 | (1,0,0,2,1,0,0,0,0,0) | (1,-2,1,0,0,1,0,0,0,0) | (1,2,0,0,0,0,0,0,0,0) |
| 5 | (0,-1,2,0,0,0,0,1,0,0) | (0,-1,0,0,0,0,0,0,0,1) | (0,0,0,1,0,0,0,0,0,0) |
| 6 | (0,-2,3,0,0,0,0,0,0,0) | (1,-1,1,0,2,0,0,0,0,0) | (0,1,1,0,0,0,0,0,0,0) |
| 7 | (1,-2,0,0,0,0,0,0,0,1) | (0,-1,0,0,1,0,0,0,0,0) | (1,0,0,0,0,0,0,0,0,0) |
| 8 | (0,5,0,1,0,0,0,0,0,0) | (0,1,1,1,0,0,0,1,0,0) | (1,1,0,1,0,0,0,0,0,0) |
| 9 | (0,-2,1,0,0,1,0,0,0,0) | (0,1,1,1,0,0,0,1,0,0) | (1,3,1,0,0,0,0,0,0,0) |
| 10 | (1,-2,0,0,2,0,0,0,0,0) | (0,-1,0,0,0,0,0,2,0,0) | (1,2,1,0,0,0,0,0,0,0) |
| 11 | (1,-2,1,0,0,0,1,0,0,0) | (1,0,0,2,0,1,0,0,0,0) | (0,1,0,0,1,0,0,0,0,0) |
| 12 | (1,0,0,0,1,0,0,0,0,1) | (1,-3,0,0,0,2,0,0,0,0) | (1,0,0,0,0,0,0,0,1,0) |
| 13 | (1,-2,0,0,0,0,0,0,1,0) | (1,3,0,1,0,0,1,0,0,0) | (0,1,0,0,1,0,0,0,0,0) |
| 14 | (0,5,0,0,0,0,0,0,1,0) | (0,-1,0,1,0,0,0,0,0,1) | (0,1,2,0,0,0,0,0,0,0) |
| 15 | (0,4,0,0,0,0,0,0,0,0) | (1,-1,1,0,1,1,0,0,0,0) | (0,1,0,0,0,0,0,0,1,0) |
| 16 | (0,-1,1,0,0,1,0,0,0,0) | (1,0,0,3,0,0,0,0,0,0) | (0,1,0,0,0,0,1,0,0,0) |
| 17 | (1,0,2,0,0,1,0,0,0,0) | (0,-2,0,0,2,0,0,0,0,0) | (1,0,0,2,0,0,0,0,0,0) |
| 18 | (0,1,0,0,1,0,1,0,0,0) | (1,-3,2,0,0,0,0,0,0,0) | (0,-1,0,0,0,1,0,0,0,0) |
| 19 | (0,1,0,0,1,1,0,0,0,0) | (1,1,0,0,0,0,1,0,1,0) | (0,1,0,2,0,0,0,0,0,0) |
| 20 | (1,2,2,0,0,0,1,0,0,0) | (1,-1,0,0,0,1,0,0,0,1) | (1,-1,0,1,0,0,0,0,0,0) |

Selected minors: (19,6,9,10,4,12,20,1,13,17) ↦ 56; (16,5,3,15,7,14,18,2,11,8) ↦ 28. Their gcd is 28=q−1.


For π=(5,2) in [a,b] coordinates and q=31, the residue images of the ordered old generators are 30, 13, 2, 25, 3, 16, 22, 17, 23, 18, 24.

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (0,-1,1,2,0,0,0,0,0,0,0) | (0,1,3,1,0,0,0,0,0,0,0) | (1,-1,1,1,0,0,0,0,0,0,0) |
| 2 | (0,-3,0,0,0,1,0,0,0,0,0) | (1,0,2,0,0,0,0,0,0,0,0) | (0,-1,0,0,0,0,0,0,0,0,0) |
| 3 | (1,0,2,0,0,0,0,0,0,0,0) | (1,1,0,0,1,1,0,0,0,0,0) | (0,0,0,1,0,0,0,0,0,0,0) |
| 4 | (1,1,0,0,1,1,0,0,0,0,0) | (0,1,3,1,0,0,0,0,0,0,0) | (1,2,0,0,0,0,1,0,0,0,0) |
| 5 | (1,1,0,0,0,0,0,1,0,0,0) | (1,1,1,0,0,0,0,0,0,0,1) | (0,-1,0,0,0,0,0,0,0,0,0) |
| 6 | (1,-2,0,0,0,0,0,0,0,1,0) | (0,1,0,0,1,0,0,1,0,0,0) | (1,1,0,1,0,0,0,0,0,0,0) |
| 7 | (1,3,0,0,1,0,0,0,0,0,0) | (1,1,0,0,0,1,1,0,0,0,0) | (0,-1,0,0,0,0,0,0,0,0,0) |
| 8 | (1,-4,0,0,0,0,0,1,0,0,0) | (0,1,0,0,0,0,0,0,1,0,0) | (1,-2,1,0,0,0,0,0,0,0,0) |
| 9 | (0,1,0,0,0,0,0,0,1,0,0) | (0,2,0,1,0,1,0,0,0,0,0) | (1,2,0,0,0,0,0,0,0,0,0) |
| 10 | (1,0,1,0,1,1,0,0,0,0,0) | (1,1,0,2,0,0,0,0,0,0,0) | (1,0,0,0,0,0,1,0,0,0,0) |
| 11 | (0,1,2,0,0,0,1,0,0,0,0) | (1,1,1,0,0,0,0,0,0,1,0) | (0,0,1,1,0,0,0,0,0,0,0) |
| 12 | (1,5,0,0,0,0,1,0,0,0,0) | (1,1,1,0,0,0,0,1,0,0,0) | (1,0,0,0,0,0,0,0,0,0,0) |
| 13 | (1,0,1,0,2,0,0,0,0,0,0) | (0,1,0,0,0,0,1,0,0,0,1) | (1,3,0,0,0,0,0,0,0,0,0) |
| 14 | (1,0,0,0,0,0,0,2,0,0,0) | (0,3,0,0,0,0,0,0,0,1,0) | (1,1,1,1,0,0,0,0,0,0,0) |
| 15 | (1,-1,1,0,1,0,0,0,0,0,0) | (1,-1,2,0,0,0,0,1,0,0,0) | (0,-1,1,0,0,0,0,0,0,0,0) |
| 16 | (1,-1,1,1,1,0,0,0,0,0,0) | (0,2,0,0,0,0,1,0,0,0,0) | (1,-2,0,0,0,1,0,0,0,0,0) |
| 17 | (0,1,0,0,0,0,1,0,1,0,0) | (1,2,2,0,0,0,0,0,0,0,0) | (0,-1,0,0,0,1,0,0,0,0,0) |
| 18 | (1,1,0,0,0,0,0,0,0,1,0) | (0,2,0,0,0,0,1,0,0,0,1) | (1,0,0,0,0,1,0,0,0,0,0) |
| 19 | (0,-4,0,0,0,1,0,0,0,0,0) | (0,2,0,0,0,0,1,0,0,0,1) | (1,1,1,0,0,0,0,0,0,0,0) |
| 20 | (0,-3,0,0,0,0,1,0,0,0,0) | (1,2,0,0,1,1,0,0,0,0,0) | (0,0,1,1,0,0,0,0,0,0,0) |
| 21 | (0,2,0,1,0,0,0,0,0,0,0) | (1,-1,0,0,1,0,0,0,1,0,0) | (0,-1,0,0,0,0,1,0,0,0,0) |
| 22 | (0,1,2,0,0,0,0,0,1,0,0) | (1,1,0,0,0,0,0,0,0,0,0) | (0,-1,0,0,0,1,0,0,0,0,0) |

Selected minors: (15,9,14,17,19,22,4,13,5,1,10) ↦ 90; (20,2,21,8,7,16,6,12,11,3,18) ↦ 60. Their gcd is 30=q−1.


For π=(7,-2) in [a,b] coordinates and q=31, the residue images of the ordered old generators are 30, 19, 2, 6, 3, 22, 16, 23, 17, 24, 18, 12.

| Row | A | B | C |
| --- | --- | --- | --- |
| 1 | (1,2,1,0,2,0,0,0,0,0,0,0) | (0,0,0,0,0,0,0,0,0,0,0,1) | (1,2,0,0,0,0,0,1,0,0,0,0) |
| 2 | (1,2,0,1,1,0,0,0,0,0,0,0) | (0,6,0,1,0,0,0,0,0,0,0,0) | (1,4,0,1,0,0,0,0,0,0,0,0) |
| 3 | (0,-2,2,1,0,0,0,0,0,0,0,0) | (1,5,0,0,0,0,0,0,0,0,0,0) | (0,1,0,0,0,0,1,0,0,0,0,0) |
| 4 | (1,2,3,0,0,0,0,0,0,0,0,0) | (1,-1,0,0,0,1,0,0,1,0,0,0) | (1,0,0,0,1,0,0,0,0,0,0,0) |
| 5 | (0,1,1,0,0,0,0,0,1,0,0,0) | (1,0,1,1,1,0,0,0,0,0,0,0) | (0,1,2,0,0,0,0,0,0,0,0,0) |
| 6 | (0,1,0,0,1,0,0,0,0,0,0,0) | (0,1,0,1,0,0,1,0,0,0,0,0) | (1,0,0,0,0,0,0,0,0,0,0,0) |
| 7 | (0,2,0,0,0,0,0,1,0,0,0,0) | (0,-2,0,0,0,0,0,0,0,1,0,0) | (0,1,1,0,0,0,0,0,0,0,0,0) |
| 8 | (1,-1,0,0,0,1,0,0,1,0,0,0) | (0,-5,0,1,0,0,0,0,0,0,0,0) | (1,2,0,0,0,0,0,0,0,0,0,0) |
| 9 | (1,1,0,1,2,0,0,0,0,0,0,0) | (1,2,0,0,0,1,1,0,0,0,0,0) | (1,0,0,0,0,0,0,0,0,0,0,0) |
| 10 | (0,-1,1,0,0,0,0,0,0,0,1,0) | (1,-4,0,0,0,1,0,0,0,0,0,0) | (0,1,0,0,0,0,0,0,0,0,0,0) |
| 11 | (0,1,3,0,0,0,0,0,0,0,0,0) | (1,-3,0,0,0,0,0,0,0,1,0,0) | (0,1,0,0,0,0,1,0,0,0,0,0) |
| 12 | (0,1,0,1,0,1,0,0,0,0,0,0) | (1,-3,0,0,0,0,0,0,0,1,0,0) | (0,1,0,0,1,0,0,0,0,0,0,0) |
| 13 | (0,2,0,0,1,0,0,0,1,0,0,0) | (1,-3,0,0,0,0,0,0,0,1,0,0) | (0,1,0,0,0,1,0,0,0,0,0,0) |
| 14 | (1,3,2,0,0,0,0,0,0,0,0,0) | (1,-2,0,1,0,0,0,0,0,1,0,0) | (1,0,0,0,1,0,0,0,0,0,0,0) |
| 15 | (0,-1,0,0,0,0,0,0,0,0,0,1) | (0,2,1,0,0,0,0,0,0,1,0,0) | (1,2,0,0,1,0,0,0,0,0,0,0) |
| 16 | (0,4,0,1,0,0,0,0,0,0,0,0) | (1,0,1,1,0,0,0,0,1,0,0,0) | (0,1,0,2,0,0,0,0,0,0,0,0) |
| 17 | (1,2,0,0,0,0,1,0,0,1,0,0) | (1,0,0,0,0,0,0,1,0,0,0,0) | (1,3,0,1,0,0,0,0,0,0,0,0) |
| 18 | (1,4,0,2,0,0,0,0,0,0,0,0) | (0,-1,1,0,1,0,0,0,0,0,0,0) | (1,3,0,0,0,0,1,0,0,0,0,0) |
| 19 | (1,-1,1,1,1,0,0,0,0,0,0,0) | (0,-4,0,0,0,1,0,0,0,0,0,0) | (1,0,0,0,0,0,1,0,0,0,0,0) |
| 20 | (0,-3,0,0,0,0,0,0,0,1,0,0) | (0,0,1,0,0,0,0,0,1,0,0,0) | (1,-1,0,1,0,0,0,0,0,0,0,0) |
| 21 | (0,-1,2,0,0,1,0,0,0,0,0,0) | (1,-1,0,0,1,0,0,0,0,0,0,1) | (0,1,0,0,0,0,0,0,0,0,1,0) |
| 22 | (1,3,0,0,0,1,0,0,0,0,0,0) | (1,-1,0,0,0,0,1,1,0,0,0,0) | (1,0,0,0,1,0,0,0,0,0,0,0) |
| 23 | (1,-2,0,0,2,0,0,0,0,0,0,0) | (1,3,3,0,0,0,0,0,0,0,0,0) | (0,1,0,2,0,0,0,0,0,0,0,0) |
| 24 | (1,-2,0,0,2,0,0,0,0,0,0,0) | (1,1,0,2,0,0,0,0,0,0,0,0) | (0,-1,1,0,0,0,0,0,0,0,0,0) |
| 25 | (1,1,1,0,0,0,0,0,0,0,1,0) | (1,-3,0,0,0,0,1,0,0,0,0,0) | (1,1,0,1,0,0,0,0,0,0,0,0) |
| 26 | (0,2,0,0,1,0,0,0,0,0,0,0) | (1,-3,0,0,0,0,1,0,0,0,0,0) | (0,0,0,1,0,0,0,0,0,0,0,0) |
| 27 | (0,-3,0,0,0,0,0,0,0,0,0,1) | (1,1,2,0,0,0,0,0,0,0,0,0) | (0,0,0,1,0,0,0,0,0,0,0,0) |
| 28 | (1,-1,0,0,0,1,1,0,0,0,0,0) | (0,2,1,0,2,0,0,0,0,0,0,0) | (1,3,0,0,0,0,0,0,1,0,0,0) |
| 29 | (0,-3,0,0,0,0,0,0,1,0,0,0) | (1,2,0,0,0,0,1,0,0,0,1,0) | (0,1,0,0,0,1,0,0,0,0,0,0) |
| 30 | (1,-4,0,0,1,0,0,0,0,0,0,0) | (0,0,0,0,0,1,0,0,0,1,0,0) | (1,0,0,0,0,0,0,0,0,0,0,1) |
| 31 | (0,-1,0,0,0,0,1,1,0,0,0,0) | (1,-4,0,0,0,0,0,0,0,0,0,0) | (0,0,0,1,0,0,0,0,0,0,0,0) |
| 32 | (0,3,0,0,0,1,0,0,0,0,0,0) | (1,-2,0,1,0,0,0,1,0,0,0,0) | (0,1,2,0,0,0,0,0,0,0,0,0) |
| 33 | (0,1,1,0,0,0,0,0,0,0,0,1) | (1,0,0,1,0,0,0,0,1,0,0,0) | (0,1,0,0,0,0,0,1,0,0,0,0) |
| 34 | (0,-1,4,0,0,0,0,0,0,0,0,0) | (0,2,0,0,0,1,0,0,1,0,0,0) | (1,0,0,0,0,0,0,0,0,0,0,1) |
| 35 | (0,1,0,0,0,0,1,0,0,0,1,0) | (0,0,0,0,0,1,0,0,0,0,0,1) | (1,0,0,0,0,0,0,1,0,0,0,0) |
| 36 | (0,1,0,0,0,0,1,0,0,1,0,0) | (1,-3,0,2,0,0,0,0,0,0,0,0) | (0,1,0,0,0,0,0,0,0,0,1,0) |

Selected minors: (20,30,9,29,28,11,33,24,12,15,32,25) ↦ -180; (31,1,23,4,34,36,13,22,10,3,6,2) ↦ -240; (5,35,19,21,16,7,18,8,27,26,17,14) ↦ -90. Their gcd is 30=q−1.

### 8.9 Upper generation and the independent real-sign bound

Combine §8.7 for q>33 with the eleven β̄-isomorphisms of §8.8.
Every graded residue is now an isomorphism. By finite descent the tame
kernel of ℚ(√5) is generated by ordinary-unit symbols. Bilinearity,
antisymmetry and {a,−a}=0 reduce them to

```text
g = {−1,−1},       h = {−1,ε},       2g = 2h = 0.
```

This proves a surjection (ℤ/2)²↠K₂(O), and hence the upper bound
four. It uses no special-value order formula. The two real Hilbert
symbols send g to (−1,−1) and h to (1,−1), ordering the embeddings
so that ε is positive at the first and negative at the second. These
vectors generate {±1}², giving the independent lower bound four.
Prove `goldenTameKernelEquiv` with precisely these normalizations.
The real sign is −1 exactly when both inputs are negative.
*Needs:* §§8.3–8.8, T.3/T.5 and §6.14's presentation argument.
(Bass–Tate, II §3, pp. 403–411, and Appendix Proposition 1,
pp. 430–431, for the filtration criterion; Groenewegen, §§3–7,
pp. 7–11, for the geometric method; the complete finite data
and sign calculation are given in §§8.8–8.9.)

**Checks.**

- The g and h sign vectors are independent; retaining only their product
  gives a lower bound two.
- Reversing the embedding order interchanges coordinates and preserves the
  abstract group.
- Changing ε to its conjugate changes h's sign vector, so the normalized map
  must record the choice.
- The surjection from the presentation proves only the upper bound; the two
  signs give the other inequality.

The certified order is 4, and Layer 4 gives w₂(F)=120. The comparison
with a zeta value is a downstream application. Neither §8.7's norm
inequalities nor §8.8's index arguments nor either sign bound uses
a special-value identity.

### 8.10 Degree-three arithmetic examples

Specialize the odd-degree table: K₃(ℤ[i])≃K₃(ℚ(i))≃ℤ⊕ℤ/24,
and K₃(ℤ)≃K₃(ℚ)≃ℤ/48. The field/ring maps are isomorphisms
by §5.1. For the Gaussian field r₂=1 and w₂=24; for ℚ the extra
factor two is the real extension. These computations use Layer 5,
not a later Bloch-group or dilogarithm theorem.
(K-book, VI.2.4, p. 472; VI.8.1–8.3, pp. 513–514;
VI.9.5, p. 519; Exercise VI.8.5, p. 516.)

**Checks.**

- The Gaussian free summand has rank one, whereas ℚ has rank zero in degree
  three.
- Both have w₂=24, but the real group has torsion order 48.
- Neither statement asserts finite generation of all positive field K-groups:
  even groups retain infinite residue terms.

### Examples

The rational field contrasts an infinite torsion K₂ with the finite
ring group ℤ/2; inverting one prime gives the displayed finite even
extension. The Gaussian calculation treats norm two explicitly and
later primes by Euclidean approximation. The golden-field computation
combines a geometric bound, eleven finite certificates and two real
signs. These examples fix support, symbol direction and independent bounds.

### Dependencies

Layers 1–7; K2SymbolsBrauer's symbols; NumberFieldArithmetic's Gaussian
and golden arithmetic; IntegralLattices' Minkowski theorem and Mathlib's
full-rank index–determinant theorem; general localization and finite-field
K-theory. Both bounds of the golden certificate are independent of
any special-value formula.

## Downstream consumers

SpecialValuesBirchTate is a downstream consumer. Its B.3 uses the rational,
Gaussian and golden-field computations as independent tests. For the golden
field, the certified order 4 and w₂(F)=120 give 4/120=1/30, which B.3
compares with ζ_F(−1)=1/30. Neither certificate bound depends on that
comparison. Its B.8 consumes the arithmetic groups and order comparisons
of Layers 3–6 in its higher special-value formulas; §7.5's conditional
integer table uses the K-book order formulas cited there.
K3BlochGroups is a downstream consumer of the degree-three rank and
arithmetic torsion of Layers 3–5. Its decomposable and indecomposable
analysis and Bloch comparison are not needed to prove them.
Chern classes, regulators, polylogarithms and higher
special values consume these arithmetic groups and ranks. The basic
odd torsion calculation uses only the early étale edge from M.7 and
its real correction. Hermitian computations consume §3.5's periodic
L-group and classical Grothendieck–Witt finiteness results. Even
computations can use §6.14's cohomological certificate independently
of a zeta-value order formula.

## References

Locators above refer to the following versions and their printed pages.
All formulas and finite data use the conventions fixed here.

- Charles A. Weibel, [*The K-book: An Introduction to Algebraic
  K-theory*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
  combined author PDF, 29 August 2013. Its chapter numbering and pages
  differ from the separately updated chapter files. Chapters III, V and
  VI supply the principal arithmetic statements.
- Hyman Bass and John Tate, [*The Milnor ring of a global
  field*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf),
  in *Algebraic K-theory II*, Lecture Notes in Mathematics 342 (1973),
  pp. 349–446, including Tate's appendix, pp. 429–446. The link is
  the complete volume; filtration is II §3 and the unit criterion is
  Appendix Proposition 1.
- Richard P. Groenewegen, [*Bounds for computing the tame
  kernel*](https://doi.org/10.1090/S0025-5718-03-01592-8),
  *Mathematics of Computation* 73 (2004), pp. 1443–1458;
  [author preprint](https://math.leidenuniv.nl/reports/files/2002-13.ps).
  Groenewegen locators here use the preprint's printed pages 1–16,
  particularly Lemmas 6, 9, 12 and Proposition 10, rather than journal
  pagination. The golden-field cutoff and integer witnesses here are an
  explicit specialization and calculation.
- Daniel Quillen, text prepared by Hyman Bass,
  [*Finite generation of the groups K_i of rings of algebraic
  integers*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf),
  in *Algebraic K-Theory I*, Lecture Notes in Mathematics 341 (1973),
  pp. 179–198, especially §1, pp. 179–185.
- Fei Sun, [*Algebraic K-Theory and Modular Symbols*](https://arxiv.org/abs/1604.04700),
  version 1 (2016), pp. 5–6, for the layer poset and the comma-category
  description; the rank-one convention here is fixed explicitly.
- Jean-Pierre Serre, [*Homologie singulière des espaces
  fibrés*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Serre-HSEF.pdf),
  *Annals of Mathematics* 54 (1951), pp. 425–505, III §1,
  IV §§3 and 6, and V §§1–2, for the connected H-space finite-type argument.
- Andrew Putman and Daniel Studenmund,
  [*The dualizing module and top-dimensional cohomology group of GL_n(O)*](https://arxiv.org/abs/1909.01217),
  version 4 (2021), §1 and Proposition 2.1, pp. 8–10, for the orientation
  character required of the Steinberg-homology supplier.
- Bruno Kahn, [*Around Quillen’s theorem A*](https://arxiv.org/abs/1108.2441),
  version 3, §§2–4, for rank filtration and finite generation with
  projective modules and the proper building.
- Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit,
  Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle,
  [*Hermitian K-theory for stable ∞-categories III:
  Grothendieck–Witt groups of rings*](https://arxiv.org/abs/2009.07225),
  version 4, Corollaries 2.3.16, 2.3.18 and 2.3.19, pp. 47–48.
  The genuine, periodic and classical groups are distinguished in §3.5.
- John Rognes and Charles Weibel, [*Two-primary algebraic K-theory of
  rings of integers in number fields*](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf),
  *Journal of the American Mathematical Society* 13 (2000), pp. 1–54;
  used together with the K-book's signature and cohomology conventions.
- Charles A. Weibel, [*Algebraic K-theory of rings of integers in local
  and global fields*](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf),
  in *Handbook of K-theory* (2005), pp. 139–190, particularly
  Theorem 73 and the odd-torsion discussion, pp. 167–169.
- Charles A. Weibel, [*Higher wild kernels and divisibility in the K-theory
  of number fields*](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf),
  author preprint dated 23 July 2004, §§1–8. Its unrestricted
  ideal-class/norm prescription in Lemma 4.4 is replaced by the
  compatible fiber product and Hutchinson's independent Picard-image
  argument in §6.11.
- Kevin Hutchinson, [*Étale wild kernels of exceptional number
  fields*](https://web.archive.org/web/20151219232629id_/http://www.math.uiuc.edu/K-theory/0700/etalekernels.pdf),
  author preprint dated 16 July 2004, Definition 2.3 and Remark 2.4,
  p. 4; Theorem 2.8 and Corollary 2.9, pp. 6–8;
  Theorem 4.3 and Corollaries 4.7–4.8, pp. 13–15;
  Lemma 5.1 and Corollary 5.7 with proofs, pp. 16–19.
  Published in *Journal of Number Theory* 120 (2006), pp. 47–71;
  the locators here refer to the dated preprint, not the uncollated
  journal pagination.
- Luca Caputo, [*Splitting in the K-theory localization sequence of
  number fields*](https://arxiv.org/abs/1002.2936), version 2,
  arXiv header 25 February 2010, internal date 11 September 2018.
  Lemmas 4, 6 and 7 and Proposition 3 with Remark 5, pp. 7–8,
  give the independent Kummer–corestriction injection; Theorem 1,
  pp. 12–14, computes the fixed-modulus obstruction; Proposition 4
  and Example 2, pp. 16–17, provide its arithmetic negative control.
- Grzegorz Banaszak, [*Wild kernels and divisibility in K-groups of
  global fields*](https://arxiv.org/abs/1208.2137), version 1,
  10 August 2012, §4, equations (56), (59)–(60), p. 17,
  and §6, Remark 6.1 and Theorem 6.4, p. 31. The stabilization
  index is separate from a tame-kernel exponent.
- Tony Feng, Søren Galatius and Akshay Venkatesh,
  [*The Galois action on symplectic K-theory*](https://doi.org/10.1007/s00222-022-01127-8),
  *Inventiones Mathematicae* 230 (2022), pp. 225–319;
  [author PDF](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf),
  §§2.6–2.7, printed pp. 12–15. Locators here use that author PDF.
  The eigenspaces use dualization in all Bott degrees; ordinary comparison
  ranges are specified in §§6.15–6.16.
- Frank Calegari, Stavros Garoufalidis and Don Zagier,
  [*Bloch groups, algebraic K-theory, units, and Nahm's
  conjecture*](https://arxiv.org/abs/1712.04887), version 3,
  Lemma 3.5 and its proof, p. 20. Section 6.13 constructs the map
  independently through Caputo and translates its χ⁻¹ quotient;
  this source's unramified-p hypotheses give a specialization.
- Bruno Harris and Graeme Segal, *K_i groups of rings of algebraic
  integers*, *Annals of Mathematics* 101 (1975), pp. 20–33, §3;
  [publication record](https://doi.org/10.2307/1970984).
  The detected-summand proof is distinguished from an abstract
  decomposition in §5.5.
- Stephen A. Mitchell, [*On the Lichtenbaum–Quillen conjectures from
  a stable homotopy-theoretic
  viewpoint*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Mitchell-LQ.pdf),
  in *Algebraic Topology and Its Applications*, MSRI Publications 27
  (1994), pp. 163–240, §3, Theorem 3.4 and its proof sketch,
  pp. 184–186. Section 5.5 makes the monomial subgroup and the
  stable-transfer/coefficient steps of the detected map explicit.
- Romyar Sharifi, [*Iwasawa
  Theory*](https://www.math.ucla.edu/~sharifi/iwasawa.pdf),
  author notes, Theorem 4.4.2 and Corollaries 4.4.4–4.4.5,
  pp. 111–113; Theorem 4.5.7, p. 117; Definition 5.2.4,
  Proposition 5.2.5 and Remarks 5.2.8–5.2.9, pp. 134–136.
  These give the character-reflection and integral-measure proofs
  used by the precise IntegralIwasawaTheory requests in §7.2.
- Kenneth A. Ribet, [*A modular construction of unramified
  p-extensions of ℚ(μ_p)*](https://math.berkeley.edu/~ribet/Articles/invent_34.pdf),
  *Inventiones Mathematicae* 34 (1976), pp. 151–162.
  Theorems 1.1–1.3, Proposition 2.1, Theorem 3.7 and
  Propositions 4.1–4.3 with Theorem 4.4 fix the finite
  Herbrand–Ribet implication and its direct Artin character.
- Akio Yokoyama, [*On class numbers of finite algebraic number
  fields*](https://www.jstage.jst.go.jp/article/tmj1949/17/4/17_4_349/_pdf/-char/ja),
  *Tohoku Mathematical Journal* 17 (1965), pp. 349–357,
  Theorem 4 and proof, pp. 354–355, for the one-prime
  p-class argument attributed there to Iwasawa.
