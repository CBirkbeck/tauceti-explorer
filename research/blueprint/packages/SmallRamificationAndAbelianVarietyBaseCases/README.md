# Small ramification and the base cases for Serre modularity

This roadmap develops the arithmetic results that terminate the level-one
arguments for Serre modularity. Its first tools turn a small local different
into a small global discriminant. In characteristics two and three, finite
subgroup theory then makes an absolutely irreducible representation impossible.
For abelian varieties, the corresponding argument starts with finite flat
torsion, determines its simple factors and extensions, and compares growing
torsion with a fixed finite-field point count. Fontaine's theorem and Schoof's
five-prime theorem are the resulting geometric base cases. Finally, a
realisation theorem for weight-two representations brings these geometric
results back to residual representations and supplies a precise table of
terminal weights.

The endpoint is a collection of independent base cases, rather than the full
induction proving Serre's conjecture. The consumers are
`ClassicalSerreModularity:R26.1`, `R26.5` and `R33.4`. In particular, the argument
below never assumes the level-one modularity theorem it will help prove.
Compatible systems, minimal lifts, ordinary modularity lifting and potential
modularity are imported from their owners. Finite flat group schemes, local
reciprocity, ramification filtrations, abelian schemes and Néron models are also
imported. Here we specialise their theorems, carry out the small arithmetic
calculations, and assemble the contradictions.

There are six layers:

| Layer | Mathematical output |
| --- | --- |
| R25.1 | Normalised local differents, sharp bounds at 2 and 3, and unconditional discriminant certificates |
| R25.2 | Tate's characteristic-two theorem and Serre's characteristic-three theorem |
| R25.3 | Fontaine's theorem: an abelian variety over ℚ with good reduction everywhere has dimension zero |
| R25.4 | Schoof's theorem for a semistable abelian variety with good reduction away from 2, 3, 5, 7 or 13 |
| R25.5 | GL₂-type realisation, local transition checks, and the terminal characteristic and weight arguments |
| R25.6 | The base-case table and the theorem asserting its rows |

## Conventions and interfaces

Throughout, $p$ and $\ell$ denote rational primes; when both occur in a
finite-flat argument, $p\ne\ell$. A residual coefficient field is finite and
has the discrete topology. Absolute irreducibility means irreducibility after
extension to an algebraic closure. A continuous representation into
$\mathrm{GL}_2(\overline{\mathbb F}_p)$, with discrete target, has finite image
and descends to a finite coefficient field. This descent is supplied by
`ArithmeticGaloisRepresentations:R01.1`. All changes of coefficient field below
respect this convention.

For a finite extension $E/\mathbb Q_p$, write $e(E)$ and $f(E)$ for its
ramification index and residue degree. The integer $d(E)$ is the exponent of
the different measured with $v_E(\pi_E)=1$. Its *normalised* different is
$\delta(E)=d(E)/e(E)$. Thus the valuation used to compare local and global
discriminants has $v_p(p)=1$. The exponent of the local discriminant is
$f(E)d(E)$, and $\delta(E)$ is also that exponent divided by
$[E:\mathbb Q_p]$. The valuations on an extension must restrict to the
specified base valuation; merely providing unrelated discrete valuations does
not express this situation.

For a number field $K$, $d_K$ denotes its absolute discriminant,
$n=[K:\mathbb Q]$, and $\operatorname{rd}(K)=\vert d_K\vert ^{1/n}$. Write
$r_1+2r_2=n$ for its signature. Root discriminants are positive real numbers.
All explicit-formula bounds in this roadmap are unconditional; they require
positivity throughout the critical strip, not just on its central line.

For a finite commutative flat group scheme, order means its finite locally free
rank. A simple object is nonzero and has no proper nonzero closed flat
subgroup. In an extension written $0\to H\to G\to Q\to0$, the Ext group is
$\operatorname{Ext}^1(Q,H)$. In particular,
$\operatorname{Ext}^1(\mu_p,\mathbb Z/p\mathbb Z)$ concerns a *constant
subobject* and a *multiplicative quotient*. Keeping this direction fixed is
essential to the reordering argument.

An abelian variety is defined over the number field indicated in its notation;
endomorphisms used for GL₂-type are defined over that same field. An abelian
variety of dimension zero is the trivial one. The pinned Tau Ceti dimension
has values in `WithBot ℕ∞`, so an equality with a natural number uses the
canonical coercion. The realisation theorem uses Snowden's Hodge–Tate
convention, in which the cyclotomic character has weight −1 and weight two
means weights $\{0,-1\}$. The compatible-system and lifting arguments often
use the opposite convention $\{0,k-1\}$; the interface must translate this
sign before applying either theorem.

The symbol $k(\bar\rho)$ means Serre's weight of the representation itself.
It does not mean the smallest weight among cyclotomic twists. A statement
about that smallest weight says so explicitly. This distinction is particularly
important at $(p,k)=(11,14)$.

The proposed declaration namespace is `TauCeti.SmallRamification`.
[Suggested.lean](Suggested.lean) records the definitions, theorem signatures,
API lemmas and test statements that can be expressed with the available
interfaces. Its header specifies the signatures requiring a future supplier
interface; these remain mathematical statements here. An unimplemented
condition such as crystallinity is never replaced by a vacuous proposition.

## Library starting point and neighbouring roadmaps

The mathematical baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Mathlib already defines discriminants,
different ideals, ramification indices, residue degrees, cyclotomic extensions,
class numbers, absolute Galois groups and matrix groups. Its Minkowski bound
and its level-one modular-form dimensions provide genuine parts of the proofs.
Tau Ceti supplies finite locally free commutative affine group schemes, Cartier
duality, abelian varieties, unit filtrations, some different estimates, and the
positive-definite Fourier tools. These objects are used directly.

The new work is the local representation-specific different bounds, the
explicit discriminant inequalities and certificates, the finite-flat
classification and filtration arguments, and the terminal applications. The
existence of an abelian-variety structure alone does not provide integral
models, the Néron–Ogg–Shafarevich criterion, a Tate-module endomorphism theorem,
or independence of the auxiliary prime. Similarly, the definition of a unit
filtration alone does not provide its image under reciprocity.

The interfaces needed from neighbouring roadmaps are as follows. Stage IDs
identify the owner of the general result, and each description states the
part used here.

| Owner | Required interface and use |
| --- | --- |
| `ArithmeticGaloisRepresentations:R01.1` | Finite coefficient descent and absolute irreducibility under scalar extension; used in R25.2 |
| `ArithmeticGaloisRepresentations:R01.2` | Decomposition groups, inertia, kernel fields and their ramification; used to connect representations to completions |
| `ArithmeticGaloisRepresentations:R01.4` | Dickson classification, normal p-subgroup fixed vectors, and the cyclotomic restriction criterion; used in R25.1, R25.2 and R25.5 |
| `ArithmeticGaloisRepresentations:R01.6` | Rational and λ-adic Tate modules with restriction and scalar extension; used in realisation |
| `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group` | Completeness and deep-unit power maps or logarithms, with compatible valuation normalisations |
| `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration` | Different formula, upper and lower ramification, Herbrand's theorem and Hasse–Arf |
| `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group` | Tame inertia and Frobenius conjugation; used for prime-to-p characters |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors` | Local Artin reciprocity on unit filtrations and equivariance under field automorphisms |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields` | Hilbert and ray class fields, Kronecker–Weber and conductor–discriminant calculations, using the class-field correspondence of upstream L12 |
| `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places` | Localisation of the different, completions and decomposition degrees |
| `Tau Ceti NumberFieldArithmetic, Layer 6` | Compatibility of local ramification with global inertia |
| `AnalyticNumberTheory:AN.4` | The completed Dedekind-zeta explicit formula for admissible even test functions, including its zero, prime and pole terms; it uses AN.3 |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` | Flat closure and quotient, Oort–Tate order-p classification, étale Galois modules, gluing of Hom and Ext, Cartier duality and Katz–Mazur extensions |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6` | Fontaine's strict different bound for a finite flat group scheme killed by p |
| `AbelianSchemesAndArithmeticModuli:A2` | Polarizations and isogenies to the dual abelian variety |
| `AbelianSchemesAndArithmeticModuli:A3` | Finite flat torsion of rank $p^{2gn}$, finite flat quotients and duality of torsion |
| `AbelianSchemesAndArithmeticModuli:A6` | Finite-field Frobenius and degree of $1-F$, point counts under isogeny, rational endomorphisms, Poincaré decomposition, Weil restriction and induction of Tate modules |
| `NeronModelsAndSemistableAbelianVarieties:R11.1` | Good reduction and extension to an abelian scheme |
| `NeronModelsAndSemistableAbelianVarieties:R11.3` | Grothendieck's monodromy criterion and $(\sigma-1)^2=0$ for semistable torsion |
| `NeronModelsAndSemistableAbelianVarieties:R11.5` | λ-independent Weil–Deligne parameters and the good, semistable and multiplicative reduction criteria, including p-adic comparison |
| `ClassicalArithmeticCompletion:CA.5/class-group-generated-by-small-primes` | Class groups generated by prime ideals within the Minkowski bound |
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory` | Kummer cohomology, S-units, class groups and the exact local-to-global Ext sequence |
| `PotentialModularityAndCompatibleSystems:R23.4` | Potential modularity over a totally real Galois extension disjoint from a prescribed residual field |
| `PotentialModularityAndCompatibleSystems:R24.3` | Minimal crystalline lifts and weight-two Steinberg lifts with specified ramification |
| `PotentialModularityAndCompatibleSystems:R24.5` | Almost strictly compatible systems containing the lift and the local compatibility needed at auxiliary primes |
| `GL2AutomorphicRepresentationsAndTransfer:R17.3` | Jacquet–Langlands transfer to a quaternion algebra split at one real place over an odd-degree totally real field |
| `GL2AutomorphicRepresentationsAndTransfer:R17.4` | Solvable base-change descent of the modular representation |
| `HilbertModularVarietiesAndShimuraCurves:R18.6` | Weight-two quaternionic forms realised in the Tate module of a Shimura-curve Jacobian |
| `FaltingsFinitenessAndIsogenyTheorems:R28.4` | The Tate-module endomorphism and isogeny theorem, used in GL₂-type descent |
| `OrdinaryAutomorphicFormsAndModularityLifting:R21.5` | Fontaine–Laffaille and Berger–Li–Zhu ordinary criteria, followed by the p-distinguished Skinner–Wiles theorem |
| `AlgebraicModularFormsAndSerreWeights:R15.4` | The full local weight recipe, cyclotomic twisting, parity and niveau-two characters |
| `AutomorphicGaloisRepresentations:R19.4`, `R19.5` | Carayol and Saito local–global compatibility; these turn the lift's local ramification into level one for its modular form |

These interfaces are prerequisites, not new definitions in this roadmap. In
particular, the geometric arguments use the stated parts of R11 and R28;
they do not require the entire finiteness theory or a general classification
of Néron-model component groups.

## R25.1 — Local and global discriminant bounds

The layer separates three tasks: normalising local ramification, proving the
two small-characteristic estimates, and obtaining lower bounds for number
fields. The first two feed Tate–Serre directly. The analytic part is needed
for the characteristic-three case and for the larger auxiliary fields in
Schoof's argument.

### Normalised local differents

The target `R25.1/local-root-discriminant-exponent` defines
`localRootDiscrExp p E` as $d(E)/e(E)$, a rational number. Its purpose is to
measure the exponent of p in a global root discriminant. It must therefore
keep the local ramification index separate from the total extension degree.
The baseline declarations are `Padic`, `differentIdeal`,
`pow_sub_one_dvd_differentIdeal` and
`TauCeti.not_pow_ramificationIdx_dvd_differentIdeal`; the full tower and
ramification formulas come from local-fields upstream L3.

The user-facing API has the following statements, with finite-extension and
compatible-valuation hypotheses throughout:

| Proposed declaration | Statement and use |
| --- | --- |
| `localRootDiscrExp` | Constructor $d(E)/e(E)$ |
| `localRootDiscrExp_eq_discriminantExponent_div` | Equality with $v_p(\operatorname{disc}(E))/[E:\mathbb Q_p]$, used in globalisation |
| `localRootDiscrExp_eq_sum_upper` | For Galois E, the sum over upper jumps u of $(\vert G^{u+}\vert ^{-1}-\vert G^u\vert ^{-1})(u+1)$, used in the wild bounds |
| `localRootDiscrExp_eq_zero_iff` | Vanishing is equivalent to being unramified |
| `localRootDiscrExp_of_tame` | If p does not divide e, the value is $1-1/e$ |
| `localRootDiscrExp_of_isUnramified` | An unramified extension $E'/E$ preserves the exponent |
| `localRootDiscrExp_congr` | A base-preserving valued field isomorphism preserves it |
| `localRootDiscrExp_tower` | For $\mathbb Q_p\subseteq E\subseteq E'$, the value is $\delta(E)+d(E'/E)/e(E'/\mathbb Q_p)$; hence it increases in a tower |

The jump sum uses right limits at a break and includes the tame break at zero.
It follows from the different formula by grouping the lower-index terms with
Herbrand's function. For a tame extension the single contribution is
$1-1/e$, providing an immediate convention check. Jones, §1.1, equations
(1) and (3), pp. 2–3, calls this quantity a mean slope.

Five tests establish the normalisation. For $\mathbb Q_2(i)$ the value is 1;
for $\mathbb Q_2(\sqrt2)$ it is $3/2$. More decisively,
$\mathbb Q_2(\zeta_{12})$ has $e=f=2$, different exponent 2 and
discriminant exponent 4, so its value is 1. Dividing the different exponent
by the degree would instead give $1/2$, while dividing the discriminant
exponent by e would give 2. For
$\mathbb Q_3(\zeta_3,\sqrt[3]3)$, the degree is 6 and discriminant exponent
11, giving $11/6$. Finally, the base field and an unramified quadratic
extension both have value zero. The proposed test names are
`localRootDiscrExp_two_adic_i`, `localRootDiscrExp_two_adic_sqrt_two`,
`localRootDiscrExp_two_adic_zeta_twelve`,
`localRootDiscrExp_three_adic_pure_cubic` and `localRootDiscrExp_self`.

The next target, `R25.1/root-discriminant-of-galois-field`, proves that a
Galois number field K satisfies

$$
\operatorname{rd}(K)=\prod_p p^{\delta(K_{\mathfrak p})},
$$

where any prime above p may be chosen and only ramified primes contribute.
There are g primes above p, all with the same e, f and different exponent d;
the degree formula $gef=n$ gives $v_p(\vert d_K\vert )=gfd=n\delta$. Use
`NumberField.absNorm_differentIdeal`,
`NumberField.not_dvd_discr_iff_isUnramifiedIn`, `NumberField.rootDiscr_def`,
`NumberField.discr`, `IsGalois` and
`Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn`, together with
completion compatibility from number-field upstream L5–L6. The one-prime
case is $\operatorname{rd}(K)=p^{\delta(K_{\mathfrak p})}$. Checks include
$\mathbb Q(\sqrt{-3})$, with root discriminant $\sqrt3$, and the real
cubic subfield of $\mathbb Q(\zeta_9)$, with discriminant 81 and exponent
$4/3$. See Jones, §3.1, p. 9, and Moon–Taguchi, §3, pp. 6–7.

### Inertia and power maps on units

`R25.1/prime-to-p-character-inertia` concerns a finite abelian quotient of a
local Galois group whose order is prime to p. If the residue field has q
elements, its inertia is cyclic of order dividing $q-1$. Wild inertia is
killed because it is a p-group (`IsPGroup`), while the tame relation
$\phi\tau\phi^{-1}=\tau^q$ becomes $\tau^{q-1}=1$ in an abelian
quotient. Thus a prime-to-2 character over $\mathbb Q_2$ is unramified;
over $\mathbb Q_3$ its inertia has order at most two. The residue field
must be that of the base field, not of an arbitrary unramified enlargement.
Local-fields upstream L4 supplies the tame relation. See Moon–Taguchi, §2,
after (2.1), p. 2, and Jones, §2.3, p. 9.

`R25.1/wild-image-borel-normal-form` places a faithful finite local image
$D\subseteq\mathrm{GL}_2(\overline{\mathbb F}_p)$ in upper-triangular form
when its wild inertia $P$ is nontrivial. A nontrivial unipotent element
has a unique fixed line; normality of P makes that line D-stable. On this
basis P consists of upper-unitriangular matrices, hence is elementary
abelian, and conjugation acts on its additive parameters through the ratio
of the diagonal characters. The preceding character result makes $I/P$
cyclic of order dividing $p-1$. In particular $I=P$ for p=2.
`ArithmeticGaloisRepresentations:R01.4` supplies fixed vectors for p-groups;
`Matrix.GeneralLinearGroup`, `IsPGroup` and `Subgroup.normalizer` supply the
ambient language. The characteristic-three S₃ image and the characteristic-two
upper-unitriangular group with four elements test the assertion. The claim
does not assert that the *global* irreducible image is triangular. See
Moon–Taguchi, §2, p. 2 and the proof of Lemma 1, p. 3; the same fixed-line
argument works in either characteristic.

`R25.1/unit-filtration-power-maps` provides the precise local calculations
used after reciprocity. Write $U^i=1+\mathfrak m^i$ for a local field with
surjective integral valuation. For an unramified extension of $\mathbb Q_2$,
$U^3\subseteq(U^1)^2$, and the image of $U^2$ modulo squares has order
at most two. At the critical step, squaring induces the Artin–Schreier map
$a\mapsto a^2+a$ on the finite residue field, whose cokernel has size two.
For an unramified extension of $\mathbb Q_3$,
$U^2\subseteq(U^1)^3$. For absolute ramification index two in residue
characteristic three, $(U^1)^3\subseteq U^3$,
$U^4\subseteq(U^1)^3$, and

$$
[U^3:U^4((U^1)^3\cap U^3)]\le3.
$$

Indeed, the critical graded map is $a\mapsto a^3+\theta_0a$, with kernel
of size at most three; subsequent graded maps are bijective and completeness
lifts the roots. For a ramified quadratic extension in characteristic three,
its nontrivial involution acts on $U^i/U^{i+1}$ by $(-1)^i$. Choose a
uniformizer carried to its negative and expand $1+a\pi^i$; this proves
the equivariance needed below. These are instances of Fesenko–Vostokov,
Ch. I, (5.7), pp. 14–15, and (5.8), Corollary 2, p. 16. The starting
declaration is `TauCeti.unitFiltration`; the completeness and valuation
interfaces belong to local-fields upstream L1.

### Sharp bounds in characteristics two and three

`R25.1/two-adic-different-bound` proves $\delta(E)\le2$ for a finite Galois
extension $E/\mathbb Q_2$ whose group embeds faithfully in
$\mathrm{GL}_2(\overline{\mathbb F}_2)$. If its wild inertia has order at
most two, the sharper bound is $\delta(E)\le3/2$. These hypotheses concern
an actual two-dimensional representation; they do not bound all 2-adic
extensions.

The tame case has $\delta<1$. Otherwise the Borel form gives $I=P$.
Over the maximal unramified subfield, unit reciprocity and the square maps
show that the upper breaks are at most two and that $a=\vert P^2\vert $ is either
one or two. The different sum becomes

$$
\delta(E)=3-\frac1a-\frac2{|P|}.
$$

For a nonabelian local image the diagonal ratio acts nontrivially on P.
An order-two stable subgroup would have trivial action on its only nonzero
element, so $a=1$. The value is then $2-2/\vert P\vert $. For an abelian image,
inertia is a quotient of the units of $\mathbb Q_2$ modulo squares, with
order at most four; the possible character conductors give $\delta\le2$.
If $\vert P\vert \le2$, the same calculation gives $\delta\le3/2$.
The extension $\mathbb Q_2(\zeta_8)$ reaches 2, with character conductors
0, 2, 3 and 3, so replacing the bound by a strict inequality would fail.

The inputs are the preceding four local targets, local Artin reciprocity
including equivariance, and R01.4. Moon–Taguchi, Lemma 3 and its proof,
§2, pp. 4–5, supply the unit-character computation and nonabelian branch.
Their statement has an unramified quadratic *base*; the abelian branch here
instead uses the units of $\mathbb Q_2$. Jones, §2.3, pp. 8–9, records
Tate's original estimate $5/2-2/\vert P\vert $, which is weaker than the sharp bound
proved here. Attribution to Tate does not substitute for the two new branches.

`R25.1/three-adic-different-bound` proves

$$
\delta(E)\le\frac{13}{6}-\frac1{|P|}
$$

for a faithfully represented finite Galois extension of $\mathbb Q_3$
with nontrivial wild inertia P. If $I=P$, the unit calculation over the
unramified base gives $2-2/\vert P\vert $, which is smaller. Otherwise $I/P$ has
order two. Let $E_1/E_0$ be this ramified quadratic tame extension.
The action on P has sign $\varepsilon=\pm1$, determined by the diagonal
ratio. Reciprocity carries $U^i(E_1)$ to the upper ramification groups
and intertwines the quadratic involution. Its graded action is
$(-1)^i$; incompatible signs force the corresponding image to disappear.

When $\varepsilon=-1$, the upper breaks over $E_0$ can be $1/2$ and
$3/2$. The last subgroup has order $a\le3$, by the critical cube map,
and the different is $5/2-1/\vert P\vert -1/a$. When $\varepsilon=1$, the odd
graded pieces are absent, so only the break at one over $E_0$ remains and the different is
$2-3/(2\vert P\vert )$. Both are at most $13/6-1/\vert P\vert $. For $\vert P\vert =3$ this is
$11/6$, attained by the splitting field of $X^3-3$. The compositum
$\mathbb Q_3(\zeta_3,\sqrt[3]2,\sqrt[3]3)$ has $\vert P\vert =9$ and exponent
$37/18$, another useful equality check.

Use the Borel, unit and different targets, R01.4, and the local reciprocity
equivariance theorem. Fesenko–Vostokov, Ch. IV, (3.4)(1) and (3.5), p. 135,
are the latter statements. Ghitza–Yamauchi, §2.3, Lemma 2.6, p. 5, gives
$5/2-2/\vert P\vert $ in this situation, sufficient when $\vert P\vert =3$ but weaker in
general. The two-sign argument supplies the stronger estimate required
here. Dieulefait–Pacetti, Theorem 1.1, §1.1, p. 3, states the application
to Serre's characteristic-three base case.

### Minkowski thresholds

`R25.1/minkowski-root-discriminant-thresholds` proves, for every number field,

$$
n\ge3\Rightarrow\operatorname{rd}>2,\qquad
n\ge6\Rightarrow\operatorname{rd}>3,\qquad
n\ge12\Rightarrow\operatorname{rd}>4.
$$

Start with `NumberField.abs_discr_ge'`:
$n^{2n}/((4/\pi)^{2r_2}(n!)^2)\le\vert d_K\vert $. Since $2r_2\le n$, it is
enough to use $B_n=(\pi/4)^n(n^n/n!)^2$. Certify the inequalities
$B_3>2^3$, $B_6>3^6$, and $B_{12}>4^{12}$ with rational bounds on
π. To propagate a threshold c, compare $B_{n+1}/B_n$ with c; the factor
$(1+1/n)^{2n}$ increases with n, and its value at the starting degree
already suffices. No transcendental numerical approximation is a proof.
The precise library inputs are `NumberField.rootDiscr_def`,
`NumberField.InfinitePlace.nrComplexPlaces`,
`NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, `Nat.factorial`,
`Real.pi_gt_d2` and `Real.pi_lt_d2`. See Odlyzko, §1, p. 119, and
Ghitza–Yamauchi, Proposition 3.2, §3, p. 7, for this use of Minkowski.

### The compactly supported kernel

`R25.1/odlyzko-kernel` defines the real even function

$$
g(x)=
\begin{cases}
(1-|x|)\cos(\pi x)+\sin(\pi|x|)/\pi,&|x|\le1,\\
0,&|x|>1.
\end{cases}
$$

For $h(x)=\cos(\pi x)$ on $[-1/2,1/2]$, zero elsewhere,
$g=2(h*h)$. This proves positive definiteness by a convolution square,
and nonnegativity follows because both factors are nonnegative on their
support. Direct differentiation on $[0,1]$ gives
$g'(x)=-\pi(1-x)\sin(\pi x)$; its endpoint values establish $C^1$
regularity. The integral on the positive half-line is $4/\pi^2$.
This classical kernel meets the requirements in Odlyzko, §2, (2.4)–(2.5),
p. 122; it is not the optimised kernel mentioned later in that source.

The API consists of `odlyzkoKernel`,
`odlyzkoKernel_eq_two_mul_convolution`, `odlyzkoKernel_nonneg`,
`odlyzkoKernel_zero`, `odlyzkoKernel_neg`,
`odlyzkoKernel_eq_zero_of_one_le_abs`,
`isPositiveDefiniteSub_odlyzkoKernel`, `contDiff_odlyzkoKernel` and
`integral_odlyzkoKernel_Ioi`. Together they provide a constructor,
the convolution characterisation, simplification at zero and under negation,
support and regularity lemmas, and the two positivity properties needed by
the explicit formula. They use `Real.cos`, `Real.sin`,
`MeasureTheory.convolution` and `TauCeti.IsPositiveDefiniteSub`.

Tests assert $g(0)=1$, $g(1/2)=1/\pi$, $g(-1/2)=1/\pi$,
$g(1)=g(2)=0$, $g(3/4)>0$, and the half-line integral $4/\pi^2$.
Their names are `odlyzkoKernel_zero`, `odlyzkoKernel_half`,
`odlyzkoKernel_neg_half`, `odlyzkoKernel_one`,
`odlyzkoKernel_three_quarters_pos` and `integral_odlyzkoKernel_Ioi`.
The negative half-point detects an incorrectly signed sine argument; the
three-quarter point detects omission of the sine term; the integral detects
omission of its $1/\pi$ factor. These tests are needed because the
explicit-formula constants depend on all three choices.

### Positivity throughout the critical strip

`R25.1/cosh-ratio-positive-definite` establishes that
$k_a(x)=\cosh(ax)/\cosh(x/2)$ is positive definite for $\vert a\vert \le1/2$.
Euler's sine product gives the hyperbolic-cosine product and expresses this
ratio as the pointwise limit of finite products of

$$
4a^2+(1-4a^2)\frac{c_j^2}{c_j^2+x^2},\qquad c_j=(2j-1)\pi.
$$

Each factor is a convex combination of the constant function and a
Lorentzian. The latter is the Fourier transform of the nonnegative measure
with density $(c_j/2)e^{-c_j\vert t\vert }$, so finite products and their limit are
positive definite. The endpoints $a=\pm1/2$ give the constant 1.
If $\vert a\vert >1/2$, the quotient is unbounded and cannot be positive definite
with value 1 at zero. This separate lemma supplies the nontrivial step
behind Odlyzko's positivity criterion, §2, after (2.3), p. 122.

Use `Complex.tendsto_euler_sin_prod`, `Real.cosh`,
`TauCeti.isPositiveDefiniteSub_const`,
`TauCeti.IsPositiveDefiniteSub.add`,
`TauCeti.IsPositiveDefiniteSub.real_smul`,
`TauCeti.IsPositiveDefiniteSub.prod` and `TauCeti.IsPositiveDefiniteSub.of_tendsto`,
and `TauCeti.integral_exp_mul_I_mul_exp_neg_mul_abs`.
`R25.1/poitou-kernel-positivity` then assumes an even, continuous,
compactly supported, nonnegative positive-definite function f and puts
$F(x)=f(x)/\cosh(x/2)$. Its transform

$$
\Phi(s)=\int_{\mathbb R}F(x)e^{(s-1/2)x}\,dx
$$

has nonnegative real part for $0\le\Re(s)\le1$. Evenness identifies
this real part with the Fourier transform of $f(x)k_a(x)$, where
$a=\Re(s)-1/2$, at frequency $\Im(s)/(2\pi)$. The preceding lemma
and `TauCeti.IsPositiveDefiniteSub.mul` make this product positive definite;
`TauCeti.isPositiveDefiniteSub_iff_posSemidef` and
`TauCeti.fourier_re_nonneg_of_posSemidef` prove the Fourier assertion.
See Odlyzko, §2, the text before (2.4), p. 122.

Positivity on the central line alone would not justify dropping zeros from
an unconditional explicit formula. Removing the cosh denominator is also
invalid: a sufficiently wide dilation of g has negative transform real part
at some points on the strip boundary. The full strip statement is the
interface used in the next theorem.

### Poitou's explicit lower bound

For $b>0$, set $F_b(x)=g(x/b)/\cosh(x/2)$ and define

$$
I_1(b)=\int_0^\infty\frac{1-F_b(x)}{2\sinh(x/2)}\,dx,\qquad
I_2(b)=\int_0^\infty\frac{1-F_b(x)}{2\cosh(x/2)}\,dx.
$$

`R25.1/poitou-lower-bound` defines

$$
P(n,r_1,b)=\frac{r_1\pi}{2}+n(\gamma+\log(8\pi))
-nI_1(b)-r_1I_2(b)-\frac{16b}{\pi^2}.
$$

At zero, $1-F_b(x)=O(x^2)$, so the apparent singularity in $I_1$
is integrable. Both tails decay exponentially. Since g has support in
$[-1,1]$, the tail of $I_1$ is $-\log\tanh(b/4)$, and that of
$I_2$ is $\pi-2\arctan(e^{b/2})$. The pole contribution is
$-4\int_0^\infty F_b(x)\cosh(x/2)\,dx=-16b/\pi^2$. In particular,
its sign is negative. This is the right side of Odlyzko, §2, (2.3), p. 122,
after removing the zero and prime contributions.

The API names `poitouLowerBound`, `integrableOn_poitouIntegrand_sinh`
(and its cosh counterpart), `poitouLowerBound_eq_explicit`,
`poitouIntegral_sinh_eq` and `poitouLowerBound_div_mono`. The last theorem
assumes $b>0$ and $0<n\le m$, and states
$P(n,0,b)/n\le P(m,0,b)/m$. Indeed only the negative pole term depends
on n after division. The explicit and tail equalities are what make the
definition usable by a rational certificate computation. Baseline inputs
include `Real.eulerMascheroniConstant`, `Real.cosh` and `Real.sinh`.

The tests `poitouLowerBound_rat_nonpos`,
`poitouLowerBound_sqrt_neg_three`, `poitouLowerBound_sqrt_five`,
`poitouLowerBound_div_mono` and `poitouLowerBound_one_one_one_bounds`
assert respectively: $P(1,1,b)\le0$ for $b=1/2,1,2$;
$P(2,0,1)\le\log3$; $P(2,2,3/2)\le\log5$; monotonicity and the
limit $\gamma+\log(8\pi)-I_1(b)$ as $n\to\infty$; and
$-0.09<P(1,1,1)<-0.08$. The last two-sided test detects an incorrect
$\log(4\pi)$ or a missing real-place contribution that one-sided
discriminant tests would miss. The quadratic tests also distinguish the
real and complex signature terms. At fixed b the limit lies below
$\log(4\pi e^\gamma)$, the unconditional asymptotic constant.

`R25.1/poitou-integral-upper-bounds` is a separate certificate lemma:

$$
I_1(13/2)<1.04,\qquad I_1(8)<0.94.
$$

Its proof uses a finite rational enclosure, not floating-point quadrature.
On the first small interval use
$(1-F_b(x))/(2\sinh(x/2))\le(\pi^2/(2b^2)+1/8)x$.
On each later cell, monotonicity of $F_b$ and of sinh bounds the numerator
from the right and the denominator from the left. With 2,000 equal cells,
Taylor bounds and argument reduction for sine, cosine and exponential,
the resulting sums plus the exact tail admit rational upper bounds
1.0037 and 0.9217. These are comfortably below the required values.
Use `Real.cos_bound`, `Real.sin_bound`, `Real.exp_bound`,
`Real.pi_gt_d2`, `Real.pi_lt_d2` and the integral API above. Source context
is Odlyzko, §2, p. 123; the certificate is an explicit calculation for the
chosen kernel. Decimal exploratory values alone are not theorem inputs.

`R25.1/poitou-odlyzko-inequality` states that, for every number field K and
every $b>0$, $P(n,r_1,b)\le\log\vert d_K\vert $, hence
$\exp(P(n,r_1,b)/n)\le\operatorname{rd}(K)$. Apply AN.4 to $F_b$.
The prime sum has nonnegative terms because $F_b\ge0$, and the zero sum
has nonnegative real terms by positivity on the full strip. Dropping them
gives precisely P. This uses `TauCeti.IsPositiveDefiniteSub.comp_smul`,
`NumberField.InfinitePlace.nrRealPlaces` and the preceding analytic targets.
The source is Odlyzko, §2, (2.3)–(2.5), p. 122; the attribution of the
unconditional improvement to Poitou is discussed in §1, p. 121.

`R25.1/totally-complex-root-discriminant-thresholds` specialises to $r_1=0$:
degree at least 24 implies root discriminant greater than 10, and degree at
least 36 implies root discriminant greater than 12. Use $b=13/2$ and 8,
the integral certificates, and a rational lower bound $\gamma>0.5722$
obtained from `Real.eulerMascheroniSeq` at 100 and
`Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`. The resulting lower
bounds for P/n exceed 2.3163 and 2.4952, respectively, with room above
$\log10$ and $\log12$. Monotonicity propagates them to larger degrees.
`NumberField.IsTotallyComplex`, `NumberField.nrRealPlaces_eq_zero_iff` and
`NumberField.rootDiscr` identify the signature and conclusion. See Odlyzko,
§2, (2.5), p. 122, and Ghitza–Yamauchi, §3, Proposition 3.3, p. 7.

### Fontaine's finite-flat different bound

`R25.1/fontaine-torsion-field-bound` is the global form of R07.6. Let G be
a finite commutative flat group scheme over $\mathbb Z[1/N]$, killed by p,
with $p\nmid N$. Its geometric-point field L is finite Galois, unramified
outside the primes dividing pN, and satisfies

$$
\delta(L_{\mathfrak p})<1+\frac1{p-1}.
$$

If its inertia at each prime dividing N is tame, globalisation gives

$$
\operatorname{rd}(L)<p^{1+1/(p-1)}
\prod_{\ell\mid N}\ell^{1-1/e_\ell}.
$$

The strict inequality, the condition that G is killed by p, and the
normalisation $v_p(p)=1$ are all part of the theorem. For N=1 it gives
$\operatorname{rd}(L)<4$ at p=2 and
$\operatorname{rd}(L)<3^{3/2}$ at p=3. A general group killed by
$p^n$ has the different estimate involving n instead; one may not apply
the killed-by-p bound to all higher torsion. Fontaine, introduction,
Corollary to Théorème A, p. 516, proves the local result with this
normalisation; Schoof, Proposition 5.1, pp. 853–854, uses its global form.
Brumer–Kramer, Proposition 3.2, pp. 7–8, provides a further account.
The prerequisites are R07.6, the finite-flat generic-fibre Galois action
from R07.1, local-to-global different compatibility and the earlier tame
formula. The field $\mathbb Q(\zeta_8)$, whose root discriminant is 4,
cannot be the point field of a group scheme killed by two over ℤ; it tests
the strictness of the conclusion.

### Degree certificates for Schoof's fields

`R25.1/totally-complex-degree-bounds-for-schoof` packages the additional
unconditional inequalities used in R25.4. For a totally complex number
field K, each line below gives an upper bound on its degree n. The parameter
b is used at the first excluded degree, and monotonicity handles all higher
degrees. The first five inequalities have strict hypotheses; the last five
allow equality.

| Label | Root-discriminant hypothesis | Degree conclusion | b | First excluded degree |
| --- | --- | --- | --- | --- |
| (a) | rd < 8.25 | n ≤ 14 | 41/8 | 15 |
| (b) | rd < 6.93 | n ≤ 10 | 17/4 | 11 |
| (c) | rd < 8.95 | n ≤ 19 | 6 | 20 |
| (d) | rd < 19.02 | n ≤ 287 | 145/8 | 288 |
| (e) | rd < 14.43 | n ≤ 59 | 79/8 | 60 |
| (f) | rd ≤ 5.72 | n ≤ 8 | 15/4 | 9 |
| (g) | rd ≤ 4.48 | n ≤ 5 | 23/8 | 6 |
| (h) | rd ≤ 13.19 | n ≤ 43 | 69/8 | 44 |
| (i) | rd ≤ 16.83 | n ≤ 119 | 13 | 120 |
| (j) | rd ≤ 10.199 | n ≤ 23 | 13/2 | 24 |

Use the same exact-tail and rational-enclosure method as above for each
parameter. Line (d) needs a finer certificate: a lower bound on γ from the
sequence at 200 and an integral error below $3\cdot10^{-4}$ leave a
sufficient positive margin. At its first excluded degree the bound on rd
is above 19.12. Line (j) is already supplied by the stronger certificate
at degree 24. The remaining first-degree estimates exceed 8.41, 7.00,
9.76, 14.60, 6.13, 4.54, 13.34 and 16.98 in the corresponding lines.
These numerical margins specify what the rational proofs must establish;
they do not introduce numerical axioms.

The sources are Odlyzko's unconditional 1976 Table 2, totally complex
column, and Schoof, §6, pp. 855–858. The degree bounds here are deliberately
only as strong as these certificates establish. For example, lines (c),
(d) and (j) state 19, 287 and 23, respectively. The field-degree
divisibilities in the later argument make these bounds sufficient.
This target uses the Poitou inequality and integral API, the Euler-constant
and π bounds, and `NumberField.IsTotallyComplex`; it does not take the
printed decimal table as an unproved oracle.

The layer's principal landmarks are the sharp two-adic and three-adic
different bounds and the Poitou–Odlyzko inequality. Its exit criterion is
the availability of exact local exponents and certified lower bounds with
the signature hypotheses stated above.

## R25.2 — The Tate–Serre base cases

The layer uses a kernel field to combine local discriminant bounds with the
possible orders of an irreducible finite image. It proves nonexistence over
every finite coefficient field, not only over the prime field.

### Level-one residual representations

`R25.2/level-one-residual-representation` defines `IsLevelOneResidual p ρ̄`
for a continuous homomorphism $\bar\rho:G_{\mathbb Q}\to\mathrm{GL}_2(F)$,
with F finite of characteristic p. Its three conditions are absolute
irreducibility, $\det\bar\rho(c)=-1$ for complex conjugation, and trivial
inertia at every finite prime other than p. The last condition is prime-to-p
conductor one. It imposes no bound on the Serre weight and no finite-flat
condition at p. Khare, §1, p. 2, and Dieulefait–Pacetti, Theorem 1.1,
§1.1, p. 3, use precisely this setting.

The representation object builds on `Field.absoluteGaloisGroup`,
`ContinuousMonoidHom`, `Matrix.GeneralLinearGroup`,
`Representation.IsIrreducible` and `DiscreteTopology`, together with R01.1,
R01.2 and R01.4. The API is:

| Proposed declaration | Mathematical specification |
| --- | --- |
| `IsLevelOneResidual` | The three-condition predicate above |
| `isLevelOneResidual_iff_kernelField` | Equivalent conditions on the finite Galois kernel field: unramified outside p, absolutely irreducible image, and the determinant condition at infinity |
| `IsLevelOneResidual.map` | Invariance under finite coefficient-field extension, with the target discrete |
| `IsLevelOneResidual.conj` | Invariance under a change of basis in GL₂(F) |
| `isOdd_of_ringChar_two` | Every characteristic-two representation is odd in the determinant sense |
| `IsLevelOneResidual.isTotallyComplex` | For odd p, the kernel field is totally complex |

For the last statement, complex conjugation has determinant −1 and therefore
nontrivial image. Since the kernel field is Galois, it has no real embedding.
In characteristic two, an order-two matrix has determinant one, equal to −1,
so oddness is automatic. This does not imply absolute irreducibility.

The tests make each distinction visible. At p=3, $1\oplus\bar\omega$
is odd and unramified outside three but reducible
(`not_isLevelOneResidual_one_add_omega`). The two-torsion representation of
$y^2+y=x^3-x^2-10x-20$, the curve $X_0(11)$, has image S₃ and is
absolutely irreducible in characteristic two, but is ramified at eleven
(`not_isLevelOneResidual_X0_eleven_two_torsion`). Extending coefficients
from $\mathbb F_2$ to $\mathbb F_4$ preserves the predicate, while
`isOdd_of_ringChar_two` checks the determinant condition separately.
Finally, the cyclic cubic field $\mathbb Q(\zeta_9)^+$ gives a
representation into GL₂(𝔽₂) with generator matrix having characteristic
polynomial $X^2+X+1$. It is irreducible over 𝔽₂ and reducible over 𝔽₄,
so `not_isAbsolutelyIrreducible_cyclic_cubic_mod_two` must reject it.
This prevents accidental replacement of absolute irreducibility by
irreducibility over the displayed coefficient field.

### Determinant and the tame case

`R25.2/determinant-level-one-mod-two` asserts that a characteristic-two
representation unramified outside two has determinant one. Its determinant
image has odd order. Locally at two the prime-to-p character result makes
it unramified, and at odd primes it is unramified by hypothesis. The
corresponding abelian extension of ℚ is unramified at every finite prime,
hence trivial by `NumberField.abs_discr_gt_two` and
`NumberField.not_dvd_discr_iff_isUnramifiedIn`. Thus the image lies in SL₂(F).
Use the kernel-field interface and the R25.1 character lemma; see
Moon–Taguchi, §3, pp. 5–6.

`R25.2/tame-level-one-excluded` requires p=2 or 3, continuity and
unramifiedness outside p, and trivial wild inertia at p. It concludes that
the representation is not absolutely irreducible. The kernel field has
root discriminant less than p by the tame formula. Minkowski therefore
bounds its degree by two when p=2, and by five when p=3. Every group of
these possible orders is abelian. After extending to an algebraic closure,
commuting matrices have a common eigenvector, contradicting absolute
irreducibility. Use `TauCeti.exists_unitHom_jointEigenvector_of_pairwise_commute_of_isAlgClosed`
for this last step. In particular, no oddness is needed for the tame
lemma itself. The source is Ghitza–Yamauchi, Proposition 3.2 and proof,
§3, p. 7; prerequisites are the globalisation and Minkowski targets and
R01.2.

### The possible irreducible images

`R25.2/irreducible-subgroups-characteristic-two` is a specialised consequence
of the Dickson theorem supplied by R01.4. A finite irreducible subgroup of
SL₂(𝔽̄₂) is either dihedral of order $2r$, where r is odd and at least
three, or conjugate to SL₂(𝔽_q) with $q=2^j\ge4$. In the first case an
order-two subgroup is its own normalizer; in the second case the group has
order $q(q^2-1)\ge60$. Upper-triangular cases have a stable line and are
excluded. The dihedral normalizer statement follows by conjugating a
reflection by powers of a rotation of odd order. `Matrix.SpecialLinearGroup`
and `Subgroup.normalizer` supply the ambient definitions. See
Moon–Taguchi, §3, p. 5, Jones, §2.3, pp. 8–9, and
Dieulefait–Pacetti, §3, p. 15.

`R25.2/irreducible-subgroups-characteristic-three` assumes a finite
irreducible subgroup of GL₂(𝔽̄₃) whose order is divisible by three. It
proves that −1 belongs to the group, that 24 divides its order, and that
either its 3-part is three or its order is at least 720. Dickson's
projective cases containing an element of order three are the exceptional
tetrahedral, octahedral and icosahedral cases and the relevant PSL₂/PGL₂
groups. A projective Klein four lifts to anticommuting matrices, whose
commutator is −1; this supplies the central factor two needed for the
order divisibility. The small cases have 3-part three. The next field-size
cases have order at least 720. Scalar extensions of prime-to-three order
do not change the 3-part. The p-subgroup, matrix-group and projective-image
interfaces belong to R01.4. Ghitza–Yamauchi, Proposition 3.3, §3, p. 7,
uses the corresponding order restriction; Dieulefait–Pacetti, the proof
of Theorem 1.3, §1.1, p. 3, describes the projective classification in
the solvable branch. The precise lift to GL₂ is the additional arithmetic
statement needed here.

### Nonexistence in characteristic two

`R25.2/tate-theorem` states that no continuous absolutely irreducible
$G_{\mathbb Q}\to\mathrm{GL}_2(F)$, for any finite field F of
characteristic two, is unramified outside two. Its proposed declaration
is `tate_no_levelOne_char_two`.

The determinant lemma puts the image G in SL₂. The tame case is already
excluded. In the dihedral case, wild inertia P has order two. Its
decomposition group normalizes P, hence equals P by the normalizer
calculation. The local different bound gives
$\operatorname{rd}(K)\le2^{3/2}<3$, whereas $\vert G\vert \ge6$ and Minkowski
give root discriminant greater than three. In the SL₂(𝔽_q) case,
$\vert G\vert \ge60$ and the sharp two-adic bound gives root discriminant at most
four, whereas Minkowski gives greater than four from degree twelve onward.
Both are contradictions. This proof uses only the algebraic discriminant
thresholds: the analytic lower bound is not required here.

The dependencies are the determinant, tame, subgroup and two-adic targets
and kernel-field globalisation. Dieulefait–Pacetti, Theorem 1.1 and proof,
§1.1, p. 3, attributes the theorem to Tate; Khare, §1.1, p. 2, states its
role in level one. Moon–Taguchi, §3, pp. 5–7, gives the related
local-to-global discriminant method. The theorem has no separate oddness
hypothesis and no restriction to F=𝔽₂.

### Nonexistence in characteristic three

`R25.2/serre-mod-three-theorem` states that no continuous odd absolutely
irreducible characteristic-three representation with finite coefficients
is unramified outside three. Its declaration is
`serre_no_levelOne_char_three`. Oddness makes the kernel field K totally
complex. The tame case is excluded first. Otherwise three divides the
image order, and the subgroup theorem gives $24\mid[K:\mathbb Q]$.

If the 3-part is three, wild inertia has order three and
$\operatorname{rd}(K)\le3^{11/6}<7.5$. The totally complex lower bound
at degree 24 is greater than ten. If the 3-part is larger, the degree is
at least 720 and $\operatorname{rd}(K)<3^{13/6}<10.81$, whereas the
lower bound from degree 36 onward exceeds twelve. Both cases contradict
the certified analytic thresholds. The prerequisites are the oddness
and kernel-field API, the tame and subgroup targets, the three-adic bound
and the totally complex thresholds. See Dieulefait–Pacetti, Theorem 1.1,
§1.1, p. 3, and Khare, §1.1, p. 2.

`R25.2/tate-serre-base-case` combines these as
`not_isLevelOneResidual_of_le_three`: for p in $\{2,3\}$, `IsLevelOneResidual p ρ̄`
is impossible. The algebraic-closure version follows by finite coefficient
descent, with discrete target topology. This is the form consumed by
R26.1 and by the 3-adic terminal step of R33.4. Khare, §8, pp. 29–30,
also explains why the discriminant strategy does not simply extend to all
characteristics. The Ramanujan representation in characteristic eleven
is a concrete reminder that a level-one nonexistence theorem cannot be
asserted for every p.

## R25.3 — Fontaine's theorem

The essential distinction from R25.2 is that the representation on torsion
need not be irreducible. A discriminant bound first constrains its field;
finite-flat structure then constrains all its composition factors and
extensions. The resulting filtration is applied to every level of torsion.

### Étale schemes and small two-ramified fields

`R25.3/etale-group-schemes-over-integers-are-constant` proves that every
finite étale commutative group scheme over ℤ is constant. Its geometric
points form a finite Galois module unramified at every finite prime. Each
connected number-field component of its finite étale algebra has
discriminant of absolute value one. `NumberField.abs_discr_gt_two`
forces its degree to be one. The generic Galois action is trivial, and
the étale Galois-module equivalence identifies the integral model with
the constant scheme. The declaration is `isConstant_of_etale_over_int`.
Use R07.1 for that equivalence and the discriminant-unramifiedness theorem
for the arithmetic step. See Schoof, the proof of Proposition 3.1, §3,
p. 850, and Odlyzko, §1, p. 119.

`R25.3/division-fields-of-two-group-schemes-over-integers` proves a field
statement: if a finite Galois extension $L/\mathbb Q$ is unramified at
every odd prime and has root discriminant less than four, its degree is
a power of two. Minkowski gives degree at most eleven. Every odd-order
abelian quotient is unramified at two by the character-inertia lemma,
hence trivial globally. Among groups of order at most eleven, the only
remaining groups whose order is not a power of two are S₃ and D₁₀;
the elementary small-order group classification is sufficient here.
They have quadratic fixed fields $k=\mathbb Q(i)$ or
$\mathbb Q(\sqrt{\pm2})$, since k is unramified outside two.
The cyclic odd extension L/k is unramified above two: the residue field
of k there is 𝔽₂ and a prime-to-two abelian inertia quotient has order
dividing one. It is unramified elsewhere as well. Thus
$\operatorname{rd}(L)=\operatorname{rd}(k)\le\sqrt8<3$, contradicting
Minkowski since its degree is six or ten. `isPGroup_two_of_rootDiscr_lt_four`
records the conclusion. Inputs are R25.1, quadratic discriminants and
the local/global Galois interface. Source context is Schoof,
Proposition 5.1, §5, pp. 853–854, and Moon–Taguchi, §3, pp. 5–6.

### Simple finite flat two-group schemes

`R25.3/simple-two-group-schemes-over-integers` classifies a nonzero simple
finite flat commutative group scheme G of 2-power order over ℤ as
$\mathbb Z/2\mathbb Z$ or $\mu_2$. First, flat closure of the
generic subgroup killed by two shows that a simple object is itself
killed by two. Fontaine's bound then gives a point field of root
discriminant less than four, and the preceding theorem makes its Galois
group a 2-group. A simple 𝔽₂-module for a 2-group has a nonzero invariant
vector, hence is the trivial one-dimensional module. Its order is two,
and the order-two Oort–Tate classification over ℤ leaves exactly the
constant and multiplicative models.

The nonzero hypothesis must appear in `simple_two_groupScheme_over_int`; without
it the trivial scheme satisfies the no-proper-subgroup condition and is
neither listed model. The proof uses R07.1 for flat closure and order-p
classification, R01.4 for fixed vectors, and the Fontaine and field
targets. `TauCeti.ConstantGroup.groupScheme` provides the constant model,
while multiplicative models and Cartier duality use
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`. See Schoof,
Proposition 5.1 and proof, §5, p. 854.

### The Ext group and reordering a filtration

`R25.3/extensions-of-mu-two-by-z-mod-two-over-integers` proves
$\operatorname{Ext}^1_{\mathbb Z}(\mu_2,\mathbb Z/2\mathbb Z)=0$, or
equivalently that every exact sequence with these quotient and subobject
splits. The finite-flat gluing theorem identifies global extension data
through the models over ℤ₂, over ℤ[1/2], and their generic fibres over
ℚ₂. The required sequence is exact: it identifies the remaining global
Ext group with the kernel of the relevant restriction map, after the
local finite-flat Ext calculation. An injection into a Kummer group is
not enough to prove the vanishing.

On the étale generic side Kummer theory identifies the possible
quadratic classes unramified away from two with the classes of −1, 2
and −2 in $\mathbb Q^\times/(\mathbb Q^\times)^2$. All three remain
nontrivial in $\mathbb Q_2^\times/(\mathbb Q_2^\times)^2$, so the
restriction kernel is zero. Use the exact gluing and local calculation
from R07.1 and Kummer cohomology from profinite-cohomology upstream L9;
the declaration is `ext_muTwo_zModTwo_eq_zero`. See Schoof,
Proposition 4.1, §4, p. 851, and the proof of Corollary 4.2, p. 853.
The opposite group, with constant quotient and multiplicative subobject,
need not vanish: the nonsplit order-four Mazur example tests the direction.

`R25.3/multiplicative-constant-filtration` uses the simple classification
and this vanishing to prove that every finite flat two-group scheme G
over ℤ fits into $0\to M\to G\to C\to0$, with M diagonalizable and C
constant. Choose a composition series. Whenever a constant simple factor
lies immediately below a multiplicative factor, the intervening
two-factor extension splits, so the factors can be interchanged.
Induction on the number of inverted pairs moves all multiplicative
factors below the constant factors. Their extension M has étale Cartier
dual, and C is étale. The preceding étale theorem makes C and the dual
of M constant. Rank multiplicativity gives $\#M\#C=\#G$.

The API theorem `exists_diagonalizable_constant_filtration` returns the
closed flat subgroup, its constant quotient, the Cartier-dual
characterisation of M and the rank equality. No splitting of the final
sequence is asserted. Use R07.1 for flat exact sequences, étale extension
closure and duality. The baseline categorical tools include
`FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, its
duality equivalence, with R07.1 providing the exact-sequence interface. Fontaine, Théorème B(ii), p. 516, and §3.4.5,
Remark b, p. 536, give this finite-flat structure theorem; Schoof,
Proposition 3.1 and proof, §3, p. 850, explains its use in torsion.

### Isogenies and finite-field point counts

`R25.3/point-count-isogeny-invariance` proves
$\#A(k)=\#B(k)$ for an isogeny $A\to B$ defined over a finite field k.
Let F be its Frobenius endomorphism. The isogeny commutes with F and hence
with $1-F$. The latter map is separable because its differential is the
identity, and its degree equals the size of its kernel A(k). Comparing
degrees in the commuting square and cancelling the positive degree of
the isogeny yields equality of point counts. This handles inseparable
isogenies as well: it is $1-F$, rather than the given isogeny, whose
separability matters. Geometric isomorphism over an algebraic closure
would not suffice, as quadratic twists can have different point counts.
The declaration `card_points_eq_of_isogeny` builds on A6, with Frobenius,
degree multiplicativity and finite-field rational points. See Schoof,
Proposition 3.1 and proof, §3, p. 850.

### The good-reduction contradiction

`R25.3/fontaine-theorem` states that an abelian variety A over ℚ with good
reduction at every finite prime has dimension zero. By R11.1 it extends
to an abelian scheme over ℤ. If $g=\dim A$, the group scheme
$A[2^n]$ has rank $2^{2gn}$, by A3. Apply the filtration theorem to
obtain $M_n$ and $C_n$. Fix one finite residue field k of odd
characteristic. The quotient $A/M_n$ is isogenous to A and contains
the constant group $C_n$; hence $\#C_n\le\#A(k)$.

Cartier duality gives the corresponding constant group $M_n^D$ in
a quotient isogenous to the dual of A. A polarization, supplied by A2,
identifies the point count of that dual with the point count of A.
Thus $\#M_n\le\#A(k)$ as well. Consequently

$$
2^{2gn}=\#M_n\#C_n\le\#A(k)^2
$$

for every n, with the right side independent of n. This forces g=0.
The proposed declaration is `dim_eq_zero_of_goodReduction_everywhere`.
Its dependencies are the filtration, point-count theorem, finite flat
torsion and quotients, polarizations, and good-reduction extension to
an abelian scheme. The proof uses the killed-by-two Fontaine bound
only in the simple-factor classification; it does not apply that bound
directly to the field of $A[2^n]$.

Fontaine, §3.4.6, Corollary 2 and proof, pp. 536–537, states a result
also covering three particular quadratic fields. The target here is its
rational-field case, not a claim that the source's theorem is confined
to ℚ. Schoof, Proposition 3.1 and proof, §3, pp. 850–851, gives the
constant-by-diagonalizable point-count argument. Brumer–Kramer, §1,
p. 1, records Fontaine's theorem as the starting case of the
one-bad-prime problem.

The landmark of this layer is Fontaine's nonexistence theorem. Its exit
criterion includes the finite-flat classification and the filtration,
not just the final dimension-zero statement, because R25.4 reuses the
same mechanism over a cyclotomic base.

## R25.4 — Schoof's five-prime theorem

The layer proves the exact set of semistable one-bad-prime exclusions
$\ell\in\{2,3,5,7,13\}$. It combines a categorical criterion with a
small Ext calculation and five field calculations. The pair $(\ell,p)$
always lists the possible bad prime first and the torsion prime second.

### The semistable category

`R25.4/semistable-category-d` defines `SemistableCategory p l G`, the
predicate cutting out the full subcategory D(p,ℓ) of finite flat
commutative p-group schemes over ℤ[1/ℓ] such that
$(\sigma-1)^2=0$ on geometric points for every inertia element above ℓ.
Here p and ℓ are distinct primes. This is a condition on the generic
Galois module; it must coexist with the integral finite-flat model.
The construction builds on `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`
and its base-change functor, with R07.1 supplying generic points, exactness
and duality. Schoof, Definition 2.1(ii), §2, p. 848, defines this category.

The API names `SemistableCategory`, `SemistableCategory.subobject` (including the quotient
statement), `SemistableCategory.prod`, `SemistableCategory.cartierDual`,
`SemistableCategory.inertia_pow` and `SemistableCategory.of_extension`.
Closed flat subobjects and quotients inherit the square-zero condition;
finite products satisfy it componentwise. Cartier duality preserves it
because the cyclotomic character is unramified at ℓ and the inverse
transpose of $1+N$, with $N^2=0$, is $1-N^{\mathrm t}$.
If $p^k$ kills G, then $(1+N)^{p^k}=1$; thus inertia acts through
a finite p-group and, since $p\ne\ell$, acts tamely.

An arbitrary extension of objects of D need not lie in D: combining
square-zero blocks can produce a longer unipotent block. The extension
lemma has the stronger hypothesis that inertia acts trivially on both
end objects. Then $\sigma-1$ maps into the subobject and kills it,
so its square is zero. In particular, every extension with end objects
$\mu_p$ and $\mathbb Z/p\mathbb Z$ belongs to D, and its Ext group
inside D is the same as the ambient finite-flat Ext group. This precise
statement is what makes the criterion below applicable.

Tests assert that $\mathbb Z/p\mathbb Z$ and $\mu_p$ lie in D
(`zModP_mem_semistableCategory`), and that the Katz–Mazur group
$G_\varepsilon$, for an invertible $\varepsilon$, lies in D because
inertia acts by upper-unitriangular matrices
(`katzMazur_mem_semistableCategory`). The étale order-three twist by
$\mathbb Q(\sqrt{-7})$ is excluded from D(3,7): inertia acts as −1,
and $(-1-1)^2\ne0$ in 𝔽₃
(`not_mem_semistableCategory_quadratic_twist`). It belongs to the larger
tame category, so this test separates the two notions. Finally,
$J_0(11)[2]$ is a simple order-four object of D(2,11)
(`X0_eleven_two_torsion_mem`), showing why the eventual theorem must not
include eleven. See Schoof, §2.1–2.3, p. 849, and the introduction,
p. 848, for these examples.

`R25.4/torsion-of-semistable-abelian-varieties-in-d` proves that if
A/ℚ has good reduction away from ℓ and semistable reduction at ℓ, its
abelian-scheme model over ℤ[1/ℓ] has $A[p^n]\in D(p,\ell)$ of rank
$p^{2gn}$, for every $n\ge1$. R11.1 supplies the model, A3 supplies
the finite flat kernel and rank, and R11.3 supplies Grothendieck's
$(\sigma-1)^2=0$ monodromy criterion. See Schoof, §2.1, p. 849.
The theorem applies to the whole torsion group scheme, not just its
semisimplified generic representation.

### Splitting over a fixed cyclotomic base

`R25.4/constant-over-cyclotomic` considers a finite étale p-group scheme C
over ℤ[1/ℓ] with a filtration by constant order-p quotients. Its point
representation has unipotent image, a finite p-group P, and is unramified
outside ℓ. Its maximal abelian quotient cuts out a p-power subfield of
$\mathbb Q(\zeta_\ell)$, by Kronecker–Weber and tameness at ℓ.
Consequently $P^{\mathrm{ab}}$ is cyclic. The p-group Frattini theorem
implies P is cyclic as well, and the entire representation therefore
factors through $\operatorname{Gal}(\mathbb Q(\zeta_\ell)/\mathbb Q)$.
C becomes constant over ℤ[1/ℓ,ζℓ]. Cartier duality makes an iterated
extension of μp diagonalizable over that same ring.

The declarations `isConstant_baseChange_cyclotomic` and
`isDiagonalizable_baseChange_cyclotomic` expose both conclusions and the
generic action factorisation. Their inputs are R07.1, global class-field
theory upstream L13, `TauCeti.IsProP.eq_top_of_sup_proPFrattini_eq_top`
and `TauCeti.commutator_le_proPFrattini`, with finite p-groups viewed as
pro-p groups. The base extension is independent of n and of the length
of the filtration; this uniformity is needed for a fixed point count.
See Schoof, Proposition 3.1 and proof, §3, p. 850.

`R25.4/schoof-criterion` assumes that the only nonzero simple objects of
D(p,ℓ) are the constant and multiplicative order-p schemes and that
$\operatorname{Ext}^1_{\mathbb Z[1/\ell]}(\mu_p,\mathbb Z/p\mathbb Z)=0$.
It concludes that an abelian variety over ℚ with good reduction away
from ℓ and semistable reduction at ℓ has dimension zero.
Composition factors of its torsion can be reordered exactly as in
R25.3, because the Ext group in D agrees with the ambient group for
these endpoints. Over the fixed cyclotomic base, the lower part becomes
diagonalizable and the upper quotient constant. Choose a finite residue
field of that base away from pℓ. The same isogeny and duality argument
gives $p^{2gn}\le\#A(k)^2$ for every n. This forces g=0.
The declaration `no_semistable_of_simple_and_ext` depends on torsion
membership, cyclotomic splitting, the R25.3 point-count theorem and A2–A3.
See Schoof, Proposition 3.1, §3, pp. 850–851.

### Computing the Ext obstruction

`R25.4/ext-mu-p-by-z-mod-p-over-z-one-over-l` computes, for p=2 or 3,
the 𝔽p-dimension of the Ext group in the criterion. It is one precisely
when $\ell\equiv\pm1\pmod8$ for p=2, or
$\ell\equiv\pm1\pmod9$ for p=3; otherwise it is zero. In particular
it vanishes for all five chosen pairs
$(2,3),(3,2),(5,2),(7,3),(13,2)$.

Use the exact gluing sequence of R07.1 and Kummer theory of profinite
cohomology upstream L9. After adjoining ζp, the generic extension
classes are identified with the cyclotomic-character-square eigenspace
of S-units modulo p-th powers, subject to triviality in the relevant
local quotient at p. Both the global and local terms and the equality
with the kernel have to be computed. For p=2, the surviving unit
direction is represented by ℓ and the local square condition gives
the mod-eight criterion. For p=3, units in ℚ(ζ₃) and the cube condition
give the mod-nine criterion. The rings of integers needed in these
two cases are principal; `IsCyclotomicExtension.Rat.three_pid` supplies
the nontrivial one. Thus no general Herbrand theorem for arbitrary p
is hidden in this calculation. The vanishing part is exposed as
`ext_muP_zModP_eq_zero`; the full dimension statement remains part of
the mathematical target. See Schoof, Corollary 4.2, §4, p. 852, and its
proof, p. 853.

### A field criterion for simple objects

`R25.4/simple-objects-criterion` sets F equal to the degree-p subfield
of ℚ(ζℓ) if $p\mid\ell-1$, and to ℚ otherwise, and puts
$M=F(\zeta_{2p},\ell^{1/p})$. Assume that *every* finite Galois
extension L/ℚ containing M, unramified over M away from p, with
$\delta(L_{\mathfrak p})<1+1/(p-1)$, has
$[L:\mathbb Q(\zeta_p)]$ a power of p. Then every nonzero simple
object of D(p,ℓ) is $\mathbb Z/p\mathbb Z$ or μp.

To prove it, a simple object is first shown to be killed by p. Enlarge
its point field by adjoining the standard auxiliary group schemes used
by Schoof: the Katz–Mazur extension for ℓ, and the appropriate constant
Galois module (or the order-two auxiliary model). Their combined field
contains M. Membership in D makes inertia at ℓ have order at most p;
Fontaine's strict bound applies at p. This enlarged field satisfies the
field criterion. Over ℚ(ζp) the point action is therefore a p-group
action, whose invariants are nonzero. Simplicity forces the generic
module to be one-dimensional. The remaining order-p Oort–Tate models
are possible twists of the constant or multiplicative model. Their
twisting character has prime-to-p order and is unramified at ℓ and at
p in the relevant quotient; it is unramified everywhere and hence
trivial. This yields precisely the two stated schemes.

`FieldCriterion l p` records the universally quantified field condition;
`simple_eq_of_fieldCriterion` applies it to a simple G with order
different from one. The arithmetic interpretation of “unramified over
M” is relative inertia, not unramifiedness of L/ℚ at the primes already
ramified in M. The prerequisites are R07.1, the D API, the Fontaine
bound, R01.4 and global class-field theory. See Schoof, Proposition 5.1
and proof, §5, pp. 853–854.

### Class-number certificates used in the five cases

`R25.4/class-number-one-certificates` establishes class number one for
four specific fields, with the conclusion that each has no nontrivial
unramified abelian extension. These are arithmetic certificates, not
calls to a numerical class-number oracle.

For $M=\mathbb Q(\zeta_3,\sqrt[3]2)$, the degree is six and the
discriminant is $2^4 3^7$, giving root discriminant below 5.72. Its
Hilbert class field has the same root discriminant and degree $6h_M$.
Line (f) of the degree table gives $6h_M\le8$, so $h_M=1$.
For $M=\mathbb Q(i,\sqrt5)$, the degree is four and the discriminant
is 400; root discriminant is below 4.48, and line (g) gives
$4h_M\le5$, again forcing one.

For $\mathbb Q(\zeta_{12})$, the discriminant is 144. The direct
small-discriminant PID criterion proves class number one:
`RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt`, with degree four
and two complex places, requires $\vert d_M\vert <(4\pi^2/3)^2$, whose
right side is about 173.2.
The inequality 144 below this threshold is sufficient. A root-discriminant
degree bound alone would permit class number two and is insufficient.
`NumberField.classNumber_eq_one_iff` translates principality to class
number one.

For $\mathbb Q(i,\sqrt{13})$, the discriminant is 2704 and the
Minkowski ideal-class bound is less than eight. The prime above two
has norm four and is generated by $1+i$. At rational primes three,
five and seven, the residue degrees are two, so the prime norms exceed
the bound. Every class therefore has a principal representative.
Use CA.5 or
`RingOfIntegers.isPrincipalIdealRing_of_isPrincipal_of_lt_or_isPrincipal_of_mem_primesOver_of_mem_Icc`
for the small-prime generation argument, and
`TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant` together with
the discriminant tower theorem for the values. Global class-field
theory upstream L13 turns these calculations into the asserted
unramified-extension exclusions. The proposed combined declaration is
`classNumber_eq_one_small_fields`. Sources are Schoof, §6, pp. 855–858,
and Odlyzko, 1976 Table 2 at degrees six and nine for the analytic
comparisons.

### The pairs (2,3), (3,2) and (5,2)

`R25.4/simple-objects-l2-p3` proves `FieldCriterion 2 3` and the stronger
assertion that an admissible L equals $M=\mathbb Q(\zeta_3,\sqrt[3]2)$.
Tame inertia at two has order three, while the Fontaine bound at three
gives
$\operatorname{rd}(L)<2^{2/3}3^{3/2}<8.25$. Line (a) restricts the
degree to at most fourteen. Since six divides the degree, L is M or
a quadratic extension of M. The class-number certificate excludes
an unramified quadratic extension. There is a unique prime above three,
with residue field 𝔽₃, and the unit −1 maps to its nontrivial residue
unit. Thus the prime-to-three ray class quotient there is trivial,
excluding a ramified quadratic extension as well. The result is
`fieldCriterion_two_three`. Its inputs are the field criterion,
class-number theorem, local/global different formulas, ray class theory
and degree line (a). See Schoof, §6, the case ℓ=2, p=3, p. 855.

`R25.4/simple-objects-l3-p2` proves `FieldCriterion 3 2`. Here
$M=\mathbb Q(\zeta_{12})$ has degree four. Inertia at three has order
two and the strict two-adic bound gives
$\operatorname{rd}(L)<\sqrt3\cdot4<6.93$. Line (b) gives degree at
most ten; divisibility by four leaves only four or eight. Both are
powers of two, so no class-field calculation is needed for this
criterion. The declaration is `fieldCriterion_three_two`, using the
same different and field interfaces with degree line (b). See Schoof,
§6, ℓ=3, p=2, pp. 855–856.

`R25.4/simple-objects-l5-p2` proves `FieldCriterion 5 2` for
$M=\mathbb Q(i,\sqrt5)$. Now
$\operatorname{rd}(L)<\sqrt5\cdot4<8.95$, so line (c) gives degree
at most nineteen. The possible multiples of four are four, eight,
twelve and sixteen. Degree twelve would be a cyclic cubic extension
of M unramified away from two. Class number one excludes its
unramified part. At the unique prime above two, the residue field is
𝔽₄ and $\eta=(1+\sqrt5)/2$ reduces to an element satisfying
$\eta^2=\eta+1$, generating 𝔽₄×. Units therefore kill the possible
tame cubic ray-class quotient, excluding degree twelve. The remaining
degrees are four, eight and sixteen. The declaration is
`fieldCriterion_five_two`; use line (c), the class-number certificate,
reciprocity and the different formulas. See Schoof, §6, ℓ=5, p=2,
pp. 856–857. The degree conclusion does not require a stronger bound
than nineteen.

### The pair (7,3)

`R25.4/simple-objects-l7-p3` proves `FieldCriterion 7 3` with
$K=M=\mathbb Q(\zeta_3,\zeta_7+\zeta_7^{-1},\sqrt[3]7)$, of degree
eighteen. The root-discriminant upper bound is
$3^{3/2}7^{2/3}<19.02$. Line (d) implies
$[L:\mathbb Q]\le287$, so $\pi=\operatorname{Gal}(L/K)$ has order
at most fifteen. Such groups are solvable.

First, K has class number one. Its root discriminant is
$3^{7/6}7^{2/3}<13.19$, and line (h) restricts the degree of its
Hilbert class field to at most forty-three, so the class number is at
most two. A quadratic Hilbert class field would be Galois over
ℚ(ζ₃), with central kernel of order two over the odd-order 3-group
$\operatorname{Gal}(K/\mathbb Q(\zeta_3))$. The unique Sylow-3
complement descends an unramified quadratic extension to ℚ(ζ₃).
Its degree over ℚ would be four and its root discriminant $\sqrt3$,
contradicting Minkowski. Therefore the class number is one. The
different calculation uses
`NumberField.natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow`.

At the unique prime of K over three the residue field is 𝔽₂₇. The
units −1 and $c=\zeta_7+\zeta_7^{-1}$ generate its multiplicative
group: the image of c has order thirteen or twenty-six. Together
with class number one, this eliminates every prime-to-three abelian
extension of K unramified outside three. Thus $\pi^{\mathrm{ab}}$
is a 3-group. Its possible orders are one, three or nine. If it has
order one, solvability forces π trivial; if nine, the order bound
forces π itself to have order nine.

Suppose its order is three, and let K′ be the corresponding cyclic
cubic extension. Its conductor is $\mathfrak p^a$. The
conductor–discriminant formula gives

$$
\operatorname{rd}(K')=3^{7/6+a/9}7^{2/3}.
$$

The strict upper bound on L forces $a\le2$, while wild ramification
forces $a\ge2$. Hence a=2 and
$\operatorname{rd}(K')<16.83$. The degree of K′ is fifty-four, and
line (i) restricts its Hilbert class field to degree at most 119;
its class number is at most two. A quadratic unramified extension is
again ruled out by the central extension argument over ℚ(ζ₃), now
with a Galois 3-group of order twenty-seven. Thus K′ also has class
number one.

Let $\pi'=\operatorname{Gal}(L/K')$; its order is at most five and
it is abelian. The extension K′/K is totally ramified at three and
has the same residue field 𝔽₂₇. The same two units from K therefore
still generate the residue units in K′. Class number one of K′ and
this new local unit calculation exclude every prime-to-three part
of π′. If π′ had order three, π would have order nine and hence be
abelian, contradicting the assumption that its abelianisation has
order three. Thus π′ is trivial. In every case L/ℚ(ζ₃) has 3-power
degree, as required by `fieldCriterion_seven_three`.

It is not valid to descend an arbitrary abelian extension of K′ merely
by taking a compositum with K: an abelian quotient of a subgroup
need not be an abelian quotient of the whole group. The argument
above proves the needed exclusion directly over K′. Its ingredients
are the field criterion, degree lines (d), (h), (i), Minkowski,
unit reciprocity and conductor–discriminant theory. Schoof, §6,
ℓ=7, p=3, pp. 857–858, supplies the field and unit calculations.

### The pair (13,2)

`R25.4/simple-objects-l13-p2` proves `FieldCriterion 13 2` for
$M=\mathbb Q(i,\sqrt{13})$. The root-discriminant upper bound is
$4\sqrt{13}<14.43$. Line (e) gives degree at most fifty-nine,
so $[L:M]\le14$. Kronecker–Weber and the local strict bound identify
M as the maximal abelian subfield of L over ℚ: additional 2-power
cyclotomic ramification would introduce the forbidden two-adic
exponent two, while inertia at thirteen has order at most two.

Put $\pi'=\operatorname{Gal}(L/M)$, the commutator subgroup of the
global Galois group. M has class number one. Its unique prime above
two has residue field 𝔽₄, and
$\eta=(3+\sqrt{13})/2$ generates the residue-unit group. Thus
$(\pi')^{\mathrm{ab}}$ is a 2-group. For a quadratic extension of
conductor $\mathfrak p^a$, the normalised two-adic exponent is
$1+a/4<2$, so $a\le3$. The possible quadratic conductor
exponents are 0, 2, 4 and 5, leaving only two. The corresponding
ray class field has degree two and is $K=M(\sqrt\eta)$. The image
of i in the units modulo $\mathfrak p^2$ supplies the remaining
unit calculation. An abelian extension of larger degree would
already violate the strict local bound; hence
$\vert (\pi')^{\mathrm{ab}}\vert \le2$.

If this abelianisation is trivial, solvability of the group of order
at most fourteen forces π′ trivial. Otherwise it has order two and
K is the associated quadratic subfield. Its degree is eight and
root discriminant $2^{3/2}\sqrt{13}<10.199$. Line (j) gives degree
at most twenty-three for the Hilbert class field, so its class
number is at most two. This excludes the odd part of any unramified
abelian extension. The prime above two remains unique with residue
field 𝔽₄, and the inherited units still generate 𝔽₄×; thus it also
has no odd-degree tame abelian extension ramified only there.

Let $\pi''=\operatorname{Gal}(L/K)$, of order at most seven.
The Frattini argument implies its abelianisation has odd order:
a nontrivial 2-quotient would give a larger 2-part in the
abelianisation of π′. The preceding class-field and unit calculations
make that odd abelianisation trivial. A solvable perfect group is
trivial, so π″ is trivial. L therefore has degree four or eight,
in either case a power of two. The declaration is
`fieldCriterion_thirteen_two`.

The argument uses lines (e) and (j), the class-number certificate,
ray class theory, the different tower formula and
`TauCeti.IsProP.eq_top_of_sup_proPFrattini_eq_top`. It does not assert
that the class number of K has already been proved to be one:
the bound by two is sufficient because only an odd abelian quotient
must be excluded. See Schoof, §6, ℓ=13, p=2, p. 858.

### The theorem and its boundary

`R25.4/schoof-theorem` now applies the criterion in each of the five
pairs. The Ext calculation vanishes, and the field criterion gives
the required simple objects. Thus every A/ℚ with good reduction
away from $\ell\in\{2,3,5,7,13\}$ and semistable reduction at
ℓ has dimension zero. The declaration is
`no_semistable_abelianVariety_one_prime`. This is Schoof, Theorem 1.1,
§1, p. 847, and Dieulefait–Pacetti, Theorem 1.2, §1.1, p. 3.

The statement excludes neither arbitrary additive reduction nor
the prime eleven. For example $y^2=x^3-x$ has additive reduction
at two, so “good away from two” alone is insufficient. The nonzero
Jacobian $J_0(11)$ is semistable and good away from eleven. More
generally, $J_0(\ell)$ explains the sharp prime set. The geometric
statement concerns every dimension; GL₂-type is not a hypothesis
here. The Schoof theorem and the semistable category are the layer's
landmarks, with five independently justified field criteria as its
arithmetic exit requirements.

## R25.5 — Realisation and terminal weights

This layer connects two-dimensional p-adic representations to abelian
varieties, verifies the hypotheses needed to use that connection, and
then excludes a short list of residual weights. The sequence of the
proofs matters: characteristic two and three are settled first; weight
two is settled using Fontaine; the selected weights p+1 are settled
using Schoof; the remaining small weights use these results at an
auxiliary prime. None of those steps imports the completed Serre
modularity theorem.

### Abelian varieties of GL₂-type

`R25.5/gl2-type-abelian-variety` defines `IsGL2Type A K` for an abelian
variety A over a number field F and a number field K acting by
F-rational endomorphisms up to isogeny. Explicitly,

$$
K\longrightarrow\operatorname{End}^0_F(A)
=\mathbb Q\otimes_{\mathbb Z}\operatorname{End}_F(A),\qquad
[K:\mathbb Q]=\dim A.
$$

Since K is a field and the map is unital, the action is faithful.
The general base F is essential: the descent lemma passes through
an abelian variety over a finite extension of ℚ. Simplicity of A
is not part of the definition. Snowden, §9.4, before Lemma 9.4.3,
p. 29, uses this notion; Khare–Wintenberger, Theorem 3.1(ii), §3,
p. 16 of the arXiv version, uses the same arithmetic structure.

The baseline is `TauCeti.AlgebraicGeometry.AbelianVariety`, `TauCeti.AlgebraicGeometry.AbelianVariety.dim`
and `TauCeti.AlgebraicGeometry.AbelianVariety.End`. A6 supplies rational endomorphisms and their action on
the Tate module; A3 and R01.6 supply the rational Tate module.
The resulting API is:

| Proposed declaration | Specification |
| --- | --- |
| `IsGL2Type` | The action and the dimension equality |
| `IsGL2Type.lambdaAdicRep` | For λ over p, the G_F-representation $V_\lambda(A)=V_p(A)\otimes_{K\otimes\mathbb Q_p}K_\lambda$ |
| `IsGL2Type.finrank_lambdaAdicRep` | Its Kλ-dimension is two |
| `IsGL2Type.free_tateModule` | $V_p(A)$ is free of rank two over $K\otimes\mathbb Q_p$ |
| `IsGL2Type.isogeny` | Transport of the K-action across an F-isogeny, with the resulting λ-adic representations identified |
| `ComesFromGL2Type` | A two-dimensional representation is a scalar extension of some $V_\lambda(A)$, through an embedding $K\hookrightarrow\overline{\mathbb Q}_p$ inducing λ |
| `IsGL2Type.baseChange` | Finite base change preserves the structure and restricts the λ-adic representation to the smaller Galois group |

The rank-two statement needs more than division of total dimensions.
The characteristic polynomials of rational endomorphisms on Tate
modules, supplied by A6, show that the embeddings of K occur with
the same multiplicity. Since the total dimension is $2\dim A$,
that multiplicity is two. Thus every λ-factor, not just their sum,
has rank two. Isogeny transport uses the invertibility of an isogeny
in the rational endomorphism category, whose underlying notion is
`TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`.

The tests are `isGL2Type_ellipticCurve`, `isGL2Type_J0_23`,
`not_isGL2Type_prod_rat` and `isGL2Type_zero`. An elliptic curve
with K=ℚ has the usual two-dimensional rational Tate module.
$J_0(23)$, with dimension two and the Hecke action by ℚ(√5),
has a two-dimensional λ-factor. A surface such as E×E with K=ℚ
fails the dimension equality; that test is not an assertion that
E×E can never be of GL₂-type. Indeed a quadratic number field
can act through its embedding in $M_2(\mathbb Q)$.
The zero abelian variety admits no such structure because a number
field has positive degree. These examples distinguish the arithmetic
dimension requirement from the mere existence of an endomorphism
action.

### Descent of a realisation

`R25.5/descent-of-gl2-type-realisation` states that if
$\rho:G_F\to\mathrm{GL}_2(\overline{\mathbb Q}_p)$ is irreducible,
F′/F is finite, its restriction remains irreducible, and the
restriction comes from a GL₂-type abelian variety over F′, then
ρ comes from such an abelian variety over F. The declaration
`comesFromGL2Type_of_restrict` must include irreducibility both
before and after restriction. Potential realisation of a reducible
restriction does not meet this hypothesis.

Let A′ be the realising variety and form its Weil restriction B.
Its Tate module is the induced representation of the Tate module
of A′. With the coefficient-field action retained, Frobenius
reciprocity detects ρ in this induced module with the relevant
one-dimensional multiplicity space. Faltings' endomorphism theorem
identifies the representation commutant with rational endomorphisms
of B after scalar extension. The semisimple decomposition of that
endomorphism algebra, together with Poincaré decomposition, cuts
out a simple isogeny factor whose endomorphism field supplies a
GL₂-type action. The multiplicity calculation forces its Tate
module factor to be two-dimensional over that field. This returns
the requested A/F rather than leaving only an induced
representation of larger dimension.

The proof imports Weil restriction, induced Tate modules and
semisimple endomorphisms from A6, and the Tate-module isogeny
theorem from `FaltingsFinitenessAndIsogenyTheorems:R28.4`.
It uses the preceding GL₂-type interface. Snowden, Lemma 9.4.4
and proof, §9.4, pp. 29–30, is the source and credits the descent
argument to Taylor. These imports do not require a finiteness
theorem for abelian varieties with bounded bad reduction.

### Snowden's weight-two realisation

`R25.5/snowden-realisation` assumes p is odd and
$\rho:G_{\mathbb Q}\to\mathrm{GL}_2(\overline{\mathbb Q}_p)$ is
continuous, finitely ramified, odd, and de Rham at p with
Hodge–Tate weights 0 and −1. A stable lattice defines a residual
representation $\bar\rho$; require its restriction to
$G_{\mathbb Q(\zeta_p)}$ to be absolutely irreducible, Snowden's
(A1). Then ρ is realised by an abelian variety A/ℚ of GL₂(K)-type,
for some number field K and embedding into $\overline{\mathbb Q}_p$.
Its proposed declaration is `comesFromGL2Type_of_weightTwo`.
Snowden's additional condition (A2), concerning a projective PGL₂(𝔽₅)
image, is automatic over ℚ because $[\mathbb Q(\zeta_5):\mathbb Q]=4$.
The theorem is not stated for p=2.

Potential modularity (R23.4) gives a totally real Galois extension
F″ disjoint from the residual field over which ρ is modular.
Choose a Sylow-2 subgroup of its Galois group. Its fixed field F′
has odd degree over ℚ, and F″/F′ is solvable. R17.4 descends the
Hilbert modular form to F′. In odd degree, R17.3 transfers the
parallel weight-two form to the quaternion algebra split at
exactly one real place. R18.6 realises it in the Tate module of
a Shimura-curve Jacobian, producing a GL₂-type realisation over
F′. Disjointness retains irreducibility of the restriction.
The preceding descent lemma now returns a realisation over ℚ.

This is Snowden, Proposition 9.4.1, p. 29, and its proof, p. 30.
The definition of weight two and its sign convention are in
§1.2, p. 2; (A1) and (A2) are in §3.1, p. 6. The use in
Dieulefait–Pacetti, Paso 6, §2, p. 14, is the application developed
below. General potential modularity and the modularity of the
Shimura-curve Tate module remain supplier results; this target
assembles them without invoking Serre's conjecture.

### Reading the reduction type from one λ-factor

`R25.5/reduction-of-the-realisation` verifies the local hypotheses
needed to use Fontaine or Schoof after realisation. Suppose A/ℚ
of GL₂(K)-type realises ρ through a prime λ above p. Then:

- At $\ell\ne p$, an unramified ρ implies good reduction of A;
  an unramified semisimple Weil–Deligne parameter implies semistable
  reduction.
- At p, a crystalline ρ implies good reduction of A. A semistable
  ρ with unramified Steinberg twist and nonzero monodromy implies
  multiplicative reduction.
- The dimension of A is $[K:\mathbb Q]\ge1$.

One λ-factor alone does not directly describe all of $V_p(A)$.
R11.5 supplies independence of the auxiliary prime and of the
coefficient embedding for the Weil–Deligne parameters of A,
including p-adic comparison. It transfers the indicated inertia
and monodromy conditions to every component. R11.3 and the
good-reduction criterion then apply to the full Tate module.
For the multiplicative case, the rank-one monodromy in every
two-dimensional factor sums to $\dim A$, the full toric rank.
The Steinberg twist must have unramified semisimple part: an
arbitrary ramified twist gives only potential semistability and
does not justify the stated reduction type. The lifts used here
have actual Steinberg type and satisfy this condition.

`reduction_of_comesFromGL2Type` is the proposed interface. Its
inputs are R11.3, R11.5, the p-adic comparison theories they use,
and the GL₂-type rank-two theorem. Dieulefait–Pacetti, Paso 6,
§2, p. 14, uses this transition at five. Khare–Wintenberger,
the proof of Theorem 3.1, §3, p. 18 of the arXiv version, explains
the same good/semistable distinction using Weil–Deligne parameters.

### Imaginary quadratic class numbers

`R25.5/class-number-one-imaginary-quadratic` proves class number one
for $\mathbb Q(\sqrt{-p})$ with
$p\in\{3,7,11,19,43,67,163\}$. Its declaration is
`classNumber_sqrt_neg_prime_eq_one`. This finite arithmetic result
is what rules out the relevant dihedral representations; the
list is not used as an unproved class-number table.

For p=3 and 7, the discriminant −p is small enough for the
direct PID criterion. For the remaining primes, the Minkowski
ideal-class bound is $(2/\pi)\sqrt p$. Enumerate rational
primes up to that bound. Since $p\equiv3\pmod8$, two is inert;
the finitely many odd primes needed have quadratic symbol
$(-p/q)=-1$. Inert prime ideals have norm q² and are generated
by q, so any appearing below the bound are already principal.
No ramified prime occurs within the bound. The small-prime
generation theorem gives principality of the whole class group.
For p=163 only q=2,3,5,7 require testing, making the certificate
short and exact.

Use `TauCeti.Multiquadratic.discr_eq_fundamentalDiscriminant`,
`RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt`,
`IsCyclotomicExtension.Rat.three_pid`, the small-prime PID theorem
named in R25.4, and `NumberField.classNumber_eq_one_iff`.
The class-field consequence comes from upstream L13. Khare,
Lemma 5.1(i), §5, p. 20, uses this exact list. In contrast,
ℚ(√−23) has class number three and two splits, so no assertion
for every p congruent to three modulo four follows from the
calculation.

### The level-one dihedral exception

`R25.5/level-one-dihedral-classification` assumes p odd and an odd
absolutely irreducible residual representation unramified outside p.
If its restriction to $G_{\mathbb Q(\zeta_p)}$ is reducible, its
projective image is dihedral, by R01.4. For a level-one dihedral
representation, p is three modulo four, the quadratic field
$Q=\mathbb Q(\sqrt{-p})$ has class number greater than one, and
projective inertia at p has order two. A cyclotomic twist has
normalised Serre weight $(p+1)/2$.

To see the arithmetic restriction, write the projective group as
D₂t. The rotation order t is odd: an even t would produce two
independent quadratic characters and thus a quadratic extension
unramified everywhere. The unique quadratic character therefore
cuts out Q. Oddness makes Q imaginary. Tame projective inertia
is a reflection, and the cyclic extension of degree t over Q
is unramified everywhere. Consequently t divides its class number
and is nontrivial. The local decomposition group centralizes the
reflection, so it equals the reflection subgroup; the local
representation is split, and the Serre-weight recipe gives the
normalised weight $(p+1)/2$.

It follows that (A1) holds if p is one modulo four, or p belongs
to the class-number-one list above, or no twist has weight
$(p+1)/2$. The actual terminal weights 2, 4, 6, 8 and 14 satisfy
the required exclusion by this local recipe and the listed
class numbers. In particular the needed primes 5, 7 and 13
all satisfy (A1). The declaration
`levelOne_dihedral_classification` exposes these sufficient
conditions. The full local distinction, including split and
niveau-two inertia, comes from R15.4; the finite-image restriction
criterion comes from R01.4. Sources are Khare, Lemma 5.1 and
proof, §5, pp. 20–21, and Dieulefait–Pacetti, Lemma 1.13,
§1.2, p. 8. Dihedral level-one behaviour in characteristic
twenty-three is compatible with this statement and is not excluded.

### Ordinary members with reducible reduction

`R25.5/ordinary-reducible-terminal-weights` considers the pairs

$$
(p,k)=(3,2),(3,4),(5,6),(7,8),(13,14).
$$

Let $\rho:G_{\mathbb Q}\to\mathrm{GL}_2(\overline{\mathbb Q}_p)$
be odd and irreducible, unramified outside p, crystalline at p
with Hodge–Tate weights $\{0,k-1\}$, and have reducible reduction.
Then ρ is ordinary and p-distinguished, arises from a level-one
cusp form of weight k, and therefore cannot exist.

The residual characters are globally unramified outside p; the
local crystalline weight recipe, together with the absence of
everywhere-unramified characters of $G_{\mathbb Q}$, identifies
their semisimplification, up to twist, with $1\oplus\bar\omega^{k-1}$.
In the Fontaine–Laffaille range k≤p, the reducible reduction gives
ordinarity. At k=p+1, Berger–Li–Zhu supplies the same conclusion:
the nonordinary alternative has irreducible niveau-two reduction.
Here $k-1\equiv1\pmod{p-1}$, so the two residual inertia
characters are distinct. This is the p-distinguished hypothesis
needed for the Skinner–Wiles theorem supplied by R21.5.

Modularity alone does not force level one. R19.4 and R19.5 supply
local–global compatibility, so unramifiedness away from p and
crystallinity at p give the level-one form of the required weight.
For k=2,4,6,8, `CuspForm.rank_eq_zero_of_weight_lt_twelve` proves
the cusp space vanishes. For k=14, `ModularForm.dimension_level_one`
and `ModularForm.rank_eq_one_add_rank_cuspForm` give the same
conclusion: the modular-form space has rank one and its Eisenstein
quotient has rank one. Equivalently, dividing a cusp form by Δ
would give a weight-two modular form, which is zero.

The proposed declaration is
`no_levelOne_crystalline_of_reducible_terminal`. Its inputs are
R21.5, R19.4–R19.5, the character calculation from R25.3 and the
stated modular-form dimensions. The test declarations in
Suggested.lean include vanishing below weight twelve and at
weight fourteen. See Dieulefait–Pacetti, Paso 6, p. 14, for the
3-adic cases, and Khare–Wintenberger, the proof of Theorem 4.3,
pp. 20–21 of the arXiv version, for the three p+1 cases. This
argument is independent of residual irreducible modularity.

### Excluding weight two

`R25.5/weight-two-level-one-excluded` asserts that, in every
characteristic p, there is no level-one residual representation
with actual Serre weight two. Its declaration is
`not_levelOne_weight_two`. For p=2 or 3 use Tate–Serre. For
p≥5 the dihedral classification ensures (A1), and R24.3 gives
a minimal crystalline weight-two lift. Residual absolute
irreducibility makes this lift irreducible. Apply Snowden's
realisation and the reduction interface: the lift is unramified
away from p and crystalline at p, so its realising abelian
variety has good reduction everywhere and positive dimension.
Fontaine's theorem contradicts this.

The prerequisites are Tate–Serre, the dihedral and realisation
targets, R24.3, R15.4 and Fontaine. Khare–Wintenberger,
Theorem 4.1(i), §4, p. 18 of the arXiv version, states this
exclusion. Its proof there uses auxiliary members of compatible
systems and other weight-two results. The proof chosen here is
the Snowden–Fontaine route. In particular, one may not use
Theorem 3.1(ii) of that arXiv version to realise the very
level-one crystalline case it expressly excludes. An alternative
route would use R24.5 to pass to a 3-adic member, Tate–Serre
for its reduction and the preceding ordinary argument; that
route has its own compatible-system prerequisites.

### Excluding p+1 at Schoof's primes

`R25.5/weight-p-plus-one-excluded-at-schoof-primes` asserts
$k(\bar\rho)\ne p+1$ for a level-one representation when
$p\in\{5,7,13\}$. Use (A1) from the dihedral classification
and the minimal weight-two Steinberg lift from R24.3. It is
unramified outside p and semistable of the stated Steinberg
type at p. Snowden realises it by a positive-dimensional
GL₂-type abelian variety, and the reduction interface makes
that variety semistable and good away from p. Schoof's
theorem excludes it. The declaration is
`not_levelOne_weight_succ_of_schoofPrime`. Its dependencies
are R24.3, R15.4, realisation, reduction and the exact Schoof
prime set. See Khare–Wintenberger, Theorem 4.1(iii), §4,
p. 18, and Dieulefait–Pacetti, Paso 6, p. 14 for p=5.

The prime eleven cannot be added. The residual representation
from Δ modulo eleven gives the relevant weight twelve, which
equals p+1. The elliptic curve $X_0(11)$ is semistable with
good reduction away from eleven, so the geometric contradiction
also fails there. Its minimal discriminant has eleven-adic
valuation five, producing the très ramifiée local behaviour
in the weight recipe. Both sides of the argument therefore
respect the omitted prime.

### Weight fourteen in characteristic eleven

`R25.5/weight-fourteen-at-eleven-is-a-twist` is a local
classification and dichotomy, rather than an unconditional
weight-fourteen exclusion. Let $\bar\rho$ be level one in
characteristic eleven with $k(\bar\rho)=14$, and let ω
be the mod-eleven cyclotomic character. The full local
recipe from R15.4 gives four possible inertia types:

| Case | Inertia type | Effect of twisting |
| --- | --- | --- |
| (a) | Split $\omega\oplus\omega^2$ | Twist by ω⁻¹ has weight two |
| (b) | Non-split peu ramifiée extension with subcharacter ω² and quotient ω | Twist by ω⁻¹ has weight two |
| (c) | Niveau-two characters $\omega_2^{13}\oplus\omega_2^{23}$ | Twist by ω⁻¹ has weight two |
| (d) | Non-split extension with subcharacter ω and quotient ω² | Twist by ω⁻¹ has weight twenty-two; twist by ω⁻² has weight ten |

The first three cases are excluded by the weight-two theorem.
In the fourth, no twist has weight two; its twist-normalised
weight is ten, which this roadmap does not exclude. Subcharacter
and quotient cannot be exchanged in a nonsplit extension.
The theorem `weight_fourteen_eleven_twist` records the resulting
alternative: weight two after the first twist, or weights
twenty-two and ten after the indicated two twists. It does
not deduce nonexistence in the second alternative.

Khare–Wintenberger, the arXiv version, proof of Theorem 4.3,
p. 21, asserted a weight-two twist at eleven without this
exception. The version of record, Annals of Mathematics 169
(2009), Theorem 5.4, p. 247, explicitly restricts its
weight-fourteen conclusion to p≠11. The theorem here uses
that published restriction and the complete local case
split. Its dependencies are R15.4 and the weight-two
exclusion, not a weight-ten induction from R26.

### The small-weight theorem

`R25.5/small-weight-level-one-exclusion` proves that no
level-one representation, in any characteristic p, has
$2\le k(\bar\rho)\le8$, or has $k(\bar\rho)=14$ with
p≠11. These are actual Serre weights. The declaration
is `not_levelOne_small_weight`. Its immediate corollary
is nonexistence of level-one odd absolutely irreducible
representations in characteristics 2, 3, 5 and 7, without
a weight restriction: a cyclotomic twist in these
characteristics has normalised weight at most p+1≤8.

For odd p, level-one determinant and oddness force even
weight, so it remains to handle 2, 4, 6 and 8, followed
by 14. Weight two is already settled. At weight four,
the minimal crystalline lift belongs to a compatible
system with empty ramification set, by R24.3 and R24.5.
Its 3-adic member is irreducible, has reducible reduction
by Tate–Serre, and is crystalline of weight four.
The ordinary terminal theorem at (3,4) excludes it.

For weight six, first settle characteristic five:
twist-normalised weights are 2, 4 or 6, the first two
already excluded and the last excluded by the Schoof
p+1 theorem. For a larger characteristic, pass through
the compatible system to its 5-adic member. The local
crystalline recipe at weight p+1 gives residual weight
two or six if its reduction is irreducible, both
impossible. Its reduction is therefore reducible, and
the (5,6) ordinary theorem excludes the member.

For weight eight, first settle characteristic seven in
the same way, using the previous weights and the
Schoof theorem at seven. An auxiliary 7-adic member
then has reducible reduction and is excluded by the
(7,8) ordinary theorem. This also proves the unrestricted
characteristic-seven corollary.

For weight fourteen, the characteristics at most seven
are already excluded in every weight. At thirteen,
the Schoof p+1 theorem applies. At larger characteristics,
pass to a 13-adic member. The crystalline local recipe
restricts an irreducible reduction to weight two or
fourteen, both already excluded at thirteen; its
reduction is therefore reducible. The (13,14) ordinary
theorem gives the contradiction. Characteristic eleven
is kept outside this statement, as the preceding
four-case calculation requires.

The proof imports compatible systems and the Serre
weight recipe, and uses the earlier exclusions in
the order just given. It also uses the dihedral check
for the minimal lifts and local–global compatibility
in the ordinary theorem. The source statements are
Khare–Wintenberger, arXiv Theorem 4.3 and proof,
pp. 19–21, Corollary 4.4, p. 21, with the corrected
published Theorem 5.4, p. 247. Khare, §1.1, p. 3,
explains their role in the level-one induction.
Weight twelve is not excluded: Δ supplies a level-one
cuspidal representation of that weight. Weight ten
belongs to the later weight-reduction argument, not
to this terminal list.

### The characteristic-five end of Paso 6

`R25.5/paso-six-terminal-cases` is the terminal application
used by `ClassicalSerreModularity:R33.4`. Start with an
almost strictly compatible system with empty ramification
set and irreducible non-bad-dihedral reduction at five.
If its Serre weight is two or four, take a minimal
crystalline lift and a system containing it. Its
3-adic member is irreducible and has reducible reduction
by Tate–Serre. The ordinary criterion at (3,2) or (3,4),
including the distinct inertia characters, makes this
member modular. The modularity-lifting interface then
propagates modularity to the original system. If the
weight is six, the minimal weight-two Steinberg lift
would realise a positive-dimensional semistable abelian
variety good away from five, contradicting Schoof.

The proposed `paso_six` states these two branches. Its
inputs are R24.3, R24.5, Tate–Serre, the ordinary terminal
theorem, the p+1 exclusion at five and the dihedral
classification, which makes (A1) automatic at five.
The level-one hypothesis is used to eliminate the
bad-dihedral branch; it is not a replacement for this
check in systems with nonempty ramification set.
Dieulefait–Pacetti, §2, Paso 6, p. 14, gives precisely
this end of the argument, with its role in the completed
odd-characteristic proof stated on p. 15.

The layer's landmarks are GL₂-type, Snowden's realisation
and the small-weight theorem with its characteristic-eleven
restriction. Its exit requirements include all the local
transition checks; possession of a realisation theorem
without its reduction and (A1) checks would not justify
either geometric application.

## R25.6 — The base-case table

`R25.6/base-case-table` defines a finite list of nine rows. Each row
records the characteristics and weights, ramification condition,
image condition, coefficient assumptions, supplier, consumer and
local check needed before application. This is a typed index to
the theorems established above; it does not itself stand in for
their mathematical hypotheses.

`BaseCaseRow` has a set of characteristics and a characteristic-dependent
set of weights, rather than a single characteristic and weight.
It also has flags for level one and oddness, a set of bad primes
or an absence marker for the geometric rows, and fields for the image and
coefficient conditions. `BaseCaseRow.statement` stores the name
of the proving declaration. `baseCases` constructs the nine rows,
and `baseCases_schoof_primes` characterises the exact five-prime
set. An empty characteristic set on a geometric row means that
the theorem concerns an abelian variety, rather than a residual
representation; it is not an exclusion of all residual weights.

| Row | Hypotheses and conclusion | Supplier | Consumer and local check |
| --- | --- | --- | --- |
| Tate | Finite characteristic-two coefficients, continuous absolutely irreducible residual representation, unramified outside two: impossible; all weights | R25.2/tate-theorem | R26.1 and the characteristic-two base case; determinant oddness is automatic |
| Serre | Finite characteristic-three coefficients, odd absolutely irreducible residual representation, unramified outside three: impossible; all weights | R25.2/serre-mod-three-theorem | R26.1 and R33.4's 3-adic member; check oddness and ramification |
| Fontaine | Abelian variety over ℚ, good reduction at every prime: dimension zero | R25.3/fontaine-theorem | R26.5 through weight two; verify good reduction at p as well as away from p |
| Schoof | Abelian variety over ℚ, semistable at ℓ and good away from $\ell\in\{2,3,5,7,13\}$: dimension zero | R25.4/schoof-theorem | R26.5 at weights p+1, and R33.4 at ℓ=5; check semistability and the exact prime set |
| Weight two | Level-one absolutely irreducible residual representation of weight two, any p: impossible | R25.5/weight-two-level-one-excluded | R26.5; check actual Serre weight, minimal crystallinity and (A1) |
| Selected p+1 | Level-one residual representation, p in $\{5,7,13\}$, weight p+1: impossible | R25.5/weight-p-plus-one-excluded-at-schoof-primes | R26.5; check the Steinberg weight-two lift and reduction type |
| Ordinary terminal members | Irreducible odd crystalline p-adic member of weight k, unramified outside p, with reducible reduction, at (3,2), (3,4), (5,6), (7,8), (13,14): impossible | R25.5/ordinary-reducible-terminal-weights | R33.4 and R26.5; check ordinarity, p-distinguishedness and level-one local–global compatibility |
| Small weights | Level-one residual representation with actual weight between two and eight, or weight fourteen with p≠11: impossible | R25.5/small-weight-level-one-exclusion | R26.5; retain the actual-weight convention and the exception at eleven |
| Paso 6 | Almost strictly compatible system with empty ramification set and irreducible reduction at five: weights two and four lead to a modular 3-adic member; weight six is impossible | R25.5/paso-six-terminal-cases | R33.4; check minimal lift, compatibility and the non-bad-dihedral condition |

The tests `baseCases_schoof_primes`, `baseCases_tate_no_oddness`,
`baseCases_weight_list`, `baseCases_fontaine_schoof_distinct` and
`baseCases_weight_fourteen_excludes_eleven` assert that the Schoof
row contains exactly 2,3,5,7,13; the Tate row needs no oddness
hypothesis; the residual rows do not assert an exclusion of
weight twelve; the two geometric rows have distinct suppliers
and reduction hypotheses; and no residual row includes (11,14).
The Δ representation and $J_0(11)$ give meaningful negative
checks for the two weight and prime boundaries.

There are three additional branches whose theorems have other
owners. A solvable image is treated by Langlands–Tunnell in
`GL2AutomorphicRepresentationsAndTransfer:R17.5`, and in
characteristic two by Rohrlich–Tunnell in `R17.6`.
Residually reducible modularity belongs to
`OrdinaryAutomorphicFormsAndModularityLifting:R21.5` and the
Pan extension of that roadmap. Failure of (A1) away from level
one belongs to `ClassicalSerreModularity:R27.1`
and `ClassicalSerreModularity:R33.2`. The arithmetic dihedral
classification here addresses level one only. These branches
remain supplier applications and are not additional
nonexistence claims in the table.

`R25.6/base-case-table-holds` asserts the mathematical theorem
of every row, using its supplier theorem with the recorded
hypotheses. The proposed `baseCases_holds` is the conjunction
of the row statements expressible in the available interfaces;
the semistable, crystalline and compatible-system statements
are specified in Suggested.lean's header until their owners'
interfaces exist. A name stored in a row is never treated as
a proof. The dependence runs from R25.1 through the geometric
and representation results to the table, and only then to
R26 and R33. In particular, neither consumer is an input to
the table theorem.

The sources for the organisation are Dieulefait–Pacetti,
§1.1, Theorems 1.1–1.3, pp. 3–4, and the end of the
odd-characteristic argument, §2, p. 15; Khare, §1.1,
pp. 2–3, gives the level-one base cases. The table theorem
is the final landmark. Its exit criterion is that every
local transition used by a consumer has the full hypotheses
listed above, with no inferred exclusion of eleven, weight
ten or weight twelve.

## Additional library interfaces used by the arguments

Several general declarations occur at multiple transitions.
They are listed here to make their precise role explicit.
All are existing baseline tools, not further targets.

| Declaration | Role |
| --- | --- |
| `AlgebraicClosure` | Scalar extension in absolute irreducibility and the ambient field for kernel and torsion fields |
| `Ideal.isUnramifiedAt_iff_inertia_eq_bot` | Converts unramifiedness of an ideal in a Galois extension to trivial inertia |
| `NumberField.finrank_eq_one_of_unramified` | The number-field degree-one conclusion for an extension unramified at all finite places |
| `TauCeti.bochner` | Identifies a continuous positive-definite function with the Fourier transform of a finite positive measure; compatible with the Lorentzian argument |
| `TauCeti.RootsOfUnityGroup.groupScheme` | The group-scheme model μp |
| `TauCeti.DiagonalizableGroup.groupScheme` | Diagonalizable finite groups occurring in the reordered filtration |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor` | Base change to ℤ[1/ℓ,ζℓ] in the cyclotomic splitting theorem |
| `Real.pi_gt_d6`, `Real.pi_lt_d6` | Finer rational π enclosures for the degree certificates and the small-discriminant calculations |

The group-scheme base-change functor is a functor on the existing
finite locally free category. The exactness and point-action
compatibilities needed by this roadmap are part of R07.1;
existence of the functor alone is not an exactness theorem.
Likewise, the library's different ideal and divisibility
estimates provide the algebraic foundation, while the full
ramification filtration and reciprocity comparison remain
local-fields and class-field-theory inputs.

## References

All results above are stated in the conventions fixed here.
The references distinguish source versions because the
weight-fourteen theorem changed between the first preprint
and the published paper. Printed page numbers are used for
books and published articles; for arXiv versions, the
document's own page numbers are used.

- **Dieulefait–Pacetti.** Luis Dieulefait and Ariel Pacetti,
  [A simplified proof of Serre's conjecture](https://arxiv.org/abs/2108.07577v2),
  arXiv:2108.07577v2, 3 May 2022; published in RACSAM 117
  (2023), article 153. Theorem 1.1 and 1.2, §1.1, p. 3,
  state the Tate–Serre and Schoof base cases. Lemma 1.13,
  §1.2, p. 8, supplies the cyclotomic restriction check;
  §2, Paso 6, pp. 14–15, is the terminal application.
- **Khare.** Chandrashekhar Khare,
  [On Serre's modularity conjecture for 2-dimensional mod p representations unramified outside p](https://arxiv.org/abs/math/0504080v1),
  arXiv:math/0504080v1, 5 April 2005; published under the
  title *Serre's modularity conjecture: the level one case*,
  Duke Mathematical Journal 134 (2006), 557–589. §1,
  pp. 2–3, fixes level one and its base cases; Lemmas
  5.1–5.2, §5, pp. 20–21, give the dihedral and twisting
  calculations; §§7.2–8, pp. 29–30, discuss the
  discriminant approach and its limits.
- **Moon–Taguchi.** Hyunsuk Moon and Yuichiro Taguchi,
  [The non-existence of certain mod 2 Galois representations of some small quadratic fields](https://arxiv.org/abs/0710.1319v1),
  arXiv:0710.1319v1, 5 October 2007. §2, (2.1) and
  Lemmas 1–3, pp. 2–5, give the Borel and unit-conductor
  calculations; §3, pp. 5–7, gives the global
  discriminant method.
- **Jones.** John W. Jones,
  [Wild ramification bounds and simple group Galois extensions ramified only at 2](https://hobbes.la.asu.edu/papers/simple2.pdf),
  author preprint dated 2 April 2010. §1.1,
  equations (1)–(3), pp. 2–3, describes discriminant
  exponents and mean slopes. §2.3, pp. 8–9, compares
  the wild bounds, including Tate's original estimate;
  §3.1, p. 9, connects them to root discriminants.
- **Ghitza–Yamauchi.** Alexandru Ghitza and Takuya Yamauchi,
  [The non-existence of some Galois representations of moderate dimension in small characteristic](https://arxiv.org/abs/2509.00635v2),
  arXiv:2509.00635v2, 31 October 2025. §2.3,
  Lemma 2.6, p. 5, states the general different bound;
  §3, Propositions 3.2–3.3, p. 7, applies
  discriminant and subgroup restrictions.
- **Fesenko–Vostokov.** Ivan B. Fesenko and Sergei V.
  Vostokov, [Local Fields and Their Extensions](https://ivanfesenko.org/wp-content/uploads/2021/10/vol.pdf),
  second edition, American Mathematical Society, 2002,
  author-hosted copy. Ch. I, (5.7)–(5.8), pp. 14–16,
  proves the power maps on unit filtrations; Ch. IV,
  (3.4)(1) and (3.5), pp. 135–136, proves reciprocity
  equivariance and the upper-ramification comparison.
- **Odlyzko, survey.** Andrew M. Odlyzko,
  [Bounds for discriminants and related estimates for class numbers, regulators and zeros of zeta functions: a survey of recent results](https://www.numdam.org/item/JTNB_1990__2_1_119_0/),
  Journal de Théorie des Nombres de Bordeaux 2 (1990),
  119–141. §1, pp. 119–121, discusses Minkowski and
  the unconditional method. §2, (2.1)–(2.5),
  pp. 121–122, gives the completed-zeta explicit
  formula and its test-function requirements; p. 123
  discusses finite-degree evaluations.
- **Odlyzko, tables.** Andrew M. Odlyzko,
  [Discriminant bounds](https://www-users.cse.umn.edu/~odlyzko/unpublished/index.html),
  unpublished tables dated 29 November 1976,
  especially [Table 2](https://www-users.cse.umn.edu/~odlyzko/unpublished/discr.bound.table2),
  the unconditional totally complex column, and
  the accompanying description. The roadmap's
  numerical conclusions are proved by rational
  certificates for the explicit formula, rather
  than by trusting rounded entries.
- **Fontaine.** Jean-Marc Fontaine,
  [Il n'y a pas de variété abélienne sur Z](https://www.imo.universite-paris-saclay.fr/~fontaine/varabZ.pdf),
  Inventiones Mathematicae 81 (1985), 515–538,
  author-hosted publisher scan. The introduction,
  pp. 515–517, states Théorèmes A and B and their
  corollaries. §3.4.5–3.4.6, pp. 536–537,
  gives the finite-flat filtration and the
  abelian-variety nonexistence consequence.
- **Brumer–Kramer.** Armand Brumer and Kenneth Kramer,
  [Non-existence of certain semistable abelian varieties](https://arxiv.org/abs/math/0011270v1),
  arXiv:math/0011270v1, 2 November 2000;
  Manuscripta Mathematica 106 (2001), 291–304.
  §1, p. 1, states Fontaine's theorem;
  Proposition 3.2 and (3.3), §3, pp. 7–8,
  give the different-bound input.
- **Schoof.** René Schoof,
  [Abelian varieties over Q with bad reduction in one prime only](https://www.mat.uniroma2.it/~schoof/abvar1prime.pdf),
  Compositio Mathematica 141 (2005), 847–868,
  author-hosted published copy. Theorem 1.1,
  p. 847, is the five-prime theorem. Definition
  2.1 and examples, pp. 848–849, define D;
  Proposition 3.1 and proof, pp. 850–851,
  gives the point-count criterion. Proposition
  4.1 and Corollary 4.2, pp. 851–853,
  compute Ext. Proposition 5.1, pp. 853–854,
  gives the simple-object field criterion.
  The explicit field calculations needed here
  are in §6, pp. 855–858.
- **Snowden.** Andrew Snowden,
  [On two dimensional weight two odd representations of totally real fields](https://arxiv.org/abs/0905.4266v1),
  arXiv:0905.4266v1, 26 May 2009. §1.2,
  p. 2, fixes the Hodge–Tate convention;
  §3.1, p. 6, lists (A1) and (A2).
  Proposition 9.4.1 and Lemmas 9.4.3–9.4.4,
  §9.4, pp. 29–30, give realisation and
  descent.
- **Khare–Wintenberger, first preprint.**
  Chandrashekhar Khare and Jean-Pierre Wintenberger,
  [On Serre's reciprocity conjecture for 2-dimensional mod p representations](https://arxiv.org/abs/math/0412076v1),
  arXiv:math/0412076v1, 3 December 2004.
  Theorem 3.1, pp. 15–18, and Theorems
  4.1 and 4.3 with proofs and Corollary 4.4,
  pp. 18–21, are the early terminal-weight
  arguments. The weight-fourteen assertion
  at eleven on p. 21 is not used as a
  theorem here.
- **Khare–Wintenberger, version of record.**
  [On Serre's conjecture for 2-dimensional mod p representations of Gal(ℚ̄/ℚ)](https://annals.math.princeton.edu/2009/169-1/p05),
  Annals of Mathematics 169 (2009), 229–253,
  [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf).
  Theorem 5.4, p. 247, is the small-weight
  statement used here, with p≠11 in its
  weight-fourteen clause.
