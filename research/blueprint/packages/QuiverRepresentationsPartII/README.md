# Roadmap: quiver representations, path algebras, and Gabriel’s theorem, part II: multisegment duality

**Summary.** Build the duality of finite integral multisegments from generic opposite-degree commuting operators on complex graded spaces. Identify adjacent generic ranks with a weighted inclusion-chain deficit, realize ramified truncation on an actual operator image, and prove its additivity for the canonical maximal split. The final comparison identifies this geometric dual with the Zelevinsky involution on an unramified cuspidal line; the resulting combinatorics supplies the general-linear newform arguments of Atobe–Kondo–Yasuda.

## Scope and ownership

This is the integer-grading and commuting-operator continuation of [QuiverRepresentations](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/QuiverRepresentations). It owns occurrence-sensitive interval operations, the finite-window graded adapter, opposite-degree centralizers, generic duality, admissible images, the adjacent Knight–Zelevinsky formula, and the canonical ramified split. The parent owns path algebras and their representation equivalence (Layer 1), Krull–Schmidt (Layer 2), and finite type-A interval classification as part of Gabriel’s theorem (Layer 5). Those results are suppliers, with the exact uses specified below.

[SmoothRepresentationsOfLocalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups), SR.5.3, owns smooth GLₙ representations, normalized induction, segment and multisegment representations, highest derivatives, and the general representation involution. Only the adapter from an arbitrary unramified character to its unitary-line convention and the identification of its representation labels with this geometric dual belong here. EndoscopicTransferAndUnitaryTraceComparison can consume that identification; it supplies no geometric input to this build.

General Aubert duality, local Langlands, conductor tuples, and the unipotent newform induction remain with their existing owners. The rank theorem here concerns adjacent degrees only. The full Knight–Zelevinsky formula for higher powers, Fourier transforms, canonical bases, and variants over finite fields are outside the scope.

General homogeneity belongs to Tau Ceti’s `TauCeti.LinearMap.IsHomogeneous` and `TauCeti.LinearMap.homogeneousSubmodule`, in `TauCeti/LinearAlgebra/Graded/LinearMap`. The coordinate abbreviation `Homogeneous` specializes that predicate to `Space.grade`; no general degree calculus is built here. Current Tau Ceti’s `Module.End.exists_pow_apply_eq_zero_of_forall_mem_support_lt`, in `TauCeti/LinearAlgebra/End/LocallyNilpotent`, supplies pointwise local nilpotence for a map strictly lowering a well-founded basis weight. The finite-support pair target here requires a single exponent killing the whole map, in both directions, rather than another local nilpotence theorem.

For geometric foundations, reuse the algebraic-group and scheme APIs rather than introduce a second general theory. In particular, current Tau Ceti’s `TauCeti.isLocallyClosed_orbit_of_isConstructible`, in `TauCeti/Topology/Algebra/MulAction/Orbit`, supplies local closedness for a constructible orbit in a Noetherian space acted on by homeomorphisms. Its hypothesis still requires a constructibility proof for the graded conjugation action. The Hopf-ideal conormal API concerns closed subgroups at the identity; it is distinct from the orbit conormal bundle needed here. The scoped orbit, incidence, dimension, and fibre comparisons in §2.7 specify the additional geometric interface.

[AlgebraicVectorBundles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/AlgebraicVectorBundles), L0 and L2B, owns finite locally free sheaves, their rank, geometric total spaces, and the equivalence between the sheaf and geometric bundle presentations. Consume `FiniteLocallyFreeSheaf`, `rank`, `totalSpaceScheme`, `totalSpaceEquiv`, and `totalSpaceHomEquiv`: the last identifies a total-space point over a test scheme with a section of the pulled-back sheaf. The conormal target here identifies the tangent-annihilator family of this specific orbit action with such a bundle; it does not construct a second general bundle category. The orbit smoothness, dimension and projection comparisons remain scoped targets here, since the bundle equivalence does not assert them.

For finite posets, follow the chain-cover interface of [Mathlib PR #40741](https://github.com/leanprover-community/mathlib4/pull/40741): `IsChain`, `IsAntichain`, an antichain bound for every chain cover, and a disjoint chain partition attaining that bound. Where this interface is absent from the pinned library, establish the required finite statements with that vocabulary. The targets here specialize it to occurrence labels and then compare chain partitions with split-graph matchings and weighted interval chains.

## Conventions

An interval `[b,e]` has integer endpoints with `b ≤ e`, includes both endpoints, and has length `e-b+1`. Empty intervals are represented by absence, never by a reversed pair of endpoints. A multisegment is a finite **multiset** of intervals. Its cardinality counts interval occurrences; its total length counts basis vectors. All block and poset indices distinguish repeated occurrences.

All operator geometry is over ℂ. Spaces are finite dimensional, with a finite-support ℤ-grading. A VN operator `N` raises degree by one; a WL operator `L` lowers it by one. A graded isomorphism preserves every degree and intertwines the operators. For shifts use

```text
V(c)ₐ = Vₐ₋c.
```

Consequently the VN image of `[b,e]` has unshifted type `[b+1,e]`, while its shift by −1 has type `[b,e-1]`. The WL image has unshifted type `[b,e-1]`. In each case a singleton has zero image. On `[0,1]`, `N(v₀)=v₁` and `L(v₁)=v₀`; this fixes the direction independently of any diagram conventions. The concrete `upArrow` in Suggested.lean is the matrix E₂₁ on these two coordinates.

Genericity always uses the polynomial Zariski topology on complex points: polynomial nonvanishing sets generate the topology. This topology is transported through finite complex bases, and must be distinguished from the usual topology on ℂ. A zero-dimensional vector space is a one-point affine space, with a nonempty dense open whole space.

The commuting equation is `NL = LN`. The trace pairing identifies degree −1 maps with the linear dual of degree +1 maps. For `N=E₂₁` and `L=E₁₂` in the degrees 0 and 1, `NL-LN=diag(-1,1)`; pairing with the degree-zero matrix `diag(1,0)` gives −1. Thus these two arrows do not commute, and the tangent-annihilator condition detects the commutator with the stated sign.

In the representation comparison only, `F/ℚₚ` is finite, `q` is its residue cardinality, `|ϖ|=q⁻¹`, and `χ:F×→ℂ×` is unramified. Induction is normalized by the positive complex square root of the parabolic modulus. `Z` uses the irreducible-subrepresentation convention, while `L` uses the Langlands quotient convention. The empty multisegment corresponds to the one-dimensional trivial representation of GL₀. On a singleton the two conventions agree. For the line of the trivial character, `Z([0,1])` is the determinant character `|det|¹ᐟ²`, while `L([0,1])` is its Steinberg counterpart; `L([0,0]+[1,1]) = Z([0,1])`. These two-term cases fix the convention for the comparison.

Short declaration names below refer to the intended `TauCeti.MultisegmentDuality` API. Representative signatures in `Suggested.lean` lie in `TauCetiRoadmap.QuiverRepresentationsPartII`; the README also specifies targets whose constructions require the later mathematical API.

## Exact supplier contracts

### From Mathlib

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The following contracts are used in their linear specializations over ℂ.

- `DirectSum.IsInternal` (`Mathlib/Algebra/DirectSum/Basic`): the canonical map from the external direct sum of an additive family of submodules is bijective. Use it to express the grading, not merely pairwise disjointness of the grades.
- `LinearMap.range` (`Mathlib/Algebra/Module/Submodule/Range`): the range submodule has exactly the set-theoretic image of the linear map. An image pair must use this carrier, or a linear model with an injective embedding onto it.
- `Submodule.map` (`Mathlib/Algebra/Module/Submodule/Map`): push a submodule through a linear map by its actual image. This supplies grade intersections and transport of restricted operators.
- `Module.finBasis` (`Mathlib/LinearAlgebra/Dimension/Free`): a finite free module has a basis indexed by `Fin (Module.finrank ℂ V)`. Complex finite-dimensional spaces satisfy the free-module hypothesis.
- `Module.Basis.ofVectorSpace` (`Mathlib/LinearAlgebra/Basis/VectorSpace`): choose a basis of a vector space over a division ring. Combine this with finite-dimensionality when coordinates must be finite.
- `Matrix.rank` (`Mathlib/LinearAlgebra/Matrix/Rank`): rank is the finrank of the range of `mulVecLin`. All matrices here have finite row and column sets and complex coefficients; minor computations must agree with this rank.
- `MvPolynomial.eval` (`Mathlib/Algebra/MvPolynomial/Eval`): evaluation is a ring homomorphism. It defines polynomial zero and nonvanishing loci and turns products of minors into simultaneous conditions.
- `TopologicalSpace.generateFrom` (`Mathlib/Topology/Order`): form the topology generated by the prescribed polynomial nonvanishing sets. No ambient Euclidean instance is substituted.
- `IsIrreducible` (`Mathlib/Topology/Irreducible`): the set is nonempty and preirreducible. This is sufficient for intersections of nonempty open sets after the topology has been supplied; it supplies neither algebraic dimension nor an orbit conormal construction.

### From Tau Ceti and its quiver roadmap

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `TauCeti.QuiverRep`, in `TauCeti/RepresentationTheory/Quiver/Representation/Basic`, is the functor category `CategoryTheory.Paths Q ⥤ ModuleCat k`. Restrict an integer-graded operator to a finite support window and assign its degree-a space to vertex a. Arrows act in the increasing direction for VN and the decreasing direction for WL.

At the same pin, `TauCeti.LinearMap.IsHomogeneous` supplies the degree condition, and `isHomogeneous_def` identifies it with the explicit condition on all homogeneous vectors. Its zero, addition, scalar, and composition API supplies the corresponding closure facts. `homogeneousSubmodule` gives the fixed-degree submodule; the opposite centralizer additionally imposes commutation. This declaration is used directly in the representative signatures.

The parent roadmap’s Layer 1, `quiverRepEquivalence`, identifies these representations with **left** path-algebra modules, with later arrows multiplying on the left. The adapter must extend by zero outside a finite window, compare different windows by restriction and extension, and preserve graded morphisms and their intertwining equations. No window choice may change an interval label.

From Layer 2 consume `exists_indecomposable_decomposition` and `krullSchmidt_unique`: finite-length modules split into finitely many indecomposable summands, and two such decompositions are matched by isomorphisms. Distinct isomorphic submodules may occur, so multiplicities survive the passage to the multiset of isomorphism classes.

Current Tau Ceti also supplies these interfaces directly. `TauCeti.quiverRepEquivalence`, in `TauCeti/RepresentationTheory/Quiver/Representation/AsModule`, applies to a finite vertex quiver over a field. In `TauCeti/RepresentationTheory/Quiver/Representation/KrullSchmidt`, `TauCeti.QuiverRep.exists_indecomposable_iso_biproduct` decomposes a pointwise finite-dimensional representation of a finite quiver into a finite family indexed by `Fin n`; `exists_equiv_iso_of_iso_biproduct` matches two such indecomposable families by an index equivalence; `card_iso_eq_card_iso_of_iso_biproduct` preserves each isomorphism-class multiplicity. A finite support window satisfies the finite-vertex and pointwise finite-dimensional hypotheses. Use these declarations when consuming the parent contracts.

From Layer 5 consume the type-A specialization of the indecomposable/positive-root bijection: on an equioriented finite path, the indecomposables are exactly the one-dimensional interval blocks, with identity arrows inside their support. Reversing orientation gives the same interval supports. The graded adapter in Layer 1 below combines these supplier results; it does not prove a second Gabriel theorem.

The current Tau Ceti orbit declaration specified under Scope and ownership is an additional implementation supplier beyond this baseline. Apply it only after establishing its Noetherian-space, translation-continuity, and constructibility hypotheses; do not treat its presence as the dimension and projection theorem of §2.7.

### From the smooth-representation roadmap

Consume SmoothRepresentationsOfLocalGroups SR.0–SR.3 for the actual smooth admissible representation category, GLₙ(F), normalized parabolic induction, and its equivariant morphisms. Consume SR.5.3, target *highest-derivative-adapter*, for the characteristic-zero segment and multisegment carrier, normalized `Z` subrepresentations, `L` quotients, the involution sending `Z(m)` to `L(m)`, and the GL₀ unit. These are roadmap contracts; no baseline-ready representation-valued function is presumed.

More explicitly, a supplier segment records a positive-rank unitary supercuspidal representation and real endpoints differing by a nonnegative integer. Its support is the sequence of real norm twists. Ordered normalized products characterize the `Z` and `L` irreducibles; isomorphism classes depend on the unordered multisegment. Common real translation tensors with `|det|ᶜ`, and normalized induction respects that tensoring. The involution has square the identity, fixes cuspidal singletons, and commutes with a common unramified character twist. Its general construction and classification stay with that supplier. The local adapter and the geometric-label comparison are §5.4 targets, with their proof inputs stated there.

## How to read the build

Layer 0 fixes finite interval combinatorics and one-copy maximal peeling. Layer 1 turns it into finite-support graded operators, with actual images and a reconstruction theorem. Layer 2 supplies commuting coordinates, genericity, and the conormal symmetry establishing duality. Layer 3 makes genericity compatible with images and defines ramified truncation. Layer 4 independently computes adjacent generic ranks by matching and weighted chains. Layer 5 combines reconstruction with those ranks to prove the canonical split, then supplies the representation adapter and the newform example. Layers 3 and 4 meet in the split proof; the representation comparison is unnecessary for the elementary interval identity.

## Layer 0: integer multisegments and maximal peeling

### 0.1 Integral intervals

Define `Interval` by two integers `left` and `right` and a proof `left ≤ right`. Define `Interval.contains [b,e] a` by `b ≤ a ≤ e`, `Interval.included [b,e] [c,d]` by `c ≤ b` and `e ≤ d`, and `Interval.length` by the natural number associated to `e-b+1`. `intSeg b k` denotes `[b,b+k]` for `k:ℕ`. Translation `Interval.shift s c` adds c to both endpoints. `Interval.shorten` returns `[b,e-1]` when `b<e` and `none` for a singleton (AKY §2.1, p.7; §2.3, p.8; §3.1, pp.14–15).

The API includes `Interval.ext_ends`, identifying intervals with equal endpoints; `Interval.contains_shift`, asserting `(s.shift c).contains (a+c) ↔ s.contains a`; `Interval.shorten_singleton`; and `Interval.length_positive`. Inclusion is reflexive and transitive, with antisymmetry supplied by endpoint extensionality. All shortening calls retain their endpoint-order proof.

**Checks.**

- The right endpoint 2 belongs to `[0,2]`; 3 does not. A half-open carrier fails this check.
- `[3,3]` shortens to `none`, while `[3,4]` shortens to `[3,3]`. This distinguishes deletion from keeping an empty interval.
- Translating `[2,4]` by −1 gives `[1,3]`, and preserves its length 3. The opposite shift sign fails.

*Needs:* integer arithmetic and finite interval supports; the supplier’s interval blocks give the interpretation used in Layer 1.

### 0.2 Multisegments and right truncation

Define `Multisegment := Multiset Interval`. For m, `degreeDimension m a` counts its occurrences containing a, and `totalLength m` sums their positive lengths. Define `rightTruncate` by binding each occurrence to its optional shortening; `shiftMultisegment` maps translation over all occurrences. Choose `occurrenceInterval m : Fin m.card → Interval` with the multiset of values equal to m. Subsequent coordinates use this single occurrence model; changing its order gives a permutation, not fewer copies (AKY §2.3, p.8; §3.1, p.15).

Prove `rightTruncate_add`, `rightTruncate_shift`, and `degreeDimension_add`. `occurrence_count` says that the number of labels with value s is `m.count s`. Also prove that total length is the sum of all degree dimensions, and that right truncation strictly decreases total length for nonempty m: its decrease is exactly `m.card`. These facts supply the induction measure and the matrix dimensions used later.

**Checks.**

- Truncating `2[1,2]` gives `2[1,1]`. Converting to a set loses one copy.
- Truncating `[0,0]+[1,3]` gives `[1,2]`, with no contribution from the singleton.
- `[0,2]+[1,1]` has degree-1 dimension 2, total length 4, and two occurrence labels. Cardinality and total length are different.

*Needs:* §0.1, `Multiset` map, filter, bind, count, and finite sums.

### 0.3 Canonical maximal decomposition

Define `maximalPart m` to contain **one** copy of each distinct interval in m that is maximal for inclusion. Define `remainder m` by multiset subtraction. Thus repeated maximal intervals contribute one copy to the maximal part and leave their other copies in the remainder. This differs from retaining every maximal occurrence (AKY §2.4, p.10, definition immediately before Proposition 2.7).

Prove `maximalPart_count`: its value at s is 1 exactly when s occurs in m and every interval of m containing s equals s; otherwise it is 0. Prove `maximalPart_add_remainder`, and `maximalPart_incomparable`: two members of the maximal part comparable by inclusion are equal. Finite support guarantees that every interval of m is contained in an inclusion-maximal one.

**Checks.**

- `maximalPart (2[0,2]) = [0,2]`, leaving one copy in the remainder.
- The remainder of `[0,2]+[1,1]` is `[1,1]`; containment is decisive even though its endpoints differ.
- Both `[0,0]` and `[2,2]` belong to the maximal part of their sum. The empty multisegment has empty maximal part and remainder.

*Needs:* §0.2, distinct finite support, inclusion from §0.1, and multiset subtraction.

### Examples

For `m=[0,0]+2[1,2]+[2,2]`, the maximal part is `[0,0]+[1,2]` and the remainder is `[1,2]+[2,2]`. After truncation m becomes `[1,1]+[1,1]`, whose maximal part is one `[1,1]`; the other copy remains. This example fixes both multiplicity and the deletion convention before the split theorem (AKY §2.4, p.10; Lemma 3.6, p.19).

### Dependencies

Finite multisets and integer arithmetic from Mathlib. The interpretation by finite type-A blocks uses the parent contracts under Exact supplier contracts.

## Layer 1: graded operators, shifts, and actual images

### 1.1 Finite graded complex spaces

Define a finite-support graded `Space` as `V=⊕ₐ Vₐ` with finite total complex dimension. A coordinate presentation consists of `n:ℕ` and `degree:Fin n→ℤ`, with carrier `Fin n→ℂ`; `Space.grade a` is the submodule of coordinate vectors vanishing outside the basis indices of degree a. `Space.dimension a` is its complex finrank. Every abstract finite-dimensional grading has such a presentation by choosing a basis in each nonzero grade (AKY §3.1, p.14).

Prove `Space.internal` for the grade submodules, `Space.finite_support`, and `Space.dimension_card`, equating finrank with the number of coordinates of that degree. `constantSpace n a` puts all n coordinates in grade a. The coordinate model permits arbitrary grade multiplicities; it does not assume one-dimensional grades.

**Checks.**

- `constantSpace 2 3` has degree-3 dimension 2.
- The same space has degree-4 dimension 0; its grade-4 submodule is bottom.
- For `constantSpace 0 0`, even the grade-0 submodule is bottom, and the internal direct sum is the zero space.

*Needs:* `DirectSum.IsInternal`, `Module.finBasis`, and finite-dimensional submodules.

### 1.2 VN and WL pairs

Define `Direction` with just `up` and `down`, whose steps are +1 and −1. A `Pair S d` bundles an endomorphism with `Homogeneous S T d.step`, meaning `T(Vₐ) ⊆ Vₐ₊ε`. Write `VN S` and `WL S` for the two cases. A `PairIso P Q` is a complex linear equivalence preserving grades in both directions and satisfying `e(Tv)=T'(ev)`; `Pair.Isomorphic` means such an equivalence exists. `zeroPair` has the zero operator in either direction (AKY §3.1, pp.14–15).

Prove `Pair.nilpotent` with the uniform conclusion `∃ k:ℕ, T^k=0`, since repeated applications leave the finite support window; this strengthens a pointwise exponent to one exponent for the entire finite-dimensional map. Prove `Pair.isomorphic_refl` and `Pair.isomorphic_trans`. The graded condition is part of isomorphism even when both operators vanish. Reflection of degrees by `a↦-a` interchanges VN and WL and sends `[b,e]` to `[-e,-b]`.

**Checks.**

- The standard VN arrow on `[0,1]` is nonzero and sends the degree-0 basis vector to the degree-1 vector.
- Zero VN singletons supported at 0 and 1 are not graded-isomorphic, although their ungraded vector spaces agree.
- The nonzero VN arrow on `[0,1]` is not homogeneous of degree −1. The zero operator is homogeneous in both directions, so it cannot serve as this negative control.

*Needs:* §1.1 and the finite-window representation adapter specified in the parent supplier contract.

### 1.3 Standard interval pairs

Construct `standardSpace m` with basis indexed by valid pairs `(occ,a)`, where occ is an occurrence label and a belongs to its interval. Define `standardVector m occ a` to be that basis vector when valid and zero otherwise. `standardPair m up` advances within each block and kills its last vector; `standardPair m down` retreats within each block and kills its first vector. Define `pairType P` through the unique interval multiset of the supplier decomposition (AKY §3.1, p.15).

Require `standardSpace_dimension` and `standardSpace_n`, respectively identifying its degree dimensions and total dimension with §0.2. `pairType_standardPair` recovers m in either direction. `standardPair_apply_up` and `standardPair_apply_down` give the stated arrow formulas on every standard vector. `standardVector_ne_zero_iff` detects membership in the occurrence interval, `standardVector_eq_basis` identifies a valid vector with `standardBasis`, and `standardVector_mem_grade` also covers invalid labels whose vectors are zero. These equations fix the basis used for every subsequent centralizer block.

**Checks.**

- The block `[0,2]` has total dimension 3.
- `2[0,1]` has degree-0 dimension 2, with two different occurrence basis vectors.
- The WL singleton `[2,2]` has zero operator and type `[2,2]`; reversing arrows does not translate the support.

*Needs:* §§0.2, 1.2 and the parent’s Krull–Schmidt and type-A interval contracts.

### 1.4 Finite-window interval comparison

For two pairs in the **same direction**, prove `pair_classification`: they are graded-isomorphic if and only if their `pairType` multisets agree. Prove `pairType_dimension`: the count of intervals containing a equals the dimension of the grade-a subspace. This is the finite-support integer-grading adapter to the parent classification, including extension by zero, independence of the chosen window, and reversed orientation (AKY §3.1, p.15).

For increasing operators let `R(i,j)` be the rank of `N^(j-i):Vᵢ→Vⱼ` for `i≤j`, with `R(i,i)=dim Vᵢ` and zero outside a support window. In the standard decomposition it counts all intervals containing `[i,j]`; hence the multiplicity of `[i,j]` is

```text
R(i,j) - R(i-1,j) - R(i,j+1) + R(i-1,j+1).
```

Use integer differences before identifying the nonnegative multiplicity. The analogous WL ranks run from `Vⱼ` to `Vᵢ`. This rank description also proves that a finite path-rank table determines the type.

*Needs:* §1.3 and the three parent supplier contracts. The rank table uses Mathlib `Matrix.rank` after homogeneous bases are chosen.

### 1.5 Shifts and image pairs

Construct `shiftSpace S c` and `shiftPair P c` using the standing shift convention. Construct `imagePair P` on the **actual** range of T, with grades `range T ∩ Vₐ` and operator the restriction of T. A coordinate `ImageModel P` carries a space, its pair, and an injective linear `embed` whose range is `LinearMap.range T`; its image of each grade is exactly `range T ∩ Vₐ`, and it intertwines the operators. Iterating this construction gives `iteratedImage P k`, embedded onto `range (T^k)`. A multisegment label alone is insufficient to supply an image model (AKY §3.1, pp.15–16; Lemma 3.3, p.16).

Prove `pairType_shift`, translating both endpoints by c. For VN prove `pairType_image_up`, with type of `imagePair P` shifted by −1 equal to `rightTruncate (pairType P)`. For WL prove `pairType_image_down`, with the same truncation equality **without** shifting. Images of singletons are zero, and these statements include the empty pair.

**Checks.**

- The unshifted VN image of `[0,2]` is `[1,2]`, with zero degree-0 dimension.
- Shifting that image by −1 gives `[0,1]`, with degree-0 dimension 1.
- The unshifted WL image of `[0,2]` is `[0,1]`. Its degree-2 subspace is zero, and the singleton image in either direction is zero.

*Needs:* §1.4, `LinearMap.range`, and `Submodule.map`.

### 1.6 Reconstruction from a VN image

Prove `reconstruct_from_image`: if two VN pairs have equal dimensions in every grade and their **unshifted** image pairs are graded-isomorphic, then the original pairs are graded-isomorphic (AKY Lemma 3.1, pp.14–15).

The image ranks determine `R(i,j)` for `i<j`: the grade-`i+1` component of the image is `N(Vᵢ)`, and the relevant restricted power is `N^(j-i-1)` from that component to grade j. The given dimensions determine the diagonal ranks. Apply the multiplicity differences of §1.4 and classification. This formulation avoids choosing incompatible preimage lifts. Equality of ungraded total dimensions alone would not recover singleton positions.

*Needs:* §§1.4–1.5.

### Examples

The pair for `[0,2]+[1,1]` has dimensions `(1,2,1)` in degrees `(0,1,2)`. Its unshifted VN image has type `[1,2]`. The diagonal dimensions distinguish it from `[0,2]`, whose image is the same. Conversely the rank table is `R(0,1)=R(1,2)=R(0,2)=1`, and its finite differences recover exactly one `[0,2]` and one `[1,1]` (AKY Lemma 3.1, pp.14–15).

### Dependencies

Layer 0, finite-dimensional linear algebra, actual ranges, and the parent representation, Krull–Schmidt, and type-A classification contracts.

## Layer 2: centralizers and generic multisegment duality

### 2.1 Opposite-degree centralizers

For a pair `P=(V,T)` of direction ε, define `centralizer P` as the complex submodule of endomorphisms S that have degree −ε and satisfy `ST=TS`. Define `oppositePair P S` using that same S on the same grading. Commutativity preserves the actual range of T, so define the linear map `restrictCentralizer P` by restriction, transported through the chosen image embedding (AKY §3.1, pp.15–16).

Require `oppositePair_operator`, identifying its operator with S; `centralizer_commute`, giving the equation in the endomorphism algebra; and `restrictCentralizer_embed`, saying `embed (S_restricted v)=S(embed v)`. Conjugation by a graded intertwining isomorphism gives a linear equivalence of these submodules. Thus image restriction and centralizer coordinates cannot depend on an arbitrary basis choice.

**Checks.**

- The zero map is in the opposite centralizer of every zero VN pair, including the zero space.
- The opposite-degree centralizer of the single VN chain `[0,2]` is zero: a descending nonzero arrow would violate commutativity at a boundary.
- The VN pair `[0,0]+[1,1]` has a one-dimensional opposite centralizer, consisting of the arbitrary scalar map from degree 1 to degree 0. Ordinary full endomorphism centralizers give the wrong dimension.

*Needs:* §1.5 and linear submodules of the endomorphism space.

### 2.2 Commuting block coordinates

Prove `centralizer_coordinates` for the standard VN pair of any m. For a source interval `[t,u]` and target interval `[s,v]`, a degree −1 commuting block has one free complex scalar exactly when

```text
s < t ≤ v+1 ≤ u.
```

Write `Precedes target source` for these inequalities. In an allowed block that scalar multiplies the target vector of degree `a-1` whenever it exists; vectors outside the target interval are zero. Every allowed **ordered occurrence pair** has its own independent scalar, even if its endpoints agree with another pair. The resulting coefficient map is a linear equivalence between the centralizer and the complex function space on all allowed occurrence pairs (MW II.1, p.148; Lemma II.4 and proof, pp.160–161).

Extend coefficients by zero outside both blocks. The equation `NL=LN` equates adjacent coefficients where both compositions are defined. At the two ends it forces the strict endpoint inequalities and the overlap inequality. Conversely constant coefficients on an allowed overlap satisfy the equation, giving both directions of the parameterization. At a cut `a+1→a`, an allowed occurrence pair contributes precisely one matrix entry if both corresponding basis vectors exist.

A self-block is forbidden. Adjacent singletons `[a,a]` and `[a+1,a+1]` admit exactly one block in the descending direction. With two copies in degree a and three in degree a+1 there are six independent coordinates. Dropping occurrence labels, reversing source and target, or allowing equality of the left endpoints fails these controls.

**Checks.**

- `Precedes [0,0] [1,1]` holds, and the corresponding block sends the degree-1 basis vector to the degree-0 basis vector.
- `Precedes [0,2] [0,2]` fails: equal left endpoints forbid a self-block.
- `Precedes [0,0] [2,2]` fails despite both endpoints increasing: the overlap inequality is necessary.

*Needs:* §§1.3, 2.1.

### 2.3 Surjective restriction to a VN image

Prove `centralizer_restrict_up_surjective`: for every VN pair, restriction to its unshifted VN image is a surjective complex linear map of opposite-degree centralizers (AKY Lemma 3.2(1), p.16; MW Lemma II.4, pp.160–161).

In the standard decomposition, the nonzero images of target `[s,v]` and source `[t,u]` are `[s+1,v]` and `[t+1,u]`. An allowed image coefficient satisfies `s+1<t+1≤v+1≤u`, which implies the original coefficient criterion `s<t≤v+1≤u`. Lift its scalar on that original block and set unused coordinates to zero. The restriction formula in §2.1 verifies the lift. Deleted singleton blocks create no extra coefficients, and a zero image has the unique zero centralizer element. No genericity hypothesis is required.

*Needs:* §2.2 and the actual image dictionary of §1.5.

### 2.4 Surjective restriction to a WL image

Prove `centralizer_restrict_down_surjective` with the same statement for a WL pair (AKY Lemma 3.2(2), p.16).

Reflect all grades by `a↦-a`. Both operator degrees change sign, the interval `[b,e]` becomes `[-e,-b]`, and actual range embeddings remain the same underlying linear maps. Apply §2.3 to the reflected pair and transport back. This proves the descending assertion without applying the VN block inequalities to unreversed endpoints.

*Needs:* §§1.2, 1.5, 2.3.

### 2.5 Polynomial Zariski topology

Define `polynomialTopology n` on `Fin n→ℂ` by generating from sets `D(p)={x | eval x p≠0}` for multivariate complex polynomials p. Transport it to a finite-dimensional vector space through a basis. On centralizers call the result `centralizerTopology`; `ZariskiOpenDense P U` means that U is both open and dense for that topology (AKY §3.1, p.16; Lemma 3.4, p.17; MW Remark II.6.1, p.163).

Prove `polynomial_principal_open` and `centralizerTopology_basis_independent`. Invertible linear coordinate changes pull polynomial functions back to polynomial functions. Over the infinite field ℂ, a nonzero polynomial has a nonzero evaluation, by induction in the variables. A finite product of nonzero polynomials is still nonzero. These facts give `centralizer_irreducible` and `zariski_finite_intersection`, including an empty family of opens.

Prove `zariski_surjective_preimage`: a surjective complex linear map between finite-dimensional centralizers pulls back an open dense set to an open dense set. A linear section and kernel complement identify the domain with a product, so the pulled-back nonvanishing conditions are nonzero polynomial conditions. For an affine subspace, intersection with a dense open is dense there **provided the intersection is nonempty**; a dense open may avoid a particular subspace entirely.

**Checks.**

- `{z:ℂ | z≠0}` is polynomial Zariski open, as the nonvanishing locus of the coordinate polynomial.
- It is dense, though it omits the origin. This tests genericity against equality with the whole space.
- The usual complex unit disk `{z | ‖z‖<1}` is not polynomial Zariski open. In one variable every proper algebraic closed set is finite, whereas its complement is infinite.
- In dimension zero the whole one-point space is open, dense, and irreducible; a nonzero constant polynomial has that whole nonvanishing locus.

*Needs:* `MvPolynomial.eval`, `TopologicalSpace.generateFrom`, `IsIrreducible`, and the two basis contracts; §2.1 for the centralizer specialization.

### 2.6 Generic commuting type

Construct `genericType P` by maximizing all graded path ranks of an opposite operator in `centralizer P`. Within a finite support window only finitely many paths are relevant, with zero paths included as grade dimensions. Each rank has an attained maximum; an attained maximal minor gives a nonzero polynomial. Their rank-maximal loci have nonempty dense open intersection. The rank differences of §1.4 assign one interval multiset to that intersection (Z98 §2, p.410; AKY §3.1, p.16).

Define `genericLocus P` to contain exactly the opposite operators of that type. Prove `generic_rank_locus`: this whole type locus is open dense, because its ranks are exactly the attained maxima. Prove `genericType_iso` under graded conjugation, and `genericType_unique`: a type with open dense locus must equal the selected type. The intersection argument supplies uniqueness even for a zero-dimensional centralizer.

Prove `genericType_shift`: for either direction and every integer c, `genericType (shiftPair P c) = shiftMultisegment (genericType P) c`. Prove `genericLocus_shift` under the identity on underlying endomorphisms: the same opposite map is generic before and after shifting. Reindexing all grades preserves the commuting submodule, its polynomial topology, and every path rank. These targets make genericity available on the shifted image pairs used in §3.5 (AKY §3.1, p.15, shift convention; Proposition 3.5, pp.18–19).

**Checks.**

- The VN chain `[0,2]` has generic opposite type `[0,0]+[1,1]+[2,2]`; its centralizer is zero.
- VN `[0,0]+[1,1]` has generic opposite type `[0,1]`. The generic locus is the nonzero scalar locus, so the zero opposite map is excluded.
- For VN `[0,0]+[2,2]`, the generic opposite type is unchanged: the missing middle grade forces all opposite maps to vanish.

*Needs:* §§1.4, 2.1, 2.5 and `Matrix.rank`.

### 2.7 Finite-orbit conormal symmetry

Prove `conormal_generic_symmetry`: if P is a VN pair and `L∈genericLocus P`, then the generic VN type commuting with `(V,L)` equals `pairType P` (Z81 §4.3 and Proposition 4.4, original pp.20–21; MW Corollary II.7, p.169).

The geometric construction and its necessary comparisons are explicit. For a fixed finite graded dimension vector put `G=∏ₐ GL(Vₐ)`, `E₊=⊕ₐ Hom(Vₐ,Vₐ₊₁)`, and `E₋=⊕ₐ Hom(Vₐ₊₁,Vₐ)`. Realize these as complex affine spaces and the determinant-open algebraic group acting by conjugation. Define `commutingIncidence={(N,L) | NL=LN}` as the zero locus of its matrix polynomial equations. The pairing `tr(NL)` is nondegenerate block by block. Differentiating conjugation gives `X↦[X,N]`; the equality `tr([X,N]L)=tr(X[N,L])` identifies its annihilator with the centralizer fibre.

The target includes the following scoped geometric statements, all for this particular finite-dimensional action, with the usual algebraic dimension rather than a purely topological surrogate:

- `gradedOrbit_geometry`: each orbit is smooth, locally closed, and irreducible, and its tangent space at N is the image of `X↦[X,N]`. Establish constructibility before using the current orbit supplier; identify the stabilizer and the differential over characteristic zero.
- `conormalIncidence_bundle`: over an orbit O, the incidence fibre is its tangent annihilator, forming a conormal vector bundle of rank `dim E₊-dim O`. The trace identification must agree with the polynomial point model.
- `conormalClosure_dimension`: the closure `C_O` of that bundle is irreducible of dimension `dim E₊`. This uses the dimension of a vector bundle over the orbit and the invariance of dimension under dense closure.
- `commutingIncidence_components`: the finitely many `C_O` are exactly the incidence components. The interval classification gives finitely many orbits; their conormal bundles cover the incidence, and the equal dimensions prevent proper containment of distinct closures.
- `conormalClosure_opposite`: projecting a component to `E₋` has image closure with one dense orbit O′. The projection is constructible and G-invariant; a finite orbit stratification of an irreducible closure yields the unique dense orbit. Its inverse image is dense open in the component. On that inverse image the commuting equation places it in the opposite conormal bundle. Closure containment, irreducibility, and equal dimension then identify `C_O` with the opposite conormal closure `C_O′`.
- `conormal_generic_fibre`: the intersection of O′ with the fixed centralizer fibre over any N in O is nonempty open dense. Use the homogeneous associated-bundle presentation `G×_{G_N}centralizer(N)` to pass from the dense open over O to its fibre; transitivity ensures that every fibre is met. Compare this orbit locus with the rank-defined `genericLocus`.

Swapping `E₊` and `E₋` now gives the required symmetry. Z81 applies Pyasetskii’s finite-orbit theorem; the scoped orbit, bundle, dimension, component, projection, and fibre statements above are the mathematical ingredients to establish for that application. Polynomial irreducibility by itself cannot replace them. They require their algebraic carriers and compatibility maps before this proof is available as a Lean theorem.

**Checks.**

- For the zero graded space, G is the trivial group, both operator spaces are points, the incidence has one component of dimension zero, and the fibre is the whole point.
- With one coordinate in each of degrees 0 and 1, write the up and down arrows as scalars n and l. The incidence is `nl=0`, with the two coordinate-axis components. The nonzero up orbit corresponds to the zero down orbit and conversely.
- On a single VN chain `[0,2]`, the opposite fibre is a point. Its generic type is the three singleton type, whose generic VN commuting type returns the original chain. The commutator witness in Conventions excludes anticommuting equations.

*Needs:* §§1.4, 2.1, 2.5–2.6; the actual algebraic-action and conormal interface specified in this subsection. The current constructible-orbit supplier is identified under Scope and ownership.

### 2.8 Multisegment duality

Define `dual m := genericType (standardPair m up)`. Prove `dual_generic_up` for any VN pair P and `dual_generic_down` for any WL pair P, both asserting `genericType P = dual (pairType P)`. Prove `dual_dimension`, preserving each grade dimension, and hence total length (AKY §3.1, p.16; Z98 §2, p.410).

Prove `dual_shift`: `dual (shiftMultisegment m c) = shiftMultisegment (dual m) c` for every m and integer c, using `genericType_shift` and the shifted standard-pair isomorphism. For example, translating `[0,0]+[1,1]` by −2 translates its dual `[0,1]` to `[-2,-1]`.

For the VN statement use conjugacy to the standard pair. For the WL statement transpose operators to the graded vector-space dual, keeping the dual of `Vₐ` in grade a. Transposition switches operator directions, preserves interval labels and the commuting equation, and is an algebraic linear isomorphism of the centralizer coordinate spaces. This establishes the WL assertion independently of involutivity. Grade reflection, in contrast, negates the endpoints and is used only with its explicit interval transformation.

**Checks.**

- `dual [0,2] = [0,0]+[1,1]+[2,2]`.
- `dual ([0,0]+[1,1]) = [0,1]`, so duality is not additive on arbitrary sums.
- `dual ([0,0]+[2,2]) = [0,0]+[2,2]`. The empty multisegment is fixed, and a singleton stays at its original degree.

*Needs:* §§1.3, 2.6.

### 2.9 Duality is involutive

Prove `dual_involutive`: for every finite integral multisegment m, `dual (dual m)=m` (Z81 §4.3, original p.20; MW Corollary II.7, p.169). Choose L in the nonempty generic locus of its standard VN pair, apply §2.7, and then identify the opposite generic type using §2.8. The empty case uses the one-point centralizer and requires no positive dimension hypothesis.

*Needs:* §§2.7–2.8.

### Examples

For `m=2[0,0]+3[1,1]`, the centralizer is the full `2×3` matrix space. Generic rank is 2, so the dual is `2[0,1]+[1,1]`. Its opposite generic type is again the original five singleton occurrences. This simultaneously tests multiplicity, rectangular rank, and the fixed dimension vector (MW Lemma II.4, pp.160–161; Z98 §2, p.410).

### Dependencies

Layer 1; finite complex linear algebra; polynomial evaluation, finite bases, generated topology, and matrix rank. Conormal symmetry additionally requires the scoped algebraic geometry of §2.7. The adjacent rank argument in Layer 4 does not depend on that symmetry.

## Layer 3: admissible images and ramified truncation

### 3.1 Admissible commuting images

For a VN pair `P=(V,N)` and `L∈centralizer P`, define `Admissible P L` by `pairType(V,L)=dual(pairType P)`. Define `onOppositeImage P L` as the VN pair on the **unshifted actual image** of L; commutativity makes this image N-stable. Define `imageAdmissibleLocus P` to require admissibility on V and also

```text
pairType(Im L, L|Im L) = dual(pairType(Im L, N|Im L)).
```

The second equality is a separate condition on the restricted triple (AKY §3.1, unnumbered paragraph before Lemma 3.3, p.16; Lemma 3.4, p.17).

Prove `Admissible_iff_generic`, `onOppositeImage_embed`, and `imageAdmissible_implies_admissible`. The embedding equation is `embed(N_restricted v)=N(embed v)`. Neither the image condition nor this equation is supplied by selecting an interval label alone.

**Checks.**

- The zero commuting triple on the zero space is admissible, and its image is admissible.
- For VN `[0,0]+[1,1]`, zero L is not admissible: its WL type has two singletons instead of the dual chain.
- For the VN chain `[0,2]`, zero L is admissible and image-admissible; its centralizer has no nonzero map and its opposite image is zero.

*Needs:* §§1.5, 2.1, 2.8–2.9.

### 3.2 Generic admissibility on the opposite image

Prove `image_admissible_open_dense` for every VN pair over ℂ: the subset `imageAdmissibleLocus P` is Zariski open dense in its centralizer (AKY Lemma 3.4, p.17).

For nonemptiness, choose generic L commuting with N. By the downward restriction surjection, pull the generic VN locus on `Im L` back to the centralizer of L. Intersect with its generic VN locus on V, obtaining N′ for which both triples are admissible. Involutivity identifies N′ and N as graded-isomorphic. Conjugating L by that isomorphism produces an image-admissible operator for the original N.

For openness, restrict first to the generic WL-type locus on V. There the WL image type is the fixed `rightTruncate (dual (pairType P))`. Image admissibility requires the finitely many VN path ranks on that WL image to attain their generic maxima. On a nonzero-minor chart for L, select independent image columns as a homogeneous basis. The restricted matrices have rational entries whose denominator is the chosen nonzero minor. Clear these denominators within the chart to give polynomial open conditions. Their union is open in the generic locus; nonemptiness and irreducibility imply density. No division occurs on a chart where the selected minor is zero.

*Needs:* §§3.1, 2.4–2.5, 2.9.

### 3.3 Simultaneous genericity on iterated VN images

Prove `simultaneous_genericity`: for every VN pair there is an open dense set of L in its centralizer that is image-admissible on V and whose restrictions to **every** unshifted `Im N^k` are image-admissible, hence generic. The same original L induces all those restrictions (AKY §3.2, p.18, simultaneous choice preceding Proposition 3.5).

The predicate `simultaneousRestrictions P L` records an injective graded embedding of each restricted pair onto `range (N^k)`, an intertwining equation for N, and the equation identifying its opposite map with the restriction of L. Iterating §2.3 gives a surjective restriction map to each image centralizer. Pull back the image-admissible dense opens from §3.2 and take their finite intersection. Nilpotence bounds the number of nonzero images; later zero images impose an automatic condition. The stronger image-admissibility condition is needed for the second image in §3.5, not merely opposite genericity on the ambient space.

*Needs:* §§1.2, 1.5, 2.3, 2.5, 3.2.

### 3.4 Ramified multisegments

Define

```text
ram(m) = dual(rightTruncate(dual(m))).
```

Prove `ram_dual`, giving `dual(ram m)=rightTruncate(dual m)`, and `ram_vn_image`: for an image-admissible L commuting with a VN pair of type m, the unshifted VN pair `(Im L,N|Im L)` has type `ram m`. Prove `ram_totalLength_le`, since its total length is the dimension of an actual subspace of V (AKY §2.3, p.8; §3.2, p.18).

Prove `ram_shift`, commuting ramification with every integer translation, from `dual_shift` and `rightTruncate_shift`. The same opposite map is image-admissible on a pair and on its shift: the range carrier stays fixed while all its grades are reindexed. This follows from `genericLocus_shift`, `pairType_shift`, and `dual_shift`, and applies in particular to the shift by −1 in §3.5.

The WL image type is `rightTruncate(dual m)` by §1.5. The second admissibility equality and dual involutivity give precisely the claimed VN type. The operation is defined on integral intervals independently of representations or a local field.

**Checks.**

- `ram [0,2]` is empty: the dual consists of three singletons and truncation deletes all three.
- `ram ([0,0]+[1,1])=[0,0]`. Its length is 1, not 2, and its degree is 0, not 1.
- `ram ([0,0]+[2,2])` is empty. The empty multisegment also has empty ramification.

*Needs:* §§1.5, 2.9, 3.1–3.2.

### 3.5 Ram and right truncation commute

Prove `ram_truncate_commute` for every finite integral m:

```text
ram(rightTruncate m) = rightTruncate(ram m).
```

Choose one L satisfying §3.3. For the left side take the VN image, shift it by −1, and then take the image of restricted L. For the right side take the WL image first, then its VN image and shift by −1. Both are actual copies of `Im(LN)(-1)=Im(NL)(-1)`, with restricted N. Image admissibility on V and `Im N` identifies their ramified types. The common shift is necessary; equality of unshifted ranges alone would give the wrong endpoints (AKY Proposition 3.5 and proof, pp.18–19).

*Needs:* §§1.5, 2.6, 2.8, 3.3–3.4, including their shift compatibilities.

### Examples

For `[0,0]+[1,1]`, right truncation is empty; its ramified type `[0,0]` also truncates to empty. For the VN chain `[0,2]`, ramification vanishes before and after truncation. For `[0,1]+[1,2]`, the generic opposite image has VN type `[0,1]`: truncating it gives `[0,0]`, the same result as ramifying the truncated singleton sum `[0,0]+[1,1]`. These cases detect the VN shift (AKY Proposition 3.5, pp.18–19).

### Dependencies

Layers 1–2, with both centralizer restriction surjections and conormal involutivity; finite intersections of dense opens. All image statements use the actual range embeddings of Layer 1.

## Layer 4: weighted chains and adjacent generic ranks

### 4.1 Cut multisegments and weighted inclusion chains

For `a:ℤ` define `cutPart m a` to retain every occurrence containing a **or** a+1. Write this full submultisegment as `mₐ`. Define `IsInclusionChain A` for a finite set of distinct intervals A by pairwise inclusion comparability. Weight A by `∑_{s∈A} mₐ.count s`, and define `chainWeight m a`, written `Eₐ(m)`, as the maximum of that weight over chains in the distinct support of mₐ. The empty chain is allowed. Define `adjacentDualCount m a` as the number of occurrences of `dual m` containing **both** a and a+1 (AKY §3.3, Proposition 3.7, pp.19–20).

Prove `cutPart_count`, retaining the full count when the interval meets the cut and zero otherwise. Prove `chainWeight_le_card` and `chainWeight_zero_iff`, with `Eₐ(m)=0` exactly when mₐ is empty. The maximum is finite: filter the powerset of the support by the chain predicate, sum full occurrence counts, and take the natural-number maximum. Counting the support size gives a different invariant.

**Checks.**

- `[0,0]+[1,1]` has cut cardinality 2 at a=0, although neither interval contains both endpoints.
- For `2[0,1]+[1,1]`, `E₀=3`: both distinct intervals form an inclusion chain and all copies contribute.
- For `[0,0]+[1,1]`, `E₀=1`; the two intervals are not comparable by inclusion.
- Outside the support, for example a=3 for this last multisegment, the cut and its maximum are both zero.

*Needs:* §§0.1–0.2 and §2.8 only for `adjacentDualCount`.

### 4.2 The occurrence endpoint poset

For any multisegment q, use its occurrence labels `Fin q.card`. Define `endpointBefore q x y` by strict increase of both endpoints. This is a strict partial order. Equal intervals at different labels are incomparable; equality of just one endpoint also prevents strict comparison (MW II.1, p.148; Lemma II.4, pp.160–161; DIL Theorem 3, pp.6-1–6-2).

Define `IsEndpointAntichain q A` by absence of an ordered pair in A satisfying that relation, and `antichainWidth q` as its largest feasible cardinality. Define `IsEndpointMatching q E` for a finite set of ordered pairs by requiring each pair to be an edge and both coordinate projections to be injective on E. `matchingNumber q` is the largest feasible edge count in this split bipartite graph. A vertex can be used once on the left and once on the right, since those are different roles (DIL split-poset construction, p.6-3).

Prove `endpointBefore_irrefl`, `endpointBefore_trans`, and `matchingNumber_bound`. Require `matchingNumber_le_iff` and `antichainWidth_le_iff`, identifying a bound on the maximum with that bound on every feasible matching or antichain. Prove that permutation of occurrence labels preserves both maxima. Empty feasible sets give value zero for the empty multisegment.

**Checks.**

- For `2[0,1]`, width is 2 and matching number is 0. Making equal copies comparable destroys this value.
- For `[0,0]+[1,1]`, width is 1 and matching number is 1, with the edge from the degree-0 singleton’s left copy to the degree-1 singleton’s right copy.
- For `[0,2]+[1,1]`, width is 2 and matching number is 0; increasing only the left endpoint does not make an edge.
- For `[0,0]+[1,1]+[2,2]`, the two successive edges form a matching of size 2. The middle label appears in opposite roles, which is allowed.
- In the same three-singleton poset, the edges `0→1` and `0→2` fail the matching predicate because they reuse a left vertex. The edges `0→2` and `1→2` fail because they reuse a right vertex. Checking just that the pairs are edges would admit both forbidden sets.

*Needs:* §0.2, finite powersets, occurrence labels, and integer endpoint comparisons.

### 4.3 Finite chain decomposition

Prove `weighted_dilworth` for every q:

```text
matchingNumber q + antichainWidth q = q.card.
```

Prove `cut_antichain_width`, identifying `antichainWidth (cutPart m a)` with `Eₐ(m)` (DIL Theorem 3 and its first inductive proof, pp.6-1–6-2; split-graph argument, p.6-3; weighted occurrence discussion, p.6-4).

For finite Dilworth, induct on the poset cardinality. A maximum antichain separating proper lower and upper subposets lets their chain partitions be glued along its vertices. If no such maximum antichain exists, a chain joining a minimal and maximal element can be removed while reducing the width by one. This proves a partition into width-many chains. Successive vertices in each chain give a split-graph matching with `card-width` edges. Conversely matching edges produce an acyclic graph with at most one incoming and one outgoing edge at each vertex; its paths form `card-size` poset chains. These two constructions establish the displayed identity without requiring a flow or polyhedral theorem.

Use the partial order `x ≤ y ↔ x=y ∨ endpointBefore q x y`, so different equal-interval labels remain incomparable. State the finite-poset input as weak duality for arbitrary chain covers and existence of an equal-size antichain and disjoint chain partition, as in `antichain_le_chain_cover` and `dilworth_partition` of the interface specified under Scope and ownership. The numerical maxima in §4.2 then summarize these witnesses for the rank formula.

For intervals, two labels are incomparable for the strict endpoint order precisely when their underlying intervals are comparable for inclusion. This also holds when an endpoint agrees or the intervals are equal. Thus endpoint antichains correspond to inclusion chains with selected copies. A maximum antichain can include all copies of each selected interval, giving the weighted value Eₐ. Distinct copies are essential in this correspondence.

*Needs:* §§4.1–4.2.

### 4.4 Adjacent generic rank from matchings

Prove `adjacent_generic_rank`: for every m and integer a, the generic rank of `L:Vₐ₊₁→Vₐ` in the opposite centralizer of the standard VN pair equals `matchingNumber mₐ`. Consequently it equals `adjacentDualCount m a` (MW Lemma II.4, pp.160–161; Z98 §3, Theorem 1, pp.410–411, for the surrounding Knight–Zelevinsky rank formula).

At this cut, pad the rows and columns with isolated zero entries for cut occurrences missing the respective grade. An endpoint-order edge automatically has a target containing a and a source containing a+1: otherwise its strict endpoint inequalities contradict membership in the cut. The overlap inequality in §2.2 is then automatic. Each allowed matrix entry is one **different** centralizer coordinate. A nonzero determinant monomial in a minor gives a matching, so rank is bounded by the maximum matching size. Set exactly the coordinates of a maximum matching to 1 and all other coordinates to 0; the selected submatrix is a permutation matrix. This attains the bound, and §2.6 supplies the dense open rank-maximal locus. A WL interval crosses this arrow exactly when it contains `[a,a+1]`.

Only one-arrow ranks enter this proof. The same coordinate can recur in longer powers, so this argument is not asserted for arbitrary powers of L. The two-by-three singleton example in Layer 2 attains rank 2; a single VN chain has no allowed opposite coordinate and rank zero.

*Needs:* §§2.2, 2.6, 4.2 and `Matrix.rank`.

### 4.5 Monotone grid paths

For `r,a:ℕ` with `1≤a<r`, define `GridPath r a` to consist of `r+1` integer-coordinate vertices indexed by `Fin (r+1)`, beginning at `(a+1,a)` and ending at `(1,r)`. Each step is `(−1,0)` or `(0,1)`. Define `InWindow m r` by `1≤b≤e≤r` for every interval of m. Define `intervalWeight m i j` to be `m.count [i,j]` when `i≤j` and zero otherwise, and `GridPath.weight p m` as the sum over its vertices (AKY proof of Proposition 3.7, pp.20–21, Figures 1–2).

There are exactly a steps decreasing the first coordinate and r−a increasing the second. The path stays in `[1,a+1]×[a,r]`; its only reversed-endpoint vertex is the initial `(a+1,a)`. Prove `GridPath.nested`, the coordinate monotonicity along any such path; `GridPath.invalid_start_weight`; and `GridPath.weight_bound`, giving `p.weight m≤Eₐ(m)` for m in the specified window. These weights count multiplicities, not the number of visited vertices.

**Checks.**

- For r=3 and a=1 the endpoint is `(1,3)`, not `(1,1)`. The path `(2,1),(1,1),(1,2),(1,3)` has the prescribed three steps.
- For m=`[1,3]`, the invalid initial vertex `(2,1)` has weight zero.
- For m=`2[1,3]`, the vertex `(1,3)` has weight 2, and the displayed path has total weight 2.
- When r=1 there is no integer a satisfying `1≤a<r`; no interior-cut theorem is applied to that case.

*Needs:* §§0.1–0.2, 4.1 and finite sequences. The endpoint used here is the path definition on AKY p.20; the later converse-path sentence on that page has an inconsistent terminal coordinate.

### 4.6 Paths compute the chain maximum

Prove `grid_path_chain_max`: for `InWindow m r` and `1≤a<r`, every grid path has weight at most Eₐ(m), and some path attains Eₐ(m) (AKY proof of Proposition 3.7, pp.20–21).

The valid vertices on a path are nested intervals. Taking all occurrences of their intervals gives a full inclusion-chain submultisegment with weight equal to the path weight. Conversely order any inclusion chain by containment, interpolate its endpoint pairs with permitted unit steps, and extend from `(a+1,a)` to `(1,r)`. Added vertices have nonnegative weights, so an extension has at least the original chain’s weight. Apply this to a maximum chain and combine with the upper bound. This is an equality of maxima, not a bijection between all paths and chains: zero-weight vertices can change the path without changing the selected support.

For the adjacent specialization of the Knight–Zelevinsky monotone minimum, a map `ν:[1,a]×[a+1,r]→{a,a+1}` is increasing for the product order. Its two level regions have a staircase boundary of this form. Moving the two regions by one coordinate reindexes the rank sum as the total cut weight minus boundary weight. Every such staircase arises. This locates the independently proved adjacent formula in the source’s conventions without importing its full higher-power proof (Z98 §3, Theorem 1 and formula (1), pp.410–411; AKY pp.19–21).

*Needs:* §§4.1, 4.5.

### 4.7 The adjacent Knight–Zelevinsky formula

Prove `adjacent_chain_formula` for **every** finite integral m and `a:ℤ`:

```text
adjacentDualCount m a + Eₐ(m) = (cutPart m a).card.
```

Equivalently the dual count is `card(mₐ)-Eₐ(m)`; §4.1 supplies the bound making natural subtraction legitimate. Combine §4.4 with the matching-width identity and §4.3’s weighted inclusion interpretation (AKY Proposition 3.7, pp.19–21).

Translation puts any nonempty support in a finite window. Interior cuts also have the path description of §4.6. A cut outside the support is empty or lies at a boundary where all retained intervals have the same extreme endpoint and are nested; then Eₐ equals the cut cardinality and the adjacent rank is zero. This treats single-grade support and empty m without imposing an artificial `r≥2` hypothesis on the all-integer formula.

*Needs:* §§4.1, 4.3–4.4; §4.6 for the source’s grid description.

### Examples

For `[0,0]+[1,1]` at a=0, cut cardinality is 2, E₀ is 1, and the dual `[0,1]` crosses the cut once. For `2[0,1]+[1,1]`, cut cardinality and E₀ are both 3, so no dual interval crosses the cut. For `[0,2]+[1,1]` the two inclusion-comparable intervals likewise give E₀=2 and zero opposite rank. These are distinct checks for meeting versus containing, repeated weights, and nesting (AKY Proposition 3.7, pp.19–21; MW Lemma II.4, pp.160–161).

### Dependencies

Layer 0 and the coordinate and generic-rank parts of Layer 2. Finite poset induction, determinant minors, and finite maxima suffice for the adjacent formula. Conormal involutivity and the representation comparison are not prerequisites of this layer.

## Layer 5: the canonical ramified split and representation interfaces

### 5.1 Truncation respects maximal peeling

Prove `truncate_maximalPart` and `truncate_remainder` for every m:

```text
maximalPart(rightTruncate m) = rightTruncate(maximalPart m),
remainder(rightTruncate m) = rightTruncate(remainder m).
```

Right truncation is injective on nonsingleton intervals and preserves and reflects their inclusion, since both right endpoints decrease by one. Any original interval containing a surviving nonsingleton also survives. A maximal singleton disappears and cannot contain a nonsingleton. Thus the surviving distinct maxima and their one-copy contributions agree. Truncation additivity and cancellation then identify the remainders (AKY Lemma 3.6, p.19, whose proof is omitted in the source).

*Needs:* §§0.2–0.3.

### 5.2 Weighted chain decrement under peeling

Prove `chainWeight_peeling`: if `cutPart m a≠0`, then

```text
Eₐ(m) = Eₐ(remainder m)+1,     Eₐ(maximalPart m)=1.
```

Prove `chainWeight_peeling_empty`: if the cut is empty, all three chain weights are zero (AKY proof of Proposition 2.7, pp.21–22).

A chain contains at most one distinct global maximal interval, so removing one copy of every such interval lowers its weight by at most one. This gives `Eₐ(m)≤Eₐ(remainder m)+1`. For the reverse inequality, extend a maximum remainder chain by a global maximal interval containing its largest interval. This interval still meets the cut. If it already occurs in the chain, restore its removed copy; otherwise append it. When the remainder cut is empty, take any maximal interval containing an original cut member. This produces weight at least one. The maximal part’s nonempty cut is an inclusion antichain of distinct intervals with weight one each, so its chain maximum is exactly one.

The nonempty-cut hypothesis cannot be dropped: with empty m, the formula `0=0+1` would be false. The empty companion supplies the required branch of the split proof.

*Needs:* §§0.3, 4.1.

### 5.3 Ramified additivity for the canonical maximal split

Prove `ram_maximal_split` for every finite integral m:

```text
ram m = ram(maximalPart m) + ram(remainder m).
```

This identity concerns the canonical one-copy split (AKY Proposition 2.7, p.10; proof, pp.21–22).

Induct on `totalLength m`, using its strict drop under truncation when m is nonempty. By §5.1 and the induction hypothesis, the split identity holds for the truncated multisegment. Ram/truncation commutation identifies the corresponding VN image types, with their common shift removed using §1.5. Thus the two VN pairs representing the asserted sides have isomorphic **unshifted** VN images.

For degree a, `ram m` is realized as `(Im L,N|Im L)` on an image-admissible locus. Its dimension there is the adjacent rank `rank(L:Vₐ₊₁→Vₐ)`. The adjacent formula computes it as `card(mₐ)-Eₐ(m)`. Cut cardinality is additive for the maximal part and remainder, and §5.2 makes their chain weights sum to Eₐ(m), including the empty-cut case. Hence the graded dimensions of the two sides agree. Apply §1.6 reconstruction and §1.4 classification.

As a negative control, ramification is not additive on arbitrary sums: `ram([0,0]+[1,1])=[0,0]`, whereas each singleton has empty ramification. Repeated maxima are retained correctly: for `m=[0,0]+2[1,2]+[2,2]`, the canonical split from Layer 0 gives `ram m=[0,0]`.

*Needs:* §§1.4–1.6, 3.4–3.5, 4.7, 5.1–5.2.

### 5.4 Comparison with the representation involution

For `F/ℚₚ` finite and any fixed unramified complex character χ, construct `integralSegmentAdapter` sending `[b,e]` to the degree-one cuspidal segment `χ|·|ᵇ,…,χ|·|ᵉ` in the supplier’s actual characteristic-zero smooth GLₙ(F) category. Prove `representation_duality_comparison`, for `n=totalLength m`:

```text
L(integralSegmentAdapter χ m) ≅ Z(integralSegmentAdapter χ (dual m)).
```

Equivalently the supplier’s involution changes the Z-label m to its geometric dual. Both sides have rank n by preservation of total length. The empty label uses the GL₀ unit (AKY §2.1, p.7; §3.1, p.16; MW Proposition II.6, pp.162–169; Theorem II.13 and proof, pp.176–177).

The adapter has a definite normalization. Set

```text
c = -log |χ(ϖ)| / log q,       χ₀ = χ |·|⁻ᶜ.
```

Since χ takes values in ℂ×, `|χ(ϖ)|>0`; since F is a non-archimedean local field, `q>1`, so `log q≠0`. The unramified χ₀ is unitary and `χ=χ₀|·|ᶜ`. The integer interval becomes the supplier’s real interval `[b+c,e+c]` on the χ₀ line. Prove `integralSegmentAdapter_support`, identifying every twist in that sequence; `integralSegmentAdapter_shift`, expressing integer translation by determinant twist; and `integralSegmentAdapter_empty`, preserving the rank-zero unit. Independence of ϖ follows from χ and the norm being trivial on units. Normalized induction and both Z/L constructions must commute with the common twist, as specified in the supplier contract.

The comparison proof separates its geometric and representation ingredients. Construct `mwLabel` by the finite recursive algorithm of MW II.2, pp.149–150: choose the largest terminal degree d; among segments ending there choose one maximal in MW’s endpoint order, then successively choose maximal preceding segments ending at d−1, d−2, and so forth. Here MW orders intervals lexicographically by `(left,right)`, with larger left endpoint first and larger right endpoint first in a tie; an absent interval is below every nonempty one (II.1, p.148). Remove one right endpoint from each selected occurrence, output the segment joining those terminal degrees, and repeat. The preceding relation is exactly §2.2’s `Precedes`; choices among equal occurrences do not change the resulting multiset. Total length decreases at every step. An equivalent left-endpoint recursion is given in Z98 §5, p.412: start at the smallest left endpoint, choose the shortest interval there, continue through consecutive left endpoints choosing the smallest right endpoint strictly greater than the preceding choice, remove these left endpoints, and output the interval formed by their consecutive degrees.

Require `mwLabel_generic`, identifying this recursively computed multisegment with `dual m`. MW Proposition II.6, pp.162–169, supplies the generic-coordinate proof: its affine slices meet the generic centralizer locus and expose one interval while reducing to the shortened remainder. Nonempty affine-slice intersection is proved before applying Remark II.6.1, p.163. The geometric argument uses Layer 2, not a representation-valued oracle.

For `mwLabel_representation`, use MW Theorem II.13, pp.176–177. The precise comparison inputs are as follows, on the unramified degree-one line with the Z convention. They specialize representation results to the comparison; they do not introduce another general segment classification.

- `mw_singleton_extract`: for nonempty m listed in decreasing MW order, let c be the largest left endpoint and choose the last interval with that left endpoint. Delete its left endpoint, dropping it if it was a singleton, to obtain m′. For `α=χ|·|ᶜ`, there is an embedding `Z(m) ↪ α × Z(m′)`. Moreover `Z(m′)` is the unique irreducible isomorphism class π′ for which `Z(m) ↪ α × π′` (MW Lemma II.11, pp.174–175). The ranks are `totalLength m` and one less, respectively.
- `mw_involution_embedding`: if irreducible π and π′ on this unramified line satisfy `π ↪ α × π′`, the supplier’s involution yields `τπ ↪ τπ′ × α`. The product is normalized and its order is reversed; α is fixed by τ (MW Corollary I.7.2 and Proposition I.7.3, p.147). This statement concerns embeddings of actual representations, stronger than multiplicativity in a Grothendieck group.
- `mw_right_singleton_candidates`: for any integer c and q in decreasing MW order, set `α=χ|·|ᶜ`. Every irreducible subrepresentation of `Z(q) × α` has label either `q+[c,c]` or q with one interval ending at c−1 extended to c. List q’s intervals ending at c in decreasing order, then process that list in reverse. At each step select the least unused occurrence index of an interval ending at c−1 that precedes the processed interval, if any. An interval selected by this greedy matching cannot be the one extended in a subrepresentation label (MW Lemma II.10.2, pp.172–173). The two factors have ranks `totalLength q` and 1.
- `mw_algorithm_reinsertion`: for m and m′ as in the first input, `mwLabel m` arises from `mwLabel m′` by extending an interval A ending at c−1 to c, or adding `[c,c]` if A is absent. Every interval B of `mwLabel m′` ending at c−1 and strictly smaller than A can be matched, by distinct occurrence labels, to an interval ending at c and strictly smaller than the extended A, with `Precedes B C` (MW Lemma II.3, statement pp.150–151, proof pp.151–160). The empty-A case has no smaller B.

The matching property in the last input and the greedy exclusion in the third imply that any right-induced candidate lies at least as high in MW’s fixed-support lexicographic order as the algorithmic label. This is the exclusion used in Remark II.10.3, p.174 and the proof of Theorem II.13, p.176; the product here is explicitly `Z(q) × α`, as in Lemma II.10.2 and that theorem’s embedding. An induction in rank proves the label inequality. A second induction in the finite order at fixed support, together with geometric involutivity and the supplier’s representation involutivity, proves equality. The general irreducibility and involution assertions belong to the smooth-representation supplier. The three representation inputs must be exposed from its API or established as these scoped comparison theorems; classification alone does not supply them.

The required representation carrier, normalized products, equivariant embeddings, and these extraction/reinsertion interfaces must exist before typing this comparison. This subsection specifies the mathematical comparison and its inputs; it does not assume an arbitrary function from multisegments to representation symbols satisfying the desired result.

**Checks.**

- For χ unitary, c=0, so `[b,e]` retains its integer endpoints. For χ=`|·|²`, c=2 and χ₀ is trivial, giving `[b+2,e+2]`; the opposite sign would disagree at ϖ.
- The empty multisegment gives the rank-zero trivial line, while `[b,b]` gives χ`|·|ᵇ` in rank one and agrees in both Z and L conventions.
- For χ trivial, the comparison sends `L([0,0]+[1,1])` to `Z([0,1])`; the determinant-character and Steinberg witness in Conventions distinguishes the two normalizations.
- `mwLabel [0,2]=[0,0]+[1,1]+[2,2]`: a single long chain produces singletons.
- `mwLabel ([0,0]+[1,1])=[0,1]`, and a second application gives the original singleton sum. This checks consecutive selection rather than arbitrary joining.
- `mwLabel (2[0,1])=2[0,0]+2[1,1]`; the empty input produces the empty label. Repeated occurrence labels are not deduplicated.

*Needs:* §§0.2, 2.2, 2.6–2.9; SmoothRepresentationsOfLocalGroups SR.0–SR.3 and SR.5.3 under Exact supplier contracts; the scoped MW comparison inputs stated above. No local-field hypothesis enters Layers 0–4 or §5.3.

### 5.5 Newform and unipotent-induction interface

Export `ram`, `ram_vn_image`, `ram_truncate_commute`, and `ram_maximal_split` to the general-linear newform consumers. Define `newformExample` to be the following multisegment m, and prove `newform_example_ram`:

```text
m = [5,6]+[3,7]+[3,4]+[2,5]+[3,3]+[1,2]+[0,0],
ram m = [4,4]+[2,5]+[1,2]+[0,0].
```

Its total length decreases from 17 to 8. The output interval lengths and the canonical split equality supply the tuple comparison and the unipotent induction. The consumer defines the tuple and proves the representation-conductor and induction statements (AKY §2.5, pp.11–13; Proposition 2.4, p.9; Corollary 2.8, pp.10–11).

Compute the maximal part `[3,7]+[2,5]+[1,2]+[0,0]`. Its dual is `[7,7]+[5,6]+[4,5]+[2,4]+[0,3]`; right truncation deletes the first singleton and leaves `[5,5]+[4,4]+[2,3]+[0,2]`. Their dual is `[2,5]+[1,2]+[0,0]`. The remainder is `[5,6]+[3,4]+[3,3]`. Its maximal part, the first two intervals, has ramification `[4,4]`, and the remaining singleton has empty ramification. Apply §5.3 twice.

Keep the four surviving shortened intervals with their original labels, or introduce four new labels without another shortening. The prose and diagrams around AKY p.12 use differing labels; the displayed endpoint values above implement exactly one shortening.

**Checks.**

- `newformExample.card=7` and `totalLength newformExample=17`; treating the seven intervals as seven basis vectors fails.
- Its degree-3 dimension is 4: `[3,7]`, `[3,4]`, `[2,5]`, and `[3,3]` each contribute once. Omitting singleton support changes this dimension.
- The ramified output has four occurrences, total length 8, and degree-3 dimension 1. These values distinguish the displayed output from a second shortening or loss of multiplicity.

*Needs:* §5.3 for the interval computation and §5.4 for its representation interpretation.

### Examples

For `m=2[0,2]`, the canonical split leaves one chain in each part and both ramified parts are empty. For `[0,0]+2[1,2]+[2,2]`, the maximal part `[0,0]+[1,2]` has ramification `[0,0]`, and the remainder `[1,2]+[2,2]` has empty ramification. The rank-17 computation of §5.5 then exercises successive peeling beyond these small cases (AKY Proposition 2.7, p.10; §§2.4–2.5, pp.10–13).

### Dependencies

Layers 0–4 for canonical ramified additivity. The final representation comparison alone imports the smooth-representation contracts and its MW comparison interfaces. The newform consumer receives the interval results without owning another copy of multisegment duality.

## Downstream consumers

The general-linear newform work extracted from AKY Proposition 2.4 uses the VN realization of ramification and simultaneous genericity to read conductor differences from ranks on iterated images. Its Corollary 2.8 uses the canonical maximal split to separate the contributions in the unipotent induction. Both consumers receive actual equality of interval multisets, hence equality of their full multiplicities and length data. Arbitrary additivity is unavailable, as the adjacent-singleton control in §5.3 shows.

Representation comparisons consume `representation_duality_comparison` only after adopting the supplier’s normalized Z/L conventions. Combinatorial uses of adjacent ranks, grid maxima, and maximal peeling depend on no local field, local Langlands parameter, or conductor normalization.

## References

All AKY locators refer to the printed pages of arXiv v4; MW and Z98 locators use printed journal pages, and DIL uses its lecture labels.

- **AKY:** Hiraku Atobe, Satoshi Kondo, Seidai Yasuda, *Local newforms for the general linear groups over a non-archimedean local field*, [arXiv:2110.09070v4](https://arxiv.org/pdf/2110.09070v4), 28 September 2022. Published in *Forum of Mathematics, Pi* 10 (2022), e24, [DOI 10.1017/fmp.2022.17](https://doi.org/10.1017/fmp.2022.17). Segment conventions: §2.1, p.7 and §2.3, p.8; maximal split and consumers: §§2.4–2.5, pp.10–13; graded operators and proofs: §§3.1–3.3, pp.14–22.
- **MW:** Colette Mœglin, Jean-Loup Waldspurger, *Sur l’involution de Zelevinski*, *Journal für die reine und angewandte Mathematik* 372 (1986), 136–177, [GDZ scan](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002204061), [DOI 10.1515/crll.1986.372.136](https://doi.org/10.1515/crll.1986.372.136). Endpoint order and algorithm: II.1–II.2, pp.148–150; commuting coordinates: Lemma II.4, pp.160–161; geometric identification: Proposition II.6, pp.162–169; involutivity: Corollary II.7, p.169; representation identification: Theorem II.13, pp.176–177.
- **Z81:** Andrei V. Zelevinskii, *p-adic analog of the Kazhdan–Lusztig hypothesis*, *Funktsional’nyi Analiz i ego Prilozheniya* 15:2 (1981), 9–21, [original article](https://www.mathnet.ru/eng/faa1707). English translation in *Functional Analysis and Its Applications* 15 (1981), 83–92, [DOI 10.1007/BF01082279](https://doi.org/10.1007/BF01082279). §4.3 and Proposition 4.4, original pp.20–21, give the conormal correspondence and commuting trace description; §4.5 states the representation comparison as a conjecture, subsequently proved by MW.
- **Z98:** Andrei Zelevinsky, *Multisegment duality, canonical bases and total positivity*, *Documenta Mathematica*, Extra Volume ICM 1998, III, 409–417, [article](https://ems.press/content/book-chapter-files/27254?nt=1). §2, p.410 gives the generic operator description; §3, Theorem 1, pp.410–411 gives the Knight–Zelevinsky formula; §5, p.412 gives the recursive rule.
- **DIL:** Michel X. Goemans, scribe Joungkeun Lim, *18.997 Topics in Combinatorial Optimization, Lecture 6*, MIT, 26 February 2004, [lecture notes](https://ocw.mit.edu/courses/18-997-topics-in-combinatorial-optimization-spring-2004/72c5d7935dea64f0e2773ad376f83d5d_co_lec6.pdf). Theorem 3 and its inductive proof, pp.6-1–6-2; matching/chain correspondence, p.6-3; weighted occurrence constructions, p.6-4.

The adjacent formula is attributed to Knight–Zelevinsky through Z98 Theorem 1 and AKY Proposition 3.7. The proof specified here uses independent block coordinates and finite matching; it requires no assertion about the complete higher-power argument of Knight–Zelevinsky’s 1996 article.
