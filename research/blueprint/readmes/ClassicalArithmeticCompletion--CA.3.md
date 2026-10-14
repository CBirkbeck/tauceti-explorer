# Classical arithmetic, sequences, polynomials and reciprocity — CA.3, continued

## CA.3. Polynomial and matrix arithmetic: integer-valued polynomials over number fields, Pólya groups, factor and root bounds, and linear-algebra suppliers

This document continues layer CA.3 of the roadmap. The layer's other targets — the Smith, Hermite and
rational canonical normal forms, `Int(D)` with its characteristic ideals and Pólya's theorem for
`ℤ`, the Capelli, Perron and Cohn criteria, Newton polygons, Dumas's theorem and the
Eisenstein–Dumas criterion — are stated in the main CA document and are cited here by their ids
(written `CA.3/…`). This part adds:

1. **Integer-valued polynomials over Dedekind domains and number fields.** Localization of `Int(D)`;
   Newton sequences; the Legendre exponent `w_q(n)`; the v-ordering of a discrete valuation ring with
   finite residue field and the regular basis of `Int(V)` it produces; the local formula
   `I_n(D) = ∏_𝔪 𝔪^{−w_{N(𝔪)}(n)}`; factorial ideals `n!_D`; the ideals `Π_q(D)`; the
   Pólya–Ostrowski criterion for regular bases; Pólya fields and the Pólya group; Ostrowski's theorem
   for Galois fields; the imaginary quadratic Pólya fields; and Zantema's theorem that cyclotomic
   fields are Pólya fields.
2. **Factor bounds.** Mignotte's √m-exponent inequality for irreducible integer factors and the bound
   for the value of an irreducible factor at an integer point (Bary-Soroker–Koukoulopoulos–Kozma,
   Lemma 3.4).
3. **Squarefree combinations.** The primitive gcd of a family of integer polynomials and Smith's
   bounded squarefree integral combination (Lemma 2.10).
4. **Root bounds.** Fujiwara's weighted root bound and its monic form.
5. **Library inputs for the earlier CA.3 targets.** The Gregory–Newton expansion; a lower Newton
   polygon for an arbitrary finite point family, with supporting lines, contact sets and slope
   ordering; Gauss–Jordan elimination over a field with the kernel basis read off the reduced echelon
   form; and a table naming, for each earlier target, the library declarations its proof uses.

Landmarks: Factorial ideal; Pólya–Ostrowski criterion; Pólya field; Pólya group; Fujiwara's root
bound.

### Conventions

* `D` is an integral domain with fraction field `K`; `Int(D) = {f ∈ K[X] : f(D) ⊆ D}` is a
  `D`-subalgebra of `K[X]`, and its `n`-th characteristic ideal `I_n(D)` is the set of leading
  coefficients of its degree-`n` members, with `0` (`CA.3/characteristic-ideals-of-int`). A regular
  basis is a `D`-basis `(f_n)_{n≥0}` with `deg f_n = n`.
* For a Dedekind domain, `N(𝔪) = |D/𝔪|` is the norm of a maximal ideal. The global results assume
  that `D` is not a field and that every residue field is finite (the main case is `D = 𝓞_K`).
* `w_q(n) = Σ_{k≥1} ⌊n/q^k⌋` for an integer `q ≥ 2`, and `v_q(l)` is the largest `h` with `q^h | l`.
* `n!_D = ∏_𝔪 𝔪^{w_{N(𝔪)}(n)}` and `Π_q(D) = ∏_{N(𝔪) = q} 𝔪` (the unit ideal when no maximal ideal
  has norm `q`).
* `‖f‖₂` is the Euclidean norm of the coefficient vector of an integer polynomial.
* Newton polygons follow the main CA document: for a finite point family `(i, y_i)` the supporting
  value of parameter `r` is `μ_r = min_i (y_i + r i)`; in the polynomial case `r` is the valuation of a
  root, and the geometric slope in the `(i, y)` plane is `−r`.
* A matrix acts on column vectors; a reduced row echelon form is Mathlib's
  `Matrix.IsReducedRowEchelon`, with pivots recorded by `Matrix.IsPivotedBy`.

### Boundaries

* Class groups, ramification and the splitting of primes in Galois and cyclotomic fields are taken
  from Mathlib (`ClassGroup`, `Ideal.ramificationIdx_eq_of_isGaloisGroup`,
  `IsCyclotomicExtension.Rat.ramificationIdxIn_eq`, …); the Tau Ceti roadmaps NumberFieldArithmetic and
  GlobalNumberFields own the general theory and are not re-planned.
* The ring of integers of a quadratic field is `CA.5/index-of-the-order-z-sqrt-d`.
* The classification of the real quadratic Pólya fields depends on the norm of the fundamental unit
  through Hilbert's count of ambiguous classes; it is not a target of this layer.
* Mahler measure, Landau's inequality and the binomial coefficient bound are Mathlib's
  (`Analysis/Polynomial/MahlerMeasure`); special algebraic numbers and lower bounds for the Mahler
  measure are CA.6.
* Resultants are Mathlib's `Polynomial.resultant` with explicit formal degrees; the discriminant of a
  polynomial and its product formulas belong to the Tau Ceti roadmap PolynomialGaloisGroups.
* Row echelon forms and their rank are Mathlib's (`LinearAlgebra/Matrix/Echelon`); this layer adds the
  algorithm, the uniqueness of the reduced form and the kernel basis.

### Sources


* [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf): Paul-Jean Cahen and Jean-Luc Chabert, *What You Should Know About Integer-Valued Polynomials*. The American Mathematical Monthly 123 (2016), no. 4, 311–337, doi:10.4169/amer.math.monthly.123.4.311; publisher PDF as posted on a University of Rochester page (same file as the main packet's copy), read 2026-10-14. Read: Section 1, formulas (1)–(3) (printed pp. 311–312); Section 5: characteristic ideals, Propositions 19–20 with the proof of Proposition 20 (printed p. 322); Section 6: Lemma 28 with its proof sketch, Proposition 29, Remark 4 (printed pp. 328–329); Section 6: v-orderings, formulas (13)–(15), Remark 6, Proposition 31, Pólya groups and Pólya fields, Propositions 32–33, Example 34 (printed pp. 330–333).
* [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf): Jean-Luc Chabert, *Integer-Valued Polynomials: Looking for Regular Bases (a Survey)*. The author's PDF posted on his LAMFA page (27 pages; page numbers below are those of this PDF), read 2026-10-14. Read: Section 3: Definitions 1–3, Lemma 1, Proposition 5, formulas (11)–(13), Propositions 6–9, Section 3.4 (localization, (17)–(19)) (pp. 4–7); Section 4: Proposition 10, Example 1, Definition 4, Example 2, Proposition 11, Corollary 1, formula (27), Proposition 12 with proof (pp. 7–9); Section 5: Propositions 16 and 18, Corollaries 3–5, Section 5.4 (Definition 6, Proposition 19, the Galois remark, Proposition 20) (pp. 10–13).
* [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf): Amandine Leriche, *Pólya fields, Pólya groups and Pólya extensions: a question of capitulation*. Journal de Théorie des Nombres de Bordeaux 23 (2011), no. 1, 235–249, doi:10.5802/jtnb.758; publisher's open PDF (Centre Mersenne), read 2026-10-14. Read: Section 1: Definitions 1.1–1.4, Propositions 1.1–1.2 with proofs (pp. 235–238); Section 2: Definitions 2.1–2.2, Propositions 2.1–2.4, Example 1, Corollary 2.1 (pp. 238–241); Section 3: Proposition 3.1, Corollaries 3.1–3.4 (pp. 241–242).
* [smith-conjugates-2024](https://arxiv.org/pdf/2111.12660v2): Alexander Smith, *Algebraic integers with conjugates in a prescribed distribution*. arXiv:2111.12660v2 (16 March 2024), read 2026-10-14. Read: Section 2: Definition 2.9 and Lemma 2.10 with its proof (pp. 8–9); Section 3: the two applications of Lemma 2.10 in the proofs of Theorem 3.1 and its lemmas (pp. 18–20), and the remark that a squarefree integer polynomial has a nonzero integer discriminant (p. 17).
* [bskk-random-polynomials-2023](https://arxiv.org/pdf/2007.14567v3): Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma, *Irreducibility of random polynomials: general measures*. arXiv:2007.14567v3, read 2026-10-14. Read: Section 3: Lemma 3.3, Lemma 3.4 with its proof, and the use of Lemma 3.4 in the proof of Lemma 3.3 (pp. 20–21); Reference [28] (Mignotte 1988), p. 64.
* [bsw-squarefree-discriminants-2022](https://arxiv.org/pdf/1611.09806v3): Manjul Bhargava, Arul Shankar and Xiaoheng Wang, *Squarefree values of polynomial discriminants I*. arXiv:1611.09806v3 (31 December 2021), read 2026-10-14. Read: Section 1, the definition of the height H(f) (p. 1); Section 5, proof of Corollary 1.4 (p. 27); Reference [10] (Fujiwara 1916).
* [fujiwara-rootbound-1916](https://www.jstage.jst.go.jp/article/tmj1911/10/0/10_0_167/_pdf): Matsusaburô Fujiwara, *Über die obere Schranke des absoluten Betrages der Wurzeln einer algebraischen Gleichung*. Tôhoku Mathematical Journal, First Series, 10 (1916), 167–171; publisher's free scan on J-STAGE, read 2026-10-14 (page images inspected). Read: The whole note: formula (1) with its derivation and footnote, formulas (2)–(5) (printed pp. 167–168), and the remaining remarks (pp. 169–171).
* [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf): Jim Hefferon, *Linear Algebra, fourth edition*. Fourth edition, the author's free PDF (GNU FDL / CC BY-SA), file dated 8 May 2020, from the University of Vermont mirror of the book's page (same file as the main packet's copy), read 2026-10-14. Read: Chapter One, Section I.1: Theorem 1.5 (Gauss's Method preserves solution sets) (printed p. 4); Chapter One, Section I.3: Lemma 3.6 with its proof (printed pp. 25–27); Chapter One, Section III: Definition 1.3, Lemmas 1.5–1.6, Lemma 2.5, Theorem 2.6 with Yuster's proof, Corollary 2.7 (printed pp. 50–61).
* [kedlaya-newtonpolygons-2007](https://kskedlaya.org/18.787/newton-poly.pdf): Kiran S. Kedlaya, *p-adic differential equations (18.787, MIT, fall 2007): Newton polygons*. Course notes (same file as the main packet's copy), read 2026-10-14. Read: Section 1, slopes and Newton polygons: the lower convex hull of the points (−i, v(P_i)) and the slope multiset (p. 1); Section 2: the sloped valuation as the intercept of the supporting line, Proposition 1 and Corollaries 2–3 with proofs (pp. 1–2).

Mignotte, *An inequality about irreducible factors of integer polynomials*, J. Number Theory 30 (1988), 156–166, Theorem 1′, is the source of record for `CA.3/mignotte-irreducible-factor-l2-bound`; its proof has not been read here (see Gaps).


## Integer-valued polynomials over Dedekind domains

<a id="CA-3-int-valued-localization"></a>

### Integer-valued polynomials commute with localization

`ClassicalArithmeticCompletion:CA.3/int-valued-localization` · theorem.

Let D be an integral domain with fraction field K and S ⊆ D a multiplicative set with 0 ∉ S. (i) If f ∈ K[X] satisfies f(D) ⊆ S⁻¹D, then f(S⁻¹D) ⊆ S⁻¹D; consequently S⁻¹Int(D) ⊆ Int(S⁻¹D) inside K[X]. (ii) If D is Noetherian, then S⁻¹Int(D) = Int(S⁻¹D); in particular Int(D)_𝔭 = Int(D_𝔭) for every prime 𝔭 of D. (iii) If D is Noetherian, the characteristic ideals localize: S⁻¹I_n(D) = I_n(S⁻¹D) for every n ≥ 0.

Hypotheses and conventions: D an integral domain with fraction field K (Mathlib IsFractionRing D K); S a submonoid of D not containing 0, S⁻¹D the corresponding subring of K (Mathlib IsLocalization). D Noetherian for (ii) and (iii); (i) holds for every domain. Without the Noetherian hypothesis only the inclusion S⁻¹Int(D) ⊆ Int(S⁻¹D) is asserted.

Acceptance checks:

- For D = ℤ and S = ℤ ∖ pℤ: Int(ℤ)_(p) = Int(ℤ_(p)); for example (X³ − X)/3 lies in both for p = 3, and X(X − 1)/2 lies in Int(ℤ_(3)) already because 2 is a unit there.
- For D = ℤ and n = 2: I_2(ℤ_(p)) = ½ℤ_(p) is ℤ_(p) for p odd and ½ℤ_(2) for p = 2, matching I_2(ℤ) = ½ℤ localized.
- The proof of (ii) uses finite generation of the module of values; it is the step where the Noetherian hypothesis enters.

Proof sketch:

1. (i), by induction on n = deg f (Cahen–Chabert, Lemma 28): constants are clear. For a/s with a ∈ D, s ∈ S put g(X) = sⁿ f(X) − f(sX); the leading terms cancel, so deg g < n, and g(D) ⊆ S⁻¹D because sⁿ f(x) and f(sx) lie in S⁻¹D for x ∈ D. By induction g(a/s) ∈ S⁻¹D, and sⁿ f(a/s) = g(a/s) + f(a) ∈ S⁻¹D; divide by the unit sⁿ of S⁻¹D.
2. Inclusion: for f ∈ Int(D) and t ∈ S, f/t takes values in S⁻¹D on D, hence on S⁻¹D by (i).
3. (ii): let f ∈ Int(S⁻¹D). Clearing denominators, d f ∈ D[X] for some nonzero d ∈ D, so the D-submodule M of K generated by f(D) lies in d⁻¹D ≅ D. As D is Noetherian, M is generated by finitely many values f(a_1), …, f(a_r); each lies in S⁻¹D, so one t ∈ S has t f(a_j) ∈ D for all j, hence t M ⊆ D, i.e. t f ∈ Int(D) and f = (t f)/t ∈ S⁻¹Int(D).
4. (iii): for f ∈ Int(D) of degree n and t ∈ S, f/t ∈ Int(S⁻¹D) has degree n and leading coefficient lc(f)/t, so S⁻¹I_n(D) ⊆ I_n(S⁻¹D); conversely if g ∈ Int(S⁻¹D) has degree n, (ii) gives t ∈ S with t g ∈ Int(D) of degree n, so lc(g) ∈ t⁻¹ I_n(D).

Direct prerequisites: `CA.3/integer-valued-polynomials` (main CA document), `CA.3/characteristic-ideals-of-int` (main CA document), `mathlib:IsLocalization`, `mathlib:IsNoetherianRing`, `mathlib:IsNoetherian`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, Lemma 28 with its proof sketch and Proposition 29, printed pp. 328–329. Lemma 28 is part (i), proved by the same degree induction; Proposition 29 is part (ii) for a prime, stated without proof and attributed to the authors' book (Theorem I.2.3). The Noetherian finite-generation argument of step 3 is supplied here.

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 3.4, formulas (17)–(19), pp. 6–7. States the equality of localizations for Noetherian D (citing the book, Proposition I.2.7) and derives the localization of the characteristic and factorial ideals, which is part (iii).

<a id="CA-3-newton-sequence-criterion"></a>

### Newton sequences and generalized binomial bases

`ClassicalArithmeticCompletion:CA.3/newton-sequence-criterion` · theorem.

Let D be an integral domain with fraction field K and (a_n)_{n≥0} a sequence of pairwise distinct elements of D. Put f_0 = 1 and, for n ≥ 1, f_n(X) = ∏_{k<n} (X − a_k)/(a_n − a_k), the unique polynomial of degree n with f_n(a_k) = 0 for k < n and f_n(a_n) = 1. The following are equivalent: (1) every f_n lies in Int(D); (2) (f_n)_{n≥0} is a basis of the D-module Int(D) (necessarily regular: deg f_n = n); (3) for every n and every f ∈ K[X] of degree at most n, f ∈ Int(D) if and only if f(a_0), …, f(a_n) ∈ D. When they hold, (a_n) is called a Newton sequence of D, and I_n(D) = (∏_{k<n}(a_n − a_k))⁻¹ D for every n.

Hypotheses and conventions: D an integral domain; the a_n pairwise distinct (so D is infinite).

Acceptance checks:

- D = ℤ, a_n = n: f_n is the binomial polynomial (X choose n), and the criterion is Pólya's theorem (CA.3/polya-binomial-basis) together with the test on 0, 1, …, n (CA.3/integer-valued-iff-consecutive-values); the shifted sequence a_n = a + n gives the test on any n + 1 consecutive integers.
- Non-example: in D = ℤ the sequence 0, 2, 1, 3, 4, 5, … is not a Newton sequence, because f_1 = X/2 is not integer-valued.
- I_n(ℤ) = (1/n!)ℤ is recovered from ∏_{k<n}(n − k) = n!.

Proof sketch:

1. Expansion: f_0, …, f_n is a K-basis of the polynomials of degree ≤ n (degrees 0, …, n), and every f of degree ≤ n is f = Σ_{k≤n} c_k f_k with c_k = f(a_k) − Σ_{j<k} c_j f_j(a_k): the system is triangular with unit diagonal because f_j(a_k) = 0 for k < j and f_k(a_k) = 1 (Cahen–Chabert, proof of Proposition 20).
2. (1) ⇒ (3): if f(a_0), …, f(a_n) ∈ D, induction on k gives c_k ∈ D because every f_j(a_k) ∈ D; so f is a D-combination of integer-valued polynomials. The converse direction of (3) is trivial.
3. (1) ⇒ (2): spanning is (3) applied to f ∈ Int(D); independence holds because the degrees are distinct (a nonzero combination has the degree of its top term).
4. (2) ⇒ (1) is trivial, and (3) ⇒ (1) because f_n takes the values 0 and 1 at a_0, …, a_n.
5. Characteristic ideals: (f_n) is a regular basis, so by CA.3/regular-basis-iff-characteristic-ideals-principal the leading coefficient 1/∏_{k<n}(a_n − a_k) generates I_n(D).

Direct prerequisites: `CA.3/integer-valued-polynomials` (main CA document), `CA.3/characteristic-ideals-of-int` (main CA document), `CA.3/regular-basis-iff-characteristic-ideals-principal` (main CA document), `mathlib:Polynomial.eq_of_degree_sub_lt_of_eval_finset_eq`, `mathlib:Module.Basis`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 5, Proposition 20 with its proof, printed p. 322. Proposition 20 is this equivalence for a subset E of D (here E = D), proved by the triangular expansion used in the first steps.

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 4.2, Proposition 11, p. 8, and Section 5.2, Proposition 16, pp. 10–11. The local (v-ordering) and global (simultaneous ordering) forms of the same equivalence; Proposition 16(5) is the formula for the characteristic (factorial) ideals.

<a id="CA-3-legendre-exponent"></a>

### The Legendre exponent w_q(n)

`ClassicalArithmeticCompletion:CA.3/legendre-exponent` · definition.

For an integer q ≥ 2 and n ∈ ℕ, w_q(n) = Σ_{k≥1} ⌊n/q^k⌋, a finite sum since its terms vanish once q^k > n. Equivalently w_q(n) = Σ_{l=1}^{n} v_q(l), where v_q(l) is the largest h with q^h | l. For a prime p, w_p(n) = v_p(n!) (Legendre's formula); for a prime power q = p^f with f ≥ 2, w_q(n) is not a p-adic valuation of n!.

Hypotheses and conventions: q ≥ 2 an integer (q = 1 is excluded: the sum would diverge).

API:

- `legendreExponent` (constructor): w_q(n) := Σ_{k ∈ [1, n]} n / q^k for q ≥ 2.
- `LegendreExponent.eq_sum_multiplicity` (characterisation): w_q(n) = Σ_{l=1}^{n} v_q(l), with v_q(l) the largest h such that q^h | l.
- `LegendreExponent.succ` (relation): w_q(n + 1) = w_q(n) + v_q(n + 1).
- `LegendreExponent.eq_zero_iff` (simp): For q ≥ 2: w_q(n) = 0 ↔ n < q.
- `LegendreExponent.self` (example): w_q(q) = 1.
- `LegendreExponent.add_le` (relation): w_q(m) + w_q(n) ≤ w_q(m + n).
- `LegendreExponent.prime_eq_padicValNat` (compatibility): For p prime: w_p(n) = padicValNat p n! (Mathlib padicValNat_factorial).

Unit tests:

- `TauCeti.ClassicalArithmetic.legendreExponent_two_four` (computation): w_2(4) = 3 and w_3(10) = 4.
- `TauCeti.ClassicalArithmetic.legendreExponent_four_four` (computation): w_4(4) = 1.
- `TauCeti.ClassicalArithmetic.legendreExponent_lt` (degenerate): w_q(n) = 0 for every n < q, and w_q(0) = 0.
- `TauCeti.ClassicalArithmetic.legendreExponent_five_factorial` (compatibility): w_5(26) = 6 = padicValNat 5 26!.
- `TauCeti.ClassicalArithmetic.legendreExponent_four_eight_ne` (non-example): w_4(8) = 2, whereas padicValNat 2 8! = 7: for a prime power q = p^f with f ≥ 2, w_q(n) is not the p-adic valuation of n!.

Uses: ClassicalArithmeticCompletion:CA.3/v-ordering-of-a-dvr — w_q(n) is the valuation of ∏_{k<n}(a_n − a_k) for the v-ordering of a DVR with residue field of size q; ClassicalArithmeticCompletion:CA.3/characteristic-ideals-of-a-dedekind-domain — the exponent of a maximal ideal 𝔪 in I_n(D) is −w_{N(𝔪)}(n); ClassicalArithmeticCompletion:CA.3/factorial-group-basis — the successive quotients of factorial ideals are governed by w_q(n) − w_q(n − 1) = v_q(n); Cahen–Chabert, Section 6, formula (15) — n!_{𝓞_K} = ∏_𝔪 𝔪^{w_{N(𝔪)}(n)}.

Acceptance checks:

- w_2(4) = 3 = v_2(24), w_4(4) = 1, w_3(10) = 3 + 1 = 4.
- w_q(n) = 0 for n < q.

Proof sketch:

1. Define w_q(n) as the sum of n / q^k (natural-number division) over 1 ≤ k ≤ n; the terms with q^k > n vanish.
2. Σ_{k≥1} ⌊n/q^k⌋ counts the pairs (l, k) with 1 ≤ l ≤ n, k ≥ 1 and q^k | l, which is Σ_{l≤n} v_q(l).
3. Hence w_q(n + 1) − w_q(n) = v_q(n + 1), w_q(n) = 0 iff n < q, and w_q(q) = 1.
4. Superadditivity w_q(m) + w_q(n) ≤ w_q(m + n) termwise from ⌊x⌋ + ⌊y⌋ ≤ ⌊x + y⌋.
5. For q = p prime this is Mathlib's Legendre formula (padicValNat_factorial).

Direct prerequisites: `mathlib:padicValNat_factorial`, `mathlib:Nat.factorization_factorial`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, the v-ordering formula for w_q(n), printed pp. 331–332. Defines w_q(n) as the valuation of the v-ordering products and shows it equals Σ_{l≤n} v_q(l) = Σ_k ⌊n/q^k⌋, noting the analogy with Legendre's formula.

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Section 2, the function w_m and the remark on K = ℚ, p. 239. The same function indexed by the norm of a maximal ideal, with w_p(n) = v_p(n!) for ℚ.

<a id="CA-3-v-ordering-of-a-dvr"></a>

### The v-ordering of a discrete valuation ring with finite residue field

`ClassicalArithmeticCompletion:CA.3/v-ordering-of-a-dvr` · construction.

Let V be a discrete valuation ring with normalized valuation v, maximal ideal 𝔪 = πV and finite residue field of cardinality q. Fix representatives r_0 = 0, r_1, …, r_{q−1} ∈ V of the classes of V/𝔪. For n = Σ_i n_i q^i written in base q (0 ≤ n_i < q) put a_n = Σ_i r_{n_i} π^i. Then: (a) v(a_n − a_m) = v_q(n − m) for n ≠ m; (b) for all s, h ≥ 0 the q^h consecutive terms a_s, …, a_{s+q^h−1} form a complete set of representatives of V/𝔪^h; (c) v(∏_{k<n}(a_n − a_k)) = w_q(n); (d) v(∏_{k<n}(x − a_k)) ≥ w_q(n) for every x ∈ V. In Bhargava's terms (a_n) is a v-ordering of V, and so is every shifted sequence (a_{s+n})_n.

Hypotheses and conventions: V a discrete valuation ring (Mathlib IsDiscreteValuationRing) with finite residue field of cardinality q; π a uniformizer; r : Fin q → V a system of representatives of V/𝔪 with r 0 = 0.

API:

- `dvrVOrdering` (constructor): The sequence ℕ → V determined by the uniformizer π and the representatives r, a_n = Σ_i r_{n_i} π^i over the base-q digits of n.
- `VOrderingData.seq_zero` (simp): a_0 = 0, and a_i = r_i for i < q.
- `VOrderingData.addVal_seq_sub` (characterisation): For n ≠ m: v(a_n − a_m) = v_q(n − m).
- `VOrderingData.seq_injective` (structure): n ↦ a_n is injective.
- `VOrderingData.bijective_mod_pow` (characterisation): For all s, h, the map k ↦ a_{s+k} mod 𝔪^h is a bijection from [0, q^h) onto V/𝔪^h.
- `VOrderingData.addVal_prod_seq` (relation): v(∏_{k<n}(a_n − a_k)) = w_q(n).
- `VOrderingData.le_addVal_prod_sub_seq` (relation): For every x ∈ V: w_q(n) ≤ v(∏_{k<n}(x − a_k)) (the v-ordering property).
- `VOrderingData` (data): The data (q, π, r) with 2 ≤ q = |V/𝔪|, π irreducible, r a system of representatives with r 0 = 0, and its sequence VOrderingData.seq.

Unit tests:

- `TauCeti.ClassicalArithmetic.dvrVOrdering_int_eq` (compatibility): For V = ℤ_(p), π = p and r_i = i, a_n = n for all n.
- `TauCeti.ClassicalArithmetic.dvrVOrdering_gaussian` (computation): For V = ℤ[i] localized at (1 + i), π = 1 + i, r = (0, 1): a_2 = 1 + i, a_4 = 2i and v(a_4 − a_0) = 2.
- `TauCeti.ClassicalArithmetic.dvrVOrdering_first_terms` (degenerate): a_0 = 0 and (a_0, …, a_{q−1}) = (r_0, …, r_{q−1}).
- `TauCeti.ClassicalArithmetic.natCast_not_vOrdering_inert` (non-example): In V = ℤ[i] localized at the inert prime 3 (q = 9), the sequence a_n = n is not a v-ordering: v(∏_{k<3}(3 − k)) = v(6) = 1, whereas w_9(3) = 0.

Uses: ClassicalArithmeticCompletion:CA.3/local-regular-basis-of-int-dvr — its generalized binomials form a regular basis of Int(V) and compute I_n(V); Leriche, Proposition 1.1, proof, pp. 237–238 — a local regular basis of Int(A_𝔪) built from such a sequence is used to compare Int(A, B) with the B-module generated by Int(A); Cahen–Chabert, Section 6, formula (15) — globalization of the local factorials to n!_{𝓞_K}.

Acceptance checks:

- V = ℤ_(p), π = p, r_i = i: a_n = n for every n, and (c) is Legendre's formula v_p(n!) = w_p(n).
- V = ℤ[i] localized at (1 + i) (q = 2), π = 1 + i, r = (0, 1): a_2 = 1 + i, a_3 = 2 + i, a_4 = (1 + i)² = 2i, and v(a_4 − a_0) = v(2i) = 2 = v_2(4).

Proof sketch:

1. (a): if n and m first differ in the base-q digit of index i, then a_n − a_m = π^i (r_{n_i} − r_{m_i}) + π^{i+1}·(element of V), and r_{n_i} − r_{m_i} is a unit, so v(a_n − a_m) = i; and i = v_q(n − m) because n ≡ m modulo q^i but not modulo q^{i+1}.
2. (b): among q^h consecutive indices no two are congruent modulo q^h, so by (a) no two of the a's are congruent modulo 𝔪^h; there are q^h = |V/𝔪^h| of them.
3. (c): Σ_{k<n} v(a_n − a_k) = Σ_{k<n} v_q(n − k) = Σ_{l=1}^{n} v_q(l) = w_q(n) (CA.3/legendre-exponent).
4. (d): v(∏_{k<n}(x − a_k)) = Σ_{h≥1} #{k < n : x ≡ a_k mod 𝔪^h}. Split 0, …, n − 1 into ⌊n/q^h⌋ full blocks of q^h consecutive indices and a remainder; by (b) each full block contains exactly one k with a_k ≡ x mod 𝔪^h. Summing over h gives at least Σ_h ⌊n/q^h⌋ = w_q(n).
5. The shifted sequence satisfies (a) with the same right-hand side, so (b)–(d) hold for it too (the strong v-ordering property).

Direct prerequisites: `mathlib:IsDiscreteValuationRing`, `mathlib:Nat.digits`, [CA.3/legendre-exponent](#CA-3-legendre-exponent).

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, v-orderings, formulas (13) and (14) and the computation of w_q(n), printed pp. 331–332; Remark 6, p. 332. Constructs exactly this sequence, states (a) as formula (14) and derives (b) and (c); states that it is a v-ordering citing the authors' book (Lemma II.2.6), and Remark 6 is the shifted (strong) property.

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 4.1, Proposition 10, Example 1 and Example 2(4), p. 7–8. Proposition 10 lists (a), (b) and (c) as equivalent characterizations of these sequences, Example 1 is the construction, and Example 2(4) says every shift is a v-ordering. The short proofs of (a)–(d) above are supplied here; the source cites the book for them.

<a id="CA-3-local-regular-basis-of-int-dvr"></a>

### Regular basis and characteristic ideals of Int(V) for a discrete valuation ring

`ClassicalArithmeticCompletion:CA.3/local-regular-basis-of-int-dvr` · theorem.

Let V be a discrete valuation ring with uniformizer π. (1) If the residue field of V is finite of cardinality q and (a_n) is the v-ordering of CA.3/v-ordering-of-a-dvr, the polynomials f_n = ∏_{k<n}(X − a_k)/(a_n − a_k) form a regular basis of Int(V); a polynomial of degree at most n lies in Int(V) iff its values at any n + 1 consecutive terms a_s, …, a_{s+n} lie in V; and I_n(V) = π^{−w_q(n)} V. (2) If the residue field of V is infinite, Int(V) = V[X] and I_n(V) = V for every n.

Hypotheses and conventions: V a discrete valuation ring with fraction field K.

Acceptance checks:

- V = ℤ_(p): the binomial polynomials (X choose n) form a regular basis of Int(ℤ_(p)) and I_n(ℤ_(p)) = p^{−v_p(n!)} ℤ_(p).
- V = ℤ[i] localized at (1 + i) (q = 2): I_2(V) = π^{−1}V, I_3(V) = π^{−1}V and I_4(V) = π^{−3}V, although 4! = 24 has valuation 6 there.
- V = ℂ[[t]] (infinite residue field): Int(V) = V[X].

Proof sketch:

1. (1): by property (d) of the v-ordering, v(f_n(x)) = v(∏_{k<n}(x − a_k)) − v(∏_{k<n}(a_n − a_k)) ≥ w_q(n) − w_q(n) = 0, so f_n ∈ Int(V).
2. CA.3/newton-sequence-criterion then gives the regular basis, the test on a_0, …, a_n, and I_n(V) generated by 1/∏_{k<n}(a_n − a_k), of valuation −w_q(n) by property (c). The shifted sequence is again a v-ordering, which gives the test on any n + 1 consecutive terms.
3. (2): choose x_0, …, x_n ∈ V in pairwise distinct residue classes. For f ∈ Int(V) of degree ≤ n, Lagrange interpolation at the x_i gives d f ∈ V[X] with d = ∏_{i<j}(x_j − x_i) a unit (Cahen–Chabert, Remark 4), so f ∈ V[X].

Direct prerequisites: [CA.3/v-ordering-of-a-dvr](#CA-3-v-ordering-of-a-dvr), [CA.3/newton-sequence-criterion](#CA-3-newton-sequence-criterion), [CA.3/legendre-exponent](#CA-3-legendre-exponent), `CA.3/characteristic-ideals-of-int` (main CA document), `mathlib:IsDiscreteValuationRing`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, v-orderings paragraph, printed pp. 331–332, and Remark 4, printed p. 329. States that the generalized binomials of a v-ordering are integer-valued and form a regular basis of Int(V), that the valuation of the products is w_q(n), and (Remark 4) that an infinite residue field forces Int = V[X].

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 4.2, Proposition 11, Corollary 1 and formula (27), pp. 8–9. Proposition 11 is the v-ordering criterion; Corollary 1 with (26) identifies w_V(n) with −v(I_n(V)); (27) evaluates it as w_q(n), or 0 for an infinite residue field (attributed to Pólya).

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Proof of Proposition 1.1, pp. 237–238. Uses the regular basis of Int(A_𝔪) given by such generalized binomials (citing the book, Theorem II.2.7).

<a id="CA-3-characteristic-ideals-of-a-dedekind-domain"></a>

### The local formula for the characteristic ideals of a Dedekind domain

`ClassicalArithmeticCompletion:CA.3/characteristic-ideals-of-a-dedekind-domain` · theorem.

Let D be a Dedekind domain that is not a field and whose residue fields D/𝔪 are all finite, and write N(𝔪) = |D/𝔪|. For every n ≥ 0 and every maximal ideal 𝔪, the exponent of 𝔪 in the fractional ideal I_n(D) is −w_{N(𝔪)}(n); that is, I_n(D) = ∏_𝔪 𝔪^{−w_{N(𝔪)}(n)}. The product is finite: w_{N(𝔪)}(n) = 0 unless N(𝔪) ≤ n, and only finitely many maximal ideals have norm at most n.

Hypotheses and conventions: D a Dedekind domain, not a field (so D is infinite), with every residue field finite; the main case is D = 𝓞_K for a number field K, where N(𝔪) is the absolute norm.

Acceptance checks:

- D = ℤ: I_n(ℤ) = ∏_p p^{−v_p(n!)} ℤ = (1/n!) ℤ, agreeing with CA.3/characteristic-ideals-of-int.
- D = ℤ[i]: I_2(D) = (1 + i)^{−1} and I_4(D) = (1 + i)^{−3}.
- D = 𝓞_K for K = ℚ(√−5): I_2(D) = 𝔭_2^{−1} with 𝔭_2 = (2, 1 + √−5), a non-principal fractional ideal.

Proof sketch:

1. I_n(D) is a nonzero fractional ideal containing 1 (CA.3/characteristic-ideals-of-int).
2. Finiteness: for any n + 1 distinct elements a_0, …, a_n of D, every maximal ideal of norm at most n contains d = ∏_{i<j}(a_j − a_i) ≠ 0 (two of the a_i are congruent modulo it), so only finitely many have norm ≤ n.
3. Localization (CA.3/int-valued-localization (iii), D Noetherian): I_n(D)_𝔪 = I_n(D_𝔪).
4. D_𝔪 is a discrete valuation ring with residue field D/𝔪 (Mathlib IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain), so I_n(D_𝔪) = 𝔪^{−w_{N(𝔪)}(n)} D_𝔪 by CA.3/local-regular-basis-of-int-dvr.
5. A nonzero fractional ideal of a Dedekind domain is the product of the maximal ideals to the exponents read off in the localizations (Mathlib FractionalIdeal.count and finprod_heightOneSpectrum_factorization').

Direct prerequisites: `CA.3/characteristic-ideals-of-int` (main CA document), [CA.3/int-valued-localization](#CA-3-int-valued-localization), [CA.3/local-regular-basis-of-int-dvr](#CA-3-local-regular-basis-of-int-dvr), [CA.3/legendre-exponent](#CA-3-legendre-exponent), `mathlib:IsDedekindDomain`, `mathlib:IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain`, `mathlib:FractionalIdeal.count`, `mathlib:FractionalIdeal.finprod_heightOneSpectrum_factorization'`, `mathlib:Ideal.absNorm`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, Globalization and formula (15), printed p. 332. Derives from the localization of characteristic ideals that n!_{𝓞_K} = ∏_𝔪 𝔪^{w_{N(𝔪)}(n)}, the inverse statement.

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Proposition 2.1, p. 239. States v_𝔪(I_n(𝓞_K)) = −w_𝔪(n), attributing it to Pólya and to the authors' book.

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 4.3, Proposition 12 with its proof, p. 9. Proves the product formula for the factorial ideals of a Dedekind domain from the localization formulas (19) and the local computation (26)–(27).

<a id="CA-3-factorial-ideal"></a>

### The factorial ideals n!_D of a Dedekind domain

`ClassicalArithmeticCompletion:CA.3/factorial-ideal` · definition. Landmark: **Factorial ideal**.

Let D be a Dedekind domain whose residue fields are all finite, with N(𝔪) = |D/𝔪|. The n-th factorial ideal of D is the integral ideal n!_D = ∏_𝔪 𝔪^{w_{N(𝔪)}(n)} (a finite product). When D is not a field it is the inverse of the n-th characteristic ideal: n!_D = I_n(D)⁻¹ (CA.3/characteristic-ideals-of-a-dedekind-domain). This is Bhargava's factorial of the subset D of D.

Hypotheses and conventions: D a Dedekind domain with finite residue fields; the main case is D = 𝓞_K.

API:

- `factorialIdeal` (constructor): n!_D as an Ideal D: the finite product of 𝔪^{w_{N(𝔪)}(n)} over the maximal ideals 𝔪.
- `FactorialIdeal.count_factorialIdeal` (characterisation): The exponent of 𝔪 in n!_D is w_{N(𝔪)}(n).
- `FactorialIdeal.mul_characteristicIdeal` (characterisation): If D is not a field: n!_D · I_n(D) = D as submodules of K, i.e. n!_D = I_n(D)⁻¹.
- `FactorialIdeal.zero_eq_top` (simp): 0!_D = ⊤ (and FactorialIdeal.one_eq_top: 1!_D = ⊤).
- `FactorialIdeal.int` (compatibility): n!_ℤ = Ideal.span {(n! : ℤ)}.
- `FactorialIdeal.mul_dvd` (relation): m!_D · n!_D ∣ (m + n)!_D.
- `FactorialIdeal.dvd_succ` (relation): n!_D ∣ (n + 1)!_D.
- `FactorialIdeal.eq_prod_polyaIdeal` (relation): n!_D = ∏_{2 ≤ q ≤ n} Π_q(D)^{w_q(n)}.
- `FactorialIdeal.succ` (relation): (n + 1)!_D = n!_D · ∏_{2 ≤ q ≤ n+1} Π_q(D)^{v_q(n+1)}.

Unit tests:

- `TauCeti.ClassicalArithmetic.factorialIdeal_int_eq` (compatibility): For every n, factorialIdeal ℤ n = Ideal.span {(n ! : ℤ)}.
- `TauCeti.ClassicalArithmetic.factorialIdeal_gaussian_four` (computation): In ℤ[i], 2!_D = (1 + i) and 4!_D = (1 + i)³; its norm is 8, not 576.
- `TauCeti.ClassicalArithmetic.factorialIdeal_zero_one` (degenerate): 0!_D = 1!_D = ⊤ for every D.
- `TauCeti.ClassicalArithmetic.factorialIdeal_sqrt_neg_five_two` (non-example): For K = ℚ(√−5), 2!_{𝓞_K} = (2, 1 + √−5) is not principal, so n!_D is not the ideal generated by the integer n! (that ideal is (2) = 𝔭_2² here).

Uses: Cahen–Chabert, Proposition 31, printed p. 332 — Int(𝓞_K) has a regular basis iff every n!_{𝓞_K} is principal; ClassicalArithmeticCompletion:CA.3/polya-group — the Pólya group is generated by the classes of the factorial ideals; ClassicalArithmeticCompletion:CA.3/factorial-group-basis — the factorial ideals and the Π_q generate the same subgroup of ideals; Chabert survey, Section 5.3, Corollary 4, p. 12 — generators d_n of principal factorial ideals give the regular basis g_n/d_n.

Acceptance checks:

- n!_ℤ = n!·ℤ.
- 4!_{ℤ[i]} = (1 + i)³, of norm 8, while 4!·ℤ[i] has norm 576.
- 2!_{𝓞_K} = 𝔭_2 = (2, 1 + √−5) for K = ℚ(√−5), which is not principal.

Proof sketch:

1. Define n!_D as the finite product over the maximal ideals of norm at most n of 𝔪^{w_{N(𝔪)}(n)} (the other factors are D).
2. Identification with I_n(D)⁻¹ when D is not a field: compare exponents with CA.3/characteristic-ideals-of-a-dedekind-domain.
3. Product formula: n!_D = ∏_q Π_q(D)^{w_q(n)}, grouping the maximal ideals by their norm q (CA.3/polya-ideal).
4. Divisibility m!_D · n!_D | (m + n)!_D from w_q(m) + w_q(n) ≤ w_q(m + n), and n!_D | (n + 1)!_D from monotonicity of w_q.
5. D = ℤ: n!_ℤ = ∏_p p^{v_p(n!)} ℤ = n! ℤ by Legendre's formula.

Direct prerequisites: [CA.3/characteristic-ideals-of-a-dedekind-domain](#CA-3-characteristic-ideals-of-a-dedekind-domain), [CA.3/legendre-exponent](#CA-3-legendre-exponent), `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:Ideal.absNorm`, `mathlib:FractionalIdeal.count`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, Globalization, formula (15), printed p. 332. Defines the n-th factorial ideal of 𝓞_K as the inverse of I_n(𝓞_K) and gives the product formula.

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 3.2, Definition 3 and formula (13); Section 3.3, Proposition 6; Section 4.3, Proposition 12, pp. 5–6 and 9. Definition 3 is the factorial ideal of a subset as the inverse of the characteristic ideal; (13) and Proposition 6 are the divisibility properties; Proposition 12 is the product formula.

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Definition 2.1 and the remarks after it, p. 238; the product formula before Proposition 2.2, p. 239. Factorial ideals as inverses of characteristic ideals, their divisibility, and n!_{𝓞_K} as a product of the Π_q(K).

<a id="CA-3-polya-ideal"></a>

### The ideals Π_q(D): product of the primes of norm q

`ClassicalArithmeticCompletion:CA.3/polya-ideal` · definition.

Let D be a Dedekind domain whose residue fields are finite. For an integer q ≥ 2, Π_q(D) is the product of the maximal ideals 𝔪 of D with N(𝔪) = q; it is the unit ideal D when no maximal ideal has norm q (for example when q is not a prime power). For D = 𝓞_K only finitely many maximal ideals have a given norm, so the product is finite.

Hypotheses and conventions: D a Dedekind domain with finite residue fields such that each norm is attained by finitely many maximal ideals (true for 𝓞_K and for any D that is not a field, by the pigeonhole argument of CA.3/characteristic-ideals-of-a-dedekind-domain).

API:

- `polyaIdeal` (constructor): Π_q(D) : Ideal D, the product of the maximal ideals of absolute norm q.
- `PolyaIdeal.count_polyaIdeal` (characterisation): The exponent of 𝔪 in Π_q(D) is 1 if N(𝔪) = q and 0 otherwise.
- `PolyaIdeal.eq_top_iff` (characterisation): Π_q(D) = ⊤ iff no maximal ideal of D has norm q.
- `PolyaIdeal.eq_top_of_not_isPrimePow` (simp): If q is not a prime power, Π_q(D) = ⊤.
- `PolyaIdeal.isCoprime` (relation): Π_q(D) and Π_{q′}(D) are coprime for q ≠ q′.
- `polyaIdeal_pow_ramificationIdxIn` (relation): For K/ℚ Galois and p with residue degree f and ramification index e: Π_{p^f}(𝓞_K)^e = p𝓞_K, and Π_{p^j}(𝓞_K) = ⊤ for j ≠ f.

Unit tests:

- `TauCeti.ClassicalArithmetic.polyaIdeal_int` (compatibility): Π_p(ℤ) = Ideal.span {p} for p prime, and Π_4(ℤ) = ⊤.
- `TauCeti.ClassicalArithmetic.polyaIdeal_gaussian` (computation): In ℤ[i]: Π_2 = (1 + i), Π_5 = (5), Π_9 = (3) and Π_3 = ⊤.
- `TauCeti.ClassicalArithmetic.polyaIdeal_six` (degenerate): Π_6(D) = ⊤ for every D, since 6 is not a prime power.
- `TauCeti.ClassicalArithmetic.polyaIdeal_sqrt_neg_five` (non-example): For K = ℚ(√−5): Π_2(𝓞_K) = (2, 1 + √−5) is not principal although its square 2𝓞_K is; Π_q is not the extension of an ideal of ℤ.

Uses: ClassicalArithmeticCompletion:CA.3/factorial-group-basis — the factorial ideals are products of powers of the Π_q, and conversely; ClassicalArithmeticCompletion:CA.3/polya-ostrowski-criterion — K is a Pólya field iff every Π_q(𝓞_K) is principal; Leriche, Section 3, Proposition 3.1, p. 241 — in a Galois field only the Π_{p^f} of ramified p can be non-principal.

Acceptance checks:

- Π_p(ℤ) = pℤ and Π_4(ℤ) = ℤ.
- In ℤ[i]: Π_2 = (1 + i), Π_5 = (2 + i)(2 − i) = (5), Π_9 = (3), Π_3 = ℤ[i].

Proof sketch:

1. Define Π_q(D) as the finite product of the maximal ideals of norm q.
2. Its exponent at 𝔪 is 1 if N(𝔪) = q and 0 otherwise; hence Π_q and Π_{q′} are coprime for q ≠ q′.
3. If q is not a prime power, no residue field has q elements and Π_q(D) = D.
4. Galois case (CA.3/polya-group-of-a-galois-field): Π_{p^f}(𝓞_K)^e = p𝓞_K, where e and f are the common ramification index and residue degree of p.

Direct prerequisites: `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:Ideal.absNorm`, `mathlib:FractionalIdeal.count`.

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Section 2, Notation before Proposition 2.2, p. 239. Defines Π_q(K) as the product of the maximal ideals of 𝓞_K of norm q, equal to 𝓞_K when q is not a norm.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, Pólya groups and Pólya fields, printed pp. 332–333. The same products, as generators of the Pólya group (citing the book, Proposition II.3.9).

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 5.4, after Definition 6, p. 13. The same definition for a Dedekind domain D.

<a id="CA-3-factorial-group-basis"></a>

### Factorial ideals and the ideals Π_q generate the same free group

`ClassicalArithmeticCompletion:CA.3/factorial-group-basis` · theorem.

Let D be a Dedekind domain, not a field, with finite residue fields. In the group of nonzero fractional ideals of D, the subgroup generated by the factorial ideals n!_D (n ≥ 0) — equivalently by the characteristic ideals I_n(D) — equals the subgroup generated by the ideals Π_q(D) (q ≥ 2), and the Π_q(D) different from D form a basis of this free abelian group. Explicitly n!_D = ∏_q Π_q(D)^{w_q(n)}, n!_D · ((n − 1)!_D)⁻¹ = ∏_q Π_q(D)^{v_q(n)} for n ≥ 1, and for a prime power q = p^f: Π_q(D) = q!_D · ((q − 1)!_D)⁻¹ · ∏_{1≤j<f} Π_{p^j}(D)^{−⌊f/j⌋}.

Hypotheses and conventions: D a Dedekind domain, not a field, with finite residue fields.

Acceptance checks:

- D = ℤ: the factorial group is free on the pℤ; for q = 4: Π_4(ℤ) = (4!/3!)ℤ · (2ℤ)^{−2} = ℤ, as it must.
- D = ℤ[i]: 2!_D/1!_D = Π_2 = (1 + i) and 5!_D/4!_D = Π_5 = (5).

Proof sketch:

1. n!_D = ∏_q Π_q(D)^{w_q(n)}: group the maximal ideals by their norm in CA.3/factorial-ideal.
2. Quotients: w_q(n) − w_q(n − 1) = v_q(n) (CA.3/legendre-exponent), giving the second formula.
3. For n = p^f: v_q(p^f) = ⌊f/j⌋ if q = p^j (1 ≤ j ≤ f) and 0 for every other q, so q!_D/(q − 1)!_D = ∏_{j≤f} Π_{p^j}(D)^{⌊f/j⌋}, in which Π_{p^f} has exponent 1. Induction on f expresses each Π_{p^f}(D) through factorial ideals, so the two subgroups coincide.
4. Freeness: distinct Π_q have disjoint sets of prime factors, so ∏_q Π_q(D)^{c_q} = D forces c_q = 0 whenever Π_q(D) ≠ D, by unique factorization of fractional ideals (Mathlib FractionalIdeal.count).

Direct prerequisites: [CA.3/factorial-ideal](#CA-3-factorial-ideal), [CA.3/polya-ideal](#CA-3-polya-ideal), [CA.3/legendre-exponent](#CA-3-legendre-exponent), `mathlib:FractionalIdeal.count`.

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Proposition 2.2 and the product formula before it, p. 239. States that the factorial group is free with basis the nontrivial Π_q(K), deduced from the product formula; the inductive inversion of the formula is supplied here.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, Pólya groups and Pólya fields, printed p. 332. States that the Pólya group is also generated by the classes of the Π_q, citing the book (Proposition II.3.9).

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 5.4, after Definition 6, p. 13. The same generation statement for a Dedekind domain, citing the book (II.3.9).

<a id="CA-3-polya-ostrowski-criterion"></a>

### The Pólya–Ostrowski criterion for regular bases of Int(D)

`ClassicalArithmeticCompletion:CA.3/polya-ostrowski-criterion` · theorem. Landmark: **Pólya–Ostrowski criterion**.

Let D be a Dedekind domain, not a field, with finite residue fields (for example D = 𝓞_K for a number field K). The following are equivalent: (i) the D-module Int(D) has a regular basis; (ii) every characteristic ideal I_n(D) is principal; (iii) every factorial ideal n!_D is principal; (iv) every ideal Π_q(D), q ≥ 2, is principal. When they hold and n!_D = d_n D, any choice of f_n ∈ Int(D) of degree n with leading coefficient 1/d_n is a regular basis.

Hypotheses and conventions: D a Dedekind domain, not a field, with finite residue fields; D is then infinite, as the regular-basis criterion requires.

Acceptance checks:

- D = ℤ: all four hold; the binomial polynomials are the regular basis.
- K = ℚ(√−5): (iii) fails at n = 2 (2!_{𝓞_K} = 𝔭_2), so Int(𝓞_K) has no regular basis.
- K = ℚ(√−23): every Π_q(𝓞_K) is principal (the only ramified prime gives Π_23 = (√−23)), so Int(𝓞_K) has a regular basis although 𝓞_K is not a principal ideal domain (class number 3).
- Every principal ideal domain D with finite residue fields satisfies (i).

Proof sketch:

1. (i) ⇔ (ii) and the description of regular bases: CA.3/regular-basis-iff-characteristic-ideals-principal.
2. (ii) ⇔ (iii): I_n(D) = (n!_D)⁻¹ (CA.3/factorial-ideal), and a nonzero fractional ideal is principal iff its inverse is.
3. (iii) ⇔ (iv): the principal fractional ideals form a subgroup, and by CA.3/factorial-group-basis the factorial ideals and the Π_q generate the same subgroup; each family lies in the principal subgroup iff the other does.

Direct prerequisites: `CA.3/regular-basis-iff-characteristic-ideals-principal` (main CA document), [CA.3/characteristic-ideals-of-a-dedekind-domain](#CA-3-characteristic-ideals-of-a-dedekind-domain), [CA.3/factorial-ideal](#CA-3-factorial-ideal), [CA.3/polya-ideal](#CA-3-polya-ideal), [CA.3/factorial-group-basis](#CA-3-factorial-group-basis), `mathlib:Submodule.IsPrincipal`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, Proposition 31, printed p. 332. Proposition 31 is (i) ⇔ (iii) for 𝓞_K, derived from Proposition 19 and formula (15).

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Proposition 2.3, p. 240. States the equivalence of (i), (iii), (iv) and the triviality of the Pólya group for a number field.

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 5.4, Proposition 19, p. 13; Section 5.3, Corollary 4, p. 12. Proposition 19 lists (i)–(iv) and the triviality of the Pólya group as equivalent; Corollary 4 is the description of the regular basis from generators of the factorial ideals.


## Pólya fields and Pólya groups

<a id="CA-3-polya-field"></a>

### Pólya fields

`ClassicalArithmeticCompletion:CA.3/polya-field` · definition. Landmark: **Pólya field**.

A number field K is a Pólya field if the 𝓞_K-module Int(𝓞_K) has a regular basis, i.e. a basis (f_n)_{n≥0} with deg f_n = n. By CA.3/polya-ostrowski-criterion this holds iff every factorial ideal n!_{𝓞_K} is principal, iff every Π_q(𝓞_K) is principal, iff the Pólya group Po(K) is trivial.

Hypotheses and conventions: K a number field with ring of integers 𝓞_K.

API:

- `IsPolyaField` (constructor): The proposition that Int(𝓞_K) has a regular basis.
- `IsPolyaField.iff_factorialIdeal_isPrincipal` (characterisation): IsPolyaField K ↔ ∀ n, (n!_{𝓞_K}).IsPrincipal.
- `IsPolyaField.iff_polyaIdeal_isPrincipal` (characterisation): IsPolyaField K ↔ ∀ q, (Π_q(𝓞_K)).IsPrincipal.
- `PolyaGroup.eq_bot_iff` (characterisation): Po(K) = ⊥ ↔ IsPolyaField K.
- `IsPolyaField.of_classNumber_eq_one` (relation): classNumber K = 1 → IsPolyaField K.
- `IsPolyaField.rat` (example): IsPolyaField ℚ.
- `isPolyaField_of_isCyclotomicExtension` (example): IsPolyaField ℚ(ζ_n) for every n ≥ 1 (CA.3/cyclotomic-fields-are-polya).

Unit tests:

- `TauCeti.ClassicalArithmetic.isPolyaField_rat_test` (degenerate): ℚ is a Pólya field.
- `TauCeti.ClassicalArithmetic.isPolyaField_gaussian` (computation): ℚ(i) is a Pólya field (ℤ[i] is a principal ideal domain).
- `TauCeti.ClassicalArithmetic.not_isPolyaField_sqrt_neg_five` (non-example): ℚ(√−5) is not a Pólya field: 2!_{𝓞_K} = (2, 1 + √−5) is not principal.
- `TauCeti.ClassicalArithmetic.isPolyaField_sqrt_neg_23` (compatibility): ℚ(√−23) is a Pólya field while classNumber ℚ(√−23) = 3: being a Pólya field is strictly weaker than class number one.

Uses: Leriche, Proposition 2.3 and Section 3, pp. 240–242 — the equivalent descriptions of Pólya fields and their Galois criteria; ClassicalArithmeticCompletion:CA.3/imaginary-quadratic-polya-fields — classification of the imaginary quadratic Pólya fields; ClassicalArithmeticCompletion:CA.3/cyclotomic-fields-are-polya — Zantema's theorem that cyclotomic fields are Pólya fields.

Acceptance checks:

- ℚ and ℚ(i) are Pólya fields; ℚ(√−5) is not; ℚ(√−23) is, with class number 3.

Proof sketch:

1. Define IsPolyaField K as the existence of a regular basis of Int(𝓞_K) (a Module.Basis ℕ 𝓞_K Int(𝓞_K) whose n-th vector has degree n).
2. Equivalences: CA.3/polya-ostrowski-criterion and CA.3/polya-group.
3. Class number one implies Pólya: every Π_q is principal.
4. ℚ is a Pólya field (the binomial polynomials, CA.3/polya-binomial-basis).

Direct prerequisites: `CA.3/integer-valued-polynomials` (main CA document), `CA.3/polya-binomial-basis` (main CA document), `mathlib:Module.Basis`, `mathlib:NumberField.RingOfIntegers`.

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Definitions 1.2–1.3 and the paragraph after them, p. 236. Defines regular bases and Pólya fields, recalls the characterization by principal characteristic ideals and gives ℚ(√−23) (class number 3) as a non-principal Pólya field.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, Pólya groups and Pólya fields, printed p. 332. The same definition, following Zantema.

<a id="CA-3-polya-group"></a>

### The Pólya group of a number field

`ClassicalArithmeticCompletion:CA.3/polya-group` · definition. Landmark: **Pólya group**.

For a number field K, the Pólya group Po(K) is the subgroup of the class group Cl(K) = ClassGroup(𝓞_K) generated by the classes of the factorial ideals n!_{𝓞_K}, n ≥ 0. By CA.3/factorial-group-basis it is also generated by the classes of the ideals Π_q(𝓞_K), q ≥ 2; it is the image in Cl(K) of the factorial group, and K is a Pólya field iff Po(K) is trivial.

Hypotheses and conventions: K a number field.

API:

- `polyaGroup` (constructor): Po(K) : Subgroup (ClassGroup (𝓞 K)), the closure of the classes of the factorial ideals.
- `PolyaGroup.eq_closure_polyaIdeal` (characterisation): Po(K) = closure {[Π_q(𝓞_K)] : q ≥ 2}.
- `PolyaGroup.eq_bot_iff` (characterisation): Po(K) = ⊥ ↔ IsPolyaField K.
- `PolyaGroup.card_dvd_classNumber` (structure): Nat.card Po(K) divides the class number of K.
- `PolyaGroup.eq_bot_of_classNumber_eq_one` (relation): classNumber K = 1 → Po(K) = ⊥.
- `card_polyaGroup_dvd_prod_ramificationIdxIn` (relation): For K/ℚ Galois, Po(K) is generated by the classes of Π_{p^{f_p}}(𝓞_K) for the ramified primes p, each of order dividing e_p (CA.3/polya-group-of-a-galois-field).
- `PolyaGroup.rat` (example): Po(ℚ) = ⊥.

Unit tests:

- `TauCeti.ClassicalArithmetic.polyaGroup_rat_test` (degenerate): Po(ℚ) = ⊥.
- `TauCeti.ClassicalArithmetic.polyaGroup_sqrt_neg_five` (computation): For K = ℚ(√−5), Po(K) = ⊤, a group of order 2 generated by the class of (2, 1 + √−5).
- `TauCeti.ClassicalArithmetic.polyaGroup_sqrt_neg_23_ne_classGroup` (non-example): For K = ℚ(√−23), Po(K) = ⊥ while Cl(K) has order 3: the Pólya group is not the class group.
- `TauCeti.ClassicalArithmetic.card_polyaGroup_dvd_sqrt_neg_23` (compatibility): Nat.card Po(K) divides classNumber K; for ℚ(√−23): 1 divides 3, for ℚ(√−5): 2 divides 2.

Uses: Leriche, Section 3, Proposition 3.1 and Corollaries 3.1–3.3, pp. 241–242 — the Pólya group of a Galois field is generated by ramified Π_{p^f}, its order divides ∏ e_p, and it is trivial when the degree is prime to the class number; Cahen–Chabert, Propositions 32–33, printed p. 333 — Galois generation and the quadratic Pólya fields; ClassicalArithmeticCompletion:CA.3/imaginary-quadratic-polya-fields — the Pólya group of an imaginary quadratic field is nontrivial as soon as two primes ramify.

Acceptance checks:

- Po(ℚ) = ⊥; Po(ℚ(√−5)) = Cl(ℚ(√−5)) ≅ ℤ/2; Po(ℚ(√−23)) = ⊥ ≠ Cl(ℚ(√−23)) ≅ ℤ/3.

Proof sketch:

1. Define Po(K) as the subgroup closure of {[n!_{𝓞_K}] : n ≥ 0} in ClassGroup(𝓞_K) (each n!_{𝓞_K} is a nonzero ideal, so its class is ClassGroup.mk0).
2. Equality with the closure of the classes [Π_q(𝓞_K)]: the two families generate the same subgroup of ideals (CA.3/factorial-group-basis), and the class map is a homomorphism.
3. Po(K) = ⊥ iff every [n!_{𝓞_K}] is trivial iff every n!_{𝓞_K} is principal (Mathlib ClassGroup.mk0_eq_one_iff), iff K is a Pólya field (CA.3/polya-ostrowski-criterion).
4. Po(K) ≤ Cl(K), so |Po(K)| divides the class number.

Direct prerequisites: [CA.3/factorial-ideal](#CA-3-factorial-ideal), [CA.3/polya-ideal](#CA-3-polya-ideal), [CA.3/factorial-group-basis](#CA-3-factorial-group-basis), [CA.3/polya-ostrowski-criterion](#CA-3-polya-ostrowski-criterion), `mathlib:ClassGroup`, `mathlib:ClassGroup.mk0`, `mathlib:ClassGroup.mk0_eq_one_iff`, `mathlib:Subgroup.closure`, `mathlib:NumberField.RingOfIntegers`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, Pólya groups and Pólya fields, printed pp. 332–333. Defines Po(𝓞_K) as the subgroup of the class group generated by the classes of the factorial ideals, notes that it is generated by the classes of the Π_q, and that K is a Pólya field iff it is trivial.

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Definition 2.2 and Proposition 2.3, pp. 239–240. The Pólya–Ostrowski group as the image of the factorial group in Cl(K), with the same equivalences.

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 5.4, Definition 6, p. 13. The same definition.

<a id="CA-3-polya-group-of-a-galois-field"></a>

### Ostrowski's theorem: the Pólya group of a Galois number field

`ClassicalArithmeticCompletion:CA.3/polya-group-of-a-galois-field` · theorem.

Let K/ℚ be a finite Galois extension, and for a prime p let e_p and f_p be the common ramification index and residue degree of the primes of 𝓞_K above p. Then Π_{p^{f_p}}(𝓞_K)^{e_p} = p𝓞_K and Π_{p^j}(𝓞_K) = 𝓞_K for j ≠ f_p. Consequently Π_{p^{f_p}}(𝓞_K) is principal whenever p is unramified, Po(K) is generated by the classes of Π_{p^{f_p}}(𝓞_K) for the finitely many ramified primes p, each of order dividing e_p, and |Po(K)| divides ∏_{p ramified} e_p. In particular, if [K : ℚ] is coprime to the class number of K, then K is a Pólya field.

Hypotheses and conventions: K/ℚ finite Galois.

Acceptance checks:

- K = ℚ(√−5): ramified primes 2 and 5; Π_2 = (2, 1 + √−5) is not principal and Π_5 = (√−5) is, so Po(K) ≅ ℤ/2.
- K = ℚ(√−23): only 23 ramifies and Π_23 = (√−23), so Po(K) = 1 while the class number is 3.
- K = ℚ(i): Π_2 = (1 + i), so K is a Pólya field.

Proof sketch:

1. All primes 𝔓 above p have the same ramification index and residue degree (Mathlib Ideal.ramificationIdx_eq_of_isGaloisGroup and Ideal.inertiaDeg_eq_of_isGaloisGroup), so they all have norm p^{f_p} (Ideal.absNorm_eq_pow_inertiaDeg), and no other prime of 𝓞_K has a norm that is a power of p.
2. p𝓞_K = ∏_{𝔓 | p} 𝔓^{e_p} (Ideal.IsDedekindDomain.ramificationIdx_eq_normalizedFactors_count with Ideal.prod_normalizedFactors_eq_self) = Π_{p^{f_p}}(𝓞_K)^{e_p}.
3. For unramified p (e_p = 1), Π_{p^{f_p}} = p𝓞_K is principal. By CA.3/polya-group, Po(K) is generated by the classes [Π_q]; only q = p^{f_p} with p ramified can contribute, and [Π_{p^{f_p}}]^{e_p} = [p𝓞_K] = 1.
4. A finite abelian group generated by elements whose orders divide e_{p_1}, …, e_{p_s} has order dividing ∏ e_{p_i}.
5. Coprime degree: each e_p divides [K : ℚ] = e_p f_p g_p, so every prime factor of |Po(K)| divides [K : ℚ]; since |Po(K)| also divides the class number, coprimality forces |Po(K)| = 1.

Direct prerequisites: [CA.3/polya-group](#CA-3-polya-group), [CA.3/polya-ideal](#CA-3-polya-ideal), [CA.3/factorial-group-basis](#CA-3-factorial-group-basis), `mathlib:Ideal.ramificationIdx_eq_of_isGaloisGroup`, `mathlib:Ideal.inertiaDeg_eq_of_isGaloisGroup`, `mathlib:Ideal.absNorm_eq_pow_inertiaDeg`, `mathlib:Ideal.IsDedekindDomain.ramificationIdx_eq_normalizedFactors_count`, `mathlib:Ideal.prod_normalizedFactors_eq_self`, `mathlib:NumberField.classNumber`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, Proposition 32 and the paragraph before it, printed p. 333. Attributes to Ostrowski that Π_q is principal unless q is a power of a ramified prime, and states the generation of Po(𝓞_K) by those Π_q for Galois K.

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Section 3: the identity p𝓞_K = Π_q(K)^{e_p}, Proposition 3.1, Corollaries 3.1 and 3.3 with proofs, pp. 241–242. The factorization identity, the generation statement, the divisibility |Po(K)| | ∏ e_p, and the coprime-degree corollary.

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 5.4, the paragraph after Proposition 19, p. 13. Notes p𝓞_K = Π_{p^f}(𝓞_K)^e for Galois K, so that only ramified primes matter.

<a id="CA-3-imaginary-quadratic-polya-fields"></a>

### The imaginary quadratic Pólya fields

`ClassicalArithmeticCompletion:CA.3/imaginary-quadratic-polya-fields` · theorem.

Let K = ℚ(√d) with d < 0 squarefree and discriminant D_K (D_K = d if d ≡ 1 mod 4, D_K = 4d otherwise). Then Po(K) is generated by the classes of the ramified prime ideals 𝔭 (𝔭² = p𝓞_K for p | D_K), and it is nontrivial as soon as at least two primes ramify. Hence K is a Pólya field iff exactly one prime ramifies in K, iff d = −1, d = −2, or d = −p for a prime p ≡ 3 (mod 4).

Hypotheses and conventions: d < 0 squarefree, K = ℚ(√d); the primes ramified in K are the primes dividing D_K.

Acceptance checks:

- ℚ(i), ℚ(√−2), ℚ(√−3), ℚ(√−7), ℚ(√−23) are Pólya fields; ℚ(√−23) has class number 3.
- ℚ(√−5) (D_K = −20) and ℚ(√−15) (D_K = −15) are not: in ℚ(√−15) the prime 𝔭_3 above 3 is not principal since 3 < 15/4.
- ℚ(√−6) (D_K = −24, ramified 2 and 3): 𝔭_2 is not principal since 2 < 6.

Proof sketch:

1. By CA.3/polya-group-of-a-galois-field (K/ℚ is Galois of degree 2), Po(K) is generated by the classes of the Π_p = 𝔭 for ramified p (f = 1, e = 2).
2. Ring of integers: 𝓞_K = ℤ[√d] for d ≢ 1 (mod 4) and ℤ[(1 + √d)/2] for d ≡ 1 (mod 4) (CA.5/index-of-the-order-z-sqrt-d). The norm of x = a + bω is a² + |d|b² ≥ |D_K|/4, respectively (a + b/2)² + |D_K|b²/4 ≥ |D_K|/4, whenever b ≠ 0.
3. Two or more ramified primes: let p_1 be the smallest. If D_K ≡ 0 (mod 4) then p_1 = 2 and |D_K|/4 = |d| ≥ 3 because d has an odd prime factor; if D_K ≡ 1 (mod 4) then |D_K| ≥ p_1 p_2 > 4 p_1. So p_1 < |D_K|/4. A principal ideal of norm p_1 would have a generator of norm p_1 < |D_K|/4, hence a rational integer, whose norm is a square — impossible. So [𝔭_{p_1}] ≠ 1 and Po(K) ≠ 1.
4. Exactly one ramified prime: then D_K ∈ {−4, −8} or D_K = −p with p ≡ 3 (mod 4) (an odd discriminant d ≡ 1 mod 4 with one prime factor), and the ramified prime ideal is (1 + i), (√−2) or (√−p) respectively, which is principal; so Po(K) = 1.
5. The list: D_K = −4 ⇔ d = −1, D_K = −8 ⇔ d = −2, D_K = −p ⇔ d = −p with p ≡ 3 (mod 4).

Direct prerequisites: [CA.3/polya-group-of-a-galois-field](#CA-3-polya-group-of-a-galois-field), [CA.3/polya-group](#CA-3-polya-group), [CA.3/polya-field](#CA-3-polya-field), `CA.5/index-of-the-order-z-sqrt-d` (main CA document), `mathlib:Ideal.absNorm`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, Proposition 33 (imaginary case) and Example 34, printed p. 333. States the imaginary quadratic Pólya fields as ℚ(i), ℚ(√−2) and ℚ(√−p) with p ≡ 3 (mod 4), attributing the classification to Zantema, and gives ℚ(√−23) as an example; the class number printed there is corrected in sourceIssues.

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Proposition 2.4, pp. 240–241. Hilbert's count of the Pólya group of a quadratic field: 2^{s−1} elements for imaginary K with s ramified primes, which gives the same classification; the elementary norm argument above is supplied here.

<a id="CA-3-cyclotomic-fields-are-polya"></a>

### Zantema's theorem: cyclotomic fields are Pólya fields

`ClassicalArithmeticCompletion:CA.3/cyclotomic-fields-are-polya` · theorem.

For every n ≥ 1 the cyclotomic field K = ℚ(ζ_n) is a Pólya field. Explicitly, for a prime p write n = p^k m with p ∤ m and let f_p be the order of p modulo m. Then Π_{p^{f_p}}(𝓞_K) = p𝓞_K if k = 0 and Π_{p^{f_p}}(𝓞_K) = (1 − ζ_n^{m})𝓞_K if k ≥ 1 (ζ_n^m is a primitive p^k-th root of unity), every other Π_q(𝓞_K) is 𝓞_K, and so N!_{𝓞_K} is generated by ∏_{p ∤ n} p^{w_{p^{f_p}}(N)} · ∏_{p | n} (1 − ζ_n^{n/p^{v_p(n)}})^{w_{p^{f_p}}(N)} for every N.

Hypotheses and conventions: n ≥ 1, K = ℚ(ζ_n) a cyclotomic extension of ℚ.

Acceptance checks:

- ℚ(ζ_4) = ℚ(i): Π_2 = (1 − i); ℚ(ζ_3): Π_3 = (1 − ζ_3) = (√−3).
- ℚ(ζ_23) is a Pólya field although its class number is 3.

Proof sketch:

1. K/ℚ is Galois (Mathlib IsCyclotomicExtension.isGalois), so CA.3/polya-group-of-a-galois-field applies: for p ∤ n, p is unramified (IsCyclotomicExtension.Rat.ramificationIdxIn_eq_of_not_dvd) and Π_{p^{f_p}} = p𝓞_K.
2. For p | n with n = p^k m, k ≥ 1: e_p = p^{k−1}(p − 1) (IsCyclotomicExtension.Rat.ramificationIdxIn_eq), so p𝓞_K = Π_{p^{f_p}}^{e_p}.
3. In the subfield L = ℚ(ζ) with ζ = ζ_n^m of order p^k, the unique prime above p is (1 − ζ)𝓞_L (IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver) with ramification index p^{k−1}(p − 1) (ramificationIdxIn_eq_of_prime_pow), so p𝓞_L = ((1 − ζ)𝓞_L)^{e_p}.
4. Extending to 𝓞_K: ((1 − ζ)𝓞_K)^{e_p} = p𝓞_K = Π_{p^{f_p}}^{e_p}; unique factorization of ideals gives (1 − ζ)𝓞_K = Π_{p^{f_p}}.
5. All Π_q are principal, so K is a Pólya field by CA.3/polya-ostrowski-criterion, and the generator of N!_{𝓞_K} follows from the product formula N!_{𝓞_K} = ∏_q Π_q(𝓞_K)^{w_q(N)} of CA.3/factorial-ideal.

Direct prerequisites: [CA.3/polya-group-of-a-galois-field](#CA-3-polya-group-of-a-galois-field), [CA.3/polya-ostrowski-criterion](#CA-3-polya-ostrowski-criterion), [CA.3/polya-field](#CA-3-polya-field), [CA.3/factorial-ideal](#CA-3-factorial-ideal), `mathlib:IsCyclotomicExtension.isGalois`, `mathlib:IsCyclotomicExtension.Rat.ramificationIdxIn_eq`, `mathlib:IsCyclotomicExtension.Rat.ramificationIdxIn_eq_of_not_dvd`, `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver`, `mathlib:IsCyclotomicExtension.Rat.ramificationIdxIn_eq_of_prime_pow`.

Source: [leriche-polya-2011](https://jtnb.centre-mersenne.org/item/10.5802/jtnb.758.pdf), Example 1, p. 240. States, after Zantema, that every cyclotomic field is a Pólya field, with the explicit generator of the factorial ideals built from p and 1 − ζ; the derivation from the cyclotomic ramification formulas is supplied here.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 6, after Example 34, printed p. 333. Attributes to Zantema that all cyclotomic fields are Pólya fields.

Source: [chabert-regularbases-survey](https://www.lamfa.u-picardie.fr/chabert/graz.survey.pdf), Section 5.4, after Proposition 20, p. 13. The same attribution.


## Factor bounds

<a id="CA-3-mignotte-irreducible-factor-l2-bound"></a>

### Mignotte's inequality for irreducible integer factors

`ClassicalArithmeticCompletion:CA.3/mignotte-irreducible-factor-l2-bound` · theorem.

Let A ∈ ℤ[X] be nonzero and let I ∈ ℤ[X] be an irreducible factor of A of degree m ≥ 1. Then ‖I‖₂ ≤ e^{√m} (m + 2√m + 2)^{1+√m} ‖A‖₂^{1+√m}, where ‖·‖₂ is the Euclidean norm of the coefficient vector. This is the form in which Bary-Soroker–Koukoulopoulos–Kozma quote Mignotte (1988), Theorem 1′ and the remarks after it.

Hypotheses and conventions: A ∈ ℤ[X], A ≠ 0; I ∈ ℤ[X] irreducible, I | A, deg I = m ≥ 1. Whether Mignotte's Theorem 1′ needs further hypotheses (for example on the leading coefficient or on the multiplicity of I in A) has not been checked against the source (see gaps).

Acceptance checks:

- When A = I is itself irreducible the inequality is immediate, since e^{√m}(m + 2√m + 2)^{1+√m}‖I‖₂^{√m} ≥ 1.
- The classical consequence ‖I‖₂ ≤ C(2m, m)^{1/2}‖A‖₂ holds for every factor (irreducible or not), e.g. A = (X + 1)^m, I = A: ‖I‖₂² = C(2m, m).

Proof sketch:

1. Source of record: Mignotte, An inequality about irreducible factors of integer polynomials, J. Number Theory 30 (1988), 156–166, Theorem 1′ and the remarks below it, as cited in Bary-Soroker–Koukoulopoulos–Kozma, proof of Lemma 3.4. That paper was not readable here (the publisher refuses automated access), so its proof is not decomposed; this is recorded as a gap.
2. What the pinned library gives, and why it does not suffice: write A = I·J with J ∈ ℤ[X]; M(J) ≥ |lc(J)| ≥ 1, so M(I) ≤ M(A) (Mathlib mahlerMeasure_mul), and M(A) ≤ ‖A‖₂ (Landau, mahlerMeasure_le_sqrt_sum_sq_norm_coeff). With |coeff_k(I)| ≤ C(m, k) M(I) (norm_coeff_le_choose_mul_mahlerMeasure) this yields the classical bound ‖I‖₂ ≤ C(2m, m)^{1/2} ‖A‖₂, whose factor grows like 2^m; the statement here replaces it by a factor (m‖A‖₂)^{O(√m)}, which is smaller once m is large compared with (log ‖A‖₂)², and no combination of the library bounds gives that.

Direct prerequisites: `mathlib:Polynomial.mahlerMeasure_mul`, `mathlib:Polynomial.mahlerMeasure_le_sqrt_sum_sq_norm_coeff`, `mathlib:Polynomial.norm_coeff_le_choose_mul_mahlerMeasure`.

Source: [bskk-random-polynomials-2023](https://arxiv.org/pdf/2007.14567v3), Proof of Lemma 3.4, p. 20 (arXiv v3). The proof quotes this inequality for an irreducible integer factor I of degree m of A, citing Mignotte's Theorem 1′ and the remarks below it.

<a id="CA-3-irreducible-factor-evaluation-bound"></a>

### Size of an irreducible factor at an integer point

`ClassicalArithmeticCompletion:CA.3/irreducible-factor-evaluation-bound` · theorem.

Let A ∈ ℤ[X] have degree n ≥ 1 with every coefficient in [−H, H] for some H ≥ 1, and let I ∈ ℤ[X] be irreducible of degree m ≥ 1 with I | A. Then for every integer N ≥ 2, |I(N)| ≤ N^m · exp(4(1 + √m) log(14√n H)).

Hypotheses and conventions: A ∈ ℤ[X] of degree n ≥ 1 with all coefficients bounded by H ≥ 1; I ∈ ℤ[X] irreducible, I | A, deg I = m ≥ 1 (so m ≤ n); N ≥ 2 an integer.

Acceptance checks:

- The bound is used with a prime p > p_0 dividing A(N): p divides some irreducible factor's value, forcing that factor to have degree > (1 − θ)n (Bary-Soroker–Koukoulopoulos–Kozma, proof of Lemma 3.3, p. 21).
- With the corrected ‖A‖₂ ≤ H√(n + 1) the printed final inequality still holds, with room to spare.
- Small case: A = I = X + 1, n = m = 1, H = 1, N = 2: |I(2)| = 3 ≤ 2·14⁸.

Proof sketch:

1. ‖A‖₂ ≤ H√(n + 1), since A has n + 1 coefficients (the source prints H√n; the correction is recorded as PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/E15 and does not affect the conclusion).
2. Cauchy–Schwarz (Mathlib Finset.sum_mul_sq_le_sq_mul_sq) applied to I(N) = Σ_{i≤m} c_i N^i: |I(N)| ≤ (Σ_{i≤m} N^{2i})^{1/2} ‖I‖₂ ≤ N^m (N²/(N² − 1))^{1/2} ‖I‖₂ ≤ (2/√3) N^m ‖I‖₂.
3. CA.3/mignotte-irreducible-factor-l2-bound: ‖I‖₂ ≤ e^{√m}(m + 2√m + 2)^{1+√m}(H√(n + 1))^{1+√m}.
4. Arithmetic with m ≤ n and n ≥ 1: e^{√m} ≤ e^{1+√m}, m + 2√m + 2 ≤ 5n and √(n + 1) ≤ √2·√n, so ‖I‖₂ ≤ (5√2 e · n^{3/2} H)^{1+√m}; as (2/√3)·5√2e < 23 < 14⁴ and n^{3/2}H ≤ n²H⁴, the product is at most (14⁴ n² H⁴)^{1+√m} = exp(4(1 + √m) log(14√n H)).

Direct prerequisites: [CA.3/mignotte-irreducible-factor-l2-bound](#CA-3-mignotte-irreducible-factor-l2-bound), `mathlib:Finset.sum_mul_sq_le_sq_mul_sq`, `mathlib:Polynomial.eval_eq_sum_range`.

Source: [bskk-random-polynomials-2023](https://arxiv.org/pdf/2007.14567v3), Lemma 3.4 and its proof, p. 20 (arXiv v3). The statement is Lemma 3.4; the proof combines the quoted Mignotte inequality with the Cauchy–Schwarz estimate for |I(N)| as above.


## Squarefree integral combinations

<a id="CA-3-primitive-polynomial-gcd"></a>

### The primitive gcd of a family of integer polynomials

`ClassicalArithmeticCompletion:CA.3/primitive-polynomial-gcd` · definition.

Let Q_1, …, Q_k (k ≥ 1) be nonzero polynomials in ℤ[X]. Their primitive gcd G = gcd(Q_1, …, Q_k) is the unique primitive polynomial G ∈ ℤ[X] with positive leading coefficient that generates, in ℚ[X], the same ideal as the monic gcd of the Q_i (equivalently, G is of maximal degree among primitive integer polynomials dividing every Q_i in ℚ[X]). By Gauss's lemma G divides each Q_i in ℤ[X], and the quotients Q_i/G ∈ ℤ[X] have no common nonconstant factor in ℚ[X].

Hypotheses and conventions: Q_1, …, Q_k nonzero, k ≥ 1.

API:

- `primitiveGcd` (constructor): G := the primitive part of the normalized gcd of the family in the GCD monoid ℤ[X] (whose normalization makes the leading coefficient positive); equivalently the primitive integer polynomial associated in ℚ[X] to the monic gcd.
- `PrimitiveGcd.isPrimitive` (structure): G is primitive (and PrimitiveGcd.leadingCoeff_pos: 0 < leadingCoeff G) for a nonempty family of nonzero polynomials.
- `PrimitiveGcd.dvd` (characterisation): G ∣ Q_i in ℤ[X] for each i.
- `PrimitiveGcd.dvd_primitiveGcd` (universal-property): A primitive H ∈ ℤ[X] dividing every Q_i in ℚ[X] divides G in ℤ[X].
- `PrimitiveGcd.natDegree_eq` (compatibility): natDegree G = natDegree of Finset.gcd of the images in ℚ[X] (G mapped to ℚ[X] is associated to that gcd).
- `PrimitiveGcd.quotients_coprime` (relation): The quotients Q_i/G have no common nonconstant factor in ℚ[X].

Unit tests:

- `TauCeti.ClassicalArithmetic.primitiveGcd_two_four` (computation): primitiveGcd {2X, 4X} = X.
- `TauCeti.ClassicalArithmetic.primitiveGcd_single` (degenerate): primitiveGcd {Q} is the primitive part of Q with positive leading coefficient; primitiveGcd {−6X − 4} = 3X + 2 and primitiveGcd {c} = 1 for a nonzero constant c.
- `TauCeti.ClassicalArithmetic.natDegree_primitiveGcd_eq` (compatibility): natDegree (primitiveGcd {X² − 1, X² + X}) = natDegree (Finset.gcd of the images in ℚ[X]) = 1, and primitiveGcd {X² − 1, X² + X} = X + 1.
- `TauCeti.ClassicalArithmetic.primitiveGcd_ne_gcdMonoid` (non-example): The normalized gcd of 2X and 4X in the GCD monoid ℤ[X] is 2X, which differs from primitiveGcd {2X, 4X} = X: the content is discarded.

Uses: Smith, Lemma 2.10, p. 9 — the squarefree combination is formed after dividing by G; ClassicalArithmeticCompletion:CA.3/squarefree-integral-combination — the coprimality of the quotients Q_i/G makes the generic combination irreducible; LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.5/gcd-norm-bound — the norm-product bound is refined by the primitive gcd of the auxiliary polynomials (request R3 of that packet).

Acceptance checks:

- gcd(2X, 4X) = X, whereas the gcd of 2X and 4X in the GCD monoid ℤ[X] is 2X.
- gcd(X² − 1, X² + X) = X + 1; gcd(−6X − 4) = 3X + 2.

Proof sketch:

1. Let g ∈ ℚ[X] be the monic gcd of the images of the Q_i (Mathlib Finset.gcd in ℚ[X]); clear denominators and take the primitive part (Mathlib Polynomial.primPart), adjusting the sign so that the leading coefficient is positive.
2. Uniqueness: two primitive integer polynomials that are associate in ℚ[X] differ by a rational unit that must be ±1, and the sign is fixed by the leading coefficient.
3. Divisibility in ℤ[X]: G is primitive and divides Q_i in ℚ[X], so it divides Q_i in ℤ[X] (Mathlib Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map).
4. Maximality: a primitive H dividing every Q_i in ℚ[X] divides g, hence G, in ℚ[X], hence in ℤ[X].

Direct prerequisites: `mathlib:Finset.gcd`, `mathlib:Polynomial.primPart`, `mathlib:Polynomial.IsPrimitive`, `mathlib:Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map`.

Source: [smith-conjugates-2024](https://arxiv.org/pdf/2111.12660v2), Definition 2.9, pp. 8–9 (arXiv v2). Defines gcd(Q_1, …, Q_k) as the integer polynomial of maximal degree with positive leading coefficient, primitive, dividing each Q_i over ℚ, and notes by Gauss's lemma that each Q_i/G is an integer polynomial.

<a id="CA-3-squarefree-integral-combination"></a>

### A bounded squarefree integral combination of integer polynomials

`ClassicalArithmeticCompletion:CA.3/squarefree-integral-combination` · theorem.

Let k ≥ 1, n ≥ 0 and let Q_1, …, Q_k ∈ ℤ[X] be nonzero of degree at most n, with some Q_i of degree exactly n; let G be their primitive gcd (CA.3/primitive-polynomial-gcd) and d = n − deg G. Then there are integers b_2, …, b_k ≥ 0 with b_2 + ⋯ + b_k ≤ max(2d − 1, 0) (so each b_j ≤ 2d) such that Q = (Q_1 + b_2Q_2 + ⋯ + b_kQ_k)/G lies in ℤ[X], has degree exactly d, and is squarefree in ℚ[X] (it has no repeated complex root). The integer content of Q need not be squarefree.

Hypotheses and conventions: Q_1, …, Q_k nonzero in ℤ[X], all of degree ≤ n, at least one of degree n.

Acceptance checks:

- Q_1 = X², Q_2 = 1 (G = 1, d = 2): b_2 = 0 gives X², which is not squarefree; b_2 = 1 gives X² + 1, which is.
- Q_1 = 4X + 4 (k = 1): G = X + 1, d = 0 and Q = 4, a nonzero constant: squarefree in ℚ[X] although its content 4 is not squarefree.
- Warning for formalization: the specialization identity in step 5 holds for the Sylvester determinant Res(F, F′) with fixed formal degrees; the normalized discriminant (Mathlib Polynomial.discr, which divides by the leading coefficient and uses the actual degree) does not vanish when the degree drops by one (a t² + b t + c at a = 0 has discriminant b²).

Proof sketch:

1. d = 0: take every b_j = 0; Q = Q_1/G is a nonzero constant, hence of degree 0 and squarefree in ℚ[X].
2. d > 0: let F = Q_1/G + x_2·Q_2/G + ⋯ + x_k·Q_k/G ∈ ℤ[x_2, …, x_k][t]. Its t-degree is d with leading coefficient ℓ = Σ_j c_j x_j (x_1 = 1, c_j the coefficient of t^d in Q_j/G), and ℓ ≠ 0.
3. F is irreducible over the field ℚ(x_2, …, x_k): F has degree 1 in the x-variables, so in a factorization F = F_1F_2 over ℚ[x][t] one factor lies in ℚ[t] and divides every Q_j/G, hence is constant (primitive gcd); Gauss's lemma passes to ℚ(x)[t].
4. Let R = Res_{d, d−1}(F, ∂F/∂t) ∈ ℤ[x], the Sylvester determinant with formal degrees d and d − 1 (Mathlib Polynomial.resultant with explicit sizes). Its entries have x-degree ≤ 1, so total degree R ≤ 2d − 1. Over ℚ(x), F is irreducible of positive degree in characteristic 0, hence coprime to its nonzero derivative, and its leading coefficient is nonzero; so R ≠ 0 (Polynomial.resultant_eq_zero_iff over a field, transported by resultant_map_map along ℤ[x] → ℚ(x)).
5. Specialization: for b ∈ ℤ^{k−1}, R(b) = Res_{d, d−1}(F(b), F(b)′) (resultant_map_map with evaluation at b). If deg F(b) < d then also deg F(b)′ < d − 1 and R(b) = 0 (resultant_eq_zero_of_lt_lt). So R(b) ≠ 0 forces deg F(b) = d and F(b) coprime to F(b)′ in ℚ[t], i.e. F(b) separable, hence squarefree (Polynomial.Separable.squarefree).
6. Grid point: pick a monomial x^τ of degree totalDegree R with nonzero coefficient in R; the Combinatorial Nullstellensatz (Mathlib MvPolynomial.combinatorial_nullstellensatz_exists_eval_nonzero) with S_j = {0, 1, …, τ_j} gives b with 0 ≤ b_j ≤ τ_j and R(b) ≠ 0, so Σ b_j ≤ Σ τ_j ≤ 2d − 1. Smith instead invokes Salzer's multivariate Gregory–Newton formula.
7. Q = F(b) has integer coefficients because each Q_j/G ∈ ℤ[X], degree d and no repeated root.

Direct prerequisites: [CA.3/primitive-polynomial-gcd](#CA-3-primitive-polynomial-gcd), `mathlib:Polynomial.resultant`, `mathlib:Polynomial.resultant_map_map`, `mathlib:Polynomial.resultant_eq_zero_of_lt_lt`, `mathlib:Polynomial.resultant_eq_zero_iff`, `mathlib:Polynomial.derivative`, `mathlib:Polynomial.Separable`, `mathlib:Polynomial.Separable.squarefree`, `mathlib:MvPolynomial.totalDegree`, `mathlib:MvPolynomial.combinatorial_nullstellensatz_exists_eval_nonzero`, `mathlib:Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map`.

Source: [smith-conjugates-2024](https://arxiv.org/pdf/2111.12660v2), Lemma 2.10 and its proof, p. 9 (arXiv v2). The statement is Lemma 2.10; the proof forms the generic combination F, shows it is irreducible, uses the determinantal discriminant of F (of total degree at most 2(n − deg G) − 1) and its specialization, and finds a nonvanishing nonnegative integer point by the multivariate Gregory–Newton formula.

Source: [smith-conjugates-2024](https://arxiv.org/pdf/2111.12660v2), Proofs in Section 3, pp. 18–20 (arXiv v2), and the remark on p. 17. Lemma 2.10 is applied with b_j in [0, 2m] and [0, 2n], and squarefree is used in the sense of a nonzero discriminant.


## Root bounds

<a id="CA-3-fujiwara-weighted-root-bound"></a>

### Fujiwara's weighted root bound

`ClassicalArithmeticCompletion:CA.3/fujiwara-weighted-root-bound` · theorem.

Let f = a_0X^n + a_1X^{n−1} + ⋯ + a_n ∈ ℂ[X] with n ≥ 1 and a_0 ≠ 0, and let λ_1, …, λ_n > 0 satisfy Σ_k 1/λ_k ≤ 1. Then every root α of f satisfies |α| ≤ max_{1≤k≤n} (λ_k |a_k/a_0|)^{1/k}. If Σ_k 1/λ_k < 1 and some a_k (k ≥ 1) is nonzero, the inequality is strict.

Hypotheses and conventions: n ≥ 1, a_0 ≠ 0, λ_k > 0 with Σ 1/λ_k ≤ 1.

Acceptance checks:

- λ_k = n gives Cauchy's form |α| ≤ max_k (n|a_k/a_0|)^{1/k} (Fujiwara's (2)).
- λ_k = 2^k gives |α| ≤ 2·max_k |a_k/a_0|^{1/k} (Fujiwara's (3)); for f = X² − 4 the bound is 2·2 = 4 ≥ 2.
- Mathlib's Cauchy bound (Polynomial.cauchyBound, 1 + max|a_k/a_0|) is a different estimate: for X² − 4 it gives 5.

Proof sketch:

1. Let B = max_k (λ_k|a_k/a_0|)^{1/k} and suppose ρ = |α| > B ≥ 0. For every k, ρ^k > λ_k|a_k/a_0|, so |a_k|ρ^{n−k} < |a_0|ρ^n/λ_k (also when a_k = 0, since ρ > 0).
2. Summing, Σ_{k≥1}|a_k|ρ^{n−k} < |a_0|ρ^n Σ_k 1/λ_k ≤ |a_0|ρ^n, so |f(α)| ≥ |a_0|ρ^n − Σ_{k≥1}|a_k|ρ^{n−k} > 0 (triangle inequality), a contradiction.
3. Strict form: if Σ1/λ_k < 1 and ρ = B > 0, the same estimate gives Σ|a_k|ρ^{n−k} ≤ |a_0|ρ^n Σ 1/λ_k < |a_0|ρ^n. When every a_k (k ≥ 1) vanishes, B = 0 and α = 0, so strictness fails; this degenerate case is excluded.

Direct prerequisites: `mathlib:Polynomial.IsRoot`, `mathlib:Polynomial.eval_eq_sum_range`, `mathlib:Polynomial.cauchyBound`.

Source: [fujiwara-rootbound-1916](https://www.jstage.jst.go.jp/article/tmj1911/10/0/10_0_167/_pdf), Formula (1) with its derivation and footnote, printed p. 167. Derives exactly this bound from the lower estimate |f(x)| ≥ |a_0|ρ^n − Σ|a_k|ρ^{n−k} under Σ1/λ_k ≤ 1; the footnote asserts the strict inequality when Σ1/λ_k < 1 (its degenerate case is recorded in sourceIssues).

Source: [fujiwara-rootbound-1916](https://www.jstage.jst.go.jp/article/tmj1911/10/0/10_0_167/_pdf), Formulas (2)–(5), printed p. 168. The specializations λ_k = n (Cauchy), λ_k = 2^k and the Birkhoff choice.

<a id="CA-3-fujiwara-root-bound"></a>

### Fujiwara's root bound for monic polynomials

`ClassicalArithmeticCompletion:CA.3/fujiwara-root-bound` · theorem. Landmark: **Fujiwara's root bound**.

Let f = X^n + a_1X^{n−1} + ⋯ + a_n ∈ ℂ[X] with n ≥ 1. Every root θ of f satisfies |θ| ≤ 2·max{|a_1|, |a_2|^{1/2}, …, |a_{n−1}|^{1/(n−1)}, |a_n/2|^{1/n}}. In particular |θ| ≤ 2H(f) for the height H(f) = max_i |a_i|^{1/i}.

Hypotheses and conventions: f monic of degree n ≥ 1 (for n = 1 the maximum is |a_1/2|, and the bound reads |θ| = |a_1| ≤ |a_1|).

Acceptance checks:

- x² − 4: the bound is 2·(4/2)^{1/2} = 2√2 ≥ 2 = |root|; without the factor 2 (as printed in Bhargava–Shankar–Wang) the right side would be √2 < 2.
- x − a: the bound is 2|a/2| = |a|, attained.
- Height use: if H(f) ≤ Y then every root has |θ| ≤ 2Y (Bhargava–Shankar–Wang, (43)).

Proof sketch:

1. Apply CA.3/fujiwara-weighted-root-bound with a_0 = 1, λ_k = 2^k for k < n and λ_n = 2^{n−1}: Σ_{k<n} 2^{−k} + 2^{−(n−1)} = 1.
2. (λ_k|a_k|)^{1/k} = 2|a_k|^{1/k} for k < n and (2^{n−1}|a_n|)^{1/n} = 2|a_n/2|^{1/n}.
3. |a_n/2|^{1/n} ≤ |a_n|^{1/n}, so |θ| ≤ 2H(f).

Direct prerequisites: [CA.3/fujiwara-weighted-root-bound](#CA-3-fujiwara-weighted-root-bound).

Source: [bsw-squarefree-discriminants-2022](https://arxiv.org/pdf/1611.09806v3), Section 5, proof of Corollary 1.4, p. 27 (arXiv v3); height H(f), p. 1. Uses the bound, attributed to Fujiwara, to deduce |θ| ≪ Y from H(f) ≤ Y; the printed form omits the factor 2 (PAPER-BHARGAVA-SHANKAR-WANG-22/E11).

Source: [fujiwara-rootbound-1916](https://www.jstage.jst.go.jp/article/tmj1911/10/0/10_0_167/_pdf), Formula (1), printed p. 167. The weighted bound from which this form follows with the weights 2^k (k < n) and 2^{n−1}.


## The Gregory–Newton expansion

<a id="CA-3-newton-forward-difference-expansion"></a>

### The Gregory–Newton expansion of a polynomial in binomial polynomials

`ClassicalArithmeticCompletion:CA.3/newton-forward-difference-expansion` · lemma.

Let K be a field of characteristic 0 and f ∈ K[X] of degree at most N. Then f = Σ_{k=0}^{N} (Δ^k f)(0)·(X choose k) in K[X], where Δg(X) = g(X + 1) − g(X), and (Δ^k f)(0) = Σ_{j=0}^{k} (−1)^{k−j} C(k, j) f(j). Moreover Δ^k f = 0 for k > deg f. In particular, for f ∈ Int(ℤ) every coefficient (Δ^k f)(0) is an integer, and these are the coefficients c_k of Pólya's expansion.

Hypotheses and conventions: K a field of characteristic 0 (so that (X choose k) ∈ K[X] and polynomials agreeing on ℕ are equal).

Acceptance checks:

- f = X²: (Δf)(0) = 1, (Δ²f)(0) = 2, so X² = (X choose 1) + 2·(X choose 2).
- f = X(X − 1)/2: the coefficients are 0, 0, 1.

Proof sketch:

1. Newton's formula (Mathlib shift_eq_sum_fwdDiff_iter with step 1 at 0): f(n) = Σ_{k≤n} C(n, k)(Δ^k f)(0) for every n ∈ ℕ.
2. Δ lowers the degree by one, so Δ^k f = 0 for k > deg f; hence for all n the right side is Σ_{k≤N} (Δ^k f)(0)·(n choose k).
3. Both sides are polynomials agreeing at every natural number, an infinite set, so they are equal (Mathlib Polynomial.eq_of_infinite_eval_eq).
4. The finite-difference formula is Mathlib fwdDiff_iter_eq_sum_shift; for f ∈ Int(ℤ) it is an integer combination of integers.

Direct prerequisites: `CA.3/integer-valued-polynomials` (main CA document), `mathlib:shift_eq_sum_fwdDiff_iter`, `mathlib:fwdDiff_iter_eq_sum_shift`, `mathlib:Polynomial.eq_of_infinite_eval_eq`, `mathlib:Ring.choose`, `mathlib:Ring.choose_natCast`.

Source: [cahen-chabert-intvalued-2016](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Cahen-Chabert.pdf), Section 1, formulas (1)–(3), printed pp. 311–312. Formula (3) is this Gregory–Newton expansion, obtained from Δ(X choose n) = (X choose n−1); formulas (1)–(2) are the same coefficients by the triangular recursion.


## The lower Newton polygon of a point family

<a id="CA-3-newton-polygon-of-a-point-family"></a>

### The lower Newton polygon of a finite point family

`ClassicalArithmeticCompletion:CA.3/newton-polygon-of-a-point-family` · construction.

Let I ⊂ ℕ be a nonempty finite set and y : I → ℝ (the points (i, y_i)). For r ∈ ℝ put μ_r = min_{i∈I}(y_i + r·i), the contact set C_r = {i ∈ I : y_i + r·i = μ_r}, ℓ_r = min C_r, u_r = max C_r and the width m_r = u_r − ℓ_r. Orientation (as in CA.3/newton-slope-multiplicity): in the plane of the points (−i, y_i) the line of slope r through (−i, y_i) has intercept y_i + r·i, so μ_r is the intercept of the supporting line of slope r and the lower convex hull of these points (the Newton polygon) has a side of slope r exactly when m_r > 0, joining the points of abscissae −u_r and −ℓ_r; in the plane of the points (i, y_i) the same side has geometric slope −r. Then: (a) y_i + r·i ≥ μ_r for all i ∈ I, with equality exactly on C_r (every point lies on or above the supporting line, and the points on it are the contact set); (b) only finitely many r have m_r > 0; (c) Σ_r m_r = max I − min I; (d) slope ordering: if r < r′ then u_{r′} ≤ ℓ_r; (e) y_{u_r} = y_{ℓ_r} − r·m_r; (f) r ↦ μ_r is concave and piecewise affine. For a nonzero f = Σ a_iX^i over a field with valuation v, I = supp f and y_i = v(a_i) give μ_r = v_r(f) (CA.3/sloped-valuation) and m_r = m_r(f) (CA.3/newton-slope-multiplicity).

Hypotheses and conventions: I ⊂ ℕ finite and nonempty; y : I → ℝ. (Points with y_i = ∞, such as zero coefficients, are left out of I.)

API:

- `newtonSupport` (constructor): μ_r(y) := the minimum over i ∈ I of y_i + r·i, for a finite nonempty I ⊂ ℕ and y : I → ℝ.
- `newtonContact` (data): C_r(y) := {i ∈ I | y_i + r·i = μ_r(y)}, nonempty (NewtonPolygon.newtonContact_nonempty).
- `NewtonPolygon.newtonSupport_le` (characterisation): μ_r(y) ≤ y_i + r·i for all i ∈ I; with NewtonPolygon.mem_newtonContact_iff, equality holds iff i ∈ C_r(y).
- `newtonWidth` (data): m_r(y) := max C_r − min C_r.
- `NewtonPolygon.finite_setOf_newtonWidth_pos` (structure): {r | 0 < m_r(y)} is finite.
- `NewtonPolygon.sum_newtonWidth` (relation): Σ_{r : m_r > 0} m_r(y) = max I − min I.
- `NewtonPolygon.max_newtonContact_le_min` (relation): r < r′ → max C_{r′}(y) ≤ min C_r(y) (slope ordering).
- `NewtonPolygon.newtonSide_endpoints` (characterisation): y at max C_r equals y at min C_r minus r·m_r(y).
- `NewtonPolygon.concaveOn_newtonSupport` (structure): r ↦ μ_r(y) is concave on ℝ.
- `NewtonPolygon.newtonSupport_polynomial` (compatibility): For f ≠ 0 over a valued field with I = supp f and y_i = v(a_i): μ_r(y) = v_r(f) and m_r(y) = m_r(f) (CA.3/sloped-valuation, CA.3/newton-slope-multiplicity).

Unit tests:

- `TauCeti.ClassicalArithmetic.newtonWidth_example` (computation): For the points (0, 2), (2, 1), (5, 0): m_{1/2} = 2, m_{1/3} = 3, and m_r = 0 for every other r.
- `TauCeti.ClassicalArithmetic.newtonWidth_singleton` (degenerate): For I = {i_0}: μ_r = y_{i_0} + r·i_0 and m_r = 0 for every r.
- `TauCeti.ClassicalArithmetic.newtonContact_not_chord` (non-example): For the points (0, 0), (1, −1), (2, 0): C_0 = {1} (width 0), and the sides are r = 1 with C_1 = {0, 1} and r = −1 with C_{−1} = {1, 2}; the chord joining the extreme points is not a side.
- `TauCeti.ClassicalArithmetic.newtonSupport_eq_slopedValuation` (compatibility): For f = X² − 2 over ℚ₂ (points (0, 1), (2, 0)): μ_r = min(1, 2r), the only side is r = 1/2 with width 2, equal to v_r(f) and m_r(f) of the CA.3 polynomial nodes.

Uses: ComputationalNumberTheory:CN.2/phi-newton-side — a φ-Newton side is certified by the supporting-line property, the contact interval and the slope ordering for the points (i, v_p(a_i)) of a φ-adic expansion, which are not the coefficients of a polynomial over a valued field; ClassicalArithmeticCompletion:CA.3/dumas-theorem — the least and greatest minimizing indices of the product's supporting line are the sums of those of the factors; Kedlaya, Newton polygons, Corollary 2, p. 2 — side endpoints as contact points of nearby supporting lines.

Acceptance checks:

- The points of X⁵ + 2X² + 4 over ℚ₂, (0, 2), (2, 1), (5, 0): C_{1/2} = {0, 2}, C_{1/3} = {2, 5}, widths 2 and 3, summing to 5 = 5 − 0, and u_{1/2} = 2 ≤ ℓ_{1/3} = 2.
- Supporting-side certificate as used for φ-adic expansions: a side from (s, u) to (s + ed, u − hd) with slope parameter h/e is exactly the statement that μ_{h/e} = u + (h/e)s with C_{h/e} ⊆ [s, s + ed] containing both endpoints.

Proof sketch:

1. μ_r is a minimum over a finite nonempty set (Mathlib Finset.inf' over I), C_r is nonempty, and (a) is the definition.
2. (d): for i ∈ C_{r′} and j ∈ C_r, y_i + r′i ≤ y_j + r′j and y_j + rj ≤ y_i + ri; adding, (r′ − r)(i − j) ≤ 0, so i ≤ j.
3. (b) and (c): by (d) the contact intervals [ℓ_r, u_r] of the r with m_r > 0 are ordered decreasingly in r and overlap only at endpoints; such r is the slope (y_j − y_i)/(i − j) of a pair i < j in I, so there are finitely many. For r larger than every such slope C_r = {min I}, for r smaller C_r = {max I}, and as r decreases through the finitely many critical values the contact interval moves from min I to max I, its widths adding to max I − min I.
4. (e): ℓ_r and u_r both lie on the supporting line.
5. (f): μ is the minimum of finitely many affine functions of r.
6. Polynomial case: with y_i = v(a_i) on supp f, μ_r and C_r are those of the sloped valuation and m_r is the slope multiplicity of CA.3/sloped-valuation and CA.3/newton-slope-multiplicity; those polynomial nodes are the specialization of this one (they cite it), so this node does not depend on them.

Direct prerequisites: `mathlib:ConcaveOn`.

Source: [kedlaya-newtonpolygons-2007](https://kskedlaya.org/18.787/newton-poly.pdf), Section 1, p. 1, and Section 2 up to Corollary 2, pp. 1–2. Defines the Newton polygon as the lower convex hull of the points (−i, v(P_i)), the slope multiset with multiplicities equal to the widths, and the sloped valuation as the intercept of the supporting line of slope r; the proof of Corollary 2 uses that the endpoints of the side of slope r are where the supporting lines of slightly smaller and larger slope touch.

Source: [kedlaya-newtonpolygons-2007](https://kskedlaya.org/18.787/newton-poly.pdf), Section 1, p. 1. The total width of the slope multiset is the degree span, which is (c) for the support of a polynomial.


## Gauss–Jordan elimination and kernel bases

<a id="CA-3-gauss-jordan-reduced-echelon-form"></a>

### Gauss–Jordan elimination to the reduced row echelon form

`ClassicalArithmeticCompletion:CA.3/gauss-jordan-reduced-echelon-form` · construction.

Let F be a field with decidable equality and A an m × n matrix over F. Gauss–Jordan elimination is a terminating procedure that returns an invertible m × m matrix P together with an explicit inverse P′ (P P′ = P′ P = 1), a matrix R with P A = R in reduced row echelon form (Mathlib Matrix.IsReducedRowEchelon), and its pivot function ℓ : rows → WithTop columns (Mathlib Matrix.IsPivotedBy R ℓ). The reduced row echelon form is unique: any two matrices in reduced row echelon form that are row-equivalent to A are equal; consequently the pivot columns (and the free columns) depend only on A, the number of pivots is rank A, and ker A = ker R.

Hypotheses and conventions: F a field with decidable equality (for example ZMod p, p prime, or ℚ); A an m × n matrix over F.

API:

- `gaussJordan` (constructor): For A : Matrix (Fin m) (Fin n) F, a GaussJordanResult A: fields P, P′ : Matrix (Fin m) (Fin m) F, R : Matrix (Fin m) (Fin n) F and pivot : Fin m → WithTop (Fin n), computed by the terminating procedure (the suggested file fixes the interface through nonempty_gaussJordanResult).
- `GaussJordanResult.mul_eq` (characterisation): (gaussJordan A).P * A = (gaussJordan A).R.
- `GaussJordanResult.mul_inv` (structure): P * P′ = 1 (and the field inv_mul: P′ * P = 1).
- `GaussJordanResult.isReducedRowEchelon` (structure): R.IsReducedRowEchelon and R.IsPivotedBy ℓ.
- `IsReducedRowEchelon.eq_of_mul` (extensionality): If R₁, R₂ are in reduced row echelon form and R₂ = Q R₁ for an invertible Q, then R₁ = R₂.
- `card_pivots_gaussJordan` (compatibility): The number of rows with ℓ i ≠ ⊤ equals A.rank (Mathlib Matrix.IsPivotedBy.rank_eq).
- `ker_toLin'_gaussJordan` (relation): LinearMap.ker (Matrix.toLin' A) = LinearMap.ker (Matrix.toLin' R).

Unit tests:

- `TauCeti.ClassicalArithmetic.gaussJordan_example_rat` (computation): Over ℚ, gaussJordan [[1, 2, 1], [2, 4, 0]] has R = [[1, 2, 0], [0, 0, 1]] and pivot columns 0 and 2.
- `TauCeti.ClassicalArithmetic.gaussJordan_zero` (degenerate): gaussJordan 0 has R = 0, P = 1 and no pivots; for invertible square A, R = 1 and P = A⁻¹.
- `TauCeti.ClassicalArithmetic.gaussJordan_zmod_two_rank` (compatibility): Over ZMod 2, gaussJordan [[1, 1], [1, 1]] has R = [[1, 1], [0, 0]], and its pivot count 1 equals Matrix.rank [[1, 1], [1, 1]].
- `TauCeti.ClassicalArithmetic.not_isReducedRowEchelon_example` (non-example): [[1, 2], [0, 1]] is in row echelon form (Matrix.IsRowEchelon) but not reduced, since the entry 2 sits above the second pivot; it is never an output of gaussJordan.

Uses: ComputationalNumberTheory:CN.2/finite-algebra-frobenius-nilradical — the nilradical is the kernel of an iterated Frobenius, computed as the kernel of its matrix over ZMod p in a supplied basis (request of that packet); ClassicalArithmeticCompletion:CA.3/kernel-basis-of-a-reduced-echelon-matrix — the free columns of R give the kernel basis; Hefferon, Chapter One, Section III — solving linear systems by reading off the reduced echelon form.

Acceptance checks:

- Over ℚ: [[1, 2, 1], [2, 4, 0]] reduces to [[1, 2, 0], [0, 0, 1]] with pivot columns 0 and 2 and rank 2.
- Over ZMod 2: [[1, 1], [1, 1]] reduces to [[1, 1], [0, 0]], rank 1.
- An invertible square A reduces to the identity with P = A⁻¹.

Proof sketch:

1. Procedure (Hefferon, Gauss's Method and Gauss–Jordan reduction): scan the columns from left to right with a current row index; in the current column find a row at or below the current row with a nonzero entry, swap it up, scale it to make the pivot 1, and eliminate every other entry of the column (above and below); then advance both indices. A zero column advances the column index only. Each step is an elementary row operation, recorded together with its inverse operation, so P and P′ are products of elementary matrices in opposite orders.
2. Termination: the column index strictly increases at every stage, so there are at most n stages, each a bounded number of row operations.
3. Invariants: after processing column j the first j columns are in reduced row echelon form; row operations are reversible (Hefferon, Lemma One.III.1.5) and preserve the solution set of A x = 0 (Theorem One.I.1.5), so ker A = ker R.
4. Uniqueness: Hefferon, Theorem One.III.2.6 (Yuster's induction on the number of columns, using that row-equivalent matrices have the same homogeneous solution sets).
5. Rank: R is pivoted by ℓ, so rank R = number of pivots (Mathlib Matrix.IsPivotedBy.rank_eq), and rank A = rank R because P is invertible (Matrix.rank_mul_eq_right_of_isUnit_det).
6. Comparison with Mathlib's echelon certificates: the forward phase of the elimination (before the entries above the pivots are cleared) yields a row permutation σ and a lower-triangular L with nonzero diagonal such that L·(σA) is in echelon form — exactly the data of Mathlib's Echelon.Decomposition, whose rank_eq certifies the rank independently.

Direct prerequisites: `mathlib:Matrix.IsRowEchelon`, `mathlib:Matrix.IsReducedRowEchelon`, `mathlib:Matrix.IsPivotedBy`, `mathlib:Matrix.IsPivotedBy.rank_eq`, `mathlib:Echelon.Decomposition`, `mathlib:Echelon.Decomposition.rank_eq`, `mathlib:Matrix.rank_mul_eq_right_of_isUnit_det`, `mathlib:Matrix.GeneralLinearGroup`.

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Chapter One, Section III, Definition 1.3 (printed p. 51), Lemmas 1.5–1.6 (pp. 52–53), Theorem 2.6 with proof (pp. 59–60), Corollary 2.7 (p. 60). Gauss–Jordan reduction and the definition of reduced echelon form; row operations are reversible; every matrix is row equivalent to a unique reduced echelon form matrix, so the free variables are independent of the reduction. The book works over ℝ; the arguments are field-independent.

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Chapter One, Section I, Theorem 1.5 (Gauss's Method), printed p. 4. Elementary row operations do not change the solution set of a linear system.

<a id="CA-3-kernel-basis-of-a-reduced-echelon-matrix"></a>

### The kernel basis read off a reduced row echelon form

`ClassicalArithmeticCompletion:CA.3/kernel-basis-of-a-reduced-echelon-matrix` · theorem.

Let R be an m × n matrix over a field F in reduced row echelon form, with pivot columns c_1 < ⋯ < c_r (row i has its leading 1 in column c_i) and free columns J = {0, …, n − 1} ∖ {c_1, …, c_r}. For j ∈ J let β_j ∈ F^n have entry 1 at j, entry 0 at the other free columns and entry −R_{i j} at c_i. Then (β_j)_{j∈J} is a basis of ker R = {x : R x = 0}, so dim ker R = n − r. Combined with CA.3/gauss-jordan-reduced-echelon-form: for any matrix A the β_j computed from its reduced echelon form are a basis of ker A (soundness: A β_j = 0; completeness: every x with A x = 0 equals Σ_{j∈J} x_j β_j; independence), with |J| = n − rank A. For a linear map φ : V → W of finite-dimensional F-spaces with bases b, b′ and A = LinearMap.toMatrix b b′ φ, the vectors Σ_k (β_j)_k b_k form a basis of ker φ.

Hypotheses and conventions: F a field; R in reduced row echelon form (Mathlib Matrix.IsReducedRowEchelon) with its pivot function.

Acceptance checks:

- A = [[1, 2, 1], [2, 4, 0]] over ℚ: R = [[1, 2, 0], [0, 0, 1]], J = {1}, β_1 = (−2, 1, 0), and A β_1 = 0.
- Over ZMod 2: [[1, 1], [1, 1]] has R = [[1, 1], [0, 0]], J = {1}, β_1 = (1, 1) (−1 = 1).
- R = 0: the β_j are the standard basis; R = 1 (square, full rank): J is empty and the kernel is 0.

Proof sketch:

1. Soundness: row i of R β_j is R_{i c_i}(β_j)_{c_i} + Σ_{j′∈J} R_{i j′}(β_j)_{j′} = −R_{i j} + R_{i j} = 0, because row i vanishes at the other pivot columns (reducedness) and R_{i c_i} = 1; zero rows give 0.
2. Completeness: for x ∈ ker R, y = x − Σ_{j∈J} x_j β_j lies in ker R and vanishes at every free column; row i of R y = 0 then reads y_{c_i} = 0, so y = 0.
3. Independence: the coordinates of Σ c_j β_j at the free columns are the c_j.
4. For A: ker A = ker R (CA.3/gauss-jordan-reduced-echelon-form) and r = rank A; rank–nullity (Mathlib LinearMap.finrank_range_add_finrank_ker) is consistent with |J| = n − r.
5. For φ: Matrix.toLin_toMatrix identifies φ with the matrix in the bases, so the coordinate vectors of ker φ in b are ker A.

Direct prerequisites: [CA.3/gauss-jordan-reduced-echelon-form](#CA-3-gauss-jordan-reduced-echelon-form), `mathlib:Matrix.IsReducedRowEchelon`, `mathlib:Matrix.toLin'`, `mathlib:LinearMap.toMatrix`, `mathlib:Matrix.toLin_toMatrix`, `mathlib:LinearMap.finrank_range_add_finrank_ker`.

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Chapter One, Section I, Lemma 3.6 with its proof, printed pp. 25–27. The solution set of a homogeneous system is the set of combinations of vectors β_1, …, β_k, one for each free variable of an echelon form, obtained by back-substitution; with the reduced form the back-substitution is the read-off above.

Source: [hefferon-linearalgebra-2020](https://jheffero.w3.uvm.edu/linearalgebra/book.pdf), Chapter One, Section III, Definition 1.3 and the paragraph after it, printed p. 51. In reduced echelon form the solution set description can be read off directly.


## Library inputs for the earlier CA.3 targets

For each target of the main CA document listed below, the declarations its proof uses beyond those already cited there, or the node of this document that supplies the step. Where the entry says *proof step*, the argument is a step of that target's proof and needs no separate declaration.

| Target | What its proof needs | Supplied by |
|---|---|---|
| `CA.3/smith-normal-form-certificate` | Rank and entry-ideal invariants need named suppliers; split data declarations. The rank invariant is r = rank A, supplied by Mathlib Matrix.rank_mul_eq_left_of_isUnit_det and Matrix.rank_mul_eq_right_of_isUnit_det (rank of P A Q equals rank A for invertible P, Q) together with the rank of the diagonal. No entry-ideal (determinantal-divisor) invariant is needed: uniqueness goes through Tau Ceti Matrix.smith_normal_form_unique (CA.3/smith-invariant-factors-unique). | `mathlib:Matrix.rank_mul_eq_left_of_isUnit_det`, `mathlib:Matrix.rank_mul_eq_right_of_isUnit_det` |
| `CA.3/smith-normal-form-of-an-integer-matrix` | Pivot clearing, interior divisibility and block recursion lemmas; inverse certificate invariants; Ideal.smithCoeffs covers only nonzero ideals. The algorithm does not use Ideal.smithCoeffs, and the rank-deficient case is the zero block after r = rank A steps (rank supplier as above). | `mathlib:Matrix.rank_mul_eq_left_of_isUnit_det` |
| `CA.3/smith-normal-form-over-a-pid` | Generic Bézout 2 × 2 reduction and chain termination; restore the unit-factor count using rank. The number of nonzero invariant factors is the rank over the fraction field, supplied by the rank lemmas for invertible factors; units among them are discarded only in the cokernel reading. | `mathlib:Matrix.rank_mul_eq_left_of_isUnit_det`, `mathlib:Matrix.rank_mul_eq_right_of_isUnit_det` |
| `CA.3/cokernel-of-an-integer-matrix` | Explicit quotient transport and coordinate quotient lemmas. Quotient transport along the change of basis: Mathlib Submodule.Quotient.equiv. Coordinatewise quotient of ℤ^m by ⊕ d_iℤ: Mathlib Submodule.quotientPi, with ℤ/(d) ≃ ZMod |d| from Int.quotientSpanEquivZMod. Mathlib's own Submodule.quotientEquivPiZMod is the full-rank special case and serves as the compatibility check. | `mathlib:Submodule.Quotient.equiv`, `mathlib:Submodule.quotientPi`, `mathlib:Int.quotientSpanEquivZMod`, `mathlib:Submodule.quotientEquivPiZMod` |
| `CA.3/invariant-factor-decomposition` | Prime-power grouping and quotient transport beyond the free-product equivalence and CRT. The regrouping of elementary divisors into a divisibility chain is finite bookkeeping inside the proof; its two library inputs are Mathlib Ideal.quotientInfRingEquivPiQuotient (CRT, already cited) and Submodule.Quotient.equiv (transport). Over any PID the chain can also be read from Mathlib Submodule.quotientEquivPiSpan applied to a presentation, together with CA.3/smith-normal-form-over-a-pid. | `mathlib:Submodule.Quotient.equiv`, `mathlib:Submodule.quotientEquivPiSpan` |
| `CA.3/invariant-factors-unique` | Intrinsic prime-power filtration dimension and torsion-free rank recovery. Both are computations inside the proof: dim_{R/π}(π^{s−1}T/π^sT) is computed summand by summand for T = ⊕ R/(a_i), and the free rank is the rank of M modulo its torsion. | proof step |
| `CA.3/is-hermite-normal-form` | Check the row convention; determinant equals the product of the pivots and is positive. The determinant of a square Hermite form is the product of its diagonal (Mathlib Matrix.det_of_isUpperTriangular, already cited), positive because the pivots are positive. The convention (upper, column style, lowest nonzero row) is pinned in the node. | already cited |
| `CA.3/hermite-normal-form-certificate` | Promote the consumed range, reconstruction and rank API items to lemma nodes. Range equality under an invertible column transform: Mathlib LinearMap.range_comp_of_range_eq_top; rank: Matrix.rank_mul_eq_left_of_isUnit_det. | `mathlib:LinearMap.range_comp_of_range_eq_top`, `mathlib:Matrix.rank_mul_eq_left_of_isUnit_det` |
| `CA.3/hermite-normal-form` | Termination and active-column invariants; hermiteBasis_eq_of_range_eq uses uniqueness without a prerequisite. Termination (the active column index increases and the pivot measure decreases) is a proof step. The API item hermiteBasis_eq_of_range_eq rests on CA.3/hermite-normal-form-unique, whose proof does not use the algorithm, so adding it as a prerequisite creates no cycle. | `CA.3/hermite-normal-form-unique` (main CA document) |
| `CA.3/hermite-normal-form-unique` | The only source (Damer) was unreadable.  | already in the target's statement and proof |
| `CA.3/hermite-basis-of-a-sublattice` | Existence for every sublattice needs Noetherian finite generation. Every subgroup of ℤ^m is finitely generated because ℤ^m is a Noetherian ℤ-module (Mathlib isNoetherian_pi); a finite generating set is the column set of an integer matrix to which the Hermite algorithm applies. | `mathlib:isNoetherian_pi` |
| `CA.3/index-eq-prod-hermite-pivots` | The determinant API it consumes needs promotion. Both inputs are library declarations already cited: Mathlib AddSubgroup.index_eq_natAbs_det and Matrix.det_of_isUpperTriangular. | already cited |
| `CA.3/invariant-factors-of-an-endomorphism` | Cayley–Hamilton and polynomial-module torsion suppliers; companion and block-diagonal support. Cayley–Hamilton: Mathlib LinearMap.aeval_self_charpoly (cited); torsion of the K[X]-module: Module.AEval.annihilator_top_eq_ker_aeval (cited); block-diagonal determinants and characteristic polynomials: Matrix.det_blockDiagonal and Matrix.charpoly_fromBlocks_zero₁₂ by induction on the number of blocks; companion matrices: CA.2/companion-matrix (cited by CA.3/rational-canonical-form). | `mathlib:Matrix.det_blockDiagonal`, `mathlib:Matrix.charpoly_fromBlocks_zero₁₂` |
| `CA.3/rational-canonical-form` | Promote consumed API items; the block characteristic polynomial proof needs a supplier. The characteristic polynomial of the block-diagonal companion form is the product of the blocks' characteristic polynomials by Matrix.charpoly_fromBlocks_zero₁₂ (induction on blocks). | `mathlib:Matrix.charpoly_fromBlocks_zero₁₂` |
| `CA.3/polya-binomial-basis` | The coefficient formula c_k = Δ^k f(0) is claimed but only the triangular recursion is proved; supply the difference identity. Supplied by the new lemma CA.3/newton-forward-difference-expansion (Gregory–Newton expansion from Mathlib shift_eq_sum_fwdDiff_iter and fwdDiff_iter_eq_sum_shift). The API item ringChoose_X_mem is an item of CA.3/integer-valued-polynomials (Mathlib Ring.choose_natCast). | [CA.3/newton-forward-difference-expansion](#CA-3-newton-forward-difference-expansion) |
| `CA.3/integer-valued-iff-consecutive-values` | Named root-cardinality bound and integer-translation invariance suppliers. Root count: Mathlib Polynomial.eq_of_natDegree_lt_card_of_eval_eq. Translation: f ↦ f(X + a) preserves degree (Mathlib Polynomial.natDegree_comp) and integer-valuedness. Both directions are also the case a_n = a + n of the new CA.3/newton-sequence-criterion. | `mathlib:Polynomial.eq_of_natDegree_lt_card_of_eval_eq`, `mathlib:Polynomial.natDegree_comp`, [CA.3/newton-sequence-criterion](#CA-3-newton-sequence-criterion) |
| `CA.3/integer-valued-polynomials-not-noetherian` | Split the ideal definition from the non-finite-generation theorem; acceptance claims rely on unlisted suppliers. The acceptance claims about maximal ideals are illustrations, not inputs. | proof step |
| `CA.3/regular-basis-iff-characteristic-ideals-principal` | Characterization by leading generators; a supplier for the basis/degree argument. The degree induction in the node proves spanning and independence; the basis is then Mathlib Module.Basis.mk. The characterization by leading generators is part of the node's statement. | `mathlib:Module.Basis.mk` |
| `CA.3/capelli-two-power-case` | Purely inseparable degree and quadratic norm exclusion.  | already in the target's statement and proof |
| `CA.3/digit-polynomial-root-location` | Sector and modulus estimates of Brillhart–Filaseta–Odlyzko Theorem 3 and monotonicity of positive roots of the comparison polynomials. These are the estimates of a single proof (Brillhart–Filaseta–Odlyzko, pp. | proof step |
| `CA.3/newton-slope-multiplicity` | Width sum; minimizer movement (piecewise linearity). The minimizer movement (contact intervals move monotonically as the slope varies) is the slope-ordering item max_newtonContact_le_min of the new generic carrier CA.3/newton-polygon-of-a-point-family, which specializes to the polynomial case. | [CA.3/newton-polygon-of-a-point-family](#CA-3-newton-polygon-of-a-point-family) |
| `CA.3/dumas-theorem` | Additivity of the least and greatest minimizing indices needs supporting lemmas. Supplied by the contact-set API of CA.3/newton-polygon-of-a-point-family (newtonSupport_le, the endpoints ℓ_r, u_r and their ordering) together with CA.3/sloped-valuation-mul; Kedlaya's proof of Proposition 1 shows that the least minimizing indices add. | [CA.3/newton-polygon-of-a-point-family](#CA-3-newton-polygon-of-a-point-family) |


## Dependencies

Within CA.3: the nodes above rest on `CA.3/integer-valued-polynomials`, `CA.3/characteristic-ideals-of-int`, `CA.3/regular-basis-iff-characteristic-ideals-principal` and `CA.3/polya-binomial-basis`; in the other direction, `CA.3/sloped-valuation`, `CA.3/newton-slope-multiplicity` and `CA.3/dumas-theorem` specialize the point-family Newton polygon of this document, and the targets in the table below take the listed inputs. Within the roadmap: `CA.5/index-of-the-order-z-sqrt-d`. Other roadmaps: none; everything else is Mathlib at the pinned commit.

Consumers outside the roadmap: LogarithmicPotentialTheoryAndAlgebraicIntegers LP.5 (`LP.5/gcd-norm-bound`, `LP.5/small-squarefree`) uses `CA.3/primitive-polynomial-gcd` and `CA.3/squarefree-integral-combination`; ComputationalNumberTheory CN.2 (`CN.2/phi-newton-side`, `CN.2/finite-algebra-frobenius-nilradical`) uses `CA.3/newton-polygon-of-a-point-family`, `CA.3/gauss-jordan-reduced-echelon-form` and `CA.3/kernel-basis-of-a-reduced-echelon-matrix`; the random-polynomial irreducibility results of Bary-Soroker–Koukoulopoulos–Kozma use `CA.3/irreducible-factor-evaluation-bound`.


## Gaps

- **Mignotte's inequality for irreducible integer factors: source not read** (needed by [CA.3/mignotte-irreducible-factor-l2-bound](#CA-3-mignotte-irreducible-factor-l2-bound), [CA.3/irreducible-factor-evaluation-bound](#CA-3-irreducible-factor-evaluation-bound)). Mignotte, An inequality about irreducible factors of integer polynomials, J. Number Theory 30 (1988), 156–166, doi:10.1016/0022-314X(88)90014-5, Theorem 1′ and the remarks below it. Unpaywall lists a free publisher copy, but ScienceDirect answered every automated request on 2026-10-14 with a bot challenge or HTTP 403 (with a text-and-data-mining reservation), so the paper was not read. The follow-up of Glesser (Ann. Fac. Sci. Toulouse 11 (1990), 67–74, read on Numdam) proves a different bound (for factors of degree close to deg A) and does not contain Theorem 1′. The classical bound ‖I‖₂ ≤ C(2m, m)^{1/2}‖A‖₂ that the pinned Mahler-measure API gives is weaker by a factor exponential in m and does not suffice for Bary-Soroker–Koukoulopoulos–Kozma Lemma 3.3. Next action: read Theorem 1′ in a browser copy, record its exact hypotheses, and decompose its proof.


## Corrections to the sources

- **E900** (misprint, cahen-chabert-intvalued-2016, Section 6, Example 34, printed p. 333 (publisher PDF of the Monthly article)). The example says that ℚ(√−23), a Pólya field, has class number 4. Correction: The class number of ℚ(√−23) is 3 (the reduced forms of discriminant −23 are x² + xy + 6y² and 2x² ± xy + 3y²). Reason: Three reduced binary quadratic forms of discriminant −23; Leriche (JTNB 2011, p. 236) states the same example with class number 3. The point of the example — a Pólya field whose ring of integers is not principal — is unaffected.
- **E901** (error, cahen-chabert-intvalued-2016, Section 6, Proposition 33, real case, printed p. 333). The real quadratic Pólya fields are listed as ℚ(√p) with p prime and, when the fundamental unit has norm 1, ℚ(√(pq)) with p and q prime. Correction: The second family must have exactly two ramified primes: ℚ(√d) with fundamental unit of norm +1 and d = 2q (q an odd prime) or d = pq with p, q odd primes and pq ≡ 1 (mod 4). (ℚ(√p) with p ≡ 3 mod 4 already has two ramified primes and fundamental unit of norm +1.) Reason: ℚ(√15) fits the printed description (15 = 3·5, fundamental unit 4 + √15 of norm 1) but is not a Pólya field: the prime 𝔭_2 above 2 (𝔭_2² = 2𝒪) is not principal, since x² − 15y² = ±2 has no solution modulo 5. Here 2, 3, 5 ramify, and Hilbert's count quoted in Leriche, Proposition 2.4, gives a Pólya group of order 2^{3−2} = 2.
- **E902** (error, fujiwara-rootbound-1916, Footnote to formula (1), printed p. 167, and formula (3), printed p. 168). The footnote asserts that the bound (1) becomes strict when Σ1/λ_k < 1, and formula (3) states |α| < 2·max_k|a_k/a_0|^{1/k} with strict inequality. Correction: Strictness requires some a_k with k ≥ 1 to be nonzero; for f = a_0X^n the root 0 gives equality 0 = 0. With that exclusion both strict statements hold; the non-strict versions hold without it. Reason: For f = X², every a_k (k ≥ 1) vanishes, the maximum is 0 and the only root is 0, so |α| < 0 fails.

Two corrections recorded with the papers that cite these results are used here: Bary-Soroker–Koukoulopoulos–Kozma print ‖A‖₂ ≤ H√n in the proof of Lemma 3.4, and the coefficient vector has n + 1 entries, so ‖A‖₂ ≤ H√(n + 1) (PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/E15); Bhargava–Shankar–Wang print Fujiwara's bound without the factor 2 (PAPER-BHARGAVA-SHANKAR-WANG-22/E11).


## Atlas structure

Divide CA.3 for the atlas into three sub-layers, without changing its stage id or its links. CA.3a Normal forms and modules over a PID: smith-normal-form-certificate, smith-normal-form-of-an-integer-matrix, smith-invariant-factors-unique, smith-normal-form-over-a-pid, cokernel-of-an-integer-matrix, invariant-factor-decomposition, invariant-factors-unique, is-hermite-normal-form, hermite-normal-form-certificate, hermite-normal-form, hermite-normal-form-unique, hermite-basis-of-a-sublattice, index-eq-prod-hermite-pivots, invariant-factors-of-an-endomorphism, rational-canonical-form, similarity-by-invariant-factors, gauss-jordan-reduced-echelon-form, kernel-basis-of-a-reduced-echelon-matrix (planets: Smith normal form, Hermite normal form, Rational canonical form). CA.3b Integer-valued polynomials and Pólya groups: integer-valued-polynomials, polya-binomial-basis, newton-forward-difference-expansion, integer-valued-iff-consecutive-values, integer-valued-polynomials-not-noetherian, binomial-polynomial-irreducible, characteristic-ideals-of-int, regular-basis-iff-characteristic-ideals-principal, int-valued-localization, newton-sequence-criterion, legendre-exponent, v-ordering-of-a-dvr, local-regular-basis-of-int-dvr, characteristic-ideals-of-a-dedekind-domain, factorial-ideal, polya-ideal, factorial-group-basis, polya-ostrowski-criterion, polya-field, polya-group, polya-group-of-a-galois-field, imaginary-quadratic-polya-fields, cyclotomic-fields-are-polya (planets: Pólya's binomial basis, Factorial ideal, Pólya–Ostrowski criterion, Pólya field, Pólya group). CA.3c Irreducibility, Newton polygons and polynomial bounds: the Capelli, Perron and Cohn nodes, sloped-valuation, sloped-valuation-mul, newton-slope-multiplicity, newton-polygon-of-a-point-family, dumas-theorem, newton-slopes-of-a-split-polynomial, eisenstein-dumas-criterion, fujiwara-weighted-root-bound, fujiwara-root-bound, mignotte-irreducible-factor-l2-bound, irreducible-factor-evaluation-bound, primitive-polynomial-gcd, squarefree-integral-combination (planets: Capelli's theorem, Dumas's theorem, Fujiwara's root bound).
