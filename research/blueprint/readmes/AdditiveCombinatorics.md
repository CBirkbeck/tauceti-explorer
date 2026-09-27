# Additive combinatorics, higher Fourier analysis and primes

## Scope and library boundary

This document specifies the finite-character normalization interface in AC.0
and its quantitative large-spectrum and Bohr-set continuation into AC.1.
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

## AC.0 quantitative indicator estimates

Write \(1_A\) for the complex indicator of a finite subset \(A\subseteq G\)
and \(\rho=|A|/N\). No new indicator or density carrier is introduced.
The following three interfaces expose Tao notes 2, §6, equations (1)–(2):

- fourier_norm_le_l1: for every complex function and character,
  \(|\widehat f(\chi)|\le N^{-1}\sum_x|f(x)|\). Expand the finite average,
  use norm_sum_le and AddChar.norm_apply, then cancel the character norms.
- fourier_indicator_l2: \(\sum_\chi|\widehat{1_A}(\chi)|^2=\rho\).
  Specialize fourier_plancherel; the indicator's squared norm counts \(A\).
- fourier_indicator_norm_le: \(|\widehat{1_A}(\chi)|\le\rho\).
  Apply the preceding L1 bound and count the indicator support.

The estimates include the empty set. They use the probability measure on \(G\)
and the counting measure on the dual fixed above.

fourier_indicator_fourth_le, the notes' equation (5), states
\[
 \sum_\chi|\widehat{1_A}(\chi)|^4\le\rho^3.
\]
Bound one squared factor by \(\rho^2\), sum, and use the L2 identity.

fourier_indicator_fourth_ge_of_small_doubling, equation (4), assumes \(A\ne
\varnothing\), \(K>0\), and \(|A+A|\le K|A|\), and states
\[
 \rho^3/K\le\sum_\chi|\widehat{1_A}(\chi)|^4.
\]
Its non-routine dependency is fourier_energy. The already-pinned
Finset.le_card_add_mul_addEnergy gives
\(|A|^4\le|A+A|E(A,A)\le K|A|E(A,A)\).
Cancel the positive \(|A|\), substitute the mixed-energy identity and cancel
\(N^3\). This route does not create a second Cauchy–Schwarz energy theorem.

The inherited fourier_plancherel, fourier_nconv, nconv_indicator and
fourier_energy interfaces now have complete independent scratch proofs.
In particular, nconv_indicator uses Finset.card_nbij' on the bijection
\(a\mapsto(a,x-a)\), not sumset membership. The conversion
\(z\overline z=|z|^2\) is the pinned Complex.mul_conj' identity.
These checks strengthen the evidence for the existing contracts; no
implementation is included in the suggested file.

## AC.1: large spectra and fourth-moment concentration

### Definition, uses and API

For \(f:G\to\mathbb C\) and a real absolute threshold \(\tau\), largeSpectrum
specifies the finite set
\[
 \operatorname{Spec}_\tau(f)
   =\{\chi\in\widehat G:\tau\le|\widehat f(\chi)|\}.
\]
The inequality is non-strict. This is the existing finite filter of the
already specified character-indexed transform, not a new dual group.
For the notes' relative threshold use \(\tau=\varepsilon\rho\).

Its uses determine the API. Equation (3) counts resonant frequencies;
equation (6) isolates their fourth moment; equation (7) bounds the number
of character constraints in the subsequent Bohr-set argument. The present
contract supplies those precise inputs to the Bohr-set argument below.
The Bohr-to-progression step and its Minkowski input remain open.

The six construction-facing API obligations are:

- mem_largeSpectrum: membership is exactly the displayed inequality.
- largeSpectrum_antitone: \(a\le b\) implies
  \(\operatorname{Spec}_b(f)\subseteq\operatorname{Spec}_a(f)\).
- largeSpectrum_of_nonpos: every character belongs when \(\tau\le0\).
  In particular the zero function at threshold zero has full spectrum.
- largeSpectrum_zero: the zero function has empty spectrum for \(\tau>0\).
- largeSpectrum_character: for a character \(\psi\) and \(0<\tau\le1\),
  the spectrum of \(x\mapsto\psi(x)\) is the singleton \(\{\psi\}\).
  This is agreement with fourier_character, not a cyclic-only convention.
- largeSpectrum_smul: if \(c\ne0\), then
  \(\operatorname{Spec}_{|c|\tau}(cf)=\operatorname{Spec}_\tau(f)\).
  The nonzero condition is essential: multiplication by zero also collapses
  the threshold to zero.

### Quantitative interfaces and dependencies

largeSpectrum_card_mul_sq_le assumes \(\tau\ge0\) and states
\[
 |\operatorname{Spec}_\tau(f)|\tau^2
   \le N^{-1}\sum_x|f(x)|^2.
\]
Bound each retained squared coefficient below by \(\tau^2\), include the
retained sum in the nonnegative full sum, and use Plancherel.
The threshold-zero conclusion is merely \(0\le N^{-1}\sum|f|^2\);
division by \(\tau^2\) is not valid there.

fourier_fourth_tail_le states, for every real \(\tau\),
\[
 \sum_{\chi\notin\operatorname{Spec}_\tau(f)}|\widehat f(\chi)|^4
 \le \tau^2 N^{-1}\sum_x|f(x)|^2.
\]
On the complement the coefficient norm is strictly less than \(\tau\).
Use this to bound a squared factor and include the remaining nonnegative
sum in the full L2 sum. A nonpositive threshold has empty complement,
so the unrestricted real parameter causes no division or sign problem.

largeSpectrum_indicator_card_mul_sq_le specializes the cardinal estimate:
\[
 |\operatorname{Spec}_\tau(1_A)|\tau^2\le\rho
 \quad(\tau\ge0).
\]
For \(A\ne\varnothing\), \(\varepsilon>0\), \(\tau=\varepsilon\rho\),
division yields the notes' equation (3),
\(|\operatorname{Spec}_{\varepsilon\rho}(1_A)|
 \le\varepsilon^{-2}\rho^{-1}\).
No bound involving \(\rho^{-1}\) is asserted for the empty set.

fourier_indicator_fourth_tail_le specializes the tail inequality to
\[
 \sum_{\chi\notin\operatorname{Spec}_{\varepsilon\rho}(1_A)}
       |\widehat{1_A}(\chi)|^4
 \le\varepsilon^2\rho^3.
\]
It holds for every real \(\varepsilon\); if \(\varepsilon\le0\), the
complement is empty. The source's positive small-\(\varepsilon\) range
is included, and this extension follows from the same finite inequality.

For \(A\ne\varnothing\) and \(K>0\), put
\(\tau=\rho/(2\sqrt K)\). The two source outputs are separate interfaces:

- largeSpectrum_indicator_card_at_sqrt:
  \[
   |\operatorname{Spec}_\tau(1_A)|\le 4K/\rho.
  \]
  This cardinal estimate needs no small-doubling hypothesis: it follows
  already from the threshold choice and the indicator L2 mass.
- fourier_indicator_largeSpectrum_concentration additionally assumes
  \(|A+A|\le K|A|\) and states
  \[
   \frac34\sum_\chi|\widehat{1_A}(\chi)|^4
    \le\sum_{\chi\in\operatorname{Spec}_\tau(1_A)}
       |\widehat{1_A}(\chi)|^4.
  \]
  The tail is at most \(\rho^3/(4K)\), whereas the full fourth moment
  is at least \(\rho^3/K\). Subtract the tail using the finite
  complementary-sum identity. This is exactly the source's concentration
  conclusion, with no unverified Bohr-set estimate inserted.

Every non-routine step has its own named interface above. The concentration
depends on the fourth-moment lower bound and tail bound; the lower bound
depends on fourier_energy; energy depends on Plancherel, fourier_nconv and
nconv_indicator. There is no reverse dependency. The square-root evaluation
uses \(K>0\) and Real.sq_sqrt.

### Discriminating tests

The suggested file adds eight tests S1–S8:

1. The zero function on \(\mathbb Z/4\) at threshold zero has full spectrum.
2. At threshold one it has empty spectrum.
3. Any character at threshold one has its singleton spectrum.
4. At threshold two that character has empty spectrum.
5. The function \(2i\psi\) at threshold two has spectrum \(\{\psi\}\).
6. On \(\mathbb Z/4\), \(\delta_0\) at threshold \(1/4\) has full spectrum.
7. The same point mass at threshold \(1/3\) has empty spectrum.
8. On \((\mathbb Z/2)^2\), \(\delta_0\) at threshold \(1/4\) has full spectrum.

These distinguish strict from non-strict cutoffs, unnormalized transforms,
zero from positive thresholds, the complex norm from real-part scaling,
and cyclic-only implementations. The eight examples were also proved in
scratch against concrete finite-average definitions, independently of all
suggested placeholders.

### Pinned baseline locators for this continuation

All entries below were read at the Mathlib pin. Where the indexed declaration
is multiplicative, its source carries the additive-generation annotation;
the additive companion was exercised in the scratch proofs.

| Indexed declaration | Source file and line | Use |
| --- | --- | --- |
| Fintype.prod_equiv | Algebra/BigOperators/Group/Finset/Defs.lean:742 | Generated sum_equiv for convolution reindexing. |
| Finset.card_nbij' | Data/Finset/Card.lean:411 | Indicator representation-count bijection. |
| Finset.mulEnergy_eq_sum_sq | Combinatorics/Additive/Energy.lean:136 | Generated additive-energy representation squares. |
| Finset.le_card_mul_mul_mulEnergy | Combinatorics/Additive/Energy.lean:154 | Existing additive Cauchy–Schwarz bound. |
| Complex.mul_conj' | Analysis/Complex/Basic.lean:356 | Complex-to-real squared norm conversion. |
| Complex.norm_natCast | Analysis/Complex/Norm.lean:115 | Probability normalization. |
| norm_sum_le | Analysis/Normed/Group/Basic.lean:809 | Coefficient L1 bound. |
| AddChar.norm_apply | Analysis/Normed/Ring/Finite.lean:36 | Unit-modulus finite character values. |
| Finset.prod_le_prod_of_subset_of_one_le' | Algebra/Order/BigOperators/Group/Finset.lean:160 | Generated nonnegative subsum comparison. |
| Finset.prod_mul_prod_compl | Algebra/BigOperators/Group/Finset/Basic.lean:182 | Generated complementary-sum partition. |
| Real.sq_sqrt | Analysis/Real/Sqrt.lean:178 | Exact positive-\(K\) threshold constants. |

Whole-library and packet/index searches found no pinned large-spectrum
definition or Fourier-energy comparison. The elementary finite-set, character,
energy, norm and sum machinery is reused. Candidate AC.1 planets are
Large spectrum and Fourier concentration under small doubling; these remain
display proposals until the preserving whole-roadmap packet is reconciled.

## Inherited spectrum verification

The preceding [checkpoint PR #3195](https://github.com/CBirkbeck/tauceti-explorer/pull/3195)
reported complete scratch proofs of 38 general statements and eight spectrum
examples, with exact cyclotomic and finite-group regressions. Those proof and
regression results remain predecessor evidence; this checkpoint does not claim
to have rerun their scripts. Its three definitions, 57 lemma signatures and
28 examples are retained unchanged and were freshly elaborated at both pins.

## AC.1: chord-radius Bohr sets

### Definition and uses

For a finite frequency set \(\Lambda\subseteq\widehat G\) and any real radius
\(\delta\), define the finite filter
\[
 B(\Lambda,\delta)=\{x\in G:\ |\chi(x)-1|<\delta
                         \text{ for every }\chi\in\Lambda\}.
\]
The proposed name is bohrSet. The radius measures a chord in the complex unit
circle and the inequality is **strict**. It is not the phase distance to the
nearest integer. The carrier and characters remain the pinned Finset and
AddChar types. This construction generalizes the bicharacter presentation in
Tao notes 2, §6, equation (9), printed p.11 (PDF p.37), without choosing a
self-duality. Every estimate below uses only the character laws and finite
Fourier identities, so it applies to arbitrary finite abelian groups.

Equation (9) constrains the resonant frequencies in equation (8); the intended
consumer is the containment in \(2A-2A\) below. The next source step represents
cyclic phase constraints as lattice constraints. That use calls for frequency
restriction, intersection, radius comparison, negation and addition. Pullback
along a group homomorphism transports constraints through the quotient and
coordinate presentations already used by AC.0. No lattice theorem is consumed
by the present containment argument.

### Construction API

Each row is a separate suggested lemma. Here \(\Lambda,\Gamma\) are finite
frequency sets, \(\delta,\varepsilon\in\mathbb R\), and \(q:G\to H\) is an
additive homomorphism of finite abelian groups. The trivial character is 1.

| Interface | Exact obligation and proof |
| --- | --- |
| mem_bohrSet | Membership is the displayed conjunction; unfold the finite filter. |
| bohrSet_empty | \(B(\varnothing,\delta)=G\), even when \(\delta\le0\), by vacuity. |
| bohrSet_of_nonpos | If \(\Lambda\ne\varnothing\) and \(\delta\le0\), then \(B(\Lambda,\delta)=\varnothing\). A member would have a nonnegative norm strictly below zero. |
| zero_mem_bohrSet_iff | \(0\in B(\Lambda,\delta)\) iff \(\delta>0\) or \(\Lambda=\varnothing\). Use \(\chi(0)=1\) and a frequency witness when the family is nonempty. |
| bohrSet_mono | \(\delta\le\varepsilon\) implies \(B(\Lambda,\delta)\subseteq B(\Lambda,\varepsilon)\). |
| bohrSet_antitone | \(\Lambda\subseteq\Gamma\) implies \(B(\Gamma,\delta)\subseteq B(\Lambda,\delta)\). |
| bohrSet_union | \(B(\Lambda\cup\Gamma,\delta)=B(\Lambda,\delta)\cap B(\Gamma,\delta)\); split the frequency conjunction. |
| neg_mem_bohrSet | \(-x\in B(\Lambda,\delta)\) iff \(x\in B(\Lambda,\delta)\), since \(\chi(-x)=\overline{\chi(x)}\) preserves chord length. |
| bohrSet_add_subset | \(B(\Lambda,\delta)+B(\Lambda,\varepsilon)\subseteq B(\Lambda,\delta+\varepsilon)\). Expand \(\chi(a+b)-1=(\chi(a)-1)+\chi(a)(\chi(b)-1)\), use the triangle inequality and \(|\chi(a)|=1\), and add the strict bounds. |
| bohrSet_sub_subset | The corresponding difference-set containment follows from negation and addition. Neither containment needs positive radii: a witness supplies the strict inequalities; an empty frequency set is vacuous. |
| bohrSet_erase_one | For \(\delta>0\), deleting the trivial character preserves the set. At \(\delta=0\), deleting the sole trivial character changes the empty set into the whole group, so the hypothesis is necessary. |
| bohrSet_pullback | \(B(\{\chi\circ q:\chi\in\Lambda\},\delta)=q^{-1}(B(\Lambda,\delta))\). Expand membership and image witnesses. No injectivity or surjectivity is required, and image collisions impose no extra constraint. |
| bohrSet_eq_univ_of_two_lt | If \(2<\delta\), the set is all of \(G\), since \(|\chi(x)-1|\le2\). Radius 2 itself need not suffice. |

### Fourfold convolution and support

Write \(\widetilde f(y)=\overline{f(-y)}\) and
\[
 Q_f=(f*f)*(\widetilde f*\widetilde f),
\]
using the existing probability-normalized convolution. This is an expression
in the existing API, not a separate construction.

fourier_quadconvolution is the coefficient identity
\[
 \widehat{Q_f}(\chi)=|\widehat f(\chi)|^4
 \qquad(f:G\to\mathbb C).
\]
Apply fourier_nconv three times, fourier_reflection twice, and rearrange the
product into \((z\overline z)^2\). Complex.mul_conj' converts it to the fourth
power of the norm. The conjugation in the reflection is essential for complex
inputs. This step neither assumes nor asserts that every value of \(Q_f\) is
real for arbitrary complex \(f\).

fourth_sum_eq_quadconvolution then applies fourier_inversion:
\[
 Q_f(x)=\sum_{\chi\in\widehat G}|\widehat f(\chi)|^4\chi(x).
\]
This is Tao's equation (8), now with the dual indexing made explicit.

indicator_quadconvolution_eq_count supplies the support argument with its
normalization and multiplicities:
\[
 Q_{1_A}(x)=N^{-3}
   |\{(a,b,c,d)\in A^4:a+b-c-d=x\}|.
\]
The worksheet uses the filter of \((A\times A)\times(A\times A)\).
Expand the three normalized convolutions. Their three averaging factors give
\(N^{-3}\). For outer variable \(y\) and inner variables \(z,t\), the
indicator arguments are \(z,y-z,-t,-x+y+t\). The change of variables
\[
 (a,b,c,d)=(z,y-z,-t,-x+y+t)
\]
is a bijection onto the quadruples with \(a+b-c-d=x\); its inverse is
\((y,z,t)=(a+b,a,-c)\). Conjugation fixes indicator values. Thus every
admissible quadruple contributes once, with no replacement of its count by
sumset membership. Finite-sum reindexing and Finset.card_filter finish the
identity. This is a finite algebraic specialization of nconv_apply, with no
new analytic prerequisite.

indicator_quadconvolution_ne_zero_iff states the exact support equivalence
\[
 Q_{1_A}(x)\ne0\quad\Longleftrightarrow\quad x\in(A+A)-(A+A).
\]
Because \(N>0\), the scalar is nonzero; the cardinal is nonzero exactly when
there is a quadruple. Finset.mem_add and Finset.mem_sub translate that witness
into membership. Conversely, expand the two sumset witnesses and form the
quadruple. This equivalence includes \(A=\varnothing\).

### Corrected positive real-part argument

For arbitrary nonnegative real weights \(w:\widehat G\to\mathbb R\), set
\[
 T=\sum_\chi w_\chi,\qquad H=\sum_{\chi\in\Lambda}w_\chi,
 \qquad S(x)=\sum_\chi w_\chi\chi(x).
\]
weighted_fourier_re_ge_of_bohrSet states, for \(x\in B(\Lambda,\delta)\),
\[
 (1-\delta)H-(T-H)\le\operatorname{Re}S(x).
\]
For frequencies in \(\Lambda\), the chord bound and
\(|\operatorname{Re}(\chi(x)-1)|\le|\chi(x)-1|\) give
\(\operatorname{Re}\chi(x)\ge1-\delta\). Off \(\Lambda\), unit modulus gives
\(\operatorname{Re}\chi(x)\ge-1\). Multiply by nonnegative weights, sum the
two inequalities, and use the complementary-sum identity. This statement
retains the resonant mass \(H\) on the right scale; replacing it by \(T\)
at this step is the recorded source mistake E1.

weighted_fourier_re_ge_of_concentration specializes to
\(\delta=1/4\) and \(H\ge3T/4\):
\[
 \operatorname{Re}S(x)\ge\frac34 H-(T-H)
          =\frac74 H-T\ge\frac5{16}T.
\]
The source's immediate resonant estimate must be \(3H/4\), or \(9T/16\)
after concentration. Subtracting at most \(T/4\) gives the displayed bound.
Positivity additionally needs \(T>0\); the zero weight function is a necessary
boundary test. These two real-part interfaces have complete independent Lean
proof checks from the pinned norm and finite-sum facts.

### Containment and exact dependencies

For \(A\ne\varnothing\), \(K>0\) and \(|A+A|\le K|A|\), put
\[
 \rho=|A|/N,\qquad
 \Lambda=\operatorname{Spec}_{\rho/(2\sqrt K)}(1_A).
\]
bohrSet_largeSpectrum_subset_double_sub_double states
\[
 B(\Lambda,1/4)\subseteq(A+A)-(A+A).
\]
Use \(w_\chi=|\widehat{1_A}(\chi)|^4\). The inherited concentration lemma
supplies \(H\ge3T/4\); its fourth-moment lower bound supplies
\(T\ge\rho^3/K>0\). For every Bohr point the corrected estimate gives a
strictly positive real part, hence a nonzero Fourier sum. Substitute
fourth_sum_eq_quadconvolution and apply the exact support equivalence.
The inherited cardinal estimate supplies \(|\Lambda|\le4K/\rho\), while
zero_mem_bohrSet_iff makes this Bohr set nonempty. No positive density or
inverse-density assertion is made for the empty indicator.

The dependency order is: inherited convolution/reflection identities →
fourier_quadconvolution → fourth_sum_eq_quadconvolution; nconv_apply and the
finite representation bijection → indicator_quadconvolution_eq_count →
indicator_quadconvolution_ne_zero_iff; the Bohr membership API and pinned norms
→ the general weighted estimate → its concentration specialization. These
three chains meet the inherited concentration and positive fourth-moment
lemmas only in the containment theorem. There is no input from AC.2–AC.5,
Minkowski's theorem, or a choice of cyclic coordinates.

Candidate AC.1 planets are **Bohr set** (the reusable construction) and
**Bohr containment in the double difference set** (the source endpoint).
Together with the inherited six proposals there are eight candidate names;
no packet planets are allocated by this checkpoint.

### Tests, baseline and verification

The ten worksheet tests B1–B10 cover an empty frequency family at radius −1,
a singleton trivial frequency at radius zero and at positive radius,
the excluded antipode at radius 2 in \(\mathbb Z/4\), its radius-1/4 identity
set, the one-element group, the first-coordinate character on
\((\mathbb Z/2)^2\) with its two-element kernel, the value \(1/27\) of a
fourfold singleton convolution on \(\mathbb Z/3\), a full indicator, and the
zero fourth-moment sum. They test the strict cutoff, necessary radius
hypotheses, genuinely noncyclic transport, multiplicity, normalization and the
positive-mass condition. The suggested examples are typed specifications.

All new baseline citations were read at Mathlib 082e2d3, including the
surrounding assumptions. The finite Fourier and energy inputs remain the
previously specified comparisons; no pinned Bohr-set or Bogolyubov declaration
was found in either whole library, the declaration index, or existing packets.
The Bohr-Mollerup Gamma-function hits concern a different notion.

| Indexed declaration | Source file and line | Use |
| --- | --- | --- |
| AddChar.map_zero_eq_one / map_add_eq_mul | Algebra/Group/AddChar.lean:110 / 113 | Identity and addition constraints. |
| AddChar.norm_apply | Analysis/Normed/Ring/Finite.lean:36 | Unit-modulus character values. |
| AddChar.map_neg_eq_conj | Analysis/RCLike/Basic.lean:1285 | Reflection of constraints. |
| Complex.abs_re_le_norm | Analysis/Complex/Norm.lean:40 | Resonant and complementary real-part estimates. |
| Finset.prod_mul_prod_compl | Algebra/BigOperators/Group/Finset/Basic.lean:182 | Indexed multiplicative generator of sum_add_sum_compl, whose additive statement was exercised in Lean. |
| Complex.mul_conj' | Analysis/Complex/Basic.lean:356 | Fourth-power Fourier coefficient. |
| Finset.card_filter | Algebra/BigOperators/Group/Finset/Piecewise.lean:278 | Indicator quadruple count. |
| Finset.card_pos | Data/Finset/Card.lean:78 | Positive count is a witness. |
| Finset.mem_mul / mem_div | Algebra/Group/Pointwise/Finset/Basic.lean:337 / 556 | Indexed generators of mem_add and mem_sub; the generated additive statements were exercised in Lean. |
| Complex.ne_zero_of_re_pos | Analysis/Complex/Norm.lean:357 | Positive real part implies nonvanishing. |

The new signatures add one definition, 20 lemmas and ten examples. The full
suggested file has four definitions, 77 lemmas and 38 examples: 119 expected
proof-placeholder warnings, zero errors and no other warnings. All 8,482
reached Mathlib source files byte-match the pin; 36 Tau Ceti dependencies were
freshly built from their pinned sources.

Temporary complete Lean proofs checked all 13 Bohr API statements and both
weighted inequalities against an actual finite-filter definition. Separate
proofs checked the complex fourth-power algebra and the normalized count's
support equivalence. Their dependency checks contain no proof-placeholder
axiom. The probes were removed from the deliverable; the suggested worksheet
remains a planning file. The full Fourier/count identities and containment
are specified with proof outlines, not claimed as completed Lean proofs.

Exact rational complex arithmetic checked 550 indicator subsets in six groups,
4,234 quadruple-count/Fourier coefficients, 1,632 small-doubling cases,
3,771 Bohr nonvanishing/containment points, 648 arbitrary complex-function
coefficients, and 270 frequency/radius boundary families. An additional exact
radical calculation in \(\mathbb Z/32\) checks a non-kernel point with positive
chord length less than 1/4 and the corrected estimate for abstract weights.
The latter is a check of the weighted inference, not an asserted counterexample
to a stronger inequality for actual indicator spectra. None of these checks
uses a floating-point tolerance or establishes the unrestricted theorem alone.

## AC.1–AC.5: outstanding boundaries

AC.1 needs complete selected proofs for BSG, source-scoped Freiman theorems,
Bohr size/regularity, progression extraction and density increments, with
ambient-group and torsion hypotheses. The finite Fourier containment above
does not close those targets. A Bohr-to-progression proof using Minkowski's second theorem
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
