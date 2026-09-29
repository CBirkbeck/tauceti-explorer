# Additive combinatorics, higher Fourier analysis and primes

## Scope and library boundary

This document specifies the finite-character normalization interface in AC.0
and its quantitative large-spectrum and Bohr-set continuation into AC.1.
It also plans, in AC.1, Gowers–Green–Manners–Tao's proof of Marton's conjecture (the
polynomial Freiman–Ruzsa conjecture) in characteristic 2, with the Shannon-entropy carrier it needs.
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
ambient-group and torsion hypotheses. The entropic route to Marton's conjecture in
characteristic 2 is now planned (last part of this document); the combinatorial BSG
theorem, Freiman over ℤ and in bounded torsion, and the PFR corollaries remain. The finite Fourier containment above
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

## AC.2–AC.4: the Green–Tao chain

The sections above are the AC.0 and AC.1 thread. This part covers the nine nodes of the
Green–Tao decomposition, which `research/blueprint/packets/AdditiveCombinatorics.json` carries.
Those nodes were accepted by `independent-review-REVIEW-EXT-08-EXT-16` on 16 September 2026
against Green–Tao arXiv:math/0404188v6, and the packet preserves their ids, statements,
hypotheses, proof steps, acceptance tests and source locators **byte-identical**. What this
section adds, and what the packet adds over the decomposition, is the declaration granularity a
packet needs: the dependency edges, and an API with unit tests for the two definitions and the
one construction.

**Conventions pinned here.** `Z_N` is `ZMod N`, and `N` is taken prime throughout the source so
that division by `2, …, k` and arbitrary linear changes of variable are available. Every
expectation `E(· | x ∈ Z_N)` is `Finset.expect` over the ambient group. `ν` always denotes a
measure in the source's sense, `E ν = 1 + o(1)`, never a measure in the sense of measure theory.
`k`-pseudorandom always carries the source's exact parameters: the `(k·2^{k-1}, 3k−4, k)`-linear
forms condition together with the `2^{k-1}`-correlation condition.

**Szemerédi's theorem is imported, not proved.** The source says so explicitly, and the node's
hypotheses record it together with the analytic inputs Green–Tao also assume. The gap list below
keeps that visible; it is not a defect of this plan but a property of the source.

### AC.2

**Coverage status: `partial`.**

#### `szemeredi-set-form-and-functional-form` — Szemeredi's theorem: set form, functional form, and the correspondence between them

*theorem* · planet **Szemerédi's theorem**

(Set form, Proposition 2.1) For every real delta > 0 and integer k >= 3 there is a minimal N_0(delta,k) < infinity such that whenever N >= N_0(delta,k) and A is a subset of Z_N := Z/NZ of cardinality at least delta N, A contains an arithmetic progression of length k. (Functional form, Proposition 2.3) For fixed 0 < delta <= 1 and k >= 1, if f : Z_N -> R_{>=0} satisfies 0 <= f(x) <= nu_const(x) = 1 for all x and E(f(x) | x in Z_N) >= delta, then E(f(x) f(x+r) ... f(x+(k-1)r) | x, r in Z_N) >= c(k,delta) - o_{k,delta}(1) for a constant c(k,delta) > 0 independent of f and N. The two forms differ in passing from sets to functions and in asserting the existence of >> N^2 progressions rather than one.

**Hypotheses.**
- N is a positive integer; throughout the source N is additionally assumed prime for the ambient group Z_N to admit division by 2,...,k and arbitrary linear changes of variable
- The functional form is stated with the density lower bound E(f) >= delta and the pointwise upper bound f <= 1; it is NOT a statement about indicator functions only
- c(k,delta) does not depend on f or N; the source records the explicit bound c(k,delta) >= exp(-exp(delta^{-c_k})) obtainable by combining Varnavides' argument with Gowers' quantitative Szemeredi
- IMPORT STATUS: Green-Tao do not prove Szemeredi's theorem. They write explicitly that they must assume it and that 'with this one (rather large!) caveat our paper is self-contained'; footnote 2 attached to that caveat (printed p. 4) adds that they also require standard facts from analytic number theory: the prime number theorem, Dirichlet's theorem on primes in arithmetic progressions, and the classical zero-free region (Lemma A.1).

**Construction or proof, in steps.**
1. Proposition 2.1 is quoted from Szemeredi's papers [37,38]; the source lists Gowers' bound N_0(delta,k) <= 2^{2^{delta^{-c_k}}} and Rankin's lower bound but proves neither.
2. The passage from Proposition 2.1 to Proposition 2.3 is attributed in the source to Varnavides: the set form gives one progression, and a combinatorial averaging argument over subprogressions upgrades this to a positive proportion of progressions. The source calls this 'combinatorial trickery (of a less trivial nature this time)' and cites a direct proof in [40].
3. Passing from sets to functions is described as easy, 'for instance by probabilistic arguments'.
4. No proof of either proposition is given in the source read.

**Acceptance tests.**
- Check the quantifier structure: N_0 depends on both delta and k, and no effective bound is used anywhere in the Green-Tao argument.
- Check the finite-to-positive-proportion step (Varnavides) separately from the existence statement; AC.2's acceptance condition requires exactly this correspondence to be proved, and it is NOT proved in the source read.
- Degenerate check: the r = 0 slice has weight 1/N in the average over (x,r) in Z_N^2, so in the dense functional form (0 <= f <= 1) it contributes (1/N) E(f^k) <= 1/N = o(1) and cannot affect the conclusion; in the sparse setting f <= nu the same slice is (1/N) E(f^k), which Green-Tao bound by O(N^{-1} log^k N) = o(1) for their f (printed p. 36). A deduction of a non-trivial progression from the lower bound c(k,delta) - o(1) must still record that r = 0 is negligible. [Corrected in review: the draft claimed the r = 0 term contributes E(f^k), which is not o(1); that omitted the 1/N weight.]

**Dependencies.**
- On the pinned libraries: `mathlib:ZMod`, `mathlib:Finset.expect`

**Sources.**
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Proposition 2.1 and Proposition 2.3 with the surrounding discussion, printed pp. 3-5.
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Section 2, paragraph after Conjecture 2.2, printed p. 4.

**Remaining in this layer.**
- Szemeredi's theorem itself is ASSUMED in the source read; no complete proof route (combinatorial, ergodic or Fourier-analytic) was read. AC.2 explicitly asks for 'one selected complete proof route' and this packet does not supply one.
- The Varnavides correspondence between the set form and the positive-proportion functional form is cited to [43] and [40] and was not read.
- Arithmetic removal lemmas: no source read.

### AC.3

**Coverage status: `partial`.**

#### `gowers-inner-product-and-uniformity-norm` — Gowers inner product, its positivity, and the U^d norms on Z_N

*definition* · planet **Gowers uniformity norms**

For d >= 0 and a {0,1}^d-tuple (f_omega) of functions in L^infinity(Z_N), the d-dimensional Gowers inner product is <(f_omega)>_{U^d} := E( prod_{omega in {0,1}^d} f_omega(x + omega . h) | x in Z_N, h in Z_N^d ). If f_omega does not depend on the last digit omega_d, the inner product can be rewritten as an average over h' in Z_N^{d-1} of the square of an inner average, hence is non-negative; in particular <(f)>_{U^d} >= 0 for d >= 1, and one defines ||f||_{U^d} := <(f)>_{U^d}^{1/2^d}. One has ||f||_{U^1} = |E(f)|, so U^1 is only a seminorm.

**Hypotheses.**
- The ambient group is Z_N with N prime; the averages are over x in Z_N and h in Z_N^d with normalized counting measure
- f_omega in L^infinity(Z_N) and real-valued in the source's usage
- Positivity (5.3) is proved only for d >= 1; the d = 0 case is trivial
- In the application d = k - 1 where k is the progression length

**Construction or proof, in steps.**
1. Definition 5.1 introduces the configuration {x + omega.h : omega in {0,1}^d}, called a cube of dimension d, and the inner product (5.1).
2. If f_omega is independent of omega_d, split omega = (omega', omega_d) and h = (h', h_d) and average first over x and h_d; (5.2) exhibits the result as E over h' of a square, giving positivity.
3. Setting all f_omega = f gives (5.3) and hence the definition (5.4) of the norm.
4. The d = 1 case gives ||f||_{U^1} = |E(f)|, which can vanish for f non-zero.
5. Read in review (printed pp. 12-13): applying Cauchy-Schwarz once in each digit gives the Gowers Cauchy-Schwarz inequality (5.5) |<(f_omega)>_{U^d}| <= prod_omega ||f_omega||_{U^d}, hence the triangle inequality; with ||1||_{U^d} = 1 (5.6) this gives the monotonicity ||f||_{U^{d-1}} <= ||f||_{U^d} (5.7) for d >= 2, and ||.||_{U^d} is a genuine norm for d >= 2 (the U^2 case via Kronecker delta test functions).

**API.**

| name | role | statement |
|---|---|---|
| `gowersInnerProduct` | constructor | For d ≥ 0 and a {0,1}^d-indexed family (f_ω) in L^∞(Z_N), the average 𝔼 over x ∈ Z_N and h ∈ Z_N^d of ∏_ω f_ω(x + ω·h). |
| `gowersInnerProduct_nonneg_of_indep_last` | structure | If f_ω does not depend on ω_d then the inner product equals an average over h' ∈ Z_N^{d-1} of a square, hence is ≥ 0; in particular ⟨(f)⟩_{U^d} ≥ 0 for d ≥ 1. |
| `gowersNorm` | constructor | ‖f‖_{U^d} := ⟨(f)⟩_{U^d}^{1/2^d}, well defined by the previous item for d ≥ 1. |
| `gowersNorm_U1_eq_abs_expect` | characterisation | ‖f‖_{U^1} = \|𝔼 f\|, so U^1 is a seminorm and not a norm. |
| `gowersNorm_nonneg` | structure | ‖f‖_{U^d} ≥ 0 for d ≥ 1. |
| `gowersInnerProduct_cauchy_schwarz` | relation | The Gowers–Cauchy–Schwarz inequality bounding ⟨(f_ω)⟩_{U^d} by the product of the ‖f_ω‖_{U^d}, which is what lets a single factor control a progression count. |

**Unit tests.** A wrong definition fails one of these.

- `gowersNorm.test_U1` (computation) — ‖f‖_{U^1} = |𝔼 f| for every f.
- `gowersNorm.test_constant_one` (computation) — ‖1‖_{U^d} = 1 for every d ≥ 1.
- `gowersNorm.test_U1_seminorm_only` (non-example) — A nonzero f with 𝔼 f = 0 has ‖f‖_{U^1} = 0, so U^1 is not a norm; an implementation asserting definiteness at d = 1 fails.
- `gowersNorm.test_nonneg_needs_indep` (degenerate) — Non-negativity of the inner product is proved via independence of the last digit; for a general family (f_ω) the inner product need not be real and non-negative, so the hypothesis may not be dropped.

**Where it is used.**
- `pseudorandom-measures-are-U-d-close-to-one` — The lemma is the statement that ‖ν − 1‖_{U^d} = o(1), so it is an estimate in this norm.
- `generalised-von-neumann-relative-to-a-pseudorandom-measure` — The progression count is bounded by inf_j ‖f_j‖_{U^{k-1}}, the norm defined here.
- `koopman-von-neumann-structure-theorem` — The Gowers-uniformity conclusion ‖(1 − 1_Ω)(f − 𝔼(f|B))‖_{U^{k-1}} ≤ ε^{1/2^k} is stated in this norm.

**Acceptance tests.**
- Check d = 2: <f_{00},f_{10},f_{01},f_{11}>_{U^2} = E(f_{00}(x) f_{10}(x+h_1) f_{01}(x+h_2) f_{11}(x+h_1+h_2)), the standard four-point average.
- Check that U^1 is only a seminorm; a formalization that declares U^d a norm for all d >= 1 is wrong at d = 1.
- Check the monotonicity ||f||_{U^{d-1}} <= ||f||_{U^d} (the source's (5.7), derived on printed p. 13 from (5.5) and (5.6), for d >= 2).

**Dependencies.**
- On the pinned libraries: `mathlib:ZMod`, `mathlib:Finset.expect`

**Sources.**
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Definition 5.1, (5.1)-(5.4), printed pp. 11-12; (5.5)-(5.7) and the U^1 remark, printed pp. 12-13.

**Remaining in this layer.**
- The two statements about pseudorandom measures that Chapter 5 of the source proves (Lemma 5.2 and Proposition 5.3) are recorded in this packet under AC.4, because they are statements about a pseudorandom majorant; AC.3 itself receives only the Gowers inner product and norm.
- The inverse theorem for the Gowers U^{s+1} norm and nilsequences (the stage's own named source route: Green-Tao-Ziegler arXiv:1009.3998 plus the April 2024 erratum) was NOT acquired or read. The Gowers norms and the generalised von Neumann estimate decomposed here are the direct part, not the inverse part.
- Nilmanifold and nilsequence complexity: no source read.
- Review note: Lemmas 5.4-5.5, the complete proof of Proposition 5.3 and (5.5)-(5.7) were read by REVIEW-EXT-08-EXT-16 (printed pp. 12-19) and are no longer outstanding for this source.
- The Gowers norm node now carries an api and unit tests, but the Gowers–Cauchy–Schwarz inequality is listed as an api item rather than planned as its own node; it needs one before this layer can be closed.

### AC.4

**Coverage status: `partial`.**

#### `pseudorandom-measures-are-U-d-close-to-one` — Lemma 5.2: a k-pseudorandom measure is o(1)-close to the constant measure in every U^d, d <= k-1

*lemma*

If nu : Z_N -> R_{>=0} is k-pseudorandom, then ||nu - nu_const||_{U^d} = ||nu - 1||_{U^d} = o(1) for all 1 <= d <= k-1.

**Hypotheses.**
- nu k-pseudorandom in the sense of Definition 3.3, i.e. it satisfies the (k 2^{k-1}, 3k-4, k)-linear forms condition and the 2^{k-1}-correlation condition
- Only the linear forms condition is used, and only with parameters (2^{k-1}, k, 1)
- The reduction to d = k-1 uses the monotonicity (5.7) of the U^d norms
- PLACEMENT NOTE: this statement is about a k-pseudorandom measure nu, which is AC.4's object ('construct pseudorandom majorants, dense-model and relative counting theorems'), so it is parented at AC.4. The Gowers-norm definitions it uses stay at AC.3, matching the atlas edge AC.3 -> AC.4. Parenting it at AC.3 would make AC.4 a prerequisite of AC.3 and reverse that edge.

**Construction or proof, in steps.**
1. Reduce to d = k-1 by (5.7); raising to the power 2^{k-1}, it suffices to show E( prod_{omega in {0,1}^{k-1}} (nu(x + omega.h) - 1) ) = o(1).
2. Expand the product as a signed sum over subsets A of {0,1}^{k-1} of E( prod_{omega in A} nu(x + omega.h) ) with sign (-1)^{|A|}.
3. Each such expectation is of the form E(nu(psi_1(x)) ... nu(psi_{|A|}(x))) with x = (x,h_1,...,h_{k-1}) in Z_N^k and the psi_i an ordering of the forms x + omega.h for omega in A; no two of these forms are rational multiples of each other, so the (2^{k-1}, k, 1)-linear forms condition applies and each expectation is 1 + o(1).
4. The signed sum of the constants 1 vanishes by the binomial theorem, sum_{A} (-1)^{|A|} = (1-1)^{2^{k-1}} = 0, leaving o(1).

**Acceptance tests.**
- Check the parameter bookkeeping: the number of forms is at most 2^{k-1}, the number of variables is k, and the coefficients are 0/1, so (2^{k-1}, k, 1) suffices and is implied by k-pseudorandomness.
- Check the non-proportionality hypothesis: the forms x + omega.h for distinct omega are pairwise non-proportional as tuples of coefficients; this must be verified, not assumed.
- Counterexample check: the source warns that the linear forms condition is strictly stronger than smallness of ||nu-1||_{U^d}, so this lemma is not reversible.

**Dependencies.**
- Inside this roadmap: `gowers-inner-product-and-uniformity-norm`, `linear-forms-correlation-and-pseudorandomness`

**Sources.**
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Lemma 5.2 with proof, printed pp. 13-14.

#### `generalised-von-neumann-relative-to-a-pseudorandom-measure` — Proposition 5.3: U^{k-1} control of the weighted progression count under a pseudorandom majorant

*theorem* · planet **Generalised von Neumann estimate**

Let nu be k-pseudorandom and let f_0,...,f_{k-1} in L^1(Z_N) satisfy |f_j(x)| <= nu(x) + 1 for all x and all j. Let c_0,...,c_{k-1} be a permutation of some k consecutive elements of {-k+1,...,-1,0,1,...,k-1}. Then E( prod_{j=0}^{k-1} f_j(x + c_j r) | x, r in Z_N ) = O( inf_{0<=j<=k-1} ||f_j||_{U^{k-1}} ) + o(1).

**Hypotheses.**
- nu k-pseudorandom (Definition 3.3). Only the linear forms condition is used in the proof: through Lemma 3.4 for the normalization, the (2^d, k-1+d, k) instances giving P_d = 1 + o(1), and the (2^{k-1}, k, 1), (2^{k-2}(k+1), 2k-2, k) and (k 2^{k-1}, 3k-4, k) instances in Lemma 5.5. The correlation condition is NOT used here; the source states that its only use in the paper is in the proof of Lemma 6.3 (printed p. 24). [Corrected in review: the draft said both conditions are used.]
- The pointwise bound is by nu + 1, NOT by nu; the source explains that this is needed because the functions to which it is applied have the shape f - E(f|B) with E(nu|B) essentially bounded by 1
- The c_j must be a permutation of k CONSECUTIVE integers within {-k+1,...,k-1}; in practice c_j = j
- The implied constant in O(.) and the rate in o(1) depend on k and on the decay rates in the pseudorandomness conditions
- PLACEMENT NOTE: this statement is about a k-pseudorandom measure nu, which is AC.4's object ('construct pseudorandom majorants, dense-model and relative counting theorems'), so it is parented at AC.4. The Gowers-norm definitions it uses stay at AC.3, matching the atlas edge AC.3 -> AC.4. Parenting it at AC.3 would make AC.4 a prerequisite of AC.3 and reverse that edge.

**Construction or proof, in steps.**
1. Normalize by replacing nu with (nu+1)/2 and dividing the f_j by 2; Lemma 3.4 guarantees that (nu+1)/2 is again k-pseudorandom, so one may assume |f_j| <= nu.
2. After the normalization one may also assume nu > 0 everywhere; permuting the f_j one may assume the infimum of ||f_j||_{U^{k-1}} is attained at j = 0, and shifting x one may assume c_0 = 0, so it suffices to prove (5.13) (printed pp. 14-15).
3. For nu = nu_const the statement is the classical generalised von Neumann theorem ([19, Theorem 3.2]); the novelty is the extension to a pseudorandom majorant (remark after Proposition 5.3, printed p. 14).
4. Lemma 5.4 (Cauchy-Schwarz, valid for any measure nu, printed pp. 16-17): for maps phi_i : Z_N^{k-1} -> Z_N with phi_i independent of y_i and |f_i| <= nu, the quantities J_d of (5.17) and P_d of (5.18) satisfy |J_d|^2 <= P_d J_{d+1} for 0 <= d <= k-2; iterating gives (5.21) |J_0|^{2^{k-1}} <= J_{k-1} prod_{d=0}^{k-2} P_d^{2^{k-2-d}}.
5. Choice of forms (printed p. 18): phi_i(y) := sum_{j=1}^{k-1} (1 - c_i/c_j) y_j, so phi_i(y) = x + c_i r with x = y_1 + ... + y_{k-1}, r = -sum_i y_i/c_i; the map Phi(y) = (y_1 + ... + y_{k-1}, y_1/c_1 + ... + y_{k-1}/c_{k-1}) is a uniform cover of Z_N^2, so J_0 is the progression average (5.23); P_d = 1 + o(1) by the (2^d, k-1+d, k)-linear forms condition, giving (5.24) J_0^{2^{k-1}} <= (1 + o(1)) J_{k-1}.
6. Weighted cube (printed pp. 18-19): J_{k-1} = E(W(x,h) prod_{omega} f_0(x + omega.h)) with the weight W of (5.25); since the unweighted average is ||f_0||_{U^{k-1}}^{2^{k-1}}, it suffices by (5.12) and Cauchy-Schwarz to prove Lemma 5.5 ('nu covers its own cubes uniformly'): E(|W(x,h) - 1|^n prod_omega nu(x + omega.h)) = 0^n + o(1) for n = 0, 2, which reduces to three applications of the linear forms condition with parameters (2^{k-1}, k, 1), (2^{k-2}(k+1), 2k-2, k) and (k 2^{k-1}, 3k-4, k).
7. Reading status: the draft read only the statement and the normalization; the reviewer read the complete proof, printed pp. 14-19 (the proof ends on p. 19; pp. 19-22 already belong to Section 6, so the draft's range 'pp. 14-22' was inaccurate).

**Acceptance tests.**
- Check the bound nu + 1 rather than nu; a formalization that assumes |f_j| <= nu cannot be applied to f - E(f|B) at the point where the source applies it.
- Check the consecutive-integers hypothesis on the c_j; arbitrary distinct c_j are not covered by this statement.
- Sanity check with nu = 1: the conclusion reduces to the standard bound of a k-term progression average by the U^{k-1} norm.
- Check that the conclusion is an upper bound on the average, so it is useful only when one f_j is Gowers-uniform.

**Dependencies.**
- Inside this roadmap: `gowers-inner-product-and-uniformity-norm`, `linear-forms-correlation-and-pseudorandomness`, `pseudorandom-measures-are-U-d-close-to-one`

**Sources.**
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Proposition 5.3 with hypothesis (5.11) and the opening of its proof, printed p. 14.
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Lemma 5.4 with proof (printed pp. 16-17); proof of Proposition 5.3 and Lemma 5.5 with proof (printed pp. 18-19).

#### `linear-forms-correlation-and-pseudorandomness` — The linear forms condition, the correlation condition, and k-pseudorandomness, with exact parameters

*definition* · planet **k-pseudorandom measure**

A measure on Z_N is a function nu : Z_N -> R_{>=0} with E(nu) = 1 + o(1). nu satisfies the (m_0,t_0,L_0)-LINEAR FORMS CONDITION if for all m <= m_0, t <= t_0, all rational L_{ij} with numerator and denominator at most L_0 in absolute value, and all b_i in Z_N, the forms psi_i(x) = sum_j L_{ij} x_j + b_i with the t-tuples (L_{ij})_j non-zero and pairwise non-proportional satisfy E( nu(psi_1(x)) ... nu(psi_m(x)) | x in Z_N^t ) = 1 + o_{L_0,m_0,t_0}(1), with the decay uniform in b_1,...,b_m. nu satisfies the m_0-CORRELATION CONDITION if for every 1 < m <= m_0 there is a weight tau = tau_m : Z_N -> R_{>=0} with E(tau^q) = O_{m,q}(1) for all 1 <= q < infinity and E( nu(x+h_1) ... nu(x+h_m) | x in Z_N ) <= sum_{1<=i<j<=m} tau(h_i - h_j) for all h_1,...,h_m in Z_N, not necessarily distinct. nu is k-PSEUDORANDOM if it satisfies the (k 2^{k-1}, 3k-4, k)-linear forms condition and the 2^{k-1}-correlation condition.

**Hypotheses.**
- N is prime and larger than L_0, so that the rational coefficients L_{ij} make sense in Z_N
- In the linear forms condition, the tuples (L_{ij})_j must be non-zero and no two may be rational multiples of one another; the constants b_i are arbitrary and the error is uniform in them
- In the correlation condition the h_i are NOT assumed distinct, and tau is only required to have finite moments of every order, not to be bounded; the source explains that an L^infinity bound on tau would be false for the intended prime application
- The m = 1 case of the linear forms condition recovers the measure condition E(nu) = 1 + o(1)

**Construction or proof, in steps.**
1. Definition 3.1 states the linear forms condition and gives the instances (3.2), (3.3), (3.4) used later, with their parameter triples (4,3,1), (3,2,1) and (12,5,2).
2. Definition 3.2 states the correlation condition and explains why 1 + o(1) cannot be used on the right-hand side: the number of p <= N with p - h also prime is not bounded by a constant times N/log^2 N when h has many prime factors.
3. Definition 3.3 fixes the parameters for k-pseudorandomness; the source notes that the exact values are unimportant provided they depend only on k.
4. Lemma 3.4 shows the class is star-shaped about nu_const: if nu is k-pseudorandom so is (nu+1)/2, by expanding the linear forms condition into 2^m terms each of which is 1 + o(1); the source says the correlation condition 'is verified in a similar manner' without details.

**API.**

| name | role | statement |
|---|---|---|
| `IsMeasure` | constructor | ν : Z_N → R_{≥0} with 𝔼 ν = 1 + o(1). |
| `LinearFormsCondition` | constructor | The (m_0,t_0,L_0)-linear forms condition: for m ≤ m_0, t ≤ t_0, rational L_{ij} of height ≤ L_0 and arbitrary b_i, with the t-tuples (L_{ij})_j non-zero and pairwise non-proportional, 𝔼 ∏_i ν(ψ_i(x)) = 1 + o(1), uniformly in the b_i. |
| `CorrelationCondition` | constructor | The m_0-correlation condition: for each 1 < m ≤ m_0 a weight τ_m ≥ 0 with 𝔼 τ^q = O_{m,q}(1) for all finite q, and 𝔼_x ∏_i ν(x + h_i) ≤ ∑_{i<j} τ(h_i − h_j) for all h_i, not necessarily distinct. |
| `IsKPseudorandom` | characterisation | ν is k-pseudorandom exactly when it satisfies the (k·2^{k-1}, 3k−4, k)-linear forms condition and the 2^{k-1}-correlation condition. The three parameters are part of the definition and may not be left implicit. |
| `linearFormsCondition_uniform_in_b` | structure | The o(1) in the linear forms condition is uniform in b_1, …, b_m; a pointwise-in-b statement is weaker and does not suffice downstream. |
| `nuConst_isKPseudorandom` | example | The constant measure ν ≡ 1 is k-pseudorandom for every k, which is the degenerate case in which the relative Szemerédi theorem reduces to the functional form. |

**Unit tests.** A wrong definition fails one of these.

- `isKPseudorandom.test_constant` (degenerate) — ν ≡ 1 satisfies both conditions for every k, with τ ≡ 1 as the correlation weight.
- `isKPseudorandom.test_coincident_shifts` (non-example) — The correlation condition quantifies over h_1, …, h_m 'not necessarily distinct', so it constrains coincident shifts too; a definition restricted to distinct h_i is strictly weaker and fails this test. The Green–Tao majorant's verification needs the coincident case, and its proof handles it through an L^∞ bound on ν.
- `isKPseudorandom.test_nonproportional_forms` (non-example) — The linear forms condition requires the t-tuples (L_{ij})_j to be non-zero and pairwise non-proportional. Dropping non-proportionality makes the condition false for ν ≡ 1 composed with repeated forms, so an implementation omitting it fails.
- `isKPseudorandom.test_parameters` (computation) — k-pseudorandom unfolds to the (k·2^{k-1}, 3k−4, k)-linear forms condition and the 2^{k-1}-correlation condition; an implementation with different parameters is a different notion.

**Where it is used.**
- `pseudorandom-measures-are-U-d-close-to-one` — k-pseudorandomness is the hypothesis, and the linear forms condition is what the proof consumes.
- `generalised-von-neumann-relative-to-a-pseudorandom-measure` — The estimate is relative to a k-pseudorandom ν and majorises the f_j by ν + 1.
- `relative-szemeredi-theorem` — The theorem's hypothesis is that ν is k-pseudorandom and 0 ≤ f ≤ ν.
- `w-trick-and-goldston-yildirim-majorant` — The construction's purpose is to exhibit a measure satisfying exactly these two conditions.

**Acceptance tests.**
- Check that nu_const == 1 is k-pseudorandom for every k.
- Check (3.2) against Lemma 5.2 with k = 3: (3.2) is the full-cube instance (A = {0,1}^2) of the (4,3,1)-linear forms condition; the expansion (5.9) of ||nu - 1||_{U^2}^4 needs the (4,3,1)-condition for every subset A of {0,1}^2, not the single instance (3.2). [Corrected in review: the draft said the instance alone gives the U^2 bound.]
- Check the correlation condition on the diagonal h_1 = ... = h_m, where the left-hand side is E(nu^m) and the right-hand side is m(m-1)/2 . tau(0); this is where boundedness of tau would be too strong.
- Check Lemma 3.4 including the remark that (1-theta)nu + theta nu_const is k-pseudorandom for 0 <= theta <= 1.

**Dependencies.**
- On the pinned libraries: `mathlib:ZMod`, `mathlib:Finset.expect`

**Sources.**
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Definitions 3.1, 3.2, 3.3 and Lemma 3.4, printed pp. 7-9.

#### `relative-szemeredi-theorem` — Theorem 3.5: Szemeredi's theorem relative to a pseudorandom measure

*theorem* · planet **Relative Szemerédi theorem**

Let k >= 3 and 0 < delta <= 1 be fixed and let nu : Z_N -> R_{>=0} be k-pseudorandom. If f : Z_N -> R_{>=0} satisfies 0 <= f(x) <= nu(x) for all x in Z_N and E(f) >= delta, then E( f(x) f(x+r) ... f(x+(k-1)r) | x, r in Z_N ) >= c(k,delta) - o_{k,delta}(1), where c(k,delta) is the SAME constant as in the functional form of Szemeredi's theorem (Proposition 2.3). The o(1) decay rate is significantly slower than in Proposition 2.3 and depends on the decay rates in the linear forms and correlation conditions.

**Hypotheses.**
- nu k-pseudorandom; f non-negative and bounded pointwise by nu; E(f) >= delta
- The conclusion is a lower bound with the SAME constant c(k,delta) as in the dense case: no loss in the main term, only in the error term
- The source notes the statement is trivial when N = O_{k,delta}(1), so one is free to assume N large
- The proof uses no Fourier analysis, no additive combinatorics and no number theory; it is a blend of quantitative ergodic theory with combinatorial estimates related to Gowers uniformity and sparse hypergraph regularity

**Construction or proof, in steps.**
1. Apply the structure theorem (Proposition 8.1) to f with a small parameter epsilon, obtaining a sigma-algebra B and an exceptional set Omega in B with E(nu 1_Omega) = o_epsilon(1), ||(1-1_Omega) E(nu-1|B)||_infinity = o_epsilon(1) and ||(1-1_Omega)(f - E(f|B))||_{U^{k-1}} <= epsilon^{1/2^k}.
2. Set f_U := (1-1_Omega)(f - E(f|B)) and f_{U-perp} := (1-1_Omega) E(f|B). Then E(f_{U-perp}) = E((1-1_Omega) f) >= E(f) - E(nu 1_Omega) >= delta - o_epsilon(1), and f_{U-perp} is non-negative and bounded above by 1 + o_epsilon(1).
3. Apply the DENSE functional Szemeredi theorem (Proposition 2.3) to f_{U-perp}, obtaining the progression count >= c(k,delta) - o_epsilon(1) - o_{k,delta}(1). Footnote 16 (printed p. 29): f_{U-perp} is only bounded by 1 + o_epsilon(1) and has density >= delta - o_epsilon(1), so it is first modified by o_epsilon(1); the source calls this 'utterly trivial' and gives no further detail.
4. Apply the generalised von Neumann theorem (Proposition 5.3) to every mixed term in which at least one factor is f_U; since (1-1_Omega) f <= nu and f_{U-perp} <= 1 + o_epsilon(1), f_U is pointwise bounded by nu + 1 + o_epsilon(1), so each mixed term is O(epsilon^{1/2^k}) + o_epsilon(1).
5. Add the two estimates for f-tilde := f_U + f_{U-perp} = (1-1_Omega) f to get c(k,delta) - O(epsilon^{1/2^k}) - o_epsilon(1) - o_{k,delta}(1), and use 0 <= (1-1_Omega) f <= f to transfer the lower bound to f; since epsilon is arbitrary, taking N large depending on k and delta makes the errors small (printed p. 29).

**Acceptance tests.**
- Check that the same c(k,delta) appears on both sides: the transference loses nothing in the main term, which is the whole point.
- Check the two error sources separately: o_epsilon(1) from the structure theorem and o_{k,delta}(1) from dense Szemeredi; the order of limits (first N -> infinity, then epsilon -> 0) matters.
- Degenerate check: taking nu = nu_const recovers Proposition 2.3.
- Check that f <= nu (not f <= nu + 1) is the hypothesis here, while Proposition 5.3 is applied with the weaker bound nu + 1 + o(1); the bookkeeping between the two is where the exceptional set Omega is used.

**Dependencies.**
- Inside this roadmap: `szemeredi-set-form-and-functional-form`, `linear-forms-correlation-and-pseudorandomness`, `generalised-von-neumann-relative-to-a-pseudorandom-measure`, `koopman-von-neumann-structure-theorem`

**Sources.**
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Theorem 3.5 and its complete deduction from Proposition 8.1, printed pp. 9-10 and 29.

#### `koopman-von-neumann-structure-theorem` — Proposition 8.1: decomposition of a nu-bounded function into a Gowers-uniform and a bounded anti-uniform part, outside a small exceptional set

*theorem* · planet **Koopman–von Neumann decomposition**

Let nu be a k-pseudorandom measure, f in L^1(Z_N) with 0 <= f <= nu, let 0 < epsilon << 1 and N > N_0(epsilon). Then there exist a sigma-algebra B on Z_N and a set Omega in B such that (smallness) E(nu 1_Omega) = o_epsilon(1); (uniform distribution of nu outside Omega) ||(1 - 1_Omega) E(nu - 1 | B)||_{L^infinity} = o_epsilon(1); and (Gowers uniformity) ||(1 - 1_Omega)(f - E(f|B))||_{U^{k-1}} <= epsilon^{1/2^k}.

**Hypotheses.**
- nu k-pseudorandom; 0 <= f <= nu pointwise; epsilon small and N large depending on epsilon
- B is a sigma-algebra in the finitary sense of Definition 7.1 (a collection of subsets of Z_N closed under the Boolean operations), NOT a measure-theoretic sigma-algebra on an infinite space
- The exceptional set Omega is B-measurable, which is what makes 1 - 1_Omega commute with conditional expectation in the application
- The bound epsilon^{1/2^k} is the one used to balance against the O(.) in the generalised von Neumann theorem

**Construction or proof, in steps.**
1. Initialize B as the trivial sigma-algebra {empty set, Z_N}.
2. If f - E(f|B) is already Gowers uniform in the sense of (8.3), stop.
3. Otherwise use the machinery of dual functions of section 6 to produce a Gowers anti-uniform function D F_1 correlating non-trivially with f, and adjoin the level sets of D F_1 to B; the correlation forces the L^2 norm of E(f|B) to increase by a non-trivial amount, while pseudorandomness controls the damage.
4. Iterate (Proposition 8.2, the iterative step); the L^2 increment bounds the number of iterations, giving termination with the stated epsilon-dependence.
5. Reading status: the draft read the statement and the strategy paragraph (printed pp. 28-30); the reviewer read Sections 6-7, the proof of Proposition 8.1 and Proposition 8.2 with proof (printed pp. 19-34), summarized in the following steps.
6. Lemma 6.1 (printed pp. 20-21): for any F, <F, DF> = ||F||_{U^{k-1}}^{2^{k-1}} and ||DF||_{(U^{k-1})*} = ||F||_{U^{k-1}}^{2^{k-1}-1}, where DF(x) = E(prod_{omega != 0} F(x + omega.h) | h) is the dual function (6.3); if |F| <= nu + 1 then ||DF||_{L^infinity} <= 2^{2^{k-1}-1} + o(1) (6.6), by the linear forms condition in its non-homogeneous form (the only such use in the paper).
7. Proposition 6.2 (printed pp. 22-25): <nu - 1, Phi(DF_1,...,DF_K)> = o_{K,Phi}(1) for continuous Phi on I^K, I = [-2^{2^{k-1}}, 2^{2^{k-1}}], uniformly for Phi in a compact set; proved for polynomial Phi from Lemma 6.3 (a (U^{k-1})* bound on polynomials in dual functions, whose proof is the only use of the correlation condition, printed p. 24), Lemma 5.2 and (6.1), then by Weierstrass approximation.
8. Propositions 7.2-7.3 (printed pp. 26-28): a pigeonholed offset alpha gives B_{eps,eta}(G) with atoms G^{-1}([eps(n+alpha), eps(n+1+alpha))), O(1/eps) atoms, (7.1) ||G - E(G | B v B_{eps,eta}(G))||_infinity <= eps, and continuous approximants (7.2); for a join B of K such algebras of basic anti-uniform functions, Omega := union of the atoms A with E((nu+1)1_A) <= eta^{1/2} satisfies (7.5)-(7.6), using Proposition 6.2.
9. Proof of Proposition 8.1 from Proposition 8.2 (printed pp. 31-32): K_0 := least integer greater than 2^{2^k}/eps + 1; starting from B_0 = {empty, Z_N}, Omega_0 = empty, set F_{K+1} := (1 - 1_{Omega_K})(f - E(f|B_K)); stop with B := B_K, Omega := Omega_K when ||F_{K+1}||_{U^{k-1}} <= eps^{1/2^k}; otherwise B_{K+1} := B_K v B_{eps,eta}(DF_{K+1}) and Proposition 8.2 gives Omega_{K+1} containing Omega_K with (8.13)-(8.14) and the energy increment (8.15) of 2^{-2^k+1} eps; together with 0 <= E_K <= 1 + O_{K,eps}(eta^{1/2}) from (8.10) this forbids reaching K_0, and letting eta decay slowly turns the O_{K,eps}(eta^{1/2}) errors into o_eps(1).
10. Proof of Proposition 8.2 (printed pp. 32-34): (8.10)-(8.11) from (8.7) and 0 <= f <= nu; (8.17) from Lemma 6.1; Omega_{K+1} := Omega_K union the exceptional set of Proposition 7.3; the energy increment from |<F_{K+1}, DF_{K+1}>| = ||F_{K+1}||_{U^{k-1}}^{2^{k-1}} >= eps^{1/2}, (7.1), measurability in B_{K+1}, Cauchy-Schwarz (8.19) and an approximate Pythagoras argument in which the exceptional sets are controlled by (8.6) and (8.7).

**Acceptance tests.**
- Check that Omega is B-measurable: the deduction of Theorem 3.5 uses E((1-1_Omega) f) = E(f_{U-perp}) and the measurability is what makes this identity hold.
- Check the analogy limits: for k = 3 the source likens B to the Kronecker factor, but the statement is finitary and quantitative and must not be replaced by an infinitary ergodic statement.
- Check the role of nu in (8.2): the conclusion is that nu is uniformly distributed relative to B outside Omega, which is what allows E(f|B) to be treated as bounded by 1 + o(1).

**Dependencies.**
- Inside this roadmap: `gowers-inner-product-and-uniformity-norm`, `linear-forms-correlation-and-pseudorandomness`, `generalised-von-neumann-relative-to-a-pseudorandom-measure`

**Sources.**
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Proposition 8.1 with (8.1)-(8.3) and the following remarks, printed pp. 28-29.

#### `w-trick-and-goldston-yildirim-majorant` — The W-trick, the truncated divisor sum majorant, and the verification of pseudorandomness

*construction* · planet **Goldston–Yildirim majorant**

Let w(N) -> infinity sufficiently slowly and W := prod_{p <= w(N)} p (the source says w(N) << log log N suffices for the Dirichlet-theorem asymptotic sum_{n <= N} Lambda-tilde(n) = N(1+o(1)) on printed p. 35; Lemma 9.4 and Propositions 9.5 and 9.6 each impose further, unquantified, slow-growth requirements on w). Define the modified von Mangoldt function Lambda-tilde(n) := (phi(W)/W) log(W n + 1) if W n + 1 is prime, and 0 otherwise. Let Lambda_R(n) := sum_{d | n, d <= R} mu(d) log(R/d), set R := N^{k^{-1} 2^{-k-4}} and epsilon_k := 1/(2^k (k+4)!), and define nu(n) := (phi(W)/W) Lambda_R(W n + 1)^2 / log R for epsilon_k N <= n <= 2 epsilon_k N, and nu(n) := 1 otherwise. Then (Lemma 9.4) nu >= 0 and nu(n) >= k^{-1} 2^{-k-5} Lambda-tilde(n) on epsilon_k N <= n <= 2 epsilon_k N; (Lemma 9.7) E(nu) = 1 + o(1); (Proposition 9.8) nu satisfies the (k 2^{k-1}, 3k-4, k)-linear forms condition; (Proposition 9.10) nu satisfies the 2^{k-1}-correlation condition. Hence (Proposition 9.1) nu is a k-pseudorandom majorant of the modified primes.

**Hypotheses.**
- N is a sufficiently large PRIME; w(N) tends to infinity sufficiently slowly (the source notes that in the end w may be taken to be a constant depending only on k)
- The W-trick replaces the primes by the modified primes {n : W n + 1 is prime}, at the cost of a factor polynomial in W in the count; any residue b coprime to W would do in place of 1
- The range epsilon_k N <= n <= 2 epsilon_k N and the choice epsilon_k < 1/k are what make Z_N-progressions lift to genuine integer progressions (wraparound control)
- The verification of the linear forms condition rests on Proposition 9.5 (a generalisation of Goldston-Yildirim [17, Proposition 2]) whose hypotheses are: integer coefficients |L_{ij}| <= sqrt(w(N))/2, non-zero pairwise non-proportional coefficient tuples, and a product of t intervals each of length at least R^{10m}
- The correlation condition rests on Proposition 9.6, whose hypotheses are: m >= 1, B an interval of length at least R^{10m}, h_1,...,h_m DISTINCT integers with |h_i| <= N^2, N large depending on m and w(N) sufficiently slowly growing; it produces the extra factor prod_{p | Delta} (1 + O_m(p^{-1/2})) with Delta = prod_{i<j} |h_i - h_j|. This arithmetic factor (made into the weight of Lemma 9.9), together with the value tau(0) := exp(C m log N/log log N) needed for coincident h_i in the proof of Proposition 9.10, is why the weight tau of Definition 3.2 is only moment-bounded. [Corrected in review: the draft omitted the distinctness and size hypotheses and attributed the unboundedness to the arithmetic factor alone.]

**Construction or proof, in steps.**
1. Lemma 9.4: if W n + 1 is prime and larger than R, the divisor sum has the single term d = 1, so Lambda_R(W n + 1) = log R and nu(n) = (phi(W)/W) log R >= k^{-1} 2^{-k-5} Lambda-tilde(n).
2. Lemma 9.7: apply Proposition 9.5 with m = t = 1, psi_1(x_1) = x_1 and B = [epsilon_k N, 2 epsilon_k N] to get E(nu) = 1 + o(1).
3. Proposition 9.8 (printed pp. 38-40): given forms as in Definition 3.1 with m <= k 2^{k-1}, t <= 3k-4 and rational coefficients of height at most k, clear denominators (integer coefficients bounded by (k+1)!, which is < sqrt(w(N))/2 for N large); chop Z_N^t into Q^t boxes of side about N/Q with Q = Q(N) slowly growing, so N/Q > R^{10m}; on 'nice' boxes (each psi_i(box) inside or disjoint from [eps_k N, 2 eps_k N]) Proposition 9.5 gives 1 + o(1); on non-nice boxes bound nu by 1 + (phi(W)/(W log R)) Lambda_R^2 and apply Proposition 9.5 for O(1); non-nice boxes have proportion O(1/Q); footnote 22 absorbs the wraparound multiple of N into b_i. [Corrected in review: the draft described a partition of Z_N into intervals.]
4. Lemma 9.9 and Proposition 9.10 (printed pp. 40-42, read in review): tau_m(n) := O_m(1) prod_{p|n} (1 + p^{-1/2})^{O_m(1)} for n != 0 has E(tau^q) = O_{m,q}(1) (AM-GM and the bound prod_{p|n}(1 + p^{-1/4}) <= sum_{d|n} d^{-1/4}); set tau(0) := exp(C m log N/log log N); coincident h_i are handled by ||nu||_infinity << exp(C log N/log log N), from 'standard estimates for the maximal order of the divisor function' (not proved in the source); for distinct h_i bound nu by 1 + g with g = (phi(W)/W)(Lambda_R(Wn+1)^2/log R) 1_{[eps_k N, 2 eps_k N]}, expand the product over subsets A, restrict to |h_i - h_j| <= eps_k N and apply Proposition 9.6 and Lemma 9.9. Proposition 9.1 is then immediate from Lemma 9.4, Lemma 9.7, Propositions 9.8 and 9.10 and Definition 3.3 (printed p. 42).
5. PROOF-READING BOUNDARY: Propositions 9.5 and 9.6 are proved in Section 10 (printed pp. 42-49: Lemmas 10.1, 10.3, 10.5, 10.6 and Definition 10.2 reduce them to the contour-integral estimate Lemma 10.4 from [17]) and Appendix A (pp. 51-56, proof of Lemma 10.4 via Lemma A.1). Section 10 and the Appendix beyond Lemma A.3 were not read for this packet or by the reviewer. [Corrected in review: the draft gave pp. 43-56 and listed Lemma 9.9 as unread; Lemma 9.9 has now been read.]

**API.**

| name | role | statement |
|---|---|---|
| `wTrickModulus` | constructor | W := ∏_{p ≤ w(N)} p for a slowly growing w(N); the source needs w(N) ≪ log log N for the Dirichlet asymptotic, and Lemma 9.4 and Propositions 9.5 and 9.6 impose further unquantified slow-growth requirements. |
| `modifiedVonMangoldt` | constructor | Λ̃(n) := (φ(W)/W) log(Wn + 1) when Wn + 1 is prime and 0 otherwise. |
| `truncatedDivisorSum` | constructor | Λ_R(n) := ∑_{d ∣ n, d ≤ R} μ(d) log(R/d), the Goldston–Yildirim truncated divisor sum, a variant of the Selberg sieve weights owned by SieveMethodsAndPrimePatterns:SV.1. |
| `majorantNu` | constructor | ν(n) := (φ(W)/W) Λ_R(Wn+1)² / log R on ε_k N ≤ n ≤ 2ε_k N and ν(n) := 1 otherwise, with R := N^{k^{-1}2^{-k-4}} and ε_k := 1/(2^k (k+4)!). |
| `majorantNu_nonneg` | structure | ν ≥ 0 everywhere (Lemma 9.4). |
| `majorantNu_dominates` | relation | ν(n) ≥ k^{-1}2^{-k-5} Λ̃(n) on ε_k N ≤ n ≤ 2ε_k N (Lemma 9.4), which is what makes the endgame's f satisfy f ≤ ν. |
| `majorantNu_isKPseudorandom` | compatibility | ν is k-pseudorandom: the linear forms and correlation conditions hold, by Propositions 9.5 and 9.6 together with Lemma 9.7. |

**Unit tests.** A wrong definition fails one of these.

- `majorantNu.test_outside_range` (computation) — ν(n) = 1 for n outside [ε_k N, 2ε_k N]; an implementation defining ν by the divisor-sum formula everywhere fails.
- `majorantNu.test_nonneg` (degenerate) — ν(n) ≥ 0 for every n, the formula being a square divided by log R > 0.
- `modifiedVonMangoldt.test_shifted_primality` (non-example) — Λ̃(n) = 0 unless **Wn + 1** is prime. An implementation testing primality of n rather than of Wn + 1 is the W-trick's whole point and fails: the construction exists to move the primes into a single residue class coprime to W.
- `majorantNu.test_domination_constant` (computation) — The domination constant is k^{-1}2^{-k-5}, not 1: ν does not majorise Λ̃ itself, and the endgame's f carries that factor.

**Where it is used.**
- `prime-progressions-endgame` — The endgame applies the relative Szemerédi theorem to f ≤ ν with this ν, so the construction supplies both the domination and the pseudorandomness.
- `linear-forms-correlation-and-pseudorandomness` — This is the non-trivial example the definition exists for: a measure concentrated on the primes in one residue class that still satisfies both conditions.

**Acceptance tests.**
- Majorant check: nu(n) >= k^{-1} 2^{-k-5} Lambda-tilde(n) only on the window epsilon_k N <= n <= 2 epsilon_k N; outside it nu is set to 1 and majorizes nothing.
- Sparsity check: the primes themselves have density about 1/log N in [1,N] and therefore do NOT satisfy a positive-density hypothesis; the whole construction exists to supply a majorant of positive RELATIVE density. This is AC.4's stated acceptance condition.
- Local-obstruction check: the source explains (printed p. 35) that no k-pseudorandom nu can satisfy nu >= c(k) Lambda, because Lambda is supported on the phi(q) reduced residue classes mod q while a pseudorandom measure is equidistributed over all q classes; the W-trick removes this obstruction. A test should exhibit this failure for W = 1 rather than assume it.
- Parameter check: R = N^{k^{-1} 2^{-k-4}} and epsilon_k = 1/(2^k (k+4)!) must both be carried; the constraint length >= R^{10m} in Proposition 9.5 is what forces R to be a small power of N.

**Dependencies.**
- Inside this roadmap: `linear-forms-correlation-and-pseudorandomness`
- On other roadmaps, by stage id: `SieveMethodsAndPrimePatterns:SV.1`, `AnalyticNumberTheory:AN.2`

**Sources.**
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — The W-trick and Definition of Lambda-tilde, printed pp. 35-36.
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Definition 9.2, Definition 9.3, Lemma 9.4, Propositions 9.5, 9.6, Lemma 9.7, Proposition 9.8 (printed pp. 37-40), Lemma 9.9 and Proposition 9.10 (printed pp. 40-42).

#### `prime-progressions-endgame` — Deduction of Theorem 1.1 from the pseudorandom majorant and the relative Szemeredi theorem

*application*

Define f in L^1(Z_N) by f(n) := k^{-1} 2^{-k-5} Lambda-tilde(n) for epsilon_k N <= n <= 2 epsilon_k N and f(n) := 0 otherwise. Then E(f) = k^{-1} 2^{-k-5} epsilon_k (1 + o(1)) by Dirichlet's theorem on primes in arithmetic progressions; f <= nu by Lemma 9.4; so Theorem 3.5 applies with delta = k^{-1} 2^{-k-5} epsilon_k and gives E(f(x) f(x+r) ... f(x+(k-1)r)) >= c(k, k^{-1}2^{-k-5} epsilon_k) - o(1). The degenerate term r = 0 contributes at most O(N^{-1} log^k N) = o(1) and is discarded; since epsilon_k < 1/k every remaining progression in Z_N lifts to a genuine progression of integers. Hence the primes contain arithmetic progressions of length k for every k (Theorem 1.1). Theorem 1.2 is only sketched in the source (Section 11, printed pp. 49-50): the residue class 1 mod W must be replaced by a pigeonholed class b mod W with b coprime to W, density control is available only along a sequence N_1, N_2, ... (made prime by Bertrand's postulate), and the details are 'left to the reader'. [Corrected in review: the draft said Theorem 1.2 follows by the same argument.]

**Hypotheses.**
- N a large prime
- Dirichlet's theorem on primes in arithmetic progressions (in the quantitative form sum_{n <= N} Lambda-tilde(n) = N(1+o(1)) for the modulus W = W(N)) is used to compute E(f); the source notes in footnote 21 (printed p. 36) that only sum_{N <= n <= 2N} Lambda-tilde(n) >> N is needed, so one could avoid Dirichlet L-function theory by replacing n == 1 mod W with n == b mod W for a suitable b chosen by pigeonhole; Section 11 (printed p. 49) adds that w may in the end be a constant depending only on k
- epsilon_k < 1/k is what rules out wraparound, so that a k-term progression in Z_N with all terms in [epsilon_k N, 2 epsilon_k N] is a progression of integers
- The r = 0 contribution must be discarded explicitly; it is O(N^{-1} log^k N)
- The source obtains only the lower bound (gamma(k) + o(1)) N^2 / log^k N for the number of progressions, far from the Hardy-Littlewood asymptotic C_k N^2/log^k N

**Construction or proof, in steps.**
1. Compute E(f) using Dirichlet's theorem, giving a positive density delta depending only on k.
2. Verify 0 <= f <= nu from Lemma 9.4.
3. Apply Theorem 3.5 with this f and nu (which is k-pseudorandom by Proposition 9.1). The source applies it with delta = k^{-1} 2^{-k-5} eps_k although E(f) is only delta(1 + o(1)); any fixed smaller delta removes this slack.
4. Discard r = 0 and lift from Z_N to Z using epsilon_k < 1/k.
5. Conclude Theorem 1.1. Theorem 1.2 (A of positive relative upper density in the primes) is NOT proved in the source: Section 11 (printed pp. 49-50) lists the needed changes (pigeonholed residue class b mod W; density control along a sequence N_j made prime via Bertrand's postulate) and leaves the details to the reader.

**Acceptance tests.**
- Check the asymptotic claim carefully: the theorem proves infinitely many k-term progressions and a lower bound of order N^2/log^k N with a small constant gamma(k), NOT the Hardy-Littlewood asymptotic. A consumer must not cite this source for the asymptotic count.
- Check the wraparound argument explicitly; it is the only place where the constant epsilon_k is used.
- Check the discarded r = 0 term.
- Check that Theorem 1.2 needs positive relative UPPER density, i.e. limsup_{N} pi(N)^{-1} |A cap [1,N]| > 0.

**Dependencies.**
- Inside this roadmap: `relative-szemeredi-theorem`, `w-trick-and-goldston-yildirim-majorant`
- On other roadmaps, by stage id: `AnalyticNumberTheory:AN.2`

**Sources.**
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Proof of Theorem 1.1 assuming Proposition 9.1, printed p. 36.
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Section 1, statement of Theorems 1.1 and 1.2 and the remark on the count, printed pp. 1-2.
- Ben Green and Terence Tao, *The primes contain arbitrarily long arithmetic progressions* — Section 11, printed pp. 49-50 and footnote 23.

**Remaining in this layer.**
- Section 10 (printed pp. 42-49: Lemmas 10.1, 10.3, 10.5, 10.6, Definition 10.2) and Appendix A beyond Lemma A.3 (pp. 53-56, proof of Lemma 10.4): the proofs of Propositions 9.5 and 9.6 are unread.
- Titchmarsh, The Theory of the Riemann Zeta-function (2nd ed. 1986), Chapter 3 (Lemma A.1) and Chapter V (convexity bound used in the proof of Lemma A.3, printed p. 53): unread.
- Theorem 1.2 (positive relative upper density) is only sketched in the source (Section 11, printed pp. 49-50); a proof would need the pigeonholed residue class and the Bertrand's postulate adjustment worked out.
- Review note: Sections 6-7, Proposition 8.2 and Lemma 9.9 were read by REVIEW-EXT-08-EXT-16 (printed pp. 19-34, 40-42) and are no longer outstanding.
- The nine nodes are now at packet granularity with prerequisites, and the three definitions and constructions carry apis and unit tests. What remains for closure is unchanged: the unread interior (Section 10, Appendix A beyond Lemma A.3) behind Propositions 9.5 and 9.6, on which majorantNu_isKPseudorandom rests.

### Requests carried by this packet

The reviewed library audit records each of these as a layer duplicating one of ours, so it is
planned once by its owner and imported here.

- **`FiniteFieldsAndCharacterSums:FF.1`** — Additive characters of a finite abelian group and their orthogonality, the character side of the finite Fourier analysis AC.0 asks for. The reviewed audit records FF.1 as duplicating this layer, so it is planned there and imported here.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`** — Convolution operators, the Peter–Weyl Hilbert basis and Parseval for compact groups, already proved in Tau Ceti, of which Fourier analysis with normalised counting measure on a finite abelian group is the finite special case. The audit records this as duplicating AC.0.
- **`SieveMethodsAndPrimePatterns:SV.1`** — Selberg sieve weights, of which the Goldston–Yildirim truncated divisor sum Λ_R used for the majorant is a variant, as the reviewed audit records. The W-trick node imports the sieve weights and plans only the Green–Tao-specific verification that ν satisfies the linear forms and correlation conditions.
- **`AnalyticNumberTheory:AN.2`** — The prime number theorem, its fixed-modulus arithmetic-progression form, and the zero-free line and region — the prime-distribution inputs the transference proof names, and the ones Green–Tao say they assume alongside Szemerédi's theorem. Two of this packet's gaps turn on the precise form needed: the growing modulus W(N) in the endgame's Dirichlet asymptotic, and the exact zero-free region of the source's Lemma A.1.
- **`ExponentialSumsAndCircleMethod:ES.3`** — Singular series and local densities, the local factors of the linear-patterns asymptotic that AC.5 states. The audit records ES.3 as duplicating AC.5; no node of this packet plans AC.5.
- **`ExponentialSumsAndCircleMethod:ES.4`** — Sums-of-primes theorems by the circle method, overlapping the simplest linear patterns in primes of AC.5, per the reviewed audit.
- **`ProbabilisticAndMetricNumberTheory:PM.5`** — Multiplicative-function correlations and Sarnak-type statements, overlapping the Möbius orthogonality of AC.5, per the reviewed audit.

### Gaps

- **The atlas chain AC.0 -> AC.1 -> AC.2 -> AC.3 -> AC.4 encodes prerequisites that the Green-Tao proof does not consume.** Verified from the source: Green-Tao state that the proof of Theorem 3.5 'requires no Fourier analysis, additive combinatorics, or number theory; the argument is instead a blend of quantitative ergodic theory arguments with some combinatorial estimates related to Gowers uniformity and sparse hypergraph regularity' (printed p. 10), and separately that 'in this paper, we must assume Szemeredi's theorem. However with this one (rather large!) caveat our paper is self-contained' (printed p. 4). Reading sections 3, 5, 8 and 9 confirms that no sumset, energy, Plunnecke-Ruzsa, Balog-Szemeredi-Gowers, Freiman or Bohr-set result is used. Consequence for the atlas: along the selected GREEN-TAO route, AC.4 depends on AC.2 (Szemeredi, functional form) and on the Gowers-norm part of AC.3, but NOT on AC.0 or AC.1. The current linear chain makes AC.4 wait on Plunnecke-Ruzsa and Balog-Szemeredi-Gowers, which the source does not need. This packet does NOT delete the existing edges (AC.0 and AC.1 remain legitimate stages with their own content, and a Fourier-analytic route to Roth would use them); it records the mismatch so that a reviewer can decide whether to keep AC.0/AC.1 as prerequisites of AC.2 only, or to re-route. Next action: check whether any other roadmap consumes AC.0/AC.1 for its own reasons before changing anything. Review note (REVIEW-EXT-08-EXT-16): after also reading Sections 6-7 and Proposition 8.2, the reviewer confirms that no sumset, Plunnecke-Ruzsa, Balog-Szemeredi-Gowers or Freiman result is imported. Section 7 does construct 'generalised Bohr sets' (the atoms of the level-set sigma-algebras B_{eps,eta}(DF)), and Proposition 8.2 runs an energy-increment iteration, but both are proved in the paper and are not AC.1's classical Bohr sets or density increments.
- **The atlas edge SieveMethodsAndPrimePatterns:SV.3 -> AdditiveCombinatorics:AC.4 does not match what the source consumes.** SV.3's description in data/atlas.json is 'Average distribution of primes ... Derive Bombieri-Vinogradov from the selected large-sieve/zero-density route, with its quantifiers in A, B, x and Q'. The Green-Tao construction of the pseudorandom majorant does NOT use Bombieri-Vinogradov anywhere in the sections read. What it uses from analytic number theory is: (i) the Goldston-Yildirim asymptotics for truncated divisor sums (Propositions 9.5 and 9.6, proved in section 10 and Appendix A from a contour integral), (ii) the classical zero-free region for zeta (Lemma A.1, cited to Titchmarsh), (iii) Dirichlet's theorem on primes in arithmetic progressions (used once, for E(f), and avoidable by a pigeonhole choice of residue per footnote 21), and (iv) the prime number theorem (footnote 2). Recommendation (not applied): either re-point AC.4's sieve dependency at a stage owning the Goldston-Yildirim divisor-sum asymptotics, or widen SV.3. Raised in HANDOFF.md as a shared-supplier request. Review note (REVIEW-EXT-08-EXT-16): a search of the full extracted text finds no use of Bombieri-Vinogradov, the large sieve or Siegel-Walfisz; 'Bombieri' occurs only in the acknowledgements.
- **Classical zero-free region: only partially supplied by the decomposed AN.2 node.** Verified: Green-Tao Lemma A.1 (printed p. 51) asserts, for the region Z = {s : 10 >= Re s >= 1 - beta/log(|Im s|+2)} with beta small, that zeta is non-zero and meromorphic on Z with a simple pole at 1 and no other singularity, AND that zeta(s) - 1/(s-1) = O(log(|Im s|+2)) and 1/zeta(s) = O(log(|Im s|+2)) on Z. Their proof is 'See Titchmarsh [41, Chapter 3]', which was not obtained. The EXT-08 AnalyticNumberTheory packet decomposes the zero-free region Re(s) >= 1 - c/log Im(s) for Im(s) >= 1 from Kedlaya's Theorem 8.8 with a complete proof, but neither the growth bounds nor the small-|Im s| part. Next source action: obtain Titchmarsh, The Theory of the Riemann Zeta-function, Chapter 3, or derive the growth bounds from the Hadamard product representation used in Kedlaya's section 8.2. Review note (REVIEW-EXT-08-EXT-16): the proof of Lemma A.3 (printed p. 53) additionally imports the convexity bound |zeta(sigma+it)| <<_eps |t|^{1-sigma+eps} for 1/2 <= sigma <= 1 and |t| >= 1/100, cited as [41, Chapter V]; this is a second unread Titchmarsh input and is not supplied by the AN.2 node.
- **Szemeredi's theorem has no read proof anywhere in EXT-08.** Verified: Proposition 2.1 and Proposition 2.3 are quoted with references [37,38] (Szemeredi), [43] (Varnavides) and [40], and the source explicitly assumes them. Not verified: any proof. This is the single largest unproved input of the whole AdditiveCombinatorics roadmap, and it is inherited by AC.4 with the SAME constant c(k,delta). Next source action: choose and acquire one complete route -- Szemeredi's combinatorial proof, Furstenberg's ergodic proof (multiple recurrence), or Gowers' quantitative proof -- and decompose it under AC.2; note that the ergodic route additionally requires the Furstenberg correspondence principle, which AC.2's text already asks to be owned as a prerequisite.
- **Interior of the Green-Tao argument not read: Section 10 and Appendix A (Goldston-Yildirim correlation estimates).** Updated in review (REVIEW-EXT-08-EXT-16). The draft's boundary (Sections 6-7, Proposition 8.2, Lemmas 5.4-5.5) has been read by the reviewer (printed pp. 14-34) and is recorded in the proof steps of the nodes for Propositions 5.3 and 8.1. Still not read: Section 10 (printed pp. 42-49), which reduces Propositions 9.5 and 9.6 to the contour-integral estimate Lemma 10.4 from Goldston-Yildirim [17] via local factor computations (Lemmas 10.1, 10.3, 10.5, 10.6, Definition 10.2); and Appendix A after Lemma A.3 (pp. 53-56, the inductive proof of Lemma 10.4). Next source action: read printed pp. 42-56 of the same source; no new acquisition is needed.
- **Dirichlet's theorem for the growing modulus W(N) in the endgame.** Added in review (REVIEW-EXT-08-EXT-16). Verified in the source: printed p. 35 asserts that if w(N) << log log N then 'by Dirichlet's theorem' sum_{n <= N} Lambda-tilde(n) = N(1+o(1)), and the proof of Theorem 1.1 (p. 36) uses this to compute E(f); footnote 21 says only sum_{N <= n <= 2N} Lambda-tilde(n) >> N is needed and suggests a pigeonholed residue class; Section 11 (p. 49) says w can finally be a constant depending only on k. Reviewer observation, not stated in the source: W = prod_{p <= w} p is about e^{w}, so for w(N) of size log log N the modulus is a power of log N and the asymptotic needs prime number theorem estimates uniform in the modulus (Siegel-Walfisz range); a fixed-modulus prime number theorem in progressions (the scope of AnalyticNumberTheory:AN.2) suffices only with w constant or w(N) growing slowly enough for a diagonal argument. No supplier link is proposed; the orchestrator should decide whether the endgame consumes AN.2 (fixed modulus) or a uniform statement.
- **Maximal order of the divisor function in Proposition 9.10.** Added in review (REVIEW-EXT-08-EXT-16). The proof of Proposition 9.10 (printed p. 41) handles coincident shifts h_i through the bound ||nu||_infinity << exp(C log N/log log N), obtained 'by standard estimates for the maximal order of the divisor function d(n)', with no proof or reference; this fixes the choice tau(0) := exp(C m log N/log log N). The estimate d(n) <= exp(C log n/log log n) is not decomposed in any EXT-08 packet. Next action: identify a supplier stage or acquire and read a source proof of d(n) <= exp(C log n/log log n); no such proof was located in the supplied library.

### AC.3: the Gowers-norm estimates

Split out of the accepted Gowers node, which cites Green–Tao (5.5)–(5.7) in its sources but states only
the definitions. The estimates are what make the norm usable, and AC.3 cannot close while the
Gowers–Cauchy–Schwarz inequality is only an API line. The accepted node itself is unchanged. Each
dependency edge below is one the source justifies: Lemma 5.2's proof opens "By (5.7) it suffices to prove
the claim for d = k − 1", and (5.5) is invoked in Lemma 6.1 and in the lemma behind Proposition 6.2, the
Section 6 machinery on which the Koopman–von Neumann theorem rests.

#### `gowers-cauchy-schwarz` — The Gowers–Cauchy–Schwarz inequality (Green–Tao (5.5))

*theorem* · planet **Gowers–Cauchy–Schwarz inequality**

For d ≥ 1 and any {0,1}^d-indexed family (f_ω) of real-valued functions on Z_N, |⟨(f_ω)_{ω∈{0,1}^d}⟩_{U^d}| ≤ ∏_{ω∈{0,1}^d} ‖f_ω‖_{U^d}. A single inner product is therefore controlled by the product of the norms of its entries, which is what lets one small Gowers norm force a whole progression count to be small.

**Hypotheses.**
- d ≥ 1
- each f_ω : Z_N → ℝ, bounded
- ‖·‖_{U^d} the Gowers norm of the accepted node, well defined for d ≥ 1

**Proof, in steps.**
1. Rewrite ⟨(f_ω)⟩_{U^d} as an average over h' ∈ Z_N^{d-1} of the product of two inner averages, one over the f_ω with ω_d = 0 and one over those with ω_d = 1 (the rewriting (5.2)–(5.3) of the accepted node).
2. Apply the Cauchy–Schwarz inequality in the h' variables to get |⟨(f_ω)⟩| ≤ ⟨(f_{ω',0})⟩^{1/2} ⟨(f_{ω',1})⟩^{1/2}, where each factor doubles the functions with the last digit fixed.
3. Do the same in each of the other d − 1 digits in turn; the source notes the argument is symmetric in the digits.
4. After one application per digit every surviving inner product has all 2^d entries equal to a single f_ω, i.e. is ‖f_ω‖_{U^d}^{2^d}; collecting the exponents gives the product of the norms.

**Acceptance tests.**
- With every f_ω equal to f, the inequality becomes ‖f‖^{2^d} ≤ ‖f‖^{2^d}, an equality.
- For d = 1 it reads |𝔼 f_0 · 𝔼 f_1| ≤ |𝔼 f_0| |𝔼 f_1|, again an equality, since the U^1 inner product factorises.
- The inequality needs one Cauchy–Schwarz per digit, d in all; an argument using fewer does not reach the product of all 2^d norms.

**Dependencies.** `gowers-inner-product-and-uniformity-norm`

**Sources.**
- Green–Tao, arXiv:math/0404188v6 — §5, the paragraph ending in (5.5), printed p. 12. The statement (5.5) and the one-Cauchy–Schwarz-per-digit proof. Prose verbatim from the arXiv v6 LaTeX source; the displayed formula transcribed from it.

#### `gowers-triangle-inequality` — The Gowers triangle inequality

*theorem*

For d ≥ 1 and real-valued f, g on Z_N, ‖f + g‖_{U^d} ≤ ‖f‖_{U^d} + ‖g‖_{U^d}.

**Hypotheses.**
- d ≥ 1
- f, g : Z_N → ℝ

**Proof, in steps.**
1. Expand ⟨(f+g)_{ω}⟩_{U^d} by multilinearity of the inner product into the 2^{2^d} inner products in which each entry is f or g.
2. Bound each by the Gowers–Cauchy–Schwarz inequality and sum with the binomial formula to get ‖f+g‖_{U^d}^{2^d} = |⟨(f+g)_{ω}⟩_{U^d}| ≤ (‖f‖_{U^d} + ‖g‖_{U^d})^{2^d}.
3. Take 2^d-th roots.

**Acceptance tests.**
- Taking g = 0 gives ‖f‖ ≤ ‖f‖.
- Taking g = −f gives 0 ≤ 2‖f‖, consistent with non-negativity.
- Together with homogeneity this makes ‖·‖_{U^d} a seminorm for every d ≥ 1; whether it is a norm is the separate question settled by the next nodes.

**Dependencies.** `gowers-inner-product-and-uniformity-norm`, `gowers-cauchy-schwarz`

**Sources.**
- Green–Tao, arXiv:math/0404188v6 — §5, the paragraph following (5.5), printed p. 12. The triangle inequality and its derivation from (5.5) by multilinearity and the binomial formula. Prose verbatim from the LaTeX source.

#### `gowers-norm-monotone` — Monotonicity of the Gowers norms in d (Green–Tao (5.7))

*lemma*

For d ≥ 2 and real-valued f on Z_N, ‖f‖_{U^{d-1}} ≤ ‖f‖_{U^d}.

**Hypotheses.**
- d ≥ 2
- f : Z_N → ℝ

**Proof, in steps.**
1. Use ‖1‖_{U^d} = 1 ((5.6)), immediate from the definition.
2. Apply the Gowers–Cauchy–Schwarz inequality to the family with f_ω = f when ω_d = 0 and f_ω = 1 when ω_d = 1, to get |⟨(f_ω)⟩_{U^d}| ≤ ‖f‖_{U^d}^{2^{d-1}}.
3. Compute the left-hand side directly: averaging out the last coordinate of h leaves ‖f‖_{U^{d-1}}^{2^{d-1}}.
4. Take 2^{d-1}-th roots.

**Acceptance tests.**
- For f = 1 both sides equal 1.
- At d = 2 it gives |𝔼 f| = ‖f‖_{U^1} ≤ ‖f‖_{U^2}.
- The lemma is what lets Lemma 5.2 reduce to the top index: its proof opens 'By (5.7) it suffices to prove the claim for d = k − 1'.

**Dependencies.** `gowers-inner-product-and-uniformity-norm`, `gowers-cauchy-schwarz`

**Sources.**
- Green–Tao, arXiv:math/0404188v6 — §5, the paragraph containing (5.6) and (5.7), printed p. 13. The statement (5.7) and the last step of its proof. Prose verbatim from the LaTeX source.

#### `gowers-norm-is-norm` — U^d is a norm for d ≥ 2, and U^1 only a seminorm

*theorem*

For d ≥ 2, ‖·‖_{U^d} is a norm on real-valued functions on Z_N: ‖f‖_{U^d} = 0 only for f = 0. For d = 1 it is not: ‖f‖_{U^1} = |𝔼 f| vanishes on every f of mean zero.

**Hypotheses.**
- f : Z_N → ℝ

**Proof, in steps.**
1. For U^2: apply the Gowers–Cauchy–Schwarz inequality with f_{00} = f and f_{10}, f_{01}, f_{11} Kronecker delta functions; the left-hand side recovers a value of f, so ‖f‖_{U^2} = 0 forces f ≡ 0.
2. Together with the triangle inequality and homogeneity, U^2 is a norm.
3. For d ≥ 2 in general, monotonicity gives ‖f‖_{U^2} ≤ ‖f‖_{U^d}, so ‖f‖_{U^d} = 0 forces ‖f‖_{U^2} = 0 and hence f = 0.
4. For d = 1, the definition gives ‖f‖_{U^1} = |𝔼 f|, which is zero for any nonzero f of mean zero.

**Acceptance tests.**
- A nonzero f of mean zero has ‖f‖_{U^1} = 0 but ‖f‖_{U^2} > 0.
- The indicator of a single point has positive U^d norm for every d ≥ 2.
- The source also records ‖f‖_{U^2} = (∑_ξ |f̂(ξ)|^4)^{1/4}, but says Fourier analysis is motivation only in this paper, so that identity is not a prerequisite here.

**Dependencies.** `gowers-inner-product-and-uniformity-norm`, `gowers-cauchy-schwarz`, `gowers-triangle-inequality`, `gowers-norm-monotone`

**Sources.**
- Green–Tao, arXiv:math/0404188v6 — §5, the paragraph following (5.7), printed p. 13. The norm property for d ≥ 2 and the failure at d = 1. Prose verbatim from the LaTeX source.
- Green–Tao, arXiv:math/0404188v6 — §5, the d = 2 example following (5.5), printed p. 12. The positivity of U^2 on which the d ≥ 2 case rests. Prose verbatim from the LaTeX source.

## AC.0: the packet nodes

The sections above are the worksheet design of the earlier passes. This section records the five AC.0 nodes the packet now carries, under the worksheet's own names: the character-indexed transform and the normalised convolution as definitions, and Parseval–Plancherel, the convolution identity and the Fourier form of additive energy as theorems. They are the targets the reviewed audit names as missing from the pinned Mathlib. Sumsets, additive energy and the Plünnecke–Ruzsa family are already there and stay citations. The source is Tao's 254A lecture notes 2, §6, printed pp. 8–10, read against the file whose sha256 the packet records; prose in the excerpts is verbatim from its text layer and the displayed formulas are transcribed. The source works with a chosen bi-character and names the dual group as the canonical alternative; the nodes take that alternative, as the worksheet's convention already does. Reading it also turned up a duplicated word ("if we define define"), recorded as a misprint under `sourceIssues`.

### `fourier-transform` — The character-indexed Fourier transform on a finite abelian group

*definition* · planet **Fourier transform on a finite abelian group**

For a finite abelian group G of order N and f : G → ℂ, fourier f : AddChar G ℂ → ℂ is fourier f χ = N⁻¹ ∑_{x∈G} f(x) · conj(χ(x)): probability counting measure on G, counting measure on the dual, and indexed by the dual group AddChar G ℂ itself, with no isomorphism G ≅ Ĝ chosen. This is the canonical form of the source's bi-character transform, which the source itself names as the canonical alternative.

**Hypotheses.**
- G a finite abelian group, written additively, N = |G| > 0
- f : G → ℂ

**Construction or proof, in steps.**
1. Define fourier f χ := N⁻¹ ∑_x f(x) conj(χ x); this is RCLike.wInner with the constant weight RCLike.cWeight and the character in the first, conjugated, slot.
2. Identify it with the coordinate of f in the character basis AddChar.complexBasis, using character orthogonality for the normalised measure.
3. Derive inversion f(x) = ∑_χ fourier f χ · χ(x) from the basis expansion.
4. Derive the transformation rules (translation, modulation, negation, conjugation, precomposition with an isomorphism or a surjection) directly from the defining sum.
5. Compare with Mathlib's ZMod.dft on ZMod N through the explicit isomorphism ZMod N ≅ AddChar (ZMod N) ℂ: fourier f (zmodAddEquiv r) = N⁻¹ · dft f r.

**API.**

| name | role | statement |
|---|---|---|
| `fourier_apply` | characterisation | fourier f χ = (card G)⁻¹ · ∑ x, f x · star (χ x). |
| `fourier_zero` | simp | fourier 0 = 0. |
| `fourier_add` | structure | fourier (f + g) = fourier f + fourier g. |
| `fourier_smul` | structure | fourier (c • f) = c • fourier f. |
| `fourier_single` | example | fourier (Pi.single a c) χ = (card G)⁻¹ · c · star (χ a). |
| `fourier_character` | characterisation | fourier (fun x => ψ x) χ = if χ = ψ then 1 else 0. |
| `fourier_inversion` | characterisation | ∑ χ, fourier f χ · χ x = f x. |
| `fourier_inversion_reindex` | compatibility | For any equivalence e : ι ≃ AddChar G ℂ, ∑ i, fourier f (e i) · e i x = f x: inversion through an explicitly supplied indexing of the dual, never an identification of the dual with G. |
| `fourier_injective` | extensionality | fourier is injective. |
| `fourier_eq_basis_repr` | compatibility | fourier f χ = (AddChar.complexBasis G).repr f χ. |
| `fourier_eq_wInner` | compatibility | fourier f χ = RCLike.wInner RCLike.cWeight (fun x => χ x) f; the character sits in the first slot because the library inner product conjugates its first argument. |
| `fourier_eq_haarIntegral` | compatibility | fourier f χ is the integral of f · star χ against Tau Ceti's Haar probability measure TauCeti.haarProb on Multiplicative G (discrete topology): the one-dimensional case of the Peter–Weyl coefficients. |
| `fourier_translate` | functoriality | fourier (fun x => f (x − a)) χ = star (χ a) · fourier f χ. |
| `fourier_modulate` | functoriality | fourier (fun x => ψ x · f x) χ = fourier f (χ / ψ). |
| `fourier_neg` | functoriality | fourier (fun x => f (−x)) χ = fourier f χ⁻¹. |
| `fourier_conj` | functoriality | fourier (fun x => star (f x)) χ = star (fourier f χ⁻¹). |
| `fourier_reflection` | functoriality | fourier (fun x => star (f (−x))) χ = star (fourier f χ): the source's reflection identity. |
| `fourier_equiv` | functoriality | For e : G ≃+ H, fourier (f ∘ e) (χ ∘ e) = fourier f χ. |
| `fourier_quotient` | functoriality | For a surjective q : G →+ H, fourier (f ∘ q) (χ ∘ q) = fourier f χ. |
| `fourier_quotient_zero` | functoriality | For q : G →+ H and χ nontrivial on ker q, fourier (f ∘ q) χ = 0. |
| `zmod_character_comparison` | compatibility | AddChar.zmodAddEquiv r x = ZMod.stdAddChar (x · r), the explicit isomorphism the cyclic comparison runs through. |
| `fourier_zmod` | compatibility | On ZMod N, fourier f (AddChar.zmodAddEquiv r) = N⁻¹ · ZMod.dft f r. |

**Unit tests.** A wrong definition fails one of these.

- `fourier.test_nonreal_phase` (computation) — Worksheet F1: on ZMod 4, fourier (Pi.single 1 1) (zmodAddEquiv 1) = −i/4. A definition that omits the conjugate gives +i/4 and fails.
- `fourier.test_distinct_characters` (computation) — Worksheet F2: on ZMod 3, the transform of the character zmodAddEquiv 2 vanishes at zmodAddEquiv 1.
- `fourier.test_self_coefficient_one` (non-example) — Worksheet F3: fourier (fun x => χ x) χ = 1, not N; a definition with counting rather than probability measure on G fails.
- `fourier.test_zero` (degenerate) — Worksheet F4: fourier 0 χ = 0.
- `fourier.test_trivial_group` (degenerate) — Worksheet F5: on ZMod 1, fourier f χ = f 0.
- `fourier.test_noncyclic_delta` (computation) — Worksheet F6: on ZMod 2 × ZMod 2, the unit delta at 0 has coefficient 1/4 at every character, on a group that is not cyclic.
- `fourier.test_conjugate_reflection` (computation) — Worksheet F10: on ZMod 4, the conjugate reflection of Pi.single 1 1 has coefficient +i/4 at zmodAddEquiv 1, the conjugate of F1; plain reflection would not conjugate.
- `fourier.test_conjugate_slot` (non-example) — Worksheet F11: fourier (fun x => i · χ x) χ = i. With the character in the linear slot of the inner product the answer would be −i.

**Where it is used.**
- `normalized-convolution` — The convolution identity is a statement about the transform of the normalised convolution.
- `fourier-parseval` — Parseval and Plancherel are the transform's isometry statements.
- `fourier-energy` — Additive energy is expressed through the transforms of the two indicators.
- `AdditiveCombinatorics:AC.1` — The worksheet's AC.1 large-spectrum interfaces (largeSpectrum and its lemmas) are phrased with this transform.

**Acceptance tests.**
- fourier of a character χ is the indicator of χ: coefficient one at χ, not N.
- Inversion reconstructs f exactly, with no stray factor of N.
- On ZMod N the transform is N⁻¹ times Mathlib's dft, so neither normalisation silently replaces the other.

**Dependencies.**
- On the pinned libraries: `mathlib:AddChar`, `mathlib:AddChar.complexBasis`, `mathlib:RCLike.wInner`, `mathlib:RCLike.cWeight`, `mathlib:ZMod.dft`, `tauceti:TauCeti.haarProb`

**Sources.**
- Terence Tao, *Lecture notes 2 for 254A (additive combinatorics), within the CMU-hosted 118-page compilation* — §6, printed p. 8 (physical p. 34), the canonical dual-group alternative. The choice of indexing by the dual group AddChar G ℂ rather than by a chosen bi-character. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.
- Terence Tao, *Lecture notes 2 for 254A (additive combinatorics), within the CMU-hosted 118-page compilation* — §6, printed p. 8 (physical p. 34), normalised counting measure. The normalisation N⁻¹ on the position side. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.
- Terence Tao, *Lecture notes 2 for 254A (additive combinatorics), within the CMU-hosted 118-page compilation* — §6, printed p. 9 (physical p. 35), the Fourier transform and inversion. The definition as the inner product against the character, and Fourier inversion. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.

### `normalized-convolution` — Normalised convolution on a finite abelian group

*definition* · planet **Normalised convolution**

For f, g : G → ℂ on a finite abelian group G of order N, nconv f g x = N⁻¹ ∑_{y∈G} f(y) g(x − y): convolution with respect to the probability counting measure. It is N⁻¹ times Mathlib's discrete convolution addRingConvolution, a normalisation adapter and not a new convolution theory.

**Hypotheses.**
- G a finite abelian group, N = |G| > 0
- f, g : G → ℂ

**Construction or proof, in steps.**
1. Define nconv f g := N⁻¹ • DiscreteConvolution.addRingConvolution f g, with nconv_apply giving the explicit sum.
2. Transfer commutativity, associativity and bilinearity from the discrete convolution, tracking the factor N⁻¹ in associativity.
3. Compute on indicators: nconv 1_A 1_B x = N⁻¹ · #{(a, b) ∈ A × B : a + b = x}, i.e. N⁻¹ · Finset.addConvolution A B x.
4. The unit is N·δ₀, not δ₀, because of the normalisation.

**API.**

| name | role | statement |
|---|---|---|
| `nconv_apply` | characterisation | nconv f g x = (card G)⁻¹ · ∑ y, f y · g (x − y). |
| `nconv_eq_addRingConvolution` | compatibility | nconv f g = (card G)⁻¹ • DiscreteConvolution.addRingConvolution f g. |
| `nconv_indicator` | compatibility | nconv 1_A 1_B x = (card G)⁻¹ · (A.addConvolution B x : ℂ). |
| `nconv_comm` | structure | nconv f g = nconv g f. |
| `nconv_assoc` | structure | nconv (nconv f g) h = nconv f (nconv g h). |
| `nconv_add_left` | structure | nconv (f + g) h = nconv f h + nconv g h. |
| `nconv_add_right` | structure | nconv f (g + h) = nconv f g + nconv f h. |
| `nconv_smul_left` | structure | nconv (c • f) g = c • nconv f g. |
| `nconv_smul_right` | structure | nconv f (c • g) = c • nconv f g. |
| `nconv_zero_left` | simp | nconv 0 f = 0. |
| `nconv_zero_right` | simp | nconv f 0 = 0. |
| `nconv_single` | example | nconv (Pi.single a c) (Pi.single b d) = Pi.single (a + b) ((card G)⁻¹ · c · d). |
| `nconv_unit_left` | example | nconv (Pi.single 0 (card G)) f = f. |
| `nconv_unit_right` | example | nconv f (Pi.single 0 (card G)) = f. |

**Unit tests.** A wrong definition fails one of these.

- `nconv.test_delta_not_unit` (non-example) — Worksheet C1: on ZMod 3, nconv δ₀ δ₀ 0 = 1/3, so the unit delta is not the convolution unit under probability measure.
- `nconv.test_scaled_unit` (computation) — Worksheet C2: on ZMod 4, nconv (Pi.single 0 4) f = f. A definition without the factor N⁻¹ makes δ₀ the unit instead, and fails.
- `nconv.test_zero` (degenerate) — Worksheet C4: nconv 0 f = 0.
- `nconv.test_constants` (computation) — Worksheet C5: nconv 1 1 = 1, the constants being fixed by probability normalisation.
- `nconv.test_support_and_scale` (computation) — Worksheet C6: on ZMod 4, nconv δ₁ δ₁ 2 = 1/4, testing the support a + b and the normalisation together.
- `nconv.test_indicator_multiplicity` (computation) — Worksheet C9: on ZMod 3 with A = B = {0, 1}, nconv 1_A 1_B 1 = 2/3, the two representations 0 + 1 and 1 + 0 over N = 3; sumset membership alone would give 1/3.

**Where it is used.**
- `fourier-nconv` — The convolution identity takes nconv to the product of transforms.
- `fourier-energy` — Energy is N³ times the squared L² norm of the normalised convolution of the indicators, through nconv_indicator.

**Acceptance tests.**
- nconv (N · δ₀) f = f: the unit carries the factor N.
- On indicators the value is N⁻¹ times the representation count, linking the Fourier side to Mathlib's finset convolution.
- Associativity holds with the normalisation, since each convolution carries one factor N⁻¹ and one sum.

**Dependencies.**
- On the pinned libraries: `mathlib:DiscreteConvolution.ringConvolution`, `mathlib:Finset.convolution`

**Sources.**
- Terence Tao, *Lecture notes 2 for 254A (additive combinatorics), within the CMU-hosted 118-page compilation* — §6, printed p. 9 (physical p. 35), convolution. The definition of convolution against the normalised measure dy. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.

### `fourier-parseval` — Parseval and Plancherel for the character-indexed transform

*theorem* · planet **Parseval and Plancherel**

For f, g : G → ℂ, N⁻¹ ∑_x f(x) conj(g(x)) = ∑_χ fourier f χ · conj(fourier g χ), and in particular N⁻¹ ∑_x |f(x)|² = ∑_χ |fourier f χ|²: the transform is an isometry from L²(G, probability measure) to ℓ²(Ĝ, counting measure).

**Hypotheses.**
- G a finite abelian group
- f, g : G → ℂ

**Proof, in steps.**
1. Expand both sides in the character basis using fourier_inversion.
2. Use orthogonality of characters for the normalised measure: N⁻¹ ∑_x χ(x) conj(ψ(x)) = [χ = ψ].
3. Collect terms to obtain Parseval; take g = f for Plancherel.

**Acceptance tests.**
- The measures differ on the two sides — probability on G, counting on Ĝ — and the identity is false with both normalised or both counting.
- For f = ⇑χ both sides equal 1.
- For f = 1_A, Plancherel gives ∑_χ |fourier 1_A χ|² = |A|/N, the density — the source's equation (1).

**Dependencies.**
- In this packet: `fourier-transform`
- On the pinned libraries: `mathlib:AddChar.complexBasis`

**Sources.**
- Terence Tao, *Lecture notes 2 for 254A (additive combinatorics), within the CMU-hosted 118-page compilation* — §6, printed p. 9 (physical p. 35), the Parseval relation and Plancherel. The Parseval relation and the Plancherel formula for the transform. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.

### `fourier-nconv` — The transform takes normalised convolution to the product

*theorem* · planet **Convolution to product**

For f, g : G → ℂ and χ ∈ AddChar G ℂ, fourier (nconv f g) χ = fourier f χ · fourier g χ.

**Hypotheses.**
- G a finite abelian group
- f, g : G → ℂ
- χ ∈ AddChar G ℂ

**Proof, in steps.**
1. Expand fourier (nconv f g) χ = N⁻² ∑_x ∑_y f(y) g(x − y) conj(χ(x)).
2. Substitute x = y + z and use conj(χ(y + z)) = conj(χ(y)) conj(χ(z)).
3. The double sum factorises into (N⁻¹ ∑_y f(y) conj χ(y)) · (N⁻¹ ∑_z g(z) conj χ(z)).

**Acceptance tests.**
- The identity holds with no constant exactly because both the convolution and the transform are taken against the probability measure; with unnormalised convolution a factor N appears.
- For f = g = ⇑χ it gives 1 · 1 = 1 at χ.
- It is the audit's named missing identity for AC.0.

**Dependencies.**
- In this packet: `fourier-transform`, `normalized-convolution`

**Sources.**
- Terence Tao, *Lecture notes 2 for 254A (additive combinatorics), within the CMU-hosted 118-page compilation* — §6, printed p. 9 (physical p. 35), convolution to product. The convolution identity (f ∗ g)ˆ = fˆ ĝ. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.

### `fourier-energy` — Additive energy in Fourier terms

*theorem* · planet **Additive energy via Fourier**

For finsets A, B ⊆ G, E(A, B) = N³ ∑_χ |fourier 1_A χ|² · |fourier 1_B χ|², where E is Mathlib's additive energy Finset.addEnergy.

**Hypotheses.**
- G a finite abelian group, N = |G|
- A, B finite subsets of G

**Proof, in steps.**
1. Write E(A, B) = ∑_x r(x)² with r(x) = #{(a, b) ∈ A × B : a + b = x} = Finset.addConvolution A B x.
2. By the indicator computation, nconv 1_A 1_B = N⁻¹ · r.
3. Apply Plancherel to nconv 1_A 1_B: N⁻¹ ∑_x |N⁻¹ r(x)|² = ∑_χ |fourier (nconv 1_A 1_B) χ|².
4. Apply the convolution identity to the right-hand side and multiply through by N³.

**Acceptance tests.**
- For A = B = G both sides equal N³: E(G, G) counts all N³ solutions of a + b = a' + b', and fourier 1_G is the indicator of the trivial character.
- For A = B = {0} both sides equal 1.
- The factor N³ is forced by the normalisations; this is the check that pins it.

**Dependencies.**
- In this packet: `fourier-parseval`, `fourier-nconv`, `normalized-convolution`
- On the pinned libraries: `mathlib:Finset.mulEnergy`, `mathlib:Finset.convolution`

**Sources.**
- Terence Tao, *Lecture notes 2 for 254A (additive combinatorics), within the CMU-hosted 118-page compilation* — §6, printed p. 10 (physical p. 36), Plancherel applied to χ_A ∗ χ_A. The source uses this identity, in the case A = B, by applying Plancherel to χ_A ∗ χ_A to reach the fourth moment ∑_ξ |χ̂_A(ξ)|⁴; it does not display the energy formula itself, which is the rewriting of ‖χ_A ∗ χ_B‖² as a count. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.

### AC.0, third pass: indicator estimates and the energy bound

The worksheet's AC.0 indicator interfaces become nodes, under the worksheet's names: the source's equations (1), (2) and (5), and the trivial energy bound, which the audit records as missing from Mathlib. The sumset, energy and Plünnecke–Ruzsa results that Mathlib has are now listed in the baseline by name. The index knows only their multiplicative declarations; the additive twins are named in each `provides`.

#### `fourier-indicator-l2` — The L² mass of the transform of an indicator

*theorem*

∑_χ |fourier 1_A χ|² = |A|/N, the density of A (worksheet fourier_indicator_l2).

**Proof, in steps.**
1. Apply Plancherel (fourier-parseval) to f = 1_A: ∑_χ |fourier 1_A χ|² = N⁻¹ ∑_x |1_A(x)|².
2. |1_A(x)|² = 1_A(x), so the right side is |A|/N.

**Acceptance tests.**
- For A = G it gives 1: fourier 1_G is the indicator of the trivial character.
- For A = ∅ both sides are 0.
- For A a singleton it gives 1/N, while each of the N coefficients has modulus 1/N.

**Dependencies.**
- In this packet: `fourier-parseval`, `fourier-transform`

**Sources.**
- Terence Tao, *Lecture notes 2 for 254A* — §6, printed p. 9 (physical p. 35), equation (1). Equation (1), with c = |A|/N. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.

#### `fourier-norm-le-l1` — The transform is bounded by the normalised L¹ norm

*lemma*

For f : G → ℂ and every character χ, |fourier f χ| ≤ N⁻¹ ∑_x |f(x)| (worksheet fourier_norm_le_l1).

**Proof, in steps.**
1. fourier_apply writes fourier f χ = N⁻¹ ∑_x f(x) conj(χ(x)); take norms, use the triangle inequality and |χ(x)| = 1.

**Acceptance tests.**
- Equality for f = χ (both sides equal 1).
- For f = 0 both sides are 0.
- The bound is uniform in χ.

**Dependencies.**
- In this packet: `fourier-transform`

**Sources.**
- Terence Tao, *Lecture notes 2 for 254A* — §6, printed p. 9 (physical p. 35), equation (2). The first inequality of (2), for a general f. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.

#### `fourier-indicator-norm-le` — Pointwise bound for the transform of an indicator

*lemma*

|fourier 1_A χ| ≤ |A|/N for every character χ, with equality at the trivial character (worksheet fourier_indicator_norm_le).

**Proof, in steps.**
1. fourier-norm-le-l1 with f = 1_A, since ∑_x |1_A(x)| = |A|.
2. At the trivial character fourier 1_A 1 = |A|/N.

**Acceptance tests.**
- Equality at χ = 1.
- For A = G every nontrivial coefficient is 0, far below the bound.
- For A = ∅ the bound is 0.

**Dependencies.**
- In this packet: `fourier-norm-le-l1`, `fourier-transform`

**Sources.**
- Terence Tao, *Lecture notes 2 for 254A* — §6, printed p. 9 (physical p. 35), equation (2). Equation (2) for the indicator. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.

#### `fourier-indicator-fourth-le` — The fourth moment of an indicator's transform is at most the cubed density

*theorem*

∑_χ |fourier 1_A χ|⁴ ≤ (|A|/N)³ (worksheet fourier_indicator_fourth_le). By fourier-energy this is the trivial bound E(A, A) ≤ |A|³.

**Proof, in steps.**
1. Bound |fourier 1_A χ|⁴ ≤ (max_χ |fourier 1_A χ|)² · |fourier 1_A χ|² ≤ (|A|/N)² |fourier 1_A χ|² by fourier-indicator-norm-le.
2. Sum over χ and apply fourier-indicator-l2: (|A|/N)² · |A|/N.

**Acceptance tests.**
- Equality for A = G (both sides 1).
- Through fourier-energy, N³ times the left side is E(A, A), and the bound is E(A, A) ≤ |A|³, add-energy-le at B = A.
- Against the source's (4), small doubling |A + A| ≤ K|A| gives the matching lower bound (|A|/N)³/K.

**Dependencies.**
- In this packet: `fourier-indicator-norm-le`, `fourier-indicator-l2`

**Sources.**
- Terence Tao, *Lecture notes 2 for 254A* — §6, printed p. 10 (physical p. 36), equation (5). Equation (5). Prose verbatim from the text layer of the compilation; displayed formulas transcribed.
- Terence Tao, *Lecture notes 2 for 254A* — §6, printed p. 10 (physical p. 36), equation (4). The matching lower bound under small doubling, for the acceptance test. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.

#### `add-energy-le` — The trivial upper bound for additive energy

*lemma*

For finite subsets A, B of an abelian group, E(A, B) ≤ |A|² |B| and E(A, B) ≤ |A| |B|², where E is Mathlib's Finset.addEnergy. The reviewed audit records these bounds as missing from the pinned Mathlib, which has only the lower bounds |A||B| ≤ E(A, B) and |A|²|B|² ≤ |A + B| E(A, B) and the equality E(G, B) = |G||B|².

**Proof, in steps.**
1. E(A, B) counts (a₁, b₁, a₂, b₂) ∈ A × B × A × B with a₁ + b₁ = a₂ + b₂ (addEnergy_eq_card_filter).
2. The map (a₁, b₁, a₂, b₂) ↦ (a₁, a₂, b₁) is injective on that set, since b₂ = a₁ + b₁ − a₂; so E(A, B) ≤ |A|² |B|.
3. Symmetrically (a₁, b₁, a₂, b₂) ↦ (a₁, b₁, b₂) gives E(A, B) ≤ |A| |B|².

**Acceptance tests.**
- For A = G, E(G, B) = |G| |B|² (Mathlib's addEnergy_univ_left): the second bound is attained.
- For A = B a subgroup, E(A, A) = |A|³: both bounds are attained.
- Without cancellation the injectivity fails; the lemma is stated for groups.

**Dependencies.**
- On the pinned libraries: `mathlib:Finset.mulEnergy`, `mathlib:Finset.mulEnergy_eq_card_filter`, `mathlib:Finset.mulEnergy_univ_left`, `mathlib:Finset.le_mulEnergy`

**Sources.**
- Terence Tao, *Lecture notes 2 for 254A* — §6, printed p. 10 (physical p. 36), equation (5). The source proves the Fourier form for A = B (equation (5), which fourier-energy converts into E(A, A) ≤ |A|³). The combinatorial bound for two sets is the elementary count in the proof steps; no source was needed for it. Prose verbatim from the text layer of the compilation; displayed formulas transcribed.

### Remaining in AC.0

- Sumsets, additive energy and the Plünnecke–Ruzsa, Ruzsa triangle and Ruzsa covering inequalities are baseline citations, listed by name through their multiplicative declarations (the pinned index has only those; the additive twins are named in provides).
- The checks the handoff lists for AC.0 — quotient fibre-cardinality, the cyclic constructor, the one-dimensional Peter–Weyl identification (fourier_eq_haarIntegral) and the coding/ER.4 specialisations — are not done; the nodes carry those interfaces as the worksheet states them.
- The source's count of large coefficients (3), |{ξ : |χ̂_A(ξ)| ≥ εc}| ≤ ε⁻²c⁻¹, belongs to AC.1's large-spectrum layer (worksheet largeSpectrum_indicator_card_mul_sq_le) and is not an AC.0 node.

## AC.1: entropy and Marton's conjecture (Gowers–Green–Manners–Tao)

The source is Gowers, Green, Manners and Tao, *On a conjecture of Marton* (Ann. of Math. 201 (2025), 515–549). It was read in the authors' accepted manuscript, which is CC BY and held on the Oxford Research Archive, and collated with arXiv:2311.05762v2. The paper proves the polynomial Freiman–Ruzsa conjecture in 𝔽₂ⁿ with C = 12: a set A with |A + A| ≤ K|A| is covered by 2K¹² cosets of a subgroup of size at most |A|.

The proof works entirely with Shannon entropy.
- The entropic Ruzsa distance d[X; Y] = H[X′ − Y′] − ½H[X′] − ½H[Y′] replaces the doubling constant.
- The entropic PFR theorem (Theorem 1.8) comes from minimizing a penalized distance τ.
- If a minimizer had positive distance, sums and fibres of independent copies would give a smaller τ. This uses the fibring lemma, the two estimates of Sections 5–6, and an endgame that applies entropic Balog–Szemerédi–Gowers to a triple summing to zero, which is the one essential use of characteristic 2.
- Appendix B converts the entropic statement into the covering statement by the Ruzsa covering lemma.

Mathlib has no Shannon entropy of random variables, so AC.1 plans that carrier at the level of distributions on finite types. AC.0 is already at its planet budget. The names follow the complete Lean 4 formalization of this paper (teorth.github.io/pfr), which is not a pinned library, so a later port can reuse them.

### Entropy and the entropic Ruzsa calculus

#### `shannon-entropy` — Shannon entropy, conditional entropy and mutual information

*definition* · planet **Shannon entropy and mutual information** · proposed `TauCeti.EntropicPFR.entropy`

For a random variable X with values in a finite type, H[X] = Σ_x p_X(x) log(1/p_X(x)) (natural logarithm), computed from the distribution. H[X|Y] = Σ_y p_Y(y) H[X|Y=y], I[X : Y] = H[X] + H[Y] − H[X,Y], and I[X : Y|Z] = Σ_z p_Z(z) I[(X|Z=z) : (Y|Z=z)].

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.
- Mathlib has only the binary entropy function; this node is the general carrier, built on Real.negMulLog and ProbabilityTheory.cond. The planned names follow the Lean formalization of this paper (teorth.github.io/pfr), which is not a pinned library.

**Construction or proof, in steps.**
1. Define measureEntropy μ = Σ_s negMulLog(μ{s}) for a measure on a finite type, entropy X μ = measureEntropy(μ.map X), and the conditional and mutual versions as displayed.
2. Jensen (concavity of negMulLog): H[X] ≤ log|S| with equality exactly for the uniform distribution (A.1); and max_x p_X(x) ≥ e^{−H[X]} (A.2).
3. Chain rule H[X,Y] = H[X|Y] + H[Y] (A.3), by expanding p_{X,Y} = p_Y·p_{X|Y}.
4. I[X : Y] ≥ 0 with equality iff X, Y are independent (Jensen), giving (A.4)–(A.5). Conditioning and summing gives submodularity H[X|Y,Z] ≤ H[X|Z] (A.6)–(A.7), and I[X : Y|Z] ≥ 0 with the formula (A.9).
5. Invariance of entropy under injective relabelling, and H[U_s] = log|s| for the uniform distribution on a finite set.

**API.**

| name | role | statement |
|---|---|---|
| `TauCeti.EntropicPFR.measureEntropy` | data | The entropy Σ_s −μ{s} log μ{s} of a measure on a finite type. |
| `TauCeti.EntropicPFR.condEntropy` | data | H[X∣Y] = Σ_y p_Y(y) H[X∣Y=y]. |
| `TauCeti.EntropicPFR.mutualInfo` | data | I[X : Y] = H[X] + H[Y] − H[X,Y]. |
| `TauCeti.EntropicPFR.condMutualInfo` | data | I[X : Y∣Z] = Σ_z p_Z(z) I[(X∣Z=z) : (Y∣Z=z)]. |
| `TauCeti.EntropicPFR.entropy_le_log_card` | other | (A.1): H[X] ≤ log∣S∣. |
| `TauCeti.EntropicPFR.measureEntropy_eq_log_card_iff` | characterisation | (A.1): equality iff the distribution is uniform. |
| `TauCeti.EntropicPFR.exists_measure_singleton_ge` | other | (A.2): some value has probability at least e^{−H}. |
| `TauCeti.EntropicPFR.entropy_pair_eq_condEntropy_add` | relation | (A.3): the chain rule. |
| `TauCeti.EntropicPFR.condEntropy_le_entropy` | relation | (A.5): conditioning does not increase entropy. |
| `TauCeti.EntropicPFR.entropy_pair_eq_add_iff` | characterisation | (A.4): H[X,Y] = H[X] + H[Y] iff X and Y are independent. |
| `TauCeti.EntropicPFR.condEntropy_pair_le` | relation | (A.6): submodularity. |
| `TauCeti.EntropicPFR.condMutualInfo_nonneg` | other | (A.8): I[X : Y∣Z] ≥ 0. |
| `TauCeti.EntropicPFR.entropy_comp_of_injective` | simp | Injective relabelling preserves entropy. |
| `TauCeti.EntropicPFR.measureEntropy_uniformOn` | simp | The uniform distribution on a nonempty finite set s has entropy log∣s∣. |

**Unit tests.**

- `shannon-entropy.entropy_const` (degenerate) — A constant random variable has entropy 0.
- `shannon-entropy.entropy_uniform_bool` (computation) — The uniform distribution on Bool has entropy log 2.
- `shannon-entropy.mutualInfo_self` (characterisation) — I[X : X] = H[X]: a variable carries all of its own information.
- `shannon-entropy.mutualInfo_indep` (compatibility) — Independent X, Y (Mathlib's IndepFun) have I[X : Y] = 0.

**Where it is used.**
- entropic-ruzsa-distance — The entropic Ruzsa distance is a combination of entropies.
- Gowers–Green–Manners–Tao §§2–7 and Appendix A — Every estimate is an entropy inequality.

**Acceptance.**
- The source recalls these facts in Appendix A and uses them throughout; none is specific to additive combinatorics.

**Dependencies.**
- On the pinned libraries: `mathlib:Real.negMulLog`, `mathlib:ProbabilityTheory.cond`, `mathlib:MeasureTheory.Measure.map`, `mathlib:ProbabilityTheory.IndepFun`, `mathlib:Real.concaveOn_negMulLog`, `mathlib:ProbabilityTheory.uniformOn`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — Appendix A, (A.1)–(A.9), pp. 27–28 (AAM). The definitions and standard inequalities.

#### `entropic-ruzsa-distance` — Entropic Ruzsa distance

*definition* · planet **Entropic Ruzsa distance** · proposed `TauCeti.EntropicPFR.rdist`

For probability distributions μ, ν on a finite abelian group G, d[μ; ν] = H[X′ − Y′] − ½H[X′] − ½H[Y′], where X′ ∼ μ and Y′ ∼ ν are independent (1.1). For random variables d[X; Y] = d[p_X; p_Y] depends only on the two distributions. The conditional distance is d[X|Z; Y|W] = Σ_{z,w} p_Z(z)p_W(w) d[(X|Z=z); (Y|W=w)] (A.14).

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.
- X and Y need not be independent, or even defined on the same space.

**Construction or proof, in steps.**
1. Define rdist(μ, ν) from the distribution of p.1 − p.2 under μ ⊗ ν, and condRdist as displayed.
2. Symmetry: X′ − Y′ and Y′ − X′ have the same entropy. Nonnegativity and |H[X] − H[Y]| ≤ 2d[X; Y] follow from max(H[X], H[Y]) ≤ H[X − Y] for independent X, Y (A.10)–(A.12).
3. For independent X, Y on one space, d[X; Y] = H[X − Y] − ½H[X] − ½H[Y]; for independent copies, the conditional distance is H[X′ − Y′|Z′, W′] − ½H[X′|Z′] − ½H[Y′|W′] (A.15).
4. Translation invariance, and d[U_H; U_H] = 0 because U_H − U_H′ is again uniform on H.

**API.**

| name | role | statement |
|---|---|---|
| `TauCeti.EntropicPFR.condRdist` | data | The conditional distance (A.14). |
| `TauCeti.EntropicPFR.rdist_symm` | relation | d[μ; ν] = d[ν; μ]. |
| `TauCeti.EntropicPFR.rdist_nonneg` | other | d[μ; ν] ≥ 0. |
| `TauCeti.EntropicPFR.abs_measureEntropy_sub_le` | other | (A.12): ∣H[μ] − H[ν]∣ ≤ 2d[μ; ν]. |
| `TauCeti.EntropicPFR.rdist_map_eq_of_indepFun` | characterisation | For independent X, Y on one space, d[X; Y] = H[X − Y] − ½H[X] − ½H[Y]. |
| `TauCeti.EntropicPFR.rdist_map_add_const` | simp | Translating one distribution does not change the distance. |
| `TauCeti.EntropicPFR.rdist_uniformOn_self` | example | d[U_H; U_H] = 0 for a subgroup H. |

**Unit tests.**

- `entropic-ruzsa-distance.rdist_dirac_zero` (degenerate) — Two point masses at 0 are at distance 0.
- `entropic-ruzsa-distance.rdist_cosets` (characterisation) — Uniform distributions on two cosets a + H, b + H are at distance 0 although they differ: the distance is not a metric on distributions.
- `entropic-ruzsa-distance.rdist_three_points` (non-example) — X uniform on {0, e₁, e₂} ⊂ 𝔽₂² has d[X; X] = (2/3)log(3/2) > 0: a 'distance' of a variable from itself need not vanish. (Checked numerically: 0.2703…)

**Where it is used.**
- Gowers–Green–Manners–Tao Theorem 1.8 and §§2–7 — The quantity decreased by the compression argument.
- tau-functional — τ is built from three distances.

**Acceptance.**
- d[X; X] = 0 only when X is uniform on a coset of a subgroup (Lemma 2.2), and d[X; Y] = 0 can hold for different distributions (p. 4).

**Dependencies.**
- In this packet: `shannon-entropy`
- On the pinned libraries: `mathlib:MeasureTheory.Measure.prod`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §1, (1.1) and the following remarks, p. 4 (AAM). The definition and its basic properties.
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — Appendix A, (A.10)–(A.15), pp. 29–30 (AAM). The conditional distance and the standard inequalities.

#### `entropic-ruzsa-triangle` — Entropic Ruzsa triangle inequality (A.13)

*theorem* · proposed `TauCeti.EntropicPFR.rdist_triangle`

For probability distributions on a finite abelian group, d[X; Y] ≤ d[X; Z] + d[Z; Y]; equivalently H[X − Y] ≤ H[X − Z] + H[Z − Y] − H[Z] for independent X, Y, Z.

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.

**Proof, in steps.**
1. Submodularity (A.6): H[Y − Z|X − Y] ≥ H[Y − Z|X − Y, Y] = H[Z|X, Y] = H[Z], using independence.
2. H[Y − Z|X − Y] = H[X − Z, Y − Z] − H[X − Y] ≤ H[X − Z] + H[Y − Z] − H[X − Y] by (A.5). Combine; the half-entropies in d cancel.

**Acceptance.**
- The independence of X and Y is not used (source remark, after [9]).

**Dependencies.**
- In this packet: `entropic-ruzsa-distance`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — Appendix A, (A.13) and its proof, pp. 29–30 (AAM). The inequality and its proof.

#### `madiman-inequality` — Madiman's inequality (Lemma A.1)

*lemma* · proposed `TauCeti.EntropicPFR.entropy_add_add_sub_le`

For independent X, Y, Z in a finite abelian group, H[X + Y + Z] − H[X + Y] ≤ H[Y + Z] − H[Y].

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.
- An entropy analogue of Plünnecke's inequality; it generalizes Kaimanovich–Vershik.

**Proof, in steps.**
1. By (A.9), I[X : Z|X+Y+Z] = H[X, X+Y+Z] + H[Z, X+Y+Z] − H[X, Z, X+Y+Z] − H[X+Y+Z].
2. By independence (A.4): H[X, X+Y+Z] = H[X] + H[Y+Z], H[Z, X+Y+Z] = H[Z] + H[X+Y], and H[X, Z, X+Y+Z] = H[X] + H[Y] + H[Z]. The claim becomes I[X : Z|X+Y+Z] ≥ 0 (A.8).

**Acceptance.**
- Z = 0 gives an equality.

**Dependencies.**
- In this packet: `shannon-entropy`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — Appendix A, Lemma A.1 and proof, p. 30 (AAM); (5.5), p. 20. The lemma and its proof.

#### `entropic-bsg` — Entropic Balog–Szemerédi–Gowers lemma (Lemma A.2)

*theorem* · planet **Entropic Balog–Szemerédi–Gowers lemma** · proposed `TauCeti.EntropicPFR.sum_rdist_cond_le`

Let (A, B) be a G²-valued random variable and Z = A + B. Then Σ_z p_Z(z) d[(A|Z=z); (B|Z=z)] ≤ 3I[A : B] + 2H[Z] − H[A] − H[B].

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.
- A, B are jointly distributed, not assumed independent; 2H[Z] − H[A] − H[B] is not 2d[A; B].

**Proof, in steps.**
1. Take (A₁, B₁), (A₂, B₂) conditionally independent trials of (A, B) relative to Z; then H[A₁, B₁, A₂, B₂] = 2H[A,B] − H[Z] (A.17), and the left side is H[A₁ − B₂|Z] − ½H[A₁|Z] − ½H[B₂|Z] (A.18).
2. Submodularity (A.19): H[A₁ − B₂] + H[A₁ − B₂, A₁, B₁] ≤ H[A₁ − B₂, A₁] + H[A₁ − B₂, B₁]. The second term is 2H[A,B] − H[Z]; each term on the right is at most H[A] + H[B], using A₁ − B₂ = A₂ − B₁ (A.20)–(A.22).
3. So H[A₁ − B₂|Z] ≤ H[A₁ − B₂] ≤ 2I[A : B] + H[Z], and H[A₁|Z] = H[B₂|Z] = H[A] + H[B] − I[A : B] − H[Z].

**Acceptance.**
- The source improves the constants of Tao's entropic BSG [37, Lemma 3.3].

**Dependencies.**
- In this packet: `shannon-entropy`, `entropic-ruzsa-distance`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — Appendix A, Lemma A.2 and proof, pp. 30–32 (AAM). The lemma and its proof.

#### `fibring-lemma` — The fibring lemma (Proposition 4.1)

*theorem* · planet **Fibring lemma** · proposed `TauCeti.EntropicPFR.rdist_eq_fibring`

Let π: H → H′ be a homomorphism of finite abelian groups and Z₁, Z₂ H-valued random variables. Then d[Z₁; Z₂] ≥ d[π(Z₁); π(Z₂)] + d[Z₁|π(Z₁); Z₂|π(Z₂)]. If Z₁, Z₂ are independent, the difference is I[Z₁ − Z₂ : (π(Z₁), π(Z₂)) | π(Z₁ − Z₂)] (4.1).

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.

**Proof, in steps.**
1. Take Z₁, Z₂ independent. By (A.15), d[Z₁|π(Z₁); Z₂|π(Z₂)] = H[Z₁ − Z₂|π(Z₁), π(Z₂)] − ½H[Z₁|π(Z₁)] − ½H[Z₂|π(Z₂)] ≤ H[Z₁ − Z₂|π(Z₁ − Z₂)] − … by submodularity.
2. H[Z₁ − Z₂|π(Z₁ − Z₂)] = H[Z₁ − Z₂] − H[π(Z₁ − Z₂)] and H[Zᵢ|π(Zᵢ)] = H[Zᵢ] − H[π(Zᵢ)], so the bound is d[Z₁; Z₂] − d[π(Z₁); π(Z₂)].
3. The slack is H[A|B] − H[A|B,C] = I[A : C|B] with A = Z₁ − Z₂, B = π(Z₁ − Z₂), C = (π(Z₁), π(Z₂)), and C determines B.

**Acceptance.**
- π = 0 gives d[Z₁|0; Z₂|0] = d[Z₁; Z₂]; π = id gives d[Z₁; Z₂] ≥ d[Z₁; Z₂] + 0.

**Dependencies.**
- In this packet: `entropic-ruzsa-distance`, `shannon-entropy`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §4, Proposition 4.1 and proof, pp. 16–17 (AAM). The proposition, with its explicit error term.

#### `fibring-corollary` — Fibring for four independent variables (Corollary 4.2)

*lemma* · proposed `TauCeti.EntropicPFR.fibring_four`

For independent Y₁, Y₂, Y₃, Y₄ in a finite abelian group, d[Y₁ − Y₃; Y₂ − Y₄] + d[Y₁|Y₁ − Y₃; Y₂|Y₂ − Y₄] + I[Y₁ − Y₂ : Y₂ − Y₄ | Y₁ − Y₂ − Y₃ + Y₄] = d[Y₁; Y₂] + d[Y₃; Y₄].

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.
- In characteristic 2 every sign may be replaced by + (Remark 4.3).

**Proof, in steps.**
1. Apply Proposition 4.1 with H = G × G, H′ = G, π(x, y) = x − y, Z₁ = (Y₁, Y₃), Z₂ = (Y₂, Y₄); by independence d[Z₁; Z₂] = d[Y₁; Y₂] + d[Y₃; Y₄].
2. Once π(Z₁) = Y₁ − Y₃ is fixed, Z₁ and Y₁ determine each other; so d[Z₁|π(Z₁); Z₂|π(Z₂)] = d[Y₁|Y₁ − Y₃; Y₂|Y₂ − Y₄].
3. The conditioning variable in (4.1) is π(Z₁ − Z₂) = π(Z₁) − π(Z₂) = Y₁ − Y₂ − Y₃ + Y₄; the source prints π(Z₁) + π(Z₂) (E5). Given it, Y₁ − Y₂ determines Y₃ − Y₄, and Y₂ − Y₄ determines Y₁ − Y₃.

**Acceptance.**
- (Y₁, Y₂, Y₃, Y₄) = (X₁, X₂, X̃₂, X̃₁) gives (5.1); (X₂, X₁, X̃₂, X̃₁) gives the identity of §6.

**Dependencies.**
- In this packet: `fibring-lemma`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §4, Corollary 4.2 and proof, p. 17 (AAM). The corollary; the conditioning sign is corrected (E5).

#### `conditional-distance-bound` — Conditioning costs at most half the mutual information (Lemma 5.2)

*lemma* · proposed `TauCeti.EntropicPFR.condRdist_le`

d[X|Z; Y|W] ≤ d[X; Y] + ½I[X : Z] + ½I[Y : W].

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.

**Proof, in steps.**
1. With independent copies, d[X|Z; Y|W] = H[X′ − Y′|Z′, W′] − ½H[X′|Z′] − ½H[Y′|W′] ≤ H[X′ − Y′] − ½H[X′|Z′] − ½H[Y′|W′] by (A.5), which is d[X′; Y′] + ½I[X′ : Z′] + ½I[Y′ : W′].

**Acceptance.**
- Z, W constant gives equality.

**Dependencies.**
- In this packet: `entropic-ruzsa-distance`, `shannon-entropy`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §5, Lemma 5.2 and proof, p. 19 (AAM). The lemma and its proof.

#### `distance-sum-bounds` — Distances to sums and to fibres (Lemma 5.3)

*lemma* · proposed `TauCeti.EntropicPFR.rdist_sub_sub_le`

For Y, Z independent: d[X; Y − Z] − d[X; Y] ≤ ½(H[Y − Z] − H[Y]) = ½d[Y; Z] + ¼H[Z] − ¼H[Y] (5.6), and d[X; Y|Y − Z] − d[X; Y] ≤ ½(H[Y − Z] − H[Z]) = ½d[Y; Z] + ¼H[Y] − ¼H[Z] (5.7).

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.

**Proof, in steps.**
1. (5.6): take X independent of (Y, Z); then d[X; Y − Z] − d[X; Y] = H[X − Y + Z] − H[X − Y] − ½H[Y − Z] + ½H[Y], and Madiman's inequality with Y replaced by −Y bounds the first difference by H[Y − Z] − H[Y].
2. (5.7): I[Y : Y − Z] = H[Y − Z] − H[Z]; apply Lemma 5.2 to (X, trivial) and (Y, Y − Z).

**Acceptance.**
- The source thanks Floris van Doorn for a sign correction to this statement found in the Lean formalization (footnote 7).

**Dependencies.**
- In this packet: `madiman-inequality`, `conditional-distance-bound`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §5, Lemma 5.3 and proof, pp. 20–21 (AAM). The lemma and its proof.

#### `distance-fibre-sum-bound` — Distance to a fibre of a double sum (Lemma 7.1)

*lemma* · proposed `TauCeti.EntropicPFR.condRdist_sub_sub_le`

For Y, Z, Z′ independent: d[X; Y − Z|Y − Z − Z′] − d[X; Y] ≤ ½(H[Y − Z − Z′] + H[Y − Z] − H[Y] − H[Z′]).

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.

**Proof, in steps.**
1. (5.7) with Y ↦ Y − Z and Z ↦ Z′ gives d[X; Y − Z|Y − Z − Z′] − d[X; Y − Z] ≤ ½(H[Y − Z − Z′] − H[Z′]); add (5.6).

**Acceptance.**
- Used six times in (7.3).

**Dependencies.**
- In this packet: `distance-sum-bounds`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §7, Lemma 7.1 and proof, p. 23 (AAM). The lemma and its proof.

#### `hundred-percent-case` — Distance zero means cosets of one subgroup (Lemma 2.2)

*lemma* · proposed `TauCeti.EntropicPFR.exists_subgroup_of_rdist_eq_zero`

If d[X₁; X₂] = 0, there is a subgroup H ≤ G such that p_{X₁} and p_{X₂} are translates of U_H; in particular d[X₁; U_H] = d[X₂; U_H] = 0.

**Hypotheses.**
- All random variables take values in finite types; Ω is a probability space and conditioning on an event of probability zero contributes zero weight.
- G is any finite abelian group; the source states it for G = 𝔽₂ⁿ.

**Proof, in steps.**
1. For independent copies, H[X₁′ − X₂′] ≥ H[X₁′ − X₂′|X₂′] = H[X₁′] and likewise H[X₂′]; averaging gives d ≥ 0, so equality holds in both, and X₁′ − X₂′ is independent of X₂′ and of X₁′. Hence p_{X₁ − s₂} = p_{X₁ − X₂} = p_{s₁ − X₂} for s₁, s₂ in the supports (2.4).
2. Let H = Sym(X₁) = Sym(X₂) = Sym(X₁ − X₂), the stabilizer of the distribution under translation; it is a subgroup contained in S − S. From (2.4), S₁ − S₁ = S₂ − S₂ = H.
3. H[X₁] = H[X₁ + U_H] ≥ log|H| by (A.11), while H[X₁] ≤ log|S₁| ≤ log|S₁ − S₁| = log|H|. Equality throughout forces X₁ uniform on S₁ = a₁ + H; likewise X₂.

**Acceptance.**
- A Dirac mass is uniform on a coset of the trivial subgroup.

**Dependencies.**
- In this packet: `entropic-ruzsa-distance`, `shannon-entropy`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §2, Lemma 2.2 and proof, pp. 7–8 (AAM). The lemma and its proof.

### The τ-minimization argument and the theorems

#### `tau-functional` — The functional τ and its minimizers

*definition* · proposed `TauCeti.EntropicPFR.tau`

For η > 0 and fixed reference distributions X₁⁰, X₂⁰ on G = 𝔽₂ⁿ, τ[X₁; X₂] = d[X₁; X₂] + ηd[X₁⁰; X₁] + ηd[X₂⁰; X₂] (2.1). A τ-minimizer is a pair of probability distributions minimizing τ; the source uses η = 1/9.

**Hypotheses.**
- τ depends only on the distributions of X₁, X₂; the references are never modified.
- In Lean, G is a finite ℤ/2-module; the definition makes sense for any finite abelian group.

**Construction or proof, in steps.**
1. Define tau and IsTauMinimizer on probability measures.
2. Existence: the pairs of probability distributions on the finite set G form a compact set, and d is continuous, so τ attains its minimum.
3. (2.3): τ[X₂⁰; X₁⁰] = (1 + 2η)d[X₁⁰; X₂⁰], by symmetry of d.
4. The conditioned form (3.15): minimality gives d[X₁′|Y₁; X₂′|Y₂] ≥ k − η(d[X₁⁰; X₁′|Y₁] − d[X₁⁰; X₁]) − η(d[X₂⁰; X₂′|Y₂] − d[X₂⁰; X₂]), by applying (3.12) to each pair of fibres and averaging.

**API.**

| name | role | statement |
|---|---|---|
| `TauCeti.EntropicPFR.IsTauMinimizer` | data | (μ₁, μ₂) are probability measures minimizing τ. |
| `TauCeti.EntropicPFR.MinimizerSetup` | data | The setting of Sections 5–7: a τ-minimizer (μ₁, μ₂) for η = 1/9 with four independent variables X₁, X₂, X̃₁, X̃₂ of laws μ₁, μ₂, μ₁, μ₂ on one probability space. |
| `TauCeti.EntropicPFR.exists_isTauMinimizer` | other | A minimizer exists. |
| `TauCeti.EntropicPFR.tau_swap` | example | (2.3): τ[X₂⁰; X₁⁰] = (1 + 2η)d[X₁⁰; X₂⁰]. |
| `TauCeti.EntropicPFR.IsTauMinimizer.condRdist_ge` | relation | (3.15): minimality in conditioned form. |

**Unit tests.**

- `tau-functional.tau_uniform_self` (computation) — With every distribution equal to U_H, τ = 0.
- `tau-functional.not_isTauMinimizer_zero` (non-example) — The zero measure is not a minimizer: minimizers are probability measures, and the formula would otherwise give junk values.
- `tau-functional.tau_nonneg` (characterisation) — τ ≥ 0 for probability measures and η ≥ 0.

**Where it is used.**
- tau-decrement — Proposition 2.1 is stated for τ-minimizers.
- entropic-pfr — Theorem 1.8 is deduced by taking a τ-minimizer.

**Acceptance.**
- The argument is not constructive because of the compactness step; Remark 2.3 sketches an algorithmic variant with worse constants.

**Dependencies.**
- In this packet: `entropic-ruzsa-distance`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §2, (2.1)–(2.3) and the proof of Theorem 1.8, pp. 6–9 (AAM). The functional and its minimizers.
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §3, (3.12) and (3.15), pp. 14–15 (AAM). The conditioned form of minimality.

#### `first-estimate` — First estimate: I₁ ≤ 2ηk (Section 5)

*lemma* · proposed `TauCeti.EntropicPFR.first_estimate`

In the minimizer setting, I₁ = I[X₁ + X₂ : X̃₁ + X₂ | S] ≤ 2ηk (3.13), and H[S] ≤ ½H[X₁] + ½H[X₂] + (2 + η)k − I₁ (5.8).

**Hypotheses.**
- G is an elementary abelian 2-group (a finite ℤ/2-module, i.e. 𝔽₂ⁿ); η = 1/9; ρ₁, ρ₂ are the reference distributions X₁⁰, X₂⁰; (μ₁, μ₂) minimizes τ; X₁, X₂, X̃₁, X̃₂ are independent with X₁, X̃₁ ∼ μ₁ and X₂, X̃₂ ∼ μ₂; k = d[X₁; X₂] and S = X₁ + X₂ + X̃₁ + X̃₂.

**Proof, in steps.**
1. Corollary 4.2 with (Y₁, Y₂, Y₃, Y₄) = (X₁, X₂, X̃₂, X̃₁) gives d[X₁ + X̃₂; X₂ + X̃₁] + d[X₁|X₁ + X̃₂; X₂|X₂ + X̃₁] + I₁ = 2k (5.1).
2. Minimality (3.12), (3.15) bounds each distance below by k − η(…) (5.2). Lemma 5.3 bounds each bracket: the four differences are ½k ± ¼(H[X₂] − H[X₁]), and they add in pairs to k (5.3), (5.4). So I₁ ≤ 2ηk.
3. Subtracting (5.2) from (5.1) and using (5.4) gives d[X₁ + X̃₂; X₂ + X̃₁] ≤ (1 + η)k − I₁, which is (5.8) because H[X₁ + X̃₂] = H[X₂ + X̃₁] = k + ½H[X₁] + ½H[X₂].

**Acceptance.**
- Only I₁ = O(ηk) is needed for some constant in Theorem 1.8 (Remark 5.1).

**Dependencies.**
- In this packet: `fibring-corollary`, `tau-functional`, `distance-sum-bounds`, `conditional-distance-bound`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §5, (5.1)–(5.8), pp. 18–21 (AAM). The estimate and the entropy bound (5.8).

#### `second-estimate` — Second estimate: the bound (3.14) on I₂ (Section 6)

*lemma* · proposed `TauCeti.EntropicPFR.second_estimate`

In the minimizer setting, I₂ = I[X₁ + X₂ : X₁ + X̃₁ | S] ≤ 2ηk + 2η(2ηk − I₁)/(1 − η).

**Hypotheses.**
- G is an elementary abelian 2-group (a finite ℤ/2-module, i.e. 𝔽₂ⁿ); η = 1/9; ρ₁, ρ₂ are the reference distributions X₁⁰, X₂⁰; (μ₁, μ₂) minimizes τ; X₁, X₂, X̃₁, X̃₂ are independent with X₁, X̃₁ ∼ μ₁ and X₂, X̃₂ ∼ μ₂; k = d[X₁; X₂] and S = X₁ + X₂ + X̃₁ + X̃₂.
- By symmetry I₃ = I[X̃₁ + X₂ : X₁ + X̃₁ | S] equals I₂.

**Proof, in steps.**
1. Corollary 4.2 with (X₂, X₁, X̃₂, X̃₁) gives d[X₁ + X̃₁; X₂ + X̃₂] + d[X₁|X₁ + X̃₁; X₂|X₂ + X̃₂] + I₂ = 2k.
2. Minimality and Lemma 5.3 (each bracket at most ½d[Xᵢ; Xᵢ]) give I₂ ≤ η(d[X₁; X₁] + d[X₂; X₂]) (6.4) and d[X₁ + X̃₁; X₂ + X̃₂] ≥ k − (η/2)(d[X₁; X₁] + d[X₂; X₂]) (6.5).
3. Expanding the same distance and using (5.8) gives d[X₁ + X̃₁; X₂ + X̃₂] ≤ (2 + η)k − ½(d[X₁; X₁] + d[X₂; X₂]) − I₁; with (6.5), d[X₁; X₁] + d[X₂; X₂] ≤ 2k + 2(2ηk − I₁)/(1 − η) (6.6), and (6.4) concludes.

**Acceptance.**
- The Ruzsa triangle inequality would give the weaker bound 4ηk.

**Dependencies.**
- In this packet: `fibring-corollary`, `tau-functional`, `distance-sum-bounds`, `first-estimate`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §6, (6.1)–(6.6), pp. 21–23 (AAM). The estimate and its proof.

#### `endgame-lemma` — The endgame construction (Lemma 7.2)

*lemma* · proposed `TauCeti.EntropicPFR.exists_endgame_pair`

Let G = 𝔽₂ⁿ and (T₁, T₂, T₃) be G³-valued with T₁ + T₂ + T₃ = 0, and δ = Σ_{i<j} I[Tᵢ : Tⱼ]. Then there are T₁′, T₂′ with d[T₁′; T₂′] + η(d[X₁⁰; T₁′] − d[X₁⁰; X₁]) + η(d[X₂⁰; T₂′] − d[X₂⁰; X₂]) ≤ δ + (η/3)(δ + Σ_{i=1}^{2} Σ_{j=1}^{3} (d[Xᵢ⁰; Tⱼ] − d[Xᵢ⁰; Xᵢ])).

**Hypotheses.**
- The source writes I[Tᵢ; Tⱼ] in (7.5) for the mutual information I[Tᵢ : Tⱼ] (E6).
- η ≥ 0 and the references X₁⁰, X₂⁰ and X₁, X₂ are as in the τ setting.

**Proof, in steps.**
1. Entropic BSG with (A, B) = (T₁, T₂) (so A + B = T₃): Σ_t p_{T₃}(t) d[(T₁|T₃=t); (T₂|T₃=t)] ≤ 3I[T₁ : T₂] + 2H[T₃] − H[T₁] − H[T₂] = δ, because each pair of the Tᵢ determines the third.
2. Lemma 5.2: d[X₁⁰; T₁|T₃] − d[X₁⁰; X₁] ≤ d[X₁⁰; T₁] − d[X₁⁰; X₁] + ½I[T₁ : T₃], and likewise for T₂.
3. Choose t₃ minimizing ψ[(T₁|T₃=t₃); (T₂|T₃=t₃)] (7.7). Do the same for all six permutations and average: each Tⱼ occurs twice in each position, and the mutual-information terms average to δ/3.

**Acceptance.**
- If δ = 0 the Tᵢ are pairwise independent and two of them already work, by (3.9).

**Dependencies.**
- In this packet: `entropic-bsg`, `conditional-distance-bound`, `entropic-ruzsa-distance`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §7, Lemma 7.2 and proof, pp. 25–26 (AAM). The lemma and its proof; (7.5) notation corrected (E6).

#### `tau-decrement` — A τ-minimizer has distance zero (Proposition 2.1)

*lemma* · proposed `TauCeti.EntropicPFR.rdist_eq_zero_of_isTauMinimizer`

Let η = 1/9. If (X₁, X₂) minimizes τ, then d[X₁; X₂] = 0. Equivalently (Proposition 2.1), if d[X₁; X₂] > 0 there are X₁′, X₂′ with τ[X₁′; X₂′] < τ[X₁; X₂].

**Hypotheses.**
- G is an elementary abelian 2-group (a finite ℤ/2-module, i.e. 𝔽₂ⁿ); η = 1/9; ρ₁, ρ₂ are the reference distributions X₁⁰, X₂⁰; (μ₁, μ₂) minimizes τ; X₁, X₂, X̃₁, X̃₂ are independent with X₁, X̃₁ ∼ μ₁ and X₂, X̃₂ ∼ μ₂; k = d[X₁; X₂] and S = X₁ + X₂ + X̃₁ + X̃₂.

**Proof, in steps.**
1. Set U = X₁ + X₂, V = X̃₁ + X₂, W = X₁ + X̃₁; then I₁ = I[U : V|S], I₂ = I[W : U|S], I₃ = I[V : W|S], and by the two estimates their sum is at most 6ηk − ((1 − 5η)/(1 − η))(2ηk − I₁) (7.2).
2. Six applications of Lemma 7.1 and (5.8) give Σ_{i,A∈{U,V,W}} (d[Xᵢ⁰; A|S] − d[Xᵢ⁰; Xᵢ]) ≤ (6 − 3η)k + 3(2ηk − I₁) (7.3); for W the distance to X₂⁰ is computed through W′ = X₂ + X̃₂ = W + S.
3. Characteristic 2: U + V + W = 0 (7.4). Apply Lemma 7.2 to (U, V, W | S = s), then minimality (3.12), and average over s: k ≤ δ̃ + (η/3)(δ̃ + Σ(…)) (7.8).
4. Combine: k ≤ (8η + η²)k − c(2ηk − I₁) with c ≥ 0 when η(2η + 17) ≤ 3, and 2ηk − I₁ ≥ 0 by (3.13). For η = 1/9, 8η + η² = 73/81 < 1, so k = 0.

**Acceptance.**
- Over ℤ the statement fails: discrete Gaussians are near-minimal (p. 14); the characteristic-2 identity (7.4) is essential.

**Dependencies.**
- In this packet: `first-estimate`, `second-estimate`, `endgame-lemma`, `distance-fibre-sum-bound`, `tau-functional`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §2, Proposition 2.1, p. 7; §7, pp. 23–27 (AAM). The proposition and the endgame computation.

#### `entropic-pfr` — Entropic polynomial Freiman–Ruzsa theorem (Theorem 1.8)

*theorem* · planet **Entropic polynomial Freiman–Ruzsa theorem** · proposed `TauCeti.EntropicPFR.entropic_pfr`

Let G = 𝔽₂ⁿ and X₁⁰, X₂⁰ G-valued random variables. There is a subgroup H ≤ G with d[X₁⁰; U_H] + d[X₂⁰; U_H] ≤ 11d[X₁⁰; X₂⁰]; moreover each of d[X₁⁰; U_H], d[X₂⁰; U_H] is at most 6d[X₁⁰; X₂⁰].

**Hypotheses.**
- U_H is the uniform distribution on H. In Lean, G is a finite ℤ/2-module.

**Proof, in steps.**
1. Take a τ-minimizer (X₁, X₂) (compactness). By Proposition 2.1, d[X₁; X₂] = 0, so Lemma 2.2 gives H with d[X₁; U_H] = d[X₂; U_H] = 0.
2. The triangle inequality gives d[Xᵢ⁰; U_H] = d[Xᵢ⁰; Xᵢ], so η(d[X₁⁰; U_H] + d[X₂⁰; U_H]) = τ[X₁; X₂] ≤ τ[X₂⁰; X₁⁰] = (1 + 2η)d[X₁⁰; X₂⁰] (2.3). With η = 1/9 this is 11d[X₁⁰; X₂⁰].
3. |d[X₁⁰; U_H] − d[X₂⁰; U_H]| ≤ d[X₁⁰; X₂⁰] by the triangle inequality, so each is at most 6d[X₁⁰; X₂⁰].

**Acceptance.**
- X₁⁰ = X₂⁰ uniform on a subgroup H gives H itself, with all distances 0.

**Dependencies.**
- In this packet: `tau-functional`, `tau-decrement`, `hundred-percent-case`, `entropic-ruzsa-triangle`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §1, Theorem 1.8, p. 5; §2, its proof, pp. 8–9 (AAM). The theorem and its deduction from Proposition 2.1.

#### `marton-conjecture` — Marton's conjecture in characteristic 2 (Theorem 1.2)

*theorem* · planet **Marton's conjecture in characteristic 2** · proposed `TauCeti.EntropicPFR.pfr`

If A ⊆ 𝔽₂ⁿ is nonempty with |A + A| ≤ K|A|, then A is covered by at most 2K¹² cosets of some subgroup H ≤ 𝔽₂ⁿ of size at most |A|.

**Hypotheses.**
- C = 12 comes from C′ = 11 in Theorem 1.8. Liao's refinement (C = 11, then 9) is not planned.

**Proof, in steps.**
1. With U_A uniform on A, H[U_A] = log|A| and H[U_A + U_A′] ≤ log|A + A|, so d[U_A; U_A] ≤ log K. Theorem 1.8 gives H with d[U_A; U_H] ≤ ½C′ log K (B.1), hence |log|H| − log|A|| ≤ C′ log K (B.2).
2. (B.1) says H[U_A − U_H] ≤ ½log(|A||H|) + ½C′ log K; by (A.2) some x₀ has |A ∩ (H + x₀)| ≥ K^{−C′/2}|A|^{1/2}|H|^{1/2}.
3. Ruzsa covering (Mathlib ruzsa_covering_mul, additive form) covers A by at most K|A|/|A ∩ (H + x₀)| ≤ K^{C′/2+1}(|A|/|H|)^{1/2} translates of (A ∩ (H + x₀)) − (A ∩ (H + x₀)) ⊆ H.
4. If |H| ≤ |A| this is at most K^{C′+1} by (B.2). Otherwise cover H by at most 2|H|/|A| cosets of a subgroup H′ with |H′| ≤ |A|, giving at most 2K^{C′/2+1}(|H|/|A|)^{1/2} ≤ 2K^{C′+1} cosets.

**Acceptance.**
- If A is a subgroup, K = 1 and one coset suffices.
- Conversely, a cover by r cosets of H with |H| ≤ |A| gives |A + A| ≤ (r(r−1)/2 + 1)|A|, so the theorem is polynomially sharp (p. 1).
- The factor 2 is needed when A is most of a subgroup (footnote 1).

**Dependencies.**
- In this packet: `entropic-pfr`, `entropic-ruzsa-distance`, `shannon-entropy`
- On the pinned libraries: `mathlib:Finset.ruzsa_covering_mul`

**Sources.**
- Gowers–Green–Manners–Tao, *On a conjecture of Marton* (accepted manuscript) — §1, Conjecture 1.1 and Theorem 1.2, pp. 1–2; Appendix B, pp. 32–33 (AAM). The theorem and the deduction from Theorem 1.8.

### Source findings

Two new, unreviewed misprints were found. Both appear in the accepted manuscript and in arXiv v2; the published text was not read.
- **E5.** The proof of Corollary 4.2 conditions on π(Z₁) + π(Z₂) where π(Z₁) − π(Z₂) = π(Z₁ − Z₂) is meant. Corollary 4.2 is stated for general abelian groups; in characteristic 2 the two agree.
- **E6.** (7.5) writes I[Tᵢ; Tⱼ] for the mutual information I[Tᵢ : Tⱼ].

Every other computation was rechecked while planning the nodes and holds. This includes the constants 11 and 6, the conditions η(2η + 17) ≤ 3 and 8η + η² < 1 for η = 1/9, the identities (6.6) and (7.2), and the Appendix B arithmetic.

### Remaining in AC.1

- The combinatorial Balog–Szemerédi–Gowers theorem, Freiman's theorem over ℤ, Bohr-set regularity and density increments.
- The bounded-torsion version of Marton's conjecture (GGMT [6]).
- Liao's constants.
- The consequences Theorem 1.3 and Corollaries 1.4–1.7, which the source proves by reference (gap).

### Verification of the Marton checkpoint

- The new `TauCeti.EntropicPFR` Lean section imports Mathlib only.
  - Standalone, on Lean 4.34.0-rc2 against Mathlib 082e2d3, it elaborates with no errors and only proof-placeholder warnings.
  - The whole suggested file also imports a Tau Ceti module, and no pinned Tau Ceti build is available here, so the full file was not elaborated.
- The value d[X; X] = (2/3)·log(3/2) for X uniform on {0, e₁, e₂} was checked numerically.
- The official checker passes with only the six inherited excerpt-length warnings of AC.4, as do the intake check and the unit tests.
