# Roadmap: semisimple algebras, Part II

**Summary.** This roadmap connects the Brauer group of a field to the geometry of modules over
Azumaya algebras. It develops two reusable interfaces. The arithmetic interface
identifies the index of a Brauer class with both the least degree and the greatest
common divisor of the degrees of its finite splitting fields, and relates that
index to the period through restriction and corestriction. The geometric interface
compares actual modules under Morita equivalence, preserves their annihilator
ideals, and descends characteristic coefficients independently of a splitting
generator. Its last application is a relative Brauer comparison for differential
operators in characteristic $p$.

The main results are:

- a positive, representative-independent index on `BrauerGroup K`, with
  divisibility under arbitrary field extension and the reverse degree bound under
  finite extension;
- the restriction–corestriction formula, finite order of every field Brauer class,
  period dividing index, and equality of their sets of prime divisors;
- an $\mathcal O_X$-linear Morita equivalence for a specified splitting generator,
  including coherent and finitely presented modules and scheme-theoretic support;
- characteristic polynomials and full symmetric Higgs characteristic coefficients
  descended from inverse Morita modules, including over nonreduced bases;
- the two-step Cartier boundary, its relative functoriality, and the comparison of
  the pulled-back differential-operator algebras along infinitesimal cotangent
  scaling.

The field theory works in every characteristic. The sheaf Morita and polynomial
theory works over arbitrary schemes. Perfectness, positive characteristic,
smoothness, projectivity and a specified $W_2$-lift enter only in the last
relative application. Rank-zero inverse modules are allowed; a splitting
generator has positive rank locally.

`Suggested.lean` suggests declaration names and signatures. This document fixes
the mathematics and its hypotheses.

## Scope and ownership

The parent [SemisimpleAlgebras roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md)
owns Artin–Wedderburn, finite-dimensional central simple algebras, the Brauer
group operations, division representatives, splitting fields, and the algebra
index. These are inputs here. In particular, `classIndex` descends the existing
algebra index to the existing quotient. It does not introduce another central
simple algebra carrier, another Brauer relation, or another division-algebra
classification.

The [QuadraticFormInvariants roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/QuadraticFormInvariants/README.md),
Layer 7B, owns the normalized comparison of the algebraic Brauer group with
degree-two Galois cohomology. This roadmap adds its base-change square for all
units-coefficient classes and uses that square to transport transfer. A square
restricted to $2$-torsion does not supply that all-class target.
[ProfiniteCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ProfiniteCohomology/README.md),
Layers 9–10, owns the Galois subgroup dictionary, discrete coefficient modules,
continuous cohomology, restriction, corestriction and their index formula.
Use the action on separable-closure units. A trivial-action coefficient module or
a mod-$2$ adapter cannot replace it.

The geometric targets own the restriction-compatible Morita equivalence for
specified sheaf splitting generators, equality of annihilator ideal sheaves,
and the characteristic invariants of actual inverse modules. The local
matrix equivalence is Mathlib's `ModuleCat.matrixEquivalence`; the sheaf
tensor/Hom comparison is constructed here from its positive-rank charts.
The sheaf Azumaya/Brauer carrier belongs to SchemeAndStackFoundations, SF.2;
the general sheaf tensor, internal Hom, rank and determinant theory belongs to
AlgebraicVectorBundles, L0A–L0C. The Higgs carrier and its equivalence with
commuting symmetric-algebra actions belong to HodgeStructuresPartII, H.0.
The coefficient determinant used here is constructed in §3.7 from that
carrier and the supplied determinant operation.

The affine product-annihilator calculation is supplied by Mathlib's
`Module.annihilator_pi` and `LinearEquiv.annihilator_eq`. Its exact contract
and boundary cases appear among the suppliers. The new support theorem concerns
equality of ideal sheaves for inverse sheaf Morita modules over arbitrary
schemes.

The current Tau Ceti module
`TauCeti/NumberTheory/ClassFieldTheory/Brauer/Restriction.lean` supplies
`TauCeti.ClassFieldTheory.brRes`, `brCor`, `brRes_eq_explicitMap2`, and
`brCor_brRes`. Its `Br K` is a degree-two cohomological carrier. The field
transfer here acts on the central-simple-algebra quotient and fixes its
normalized comparison with those cohomological maps.

The last layer is conditional on five precise relative Cartier and
lift-dependent differential-operator contracts, stated below. It owns their
boundary and relative Brauer/Morita applications; the full Cartier-transform
equivalence is outside its scope. A generic crystalline comparison does not
supply those five contracts.

The following topics lie outside the scope: primary decomposition of the Brauer
group; equality of period and index over particular function fields; surface
period-index bounds; the real-surface theorems of Benoist; the general BNR
correspondence; construction of the de Rham or Higgs moduli spaces; and the full
Cartier-transform equivalence. The applications below consume the specific
interfaces of those broader developments rather than extending their scope.

## Conventions

### Fields, classes and dimensions

Use `BrauerGroup.{u,u} K` with the field and finite splitting extensions in one
universe, as in Tau Ceti's base-change homomorphism. A central simple algebra is
finite-dimensional and nonzero. Brauer equivalence uses matrix stabilizations
of positive size. For the multiplicative Lean group, the trivial class is `1`,
the product is tensor product, and inversion is the opposite algebra. In an
additive cohomology comparison, `Additive` changes notation, not the mathematical
group. Write $\alpha_L$ for `TauCeti.BrauerGroup.baseChange K L α`.

The existing algebra degree is the square root of its vector-space dimension.
The index of a central simple algebra is the degree of its central division
representative. Neither is the dimension of an arbitrary representative. The
period of a class is Mathlib's `orderOf`; prove finite order before using its
positivity. An infinite-order element would have natural `orderOf = 0`, so a
bare divisibility statement about `orderOf` would not by itself establish
torsion.

`splittingDegrees α` includes every finite field extension splitting $\alpha$,
including inseparable extensions. Its least element, its gcd property, and the
index divisibility assertions in SA.0 have no separability assumption.
Corestriction in SA.1 has a finite separable extension as input. Keep those
two domains separate.

For a division algebra $D/K$ and a specified algebra map

```math
\rho:D\longrightarrow M_n(L),
```

the left $D$-module $L^n$ is the restriction of the standard matrix column
module along $\rho$. Matrices act on column vectors by their rows:

```math
(a\cdot v)_i=\sum_j\rho(a)_{ij}v_j.
```

The $K$-action is the original one from $L$, and compatibility with the
restricted $D$-action is an `IsScalarTower K D (Fin n → L)` instance. This
instance is data to construct and prove compatible; a dimension predicate is
not a substitute for an actual action.

### Sheaf modules and splittings

Use left modules. A splitting generator $P$ comes with a specified algebra
isomorphism $A\simeq\mathcal End_{\mathcal O_X}(P)$. The action on $P\otimes N$
is on the first factor, and the inverse functor is the sheaf

```math
\mathcal Hom_A(P,M).
```

This is internal sheaf Hom, not just the group of global $A$-linear maps.
Its restriction to an open must identify with internal Hom of the restricted
modules. Write $F_P(M)$ for this inverse Morita module. Fix the evaluation
map $P\otimes F_P(M)\to M$, the unit $N\to F_P(P\otimes N)$, and their
triangle identities. Coherence is part of the interface, so subsequent descent
arguments use specified natural isomorphisms.

The ranks of splitting generators are positive and locally constant. They can
differ between connected components of $X$. In a finite pushforward

```math
q:V\longrightarrow B,
```

a direct-sum power law on an open $U\subseteq B$ requires that the generator
be free of one fixed rank $n>0$ on the whole inverse image $q^{-1}(U)$.
Local constancy on individual components of that inverse image is insufficient
when those components map to the same base component.

For a closed subscheme defined by an ideal sheaf $I$, scheme-theoretic support
means $I M=0$. Use the actual annihilator ideal sheaf. Its radical, its vanishing
locus, and topological support are different invariants. All support comparisons
below preserve the ideal itself and apply over nonreduced schemes.

### Characteristic coefficients

For a rank-$r$ finite locally free module and an endomorphism $u$, use

```math
\det(T\operatorname{id}-u)
```

as the monic characteristic polynomial. Its degree is $r$; at rank zero it
is $1$. For a Higgs action with coefficients in a locally free sheaf $W$,
retain the coefficients in every symmetric degree of $W$, rather than a
polynomial obtained by evaluating at one tangent direction. The universal
determinant is frame-independent and is the object to descend.

Changing a splitting $P$ to $Q$ changes the inverse module by an invertible
sheaf on the scheme carrying $A$. On a spectral cover, that line lies on
$V$, and need not come by pullback from $B$. Consequently a base-line
invariance lemma does not prove invariance after finite spectral pushforward.
SA.3 includes a semilocal trivialization argument that treats the spectral
line itself.

### Cartier forms and Brauer classes

Use the relative sequence for a specified smooth $Y/S$, its relative
Frobenius $F:Y\to Y'$, its actual units sheaves, closed relative forms,
and the map $\pi^*-C$. A change of base must carry a morphism of the full
sequence, not just a map of its last term. Write $\Phi=\delta_1\circ\delta_0$
for the composite of the two connecting maps through the middle image.

Distinguish the algebraic Brauer group of sheaf Azumaya algebras from the whole
group $H^2_{\mathrm{ét}}(\mathbb G_m)$. The shared comparison is injective.
Only classes with Azumaya representatives are translated back to tensor
products of algebras; no surjectivity statement is used.

## Exact supplier contracts

### From Mathlib and the field Brauer theory

Use the pins Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` for the representative Lean forms.
`CSA`, `IsBrauerEquivalent` and `BrauerGroup` are the existing carriers.
`TauCeti.BrauerGroup.mk`, `mk_eq_mk_iff`, `exists_eq_mk_centralDivisionRing`
and `nonempty_algEquiv_of_mk_eq_mk` give the quotient and division
representatives. Consume `baseChange`, `baseChange_mk`, `baseChange_self`,
`baseChange_comp` and `mk_mem_ker_baseChange_iff_isSplittingField` with their
actual algebra structures and scalar towers.

From `TauCeti.Algebra` use `index`, `index_matrix`, `index_eq_of_algEquiv`,
`index_pos`, `index_dvd_deg`, `index_eq_deg_of_divisionRing`, `deg_sq`,
`deg_baseChange`, `isSplittingField_self_iff_index_eq_one`, and
`index_eq_one_of_finite`. The finite splitter
`exists_isSplittingField_finrank_eq_index` has exact index degree but no
separability conclusion. Conversely
`exists_isSplittingField_finiteDimensional_isSeparable` supplies separability
but no exact-index-degree conclusion. Their distinction matters for Layer 1.
`IsSplittingField.nonempty_algEquiv_matrix_deg` supplies the exact-size
matrix presentation needed by the column argument.

Mathlib supplies the actual column action `Matrix.Module.matrixModule`,
restriction along `Module.compHom`, the right tensor-factor inclusion,
`IsScalarTower.of_algebraMap_smul`, `Module.Finite.of_restrictScalars_finite`,
division-ring freeness, and `Module.finrank_mul_finrank`. Its order-of-element
API gives `orderOf_dvd_iff_pow_eq_one`, `orderOf_eq_one_iff` and
`IsOfFinOrder.orderOf_pos`; positivity still requires a finite-order witness.

### From Mathlib: annihilators of products

For a commutative ring $R$, an $R$-module $M$, an ideal $I$ and a
nonempty index type $\iota$, Mathlib supplies the product-annihilator
comparison:

```math
I\subseteq\operatorname{ann}_R(\iota\to M)
\iff I\subseteq\operatorname{ann}_R M.
```

Equivalently the two annihilator ideals are equal. The implication from
the column module to $M$ uses a chosen coordinate and vectors supported
there. The reverse implication is coordinatewise. Finiteness of
$\iota$ is needed when identifying this module with the matrix Morita
functor, but not for the annihilator identity itself. Nonemptiness is
essential: the module indexed by the empty type is zero and has
annihilator $R$.

Use `Module.annihilator`, its membership formula and the existing
annihilator-of-products and linear-equivalence lemmas. For finite
$\iota$, the forward matrix Morita object is the existing
`ModuleCat.matrixEquivalence` object with its column action. Its inverse
is the image of a matrix idempotent. No private module category or
abstract support predicate is introduced.

This uses Mathlib's `Module.annihilator_pi`,
`Module.mem_annihilator`, `LinearEquiv.annihilator_eq`,
`ModuleCat.matrixEquivalence`, and `moritaEquivalenceMatrix`.
The source is EG, Remark 2.18 and the matrix step of Theorem 2.17,
pp. 13–14; the ideal statement specifies the scheme-theoretic meaning
of support in that argument.

### From the Galois-cohomology roadmaps

QuadraticFormInvariants, Layer 7B, supplies one comparison
`brauerCohomologyEquiv`, normalized by
`brauerCohomologyEquiv_crossedProductClass`: the class of each crossed product
maps to the inflated class of its defining two-cocycle. Its uniqueness theorem
fixes the comparison on the whole Brauer group. Use its comparison with the
native continuous model when its public carrier differs from
`TauCeti.ContCohomology.H2`.

ProfiniteCohomology, Layers 9–10, supplies the actual subgroup dictionary
`absoluteGaloisGroupEquivFixingSubgroup`, the open subgroup and its index,
and the separable-closure units comparison, with its compatible action and
discrete topology. The degree-two operations consumed here are
`explicitMap2`, `explicitRes2`, `explicitCor2` and
`explicitCor2_comp_res2`, including their composition and conjugation
naturality. All coefficient modules are the actual `TauCeti.UnitsCoeff`.

### From the geometric suppliers

AlgebraicVectorBundles, L0A, supplies sheaf tensor and internal Hom with
adjunction, evaluation, associativity and restriction. L0B supplies finite
locally free rank, locally constant rank loci and duals; L0C supplies
determinants and their local matrix and pullback comparisons. Use
Mathlib's `Scheme.Modules` and sheaf module carriers through those interfaces.

SchemeAndStackFoundations, SF.0, supplies quasi-coherent localization and
gluing, finite-presentation descent from strict localizations, finite
pushforward and its base-change comparison, and the coherent/finitely
presented comparison on locally noetherian schemes. The semilocal
rank-one trivialization needed in Layer 3 is a substep of
`spectralLineTrivialization`, not an additional export of SF.0.
Strict henselization itself is supplied by ModularCurves, Layer 4D;
the limit descent uses SF.0's `finite-presentation-limits` interface.
SF.2 supplies the shared sheaf Azumaya and splitting objects, algebraic
Brauer group, pullbacks, abelian étale sheaf cohomology and connecting-map
naturality. Its map from algebraic Brauer classes to degree-two units
cohomology must be injective; no surjectivity is assumed.

HodgeStructuresPartII, H.0, supplies integrable Higgs objects at parameter
zero and the equivalence between exterior integrability and a commuting
action of the symmetric algebra of the dual coefficient sheaf. For §3.7
the coefficient sheaf is finite locally free. The spectral input includes
the actual algebra map from that symmetric algebra to the finite algebra
$q_*\mathcal O_V$; its action on $q_*F$ determines the Higgs field. The
universal determinant and its coefficient, frame, direct-sum and base-change
laws are established here using AlgebraicVectorBundles L0C, as specified
in §3.7. No generic projective-generator theorem from an algebraic
K-theory layer is needed for the local matrix argument.

### The relative Cartier application contract

Layer 4 uses the full relative Cartier sequence, its functorial diagrams,
the differential-operator Azumaya/contact-form comparison, the specified
lift-dependent bounded splitting, and the comparison bimodules. The precise
five contracts appear in §4.1. They are hypotheses of the application;
neither SF.2's generic sheaf cohomology nor a crystalline-cohomology
comparison implies them. Their full Cartier-transform theory is not
replaced by an arbitrary sequence or an unspecified categorical equivalence.

## How to read the build

Layer 0 (SA.0) establishes the quotient index, its splitting degrees and
extension bounds. Layer 1 (SA.1) fixes all-class restriction and transfer,
then proves torsion and the period-index relations. Layer 2 (SA.2) constructs
the local-to-global sheaf Morita comparison with exact support. Layer 3
(SA.3) compares its inverse modules by transition lines and descends full
characteristic coefficients, including after finite spectral pushforward.
Layer 4 (SA.4) uses that geometric interface for the two-step Cartier
boundary and the relative Brauer/Morita application.

## Layer 0: the index of a Brauer class

This layer assembles the existing algebra index and splitting-field results
into a quotient-level arithmetic interface. Its splitting-degree theory
uses all finite extensions. The column-module proof below supplies the
dimension step without a separability assumption.

### 0.1 Descending the algebra index

Prove `indexBrauerCongr`: if finite-dimensional central simple $K$-algebras
$A$ and $B$ are Brauer equivalent, their existing algebra indices are
equal. Unpack the positive matrix sizes in `IsBrauerEquivalent`, install
the corresponding `NeZero` instances, use invariance under algebra
equivalence, and cancel the matrix stabilizations through `index_matrix`.
This is the well-definedness lemma for a quotient lift.

Define

```math
\operatorname{classIndex}:\operatorname{Br}(K)\longrightarrow\mathbb N,
\qquad
\operatorname{classIndex}([A])=\operatorname{index}_K(A).
```

The definition uses the existing quotient map `TauCeti.BrauerGroup.mk`.
The representative Lean form evaluates the existing algebra index on
`Quotient.out α`; its representative formula asserts independence of that
choice. This is equivalent to the quotient lift justified by
`indexBrauerCongr`, and introduces no additional algebra carrier.
Prove its representative formula `classIndex_mk`, its strict positivity
`classIndex_pos`, and the characterization `classIndex_eq_one_iff`:

```math
0<\operatorname{classIndex}(\alpha),\qquad
\operatorname{classIndex}(\alpha)=1\iff\alpha=1.
```

The positivity is inherited from the algebra index. For the characterization,
use the existing equivalence between ground-field splitting and index one,
and the kernel characterization of Brauer base change. Keep the quotient
construction independent of the choice of a division representative; the
division-representative theorem then gives a convenient computation lemma.

The basic API consists of:

- `classIndex_mk`: evaluation on a central simple representative;
- `classIndex_pos`: a positive natural number for every class;
- `classIndex_eq_one_iff`: exactly the identity class has index one;
- `classIndex_baseChange_dvd`: extension of the ground field can only
  lower index by a divisor, as proved below.

**Checks.**

- `matrix_identity`: $M_n(K)$ has class index $1$ for every $n>0$.
   In particular $M_2(K)$ has algebra degree $2$ but class index $1$.
- `finite_field`: every class over a finite field has index $1$.
- `division_representative`: a finite-dimensional central division
   algebra $D/K$ has class index $\deg_K D$.
- `zero_excluded`: no class has index $0$.
- `hamilton_period_index`: the Hamilton quaternion class over
   $\mathbb R$ has index $2$ and `orderOf` $2$.
- `complexification_lowers_index`: its extension to $\mathbb C$ has
   index $1$, while its real index is $2$.

The matrix and division tests distinguish index from the degree of an
arbitrary representative. The last test prevents an incorrect base-change
API that asserts index equality.

This uses Tau Ceti's `Algebra.index`, `index_matrix`,
`index_eq_of_algEquiv`, `index_pos`, `index_eq_deg_of_divisionRing`,
`isSplittingField_self_iff_index_eq_one`, `index_eq_one_of_finite`, and
`BrauerGroup.mk_eq_mk_iff`, from the parent Layer 6. The real computations
use `TauCeti.Quaternion.orderOf_mk_eq_two` and the existing quaternion
complexification. The source is GS, §4.5, pp. 100–106; Benoist, §0.1, p. 63,
for the quotient-level index convention.

### 0.2 Splitting degrees

Define `splittingDegrees α : Set ℕ` by

```math
d\in\operatorname{splittingDegrees}(\alpha)
\iff
\exists L/K\text{ finite},\ [L:K]=d\text{ and }\alpha_L=1.
```

The field $L$, field structure, algebra structure and finite-dimensional
instance are genuine extension data. The zero natural number is excluded
by positivity of the dimension of a field extension; the definition itself
does not impose a separate arbitrary positivity witness. No separability
condition appears here.

Supply:

- `mem_splittingDegrees`, exposing precisely those field and dimension data;
- `one_mem_splittingDegrees_iff`, characterizing the identity class;
- `splittingDegrees_nonempty`, from an existing finite splitter;
- `splittingDegrees_positive`, giving $d>0$ for every member;
- `classIndex_mem_splittingDegrees`, using the exact-degree splitter.

**Checks.**

- `identity_degree_one`: the ground field contributes degree $1$ for the
  identity class.
- `zero_degree`: no class has a degree-zero field splitter.
- `nontrivial_no_degree_one`: a nonidentity class has no degree-one splitter.
- `quaternion_degree_two`: $\mathbb C/\mathbb R$ contributes degree $2$ for
  the Hamilton class. A quadratic extension of an arbitrary field alone
  does not imply that a given class splits.

This uses the index descent above; `TauCeti.BrauerGroup.baseChange`,
its representative formula and splitting-kernel characterization;
`TauCeti.Algebra.exists_isSplittingField_finrank_eq_index`; and the usual
positive field-extension dimension lemmas. The source is GS, §4.5,
pp. 100–106; Benoist, §0.1, p. 63.

### 0.3 The actual division-column module

For a division $K$-algebra $D$, an extension field $L/K$, a natural
number $n$, and a specified $K$-algebra homomorphism
$\rho:D\to M_n(L)$, construct `divisionColumnModule n ρ`. It is the
existing matrix column action restricted by `Module.compHom`. For a
splitting equivalence $e:L\otimes_K D\simeq M_n(L)$, use the right
tensor-factor inclusion followed by $e$, with its $K$-algebra structure
explicitly restricted. Do not select a different abstract module action
merely because its dimension would give the desired divisibility.

The four API assertions are:

- `divisionColumnAction`: the coordinate sum is the row-by-column formula
  fixed in the conventions;
- `divisionColumnTower`: the action is compatible with $K\to D$, so
  the original $K$-module structure is a scalar tower;
- `divisionColumnFinite`: for finite $L/K$, the column module is finite
  over $D$;
- `divisionColumnDimension`: for finite-dimensional $D/K$ and $L/K$,
  its dimensions satisfy

  ```math
  \dim_K(L^n)=\dim_K(D)\,\dim_D(L^n).
  ```

The finiteness proof first gives the usual finite $K$-module structure
of $L^n$, then uses the restriction-of-scalars finiteness theorem and
the proved tower. Modules over a division ring are free, so the native
free-module finrank tower theorem applies. Retain the same action
instances throughout this argument.

Prove `splittingDegreeDvd`: if in addition $n>0$ and
$\dim_K D=n^2$, then

```math
n\mid [L:K].
```

Indeed the two computations of the column dimension give
$n[L:K]=n^2\dim_D(L^n)$. Cancel the positive $n$ in the natural-number
equality and retain the resulting divisibility witness. The theorem needs
finite-dimensional $D/K$ and $L/K$, but not a separability hypothesis
and not a perfectness hypothesis. With the exact-size splitting matrix
presentation of a central division algebra, $n=\deg_K D$.

For `divisionModuleDimension`, package this particular action for a
specified splitting equivalence of a central division algebra. Return
the action, compatible scalar tower, finiteness, and the dimension identity
together. This adapter bridges the general column action to the division
representative of a Brauer class. A proof of the dimension equality alone
would not provide the module instance needed by the tower law.

**Checks.**

- `column_rank_one`: a one-entry column is acted on by the single matrix
   entry $\rho(a)_{00}$.
- `column_rank_two`: its first coordinate is
   $\rho(a)_{00}v_0+\rho(a)_{01}v_1$.
- `column_empty`: for $n=0$, the column module is finite and its
   $K$-dimension is zero. This does not permit canceling $n$ in the
   splitting-degree theorem, whose positive-size hypothesis is essential.
- `column_degree_boundary`: a division algebra of $K$-dimension $4$
   cannot map as a $K$-algebra into $M_2(L)$ when $[L:K]=3$.

This uses Mathlib's `Matrix.Module.matrixModule`, `Module.compHom`,
`Algebra.TensorProduct.includeRight`, `IsScalarTower.of_algebraMap_smul`,
`Module.Finite.of_restrictScalars_finite`, division-ring freeness,
`Module.finrank_mul_finrank`, `Module.finrank_pi_fintype`, and cancellation
of a nonzero natural factor. For the CSA adapter use
`TauCeti.Algebra.IsSplittingField.nonempty_algEquiv_matrix_deg` and the
degree-square dimension formula. The source is GS, Proposition 4.5.3 and
Proposition 4.5.8, §4.5, pp. 100–106. The restricted-column dimension
argument specifies the extension of the splitting-degree divisibility
statement to all finite extensions.

### 0.4 Arithmetic of index under scalar extension

Prove `indexDividesSplittingDegree`: for any finite $L/K$ splitting
$\alpha$,

```math
\operatorname{classIndex}(\alpha)\mid[L:K].
```

Choose the existing central division representative, translate the
base-change equation to splitting, and use its exact-degree matrix
presentation and the division-column argument. The conclusion is about
the original class, independent of the chosen representative.

Prove the two extension inequalities in divisibility form:

```math
\operatorname{classIndex}(\alpha_L)
\mid \operatorname{classIndex}(\alpha)
\quad\text{for every field extension }L/K,
```

and

```math
\operatorname{classIndex}(\alpha)
\mid [L:K]\operatorname{classIndex}(\alpha_L)
\quad\text{for every finite field extension }L/K.
```

The first is `classIndex_baseChange_dvd`. For a division representative
$D$, the extended central simple algebra has the same degree as $D$,
and its index divides that degree. The second is
`indexDividesDegreeIndex`. Choose an exact-index finite splitter of the
class over $L$, compose it with $L/K$, use the tower degree formula,
and apply splitting-degree divisibility to the composite. Neither
argument assumes separability. The composition of Brauer base changes
is the existing `TauCeti.BrauerGroup.baseChange_comp`, with an actual
algebra tower.

This uses the quotient computation and division-column targets
above; Tau Ceti's central division representative, `Algebra.deg_baseChange`,
`Algebra.index_dvd_deg`, exact-index splitting theorem, and Brauer
base-change composition; Mathlib's dimension tower law. The source is GS,
Proposition 4.5.8, p. 103, and Corollary 4.5.11, p. 104. The all-finite reverse
divisibility uses the explicitly given tower argument.

### 0.5 Least degree, gcd and cyclic-subgroup invariance

Translate the existing exact-index finite splitter to
`classIndex_mem_splittingDegrees`. Together with the preceding divisibility
and strict positivity this gives `minimumSplittingDegree`:

```math
\operatorname{IsLeast}
\bigl(\operatorname{splittingDegrees}(\alpha),
      \operatorname{classIndex}(\alpha)\bigr).
```

The minimum is attained, not merely an infimum. Prove the gcd property in
the form `gcdSplittingDegrees`: for every natural number $m$,

```math
\bigl(\forall d\in\operatorname{splittingDegrees}(\alpha),\ m\mid d\bigr)
\iff m\mid\operatorname{classIndex}(\alpha).
```

This form avoids choosing an arbitrary enumeration of an infinite set.
The forward direction specializes to its member
$\operatorname{classIndex}(\alpha)$; the reverse direction uses
splitting-degree divisibility. It includes $m=0$, for which both sides
are false because the set has positive members and the class index is
positive.

Finally prove `sameCyclicIndex`. If two classes generate the same cyclic
subgroup of $\operatorname{Br}(K)$, then they have equal class index.
For every extension, the restriction homomorphism kills one generator
exactly when it kills the other. Thus their splitting-degree sets agree,
and so do their least members. This argument needs no claim that period
equals index and no classification of the subgroups of the Brauer group.

This uses the splitting-degree definition, attainment,
divisibility and positivity in this layer; homomorphicity of Tau Ceti's
Brauer base change and Mathlib's `Subgroup.zpowers`. The sources are GS,
Corollaries 4.5.9–4.5.10, pp. 103–104; Benoist, §0.1, p. 63, for the
minimum/gcd characterization.

### Examples

For $M_2(K)$, degree is $2$, scalar dimension is $4$, and class index is
$1$. For Hamilton quaternions these values are $2$, $4$ and $2$; extension
to $\mathbb C$ changes the index to $1$. The trivial class has least
splitting degree $1$. Setting the proposed common divisor to $0$ in the
gcd formula gives false on both sides, because splitting degrees and the
index are positive. The empty column has dimension zero and provides no
positive factor to cancel.

### Dependencies

This layer uses the existing field Brauer quotient, algebra index, division
representatives and splitting-field interfaces; the listed Mathlib column,
scalar-tower and finrank operations supply the dimension argument. The
finite-field branch uses `index_eq_one_of_finite`; GS §4.5 assumes an infinite
base field, so that branch is supplied by the library rather than inferred
from the book's standing hypotheses.

## Layer 1: period, restriction and corestriction

This layer connects the field Brauer group to continuous cohomology with its
full units coefficients. It first identifies scalar extension with restriction,
then transports corestriction. Torsion and period-index divisibility are
consequences of these maps and a separable splitter of the required degree.
No theorem in this layer asserts that period equals index.

### 1.1 The all-class restriction square

Use the crossed-product-normalized comparison from QuadraticFormInvariants,
Layer 7B. For a finite separable extension $L/K$, choose an embedding into
the separable closure of $K$ and the associated identification of the
separable closures. Identify $G_L$ with the resulting open subgroup $U$ of
$G_K$, with $[G_K:U]=[L:K]$. The coefficient comparison must identify
`TauCeti.UnitsCoeff L` with the restriction of `TauCeti.UnitsCoeff K` along
that subgroup isomorphism, including its action and discrete topology.

Prove `comparisonBaseChangeUnits`: the square

```math
\begin{array}{ccc}
\operatorname{Additive}\operatorname{Br}(K)&\xrightarrow{c_K}&
 H^2(G_K,(K^s)^\times)\\
\downarrow\operatorname{res}_{L/K}&&\downarrow\operatorname{res}_{U}\\
\operatorname{Additive}\operatorname{Br}(L)&\xrightarrow{c_L}&
 H^2(G_L,(L^s)^\times)
\end{array}
```

commutes after the specified coefficient transport. This is a square on the
whole group. The comparisons are normalized by the same crossed-product
convention, so changing a sign convention on one horizontal arrow would
change the statement. The lower-right carrier must be transported explicitly;
the two separable closures are isomorphic but are not definitionally the
same Lean type.

For this target, use Tau Ceti's actual `UnitsCoeff`, its continuous action,
and its degree-two continuous cohomology carrier. The relevant native model
is `TauCeti.ContCohomology.H2`, with continuous cocycles and coboundaries;
`explicitMap2` gives compatible-pair transport and `explicitRes2` gives
restriction to a subgroup. Comparison with a canonical continuous-cohomology
model, when used by an imported interface, must be carried by the supplied
comparison isomorphism. Ordinary discrete group cohomology is not a
replacement for continuous cohomology of an infinite Galois group.

This uses QuadraticFormInvariants, 7B, for the full normalized
Brauer comparison and the relative finite-Galois comparison;
ProfiniteCohomology, 9–10, for the Galois subgroup and units-coefficient
dictionary and its degree-two maps; Tau Ceti's Brauer base change.
The source is GS, §4.4, pp. 95–99, and Proposition 4.5.6 and Lemma 4.5.7, pp. 102–103. The full units-coefficient square is the precise naturality
interface required by the transfer construction.

### 1.2 Transported Brauer corestriction

Construct, for every finite separable $L/K$, a homomorphism

```math
\operatorname{brauerCorestriction}_{L/K}:
\operatorname{Br}(L)\longrightarrow\operatorname{Br}(K).
```

In Lean this is a multiplicative homomorphism. Under `Additive`, it is
the composite of the comparison over $L$, the closure-and-subgroup
identification, degree-two continuous corestriction, and the inverse
comparison over $K$. Tau Ceti's `explicitCor2` takes the actual open
finite-index subgroup and the actual restricted coefficient module;
use that operation rather than inventing another cochain formula.

More explicitly, for the chosen embedding $\sigma$, put
$U_\sigma=\operatorname{Gal}(K^s/\sigma(L))$. Let $e_\sigma$ be the
continuous group isomorphism $G_L\simeq U_\sigma$, and let $v_\sigma$
be the equivariant additive isomorphism $(L^s)^\times\simeq(K^s)^\times$
with the latter restricted to $U_\sigma$. Define $j_\sigma$ on degree-two
cohomology by the actual compatible pair $(e_\sigma^{-1},v_\sigma)$,
and set $c_{L,U_\sigma}=j_\sigma\circ c_L$. Then the defining equation is

```math
c_K(\operatorname{Additive}(\operatorname{cor}_{L/K}(\beta)))
=\operatorname{explicitCor2}_{G_K,\operatorname{UnitsCoeff}K,U_\sigma}
  \bigl(c_{L,U_\sigma}(\operatorname{Additive}\beta)\bigr).
```

Thus the additive map is exactly
$c_K^{-1}\circ\operatorname{explicitCor2}\circ j_\sigma\circ c_L$.
Here $c_K$ and $c_L$ are the supplied normalized comparisons, characterized
on every crossed product by its defining cocycle. The all-class restriction
square becomes
$c_{L,U_\sigma}(\operatorname{Additive}\alpha_L)
=\operatorname{explicitRes2}_{U_\sigma}(c_K(\operatorname{Additive}\alpha))$.
This is a theorem to prove from the normalized comparisons and scalar
extension, rather than a premise used to define the map.

The construction must be independent of the chosen embedding and compatible
closure identifications. Prove this through the conjugation and coefficient
naturality diagrams of the imported transfer, retaining the normalized
Brauer comparisons. Independence is an equality of homomorphisms, not merely
an assertion that the restriction formula holds for one chosen embedding.

Its API is:

- `brauerCorestriction_res`, or `corestrictionRestrictionDegree` in theorem
  form:

  ```math
  \operatorname{cor}_{L/K}(\alpha_L)=\alpha^{[L:K]};
  ```

- `brauerCorestriction_comp`: for a finite separable tower $K\subseteq L\subseteq E$,
  transfer from $E$ to $K$ equals transfer from $E$ to $L$ followed by
  transfer from $L$ to $K$;
- `brauerCorestriction_self`: transfer over $K/K$ is the identity;
- `brauerCorestriction_embedding`: compatible changes of embedding into
  a separable closure produce the same map;
- `brauerCorestriction_cohomology`: the comparison of the transferred
  class equals the actual degree-two cohomological corestriction of its
  comparison, after the specified closure transport.

The last equation fixes what the construction means without unfolding a
chosen quotient implementation. The restriction formula alone does not
characterize a homomorphism on classes outside the image of restriction.

**Checks.**

- `identity_extension`: transfer over the identity extension fixes every
   class.
- `trivial_class`: every finite separable transfer sends the identity
   class to the identity class.
- `quadratic_restriction`: for a separable quadratic extension,
   $\operatorname{cor}(\operatorname{res}\alpha)=\alpha^2$. The expected
   value is the square, not an unqualified equality with $\alpha$.
- `inseparable_boundary`: a purely inseparable nontrivial extension
   does not supply the `Algebra.IsSeparable` input for this construction.
   It still belongs to the domain of the SA.0 splitting-degree theory.

This uses the preceding all-class square; QuadraticFormInvariants,
7B; ProfiniteCohomology, 9–10, including transfer under conjugation and
coefficient transport. For the degree formula use the actual
`TauCeti.ContCohomology.explicitCor2_comp_res2` and the subgroup-index
computation. The sources are GS, §4.5, pp. 100–106, and Proposition 4.2.10,
pp. 88–89, for the continuous restriction–corestriction composite.

### 1.3 Annihilation by splitting degree and by index

Prove `separableSplittingAnnihilates`: if finite separable $L/K$ splits
$\alpha$, then $\alpha^{[L:K]}=1$. Apply the transfer to the equation
$\alpha_L=1$ and use the degree formula. This result keeps separability
in its hypotheses, unlike SA.0's index divisibility.

Prove `classPowerIndex`:

```math
\alpha^{\operatorname{classIndex}(\alpha)}=1
\quad\text{for every field }K\text{ and }\alpha\in\operatorname{Br}(K).
```

For a finite field, the existing triviality/index-one results reduce the
statement to the identity class. For an infinite field, use a finite
separable splitting extension of degree exactly the division
representative's degree. This precise existence theorem is a parent
Layer 6 interface. Having a finite separable splitter and having a finite
splitter of index degree as two unrelated existential statements does not
give their conjunction.

The corrected source argument chooses an element with a separable reduced
characteristic polynomial of degree equal to the division degree. The
algebra $K[T]/(P_a)$ embeds into the division algebra. Its finite-dimensional
commutative domain structure makes it a field, and the distinct roots of
$P_a$ give separability. This is the step specified by the author's
correction to the proof on GS p. 101. Do not use an assertion of
irreducibility over an algebraic closure.

From `classPowerIndex` and the positivity of the class index prove
`brauerFiniteOrder`, including the positive natural order. Then prove
`periodDividesIndex`:

```math
\operatorname{orderOf}(\alpha)\mid\operatorname{classIndex}(\alpha).
```

Use `orderOf_dvd_iff_pow_eq_one` directly. There is no separate period
definition and no choice of a torsion witness in the result. State
`IsOfFinOrder α` and the positive-order consequence as separate usable
lemmas, so callers need not recover positivity from a divisibility fact.

This uses SA.0's quotient index, positivity and identity
characterization; the restriction–corestriction formula; parent
SemisimpleAlgebras, Layer 6, for the separable exact-index splitter over
infinite fields; Tau Ceti's finite-field index theorem and finite separable
splitting theorem; Mathlib's `isOfFinOrder_iff_pow_eq_one`,
`IsOfFinOrder.orderOf_pos`, and `orderOf_dvd_iff_pow_eq_one`.
The sources are GS, Proposition 4.5.4, pp. 101–102, Definition 4.5.12
and Proposition 4.5.13, pp. 104–105; GS errata, p. 3, correction to book p. 101.

### 1.4 Prime-to-period splitting and prime divisors

Prove `primeToPSplitting`: for a prime natural number $\ell$ with
$\ell\nmid\operatorname{orderOf}(\alpha)$, there is a finite separable
splitting field $E/K$ whose degree is prime to $\ell$.

The proof needs a finite Galois splitter $N/K$, a Sylow $\ell$-subgroup
$P$ of its Galois group, and its fixed field $E=N^P$. The tower has
$[N:E]=|P|$ a power of $\ell$ and $[E:K]$ prime to $\ell$. Under the
relative Brauer/cohomology identification, the restricted class lies in
the group associated to this finite $\ell$-group. Positive-degree
cohomology there is annihilated by the group order. The class is also
annihilated by its original period, which is prime to $\ell$. Bézout's
identity therefore kills the class over $E$.

Keep every comparison in this chain explicit: the relative Brauer group
is the kernel of restriction to $N$, the relevant cohomology uses the
units of $N$ with their Galois action, the subgroup is the actual Sylow
subgroup, and the fixed-field degrees come from Galois correspondence.
Finite torsion of $\operatorname{Br}(K)$ alone does not prove the
prime-to-degree splitting assertion.

Use this theorem and SA.0 splitting-degree divisibility to prove
`indexPrimeDividesPeriod`: if a prime $\ell$ divides the index, it divides
the period. Otherwise the prime-to-$\ell$ splitter would have degree
divisible by the index, a contradiction. Combine it with
`periodDividesIndex` to obtain `samePrimeDivisors`:

```math
\ell\mid\operatorname{orderOf}(\alpha)
\iff
\ell\mid\operatorname{classIndex}(\alpha)
\quad\text{for every prime }\ell.
```

The prime $\ell$ is an arithmetic prime; it may equal the characteristic
of $K$. The theorem imposes no separate prime-to-characteristic
condition. Such a condition belongs to other period-index bounds, not
this equality of prime-divisor sets.

This uses finite order in this layer; SA.0 splitting-degree
divisibility; QuadraticFormInvariants, 7B, for the finite-Galois relative
Brauer comparison and a finite Galois splitter; ProfiniteCohomology, 10,
for positive-degree finite-group cohomology annihilation; finite Galois
correspondence and Sylow subgroup degree computations in Mathlib.
The sources are GS, Proposition 4.5.13 and Lemma 4.5.14, pp. 104–105;
Benoist, §0.1, p. 63, for the general period-index statements.

### Examples

For the identity extension, transfer is the identity. In degree two the
restriction-transfer composite is squaring: for the Hamilton class its
restriction to $\mathbb C$ is trivial and its square is $1$. This agrees
with period and index $2$ and rejects a composite claimed to equal the
original nonsplit class. For the trivial class both period and index are
$1$, and no prime divides either. The prime-to-$p$ splitter statement
requires $p$ prime; $p=0$ is not an admissible instance.

### Dependencies

This layer uses Layer 0 and the normalized whole-group comparison of
QuadraticFormInvariants 7B. The subgroup, units-coefficient and continuous
transfer operations come from ProfiniteCohomology 9–10, including the
index computation and compatible-pair transport.

## Layer 2: geometric Morita theory and exact support

The goal is an equivalence on actual sheaf modules with enough naturality
to compare scheme-theoretic support. Glue the supplier's affine product-annihilator calculation through the
shared sheaf Azumaya and QCoh interfaces.

### 2.1 The nilpotent support boundary

Record `nilpotentSupportBoundary` as a concrete separation of ideal
annihilation from topological support. Take $R=\mathbb Z/4$ and $I=(2)$.
Then $I^2=0$, so the regular module $R=R/I^2$ has topological support in
$V(I)=\operatorname{Spec}R$. However $2\cdot1=2\ne0$, so it is not
annihilated by $I$.

The corresponding native assertions are $(2:R)^2=0$ and
$2\notin\operatorname{Module.annihilator}(R,R)$. They ensure that an
implementation comparing only radical ideals or sets of points cannot
satisfy the support interface. The zero-coordinate module boundary above
provides a second independent check on the positive-rank requirement.

This uses native `ZMod 4`, scalar multiplication on its regular
module, `Module.mem_annihilator`, and the usual prime-ideal containment
of nilpotent elements. The source is EG, Remark 2.18, p. 13; the
$\mathbb Z/4$ calculation is the explicit boundary example.

### 2.2 The sheaf Morita equivalence

Let $X$ be a scheme, $A$ a sheaf Azumaya $\mathcal O_X$-algebra from
the shared scheme-Brauer interface, and $P$ a finite locally free
splitting generator of positive rank with specified
$A\simeq\mathcal End_{\mathcal O_X}(P)$. Construct `sheafMorita`:

```math
\mathsf{QCoh}(X)\simeq\mathsf{QCoh}_A(X),
\qquad N\longmapsto P\otimes_{\mathcal O_X}N,
\qquad M\longmapsto\mathcal Hom_A(P,M).
```

Morphisms of $A$-modules are $A$-linear sheaf maps. The functors are
$\mathcal O_X$-linear and additive. The displayed tensor/Hom formulas
specify their objects and maps; an arbitrary equivalence of the two
categories would not satisfy the target.

Choose affine opens where $P$ is free of positive rank $n$. On such an
open, $A$ identifies with $M_n(R)$ and the existing matrix equivalence
sends $N$ to its $n$ columns. Identify its inverse, the $e_{11}$ summand,
with $\operatorname{Hom}_{M_n(R)}(R^n,M)$ by evaluation on the first
basis vector. Identify its forward functor with $R^n\otimes_R-$.
These formulas compare the library unit and counit with the displayed
tensor/Hom maps. Construct the restriction
comparisons for both functors and for evaluation, verify the unit and
counit identities locally, and descend those natural transformations.
The two triangle identities must survive descent. The result does not
choose a global trivialization of $P$.

The API supplies:

- `sheafMorita_unit`, the natural isomorphism
  $\mathcal Hom_A(P,P\otimes N)\simeq N$;
- `sheafMorita_counit`, the evaluation isomorphism
  $P\otimes\mathcal Hom_A(P,M)\simeq M$;
- `sheafMorita_restrict`, identifying both functors and their unit and
  counit after restriction to every open;
- `sheafMorita_matrix`, identifying the free positive-rank affine case
  with the pinned matrix Morita equivalence.

The unit and counit form natural isomorphisms, not just isolated
objectwise isomorphisms. Their formulas determine the comparison of
endomorphisms used by SA.3 and the identity-fibre comparison used by
SA.4.

**Checks.**

- `rank_one`: with $A=\mathcal O_X$ and $P=\mathcal O_X$, the equivalence
   identifies with the identity functor through the tensor and Hom units.
- `matrix_rank_two`: with $P=\mathcal O_X^2$, the forward object has the
   actual matrix column action and the same scalar annihilator as $N$.
- `disconnected_rank`: on a disconnected base, a generator of rank
   $1$ on one component and rank $2$ on another gives the corresponding
   local equivalences. No globally constant rank is required.
- `nongenerator`: on a nonempty base with nonzero structure sheaf, the
   zero module is not a splitting generator. Tensoring by it sends
   every module to zero and cannot have the displayed counit for a
   nonzero module.

This uses SchemeAndStackFoundations, SF.2, for the shared
scheme-Brauer/splitting object; SF.0 for quasi-coherent localization and
gluing; AlgebraicVectorBundles, L0A–L0C, for sheaf tensor/Hom and finite
locally free inputs; Mathlib's matrix Morita equivalence.
The sources are EG, proof of Theorem 2.17, pp. 13–14, and Remark A.3,
p. 41; BB, §2.2, p. 3, for the splitting-module meaning of equivalence.

### 2.3 Finite presentation and coherence

Prove `coherentMorita`: when $X$ is locally noetherian, $A$ is locally
finite over $\mathcal O_X$, and $P$ is the finite locally free splitting
generator above, `sheafMorita` restricts to an equivalence on coherent
modules. Quasi-coherence alone is not the desired finiteness condition.
On the free charts of §2.2 the forward underlying module is $N^n$ and
the inverse is the $e_{11}$ direct summand of $M$. Finite sums and
direct summands preserve finite presentation over $R$. For $A=M_n(R)$,
finite presentation as an $A$-module agrees with finite presentation
over $R$: $A$ is finite free over $R$, and an $A$-linear presentation
can be tested on its underlying $R$-linear kernel. Over the noetherian
base these are the coherent modules in question.

Also supply the finite-presentation version over arbitrary bases, using
the full subcategories of finitely presented quasi-coherent modules.
State this version in native `SheafOfModules.IsFinitePresentation`
terms through the shared underlying-module functors. It does not assert
that every finitely presented sheaf on a nonnoetherian scheme is
coherent. The restrictions of the unit, counit and open-locality maps
are the ones already constructed, so no second Morita equivalence is
chosen for coherent modules.

This uses `sheafMorita`, the preceding affine finite-presentation
argument, and SchemeAndStackFoundations, SF.0, for the locally noetherian
coherent/finite-presentation comparison and locality of these
conditions. The source is EG, Theorem 2.17, pp. 13–14; the finite-
presentation formulation specifies the general version of the local
Morita step.

### 2.4 Equality of ideal-sheaf annihilators

Prove `sheafSupportMorita`: for every $A$-module $M$ and closed
immersion $Y\hookrightarrow X$ defined by $I_Y$,

```math
I_YM=0
\iff
I_Y\mathcal Hom_A(P,M)=0.
```

Prove the stronger equality of the actual $\mathcal O_X$-annihilator
ideal sheaves of these modules. On an open where $P$ is free of
positive rank, the counit identifies $M$ with a matrix column module
of $F_P(M)$; the product-annihilator check compares their annihilators. Restriction
compatibility makes these identities equal on overlaps and allows
them to glue.

There is no noetherian, reducedness, smoothness or field hypothesis in
this target. It applies to nilpotent thickenings and nonreduced spectral
covers. In particular, if a spectral ideal annihilates the inverse
Morita module, it annihilates the original module with exactly the
same ideal. This is the interface needed when replacing a power of a
spectral equation by the actual spectral equation in a support argument.

This uses `sheafMorita`, its counit and restriction API,
Mathlib's `Module.annihilator_pi`; SchemeAndStackFoundations, SF.0 and SF.2, for ideal
actions and their local equality on the shared carrier;
`LinearEquiv.annihilator_eq`. The source is EG, Remark 2.18 and the
proof of Theorem 2.17, pp. 13–14.

### Examples

The rank-one splitting gives the identity equivalence. A rank-two free
splitting sends $N$ to $N\oplus N$ with its matrix action and preserves
its annihilator ideal. Empty columns have annihilator $R$, so a zero
splitting module cannot provide the counit on a nonzero module. Over
$\mathbb Z/4$, the regular module is supported on $V(2)$ as a set while
$2\cdot1\ne0$; equality of radicals would miss the required ideal action.

### Dependencies

Use the sheaf Azumaya and splitting objects of SF.2, QCoh and
finite-presentation localization of SF.0, the library's matrix equivalence,
and tensor/internal Hom and finite locally free operations of
AlgebraicVectorBundles L0A–L0C. The ideal-sheaf equality follows by gluing
the library's affine annihilator comparisons through the chosen counit.

## Layer 3: Morita characteristic coefficients

This layer defines characteristic invariants from actual inverse Morita
modules. Splitting changes are compared by line bundles and evaluation
maps, so their coefficients descend even when the base is nonreduced.
The single-endomorphism construction and the Higgs construction are
distinct: the second retains every symmetric differential coefficient
after finite spectral pushforward.

### 3.1 Transition lines between splitting generators

Let $P$ and $Q$ be splitting generators of the same sheaf Azumaya algebra
$A$ on $X$, with their specified algebra identifications. Prove
`splittingTransitionLine`: the sheaf

```math
L_{Q,P}=\mathcal Hom_A(Q,P)
```

is invertible, and evaluation gives natural isomorphisms

```math
F_Q(M)\simeq L_{Q,P}\otimes F_P(M).
```

The generators have the same positive rank on each connected component,
because both split the same algebra. Locally, the Morita equivalence
identifies their comparison module with a rank-one scalar module. Use
these local rank-one statements and the restriction maps from SA.2 to
construct the invertible sheaf and its evaluation isomorphism globally.

Fix the direction of the line. If $Q=P\otimes L$, then
$L_{Q,P}\simeq L^\vee$, so the inverse module changes by $L^\vee$.
This direction follows from the contravariance of Hom in its first
argument. A formula with $L$ instead of $L^\vee$ would give the wrong
transition maps even though some characteristic invariants would still
coincide.

Comparison for a third splitting generator must compose through the
evaluation isomorphism of transition lines. In particular the inverse
Morita functors have the prescribed overlap compatibility needed for
coefficient descent. Equality of Brauer classes alone supplies none of
these chosen maps.

This uses SA.2 sheaf Morita and its restriction-compatible
evaluation; the shared scheme-Brauer splitting interface from
SchemeAndStackFoundations, SF.2; AlgebraicVectorBundles, L0A–L0C, for
internal Hom, duals and invertible-sheaf tensor maps. The source is EG,
the étale descent step in Theorem 2.17, pp. 13–14. The transition-line
argument specifies the coefficient comparison without a polynomial-root
uniqueness assumption.

### 3.2 Characteristic polynomials under line twist

For an invertible sheaf $L$, a rank-$r$ finite locally free sheaf $N$,
and an $\mathcal O_X$-linear endomorphism $u$ of $N$, prove
`charpolyLineTwist`:

```math
\operatorname{charpoly}(\operatorname{id}_L\otimes u)
=\operatorname{charpoly}(u).
```

This is an equality of polynomials with coefficient sections on $X$.
Trivialize $L$ and $N$ locally. The induced matrices represent the same
endomorphism after an invertible change of frame, so their characteristic
polynomials agree. Conjugacy invariance of the determinant proves that
the coefficients glue. No reducedness or characteristic restriction is
needed; no power of the characteristic polynomial is taken.

Use the sheaf determinant from AlgebraicVectorBundles, L0C, to express
this polynomial as the determinant of $T\operatorname{id}-u$ after
polynomial scalar extension. The local affine calculation uses
`Matrix.charpoly_units_conj`. This target is their line-twist application,
not another determinant definition.

This uses AlgebraicVectorBundles, L0A–L0C; invertible sheaf
local triviality; Mathlib's `Matrix.charpoly_units_conj`; the coefficient
descent of SchemeAndStackFoundations, SF.0 and SF.2. The source is EG,
Theorem 2.17, pp. 13–14, with coefficientwise comparison through the
transition line.

### 3.3 The Morita characteristic polynomial

Given a sheaf Azumaya algebra $A$ on $X$, an $A$-module $M$, and an
$A$-linear endomorphism $t$ of $M$, suppose that the inverse module
$F_P(M)$ is finite locally free of rank $r$ on an étale splitting cover.
Define `moritaCharpoly` by its value on each splitting chart:

```math
\operatorname{moritaCharpoly}(A,M,t)|_U
=\operatorname{charpoly}\bigl(F_P(t)\bigr).
```

The result is a monic polynomial of degree $r$ on the rank-$r$ locus,
with coefficients that are actual structure-sheaf sections. If rank
varies between components, formulate the construction on the corresponding
rank loci and use their restriction compatibility. The rank-$r$ hypothesis
is the rank of the inverse module; the original $A$-module generally has
larger scalar rank.

On an overlap use `splittingTransitionLine` to identify the two inverse
modules and endomorphisms, then `charpolyLineTwist` to compare their
coefficients. Descent of these equal coefficients defines the polynomial.
It is not a chosen root of the characteristic polynomial of the original
module. Preserve the endomorphism comparison in the evaluation map so
that the construction is invariant under isomorphisms of the input data.

The API is:

- `moritaCharpoly_matrix`: for $A=M_n(R)$, $M=R^n\otimes N$ and
  $t=\operatorname{id}\otimes u$, the polynomial is $\operatorname{charpoly}(u)$;
- `moritaCharpoly_changeSplitting`: replacing the splitting generator
  compatibly leaves the polynomial unchanged;
- `moritaCharpoly_baseChange`: a pullback preserving the stated finite
  locally free data carries the polynomial to its coefficient pullback;
- `moritaCharpoly_degree`: on a rank-$r$ inverse-module locus, the
  polynomial is monic with degree $r$.

Base change here carries the splitting, the module, its endomorphism,
and the determinant comparisons. On a scheme, the coefficient map is
the pullback of sections. The assertion does not identify unrelated
section rings by definitional equality.

**Checks.**

- `rank_one_scalar`: for a rank-one inverse module with scalar
   endomorphism $b$, the value is $T-b$.
- `zero_rank`: the zero inverse module has polynomial $1$ and degree
   zero.
- `nonreduced_scalar`: over $R=\mathbb F_2[\varepsilon]/(\varepsilon^2)$,
   the scalar $\varepsilon$ on a rank-one inverse module gives
   $T-\varepsilon$, distinct from $T$.
- `line_twist`: replacing $P$ by $P\otimes L$ gives the same polynomial,
   with the inverse-module comparison provided by the transition
   evaluation isomorphism.

The nonreduced scalar test prevents a definition that recovers only a
power of the polynomial and then chooses an arbitrary monic root. The
zero-rank test distinguishes the determinant convention from an
incorrect zero polynomial. The matrix test pins the construction to
the actual inverse Morita module rather than the original scalar
module.

This uses SA.2 sheaf Morita; the transition line and line-twist
targets of this layer; SchemeAndStackFoundations, SF.2, for the shared
Azumaya/splitting carrier and étale descent of sections;
AlgebraicVectorBundles, L0C, for the finite locally free determinant and
its pullback law. The source is EG, Theorem 2.17, pp. 13–14; this
construction uses coefficient descent in its local Morita argument.

### 3.4 The nonreduced Frobenius-root boundary

Use the native ring `TrivSqZeroExt (ZMod 2) (ZMod 2)`, and set
$\varepsilon=\operatorname{inr}(1)$. Prove `epsilon_ne_zero`,
`epsilon_sq`, and `two_epsilon`. Then prove
`distinctMonicFrobeniusRoots`:

```math
T\ne T+\varepsilon,\qquad
T\text{ and }T+\varepsilon\text{ are monic},\qquad
T^2=(T+\varepsilon)^2.
```

This fixes a real coefficient ring and real polynomials. It is a
counterexample to uniqueness of monic Frobenius roots on nonreduced
bases. It does not contradict invariance of the polynomial selected
from a specified module action, because that action determines its
linear coefficient before taking a power.

This uses Mathlib's `TrivSqZeroExt.inr_mul_inr`, `ZMod 2`, and
the native polynomial operations and monicity predicate. The source is
EG, the root-uniqueness step in the proof of Theorem 2.17, pp. 13–14;
the dual-number computation supplies the precise boundary requiring
coefficient descent.

### 3.5 Finite pushforward of a split Morita module

Let $q:V\to B$ be finite. On an open base chart $U$, suppose the
splitting generator $P|_{q^{-1}U}$ is free of one fixed positive rank
$n$, with the specified algebra splitting. For $M\simeq P\otimes F$,
prove `finitePushforwardMorita`:

```math
(q_*M)|_U\simeq\bigl((q_*F)|_U\bigr)^{\oplus n}.
```

The isomorphism intertwines every commuting function action from the
finite algebra of $V$. If $(q_*M)|_U$ is finite locally free, then so
is $(q_*F)|_U$, and their ranks satisfy

```math
\operatorname{rank}(q_*M)|_U
=n\operatorname{rank}(q_*F)|_U.
```

For finite projectivity, the inverse module is a direct summand of the
finite direct sum, and local freeness follows from finite projectivity
over the base local rings. The direct-sum multiplicity comes from the
chosen free generator on the entire inverse image. This condition is
stronger than having a positive splitting rank at every point of $V$.

The local matrix identification must carry the functions on the
spectral scheme to the diagonal commuting actions on all $n$ copies.
An isomorphism merely of the underlying scalar modules would not
identify their universal characteristic determinants. This intertwining
property is consumed by `moritaHiggsInvariant_power` below.

This uses SA.2 sheaf Morita, evaluation and affine matrix
specialization; SchemeAndStackFoundations, SF.0, for finite pushforward,
direct sums and the finite-projective/local-free comparison; Mathlib's
matrix Morita equivalence. The source is EG, the finite spectral
pushforward step of Theorem 2.17, pp. 13–14, with the fixed-rank
inverse-image hypothesis stated explicitly.

### 3.6 Lines on finite spectral covers

For finite $q:V\to B$ and an invertible sheaf $L$ on $V$, prove
`spectralLineTrivialization`. After base change to a strictly henselian
localization at a geometric point of $B$, the finite algebra presenting
$V$ is semilocal. An invertible module over that algebra is free of
rank one. Its chosen trivialization descends to an étale neighborhood
of the point using finite-presentation descent.

The finite algebra may have several local factors. Trivialize the
rank-one module on all of them and combine the trivializations on
the semilocal algebra. The invertible sheaf need not be a pullback
from the base. Ordinary henselianity alone also does not guarantee
splitting of an arbitrary Azumaya algebra: for that assertion the
residue algebra must split, or one uses the strictly henselian input
and the shared étale-splitting theorem.

Prove `finitePushforwardLineInvariant`: for a quasi-coherent $F$ with
$q_*F$ finite locally free, the pushed universal characteristic
coefficients of $L\otimes F$ agree with those of $F$. Use the
étale-local trivialization on the finite cover just established. Its
isomorphism $L\otimes F\simeq F$ is linear over the finite algebra,
so after pushforward it conjugates every commuting function action,
not only the scalar action from $B$. Coefficientwise determinant
invariance and descent then prove the result on $B$.

Retain the full symmetric coefficients of the imported Higgs action.
Showing equality after evaluation at one direction is insufficient,
especially over finite fields. The universal determinant makes all
coefficient comparisons simultaneous and compatible with a change
of local frame of the coefficient sheaf.

Prove the semilocal rank-one step within `spectralLineTrivialization`:
choose one module element whose image is a basis at each of the finitely
many residue fields, using the Chinese remainder theorem. The map from
the ring to the invertible module sending $1$ to that element is an
isomorphism at every maximal localization, hence an isomorphism.
This is the rank-one case of Stacks, Lemma 10.78.7,
[tag 02M9](https://stacks.math.columbia.edu/tag/02M9).

This uses SchemeAndStackFoundations, SF.0, for descent of finite-presentation
data from strict localizations, together with ModularCurves Layer 4D's
strict henselization; SF.2 for the shared splitting and
étale equality detection; AlgebraicVectorBundles, L0, for invertible
sheaves and determinants; HodgeStructuresPartII, H.0, for the
Higgs/symmetric-action comparison; the universal coefficient construction
specified in §3.7; `Matrix.charpoly_units_conj` for
the affine endomorphism calculation. The source is EG, the strict local
and finite-presentation steps in Theorem 2.17, pp. 13–14. The
spectral-line argument specifies the overlap comparison needed after
pushforward.

### 3.7 Overlap and the full Morita Higgs invariant

Let $q:V\to B$ be a finite spectral morphism, $A$ a sheaf Azumaya
algebra on $V$, and $M$ an $A$-module. On étale splitting neighborhoods
of $B$, suppose the pushed inverse modules $q_*F_P(M)$ are finite
locally free of rank $r$. Fix a finite locally free coefficient sheaf
$W$ on $B$ and an algebra map
$\operatorname{Sym}(W^\vee)\to q_*\mathcal O_V$ compatible with
restrictions and the base changes considered. Its action on each
$q_*F_P(M)$ gives the integrable $W$-valued Higgs field through
HodgeStructuresPartII H.0's Higgs/symmetric-action comparison.

For a finite locally free Higgs module $(N,\vartheta)$ of rank $r$,
construct its universal coefficient polynomial as follows. After scalar
extension to $S=\operatorname{Sym}_{\mathcal O_B}(W)$, compose
$\vartheta:N\to N\otimes W$ with the degree-one inclusion
$W\to S$ to obtain an $S$-linear endomorphism $u_\vartheta$ of $N_S$.
Take $\det(T\operatorname{id}-u_\vartheta)$. On a frame $w_j$ of $W$
with contraction matrices $A_j$, this is
$\det(TI-\sum_j w_jA_j)$. The coefficient of $T^{r-i}$ is homogeneous
of symmetric degree $i$. Prove independence of both frames by the
tensorial construction and determinant conjugation invariance; prove
pullback and direct-sum compatibility by the supplied determinant laws.
Thus these coefficient laws are substeps of the invariant construction,
rather than presumed exports of H.0.

Prove `moritaHiggsOverlap`: for two splitting generators, all symmetric
characteristic coefficients of these pushed inverse modules agree.
First identify the inverse modules by the transition line on $V$;
then use `finitePushforwardLineInvariant`. The statement is stronger
than equality of characteristic polynomials of a single endomorphism
on $V$, because it compares the full coefficient-valued actions after
pushforward to $B$.

Define `moritaHiggsInvariant` by descent of those actual coefficient
sections. Its local universal polynomial has degree $r$ and is monic.
The coefficient in symmetric degree $i$ lies in the appropriate
sections of $\operatorname{Sym}^i W$ on $B$, where $W$ is the Higgs
coefficient sheaf. The construction uses the single imported Higgs
carrier and determinant convention; it does not introduce a second
notion of integrability or a second symmetric algebra.

The four API statements are:

- `moritaHiggsInvariant_local`: on a splitting chart, its coefficients
  are the universal determinant coefficients of the actual
  $q_*\mathcal Hom_A(P,M)$;
- `moritaHiggsInvariant_changeSplitting`: a compatible change of
  splitting generator leaves every coefficient unchanged;
- `moritaHiggsInvariant_baseChange`: a compatible base change preserving
  the finite locally free inverse pushforward pulls back every
  coefficient;
- `moritaHiggsInvariant_power`: when the free splitting generator has
  one fixed positive rank $n$ on the whole inverse image of a base
  chart, the original pushed module has the $n$-th power universal
  characteristic polynomial and rank $nr$.

Expose the first three as the local, change-of-splitting and base-change
theorems (`higgsInvariantLocal`, `higgsInvariantChange`,
`higgsInvariantBaseChange`), and the fourth as `higgsInvariantPower`.
These are usable statements about the construction, with the same
specified action and coefficient transport. The base-change theorem
requires the comparison between the pullback of a finite pushforward
and the pushforward after base change; it does not replace that
comparison with equality of unrelated carriers. It also keeps the
finite locally free hypothesis on the resulting inverse pushforward.

For the power law, use `finitePushforwardMorita` to obtain $n$ copies
of the same inverse pushforward with the same Higgs action. Its
universal matrix is block diagonal, so the determinant is the product
of the $n$ identical block determinants. `Matrix.det_blockDiagonal`
supplies the affine determinant calculation. Rank multiplication
holds on the same chart. On different base components the exponent
may differ, provided the fixed-rank condition holds on each whole
inverse image.

**Checks.**

- `higgs_scalar_rank_one`: one scalar action $b$ gives $T-b$; with
   several coefficient directions, the universal polynomial retains
   each linear coefficient of the action.
- `higgs_zero_module`: the zero inverse pushforward has invariant
   $1$ and rank zero.
- `higgs_spectral_line`: tensoring the inverse module with an
   invertible sheaf on $V$ preserves all pushed coefficients, including
   when that line does not pull back from $B$.
- `higgs_nonreduced_root`: over the characteristic-two dual numbers,
   $T$ and $T+\varepsilon$ have different coefficients despite their
   equal squares; the actual Higgs action selects the invariant.
- `higgs_finite_field_directions`: over $\mathbb F_2$, the rank-three
   diagonal field with entries $w_1,w_2,w_1+w_2$ has constant
   coefficient $w_1^2w_2+w_1w_2^2$. This is a nonzero symmetric
   coefficient although its value at every $\mathbb F_2$-valued
   direction is zero. Directionwise testing cannot replace its descent.
- `higgs_mixed_degree_boundary`: take $V=\operatorname{Spec}k\amalg\operatorname{Spec}k$
   over $\operatorname{Spec}k$, splitting ranks $1$
   and $2$, and inverse modules $k$ on both components. The original
   pushed module has rank $3$, and the pushed inverse module has rank
   $2$. There is no natural number $n$ with $3=2n$. With zero actions,
   the polynomials are $T^3$ and $T^2$, so the first cannot be the
   $n$-th power of the second. Componentwise splitting degrees do
   not imply a single-power formula on the base.

The last test is a statement about the omitted fixed-rank hypothesis,
not a claim that the invariant itself fails to exist. The invariant
still descends; what fails is the proposed single-exponent relation
to the original module's characteristic polynomial. The line test
similarly checks spectral-line invariance, rather than only the
easier base-line case.

This uses the transition line, finite-pushforward Morita,
spectral-line trivialization, pushed line invariance and overlap
targets of this layer; SA.2 sheaf Morita; SchemeAndStackFoundations,
SF.0 and SF.2, for finite pushforward and coefficient descent;
HodgeStructuresPartII, H.0, for the shared integrable Higgs carrier
and symmetric-action comparison; AlgebraicVectorBundles L0C for the
determinant laws used in the universal construction above; Mathlib's
`Matrix.det_blockDiagonal`. The source is EG, Theorem 2.17,
pp. 13–14, with coefficient descent and the uniform inverse-image
rank condition specified above.

### Examples

A rank-one scalar endomorphism $b$ gives $T-b$; at rank zero the
polynomial is $1$. The transition $Q=P\otimes L$ changes the inverse
module by $L^\vee$, fixing the direction of evaluation. In characteristic
two, $T$ and $T+\varepsilon$ have different linear coefficients but equal
squares. For the two-point finite cover with splitting ranks $1$ and $2$,
the zero-action original and inverse pushforwards have polynomials $T^3$
and $T^2$; no single integer power compares them. These calculations fix
the sign, zero-rank, descent and whole-inverse-image rank conventions.

### Dependencies

Use Layer 2's restriction-compatible Morita data, determinants and lines
from AlgebraicVectorBundles L0A–L0C, finite pushforward and descent
from SF.0–SF.2, and the Higgs/symmetric-action comparison of
HodgeStructuresPartII H.0. The semilocal line argument and the universal
coefficient determinant are established in this layer. The determinant
retains all coefficient directions, including over finite fields and
nonreduced bases.

## Layer 4: relative Cartier and Brauer comparison

This layer applies the previous module comparison to differential-operator
Azumaya algebras. The cohomological argument has two stages: construct
the boundary of the exact relative Cartier sequence, then establish
the relative vanishing needed to compare scaling with projection.
The categorical result additionally carries a specified splitting
bimodule. The class equality and the choice of an equivalence are
separate statements.

### 4.1 The precise Cartier input

For a smooth scheme $Y/S$ in characteristic $p>0$, let $Y'$ be its
relative Frobenius twist and $F:Y\to Y'$ the relative Frobenius. Use
the exact sequence of abelian étale sheaves

```math
0\longrightarrow\mathcal O_{Y'}^\times
 \longrightarrow F_*\mathcal O_Y^\times
 \xrightarrow{\mathrm{dlog}}F_*Z^1_{Y/S}
 \xrightarrow{\pi^*-C}\Omega^1_{Y'/S}
 \longrightarrow0.
```

Here $Z^1_{Y/S}$ is the sheaf of closed relative one-forms, and $C$
is the relative Cartier operator. The units are viewed additively
when invoking the abelian-sheaf homological API. The first map, the
closed-forms inclusion, and the Frobenius coefficient identifications
are part of the sequence; they cannot be inferred from a map only
between the two form sheaves.

For this relative Cartier application require the following five interfaces:

1. this exact sequence with its maps for the relevant smooth $Y/S$;
2. its full diagrams under the relative base changes and morphisms
   used in the application;
3. the differential-operator Azumaya algebra $D$ on the cotangent
   bundle, and the identification of its cohomological class with
   the boundary of the contact form;
4. for a specified $W_2$-lift, the actual splitting of $D$ on the
   $(p-1)$-st infinitesimal neighborhood of the zero section;
5. the differential-operator/contact-form comparison bimodules and
   their pullback and composition maps, for the categorical refinement.

**Missing prerequisite.** These five contracts have no specified supplying
roadmap and layer. The applications below are conditional on them;
generic sheaf cohomology and connection carriers do not construct them.

The generic crystalline-cohomology interfaces alone do not assert
these particular relative sequence and Azumaya statements. A
singular spectral scheme, even as a closed subscheme of a smooth
cotangent bundle, is not itself automatically a smooth $Y/S$ to
which the absolute Cartier sequence applies. An application there
must transport the appropriate diagram or work in an ambient
smooth relative scheme and prove the necessary restriction maps.

This uses the relative Frobenius, closed-form and Cartier
interfaces just specified; SchemeAndStackFoundations, SF.2, for
abelian étale sheaves, exactness, cohomology and connecting maps;
the shared scheme-Brauer interface for Azumaya classes.
The sources are OV, §4.2, equation (4.1.1), p. 85, and Proposition 4.2,
pp. 85–86; Theorem 2.8 and Corollary 2.9, pp. 33–34; Proposition 4.4,
pp. 87–88. EG, equation (A.3) in the proof of Proposition A.2,
pp. 40–41, gives the relative application.

### 4.2 The middle image and the two boundaries

Prove `cartierMiddleImage`. Exactness identifies the image of
$\mathrm{dlog}$ with the quotient sheaf

```math
J=(F_*\mathcal O_Y^\times)/\mathcal O_{Y'}^\times.
```

It provides the two short exact sequences

```math
0\longrightarrow\mathcal O_{Y'}^\times
 \longrightarrow F_*\mathcal O_Y^\times
 \longrightarrow J\longrightarrow0,
```

and

```math
0\longrightarrow J
 \longrightarrow F_*Z^1_{Y/S}
 \longrightarrow\Omega^1_{Y'/S}
 \longrightarrow0.
```

Construct the quotient/image identification with the actual maps.
The identification is a sheaf isomorphism respecting the two
factorizations, so subsequent naturality uses the same middle object.
No sheaf of formal symbols is substituted for the image of dlog.

Apply the long exact cohomology sequences. The second short exact
sequence gives

```math
\delta_0:H^0(Y',\Omega^1_{Y'/S})\longrightarrow H^1(Y',J),
```

and the first gives

```math
\delta_1:H^1(Y',J)\longrightarrow
 H^2(Y',\mathcal O_{Y'}^\times).
```

Their composite is the boundary $\Phi$. The order of composition
is fixed: first $\delta_0$, then $\delta_1$. A long exact sequence
for just the first or just the second short exact sequence would
not produce the required map from one-form sections to degree-two
units cohomology.

This uses the supplied exact relative Cartier sequence;
SchemeAndStackFoundations, SF.2, for sheaf images, cokernels,
short exact sequence comparisons and their long exact cohomology
maps. The source is OV, §4.2, equation (4.1.1) and the two short exact
sequences in the proof of Proposition 4.2, pp. 85–86.

### 4.3 Additivity and full-sequence naturality

Prove `cartierBoundaryAdditivity`: $\Phi$ is an additive homomorphism,
so for one-form sections in the stated relative setup,

```math
\Phi(\omega_1+\omega_2)=\Phi(\omega_1)+\Phi(\omega_2),
\qquad\Phi(0)=0.
```

This is the composite of two actual additive connecting maps. In
particular it also respects negatives and differences. When each
cohomological class in such a formula is represented by an Azumaya
algebra, the injective shared map `SchemeBrauer.delta` translates
the equality into multiplication of algebraic Brauer classes,
that is tensor product in multiplicative notation. It does not
identify the whole cohomology group with the algebraic Brauer
group.

Prove `cartierBoundaryNaturality`. A morphism of the full relative
Cartier sequences induces the middle-image map and two morphisms
of short exact sequences. The associated maps on cohomology
commute with each connecting homomorphism, and hence with $\Phi$.
State the conclusion with the actual induced map on units
cohomology and the actual induced map on relative one-form
sections. Both squares are needed to prove the composite square.

Keep the relative base in the notation. In the application with a
nonreduced parameter scheme, the required map is the one from a
relative diagram over that parameter scheme. A calculation on
its reduced fibre is not a substitute for a morphism of these
sequences, and absolute smoothness over the ground field cannot
be inferred for the nonreduced product.

This uses `cartierMiddleImage`; SchemeAndStackFoundations,
SF.2, for additive connecting maps and naturality under a morphism
of short exact sequences; the shared injective Azumaya-to-
cohomology homomorphism for the represented-class statement.
The sources are OV, §4.2, pp. 85–86; EG, the relative-base passage
in Proposition A.2, pp. 40–41.

### 4.4 The differential-operator Brauer comparison

Prove `cartierBrauerComparison` in the exact Cartier setup: the
class of the supplied differential-operator Azumaya algebra is

```math
\delta([D])=\Phi(\theta),
```

where $\theta$ is the contact one-form on the cotangent bundle,
with the appropriate relative coefficients. The comparison is
the supplied OV identification of the gerbe of splittings with
the gerbe of line bundles carrying integrable connections with
the specified $p$-curvature. The formal additivity of $\Phi$ does
not itself prove this identification.

Provide its naturality form only for maps carrying the complete
Cartier diagram described above. For a pullback used in SA.4's
application, the statement must identify the cohomological class
of the pulled-back Azumaya algebra with the boundary of the
pulled-back form in that actual diagram. Do not silently replace
the relative sequence by an absolute one on a singular spectral
thickening.

This uses the middle image, additivity and naturality
targets; SchemeAndStackFoundations, SF.2, and its shared
scheme-Brauer comparison; the differential-operator/contact-form
gerbe identification from the Cartier-transform input.
The sources are OV, Proposition 4.4, pp. 87–88, using Proposition 4.2,
pp. 85–86; EG, Proposition A.2 and equation (A.3), pp. 40–41.

### 4.5 The relative class-vanishing target

Let $k$ be a perfect field of characteristic $p>0$, and let $Z/k$
be smooth and projective with a specified lift to $W_2(k)$. Fix
an integrable connection $(E,\nabla)$ on $Z$ and its de Rham
Hitchin invariant

```math
a=\chi_{\mathrm{dR}}(E,\nabla).
```

The input assigning this parameter must descend the characteristic
coefficients of the actual $p$-curvature along Frobenius and supply its
finite spectral scheme with the corresponding function action. The
degree-one coefficient is retained unless a trace-free hypothesis is
imposed. EG, §2.5, equations (2.5)–(2.7), pp. 11–12, uses the
trace-free convention when omitting that coefficient; Remark A.1,
p. 40, identifies the parameter used in the relative application.
**Missing prerequisite.** HodgeStructuresPartII H.0 supplies connection
and Higgs carriers, but not this positive-characteristic de Rham Hitchin
and spectral construction. No supplying roadmap and layer for that
construction is specified here.

Let $Z'$ be the Frobenius twist and $V=Z'_a$ its finite spectral
scheme in $T^*Z'$. Set

```math
T=\operatorname{Spec}k[t]/(t-1)^p,
\qquad W=V\times_kT.
```

The map $m:W\to T^*Z'$ scales the cotangent coordinate by $t$;
the map $r:W\to T^*Z'$ is projection to $V$ followed by its
spectral inclusion. Both are over $Z'$, and both restrict to the
same spectral inclusion on the fibre $t=1$. Relative forms in
this calculation are over $T$.

Prove `relativeClassVanishingInput`, in the exact relative
Cartier comparison for these data:

```math
\Phi(m^*\theta-r^*\theta)=0
\quad\text{on }W.
```

Its meaning requires an explicit boundary map on the relevant restricted
étale sheaves on $W$, together with its comparison to pullback from a
smooth ambient relative scheme. The smooth $Y/S$ sequence of §4.1 alone
does not define this map on the possibly singular $W$.

This is a mathematical target to prove, not an extra axiom in
the definition of the input data. Its statement retains the
connection and the equality $a=\chi_{\mathrm{dR}}(E,\nabla)$.
An arbitrary spectral parameter does not satisfy the specified
hypotheses merely by being a point of a Hitchin base.

The proof must supply a valid relative argument. The difference
of the two forms vanishes on $t=1$, but that fact alone does not
imply that the form is supported on the zero section of the
cotangent bundle. For instance, in
$k[x,\xi,\varepsilon]/(\varepsilon^2)$ the relative form
$\varepsilon\xi\,dx$ vanishes when $\varepsilon=0$ and remains
nonzero after inverting $\xi$. Thus the asserted zero-section
support cannot follow merely from restriction to the reduced
parameter fibre.

The $W_2$-dependent splitting input from OV is a splitting on
the $(p-1)$-st infinitesimal neighborhood of the zero section.
An argument using it must exhibit a morphism factoring through
that neighborhood and identify its pulled-back Brauer class
with the difference above, or provide another justified relative
class calculation. Pulling the splitting to an arbitrary
spectral thickening without that factorization does not establish
the target. Also retain the full relative sequence diagrams
needed to compare the forms and the represented classes.

This uses `cartierBoundaryNaturality` and the
differential-operator Brauer comparison; the shared scheme-Brauer
pullback and injectivity interfaces; the connection carrier of
HodgeStructuresPartII H.0 and the additional de Rham Hitchin/spectral
input just stated; the exact
relative Cartier input and the specified OV bounded splitting.
The sources are EG, Proposition A.2 and its proof, pp. 40–41, for
the target and hypotheses; OV, Corollary 2.9, p. 34, for the
scope of the splitting. The relative vanishing requires the
explicit argument just described rather than the fibre-support
inference.

### 4.6 Equality of the relative algebraic Brauer classes

For precisely the data in the preceding target, prove
`relativeBrauerEquality`:

```math
[m^*D]=[r^*D]\quad\text{in }\operatorname{Br}_{\mathrm{Az}}(W).
```

Use the relative comparison to identify the two images under
$\delta$ with $\Phi(m^*\theta)$ and $\Phi(r^*\theta)$.
Additivity gives their difference as
$\Phi(m^*\theta-r^*\theta)$, the preceding target makes it
zero, and injectivity of $\delta$ gives the equality of algebraic
Brauer classes. All occurrences of $D$, its pullbacks and the
one-form boundary use the same coefficient identifications.

The equality is a statement on the nonreduced scheme $W$, not
only on the fibre $V$. It also does not by itself choose an
equivalence between the categories of modules over its two
algebras. Such a choice is the next target and carries additional
evaluation and restriction data.

This uses `cartierBrauerComparison`,
`cartierBoundaryAdditivity`, `relativeClassVanishingInput`, and
the shared injective scheme-Brauer map. SA.2 supplies the
geometric module-category comparison used for the categorical
version. The source is EG, Proposition A.2, pp. 40–41.

### 4.7 Chosen relative Morita refinement

For the same $W_2$-lift, connection and relative spectral scheme,
and an actual compatible splitting of

```math
m^*D\otimes(r^*D)^{\mathrm{op}},
```

construct `relativeMoritaRefinement`: an
$\mathcal O_W$-linear equivalence

```math
\mathsf{QCoh}_{m^*D}(W)\simeq
\mathsf{QCoh}_{r^*D}(W)
```

with its specified splitting bimodule, evaluation, unit and
counit. The splitting must be the one transported through the
relative comparison from the chosen lift-dependent input,
including the supplied contact-form comparison bimodules. The
form of equivalence in BB §2.2 is a splitting of the tensor
product with the opposite algebra; it is not an arbitrary
equivalence of abstract categories.

Retain the comparison with the identity on the fibre $t=1$,
where the two pullbacks of $D$ agree, and verify its compatibility
with evaluation. Also verify composition coherence of the
chosen comparison bimodules. These maps are needed to transport
an existing connection/module while controlling its restriction
to the original fibre. An existential splitting or bare
Brauer-class equality is insufficient to select them.

The modules and their automorphisms retain their usual
categories. For example, multiplication by $1$ and by $2$ on
a one-dimensional module over $\mathbb F_3$ gives two distinct
automorphisms. Consequently no assertion that all splitting
modules are unique up to a unique isomorphism is used to
construct the refinement. The chosen unit, counit and
evaluation determine the required comparisons instead.

This uses the relative class-vanishing target and its
represented-class comparison; SA.2 sheaf Morita and its coherent
evaluation data; SchemeAndStackFoundations, SF.2, for the
shared scheme-Brauer splitting/module-category interface; the
chosen OV splitting and the BB contact-form and pullback
comparison bimodules from the Cartier-transform input.
The sources are EG, Remark A.3, p. 41; OV, Theorem 2.8 and
Corollary 2.9, pp. 33–34; BB, §2.2, p. 3, and Proposition 3.11
and Corollary 3.12, p. 11, with the rank and composition
conventions recorded above.

### Examples

The boundary of zero is zero and the boundary of a difference is the
difference of the boundaries. On $t=1$ the scaling and projection maps
agree, but agreement on that fibre alone does not imply equality on $W$:
$\varepsilon\xi\,dx$ remains nonzero after inverting $\xi$. The candidate
difference map $(v,t)\mapsto(t-1)v$ sends a product of $p$ fibre-coordinate
functions to a multiple of $(t-1)^p=0$, so factors through the zero-section
neighborhood defined by $I^p$. To use this factorization one must still
prove the full relative-sequence comparison identifying its Brauer pullback
with the stated difference; factorization alone does not do so.
A one-dimensional splitting object over $\mathbb F_3$ has distinct scalar
automorphisms $1$ and $2$, so its coherence is specified by chosen maps.

### Dependencies

This layer uses the five relative Cartier contracts of §4.1, the two
connecting-map sequences and their actual naturality, SF.2's injective
Azumaya comparison, and Layer 2's Morita unit, counit and evaluation. The
connection carrier comes from HodgeStructuresPartII H.0; the de Rham
Hitchin/spectral input and its owner remain as specified in §4.5.
The vanishing and chosen equivalence retain the specified $W_2$-lift.

## Downstream consumers

The field arithmetic supports period-index and splitting-degree arguments.
The sheaf support and characteristic interfaces support finite spectral
modules and the characteristic-$p$ connection application of EG.

## Suggested library homes

The reusable field arithmetic belongs under
`TauCeti/Algebra/BrauerGroup/PeriodIndex.lean`, next to the existing
base-change and division-representative modules. Restriction/corestriction
adapters belong next to that field Brauer theory and consume the
continuous-cohomology modules without copying them. Keep the algebra
index in its existing central-simple-algebra module.

The scheme applications belong under
`TauCeti/AlgebraicGeometry/Azumaya/Morita.lean` and
`TauCeti/AlgebraicGeometry/Azumaya/CharacteristicPolynomial.lean`,
using the shared scheme Azumaya carrier. The finite spectral Higgs
invariant consumes the shared Higgs carrier and constructs its coefficients
using the shared determinant operation. Its line-trivialization helper
proves the semilocal rank-one substep and uses finite-presentation descent,
without creating a second theory of invertible sheaves.

The Cartier boundary application belongs with the characteristic-$p$
differential-operator and Cartier-transform modules. Its generic
homological operations remain the étale sheaf-cohomology API, and
its sheaf Morita operations remain the preceding geometric layers.
Keep the chosen lift-dependent splitting and bimodule comparisons
visible in the theorem inputs and results.

## References

The locators below refer to the indicated versions and printed page numbers.
The roadmap statements use these works for the mathematics; auxiliary
arguments and strengthened hypotheses are specified at the targets where
they are needed.

- **GS:** Philippe Gille and Tamás Szamuely, *Central Simple Algebras and
  Galois Cohomology*, Cambridge Studies in Advanced Mathematics 101 $2006$,
  [institutional copy](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf).
  The arithmetic targets use §4.5, pp. 100–106; the continuous transfer formula
  also uses Proposition 4.2.10, pp. 88–89, and the Brauer comparison uses
  §4.4, pp. 95–99.
- **GS errata:** Tamás Szamuely, [author errata dated 4 December
  2020](https://pagine.dm.unipi.it/tamas/erratams.pdf), p. 3. The correction to
  the proof on book p. 101 is used in the separable index-degree argument.
- **Benoist:** Olivier Benoist, [*The period-index problem for real
  surfaces*](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf),
  Publications Mathématiques de l'IHÉS 130 $2019$, pp. 63–110; §0.1, p. 63,
  for the general period and index conventions. No surface theorem is a
  target of this roadmap.
- **EG:** Hélène Esnault and Michael Groechenig, [*Rigid connections and
  F-isocrystals*, arXiv:1707.00752v4](https://arxiv.org/pdf/1707.00752v4),
  1 June 2020. Theorem 2.17 and Remark 2.18, pp. 13–14, motivate the support
  and characteristic-coefficient interface. Proposition A.2 and Remark A.3,
  pp. 40–41, supply the relative comparison target.
- **OV:** Arthur Ogus and Vadim Vologodsky, [*Nonabelian Hodge theory in
  characteristic p*](https://www.numdam.org/item/10.1007/s10240-007-0010-z.pdf),
  Publications Mathématiques de l'IHÉS 106 $2007$, pp. 1–138. Use Theorem 2.8
  and Corollary 2.9, pp. 33–34, and §4.2, equation (4.1.1) and
  Proposition 4.2, pp. 85–86, and Proposition 4.4, pp. 87–88.
- **BB:** Roman Bezrukavnikov and Alexander Braverman, [*Geometric Langlands
  correspondence for D-modules in prime characteristic: the GL$n$ case*,
  arXiv:math/0602255v2](https://arxiv.org/pdf/math/0602255v2), 4 December
  2006. Use §2.2, p. 3, and Proposition 3.11 and Corollary 3.12, p. 11.
  These citations refer specifically to this preprint version.

For the $W_2$-dependent categorical comparison, fix the actual splitting
and its evaluation data. A category of splitting modules can have nontrivial
automorphisms; a bare uniqueness assertion cannot choose its coherence maps.
In BB Proposition 3.11 the differential-operator algebra on a smooth
$d$-dimensional base has rank $p^{2d}$, and the contact-form section is
the composite $\eta\circ\delta$, where $\delta$ is the diagonal into the
fibre product and $\eta$ embeds that fibre product into the larger cotangent
bundle. These dimensions and arrow directions fix the intended comparison.
