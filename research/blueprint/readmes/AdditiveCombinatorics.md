# Additive combinatorics, higher Fourier analysis and primes

## Scope and library boundary

This document specifies the finite-character normalization interface in AC.0.
The roadmap also owns AC.1–AC.5: additive structure, density progressions and
removal, higher uniformity and nilsequences, transference, and linear patterns
in primes. Their outstanding mathematical contracts are stated below. This
document is a partial specification, not a replacement for the nine accepted
nodes in the [integrated decomposition](../../../data/decompositions/AdditiveCombinatorics.json).
Those nodes retain their identities and source-provenance records until their
declaration-level reconciliation is complete.

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Characters, their basis and
orthogonality, cyclic Fourier inversion, finite-set convolution, additive
energy, Plünnecke–Ruzsa and compact Peter–Weyl theory already exist.
AC.0 supplies comparisons and usable normalization, not replacement carriers.
Accepted RS-03 assigns this interface to AC.0; finite-field trace characters
and Gauss/Jacobi sums belong to FF.1.

There is no generating-function or recurrence input to the finite identities
below. The retired FoundationsAndLibraryIntegration roadmap is not a supplier.
The unsupported CA.2 and retired LI.2 references in the campaign text are not
prerequisites of these declarations.

## AC.0: conventions and objects

Let \(G\) be an arbitrary finite abelian group, \(N=|G|\), and
\(\widehat G=\operatorname{AddChar}(G,\mathbb C)\). Since \(G\) contains zero,
\(N>0\), including for the trivial group. The group has probability counting
measure and the dual has ordinary counting measure. No isomorphism
\(G\cong\widehat G\) is chosen.

For \(f,g:G\to\mathbb C\), specify two normalization adapters:
\[
 \operatorname{fourier}(f)(\chi)
   =N^{-1}\sum_{x\in G}f(x)\overline{\chi(x)},\qquad
 \operatorname{nconv}(f,g)(x)
   =N^{-1}\sum_{y\in G}f(y)g(x-y).
\]
These are provisional interface names in the suggested file.
The closest baseline description of the first is RCLike.wInner with
RCLike.cWeight and the character in the **first** slot.
Its equivalent description is the coordinate of \(f\) in AddChar.complexBasis.
The second is exactly \(N^{-1}\) times DiscreteConvolution.addRingConvolution.

This convention agrees with Terence Tao, *Lecture notes 2 for 254A*, §6,
printed pp.8–11, in the
[118-page course compilation](https://www.math.cmu.edu/users/af1p/Teaching/AdditiveCombinatorics/Tao.pdf).
That discussion uses a bicharacter and explicitly describes the canonical
dual-indexed alternative. Its basic identities are assigned to Exercise Q3,
printed p.23. The arguments here reduce them to pinned character facts.
The notes' Bohr-set argument requires the corrections recorded in the handoff.
This reading does not cover the entire compilation or its Freiman proof.

### Existing implementation designs

[LeanAPAP's compact Fourier interface](https://github.com/YaelDillies/LeanAPAP/blob/3b79412fbe529449c472f0a5f866ee2e3be88b87/APAP/Prereqs/FourierTransform/Compact.lean)
already defines cft by this weighted inner product outside the pinned
libraries. Its source was inspected; it is prior art, not a baseline import.
Use its convention and naming direction when integrating the interface,
and coordinate any code port with its authors. This specification does not
copy its implementation.

The inspected, open
[Mathlib PR 41258](https://github.com/leanprover-community/mathlib4/pull/41258)
uses symmetric \(N^{-1/2}\) normalization. Its reviewer directs development
toward APAP's fuller API; it is not an accepted competing design. If that
symmetric transform \(U\) is exposed, the comparison is
\(U(f)=\sqrt N\,\operatorname{fourier}(f)\).
It cannot be substituted unchanged into the formulas below.

## Transform API and proof dependencies

All functions below are arbitrary complex-valued functions. Characters take
unit-modulus values, so conjugation of a character value is inversion.
The existing orthogonality facts are
\[
 N^{-1}\sum_x\psi(x)\overline{\chi(x)}=[\chi=\psi],
 \qquad
 \sum_{\chi\in\widehat G}\chi(x-y)=N[x=y].
\]
Use AddChar.wInner_cWeight_eq_boole and AddChar.sum_apply_eq_ite,
respectively. These are baseline inputs, not new nodes.

### Evaluation and linearity

fourier_apply gives the displayed finite average.
fourier_zero, fourier_add and fourier_smul assert complex linearity.
Finite-sum distributivity proves them without measure-theoretic assumptions.

For the point mass \(\delta_a\), fourier_single states
\[
 \widehat{c\delta_a}(\chi)=c\,\overline{\chi(a)}/N.
\]
Only the summand at \(a\) survives. fourier_character states
\(\widehat\psi(\chi)=[\chi=\psi]\), by row orthogonality.
Thus the constant function one transforms to a unit mass at the trivial
character, not to a constant function.

### Inversion and changes of index

fourier_inversion states
\[
 f(x)=\sum_{\chi\in\widehat G}\widehat f(\chi)\chi(x).
\]
Expand the coefficients, interchange the two finite sums, apply column
orthogonality, and cancel \(N\). The inverse is a sum, not an average.

fourier_eq_basis_repr identifies the coefficient with the corresponding
coordinate under AddChar.complexBasis.repr. Apply uniqueness of basis
coordinates to the expansion, using Module.Basis.repr_sum_self.
fourier_injective follows by reconstructing each value.
Neither statement requires rebuilding a character basis.

fourier_inversion_reindex accepts a finite type \(I\) and an explicit
equivalence \(e:I\cong\widehat G\), and states
\[
 f(x)=\sum_{i\in I}\widehat f(e(i))e(i)(x).
\]
Finite-sum reindexing proves it. This is the output FF.1 needs when its
trace-character theorem identifies the dual with a finite field.
An arbitrary bijection suffices; \(I\) needs no group structure.

### Inner product, Haar measure and Parseval

fourier_eq_wInner is equality with the probability-weighted inner product
\(\langle\chi,f\rangle\). Mathlib conjugates the first argument;
reversing the slots would conjugate the required coefficient.

fourier_eq_haarIntegral equips \(G\) with the discrete topology and its
multiplicative type-tag with its Borel measurable structure. It states
\[
 \widehat f(\chi)=\int_{\operatorname{Multiplicative}G}
       f(x)\overline{\chi(x)}\,d\operatorname{haarProb}(x),
\]
transporting functions by the type-tag equivalence.
TauCeti.integral_haarProb_eq_inv_mul_sum supplies the integral formula.
Reindex the finite sum along that equivalence; sums with different
index instances need not be definitionally equal.

fourier_parseval and fourier_plancherel state
\[
 N^{-1}\sum_x f(x)\overline{g(x)}
     =\sum_\chi\widehat f(\chi)\overline{\widehat g(\chi)},\qquad
 N^{-1}\sum_x|f(x)|^2=\sum_\chi|\widehat f(\chi)|^2.
\]
Insert the inverse expansion of \(g\), conjugate, interchange finite sums,
and recognize each coefficient of \(f\). For the second identity take \(g=f\),
identify \(z\overline z=|z|^2\), and take real parts.

Tau Ceti already proves compact-group Parseval through
tsum_conj_peterWeylCoeff_mul_peterWeylCoeff and tsum_norm_sq_peterWeylCoeff.
Its finite-group Haar measure is normalized counting measure by
haarProb_eq_smul_count. The integral equality fixes the measure convention;
identification with a chosen one-dimensional Peter–Weyl skeleton remains
a separate comparison obligation. Its completeness and coefficient reindexing
cannot be silently assumed.

### Symmetries and quotient maps

The symmetry lemmas specify:
\[
\begin{aligned}
 \widehat{f(\,\cdot-a)}(\chi)&=\overline{\chi(a)}\,\widehat f(\chi)
       &&(\text{fourier_translate}),\\
 \widehat{\psi f}(\chi)&=\widehat f(\chi/\psi)
       &&(\text{fourier_modulate}),\\
 \widehat{f(-\,\cdot)}(\chi)&=\widehat f(\chi^{-1})
       &&(\text{fourier_neg}),\\
 \widehat{\overline f}(\chi)&=\overline{\widehat f(\chi^{-1})}
       &&(\text{fourier_conj}),\\
 \widehat{\overline{f(-\,\cdot)}}(\chi)&=\overline{\widehat f(\chi)}
       &&(\text{fourier_reflection}).
\end{aligned}
\]
Translation and negation are bijections of the finite index set.
Modulation uses the character multiplication law. Conjugation commutes with
finite sums; the last identity combines the preceding two.
Mere reflection does not conjugate arbitrary complex functions' coefficients.

For an additive equivalence \(e:G\cong H\), fourier_equiv states
\(\widehat{f\circ e}(\chi\circ e)=\widehat f(\chi)\).
Reindex and use equal cardinalities.

For a surjective homomorphism \(q:G\to H\), fourier_quotient gives the same
equality. Every fibre is a translate of \(\ker q\), and
\(|G|=|\ker q||H|\) cancels its multiplicity.
fourier_quotient_zero states
\(\widehat{f\circ q}(\chi)=0\) whenever some \(a\in\ker q\) has \(\chi(a)\ne1\).
The latter requires no surjectivity: translation by \(a\) leaves the function
invariant and multiplies its coefficient by \(\overline{\chi(a)}\ne1\).
A final packet must link the fibre-cardinality argument to exact baseline
declarations.

## Convolution API and energy

nconv_apply evaluates the normalized sum.
nconv_eq_addRingConvolution compares it to the existing discrete convolution.
The bijection \(y\mapsto(y,x-y)\) identifies \(G\) with the addition fibre.
Reindex its sum and multiply by \(N^{-1}\); finiteness supplies summability.
No new convolution-existence predicate is needed.

The API includes nconv_comm, nconv_assoc, nconv_add_left, nconv_add_right,
nconv_smul_left, nconv_smul_right, nconv_zero_left and nconv_zero_right.
Commutativity follows from the baseline comparison; distributivity and scalar
compatibility follow by finite sums. For associativity, either reindex the
finite double sum or use injectivity and the Fourier-product identity.
The latter route puts fourier_nconv before nconv_assoc and must not introduce
a reverse dependency.

nconv_single states
\[
 (c\delta_a)*_N(d\delta_b)=(cd/N)\delta_{a+b}.
\]
Thus nconv_unit_left and nconv_unit_right use \(N\delta_0\).
An unscaled unit mass is not the convolution unit.

fourier_nconv states
\[
 \widehat{f*_N g}(\chi)=\widehat f(\chi)\widehat g(\chi).
\]
Expand both averages, put \(x=y+z\), and use the character law.
Both factors \(N^{-1}\) are essential. The proof uses finite reindexing and
distributivity, not an assumed convolution theorem.

For finite \(A,B\subseteq G\), use Finset.addConvolution, the natural number
\(r_{A,B}(x)\) of ordered representations \(x=a+b\).
nconv_indicator states
\[
 (1_A*_N1_B)(x)=r_{A,B}(x)/N.
\]
The bijection sends each admissible \(a\) to \((a,x-a)\).
Retain multiplicity: a nonempty fibre need not be a singleton.

fourier_energy relates the existing Finset.addEnergy to the spectrum:
\[
 E(A,B)=N^3\sum_\chi|\widehat{1_A}(\chi)|^2|\widehat{1_B}(\chi)|^2.
\]
Start with Finset.addEnergy_eq_sum_sq, substitute nconv_indicator,
apply Plancherel, and use fourier_nconv.
Neither set must be nonempty. Empty sets give zero; \(A=B=G\) gives \(N^3\).
These check the third power of \(N\).

## Cyclic comparison

For \(m>0\), zmod_character_comparison identifies AddChar.zmodAddEquiv at
\(r,x\) with ZMod.stdAddChar at \(xr\). Check the positive exponential sign
in both constructors; this is not an arbitrary identification of the dual.
fourier_zmod then states
\[
 \widehat f(\operatorname{zmodAddEquiv}(r))
     =m^{-1}\operatorname{ZMod.dft}(f)(r).
\]
The baseline cyclic transform uses counting measure and the negative phase.
Conjugating the character supplies exactly that phase. Positive modulus is
essential: the zero-modulus type represents an infinite group.

## Unit tests and consumers

The suggested file records eleven transform tests and nine convolution tests.
They are specifications; signature elaboration is not proof execution.

Transform tests F1–F11, in order:

1. On \(\mathbb Z/4\), the coefficient of \(\delta_1\) at frequency one is \(-i/4\).
2. On \(\mathbb Z/3\), distinct characters pair to zero.
3. A character has coefficient one at itself.
4. Zero has zero transform.
5. On \(\mathbb Z/1\), the transform is the sole function value.
6. On \((\mathbb Z/2)^2\), the coefficient of \(\delta_0\) is \(1/4\).
7. Coefficients equal the baseline basis coordinates.
8. On \(\mathbb Z/3\), frequency zero equals one third of the cyclic transform.
9. On \(\mathbb Z/4\), inversion uses the explicit cyclic character indexing.
10. Conjugate reflection of \(\delta_1\) has frequency-one coefficient \(i/4\).
11. The coefficient of \(i\chi\) at \(\chi\) is \(i\), detecting the wrong inner-product slot.

Convolution tests C1–C9, in order:

1. On \(\mathbb Z/3\), \(\delta_0*_N\delta_0\) has value \(1/3\) at zero.
2. On \(\mathbb Z/4\), \(4\delta_0\) is a left unit.
3. It is also a right unit.
4. Convolution with zero vanishes.
5. Constant-one functions convolve to one.
6. On \(\mathbb Z/4\), \(\delta_1*_N\delta_1\) has value \(1/4\) at two.
7. On \(\mathbb Z/3\), convolution equals one third of the baseline discrete convolution.
8. On the trivial group, convolution is scalar multiplication.
9. On \(\mathbb Z/3\), two indicators of \(\{0,1\}\) convolve to \(2/3\) at one.

The existing FF.1 node
FiniteFieldsAndCharacterSums:FF.1/fourier-expansion-of-multiplicative-character
consumes the transform, reindexed inversion and Parseval; Gauss sums are \(q\)
times normalized coefficients. Trace-character parametrization belongs to FF.1.
Coding's subspace/dot-product formula and ER.4's torsion specialization must
agree with this normalization. Shared character theory creates no prerequisite
on an entire coding or regulator stage.

Candidate AC.0 planets are Fourier transform, Fourier inversion, Parseval's
identity, and additive energy. These are display proposals, not allocated nodes.

## AC.1–AC.5: outstanding boundaries

AC.1 needs complete selected proofs for BSG, source-scoped Freiman theorems,
Bohr sets, regularity and density increments, with ambient-group and torsion
hypotheses. A Bohr-to-progression proof using Minkowski's second theorem
requests the exact statement from GN.1; Minkowski's first theorem does not
replace it. Apply the handoff's source corrections before using the inspected
notes' §6–7 transition.

AC.2 imports roth_3ap_theorem and roth_3ap_theorem_nat. Their corners threshold
does not certify the added Rahman bound
\[
 k\ge\exp\!\bigl(\exp(132\log(2)/\delta)\bigr),\quad 0<\delta<1,
\]
routed by PAPER-BENNETT-SIKSEK-20/101. The stronger threshold needs its original
edition and proof. All-length density progressions, Varnavides, and the chosen
removal/correspondence inputs need separate decomposition. The preserved
Szemerédi set-form node must require nonzero difference and a sufficiently
large prime cyclic modulus, or use an integer-interval formulation with distinct
terms.

AC.3 must extend the real prime-cyclic cube expression to complex conjugated
cubes, keeping \(U^1\) a seminorm and \(U^d\), \(d\ge2\), norms in the stated
setting. Interval and box comparisons serve actual consumers. Corrected GTZ,
quantitative inverse statements, filtered polynomial sequences and rational
Mal'cev data are distinct inputs. The accepted LieGroups overlap places global
unfiltered nilpotent exponential and smooth quotient infrastructure in its
Part II, not in a second AC.3 construction.

AC.4 retains all seven accepted transference-related nodes and their gaps.
Green–Tao 2008's Koopman–von Neumann route does not itself discharge the
separately requested dense-model and relative-counting targets. Select and
decompose those routes without deleting correct older mathematics.
A prime majorant must satisfy its actual linear-forms and correlation
conditions. Generic Selberg weights and Bombieri–Vinogradov do not certify
them. Growing-\(W\) prime counts, unread majorant estimates and divisor
maximal-order bounds remain exact analytic obligations.

AC.5 separates linear equations in primes, Möbius–nilsequence orthogonality
and the accepted number-field/Kai branch. State the local factors,
nonproportionality, complexity, region and torsion-cokernel hypotheses,
and request the consumed Type I/II and uniform progression estimates.
Qualitative inverse theorems do not supply quantitative box estimates.
This interface supplies neither a conjectural general prime-pattern assertion
nor general Chowla/Sarnak.

These are work in scope, not claims of closure. No stage is marked closed.

