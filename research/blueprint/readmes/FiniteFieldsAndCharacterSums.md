# Finite fields, character sums, finite rings and coding interfaces

Blueprint for the roadmap `FiniteFieldsAndCharacterSums`, job `BP-FiniteFieldsAndCharacterSums` (issue #1029).
Packet: `research/blueprint/packets/FiniteFieldsAndCharacterSums.json`. Suggested Lean file:
`research/blueprint/suggested/FiniteFieldsAndCharacterSums.lean`. Handoff: `research/blueprint/handoff/BP-FiniteFieldsAndCharacterSums.md`.

Mathlib already knows a great deal about finite fields and their characters. This roadmap plans what lies beyond it:

- **FF.0:** certified presentations with Rabin's irreducibility certificate, tensor products of finite fields and Frobenius
  normal bases.
- **FF.1:** the character normalisations other roadmaps import, together with Hasse–Davenport, Stickelberger and the
  residue character of 𝔽_q((1/T)).
- **FF.2:** the Weil and Deligne bounds, with their degenerate cases stated rather than hidden.
- **FF.3:** the factorisation and point-counting algorithms with certificates, reconstruction, termination and separate cost
  statements.
- **FF.4:** Galois rings, linearised and permutation polynomials, m-sequences and codes.
- **FF.5:** the application handoffs that the accepted restructuring RS-03 keeps.

**Status: partial.** FF.0, FF.3 and FF.5 are source decomposed; FF.1, FF.2 and FF.4 are partial, each with a precise
`remaining` list in the packet's coverage record. The packet has:

- 354 nodes, 562 API items and 374 unit tests;
- 457 cited declarations of the pinned libraries;
- 34 recorded mistakes in its sources;
- 6 gaps and 31 requests to other roadmaps.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

| Layer | Status | Nodes | Planets |
|---|---|---|---|
| FF.0 | source decomposed | 11 | Rabin's irreducibility test; Certified presentation of a finite field; Tensor product of finite fields; Frobenius normal basis |
| FF.1 | partial | 42 | Canonical additive character; Hasse–Davenport lifting relation; Teichmüller character; Stickelberger's congruence; Stickelberger's theorem on Gauss sums; Residue character of F_q((1/T)) |
| FF.2 | partial | 89 | Weil bound for additive character sums; Artin–Schreier sheaf; Deligne's bound for trace functions; Weil bound for multiplicative character sums; Weil bound for Kloosterman sums; Lang–Weil estimate |
| FF.3 | source decomposed | 104 | Gauss's product formula; Prime polynomial theorem; Cantor–Zassenhaus algorithm; Berlekamp's algorithm; Hensel lifting of factorizations; Schoof's algorithm |
| FF.4 | partial | 91 | Galois rings GR(p^n, r); Permutation polynomials; m-sequences; Reed–Solomon codes; Algebraic geometry codes; Finite upper half-plane |
| FF.5 | source decomposed | 17 | Weil bound for integer polynomials mod p; Local densities at good primes; Correlation bound for decimated m-sequences; Shamir secret sharing |

## RS-03, and what this roadmap owns and imports

This roadmap belongs to the accepted restructuring RS-03, which is binding.

- **Narrowed:**
  - FF.0 to specialised presentations and certificates;
  - FF.1 to the trace, character and Gauss–Jacobi comparison interfaces, with their exact trivial-character and
    normalisation cases;
  - FF.3 to the certified algorithms with reconstruction, termination and complexity contracts;
  - FF.5 to the application and normalisation handoffs.
- **Kept:** FF.2 and FF.4.
- **Single ownership.** FF.1 is the single owner of the finite-field character and Gauss–Jacobi normalisations, and FF.2 of
  the general Weil–Deligne estimate handoff.

**Imports:**

- **From the pinned libraries,** as baseline citations listed in each layer's section:
  - the classification of finite fields, Frobenius, subfields, trace and norm, and normal bases;
  - additive and multiplicative characters with Mathlib's zero conventions, and Gauss and Jacobi sums with their
    identities;
  - unique factorisation, Hensel's lemma for simple roots, linear recurrences, truncated Witt vectors and Hamming distance;
  - Tau Ceti's linear codes, Riemann–Roch spaces, division polynomials and the elliptic trace convention.
- **From other roadmaps,** each through a `requests` entry:
  - AdditiveCombinatorics AC.0 (general finite-abelian Fourier analysis);
  - WeilConjectures WC.0, WC.3 and WC.5;
  - DeligneWeightsAndPurity DWP.0, DWP.6 and DWP.7;
  - EtaleDualityAndPerverseSheaves EDC.2;
  - SchemeAndStackFoundations SF.0, SF.1 and SF.2;
  - ComputationalNumberTheory CN.0 (cost model and presentations) and CN.5 (certificate schema);
  - FunctionFieldArithmetic FA.5 and ArithmeticGaloisRepresentations R01.3;
  - Tau Ceti's AlgebraicCurves, AlgebraicCodingTheory, EllipticCurves and LocalFieldsRamification.

**Supplied to others:**

- ClassicalArithmeticCompletion CA.1 requested the character-convention comparisons and Gauss-sum transport. They are
  `FF.1/trivial-character-conventions`, `FF.1/gauss-sum-transport` and `FF.1/canonical-additive-character`.
- FF.1 also plans Stickelberger's congruence and theorem, which CA.1's Eisenstein reciprocity recorded as unowned.

**Sources beyond the roadmap document:** Bary-Soroker–Koukoulopoulos–Kozma (Invent. Math. 2023) and Browning–Sawin (Ann.
of Math. 2020). Their accepted source routes name FF.1, FF.3, FF.4 and FF.2, and their items are covered there.

**Retired supplier.** None of this roadmap's inputs is retired.

## Sources

Every source is freely available and was opened and read; the sections read, and the SHA-256 of each file, are in the
packet. SGA 4½, Lidl–Niederreiter and Iwaniec–Kowalski are not public; Shoup's book, Kowalski's notes, Guruswami–Rudra–Sudan
and public papers replace them.

- **`SHOUP.V2`** — Victor Shoup, *A Computational Introduction to Number Theory and Algebra (Version 2)*. Version 2, the author's freely distributable PDF (598 pages); printed page = PDF page − 18; read 2026-09-25 <https://shoup.net/ntb/ntb-v2.pdf>.
- **`conrad-finitefields`** — Keith Conrad, *Finite fields*. Expository handout, the author's PDF (13 pages), read 2026-09-25 <https://kconrad.math.uconn.edu/blurbs/galoistheory/finitefields.pdf>.
- **`conrad-tensorprod2`** — Keith Conrad, *Tensor products II*. Expository handout, the author's PDF (43 pages), read 2026-09-25 <https://kconrad.math.uconn.edu/blurbs/linmultialg/tensorprod2.pdf>.
- **`kowalski-expsums-elementary`** — Emmanuel Kowalski, *Exponential sums over finite fields: elementary methods*. Lecture notes, version of September 14, 2021, the author's PDF; printed page = PDF page − 2; read 2026-09-25 <https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf>.
- **`conrad-gauss-jacobi-sums`** — Keith Conrad, *Gauss and Jacobi sums on finite fields and Z/mZ*. Expository handout, the author's PDF (19 pages), read 2026-09-25 <https://kconrad.math.uconn.edu/blurbs/gradnumthy/Gauss-Jacobi-sums.pdf>.
- **`conrad-lfunctions-gauss-jacobi`** — Keith Conrad, *L-functions for Gauss and Jacobi sums*. Expository handout, the author's PDF (5 pages), read 2026-09-25 <https://kconrad.math.uconn.edu/blurbs/gradnumthy/LfunctionGaussJacobi.pdf>.
- **`conrad-jacobisums-stickelberger`** — Keith Conrad, *Jacobi sums and Stickelberger's congruence*. The author's preprint of L'Enseignement Mathématique (2) 41 (1995), 141–153 (9 pages); the journal pagination was not seen; read 2026-09-25 <https://kconrad.math.uconn.edu/articles/jacobistick.pdf>.
- **`katre-stickelberger-2000`** — S. A. Katre, *Gauss–Jacobi sums and Stickelberger's theorem*. In: Cyclotomic Fields and Related Topics (Pune, 1999), eds. S. D. Adhikari, S. A. Katre, D. Thakur, Bhaskaracharya Pratishthana, 2000, pp. 75–92; the publisher's free PDF; read 2026-09-25 <https://www.bprim.org/sites/default/files/jacn.pdf>.
- **`bary-soroker-koukoulopoulos-kozma-2023`** — Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma, *Irreducibility of random polynomials: general measures*. Invent. Math. 233 (2023), 1041–1120; read as arXiv:2007.14567v3 (marked final version; printed page = PDF page); the SHA-256 matches the paper extraction's record; read 2026-09-25 <https://arxiv.org/pdf/2007.14567v3>.
- **`DELIGNE-SGA45-SOMMES-TRIG`** — Pierre Deligne, *Cohomologie etale (SGA 4 1/2), expose 'Application de la formule des traces aux sommes trigonometriques' [Sommes trig.]*. Lecture Notes in Mathematics 569, Springer 1977, pp. 168-232; scan served by the Institute for Advanced Study (publications.ias.edu, file Number32.pdf, 351 pages); accessed 2026-09-25. This is the roadmap's source DELIGNE. <https://publications.ias.edu/sites/default/files/Number32.pdf>.
- **`DELIGNE-WEIL-I`** — Pierre Deligne, *La conjecture de Weil. I*. Publications mathematiques de l'IHES 43 (1974), 273-307; Numdam scan PMIHES_1974__43__273_0; accessed 2026-09-25 <http://www.numdam.org/article/PMIHES_1974__43__273_0.pdf>.
- **`DELIGNE-WEIL-II`** — Pierre Deligne, *La conjecture de Weil. II*. Publications mathematiques de l'IHES 52 (1980), 137-252; Numdam scan PMIHES_1980__52__137_0; accessed 2026-09-25 <http://www.numdam.org/article/PMIHES_1980__52__137_0.pdf>.
- **`FKMS-APPLIED-L-ADIC`** — Etienne Fouvry, Emmanuel Kowalski, Philippe Michel, Will Sawin, *Lectures on Applied l-adic Cohomology*. arXiv:1712.03173v3 (16 April 2019), 68 pages; published in Contemporary Mathematics 740 (2019); arXiv version read; accessed 2026-09-25 <https://arxiv.org/abs/1712.03173v3>.
- **`LAUMON-FOURIER`** — Gerard Laumon, *Transformation de Fourier, constantes d'equations fonctionnelles et conjecture de Weil*. Publications mathematiques de l'IHES 65 (1987), 131-210; Numdam scan PMIHES_1987__65__131_0; accessed 2026-09-25 <http://www.numdam.org/article/PMIHES_1987__65__131_0.pdf>.
- **`BROWNING-SAWIN-20`** — Tim Browning and Will Sawin, *A geometric version of the circle method*. arXiv:1711.10451v3 (19 February 2020; published Ann. of Math. 191 (2020), 893-948); arXiv v3 read, published locators taken from the reviewed extraction PAPER-BROWNING-SAWIN-20; accessed 2026-09-25 <https://arxiv.org/abs/1711.10451v3>.
- **`GHORPADE-LACHAUD-02`** — Sudhir R. Ghorpade and Gilles Lachaud, *Etale cohomology, Lefschetz theorems and number of points of singular varieties over finite fields*. arXiv:0808.2169v1 (15 August 2008), corrected version of Moscow Math. J. 2 (2002), 589-631; arXiv version read; accessed 2026-09-25 <https://arxiv.org/abs/0808.2169v1>.
- **`BOMBIERI-STEPANOV`** — Enrico Bombieri, *Counting points on curves over finite fields (d'apres S. A. Stepanov)*. Seminaire Bourbaki 25e annee (1972/73), expose 430, pp. 234-241; Numdam scan SB_1972-1973__15__234_0; accessed 2026-09-25 <http://www.numdam.org/article/SB_1972-1973__15__234_0.pdf>.
- **`TOMASIC-TWISTED-CHEBOTAREV`** — Ivan Tomasic, *A twisted theorem of Chebotarev*. arXiv:1210.3571v1 (12 October 2012); accessed 2026-09-25 <https://arxiv.org/abs/1210.3571v1>.
- **`MILNE-ANT`** — J. S. Milne, *Algebraic Number Theory (course notes)*. Version 3.08, 19 July 2020, read 2026-09-25 <https://www.jmilne.org/math/CourseNotes/ANT.pdf>.
- **`SUTHERLAND-18783`** — Andrew V. Sutherland, *18.783 Elliptic Curves, lecture notes*. MIT, Fall 2023: Lecture 3 (14 Sept 2023), Lecture 7 (3 Oct 2023), Lecture 8 (5 Oct 2023), read 2026-09-25 <https://math.mit.edu/classes/18.783/2023/LectureNotes8.pdf>.
- **`SCHOOF95`** — René Schoof, *Counting points on elliptic curves over finite fields*. Journal de Théorie des Nombres de Bordeaux 7 (1995), 219-254 (Numdam), read 2026-09-25 <http://www.numdam.org/item/JTNB_1995__7_1_219_0.pdf>.
- **`begr-subspace`** — Eli Ben-Sasson, Tuvi Etzion, Ariel Gabizon and Netanel Raviv, *Subspace Polynomials and Cyclic Subspace Codes*. arXiv:1404.7739v3 (12 April 2015); read 2026-09-25 <https://arxiv.org/abs/1404.7739>.
- **`bluher-dickson`** — Antonia W. Bluher, *Permutation properties of Dickson and Chebyshev polynomials with connections to number theory*. arXiv:1707.06877v3 (1 May 2021); read 2026-09-25 <https://arxiv.org/abs/1707.06877>.
- **`cr-ag-codes`** — Alain Couvreur and Hugues Randriambololona, *Algebraic geometry codes and some applications*. arXiv:2009.01281v1 (2 September 2020); read 2026-09-25 <https://arxiv.org/abs/2009.01281>.
- **`dedeo-velasquez-heat`** — M. R. DeDeo and Elinor Velasquez, *The Heat Equation on the Finite Poincaré Upper Half-Plane*. arXiv:2001.10555v1 (28 January 2020); read 2026-09-25 <https://arxiv.org/abs/2001.10555>.
- **`gk-asrs`** — Mark Goresky and Andrew Klapper, *Algebraic Shift Register Sequences*. Public draft of October 14, 2009 (the book appeared with Cambridge University Press, 2012); read 2026-09-25 <https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf>.
- **`grs-ect`** — Venkatesan Guruswami, Atri Rudra and Madhu Sudan, *Essential Coding Theory*. Public draft dated August 26, 2025; read 2026-09-25 <https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/web-coding-book.pdf>.
- **`kuang-finite-plane`** — Jinghua Kuang, *Eigenfunctions on the Finite Poincaré Plane*. arXiv:math/9411217v1 (29 November 1994); read 2026-09-25 <https://arxiv.org/abs/math/9411217>.
- **`shallue-pp`** — Christopher J. Shallue, *Permutation polynomials of finite fields*. arXiv:1211.6044v1 (23 November 2012); read 2026-09-25 <https://arxiv.org/abs/1211.6044>.
- **`vinh-dung-ramsey`** — Le Anh Vinh and Dang Phuong Dung, *Explicit tough Ramsey graphs*. arXiv:0807.2692v1 (17 July 2008); read 2026-09-25 <https://arxiv.org/abs/0807.2692>.
- **`wu-liu-linearized`** — Baofeng Wu and Zhuojun Liu, *Linearized polynomials over finite fields revisited*. arXiv:1211.5475v2 (1 January 2013); read 2026-09-25 <https://arxiv.org/abs/1211.5475>.
- **`griffiths-local-densities`** — Samuel Griffiths, *Elementary local representation densities at all primes via lifting recursions*. arXiv:2602.21070v1 (24 February 2026); read 2026-09-25 <https://arxiv.org/abs/2602.21070>.

## Layers

## FF.0 Finite-field constructions

This layer builds the finite-field input models and their certificates: presentations F_q[X]/(f) of a finite field
with a checked irreducibility certificate and an explicit isomorphism with its inverse; embeddings and changes of
presentation given by checked roots; the decomposition of a tensor product of finite fields; and normal elements with
the Frobenius normal basis and a checkable normality criterion. Following the accepted restructuring RS-03, the
classification of finite fields, their existence and cardinality, the absolute and relative Frobenius, subfields and
embedding counts, the trace and norm formulas with their surjectivity, and the normal basis theorem are imported from
the pinned libraries; the layer adds the constructions and comparison certificates the libraries do not state.
Specialised finite-field constructors belong here; the generic exact-presentation, bit-cost and checking interfaces
that consume them belong to `ComputationalNumberTheory:CN.0`.

### Conventions

- `F` is a finite field with `q = Fintype.card F` elements and characteristic `p = ringChar F`. The prime field is
  Mathlib's `ZMod p`; every construction below is relative, over an arbitrary finite field `F`, so towers
  `F ⊆ E ⊆ K` are presented one step at a time.
- Remainders are Mathlib's `Polynomial.modByMonic` (`%ₘ`) by a monic divisor. `frobResidue f k` is the remainder of
  `X^(q^k)` modulo `f`, computed by `k` successive `q`-th powers modulo `f`.
- A presentation of `K` over `F` is an `F`-algebra isomorphism `AdjoinRoot f ≃ₐ[F] K` sending `root f` to a chosen
  root `α ∈ K`; the inverse is given by power-basis coordinates in `1, α, …, α^(n−1)`, never by a choice.
- The relative Frobenius of `L/K` is `x ↦ x^(#K)` (`FiniteField.frobeniusAlgHom K L`,
  `FiniteField.frobeniusAlgEquivOfAlgebraic K L`); the absolute one is `frobenius L p`, `x ↦ x^p`; with
  `#K = p^w` the relative Frobenius is the `w`-th power of the absolute one.
- Traces and norms are always to a named base field (`Algebra.trace F K`, `Algebra.norm F K`); the absolute trace is
  the trace to `ZMod p`.
- Certificates are data whose checks are decidable equalities in `F[X]` (for `F` with decidable equality); the
  executable refinement on coefficient arrays, with bit costs and randomness models, is `ComputationalNumberTheory:CN.0`'s.

### What is already built (consume; never restate)

Cited from the pinned Mathlib: `FiniteField.card`, `GaloisField`, `GaloisField.card`, `FiniteField.algEquivOfCardEq`
and `GaloisField.algEquivGaloisField` (isomorphisms of equal-cardinality fields, by existence only),
`FiniteField.Extension` with `FiniteField.algEquivExtension`; the absolute Frobenius `frobenius` and the relative
`FiniteField.frobeniusAlgEquivOfAlgebraic` with `FiniteField.coe_frobeniusAlgEquivOfAlgebraic` (the exponent `#K` is
explicit), `FiniteField.orderOf_frobeniusAlgHom` and `FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow`
(the Galois group is cyclic generated by the Frobenius), `FiniteField.minpoly_frobeniusAlgHom`;
`FiniteField.nonempty_algHom_iff_finrank_dvd` and `FiniteField.natCard_algHom_of_finrank_dvd` (embeddings exist iff
the degree divides, and there are `[K : F]` of them); `FiniteField.algebraMap_trace_eq_sum_pow`,
`FiniteField.algebraMap_norm_eq_prod_pow`, `FiniteField.algebraMap_norm_eq_pow`, `FiniteField.norm_surjective`,
`Algebra.trace_surjective`, `FiniteField.trace_to_zmod_nondegenerate`, `Algebra.trace_trace`, `Algebra.norm_norm`;
the normal basis theorem `IsGalois.normalBasis` with `IsGalois.normalBasis_apply`; and the divisibility criterion
`Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`. Cited from the pinned Tau Ceti:
`TauCeti.eq_frobeniusFixedSubfield_of_natCard` (the subfield of order `p^n` of a separably closed field is the fixed
field of the `p^n`-power map) and the Frobenius-orbit lemmas of the module `TauCeti.FieldTheory.Finite.MinpolyOrbit`
(`TauCeti.FiniteField.orbit_eq_rootSet_minpoly`, `TauCeti.FiniteField.mem_orbit_iff_minpoly_eq`,
`TauCeti.FiniteField.mem_orbit_iff_exists_pow_card_pow`, `TauCeti.FiniteField.natCard_orbit_eq_natDegree_minpoly`,
`TauCeti.FiniteField.map_minpoly_eq_prod_orbit`).

### 1. Frobenius residues and Rabin's irreducibility test

The criterion and its certificate carry the ids fixed for the whole roadmap: `FiniteFieldsAndCharacterSums:FF.3` imports them for its factorisation outputs. No other irreducibility certificate is planned.

**Definition `frobenius-power-residue`** — The Frobenius power residue X^(q^k) mod f. Let F be a finite field with q elements and f ∈ F[X] monic. The k-th Frobenius power residue of f is the polynomial frobResidue f k ∈ F[X] defined by frobResidue f 0 = X mod f and frobResidue f (k+1) = (frobResidue f k)^q mod f, where 'mod f' is Mathlib's remainder by a monic divisor (Polynomial.modByMonic, written %ₘ). It is the remainder of X^(q^k) on division by f, it has degree < deg f when deg f ≥ 1, and its class in F[X]/(f) is the q^k-th power of the class of X. Its role is computational: X^(q^k) has degree q^k, while frobResidue f k is obtained by k successive q-th powers modulo f and has degree < deg f.

Hypotheses and conventions: F is a finite field (Fintype F), q = Fintype.card F. f is monic; for f = 1 every residue is 0, for f = X every residue is 0. The recursion takes the q-th power of a polynomial of degree < deg f and reduces it modulo f; the cost per step is O(log q) multiplications modulo f (repeated squaring), Shoup Theorem 20.1.

API: `frobResidue` (constructor: frobResidue f k ∈ F[X], defined by frobResidue f 0 = X %ₘ f and frobResidue f (k+1) = (frobResidue f k)^q %ₘ f); `frobResidue_zero` (simp: frobResidue f 0 = X %ₘ f); `frobResidue_succ` (simp: frobResidue f (k+1) = (frobResidue f k)^q %ₘ f); `frobResidue_eq_modByMonic` (characterisation: For monic f: frobResidue f k = X^(q^k) %ₘ f); `natDegree_frobResidue_lt` (other: For monic f ≠ 1: natDegree (frobResidue f k) < natDegree f); `mk_frobResidue` (compatibility: AdjoinRoot.mk f (frobResidue f k) = (AdjoinRoot.root f)^(q^k)); `isCoprime_frobResidue_sub_X_iff` (relation: IsCoprime (frobResidue f k − X) f ↔ IsCoprime (X^(q^k) − X) f); `dvd_frobResidue_sub_X_iff` (relation: f ∣ frobResidue f k − X ↔ f ∣ X^(q^k) − X); `frobResidue_add` (relation: frobResidue f (k + l) = (frobResidue f l).comp (frobResidue f k) %ₘ f (Shoup, Exercise 20.1(b))).

Unit tests: Over ZMod 2: frobResidue (X^2 + X + 1) 1 = X + 1 (`test_frobResidue_F2_quadratic`, computation); Over ZMod 2: frobResidue (X^2 + X + 1) 2 = X (`test_frobResidue_F2_quadratic_two`, computation); For every k: frobResidue X k = 0 (`test_frobResidue_modulus_X`, degenerate); Over ZMod 2: frobResidue (X^2 + X + 1) 1 ≠ X^2; a definition returning the literal power X^(q^k) fails (`test_frobResidue_ne_pow`, non-example); For f monic irreducible: frobResidue f (natDegree f) = X %ₘ f (Mathlib's Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X) (`test_frobResidue_irreducible`, compatibility).

Uses: Shoup §20.1, Algorithm IPT (p. 523): the loop variable h is frobResidue f k; gcd(h − X, f) detects irreducible factors of degree k; FiniteFieldsAndCharacterSums:FF.0/rabin-irreducibility-certificate: the certificate's two checks are stated on frobResidue f n and frobResidue f (n/s); FiniteFieldsAndCharacterSums:FF.0/certified-presentation-of-a-finite-field: the Frobenius image of the generator is the first residue: α^q = frobResidue f 1 evaluated at α; FiniteFieldsAndCharacterSums:FF.3 (factorisation algorithms): X^q mod f is the input of Berlekamp's matrix and of distinct-degree factorisation.

Construction: Define frobResidue f by recursion on k, using Polynomial.modByMonic. Congruence with the literal power: a %ₘ f ≡ a (mod f) (Polynomial.modByMonic_add_div), so by induction frobResidue f k ≡ X^(q^k) (mod f); both frobResidue f k and X^(q^k) %ₘ f are remainders of degree < deg f (Polynomial.natDegree_modByMonic_lt) of the same class, hence equal (uniqueness of the remainder, Polynomial.modByMonic_eq_zero_iff_dvd applied to their difference). Class in the quotient: AdjoinRoot.mk f (frobResidue f k) = AdjoinRoot.mk f (X^(q^k)) = (AdjoinRoot.root f)^(q^k) (AdjoinRoot.mk_eq_mk, AdjoinRoot.aeval_eq). Reduction lemma (Shoup §20.1, p. 523): since frobResidue f k − X ≡ X^(q^k) − X (mod f), the two polynomials have the same common divisors with f; hence IsCoprime (frobResidue f k − X) f ↔ IsCoprime (X^(q^k) − X) f and f ∣ frobResidue f k − X ↔ f ∣ X^(q^k) − X. Composition rule (Shoup, Exercise 20.1(b)): in F[X]/(f) the q-power map is an F-algebra endomorphism (FiniteField.frobeniusAlgHom), so root^(q^(k+l)) = σ^k(σ^l(root)) = σ^k(h_l(root)) = h_l(σ^k(root)) = h_l(h_k(root)); therefore frobResidue f (k+l) = (frobResidue f l).comp (frobResidue f k) %ₘ f. For f monic irreducible of degree n, n ∣ n gives f ∣ X^(q^n) − X (Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X), i.e. frobResidue f n = X %ₘ f.

Acceptance: Over F_2 with f = X^2 + X + 1: frobResidue f 1 = X + 1 and frobResidue f 2 = X (recomputed: X^2 ≡ X + 1 and X^4 ≡ X modulo f). For f monic irreducible of degree n, frobResidue f n = X %ₘ f. Modulo f = X every residue is 0.

Rests on: library `Polynomial.modByMonic`, `Polynomial.modByMonic_add_div`, `Polynomial.modByMonic_eq_zero_iff_dvd`, `Polynomial.natDegree_modByMonic_lt`, `AdjoinRoot.mk_eq_mk`, `AdjoinRoot.aeval_eq`, `FiniteField.frobeniusAlgHom`, `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`, `IsCoprime`.

Sources: Shoup, §20.1, discussion before Algorithm IPT, printed p. 523; Shoup, Exercise 20.1(b), printed p. 524.

**Theorem `rabin-irreducibility-criterion`** (planet: *Rabin's irreducibility test*) — Rabin's irreducibility criterion. Let F be a finite field with q elements and f ∈ F[X] monic of degree n > 0. Then f is irreducible if and only if (i) X^(q^n) ≡ X (mod f), and (ii) gcd(X^(q^(n/s)) − X, f) = 1 (IsCoprime (X^(q^(n/s)) − X) f) for every prime s dividing n. Equivalently, on residues: frobResidue f n = X %ₘ f and IsCoprime (frobResidue f (n/s) − X) f for every prime s ∣ n.

Hypotheses and conventions: F is a finite field with q elements; f is monic with n = natDegree f > 0. n > 0 is necessary: for f = 1 (n = 0) condition (i) holds and (ii) holds vacuously for every s (all primes divide 0 but gcd(·, 1) = 1), yet 1 is not irreducible. No squarefreeness hypothesis: (i) alone forces every irreducible factor to have degree dividing n, and (ii) excludes proper divisors.

Proof: (⇒) Let f be irreducible of degree n. Since n ∣ n, f ∣ X^(q^n) − X (Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X). (⇒) Let s ∣ n be prime. If f and X^(q^(n/s)) − X were not coprime, then f ∣ X^(q^(n/s)) − X (an irreducible element is coprime to every element it does not divide: Irreducible.coprime_iff_not_dvd), so n ∣ n/s by the same lemma, impossible as 0 < n/s < n. (⇐) Let g be an irreducible factor of f (Polynomial.exists_irreducible_of_degree_pos, since n > 0). By (i), g ∣ X^(q^n) − X, so k := natDegree g divides n (Irreducible.natDegree_dvd_of_dvd_X_pow_card_pow_sub_X). (⇐) If k < n, then n/k > 1 has a prime factor s (Nat.exists_prime_and_dvd); s ∣ n and k ∣ n/s, so g ∣ X^(q^(n/s)) − X (Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X). Then g is a non-unit common divisor of f and X^(q^(n/s)) − X, contradicting (ii). (⇐) Hence every irreducible factor of f has degree n = natDegree f; a monic polynomial all of whose irreducible factors have its own degree is an associate of each of them, hence irreducible (Polynomial.Monic.irreducible_iff_natDegree: in any factorisation f = a·b into monic factors one factor has degree 0). Residue form: replace X^(q^k) by frobResidue f k using FiniteFieldsAndCharacterSums:FF.0/frobenius-power-residue (dvd_frobResidue_sub_X_iff, isCoprime_frobResidue_sub_X_iff).

Acceptance: Over F_2, f = X^2 + X + 1 (n = 2, s = 2): X^2 − X ≡ 1 (mod f) is coprime to f and X^4 ≡ X (mod f), so f is irreducible. Over F_2, f = (X^2 + X + 1)^2: condition (i) fails, since X^16 − X is squarefree (its derivative is −1) and cannot be divisible by a square; the criterion correctly rejects f. Over F_2, f = (X^2 + X + 1)(X^3 + X + 1) of degree 5: condition (ii) holds (X^2 − X = X(X+1) and f has no root in F_2), but (i) fails because X^2 + X + 1 ∤ X^32 − X (2 ∤ 5); (ii) alone does not certify irreducibility. Over F_p, X^4 + 1 fails the criterion for every prime p (it is reducible over every prime field: Shoup, Exercise 19.13).

Rests on: nodes `frobenius-power-residue`; library `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`, `Irreducible.natDegree_dvd_of_dvd_X_pow_card_pow_sub_X`, `Irreducible.coprime_iff_not_dvd`, `Polynomial.exists_irreducible_of_degree_pos`, `Nat.exists_prime_and_dvd`, `Polynomial.Monic.irreducible_iff_natDegree`, `IsCoprime`.

Sources: Shoup, Exercise 20.2(a), printed p. 524; Shoup, Theorem 19.10, printed p. 513; Conrad, Finite fields, Theorem 3.3, p. 6.

**Definition `rabin-irreducibility-certificate`** — Rabin irreducibility certificates and their checker. Let F be a finite field with decidable equality and f ∈ F[X]. A Rabin certificate for f is a family of Bézout pairs (u_s, v_s) ∈ F[X]^2 indexed by the primes s dividing n = natDegree f (a function ℕ → F[X] × F[X] whose values off the prime factors of n are ignored). The checker check f c : Bool returns true exactly when (a) f is monic, (b) n > 0, (c) frobResidue f n = X %ₘ f, and (d) for every prime s ∈ n.primeFactors, u_s·(frobResidue f (n/s) − X) + v_s·f = 1. Soundness: check f c = true implies Irreducible f. Completeness: if f is monic and irreducible then the certificate ofIrreducible f, whose pairs are the extended-Euclid cofactors (EuclideanDomain.gcdA, EuclideanDomain.gcdB) of frobResidue f (n/s) − X and f, is accepted. The checker is Bool-valued through decidability of equality in F[X]; an executable refinement on dense coefficient arrays, with bit costs, is ComputationalNumberTheory:CN.0's.

Hypotheses and conventions: F is a finite field with DecidableEq F, so equality in F[X] is decidable (Mathlib's instance for polynomials). The certificate carries only the Bézout data; the Frobenius residues are recomputed by the checker, which performs ω(n) + 1 residue computations (Shoup, Exercise 20.2(b)). Coprimality is certified by an explicit Bézout identity u·a + v·f = 1, the definition of IsCoprime.

API: `RabinCertificate` (constructor: The structure holding the Bézout pairs bezout : ℕ → F[X] × F[X] for a fixed f); `RabinCertificate.check` (data: The Bool checker: decide (f monic ∧ 0 < natDegree f ∧ frobResidue f n = X %ₘ f ∧ ∀ s ∈ n.primeFactors, u_s(frobResidue f (n/s) − X) + v_s f = 1)); `RabinCertificate.check_iff` (characterisation: check = true ↔ the four conditions (a)–(d)); `RabinCertificate.irreducible_of_check` (other: Soundness: check = true → Irreducible f); `RabinCertificate.ofIrreducible` (constructor: The canonical certificate: extended-Euclid cofactors of frobResidue f (n/s) − X and f); `RabinCertificate.check_ofIrreducible` (other: For f monic irreducible, (ofIrreducible f).check = true); `RabinCertificate.exists_check_of_irreducible` (other: Completeness: f monic irreducible → ∃ c, c.check = true).

Unit tests: Over ZMod 2, the certificate with pairs (1, 0) for f = X^2 + X + 1 is accepted (`test_rabinCertificate_F2_quadratic`, computation); For f = 1 every certificate is rejected (natDegree 1 = 0) (`test_rabinCertificate_constant`, degenerate); For f = (X^2 + X + 1)^2 over ZMod 2 every certificate is rejected: condition (c) fails (`test_rabinCertificate_square_rejected`, non-example); For f = (X^2 + X + 1)(X^3 + X + 1) over ZMod 2, X^2 − X is coprime to f (the check at s = 5 can be passed) and still every certificate is rejected, because (c) fails (`test_rabinCertificate_product_rejected`, non-example); For f monic irreducible, (RabinCertificate.ofIrreducible f).check = true (`test_rabinCertificate_compat`, compatibility).

Uses: FiniteFieldsAndCharacterSums:FF.0/certified-presentation-of-a-finite-field: every certified presentation stores an accepted certificate for its defining polynomial; FiniteFieldsAndCharacterSums:FF.3 (irreducibility witnesses of factorisation outputs): a factorisation is certified by checking the product and an accepted certificate for each factor; ComputationalNumberTheory:CN.1 (factorisation certificates): polynomial factorisation outputs carry irreducibility proofs; the RS-03 link FF.0 → CN.1 forwards them; Shoup §20.1, Algorithm RIP (p. 523–524): a randomly generated candidate is kept only when the test accepts it.

Construction: check_iff: unfold decide on the conjunction; f.Monic is leadingCoeff f = 1. Soundness: (d) gives IsCoprime (frobResidue f (n/s) − X) f for each prime s ∣ n (definition of IsCoprime), (c) gives f ∣ frobResidue f n − X, i.e. X^(q^n) ≡ X (mod f); FiniteFieldsAndCharacterSums:FF.0/rabin-irreducibility-criterion (residue form) then gives Irreducible f. Completeness: for f monic irreducible, the criterion gives (c) and coprimality of frobResidue f (n/s) − X with f for every prime s ∣ n; over a Euclidean domain gcd(a, f) = 1 up to units, and gcdA·a + gcdB·f = gcd (EuclideanDomain.gcd_eq_gcd_ab); normalising the gcd to 1 (it is a unit, a nonzero constant, so multiply both cofactors by its inverse) gives accepted pairs. Rejections: if f is not irreducible, no certificate is accepted (contrapositive of soundness); if deg f = 0, check is false by (b).

Acceptance: X^2 + X + 1 over F_2 with pairs (1, 0) at s = 2 is accepted: frobResidue f 1 − X = 1. The polynomial (X^2 + X + 1)(X^3 + X + 1) over F_2 passes the Bézout part at s = 5 but every certificate is rejected by check (c). Soundness and completeness together: for monic f, (∃ c, check f c = true) ↔ Irreducible f ∧ 0 < natDegree f.

Rests on: nodes `rabin-irreducibility-criterion`, `frobenius-power-residue`; library `EuclideanDomain.gcd`, `EuclideanDomain.gcdA`, `EuclideanDomain.gcd_eq_gcd_ab`, `IsCoprime`, `Polynomial.Monic`, `Irreducible`.

Sources: Shoup, Exercise 20.2(a)–(b), printed pp. 524–525; Shoup, §20 introduction, printed p. 522.

### 2. Certified presentations and comparison maps

**Construction `certified-presentation-of-a-finite-field`** (planet: *Certified presentation of a finite field*) — Certified presentation of a finite field. Let F be a finite field with decidable equality and K a field that is an F-algebra. A certified presentation P of K over F consists of a polynomial f = P.poly ∈ F[X] with an accepted Rabin certificate (FiniteFieldsAndCharacterSums:FF.0/rabin-irreducibility-certificate), an element α = P.root ∈ K with f(α) = 0, and the equality finrank F K = natDegree f. From P one constructs the F-algebra isomorphism P.equiv : F[X]/(f) ≃ₐ[F] K sending the class of X to α, whose inverse sends x ∈ K to the class of Σ_{i<n} c_i X^i, where (c_i) are the coordinates of x in the power basis 1, α, …, α^(n−1) (P.powerBasis). Every finite field K of finite degree over F has a certified presentation. Relative presentations are allowed (F any finite field, not only a prime field), so a tower F ⊆ E ⊆ K is presented by presenting E over F and K over E; the prime field itself is Mathlib's ZMod p.

Hypotheses and conventions: F is a finite field with DecidableEq F; K is a field with Algebra F K (finite over F by finrank_eq). The certificate is part of the data; irreducibility of f is derived from it, never assumed. Pinned convention: the isomorphism goes from the quotient F[X]/(f) = AdjoinRoot f to K and sends root f to α; its inverse is given by power-basis coordinates, not by a choice.

API: `CertifiedPresentation` (structure: The structure: poly, cert, cert_check, root, aeval_root, finrank_eq); `CertifiedPresentation.monic` (other: P.poly is monic); `CertifiedPresentation.irreducible` (other: P.poly is irreducible (from the certificate)); `CertifiedPresentation.minpoly_root` (characterisation: minpoly F P.root = P.poly); `CertifiedPresentation.powerBasis` (data: The power basis 1, α, …, α^(n−1) of K over F); `CertifiedPresentation.equiv` (equivalence: The F-algebra isomorphism AdjoinRoot P.poly ≃ₐ[F] K, root ↦ α); `CertifiedPresentation.equiv_root` (simp: P.equiv (AdjoinRoot.root P.poly) = P.root); `CertifiedPresentation.equiv_symm_apply` (characterisation: P.equiv.symm x = mk (Σ_i C (repr x i) X^i), the coordinate formula for the inverse); `CertifiedPresentation.card` (other: #K = q^(natDegree P.poly)); `CertifiedPresentation.root_pow_card` (compatibility: α^q = aeval α (frobResidue P.poly 1): the Frobenius of the generator is the first residue); `CertifiedPresentation.trace_root` (compatibility: Tr_{K/F}(α) = −nextCoeff P.poly); `CertifiedPresentation.norm_root` (compatibility: N_{K/F}(α) = (−1)^n · (P.poly).coeff 0); `CertifiedPresentation.exists_presentation` (other: Every finite field extension K of F has a certified presentation).

Unit tests: For a presentation P of GaloisField 2 2 over ZMod 2 with P.poly = X^2 + X + 1: P.equiv (mk (X + 1)) = P.root + 1 (`test_certifiedPresentation_F4`, computation); For a presentation P of F over itself (natDegree P.poly = 1): P.equiv.symm x = mk (C x) (`test_certifiedPresentation_degree_one`, degenerate); A presentation of GaloisField p n over ZMod p (n ≠ 0) has natDegree P.poly = n, matching GaloisField.card (`test_certifiedPresentation_card`, compatibility); Over ZMod p, every Rabin certificate for X^4 + 1 is rejected, so X^4 + 1 is the polynomial of no certified presentation (`test_certifiedPresentation_X4_plus_1`, non-example); minpoly F P.root = P.poly: the root generates K (`test_certifiedPresentation_minpoly`, characterisation).

Uses: ComputationalNumberTheory:CN.0 (RS-03 link FF.0 → CN.0): the generic exact-presentation interface consumes this constructor and its comparison maps; FiniteFieldsAndCharacterSums:FF.3: factorisation and point-counting algorithms take their fields in this presentation; ComputationalNumberTheory:CN.1, CN.4 and EffectiveDiophantineMethods:ED.0 (forwarded RS-03 links): residue fields handed to local and numerical adapters are given by certified presentations; FiniteFieldsAndCharacterSums:FF.1/canonical-additive-character: traces in a presented field are computed from the coefficients of f (trace_root); Conrad, Finite fields, Theorem 1.10 and Examples 1.2–1.4: the polynomial models F_p[x]/(π(x)) of finite fields.

Construction: f is irreducible by soundness of the certificate (RabinCertificate.irreducible_of_check); f is monic by check_iff. α has minimal polynomial f: f is monic, irreducible and vanishes at α (minpoly.eq_of_irreducible_of_monic). Hence F(α) has degree natDegree f = finrank F K and equals K, so α generates K and PowerBasis.ofAdjoinEqTop gives the power basis 1, α, …, α^(n−1). AdjoinRoot.equiv' with this power basis gives the F-algebra isomorphism AdjoinRoot f ≃ₐ[F] K; its forward map is AdjoinRoot.liftAlgHom (root ↦ α) and its inverse is PowerBasis.lift (α ↦ root f), both of which are explicit; equiv_symm_apply is the coordinate formula for the inverse (PowerBasis.lift applied to Σ c_i α^i). Frobenius in the presentation: α^q = aeval α (frobResidue f 1) because frobResidue f 1 ≡ X^q (mod f) (FiniteFieldsAndCharacterSums:FF.0/frobenius-power-residue) and f(α) = 0. Trace and norm of the generator: Tr_{K/F}(α) = −nextCoeff f (PowerBasis.trace_gen_eq_nextCoeff_minpoly) and N_{K/F}(α) = (−1)^n f(0) (Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly). Existence: K is finite over F, so it has a primitive element α (Field.exists_primitive_element; a generator of Kˣ works); take f = minpoly F α, which is monic irreducible of degree finrank F K, and the certificate RabinCertificate.ofIrreducible f. Comparison with the library: Mathlib's FiniteField.algEquivOfCardEq and GaloisField.algEquivGaloisField give isomorphisms by existence only; P.equiv composed with them identifies F[X]/(f) with GaloisField, and two presentations with the same f and roots α, α^(q^i) differ by the Frobenius power (FiniteFieldsAndCharacterSums:FF.0/presentation-embedding-from-root, roots_eq_frobenius_orbit).

Acceptance: F_4 presented over F_2 by X^2 + X + 1: equiv (mk (X + 1)) = α + 1, and equiv.symm (α + 1) = mk (X + 1). Conrad, Examples 1.2–1.3: F_2[x]/(x^3 + x + 1) and F_2[x]/(x^3 + x^2 + 1) both present fields of order 8; F_3[x]/(x^2 + 1) and F_3[x]/(x^2 + x + 2) both present fields of order 9. The degree-one presentation X − a of F over itself has inverse x ↦ mk (C x). X^4 + 1 presents no field of order p^4 over F_p, for any p: no certificate for it is accepted (Shoup, Exercise 19.13).

Rests on: nodes `rabin-irreducibility-certificate`, `frobenius-power-residue`; library `AdjoinRoot.equiv'`, `AdjoinRoot.liftAlgHom`, `AdjoinRoot.instField`, `PowerBasis.lift`, `PowerBasis.ofAdjoinEqTop`, `minpoly.eq_of_irreducible_of_monic`, `Field.exists_primitive_element`, `PowerBasis.trace_gen_eq_nextCoeff_minpoly`, `Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`, `FiniteField.algEquivOfCardEq`, `GaloisField.algEquivGaloisField`.

Sources: Shoup, §19.2, printed p. 511; Conrad, Finite fields, Theorem 1.10, p. 2; Shoup, §20 introduction, printed p. 522.

**Construction `presentation-embedding-from-root`** — Embeddings between presented finite fields from root certificates. Let F be a finite field with q elements and f, g ∈ F[X] irreducible of degrees m and n. A root certificate for an embedding F[X]/(f) → F[X]/(g) is a polynomial b ∈ F[X] with f(b) ≡ 0 (mod g), i.e. g ∣ f.comp b (checked by a remainder computation). It defines the F-algebra homomorphism embeddingOfRoot b : F[X]/(f) → F[X]/(g), [h]_f ↦ [h(b)]_g, sending the class of X to the class of b; being a homomorphism of fields it is injective. A root certificate exists exactly when m ∣ n; the roots of f in F[X]/(g) are then [b]^(q^i), 0 ≤ i < m, there are exactly m embeddings, and the image of each is the subfield {y : y^(q^m) = y} fixed by the q^m-power map.

Hypotheses and conventions: f and g are irreducible (certified by FF.0/rabin-irreducibility-certificate when used in presentations). The certificate is the single polynomial b; the check is g ∣ f.comp b, i.e. (f.comp b) %ₘ g = 0.

API: `embeddingOfRoot` (constructor: For b with g ∣ f.comp b: the F-algebra hom AdjoinRoot f →ₐ[F] AdjoinRoot g sending root f to mk g b); `embeddingOfRoot_root` (simp: embeddingOfRoot b (root f) = mk g b); `embeddingOfRoot_mk` (simp: embeddingOfRoot b (mk f h) = mk g (h.comp b)); `exists_root_iff_dvd` (characterisation: For f, g irreducible: (∃ b, g ∣ f.comp b) ↔ natDegree f ∣ natDegree g); `mem_range_embeddingOfRoot_iff` (characterisation: y is in the image iff y^(q^(natDegree f)) = y); `roots_eq_frobenius_orbit` (relation: g ∣ f.comp c ↔ mk g c = (mk g b)^(q^i) for some i < natDegree f); `card_algHom_adjoinRoot` (other: There are exactly natDegree f embeddings AdjoinRoot f →ₐ[F] AdjoinRoot g when natDegree f ∣ natDegree g).

Unit tests: Over ZMod 2: (X^4 + X + 1) ∣ (X^2 + X + 1).comp (X^2 + X) (`test_embeddingOfRoot_F4_F16`, computation); Over ZMod 2, for every b: ¬ (X^3 + X + 1) ∣ (X^2 + X + 1).comp b (`test_embeddingOfRoot_no_root`, non-example); With g = f and b = X, embeddingOfRoot is the identity (`test_embeddingOfRoot_identity`, degenerate); Over ZMod 7: (X^3 − 2) ∣ (X^3 + X^2 + 6X + 5).comp (X^2 + X + 2) (Conrad, Example 3.8) (`test_embeddingOfRoot_conrad`, computation).

Uses: Shoup, Theorem 19.13 (subfield structure): subfields of a presented field are images of root-certificate embeddings; FiniteFieldsAndCharacterSums:FF.0/presentation-change-isomorphism: an isomorphism between two presentations of the same degree is a pair of mutually inverse root-certificate embeddings; ComputationalNumberTheory:CN.0: embedding and comparison maps between presentations are part of the exact-presentation interface; FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-lifting: lifting characters from F_q to F_(q^n) needs the extension given with its embedding of the base.

Construction: Well-definedness: AdjoinRoot.liftAlgHom needs f evaluated at [b]_g to vanish, which is g ∣ f.comp b (AdjoinRoot.mk_eq_mk). Formula on classes: the lift sends mk f h to aeval [b]_g h = mk g (h.comp b). Existence iff m ∣ n: F[X]/(f) and F[X]/(g) are fields of degrees m, n over F; an F-embedding exists iff m ∣ n (FiniteField.nonempty_algHom_iff_finrank_dvd), and an embedding is determined by the image of the class of X, a root of f. Roots and count: in the field F[X]/(g) the roots of f form one Frobenius orbit {β^(q^i) : i < m} (Tau Ceti's TauCeti.FiniteField.orbit_eq_rootSet_minpoly and TauCeti.FiniteField.mem_orbit_iff_exists_pow_card_pow), so there are m embeddings (FiniteField.natCard_algHom_of_finrank_dvd). Image: the image is a subfield with q^m elements; in a finite field it is the fixed field of the q^m-power map (Shoup, Theorem 19.13; FiniteField.pow_card on the subfield gives ⊆, and both sets have q^m elements; for the absolute case this is TauCeti.eq_frobeniusFixedSubfield_of_natCard).

Acceptance: F_4 → F_16 over F_2: b = Y^2 + Y is a root of X^2 + X + 1 modulo Y^4 + Y + 1, since (Y^2+Y)^2 + (Y^2+Y) + 1 = Y^4 + Y + 1. Conrad, Example 3.8: over F_7, Y^2 + Y + 2 is a root of X^3 + X^2 + 6X + 5 modulo Y^3 − 2 (verified by polynomial arithmetic modulo 7). No root certificate exists from X^2 + X + 1 into F_2[Y]/(Y^3 + Y + 1), since 2 ∤ 3.

Rests on: nodes `certified-presentation-of-a-finite-field`; library `AdjoinRoot.liftAlgHom`, `AdjoinRoot.mk_eq_mk`, `FiniteField.nonempty_algHom_iff_finrank_dvd`, `FiniteField.natCard_algHom_of_finrank_dvd`, `FiniteField.pow_card`, `TauCeti.FiniteField.orbit_eq_rootSet_minpoly`, `TauCeti.FiniteField.mem_orbit_iff_exists_pow_card_pow`, `TauCeti.eq_frobeniusFixedSubfield_of_natCard`.

Sources: Shoup, Theorem 19.13, printed p. 515; Conrad, Finite fields, Corollary 3.7 and Example 3.8, p. 8.

**Construction `presentation-change-isomorphism`** — Change of presentation with explicit inverse. Let F be a finite field and f, g ∈ F[X] irreducible of the same degree n. A change-of-presentation certificate is a pair (b, c) ∈ F[X]^2 with g ∣ f.comp b (b is a root of f modulo g), f ∣ g.comp c (c is a root of g modulo f) and f ∣ b.comp c − X. It defines the F-algebra isomorphism presentationChange b c : F[X]/(f) ≃ₐ[F] F[X]/(g), [X]_f ↦ [b]_g, whose inverse is the embedding [Y]_g ↦ [c]_f; the reverse congruence g ∣ c.comp b − X follows. Every pair of irreducible polynomials of the same degree admits a certificate, and certificates compose.

Hypotheses and conventions: f and g irreducible over the finite field F with natDegree f = natDegree g. All three congruences are checked by remainder computations; nothing is chosen noncomputably.

API: `presentationChange` (constructor: From (b, c) with the three congruences: AdjoinRoot f ≃ₐ[F] AdjoinRoot g); `presentationChange_root` (simp: presentationChange b c (root f) = mk g b); `presentationChange_symm_root` (simp: (presentationChange b c).symm (root g) = mk f c); `presentationChange_comp_self` (relation: The reverse congruence g ∣ c.comp b − X holds); `exists_presentationChange` (other: For f, g irreducible of equal degree a certificate exists); `presentationChange_trans` (functoriality: Composition of certificates: the composite sends root f to mk h (b.comp b')).

Unit tests: (X, X) is a certificate from f to itself: f ∣ f.comp X and f ∣ X.comp X − X (`test_presentationChange_refl`, degenerate); Over ZMod 7: (X^3 − 2) ∣ (X^3 − 2).comp (2X) but ¬ (X^3 − 2) ∣ (2X).comp (2X) − X (`test_presentationChange_inverse_needed`, non-example); Over ZMod 3: (X^2+1) ∣ (X^2+X+2).comp (X+1), (X^2+X+2) ∣ (X^2+1).comp (X+2) and (X^2+X+2) ∣ (X+1).comp (X+2) − X (`test_presentationChange_F9`, computation); Over ZMod 7 with f = X^3+X^2+6X+5, g = X^3−2: g ∣ f.comp (X^2+X+2), f ∣ g.comp (X^2+2X+2), f ∣ (X^2+X+2).comp (X^2+2X+2) − X (`test_presentationChange_conrad_F343`, computation).

Uses: FF.0 acceptance (roadmap stage text): 'Field isomorphisms include inverse maps': this node is the checked form; ComputationalNumberTheory:CN.0: comparison maps between two presentations of the same field; Conrad, Finite fields, Remark after Theorem 2.7: finite fields of the same size are isomorphic, but not canonically; the certificate fixes the isomorphism.

Construction: The forward map is embeddingOfRoot b and the backward map embeddingOfRoot c (FiniteFieldsAndCharacterSums:FF.0/presentation-embedding-from-root). Their composite F[X]/(f) → F[X]/(g) → F[X]/(f) sends [X]_f to [b.comp c]_f = [X]_f by the third congruence; an F-algebra endomorphism of AdjoinRoot f is determined by the image of root f (AdjoinRoot.algHom_ext), so the composite is the identity. Hence embeddingOfRoot b is injective with a left inverse; both fields have q^n elements, so it is bijective and embeddingOfRoot c is its two-sided inverse; in particular [c.comp b]_g = [Y]_g, i.e. g ∣ c.comp b − X. Existence: f has a root [b]_g in the field F[X]/(g) (equal degrees: FiniteField.nonempty_algHom_iff_finrank_dvd); the resulting embedding is an isomorphism by cardinality, and c is the representative of degree < n of the preimage of [Y]_g. Composition: the composite of presentationChange (b, c) from f to g and (b', c') from g to h sends [X]_f to [b.comp b']_h, and (b.comp b' mod h, c'.comp c mod f) is a certificate from f to h.

Acceptance: Conrad, Example 3.8, completed: over F_7 with f = X^3 + X^2 + 6X + 5, g = X^3 − 2, the pair b = X^2 + X + 2, c = X^2 + 2X + 2 is a certificate (recomputed modulo 7: g(c) ≡ 0 mod f and b(c) ≡ X mod f). Over F_7 with f = g = X^3 − 2, the pair (2X, 2X) consists of roots but is not a certificate: (2X)∘(2X) = 4X ≢ X; the inverse of X ↦ 2X is X ↦ 4X. Over F_3: X + 1 is a root of X^2 + X + 2 modulo X^2 + 1 and X + 2 is a root of X^2 + 1 modulo X^2 + X + 2, mutually inverse.

Rests on: nodes `presentation-embedding-from-root`, `certified-presentation-of-a-finite-field`; library `FiniteField.nonempty_algHom_iff_finrank_dvd`, `AdjoinRoot.liftAlgHom`, `AdjoinRoot.mk_eq_mk`, `AdjoinRoot.algHom_ext`.

Sources: Shoup, Theorem 19.14, printed pp. 515–516; Conrad, Finite fields, Example 3.8, p. 8; Conrad, Finite fields, Executive summary, p. 1.

### 3. Tensor products of finite fields

**Lemma `factorization-over-extension`** — Factorisation of an irreducible polynomial over an extension. Let F be a finite field with q elements, f ∈ F[X] monic irreducible of degree k, and E ⊇ F a finite field extension of degree ℓ. Then over E, f factors as the product of d := gcd(k, ℓ) distinct monic irreducible polynomials, each of degree k/d.

Hypotheses and conventions: F finite, E a finite field with Algebra F E, ℓ = finrank F E. f monic irreducible over F.

Proof: Let Ω be a finite field containing E and a root α of f (for instance a splitting field of f over E). The roots of f in Ω are α^(q^i), i ∈ ℤ/k, pairwise distinct (TauCeti.FiniteField.orbit_eq_rootSet_minpoly, TauCeti.FiniteField.natCard_orbit_eq_natDegree_minpoly, TauCeti.FiniteField.mem_orbit_iff_exists_pow_card_pow with base F). E has q^ℓ elements, so its Frobenius is the q^ℓ-power map; applying the same lemmas with base E, two roots have the same minimal polynomial over E iff they lie in one orbit of x ↦ x^(q^ℓ) (TauCeti.FiniteField.mem_orbit_iff_minpoly_eq). Under i ↦ α^(q^i), the q^ℓ-power map acts on ℤ/k as i ↦ i + ℓ; its orbits are the cosets of the subgroup generated by ℓ in ℤ/k, which has order k/gcd(k, ℓ); so there are d = gcd(k, ℓ) orbits of size k/d. Each orbit is the root set of one monic irreducible factor of f over E (map_minpoly_eq_prod_orbit over E), and f is squarefree (its k roots are distinct), so f = ∏ of the d minimal polynomials over E, each of degree k/d.

Acceptance: X^2 + 1 over F_3 splits over F_9 into two linear factors (k = ℓ = 2, d = 2). X^3 + X + 1 over F_2 stays irreducible over F_4 (gcd(3, 2) = 1). X^4 + X + 1 over F_2 splits over F_4 into two irreducible quadratics (d = 2, degree 2).

Rests on: library `TauCeti.FiniteField.orbit_eq_rootSet_minpoly`, `TauCeti.FiniteField.natCard_orbit_eq_natDegree_minpoly`, `TauCeti.FiniteField.mem_orbit_iff_exists_pow_card_pow`, `TauCeti.FiniteField.mem_orbit_iff_minpoly_eq`, `TauCeti.FiniteField.map_minpoly_eq_prod_orbit`, `FiniteField.pow_card`.

Sources: Shoup, Exercise 19.9, printed p. 521.

**Construction `tensor-product-of-finite-fields`** (planet: *Tensor product of finite fields*) — Tensor product of finite fields. Let F be a finite field with q elements, K and L finite field extensions of F of degrees m and n, d := gcd(m, n), and M a field extension of F of degree lcm(m, n) with F-embeddings ι_K : K → M and ι_L : L → M (they exist, FiniteField.nonempty_algHom_iff_finrank_dvd). Let φ(x) = x^q be the Frobenius of M over F. The F-algebra map Φ : K ⊗_F L → M^d = (Fin d → M), Φ(a ⊗ b) = (φ^i(ι_K a) · ι_L b)_{0 ≤ i < d}, is an isomorphism of F-algebras (tensorProductEquiv). In particular F_(q^m) ⊗_(F_q) F_(q^n) ≅ F_(q^lcm(m,n))^gcd(m,n), K ⊗_F L is a field iff gcd(m, n) = 1, and K ⊗_F L has exactly gcd(m, n) maximal ideals.

Hypotheses and conventions: F finite; K, L, M finite fields that are F-algebras; finrank F M = lcm(m, n). Pinned convention: the i-th coordinate twists the K-factor by φ^i and leaves the L-factor fixed; Φ is L-linear for L acting on each coordinate through ι_L.

API: `tensorProductEquiv` (constructor: Given ι_K, ι_L and finrank F M = lcm(m, n): the isomorphism K ⊗[F] L ≃ₐ[F] (Fin gcd(m, n) → M)); `tensorProductEquiv_tmul` (simp: tensorProductEquiv (a ⊗ b) i = (ι_K a)^(q^i) · ι_L b); `finrank_tensorProduct_fields` (other: finrank F (K ⊗[F] L) = m · n); `isField_tensorProduct_iff` (characterisation: K ⊗[F] L is a field iff gcd(m, n) = 1); `exists_tensorProductEquiv` (other: For every M of degree lcm(m, n) over F there is an F-algebra isomorphism K ⊗[F] L ≃ₐ[F] (Fin gcd(m, n) → M)); `card_maximalIdeals_tensorProduct` (other: K ⊗[F] L has exactly gcd(m, n) maximal ideals).

Unit tests: GaloisField 2 2 ⊗[ZMod 2] GaloisField 2 2 ≃ₐ[ZMod 2] (Fin 2 → GaloisField 2 2) exists (`test_tensorProduct_F4_F4`, computation); GaloisField 2 2 ⊗[ZMod 2] GaloisField 2 3 is a field (`test_tensorProduct_F4_F8_isField`, computation); K ⊗[F] F ≃ₐ[F] (Fin gcd(m, 1) → K), i.e. K (`test_tensorProduct_base`, degenerate); GaloisField 2 2 ⊗[ZMod 2] GaloisField 2 2 is not a field (a definition claiming the tensor product of fields is a field fails) (`test_tensorProduct_not_field`, non-example); finrank F (K ⊗[F] L) = gcd(m, n) · lcm(m, n), agreeing with Mathlib's Module.finrank_tensorProduct (`test_tensorProduct_finrank`, compatibility).

Uses: FF.0 roadmap target (RS-03 keeps it): 'tensor-product descriptions': F_(q^m) ⊗ F_(q^n) ≅ F_(q^lcm)^gcd; Conrad, Tensor products II, §7: tensor products of fields are computed by factoring a defining polynomial over the other field; FiniteFieldsAndCharacterSums:FF.3 (point counting over extensions): the F_(q^n)-points of an F_q-scheme are computed through K ⊗ F_(q^n), which splits by this node; ComputationalNumberTheory:CN.0: the explicit Φ and its inverse from the CRT idempotents are the comparison map between the two presentations of a tensor product.

Construction: Each coordinate Φ_i is an F-algebra homomorphism K ⊗_F L → M (Algebra.TensorProduct.productMap of φ^i ∘ ι_K and ι_L). Each Φ_i is surjective: its image is a subfield of M containing subfields of orders q^m and q^n, hence of order q^c with m ∣ c and n ∣ c (Shoup, Theorem 19.13), so of order q^lcm(m,n) = #M. The kernels are pairwise distinct: if ker Φ_i = ker Φ_j, then Φ_j = τ ∘ Φ_i for an F-automorphism τ = φ^t of M (Gal(M/F) is generated by φ: FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow); on 1 ⊗ L this gives φ^t ∘ ι_L = ι_L, so n ∣ t (φ^t fixes the degree-n subfield exactly when n ∣ t); on K ⊗ 1 it gives φ^j ∘ ι_K = φ^(t+i) ∘ ι_K, so m ∣ t + i − j; hence d ∣ i − j and i = j for 0 ≤ i, j < d. The kernels are maximal (quotients are the field M) and pairwise distinct, hence pairwise coprime (Ideal.isCoprime_of_isMaximal); the Chinese remainder theorem (Ideal.quotientInfRingEquivPiQuotient) shows Φ is surjective onto ∏_i M. Dimensions: finrank F (K ⊗_F L) = mn (Module.finrank_tensorProduct) = d · lcm(m, n) = finrank F (Fin d → M) (Module.finrank_pi), so the surjection Φ is bijective. Field criterion: K ⊗_F L ≅ M^d is a field iff d = 1. Maximal ideals of M^d are the d coordinate kernels. Second description (Conrad, Tensor products II, Example 7.17; Shoup, Exercise 19.9): K = F[X]/(f) with f irreducible of degree m gives K ⊗_F L ≅ L[X]/(f) (AdjoinRoot.tensorAlgEquiv), and f splits over L into d distinct irreducibles of degree m/d (FiniteFieldsAndCharacterSums:FF.0/factorization-over-extension), so the Chinese remainder theorem gives L[X]/(f) ≅ ∏ L[X]/(f_j), each a field of degree (m/d)·n = lcm(m, n) over F.

Acceptance: F_4 ⊗_(F_2) F_4 ≅ F_4 × F_4 (m = n = 2). F_4 ⊗_(F_2) F_8 ≅ F_64 is a field (gcd(2, 3) = 1). K ⊗_F F ≅ K (n = 1). F_4 ⊗_(F_2) F_4 is not a field: (ω ⊗ 1 − 1 ⊗ ω)(ω ⊗ 1 − 1 ⊗ ω^2) = 0 with both factors nonzero.

Rests on: nodes `factorization-over-extension`; library `Algebra.TensorProduct.productMap`, `AdjoinRoot.tensorAlgEquiv`, `FiniteField.nonempty_algHom_iff_finrank_dvd`, `FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow`, `Ideal.isCoprime_of_isMaximal`, `Ideal.quotientInfRingEquivPiQuotient`, `Module.finrank_tensorProduct`, `Module.finrank_pi`.

Sources: Conrad, Tensor products II, Example 7.17, pp. 37–38; Conrad, Tensor products II, Example 7.18, p. 38; Shoup, Exercise 19.9, printed p. 521.

### 4. Normal elements and the Frobenius normal basis

**Definition `frobenius-minimal-polynomial-of-an-element`** — The minimal polynomial of an element under the Frobenius. Let K be a finite field with q elements, L a finite field extension of degree n and σ : L → L, x ↦ x^q, the Frobenius, viewed as a K-linear endomorphism (FiniteField.frobeniusAlgHom K L). For α ∈ L, the minimal polynomial of α under σ, frobeniusMinpoly α ∈ K[X], is the monic generator of the ideal {g ∈ K[X] : g(σ)(α) = 0}, where g(σ)(α) = Σ_i g_i σ^i(α) (the annihilator of α in the K[X]-module L with X acting as σ, Mathlib's Module.AEval'). It divides X^n − 1, the minimal polynomial of σ (FiniteField.minpoly_frobeniusAlgHom), and its degree is the dimension of the span of the conjugates α, σ(α), σ^2(α), …

Hypotheses and conventions: K finite with q elements, L finite over K of degree n = finrank K L. Not the minimal polynomial of α: for ω ∈ F_4 \ F_2, minpoly F_2 ω = X^2 + X + 1 while frobeniusMinpoly ω = X^2 − 1 = X^2 + 1.

API: `frobeniusMinpoly` (constructor: The monic generator of {g ∈ K[X] : g(σ)(α) = 0}); `frobeniusMinpoly_monic` (other: frobeniusMinpoly α is monic); `aeval_frobeniusMinpoly` (simp: (frobeniusMinpoly α)(σ)(α) = 0); `frobeniusMinpoly_dvd_iff` (characterisation: frobeniusMinpoly α ∣ g ↔ g(σ)(α) = 0); `frobeniusMinpoly_dvd_X_pow_sub_one` (relation: frobeniusMinpoly α ∣ X^n − 1); `natDegree_frobeniusMinpoly` (characterisation: deg frobeniusMinpoly α = dim_K span{σ^i(α) : i ∈ ℕ}); `frobeniusMinpoly_zero` (simp: frobeniusMinpoly 0 = 1); `frobeniusMinpoly_algebraMap` (simp: For a ∈ K nonzero, frobeniusMinpoly a = X − 1).

Unit tests: frobeniusMinpoly (1 : L) = X − 1 (`test_frobeniusMinpoly_one`, computation); frobeniusMinpoly (0 : L) = 1 (`test_frobeniusMinpoly_zero`, degenerate); For ω ∈ GaloisField 2 2 with ω^2 + ω + 1 = 0: frobeniusMinpoly ω = X^2 − 1 over ZMod 2 (`test_frobeniusMinpoly_F4`, computation); For the same ω: frobeniusMinpoly ω ≠ minpoly (ZMod 2) ω (X^2 − 1 versus X^2 + X + 1) (`test_frobeniusMinpoly_ne_minpoly`, non-example).

Uses: Shoup, Exercise 19.14(b)–(c): α is normal exactly when its minimal polynomial under σ is X^ℓ − 1; FiniteFieldsAndCharacterSums:FF.0/normal-element-criterion: the normal-element test is stated on frobeniusMinpoly; Mathlib's proof of IsGalois.normalBasis for finite fields (exists_linearIndependent_algEquiv_apply_of_finite): chooses x whose annihilator in K[X] equals that of L, i.e. frobeniusMinpoly x = X^n − 1.

Construction: The ideal {g : g(σ)(α) = 0} is the kernel of g ↦ g(σ)(α), an ideal of the principal ideal domain K[X]; it contains X^n − 1 since σ^n = id (FiniteField.orderOf_frobeniusAlgHom, FiniteField.minpoly_frobeniusAlgHom), so it is nonzero and has a unique monic generator (Submodule.IsPrincipal.generator normalised). Degree: K[X]/(frobeniusMinpoly α) ≅ the cyclic K[X]-submodule generated by α, whose K-dimension is the degree (Shoup §18.6: α, τ(α), …, τ^(m−1)(α) form a basis of ⟨α⟩_τ). Values: frobeniusMinpoly 0 = 1; for a ∈ K nonzero, σ(a) = a and a ≠ 0, so frobeniusMinpoly a = X − 1.

Acceptance: frobeniusMinpoly 1 = X − 1 and frobeniusMinpoly 0 = 1. In F_4 over F_2, frobeniusMinpoly ω = X^2 − 1 for ω^2 + ω + 1 = 0.

Rests on: library `FiniteField.frobeniusAlgHom`, `FiniteField.minpoly_frobeniusAlgHom`, `FiniteField.orderOf_frobeniusAlgHom`, `Module.AEval'`, `Submodule.IsPrincipal.generator`, `Submodule.span`.

Sources: Shoup, §18.6, printed p. 504; Shoup, Exercise 19.14(a), printed p. 521.

**Theorem `normal-element-criterion`** — Normal elements: the Frobenius criterion and its certificate form. Let K be a finite field, L a finite extension of degree n with Frobenius σ, and α ∈ L. The following are equivalent: (a) α is a normal element, i.e. α, σ(α), …, σ^(n−1)(α) is a K-basis of L; (b) frobeniusMinpoly α = X^n − 1; (c) for every monic irreducible factor h of X^n − 1 in K[X], ((X^n − 1)/h)(σ)(α) ≠ 0. Normal elements exist.

Hypotheses and conventions: K finite, L finite over K of degree n ≥ 1. (c) is a finite certificate: one evaluation of a known polynomial at σ for each irreducible factor h of X^n − 1.

Proof: (a) ⇒ (b): if the n conjugates are linearly independent, no nonzero polynomial of degree < n kills α, so frobeniusMinpoly α has degree ≥ n; it divides X^n − 1 (degree n) and is monic, hence equals X^n − 1. (b) ⇒ (a): the cyclic submodule generated by α has K-dimension deg frobeniusMinpoly α = n (natDegree_frobeniusMinpoly), so α, …, σ^(n−1)(α) span L and are n vectors in an n-dimensional space, hence a basis (linearIndependent_iff_card_eq_finrank_span). (b) ⇔ (c): write φ := frobeniusMinpoly α, a monic divisor of X^n − 1. If φ ≠ X^n − 1, some irreducible factor h of (X^n − 1)/φ exists and φ ∣ (X^n − 1)/h, so ((X^n − 1)/h)(σ)(α) = 0 (frobeniusMinpoly_dvd_iff). Conversely if φ = X^n − 1 then φ ∤ (X^n − 1)/h, so the evaluation is nonzero (Shoup, Theorem 18.11: g ⊙ α has minimal polynomial φ/gcd(φ, g)). Existence (Shoup, Exercise 19.14(b), Theorem 18.12): some β has minimal polynomial under σ equal to the minimal polynomial of σ, which is X^n − 1 (FiniteField.minpoly_frobeniusAlgHom); Mathlib's exists_linearIndependent_algEquiv_apply gives the same through the Galois orbit.

Acceptance: In F_4 over F_2, ω is normal ({ω, ω^2} is a basis) while 1 is not ({1, 1} is dependent). Over K itself (n = 1) every nonzero element is normal. Mathlib's IsGalois.normalBasis K L 1 satisfies (b).

Rests on: nodes `frobenius-minimal-polynomial-of-an-element`; library `FiniteField.minpoly_frobeniusAlgHom`, `linearIndependent_iff_card_eq_finrank_span`, `exists_linearIndependent_algEquiv_apply`.

Sources: Shoup, Exercise 19.14(b)–(c), printed p. 521; Shoup, Theorem 18.11 and proof of Theorem 18.12, printed p. 504–505.

**Construction `frobenius-normal-basis`** (planet: *Frobenius normal basis*) — The Frobenius normal basis and normal-basis coordinates. Let K be a finite field with q elements, L a finite extension of degree n with Frobenius σ, and α ∈ L a normal element (frobeniusMinpoly α = X^n − 1). The Frobenius normal basis normalBasisOf α : Basis (Fin n) K L is i ↦ σ^i(α). In its coordinates the Frobenius is the cyclic shift: the coordinate of x^q at i is the coordinate of x at i − 1 (indices mod n), and Tr_{L/K}(x) = (Σ_i x_i) · Tr_{L/K}(α). It agrees with Mathlib's Galois-indexed normal basis IsGalois.normalBasis after reindexing Fin n ≃ Gal(L/K), i ↦ σ^i, and IsGalois.normalBasis K L 1 is a normal element.

Hypotheses and conventions: α normal (FiniteFieldsAndCharacterSums:FF.0/normal-element-criterion). Pinned indexing: position i carries σ^i(α) = α^(q^i), i ∈ Fin n; the shift is finRotate.

API: `normalBasisOf` (constructor: For α normal: the basis Fin n → L, i ↦ σ^i(α)); `normalBasisOf_apply` (simp: normalBasisOf α i = σ^i(α)); `repr_frobenius` (characterisation: (normalBasisOf α).repr (x^q) i = (normalBasisOf α).repr x (finRotate⁻¹ i): the Frobenius is the cyclic shift); `trace_eq_sum_repr` (relation: Tr_{L/K}(x) = (Σ_i repr x i) · Tr_{L/K}(α)); `linearIndependent_frobenius_iff` (characterisation: The conjugates σ^i(α), i < n, are linearly independent iff frobeniusMinpoly α = X^n − 1); `frobeniusMinpoly_eq_iff_forall_irreducible_factor` (characterisation: The certificate form of normality); `exists_frobeniusMinpoly_eq` (other: Normal elements exist); `frobeniusMinpoly_normalBasis_one` (compatibility: IsGalois.normalBasis K L 1 is normal: its Frobenius minimal polynomial is X^n − 1).

Unit tests: For ω ∈ GaloisField 2 2 with ω^2 + ω + 1 = 0, the family (ω, ω^2) is linearly independent over ZMod 2 (`test_normalBasisOf_F4`, computation); Over K itself, every nonzero a has frobeniusMinpoly a = X^1 − 1 (`test_normalBasisOf_degree_one`, degenerate); frobeniusMinpoly (1 : GaloisField 2 2) ≠ X^2 − 1 over ZMod 2: 1 is not normal (a test 'α ≠ 0' would wrongly accept it) (`test_normalBasisOf_one_not_normal`, non-example); IsGalois.normalBasis K L σ = σ (IsGalois.normalBasis K L 1): Mathlib's normal basis is a Galois orbit, matching normalBasisOf after reindexing (`test_normalBasisOf_mathlib`, compatibility).

Uses: Shoup §20 (input models) and the FF.0 target 'normal bases': the normal-basis model of F_(q^n), in which the q-th power map is a coordinate rotation; ComputationalNumberTheory:CN.0: a normal-basis presentation is one of the exact finite-field presentations CN.0 compares; FiniteFieldsAndCharacterSums:FF.4 (codes and sequences): trace computations Tr(x) = (Σ x_i)Tr(α) in normal coordinates; Mathlib IsGalois.normalBasis: the Galois-indexed orbit basis, compared by repr and reindexing.

Construction: The family i ↦ σ^i(α) is linearly independent of size n = finrank K L (normal-element criterion (b) ⇒ (a)); basisOfLinearIndependentOfCardEqFinrank makes it a basis. Shift: σ(Σ_i x_i σ^i(α)) = Σ_i x_i σ^(i+1)(α) (σ is K-linear and σ^n = id: FiniteField.orderOf_frobeniusAlgHom), so the coordinates are rotated. Trace: Tr(σ^i(α)) = Tr(α) (the trace is Galois invariant: FiniteField.algebraMap_trace_eq_sum_pow reindexed), and Tr is K-linear. Comparison: Gal(L/K) is cyclic generated by σ (FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow), so i ↦ σ^i is a bijection Fin n ≃ Gal(L/K) along which normalBasisOf α is an orbit basis in Mathlib's sense (IsGalois.normalBasis_apply); conversely IsGalois.normalBasis K L 1 has linearly independent Frobenius conjugates, i.e. it is normal.

Acceptance: In F_4 over F_2 with ω^2 + ω + 1 = 0: the basis (ω, ω^2), with the Frobenius swapping the two coordinates; Tr(ω) = 1 so Tr(x) = x_0 + x_1. n = 1: every nonzero a ∈ K gives the basis (a) and the shift is the identity.

Rests on: nodes `normal-element-criterion`; library `basisOfLinearIndependentOfCardEqFinrank`, `FiniteField.orderOf_frobeniusAlgHom`, `FiniteField.algebraMap_trace_eq_sum_pow`, `FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow`, `IsGalois.normalBasis`, `IsGalois.normalBasis_apply`.

Sources: Shoup, Exercise 19.14(c), printed p. 521; Conrad, Finite fields, Theorem 5.7, p. 11.

### Dependencies

- Inside the roadmap: `FF.0` feeds `FF.1` (the norm and trace lifts, the canonical character of an extension and the
  Hasse–Davenport relation work with extensions presented here) and `FF.3` (Rabin's certificate and the Frobenius
  residue are the irreducibility witnesses and the first step of distinct-degree factorisation and Berlekamp's
  algorithm).
- Other roadmaps: `ComputationalNumberTheory:CN.0` consumes the presentations, the comparison isomorphisms and the
  certificates (RS-03 link `FF.0 → CN.0`, forwarded to `CN.1`, `CN.4` and `EffectiveDiophantineMethods:ED.0`). The
  stage input `ClassicalArithmeticCompletion:CA.3` is not needed by any node of this layer: polynomial division, gcd
  and Bézout cofactors come from Mathlib.
- Libraries: Mathlib throughout; Tau Ceti's Frobenius-orbit and fixed-subfield lemmas.

### Acceptance tests of the layer

- Field isomorphisms include inverse maps: `CertifiedPresentation.equiv` with `equiv_symm_apply` (power-basis
  coordinates), and `presentationChange` from a checked pair `(b, c)`; for `F_7[X]/(X^3 + X^2 + 6X + 5)` and
  `F_7[Y]/(Y^3 − 2)` the pair `b = Y^2 + Y + 2`, `c = X^2 + 2X + 2` is a certificate, while `(2X, 2X)` between two
  copies of `F_7[X]/(X^3 − 2)` consists of roots but is not one.
- The absolute and relative Frobenius exponents are explicit (`x ↦ x^p` and `x ↦ x^(#K)`), and in a presentation the
  image of the generator is the first Frobenius residue (`CertifiedPresentation.root_pow_card`).
- Trace targets are explicit: `Tr_{K/F}(α) = −nextCoeff f` and `N_{K/F}(α) = (−1)^n f(0)` for the generator of a
  presentation.
- Rabin's test accepts `X^2 + X + 1` over `F_2` with the cofactors `(1, 0)`, rejects `(X^2 + X + 1)^2` and
  `(X^2 + X + 1)(X^3 + X + 1)` (the latter passes the coprimality check), and rejects `X^4 + 1` over every `F_p`.
- `F_4 ⊗_(F_2) F_4 ≅ F_4 × F_4` is not a field; `F_4 ⊗_(F_2) F_8` is a field.
- In `F_4`, `ω` is normal over `F_2` (Frobenius minimal polynomial `X^2 − 1`) and `1` is not.

---

## FF.1 Characters and elementary sums

This layer owns the finite-field character and Gauss/Jacobi normalisation and comparison interfaces (RS-03: formerly
also `ClassicalArithmeticCompletion:CA.1`): trace-based additive characters, norm and trace lifts, the trivial-character
and sign conventions, transport of values, and the Gauss and Jacobi sum identities that the pinned libraries lack — the
Hasse–Davenport relations, Stickelberger's congruence and the prime factorisation of Gauss and Jacobi sums. It also
holds the harmonic analysis on the completion `F_q((1/T))` of `F_q(T)` at infinity that Bary-Soroker, Koukoulopoulos
and Kozma's *Irreducibility of random polynomials: general measures* routes here (items 8, 13, 14, 15, 20, 21 and 25).
The built identities (row orthogonality, the Gauss norm identity, quadratic Gauss sums, the Gauss–Jacobi relations and
the trivial-character values) are imported, and the normalised Fourier transform on arbitrary finite abelian groups
comes from `AdditiveCombinatorics:AC.0`.

Stickelberger's congruence and the prime factorisation of Gauss sums are owned here: they are statements about Gauss
sums of characters of finite fields, no other layer plans them, and public proofs exist (Conrad 1995; Katre 2000).
`FF.1/stickelberger-relation` is the relation `(Φ(P)) = P^γ` that `ClassicalArithmeticCompletion:CA.1` uses for
Eisenstein reciprocity. The class-group annihilation form of Stickelberger's theorem, and the Stickelberger elements
of Iwasawa theory, are not part of this layer.

### Conventions

- Characters are Mathlib's: `AddChar F R` and `MulChar F R`. Every multiplicative character vanishes on non-units, so
  `χ(0) = 0` also for the trivial character `1`. `gaussSum χ ψ = Σ_{x ∈ F} χ(x)ψ(x)` and
  `jacobiSum χ φ = Σ_x χ(x)φ(1 − x)` are unnormalised; hence `gaussSum 1 ψ = −1` (`ψ ≠ 1`), `jacobiSum 1 1 = q − 2`,
  `jacobiSum 1 χ = −1` (`χ ≠ 1`).
- The classical convention `ε(0) = 1` (Ireland–Rosen, Berndt–Evans–Williams, Adhikari, Kowalski's Jacobi sums) is
  `classicalValue`, with `classicalGaussSum` and `classicalJacobiSum`; the sign-normalised sums of Katre and Conrad
  (1995) are `normalizedGaussSum = −gaussSum` and `(−1)^(r−1)` times the Jacobi sum of `r` characters. Every
  statement below names its convention.
- The canonical additive character of `F` is `ψ_F(x) = exp(2πi·Tr(x)/p)`, `Tr` the absolute trace to `ZMod p`
  (`canonicalAddChar`); with values in another ring it is the trace character `x ↦ ζ^(val Tr x)` of a chosen `p`-th
  root of unity `ζ` (`traceAddChar`). Lifts to an extension `E/F` are `χ ∘ N_{E/F}` and `ψ ∘ Tr_{E/F}`.
- Fourier coefficients: `AC.0`'s normalised transform `f̂(φ) = (1/|G|) Σ f(x)·conj φ(x)`; Gauss sums are `q` times
  normalised coefficients. Measures on `ℤ` use `μ̂(θ) = Σ μ(a)e(aθ)`, `e(x) = exp(2πix)`, the conjugate of the kernel
  of Mathlib's `ZMod.dft`.
- `F((1/T))` is `LaurentSeries F` in the variable `u = 1/T`; `T ↦ u^(−1)`; the residue `res X` is the coefficient of
  `T^(−1)`, i.e. of `u^(+1)`; the residue character is `ψ_∞(X) = val(Tr(res X))/p mod 1`.
- Stickelberger's setting: `p` prime, `q = p^f`, `L = Q(ζ_(p(q−1)))`, `𝔓` a prime of `𝓞_L` above `p` with residue
  field `F_q`, `ω = ω_𝔓` its Teichmüller character, `ψ = ζ_p^Tr`; `s(a)` is the base-`p` digit sum of `a`. All
  primes `p` are allowed (Katre states `p` odd; no step uses it).

### What is already built (consume; never restate)

Cited from the pinned Mathlib: `AddChar`, `AddChar.IsPrimitive`, `AddChar.FiniteField.primitiveChar`,
`AddChar.sum_eq_ite`, `AddChar.sum_eq_zero_of_ne_one`, `AddChar.sum_mulShift`, `AddChar.to_mulShift_inj_of_isPrimitive`,
`AddChar.card_eq`, `ZMod.stdAddChar`; `MulChar`, `MulChar.trivial`, `MulChar.sum_eq_zero_of_ne_one`,
`MulChar.ringHomComp`; `gaussSum`, `gaussSum_mulShift_eq` (the shift identity), `star_gaussSum_eq`,
`gaussSum_one_left`, `gaussSum_one_right`, `gaussSum_one_one`, `gaussSum_mul_gaussSum_eq_card`, `gaussSum_sq`,
`gaussSum_frob`; `jacobiSum`, `jacobiSum_comm`, `jacobiSum_ringHomComp`, `jacobiSum_trivial_trivial`,
`jacobiSum_one_nontrivial`, `jacobiSum_nontrivial_inv`, `jacobiSum_mul_nontrivial`,
`jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `jacobiSum_mul_jacobiSum_inv`, `gaussSum_pow_eq_prod_jacobiSum`;
`sum_hom_units_eq_zero`. Cited from the pinned Tau Ceti: the column relation `CommGroup.sum_monoidHom_apply_eq_ite`,
`CommGroup.sum_monoidHom_apply_eq_zero_of_ne_one` and `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`, and the
Frobenius-orbit lemma `TauCeti.FiniteField.orbit_eq_rootSet_minpoly`.

### 1. Additive characters, lifts and conventions

The comparison interfaces requested by `ClassicalArithmeticCompletion:CA.1` are `trivial-character-conventions`, `gauss-sum-transport` (with the shift identity) and `canonical-additive-character`.

**Definition `canonical-additive-character`** (planet: *Canonical additive character*) — The canonical additive character of a finite field. Let F be a finite field of characteristic p, with its ZMod p-algebra structure, and Tr = Algebra.trace (ZMod p) F : F → ZMod p the absolute trace. For a commutative ring R and ζ ∈ R with ζ^p = 1, the trace character with root ζ is ψ_{F,ζ} := (AddChar.zmodChar p ζ) ∘ Tr, x ↦ ζ^(val(Tr x)) (traceAddChar F p ζ). The canonical additive character of F is the complex-valued ψ_F := ZMod.stdAddChar ∘ Tr (canonicalAddChar F p), ψ_F(x) = exp(2πi·t/p) for any integer t with t ≡ Tr(x) (mod p); it is ψ_{F,ζ} with ζ = e^(2πi/p). Pinned conventions: the trace goes to the prime field ZMod p (absolute trace), the root is e^(+2πi/p), and the character is x ↦ ψ(x), not its inverse. Every additive character of F is x ↦ ψ_F(ax) for a unique a ∈ F (FiniteFieldsAndCharacterSums:FF.1/additive-characters-are-shifts). Mathlib's AddChar.FiniteField.primitiveChar F F' is the trace character with root the chosen primitive p-th root of unity of CyclotomicField p F'; composed with any embedding CyclotomicField p ℂ → ℂ it becomes x ↦ ψ_F(ax) for some a ∈ F_p^×.

Hypotheses and conventions: F a finite field, p = ringChar F prime, [Algebra (ZMod p) F] (the unique such structure). For traceAddChar: ζ^p = 1; it is primitive iff ζ ≠ 1 when R is a domain (then ζ is a primitive p-th root of unity). canonicalAddChar takes values in ℂ; the general version takes values in any ring containing μ_p.

API: `traceAddChar` (constructor: traceAddChar F p ζ hζ : AddChar F R, x ↦ ζ^(val(Tr x)), for ζ^p = 1); `traceAddChar_apply` (simp: traceAddChar F p ζ hζ x = ζ^((Algebra.trace (ZMod p) F x).val)); `canonicalAddChar` (constructor: canonicalAddChar F p := ZMod.stdAddChar ∘ Tr : AddChar F ℂ); `canonicalAddChar_apply` (simp: canonicalAddChar F p x = ZMod.stdAddChar (Algebra.trace (ZMod p) F x)); `canonicalAddChar_eq_exp` (characterisation: For t ∈ ℤ with (t : ZMod p) = Tr x: canonicalAddChar F p x = exp(2πi t/p)); `isPrimitive_traceAddChar` (other: For R a domain and ζ a primitive p-th root of unity, traceAddChar F p ζ is primitive); `isPrimitive_canonicalAddChar` (other: canonicalAddChar F p is primitive); `exists_primitiveChar_eq_traceAddChar` (compatibility: Mathlib's (AddChar.FiniteField.primitiveChar F F' h).char is x ↦ ζ^(val Tr x) for a primitive p-th root of unity ζ of the cyclotomic field); `exists_mulShift_eq_comp_primitiveChar` (compatibility: For ι : CyclotomicField _ ℂ →+* ℂ: ι ∘ primitiveChar = (canonicalAddChar F p).mulShift a for some a ≠ 0); `canonicalAddChar_frobenius` (relation: canonicalAddChar F p (x^p) = canonicalAddChar F p x); `canonicalAddChar_neg` (simp: canonicalAddChar F p (−x) = conj (canonicalAddChar F p x)); `canonicalAddChar_zmod` (example: canonicalAddChar (ZMod p) p = ZMod.stdAddChar).

Unit tests: canonicalAddChar (ZMod p) p = ZMod.stdAddChar (N := p) (`test_canonicalAddChar_zmod`, compatibility); For ω ∈ GaloisField 2 2 with ω^2 + ω + 1 = 0: canonicalAddChar (GaloisField 2 2) 2 ω = −1 (`test_canonicalAddChar_F4`, computation); canonicalAddChar (GaloisField 2 2) 2 1 = 1 (Tr(1) = 0 in characteristic 2); a definition reading off a coordinate instead of the trace would give −1 (`test_canonicalAddChar_one_F4`, computation); canonicalAddChar F p ≠ 1; the zero map or the norm in place of the trace would fail this (`test_canonicalAddChar_nontrivial`, non-example); Σ_{x ∈ F} canonicalAddChar F p x = 0 (`test_canonicalAddChar_sum`, characterisation).

Uses: Kowalski, Proposition 1.13 (p. 14): every additive character of F_q is ψ_a(x) = e(Tr(ax)/p); Conrad, Gauss and Jacobi sums, Definition 2.1: Gauss sums of finite fields are taken with this character; ClassicalArithmeticCompletion:CA.1 (cubic-gauss-sum-cube, eisenstein-reciprocity): the Gauss sums of residue characters are formed with the canonical trace character (the CA.1 request); FiniteFieldsAndCharacterSums:FF.2 (Weil bounds): additive character sums Σ_x ψ(f(x)) use ψ = ψ_F or ψ_F(a·); tauceti:TauCetiRoadmap/AlgebraicCodingTheory, layer 3 (MacWilliams): the character-sum proof of MacWilliams over F uses a primitive additive character of F; FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-lifting: the canonical character of F_(q^n) is the trace lift of that of F_q; FiniteFieldsAndCharacterSums:FF.1/stickelberger-congruence: the Gauss sums of Teichmüller characters are taken with ζ_p^Tr.

Construction: Additivity: Tr is ZMod p-linear and zmodChar p ζ is an additive character of ZMod p; compose with AddChar.compAddMonoidHom. Primitivity: for a ≠ 0 there is b with Tr(ab) ≠ 0 (FiniteField.trace_to_zmod_nondegenerate), and zmodChar p ζ is injective on ZMod p when ζ is a primitive p-th root of unity (AddChar.zmodChar_primitive_of_primitive_root, AddChar.IsPrimitive.zmod_char_eq_one_iff); so x ↦ ψ(ax) is nontrivial. Over a field target, nontrivial implies primitive (AddChar.IsPrimitive.of_ne_one). ZMod.stdAddChar is primitive (ZMod.isPrimitive_stdAddChar). Comparison with Mathlib's primitiveChar: unfolding AddChar.FiniteField.primitiveChar, its character is (primitiveZModChar p F').char composed with the trace, and primitiveZModChar uses zmodChar with ζ = IsCyclotomicExtension.zeta p F' (CyclotomicField p F'), a primitive p-th root of unity (IsCyclotomicExtension.zeta_spec). Over ℂ: for a ring homomorphism ι : CyclotomicField p ℂ →+* ℂ, ι(zeta) is a primitive p-th root of unity in ℂ, hence e^(2πik/p) with k ∈ (ZMod p)^×; then ι ∘ primitiveChar sends x to e^(2πik·Tr(x)/p) = ψ_F(kx) (Tr is ZMod p-linear, k ∈ ZMod p ⊆ F). Frobenius invariance: Tr(x^p) = Tr(x), since the trace is the sum over the Galois orbit (FiniteField.algebraMap_trace_eq_sum_pow) and x ↦ x^p permutes the orbit; so ψ(x^p) = ψ(x). Conjugation: ψ_F(−x) = conj ψ_F(x) (AddChar.starComp_eq_inv, values are roots of unity). On the prime field: for c ∈ ZMod p ⊆ F, Tr(c) = [F : F_p]·c (Algebra.trace_algebraMap), so ψ_F(c) = e^(2πi·[F:F_p]c/p).

Acceptance: For F = ZMod p, Tr = id and ψ_F = ZMod.stdAddChar. In F_4 = F_2(ω) with ω^2 + ω + 1 = 0: Tr(ω) = ω + ω^2 = 1, so ψ(ω) = −1, and Tr(1) = 1 + 1 = 0, so ψ(1) = 1. Σ_{x ∈ F} ψ_F(ax) = q if a = 0 and 0 otherwise (AddChar.sum_mulShift).

Rests on: library `AddChar.zmodChar`, `AddChar.compAddMonoidHom`, `Algebra.trace`, `ZMod.stdAddChar`, `ZMod.stdAddChar_coe`, `ZMod.isPrimitive_stdAddChar`, `FiniteField.trace_to_zmod_nondegenerate`, `AddChar.zmodChar_primitive_of_primitive_root`, `AddChar.IsPrimitive.zmod_char_eq_one_iff`, `AddChar.IsPrimitive.of_ne_one`, `AddChar.FiniteField.primitiveChar`, `IsCyclotomicExtension.zeta_spec`, `FiniteField.algebraMap_trace_eq_sum_pow`, `AddChar.starComp_eq_inv`, `Algebra.trace_algebraMap`.

Sources: Kowalski, Proposition 1.13, printed p. 14; Conrad, Gauss and Jacobi sums, Definition 2.1, p. 1; Katre, §1, p. 75.

**Theorem `additive-characters-are-shifts`** — Every additive character is a multiplicative shift of a primitive one. Let F be a finite field with q elements, R a commutative ring that is a domain, and ψ : AddChar F R primitive. Then a ↦ ψ.mulShift a (x ↦ ψ(ax)) is a bijection F → AddChar F R and an isomorphism of groups (F, +) ≃ AddChar F R; in particular every additive character of F with values in R is x ↦ ψ(ax) for a unique a ∈ F, and AddChar F R has exactly q elements. For R = ℂ and ψ = ψ_F this is Kowalski's Proposition 1.13.

Hypotheses and conventions: F finite field, R a domain, ψ primitive (e.g. traceAddChar with a primitive p-th root of unity, or canonicalAddChar).

Proof: Additivity: ψ.mulShift (a + b) = ψ.mulShift a · ψ.mulShift b and ψ.mulShift 0 = 1 (AddChar.mulShift_mul style identities). Injectivity: AddChar.to_mulShift_inj_of_isPrimitive. Upper bound on #AddChar F R: every φ ∈ AddChar F R takes values in the p-th roots of unity of R (AddChar.val_mem_rootsOfUnity, p = ringChar F > 0); ψ primitive gives a nontrivial p-th root of unity, so μ_p(R) is cyclic of order p (a domain has at most p roots of X^p − 1) and AddChar F R ≅ Hom((F,+), ℤ/p) = Module.Dual (ZMod p) F (additive maps between ZMod p-modules are linear), which has p^(dim) = q elements. An injective map between finite sets of the same cardinality q is bijective. For R = ℂ, the count is Mathlib's AddChar.card_eq.

Acceptance: For F = ZMod p and R = ℂ this is Mathlib's AddChar.zmodAddEquiv (with ψ the standard character). #AddChar F ℂ = q (AddChar.card_eq). Primitivity is needed: for ψ = 1 the map a ↦ ψ.mulShift a is constant.

Rests on: nodes `canonical-additive-character`; library `AddChar.to_mulShift_inj_of_isPrimitive`, `AddChar.val_mem_rootsOfUnity`, `AddChar.card_eq`, `AddChar.zmodAddEquiv`, `AddChar.mulShift`.

Sources: Kowalski, Proposition 1.13, printed p. 14; Kowalski, (2.2), printed p. 17.

**Definition `norm-lift-of-a-multiplicative-character`** — The norm lift of a multiplicative character to an extension. Let F ⊆ E be finite fields (E an F-algebra of degree n) and χ : MulChar F R. The norm lift χ_E := χ ∘ N_{E/F} is the multiplicative character of E with χ_E(x) = χ(N_{E/F}(x)); it vanishes at 0 because N(0) = 0 is a non-unit. The map χ ↦ χ_E is an injective group homomorphism MulChar F R →* MulChar E R (injective because N_{E/F} is surjective), it preserves order and nontriviality, it is transitive in towers F ⊆ E ⊆ E' (χ_{E'} = (χ_E)_{E'}), and it commutes with transport of values (ringHomComp).

Hypotheses and conventions: F, E finite fields with Algebra F E; R a commutative ring. Pinned convention: Mathlib's MulChar, so χ_E(0) = 0 even for χ = 1; the lift of the trivial character is the trivial character of E.

API: `liftNorm` (constructor: liftNorm E χ : MulChar E R, x ↦ χ(N_{E/F} x)); `liftNorm_apply` (simp: liftNorm E χ x = χ (Algebra.norm F x)); `liftNormHom` (data: The group homomorphism MulChar F R →* MulChar E R); `liftNorm_injective` (other: χ ↦ liftNorm E χ is injective); `liftNorm_eq_one_iff` (characterisation: liftNorm E χ = 1 ↔ χ = 1); `orderOf_liftNorm` (relation: orderOf (liftNorm E χ) = orderOf χ); `liftNorm_liftNorm` (functoriality: For F ⊆ E ⊆ E' (scalar tower): liftNorm E' (liftNorm E χ) = liftNorm E' χ); `liftNorm_algebraMap` (simp: liftNorm E χ (algebraMap F E a) = χ a ^ finrank F E); `liftNorm_ringHomComp` (compatibility: liftNorm E (χ.ringHomComp f) = (liftNorm E χ).ringHomComp f).

Unit tests: liftNorm F χ = χ for the trivial extension F/F (`test_liftNorm_self`, degenerate); liftNorm E (1 : MulChar F R) = 1 (`test_liftNorm_one`, computation); liftNorm E 1 0 = 0: the lifted trivial character vanishes at 0 (Mathlib's convention) (`test_liftNorm_zero`, degenerate); For a ∈ F: liftNorm E χ (algebraMap F E a) = χ(a)^[E:F], which differs from χ(a) in general (a 'restriction' definition fails): for the quadratic character η of ZMod 3 and E = GaloisField 3 2, liftNorm E η (−1) = 1 ≠ −1 = η (−1) (`test_liftNorm_algebraMap`, non-example); For p odd and F with [F:ZMod p] finite: (quadraticChar (ZMod p)).liftNorm F = quadraticChar F (`test_liftNorm_quadratic`, compatibility).

Uses: Conrad, L-functions for Gauss and Jacobi sums, Theorem 3.1: the Hasse–Davenport relation compares G(χ_n, ψ_n) with G(χ, ψ)^n; Kowalski, Lemma 4.16 (p. 51): the characters of order dividing d of F_(q^ν) are exactly the lifts χ ∘ N of those of F_q; FiniteFieldsAndCharacterSums:FF.2: character sums over F_(q^ν) with χ ∘ N in the rationality and Weil-bound arguments; FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-lifting: the multiplicative character of the lifted Gauss sum.

Construction: Definition: for units, χ_E restricted to Eˣ is χ ∘ (Units.map N_{E/F}) (MulChar.ofUnitHom); on non-units (only 0) the value is 0 = χ(0). Multiplicativity in χ: (χφ)_E = χ_E φ_E pointwise. Injectivity and nontriviality: N_{E/F} : Eˣ → Fˣ is surjective (FiniteField.unitsMap_norm_surjective), so χ_E = φ_E forces χ = φ on Fˣ, hence χ = φ (MulChar.ext). Order: χ_E^k = 1 iff χ^k = 1 by injectivity, so orderOf χ_E = orderOf χ (Kowalski, Lemma 1.15). Towers: N_{E'/F} = N_{E/F} ∘ N_{E'/E} (Algebra.norm_norm). Values on F: for a ∈ F, N_{E/F}(a) = a^n (Algebra.norm_algebraMap), so χ_E(a) = χ(a)^n, not χ(a).

Acceptance: The lift of the trivial character is trivial; the lift along the identity extension F/F is χ. For p odd, the norm lift of the Legendre character of F_p to F is the quadratic character of F (Kowalski, remark after Lemma 1.15). For the quadratic character η of F_3 and E = F_9: η_E(−1) = η(N(−1)) = η(1) = 1, whereas η(−1) = −1.

Rests on: library `MulChar`, `MulChar.ofUnitHom`, `FiniteField.unitsMap_norm_surjective`, `Algebra.norm_norm`, `Algebra.norm_algebraMap`, `MulChar.ext`.

Sources: Kowalski, Lemma 1.15, printed p. 15; Conrad, L-functions for Gauss and Jacobi sums, §1 (2), p. 1.

**Definition `trace-lift-of-an-additive-character`** — The trace lift of an additive character to an extension. Let F ⊆ E be finite fields and ψ : AddChar F R. The trace lift ψ_E := ψ ∘ Tr_{E/F} is an additive character of E (liftTrace E ψ). The map ψ ↦ ψ_E is an injective group homomorphism (Tr_{E/F} is surjective), it preserves primitivity, it is transitive in towers, it commutes with multiplicative shifts by elements of F, and it carries canonical characters to canonical characters: (ψ_F)_E = ψ_E because Tr_{E/F_p} = Tr_{F/F_p} ∘ Tr_{E/F}.

Hypotheses and conventions: F, E finite fields with Algebra F E; R a commutative ring. For the canonical characters a scalar tower ZMod p → F → E is assumed.

API: `liftTrace` (constructor: liftTrace E ψ : AddChar E R, x ↦ ψ(Tr_{E/F} x)); `liftTrace_apply` (simp: liftTrace E ψ x = ψ (Algebra.trace F E x)); `liftTrace_injective` (other: ψ ↦ liftTrace E ψ is injective); `isPrimitive_liftTrace` (other: For R a domain: ψ ≠ 1 → (liftTrace E ψ).IsPrimitive); `liftTrace_liftTrace` (functoriality: For a scalar tower F ⊆ E ⊆ E': liftTrace E' (liftTrace E ψ) = liftTrace E' ψ); `liftTrace_canonicalAddChar` (compatibility: liftTrace E (canonicalAddChar F p) = canonicalAddChar E p); `liftTrace_mulShift` (relation: For a ∈ F: liftTrace E (ψ.mulShift a) = (liftTrace E ψ).mulShift (algebraMap F E a)); `liftTrace_algebraMap` (simp: liftTrace E ψ (algebraMap F E a) = ψ (finrank F E • a)).

Unit tests: liftTrace (GaloisField p n) (canonicalAddChar (ZMod p) p) = canonicalAddChar (GaloisField p n) p (`test_liftTrace_canonical`, compatibility); liftTrace F ψ = ψ along F/F (`test_liftTrace_self`, degenerate); ψ ≠ 1 → liftTrace E ψ ≠ 1 (`test_liftTrace_nontrivial`, characterisation); For ψ the standard character of ZMod 2 and E = GaloisField 2 2: liftTrace E ψ 1 = 1 while ψ 1 = −1, so the lift is not an extension of ψ (`test_liftTrace_one_F4`, non-example).

Uses: Conrad, L-functions for Gauss and Jacobi sums, Theorem 3.1: the additive character of the lifted Gauss sum; Conrad, Gauss and Jacobi sums, p. 19: ψ(a) = e^(2πi Tr_{F_q/F_p}(a)/p) is the trace lift of the standard character of F_p; FiniteFieldsAndCharacterSums:FF.2: exponential sums over F_(q^ν): Σ_{x ∈ F_(q^ν)} ψ(Tr f(x)).

Construction: Definition: AddChar.compAddMonoidHom with the additive map Tr_{E/F}. Injectivity: Tr_{E/F} is surjective (Algebra.trace_surjective; finite extensions of finite fields are separable), so ψ ∘ Tr = φ ∘ Tr forces ψ = φ. Primitivity: for a ∈ E nonzero, ψ_E(a·) is nontrivial because x ↦ Tr(ax) is surjective onto F and ψ ≠ 1; over a domain target nontrivial characters of a field are primitive (AddChar.IsPrimitive.of_ne_one). Canonical characters: Algebra.trace_trace gives Tr_{E/F_p} = Tr_{F/F_p} ∘ Tr_{E/F}, so (canonicalAddChar F p)_E = canonicalAddChar E p. Shift: for a ∈ F, (ψ.mulShift a)_E = ψ_E.mulShift a because Tr_{E/F}(ax) = a·Tr_{E/F}(x). Values on F: ψ_E(a) = ψ(n·a) for a ∈ F (Algebra.trace_algebraMap), n = [E:F].

Acceptance: In F_2 ⊆ F_4: the canonical character of F_2 lifted to F_4 sends ω to ψ(Tr ω) = ψ(1) = −1 and 1 to ψ(Tr 1) = ψ(0) = 1. liftTrace along F/F is ψ.

Rests on: nodes `canonical-additive-character`; library `AddChar.compAddMonoidHom`, `Algebra.trace_surjective`, `Algebra.trace_trace`, `AddChar.IsPrimitive.of_ne_one`, `Algebra.trace_algebraMap`.

Sources: Kowalski, Proposition 1.13, printed p. 14; Conrad, L-functions for Gauss and Jacobi sums, §1 (2), p. 1.

**Definition `trivial-character-conventions`** — Trivial-character and normalisation conventions for Gauss and Jacobi sums. Let F be a finite field with q elements and R a commutative ring. Mathlib's convention: every χ : MulChar F R vanishes on non-units, so χ(0) = 0 even for the trivial character 1; gaussSum χ ψ = Σ_x χ(x)ψ(x) and jacobiSum χ φ = Σ_x χ(x)φ(1 − x), giving gaussSum 1 ψ = −1 (ψ ≠ 1), jacobiSum 1 1 = q − 2 and jacobiSum 1 χ = −1 (χ ≠ 1). The classical convention (Ireland–Rosen p. 88, Berndt–Evans–Williams p. 9, Adhikari; used by the reciprocity sources and by Kowalski's Jacobi sums) sets ε(0) = 1 for the trivial character. Define classicalValue χ : F → R by classicalValue χ x = χ x + [χ = 1 ∧ x = 0], the classical Gauss sum classicalGaussSum χ ψ = Σ_x classicalValue χ x · ψ x and the classical Jacobi sum classicalJacobiSum χ φ = Σ_x classicalValue χ x · classicalValue φ (1 − x). Then classicalGaussSum χ ψ = gaussSum χ ψ + [χ = 1] and classicalJacobiSum χ φ = jacobiSum χ φ + [χ = 1] + [φ = 1]; so J^cl(ε, ε) = q, J^cl(ε, χ) = 0 and g^cl(ε, ψ) = 0 for ψ ≠ 1, and the classical and Mathlib sums agree whenever the characters are nontrivial. The sign-normalised sums of Katre and Conrad (1995) are normalizedGaussSum χ ψ := −gaussSum χ ψ and, for Jacobi sums of r characters, (−1)^(r−1) times Mathlib's sum (FiniteFieldsAndCharacterSums:FF.1/multi-jacobi-sum); both use χ(0) = 0, so normalizedGaussSum 1 ψ = 1 and the normalised J(1, 1) = 2 − q.

Hypotheses and conventions: F a finite field; R a commutative ring; the case split on χ = 1 uses decidable equality of characters (classical). classicalValue is multiplicative in the argument (Kowalski (1.9)) but not in the character: classicalValue (χχ⁻¹) 0 = 1 ≠ 0 = classicalValue χ 0 · classicalValue χ⁻¹ 0 for χ ≠ 1 (Conrad, footnote 2).

API: `classicalValue` (constructor: classicalValue χ x = χ x + (if χ = 1 ∧ x = 0 then 1 else 0)); `classicalValue_of_ne_one` (simp: χ ≠ 1 → classicalValue χ = χ); `classicalValue_one` (simp: classicalValue 1 x = 1 for every x ∈ F); `classicalValue_mul` (relation: classicalValue χ (x·y) = classicalValue χ x · classicalValue χ y); `classicalGaussSum` (data: Σ_x classicalValue χ x · ψ x); `classicalGaussSum_eq` (compatibility: classicalGaussSum χ ψ = gaussSum χ ψ + (if χ = 1 then 1 else 0)); `classicalJacobiSum` (data: Σ_x classicalValue χ x · classicalValue φ (1 − x)); `classicalJacobiSum_eq` (compatibility: classicalJacobiSum χ φ = jacobiSum χ φ + [χ = 1] + [φ = 1]); `classicalJacobiSum_one_one` (example: classicalJacobiSum 1 1 = q); `classicalJacobiSum_one_left` (example: χ ≠ 1 → classicalJacobiSum 1 χ = 0 (R a domain)); `normalizedGaussSum` (data: normalizedGaussSum χ ψ = −gaussSum χ ψ (Katre, Conrad 1995)); `normalizedGaussSum_one` (example: ψ ≠ 1 → normalizedGaussSum 1 ψ = 1 (R a domain)).

Unit tests: classicalJacobiSum (1 : MulChar F R) 1 = q, whereas jacobiSum 1 1 = q − 2 (`test_classicalJacobiSum_one_one`, computation); For χ ≠ 1 (R a domain): classicalJacobiSum 1 χ = 0 (`test_classicalJacobiSum_one_nontrivial`, computation); For ψ ≠ 1 (R a domain): classicalGaussSum 1 ψ = 0 (`test_classicalGaussSum_one`, degenerate); For χ ≠ 1: classicalValue (χ * χ⁻¹) 0 ≠ classicalValue χ 0 * classicalValue χ⁻¹ 0 (1 versus 0), so the classical extension is not a character of the monoid F in the character variable (`test_classicalValue_ne_mul_at_zero`, non-example); χ ≠ 1 → φ ≠ 1 → classicalJacobiSum χ φ = jacobiSum χ φ (`test_classicalJacobiSum_eq_nontrivial`, compatibility).

Uses: ClassicalArithmeticCompletion:CA.1 request (cubic-jacobi-sum-of-a-primary-prime, cubic-gauss-sum-cube, cubic-reciprocity, eisenstein-reciprocity): the reciprocity sources use ε(0) = 1 and unnormalised sums; CA.1 imports the comparison J^cl(ε,ε) = q, J^cl(ε,χ) = 0; Kowalski, (1.8) and Definition 2.12: power counts and Jacobi sums with the classical convention; Katre, Definition 1; Conrad (1995), p. 2: the sign-normalised Gauss and Jacobi sums of the Stickelberger nodes; FiniteFieldsAndCharacterSums:FF.1/power-count-via-characters: the number of d-th roots is a sum of classical values.

Construction: Write classicalValue χ = χ + a·δ_0 with a = [χ = 1] ∈ {0, 1}. Gauss: Σ_x (χx + aδ_{x,0})ψ(x) = gaussSum χ ψ + a·ψ(0) = gaussSum χ ψ + a. Jacobi: Σ_x (χx + aδ_{x,0})(φ(1−x) + bδ_{x,1}) = jacobiSum χ φ + b·χ(1) + a·φ(1) + ab·δ_{0,1} = jacobiSum χ φ + a + b, since χ(1) = φ(1) = 1 and 0 ≠ 1 in F. Evaluate with Mathlib: jacobiSum_one_one (q − 2), jacobiSum_one_nontrivial (−1), gaussSum_one_left (−1); hence J^cl(1,1) = q, J^cl(1,χ) = 0, g^cl(1,ψ) = 0. Multiplicativity in the argument: for χ ≠ 1 classicalValue χ = χ; for χ = 1, classicalValue 1 ≡ 1, and 1·1 = 1.

Acceptance: J^cl(1, 1) = q versus jacobiSum 1 1 = q − 2 (Conrad, Remark 2.7). J^cl(1, χ) = 0 versus jacobiSum 1 χ = −1 for χ ≠ 1. g^cl(1, ψ) = 0 versus gaussSum 1 ψ = −1 for ψ ≠ 1 (Kowalski, Remark 2.2: τ(1, ψ) = −1 'because of the missing term at x = 0'). For χ, φ nontrivial: J^cl(χ, φ) = jacobiSum χ φ; in particular the cubic Jacobi sum J(χ_π, χ_π) of CA.1 is the same in both conventions.

Rests on: library `MulChar`, `MulChar.map_nonunit`, `gaussSum`, `jacobiSum`, `jacobiSum_one_one`, `jacobiSum_one_nontrivial`, `gaussSum_one_left`, `gaussSum_one_one`, `MulChar.one_apply`.

Sources: Conrad, Gauss and Jacobi sums, Definition 2.1 and footnote 2, p. 1; Conrad, Gauss and Jacobi sums, Theorem 2.6 and Remark 2.7, p. 4; Kowalski, (1.8)–(1.9), printed p. 15; Katre, Definition 1 and footnote 1, p. 75.

**Lemma `gauss-sum-transport`** — Transport of Gauss sums along ring homomorphisms, and the shift identity. Let R be a finite commutative ring, S and S' commutative rings and f : S →+* S'. For χ : MulChar R S and ψ : AddChar R S: gaussSum (χ.ringHomComp f) (f ∘ ψ) = f (gaussSum χ ψ) (the Jacobi-sum analogue is Mathlib's jacobiSum_ringHomComp). For a finite field F and c ∈ F nonzero (the shift identity): gaussSum χ (ψ.mulShift c) = χ(c)⁻¹ · gaussSum χ ψ, where χ(c)⁻¹ = χ⁻¹(c) is the inverse of the root of unity χ(c). In particular, for a number field K, a character χ : MulChar F (𝓞 K) (such as a power-residue character of CA.1) and an embedding φ : 𝓞 K →+* ℂ, the complex Gauss sum g_φ(χ) := gaussSum (χ.ringHomComp φ) ψ_F = Σ_t φ(χ(t))·ψ_F(t) satisfies: if ζ ∈ 𝓞 K is a p-th root of unity with φ(ζ) = e^(2πia/p), a ∈ F_p^×, then φ(gaussSum χ (traceAddChar F p ζ)) = (χ.ringHomComp φ)⁻¹(a) · g_φ(χ).

Hypotheses and conventions: For the shift identity: F a field, c ≠ 0 (Mathlib's gaussSum_mulShift_eq is the statement for a unit c). For the last statement: F finite of characteristic p with the ZMod p-algebra structure, φ a ring homomorphism.

Proof: Transport: gaussSum is a finite sum of products; f is additive and multiplicative (map_sum, map_mul), and (χ.ringHomComp f)(t) = f(χ t), (f ∘ ψ)(t) = f(ψ t). Shift identity: apply gaussSum_mulShift_eq with the unit Units.mk0 c hc; χ⁻¹(c) = χ(c⁻¹) = χ(c)⁻¹ (MulChar.inv_apply' for field-valued χ, or Ring.inverse of the unit χ(c) in general). Embedding with a root: φ ∘ traceAddChar F p ζ = t ↦ e^(2πia·Tr(t)/p) = ψ_F.mulShift a (traceAddChar_apply, canonicalAddChar_eq_exp), so by transport φ(gaussSum χ ψ_ζ) = gaussSum (χ.ringHomComp φ) (ψ_F.mulShift a) and the shift identity finishes.

Acceptance: Katre, Proposition 1(h): for τ_c fixing ζ_m and sending ζ_p ↦ ζ_p^c, g(χ)^(τ_c) = χ(c)^(−1) g(χ) (transport along τ_c plus the shift identity). For the cubic character of CA.1 pushed to ℂ, the cube of g_φ(χ) is independent of the choice of ζ up to the factor χ(a)^(−3) = 1. jacobiSum_ringHomComp is the Jacobi analogue (no additive character is involved).

Rests on: nodes `canonical-additive-character`; library `gaussSum`, `MulChar.ringHomComp`, `MonoidHom.compAddChar`, `gaussSum_mulShift_eq`, `MulChar.inv_apply'`, `jacobiSum_ringHomComp`.

Sources: Katre, Proposition 1(h) and its proof, pp. 76–77; Kowalski, (2.2) and Proposition 2.4, printed pp. 17–18.

**Lemma `gauss-sum-galois-conjugation`** — Galois conjugation of Gauss sums of characters of order dividing m. Let F be a finite field of characteristic p with q elements, m ∣ q − 1, and L a field containing a primitive m-th root of unity ζ_m and a primitive p-th root of unity ζ_p (in the Stickelberger nodes, L = Q(ζ_{mp}) or its ring of integers). Let χ : MulChar F L have χ^m = 1 and ψ = traceAddChar F p ζ_p. For an automorphism σ of L with σ(ζ_m) = ζ_m^b and σ(ζ_p) = ζ_p^c (b prime to m, c prime to p): σ(gaussSum χ ψ) = gaussSum (χ^b) (ψ.mulShift c) = χ(c)^(−b) · gaussSum (χ^b) ψ. In particular σ_b (c = 1) sends g(χ) to g(χ^b), and τ_c (b = 1) multiplies g(χ) by χ(c)^(−1); hence g(χ)^m is fixed by every τ_c and lies in Q(ζ_m) (Katre, Proposition 1(h)).

Hypotheses and conventions: χ^m = 1, so the values of χ lie in μ_m ∪ {0} (MulChar.apply_mem_rootsOfUnity_of_pow_eq_one). σ is a ring automorphism of L fixing the prime field.

Proof: σ ∘ χ = χ^b: every nonzero value of χ is a power ζ_m^j and σ(ζ_m^j) = ζ_m^(bj) = (ζ_m^j)^b; at 0 both sides vanish (MulChar.pow_apply'). σ ∘ ψ = ψ.mulShift c: σ(ζ_p^t) = ζ_p^(ct) = ψ(c·x) for t = val Tr(x) (Tr is ZMod p-linear). By FiniteFieldsAndCharacterSums:FF.1/gauss-sum-transport, σ(g(χ, ψ)) = g(χ^b, ψ.mulShift c) = (χ^b)(c)^(−1) g(χ^b, ψ) = χ(c)^(−b) g(χ^b, ψ). g(χ)^m: τ_c multiplies it by χ(c)^(−m) = 1, so it lies in the fixed field of {τ_c}, which is Q(ζ_m) inside Q(ζ_{mp}).

Acceptance: For p odd, m = 2, χ the quadratic character: σ_b with b odd fixes g(χ), and τ_c multiplies it by χ(c), recovering that g(χ)^2 = χ(−1)q is rational. Katre, Proposition 1(h), with b = 1 + m: g(χ)^m ∈ Q(ζ_m).

Rests on: nodes `gauss-sum-transport`, `canonical-additive-character`; library `MulChar.apply_mem_rootsOfUnity_of_pow_eq_one`, `MulChar.pow_apply'`.

Sources: Katre, Proposition 1(h), p. 76.

### 2. Absolute values, orthogonality and elementary identities

**Lemma `gauss-sum-absolute-value`** — The absolute value of a complex Gauss sum. Let F be a finite field with q elements, χ : MulChar F ℂ nontrivial and ψ : AddChar F ℂ nontrivial. Then gaussSum χ ψ · conj(gaussSum χ ψ) = q, i.e. ‖gaussSum χ ψ‖ = √q. Degenerate cases (Mathlib values): gaussSum 1 ψ = −1 (ψ ≠ 1), gaussSum χ 1 = 0 (χ ≠ 1), gaussSum 1 1 = q − 1. Every Galois conjugate of a Gauss sum of nontrivial characters is again such a Gauss sum, so it is a q-Weil number of weight 1.

Hypotheses and conventions: χ ≠ 1 and ψ ≠ 1, complex values.

Proof: conj(gaussSum χ ψ) = gaussSum χ⁻¹ ψ⁻¹ (star_gaussSum_eq). ψ is primitive (AddChar.IsPrimitive.of_ne_one), so gaussSum χ ψ · gaussSum χ⁻¹ ψ⁻¹ = q (gaussSum_mul_gaussSum_eq_card). Hence ‖g‖^2 = g·conj g = q (Complex.mul_conj), ‖g‖ = √q. Weil number: an automorphism σ of ℂ sends g(χ, ψ) to g(σ∘χ, σ∘ψ) with both characters still nontrivial (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-transport).

Acceptance: Quadratic Gauss sum over F_p: ‖Σ_a (a/p) e^(2πia/p)‖ = √p; Conrad's closed form √p or i√p. The degenerate values show the hypotheses are needed: ‖gaussSum 1 ψ‖ = 1 ≠ √q for q > 1.

Rests on: nodes `gauss-sum-transport`; library `star_gaussSum_eq`, `gaussSum_mul_gaussSum_eq_card`, `AddChar.IsPrimitive.of_ne_one`, `gaussSum_one_left`, `gaussSum_one_right`, `gaussSum_one_one`.

Sources: Kowalski, Proposition 2.4, printed p. 18; Conrad, L-functions for Gauss and Jacobi sums, §1 (1), p. 1.

**Lemma `jacobi-sum-absolute-value`** — The absolute value of a complex Jacobi sum. Let F be a finite field with q elements and χ, φ : MulChar F ℂ with χ, φ and χφ nontrivial. Then ‖jacobiSum χ φ‖ = √q. If χ, φ ≠ 1 but χφ = 1, then jacobiSum χ φ = −χ(−1) has absolute value 1; jacobiSum 1 χ = −1 (χ ≠ 1); jacobiSum 1 1 = q − 2.

Hypotheses and conventions: χ, φ, χφ nontrivial, complex values.

Proof: jacobiSum χ φ = gaussSum χ ψ · gaussSum φ ψ / gaussSum (χφ) ψ for ψ = ψ_F primitive (jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum, (q : ℂ) ≠ 0). Each Gauss sum has absolute value √q (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-absolute-value), so the quotient has absolute value √q·√q/√q. Degenerate cases: jacobiSum_nontrivial_inv, jacobiSum_one_nontrivial, jacobiSum_one_one.

Acceptance: Fermat's two-squares theorem (Kowalski, Theorem 2.15): for p ≡ 1 (mod 4), χ of order 4 and η quadratic, J(χ, η) = a + bi with a² + b² = p.

Rests on: nodes `gauss-sum-absolute-value`, `canonical-additive-character`; library `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `jacobiSum_nontrivial_inv`, `jacobiSum_one_nontrivial`, `jacobiSum_one_one`.

Sources: Kowalski, Proposition 2.13, printed p. 23; Conrad, Gauss and Jacobi sums, Corollary 2.5 and Theorem 2.6, pp. 3–4.

**Lemma `mulchar-column-orthogonality`** — Column orthogonality for multiplicative characters of a finite field. Let F be a finite field with q elements and R a domain with HasEnoughRootsOfUnity R (q − 1) (e.g. ℂ, or a ring of integers containing μ_(q−1)). For every a ∈ F: Σ_{χ : MulChar F R} χ(a) = q − 1 if a = 1 and 0 otherwise (in particular the sum is 0 at a = 0, every χ vanishing there); and for b ≠ 0, Σ_χ χ(a)·χ(b)⁻¹ = (q − 1)·[a = b].

Hypotheses and conventions: R a domain containing a primitive (q − 1)-th root of unity (the exponent of Fˣ divides q − 1). Mathlib's convention χ(0) = 0 for all χ, so the a = 0 case is not the classical one (with ε(0) = 1 the sum at 0 would be 1).

Proof: Transport along MulChar.equivToUnitHom : MulChar F R ≃ (Fˣ →* Rˣ); for a = u a unit, χ(u) = (equivToUnitHom χ)(u) (MulChar.coe_equivToUnitHom). Apply Tau Ceti's CommGroup.sum_monoidHom_apply_eq_ite to G = Fˣ: Σ_{χ : Fˣ →* Rˣ} χ(g) = Nat.card G · [g = 1] = (q − 1)·[g = 1]. At a = 0: every term is χ(0) = 0 (MulChar.map_nonunit). The tagged form is TauCeti's CommGroup.sum_inv_mul_monoidHom_apply_eq_ite with σ = b.

Acceptance: Σ_χ χ(−1) = 0 when q > 2 and = 1 when q = 2 (then −1 = 1). Σ_χ χ(0) = 0.

Rests on: library `CommGroup.sum_monoidHom_apply_eq_ite`, `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`, `MulChar.equivToUnitHom`, `MulChar.coe_equivToUnitHom`, `MulChar.map_nonunit`.

Sources: Kowalski, (1.6), printed p. 12.

**Theorem `power-count-via-characters`** — Counting d-th roots with multiplicative characters. Let F be a finite field with q elements, d ∣ q − 1, and R a domain of characteristic zero with HasEnoughRootsOfUnity R (q − 1). For every x ∈ F (including x = 0): #{y ∈ F : y^d = x} = Σ_{χ : MulChar F R, χ^d = 1} classicalValue χ x. For x ≠ 0 this reads Σ_{χ^d = 1} χ(x) = d·[x is a d-th power], and in Mathlib's convention the right side at x = 0 is 0, not 1: the formula needs the classical value of the trivial character.

Hypotheses and conventions: d ∣ q − 1; characteristic zero so that the count is faithfully represented in R.

Proof: x ≠ 0: the characters with χ^d = 1 are the characters of Fˣ/(Fˣ)^d (MulChar.subgroupOrderIsoSubgroupMulChar: the annihilator of the subgroup of d-th powers), a group of order d; column orthogonality on the quotient (FiniteFieldsAndCharacterSums:FF.1/mulchar-column-orthogonality applied to Fˣ/(Fˣ)^d) gives Σ_{χ^d=1} χ(x) = d·[x ∈ (Fˣ)^d]. x ≠ 0: the d-th power map on the cyclic group Fˣ of order q − 1 has kernel of order d (d ∣ q − 1), so x has d preimages if it is a d-th power and none otherwise. x = 0: the only y with y^d = 0 is 0, so the left side is 1; on the right only χ = 1 contributes, with classicalValue 1 0 = 1 (FiniteFieldsAndCharacterSums:FF.1/trivial-character-conventions).

Acceptance: d = 2, q odd: #{y : y^2 = x} = 1 + η^cl(x) with η the quadratic character (used in the duplication formula). x = 0: both sides are 1; with Mathlib's MulChar values instead of classicalValue the right side would be 0.

Rests on: nodes `mulchar-column-orthogonality`, `trivial-character-conventions`; library `MulChar.subgroupOrderIsoSubgroupMulChar`.

Sources: Kowalski, (1.7) and (1.8), printed p. 15.

**Lemma `fourier-expansion-of-multiplicative-character`** — Fourier expansion of a multiplicative character and the Gauss-sum normalisation. Let F be a finite field with q elements, ψ : AddChar F ℂ nontrivial, χ : MulChar F ℂ nontrivial, and identify the dual of (F, +) with F by a ↦ ψ_a := ψ.mulShift a (FiniteFieldsAndCharacterSums:FF.1/additive-characters-are-shifts). With the normalised Fourier transform of AdditiveCombinatorics:AC.0, f̂(φ) = (1/|G|) Σ_x f(x)·conj φ(x), one has χ̂(ψ_a) = (1/q)·χ⁻¹(−a)·gaussSum χ ψ for every a ∈ F (0 at a = 0), and Fourier inversion gives χ(x) = (gaussSum χ ψ / q)·Σ_{a ∈ F} χ⁻¹(−a) ψ(ax) for every x ∈ F. The unnormalised coefficient Σ_x χ(x) conj ψ_a(x) = gaussSum χ (ψ.mulShift (−a)) is q times the normalised one: Gauss sums are unnormalised Fourier coefficients.

Hypotheses and conventions: χ ≠ 1, ψ ≠ 1, complex values; AC.0 supplies the normalised transform and its inversion formula for finite abelian groups.

Proof: conj ψ_a(x) = ψ(−ax) (AddChar.starComp_eq_inv, AddChar.inv_mulShift), so q·χ̂(ψ_a) = Σ_x χ(x)ψ(−ax) = gaussSum χ (ψ.mulShift (−a)). For a ≠ 0 the shift identity (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-transport) gives gaussSum χ (ψ.mulShift (−a)) = χ⁻¹(−a) gaussSum χ ψ; for a = 0 the sum is Σ χ = 0 (MulChar.sum_eq_zero_of_ne_one), matching χ⁻¹(0) = 0. Fourier inversion f = Σ_φ f̂(φ) φ over the dual (AdditiveCombinatorics:AC.0), reindexed by a ↦ ψ_a, gives the expansion. Check against Parseval: Σ_a |χ̂(ψ_a)|² = (q − 1)·q/q² = (q − 1)/q = (1/q)Σ_x |χ(x)|², using ‖gaussSum‖² = q (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-absolute-value).

Acceptance: For F = F_p, ψ = e(·/p) and χ the Legendre symbol: (x/p) = (g/p)·Σ_a (−a/p) e(ax/p), with g the quadratic Gauss sum. At x = 0 both sides vanish.

Rests on: nodes `additive-characters-are-shifts`, `gauss-sum-transport`, `gauss-sum-absolute-value`; library `AddChar.starComp_eq_inv`, `AddChar.inv_mulShift`, `MulChar.sum_eq_zero_of_ne_one`, `gaussSum_mulShift_eq`; stages `AdditiveCombinatorics:AC.0`.

Sources: Kowalski, Proposition 1.10, printed p. 12; Kowalski, (2.2), printed p. 17.

**Lemma `gauss-sum-frobenius-invariance`** — Frobenius invariance of Gauss sums with a trace character. Let F be a finite field of characteristic p, R a commutative ring, χ : MulChar F R and ψ : AddChar F R with ψ(x^p) = ψ(x) for all x (every trace character traceAddChar F p ζ, in particular ψ_F, has this property). Then gaussSum (χ^p) ψ = gaussSum χ ψ, and hence gaussSum (χ^(p^i)) ψ = gaussSum χ ψ for all i. This is distinct from Mathlib's gaussSum_frob, which raises the Gauss sum itself to the p-th power in a target of characteristic p.

Hypotheses and conventions: ψ Frobenius-invariant; no hypothesis on χ.

Proof: (χ^p)(x) = χ(x)^p = χ(x^p) (MulChar.pow_apply' with p ≠ 0, multiplicativity). x ↦ x^p is a bijection of the finite field F (frobenius is injective, F finite), so Σ_x χ(x^p)ψ(x) = Σ_y χ(y)ψ(y^(1/p)) and ψ(y^(1/p)) = ψ(y) by invariance. Trace characters are invariant: Tr(x^p) = Tr(x) (FiniteFieldsAndCharacterSums:FF.1/canonical-additive-character, canonicalAddChar_frobenius).

Acceptance: If χ^(p−1) = 1 then χ^p = χ and the statement is trivial; for q = p^f with f ≥ 2 and χ of order q − 1 it identifies the Gauss sums of the distinct characters χ, χ^p, …, χ^(p^(f−1)). Katre, Lemma 2(d): s(pα) = s(α) for the valuations of Teichmüller Gauss sums.

Rests on: nodes `canonical-additive-character`; library `MulChar.pow_apply'`, `frobenius`, `gaussSum`.

Sources: Katre, Proposition 1(i), pp. 76–77; Conrad (1995), Proof of Theorem 1, p. 5.

**Theorem `gauss-sum-duplication-formula`** — The duplication formula for Gauss sums. Let F be a finite field of odd order q, η its quadratic character and ψ a nontrivial additive character, all with values in ℂ. For every multiplicative character χ: gaussSum (χ^2) ψ · gaussSum η ψ = χ(4) · gaussSum χ ψ · gaussSum (χη) ψ. This is the case n = 2 of the Hasse–Davenport product relation (FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-product-relation), with an elementary proof through Jacobi sums.

Hypotheses and conventions: q odd; ψ ≠ 1; values in ℂ (any field of characteristic ≠ p containing the values works).

Proof: χ = 1 and χ = η are tautologies (η(4) = η(2)^2 = 1). Otherwise χ^2 ≠ 1 and χη ≠ 1. jacobiSum_mul_nontrivial gives g(χ)^2 = g(χ^2)·J(χ, χ). J(χ, χ) = Σ_x χ(x(1 − x)) = Σ_y χ(y)·#{x : x − x² = y} = Σ_y χ(y)(1 + η^cl(1 − 4y)), since x − x² = y has as many solutions as Δ² = 1 − 4y (q odd; FiniteFieldsAndCharacterSums:FF.1/power-count-via-characters with d = 2). Σ_y χ(y) = 0 (MulChar.sum_eq_zero_of_ne_one), and substituting y = z/4 gives Σ_y χ(y)η(1 − 4y) = χ(4)^(−1) J(χ, η). J(χ, η) = g(χ)g(η)/g(χη) (jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum; χη ≠ 1). Combine and cancel g(χ) ≠ 0 (gaussSum_ne_zero_of_nontrivial).

Acceptance: χ = η: both sides equal g(1)·g(η) = −g(η) (Conrad, footnote 8). For χ of order 4 (q ≡ 1 mod 4): χ² = η and the formula reads g(η)² = χ(4)·g(χ)·g(χ³); both sides have absolute value q.

Rests on: nodes `power-count-via-characters`; library `jacobiSum_mul_nontrivial`, `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `gaussSum_ne_zero_of_nontrivial`, `MulChar.sum_eq_zero_of_ne_one`, `quadraticChar`.

Sources: Kowalski, Proposition 2.17, printed p. 25; Conrad, Gauss and Jacobi sums, (A.5), p. 19.

### 3. The Hasse–Davenport lifting relation

The proof follows Conrad's *L-functions for Gauss and Jacobi sums*: a completely multiplicative weight on monic polynomials, the vanishing of its degree sums, the Euler-product (logarithmic-derivative) recurrence and the orbit decomposition of an extension field.

**Definition `hasse-davenport-weight`** — The Gauss-sum weight on monic polynomials. Let F be a finite field, R a commutative ring, χ : MulChar F R and ψ : AddChar F R. For a monic polynomial f = X^s + a_(s−1)X^(s−1) + ⋯ + a_0 ∈ F[X] put λ_{χ,ψ}(f) := χ((−1)^s a_0)·ψ(−a_(s−1)) = χ((−1)^(natDegree f)·f.coeff 0)·ψ(−f.nextCoeff) (hdWeight χ ψ f). Then λ(1) = 1 and λ is completely multiplicative on monic polynomials: λ(fg) = λ(f)λ(g); on linear polynomials λ(X − c) = χ(c)ψ(c); λ(X) = χ(0) = 0 for every χ (Mathlib's convention); and for a monic irreducible P of degree d with a root α in an extension of degree d, λ(P) = χ(N(α))·ψ(Tr(α)), norm and trace from F(α) to F.

Hypotheses and conventions: F finite, R commutative; f monic (the formula is applied only to monic polynomials). Pinned convention: the constant term enters as (−1)^s a_0 (the product of the roots) and the next coefficient as −a_(s−1) (the sum of the roots).

API: `hdWeight` (constructor: hdWeight χ ψ f := χ((−1)^(natDegree f) · coeff f 0) · ψ(−nextCoeff f)); `hdWeight_one` (simp: hdWeight χ ψ 1 = 1); `hdWeight_mul` (relation: For monic f, g: hdWeight χ ψ (f * g) = hdWeight χ ψ f * hdWeight χ ψ g); `hdWeight_X_sub_C` (simp: hdWeight χ ψ (X − C c) = χ c * ψ c); `hdWeight_X` (simp: hdWeight χ ψ X = 0); `hdWeight_pow` (relation: For monic f: hdWeight χ ψ (f^k) = (hdWeight χ ψ f)^k); `hdWeight_minpoly` (characterisation: For α in a finite extension E of F: hdWeight χ ψ (minpoly F α) = χ(N_{F(α)/F} α) ψ(Tr_{F(α)/F} α)).

Unit tests: hdWeight χ ψ (X − C c) = χ c * ψ c (`test_hdWeight_linear`, computation); hdWeight χ ψ 1 = 1 (`test_hdWeight_one`, degenerate); hdWeight 1 ψ X = 0: the trivial character contributes 0 at the root 0 (a definition with ε(0) = 1 would give 1) (`test_hdWeight_X`, non-example); Over ZMod 3: hdWeight χ ψ (X^2 + 1) = 1 for all χ, ψ (constant term 1, next coefficient 0) (`test_hdWeight_X2_add_one`, computation); hdWeight 1 1 f = 1 if coeff f 0 ≠ 0 and 0 otherwise (`test_hdWeight_trivial`, compatibility).

Uses: Conrad, L-functions for Gauss and Jacobi sums, §3: the Euler product of the weighted sum over monic polynomials gives the Hasse–Davenport relation; FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-degree-sums: the degree-s sums of λ vanish for s ≥ 2 and equal the Gauss sum for s = 1; FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-orbit-sum: the weight of an irreducible is a norm-trace character value of a root.

Construction: λ(1) = χ(1)·ψ(0) = 1 (natDegree 1 = 0, nextCoeff 1 = 0). Multiplicativity: for monic f, g of degrees s, t, (−1)^(s+t)(fg)(0) = ((−1)^s f(0))((−1)^t g(0)) and nextCoeff(fg) = nextCoeff f + nextCoeff g (Polynomial.Monic.nextCoeff_mul); χ is multiplicative and ψ turns sums into products. Linear: natDegree (X − C c) = 1, coeff 0 = −c, nextCoeff = −c (Polynomial.nextCoeff_X_sub_C), so λ = χ(c)ψ(c). Irreducible: if P is the minimal polynomial of α, then Tr(α) = −nextCoeff P and N(α) = (−1)^d P(0) (PowerBasis.trace_gen_eq_nextCoeff_minpoly, Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly; Kowalski, Lemma 1.5).

Acceptance: λ(X − c) = χ(c)ψ(c), so Σ_{c ∈ F} λ(X − c) = gaussSum χ ψ. λ(X) = 0 for every χ, including χ = 1; under the classical convention ε(0) = 1 the weight of X would be 1 and the orbit identity would count α = 0 with the wrong weight.

Rests on: library `Polynomial.nextCoeff`, `Polynomial.Monic.nextCoeff_mul`, `Polynomial.nextCoeff_X_sub_C`, `PowerBasis.trace_gen_eq_nextCoeff_minpoly`, `Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`, `MulChar`.

Sources: Kowalski, Lemma 1.5, printed p. 10; Conrad, L-functions for Gauss and Jacobi sums, Remark after Theorem 3.1, p. 4.

**Lemma `hasse-davenport-degree-sums`** — The degree sums of the Gauss-sum weight. Let F be a finite field with q elements, R a domain, χ : MulChar F R and ψ : AddChar F R with χ ≠ 1 or ψ ≠ 1. Let S_s := Σ_{f monic, deg f = s} λ_{χ,ψ}(f). Then S_0 = 1, S_1 = gaussSum χ ψ and S_s = 0 for every s ≥ 2.

Hypotheses and conventions: χ ≠ 1 or ψ ≠ 1; R a domain (for the vanishing of character sums). Monic polynomials of degree s are enumerated by coefficient vectors F^s (monicOfCoeffs).

Proof: S_0: the only monic polynomial of degree 0 is 1, of weight 1. S_1: f = X − c, c ∈ F, weight χ(c)ψ(c); the sum is gaussSum χ ψ (FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-weight, hdWeight_X_sub_C). s ≥ 2: writing f = X^s + Σ_{i<s} a_i X^i, the weight is χ((−1)^s a_0)·ψ(−a_(s−1)) with a_0 and a_(s−1) distinct coordinates; summing over the coordinates, S_s = q^(s−2)·(Σ_a χ((−1)^s a))·(Σ_b ψ(−b)), and one of the two sums is 0 (MulChar.sum_eq_zero_of_ne_one, AddChar.sum_eq_zero_of_ne_one; the maps a ↦ ±a, b ↦ −b are bijections).

Acceptance: For χ = ψ = 1: S_s = #{f monic of degree s with f(0) ≠ 0} = q^(s−1)(q − 1) ≠ 0, so the hypothesis is needed. S_1 = gaussSum χ ψ.

Rests on: nodes `hasse-davenport-weight`; library `MulChar.sum_eq_zero_of_ne_one`, `AddChar.sum_eq_zero_of_ne_one`, `gaussSum`.

Sources: Conrad, L-functions for Gauss and Jacobi sums, Theorem 2.1 and (2.1), pp. 1–2.

**Lemma `polynomial-euler-product-recurrence`** — The logarithmic-derivative recurrence for multiplicative weights on monic polynomials. Let F be a finite field, R a commutative ring and w a function on monic polynomials over F with values in R that is completely multiplicative (w(1) = 1, w(fg) = w(f)w(g)). Put S_s := Σ_{f monic, deg f = s} w(f) and N_k := Σ_{d ∣ k} Σ_{P monic irreducible, deg P = d} d·w(P)^(k/d). Then for every s ≥ 1: s·S_s = Σ_{k=1}^{s} N_k·S_(s−k). This is the coefficient form, with no division, of the identity u·L'(u)/L(u) = Σ_k N_k u^k for L(u) = Σ_s S_s u^s = ∏_P (1 − w(P)u^(deg P))^(−1).

Hypotheses and conventions: No hypothesis on R: the identity holds with s·S_s the natural-number multiple (nsmul).

Proof: Polynomial von Mangoldt function: for monic h put Λ(h) = deg P if h = P^j with P monic irreducible and j ≥ 1, and Λ(h) = 0 otherwise. For monic f, deg f = Σ_{h monic, h ∣ f} Λ(h): by unique factorisation (UniqueFactorizationMonoid.normalizedFactors), the prime powers P^j dividing f are those with j ≤ v_P(f), and Σ_P v_P(f)·deg P = deg f. Then s·S_s = Σ_{deg f = s} w(f) Σ_{h ∣ f} Λ(h) = Σ_{deg h + deg g = s} Λ(h)w(h)w(g), writing f = h·g and using multiplicativity; grouping by k = deg h gives Σ_{k=1}^{s} (Σ_{deg h = k} Λ(h)w(h))·S_(s−k). Σ_{deg h = k} Λ(h)w(h) = Σ_{d ∣ k} Σ_{deg P = d} d·w(P^(k/d)) = N_k (the prime powers of degree k are P^(k/d) with deg P = d ∣ k). For w ≡ 1 this reads s·q^s = Σ_k N_k q^(s−k) with N_k = Σ_{d∣k} d·π_q(d) = q^k (Shoup, Theorem 19.11), a consistency check with FiniteFieldsAndCharacterSums:FF.3's count of irreducible polynomials.

Acceptance: w ≡ 1: N_k = q^k and the recurrence is s·q^s = Σ_{k=1}^{s} q^k q^(s−k). w = λ_{χ,ψ}: combined with the degree sums, N_s = (−1)^(s−1) g^s (Hasse–Davenport).

Rests on: library `UniqueFactorizationMonoid.normalizedFactors`, `Polynomial.Monic`, `Irreducible`.

Sources: Conrad, L-functions for Gauss and Jacobi sums, Proof of Theorem 3.1, p. 3; Kowalski, Proposition 4.5(1), printed p. 40.

**Lemma `hasse-davenport-orbit-sum`** — The prime-power sum of the Gauss-sum weight is a lifted Gauss sum. Let F be a finite field, E a finite extension of degree k ≥ 1, R a commutative ring, χ : MulChar F R and ψ : AddChar F R. With N_k := Σ_{d ∣ k} Σ_{P monic irreducible, deg P = d} d·λ_{χ,ψ}(P)^(k/d): N_k = gaussSum (liftNorm E χ) (liftTrace E ψ) = Σ_{α ∈ E} χ(N_{E/F}(α))·ψ(Tr_{E/F}(α)).

Hypotheses and conventions: E any extension of degree k (the identity is invariant under F-algebra isomorphisms).

Proof: Every α ∈ E has a minimal polynomial P_α over F, monic irreducible of degree d = [F(α) : F] dividing k; conversely a monic irreducible P of degree d ∣ k divides X^(q^k) − X (Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X), which splits into distinct linear factors over E (FiniteField.roots_X_pow_card_sub_X), so P has exactly d roots in E, forming one Frobenius orbit (TauCeti.FiniteField.orbit_eq_rootSet_minpoly). Hence Σ_{α ∈ E} G(α) = Σ_{d ∣ k} Σ_{deg P = d} Σ_{α root of P} G(α) for G(α) = χ(N_{E/F}α)ψ(Tr_{E/F}α). For a root α of P of degree d: N_{E/F}(α) = N_{F(α)/F}(N_{E/F(α)}(α)) = N_{F(α)/F}(α)^(k/d) and Tr_{E/F}(α) = (k/d)·Tr_{F(α)/F}(α) (Algebra.norm_norm, Algebra.trace_trace, Algebra.norm_algebraMap, Algebra.trace_algebraMap); so G(α) = χ(N(α))^(k/d) ψ(Tr(α))^(k/d) = λ(P)^(k/d) (FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-weight, hdWeight_minpoly). Each of the d roots contributes the same value, giving d·λ(P)^(k/d). α = 0 has P = X, λ(X) = 0 = χ(N(0))ψ(0): consistent. Invariance: an F-algebra isomorphism E ≃ E' preserves norms and traces (Algebra.norm_eq_of_algEquiv, Algebra.trace_eq_of_algEquiv), hence the lifted Gauss sum.

Acceptance: k = 1 (E = F): N_1 = Σ_{c} λ(X − c) = gaussSum χ ψ. For χ = 1, ψ = 1: N_k = #(Eˣ) = q^k − 1.

Rests on: nodes `hasse-davenport-weight`, `norm-lift-of-a-multiplicative-character`, `trace-lift-of-an-additive-character`; library `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`, `FiniteField.roots_X_pow_card_sub_X`, `TauCeti.FiniteField.orbit_eq_rootSet_minpoly`, `Algebra.norm_norm`, `Algebra.trace_trace`, `Algebra.norm_algebraMap`, `Algebra.trace_algebraMap`, `Algebra.norm_eq_of_algEquiv`, `Algebra.trace_eq_of_algEquiv`.

Sources: Conrad, L-functions for Gauss and Jacobi sums, (3.1) and the computation on p. 4.

**Theorem `hasse-davenport-lifting`** (planet: *Hasse–Davenport lifting relation*) — The Hasse–Davenport lifting relation. Let F be a finite field, E an extension of degree n ≥ 1, R a domain, χ : MulChar F R and ψ : AddChar F R with χ ≠ 1 or ψ ≠ 1. Then −gaussSum (liftNorm E χ) (liftTrace E ψ) = (−gaussSum χ ψ)^n, i.e. G(χ∘N_{E/F}, ψ∘Tr_{E/F}) = (−1)^(n−1) G(χ, ψ)^n. With the canonical characters (liftTrace E ψ_F = ψ_E): −g_E(χ∘N, ψ_E) = (−g_F(χ, ψ_F))^n. The hypothesis is necessary: for χ = ψ = 1, gaussSum 1 1 = q − 1 over F and q^n − 1 over E, and −(q^2 − 1) ≠ (1 − q)^2.

Hypotheses and conventions: χ ≠ 1 or ψ ≠ 1; R a domain; Mathlib's conventions (χ(0) = 0 for all χ). E is any finite extension of degree n; the result depends only on its isomorphism class over F.

Proof: By FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-degree-sums, S_0 = 1, S_1 = g := gaussSum χ ψ and S_s = 0 for s ≥ 2. The recurrence (FiniteFieldsAndCharacterSums:FF.1/polynomial-euler-product-recurrence) at s = 1 gives N_1 = S_1 = g; at s ≥ 2 it gives 0 = s·S_s = N_s + N_(s−1)·g (the other terms contain S_j = 0 with j ≥ 2), so N_s = −g·N_(s−1), hence N_s = (−1)^(s−1) g^s for all s ≥ 1. By FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-orbit-sum, N_n = gaussSum (liftNorm E χ) (liftTrace E ψ) for the given E of degree n. So gaussSum (liftNorm E χ) (liftTrace E ψ) = (−1)^(n−1) g^n, i.e. −G_E = (−g)^n.

Acceptance: n = 1: trivial. χ = 1, ψ ≠ 1: gaussSum 1 ψ = −1 over F and over E, and −(−1) = 1 = (−(−1))^n. Conrad, Gauss and Jacobi sums p. 19: for q = p^f odd and η the quadratic character, −G(η) = (−Σ_{a mod p} (a/p) e^(2πia/p))^f = (−1)^f √q (p ≡ 1 mod 4) or (−1)^f i^f √q (p ≡ 3 mod 4). χ = ψ = 1, n = 2: −(q^2 − 1) ≠ (1 − q)^2, so the hypothesis cannot be dropped.

Rests on: nodes `hasse-davenport-degree-sums`, `polynomial-euler-product-recurrence`, `hasse-davenport-orbit-sum`, `norm-lift-of-a-multiplicative-character`, `trace-lift-of-an-additive-character`, `canonical-additive-character`.

Sources: Conrad, L-functions for Gauss and Jacobi sums, Theorem 3.1, p. 3; Conrad, Gauss and Jacobi sums, Appendix, p. 19.

**Theorem `hasse-davenport-lifting-for-jacobi-sums`** — The Hasse–Davenport relation for Jacobi sums. Let F be a finite field, E an extension of degree n ≥ 1, R a field whose characteristic differs from that of F, and χ_1, χ_2 : MulChar F R not both trivial. Then −jacobiSum (liftNorm E χ_1) (liftNorm E χ_2) = (−jacobiSum χ_1 χ_2)^n. For χ_1 = χ_2 = 1 it fails: jacobiSum 1 1 = q − 2 and −(q^2 − 2) ≠ (2 − q)^2.

Hypotheses and conventions: χ_1 or χ_2 nontrivial; R a field of characteristic ≠ char F (so that a primitive additive character with values in a cyclotomic extension of R exists and (q : R) ≠ 0).

Proof: Case χ_1χ_2 ≠ 1: pass to R' = CyclotomicField p R with the primitive character ψ = AddChar.FiniteField.primitiveChar (as in Mathlib's jacobiSum_mul_jacobiSum_inv; jacobiSum_ringHomComp and MulChar.ringHomComp_ne_one_iff transport along the injective R → R'). Then J = g(χ_1)g(χ_2)/g(χ_1χ_2) (jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum), and the same over E with the lifts, since liftNorm is a homomorphism with (χ_1χ_2)_E ≠ 1 (FiniteFieldsAndCharacterSums:FF.1/norm-lift-of-a-multiplicative-character) and liftTrace ψ is primitive. Applying FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-lifting to the three Gauss sums: J_E = (−1)^(n−1)·(−1)^(n−1)/(−1)^(n−1) · J^n = (−1)^(n−1) J^n. Case χ_1χ_2 = 1, χ_1 ≠ 1: J(χ, χ⁻¹) = −χ(−1) (jacobiSum_nontrivial_inv); over E, J_E = −χ_E(−1) = −χ(N(−1)) = −χ((−1)^n) = −χ(−1)^n, so −J_E = χ(−1)^n = (−J)^n. Case exactly one trivial: J = −1 over F and over E (jacobiSum_one_nontrivial; the lift of 1 is 1 and the lift of a nontrivial character is nontrivial), and −(−1) = 1 = 1^n.

Acceptance: χ_1 = 1 ≠ χ_2: both sides equal 1. χ_1 = χ_2 = 1, n = 2: −(q² − 2) ≠ (2 − q)².

Rests on: nodes `hasse-davenport-lifting`, `norm-lift-of-a-multiplicative-character`, `trace-lift-of-an-additive-character`; library `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `jacobiSum_nontrivial_inv`, `jacobiSum_one_nontrivial`, `jacobiSum_ringHomComp`, `MulChar.ringHomComp_ne_one_iff`, `AddChar.FiniteField.primitiveChar`.

Sources: Conrad, L-functions for Gauss and Jacobi sums, §4, p. 5.

### 4. Teichmüller characters, Stickelberger's congruence and the factorisation of Gauss sums

Stickelberger's congruence follows Conrad (1995): the Jacobi-sum congruence for Teichmüller characters and the digit decomposition. The valuations and the prime factorisation follow Katre. The Hasse–Davenport product relation is stated with its standard route; its last step has no public proof read (see the gap).

**Definition `teichmuller-character`** (planet: *Teichmüller character*) — The Teichmüller character of a prime of a number field. Let L be a number field and 𝔓 a nonzero prime of 𝓞_L whose residue field k = 𝓞_L/𝔓 has q elements, and suppose 𝓞_L contains a primitive (q − 1)-th root of unity (e.g. L ⊇ Q(ζ_(q−1))). Reduction modulo 𝔓 restricts to a group isomorphism μ_(q−1)(𝓞_L) ≃ kˣ. The Teichmüller character ω_𝔓 : MulChar k 𝓞_L sends a nonzero residue x̄ to the unique (q − 1)-th root of unity congruent to x modulo 𝔓, and 0 to 0. It has order q − 1 and generates the group of characters of k with values in 𝓞_L: every such character is ω_𝔓^(−a) for a unique a mod q − 1. For m ∣ q − 1, ω_𝔓^((q−1)/m) is the m-th power residue character modulo 𝔓 (x̄ ↦ the m-th root of unity ≡ x^((q−1)/m)); its inverse is Katre's character χ = ω^(−(q−1)/m).

Hypotheses and conventions: L a number field, 𝔓 a maximal ideal of 𝓞_L with finite residue field of q elements, and a primitive (q − 1)-th root of unity in 𝓞_L. Katre and Conrad define ω on Z[ζ_(q−1)]/𝔭 with 𝔭 a prime of Q(ζ_(q−1)); working with any L ⊇ Q(ζ_(q−1)) and 𝔓 above 𝔭 gives the same character (the residue fields agree when 𝔓/𝔭 has residue degree 1, as in L = Q(ζ_(p(q−1)))).

API: `teichmuller` (constructor: teichmuller 𝔓 hμ : MulChar (𝓞 L ⧸ 𝔓) (𝓞 L)); `teichmuller_mk_sub_mem` (characterisation: For x ∉ 𝔓: teichmuller (mk x) − x ∈ 𝔓); `teichmuller_pow_card_sub_one` (characterisation: For y ≠ 0: (teichmuller y)^(q − 1) = 1); `teichmuller_mk_of_pow_eq_one` (simp: If ζ^(q−1) = 1 then teichmuller (mk ζ) = ζ); `orderOf_teichmuller` (other: orderOf (teichmuller 𝔓 hμ) = q − 1); `exists_eq_teichmuller_zpow` (characterisation: Every χ : MulChar (𝓞 L ⧸ 𝔓) (𝓞 L) is teichmuller^k for some k); `teichmuller_zero` (simp: teichmuller 0 = 0).

Unit tests: For L = ℚ(i), 𝔓 = (2 + i): teichmuller (mk 3) = i (`test_teichmuller_gaussian`, computation); teichmuller (1 : 𝓞 L ⧸ 𝔓) = 1 and teichmuller 0 = 0 (`test_teichmuller_one`, degenerate); teichmuller (mk x) ≠ x in general: for L = ℚ(i), 𝔓 = (2 + i), teichmuller (mk 3) = i ≠ 3 (a 'lift the residue' definition fails) (`test_teichmuller_not_lift`, non-example); For every nonzero y, teichmuller y is a (q − 1)-th root of unity reducing to y: Ideal.Quotient.mk 𝔓 (teichmuller y) = y (`test_teichmuller_root_of_unity`, compatibility).

Uses: Conrad (1995), Theorems 1–2: Stickelberger's congruence and the Jacobi-sum congruence are statements about Gauss and Jacobi sums of powers of ω_𝔭; Katre, §3: the valuation of g(ω^(−α)) at the prime above 𝔭 is the digit sum of α; ClassicalArithmeticCompletion:CA.1 (power-residue-symbol, eisenstein-reciprocity): the m-th power residue character at 𝔭 is ω^((q−1)/m); CA.1 compares its residue symbol with it; FiniteFieldsAndCharacterSums:FF.1/hasse-davenport-product-relation: the product relation is proved for powers of the Teichmüller character.

Construction: The q − 1 roots of X^(q−1) − 1 in 𝓞_L have distinct reductions modulo 𝔓: Ideal.rootsOfUnityMapQuot_injective (absNorm 𝔓 = q ≠ 1). The reductions are q − 1 distinct elements of kˣ, which has q − 1 elements, so reduction μ_(q−1)(𝓞_L) → kˣ is a bijective group homomorphism; ω_𝔓 on kˣ is its inverse followed by the inclusion into 𝓞_L, extended by 0 (MulChar.ofUnitHom). ω_𝔓(ζ̄) = ζ for ζ ∈ μ_(q−1); so ω_𝔓 takes the value ζ_(q−1) of order q − 1 and has order q − 1 (orderOf divides q − 1: MulChar.orderOf_dvd_card_sub_one). The character group of k with values in 𝓞_L has at most q − 1 elements (MulChar.card_eq_card_units_of_hasEnoughRootsOfUnity with equality), so it is cyclic generated by ω_𝔓.

Acceptance: For L = Q(i), 𝔓 = (2 + i), k = Z[i]/(2 + i) ≅ F_5 and i ≡ −2 ≡ 3: ω_𝔓(3̄) = i. ω_𝔓(1̄) = 1 and ω_𝔓(0) = 0.

Rests on: library `Ideal.rootsOfUnityMapQuot_injective`, `MulChar.ofUnitHom`, `MulChar.orderOf_dvd_card_sub_one`, `MulChar.card_eq_card_units_of_hasEnoughRootsOfUnity`, `IsPrimitiveRoot`, `NumberField.RingOfIntegers`.

Sources: Katre, §3, p. 79; Conrad (1995), Introduction, p. 1.

**Lemma `prime-above-p-in-cyclotomic-compositum`** — The prime above p in Q(ζ_m, ζ_p). Let p be a prime, m ≥ 1 with p ∤ m, f the order of p modulo m, q = p^f, K = Q(ζ_m) ⊆ L = Q(ζ_(mp)) = Q(ζ_m, ζ_p), and 𝔭 a prime of 𝓞_K above p. Then: (a) 𝓞_K/𝔭 has q elements (inertia degree f, ramification index 1 over p); (b) there is a unique prime 𝔓 of 𝓞_L above 𝔭, with 𝔭𝓞_L = 𝔓^(p−1), e(𝔓/𝔭) = p − 1 and residue degree 1, so 𝓞_L/𝔓 ≅ 𝓞_K/𝔭 has q elements; (c) v_𝔓(ζ_p − 1) = 1 and v_𝔓(p) = p − 1; (d) (ζ_p − 1)^(p−1) = −p·u with u a unit congruent to 1 modulo ζ_p − 1. For m = q − 1, 𝓞_L contains μ_(q−1), so the Teichmüller character of 𝔓 is defined (FiniteFieldsAndCharacterSums:FF.1/teichmuller-character).

Hypotheses and conventions: p ∤ m; L and K cyclotomic over ℚ with K ⊆ L. For p = 2: ζ_2 = −1, L = K, 𝔓 = 𝔭 and all statements hold with p − 1 = 1.

Proof: (a): IsCyclotomicExtension.Rat.inertiaDeg_eq_of_not_dvd (f = orderOf (p : ZMod m)) and IsCyclotomicExtension.Rat.ramificationIdx_eq_of_not_dvd (= 1). (b): for n = p^1·m every prime of 𝓞_L above p has ramification index p − 1 and inertia degree f over ℤ (IsCyclotomicExtension.Rat.ramificationIdx_eq, IsCyclotomicExtension.Rat.inertiaDeg_eq); by multiplicativity in the tower ℤ ⊆ 𝓞_K ⊆ 𝓞_L (Ideal.ramificationIdx_tower, Ideal.inertiaDeg_tower), e(𝔓/𝔭) = p − 1 and f(𝔓/𝔭) = 1 for every 𝔓 above 𝔭; the fundamental identity Σ e·f = [L : K] = p − 1 (Ideal.sum_ramification_inertia) forces a unique 𝔓. (c): (ζ_p − 1) is the unique prime of Q(ζ_p) above p, with p = unit·(ζ_p − 1)^(p−1) (IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'); 𝔓 lies over it with ramification index (p − 1)/(p − 1) = 1 (towers again), so v_𝔓(ζ_p − 1) = 1, v_𝔓(p) = p − 1. (d): p = ∏_{c=1}^{p−1}(1 − ζ_p^c) and (1 − ζ_p^c)/(1 − ζ_p) = 1 + ζ_p + ⋯ + ζ_p^(c−1) ≡ c (mod ζ_p − 1), so p/(1 − ζ_p)^(p−1) ≡ (p − 1)! ≡ −1 (ZMod.wilsons_lemma), i.e. (ζ_p − 1)^(p−1) = (−1)^(p−1)(1 − ζ_p)^(p−1) = −p·u with u ≡ 1.

Acceptance: p = 3, m = 2: f = 1, q = 3, K = Q(ζ_2) = Q, L = Q(ζ_3), 𝔓 = (1 − ζ_3) and 3 = −ζ_3²(1 − ζ_3)². p = 5, m = 4: f = 1, K = Q(i), 𝔭 = (2 ± i), L = Q(ζ_20), e(𝔓/𝔭) = 4.

Rests on: library `IsCyclotomicExtension.Rat.inertiaDeg_eq_of_not_dvd`, `IsCyclotomicExtension.Rat.ramificationIdx_eq_of_not_dvd`, `IsCyclotomicExtension.Rat.ramificationIdx_eq`, `IsCyclotomicExtension.Rat.inertiaDeg_eq`, `Ideal.ramificationIdx_tower`, `Ideal.inertiaDeg_tower`, `Ideal.sum_ramification_inertia`, `IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'`, `ZMod.wilsons_lemma`.

Sources: Katre, §3, p. 79; Conrad (1995), Proof that Theorem 1 implies Theorem 2, p. 8.

**Definition `multi-jacobi-sum`** — Jacobi sums of several multiplicative characters. Let F be a finite field and χ_1, …, χ_r : MulChar F R (r ≥ 1). The Jacobi sum is J(χ_1, …, χ_r) := Σ_{x ∈ F^r, x_1 + ⋯ + x_r = 1} χ_1(x_1)⋯χ_r(x_r) (multiJacobiSum), with Mathlib's convention χ(0) = 0 for every character; J_0(χ_1, …, χ_r) is the same sum over x_1 + ⋯ + x_r = 0. For r = 2 it is Mathlib's jacobiSum, for r = 1 it is χ_1(1) = 1. Conrad's normalised Jacobi sum is (−1)^(r−1)·J (Conrad 1995, p. 2).

Hypotheses and conventions: r ≥ 1; characters indexed by Fin r; R a commutative ring.

API: `multiJacobiSum` (constructor: multiJacobiSum χ = Σ_{x : Fin r → F, Σ x = 1} ∏ χ_i(x_i)); `multiJacobiSum_two` (compatibility: multiJacobiSum ![χ, φ] = jacobiSum χ φ); `multiJacobiSum_one` (simp: multiJacobiSum ![χ] = 1); `multiJacobiSum_perm` (relation: multiJacobiSum (χ ∘ σ) = multiJacobiSum χ for a permutation σ); `multiJacobiSum_ringHomComp` (functoriality: multiJacobiSum (fun i ↦ (χ i).ringHomComp f) = f (multiJacobiSum χ)); `multiJacobiSumZero` (data: The sum over x_1 + ⋯ + x_r = 0); `normalizedMultiJacobiSum` (data: (−1)^(r−1) · multiJacobiSum χ (Conrad's normalisation)).

Unit tests: multiJacobiSum ![χ, φ] = jacobiSum χ φ (`test_multiJacobiSum_two`, compatibility); multiJacobiSum ![χ] = 1 (`test_multiJacobiSum_one`, degenerate); multiJacobiSum ![1, 1, 1] = q² − 3q + 3 (as an element of R) (`test_multiJacobiSum_trivial_three`, computation); For χ ≠ 1: multiJacobiSum ![χ, χ⁻¹, φ] ≠ jacobiSum χ χ⁻¹ · jacobiSum (χ * χ⁻¹) φ in general (Conrad's Remark 2: the iterated formula needs χ_1χ_2 ≠ 1); over F_5 with χ of order 4 and φ = χ the two sides differ (`test_multiJacobiSum_not_iterated`, non-example).

Uses: Conrad (1995), Lemma 1 and Theorem 2: the digit decomposition of Stickelberger's congruence uses Jacobi sums of f characters; FiniteFieldsAndCharacterSums:FF.1/gauss-sum-product-and-multi-jacobi-sum: the product of r Gauss sums is a Gauss sum times the multi-Jacobi sum; Kowalski, Definition 2.12: the case r = 2.

Construction: Definition as a finite sum over {x : Fin r → F | Σ x_i = 1}. r = 2: the fibre {x_1 + x_2 = 1} is parametrised by x_1, giving Σ_x χ_1(x)χ_2(1 − x) = jacobiSum. Symmetry: permuting the characters permutes the coordinates of the fibre. All trivial: the number of (x_1, …, x_r) ∈ (Fˣ)^r with Σ x_i = 1 is ((q − 1)^r − (−1)^r)/q (inclusion–exclusion on the coordinates that vanish).

Acceptance: r = 2, all trivial: q − 2 (jacobiSum_one_one). r = 3, all trivial: ((q−1)^3 + 1)/q = q² − 3q + 3.

Rests on: library `jacobiSum`, `jacobiSum_one_one`, `jacobiSum_ringHomComp`.

Sources: Conrad (1995), Introduction, p. 2; Conrad (1995), Remarks after Theorem 2, p. 4.

**Lemma `gauss-sum-product-and-multi-jacobi-sum`** — Products of Gauss sums and Jacobi sums of several characters. Let F be a finite field with q elements, R a domain, ψ : AddChar F R primitive and χ_1, …, χ_r : MulChar F R. (a) If χ_1⋯χ_r ≠ 1, then ∏_i gaussSum χ_i ψ = gaussSum (χ_1⋯χ_r) ψ · J(χ_1, …, χ_r). (b) If χ_1⋯χ_r = 1 but some χ_i ≠ 1, then ∏_i gaussSum χ_i ψ = −q·J(χ_1, …, χ_r). In Conrad's normalisation G = −gaussSum, J_C = (−1)^(r−1)J these read G(χ_1⋯χ_r) = G(χ_1)⋯G(χ_r)/J_C and J_C = (1/q)G(χ_1)⋯G(χ_r).

Hypotheses and conventions: ψ primitive; R a domain (orthogonality).

Proof: Expand: ∏_i gaussSum χ_i ψ = Σ_{t ∈ F} ψ(t)·Σ_{x_1+⋯+x_r = t} ∏χ_i(x_i). For t ≠ 0 substitute x_i = t·y_i: the inner sum is (χ_1⋯χ_r)(t)·J(χ_1, …, χ_r). For t = 0 the inner sum is J_0. In case (a), J_0 = (χ_1⋯χ_r)(t)·J_0 for every t ≠ 0 (same substitution), so J_0 = 0; the total is J·Σ_{t≠0}(χ_1⋯χ_r)(t)ψ(t) = J·gaussSum (χ_1⋯χ_r) ψ. In case (b), the inner sums for t ≠ 0 all equal J (the product character is trivial) and Σ_{t≠0} ψ(t) = −1 (AddChar.sum_eq_zero_of_ne_one), so the total is −J + J_0. Summing the inner sums over all t gives ∏_i Σ_x χ_i(x) = 0 (some χ_i ≠ 1: MulChar.sum_eq_zero_of_ne_one), i.e. (q − 1)J + J_0 = 0; hence the total is −J − (q − 1)J = −q·J. r = 2: (a) is Mathlib's jacobiSum_mul_nontrivial and (b) is gaussSum χ ψ·gaussSum χ⁻¹ ψ = χ(−1)q with J(χ, χ⁻¹) = −χ(−1) (jacobiSum_nontrivial_inv).

Acceptance: r = 2, χ_2 = χ_1⁻¹ ≠ 1: g(χ)g(χ⁻¹) = χ(−1)q = −q·(−χ(−1)). r = 1: (a) is g(χ) = g(χ)·1.

Rests on: nodes `multi-jacobi-sum`; library `jacobiSum_mul_nontrivial`, `jacobiSum_nontrivial_inv`, `gaussSum_mul_gaussSum_eq_card`, `gaussSum_mulShift`, `AddChar.sum_eq_zero_of_ne_one`, `MulChar.sum_eq_zero_of_ne_one`.

Sources: Conrad (1995), Lemma 1, p. 2; Conrad (1995), Lemma 3, p. 7; Katre, Proposition 1(f), p. 76.

**Lemma `multinomial-coefficient-congruences`** — Multinomial coefficient congruences modulo p. Let p be a prime. For integers b and n_1, …, n_t ≥ 0 write (b; n_1, …, n_t) := b(b − 1)⋯(b − n_1 − ⋯ − n_t + 1)/(n_1!⋯n_t!) ∈ ℤ (the coefficient of X_1^(n_1)⋯X_t^(n_t) in (1 + X_1 + ⋯ + X_t)^b). (C1) If every n_i < p^d then (b + p^d; n_1, …, n_t) ≡ (b; n_1, …, n_t) (mod p). (C2, Lucas–Dickson) If m_0 = Σ_{i<d} c_i p^i + c_d p^d and m_j = Σ_{i<d} c_(ij) p^i + c_(dj) p^d with 0 ≤ c_i, c_(ij) ≤ p − 1 for i < d, then (m_0; m_1, …, m_t) ≡ ∏_{i=0}^{d} (c_i; c_(i1), …, c_(it)) (mod p). In particular, for 0 ≤ a < q = p^f with base-p digits a_i, (a; a_0, a_1p, …, a_(f−2)p^(f−2)) ≡ 1 (mod p).

Hypotheses and conventions: b ∈ ℤ may be negative in (C1) (used with b = k_1 + ⋯ + k_r − q); the multinomial with integer top is a product of generalised binomial coefficients (Ring.choose on ℤ).

Proof: (C1): in F_p[[X_1, …, X_t]], (1 + ΣX_j)^(b+p^d) = (1 + ΣX_j)^b·(1 + ΣX_j^(p^d)) (Frobenius in characteristic p); monomials with all exponents < p^d receive only the term 1 of the second factor. (C2): induct on d using (1 + ΣX_j)^(m_0) = (1 + ΣX_j)^(c_0)·((1 + ΣX_j)^p)^((m_0 − c_0)/p) = (1 + ΣX_j)^(c_0)·(1 + ΣX_j^p)^((m_0−c_0)/p) in F_p[X_1, …, X_t] and compare coefficients; t = 1 is Lucas's theorem (Choose.lucas_theorem). The digit corollary: with m_0 = a and m_j = a_(j−1)p^(j−1) every factor on the right is (c_i; 0, …, c_i, …, 0) = 1.

Acceptance: Lucas (t = 1, p = 5): 7 = 1·5 + 2 and 3 = 0·5 + 3, so (7 choose 3) = 35 ≡ (2 choose 3)(1 choose 0) = 0 (mod 5). The binomial case t = 1 is Mathlib's Choose.lucas_theorem.

Rests on: library `Choose.lucas_theorem`, `Nat.multinomial`, `Nat.multinomial_spec`, `Ring.choose`.

Sources: Conrad (1995), C1 and C2 with proofs, p. 3.

**Theorem `jacobi-sum-teichmuller-congruence`** — The Jacobi-sum congruence for Teichmüller characters. Let p be prime, q = p^f, and 𝔭 a prime of Q(ζ_(q−1)) above p (or 𝔓 as in FiniteFieldsAndCharacterSums:FF.1/prime-above-p-in-cyclotomic-compositum), with Teichmüller character ω = ω_𝔭. For r ≥ 1 and 0 ≤ k_1, …, k_r < q − 1 with some k_j > 0: (−1)^(r−1) J(ω^(−k_1), …, ω^(−k_r)) ≡ (k_1 + ⋯ + k_r)!/(k_1!⋯k_r!) (mod 𝔭). If all k_j = 0 the congruence fails: the left side is ≡ r (mod p).

Hypotheses and conventions: 0 ≤ k_j < q − 1, not all zero; J is FiniteFieldsAndCharacterSums:FF.1/multi-jacobi-sum; the right side is Nat.multinomial.

Proof: By symmetry assume k_r > 0. Modulo 𝔭, ω^(−k)(α) ≡ α^(−k) for α ≢ 0 and ω(1 − Σα)^(q−1−k_r) ≡ (1 − Σα)^(q−1−k_r), the latter also for 1 − Σα ≡ 0 since q − 1 − k_r ≥ 1. Expand (1 − α_1 − ⋯ − α_(r−1))^(q−1−k_r) multinomially and use Σ_{α ∈ F_q^×} α^j = −1 if (q − 1) ∣ j and 0 otherwise: only the terms with n_i = k_i survive (the exponents n_i − k_i lie in (−(q−1), q − 1)). If k_1 + ⋯ + k_(r−1) > q − 1 − k_r the sum is 0; otherwise the value is (q − 1 − k_r; k_1, …, k_(r−1))·(−1)^(k_1+⋯+k_(r−1)) = (k_1 + ⋯ + k_r − q; k_1, …, k_(r−1)) (upper negation), which is 0 in the first case as well. (C1) with p^d = q (FiniteFieldsAndCharacterSums:FF.1/multinomial-coefficient-congruences) replaces k_1 + ⋯ + k_r − q by k_1 + ⋯ + k_r, giving the multinomial (k_1 + ⋯ + k_r)!/(k_1!⋯k_r!).

Acceptance: r = 2, k_2 = 1: (−1)·J(ω^(−a), ω^(−1)) ≡ a + 1 (mod 𝔭) (the classical case used in the base induction of Stickelberger's congruence). All k_j = 0: the normalised Jacobi sum of r trivial characters is (1 − (1 − q)^r)/q ≡ r (mod p), not 1.

Rests on: nodes `teichmuller-character`, `multi-jacobi-sum`, `multinomial-coefficient-congruences`; library `Nat.multinomial`, `FiniteField.sum_pow_units`.

Sources: Conrad (1995), Theorem 2 and its proof, pp. 3–4.

**Lemma `gauss-sum-teichmuller-base-congruence`** — The Gauss sum of the inverse Teichmüller character modulo 𝔓². In the setting of FiniteFieldsAndCharacterSums:FF.1/prime-above-p-in-cyclotomic-compositum with m = q − 1, let ω = ω_𝔓 be the Teichmüller character and ψ = traceAddChar with ζ_p ∈ 𝓞_L. Then gaussSum ω⁻¹ ψ ≡ −(ζ_p − 1) (mod 𝔓²); in Katre's and Conrad's normalisation, g(ω^(−1)) = −gaussSum ω⁻¹ ψ ≡ ζ_p − 1 (mod 𝔓²). Consequently v_𝔓(gaussSum ω⁻¹ ψ) = 1.

Hypotheses and conventions: p any prime (Katre states p odd; the computation below does not use it: for p = 2, ζ_2 − 1 = −2 and 𝔓² ⊇ (4)).

Proof: Write π = ζ_p − 1 ∈ 𝔓 and ζ_p^t = (1 + π)^t ≡ 1 + tπ (mod π²) for an integer representative t ∈ {0, …, p − 1} of Tr(a). So −gaussSum ω⁻¹ ψ ≡ −Σ_a ω⁻¹(a)(1 + Tr(a)π) ≡ −π Σ_a ω⁻¹(a)Tr(a) (mod 𝔓²), since Σ_a ω⁻¹(a) = 0 (MulChar.sum_eq_zero_of_ne_one). Modulo 𝔓 (∩ Z[ζ_(q−1)] = 𝔭), ω⁻¹(a) ≡ a^(−1) and Tr(a) = a + a^p + ⋯ + a^(p^(f−1)), so Σ_a ω⁻¹(a)Tr(a) ≡ Σ_{a ≠ 0} Σ_b a^(p^b − 1) ≡ −1: the term b = 0 contributes q − 1 ≡ −1 and 0 < p^b − 1 < q − 1 for 0 < b < f (FiniteField.sum_pow_units). π·𝔓 ⊆ 𝔓², so −gaussSum ω⁻¹ ψ ≡ π (mod 𝔓²), and v_𝔓(π) = 1 (part (c) of the setup lemma) gives valuation 1.

Acceptance: q = p = 3: ω is the character of order 2 of F_3 (ω(1) = 1, ω(2) = −1), ψ(x) = ζ_3^x, and −gaussSum ω⁻¹ ψ = −(ζ_3 − ζ_3²) = ζ_3(ζ_3 − 1) ≡ ζ_3 − 1 (mod (ζ_3 − 1)²) since ζ_3 ≡ 1.

Rests on: nodes `teichmuller-character`, `prime-above-p-in-cyclotomic-compositum`, `canonical-additive-character`; library `MulChar.sum_eq_zero_of_ne_one`, `FiniteField.sum_pow_units`, `FiniteField.algebraMap_trace_eq_sum_pow`.

Sources: Katre, Lemma 3 and its proof, p. 80.

**Theorem `stickelberger-congruence`** (planet: *Stickelberger's congruence*) — Stickelberger's congruence for Gauss sums. Let p be a prime, q = p^f, L = Q(ζ_(p(q−1))), 𝔓 a prime of 𝓞_L above p, ω = ω_𝔓 the Teichmüller character of its residue field F_q and ψ(x) = ζ_p^(Tr x) (traceAddChar with ζ_p ∈ 𝓞_L). For 0 ≤ a < q − 1 with base-p digits a = a_0 + a_1p + ⋯ + a_(f−1)p^(f−1), put s(a) = a_0 + ⋯ + a_(f−1) and h(a) = a_0!⋯a_(f−1)!. Then G(ω^(−a)) := −gaussSum (ω^(−a)) ψ satisfies h(a)·G(ω^(−a)) ≡ (ζ_p − 1)^(s(a)) (mod 𝔓^(s(a)+1)); equivalently G(ω^(−a))/(ζ_p − 1)^(s(a)) ≡ 1/h(a) (mod 𝔓), h(a) being prime to p.

Hypotheses and conventions: p any prime (Conrad's theorem has no parity hypothesis); 0 ≤ a < q − 1. The sign normalisation G = −gaussSum is Conrad's (Katre's g); with Mathlib's sign the right side is (−1)·(ζ_p − 1)^(s(a)).

Proof: a = 0: G(1) = −gaussSum 1 ψ = 1 (gaussSum_one_left), and s(0) = 0, h(0) = 1. a = 1: FiniteFieldsAndCharacterSums:FF.1/gauss-sum-teichmuller-base-congruence. Induction for 1 ≤ a ≤ p − 1 (a < q − 2 at each step): by FiniteFieldsAndCharacterSums:FF.1/gauss-sum-product-and-multi-jacobi-sum (a), G(ω^(−(a+1))) = G(ω^(−a))G(ω^(−1))/J_C(ω^(−a), ω^(−1)), and J_C(ω^(−a), ω^(−1)) ≡ a + 1 (mod 𝔓) (FiniteFieldsAndCharacterSums:FF.1/jacobi-sum-teichmuller-congruence), a unit for a + 1 < p; with v_𝔓(ζ_p − 1) = 1 this gives G(ω^(−a)) ≡ (ζ_p − 1)^a/a! (mod 𝔓^(a+1)) for 0 ≤ a ≤ p − 1 (a < p − 1 if q = p). General a (q > p): some digit is positive, so ω^(−a) and ω^(−a_i p^i) are nontrivial; Lemma (a) with the f characters ω^(−a_i p^i) gives G(ω^(−a)) = ∏_i G(ω^(−a_i p^i))/J_C(ω^(−a_0), …, ω^(−a_(f−1)p^(f−1))), and G(ω^(−a_i p^i)) = G(ω^(−a_i)) (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-frobenius-invariance). The numerator is ≡ (ζ_p − 1)^(s(a))/h(a) (mod 𝔓^(s(a)+1)) by the previous step (each a_i ≤ p − 1); the Jacobi sum is ≡ (a; a_0, a_1p, …, a_(f−2)p^(f−2)) ≡ 1 (mod 𝔓) by the Jacobi congruence and (C2) (FiniteFieldsAndCharacterSums:FF.1/multinomial-coefficient-congruences), so it is a 𝔓-unit ≡ 1 and the quotient satisfies the congruence.

Acceptance: q = p: G(ω^(−a)) ≡ (ζ_p − 1)^a/a! (mod 𝔓^(a+1)) for 0 ≤ a < p − 1. v_𝔓(G(ω^(−a))) = s(a) (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-valuation-digit-sum). q = 4, a = 2 (digits 0, 1): s = 1, h = 1, G(ω^(−2)) ≡ ζ_2 − 1 = −2 (mod 𝔓²), consistent with G(ω^(−2)) = G(ω^(−1)) by Frobenius invariance.

Rests on: nodes `gauss-sum-teichmuller-base-congruence`, `gauss-sum-product-and-multi-jacobi-sum`, `jacobi-sum-teichmuller-congruence`, `gauss-sum-frobenius-invariance`, `multinomial-coefficient-congruences`, `prime-above-p-in-cyclotomic-compositum`, `teichmuller-character`; library `gaussSum_one_left`, `Nat.digits`.

Sources: Conrad (1995), Theorem 1, p. 2; Conrad (1995), Proof of Theorem 1, p. 5.

**Theorem `gauss-sum-valuation-digit-sum`** — The valuation of a Teichmüller Gauss sum is a digit sum. In the setting of FiniteFieldsAndCharacterSums:FF.1/stickelberger-congruence, for 0 ≤ a < q − 1: v_𝔓(gaussSum (ω^(−a)) ψ) = s(a), the sum of the base-p digits of a. The function s(α) := v_𝔓(gaussSum (ω^(−α)) ψ) (α mod q − 1) satisfies s(0) = 0, s(α + β) ≤ s(α) + s(β), s(α + β) ≡ s(α) + s(β) (mod p − 1), s(pα) = s(α), s(α) + s(q − 1 − α) = f(p − 1) for α ≢ 0, and s(α) = (p − 1)Σ_{i<f} {p^i α/(q − 1)} for 0 ≤ α < q − 1.

Hypotheses and conventions: p any prime; 𝔓, ω, ψ as in the Stickelberger congruence.

Proof: Direct route: h(a) is prime to p, so the Stickelberger congruence gives G(ω^(−a)) = (ζ_p − 1)^(s(a))·(unit), and v_𝔓(ζ_p − 1) = 1. Katre's route (independent of the congruence): s(0) = 0 (g(1) = ±1); subadditivity and the congruence mod p − 1 because g(ω^(−α))g(ω^(−β))/g(ω^(−α−β)) is a Jacobi sum, an algebraic integer of Q(ζ_(q−1)), whose 𝔓-valuations are multiples of p − 1 = e(𝔓/𝔭); s(pα) = s(α) by Frobenius invariance; s(α) + s(q − 1 − α) = v_𝔓(q) = f(p − 1) from g(χ)g(χ⁻¹) = ±q; s(1) = 1 (base congruence); these force s(α) = α for α ≤ p − 2, s(p − 1) = p − 1, s(α) ≤ digit sum, and equality by comparing Σ_α s(α) = (q − 2)f(p − 1)/2 with the sum of digit sums. The fractional-part formula: p^i α ≡ a_0p^i + ⋯ + a_(f−1)p^(i−1) (mod q − 1) with the right side < q − 1, so Σ_i {p^iα/(q−1)} = (Σ a_i)(1 + p + ⋯ + p^(f−1))/(q − 1) = s(α)/(p − 1) (Katre, Lemma 4).

Acceptance: s(1) = 1, s(p) = 1, s(q − 2) = f(p − 1) − 1. For q = p, s(a) = a.

Rests on: nodes `stickelberger-congruence`, `gauss-sum-teichmuller-base-congruence`, `prime-above-p-in-cyclotomic-compositum`; library `Ideal.count_normalizedFactors_eq`, `Nat.digits`, `Nat.modEq_digits_sum`.

Sources: Katre, Proposition 2, p. 81; Katre, Lemma 2, pp. 79–80, and Lemma 4, p. 83.

**Theorem `prime-factorisation-of-gauss-sums`** — The prime factorisation of Gauss sums. Let m ≥ 2, p a prime not dividing m, f the order of p modulo m, q = p^f; ℘_0 a prime of Q(ζ_m) above p and ℘̃_0 the prime of Q(ζ_m, ζ_p) above it; P_0 a prime of Q(ζ_(q−1)) above ℘_0 with Teichmüller character ω = ω_(P_0) and χ := ω^(−(q−1)/m), a character of order m of F_q ≅ Z[ζ_m]/℘_0 with values in μ_m (the inverse of the m-th power residue character at ℘_0). For a prime to m let σ_a ∈ Gal(Q(ζ_m, ζ_p)/Q) be ζ_m ↦ ζ_m^a, ζ_p ↦ ζ_p, and let R be a set of representatives of (ℤ/m)ˣ modulo the subgroup generated by p. Then for k ≢ 0 (mod m), with g(χ^k) = −gaussSum (χ^k) ψ (ψ = ζ_p^Tr), the principal ideal (g(χ^k)) of Q(ζ_m, ζ_p) equals ∏_{a ∈ R} (σ_a^(−1) ℘̃_0)^(s(k·a·(q−1)/m)), s being the base-p digit sum of the least nonnegative residue modulo q − 1.

Hypotheses and conventions: p ∤ m (p = 2 allowed); k ≢ 0 (mod m). The primes σ_a^(−1)℘̃_0, a ∈ R, are the distinct primes of Q(ζ_m, ζ_p) above p.

Proof: Only primes above p divide g(χ^k): g(χ^k)·g(χ^(−k)) = ±q (gaussSum_mul_gaussSum_eq_card, FiniteFieldsAndCharacterSums:FF.1/gauss-sum-absolute-value). The primes above p in Q(ζ_m, ζ_p) are the conjugates σ^(−1)℘̃_0; σ ranges over Gal, the stabiliser of ℘_0 in Gal(Q(ζ_m)/Q) is ⟨σ_p⟩ (the decomposition group of the unramified p is generated by Frobenius), and ℘̃_0 is the only prime above ℘_0 (FiniteFieldsAndCharacterSums:FF.1/prime-above-p-in-cyclotomic-compositum); so they are σ_a^(−1)℘̃_0, a ∈ R (Ideal.exists_smul_eq_of_isGaloisGroup for transitivity). v_(σ_a^(−1)℘̃_0)(g(χ^k)) = v_(℘̃_0)(σ_a g(χ^k)) = v_(℘̃_0)(g(χ^(ka))) by FiniteFieldsAndCharacterSums:FF.1/gauss-sum-galois-conjugation (σ_a fixes ζ_p). v_(℘̃_0) = v_(P̃_0) on Q(ζ_m, ζ_p) because P̃_0/℘̃_0 is unramified, and χ^(ka) = ω^(−ka(q−1)/m), so the valuation is s(ka(q−1)/m) (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-valuation-digit-sum).

Acceptance: m = 2, p odd (f = 1, q = p): χ is the Legendre character and (g(χ)) = ℘̃_0^(s((p−1)/2)) = ℘̃_0^((p−1)/2), consistent with g(χ)² = ±p and v_(℘̃_0)(p) = p − 1. The exponents over all conjugates add up to v(q) = f(p − 1) on (g(χ^k)g(χ^(−k))).

Rests on: nodes `gauss-sum-valuation-digit-sum`, `gauss-sum-galois-conjugation`, `prime-above-p-in-cyclotomic-compositum`, `gauss-sum-absolute-value`, `teichmuller-character`; library `gaussSum_mul_gaussSum_eq_card`, `Ideal.exists_smul_eq_of_isGaloisGroup`, `IsCyclotomicExtension.autEquivPow`.

Sources: Katre, Propositions 3 and 3′, pp. 81–82.

**Theorem `stickelberger-relation`** (planet: *Stickelberger's theorem on Gauss sums*) — Stickelberger's theorem on the factorisation of Gauss sums. With m, p, f, q, ℘_0, χ = χ_(℘_0) (the inverse of the m-th power residue character at ℘_0) as in FiniteFieldsAndCharacterSums:FF.1/prime-factorisation-of-gauss-sums, and θ := Σ_{1 ≤ a ≤ m, (a, m) = 1} (a/m)·σ_a^(−1) ∈ Q[Gal(Q(ζ_m)/Q)] the Stickelberger element: g(χ)^m lies in Q(ζ_m), and as ideals of Q(ζ_m), (g(χ)^m) = ℘_0^(mθ) = ∏_{1 ≤ a ≤ m, (a,m)=1} (σ_a^(−1)℘_0)^a. This is the relation (Φ(P)) = P^γ, γ = Σ t·σ_t^(−1), used in the proof of Eisenstein reciprocity.

Hypotheses and conventions: p ∤ m, p any prime; ℘^(Σ x_σ σ) := ∏ σ(℘)^(x_σ). The sign of g is irrelevant for the ideal.

Proof: g(χ)^m ∈ Q(ζ_m): every τ_c (ζ_m fixed, ζ_p ↦ ζ_p^c) multiplies g(χ) by χ(c)^(−1), an m-th root of unity (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-galois-conjugation). By the prime factorisation (k = 1), (g(χ)^m) = ℘̃_0^(m Σ_{a∈R} s(a(q−1)/m) σ_a^(−1)); with s(ad) = (p − 1)Σ_{i<f}{p^i a/m} (Katre, Lemma 4; FiniteFieldsAndCharacterSums:FF.1/gauss-sum-valuation-digit-sum) the exponent is m(p − 1)Σ_{i<f}Σ_{a∈R}{p^i a/m}σ_a^(−1). ℘̃_0^(p−1) = ℘_0 and σ_(p^i) fixes ℘_0, so ℘̃_0^(m(p−1)Σ_iΣ_R{p^ia/m}σ_a^(−1)) = ℘_0^(m Σ_{b mod m, (b,m)=1} {b/m} σ_b^(−1)) = ℘_0^(mθ) in Q(ζ_m, ζ_p) (b = p^i a runs once over (ℤ/m)ˣ). Extension of ideals from Q(ζ_m) to Q(ζ_m, ζ_p) is injective (unique factorisation of ideals in Dedekind domains), so the equality holds in Q(ζ_m).

Acceptance: m = 3, p ≡ 1 (mod 3) (f = 1), ℘_0 = (π): mθ = σ_1 + 2σ_2^(−1), so (g(χ)^3) = (π·π̄²); this matches g(χ)^3 = p·J(χ, χ) with J(χ, χ) = conj J(χ_π, χ_π) = π̄, since χ = χ_π^(−1) and CA.1 proves J(χ_π, χ_π) = π. m = 2 (K = Q, ℘_0 = pℤ): (g(χ)^2) = (p), i.e. g(χ)^2 = ±p.

Rests on: nodes `prime-factorisation-of-gauss-sums`, `gauss-sum-galois-conjugation`, `gauss-sum-valuation-digit-sum`, `prime-above-p-in-cyclotomic-compositum`; library `IsCyclotomicExtension.autEquivPow`, `Ideal.count_normalizedFactors_eq`.

Sources: Katre, Proposition 4(i) and its proof, pp. 83–84; Katre, Lemma 4, p. 83.

**Theorem `prime-factorisation-of-jacobi-sums`** — The prime factorisation of Jacobi sums. With the notation of FiniteFieldsAndCharacterSums:FF.1/stickelberger-relation, let j, k be integers with jk(j + k) ≢ 0 (mod m). Then, as ideals of Q(ζ_m), (J(χ^j, χ^k)) = ℘_0^(θ_(j,k)) with θ_(j,k) = Σ_{a mod m, (a,m)=1} (⌊(j + k)a/m⌋ − ⌊ja/m⌋ − ⌊ka/m⌋)·σ_a^(−1) ∈ ℤ[G], whose coefficients are 0 or 1.

Hypotheses and conventions: jk(j + k) ≢ 0 (mod m), so χ^j, χ^k and χ^(j+k) are nontrivial.

Proof: J(χ^j, χ^k) = g(χ^j)g(χ^k)/g(χ^(j+k)) (jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum; signs cancel in ideals). Raise to the m-th power and use (g(χ^j)^m) = ℘_0^(mθ_j), θ_j = Σ_a {ja/m}σ_a^(−1) (the argument of the Stickelberger relation with χ^j): (J^m) = ℘_0^(m(θ_j + θ_k − θ_(j+k))). {x} + {y} − {x + y} = ⌊x + y⌋ − ⌊x⌋ − ⌊y⌋ ∈ {0, 1}, so θ_j + θ_k − θ_(j+k) = θ_(j,k) ∈ ℤ[G]; unique factorisation in Q(ζ_m) takes the m-th root of the ideal equation.

Acceptance: m = 3, j = k = 1, p ≡ 1 (mod 3), ℘_0 = (π): the coefficient at a = 1 is ⌊2/3⌋ − 0 − 0 = 0 and at a = 2 it is ⌊4/3⌋ − ⌊2/3⌋ − ⌊2/3⌋ = 1, so θ_(1,1) = σ_2^(−1) and (J(χ, χ)) = (π̄), matching J(χ, χ) = π̄ for χ = χ_π^(−1).

Rests on: nodes `stickelberger-relation`; library `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `Int.fract`.

Sources: Katre, Proposition 4(ii), p. 83.

**Theorem `hasse-davenport-product-relation`** — The Hasse–Davenport product relation. Let F be a finite field with q elements, n ∣ q − 1, λ a multiplicative character of F of order exactly n (values in ℂ), ψ a nontrivial additive character and χ any multiplicative character. Then gaussSum (χ^n) ψ · ∏_{j=1}^{n−1} gaussSum (λ^j) ψ = χ(n)^n · ∏_{j=0}^{n−1} gaussSum (χλ^j) ψ, where χ(n) is χ evaluated at the image of the integer n in F. Equivalently ∏_{j=0}^{n−1} g(χλ^j) = −χ(n)^(−n) g(χ^n) ∏_{j=0}^{n−1} g(λ^j) (the j = 0 factor g(1) = −1). For n = 2 this is the duplication formula (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-duplication-formula).

Hypotheses and conventions: n ∣ q − 1 (so n is prime to p and χ(n) ≠ 0); λ of order n; ψ ≠ 1.

Proof: Reduction to one additive character: replacing ψ by ψ(a·) multiplies both sides by the same power of χ(a)⁻¹λ(a)⁻¹ (shift identity, FiniteFieldsAndCharacterSums:FF.1/gauss-sum-transport); so take ψ = ζ_p^Tr and realise F as the residue field of a prime 𝔓 of L = Q(ζ_(p(q−1))), with χ = ω^(−a), λ = ω^(−(q−1)/n) (FiniteFieldsAndCharacterSums:FF.1/teichmuller-character). Let ρ be the ratio of the two sides. Every Gauss sum of a nontrivial character has absolute value √q at every complex embedding, and g(1) = −1 (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-absolute-value); counting trivial characters on both sides shows |ρ| = 1 at every embedding. ρ is a unit: only primes above p divide the Gauss sums, and at each of them the valuations agree by the digit-sum formula (FiniteFieldsAndCharacterSums:FF.1/gauss-sum-valuation-digit-sum, FiniteFieldsAndCharacterSums:FF.1/prime-factorisation-of-gauss-sums) together with the multiplication formula for fractional parts Σ_{j<n}{x + j/n} = {nx} + (n − 1)/2 (Katre's Lemma 4 form of s). A unit all of whose conjugates have absolute value 1 is a root of unity; comparing the leading terms of Stickelberger's congruence (FiniteFieldsAndCharacterSums:FF.1/stickelberger-congruence) on both sides determines it modulo 𝔓, and the roots of unity of L are distinct modulo 𝔓 up to the p-power ones, which identifies ρ = 1. This last step needs the multiplication formula for the digit factorials h(a) modulo p (the Gauss multiplication formula for the p-adic Gamma function modulo p); no public source with its proof was read (see the gap).

Acceptance: n = 2: the duplication formula. χ = λ: both sides equal g(1) = −1 up to the factor λ(n)^n = 1 (Conrad, footnote 9).

Rests on: nodes `gauss-sum-duplication-formula`, `stickelberger-congruence`, `gauss-sum-valuation-digit-sum`, `prime-factorisation-of-gauss-sums`, `gauss-sum-absolute-value`, `gauss-sum-transport`, `teichmuller-character`.

Sources: Conrad, Gauss and Jacobi sums, (A.6), p. 19.

### 5. Harmonic analysis on F_q((1/T)) and measures on ℤ

These nodes supply the Fourier-analytic carriers of Bary-Soroker–Koukoulopoulos–Kozma, §§2.4, 3.5, 4 and 6. The general local residue characters and self-dual Haar measures of function fields belong to `FunctionFieldArithmetic:FA.2`; this layer builds only the concrete completion `F_q((1/T))` at infinity, which `FA.2` cites.

**Definition `fourier-transform-of-integer-measure`** — The Fourier transform of a probability measure on ℤ. For a probability mass function μ on ℤ (μ(a) ≥ 0, Σ_a μ(a) = 1) its Fourier transform is μ̂ : ℝ/ℤ → ℂ, μ̂(θ) = Σ_{a ∈ ℤ} μ(a)·e(aθ), e(x) = exp(2πix) (intMeasureFourier μ). The series converges absolutely; μ̂(0) = 1, |μ̂(θ)| ≤ 1, μ̂(−θ) = conj μ̂(θ); translating μ by b multiplies μ̂ by e(bθ); at rational frequencies μ̂(k/Q) = Σ_{r ∈ ℤ/Q} μ_Q(r)·e(kr/Q), where μ_Q is the image of μ in ℤ/Q, i.e. μ̂(k/Q) = (ZMod.dft μ_Q)(−k) in Mathlib's sign convention (dft Φ k = Σ_j e(−jk/Q)Φ(j)); and μ̂(θ) is Mathlib's characteristic function of μ pushed to ℝ, evaluated at 2πθ.

Hypotheses and conventions: μ a probability mass function on ℤ (PMF ℤ); θ ∈ AddCircle (1 : ℝ). Pinned convention: e(+aθ) (BKK), which is the complex conjugate of Mathlib's dft kernel; the transform is unnormalised on ℤ/Q (no 1/Q).

API: `intMeasureFourier` (constructor: intMeasureFourier μ θ = Σ' a, μ(a) · e(aθ) ∈ ℂ); `intMeasureFourier_zero` (simp: intMeasureFourier μ 0 = 1); `norm_intMeasureFourier_le_one` (other: ‖intMeasureFourier μ θ‖ ≤ 1); `intMeasureFourier_neg` (relation: intMeasureFourier μ (−θ) = conj (intMeasureFourier μ θ)); `intMeasureFourier_translate` (relation: The transform of μ(· − b) is e(bθ) · μ̂(θ)); `intMeasureFourier_ratCast` (compatibility: μ̂(k/Q) = Σ_{r : ZMod Q} μ_Q(r) · e(kr/Q) = ZMod.dft μ_Q (−k)); `intMeasureFourier_eq_charFun` (compatibility: μ̂(θ) = charFun (μ mapped to ℝ) (2πθ)); `intMeasureFourier_dirac` (example: The transform of δ_b is e(bθ)).

Unit tests: intMeasureFourier (PMF.pure b) θ = e(bθ) (`test_intMeasureFourier_dirac`, computation); For μ uniform on {0, 1}: intMeasureFourier μ (1/2) = 0 (`test_intMeasureFourier_uniform_half`, computation); intMeasureFourier μ 0 = 1 (`test_intMeasureFourier_zero`, degenerate); intMeasureFourier μ (−θ) = conj (intMeasureFourier μ θ) (`test_intMeasureFourier_conj`, characterisation); For μ = δ_0 and Q ≥ 2: μ̂(k/Q) = 1 ≠ 1/Q; the normalised finite transform (1/Q)Σ differs by the factor Q (`test_intMeasureFourier_not_normalised`, non-example).

Uses: Bary-Soroker–Koukoulopoulos–Kozma, Proposition 2.3 and Theorem 7 (p. 13): the hypotheses Σ_{k mod Q}|µ̂_j(k/Q + ℓ/R)|^s ≤ (1 − n^(−1/10))Q^(1−γ) are on this transform at rational frequencies; Bary-Soroker–Koukoulopoulos–Kozma, Lemma 4.1 (4.3): the characteristic function of a random polynomial factors into µ̂_j(ψ_P(T^jX)); FiniteFieldsAndCharacterSums:FF.1/fourier-gap-from-residue-anticoncentration: the Fourier gap bound; ArithmeticStatisticsPartIIRandomPolynomials (paper route 1): the random-polynomial Part II consumes µ̂ with this convention.

Construction: Absolute convergence: |μ(a)e(aθ)| = μ(a) and Σ μ(a) = 1; well-defined on ℝ/ℤ since e(a(θ + 1)) = e(aθ) (AddCircle.toCircle). Bounds: |μ̂(θ)| ≤ Σ μ(a) = 1; μ̂(0) = 1. Rational frequencies: e(ak/Q) depends only on a mod Q; group the sum by residues. charFun: MeasureTheory.charFun ν t = ∫ exp(i t x) dν for ν = μ mapped to ℝ; at t = 2πθ this is Σ μ(a) e(aθ).

Acceptance: δ_b ↦ e(bθ). μ uniform on {0, 1}: μ̂(1/2) = (1 + e(1/2))/2 = 0.

Rests on: library `AddCircle.toCircle`, `AddCircle.toCircle_add`, `ZMod.dft`, `MeasureTheory.charFun`, `PMF.toMeasure`.

Sources: Bary-Soroker–Koukoulopoulos–Kozma, §2.4, p. 13.

**Theorem `fourier-gap-from-residue-anticoncentration`** — A Fourier gap from anticoncentration in residue classes. Let η > 0, P ≥ 2 an integer and μ a probability measure on ℤ with Σ_{a ≡ b (mod p)} μ(a) ≤ 1 − η for every prime p ∣ P and every b ∈ ℤ. Then |μ̂(k/P)| ≤ 1 − 4η/P² for every integer k not divisible by P.

Hypotheses and conventions: η > 0, P ≥ 2; the anticoncentration hypothesis is imposed only at the primes dividing P.

Proof: |μ̂(θ)|² = Σ_{a,b} μ(a)μ(b) cos(2π(a − b)θ), so 1 − |μ̂(θ)|² = Σ_{a,b} μ(a)μ(b)(1 − cos(2π(a − b)θ)) ≥ 8 Σ_{a,b} μ(a)μ(b)‖(a − b)θ‖², using 1 − cos(2πy) = 2 sin²(πy) ≥ 8y² for |y| ≤ 1/2 (Jordan's inequality Real.mul_le_sin). Write k/P = m/Q in lowest terms, Q > 1, Q ∣ P; for a ≢ b (mod Q), ‖(a − b)θ‖ ≥ 1/Q. So 1 − |μ̂|² ≥ (8/Q²)Σ_{a ≢ b (mod Q)} μ(a)μ(b) = (8/Q²)Σ_j t_j(1 − t_j), with t_j the mass of the residue class j mod Q. For a prime p ∣ Q, t_j ≤ mass of the class of j mod p ≤ 1 − η; hence Σ_j t_j(1 − t_j) ≥ η Σ_j t_j = η. 1 − |μ̂| ≥ (1 − |μ̂|²)/2 ≥ 4η/Q² ≥ 4η/P².

Acceptance: μ uniform on {0, 1}, P = 2: η = 1/2 is admissible and the bound gives |μ̂(1/2)| ≤ 1/2 (actual value 0). μ = δ_0 violates the hypothesis for every η > 0 and has |μ̂| ≡ 1: the hypothesis cannot be dropped.

Rests on: nodes `fourier-transform-of-integer-measure`; library `Real.mul_le_sin`.

Sources: Bary-Soroker–Koukoulopoulos–Kozma, Lemma 3.6 and its proof, pp. 24–25.

**Definition `residue-character-at-infinity`** (planet: *Residue character of F_q((1/T))*) — The residue character of F_q((1/T)). Let F be a finite field of characteristic p. Model F((1/T)) as Mathlib's LaurentSeries F in the variable u = 1/T: X = Σ_j c_j T^j corresponds to Σ_j c_j u^(−j). The embedding F[T] → F((1/T)) is the F-algebra map T ↦ u^(−1) (laurentOfPoly). The residue res X := c_(−1), the coefficient of T^(−1), is the coefficient of u^(+1) (not of u^(−1)); it is F-linear. The residue character is ψ_∞ : F((1/T)) → ℝ/ℤ, ψ_∞(X) := val(Tr_{F/F_p}(res X))/p mod 1 (residueChar), whose exponential e(ψ_∞(X)) is the canonical character ψ_F of res X; for F = F_p it is BKK's ψ_p(X) = res(X)/p mod 1. For a finite set ℙ of primes, F_ℙ((1/T)) := ∏_{p ∈ ℙ} F_p((1/T)) and ψ_ℙ(X) := Σ_p ψ_p(X_p) (residueCharMulti). ψ_∞ is additive and vanishes on F[T]; for distinct primes, ψ_ℙ(X) = 0 iff res X_p = 0 for all p ∈ ℙ.

Hypotheses and conventions: F finite with its ZMod p-algebra structure. Pinned convention: variable u = 1/T; res = coefficient of u^1; the sign of the character is +.

API: `laurentOfPoly` (data: The F-algebra map F[T] →ₐ[F] LaurentSeries F, T ↦ u^(−1)); `residueInfty` (constructor: The F-linear map LaurentSeries F →ₗ[F] F, X ↦ X.coeff 1 (the coefficient of T^(−1))); `residueInfty_laurentOfPoly` (simp: residueInfty (laurentOfPoly A) = 0); `residueInfty_T_inv` (simp: residueInfty (HahnSeries.single 1 1) = 1: the residue of T^(−1) is 1); `residueChar` (constructor: residueChar : LaurentSeries F →+ AddCircle (1 : ℝ), X ↦ val(Tr(res X))/p); `residueChar_laurentOfPoly` (simp: residueChar (laurentOfPoly A) = 0); `residueChar_toCircle` (compatibility: AddCircle.toCircle (residueChar X) = canonicalAddChar F p (residueInfty X)); `residueCharMulti` (data: For ℙ a finite set of primes: Σ_{p∈ℙ} residueChar_p (X_p)); `residueCharMulti_eq_zero_iff` (characterisation: residueCharMulti X = 0 ↔ ∀ p ∈ ℙ, residueInfty (X p) = 0).

Unit tests: For F = ZMod p: residueChar (HahnSeries.single 1 1) = (1/p : AddCircle 1) (`test_residueChar_T_inv`, computation); residueChar 1 = 0 (`test_residueChar_one`, degenerate); residueChar (laurentOfPoly A) = 0 for every A ∈ F[T] (`test_residueChar_poly`, characterisation); For X = laurentOfPoly T (= u^(−1)): residueInfty X = 0 although X.coeff (−1) = 1; reading the coefficient of u^(−1) would reverse BKK's convention (`test_residueInfty_wrong_variable`, non-example); AddCircle.toCircle (residueChar X) = canonicalAddChar F p (residueInfty X) (`test_residueChar_compat`, compatibility).

Uses: Bary-Soroker–Koukoulopoulos–Kozma, (4.1)–(4.2) and Lemma 4.1: Fourier inversion over F_p[T]/(D) and the characteristic function of random polynomials use e(ψ_P(AB/D)); Bary-Soroker–Koukoulopoulos–Kozma, Lemmas 5.1, 6.1–6.3: pointwise and L¹ bounds on σ_P(n; X) = ∏|µ̂_j(ψ_P(T^jX))|; FunctionFieldArithmetic:FA.2: the general local residue characters of a function field; for F_q(T) at ∞ with the differential −dT this is ψ_∞, and FA.2 cites this special case; FiniteFieldsAndCharacterSums:FF.1/residue-pairing-duality: the characters of F[T]/(D) are A ↦ e(ψ_∞(AB/D)).

Construction: laurentOfPoly := Polynomial.aeval (HahnSeries.single (−1) 1): T ↦ u^(−1). res is the coefficient functional X ↦ X.coeff 1, F-linear. Vanishing on polynomials: a polynomial Σ a_i T^i maps to Σ a_i u^(−i), whose coefficient at u^1 is 0 (HahnSeries.coeff_single). Additivity of ψ_∞: res and Tr are additive, and x ↦ val(x)/p mod 1 is an additive map ZMod p → ℝ/ℤ (ZMod.toAddCircle). Distinct primes: Σ_p r_p/p ∈ ℤ with 0 ≤ r_p < p forces every r_p = 0 (multiply by ∏_{p' ≠ p} p' and reduce modulo p). Compatibility: AddCircle.toCircle (residueChar X) = canonicalAddChar F p (res X) (FiniteFieldsAndCharacterSums:FF.1/canonical-additive-character).

Acceptance: ψ_p(T^(−1)) = 1/p for F = F_p; ψ_p(1) = 0; ψ_p(A) = 0 for A ∈ F_p[T].

Rests on: nodes `canonical-additive-character`; library `LaurentSeries`, `HahnSeries.single`, `HahnSeries.coeff_single`, `Polynomial.aeval`, `ZMod.toAddCircle`, `AddCircle.toCircle`.

Sources: Bary-Soroker–Koukoulopoulos–Kozma, §4, p. 28; Bary-Soroker–Koukoulopoulos–Kozma, §4, pp. 28–29.

**Lemma `residue-pairing-duality`** — Residue-pairing duality for F[T]/(D). Let F be a finite field with q elements and D ∈ F[T] monic of degree ℓ ≥ 0. The pairing F[T]/(D) × F[T]/(D) → ℂˣ, (A, B) ↦ e(ψ_∞(AB/D)) (AB/D computed in F((1/T))) is well defined and nondegenerate; hence B ↦ (A ↦ e(ψ_∞(AB/D))) is an isomorphism from F[T]/(D) onto the character group of its additive group, and (1/q^ℓ)·Σ_{B mod D} e(ψ_∞(AB/D)) = 1 if D ∣ A and 0 otherwise. For a finite set of primes ℙ and D = (D_p) monic, (1/‖D‖_ℙ)Σ_{B mod D} e(ψ_ℙ(AB/D)) = 1_{A ≡ 0 (mod D)}, with ‖D‖_ℙ = ∏_p p^(deg D_p).

Hypotheses and conventions: D monic (so that 1/D exists in F((1/T)) and F[T]/(D) has q^ℓ elements).

Proof: Well defined: if D ∣ A or D ∣ B then AB/D ∈ F[T] and ψ_∞ vanishes on F[T] (FiniteFieldsAndCharacterSums:FF.1/residue-character-at-infinity). Nondegenerate: if D ∤ A write A = QD + R with 0 ≤ deg R < deg D; then R/D = c·T^(deg R − deg D) + lower terms with c ≠ 0 (BKK Remark 6.1); for j = deg D − deg R − 1 ≥ 0, res(T^j·R/D) = c ≠ 0, and choosing b ∈ F with Tr(bc) ≠ 0 (FiniteField.trace_to_zmod_nondegenerate) makes B = bT^j pair nontrivially with A. The map B ↦ character is an injective homomorphism into AddChar (F[T]/(D)) ℂ, which has q^ℓ elements (AddChar.card_eq), so it is bijective. Inversion formula: Σ_B e(ψ_∞(AB/D)) is the sum of the character B ↦ e(ψ_∞(AB/D)), which is trivial iff D ∣ A (nondegeneracy); AddChar.sum_eq_ite. Several primes: product over p ∈ ℙ of the one-prime statements.

Acceptance: ℓ = 0 (D = 1): the sum is 1 and every A is ≡ 0. D = T, F = F_p: B ↦ e(bA(0)/p), the standard characters of F_p.

Rests on: nodes `residue-character-at-infinity`; library `FiniteField.trace_to_zmod_nondegenerate`, `AddChar.card_eq`, `AddChar.sum_eq_ite`.

Sources: Bary-Soroker–Koukoulopoulos–Kozma, §4, p. 29; Bary-Soroker–Koukoulopoulos–Kozma, (4.1), p. 29.

**Definition `negative-power-torus`** — The torus of negative-power Laurent series. Let F be a finite field with q elements. T_F := {X ∈ F((1/T)) : c_j(X) = 0 for all j ≥ 0}, the Laurent series Σ_{j ≤ −1} c_j T^j (in u = 1/T: coefficients vanish at u^j, j ≤ 0) — an additive subgroup, closed under multiplication, not containing 1 (the maximal ideal uF[[u]], not a unital subring). Every Y ∈ F((1/T)) decomposes uniquely as Y = A + {Y} with A ∈ F[T] (polynomialPart) and {Y} ∈ T_F (fractionalPart). The norm ‖Y‖_T := q^(−m), m ≥ 1 least with c_(−m)({Y}) ≠ 0, and ‖Y‖_T = 0 if {Y} = 0. The coordinates T_F ≃+ (ℕ → F), X ↦ (i ↦ c_(−(i+1))(X)), identify T_F with a product of copies of F. For A, B ∈ F[T], B ∤ A: ‖A/B‖_T = q^(deg R − deg B) with R = A mod B.

Hypotheses and conventions: F finite with q elements. BKK's ‖·‖ uses p = q; the node uses q for general F.

API: `negPowerTorus` (constructor: The AddSubgroup of LaurentSeries F of series with coeff j = 0 for all j ≤ 0 (in u)); `fractionalPart` (projection: LaurentSeries F →+ negPowerTorus F); `polynomialPart` (projection: LaurentSeries F →+ F[T] (the part with u-exponents ≤ 0)); `laurentOfPoly_polynomialPart_add_fractionalPart` (characterisation: Y = laurentOfPoly (polynomialPart Y) + fractionalPart Y, uniquely); `fractionalPart_laurentOfPoly` (simp: fractionalPart (laurentOfPoly A) = 0); `torusCoords` (equivalence: negPowerTorus F ≃+ (ℕ → F), X ↦ (i ↦ X.coeff (i + 1))); `torusNorm` (data: ‖Y‖_T = q^(−m) for the first nonzero fractional coefficient, 0 if none); `torusNorm_T_inv_pow` (example: torusNorm (T^(−r)) = q^(−r) for r ≥ 1); `torusNorm_div` (relation: For B ∤ A: torusNorm (A/B) = q^(deg (A mod B) − deg B)); `torusNorm_lt_iff` (characterisation: torusNorm X < q^(−m) ↔ the first m fractional coefficients vanish).

Unit tests: torusNorm (laurentOfPoly A) = 0 (`test_torusNorm_poly`, degenerate); torusNorm (HahnSeries.single r 1) = q^(−r) for r ≥ 1 (`test_torusNorm_T_inv_pow`, computation); torusNorm X < q^(−m) iff X.coeff 1 = ⋯ = X.coeff m = 0 (the first m coefficients, not m − 1) (`test_torusNorm_ball`, characterisation); (1 : LaurentSeries F) ∉ negPowerTorus F: the torus is not a unital subring (`test_negPowerTorus_not_unital`, non-example); torusCoords (T^(−1)) = Pi.single 0 1 (`test_torusCoords_T_inv`, compatibility).

Uses: Bary-Soroker–Koukoulopoulos–Kozma, §6: T_p with its Haar measure is the 'continuous' side of the L¹ bounds; Bary-Soroker–Koukoulopoulos–Kozma, Lemma 6.2: balls of radius p^(−2ℓ) around Farey fractions are disjoint in T_p; FiniteFieldsAndCharacterSums:FF.1/haar-measure-on-negative-power-torus: the measure is transported along the coordinates.

Construction: The subgroup property and closure under products are coefficientwise; 1 has c_0 = 1. Decomposition: truncate the Laurent series at the u-exponent 0 (finitely many nonpositive exponents: Laurent series have bounded-below support). Coordinates: a sequence (c_(−1), c_(−2), …) defines the HahnSeries Σ_i c_(−(i+1)) u^(i+1), whose support ⊆ ℕ+ is well-founded; the map is an additive bijection. Remark 6.1: A/B = Q + R/B, and R/B = T^(deg R − deg B)·(r_0 + …)(b_0 + …)^(−1) with r_0, b_0 ≠ 0, so the leading fractional coefficient sits at T^(deg R − deg B).

Acceptance: Polynomials have norm 0; ‖T^(−r)‖_T = q^(−r); ‖X‖_T < q^(−m) iff c_(−1) = ⋯ = c_(−m) = 0.

Rests on: nodes `residue-character-at-infinity`; library `LaurentSeries`, `HahnSeries.single`.

Sources: Bary-Soroker–Koukoulopoulos–Kozma, §6, p. 31; Bary-Soroker–Koukoulopoulos–Kozma, §6, p. 31, and Remark 6.1, p. 32.

**Definition `haar-measure-on-negative-power-torus`** — The Haar probability measure on the negative-power torus. The Haar probability measure dX on T_F is the image, under the coordinate isomorphism (ℕ → F) ≃ T_F, of the infinite product of uniform probability measures on F (MeasureTheory.Measure.infinitePi of PMF.uniformOfFintype F) (torusHaar). It is a translation-invariant probability measure (the normalised Haar measure of the compact group T_F with the product topology), each coordinate c_(−i) is uniformly distributed on F, the cylinder {c_(−1) = a_1, …, c_(−m) = a_m} has measure q^(−m), and the ball {X : ‖X‖_T < q^(−m)} has measure q^(−m). For a finite set of primes, T_ℙ = ∏_p T_(F_p) carries the product measure.

Hypotheses and conventions: F finite with q elements, with the discrete measurable space.

API: `torusHaar` (constructor: The measure on ℕ → F (coordinates of T_F): infinitePi of uniform measures); `isProbabilityMeasure_torusHaar` (instance: torusHaar is a probability measure); `torusHaar_cylinder` (characterisation: torusHaar {c | ∀ i < m, c i = a i} = q^(−m)); `torusHaar_map_add` (other: Translation invariance: (torusHaar).map (· + y) = torusHaar); `torusHaar_coord` (compatibility: Each coordinate is uniformly distributed on F: (torusHaar).map (· i) = uniform); `torusHaar_ball` (example: torusHaar {X : torusNorm X < q^(−m)} = q^(−m)).

Unit tests: torusHaar univ = 1 (`test_torusHaar_univ`, degenerate); torusHaar {c | c 0 = 0} = 1/q (`test_torusHaar_first_coord_zero`, computation); torusHaar {c | ∀ i < m, c i = 0} = q^(−m) (BKK's ball of strict radius p^(−m)) (`test_torusHaar_ball`, computation); torusHaar {c | c 0 = 0} ≠ 1 : a Dirac or counting measure on the coordinates would fail the uniform-coordinate test (`test_torusHaar_not_counting`, non-example); torusHaar is invariant under translation by Pi.single 0 1 (translation by T^(−1)) (`test_torusHaar_translate`, compatibility).

Uses: Bary-Soroker–Koukoulopoulos–Kozma, Lemmas 6.1–6.2: integration of functions of finitely many coordinates over T_p; FiniteFieldsAndCharacterSums:FF.1/torus-character-orthogonality: the continuous orthogonality relation; FunctionFieldArithmetic:FA.2: self-dual Haar measures on completions of function fields; FA.2 cites this normalisation at ∞ for F_q(T).

Construction: infinitePi of probability measures is a probability measure; its value on a cylinder is the finite product (MeasureTheory.Measure.infinitePi_pi), q^(−m). Translation invariance: translation by Y acts coordinatewise by translations of F, which preserve the uniform measure; the product of invariant measures is invariant (determined by cylinders). Balls are cylinders with a_1 = ⋯ = a_m = 0 (FiniteFieldsAndCharacterSums:FF.1/negative-power-torus, torusNorm_lt_iff).

Acceptance: Total mass 1; μ{c_(−1) = 0} = 1/q; μ{‖X‖ < q^(−m)} = q^(−m).

Rests on: nodes `negative-power-torus`; library `MeasureTheory.Measure.infinitePi`, `MeasureTheory.Measure.infinitePi_pi`, `PMF.uniformOfFintype`, `PMF.toMeasure`, `MeasureTheory.IsProbabilityMeasure`.

Sources: Bary-Soroker–Koukoulopoulos–Kozma, §6, p. 32; Bary-Soroker–Koukoulopoulos–Kozma, Proof of Lemma 6.1, p. 32.

**Definition `reduced-polynomial-fractions`** — Reduced polynomial fractions and their separation. Let F be a finite field with q elements and ℓ ≥ 0. A reduced fraction of denominator degree ℓ is a pair (G, H) of polynomials with H monic of degree ℓ, deg G < ℓ and gcd(G, H) = 1 (for ℓ = 0 the only one is (0, 1)); it is viewed as G/H ∈ T_F (zero polynomial part). Distinct reduced fractions of denominator degree ℓ satisfy ‖G/H − G'/H'‖_T ≥ q^(−2ℓ), so the balls {Y : ‖Y − G/H‖_T < q^(−2ℓ)} are pairwise disjoint. If T ∤ H, multiplication by T^j permutes the reduced residues G mod H; for T ∣ H (e.g. 1/T) it does not.

Hypotheses and conventions: H monic; gcd(G, H) = 1; the T-shift statement needs T ∤ H.

API: `ReducedFraction` (structure: A pair (G, H) with H monic of degree ℓ, deg G < ℓ, IsCoprime G H); `ReducedFraction.toTorus` (data: The element G/H of negPowerTorus F); `ReducedFraction.zero` (example: The unique reduced fraction of denominator degree 0 is 0/1); `ReducedFraction.torusNorm_sub_ge` (relation: Distinct reduced fractions of degree ℓ are at torus distance ≥ q^(−2ℓ)); `ReducedFraction.torusNorm_toTorus` (compatibility: torusNorm (G/H) = q^(deg G − ℓ) for G ≠ 0); `ReducedFraction.mulTPow_bijective` (other: If ¬ T ∣ H: G ↦ T^j G mod H is a bijection of the reduced residues mod H).

Unit tests: Every reduced fraction of denominator degree 0 is (0, 1) (`test_reducedFraction_zero`, degenerate); (1, T) is a reduced fraction but T ∣ T, and multiplication by T is not injective on residues mod T (it sends 1 to 0) (`test_reducedFraction_T`, non-example); For a ≠ b in F: torusNorm (1/(T − a) − 1/(T − b)) = q^(−2) (`test_reducedFraction_linear_sep`, computation); torusNorm (1/(T − a)) = q^(−1) (`test_reducedFraction_norm`, compatibility).

Uses: Bary-Soroker–Koukoulopoulos–Kozma, (4.6)–(4.7): δ_P(n; ℓ) sums σ_P over reduced fractions G/H; Bary-Soroker–Koukoulopoulos–Kozma, Lemma 6.2 (routed to SieveMethodsAndPrimePatterns:SV.2): the polynomial Farey large sieve uses the disjoint balls; Bary-Soroker–Koukoulopoulos–Kozma, Lemma 5.1: for a reduced G/H with T ∤ H, every window of ℓ consecutive shifts T^jG/H has nonzero residue.

Construction: G/H ∈ T_F since deg G < deg H (Remark 6.1). Separation: G/H − G'/H' = (GH' − G'H)/(HH'), with HH' of degree 2ℓ and GH' − G'H ≠ 0 (distinct reduced fractions), so by Remark 6.1 its norm is q^(deg R − 2ℓ) ≥ q^(−2ℓ), R the remainder (FiniteFieldsAndCharacterSums:FF.1/negative-power-torus, torusNorm_div). Shift: T is a unit modulo H iff T ∤ H; then G ↦ T^jG is a bijection of (F[T]/H)ˣ.

Acceptance: ℓ = 0: only 0/1. ℓ = 1: c/(T − a) for c ≠ 0, pairwise at distance ≥ q^(−2).

Rests on: nodes `negative-power-torus`; library `IsCoprime`, `Polynomial.Monic`.

Sources: Bary-Soroker–Koukoulopoulos–Kozma, §4, p. 30; Bary-Soroker–Koukoulopoulos–Kozma, Proof of Lemma 6.2, p. 33; Bary-Soroker–Koukoulopoulos–Kozma, Proof of Lemma 6.3, p. 33.

**Theorem `torus-character-orthogonality`** — Orthogonality of the residue characters on the torus. Let F be a finite field. For A ∈ F[T]: ∫_{T_F} e(ψ_∞(A·X)) dX = 1 if A = 0 and 0 otherwise, with dX the Haar probability measure. For a finite set of primes ℙ and A = (A_p) ∈ ∏_p F_p[T]: ∫_{T_ℙ} e(ψ_ℙ(AX)) dX = 1_{A = 0}.

Hypotheses and conventions: The integrand is a function of finitely many coordinates, bounded by 1.

Proof: res(AX) = Σ_i a_i c_(−1−i)(X) for A = Σ a_i T^i, so e(ψ_∞(AX)) = ∏_i ψ_F(a_i c_(−1−i)) depends on the coordinates c_(−1), …, c_(−1−deg A). By FiniteFieldsAndCharacterSums:FF.1/torus-finite-coordinate-integral (or directly from the product structure of torusHaar), the integral equals ∏_i (1/q)Σ_{c ∈ F} ψ_F(a_i c). For A ≠ 0 some a_i ≠ 0 and Σ_c ψ_F(a_i c) = 0 (ψ_F primitive: AddChar.sum_mulShift); for A = 0 the integrand is 1. Several primes: the measure is a product and the integrand factors over p.

Acceptance: A = 0: integral 1. A = 1: the integrand is ψ_F(c_(−1)), integral 0.

Rests on: nodes `residue-character-at-infinity`, `haar-measure-on-negative-power-torus`, `torus-finite-coordinate-integral`, `canonical-additive-character`; library `AddChar.sum_mulShift`.

Sources: Bary-Soroker–Koukoulopoulos–Kozma, §6, p. 32.

**Theorem `torus-finite-coordinate-integral`** — Integrals over the torus of functions of finitely many residues. Let F be a finite field of characteristic p with q elements, m ≥ 0 and f_0, …, f_(m−1) : ℝ/ℤ → ℂ. Then ∫_{T_F} ∏_{j<m} f_j(ψ_∞(T^j X)) dX = p^(−m)·∏_{j<m} Σ_{ξ ∈ ℤ/p} f_j(ξ/p). For F = F_p this is BKK's Lemma 6.1; for general F the trace is equidistributed (each value of Tr_{F/F_p} is taken q/p times), which gives the same right side.

Hypotheses and conventions: No regularity is needed on the f_j: the integrand takes finitely many values on cylinders.

Proof: ψ_∞(T^j X) = val(Tr(c_(−1−j)(X)))/p, so the integrand depends only on c_(−1), …, c_(−m) (FiniteFieldsAndCharacterSums:FF.1/residue-character-at-infinity). By the cylinder formula (FiniteFieldsAndCharacterSums:FF.1/haar-measure-on-negative-power-torus), the integral is q^(−m)Σ_{c ∈ F^m} ∏_j f_j(Tr(c_j)/p) = ∏_j (1/q)Σ_{c ∈ F} f_j(Tr(c)/p). Tr : F → ZMod p is surjective and ZMod p-linear, so each ξ ∈ ZMod p has q/p preimages (Algebra.trace_surjective); (1/q)Σ_c f(Tr(c)/p) = (1/p)Σ_ξ f(ξ/p).

Acceptance: m = 0: both sides 1. f_0 = e(·): ∫ e(ψ(X)) dX = (1/p)Σ_ξ e(ξ/p) = 0.

Rests on: nodes `haar-measure-on-negative-power-torus`, `residue-character-at-infinity`; library `Algebra.trace_surjective`, `MeasureTheory.Measure.infinitePi_pi`.

Sources: Bary-Soroker–Koukoulopoulos–Kozma, Lemma 6.1, p. 32.

### Dependencies

- Inside the roadmap: from `FF.0`, extensions of finite fields with their norms and traces; to `FF.2`, the canonical
  characters, lifts and Gauss-sum normalisations of every character-sum estimate; to `FF.3`, the Euler-product
  recurrence (its case `w ≡ 1` is Gauss's count `q^k = Σ_{d ∣ k} d·π_q(d)`).
- Other roadmaps: `AdditiveCombinatorics:AC.0` supplies the normalised Fourier transform on finite abelian groups (open
  request, used by `fourier-expansion-of-multiplicative-character`); `ClassicalArithmeticCompletion:CA.1` and `CA.4`
  consume the convention comparisons, the transport of Gauss sums and Stickelberger's relation (RS-03 links
  `FF.1 → CA.1`, `FF.1 → CA.4`); `AnalyticNumberTheory:AN.1` consumes the Gauss-sum normalisation; the random-polynomial
  Part II of `ArithmeticStatistics` consumes the `F_q((1/T))` harmonic analysis; `FunctionFieldArithmetic:FA.2`
  generalises the residue character and Haar measure to all places of all function fields.
- Libraries: Mathlib's character, Gauss-sum, Jacobi-sum, cyclotomic-ideal, Laurent-series and product-measure APIs;
  Tau Ceti's column orthogonality and Frobenius-orbit lemma.

### Acceptance tests of the layer

- The trivial-character case is separated: `J^cl(1, 1) = q` against `jacobiSum 1 1 = q − 2`, `J^cl(1, χ) = 0` against
  `−1`, `g^cl(1, ψ) = 0` against `−1`; the `d`-th power count `#{y : y^d = x} = Σ_{χ^d = 1} classicalValue χ x` holds at
  `x = 0` only in the classical convention.
- Every sum has its domain and normalisation: Gauss sums over all of `F` with `χ(0) = 0`, Conrad's and Katre's signs,
  `AC.0`'s normalised Fourier coefficient equal to `(1/q)·χ⁻¹(−a)·gaussSum χ ψ`.
- The Hasse–Davenport lifting relation `−g_E(χ ∘ N, ψ ∘ Tr) = (−g(χ, ψ))^n` holds whenever `χ ≠ 1` or `ψ ≠ 1`
  and fails for `χ = ψ = 1`, `n = 2`; its Jacobi analogue needs one nontrivial character.
- Stickelberger's congruence at `q = p`: `G(ω^(−a)) = −gaussSum (ω^(−a)) ψ ≡ (ζ_p − 1)^a/a!` modulo `𝔓^(a+1)`; the
  valuation of `G(ω^(−a))` is the digit sum `s(a)`; for `m = 3` the relation gives `(g(χ)^3) = (π·π̄^2)` and `(J(χ, χ)) = (π̄)` for `χ = χ_π^(−1)`.
- The canonical character of `F_4` sends `ω` to `−1` and `1` to `1`; Mathlib's `primitiveChar` is a trace character.
- `ψ_∞(T^(−1)) = 1/p` over `F_p`; the Haar measure gives the open ball `|X| < q^(−m)` mass `q^(−m)`;
  `∫ e(ψ(AX)) dX = 1_{A = 0}`; the uniform measure on `{0, 1}` has `μ̂(1/2) = 0`.

---

## FF.2 Weil and Deligne bounds

This layer proves the square-root bounds for character sums over finite fields and states the cohomological framework
that produces them. Under RS-03 it is kept, and it is the single owner of the general Weil/Deligne finite-field sum
estimate handoff (formerly also claimed by `FF.5` and by `ExponentialSumsAndCircleMethod:ES.0`): every other roadmap
that needs `|Σ ψ(f(x))| ≤ (d − 1)√q`, `|Σ χ(g(x))| ≤ (m − 1)√q`, `|K(a, b; p)| ≤ 2√p`, Deligne's bound for trace
functions, the Artin–Schreier sheaf `L_ψ`, the Fourier–Deligne transform or Lang–Weil imports it from here. The four
interface ids are `FF.2/weil-bound-additive`, `FF.2/weil-bound-multiplicative`, `FF.2/kloosterman-bound` and
`FF.2/artin-schreier-sheaf`.

The one-variable bounds are reached by three routes, all planned, because each is consumed.

- **Elementary (Kowalski, Chapters 3–5; Bombieri's form of Stepanov's method).** The L-function of a sum is the monic
  L-series of a completely multiplicative function on monic polynomials; it is a polynomial of degree at most `d − 1`
  (resp. `m − 1`) by a coefficient computation; averaging over the twists `af` (resp. over the characters of order
  dividing `e`) turns the companion sums into the point count of an Artin–Schreier (resp. Kummer) curve; Stepanov's
  auxiliary polynomial bounds that count by `|L| + O(|L|^{1/2})` over the extensions `L` of even degree; the power-sum converse
  (`WeilConjectures:WC.5:power-sum-converse`) turns this into `|ω| ≤ √q` for every reciprocal root. The additive bound
  is unconditional on Mathlib plus that one request; the multiplicative bound is unconditional when
  `gcd(deg g, ord χ) = 1`.
- **Curves.** The Artin–Schreier function field `y^q − y = f(x)` has genus `(q − 1)(d − 1)/2`, the Kummer field
  `y^d = g(x)` has genus `(d − 1)(m − 1)/2`, and the numerators of their zeta functions factor as products of the
  L-functions of the twisted sums. The Riemann hypothesis for curves (`WeilConjectures:WC.3`) then gives purity: the
  degree is exactly `d − 1` (resp. `m − 1`) and every reciprocal root is a `q`-Weil number of weight 1.
- **ℓ-adic.** The character sheaves `L_ψ(f)` and `L_χ(g)` are rank-one lisse sheaves pushed out from the Lang torsors
  of `G_a` and `G_m`; the Grothendieck–Lefschetz trace formula (`SchemeAndStackFoundations:SF.2`) writes the sum as an
  alternating trace on `H^i_c`; `H⁰_c = 0` on an affine curve, `H²_c` is the Tate-twisted coinvariants, and Deligne's
  weight bound (`DeligneWeightsAndPurity:DWP.7`) bounds the eigenvalues on `H¹_c` by `√q`. When the elementary
  L-function is already known to be a polynomial, weights force `H²_c = 0` and `dim H¹_c = deg L`: the classical
  bounds need neither the Euler–Poincaré formula nor a conductor computation. This route gives the multiplicative bound
  in full generality, the mixed bound and the Kloosterman bound.

On top of these the layer states Deligne's bound for general trace functions on open subsets of the line, with the
`H²_c` main term subtracted rather than assumed zero; the Swan conductor of `L_ψ(f)` and the conductor bound for
`dim H¹_c`; Deligne's `n`-variable bounds (the elementary `(d − 1)q^{n−1/2}` of [Sommes trig.] Proposition 3.8 and
the sharp `(d − 1)^n q^{n/2}` of Weil I Théorème 8.4); the items that Browning–Sawin's geometric circle method needs
from this roadmap (cancellation by translation, the Fourier–Deligne transform with its inversion formula and the
Fourier input of their Lemma 3.7, Lang–Weil, and dimension from point counts); the uniform Lang–Weil estimate and
the geometric Chebotarev density theorem. The degenerate cases — Artin–Schreier-trivial phases `h^p − h + c` and
multiplicative phases `c·h^{ord χ}` — are separate nodes with their exact values, so that no bound is stated where
the sum has no cancellation.

**Status: partial.** 88 nodes (9 definitions, 10 constructions, 28 lemmas, 40 theorems, 1 comparison), 115 API
items, 59 unit tests, 6 planets, 43 declarations of the pinned libraries cited, 9 recorded mistakes in the sources,
3 gaps and 20 requests. The precise remaining work is listed at the end of this section.

### Conventions

- `F` is a finite field with `q` elements and characteristic `p`; `L` ranges over finite extensions of `F`
  (any `F`-algebra that is a finite field). The companion sums are `S_L(f, ψ) = Σ_{x ∈ L} ψ(Tr_{L/F}(f(x)))` and
  `S̃_L(g, χ) = Σ_{x ∈ L} χ(N_{L/F}(g(x)))`; `S_ν`, `S̃_ν` denote them for `[L : F] = ν` (they depend only on `ν`).
  Every bound is stated for all `L` at once, because the L-function arguments use all `ν`.
- Characters are Mathlib's `AddChar F ℂ` and `MulChar F ℂ`. A multiplicative character vanishes at `0` **also when it
  is trivial** (`FF.1/trivial-character-conventions`): so `S̃_F(X, 1) = q − 1`, and the trivial character is excluded
  from every multiplicative bound (it would count the non-roots of `g`). The canonical additive character is
  `ψ_F = ψ₀ ∘ Tr_{F/F_p}` (`FF.1/canonical-additive-character`); Artin–Schreier invariance `S(f + h^p − h) = S(f)` is a
  property of characters factoring through the absolute trace, which all characters of `F` do after a shift
  `ψ = ψ_F(b ·)`.
- The monic L-series of `Λ : F[X] → ℂ` is `L(Λ; T) = Σ_{n ≥ 0} (Σ_{h monic, deg h = n} Λ(h)) T^n ∈ ℂ⟦T⟧`. The additive
  root-sum character is `λ_{f,ψ}(h) = ψ(Tr_{(F[X]/(h))/F}(f mod h))` and the multiplicative one is
  `μ_{g,χ}(h) = χ(Res(h, g))` with Mathlib's resultant; for monic `h` these are `ψ(Σ_{h(α)=0} f(α))` and
  `χ(Π_{h(α)=0} g(α))`. The resultant (not a Dirichlet character modulo `g`) is the definition; it removes Kowalski's
  sign `χ(−1)^{deg g·deg h}`. `L(f, ψ; T) := L(λ_{f,ψ}; T)` and `Z(g, χ; T) := L(μ_{g,χ}; T)` satisfy
  `L = exp(Σ_ν S_ν T^ν/ν)`.
- When an L-function is a polynomial it is written `Π_j (1 − ω_j T)`; the `ω_j` are its **reciprocal roots**, and
  `S_ν = −Σ_j ω_j^ν`. In the Lean signatures they are the roots of `Polynomial.reverse`.
- Stepanov rings: `O(P, g) = F[X][Y]/(P(Y) − g(X))` with `P` monic of degree `n`, `deg g = m`, `gcd(n, m) = 1`; the pole
  degree is `deg X = n`, `deg Y = m`, `deg(Σ g_i Y^i) = max(n deg g_i + i m)`; `H(k) = {f : deg f ≤ k}`;
  `k₀ = (n − 1)(m − 1)` and `γ = k₀/2` (the genus). The two instances are Kummer (`P = Y^d`, `d ∣ q − 1`, `g`
  squarefree) and Artin–Schreier (`P = Y^{q′} − Y` with `F_{q′} ⊆ F`, `p ∤ deg g`).
- Degenerate phases: `f` is **Artin–Schreier trivial** when its reduced form `f*` (no monomials `X^j` with `j ≥ 1`,
  `p ∣ j`) is constant, i.e. `f = h^p − h + c`; `g` is **multiplicatively degenerate** for `χ` of order `e` when
  `g = c·h^e` with `c ∈ F̄`, `h ∈ F̄[X]` — "constant times an `e`-th power", not "perfect power" (`X²` is not degenerate
  for a cubic `χ`, and `c·h^e` with `c` a non-`e`-th power is).
- Sheaves: `ℓ ≠ p`, coefficients in a finite extension `E` of `ℚ_ℓ` containing the values of the characters, a fixed
  embedding `ι : E → ℂ`, **geometric** Frobenius. `L_ψ(f) = ψ^{−1}(f^*𝓛)` for the Lang torsor of `G_a`, so its trace at
  `x` is `ψ(f(x))` and not its inverse; likewise `L_χ(g)`. On an open `U ⊆ A¹_F` a lisse sheaf is a continuous
  representation of `Gal(F(X)^sep/F(X))` unramified on `U` (FKMS Definition 3.1), and the Lean signatures model the
  rank-one sheaves this way. Weights are ι-weights; the character sheaves are pure of weight `0`.
- The Fourier–Deligne transform is `FT_ψ(K) = R pr_{2!}(pr₁^*K ⊗ L_ψ(xy))[1]`; its trace function is
  `y ↦ −Σ_x t_K(x) ψ(xy)`, with the sign of the shift, and `FT_ψ ∘ FT_ψ ≅ [−1]^*(−1)`, so on traces
  `FT(FT t)(x) = q·t(−x)`.
- Point counts of varieties over `F_{q^r}` use a geometrically irreducible `V` of dimension `e`; the Lang–Weil main
  term is `q^{re}` and the error `O(q^{r(e−1/2)})`.

### What is already built (consume; never restate)

Cited from the pinned Mathlib: `AddChar`, `AddChar.IsPrimitive.of_ne_one`, `AddChar.sum_mulShift`, `AdjoinRoot`, `AdjoinRoot.powerBasis'`, `Algebra.norm`, `Algebra.norm_norm`, `Algebra.trace`, `Algebra.trace_algebraMap`, `Algebra.trace_eq_of_algEquiv`, `Algebra.trace_trace`, `Field.absoluteGaloisGroup`, `FiniteField.algEquivOfCardEq`, `FiniteField.algebraMap_trace_eq_sum_pow`, `FiniteField.norm_surjective`, `FiniteField.pow_card`, `FiniteField.roots_X_pow_card_sub_X`, `Fintype.card`, `Ideal.quotientInfRingEquivPiQuotient`, `IsAlgClosed`, `IsArithFrobAt`, `Module.End.trace_eq_sum_roots_charpoly_of_splits`, `MulChar`, `MulChar.sum_eq_zero_of_ne_one`, `MvPolynomial.psum_eq_mul_esymm_sub_sum`, `Polynomial.card_rootSet_eq_natDegree`, `Polynomial.card_roots'`, `Polynomial.monicEquivDegreeLT`, `Polynomial.resultant`, `Polynomial.resultant_comm`, `Polynomial.resultant_eq_prod_eval`, `Polynomial.resultant_mul_left`, `Polynomial.reverse`, `PowerSeries`, `PowerSeries.derivative`, `RatFunc`, `UniqueFactorizationMonoid.normalizedFactors_prod_eq`, `frobeniusNumber_pair`, `gaussSum`, `gaussSum_mul_gaussSum_eq_card`, `minpoly`, `rootsOfUnity`. Cited from the pinned Tau Ceti: the column orthogonality relation `CommGroup.sum_monoidHom_apply_eq_ite` (the sum over the characters of order dividing `d` in the Kummer point count). Together they give additive and multiplicative characters with their orthogonality, Gauss sums with `gaussSum_mul_gaussSum_eq_card`, traces and norms of finite free algebras with transitivity, the arithmetic of finite fields (Frobenius, the roots of `X^q − X`, surjectivity of the norm, the trace as a sum of conjugates), resultants as products over roots, power series with their derivative, `AdjoinRoot` with its power basis, rational function fields, absolute Galois groups, Newton's identities (`MvPolynomial.psum_eq_mul_esymm_sub_sum`), the Frobenius number of two coprime integers (`frobeniusNumber_pair`) and the characteristic-polynomial expression of a trace. Nothing in Mathlib or in the pinned Tau Ceti states an L-function of a character sum, Stepanov's method, a Weil bound, an Artin–Schreier or Kummer sheaf, a trace function, the Fourier–Deligne transform or Lang–Weil; this layer builds all of them.

### 1. Companion sums and their L-functions

The objects of the elementary route. The two root-sum characters are completely multiplicative on monic polynomials, so their monic L-series have Euler products whose logarithmic derivatives are the companion sums over all finite extensions; once an L-series is a polynomial, the companion sums are minus the power sums of its reciprocal roots.

**Definition `additive-companion-sum`** — Additive character sums over the finite extensions of F (companion sums). Let F be a finite field with q elements and characteristic p, ψ : F → ℂ^× an additive character (Mathlib's AddChar F ℂ), f ∈ F[X], and L/F a finite field extension (a finite field L with an F-algebra structure). The companion sum is S_L(f, ψ) := Σ_{x∈L} ψ(Tr_{L/F}(f(x))) ∈ ℂ, where f(x) is the evaluation aeval x f and Tr_{L/F} = Algebra.trace F L. For L = F it is the classical sum Σ_{x∈F} ψ(f(x)). S_L depends on L only through its F-isomorphism class, hence only on ν = [L:F]; one writes S_ν(f, ψ).

Hypotheses and conventions: F a finite field; L a finite field with an F-algebra structure (no chosen embedding into an algebraic closure). ψ an arbitrary additive character (the trivial character is allowed in the definition; every estimate assumes ψ ≠ 1). Convention pinned: the argument of ψ is the trace down to F, not the trace down to the prime field; composing ψ with Tr_{L/F} is how a character of F becomes a character of L.

API: `additiveCompanionSum` (data: S_L(f, ψ) = Σ_{x∈L} ψ(Tr_{L/F}(f(x)))); `additiveCompanionSum_self` (characterisation: For L = F (Algebra F F the identity): S_F(f, ψ) = Σ_{x∈F} ψ(f(x))); `additiveCompanionSum_congr` (compatibility: An F-algebra isomorphism L ≃ₐ[F] L' gives S_L(f, ψ) = S_{L'}(f, ψ)); `additiveCompanionSum_add_C` (relation: S_L(f + C c, ψ) = ψ(c)^{[L:F]} · S_L(f, ψ) for c ∈ F); `additiveCompanionSum_mulShift` (relation: S_L(f, ψ.mulShift a) = S_L(a·f, ψ): changing the character is the same as scaling the phase); `norm_additiveCompanionSum_le` (other: ‖S_L(f, ψ)‖ ≤ |L| (trivial bound; ψ takes values in the unit circle)).

Unit tests: S_L(0, ψ) = |L| (`additiveCompanionSum_test_zero`, degenerate); If ψ ≠ 1 then S_L(X, ψ) = 0 (`additiveCompanionSum_test_X`, computation); For c ∈ F: S_L(C c, ψ) = |L| · ψ(c)^{[L:F]}; a definition that restricts ψ to F without the trace would give |L|·ψ(c) (`additiveCompanionSum_test_const`, non-example); S_L(f, 1) = |L| for every f (`additiveCompanionSum_test_trivialChar`, degenerate).

Uses: Kowalski, Lemma 5.1 and Lemma 5.10: the Artin–Schreier point count and the Euler product are statements about all S_ν at once; FF.2/additive-l-function: its logarithmic derivative is Σ_ν S_ν T^ν; FF.2/weil-bound-additive: the Weil bound is stated for every S_L, not only for L = F; ExponentialSumsAndCircleMethod:ES.0: complete sums modulo p and over extensions are its finite-field inputs.

Construction: Definition as a finite sum over the Fintype L. Independence of L: an F-algebra isomorphism e : L ≃ L' preserves traces (mathlib:Algebra.trace_eq_of_algEquiv) and commutes with evaluation of f, so reindexing the sum by e gives S_L = S_{L'}; finite extensions of the same degree are isomorphic (mathlib:FiniteField.algEquivOfCardEq). Constant shift: Tr_{L/F}(c) = [L:F]·c for c ∈ F (mathlib:Algebra.trace_algebraMap), so S_L(f + c, ψ) = ψ(c)^{[L:F]} S_L(f, ψ).

Acceptance: For ψ ≠ 1: S_L(X, ψ) = 0, by surjectivity of the trace and orthogonality. S_L(0, ψ) = |L|, the degenerate value. For F = F_3, L = F_9 and c = 1: S_L(c, ψ) = 9ψ(2), not 9ψ(1); the trace, not the naive restriction of ψ, is what is summed.

Rests on: library `AddChar`, `Algebra.trace`, `Algebra.trace_eq_of_algEquiv`, `FiniteField.algEquivOfCardEq`, `Algebra.trace_algebraMap`.

Sources: Kowalski, Chapter 5, section 5.1, display (5.1), printed p. 66; Deligne, SGA 4½, [Sommes trig.] Scholie 1.9, (1.9.2), volume p. 174.

**Definition `multiplicative-companion-sum`** — Multiplicative character sums over the finite extensions of F. For F finite with q elements, χ : F → ℂ a multiplicative character (Mathlib's MulChar F ℂ, which vanishes at 0 — also the trivial character, by Mathlib's convention), g ∈ F[X] and L/F finite: S̃_L(g, χ) := Σ_{x∈L} χ(N_{L/F}(g(x))), N_{L/F} = Algebra.norm F. For L = F it is Σ_{x∈F} χ(g(x)). It depends only on [L:F].

Hypotheses and conventions: F finite; L a finite extension; χ arbitrary (trivial allowed; then the sum counts the x with g(x) ≠ 0, by Mathlib's convention χ(0) = 0). Pinned convention: characters of L are obtained as χ ∘ N_{L/F} (Kowalski (4.9)); the norm, not the trace.

API: `multiplicativeCompanionSum` (data: S̃_L(g, χ) = Σ_{x∈L} χ(N_{L/F}(g(x)))); `multiplicativeCompanionSum_self` (characterisation: S̃_F(g, χ) = Σ_{x∈F} χ(g(x))); `multiplicativeCompanionSum_congr` (compatibility: Invariance under F-algebra isomorphisms of L); `multiplicativeCompanionSum_C_mul` (relation: S̃_L(C c * g, χ) = χ(c)^{[L:F]} · S̃_L(g, χ)); `norm_multiplicativeCompanionSum_le` (other: ‖S̃_L(g, χ)‖ ≤ |L|).

Unit tests: S̃_L(1, χ) = |L| (`multiplicativeCompanionSum_test_one`, degenerate); If χ ≠ 1 then S̃_L(X, χ) = 0 (`multiplicativeCompanionSum_test_X`, computation); For Mathlib's trivial character: S̃_L(X, 1) = |L| − 1 (the value at 0 is 0) (`multiplicativeCompanionSum_test_trivialChar`, non-example).

Uses: Kowalski, Lemma 4.16: averaging over the characters of order dividing d counts points of y^d = g(x); FF.2/multiplicative-l-function: its logarithmic derivative is Σ_ν S̃_ν T^ν; FF.2/weil-bound-multiplicative: the bound is stated for all S̃_L.

Construction: Definition as a finite sum. Independence of L via mathlib:Algebra.norm (norm transported along F-algebra isomorphisms) and mathlib:FiniteField.algEquivOfCardEq. Scaling: N_{L/F}(c) = c^{[L:F]} for c ∈ F, so S̃_L(c·g, χ) = χ(c)^{[L:F]} S̃_L(g, χ).

Acceptance: For χ ≠ 1: S̃_L(X, χ) = 0, since N_{L/F} maps L^× onto F^× with fibres of equal size (mathlib:FiniteField.norm_surjective). S̃_L(1, χ) = |L|. With Mathlib's trivial character 1: S̃_L(X, 1) = |L| − 1, not |L| as under the classical convention ε(0) = 1 (FF.1/trivial-character-conventions).

Rests on: other layers `FF.1/trivial-character-conventions`; library `MulChar`, `Algebra.norm`, `FiniteField.norm_surjective`, `FiniteField.algEquivOfCardEq`.

Sources: Kowalski, Chapter 4, Proposition 4.7 and display (4.10), printed pp. 41-42.

**Definition `monic-l-series`** — The L-series of a function on monic polynomials over F. For F finite with q elements and Λ : F[X] → ℂ (only its values on monic polynomials matter), L(Λ; T) := Σ_{n≥0} c_n(Λ) T^n ∈ ℂ⟦T⟧ with c_n(Λ) := Σ_{h monic, deg h = n} Λ(h), a finite sum (there are q^n monic polynomials of degree n, indexed through Mathlib's monicEquivDegreeLT). This is Kowalski's L(η, T) = Σ_f η(f) T^{deg f} (Definition 4.4) and the same device for additive sums (§5.3), written for an arbitrary Λ so that additive, multiplicative, mixed and Kloosterman sums share one API.

Hypotheses and conventions: F finite; Λ arbitrary (no multiplicativity is assumed in the definition; the Euler-product and log-derivative statements assume it). The formal variable T is PowerSeries.X over ℂ; no analytic convergence is used.

API: `monicLSeries` (data: L(Λ; T) = Σ_n c_n(Λ) T^n); `monicOfDegree` (data: The finset of monic polynomials of degree n over F; its cardinality is q^n); `monicLSeries_coeff` (characterisation: coeff n L(Λ; T) = Σ_{h ∈ monicOfDegree n} Λ(h)); `monicLSeries_constantCoeff` (simp: The constant coefficient is Λ(1)); `monicLSeries_coeff_one` (simp: coeff 1 L(Λ; T) = Σ_{a∈F} Λ(X + C a)); `card_monicOfDegree` (simp: |monicOfDegree n| = q^n); `monicLSeries_isPolynomial` (other: If c_n(Λ) = 0 for all n ≥ N then L(Λ; T) is the image of a polynomial of degree < N); `monicLSeriesPowerSum` (data: W_ν(Λ) = Σ_{e ∣ ν} Σ_{π monic irreducible of degree e} e·Λ(π)^{ν/e}, the coefficients of the logarithmic derivative T L′/L for multiplicative Λ (FF.2/monic-l-series-log-derivative)).

Unit tests: For Λ ≡ 1: coeff n L(Λ; T) = q^n (`monicLSeries_test_one`, computation); For Λ(h) = [h(0) ≠ 0] and n ≥ 1: coeff n L(Λ; T) = q^n − q^{n−1} (`monicLSeries_test_units`, computation); The finset monicOfDegree 0 is {1} (`monicLSeries_test_card`, degenerate).

Uses: Kowalski, Definition 4.4, Propositions 4.5 and 5.9: L-functions of Dirichlet characters and of additive sums are monic L-series; FF.2/additive-l-function, FF.2/multiplicative-l-function, FF.2/kloosterman-l-function: each is monicLSeries of a root-sum character; FunctionFieldArithmetic:FA.5: Λ ≡ 1 recovers the zeta function of the affine line, a compatibility test with the function-field zeta functions.

Construction: c_n is a finite sum indexed by the finset of monic polynomials of degree n (the image of degreeLT F n under monicEquivDegreeLT, mathlib:Polynomial.monicEquivDegreeLT). L(Λ; T) := PowerSeries.mk c.

Acceptance: Λ ≡ 1 gives c_n = q^n, i.e. L = 1/(1 − qT), the zeta function of the affine line. Λ(h) = [h(0) ≠ 0] gives c_n = q^n − q^{n−1} (n ≥ 1): the zeta function (1 − T)/(1 − qT) of the multiplicative group. The number of monic polynomials of degree n is q^n.

Rests on: library `PowerSeries`, `Polynomial.monicEquivDegreeLT`.

Sources: Kowalski, Chapter 4, Definition 4.4, printed p. 39; Kowalski, Chapter 5, section 5.3, after Lemma 5.10, printed p. 71.

**Lemma `monic-l-series-log-derivative`** — Euler product and logarithmic derivative of a multiplicative monic L-series. Let Λ be completely multiplicative on monic polynomials (Λ(1) = 1 and Λ(h₁h₂) = Λ(h₁)Λ(h₂) for monic h₁, h₂). Then L(Λ; T) = Π_π (1 − Λ(π)T^{deg π})^{−1} over monic irreducible π (coefficientwise), and T·L′(Λ; T) = L(Λ; T) · Σ_{ν≥1} W_ν T^ν with W_ν := Σ_{π monic irreducible, deg π | ν} deg π · Λ(π)^{ν/deg π}. If moreover, for each finite extension L of degree ν and each x ∈ L, a value w_L(x) is given with w_L(x) = Λ(minpoly_F x)^{ν/deg minpoly_F x}, then W_ν = Σ_{x∈L} w_L(x). Equivalently L(Λ; T) = exp(Σ_ν W_ν T^ν/ν) in ℂ⟦T⟧.

Hypotheses and conventions: Λ completely multiplicative on monic polynomials; Λ(1) = 1. L any finite extension of F of degree ν (the value of W_ν does not depend on the choice).

Proof: Unique factorisation of monic polynomials into monic irreducibles (mathlib:UniqueFactorizationMonoid.normalizedFactors_prod_eq) turns the coefficientwise product Π_π Σ_k Λ(π)^k T^{k deg π} into Σ_h Λ(h)T^{deg h} (Kowalski, proof of Proposition 4.5(1)). Take the logarithmic derivative of the product: T L′/L = Σ_π deg π Σ_{r≥1} Λ(π)^r T^{r deg π} (proof of Proposition 4.7); collect the coefficient of T^ν. Regrouping over x ∈ L (proof of Lemma 5.10): an irreducible monic π of degree e has exactly e roots in L when e | ν and none otherwise (π divides X^{q^ν} − X iff e | ν, whose roots are exactly L: mathlib:FiniteField.roots_X_pow_card_sub_X; the roots are simple: mathlib:Polynomial.card_rootSet_eq_natDegree), and every x ∈ L has a unique minimal polynomial (mathlib:minpoly). Hence Σ_{deg π | ν} deg π Λ(π)^{ν/deg π} = Σ_{x∈L} w_L(x). The exp form follows by comparing coefficients of the formal logarithmic derivative (mathlib:PowerSeries.derivative).

Acceptance: Λ ≡ 1: W_ν = q^ν = |L| and L = 1/(1 − qT). Λ = root-sum character of f = X with ψ ≠ 1: W_ν = Σ_{x∈L} ψ(Tr x) = 0 and L = 1.

Rests on: nodes `monic-l-series`; library `UniqueFactorizationMonoid.normalizedFactors_prod_eq`, `FiniteField.roots_X_pow_card_sub_X`, `Polynomial.card_rootSet_eq_natDegree`, `minpoly`, `PowerSeries.derivative`.

Sources: Kowalski, Chapter 5, Lemma 5.10 and its proof, printed pp. 71-72; Kowalski, Chapter 4, proof of Proposition 4.7, printed p. 42.

**Construction `root-sum-additive-character`** — The root-sum character h ↦ ψ(Σ_{h(α)=0} f(α)) of an additive character and a polynomial. For F finite, ψ an additive character of F and f ∈ F[X], define on polynomials λ_{f,ψ}(h) := ψ(Tr_{(F[X]/(h))/F}(f mod h)), the trace of multiplication by f on the F-algebra F[X]/(h) = AdjoinRoot h (free of rank deg h when h is monic). For monic h splitting in an extension K, Tr(f mod h) = Σ_{α} f(α) over the roots of h counted with multiplicity, so λ(h) = ψ(Σ_{h(α)=0} f(α)); this sum lies in F. λ is completely multiplicative on monic polynomials, λ(X − a) = ψ(f(a)), and for x in a finite extension L of degree ν with minimal polynomial π: λ(π)^{ν/deg π} = ψ(Tr_{L/F}(f(x))).

Hypotheses and conventions: F finite; ψ arbitrary; f arbitrary (constant, and Artin–Schreier trivial, f allowed). λ is used only on monic h; on the zero polynomial the trace is taken on F[X] (not finite), and the value is irrelevant.

API: `rootSumAddChar` (data: λ_{f,ψ}(h) = ψ(Tr_{(F[X]/(h))/F}(f mod h))); `rootSumAddChar_one` (simp: λ(1) = 1); `rootSumAddChar_mul` (relation: For monic h₁, h₂: λ(h₁h₂) = λ(h₁)λ(h₂)); `rootSumAddChar_X_sub_C` (simp: λ(X − C a) = ψ(f(a))); `rootSumAddChar_eq_sum_roots` (characterisation: If h is monic and splits over a field K ⊇ F then λ(h) = ψ(t) where t ∈ F maps to Σ_{α ∈ roots of h in K} f(α)); `rootSumAddChar_minpoly_pow` (compatibility: For x in a finite extension L: λ(minpoly_F x)^{[L:F]/deg} = ψ(Tr_{L/F}(f(x)))); `rootSumAddChar_add` (relation: λ_{f+g,ψ} = λ_{f,ψ}·λ_{g,ψ} on monic polynomials).

Unit tests: For f = 0 and h monic: λ(h) = 1 (`rootSumAddChar_test_zero`, degenerate); For f = X: λ(X² + C a·X + C b) = ψ(−a) (`rootSumAddChar_test_X_quadratic`, computation); For f = C c and h monic of degree n: λ(h) = ψ(c)^n (`rootSumAddChar_test_const`, computation).

Uses: Kowalski, Lemmas 5.10-5.11 and Example 5.12: the character η of P(F_q) whose L-function is Z(g, ψ; T); FF.2/additive-l-function: its monic L-series; FF.2/rank-one-sheaf-l-function: λ(π) is the Frobenius trace of L_ψ(f) at the closed point π (Sommes trig. 1.7.6).

Construction: Trace of multiplication by X^k on F[X]/(h) is the k-th power sum of the roots: the characteristic polynomial of multiplication by X is h (mathlib:AdjoinRoot.powerBasis'), and the trace of a power of an endomorphism is the power sum of the roots of its characteristic polynomial (mathlib:Module.End.trace_eq_sum_roots_charpoly_of_splits after scalar extension to a splitting field); linearity gives Σ_α f(α). Multiplicativity: F[X]/(h₁h₂) has F[X]/(h₂) as the sub-F[X]-module h₁F[X]/(h₁h₂) with quotient F[X]/(h₁), and traces are additive along such exact sequences; equivalently the root multiset of h₁h₂ is the sum of the two root multisets. Value at X − a: F[X]/(X − a) = F with X ↦ a. Minimal polynomials: F[X]/(π) ≅ F(x); Tr_{L/F}(f(x)) = [L:F(x)] · Tr_{F(x)/F}(f(x)) (mathlib:Algebra.trace_trace with the trace of a scalar), and ψ(k t) = ψ(t)^k.

Acceptance: f = 0 gives λ ≡ 1 on monic polynomials. f = X, h = X² + aX + b gives λ(h) = ψ(−a) (sum of the roots). f = c constant, h monic of degree n gives λ(h) = ψ(c)^n.

Rests on: library `AdjoinRoot`, `AdjoinRoot.powerBasis'`, `Algebra.trace`, `Module.End.trace_eq_sum_roots_charpoly_of_splits`, `Algebra.trace_trace`, `minpoly`, `AddChar`.

Sources: Kowalski, Chapter 5, Lemma 5.11, proof of (2), printed p. 74; Kowalski, Chapter 5, Lemma 5.10, printed p. 71.

**Construction `root-sum-multiplicative-character`** — The root-product character h ↦ χ(Res(h, g)) of a multiplicative character and a polynomial. For F finite, χ a multiplicative character (MulChar F ℂ) and g ∈ F[X], define μ_{g,χ}(h) := χ(Res(h, g)) with Mathlib's resultant Polynomial.resultant h g (default degrees). For monic h splitting over K, Res(h, g) = Π_{h(α)=0} g(α) (roots with multiplicity), so μ(h) = χ(Π_{h(α)=0} g(α)) = χ(N_{(F[X]/(h))/F}(g mod h)). μ is completely multiplicative on monic polynomials, μ(X − a) = χ(g(a)), μ(h) = 0 when h and g have a common root (by Mathlib's convention χ(0) = 0, also for the trivial character), and for x in a finite extension L of degree ν with minimal polynomial π: μ(π)^{ν/deg π} = χ(N_{L/F}(g(x))).

Hypotheses and conventions: F finite; χ arbitrary; g arbitrary (constant and perfect-power g allowed). Used on monic h. The resultant, not a Dirichlet character modulo g, is the definition: this removes Kowalski's sign χ(−1)^{deg g · deg h} from the generating identity.

API: `rootSumMulChar` (data: μ_{g,χ}(h) = χ(Res(h, g))); `rootSumMulChar_one` (simp: μ(1) = 1); `rootSumMulChar_mul` (relation: For monic h₁, h₂: μ(h₁h₂) = μ(h₁)μ(h₂)); `rootSumMulChar_X_sub_C` (simp: μ(X − C a) = χ(g(a))); `rootSumMulChar_eq_prod_roots` (characterisation: For monic h splitting over K: μ(h) = χ(t) where t ∈ F maps to Π_{α} g(α)); `rootSumMulChar_minpoly_pow` (compatibility: For x in a finite extension L: μ(minpoly_F x)^{[L:F]/deg} = χ(N_{L/F}(g(x)))); `rootSumMulChar_mul_right` (relation: μ_{g₁g₂,χ} = μ_{g₁,χ}·μ_{g₂,χ} on monic polynomials).

Unit tests: For g = 1 and h monic: μ(h) = 1 (`rootSumMulChar_test_one`, degenerate); For g = X and h monic: μ(h) = χ((−1)^{deg h} · h(0)) (`rootSumMulChar_test_X`, computation); For Mathlib's trivial character and g = X: μ(X) = 0 (not 1, as the classical convention ε(0) = 1 would give) (`rootSumMulChar_test_trivialChar`, non-example).

Uses: Kowalski, Propositions 4.1, 4.5, 4.7: the Dirichlet character attached to (g, χ) and its L-function; FF.2/multiplicative-l-function: its monic L-series; FF.2/rank-one-sheaf-l-function: μ(π) is the Frobenius trace of the Kummer sheaf L_χ(g) at π.

Construction: Res(h, g) = Π_{h(α)=0} g(α) for monic h (mathlib:Polynomial.resultant_eq_prod_eval with leading coefficient 1). Multiplicativity in h: mathlib:Polynomial.resultant_mul_left, with degrees natDegree(h₁h₂) = natDegree h₁ + natDegree h₂ for monic polynomials. Value at X − a: Res(X − a, g) = g(a). Minimal polynomials: Res(π, g) = N_{F(x)/F}(g(x)) and N_{L/F}(g(x)) = N_{F(x)/F}(g(x))^{[L:F(x)]} (mathlib:Algebra.norm_norm).

Acceptance: g = 1 gives μ ≡ 1 on monic polynomials. g = X gives μ(h) = χ((−1)^{deg h} h(0)). Mathlib's trivial character: μ(h) = 1 if gcd(h, g) = 1 and 0 otherwise.

Rests on: other layers `FF.1/trivial-character-conventions`; library `Polynomial.resultant`, `Polynomial.resultant_eq_prod_eval`, `Polynomial.resultant_mul_left`, `Algebra.norm_norm`, `MulChar`.

Sources: Kowalski, Chapter 4, Proposition 4.1 and formula (4.5), printed pp. 36-38.

**Construction `additive-l-function`** — The L-function L(f, ψ; T) of a one-variable additive character sum. L(f, ψ; T) := L(λ_{f,ψ}; T) = Σ_{h monic} ψ(Tr_{F[X]/(h)}(f)) T^{deg h} ∈ ℂ⟦T⟧. By the Euler product lemma it satisfies T·L′ = L·Σ_{ν≥1} S_ν(f, ψ)T^ν, i.e. L(f, ψ; T) = exp(Σ_ν S_ν(f, ψ)T^ν/ν) — Kowalski's Z(g, ψ; T) of (5.3).

Hypotheses and conventions: F finite, ψ an additive character, f ∈ F[X]. S_ν is the companion sum over any extension of degree ν.

API: `additiveLFunction` (data: L(f, ψ; T) = monicLSeries (rootSumAddChar f ψ)); `additiveLFunction_coeff_one` (characterisation: coeff 1 L(f, ψ; T) = Σ_{x∈F} ψ(f(x))); `additiveLFunction_logDeriv` (characterisation: T·L′ = L·Σ_{ν≥1} S_ν(f, ψ)T^ν (companion sums over extensions of degree ν)); `additiveLFunction_add_C` (relation: coeff n L(f + C c, ψ; T) = ψ(c)^n · coeff n L(f, ψ; T)); `additiveLFunction_mulShift` (relation: L(f, ψ.mulShift a; T) = L(a·f, ψ; T)).

Unit tests: For f = 0: coeff n L = q^n (`additiveLFunction_test_zero`, degenerate); For f = X and ψ ≠ 1: coeff n L = 0 for every n ≥ 1 (`additiveLFunction_test_X`, computation); For ψ the primitive character through the trace to the prime field and f = X^p − X: coeff n L = q^n for all n, so L is not a polynomial although deg f = p ≥ 1 (`additiveLFunction_test_artinSchreier`, non-example).

Uses: Kowalski, Proposition 5.9 and Theorem 3.2: the polynomial L(f, ψ; T) carries the reciprocal roots ω_j with S_ν = −Σ ω_j^ν; FF.2/artin-schreier-zeta-factorization: the numerator of the zeta function of y^q − y = f(x) is the product of the L(af, ψ; T); FF.2/rank-one-sheaf-l-function: L(f, ψ; T) = det(1 − T·Frob | H¹_c(A¹, L_ψ(f))).

Construction: Definition: monicLSeries (rootSumAddChar f ψ). Logarithmic derivative: FF.2/monic-l-series-log-derivative with w_L(x) = ψ(Tr_{L/F}(f(x))), justified by rootSumAddChar_minpoly_pow. Constant shift: λ_{f+c}(h) = ψ(c)^{deg h} λ_f(h), so L(f + c, ψ; T) = L(f, ψ; ψ(c)T).

Acceptance: f = X, ψ ≠ 1: L = 1. f = 0: L = 1/(1 − qT). f = X^p − X with ψ the canonical character: L = 1/(1 − qT), not a polynomial.

Rests on: nodes `monic-l-series`, `monic-l-series-log-derivative`, `root-sum-additive-character`, `additive-companion-sum`.

Sources: Kowalski, Chapter 5, section 5.3, display (5.3), printed p. 70.

**Construction `multiplicative-l-function`** — The L-function Z(g, χ; T) of a one-variable multiplicative character sum. Z(g, χ; T) := L(μ_{g,χ}; T) = Σ_{h monic} χ(Res(h, g)) T^{deg h}. It satisfies Z(g, χ; T) = exp(Σ_ν S̃_ν(g, χ)T^ν/ν) — Kowalski's zeta function Z(g, χ; T) of (4.10), equal to L(η, χ(−1)^{deg g}T) for the Dirichlet character η modulo g.

Hypotheses and conventions: F finite, χ a multiplicative character, g ∈ F[X].

API: `multiplicativeLFunction` (data: Z(g, χ; T) = monicLSeries (rootSumMulChar g χ)); `multiplicativeLFunction_coeff_one` (characterisation: coeff 1 Z(g, χ; T) = Σ_{x∈F} χ(g(x))); `multiplicativeLFunction_logDeriv` (characterisation: T·Z′ = Z·Σ_{ν≥1} S̃_ν(g, χ)T^ν); `multiplicativeLFunction_C_mul` (relation: coeff n Z(C c * g, χ; T) = χ(c)^n · coeff n Z(g, χ; T)).

Unit tests: For g = 1: coeff n Z = q^n (`multiplicativeLFunction_test_one`, degenerate); For g = X and χ ≠ 1: coeff n Z = 0 for n ≥ 1 (`multiplicativeLFunction_test_X`, computation); For g = X^e with e = orderOf χ ≥ 2: coeff n Z = q^n − q^{n−1} for n ≥ 1, so Z is not a polynomial (`multiplicativeLFunction_test_perfectPower`, non-example).

Uses: Kowalski, Propositions 4.5, 4.8, 4.14: polynomiality, leading coefficient and Riemann hypothesis for multiplicative sums; FF.2/kummer-zeta-factorization: the numerator of the zeta function of y^d = g(x) is the product of the Z(g, χ; T) over χ of order dividing d, χ ≠ 1; FF.2/weil-bound-multiplicative: the bound is read off the reciprocal roots of Z.

Construction: Definition: monicLSeries (rootSumMulChar g χ). Exponential identity: FF.2/monic-l-series-log-derivative with w_L(x) = χ(N_{L/F}(g(x))), justified by rootSumMulChar_minpoly_pow. Comparison with Kowalski's L(η, T): μ(h) = χ(−1)^{deg g · deg h} η(h) (resultant symmetry, mathlib:Polynomial.resultant_comm), which is (4.10).

Acceptance: g = X, χ ≠ 1: Z = 1. g = 1: Z = 1/(1 − qT). g = X^e with e the order of χ: Z = (1 − T)/(1 − qT), not a polynomial.

Rests on: nodes `monic-l-series`, `monic-l-series-log-derivative`, `root-sum-multiplicative-character`, `multiplicative-companion-sum`; library `Polynomial.resultant_comm`.

Sources: Kowalski, Chapter 4, Proposition 4.7 and (4.10), printed pp. 41-42.

**Lemma `l-function-reciprocal-roots`** — Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function. Let Λ be completely multiplicative on monic polynomials with L(Λ; T) = exp(Σ_ν W_ν T^ν/ν) (FF.2/monic-l-series-log-derivative), and suppose L(Λ; T) is a polynomial P(T) ∈ ℂ[T] of degree ≤ δ. Write P(T) = Π_{j=1}^{δ}(1 − ω_j T) with ω_j ∈ ℂ (the roots of the reversed polynomial T^δ P(1/T), padded by zeros). Then W_ν = −Σ_{j=1}^{δ} ω_j^ν for every ν ≥ 1, and |W_ν| ≤ δ·max_j |ω_j|^ν.

Hypotheses and conventions: P(0) = 1 (automatic: Λ(1) = 1). The ω_j are counted with multiplicity.

Proof: P splits over ℂ (mathlib:IsAlgClosed) and, since P(0) = 1, P(T) = Π(1 − ω_j T) where the ω_j are the roots of the reverse polynomial (mathlib:Polynomial.reverse). Formal logarithmic derivative: T P′/P = Σ_j −ω_j T/(1 − ω_j T) = −Σ_ν (Σ_j ω_j^ν) T^ν; compare with Σ_ν W_ν T^ν (Kowalski, proof of Corollary 4.9(2)).

Acceptance: L = 1 + cT gives W_ν = (−c)^ν·(−1) = −(−c)^ν. Kloosterman: 1 + K T + qT² gives K_ν = −(α^ν + β^ν) with αβ = q.

Rests on: nodes `monic-l-series-log-derivative`; library `IsAlgClosed`, `Polynomial.reverse`, `PowerSeries.derivative`.

Sources: Kowalski, Chapter 4, Corollary 4.9(2), printed p. 45; Kowalski, Chapter 4, Remark 4.10(3), printed p. 46.

### 2. Polynomiality, degree and the functional equation

Kowalski's coefficient computations. For `p ∤ d`, `λ(h)` depends only on the top `d` coefficients of `h` (Newton's identities), and the free sums over the remaining coefficients vanish, so `L(f, ψ; T)` has degree at most `d − 1`. For `g` not degenerate, `μ(h)` depends only on `deg h` and `h` modulo the radical of `g`, and the sums over residue classes vanish, so `Z(g, χ; T)` has degree at most `m − 1`. The Gauss sum of a primitive character of `F[X]/(g)` gives the exact degree and the functional equation.

**Lemma `root-sum-additive-top-coefficients`** — For deg h ≥ deg f, λ_{f,ψ}(h) is linear in the d-th coefficient of h. Let f = Σ_{k=0}^{d} f_k X^k ∈ F[X] with d ≥ 1, f_d ≠ 0, and let h = X^n + a₁X^{n−1} + ⋯ + a_n be monic with n ≥ d. Then Tr_{F[X]/(h)}(f) = n·f₀ + Σ_{k=1}^{d} f_k P_k(a₁, …, a_k), where P_k ∈ ℤ[a₁, …, a_k] is the Newton polynomial expressing the k-th power sum of the roots of h through the elementary symmetric functions e_i = (−1)^i a_i, and P_d = −d·a_d + R_d(a₁, …, a_{d−1}). Consequently λ_{f,ψ}(h) = ψ(n f₀) · ψ(Φ_f(a₁, …, a_{d−1})) · ψ(−d f_d a_d) with Φ_f ∈ F[a₁, …, a_{d−1}] depending only on f.

Hypotheses and conventions: n ≥ d ≥ 1 (for n < d the formula holds with a_i := 0 for i > n but the a_d-term is absent). No hypothesis on p here; the coefficient −d f_d of a_d vanishes when p | d.

Proof: The trace of X^k on F[X]/(h) is the power sum p_k of the roots (as in FF.2/root-sum-additive-character). Newton's identities (mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum) express p_k through e₁, …, e_k; p_k involves e_k linearly with coefficient (−1)^{k−1}k and no e_j with j > k. Substitute e_i = (−1)^i a_i: the only occurrence of a_d in Σ_{k≤d} f_k p_k is (−1)^{d−1} d f_d e_d = −d f_d a_d.

Acceptance: f = X³ + aX, as in Kowalski's Example 5.12: λ(h) = ψ(−a₁³ − 3a₃ + 3a₁a₂ − a a₁), linear in a₃ with coefficient −3. f = X^d with p | d: the a_d-coefficient vanishes, consistent with the Artin–Schreier degeneracy.

Rests on: nodes `root-sum-additive-character`; library `MvPolynomial.psum_eq_mul_esymm_sub_sum`.

Sources: Kowalski, Chapter 5, Lemma 5.11, proof of (2), printed p. 74; Kowalski, Chapter 5, Example 5.13, printed p. 76.

**Theorem `additive-l-function-is-polynomial`** — L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f). Let ψ ≠ 1 and f ∈ F[X] of degree d ≥ 1 with p ∤ d. Then coeff_n L(f, ψ; T) = 0 for every n ≥ d. Hence L(f, ψ; T) is (the image of) a polynomial of degree ≤ d − 1 with constant term 1.

Hypotheses and conventions: ψ nontrivial (hence primitive, F being a field). d = deg f ≥ 1 and p ∤ d. No hypothesis d < q (Kowalski's Lemma 5.10 assumes it; the proof below does not use it).

Proof: For n ≥ d, index the monic polynomials of degree n by (a₁, …, a_n) ∈ F^n. By FF.2/root-sum-additive-top-coefficients, λ(h) = ψ(n f₀) ψ(Φ_f(a₁, …, a_{d−1})) ψ(−d f_d a_d). Sum over a_d ∈ F first: Σ_{a∈F} ψ(−d f_d · a) = 0 because −d f_d ≠ 0 (p ∤ d, f_d ≠ 0) and ψ is primitive (mathlib:AddChar.IsPrimitive.of_ne_one, mathlib:AddChar.sum_mulShift). Hence c_n = 0. This replaces the source's route through the quotient group P(F_q)/P_∞(d+1) (Lemma 5.11), whose proof assumes g(0) = 0 without the reduction (FiniteFieldsAndCharacterSums/E303).

Acceptance: f = X (d = 1): L = 1. p = 3 and f = X³ with the canonical character: Tr(x³) = Tr(x), so L(X³, ψ; T) = L(X, ψ; T) = 1 has degree 0, not d − 1 = 2; when p | d the degree of f is not the right invariant (FF.2/artin-schreier-reduced-form). q = 5, f = X²: L = 1 + g T with g the quadratic Gauss sum, |g| = √5.

Rests on: nodes `additive-l-function`, `root-sum-additive-top-coefficients`; library `AddChar.IsPrimitive.of_ne_one`, `AddChar.sum_mulShift`.

Sources: Kowalski, Chapter 5, Proposition 5.9, printed p. 70; Kowalski, Chapter 5, end of the proof of Proposition 5.9, printed p. 76.

**Lemma `root-sum-multiplicative-periodicity`** — μ_{g,χ}(h) depends only on deg h and on h modulo the radical of g. Let g = c·Π_{i=1}^{r} π_i^{k_i} with c ∈ F^× and distinct monic irreducible π_i, and g♭ := Π π_i (deg g♭ = m, the number of distinct roots of g in F̄). For monic h: μ_{g,χ}(h) = χ(c)^{deg h} · χ(−1)^{deg g·deg h} · Φ(h mod g♭), where Φ(r) := Π_i χ(N_{(F[X]/(π_i))/F}(r mod π_i))^{k_i} for r ∈ F[X]/(g♭). Φ is multiplicative, vanishes exactly on the non-units of F[X]/(g♭), and restricts to a character of (F[X]/(g♭))^×.

Hypotheses and conventions: g ≠ 0 with the factorisation above; χ any multiplicative character.

Proof: Res(h, g) = (−1)^{deg g deg h} Res(g, h) (mathlib:Polynomial.resultant_comm) and Res(g, h) = c^{deg h} Π_i Res(π_i, h)^{k_i} (multiplicativity). For monic irreducible π: Res(π, h) = Π_{π(α)=0} h(α) = N_{(F[X]/(π))/F}(h mod π) (mathlib:Polynomial.resultant_eq_prod_eval, mathlib:Algebra.norm). Chinese remainder theorem F[X]/(g♭) ≅ Π F[X]/(π_i) (mathlib:Ideal.quotientInfRingEquivPiQuotient) shows Φ is well defined on F[X]/(g♭) and multiplicative.

Acceptance: g = X²: Φ(r) = χ(r(0))² — for χ quadratic this is the indicator of r(0) ≠ 0. g = X(X − 1): Φ(r) = χ(r(0))χ(r(1)).

Rests on: nodes `root-sum-multiplicative-character`; library `Polynomial.resultant_comm`, `Polynomial.resultant_eq_prod_eval`, `Algebra.norm`, `Ideal.quotientInfRingEquivPiQuotient`.

Sources: Kowalski, Chapter 4, proof of Proposition 4.1, formula (4.5), and Corollary 4.3(1), printed pp. 38-39.

**Theorem `multiplicative-l-function-is-polynomial`** — Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power. Let χ have order e ≥ 2 and let g ∈ F[X] be nonzero and not of the form c·h^e with c ∈ F̄ and h ∈ F̄[X] (equivalently: some root of g in F̄ has multiplicity not divisible by e). Let m be the number of distinct roots of g in F̄. Then coeff_n Z(g, χ; T) = 0 for every n ≥ m, so Z(g, χ; T) is a polynomial of degree ≤ m − 1 with constant term 1.

Hypotheses and conventions: χ of exact order e ≥ 2 (e | q − 1). g not of the form c·h^e over F̄; g may be non-squarefree.

Proof: For n ≥ m every residue class modulo g♭ contains exactly q^{n−m} monic polynomials of degree n (division by g♭; Kowalski, proof of Proposition 4.5(2)). By FF.2/root-sum-multiplicative-periodicity: c_n = q^{n−m} χ(c)^n χ(−1)^{n deg g} Σ_{r∈F[X]/(g♭)} Φ(r). Φ is a nontrivial character of (F[X]/(g♭))^×: choose π₀ with e ∤ k_{π₀}; the norm N : (F[X]/(π₀))^× → F^× is onto (mathlib:FiniteField.norm_surjective), so χ^{k_{π₀}} ∘ N ≠ 1; use the Chinese remainder theorem to put 1 in the other components (Kowalski, Corollary 4.3(2)). Σ Φ = 0 by orthogonality (mathlib:MulChar.sum_eq_zero_of_ne_one applied to Φ as a multiplicative character of the finite ring).

Acceptance: g = X, χ ≠ 1: m = 1, Z = 1. χ cubic, g = X²: m = 1 and g is not c·h³, so Z = 1 and Σ_x χ(x²) = 0 — a perfect square that is not degenerate for a cubic character. χ quadratic, g = X³ + aX + b squarefree, p odd: Z = 1 + c₁T + c₂T² with |c₂| = q (Kowalski Example 4.12).

Rests on: nodes `multiplicative-l-function`, `root-sum-multiplicative-periodicity`; library `FiniteField.norm_surjective`, `MulChar.sum_eq_zero_of_ne_one`.

Sources: Kowalski, Chapter 4, Proposition 4.5(2) and Corollary 4.3(2), printed pp. 39-40; Kowalski, Chapter 4, after Proposition 4.7, printed p. 42.

**Theorem `mixed-l-function-is-polynomial`** — The L-function of a mixed sum χ(g(x))ψ(f(x)) is a polynomial of degree at most m + n − 1. Let ψ ≠ 1, f ∈ F[X] of degree n ≥ 1 with p ∤ n, χ any multiplicative character and g ∈ F[X] nonzero with m distinct roots in F̄. For Λ := λ_{f,ψ}·μ_{g,χ} (completely multiplicative on monic polynomials), coeff_N L(Λ; T) = 0 for all N ≥ n + m, so L(Λ; T) is a polynomial of degree ≤ n + m − 1; its companion sums are W_ν = Σ_{x∈L} χ(N_{L/F}(g(x))) ψ(Tr_{L/F}(f(x))).

Hypotheses and conventions: p ∤ n = deg f ≥ 1; χ may be trivial (Mathlib's convention: χ(0) = 0, so the sum runs over g(x) ≠ 0).

Proof: For N ≥ n + m, parametrise monic h of degree N by its top n coefficients (a₁, …, a_n) and its residue modulo g♭; since N − n ≥ m = deg g♭, the lower coefficients reach every residue class, each exactly q^{N−n−m} times for fixed (a₁, …, a_n). λ depends only on (a₁, …, a_n) (FF.2/root-sum-additive-top-coefficients) and μ only on N and the residue (FF.2/root-sum-multiplicative-periodicity), so c_N factors as a multiple of Σ_{a_n∈F} ψ(−n f_n a_n) = 0. The companion sums: FF.2/monic-l-series-log-derivative with the product weights.

Acceptance: g = 1: reduces to FF.2/additive-l-function-is-polynomial (m = 0). f = X, g = X, χ ≠ 1: degree ≤ 1 and W₁ = Σ χ(x)ψ(x) is a Gauss sum (FF.2/gauss-sum-frobenius-eigenvalue).

Rests on: nodes `monic-l-series-log-derivative`, `root-sum-additive-top-coefficients`, `root-sum-multiplicative-periodicity`; library `AddChar.sum_mulShift`.

Sources: Kowalski, Chapter 5, Remark 5.14(2), printed p. 77; Fouvry–Kowalski–Michel–Sawin, section 4.2.2-4.2.3, pp. 11-12.

**Lemma `primitive-ring-gauss-sum-norm`** — Gauss sums of primitive characters of F[X]/(g) have absolute value q^{deg g / 2}. Let g ∈ F[X] be monic squarefree of degree m, R := F[X]/(g), ℓ_{m−1}(r) the coefficient of X^{m−1} of the reduced representative of r, and ψ₁ := ψ ∘ ℓ_{m−1} for a nontrivial ψ. If η is a multiplicative character of R whose restriction to each factor (F[X]/(π))^× (π | g irreducible) is nontrivial (η primitive), then gaussSum η ψ₁ · gaussSum η⁻¹ ψ₁⁻¹ = |R| = q^m; for complex values |τ(η, ψ₁)|² = q^m.

Hypotheses and conventions: g squarefree (Kowalski proves (4.12) in this case, which is the case used). ψ ≠ 1; η primitive.

Proof: Chinese remainder: R ≅ Π_{π|g} F[X]/(π) (mathlib:Ideal.quotientInfRingEquivPiQuotient); η = Π η_π and ψ₁ = Π ψ_π with ψ_π additive characters of the finite fields F[X]/(π). Each ψ_π is nontrivial: for f = (g/π)·h with deg h = deg π − 1, ψ₁(xf) = ψ(x) (Kowalski's argument), and ψ ≠ 1. The Gauss sum factorises over the product, and on each finite-field factor gaussSum η_π ψ_π · gaussSum η_π⁻¹ ψ_π⁻¹ = |F[X]/(π)| (mathlib:gaussSum_mul_gaussSum_eq_card).

Acceptance: m = 1: the classical |τ(χ, ψ)|² = q. η trivial on a factor: the factor Gauss sum is −1 and the identity fails; primitivity is needed.

Rests on: library `gaussSum`, `gaussSum_mul_gaussSum_eq_card`, `Ideal.quotientInfRingEquivPiQuotient`.

Sources: Kowalski, Chapter 4, proof of Proposition 4.8, claim (4.12), printed pp. 44-45.

**Theorem `multiplicative-l-function-leading-coefficient`** — Exact degree and leading coefficient of Z(g, χ; T). Let χ have order e, let g ∈ F[X] be non-constant with e ∤ deg g and with no irreducible factor of multiplicity divisible by e, and let m be the number of distinct roots of g in F̄. Then Z(g, χ; T) is a polynomial of degree exactly m − 1 whose leading coefficient has absolute value q^{(m−1)/2}; writing Z = Π_{j=1}^{m−1}(1 − Ω_j T), |Ω₁ ⋯ Ω_{m−1}| = q^{(m−1)/2}.

Hypotheses and conventions: e ∤ deg g and no multiplicity k_π divisible by e (Corollary 4.9's hypotheses); χ of order e ≥ 2.

Proof: The attached character η is primitive modulo g♭ and nontrivial on constants (η|F^× = χ^{deg g}, formula (4.7)) — Kowalski, proof of Corollary 4.9(1), using FF.2/root-sum-multiplicative-periodicity. Leading coefficient formula (4.11): c_{m−1}(η) = τ(η, ψ₁) τ(η̄|F^×, ψ̄)/q, obtained by detecting the monic condition with additive characters. |τ(η, ψ₁)|² = q^m (FF.2/primitive-ring-gauss-sum-norm) and |τ(η̄|F^×, ψ̄)|² = q (mathlib:gaussSum_mul_gaussSum_eq_card with complex conjugation), so |c_{m−1}| = q^{(m−1)/2}. Transfer to Z(g, χ; T) = L(η, χ(−1)^{deg g}T) changes the leading coefficient by a root of unity.

Acceptance: χ quadratic, g = X³ + aX + b squarefree: |c₂| = q, and c₂ = ±q is an integer (Kowalski Example 4.12). χ quadratic, g = X² − a with a ≠ 0 (so e | deg g): Σ_x χ(x² − a) = −1, so the leading coefficient has absolute value 1, not q^{1/2}; the hypothesis e ∤ deg g cannot be dropped.

Rests on: nodes `multiplicative-l-function-is-polynomial`, `root-sum-multiplicative-periodicity`, `primitive-ring-gauss-sum-norm`; library `gaussSum_mul_gaussSum_eq_card`.

Sources: Kowalski, Chapter 4, Corollary 4.9(1), printed p. 45; Kowalski, Chapter 4, Proposition 4.8, formula (4.11), printed p. 44.

**Theorem `multiplicative-l-function-functional-equation`** — Functional equation of the L-function of a primitive character modulo g. Let g ∈ F[X] be monic of degree d ≥ 1 and η a primitive Dirichlet character modulo g (Kowalski's sense) with η|F^× ≠ 1. Then L(η, T) = W(η) T^{d−1} L(η̄, (qT)^{−1}) with W(η) = τ(η, ψ₁)τ(η̄|F^×, ψ̄)/q; |W(η)| = q^{(d−1)/2}. For Z(g, χ; T) under the hypotheses of FF.2/multiplicative-l-function-leading-coefficient with g squarefree, this reads Z(g, χ; T) = W′ T^{m−1} Z(g, χ̄; (qT)^{−1}) with W′ = χ(−1)^{(m−1)deg g} W(η).

Hypotheses and conventions: η primitive modulo g and nontrivial on the constants. The comparison with Z(g, χ; T) uses (4.10).

Proof: For 1 ≤ j ≤ d − 1 detect the conditions ℓ_j(f) = 1, ℓ_{j+1}(f) = ⋯ = ℓ_{d−1}(f) = 0 with additive characters and rewrite c_j(η) through Gauss sums τ(η, ψ_h) = η̄(h)τ(η, ψ₁) (4.16), which vanish for h not coprime to g by primitivity. Obtain c_j(η) = τ(η, ψ₁)τ(η̄|F^×, ψ̄) q^{j−d} c_{d−1−j}(η̄), which is the coefficientwise form (4.15) of the functional equation. |W| from FF.2/primitive-ring-gauss-sum-norm and the Gauss sum over F.

Acceptance: d = 1: L = 1 and W(η) has absolute value 1. The functional equation and |c_{m−1}| = q^{(m−1)/2} are consistent: comparing leading and constant coefficients gives Proposition 4.8.

Rests on: nodes `multiplicative-l-function-leading-coefficient`, `primitive-ring-gauss-sum-norm`.

Sources: Kowalski, Chapter 4, Proposition 4.11, printed pp. 46-47.

### 3. Point counts on Artin–Schreier and Kummer curves

Averaging the companion sums over the twists `af`, `a ∈ F^×` (additive Hilbert 90), or over the characters of order dividing `d` (with Mathlib's convention at `0`), gives the affine point count of `y^q − y = f(x)` or `y^d = g(x)` minus `|L|`. Conversely an upper bound for the counts of all twists gives a lower bound for each.

**Lemma `trace-kernel-artin-schreier`** — The kernel of Tr_{L/F} is the image of y ↦ y^q − y (additive Hilbert 90 for finite fields). Let L/F be an extension of finite fields, q = |F|. For z ∈ L: Tr_{L/F}(z) = 0 if and only if z = y^q − y for some y ∈ L; in that case there are exactly q such y (a coset of F). In particular Tr_{L/F} is onto F.

Hypotheses and conventions: L/F finite extension of finite fields; q = |F|.

Proof: δ(y) := y^q − y is F-linear on L with kernel F (the roots of X^q − X in L are exactly F: mathlib:FiniteField.roots_X_pow_card_sub_X), so dim_F im δ = [L:F] − 1. im δ ⊆ ker Tr: Tr(y^q) = Tr(y), the trace being the sum over the Frobenius orbit (mathlib:FiniteField.algebraMap_trace_eq_sum_pow). ker Tr is the zero set of the polynomial X + X^q + ⋯ + X^{q^{ν−1}} of degree q^{ν−1}, so |ker Tr| ≤ q^{ν−1} = |im δ|; hence equality, and Tr is onto.

Acceptance: L = F: Tr = id and y^q − y = 0 for all y ∈ F, so both sides are {0}. F = F_2, L = F_4: ker Tr = {0, 1} = {y² − y : y ∈ F_4}.

Rests on: library `FiniteField.roots_X_pow_card_sub_X`, `FiniteField.algebraMap_trace_eq_sum_pow`, `Algebra.trace`.

Sources: Kowalski, Chapter 1, Lemma 1.3(1), printed p. 9.

**Lemma `artin-schreier-point-count-average`** — Averaging additive sums over the characters of F counts points of y^q − y = f(x). Let ψ ≠ 1, f ∈ F[X], q = |F|, and L/F finite. Then Σ_{a∈F^×} S_L(a·f, ψ) = #{(x, y) ∈ L × L : y^q − y = f(x)} − |L|.

Hypotheses and conventions: ψ nontrivial; f arbitrary (constant f allowed). The equation uses the q-power, q = |F|, not the p-power.

Proof: The characters of F are exactly the a ↦ ψ(a·) (ψ primitive: mathlib:AddChar.IsPrimitive.of_ne_one; there are q of them), and Σ_{a∈F} ψ(a t) = q·[t = 0] (mathlib:AddChar.sum_mulShift). Hence Σ_{a∈F} S_L(af, ψ) = q·#{x ∈ L : Tr_{L/F}(f(x)) = 0}. By FF.2/trace-kernel-artin-schreier each such x has exactly q solutions y of y^q − y = f(x), and no other x has any; subtract the a = 0 term |L|.

Acceptance: f = 0: the left side is (q − 1)|L| and the right side q|L| − |L|. f = X: every x with Tr(x) = 0 contributes q solutions, and the left side is 0.

Rests on: nodes `additive-companion-sum`, `trace-kernel-artin-schreier`; library `AddChar.IsPrimitive.of_ne_one`, `AddChar.sum_mulShift`.

Sources: Kowalski, Chapter 5, Lemma 5.1, printed pp. 66-67.

**Lemma `kummer-point-count-average`** — Averaging multiplicative sums over the characters of order dividing d counts points of y^d = g(x). Let d | q − 1, g ∈ F[X] and L/F finite. Then Σ_{χ ≠ 1, χ^d = 1} S̃_L(g, χ) = #{(x, y) ∈ L × L : y^d = g(x)} − |L|, the sum over the nontrivial multiplicative characters of F (MulChar F ℂ) of order dividing d.

Hypotheses and conventions: d | q − 1 (so d | |L| − 1 and F contains the d-th roots of unity). Mathlib's convention χ(0) = 0 for every χ: the identity holds as stated; only the proof step at points with g(x) = 0 depends on the convention.

Proof: The characters of L of order dividing d are exactly χ ∘ N_{L/F} with χ a character of F of order dividing d: the map χ ↦ χ ∘ N is injective because N is onto F^× (mathlib:FiniteField.norm_surjective), and both groups are cyclic of order d. For t ∈ L^×: #{y ∈ L : y^d = t} = Σ_{χ′^d = 1} χ′(t) (column orthogonality on L^×/(L^×)^d: tauceti:CommGroup.sum_monoidHom_apply_eq_ite). For t = 0 there is one solution y = 0, and every character (trivial included, with Mathlib's convention FF.1/trivial-character-conventions) vanishes at 0; the trivial character contributes #{x : g(x) ≠ 0}, and together with the x where g(x) = 0 this gives |L|.

Acceptance: d = 1: both sides are 0. g = 0: every nontrivial χ gives 0 and the curve y^d = 0 has |L| points.

Rests on: nodes `multiplicative-companion-sum`; other layers `FF.1/trivial-character-conventions`; library `FiniteField.norm_surjective`, `CommGroup.sum_monoidHom_apply_eq_ite`.

Sources: Kowalski, Chapter 4, Lemma 4.16, printed p. 51.

**Lemma `upper-to-lower-bound-kummer`** — From an upper bound for all twists εg to a lower bound for y^d = g(x). Let F be finite with Q elements, d | Q − 1, g ∈ F[X] non-constant, and a(h) := #{(x, y) ∈ F² : y^d = h(x)} − Q. Then #{(x, y) ∈ F² : y^d = g(x)} ≥ Q − (d − 1)·max_{ε∈F^×} |a(εg)|.

Hypotheses and conventions: d | Q − 1 (the source also assumes gcd(deg g, d) = 1, which the counting does not use).

Proof: Fix representatives ε₁ = 1, …, ε_d of F^×/(F^×)^d; each x with g(x) ≠ 0 has g(x) = ε y^d for exactly one representative ε and exactly d values of y. Counting points with y ≠ 0 on the curves y^d = ε⁻¹g(x): Σ_ε (Q + a(ε⁻¹g) − z) = d(Q − z) with z the number of zeros of g in F, so Σ_ε a(ε⁻¹g) = 0 and a(g) ≥ −(d − 1) max |a(ε⁻¹g)|.

Acceptance: d = 1: the bound is an equality #C = Q.

Rests on: library `Fintype.card`.

Sources: Kowalski, Chapter 4, Lemma 4.18, printed p. 52.

**Lemma `upper-to-lower-bound-artin-schreier`** — From an upper bound for all translates g + α to a lower bound for y^q − y = g(x). Let F_q ⊆ F with |F| = Q, g ∈ F[X] and a(h) := #{(x, y) ∈ F² : y^q − y = h(x)} − Q. Then #{(x, y) ∈ F² : y^q − y = g(x)} ≥ Q − (q − 1)·max_{α∈F} |a(g + α)|.

Hypotheses and conventions: F_q ⊆ F finite.

Proof: The group AS := F/{y^q − y} has order q (FF.2/trace-kernel-artin-schreier); with representatives α₁ = 0, …, α_q, every value g(x) is y^q − y + α for exactly one α and q values of y. Hence Σ_α #C_{g−α}(F) = qQ, i.e. Σ_α a(g − α) = 0, and a(g) ≥ −(q − 1) max|a(g + α)|.

Acceptance: F = F_q: y ↦ y^q − y vanishes on F, so AS = F and the curve y^q − y = g(x) − α has q·#{x ∈ F : g(x) = α} points; the identity Σ_α a(g − α) = 0 reduces to Σ_α #{g(x) = α} = q.

Rests on: nodes `trace-kernel-artin-schreier`; library `Fintype.card`.

Sources: Kowalski, Chapter 5, Lemma 5.3, printed pp. 67-68.

### 4. Stepanov's method in Bombieri's form

Everything happens in the ring `O(P, g)`. The pole degree is additive because `gcd(n, m) = 1` makes the representations `nδ + im` unique; the spaces `H(k)` have dimension `k + 1 − γ` for `k ≥ k₀`; the norm to `F[X]` bounds zeros by degree. The auxiliary function `Σ f_j^M s_j^Q` is nonzero, is an `M`-th power and vanishes at every `F`-point, so the number of points is at most `deg/M`; with `M = √Q` this is `Q + (2γ + 1)√Q` for `Q` an even power of `p`. Kowalski's Lemma 5.7 misprints the dimension bound (E301); the node uses the corrected value.

**Definition `stepanov-curve-ring`** — The coordinate ring F[X][Y]/(P(Y) − g(X)) of a Stepanov curve. Let F be a field, P ∈ F[Y] monic of degree n ≥ 1 and g ∈ F[X] of degree m ≥ 1 with gcd(n, m) = 1. The Stepanov ring is O(P, g) := F[X][Y]/(P(Y) − g(X)) = AdjoinRoot over F[X] of the monic polynomial P(Y) − g(X) in Y. It is a free F[X]-module with basis 1, Y, …, Y^{n−1}, an integral domain, and its points with values in a field K ⊇ F are the pairs (x, y) ∈ K² with P(y) = g(x). The two instances used are the Kummer ring (P = Y^d, d | |F| − 1, gcd(d, m) = 1) and the Artin–Schreier ring (P = Y^q − Y with F_q ⊆ F, p ∤ m).

Hypotheses and conventions: P monic of degree n ≥ 1; deg g = m ≥ 1; gcd(n, m) = 1 (Kowalski assumes it throughout §4.3 and §5.2).

API: `stepanovRing` (data: O(P, g) = AdjoinRoot (P.map C − C g) over F[X]); `stepanovRing.basis` (data: The F[X]-basis 1, Y, …, Y^{n−1}); `stepanovRing.pointsEquiv` (characterisation: F-algebra maps O(P, g) → K correspond to {(x, y) ∈ K × K : P(y) = g(x)}); `stepanovRing.finrank` (simp: finrank F[X] O(P, g) = n); `stepanovRing.frobeniusTwist` (data: The F-algebra endomorphism f ↦ f ∘ Fr of O(P, g) raising X and Y to the Q-th power, Q = |F| (coefficients unchanged)); `stepanovRing.frobenius_pow` (other: If F is finite with Q elements then for f ∈ O(P, g) the Frobenius twist f ∘ Fr (coefficients unchanged, variables raised to the Q-th power) equals f^Q); `stepanovRing.kummerRotate` (data: For P = Y^d and ξ ∈ F with ξ^d = 1: the F[X]-algebra automorphism Y ↦ ξY); `stepanovRing.artinSchreierShift` (data: For P = Y^q − Y and a ∈ F with a^q = a: the F[X]-algebra automorphism Y ↦ Y + a); `IsStepanovInstance` (data: The two instances treated: P = Y^d with 2 ≤ d, d ∣ |F| − 1, g squarefree, gcd(d, deg g) = 1; or P = Y^q − Y with q a power of p, F_q ⊆ F (exactly q solutions of a^q = a in F) and p ∤ deg g; in both, deg g ≥ 1).

Unit tests: For P = Y² and g = X³ + 1: finrank F[X] O = 2 (`stepanovRing_test_finrank`, computation); Over ZMod 5: #{(x, y) : y² = x³ + 1} = 5 (`stepanovRing_test_points`, computation); For P = Y², g = X² over a field of characteristic ≠ 2 (gcd(n, m) = 2): Y − X is a zero divisor in O(P, g) (`stepanovRing_test_not_coprime`, non-example).

Uses: Kowalski, section 4.3 (Bombieri's construction) and section 5.2: the ring of functions on which the auxiliary function is built; FF.2/pole-degree, FF.2/stepanov-norm: the degree and the norm are defined on it; AlgebraicCurves layer 10 (Kummer and Artin–Schreier covers): O(P, g) is the affine coordinate ring of the model; deg = −v_∞.

Construction: P(Y) − C g is monic in Y over F[X]; AdjoinRoot of a monic polynomial is free with the power basis 1, …, Y^{n−1} (mathlib:AdjoinRoot.powerBasis'). Points: F-algebra maps O(P, g) → K correspond to pairs (x, y) with P(y) = g(x) (universal property of AdjoinRoot over F[X]). Integral domain: from the multiplicativity of the pole degree (FF.2/pole-degree-mul).

Acceptance: Y² = X³ + 1 over F_5 has 5 affine points. rank n over F[X]. gcd(n, m) ≠ 1 fails: Y² − X² is not a domain in characteristic ≠ 2.

Rests on: library `AdjoinRoot`, `AdjoinRoot.powerBasis'`.

Sources: Kowalski, Chapter 4, section 4.3, before Definition 4.19, printed p. 54; Kowalski, Chapter 5, Definition 5.4, printed p. 68.

**Definition `pole-degree`** — The pole degree at infinity on a Stepanov ring. On O(P, g) (P of degree n, g of degree m, gcd(n, m) = 1) define, for f = Σ_{i<n} g_i(X) Y^i written in the basis of FF.2/stepanov-curve-ring, deg f := max{n·deg g_i + i·m : g_i ≠ 0} ∈ ℕ, and deg 0 := ⊥. It is the order of the pole of f at the unique place at infinity: deg X = n, deg Y = m.

Hypotheses and conventions: gcd(n, m) = 1; P monic of degree n; deg g = m.

API: `poleDegree` (data: deg f = max{n·deg g_i + i·m} ∈ WithBot ℕ); `poleDegree_X` (simp: deg X = n); `poleDegree_Y` (simp: deg Y = m); `poleDegree_C` (simp: For a ∈ F[X] nonzero: deg (a as an element of O) = n·natDegree a); `poleDegree_add_le` (relation: deg(f₁ + f₂) ≤ max(deg f₁, deg f₂)); `poleDegree_mul` (relation: deg(f₁f₂) = deg f₁ + deg f₂ (FF.2/pole-degree-mul)); `poleDegree_eq_bot_iff` (characterisation: deg f = ⊥ iff f = 0); `riemannRochSpace` (data: H(k) = {f ∈ O(P, g) : deg f ≤ k}, an F-subspace (the Riemann–Roch space L(k·∞)); its dimension is FF.2/riemann-roch-space-dimension).

Unit tests: deg 1 = 0 (`poleDegree_test_one`, degenerate); deg (Y^n) = n·m (`poleDegree_test_Y_pow`, computation); For P = Y², g = X³: deg(Y²) = 6 = deg(X³), whereas the Y-degree of Y² is 2; the pole degree is not the degree in Y (`poleDegree_test_not_Ydegree`, non-example).

Uses: Kowalski, Proposition 4.20 and Lemma 4.24: zeros are bounded by the degree and the spaces H(k) are cut out by it; FF.2/stepanov-upper-bound: deg of the auxiliary function bounds the point count; AlgebraicCurves layer 3: deg f = −v_∞(f) at the unique place over ∞ (comparison with the valuation of the function field).

Construction: Definition through the basis coordinates (a Finsupp over Fin n) and natDegree of the coefficients. Ultrametric inequality: termwise. Multiplicativity is FF.2/pole-degree-mul.

Acceptance: deg 1 = 0. deg(Y^n) = n·m: Y^n = g(X) + (lower terms in Y) has leading term of degree n·m. deg(C a·X^k) = n·k.

Rests on: nodes `stepanov-curve-ring`.

Sources: Kowalski, Chapter 4, Definition 4.19, printed p. 54.

**Lemma `coprime-semigroup-representation`** — Representations k = nδ + i m with 0 ≤ i < n are unique, and exist for k ≥ (n − 1)(m − 1). Let n, m ≥ 1 be coprime. For k ∈ ℕ there is at most one pair (δ, i) ∈ ℕ² with 0 ≤ i < n and k = nδ + i m; such a pair exists whenever k ≥ (n − 1)(m − 1).

Hypotheses and conventions: gcd(n, m) = 1.

Proof: Uniqueness: reduce modulo n; i m ≡ i′ m forces i ≡ i′ mod n, hence i = i′. Existence for k > nm − n − m: the Frobenius number of {n, m} is nm − n − m (mathlib:frobeniusNumber_pair, for n, m > 1); then reduce the coefficient of m modulo n. The cases n = 1 or m = 1 are immediate. Note (n − 1)(m − 1) = nm − n − m + 1.

Acceptance: n = 2, m = 3: 1 is not representable, every k ≥ 2 is. n = 3, m = 4: the gaps are 1, 2, 5.

Rests on: library `frobeniusNumber_pair`.

Sources: Kowalski, Chapter 4, Lemma 4.25, printed p. 58.

**Lemma `pole-degree-mul`** — The pole degree is additive on products; Stepanov rings are integral domains. On O(P, g) with gcd(n, m) = 1: for nonzero f₁, f₂, deg(f₁f₂) = deg f₁ + deg f₂. Consequently O(P, g) is an integral domain.

Hypotheses and conventions: gcd(n, m) = 1; P monic of degree n, deg g = m.

Proof: Let the top terms of f₁, f₂ be g_{i₁}Y^{i₁}, g_{i₂}Y^{i₂}, unique by FF.2/coprime-semigroup-representation (distinct terms have distinct degrees). If i₁ + i₂ < n their product is a basis term of degree deg f₁ + deg f₂; otherwise rewrite Y^{i₁+i₂} = Y^{i₁+i₂−n}(g(X) + R(Y)) with deg_Y R < n, and the leading contribution g·g_{i₁}g_{i₂}Y^{i₁+i₂−n} again has degree deg f₁ + deg f₂. All other products of terms have strictly smaller degree, again by uniqueness of representations; so the top term survives and the degrees add. Additivity with ⊥ absorbing gives no zero divisors.

Acceptance: deg(X·Y) = n + m. Kummer case P = Y^d is Kowalski's (4.22); Artin–Schreier case P = Y^q − Y is Proposition 5.6(1).

Rests on: nodes `stepanov-curve-ring`, `pole-degree`, `coprime-semigroup-representation`.

Sources: Kowalski, Chapter 4, Proposition 4.20(1) and its proof, printed pp. 54-57; Kowalski, Chapter 5, Proposition 5.6(1), printed p. 69.

**Lemma `riemann-roch-space-dimension`** — Dimensions of the spaces H(k) = {deg ≤ k}. On O(P, g) with gcd(n, m) = 1, H(k) := {f : deg f ≤ k} ∪ {0} is an F-subspace with basis {X^δ Y^i : 0 ≤ i < n, nδ + i m ≤ k}. Hence dim H(0) = 1, dim H(k) ≤ dim H(k + 1) ≤ dim H(k) + 1, and, with γ := #(ℕ ∖ (nℕ + mℕ)) the number of gaps of the semigroup generated by n and m, dim H(k) = k + 1 − γ for every k ≥ k₀ := (n − 1)(m − 1); moreover k + 1 − (n − 1)(m − 1) ≤ dim H(k) ≤ k + 1 for all k.

Hypotheses and conventions: gcd(n, m) = 1. (γ = (n − 1)(m − 1)/2 is the genus of the smooth projective model; the proof only needs γ ≤ (n − 1)(m − 1).).

Proof: The monomials X^δY^i (i < n) have pairwise distinct pole degrees nδ + im (FF.2/coprime-semigroup-representation), so a combination has the degree of its top monomial (FF.2/pole-degree-mul, ultrametric inequality): they form a basis of H(k). dim H(k) = #{j ≤ k : j ∈ nℕ + mℕ}; every j ≥ k₀ lies in the semigroup (FF.2/coprime-semigroup-representation), so dim H(k) = k + 1 − γ for k ≥ k₀. This corrects the printed lower bound of Kowalski's Lemma 5.7(2), FiniteFieldsAndCharacterSums/E301.

Acceptance: n = 2, m = 3: γ = 1, dim H(k) = k for k ≥ 1 (the elliptic case). n = 1: γ = 0 and H(k) is the polynomials of degree ≤ k.

Rests on: nodes `pole-degree`, `pole-degree-mul`, `coprime-semigroup-representation`.

Sources: Kowalski, Chapter 4, Lemma 4.24, printed p. 58; Kowalski, Chapter 5, Lemma 5.7, printed p. 70.

**Construction `stepanov-norm`** — The norm O(P, g) → F[X] and its degree. N : O(P, g) → F[X], N(f) := Algebra.norm F[X] f (the determinant of multiplication by f on the free F[X]-module O(P, g)). For the Kummer ring (P = Y^d, d | |F| − 1) N(f)(X) = Π_{ξ^d=1} f(X, ξY) and for the Artin–Schreier ring (P = Y^q − Y, F_q ⊆ F) N(f)(X) = Π_{a∈F_q} f(X, Y + a); the value at x is the product of the values of f at the points of the curve above x. N is multiplicative and natDegree N(f) = deg f.

Hypotheses and conventions: The product formulas need the group of Y-automorphisms (μ_d ⊆ F^×, resp. F_q ⊆ F) to act simply transitively on the fibres.

API: `stepanovNorm` (data: N(f) = Algebra.norm F[X] f); `stepanovNorm_mul` (relation: N(f₁f₂) = N(f₁)N(f₂)); `natDegree_stepanovNorm` (characterisation: For f ≠ 0: natDegree N(f) = deg f); `stepanovNorm_eq_prod_kummer` (compatibility: For P = Y^d with d | |F| − 1: N(f) = Π_{ξ ∈ μ_d(F)} σ_ξ(f), σ_ξ(Y) = ξY); `stepanovNorm_eq_prod_artinSchreier` (compatibility: For P = Y^q − Y with F_q ⊆ F: N(f) = Π_{a∈F_q} τ_a(f), τ_a(Y) = Y + a).

Unit tests: N(X) = X^n (`stepanovNorm_test_X`, computation); For P = Y²: N(Y) = −g (`stepanovNorm_test_Y_quadratic`, computation); N(C a) = a^n for a ∈ F (`stepanovNorm_test_C`, degenerate).

Uses: Kowalski, Proposition 4.20(2) and Proposition 5.6(2): the number of zeros of f with multiplicity is at most natDegree N(f) = deg f; FF.2/stepanov-zero-count: reduction of zero counting on the curve to zero counting of a polynomial.

Construction: N = Algebra.norm F[X] on the free module O(P, g) (mathlib:Algebra.norm). Product formula: over F(X), O ⊗ F(X) is Galois over F(X) with group μ_d (resp. F_q) acting on Y, and the norm is the product of the conjugates. Degree: deg(σ f) = deg f for each automorphism σ, so deg_O N(f) = n·deg f by FF.2/pole-degree-mul, and deg_O of a polynomial a(X) is n·natDegree a (poleDegree_C).

Acceptance: N(X) = X^n. Kummer, n = 2: N(Y) = −g(X). N(C a) = a^n for a ∈ F.

Rests on: nodes `stepanov-curve-ring`, `pole-degree-mul`; library `Algebra.norm`.

Sources: Kowalski, Chapter 4, proof of Proposition 4.20(2), (4.26), printed p. 57; Kowalski, Chapter 5, proof of Proposition 5.6(2), printed p. 69.

**Lemma `stepanov-zero-count`** — A nonzero M-th power in O(P, g) vanishing on a set S of points satisfies M·|S| ≤ deg f. In the Kummer instance (P = Y^d, d | |F| − 1, g squarefree, gcd(d, deg g) = 1) and in the Artin–Schreier instance (P = Y^q − Y, F_q ⊆ F, p ∤ deg g): if 0 ≠ f ∈ O(P, g) is an M-th power in O(P, g) and vanishes at every point of a finite set S of points of the curve with coordinates in F̄, then M·|S| ≤ deg f.

Hypotheses and conventions: g squarefree in the Kummer case (for the points with y = 0; Kowalski, Remark 4.23).

Proof: Multiplicity (Kowalski Definition 4.21): at a point with y ≠ 0 (all points in the Artin–Schreier case) X − x is a uniformiser, at y = 0 (Kummer) Y is; a zero has multiplicity ≥ 1 (Lemma 4.22, using d y^{d−1} ≠ 0, resp. ∂(Y^q − Y)/∂Y = −1, resp. g′(x) ≠ 0 for g squarefree). If f = h^M, h vanishes on S, so f has multiplicity ≥ M at each point of S. The polynomial N(f) vanishes at the x-coordinate of each point to order at least the sum of the multiplicities of the points above it (proof of Proposition 4.20(2)); hence M|S| ≤ natDegree N(f) = deg f (FF.2/stepanov-norm, mathlib:Polynomial.card_roots').

Acceptance: f = X − x with x ∈ F (M = 1): S = the n points above x, and n ≤ deg f = n. Without squarefreeness the y = 0 points can fail; Kowalski handles them by adding at most d points (Remark 4.23).

Rests on: nodes `stepanov-norm`, `pole-degree-mul`; library `Polynomial.card_roots'`.

Sources: Kowalski, Chapter 4, Proposition 4.20(2), printed pp. 54-55; Kowalski, Chapter 4, Lemma 4.22, printed p. 55.

**Lemma `auxiliary-function-uniqueness`** — Uniqueness of the representation Σ f_j^M s_j^Q when kM < Q. Let F be finite with Q elements, M = p^a dividing Q, and (s_j) a basis of H(κ) with strictly increasing pole degrees d_j (s_j ∈ H(d_j) ∖ H(d_j − 1)); put S_j := s_j^Q (= s_j ∘ Fr). If kM < Q, f_j ∈ H(k) and Σ_j f_j^M S_j = 0, then all f_j = 0. The set H̃(M, k, κ) of such sums is an F-subspace, spanned by the products f₁^M·(f₂ ∘ Fr) with f₁ ∈ H(k), f₂ ∈ H(κ), and dim_F H̃(M, k, κ) = dim H(k)·dim H(κ).

Hypotheses and conventions: kM < Q; M a power of p dividing Q.

Proof: Subspace: α = (α^{Q/M})^M for α ∈ F and (u + v)^M = u^M + v^M (Kowalski Lemma 4.26). Uniqueness: if i is the largest index with f_i ≠ 0, deg(f_i^M S_i) = M deg f_i + Q d_i exceeds M k + Q d_{i−1} ≥ deg(Σ_{j<i} f_j^M S_j) because Q(d_i − d_{i−1}) ≥ Q > Mk (FF.2/pole-degree-mul, ultrametric inequality) — Lemma 4.28. Dimension: uniqueness makes (f_j)_j ↦ Σ f_j^M S_j injective.

Acceptance: κ = 0: H̃ = {f^M : f ∈ H(k)}. The bound kM < Q is sharp for the argument: with kM = Q, f₁^M S₀ and f₀^M S₁ can have equal degree.

Rests on: nodes `riemann-roch-space-dimension`, `pole-degree-mul`, `stepanov-curve-ring`.

Sources: Kowalski, Chapter 4, Lemma 4.28, printed p. 61; Kowalski, Chapter 4, Lemma 4.26, printed p. 60.

**Lemma `auxiliary-function-vanishing`** — If Σ f_j^M s_j = 0 then Σ f_j^M s_j^Q vanishes on all F-points and is an M-th power. With the notation of FF.2/auxiliary-function-uniqueness: if Σ_j f_j^M s_j = 0 in O(P, g), then f := Σ_j f_j^M S_j vanishes at every point (x, y) ∈ F² of the curve, and f = (Σ_j f_j · s_j^{Q/M})^M is an M-th power in O(P, g).

Hypotheses and conventions: F finite with Q elements; M | Q a power of p.

Proof: At a point (x, y) with coordinates in F, s_j^Q(x, y) = s_j(x^Q, y^Q) = s_j(x, y) (Fr fixes F-points), so f(x, y) = Σ f_j(x, y)^M s_j(x, y) = 0. S_j = s_j^Q = (s_j^{Q/M})^M and the M-th power map is additive in characteristic p (stepanovRing.frobenius_pow).

Acceptance: All f_j = 0 gives f = 0 (the lemma is used with f ≠ 0, which FF.2/auxiliary-function-uniqueness guarantees).

Rests on: nodes `stepanov-curve-ring`, `auxiliary-function-uniqueness`.

Sources: Kowalski, Chapter 4, Lemma 4.27, printed p. 61.

**Lemma `auxiliary-function-existence`** — Existence of a nonzero auxiliary function of controlled pole degree. Let F be finite with Q elements, M = p^a | Q, k₀ = (n − 1)(m − 1) and γ as in FF.2/riemann-roch-space-dimension. If kM < Q, k ≥ k₀, κ ≥ k₀ and (k + 1 − γ)(κ + 1 − γ) > kM + κ + 1 − γ, then there are f_j ∈ H(k), not all zero, with Σ_j f_j^M s_j = 0; the auxiliary function f = Σ_j f_j^M s_j^Q is nonzero, vanishes on all F-points of the curve, is an M-th power, and deg f ≤ kM + Qκ.

Hypotheses and conventions: The inequalities as stated (Kowalski (4.31)).

Proof: Δ : H̃(M, k, κ) → H(kM + κ), Σ f_j^M S_j ↦ Σ f_j^M s_j is well defined by uniqueness (FF.2/auxiliary-function-uniqueness) and F_p-linear. dim_{F_p} ker Δ ≥ [F : F_p]((k + 1 − γ)(κ + 1 − γ) − (kM + κ + 1 − γ)) > 0 by FF.2/riemann-roch-space-dimension (all three indices are ≥ k₀). A nonzero element of ker Δ is a nonzero f (uniqueness again); FF.2/auxiliary-function-vanishing gives vanishing and the M-th power property; deg f ≤ max_j(M deg f_j + Q d_j) ≤ kM + Qκ.

Acceptance: γ = 0 (n = 1, the affine line): the construction produces a polynomial vanishing on F of degree ≥ Q, the trivial case.

Rests on: nodes `auxiliary-function-uniqueness`, `auxiliary-function-vanishing`, `riemann-roch-space-dimension`.

Sources: Kowalski, Chapter 4, section 4.3, the map Δ and (4.31), printed p. 62.

**Theorem `stepanov-upper-bound`** — Stepanov–Bombieri upper bound #C(F_Q) ≤ Q + (2γ + 1)√Q for Q a square. In the Kummer instance (P = Y^d, d | Q − 1, g squarefree, gcd(d, deg g) = 1) and the Artin–Schreier instance (P = Y^q − Y, F_q ⊆ F, p ∤ deg g, deg g < q) over F with Q = p^{2a} elements: if Q > Q₀ := max((γ + 1)⁴, (2k₀)²) then #C(F) ≤ Q + (2γ + 1)√Q, where C(F) = {(x, y) ∈ F² : P(y) = g(x)}. Consequently #C(F) ≤ Q + C₁√Q for every such Q, with C₁ := max(2γ + 1, n·√Q₀) depending only on n and m.

Hypotheses and conventions: Q an even power of p; the hypotheses of FF.2/stepanov-zero-count.

Proof: Take M = √Q = p^a, κ = M + 2γ, k = ⌊γM/(γ + 1)⌋ + γ + 1; then (4.31) holds, kM < Q ⇔ Q > (γ + 1)⁴, and k, κ ≥ k₀ for Q > (2k₀)² (Kowalski, pp. 62-63; the printed value k₀² of Q₀ is corrected in FiniteFieldsAndCharacterSums/E304). FF.2/auxiliary-function-existence gives f ≠ 0, an M-th power vanishing on C(F), with deg f ≤ kM + Qκ. FF.2/stepanov-zero-count: M·#C(F) ≤ deg f, so #C(F) ≤ k + Qκ/M = k + Q + 2γ√Q ≤ Q + (2γ + 1)√Q since k < √Q. For Q ≤ Q₀ use the trivial bound #C(F) ≤ nQ ≤ n√Q₀√Q (at most n values of y for each x).

Acceptance: Kummer with d = 2, deg g = 3 (γ = 1): #C(F_Q) ≤ Q + 3√Q for Q > 16 — Hasse's bound up to the constant. The square hypothesis is essential for the choice M = √Q.

Rests on: nodes `auxiliary-function-existence`, `stepanov-zero-count`, `riemann-roch-space-dimension`.

Sources: Kowalski, Chapter 4, section 4.3, end of the proof, printed p. 63; Bombieri, section I, p. 235.

**Theorem `stepanov-bound-kummer-curve`** — Stepanov–Bombieri: |#{y^d = g(x)} − Q| ≤ C√Q over fields with Q = p^{2a} elements. Let F be finite with Q = p^{2a} elements, g ∈ F[X] non-constant, d | Q − 1 with gcd(deg g, d) = 1. Then |#{(x, y) ∈ F² : y^d = g(x)} − Q| ≤ C·√Q with C depending only on d and deg g.

Hypotheses and conventions: gcd(deg g, d) = 1; Q a square. g need not be squarefree (the points with y = 0 contribute at most deg g ≤ C′√Q extra, Kowalski Remark 4.23).

Proof: Upper bound for every εg (same degree): FF.2/stepanov-upper-bound, plus the y = 0 correction when g is not squarefree. Lower bound: FF.2/upper-to-lower-bound-kummer applied with that uniform upper bound.

Acceptance: d = 2, g = X³ + aX + b squarefree: |#{y² = g(x)} − Q| ≤ C√Q (Kowalski Remark 4.29, Hasse's theorem).

Rests on: nodes `stepanov-upper-bound`, `upper-to-lower-bound-kummer`.

Sources: Kowalski, Chapter 4, Theorem 4.17, printed p. 52.

**Theorem `stepanov-bound-artin-schreier-curve`** — Stepanov–Bombieri: |#{y^q − y = g(x)} − q^{2ν}| ≤ C q^ν over F_{q^{2ν}}. Let g ∈ F_q[X] be non-constant of degree d with p ∤ d and d < q. There is C ≥ 0 depending only on d and q such that for every ν ≥ 1 and every field L ⊇ F_q with q^{2ν} elements: |#{(x, y) ∈ L² : y^q − y = g(x)} − q^{2ν}| ≤ C q^ν.

Hypotheses and conventions: p ∤ d, d < q (as in the source); the base field F_q fixed, the extension L of even degree varying.

Proof: Upper bound for every translate g + α (α ∈ L; same degree, p ∤ d): FF.2/stepanov-upper-bound with P = Y^q − Y (n = q, m = d, γ ≤ (q − 1)(d − 1)). Lower bound: FF.2/upper-to-lower-bound-artin-schreier.

Acceptance: q = 2, g = X³: the curve y² + y = x³ is elliptic and supersingular over F_2; the bound is Hasse's up to the constant.

Rests on: nodes `stepanov-upper-bound`, `upper-to-lower-bound-artin-schreier`.

Sources: Kowalski, Chapter 5, Theorem 5.2, printed p. 67.

### 5. The one-variable Weil bounds, elementary route

Sections 1–4 combine: the reciprocal roots of every twist satisfy `|Σ (ω²)^ν| ≤ C q^ν` for all `ν`, and the power-sum converse gives `|ω| ≤ √q`. With the degree bound this is Weil's bound. The additive planet `weil-bound-additive` is an interface id.

**Theorem `additive-l-function-root-bound`** — Every reciprocal root of L(f, ψ; T) has absolute value at most √q (elementary proof). Let ψ ≠ 1 and f ∈ F[X] of degree d ≥ 1 with p ∤ d. Write L(f, ψ; T) = Π_j(1 − ω_j T). Then |ω_j| ≤ √q for every j.

Hypotheses and conventions: ψ ≠ 1; p ∤ d; no hypothesis d < q (it is removed by base change).

Proof: First assume d < q. For every a ∈ F^×, L(af, ψ; T) is a polynomial of degree ≤ d − 1 (FF.2/additive-l-function-is-polynomial) with reciprocal roots ω_{a,j}, and S_ν(af, ψ) = −Σ_j ω_{a,j}^ν (FF.2/l-function-reciprocal-roots). Over the extension L of degree 2ν: Σ_{a∈F^×} S_{2ν}(af, ψ) = #{y^q − y = f(x) over L} − q^{2ν} (FF.2/artin-schreier-point-count-average), of absolute value ≤ C q^ν (FF.2/stepanov-bound-artin-schreier-curve). So the finite family (ω_{a,j}²) satisfies |Σ (ω_{a,j}²)^ν| ≤ C q^ν for all ν ≥ 1, and the power-sum converse (request to WeilConjectures:WC.5:power-sum-converse) gives |ω_{a,j}|² ≤ q. If d ≥ q, pass to F′ ⊇ F of degree r with q^r > d: the companion sums of f over F′ with ψ ∘ Tr_{F′/F} are S_{rν}(f, ψ), so the reciprocal roots over F′ are the ω_j^r (FF.2/l-function-reciprocal-roots), and |ω_j^r| ≤ q^{r/2}.

Acceptance: f = X: there are no reciprocal roots. q = 5, f = X²: the single reciprocal root is minus the quadratic Gauss sum, of absolute value exactly √5.

Rests on: nodes `additive-l-function-is-polynomial`, `l-function-reciprocal-roots`, `artin-schreier-point-count-average`, `stepanov-bound-artin-schreier-curve`; stages `WeilConjectures:WC.5:power-sum-converse`.

Sources: Kowalski, Chapter 4, Lemma 4.15, printed p. 51; Kowalski, Chapter 5, introduction, printed p. 66.

**Theorem `multiplicative-l-function-root-bound-coprime`** — Every reciprocal root of Z(g, χ; T) has absolute value at most √q when gcd(deg g, ord χ) = 1 (elementary proof). Let χ have order e ≥ 2 and g ∈ F[X] non-constant with gcd(deg g, e) = 1. Then every reciprocal root Ω of Z(g, χ; T) satisfies |Ω| ≤ √q.

Hypotheses and conventions: gcd(deg g, e) = 1 (the case Kowalski's §4.2-4.3 proves; the general case is FF.2/weil-bound-multiplicative).

Proof: For every nontrivial χ′ of order dividing e, gcd(deg g, ord χ′) = 1, so g is not c·h^{ord χ′} and Z(g, χ′; T) is a polynomial (FF.2/multiplicative-l-function-is-polynomial) whose companion sums are minus power sums of its reciprocal roots (FF.2/l-function-reciprocal-roots). Over the extension of degree 2ν (which has q^{2ν} elements, a square with e | q^{2ν} − 1): Σ_{χ′≠1, χ′^e=1} S̃_{2ν}(g, χ′) = #{y^e = g(x)} − q^{2ν} (FF.2/kummer-point-count-average), bounded by C q^ν (FF.2/stepanov-bound-kummer-curve). Power-sum converse (WeilConjectures:WC.5:power-sum-converse) on the family of squares of all these reciprocal roots gives |Ω|² ≤ q.

Acceptance: χ quadratic, g = X³ + aX + b squarefree: the two reciprocal roots have absolute value ≤ √q, hence exactly √q since their product has absolute value q.

Rests on: nodes `multiplicative-l-function-is-polynomial`, `l-function-reciprocal-roots`, `kummer-point-count-average`, `stepanov-bound-kummer-curve`; stages `WeilConjectures:WC.5:power-sum-converse`.

Sources: Kowalski, Chapter 4, section 4.2, after Theorem 4.17, printed p. 52.

**Theorem `weil-bound-additive`** (planet: *Weil bound for additive character sums*) — Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f. Let F be a finite field with q elements and characteristic p, ψ a nontrivial additive character of F, and f ∈ F[X] of degree d ≥ 1 with p ∤ d. Then |Σ_{x∈F} ψ(f(x))| ≤ (d − 1)√q, and more generally |S_L(f, ψ)| ≤ (d − 1)|L|^{1/2} for every finite extension L/F.

Hypotheses and conventions: ψ ≠ 1. p ∤ d = deg f, d ≥ 1. The hypothesis cannot be dropped: see FF.2/artin-schreier-trivial-sum; for polynomials with p | deg f see FF.2/weil-bound-additive-reduced.

Proof: L(f, ψ; T) = Π_{j=1}^{δ}(1 − ω_jT) with δ ≤ d − 1 (FF.2/additive-l-function-is-polynomial). S_ν(f, ψ) = −Σ_j ω_j^ν (FF.2/l-function-reciprocal-roots), and |ω_j| ≤ √q (FF.2/additive-l-function-root-bound). Hence |S_ν| ≤ δ q^{ν/2} ≤ (d − 1)q^{ν/2}.

Acceptance: d = 1: the sum is 0. q = 5, f = X²: |Σ ψ(x²)| = √5, equality in the bound. F = F_9 (p = 3), f = X³ − X: the sum is 9 > (3 − 1)·3; p | d, and the bound fails — the degenerate case. Consumers: ExponentialSumsAndCircleMethod:ES.0 (complete sums modulo a prime), AdditiveCombinatorics AC.5b (Kai, Lemma 7.1).

Rests on: nodes `additive-l-function-is-polynomial`, `l-function-reciprocal-roots`, `additive-l-function-root-bound`, `additive-companion-sum`.

Sources: Kowalski, Chapter 3, Theorem 3.2, printed p. 31; Deligne, SGA 4½, [Sommes trig.] 3.8, Cas 1, volume pp. 193-194.

**Theorem `weil-bound-multiplicative-coprime-degree`** — Weil's multiplicative bound when gcd(deg g, ord χ) = 1, by Stepanov's method. Let χ have order e ≥ 2 and g ∈ F[X] non-constant with gcd(deg g, e) = 1, with m distinct roots in F̄. Then |Σ_{x∈F} χ(g(x))| ≤ (m − 1)√q, and |S̃_L(g, χ)| ≤ (m − 1)|L|^{1/2} for every finite extension L.

Hypotheses and conventions: gcd(deg g, e) = 1; this is the elementary, unconditional case. The general statement is FF.2/weil-bound-multiplicative.

Proof: Z(g, χ; T) has degree ≤ m − 1 (FF.2/multiplicative-l-function-is-polynomial; g is not c·h^e since gcd(deg g, e) = 1). S̃_ν = −Σ Ω_j^ν (FF.2/l-function-reciprocal-roots) and |Ω_j| ≤ √q (FF.2/multiplicative-l-function-root-bound-coprime).

Acceptance: χ quadratic, g = X³ + aX + b squarefree: |Σ χ(g(x))| ≤ 2√q, the Hasse bound for y² = g(x).

Rests on: nodes `multiplicative-l-function-is-polynomial`, `l-function-reciprocal-roots`, `multiplicative-l-function-root-bound-coprime`, `multiplicative-companion-sum`.

Sources: Kowalski, Chapter 3, Theorem 3.1, printed p. 31.

### 6. Degenerate cases

The acceptance criterion of the stage: Artin–Schreier-trivial and multiplicative perfect-power phases receive their exact values, not a false square-root bound. The reduced form `f*` also gives the correct bound `(deg f* − 1)√q` when `p ∣ deg f`.

**Definition `artin-schreier-reduced-form`** — The Artin–Schreier reduced form f* of a polynomial. Let F be finite of characteristic p. For f ∈ F[X], the Artin–Schreier reduced form f* is the unique polynomial such that (i) f* − f = h^p − h for some h ∈ X·F[X] (h without constant term) and (ii) f* has no monomial X^j with j ≥ 1 and p | j. It is computed by repeatedly replacing a term c X^{pk} (k ≥ 1) by c^{1/p} X^k, which leaves the constant term unchanged. For the canonical character ψ_can = ψ₀ ∘ Tr_{F/F_p} one has S_L(f, ψ_can) = S_L(f*, ψ_can); for ψ = ψ_can(b ·) the relevant form is (b f)*. The modified degree of f at ∞ is deg f* if f* is non-constant and 0 otherwise; f is Artin–Schreier trivial exactly when f* is constant.

Hypotheses and conventions: F finite of characteristic p (p-th roots exist in F: Frobenius is bijective). The normalisation h(0) = 0 makes f* unique (not merely unique up to ℘(F)).

API: `artinSchreierReduced` (data: f ↦ f*); `artinSchreierReduced_sub` (characterisation: f* − f = h^p − h for some h ∈ F[X] with h(0) = 0); `coeff_artinSchreierReduced` (characterisation: For j ≥ 1 with p | j the coefficient of X^j in f* is 0); `artinSchreierReduced_unique` (extensionality: Any polynomial satisfying the two properties equals f*); `artinSchreierReduced_eq_self` (simp: If f has no monomial X^j, j ≥ 1, p | j, then f* = f); `artinSchreierReduced_add` (relation: (f + g)* = f* + g*); `natDegree_artinSchreierReduced_le` (other: deg f* ≤ deg f, with equality when p ∤ deg f).

Unit tests: (X^p)* = X (`artinSchreierReduced_test_X_pow_p`, computation); (X^p − X)* = 0 (`artinSchreierReduced_test_trivial`, degenerate); Over a field of characteristic 2: (X² + X)* = 0 although X² + X has degree 2 (`artinSchreierReduced_test_char_two`, non-example).

Uses: Sommes trig., Exemple 3.5 and Proposition 3.8: the modified pole order and the reduction of P_d when it is a p-th power; FF.2/weil-bound-additive-reduced: the bound (deg f* − 1)√q for every polynomial phase; FF.2/modified-pole-order: for polynomials v*_∞(f) = deg f* when f* is non-constant.

Construction: Existence: induction on the largest j ≥ 1 with p | j carrying a nonzero coefficient c; subtracting h^p − h with h = c^{1/p}X^{j/p} removes that monomial and adds c^{1/p}X^{j/p} of smaller degree. Uniqueness: if f₁*, f₂* both satisfy (i)-(ii), their difference is h^p − h with h(0) = 0 and has no monomial of positive degree divisible by p; if h ≠ 0 its term (lead h)^p X^{p deg h} survives, so h = 0. Additivity (f + g)* = f* + g*, by uniqueness.

Acceptance: (X^p)* = X; (X^p − X)* = 0; (X^{p²})* = X. p = 2: (X² + X)* = 0 — an Artin–Schreier trivial polynomial of degree 2. If p ∤ deg f then deg f* = deg f.

Rests on: library `FiniteField.pow_card`.

Sources: Deligne, SGA 4½, [Sommes trig.] Exemple 3.5 a), volume p. 190; Deligne, SGA 4½, [Sommes trig.] 3.8, Cas 2, volume p. 194.

**Lemma `artin-schreier-invariance`** — Additive sums with the canonical character are invariant under f ↦ f + h^p − h. Let ψ_can = ψ₀ ∘ Tr_{F/F_p} with ψ₀ a nontrivial character of F_p (FF.1/canonical-additive-character). For h ∈ F[X] and every finite extension L: S_L(f + h^p − h, ψ_can) = S_L(f, ψ_can). Hence S_L(f, ψ_can) = S_L(f*, ψ_can) and L(f, ψ_can; T) = L(f*, ψ_can; T). For a general nontrivial ψ = ψ_can(b ·) (every nontrivial ψ has this form), S_L(f, ψ) = S_L((b f)*, ψ_can).

Hypotheses and conventions: ψ_can the character through the trace to the prime field; p = char F.

Proof: Tr_{L/F_p}(y^p − y) = 0 for y ∈ L: the absolute trace is invariant under the p-power Frobenius (mathlib:FiniteField.algebraMap_trace_eq_sum_pow over F_p), and Tr_{L/F_p} = Tr_{F/F_p} ∘ Tr_{L/F} (mathlib:Algebra.trace_trace). Every nontrivial ψ is ψ_can.mulShift b for a unique b ∈ F^× (FF.1/canonical-additive-character), and S_L(f, ψ_can.mulShift b) = S_L(b f, ψ_can). Apply to h(x) with x ∈ L and use FF.2/artin-schreier-reduced-form.

Acceptance: f = X^p, p = 3, F = F_9: S(X³) = S(X) = 0. The multiplier matters: for b ∈ F ∖ F_p, (b(X^p − X))* = (b^{1/p} − b)X is non-constant, so S_F(b(X^p − X), ψ_can) = 0 while S_F(X^p − X, ψ_can) = q.

Rests on: nodes `additive-companion-sum`, `artin-schreier-reduced-form`; other layers `FF.1/canonical-additive-character`; library `FiniteField.algebraMap_trace_eq_sum_pow`, `Algebra.trace_trace`.

Sources: Deligne, SGA 4½, [Sommes trig.] Exemple 3.5, (3.5.1) and the line after it, volume p. 191; Deligne, SGA 4½, [Sommes trig.] 1.3, (1.3.1), volume pp. 170-171.

**Theorem `artin-schreier-trivial-sum`** — Degenerate case: Artin–Schreier trivial phases have no cancellation. Let ψ = ψ_can(b ·) be nontrivial and f ∈ F[X] with (b f)* = c constant, i.e. b f = h^p − h + c with h ∈ F[X]. Then for every finite extension L: S_L(f, ψ) = |L| · ψ_can(c)^{[L:F]}; in particular |Σ_{x∈F} ψ(f(x))| = q, and L(f, ψ; T) = 1/(1 − ψ_can(c) q T) is not a polynomial.

Hypotheses and conventions: Artin–Schreier triviality relative to ψ (the multiplier b matters: X^p − X is trivial for ψ_can but b(X^p − X) need not be for b ∉ F_p).

Proof: FF.2/artin-schreier-invariance reduces to the constant phase c; S_L(c, ψ_can) = |L| ψ_can(Tr_{L/F} c) = |L| ψ_can(c)^{[L:F]}. The L-function: all companion sums are |L|ψ_can(c)^ν, so L = exp(Σ (qψ_can(c)T)^ν/ν) = 1/(1 − ψ_can(c)qT) (FF.2/additive-l-function).

Acceptance: F = F_9 (p = 3), f = X³ − X, ψ = ψ_can: Σ ψ(f(x)) = 9 > (3 − 1)·√9 = 6, so no bound (deg f − 1)√q can hold without p ∤ deg f. Degenerate acceptance for the stage: this case is tested, not given a square-root bound.

Rests on: nodes `artin-schreier-invariance`, `artin-schreier-reduced-form`, `additive-l-function`.

Sources: Deligne, SGA 4½, [Sommes trig.] Exemple 3.5, volume pp. 190-191.

**Theorem `weil-bound-additive-reduced`** — Weil's bound for an arbitrary polynomial phase, through the Artin–Schreier reduced form. Let ψ = ψ_can(b ·) be nontrivial and f ∈ F[X] arbitrary; let f* := (b f)*. Exactly one of the following holds. (a) f* is a constant c: S_L(f, ψ) = |L|ψ_can(c)^{[L:F]} for every L. (b) f* is non-constant of degree d* (then p ∤ d* automatically): |S_L(f, ψ)| ≤ (d* − 1)|L|^{1/2} for every L.

Hypotheses and conventions: ψ ≠ 1; f arbitrary.

Proof: S_L(f, ψ) = S_L(f*, ψ_can) (FF.2/artin-schreier-invariance). Case (a) is FF.2/artin-schreier-trivial-sum. Case (b): f* has no monomial of positive degree divisible by p, so p ∤ d*; apply FF.2/weil-bound-additive to f* and ψ_can.

Acceptance: p = 2, F = F_4, f = X⁴ + X: f* = X + X = 0, case (a), and |S| = 4. f = X^p + X² with p odd: f* = X + X², d* = 2, bound √q.

Rests on: nodes `artin-schreier-reduced-form`, `artin-schreier-invariance`, `artin-schreier-trivial-sum`, `weil-bound-additive`; other layers `FF.1/canonical-additive-character`.

Sources: Deligne, SGA 4½, [Sommes trig.] (3.5.2), volume p. 191.

**Theorem `multiplicative-perfect-power-sum`** — Degenerate case: g = c·h^e gives no cancellation for a character of order e. Let χ have order e ≥ 2, c ∈ F^× and h ∈ F[X] nonzero, g = c·h^e. Then for every finite extension L: S̃_L(g, χ) = χ(c)^{[L:F]}·(|L| − #{x ∈ L : h(x) = 0}); in particular |Σ_{x∈F} χ(g(x))| ≥ q − deg h. Z(g, χ; T) = Π_{π | h}(1 − (χ(c)T)^{deg π}) / (1 − χ(c)qT), not a polynomial. Conversely a polynomial g ∈ F[X] of the form c′·k^e with c′ ∈ F̄ and k ∈ F̄[X] can be written c·h^e with c ∈ F^×, h ∈ F[X] monic.

Hypotheses and conventions: χ of exact order e; the degeneracy condition is 'constant times an e-th power', not 'perfect power': g = X² is not degenerate for a cubic χ, and g = c·h^e with c not an e-th power is degenerate.

Proof: χ(h(x)^e) = χ(h(x))^e = 1 when h(x) ≠ 0 and 0 otherwise; N_{L/F}(c h(x)^e) = c^{[L:F]} N(h(x))^e. Descent of h: if g = c′k^e with k monic over F̄ then k^e = g/lc(g) ∈ F[X]; the roots of k and their multiplicities are Frobenius-stable (p ∤ e since e | q − 1), so k ∈ F[X]. The L-function: μ_{g,χ}(π) = χ(c)^{deg π} for π ∤ h and 0 for π | h, and the Euler product (FF.2/monic-l-series-log-derivative).

Acceptance: χ cubic, g = X²: not of the form c·h³, and Σ χ(x²) = Σ χ²(x) = 0 — a perfect square is not degenerate for a cubic character. χ quadratic, c a non-square, g = c(X² + 1)²: degenerate although not a perfect power. χ quadratic, g = X²: Σ χ(x²) = q − 1.

Rests on: nodes `multiplicative-companion-sum`, `multiplicative-l-function`, `monic-l-series-log-derivative`; other layers `FF.1/trivial-character-conventions`.

Sources: Kowalski, Chapter 4, Remark 4.6(1)-(2), printed p. 41; Kowalski, Chapter 3, Theorem 3.1, printed p. 31.

### 7. The curve route: purity from the Riemann hypothesis for curves

The function fields, their point counts and the factorisation of their zeta numerators. The curve layers of Tau Ceti's `AlgebraicCurves` roadmap (layers 2, 8, 10, 12) and `FunctionFieldArithmetic:FA.5` supply the function-field side through requests; `WeilConjectures:WC.3` supplies the Riemann hypothesis.

**Construction `artin-schreier-function-field`** — The Artin–Schreier function field F(X)[Y]/(Y^q − Y − f). Let F be finite with q elements and f ∈ F[X] of degree d ≥ 1 with p ∤ d. E_f := F(X)[Y]/(Y^q − Y − f) (AdjoinRoot over RatFunc F). It is a field, Galois of degree q over F(X) with group ≅ (F, +) acting by Y ↦ Y + a; its constant field is exactly F; exactly one place lies over the pole of X, it is totally ramified of degree one; and its genus is (q − 1)(d − 1)/2.

Hypotheses and conventions: p ∤ d = deg f ≥ 1 (then f ∉ ℘_q(F(X)) + F and Y^q − Y − f is irreducible).

API: `artinSchreierFunctionField` (data: E_f = AdjoinRoot (Y^q − Y − C f) over RatFunc F); `artinSchreierFunctionField.finrank` (simp: finrank (RatFunc F) E_f = q); `artinSchreierFunctionField.translate` (constructor: For a ∈ F the RatFunc F-algebra automorphism Y ↦ Y + a); `artinSchreierFunctionField.translate_add` (relation: translate (a + b) = translate a ∘ translate b; a ↦ translate a is an isomorphism (F, +) ≃ Gal(E_f/F(X))); `artinSchreierFunctionField.irreducible` (other: Y^q − Y − C f is irreducible over F(X) when p ∤ deg f).

Unit tests: For F = ZMod 2 and f = X³: finrank = 2 (`artinSchreierFunctionField_test_finrank`, computation); translate a has order p for a ≠ 0 (`artinSchreierFunctionField_test_translate_order`, computation); For f = X^q − X the polynomial Y^q − Y − C f has the root X in F(X), so it is reducible (`artinSchreierFunctionField_test_trivial`, non-example).

Uses: FF.2/artin-schreier-curve-point-count and FF.2/artin-schreier-zeta-factorization: its degree-one places over F_{q^ν} count the solutions of y^q − y = f(x); Kowalski section 5.2: the curve of the Stepanov–Bombieri argument; AlgebraicCurves layer 10: the genus formula of Artin–Schreier covers.

Construction: Irreducibility and the Galois group: the roots of Y^q − Y − f are y + a, a ∈ F; the translation action; f is not of the form u^q − u with u ∈ F(X) because v_∞(u^q − u) is divisible by p when negative. Ramification, constant field and genus: the elementary abelian Artin–Schreier cover of AlgebraicCurves layer 10 (Stichtenoth, Proposition 3.7.10) with the single pole ∞ of f, m_∞ = d prime to p: g = (q − 1)(d − 1)/2 (upstream AlgebraicCurves layers 10 and 8).

Acceptance: q = 2, f = X³: y² + y = x³, genus 1 (elliptic). d = 1: genus 0. f = X^q − X: Y^q − Y − f has the root X; not a field (non-example).

Rests on: library `AdjoinRoot`, `RatFunc`; Tau Ceti roadmap layers Tau Ceti `AlgebraicCurves` layer 10, Tau Ceti `AlgebraicCurves` layer 8, Tau Ceti `AlgebraicCurves` layer 12.

Sources: Deligne, SGA 4½, [Sommes trig.] 3.4, volume p. 190; Kowalski, Chapter 5, section 5.2, curve X, printed p. 68.

**Lemma `artin-schreier-curve-point-count`** — Degree-one places of E_f over F_{q^ν}: affine solutions plus one. For p ∤ d = deg f and every ν ≥ 1: the number N_ν(E_f) of degree-one places of the constant field extension E_f·F_{q^ν} equals #{(x, y) ∈ F_{q^ν}² : y^q − y = f(x)} + 1.

Hypotheses and conventions: p ∤ deg f.

Proof: The affine model is regular: ∂(Y^q − Y − f)/∂Y = −1, so F_{q^ν}[X, Y]/(Y^q − Y − f) is the integral closure of F_{q^ν}[X] in E_f F_{q^ν} and its degree-one places over finite x are its F_{q^ν}-points (AlgebraicCurves layer 2, Dedekind bridge). The unique place over ∞ is totally ramified, hence of degree one (FF.2/artin-schreier-function-field), and stays so after constant field extension (AlgebraicCurves layer 8).

Acceptance: q = 2, f = X³: the affine points over F_2 are (0, 0) and (0, 1); with the place at ∞, N₁ = 3 = q + 1, as for the supersingular curve y² + y = x³.

Rests on: nodes `artin-schreier-function-field`; Tau Ceti roadmap layers Tau Ceti `AlgebraicCurves` layer 2, Tau Ceti `AlgebraicCurves` layer 8, Tau Ceti `AlgebraicCurves` layer 10.

Sources: Kowalski, Chapter 5, Remark 5.5, printed p. 69.

**Theorem `artin-schreier-zeta-factorization`** — The numerator of the zeta function of y^q − y = f(x) is Π_{a≠0} L(af, ψ; T). Let ψ ≠ 1 and p ∤ d = deg f. With Z_{E_f}(T) = L_{E_f}(T)/((1 − T)(1 − qT)) the zeta function of E_f (L_{E_f} ∈ ℤ[T] of degree 2g, constant term 1): L_{E_f}(T) = Π_{a∈F^×} L(af, ψ; T). Consequently each L(af, ψ; T) has degree exactly d − 1.

Hypotheses and conventions: p ∤ d; ψ nontrivial.

Proof: log Z_{E_f} = Σ_ν N_ν T^ν/ν (FunctionFieldArithmetic:FA.5, requested), with N_ν = #affine + 1 (FF.2/artin-schreier-curve-point-count). #affine − q^ν = Σ_{a≠0} S_ν(af, ψ) (FF.2/artin-schreier-point-count-average) and exp(Σ S_ν(af)T^ν/ν) = L(af, ψ; T) (FF.2/additive-l-function). Comparing: exp(Σ (N_ν − 1 − q^ν)T^ν/ν) = L_{E_f}(T) = Π_a L(af, ψ; T). Degrees: deg L_{E_f} = 2g = (q − 1)(d − 1) (FF.2/artin-schreier-function-field) while each factor has degree ≤ d − 1 (FF.2/additive-l-function-is-polynomial); so every factor has degree d − 1.

Acceptance: q = 2, f = X³: F^× = {1} and L(X³, ψ; T) = L_E(T) = 1 + 2T² (the supersingular curve y² + y = x³), of degree d − 1 = 2.

Rests on: nodes `artin-schreier-function-field`, `artin-schreier-curve-point-count`, `artin-schreier-point-count-average`, `additive-l-function`, `additive-l-function-is-polynomial`; stages `FunctionFieldArithmetic:FA.5`; Tau Ceti roadmap layers Tau Ceti `AlgebraicCurves` layer 10.

Sources: Kowalski, Chapter 5, Lemma 5.1, printed pp. 66-67; Deligne, SGA 4½, [Sommes trig.] 3.4, volume p. 190.

**Theorem `additive-l-function-purity`** — Weil: L(f, ψ; T) has degree d − 1 and its reciprocal roots are q-Weil numbers of weight 1. Let ψ ≠ 1 and f ∈ F[X] of degree d ≥ 1 with p ∤ d. Then L(f, ψ; T) = Π_{j=1}^{d−1}(1 − ω_jT) with every ω_j an algebraic integer all of whose complex conjugates have absolute value √q.

Hypotheses and conventions: p ∤ d; ψ nontrivial (values in ℚ(μ_p) ⊂ ℂ).

Proof: By FF.2/artin-schreier-zeta-factorization every ω_j is a reciprocal root of L_{E_f}(T) ∈ ℤ[T], and deg L(f, ψ; T) = d − 1. L_{E_f} is the numerator of the zeta function of the smooth projective geometrically connected curve with function field E_f; all its reciprocal roots are algebraic integers with |ι(α)| = √q for every embedding ι (Riemann hypothesis for curves, requested from WeilConjectures:WC.3 in its all-conjugates form, with DeligneWeightsAndPurity:DWP.0's q-Weil numbers). Galois conjugates of ω_j are reciprocal roots of the same integer polynomial L_{E_f}, so the absolute value statement holds for every conjugate.

Acceptance: q = 5, f = X²: the reciprocal root is minus the quadratic Gauss sum, of absolute value √5; its conjugate by ζ₅ ↦ ζ₅² is the other Gauss sum, also of absolute value √5.

Rests on: nodes `artin-schreier-zeta-factorization`; stages `WeilConjectures:WC.3`, `DeligneWeightsAndPurity:DWP.0`.

Sources: Deligne, SGA 4½, [Sommes trig.] (3.5.5) and the sentence after it, volume p. 192; Kowalski, Chapter 4, Proposition 4.14(1), printed p. 50.

**Construction `kummer-function-field`** — The Kummer function field F(X)[Y]/(Y^d − g). Let d | q − 1 and g ∈ F[X] squarefree of degree m ≥ 1 with gcd(d, m) = 1. E_g := F(X)[Y]/(Y^d − g). It is a field, cyclic Galois of degree d over F(X) with group μ_d(F) acting by Y ↦ ξY; its constant field is F; the places over the roots of g and over ∞ are totally ramified, the one over ∞ of degree one; and its genus is (d − 1)(m − 1)/2.

Hypotheses and conventions: d | q − 1; g squarefree; gcd(d, m) = 1.

API: `kummerFunctionField` (data: E_g = AdjoinRoot (Y^d − C g) over RatFunc F); `kummerFunctionField.finrank` (simp: finrank (RatFunc F) E_g = d); `kummerFunctionField.rotate` (constructor: For ξ ∈ μ_d(F) the automorphism Y ↦ ξY); `kummerFunctionField.rotate_mul` (relation: rotate (ξη) = rotate ξ ∘ rotate η; μ_d(F) ≃ Gal(E_g/F(X))); `kummerFunctionField.irreducible` (other: Y^d − C g is irreducible over F(X) when gcd(d, deg g) = 1).

Unit tests: For F = ZMod 5, d = 2, g = X³ + 1: finrank = 2 (`kummerFunctionField_test_finrank`, computation); rotate ξ has order the order of ξ in μ_d (`kummerFunctionField_test_rotate_order`, computation); For d = 2 and g = X² (gcd(d, deg g) = 2): Y² − X² = (Y − X)(Y + X) is reducible (`kummerFunctionField_test_reducible`, non-example).

Uses: FF.2/kummer-zeta-factorization: its degree-one places count the solutions of y^d = g(x); Kowalski section 4.3: the curve of the Stepanov–Bombieri argument.

Construction: Irreducibility: v_∞(g) = −m is prime to d (Kummer's criterion, AlgebraicCurves layer 10, hypothesis (d) of the Kummer covers). Galois group: μ_d ⊆ F because d | q − 1. Genus by the closed Kummer genus formula of AlgebraicCurves layer 10 (Stichtenoth Proposition 3.7.3): ramification index d at the m roots and at ∞ gives 2g − 2 = −2d + (m + 1)(d − 1).

Acceptance: d = 2, g = X³ + 1 over F_5: genus 1. g = X: genus 0 (Y^d = X is rational). d = 2, g = X²: not squarefree and Y² − X² is reducible (non-example).

Rests on: library `AdjoinRoot`, `RatFunc`, `rootsOfUnity`; Tau Ceti roadmap layers Tau Ceti `AlgebraicCurves` layer 10, Tau Ceti `AlgebraicCurves` layer 8, Tau Ceti `AlgebraicCurves` layer 12.

Sources: Kowalski, Chapter 4, section 4.3, (4.20), printed p. 53.

**Lemma `kummer-curve-point-count`** — Degree-one places of E_g over F_{q^ν}: affine solutions of y^d = g(x) plus one. Under the hypotheses of FF.2/kummer-function-field (d | q − 1, g squarefree, gcd(d, deg g) = 1), for every ν ≥ 1 the number of degree-one places of E_g·F_{q^ν} is #{(x, y) ∈ F_{q^ν}² : y^d = g(x)} + 1.

Hypotheses and conventions: d | q − 1; g squarefree; gcd(d, deg g) = 1.

Proof: The affine model y^d = g(x) is regular: at a point with y ≠ 0, ∂/∂Y = d y^{d−1} ≠ 0; at y = 0, g(x) = 0 is a simple root, so ∂/∂X = −g′(x) ≠ 0 (Kowalski Lemma 4.22 and Remark 4.23). Hence its F_{q^ν}-points are the degree-one places over finite points (AlgebraicCurves layer 2). The unique place over ∞ is totally ramified (gcd(d, deg g) = 1), hence of degree one, also after constant field extension (AlgebraicCurves layers 8 and 10).

Acceptance: d = 2, g = X³ + 1 over F_5: 5 affine points and N₁ = 6 = #E(F_5) for this supersingular elliptic curve.

Rests on: nodes `kummer-function-field`; Tau Ceti roadmap layers Tau Ceti `AlgebraicCurves` layer 2, Tau Ceti `AlgebraicCurves` layer 8, Tau Ceti `AlgebraicCurves` layer 10.

Sources: Kowalski, Chapter 4, Remark 4.23, printed p. 56.

**Theorem `kummer-zeta-factorization`** — The numerator of the zeta function of y^d = g(x) is Π_{χ≠1, χ^d=1} Z(g, χ; T). Under the hypotheses of FF.2/kummer-function-field: L_{E_g}(T) = Π_{χ ≠ 1, χ^d = 1} Z(g, χ; T); each factor has degree exactly m − 1.

Hypotheses and conventions: d | q − 1, g squarefree, gcd(d, deg g) = 1.

Proof: Degree-one places over F_{q^ν}: FF.2/kummer-curve-point-count. #affine − q^ν = Σ_{χ≠1} S̃_ν(g, χ) (FF.2/kummer-point-count-average); zeta function from FunctionFieldArithmetic:FA.5. Degrees: 2g = (d − 1)(m − 1) and each factor has degree ≤ m − 1 (FF.2/multiplicative-l-function-is-polynomial; g is not c·h^{ord χ} since g is squarefree).

Acceptance: d = 2, g = X³ + aX + b: L_E(T) = Z(g, χ₂; T) = 1 − a_q T + qT², a_q = q − #E_aff(F_q).

Rests on: nodes `kummer-function-field`, `kummer-curve-point-count`, `kummer-point-count-average`, `multiplicative-l-function`, `multiplicative-l-function-is-polynomial`; stages `FunctionFieldArithmetic:FA.5`; Tau Ceti roadmap layers Tau Ceti `AlgebraicCurves` layer 2, Tau Ceti `AlgebraicCurves` layer 8, Tau Ceti `AlgebraicCurves` layer 10.

Sources: Kowalski, Chapter 4, Lemma 4.16, printed p. 51.

**Theorem `multiplicative-l-function-purity`** — Weil: for g squarefree with gcd(deg g, ord χ) = 1, Z(g, χ; T) has degree m − 1 and reciprocal roots of weight 1. Let χ have order e ≥ 2 and g ∈ F[X] squarefree of degree m with gcd(m, e) = 1. Then Z(g, χ; T) = Π_{j=1}^{m−1}(1 − Ω_jT) with every Ω_j an algebraic integer all of whose complex conjugates have absolute value √q.

Hypotheses and conventions: g squarefree, gcd(deg g, e) = 1 (the hypotheses of FF.2/kummer-function-field with d = e).

Proof: FF.2/kummer-zeta-factorization with d = e puts every Ω_j among the reciprocal roots of L_{E_g} ∈ ℤ[T] and gives the degree. Riemann hypothesis for the curve of E_g (WeilConjectures:WC.3, all conjugates; DeligneWeightsAndPurity:DWP.0). Alternative elementary proof of |Ω_j| = √q in this case: the product of the Ω_j has absolute value q^{(m−1)/2} (FF.2/multiplicative-l-function-leading-coefficient) and each is at most √q (FF.2/multiplicative-l-function-root-bound-coprime) — Kowalski's argument after Proposition 4.14.

Acceptance: χ quadratic, g = X³ + aX + b: Ω₁Ω₂ = ±q and |Ω_i| = √q, the Hasse–Weil statement for elliptic curves (compare Tau Ceti EllipticCurves layer 3).

Rests on: nodes `kummer-zeta-factorization`; stages `WeilConjectures:WC.3`, `DeligneWeightsAndPurity:DWP.0`.

Sources: Kowalski, Chapter 4, Proposition 4.14(1) and the argument after it, printed p. 50.

### 8. Character sheaves, trace functions and Deligne's bound

The ℓ-adic framework ([Sommes trig.] §§1–3, FKMS §§3–4, Weil II §3). `L_ψ` is an interface id and a planet. Cancellation for a nontrivial character of a connected group, and its form with a `G_a`-action (Browning–Sawin's vanishing by translation), come from homotopy invariance of the action of translations on `H*_c`. Deligne's bound for trace functions keeps the `H²_c` main term. The conductor bound for `dim H¹_c` rests on the Grothendieck–Ogg–Shafarevich formula, which no atlas stage owns (gap); only the nodes that need it wait on it.

**Construction `artin-schreier-sheaf`** (planet: *Artin–Schreier sheaf*) — The Artin–Schreier sheaf L_ψ(f). Fix a prime ℓ ≠ p and a finite extension E of ℚ_ℓ containing the p-th roots of unity; let ψ : F → E^× be a nontrivial additive character. For a separated F-scheme X₀ of finite type and f ∈ Γ(X₀, O) (a morphism X₀ → G_a), L_ψ(f) := ψ^{−1}(f^*𝓛) is the rank-one lisse E-sheaf obtained by pushing the pull-back of the Lang torsor 0 → F → G_a → G_a → 0 (x ↦ x^q − x) along ψ^{−1} (Sommes trig. 1.2, 1.4, Définition 1.7 with G₀ = G_a). Its Frobenius trace at x ∈ X₀(F_{q^ν}) is ψ(Tr_{F_{q^ν}/F}(f(x))) (geometric Frobenius; (1.7.6)-(1.7.7)). On an open U ⊆ A¹_F with function field K = F(X) it is the character of Gal(K^sep/K), σ ↦ ψ^{−1}(σ(t) − t) for any root t of T^q − T − f, unramified on U (FKMS Definition 3.1). It is pure of weight 0, lisse on the open where f is regular, and satisfies L_ψ(f + g) ≅ L_ψ(f) ⊗ L_ψ(g), L_ψ(−f) ≅ L_ψ(f)^∨, L_ψ(h^q − h) ≅ E, L_{ψ(a·)}(f) ≅ L_ψ(af), and u^*L_ψ(f) ≅ L_ψ(f ∘ u).

Hypotheses and conventions: ℓ ≠ p; E ⊇ μ_p (a nontrivial rank-one ψ has no values in ℚ_ℓ when p is odd: BS's unit test). Scope pinned: FF.2 constructs the Lang-torsor sheaves for G_a and G_m (and their tensor products); these are the groups every FF.2 target uses. The Lang torsor is explicit for them, so no general Lang theorem is needed. Pinned conventions: geometric Frobenius; the inverse ψ^{−1} in the definition makes the trace ψ(f(x)) and not its inverse (Sommes trig. 1.7).

API: `artinSchreierSheaf` (data: On K = a field containing F, the rank-one Galois character σ ↦ ψ⁻¹(σ(t) − t) of the absolute Galois group, t a root of T^q − T − f (the sheaf L_ψ(f) on the open where f is regular, in the Galois-representation language of FKMS Definition 3.1)); `artinSchreierSheaf_add` (relation: L_ψ(f + g) = L_ψ(f) ⊗ L_ψ(g) (product of characters)); `artinSchreierSheaf_neg` (relation: L_ψ(−f) = L_ψ(f)^∨ (inverse character)); `artinSchreierSheaf_sub_self` (simp: L_ψ(h^q − h) is trivial); `artinSchreierSheaf_mulShift` (relation: L_{ψ.mulShift a}(f) = L_ψ(a f)); `artinSchreierSheaf_map` (functoriality: For a field embedding K → K′ over F, the restriction of L_ψ(f) along Gal(K′^sep/K′) → Gal(K^sep/K) is L_ψ of the image of f (pull-back)); `artinSchreierCharacter` (data: The Artin–Schreier character σ ↦ σ(t) − t ∈ F of the absolute Galois group of K (t^q − t = f), with values in F written multiplicatively; artinSchreierSheaf ψ f is ψ⁻¹ composed with it); `absoluteGaloisGroupRestrict` (data: For an F-embedding φ : K → K′ of fields, the restriction Gal(K′^al/K′) → Gal(K^al/K) (through an extension of φ to algebraic closures); the pull-back of sheaves along the generic points).

Unit tests: For ψ = 1: artinSchreierSheaf 1 f = 1 (the constant sheaf) (`artinSchreierSheaf_test_trivialChar`, degenerate); For f = h^q − h: artinSchreierSheaf ψ f = 1 (`artinSchreierSheaf_test_artinSchreier`, degenerate); Over K = RatFunc F with ψ ≠ 1: artinSchreierSheaf ψ X ≠ 1 (`artinSchreierSheaf_test_X_nontrivial`, non-example); Every additive character of ZMod 3 with values in ℚ is trivial: a nontrivial L_ψ needs coefficients containing μ_p (`artinSchreierSheaf_test_no_rational_character`, non-example).

Uses: Browning–Sawin, section 2 and Lemmas 3.2, 3.7, 5.3: the kernel of the complex S_{d,f} and of every geometric exponential sum in the geometric circle method; Sommes trig. Exemple 3.5, Weil I 8.4: the sheaf L(ψf) whose H¹ computes one-variable and n-variable additive sums; FF.2/rank-one-sheaf-l-function, FF.2/kloosterman-bound: the sheaves L_ψ(f) and L_ψ(aX + b/X); PAPER-FRESAN-SABBAH-YU-22 item 33, KloostermanMomentsAndPotentialAutomorphy: AS_ψ is the input of the Kloosterman sheaf Kl₂ = Rπ_! f^*AS_ψ[1]; FF.2 is the single owner (RT-AREA-etale/14).

Construction: The Lang torsor of G_a: x ↦ x^q − x is finite étale with kernel F (Sommes trig. (1.4.2)); its fibre at a rational point y carries the Frobenius g ↦ g − y ((1.5.1), additively). Pushing an F-torsor along a character gives a rank-one lisse E-sheaf (Sommes trig. 1.2); the lisse sheaves on a connected X₀ are the continuous representations of π₁(X₀) (requested from SchemeAndStackFoundations:SF.2, the integration owner of the constructible étale and fundamental-group suppliers). Bimultiplicativity and pull-back compatibility from (1.3.1) (sum of torsors) and (1.7.1)-(1.7.4); triviality on h^q − h because f factors through the Lang isogeny. Trace: (1.7.6) at rational points and the norm/trace compatibility (1.6.2), (1.7.7) over F_{q^ν}.

Acceptance: ψ = 1 gives the constant sheaf E (not an acyclic sheaf). f = h^q − h gives a trivial sheaf; f = X on A¹ gives a geometrically nontrivial sheaf with H*_c(A¹, L_ψ) = 0 (FF.2/character-sheaf-cohomology-vanishes). Trace function at x ∈ F of L_ψ(f): ψ(f(x)) (FF.2/trace-function).

Rests on: library `Field.absoluteGaloisGroup`, `AddChar`; stages `SchemeAndStackFoundations:SF.2`.

Sources: Browning–Sawin, section 2, p. 900 (arXiv v3 p. 8); Deligne, SGA 4½, [Sommes trig.] Définition 1.7 and (1.7.6), volume pp. 172-173; Fouvry–Kowalski–Michel–Sawin, section 4.2.3, p. 12.

**Construction `kummer-sheaf`** — The Kummer sheaf L_χ(g). With ℓ, E as in FF.2/artin-schreier-sheaf (E ⊇ μ_{q−1}) and χ : F^× → E^× a multiplicative character, for g ∈ Γ(X₀, O)^× (a morphism X₀ → G_m) L_χ(g) := χ^{−1}(g^*𝓛) with 𝓛 the Lang torsor 1 → F^× → G_m → G_m → 1 (x ↦ x^{q−1}). Its trace at x ∈ X₀(F_{q^ν}) is χ(N_{F_{q^ν}/F}(g(x))). On U ⊆ A¹ it is the character σ ↦ χ^{−1}(σ(t)/t) of Gal(K^sep/K), t^{q−1} = g. It is pure of weight 0, tamely ramified at the zeros and poles of g, and L_χ(g₁g₂) ≅ L_χ(g₁) ⊗ L_χ(g₂), L_{χχ′}(g) ≅ L_χ(g) ⊗ L_{χ′}(g), L_χ(h^{e}) ≅ E for e the order of χ.

Hypotheses and conventions: χ a character of F^× (a Mathlib MulChar restricted to units); ℓ ≠ p; E ⊇ values of χ.

API: `kummerSheaf` (data: The Galois character σ ↦ χ⁻¹(σ(t)/t), t^{q−1} = g, for g a unit of K); `kummerSheaf_mul` (relation: L_χ(g₁g₂) = L_χ(g₁) ⊗ L_χ(g₂)); `kummerSheaf_mul_char` (relation: L_{χχ′}(g) = L_χ(g) ⊗ L_{χ′}(g)); `kummerSheaf_pow_orderOf` (simp: L_χ(h^{orderOf χ}) is trivial); `kummerSheaf_map` (functoriality: Compatibility with field embeddings K → K′ over F (pull-back)).

Unit tests: For χ = 1: kummerSheaf 1 g = 1 (`kummerSheaf_test_trivialChar`, degenerate); kummerSheaf χ (h ^ orderOf χ) = 1 (`kummerSheaf_test_power`, degenerate); Over K = RatFunc F with χ ≠ 1: kummerSheaf χ X ≠ 1 (`kummerSheaf_test_X_nontrivial`, non-example).

Uses: FF.2/weil-bound-multiplicative, FF.2/weil-bound-mixed: the sheaves L_χ(g) and L_ψ(f) ⊗ L_χ(g); FF.2/gauss-sum-frobenius-eigenvalue: L_ψ ⊗ L_χ on G_m realises Gauss sums; Sommes trig. 1.15, section 4: Hasse–Davenport and Jacobi sums through (1.7.7).

Construction: Lang torsor of G_m: (1.4.3), Frobenius on fibres (1.5.1). Push-out along χ^{−1} (Sommes trig. 1.2) and the dictionary with π₁-representations (SchemeAndStackFoundations:SF.2). (1.7.1)-(1.7.7) as for L_ψ.

Acceptance: χ = 1: the constant sheaf. g = h^e (e = ord χ): trivial. g = X on G_m with χ ≠ 1: nontrivial, tame at 0 and ∞, H*_c(G_m, L_χ) = 0.

Rests on: library `Field.absoluteGaloisGroup`, `MulChar`; stages `SchemeAndStackFoundations:SF.2`.

Sources: Fouvry–Kowalski–Michel–Sawin, section 4.2.2, p. 11; Deligne, SGA 4½, [Sommes trig.] Exemples (1.4.3), volume p. 172.

**Theorem `character-sheaf-trace-formula`** — Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9). Let S₀ be a separated F-scheme of finite type, f¹, …, f^r ∈ Γ(S₀, O) and g¹, …, g^s ∈ Γ(S₀, O)^×, ψ_i additive and χ_j multiplicative characters, and 𝓕 := ⊗_i L_{ψ_i}(f^i) ⊗ ⊗_j L_{χ_j}(g^j). For every ν ≥ 1: Σ_{s∈S₀(F_{q^ν})} Π_i ψ_i(Tr_{F_{q^ν}/F} f^i(s)) Π_j χ_j(N_{F_{q^ν}/F} g^j(s)) = Σ_k (−1)^k Tr(F^{*ν} | H^k_c(S_F̄, 𝓕)), and the H^k_c are finite-dimensional, zero for k ∉ [0, 2 dim S₀].

Hypotheses and conventions: S₀ separated of finite type; the Grothendieck–Lefschetz trace formula for E-sheaves is imported (Sommes trig. 1.1, (1.1.1)).

Proof: The trace of F^ν at s on 𝓕 is the product of the character values ((1.7.5)-(1.7.7), FF.2/artin-schreier-sheaf, FF.2/kummer-sheaf). Apply the Grothendieck–Lefschetz trace formula over F_{q^ν} (requested from SchemeAndStackFoundations:SF.2, the integration owner of the TraceFormula supplier), with finiteness and the vanishing range.

Acceptance: S₀ = Spec F, trivial characters: 1 = Tr(F* | H⁰). S₀ = A¹, f = X: 0 = Σ(−1)^k Tr(F* | H^k_c(A¹, L_ψ)) with all H^k_c = 0.

Rests on: nodes `artin-schreier-sheaf`, `kummer-sheaf`; stages `SchemeAndStackFoundations:SF.2`.

Sources: Deligne, SGA 4½, [Sommes trig.] Scholie 1.9, volume p. 174.

**Lemma `homotopy-invariance-of-endomorphism-action`** — A connected family of endomorphisms acts by one endomorphism on H*_c (Sommes trig. Lemme 2.8). Let k be algebraically closed, X a separated k-scheme of finite type, Y a connected k-scheme, 𝓕 a sheaf on X, and (p, c) a family of endomorphisms of (X, 𝓕) parametrised by Y: p : Y × X → Y × X a proper Y-morphism and c : p^*pr₂^*𝓕 → pr₂^*𝓕. Then the endomorphism ρ_H(y) of H*_c(X, 𝓕) induced by (p_y, c_y) is independent of y ∈ Y(k).

Hypotheses and conventions: p proper over Y; Y connected.

Proof: (p, c) induces an endomorphism of R pr_{1!} pr₂^*𝓕, which is the constant sheaf on Y with value H*_c(X, 𝓕) (proper base change); an endomorphism of a constant sheaf on a connected Y is constant (proper base change and constancy requested from SchemeAndStackFoundations:SF.2).

Acceptance: Y = a point: nothing to prove. Translations t_x on a connected group G: all act on H*_c(G, E) as the identity.

Rests on: stages `SchemeAndStackFoundations:SF.2`.

Sources: Deligne, SGA 4½, [Sommes trig.] Lemme 2.8, volume pp. 187-188.

**Theorem `character-sheaf-cohomology-vanishes`** — H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*). Let G₀ ∈ {G_a, G_m} over F (or a product of copies of them) and χ a nontrivial character of G₀(F). Then H^i_c(G_F̄, L(χ)) = 0 for all i. In particular H*_c(A¹_F̄, L_ψ) = 0 for ψ ≠ 1 and H*_c(G_{m,F̄}, L_χ) = 0 for χ ≠ 1.

Hypotheses and conventions: χ nontrivial. (Sommes trig. states it for any connected commutative G₀; FF.2 needs G_a, G_m and products.).

Proof: For a rational point x ∈ G₀(F), translation t_x lifts to an automorphism ρ(x) of (G, L(χ)) (the Lang torsor is compatible with translations); for x in the kernel G₀(F) of the Lang isogeny it is multiplication by χ(x)^{−1}. By FF.2/homotopy-invariance-of-endomorphism-action (the family of translations parametrised by the connected G), ρ_H(x) = ρ_H(e) = id on H*_c. Choosing x ∈ G₀(F) with χ(x) ≠ 1, (χ(x)^{−1} − 1) kills H*_c, so H*_c = 0 — the cohomological analogue of Σ_a χ(a) = 0.

Acceptance: χ = 1: H²_c(A¹, E) = E(−1) ≠ 0; the hypothesis is needed. The trace formula then gives Σ_{x∈F_{q^ν}} ψ(Tr x) = 0 for all ν.

Rests on: nodes `artin-schreier-sheaf`, `kummer-sheaf`, `homotopy-invariance-of-endomorphism-action`.

Sources: Deligne, SGA 4½, [Sommes trig.] Théorème 2.7*, volume p. 187; Browning–Sawin, proof of Lemma 3.2, p. 910 (arXiv v3 p. 17).

**Theorem `translation-cancellation`** — Cancellation along a free G_a-orbit direction (Browning–Sawin Lemma 3.2). Let Y be a variety over a separably closed field k of characteristic p, φ : Y → A¹, u ∈ O(Y)^×, and a : Y × G_a → Y an action of G_a with φ(a(y, λ)) = φ(y) + u(y)λ. Then H^i_c(Y, φ^*L_ψ) = 0 for all i (ψ ≠ 1).

Hypotheses and conventions: a a genuine G_a-action; u a unit; ψ nontrivial.

Proof: u is invariant along orbits: comparing φ(a(y, λ₁ + λ₂)) computed two ways gives u(a(y, λ₁)) = u(y). a′(y, λ) := (a(y, λ/u(y)), λ) is an automorphism of Y × A¹ (inverse (y, λ) ↦ (a(y, −λ/u(y)), λ)) with a′^*(φ^*L_ψ ⊠ E) ≅ φ^*L_ψ ⊠ L_ψ (additivity of L_ψ, FF.2/artin-schreier-sheaf). Künneth with H*_c(A¹, E) = E(−1)[−2]: H^i_c(Y, φ^*L_ψ) ≅ H^{i+2}_c(Y × A¹, φ^*L_ψ ⊠ E)(1) (the printed index i − 2 is a misprint, PAPER-BROWNING-SAWIN-20/E11 = FiniteFieldsAndCharacterSums/E309), and the right side is H*_c(Y, φ^*L_ψ) ⊗ H*_c(A¹, L_ψ) = 0 by FF.2/character-sheaf-cohomology-vanishes (Künneth and the cohomology of A¹ requested from SchemeAndStackFoundations:SF.2).

Acceptance: Y = A¹, φ = id, a = translation, u = 1: recovers H*_c(A¹, L_ψ) = 0. u = 0 (not a unit): φ constant along orbits and no cancellation.

Rests on: nodes `artin-schreier-sheaf`, `character-sheaf-cohomology-vanishes`; stages `SchemeAndStackFoundations:SF.2`.

Sources: Browning–Sawin, Lemma 3.2, p. 910 (arXiv v3 p. 16).

**Definition `trace-function`** — Trace functions of lisse ℓ-adic sheaves on open subsets of the line. Let U ⊆ A¹_F be a dense open subset defined over F, K = F(X), and 𝓕 a lisse E-sheaf on U, i.e. a continuous representation ρ : Gal(K^sep/K) → GL(V) on a finite-dimensional E-space, unramified at every closed point of U (FKMS Definition 3.1). The trace function of 𝓕 is t_𝓕(x) := Tr(ρ(Frob_x) | V) for x ∈ U(F), Frob_x a geometric Frobenius element at the place X − x; over F_{q^ν}, t_{𝓕,ν}(x) = Tr(ρ(Frob_π)^{ν/deg π}) for x ∈ U(F_{q^ν}) with minimal polynomial π (FKMS (3.3)). Extended by zero off U(F) (FKMS Remark 3.7; the middle extension differs by at most rk(𝓕)·#(A¹ ∖ U)(F), Remark 3.12). It is additive in direct sums, multiplicative in tensor products, the dual gives x ↦ t(x)^{−1}-type inverse eigenvalues, and pull-back composes with the map.

Hypotheses and conventions: U dense open in A¹ over F; ρ continuous and unramified on U; ι : E → ℂ a fixed embedding when complex values are needed.

API: `traceFunctionRankOne` (data: For a rank-one Galois character ρ of RatFunc F and x ∈ F: ρ evaluated at a geometric Frobenius at X − x (well defined where ρ is unramified)); `traceFunctionRankOne_mul` (relation: t_{ρ₁ρ₂} = t_{ρ₁}·t_{ρ₂} (tensor product)); `traceFunctionRankOne_one` (simp: The trivial character has trace function 1); `traceFunctionRankOne_inv` (relation: t_{ρ⁻¹}(x) = t_ρ(x)⁻¹ (dual)); `traceFunctionRankOne_artinSchreierSheaf` (compatibility: For f ∈ F[X]: t_{L_ψ(f)}(x) = ψ(f(x))); `traceFunctionRankOne_kummerSheaf` (compatibility: For g ∈ F[X] with g(x) ≠ 0: t_{L_χ(g)}(x) = χ(g(x))).

Unit tests: t_1(x) = 1 for all x (`traceFunctionRankOne_test_one`, degenerate); For f = X: t_{L_ψ(X)}(x) = ψ(x) (`traceFunctionRankOne_test_artinSchreier_X`, computation); For f = X^q − X the trace function is identically 1, although f is non-constant (`traceFunctionRankOne_test_artinSchreier_trivial`, non-example).

Uses: FKMS sections 3-4 and FF.2/deligne-bound-for-trace-functions: the functions whose sums are estimated; Browning–Sawin, Lemma 2.1: taking trace functions of both sides recovers the circle-method identity (2.2); ExponentialSumsAndCircleMethod:ES.0: trace functions are the inputs of completion and van der Corput steps.

Construction: Unramified at x: the inertia group at a place above X − x acts trivially, so the Frobenius coset acts by a well-defined conjugacy class (FKMS Definition 3.4, Remark 3.3). Trace is a class function; tensor products and duals of representations give products and inverse-transpose traces.

Acceptance: Constant sheaf: t ≡ 1. Artin–Schreier sheaf L_ψ(f), f ∈ F[X]: t(x) = ψ(f(x)). Kummer sheaf L_χ(g): t(x) = χ(g(x)) where g(x) ≠ 0.

Rests on: nodes `artin-schreier-sheaf`, `kummer-sheaf`; library `Field.absoluteGaloisGroup`, `IsArithFrobAt`, `RatFunc`.

Sources: Fouvry–Kowalski–Michel–Sawin, Definition 3.5, p. 6; Fouvry–Kowalski–Michel–Sawin, Remark 3.8, (3.3), p. 7.

**Lemma `lisse-sheaf-extremal-cohomology-on-curve`** — H⁰_c and H²_c of a lisse sheaf on an affine curve. Let U₀ be a smooth geometrically connected curve over F which is not proper (e.g. a dense open of A¹), and 𝓕 a lisse E-sheaf on U₀ with geometric monodromy G_geom = π₁(U_F̄). Then H⁰_c(U_F̄, 𝓕) = 0, H^i_c(U_F̄, 𝓕) = 0 for i > 2, and H²_c(U_F̄, 𝓕) ≅ (V_𝓕)_{G_geom}(−1), Frobenius-equivariantly (coinvariants, Tate twist). Hence H²_c = 0 when 𝓕 has no nonzero geometrically trivial quotient (e.g. 𝓕 geometrically irreducible and nontrivial); for 𝓕 of rank one, H²_c ≠ 0 exactly when 𝓕 is geometrically trivial, and then Frobenius acts on H²_c by q times a scalar of absolute value 1 (for 𝓕 pure of weight 0).

Hypotheses and conventions: U₀ smooth, geometrically connected, not proper; 𝓕 lisse.

Proof: H⁰_c(U, 𝓕) consists of global sections with proper support, zero on a non-proper connected curve (Sommes trig. 1.18 b)). Vanishing above 2 dim U (Sommes trig. 1.18 a); requested from SchemeAndStackFoundations:SF.2). H²_c via Poincaré duality with H⁰(U, 𝓕^∨(1)) = ((V^∨)^{G_geom})(1) (Sommes trig. 1.18 d), requested from EtaleDualityAndPerverseSheaves:EDC.2).

Acceptance: Constant sheaf on A¹: H²_c = E(−1), Frobenius acts by q. L_ψ(X) on A¹: all H^i_c = 0.

Rests on: stages `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: Fouvry–Kowalski–Michel–Sawin, section 4.1, (4.2), p. 11; Deligne, SGA 4½, [Sommes trig.] Remarques 1.18 b), volume p. 178.

**Definition `modified-pole-order`** — The modified pole order v*_x(f) of a rational function (Sommes trig. Exemple 3.5). Let X₀ be a smooth projective absolutely irreducible curve over F, f a rational function on X₀ and x a closed point. v_x(f) := order of the pole of f at x (0 if f is regular at x) and v*_x(f) := min_g v_x(f + g^p − g), the minimum over rational functions g. If p ∤ v_x(f) > 0 then v*_x(f) = v_x(f); v*_x(f + g^p − g) = v*_x(f); v*_x(f) = 0 iff f + g^p − g is regular at x for some g; f is of the form g^p − g + c exactly when v*_x(f) = 0 for all x. On X₀ = P¹ with f a polynomial, v*_∞(f) is the degree of the Artin–Schreier reduced form when that is non-constant.

Hypotheses and conventions: X₀ smooth projective absolutely irreducible; the minimum exists since v_x ≥ 0 values are natural numbers.

API: `modifiedPoleOrderInfty` (data: For f ∈ RatFunc F: v*_∞(f) = min over g of the pole order at ∞ of f + g^p − g); `modifiedPoleOrderInfty_add_artinSchreier` (simp: v*_∞(f + g^p − g) = v*_∞(f)); `modifiedPoleOrderInfty_le` (other: v*_∞(f) ≤ v_∞(f)); `modifiedPoleOrderInfty_eq_of_not_dvd` (characterisation: If the pole order m of f at ∞ is positive and p ∤ m then v*_∞(f) = m); `modifiedPoleOrderInfty_polynomial` (compatibility: For a polynomial f with non-constant reduced form: v*_∞(f) = deg f*).

Unit tests: v*_∞(X^p) = 1 (`modifiedPoleOrderInfty_test_X_pow_p`, computation); v*_∞(X^p − X) = 0 (`modifiedPoleOrderInfty_test_artinSchreier`, degenerate); v*_∞(X^p) = 1 ≠ p = v_∞(X^p) (`modifiedPoleOrderInfty_test_not_poleOrder`, non-example).

Uses: Sommes trig. (3.5.2)-(3.5.4): the constant of the curve bound and the Swan conductors; FF.2/swan-conductor-of-artin-schreier-sheaf: Sw_x(L(ψf)) = v*_x(f); FF.2/artin-schreier-sum-on-curve-bound: the points with v* = 0 index the normalised sum.

Construction: Invariance: the set {f + g^p − g} is unchanged. p ∤ v_x(f): v_x(g^p − g) is either ≤ 0 or divisible by p, so it cannot cancel the pole of order v_x(f). For polynomials on P¹: FF.2/artin-schreier-reduced-form lowers the pole order at ∞ to deg f*, and no further reduction is possible.

Acceptance: v*_∞(X^p) = 1 on P¹. v*_∞(X^p − X) = 0. v*_0(X^{−1}) = 1.

Rests on: nodes `artin-schreier-reduced-form`; library `RatFunc`.

Sources: Deligne, SGA 4½, [Sommes trig.] Exemple 3.5 a), b), volume p. 190.

**Lemma `swan-conductor-of-artin-schreier-sheaf`** — Sw_x(L(ψf)) = v*_x(f) (Sommes trig. (3.5.4)). Let X₀, f be as in FF.2/modified-pole-order and ψ ≠ 1. At a closed point x with v*_x(f) = 0, L(ψf) extends to a lisse sheaf near x (after replacing f by f + g^p − g). At x with v*_x(f) > 0 it is wildly ramified with Swan conductor Sw_x(L(ψf)) = v*_x(f), and (j_*L(ψf))_x = 0.

Hypotheses and conventions: ψ nontrivial; Swan conductor in the sense of ArithmeticGaloisRepresentations:R01.3 for the local field at x (equal characteristic, residue field extended to F̄).

Proof: Reduce to v_x(f) = v*_x(f) =: m with p ∤ m (FF.2/modified-pole-order). The character of L(ψf) at x factors through the Artin–Schreier extension T^p − T = f of the completed local field; its unique upper ramification break is m (AlgebraicCurves layer 10: different exponent (p − 1)(m + 1); a cyclic group of order p has equal lower and upper breaks; the ramification filtration from Tau Ceti LocalFieldsRamification layer 3), so the Swan conductor of the nontrivial rank-one character is m (Weil I Lemma 8.13, citing Serre). At a ramified point of a rank-one sheaf the inertia invariants vanish, so (j_*L)_x = 0.

Acceptance: f = X on P¹: Sw_∞ = 1, the conductor of L_ψ is 3 (FKMS 4.2.3). f = X^p: Sw_∞ = v*_∞ = 1, not p (E307). f = x + a/x: Sw_0 = Sw_∞ = 1 (Kloosterman).

Rests on: nodes `artin-schreier-sheaf`, `modified-pole-order`; stages `ArithmeticGaloisRepresentations:R01.3`; Tau Ceti roadmap layers Tau Ceti `AlgebraicCurves` layer 10, Tau Ceti `LocalFieldsRamification` layer 3.

Sources: Deligne, SGA 4½, [Sommes trig.] (3.5.4), volume p. 191; Deligne, Weil I, Lemme 8.13, p. 306.

**Lemma `h1c-conductor-bound`** — dim H¹_c(U, 𝓕) ≤ C(𝓕)², with the conductor C(𝓕) = rk 𝓕 + #S + Σ Sw_x(𝓕). Let U ⊊ P¹_F be a dense open, S := P¹(F̄) ∖ U(F̄), and 𝓕 lisse on U with Swan conductors Sw_x(𝓕) at x ∈ S. Put C(𝓕) := rk 𝓕 + #S + Σ_{x∈S} Sw_x(𝓕) (FKMS Definition 4.3). Then dim H¹_c(U_F̄, 𝓕) = dim H²_c − χ_c = dim H²_c − rk 𝓕·(2 − #S) + Σ_x Sw_x(𝓕) ≤ rk 𝓕·(#S − 1) + Σ_x Sw_x(𝓕) ≤ C(𝓕)².

Hypotheses and conventions: U not all of P¹ (so H⁰_c = 0); 𝓕 lisse on U.

Proof: H⁰_c = 0 and dim H²_c ≤ rk 𝓕 (FF.2/lisse-sheaf-extremal-cohomology-on-curve). Grothendieck–Ogg–Shafarevich formula χ_c(U, 𝓕) = rk 𝓕 · χ_c(U) − Σ_x Sw_x(𝓕) with χ_c(U) = 2 − #S (requested from EtaleDualityAndPerverseSheaves:EDC.2; no atlas stage owns it — gap). Arithmetic.

Acceptance: L_ψ on A¹: C = 3, h¹_c = 0 ≤ 9. L_ψ(aX + b/X) on G_m: C = 1 + 2 + 2 = 5, h¹_c = 2. Constant sheaf on A¹: h¹_c = 0 and h²_c = 1.

Rests on: nodes `lisse-sheaf-extremal-cohomology-on-curve`; stages `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: Fouvry–Kowalski–Michel–Sawin, Theorem 4.2 and Definition 4.3, p. 11; Fouvry–Kowalski–Michel–Sawin, Definition 4.3, (4.3), p. 11.

**Theorem `deligne-bound-for-trace-functions`** (planet: *Deligne's bound for trace functions*) — Deligne's bound for sums of trace functions, with the H²_c main term subtracted. Let U ⊊ A¹_F be a dense open, 𝓕 a lisse E-sheaf on U, ι-mixed of weights ≤ 0 (e.g. punctually pure of weight 0), and ι : E → ℂ. For every ν ≥ 1: |Σ_{x∈U(F_{q^ν})} ι t_{𝓕,ν}(x) − ι Tr(Frob^ν | H²_c(U_F̄, 𝓕))| ≤ dim H¹_c(U_F̄, 𝓕) · q^{ν/2} ≤ C(𝓕)² q^{ν/2}. The main term Tr(Frob^ν | (V_𝓕)_{G_geom}(−1)) has absolute value ≤ rk 𝓕 · q^ν and vanishes when 𝓕 has no nonzero geometrically trivial quotient; it is not zero in general (the constant sheaf gives q^ν).

Hypotheses and conventions: U ≠ P¹; 𝓕 lisse on U, ι-mixed of weights ≤ 0. H²_c is not assumed to vanish: the main term is subtracted, not discarded.

Proof: Trace formula (requested from SchemeAndStackFoundations:SF.2): Σ t_{𝓕,ν} = Σ_i (−1)^i Tr(Frob^ν | H^i_c), with H⁰_c = 0 and H^i_c = 0 for i > 2 (FF.2/lisse-sheaf-extremal-cohomology-on-curve). Weights: every eigenvalue of Frobenius on H¹_c has ι-absolute value ≤ q^{1/2} (Weil II Corollaire 3.3.4, requested from DeligneWeightsAndPurity:DWP.7). Hence |Σ t − Tr(H²_c)| = |Tr(H¹_c)| ≤ h¹_c q^{ν/2}, and h¹_c ≤ C(𝓕)² (FF.2/h1c-conductor-bound). The main term: H²_c = coinvariants(−1), eigenvalues of absolute value ≤ q^ν on the weight ≤ 0 coinvariants twisted by (−1).

Acceptance: 𝓕 = E constant on U = A¹: Σ 1 = q^ν = Tr(H²_c) and H¹_c = 0 — the main term is everything. 𝓕 = L_ψ(f), f ∈ F[X], p ∤ deg f: H²_c = 0, h¹_c = deg f − 1, giving FF.2/weil-bound-additive. 𝓕 geometrically irreducible nontrivial: |Σ t| ≤ C(𝓕)² q^{ν/2} (FKMS Corollary 4.7).

Rests on: nodes `trace-function`, `lisse-sheaf-extremal-cohomology-on-curve`, `h1c-conductor-bound`; stages `SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.7`.

Sources: Fouvry–Kowalski–Michel–Sawin, Theorem 4.6 and Corollary 4.7, p. 13; Deligne, Weil II, Corollaire 3.3.4, p. 206.

**Theorem `deligne-estimate-for-character-sums`** — Deligne's estimate for character sums on a variety by the Betti numbers of the character sheaf (1.17.1). In the setting of FF.2/character-sheaf-trace-formula (S₀ separated of finite type, 𝓕 = ⊗ L_{ψ_i}(f^i) ⊗ ⊗ L_{χ_j}(g^j)): for every ν ≥ 1, |Σ_{s∈S₀(F_{q^ν})} Π_i ψ_i(Tr f^i(s)) Π_j χ_j(N g^j(s))| ≤ Σ_k dim H^k_c(S_F̄, 𝓕) · q^{νk/2}.

Hypotheses and conventions: The character sheaves are pure of weight 0 (Frobenius traces are roots of unity).

Proof: FF.2/character-sheaf-trace-formula. Every eigenvalue of Frobenius on H^k_c has all complex conjugates of absolute value q^{m/2} with m ≤ k (Weil II Corollaire 3.3.4 / Sommes trig. Théorème 1.17; requested from DeligneWeightsAndPurity:DWP.7).

Acceptance: S₀ = A¹, 𝓕 = L_ψ(f), p ∤ deg f: only H¹_c, of dimension deg f − 1. Sommes trig. 1.18 e): the bound can be worse than the trivial bound when b_{2n} = 0 is not known.

Rests on: nodes `character-sheaf-trace-formula`; stages `DeligneWeightsAndPurity:DWP.7`.

Sources: Deligne, SGA 4½, [Sommes trig.] Théorème 1.17 and (1.17.1), volume p. 178.

**Theorem `affine-concentration-criterion`** — If H_c → H is an isomorphism on a smooth affine variety, cohomology is concentrated in the middle degree and pure (Sommes trig. 1.19-1.21). (a) Let X̄ be proper over an algebraically closed field, j : X → X̄ open, 𝓕 on X with (j_*𝓕)_x = 0 for x ∈ X̄ ∖ X and R^i j_*𝓕 = 0 for i > 0; then H^i_c(X, 𝓕) → H^i(X, 𝓕) is an isomorphism for all i. (b) Let X₀ be smooth affine of pure dimension n over F and 𝓕₀ lisse punctually pure of weight m with H^i_c(X, 𝓕) → H^i(X, 𝓕) an isomorphism for all i; then H^i_c(X, 𝓕) = 0 for i ≠ n and H^n_c(X, 𝓕) is pure of weight m + n. (c) If X₀ is smooth separated and H^i_c(X, 𝓕) → H^i(X, 𝓕) is injective, then H^i_c(X, 𝓕) is pure of weight m + i.

Hypotheses and conventions: As stated in each part; X₀ affine in (b) (Artin vanishing).

Proof: (a): the hypotheses mean j_!𝓕 ≅ Rj_*𝓕 (Proposition 1.19). (b): Poincaré duality pairs H^i_c(𝓕) with H^{2n−i}(𝓕^∨(n)) (EtaleDualityAndPerverseSheaves:EDC.2); Artin vanishing H^i = 0 for i > n on affine X (requested from SchemeAndStackFoundations:SF.2); so H^i_c = 0 for i < n and, via the isomorphism, for i > n; purity from the upper bounds on H^n_c(𝓕) and H^n_c(𝓕^∨(n)) (Weil II 3.3.4, DeligneWeightsAndPurity:DWP.7). (c): injectivity plus the two weight bounds (Remark 1.21).

Acceptance: X = A¹, 𝓕 = L_ψ(f), p ∤ deg f: the hypothesis of (a) holds at ∞ (totally wild, no inertia invariants), giving H¹_c pure of weight 1.

Rests on: stages `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.7`.

Sources: Deligne, SGA 4½, [Sommes trig.] Proposition 1.20, volume p. 180; Deligne, SGA 4½, [Sommes trig.] Proposition 1.19, volume p. 179.

### 9. The ℓ-adic route to the multiplicative and mixed bounds

A polynomial elementary L-function is `det(1 − T·Frob | H¹_c)` and `H²_c = 0`; weights bound its reciprocal roots by `√q`. This gives the multiplicative bound for every non-degenerate `g` (an interface id and a planet), the mixed bound, and Weil's bound for Artin–Schreier sums on curves with its eigenvalue pairing.

**Lemma `rank-one-sheaf-l-function`** — The elementary L-function of a rank-one character sum is det(1 − T·Frob | H¹_c) when it is a polynomial. Let g ∈ F[X] be nonzero, U = A¹ ∖ {g = 0}, f ∈ F[X][1/g] (regular on U), ψ additive, χ multiplicative characters, 𝓕 = L_ψ(f) ⊗ L_χ(g) on U, and Λ(h) := ψ(Tr_{F[X]/(h)}(f))·χ(Res(h, g)) for monic h coprime to g, Λ(h) := 0 otherwise. If the monic L-series L(Λ; T) is a polynomial, then H²_c(U_F̄, 𝓕) = 0 and L(Λ; T) = det(1 − T·Frob | H¹_c(U_F̄, 𝓕)); in particular dim H¹_c(U_F̄, 𝓕) = deg L(Λ; T).

Hypotheses and conventions: f regular on U; L(Λ; T) a polynomial (as proved elementarily in FF.2/additive-l-function-is-polynomial, FF.2/multiplicative-l-function-is-polynomial, FF.2/mixed-l-function-is-polynomial, FF.2/kloosterman-l-function).

Proof: Λ(π) is the Frobenius trace of 𝓕 at the closed point π of U (FF.2/root-sum-additive-character, FF.2/root-sum-multiplicative-character, (1.7.6)), so L(Λ; T) is the L-function of 𝓕 on U, which the trace formula writes as Π_i det(1 − T Frob | H^i_c)^{(−1)^{i+1}} (SchemeAndStackFoundations:SF.2). H⁰_c = 0 (FF.2/lisse-sheaf-extremal-cohomology-on-curve), so L(Λ; T) = det(1 − T Frob | H¹_c)/det(1 − T Frob | H²_c). Eigenvalues on H²_c have absolute value q (weight 2: coinvariants of a weight-0 sheaf twisted by (−1)); eigenvalues on H¹_c have absolute value ≤ √q (DeligneWeightsAndPurity:DWP.7). No cancellation is possible, so a polynomial L(Λ; T) forces H²_c = 0.

Acceptance: f = X, g = 1: L = 1 and H¹_c(A¹, L_ψ) = 0. f = aX + bX^{−1}, g = X, χ trivial: L = 1 + K T + qT², dim H¹_c(G_m, L_ψ(aX + b/X)) = 2.

Rests on: nodes `monic-l-series-log-derivative`, `root-sum-additive-character`, `root-sum-multiplicative-character`, `artin-schreier-sheaf`, `kummer-sheaf`, `lisse-sheaf-extremal-cohomology-on-curve`; stages `SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.7`.

Sources: Deligne, SGA 4½, [Sommes trig.] Théorème 1.15 proof, volume p. 177; Kowalski, Chapter 5, section 5.3, printed p. 70.

**Theorem `rank-one-sheaf-root-bound`** — Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route). In the setting of FF.2/rank-one-sheaf-l-function, if L(Λ; T) = Π_j(1 − ω_jT) is a polynomial, then |ι(ω_j)| ≤ √q for every j and every embedding ι of the coefficient field into ℂ.

Hypotheses and conventions: L(Λ; T) a polynomial.

Proof: The ω_j are the Frobenius eigenvalues on H¹_c(U_F̄, 𝓕) (FF.2/rank-one-sheaf-l-function); 𝓕 is pure of weight 0 (its Frobenius traces at closed points are roots of unity); H¹_c is mixed of weights ≤ 1 (Weil II 3.3.4, DeligneWeightsAndPurity:DWP.7).

Acceptance: f = X², q = 5: ω = −g with |g| = √5. Kloosterman: ω₁ω₂ = q forces |ω_i| = √q.

Rests on: nodes `rank-one-sheaf-l-function`; stages `DeligneWeightsAndPurity:DWP.7`.

Sources: Deligne, Weil II, Corollaire 3.3.4, p. 206.

**Theorem `weil-bound-multiplicative`** (planet: *Weil bound for multiplicative character sums*) — Weil's bound |Σ χ(g(x))| ≤ (m − 1)√q when g is not a constant times an ord(χ)-th power. Let χ be a multiplicative character of F of order e ≥ 2 and g ∈ F[X] not of the form c·h^e with c ∈ F̄, h ∈ F̄[X]; let m be the number of distinct roots of g in F̄. Then |Σ_{x∈F} χ(g(x))| ≤ (m − 1)√q, and |S̃_L(g, χ)| ≤ (m − 1)|L|^{1/2} for every finite extension L.

Hypotheses and conventions: χ of exact order e ≥ 2 (the trivial character is excluded: Mathlib's trivial MulChar would count the non-roots of g). The degenerate polynomials are the c·h^e, including c not an e-th power (FF.2/multiplicative-perfect-power-sum); a perfect power h^k with e ∤ k is not degenerate.

Proof: Z(g, χ; T) is a polynomial of degree ≤ m − 1 (FF.2/multiplicative-l-function-is-polynomial). Its reciprocal roots have |ω| ≤ √q (FF.2/rank-one-sheaf-root-bound with f = 0, applied to the Kummer sheaf L_χ(g) on {g ≠ 0}). S̃_ν = −Σ ω_j^ν (FF.2/l-function-reciprocal-roots).

Acceptance: χ quadratic, g = X³ + aX + b squarefree: |Σ χ(g(x))| ≤ 2√q (Hasse). χ cubic, g = X²: m = 1, the bound gives 0, and indeed Σ χ(x²) = 0. χ quadratic, g = c(X² + 1)² with c a non-square: degenerate, |Σ| = q − #{x² + 1 = 0} (not bounded by (m − 1)√q).

Rests on: nodes `multiplicative-l-function-is-polynomial`, `rank-one-sheaf-root-bound`, `l-function-reciprocal-roots`, `multiplicative-companion-sum`.

Sources: Kowalski, Chapter 3, Theorem 3.1, printed p. 31; Deligne, SGA 4½, [Sommes trig.] (1.17.1), volume p. 178.

**Theorem `weil-bound-mixed`** — Weil's bound for mixed sums |Σ χ(g(x))ψ(f(x))| ≤ (m + n − 1)√q. Let ψ ≠ 1, f ∈ F[X] of degree n ≥ 1 with p ∤ n, χ any multiplicative character and g ∈ F[X] nonzero with m distinct roots in F̄. Then |Σ_{x∈F} χ(g(x))ψ(f(x))| ≤ (m + n − 1)√q, and likewise over every finite extension.

Hypotheses and conventions: p ∤ n = deg f ≥ 1; χ may be trivial (then the sum is over g(x) ≠ 0).

Proof: The L-function of Λ = λ_{f,ψ}μ_{g,χ} is a polynomial of degree ≤ m + n − 1 (FF.2/mixed-l-function-is-polynomial). Its reciprocal roots have |ω| ≤ √q (FF.2/rank-one-sheaf-root-bound for L_ψ(f) ⊗ L_χ(g) on {g ≠ 0}). Companion sums are −Σ ω^ν (FF.2/l-function-reciprocal-roots).

Acceptance: g = 1: recovers FF.2/weil-bound-additive (m = 0). f = X, g = X, χ ≠ 1: a Gauss sum, bound √q, attained.

Rests on: nodes `mixed-l-function-is-polynomial`, `rank-one-sheaf-root-bound`, `l-function-reciprocal-roots`.

Sources: Kowalski, Chapter 3, introduction, printed p. 31.

**Theorem `artin-schreier-sum-on-curve-bound`** — Weil–Deligne bound for additive sums of a rational function on a curve (Sommes trig. (3.5.2)). Let X₀ be a smooth projective absolutely irreducible curve of genus g over F, f a rational function on X₀ not of the form h^p − h + c (h rational, c ∈ F), ψ(x) = exp(2πi Tr_{F/F_p}(x)/p), and S_f := Σ′_{x∈X₀(F)} ψ(f(x)), the sum over the rational points with v*_x(f) = 0, where ψ(f(x)) := ψ((f + h^p − h)(x)) for any h making f + h^p − h regular at x. Then H^i(X̄, j_*L(ψf)) = 0 for i ≠ 1, S_f = −Tr(F* | H¹(X̄, j_*L(ψf))), this H¹ has dimension 2g − 2 + Σ_{v*_x(f)>0}[k(x):F](1 + v*_x(f)), every eigenvalue has all complex conjugates of absolute value q^{1/2}, and |S_f| ≤ (2g − 2 + Σ_{v*_x(f)≠0}[k(x):F](1 + v*_x(f))) q^{1/2}.

Hypotheses and conventions: f not Artin–Schreier trivial; j : U₀ → X₀ the open where f is regular.

Proof: Trace formula for j_*L(ψf) on the proper X₀ (SchemeAndStackFoundations:SF.2) with the local computation: F*_x = ψ(f(x)) where v*_x = 0 and (j_*L)_x = 0 where v*_x > 0 (FF.2/swan-conductor-of-artin-schreier-sheaf, (1.7.6)). L(ψf) is geometrically non-constant (else f = h^p − h + λ); so H⁰ = 0 and, by duality, H² = 0 (FF.2/lisse-sheaf-extremal-cohomology-on-curve, EtaleDualityAndPerverseSheaves:EDC.2). Dimension by the Grothendieck–Ogg–Shafarevich formula (3.2.1) with Sw_x = v*_x(f) (requested from EtaleDualityAndPerverseSheaves:EDC.2; gap). Purity of H¹(X̄, j_*𝓕) for 𝓕 punctually pure of weight 0: Weil II Théorème 3.2.3 (requested from DeligneWeightsAndPurity:DWP.6); Sommes trig. 3.4 attributes the case of sheaves trivialised by a finite cover to Weil.

Acceptance: X₀ = P¹, f polynomial with p ∤ deg f: g = 0, one point ∞ with v* = deg f, dimension deg f − 1 (FF.2/weil-bound-additive). X₀ = P¹, f = x + a/x: dimension −2 + 2 + 2 = 2 (Kloosterman). f = h^p − h + c: S_f counts points and the bound fails; the hypothesis is necessary.

Rests on: nodes `artin-schreier-sheaf`, `modified-pole-order`, `swan-conductor-of-artin-schreier-sheaf`, `lisse-sheaf-extremal-cohomology-on-curve`; stages `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.6`.

Sources: Deligne, SGA 4½, [Sommes trig.] Exemple 3.5, (3.5.2) and (3.5.5), volume pp. 191-192; Deligne, Weil II, Théorème 3.2.3, p. 200.

**Theorem `involution-eigenvalue-pairing`** — An involution with f∘σ = −f pairs the Frobenius eigenvalues as α, q/α (Sommes trig. 3.6). In the setting of FF.2/artin-schreier-sum-on-curve-bound, suppose σ is an automorphism of X₀ with f(σx) = −f(x). Then S_f is real. If σ is an involution, H¹(X̄, j_*L(ψf)) carries an alternating perfect pairing with values in E(1), so it has even dimension, every nonzero v*_x(f) is odd, and the eigenvalues of F* are grouped in pairs α, q/α.

Hypotheses and conventions: σ an involution with f ∘ σ = −f.

Proof: 𝓕₀ = j_*L(ψf) and 𝒢₀ = j_*L(ψ(−f)) are dual; σ^*𝓕₀ ≅ 𝒢₀ with (σ²)^* the identity; the pairing satisfies σ^*(f·g) = σ^*f·σ^*g. Poincaré duality on the proper curve (EtaleDualityAndPerverseSheaves:EDC.2) makes H¹(𝓕) × H¹(𝒢) → E(1) perfect; composing with σ^* gives an alternating form on H¹(𝓕), since σ acts trivially on E(1).

Acceptance: Kloosterman: X₀ = P¹, f = x + a/x, σx = −x: H¹ of dimension 2, eigenvalues α, q/α.

Rests on: nodes `artin-schreier-sum-on-curve-bound`; stages `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: Deligne, SGA 4½, [Sommes trig.] 3.6, volume p. 192.

### 10. Kloosterman sums and Gauss sums

Carlitz's computation makes the Kloosterman L-function `1 + K T + qT²`; the ℓ-adic route bounds its two roots, which gives `|K(a, b)| ≤ 2√q` (an interface id and a planet). The Gauss sum is the Frobenius eigenvalue on `H¹_c(G_m, L_ψ ⊗ L_χ)`, compared with `FF.1`'s Hasse–Davenport relation.

**Definition `kloosterman-sum`** — Kloosterman sums over F and its extensions. For ψ an additive character, a, b ∈ F and L/F finite: K(ψ; a, b; L) := Σ_{x∈L^×} ψ(Tr_{L/F}(a x + b x^{−1})). For L = F this is Σ_{x∈F^×} ψ(ax + b/x); with F = F_p and ψ = e(·/p) it is the classical S(a, b; p).

Hypotheses and conventions: ψ arbitrary in the definition; a, b arbitrary (the bound needs ab ≠ 0).

API: `kloostermanSum` (data: K(ψ; a, b; L) = Σ_{x∈L^×} ψ(Tr_{L/F}(a x + b x⁻¹))); `kloostermanSum_comm` (relation: K(a, b) = K(b, a)); `kloostermanSum_eq_one_mul` (relation: For a ≠ 0: K(a, b) = K(1, ab)); `kloostermanSum_conj` (relation: For complex-valued ψ: the complex conjugate of K(a, b) is K(−a, −b) = K(a, b), so K is real); `kloostermanSum_zero_right` (simp: K(a, 0; L) = −1 for a ≠ 0 and ψ ≠ 1).

Unit tests: K(0, 0; L) = |L| − 1 (`kloostermanSum_test_zero_zero`, degenerate); For ψ ≠ 1 and a ≠ 0: K(a, 0; F) = −1 (`kloostermanSum_test_zero_right`, computation); Over ZMod 3 with ψ ≠ 1: K(1, 1) = −1 (`kloostermanSum_test_F3`, computation).

Uses: Sommes trig. Exemple 3.7; FKMS section 2.2: the basic rational-function sum and its sheaf; FF.2/kloosterman-l-function, FF.2/kloosterman-bound: its L-function and Weil bound; PAPER-FRESAN-SABBAH-YU-22 item 66 (KloostermanMomentsAndPotentialAutomorphy): Weil's bound for Kl₂(a; q) with ψ of F_p composed with the trace; QSeriesPartitionsAndMockModularForms:QM.2, ExponentialSumsAndCircleMethod: Kloosterman sums in exact formulas and in the circle method.

Construction: Finite sum over the units of L.

Acceptance: K(a, 0) = −1 for a ≠ 0 and ψ ≠ 1. K(0, 0) = |L| − 1. K(1, 1) = −1 over F_3.

Rests on: library `AddChar`, `Algebra.trace`.

Sources: Kowalski, Introduction, Definition 7, printed p. 4; Fouvry–Kowalski–Michel–Sawin, section 2.2, p. 3.

**Theorem `kloosterman-l-function`** — The L-function of Kloosterman sums is 1 + K T + qT² (Carlitz). Let ψ ≠ 1 and a, b ∈ F^×. For L_ν the extension of degree ν, exp(Σ_{ν≥1} K(a, b; L_ν)T^ν/ν) = 1 + K(a, b; F)T + qT². Equivalently there are α, β ∈ ℂ with α + β = −K(a, b; F), αβ = q and K(a, b; L_ν) = −(α^ν + β^ν) for all ν ≥ 1.

Hypotheses and conventions: ψ ≠ 1; a ≠ 0 and b ≠ 0.

Proof: Take Λ(h) := [h(0) ≠ 0]·ψ(Tr_{F[X]/(h)}(aX + bX^{−1})); it is completely multiplicative, and for h = X^n + c_{n−1}X^{n−1} + ⋯ + c₀ with c₀ ≠ 0, Tr(aX + bX^{−1}) = −a c_{n−1} − b c₁/c₀ (sum of the roots and of their inverses). Its companion sums are the Kloosterman sums (FF.2/monic-l-series-log-derivative). c₁ = Σ_{c₀≠0} ψ(−a c₀ − b/c₀) = K(a, b); c₂ = Σ_{c₀≠0} Σ_{c₁} ψ(−c₁(a + b/c₀)) = q (only c₀ = −b/a survives); for n ≥ 3 the free sum over c_{n−1} gives 0 because a ≠ 0 (mathlib:AddChar.sum_mulShift). Reciprocal roots from FF.2/l-function-reciprocal-roots.

Acceptance: F = ZMod 3, a = b = 1: L = 1 − T + 3T². b = 0 is excluded: then c₂ = 0 and L = 1 − T (K(a, 0) = −1).

Rests on: nodes `kloosterman-sum`, `monic-l-series`, `monic-l-series-log-derivative`, `l-function-reciprocal-roots`; library `AddChar.sum_mulShift`.

Sources: Deligne, SGA 4½, [Sommes trig.] Exemple 3.7, volume p. 193; Kowalski, Chapter 2, Remark 2.11, printed p. 23.

**Theorem `kloosterman-bound`** (planet: *Weil bound for Kloosterman sums*) — Weil's bound |K(a, b)| ≤ 2√q for Kloosterman sums. Let ψ ≠ 1 and a, b ∈ F^×. The numbers α, β of FF.2/kloosterman-l-function satisfy |ι(α)| = |ι(β)| = √q for every embedding ι, so |K(a, b; L)| ≤ 2|L|^{1/2} for every finite extension L; in particular |Σ_{x∈F^×} ψ(ax + b/x)| ≤ 2√q, and |S(m, n; p)| ≤ 2√p for p ∤ mn.

Hypotheses and conventions: ψ ≠ 1; ab ≠ 0.

Proof: 1 + KT + qT² = (1 − αT)(1 − βT) is a polynomial L-series of Λ = λ_{aX+b/X,ψ}·[X ∤ h] (FF.2/kloosterman-l-function), so FF.2/rank-one-sheaf-root-bound applies to L_ψ(aX + b/X) on G_m: |α|, |β| ≤ √q. αβ = q forces |α| = |β| = √q; the same for all conjugates (applying the argument to σ ∘ ψ). K(a, b; L_ν) = −(α^ν + β^ν).

Acceptance: F = ZMod 3, K(1, 1) = −1: α, β = (1 ± i√11)/2, |α|² = 3. Kloosterman's elementary bound |S| ≤ 2p^{3/4} (Kowalski Theorem 9) is weaker; the constant 2 is sharp in the sense that |S(m, n; p)|² > 2p − 2 for some m, n (Kowalski (7)).

Rests on: nodes `kloosterman-l-function`, `rank-one-sheaf-root-bound`, `kloosterman-sum`.

Sources: Kowalski, Introduction, Theorem 10, printed p. 5; Fouvry–Kowalski–Michel–Sawin, section 2.2, p. 3.

**Comparison `gauss-sum-frobenius-eigenvalue`** — Gauss sums as the Frobenius eigenvalue on H¹_c(G_m, L_ψ ⊗ L_χ). For χ ≠ 1 and ψ ≠ 1: H^i_c(G_{m,F̄}, L_ψ ⊗ L_{χ^{−1}}) = 0 for i ≠ 1, dim H¹_c = 1, and Frobenius acts on it by τ(χ, ψ) := −Σ_{x∈F^×} ψ(x)χ^{−1}(x) = −gaussSum χ⁻¹ ψ (Mathlib's gaussSum). Consequently |τ(χ, ψ)| = √q, compatible with mathlib:gaussSum_mul_gaussSum_eq_card, and the Frobenius of F_{q^ν} acts by τ(χ, ψ)^ν, which is the Hasse–Davenport relation τ(χ ∘ N, ψ ∘ Tr) = τ(χ, ψ)^ν of FF.1/hasse-davenport-lifting (Deligne's sign convention τ = −gaussSum).

Hypotheses and conventions: χ ≠ 1, ψ ≠ 1; Deligne's normalisation (1.14.1).

Proof: The monic L-series of Λ(h) = [h(0) ≠ 0]ψ(−c_{n−1})χ^{−1}((−1)^n c₀) is 1 − τT: coefficients of T^n vanish for n ≥ 2 (free sum over c_{n−1}); FF.2/rank-one-sheaf-l-function identifies it with det(1 − T Frob | H¹_c). Weight: |τ| ≤ √q (FF.2/rank-one-sheaf-root-bound) and |τ|² = q (Mathlib's gaussSum identity with complex conjugation). Over F_{q^ν}: the eigenvalue of Frob^ν is τ^ν, and the trace formula over F_{q^ν} (FF.2/character-sheaf-trace-formula) gives Hasse–Davenport — the cohomological proof of Sommes trig. Théorème 1.15, compared here with FF.1's statement.

Acceptance: q = 5, χ quadratic: τ² = χ(−1)·5 (mathlib gaussSum_sq). The sign: Deligne's τ(χ, ψ) is minus Mathlib's gaussSum χ⁻¹ ψ; forgetting it breaks Hasse–Davenport for even ν.

Rests on: nodes `rank-one-sheaf-l-function`, `rank-one-sheaf-root-bound`, `character-sheaf-trace-formula`; other layers `FF.1/hasse-davenport-lifting`; library `gaussSum`, `gaussSum_mul_gaussSum_eq_card`.

Sources: Deligne, SGA 4½, [Sommes trig.] 1.14-1.15, volume p. 177.

### 11. Several variables

Deligne's elementary bound by fibration over a line, and the sharp bound of Weil I Théorème 8.4 by concentration of `H*_c(A^n, L_ψ(Q))` in degree `n`. Lemma 8.5 of Weil I rests on a relative compactification and on local constancy over the space of polynomials with smooth leading form, which have no supplier (gap).

**Lemma `hypersurface-through-all-rational-points`** — A hypersurface of degree d in P^r through all F-rational points has d ≥ q + 1 (Sommes trig. Lemme 3.9). Let r ≥ 1 and H ∈ F[X₀, …, X_r] a nonzero homogeneous polynomial of degree d vanishing at every point of P^r(F). Then d ≥ q + 1.

Hypotheses and conventions: r ≥ 1; H nonzero homogeneous.

Proof: Induction on r (Deligne). If some F-rational hyperplane Π is not contained in {H = 0} (possible only for r ≥ 2, since for r = 1 the hyperplanes are the rational points), H restricted to Π ≅ P^{r−1} is a nonzero form of degree d vanishing on all rational points, and d ≥ q + 1 by induction. Otherwise every F-rational hyperplane is a component of {H = 0}, so H is divisible by the product of the q^r + ⋯ + 1 ≥ q + 1 distinct linear forms, and d ≥ q + 1.

Acceptance: r = 1, H = X₀^q X₁ − X₀X₁^q vanishes on P¹(F) and has degree q + 1: the bound is sharp. Degree q is not enough: X₀^q − X₀X₁^{q−1} (the quotient of the previous form by X₁) does not vanish at (1 : 0).

Rests on: .

Sources: Deligne, SGA 4½, [Sommes trig.] Lemme 3.9, volume p. 193.

**Theorem `elementary-n-variable-bound`** — Deligne's elementary n-variable bound (d − 1)q^{n−1/2} (Sommes trig. Proposition 3.8). Let P ∈ F[X₁, …, X_n] have degree d and not be of the form Q^p − Q + c (Q ∈ F[X₁, …, X_n], c ∈ F), and ψ(x) = exp(2πi Tr_{F/F_p}(x)/p). Then |Σ_{x∈F^n} ψ(P(x))| ≤ (d − 1) q^{n−1/2}.

Hypotheses and conventions: ψ the canonical character; P not Artin–Schreier trivial.

Proof: It suffices to treat d − 1 < q^{1/2} (otherwise the trivial bound q^n is smaller), so d < q + 1. Case p ∤ d: by FF.2/hypersurface-through-all-rational-points applied to P_d, after a linear change of variables P_d(1, 0, …, 0) ≠ 0; for fixed x₂, …, x_n the polynomial in x₁ has degree d prime to p, so each inner sum is ≤ (d − 1)q^{1/2} (FF.2/weil-bound-additive); sum over q^{n−1} fibres. Case p | d: if P_d is a p-th power, replace P by P − (P_d − P_d^{1/p}) (same sum, FF.2/artin-schreier-invariance) and induct on d; otherwise arrange S₁ ≠ 0 in P_d = Σ X₁^{d−i}S_i and S₀ = 0; on the q^{n−1} − q^{n−2} points where S₁ ≠ λ the inner polynomial has degree d − 1 prime to p, giving (d − 2)q^{1/2}; the hyperplane S₁ = λ has q^{n−2} points, each trivially ≤ q; total < (d − 2)q^{n−1/2} + q^{n−1} < (d − 1)q^{n−1/2}.

Acceptance: n = 1: the classical one-variable bound. P = Q^p − Q: the sum is q^n; the exclusion is necessary.

Rests on: nodes `hypersurface-through-all-rational-points`, `weil-bound-additive`, `artin-schreier-invariance`.

Sources: Deligne, SGA 4½, [Sommes trig.] Proposition 3.8, volume p. 193.

**Lemma `deligne-cohomology-of-polynomial-sheaf`** — H*_c(A^n, L_ψ(Q)) is concentrated in degree n, of dimension (d − 1)^n (Weil I Lemme 8.5(i)). Let Q ∈ F[x₁, …, x_n] have degree d with p ∤ d, and let its homogeneous part Q_d of degree d define a smooth hypersurface in P^{n−1}. For ψ ≠ 1: H^i_c(A^n_F̄, L_ψ(Q)) = 0 for i ≠ n and dim H^n_c(A^n_F̄, L_ψ(Q)) = (d − 1)^n.

Hypotheses and conventions: p ∤ d; Q_d smooth (nonzero discriminant); ψ ≠ 1.

Proof: Family argument (Weil I 8.10): over the space S of polynomials with smooth leading form, a relative compactification Z_S/S of the Artin–Schreier cover X_S with relative normal-crossings boundary (8.6-8.9, via Zariski's normalisation-blow-up resolution of the surface singularity of 8.8) makes the R^i f_!(L_ψ(Q_S)) locally constant; S is connected, so it suffices to treat Q = Σ x_i^d. Künneth (Sommes trig. (2.4.1)*, requested from SchemeAndStackFoundations:SF.2) reduces to n = 1, Q = x^d. n = 1: H⁰_c = H²_c = 0 (FF.2/lisse-sheaf-extremal-cohomology-on-curve: rank one and geometrically nontrivial), and χ_c(A¹, L_ψ(x^d)) = 1 − d by the Euler–Poincaré formula with Sw_∞ = d (FF.2/swan-conductor-of-artin-schreier-sheaf; formula requested from EtaleDualityAndPerverseSheaves:EDC.2).

Acceptance: n = 1: dim H¹_c(A¹, L_ψ(x^d)) = d − 1, matching FF.2/additive-l-function-is-polynomial and FF.2/artin-schreier-zeta-factorization. n = 2, Q = x₁x₂ with p odd (Q_d defines two distinct points of P¹, a smooth hypersurface): Σ ψ(x₁x₂) = q, and dim H²_c = 1 = (d − 1)².

Rests on: nodes `artin-schreier-sheaf`, `lisse-sheaf-extremal-cohomology-on-curve`, `swan-conductor-of-artin-schreier-sheaf`; stages `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Sources: Deligne, Weil I, Lemme 8.5 and 8.10-8.12, pp. 303-306.

**Lemma `deligne-duality-for-polynomial-sheaf`** — The cup product on H^n_c(A^n, L_ψ(Q)) is a perfect duality; forget-supports is an isomorphism (Weil I Lemme 8.5(ii)). Under the hypotheses of FF.2/deligne-cohomology-of-polynomial-sheaf: the cup product H^n_c(A^n, L_ψ(Q)) ⊗ H^n_c(A^n, L_{ψ^{−1}}(Q)) → H^{2n}_c(A^n, E) ≅ E(−n) is a perfect pairing; equivalently H^n_c(A^n, L_ψ(Q)) → H^n(A^n, L_ψ(Q)) is an isomorphism.

Hypotheses and conventions: As in FF.2/deligne-cohomology-of-polynomial-sheaf.

Proof: Local constancy in the family (as in the previous node) reduces to Q = Σ x_i^d and, by Künneth, to n = 1. n = 1: the perfectness is Poincaré duality for L_ψ(x^d) on A¹ together with j_! = j_* at ∞ (no inertia invariants), SGA 4½ [Dualité] (2.8)/(2.12) (requested from EtaleDualityAndPerverseSheaves:EDC.2). Equivalence with forget-supports: Poincaré duality identifies H^n(L_ψ(Q)) with the dual of H^n_c(L_{ψ^{−1}}(Q))(−n).

Acceptance: n = 1, Q = x: both groups vanish (d − 1 = 0).

Rests on: nodes `deligne-cohomology-of-polynomial-sheaf`; stages `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`.

Sources: Deligne, Weil I, Lemme 8.5(ii) and 8.11, pp. 303, 305.

**Theorem `deligne-n-variable-bound`** — Deligne's bound |Σ_{x∈F^n} ψ(Q(x))| ≤ (d − 1)^n q^{n/2} (Weil I Théorème 8.4). Let Q ∈ F[x₁, …, x_n] of degree d with p ∤ d and leading form Q_d defining a smooth hypersurface in P^{n−1}, and ψ ≠ 1. Then |Σ_{x∈F^n} ψ(Q(x))| ≤ (d − 1)^n q^{n/2}, and over every finite extension L: |Σ_{x∈L^n} ψ(Tr_{L/F} Q(x))| ≤ (d − 1)^n |L|^{n/2}.

Hypotheses and conventions: p ∤ d; Q_d smooth; ψ ≠ 1.

Proof: Trace formula (FF.2/character-sheaf-trace-formula): the sum is (−1)^n Tr(F* | H^n_c(A^n, L_ψ(Q))) since the other H^i_c vanish (FF.2/deligne-cohomology-of-polynomial-sheaf). H^n_c → H^n is an isomorphism (FF.2/deligne-duality-for-polynomial-sheaf), so H^n_c is pure of weight n (FF.2/affine-concentration-criterion (b), with the weight bounds of DeligneWeightsAndPurity:DWP.7). Hence |sum| ≤ (d − 1)^n q^{n/2}. (Deligne's original route: injectivity into H^n of the smooth projective compactification Z of the Artin–Schreier cover, then the Riemann hypothesis for Z, Weil I (1.7).).

Acceptance: n = 1: the Weil bound (d − 1)√q. Q = Σ x_i^d: the sum is the n-th power of a one-variable sum, and the bound is the n-th power of Weil's. Q_d singular, e.g. Q = x₁^d (n = 2): the sum is q·Σ ψ(x^d), of size q^{3/2}; smoothness of Q_d is needed.

Rests on: nodes `character-sheaf-trace-formula`, `deligne-cohomology-of-polynomial-sheaf`, `deligne-duality-for-polynomial-sheaf`, `affine-concentration-criterion`; stages `DeligneWeightsAndPurity:DWP.7`.

Sources: Deligne, Weil I, Théorème 8.4, pp. 302-303.

### 12. Fourier–Deligne transform, Lang–Weil and Chebotarev

The remaining items of Browning–Sawin's route 2, with the review's repair of their Lemma 3.7 (the Fourier input), and the red-team additions: the uniform Lang–Weil estimate (Ghorpade–Lachaud Theorem 11.1, whose constant needs Betti-number bounds that have no owner — gap) and the geometric Chebotarev theorem. Lang–Weil is a planet.

**Construction `fourier-deligne-transform`** — The one-variable Fourier–Deligne transform FT_ψ. For ψ ≠ 1 and K in the bounded constructible derived category D^b_c(A¹_F, E) (EtaleDualityAndPerverseSheaves:EDC.0 / SchemeAndStackFoundations:SF.2), FT_ψ(K) := R pr_{2!}(pr₁^*K ⊗ L_ψ(xy))[1] ∈ D^b_c(A¹_F, E), with pr₁, pr₂ : A¹ × A¹ → A¹ and L_ψ(xy) the Artin–Schreier sheaf of the pairing (Laumon Définition 1.2.1.1 with S = Spec F, E = A¹, r = 1). Its trace function over F_{q^ν} is the finite Fourier transform with the sign of the shift: t_{FT_ψ(K),ν}(y) = −Σ_{x∈F_{q^ν}} t_{K,ν}(x) ψ(Tr(xy)) (Laumon Théorème 1.2.1.2). It is a triangulated functor, compatible with extension of scalars, and FT_ψ ∘ FT_ψ ≅ [−1]^*(−1) (FF.2/fourier-deligne-inversion).

Hypotheses and conventions: ψ nontrivial; K bounded constructible; the vector bundle is A¹ over Spec F (rank r = 1, whence the shift [1] and the sign −1).

API: `fourierDeligneTrace` (data: The trace-function dictionary of FT_ψ: t ↦ (y ↦ −Σ_{x∈F} t(x)ψ(xy)) (Laumon 1.2.1.2). The sheaf-level functor is not declared in the prototype: its carrier D^b_c is supplied by SF.2/EDC.0 and absent from Mathlib); `fourierDeligneTrace_fourierDeligneTrace` (relation: Trace shadow of inversion: FT(FT t)(x) = q·t(−x), the trace of [−1]^*K(−1)); `fourierDeligneTrace_one` (simp: FT(1) = −q·δ₀: the trace of FT_ψ(E) = δ₀(−1)[−1]); `fourierDeligneTrace_single` (simp: FT(δ_a)(y) = −ψ(ay)); `fourierDeligneTrace_mulShift` (relation: FT_{ψ.mulShift a}(t)(y) = FT_ψ(t)(a y) (dilation)).

Unit tests: fourierDeligneTrace ψ 1 0 = −q and fourierDeligneTrace ψ 1 y = 0 for y ≠ 0 (`fourierDeligneTrace_test_one`, computation); fourierDeligneTrace ψ (Pi.single 0 1) y = −1 for every y (`fourierDeligneTrace_test_delta`, computation); The transform of the constant function at 0 is −q, not q: the shift [1] contributes the sign (`fourierDeligneTrace_test_sign`, non-example).

Uses: Browning–Sawin, Lemma 2.1 and Lemma 3.7: the inversion formula and the Fourier input for the one-modulus trace map; FF.2/fourier-input-for-one-modulus: representing R pr_! of an Artin–Schreier family as FT(f_*E) shifted; LefschetzPencilsAndVanishingCycles Part II (general bases, local Fourier transforms): the global transform to be compared with Laumon's local Fourier transforms (RT-AREA-etale/14).

Construction: Definition by the six operations on D^b_c (the carrier and Rf_!, f^*, ⊗ are requested from SchemeAndStackFoundations:SF.2, integrating the PR196 compact-support supplier, and used through EtaleDualityAndPerverseSheaves:EDC.0). Kernel: L_ψ(xy) = m^*L_ψ for m(x, y) = xy (FF.2/artin-schreier-sheaf, pull-back). Trace dictionary: the trace formula for R pr_{2!} fibrewise (proper base change and SF.2's trace formula) gives t(y) = (−1)^1 Σ_x t_K(x)ψ(xy).

Acceptance: FT_ψ(E_{A¹}) ≅ δ₀(−1)[−1]: trace function −q·[y = 0] (Browning–Sawin's unit test: the constant sheaf transforms to a point-supported object). FT_ψ(δ₀) ≅ E_{A¹}[1]: trace function −1. The trace of FT∘FT is q·t(−x), the trace of [−1]^*K(−1).

Rests on: nodes `artin-schreier-sheaf`; stages `SchemeAndStackFoundations:SF.2`.

Sources: Laumon, Définition 1.2.1.1 and Théorème 1.2.1.2, p. 141; Browning–Sawin, section 2, p. 900 (arXiv v3 p. 8).

**Theorem `fourier-deligne-inversion`** — Fourier–Deligne inversion FT_ψ ∘ FT_ψ ≅ [−1]^*(−1) (Laumon Théorème 1.2.2.1). For K ∈ D^b_c(A¹_F, E): FT_ψ(FT_ψ(K)) ≅ [−1]^*K(−1), functorially in K. In particular FT_ψ is an auto-equivalence of D^b_c(A¹, E).

Hypotheses and conventions: ψ ≠ 1; the rank-one case of Laumon's theorem (for a vector bundle of rank r the twist is (−r) and a(e) = −e).

Proof: By proper base change and the projection formula (SchemeAndStackFoundations:SF.2), FT∘FT(K) = R pr_{3!}(pr₁^*K ⊗ R pr_{13!}L_ψ(x₁x₂ + x₂x₃))[2] = R pr_{3!}(pr₁^*K ⊗ R pr_{13!}L_ψ(x₂(x₁ + x₃)))[2]. R pr_{13!} L_ψ(x₂(x₁ + x₃)) vanishes off the antidiagonal x₁ + x₃ = 0 (stalks are H*_c(A¹, L_ψ(c x₂)) = 0 for c ≠ 0, FF.2/character-sheaf-cohomology-vanishes) and is E(−1)[−2] on it (H²_c(A¹, E) = E(−1)). Hence FT∘FT(K) ≅ [−1]^*K(−1).

Acceptance: K = E: FT(E) = δ₀(−1)[−1] and FT(δ₀(−1)[−1]) = E(−1) = [−1]^*E(−1). Trace level: FT(FT t)(x) = q t(−x) (fourierDeligneTrace_fourierDeligneTrace).

Rests on: nodes `fourier-deligne-transform`, `character-sheaf-cohomology-vanishes`; stages `SchemeAndStackFoundations:SF.2`.

Sources: Laumon, Théorème 1.2.2.1, p. 141.

**Theorem `fourier-input-for-one-modulus`** — The Fourier input of Browning–Sawin Lemma 3.7: H^i_c(G_m × A¹, L_ψ(h f(a))) = 0 for i > 2. Let f ∈ F[a] be non-constant of degree D with 1 ≤ D < p, and ψ ≠ 1. Then H^i_c((G_m × A¹)_F̄, L_ψ(h f(a))) = 0 for i > 2 (coordinates h on G_m and a on A¹).

Hypotheses and conventions: 1 ≤ D < p (Browning–Sawin assume char F > k ≥ D); ψ ≠ 1.

Proof: For h ≠ 0, RΓ_c(A¹_a, L_ψ(h f(a))) is concentrated in degree 1 (a one-variable Artin–Schreier sheaf with pole order D prime to p at ∞: H⁰_c = H²_c = 0, FF.2/lisse-sheaf-extremal-cohomology-on-curve); so the total complex is RΓ_c(G_m, 𝒢[−1]) with 𝒢 = R¹pr_{h!}, and only H² _c(G_m, 𝒢) (total degree 3) can survive above 2. Split f_*E = E ⊕ 𝓕₀ by the trace; 𝓕₀ has no geometric invariants or coinvariants (the cover f is connected with finite monodromy). Put P = FT_ψ(𝓕₀[1]); then P|_{G_m} = 𝒢[1] (FF.2/fourier-deligne-transform, proper base change). Inversion (FF.2/fourier-deligne-inversion): RΓ_c(A¹, P) = FT(P)₀[−1] = (𝓕₀)₀(−1) in degree 0, and P₀ = RΓ_c(A¹, 𝓕₀)[2] in degree −1 since H²_c(A¹, 𝓕₀) is coinvariants, zero. The triangle RΓ_c(G_m, 𝒢[1]) → RΓ_c(A¹, P) → P₀ forces H²_c(G_m, 𝒢) = 0. This repair of the original-source gap (the citation of Katz 8.2.5(2)) is the review's (PAPER-BROWNING-SAWIN-20, item fourierinput).

Acceptance: D = 1, f = a: for h ≠ 0, H*_c(A¹, L_ψ(ha)) = 0, so all the cohomology vanishes, matching Σ_{h∈F^×} Σ_{a∈F} ψ(ha) = 0. The dimension count dim H² = #roots − 1 of the review agrees with the excision sequence.

Rests on: nodes `fourier-deligne-transform`, `fourier-deligne-inversion`, `lisse-sheaf-extremal-cohomology-on-curve`, `character-sheaf-cohomology-vanishes`; stages `SchemeAndStackFoundations:SF.2`.

Sources: Browning–Sawin, proof of Lemma 3.7, p. 917 (arXiv v3 p. 23).

**Theorem `lang-weil-estimate`** (planet: *Lang–Weil estimate*) — Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)}). Let V be a separated F-scheme of finite type, geometrically irreducible of dimension e. Then for every r ≥ 1, |#V(F_{q^r}) − q^{re}| ≤ C_V q^{r(e−1/2)}, where C_V := Σ_{i<2e} dim H^i_c(V_F̄, ℚ_ℓ) depends only on V_F̄ (for e = 0, V is a point and #V(F_{q^r}) = 1).

Hypotheses and conventions: V geometrically irreducible (not merely irreducible); ℓ ≠ p. The constant depends on V; the uniform version is FF.2/uniform-lang-weil-estimate.

Proof: Trace formula with constant coefficients: #V(F_{q^r}) = Σ_i (−1)^i Tr(F^{*r} | H^i_c(V_F̄, ℚ_ℓ)), the H^i_c finite-dimensional and zero for i > 2e (requested from SchemeAndStackFoundations:SF.2); #V(F_{q^r}) is independent of the chosen extension of degree r (WeilConjectures:WC.0). H^{2e}_c(V_F̄, ℚ_ℓ) ≅ ℚ_ℓ(−e) for V_F̄ irreducible of dimension e: remove a closed subset of smaller dimension to reach a smooth dense open U, H^{2e}_c(U) ≅ H^{2e}_c(V), and H^{2e}_c(U) = ℚ_ℓ(−e) by the trace isomorphism (Sommes trig. 1.18 d); requested from EtaleDualityAndPerverseSheaves:EDC.2). Frobenius acts by q^e. For i < 2e every eigenvalue on H^i_c has absolute value ≤ q^{i/2} ≤ q^{(2e−1)/2} (Weil II 3.3.4, requested from DeligneWeightsAndPurity:DWP.7). Hence |#V(F_{q^r}) − q^{re}| ≤ Σ_{i<2e} h^i_c q^{r(2e−1)/2}.

Acceptance: V = A^e: #V(F_{q^r}) = q^{re} exactly (C = 0). V = a smooth projective curve of genus g: C_V = 2g + 1 (H⁰ and H¹), consistent with |N_r − q^r − 1| ≤ 2g q^{r/2}. V = two conjugate lines over F_{q²} viewed over F_q (irreducible, not geometrically irreducible): #V(F_q) = 1 while q^1 is predicted — geometric irreducibility is needed.

Rests on: stages `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`, `WeilConjectures:WC.0`.

Sources: Browning–Sawin, proof of Lemma 5.6, p. 932 (arXiv v3 p. 36); Ghorpade–Lachaud, section 11, Proposition 11.5 and its proof, p. 35.

**Theorem `uniform-lang-weil-estimate`** — Uniform Lang–Weil: |#V(F) − π_n| ≤ (d − 1)(d − 2)q^{n−1/2} + C₊(V)q^{n−1}. Let V ⊆ P^N_F be a closed geometrically irreducible subvariety of dimension n and degree d, and π_n := #P^n(F). Then |#V(F) − π_n| ≤ (d − 1)(d − 2) q^{n−1/2} + C₊(V) q^{n−1}, where C₊(V) depends only on V_F̄ and, when V is cut out by m equations of degree ≤ δ, C₊(V) ≤ 9·2^m·(mδ + 3)^{N+1}; for affine V ⊆ A^N of dimension n and degree d, |#V(F) − q^n| ≤ (d − 1)(d − 2)q^{n−1/2} + C q^{n−1} with C bounded in terms of (m, N, δ). This is Lang–Weil's Theorem 1 with an explicit constant (Ghorpade–Lachaud Theorem 11.1, Remark 11.3).

Hypotheses and conventions: V geometrically irreducible, projective (resp. affine) of dimension n and degree d.

Proof: Trace formula and weights as in FF.2/lang-weil-estimate: the H^{2n} term gives q^n, and the weight-(2n − 1) part of H^{2n−1}_c has dimension b₊_{2n−1} = 2 dim Alb_w(V) ≤ 2g(Ỹ) ≤ (d − 1)(d − 2) for a general linear curve section Y with normalisation Ỹ (Ghorpade–Lachaud Theorem 10.7 and Proposition 9.4(iii); the genus bound of plane curves of degree d). All other contributions are bounded by the sum of Betti numbers, controlled by Katz's bound on sums of Betti numbers in terms of (m, N, δ) (Ghorpade–Lachaud [24]). Inputs not supplied by any atlas stage: Katz's Betti-number bound, the Albanese–Weil comparison of b_{2n−1}, and the geometric-genus bound for singular plane sections (recorded as a gap).

Acceptance: V a plane curve of degree d: |#V(F) − (q + 1)| ≤ (d − 1)(d − 2)√q + C, the Weil bound with 2g ≤ (d − 1)(d − 2). d = 1 (a linear subspace): the error term q^{n−1/2} vanishes.

Rests on: nodes `lang-weil-estimate`.

Sources: Ghorpade–Lachaud, section 11, Theorem 11.1, p. 35.

**Theorem `dimension-from-point-counts`** — All-extension point bounds detect dimension (Browning–Sawin Lemma 5.6). Let V be a separated F-scheme of finite type. If there is a constant C with #V(F_{q^r}) ≤ C q^{rD} for every r ≥ 1, then dim V ≤ D. A bound over F alone is insufficient.

Hypotheses and conventions: The bound for all r ≥ 1 with one constant C.

Proof: Let W be a geometrically irreducible component of V_F̄ of dimension e = dim V; it is defined over F_{q^{r₀}} for some r₀ (requested from SchemeAndStackFoundations:SF.0: finitely many geometric irreducible components, each defined over a finite extension). W′ := W minus the other components is a dense open of W, geometrically irreducible of dimension e, defined over F_{q^{r₀}}. FF.2/lang-weil-estimate over F_{q^{r₀}}: #W′(F_{q^{r₀r}}) ≥ q^{r₀re} − C_{W′}q^{r₀r(e−1/2)}, and #V(F_{q^{r₀r}}) ≥ #W′(F_{q^{r₀r}}); letting r → ∞ in q^{r₀re}(1 − o(1)) ≤ C q^{r₀rD} gives e ≤ D.

Acceptance: V = A¹ ⊔ (a point): C = 2, D = 1 works and dim V = 1. V = Spec F_{q²} over F_q: #V(F_q) = 0 but #V(F_{q²}) = 2; the all-r hypothesis is what sees dimension 0.

Rests on: nodes `lang-weil-estimate`; stages `SchemeAndStackFoundations:SF.0`.

Sources: Browning–Sawin, Lemma 5.6, p. 932 (arXiv v3 p. 36).

**Theorem `geometric-chebotarev`** — Chebotarev density for finite étale Galois covers of varieties over F (Ekedahl's form). Let π : Y₀ → X₀ be a finite étale Galois cover of separated F-schemes of finite type with group G acting by F-automorphisms of Y₀ over X₀, Y₀ geometrically irreducible of dimension r, and C ⊆ G a union of conjugacy classes. For x ∈ X₀(F_{q^ν}) let Frob_x ⊆ G be its Frobenius conjugacy class. Then #{x ∈ X₀(F_{q^ν}) : Frob_x ⊆ C} = (|C|/|G|) q^{νr} + O_Y(q^{ν(r−1/2)}).

Hypotheses and conventions: Y₀ geometrically irreducible, so the geometric and arithmetic monodromy groups coincide (no constant-field coset condition).

Proof: For g ∈ G, the twist Y₀^{(g)} of Y₀ by g (Frobenius replaced by g⁻¹ ∘ F) is a variety over F with Y^{(g)} ⊗ F̄ ≅ Y ⊗ F̄ (Galois descent for quasi-projective varieties; requested from SchemeAndStackFoundations:SF.1), geometrically irreducible of dimension r. #{y ∈ Y(F̄) : F^ν(y) = g y} = #Y^{(g)}(F_{q^ν}) = q^{νr} + O(q^{ν(r−1/2)}) (FF.2/lang-weil-estimate). Counting fibres: an x with Frob_x = class(g) has exactly |C_G(g)| points y above it with F^ν(y) = g y; summing over g ∈ C gives the claim ('untwisting').

Acceptance: G trivial: the Lang–Weil estimate itself. X₀ = G_m, Y₀ = G_m with y ↦ y^d (d | q − 1), G = μ_d: #{x : x is a d-th power} = q/d + O(1).

Rests on: nodes `lang-weil-estimate`; stages `SchemeAndStackFoundations:SF.1`.

Sources: Tomašić, Introduction, pp. 1-2.

### Dependencies

- Inside the roadmap: from `FF.1`, the canonical additive character, the trivial-character conventions and the Hasse–Davenport relation (`FF.1/canonical-additive-character`, `FF.1/trivial-character-conventions`, `FF.1/hasse-davenport-lifting`); from `FF.0`, extensions of finite fields with their traces and norms, through Mathlib. `FF.2` supplies no factorisation input to `FF.3` (RT-AREA-finitefields/1 asks that `FF.3` not depend on `FF.2`). The general estimate handoff formerly also claimed by `FF.5` is this layer's (RS-03).
- Consumers: `ExponentialSumsAndCircleMethod:ES.0` (complete sums modulo a prime and over extensions, Kloosterman sums), the Browning–Sawin geometric circle method (`L_ψ`, vanishing by translation, the Fourier–Deligne transform and its Fourier input, Lang–Weil, dimension from point counts), `AdditiveCombinatorics` (Weil's additive bound), and every roadmap quoting a Weil or Deligne bound.
- Requests to other roadmaps (each a `requests` entry of the packet):
  - `WeilConjectures:WC.3`: The Riemann hypothesis for curves in its all-conjugates form: for a smooth projective geometrically connected curve C over F_q of genus g (in particular the curve attached, through the function-field/curve dictionary, to a one-variable function field over F_q with exact constant field F_q), Z(C, T) = P₁(T)/((1 − T)(1 …
  - `WeilConjectures:WC.5:power-sum-converse`: The finite-spectrum lemma: for finitely many complex numbers ω₁, …, ω_δ (with multiplicity) and constants A ≥ 0, B > 0, if |ω₁^ν + ⋯ + ω_δ^ν| ≤ A·B^ν for every integer ν ≥ 1, then |ω_j| ≤ B for every j (Kowalski, Lemma 4.15). No hypothesis of purity or rationality.
  - `DeligneWeightsAndPurity:DWP.7`: Weil II Corollaires 3.3.4-3.3.6 for sheaves: for X₀ separated of finite type over F_q and a constructible E_λ-sheaf F₀ that is ι-mixed of weights ≤ w (for instance a lisse sheaf whose Frobenius traces at all closed points are roots of unity, hence punctually pure of weight 0, and the constant sheaf ℚ_ℓ), every …
  - `DeligneWeightsAndPurity:DWP.6`: Weil II Théorème 3.2.3: for C₀ a smooth projective curve over F_q, j : U₀ → C₀ a dense open and F₀ a lisse sheaf on U₀ punctually ι-pure of weight β, every eigenvalue of Frobenius on H¹(C_F̄, j_*F) is ι-pure of weight β + 1; used with β = 0 for the rank-one Artin–Schreier sheaves L(ψf) of a rational function f.
  - `DeligneWeightsAndPurity:DWP.0`: q-Weil numbers of weight w: algebraic numbers all of whose complex conjugates have absolute value q^{w/2}; Galois conjugates of q-Weil numbers are q-Weil numbers of the same weight; the reciprocal roots of a polynomial in ℤ[T] satisfying the Riemann-hypothesis bound for every embedding are q-Weil numbers.
  - `SchemeAndStackFoundations:SF.2`: The Grothendieck–Lefschetz trace formula for E_λ-sheaves (Sommes trig. (1.1.1)), integrating the CohomologicalPointCounting TraceFormula supplier: for X₀ separated of finite type over F_q and a constructible E_λ-sheaf F₀, the H^i_c(X_F̄, F) are finite-dimensional, vanish for i outside [0, 2 dim X₀], and for every ν ≥ …
  - `SchemeAndStackFoundations:SF.2`: The dictionary between lisse E_λ-sheaves on a connected X₀ and continuous representations of π₁(X₀, x̄) on finite-dimensional E_λ-spaces (Frobenius at a closed point = the Frobenius class), and the push-out ρ(T) of a torsor T under a finite abelian group A along a character ρ : A → E_λ^× as a rank-one lisse sheaf with …
  - `SchemeAndStackFoundations:SF.2`: For Rf_! with E_λ-coefficients over F_q or F̄_q: proper base change, the projection formula, the Künneth formula (Sommes trig. (2.4.1)*), H*_c(A¹_F̄, E) = E(−1)[−2], constancy on a connected base of R pr_{1!} pr₂^*F (Sommes trig. Lemme 2.8), Artin vanishing H^i(X, F) = 0 for i > dim X on affine X, and local constancy …
  - `EtaleDualityAndPerverseSheaves:EDC.2`: Poincaré duality for X₀ smooth separated of pure dimension n over F_q and F lisse: H^i_c(X_F̄, F) × H^{2n−i}(X_F̄, F^∨(n)) → E_λ perfect and Frobenius-equivariant; hence H^{2n}_c(X_F̄, F) ≅ (F_x̄)_{π₁(X_F̄)}(−n) for X connected (coinvariants, Sommes trig. 1.18 d)), H^{2n}_c(V_F̄, ℚ_ℓ) ≅ ℚ_ℓ(−n) for V geometrically …
  - `EtaleDualityAndPerverseSheaves:EDC.2`: The Grothendieck–Ogg–Shafarevich formula: for X̄ a smooth projective connected curve of genus g over an algebraically closed field of characteristic p ≠ ℓ, X = X̄ ∖ S with S finite, and F a lisse E_λ-sheaf on X, χ_c(X, F) = rk(F)·(2 − 2g − #S) − Σ_{s∈S} Sw_s(F) (Sommes trig. (3.2.1), citing Raynaud, Séminaire Bourbaki …
  - `ArithmeticGaloisRepresentations:R01.3`: Swan conductors in equal characteristic: for a complete discretely valued field K of characteristic p with algebraically closed residue field (e.g. F̄_q((t))) and a continuous E_λ-representation V of Gal(K^sep/K), Sw(V) = Σ_λ λ·dim V(λ) over the upper-numbering breaks, an integer, additive in short exact sequences and …
  - `WeilConjectures:WC.0`: For X₀ separated of finite type over F_q and a finite extension L/F_q, #X₀(L) is finite and depends only on [L:F_q] (canonical translation between point sets over isomorphic extensions).
  - `SchemeAndStackFoundations:SF.0`: For V separated of finite type over F_q: V_F̄ has finitely many irreducible components; each is the base change of a geometrically irreducible closed subscheme of V ⊗ F_{q^{r₀}} for some r₀ ≥ 1; dim V is the maximum of their dimensions; removing the other components leaves a dense open of each component.
  - `SchemeAndStackFoundations:SF.1`: Galois twisting over finite fields: for a quasi-projective Y₀ over F_q with a finite group G of F_q-automorphisms and g ∈ G, a variety Y₀^{(g)} over F_q and an isomorphism Y^{(g)} ⊗ F̄ ≅ Y ⊗ F̄ carrying the Frobenius of Y^{(g)} to g⁻¹ ∘ F (effective descent along F̄_q/F_q).
  - `FunctionFieldArithmetic:FA.5`: For a one-variable function field E/F_q with exact constant field F_q and genus g: Z_E(T) := Π_P (1 − T^{deg P})^{−1} = exp(Σ_ν N_ν T^ν/ν) with N_ν the number of degree-one places of the constant field extension E·F_{q^ν}, and Z_E(T) = L_E(T)/((1 − T)(1 − qT)) with L_E ∈ ℤ[T] of degree exactly 2g and L_E(0) = 1 …
  - Tau Ceti `AlgebraicCurves` layer 10: Artin–Schreier covers y^p − y = u and their elementary abelian generalisation y^q − y = u (Stichtenoth 3.7.8, 3.7.10), and Kummer covers y^n = u (3.7.3), with the stated hypotheses: exact constant field, ramification indices, different exponents (p − 1)(m_P + 1) (resp. n/r_P − 1) and the closed genus formulas; applied …
  - Tau Ceti `AlgebraicCurves` layer 8: Constant field extensions: for E/F_q with exact constant field, E·F_{q^ν} has exact constant field F_{q^ν} and the same genus, and places of degree one stay of degree one; totally ramified places of degree one over F_q(X) stay so.
  - Tau Ceti `AlgebraicCurves` layer 2: Affine models: for a regular affine model F[X, Y]/(P(Y) − g(X)) (P monic in Y), this ring is the integral closure of F[X] in the function field, and its maximal ideals with residue field F correspond bijectively to the places of degree one over finite points of the X-line.
  - Tau Ceti `AlgebraicCurves` layer 12: The dictionary between one-variable function fields over F_q with exact constant field and smooth projective geometrically connected curves over F_q, matching degree-one places with rational points and constant field extensions with base change, so that WeilConjectures:WC.3 applies to the function fields E_f and E_g.
  - Tau Ceti `LocalFieldsRamification` layer 3: The upper-numbering ramification filtration of a finite Galois extension of complete discretely valued fields, and the equality of the lower and upper break for a cyclic extension of degree p (used for Artin–Schreier extensions of F̄_q((t))).
- Libraries: Mathlib's character, Gauss-sum, trace/norm, resultant, power-series, `AdjoinRoot`, `RatFunc` and absolute-Galois-group APIs; Tau Ceti's column orthogonality of characters of finite abelian groups.

### Acceptance tests of the layer

- Additive: over `F_5`, `|Σ ψ(x²)| = √5` (equality in `(d − 1)√q`); for `d = 1` the sum is `0`; `y² + y = x³` over
  `F_2` has two affine points and `L(X³, ψ; T) = 1 + 2T²`, of degree `d − 1 = 2` with roots of absolute value `√2`.
- Degenerate additive: over `F_9`, `f = X³ − X` gives the sum `9`, beyond `(3 − 1)·3`; `L(X^p − X, ψ; T) = 1/(1 − qT)` is
  not a polynomial although `deg = p`; `(X^p)* = X`, and in characteristic `2` the phase `X² + X` reduces to `0`.
- Multiplicative: with Mathlib's trivial character `S̃_F(X, 1) = q − 1`, not `q`; for `χ` of order `e ≥ 2`,
  `Z(X^e, χ; T) = (1 − T)/(1 − qT)`; `X²` is not degenerate for a cubic character, and `c·h^e` with `c` a non-`e`-th
  power is; `y² = x³ + 1` over `F_5` has five affine points.
- Kloosterman: over `F_3`, `K(1, 1) = −1` and `L = 1 + K·T + qT² = 1 − T + 3T²`, whose reciprocal roots have absolute
  value `√3`; `K(a, 0) = −1` for `a ≠ 0`; `K(0, 0) = q − 1`.
- Stepanov: `deg(Y²) = 6` on `Y² = X³` (the pole degree, not the `Y`-degree); `Y² − X²` is not a domain; the printed
  dimension bound of Kowalski's Lemma 5.7 fails at `q = 5`, `d = 2`, `k = 3` (E301).
- Sheaves: `L_ψ(h^q − h)` is trivial and `L_ψ(X)` is not; a nontrivial `L_ψ` needs coefficients containing `μ_p`
  (no nontrivial additive character of `ZMod 3` with values in `ℚ`); the trace of `L_ψ(X^q − X)` is `1` although the
  phase is non-constant; Deligne's main term for the constant sheaf is `q^ν`, not `0`.
- Fourier–Deligne: the transform of the constant sheaf has trace `−q·δ₀`, of `δ₀` the constant `−1`; the sign is
  that of the shift `[1]`.
- Several variables: for `Q = x₁^d` in two variables (singular leading form) the sum is `q·Σ_x ψ(x^d)`, of size
  `q^{3/2}`, so the smoothness hypothesis of Weil I Théorème 8.4 is needed; for `P = Q^p − Q` the sum is `q^n`, so the
  exclusion in [Sommes trig.] Proposition 3.8 is needed; `Q = Σ x_i^d` gives the `n`-th power of a one-variable sum.

### Mistakes in the sources

- `E301` (Kowalski, Chapter 5, Lemma 5.7(2), printed p. 70 (version of 14 September 2021); misprint). Printed: “k + 1 − (d − 1)(deg(g) − 1) ⩽ dim H(k) ⩽ k + 1”. Correct reading: k + 1 − (q − 1)(d − 1) ⩽ dim H(k) ⩽ k + 1 (here deg(g) = d and the curve is y^q − y = g(x); the bound of Lemma 4.24 transported by the dictionary (d, deg g) ↔ (q, d) that the same page states). Affects nothing; not previously recorded.
- `E302` (Kowalski, Chapter 3, Theorem 3.1, printed p. 31, with Chapter 4, section 4.2 (Proposition 4.14(2), Theorem 4.17 and the paragraph after it), printed pp. 50-52; gap). Printed: “Then, provided there is no polynomial h ∈ ¯Fq[X] such that g = hd, we have (3.1) |Σ x∈Fq χ(g(x))| ⩽ (m − 1)√q.”. Correct reading: The notes prove (3.1) only when gcd(deg g, d) = 1 (and, by Remark 4.23, for non-squarefree g of such degree): Theorem 4.17 assumes (deg(g), d) = 1. The general case needs another argument — Stepanov's method for arbitrary absolutely irreducible y^d = g(x), or the cohomological route taken by FF.2/weil-bound-multiplicative. Affects the proof; not previously recorded.
- `E303` (Kowalski, Chapter 5, Lemma 5.11 and the proof of Proposition 5.9, printed pp. 72-76; gap). Printed: “Let Fq be a finite field, ψ a non-trivial character of Fq, g ∈ Fq[X] a non-constant polynomial in Fq[X] of degree d, with g(0) = 0.”. Correct reading: Before applying Lemma 5.11 in the proof of Proposition 5.9, reduce to g(0) = 0: S_ν(g, ψ) = ψ(ν·g(0))·S_ν(g − g(0), ψ), so Z(g, ψ; T) = Z(g − g(0), ψ; ψ(g(0))T), which is a polynomial of the same degree. Affects the proof; not previously recorded.
- `E304` (Kowalski, Chapter 4, end of section 4.3, printed p. 63; misprint). Printed: “Hence, for q > q0 = max((γ + 1)4, k2 0), we obtain”. Correct reading: q0 = max((γ + 1)^4, (2k0)^2), as the preceding sentence requires. Affects nothing; not previously recorded.
- `E305` (Kowalski, Chapter 5, display (5.2) after Lemma 5.3, printed p. 68; misprint). Printed: “(5.2) |{(x, y) ∈ Fq2ν × Fq2ν | yq − y = g(x)}| ⩽ q2ν + Dqν where C depends only on d and q.”. Correct reading: 'where D depends only on d and q' (or C in both places, as in Theorem 5.2). Affects nothing; not previously recorded.
- `E306` (Deligne, SGA 4½, [Sommes trig.] Exemple 3.5, volume p. 190 (read from the page image of the IAS scan of LNM 569); misprint). Printed: “on a ψ(a^p−a) = 0 . ... Cette somme est nulle pour f de la forme g^p−g .”. Correct reading: ψ(a^p − a) = 1, and for f = g^p − g the sum S'_f equals the number of rational points where f is finite: the sum is trivial (no cancellation), not zero. Affects nothing; not previously recorded.
- `E307` (Fouvry–Kowalski–Michel–Sawin, section 4.2.3, p. 12 (arXiv v3); error). Printed: “If f ∈ Fq(X) − Fq, the pull-back sheaf Lψ(f) is geometrically irreducible and has conductor 1 + number of poles of f + sum of multiplicities of the poles of f.”. Correct reading: C(L_ψ(f)) = 1 + #{x : v*_x(f) > 0} + Σ_x v*_x(f), with v* the modified pole order of Sommes trig. Exemple 3.5; this is at most 1 + #poles + Σ multiplicities, with equality when every pole order is prime to p. If f = g^p − g + c then L_ψ(f) is geometrically trivial of conductor 1. Affects a stated result; not previously recorded.
- `E308` (Fouvry–Kowalski–Michel–Sawin, section 4.2.4, p. 12 (arXiv v3), the displayed definitions of Kl_{k,ψ}(x; q) and Kl_{k,ψ}(x; q^n); misprint). Printed: “Klk,ψ(x; q) = ⋆k timesψ(x) = 1/q(k−1)2 Σ x1,...,xk∈F×q, x1.....xk=x ψ(x1 + . . . + xk)”. Correct reading: the normalising factor is q^{−(k−1)/2} (and q^{−n(k−1)/2} over F_{q^n}), as in section 2.2 and as forced by k − 1 convolutions each normalised by q^{−1/2}. Affects nothing; not previously recorded.
- `E309` (Browning–Sawin, proof of Lemma 3.2, p. 910 (arXiv v3 p. 17); misprint). Printed: “Hi c(X, ϕ∗Lψ) = Hi−2 c (X × A1, ϕ∗Lψ ⊠ Qℓ)”. Correct reading: H^i_c(X, ϕ^*L_ψ) = H^{i+2}_c(X × A¹, ϕ^*L_ψ ⊠ ℚ_ℓ)(1). Affects nothing; known: PAPER-BROWNING-SAWIN-20/E11 (the paper extraction's finding, confirmed by REV-PAPER-BROWNING-SAWIN-20); no published correction.

### Remaining work

Coverage is `partial`. The packet's `remaining` list:
- Grothendieck–Ogg–Shafarevich formula: no atlas owner (gap and restructure proposal); FF.2/h1c-conductor-bound, FF.2/artin-schreier-sum-on-curve-bound and FF.2/deligne-cohomology-of-polynomial-sheaf rest on the EDC.2 request for it. The classical one-variable bounds (additive, multiplicative, mixed, Kloosterman) do not.
- Weil I Lemma 8.5: the relative compactification by Zariski's procedure and the local constancy of R^i f_! over the space of polynomials with smooth leading form (Weil I 8.6-8.10) have no supplier (gap); decompose them, or find and decompose an alternative proof of 8.5(i)-(ii), before FF.2/deligne-n-variable-bound can close.
- Uniform Lang–Weil (FF.2/uniform-lang-weil-estimate): read Katz, 'Sums of Betti numbers in arbitrary characteristic', and Ghorpade–Lachaud sections 8-10, and decompose their Theorem 10.7 and the Betti-number bound or obtain an owner for them (gap).
- Geometric Chebotarev (FF.2/geometric-chebotarev): Ekedahl's Lemma 1.2 (1990, not public) was not read; add the variant for Y₀ geometrically connected only over a constant extension, where Frobenius classes lie in a coset of the geometric monodromy group (FA.5's constant-field convention), as RT-AREA-etale/7 asks.
- Sommes trig. sections 4-7 were not read in this pass. Section 7 (hyper-Kloosterman sums Kl_n: the Kloosterman sheaf of rank n on G_m, pure of weight n − 1, tame at 0 with Swan conductor 1 at ∞, and Deligne's bound |Kl_n(a; q)| ≤ n q^{(n−1)/2}; FKMS Theorem 4.4) is a Deligne bound in this stage's scope and is not yet planned. Section 4 (Gauss sums over étale algebras, the sign e(k), Hasse–Davenport as a twisted form) is FF.1's except for its cohomological realisation, of which FF.2/gauss-sum-frobenius-eigenvalue is the first node.
- FKMS section 5 (quasi-orthogonality: correlation sums (1/q) Σ K_F K̄_G via F ⊗ D(G)) and the automorphism-group correlations of section 7 are not planned; they are direct corollaries of FF.2/deligne-bound-for-trace-functions and should be added here (with ExponentialSumsAndCircleMethod:ES.0 as consumer) or requested by ES.0.
- The Lean prototype states the ℓ-adic objects on open subsets of the line through their Galois characters (FKMS Definition 3.1); the cohomological statements (H^i_c, Frobenius eigenvalues, Fourier–Deligne at sheaf level) are omitted there because the carriers are supplied by SchemeAndStackFoundations:SF.2 and EtaleDualityAndPerverseSheaves:EDC.0 and are absent from Mathlib.

Gaps (no supplier in the atlas):
- No atlas stage owns the Grothendieck–Ogg–Shafarevich Euler characteristic formula.
- Weil I Lemma 8.5 rests on a relative compactification by Zariski's resolution procedure and on local constancy in the family of polynomials with smooth leading form.
- The uniform Lang–Weil constant needs Katz's bound on sums of Betti numbers and the Albanese description of b_{2n−1}.

Restructuring proposals:
- Rescope `EtaleDualityAndPerverseSheaves`: add a sub-stage `EDC.2:euler-characteristic` (inputs `EDC.2` and the equal-characteristic Swan conductor of `ArithmeticGaloisRepresentations:R01.3`) for the Grothendieck–Ogg–Shafarevich formula `χ_c(X, F) = rk F · χ_c(X) − Σ_s Sw_s(F)`, linked to `FF.2`; `FF.2` keeps the local computation `Sw_x(L_ψ(f)) = v*_x(f)`.
- Split `FF.2` into four sub-layers (parent stage unchanged until accepted): `FF.2a` one-variable L-functions, Stepanov's method and the degenerate cases (sections 1–6 above); `FF.2b` curves (section 7); `FF.2c` trace functions and Deligne bounds (sections 8–11); `FF.2d` the Fourier–Deligne transform and Lang–Weil (section 12); with `FF.2a → FF.2b` and `FF.2a → FF.2c → FF.2d`.

---

## FF.3 Factorization and point counting

This layer builds the certified finite-field algorithms: factorization of polynomials over a finite field
(square-free decomposition, distinct-degree factorization, the Cantor–Zassenhaus and Berlekamp algorithms,
irreducibility tests and the construction of irreducible polynomials), Hensel lifting of coprime
factorizations, the count of irreducible polynomials, and certified point counting on elliptic and
hyperelliptic curves, up to Schoof's algorithm. Each algorithm comes with three separate contracts:
**correctness** (reconstruction — the output multiplies to the input — and irreducibility of every factor,
with a checkable witness), **termination and probability of success** (for randomized algorithms, in
Mathlib's discrete probability monad `PMF`), and **cost** (in the algebraic cost model of
ComputationalNumberTheory CN.0). Correctness never depends on the cost model, and a probabilistic running-time
bound is never used as a correctness statement.

The elliptic trace convention, the Hasse bound and the Frobenius relation are imported from Tau Ceti's
EllipticCurves layer 3, and the structure of `E[ℓ]` from its layer 2; FF.3 does not reprove them. The
Rabin irreducibility criterion and the format and checker of Rabin certificates are FF.0's
(`FF.0/rabin-irreducibility-criterion`, `FF.0/rabin-irreducibility-certificate`); FF.3 generates Rabin
certificates and builds factorization certificates on them. ComputationalNumberTheory CN.0 supplies the cost
model and the executable presentations; CN.1, CN.2 and CN.3 consume this layer's outputs.

### Conventions

- `F` is a finite field with `q = p^w` elements (`Field F`, `Fintype F`, `DecidableEq F`); polynomials are
  Mathlib's `F[X]`. "Monic irreducible" is Mathlib's "normalized irreducible", and the factorization of a
  nonzero `f` is `UniqueFactorizationMonoid.normalizedFactors f` (a multiset, multiplicities included) with
  the leading coefficient.
- Algorithms are functions on Mathlib's `Polynomial F`. Their executable counterparts (dense coefficient
  lists over the FF.0 presentations of `𝔽_q`) and the refinement lemmas between the two are CN.0's.
- **Randomness model.** A randomized algorithm run for `n` rounds (or attempts) is a `PMF` on its possible
  states. One round of equal-degree splitting draws a uniform coefficient vector `v : Fin (deg f) → F`, that
  is a uniform `a ∈ F[X]/(f)`, and uses `a mod h` for every current factor `h`; by the Chinese remainder
  theorem these residues are independent and uniform, which is Shoup's model (§20.4.2). *Las Vegas
  correctness* is a statement about the support: every outcome that reports a result reports the right one.
  The *failure probability* after `n` rounds is the mass of the unfinished outcomes, and the *expected
  number of rounds* is `Σ_{n ≥ 0} P[unfinished after n rounds]`.
- **Cost model.** Costs count "operations in `F`" (Shoup, Chapter 20 introduction): `+`, `−`, `×`, inversion of
  a nonzero element, the equality test and drawing a uniform element of `F`, each of unit cost; expected costs
  of randomized algorithms follow Shoup §9.1; each operation in `𝔽_q` costs `O(len(q)²)` bit operations for
  the standard presentations. The model is CN.0's (requested); the cost nodes state bounds in it.
- **Trace convention.** The point count of a Weierstrass model `W` over `F` is Tau Ceti's
  `WeierstrassCurve.pointCount` — every affine solution of the equation, singular or not, plus the point at
  infinity — and `a_q = q + 1 − pointCount W` is Tau Ceti's `frobeniusTrace`. Here it is computed as
  `naivePointCount W`, equal to `pointCount W` by its defining equation `pointCount_def`.
- Point-counting algorithms work with models in Mathlib's normal form `IsCharNeTwoNF` (`a₁ = a₃ = 0`),
  `y² = f(x)` with `f = weierstrassCubic W = X³ + a₂X² + a₄X + a₆`, and `q` odd.

### Already in the libraries (cited, not rebuilt)

- Unique factorization in `F[X]` (Mathlib `UniqueFactorizationMonoid.normalizedFactors`,
  `prod_normalizedFactors`, `squarefree_iff_nodup_normalizedFactors`), square-freeness from coprimality
  with the derivative (`Polynomial.Separable.squarefree`), `expand`/`contract` and `p`-th roots over a
  perfect field (`Polynomial.expand_contract`, `polynomial_expand_eq`).
- The divisibility criterion behind distinct-degree factorization: for irreducible `f` over a finite field,
  `deg f ∣ n ↔ f ∣ X^(q^n) − X` (`Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`); separability of
  `X^q − X` (`galois_poly_separable`); the root test in degree ≤ 3
  (`Polynomial.irreducible_of_degree_le_three_of_not_isRoot`).
- Norms and traces of finite-field extensions (`FiniteField.unitsMap_norm_surjective`,
  `FiniteField.algebraMap_norm_eq_pow`, `Algebra.trace_surjective`), the Frobenius algebra endomorphism
  (`FiniteField.frobeniusAlgHom`), the quadratic character and Euler's criterion (`quadraticChar`,
  `quadraticChar_card_sqrts`, `FiniteField.isSquare_iff`).
- Hensel's lemma for simple roots (`hensels_lemma` over `ℤ_p`; the classes `HenselianRing`,
  `HenselianLocalRing`), Nakayama's lemma, adic completeness (`IsAdicComplete`, `IsPrecomplete.prec`,
  `IsAdicComplete.le_jacobson_bot`). The lifting of **coprime factorizations**, the form factoring algorithms
  use, is missing (Mathlib's `Henselian` file lists it as a TODO) and is built here.
- Tau Ceti: the multiset of factor degrees of an integer polynomial modulo `p` (`Polynomial.factorDegrees`,
  `factorDegrees_eq_singleton_iff`) with the worked checks of `X⁵ − X − 1` modulo 2 and 5; the point count
  and trace (`WeierstrassCurve.pointCount`, `frobeniusTrace`, `pointCount_eq_card_point`,
  `pointCount_eq_card_point_add_one_iff`); division polynomials and the torsion criterion
  (`zsmul_point_eq_smulEval`, `zsmul_eq_zero_of_evalEval_ψ_eq_zero`, `evalEval_ψ_eq_zero_of_zsmul_eq_zero`).
- Mathlib's discrete probability monad (`PMF.pure`, `PMF.bind`, `PMF.map`, `PMF.uniformOfFintype`,
  `PMF.toOuterMeasure`) and Chevalley–Warning (`char_dvd_card_solutions_of_sum_lt`).

### 3A. The number of irreducible polynomials

Shoup §19.2 and the two counting results Bary-Soroker–Koukoulopoulos–Kozma use (their Proposition 8.1, item 73 of the paper's extraction, and the count with prescribed constant coefficient in the proof of Lemma 3.2, item 130). The paper cites Rosen's book, which is not public; the proofs here derive both from Gauss's formula and from the norm map of `𝔽_{q^n}/𝔽_q`, with explicit constants.

- **The finite set of monic polynomials of a given degree** (construction, `monicOfDegree`; node `FF.2/monic-polynomials-of-degree`).
  For a finite field F with q elements and n ∈ ℕ, monicOfDegree F n ⊆ F[X] is the finite set of monic polynomials of degree exactly n, constructed as the image of the coefficient vectors v : Fin n → F under v ↦ X^n + Σ_{i<n} v_i X^i (Mathlib's degreeLTEquiv identifies vectors with polynomials of degree < n). It has q^n elements; for n = 0 it is {1}.
  *API:*
  - `mem_monicOfDegree` (characterisation): f ∈ monicOfDegree F n ↔ f.Monic ∧ f.natDegree = n.
  - `card_monicOfDegree` (other): (monicOfDegree F n).card = q ^ n.
  - `monicOfDegree_zero` (simp): monicOfDegree F 0 = {1}.
  *Unit tests:*
  - `monicOfDegree_one_zmod_two` (computation): monicOfDegree (ZMod 2) 1 = {X, X + 1}.
  - `card_monicOfDegree_zmod_three_two` (computation): (monicOfDegree (ZMod 3) 2).card = 9.
  - `C_two_mul_X_not_mem_monicOfDegree` (non-example): 2X ∉ monicOfDegree (ZMod 3) 1: it has degree 1 but is not monic.
- **The monic irreducible polynomials of a given degree** (construction, `monicIrreducibles`; node `FF.3/monic-irreducible-polynomials-of-degree`).
  monicIrreducibles F n is the finite set of monic irreducible polynomials of degree n over the finite field F: the elements of monicOfDegree F n that are irreducible. It is empty for n = 0, and its elements are exactly the irreducible f with normalize f = f and natDegree f = n (Mathlib's normalized irreducibles).
  *API:*
  - `mem_monicIrreducibles` (characterisation): f ∈ monicIrreducibles F n ↔ f.Monic ∧ Irreducible f ∧ f.natDegree = n.
  - `mem_monicIrreducibles_iff_normalize` (compatibility): f ∈ monicIrreducibles F n ↔ Irreducible f ∧ normalize f = f ∧ f.natDegree = n: agreement with Mathlib's normalized factors.
  - `monicIrreducibles_zero` (simp): monicIrreducibles F 0 = ∅.
  *Unit tests:*
  - `monicIrreducibles_zmod_two_two` (computation): monicIrreducibles (ZMod 2) 2 = {X² + X + 1}.
  - `monicIrreducibles_zmod_two_one` (computation): monicIrreducibles (ZMod 2) 1 = {X, X + 1}: every monic linear polynomial is irreducible.
  - `X_sq_add_one_not_mem_monicIrreducibles` (non-example): X² + 1 ∉ monicIrreducibles (ZMod 2) 2, since X² + 1 = (X + 1)² over 𝔽₂.
- **The number Π_F(n) of monic irreducible polynomials of degree n** (definition, `irreducibleCount`; node `FF.3/count-of-irreducible-polynomials`).
  For a finite field F with q elements and n ∈ ℕ, irreducibleCount F n = Π_F(n) is the number of monic irreducible polynomials of degree n in F[X] (Shoup's Π_F(ℓ); for F = 𝔽_p it is Bary-Soroker–Koukoulopoulos–Kozma's π_p(k)). Its package is Gauss's formula Σ_{d|n} d Π_F(d) = q^n, the Möbius formula n Π_F(n) = Σ_{d|n} μ(d) q^{n/d}, and the bounds (q^n − 2q^{n/2})/n ≤ Π_F(n) ≤ q^n/n and q^n ≤ 2n Π_F(n) (n ≥ 1).
  *API:*
  - `irreducibleCount_eq_natCard` (compatibility): irreducibleCount F n = Nat.card {f : F[X] // f.Monic ∧ Irreducible f ∧ f.natDegree = n}.
  - `irreducibleCount_zero` (simp): irreducibleCount F 0 = 0.
  - `irreducibleCount_one` (simp): irreducibleCount F 1 = q.
  - `sum_divisors_mul_irreducibleCount` (relation): Gauss's formula: for n ≠ 0, Σ_{d ∈ n.divisors} d · irreducibleCount F d = q ^ n (node gauss-count-formula).
  - `mul_irreducibleCount_eq_sum_moebius` (relation): The Möbius formula (node moebius-formula-for-irreducible-count).
  - `mul_irreducibleCount_le` (other): n · Π_F(n) ≤ q^n (node irreducible-count-upper-bound).
  - `card_pow_le_mul_irreducibleCount_add` (other): q^n ≤ n Π_F(n) + 2 q^{⌊n/2⌋} for n ≠ 0 (node irreducible-count-lower-bound).
  - `prime_polynomial_theorem` (other): The BKK form (q^n − 2q^{n/2})/n ≤ Π_F(n) ≤ q^n/n (node prime-polynomial-theorem).
  *Unit tests:*
  - `irreducibleCount_zmod_two_four` (computation): irreducibleCount (ZMod 2) 4 = 3 (X⁴+X+1, X⁴+X³+1, X⁴+X³+X²+X+1).
  - `irreducibleCount_zmod_three_two` (computation): irreducibleCount (ZMod 3) 2 = 3.
  - `irreducibleCount_zmod_three_three` (computation): irreducibleCount (ZMod 3) 3 = 8.
  - `irreducibleCount_eq_card_normalizedFactors` (compatibility): For n ≠ 0, irreducibleCount F n equals the number of elements of degree n in Mathlib's normalizedFactors (X^(q^n) − X).
- **Counting the elements of an extension by their minimal polynomials** (lemma, `card_filter_minpoly_eq_sum`; node `FF.3/partition-by-minimal-polynomials`).
  Let E ⊇ F be finite fields with [E : F] = n and let C be any decidable condition on F[X]. Then #{α ∈ E : C(minpoly_F α)} = Σ_{d | n} d · #{f ∈ monicIrreducibles F d : C(f)}.
  *Hypotheses:* E a finite field extension of F with Module.finrank F E = n (so n ≥ 1); C : F[X] → Prop decidable.
  *Proof:* Every α ∈ E has minimal polynomial minpoly_F α monic irreducible of degree d = [F(α) : F], which divides n (Mathlib minpoly.irreducible, IntermediateField.adjoin.finrank, tower law). Conversely, a monic irreducible f of degree d | n divides X^(q^n) − X (Mathlib Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X), which splits in E with the q^n distinct roots given by the elements of E (Mathlib FiniteField.roots_X_pow_card_sub_X); hence f has exactly d distinct roots in E, each with minimal polynomial f. Group the elements of E by their minimal polynomial: the fibre over f has d elements, and C depends only on the fibre; sum over d | n.
- **Gauss's product formula for X^(q^n) − X** (theorem, `X_pow_card_pow_sub_X_eq_prod_monicIrreducibles`; node `FF.3/gauss-product-formula`; planet *Gauss's product formula*).
  For a finite field F with q elements and n ≥ 1, X^(q^n) − X = ∏_{d | n} ∏_{f ∈ monicIrreducibles F d} f in F[X].
  *Hypotheses:* F a finite field with q elements; n ≠ 0.
  *Proof:* X^(q^n) − X is monic and square-free: its derivative is −1 (Shoup Theorem 19.1; Mathlib galois_poly_separable gives separability, hence square-free by Polynomial.Separable.squarefree). A monic square-free polynomial is the product of its distinct normalized irreducible factors (Mathlib prod_normalizedFactors and squarefree_iff_nodup_normalizedFactors). A monic irreducible f divides X^(q^n) − X iff deg f | n (Mathlib Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X), so the normalized factors are exactly the elements of monicIrreducibles F d for d | n, each once.
- **Gauss's count q^n = Σ_{d|n} d Π_F(d)** (theorem, `sum_divisors_mul_irreducibleCount`; node `FF.3/gauss-count-formula`).
  For n ≥ 1, Σ_{d ∈ n.divisors} d · irreducibleCount F d = q^n.
  *Hypotheses:* F a finite field with q elements; n ≠ 0.
  *Proof:* Compare degrees on both sides of Gauss's product formula: deg(X^(q^n) − X) = q^n (Mathlib FiniteField.X_pow_card_pow_sub_X_natDegree_eq) and the right side has degree Σ_{d|n} d · #monicIrreducibles F d.
- **The Möbius formula for Π_F(n)** (theorem, `mul_irreducibleCount_eq_sum_moebius`; node `FF.3/moebius-formula-for-irreducible-count`).
  For n ≥ 1, n · Π_F(n) = Σ_{d | n} μ(d) q^{n/d} (as integers), with μ Mathlib's ArithmeticFunction.moebius.
  *Hypotheses:* F a finite field with q elements; n ≠ 0.
  *Proof:* Apply Möbius inversion (Mathlib ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq) to f(d) = d Π_F(d) and g(n) = q^n, using Gauss's count for every n > 0; rewrite the divisorsAntidiagonal sum as a sum over divisors.
- **The upper bound n Π_F(n) ≤ q^n** (theorem, `mul_irreducibleCount_le`; node `FF.3/irreducible-count-upper-bound`).
  For every n ∈ ℕ, n · Π_F(n) ≤ q^n. Equivalently Π_F(n)/q^n ≤ 1/n, which is Bary-Soroker–Koukoulopoulos–Kozma's Σ_{deg I = n} 1/‖I‖ ≤ 1/n.
  *Hypotheses:* F a finite field with q elements.
  *Proof:* For n = 0 both sides are trivial. For n ≥ 1 the term d = n of Gauss's count is n Π_F(n) and all terms are nonnegative.
- **The lower bound q^n ≤ n Π_F(n) + 2 q^{⌊n/2⌋}** (theorem, `card_pow_le_mul_irreducibleCount_add`; node `FF.3/irreducible-count-lower-bound`).
  For n ≥ 1, q^n ≤ n · Π_F(n) + 2 q^{⌊n/2⌋}. This is the integer form of the lower bound of Bary-Soroker–Koukoulopoulos–Kozma, Proposition 8.1.
  *Hypotheses:* F a finite field with q elements; n ≠ 0.
  *Proof:* By Gauss's count, n Π_F(n) = q^n − Σ_{d|n, d<n} d Π_F(d). Each proper divisor d of n satisfies d ≤ ⌊n/2⌋ and d Π_F(d) ≤ q^d (upper bound), so the subtracted sum is at most Σ_{d=1}^{⌊n/2⌋} q^d = q(q^{⌊n/2⌋} − 1)/(q − 1) < 2 q^{⌊n/2⌋} (q ≥ 2); this is Shoup's S(q, ℓ).
- **The prime polynomial theorem with explicit error** (theorem, `prime_polynomial_theorem`; node `FF.3/prime-polynomial-theorem`; planet *Prime polynomial theorem*).
  For n ≥ 1, (q^n − 2 q^{n/2})/n ≤ Π_F(n) ≤ q^n/n, the exponent n/2 being real. For F = 𝔽_p this is Proposition 8.1 of Bary-Soroker–Koukoulopoulos–Kozma (item 73 of its extraction).
  *Hypotheses:* F a finite field with q elements; n ≠ 0.
  *Proof:* Upper bound: divide the upper-bound node by n. Lower bound: from the integer lower bound and q^{⌊n/2⌋} ≤ q^{n/2} (q ≥ 1), divide by n.
- **Shoup's density bound q^n ≤ 2n Π_F(n)** (theorem, `card_pow_le_two_mul_mul_irreducibleCount`; node `FF.3/irreducible-density-lower-bound`).
  For n ≥ 1, q^n ≤ 2 n Π_F(n): a uniformly random monic polynomial of degree n is irreducible with probability at least 1/(2n).
  *Hypotheses:* F a finite field with q elements; n ≠ 0.
  *Proof:* It suffices that S(q, n) = Σ_{k=1}^{⌊n/2⌋} q^k ≤ q^n/2, because n Π_F(n) ≥ q^n − S(q, n) (the argument of the lower bound). For n ∈ {1, 2, 3} check directly (S = 0, q, q); for n ≥ 4, S(q, n) ≤ q^{n/2+1} ≤ q^{n−1} ≤ q^n/2.
- **The number of monic irreducibles with prescribed constant coefficient** (definition, `irreducibleCountWithConstantCoeff`; node `FF.3/irreducible-count-with-constant-coefficient`).
  For a finite field F, n ∈ ℕ and b ∈ F, irreducibleCountWithConstantCoeff F n b is the number of f ∈ monicIrreducibles F n with f(0) = b (for F = 𝔽_p and b ≠ 0, the count of I_p in Bary-Soroker–Koukoulopoulos–Kozma's proof of Lemma 3.2).
  *API:*
  - `sum_irreducibleCountWithConstantCoeff` (relation): Σ_{b ∈ F} irreducibleCountWithConstantCoeff F n b = irreducibleCount F n.
  - `irreducibleCountWithConstantCoeff_zero_right` (simp): irreducibleCountWithConstantCoeff F n 0 = if n = 1 then 1 else 0.
  - `irreducibleCountWithConstantCoeff_one` (simp): irreducibleCountWithConstantCoeff F 1 b = 1 for every b.
  *Unit tests:*
  - `irreducibleCountWithConstantCoeff_zmod_three_two` (computation): irreducibleCountWithConstantCoeff (ZMod 3) 2 2 = 2 (X² + X + 2 and X² + 2X + 2).
  - `irreducibleCountWithConstantCoeff_zmod_three_two_one` (computation): irreducibleCountWithConstantCoeff (ZMod 3) 2 1 = 1 (X² + 1).
  - `irreducibleCountWithConstantCoeff_zmod_two_three` (computation): irreducibleCountWithConstantCoeff (ZMod 2) 3 1 = 2 (X³ + X + 1 and X³ + X² + 1).
  - `irreducibleCountWithConstantCoeff_zero_two` (degenerate): irreducibleCountWithConstantCoeff (ZMod 5) 2 0 = 0.
- **The norm of an element from its minimal polynomial** (lemma, `norm_eq_neg_one_pow_mul_coeff_zero_minpoly_pow`; node `FF.3/norm-from-minimal-polynomial`).
  Let E ⊇ F be finite fields with [E : F] = n and α ∈ E with minimal polynomial P of degree d. Then N_{E/F}(α) = (−1)^n · P(0)^{n/d}.
  *Hypotheses:* E a finite field extension of F of degree n; α ∈ E.
  *Proof:* N_{E/F}(α) = N_{F(α)/F}(α)^{[E : F(α)]} (Mathlib Algebra.norm_eq_norm_adjoin), with [E : F(α)] = n/d (IntermediateField.adjoin.finrank and the tower law). N_{F(α)/F}(α) = (−1)^d P(0) (Mathlib Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly for the power basis of F(α)). Combine: ((−1)^d P(0))^{n/d} = (−1)^n P(0)^{n/d} since d · (n/d) = n.
- **The norm-fibre identity for constant coefficients** (theorem, `sum_divisors_mul_card_coeff_zero_pow_eq`; node `FF.3/constant-coefficient-norm-fibre-identity`).
  For n ≥ 1 and b ∈ F^×: Σ_{d | n} d · #{f ∈ monicIrreducibles F d : f(0)^{n/d} = b} = (q^n − 1)/(q − 1).
  *Hypotheses:* F a finite field with q elements; n ≠ 0; b ≠ 0.
  *Proof:* Let E be an extension of degree n (e.g. GaloisField). By the norm lemma, N(α) = (−1)^n b iff P(0)^{n/d} = b for P = minpoly α of degree d. By the partition lemma with C(f) = (f(0)^{n/deg f} = b), the left side is #{α ∈ E : N(α) = (−1)^n b}. The norm restricted to units is a surjective group homomorphism E^× → F^× (Mathlib FiniteField.unitsMap_norm_surjective); every fibre over a unit has |E^×|/|F^×| = (q^n − 1)/(q − 1) elements, and α = 0 has norm 0 ≠ (−1)^n b.
- **Two-sided bound for irreducibles with prescribed constant coefficient** (theorem, `mul_irreducibleCountWithConstantCoeff_bounds`; node `FF.3/constant-coefficient-count-bounds`).
  For n ≥ 1 and b ≠ 0: (q^n − 1)/(q − 1) − 2 q^{⌊n/2⌋} ≤ n · irreducibleCountWithConstantCoeff F n b ≤ (q^n − 1)/(q − 1).
  *Hypotheses:* F a finite field with q elements; n ≠ 0; b ≠ 0.
  *Proof:* The term d = n of the norm-fibre identity is n · irreducibleCountWithConstantCoeff F n b; the other terms are nonnegative (upper bound). The terms with d < n are at most d Π_F(d) ≤ q^d, and d ≤ ⌊n/2⌋; so they sum to less than 2 q^{⌊n/2⌋}, as in the lower bound for Π_F.
- **Irreducible polynomials with prescribed constant coefficient** (theorem, `abs_irreducibleCountWithConstantCoeff_sub_le`; node `FF.3/irreducible-polynomials-with-prescribed-constant-coefficient`).
  For n ≥ 1 and b ≠ 0, the number Π_F(n; b) of monic irreducible polynomials of degree n with constant coefficient b satisfies |n (q − 1) Π_F(n; b)/q^n − 1| ≤ 3 q^{1 − n/2}. Hence Π_F(n; b) = q^n/((q − 1) n) (1 + O(q^{1 − n/2})) with absolute implied constant 3, the statement Bary-Soroker–Koukoulopoulos–Kozma use in the proof of Lemma 3.2 (item 130 of the extraction), citing Rosen, Theorem 4.8.
  *Hypotheses:* F a finite field with q elements; n ≠ 0; b ≠ 0.
  *Proof:* From the two-sided bound: n(q − 1)Π_F(n; b) lies in [q^n − 1 − 2(q − 1) q^{⌊n/2⌋}, q^n − 1]. Divide by q^n: the relative error is at most (1 + 2(q − 1) q^{n/2})/q^n ≤ q^{−n} + 2 q^{1 − n/2} ≤ 3 q^{1 − n/2}.

### 3B. Square-free decomposition (Shoup §20.3)

The decomposition carries pairwise distinct multiplicities, which Algorithm SFD's output has and which makes it unique up to order.

- **The p-th root of a polynomial with zero derivative** (construction, `pthRootOfDerivZero`; node `FF.3/pth-root-of-a-polynomial-with-zero-derivative`).
  Let F be a finite field of characteristic p. For f ∈ F[X], pthRootOfDerivZero p f := map (Frob⁻¹) (contract p f), where contract p keeps the coefficients of the exponents divisible by p and Frob⁻¹ = (frobeniusEquiv F p).symm is the inverse of x ↦ x^p. If f' = 0 then (pthRootOfDerivZero p f)^p = f.
  *API:*
  - `pthRootOfDerivZero_pow` (characterisation): derivative f = 0 → (pthRootOfDerivZero p f) ^ p = f.
  - `natDegree_pthRootOfDerivZero` (other): derivative f = 0 → natDegree (pthRootOfDerivZero p f) · p = natDegree f.
  - `pthRootOfDerivZero_monic` (other): derivative f = 0 → f monic → pthRootOfDerivZero p f monic.
  *Unit tests:*
  - `pthRootOfDerivZero_X_pow` (computation): pthRootOfDerivZero p (X ^ p) = X.
  - `pthRootOfDerivZero_X_sq_add_one` (computation): Over 𝔽₂, pthRootOfDerivZero 2 (X² + 1) = X + 1.
  - `pthRootOfDerivZero_X_not_root` (non-example): Over 𝔽₂, (pthRootOfDerivZero 2 X)² ≠ X: the hypothesis f' = 0 is needed (X has derivative 1).
- **f/gcd(f, f') is the radical of the part with exponents prime to p** (lemma, `div_gcd_derivative_eq_prod`; node `FF.3/derivative-gcd-radical`).
  For a monic f over a finite field of characteristic p with factorization f = ∏ fi^ei, f/gcd(f, f') = ∏_{p ∤ ei} fi (gcd the normalized gcd, the product over the distinct normalized irreducible factors whose multiplicity is prime to p).
  *Hypotheses:* F a finite field of characteristic p; f monic.
  *Proof:* By the product rule, f' = Σ_j ej fj^(ej−1) fj' ∏_{k≠j} fk^ek. If p | ei the j = i term vanishes and fi^ei divides every term; if p ∤ ei then fi' ≠ 0 (fi is irreducible and not a p-th power: Theorem 20.3), deg fi' < deg fi, so fi^(ei−1) exactly divides f'. Hence the fi-adic valuation of gcd(f, f') is ei − 1 or ei according as p ∤ ei or p | ei; divide.
- **Square-free decomposition** (definition, `IsSquarefreeDecomposition`; node `FF.3/square-free-decomposition`).
  A list L = ((g1, s1), …, (gt, st)) is a square-free decomposition of f ∈ F[X] (IsSquarefreeDecomposition f L) if each gi is monic, of positive degree and square-free, each si ≥ 1, the gi are pairwise coprime, the si are pairwise distinct, and f = ∏ gi^si. For monic f this holds exactly when L lists, for each multiplicity s occurring in the factorization of f, the pair (∏_{h : v_h(f) = s} h, s) once; in particular it is unique up to order.
  *API:*
  - `IsSquarefreeDecomposition.prod_eq` (projection): IsSquarefreeDecomposition f L → ∏ (g, s) ∈ L, g ^ s = f.
  - `isSquarefreeDecomposition_iff` (characterisation): For monic f: IsSquarefreeDecomposition f L ↔ the multiplicities in L are distinct, positive, cover every multiplicity occurring in f, and each g equals the product of the normalized factors of f with multiplicity exactly s.
  - `IsSquarefreeDecomposition.perm` (extensionality): Two square-free decompositions of f are permutations of each other.
  - `isSquarefreeDecomposition_one` (example): IsSquarefreeDecomposition 1 [].
  *Unit tests:*
  - `isSquarefreeDecomposition_X_sq_mul_X_add_one` (computation): Over 𝔽₂, IsSquarefreeDecomposition (X²(X + 1)) [(X + 1, 1), (X, 2)].
  - `isSquarefreeDecomposition_one_iff` (degenerate): IsSquarefreeDecomposition 1 L ↔ L = [].
  - `not_isSquarefreeDecomposition_repeated` (non-example): [(X, 1), (X, 1)] multiplies to X² but is not a square-free decomposition of X² (repeated, non-coprime entries).
- **Algorithm SFD** (construction, `squarefreeDecomposition`; node `FF.3/square-free-decomposition-algorithm`).
  squarefreeDecomposition f : List (F[X] × ℕ) is Shoup's Algorithm SFD on a monic f over the finite field F of characteristic p: with s = 1, repeat { j ← 1, g ← f/gcd(f, f'); while g ≠ 1 { f ← f/g, h ← gcd(f, g), m ← g/h; if m ≠ 1 append (m, j s); g ← h, j ← j + 1 }; if f ≠ 1 { f ← pthRootOfDerivZero p f, s ← p s } } until f = 1. It is defined by well-founded recursion on the degree (each pass removes the factors with exponent prime to p, and a p-th root divides the degree by p).
  *API:*
  - `isSquarefreeDecomposition_squarefreeDecomposition` (characterisation): For monic f, IsSquarefreeDecomposition f (squarefreeDecomposition f) (the correctness theorem node).
  - `squarefreeDecomposition_of_squarefree` (simp): For monic square-free f of positive degree, squarefreeDecomposition f = [(f, 1)].
  - `squarefreeDecomposition_one` (simp): squarefreeDecomposition 1 = [].
  - `length_squarefreeDecomposition_le` (other): (squarefreeDecomposition f).length ≤ natDegree f.
  *Unit tests:*
  - `squarefreeDecomposition_X_sq_mul_X_add_one` (computation): Over 𝔽₂, squarefreeDecomposition (X²(X + 1)) = [(X + 1, 1), (X, 2)].
  - `squarefreeDecomposition_X_sq_add_one` (computation): Over 𝔽₂, squarefreeDecomposition (X² + 1) = [(X + 1, 2)]: the inseparable case goes through the p-th root.
  - `squarefreeDecomposition_X_pow_three` (degenerate): Over 𝔽₃, squarefreeDecomposition X³ = [(X, 3)]: gcd(f, f') = f at the first step.
- **Correctness of Algorithm SFD** (theorem, `isSquarefreeDecomposition_squarefreeDecomposition`; node `FF.3/square-free-decomposition-algorithm-correct`).
  For every monic f over a finite field, squarefreeDecomposition f is a square-free decomposition of f.
  *Hypotheses:* F a finite field of characteristic p; f monic.
  *Proof:* Let S (resp. S′) index the irreducible factors fi of f with p ∤ ei (resp. p | ei). By the derivative-gcd lemma the first value of g is ∏_{i∈S} fi. Induction on j: at the start of the j-th inner iteration g = ∏_{i∈S, ei≥j} fi and f = ∏_{i∈S, ei≥j} fi^(ei−j+1) · ∏_{i∈S′} fi^ei; the appended m is ∏_{i∈S, ei=j} fi with multiplicity j s. At the end of the inner loop f = ∏_{i∈S′} fi^ei, a p-th power; its p-th root has exponents ei/p, and induction on the degree finishes, the multiplicities being multiplied by p each pass. Distinctness of the multiplicities: each appended multiplicity is the exact exponent ei of the factors of m.

### 3C. Distinct-degree factorization and irreducibility testing (Shoup §§20.1, 20.4.1)

Algorithm IPT decides irreducibility; Rabin's criterion and its certificate format are FF.0's, and FF.3 generates the certificates.

- **gcd(X^(q^k) − X, f) collects the factors of degree k** (lemma, `gcd_X_pow_card_pow_sub_X_eq_prod`; node `FF.3/gcd-with-frobenius-power`).
  Let f be monic and square-free over the finite field F and k ≥ 1, and suppose every irreducible factor of f has degree ≥ k. Then gcd(X^(q^k) − X, f) is the product of the irreducible factors of f of degree exactly k. Moreover, for any h ≡ X^(q^k) (mod f), gcd(h − X, f) = gcd(X^(q^k) − X, f).
  *Hypotheses:* F a finite field with q elements; f monic, square-free; k ≥ 1; every normalized factor of f has degree ≥ k.
  *Proof:* For square-free f, gcd(g, f) is the product of the irreducible factors of f dividing g (node gcd-with-square-free-modulus, applied with g = X^(q^k) − X). An irreducible factor h of f divides X^(q^k) − X iff deg h | k (Mathlib Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X); with deg h ≥ k this means deg h = k. gcd is invariant under reducing the first argument modulo f.
- **Distinct-degree factorization** (definition, `IsDistinctDegreeFactorization`; node `FF.3/distinct-degree-factorization`).
  A list L = ((g1, k1), …, (gt, kt)) is a distinct-degree factorization of f (IsDistinctDegreeFactorization f L) if each gi ≠ 1 is monic and square-free, every irreducible factor of gi has degree ki, k1 < … < kt, and f = ∏ gi. For monic square-free f this holds exactly when gi = ∏ {h ∈ normalizedFactors f : deg h = ki} and the ki are the distinct degrees of the irreducible factors of f, in increasing order.
  *API:*
  - `IsDistinctDegreeFactorization.natDegree_eq` (other): (g, k) ∈ L → natDegree g = k · #(normalizedFactors g).
  - `isDistinctDegreeFactorization_iff` (characterisation): For monic square-free f: the degrees are increasing, cover every factor degree of f, and each block is the product of the normalized factors of that degree.
  - `isDistinctDegreeFactorization_one` (example): IsDistinctDegreeFactorization 1 [].
  *Unit tests:*
  - `isDistinctDegreeFactorization_X_pow_four_add_X` (computation): Over 𝔽₂, X⁴ + X = X(X + 1)(X² + X + 1) has the distinct-degree factorization [(X² + X, 1), (X² + X + 1, 2)].
  - `not_isDistinctDegreeFactorization_trivial` (non-example): [(X⁴ + X, 1)] is not a distinct-degree factorization: the block has a quadratic factor.
  - `isDistinctDegreeFactorization_of_irreducible` (degenerate): An irreducible monic f has the single block [(f, deg f)].
- **Algorithm DDF** (construction, `distinctDegreeFactorization`; node `FF.3/distinct-degree-factorization-algorithm`).
  distinctDegreeFactorization f is Shoup's Algorithm DDF on a monic square-free f: h ← X mod f, k ← 0; while f ≠ 1 { h ← h^q mod f, k ← k + 1, g ← gcd(h − X, f); if g ≠ 1 { append (g, k); f ← f/g; h ← h mod f } }. (Exercise 20.6's early exit when 2k > deg f appends the remaining f as its own block.)
  *API:*
  - `isDistinctDegreeFactorization_distinctDegreeFactorization` (characterisation): For monic square-free f, IsDistinctDegreeFactorization f (distinctDegreeFactorization f) (correctness node).
  - `length_distinctDegreeFactorization_le` (other): (distinctDegreeFactorization f).length ≤ natDegree f.
  - `distinctDegreeFactorization_of_irreducible` (simp): For monic irreducible f, distinctDegreeFactorization f = [(f, natDegree f)].
  - `distinctDegreeFactorization_one` (simp): distinctDegreeFactorization 1 = [].
  *Unit tests:*
  - `distinctDegreeFactorization_X_pow_four_add_X` (computation): Over 𝔽₂, distinctDegreeFactorization (X⁴ + X) = [(X² + X, 1), (X² + X + 1, 2)].
  - `distinctDegreeFactorization_X_sq_add_X_add_one` (degenerate): Over 𝔽₂, distinctDegreeFactorization (X² + X + 1) = [(X² + X + 1, 2)].
  - `distinctDegreeFactorization_X_pow_five_sub_X_sub_one` (compatibility): Over 𝔽₂, distinctDegreeFactorization (X⁵ − X − 1) = [(X² + X + 1, 2), (X³ + X² + 1, 3)], agreeing with Tau Ceti's factor degrees {3, 2} of X⁵ − X − 1 modulo 2.
- **Correctness of Algorithm DDF** (theorem, `isDistinctDegreeFactorization_distinctDegreeFactorization`; node `FF.3/distinct-degree-factorization-algorithm-correct`).
  For monic square-free f, distinctDegreeFactorization f is a distinct-degree factorization of f.
  *Hypotheses:* F a finite field; f monic and square-free.
  *Proof:* Loop invariant: at the start of iteration k, f has no irreducible factor of degree < k and h ≡ X^(q^(k−1)) (mod f). By the gcd lemma the computed g is the product of the factors of degree k; removing it preserves the invariant. The loop ends when f = 1, so the blocks multiply to the input.
- **Algorithm IPT, the irreducibility test** (construction, `irreducibilityTest`; node `FF.3/irreducibility-test`).
  irreducibilityTest f : Bool is Shoup's Algorithm IPT: h ← X mod f; for k = 1, …, ⌊deg f/2⌋ { h ← h^q mod f; if gcd(h − X, f) ≠ 1 return false }; return true. Mathematically it returns true iff gcd(X^(q^k) mod f − X, f) = 1 for every 1 ≤ k ≤ ⌊deg f/2⌋.
  *API:*
  - `irreducibilityTest_eq_true_iff` (characterisation): For monic f of positive degree, irreducibilityTest f = true ↔ Irreducible f (correctness node).
  - `irreducibilityTest_of_natDegree_le_one` (simp): natDegree f ≤ 1 → irreducibilityTest f = true (the loop is empty).
  - `irreducibilityTest_eq_false_of_dvd` (other): If f has a monic factor g with 0 < deg g ≤ deg f / 2, then irreducibilityTest f = false (the witness found by the loop at k = deg of a smallest factor).
  *Unit tests:*
  - `irreducibilityTest_X_sq_add_X_add_one` (computation): Over 𝔽₂, irreducibilityTest (X² + X + 1) = true.
  - `irreducibilityTest_X_sq_add_one` (non-example): Over 𝔽₂, irreducibilityTest (X² + 1) = false, since X² + 1 = (X + 1)².
  - `irreducibilityTest_X_pow_five_sub_X_sub_one` (compatibility): Over 𝔽₅, irreducibilityTest (X⁵ − X − 1) = true, agreeing with Tau Ceti's Polynomial.irreducible_X_pow_five_sub_X_sub_one_zmod_five.
- **Correctness of Algorithm IPT** (theorem, `irreducibilityTest_eq_true_iff`; node `FF.3/irreducibility-test-correct`).
  For monic f of positive degree over a finite field, irreducibilityTest f = true ↔ Irreducible f.
  *Hypotheses:* F a finite field; f monic, 0 < deg f.
  *Proof:* If f is reducible, it has an irreducible factor g of minimal degree k ≤ deg f/2; then g | X^(q^k) − X, so gcd ≠ 1. If f is irreducible of degree ℓ and 1 ≤ k ≤ ℓ/2, then ℓ ∤ k, so f ∤ X^(q^k) − X (Mathlib Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X) and gcd = 1 since f is irreducible.
- **Generating a Rabin irreducibility certificate** (construction, `rabinCertificateOf`; node `FF.3/rabin-certificate-generation`).
  rabinCertificateOf f produces FF.0's Rabin certificate for f: for each prime s | deg f it runs the extended Euclidean algorithm on X^(q^(deg f/s)) mod f − X and f, and records the Bézout pair (u_s, v_s); for s not a prime divisor it records (0, 0).
  *API:*
  - `rabinCertificateOf_check` (characterisation): For monic irreducible f, (rabinCertificateOf f).check f = true (correctness node).
  - `rabinCertificateOf_bezout_of_not_prime` (simp): For s not prime, (rabinCertificateOf f).bezout s = (0, 0).
  - `rabinCertificateOf_bezout` (characterisation): For monic irreducible f and a prime s | deg f, the pair (u, v) = (rabinCertificateOf f).bezout s satisfies u (X^(q^(deg f/s)) mod f − X) + v f = 1.
  *Unit tests:*
  - `rabinCertificateOf_X_sq_add_X_add_one` (computation): Over 𝔽₂, the certificate generated for X² + X + 1 checks.
  - `rabinCertificateOf_reducible_fails` (non-example): Over 𝔽₂, no Rabin certificate checks for the reducible X² + 1.
  - `rabinCertificateOf_linear` (degenerate): A monic linear polynomial has no prime divisor of its degree; its certificate is empty and checks.
- **The generated Rabin certificate checks** (theorem, `rabinCertificateOf_check`; node `FF.3/rabin-certificate-generation-correct`).
  For monic irreducible f over a finite field, (rabinCertificateOf f).check f = true.
  *Hypotheses:* F a finite field; f monic, irreducible.
  *Proof:* X^(q^ℓ) ≡ X (mod f) and gcd(X^(q^(ℓ/s)) − X, f) = 1 for primes s | ℓ by Rabin's criterion (FF.0). The extended Euclidean algorithm returns Bézout coefficients for gcd = 1 (Mathlib EuclideanDomain.gcd_eq_gcd_ab, normalized).

### 3D. Equal-degree factorization and the Cantor–Zassenhaus algorithm (Shoup §§20.4.2–20.4.3)

The probability analysis is Shoup's: a pair of irreducible factors of degree `k` is left together by one round with probability exactly `1/2` (`q` even) or `(1 + q^(−2k))/2 ≤ 5/9` (`q` odd). For `q` odd Shoup leaves the details of the expected number of rounds to the reader; the node `equal-degree-factorization-expected-rounds` supplies them.

- **gcd with a square-free modulus** (lemma, `gcd_modByMonic_eq_prod_dvd`; node `FF.3/gcd-with-square-free-modulus`).
  For f monic and square-free over a field and any g, gcd(g mod f, f) = ∏ {h ∈ normalizedFactors f : h | g} (normalized gcd).
  *Hypotheses:* F a field; f monic, square-free; g ∈ F[X].
  *Proof:* gcd(g mod f, f) = gcd(g, f) (Euclid). f = ∏ of its distinct normalized irreducible factors (square-free); gcd with g keeps exactly those dividing g, each to the first power (unique factorization).
- **The splitting polynomial M_k** (definition, `edfSplittingPolynomial`; node `FF.3/equal-degree-splitting-polynomial`).
  For a finite field F with q elements and k ≥ 1, edfSplittingPolynomial F k = M_k is Σ_{j < wk} X^(2^j) when q = 2^w (so that M_k(α) = Tr_{E/𝔽₂}(α) for α in a field E of degree k over F) and X^((q^k − 1)/2) − 1 when q is odd (so that M_k(α) = χ_E(α) − 1 for α ∈ E^×, χ_E the quadratic character of E).
  *API:*
  - `edfSplittingPolynomial_of_ringChar_ne_two` (simp): ringChar F ≠ 2 → edfSplittingPolynomial F k = X^((q^k − 1)/2) − 1.
  - `card_aeval_edfSplittingPolynomial_eq_zero` (characterisation): For E ⊇ F of degree k ≥ 1: #{α ∈ E : M_k(α) = 0} = q^k/2 if q is even and (q^k − 1)/2 if q is odd.
  - `aeval_edfSplittingPolynomial_sq_eq_self` (other): For q even and E of degree k: M_k(α)² = M_k(α), i.e. M_k(α) ∈ 𝔽₂.
  *Unit tests:*
  - `edfSplittingPolynomial_zmod_three_one` (computation): edfSplittingPolynomial (ZMod 3) 1 = X − 1.
  - `edfSplittingPolynomial_zmod_two_two` (computation): edfSplittingPolynomial (ZMod 2) 2 = X + X², the trace of 𝔽₄/𝔽₂.
  - `aeval_edfSplittingPolynomial_eq_quadraticChar` (compatibility): For q odd and a ∈ F^×, M_1(a) + 1 = quadraticChar F a (cast to F): agreement with Mathlib's quadratic character.
- **The number of zeros of M_k in a field of degree k** (lemma, `card_aeval_edfSplittingPolynomial_eq_zero`; node `FF.3/zeros-of-the-splitting-polynomial`).
  For a finite field E ⊇ F with [E : F] = k ≥ 1: #{α ∈ E : M_k(α) = 0} = q^k/2 if q is even and (q^k − 1)/2 if q is odd.
  *Hypotheses:* E a finite field extension of F of degree k ≥ 1.
  *Proof:* q even: M_k(α) = Tr_{E/𝔽₂}(α); the trace is surjective and 𝔽₂-linear, so its kernel has index 2. q odd: the squares of E^× form the subgroup of index 2, which is the kernel of α ↦ α^((q^k−1)/2) (Euler's criterion, Mathlib FiniteField.isSquare_iff / pow_dichotomy); 0 is not a zero of M_k.
- **The pair-separation probability of equal-degree splitting** (theorem, `card_not_separated_edf`; node `FF.3/equal-degree-pair-separation`).
  Let f be monic and square-free with all irreducible factors of degree k, and f1 ≠ f2 two of them. For a uniform in F[X]/(f) (uniform coefficient vector of length deg f), the probability that f1 | M_k(a) ↔ f2 | M_k(a) (the pair is not separated) is exactly 1/2 for q even and (1 + q^(−2k))/2 ≤ 5/9 for q odd.
  *Hypotheses:* F a finite field with q elements; f monic, square-free, every irreducible factor of degree k; f1 ≠ f2 irreducible factors of f.
  *Proof:* By the Chinese remainder theorem (Mathlib Ideal.quotientInfRingEquivPiQuotient), a ↦ (a mod f1, a mod f2, a mod rest) is a bijection, so (a mod f1, a mod f2) is uniform on E1 × E2 with Ei = F[X]/(fi) of degree k. fi | M_k(a) iff M_k(a mod fi) = 0 in Ei; count with the zeros lemma: for q even both events have probability 1/2 and are independent; for q odd P = z² + (1 − z)² with z = (q^k − 1)/(2q^k), which equals (1 + q^(−2k))/2. (1 + q^(−2k))/2 ≤ (1 + 1/9)/2 = 5/9 since q^k ≥ 3.
- **One refinement step of equal-degree splitting** (construction, `edfRefine`; node `FF.3/equal-degree-refinement-step`).
  For k ≥ 1, a ∈ F[X] and a finite set H of polynomials, edfRefine k a H replaces every h ∈ H by the pair {d, h/d} where d = gcd(M_k(a) mod h, h), unless d = 1 or d = h, in which case h is kept.
  *API:*
  - `edfRefine` (constructor): edfRefine k a H : Finset F[X], the refined set of factors.
  - `prod_edfRefine` (characterisation): If f is monic square-free and H is a set of monic factors with ∏ H = f, then ∏ (edfRefine k a H) = f and its elements are monic.
  - `card_edfRefine_le` (other): (edfRefine k a H).card ≤ 2 · H.card.
  *Unit tests:*
  - `edfRefine_X_sq_add_X` (computation): Over 𝔽₂, edfRefine 1 X {X² + X} = {X, X + 1} (M₁ = X and gcd(X, X² + X) = X).
  - `edfRefine_empty` (degenerate): edfRefine k a ∅ = ∅.
  - `edfRefine_trivial` (non-example): If f | M_k(a) then edfRefine k a {f} = {f}: a residue with M_k(a) ≡ 0 does not split.
- **Algorithm EDF (equal-degree factorization) as a round distribution** (construction, `equalDegreeFactorization`; node `FF.3/equal-degree-factorization-algorithm`).
  For f monic square-free with all irreducible factors of degree k, equalDegreeFactorization f k n : PMF (Finset F[X]) is the distribution of the set of factors after n rounds of Shoup's Algorithm EDF, starting from {f}; each round draws a uniform coefficient vector v : Fin (deg f) → F, i.e. a uniform a ∈ F[X]/(f), and applies edfRefine k a. The algorithm stops when the set has r = deg f/k elements; 'Las Vegas' means every outcome is correct, only the number of rounds is random.
  *API:*
  - `equalDegreeFactorization_zero` (simp): equalDegreeFactorization f k 0 = PMF.pure {f}.
  - `equalDegreeFactorization_support` (characterisation): Las Vegas correctness (theorem node equal-degree-factorization-correct).
  - `equalDegreeFactorization_failure_le` (other): Failure bound (theorem node equal-degree-factorization-failure-bound).
  - `tsum_equalDegreeFactorization_unfinished_le` (other): Expected number of rounds for q even (theorem node equal-degree-factorization-expected-rounds).
  *Unit tests:*
  - `equalDegreeFactorization_irreducible` (degenerate): An irreducible monic f of degree k is returned unchanged by every number of rounds.
  - `equalDegreeFactorization_X_sq_add_X` (computation): Over 𝔽₂, k = 1: after one round the outcome {X, X + 1} has probability 1/2.
  - `equalDegreeFactorization_card_le` (characterisation): Every outcome has at most deg f / k elements.
- **Las Vegas correctness of Algorithm EDF** (theorem, `equalDegreeFactorization_support`; node `FF.3/equal-degree-factorization-correct`).
  Let f be monic and square-free with all irreducible factors of degree k. For every n and every H in the support of equalDegreeFactorization f k n: ∏_{h∈H} h = f, every h ∈ H is monic, and if #H = deg f/k then H is the set of irreducible factors of f (H.val = normalizedFactors f).
  *Hypotheses:* F a finite field; f monic, square-free, all irreducible factors of degree k.
  *Proof:* Invariant: the elements of H are monic, pairwise coprime, and multiply to f; it holds for {f} and is preserved by edfRefine (gcd-with-square-free-modulus). Each element of H is a nonempty product of distinct irreducible factors of degree k; with r = deg f/k elements each is a single irreducible factor.
- **Failure probability of Algorithm EDF** (theorem, `equalDegreeFactorization_failure_le`; node `FF.3/equal-degree-factorization-failure-bound`).
  With f as above and r = deg f/k, the probability that equalDegreeFactorization f k n has fewer than r elements is at most C(r, 2) · (5/9)^n; for q even at most C(r, 2) · 2^(−n).
  *Hypotheses:* F a finite field; f monic, square-free, all irreducible factors of degree k.
  *Proof:* The outcome is incomplete iff some pair fi ≠ fj of irreducible factors has not been separated. For a fixed pair, each round separates it with probability ≥ 4/9 (≥ 1/2 for q even) independently of the past, by the pair-separation theorem applied to the current factor containing both; so P[not separated after n rounds] ≤ (5/9)^n. Union bound over the C(r, 2) pairs.
- **Expected number of rounds of Algorithm EDF** (theorem, `tsum_equalDegreeFactorization_unfinished_le`; node `FF.3/equal-degree-factorization-expected-rounds`).
  With f as above and r = deg f/k: for q even, Σ_{n≥0} P[unfinished after n rounds] ≤ 2 log₂ r + 2; for q odd, ≤ 2 log_{9/5} r + 4. The sum is the expected number of rounds E[L] (Shoup's L, the number of loop iterations).
  *Hypotheses:* F a finite field; f monic, square-free, all irreducible factors of degree k.
  *Proof:* E[L] = Σ_{n≥1} P[L ≥ n] = Σ_{n≥0} P[unfinished after n rounds]. q even: P[L ≥ n] ≤ min(1, r² 2^(−n)); split the sum at n = 2 log₂ r (Shoup's computation). q odd: P[unfinished after n] ≤ min(1, C(r, 2)(5/9)^n); split at m = ⌈log_{9/5} C(r, 2)⌉: the sum is at most m + 1/(1 − 5/9) ≤ 2 log_{9/5} r + 1 + 9/4.
- **The Cantor–Zassenhaus algorithm** (construction, `cantorZassenhaus`; node `FF.3/cantor-zassenhaus-algorithm`; planet *Cantor–Zassenhaus algorithm*).
  cantorZassenhaus f n : PMF (Option (Multiset F[X])) runs Algorithm SFD on monic f, Algorithm DDF on each square-free part g_i, and n rounds of Algorithm EDF on each block (g_ij, k_ij); the outcome is some m, m the multiset of irreducible factors with multiplicity (each factor of g_i repeated s_i times), when every block is finished, and none otherwise.
  *API:*
  - `cantorZassenhaus_support` (characterisation): Every completed outcome equals normalizedFactors f (theorem node cantor-zassenhaus-correct).
  - `cantorZassenhaus_none_le` (other): P[none] ≤ (deg f)² (5/9)^n (theorem node cantor-zassenhaus-failure-bound).
  - `cantorZassenhaus_zero_of_irreducible` (simp): For monic irreducible f, cantorZassenhaus f 0 = pure (some {f}).
  *Unit tests:*
  - `cantorZassenhaus_one` (degenerate): cantorZassenhaus 1 n = pure (some 0).
  - `cantorZassenhaus_X_sq_mul_X_add_one` (computation): Over 𝔽₂, cantorZassenhaus (X²(X + 1)) n = pure (some {X, X, X + 1}) for every n (all blocks are single factors).
  - `cantorZassenhaus_not_product_only` (non-example): Over 𝔽₂, some {X² + X} is never an outcome for X² + X: an unsplit product is never reported as a factorization.
- **Las Vegas correctness of the Cantor–Zassenhaus algorithm** (theorem, `cantorZassenhaus_support`; node `FF.3/cantor-zassenhaus-correct`).
  For monic f and every n: if some m lies in the support of cantorZassenhaus f n then m = normalizedFactors f.
  *Hypotheses:* F a finite field; f monic.
  *Proof:* SFD is correct (square-free parts with exact multiplicities); DDF is correct on each part; a completed EDF outcome on each block is its set of irreducible factors. Unique factorization: the multiset assembled from the blocks, with multiplicities s_i, is normalizedFactors f.
- **Failure probability of the Cantor–Zassenhaus algorithm** (theorem, `cantorZassenhaus_none_le`; node `FF.3/cantor-zassenhaus-failure-bound`).
  For monic f of degree ℓ, P[cantorZassenhaus f n = none] ≤ ℓ² · (5/9)^n.
  *Hypotheses:* F a finite field; f monic of degree ℓ.
  *Proof:* Union bound over the blocks: block (g, k) fails with probability ≤ C(r_g, 2)(5/9)^n and Σ C(r_g, 2) ≤ ℓ².

### 3E. Berlekamp's algorithm (Shoup §20.5)

Stage 1 computes a basis of the Berlekamp subalgebra as the row null space of the Berlekamp matrix (Gaussian elimination over `F`, whose correctness and cost contract is requested from CN.0); Stage 2 splits with random elements of it.

- **The Berlekamp subalgebra** (definition, `berlekampSubalgebra`; node `FF.3/berlekamp-subalgebra`).
  For f ∈ F[X] over a finite field F with q elements, berlekampSubalgebra f ⊆ F[X]/(f) is the F-subalgebra B = {α : α^q = α}, the equalizer of the q-power Frobenius F-algebra endomorphism (Mathlib FiniteField.frobeniusAlgHom) and the identity. For f monic square-free with r irreducible factors, the Chinese remainder isomorphism identifies B with F^r.
  *API:*
  - `mem_berlekampSubalgebra` (characterisation): α ∈ berlekampSubalgebra f ↔ α ^ q = α.
  - `algebraMap_mem_berlekampSubalgebra` (other): algebraMap F (AdjoinRoot f) c ∈ berlekampSubalgebra f.
  - `finrank_berlekampSubalgebra` (other): For monic square-free f, finrank F B = #normalizedFactors f (theorem node berlekamp-dimension-theorem).
  *Unit tests:*
  - `finrank_berlekampSubalgebra_X_sq_add_X` (computation): Over 𝔽₂, finrank of B for X² + X = X(X + 1) is 2.
  - `berlekampSubalgebra_eq_bot_of_irreducible` (degenerate): For irreducible f, berlekampSubalgebra f = ⊥ (the image of F).
  - `finrank_berlekampSubalgebra_X_sq` (non-example): Over 𝔽₂, B for X² has dimension 1 although X² has two irreducible factors counted with multiplicity: square-freeness is needed.
- **Berlekamp's theorem: dim B = r** (theorem, `finrank_berlekampSubalgebra`; node `FF.3/berlekamp-dimension-theorem`).
  For f monic and square-free over a finite field F, the Berlekamp subalgebra of F[X]/(f) has dimension over F equal to the number r of irreducible factors of f.
  *Hypotheses:* F a finite field; f monic, square-free.
  *Proof:* Chinese remainder theorem: F[X]/(f) ≅ ∏ F[X]/(f_i) as F-algebras, compatible with the Frobenius endomorphisms (Mathlib Ideal.quotientInfRingEquivPiQuotient; the ideals (f_i) are pairwise coprime). In each field E_i = F[X]/(f_i), α^q = α iff α ∈ F (the roots of X^q − X in E_i are the q elements of F, FiniteField.roots_X_pow_card_sub_X). Hence B ≅ F^r and finrank F B = r.
- **Berlekamp's irreducibility criterion** (theorem, `irreducible_iff_finrank_berlekampSubalgebra_eq_one`; node `FF.3/berlekamp-irreducibility-criterion`).
  A monic square-free f of positive degree over a finite field is irreducible iff its Berlekamp subalgebra has dimension 1.
  *Hypotheses:* F a finite field; f monic, square-free, 0 < deg f.
  *Proof:* By the dimension theorem, dim B = r; r = 1 iff f is irreducible (f monic of positive degree).
- **The Berlekamp matrix** (definition, `berlekampMatrix`; node `FF.3/berlekamp-matrix`).
  For f of degree ℓ over F with q elements, berlekampMatrix f is the ℓ × ℓ matrix Q over F whose i-th row (0 ≤ i < ℓ) is the coefficient vector of X^(q i) mod f minus the i-th unit vector: the matrix of ρ(α) = α^q − α on F[X]/(f) in the basis 1, X, …, X^(ℓ−1), acting on row vectors.
  *API:*
  - `rank_berlekampMatrix` (characterisation): For monic square-free f: rank Q = ℓ − r (theorem node berlekamp-matrix-rank).
  - `vecMul_berlekampMatrix_eq_zero_iff` (compatibility): For monic f: v Q = 0 ↔ the class of Σ v_i X^i lies in berlekampSubalgebra f.
  - `berlekampMatrix_apply` (simp): berlekampMatrix f i j = coeff (X^(q i) mod f) j − (if i = j then 1 else 0).
  *Unit tests:*
  - `berlekampMatrix_X_sq_add_X` (computation): Over 𝔽₂, berlekampMatrix (X² + X) = 0.
  - `rank_berlekampMatrix_X_sq_add_X_add_one` (computation): Over 𝔽₂, the Berlekamp matrix of X² + X + 1 has rank 1.
  - `rank_berlekampMatrix_X_sq` (non-example): Over 𝔽₂, the Berlekamp matrix of X² has rank 1, not 2 − 2 = 0: the rank formula needs square-freeness.
- **The rank of the Berlekamp matrix** (theorem, `rank_berlekampMatrix`; node `FF.3/berlekamp-matrix-rank`).
  For f monic and square-free of degree ℓ with r irreducible factors, rank(berlekampMatrix f) = ℓ − r, and the row null space of Q corresponds to B under the coordinate map.
  *Hypotheses:* F a finite field; f monic, square-free.
  *Proof:* Row null space of Q = coordinates of ker ρ = B (vecMul lemma); dim = r by Berlekamp's theorem. Rank–nullity for the linear map v ↦ v Q on F^ℓ (Mathlib Matrix.rank, rank of the transpose).
- **Algorithm B2 (splitting with a basis of B) as a round distribution** (construction, `berlekampSplit`; node `FF.3/berlekamp-splitting-algorithm`).
  Given monic f and a basis β = (β_i)_{i∈ι} of the Berlekamp subalgebra of F[X]/(f), berlekampSplit hf β n : PMF (Finset F[X]) is the distribution of the set of factors after n rounds: each round draws c : ι → F uniformly, forms g = rep(Σ c_i β_i) (the representative of degree < deg f, Mathlib AdjoinRoot.modByMonicHom) and applies edfRefine 1 g (splitting polynomial M_1).
  *API:*
  - `berlekampSplit_support` (characterisation): Las Vegas correctness (theorem node berlekamp-splitting-correct).
  - `berlekampSplit_failure_le` (other): P[fewer than #ι factors after n rounds] ≤ C(#ι, 2)(5/9)^n (theorem node).
  - `berlekampSplit_zero` (simp): berlekampSplit hf β 0 = pure {f}.
  *Unit tests:*
  - `berlekampSplit_irreducible` (degenerate): For irreducible f with a one-element basis, berlekampSplit hf β n = pure {f}.
  - `berlekampSplit_support_card_le` (characterisation): Every outcome has at most #ι = dim B elements.
  - `berlekampSplit_X_sq_add_X` (computation): Over 𝔽₂, for X² + X and any basis of the two-dimensional B, one round gives {X, X + 1} with probability 1/2.
- **Las Vegas correctness of Algorithm B2** (theorem, `berlekampSplit_support`; node `FF.3/berlekamp-splitting-correct`).
  For f monic square-free and β a basis of B: every outcome H of berlekampSplit hf β n multiplies to f, and if #H = #ι (= r) then H is the set of irreducible factors of f.
  *Hypotheses:* F a finite field; f monic, square-free; β a basis of berlekampSubalgebra f.
  *Proof:* Same invariant as for EDF (refinement preserves monic, coprime factors multiplying to f). #ι = r by Berlekamp's theorem, so r factors are the irreducible factors.
- **Failure probability of Algorithm B2** (theorem, `berlekampSplit_failure_le`; node `FF.3/berlekamp-splitting-failure-bound`).
  For f monic square-free with r factors and β a basis of B: P[fewer than r factors after n rounds] ≤ C(r, 2) · (5/9)^n.
  *Hypotheses:* F a finite field; f monic, square-free.
  *Proof:* For a pair of factors, the components (c_i, c_j) ∈ F² of a uniform element of B are independent uniform; M_1 separates them unless M_1(c_i) and M_1(c_j) are both zero or both nonzero: probability 1/2 (q even) or (1 + q^(−2))/2 ≤ 5/9 (q odd), the case k = 1 of the pair-separation computation. Union bound over pairs, rounds independent.
- **Berlekamp's factoring algorithm** (construction, `berlekampFactor`; node `FF.3/berlekamp-algorithm`; planet *Berlekamp's algorithm*).
  berlekampFactor f n : PMF (Option (Multiset F[X])) runs Algorithm SFD on monic f, then on each square-free part g: builds the Berlekamp matrix of g, a basis of its row null space (Gaussian elimination, CN.0), hence a basis of B, and n rounds of Algorithm B2; the outcome is the multiset of irreducible factors with multiplicity, or none if some part is unfinished.
  *API:*
  - `berlekampFactor_support` (characterisation): Every completed outcome equals normalizedFactors f (theorem node berlekamp-algorithm-correct).
  - `berlekampFactor_none_le` (other): P[none] ≤ (deg f)² (5/9)^n.
  - `berlekampFactor_of_irreducible` (simp): For monic irreducible f, berlekampFactor f n = pure (some {f}).
  *Unit tests:*
  - `berlekampFactor_one` (degenerate): berlekampFactor 1 n = pure (some 0).
  - `berlekampFactor_X_pow_five_sub_X_sub_one_zmod_two` (computation): Over 𝔽₂, every completed outcome for X⁵ − X − 1 is {X² + X + 1, X³ + X² + 1}.
  - `berlekampFactor_agrees_cantorZassenhaus` (compatibility): Completed outcomes of berlekampFactor and cantorZassenhaus coincide (both equal normalizedFactors f).
- **Las Vegas correctness of Berlekamp's algorithm** (theorem, `berlekampFactor_support`; node `FF.3/berlekamp-algorithm-correct`).
  For monic f and every n, a completed outcome some m of berlekampFactor f n satisfies m = normalizedFactors f; and P[none] ≤ (deg f)² (5/9)^n.
  *Hypotheses:* F a finite field; f monic.
  *Proof:* SFD correctness; Stage 1 returns a basis of B (rank theorem and CN.0's Gaussian elimination contract); Stage 2 correctness and failure bound; unique factorization to assemble multiplicities.

### 3F. Constructing irreducible polynomials (Shoup §20.1, Algorithm RIP)

The generate-and-test loop, with its output law and geometric number of attempts computed directly in `PMF`.

- **Algorithm RIP (random irreducible polynomial) as an attempt distribution** (construction, `randomIrreducible`; node `FF.3/random-irreducible-polynomial-algorithm`).
  randomIrreducible F ℓ n : PMF (Option F[X]) is n attempts of Shoup's Algorithm RIP: each attempt draws a uniform monic f of degree ℓ (X^ℓ plus a uniform coefficient vector) and returns some f if irreducibilityTest f = true; after n failures it returns none.
  *API:*
  - `randomIrreducible_apply_some` (characterisation): Output law (theorem node random-irreducible-polynomial-output-law).
  - `randomIrreducible_none` (other): P[none after n attempts] = (1 − Π_F(ℓ)/q^ℓ)^n.
  - `tsum_randomIrreducible_none_le` (other): Expected number of attempts ≤ 2ℓ (theorem node).
  *Unit tests:*
  - `randomIrreducible_zero` (degenerate): randomIrreducible F ℓ 0 = pure none.
  - `randomIrreducible_one_one` (computation): Over 𝔽₂, one attempt at degree 1 returns X with probability 1/2.
  - `randomIrreducible_two_one` (computation): Over 𝔽₂, one attempt at degree 2 fails with probability 3/4.
- **Output law of Algorithm RIP** (theorem, `randomIrreducible_apply_some`; node `FF.3/random-irreducible-polynomial-output-law`).
  For ℓ ≥ 1, n attempts of Algorithm RIP return some f with probability (1 − (1 − Π_F(ℓ)/q^ℓ)^n)/Π_F(ℓ) if f is monic irreducible of degree ℓ, and 0 otherwise; none has probability (1 − Π_F(ℓ)/q^ℓ)^n. In particular, conditioned on success the output is uniform on monicIrreducibles F ℓ.
  *Hypotheses:* F a finite field with q elements; ℓ ≠ 0.
  *Proof:* Induction on n: an attempt succeeds with f with probability 1/q^ℓ if f is irreducible (IPT correctness), and fails with probability 1 − Π_F(ℓ)/q^ℓ; sum the geometric series. This is Shoup's Theorem 9.3 (iii) for the generate-and-test loop, computed directly.
- **Expected number of attempts of Algorithm RIP** (theorem, `tsum_randomIrreducible_none_le`; node `FF.3/random-irreducible-polynomial-attempts`).
  For ℓ ≥ 1, Σ_{n≥0} P[randomIrreducible F ℓ n = none] = q^ℓ/Π_F(ℓ) ≤ 2ℓ: the number of attempts is geometric with success probability Π_F(ℓ)/q^ℓ ≥ 1/(2ℓ), and RIP halts with probability 1.
  *Hypotheses:* F a finite field with q elements; ℓ ≠ 0.
  *Proof:* Σ_n (1 − ρ)^n = 1/ρ (ENNReal.tsum_geometric) with ρ = Π_F(ℓ)/q^ℓ; ρ ≥ 1/(2ℓ) by Shoup's density bound.

### 3G. Certified factorizations

A product identity alone is not a factorization certificate: every factor carries an FF.0 Rabin certificate. CN.5 wraps these certificates in its generic schema for FF.5 and the computational owners.

- **Factorization certificate and its checker** (definition, `FactorizationCertificate`; node `FF.3/factorization-certificate`).
  A FactorizationCertificate over F is a leading coefficient c ∈ F and a list of triples (g_i, e_i, w_i) with w_i an FF.0 Rabin certificate. c.check f is true iff C c · ∏ g_i^e_i = f, every e_i ≥ 1, the g_i are pairwise distinct, and every w_i checks for g_i (in particular g_i is monic of positive degree). A product identity alone is not a certificate: every factor must carry an irreducibility witness.
  *API:*
  - `FactorizationCertificate.check` (constructor): The Boolean checker c.check f.
  - `FactorizationCertificate.check_sound` (characterisation): Soundness (theorem node factorization-certificate-sound).
  - `FactorizationCertificate.exists_check` (other): Completeness (theorem node factorization-certificate-complete).
  - `FactorizationCertificate.check_eq_true_iff_perm` (extensionality): Two checking certificates of f have the same (factor, exponent) list up to permutation.
  *Unit tests:*
  - `factorizationCertificate_X_sq_add_X` (computation): Over 𝔽₂, ⟨1, [(X, 1, w_X), (X + 1, 1, w_{X+1})]⟩ with generated Rabin certificates checks for X² + X.
  - `factorizationCertificate_product_only_fails` (non-example): Over 𝔽₂, ⟨1, [(X² + X, 1, w)]⟩ never checks for X² + X, whatever w is.
  - `factorizationCertificate_constant` (degenerate): Over 𝔽₅, ⟨3, []⟩ checks for the constant 3.
- **Soundness of factorization certificates** (theorem, `FactorizationCertificate.check_sound`; node `FF.3/factorization-certificate-sound`).
  If c.check f = true then c.leadingCoeff = leadingCoeff f and Σ_i e_i • {g_i} = normalizedFactors f.
  *Hypotheses:* F a finite field; c a factorization certificate; c.check f = true.
  *Proof:* Each g_i is monic irreducible (soundness of FF.0's Rabin certificate). f = C c · ∏ g_i^e_i with distinct monic irreducible g_i; compare with Mathlib's normalizedFactors by uniqueness of factorization (UniqueFactorizationMonoid.normalizedFactors_prod_of_prime).
- **Completeness of factorization certificates** (theorem, `FactorizationCertificate.exists_check`; node `FF.3/factorization-certificate-complete`).
  Every nonzero f over a finite field has a factorization certificate that checks.
  *Hypotheses:* F a finite field; f ≠ 0.
  *Proof:* Take c = leadingCoeff f and the distinct normalized factors with their multiplicities; attach rabinCertificateOf to each (it checks, by rabin-certificate-generation-correct).
- **Certified factorization over a finite field** (construction, `certifiedFactorization`; node `FF.3/certified-factorization-algorithm`).
  certifiedFactorization f n : PMF (Option (FactorizationCertificate F)) runs cantorZassenhaus on f / leadingCoeff f with n rounds per block and attaches rabinCertificateOf to each factor; a completed outcome is a certificate that checks.
  *API:*
  - `certifiedFactorization_support` (characterisation): Every completed outcome checks (theorem node certified-factorization-correct).
  - `certifiedFactorization_none_le` (other): P[none] ≤ (deg f)² (5/9)^n.
  - `certifiedFactorization_constant` (simp): For c ≠ 0, certifiedFactorization (C c) n = pure (some ⟨c, []⟩).
  *Unit tests:*
  - `certifiedFactorization_X_sq_add_X_check` (characterisation): Every certificate produced for X² + X over 𝔽₂ checks.
  - `certifiedFactorization_factors_X_sq_add_X` (computation): Its factor list is a permutation of [(X, 1), (X + 1, 1)].
  - `certifiedFactorization_irreducible` (degenerate): For X² + X + 1 over 𝔽₂ the output with 0 rounds is the one-factor certificate.
- **Correctness of certified factorization** (theorem, `certifiedFactorization_support`; node `FF.3/certified-factorization-correct`).
  For f ≠ 0, every completed outcome of certifiedFactorization f n is a certificate c with c.check f = true; P[none] ≤ (deg f)² (5/9)^n.
  *Hypotheses:* F a finite field; f ≠ 0.
  *Proof:* Cantor–Zassenhaus correctness gives the normalized factors; each carries a generated certificate that checks; the product identity holds with c = leadingCoeff f. Failure bound from the Cantor–Zassenhaus failure bound.

### 3H. Hensel lifting of coprime factorizations (Milne, *Algebraic Number Theory*, Theorem 7.33)

Milne proves the theorem over a complete discrete valuation ring; the nodes state it for an ideal `I` of any commutative ring at every finite level `I^k` (uniqueness when `I` lies in the Jacobson radical, automatic in `R/I^k`), over `I`-adically complete rings, and in the form `ℤ/p^kℤ` that integer factorization uses. The limit step, which Milne does not write out, is supplied (sourceIssue E404).

- **Coprimality lifts along an ideal in the Jacobson radical** (lemma, `exists_bezout_of_isCoprime_map`; node `FF.3/strict-coprimality-lifts`).
  Let R be a commutative ring and I ⊆ Jac(R) an ideal. If g ∈ R[X] is monic and the reductions ḡ, h̄ are coprime in (R/I)[X], then there are u, v ∈ R[X] with u g + v h = 1 and deg v < deg g; in particular g and h are coprime in R[X].
  *Hypotheses:* R a commutative ring; I ≤ Jac(R); g monic; IsCoprime ḡ h̄ in (R ⧸ I)[X].
  *Proof:* M = R[X]/(g, h) is a finitely generated R-module since g is monic (division by g). (ḡ, h̄) = (R/I)[X] gives (g, h) + I R[X] = R[X], so M = I M. Nakayama's lemma (Mathlib Submodule.eq_bot_of_le_smul_of_le_jacobson_bot) gives M = 0, i.e. u g + v h = 1. Reduce v modulo g (division by the monic g) and correct u, keeping u g + v h = 1 with deg v < deg g.
- **Uniqueness of monic lifts of a coprime factorization** (lemma, `eq_of_monic_mul_eq_of_map_eq`; node `FF.3/uniqueness-of-monic-lifts`).
  Let I ⊆ Jac(R). If g h = g′ h′ with g, h, g′, h′ ∈ R[X] monic, ḡ = ḡ′, h̄ = h̄′ modulo I, and ḡ, h̄ coprime in (R/I)[X], then g = g′ and h = h′.
  *Hypotheses:* R a commutative ring; I ≤ Jac(R); g, h, g′, h′ monic with g h = g′ h′, equal reductions, ḡ and h̄ coprime.
  *Proof:* By strict coprimality (ḡ, h̄′) = (ḡ, h̄) coprime gives r g + s h′ = 1 in R[X]. g′ = g′ r g + g′ h′ s = g (g′ r + h s), so g | g′; both are monic of the same degree, hence equal; cancel g (monic, a non-zero-divisor) to get h = h′.
- **One linear Hensel step** (lemma, `hensel_step`; node `FF.3/hensel-step`).
  Let I be an ideal of a commutative ring R, m ≥ 1, g monic, f − g h ∈ I^m R[X] and s g + t h − 1 ∈ I R[X]. With e = f − g h, δg = (t e) mod g and δh = s e + ((t e) div g) h, the pair g′ = g + δg, h′ = h + δh satisfies: g′ monic of degree deg g, g′ − g and h′ − h ∈ I^m R[X], and f − g′ h′ ∈ I^(m+1) R[X].
  *Hypotheses:* R a commutative ring, I an ideal; m ≥ 1; g monic; f − g h ∈ I^m R[X]; s g + t h − 1 ∈ I R[X].
  *Proof:* Division by the monic g keeps coefficients in I^m: t e = Q g + δg with δg, Q ∈ I^m R[X] and deg δg < deg g, so g′ is monic of the same degree. g δh + h δg = (s g + t h) e ≡ e (mod I^(m+1)), since (s g + t h − 1) e ∈ I · I^m. f − g′ h′ = e − (g δh + h δg) − δg δh ∈ I^(m+1) R[X], as δg δh ∈ I^(2m) ⊆ I^(m+1).
- **Hensel lifting of a coprime factorization modulo I^k** (theorem, `hensel_lifting_of_factorizations`; node `FF.3/hensel-lifting-of-factorizations`; planet *Hensel lifting of factorizations*).
  Let I be an ideal of a commutative ring R, f ∈ R[X] monic, and g0, h0 monic with f ≡ g0 h0 (mod I) and ḡ0, h̄0 coprime in (R/I)[X]. Then for every k ≥ 1 there are monic g, h ∈ R[X] with deg g = deg g0, g ≡ g0 and h ≡ h0 (mod I), and f ≡ g h (mod I^k R[X]).
  *Hypotheses:* R a commutative ring, I an ideal; f, g0, h0 monic; f − g0 h0 ∈ I R[X]; ḡ0, h̄0 coprime in (R ⧸ I)[X]; k ≥ 1.
  *Proof:* Lift a Bézout identity of ḡ0, h̄0 to s, t ∈ R[X] with s g0 + t h0 − 1 ∈ I R[X]. Iterate the Hensel step k − 1 times (the step's hypothesis s g + t h ≡ 1 mod I persists because g ≡ g0, h ≡ h0 mod I). Replace the second factor by f div g (division by the monic g): it is monic, congruent to h0 mod I, and f ≡ g (f div g) mod I^k (the remainder is ≡ 0 mod I^k because g is monic).
- **Uniqueness of Hensel lifts modulo I^k** (theorem, `hensel_lifting_unique_mod_pow`; node `FF.3/hensel-lifting-uniqueness-mod-power`).
  In (R/I^k)[X] (k ≥ 1), two factorizations g h = g′ h′ into monic polynomials with the same reductions modulo I, the reductions of g and h being coprime in (R/I)[X], coincide.
  *Hypotheses:* R a commutative ring, I an ideal, k ≥ 1; g, h, g′, h′ ∈ (R/I^k)[X] monic with g h = g′ h′ and equal coprime reductions modulo I.
  *Proof:* The image of I in R/I^k is nilpotent, hence contained in the Jacobson radical; (R/I^k)/(I/I^k) ≅ R/I (Mathlib Ideal.Quotient.factor). Apply the uniqueness of monic lifts.
- **Hensel lifting over an I-adically complete ring** (theorem, `hensel_lifting_of_isAdicComplete`; node `FF.3/hensel-lifting-over-complete-rings`).
  Let R be I-adically complete (Mathlib IsAdicComplete I R), f ∈ R[X] monic, and f̄ = g0 h0 in (R/I)[X] with g0, h0 monic and coprime. Then there is a unique pair (g, h) of monic polynomials in R[X] with ḡ = g0, h̄ = h0 and f = g h. (For R = ℤ_p, I = (p) this is Milne's Theorem 7.33 over ℤ_p; for R = 𝔽_q⟦t⟧ over the power series ring.)
  *Hypotheses:* R a commutative ring, I-adically complete; f monic; g0, h0 ∈ (R/I)[X] monic, coprime, with f̄ = g0 h0.
  *Proof:* Lift g0, h0 to monic polynomials of the same degrees; the Hensel steps give a sequence g_m with g_{m+1} − g_m ∈ I^(m+1) R[X] coefficientwise, a Cauchy sequence in each coefficient of bounded degree. Completeness (Mathlib IsPrecomplete.prec, IsHausdorff) gives limits g, h, monic of the right degrees, with f − g h ∈ ⋂_m I^m R[X] = 0. Uniqueness: I ⊆ Jac(R) for adically complete R (Mathlib IsAdicComplete.le_jacobson_bot), then uniqueness of monic lifts. Milne's proof stops after the inductive step; the passage to the limit is supplied here (sourceIssue FiniteFieldsAndCharacterSums/E404).
- **Hensel lifting of several pairwise coprime factors** (theorem, `hensel_lifting_multifactor`; node `FF.3/hensel-lifting-several-factors`).
  Let f ∈ R[X] be monic and f ≡ ∏_{i∈ι} g_{0,i} (mod I) with g_{0,i} monic and pairwise coprime modulo I (ι finite). Then for every k ≥ 1 there are monic g_i ≡ g_{0,i} (mod I) with f ≡ ∏ g_i (mod I^k); they are unique in (R/I^k)[X].
  *Hypotheses:* R a commutative ring, I an ideal, k ≥ 1; f monic; g_{0,i} monic, pairwise coprime modulo I, product ≡ f mod I.
  *Proof:* Induction on #ι: split off one factor g_{0,j}; it is coprime to ∏_{i≠j} g_{0,i} modulo I (a factor coprime to each is coprime to the product); apply the two-factor theorem, then induct on the cofactor. Uniqueness factor by factor from the two-factor uniqueness.
- **Hensel lifting modulo p^k** (theorem, `hensel_lifting_zmod_prime_pow`; node `FF.3/hensel-lifting-modulo-prime-powers`).
  Let p be prime, k ≥ 1, f ∈ ℤ[X] monic and f mod p = g0 h0 in 𝔽_p[X] with g0, h0 monic and coprime. Then there is a unique pair (g, h) of monic polynomials in (ℤ/p^kℤ)[X] reducing to (g0, h0) modulo p with f mod p^k = g h. This is the form used by factoring algorithms over ℤ.
  *Hypotheses:* p prime, k ≥ 1; f ∈ ℤ[X] monic; f̄ = g0 h0 in (ZMod p)[X], g0, h0 monic, coprime.
  *Proof:* Existence: the lifting theorem for R = ℤ, I = (p), mapped to ℤ/p^k (Mathlib ZMod.castHom for the reduction ℤ/p^k → ℤ/p). Uniqueness: the uniqueness theorem modulo I^k with ℤ/p^k = ℤ/(p)^k.
- **The linear Hensel lifting algorithm** (construction, `henselLift`; node `FF.3/hensel-lifting-algorithm`).
  henselLift f g0 h0 s t m ∈ R[X] × R[X] is the m-th iterate of the Hensel step from (g0, h0) with fixed Bézout coefficients (s, t) modulo I: (g, h) ↦ (g + (t e) mod g, h + s e + ((t e) div g) h), e = f − g h. After m steps the first component is monic of degree deg g0 and f ≡ g (f div g) (mod I^(m+1)).
  *API:*
  - `henselLift_zero` (simp): henselLift f g0 h0 s t 0 = (g0, h0).
  - `henselLift_spec` (characterisation): If g0 is monic, f ≡ g0 h0 and s g0 + t h0 ≡ 1 modulo I, then after m steps g is monic of degree deg g0, g ≡ g0 and h ≡ h0 modulo I, and f ≡ g h modulo I^(m+1).
  - `henselLift_divByMonic` (other): For monic f, f div g is monic and f ≡ g (f div g) modulo I^(m+1).
  - `henselLift_succ_sub_mem` (other): Consecutive first components differ by an element of I^(m+1) R[X] (the Cauchy property).
  *Unit tests:*
  - `henselLift_one_mod_twenty_five` (computation): With s = 1, t = −1, one step on X² + 1, X − 2, X + 2 over ℤ gives a first factor ≡ X − 7 modulo 25.
  - `hensel_lift_X_sq_add_one_mod_twenty_five` (characterisation): In (ℤ/25)[X], X² + 1 = (X − 7)(X + 7).
  - `hensel_lift_unique_X_sq_add_one` (characterisation): In (ℤ/25)[X], a monic g with g h = X² + 1, g ≡ X − 2 and h ≡ X + 2 mod 5 equals X − 7.
  - `not_unique_lift_of_not_coprime` (non-example): Without coprimality lifts are not unique: over ℤ/8, X² + 4 = (X − 2)(X − 6) with X − 2 ≠ X − 6, both ≡ X mod 2.

### 3I. Certified point counting (Sutherland, 18.783 Lecture 7)

Counts follow Tau Ceti's convention (the singular point is counted), so the formulas hold for every model in normal form, not only elliptic ones. The error bounds are imported: Hasse's from EllipticCurves layer 3, Weil's for `y² = f(x)` from FF.2.

- **Naive point count by enumeration** (construction, `naivePointCount`; node `FF.3/naive-point-count`).
  For a Weierstrass curve W over a finite field F (any model, singular or not), naivePointCount W = #{(x, y) ∈ F × F : W.Equation x y} + 1. It equals Tau Ceti's WeierstrassCurve.pointCount W (the projective count with the singular point included) and, on an elliptic model, Nat.card of Mathlib's point type; the trace is a_q = q + 1 − naivePointCount W (Tau Ceti's frobeniusTrace).
  *API:*
  - `naivePointCount_eq_natCard` (compatibility): naivePointCount W = Nat.card {p : F × F // W.Equation p.1 p.2} + 1, the defining equation of Tau Ceti's pointCount.
  - `naivePointCount_eq_card_point` (compatibility): For elliptic W, naivePointCount W = Nat.card W.toAffine.Point.
  - `naivePointCount_variableChange` (other): naivePointCount (C • W) = naivePointCount W for every variable change C.
  *Unit tests:*
  - `naivePointCount_x_cubed_add_x_zmod_three` (computation): y² = x³ + x over 𝔽₃ has 4 points.
  - `naivePointCount_cusp_zmod_five` (degenerate): The cusp y² = x³ over 𝔽₅ has q + 1 = 6 points, its singular point included.
  - `naivePointCount_cusp_ne_card_point` (non-example): On the cusp over 𝔽₅, naivePointCount = Nat.card (Mathlib point type) + 1: Mathlib's type omits the singular point.
  - `naivePointCount_x_cubed_add_x_add_one_zmod_five` (computation): y² = x³ + x + 1 over 𝔽₅ has 9 points.
- **The cubic of a model in characteristic-not-two normal form** (definition, `weierstrassCubic`; node `FF.3/weierstrass-cubic`).
  For W : WeierstrassCurve F, weierstrassCubic W = X³ + a₂X² + a₄X + a₆ ∈ F[X]; when a₁ = a₃ = 0 (Mathlib's IsCharNeTwoNF) the equation of W is y² = weierstrassCubic W (x), and 4 · weierstrassCubic W = Ψ₂Sq (Mathlib's 2-division polynomial square).
  *API:*
  - `four_mul_weierstrassCubic` (compatibility): For a₁ = a₃ = 0: 4 · weierstrassCubic W = W.Ψ₂Sq.
  - `equation_iff_weierstrassCubic` (characterisation): For a₁ = a₃ = 0: W.Equation x y ↔ y² = (weierstrassCubic W).eval x.
  - `natDegree_weierstrassCubic` (other): natDegree (weierstrassCubic W) = 3.
  *Unit tests:*
  - `weierstrassCubic_x_cubed_add_x` (computation): For y² = x³ + x over 𝔽₃ the cubic is X³ + X.
  - `weierstrassCubic_monic` (characterisation): weierstrassCubic W is monic.
  - `weierstrassCubic_ignores_a₁` (non-example): The cubic does not see a₁: the models with a₁ = 1 and a₁ = 0 (other coefficients 0) have the same cubic, so it describes the curve only in the normal form a₁ = a₃ = 0.
- **The point count as a character sum** (theorem, `naivePointCount_eq_add_sum_quadraticChar`; node `FF.3/point-count-as-character-sum`).
  For q odd and W with a₁ = a₃ = 0: naivePointCount W = q + 1 + Σ_{x∈F} χ(f(x)), χ = quadraticChar F (Mathlib's quadratic character, χ(0) = 0) and f = weierstrassCubic W.
  *Hypotheses:* F a finite field of odd characteristic; W with a₁ = a₃ = 0 (any model: singular models included).
  *Proof:* For each x, #{y : y² = f(x)} = 1 + χ(f(x)) (Mathlib quadraticChar_card_sqrts). Sum over x and add the point at infinity.
- **The Frobenius trace as a character sum** (theorem, `card_add_one_sub_naivePointCount_eq`; node `FF.3/trace-as-character-sum`).
  For q odd and a₁ = a₃ = 0: a_q = q + 1 − naivePointCount W = −Σ_{x∈F} χ(f(x)); by Tau Ceti's frobeniusTrace_def and naivePointCount_eq_natCard this is Tau Ceti's frobeniusTrace W.
  *Hypotheses:* F a finite field of odd characteristic; W with a₁ = a₃ = 0.
  *Proof:* Rearrange the character-sum formula.
- **Point-count certificate** (definition, `PointCountCertificate`; node `FF.3/point-count-certificate`).
  For q odd and W with a₁ = a₃ = 0, a PointCountCertificate is a non-square c ∈ F and a function root : F → F. It checks (c.check W) when c^((q−1)/2) = −1 (Euler's criterion) and, for every x, root(x)² = f(x) or root(x)² = c f(x). The count it asserts is q + 1 + Σ_x ε_x with ε_x = 0 if f(x) = 0, 1 if root(x)² = f(x) ≠ 0, and −1 otherwise.
  *API:*
  - `PointCountCertificate.check` (constructor): The Boolean checker c.check W.
  - `PointCountCertificate.count` (data): The asserted count c.count W : ℤ.
  - `PointCountCertificate.count_eq_of_check` (characterisation): Soundness (theorem node point-count-certificate-sound).
  - `PointCountCertificate.exists_check` (other): Completeness (theorem node point-count-certificate-complete).
  - `PointCountCertificate.check_nonsquare` (other): A checking certificate's c is not a square.
  *Unit tests:*
  - `pointCountCertificate_check_zmod_five` (computation): For y² = x³ + x + 1 over 𝔽₅, c = 2 and roots (1, 1, 1, 1, 2) check.
  - `pointCountCertificate_count_zmod_five` (computation): That certificate asserts 9 points.
  - `pointCountCertificate_square_fails` (non-example): c = 1 (a square) is rejected whatever the roots.
  - `pointCountCertificate_cusp` (degenerate): On the cusp y² = x³ over 𝔽₅ a certificate asserts 6, the convention that counts the singular point.
- **Soundness of point-count certificates** (theorem, `PointCountCertificate.count_eq_of_check`; node `FF.3/point-count-certificate-sound`).
  If c.check W = true (q odd, a₁ = a₃ = 0) then c.count W = naivePointCount W.
  *Hypotheses:* F a finite field of odd characteristic; W with a₁ = a₃ = 0; c.check W = true.
  *Proof:* c^((q−1)/2) = −1 makes c a non-square (Euler's criterion, Mathlib FiniteField.isSquare_iff). If root(x)² = f(x) then χ(f(x)) = 0 or 1 according as f(x) = 0; if root(x)² = c f(x) ≠ f(x) then f(x) ≠ 0 and c f(x) is a square, so f(x) is a non-square and χ(f(x)) = −1 (Mathlib quadraticChar_neg_one_iff_not_isSquare). So ε_x = χ(f(x)) for every x; conclude by the character-sum formula.
- **Completeness of point-count certificates** (theorem, `PointCountCertificate.exists_check`; node `FF.3/point-count-certificate-complete`).
  For q odd every W with a₁ = a₃ = 0 has a point-count certificate that checks.
  *Hypotheses:* F a finite field of odd characteristic.
  *Proof:* Choose a non-square c (Mathlib FiniteField.exists_nonsquare); for each x, f(x) or c f(x) is a square (the squares have index 2 in F^×; 0 is a square).
- **The Hasse error bound for certified counts** (theorem, `sq_card_add_one_sub_naivePointCount_le`; node `FF.3/hasse-error-bound-for-point-counts`).
  For W elliptic over F with q elements: (q + 1 − naivePointCount W)² ≤ 4q, i.e. |#W(F) − (q + 1)| ≤ 2√q. Every certified count therefore lies in the Hasse interval [(√q − 1)², (√q + 1)²].
  *Hypotheses:* F a finite field with q elements; W elliptic.
  *Proof:* naivePointCount W = pointCount W (naive-point-count), and q + 1 − pointCount W = frobeniusTrace W (Tau Ceti frobeniusTrace_def). The Hasse bound frobeniusTrace W ² ≤ 4q is EllipticCurves layer 3's hasse_bound (requested; imported, not reproved).
  *Imports from Tau Ceti:* `layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.
- **The Weil error bound for y² = f(x)** (theorem, `abs_card_sq_eq_eval_sub_card_le`; node `FF.3/weil-error-bound-for-hyperelliptic-counts`).
  For q odd and f ∈ F[X] square-free of degree d ≥ 1: |#{(x, y) ∈ F² : y² = f(x)} − q| ≤ (d − 1)√q.
  *Hypotheses:* F a finite field of odd characteristic; f square-free, 1 ≤ deg f = d.
  *Proof:* #{(x, y) : y² = f(x)} = q + Σ_x χ(f(x)) (Mathlib quadraticChar_card_sqrts, summed over x). f square-free of positive degree is not a constant times a square, so the Weil bound for the quadratic character (FF.2/weil-bound-multiplicative, with m = 2 and d distinct roots) gives |Σ_x χ(f(x))| ≤ (d − 1)√q.

### 3J. Schoof's algorithm (Sutherland, 18.783 Lecture 8; Schoof 1995 §5)

Endomorphisms of `E[ℓ]` are handled as representatives `(a(x), b(x) y)` modulo a factor `g` of the `ℓ`-division polynomial; the representation lemmas say what each representative computes on the points `(x, y)` with `g(x) = 0`, so that correctness reduces to Lemma 8.2 and layer 3's Frobenius relation. Completeness (the search finds `t mod ℓ`) needs the division polynomial to be separable, which follows from `#E[ℓ] = ℓ²` (layer 2).

- **The q-power Frobenius on the points of a Weierstrass curve** (definition, `frobeniusPointMap`; node `FF.3/frobenius-on-points`).
  For W : WeierstrassCurve F over a finite field with q elements and a field K ⊇ F, frobeniusPointMap W K is the additive endomorphism of (W.baseChange K).toAffine.Point obtained from Mathlib's Point.map along the F-algebra endomorphism x ↦ x^q of K (FiniteField.frobeniusAlgHom F K): (x, y) ↦ (x^q, y^q), 0 ↦ 0.
  *API:*
  - `frobeniusPointMap` (constructor): frobeniusPointMap W K : (W.baseChange K).toAffine.Point →+ (W.baseChange K).toAffine.Point.
  - `frobeniusPointMap_some` (simp): frobeniusPointMap W K (some x y h) = some (x^q) (y^q) _.
  - `frobeniusPointMap_injective` (other): frobeniusPointMap W K is injective.
  *Unit tests:*
  - `frobeniusPointMap_zero` (degenerate): frobeniusPointMap W K 0 = 0.
  - `frobeniusPointMap_of_rational` (characterisation): For K = F the map is the identity (x^q = x on F).
  - `frobeniusPointMap_ne_id` (non-example): Over K = GaloisField 3 2 and y² = x³ + x (over 𝔽₃), the map moves the point (i, 0) with i² = −1: i³ = −i ≠ i.
- **The trace modulo 2** (theorem, `two_dvd_card_add_one_sub_naivePointCount_iff`; node `FF.3/trace-modulo-two`).
  For q odd and W elliptic with a₁ = a₃ = 0: a_q = q + 1 − naivePointCount W is even iff f = weierstrassCubic W has a root in F iff gcd(X^q − X, f) ≠ 1.
  *Hypotheses:* F a finite field of odd characteristic; W elliptic, a₁ = a₃ = 0.
  *Proof:* q + 1 is even, so 2 | a_q iff #W(F) is even. #W(F) even iff the finite abelian group W(F) has an element of order 2 (Cauchy, Mathlib exists_prime_orderOf_dvd_card for the additive group), iff some (x0, 0) is a point, iff f(x0) = 0 (a point has order 2 iff y = 0 when a₁ = a₃ = 0). f has a root in F iff gcd(X^q − X, f) ≠ 1 (gcd-with-frobenius-power with k = 1, f square-free as W is elliptic).
- **The trace modulo ℓ is read off one nonzero ℓ-torsion point** (lemma, `modEq_of_frobenius_relation`; node `FF.3/trace-from-one-torsion-point`).
  Let K ⊇ F be a field, t ∈ ℤ with π(π P) − t π(P) + q P = 0 for all P ∈ W(K) (π = frobeniusPointMap W K), ℓ prime, P ≠ 0 with ℓ P = 0, and c ∈ ℤ with π(π P) − c π(P) + q P = 0. Then c ≡ t (mod ℓ).
  *Hypotheses:* F a finite field with q elements, K ⊇ F; the Frobenius relation with trace t on all points; ℓ prime; P ≠ 0, ℓ P = 0; π² P − c π P + q P = 0.
  *Proof:* Subtract the two relations: (c − t) π(P) = 0. π(P) ≠ 0 (π injective) and ℓ π(P) = π(ℓ P) = 0, so π(P) has order ℓ, which divides c − t.
- **Schoof's representatives of maps on ℓ-torsion points** (definition, `SchoofRep.Represents`; node `FF.3/schoof-representatives`).
  For g ∈ F[X], a representative is r ∈ Option (F[X]/(g) × F[X]/(g)) (the abbreviation SchoofRep g): none stands for the zero map and some (a, b) for (x, y) ↦ (a(x), b(x) y). r represents α : W(K) → W(K) (SchoofRep.Represents W K r α) if for every nonsingular affine point (x, y) of W over K with g(x) = 0: α(x, y) = 0 when r = none, and α(x, y) is the affine point (a(x), b(x) y) when r = some (a, b), where a(x) is the evaluation of a at the root x of g (Mathlib AdjoinRoot.liftAlgHom).
  *API:*
  - `SchoofRep.represents_none_zero` (example): none represents the zero map.
  - `SchoofRep.represents_id` (example): some (X, 1) represents the identity.
  - `SchoofRep.represents_frobenius` (other): The Frobenius representative represents π (lemma node schoof-frobenius-representative-represents).
  - `SchoofRep.Represents.add_of_isUnit` (relation): Chord rule (lemma node schoof-chord-rule-represents-sum).
  - `SchoofRep.Represents.add_neg` (relation): Opposite representatives sum to the zero map (lemma node schoof-opposite-representatives).
  - `SchoofRep.Represents.comp_frobenius` (functoriality): Composition with π is the q-th power (lemma node schoof-composition-with-frobenius).
  *Unit tests:*
  - `schoofRep_none_represents_zero_only` (non-example): If some root of g is the x-coordinate of a point, none does not represent the identity.
  - `schoofRep_represents_id_one` (computation): (X, 1) represents the identity for g = X³ + X (and for every g).
  - `schoofRep_represents_none_iff` (characterisation): none represents α iff α vanishes at every point whose x-coordinate is a root of g.
- **The representative of Frobenius** (construction, `schoofFrobeniusRep`; node `FF.3/schoof-frobenius-representative`).
  schoofFrobeniusRep W g = some (X^q mod g, f^((q−1)/2) mod g), f = weierstrassCubic W.
  *API:*
  - `schoofFrobeniusRep` (constructor): schoofFrobeniusRep W g : SchoofRep g.
  - `SchoofRep.represents_frobenius` (characterisation): It represents frobeniusPointMap W K (lemma node).
  - `schoofFrobeniusRep_eq_modByMonic` (simp): For monic g, schoofFrobeniusRep W g = some ([X^q mod g], [f^((q−1)/2) mod g]): it depends only on the reductions modulo g.
  *Unit tests:*
  - `schoofFrobeniusRep_zmod_three` (computation): For y² = x³ + x over 𝔽₃, g = X³ + X: (X³ mod g, (X³ + X) mod g) = (−X, 0).
  - `schoofFrobeniusRep_one` (degenerate): For g = 1 the quotient is trivial and schoofFrobeniusRep W 1 = some (0, 0).
  - `schoofFrobeniusRep_ne_id` (non-example): For y² = x³ + x over 𝔽₃ and g = X² + 1, the Frobenius representative (−X, 0) is not the identity's (X, 1): Frobenius moves the points with x² = −1.
- **The Frobenius representative represents Frobenius** (lemma, `SchoofRep.represents_frobenius`; node `FF.3/schoof-frobenius-representative-represents`).
  For q odd, a₁ = a₃ = 0, any g and any K ⊇ F: schoofFrobeniusRep W g represents frobeniusPointMap W K.
  *Hypotheses:* F of odd characteristic; W with a₁ = a₃ = 0.
  *Proof:* At a point (x, y) with g(x) = 0: π(x, y) = (x^q, y^q) (Mathlib Point.map_some along the q-power map). y^q = y (y²)^((q−1)/2) = y f(x)^((q−1)/2), and the class of X^q evaluates to x^q.
- **Composition with Frobenius is the q-th power** (lemma, `SchoofRep.Represents.comp_frobenius`; node `FF.3/schoof-composition-with-frobenius`).
  If some (a, b) represents α, then some (a^q, b^q · f^((q−1)/2)) represents α ∘ π (powers in F[X]/(g)).
  *Hypotheses:* F of odd characteristic; W with a₁ = a₃ = 0; some (a, b) represents α.
  *Proof:* For a = [h], h(x^q) = h(x)^q since the coefficients lie in F (FiniteField.frobeniusAlgHom is an F-algebra map), so [h(X^q)] = [h]^q in F[X]/(g). π maps the points with g(x) = 0 to points with g(x^q) = g(x)^q = 0, so the representation hypothesis applies at π(P); combine with the Frobenius representative (Sutherland's composition rule).
- **The chord rule on Schoof representatives** (construction, `schoofChordRep`; node `FF.3/schoof-chord-rule`).
  For p1 = (a1, b1), p2 = (a2, b2) in (F[X]/(g))², schoofChordRep W p1 p2 = (a3, r (a1 − a3) − b1) with r = (b1 − b2)(a1 − a2)⁻¹ and a3 = r² f − a₂ − a1 − a2 (a₂ the curve coefficient); it is Mathlib's addX/addY with slope r y when a₁ = a₃ = 0, meaningful when a1 − a2 is a unit.
  *API:*
  - `schoofChordRep` (constructor): schoofChordRep W p1 p2 : (F[X]/(g))².
  - `SchoofRep.Represents.add_of_isUnit` (characterisation): If a1 − a2 is a unit it represents the sum (lemma node).
  - `schoofChordRep_fst` (simp): (schoofChordRep W p1 p2).1 = r² f − a₂ − a1 − a2 with r = (b1 − b2)(a1 − a2)⁻¹.
  *Unit tests:*
  - `schoofChordRep_comm` (characterisation): When a1 − a2 is a unit, schoofChordRep W p1 p2 and schoofChordRep W p2 p1 have the same first component (the chord through two points is symmetric).
  - `schoofChordRep_not_unit` (non-example): If a1 = a2 the inverse is Ring.inverse 0 = 0, so r = 0 and the output (−a₂ − 2a1, −b1) is not the sum: the unit hypothesis is needed.
  - `schoofChordRep_zero_g` (degenerate): For g = 1 the ring F[X]/(1) is trivial and every representative is zero.
- **The chord rule represents the sum** (lemma, `SchoofRep.Represents.add_of_isUnit`; node `FF.3/schoof-chord-rule-represents-sum`).
  If some p1 represents α1, some p2 represents α2, and a1 − a2 is a unit in F[X]/(g), then some (schoofChordRep W p1 p2) represents P ↦ α1(P) + α2(P).
  *Hypotheses:* W with a₁ = a₃ = 0; p1, p2 represent α1, α2; IsUnit (a1 − a2).
  *Proof:* At a point with g(x) = 0, a1(x) − a2(x) ≠ 0 (a unit evaluates to a unit), so α1(P) and α2(P) have different x-coordinates and Mathlib's add_of_X_ne gives the sum by the chord formula with slope (b1(x) − b2(x)) y/(a1(x) − a2(x)). Its square is r(x)² y² = r(x)² f(x), giving the representative's x-coordinate; the y-coordinate likewise.
- **Opposite representatives sum to zero** (lemma, `SchoofRep.Represents.add_neg`; node `FF.3/schoof-opposite-representatives`).
  If some (a, b) represents α1 and some (a, −b) represents α2 (a₁ = a₃ = 0), then none represents P ↦ α1(P) + α2(P).
  *Hypotheses:* W with a₁ = a₃ = 0.
  *Proof:* At each point the two values are (x′, y′) and (x′, −y′), opposite points (negY = −y when a₁ = a₃ = 0), whose sum is 0 (Mathlib add_of_Y_eq).
- **The ℓ-division polynomial is separable for ℓ ∤ q** (lemma, `separable_preΨ_of_card_torsion`; node `FF.3/separability-of-division-polynomials`).
  Let W be elliptic over F, K ⊇ F algebraically closed, ℓ an odd prime with ℓ ≠ char F. If #W(K)[ℓ] = ℓ² (EllipticCurves layer 2: W(K)[ℓ] ≃ (ℤ/ℓ)²), then preΨ_ℓ (Mathlib's ℓ-division polynomial, a polynomial in x for odd ℓ) is separable.
  *Hypotheses:* W elliptic over F; K algebraically closed containing F; ℓ odd prime, (ℓ : F) ≠ 0; #W(K)[ℓ] = ℓ².
  *Proof:* For odd ℓ, Mathlib's Ψ_ℓ = C preΨ_ℓ, and on the curve ψ_ℓ(x, y) = Ψ_ℓ(x, y) = preΨ_ℓ(x) (Tau Ceti evalEval_ψ_eq_evalEval_Ψ); a nonzero affine point P = (x, y) satisfies ℓ P = 0 iff preΨ_ℓ(x) = 0 (Tau Ceti zsmul_eq_zero_of_evalEval_ψ_eq_zero and evalEval_ψ_eq_zero_of_zsmul_eq_zero). The ℓ² − 1 nonzero ℓ-torsion points come in pairs ±P with distinct y (y ≠ 0 since 2 ∤ ℓ), giving (ℓ² − 1)/2 distinct roots of preΨ_ℓ in K. deg preΨ_ℓ = (ℓ² − 1)/2 with leading coefficient ℓ ≠ 0 (Mathlib natDegree_preΨ, leadingCoeff_preΨ), so all roots are simple.
  *Imports from Tau Ceti:* `layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.
- **Algorithm 8.3: the trace modulo an odd prime ℓ** (construction, `schoofTraceModPrime`; node `FF.3/schoof-trace-modulo-prime-algorithm`).
  schoofTraceModPrime W ℓ : Option (ZMod ℓ) is Sutherland's Algorithm 8.3 for q odd, a₁ = a₃ = 0 and an odd prime ℓ ∤ q: with h = preΨ_ℓ, compute the representatives π_ℓ, π_ℓ² and π_ℓ² + q̄ (q̄ = q mod ℓ, by double-and-add with the chord and tangent rules), then 0, π_ℓ, 2π_ℓ, …, until c π_ℓ = π_ℓ² + q̄ for some c < ℓ, and return c; whenever a denominator is not a unit, replace h by the factor gcd(v, h) or h/gcd(v, h) of smaller degree and restart; return none if no c < ℓ is found.
  *API:*
  - `schoofTraceModPrime_sound` (characterisation): A returned value is a_q mod ℓ (theorem node).
  - `schoofTraceModPrime_isSome` (other): It returns a value when preΨ_ℓ is separable (theorem node).
  - `schoofTraceModPrime` (constructor): schoofTraceModPrime W ℓ : Option (ZMod ℓ).
  *Unit tests:*
  - `schoofTraceModPrime_x_cubed_add_x_add_one_three` (computation): For y² = x³ + x + 1 over 𝔽₅ (a₅ = −3), schoofTraceModPrime W 3 = some 0.
  - `schoofTraceModPrime_x_cubed_add_x_add_one_seven` (computation): For y² = x³ + x + 1 over 𝔽₅, schoofTraceModPrime W 7 = some 4 (−3 ≡ 4 mod 7).
  - `schoofTraceModPrime_char` (non-example): Over 𝔽₅ the 5-division polynomial of y² = x³ + x + 1 has degree < 12 = (5² − 1)/2: for ℓ = char F the degree formula fails, which is why Algorithm 8.3 requires ℓ ∤ q.
- **Soundness of Algorithm 8.3** (theorem, `schoofTraceModPrime_sound`; node `FF.3/schoof-trace-modulo-prime-sound`).
  For q odd, W elliptic with a₁ = a₃ = 0, ℓ an odd prime with ℓ ∤ q, and K ⊇ F algebraically closed: if schoofTraceModPrime W ℓ = some c then c = a_q mod ℓ.
  *Hypotheses:* F of odd characteristic; W elliptic, a₁ = a₃ = 0; ℓ odd prime, (ℓ : F) ≠ 0; the Frobenius relation of layer 3 on W(K).
  *Proof:* Every computed representative represents the intended map on the points with h(x) = 0 (Frobenius, composition, chord, opposite and tangent lemmas; restarting with a factor of h restricts the set of points). The final h has positive degree, so it has a root x0 ∈ K; with y0² = f(x0) the point P = (x0, y0) is nonsingular (W elliptic) and nonzero with ℓP = 0 (h | preΨ_ℓ and Tau Ceti's zsmul_eq_zero_of_evalEval_ψ_eq_zero). The returned c satisfies π²(P) − c π(P) + q P = 0 (q̄ P = q P as ℓ P = 0); by the torsion-point lemma and layer 3's relation with trace a_q, c ≡ a_q (mod ℓ).
  *Imports from Tau Ceti:* `layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.
- **Completeness of Algorithm 8.3** (theorem, `schoofTraceModPrime_isSome`; node `FF.3/schoof-trace-modulo-prime-complete`).
  Under the hypotheses of soundness, if preΨ_ℓ is separable then schoofTraceModPrime W ℓ returns a value.
  *Hypotheses:* as for soundness; preΨ_ℓ separable (a consequence of layer 2, node separability-of-division-polynomials).
  *Proof:* For c = a_q mod ℓ the two maps c π and π² + q̄ agree on every point with h(x) = 0 (layer 3's relation). Two representatives that agree at every root of a separable h (in K) are equal modulo h (a polynomial vanishing at all the distinct roots of the square-free h is divisible by h); hence the equality test succeeds at c = a_q mod ℓ < ℓ.
  *Imports from Tau Ceti:* `layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.
- **Reconstruction of the trace from its residues** (lemma, `eq_of_modEq_of_sq_le`; node `FF.3/trace-reconstruction-from-residues`).
  If t, t′ ∈ ℤ satisfy t² ≤ 4q, t′² ≤ 4q, t ≡ t′ (mod M) and M² > 16q, then t = t′. Hence the symmetric residue of a_q modulo M = ∏ ℓ > 4√q is a_q.
  *Hypotheses:* q, M ∈ ℕ; t² ≤ 4q, t′² ≤ 4q; 16q < M²; t ≡ t′ (mod M).
  *Proof:* |t − t′| ≤ 4√q < M and M | t − t′, so t = t′.
- **Schoof's algorithm** (construction, `schoofPointCount`; node `FF.3/schoof-algorithm`; planet *Schoof's algorithm*).
  schoofPointCount W : ℤ is Sutherland's Algorithm 8.1 for q odd and a₁ = a₃ = 0: t₂ from gcd(X^q − X, f); for odd primes ℓ ∤ q in increasing order, t_ℓ = schoofTraceModPrime W ℓ, combined by the Chinese remainder theorem into t mod M until M = ∏ ℓ > 4√q; t is the symmetric residue; the output is q + 1 − t.
  *API:*
  - `schoofPointCount` (constructor): schoofPointCount W : ℤ.
  - `schoofPointCount_eq` (characterisation): schoofPointCount W = naivePointCount W (theorem node schoof-algorithm-correct).
  - `schoofPointCount_eq_card_point` (compatibility): Under the same hypotheses, schoofPointCount W = Nat.card W.toAffine.Point (Mathlib's point type), and q + 1 − schoofPointCount W = Tau Ceti's frobeniusTrace W.
  *Unit tests:*
  - `schoofPointCount_x_cubed_add_x_add_one_zmod_five` (computation): For y² = x³ + x + 1 over 𝔽₅, schoofPointCount = 9.
  - `schoofPointCount_zmod_seven` (computation): For y² = x³ + 2x + 3 over 𝔽₇, schoofPointCount = 6.
  - `schoofPointCount_in_hasse_interval` (characterisation): For elliptic W, (q + 1 − schoofPointCount W)² ≤ 4q.
- **Correctness of Schoof's algorithm** (theorem, `schoofPointCount_eq`; node `FF.3/schoof-algorithm-correct`).
  For q odd and W elliptic with a₁ = a₃ = 0: schoofPointCount W = naivePointCount W (= pointCount W); equivalently the algorithm returns a_q = frobeniusTrace W exactly.
  *Hypotheses:* F of odd characteristic; W elliptic, a₁ = a₃ = 0.
  *Proof:* t₂ correct (trace modulo 2); each t_ℓ returned and correct (soundness and completeness, with separability from layer 2 and the Frobenius relation from layer 3). The CRT invariant t ≡ a_q (mod M) holds throughout (Sutherland step 2b). With M > 4√q and a_q² ≤ 4q (Hasse, layer 3), the reconstruction lemma gives t = a_q.
  *Imports from Tau Ceti:* `layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.

### 3K. Costs

Each statement is in CN.0's algebraic cost model (see Conventions) and is separate from correctness and from the probability of success.

- **Cost of Algorithm SFD** (theorem, (cost statement; no declaration); node `FF.3/square-free-decomposition-algorithm-cost`).
  On a monic input of degree ℓ over F with q = p^w, Algorithm SFD performs O(ℓ² + ℓ(w − 1) len(p)/p) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); every loop terminates, the outer loop after at most ⌊log_p ℓ⌋ + 1 passes.
  *Hypotheses:* F a finite field with q = p^w elements; f monic of degree ℓ ≥ 1.
  *Proof:* First pass: computing f/gcd(f, f') costs O(ℓ²) (Euclid, Shoup Theorem 17.3); the j-th inner iteration costs O(ℓ Σ_{i∈S, ei≥j} deg fi), and summing over j gives O(ℓ Σ ei deg fi) = O(ℓ²). A p-th root costs O(ℓ(w − 1) len(p)/p): the coefficient a ↦ a^(p^(w−1)) by repeated squaring, for the ℓ/p coefficients. Pass t works on a polynomial of degree ≤ ℓ/p^(t−1); sum the geometric series. Polynomial arithmetic costs are CN.0's (requested).
- **Cost of Algorithm DDF** (theorem, (cost statement; no declaration); node `FF.3/distinct-degree-factorization-algorithm-cost`).
  On a monic square-free input of degree ℓ, Algorithm DDF performs O(ℓ³ len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); its main loop runs at most ℓ times.
  *Hypotheses:* F a finite field with q elements; f monic, square-free, of degree ℓ ≥ 1.
  *Proof:* At most ℓ iterations; each q-th powering costs O(len(q)) multiplications modulo f, i.e. O(ℓ² len(q)) operations (Shoup §17.1); each gcd and division costs O(ℓ²) (Theorem 17.3). Polynomial arithmetic costs are CN.0's (requested).
- **Cost of Algorithm IPT** (theorem, (cost statement; no declaration); node `FF.3/irreducibility-test-cost`).
  On a monic input of degree ℓ, Algorithm IPT performs O(ℓ³ len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); with the standard presentations of FF.0 this is O(ℓ³ len(q)³) bit operations.
  *Hypotheses:* F a finite field with q elements; f monic of degree ℓ ≥ 1.
  *Proof:* ⌊ℓ/2⌋ iterations, each a q-th powering modulo f (O(ℓ² len(q))) and a gcd (O(ℓ²)). Each operation in F costs O(len(q)²) bit operations for the FF.0 presentations (CN.0).
- **Cost of generating and of checking a Rabin certificate** (theorem, (cost statement; no declaration); node `FF.3/rabin-certificate-generation-cost`).
  For f monic of degree ℓ, generating the certificate costs O(ℓ³ len(q)) operations in F and checking it costs O(ℓ³ len(q)) operations, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); checking replaces the ω(ℓ) gcd computations of the test by ω(ℓ) products and one comparison each.
  *Hypotheses:* F a finite field with q elements; f monic of degree ℓ ≥ 1.
  *Proof:* ℓ successive q-th powerings modulo f cost O(ℓ³ len(q)) (Shoup Theorem 20.1's count); ω(ℓ) ≤ log₂ ℓ extended Euclid calls cost O(ℓ²) each (Theorem 17.5). Checking recomputes the same powers and ω(ℓ) products of degree < 2ℓ, O(ℓ²) each.
- **Expected cost of Algorithm EDF** (theorem, (cost statement; no declaration); node `FF.3/equal-degree-factorization-cost`).
  Algorithm EDF on f of degree ℓ with r = ℓ/k factors of degree k uses an expected number of O(k ℓ² len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); each round costs O(k ℓ² len(q)).
  *Hypotheses:* F a finite field with q elements; f monic, square-free, all irreducible factors of degree k.
  *Proof:* A round computes M_k(a mod h) for every h ∈ H by repeated squaring: O(k deg(h)² len(q)) each, O(k ℓ² len(q)) in total. Finer count (Shoup, proof of Theorem 20.7): with S = Σ_n Σ_{h∈H_n} ω(h)², the cost is O(S k³ len(q)) and E[S] = Σ_{i≠j} E[L_ij] + r E[L] = O(r²), using E[L_ij] ≤ 2 (q even) or ≤ 9/4 (q odd) and the expected-rounds node. Polynomial arithmetic costs and the expected-cost semantics are CN.0's (requested).
- **Expected cost of the Cantor–Zassenhaus algorithm** (theorem, (cost statement; no declaration); node `FF.3/cantor-zassenhaus-cost`).
  The Cantor–Zassenhaus algorithm (run until every block is finished) on a monic input of degree ℓ over F uses an expected number of O(ℓ³ len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); with the standard presentations of FF.0, O(ℓ³ len(q)³) expected bit operations.
  *Hypotheses:* F a finite field with q elements; f monic of degree ℓ ≥ 1.
  *Proof:* SFD O(ℓ² + ℓ(w − 1)len(p)/p), DDF O(ℓ³ len(q)), and EDF on blocks of degrees ℓ_i with Σ ℓ_i ≤ ℓ: O(Σ ℓ_i³ len(q)) = O(ℓ³ len(q)). Each operation in F is O(len(q)²) bit operations for the FF.0 presentations (CN.0).
- **Cost of Berlekamp's algorithm** (theorem, (cost statement; no declaration); node `FF.3/berlekamp-algorithm-cost`).
  Algorithm B1 uses O(ℓ³ + ℓ² len(q)) operations in F; Algorithm B2 uses an expected O(len(r) ℓ² len(q)); Berlekamp's algorithm uses an expected O(ℓ³ + ℓ² len(ℓ) len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction).
  *Hypotheses:* F a finite field with q elements; f monic of degree ℓ.
  *Proof:* B1: X^q mod f by repeated squaring O(ℓ² len(q)); ℓ further multiplications for the rows O(ℓ³); Gaussian elimination O(ℓ³) (CN.0, Shoup §14.4). B2: each round O(ℓ² len(q)); expected rounds O(len(r)) as for EDF (pair failure ≤ 5/9). Add SFD; costs in CN.0's model (requested).
- **Expected cost of Algorithm RIP** (theorem, (cost statement; no declaration); node `FF.3/random-irreducible-polynomial-cost`).
  Algorithm RIP uses an expected number of O(ℓ⁴ len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction).
  *Hypotheses:* F a finite field with q elements; ℓ ≥ 1.
  *Proof:* Generate-and-test (Shoup Theorem 9.3 (ii), requested from CN.0): expected cost = cost of one attempt × expected attempts = O(ℓ³ len(q)) · O(ℓ).
- **Cost of linear Hensel lifting** (theorem, (cost statement; no declaration); node `FF.3/hensel-lifting-algorithm-cost`).
  Lifting a factorization f ≡ g0 h0 (mod p) with deg f = n from p to p^k by the linear algorithm uses one extended Euclidean computation in 𝔽_p[X] (O(n²) operations in 𝔽_p) and O(k n²) operations in ℤ/p^kℤ, in the algebraic cost model of ComputationalNumberTheory CN.0 over ℤ/p^kℤ; hence O(k n² len(p^k)²) bit operations.
  *Hypotheses:* p prime, k ≥ 1; f monic of degree n over ℤ/p^k.
  *Proof:* Bézout coefficients modulo p: extended Euclid (Shoup Theorem 17.5). Each of the k − 1 steps: one product g h, products t e and s e, one division by the monic g, all of degrees ≤ 2n: O(n²) ring operations (Shoup Theorem 17.1). Each ring operation in ℤ/p^k costs O(len(p^k)²) bit operations (Shoup §3.4).
- **Cost of naive and of certified counting** (theorem, (cost statement; no declaration); node `FF.3/naive-point-count-cost`).
  naivePointCount by enumeration uses O(q²) operations in F; with a table of squares, O(q) operations in F; checking a point-count certificate uses O(q + len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction).
  *Hypotheses:* F a finite field with q elements; W with a₁ = a₃ = 0 for the certificate.
  *Proof:* q² evaluations of the equation (Sutherland §7.3). A table of the q squares, then q look-ups (Sutherland §7.3). Checker: one exponentiation c^((q−1)/2) by repeated squaring (O(len(q))) and 2q multiplications.
- **Cost of Schoof's algorithm** (theorem, (cost statement; no declaration); node `FF.3/schoof-algorithm-cost`).
  Over a prime field 𝔽_p, Schoof's algorithm uses O(log⁸ p) bit operations with schoolbook multiplication (Schoof 1995, §5); over 𝔽_q with q odd its running time is bounded by a polynomial in log q (Sutherland Lecture 8 §8.4): O(log q) primes ℓ = O(log q) are used, and Algorithm 8.3 works with polynomials of degree < ℓ² over F; costs in the model of ComputationalNumberTheory CN.0.
  *Hypotheses:* q odd; W elliptic, a₁ = a₃ = 0.
  *Proof:* Number of primes: Π_{ℓ ≤ L} ℓ > 4√q for L = O(log q) (Chebyshev's bound, a weak prime number theorem). Per ℓ: x^q modulo h costs O(log q) multiplications of polynomials of degree < ℓ², each O(ℓ⁴) operations in F; ℓ chord additions; O(log ℓ) restarts. Per operation in F, O(log² q) bit operations (FF.0 presentations); multiply out.

### Boundaries

- WeilConjectures WC.1 owns the closed-point relation `N_r = Σ_{m|r} m a_m` and its Möbius inversion for
  varieties over `𝔽_q`; on the affine line `a_m = Π_F(m)` and `N_r = q^r`, so Gauss's count here is that
  case, proved by Shoup's elementary route with the explicit bounds the Bary-Soroker–Koukoulopoulos–Kozma
  route needs; WC.1's affine-line example can cite `FF.3/gauss-count-formula`.
- WeilConjectures WC.5 owns point-count bounds for general curves and varieties; FF.3's error bounds are the
  elliptic Hasse bound (imported from EllipticCurves layer 3) and the Weil bound for `y² = f(x)` through FF.2's
  character-sum estimate.
- EllipticCurves layer 3 owns the zeta function of `E/𝔽_q`, the trace sequence and point counts over
  extensions `𝔽_{q^n}`; FF.3 counts over the base field only.
- ClassicalArithmeticCompletion CA.3 owns irreducibility criteria over `ℤ` and `ℚ` (Capelli, Perron, Cohn,
  Eisenstein–Dumas) and matrix normal forms over `ℤ`; ComputationalNumberTheory CN.1 owns the recombination
  of Hensel-lifted factors into factors over `ℤ`.

### Dependencies

- Inside the roadmap: FF.0 (`FF.0/rabin-irreducibility-criterion`, `FF.0/rabin-irreducibility-certificate`,
  `FF.0/certified-presentation-of-a-finite-field`) and FF.2 (`FF.2/weil-bound-multiplicative`, for the error
  bound of `y² = f(x)`). FF.1's characters enter only through Mathlib's quadratic character.
- Tau Ceti: EllipticCurves layer 3 (Hasse bound; Frobenius relation on points), layer 2 (`#E[ℓ] = ℓ²`), each
  with a request.
- ComputationalNumberTheory CN.0: the cost model with polynomial-arithmetic and Gaussian-elimination costs,
  and executable presentations with refinement lemmas (two requests).
- Consumers: ComputationalNumberTheory CN.1 (factorization modulo `p` and Hensel lifting for integer
  polynomials), CN.2 (factor degrees modulo `p` for prime decomposition), CN.3 (certified point counts);
  FF.4 (factorization of `Xⁿ − 1`, irreducible polynomials for Galois rings); FF.5 (certificates in CN.5's
  schema); ArithmeticStatisticsPartIIRandomPolynomials (the prime polynomial theorem and the count with
  prescribed constant coefficient); ArithmeticStatistics ST.4, ST.5 and HabiroNahmSeries HB.10 (lifting coprime
  factorizations over `ℤ_ℓ`, now cited through `hensel-lifting-over-complete-rings`).

### Acceptance tests

- **Factor products and irreducibility witnesses are checked.** `FactorizationCertificate.check` verifies
  `C c · ∏ gᵢ^eᵢ = f`, distinct factors and an FF.0 Rabin certificate for each; soundness identifies the
  certificate with Mathlib's `normalizedFactors`, and the unit test
  `factorizationCertificate_product_only_fails` shows that the unsplit product `X² + X` over `𝔽₂` is rejected.
  Every completed outcome of `certifiedFactorization` checks.
- **Reconstruction and irreducibility of algorithm outputs.** Every completed outcome of `cantorZassenhaus`
  and `berlekampFactor` equals `normalizedFactors f`; on `X⁵ − X − 1` over `𝔽₂` both return
  `{X² + X + 1, X³ + X² + 1}`, and Algorithm DDF returns the degree blocks `2, 3`, agreeing with Tau Ceti's
  `factorDegrees_X_pow_five_sub_X_sub_one_two`; Algorithm IPT accepts `X⁵ − X − 1` over `𝔽₅`, agreeing with
  Tau Ceti's hand proof.
- **Termination and probability kept separate.** Failure probabilities are bounded by `C(r, 2)(5/9)^n`,
  expected rounds by `2 log₂ r + 2` (`q` even) and `2 log_{9/5} r + 4` (`q` odd), RIP's expected attempts by
  `2ℓ`; the one-round splitting probability of `X² + X` over `𝔽₂` is exactly `1/2`.
- **Hensel lifting.** `X² + 1 ≡ (X − 2)(X + 2) mod 5` lifts uniquely to `(X − 7)(X + 7)` modulo `25`, and the
  algorithm's first step reproduces it; without coprimality uniqueness fails (`X² + 4` modulo `8`).
- **Point counts agree with the trace convention and a provable error bound.** `naivePointCount = pointCount`,
  the character-sum formula gives `a_q = −Σ χ(f(x))`, point-count certificates check in `O(q)` operations
  and are sound; `y² = x³ + x + 1` over `𝔽₅` has `9` points (`a₅ = −3`), certified; every count of an
  elliptic model satisfies `(q + 1 − #W(F))² ≤ 4q` (Hasse, imported), and square-free `y² = f(x)` satisfies
  the Weil bound `(deg f − 1)√q` (FF.2). Schoof's algorithm returns `9` on the same curve, with `t ≡ 0 mod 3`
  and `t ≡ 4 mod 7`.
- **The count of irreducible polynomials.** `Π_{𝔽₂}(4) = 3`, `Π_{𝔽₃}(3) = 8`; the Möbius formula gives
  Shoup's Exercise 19.2 value `Π_{𝔽₂}(30) = 35790267`; the prescribed-constant counts over `𝔽₃` in degree 2 are
  `1` and `2` for `b = 1, 2`.

---

## FF.4 Finite rings, sequences and codes

This layer builds the finite rings, polynomial maps, sequences and codes that rest on finite fields:
- **Galois rings** `GR(p^n, r)`, modelled as truncated Witt vectors over `GaloisField p r`, with their local structure,
  Teichmüller section and expansions, unit groups, Frobenius and Galois group, the presentation
  `(ℤ/p^n)[X]/(f)` by a basic irreducible `f`, uniqueness, ideals, Galois subrings and trace;
- **q-linearized polynomials** (roots form subspaces, composition, separability, subspace polynomials, the
  linearized q-associate) and **permutation polynomials** (Hermite's criterion, the character criterion, monomials,
  and Dickson's theorem: `D_n(x, a)` permutes `F_q` iff `gcd(n, q² − 1) = 1`);
- **linear recurring sequences** over finite fields: least periods, the order of a polynomial, period = order for
  irreducible characteristic polynomials, the trace representation, **m-sequences** (state cycle, balance,
  shift-and-add, two-level autocorrelation), Dirichlet and Legendre sequences, and the character-sum form of the
  cross-correlation of an m-sequence with a decimation;
- **evaluation codes**: the Singleton bound and MDS codes, Reed–Solomon and generalized Reed–Solomon codes with their
  duals and check equations, subfield subcodes and primitive narrow-sense **BCH codes** (BCH bound, dimension bounds),
  with the field-size restriction `n ≤ q` and the length `n = q^m − 1` pinned; and **algebraic geometry codes**
  `C_L(D, G)` and `C_Ω(D, G)` on Tau Ceti's function fields (dimension, Goppa bound, genus defect, duality, the
  Reed–Solomon comparison);
- **Terras's finite upper half-plane** `H_q` with the `GL(2, F_q)` action, the invariant distance, the graphs
  `X_q(δ, a)` and their regularity, Hecke operators with pinned measures, Gelfand's trick and the Gelfand pair
  `(GL(2, F_q), K)`; the Ramanujan property is a recorded gap (Katz's estimate).

The reviewed audit finds Galois rings only implicitly (as truncated Witt vectors), linear codes with generator matrices
and Riemann–Roch spaces in Tau Ceti, and the Hamming distance in Mathlib; everything else in the list is missing and is
built here. The Fourier analysis on `ℤ` and on the Laurent torus of Bary-Soroker–Koukoulopoulos–Kozma (route 3 of its
extraction) is planned in FF.1 and is not repeated here.

### Conventions

- `F` is a finite field with `q = p^w` elements; `GaloisField p r` is the field with `p^r` elements; `Tr` and `N` are
  Mathlib's `Algebra.trace` and `Algebra.norm`.
- **Galois rings.** `GaloisRing p n r := TruncatedWittVector p n (GaloisField p r)`; it is a `ZMod (p^n)`-algebra by
  the unique ring map, `GaloisRing p n 1 ≃+* ZMod (p^n)` and `GaloisRing p 1 r ≃+* GaloisField p r`; the reduction
  `GR(p^n, r) → GR(p^m, r)` (`m ≤ n`) is truncation, and the residue map is reduction to length 1. A polynomial over a
  local ring is **basic irreducible** when it is monic with irreducible reduction (only monic polynomials are called
  basic irreducible). Theorems carry `1 ≤ n` and `1 ≤ r` where they need them.
- **q-polynomials.** `L = Σ a_i X^{q^i}` with `i ≥ 0`: `X` is linearized, nonzero constants are not; `q ≥ 2` in every
  theorem. The linearized q-associate of `Σ a_i X^i` is `Σ a_i X^{q^i}`.
- **Permutation polynomials.** A property of the evaluation map `F → F`; it depends only on `f mod (X^q − X)`.
  Dickson polynomials are Mathlib's `Polynomial.dickson 1 a n` (first kind).
- **Sequences** are indexed by `ℕ`. `seqShift s n = s (n + 1)` and `seqLeastPeriod s := Function.minimalPeriod seqShift s`,
  with Mathlib's junk value `0` for sequences that are not purely periodic. Recurrences are Mathlib's
  `LinearRecurrence` with `charPoly = X^m − Σ_{i<m} c_i X^i`; Goresky–Klapper's connection polynomial is its reciprocal,
  and every statement taken from them is converted. `polyOrder f := orderOf (AdjoinRoot.root f)` (the least `e ≥ 1`
  with `f ∣ X^e − 1` when `f(0) ≠ 0`, junk `0` otherwise). Primitivity of a polynomial in the sense of periods is
  `IsPrimitivePoly`, because Mathlib's `Polynomial.IsPrimitive` means content 1.
- **Correlation.** `periodicCorrelation T u v τ = Σ_{i<T} u(i)·conj(v(i + τ))`: the conjugate is on the shifted
  argument and the period `T` is explicit. For sequences in a finite abelian group and `χ : AddChar G ℂ`,
  `charCorrelation χ T a b τ = Σ_{i<T} χ(a_i − b_{i+τ})`. Dirichlet sequences take an explicit value `c` at
  multiples of `p` (Legendre sequences use `c = 1`), never Mathlib's `MulChar` value `0` silently.
- **Codes.** A linear code is `Submodule F (ι → F)` for a finite coordinate type `ι`, which is Tau Ceti's
  `TauCeti.LinearCode F ι`; weights are Mathlib's `hammingNorm`, the minimum distance follows AlgebraicCodingTheory
  layer 2 (with `d(⊥) = 0`), and the dual is the Euclidean orthogonal `LinearMap.BilinForm.orthogonal (dotProductBilin F F)`.
  Reed–Solomon messages are polynomials of degree `< k` (`Polynomial.degreeLT`), encoded by evaluation at `α : ι → F`;
  dimension and distance theorems assume `α` injective and `k ≤ #ι`, which forces `n ≤ q`. BCH codes are primitive and
  narrow-sense: `n = q^m − 1`, `γ` a generator of `E^×` for `[E : F] = m`, designed distance `δ`, defined as the
  subfield subcode of the Reed–Solomon code on the powers of `γ`.
- **Algebraic geometry codes.** `F/k` is a function field with exact constant field (Tau Ceti's `IsFunctionField k F`
  with `k` integrally closed in `F`); places, divisors, `L(G)`, the genus, Weil differentials `Ω_F(A)` and local
  components `ω_P` are Tau Ceti's. `D = P_1 + ⋯ + P_n` with distinct rational places outside the support of `G`;
  values at a rational place go through `TauCeti.Place.residueFieldEquivOfDegreeEqOne`, and the residue code uses
  `ω_{P_i}(1)`.
- **Finite upper half-plane.** `q` odd, `E ⊇ F` quadratic, `s ∈ E \ F` with `δ = s² ∈ F` (a nonsquare);
  `H = E \ F`, `z = x + y s` with `Im z = y ≠ 0` (Terras's `H_q`, a double cover of an upper half-plane; `Im` depends
  on `s`). `GL(2, F)` acts by Möbius transformations; `d(z, w) = N(z − w)/(Im z · Im w) ∈ F` (not a metric);
  `X_q(δ, a)` joins `z ≠ w` with `d(z, w) = a`. Hecke operators on a finite homogeneous space `X = G/K` use counting
  measure on `X` and counting measure divided by `|K|` on `G`.

### Already in the libraries (cited, not rebuilt)

- Witt vectors and finite fields (Mathlib): `TruncatedWittVector` with `TruncatedWittVector.card`, `zmodEquivTrunc`,
  `charP_zmod`, `truncate` and `coeff`; `WittVector.teichmuller`, `teichmuller_coeff_zero`, `map_teichmuller`,
  `frobenius_bijective`, `frobenius_eq_map_frobenius`, `verschiebung_frobenius`, `coeff_p_pow`,
  `coeff_p_pow_eq_zero`, `isUnit_of_coeff_zero_ne_zero`, `dvd_sub_sum_teichmuller_iterateFrobeniusEquiv_coeff`;
  `GaloisField` with `GaloisField.card` and `equivZmodP`; `HenselianLocalRing.TFAE`, `IsArtinianRing.isNilpotent_jacobson_bot`,
  `IsLocalRing.of_nonunits_add`; `AdjoinRoot` with `lift` and `powerBasis'`; `Algebra.trace_surjective`,
  `FiniteField.algebraMap_trace_eq_sum_pow`, `traceForm_nondegenerate`.
- Polynomials over finite fields: `Polynomial.expand`, `derivative`, `separable_def`, `rootSet`,
  `card_rootSet_eq_natDegree`, `nodup_roots`, `FiniteField.roots_X_pow_card_sub_X`, `add_pow_char_pow`,
  `FiniteField.frobenius_pow`, `FiniteField.pow_card`; power sums `FiniteField.sum_pow_lt_card_sub_one` and
  `sum_pow_units`; `FiniteField.card_image_polynomial_eval`; `powCoprime`; Dickson polynomials `Polynomial.dickson`,
  `dickson_add_two` and `dickson_one_one_eval_add_inv`.
- Sequences: `LinearRecurrence`, `IsSolution`, `charPoly`, `mkSol`, `solSpace`, `eq_mk_of_is_sol_of_eq_init`;
  `Function.minimalPeriod`, `IsPeriodicPt.minimalPeriod_dvd`, `isPeriodicPt_minimalPeriod`; `orderOf`,
  `orderOf_dvd_card`, `IsCyclic.exists_generator`.
- Codes: `hammingDist`, `hammingNorm`, `Matrix.vandermonde`, `Lagrange.interpolate` and `Lagrange.basis`,
  `Polynomial.degreeLT` and `degreeLTEquiv`, `LinearMap.BilinForm.orthogonal`, `dotProductBilin`,
  `Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero'`. Tau Ceti: `TauCeti.LinearCode`, `Matrix.generatedBy`;
  `TauCeti.Place` with `degree`, `integers`, `infty` and `residueFieldEquivOfDegreeEqOne`; `TauCeti.Divisor` with
  `degree`, `dim`, `indexOfSpecialty`; `TauCeti.riemannRochSpace`, `mem_riemannRochSpace_iff`,
  `riemannRochSpace_eq_bot_of_degree_neg`, `riemannRochSpace_zsmul_ofPoint_infty`; `TauCeti.genus` with
  `Divisor.degree_add_one_sub_genus_le_dim` and
  `Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree`; `TauCeti.weilDifferentialFiltration`,
  `finrank_weilDifferentialFiltration`, `exists_isRiemannRochDivisor`, `repartitionDualComponent`,
  `finsum_repartitionDualComponent_eq_zero` (the residue theorem) and
  `mem_weilDifferentialFiltration_iff_repartitionDualComponent_eq_zero`.
- Characters and harmonic analysis: `AddChar` with `sum_eq_zero_of_ne_one`, `sum_eq_ite`, `map_neg_eq_conj` and
  `complexBasis`; `ZMod.stdAddChar`, `ZMod.toCircle`, `ZMod.dft`; `MulChar`, `quadraticChar`,
  `quadraticChar_card_sqrts`, `quadraticChar_neg_one`, `FiniteField.isSquare_iff`; `Matrix.GeneralLinearGroup`;
  `MulAction.stabilizer` and `card_orbit_mul_card_stabilizer_eq_card_group`; `SimpleGraph.IsRegularOfDegree`.

### 4A. Galois rings

Goresky–Klapper, Chapter 4: §4.1 (finite local rings, basic irreducible polynomials, Hensel's lemma, units and the
Teichmüller set), §4.2 (the unit groups of `ℤ/p^n`), §4.4 (Galois theory of local rings, trace) and §4.5 (Galois
rings). Because the ring is defined as truncated Witt vectors, the presentation
`(ℤ/p^n)[X]/(f)` and the uniqueness of the unramified extension are theorems (Hensel lifting in a finite local ring),
not definitions. The structure of `1 + 2·GR(2^n, r)` for `r ≥ 2` is gap 1: the source states it without proof. The
source's claim that the `GR(p^n, e)` are all the subrings is false (E501) and is corrected to Galois subrings; its
claim that `GR(p^n, r)^×` always contains a cyclic subgroup of order `(p^r − 1)p^{n−1}` fails for `ℤ/2^n`, `n ≥ 3` (E505).


- **A finite commutative local ring is Henselian** (lemma; node `FF.4/finite-local-ring-is-henselian`).
  Let R be a finite commutative local ring. Then R is a Henselian local ring (Mathlib's HenselianLocalRing R): for every monic f ∈ R[X] and a₀ ∈ R with f(a₀) ∈ 𝔪_R and f′(a₀) a unit there is a ∈ R with f(a) = 0 and a − a₀ ∈ 𝔪_R. In particular (Goresky–Klapper, Lemma 4.1.1), if the reduction of a monic f has a simple root ā in the residue field, f has exactly one root in R reducing to ā (uniqueness: two roots reducing to ā differ by an element of 𝔪_R, and f′ is a unit at them).
  *Hypotheses:* R is a commutative ring with Finite R and IsLocalRing R. Only monic f are treated (the source's 'regular polynomial' case reduces to it after dividing by the unit leading coefficient).
  *Proof:* R is finite, hence Artinian; the Jacobson radical of an Artinian ring is nilpotent (mathlib:IsArtinianRing.isNilpotent_jacobson_bot), and for a local ring it is 𝔪_R, so 𝔪_R^N = 0 for some N. An ideal I with I^N = 0 makes R I-adically complete: the filtration I^n • ⊤ is eventually 0, so R is Hausdorff and every I-adic Cauchy sequence is eventually constant (IsAdicComplete I R, proved directly from the definitions of IsHausdorff and IsPrecomplete). Mathlib's instance IsAdicComplete.henselianRing (found by instance inference; it is not in the declaration index) gives HenselianRing R 𝔪_R, and mathlib:HenselianLocalRing.TFAE turns this into HenselianLocalRing R. Uniqueness of the lift: if a, b are roots reducing to ā and f′(a) is a unit then a − b is a unit or zero; it lies in 𝔪_R, so a = b (mathlib:IsLocalRing.eq_of_eval_eq_zero_of_not_isUnit_sub).
  *Source:* `gk-asrs`, Chapter 4, Section 4.1, Lemma 4.1.1, printed p. 96.
- **Basic irreducible polynomials over a local ring** (definition, `IsBasicIrreducible`; node `FF.4/basic-irreducible-polynomial`).
  Let R be a commutative local ring with residue map μ : R → k = R/𝔪_R. A polynomial f ∈ R[X] is basic irreducible, written IsBasicIrreducible f, if f is monic and its reduction map μ f ∈ k[X] is irreducible. Convention (pinned): only monic polynomials are called basic irreducible here, so deg μ(f) = deg f.
  *API:*
  - `IsBasicIrreducible` (constructor): IsBasicIrreducible f :↔ f.Monic ∧ Irreducible (f.map (IsLocalRing.residue R)).
  - `IsBasicIrreducible.monic` (projection): A basic irreducible polynomial is monic.
  - `IsBasicIrreducible.irreducible_map` (projection): Its reduction to the residue field is irreducible.
  - `IsBasicIrreducible.natDegree_map` (simp): (f.map μ).natDegree = f.natDegree.
  - `IsBasicIrreducible.irreducible` (characterisation): A basic irreducible polynomial is irreducible in R[X].
  - `IsBasicIrreducible.map_ringEquiv` (functoriality): Basic irreducibility is preserved by ring isomorphisms of local rings.
  *Unit tests:*
  - `IsBasicIrreducible.x_sq_add_x_add_one_zmod_four` (computation): X² + X + 1 ∈ (ZMod 4)[X] is basic irreducible (its reduction X² + X + 1 is irreducible over ZMod 2).
  - `IsBasicIrreducible.not_x_sq_add_one_zmod_twentyfive` (non-example): X² + 1 ∈ (ZMod 25)[X] is monic but not basic irreducible, since X² + 1 = (X − 2)(X + 2) over ZMod 5.
  - `IsBasicIrreducible.iff_of_field` (compatibility): For a field K, IsBasicIrreducible f ↔ f.Monic ∧ Irreducible f.
  - `IsBasicIrreducible.x_sub_c` (degenerate): X − C a is basic irreducible for every a ∈ R.
  *Used in:* Goresky–Klapper §4.5 (GR(p^n, d) is presented as (ℤ/p^n)[x]/(f) with f monic basic irreducible (node galois-ring-presentation)); Goresky–Klapper Proposition 6.6.5(1) (LFSR sequences over a finite local ring with a monic basic irreducible connection polynomial have a trace representation); FF.4/galois-ring-uniqueness (the lift of the minimal polynomial of a primitive residue element is basic irreducible).
  *Source:* `gk-asrs`, Chapter 4, Section 4.1, 'Basic irreducible polynomials', printed p. 95.
- **The Galois ring GR(p^n, r)** (definition, `GaloisRing`; node `FF.4/galois-ring`; planet *Galois rings GR(p^n, r)*).
  For a prime p and natural numbers n, r, the Galois ring is GaloisRing p n r := TruncatedWittVector p n (GaloisField p r), the ring of length-n truncated p-typical Witt vectors over the field with p^r elements. Conventions (pinned): GaloisRing p n r is a ZMod (p^n)-algebra through the unique ring map; GaloisRing p 1 r is identified with GaloisField p r and GaloisRing p n 1 with ZMod (p^n); the reduction GaloisRing p n r → GaloisRing p m r for m ≤ n is truncation of Witt vectors. For n, r ≥ 1 it is the unique unramified extension of ZMod (p^n) of degree r (nodes galois-ring-presentation, galois-ring-uniqueness).
  *API:*
  - `GaloisRing` (constructor): GaloisRing p n r := TruncatedWittVector p n (GaloisField p r), a commutative ring.
  - `GaloisRing.instFinite` (instance): GaloisRing p n r is finite.
  - `GaloisRing.algebraZMod` (instance): GaloisRing p n r is a ZMod (p^n)-algebra through the unique ring map (injective for r ≥ 1).
  - `GaloisRing.card_eq` (simp): For r ≠ 0, Nat.card (GaloisRing p n r) = p^(n·r).
  - `GaloisRing.charP` (instance): For r ≠ 0, GaloisRing p n r has characteristic p^n.
  - `GaloisRing.zmodEquiv` (equivalence): GaloisRing p n 1 ≃+* ZMod (p^n), compatible with truncation and zmodEquivTrunc.
  - `GaloisRing.oneEquiv` (equivalence): GaloisRing p 1 r ≃+* GaloisField p r.
  - `GaloisRing.reduction` (functoriality): For m ≤ n the truncation GaloisRing p n r →+* GaloisRing p m r; it is surjective with kernel p^m · GaloisRing p n r, and reduction ∘ reduction = reduction.
  - `GaloisRing.residue` (projection): The reduction to GaloisRing p 1 r = GaloisField p r (the residue map).
  - `GaloisRing.isLocalRing` (instance): For n, r ≥ 1, GaloisRing p n r is a local ring (node galois-ring-is-local).
  - `GaloisRing.isUnit_iff_coeff_zero_ne_zero` (characterisation): x is a unit iff its 0-th Witt coordinate is nonzero.
  - `GaloisRing.ker_residue` (characterisation): The kernel of the residue map is the ideal (p).
  *Unit tests:*
  - `GaloisRing.card_two_two_two` (computation): Nat.card (GaloisRing 2 2 2) = 16.
  - `GaloisRing.zmodEquiv_two_two` (compatibility): GaloisRing 2 2 1 ≃+* ZMod 4 (the degree-one Galois ring is ZMod (p^n)).
  - `GaloisRing.one_equiv_galoisField` (degenerate): GaloisRing p 1 r ≃+* GaloisField p r for every r.
  - `GaloisRing.not_isField_two_two_one` (non-example): GaloisRing 2 2 1 is not a field (it has the nonzero nilpotent 2), so it is not the field with four elements.
  *Used in:* Goresky–Klapper §6.6.b, Proposition 6.6.5(1) (S = GR(R, d) is the ring in which a basic irreducible connection polynomial splits, giving the trace representation of LFSR sequences over ZMod p^n); Goresky–Klapper §14.10.d 'ML sequences over Galois rings' (maximal-length sequences over ZMod p^n are traces of powers in GR(p^n, d)); FiniteFieldsAndCharacterSums:FF.4 target list (the Galois rings GR(p^n, r) themselves, with Teichmüller coordinates, Frobenius and Galois group); library audit, layer FF.4 (the audit notes the rings exist only implicitly as W_n(F_{p^r}); this node names and develops them).
  *Source:* `gk-asrs`, Chapter 4, Section 4.5, printed p. 109.
- **GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}** (lemma; node `FF.4/galois-ring-is-local`).
  Let p be prime, n ≥ 1, r ≥ 1. Then GaloisRing p n r is a local ring; x is a unit iff its 0-th Witt coordinate is nonzero; the maximal ideal equals p · GaloisRing p n r, which is the kernel of the residue map GaloisRing p n r → GaloisField p r (truncation to length 1); consequently IsLocalRing.ResidueField (GaloisRing p n r) ≃+* GaloisField p r and 𝔪^n = 0.
  *Hypotheses:* p prime, 1 ≤ n, 1 ≤ r.
  *Proof:* Units: lift x to a Witt vector x̃ with the same first n coordinates (WittVector.truncate is surjective); if x̃.coeff 0 ≠ 0 then x̃ is a unit (mathlib:WittVector.isUnit_of_coeff_zero_ne_zero), hence so is its truncation. Conversely the 0-th coordinate is a ring map to the field, so units have nonzero 0-th coordinate. Hence the non-units form the kernel of the 0-th coordinate map, an ideal, so the ring is local (IsLocalRing.of_nonunits_add). Kernel = p·GR: p = V∘F on W(k) for k of characteristic p (WittVector.verschiebung_frobenius) and F is bijective on W(k) for perfect k, so the Witt vectors with vanishing 0-th coordinate are exactly the multiples of p; truncate (mathlib:WittVector.coeff_p_pow shows p^i has its first nonzero coordinate at i). 𝔪^n = (p^n) = 0 because p^n has zero coordinates below n (mathlib:WittVector.coeff_p_pow_eq_zero).
  *Source:* `gk-asrs`, Chapter 4, Section 4.5, printed p. 109.
- **The Teichmüller section F_{p^r} → GR(p^n, r)** (construction, `GaloisRing.teichmuller`; node `FF.4/teichmuller-section-of-galois-ring`).
  For p prime and n, r ≥ 1, the Teichmüller map τ : GaloisField p r →* GaloisRing p n r is the composite of Mathlib's Teichmüller lift WittVector.teichmuller with truncation to length n. It is multiplicative with τ(0) = 0 and τ(1) = 1, the residue of τ(a) is a, and its image is the set T = {x ∈ GR : x^{p^r} = x}; τ restricted to the units is the unique group homomorphism F_{p^r}^× → GR^× splitting the residue map.
  *API:*
  - `GaloisRing.teichmuller` (constructor): τ : GaloisField p r →* GaloisRing p n r.
  - `GaloisRing.teichmuller_zero` (simp): τ 0 = 0.
  - `GaloisRing.residue_teichmuller` (simp): residue (τ a) = a.
  - `GaloisRing.teichmuller_pow_card` (simp): τ a ^ (p^r) = τ a.
  - `GaloisRing.mem_range_teichmuller_iff` (characterisation): x ∈ range τ ↔ x^(p^r) = x.
  - `GaloisRing.teichmuller_unique` (universal-property): Any monoid hom σ : F_{p^r} →* GR with residue ∘ σ = id equals τ.
  - `GaloisRing.reduction_teichmuller` (functoriality): Truncation to length m ≤ n commutes with τ.
  *Unit tests:*
  - `teichmuller.zmod_nine_two` (computation): Under GaloisRing 3 2 1 ≃+* ZMod 9, τ(2) corresponds to 8.
  - `teichmuller.residue` (characterisation): residue (τ a) = a for all a.
  - `teichmuller.not_additive` (non-example): In GaloisRing 2 2 1, τ 1 + τ 1 ≠ τ (1 + 1).
  - `teichmuller.length_one` (degenerate): For n = 1, τ is the identification GaloisField p r ≃ GaloisRing p 1 r.
  *Used in:* Goresky–Klapper Lemma 4.5.1 (the p-adic expansion uses coordinates in ι(K) = τ(F_{p^r})); Goresky–Klapper §4.5 (the unit group decomposes as ι(K^×) × (1 + M)); FF.4/galois-group-of-galois-ring (automorphisms preserve the Teichmüller set, so they are determined by their residue action).
  *Source:* `gk-asrs`, Chapter 4, Section 4.1.a, Lemma 4.1.4, printed p. 97.
- **Teichmüller (p-adic) expansion in GR(p^n, r)** (theorem; node `FF.4/p-adic-expansion-in-galois-ring`).
  Let p be prime and n, r ≥ 1. Every x ∈ GaloisRing p n r has a unique expansion x = ∑_{i<n} τ(a_i) p^i with a_0, …, a_{n−1} ∈ GaloisField p r; the a_i are the Witt coordinates of x raised to the powers p^{−i} (a_i = (x.coeff i)^{1/p^i}), and multiplication by τ(b) acts coordinatewise: τ(b)x = ∑ τ(b a_i) p^i.
  *Hypotheses:* p prime; n, r ≥ 1.
  *Proof:* Existence and uniqueness by induction on n, as in the source: (p^i GR)/(p^{i+1} GR) has p^r elements and the classes of τ(a) p^i, a ∈ F_{p^r}, are pairwise distinct (if τ(a)p^i ≡ τ(b)p^i then 1 − τ(b)τ(a)^{−1} ∈ 𝔪, forcing a = b since a Teichmüller element t with 1 − t non-unit is 1). Coordinate description: in W(k) with k perfect, ∑ τ(a_i) p^i has i-th coordinate a_i^{p^i} (p^i = V^i F^i; WittVector.coeff_p_pow and the Teichmüller series identity WittVector.dvd_sub_sum_teichmuller_iterateFrobeniusEquiv_coeff); truncate. Coordinatewise action of τ(b): multiply the expansion termwise, τ multiplicative.
  *Source:* `gk-asrs`, Chapter 4, Section 4.5, Lemma 4.5.1, printed p. 110.
- **Units of GR(p^n, r): Teichmüller part times principal units** (theorem; node `FF.4/units-of-galois-ring`).
  Let p be prime and n, r ≥ 1, S = GaloisRing p n r, 𝔪 = pS. The map τ(F_{p^r}^×) × (1 + 𝔪) → S^×, (t, u) ↦ tu, is a group isomorphism; τ(F_{p^r}^×) is cyclic of order p^r − 1, 1 + 𝔪 has order p^{r(n−1)}, and Nat.card S^× = (p^r − 1) p^{r(n−1)}.
  *Hypotheses:* p prime; n, r ≥ 1.
  *Proof:* 1 + 𝔪 is a subgroup of S^× (elements of 1 + 𝔪 are units since 𝔪 is the set of non-units of a local ring). The residue map S^× → F_{p^r}^× is surjective with kernel 1 + 𝔪; τ restricted to units is a splitting (teichmuller-section-of-galois-ring), so S^× is the internal direct product. Cardinalities: |𝔪| = p^{r(n−1)} (S/𝔪 ≅ F_{p^r} and |S| = p^{rn}), τ is injective, and F_{p^r}^× is cyclic of order p^r − 1.
  *Source:* `gk-asrs`, Chapter 4, Proposition 4.1.3, printed pp. 96–97.
- **Structure of 1 + pGR(p^n, r) for odd p** (theorem; node `FF.4/principal-units-of-galois-ring-odd`).
  Let p be an odd prime and n, r ≥ 1, S = GaloisRing p n r. Then 1 + pS ≅ (ZMod p^{n−1})^r as abelian groups; explicitly, the truncated exponential E(a) = ∑_{k≥0} (pa)^k/k! (a finite sum in S) is a group isomorphism from the additive group S/p^{n−1}S onto 1 + pS, and S/p^{n−1}S ≅ (ZMod p^{n−1})^r because S is free of rank r over ZMod p^n.
  *Hypotheses:* p odd prime; n, r ≥ 1 (for n = 1 both sides are trivial).
  *Proof:* The p-adic valuation of p^k/k! is at least k(p−2)/(p−1) > 0 for k ≥ 1, so p^k a^k/k! makes sense in S (the denominator's prime-to-p part is a unit, the power of p cancels) and vanishes for k large (Goresky–Klapper Proposition 4.2.1 for r = 1; the argument is verbatim for S). E(a + b) = E(a)E(b) (binomial identity for truncated exponentials, all terms integral), so E is a homomorphism (S, +) → (1 + pS, ×). Kernel: E(a) ≡ 1 + pa mod p²S, so E(a) = 1 forces a ∈ pS, and inductively a ∈ p^{n−1}S; conversely E vanishes on p^{n−1}S since then pa = 0. Counting: |S/p^{n−1}S| = p^{r(n−1)} = |1 + pS|, so the induced map is bijective; S ≅ (ZMod p^n)^r as a ZMod p^n-module (galois-ring-presentation, power basis) gives S/p^{n−1}S ≅ (ZMod p^{n−1})^r.
  *Source:* `gk-asrs`, Chapter 4, Section 4.5, printed p. 109.
- **Structure of 1 + 2GR(2^n, r)** (theorem; node `FF.4/principal-units-of-galois-ring-two`).
  Let n ≥ 3 and r ≥ 1, S = GaloisRing 2 n r. Then 1 + 2S ≅ (ZMod 2^{n−1})^{r−1} × ZMod 2^{n−2} × ZMod 2 as abelian groups (for r = 1: (ZMod 2^n)^× ≅ ZMod 2 × ZMod 2^{n−2}, generated by −1 and 5).
  *Hypotheses:* n ≥ 3, r ≥ 1; for n ∈ {1, 2} the factors ZMod 2^m with m ≤ 0 are omitted.
  *Proof:* Case r = 1 (Goresky–Klapper Proposition 4.2.1): 5 has order 2^{n−2} since 5^{2^{n−3}} ≡ 1 + 2^{n−1} mod 2^n, and −1 is not a power of 5 mod 4; the product ⟨−1⟩⟨5⟩ has 2^{n−1} elements. General r: the truncated exponential a ↦ exp(4a) is an isomorphism (S/2^{n−2}S, +) ≅ 1 + 4S, and 1 + 2S/(1 + 4S) ≅ (S/2S, +) = F_{2^r}; the isomorphism type is then fixed by counting, for each k, the elements of 1 + 2S of order dividing 2^k (a finite abelian 2-group is determined by these counts). This counting step is recorded as a gap: the source states the result without proof and refers to McDonald's book, which is not public.
  *Source:* `gk-asrs`, Chapter 4, Section 4.5, printed p. 109.
- **The Frobenius automorphism of GR(p^n, r)** (construction, `GaloisRing.frobenius`; node `FF.4/frobenius-of-galois-ring`).
  For p prime and n, r ≥ 1, the Frobenius σ : GaloisRing p n r ≃+* GaloisRing p n r is the automorphism induced, by functoriality of truncated Witt vectors, from the Frobenius automorphism x ↦ x^p of GaloisField p r; equivalently it is the truncation of the Witt vector Frobenius (mathlib:WittVector.frobenius_eq_map_frobenius). It satisfies σ(τ(a)) = τ(a^p), acts on Teichmüller expansions by a_i ↦ a_i^p, reduces to the field Frobenius, fixes exactly the image of ZMod (p^n), and σ^r = id.
  *API:*
  - `GaloisRing.frobenius` (constructor): σ : GaloisRing p n r ≃+* GaloisRing p n r.
  - `GaloisRing.frobenius_teichmuller` (simp): σ (τ a) = τ (a^p).
  - `GaloisRing.residue_frobenius` (compatibility): residue (σ x) = (residue x)^p.
  - `GaloisRing.frobenius_pow_r` (simp): σ^r = id.
  - `GaloisRing.frobenius_eq_self_iff` (characterisation): σ x = x ↔ x ∈ range (algebraMap (ZMod (p^n)) (GaloisRing p n r)).
  - `GaloisRing.reduction_frobenius` (functoriality): Truncation to length m commutes with σ.
  *Unit tests:*
  - `frobenius.eq_refl_of_r_one` (degenerate): For r = 1, σ = RingEquiv.refl.
  - `frobenius.teichmuller` (characterisation): σ (τ a) = τ (a ^ p).
  - `frobenius.pow_r` (computation): σ ^ r = 1 in the automorphism group, and σ ≠ 1 for GaloisRing 2 2 2.
  - `frobenius.ne_pow_p` (non-example): σ is not the p-th power map when n ≥ 2: in GaloisRing 3 2 1 ≅ ZMod 9, σ = id but 2^3 = 8 ≠ 2.
  *Used in:* Goresky–Klapper Theorem 4.4.1 (Gal(S/R) is cyclic, generated by the lift of the residue Frobenius); Goresky–Klapper §4.4.b (trace and norm of Galois rings are sums and products over the σ^k); FF.4/trace-of-galois-ring (Tr_{GR/ZMod p^n} = ∑_{k<r} σ^k).
  *Source:* `gk-asrs`, Chapter 4, Theorem 4.4.1, printed p. 105.
- **The automorphism group of GR(p^n, r) is cyclic of order r** (theorem; node `FF.4/galois-group-of-galois-ring`).
  Let p be prime and n, r ≥ 1. Reduction to the residue field is a group isomorphism (GaloisRing p n r ≃+* GaloisRing p n r) ≃* (GaloisField p r ≃+* GaloisField p r); hence the ring automorphism group of GaloisRing p n r (all of which are ZMod p^n-algebra automorphisms) is cyclic of order r, generated by the Frobenius σ.
  *Hypotheses:* p prime; n, r ≥ 1.
  *Proof:* Every ring automorphism φ preserves 𝔪 (the non-units) and the Teichmüller set T = {x : x^{p^r} = x}, and commutes with p-adic expansions, so φ(∑ τ(a_i)p^i) = ∑ τ(φ̄(a_i))p^i where φ̄ is the residue automorphism; hence reduction is injective. Surjectivity: the residue automorphisms are the powers of the field Frobenius (Gal(F_{p^r}/F_p) cyclic of order r), realised by σ^k (frobenius-of-galois-ring). A ring automorphism fixes the image of ℤ, hence of ZMod p^n, so it is a ZMod p^n-algebra automorphism.
  *Source:* `gk-asrs`, Chapter 4, Theorem 4.4.1, printed pp. 104–105.
- **GR(p^n, r) ≅ (ℤ/p^n)[X]/(f) for a monic basic irreducible f of degree r** (theorem; node `FF.4/galois-ring-presentation`).
  Let p be prime, n, r ≥ 1 and f ∈ (ZMod (p^n))[X] monic basic irreducible of degree r. Then there is a ZMod (p^n)-algebra isomorphism AdjoinRoot f ≃ₐ GaloisRing p n r; in particular GaloisRing p n r is free of rank r over ZMod (p^n) with basis 1, α, …, α^{r−1} for any root α of f, and α is a unit.
  *Hypotheses:* p prime; n, r ≥ 1; f monic, basic irreducible (basic-irreducible-polynomial), natDegree f = r.
  *Proof:* The reduction f̄ ∈ F_p[X] is irreducible of degree r, so it divides X^{p^r} − X and splits with distinct roots in GaloisField p r (GaloisField is the splitting field of X^{p^r} − X; irreducible polynomials over a finite field are separable). Choose a root ā of f̄; f′(ã) is a unit for any lift ã, so finite-local-ring-is-henselian (with galois-ring-is-local) gives a root α ∈ GaloisRing p n r of f lifting ā. AdjoinRoot.lift sends the class of X to α: a ZMod (p^n)-algebra map φ : AdjoinRoot f → GaloisRing p n r. Surjective: the image contains α, and 1, ā, …, ā^{r−1} span GaloisField p r over F_p, so image + 𝔪 = everything; 𝔪 = p·GR is nilpotent, so image = GR (Nakayama for a nilpotent ideal). Both sides have p^{nr} elements (AdjoinRoot.powerBasis' for monic f over ZMod p^n: free of rank r; galois-ring card), so φ is bijective.
  *Source:* `gk-asrs`, Chapter 4, Section 4.5, printed p. 109.
- **Uniqueness of the unramified extension of ℤ/p^n of degree r** (theorem; node `FF.4/galois-ring-uniqueness`).
  Let p be prime, n, r ≥ 1 and S a finite commutative local ring containing ZMod (p^n) (an injective ring map), whose maximal ideal is p·S and whose residue field has p^r elements. Then S ≃+* GaloisRing p n r (as ZMod (p^n)-algebras).
  *Hypotheses:* p prime; n, r ≥ 1; S finite local, ZMod (p^n) → S injective, 𝔪_S = p·S, #(S/𝔪_S) = p^r.
  *Proof:* Pick h ∈ S whose residue generates S/𝔪_S over F_p (a primitive element of the finite residue field) and let f be the monic lift of its minimal polynomial obtained as ∏ over the orbit of h under the ring automorphisms fixing ZMod p^n — or, more simply, lift the minimal polynomial ḡ of h̄ to a monic g ∈ ZMod(p^n)[X] and replace h by the unique root of g lifting h̄ (finite-local-ring-is-henselian). g is monic basic irreducible of degree r; AdjoinRoot g → S, X ↦ h, is surjective by Nakayama (𝔪_S = pS nilpotent) and |S| = p^{nr} (S is a free ZMod p^n-module since 𝔪_S = pS: the length of S is n·r). Hence S ≅ AdjoinRoot g ≅ GaloisRing p n r by galois-ring-presentation.
  *Source:* `gk-asrs`, Chapter 4, Theorem 4.4.1, printed p. 105.
- **The ideals of GR(p^n, r) form the chain (p^i)** (theorem; node `FF.4/ideals-of-galois-ring`).
  Let p be prime and n, r ≥ 1. Every ideal of GaloisRing p n r equals p^i · GaloisRing p n r for a unique 0 ≤ i ≤ n, and GaloisRing p n r ⧸ (p^m) ≃+* GaloisRing p m r for m ≤ n (via truncation).
  *Hypotheses:* p prime; n, r ≥ 1.
  *Proof:* A nonzero x has a first nonzero Teichmüller coordinate a_i (p-adic-expansion-in-galois-ring), so x = p^i u with u a unit (u has nonzero 0-th coordinate; galois-ring-is-local); hence every ideal is generated by p^{i} for i the least such index among its elements. The kernel of truncation to length m is (p^m) (coordinates of p^m: WittVector.coeff_p_pow_eq_zero and coeff_p_pow).
  *Source:* `gk-asrs`, Chapter 4, Section 4.5, printed p. 109.
- **Galois subrings of GR(p^n, r) are the GR(p^n, e), e ∣ r** (theorem; node `FF.4/galois-subrings-of-galois-ring`).
  Let p be prime and n, r ≥ 1, S = GaloisRing p n r with Frobenius σ. For each e ∣ r the fixed subring S^{σ^e} is isomorphic to GaloisRing p n e, and e ↦ S^{σ^e} is an inclusion-reversing bijection from the divisors of r to the subrings R' ⊆ S that are local with maximal ideal p·R' (equivalently, the subrings that are Galois extensions of ZMod p^n). Not every subring is of this form: for r = 2, n = 2 the subring ZMod 4 + 2S has 8 elements.
  *Hypotheses:* p prime; n, r ≥ 1; e ∣ r.
  *Proof:* S^{σ^e} is a finite local ring with maximal ideal p·S^{σ^e} (fixed points of an automorphism of a local ring whose Teichmüller coordinates are fixed coordinatewise) and residue field F_{p^e}; by galois-ring-uniqueness it is GaloisRing p n e. Conversely a subring R' local with 𝔪 = pR' has residue field a subfield F_{p^e} of F_{p^r}; R' contains the Teichmüller lifts of that subfield (they are the roots of X^{p^e} − X lifting it, unique by finite-local-ring-is-henselian) and is generated by them over ZMod p^n, so R' = S^{σ^e}. The counterexample: ZMod 4 + 2·GaloisRing 2 2 2 is closed under multiplication, contains 1 and has 4·4/2 = 8 elements, while GaloisRing 2 2 e has 4 or 16 elements.
  *Source:* `gk-asrs`, Chapter 4, Section 4.5, printed p. 109.
- **Trace of GR(p^n, r) over ℤ/p^n: Galois sum, surjectivity, duality** (theorem; node `FF.4/trace-of-galois-ring`).
  Let p be prime, n, r ≥ 1, S = GaloisRing p n r, R = ZMod (p^n). (a) Algebra.trace R S x = ∑_{k<r} σ^k(x), and residue ∘ Tr_{S/R} = Tr_{F_{p^r}/F_p} ∘ residue. (b) Tr_{S/R} is surjective. (c) For every R-linear L : S → R there is a unique b ∈ S with L(x) = Tr_{S/R}(bx) for all x; b is a unit iff L is surjective.
  *Hypotheses:* p prime; n, r ≥ 1; S is free of rank r over R (galois-ring-presentation), so Algebra.trace is defined as a matrix trace.
  *Proof:* (a) Both sides are R-linear; they agree modulo 𝔪 by the finite-field formula (mathlib:FiniteField.algebraMap_trace_eq_sum_pow), and the set where two R-linear maps S → R agree is a submodule N with N + 𝔪S = S, so N = S by Nakayama (Goresky–Klapper Lemma 4.4.3). (b) The residue of the trace is the field trace, which is surjective; pick c with Tr(c) a unit and scale (Corollary 4.4.4). (c) b ↦ (x ↦ Tr(bx)) is R-linear and injective (if Tr(bx) = 0 for all x and b = p^m u with u a unit, m < n, then p^m Tr(x) = 0 for all x, contradicting surjectivity); both sides have |R|^r elements (Theorem 4.4.6(4)).
  *Source:* `gk-asrs`, Chapter 4, Lemma 4.4.3, printed p. 106.

### 4B. Linearized polynomials

Wu–Liu §§1–2 and 4 (q-polynomials, composition, associates, Dickson matrices and Proposition 4.3),
Ben-Sasson–Etzion–Gabizon–Raviv §II (linearized and subspace polynomials) and Shallue §1.4 (Theorems 1.15–1.16, the
root and gcd criteria). Shallue's Theorem 1.16 prints `x^i − 1` for `x^m − 1` (E503), and the proof of his
Theorem 1.17 omits a `p^h`-th root (E513). The Ore ring `L{τ}` over `F_q`-algebras and its identification with this composition ring are
DrinfeldModulesAndTModules DM.0's (see the ownership proposal in the packet).


- **q-linearized (additive) polynomials** (definition, `Polynomial.IsLinearized`; node `FF.4/linearized-polynomial`).
  Let K be a commutative semiring and q a natural number. A polynomial L ∈ K[X] is q-linearized (a q-polynomial), written Polynomial.IsLinearized q L, if every exponent in its support is a power of q, i.e. L = ∑_i a_i X^{q^i}. The constructor linearizedOf q a := ∑_i C (a i) · X^{q^i} turns a finitely supported coefficient sequence a : ℕ →₀ K into a q-polynomial; its q-degree is the largest i with a_i ≠ 0. Convention (pinned): exponents are q^i with i ≥ 0, so X = X^{q^0} is linearized and nonzero constants are not; q ≥ 2 in every theorem.
  *API:*
  - `Polynomial.IsLinearized` (constructor): IsLinearized q L :↔ ∀ n ∈ L.support, ∃ i, n = q^i.
  - `Polynomial.linearizedOf` (constructor): linearizedOf q a = ∑_i C (a i) * X^(q^i) for a : ℕ →₀ K.
  - `Polynomial.IsLinearized.X` (simp): X is q-linearized.
  - `Polynomial.IsLinearized.X_pow_pow` (simp): X^(q^i) is q-linearized.
  - `Polynomial.IsLinearized.add` (structure): The sum of q-linearized polynomials is q-linearized.
  - `Polynomial.IsLinearized.C_mul` (structure): C c * L is q-linearized when L is.
  - `Polynomial.IsLinearized.eq_linearizedOf` (characterisation): For q ≥ 2, a q-linearized L equals linearizedOf q (fun i ↦ L.coeff (q^i)).
  - `Polynomial.isLinearized_linearizedOf` (simp): linearizedOf q a is q-linearized.
  *Unit tests:*
  - `IsLinearized.X_pow_sub_X` (computation): Over ZMod p, X^p − X is p-linearized.
  - `IsLinearized.not_X_sq_add_one` (non-example): X² + 1 ∈ (ZMod 2)[X] is not 2-linearized (exponent 0 is not a power of 2).
  - `IsLinearized.not_X_cube` (non-example): X³ ∈ (ZMod 2)[X] is not 2-linearized.
  - `IsLinearized.zero` (degenerate): 0 is q-linearized.
  - `IsLinearized.linearizedOf_single` (compatibility): linearizedOf q (Finsupp.single i c) = C c * X^(q^i).
  *Used in:* Shallue Theorems 1.15–1.17 (linearized polynomials as a class of permutation polynomials); Ben-Sasson–Etzion–Gabizon–Raviv §II (subspace polynomials are the monic linearized polynomials with simple roots); Wu–Liu §2 (the composition algebra of linearized polynomials over F_{q^n} and its Dickson matrices); DrinfeldModulesAndTModules:DM.0 (the Ore ring L{τ} of F_q-linear endomorphisms of G_a is identified with q-linearized polynomials under composition (see the restructure proposal on ownership)).
  *Source:* `shallue-pp`, Chapter 1, Section 1.4, printed p. 14.
- **Evaluation of a q-polynomial is F_q-linear** (lemma; node `FF.4/linearized-polynomial-eval-linear`).
  Let p be prime, q = p^e (e ≥ 1), F a finite field with q elements, K an F-algebra that is a field, E a commutative K-algebra, and L ∈ K[X] q-linearized. Then x ↦ aeval x L is additive on E and satisfies L(c·x) = c·L(x) for c ∈ F; hence it is an F-linear map IsLinearized.toLinearMap : E →ₗ[F] E.
  *Hypotheses:* F finite with Fintype.card F = q = p^e; CharP K p; E a commutative K-algebra (so of characteristic p).
  *Proof:* (x + y)^{q^i} = x^{q^i} + y^{q^i} in a commutative ring of characteristic p (iterated frobenius, add_pow_char_pow); sum over the monomials of L. For c ∈ F, c^{q} = c (FiniteField.pow_card), so (c x)^{q^i} = c^{q^i} x^{q^i} = c x^{q^i}; multiply by the coefficient and sum.
  *Source:* `shallue-pp`, Chapter 1, Section 1.4, printed p. 14.
- **q-polynomials are closed under composition** (lemma; node `FF.4/linearized-polynomial-comp`).
  Let K be a commutative ring of characteristic p and q = p^e with e ≥ 1. If L₁ = ∑ a_i X^{q^i} and L₂ = ∑ b_j X^{q^j} are q-linearized, then L₁.comp L₂ is q-linearized with L₁ ∘ L₂ = ∑_k (∑_{i+j=k} a_i b_j^{q^i}) X^{q^k}; composition is associative and distributes over addition on both sides, so the q-polynomials form a (noncommutative) ring under + and ∘ with unit X.
  *Hypotheses:* CharP K p, q = p^e, e ≥ 1.
  *Proof:* (∑_j b_j X^{q^j})^{q^i} = ∑_j b_j^{q^i} X^{q^{i+j}} by additivity of the q^i-th power map in characteristic p (Polynomial.expand and frobenius on K[X]). Multiply by a_i and sum over i; collect by k = i + j. Left distributivity L ∘ (M + N) = L ∘ M + L ∘ N uses the additivity of evaluation of L (linearized-polynomial-eval-linear applied in the K-algebra K[X]); right distributivity and associativity hold for all polynomials (Polynomial.add_comp, Polynomial.comp_assoc).
  *Source:* `wu-liu-linearized`, Section 2.1, printed p. 5.
- **The roots of a q-polynomial form an F_q-subspace** (theorem; node `FF.4/roots-of-linearized-polynomial`).
  In the setting of linearized-polynomial-eval-linear (F finite with q elements, K an F-algebra field of characteristic p, E a field extension of K), for L ∈ K[X] q-linearized the set of roots of L in E is the F-subspace LinearMap.ker (IsLinearized.toLinearMap L) of E; if L ≠ 0 it is finite.
  *Hypotheses:* F finite, Fintype.card F = q = p^e; E a field with [Algebra K E]; L q-linearized.
  *Proof:* The roots in E are the zeros of the F-linear map x ↦ L(x) (linearized-polynomial-eval-linear), i.e. its kernel. Finiteness for L ≠ 0: a nonzero polynomial has finitely many roots in a field (Polynomial.rootSet is finite).
  *Source:* `begr-subspace`, Section II, printed p. 3.
- **A q-polynomial is separable iff its coefficient of X is nonzero** (theorem; node `FF.4/linearized-polynomial-separable-iff`).
  Let K be a field of characteristic p, q = p^e (e ≥ 1) and L = ∑_{i≤m} a_i X^{q^i} ∈ K[X] q-linearized and nonzero. (a) L is separable iff a_0 ≠ 0. (b) If a_0 ≠ 0 and L splits over a field E ⊇ K, then L has exactly q^m distinct roots in E, where m is the q-degree. (c) If K is perfect and t is the least index with a_t ≠ 0, every root of L in a splitting field has multiplicity exactly q^t.
  *Hypotheses:* CharP K p; q = p^e, e ≥ 1; L ≠ 0; (c) assumes PerfectField K.
  *Proof:* The derivative of X^{q^i} is q^i X^{q^i − 1} = 0 for i ≥ 1 in characteristic p, so L′ = a_0 (Polynomial.derivative). (a) If a_0 ≠ 0, L′ is a nonzero constant, so IsCoprime L L′ (mathlib:Polynomial.separable_def); if a_0 = 0 then L′ = 0 and L (nonconstant) is not separable. (b) A separable split polynomial has natDegree many distinct roots (mathlib:Polynomial.card_rootSet_eq_natDegree), and natDegree L = q^m. (c) Over a perfect field L = M^{q^t} with M = ∑_i a_i^{1/q^t} X^{q^{i−t}} (take q^t-th roots of the coefficients; frobenius is bijective), and M has nonzero X-coefficient, so M is separable by (a); each root of L is a simple root of M, hence of multiplicity q^t in L.
  *Source:* `begr-subspace`, Section II, Lemma 1 and proof, printed p. 3.
- **The subspace polynomial of a finite F_q-subspace** (construction, `subspacePolynomial`; node `FF.4/subspace-polynomial`).
  Let F be a finite field with q elements, E a field with [Algebra F E], and U a finite F-subspace of E (a Submodule F E with Finite U). Its subspace polynomial is P_U := ∏_{u ∈ U} (X − C u) ∈ E[X]. It is monic of degree #U = q^{dim U}, separable, its roots in E are exactly U, and it is q-linearized (node subspace-polynomial-is-linearized).
  *API:*
  - `subspacePolynomial` (constructor): subspacePolynomial U = ∏_{u ∈ U} (X − C u).
  - `subspacePolynomial_monic` (simp): subspacePolynomial U is monic.
  - `subspacePolynomial_natDegree` (simp): Its natDegree is Nat.card U = q^(finrank F U).
  - `mem_rootSet_subspacePolynomial` (characterisation): x is a root of subspacePolynomial U iff x ∈ U.
  - `subspacePolynomial_separable` (other): subspacePolynomial U is separable.
  - `subspacePolynomial_injective` (extensionality): U ↦ subspacePolynomial U is injective (BEGR Lemma 2).
  *Unit tests:*
  - `subspacePolynomial_bot` (degenerate): subspacePolynomial ⊥ = X.
  - `subspacePolynomial_range_algebraMap` (computation): For U = the image of F in E, subspacePolynomial U = X^q − X.
  - `subspacePolynomial_not_of_nonsubspace` (non-example): For q = 2 and a ∈ GaloisField 2 2 \ {0,1}, ∏_{u ∈ {0,1,a}} (X − u) has degree 3 and is not 2-linearized, while the subspace {0,1,a,a+1} gives X⁴ + X.
  - `subspacePolynomial_natDegree` (characterisation): natDegree (subspacePolynomial U) = q^(finrank F U).
  *Used in:* Ben-Sasson–Etzion–Gabizon–Raviv Lemma 2 (subspaces are determined by their subspace polynomials); FF.4/linearized-permutation-root-criterion (the kernel of a linearized polynomial is recovered as the root space of a subspace-polynomial factor); DrinfeldModulesAndTModules:DM.0 (kernels of isogenies of additive group schemes are finite F_q-subspaces with subspace polynomials as defining equations).
  *Source:* `begr-subspace`, Section II, Definition 2, printed p. 3.
- **Subspace polynomials are q-linearized** (theorem; node `FF.4/subspace-polynomial-is-linearized`).
  In the setting of subspace-polynomial, P_U is q-linearized for every finite F-subspace U ⊆ E; its coefficient of X is nonzero and its q-degree is dim_F U. Conversely every monic q-linearized L ∈ E[X] with nonzero X-coefficient that splits over E is the subspace polynomial of its root space.
  *Hypotheses:* F finite with q elements; U a finite-dimensional F-subspace of the field E.
  *Proof:* Induction on dim U. For U = ⊥, P_U = X. If U = U′ ⊕ F·w with w ∉ U′, then P_U(X) = ∏_{c ∈ F} P_{U′}(X − c w) = ∏_{c ∈ F} (P_{U′}(X) − c P_{U′}(w)), using that P_{U′} is linearized (induction) and hence additive and F-linear as a polynomial map in the K-algebra E[X] (linearized-polynomial-eval-linear). ∏_{c ∈ F}(Y − c b) = Y^q − b^{q−1} Y for b ∈ E (the roots of Y^q − b^{q−1}Y are the c b; FiniteField.roots_X_pow_card_sub_X scaled), so P_U = P_{U′}^q − P_{U′}(w)^{q−1} P_{U′}, a q-linearized polynomial by linearized-polynomial-comp. The X-coefficient is nonzero since P_U is separable (subspace-polynomial) and linearized-polynomial-separable-iff; the converse follows from roots-of-linearized-polynomial and linearized-polynomial-separable-iff (b), comparing monic polynomials with the same simple roots.
  *Source:* `begr-subspace`, Section II, printed p. 3.
- **The linearized q-associate of a polynomial** (definition, `linearizedAssociate`; node `FF.4/linearized-q-associate`).
  Let K be a commutative semiring and q ∈ ℕ. The linearized q-associate of l = ∑_i a_i X^i ∈ K[X] is linearizedAssociate q l := ∑_i a_i X^{q^i} (Lidl–Niederreiter call l the conventional q-associate of this linearized polynomial). The map l ↦ linearizedAssociate q l is additive and injective for q ≥ 2, and when K = F is a finite field with q elements it turns multiplication into composition: linearizedAssociate q (l * m) = (linearizedAssociate q l).comp (linearizedAssociate q m); hence (F[X], +, ·) ≅ (q-polynomials over F, +, ∘) and, modulo X^n − 1 ↦ X^{q^n} − X, F[X]/(X^n − 1) ≅ L_n(F).
  *API:*
  - `linearizedAssociate` (constructor): linearizedAssociate q l = ∑_i C (l.coeff i) * X^(q^i), an additive map K[X] →+ K[X].
  - `linearizedAssociate_X_pow` (simp): linearizedAssociate q (X^i) = X^(q^i).
  - `linearizedAssociate_injective` (extensionality): For q ≥ 2 the map is injective.
  - `linearizedAssociate_mul` (relation): For F finite with q elements: linearizedAssociate q (l * m) = (linearizedAssociate q l).comp (linearizedAssociate q m).
  - `linearizedAssociate_X_pow_sub_one` (simp): linearizedAssociate q (X^n − 1) = X^(q^n) − X.
  *Unit tests:*
  - `linearizedAssociate_X_sub_one` (computation): linearizedAssociate q (X − 1) = X^q − X.
  - `linearizedAssociate_one` (degenerate): linearizedAssociate q 1 = X.
  - `linearizedAssociate_mul_noncomm` (non-example): With q = 2, F = GaloisField 2 2 and a ∉ range (algebraMap (ZMod 2) F): (C a * X).comp (X^2) ≠ (X^2).comp (C a * X).
  - `linearizedAssociate_isLinearized` (compatibility): linearizedAssociate q l is q-linearized, and equals linearizedOf q (l.toFinsupp).
  *Used in:* Shallue Theorem 1.16 (the permutation criterion for linearized polynomials with coefficients in F_q is read off the associate); Wu–Liu §1 (Ore) (L_n(F_q) ≅ F_q[x]/(x^n − 1)); FF.4/linearized-permutation-associate-criterion (reduces the permutation property to a gcd of associates).
  *Source:* `wu-liu-linearized`, Section 1, printed p. 4.
- **A q-polynomial permutes F_{q^m} iff 0 is its only root there** (theorem; node `FF.4/linearized-permutation-root-criterion`).
  Let F be a finite field with q elements, E a finite field extension of F, and L ∈ E[X] q-linearized. Then x ↦ L(x) is a bijection of E iff the only root of L in E is 0.
  *Hypotheses:* F finite with q elements; E a finite field with [Algebra F E].
  *Proof:* x ↦ L(x) is F-linear (linearized-polynomial-eval-linear); an injective endomorphism of a finite set is bijective, and a linear map is injective iff its kernel is 0 (roots-of-linearized-polynomial).
  *Source:* `shallue-pp`, Chapter 1, Theorem 1.15, printed p. 14.
- **The associate gcd criterion for q-polynomials with coefficients in F_q** (theorem; node `FF.4/linearized-permutation-associate-criterion`).
  Let F be a finite field with q elements, m ≥ 1, E a field extension of F of degree m, and l = ∑_{i<m} a_i X^i ∈ F[X]. Then linearizedAssociate q l permutes E iff gcd(l, X^m − 1) = 1 in F[X].
  *Hypotheses:* F finite with q elements; [E : F] = m ≥ 1; natDegree l < m.
  *Proof:* Write L = linearizedAssociate q l and g = gcd(l, X^m − 1) = a·l + b·(X^m − 1) (Bézout in F[X]). By linearized-q-associate, assoc(g) = assoc(a) ∘ L + assoc(b) ∘ (X^{q^m} − X), and X^{q^m} − X vanishes on E (FiniteField.pow_card with #E = q^m); hence every root of L in E is a root of assoc(g). Conversely g ∣ l gives L = assoc(l/g) ∘ assoc(g), so every root of assoc(g) is a root of L. Thus the roots of L in E are the roots of assoc(g) in E. If g = 1 then assoc(g) = X, whose only root is 0, and L permutes E by linearized-permutation-root-criterion. If deg g ≥ 1: g(0) ≠ 0 since g ∣ X^m − 1, so assoc(g) is separable (linearized-polynomial-separable-iff) with q^{deg g} > 1 roots in its splitting field; each root y satisfies y^{q^m} = y (because X^{q^m} − X = assoc(h) ∘ assoc(g) with g·h = X^m − 1), so all lie in E, and L has a nonzero root in E: not a permutation.
  *Source:* `shallue-pp`, Chapter 1, Theorem 1.16, printed p. 15.
- **Dickson's matrix criterion for linearized permutation polynomials** (theorem; node `FF.4/dickson-matrix-criterion`).
  Let F be a finite field with q elements, E ⊇ F of degree m, and L = ∑_{i<m} a_i X^{q^i} ∈ E[X]. Let D_L ∈ M_m(E) be the Dickson matrix with entries (D_L)_{i,j} = a_{(j−i) mod m}^{q^i}. Then the F-linear map x ↦ L(x) of E has rank equal to rank D_L and determinant equal to det D_L (which lies in F); in particular L permutes E iff det D_L ≠ 0.
  *Hypotheses:* F finite with q elements; [E : F] = m ≥ 1; indices of a read modulo m.
  *Proof:* For an F-basis (β_j) of E and its trace-dual basis, the matrix M_L of x ↦ L(x) satisfies M_L = B^{−1} D_L B with B = (β_j^{q^i}) (Wu–Liu Lemma 4.2): from (L(x)^{q^i})_i = D_L (x^{q^j})_j, since L(x)^{q^i} = ∑_j a_{j−i}^{q^i} x^{q^j}. B is invertible (Moore/Vandermonde-type matrix of a basis; its nonsingularity is equivalent to linear independence of the β_j over F). Similar matrices have the same rank and determinant (Wu–Liu Proposition 4.3); combine with linearized-permutation-root-criterion.
  *Source:* `wu-liu-linearized`, Section 4, Proposition 4.3, printed p. 11.

### 4C. Permutation polynomials and Dickson polynomials

Shallue, Chapter 1 (Lemmas 1.2–1.4, Hermite's criterion in Theorems 1.5–1.6, Corollary 1.8, the character criterion
in Theorem 1.9, monomials in Theorem 1.14, Dickson polynomials in Theorem 1.22) and Bluher §§1–2 (Dickson polynomials of the first kind and Dickson's theorem). Shallue's proof of the
one-root form of Hermite's criterion uses a false equivalence for non-prime `q` (E502, counterexample `X⁴ − 1` over
`F₉`), and Corollary 1.8 omits `n ≥ 2` (E504); the nodes carry the corrected statements.


- **Permutation polynomials of a finite field** (definition, `IsPermutationPolynomial`; node `FF.4/permutation-polynomial`; planet *Permutation polynomials*).
  Let F be a finite field with q elements. A polynomial f ∈ F[X] is a permutation polynomial of F, written IsPermutationPolynomial f, if the evaluation map x ↦ f.eval x is a bijection F → F. Equivalent forms (Shallue Lemma 1.3): injective; surjective; f(x) = a solvable for every a. The property depends only on f mod (X^q − X) (Shallue Lemma 1.2), and there are exactly q! permutation polynomials of degree < q.
  *API:*
  - `IsPermutationPolynomial` (constructor): IsPermutationPolynomial f :↔ Function.Bijective (fun x ↦ f.eval x).
  - `IsPermutationPolynomial.iff_injective` (characterisation): For F finite: IsPermutationPolynomial f ↔ injective evaluation.
  - `IsPermutationPolynomial.iff_surjective` (characterisation): For F finite: IsPermutationPolynomial f ↔ surjective evaluation.
  - `IsPermutationPolynomial.comp` (structure): Permutation polynomials are closed under composition.
  - `IsPermutationPolynomial.linear` (example): C a * X + C b is a permutation polynomial iff a ≠ 0.
  - `IsPermutationPolynomial.toEquiv` (coercion): A permutation polynomial defines an Equiv.Perm F.
  - `card_permutationPolynomial_degree_lt` (other): The number of permutation polynomials of degree < q is q!.
  *Unit tests:*
  - `IsPermutationPolynomial.X_cube_add_one_zmod_eleven` (computation): X³ + 1 is a permutation polynomial of ZMod 11.
  - `IsPermutationPolynomial.not_quadratic_zmod_eleven` (non-example): X² + 3X + 5 = (X + 7)² is not a permutation polynomial of ZMod 11.
  - `IsPermutationPolynomial.X` (degenerate): X is a permutation polynomial; a constant is not when q ≥ 2.
  - `IsPermutationPolynomial.iff_modByMonic` (compatibility): IsPermutationPolynomial f ↔ IsPermutationPolynomial (f %ₘ (X^q − X)).
  *Used in:* Shallue Theorems 1.5, 1.6 (Hermite's criterion) (criteria characterising permutation polynomials); Shallue Theorem 1.22 / Bluher Proposition 2.4 (Dickson polynomials D_n(x, a) as permutation polynomials); FF.4/linearized-permutation-root-criterion (linearized polynomials permuting F_{q^m}); FF.4 target list (permutation polynomials of finite fields (audit: absent from both libraries)).
  *Source:* `shallue-pp`, Chapter 1, Definition 1.1, printed p. 6.
- **Power sums detect enumerations of F_q** (lemma; node `FF.4/power-sums-detect-enumerations`).
  Let F be a finite field with q elements and a : Fin q → F. Then a is a bijection iff ∑_i a_i^t = 0 for 0 ≤ t ≤ q − 2 and ∑_i a_i^{q−1} = −1.
  *Hypotheses:* F finite, q = Fintype.card F; 0^0 = 1 (Mathlib's convention), so t = 0 gives ∑ 1 = q = 0 in F.
  *Proof:* ⇒: reindex by the bijection and use ∑_{x∈F} x^t = 0 for t < q − 1 (mathlib:FiniteField.sum_pow_lt_card_sub_one) and ∑_{x∈F} x^{q−1} = q − 1 = −1 (every nonzero x has x^{q−1} = 1, mathlib:FiniteField.pow_card_sub_one_eq_one). ⇐ (Shallue's proof): g(x) := −∑_{t<q} (∑_i a_i^t) x^{q−1−t} has degree ≤ q − 1 and equals the indicator of the value set {a_i}; the hypotheses force g = 1, so the value set is F; a surjection Fin q → F with #F = q is a bijection.
  *Source:* `shallue-pp`, Chapter 1, Lemma 1.4, printed p. 9.
- **The X^{q−1}-coefficient of a reduction mod X^q − X is minus the value sum** (lemma; node `FF.4/top-coefficient-of-reduction`).
  Let F be a finite field with q elements and g ∈ F[X]. The coefficient of X^{q−1} in g %ₘ (X^q − X) equals −∑_{c∈F} g(c).
  *Hypotheses:* F finite, q = Fintype.card F ≥ 2.
  *Proof:* g and its reduction r agree on F (Shallue Lemma 1.2) and deg r ≤ q − 1; by the Carlitz interpolation formula r = ∑_c g(c)(1 − (X − c)^{q−1}) (both sides have degree ≤ q − 1 and agree on F), whose X^{q−1}-coefficient is −∑_c g(c). Uniqueness of the interpolant: mathlib:Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero'.
  *Source:* `shallue-pp`, Chapter 1, proof of Theorem 1.5, printed p. 10.
- **Hermite's criterion** (theorem; node `FF.4/hermite-criterion`).
  Let F be a finite field with q = p^r elements and f ∈ F[X]. Then f is a permutation polynomial of F iff (1) the reduction f^{q−1} %ₘ (X^q − X) has degree q − 1 (equivalently: is monic of degree q − 1), and (2) for every t with 1 ≤ t ≤ q − 2 and p ∤ t, the reduction f^t %ₘ (X^q − X) has degree ≤ q − 2.
  *Hypotheses:* F finite of characteristic p with q elements, q ≥ 2.
  *Proof:* By top-coefficient-of-reduction the X^{q−1}-coefficient of f^t %ₘ (X^q − X) is −∑_c f(c)^t. ⇒: power-sums-detect-enumerations applied to (f(c))_c gives the coefficient conditions. ⇐: (2) gives ∑_c f(c)^t = 0 for p ∤ t, and t = t′p^j reduces to t′ since the p^j-th power is additive; (1) gives ∑_c f(c)^{q−1} = −1; t = 0 is trivial; conclude by power-sums-detect-enumerations.
  *Source:* `shallue-pp`, Chapter 1, Theorem 1.5, printed p. 10.
- **Hermite's criterion with exactly one root** (theorem; node `FF.4/hermite-criterion-one-root`).
  Let F be a finite field with q = p^r elements and f ∈ F[X]. Then f is a permutation polynomial of F iff (1) f has exactly one root in F, and (2) for every t with 1 ≤ t ≤ q − 2 and p ∤ t, the reduction f^t %ₘ (X^q − X) has degree ≤ q − 2.
  *Hypotheses:* F finite of characteristic p with q elements, q ≥ 2.
  *Proof:* ⇒: a bijection has exactly one root; (2) holds by hermite-criterion. ⇐: if f has exactly j = 1 root then ∑_c f(c)^{q−1} = q − 1 = −1, so the X^{q−1}-coefficient of f^{q−1} %ₘ (X^q − X) is 1 (top-coefficient-of-reduction) and hermite-criterion applies. Only this implication is needed: the converse 'coefficient 1 ⇒ exactly one root' asserted in the source's proof is false for non-prime q (source issue E502).
  *Source:* `shallue-pp`, Chapter 1, Theorem 1.6 and proof, printed pp. 10–11.
- **Character-sum criterion for permutation polynomials** (theorem; node `FF.4/permutation-character-criterion`).
  Let F be a finite field and f ∈ F[X]. Then f is a permutation polynomial of F iff ∑_{c∈F} ψ(f(c)) = 0 for every nontrivial additive character ψ : AddChar F ℂ.
  *Hypotheses:* F finite; characters with values in ℂ.
  *Proof:* ⇒: reindex the sum by the bijection f and use ∑_x ψ(x) = 0 for ψ ≠ 1 (mathlib:AddChar.sum_eq_zero_of_ne_one). ⇐: for a ∈ F, the number of c with f(c) = a is (1/q) ∑_ψ ∑_c ψ(f(c) − a) (orthogonality, mathlib:AddChar.sum_eq_ite applied to the dual group, which has q elements for a finite field); the hypothesis leaves only the trivial character's contribution q/q = 1.
  *From other layers:* `FF.1`.
  *Source:* `shallue-pp`, Chapter 1, Theorem 1.9, printed p. 11.
- **X^n permutes F_q iff gcd(n, q − 1) = 1** (theorem; node `FF.4/monomial-permutation-criterion`).
  Let F be a finite field with q elements and n ≥ 1. Then X^n is a permutation polynomial of F iff Nat.Coprime n (q − 1).
  *Hypotheses:* F finite; n ≥ 1 (for n = 0, X^0 = 1 is not a permutation when q ≥ 2).
  *Proof:* 0^n = 0, so X^n permutes F iff x ↦ x^n permutes Fˣ. Fˣ is cyclic of order q − 1; the n-th power map on a finite group of order N is bijective when gcd(n, N) = 1 (mathlib:powCoprime), and when g = gcd(n, q − 1) > 1 its kernel contains a nontrivial g-th root of unity (a generator raised to (q − 1)/g).
  *Source:* `shallue-pp`, Chapter 1, Theorem 1.14(2) and proof, printed p. 14.
- **No permutation polynomial of degree n > 1 with n ∣ q − 1** (theorem; node `FF.4/no-permutation-polynomial-of-degree-dividing`).
  Let F be a finite field with q elements and n ≥ 2 with n ∣ q − 1. Then no polynomial of natDegree n is a permutation polynomial of F.
  *Hypotheses:* n ≥ 2 (the source omits this hypothesis; for n = 1 the claim is false — source issue E504).
  *Proof:* Write q − 1 = n m; n ≥ 2 gives 1 ≤ m ≤ q − 2, and p ∤ m since m ∣ q − 1. f^m has degree nm = q − 1 < q, so it is its own reduction, of degree q − 1 > q − 2, violating condition (2) of hermite-criterion at t = m.
  *Source:* `shallue-pp`, Chapter 1, Corollary 1.8 and proof, printed p. 11.
- **Dickson polynomials of the first kind: D_n(u + a/u, a) = u^n + (a/u)^n** (lemma; node `FF.4/dickson-functional-equation`).
  Let R be a commutative ring, a ∈ R and x, y ∈ R with x·y = a. Then for every n, (dickson 1 a n).eval (x + y) = x^n + y^n, where dickson 1 a n is Mathlib's n-th Dickson polynomial of the first kind with parameter a (dickson 1 a 0 = 2, dickson 1 a 1 = X, D_{n+2} = X D_{n+1} − a D_n). In particular D_n(x, 0) = x^n for n ≥ 1.
  *Hypotheses:* R commutative; no invertibility is needed (the form u + a/u is recovered with x = u, y = a/u when u is a unit).
  *Proof:* Two-step induction on n with the recurrence (mathlib:Polynomial.dickson_add_two): x^{n+2} + y^{n+2} = (x + y)(x^{n+1} + y^{n+1}) − xy(x^n + y^n) and xy = a. Base cases: dickson 1 a 0 = 3 − 1 = 2 = x^0 + y^0 (mathlib:Polynomial.dickson_zero) and dickson 1 a 1 = X (mathlib:Polynomial.dickson_one). This generalises mathlib:Polynomial.dickson_one_one_eval_add_inv (the case a = 1).
  *Source:* `bluher-dickson`, Section 1, footnote 1, printed p. 1.
- **Every x ∈ F_q is u + a/u with u ∈ F_q^× or u^{q+1} = a** (lemma; node `FF.4/dickson-parametrisation`).
  Let F be a finite field with q elements, a ∈ F^× and L a quadratic extension of F (e.g. GaloisField p (2r) when q = p^r). For every x ∈ F there is u ∈ L^× with x = u + a/u, and then either u ∈ F^× (u^{q−1} = 1) or u^{q+1} = a; conversely u + a/u ∈ F whenever u^{q−1} = 1 or u^{q+1} = a. Moreover u + a/u = v + a/v iff v ∈ {u, a/u}.
  *Hypotheses:* F finite with q elements; a ≠ 0; L ⊇ F with [L : F] = 2.
  *Proof:* x = u + a/u iff u² − xu + a = 0; this quadratic splits in L, and its roots are nonzero since their product is a. x ∈ F iff x^q = x iff u^q + a/u^q = u + a/u iff (u^q − u)(1 − a/u^{q+1}) = 0, i.e. u^q = u or u^{q+1} = a (computation with the Frobenius of L/F). u + a/u = v + a/v ⟺ (uv − a)(u − v) = 0 (clear denominators).
  *Source:* `bluher-dickson`, Section 2, Lemma 2.1 and proof, printed p. 5.
- **Dickson's theorem: D_n(x, a) permutes F_q iff gcd(n, q² − 1) = 1** (theorem; node `FF.4/dickson-permutation-criterion`).
  Let F be a finite field with q elements, a ∈ F^× and n ≥ 1. Then the Dickson polynomial dickson 1 a n is a permutation polynomial of F iff Nat.Coprime n (q² − 1). For a = 0, dickson 1 0 n = X^n permutes F iff Nat.Coprime n (q − 1) (monomial-permutation-criterion).
  *Hypotheses:* F finite with q elements; n ≥ 1; the main statement needs a ≠ 0.
  *Proof:* Parametrise F by dickson-parametrisation: F = {u + a/u : u ∈ μ_{q−1}} ∪ {u + a/u : u ∈ A}, A = {u ∈ L : u^{q+1} = a}. By dickson-functional-equation D_n(u + a/u) = u^n + (a/u)^n = u^n + a^n/u^n; D_n maps the first part via u ↦ u^n on μ_{q−1} (parameter a^n, still in F) and the second via u ↦ u^n on the coset A (u^{n(q+1)} = a^n). If gcd(n, q² − 1) = 1 then u ↦ u^n is injective on L^× (order q² − 1, mathlib:powCoprime) and, with the fibre description of dickson-parametrisation (u + a/u = v + a/v iff v ∈ {u, a/u}, and a/u^n corresponds to (a/u)^n), D_n is injective on F; injective on a finite set means bijective. Conversely compute the image as in Bluher Proposition 2.4: with r = gcd(n, q − 1) and s = gcd(n, q + 1), u ↦ u^n maps μ_{q−1} onto μ_{(q−1)/r} (r-to-1) and the coset A onto the corresponding coset for a^n (s-to-1), and u ↦ u + a/u is exactly 2-to-1 off the at most two points with u² = a; counting the image gives #D_n(F) < q unless r = s = 1, i.e. unless gcd(n, q² − 1) = 1 (for q odd, gcd(n, q−1) = gcd(n, q+1) = 1 iff gcd(n, q² − 1) = 1 since q² − 1 = (q − 1)(q + 1); for q even the two factors are coprime).
  *Source:* `shallue-pp`, Chapter 1, Theorem 1.22, printed p. 17.

### 4D. Linear recurring sequences, m-sequences and correlation

Goresky–Klapper §3.2 (the order of a polynomial, primitive polynomials), §5.1.a (periodicity), Chapter 6 (§§6.1–6.6:
linear feedback shift registers, periods and the order of the characteristic polynomial, the trace model), §§11.2–11.3
(balance, correlations), Chapter 13 (§§13.1–13.5: m-sequences, state cycle, shift-and-add, autocorrelation,
decimations) and §14.8 (Dirichlet and Legendre sequences). The
recurrence, companion-matrix and matrix-power descriptions are ClassicalArithmeticCompletion CA.2's nodes, used here
through `CA.2/linear-recurrence-of-a-monic-polynomial`, `CA.2/companion-matrix` and
`CA.2/linear-recurrence-as-a-matrix-power`. Recorded source issues: an example polynomial given as its reciprocal
(E506), a shift-and-add proof that cites the wrong result (E507), indices in Theorems 6.6.8–6.6.9 (E508), the
autocorrelation value at `τ ≡ 0` (E509), the decimations that are shifts (E510), the count of zero columns of the
interleaved array (E512) and the codomain of the quadratic character (E515).


- **The least period of a purely periodic sequence** (definition, `seqShift`; node `FF.4/least-period-of-sequence`).
  For a type α let seqShift : (ℕ → α) → (ℕ → α), (seqShift s) n = s (n + 1). The least period of s : ℕ → α is seqLeastPeriod s := Function.minimalPeriod seqShift s: the least T ≥ 1 with s (n + T) = s n for all n, and 0 (Mathlib's junk value) when s is not purely periodic. A sequence is eventually periodic if some shift seqShift^[k] s is purely periodic; its preperiod is the least such k.
  *API:*
  - `seqShift` (constructor): (seqShift s) n = s (n + 1).
  - `seqLeastPeriod` (constructor): seqLeastPeriod s = Function.minimalPeriod seqShift s.
  - `isPeriodicPt_seqShift_iff` (characterisation): Function.IsPeriodicPt seqShift T s ↔ ∀ n, s (n + T) = s n.
  - `seqLeastPeriod_dvd_of_periodic` (relation): If s (n + T) = s n for all n, then seqLeastPeriod s ∣ T.
  - `periodic_seqLeastPeriod` (simp): s (n + seqLeastPeriod s) = s n for all n.
  - `seqLeastPeriod_pos_iff` (characterisation): 0 < seqLeastPeriod s ↔ ∃ T > 0, ∀ n, s (n + T) = s n.
  - `seqLeastPeriod_seqShift` (simp): seqLeastPeriod (seqShift s) = seqLeastPeriod s for purely periodic s.
  *Unit tests:*
  - `seqLeastPeriod_fibonacci_zmod_two` (computation): The Fibonacci sequence mod 2 (0, 1, 1, 0, …) has seqLeastPeriod 3.
  - `seqLeastPeriod_const` (degenerate): A constant sequence has seqLeastPeriod 1.
  - `seqLeastPeriod_not_purely_periodic` (non-example): The sequence 1, 0, 0, 0, … has seqLeastPeriod 0, although it is eventually periodic.
  - `seqLeastPeriod_eq_minimalPeriod` (compatibility): seqLeastPeriod s = Function.minimalPeriod seqShift s, and s (n + T) = s n for all n iff Function.IsPeriodicPt seqShift T s.
  *Used in:* Goresky–Klapper Corollary 6.2.2 (the period of an LFSR sequence divides the order of its connection polynomial); Goresky–Klapper §11.3 (correlations are sums over one period T); FF.4/m-sequence (an m-sequence of degree m has period q^m − 1).
  *Source:* `gk-asrs`, Chapter 5, Section 5.1.a 'Periodicity', printed p. 112.
- **The order (period, exponent) of a polynomial over a finite field** (definition, `polyOrder`; node `FF.4/order-of-polynomial`).
  Let F be a field and f ∈ F[X]. The order of f is polyOrder f := orderOf (AdjoinRoot.root f), the multiplicative order of the class of X in F[X]/(f). For f with f(0) ≠ 0 over a finite field it is the least e ≥ 1 with f ∣ X^e − 1; if f(0) = 0 (or f = 0 over an infinite field) the value is the junk 0. Pinned: the order of a constant nonzero polynomial is 1.
  *API:*
  - `polyOrder` (constructor): polyOrder f = orderOf (AdjoinRoot.root f).
  - `dvd_X_pow_polyOrder_sub_one` (simp): f ∣ X^(polyOrder f) − 1.
  - `dvd_X_pow_sub_one_iff_polyOrder_dvd` (characterisation): f ∣ X^e − 1 ↔ polyOrder f ∣ e.
  - `polyOrder_pos_iff` (characterisation): For F finite and f ≠ 0: 0 < polyOrder f ↔ f.coeff 0 ≠ 0.
  - `polyOrder_dvd_card_pow_sub_one` (relation): For F finite and f irreducible: polyOrder f ∣ q^(natDegree f) − 1.
  - `polyOrder_eq_orderOf` (compatibility): For f irreducible and α a root of f in a field L ⊇ F: polyOrder f = orderOf α.
  - `polyOrder_reverse` (relation): For f.coeff 0 ≠ 0: polyOrder f.reverse = polyOrder f.
  *Unit tests:*
  - `polyOrder_X_pow_four_add_X_add_one` (computation): polyOrder (X^4 + X + 1 : (ZMod 2)[X]) = 15.
  - `polyOrder_X_sq_add_X_add_one` (computation): polyOrder (X^2 + X + 1 : (ZMod 2)[X]) = 3.
  - `polyOrder_X` (non-example): polyOrder (X : F[X]) = 0: X is not invertible modulo X.
  - `polyOrder_X_add_one_sq` (degenerate): polyOrder ((X + 1)^2 : (ZMod 2)[X]) = 2 (a reducible polynomial whose order is not q^m − 1).
  *Used in:* Goresky–Klapper Corollary 6.2.2 (the period of an LFSR sequence divides the order of its connection polynomial, with equality for the impulse response); Goresky–Klapper Lemma 3.2.10 (f is primitive iff its order is q^{deg f} − 1); FF.4/period-of-irreducible-recurrence (the period of a nonzero sequence with irreducible characteristic polynomial equals the order).
  *Source:* `gk-asrs`, Chapter 3, Section 3.2, proof of Theorem 3.2.1, printed p. 65.
- **Primitive polynomials over a finite field** (definition, `IsPrimitivePoly`; node `FF.4/primitive-polynomial`).
  Let F be a finite field with q elements. A polynomial f ∈ F[X] is a primitive polynomial, IsPrimitivePoly f, if f is monic and irreducible of degree m ≥ 1 and the class of X generates the cyclic group (F[X]/(f))ˣ, i.e. polyOrder f = q^m − 1. Equivalently: f is the minimal polynomial over F of a generator of the multiplicative group of the field with q^m elements. Name pinned as IsPrimitivePoly because Mathlib's Polynomial.IsPrimitive means content 1.
  *API:*
  - `IsPrimitivePoly` (constructor): IsPrimitivePoly f :↔ f.Monic ∧ Irreducible f ∧ 1 ≤ f.natDegree ∧ polyOrder f = q^(natDegree f) − 1.
  - `IsPrimitivePoly.irreducible` (projection): A primitive polynomial is irreducible.
  - `isPrimitivePoly_iff_polyOrder` (characterisation): For monic f with 1 ≤ natDegree f and f.coeff 0 ≠ 0: IsPrimitivePoly f ↔ polyOrder f = q^(natDegree f) − 1.
  - `IsPrimitivePoly.root_zpowers` (characterisation): The class of X generates (AdjoinRoot f)ˣ.
  - `isPrimitivePoly_minpoly` (constructor): If γ generates the units of a finite field L ⊇ F of degree m, minpoly F γ is primitive of degree m.
  - `card_isPrimitivePoly` (other): The number of primitive polynomials of degree m ≥ 1 is φ(q^m − 1)/m.
  - `IsPrimitivePoly.reverse` (relation): The monic normalisation of the reverse of a primitive polynomial is primitive.
  *Unit tests:*
  - `IsPrimitivePoly.X_pow_four_add_X_add_one` (computation): IsPrimitivePoly (X^4 + X + 1 : (ZMod 2)[X]).
  - `IsPrimitivePoly.not_cyclotomic_five` (non-example): X^4 + X^3 + X^2 + X + 1 ∈ (ZMod 2)[X] is irreducible but not IsPrimitivePoly (its order is 5).
  - `IsPrimitivePoly.X_sub_two_zmod_five` (degenerate): For m = 1: IsPrimitivePoly (X − 2 : (ZMod 5)[X]) and ¬ IsPrimitivePoly (X − 4 : (ZMod 5)[X]).
  - `IsPrimitivePoly.content_primitive_not` (compatibility): Every monic polynomial is Polynomial.IsPrimitive (content 1), but X^4 + X^3 + X^2 + X + 1 ∈ (ZMod 2)[X] is monic and not IsPrimitivePoly: the two notions differ.
  *Used in:* Goresky–Klapper Proposition 13.1.2(1) (the connection polynomial of an m-sequence is primitive); Goresky–Klapper Corollary 6.2.2 (q* primitive iff T = |R|^{deg} − 1); FF.4/m-sequence (m-sequences are defined by primitive characteristic polynomials).
  *Source:* `gk-asrs`, Chapter 3, Section 3.2.c, printed p. 67.
- **Linear recurring sequences over a finite ring are eventually periodic** (theorem; node `FF.4/lrs-eventually-periodic`).
  Let R be a finite commutative ring and E : LinearRecurrence R of order m (Mathlib: u(n + m) = ∑_{i<m} c_i u(n + i)). Every solution u is eventually periodic. If the coefficient c_0 is a unit (equivalently the characteristic polynomial E.charPoly has unit constant coefficient), every solution is purely periodic: 0 < seqLeastPeriod u.
  *Hypotheses:* R finite commutative; m ≥ 0 (for m = 0 the only solution is 0).
  *Proof:* The state vector s_n = (u(n), …, u(n + m − 1)) ∈ R^m determines the future (s_{n+1} = A s_n with A the transposed companion matrix; ClassicalArithmeticCompletion:CA.2/linear-recurrence-as-a-matrix-power), and R^m is finite, so s_i = s_j for some i < j; then u(n + j − i) = u(n) for n ≥ i. If c_0 is a unit, the state map is invertible (det of the companion matrix is ± c_0; CA.2/companion-matrix), so s_i = s_j implies s_0 = s_{j−i}: purely periodic; conclude with least-period-of-sequence.
  *From other layers:* `ClassicalArithmeticCompletion:CA.2/linear-recurrence-as-a-matrix-power`, `ClassicalArithmeticCompletion:CA.2/companion-matrix`.
  *Source:* `gk-asrs`, Chapter 6, Section 6.1, printed p. 154.
- **The period of a linear recurring sequence divides the order of its characteristic polynomial** (theorem; node `FF.4/period-divides-polynomial-order`).
  Let F be a finite field, E : LinearRecurrence F of order m ≥ 1 with charPoly f := E.charPoly satisfying f.coeff 0 ≠ 0, and u a solution. Then u is purely periodic and seqLeastPeriod u ∣ polyOrder f.
  *Hypotheses:* F finite field; f(0) ≠ 0 (so polyOrder f > 0).
  *Proof:* Let T = polyOrder f, so f ∣ X^T − 1 (order-of-polynomial). The companion matrix A satisfies f(A) = 0 (CA.2/companion-matrix: minpoly of the companion matrix is f), hence A^T = I. s_T = A^T s_0 = s_0 (CA.2/linear-recurrence-as-a-matrix-power), so T is a period of u, and seqLeastPeriod u ∣ T (least-period-of-sequence).
  *From other layers:* `ClassicalArithmeticCompletion:CA.2/companion-matrix`, `ClassicalArithmeticCompletion:CA.2/linear-recurrence-as-a-matrix-power`.
  *Source:* `gk-asrs`, Chapter 6, Corollary 6.2.2 and proof, printed p. 159.
- **The impulse response has period exactly the order** (theorem; node `FF.4/impulse-response-period`).
  In the setting of period-divides-polynomial-order, the impulse-response solution (initial values u(0) = 1, u(1) = ⋯ = u(m − 1) = 0; Mathlib's E.mkSol) has seqLeastPeriod equal to polyOrder E.charPoly.
  *Hypotheses:* F finite field; m ≥ 1; E.charPoly has nonzero constant coefficient.
  *Proof:* The states s_0 = e_0, s_1, …, s_{m−1} of the impulse response form a basis of F^m (triangular with nonzero diagonal c_0; Goresky–Klapper's argument with the invertible coefficient). If r is a period of u, A^r fixes s_0 and hence every s_k = A^k s_0, so A^r = I and f ∣ X^r − 1 (f is the minimal polynomial of A, CA.2/companion-matrix); so polyOrder f ∣ r. Combine with period-divides-polynomial-order.
  *From other layers:* `ClassicalArithmeticCompletion:CA.2/companion-matrix`, `ClassicalArithmeticCompletion:CA.2/linear-recurrence-as-a-matrix-power`.
  *Source:* `gk-asrs`, Chapter 6, Corollary 6.2.2 and proof, printed p. 159.
- **Trace representation of linear recurring sequences with irreducible characteristic polynomial** (theorem; node `FF.4/trace-representation-of-lrs`).
  Let F be a finite field, E : LinearRecurrence F of order m ≥ 1 whose charPoly f is irreducible, L a field extension of F of degree m and β ∈ L a root of f. Then for every solution u there is a unique A ∈ L with u(n) = Tr_{L/F}(A β^n) for all n; conversely each such sequence is a solution. (In Goresky–Klapper's connection-polynomial convention a_n = T(α^{−n}A) with α = β^{−1} a root of the connection polynomial.)
  *Hypotheses:* F finite; f = E.charPoly irreducible of degree m; [L : F] = m; β a root of f in L.
  *Proof:* n ↦ Tr(A β^n) solves the recurrence: A β^n f(β) = 0 and Tr is F-linear (Goresky–Klapper Theorem 6.6.4). The map L → F^m, A ↦ (Tr(A β^i))_{i<m} is injective: if Tr(Aβ^i) = 0 for i < m then Tr(A x) = 0 for all x (1, β, …, β^{m−1} is a basis of L = F(β)), and the trace form is nondegenerate for the separable extension L/F (mathlib:traceForm_nondegenerate), so A = 0. Both sides have q^m elements, so the map is onto the space of initial values; solutions are determined by initial values (mathlib:LinearRecurrence.eq_mk_of_is_sol_of_eq_init).
  *From other layers:* `ClassicalArithmeticCompletion:CA.2/linear-recurrence-of-a-monic-polynomial`.
  *Source:* `gk-asrs`, Chapter 6, Theorem 6.6.4, printed p. 170.
- **A nonzero solution with irreducible characteristic polynomial has period equal to the order** (theorem; node `FF.4/period-of-irreducible-recurrence`).
  Let F be a finite field and E : LinearRecurrence F with irreducible charPoly f, f ≠ X. Every nonzero solution u has seqLeastPeriod u = polyOrder f; it divides q^m − 1, m = deg f.
  *Hypotheses:* F finite; f irreducible, f ≠ X (so f(0) ≠ 0).
  *Proof:* By trace-representation-of-lrs, u(n) = Tr(Aβ^n) with A ≠ 0. If T is a period then Tr(A(β^T − 1)β^n) = 0 for all n, hence A(β^T − 1) = 0 by nondegeneracy of the trace form (as in trace-representation-of-lrs), so β^T = 1 and polyOrder f = orderOf β ∣ T (order-of-polynomial, polyOrder_eq_orderOf). Conversely polyOrder f is a period (period-divides-polynomial-order).
  *Source:* `gk-asrs`, Chapter 6, Corollary 6.2.2 and Proposition 6.6.5, printed pp. 159, 171.
- **m-sequences (maximal-length linear recurring sequences)** (definition, `IsMSequence`; node `FF.4/m-sequence`; planet *m-sequences*).
  Let F be a finite field with q elements and m ≥ 1. A sequence u : ℕ → F is an m-sequence of degree m, IsMSequence m u, if u ≠ 0 and u solves a linear recurrence E : LinearRecurrence F of order m whose characteristic polynomial E.charPoly is a primitive polynomial (primitive-polynomial). Equivalent (Goresky–Klapper Definition 13.1.1): u is generated by a length-m recurrence and every nonzero block of length m occurs exactly once in each period (node m-sequence-state-cycle).
  *API:*
  - `IsMSequence` (constructor): IsMSequence m u :↔ u ≠ 0 ∧ ∃ E : LinearRecurrence F, E.order = m ∧ IsPrimitivePoly E.charPoly ∧ E.IsSolution u.
  - `IsMSequence.seqLeastPeriod_eq` (simp): seqLeastPeriod u = q^m − 1.
  - `IsMSequence.exists_trace` (characterisation): u(n) = Tr_{L/F}(A α^n) for some A ≠ 0 and α generating Lˣ, [L : F] = m.
  - `IsMSequence.seqShift` (structure): Shifts of m-sequences are m-sequences.
  - `IsMSequence.decimate` (structure): If gcd(d, q^m − 1) = 1 then n ↦ u(d n) is an m-sequence of degree m.
  - `IsMSequence.decimate_eq_shift_iff` (characterisation): n ↦ u(d n) is a shift of u iff d ≡ q^j (mod q^m − 1) for some j (Goresky–Klapper Proposition 13.2.1(3), with the congruence made explicit).
  *Unit tests:*
  - `IsMSequence.fibonacci_zmod_two` (computation): The Fibonacci sequence mod 2 is IsMSequence 2, with seqLeastPeriod 3.
  - `IsMSequence.goresky_klapper_example` (computation): The solution of u(n + 4) = u(n + 1) + u(n) over ZMod 2 with initial values 1, 1, 1, 1 is IsMSequence 4 with seqLeastPeriod 15.
  - `IsMSequence.not_period_five` (non-example): The solution of u(n + 4) = u(n + 3) + u(n + 2) + u(n + 1) + u(n) with initial values 1, 0, 0, 0 is not IsMSequence 4.
  - `IsMSequence.degree_one` (degenerate): For m = 1: u(n) = c·g^n with c ≠ 0 and g a generator of Fˣ is IsMSequence 1.
  - `IsMSequence.zero` (non-example): The zero sequence is not an m-sequence.
  *Used in:* Goresky–Klapper Proposition 13.1.2 (balance, run property, shift-and-add and ideal autocorrelation of m-sequences); Goresky–Klapper §13.5 (cross-correlation of an m-sequence with its decimations as a character sum); FiniteFieldsAndCharacterSums:FF.5/m-sequence-decimation-correlation-bound (Weil's bound applied to decimation cross-correlations).
  *From other layers:* `ClassicalArithmeticCompletion:CA.2/linear-recurrence-of-a-monic-polynomial`.
  *Source:* `gk-asrs`, Chapter 13, Definition 13.1.1, printed p. 312.
- **The states of an m-sequence run through all nonzero vectors** (theorem; node `FF.4/m-sequence-state-cycle`).
  Let u be an m-sequence of degree m over F (q elements). Then the map n ↦ (u(n), …, u(n + m − 1)), 0 ≤ n < q^m − 1, is a bijection onto F^m \ {0}. Conversely, a sequence generated by a length-m linear recurrence whose states in one period are exactly the nonzero vectors is an m-sequence.
  *Hypotheses:* F finite; m ≥ 1.
  *Proof:* The state map is conjugate to multiplication by α on L = F_{q^m} via the trace model (trace-representation-of-lrs: A ↦ (Tr(Aα^i))_{i<m} is an F-linear bijection L → F^m), and α generates Lˣ, so the orbit of A ≠ 0 is Lˣ. Converse (Goresky–Klapper Proposition 13.1.2(1)): the state change is multiplication by x^{−1} on F[x]/(q) (Theorem 6.6.2); cycling through all nonzero states forces every nonzero element to be a power of this element, so F[x]/(q) is a field and the characteristic polynomial is primitive.
  *Source:* `gk-asrs`, Chapter 13, Definition 13.1.1 and proof of Proposition 13.1.2, printed pp. 312–313.
- **Balance of m-sequences** (theorem; node `FF.4/m-sequence-balance`).
  Let u be an m-sequence of degree m over F with q elements, period N = q^m − 1. In one period each nonzero c ∈ F occurs exactly q^{m−1} times and 0 occurs exactly q^{m−1} − 1 times. More generally each block b ∈ F^k (1 ≤ k ≤ m) occurs q^{m−k} times, except the zero block, which occurs q^{m−k} − 1 times.
  *Hypotheses:* F finite; m ≥ 1; 1 ≤ k ≤ m.
  *Proof:* By m-sequence-state-cycle the length-m states in one period are the nonzero vectors, each once; a block of length k is the prefix of q^{m−k} vectors of F^m, all nonzero unless the block is zero, when the zero vector must be removed.
  *Source:* `gk-asrs`, Chapter 11, Section 11.2.d, printed p. 278.
- **The shift-and-add property of m-sequences** (theorem; node `FF.4/m-sequence-shift-and-add`).
  Let u be an m-sequence of degree m over F with period N = q^m − 1, c ∈ F and τ ∈ ℕ. Then the sequence n ↦ u(n) + c·u(n + τ) is either identically zero (exactly when 1 + cα^τ = 0 in the trace model; for c = 1 this means α^τ = −1, i.e. τ ≡ 0 mod N when q is even and τ ≡ N/2 mod N when q is odd) or a shift of u: there is s with u(n) + c·u(n + τ) = u(n + s) for all n.
  *Hypotheses:* F finite; m ≥ 1.
  *Proof:* With u(n) = Tr(Aα^n), u(n) + c u(n + τ) = Tr(A(1 + cα^τ)α^n); if 1 + cα^τ ≠ 0 it equals α^s for some s since α generates Lˣ, giving u(n + s).
  *Source:* `gk-asrs`, Chapter 13, Proposition 13.1.2(4), printed p. 312.
- **Periodic cross-correlation and autocorrelation** (definition, `periodicCorrelation`; node `FF.4/periodic-correlation`).
  For T ∈ ℕ and complex sequences u v : ℕ → ℂ, periodicCorrelation T u v τ := ∑_{i<T} u(i)·conj(v(i + τ)). For sequences a b : ℕ → G in a finite abelian group G and a character χ : AddChar G ℂ, the correlation with respect to χ is charCorrelation χ T a b τ := periodicCorrelation T (χ ∘ a) (χ ∘ b) τ = ∑_{i<T} χ(a_i − b_{i+τ}), and the autocorrelation is charCorrelation χ T a a. Conventions (pinned): the conjugate is on the second (shifted) argument; the sum runs over one period T supplied explicitly.
  *API:*
  - `periodicCorrelation` (constructor): periodicCorrelation T u v τ = ∑_{i<T} u i * conj (v (i + τ)).
  - `charCorrelation` (constructor): charCorrelation χ T a b τ = periodicCorrelation T (χ ∘ a) (χ ∘ b) τ.
  - `charCorrelation_eq_sum_sub` (characterisation): charCorrelation χ T a b τ = ∑_{i<T} χ (a i − b (i + τ)).
  - `periodicCorrelation_add_period` (relation): If u, v are T-periodic, periodicCorrelation T u v (τ + T) = periodicCorrelation T u v τ.
  - `periodicCorrelation_self_zero` (simp): For ‖u i‖ = 1: periodicCorrelation T u u 0 = T.
  - `periodicCorrelation_conj` (relation): conj (periodicCorrelation T u v τ) = periodicCorrelation T v u (T − τ) for T-periodic u, v and τ ≤ T.
  *Unit tests:*
  - `periodicCorrelation_const_one` (degenerate): periodicCorrelation T 1 1 τ = T.
  - `periodicCorrelation_alternating` (computation): For u n = (−1)^n: periodicCorrelation 2 u u 1 = −2.
  - `periodicCorrelation_needs_conj` (non-example): For u n = I (the imaginary unit): periodicCorrelation 1 u u 0 = 1, whereas ∑ u i * u i = −1: the conjugate is essential.
  - `charCorrelation_eq_sum_sub` (compatibility): charCorrelation χ T a b τ = ∑_{i<T} χ (a i − b (i + τ)).
  *Used in:* Goresky–Klapper §11.3.a (ideal autocorrelation and Golomb's third postulate); Goresky–Klapper §13.4–13.5 (cross-correlations of m-sequences and their decimations); Goresky–Klapper §14.8 (autocorrelation of Legendre and Dirichlet sequences); FiniteFieldsAndCharacterSums:FF.5/m-sequence-decimation-correlation-bound (the correlation is bounded by Weil's estimate).
  *Source:* `gk-asrs`, Chapter 11, Definition 11.3.1, printed p. 280.
- **Two-level autocorrelation of m-sequences** (theorem; node `FF.4/m-sequence-two-level-autocorrelation`).
  Let u be an m-sequence of degree m over F with q elements, N = q^m − 1, and χ : AddChar F ℂ nontrivial. Then charCorrelation χ N u u τ = N if N ∣ τ and = −1 otherwise.
  *Hypotheses:* F finite; χ ≠ 1.
  *Proof:* N ∣ τ: every term is χ(0) = 1. Otherwise u(i) − u(i + τ) = Tr(A(1 − α^τ)α^i) with c := A(1 − α^τ) ≠ 0, and i ↦ cα^i runs over Lˣ once per period; so the sum is ∑_{x ∈ Lˣ} χ(Tr x) = ∑_{x∈L} χ(Tr x) − 1 = −1, since χ ∘ Tr is a nontrivial character of L (Tr surjective) and mathlib:AddChar.sum_eq_zero_of_ne_one.
  *Source:* `gk-asrs`, Chapter 11, Section 11.3.a, printed p. 280.
- **Dirichlet and Legendre sequences** (definition, `dirichletSeq`; node `FF.4/dirichlet-sequence`).
  Let p be a prime, ψ : MulChar (ZMod p) ℂ and c ∈ ℂ. The Dirichlet sequence is dirichletSeq ψ c : ℕ → ℂ, n ↦ c if p ∣ n and ψ(n) otherwise; it has period p. The Legendre sequence of an odd prime p is legendreSeq p := dirichletSeq (quadratic character) 1, with values ±1. Convention (pinned): the value at multiples of p is the explicit parameter c (the source uses c = 0 for Dirichlet sequences and c = 1 for Legendre sequences), never Mathlib's MulChar value ψ(0) = 0 silently.
  *API:*
  - `dirichletSeq` (constructor): dirichletSeq ψ c n = if (n : ZMod p) = 0 then c else ψ n.
  - `legendreSeq` (constructor): legendreSeq p = dirichletSeq (quadratic character of ZMod p) 1.
  - `dirichletSeq_add_p` (simp): dirichletSeq ψ c (n + p) = dirichletSeq ψ c n.
  - `dirichletSeq_of_not_dvd` (simp): ¬ p ∣ n → dirichletSeq ψ c n = ψ n.
  - `legendreSeq_sq_eq_one` (simp): (legendreSeq p n)^2 = 1 for all n.
  *Unit tests:*
  - `legendreSeq_three` (computation): legendreSeq 3 0 = 1, legendreSeq 3 1 = 1, legendreSeq 3 2 = −1.
  - `legendreSeq_five` (computation): (legendreSeq 5 n)_{n<5} = (1, 1, −1, −1, 1).
  - `dirichletSeq_zero_eq` (compatibility): dirichletSeq ψ 0 n = ψ n for all n (Mathlib's MulChar vanishes at 0).
  - `legendreSeq_ne_quadraticChar` (non-example): legendreSeq p 0 = 1 ≠ 0 = quadraticChar (ZMod p) 0: the Legendre sequence is not the extended character.
  *Used in:* Goresky–Klapper Proposition 14.8.1 (the autocorrelation of Dirichlet and Legendre sequences); FF.4 target 'sequence correlation' (Legendre sequences are the second classical family with ideal autocorrelation).
  *Source:* `gk-asrs`, Chapter 14, Section 14.8, printed pp. 338–339.
- **Autocorrelation of Dirichlet and Legendre sequences** (theorem; node `FF.4/dirichlet-sequence-autocorrelation`).
  Let p be prime, ψ a nontrivial multiplicative character of ZMod p with values in ℂ, c ∈ {0, 1}, s = dirichletSeq ψ c and τ with p ∤ τ. Then ∑_{x<p} s(x + τ)·conj(s(x)) = −1 + c·(ψ(τ) + conj ψ(−τ)). For the Legendre sequence (p odd): the autocorrelation at τ ≢ 0 is −1 if p ≡ 3 (mod 4) and −1 + 2·legendre(τ/p) ∈ {1, −3} if p ≡ 1 (mod 4); at τ ≡ 0 it is p (and p − 1 for c = 0).
  *Hypotheses:* p prime; ψ ≠ 1; c ∈ {0, 1} (real); p ∤ τ.
  *Proof:* Split off x = 0 and x = −τ: the remaining terms are ψ((x + τ)x^{−1}) = ψ(1 + τx^{−1}) for x ∉ {0, −τ}. As x runs over (ZMod p)ˣ \ {−τ}, y = 1 + τx^{−1} runs over ZMod p \ {0, 1}, so their sum is ∑_{y≠0} ψ(y) − ψ(1) = −1 (character orthogonality, MulChar.sum_eq_zero_of_ne_one). The boundary terms are ψ(τ)conj(c) + c·conj ψ(−τ). For the quadratic character ψ(−1) = (−1)^{(p−1)/2} (quadraticChar_neg_one / FiniteField.isSquare_neg_one_iff), giving the two Legendre cases. At τ ≡ 0: ∑ |s(x)|² = (p − 1) + |c|².
  *Source:* `gk-asrs`, Chapter 14, Proposition 14.8.1, printed p. 339.
- **Cross-correlation of an m-sequence with its decimation is a character sum** (lemma; node `FF.4/decimation-cross-correlation-character-sum`).
  Let F be a finite field with q elements, L ⊇ F of degree m, α a generator of Lˣ, a(n) = Tr_{L/F}(α^n) and b(n) = a(dn) its d-fold decimation (d ≥ 1), N = q^m − 1 and χ : AddChar F ℂ. Then for every t, charCorrelation χ N b a t = ∑_{x ∈ L} χ(Tr_{L/F}(x^d − α^t x)) − 1.
  *Hypotheses:* F finite; α generates Lˣ; d ≥ 1.
  *Proof:* Write the sum over i < N with x = α^i ranging over Lˣ once: χ(b_i) conj χ(a_{i+t}) = χ(Tr(x^d) − Tr(α^t x)) = χ(Tr(x^d − α^t x)) (periodic-correlation, character form). Add and subtract the x = 0 term, which is χ(0) = 1.
  *Source:* `gk-asrs`, Chapter 13, Proposition 13.5.1 and proof (13.4)–(13.7), printed pp. 318–319.

### 4E. Evaluation, BCH and algebraic geometry codes

Guruswami–Rudra–Sudan, *Essential Coding Theory*, Chapter 4 (Singleton bound), Chapter 5 (Reed–Solomon and
generalized Reed–Solomon codes, their duals, BCH codes and their bounds), and Couvreur–Randriambololona, *Algebraic
geometry codes and some applications* (§§3–4: evaluation and residue codes, parameters, duality). AlgebraicCodingTheory
layers 1–2 supply linear codes, generator matrices, minimum distance and dual codes; AlgebraicCurves layers 3–5 supply
the function-field objects; both are built at the pin and are cited as baseline declarations, with a request to each
layer. The duality `C_Ω(D, G) = C_L(D, G)^⊥` (Couvreur–Randriambololona Theorem 12) is proved through Tau Ceti's
local components and the residue theorem. The proof of their Theorem 37 (classical Goppa codes) drops `P_∞` from a
divisor (E511, a misprint).


- **The Singleton bound for linear codes** (theorem; node `FF.4/singleton-bound`).
  Let F be a field, ι a finite type with n = #ι, and C ≤ F^ι a linear code (TauCeti.LinearCode F ι = Submodule F (ι → F)) with k = finrank F C ≥ 1. Then some nonzero c ∈ C has hammingNorm c ≤ n − k + 1; equivalently, if every nonzero codeword has weight ≥ d then k ≤ n − d + 1.
  *Hypotheses:* F a field (finite in the source; not needed); ι finite; k ≥ 1 (for the zero code the statement is vacuous).
  *Proof:* Choose any set S ⊆ ι of k − 1 coordinates. The restriction C → F^S has kernel of dimension ≥ k − (k − 1) = 1 (rank–nullity, LinearMap.finrank_range_add_finrank_ker), so some nonzero c ∈ C vanishes on S. hammingNorm c ≤ n − (k − 1) since c vanishes on the k − 1 coordinates of S (hammingNorm counts nonzero coordinates, mathlib:hammingNorm).
  *Tau Ceti layers:* AlgebraicCodingTheory — layer-1-finite-codes-matrices-and-elementary-constructions.
  *Source:* `grs-ect`, Chapter 4, Theorem 4.3.1, printed p. 79.
- **Maximum distance separable (MDS) codes** (definition, `IsMDS`; node `FF.4/mds-code`).
  Let F be a field with decidable equality, ι finite with n = #ι. A linear code C ≤ F^ι is MDS, IsMDS C, if every nonzero codeword c ∈ C has hammingNorm c ≥ n − finrank F C + 1, i.e. its minimum distance equals the Singleton value n − k + 1 (singleton-bound gives the reverse inequality when k ≥ 1). The predicate is stated with Mathlib's hammingNorm so it does not depend on a bundled minimum-distance invariant; with AlgebraicCodingTheory Layer 2's minimum distance d(C) (zero-code convention d(⊥) = 0), a nonzero code is MDS iff d(C) = n − k + 1.
  *API:*
  - `IsMDS` (constructor): IsMDS C :↔ ∀ c ∈ C, c ≠ 0 → Fintype.card ι + 1 ≤ hammingNorm c + finrank F C.
  - `IsMDS.restrict_bijective` (characterisation): For S : Finset ι with #S = finrank F C, restriction C → (S → F) is bijective.
  - `isMDS_iff_restrict_injective` (characterisation): IsMDS C ↔ restriction to every set of finrank F C coordinates is injective.
  - `IsMDS.exists_weight_eq` (other): If C ≠ ⊥ is MDS, some codeword has weight exactly n − k + 1 (with singleton-bound).
  - `IsMDS.map_diagonal` (functoriality): Scaling coordinates by nonzero constants preserves MDS.
  *Unit tests:*
  - `IsMDS.repetition` (computation): The repetition code span {1} ≤ F^n (n ≥ 1) is MDS.
  - `IsMDS.top` (degenerate): ⊤ ≤ F^ι is MDS (k = n, every nonzero word has weight ≥ 1).
  - `IsMDS.bot` (degenerate): ⊥ is MDS vacuously (it has no nonzero codeword).
  - `IsMDS.not_two_by_two_repetition` (non-example): The binary code spanned by (1,1,0,0) and (0,0,1,1) is not MDS.
  *Used in:* ECT Theorem 5.2.4 (Reed–Solomon codes are MDS); ECT Exercise 5.14(2) (MDS codes are k-wise independent sources); Couvreur–Randriambololona §8.4 (Shamir's secret sharing properties (i), (ii) reflect the MDS property of Reed–Solomon codes (FF.5/shamir-secret-sharing)).
  *Tau Ceti layers:* AlgebraicCodingTheory — layer-2-hamming-data-and-dual-codes.
  *Source:* `grs-ect`, Chapter 5, Definition 5.3.1, printed p. 101.
- **Reed–Solomon codes** (definition, `reedSolomonEncode`; node `FF.4/reed-solomon-code`; planet *Reed–Solomon codes*).
  Let F be a field, ι finite, α : ι → F (the evaluation points) and k ∈ ℕ. The Reed–Solomon code is reedSolomon α k := the image of the evaluation map reedSolomonEncode α k : Polynomial.degreeLT F k →ₗ[F] (ι → F), p ↦ (p.eval (α i))_i. Pinned: messages are polynomials of degree < k identified with F^k by the coefficient basis 1, X, …, X^{k−1} (the Vandermonde generator matrix); the theorems about dimension and distance assume α injective and k ≤ #ι, which forces #ι ≤ #F (the field-size restriction n ≤ q).
  *API:*
  - `reedSolomonEncode` (constructor): reedSolomonEncode α k : degreeLT F k →ₗ[F] (ι → F), p ↦ fun i ↦ p.eval (α i).
  - `reedSolomon` (constructor): reedSolomon α k = LinearMap.range (reedSolomonEncode α k).
  - `mem_reedSolomon_iff` (characterisation): c ∈ reedSolomon α k ↔ ∃ p, p.degree < k ∧ ∀ i, c i = p.eval (α i).
  - `reedSolomonEncode_injective` (characterisation): α injective and k ≤ #ι ⇒ the encoding map is injective.
  - `finrank_reedSolomon` (simp): α injective and k ≤ #ι ⇒ finrank F (reedSolomon α k) = k.
  - `card_le_card_of_reedSolomon` (other): α injective ⇒ #ι ≤ #F (length at most the field size).
  - `reedSolomon_mono` (structure): k ≤ k′ ⇒ reedSolomon α k ≤ reedSolomon α k′.
  - `reedSolomon_eq_top` (simp): α injective and #ι ≤ k ⇒ reedSolomon α k = ⊤ (Lagrange interpolation).
  - `reedSolomon_eq_range_vandermonde` (equivalence): reedSolomon α k = LinearMap.range (V.vecMulLinear) for V : Matrix (Fin k) ι F, V j i = α i ^ j.
  *Unit tests:*
  - `reedSolomon_zmod_three_two` (computation): For α = id : ZMod 3 → ZMod 3, Nat.card (reedSolomon α 2) = 9 and (0, 1, 2) ∈ reedSolomon α 2.
  - `reedSolomon_zero` (degenerate): reedSolomon α 0 = ⊥.
  - `reedSolomon_one` (compatibility): reedSolomon α 1 = span {fun _ ↦ 1} (the repetition code).
  - `reedSolomon_repeated_points` (non-example): For α = ![0, 0] : Fin 2 → F, finrank F (reedSolomon α 2) = 1 < 2: injectivity of α is needed for dimension k.
  *Used in:* ECT Theorem 5.2.4 (RS is an [n, k, n − k + 1] code meeting the Singleton bound); ECT Exercise 5.11 (binary BCH codes are subfield subcodes of Reed–Solomon codes); Couvreur–Randriambololona Proposition 32 (RS codes are the algebraic geometry codes of the projective line with G = (k − 1)P∞); FiniteFieldsAndCharacterSums:FF.5/shamir-secret-sharing (share vectors of Shamir's scheme are Reed–Solomon codewords); FF.4 acceptance (encoding maps, dimension and distance bounds with the field-size and length restrictions).
  *Tau Ceti layers:* AlgebraicCodingTheory — layer-1-finite-codes-matrices-and-elementary-constructions.
  *Source:* `grs-ect`, Chapter 5, Definition 5.2.1, printed p. 98.
- **Nonzero Reed–Solomon codewords have weight at least n − k + 1** (theorem; node `FF.4/reed-solomon-min-weight`).
  Let α : ι → F be injective and k ≤ n = #ι. Every nonzero c ∈ reedSolomon α k has hammingNorm c ≥ n − k + 1.
  *Hypotheses:* α injective; k ≤ #ι.
  *Proof:* c = (p(α_i))_i with p ≠ 0 of degree < k; the zero coordinates are the α_i that are roots of p, at most k − 1 of them since α is injective and p has at most natDegree p ≤ k − 1 roots (mathlib:Polynomial.card_roots').
  *Source:* `grs-ect`, Chapter 5, Claim 5.2.3 and proof, printed pp. 99–100.
- **Reed–Solomon codes are MDS, with minimum distance exactly n − k + 1** (theorem; node `FF.4/reed-solomon-is-mds`).
  Let α : ι → F be injective and 1 ≤ k ≤ n = #ι. Then reedSolomon α k is an [n, k, n − k + 1] code: finrank = k, IsMDS, and some codeword has weight exactly n − k + 1.
  *Hypotheses:* α injective; 1 ≤ k ≤ #ι (for k = 0 the code is ⊥ and has minimum distance 0 by the zero-code convention, not n + 1).
  *Proof:* Dimension: finrank_reedSolomon (reed-solomon-code). IsMDS: reed-solomon-min-weight. A codeword of weight exactly n − k + 1: evaluate ∏_{j<k−1}(X − α_{i_j}) for k − 1 distinct points (ECT Exercise 5.2); or combine singleton-bound.
  *Source:* `grs-ect`, Chapter 5, Theorem 5.2.4, printed p. 100.
- **Generalized Reed–Solomon codes** (definition, `generalizedReedSolomon`; node `FF.4/generalized-reed-solomon-code`).
  For α : ι → F, k ∈ ℕ and a multiplier vector v : ι → F with all v i ≠ 0, the generalized Reed–Solomon code is GRS(α, k, v) := {(v_i p(α_i))_i : deg p < k}, the image of reedSolomon α k under the diagonal scaling c ↦ (v_i c_i)_i. GRS(α, k, 1) = reedSolomon α k.
  *API:*
  - `generalizedReedSolomon` (constructor): generalizedReedSolomon α k v = map (diagonal scaling by v) (reedSolomon α k).
  - `mem_generalizedReedSolomon_iff` (characterisation): c ∈ GRS(α, k, v) ↔ ∃ p, p.degree < k ∧ ∀ i, c i = v i * p.eval (α i).
  - `finrank_generalizedReedSolomon` (simp): α injective, k ≤ #ι, all v i ≠ 0 ⇒ finrank = k.
  - `isMDS_generalizedReedSolomon` (other): α injective, k ≤ #ι, all v i ≠ 0 ⇒ IsMDS.
  *Unit tests:*
  - `generalizedReedSolomon_one` (compatibility): generalizedReedSolomon α k 1 = reedSolomon α k.
  - `generalizedReedSolomon_zero` (degenerate): generalizedReedSolomon α 0 v = ⊥.
  - `generalizedReedSolomon_ne_reedSolomon` (non-example): Over ZMod 3 with α = id, k = 1, v = ![1, 1, 2]: generalizedReedSolomon α 1 v ≠ reedSolomon α 1 (the codeword (1, 1, 2) is not constant).
  - `finrank_generalizedReedSolomon_test` (computation): Over ZMod 5 with α = id, k = 2 and v = ![1, 2, 3, 4, 1]: finrank = 2.
  *Used in:* ECT Exercise 5.10(2) (the dual of a GRS code is a GRS code); ECT Exercise 5.12 (subfield subcodes of GRS codes (alternant codes) meet the Gilbert–Varshamov bound); Couvreur–Randriambololona Theorem 33 (GRS codes are exactly the AG codes of the projective line avoiding P∞).
  *Source:* `grs-ect`, Chapter 5, Exercise 5.10, printed p. 104.
- **The dual of a GRS code is a GRS code** (theorem; node `FF.4/dual-of-generalized-reed-solomon`).
  Let α : ι → F be injective, n = #ι, k ≤ n and v : ι → F with all v i ≠ 0. Put u_i = (v_i ∏_{j≠i}(α_i − α_j))^{−1}. Then the Euclidean dual (the orthogonal of the dot-product form, AlgebraicCodingTheory Layer 2's C^⊥) of GRS(α, k, v) is GRS(α, n − k, u).
  *Hypotheses:* α injective; k ≤ n; v i ≠ 0; the dual is taken for the bilinear form ⟨x, y⟩ = ∑ x_i y_i (no conjugation).
  *Proof:* It suffices to show ∑_i u_i v_i p(α_i) q(α_i) = 0 for deg p < k, deg q < n − k, then compare dimensions k + (n − k) = n (the dual has dimension n − k). h = pq has degree ≤ n − 2; by Lagrange interpolation h = ∑_i h(α_i) L_i with L_i = ∏_{j≠i}(X − α_j)/∏_{j≠i}(α_i − α_j) (mathlib:Lagrange.basis), and the X^{n−1}-coefficient of h, which is 0, equals ∑_i h(α_i)/∏_{j≠i}(α_i − α_j) = ∑_i u_i v_i h(α_i).
  *Tau Ceti layers:* AlgebraicCodingTheory — layer-2-hamming-data-and-dual-codes.
  *Source:* `grs-ect`, Chapter 5, Exercise 5.10(2), printed pp. 104–105.
- **Full-length Reed–Solomon codes are dual to each other** (theorem; node `FF.4/full-length-reed-solomon-dual`).
  Let F be a finite field with q elements and α an enumeration of F (α : F → F the identity, ι = F). Then the Euclidean dual of reedSolomon α k is reedSolomon α (q − k) for 0 ≤ k ≤ q; in particular RS(α, q/2) is self-dual when q is even.
  *Hypotheses:* F finite; α bijective onto F.
  *Proof:* ∏_{j≠i}(α_i − α_j) = f′(α_i) for f = ∏_j (X − α_j) = X^q − X, whose derivative is qX^{q−1} − 1 = −1; so u_i = −1/v_i = −1 for v = 1 and dual-of-generalized-reed-solomon gives GRS(α, q − k, −1) = RS(α, q − k). Alternative: ∑_{x∈F} x^j = 0 for 0 ≤ j < q − 1 (mathlib:FiniteField.sum_pow_lt_card_sub_one) applied to products of monomials of degree < k and < q − k.
  *Source:* `grs-ect`, Chapter 5, Exercise 5.8, printed p. 104.
- **Reed–Solomon codes on the multiplicative group are cut out by power-sum checks** (theorem; node `FF.4/reed-solomon-check-characterisation`).
  Let F be a finite field with q elements, n = q − 1, γ a generator of Fˣ, α_i = γ^i (i < n) and 1 ≤ k ≤ n. Then reedSolomon α k = {c ∈ F^n : ∑_{i<n} c_i γ^{iℓ} = 0 for 1 ≤ ℓ ≤ n − k}.
  *Hypotheses:* F finite; γ generates Fˣ; α_i = γ^i.
  *Proof:* ⊆: for c_i = p(γ^i) with p = ∑_{j<k} p_j X^j, ∑_i c_i γ^{iℓ} = ∑_j p_j ∑_i γ^{i(j+ℓ)}, and ∑_{i<n} γ^{is} = 0 unless n ∣ s; here 1 ≤ j + ℓ ≤ n − 1. Equality by dimension: the n − k check equations are linearly independent (Vandermonde in the distinct γ^ℓ), so the right side has dimension k = finrank of the left (reed-solomon-code).
  *Source:* `grs-ect`, Chapter 5, Exercise 5.9, printed p. 104.
- **Subfield subcodes** (definition, `subfieldSubcode`; node `FF.4/subfield-subcode`).
  Let F ⊆ E be fields ([Algebra F E]) and C ≤ E^ι a linear code over E. Its subfield subcode is subfieldSubcode F C := {x ∈ F^ι : (algebraMap F E ∘ x) ∈ C}, an F-linear code (the comap of C, viewed as an F-subspace by restriction of scalars, under the coordinatewise inclusion F^ι → E^ι).
  *API:*
  - `subfieldSubcode` (constructor): subfieldSubcode F C = comap (coordinatewise algebraMap) (C.restrictScalars F).
  - `mem_subfieldSubcode_iff` (characterisation): x ∈ subfieldSubcode F C ↔ (fun i ↦ algebraMap F E (x i)) ∈ C.
  - `hammingNorm_le_of_mem_subfieldSubcode` (relation): Weights are preserved by the inclusion, so the minimum weight does not decrease.
  - `finrank_subfieldSubcode_ge` (relation): If [E : F] = m then finrank F (subfieldSubcode F C) + m (n − finrank E C) ≥ n.
  - `subfieldSubcode_mono` (structure): C ≤ D ⇒ subfieldSubcode F C ≤ subfieldSubcode F D.
  *Unit tests:*
  - `subfieldSubcode_top` (degenerate): subfieldSubcode F (⊤ : Submodule E (ι → E)) = ⊤.
  - `subfieldSubcode_self` (compatibility): subfieldSubcode F C over E = F (Algebra.id) is C.
  - `subfieldSubcode_ne_trace_code` (non-example): For E = GaloisField 2 2, γ ∉ range (algebraMap (ZMod 2) E) and C = span_E {![1, γ]}: subfieldSubcode (ZMod 2) C = ⊥ although C ≠ ⊥ — the subfield subcode is an intersection, not the (nonzero) trace image of C.
  - `finrank_subfieldSubcode_rs` (computation): For E = GaloisField 2 2, γ a generator of Eˣ, α i = γ^i (i < 3) and k = 2: finrank (ZMod 2) (subfieldSubcode (ZMod 2) (reedSolomon α 2)) = 1 (the binary repetition code).
  *Used in:* ECT Exercise 5.11 (binary BCH codes are subfield subcodes of Reed–Solomon codes); Couvreur–Randriambololona §3.2, Remark 36 (classical Goppa and alternant codes are subfield subcodes of GRS/AG codes); Couvreur–Randriambololona §7.5.3 (only subfield subcodes of AG codes resist known attacks in McEliece-type schemes).
  *Source:* `cr-ag-codes`, Definition 31, printed p. 14.
- **Primitive narrow-sense BCH codes** (definition, `bchCode`; node `FF.4/bch-code`).
  Let F be a finite field with q elements, E a finite extension of degree m, N = #E − 1 = q^m − 1, γ a generator of Eˣ and 2 ≤ δ ≤ N. The (primitive, narrow-sense) BCH code of designed distance δ is bchCode F γ δ := subfieldSubcode F (reedSolomon α (N − δ + 1)) with α_i = γ^i (i < N); equivalently (reed-solomon-check-characterisation) the words c ∈ F^N with ∑_{i<N} c_i γ^{iℓ} = 0 for 1 ≤ ℓ ≤ δ − 1. Length restriction (pinned): n = q^m − 1.
  *API:*
  - `bchCode` (constructor): bchCode F γ δ = subfieldSubcode F (reedSolomon (fun i ↦ γ^i) (N − δ + 1)).
  - `mem_bchCode_iff` (characterisation): Membership by the δ − 1 check equations.
  - `bchCode_cyclic` (structure): bchCode is invariant under the cyclic shift of coordinates.
  - `bchCode_antitone` (structure): δ ≤ δ′ ⇒ bchCode F γ δ′ ≤ bchCode F γ δ.
  *Unit tests:*
  - `bchCode_hamming` (computation): For F = ZMod 2, E = GaloisField 2 3 and δ = 3: finrank = 4 and the minimum weight is 3 (the Hamming code).
  - `bchCode_fifteen_seven` (computation): For F = ZMod 2, E = GaloisField 2 4 and δ = 5: finrank (bchCode) = 7 (the [15, 7, 5] code).
  - `bchCode_degree_one` (degenerate): For E = F (m = 1), bchCode F γ δ = reedSolomon α (N − δ + 1).
  - `bchCode_mem_iff_check` (compatibility): c ∈ bchCode F γ δ ↔ ∀ ℓ, 1 ≤ ℓ → ℓ ≤ δ − 1 → ∑_i algebraMap F E (c i) * γ^(i ℓ) = 0.
  *Used in:* ECT Exercise 5.11(1)–(2) (distance ≥ δ and dimension bounds of BCH codes); FF.4 acceptance (BCH examples with field-size and length restrictions).
  *Source:* `grs-ect`, Chapter 5, Exercise 5.11, printed p. 105.
- **The BCH bound** (theorem; node `FF.4/bch-bound`).
  Every nonzero codeword of bchCode F γ δ has hammingNorm ≥ δ.
  *Hypotheses:* As in bch-code.
  *Proof:* By subfield-subcode weights are preserved, and the ambient Reed–Solomon code has minimum weight N − (N − δ + 1) + 1 = δ (reed-solomon-min-weight, γ^i distinct since γ has order N).
  *Source:* `grs-ect`, Chapter 5, Exercise 5.11(1), printed p. 105.
- **Dimension bound for BCH codes** (theorem; node `FF.4/bch-dimension-bound`).
  finrank F (bchCode F γ δ) ≥ N − m(δ − 1), where m = [E : F].
  *Hypotheses:* As in bch-code.
  *Proof:* subfield-subcode dimension bound with n − k = δ − 1.
  *Source:* `grs-ect`, Chapter 5, Exercise 5.11(1), printed p. 105.
- **The improved dimension bound for binary BCH codes** (theorem; node `FF.4/binary-bch-dimension-bound`).
  For F = ZMod 2: finrank (bchCode (ZMod 2) γ δ) ≥ N − m⌈(δ − 1)/2⌉.
  *Hypotheses:* q = 2; as in bch-code.
  *Proof:* For c ∈ F₂^N, C(γ^{2ℓ}) = C(γ^ℓ)² where C(X) = ∑ c_i X^i (Frobenius, coefficients in F₂); so the checks at even ℓ follow from those at ℓ/2 and only the ⌈(δ − 1)/2⌉ odd ℓ in [1, δ − 1] are needed; each is m binary equations.
  *Source:* `grs-ect`, Chapter 5, Exercise 5.11(2), printed p. 105.
- **Evaluation of functions at a rational place** (construction, `evalAtRational`; node `FF.4/evaluation-at-rational-place`).
  Let F/k be a function field (TauCeti.IsFunctionField k F) and P a rational place (P.degree = 1, TauCeti.Place.degree). For f in the valuation ring 𝒪_P (TauCeti.Place.integers P) its value is f(P) := (Place.residueFieldEquivOfDegreeEqOne P h).symm (residue f) ∈ k. Pinned: evalAtRational P h : P.integers →ₐ[k] k is a k-algebra map with kernel the maximal ideal; for functions outside 𝒪_P no value is assigned.
  *API:*
  - `evalAtRational` (constructor): evalAtRational P h : P.integers →ₐ[k] k, the composite of the residue map with the inverse of residueFieldEquivOfDegreeEqOne.
  - `evalAtRational_algebraMap` (simp): evalAtRational P h (algebraMap k _ c) = c.
  - `evalAtRational_eq_zero_iff` (characterisation): evalAtRational P h f = 0 ↔ f lies in the kernel, which is the maximal ideal of 𝒪_P (for f ≠ 0: ↔ 0 < P.ord f).
  - `evalAtRational_apply_ker` (characterisation): The kernel of evalAtRational is a proper ideal (the maximal ideal of 𝒪_P), and algebraMap k P.ResidueField (evalAtRational P h f) = residue f.
  *Unit tests:*
  - `evalAtRational_algebraMap` (degenerate): evalAtRational P h (algebraMap k F c) = c.
  - `evalAtRational_X_ratFunc` (computation): In RatFunc k at the place of X − C a, the value of X is a.
  - `evalAtRational_ker` (characterisation): evalAtRational P h f = 0 ↔ f ∈ the maximal ideal of 𝒪_P.
  - `evalAtRational_not_defined_at_pole` (non-example): 1/(X − a) ∉ 𝒪_{P_{X−a}}: there is no value at a pole (the map is defined on 𝒪_P only).
  *Used in:* Couvreur–Randriambololona Definition 10 (the evaluation code evaluates L(G) at rational places); FF.4/residue-code-is-dual (ω_{P}(f) = f(P)·ω_P(1) for ω with a simple pole at P and f regular at P).
  *Tau Ceti layers:* AlgebraicCurves — layer-3-divisors-ld-riemanns-theorem-and-the-genus.
  *Source:* `cr-ag-codes`, Definition 10, printed p. 9.
- **Algebraic geometry evaluation codes C_L(D, G)** (definition, `agEvaluationMap`; node `FF.4/algebraic-geometry-evaluation-code`; planet *Algebraic geometry codes*).
  Let k be a finite field, F/k a function field with exact constant field k (IsFunctionField k F and IsIntegrallyClosedIn k F), G a divisor, and P_1, …, P_n pairwise distinct rational places not in the support of G; put D = P_1 + ⋯ + P_n. The evaluation code is C_L(D, G) := the image of the k-linear map ev : L(G) → k^n, f ↦ (f(P_1), …, f(P_n)), where L(G) = TauCeti.riemannRochSpace G and f(P_i) is evalAtRational (f ∈ 𝒪_{P_i} because P_i ∉ supp G).
  *API:*
  - `agEvaluationMap` (constructor): The k-linear map L(G) → (Fin n → k), f ↦ (f(P_i))_i.
  - `agEvaluationCode` (constructor): agEvaluationCode P G = LinearMap.range (agEvaluationMap P G).
  - `ker_agEvaluationMap` (characterisation): ker ev = L(G − D) (as a subspace of L(G)).
  - `agEvaluationCode_mono` (structure): G ≤ G′ with the same support condition ⇒ C_L(D, G) ≤ C_L(D, G′).
  *Unit tests:*
  - `agEvaluationCode_eq_bot_of_degree_neg` (degenerate): Divisor.degree G < 0 ⇒ agEvaluationCode P G = ⊥.
  - `agEvaluationCode_ratFunc` (compatibility): Over RatFunc k with G = (k − 1)·P∞ and P_i the places of X − α_i: agEvaluationCode P G = reedSolomon α k (node reed-solomon-as-ag-code).
  - `agEvaluationCode_zero_divisor` (computation): For G = 0 (exact constants): agEvaluationCode P 0 = span {1} (the repetition code), since L(0) = k.
  - `agEvaluationCode_needs_disjoint_support` (non-example): If P_1 ∈ supp G with G(P_1) > 0, functions in L(G) may have a pole at P_1 and have no value there, so the construction requires G.coeff (P i) = 0.
  *Used in:* Couvreur–Randriambololona Theorem 21 (dimension ℓ(G) − ℓ(G − D) and Goppa bound d ≥ n − deg G); Couvreur–Randriambololona Theorem 12 (C_Ω(D, G) = C_L(D, G)^⊥); ECT Exercise 5.23 (the Hermitian-curve code as an explicit AG code); FF.4 target 'evaluation/residue codes connected to AlgebraicCurves' (the code family built on Tau Ceti's L(D)).
  *Tau Ceti layers:* AlgebraicCurves — layer-3-divisors-ld-riemanns-theorem-and-the-genus.
  *Source:* `cr-ag-codes`, Section 3.1 and Definition 10, printed p. 9.
- **Dimension of algebraic geometry codes** (theorem; node `FF.4/ag-code-dimension`).
  In the setting of algebraic-geometry-evaluation-code with g the genus (TauCeti.genus k F): finrank k C_L(D, G) = ℓ(G) − ℓ(G − D). If deg G < n then finrank C_L = ℓ(G) ≥ deg G + 1 − g, and if moreover 2g − 2 < deg G < n then finrank C_L = deg G + 1 − g.
  *Hypotheses:* As in algebraic-geometry-evaluation-code; ℓ = TauCeti.Divisor.dim.
  *Proof:* ker ev = L(G − D): f(P_i) = 0 means v_{P_i}(f) ≥ 1 = −(G − D)(P_i) (G(P_i) = 0), and the conditions at other places are those of L(G). Rank–nullity gives the first formula. deg (G − D) = deg G − n < 0 ⇒ L(G − D) = 0 (tauceti:TauCeti.riemannRochSpace_eq_bot_of_lt_zero via degree, or riemannRochSpace_eq_bot_of_degree_neg), and Riemann's inequality ℓ(G) ≥ deg G + 1 − g (tauceti:TauCeti.Divisor.degree_add_one_sub_genus_le_dim). deg G ≥ 2g − 1 ⇒ ℓ(G) = deg G + 1 − g (tauceti:TauCeti.Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree).
  *Tau Ceti layers:* AlgebraicCurves — layer-3-divisors-ld-riemanns-theorem-and-the-genus; AlgebraicCurves — layer-5-consequences-of-riemannroch-and-local-components.
  *Source:* `cr-ag-codes`, Theorem 21, printed p. 11.
- **The Goppa bound d ≥ n − deg G** (theorem; node `FF.4/goppa-bound`).
  In the setting of algebraic-geometry-evaluation-code, every nonzero c ∈ C_L(D, G) has hammingNorm c ≥ n − deg G.
  *Hypotheses:* As in algebraic-geometry-evaluation-code.
  *Proof:* c = ev(f) with f ≠ 0; if c vanishes at the places P_i, i ∈ S, then f ∈ L(G − ∑_{i∈S} P_i) ≠ 0, so deg G − #S ≥ 0 (a nonzero L(A) forces deg A ≥ 0: tauceti:TauCeti.riemannRochSpace_eq_bot_of_degree_neg). hammingNorm c = n − #S ≥ n − deg G.
  *Tau Ceti layers:* AlgebraicCurves — layer-3-divisors-ld-riemanns-theorem-and-the-genus.
  *Source:* `cr-ag-codes`, Theorem 21, printed p. 11.
- **The Singleton defect of an AG code is at most the genus** (theorem; node `FF.4/ag-code-singleton-defect`).
  If deg G < n then every nonzero codeword of C_L(D, G) has weight ≥ n + 1 − g − finrank C_L; i.e. k + d ≥ n + 1 − g.
  *Hypotheses:* As in algebraic-geometry-evaluation-code, with deg G < n.
  *Proof:* Combine ag-code-dimension (k ≥ deg G + 1 − g) with goppa-bound (d ≥ n − deg G).
  *Source:* `cr-ag-codes`, Corollary 23, printed p. 12.
- **Reed–Solomon codes are the AG codes of the rational function field** (comparison; node `FF.4/reed-solomon-as-ag-code`).
  Let k be a finite field, x_1, …, x_n distinct elements of k and 1 ≤ k₀ ≤ n. In F = RatFunc k with P_i the place of X − x_i and G = (k₀ − 1)·P∞ (TauCeti.Place.infty), C_L(D, G) = reedSolomon x k₀.
  *Hypotheses:* Distinct x_i; 1 ≤ k₀ ≤ n (so deg G < n).
  *Proof:* L((k₀ − 1)P∞) is the space of polynomials of degree ≤ k₀ − 1 (tauceti:TauCeti.riemannRochSpace_zsmul_ofPoint_infty). The value of a polynomial p at the place of X − x_i is p(x_i) (evaluation-at-rational-place, residue of p modulo X − x_i). The supports are disjoint since the P_i are finite places.
  *Tau Ceti layers:* AlgebraicCurves — layer-3-divisors-ld-riemanns-theorem-and-the-genus.
  *Source:* `cr-ag-codes`, Proposition 32 and proof, printed p. 14.
- **Algebraic geometry residue codes C_Ω(D, G)** (definition, `agResidueMap`; node `FF.4/algebraic-geometry-residue-code`).
  In the setting of algebraic-geometry-evaluation-code, the residue (differential) code is C_Ω(D, G) := the image of the k-linear map Ω_F(G − D) → k^n, ω ↦ (ω_{P_1}(1), …, ω_{P_n}(1)), where Ω_F(A) = TauCeti.weilDifferentialFiltration A and ω_P = TauCeti.repartitionDualComponent ω P is the local component (Stichtenoth's definition; for a simple pole ω_P(1) is the residue of ω at P).
  *API:*
  - `agResidueMap` (constructor): ω ↦ (repartitionDualComponent ω (P i) 1)_i on Ω_F(G − D).
  - `agResidueCode` (constructor): agResidueCode P G = LinearMap.range (agResidueMap P G).
  - `ker_agResidueMap` (characterisation): ker = Ω_F(G) (differentials without pole at the P_i).
  - `agResidueCode_antitone` (structure): G ≤ G′ ⇒ agResidueCode P G′ ≤ agResidueCode P G.
  *Unit tests:*
  - `agResidueCode_eq_dual` (compatibility): agResidueCode P G = Euclidean dual of agEvaluationCode P G (residue-code-is-dual).
  - `agResidueCode_eq_bot_of_large_degree` (degenerate): If Divisor.degree G > n + 2·genus − 2 then agResidueCode P G = ⊥.
  - `agResidueCode_ratFunc` (computation): Over RatFunc k with G = (k₀ − 1)P∞ and n = #k points: agResidueCode = reedSolomon x (n − k₀) (full-length Reed–Solomon duality).
  - `agResidueCode_ne_evaluation` (non-example): In general agResidueCode P G ≠ agEvaluationCode P G: over RatFunc k with n = 3, G = 0 the residue code is the sum-zero code of dimension 2 while C_L is the repetition code.
  *Used in:* Couvreur–Randriambololona Theorem 12 (C_Ω is the dual of C_L); Couvreur–Randriambololona Corollary 22 (dimension n + g − 1 − deg G and distance ≥ deg G + 2 − 2g); Couvreur–Randriambololona Theorem 37 (classical Goppa codes are subfield subcodes of residue codes of P¹).
  *Tau Ceti layers:* AlgebraicCurves — layer-4-repartitions-weil-differentials-and-riemannroch; AlgebraicCurves — layer-5-consequences-of-riemannroch-and-local-components.
  *Source:* `cr-ag-codes`, Definition 11, printed p. 9.
- **Duality of evaluation and residue codes** (theorem; node `FF.4/residue-code-is-dual`).
  In the setting of algebraic-geometry-evaluation-code (k finite, exact constants): C_Ω(D, G) is the Euclidean dual of C_L(D, G), and finrank C_Ω = n − finrank C_L.
  *Hypotheses:* As in algebraic-geometry-evaluation-code.
  *Proof:* Orthogonality: for f ∈ L(G) and ω ∈ Ω_F(G − D), the abstract residue theorem gives ∑ᶠ_P ω_P(f) = 0 (tauceti:TauCeti.finsum_repartitionDualComponent_eq_zero). For P ∉ {P_i}: v_P(f) ≥ −G(P) = −(G − D)(P), so ω_P(f) = 0 (tauceti:TauCeti.repartitionDualComponent_apply_eq_zero_of_le). At P_i: (G − D)(P_i) = −1 and f − f(P_i) vanishes at P_i, so ω_{P_i}(f − f(P_i)) = 0 and ω_{P_i}(f) = f(P_i)·ω_{P_i}(1) (evaluation-at-rational-place); hence ∑_i f(P_i) ω_{P_i}(1) = 0. Dimension: the kernel of ω ↦ (ω_{P_i}(1))_i on Ω_F(G − D) is Ω_F(G) (tauceti:TauCeti.mem_weilDifferentialFiltration_iff_repartitionDualComponent_eq_zero, checking the local condition at each P_i), so finrank C_Ω = i(G − D) − i(G) (tauceti:TauCeti.finrank_weilDifferentialFiltration); Riemann–Roch (tauceti:TauCeti.exists_isRiemannRochDivisor with TauCeti.Divisor.indexOfSpecialty) turns this into n − (ℓ(G) − ℓ(G − D)) = n − finrank C_L (ag-code-dimension). An orthogonal subspace of dimension n − dim C_L is the whole dual.
  *Tau Ceti layers:* AlgebraicCurves — layer-4-repartitions-weil-differentials-and-riemannroch; AlgebraicCurves — layer-5-consequences-of-riemannroch-and-local-components; AlgebraicCodingTheory — layer-2-hamming-data-and-dual-codes.
  *Source:* `cr-ag-codes`, Theorem 12, printed p. 9.
- **Parameters of residue codes** (theorem; node `FF.4/residue-code-parameters`).
  If 2g − 2 < deg G < n then finrank C_Ω(D, G) = n + g − 1 − deg G and every nonzero codeword of C_Ω(D, G) has weight ≥ deg G − (2g − 2).
  *Hypotheses:* As in algebraic-geometry-evaluation-code; 2g − 2 < deg G < n.
  *Proof:* Dimension: residue-code-is-dual and ag-code-dimension (finrank C_L = deg G + 1 − g). Distance: let ω ∈ Ω_F(G − D) be nonzero with residue vector c, and S = {i : c_i = 0}. For i ∈ S, ω_{P_i} kills 1 and (as (G − D)(P_i) = −1) every function vanishing at P_i, hence all of 𝒪_{P_i} = k + 𝔪_{P_i}; by tauceti:TauCeti.mem_weilDifferentialFiltration_iff_repartitionDualComponent_eq_zero, ω ∈ Ω_F(B) with B = G − D + ∑_{i∈S} P_i. Ω_F(B) = 0 when deg B ≥ 2g − 1, since finrank Ω_F(B) = i(B) (tauceti:TauCeti.finrank_weilDifferentialFiltration) and i(B) = 0 in that range (tauceti:TauCeti.Divisor.indexOfSpecialty_eq_zero_of_two_mul_genus_sub_one_le_degree). Hence deg G − n + #S ≤ 2g − 2, i.e. hammingNorm c = n − #S ≥ deg G − 2g + 2.
  *Source:* `cr-ag-codes`, Corollary 22, printed p. 12.

### 4F. The finite upper half-plane and Hecke operators

Terras's own notes were not reachable; the objects are taken from the public papers of Kuang (§§1–8), Vinh–Dung
(§§1–3) and DeDeo–Velasquez (§§1–3), which state Terras's definitions and the homogeneity, regularity and
Gelfand-pair facts; where they only state a fact, the node writes out the proof. Kuang's `Xa(δ, a)` is a misprint for `X_q(δ, a)` (E514). The Ramanujan
property (Katz, Li) needs the Soto-Andrade sum estimate and is gap 2.


- **Terras's finite upper half-plane H_q** (definition, `FiniteUpperHalfPlane`; node `FF.4/finite-upper-half-plane`; planet *Finite upper half-plane*).
  Let F be a finite field with q elements, q odd, E a field with [Algebra F E] and [E : F] = 2, and s ∈ E with s ∉ F and δ := s² ∈ F (so δ is a nonsquare of F and E = F(s)). The finite upper half-plane is H := {z ∈ E : z ∉ range (algebraMap F E)}; every z ∈ H is uniquely z = x + y s with x ∈ F, y ∈ Fˣ, and Re z := x, Im z := y. Conventions (pinned): 'upper' means y ≠ 0 (Terras's H_q is a double cover of an upper half-plane); Im depends on the chosen s, and replacing s by c s rescales Im by c^{−1}.
  *API:*
  - `FiniteUpperHalfPlane` (constructor): FiniteUpperHalfPlane F E := {z : E // z ∉ Set.range (algebraMap F E)}.
  - `FiniteUpperHalfPlane.re` (projection): Re z ∈ F, the first coordinate in the basis (1, s).
  - `FiniteUpperHalfPlane.im` (projection): Im z ∈ F, the second coordinate; Im z ≠ 0.
  - `FiniteUpperHalfPlane.mk` (constructor): x + y s for y ≠ 0.
  - `FiniteUpperHalfPlane.equivProd` (equivalence): FiniteUpperHalfPlane F E ≃ F × Fˣ.
  - `FiniteUpperHalfPlane.card` (simp): Nat.card = q(q − 1).
  *Unit tests:*
  - `card_finiteUpperHalfPlane_three` (computation): For F = ZMod 3 and E = GaloisField 3 2: Nat.card (FiniteUpperHalfPlane F E) = 6.
  - `card_finiteUpperHalfPlane` (characterisation): Nat.card (FiniteUpperHalfPlane F E) = q * (q − 1).
  - `not_mem_finiteUpperHalfPlane_algebraMap` (non-example): algebraMap F E x is never in the upper half-plane.
  - `finiteUpperHalfPlane_equiv` (compatibility): FiniteUpperHalfPlane F E ≃ F × Fˣ via z ↦ (Re z, Im z) for the chosen s.
  *Used in:* Kuang §1, facts 1–3 (GL₂(F_q) acts by fractional linear transformations, with invariant pseudo-distance and the graphs X_q(δ, a)); Vinh–Dung §§1–2 (girth, diameter and regularity of the finite non-Euclidean graphs); DeDeo–Velasquez §§2–3 (H_q = GL(2, F_q)/K as a homogeneous space for harmonic analysis); FF.4 target (finite upper half-plane/homogeneous-space constructions with chosen group actions).
  *Source:* `kuang-finite-plane`, Section 1, printed p. 1.
- **The fractional linear action of GL(2, F_q) on H_q** (construction, `FiniteUpperHalfPlane.instMulAction`; node `FF.4/mobius-action-on-finite-upper-half-plane`).
  In the setting of finite-upper-half-plane, GL(2, F) acts on H by g · z = (a z + b)/(c z + d) for g = [[a, b], [c, d]]. It is well defined (cz + d ≠ 0 since z ∉ F and (c, d) ≠ (0, 0)), lands in H because Im(g z) = det(g)·Im(z)/N(cz + d) with N = Algebra.norm F, and is a MulAction; scalar matrices act trivially.
  *API:*
  - `FiniteUpperHalfPlane.instMulAction` (instance): MulAction (GL (Fin 2) F) (FiniteUpperHalfPlane F E).
  - `FiniteUpperHalfPlane.coe_smul` (simp): ((g • z : H) : E) = (a z + b)/(c z + d).
  - `FiniteUpperHalfPlane.im_smul` (simp): Im (g • z) = det g · Im z / N(c z + d).
  - `FiniteUpperHalfPlane.smul_scalar` (simp): Scalar matrices act trivially.
  *Unit tests:*
  - `finiteUpperHalfPlane_smul_translation` (computation): [[1, 1], [0, 1]] • z = z + 1 (as elements of E).
  - `finiteUpperHalfPlane_smul_scalar` (degenerate): Scalar matrices c·I act trivially.
  - `finiteUpperHalfPlane_smul_affine` (characterisation): [[y, x], [0, 1]] • s = x + y s for y ≠ 0.
  - `finiteUpperHalfPlane_action_not_faithful` (non-example): −1 ≠ 1 in GL(2, F) (q odd) but (−1) • z = z for all z.
  *Used in:* Kuang §1 (Hq ≅ G/K and the invariant pseudo-distance); DeDeo–Velasquez §3 (Hq = GL(2, Fq)/K is a homogeneous space with G acting transitively); FF.4/terras-distance-invariant (invariance of the distance under this action).
  *Source:* `kuang-finite-plane`, Section 1, fact 1, printed p. 1.
- **H_q = GL(2, F_q)/K is a homogeneous space** (theorem; node `FF.4/finite-upper-half-plane-is-homogeneous`).
  In the setting of finite-upper-half-plane: (a) GL(2, F) acts transitively on H; (b) the stabilizer of s is K = {[[a, bδ], [b, a]] : a² − δb² ≠ 0}, a subgroup isomorphic to Eˣ (via a + b s), of order q² − 1; (c) the affine subgroup {[[y, x], [0, 1]] : y ≠ 0} acts simply transitively, so H ≃ GL(2, F)/K ≃ Aff(F).
  *Hypotheses:* As in finite-upper-half-plane.
  *Proof:* (c): [[y, x], [0, 1]] · s = x + y s (mobius-action-on-finite-upper-half-plane), a bijection from the affine group onto H; this gives (a). (b): g · s = s ⟺ a s + b = s(c s + d) = c δ + d s ⟺ b = cδ and a = d; det = a² − δ c² ≠ 0 for (a, c) ≠ 0 since δ is a nonsquare; the map a + c s ↦ [[a, cδ], [c, a]] is the regular representation of E on the basis (1, s), a group isomorphism Eˣ ≅ K. Orbit–stabilizer: |GL(2, F)| = (q² − 1)(q² − q) = |K|·|H| (mathlib:MulAction.card_orbit_mul_card_stabilizer_eq_card_group).
  *Source:* `kuang-finite-plane`, Section 1, fact 1, printed p. 1.
- **Terras's invariant pseudo-distance on H_q** (definition, `FiniteUpperHalfPlane.terrasDistance`; node `FF.4/terras-distance`).
  For z, w ∈ H put d(z, w) := N(z − w)/(Im z · Im w) ∈ F, where N = Algebra.norm F : E → F. Pinned: d takes values in F (it is not a metric); the normalisation uses the Im attached to the chosen s. It is symmetric, d(z, w) = 0 iff z = w, and d(s, x + y s) = (x² − δ(y − 1)²)/y; in particular d(s, −s) = 4δ.
  *API:*
  - `FiniteUpperHalfPlane.terrasDistance` (constructor): terrasDistance z w = N(z − w) / (Im z · Im w).
  - `FiniteUpperHalfPlane.terrasDistance_comm` (relation): Symmetry.
  - `FiniteUpperHalfPlane.terrasDistance_eq_zero_iff` (characterisation): terrasDistance z w = 0 ↔ z = w.
  - `FiniteUpperHalfPlane.terrasDistance_s` (simp): terrasDistance s (x + y s) = (x² − δ (y − 1)²) / y.
  - `FiniteUpperHalfPlane.terrasDistance_smul` (structure): terrasDistance (g • z) (g • w) = terrasDistance z w (node terras-distance-invariant).
  *Unit tests:*
  - `terrasDistance_self` (degenerate): terrasDistance z z = 0.
  - `terrasDistance_s_neg_s` (computation): terrasDistance s (−s) = 4δ.
  - `terrasDistance_comm` (characterisation): terrasDistance z w = terrasDistance w z.
  - `terrasDistance_not_metric` (non-example): For q = 3, δ = −1: terrasDistance s (−s) = −4 = 2 ∈ F₃ although s ≠ −s, and the values lie in F, not in an ordered set: no triangle inequality is claimed.
  *Used in:* Kuang §1 fact 3 and §8 (the graphs X_q(δ, a) and the q double cosets D_a); Vinh–Dung Definition 3 (the finite non-Euclidean graphs V_q(σ, a)).
  *Source:* `kuang-finite-plane`, Section 1, fact 2, printed p. 1.
- **GL(2, F_q)-invariance of Terras's distance** (theorem; node `FF.4/terras-distance-invariant`).
  For g ∈ GL(2, F) and z, w ∈ H: d(g · z, g · w) = d(z, w).
  *Hypotheses:* As in finite-upper-half-plane.
  *Proof:* g·z − g·w = det(g)(z − w)/((cz + d)(cw + d)), so N(gz − gw) = det(g)² N(z − w)/(N(cz + d)N(cw + d)) (N multiplicative, N(det g) = det(g)²). Im(gz) Im(gw) = det(g)² Im z Im w /(N(cz + d)N(cw + d)) (mobius-action-on-finite-upper-half-plane); divide.
  *Source:* `kuang-finite-plane`, Section 1, fact 2, printed p. 1.
- **Two-point homogeneity: the distance classifies pairs up to GL(2, F_q)** (theorem; node `FF.4/terras-distance-classifies-pairs`).
  In the setting of finite-upper-half-plane: for z, w, z′, w′ ∈ H, d(z, w) = d(z′, w′) iff there is g ∈ GL(2, F) with g·z = z′ and g·w = w′. Equivalently, the K-orbits on H (K the stabilizer of s) are the level sets {w : d(s, w) = a}, a ∈ F, and there are exactly q double cosets K\GL(2, F)/K.
  *Hypotheses:* As in finite-upper-half-plane.
  *Proof:* ⇐ is terras-distance-invariant. For ⇒, move z and z′ to s (finite-upper-half-plane-is-homogeneous); it remains to show K acts transitively on each nonempty level set of d(s, ·). Every value a ∈ F occurs (d(s, s) = 0, d(s, −s) = 4δ, and the other values by terras-graph-regular's count, which gives q + 1 > 0 points). Count: the level sets partition H into q nonempty K-invariant pieces; the number of K-orbits on H equals #(K\G/K), which is q by counting with the orbit sizes |K|/|K ∩ gKg^{−1}| (Kuang §8: 'There are q double cosets'); q orbits in q pieces forces each piece to be one orbit.
  *Source:* `kuang-finite-plane`, Section 8, printed p. 4.
- **Quadratic character sums of quadratic polynomials** (lemma; node `FF.4/quadratic-character-sum-of-quadratic`).
  Let F be a finite field of odd order q with quadratic character η = quadraticChar F (η(0) = 0) and A, B, C ∈ F with A ≠ 0. Then ∑_{y ∈ F} η(A y² + B y + C) = −η(A) if B² − 4AC ≠ 0, and = (q − 1)·η(A) if B² − 4AC = 0.
  *Hypotheses:* q odd; A ≠ 0.
  *Proof:* Complete the square: A y² + B y + C = A((y + B/(2A))² − D/(4A²)) with D = B² − 4AC; η is multiplicative, so the sum is η(A)·∑_t η(t² − D′) with D′ = D/(4A²). D′ = 0: ∑_t η(t²) = q − 1. D′ ≠ 0: count N = #{(t, u) : u² = t² − D′} in two ways: N = ∑_t (1 + η(t² − D′)) (mathlib:quadraticChar_card_sqrts) and N = q − 1 since (t − u)(t + u) = D′ has q − 1 solutions (t − u ranges over Fˣ). Hence ∑_t η(t² − D′) = −1 (Kowalski Lemma 4.16 with d = 2 is the same count).
  *Source:* `kowalski-expsums-elementary`, Chapter 4, Lemma 4.16, printed p. 51.
- **The finite upper half-plane graphs X_q(δ, a)** (definition, `FiniteUpperHalfPlane.terrasGraph`; node `FF.4/terras-graph`).
  In the setting of finite-upper-half-plane and a ∈ F, the Terras graph X_q(δ, a) is the simple graph on H with z ∼ w iff z ≠ w and d(z, w) = a. For a ≠ 0 the condition z ≠ w is automatic.
  *API:*
  - `FiniteUpperHalfPlane.terrasGraph` (constructor): terrasGraph a : SimpleGraph (FiniteUpperHalfPlane F E), Adj z w ↔ z ≠ w ∧ terrasDistance z w = a.
  - `FiniteUpperHalfPlane.terrasGraph_adj` (simp): Adjacency unfolds to the distance condition.
  - `FiniteUpperHalfPlane.terrasGraph_adj_smul` (structure): Adj (g • z) (g • w) ↔ Adj z w.
  - `FiniteUpperHalfPlane.terrasGraph_degree` (other): For a ∉ {0, 4δ} every vertex has degree q + 1 (node terras-graph-regular).
  *Unit tests:*
  - `terrasGraph_zero` (degenerate): terrasGraph 0 = ⊥ (no edges).
  - `terrasGraph_four_delta_matching` (computation): Every vertex of terrasGraph (4δ) has degree 1.
  - `terrasGraph_adj_s` (characterisation): (terrasGraph a).Adj s (x + y s) ↔ x² − δ(y − 1)² = a y and (x, y) ≠ (0, 1).
  - `terrasGraph_not_complete` (non-example): For q ≥ 5 and a ∉ {0, 4δ}, terrasGraph a ≠ ⊤ (degree q + 1 < q(q − 1) − 1).
  *Used in:* Kuang §8 (the adjacency matrices A_a are the Hecke operators of the double cosets D_a and are simultaneously diagonalised); Vinh–Dung §§2–5 (girth, diameter, toughness and Ramsey bounds of these graphs); FF.4/terras-graph-ramanujan (the Ramanujan property of X_q(δ, a)).
  *Source:* `kuang-finite-plane`, Section 1, fact 3, printed p. 1.
- **The Terras graphs are (q + 1)-regular** (theorem; node `FF.4/terras-graph-regular`).
  For a ∈ F with a ∉ {0, 4δ}, every z ∈ H has exactly q + 1 neighbours w with d(z, w) = a; so terrasGraph a is (q + 1)-regular. For a = 4δ each z has exactly one such w, and for a = 0 none besides z itself.
  *Hypotheses:* As in finite-upper-half-plane.
  *Proof:* By homogeneity (finite-upper-half-plane-is-homogeneous, terras-distance-invariant) take z = s. d(s, x + ys) = a ⟺ x² = δ(y − 1)² + a y (terras-distance). For fixed y ≠ 0 the number of x is 1 + η(Q(y)), Q(y) = δy² + (a − 2δ)y + δ (mathlib:quadraticChar_card_sqrts). ∑_{y≠0}(1 + η(Q(y))) = (q − 1) + ∑_y η(Q(y)) − η(Q(0)) = (q − 1) − η(δ) − η(δ) = q + 1, using quadratic-character-sum-of-quadratic (discriminant a(a − 4δ) ≠ 0) and η(δ) = −1. a = 4δ: Q(y) = δ(y + 1)², so ∑_{y≠0}(1 + η(Q(y))) = (q − 1) − #{y ∉ {0, −1}} = 1, the single point −s; a = 0: Q(y) = δ(y − 1)² and the same count gives only w = s itself, which is excluded by z ≠ w.
  *Source:* `vinh-dung-ramsey`, Section 1, printed p. 2.
- **Hecke operators of a finite homogeneous space, with pinned measures** (construction, `heckeOperator`; node `FF.4/hecke-operator-on-homogeneous-space`).
  Let G be a finite group acting transitively on a finite set X, x₀ ∈ X with stabilizer K, and φ : G → ℂ bi-invariant under K (φ(k g k′) = φ(g)). For f : X → ℂ put (T_φ f)(x) := ∑_{y ∈ X} φ(g_y^{−1} g_x) f(y), where g_x ∈ G is any element with g_x · x₀ = x (well defined by bi-invariance). Pinned measures: X carries counting measure and the inner product ⟨f, f′⟩ = ∑_x f(x) conj f′(x); G carries counting measure divided by |K|, so that T_φ f corresponds to (1/|K|)·(f̃ ⋆ φ) for the right-K-invariant lift f̃ = f ∘ (g ↦ g·x₀) and ordinary convolution on G. The Hecke algebra is the space of K-bi-invariant functions with the convolution (φ ⋆_K ψ)(g) = |K|^{−1} ∑_{h∈G} φ(h) ψ(h^{−1}g).
  *API:*
  - `heckeOperator` (constructor): heckeOperator φ : (X → ℂ) →ₗ[ℂ] (X → ℂ), defined with any choice of g_x (a chosen section of G → X).
  - `heckeOperator_apply` (simp): (heckeOperator φ f) x = ∑_y φ ((g y)⁻¹ * g x) * f y.
  - `heckeOperator_comp` (relation): heckeOperator φ ∘ heckeOperator ψ = heckeOperator (ψ ⋆_K φ).
  - `heckeOperator_adjoint` (relation): ∑_x (T_φ f) x · conj (f′ x) = ∑_x f x · conj ((T_{φ̌} f′) x).
  - `heckeOperator_smul_comm` (structure): T_φ commutes with the G-action on functions.
  *Unit tests:*
  - `heckeOperator_indicator_stabilizer` (degenerate): For φ = indicator of K, heckeOperator φ = LinearMap.id.
  - `heckeOperator_const` (computation): For φ = 1 (constant), (heckeOperator φ f) x = ∑_y f y for every x.
  - `heckeOperator_equivariant` (characterisation): heckeOperator φ commutes with translation by every h ∈ G.
  - `heckeOperator_needs_biinvariance` (non-example): For G = S₃ acting on {0,1,2}, K = stabilizer of 0 and φ = indicator of a transposition not in K and not bi-invariant, the formula ∑_y φ(g_y⁻¹ g_x) f(y) depends on the choice of the g_x.
  *Used in:* Kuang §4 (self-adjointness of the Hecke action: ⟨Tϕ(f1), f2⟩ = ⟨f1, Tϕ̂(f2)⟩); Kuang §8 (adjacency operators A_a = |K|^{−1} T_{ϕ_a} of the Terras graphs); FF.4 target (finite harmonic-analysis interfaces with chosen group actions and measures (the audit's missing part: homogeneous spaces with chosen actions and normalised measures)); AdditiveCombinatorics:AC.0 (for G abelian and K trivial this is convolution on a finite abelian group, AC.0's Fourier interface).
  *Source:* `kuang-finite-plane`, Section 4, printed p. 1.
- **Gelfand's trick: symmetric double cosets give a commutative Hecke algebra** (theorem; node `FF.4/gelfand-trick`).
  In the setting of hecke-operator-on-homogeneous-space, if K g K = K g⁻¹ K for every g ∈ G, then the Hecke operators commute: T_φ ∘ T_ψ = T_ψ ∘ T_φ for all K-bi-invariant φ, ψ.
  *Hypotheses:* As in hecke-operator-on-homogeneous-space.
  *Proof:* The hypothesis gives φ(g⁻¹) = φ(g) for every bi-invariant φ, so the anti-automorphism g ↦ g⁻¹ acts trivially on the Hecke algebra; it reverses convolution, (φ ⋆_K ψ)ˇ = ψ̌ ⋆_K φ̌, so φ ⋆_K ψ = ψ ⋆_K φ. Conclude with heckeOperator_comp.
  *Source:* `kuang-finite-plane`, Section 2, printed p. 1.
- **(GL(2, F_q), K) is a Gelfand pair; the Terras graph adjacency operators commute** (theorem; node `FF.4/finite-upper-half-plane-gelfand-pair`).
  In the setting of finite-upper-half-plane with G = GL(2, F) and K the stabilizer of s: K g K = K g⁻¹ K for all g. Consequently the adjacency operators A_a of terrasGraph a (a ∈ F) pairwise commute, are self-adjoint for the counting inner product on H, and ∑_{a∈F} A_a + I = J (the all-ones operator) when A_0 is taken to be 0.
  *Hypotheses:* As in finite-upper-half-plane.
  *Proof:* d(g s, s) = d(s, g⁻¹ s) = d(g⁻¹ s, s) (terras-distance-invariant with g⁻¹, and symmetry), so g and g⁻¹ lie in the same double coset by terras-distance-classifies-pairs. A_a = heckeOperator of the indicator of {g : d(g s, s) = a} (hecke-operator-on-homogeneous-space); gelfand-trick gives commutativity. Self-adjointness: the indicator is invariant under g ↦ g⁻¹ and real (heckeOperator_adjoint). Every pair (z, w) has exactly one value d(z, w), which gives ∑_a A_a + I = J.
  *Source:* `kuang-finite-plane`, Sections 2 and 8, printed pp. 1, 4.
- **The Terras graphs are Ramanujan (Katz, Li)** (theorem; node `FF.4/terras-graph-ramanujan`).
  For a ∈ F \ {0, 4δ}, every eigenvalue λ of the adjacency operator of terrasGraph a other than the trivial eigenvalue q + 1 satisfies |λ| ≤ 2√q.
  *Hypotheses:* As in finite-upper-half-plane; a ∉ {0, 4δ}.
  *Proof:* The adjacency operators are simultaneously diagonalised by the spherical functions of the Gelfand pair (finite-upper-half-plane-gelfand-pair); the eigenvalues are character sums (Soto-Andrade sums, computed by Evans, Terras and Kuang). The bound |λ| ≤ 2√q is Katz's estimate for Soto-Andrade sums (J. reine angew. Math. 438 (1993)), obtained by ℓ-adic methods; it is recorded as a gap: the paper is not public and its proof has not been decomposed. It would rest on the Weil/Deligne estimates of FiniteFieldsAndCharacterSums:FF.2.
  *From other layers:* `FF.2`.
  *Source:* `kuang-finite-plane`, Section 8, printed p. 4.

### Boundaries

- FF.1 owns the finite-field characters and the Fourier analysis of Bary-Soroker–Koukoulopoulos–Kozma on `ℤ` and on
  `F_p((1/T))` (FF.1/fourier-transform-of-integer-measure, residue-character-at-infinity, negative-power-torus and the
  rest of route 3). FF.4 uses Mathlib's characters directly.
- FF.2 owns the Weil and Deligne estimates. FF.4 states the decimation correlation as an exact character sum; its Weil
  bound is FF.5's handoff `m-sequence-decimation-correlation-bound`, and the Ramanujan property of the Terras graphs
  waits on FF.2's handoff (gap 2).
- ClassicalArithmeticCompletion CA.2 owns linear recurrences over general rings, companion matrices and their matrix
  powers; FF.4 adds only the finite-field theory (periods, orders, m-sequences, correlations).
- AlgebraicCodingTheory owns linear codes, generator and parity-check matrices, minimum distance and duals; it
  excludes Reed–Solomon, BCH and cyclic codes and the general bounds, which are FF.4's. AlgebraicCurves owns function
  fields, divisors, Riemann–Roch and Weil differentials; FF.4 only builds the codes on them.
- DrinfeldModulesAndTModules DM.0 owns the Ore ring `L{τ}` and Drinfeld modules; FF.4 owns the polynomial-level
  theory of q-linearized polynomials (restructure proposal in the packet).
- AdditiveCombinatorics AC.0 owns the general finite-abelian Fourier interface; FF.4 builds only the Hecke operators
  of the finite homogeneous spaces it uses, with their measures pinned.

### Dependencies

- Inside the roadmap: FF.1 (the character-sum criterion for permutation polynomials is stated with FF.1's additive
  characters), FF.2 (Katz's estimate behind the Ramanujan property). The atlas edge FF.3 → FF.4 carries no node-level
  dependency.
- Other roadmaps: ClassicalArithmeticCompletion CA.2 (three nodes). Tau Ceti AlgebraicCodingTheory layers 1 and 2 and
  AlgebraicCurves layers 3, 4 and 5, each with a request; everything used from them is built at the pin.
- Consumers: FF.5 (Reed–Solomon codes for Shamir's scheme, m-sequences and the decimation character sum for the
  correlation bound, the quadratic-character sum of a quadratic); DrinfeldModulesAndTModules DM.0 (q-linearized
  polynomials).

### Acceptance tests

- **Galois rings.** `#GR(4, 2) = 16`, `GR(4, 1) ≃+* ZMod 4` and `GR(4, 1) ≇ F₄`; in `ZMod 9` the Teichmüller lift of
  `2` is `8` and `5 = τ(2) + 3·τ(2)`; `GR(4, 2)` has 12 units and exactly two ring automorphisms, and is presented by
  `X² + X + 1` (and by `X² + 3X + 1`) over `ZMod 4`; `(ZMod 4)[X]/(X²)` is local with residue field `F₂` but is not a
  Galois ring; `ZMod 4 + 2·GR(4, 2)` is a subring that is not a Galois ring; `Tr(X) = 3` in `GR(4, 2)`.
- **Linearized and permutation polynomials.** The roots of `X² + X` in `F₄` are `{0, 1}`; the subspace polynomial of
  `F₄` over `F₂` is `X⁴ + X`; `X² + X` does not permute `F₄` while `X²` does; `x³ + 1` permutes `ZMod 11` and
  `x² + 3x + 5` does not; `D_5(x, 1)` permutes `F₇` with values `0, 1, 2, 4, 3, 5, 6`, while `D_3(x, 1)` does not permute
  `F₅` although `X³` does; `X⁴ − 1` over `F₉` refutes the source's one-root step.
- **Sequences.** `polyOrder (X⁴ + X + 1) = 15` and `polyOrder (X⁴ + X³ + X² + X + 1) = 5` over `F₂`; the binary
  m-sequence of period 15 has eight 1s and seven 0s and autocorrelation `15, −1, …, −1`; `legendreSeq 7` has
  autocorrelation `−1` off zero and `legendreSeq 5` takes the values `1` and `−3`.
- **Codes.** `reedSolomon (id : ZMod 5 → ZMod 5) 3` is a `[5, 3, 3]` code; the full-length Reed–Solomon codes of
  dimensions `k` and `q − k` are dual; the `q = 2, m = 3, δ = 3` BCH code is the `[7, 4, 3]` Hamming code and the
  `m = 4, δ = 5` binary BCH code has dimension at least 7; over the rational function field `C_L(D, (k − 1)P_∞)` is
  the Reed–Solomon code and its residue code is the dual; `G = 0` gives the repetition code and the sum-zero code.
- **Finite upper half-plane.** For `q = 3`, `δ = −1`: `#H = 6`, `#GL(2, F₃) = 48 = 8·6`, the distance level sets from
  `s` have sizes `1, 1, 4`, and `X₃(−1, 1)` is 4-regular; for `q = 5` the three admissible graphs are 6-regular on 20
  vertices; the Hecke operator of a double coset is the adjacency operator of the corresponding Terras graph.

---

## FF.5 Arithmetic applications

This layer holds the handoffs by which the finite-field estimates of FF.2 and the constructions of FF.4 reach their
consumers, each as a real statement with exact constants, and the original coding, sequence and cryptographic examples.
It proves no new estimate: the Weil and Deligne bounds are FF.2's, generic certificate schemas are
ComputationalNumberTheory CN.5's, and computational hardness is never a hypothesis or a conclusion of any node.
- **Normalisation handoffs** (5A): Weil's bound for complete sums `Σ_{x mod p} e(f(x)/p)` of integer polynomials, with
  the exact degree and prime conditions and a uniform constant for all primes; Legendre-symbol sums of squarefree
  integer polynomials; Kloosterman sums modulo `p` and their `2√p` bound.
- **Point counts and local densities** (5B): the count of `y² = g(x)` by the quadratic character and its Weil error term;
  the count of Hensel lifts of a nonsingular zero; local densities at good primes as normalised finite-field point
  counts (the handoff to ExponentialSumsAndCircleMethod ES.3).
- **A sequence example** (5C): the Weil bound for the cross-correlation of an m-sequence with a decimation.
- **Cryptographic and coding examples** (5D): discrete logarithms, the correctness of Diffie–Hellman, the Pohlig–Hellman
  reduction, an explicit example over `F_65537` where the protocol is correct and discrete logarithms are easy (so
  correctness does not imply hardness), and Shamir's secret sharing with reconstruction and perfect privacy.

### Conventions

- `e(x/p)` is Mathlib's `ZMod.stdAddChar` (the value `exp(2πi x̃/p)` for any lift `x̃`); it is FF.1's canonical additive
  character of `F_p`. Integer polynomials are reduced modulo `p` by `Polynomial.map (Int.castRingHom (ZMod p))`.
- `η = quadraticChar (ZMod p)` (or of `F`), with Mathlib's value `η(0) = 0`.
- Kloosterman sums run over units only: `kloostermanModP p m n = Σ_{x ∈ (ZMod p)ˣ} e((m x + n x⁻¹)/p)`.
- Point counts of `y² = g(x)` are affine: `#{(x, y) ∈ F² : y² = g(x)}`.
- The local density of `F ∈ ℤ[x_1, …, x_n]` at `p` is `σ_p = lim_m p^{−m(n−1)}·#{x mod p^m : F(x) ≡ 0}`; `p` is good
  when every zero of `F mod p` in `F_p^n` is nonsingular.
- Correlations follow FF.4 (`charCorrelation`, conjugate on the shifted argument, period `N = q^m − 1`).
- For a generator `γ` of a finite cyclic group `G` with `N = Nat.card G`, `dlog γ : G → ZMod N` is the inverse of
  `k ↦ γ^k` (Mathlib's `zmodMulEquivOfGenerator`).
- Shamir's scheme labels the players by distinct nonzero elements of `F`; perfect privacy is stated as an exact count
  of randomness vectors, so that it is a theorem about uniform randomness without any probabilistic library.

### Already in the libraries (cited, not rebuilt)

- `ZMod.stdAddChar`, `ZMod.toCircle`, `quadraticChar` and `quadraticChar_card_sqrts`, `Polynomial.discr`,
  `Polynomial.eval` and `Polynomial.map`, `Algebra.trace`.
- `MvPolynomial.eval` and `MvPolynomial.pderiv` (gradients), `ZMod.castHom`, `ZMod.chineseRemainder`.
- `IsCyclic`, `Subgroup.zpowers`, `zmodMulEquivOfGenerator`, `orderOf_dvd_iff_pow_eq_one`, `orderOf_pow_orderOf_div`,
  `pow_mul_comm`.
- `Lagrange.interpolate` and `Lagrange.eq_interpolate_of_eval_eq`, `Matrix.vandermonde`,
  `LinearMap.finrank_range_add_finrank_ker`.

### 5A. Weil bounds in the integer normalisation

Kowalski, *Exponential sums over finite fields: elementary methods*: Introduction (Definition 7, Theorem 10), Chapter 3
§3.1 (Theorems 3.1–3.2, Corollaries 3.3–3.4). Corollary 3.3 prints a wrong discriminant for `X³ + aX + b` (E601) and
its proof admits primes that must be excluded (E602); the nodes carry the corrected conditions.


- **Weil's bound for complete exponential sums of integer polynomials modulo p** (theorem; node `FF.5/weil-bound-integer-polynomial-mod-p`; planet *Weil bound for integer polynomials mod p*).
  Let f ∈ ℤ[X] have degree d ≥ 1 and let p be a prime with p ∤ lead(f) and p > d. Then |∑_{x ∈ ZMod p} e(f(x)/p)| ≤ (d − 1)√p, where e(x/p) is Mathlib's ZMod.stdAddChar (exp(2πi x̃/p) for any lift x̃) and f is reduced modulo p. The exact constants handed to consumers: degree d − 1, modulus √p, hypotheses p ∤ lead(f) and p > d (which give p ∤ deg and exclude Artin–Schreier-trivial f).
  *Hypotheses:* f ∈ ℤ[X], d = natDegree f ≥ 1; p prime, p ∤ leadingCoeff f, d < p.
  *Proof:* The reduction f̄ ∈ F_p[X] has degree d (p ∤ lead f). Over F_p the trace is the identity, so the canonical additive character ψ(x) = e(Tr(x)/p) of FiniteFieldsAndCharacterSums:FF.1/canonical-additive-character is ZMod.stdAddChar. d < p gives p ∤ d, and f̄ is not of the form g^p − g + c (such polynomials have degree divisible by p or are constant), so FiniteFieldsAndCharacterSums:FF.2/weil-bound-additive applies with q = p.
  *From other layers:* `FF.2/weil-bound-additive`, `FF.1/canonical-additive-character`.
  *Source:* `kowalski-expsums-elementary`, Chapter 3, Theorem 3.2, printed p. 31.
- **A uniform explicit constant for all primes** (theorem; node `FF.5/weil-bound-integer-polynomial-uniform`).
  Let f ∈ ℤ[X] have degree d ≥ 1 and put P₀ := max(d, |lead f|). Then for every prime p, |∑_{x ∈ ZMod p} e(f(x)/p)| ≤ max(d − 1, √P₀)·√p.
  *Hypotheses:* f ∈ ℤ[X] with natDegree f = d ≥ 1.
  *Proof:* If p > P₀ then p > d and p ∤ lead f (0 < |lead f| < p), so weil-bound-integer-polynomial-mod-p gives (d − 1)√p. If p ≤ P₀ then the trivial bound |S| ≤ p = √p·√p ≤ √P₀·√p.
  *Source:* `kowalski-expsums-elementary`, Chapter 3, Corollary 3.4 and proof, printed p. 32.
- **Legendre-symbol sums of squarefree integer polynomials** (theorem; node `FF.5/legendre-sum-squarefree-integer-polynomial`).
  Let g ∈ ℤ[X] have degree n ≥ 1 and nonzero discriminant (Polynomial.discr g ≠ 0). For every odd prime p with p ∤ lead(g)·discr(g), |∑_{x ∈ ZMod p} η(g(x))| ≤ (n − 1)√p, where η = quadraticChar (ZMod p) (η(0) = 0). For n = 3 and g = X³ + aX + b the discriminant is −4a³ − 27b².
  *Hypotheses:* n ≥ 1; discr g ≠ 0; p odd, p ∤ lead(g)·discr(g).
  *Proof:* Modulo p, g has degree n and n distinct roots in F̄_p (discr ḡ ≠ 0), so ḡ is not a constant times a square (n ≥ 1, simple roots) and the number m of distinct roots is n. Apply FiniteFieldsAndCharacterSums:FF.2/weil-bound-multiplicative with χ = η of order 2.
  *From other layers:* `FF.2/weil-bound-multiplicative`.
  *Source:* `kowalski-expsums-elementary`, Chapter 3, Theorem 3.1, printed p. 31.
- **Kloosterman sums modulo a prime** (definition, `kloostermanModP`; node `FF.5/kloosterman-sum-mod-p`).
  For a prime p and m, n ∈ ZMod p, the Kloosterman sum is kloostermanModP p m n := ∑_{x ∈ (ZMod p)ˣ} e((m x + n x⁻¹)/p) with e(·/p) = ZMod.stdAddChar. Pinned: the sum runs over units only (x = 0 excluded); it equals the finite-field Kloosterman sum of FF.2 over F_p with the canonical character (trace = identity).
  *API:*
  - `kloostermanModP` (constructor): kloostermanModP p m n = ∑ x : (ZMod p)ˣ, ZMod.stdAddChar (m * x + n * x⁻¹).
  - `kloostermanModP_comm` (relation): Symmetric in m and n.
  - `kloostermanModP_mul_left` (relation): kloostermanModP p (a * m) n = kloostermanModP p m (a * n) for a a unit.
  - `kloostermanModP_conj` (simp): conj (kloostermanModP p m n) = kloostermanModP p m n.
  - `kloostermanModP_zero_right` (simp): kloostermanModP p m 0 = −1 for m ≠ 0.
  *Unit tests:*
  - `kloostermanModP_three_one_one` (computation): kloostermanModP 3 1 1 = −1.
  - `kloostermanModP_zero_zero` (degenerate): kloostermanModP p 0 0 = p − 1.
  - `kloostermanModP_comm` (characterisation): kloostermanModP p m n = kloostermanModP p n m.
  - `kloostermanModP_ne_sum_all` (non-example): Summing over all x ∈ ZMod p with the junk value 0⁻¹ = 0 adds the term e(0) = 1: kloostermanModP p m n ≠ ∑_x e((m x + n x⁻¹)/p).
  *Used in:* Kowalski, Theorems 9 and 10 (Kloosterman's bound 2p^{3/4} and Weil's bound 2√p for p ∤ mn); Kowalski, Theorem 8 (Kloosterman's representation-number theorem for quaternary quadratic forms uses these sums (circle-method consumers, ExponentialSumsAndCircleMethod)); FiniteFieldsAndCharacterSums:FF.2/kloosterman-bound (the finite-field bound in the convention of FF.2).
  *From other layers:* `FF.1/canonical-additive-character`.
  *Source:* `kowalski-expsums-elementary`, Introduction, Definition 7, printed p. 4.
- **Weil's bound for Kloosterman sums modulo p** (theorem; node `FF.5/kloosterman-bound-mod-p`).
  For a prime p and m, n ∈ ZMod p with m n ≠ 0: ‖kloostermanModP p m n‖ ≤ 2√p.
  *Hypotheses:* p prime; m, n nonzero mod p.
  *Proof:* kloostermanModP p m n is the FF.2 Kloosterman sum over F_p with the canonical additive character (kloosterman-sum-mod-p, trace = identity), and FiniteFieldsAndCharacterSums:FF.2/kloosterman-bound gives 2√q with q = p.
  *From other layers:* `FF.2/kloosterman-bound`.
  *Source:* `kowalski-expsums-elementary`, Introduction, Theorem 10, printed p. 5.

### 5B. Point counts and local densities

Kowalski Chapter 4 (Lemma 4.16, Remark 4.29, whose letter `a` is used twice, E603) and Griffiths, *Elementary local
representation densities at all primes via lifting recursions* (§1 and §2.1).


- **Points on y² = g(x) over F_q** (theorem; node `FF.5/double-cover-point-count`).
  Let F be a finite field of odd order q, η = quadraticChar F and g ∈ F[X]. Then #{(x, y) ∈ F² : y² = g(x)} = q + ∑_{x∈F} η(g(x)).
  *Hypotheses:* q odd; g arbitrary (possibly constant or zero).
  *Proof:* For fixed x, #{y : y² = g(x)} = 1 + η(g(x)) (mathlib:quadraticChar_card_sqrts; the value η(0) = 0 counts the single root y = 0); sum over x.
  *Source:* `kowalski-expsums-elementary`, Chapter 4, Lemma 4.16, printed p. 51.
- **Local density of y² = g(x): the Weil error term** (theorem; node `FF.5/double-cover-point-count-bound`).
  In the setting of double-cover-point-count, if g is not of the form c·h² with c ∈ F and h ∈ F̄[X] (equivalently, some root of g in F̄ has odd multiplicity) and g has m distinct roots in an algebraic closure, then |#{(x, y) : y² = g(x)} − q| ≤ (m − 1)√q. Hence, for g ∈ ℤ[X] squarefree of degree n ≥ 1 and p ∤ 2·lead(g)·discr(g), the normalised local count N_p/p = 1 + O((n − 1)p^{−1/2}).
  *Hypotheses:* q odd; g not a constant times a square in F̄[X].
  *Proof:* Combine double-cover-point-count with FiniteFieldsAndCharacterSums:FF.2/weil-bound-multiplicative (χ = η of order 2). The integer version reduces modulo p as in legendre-sum-squarefree-integer-polynomial.
  *From other layers:* `FF.2/weil-bound-multiplicative`.
  *Source:* `kowalski-expsums-elementary`, Chapter 4, Remark 4.29, printed p. 65.
- **Counting lifts of a nonsingular zero modulo p^m** (lemma; node `FF.5/hensel-lift-count`).
  Let F ∈ ℤ[x_1, …, x_n] (n ≥ 1), p prime, m ≥ 1 and x̄ ∈ (ℤ/p^m)^n with F(x̄) ≡ 0 (mod p^m) and ∇F(x̄) ≢ 0 (mod p). Among the p^n lifts of x̄ to (ℤ/p^{m+1})^n, exactly p^{n−1} satisfy F ≡ 0 (mod p^{m+1}).
  *Hypotheses:* n ≥ 1; m ≥ 1; the gradient is nonzero modulo p at x̄.
  *Proof:* Write a lift as x + p^m h with h ∈ F_p^n. Taylor expansion: F(x + p^m h) ≡ F(x) + p^m ∇F(x)·h (mod p^{m+1}) since 2m ≥ m + 1 (MvPolynomial.pderiv and the binomial expansion of monomials). The condition becomes ∇F(x̄)·h ≡ −F(x)/p^m (mod p), an affine hyperplane in F_p^n because ∇F(x̄) ≢ 0: p^{n−1} solutions.
  *Source:* `griffiths-local-densities`, Section 1, printed p. 1.
- **Local densities at good primes are normalised finite-field point counts** (theorem; node `FF.5/local-density-at-good-prime`; planet *Local densities at good primes*).
  Let F ∈ ℤ[x_1, …, x_n] (n ≥ 1) and p a prime such that every zero of F̄ in F_p^n is nonsingular (∇F̄ ≠ 0 there). Then for every m ≥ 1, #{x ∈ (ℤ/p^m)^n : F(x) ≡ 0} = p^{(m−1)(n−1)}·N_p, where N_p = #{x ∈ F_p^n : F̄(x) = 0}; hence the p-adic local density σ_p := lim_m p^{−m(n−1)} #{x mod p^m : F(x) ≡ 0} exists and equals N_p/p^{n−1}.
  *Hypotheses:* n ≥ 1; every F_p-zero of F̄ nonsingular.
  *Proof:* Induction on m with hensel-lift-count: each zero mod p^m reduces to a nonsingular zero mod p (the gradient condition only depends on x mod p), so it has exactly p^{n−1} lifting zeros mod p^{m+1}. The sequence p^{−m(n−1)}·count is constant from m = 1 on.
  *Source:* `griffiths-local-densities`, Section 1, printed p. 1.

### 5C. A sequence example

Goresky–Klapper Proposition 13.5.1 (the correlation as a character sum, FF.4's
`decimation-cross-correlation-character-sum`) with Weil's bound (Kowalski Theorem 3.2, through FF.2).


- **Weil's bound for cross-correlations of m-sequences and their decimations** (theorem; node `FF.5/m-sequence-decimation-correlation-bound`; planet *Correlation bound for decimated m-sequences*).
  Let F be a finite field of characteristic p with q elements, L ⊇ F of degree m, α a generator of Lˣ, a(n) = Tr(α^n), b(n) = a(dn) with 2 ≤ d < q^m and p ∤ d, χ a nontrivial additive character of F and N = q^m − 1. Then for every t, |charCorrelation χ N b a t + 1| ≤ (d − 1)·q^{m/2}.
  *Hypotheses:* 2 ≤ d < q^m; p ∤ d; χ ≠ 1.
  *Proof:* By FiniteFieldsAndCharacterSums:FF.4/decimation-cross-correlation-character-sum, C(t) + 1 = ∑_{x∈L} ψ(x^d − α^t x) with ψ = χ ∘ Tr_{L/F}, a nontrivial additive character of L (the trace is surjective). The polynomial x^d − α^t x has degree d prime to the characteristic and d < q^m, so it is not Artin–Schreier trivial; FiniteFieldsAndCharacterSums:FF.2/weil-bound-additive over L (q^m elements) gives the bound.
  *From other layers:* `FF.4/decimation-cross-correlation-character-sum`, `FF.2/weil-bound-additive`.
  *Source:* `gk-asrs`, Chapter 13, Proposition 13.5.1, printed p. 318.

### 5D. Cryptographic and coding examples

Shoup, Chapter 11 (§11.2: discrete logarithms, groups of prime-power order and the reduction to them; §11.3:
Diffie–Hellman) and Couvreur–Randriambololona §8.4 (Shamir's scheme and its Reed–Solomon description). The example
over `F_65537` is a statement about one explicit procedure; its exhaustive check is an instance of CN.5's certificate
schema (requested).


- **Discrete logarithms in a finite cyclic group** (definition, `dlog`; node `FF.5/discrete-logarithm`).
  Let G be a finite group and γ ∈ G a generator (every element is a power of γ), N = Nat.card G. The discrete logarithm to the base γ is dlog γ : G → ZMod N, the inverse of the isomorphism ZMod N → G, k ↦ γ^k (Mathlib's zmodMulEquivOfGenerator); so γ^(dlog γ α) = α and dlog γ (γ^k) = k mod N.
  *API:*
  - `dlog` (constructor): dlog γ hγ : G → ZMod (Nat.card G).
  - `zpow_dlog` (characterisation): γ ^ (dlog γ hγ α).val = α.
  - `dlog_pow` (simp): dlog γ hγ (γ ^ k) = k.
  - `dlog_mul` (simp): dlog γ hγ (α * β) = dlog γ hγ α + dlog γ hγ β.
  - `dlog_one` (simp): dlog γ hγ 1 = 0.
  *Unit tests:*
  - `dlog_zmod_seven` (computation): In (ZMod 7)ˣ with γ = 3 (a generator): dlog γ 2 = 2.
  - `dlog_one` (degenerate): dlog γ 1 = 0.
  - `zpow_dlog` (characterisation): γ ^ (dlog γ α).val = α.
  - `two_not_generator_zmod_seven` (non-example): 2 does not generate (ZMod 7)ˣ: 2³ = 1.
  *Used in:* Shoup §11.2.3–11.2.4 (the Pohlig–Hellman reduction of discrete logarithms to prime-order subgroups); Shoup §11.3 (the Diffie–Hellman protocol is broken by computing discrete logarithms); FF.5/correctness-without-hardness-example (an explicit fast discrete logarithm on F_65537ˣ).
  *Source:* `SHOUP.V2`, Chapter 11, §11.2, printed p. 329.
- **Correctness of the Diffie–Hellman key exchange** (theorem; node `FF.5/diffie-hellman-correctness`).
  Let G be a commutative group (in particular (ZMod p)ˣ or F_qˣ), γ ∈ G and x, y ∈ ℕ. With public keys α = γ^x, β = γ^y, the two computed keys agree: β^x = α^y = γ^{xy}. This is a statement of algebra only; it says nothing about the difficulty of computing γ^{xy} from (γ, α, β).
  *Hypotheses:* G commutative (a monoid suffices).
  *Proof:* (γ^y)^x = γ^{yx} = γ^{xy} = (γ^x)^y (pow_mul, mul_comm).
  *Source:* `SHOUP.V2`, Chapter 11, §11.3, printed p. 335.
- **Reduction of discrete logarithms to prime-power order (Pohlig–Hellman)** (theorem; node `FF.5/pohlig-hellman-reduction`).
  Let γ generate a finite cyclic group G of order N = ∏_i q_i^{e_i} and α = γ^x. (a) For each i, α^{N/q_i^{e_i}} = (γ^{N/q_i^{e_i}})^x and γ^{N/q_i^{e_i}} has order q_i^{e_i}, so its discrete logarithm determines x mod q_i^{e_i}; x mod N is recovered from these residues by the Chinese remainder theorem. (b) If γ has order q^e and x = q^f v + u with 0 ≤ u < q^f, then α^{q^{e−f}} = (γ^{q^{e−f}})^u and α γ^{−u} = (γ^{q^f})^v, reducing to orders q^f and q^{e−f}; iterating with f = 1 reduces to e discrete logarithms in the subgroup of order q.
  *Hypotheses:* G finite cyclic of order N; γ a generator; the factorisation of N is given.
  *Proof:* (a) (γ^x)^{N/q^e} = (γ^{N/q^e})^x; orderOf (γ^{N/q^e}) = q^e (mathlib:orderOf_pow_orderOf_div); x ≡ x_i (mod q_i^{e_i}) for the logarithm x_i; CRT (mathlib:ZMod.chineseRemainder) recovers x mod N. (b) γ^{q^{e−f}} has order q^f, and α^{q^{e−f}} = γ^{q^{e−f}(q^f v + u)} = (γ^{q^{e−f}})^u since γ^{q^e} = 1; α γ^{−u} = γ^{q^f v}.
  *Source:* `SHOUP.V2`, Chapter 11, §11.2.4, printed p. 333.
- **Correctness does not imply hardness: an explicit fast discrete logarithm on F_65537** (application; node `FF.5/correctness-without-hardness-example`).
  Let p = 65537 = 2^16 + 1 (prime) and γ = 3, a generator of F_pˣ (3^{2^15} = −1). The Diffie–Hellman protocol in F_pˣ with base 3 is correct (diffie-hellman-correctness), and the explicit procedure dlogFermat, which determines the binary digits x_0, …, x_15 of log_3 α one at a time by testing (α·3^{−(x_0 + ⋯ + x_{i−1}2^{i−1})})^{2^{15−i}} = −1, satisfies 3^{dlogFermat α} = α for every α ∈ F_pˣ, using 16 steps of at most 17 squarings each. Hence the correctness of the protocol over F_p does not imply that computing discrete logarithms (or Diffie–Hellman keys) in F_pˣ is hard; hardness is a separate hypothesis, never a consequence of the finite-field theorems.
  *Hypotheses:* p = 65537; γ = 3.
  *Proof:* 3 generates F_pˣ: p − 1 = 2^16, so the order of 3 is a power of 2, and 3^{2^15} = −1 ≠ 1 (a finite computation; Pépin's criterion shows the same). pohlig-hellman-reduction (b) with q = 2, e = 16, f = 1 iterated: at step i the element (α·3^{−x_{<i}})^{2^{15−i}} lies in {±1} and equals (−1)^{x_i}. The equality 3^{dlogFermat α} = α for all 65536 units is a finite check (decidable, verified by evaluation); CN.5's certificate schema packages it with its verification cost. The non-implication is witnessed by this pair (correct protocol, explicitly computable logarithm): no theorem of this roadmap has computational hardness as a conclusion.
  *From other layers:* `ComputationalNumberTheory:CN.5`.
  *Source:* `SHOUP.V2`, Chapter 11, §11.2.4, printed p. 333.
- **Shamir's secret sharing scheme** (construction, `shamirShares`; node `FF.5/shamir-secret-sharing`; planet *Shamir secret sharing*).
  Let F be a finite field, t ≥ 1 the threshold, n players labelled by distinct nonzero x_1, …, x_n ∈ F (so n ≤ #F − 1). Dealing a secret s ∈ F with randomness c = (c_1, …, c_{t−1}) ∈ F^{t−1} gives the shares shamirShares s c := (P(x_i))_i with P = s + c_1 X + ⋯ + c_{t−1} X^{t−1}. The share map (s, c) ↦ shares is F-linear, and the share vectors are exactly the Reed–Solomon codewords reedSolomon x t (the secret is P(0), the evaluation at the extra point 0).
  *API:*
  - `shamirShares` (constructor): shamirShares x s c = fun i ↦ (C s + ∑_j C (c j) * X^(j+1)).eval (x i).
  - `shamirShares_add` (structure): shamirShares x (s + s′) (c + c′) = shamirShares x s c + shamirShares x s′ c′ (linearity).
  - `shamirShares_mem_reedSolomon` (compatibility): The share vectors are Reed–Solomon codewords of dimension t.
  - `shamirShares_mul` (relation): Pointwise products of shares are shares of the product secret for the product polynomial of degree ≤ 2t − 2.
  *Unit tests:*
  - `shamirShares_zmod_five` (computation): For F = ZMod 5, x = ![1, 2, 3], t = 2, s = 3, c = ![1]: shamirShares x s c = ![4, 0, 1].
  - `shamirShares_threshold_one` (degenerate): For t = 1 every share equals s.
  - `shamirShares_mem_reedSolomon` (compatibility): shamirShares x s c ∈ reedSolomon x t.
  - `shamirShares_zero_label_leaks` (non-example): If some label x_i = 0 were allowed, that player's share would be the secret s itself: the labels must be nonzero.
  *Used in:* Couvreur–Randriambololona §8.4 (i) (reconstruction by any t players (node shamir-reconstruction)); Couvreur–Randriambololona §8.4 (ii) (perfect privacy against t − 1 players (node shamir-perfect-privacy)); Couvreur–Randriambololona §8.4 (linearity and the multiplicative property underlie secure multiparty computation).
  *From other layers:* `FF.4/reed-solomon-code`.
  *Source:* `cr-ag-codes`, Section 8.4, printed pp. 47–48.
- **Reconstruction from any t shares** (theorem; node `FF.5/shamir-reconstruction`).
  In the setting of shamir-secret-sharing, for any set S of t players, the secret s is determined by the shares (y_i)_{i∈S}: s = ∑_{i∈S} y_i ∏_{j∈S, j≠i} x_j/(x_j − x_i) (Lagrange interpolation at 0).
  *Hypotheses:* #S = t; the x_i distinct.
  *Proof:* P has degree < t and is determined by its values at t distinct points (mathlib:Lagrange.eq_interpolate_of_eval_eq); evaluate the Lagrange interpolant at 0.
  *Source:* `cr-ag-codes`, Section 8.4, (i), printed p. 48.
- **Perfect privacy against t − 1 players** (theorem; node `FF.5/shamir-perfect-privacy`).
  In the setting of shamir-secret-sharing, for any set S of at most t − 1 players, any secret s and any share values v ∈ F^S, the number of randomness vectors c ∈ F^{t−1} with shamirShares x s c|_S = v equals #F^{t−1−#S}, independently of s. Hence, with c uniform, the distribution of the shares seen by S does not depend on the secret. This is an unconditional (information-theoretic) theorem, in contrast with computational hardness assumptions.
  *Hypotheses:* #S ≤ t − 1; the x_i distinct and nonzero.
  *Proof:* For fixed s, c ↦ (P(x_i))_{i∈S} is an affine map F^{t−1} → F^S whose linear part is c ↦ (∑_j c_j x_i^{j+1})_{i∈S}; this has full rank #S because the x_i are distinct and nonzero (a Vandermonde matrix times diag(x_i)). Each fibre of a surjective affine map is a coset of the kernel, of size #F^{t−1−#S}, independent of s.
  *Source:* `cr-ag-codes`, Section 8.4, (ii), printed p. 48.

### Boundaries

- FF.2 owns the Weil and Deligne estimates for finite-field sums (`FF.2/weil-bound-additive`,
  `FF.2/weil-bound-multiplicative`, `FF.2/kloosterman-bound`); FF.5 only instantiates them over `ZMod p` and for
  integer polynomials, with the constants consumers use.
- ExponentialSumsAndCircleMethod owns the circle method and singular series; FF.5 supplies the complete-sum bounds
  (ES.0) and the local densities at good primes (ES.3).
- ComputationalNumberTheory CN.5 owns certificate schemas; FF.5 states the mathematical facts and requests the schema
  for its one exhaustive check. No node asserts or assumes that a computational problem is hard.
- FF.4 owns Reed–Solomon codes and m-sequences; FF.5's Shamir and correlation nodes use them.

### Dependencies

- Inside the roadmap: FF.1 (`FF.1/canonical-additive-character`), FF.2 (`FF.2/weil-bound-additive`,
  `FF.2/weil-bound-multiplicative`, `FF.2/kloosterman-bound`), FF.4 (`FF.4/reed-solomon-code` for Shamir's scheme,
  `FF.4/decimation-cross-correlation-character-sum` for the correlation bound).
- Other roadmaps: ComputationalNumberTheory CN.5 (request: the certificate schema for exhaustive finite checks).
- Consumers: ExponentialSumsAndCircleMethod ES.0 and ES.3; coding and cryptographic applications through the examples.

### Acceptance tests

- **Weil bounds with explicit constants.** For `f = X²` the bound `(d − 1)√p = √p` is attained by the quadratic Gauss
  sum; `f = X² + X` gets the uniform constant `max(1, √2)`; `g = X³ + X + 1` (discriminant `−31`) satisfies
  `|Σ η(g(x))| ≤ 2√p` for odd `p ≠ 31`, and `X³ − 3X + 2 = (X − 1)²(X + 2)` is excluded; `kloostermanModP 3 1 1 = −1`,
  `kloostermanModP p 0 0 = p − 1`.
- **Point counts and densities.** `y² = x` over `F₅` has 5 points and `y² = x²` has `2q − 1`, showing the square
  hypothesis is needed; `x₁² + x₂² − 1` has exactly 3 zeros modulo 9 above `(1, 0)` and local density
  `1 − η(−1)/p` at odd `p`; for `x₁²` all `p` lifts of `0` are zeros (singular zero).
- **Sequences.** Gold decimations `d = 2^k + 1` satisfy `|C(t) + 1| ≤ 2^k·2^{m/2}`; `d = q` is excluded and gives
  the two-level values.
- **Correctness is not hardness.** In `(ZMod 23)ˣ` with `γ = 5`, `x = 6`, `y = 15` both keys equal `5^{90} = 2`; in
  `F_65537ˣ` with base `3`, `dlogFermat 2 = 55296` and `3^{55296} ≡ 2`, and `dlogFermat` recovers every logarithm in
  16 steps: the protocol is correct and the logarithm is easy.
- **Shamir.** With `t = 2`, `F = ZMod 5`, labels `(1, 2, 3)`, secret `3` and `c₁ = 1` the shares are `(4, 0, 1)`; the
  first two shares reconstruct `3`; one share is compatible with every secret through exactly one `c₁`.

---

## Gaps

Each of these is something this packet could not establish from the sources read. None is papered over,
and every node that depends on one names it.

### Hasse–Davenport product relation: no public proof read

The statement is taken from Conrad, Gauss and Jacobi sums, (A.6) p. 19, which says its proof uses Stickelberger's congruence and cites Berndt–Evans–Williams §11.3 (not public). The node records the standard route: reduce to Teichmüller characters, show the ratio of the two sides is a unit of absolute value 1 at every embedding (digit-sum valuations and absolute values of Gauss sums, both planned here), hence a root of unity, and identify it as 1 through Stickelberger's congruence. The last step needs the multiplication formula for the digit factorials h(a) modulo p (the Gauss multiplication formula for the p-adic Gamma function modulo p); no public source with a complete proof was read (Washington's Cyclotomic Fields and Lang's Cyclotomic Fields are not public; SGA 4½, whose 'Sommes trigonométriques' treats Gauss sums, was not found in a public copy). The case n = 2 is fully planned (FF.1/gauss-sum-duplication-formula, Kowalski Proposition 2.17).

Needed by: `FF.1/hasse-davenport-product-relation`.

### No atlas stage owns the Grothendieck–Ogg–Shafarevich Euler characteristic formula

The conductor bound dim H¹_c ≤ C(𝓕)² of FKMS (4.3), the exact dimension 2g − 2 + Σ(1 + v*_x(f)) of Sommes trig. (3.5.5) and χ_c(A¹, L_ψ(x^d)) = 1 − d in Weil I 8.11 all use χ_c(X, F) = rk F·χ(X) − Σ Sw_s(F). A search of all atlas stage texts for Ogg, Shafarevich, Euler–Poincaré and Swan finds only local conductors (ArithmeticGaloisRepresentations:R01.3) and the Néron–Ogg–Shafarevich criterion. The red team (RT-AREA-finitefields/3, confirmed) asks for a new layer of EtaleDualityAndPerverseSheaves after EDC.2. The classical one-variable Weil bounds of this stage do not need it: their H¹_c dimensions come from the elementary L-function degrees (FF.2/rank-one-sheaf-l-function). The public source to read is Raynaud's Séminaire Bourbaki exposé 286 (Numdam).

Needed by: `FF.2/h1c-conductor-bound`, `FF.2/artin-schreier-sum-on-curve-bound`, `FF.2/deligne-cohomology-of-polynomial-sheaf`.

### Weil I Lemma 8.5 rests on a relative compactification by Zariski's resolution procedure and on local constancy in the family of polynomials with smooth leading form

Deligne's proof (Weil I 8.6-8.10) compactifies the Artin–Schreier cover T^p − T = Q over the space S of polynomials with smooth leading form, resolving the surface singularity of 8.8 by alternately normalising and blowing up (8.9), to get Z_S → S proper smooth with relative normal-crossings boundary; local constancy of R^i f_! then reduces to Q = Σ x_i^d. No atlas stage owns this resolution step for spaces étale-locally smooth over a fixed normal surface, and SF.2's requested local constancy statement needs it as input. Until a supplier exists, FF.2/deligne-n-variable-bound (Weil I Théorème 8.4) is conditional on these two lemmas; the elementary n-variable bound (d − 1)q^{n−1/2} of FF.2/elementary-n-variable-bound is unconditional.

Needed by: `FF.2/deligne-cohomology-of-polynomial-sheaf`, `FF.2/deligne-duality-for-polynomial-sheaf`.

### The uniform Lang–Weil constant needs Katz's bound on sums of Betti numbers and the Albanese description of b_{2n−1}

Ghorpade–Lachaud's Theorem 11.1 bounds the error by (d − 1)(d − 2)q^{n−1/2} + C₊(V)q^{n−1} using (i) b₊_{2n−1} = 2 dim Alb_w(V) ≤ 2g(Ỹ) ≤ (d − 1)(d − 2) for a general curve section (their Theorem 10.7, Proposition 9.4), and (ii) Katz, 'Sums of Betti numbers in arbitrary characteristic' (Finite Fields Appl. 7 (2001)) for C₊(V). Neither input is planned in the atlas and neither was read here (Katz's paper was not located in public form in this session). The non-uniform FF.2/lang-weil-estimate, which is what Browning–Sawin use, does not depend on them.

Needed by: `FF.2/uniform-lang-weil-estimate`.

### Structure of the principal units 1 + 2·GR(2^n, r) for r ≥ 2

Goresky–Klapper §4.5 states (1 + 2S) ≅ (Z/2^{n−1})^{r−1} × Z/2^{n−2} × Z/2 without proof and refers to McDonald's Finite Rings with Identity, which is not public. The case r = 1 is proved in the source (Proposition 4.2.1). The decomposition for r ≥ 2 (via exp(4a) on 1 + 4S and the counts of elements of order dividing 2^k) has not been carried out.

Needed by: `FF.4/principal-units-of-galois-ring-two`.

### Katz's estimate for Soto-Andrade sums (Ramanujan property of the Terras graphs)

The bound |λ| ≤ 2√q for the nontrivial eigenvalues of X_q(δ, a) is due to Katz (J. reine angew. Math. 438 (1993), 143–161) and Li; the eigenvalues are Soto-Andrade character sums whose estimate needs ℓ-adic methods (FiniteFieldsAndCharacterSums:FF.2 / DeligneWeightsAndPurity). No public proof was available and the step is not decomposed.

Needed by: `FF.4/terras-graph-ramanujan`.

## Requests to other roadmaps

- **AdditiveCombinatorics:AC.0** — For a finite abelian group G (written additively) and f : G → ℂ: the normalised Fourier transform f̂(ψ) = (1/|G|) Σ_{x ∈ G} f(x)·conj(ψ(x)) on Mathlib's dual AddChar G ℂ, with Fourier inversion f = Σ_ψ f̂(ψ)·ψ and Parseval (1/|G|) Σ_x |f(x)|² = Σ_ψ |f̂(ψ)|²; the comparison with Mathlib's unnormalised ZMod.dft, (ZMod.dft Φ) k = N · Φ̂(ZMod.stdAddChar.mulShift k) for G = ZMod N; and the transport of f̂ along an isomorphism of G with its dual (so that FF.1 indexes the dual of (F_q, +) by a ↦ ψ.mulShift a). FF.1 specialises this to finite fields and exhibits Gauss sums as q times normalised Fourier coefficients of multiplicative characters. Needed by: `FF.1/fourier-expansion-of-multiplicative-character`.
- **WeilConjectures:WC.3** — The Riemann hypothesis for curves in its all-conjugates form: for a smooth projective geometrically connected curve C over F_q of genus g (in particular the curve attached, through the function-field/curve dictionary, to a one-variable function field over F_q with exact constant field F_q), Z(C, T) = P₁(T)/((1 − T)(1 − qT)) with P₁ ∈ ℤ[T] of degree 2g and P₁(0) = 1, and every reciprocal root α of P₁, counted with multiplicity, is an algebraic integer with |ι(α)| = q^{1/2} for every field embedding ι : ℚ̄ → ℂ. FF.2 uses it only for the Artin–Schreier and Kummer curves y^q − y = f(x), y^d = g(x). Needed by: `FF.2/additive-l-function-purity`, `FF.2/multiplicative-l-function-purity`.
- **WeilConjectures:WC.5:power-sum-converse** — The finite-spectrum lemma: for finitely many complex numbers ω₁, …, ω_δ (with multiplicity) and constants A ≥ 0, B > 0, if |ω₁^ν + ⋯ + ω_δ^ν| ≤ A·B^ν for every integer ν ≥ 1, then |ω_j| ≤ B for every j (Kowalski, Lemma 4.15). No hypothesis of purity or rationality. Needed by: `FF.2/additive-l-function-root-bound`, `FF.2/multiplicative-l-function-root-bound-coprime`.
- **DeligneWeightsAndPurity:DWP.7** — Weil II Corollaires 3.3.4-3.3.6 for sheaves: for X₀ separated of finite type over F_q and a constructible E_λ-sheaf F₀ that is ι-mixed of weights ≤ w (for instance a lisse sheaf whose Frobenius traces at all closed points are roots of unity, hence punctually pure of weight 0, and the constant sheaf ℚ_ℓ), every eigenvalue α of geometric Frobenius on H^i_c(X_F̄, F) is algebraic and all its complex conjugates have absolute value q^{w′/2} for an integer w′ ≤ w + i; for X₀ smooth and F₀ lisse punctually pure of weight w, H^i(X_F̄, F) is mixed of weights ≥ w + i, so the image of H^i_c → H^i is pure of weight w + i. Needed by: `FF.2/deligne-bound-for-trace-functions`, `FF.2/deligne-estimate-for-character-sums`, `FF.2/affine-concentration-criterion`, `FF.2/rank-one-sheaf-l-function`, `FF.2/rank-one-sheaf-root-bound`, `FF.2/deligne-n-variable-bound`, `FF.2/lang-weil-estimate`.
- **DeligneWeightsAndPurity:DWP.6** — Weil II Théorème 3.2.3: for C₀ a smooth projective curve over F_q, j : U₀ → C₀ a dense open and F₀ a lisse sheaf on U₀ punctually ι-pure of weight β, every eigenvalue of Frobenius on H¹(C_F̄, j_*F) is ι-pure of weight β + 1; used with β = 0 for the rank-one Artin–Schreier sheaves L(ψf) of a rational function f. Needed by: `FF.2/artin-schreier-sum-on-curve-bound`.
- **DeligneWeightsAndPurity:DWP.0** — q-Weil numbers of weight w: algebraic numbers all of whose complex conjugates have absolute value q^{w/2}; Galois conjugates of q-Weil numbers are q-Weil numbers of the same weight; the reciprocal roots of a polynomial in ℤ[T] satisfying the Riemann-hypothesis bound for every embedding are q-Weil numbers. Needed by: `FF.2/additive-l-function-purity`, `FF.2/multiplicative-l-function-purity`.
- **SchemeAndStackFoundations:SF.2** — The Grothendieck–Lefschetz trace formula for E_λ-sheaves (Sommes trig. (1.1.1)), integrating the CohomologicalPointCounting TraceFormula supplier: for X₀ separated of finite type over F_q and a constructible E_λ-sheaf F₀, the H^i_c(X_F̄, F) are finite-dimensional, vanish for i outside [0, 2 dim X₀], and for every ν ≥ 1, Σ_{x∈X₀(F_{q^ν})} Tr(F_x^{*ν} | F_x̄) = Σ_i (−1)^i Tr(F^{*ν} | H^i_c(X_F̄, F)); equivalently L(X₀, F₀, T) = Π_i det(1 − T F* | H^i_c)^{(−1)^{i+1}}. With constant coefficients it counts #X₀(F_{q^ν}). Needed by: `FF.2/character-sheaf-trace-formula`, `FF.2/lisse-sheaf-extremal-cohomology-on-curve`, `FF.2/deligne-bound-for-trace-functions`, `FF.2/rank-one-sheaf-l-function`, `FF.2/artin-schreier-sum-on-curve-bound`, `FF.2/fourier-deligne-transform`, `FF.2/lang-weil-estimate`.
- **SchemeAndStackFoundations:SF.2** — The dictionary between lisse E_λ-sheaves on a connected X₀ and continuous representations of π₁(X₀, x̄) on finite-dimensional E_λ-spaces (Frobenius at a closed point = the Frobenius class), and the push-out ρ(T) of a torsor T under a finite abelian group A along a character ρ : A → E_λ^× as a rank-one lisse sheaf with a nowhere-vanishing map T → ρ(T), ρ(ta) = ρ(a)ρ(t) (Sommes trig. 1.2); for open subsets of A¹_{F_q}, lisse sheaves as unramified representations of Gal(F_q(X)^sep/F_q(X)) (FKMS Definition 3.1). Needed by: `FF.2/artin-schreier-sheaf`, `FF.2/kummer-sheaf`.
- **SchemeAndStackFoundations:SF.2** — For Rf_! with E_λ-coefficients over F_q or F̄_q: proper base change, the projection formula, the Künneth formula (Sommes trig. (2.4.1)*), H*_c(A¹_F̄, E) = E(−1)[−2], constancy on a connected base of R pr_{1!} pr₂^*F (Sommes trig. Lemme 2.8), Artin vanishing H^i(X, F) = 0 for i > dim X on affine X, and local constancy of R^i f_! for a proper smooth f with relative normal-crossings boundary and tame coefficients (Weil I 8.10). Needed by: `FF.2/homotopy-invariance-of-endomorphism-action`, `FF.2/translation-cancellation`, `FF.2/affine-concentration-criterion`, `FF.2/deligne-cohomology-of-polynomial-sheaf`, `FF.2/deligne-duality-for-polynomial-sheaf`, `FF.2/fourier-deligne-inversion`, `FF.2/fourier-input-for-one-modulus`, `FF.2/lisse-sheaf-extremal-cohomology-on-curve`.
- **EtaleDualityAndPerverseSheaves:EDC.2** — Poincaré duality for X₀ smooth separated of pure dimension n over F_q and F lisse: H^i_c(X_F̄, F) × H^{2n−i}(X_F̄, F^∨(n)) → E_λ perfect and Frobenius-equivariant; hence H^{2n}_c(X_F̄, F) ≅ (F_x̄)_{π₁(X_F̄)}(−n) for X connected (coinvariants, Sommes trig. 1.18 d)), H^{2n}_c(V_F̄, ℚ_ℓ) ≅ ℚ_ℓ(−n) for V geometrically irreducible of dimension n (via a smooth dense open), and on a smooth proper curve the duality of H¹(X̄, j_*F) with H¹(X̄, j_*F^∨(1)) (SGA 4½ [Dualité] 1.3, 2.1). Needed by: `FF.2/lisse-sheaf-extremal-cohomology-on-curve`, `FF.2/affine-concentration-criterion`, `FF.2/involution-eigenvalue-pairing`, `FF.2/deligne-duality-for-polynomial-sheaf`, `FF.2/lang-weil-estimate`, `FF.2/artin-schreier-sum-on-curve-bound`.
- **EtaleDualityAndPerverseSheaves:EDC.2** — The Grothendieck–Ogg–Shafarevich formula: for X̄ a smooth projective connected curve of genus g over an algebraically closed field of characteristic p ≠ ℓ, X = X̄ ∖ S with S finite, and F a lisse E_λ-sheaf on X, χ_c(X, F) = rk(F)·(2 − 2g − #S) − Σ_{s∈S} Sw_s(F) (Sommes trig. (3.2.1), citing Raynaud, Séminaire Bourbaki 286). No atlas stage states it; this asks the owner of étale duality on curves to add it (RT-AREA-finitefields/3, confirmed), see also the gap and the restructure proposal. Needed by: `FF.2/h1c-conductor-bound`, `FF.2/artin-schreier-sum-on-curve-bound`, `FF.2/deligne-cohomology-of-polynomial-sheaf`.
- **ArithmeticGaloisRepresentations:R01.3** — Swan conductors in equal characteristic: for a complete discretely valued field K of characteristic p with algebraically closed residue field (e.g. F̄_q((t))) and a continuous E_λ-representation V of Gal(K^sep/K), Sw(V) = Σ_λ λ·dim V(λ) over the upper-numbering breaks, an integer, additive in short exact sequences and invariant under unramified extension; for the nontrivial characters of an Artin–Schreier extension T^p − T = u with v(u) = −m, p ∤ m, Sw = m. R01.3's text is written for arithmetic Galois representations; this request asks that equal-characteristic local fields be covered. Needed by: `FF.2/swan-conductor-of-artin-schreier-sheaf`.
- **WeilConjectures:WC.0** — For X₀ separated of finite type over F_q and a finite extension L/F_q, #X₀(L) is finite and depends only on [L:F_q] (canonical translation between point sets over isomorphic extensions). Needed by: `FF.2/lang-weil-estimate`.
- **SchemeAndStackFoundations:SF.0** — For V separated of finite type over F_q: V_F̄ has finitely many irreducible components; each is the base change of a geometrically irreducible closed subscheme of V ⊗ F_{q^{r₀}} for some r₀ ≥ 1; dim V is the maximum of their dimensions; removing the other components leaves a dense open of each component. Needed by: `FF.2/dimension-from-point-counts`.
- **SchemeAndStackFoundations:SF.1** — Galois twisting over finite fields: for a quasi-projective Y₀ over F_q with a finite group G of F_q-automorphisms and g ∈ G, a variety Y₀^{(g)} over F_q and an isomorphism Y^{(g)} ⊗ F̄ ≅ Y ⊗ F̄ carrying the Frobenius of Y^{(g)} to g⁻¹ ∘ F (effective descent along F̄_q/F_q). Needed by: `FF.2/geometric-chebotarev`.
- **FunctionFieldArithmetic:FA.5** — For a one-variable function field E/F_q with exact constant field F_q and genus g: Z_E(T) := Π_P (1 − T^{deg P})^{−1} = exp(Σ_ν N_ν T^ν/ν) with N_ν the number of degree-one places of the constant field extension E·F_{q^ν}, and Z_E(T) = L_E(T)/((1 − T)(1 − qT)) with L_E ∈ ℤ[T] of degree exactly 2g and L_E(0) = 1 (Riemann–Roch rationality route). Needed by: `FF.2/artin-schreier-zeta-factorization`, `FF.2/kummer-zeta-factorization`.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves** — Artin–Schreier covers y^p − y = u and their elementary abelian generalisation y^q − y = u (Stichtenoth 3.7.8, 3.7.10), and Kummer covers y^n = u (3.7.3), with the stated hypotheses: exact constant field, ramification indices, different exponents (p − 1)(m_P + 1) (resp. n/r_P − 1) and the closed genus formulas; applied to u = f ∈ F_q[X] with a single pole of order d prime to p (genus (q − 1)(d − 1)/2) and to squarefree g with gcd(n, deg g) = 1 (genus (n − 1)(deg g − 1)/2). Needed by: `FF.2/artin-schreier-function-field`, `FF.2/kummer-function-field`, `FF.2/artin-schreier-curve-point-count`, `FF.2/artin-schreier-zeta-factorization`, `FF.2/kummer-zeta-factorization`, `FF.2/swan-conductor-of-artin-schreier-sheaf`, `FF.2/kummer-curve-point-count`.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-** — Constant field extensions: for E/F_q with exact constant field, E·F_{q^ν} has exact constant field F_{q^ν} and the same genus, and places of degree one stay of degree one; totally ramified places of degree one over F_q(X) stay so. Needed by: `FF.2/artin-schreier-function-field`, `FF.2/kummer-function-field`, `FF.2/artin-schreier-curve-point-count`, `FF.2/kummer-zeta-factorization`, `FF.2/kummer-curve-point-count`.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge** — Affine models: for a regular affine model F[X, Y]/(P(Y) − g(X)) (P monic in Y), this ring is the integral closure of F[X] in the function field, and its maximal ideals with residue field F correspond bijectively to the places of degree one over finite points of the X-line. Needed by: `FF.2/artin-schreier-curve-point-count`, `FF.2/kummer-zeta-factorization`, `FF.2/kummer-curve-point-count`.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts** — The dictionary between one-variable function fields over F_q with exact constant field and smooth projective geometrically connected curves over F_q, matching degree-one places with rational points and constant field extensions with base change, so that WeilConjectures:WC.3 applies to the function fields E_f and E_g. Needed by: `FF.2/artin-schreier-function-field`, `FF.2/kummer-function-field`.
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration** — The upper-numbering ramification filtration of a finite Galois extension of complete discretely valued fields, and the equality of the lower and upper break for a cyclic extension of degree p (used for Artin–Schreier extensions of F̄_q((t))). Needed by: `FF.2/swan-conductor-of-artin-schreier-sheaf`.
- **ComputationalNumberTheory:CN.0** — The algebraic cost model over a commutative ring R, with the randomness model, as Shoup uses them in Chapter 20 (§§3.2, 9.1, 17.1): (1) an algorithm over R is a program whose primitive steps are +, −, ×, the equality test, inversion of units and, for finite R, drawing a uniformly random element of R, each of unit cost ('operations in R'); (2) a deterministic program's cost on an input is the number of primitive steps; a randomized program on an input has an output distribution (a Mathlib PMF) and a cost random variable, halts with probability 1 when P[more than n steps] → 0, and has expected cost E[cost] (Shoup §9.1.2); serial composition, conditionals and loops (Shoup Examples 9.1-9.4) and the generate-and-test theorem (Shoup Theorem 9.3: geometric number of iterations, E[Z] = E[Z₁]/P[H₁], conditional output law); (3) the dense coefficient-vector representation of R[X] with the costs of Shoup Theorem 17.1 (± in O(len g + len h), × in O(len g · len h), division with remainder by h with unit leading coefficient in O(len h · len q)), arithmetic in R[X]/(f) (+ in O(ℓ), × in O(ℓ²), α^e with O(len e) multiplications, Shoup p. 467), Euclid and extended Euclid over a field in O(len g · len h) (Theorems 17.3, 17.5), and Gaussian elimination over a field computing the reduced row echelon form, the rank and a basis of the row null space of an m × n matrix in O(mn(m + n)) operations (Shoup §14.4, pp. 390-393); (4) the translation to bit operations for the standard presentations of 𝔽_q (ℤ/p, or 𝔽_p[X]/(φ) with φ irreducible of degree w; FiniteFieldsAndCharacterSums FF.0), where one operation in 𝔽_q costs O(len(q)²) bit operations (Shoup Chapter 20 introduction), and for ℤ/p^kℤ, O(len(p^k)²). Needed by: `FF.3/square-free-decomposition-algorithm-cost`, `FF.3/distinct-degree-factorization-algorithm-cost`, `FF.3/irreducibility-test-cost`, `FF.3/rabin-certificate-generation-cost`, `FF.3/equal-degree-factorization-cost`, `FF.3/cantor-zassenhaus-cost`, `FF.3/berlekamp-algorithm`, `FF.3/berlekamp-algorithm-correct`, `FF.3/berlekamp-algorithm-cost`, `FF.3/random-irreducible-polynomial-cost`, `FF.3/hensel-lifting-algorithm-cost`, `FF.3/naive-point-count-cost`, `FF.3/schoof-algorithm-cost`.
- **ComputationalNumberTheory:CN.0** — Executable presentations with refinement lemmas: dense coefficient-list presentations of F[X] over the FF.0 standard presentations of finite fields and of (ℤ/p^kℤ)[X], with lemmas identifying their +, ×, division by a monic polynomial, gcd and extended gcd, and modular powering with Mathlib's Polynomial operations, so that FF.3's checkers (FactorizationCertificate.check, PointCountCertificate.check, FF.0's Rabin checker) and algorithms evaluate by computation on concrete inputs. FF.3's objects are Mathlib functions on Polynomial F; CN.0 owns their computable refinements. Needed by: `FF.3/factorization-certificate`, `FF.3/point-count-certificate`, `FF.3/certified-factorization-algorithm`, `FF.3/cantor-zassenhaus-algorithm`, `FF.3/berlekamp-algorithm`, `FF.3/schoof-algorithm`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1** — For W : WeierstrassCurve F elliptic over a finite field F with q elements: (a) the Hasse bound hasse_bound, (frobeniusTrace W)² ≤ 4q, with Tau Ceti's frobeniusTrace = q + 1 − pointCount; (b) the Frobenius relation on points: for every algebraically closed field K ⊇ F and every P ∈ (W.baseChange K).toAffine.Point, π(π P) − (frobeniusTrace W) • π P + q • P = 0 with π = WeierstrassCurve.Affine.Point.map (FiniteField.frobeniusAlgHom F K), i.e. the point-level form of layer 3's π_q² − [a_q]π_q + [q] = 0 through the layer-0 dictionary that π_q acts on points by (x, y) ↦ (x^q, y^q). FF.3 imports both and does not reprove them. Needed by: `FF.3/hasse-error-bound-for-point-counts`, `FF.3/schoof-trace-modulo-prime-sound`, `FF.3/schoof-trace-modulo-prime-complete`, `FF.3/schoof-algorithm-correct`.
- **tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68** — For W elliptic over a field k, K ⊇ k algebraically closed and n with (n : K) ≠ 0: Nat.card {P : (W.baseChange K).toAffine.Point // (n : ℤ) • P = 0} = n², the cardinality consequence of layer 2's torsion_addEquiv_prod (E[n] ≃+ (ZMod n)²). FF.3 uses it for n = ℓ an odd prime to show that the ℓ-division polynomial is separable (completeness of Schoof's algorithm). Needed by: `FF.3/separability-of-division-polynomials`, `FF.3/schoof-algorithm-correct`.
- **tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-1-finite-codes-matrices-and-elementary-constructions** — The linear-code carrier TauCeti.LinearCode F ι = Submodule F (ι → F) for an arbitrary finite coordinate type, with generator matrices (Matrix.generatedBy, the row space of G.vecMulLinear) and existence of generator matrices from bases; both are built at the pin and are used as baseline declarations. Needed by: `FF.4/reed-solomon-code`, `FF.4/singleton-bound`.
- **tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-2-hamming-data-and-dual-codes** — The minimum distance d(C) of a linear code with the zero-code convention d(⊥) = 0 and, for C ≠ ⊥, equality with the least weight of a nonzero codeword (hammingNorm); and the Euclidean dual C^⊥ := LinearMap.BilinForm.orthogonal (dotProductBilin F F) C with dim C + dim C^⊥ = #ι and C^⊥⊥ = C. FF.4 states MDS and duality with these conventions. Needed by: `FF.4/dual-of-generalized-reed-solomon`, `FF.4/mds-code`, `FF.4/residue-code-is-dual`.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus** — Places of a function field F/k with degrees, the residue field of a rational place identified with k (TauCeti.Place.residueFieldEquivOfDegreeEqOne), divisors with degree, the Riemann–Roch spaces L(D) with ℓ(D), L(D) = 0 for deg D < 0, the genus with Riemann's inequality ℓ(D) ≥ deg D + 1 − g, and L(n·P∞) in k(x) = polynomials of degree ≤ n; all built at the pin and cited as baseline declarations. Needed by: `FF.4/ag-code-dimension`, `FF.4/algebraic-geometry-evaluation-code`, `FF.4/evaluation-at-rational-place`, `FF.4/goppa-bound`, `FF.4/reed-solomon-as-ag-code`.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch** — Weil differentials Ω_F(D) (TauCeti.weilDifferentialFiltration) with dim_k Ω_F(D) = i(D) and the Riemann–Roch theorem (TauCeti.exists_isRiemannRochDivisor), for function fields with exact constant field; built at the pin. Needed by: `FF.4/algebraic-geometry-residue-code`, `FF.4/residue-code-is-dual`.
- **tauceti:TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components** — Local components ω_P of Weil differentials, the abstract residue theorem ∑ᶠ_P ω_P(x) = 0, the characterisation of Ω_F(D) by vanishing of local components, and the regime deg D ≥ 2g − 1 (ℓ(D) = deg D + 1 − g, i(D) = 0); built at the pin. Needed by: `FF.4/ag-code-dimension`, `FF.4/algebraic-geometry-residue-code`, `FF.4/residue-code-is-dual`.
- **ComputationalNumberTheory:CN.5** — A certificate schema for exhaustive finite verification: a statement ∀ x ∈ S, P x with S finite and P decidable, certified by kernel evaluation (decide/native evaluation) with the verification cost reported, and a schema for recording an explicit constant instantiation of an imported theorem. FF.5 instantiates it for correctness-without-hardness-example (∀ α ∈ F_65537ˣ, 3^{dlogFermat α} = α, a check over 65536 elements). Needed by: `FF.5/correctness-without-hardness-example`.

## Structural proposals

Recorded in the packet's `restructure` list. This packet works with the current structure.

### `rescope`: FiniteFieldsAndCharacterSums

FF.1 now holds 42 nodes in four groups that share few prerequisites: characters, conventions and elementary sums; the Hasse–Davenport relations; Stickelberger's congruence and the prime factorisation of Gauss and Jacobi sums; and harmonic analysis on F_q((1/T)) with measures on ℤ (the BKK route). For the atlas the layer reads better as four sub-layers (PROTOCOL §14).

**Proposal.** FF.1a Characters and conventions: canonical-additive-character, additive-characters-are-shifts, norm-lift-of-a-multiplicative-character, trace-lift-of-an-additive-character, trivial-character-conventions, gauss-sum-transport, gauss-sum-galois-conjugation, gauss-sum-absolute-value, jacobi-sum-absolute-value, mulchar-column-orthogonality, power-count-via-characters, fourier-expansion-of-multiplicative-character, gauss-sum-frobenius-invariance, gauss-sum-duplication-formula. FF.1b Hasse–Davenport: hasse-davenport-weight, hasse-davenport-degree-sums, polynomial-euler-product-recurrence, hasse-davenport-orbit-sum, hasse-davenport-lifting, hasse-davenport-lifting-for-jacobi-sums, hasse-davenport-product-relation. FF.1c Stickelberger: teichmuller-character, prime-above-p-in-cyclotomic-compositum, multi-jacobi-sum, gauss-sum-product-and-multi-jacobi-sum, multinomial-coefficient-congruences, jacobi-sum-teichmuller-congruence, gauss-sum-teichmuller-base-congruence, stickelberger-congruence, gauss-sum-valuation-digit-sum, prime-factorisation-of-gauss-sums, stickelberger-relation, prime-factorisation-of-jacobi-sums. FF.1d Harmonic analysis on F_q((1/T)): fourier-transform-of-integer-measure, fourier-gap-from-residue-anticoncentration, residue-character-at-infinity, residue-pairing-duality, negative-power-torus, haar-measure-on-negative-power-torus, reduced-polynomial-fractions, torus-character-orthogonality, torus-finite-coordinate-integral.

### `rescope`: EtaleDualityAndPerverseSheaves, FiniteFieldsAndCharacterSums

The Grothendieck–Ogg–Shafarevich Euler characteristic formula for lisse sheaves on curves is used by FF.2 (conductor bounds, the curve bound (3.5.2), Weil I 8.11) and by the proposed KloostermanMomentsAndPotentialAutomorphy, and no atlas stage states it (RT-AREA-finitefields/3, confirmed). It is a theorem about étale cohomology of curves, not about finite-field sums.

**Proposal.** Add a sub-stage EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic after EDC.2 (inputs EDC.2 and the local Swan conductor of ArithmeticGaloisRepresentations:R01.3 in equal characteristic): χ_c(X, F) = rk F · χ_c(X) − Σ_s Sw_s(F) for F lisse on a dense open X of a smooth projective connected curve over an algebraically closed field, with χ_c = χ, sourced to Raynaud's Séminaire Bourbaki 286 or SGA 5 X. Link it to FiniteFieldsAndCharacterSums:FF.2. FF.2 keeps the local computation Sw_x(L_ψ(f)) = v*_x(f).

### `split`: FiniteFieldsAndCharacterSums

FF.2 has 88 nodes along four lines of development that read as separate stars in the atlas.

**Proposal.** Divide FF.2 into sub-layers (parentStageId unchanged until the division is accepted): FF.2a 'One-variable L-functions and Stepanov's method' (additive-companion-sum, multiplicative-companion-sum, monic-l-series, monic-l-series-log-derivative, root-sum-additive-character, root-sum-multiplicative-character, additive-l-function, multiplicative-l-function, root-sum-additive-top-coefficients, additive-l-function-is-polynomial, root-sum-multiplicative-periodicity, multiplicative-l-function-is-polynomial, l-function-reciprocal-roots, primitive-ring-gauss-sum-norm, multiplicative-l-function-leading-coefficient, multiplicative-l-function-functional-equation, mixed-l-function-is-polynomial, trace-kernel-artin-schreier, artin-schreier-point-count-average, kummer-point-count-average, the Stepanov nodes stepanov-curve-ring … stepanov-bound-artin-schreier-curve, additive-l-function-root-bound, multiplicative-l-function-root-bound-coprime, weil-bound-additive, weil-bound-multiplicative-coprime-degree, and the degenerate-case nodes artin-schreier-reduced-form, artin-schreier-invariance, artin-schreier-trivial-sum, weil-bound-additive-reduced, multiplicative-perfect-power-sum); FF.2b 'Curves' (artin-schreier-function-field, artin-schreier-curve-point-count, artin-schreier-zeta-factorization, additive-l-function-purity, kummer-function-field, kummer-curve-point-count, kummer-zeta-factorization, multiplicative-l-function-purity); FF.2c 'Trace functions and Deligne bounds' (artin-schreier-sheaf, kummer-sheaf, character-sheaf-trace-formula, homotopy-invariance-of-endomorphism-action, character-sheaf-cohomology-vanishes, translation-cancellation, trace-function, lisse-sheaf-extremal-cohomology-on-curve, modified-pole-order, swan-conductor-of-artin-schreier-sheaf, h1c-conductor-bound, deligne-bound-for-trace-functions, deligne-estimate-for-character-sums, affine-concentration-criterion, rank-one-sheaf-l-function, rank-one-sheaf-root-bound, weil-bound-multiplicative, weil-bound-mixed, artin-schreier-sum-on-curve-bound, involution-eigenvalue-pairing, kloosterman-sum, kloosterman-l-function, kloosterman-bound, gauss-sum-frobenius-eigenvalue, hypersurface-through-all-rational-points, elementary-n-variable-bound, deligne-cohomology-of-polynomial-sheaf, deligne-duality-for-polynomial-sheaf, deligne-n-variable-bound); FF.2d 'Fourier–Deligne transform and Lang–Weil' (fourier-deligne-transform, fourier-deligne-inversion, fourier-input-for-one-modulus, lang-weil-estimate, uniform-lang-weil-estimate, dimension-from-point-counts, geometric-chebotarev). Dependencies run FF.2a → FF.2b, FF.2a → FF.2c → FF.2d.

### `rescope`: FiniteFieldsAndCharacterSums, DrinfeldModulesAndTModules

The reviewed audit flags that DrinfeldModulesAndTModules:DM.0 again constructs additive polynomials as the Ore ring L{τ} of F_q-linear endomorphisms of G_a, FF.4's additive-polynomial target.

**Proposal.** FF.4 owns the polynomial-level theory of q-linearized polynomials over fields of characteristic p (FF.4 nodes linearized-polynomial, linearized-polynomial-eval-linear, linearized-polynomial-comp, roots-of-linearized-polynomial, linearized-polynomial-separable-iff, subspace-polynomial, subspace-polynomial-is-linearized, linearized-q-associate and the permutation criteria). DM.0 keeps the Ore ring L{τ} over F_q-algebras, its identification with FF.4's composition ring of q-polynomials (Wu–Liu Theorem 2.1) and Drinfeld modules, and imports the FF.4 nodes through a link FF.4 → DM.0.

### `split`: FiniteFieldsAndCharacterSums

FF.4 has 91 declaration-level nodes in five independent topics; the atlas would show it more legibly as sub-layers (parent nodes of the same roadmap), without changing the stage id or its edges.

**Proposal.** Sub-layers of FF.4: (a) Galois rings: finite-local-ring-is-henselian … trace-of-galois-ring (16 nodes); (b) linearized and permutation polynomials: linearized-polynomial … dickson-permutation-criterion (22 nodes); (c) linear recurring sequences and correlation: least-period-of-sequence … decimation-cross-correlation-character-sum (17 nodes); (d) evaluation, BCH and algebraic geometry codes: singleton-bound … residue-code-parameters (23 nodes); (e) the finite upper half-plane and Hecke operators: finite-upper-half-plane … terras-graph-ramanujan (13 nodes).

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/FiniteFieldsAndCharacterSums.json --index <pinned declaration index>

Zero errors and zero warnings. The suggested Lean file elaborates against Mathlib `082e2d3` with `lake env lean`;
its only messages are `declaration uses 'sorry'` warnings. Every API item and unit test of the packet occurs in it
under its packet name.
