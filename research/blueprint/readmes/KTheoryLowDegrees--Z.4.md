# Dedekind domains and S-integers

Part Z.4 of **Grothendieck groups, Cartan maps, and Euler forms, Part II:
explicit ring and curve K₀ and stable-matrix K₁** (`KTheoryLowDegrees`).

This layer computes finite projective modules and their Grothendieck group over
a Dedekind domain. Its coordinates are rank and the determinant line. It also
computes scalar extension, localization and finite-flat restriction of scalars
in those coordinates, including the determinant of the algebra in the transfer.
The calculation supplies `ArithmeticKTheory:N.1` and
`KTheoryLowDegrees:KU-k0classical`, as well as the affine comparison in Z.5.

The mathematical targets already have accepted nodes in
[the Z.3 companion packet](../packets/KTheoryLowDegrees--Z.3.json), reviewed by
`independent-review-REV-KTheoryLowDegrees--Z.3~3` on 7 October 2026. This part
imports those **43 Z.4 nodes**, retaining their IDs, six planets, 45 API items
and 26 definition tests. It adds no duplicate nodes. The
[packet](../packets/KTheoryLowDegrees--Z.4.json) gives the target-to-node map and
an inventory of the imports. The issue's U.1 predecessor is the source of Z.1
and Z.2; its scope contains no Z.4 coverage record. The standalone presentation
here makes the accepted Z.4 plan readable and provides a compact native
[suggested file](../suggested/KTheoryLowDegrees--Z.4.lean).

## Conventions and ownership

A Dedekind domain means a commutative domain satisfying Mathlib's
`IsDedekindDomain`: Noetherian, integrally closed, of Krull dimension at most
one. Fields are included. Write R for this domain and K for its fraction field.
All modules are left modules. A finite projective means finitely generated and
projective; finite direct sums are also written as products. A nonzero ideal is
an integral ideal different from the zero ideal. The zero ideal is excluded
whenever an ideal is used as a line.

The zero module means any subsingleton module, independently of its underlying
type. For a finite projective P, its rank r is the nonnegative integer
`Module.finrank R P`, equivalently the K-dimension of K ⊗ P. Z.2 supplies the
proof that this agrees with its constant stalk rank. The rank of a virtual
class belongs to ℤ. Its determinant is a class in `CommRing.Pic R`, written
multiplicatively: the identity is 1, and a negative exponent denotes a dual
power. In additive-group signatures the same group is `Additive (Pic R)`;
its zero corresponds to the line R.

K₀(R) is Z.1's split Grothendieck group of the full subcategory of finite
projectives in `ModuleCat R`. Its native carrier is Tau Ceti's `SplitK0`.
The class of P is [P]. Direct sum gives addition, and Z.3 supplies the tensor
product ring structure, unit [R], exterior powers and determinant. This layer
imports these constructions; it neither replaces categorical K₀ nor develops
its presentation again. The determinant of a rank-r projective is the Picard
class of ΛʳP. In rank zero, Λ⁰0 = R, so det(0) = 1.

`ClassGroup R` is Mathlib's ideal class group. Its existing multiplicative
equivalence `ClassGroup.equivPic` with Pic is used throughout. We plan only its
evaluation on ideal representatives and its compatibility with the K₀
coordinates. The class-group norm, extension of ideal classes, valuation-defined
S-integers and their class-group quotient are existing library objects.

The accepted RS-18 restructuring assigns these explicit ring calculations to
this Part II of **Grothendieck groups, Cartan maps, and Euler forms**.
The current upstream **Algebraic vector bundles** roadmap owns geometric
finite locally free sheaves, tensor and exterior operations and determinant
functors, in particular its L0A–L0C interfaces. It supplies geometry for Z.5;
Z.4's ring calculation does not restate those targets. Both current upstream
readers and their relevant suggested signatures were read, together with the
current Tau Ceti library, before writing this part.

## Sources and baseline

The following freely readable versions were read on 19 October 2026. Page
numbers refer to these files, not to the combined K-book draft or the printed
volume. Statements and proof routes below are in our own words.

* Charles A. Weibel, [*The K-book*, Chapter I](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf),
  standalone author chapter, 54 pages: §3, pp. 16–19; Exercises 3.4–3.5, p. 24;
  Exercise 3.8, p. 25. Proposition 3.4, p. 17, gives classification in dimension
  one; Proposition 3.5, pp. 17–18, compares lines and invertible ideals. The
  ideal-decomposition argument on p. 18 is used without importing Bass
  cancellation. The field case is handled by finite-dimensional linear algebra.
* Weibel, [Chapter II](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf),
  standalone author chapter, 106 pages: Definition 2.3 and Lemma 2.3.1, p. 8;
  Proposition 2.6 and Corollaries 2.6.2–2.6.3, p. 11; Example 2.8.1, p. 13;
  Exercise 2.2, p. 14. These provide the rank/determinant computation and the
  scalar-extension/transfer setting.
* J. S. Milne, [*Algebraic Number Theory*, v3.08, 19 July 2020](https://www.jmilne.org/math/CourseNotes/ANT.pdf):
  Theorem 3.31 and its notes, printed pp. 57–58 (PDF pp. 59–60), for projective
  ideal decompositions and their classification; Example 4.6, printed p. 71
  (PDF p. 73), for ℚ(√−5); §5, S-units, printed p. 90 (PDF p. 92), for the
  valuation-defined ring and the use of principal powers of primes.
* Henri Cohen, [*Advanced Computational Algebraic Number Theory*, author
  manuscript, 11 July 2001](https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf),
  independently read for this review: Corollary 1.2.11, printed p. 5
  (PDF p. 19); Theorem 1.2.19 and Lemma 1.2.20, pp. 9–10 (PDF pp. 23–24);
  Corollaries 1.2.24–1.2.27, pp. 11–12 (PDF pp. 25–26); Definition 1.2.33
  and Theorem 1.2.35, pp. 15–16 (PDF pp. 29–30); relative integral
  pseudo-bases, p. 77 (PDF p. 91); Definition 2.2.11 and Propositions
  2.2.12–2.2.13, pp. 80–82 (PDF pp. 94–96); Exercise 2.22, p. 130
  (PDF p. 144). The packet records the exact version and hash.

The imported nodes retain their independently reviewed source provenance,
including their Cohen locators. The original standalone pass inherited that
evidence; the independent review now checks the cited public manuscript too.
The determinant/norm comparison below is a derivation from the index-ideal
argument and pinned ideal-norm declarations. Cohen's arithmetic statements
motivate it; the finite-injective Dedekind-domain generality is justified by
the local proof below. No comparison against a published book edition is
claimed.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed `AUDIT-29` row calls Z.4
partly built: the carriers, rank-one ideal presentation, Pic/class-group
equivalence, class-group norm and S-integer class-group quotient exist; full
Steinitz classification and the K₀ comparison and transfer calculation do not.
The statements used directly by this companion were reread at these pins.

| Existing interface | What it supplies here |
| --- | --- |
| `TauCeti.finiteProjectiveModules`, `TauCeti.SplitK0`, `SplitK0.of`, `SplitK0.of_congr`, `SplitK0.of_biprod`, `SplitK0.liftEquiv` | The actual finite-projective category, class map, isomorphism invariance, direct-sum relation and universal property. |
| `Module.Invertible`, `Module.Invertible.linearEquiv`, `Module.Invertible.exists_linearEquiv_ideal` | Tensor-invertible modules, dual evaluation and an ideal representative of every line over a domain. Invertible modules already have finite and projective instances. |
| `CommRing.Pic.AsModule`, `CommRing.Pic.mk`, `CommRing.Pic.mk_eq_mk_iff`, `CommRing.Pic.mk_eq_one_iff_free`, `CommRing.Pic.mk_tensor`, `CommRing.Pic.mk_dual` | Line representatives, equality up to linear equivalence, freeness, products and inverses. |
| `ClassGroup.equivPic`, `CommRing.Pic.mapAlgebra` | The existing Pic/class-group equivalence and scalar extension of lines. |
| `ClassGroup.relNorm`, `ClassGroup.relNorm_mk0`, `ClassGroup.relNorm_extendedHom` | The normalized class-group norm, computation on a nonzero ideal and norm after extension as a degree power. |
| `IsDedekindDomain.integerClassGroupEquiv`, `IsDedekindDomain.integerClassGroupEquiv_extendedHom`, `IsDedekindDomain.integer_extendedHom_surjective`, `IsDedekindDomain.ker_integer_extendedHom`, `IsDedekindDomain.finite_integer_classGroup` | The quotient for actual `Set.integer`, its extension map, kernel and finiteness. |
| `contractLeft`, `LinearMap.lTensor`, `LinearMap.range` | The evaluation-image formula for the index ideal on native module carriers. |
| `TrivSqZeroExt` and its multiplication | The existing ring carrier for ℤ ⊕ Additive Pic with square-zero second summand. |

The accepted nodes' other baseline prerequisites remain imported with their
original evidence; this companion is not a fresh audit of every declaration in
their transitive closure. Searching current main also found no replacement
Steinitz or ring rank/Pic classification to import. These absence claims concern
these exact targets, not every occurrence of the words rank or Steinitz.

## Ideal identity and projective classification

The first target is, for nonzero ideals I,J of R,

\[
 I\oplus J\simeq_R R\oplus IJ. \tag{1}
\]

The proof must preserve the ideal class while making the ideals coprime.
The imported `coprime-ideal-representative` uses Mathlib's Dedekind approximation
lemma to find α in K× such that J′ = αJ is integral and I + J′ = R. When I = R
there is no approximation step. Otherwise the equality with R forces α ≠ 0.
Multiplication by α identifies J with J′ and IJ with IJ′.

For coprime ideals, addition I ⊕ J′ → R has section
r ↦ (ri,rj), where i ∈ I, j ∈ J′ and i+j=1. Its kernel is the copy of I ∩ J′
formed by z ↦ (z,−z). Coprimality identifies the intersection with IJ′.
Splitting and undoing multiplication by α give (1). This proves
`coprime-ideal-sum` and `ideal-sum` without a cancellation theorem or a choice
of generators for I or J. Proposition I.3.5 and Exercise I.3.5, pp. 17–18 and
24, identify tensor products of the ideal modules with products of ideals.
Equation (1) is the first planet, **Steinitz ideal identity**.

For the next target, embed a finite projective P as a summand of Rᴺ using its
existing finite-projective splitting. The image of a coordinate projection is
an integral ideal. If that image is zero, discard the coordinate. If it is
nonzero, the ideal is finite and torsion-free over a Dedekind domain, hence
projective, and the projection onto it splits. Its kernel remains finite
projective and embeds in Rᴺ⁻¹. Induction on N gives a sum of nonzero ideals,
with the empty sum representing precisely the zero module. Rank additivity
shows that their number is r. This is `projective-ideal-summands`, the argument
in Weibel I §3, p. 18, with integral coordinate images replacing fractional
ideals. Milne Theorem 3.31(a) and the notes on p. 58 describe the same splitting
route.

Repeated application of (1) now gives **Steinitz classification**:

\[
 P=0\quad\text{or}\quad
 P\simeq_R R^n\oplus I,\qquad n\geq0,\ I\ne0,
 \quad r=n+1,\quad \det P=[I]_{\mathrm{Pic}}. \tag{2}
\]

The ideal is a product of the r nonzero ideal summands. The determinant
identification uses Z.3's direct-sum formula, det Rⁿ = 1 and det I = [I].
There is no rank-minus-one module when r=0. The equivalence is a choice;
the Picard class of I is determined by P. Conversely any such ideal and n
produce a finite projective of that rank and determinant. This is the
`steinitz` planet. Weibel Proposition I.3.4, p. 17, and Milne Theorem 3.31(b),
p. 58, give the resulting classification.

Thus finite projectives P,Q are isomorphic exactly when they have the same
rank and determinant (`projective-classification`). At common rank zero both
are zero. At positive rank the free parts in (2) have the same size, and
equality of Picard classes gives an actual equivalence of ideal modules through
`CommRing.Pic.mk_eq_mk_iff`. It follows that P ⊕ M ≅ P ⊕ N implies M ≅ N
(`projective-cancellation`). It also follows that [P]=[Q] in K₀ implies P≅Q
(`projective-class-injective`): apply rank and determinant to that equality,
then use classification. These are consequences of (2), not prerequisites
used to obtain it.

**Checks.** Taking I=J=R in (1) gives the usual rank-two free module. Taking
P=0 exercises the empty decomposition. Rank one in (2) permits a nonprincipal
ideal and therefore must not imply freeness. Cancellation includes a zero
common summand. Fields satisfy all statements, with every nonzero ideal R.

## Rank and determinant on virtual classes

For lines L,M, (1) gives

\[
 [L\otimes_R M]=[L]+[M]-[R]. \tag{3}
\]

Here a line is replaced by a nonzero ideal using the existing invertible-module
ideal presentation; changing that presentation does not change its K₀ class.
This is `line-class-product`. Its consequence is the construction
`reduced-line-class`:

\[
 s:\operatorname{Pic}(R)\longrightarrow K_0(R),\qquad s(L)=[L]-[R]. \tag{4}
\]

Equation (3) proves that s is a group homomorphism to the additive group K₀.
It has rank zero and determinant L. In particular it is injective. Each finite
projective, including zero, satisfies

\[
 [P]=(r-1)[R]+[\det P]=r[R]+s(\det P). \tag{5}
\]

For zero, the first expression is −[R]+[R]; for positive rank it is (2).
This is `projective-class-normal-form`. Equations (4)–(5) yield the
**Rank and determinant classification** planet `rank-pic-equivalence`:

\[
 \Phi_R:K_0(R)\simeq\mathbb Z\oplus\operatorname{Pic}(R),\qquad
 x\longmapsto(\operatorname{rank}x,\det x),
 \quad
 \Phi_R^{-1}(n,L)=(n-1)[R]+[L]. \tag{6}
\]

The inverse is defined for every integer n. To prove the two inverse identities,
rank and determinant evaluate it to (n,L), and (5) proves the other identity on
all projective generators. Tau Ceti's existing universal property then gives
that identity on the entire group. This is an explicit inverse, not just a
cardinality or generator count. `rank-pic-apply` and `rank-pic-inverse` record
its evaluation rules. Weibel II Corollary 2.6.3, p. 11, gives the general
one-dimensional computation; connectedness of Spec R makes H⁰(Spec R,ℤ)=ℤ.
For fields the same conclusion is the Z.2 calculation.

The ring target in (6) uses

\[
 (m,L)+(n,M)=(m+n,LM),\qquad
 (m,L)(n,M)=(mn,L^nM^m),\qquad 1=(1,1). \tag{7}
\]

It is the existing trivial square-zero extension of ℤ by Additive Pic, with
integer scalar multiplication. Formula (3) says products of two reduced line
classes vanish; expanding with (5), or specializing Z.3's tensor-determinant
formula, proves (7) for all virtual classes and all integer exponents.
`rank-pic-mul` records it; `rank-pic-ring-equiv` packages the isomorphism and
identifies SK₀(R)=0. The rank-zero ideal has square zero. This is the planet
**The ring H⁰(R) ⊕ Pic(R)**, with H⁰ identified with ℤ. The source is Weibel
II Corollaries 2.6.2–2.6.3, p. 11, with the tensor identity in I Exercise 3.4,
p. 24. The determinant alone is a homomorphism for direct sum and tensoring
lines, but is not multiplicative for arbitrary K₀ products.

### API of the reduced line class

Proposed names in this table have prefix `TauCeti.RingK0.`.

| Name | Contract and use |
| --- | --- |
| `picToK0` | The additive homomorphism from Additive Pic defined by (4); used in (6) and localization kernels. |
| `picToK0_apply` | Evaluation on a Picard class L is [L]−[R]. |
| `picToK0_ofAdd_mk` | For an invertible module N, evaluation on its Picard class is [N]−[R]. |
| `rankℤ_picToK0` | The rank of every image is zero. |
| `det_picToK0` | The determinant of s(L) is L, using Z.3's determinant. |
| `picToK0_mul_picToK0` | s(L)s(M)=0 in K₀(R). |
| `picToK0_injective` | s is injective, with determinant as a left inverse. |
| `range_picToK0` | Its image is exactly the kernel of integer rank. |

The four tests are `picToK0_zero_test`: s(1)=0;
`picToK0_dual_test`: s(L⁻¹)=−s(L), equivalently [L]+[L∨]=2[R];
`picToK0_det_test`: det s(L)=L and rank s(L)=0 with the Z.2/Z.3 maps;
and `picToK0_not_class_test`: L↦[L] without subtracting [R] fails the
homomorphism law already on the identity line, whose class has rank one.
These detect the missing reduction, an incorrect dual convention and a zero map.

### API of rank/Pic coordinates

All names again have prefix `TauCeti.RingK0.`.

| Name | Contract and use |
| --- | --- |
| `rankPicEquiv` | The additive equivalence (6), used by the arithmetic and affine-curve computations. |
| `rankPicEquiv_apply` | Its coordinates are precisely integer rank and Z.3 determinant. |
| `rankPicEquiv_symm` | The inverse is (n−1)[R]+[L] for every integer n. |
| `rankPicEquiv_ext` | Classes are equal exactly when both coordinates are equal. |
| `rankPicEquiv_of` | [P] maps to (finrank P,det P). |
| `rankPicEquiv_one` | [R] maps to (1,1), or (1,0) with the additive Pic convention. |
| `rankPicEquiv_symm_zero_ofAdd` | The inverse at (0,L) is s(L). |
| `ker_rankℤ_equiv_pic` | Determinant identifies the rank-zero subgroup with Additive Pic, with inverse s. |
| `rankPicEquiv_isPrincipalIdealRing` | For a PID the first coordinate agrees with Z.2's K₀≅ℤ. |

The five tests are `rankPic_zero_test`: 0↦(0,1);
`rankPic_negative_test`: the inverse of (−1,1) is −[R];
`rankPic_nontrivial_test`: s(L)≠0 whenever L≠1;
`rankPic_pid_test`: [ℤ³]↦(3,1), agreeing with the existing PID case;
and `rankPic_ideal_test`: [R]−[I]↦(0,[I]⁻¹) for a nonzero ideal I.
The last test fixes the inverse sign needed for residue-module localization.

### API of the ring equivalence

Prefix: `TauCeti.RingK0.`.

| Name | Contract and use |
| --- | --- |
| `rankPicRingEquiv` | The ring equivalence with multiplication (7). |
| `rankPicRingEquiv_toAddEquiv` | Its additive equivalence is exactly (6). |
| `rankPicRingEquiv_fst` | The first projection is integer rank. |
| `rankPicRingEquiv_snd` | The second projection is determinant. |
| `rankPicRingEquiv_symm_one` | The inverse of (1,1) is the unit [R]. |
| `sk0_eq_bot` | The common kernel of rank and determinant is zero. |
| `ker_rankℤ_sq_eq_bot` | The rank-zero ideal has zero square. |
| `rankℤ_ringHom` | Rank is a ring homomorphism, split by n↦n[R]. |

The four tests are `rankPicRing_line_sq_test`: [L]²=2[L]−[R];
`rankPicRing_pid_test`: a trivial Picard group gives K₀≅ℤ as rings;
`rankPicRing_det_not_mul_test`: for L≠1, det(2[R]·[L])=L² differs from
1·L=L; and `rankPicRing_rank_test`: the two projections agree with Z.2 and
Z.3 and recover the field computation. In any group L²=L forces L=1, so the
third test works even when Pic has torsion.

## Ideal-class coordinates and scalar extension

For every nonzero ideal I, `class-group-pic-mk0` proves

\[
 \operatorname{equivPic}_R(\operatorname{mk0} I)=[I]_{\mathrm{Pic}}. \tag{8}
\]

This is an evaluation lemma for the library equivalence. The proof follows its
invertible-submodule construction in K; the embedded ideal is R-linearly
isomorphic to I. It does not construct another class group. Proposition I.3.5,
pp. 17–18, and Milne Theorem 3.31, p. 58, explain the underlying identification.

Consequently two nonzero ideals have equal ideal class exactly when their
module carriers are linearly equivalent. `ideal-class-representative-independence`
then identifies their K₀ classes. Concretely, a relation (a)I=(b)J with a,b
nonzero gives the same conclusion by multiplication in K. The inverse in (6)
is therefore independent of which nonzero integral ideal represents the class.
Composing (6) with the inverse of the existing equivalence on the second factor
gives `rank-class-group-equivalence`:

\[
 \Psi_R:K_0(R)\simeq\mathbb Z\oplus\operatorname{Cl}(R),\qquad
 \Psi_R^{-1}(n,\operatorname{mk0} I)=(n-1)[R]+[I]. \tag{9}
\]

For any ring homomorphism f:R→B between Dedekind domains, including a quotient
map to a field, Z.1 scalar extension acts in Pic coordinates by

\[
 f^*(n,L)=(n,B\otimes_R L). \tag{10}
\]

Rank and determinant commute with scalar extension by Z.2 and Z.3. For the
class-group description assume f is injective. Then B is torsion-free and
flat over R. Tensoring an ideal inclusion identifies B⊗I with the extended
ideal IB, so `pic-map-extended-hom` identifies the Pic map with Mathlib's
`ClassGroup.extendedHom`. This proves `k0-base-change-coordinates` without
assuming that all projectives are free. Weibel I Proposition 3.2, p. 16, and
II Example 2.8.1, p. 13, are the source interfaces.

### API of ideal-class coordinates

Prefix: `TauCeti.RingK0.`.

| Name | Contract and use |
| --- | --- |
| `rankClassGroupEquiv` | The equivalence (9), used for S-integers and arithmetic class maps. |
| `steinitzClass` | The second additive coordinate, obtained from determinant by `equivPic` inverse. |
| `steinitzClass_of_prod_ideal` | The class of Rⁿ⊕I has Steinitz coordinate mk0 I. |
| `rankClassGroupEquiv_symm_mk0` | Evaluation of (9)'s inverse on any integral representative I. |
| `rankClassGroupEquiv_ideal` | [I] maps to (1,mk0 I). |
| `rankClassGroupEquiv_one_sub_ideal` | [R]−[I] maps to (0,(mk0 I)⁻¹). |
| `rankClassGroupEquiv_eq` | The equivalence is the composite of (6) with identity on ℤ and `equivPic` inverse on Pic. |

The five tests are `rankClassGroup_int_test`: [ℤ³]↦(3,1);
`rankClassGroup_zero_test`: 0↦(0,1), [R]↦(1,1), with no ideal assigned to
the zero module; `rankClassGroup_representative_test`: a relation
(a)I=(b)J with a,b nonzero gives the same inverse image at rank one;
`rankClassGroup_nonprincipal_test`: a nonprincipal I has a different image
from [R] despite equal rank; and `rankClassGroup_equivPic_test`: applying
`equivPic` to the second coordinate gives (6) exactly.

## Localization and arithmetic rings

Fix a multiplicative set M of nonzero elements of R and let
S_M be the height-one primes whose ideals meet M. The actual localized ring R_M
is canonically R-isomorphic to the valuation-defined overring

\[
 \mathcal O_{S_M}=
 \{x\in K: v(x)\leq1\text{ for every height-one }v\notin S_M\}.
 \tag{11}
\]

This is the library's `Set.integer`; the inequality uses its multiplicative
valuation convention. Every m∈M has valuation one away from S_M, so its inverse
belongs to this overring. For the other localization condition consider the
nonzero denominator ideal Dₓ={r:rx∈R}. If it missed M, the prime-disjointness
lemma would put it inside a nonzero prime disjoint from M. At that prime x is
integral, which says Dₓ is not contained in that prime, a contradiction.
Hence some m∈M clears x. Injectivity supplies the kernel condition. The
localization universal property proves (11), `localization-eq-integer`.
This is the Dedekind intersection description in Weibel I §3, p. 19, and the
set of primes in Exercise 3.8(a), p. 25.

Tau Ceti already computes the class group of `Set.integer`. Transporting that
calculation along (11) yields `localization-class-group`, the planet
**Relative class groups**:

\[
 \operatorname{Cl}(R_M)\simeq
 \operatorname{Cl}(R)/\langle[\mathfrak p]:\mathfrak p\cap M\ne\varnothing\rangle.
 \tag{12}
\]

The quotient sends an ideal class to its extension, is surjective, and has
exactly that kernel. It is not necessary to reprove the existing ideal
factorization theorem. Combining (9), (10) and (12) gives `k0-localization`:
the rank stays fixed, the second coordinate is the quotient map, and the
kernel is generated by [𝔭]−[R] for primes meeting M. Under the Cartan map,
the resolution 0→𝔭→R→R/𝔭→0 gives [R/𝔭]=[R]−[𝔭], the negative of this
chosen kernel generator. The generated subgroup is unchanged; the signed
boundary in an arithmetic localization row must retain that minus sign.

For a number field F, `k0-ring-of-integers` applies (9) to the existing
Dedekind domain 𝓞_F. The rank-zero subgroup is the finite class group, of order
the existing class number h_F; it is exactly the torsion subgroup of K₀.
The group is finitely generated with free rank one, and is ℤ precisely when
h_F=1. For S a set of finite primes,
`k0-s-integers` uses the actual ring 𝓞_{F,S}=S.integer F and gives

\[
 K_0(\mathcal O_{F,S})\simeq
 \mathbb Z\oplus
 \left(\operatorname{Cl}(\mathcal O_F)/\langle[\mathfrak p]:\mathfrak p\in S\rangle\right).
 \tag{13}
\]

The quotient factor is finite. Extension from 𝓞_F preserves rank and quotients
the class coordinate, with kernel generated by [𝔭]−[𝓞_F], 𝔭∈S. The
class-group assertion for `Set.integer` already holds in the pinned library;
its K₀ consequence is the target here.

For the requested localization presentation when S is finite, finiteness of
the number-field class group gives positive integers h_𝔭 and elements a_𝔭≠0
with 𝔭^{h_𝔭}=(a_𝔭). Set a=∏a_𝔭, with empty product 1. The primes meeting
the powers of a are exactly S, so (11) identifies 𝓞_{F,S} with 𝓞_F[1/a].
The choices do not change its subring of F or the quotient map in (13).
This uses the principal-power argument at Milne §5, p. 90. The general
S-integer localization criterion and this torsion-class-group specialization
are already owned by `ArithmeticKTheory:N.1/S-integers-as-a-localisation` and
`S-integers-localisation-of-torsion-class-group`; this paragraph records the
arithmetic application and imports their contract rather than proposing new
nodes. These consumer nodes are not foundational prerequisites for (11)–(13).
For a general Dedekind domain and an arbitrary S, one cannot simply assert
that S.integer K is a localization at a set cutting out precisely S.

**Checks.** M={1} gives R and zero kernel. M=R∖{0} gives K, kills all ideal
classes and retains ℤ. S empty gives 𝓞_F. Over ℚ, all class groups are trivial,
so every finite-prime localization still has K₀=ℤ. A nonprincipal prime killed
by localization must give a nonzero reduced class before localization.

## The normalized norm and finite-flat transfer

Let R→B be a finite injective extension of Dedekind domains. In native
hypotheses B is a finite torsion-free R-algebra; it is therefore finite
projective and flat over R. No separability, Galois or unramified hypothesis
is imposed. Put d=rank_R B and σ=det_R B∈Pic R. The fraction fields form a
finite extension of degree d. Restriction of a finite projective B-module is
finite projective over R, as in Z.1.

The construction `pic-norm` transports the existing `ClassGroup.relNorm`:

\[
 N_{B/R}=\operatorname{equivPic}_R\circ
 \operatorname{ClassGroup.relNorm}\circ\operatorname{equivPic}_B^{-1}.
 \tag{14}
\]

It is a homomorphism Pic B→Pic R. For a nonzero ideal J of B it sends [J]
to the Picard class of the existing ideal norm `Ideal.relNorm R J`. In
particular N(1)=1, and N(B⊗L)=Lᵈ follows from the pinned
`ClassGroup.relNorm_extendedHom` and `pic-map-extended-hom`.
The norm is not redefined as the unnormalized determinant of a restricted line.

The bridge from (14) to a determinant uses the construction `index-ideal`.
For any commutative ring R, modules L,N and a linear map f:L→N, define

\[
 \mathfrak c(f)=\operatorname{im}
 \bigl(N^\vee\otimes_R L\longrightarrow R,\quad
       \varphi\otimes l\longmapsto\varphi(f(l))\bigr). \tag{15}
\]

This is an ideal without injectivity or invertibility hypotheses. If L,N are
invertible and f is injective over a domain, the evaluation map in (15) is
injective: it is tensoring f with the flat dual of N, followed by the existing
evaluation equivalence N∨⊗N≅R. It identifies its source with a nonzero
invertible ideal. Thus

\[
 [L]_{\mathrm{Pic}}=[\mathfrak c(f)]_{\mathrm{Pic}}[N]_{\mathrm{Pic}}.
 \tag{16}
\]

These are `index-ideal-evaluation` and `invertible-injection-class`.
Changing bases or composing with module isomorphisms preserves the ideal
(`index-ideal-congr`); this invariance needs neither a domain nor injectivity
of f, since the automorphisms induce automorphisms of the evaluation source.
In free rank one a map given by a has ideal (a), even
when a=0 (`index-ideal-free`). Localization commutes with (15) when N is finite
projective, using Z.3's dual-base-change comparison
(`index-ideal-localisation`). That finiteness hypothesis cannot be dropped
by treating all duals as commuting with scalar extension.

For a nonzero ideal J⊆B, J and B have rank d as R-modules. The inclusion
induces an injective map Λᵈ_R J→Λᵈ_R B between invertible modules:
after extension to K it is an isomorphism, and its source is torsion-free.
This is `top-exterior-inclusion-injective`. The decisive equality is

\[
 \mathfrak c(\Lambda^d(J\hookrightarrow B))=
 \operatorname{Ideal.relNorm}_R(J). \tag{17}
\]

Here is the proof route for `index-ideal-eq-rel-norm`, using the pinned ideal
norm rather than an assumed global basis. Localize at each maximal ideal 𝔭 of
R. The finite integral extension B_𝔭 of the DVR R_𝔭 is a semilocal Dedekind
domain and a PID; J_𝔭 has a nonzero generator x. The R_𝔭-module B_𝔭 is finite
free of rank d. Precomposing the localized ideal inclusion with multiplication
by x identifies its top exterior map with multiplication by
norm_{B_𝔭/R_𝔭}(x). Formula (15) is therefore the ideal generated by that norm.
The library's `Ideal.spanIntNorm_localization`, `Ideal.spanNorm_singleton` and
`Algebra.intNorm_eq_norm` give precisely the same principal ideal for the
localization of `Ideal.relNorm R J`. Equality at every maximal ideal gives
(17). If R is a field, B is a field, J=B and both sides are the unit ideal.
This argument uses local freeness of B, not a global integral basis.

Equations (16)–(17) give `ideal-restriction-determinant`:
det_R J = N([J])σ. Apply Steinitz over B to a rank-r projective Q. At positive
rank write Q≅Bʳ⁻¹⊕J and multiply determinants after restriction. At rank zero
Q=0 and the formula is 1=1. Together with the fraction-field tower law
(`restriction-rank`) this proves `restriction-determinant`:

\[
 \operatorname{rank}_R\operatorname{Res} Q=dr,\qquad
 \det_R(\operatorname{Res} Q)=N_{B/R}(\det_B Q)\,\sigma^r. \tag{18}
\]

Both sides are additive invariants of Q, with Pic written multiplicatively.
The existing universal property extends the result to every virtual class,
including negative ranks. The planet **Norm formula for the transfer**,
`k0-transfer-coordinates`, is

\[
 f_*(r,C)=(dr,N_{B/R}(C)\sigma^r),\qquad r\in\mathbb Z. \tag{19}
\]

The transfer is an additive homomorphism, with the projection formula for the
K₀(R)-module structure. Composing with (10) gives

\[
 f_*f^*(n,L)=(dn,L^d\sigma^n)=[B]\,(n,L). \tag{20}
\]

Thus the algebra determinant is required already by the class [B]. If σ=1,
(20) is multiplication by d on the additive group, which raises a Picard
coordinate to its d-th power; it does not fix that coordinate. Conversely,
equality with multiplication by d on every coordinate would force σ=1 by
applying it to [R]. Weibel II Example 2.8.1, p. 13, supplies the transfer;
Exercise 2.2(a)–(b), p. 14, supplies the valid projection-formula direction.
The imported source correction E16 excludes the generally false assertion
about the opposite composite.

For B=∏Bᵢ with finitely many Dedekind-domain factors finite and injective over
R, write dᵢ=rank_R Bᵢ, σᵢ=det_R Bᵢ and xᵢ=(rᵢ,Cᵢ).
Z.2's product equivalence and additivity of restriction give
`restriction-determinant-product`:

\[
 f_*x=\left(\sum_i d_i r_i,
       \prod_i N_{B_i/R}(C_i)\sigma_i^{r_i}\right). \tag{21}
\]

The rᵢ may differ. There is no single exponent rank x for the global line
∏σᵢ unless the component ranks agree.

For a finite extension F⊆F′ of number fields the library supplies finite
injective 𝓞_F→𝓞_F′ of rank [F′:F]. `number-field-extension-k0` specializes
(10) and (19), with ClassGroup.extendedHom for pullback and
ClassGroup.relNorm(C)·St(𝓞_F′/𝓞_F)ʳ for the transfer coordinate. For S-integer
extensions, the arithmetic application uses exactly all primes above S in F′,
as in `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`. Inverting extra
upstairs primes cannot be assumed to leave the extension finite. This consumer
specialization does not introduce a backward prerequisite from Z.4 to N.1.

### API of the Picard norm

Prefix: `CommRing.Pic.`. All extension hypotheses are those preceding (14).

| Name | Contract and use |
| --- | --- |
| `relNorm` | The multiplicative homomorphism (14), used in (18)–(21). |
| `relNorm_equivPic` | N(equivPic_B c)=equivPic_R(ClassGroup.relNorm c). |
| `relNorm_mk_ideal` | For nonzero J, N([J]) is the Picard class of its ideal norm. |
| `relNorm_mapAlgebra` | N(B⊗L)=Lᵈ. |
| `relNorm_self` | For R→R it is the identity homomorphism. |
| `relNorm_relNorm` | Norms compose in a tower of finite injective Dedekind extensions. |
| `relNorm_det_restrict` | For a line L over B, det_R Res L=N(L)σ; this is (18) at r=1. |

The five tests are `relNorm_self_test`: the identity extension gives the
identity; `relNorm_integers_test`: the norm from ℤ[√−5] to ℤ kills the nontrivial
Picard class, since Pic ℤ is trivial; `relNorm_equivPic_test`: comparison with
the library norm and the value 1 on a nonzero principal ideal;
`relNorm_unnormalised_test`: unnormalized restricted determinant sends the
identity line B to σ, which is nontrivial whenever B is not free over R,
whereas N(1)=1; and `relNorm_ext_test`: at degree two a class of order two
has N(f*L)=L²=1. These distinguish the norm, restriction of a determinant,
and an incorrect identity map on ideal classes.

### API of the index ideal

Prefix: `Module.Invertible.`. The namespace does not impose invertibility on
the definition; its hypotheses are stated separately for each operation.

| Name | Contract and use |
| --- | --- |
| `indexIdeal` | The ideal (15), for arbitrary linear f over a commutative ring. |
| `indexIdeal_zero` | The zero map has zero ideal. |
| `mem_indexIdeal` | a belongs exactly when it is the evaluation of some tensor in N∨⊗L. |
| `indexIdeal_tmul` | Every φ(f(l)) belongs to the ideal. |
| `indexIdeal_congr` | Pre- and post-composition by invertible-module automorphisms preserve the ideal over every commutative ring, for arbitrary f. |
| `indexIdeal_localisation` | Localization of the ideal equals the ideal of the localized map when N is finite projective. |

The three tests are `indexIdeal_id_test`: the identity map of ℤ has unit ideal;
`indexIdeal_six_test`: multiplication by 6 on ℤ has ideal (6);
and `indexIdeal_zero_test`: the zero map of ℤ has zero ideal. The middle
case prevents a definition that only detects whether f is zero; the first and
last distinguish the two extreme ideals. Localizing the middle case at (5)
gives the unit ideal, while at (2) its image is still (6).

**Transfer checks.** For B=R all formulas are identities. For Q=B, (18) gives
σ=N(1)σ; for Q=0 it gives 1. Over ℤ the class term is trivial and restriction
multiplies rank by d. A negative virtual class −[B] must have transfer
(−d,σ⁻¹). Over R×R the projective supported on one factor has transfer [R],
which checks componentwise ranks in (21). Formula (20), applied to [R], detects
any missing σ term without assuming B is free.

## Worked nonprincipal ideal

The application `nonprincipal-ideal-class` uses A=ℤ[√−5] and
I=(2,1+√−5). Z.2 owns the explicit nonfree projective ideal and I²=(2).
The node `zsqrtd-neg-five-integers` identifies this actual `Zsqrtd (−5)` with
the ring of integers in Tau Ceti's quadratic number-field model; its integral
generator squares to −5. It imports the quadratic-integers and class-number
declarations, rather than defining another number field.

Milne Example 4.6, p. 71, computes the two ideal classes. The ideal I has norm
two. If I were principal, a generator a+b√−5 would have norm two, giving
 a²+5b²=2, which has no integer solution. Thus [I]_Pic≠1. Its square is the
principal ideal (2), so its class has order two. Equation (1) gives
I⊕I≅A⊕I²≅A². For x=[I]−[A],

\[
 \operatorname{rank}x=0,\quad\det x=[I]_{\mathrm{Pic}}\ne1,
 \quad x\ne0,\quad 2x=0,
 \quad K_0(A)\simeq\mathbb Z\oplus\mathbb Z/2. \tag{22}
\]

The coordinates of [A], [I], x are (1,0), (1,1), (0,1), writing the class
group additively. This gives an actual test of rank failing to distinguish
projectives and an actual torsion class in K₀. Localizing at 2 kills the only
nontrivial class, since the only prime over 2 is I and I²=(2), so (12) gives
K₀(A[1/2])≅ℤ. Restriction to ℤ sends [I] to rank two and x to zero, agreeing
with (19) and the trivial Picard group of ℤ.

## Source corrections, coverage and suggested signatures

The imported plan already records corrections that affect this layer. The
fresh chapter reads preserve them: I Exercise 3.8(b), p. 25, has an unexplained
rank n for units after inverting a prime element; one such element contributes
one free generator (E1). The proof of II Proposition 2.6, p. 11, interchanges
P and Q in an exterior-power summand; the direct-sum argument uses matching
indices (E2). II Exercise 2.2(b), p. 14, must not be used to assert that
pullback after transfer is always degree multiplication on K₀(B) (E16).
The Dedekind paragraph in I §3, p. 18, needs nonzero ideals for its Picard
representatives (E18). These are existing findings in the owner packet,
not newly duplicated errata records or claims about a printed edition.
The independent review also confirms the imported Cohen corrections in the
11 July 2001 manuscript. Lemma 1.2.20, p. 9 (PDF p. 23), needs a nonzero
scaling scalar (E6). Theorem 1.2.19 on that page needs the rank-zero exception
that its proof treats separately on p. 10 (E17). Proposition 2.2.13, p. 82
(PDF p. 96), must first clear denominators for a fractional ideal: for
I=(1/2)ℤ over ℚ its prescribed integral element would need negative valuation
at 2 (E29). Apply the integral-ideal proof to δI and divide the resulting
element norms by N(δ). The theorem remains valid. All seven confirmations are
recorded under `sourceIssueImports.checked`; their original review and novelty
search provenance is retained in the owner packet.

Every target of Z.4 is supplied by the 43 imported nodes. Their dependency
closure has no unresolved stage leaves and meets none of the three gaps in
the Z.3 companion. This part adds no mathematical gap or supplier request,
and preserves `source_decomposed` coverage with an empty remaining list.
That is a planning status; no implementation is claimed. In particular it
neither closes Z.3 nor resolves the general geometric Picard, representation
or enhanced determinant gaps elsewhere in that packet.

The suggested file is a compact subset on native pinned carriers. It states
ideal-sum, Steinitz, existence of the reduced-class homomorphism, rank/Pic and
rank/class-group equivalences with generator and inverse formulas, stable-class
injectivity and cancellation. It gives actual small bodies for (14) and (15),
and examples for the existing square-zero ring, index ideal, normalized norm
and S-integer quotient. All admitted declarations are theorems. The existence
statements avoid pretending that heavy rank and determinant constructions
already have data definitions at the pins.

| Imported construction | Treatment of its full API and tests |
| --- | --- |
| `reduced-line-class` (8 API, 4 tests) | The existence theorem states the defining value on every line. Bundled named homomorphism, rank/determinant and ring API and four named tests remain the precise README targets above. |
| `rank-pic-equivalence` (9 API, 5 tests) | Existence theorem on native SplitK0 and Pic, rank on every finite projective and the inverse on every integer and line. Named rank/determinant maps and the nine API/five test declarations are README targets. |
| `rank-pic-ring-equiv` (8 API, 4 tests) | Existing `TrivSqZeroExt` has multiplication examples. K₀'s finite-projective monoidal instance is a Z.3 target; the ring equivalence and all eight API/four tests stay in the README. |
| `rank-class-group-equivalence` (7 API, 5 tests) | Native existence theorem with the fixed `ClassGroup.equivPic` coordinate and explicit inverse. Named coordinate maps and seven API/five tests stay in the README. |
| `pic-norm` (7 API, 5 tests) | Real homomorphism body, comparison and extension-power signatures and three examples. Ideal/top-exterior determinant and tower API, and all five named tests, have the exact mathematical contracts above. |
| `index-ideal` (6 API, 3 tests) | Real evaluation-range body, nonzero/invertible milestone and all three concrete examples. Full named API remains specified above. |

The top-exterior comparison (17), determinant (18), transfer map (19), their
product and arithmetic specializations and localization's K₀ map require
constructions already assigned to Z.1–Z.3. They remain fully stated README
targets, rather than auxiliary theory developed just to make this suggested
file longer. The native file elaborates at the pins with only intentional
admission warnings; this verifies signatures, not proofs. Assembly should
reuse these same IDs and the accepted companion nodes, incorporate the compact
signatures once, and retain all 45 API contracts and 26 tests in the roadmap.
