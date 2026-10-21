# Diophantine approximation and transcendence — Layer DT.4, continued: superelliptic equations over S-integers, Schinzel–Tijdeman and Catalan

This document continues Layer DT.4 (effective applications) of the roadmap *Diophantine approximation and
transcendence*. The first part of the layer, in the roadmap's main document, plans Evertse's Chapter 5: rational
S-units, the balanced-divisor representatives, Pillai's equation and Tijdeman's gap theorem, the effective unit
equation in a number field (Theorem 5.12), Thue equations over ℤ (Theorem 5.13), the S-unit equation over ℚ
(Theorem 5.17), Győry's theorem for finitely generated groups (Theorem 5.18) and the Thue–Mahler equation. It states
Baker's superelliptic theorem (5.14), the Schinzel–Tijdeman theorem (5.15) and Tijdeman's Catalan bound with route
paragraphs only. This part supplies their proofs, and the interfaces the first review asked to be split. Everything
here builds on the first part: its nodes are cited as `DT.4/<name>`, the nodes of this part by their bare name, and
nothing there is restated.

What this part adds:

- **Superelliptic and hyperelliptic equations over S-integers** (§4.10). Bérczes–Evertse–Győry's explicit
  Theorems 2.1 and 2.2 for `f(x) = b·y^m` in the S-integers of a number field, and an effective version that rests
  only on the unit-equation theorems of the first part. Over ℤ they give the bounds recorded in
  `DT.4/baker-superelliptic-theorem`.
- **The Schinzel–Tijdeman theorem over S-integers** (§4.11), BEG's Theorem 2.3, with a corrected constant: BEG's
  estimate (5.19) omits the factor `h_{L_1}h_{L_2}`, and restoring it changes the bound to
  `(10n²s)^{46ns}|D_K|^{8n}P_S^{n²}e^{15ndĥ}`. Over ℤ this is `(10n²)^{46n}e^{15nĥ}`, which corrects the constant
  recorded in `DT.4/schinzel-tijdeman-theorem`.
- **Tijdeman's theorem on Catalan's equation** (§4.12), decomposed from his paper, with both Baker-type inputs
  replaced by Matveev's bound.
- **The S-unit and class-group interfaces** (§4.6) and **the discriminant estimates for the auxiliary fields**
  (§4.7) that the explicit constants need, and **logarithmic forms at an arbitrary place** (§4.8), including Yu's
  p-adic bound in an arbitrary number field and for one logarithm.
- **Thue and Pell equations over S-integers, and a uniform bound for Thue equations** (§4.9). The uniform bound for
  cubic forms answers the request of ArithmeticStatistics, Layer ST.1.

## Scope and boundaries

This part owns the targets above. It does not own:

- the lower bounds for linear forms in logarithms themselves: Matveev's Corollary 2.3, Yu's 1994 p-adic bound and the
  multiplicative forms of Evertse's Corollary 5.3 are DT.3's (`DT.3/matveev-corollary-linear-form-bound`,
  `DT.3/yu-explicit-p-adic-bound`, `DT.3/baker-lower-bound-for-multiplicative-form`); §4.8 only reads them at an
  arbitrary place;
- the unit and S-unit equations and Thue's theorem over ℤ (first part of DT.4: `DT.4/gyory-effective-finiteness`,
  `DT.4/effective-finiteness-for-unit-and-thue-equations`, `DT.4/thue-equation-effective-bound`), which §4.9 extends;
- the uniform count of non-degenerate solutions of unit equations (DT.2, `DT.2/uniform-bound-nondegenerate-solutions`);
- successive minima and Minkowski's second theorem (GeometryOfNumbersAndQuadraticArithmetic, Layer GN.1, a lower
  upstream tier);
- the relative discriminant ideal, its tower formula, the different and its tame and wild exponent bounds (Tau Ceti:
  `TauCeti.relDiscr`, `TauCeti.relDiscr_tower`, and the roadmap NumberFieldArithmetic, Layers 4–6);
- lattice reduction, certified numerical evaluation and exhaustive enumeration below the bounds proved here
  (EffectiveDiophantineMethods, Layer ED.2), which consumes these bounds;
- Mihăilescu's proof of Catalan's conjecture (cyclotomic; not planned in this layer).

Two notions that roadmaps of higher upstream tiers plan are used here and therefore move down: the S-unit theorem
(`s-unit-rank`; planned at KTheoryLowDegrees, Layer U.4, and MordellLawrenceVenkatesh, Layer LV.6) and the analytic
class number and regulator bounds (`class-number-and-regulator-bounds`; Louboutin's residue bound is planned at
AnalyticNumberTheory, Layer AN.4). The second is stated here with its sources and recorded as a gap.

## Conventions

**Places and absolute values.** For a number field `K` of degree `d`, places are the infinite places
(`NumberField.InfinitePlace K`) and the nonzero primes of `𝓞_K` (`IsDedekindDomain.HeightOneSpectrum (𝓞 K)`).
Absolute values are normalised as in Bérczes–Evertse–Győry (2.1): `|x|_v = |σ(x)|` at a real place, `|σ(x)|²` at a
complex place, `N𝔭^{−ord_𝔭 x}` at a finite place. In Lean, `w x ^ w.mult` and `FinitePlace.mk 𝔭 x`; the product
formula is Mathlib's `NumberField.prod_abs_eq_one`. `normLogAbs v x` is `log |x|_v`.

**S.** A finite set `S` of nonzero primes of `𝓞_K`. Bérczes–Evertse–Győry's `S` also contains the infinite places, so
their `s` is `#S + #(infinite places)` here. The S-integers and S-units are Mathlib's `Set.integer` and `Set.unit`
for `S` viewed as a set of height-one primes. `P_S := max N𝔭` and `Q_S := ∏ N𝔭` over the primes of `S` (both `1` for
`S = ∅`).

**Heights.** `h` is the absolute logarithmic Weil height (`NumberField.absLogHeight₁`). For a polynomial
`f = a_0X^n + ⋯ + a_n`, `h(f)` is the absolute height of `(1 : a_0 : ⋯ : a_n)` and `ĥ = ĥ(b, f)` that of
`(1 : b : a_0 : ⋯ : a_n)`. `log* x := max(1, log x)`.

**The superelliptic setting (BEG §4).** `f ∈ 𝓞_S[X]` of degree `n ≥ 2` with discriminant `D(f) ≠ 0` (Mathlib's
`Polynomial.discr`), `b ∈ 𝓞_S ∖ {0}`, `m ≥ 2`, `f = a_0(X − α_1)⋯(X − α_n)` over a splitting field, `L_i = K(α_i)` and
`T_i` the primes of `L_i` above `S` (`primesAbove`). The equation is `f(x) = b·y^m` in `x, y ∈ 𝓞_S`; for `m = 2`, `n ≥ 3`.

**Effective versus explicit.** A statement is *effective* when its bound is computable from the data, through
quantities such as a computed class number or fundamental system; *explicit* when the bound is a closed formula in
`n, m, d, s, |D_K|, P_S, Q_S, ĥ`. The effective forms use computed arithmetic data and the logarithmic-form suppliers. Their explicit closed-form counterparts additionally use the gaps listed under Dependencies; the auxiliary fields can have degree greater than one even when the base field is ℚ.

## Sources

- A. Bérczes, J.-H. Evertse, K. Győry, *Effective results for hyper- and superelliptic equations over number
fields*, arXiv:1301.7168v1 (30 Jan 2013); Publ. Math. Debrecen 82 (2013) 727–756.
  [Public source](https://arxiv.org/abs/1301.7168v1). Read: ArXiv v1 §§3–5, all locators cited by this packet, independently read 2026-10-13; published §§3–5
compared, with page images checked for the disputed formulas. Published pages equal arXiv pages plus 726.
Earlier planner’s §§1–2 reading is inherited; Theorems 2.1–2.3 checked independently.
- J.-H. Evertse, *Diophantine Approximation, lecture notes, Chapter 5: Linear forms in logarithms and
applications*, 2019 chapter file dio19-5.pdf (as served 2026-10-13).
  [Public source](http://pub.math.leidenuniv.nl/~evertsejh/dio19-5.pdf). Read: §5.1 (Catalan, printed p. 88) §5.3 Theorems 5.13–5.15 and example (5.8), printed pp. 96–99 §5.5
Exercises 5.6–5.7, printed p. 105
- R. Tijdeman, *On the equation of Catalan*, Acta Arith. 29 (1976) 197–209 (scan; DOI
10.4064/aa-29-2-197-209).
  [Public source](https://web.archive.org/web/20250622030842/http://matwbn.icm.edu.pl/ksiazki/aa/aa29/aa2929.pdf). Read: §§1–3 and §5 completely from page images (pp. 197–201, 205–208); §4 (modifications of Baker's proof)
read for its statements only
- P. Voutier, *An effective lower bound for the height of algebraic numbers*, Acta Arith. 74 (1996) 81–95.
  [Public source](https://web.archive.org/web/20250619150841/http://matwbn.icm.edu.pl/ksiazki/aa/aa74/aa7417.pdf). Read: §1, Theorem and Corollaries 1–2, pp. 81–84
- Y. Bugeaud, K. Győry, *Bounds for the solutions of unit equations*, Acta Arith. 74 (1996) 67–80.
  [Public source](https://web.archive.org/web/20250619160424/http://matwbn.icm.edu.pl/ksiazki/aa/aa74/aa7416.pdf). Read: §3, Lemmas 1–3 with proofs, pp. 70–74
- Y. Bugeaud, K. Győry, *Bounds for the solutions of Thue–Mahler equations and norm form equations*, Acta
Arith. 74 (1996) 273–292.
  [Public source](https://web.archive.org/web/20250619155420/http://matwbn.icm.edu.pl/ksiazki/aa/aa74/aa7437.pdf). Read: §1–2 (statements), §5 (S-norm, S-regulator, Lemmas 1–4), pp. 273–281
- E. M. Matveev, *An explicit lower bound for a homogeneous rational linear form in the logarithms of
algebraic numbers. II*, Izv. Math. 64 (2000) 1217–1269.
  [Public source](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng). Read: Corollary 2.3, p. 1219: independently checked the reviewed DT.3 supplier contract and its proof
interface. Fresh publisher PDF retrieval failed (HTTP 503/403); primary passage not re-read in this review.
- K. Yu, *Linear forms in p-adic logarithms III*, Compositio Math. 91 (1994) 241–276.
  [Public source](https://www.numdam.org/article/CM_1994__91_3_241_0.pdf). Read: §§0.1–0.2, pp. 241–247; page image p. 242; arbitrary nonzero arguments and valuation convention
checked independently 2026-10-13.
- J.-H. Evertse, H. P. Schlickewei, W. M. Schmidt, *Linear equations in variables which lie in a
multiplicative group*, Ann. of Math. 155 (2002); arXiv:math/0409604v1.
  [Public source](https://arxiv.org/abs/math/0409604v1). Read: Theorem 1.1, preprint pp. 1–2, read independently 2026-10-13.
- N. Tzanakis, B. M. M. de Weger, *How to explicitly solve a Thue–Mahler equation*, Compositio Math. 84 (1992)
223–288.
  [Public source](https://www.numdam.org/item/CM_1992__84_3_223_0.pdf). Read: §§5–6, printed pp. 230–234, read independently 2026-10-13 for the finite ideal representative
reduction.
- K. Győry, K. Yu, *Bounds for the solutions of S-unit equations and decomposable form equations*, Acta Arith.
123 (2006) 9–41 (DOI 10.4064/aa123-1-2).
  [Public source](https://www.impan.pl/shop/en/publication/transaction/download/product/83173). Read: Theorems 1–3 and Corollary 3, pp. 11–16; Proposition 1 and Lemmas 2–3 with proofs, pp. 19–21; proof of
Theorem 3, pp. 34–37; proof of Corollary 3, pp. 38–39. Publisher PDF read independently 2026-10-13.
- T. Loher, D. Masser, *Uniformly counting points of bounded height*, Acta Arith. 111 (2004), 277–297.
  [Public source](https://www.impan.pl/shop/en/publication/transaction/download/product/82907). Read: Theorems 1 and 3, pp. 278–280; §5, proof of Theorem 3, pp. 293–294, read 2026-10-13.
- H. M. Stark, *Some effective cases of the Brauer–Siegel theorem*, Invent. Math. 23 (1974), 135–152.
  [Public source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0023/PPN356556735_0023.pdf). Read: Lemma 6 and proof, printed p. 143 (PDF page 151 of the digitized journal volume), read from the page
image 2026-10-13.

The published BEG PDF was also checked at [the journal](https://publi.math.unideb.hu/paper/1797/download/10_5486_PMD_2013_5748.pdf). Its page numbers are the arXiv numbers plus 726. SHA-256 receipts for the exact versions are recorded in the packet.

## How the targets fit together

The effective track runs: §4.6 (S-unit rank, kernel and lattice, small representatives, principal generators,
Minkowski cofactors) → `superelliptic-power-decomposition` (x − α = γξ^m with γ from a finite set) →
`superelliptic-reduction-to-thue-equation` or `hyperelliptic-reduction-to-pell-system` → the effective Thue and Pell
theorems of §4.9, which reduce to the unit equations of the first part (`DT.4/gyory-effective-finiteness`) →
`superelliptic-effective-finiteness-over-s-integers`. For variable exponents, `superelliptic-variable-exponent-decomposition`
and `large-place-estimate-for-variable-exponent` feed `baker-bound-at-a-place`, giving
`schinzel-tijdeman-effective-over-s-integers`. Tijdeman's Catalan theorem combines Matveev's bound
(`separated-height-logarithmic-form-bound`) with the Schinzel–Tijdeman and Baker theorems over ℤ.

The explicit track adds, at each step, the height bound of `superelliptic-power-decomposition-height-bound`, the
discriminant bounds of §4.7 for the auxiliary fields, `class-number-and-regulator-bounds`, the S-regulator, and the
explicit Thue and Pell bounds of Győry–Yu, to reach BEG's Theorems 2.1–2.3.

## Targets

### 4.6 S-units, S-norms and S-regulators

The S-integer arithmetic every effective argument below runs on: the S-norm, the S-unit theorem, the kernel
and lattice of the S-logarithmic map, the S-regulator, fundamental systems of controlled height, small
representatives modulo m-th powers of S-units, and the class-group facts (principal generators, Minkowski
cofactors). Only the class number and regulator bounds of BEG Lemma 3.5 are analytic, and only the explicit
constants use them.

<a id="s-norm"></a>
#### The S-norm of an element of a number field

`DT.4/s-norm` · definition · Lean: `sNorm`

Let K be a number field and S a finite set of nonzero primes of 𝓞_K; the places of K in 'S' are S together
with all infinite places. Normalise absolute values as in Bérczes–Evertse–Győry (2.1): |x|_v := |σ(x)| at a
real place, |σ(x)|² at a complex place, and N𝔭^{−ord_𝔭(x)} at a finite place 𝔭 (in Mathlib: w(x)^{mult w}
for w : InfinitePlace K, and the FinitePlace norm). The S-norm of x ∈ K is N_S(x) := ∏_{w infinite}
w(x)^{mult w} · ∏_{𝔭 ∈ S} |x|_𝔭. For x ≠ 0 the product formula gives N_S(x) = ∏_{𝔭 ∉ S} |x|_𝔭^{−1}, the
absolute norm of the part of the fractional ideal (x) supported outside S; for a fractional ideal of the
S-integers generated by x_1, …, x_r, N_S([x_1, …, x_r]_S) := ∏_{𝔭 ∉ S} max_i |x_i|_𝔭^{−1}.

*Hypotheses.*

- K a number field
- S a finite set of nonzero primes of 𝓞_K

*Uses.*

- Bérczes–Evertse–Győry, Lemma 3.8 and (4.11)–(4.13): the size of a small representative modulo m-th powers is
controlled by the S-norm
- Bérczes–Evertse–Győry, §3.4: lower bound h(x) ≥ (1/[K:ℚ])·log N_S(x) for S-integers
- small-representative-modulo-s-unit-powers: the target value log N_S(α)/d at every place of S
- superelliptic-power-decomposition-height-bound: norm estimates N_T(γ₁), N_T(γ₂) for the factors of x − α

*API.*

- `sNorm_mul` (simp): N_S(xy) = N_S(x)·N_S(y).
- `sNorm_one` (simp): N_S(1) = 1.
- `sNorm_eq_inv_finprod_compl` (characterisation): For x ≠ 0: N_S(x) = (∏ᶠ_{𝔭 ∉ S} |x|_𝔭)^{−1}.
- `sNorm_empty` (compatibility): For S = ∅: N_S(x) = |N_{K/ℚ}(x)|.
- `one_le_sNorm` (other): For x ∈ 𝓞_S nonzero: 1 ≤ N_S(x).
- `sNorm_eq_one_iff` (characterisation): For x ∈ 𝓞_S nonzero: N_S(x) = 1 ↔ x is an S-unit.
- `log_sNorm_le_logHeight` (relation): For x ∈ 𝓞_S: log N_S(x) ≤ [K:ℚ]·h(x), with h the absolute logarithmic
height.
- `sNorm_algebraMap` (functoriality): For L/K finite and T the primes of L above S: N_T(x) = N_S(x)^{[L:K]}
for x ∈ K.
- `sNorm_eq_absNorm_div` (characterisation): For x ∈ 𝓞_K nonzero: N_S(x) = N((x)) / ∏_{𝔭∈S} N𝔭^{ord_𝔭(x)}, the
norm of the part of (x) outside S (BEG (3.2)–(3.3)).

*Unit tests.*

- `sNorm_rat_two_twelve` (computation): For K = ℚ and S = {(2)}: N_S(12) = 3.
- `sNorm_empty_eq` (degenerate): For S = ∅ and x ∈ K: N_S(x) = |N_{K/ℚ}(x)|.
- `sNorm_empty_eq_absNorm` (compatibility): For S = ∅ and x ∈ 𝓞_K nonzero: N_S(x) = Ideal.absNorm (span {x}).
- `sNorm_half_lt_one` (non-example): For K = ℚ, S = ∅: N_S(1/2) = 1/2 < 1, so the lower bound N_S ≥ 1 needs x
to be an S-integer.
- `sNorm_gaussian_complex_weight` (non-example): For K = ℚ(i), S = ∅: N_S(1 + i) = 2; using |σ(·)| without the
square at the complex place would give √2.

*Proof sketch.*

1. Definition. The two descriptions agree by the product formula (NumberField.prod_abs_eq_one) and the finite
support of x ↦ |x|_𝔭 (FinitePlace.hasFiniteMulSupport).

*Checks.*

- For K = ℚ and S = {2}: N_S(12) = 12·(1/4) = 3.
- For S = ∅ and x ∈ 𝓞_K: N_S(x) = |N_{K/ℚ}(x)|.
- For x an S-integer, N_S(x) ≥ 1 with equality exactly for S-units.

*Needs.*

- `mathlib:NumberField.prod_abs_eq_one`
- `mathlib:NumberField.FinitePlace.hasFiniteMulSupport`
- `mathlib:NumberField.InfinitePlace.prod_eq_abs_norm`
- `mathlib:NumberField.InfinitePlace.mult`
- `mathlib:NumberField.FinitePlace.mk`
- `mathlib:Set.integer`
- `mathlib:Set.unit`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.2, definition of N_S and formulas (3.2)–(3.5), pp. 8–9 (arXiv
v1 pagination; published pagination adds 726).: The S-norm of a fractional ideal of the S-integers as the
absolute norm of its part outside S, its value on principal ideals as the product of |x|_v over v ∈ S, and
its behaviour in finite extensions.
- bugeaud-gyory-thue-mahler-1996, §5, definition of the S-norm, p. 279: Bugeaud and Győry define the S-norm as
the norm of the part of (x) composed of primes outside S, note that it is multiplicative, equals
|N_{K/ℚ}(x)| for S = S_∞, and equals ∏_{v∈S}|x|_v.

<a id="s-unit-rank"></a>
#### The S-unit theorem: 𝓞_S^× is finitely generated of rank r + #S

`DT.4/s-unit-rank` · theorem · Lean: `exists_isFundamentalSUnitSystem`, `card_eq_of_isFundamentalSUnitSystem`

Let K be a number field with unit rank r = r_1 + r_2 − 1 and S a finite set of nonzero primes of 𝓞_K. Then
the group 𝓞_S^× of S-units is finitely generated, its torsion subgroup is the group of roots of unity of K,
and its rank is r + #S. Equivalently, with s := #S + r_1 + r_2, every fundamental system of S-units has s −
1 elements.

*Hypotheses.*

- K a number field
- S a finite set of nonzero primes of 𝓞_K

*Proof sketch.*

1. The valuation map 𝓞_S^× → ℤ^S, y ↦ (ord_𝔭 y)_{𝔭∈S} (Tau Ceti Set.unitValuation) has kernel 𝓞_K^×
(Set.unitValuation_ker with Set.unitEmptyEquivUnits), which is finitely generated of rank r by Dirichlet's
unit theorem (NumberField.Units.rank).
2. Its image contains h·ℤ^S: for 𝔭 ∈ S, 𝔭^h = (π_𝔭) is principal (principal-generators-of-class-group-powers)
and π_𝔭 is an S-unit with valuation vector h·e_𝔭. Hence the image has rank #S.
3. Ranks add in the exact sequence 1 → 𝓞_K^× → 𝓞_S^× → image → 0 (the image is free), and finite generation is
Set.unit_fg_of_units; the torsion lies in the kernel, i.e. in the roots of unity of 𝓞_K^×.

*Checks.*

- For K = ℚ and S = {(2), (3)}: 𝓞_S^× = {±2^a3^b} has rank 2 = 0 + 2.
- For K = ℚ(√2) and S = ∅: rank 1, generated with −1 by 1 + √2.
- For K = ℚ(√−5), S = {(2, 1 + √−5)}: the S-units are ±2^k (rank 1), although the prime is not principal.

*Needs.*

- `tauceti:Set.unitValuation`
- `tauceti:Set.unitValuation_ker`
- `tauceti:Set.unitEmptyEquivUnits`
- `tauceti:Set.unit_fg_of_units`
- `mathlib:NumberField.Units.rank`
- `DiophantineApproximationAndTranscendence:DT.4/principal-generators-of-class-group-powers`
- `mathlib:NumberField.Units.finrank_eq`

*Sources.*

- bugeaud-gyory-unit-equations-1996, §3, proof of Lemma 3, p. 73: Bugeaud and Győry use that 𝓞_S^×/𝓞_K^× is
free of rank t and maps isomorphically onto the principal ideals generated by S-units, a subgroup of finite
index in the group generated by the primes of S.
- berczes-evertse-gyory-superelliptic-2013, §3.3, formula (3.8) and §5, p. 22 (arXiv v1 pagination; published
pagination adds 726).: Bérczes–Evertse–Győry use fundamental systems of T_i-units with t_i − 1 elements, t_i
the number of places in T_i.

<a id="s-logarithmic-map-kernel-and-lattice"></a>
#### Kernel and image of the S-logarithmic map

`DT.4/s-logarithmic-map-kernel-and-lattice` · lemma · Lean: `isIntegral_of_forall_finitePlace_le_one`, `exists_pow_eq_one_of_normLogAbs_eq_zero`, `finite_setOf_sUnit_sLogNorm_le`

Let K be a number field, S a finite set of nonzero primes and ℓ : 𝓞_S^× → ℝ^{S ∪ S_∞}, ℓ(y) := (log|y|_v)_v
with the normalised absolute values. Then (i) (integrality) an element y ∈ K^× with |y|_𝔭 ≤ 1 for all finite
𝔭 lies in 𝓞_K; (ii) (kernel) ℓ(y) = 0 if and only if y is a root of unity; (iii) (discreteness) for every B
the set {y ∈ 𝓞_S^× : ‖ℓ(y)‖_∞ ≤ B} is finite, so ℓ(𝓞_S^×) is a lattice in the hyperplane Σ_v x_v = 0; (iv)
consequently γ_1, …, γ_t ∈ 𝓞_S^× are multiplicatively independent modulo roots of unity if and only if
ℓ(γ_1), …, ℓ(γ_t) are ℝ-linearly independent.

*Hypotheses.*

- K a number field
- S a finite set of finite places

*Proof sketch.*

1. (i): an element of nonnegative order at every prime lies in every localisation, hence in 𝓞_K (Set.integer_eq
with S = ∅ and IsDedekindDomain.integer_empty).
2. (ii): if ℓ(y) = 0 then |y|_𝔭 = 1 at all finite places, so y ∈ 𝓞_K by (i), and all conjugates have absolute
value 1, so y is a root of unity (NumberField.Embeddings.pow_eq_one_of_norm_eq_one); conversely roots of
unity have all absolute values 1.
3. (iii): ‖ℓ(y)‖_∞ ≤ B bounds the height h(y) ≤ (s/d)·B; Northcott's finiteness
(NumberField.finite_setOfPred_logHeight₁_le) gives finitely many such y. A subgroup of ℝ^s with finitely
many points in every ball is discrete, hence a lattice in its span, which lies in the hyperplane Σ_v x_v = 0
by the product formula.
4. (iv): a ℤ-relation among the ℓ(γ_j) is a multiplicative relation modulo the kernel, i.e. modulo roots of
unity; a discrete subgroup's ℚ-independence equals ℝ-independence (Real.finrank_eq_int_finrank_of_discrete).
5. Mathlib’s finite_setOfPred_logHeight₁_le uses relative logarithmic height. DT.0/abs-mul-height-eq-rpow
converts it to d times the absolute logarithmic height; the degree d is fixed here. The rank theorem then
turns a discrete lattice in its real span into a full lattice in the (s−1)-dimensional hyperplane.

*Checks.*

- For K = ℚ, S = {(2)}: ℓ(2^k·(−1)^e) = (k log 2, −k log 2), whose kernel is {±1}.
- For K = ℚ(i), S = ∅: the kernel of ℓ on 𝓞_K^× = {±1, ±i} is the whole group.
- This supplies the kernel and integrality steps used by
DT.4/exponent-height-bound-for-finitely-generated-groups.

*Needs.*

- `mathlib:Set.integer_eq`
- `mathlib:IsDedekindDomain.integer_empty`
- `mathlib:NumberField.Embeddings.pow_eq_one_of_norm_eq_one`
- `mathlib:NumberField.finite_setOfPred_logHeight₁_le`
- `mathlib:Real.finrank_eq_int_finrank_of_discrete`
- `mathlib:NumberField.prod_abs_eq_one`
- `tauceti:Set.unit_fg_of_units`
- `DiophantineApproximationAndTranscendence:DT.4/s-unit-rank`
- `DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow`

*Sources.*

- bugeaud-gyory-unit-equations-1996, §3, proof of Lemma 1, formulas (11)–(12), pp. 71–72: Bugeaud and Győry
use that the logarithmic vectors of S-units form a lattice whose determinant is the S-regulator, and the
identity h(η) = (1/(2d))·Σ_v |log|η|_v| for S-units.
- evertse-dio-notes-ch5, Chapter 5, Lemma 5.9 and its proof, printed pp. 91–92: Evertse's treatment of the
unit lattice and the bound of unit exponents by the logarithmic house, for S = ∅.

<a id="s-regulator"></a>
#### The S-regulator of a number field

`DT.4/s-regulator` · definition · Lean: `sRegulatorOf`, `IsFundamentalSUnitSystem`, `IsSRegulator`

Let K be a number field of degree d, S a finite set of nonzero primes 𝔭_1, …, 𝔭_t of 𝓞_K, and s := t +
#(infinite places). Let ε_1, …, ε_{s−1} be a fundamental system of S-units (a basis of 𝓞_S^× modulo torsion)
and v_1, …, v_{s−1} any s − 1 of the s places in S ∪ S_∞. The S-regulator is R_S :=
|det(log|ε_i|_{v_j})_{i,j ≤ s−1}|, with the normalised absolute values of s-norm. It is independent of both
choices; R_∅ = R_K (Mathlib's regulator), and R_S = h_S·R_K·∏_{i=1}^{t} log N𝔭_i, where h_S is the order of
the subgroup of the class group generated by the classes of 𝔭_1, …, 𝔭_t. Consequently R_S ≤ h_K·R_K·(log
P_S)^t with P_S := max_i N𝔭_i, and, using R_K ≥ 0.2, R_S ≥ R_K·∏_i log N𝔭_i ≥ 0.2·(log 2)^t.

*Hypotheses.*

- K a number field
- S a finite set of nonzero primes of 𝓞_K
- a fundamental system of S-units (Tau Ceti Set.unit_fg_of_units gives finite generation)

*Uses.*

- Bérczes–Evertse–Győry, Proposition 3.11 and (4.24)–(4.28): the explicit Thue bound over the S-integers is
linear in P_S·R_S
- Bérczes–Evertse–Győry, (5.1)–(5.6): the heights of a fundamental system of T-units are bounded by the
T-regulator
- fundamental-s-units-of-bounded-height: the product of the logarithmic heights of a good fundamental system
is at most c·R_S

*API.*

- `sRegulatorOf` (constructor): R_S as the absolute value of the determinant of log|ε_i|_{v_j} for a family ε
and s − 1 places v.
- `IsFundamentalSUnitSystem` (data): ε is a fundamental system of S-units: S-units such that every S-unit is a
root of unity times a unique product of their powers.
- `sRegulatorOf_eq_of_isFundamental` (extensionality): R_S does not depend on the fundamental system or on the
omitted place.
- `sRegulatorOf_eq` (characterisation): R_S = h_S·R_K·∏_{𝔭∈S} log N𝔭 with h_S ∣ h_K the order of the subgroup
generated by the classes of the primes of S.
- `sRegulatorOf_le` (other): R_S ≤ h_K·R_K·∏_{𝔭∈S} log N𝔭 ≤ h_K·R_K·(log P_S)^{#S}, P_S := max_{𝔭∈S} N𝔭.
- `sRegulatorOf_ge` (other): R_S ≥ R_K·∏_{𝔭∈S} log N𝔭.
- `sRegulatorOf_fundSystem` (compatibility): For S = ∅: R_∅ = NumberField.Units.regulator K.
- `isFundamentalSUnitSystem_rank` (relation): Any fundamental system has Units.rank K + #S entries.
- `isFundamentalSUnitSystem_reindex` (functoriality): Reindexing a fundamental system by an equivalence
preserves the property.

*Unit tests.*

- `sRegulatorOf_rat_prime` (computation): For K = ℚ, S = {(p)}, the system (p) and the place (p): R_S =
Real.log p.
- `sRegulatorOf_fundSystem` (compatibility): For S = ∅, Mathlib's fundamental system
NumberField.Units.fundSystem and all infinite places but one: R_S = NumberField.Units.regulator K.
- `sRegulatorOf_sq` (non-example): Replacing a system (ε_i) by (ε_i²) multiplies the determinant by 2^k; a
definition that does not require a fundamental system would not be well defined.
- `isFundamentalSUnitSystem_rat_prime` (characterisation): For K = ℚ and S = {(p)}, the single S-unit p is a
fundamental system of S-units.
- `sRegulatorOf_pos` (characterisation): 0 < R_S for every fundamental system and admissible choice of places.
- `sRegulator_rank_zero` (degenerate): For K = ℚ or an imaginary quadratic field and S = ∅, the
zero-dimensional determinant is 1, agreeing with R_K = 1.
- `isFundamentalSUnitSystem_rat_empty` (degenerate): The empty system is fundamental for K = ℚ, S = ∅: every
unit is ±1, hence torsion.
- `isFundamentalSUnitSystem_rat_prime_square` (non-example): For K = ℚ and S = {(p)}, the single S-unit p² is
not a fundamental system: p cannot be a torsion multiple of any integer power of p².

*Proof sketch.*

1. Independence of the omitted place: the rows sum to zero by the product formula, so deleting any column
changes the determinant only by sign.
2. Independence of the fundamental system: two systems differ by an element of GL_{s−1}(ℤ) modulo torsion, and
log|·|_v kills torsion.
3. Formula (Bugeaud–Győry Lemma 3, (18)): 𝓞_S^×/𝓞_K^× is free of rank t and maps isomorphically onto the
principal ideals generated by S-units, a subgroup of index i_S = h_S of the free group on 𝔭_1, …, 𝔭_t;
choose a triangular basis (ε_i) = 𝔭_i^{a_ii}⋯𝔭_t^{a_it} with a_11⋯a_tt = i_S and complete it by a
fundamental system of units; the determinant is block triangular.
4. The bounds follow from 1 ≤ h_S ≤ h_K, log N𝔭_i ≤ log P_S and, for the lower bound, from
class-number-and-regulator-bounds (R_K ≥ 0.2) and N𝔭_i ≥ 2.

*Checks.*

- For K = ℚ and S = {(p)}: R_S = log p.
- For S = ∅: R_S = R_K.
- For K = ℚ(√−5) and S = {𝔭}, 𝔭 = (2, 1 + √−5), 𝔭² = (2): h_S = 2 and R_S = 2·log 2.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/s-norm`
- `mathlib:NumberField.Units.regulator`
- `mathlib:NumberField.Units.fundSystem`
- `mathlib:NumberField.classNumber`
- `tauceti:Set.unit_fg_of_units`
- `mathlib:Set.unitEquivUnitsInteger`
- `mathlib:NumberField.prod_abs_eq_one`
- `DiophantineApproximationAndTranscendence:DT.4/s-unit-rank`
- `DiophantineApproximationAndTranscendence:DT.4/class-number-and-regulator-bounds`

*Sources.*

- bugeaud-gyory-unit-equations-1996, §3, definition of R_S and Lemma 3 with its proof, formula (18), pp.
70–74: Bugeaud and Győry define the S-regulator as the absolute value of a determinant of logarithms of a
fundamental system of S-units, note its independence of the choices, and prove R_S = R_K·i_S·∏ log N(𝔭_i)
with i_S ≤ h_K.
- berczes-evertse-gyory-superelliptic-2013, §3.3, formulas (3.8)–(3.9), p. 9 (arXiv v1 pagination; published
pagination adds 726).: Bérczes–Evertse–Győry record R_S = h_S R_K ∏ log N𝔭_i and the resulting upper and
lower bounds.

<a id="fundamental-s-units-of-bounded-height"></a>
#### A fundamental system of S-units of controlled height (Bugeaud–Győry Lemma 1)

`DT.4/fundamental-s-units-of-bounded-height` · theorem · Lean: `exists_isFundamentalSUnitSystem_absLogHeight_le`

Let K be a number field of degree d, S a finite set of nonzero primes of 𝓞_K, s := #S + #(infinite places) ≥
2, and δ_K > 0 with h(η) ≥ δ_K/d for every η ∈ K^× that is not a root of unity (one may take δ_K = d·m(d)
from voutier-height-lower-bound). There is a fundamental system ε_1, …, ε_{s−1} of S-units with (i) ∏_i
h(ε_i) ≤ c_4·R_S, (ii) h(ε_i) ≤ c_5·R_S for each i, and (iii) every entry of the inverse of the matrix
(log|ε_i|_{v_j})_{i,j ≤ s−1} has absolute value at most c_6, where c_4 := ((s − 1)!)²/(2^{s−2}d^{s−1}), c_5
:= c_4(δ_K/d)^{2−s} and c_6 := c_4 d^{s−1}δ_K^{−1}. (Here h is the absolute logarithmic height;
Bugeaud–Győry write log h with h multiplicative.)

*Hypotheses.*

- K a number field of degree d
- S finite set of finite places, s ≥ 2
- δ_K a lower bound as stated

*Proof sketch.*

1. Delete one coordinate from the S-logarithmic hyperplane and use the ℓ¹ gauge F in r = s−1 coordinates. The
lattice covolume is R_S and the gauge ball has volume 2^r/r!. The successive-minimum witnesses and Minkowski
upper bound give independent vectors v_i with ∏F(v_i) ≤ r! R_S.
2. To obtain the sharp basis factor, use the primitive flag Λ ∩ span(v₁,…,v_i) from
GN.0/integral-rational-flag. In its rank-one quotient, write the image of v_i as m times a primitive
generator. If |m| = 1, use ±v_i as the lift. If |m| ≥ 2, lift that generator as v_i/m plus a combination of
the earlier v_j; subtract integer multiples of those v_j so each earlier coefficient has absolute value at
most 1/2. This is still a primitive generator modulo the flag and has F-size at most iλ_i/2. These lifts
form a lattice basis and satisfy F(ε_i) ≤ max(1,i/2)λ_i. This is a consumer proof of the sharp factor,
rather than an assertion that the supplier’s weaker (i+1) factor preserves c₄.
3. For S-units the product formula gives F/(2d) ≤ h ≤ F/d. Multiplying the basis factors r!/2^{r−1} with the
minima bound gives ∏h(ε_i) ≤ r!² R_S/(2^{r−1}d^r) = c₄R_S. Dividing by the height lower bounds for the other
r−1 units gives (ii).
4. For (iii), expand each determinant minor. Its absolute value is bounded by the product of the ℓ¹ sizes of
its rows; this follows directly by dropping the distinct-column restriction in the permutation sum. Divide
by R_S, bound the product of all row sizes by d^r c₄R_S, and use F(ε_i) ≥ d h(ε_i) ≥ δ_K for the removed
row. This gives c₆ and requires no unsupported Hadamard citation.

*Checks.*

- For K = ℚ, S = {(p)} (s = 2): the system {p} has h(p) = log p = R_S, consistent with (i) since c_4 =
1/(d^{1}) = 1.
- Without the lower bound δ_K, (ii) fails to follow from (i): the individual heights are controlled only
through the others being ≥ δ_K/d.
- For S = ∅ it gives a fundamental system of units with ∏ h(ε_i) ≤ c_4 R_K.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/s-regulator`
- `DiophantineApproximationAndTranscendence:DT.4/s-logarithmic-map-kernel-and-lattice`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/basis-from-minima`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum`
- `DiophantineApproximationAndTranscendence:DT.4/voutier-height-lower-bound`
- `mathlib:NumberField.prod_abs_eq_one`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.0/integral-rational-flag`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses`

*Sources.*

- bugeaud-gyory-unit-equations-1996, §3, Lemma 1 and its proof, formulas (9)–(13), pp. 71–72: Bugeaud and
Győry construct a fundamental system of S-units from the successive minima of the S-unit lattice for the ℓ¹
norm and bound the product and the individual heights by the S-regulator, and the inverse matrix entries.
- berczes-evertse-gyory-superelliptic-2013, §5, formula (5.1), pp. 22–23 (arXiv v1 pagination; published
pagination adds 726).: Bérczes–Evertse–Győry use such a fundamental system of T_i-units, citing Lemma 2 of
Győry–Yu and the Bugeaud–Győry papers.
- gyory-yu-2006, Proposition 1 and Lemma 2, p. 19: The refined independent-height estimates supply the stated
numerical constants.

<a id="multiplicatively-independent-height-product-lower-bound"></a>
#### Loher–Masser lower bound for a product of independent heights

`DT.4/multiplicatively-independent-height-product-lower-bound` · theorem · Lean: `independent_height_product_lower`

Let K have degree d and ω_K roots of unity. For n ≥ 1 and multiplicatively independent α₁,…,α_n ∈ Kˣ,
58(n!e^n/n^n)d^{n+1}log d · ∏h(α_i) ≥ ω_K if d ≥ 2. For d = 1 replace 58d^{n+1}log d by 17. Independence
means that ∏α_i^{e_i} = 1 implies every integer e_i = 0.

*Hypotheses.*

- K a number field
- n ≥ 1; the α_i are multiplicatively independent nonzero elements

*Proof sketch.*

1. Use Loher–Masser’s saturation lattice M of rational exponent vectors whose products are roots of unity times
elements of K. Its covolume is 1/[M:ℤ^n]. Blichfeldt’s theorem applied to Σh(α_i)|x_i| < log H, whose volume
is 2^n(log H)^n/(n!∏h(α_i)), produces enough distinct products in a shifted bounded-height set. Independence
makes them distinct modulo the ω_K roots of unity.
2. Apply their shifted-height counting estimate (4.6), retaining both terms (d log d)(B′H^d+4CH^{2d}). Choose H
= exp(n/(2d)); Lemma 5(e) gives B′/√e+4C < 58. The real-embedding estimate is stronger, and the rational
case has counting bound 17H². Thus Theorem 3 yields ω_K[M:ℤ^n] ≤ 58(n!e^n/n^n)d^{n+1}log d∏h(α_i), or the
stated rational variant. Drop the index, which is at least one, to obtain Győry–Yu Proposition 1. The
shifted counting estimate, its numerical bound and the Blichfeldt/saturation argument remain a recorded gap;
ordinary Northcott finiteness does not provide them.

*Checks.*

- For n = 1 and K = ℚ, 17e·log 2 ≥ 2 is consistent with α = 2 and ω_ℚ = 2.
- A root of unity cannot occur in an independent family, so the left-hand side is positive.
- The d = 1 exception is necessary: retaining log d would give a zero left-hand side.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.0/northcott-absolute-height`

*Sources.*

- loher-masser-2004, Theorem 3, p. 280; §5, proof, pp. 293–294; Theorem 1 for the counting constant:
Quantitative height counting supplies a lower bound for a product of heights of multiplicatively independent
elements.
- gyory-yu-2006, Proposition 1 and inequality (18), p. 19: The explicit constants 58 and 17 in the form used
for independent unit systems.

<a id="small-representative-modulo-s-unit-powers"></a>
#### A representative of small height modulo m-th powers of S-units

`DT.4/small-representative-modulo-s-unit-powers` · lemma · Lean: `exists_sUnit_absLogHeight_mul_pow_le`, `exists_sUnit_absLogHeight_mul_pow_explicit_le`, `exists_sUnit_absLogHeight_mul_pow_explicit_le`

Let K be a number field of degree d, S a finite set of nonzero primes, η_1, …, η_{s−1} a fundamental system
of S-units and ℓ(η) := (log|η|_v)_{v ∈ S ∪ S_∞} ∈ ℝ^s. Put c(η) := (1/2)·Σ_j ‖ℓ(η_j)‖_1. For every nonzero
S-integer α and every integer m ≥ 1 there is an S-unit ε with h(αε^m) ≤ (1/d)·log N_S(α) + m·c(η)/d. In
addition, there is an S-unit ε with h(αε^m) ≤ d⁻¹log N_S(α) + m(39d^{d+2}R_K + (h_K/d)log Q_S), where Q_S =
∏_{𝔭∈S}N𝔭. This exact second form uses independent ordinary units and the Loher–Masser height-product bound,
rather than the coarse full-S-unit basis estimate.

*Hypotheses.*

- K a number field, S finite set of finite places
- α ∈ 𝓞_S nonzero, m ≥ 1
- η a fundamental system of S-units

*Proof sketch.*

1. The vector u := ℓ(α) − (log N_S(α)/s)·(1, …, 1) lies in the hyperplane Σ_v x_v = 0, because the coordinates
of ℓ(α) sum to log N_S(α) (s-norm); the S-unit lattice ℓ(𝓞_S^×) spans this hyperplane (s-unit-rank and
s-logarithmic-map-kernel-and-lattice).
2. Write u = Σ_j x_j ℓ(η_j) and x_j = m·b_j + ϱ_j with b_j ∈ ℤ, |ϱ_j| ≤ m/2; with ε := ∏ η_j^{−b_j} one gets
ℓ(αε^m) − (log N_S(α)/s)·(1, …, 1) = Σ_j ϱ_j ℓ(η_j), of ℓ¹-norm at most (m/2)·Σ_j‖ℓ(η_j)‖_1 (as in the proof
of Bugeaud–Győry Lemma 2 for S = S_∞ and of DT.4/unit-lattice-covering-bound).
3. Since αε^m is an S-integer, h(αε^m) = (1/d)·Σ_{v∈S∪S_∞} max(0, log|αε^m|_v) ≤ (1/d)(log N_S(α) + m·c(η))
after summing the s coordinates.
4. For the exact BEG constant, first balance an algebraic integer using independent ordinary units from the
successive minima. Their product of heights is at most r!R_K/d^r. Applying the independent-height-product
lower bound to each omitted (r−1)-tuple bounds the largest height by 29e√(r−1)r!log d·R_K for r ≥ 2. The
rounding estimate then has constant c₃ = 29e r! r√(r−1)log d; for r = 1 take c₃ = 1/d, and for r = 0 take c₃
= 0. Since r ≤ d−1, c₃ ≤ 39d^{d+2}.
5. For a general S-integer choose a generator π_𝔭 of 𝔭^{h_K} at each finite prime of S. Multiply α by m-th
powers of these S-units to put its orders at those primes in [0,mh_K), leaving an algebraic integer α′ with
log |N(α′)| ≤ log N_S(α) + mh_K log Q_S. Apply the ordinary-unit bound to α′. This proves the stated exact
constant subject to the recorded quantitative height-product gap.

*Checks.*

- For S = ∅ and m = 1 this is the balanced-unit-multiple bound of DT.4/balanced-unit-multiple, read as a
height bound.
- For K = ℚ, S = {(p)}, α = p^k·u (p ∤ u): one may take ε = p^{−⌊k/m⌉}, leaving h(αε^m) ≤ log|u| + (m/2)·log
p.
- The m-dependence is linear, which is what Lemma 4.2(ii) needs.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/s-norm`
- `DiophantineApproximationAndTranscendence:DT.4/s-logarithmic-map-kernel-and-lattice`
- `DiophantineApproximationAndTranscendence:DT.4/s-unit-rank`
- `DiophantineApproximationAndTranscendence:DT.4/unit-lattice-covering-bound`
- `DiophantineApproximationAndTranscendence:DT.4/fundamental-s-units-of-bounded-height`
- `DiophantineApproximationAndTranscendence:DT.4/s-regulator`
- `mathlib:NumberField.prod_abs_eq_one`
- `DiophantineApproximationAndTranscendence:DT.4/multiplicatively-independent-height-product-lower-bound`
- `DiophantineApproximationAndTranscendence:DT.4/principal-generators-of-class-group-powers`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`

*Sources.*

- bugeaud-gyory-unit-equations-1996, §3, Lemma 2 and its proof, formulas (14)–(15), pp. 72–73: Bugeaud and
Győry prove that every nonzero S-integer has an associate modulo n-th powers of S-units whose height is
bounded by its S-norm and n times the regulator, by solving a linear system in the logarithms and rounding.
- berczes-evertse-gyory-superelliptic-2013, §3.4, Lemma 3.8, p. 11 (arXiv v1 pagination; published pagination
adds 726).: Bérczes–Evertse–Győry quote this lemma from Győry–Yu (2006), Lemma 3, in the form used for
(4.12) and (5.10).
- gyory-yu-2006, Lemmas 2–3 and their proofs, pp. 19–21: The refined independent-height estimates supply the
stated numerical constants.

<a id="principal-generators-of-class-group-powers"></a>
#### Principal generators for powers of ideals and the finite set of class representatives

`DT.4/principal-generators-of-class-group-powers` · lemma · Lean: `isPrincipal_pow_classNumber`, `exists_finset_divisor_representatives`

Let K be a number field with class number h and P a finite set of nonzero primes of 𝓞_K. (i) For every
nonzero ideal 𝔞 of 𝓞_K, 𝔞^h is principal. (ii) Choose π_𝔭 ∈ 𝓞_K with (π_𝔭) = 𝔭^h for 𝔭 ∈ P and let Γ_P ⊆ K^×
be the subgroup generated by 𝓞_K^× and the π_𝔭; it is finitely generated of rank rank(𝓞_K^×) + #P and has
finite index h' ∣ h^{#P} in the P-units. (iii) For each nonzero ideal 𝔫 of 𝓞_K, the set R(𝔫) of principal
ideals of the form 𝔞·∏_{𝔭∈P}𝔭^{r_𝔭} with 𝔞 ∣ 𝔫 supported outside P and 0 ≤ r_𝔭 < h is finite, and choosing
one generator of each gives a finite set M_P(𝔫) such that every β ∈ 𝓞_K ∖ {0} with ord_𝔮(β) ≤ ord_𝔮(𝔫) for
all 𝔮 ∉ P lies in μ·Γ_P for some μ ∈ M_P(𝔫).

*Hypotheses.*

- K a number field with class number h
- P a finite set of nonzero primes
- 𝔫 a nonzero ideal

*Proof sketch.*

1. (i): the class group is a finite group of order h (NumberField.classNumber, finiteness), so [𝔞]^h = 1
(pow_card_eq_one'), i.e. 𝔞^h is principal (ClassGroup.mk0_eq_one_iff).
2. (ii): Γ_P is generated by finitely many elements; an element of the P-units has (β) = ∏_{𝔭∈P}𝔭^{a_𝔭}, and
β·∏π_𝔭^{−q_𝔭} with a_𝔭 = h q_𝔭 + r_𝔭 generates ∏𝔭^{r_𝔭}, a principal ideal from a finite list.
3. (iii): write (β) = 𝔞·∏_{𝔭∈P}𝔭^{a_𝔭} with 𝔞 ∣ 𝔫 supported outside P; reduce the exponents a_𝔭 modulo h using
the π_𝔭; the remaining principal ideal belongs to R(𝔫), which is finite because 𝔫 has finitely many divisors
(UniqueFactorizationMonoid.fintypeSubtypeDvd); two generators of one principal ideal differ by a unit.

*Checks.*

- For K with h = 1 every π_𝔭 generates 𝔭 itself and R(𝔫) is the set of principal divisors of 𝔫 times
P-monomials with exponent 0.
- For K = ℚ(√−5), 𝔭 = (2, 1 + √−5): 𝔭² = (2), so π_𝔭 = 2 and h = 2.
- This supplies the class-group and principal-generator step of DT.4/s-integral-divisor-representation.

*Needs.*

- `mathlib:NumberField.classNumber`
- `mathlib:ClassGroup.mk0_eq_one_iff`
- `mathlib:pow_card_eq_one'`
- `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`
- `mathlib:UniqueFactorizationMonoid.fintypeSubtypeDvd`
- `tauceti:Set.unit_fg_of_units`

*Sources.*

- tzanakis-deweger-thue-mahler-1992, Sections 5–6, pp. 230–233: Tzanakis and de Weger remove the prime ideals
above the primes of the Thue–Mahler equation by taking h-th powers of the ideals and generators of the
resulting principal ideals.
- bugeaud-gyory-unit-equations-1996, §3, proof of Lemma 3, p. 73: The principal ideals generated by S-units
form a subgroup of index at most h_K of the free group on the primes of S.

<a id="minkowski-cofactor-for-ideals"></a>
#### Every ideal class contains an ideal of small norm times a principal ideal

`DT.4/minkowski-cofactor-for-ideals` · lemma · Lean: `exists_mem_spanSingleton_eq_mul`

Let L be a number field, T a finite set of nonzero primes of 𝓞_L, and 𝔄 a nonzero fractional ideal of the
T-integers 𝓞_T. There is ξ ∈ 𝔄 ∖ {0} such that (ξ) = 𝔅·𝔄 with 𝔅 an integral ideal of 𝓞_T of T-norm N_T(𝔅) ≤
|D_L|^{1/2}. In particular the classes of integral ideals of T-norm at most |D_L|^{1/2} generate the class
group of 𝓞_T, and an element ξ can be found effectively.

*Hypotheses.*

- L a number field, T finite
- 𝔄 a nonzero fractional ideal of 𝓞_T

*Proof sketch.*

1. Write 𝔄 = 𝔄*·𝓞_T with 𝔄* a fractional ideal of 𝓞_L supported outside T; scaling by a nonzero integer reduces
to 𝔄* integral.
2. Minkowski's theorem in the form of Mathlib's exists_ne_zero_mem_ideal_of_norm_le_mul_sqrt_discr gives ξ ∈ 𝔄*
∖ {0} with |N_{L/ℚ}(ξ)| ≤ |D_L|^{1/2}·N(𝔄*) (the factor (4/π)^{r_2}d!/d^d ≤ 1 can be dropped).
3. Then (ξ) = 𝔅*·𝔄* with 𝔅* integral of norm ≤ |D_L|^{1/2}; passing to 𝓞_T can only decrease the norm, since
the T-norm forgets the primes of T (s-norm).

*Checks.*

- For L with class number 1 one may take 𝔅 = 𝓞_T and ξ a generator.
- For L = ℚ(√−5), 𝔄 = (2, 1 + √−5): N(𝔄) = 2 and ξ = 2 gives (2) = 𝔄², so 𝔅 = 𝔄 with N(𝔅) = 2 ≤ √20.
- The bound |D_L|^{1/2} is uniform in 𝔄.

*Needs.*

- `mathlib:NumberField.exists_ne_zero_mem_ideal_of_norm_le_mul_sqrt_discr`
- `DiophantineApproximationAndTranscendence:DT.4/s-norm`
- `mathlib:Ideal.absNorm_span_singleton`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §4, proof of Lemma 4.2(ii), choice of ξ₁ and γ₁, pp. 17–18 (arXiv
v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry pick ξ₁ in the ideal with norm at most
|D_L|^{1/2} times the norm of the ideal (citing Lang), so that (ξ₁) is the ideal times an ideal of small
norm, and likewise for the factor 𝔆.

<a id="class-number-and-regulator-bounds"></a>
#### Upper and lower bounds for the class number and regulator (BEG Lemma 3.5)

`DT.4/class-number-and-regulator-bounds` · theorem · Lean: `regulator_ge`, `classNumber_mul_regulator_le`

For every number field K of degree d and discriminant D_K: (i) R_K ≥ 0.2 (Friedman); (ii) h_K·R_K ≤
|D_K|^{1/2}·(log*|D_K|)^{d−1} (Louboutin, via the class number formula), where log* x := max(1, log x). An
elementary but weaker substitute for the class number alone is Tau Ceti's h_K ≤ |D_K|·4^d.

*Hypotheses.*

- K a number field of degree d

*Proof sketch.*

1. (i) is Friedman's analytic lower bound for regulators (Invent. Math. 98 (1989)); the sharper value 0.2052 is
used by Bugeaud–Győry.
2. (ii): the analytic class number formula expresses h_K R_K as the residue κ_K of the Dedekind zeta function
times w_K|D_K|^{1/2}/(2^{r_1}(2π)^{r_2}) (Mathlib's dedekindZeta_residue); Louboutin bounds κ_K by (e
log|D_K|/(2(d − 1)))^{d−1}, and the stated inequality follows.
3. Neither analytic proof is decomposed here (gap 'Analytic class number and regulator bounds'); the residue
bound's natural owner AnalyticNumberTheory:AN.4 lies in a higher upstream tier, so it cannot be cited from
this layer.

*Checks.*

- For K = ℚ: R = 1 ≥ 0.2 and h·R = 1 ≤ 1.
- For K = ℚ(√2): h = 1, R = log(1 + √2) ≈ 0.881, and |D|^{1/2}·log*|D| = √8·log 8 ≈ 5.88.
- The bound (ii) is used only through max(h_L, R_L) ≤ 5|D_L|^{1/2}(log*|D_L|)^{d_L−1}, BEG (4.15).

*Needs.*

- `mathlib:NumberField.dedekindZeta_residue`
- `mathlib:NumberField.Units.regulator`
- `mathlib:NumberField.classNumber`
- `tauceti:NumberField.classNumber_le_bound`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.3, Lemma 3.5, p. 9 (arXiv v1 pagination; published pagination
adds 726).: Bérczes–Evertse–Győry quote Friedman's lower bound for the regulator and Louboutin's upper bound
for the product of class number and regulator.
- bugeaud-gyory-unit-equations-1996, §3, proof of Lemma 3, p. 74: Bugeaud and Győry use Friedman's estimate
R_K ≥ 0.2052.

### 4.7 Heights and discriminants of polynomials and of the auxiliary fields

BEG §3.1, §3.4 and Lemmas 4.1, 4.3: Gauss's lemma for content ideals, the height of a polynomial, the size of
its discriminant, the relative discriminant estimates (containment of the polynomial discriminant, exponent
bound, compositum, Kummer extensions) and the resulting bounds for the discriminants of the fields generated
by roots and radicals. The relative discriminant ideal, its tower formula and the wild bound for the different
are Tau Ceti's (`TauCeti.relDiscr`, `TauCeti.relDiscr_tower`, NumberFieldArithmetic Layers 4–6); this section
only applies them.

<a id="content-ideal-gauss-lemma"></a>
#### Gauss's lemma for content ideals over a Dedekind domain

`DT.4/content-ideal-gauss-lemma` · lemma · Lean: `contentIdeal_mul_eq`

Let A be a Dedekind domain with fraction field F and, for f ∈ F[X] nonzero, let [f] be the fractional ideal
of A generated by the coefficients of f. Then [fg] = [f]·[g] for all nonzero f, g ∈ F[X]. In particular,
over a number field K containing all zeros α_1, …, α_n of f = a_0(X − α_1)⋯(X − α_n), [f] = [a_0]·∏_i [1,
α_i]; and for every nonarchimedean place v the Gauss norm |f|_v := max_i |a_i|_v is multiplicative.

*Hypotheses.*

- A a Dedekind domain, F = Frac A
- f, g ∈ F[X] nonzero

*Proof sketch.*

1. Mathlib proves [fg] ⊆ [f][g] (Polynomial.contentIdeal_mul_le_mul_contentIdeal, stated for the integral
content ideal; clear denominators by a common nonzero a ∈ A).
2. For the reverse inclusion localise at a nonzero prime 𝔭: A_𝔭 is a discrete valuation ring, where content
ideals are generated by a coefficient of minimal valuation and Gauss's lemma (the product of primitive
polynomials over a UFD is primitive, Polynomial.IsPrimitive.mul) gives equality of valuations. Equality of
fractional ideals of a Dedekind domain can be checked locally at every prime.
3. The number-field statements follow from f = a_0∏(X − α_i) and [X − α_i] = [1, α_i]; the Gauss norm at v is
N𝔭^{−ord_𝔭[f]}.

*Checks.*

- For A = ℤ, f = 2X + 4 and g = 3X + 9: [fg] = (6) = (2)(3).
- For A = ℤ[√−5], f = 2X + (1 + √−5), g = 2X + (1 − √−5): fg = 4X² + 4X + 6, [f] = [g] = 𝔭 := (2, 1 + √−5) and
[fg] = (2) = 𝔭², although neither content ideal is principal.
- The inclusion [fg] ⊆ [f][g] alone (Mathlib's direction) does not give equality: the reverse inclusion is the
Dedekind-specific part.

*Needs.*

- `mathlib:Polynomial.contentIdeal`
- `mathlib:Polynomial.contentIdeal_mul_le_mul_contentIdeal`
- `mathlib:Polynomial.IsPrimitive.mul`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.1, proof of Lemma 3.1, and §4, proof of Lemma 4.2, pp. 5–6 and
16–17 (arXiv v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry use Gauss's lemma [f] =
[g_1][g_2] for a factorisation of a polynomial over a number field and [f] = [a_0]∏[1, α_i] for its linear
factors.

<a id="coefficient-height-of-polynomial"></a>
#### The logarithmic height of a polynomial and of a superelliptic equation

`DT.4/coefficient-height-of-polynomial` · definition · Lean: `polyLogHeight`, `superellipticHeight`

For a number field K and f = a_0X^n + ⋯ + a_n ∈ K[X], h(f) := (1/[K:ℚ])·Σ_{v ∈ M_K} log max(1, |a_0|_v, …,
|a_n|_v), with the normalised absolute values of s-norm; equivalently h(f) is the absolute logarithmic
height of the projective point (1 : a_0 : ⋯ : a_n), i.e. Mathlib's Height.logHeight of that tuple divided by
[K:ℚ]. For b ∈ K, ĥ(b, f) := (1/[K:ℚ])·Σ_v log max(1, |b|_v, |a_0|_v, …, |a_n|_v). Both are independent of
the number field containing the coefficients. For b ∈ ℤ and f ∈ ℤ[X]: ĥ(b, f) = log max(1, |b|, |a_0|, …,
|a_n|), the convention of DT.4/baker-superelliptic-theorem.

*Hypotheses.*

- K a number field
- f ∈ K[X], b ∈ K

*Uses.*

- Bérczes–Evertse–Győry, Theorems 2.1–2.3: the bounds are exponential in [K:ℚ]·ĥ
- polynomial-height-versus-roots: comparison with the sum of the heights of the roots
- discriminant-size-bound: the height of the discriminant is bounded linearly in h(f)
- DT.4/baker-superelliptic-theorem: its constant ĥ is the integral case

*API.*

- `polyLogHeight` (constructor): h(f) as Height.logHeight of (1, coefficients of f) divided by [K:ℚ].
- `superellipticHeight` (constructor): ĥ(b, f) as the same with b adjoined.
- `polyLogHeight_nonneg` (other): 0 ≤ h(f).
- `polyLogHeight_map` (functoriality): h(f) is unchanged by extending scalars to a finite extension of K.
- `polyLogHeight_int` (compatibility): For f ∈ ℤ[X]: h(f) = log max(1, max_i|a_i|).
- `logHeight_coeff_le` (relation): h(a_i) ≤ h(f) for every coefficient.
- `polyLogHeight_le_superellipticHeight` (relation): h(f) ≤ ĥ(b, f) and h(b) ≤ ĥ(b, f).
- `polyLogHeight_X_sub_C` (simp): h(X − α) = h(α).
- `superellipticHeight_nonneg` (relation): 0 ≤ ĥ(b,f).
- `superellipticHeight_map` (functoriality): ĥ(b,f) is unchanged by a number-field embedding applied to b and
f.
- `superellipticHeight_zero` (compatibility): ĥ(0,f) = h(f).

*Unit tests.*

- `polyLogHeight_X_sq_sub_two` (computation): Over ℚ: h(X² − 2) = Real.log 2.
- `polyLogHeight_X_sub_half` (computation): Over ℚ: h(X − 1/2) = Real.log 2.
- `polyLogHeight_X_pow` (degenerate): h(X^n) = 0 for every n.
- `polyLogHeight_two_mul_X` (non-example): h(2X) = log 2 over ℚ: the coordinate 1 belongs to the point, so the
height is not the projective height of the coefficient vector alone (which would be 0).
- `polyLogHeight_int_example` (compatibility): For f ∈ ℤ[X] mapped to ℚ: h(f) = log max(1, max_i |a_i|) (an
instance of polyLogHeight_int).
- `superellipticHeight_two_X` (computation): Over ℚ, ĥ(2,X) = log 2.
- `superellipticHeight_half_X` (non-example): Over ℚ, ĥ(1/2,X) = log 2; the finite place cannot be omitted.
- `superellipticHeight_zero_X_pow` (degenerate): Over ℚ, ĥ(0,X^n) = 0.

*Proof sketch.*

1. Definition; independence of K is the extension invariance of the absolute height (sum over the places above
v of the local degrees equals [L:K]).

*Checks.*

- h(X² − 2) = log 2 over ℚ.
- h(X − 1/2) = log 2 (the 2-adic place contributes).
- h(X^n) = 0.

*Needs.*

- `mathlib:Height.logHeight`
- `mathlib:Height.logHeight_nonneg`
- `mathlib:NumberField.absLogHeight₁`
- `DiophantineApproximationAndTranscendence:DT.4/s-norm`
- `DiophantineApproximationAndTranscendence:DT.0/abs-mul-height-eq-rpow`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §2, definition of ĥ, p. 4, and §3.4, definition of h(f), p. 10
(arXiv v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry define the logarithmic height
of a polynomial as the height of the point formed by 1 and its coefficients, and ĥ by including the
coefficient b of the equation.

<a id="polynomial-height-versus-roots"></a>
#### The height of a polynomial against the heights of its roots (BEG Lemma 3.6)

`DT.4/polynomial-height-versus-roots` · lemma · Lean: `abs_polyLogHeight_prod_sub_sum_le`, `sum_absLogHeight_roots_le`, `absLogHeight_eval_le`, `sum_absLogHeight_roots_le`, `absLogHeight_eval_le`

For algebraic numbers α_1, …, α_n and f := (X − α_1)⋯(X − α_n): |h(f) − Σ_i h(α_i)| ≤ n·log 2. More
generally, for a nonmonic polynomial f = a₀∏(X−α_i), a₀ ≠ 0, one has Σh(α_i) ≤ h(f) + n log 2. For
evaluation, h(f(x)) ≤ h(f) + n h(x) + log(n+1).

*Hypotheses.*

- α_1, …, α_n ∈ ℚ̄

*Proof sketch.*

1. Work in a number field containing the α_i. At a finite place the Gauss norm is multiplicative
(content-ideal-gauss-lemma), so log max(1, |coefficients of f|_v) = Σ_i log max(1, |α_i|_v) exactly.
2. At an infinite place, with σ the corresponding embedding, the Mahler measure satisfies M(σf) = ∏_i max(1,
|σα_i|) (Polynomial.mahlerMeasure_mul, mahlerMeasure_X_sub_C); each coefficient is at most C(n, k)·M ≤ 2^n·M
(norm_coeff_le_choose_mul_mahlerMeasure) and M ≤ √(n + 1)·max|coefficient| ≤ 2^n·max|coefficient| (Landau,
mahlerMeasure_le_sqrt_sum_sq_norm_coeff).
3. Summing over the places with weights (the multiplicity of a complex place counts twice, matched by s(v)) and
dividing by [K:ℚ] gives the claim; the leading coefficient 1 makes max(1, …) harmless.
4. For a nonmonic polynomial use projective coefficient height first: the local Mahler measure of a₀∏(X−α_i) is
|a₀| times the product of max(1,|α_i|). The product formula cancels the leading coefficient, and the
projective coefficient height is bounded by the affine tuple height h(f). At an infinite place the
coefficient maximum and Mahler measure differ by at most the factor 2^n; at finite places Gauss gives
equality. Evaluation follows from the triangle inequality at infinity and the ultrametric inequality
elsewhere, contributing log(n+1).

*Checks.*

- For f = X − α the two sides agree exactly.
- For f = (X − 1)^n: h(f) = log max_k C(n, k) ≤ n log 2 while Σ h(1) = 0, so the constant n·log 2 is needed up
to lower-order terms.
- For f = X² − 2 = (X − √2)(X + √2): h(f) = log 2 and Σ h(±√2) = log 2.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/coefficient-height-of-polynomial`
- `DiophantineApproximationAndTranscendence:DT.4/content-ideal-gauss-lemma`
- `mathlib:Polynomial.mahlerMeasure_mul`
- `mathlib:Polynomial.mahlerMeasure_X_sub_C`
- `mathlib:Polynomial.norm_coeff_le_choose_mul_mahlerMeasure`
- `mathlib:Polynomial.mahlerMeasure_le_sqrt_sum_sq_norm_coeff`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.4, Lemma 3.6, p. 10 (arXiv v1 pagination; published pagination
adds 726).: Bérczes–Evertse–Győry quote the comparison of the height of a monic polynomial with the sum of
the heights of its roots from Bombieri–Gubler, Theorem 1.6.13.

<a id="discriminant-size-bound"></a>
#### Size of the discriminant of a polynomial (BEG Lemma 3.7)

`DT.4/discriminant-size-bound` · lemma · Lean: `infinitePlace_discr_le`, `finitePlace_discr_le`, `absLogHeight_discr_le`

Assume n ≥ 1. Let K be a number field and f = a_0X^n + ⋯ + a_n ∈ K[X] of degree n with discriminant D(f) ≠
0. Then (i) |D(f)|_v ≤ n^{(2n−1)s(v)}·max(|a_0|_v, …, |a_n|_v)^{2n−2} for every place v, where s(v) = 1, 2,
0 for real, complex and finite v; (ii) h(D(f)) ≤ (2n − 1)·log n + (2n − 2)·h(f).

*Hypotheses.*

- K a number field
- f ∈ K[X] of degree n ≥ 1, D(f) ≠ 0
- n ≥ 1

*Proof sketch.*

1. Finite v: D(f) (Mathlib's Polynomial.discr, a determinant in the coefficients) is a homogeneous polynomial
of degree 2n − 2 in a_0, …, a_n with integer coefficients, so the ultrametric inequality gives (i) with s(v)
= 0.
2. Infinite v: Bérczes–Evertse–Győry cite Lewis–Mahler (Acta Arith. 6 (1961), p. 335) for |D(f)| ≤
n^{2n−1}·max|a_i|^{2n−2}. A route through results in the libraries gives the slightly weaker |D(f)| ≤
n^n·M(f)^{2n−2} ≤ n^n(n + 1)^{n−1}·max|a_i|^{2n−2} ≤ e·n^{2n−1}·max|a_i|^{2n−2} (Mahler's discriminant
inequality via Hadamard's inequality for the Vandermonde matrix, neither of which is in Mathlib at the pin,
then Landau's bound mahlerMeasure_le_sqrt_sum_sq_norm_coeff); the extra factor e is absorbed in the
constants that use this bound. The sharp form rests on gap 'Lewis–Mahler discriminant bound'.
3. (ii): multiply (i) over all places, take logarithms and divide by [K:ℚ]; Σ_v s(v) = [K:ℚ].

*Checks.*

- For f = X² − 2: D(f) = 8 ≤ 2³·2² = 32 at the real place.
- For f = aX² + bX + c: |b² − 4ac| ≤ 5·max(|a|, |b|, |c|)² ≤ 8·max(…)², consistent with n^{2n−1} = 8.
- At a finite place the bound has no factor n^{…}, by the ultrametric inequality.

*Needs.*

- `mathlib:Polynomial.discr`
- `mathlib:Polynomial.resultant`
- `DiophantineApproximationAndTranscendence:DT.4/coefficient-height-of-polynomial`
- `mathlib:Polynomial.mahlerMeasure_le_sqrt_sum_sq_norm_coeff`
- `mathlib:NumberField.InfinitePlace.sum_mult_eq`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.4, Lemma 3.7 and proof, pp. 10–11 (arXiv v1 pagination;
published pagination adds 726).: Bérczes–Evertse–Győry bound the v-adic size of the discriminant by
n^{(2n−1)s(v)} times the (2n−2)-th power of the largest coefficient, ultrametrically at finite places and by
Lewis–Mahler at infinite places.

<a id="lcm-of-first-integers-bound"></a>
#### lcm(1, …, m) ≤ 4^m

`DT.4/lcm-of-first-integers-bound` · lemma · Lean: `lcmUpto_le_pow_primeCounting`, `lcmUpto_le_four_pow`, `lcmUpto_le_sixteen_pow_mul`

For every integer m ≥ 1, u(m) := lcm(1, 2, …, m) (Mathlib's Nat.lcmUpto) satisfies u(m) ≤ m^{π(m)} ≤ 4^m. A
weaker bound u(m) ≤ 16^m·m^{√m} follows from results in Mathlib alone.

*Hypotheses.*

- m ≥ 1

*Proof sketch.*

1. u(m) = ∏_{p ≤ m} p^{⌊log m/log p⌋} (Nat.factorization_lcmUpto) and p^{⌊log m/log p⌋} ≤ m, so u(m) ≤
m^{π(m)}.
2. Rosser–Schoenfeld's π(x) < 1.25506·x/log x for x > 1 (or Tijdeman's quoted π(k) ≤ 4k/(3 log k)) gives
m^{π(m)} ≤ e^{1.256m} < 4^m. This explicit prime-counting bound is not planned in a roadmap of this or a
lower upstream tier (gap 'Rosser–Schoenfeld prime-counting bound').
3. Mathlib's Chebyshev.pi_le_log4_mul_div gives π(m) ≤ 2 log 4·m/log m + √m and hence u(m) ≤ 16^m·m^{√m}, which
can replace 4^m in Lemma 4.3 at the cost of larger numerical constants.

*Checks.*

- u(10) = 2520 ≤ 4^10.
- u(1) = 1.
- Mathlib's two_pow_le_mul_lcmUpto gives the matching lower bound 2^m ≤ (m + 1)·u(m), so the exponential rate
is sharp up to the base.

*Needs.*

- `mathlib:Nat.lcmUpto`
- `mathlib:Nat.factorization_lcmUpto`
- `mathlib:Chebyshev.pi_le_log4_mul_div`

*Sources.*

- tijdeman-catalan-1976, §3, Lemma T1 (second assertion) and its proof, pp. 199–201: Tijdeman proves ν(k) ≤
4^k for the least common multiple of 1, …, k from ν(k) ≤ k^{π(k)} and an explicit bound for π(k).
- berczes-evertse-gyory-superelliptic-2013, §4, proof of Lemma 4.3, p. 19 (arXiv v1 pagination; published
pagination adds 726).: Bérczes–Evertse–Győry use u(m) ≤ m^{π(m)} ≤ 4^m, citing Rosser–Schoenfeld, Corollary
1.

<a id="polynomial-discriminant-in-relative-discriminant"></a>
#### The relative discriminant divides the discriminant of a defining polynomial (BEG Lemma 3.1)

`DT.4/polynomial-discriminant-in-relative-discriminant` · lemma · Lean: `relDiscr`, `discr_mem_relDiscr`

Let K be a number field, L = K(α) and f ∈ K[X] a squarefree polynomial of degree m with f(α) = 0. Then, as
fractional ideals of 𝓞_K, relDiscr(𝓞_K, 𝓞_L) ⊇ [D(f)]·[f]^{−(2m−2)}; equivalently λ^{2m−2}·D(f) ∈
relDiscr(𝓞_K, 𝓞_L) for every λ ∈ K with λf ∈ 𝓞_K[X]. (relDiscr is Tau Ceti's relative discriminant ideal,
the relative norm of the different.)

*Hypotheses.*

- K a number field, L = K(α)
- f ∈ K[X] squarefree of degree m, f(α) = 0

*Proof sketch.*

1. Let g_1 be the irreducible factor of f with g_1(α) = 0, f = g_1g_2, n := deg g_1, k := deg g_2. Then D(f) =
D(g_1)D(g_2)R(g_1, g_2)² (Tau Ceti Polynomial.Monic.discr_mul after normalising leading coefficients), and
the determinant formulas give D(g_1) ∈ [g_1]^{2n−2}, D(g_2) ∈ [g_2]^{2k−2}, R(g_1, g_2) ∈ [g_1]^k[g_2]^n.
2. With [f] = [g_1][g_2] (content-ideal-gauss-lemma) this gives [D(f)]/[f]^{2m−2} ⊆ [D(g_1)]/[g_1]^{2n−2}, so
it suffices to show D(h) ∈ relDiscr for every h = b_0X^n + ⋯ + b_n ∈ 𝓞_K[X], irreducible over K, with h(α) =
0.
3. Birch–Merriman: ω_i := b_0α^i + b_1α^{i−1} + ⋯ + b_i (0 ≤ i < n) are integral over 𝓞_K by induction on i
(ω_iα is a root of a monic polynomial over 𝓞_L obtained from h(α) = 0), and the discriminant of the K-basis
(1, ω_1, …, ω_{n−1}) of L equals b_0^{2n−2}·D_{L/K}(1, α, …, α^{n−1}) = D(h).
4. The discriminant of any K-basis of L consisting of integral elements lies in relDiscr(𝓞_K, 𝓞_L) (request to
Tau Ceti NumberFieldArithmetic, Layer 4).

*Checks.*

- For K = ℚ, L = ℚ(i), f = X² + 1: relDiscr = (4) ⊇ (D(f)) = (−4).
- For K = ℚ, L = ℚ(√5), f = X² − 5: relDiscr = (5) ⊇ (20), a proper inclusion (the index of ℤ[√5] is 2).
- Scaling f by λ ∈ K^× does not change [D(f)][f]^{−(2m−2)}.

*Needs.*

- `tauceti:TauCeti.relDiscr`
- `tauceti:Polynomial.Monic.discr_mul`
- `DiophantineApproximationAndTranscendence:DT.4/content-ideal-gauss-lemma`
- `mathlib:Polynomial.discr`
- `mathlib:Algebra.discr`
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.1, Lemma 3.1 and its proof, pp. 5–6 (arXiv v1 pagination;
published pagination adds 726).: Bérczes–Evertse–Győry prove that the relative discriminant ideal of K(α)/K
contains the discriminant of any squarefree polynomial vanishing at α divided by the (2m−2)-th power of its
content ideal, by the argument of Birch and Merriman.

<a id="relative-discriminant-exponent-bound"></a>
#### Exponents of the relative discriminant are bounded (BEG Lemma 3.2)

`DT.4/relative-discriminant-exponent-bound` · lemma · Lean: `multiplicity_relDiscr_le`

Let L/K be an extension of number fields of degree n and u(n) := lcm(1, …, n). For every nonzero prime 𝔭 of
𝓞_K: ord_𝔭(relDiscr(𝓞_K, 𝓞_L)) ≤ n·(1 + ord_𝔭(u(n))).

*Hypotheses.*

- L/K finite of degree n
- 𝔭 a nonzero prime of 𝓞_K

*Proof sketch.*

1. ord_𝔭(relDiscr) = Σ_{P∣𝔭} f(P|𝔭)·ord_P(𝔡_{L/K}) (Tau Ceti NumberFieldArithmetic, Layer 5.10). This exact
dictionary is already implemented in current Tau Ceti as TauCeti.multiplicity_relDiscr; no duplicate target
is planned. At the pinned baseline its verified NumberFieldArithmetic layer remains the supplier.
2. ord_P(𝔡_{L/K}) ≤ e(P|𝔭) − 1 + ord_P(e(P|𝔭)) (tame and wild bound, NumberFieldArithmetic Layer 6.4), and
ord_P(e) = e(P|𝔭)·ord_𝔭(e) ≤ e(P|𝔭)·ord_𝔭(u(n)) because e(P|𝔭) ≤ n divides u(n).
3. Hence ord_𝔭(relDiscr) ≤ Σ_P f·e·(1 + ord_𝔭(u(n))) = n·(1 + ord_𝔭(u(n))) (Ideal.sum_ramification_inertia).

*Checks.*

- For K = ℚ, L = ℚ(√2), 𝔭 = (2): ord = 3 ≤ 2·(1 + ord_2(2)) = 4.
- For an unramified prime both sides are compatible with ord = 0.
- For 𝔭 ∤ n! the bound reads ord_𝔭 ≤ n.

*Needs.*

- `tauceti:TauCeti.relDiscr`
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences`
- `mathlib:Ideal.sum_ramification_inertia`
- `mathlib:Nat.lcmUpto`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_liesOver`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.1, Lemma 3.2 and its proof, pp. 6–7 (arXiv v1 pagination;
published pagination adds 726).: Bérczes–Evertse–Győry bound the exponent of a prime in the relative
discriminant by n(1 + ord(lcm(1, …, n))), from Neukirch's bound for the different.

<a id="relative-discriminant-of-compositum"></a>
#### Discriminant of a compositum (BEG Lemma 3.3(ii))

`DT.4/relative-discriminant-of-compositum` · lemma · Lean: `relDiscr_compositum_le`

Let L_1, L_2 be finite extensions of a number field K inside a common field and M := L_1L_2. Then
relDiscr(𝓞_K, 𝓞_M) ⊇ relDiscr(𝓞_K, 𝓞_{L_1})^{[M:L_1]}·relDiscr(𝓞_K, 𝓞_{L_2})^{[M:L_2]}. (Part (i) of BEG's
Lemma 3.3, the tower formula relDiscr(𝓞_K, 𝓞_M) = relDiscr(𝓞_K, 𝓞_L)^{[M:L]}·N_{L/K}(relDiscr(𝓞_L, 𝓞_M)), is
Tau Ceti's relDiscr_tower.)

*Hypotheses.*

- K ⊆ L_1, L_2 ⊆ M = L_1L_2 number fields

*Proof sketch.*

1. For a compositum M = L₁L₂ over K use Stark Lemma 6: the different of M/L₁ divides the extension to M of the
different of L₂/K. Locally at a prime of L₂ choose an integral primitive element α whose minimal-polynomial
derivative has the exact different order. The minimal polynomial over L₁ divides the one over K, so its
derivative at α divides the old derivative; the different of M/L₁ divides that derivative. This is the local
monogenic-choice/derivative bridge recorded below, not a trace-dual identity proved by a formal
manipulation.
2. Take relative norms to K and use the discriminant tower formula. The norm of an extended L₂-ideal has the
exponent [M:L₂]; the L₁ tower contributes d_{L₁/K}^{[M:L₁]}. This gives d_{M/K} ∣
d_{L₁/K}^{[M:L₁]}d_{L₂/K}^{[M:L₂]}. Iterate for more factors, using the corresponding compositum degrees.

*Checks.*

- For K = ℚ, L_1 = ℚ(i), L_2 = ℚ(√2), M = ℚ(ζ_8): disc M = 2^8 divides 4²·8² = 2^{10}.
- For L_2 = K the statement is trivial.
- Linearly disjoint L_1, L_2 with coprime discriminants give equality.

*Needs.*

- `tauceti:TauCeti.relDiscr`
- `tauceti:TauCeti.relDiscr_tower`
- `mathlib:differentIdeal`
- `mathlib:Ideal.relNorm`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.1, Lemma 3.3 and its proof, p. 7 (arXiv v1 pagination;
published pagination adds 726).: Bérczes–Evertse–Győry state the tower formula (from Neukirch III, Corollary
2.10) and the compositum inclusion (from Stark's Lemma 6 by taking norms).
- stark-1974, Lemma 6 and proof, p. 143: The divisibility of the different under arbitrary compositum base
change, proved with locally chosen primitive elements and derivatives.

<a id="kummer-extension-unramified-criterion"></a>
#### Kummer extensions are unramified where the radicand is an m-th power up to a unit (BEG Lemma 3.4)

`DT.4/kummer-extension-unramified-criterion` · lemma · Lean: `not_dvd_relDiscr_of_pow`

Let K be a number field, m ≥ 1, γ ∈ K^× and L := K(γ^{1/m}) for some m-th root. If 𝔭 is a nonzero prime of
𝓞_K with ord_𝔭(m) = 0 and ord_𝔭(γ) ≡ 0 (mod m), then 𝔭 does not divide relDiscr(𝓞_K, 𝓞_L).

*Hypotheses.*

- K a number field, m ≥ 1, γ ∈ K^×
- 𝔭 ∤ m and m ∣ ord_𝔭(γ)

*Proof sketch.*

1. Choose τ ∈ K with ord_𝔭(τ) = 1 and write γ = τ^{mt}ε with ord_𝔭(ε) = 0; then L = K(ε^{1/m}).
2. X^m − ε is squarefree (m ≠ 0 in K, ε ≠ 0) with discriminant ±m^m ε^{m−1}, so
polynomial-discriminant-in-relative-discriminant gives relDiscr ⊇ [m^m ε^{m−1}]·[1, ε]^{−(2m−2)}.
3. The right side has 𝔭-order 0, and relDiscr is integral, so ord_𝔭(relDiscr) = 0.

*Checks.*

- For K = ℚ, m = 2, γ = 3: L = ℚ(√3) is unramified at 5 (5 ∤ 2, ord_5(3) = 0) and ramified at 3.
- For γ = 4·3 = 12 and 𝔭 = (2): ord_2(12) = 2 ≡ 0 mod 2 but 2 ∣ m, and ℚ(√12) = ℚ(√3) is ramified at 2: the
hypothesis 𝔭 ∤ m matters.
- For m = 1 the statement is trivial (L = K).

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/polynomial-discriminant-in-relative-discriminant`
- `tauceti:TauCeti.relDiscr`
- `mathlib:Polynomial.discr`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.1, Lemma 3.4 and its proof, p. 7 (arXiv v1 pagination;
published pagination adds 726).: Bérczes–Evertse–Győry show that K(γ^{1/m})/K is unramified at primes not
dividing m at which the order of γ is divisible by m.

<a id="discriminant-of-root-field-bound"></a>
#### Discriminant of the field generated by roots of a polynomial (BEG Lemma 4.1)

`DT.4/discriminant-of-root-field-bound` · lemma · Lean: `abs_discr_le_of_adjoin_root`

Let K be a number field of degree d and f ∈ K[X] of degree n with D(f) ≠ 0, f = a_0(X − α_1)⋯(X − α_n) over
an extension, and L := K(α_1, …, α_k). Then |D_L| ≤ (n·e^{h(f)})^{2kn^k d}·|D_K|^{n^k}; for k = 1, |D_L| ≤
n^{(2n−1)d}·e^{(2n−2)d·h(f)}·|D_K|^{[L:K]}.

*Hypotheses.*

- K a number field of degree d
- f ∈ K[X] of degree n, D(f) ≠ 0
- 1 ≤ k ≤ n

*Proof sketch.*

1. |D_L| = N_K(relDiscr(𝓞_K, 𝓞_L))·|D_K|^{[L:K]} (tower formula over ℤ: Tau Ceti relDiscr_tower and
relDiscr_int_ringOfIntegers), and [L:K] ≤ n^k.
2. relative-discriminant-of-compositum applied to L = K(α_1)⋯K(α_k) and
polynomial-discriminant-in-relative-discriminant give relDiscr(𝓞_K, 𝓞_{K(α_i)}) ⊇ [D(f)][f]^{−(2n−2)}.
3. By discriminant-size-bound at the infinite places and the definition of the norm at the finite ones,
N_K([D(f)][f]^{−(2n−2)}) ≤ (n^{2n−1}e^{(2n−2)h(f)})^d.
4. Combine with [L : K(α_i)] ≤ (n − 1)⋯(n − k + 1).

*Checks.*

- For K = ℚ, f = X² − 2, k = 1: |D_L| = 8 ≤ 2³·e^{2 log 2} = 32.
- For k = 0 (L = K) the bound is |D_K| ≤ |D_K|.
- The exponent of |D_K| is at most [L:K] ≤ n^k.

*Needs.*

- `tauceti:TauCeti.relDiscr_tower`
- `tauceti:TauCeti.NumberField.relDiscr_int_ringOfIntegers`
- `DiophantineApproximationAndTranscendence:DT.4/relative-discriminant-of-compositum`
- `DiophantineApproximationAndTranscendence:DT.4/polynomial-discriminant-in-relative-discriminant`
- `DiophantineApproximationAndTranscendence:DT.4/discriminant-size-bound`
- `DiophantineApproximationAndTranscendence:DT.4/coefficient-height-of-polynomial`
- `mathlib:NumberField.discr`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §4, Lemma 4.1 and its proof, formulas (4.1)–(4.4), pp. 14–15
(arXiv v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry bound the discriminant of the
field generated over K by k roots of f in terms of n, h(f), d and D_K.

<a id="discriminant-of-kummer-compositum-bound"></a>
#### Discriminant of the auxiliary fields M (BEG Lemma 4.3)

`DT.4/discriminant-of-kummer-compositum-bound` · lemma · stated in this document only

In the setting of superelliptic-power-decomposition (x − α_i = γ_iξ_i^m) let K have degree d and S consist
of the infinite places and primes of norm product Q_S. (i) If m ≥ 3, M := K(α_1, α_2, (γ_1/γ_2)^{1/m}, ρ)
with ρ a primitive m-th root of unity, then |D_M| ≤
10^{m³n²d}·n^{4m²n³d}·|D_K|^{m²n²}·Q_S^{m²n²}·e^{4m²n³d·ĥ}. (ii) If m = 2 and M := K(α_1, α_2, α_3,
√(γ_1/γ_2), √(γ_1/γ_3)), then |D_M| ≤ n^{40n⁴d}·Q_S^{8n³}·|D_K|^{4n³}·e^{25n⁴d·ĥ}.

*Hypotheses.*

- the data of superelliptic-power-decomposition-height-bound
- m ≥ 2 (n ≥ 3 if m = 2)

*Proof sketch.*

1. (i): with L := K(α_1, α_2), M_1 := L((γ_1/γ_2)^{1/m}), M_2 := L(ρ): |D_M| = N_L(relDiscr(𝓞_L,
𝓞_M))·|D_L|^{[M:L]}, relDiscr(𝓞_L, 𝓞_{M_2}) ⊇ (m)^m (polynomial-discriminant-in-relative-discriminant for
X^m − 1), and the compositum lemma gives relDiscr(𝓞_L, 𝓞_M) ⊇ m^{m²}·relDiscr(𝓞_L, 𝓞_{M_1})^m.
2. Primes P of L outside S not dividing m·a_0·b·D(f) have ord_P(γ_1/γ_2) ≡ 0 mod m
(superelliptic-ideal-power-decomposition), so M_1/L is unramified there
(kummer-extension-unramified-criterion); at the remaining primes relative-discriminant-exponent-bound gives
exponent ≤ m(1 + ord_P(u(m))).
3. Bound the norm of the product of those primes by (Q_S·N_S(m a_0 b D(f)))^{n²} and u(m)^m ≤ 4^{m²}
(lcm-of-first-integers-bound), N_S(D(f)) via discriminant-size-bound, and |D_L| by
discriminant-of-root-field-bound with k = 2.
4. (ii) is the same computation with L := K(α_1, α_2, α_3), [L:K] ≤ n³ and two quadratic Kummer steps.

*Checks.*

- The field M of (i) contains the splitting field of γ_1X^m − γ_2Y^m over K(α_1, α_2).
- For m = 2 the field M of (ii) equals K(α_1, α_2, α_3, √(γ_1/γ_3), √(γ_2/γ_3)), the field used in BEG's proof
of Theorem 2.2.
- The dependence on Q_S enters only through the primes where M_1/L can ramify.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/discriminant-of-root-field-bound`
- `DiophantineApproximationAndTranscendence:DT.4/relative-discriminant-of-compositum`
- `DiophantineApproximationAndTranscendence:DT.4/relative-discriminant-exponent-bound`
- `DiophantineApproximationAndTranscendence:DT.4/kummer-extension-unramified-criterion`
- `DiophantineApproximationAndTranscendence:DT.4/polynomial-discriminant-in-relative-discriminant`
- `DiophantineApproximationAndTranscendence:DT.4/lcm-of-first-integers-bound`
- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-ideal-power-decomposition`
- `DiophantineApproximationAndTranscendence:DT.4/discriminant-size-bound`
- `DiophantineApproximationAndTranscendence:DT.4/s-norm`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §4, Lemma 4.3 and its proof, formulas (4.16)–(4.22), pp. 19–20
(arXiv v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry bound the discriminants of the
fields generated by two (three) roots of f, an m-th root of γ_1/γ_2 (two square roots) and the m-th roots of
unity.

### 4.8 Linear forms in logarithms at an arbitrary place

The interfaces between DT.3's lower bounds and the equations: Voutier's height bound, Yu's p-adic bound read
in an arbitrary number field and for any number of logarithms, BEG Proposition 3.10 at an arbitrary place, and
Matveev's bound for positive rationals with the heights separated, which replaces both Baker-type inputs of
Tijdeman's paper.

<a id="voutier-height-lower-bound"></a>
#### Voutier's lower bound for the height of an algebraic number

`DT.4/voutier-height-lower-bound` · theorem · Lean: `voutierBound`, `voutierBound_le_absLogHeight`

Let α be a nonzero algebraic number of degree d that is not a root of unity. Then its absolute logarithmic
height satisfies h(α) ≥ m(d), where m(1) := log 2 and m(d) := 2/(d·(log 3d)³) for d ≥ 2 (Voutier's Corollary
2; BEG Lemma 3.9).

*Hypotheses.*

- α ∈ ℚ̄^×, deg α = d
- α is not a root of unity

*Proof sketch.*

1. d = 1: α = u/w in lowest terms with α ≠ ±1, so max(|u|, |w|) ≥ 2 and h(α) = log max(|u|, |w|) ≥ log 2.
2. d ≥ 2: Voutier proves log M(α) > (1/4)(log log d/log d)³ for d ≥ 2 by the determinant method of Cantor and
Straus (Fermat's little theorem gives a nonzero integer lower bound, Hadamard's inequality an upper bound);
Corollary 2 combines this with Smyth's theorem for non-reciprocal α and with Boyd's computations for d ≤ 20,
and d·h(α) = log M(α).
3. The case d ≥ 2 is not decomposed into nodes here (gap 'Voutier's height lower bound'); only the case d = 1
is used for equations over ℤ.
4. If α has degree e ≤ d, apply Voutier to e and use that e(log(3e))³ is increasing; degree-one elements have
height at least log 2. Auxiliary root fields L_i generally have degree greater than one even when K = ℚ, so
their units still require the higher-degree cutoff.

*Checks.*

- For α = 2: h(2) = log 2 = m(1).
- For α = (1 + √5)/2 (d = 2): h(α) = (1/2)log α ≈ 0.2406 ≥ 2/(2·(log 6)³) ≈ 0.1736.
- Roots of unity have height 0, so the hypothesis is necessary.

*Needs.*

- `mathlib:Rat.mulHeight₁_eq_max`
- `mathlib:NumberField.absLogHeight₁`
- `mathlib:Polynomial.mahlerMeasure`

*Sources.*

- voutier-height-1996, §1, Theorem and Corollary 2, pp. 83–84: Voutier's effective lower bound for the Mahler
measure of an algebraic number that is not a root of unity, and its simplified form d·h(α) > 2/(log 3d)³ for
d ≥ 2.
- berczes-evertse-gyory-superelliptic-2013, §3.4, Lemma 3.9, p. 11 (arXiv v1 pagination; published pagination
adds 726).: Bérczes–Evertse–Győry quote Voutier's bound as m(d), with m(1) = log 2.

<a id="yu-bound-in-a-number-field"></a>
#### Yu's p-adic bound for algebraic numbers in an arbitrary number field

`DT.4/yu-bound-in-a-number-field` · lemma · Lean: `exists_finitePlace_prod_pow_sub_one_ge`

Let K be a number field of degree d_K, 𝔓 a nonzero prime of 𝓞_K above the rational prime p, with
ramification index e(𝔓) and residue degree f(𝔓), and |·|_𝔓 := N𝔓^{−ord_𝔓(·)} the normalised absolute value.
Let n ≥ 1, α_1, …, α_n ∈ K^× and b ∈ ℤ^n with Λ := α_1^{b_1}⋯α_n^{b_n} − 1 ≠ 0. Put n′ := max(n, 2), let
(α′_j) be (α_j) padded, when n = 1, by α′_2 := p with b_2 := 0, let K₀ := ℚ(α′_1, …, α′_{n′}) ⊆ K of degree
d₀, 𝔭₀ := 𝔓 ∩ 𝓞_{K₀} and h_j ≥ max(h(α′_j), |log α′_j|/(10d₀), log p) (principal complex logarithm). Then
ord_𝔓(Λ) = e(𝔓|𝔭₀)·ord_{𝔭₀}(Λ) < e(𝔓|𝔭₀)·Φ₀·log(d₀B) and hence log|Λ|_𝔓 > −e(𝔓|𝔭₀)·Φ₀·log(d₀B)·log N𝔓, where
B := max(|b_1|, …, |b_n|, 3) and Φ₀ := 22000·(9.5(n′ + 1)d₀/√(log p))^{2(n′+1)}·(p^{f(𝔭₀)} −
1)·h_1⋯h_{n′}·log(10n′d₀h′), h′ := max(h_j, 1). In particular |Λ|_𝔓 ≥ (e·max(1, max|b_j|))^{−C} with C
depending only on d_K, n, p, N𝔓 and the h_j, which is the p-adic hypothesis of
DT.4/gyory-equation-exponent-bound.

*Hypotheses.*

- K a number field, 𝔓 ∣ p a nonzero prime of 𝓞_K
- n ≥ 1, α_j ∈ K^×, b ∈ ℤ^n
- Λ ≠ 0

*Proof sketch.*

1. Padding: for n = 1 adjoin α′_2 := p with exponent 0; Λ is unchanged, ℚ(α_1, p) = ℚ(α_1), h(p) = log p and
|log p|/(10d₀) ≤ log p, so the admissible h_2 = log p does not depend on α_1.
2. Apply DT.3/yu-explicit-p-adic-bound to (α′_j), b and the prime 𝔭₀ of the generated field K₀ (its hypothesis
K = ℚ(α) is met by K₀); the condition b ≠ 0 holds because Λ ≠ 0 forces some b_j ≠ 0.
3. Restriction: Λ ∈ K₀, and for x ∈ K₀^× one has ord_𝔓(x) = e(𝔓|𝔭₀)·ord_{𝔭₀}(x) (multiplicativity of
ramification in towers); the residue degree in the bound is that of 𝔭₀ over p.
4. Conversion: log|Λ|_𝔓 = −ord_𝔓(Λ)·log N𝔓; with e(𝔓|𝔭₀) ≤ [K : K₀] and log(d₀B) ≤ log d_K + log 3 +
log(e·max(1, max|b_j|)) one reads off C.
5. For the field F generated by the logarithm arguments inside K, use valuation_liesOver for a prime of K above
a prime of F: ord_𝔭(λ) = e(𝔭|𝔮) ord_𝔮(λ). Multiply by log N𝔭 for the normalized FinitePlace.mk absolute
value. Yu 1994 permits arbitrary nonzero arguments, so padding a one-logarithm form by the rational prime
with coefficient zero does not require that prime to be a local unit.

*Checks.*

- For K = ℚ, n = 1, α_1 = 1 + p (p odd) and b_1 = b, the bound is consistent with the exact value ord_p((1 +
p)^b − 1) = 1 + v_p(b) (DT.3/p-adic-valuation-of-power-minus-one).
- If 𝔓 is unramified over 𝔭₀ the factor e(𝔓|𝔭₀) is 1 and the bound is Yu's bound read in K.
- The padding by α′_2 = p never creates the excluded case α^b = 1, because b_2 = 0.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.3/yu-explicit-p-adic-bound`
- `mathlib:Ideal.ramificationIdx`
- `mathlib:Ideal.sum_ramification_inertia`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicAbv`
- `mathlib:NumberField.absLogHeight₁`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_liesOver`

*Sources.*

- yu-p-adic-logarithms-1994, §0.1, main inequality, pp. 241–242: Yu's explicit upper bound for the 𝔭-adic
order of α_1^{b_1}⋯α_n^{b_n} − 1 in the field generated by the α_j, for n ≥ 2.
- bugeaud-gyory-unit-equations-1996, Section 4, the p-adic lower bound quoted from Yu, p. 73: Bugeaud and
Győry use Yu's bound for algebraic numbers in a fixed number field containing them, at its prime ideals, in
the proof of their unit-equation bounds.
- evertse-dio-notes-ch5, Chapter 5, remark after Theorem 5.18, printed p. 103: Evertse notes that the proof of
Győry's theorem needs a generalisation of the p-adic Theorem 5.16 to algebraic numbers.

<a id="baker-bound-at-a-place"></a>
#### Baker-type lower bound for |α^b − 1|_v at an arbitrary place (BEG Proposition 3.10)

`DT.4/baker-bound-at-a-place` · theorem · Lean: `normLogAbs_prod_pow_sub_one_ge`

Let K be a number field of degree d, n ≥ 2, α_1, …, α_n ∈ K^×, b ∈ ℤ^n not all zero, Λ :=
α_1^{b_1}⋯α_n^{b_n} − 1, Θ := ∏_i max(h(α_i), m(d)) with m(d) as in voutier-height-lower-bound, B := max(3,
|b_1|, …, |b_n|), and for a place v of K put N(v) := 2 if v is infinite and N(v) := N𝔭 if v = 𝔭 is finite;
|·|_v is normalised as in s-norm. If Λ ≠ 0 then log|Λ|_v > −c₁(n, d)·(N(v)/log N(v))·Θ·log B with c₁(n, d)
:= 12·(16ed)^{3n+2}·(log* d)², log* x := max(1, log x).

*Hypotheses.*

- K a number field, d = [K : ℚ], n ≥ 2
- α_i ∈ K^×, b ∈ ℤ^n ∖ {0}, Λ ≠ 0
- v a place of K

*Proof sketch.*

1. At an infinite place of multiplicity a = 1 or 2 embed K into ℂ. Put Ξ = Σ b_i log α_i + 2b₀ log(−1), with
|Im Ξ| ≤ π and |2b₀| ≤ 1 + nB. If |Λ| ≤ 1/2, Ξ is the principal logarithm of 1 + Λ, so 0 < |Ξ| ≤ 2|Λ|. If
|Λ| > 1/2 the claimed lower bound is immediate. Remove zero logarithms and zero coefficients before applying
DT.3/matveev-corollary-linear-form-bound.
2. Choose the genuinely admissible Matveev parameters A_i = d h(α_i) + π and A₀ = π. Thus Ω ≤ π F(d)^n Θ, where
F(d) = d + π/m(d). The supplier gives a constant at most 2^{6(n+1)+20}, and log(eB′) ≤ (n+2)log B for B′ ≤
1+nB. Consequently log |Λ|_v ≥ −2π·2^{6n+26}(n+2)d²log(ed) F(d)^n Θ log B − 2log 2.
3. For d = 1, F(d) ≤ 6. For d ≥ 2, F(d) ≤ 3d³: use m(d) = 2/(d(log(3d))³) and the decreasing function
log(3d)³/d² for d ≥ 2. Also log(ed)/(log* d)² ≤ 2. Comparing with c₁(n,d)·2/log 2 at n = 2 bounds the
main-coefficient ratio by 0.6 for d = 1 and 0.3 for d ≥ 2; successive n only decrease it. The remaining
slack absorbs 2log 2 because Θ ≥ m(d)^n and log B ≥ log 3. This supplies the claimed constant without
discarding d from the height parameters.
4. At a finite place the exact BEG constant uses Yu 2007, whose main theorem is a recorded gap. The Yu 1994
adapter provides an effective lower bound with a different constant; do not identify it with c₁(n,d).
Normalize the valuation by log N𝔭 as in FinitePlace.mk.

*Checks.*

- The bound is uniform in the place: only N(v) enters.
- For K = ℚ, v = ∞, n = 2, α = (2, 3): it bounds |2^{b_1}3^{b_2} − 1| from below by exp(−c₁(2, 1)·(2/log
2)·log 2·log 3·log B).
- The hypothesis Λ ≠ 0 is essential: for α_1 = −1, b_1 = 2 one has Λ = 0.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.3/matveev-corollary-linear-form-bound`
- `DiophantineApproximationAndTranscendence:DT.4/yu-bound-in-a-number-field`
- `DiophantineApproximationAndTranscendence:DT.4/voutier-height-lower-bound`
- `DiophantineApproximationAndTranscendence:DT.4/s-norm`
- `mathlib:Complex.log`
- `mathlib:Complex.norm_log_one_add_half_le_self`
- `mathlib:Complex.exp_eq_exp_iff_exists_int`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.5, Proposition 3.10 and its proof, pp. 11–12 (arXiv v1
pagination; published pagination adds 726).: The Baker-type lower bound for |α_1^{b_1}⋯α_n^{b_n} − 1|_v,
from Matveev at infinite places and from Yu's 2007 p-adic theorem at finite places.
- matveev-linear-forms-2000, §2, Corollary 2.3, p. 1219: Matveev's explicit archimedean lower bound used at
infinite places.

<a id="separated-height-logarithmic-form-bound"></a>
#### Linear forms in logarithms of positive rationals with separated heights

`DT.4/separated-height-logarithmic-form-bound` · lemma · Lean: `log_abs_linearForm_gt`

Let n ≥ 1, let a_1, …, a_n be positive rational numbers different from 1, let b ∈ ℤ^n and put Λ := b_1 log
a_1 + ⋯ + b_n log a_n (real logarithms). For a positive rational a = u/w in lowest terms put H(a) := max(u,
w) and A_j := max(log H(a_j), 0.16). If Λ ≠ 0 and B ≥ max_j |b_j|, then log|Λ| > −C(n)·A_1⋯A_n·log(eB) with
C(n) := (en/2)·30^{n+3}·n^{3.5}. In particular, if H(a_j) ≤ A′ for j < n and H(a_n) ≤ A with A, A′ ≥ 2, then
|Λ| > exp(−C(n)·(log A′)^{n−1}·log A·log(eB)). This is stronger than the two Baker-type inputs of Tijdeman's
Catalan paper (his Theorem 2, exponent 2n² + 16n on log A′, and Baker's Theorem B, with Q* log Q* in place
of Q*), so both are replaced by it.

*Hypotheses.*

- n ≥ 1
- a_j ∈ ℚ_{>0} ∖ {1}
- b ∈ ℤ^n with Λ ≠ 0
- B ≥ max_j |b_j|

*Proof sketch.*

1. Apply DT.3/matveev-corollary-linear-form-bound with K = ℚ (degree D = 1, real, so κ = 1), α_j = a_j and λ_j
= log a_j, which is a nonzero logarithm of a_j because a_j ≠ 1.
2. The absolute logarithmic height of a positive rational a = u/w in lowest terms is log max(u, w)
(Rat.mulHeight₁_eq_max), and |log a| = |log u − log w| ≤ log max(u, w); hence A_j ≥ max(D·h(a_j), |λ_j|,
0.16).
3. Matveev's constant is C_1(n, 1)·D²·log(eD) with C_1(n, 1) ≤ (en/2)·30^{n+3}·n^{3.5} and D²·log(eD) = 1; the
factor log(eB*) with B* = max|b_j| is at most log(eB).
4. For the second form bound A_j ≤ log A′ for j < n and A_n ≤ log A, which holds because A, A′ ≥ 2 > e^{0.16}.

*Checks.*

- For n = 1 the bound is |b_1 log a_1| > exp(−C(1)·A_1·log(eB)), consistent with the trivial bound |log a_1| ≥
log(1 + 1/H(a_1)).
- The hypothesis a_j ≠ 1 is needed: Matveev's corollary takes nonzero logarithms.
- With a_1 = 2, a_2 = 3, b = (b_1, b_2) and B = max(|b_1|, |b_2|) it gives |b_1 log 2 + b_2 log 3| >
exp(−C(2)·log 3·log 2·log(eB)), the shape used for |2^{b_1}3^{b_2} − 1|.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.3/matveev-corollary-linear-form-bound`
- `mathlib:Rat.mulHeight₁_eq_max`
- `mathlib:NumberField.absLogHeight₁`

*Sources.*

- tijdeman-catalan-1976, §2, Theorem 2, p. 198, and Theorem B (Baker), p. 199: Tijdeman's two Baker-type lower
bounds for linear forms in logarithms of algebraic numbers of bounded degree, one with an explicit exponent
of the logarithm of the height bound for all but the last number, the other with the product of the
logarithmic heights; his proof of Theorem 1 uses them only for rational numbers with n = 2 or 3.
- matveev-linear-forms-2000, §2, Corollary 2.3, p. 1219: Matveev's explicit lower bound for a nonzero linear
form in logarithms, whose dependence on the heights is the product of the A_j; specialised here to the field
ℚ.

### 4.9 Thue equations and systems of Pell equations over S-integers

Thue equations with split forms and systems of two Pell-type equations over the S-integers of a number field,
each in an effective form closed on the unit-equation theorems of §4.3 and §4.5 and in the explicit form of
Győry–Yu; and the uniform bound for the number of solutions of F(x, y) = 1, requested by ArithmeticStatistics.

<a id="thue-equation-over-s-integers-effective"></a>
#### Effective finiteness of Thue equations over the S-integers

`DT.4/thue-equation-over-s-integers-effective` · theorem · Lean: `binaryFormEval`, `thue_sInteger_finite` · planet: *Thue equations over S-integers*

Let M be a number field, T a finite set of nonzero primes of 𝓞_M, β ∈ M^× and F ∈ M[X, Y] a binary form of
degree n ≥ 3 with nonzero discriminant that splits into linear factors over M. Then {(x, y) ∈ 𝓞_T² : F(x, y)
= β} is finite, and an explicitly computable finite set contains it: there are a finite set of pairs (a, b)
∈ (M^×)², computable from F, β, T, and a finitely generated group Γ ⊆ M^× with generators computable from M
and T, such that every solution determines a solution (X, Y) ∈ Γ² of one of the unit equations aX + bY = 1,
which lie in the explicit region of DT.4/gyory-equation-exponent-bound, and the solution is recovered from
(X, Y) up to the at most n choices of an n-th root.

*Hypotheses.*

- M a number field, T finite
- F ∈ M[X, Y] of degree n ≥ 3, disc F ≠ 0, F a product of linear forms over M
- β ≠ 0

*Proof sketch.*

1. Write F = l_1⋯l_n with pairwise non-proportional linear forms l_i = λ_iX + μ_iY (disc F ≠ 0) and choose δ ∈
𝓞_M nonzero with δλ_i, δμ_i, δ^nβ ∈ 𝓞_M. For a solution, the T-integers δl_i(x, y) have product δ^nβ, so
each divides δ^nβ in 𝓞_T.
2. After multiplying by an element of Γ := Γ_P (P := T; generated by 𝓞_M^× and generators of 𝔭^h, 𝔭 ∈ T) each
δl_i(x, y) lies in 𝓞_M with ord_𝔮 ≤ ord_𝔮(δ^nβ) outside T, so DT.4/s-integral-divisor-representation (with
its class-group step principal-generators-of-class-group-powers) gives δl_i(x, y) ∈ μ_iΓ with μ_i in an
explicit finite set.
3. Three of the forms satisfy c_1l_1 + c_2l_2 + c_3l_3 = 0 with all c_i ≠ 0 (three pairwise non-proportional
forms in two variables; DT.4/siegel-identity for l_i = X − θ_iY); dividing by c_3l_3 gives a(γ_1/γ_3) +
b(γ_2/γ_3) = 1 with γ_i ∈ Γ and (a, b) from a finite set.
4. DT.4/gyory-effective-finiteness bounds the exponents of γ_1/γ_3, γ_2/γ_3 explicitly, so l_1(x, y)/l_3(x, y)
takes finitely many computable values; l_3(x, y) ≠ 0 because F(x, y) ≠ 0. Each value fixes the ratio x : y,
and F(x, y) = β then fixes (x, y) up to an n-th root of unity in M.
5. Coefficients of the linear factors need not be integral. Choose one nonzero denominator δ ∈ 𝓞_K so that all
δl_i have S-integral coefficients, and replace the right-hand side by δ^{deg F}β. Apply the
divisor-representative and unit-equation arguments to these integral values; undoing this fixed scaling only
changes the computable bound.

*Checks.*

- For M = ℚ, T = ∅ this is Thue's theorem (DT.4/thue-equation-effective-bound) with the content of F absorbed
into δ.
- For n = 2 the conclusion fails: x² − 2y² = 1 has infinitely many solutions in ℤ², which is why n ≥ 3 is
required.
- The splitting hypothesis is harmless: replace M by a splitting field of F and T by the primes above it.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/siegel-identity`
- `DiophantineApproximationAndTranscendence:DT.4/s-integral-divisor-representation`
- `DiophantineApproximationAndTranscendence:DT.4/principal-generators-of-class-group-powers`
- `DiophantineApproximationAndTranscendence:DT.4/gyory-effective-finiteness`
- `DiophantineApproximationAndTranscendence:DT.4/gyory-equation-exponent-bound`
- `mathlib:Set.integer`

*Sources.*

- evertse-dio-notes-ch5, Chapter 5, proof of Theorem 5.13 and the remark on Thue equations over rings of
integers, printed pp. 97–99: Evertse proves Thue's theorem effectively over ℤ by reducing to unit equations
with Siegel's identity and notes that the same holds for Thue equations with unknowns in the integers of a
number field.
- bugeaud-gyory-thue-mahler-1996, §2, Theorems 1–2 and the reduction in §6, pp. 274–283: Bugeaud and Győry
give explicit bounds for Thue–Mahler equations over the S-integers by the same reduction to S-unit
equations.

<a id="thue-equation-over-s-integers-explicit"></a>
#### Explicit bound for Thue equations over the S-integers (BEG Proposition 3.11)

`DT.4/thue-equation-over-s-integers-explicit` · theorem · Lean: `thue_sInteger_absLogHeight_le`, `thueConstant`, `maxNormS`, `prodNormS`

Let K be a number field of degree d, S a finite set of places containing the infinite ones, of cardinality
s, P_S := max N𝔭 and Q_S := ∏N𝔭 over the primes of S (both 1 if there are none), R_S the S-regulator, β ∈
K^×, and F = Σ_i a_iX^{n−i}Y^i ∈ K[X, Y] a binary form of degree n ≥ 3 with nonzero discriminant splitting
into linear factors over K, with max_i h(a_i) ≤ A and h(β) ≤ B. Then every (x, y) ∈ 𝓞_S² with F(x, y) = β
satisfies max(h(x), h(y)) ≤ c_1(s, d)·n⁶·P_S·R_S·(1 + log* R_S/log* P_S)·(R_K + (h_K/d)·log Q_S + ndA + B),
with c_1(s, d) := s^{2s+4}·2^{7s+60}·d^{2s+d+2}.

*Hypotheses.*

- K a number field of degree d, S ⊇ S_∞ finite, s = #S
- F of degree n ≥ 3, disc F ≠ 0, split over K
- β ≠ 0, heights bounded by A and B

*Proof sketch.*

1. Read Győry–Yu Corollary 3, p. 16, and its proof, pp. 38–39. First choose δ ∈ 𝓞_K clearing the coefficients
with h(δ) ≤ ndA. Their Lemma 3 balances δ^nβ by an ordinary unit; the resulting integral equation has
coefficient and right-hand-side height bounds controlled by A, B, R_K and log Q_S. Apply their Theorem 3 for
the split triangularly connected binary form, and undo the scaling. This is the explicit refinement of the
effective unit-equation reduction.
2. Theorem 3 is proved on pp. 34–37 by connected chains of linear factors: every triangle gives a two-term
S-unit equation, the explicit S-unit bound controls ratios after a common unit scaling, and Cramer’s rule
for two independent factors recovers the coordinates. Its exact constants inherit the Yu 2007 gap and the
independent-height-product gap.
3. The BEG contract above is retained as the source statement. Its short comparison with Győry–Yu needs
separate care: Győry–Yu impose A ≥ 1 and define c₃ = 0 in unit rank zero, so a comparison simply multiplying
by c₃ is not a proof. Record the low-height floor and rank-zero constant absorption as a precise gap.
Applying the original theorem with max(1,A) and max(1,c₃) gives a sound explicit alternative; deriving BEG’s
smaller displayed contract still needs that absorption.

*Checks.*

- For K = ℚ, S = {∞}: s = 1, P_S = Q_S = 1, R_S = 1, and the bound reads max(h(x), h(y)) ≤ 2^{67}·n⁶·(1 + nA +
B)·2.
- The bound is linear in A and B, as the S-unit method predicts.
- The S-regulator itself is not monotone in S: over ℚ, R_∅ = 1 whereas R_{(2)} = log 2 < 1. No monotonicity
claim about the whole bound is used.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/thue-equation-over-s-integers-effective`
- `DiophantineApproximationAndTranscendence:DT.4/baker-bound-at-a-place`
- `DiophantineApproximationAndTranscendence:DT.4/fundamental-s-units-of-bounded-height`
- `DiophantineApproximationAndTranscendence:DT.4/small-representative-modulo-s-unit-powers`
- `DiophantineApproximationAndTranscendence:DT.4/s-regulator`
- `DiophantineApproximationAndTranscendence:DT.4/s-norm`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.6, Proposition 3.11 and its proof, p. 13 (arXiv v1 pagination;
published pagination adds 726).: Bérczes–Evertse–Győry state the explicit height bound for the solutions of
Thue equations over the S-integers with split binary form, as an easy consequence of Győry–Yu's Corollary 3.
- gyory-yu-2006, p. 16, Corollary 3: Győry–Yu's explicit bound for Thue equations over the S-integers.

<a id="pell-system-over-s-integers-effective"></a>
#### Effective finiteness of systems of two Pell-type equations over the S-integers

`DT.4/pell-system-over-s-integers-effective` · theorem · Lean: `pellSystem_sInteger_finite`

Let M be a number field, T a finite set of nonzero primes, and γ_1, γ_2, γ_3, β_12, β_13 ∈ M^× with β_12 ≠
β_13 and κ_2 := √(γ_1/γ_2), κ_3 := √(γ_1/γ_3) ∈ M. Then the system γ_1x_1² − γ_2x_2² = β_12, γ_1x_1² −
γ_3x_3² = β_13 has finitely many solutions (x_1, x_2, x_3) ∈ 𝓞_T³, contained in an explicitly computable
finite set.

*Hypotheses.*

- M a number field, T finite
- γ_i, β_12, β_13 ∈ M^×, β_12 ≠ β_13
- √(γ_1/γ_2), √(γ_1/γ_3) ∈ M

*Proof sketch.*

1. Put κ_23 := κ_3/κ_2 (a square root of γ_2/γ_3) and β_23 := β_13 − β_12 ≠ 0. The six linear forms u_± :=
κ_2x_1 ± x_2, v_± := κ_3x_1 ± x_3, w_± := κ_23x_2 ± x_3 satisfy u_+u_− = β_12/γ_2, v_+v_− = β_13/γ_3 and
w_+w_− = β_23/γ_3, so all six are nonzero and, as in thue-equation-over-s-integers-effective, each lies in
μ·Γ_T with μ from an explicit finite set (DT.4/s-integral-divisor-representation).
2. They satisfy the three-term identities κ_23u_+ − v_+ = w_− and κ_23u_− − v_− = −w_− (Evertse's Exercise 5.6
hint), so u_±/w_− and v_±/w_− solve two-term unit equations with coefficients from a finite set;
DT.4/gyory-effective-finiteness gives finitely many values, explicitly.
3. Knowing the ratios u_+/w_−, u_−/w_− and the product u_+u_−, w_−² and hence w_− (up to sign), u_±, v_± are
determined; then x_1 = (u_+ + u_−)/(2κ_2), x_2 = (u_+ − u_−)/2, x_3 = (v_+ − v_−)/2.
4. Coefficients of the linear factors need not be integral. Choose one nonzero denominator δ ∈ 𝓞_K so that all
δl_i have S-integral coefficients, and replace the right-hand side by δ^{deg F}β. Apply the
divisor-representative and unit-equation arguments to these integral values; undoing this fixed scaling only
changes the computable bound.

*Checks.*

- The system x_1² − 2x_2² = 1, x_1² − 3x_3² = 4 over ℤ needs √(1/2), √(1/3) ∈ M, so one works in M = ℚ(√2, √3)
with T = ∅.
- A single equation γ_1x_1² − γ_2x_2² = β_12 has infinitely many solutions in general (Pell); the second
equation is what makes the set finite.
- If β_12 = β_13 the identities degenerate (w_± are no longer nonzero), and the system can have infinitely
many solutions (x_2 = ±x_3 when γ_2 = γ_3).

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/s-integral-divisor-representation`
- `DiophantineApproximationAndTranscendence:DT.4/principal-generators-of-class-group-powers`
- `DiophantineApproximationAndTranscendence:DT.4/gyory-effective-finiteness`
- `mathlib:Set.integer`

*Sources.*

- evertse-dio-notes-ch5, Chapter 5, Exercise 5.6 and its hint; remark before Theorem 5.15, printed pp. 99 and
105: Evertse reduces a system of two quadratic equations to unit equations through two three-term identities
between linear forms in square roots of the coefficients, and notes that hyperelliptic equations lead to
such systems.
- berczes-evertse-gyory-superelliptic-2013, §3.6, proof of Proposition 3.12, pp. 13–14 (arXiv v1 pagination;
published pagination adds 726).: Bérczes–Evertse–Győry multiply the three quadratic forms to a decomposable
form of degree 6 whose linear factors form a connected graph under three-term relations.

<a id="pell-system-over-s-integers-explicit"></a>
#### Explicit bound for systems of Pell equations over the S-integers (BEG Proposition 3.12)

`DT.4/pell-system-over-s-integers-explicit` · theorem · Lean: `pellSystem_sInteger_absLogHeight_le`

With K, S, s, P_S, Q_S, R_S, c_1(s, d) as in thue-equation-over-s-integers-explicit, let γ_1, γ_2, γ_3,
β_12, β_13 ∈ K^× with β_12 ≠ β_13, √(γ_1/γ_2), √(γ_1/γ_3) ∈ K, h(γ_i) ≤ A and h(β_12), h(β_13) ≤ B. Then
every solution (x_1, x_2, x_3) ∈ 𝓞_S³ of γ_1x_1² − γ_2x_2² = β_12, γ_1x_1² − γ_3x_3² = β_13 satisfies max_i
h(x_i) ≤ c_1(s, d)·P_S·R_S·(1 + log* R_S/log* P_S)·(R_K + (h_K/d)·log Q_S + dA + B).

*Hypotheses.*

- as in pell-system-over-s-integers-effective, with K in place of M
- heights bounded by A and B

*Proof sketch.*

1. Put u_i = √(γ_i/γ₁)X_i. The six factors u₁±u₂, u₁±u₃, u₂±u₃ have rank three and a connected triangle graph:
for example (u₁−u₂)+(u₂−u₃)=u₁−u₃; analogous triangles connect both signs. Multiply by a common denominator
to make all factors integral and apply Győry–Yu Theorem 3 with nonzero product right-hand side
β₁₂β₁₃(β₁₃−β₁₂), then undo the fixed scalar and square-root changes of coordinates.
2. Győry–Yu Theorem 3 and proof, pp. 15–16 and 34–37, give the explicit coordinate bound from the triangle
S-unit estimates. The coefficient heights are bounded in terms of A and the right-hand-side height by 4B+log
2; recovering the original coordinates adds at most the square-root coefficient heights.
3. As for the Thue bound, the exact BEG constant is a verified source contract whose comparison still has the
recorded A < 1 and rank-zero c₃ gap. The two explicit S-unit inputs are the independent-height-product bound
and the exact finite-place Yu 2007 bound; neither is replaced by an unproved assertion about the Yu 1994
constant.

*Checks.*

- The bound is the Thue bound without the factor n⁶ and with n replaced by 1 in nA.
- β_12 ≠ β_13 is essential, as in the effective version.
- For K = ℚ(√2, √3), S the four infinite places (s = 4), γ = (1, 2, 3) the system x_1² − 2x_2² = β_12, x_1² −
3x_3² = β_13 has solutions bounded by this formula.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/pell-system-over-s-integers-effective`
- `DiophantineApproximationAndTranscendence:DT.4/baker-bound-at-a-place`
- `DiophantineApproximationAndTranscendence:DT.4/fundamental-s-units-of-bounded-height`
- `DiophantineApproximationAndTranscendence:DT.4/small-representative-modulo-s-unit-powers`
- `DiophantineApproximationAndTranscendence:DT.4/s-regulator`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §3.6, Proposition 3.12 and its proof, pp. 13–14 (arXiv v1
pagination; published pagination adds 726).: Bérczes–Evertse–Győry derive the explicit bound for the system
from Győry–Yu's theorem on decomposable form equations with a connected graph of linear factors.
- gyory-yu-2006, Theorem 3: Győry–Yu's explicit bound for decomposable form equations.

<a id="primitive-binary-form-linear-factor-ideal"></a>
#### Linear factors of a primitive irreducible binary form generate a fixed ideal

`DT.4/primitive-binary-form-linear-factor-ideal` · lemma · Lean: `primitive_binaryForm_ideal`

Let F ∈ ℤ[X, Y] be an irreducible binary form of degree n ≥ 1 whose coefficients have greatest common
divisor 1, with a₀ := F(1, 0) ≠ 0. Let θ be a zero of F(X, 1), L := ℚ(θ) (of degree n) and 𝔞_θ := the
fractional ideal of 𝓞_L generated by 1 and θ. Then (i) the absolute norm of 𝔞_θ is 1/|a₀|; (ii) for (x, y) ∈
ℤ², x − θy ∈ 𝔞_θ and the integral ideal (x − θy)·𝔞_θ^{−1} has absolute norm |F(x, y)|; (iii) consequently,
if F(x, y) = ±1 then (x − θy)𝓞_L = 𝔞_θ, so any two such solutions give elements x − θy differing by a unit
of 𝓞_L.

*Hypotheses.*

- F ∈ ℤ[X, Y] homogeneous of degree n ≥ 1, irreducible over ℚ, with coprime coefficients
- a₀ = F(1, 0) ≠ 0
- θ a complex zero of F(X, 1), L = ℚ(θ)

*Proof sketch.*

1. Let G be the Galois closure of L and θ₁ = θ, …, θ_n the conjugates. In G[X], F(X, 1) = a₀∏_i(X − θ_i).
2. Gauss's lemma for content ideals over the Dedekind domain 𝓞_G (content-ideal-gauss-lemma) gives [F(X, 1)]_G
= [a₀]_G·∏_i [1, θ_i]_G; since the coefficients of F are coprime integers the left side is 𝓞_G, so ∏_i [1,
θ_i]_G = [a₀]_G^{−1}.
3. The absolute norm is invariant under the automorphisms of G and satisfies N_G(𝔞𝓞_G) = N_L(𝔞)^{[G:L]}; taking
absolute norms gives N_L(𝔞_θ)^{n[G:L]} = |a₀|^{−n[G:L]}, hence (i).
4. x − θy lies in 𝔞_θ because x, y ∈ ℤ; the principal ideal (x − θy) has absolute norm |N_{L/ℚ}(x − θy)| =
|∏_i(x − θ_i y)| = |F(x, y)|/|a₀|, and dividing by N_L(𝔞_θ) = 1/|a₀| gives (ii).
5. (iii): an integral ideal of norm 1 is the unit ideal.

*Checks.*

- For F = X³ − 2Y³: a₀ = 1, θ = ∛2, 𝔞_θ = 𝓞_L, and x − θy is a unit exactly when F(x, y) = ±1.
- For F = 2X² + XY + Y² (irreducible, primitive): N(𝔞_θ) = 1/2, so 𝔞_θ is not integral.
- The primitivity hypothesis matters: for 2F the content is 2 and (i) fails.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/content-ideal-gauss-lemma`
- `mathlib:Ideal.absNorm_span_singleton`
- `mathlib:FractionalIdeal.absNorm`
- `mathlib:Algebra.norm_eq_prod_embeddings`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §4, proof of Lemma 4.2(i), Gauss's lemma [f] = [a₀]∏[1, α_i], p.
17 (arXiv v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry use Gauss's lemma for the
content ideals of the linear factors of a polynomial over a number field and compare the ideals generated by
x − α_i with those generated by 1 and α_i.
- evertse-dio-notes-ch5, Chapter 5, proof of Theorem 5.13, printed pp. 97–98: Evertse reduces Thue equations
to unit equations by writing the linear factors x − θ_i y as fixed elements times units, after making the
form monic.

<a id="uniform-bound-for-thue-equations"></a>
#### A uniform bound for the number of solutions of Thue equations F(x, y) = 1

`DT.4/uniform-bound-for-thue-equations` · theorem · Lean: `uniform_thue_bound`, `uniform_cubic_thue_bound`

For every n ≥ 3 there is an explicit N(n) such that for every binary form F ∈ ℤ[X, Y] of degree n with
nonzero discriminant, #{(x, y) ∈ ℤ² : F(x, y) = 1} ≤ N(n); one may take N(n) := max(2·A(2, 2(n(n − 1)(n − 2)
− 1)) + 2, 16), where A(2, r) = exp(12⁶(r + 1)) is the Evertse–Schlickewei–Schmidt bound for the number of
solutions of a two-term unit equation in a group of rank r. In particular there is an absolute bound for
cubic forms (N(3) ≤ 2·exp(12⁶·11) + 2). Sharper absolute values (12 by Delone–Nagell and Evertse, 10 by
Bennett) are not planned here.

*Hypotheses.*

- n ≥ 3
- F ∈ ℤ[X, Y] homogeneous of degree n
- disc F ≠ 0

*Proof sketch.*

1. If the coefficients of F have a common factor ≥ 2 there is no solution. Otherwise factor F = ∏_j G_j into
irreducible primitive forms over ℤ (Gauss's lemma in ℤ[X, Y]); F(x, y) = 1 forces G_j(x, y) = ±1 for all j,
and the G_j are pairwise non-proportional because disc F ≠ 0.
2. Some G_j of degree d ≥ 3: if G_j(1, 0) = 0 replace G_j by G_j(X, Y + kX) for some k with G_j(1, k) ≠ 0, a
unimodular change of variables that preserves the number of solutions. Pick distinct zeros θ₁, θ₂, θ₃ of
G_j(X, 1), M := ℚ(θ₁, θ₂, θ₃) (degree ≤ d(d − 1)(d − 2)) and one solution (x₀, y₀). By
primitive-binary-form-linear-factor-ideal(iii) x − θ_i y = (x₀ − θ_i y₀)·ε_i with ε_i ∈ 𝓞_M^×.
3. Siegel's identity (DT.4/siegel-identity) turns this into a·(ε₁/ε₃) + b·(ε₂/ε₃) = 1 with fixed a, b ∈ M^×;
every solution of a two-term unit equation is non-degenerate, so by
DT.2/uniform-bound-nondegenerate-solutions applied to Γ = (𝓞_M^×)², of rank ≤ 2(n(n − 1)(n − 2) − 1)
(Dirichlet), there are at most A(2, 2r) pairs.
4. Each pair determines λ = (x − θ₁y)/(x − θ₃y) and, for y ≠ 0, x/y = (θ₁ − λθ₃)/(1 − λ); a ratio determines
the coprime solution up to the sign t = ±1 (t^d·G_j(x′, y′) = ±1); and y = 0 gives at most 2 solutions.
Hence at most 2A + 2 solutions.
5. If all irreducible factors have degree at most two, select two distinct factors. Two linear equations G₁ =
±1, G₂ = ±1 give at most four points. A linear and an irreducible quadratic give at most two points on each
of the four affine lines prescribed by the signs, hence at most eight: restriction of the quadratic cannot
be constant, since its leading part would vanish on a rational direction and make the binary quadratic
reducible. Two quadratics give, for each sign pair, the nonzero homogeneous quadratic ε₂G₁ − ε₁G₂ = 0, hence
at most two lines through the origin and at most two points per line, giving sixteen. This handles mixed
degrees without treating their difference as homogeneous.

*Checks.*

- For n = 3 the bound is absolute, which is the request of
ArithmeticStatistics:ST.1/fibres-of-the-embedding-are-uniformly-bounded.
- F = X³ − 2Y³ has the solutions (1, 0) and (−1, −1) of F = 1, so N(3) ≥ 2 is forced.
- The hypothesis disc F ≠ 0 is needed: F = (X − Y)³ has the infinitely many solutions (y + 1, y) of F = 1.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/primitive-binary-form-linear-factor-ideal`
- `DiophantineApproximationAndTranscendence:DT.4/siegel-identity`
- `DiophantineApproximationAndTranscendence:DT.2/uniform-bound-nondegenerate-solutions`
- `mathlib:NumberField.Units.rank`
- `mathlib:Polynomial.IsPrimitive`
- `mathlib:NumberField.Units.finrank_eq`

*Sources.*

- evertse-dio-notes-ch5, Chapter 5, proof of Theorem 5.13 (reduction of Thue equations to unit equations by
Siegel's identity), printed pp. 97–98: Evertse's reduction of a Thue equation to finitely many two-term unit
equations, which is the reduction used here with fixed coefficients.
- evertse-schlickewei-schmidt-linear-equations-2002, Theorem 1.1 (the bound A(n, r) for non-degenerate
solutions): Evertse, Schlickewei and Schmidt bound the number of non-degenerate solutions of a linear
equation in unknowns from a multiplicative group of finite rank, uniformly in the coefficients.

### 4.10 Superelliptic and hyperelliptic equations over S-integers

BEG §4: the factors x − α_i are m-th powers up to a bounded ideal, hence x − α_i = γ_iξ_i^m with γ_i from a
finite set (with an explicit height bound); subtracting two such decompositions gives a Thue equation (m ≥ 3),
three give a Pell system (m = 2). This yields Baker's theorem over S-integers and BEG's Theorems 2.1 and 2.2.

<a id="superelliptic-factor-coprimality"></a>
#### The two factors of f(x) are almost coprime (BEG (4.9)–(4.10))

`DT.4/superelliptic-factor-coprimality` · lemma · stated in this document only

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S. Put
α := α_1, L := L_1, T := T_1, g := (X − α_2)⋯(X − α_n) ∈ L[X], and write [·] for fractional ideals of 𝓞_T.
For every x ∈ 𝓞_S: (i) [x − α][1, α]^{−1} + [g(x)][g]^{−1} ⊇ [D(f)][f]^{−(2n−2)}; (ii) if f(x) = b·y^m with
y ∈ 𝓞_S, then [b][f]^{−1}[y]^m = ([x − α][1, α]^{−1})·([g(x)][g]^{−1}). All four ideals [x − α][1, α]^{−1},
[g(x)][g]^{−1}, [α − α_i][1, α]^{−1}[1, α_i]^{−1} and [D(f)][f]^{−(2n−2)} are integral. The third ideal in
the integrality list lives over the splitting field; the other three and the inclusions (i),(ii) are defined
over L.

*Hypotheses.*

- the setting of BEG §4 (stated)
- x ∈ 𝓞_S

*Proof sketch.*

1. Over the splitting field: α − α_i = (x − α_i)·1 − (x − α)·1 gives [α − α_i] ⊆ [x − α_i][1, α] + [x − α][1,
α_i]; dividing by [1, α][1, α_i], [x − α][1, α]^{−1} + [x − α_i][1, α_i]^{−1} ⊇ [α − α_i][1, α]^{−1}[1,
α_i]^{−1}.
2. Multiplying over i = 2, …, n and using 𝔞 + ∏𝔟_i ⊇ ∏(𝔞 + 𝔟_i): the left side of (i) contains ∏_{i≥2}[α −
α_i][1, α]^{−1}[1, α_i]^{−1}, which contains ∏_j∏_{i≠j}[α_j − α_i][1, α_j]^{−1}[1, α_i]^{−1} =
[D(f)][f]^{−(2n−2)} by Gauss's lemma [f] = [a_0]∏[1, α_j] (content-ideal-gauss-lemma) and D(f) =
±a_0^{2n−2}∏_{i≠j}(α_i − α_j) (Tau Ceti Polynomial.discr_prod_X_sub_C).
3. (ii): f(x) = a_0(x − α)g(x) and [f] = [a_0][1, α][g].
4. The two normalized factors, their sum and product, and the discriminant/content ideal are defined over L.
Their inclusion descends from the splitting field because extension of fractional ideals along the integral
Dedekind extension is injective. Do not descend the individual pairwise root ideals, whose other root need
not lie in L.

*Checks.*

- For K = ℚ, S = ∅, f = X² − 1, α = 1: (i) says (x − 1) + (x + 1) ⊇ (4) = (D(f)), consistent with gcd(x − 1, x
+ 1) ∣ 2.
- For f = 2X(X − 3) (Evertse's example (5.8)) and α = 0: (i) says (x) + (x − 3) ⊇ (9) = [D(f)][f]^{−2},
consistent with gcd(x, x − 3) ∣ 3.
- Inclusion (i) is an ideal-theoretic gcd statement and does not need y.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/content-ideal-gauss-lemma`
- `tauceti:Polynomial.discr_prod_X_sub_C`
- `mathlib:Polynomial.discr`
- `mathlib:Set.integer`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §4, proof of Lemma 4.2(i), formulas (4.9)–(4.10), pp. 16–17 (arXiv
v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry show that the ideals generated by x −
α and g(x), normalised by the content ideals, have a sum containing the discriminant over the content power,
and express b·y^m as their product.

<a id="superelliptic-ideal-power-decomposition"></a>
#### x − α is an m-th power up to a bounded ideal (BEG Lemma 4.2(i))

`DT.4/superelliptic-ideal-power-decomposition` · lemma · Lean: `superelliptic_ideal_power_decomposition`

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S. Let
x, y ∈ 𝓞_S with f(x) = b·y^m and y ≠ 0. Then for each i there are integral ideals 𝔆_i, 𝔄_i of 𝓞_{T_i} with
[a_0(x − α_i)] = 𝔆_i𝔄_i^m and 𝔆_i ⊇ [a_0bD(f)]^{m−1}; in particular every prime of 𝓞_{T_i} dividing 𝔆_i
divides a_0bD(f).

*Hypotheses.*

- the setting of BEG §4
- f(x) = b·y^m, y ≠ 0

*Proof sketch.*

1. Take i = 1 (the others are symmetric). For a prime P of 𝓞_T not dividing a_0bD(f): P does not divide [f]
(D(f) ∈ [f]^{2n−2}), so by superelliptic-factor-coprimality (i) it divides at most one of the two integral
factors in (ii), whose product has P-order ≡ 0 (mod m); hence ord_P([x − α][1, α]^{−1}) ≡ 0 (mod m).
2. [a_0][1, α] is integral (a_0α is integral) and contains a_0, so it is prime to P; therefore ord_P(a_0(x −
α)) ≡ 0 (mod m).
3. For the finitely many primes dividing a_0bD(f) write ord_P(a_0(x − α)) = m·q_P + r_P with 0 ≤ r_P < m and
collect ∏P^{r_P} into 𝔆; then r_P ≤ (m − 1)·ord_P(a_0bD(f)) gives 𝔆 ⊇ [a_0bD(f)]^{m−1}.

*Checks.*

- Evertse's example y³ = 2x(x − 3): 2x and x − 3 are cubes times divisors of powers of 6.
- For f monic with D(f) = ±1 and b = 1 one gets 𝔆 = (1): x − α generates an m-th power of an ideal.
- The bound on 𝔆 does not depend on x.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-factor-coprimality`
- `mathlib:Set.integer`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §4, Lemma 4.2(i) and its proof, pp. 16–17 (arXiv v1 pagination;
published pagination adds 726).: Bérczes–Evertse–Győry show that the ideal generated by a_0(x − α) is an
m-th power times an ideal dividing (a_0bD(f))^{m−1}.

<a id="superelliptic-power-decomposition"></a>
#### x − α = γξ^m with γ from an effectively computable finite set

`DT.4/superelliptic-power-decomposition` · lemma · Lean: `exists_finset_superelliptic_power_decomposition`, `primesAbove`

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S.
There is a finite set Γ_{i,m} ⊂ L_i^×, computable from K, S, f, b and m, such that for every solution x, y ∈
𝓞_S of f(x) = b·y^m with y ≠ 0 one has x − α_i = γ_iξ_i^m with γ_i ∈ Γ_{i,m} and ξ_i ∈ 𝓞_{T_i}.

*Hypotheses.*

- the setting of BEG §4
- f(x) = b·y^m, y ≠ 0

*Proof sketch.*

1. By superelliptic-ideal-power-decomposition, [a_0(x − α)] = 𝔆𝔄^m with 𝔆 from the finite set of divisors of
[a_0bD(f)]^{m−1}.
2. By minkowski-cofactor-for-ideals choose ξ_1 ∈ 𝔄 with (ξ_1) = 𝔅𝔄 and γ_1 with (γ_1) = 𝔇𝔆, where 𝔅, 𝔇 have
T-norm at most |D_L|^{1/2}; there are finitely many such ideals, and generators can be fixed for the
principal ones.
3. Then a_0(x − α) = (γ_1/γ_2)·ξ_1^m with (γ_2) = 𝔇𝔅^m, so γ_2 runs over generators of finitely many principal
ideals, each determined up to a T-unit.
4. The T-units modulo m-th powers form a finite group (𝓞_T^× is finitely generated by s-unit-rank;
Subgroup.finiteIndex_range_powMonoidHom_of_fg), so after moving m-th powers of T-units into ξ the factor γ
:= a_0^{−1}γ_1γ_2^{−1}·η runs over a finite computable set.

*Checks.*

- For Evertse's example y³ = 2x(x − 3) (K = ℚ, S = ∅, α = 0, a_0 = 2): 2x = a·u³ with a ∈ {±2^k3^l : 0 ≤ k, l
≤ 2}, so x − 0 = (a/2)·u³ and Γ ⊆ {±2^{k−1}3^l : 0 ≤ k, l ≤ 2}.
- If L has class number 1 and S = ∅, the ideals 𝔅, 𝔇 can be taken trivial, and Γ is a set of divisors of
(a_0bD(f))^{m−1} times unit representatives.
- The set Γ depends on m, which matters for variable exponents
(superelliptic-variable-exponent-decomposition).

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-ideal-power-decomposition`
- `DiophantineApproximationAndTranscendence:DT.4/minkowski-cofactor-for-ideals`
- `DiophantineApproximationAndTranscendence:DT.4/s-unit-rank`
- `mathlib:Subgroup.finiteIndex_range_powMonoidHom_of_fg`
- `DiophantineApproximationAndTranscendence:DT.4/s-norm`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §4, proof of Lemma 4.2(ii), pp. 17–18 (arXiv v1 pagination;
published pagination adds 726).: Bérczes–Evertse–Győry write a_0(x − α) as γ_1γ_2^{−1}ξ_1^m with γ_1, γ_2
generating ideals of small norm and then normalise by m-th powers of T-units.
- evertse-dio-notes-ch5, Chapter 5, worked example (5.8), printed pp. 98–99: Evertse's example reduces y³ =
2x(x − 3) to finitely many Thue equations by writing 2x = au³, x − 3 = bv³ with a, b from a finite set.

<a id="superelliptic-power-decomposition-height-bound"></a>
#### x − α = γξ^m with an explicit height bound for γ (BEG Lemma 4.2(ii))

`DT.4/superelliptic-power-decomposition-height-bound` · lemma · Lean: `superelliptic_power_decomposition_absLogHeight_le`

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S. For
every solution x, y ∈ 𝓞_S of f(x) = b·y^m with y ≠ 0 there are γ_i ∈ L_i^× and ξ_i ∈ 𝓞_{T_i} with x − α_i =
γ_iξ_i^m and h(γ_i) ≤ m·(n³d)^{nd}·e^{2nd·ĥ}·|D_K|^n·(80(dn)^{dn+2} + (1/d)·log Q_S), Q_S := ∏_{𝔭∈S}N𝔭.

*Hypotheses.*

- the setting of BEG §4
- f(x) = b·y^m, y ≠ 0

*Proof sketch.*

1. As in superelliptic-power-decomposition, a_0(x − α) = (γ_1/γ_2)ξ_1^m with N_T(γ_1) ≤
|D_L|^{1/2}N_T(a_0bD(f))^{m−1} and N_T(γ_2) ≤ |D_L|^{(m+1)/2} (BEG (4.11)).
2. small-representative-modulo-s-unit-powers (BEG Lemma 3.8, constant c = 39d_L^{d_L+2}) gives T-units η_1, η_2
with h(γ_kη_k^m) ≤ d_L^{−1}log N_T(γ_k) + m(cR_L + (h_L/d_L)log Q_T); put γ :=
a_0^{−1}γ_1γ_2^{−1}(η_1η_2^{−1})^m and ξ := η_2η_1^{−1}ξ_1.
3. Bound the terms: d_L^{−1}log N_T(a_0bD(f)) ≤ h(a_0bD(f)) ≤ (2n − 1)log n + 2nĥ (s-norm,
discriminant-size-bound); |D_L| ≤ n^{(2n−1)d}e^{(2n−2)dĥ}|D_K|^n (discriminant-of-root-field-bound, k = 1);
max(h_L, R_L) ≤ 5|D_L|^{1/2}(log*|D_L|)^{nd−1} (class-number-and-regulator-bounds); Q_T ≤ Q_S^{[L:K]}
(s-norm).
4. Inserting these into (4.12) gives the stated bound (BEG (4.13)–(4.15)).

*Checks.*

- The bound is linear in m, which BEG's Theorem 2.1 needs.
- For K = ℚ, S = ∅ it reads h(γ) ≤ m·n^{3n}·e^{2nĥ}·80·n^{n+2}.
- Replacing class-number-and-regulator-bounds by computed h_L, R_L gives a valid bound for a given equation.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-power-decomposition`
- `DiophantineApproximationAndTranscendence:DT.4/small-representative-modulo-s-unit-powers`
- `DiophantineApproximationAndTranscendence:DT.4/discriminant-of-root-field-bound`
- `DiophantineApproximationAndTranscendence:DT.4/discriminant-size-bound`
- `DiophantineApproximationAndTranscendence:DT.4/class-number-and-regulator-bounds`
- `DiophantineApproximationAndTranscendence:DT.4/s-norm`
- `DiophantineApproximationAndTranscendence:DT.4/coefficient-height-of-polynomial`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §4, Lemma 4.2(ii) and its proof, formulas (4.11)–(4.15), pp. 17–18
(arXiv v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry bound the height of γ in x − α
= γξ^m explicitly in terms of m, n, d, ĥ, D_K and Q_S.

<a id="superelliptic-reduction-to-thue-equation"></a>
#### A superelliptic equation with m ≥ 3 reduces to Thue equations over S-integers

`DT.4/superelliptic-reduction-to-thue-equation` · lemma · Lean: `superelliptic_thue_equation`

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S. Let
m ≥ 3 and let x, y ∈ 𝓞_S with f(x) = b·y^m, y ≠ 0, x − α_i = γ_iξ_i^m (i = 1, 2) as in
superelliptic-power-decomposition. Let ρ be a primitive m-th root of unity, M := K(α_1, α_2,
(γ_1/γ_2)^{1/m}, ρ) and T the primes of M above S. Then (ξ_1, ξ_2) ∈ 𝓞_T² solves the Thue equation γ_1X^m −
γ_2Y^m = α_2 − α_1, whose binary form has nonzero discriminant and splits over M into the m pairwise
non-proportional factors X − ρ^kθY times γ_1, with θ^m = γ_2/γ_1; conversely x = α_1 + γ_1ξ_1^m.

*Hypotheses.*

- m ≥ 3
- f(x) = b·y^m, y ≠ 0
- x − α_i = γ_iξ_i^m for i = 1, 2

*Proof sketch.*

1. Subtract the two decompositions: γ_1ξ_1^m − γ_2ξ_2^m = (x − α_1) − (x − α_2) = α_2 − α_1, which is nonzero
since D(f) ≠ 0 (BEG (4.23)).
2. The form γ_1X^m − γ_2Y^m has discriminant ±m^m(γ_1γ_2)^{m−1} ≠ 0 and factors as γ_1∏_k(X − ρ^kθY) over M.
3. The ξ_i are T_i-integers in L_i ⊆ M, hence T-integers of M.

*Checks.*

- For Evertse's example (m = 3, f = 2X(X − 3), b = 1, α_1 = 0, α_2 = 3): γ_1ξ_1³ − γ_2ξ_2³ = 3 is a cubic Thue
equation.
- For m = 2 the binary form γ_1X² − γ_2Y² has only two factors, and Thue's theorem does not apply.
- Each solution of the Thue equation gives at most m values of y with y^m = f(x)/b.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-power-decomposition`
- `mathlib:Polynomial.discr`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §4, proof of Theorem 2.1, formula (4.23), pp. 20–21 (arXiv v1
pagination; published pagination adds 726).: Bérczes–Evertse–Győry subtract the decompositions of x − α_1
and x − α_2 to get a Thue equation of degree m over the T-integers of M, with split binary form of nonzero
discriminant.

<a id="hyperelliptic-reduction-to-pell-system"></a>
#### A hyperelliptic equation reduces to systems of two Pell equations

`DT.4/hyperelliptic-reduction-to-pell-system` · lemma · Lean: `hyperelliptic_pell_system`

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S. Let
m = 2, n ≥ 3, and x, y ∈ 𝓞_S with f(x) = b·y², y ≠ 0, x − α_i = γ_iξ_i² (i = 1, 2, 3) as in
superelliptic-power-decomposition. Let M := K(α_1, α_2, α_3, √(γ_1/γ_2), √(γ_1/γ_3)) (= K(α_1, α_2, α_3,
√(γ_1/γ_3), √(γ_2/γ_3)), the field of BEG's proof of Theorem 2.2), [M:K] ≤ 4n³, and T the primes of M above
S. Then (ξ_1, ξ_2, ξ_3) ∈ 𝓞_T³ solves γ_1ξ_1² − γ_2ξ_2² = α_2 − α_1, γ_1ξ_1² − γ_3ξ_3² = α_3 − α_1, a system
as in pell-system-over-s-integers-effective with β_12 = α_2 − α_1 ≠ β_13 = α_3 − α_1.

*Hypotheses.*

- m = 2, n ≥ 3
- f(x) = b·y², y ≠ 0
- x − α_i = γ_iξ_i² for i = 1, 2, 3

*Proof sketch.*

1. Subtract the decompositions pairwise; α_2 ≠ α_3 gives β_12 ≠ β_13, and α_i distinct gives β_1j ≠ 0.
2. The two fields agree because each pair of square roots generates the third up to sign.
3. [K(α_1, α_2, α_3) : K] ≤ n(n − 1)(n − 2) ≤ n³ and two quadratic steps give [M:K] ≤ 4n³.

*Checks.*

- Evertse's Exercise 5.7, y² = x(2x − 3)(4x − 5), leads to such a system.
- With only two roots (n = 2) one gets a single Pell equation: y² = 2x² + 1 has the infinitely many integral
solutions (2, 3), (12, 17), …, so n ≥ 3 is needed.
- The field M is the same whichever two of the three square roots are adjoined.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-power-decomposition`
- `DiophantineApproximationAndTranscendence:DT.4/pell-system-over-s-integers-effective`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §4, proof of Theorem 2.2, formula (4.30), p. 22; Lemma 4.3(ii), p.
19 (arXiv v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry reduce the hyperelliptic
equation to a system of two equations of Pell type over the T-integers of M, of degree at most 4n³ over K.
- evertse-dio-notes-ch5, Chapter 5, remark before Theorem 5.15 and Exercises 5.6–5.7, printed pp. 99 and 105:
Evertse explains that hyperelliptic equations reduce to systems of two Thue equations of degree 2.

<a id="superelliptic-effective-finiteness-over-s-integers"></a>
#### Effective finiteness of superelliptic and hyperelliptic equations over S-integers

`DT.4/superelliptic-effective-finiteness-over-s-integers` · theorem · Lean: `superelliptic_sInteger_finite`

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S.
Assume n ≥ 3 if m = 2. Then the set of (x, y) ∈ 𝓞_S² with f(x) = b·y^m is finite and contained in an
explicitly computable finite set; in particular an explicit bound for max(h(x), h(y)) can be computed from
K, S, f, b and m.

*Hypotheses.*

- the setting of BEG §4
- m ≥ 3, or m = 2 and n ≥ 3

*Proof sketch.*

1. y = 0 gives the at most n zeros of f in 𝓞_S.
2. For y ≠ 0, superelliptic-power-decomposition gives x − α_i = γ_iξ_i^m with γ_i from finite computable sets.
3. m ≥ 3: superelliptic-reduction-to-thue-equation and thue-equation-over-s-integers-effective give finitely
many computable ξ_1, hence x = α_1 + γ_1ξ_1^m.
4. m = 2: hyperelliptic-reduction-to-pell-system and pell-system-over-s-integers-effective give finitely many
ξ_1.
5. Each x gives at most m values of y.

*Checks.*

- For K = ℚ, S = ∅ this is the effective content of DT.4/baker-superelliptic-theorem.
- y² = x³ + 1 (m = 2, n = 3) has finitely many integral solutions, among them (−1, 0), (0, ±1), (2, ±3).
- y² = 2x² + 1 (m = 2, n = 2) is excluded: it has infinitely many integral solutions (2, 3), (12, 17), …

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-power-decomposition`
- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-reduction-to-thue-equation`
- `DiophantineApproximationAndTranscendence:DT.4/thue-equation-over-s-integers-effective`
- `DiophantineApproximationAndTranscendence:DT.4/hyperelliptic-reduction-to-pell-system`
- `DiophantineApproximationAndTranscendence:DT.4/pell-system-over-s-integers-effective`

*Sources.*

- evertse-dio-notes-ch5, Chapter 5, Theorem 5.14 and the remarks after it, printed pp. 98–99: Evertse states
Baker's theorem: the superelliptic and hyperelliptic equations have finitely many effectively determinable
solutions, by reduction to Thue equations over rings of integers or to systems of two quadratic Thue
equations.
- berczes-evertse-gyory-superelliptic-2013, §1, p. 2; §4, pp. 16–22 (arXiv v1 pagination; published pagination
adds 726).: Bérczes–Evertse–Győry recall Baker's effective theorem and Trelina's and Brindza's extensions to
S-integers, and prove explicit versions.

<a id="beg-superelliptic-height-bound"></a>
#### Bérczes–Evertse–Győry bound for superelliptic equations (Theorem 2.1)

`DT.4/beg-superelliptic-height-bound` · theorem · Lean: `beg_superelliptic` · planet: *Superelliptic equations over S-integers*

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S. If m
≥ 3 and n ≥ 2, every solution x, y ∈ 𝓞_S of f(x) = b·y^m satisfies h(x), h(y) ≤
(6ns)^{14m³n³s}·|D_K|^{2m²n²}·Q_S^{3m²n²}·e^{8m²n³d·ĥ}, Q_S := ∏_{𝔭∈S}N𝔭. For K = ℚ, S = ∅, b ∈ ℤ and f ∈
ℤ[X] this is the explicit bound of DT.4/baker-superelliptic-theorem for n ≥ 3 (with N = deg f).

*Hypotheses.*

- the setting of BEG §4
- m ≥ 3, n ≥ 2

*Proof sketch.*

1. y = 0 is trivial. Otherwise superelliptic-power-decomposition-height-bound gives x − α_i = γ_iξ_i^m with
h(γ_i) bounded, and superelliptic-reduction-to-thue-equation a Thue equation over the T-integers of M.
2. thue-equation-over-s-integers-explicit (BEG Proposition 3.11 over M, with #T ≤ m²n²s, [M:ℚ] ≤ m²n²d, P_T ≤
Q_T ≤ Q_S^{m²n²}) bounds h(ξ_1); the class number and regulator of M are bounded through
discriminant-of-kummer-compositum-bound (C := the bound for |D_M|) and class-number-and-regulator-bounds,
and R_T through s-regulator (BEG (4.24)–(4.28)).
3. Recover h(x) from the root-field variable with the nonmonic root-height estimate. Bound y by factorization,
not an evaluation inequality missing log(n+1): m h(y) ≤ h(a₀)+h(b)+Σh(x−α_i) ≤ 3ĥ+n h(x)+2n log 2. The
remaining constants are absorbed in the stated BEG bound as in §4, (4.28)–(4.30).

*Checks.*

- For K = ℚ, S = ∅ (s = 1, d = 1, D_K = 1, Q_S = 1) the bound is (6n)^{14m³n³}·e^{8m²n³ĥ}, the bound recorded
in DT.4/baker-superelliptic-theorem.
- The bound is uniform in the solution and explicit in all data.
- It does not apply to m = 2 (see beg-hyperelliptic-height-bound).

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-power-decomposition-height-bound`
- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-reduction-to-thue-equation`
- `DiophantineApproximationAndTranscendence:DT.4/thue-equation-over-s-integers-explicit`
- `DiophantineApproximationAndTranscendence:DT.4/discriminant-of-kummer-compositum-bound`
- `DiophantineApproximationAndTranscendence:DT.4/class-number-and-regulator-bounds`
- `DiophantineApproximationAndTranscendence:DT.4/s-regulator`
- `DiophantineApproximationAndTranscendence:DT.4/polynomial-height-versus-roots`
- `DiophantineApproximationAndTranscendence:DT.4/coefficient-height-of-polynomial`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §2, Theorem 2.1, p. 4; §4, proof of Theorem 2.1, formulas
(4.23)–(4.29), pp. 20–22 (arXiv v1 pagination; published pagination adds 726).: The explicit height bound
for the solutions of the superelliptic equation f(x) = by^m over the S-integers for m ≥ 3, and its proof
through a Thue equation over the auxiliary field M.

<a id="beg-hyperelliptic-height-bound"></a>
#### Bérczes–Evertse–Győry bound for hyperelliptic equations (Theorem 2.2)

`DT.4/beg-hyperelliptic-height-bound` · theorem · Lean: `beg_hyperelliptic` · planet: *Hyperelliptic equations over S-integers*

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S. If m
= 2 and n ≥ 3, every solution x, y ∈ 𝓞_S of f(x) = b·y² satisfies h(x), h(y) ≤
(4ns)^{2^{12}n⁴s}·|D_K|^{8n³}·Q_S^{20n³}·e^{50n⁴d·ĥ}. For K = ℚ, S = ∅, b ∈ ℤ and f ∈ ℤ[X] this is the
hyperelliptic bound of DT.4/baker-superelliptic-theorem.

*Hypotheses.*

- the setting of BEG §4
- m = 2, n ≥ 3

*Proof sketch.*

1. As for beg-superelliptic-height-bound, with hyperelliptic-reduction-to-pell-system and
pell-system-over-s-integers-explicit (BEG Proposition 3.12) in place of the Thue step, m²n² replaced by 4n³
and C the bound of discriminant-of-kummer-compositum-bound (ii) (BEG proof of Theorem 2.2).

*Checks.*

- For K = ℚ, S = ∅ the bound is (4n)^{2^{12}n⁴}·e^{50n⁴ĥ}, as recorded in DT.4/baker-superelliptic-theorem and
used by EffectiveDiophantineMethods:ED.5/integral-points-completeness.
- y² = x³ − 2 has the integral solutions (3, ±5), whose heights log 3, log 5 are far below the bound.
- n = 2 is excluded: y² = 2x² + 1 has infinitely many integral solutions.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-power-decomposition-height-bound`
- `DiophantineApproximationAndTranscendence:DT.4/hyperelliptic-reduction-to-pell-system`
- `DiophantineApproximationAndTranscendence:DT.4/pell-system-over-s-integers-explicit`
- `DiophantineApproximationAndTranscendence:DT.4/discriminant-of-kummer-compositum-bound`
- `DiophantineApproximationAndTranscendence:DT.4/class-number-and-regulator-bounds`
- `DiophantineApproximationAndTranscendence:DT.4/s-regulator`
- `DiophantineApproximationAndTranscendence:DT.4/polynomial-height-versus-roots`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §2, Theorem 2.2, p. 4; §4, proof of Theorem 2.2, formula (4.30),
p. 22 (arXiv v1 pagination; published pagination adds 726).: The explicit height bound for the solutions of
the hyperelliptic equation over the S-integers, through a system of two Pell equations over the auxiliary
field M.

### 4.11 Variable exponents: the Schinzel–Tijdeman theorem

BEG §5: a fixed power of x − α_i is a product of fundamental units with exponents at most m/2, an element of
bounded height and an m-th power; at the place where x − α_2 is largest, the quotient (x − α_1)/(x − α_2) is
exponentially close to 1, and the Baker bound at that place bounds m. BEG's estimate (5.19) omits a
class-number factor; the corrected constant is stated.

<a id="superelliptic-variable-exponent-decomposition"></a>
#### Decomposition of a power of x − α with exponents bounded by m/2 (BEG Lemma 5.1)

`DT.4/superelliptic-variable-exponent-decomposition` · lemma · stated in this document only

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S. For
i = 1, 2 let h_{L_i}, R_{L_i} be the class number and regulator of L_i = K(α_i), t_i := #T_i (counting the
infinite places), and η_{i1}, …, η_{i,t_i−1} a fundamental system of T_i-units with ∏_j h(η_ij) ≤ C_1 and
max_j h(η_ij) ≤ C_1, C_1 := 1200(4n⁹s⁴)^{ns}·e^{2nd·ĥ}·|D_K|^n·(log* P_S)^{ns−1} (BEG (5.5)–(5.6), from
fundamental-s-units-of-bounded-height). If x, y ∈ 𝓞_S, m ≥ 3, b·y^m = f(x) and y ≠ 0, then for i = 1, 2
there are γ_i, ξ_i ∈ L_i^× and integers b_{i1}, …, b_{i,t_i−1} with |b_ij| ≤ m/2 such that (x −
α_i)^{h_{L_1}h_{L_2}} = η_{i1}^{b_{i1}}⋯η_{i,t_i−1}^{b_{i,t_i−1}}·γ_i·ξ_i^m and h(γ_i) ≤ C_2 :=
(2n³s)^{6ns}·|D_K|^{2n}·e^{4nd·ĥ}·(ĥ + log* P_S).

*Hypotheses.*

- the setting of BEG §4–5
- m ≥ 3, b·y^m = f(x), y ≠ 0

*Proof sketch.*

1. As in superelliptic-factor-coprimality, [x − α] = 𝔆_1𝔆_2^{−1}𝔄^m with integral 𝔆_1, 𝔆_2 ⊇ [a_0bD(f)] (using
[1, α]^{−1} ⊇ [a_0]).
2. Raising to r := h_{L_1}h_{L_2} makes all three ideals principal
(principal-generators-of-class-group-powers): (x − α)^r = γ_1γ_2^{−1}λ^m with [γ_k] ⊇ [a_0bD(f)]^r.
3. small-representative-modulo-s-unit-powers gives T-units ε_k with h(ε_kγ_k) ≤ (r/d_L)log N_T(a_0bD(f)) + cR_L
+ (h_L/d_L)log Q_T; write ε_2ε_1^{−1} = ζε^m∏_jη_j^{b_j} with |b_j| ≤ m/2 (reduce exponents modulo m in the
fundamental system) and put γ := ζε_1γ_1/(ε_2γ_2), ξ := ελ.
4. Bound h_L, R_L, r by class-number-and-regulator-bounds and discriminant-of-root-field-bound (BEG (5.3)), log
N_T(a_0bD(f))/d_L by discriminant-size-bound and log Q_T/d_L ≤ s·log* P_S; this gives C_2 (BEG (5.10)).
5. For the product and individual-height bounds C₁ use Győry–Yu Lemma 2(i),(ii), p. 19: the individual bound
uses the independent-height-product theorem on each complementary tuple. The coarser individual bound from
the single Voutier cutoff alone does not justify the same numerical C₁.

*Checks.*

- The exponent r = h_{L_1}h_{L_2} is the same for i = 1, 2, so the quotient (x − α_1)^r/(x − α_2)^r has a
decomposition of the same shape.
- For L_i of class number 1 one may take r = 1.
- The bound C_2 does not depend on m, which is the point of reducing the unit exponents modulo m.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-factor-coprimality`
- `DiophantineApproximationAndTranscendence:DT.4/principal-generators-of-class-group-powers`
- `DiophantineApproximationAndTranscendence:DT.4/small-representative-modulo-s-unit-powers`
- `DiophantineApproximationAndTranscendence:DT.4/fundamental-s-units-of-bounded-height`
- `DiophantineApproximationAndTranscendence:DT.4/class-number-and-regulator-bounds`
- `DiophantineApproximationAndTranscendence:DT.4/discriminant-of-root-field-bound`
- `DiophantineApproximationAndTranscendence:DT.4/discriminant-size-bound`
- `DiophantineApproximationAndTranscendence:DT.4/s-regulator`
- `DiophantineApproximationAndTranscendence:DT.4/s-norm`
- `DiophantineApproximationAndTranscendence:DT.4/multiplicatively-independent-height-product-lower-bound`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §5, formulas (5.1)–(5.6) and Lemma 5.1 with its proof, pp. 22–25
(arXiv v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry write a fixed power of x − α_i
as a product of fundamental T_i-units with exponents at most m/2, an element of bounded height and an m-th
power. (BEG print L_i = ℚ(α_i) at the start of §5; it must be K(α_i), see sourceIssues.)
- gyory-yu-2006, Proposition 1 and Lemma 2, p. 19: The refined independent-height estimates supply the stated
numerical constants.

<a id="large-place-estimate-for-variable-exponent"></a>
#### Some place makes (x − α_1)/(x − α_2) very close to 1 (BEG (5.11)–(5.17))

`DT.4/large-place-estimate-for-variable-exponent` · lemma · Lean: `exists_place_normLogAbs_one_sub_le`

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S. Let
L := K(α_1, α_2), d_L := [L:ℚ], T the places of L above S, t := #T, r := h_{L_1}h_{L_2}, and let x, y ∈ 𝓞_S
with b·y^m = f(x), m ≥ 3, y ≠ 0 not a root of unity. Put X := max_i h(x − α_i) and number the roots so that
X = h(x − α_2). Then (a) m ≤ 2d(log 3d)³·(nX + 2ĥ); (b) if X > h(α_2) (which holds when X ≥ C_3), there is
v_0 ∈ T with |1 − (x − α_1)/(x − α_2)|_{v_0} ≤ exp((n + 1)s(v_0)·log 2 + d_L·h(f) − X·d_L/t), where s(v_0)
is 1, 2 or 0 for a real, complex or finite place; (c) if moreover X ≥ C_3 :=
(10n²s)^{37ns}·|D_K|^{6n}·P_S^{n²}·e^{11nd·ĥ}, then |1 − ((x − α_1)/(x − α_2))^r|_{v_0} ≤ exp(−X·d_L/(2t)).
In particular, if X ≥ C₃ ≥ 2ĥ/n, then m ≤ 4nd(log 3d)³ X, equivalently X ≥ m/(4nd(log 3d)³). The factor n is
required in this consequence of (a).

*Hypotheses.*

- the setting of BEG §5
- y ≠ 0, not a root of unity, m ≥ 3

*Proof sketch.*

1. (a): m·h(y) = h(f(x)/b) ≤ h(a_0) + h(b) + Σ_i h(x − α_i) ≤ 2ĥ + nX, and h(y) ≥ m(d) ≥ 1/(2d(log 3d)³) by
voutier-height-lower-bound (y ∈ K has degree ≤ d).
2. (b): if |x − α_2|_v ≤ 1 for all v ∈ T then X ≤ h(α_2), excluded by hypothesis (and h(α_2) ≤ ĥ + (n + 1)log 2
by polynomial-height-versus-roots, so X ≥ C_3 suffices); otherwise choose v_0 ∈ T maximising |x − α_2|_v.
Since x is an S-integer, X ≤ d_L^{−1}·log(|x − α_2|_{v_0}^t·∏_{v∉T}max(1, |α_2|_v)), so |x − α_2|_{v_0} is
large, and 1 − (x − α_1)/(x − α_2) = (α_1 − α_2)/(x − α_2) with |α_1 − α_2|_{v_0}·∏_{v∉T}max(1,
|α_2|_v)^{1/t} ≤ 2^{(n+1)s(v_0)}·exp(d_L·h(f)).
3. (c): for |1 − z|_v < 1 one has |1 − z^r|_v ≤ 2^{r·s(v)}|1 − z|_v (factor z^r − 1 = (z − 1)(z^{r−1} + ⋯ +
1)); with r bounded through class-number-and-regulator-bounds and X ≥ C_3 the error terms are absorbed,
giving (5.17).
4. Since C₃ ≥ 2ĥ/n, (a) gives m ≤ 4nd(log 3d)³X. Keep this factor n in the height estimate for ξ₁/ξ₂; the
stronger printed (5.12) does not follow from the preceding estimate. For part (c), use the correct
compositum bounds d_L ≤ n(n−1)d and t ≤ n²s. After multiplying the error exponent by t/d_L, it is at most
n²sH + 2n²s(r+n+1)log 2. The displayed C₃ dominates twice this quantity using the recorded bound for r, so
the upper bound exp(−Xd_L/(2t)) follows. Do not use BEG’s root-field bounds nd, ns for this two-root
compositum.

*Checks.*

- For K = ℚ, S = ∅ the place v_0 is an archimedean place of L.
- The hypothesis that y is not a root of unity is what bounds m by X in (a): for y = 1, f(x) = b has solutions
for every m.
- Part (c) needs r bounded independently of x, which the class number bounds provide.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/voutier-height-lower-bound`
- `DiophantineApproximationAndTranscendence:DT.4/polynomial-height-versus-roots`
- `DiophantineApproximationAndTranscendence:DT.4/coefficient-height-of-polynomial`
- `DiophantineApproximationAndTranscendence:DT.4/class-number-and-regulator-bounds`
- `DiophantineApproximationAndTranscendence:DT.4/discriminant-of-root-field-bound`
- `DiophantineApproximationAndTranscendence:DT.4/s-norm`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §5, Completion of the proof of Theorem 2.3, formulas
(5.11)–(5.17), pp. 25–27 (arXiv v1 pagination; published pagination adds 726).: Bérczes–Evertse–Győry show
that if the exponent is large then x − α_2 is large at some place of T, so that the quotient (x − α_1)/(x −
α_2) and its r-th power are exponentially close to 1 there.

<a id="beg-schinzel-tijdeman-bound"></a>
#### Bérczes–Evertse–Győry's Schinzel–Tijdeman theorem over S-integers (Theorem 2.3, corrected constant)

`DT.4/beg-schinzel-tijdeman-bound` · theorem · Lean: `beg_schinzel_tijdeman` · planet: *Schinzel–Tijdeman theorem over S-integers*

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S. If
f(x) = b·y^m has a solution x, y ∈ 𝓞_S with y neither 0 nor a root of unity, then m is bounded by an
explicit function of n, s, d, |D_K|, P_S and ĥ. BEG state m ≤ (10n²s)^{40ns}·|D_K|^{6n}·P_S^{n²}·e^{11nd·ĥ};
their estimate (5.19) omits the factor h_{L_1}h_{L_2} (sourceIssues), and restoring it and correcting the
degree factor and infinite-place normalization, the calculation below gives m ≤
(10n²s)^{46ns}·|D_K|^{8n}·P_S^{n²}·e^{15nd·ĥ}. For K = ℚ, S = ∅ this reads m ≤ (10n²)^{46n}·e^{15n·ĥ}, which
corrects the explicit bound recorded in DT.4/schinzel-tijdeman-theorem.

*Hypotheses.*

- the setting of BEG §5
- a solution with y ≠ 0 not a root of unity

*Proof sketch.*

1. Write H = ĥ, D = |D_K|, P = P_S, L = log*P, k = ns ≥ 2 and A = 10n²s ≥ 40. Put M =
A^{46k}D^{8n}P^{n²}exp(15ndH). Assume m > M. The inequality m ≤ 2d(log(3d))³(nX+2H) gives X ≥ C₃ and hence X
≥ 2C₂. It also gives m ≤ 4nd(log(3d))³X. Indeed M/(4nd(log(3d))³) ≥ C₃ follows from d ≤ 2s and the factor
A^{9k}D^{2n}exp(4ndH).
2. Set z = (x−α₁)/(x−α₂) and r = h_{L₁}h_{L₂}. The Baker form 1−z^r is nonzero: otherwise z is a root of unity,
and z ≠ 1 since α₁ ≠ α₂. Then h(1−z) ≤ log 2 and x−α₂ = (α₂−α₁)/(1−z) imply X ≤ h(α₁)+h(α₂)+log 4 ≤
h(f)+(n+2)log 2 < C₃, a contradiction.
3. The decomposition gives h(ξ₁/ξ₂) ≤ 2(rX+C₂)/m + ½(t₁+t₂−2)C₁. Here r ≤ r₀ = (2n³s)^{4k}D^{2n}exp(4ndH).
Since t_i ≤ ns and d ≤ 2s, h(ξ₁/ξ₂) ≤ [2r+1+8n²s²(log(6s))³C₁]X/m ≤ r·4^{k+2}C₁X/m. For the last comparison,
log(6s)³ ≤ 6s², and 3+48n²s⁴ ≤ 4^{ns+2}; verify the latter at n=2,s=1 and increase n and s, using their
exponential growth. This retains the n lost in printed (5.12).
4. Use m(d_L), with d_L = [K(α₁,α₂):ℚ], as the height floor in Proposition 3.10. The previous bound is also at
least this floor (m(d_L) ≤ 1 and C₁ is large enough after X/m ≥ 1/(4nd(log(3d))³)). Each fundamental unit
has h(η_ij) ≥ m(d_L), by its own field’s degree bound; therefore their product contributes at most C₁². Also
max(h(γ₁/γ₂),m(d_L)) ≤ 2C₂. Thus Θ ≤ r C₄X/m, where C₄ =
2·10⁷(4^{10}n^{45}s^{18})^kD^{5n}exp(10ndH)(H+1)L^{3k−2}. Substitution of C₁,C₂ gives the stated
coefficient: the remaining ratio is at most 2764.8/4^{3k} ≤ 1.
5. The Baker coefficient is at most C₅ = (32en²s)^{6k+3}, since d_L ≤ 2n²s and t₁+t₂ ≤ 2ns. At every place,
N(v)/log N(v) ≤ 3P^{n(n−1)}: for an infinite place it is 2/log 2 < 3, while a finite place lies above S and
has norm at most P^{[L:K]}. Comparison with the upper bound exp(−Xd_L/(2t)) gives m/log m ≤ 6n²s·r
C₄C₅P^{n(n−1)}, using t ≤ n²s. This covers P = 1 as well as finite S.
6. Bound the numerical part of C₄ by A^{(45/2)k}, C₅ by A^{(8/5)(6k+3)}, and 6n²s by A. The first comparison
follows from s^{18} ≤ s^{22.5} and 2·10⁷(4^{10}/10^{22.5})^k ≤ 1. For the second use 32e/10 < 40^{3/5}.
Their exponent sum 32.1k+5.8 is at most 35k for k ≥ 2. Also (2n³s)^{4k} ≤ A^{6k}. Consequently m/log m ≤ Q
:= A^{41k}D^{7n}P^{n²−n}exp(14ndH)(H+1)L^{3k−2}.
7. To remove the remaining logarithmic factors, H+1 ≤ exp(ndH/2) and L^{3k−2} ≤ A^{3k}P^{n/2}. For P ≥ e,
maximize u^{3k−2}exp(−nu/2) at u=2(3k−2)/n; its value is at most (6s)^{3k} ≤ A^{3k}. For 1 ≤ P ≤ e, L=1
makes the same estimate immediate. Hence M/Q ≥ A^{2k}D^nP^{n/2}exp(ndH/2).
8. Finally log M = 46k log A + 8n log D + n² log P + 15ndH. Each term is at most one quarter of
A^{2k}D^nP^{n/2}exp(ndH/2): use 46k log A ≤ A^{2k}/4; 8n log D ≤ (8/e)D^n; n² log P ≤ (2n/e)P^{n/2}; and
15ndH ≤ (30/e)exp(ndH/2), with A ≥ 40,k ≥ 2. Therefore Q ≤ M/log M. Since t/log t is strictly increasing for
t > e, m > M contradicts m/log m ≤ Q. This proves the corrected constant, conditional on the explicitly
recorded source-input gaps, without invoking an unspecified final absorption.

*Checks.*

- For K = ℚ, S = ∅, f = T² + 1, b = 1: every solution of X^p = Y² + 1 with X ≥ 2 has p ≤ (40)^{92} by the
corrected bound (BEG's printed constant gives 40^{80}).
- The hypothesis that y is not a root of unity is necessary: y = 1, f(x) = b is solvable for all m when f
takes the value b.
- The bound does not depend on the solution.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-variable-exponent-decomposition`
- `DiophantineApproximationAndTranscendence:DT.4/large-place-estimate-for-variable-exponent`
- `DiophantineApproximationAndTranscendence:DT.4/baker-bound-at-a-place`
- `DiophantineApproximationAndTranscendence:DT.4/voutier-height-lower-bound`
- `DiophantineApproximationAndTranscendence:DT.4/fundamental-s-units-of-bounded-height`
- `DiophantineApproximationAndTranscendence:DT.4/class-number-and-regulator-bounds`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §2, Theorem 2.3, p. 4; §5, proof of Theorem 2.3, formulas
(5.18)–(5.21) and the final estimate, pp. 27–29 (arXiv v1 pagination; published pagination adds 726).: The
explicit Schinzel–Tijdeman bound for the exponent of a solvable superelliptic equation over the S-integers,
by comparing a Baker-type lower bound at a place with the upper bound from the large place.
- evertse-dio-notes-ch5, Chapter 5, Theorem 5.15, printed p. 99: Evertse states the Schinzel–Tijdeman theorem
over ℤ: the exponent of a solvable b·y^n = f(x) with y ≠ 0, ±1 is bounded effectively in terms of f and b.

<a id="schinzel-tijdeman-effective-over-s-integers"></a>
#### Effective Schinzel–Tijdeman theorem over S-integers, without analytic class-number inputs

`DT.4/schinzel-tijdeman-effective-over-s-integers` · theorem · Lean: `schinzel_tijdeman_sInteger`

Let K be a number field of degree d and discriminant D_K, S a finite set of nonzero primes of 𝓞_K (BEG's S
also contains the infinite places; s := #S + #(infinite places)), 𝓞_S the S-integers, f = a_0X^n + ⋯ + a_n ∈
𝓞_S[X] of degree n ≥ 2 with D(f) ≠ 0, b ∈ 𝓞_S ∖ {0}, m ≥ 2, ĥ := ĥ(b, f) (coefficient-height-of-polynomial),
and f = a_0(X − α_1)⋯(X − α_n) over a splitting field; L_i := K(α_i) and T_i the primes of L_i above S.
There is an explicitly computable number C(K, S, f, b), computable from K, S, f, b together with the class
numbers h_{L_1}, h_{L_2} and fundamental systems of T_1- and T_2-units (all computable), such that f(x) =
b·y^m with x, y ∈ 𝓞_S and y neither 0 nor a root of unity implies m ≤ C(K, S, f, b).

*Hypotheses.*

- the setting of BEG §5

*Proof sketch.*

1. Repeat the structural ideal and unit-exponent reductions of Lemma 5.1 using computed class numbers and a
chosen fundamental system, not its closed constants C₁,C₂. The generic covering bound gives a computable
height bound for γ_i independent of m; the finitely many unit heights and the class-number product give the
other fixed constants.
2. Use the elementary height estimate m h(y) ≤ nX+2ĥ and a positive computable lower cutoff for
non-root-of-unity heights in the fixed fields. Voutier gives one such cutoff in every field involved,
including auxiliary root fields of degree greater than one over a rational base; alternatively the
coefficient-enumeration proof of Northcott below fixed multiplicative height 2 yields a field-specific
positive minimum. That proof enumerates bounded-degree minimal polynomials with bounded integer
coefficients; approximate the finitely many positive non-torsion logarithmic heights from below to obtain a
certified positive cutoff.
3. At the large place use the Matveev comparison at infinity and the Yu 1994 adapter at finite places, with
their actual constants. The same comparison gives m/log m bounded by a computable constant, and therefore a
computable bound for m. Thus no analytic class-number bound or refined Győry–Yu closed constant is required.
Over ℤ the logarithmic-form input is archimedean, alongside these height and unit-arithmetic inputs.

*Checks.*

- For K = ℚ, S = ∅, f = T² − 1, b = 1 it bounds q in Y^q = X² − 1 (used by catalan-exponent-two-cases).
- The constant is computable, not merely existent.
- It is uniform in the solution.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/superelliptic-variable-exponent-decomposition`
- `DiophantineApproximationAndTranscendence:DT.4/large-place-estimate-for-variable-exponent`
- `DiophantineApproximationAndTranscendence:DT.4/baker-bound-at-a-place`
- `DiophantineApproximationAndTranscendence:DT.4/small-representative-modulo-s-unit-powers`
- `DiophantineApproximationAndTranscendence:DT.4/s-unit-rank`
- `DiophantineApproximationAndTranscendence:DT.4/voutier-height-lower-bound`
- `DiophantineApproximationAndTranscendence:DT.4/yu-bound-in-a-number-field`
- `DiophantineApproximationAndTranscendence:DT.0/northcott-absolute-height`

*Sources.*

- berczes-evertse-gyory-superelliptic-2013, §5, pp. 22–29 (arXiv v1 pagination; published pagination adds
726).: The proof of Theorem 2.3, whose structure does not depend on the analytic bounds for class numbers
and regulators except through the final explicit constant.
- evertse-dio-notes-ch5, Chapter 5, Theorem 5.15, printed p. 99: The effective Schinzel–Tijdeman theorem over
ℤ.

### 4.12 Catalan's equation: Tijdeman's theorem

Tijdeman (1976) §5: reduction to distinct prime exponents, Cassels-type factorisations, a polylogarithmic
bound for the smaller exponent, an absolute bound for the larger, and Baker's theorem for each remaining pair
of exponents. The exponent-2 cases go through the Schinzel–Tijdeman and Baker theorems of this layer instead
of Lebesgue's and Ko's theorems.

<a id="catalan-reduction-to-prime-exponents"></a>
#### Catalan's equation reduces to distinct prime exponents

`DT.4/catalan-reduction-to-prime-exponents` · lemma · Lean: `catalan_prime_exponents`

Let x, y, m, n be integers ≥ 2 with x^m − y^n = 1. For every prime p dividing m and every prime q dividing
n, the integers X := x^{m/p} and Y := y^{n/q} are ≥ 2 and satisfy X^p − Y^q = 1, with X^p = x^m and Y^q =
y^n; moreover p ≠ q. Consequently an upper bound for X^p and Y^q over all solutions with distinct prime
exponents bounds x^m and y^n, and then m, n ≤ log(x^m)/log 2 and log(y^n)/log 2.

*Hypotheses.*

- x, y, m, n ∈ ℤ with x, y, m, n ≥ 2
- x^m − y^n = 1
- p, q primes with p ∣ m and q ∣ n

*Proof sketch.*

1. Every integer ≥ 2 has a prime divisor (Nat.exists_prime_and_dvd), so p and q exist; X^p = x^m and Y^q = y^n
by the power-of-a-power rule, and X, Y ≥ 2 because x, y ≥ 2 and m/p, n/q ≥ 1.
2. If p = q then X^p = Y^p + 1 > Y^p forces X ≥ Y + 1, hence X^p − Y^p ≥ (Y + 1)^p − Y^p ≥ p·Y^{p−1} ≥ 4,
contradicting X^p − Y^p = 1.
3. Since x ≥ 2, m ≤ log(x^m)/log 2, and likewise for n.

*Checks.*

- For 3² − 2³ = 1 the lemma gives (X, Y, p, q) = (3, 2, 2, 3).
- For x^4 − y^n = 1 with p = 2 one obtains X = x², so solutions with composite exponents are not lost.
- The conclusion p ≠ q fails for the equation X^p − Y^p = 0, which is why the right-hand side 1 matters.

*Needs.*

- `mathlib:Nat.exists_prime_and_dvd`

*Sources.*

- tijdeman-catalan-1976, §5, first paragraph, p. 205; §1, p. 197: Tijdeman reduces Catalan's equation without
loss of generality to two different prime exponents; the introduction notes that one may obviously assume
this.

<a id="catalan-exponent-two-cases"></a>
#### Catalan's equation when one exponent is 2

`DT.4/catalan-exponent-two-cases` · lemma · Lean: `catalan_exponent_two`

There is an effectively computable absolute constant C_2 such that for all primes p ≠ q with 2 ∈ {p, q} and
all integers X, Y ≥ 2 with X^p − Y^q = 1 one has p, q, X, Y ≤ C_2. Explicitly: if q = 2 then X^p = Y² + 1
and p ≤ 40^{92} by the Schinzel–Tijdeman theorem for f = T² + 1, b = 1 (corrected constant of
beg-schinzel-tijdeman-bound; BEG's printed constant would give 40^{80}); if p = 2 then Y^q = X² − 1 and q ≤
40^{92} by the same theorem for f = T² − 1, b = 1; for each such exponent ≥ 3 Baker's superelliptic theorem
bounds X and Y.

*Hypotheses.*

- p, q primes, p ≠ q, 2 ∈ {p, q}
- X, Y ∈ ℤ, X, Y ≥ 2
- X^p − Y^q = 1

*Proof sketch.*

1. Case q = 2: X^p = f(Y) with f := T² + 1 ∈ ℤ[T] of degree N = 2, without multiple zeros, and b = 1. Since X ∉
{0, ±1}, beg-schinzel-tijdeman-bound with K = ℚ, S = ∅ (the effective content is
DT.4/schinzel-tijdeman-theorem; its unknowns renamed: its y is X, its x is Y and its exponent is p) gives p
≤ (10N²)^{46N}·e^{15Nĥ} = 40^{92}, because ĥ = log max(1, |b|, |coefficients|) = 0.
2. For each prime p with 3 ≤ p ≤ 40^{92} the equation X^p = Y² + 1 is a superelliptic equation b·X^p = f(Y)
with exponent p ≥ 3 and deg f = 2 ≥ 2, so DT.4/baker-superelliptic-theorem bounds log max(1, |X|), log
max(1, |Y|) by (12)^{14p³·8}, an explicit function of p. (p = 2 is excluded because p ≠ q.)
3. Case p = 2: Y^q = X² − 1 = f(X) with f := T² − 1, which has the two simple zeros ±1; Y ∉ {0, ±1}, so again q
≤ 40^{92}, and for each prime q ≥ 3 below this bound Baker's theorem bounds X and Y.
4. Take C_2 as the maximum of the finitely many bounds so obtained. This replaces Tijdeman's appeal to
Lebesgue's theorem (no solution of X^p = Y² + 1 with Y ≥ 1) by an effective bound, which suffices for an
effective finiteness statement.

*Checks.*

- The bound 40^{92} is (10·2²)^{46·2}, the value of the corrected BEG bound at N = 2, s = 1, d = 1, D_K = 1,
P_S = 1, ĥ = 0.
- The solution 3² − 2³ = 1 has p = 2 and is covered by this node, with q = 3 ≤ 40^{92}.
- Without the restriction Y ≥ 2 the equation X^p = Y² + 1 has the solution (X, Y) = (1, 0) for every p, which
is why the Schinzel–Tijdeman hypothesis X ∉ {0, ±1} is checked.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/beg-schinzel-tijdeman-bound`
- `DiophantineApproximationAndTranscendence:DT.4/schinzel-tijdeman-theorem`
- `DiophantineApproximationAndTranscendence:DT.4/baker-superelliptic-theorem`

*Sources.*

- tijdeman-catalan-1976, §5, first paragraph, p. 205: Tijdeman assumes q odd, citing Lebesgue's theorem that
X^p − Y² = 1 has no solutions; the present node replaces this citation by the Schinzel–Tijdeman and Baker
theorems of this layer.
- berczes-evertse-gyory-superelliptic-2013, §2, Theorem 2.3, p. 4 (arXiv v1 pagination; published pagination
adds 726).: The explicit Schinzel–Tijdeman bound for the exponent, whose printed value for K = ℚ, S = {∞}, n
= 2 and ĥ = 0 is 40^{80} (40^{92} after the correction recorded in sourceIssues).

<a id="cassels-type-factorisations"></a>
#### The factorisations x − 1 = p^{δ₁}ρ^q and y + 1 = q^{δ₂}σ^p

`DT.4/cassels-type-factorisations` · lemma · Lean: `cassels_factorisation`

Let p, q be distinct odd primes and x, y ≥ 2 integers with x^p − y^q = 1. Then there are δ₁, δ₂ ∈ {−1, 0}
and integers ρ, σ ≥ 2 with x − 1 = p^{δ₁}ρ^q and y + 1 = q^{δ₂}σ^p; moreover δ₁ = −1 exactly when p ∣ x − 1,
and δ₂ = −1 exactly when q ∣ y + 1, in which case p ∣ ρ, respectively q ∣ σ. Substituting gives (p^{δ₁}ρ^q +
1)^p − (q^{δ₂}σ^p − 1)^q = 1. (Tijdeman allows δ₁, δ₂ ∈ {−1, 0, 1}, which also covers p = 2; for odd primes
the value 1 does not occur.)

*Hypotheses.*

- p, q distinct odd primes
- x, y ∈ ℤ, x, y ≥ 2
- x^p − y^q = 1

*Proof sketch.*

1. Write y^q = x^p − 1 = (x − 1)·Φ with Φ := 1 + x + ⋯ + x^{p−1}. Any common divisor of x − 1 and Φ divides
Φ(1) = p, so gcd(x − 1, Φ) ∈ {1, p}.
2. If p ∤ x − 1 the two factors are coprime positive integers whose product is a q-th power, so x − 1 = ρ^q (δ₁
= 0).
3. If p ∣ x − 1, lifting the exponent (DT.3/p-adic-valuation-of-power-minus-one with a = x − 1, b = p) gives
v_p(x^p − 1) = v_p(x − 1) + 1, so v_p(Φ) = 1; every other prime divides at most one factor. Hence v_p(x − 1)
= q·v_p(y) − 1 and v_ℓ(x − 1) ≡ 0 (mod q) for ℓ ≠ p, i.e. p·(x − 1) is a q-th power ρ^q with p ∣ ρ (δ₁ = −1,
ρ ≥ p ≥ 3).
4. Symmetrically x^p = y^q + 1 = (y + 1)·Ψ with Ψ := y^{q−1} − y^{q−2} + ⋯ + 1 (q odd), gcd(y + 1, Ψ) ∣ Ψ(−1) =
q, and lifting the exponent for (−y)^q − 1 with a = −(y + 1) gives δ₂ ∈ {−1, 0}; y + 1 ≥ 3 forces σ ≥ 2.
5. ρ ≥ 2: ρ = 1 would force δ₁ = 0 and x = 2, so y^q + 1 = 2^p; but Ψ is a sum of q odd terms, hence odd, and Ψ
> 1 for y ≥ 2, so (y + 1)·Ψ is not a power of 2. σ ≥ 2: σ = 1 would give y + 1 ∈ {1, 1/q}. Hence Tijdeman's
case (a) ('ρ = 1 or σ = 1') does not occur when p and q are both odd.

*Checks.*

- For the excluded even case 3² − 2³ = 1 one has x − 1 = 2 = 2^{1}·1^3, which needs δ₁ = 1: the restriction to
odd primes is essential for δ ∈ {−1, 0}.
- If p ∣ x − 1 then p·(x − 1) is a perfect q-th power (δ₁ = −1).
- The identity (p^{δ₁}ρ^q + 1)^p − (q^{δ₂}σ^p − 1)^q = 1 holds by substitution.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.3/p-adic-valuation-of-power-minus-one`
- `mathlib:Int.emultiplicity_pow_sub_pow`
- `mathlib:exists_associated_pow_of_mul_eq_pow'`

*Sources.*

- tijdeman-catalan-1976, §5, equations (11)–(13), p. 205: Tijdeman derives from the gcd of y + 1 and (y^q +
1)/(y + 1), which divides q, that y + 1 is q^{δ₂} times a p-th power, and likewise x − 1 = p^{δ₁}ρ^q, and
substitutes both into the equation.
- evertse-dio-notes-ch5, Chapter 5, §5.1, remarks on Catalan's equation, printed p. 88: Evertse reports
Tijdeman's effective bound for Catalan's equation in prose.

<a id="tijdeman-smaller-exponent-bound"></a>
#### The smaller exponent is polylogarithmic in the larger

`DT.4/tijdeman-smaller-exponent-bound` · lemma · Lean: `tijdeman_smaller_exponent`

There are effectively computable absolute constants c₁, c₂ > 0 such that for all distinct odd primes p, q
and integers x, y ≥ 2 with x^p − y^q = 1: if p > q then q ≤ c₁(log p)^{c₂}, and if q > p then p ≤ c₁(log
q)^{c₂}. With the logarithmic-form bound of this layer one may take c₂ = 3.

*Hypotheses.*

- p, q distinct odd primes
- x, y ≥ 2 integers with x^p − y^q = 1

*Proof sketch.*

1. Use cassels-type-factorisations; for odd p, q it gives ρ, σ ≥ 2, so Tijdeman's case (a) (ρ = 1 or σ = 1) is
empty and only his case (b) remains.
2. Case p > q: from (x − 1)^p < y^q + 1 < (y + 1)^q and the identity of the previous node, with |log(1 + a)| ≤
a (a > 0) and |log((1 − a)^q + a^q)| ≤ 2aq for 0 ≤ a ≤ 1/2, one gets 0 < |δ₁ p log p − δ₂ q log q + pq
log(ρ/σ)| ≤ p/(p^{δ₁}ρ^q) + 2q/(q^{δ₂}σ^p) ≤ 3p²/ρ^q, using that p > q forces y > x and hence q^{δ₂}σ^p >
p^{δ₁}ρ^q. The form is nonzero because it is the logarithm of (x − 1)^p/(y + 1)^q < 1.
3. If q ≤ 10 log p there is nothing to prove. Otherwise ρ ≥ 2 gives ρ^{q/2} > p^{5 log 2} > 3p², so the form is
< exp(−(q/2) log ρ) (Tijdeman (17)); this forces |log(ρ/σ)| ≤ 2 log p/q + 1 < 2 (Tijdeman (18)), hence σ <
e²ρ < ρ⁴ and H(ρ/σ) ≤ ρ⁴.
4. separated-height-logarithmic-form-bound with n ≤ 3, the rationals p, q, ρ/σ (dropping terms with zero
coefficient), B = p² and A_1, A_2 ≤ log p, A_3 ≤ 4 log ρ gives a lower bound exp(−C·(log p)³·log ρ);
comparing exponents yields q < c₁(log p)³.
5. The case q > p is the mirror image: x > y gives p^{δ₁}ρ^q ≥ q^{δ₂}σ^p − 1, the upper bound becomes ≤
4q²/σ^p, and the same lower bound with the roles of (p, ρ) and (q, σ) exchanged gives p < c₁(log q)³.
Tijdeman states only that this case is similar (sourceIssues).
6. Before using Matveev, remove every zero logarithm and every zero coefficient. The positive rational
arguments then have chosen nonzero real logarithms. In the q > p case x > y gives x − 1 ≥ y ≥ (y + 1)/2;
consequently the three-logarithm upper bound is at most 4q²/σ^p. Use A_i equal to the displayed admissible
upper bounds, not merely bounded above by them.

*Checks.*

- The bound is uniform: c₁, c₂ do not depend on x, y.
- For odd p, q the equation 2^p − y^q = 1 has no solution (y^q + 1 = 2^p is impossible), so no separate case x
= 2 is needed.
- The nonvanishing of the three-logarithm form is proved from (x − 1)^p < (y + 1)^q, not assumed.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/cassels-type-factorisations`
- `DiophantineApproximationAndTranscendence:DT.4/separated-height-logarithmic-form-bound`
- `mathlib:Real.log_le_sub_one_of_pos`
- `mathlib:Real.add_one_le_exp`

*Sources.*

- tijdeman-catalan-1976, §5, inequality (14) and its proof in cases (a) and (b), equations (15)–(19), pp.
206–207: Tijdeman proves that the smaller prime exponent is bounded by an absolute constant times a power of
the logarithm of the larger, comparing an exponentially small linear form in two or three logarithms with
his Theorem 2.

<a id="tijdeman-larger-exponent-bound"></a>
#### The larger exponent is bounded by an absolute constant

`DT.4/tijdeman-larger-exponent-bound` · lemma · Lean: `tijdeman_larger_exponent`

There is an effectively computable absolute constant C₁ such that for all distinct odd primes p, q and
integers x, y ≥ 2 with x^p − y^q = 1 one has max(p, q) ≤ C₁.

*Hypotheses.*

- p, q distinct odd primes
- x, y ≥ 2 integers with x^p − y^q = 1

*Proof sketch.*

1. For p > q use Tijdeman §5: a = (q^{δ₂}σ^p)⁻¹, β = (p^{δ₁}ρ^q + 1)/σ^q = x/σ^q. Then β^p q^{−δ₂q} = (1 − a)^q
+ a^q, so the logarithmic form is nonzero and negative. The small-exponent bound controls q by a power of
log p; h(β) ≤ 2q log σ and |log β| ≤ 1 for large p. The separated-height bound on these two logarithms
compared with the exponentially small upper bound controls p/log(p)^C.
2. For q > p carry out the following different normalization. Put a = (p^{δ₁}ρ^q)⁻¹ = 1/(x − 1) and β =
(q^{δ₂}σ^p − 1)/ρ^p = y/ρ^p. The equation gives β^q p^{−δ₁p} = (1 + a)^p − a^p > 1. Hence 0 < q log β − δ₁p
log p ≤ 2pa ≤ 2p²/ρ^q. For sufficiently large q, the small-exponent bound makes this at most exp(−(q/2) log
ρ).
3. Also h(β) ≤ 2p log ρ and |log β| ≤ (p log p + 1)/q ≤ 1 for sufficiently large q. If δ₁ = 0, β > 1; if δ₁ =
−1, q log β = −p log p + a positive exponentially small term, so β ≠ 1. Drop any zero coefficient and apply
separated-height-logarithmic-form-bound to β and p. This yields a lower bound exp(−C(log q)^C′ log ρ),
contradicting the upper bound when q is large.
4. All sufficiently-large thresholds are computable. The finitely many smaller exponent cases and the p > q
case give one absolute computable upper bound; combine it with tijdeman-smaller-exponent-bound to bound both
primes.

*Checks.*

- The constant is absolute: it depends on neither x nor y.
- The proof uses p ≥ 32 only to absorb 2q² into σ^{p/2}; smaller p are bounded trivially.
- Together with the previous node both exponents are bounded.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/cassels-type-factorisations`
- `DiophantineApproximationAndTranscendence:DT.4/tijdeman-smaller-exponent-bound`
- `DiophantineApproximationAndTranscendence:DT.4/separated-height-logarithmic-form-bound`

*Sources.*

- tijdeman-catalan-1976, §5, the bound p ≤ C, cases (a) and (b), equations (20)–(21), pp. 207–208: Tijdeman
shows that the larger exponent is absolutely bounded, using the polylogarithmic bound for the smaller one
and a second linear form in two logarithms.

<a id="tijdeman-catalan-effective-finiteness"></a>
#### Tijdeman's theorem on Catalan's equation

`DT.4/tijdeman-catalan-effective-finiteness` · theorem · Lean: `tijdeman_catalan_bounded` · planet: *Tijdeman's theorem on Catalan's equation*

There is an effectively computable constant C₀ such that every solution of x^m − y^n = 1 in integers x, y,
m, n ≥ 2 satisfies m, n, x, y ≤ C₀ (Tijdeman's Theorem 1); in particular x^m, y^n ≤ C₀^{C₀}, which is the
statement of DT.4/tijdeman-catalan-bound. (Mihăilescu proved that 3² − 2³ = 1 is the only solution; that
proof is algebraic and is not planned in this layer.)

*Hypotheses.*

- x, y, m, n ∈ ℤ, all ≥ 2
- x^m − y^n = 1

*Proof sketch.*

1. catalan-reduction-to-prime-exponents gives distinct primes p ∣ m, q ∣ n and X, Y ≥ 2 with X^p − Y^q = 1, X^p
= x^m, Y^q = y^n.
2. If 2 ∈ {p, q}, catalan-exponent-two-cases bounds p, q, X, Y. Otherwise p, q are odd and
tijdeman-larger-exponent-bound bounds max(p, q) by C₁.
3. For each of the finitely many pairs (p, q) of odd primes up to C₁, Y^q = X^p − 1 = f(X) with f := T^p − 1,
which has p ≥ 3 simple zeros, and q ≥ 3; DT.4/baker-superelliptic-theorem bounds |X| and |Y|.
4. Hence X^p and Y^q are bounded, and then m ≤ log(x^m)/log 2, n ≤ log(y^n)/log 2 and x ≤ x^m, y ≤ y^n are
bounded.

*Checks.*

- The solution (x, y, m, n) = (3, 2, 2, 3) satisfies the bound for every admissible C₀ ≥ 3.
- The theorem is effective: C₀ is assembled from the explicit constants of the logarithmic-form bound and of
the superelliptic theorem.
- It implies DT.4/tijdeman-catalan-bound, whose statement bounds only x^m and y^n.

*Needs.*

- `DiophantineApproximationAndTranscendence:DT.4/catalan-reduction-to-prime-exponents`
- `DiophantineApproximationAndTranscendence:DT.4/catalan-exponent-two-cases`
- `DiophantineApproximationAndTranscendence:DT.4/tijdeman-larger-exponent-bound`
- `DiophantineApproximationAndTranscendence:DT.4/baker-superelliptic-theorem`

*Sources.*

- tijdeman-catalan-1976, §1, Theorem 1, p. 198; §5, last paragraph, p. 208: Tijdeman's main theorem: Catalan's
equation has finitely many solutions in integers greater than one, with effectively computable bounds for
all four unknowns; the proof ends by applying Baker's superelliptic bound to each of the finitely many
exponent pairs.
- evertse-dio-notes-ch5, Chapter 5, §5.1, after Corollary 5.5, printed p. 88: Evertse states Tijdeman's
result: x^m and y^n are bounded by an effectively computable constant.

## Dependencies

**Inside this roadmap.** First part of DT.4: `siegel-identity`, `s-integral-divisor-representation`,
`gyory-effective-finiteness`, `gyory-equation-exponent-bound`, `unit-lattice-covering-bound`,
`baker-superelliptic-theorem` and `schinzel-tijdeman-theorem`. DT.3: `matveev-corollary-linear-form-bound`,
`yu-explicit-p-adic-bound`, `p-adic-valuation-of-power-minus-one`. DT.2: `uniform-bound-nondegenerate-solutions`.

**Other roadmaps.** GeometryOfNumbersAndQuadraticArithmetic, Layer GN.1 (`successive-minimum`,
`minkowski-second-upper`, `basis-from-minima`, `successive-minimum-witnesses`) and GN.0 (`integral-rational-flag`), lower upstream tiers. Tau Ceti: `TauCeti.relDiscr`,
`TauCeti.relDiscr_tower`, `TauCeti.NumberField.relDiscr_int_ringOfIntegers`, `Polynomial.Monic.discr_mul`,
`Polynomial.discr_prod_X_sub_C`, the S-unit API `Set.unitValuation`, `Set.unitValuation_ker`, `Set.unit_fg_of_units`,
and the elementary class number bound `NumberField.classNumber_le_bound`; the roadmap NumberFieldArithmetic, Layers 4,
5 and 6, through three supplier records (integral-basis discriminants, the different exponent bound, and the
Layer 5.10 valuation formula, already implemented in current Tau Ceti as `TauCeti.multiplicity_relDiscr`).
The separate local compositum-different bridge is recorded as a gap; it is not supplied by the valuation formula.

**Consumers.**

- EffectiveDiophantineMethods, Layer ED.5 (`integral-points-completeness`) uses the explicit hyperelliptic bound,
  now `beg-hyperelliptic-height-bound` with `K = ℚ`, `S = ∅`.
- ArithmeticStatistics, Layer ST.1 (`fibres-of-the-embedding-are-uniformly-bounded`) requested the uniform bound for
  cubic Thue equations: `uniform-bound-for-thue-equations`.
- ClassicalArithmeticCompletion, Layer CA.4, refers to Tijdeman's effective bound: `tijdeman-catalan-effective-finiteness`.

**Re-pointing at assembly.** This part may not edit the first part's packet, so these edits are recorded for the
assembly:

- `DT.4/baker-superelliptic-theorem` should take `beg-superelliptic-height-bound`, `beg-hyperelliptic-height-bound`
  and `superelliptic-effective-finiteness-over-s-integers` (with `K = ℚ`, `S = ∅`) as prerequisites.
- `DT.4/schinzel-tijdeman-theorem` should take `beg-schinzel-tijdeman-bound` and
  `schinzel-tijdeman-effective-over-s-integers`, and its explicit constant should read `(10N²)^{46N}·e^{15Nĥ}`
  (sourceIssue E701).
- `DT.4/tijdeman-catalan-bound` should take `tijdeman-catalan-effective-finiteness`.
- `DT.4/exponent-height-bound-for-finitely-generated-groups` should take `s-logarithmic-map-kernel-and-lattice` and
  `s-unit-rank`; `DT.4/s-integral-divisor-representation` should take `principal-generators-of-class-group-powers`;
  `DT.4/gyory-effective-finiteness` should take `yu-bound-in-a-number-field` in place of the bare DT.3 stage.
- The first part's coverage record cites "Bérczes–Evertse–Győry section 6" for the Schinzel–Tijdeman theorem; the
  proof is in §5 (arXiv v1 has no §6).

**Gaps.**

- *Analytic class number and regulator bounds* (`class-number-and-regulator-bounds`): BEG Lemma 3.5: Friedman's R_K ≥ 0.2 (Invent. Math. 98 (1989)) and Louboutin's bound h_KR_K ≤
|D_K|^{1/2}(log*|D_K|)^{d−1} (J. Number Theory 85 (2000)) are analytic (Dedekind zeta residues and explicit
formulae) and are not decomposed. Louboutin's residue bound is planned at
AnalyticNumberTheory:AN.4/louboutin-dedekind-residue-upper, a roadmap of a higher upstream tier, so it
cannot be cited from DT.4 (WORKERS.md, Upstream tiers); Friedman's bound has no planned owner. Only the
explicit constants of the BEG theorems depend on this gap: the effective theorems of this part use computed
class numbers and fundamental units instead.
- *Exact Győry–Yu-to-BEG constant comparison at low height and unit rank zero* (`thue-equation-over-s-integers-explicit`, `pell-system-over-s-integers-explicit`): Győry–Yu (2006) is publicly available and Theorem 3, Corollary 3 and their proofs have now been read. Their
A ≥ 1 floor is absent from BEG Propositions 3.11–3.12, and c₃ = 0 at unit rank zero prevents the printed
simple comparison by c₁c₃. The connected-forms reduction and denominator clearing are supplied here. A
precise numerical absorption from max(1,A), max(1,c₃) to BEG’s displayed coefficient remains to be proved;
preserve the BEG source contracts with this gap, rather than claiming their smaller coefficients were
derived. Exact S-unit constants also inherit Yu 2007 and the quantitative independent-height gap.
- *Yu 2007 constant at finite places* (`baker-bound-at-a-place`): At a finite place BEG Proposition 3.10 uses Yu's 2007 theorem (Forum Math. 19 (2007) 187–280, main theorem
p. 190), which DT.3 does not plan (it plans Yu 1994, DT.3/yu-explicit-p-adic-bound).
yu-bound-in-a-number-field gives a bound of the same shape with a different constant; the stated constant
c_1(n, d) at finite places, and hence BEG Theorem 2.3 for S with finite places, rests on this gap. For S = ∅
(equations over ℤ or over rings of integers) only infinite places occur; Matveev supplies the
logarithmic-form input, alongside the separate height and unit-arithmetic inputs.
- *Voutier's height lower bound* (`voutier-height-lower-bound`): Voutier's Corollary 2 (h(α) > 2/(d(log 3d)³) for d ≥ 2) rests on his determinant (Cantor–Straus) argument
for d ≥ 22, Smyth's theorem for non-reciprocal α and Boyd's computations for d ≤ 20; none is decomposed.
Even over ℤ, the auxiliary root fields L_i can have degree greater than one and need their own cutoff.
Effective bounds can instead use computed field-specific positive height minima; the closed constants
require the stated Voutier estimate.
- *Lewis–Mahler discriminant bound* (`discriminant-size-bound`): The archimedean bound |D(f)| ≤ n^{2n−1}max|a_i|^{2n−2} is quoted by BEG from Lewis–Mahler, Acta Arith. 6
(1961) p. 335, which was not read. Mahler's inequality |D(f)| ≤ n^nM(f)^{2n−2} with Landau's bound gives
e·n^{2n−1}max|a_i|^{2n−2}, sufficient for every use up to the numerical constants; Mahler's discriminant
inequality and Hadamard's determinant inequality are not in the pinned libraries (Mathlib's Matrix.det_le is
only the n!·x^n bound).
- *Rosser–Schoenfeld prime-counting bound* (`lcm-of-first-integers-bound`): u(m) = lcm(1, …, m) ≤ 4^m needs π(x) < 1.25506x/log x (Rosser–Schoenfeld 1962, Corollary 1), which is not
planned in a roadmap of tier ≤ 4. Mathlib's Chebyshev.pi_le_log4_mul_div gives the weaker u(m) ≤
16^m·m^{√m}, enough for all effective statements.
- *Quantitative independent-height product* (`multiplicatively-independent-height-product-lower-bound`): Loher–Masser Theorem 3 and Győry–Yu Proposition 1 were read. The missing input is the shifted-height
counting estimate (4.6), its numerical Lemma 5(e) giving 58 after H = exp(n/(2d)) (rational counting bound
17H²), and the Blichfeldt/saturation-lattice argument on pp. 293–294. Ordinary Northcott finiteness alone
does not yield these quantitative constants. This key node supplies the exact small-representative and
variable-exponent unit estimates.
- *Local primitive-element derivative bridge for the compositum different* (`relative-discriminant-of-compositum`): Stark (1974), Lemma 6, p. 143, chooses an integral primitive element whose minimal-polynomial derivative
attains the different order at a selected prime, then compares the factor minimal polynomial after base
change. This local choice and derivative/different divisibility are not provided by the cited
NumberFieldArithmetic statements. Plan them in NumberFieldArithmetic’s different direction or supply a
precise local supplier; the norm/tower deduction is already given here.

## Acceptance tests

Every definition above lists its unit tests and every theorem its checks. The decisive ones are these:

- `N_{{2}}(12) = 3` over ℚ and `N_∅(1 + i) = 2` in ℚ(i) pin the normalisation of the S-norm, including the
weight 2 of a complex place.
- `h(X − 1/2) = log 2` and `h(2X) = log 2` separate the polynomial height from the projective height of the
coefficient vector.
- `R_S = log p` for ℚ and S = {(p)}; R_∅ is Mathlib's regulator; squaring a system multiplies the determinant
by 2^k.
- y² = 2x² + 1 has infinitely many integral solutions, so the hyperelliptic theorems need n ≥ 3 and the Pell
systems need two equations.
- For odd distinct primes p, q the Cassels-type factorisations have δ ∈ {−1, 0} and ρ, σ ≥ 2; 3² − 2³ = 1
shows why the even case is treated separately.
- F = (X − Y)³ has infinitely many solutions of F = 1, so the uniform Thue bound needs a nonzero discriminant;
X³ − 2Y³ = 1 has at least the two solutions (1, 0), (−1, −1).

## Notes on the sources

- **E701 — confirmed** (§5, completion of the proof of Theorem 2.3, estimate (5.19), p. 28 (arXiv v1); also present in the published version (pagination adds 726).). h(ξ_1/ξ_2) ≤ (2/m)(h_{L_1}h_{L_2}·X + C_2) + ½(t_1 + t_2 − 2)C_1. The extra factor r = h_{L_1}h_{L_2} ≤
(2n³s)^{4ns}e^{4ndĥ}|D_K|^{2n} multiplies C₄ in (5.20). After also retaining the factor n from (5.12), using
N(v)/log N(v) ≤ 3P_S^{n(n−1)}, and the full absorption proved in beg-schinzel-tijdeman-bound, this gives m ≤
(10n²s)^{46ns}|D_K|^{8n}P_S^{n²}e^{15ndĥ} instead of the printed (2.7). Checked against the arXiv passage
and the corresponding published BEG passage; the corrected interface is used by the packet.
- **E702 — confirmed** (§5, first paragraph, p. 22 (arXiv v1); also present in the published version (pagination adds 726).). L_i = K(α_i), as in §4. Checked against the arXiv passage and the corresponding published BEG passage; the
corrected interface is used by the packet.
- **E703 — confirmed** (§3.1, Lemma 3.4, p. 7 (arXiv v1); also present in the published version (pagination adds 726).). m ≥ 1 (in the applications m ≥ 2). Checked against the arXiv passage and the corresponding published BEG
passage; the corrected interface is used by the packet.
- **E704 — confirmed** (§5, Lemma 5.1, p. 23 (arXiv v1); also present in the published version (pagination adds 726).). b_{i1}, …, b_{i,t_i−1}, one for each element of the fundamental system η_{i1}, …, η_{i,t_i−1}, as in formula
(5.8). Checked against the arXiv passage and the corresponding published BEG passage; the corrected
interface is used by the packet.
- **E705 — rejected** (§5, end of the proof of Theorem 1, p. 208). In the case q > p the comparison uses x > y, which gives p^{δ₁}ρ^q ≥ q^{δ₂}σ^p − 1, so the upper bound for
the three-logarithm form becomes at most 4q²/σ^p; the rest of the argument goes through with the roles of
(p, ρ, δ₁) and (q, σ, δ₂) exchanged and slightly larger constants. The omitted mirror case is routine and
does not invalidate Tijdeman’s assertion. The reviewed proof supplies both its three-logarithm comparison
and its distinct two-logarithm normalization; this is a roadmap proof expansion, not a source error.
- **E706 — confirmed** (§5, (5.12), arXiv p. 25; published p. 751). Retain n: X ≥ m/(4nd(log 3d)³) once X ≥ 2ĥ/n. The preceding bound is m ≤ 2d(log 3d)³(nX+2ĥ); replacing 2ĥ by
nX leaves 4nd(log 3d)³X, not 4d(log 3d)³X.
- **E707 — confirmed** (§3.6, proofs of Propositions 3.11–3.12, arXiv pp. 13–14; published p. 739). Handle unit rank zero separately, or use max(1,c₃), and justify the remaining numerical absorption. Győry–Yu
define c₃ = 0 when the ordinary unit rank is zero (p. 11), so the printed comparison would give a zero
coordinate bound. Their theorem retains other positive height terms. The BEG statement is preserved with a
precise comparison gap.
- **E708 — confirmed** (§5, after (5.21), arXiv p. 28; published p. 753). Use N(v₀)/log N(v₀) ≤ 3P_S^{n(n−1)}, covering both infinite and finite places. If S has no finite primes,
P_T = P_S = 1 but N(v₀) = 2. The revised bound also retains the denominator log N(v₀); the final corrected
constant absorbs the factor 3.

The independent review read Győry–Yu’s public publisher PDF. Its source access is resolved; the remaining gaps identify the quantitative inputs and exact constant comparisons. The revised 46ns exponent bound is derived in full above, conditional on those stated inputs. These roadmap statements are not claims of completed formalization.
