# K-theory of number fields and S-integers

The arithmetic K-groups of a number field combine ideal classes, units, ranks,
cyclotomic torsion and arithmetic cohomology. This roadmap builds the bridge
from those arithmetic objects to K-theory: localisation first, finite generation
and ranks next, then the integral odd and even groups, regular-prime consequences
and examples with independently certified orders. A rank formula is insufficient
to determine torsion, and a zeta value is insufficient to certify a group
presentation. The later layers keep those obligations explicit.

The scope is a number field F and its rings of S-integers, with a finite set S of
finite primes when finite generation or rank is asserted. Dedekind-domain
localisation and the certificate engine are stated in the generality their users
need. The finite-generation layer also records the affine and proper curve
applications of Quillen’s criterion, with their separate function-field input.
Their proof gap is not discharged by number-field arithmetic groups.

## Scope and boundaries

| Supplier or consumer | Contract with this roadmap |
| --- | --- |
| [KTheoryLowDegrees](../../../content/campaign/KTheoryLowDegrees/README.md), Z.4 and U.4 | Supplies K₀ and K₁ of Dedekind S-integers, including determinant and SK₁. N.1 owns the localisation presentation of the existing S-integer ring and compares pullback/transfer with ideal extension/norm and unit norm. Z.6 and U.6 supply the integer examples. |
| [GeneralAlgebraicKTheory](../../../content/campaign/GeneralAlgebraicKTheory/README.md) and [SchemeKTheoryOperations](../../../content/campaign/SchemeKTheoryOperations/README.md), S.3 | Supply K-theory carriers, functoriality and general localisation. N.2 specialises localisation to Dedekind domains and records finite support, residue terms and classical rows. |
| [K2SymbolsBrauer](../../../content/campaign/K2SymbolsBrauer/README.md), T.2–T.5 and T.7 | Supplies Steinberg symbols, tame symbols, the tame-kernel sequences, sign symbols and twisted coefficients. N.2 identifies its degree-two row with T.5’s sequence; N.6 owns the wild kernel and certificate engine, and N.8 owns Tate’s explicit computation method and its example certificates. |
| [KTheoryFiniteLocalFields](../../../content/campaign/KTheoryFiniteLocalFields/README.md), L.1–L.2, L.7 | Supplies finite-field K-groups, local torsion and completion maps. This roadmap applies them globally. |
| [BorelRegulators](../../../content/campaign/BorelRegulators/README.md), R.1 and R.3 | Supplies integral arithmetic-group Steinberg homology and Borel’s independent rank theorem for orders. N.3 owns the Q-construction rank filtration, finite-generation assembly and the passage to S-integers; it does not prove arithmetic-group finiteness from stable rational cohomology. |
| [StableHomotopyKTheory](../../../content/campaign/StableHomotopyKTheory/README.md) and [MotivicEtaleKTheory](../../../content/campaign/MotivicEtaleKTheory/README.md) | Supply stable-homotopy finiteness and the actual comparison maps, rigidity and real-place dyadic data. N.5 and N.6 pass to integral arithmetic groups and retain the extension information. Tate’s K₂/Galois comparison belongs to M.3. |
| [K3BlochGroups](../../../content/campaign/K3BlochGroups/README.md), V.5 | Supplies K₃ of the integers, rationals and Gaussian rationals. N.8 imports those examples. |
| [IntegralIwasawaTheory](../../../content/campaign/IntegralIwasawaTheory/README.md), L3 | Owns the single Vandiver predicate. N.7 owns its comparison with cyclotomic eigenspaces and its conditional K-theory consequences. Regularity is a separate full-class-group condition. |
| [Class Field Theory](../../../content/tau-ceti/ClassFieldTheory/README.md) | Supplies local/global Brauer and Galois-cohomology arithmetic used in N.7. The link CFTL92 supplies the local Brauer calculation; arithmetic K-theory does not build reciprocity or another cohomology carrier. |
| [SpecialValuesBirchTate](../../../content/campaign/SpecialValuesBirchTate/README.md), B.1–B.5 | Consumes N.4’s W₂ and w₂, N.3’s even-group finiteness and N.8’s real-quadratic certificate. It owns the zeta-value computations, Birch–Tate checks and theorem status. No numerical check supplies N.8’s upper or lower certificate bound. |

The arithmetic carriers, places and completions are consumed from Mathlib and
the existing [Number Field Arithmetic](../../../content/tau-ceti/NumberFieldArithmetic/README.md),
[Global Number Fields](../../../content/tau-ceti/GlobalNumberFields/README.md) and
[Profinite Cohomology](../../../content/tau-ceti/ProfiniteCohomology/README.md)
roadmaps. There is one S-integer ring, one cohomology theory and one certificate
engine. Boundaries and supplier requests below name the exact nodes used.

## Standing conventions

* Write O_F for the ring of integers, O_{F,S} for Mathlib’s S.integer F,
  r₁ and r₂ for the real and complex place counts, and k(𝔭) for the residue field.
  S contains finite primes only; archimedean places are listed separately in
  cohomological formulas. For a general Dedekind domain the S-integer overring
  need not be a localisation; N.1 states the precise criterion.
* Valuations are multiplicative in the library. If ord_𝔭 is written additively,
  v_𝔭(x) = ofAdd(−ord_𝔭(x)). The class map of the localisation sequence is
  e_𝔭 ↦ [𝔭]⁻¹, and the field-unit boundary records ord_𝔭(x). The tame symbol
  follows T.3’s convention ∂_v{u,t} = ū for a unit u and a uniformiser t.
* K_n denotes the actual algebraic K-group. The ring and field groups remain
  distinct until a named comparison identifies them. Higher odd comparison
  is Soulé’s N.5 theorem; N.2 supplies even injectivity without that theorem.
* For n ≥ 2 the S-integer rank is r₁+r₂ in degree 1 modulo 4, r₂ in degree 3
  modulo 4, and zero in even degree. Degree one has rank r₁+r₂+|S|−1.
  Finite generation concerns rings of S-integers, not Fˣ or K₂(F).
* N.4 defines W_i(F) = H⁰(F, ℚ/ℤ(i)) and w_i(F) = |W_i(F)| with the
  cyclotomic i-th Tate action. It is not the ordinary roots of unity of F:
  w₂(ℚ)=24 whereas |μ(ℚ)|=2. Weights are integers in N.4 and positive integers
  in N.7. Cardinal formulas require finite fixed-point groups; weight zero is
  excluded from number-field finiteness.
* Bernoulli numbers are arithmetic: B₁=−1/2. Weibel’s topologists’ B_k^top
  means (−1)^{k+1} B_{2k} = |B_{2k}| for k≥1, and differs from Mathlib’s
  bernoulli′ convention. Thus w_{2k}(ℚ)=denominator(B_{2k}/4k).
  The corrected value w₁₀(ℚ)=264 is retained with its source issue.
* A regular prime l does not divide the class number of ℚ(ζ_l). Vandiver’s
  condition concerns its maximal real subfield and carries its own hypothesis.
  The cyclotomic projector denominator is l−1, invertible modulo l; it is
  not an integral division. The Herbrand–Ribet index is l−2k.
* At two, real places force the eightfold correction tables and exceptional-field
  hypotheses. The subgroup of elements divisible by every positive integer
  need not itself be divisible. The tame and wild kernels remain distinct.
* An order certificate contains relations, a proof that the generators span,
  an independent finite quotient of the target and matching finite orders.
  Upper bounds alone do not identify a group. Claims are labelled computed,
  imported or deduced; a formula-derived order cannot test that formula.

## Sources and library baseline

The source register and node locators below retain the parts’ edition and
checksum information. Their read-section records are the parts’ provenance;
assembly introduces no claim to have read an additional proof. In Weibel’s
combined 29 August 2013 draft, PDF page = printed page + 8. Separately hosted
chapter files have their own pagination and checksums.

The library baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The reviewed AUDIT-27 in
[library-coverage.json](../../../data/library-coverage.json) supplies the
inventory: class groups, S-integers, units, places, Bernoulli numbers and
cyclotomic arithmetic are present; higher K-group and arithmetic comparison
interfaces are not. Suggested signatures and source-decomposed plans do not
assert that these results have been formalised.

### Kbook.2013: The K-book: An Introduction to Algebraic K-theory

Charles A. Weibel. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013). [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).

SHA-256: `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.

**Source coverage recorded for N.1–N.6.**

- I.3, Dedekind domains and Ex. I.3.8 (PDF pp. 29–31 and 37): the class group, finiteness of Pic(O_F), projectivity of torsion-free modules, relative class groups for a localisation.
- II.2.6–2.6.3 and Ex. II.2.2 (PDF pp. 82–83 and 86): K₀ of a one-dimensional noetherian ring, the projection formula and f_∗f^∗ = multiplication by [A].
- III.1.3.5–1.3.6, III.1.5.4, III.2.5–2.5.1 (PDF pp. 191, 193, 202–203): K₁ of fields, Bass–Milnor–Serre, SK₁ of the circle ring.
- III.6.5–6.5.1 (PDF p. 244): the localisation sequence for K₂ and K₂(ℚ).
- V.4.1–4.4, V.5.2, V.6.1–6.1.2 (PDF pp. 408–409, 413–414): dévissage, torsion modules as a colimit, the localisation sequence with coefficients, ∂(s) = [R/sR].
- V.6.6–6.6.4 (PDF pp. 417–418): the sequence (6.6), (6.6.1), the tame symbol, Corollary 6.6.2 and the transfer morphism (6.6.3)–(6.6.4).
- V.6.8, 6.8.1 and 6.8.2 with both proofs in full (PDF pp. 420–421).
- IV.1.12–1.13 (PDF p. 277; book p. 269): Quillen's finite-field calculation.
- IV.1.17–1.18, Regulator Maps 1.18.1 and Example 1.18.2 (PDF pp. 279–280; book pp. 271–272): Borel's theorems, the definition of an order, the degrees of the primitive generators, and the degree-one warning for group rings. The earlier entry's 'PDF pp. 270 to 271' is off by nine.
- IV.6.8–6.9 (PDF p. 333; book p. 325): Bass' conjecture, Quillen's criterion and Theorem 6.9. The earlier 'PDF p. 324' is off by nine.
- VI.1.4–1.7.1 (PDF pp. 474–476): Harris–Segal's Theorem 1.5, Corollary 1.5.2, the Tate twist µ(i) and the Galois module K_{2i−1}(F̄)_tors.
- VI.2 in full, through Exercise 2.6 (PDF pp. 477–483; book pp. 469–475): Definition 2.1, Examples 2.1.1–2.1.2, Remark 2.1.3, Proposition 2.2 with Lemma 2.2.1 and Example 2.2.2, exceptional fields, Proposition 2.3, Example 2.3.1, Lemma 2.4 with the Bernoulli numbers and Remark 2.4.2, the Harris–Segal Theorem 2.5 with its proof, Remark 2.5.1, Theorem 2.6 and Example 2.7. The earlier 'PDF pp. 469 to 473' is off by eight or nine.
- VI.8.1 and the Birch–Tate paragraph VI.8.6 (PDF pp. 521 and 523; book pp. 513 and 515). The earlier 'PDF pp. 512 to 514' is off by nine; VI.9.5 is on PDF p. 527.
- VI.8 (PDF pp. 521–524; book pp. 513–516), read by the review's checker C3: Classical Data 8.1 with (8.1.1), Theorem 8.2 with its whole proof, Corollary 8.3 and Examples 8.3.1–8.3.2, Theorem 8.4 with its proof and the preceding remark, 8.6–8.8 with the proof of 8.8, Exercises 8.1–8.6. The packet's earlier 'PDF pp. 512 to 514' are book pages.
- VI.9 (PDF pp. 525–534; book pp. 517–526): Theorem 9.1 with Variants 9.1.2–9.1.3, (9.2), Lemma 9.3, Theorem 9.4 with its proof, Theorem 9.5 with its proof and Example 9.5.1, 9.6 to Lemma 9.6.3, Theorem 9.7 (statement), Corollaries 9.8–9.10 with Examples 9.9.1–9.10.1 and Question 9.10.2, Theorem 9.11 with its proof, Theorem 9.12 with its proof, Exercises 9.1–9.6.
- Bibliography (PDF p. 576): [161] Rognes–Weibel, J. AMS 13 (2000); [225] Weibel, 'Higher wild kernels and divisibility in the K-theory of number fields', J. Pure Appl. Algebra 206 (2006) 222–244.
- Page convention: PDF page = book page + 8. The packet's locators labelled 'PDF p.' were book pages, some one page low (VI.8.4 is on book p. 514, VI.8.7–8.8 on p. 515, VI.9.5 on p. 519, VI.9.11 on p. 524, VI.9.12 on p. 525, V.6.8.2 on p. 413); the corrected locators give both.
- Re-read 2026-09-30 for the fix of RT-AREA-ktheory-1 (same file, SHA-256 a04f53c9…): IV.6.8–6.9 (PDF p. 333; book p. 325), Quillen's criterion and Theorem 6.9; VI.3.1 (PDF p. 483; book p. 475), Suslin's theorem on K_*(ℝ) with finite coefficients; VI.9.1–9.4 (PDF pp. 525–527; book pp. 517–519), the use of Suslin's calculation in the real-place spectral sequences; III.5.2.2 (PDF p. 226), III.6.2.1 (PDF p. 240) and Ex. III.6.4 (PDF p. 251; book p. 243), the order-two computation of K₂(ℤ), the real symbol and the surjection K₂(F) → {±1}^{r_1}.

**Source coverage recorded for N.7–N.8.**

- Downloaded and hashed on 24 September 2026; the hash reproduces the one recorded by the packets of K2SymbolsBrauer, Polylogarithms and MotivesAndAlgebraicCycles, so this is the same file those cite.
- III.5.2.2 (PDF p. 222): the computation of the second K-group of the integers, cited by the source to Milnor's section 10, with the remark that the symbol of minus one with itself is the only non-trivial element of the kernel, and Tate's computations for the quadratic rings, including the vanishing for the Gaussian integers.
- III.6.1 to III.6.5.3 (PDF pp. 230 to 246): Matsumoto's theorem, the vanishing of the second K-group of a finite field with its proof, the leading-coefficient symbol, Steinberg symbols, the sign symbol at a real place, the Hilbert and norm residue symbols, Moore's theorem, the tame symbol with its proof, and the computation of the second K-group of the rationals with its splitting.
- VI.2.4 and VI.2.4.1 (PDF pp. 465 to 466): the denominator of the Bernoulli numbers, the value of the invariant w_i over the rationals in both parities, the definition of a regular and of an irregular prime, Iwasawa's equivalent form, the smallest irregular primes, Siegel's conjecture with the numerical evidence, Kummer's criterion and its consequence through Kummer's congruences.
- VI.5.3 (PDF p. 489): the structure theorem for the third K-group of a number field, in the totally imaginary case and in the case with a real place.
- VI.8.1 with Classical Data 8.1, VI.8.2 and VI.8.6 (PDF pp. 507 to 513): the finiteness and rank statements for the K-groups of a number field, the formulas in degrees zero and one for a ring of S-integers, the Brauer-group sequence, the localisation of the K-groups at a prime, and the Birch-Tate conjecture with its status and its worked rational instance.
- VI.10.1.1, VI.10.2, VI.10.5, VI.10.6, VI.10.8, VI.10.8.1 and VI.10.8.2 (PDF pp. 528 to 533): the table of the K-groups of the integers with its note on the groups in degrees divisible by four, the conditional table under Vandiver's conjecture, the vanishing of l-torsion in the even groups at an odd regular prime with the identification of the remaining torsion, the free-module structure of the mod-l K-theory with its generators and the worked case l = 5, Vandiver's conjecture in both forms with its verification bound, the Herbrand-Ribet theorem, and the historical remark.
- Reread on 6 October 2026 for FIX-RT-BP-ArithmeticKTheory--N.7~2 (same SHA-256): III.6.8 (printed p. 239, PDF p. 247), the theorem that every element of exponent n of K₂(F) is a symbol {ζ, x} when F contains a primitive n-th root of unity; and VI.9.9–VI.9.9.2 (printed pp. 522–523, PDF pp. 530–531), the 2-ranks of the even K-groups and the 2-regular real quadratic fields, ℚ(√5) among them.
- Not read: the chapters on the constructions of higher K-theory, the proofs of the etale descent theorems of chapter VI sections 6 to 9 beyond the statements cited, and the exercises.

### Kahn.2014: Around Quillen's theorem A

Bruno Kahn. arXiv:1108.2441v3 [math.KT], dated 2 July 2014. [Around Quillen's theorem A](https://arxiv.org/pdf/1108.2441).

SHA-256: `71b5da651ba9feca4c1abcc58f566afbf11019dda465cbc3a95aace7cb1e2406`.

**Source coverage recorded for N.1–N.6.**

- Introduction (pp. 1–2): the exact sequences of Quillen's Theorem 3 assemble into the rank spectral sequence.
- 1.3.5, 1.4.2–1.4.6 (pp. 5–7): homology with coefficients, the Grothendieck construction, Thomason's theorem, the spectral sequence E²_{p,q} = H_p(D, H_q(F_T)) ⇒ H_{p+q}(C).
- 2.1.4, 2.2.1–2.2.3, 2.3.1–2.3.7, 2.4.1 (pp. 8–12): reduced homology with coefficients, cellular functors, the homotopy cocartesian square and long exact sequence, the spectral sequence of a cellular filtration.
- 3.1–3.2 (pp. 13–14) in outline: Quillen's decomposition of T(V) and the Solomon–Tits theorem.
- 4.1–4.3.4 (pp. 15–18) in full: the rank filtration Q_n of Q(X), the groupoids Q_n − Q_{n−1}, pure subsheaves and subspaces (4.2.4), the comma categories as posets of proper layers (4.2.6), the Dedekind case (4.2.7), the fibres as suspended buildings (4.3.1–4.3.2), the E¹ term (4.3.3) and the comparison with Quillen's Theorem 3 (4.3.4).

### PutmanStudenmund.2021: The dualizing module and top-dimensional cohomology group of GL_n(O)

Andrew Putman and Daniel Studenmund. arXiv:1909.01217v4 [math.NT], dated 23 April 2021. [The dualizing module and top-dimensional cohomology group of GL_n(O)](https://arxiv.org/pdf/1909.01217v4).

SHA-256: `3421bcfaffc1e05198ae8323971872ca3774bd73c067077e94f46ed5d073d7ad`.

**Source coverage recorded for N.1–N.6.**

- §1 (pp. 2–5): the vcd of GL_n(O), the virtual duality H^{vcd−i}(G; M) ≅ H_i(G; M ⊗ D) for finite-index G (integral coefficients when G is torsion-free), the Tits building and Steinberg module, Example 1.4 (the untwisted Steinberg module is not the dualizing module of GL_2(ℤ)) and Theorem C.
- §2 (pp. 7–10): Proposition 2.1 (the Borel–Serre bordification of GL_n(O), its boundary ≃ T_n(K), its dimension, and orientation reversal exactly when n is even and χ(g) = −1), Lemmas 2.2–2.3 and the start of the proof of Theorem C.
- §4.1 (p. 17): intersections of subspaces of Q ⊗ K with a projective O-module Q are direct summands; Lemma 4.1, det(GL(P)) ⊂ O^× through an embedding GL(P) ↪ GL(O^m).

### Sun.2016: Algebraic K-theory and modular symbols

Fei Sun. arXiv:1604.04700v1 [math.AT], dated 16 April 2016. [Algebraic K-theory and modular symbols](https://arxiv.org/pdf/1604.04700).

SHA-256: `c0585949df902e30b7368c235210e8b20a0dea344ed88a9e7a65577ec681e793`.

**Source coverage recorded for N.1–N.6.**

- pp. 4–7: the rank spectral sequence for torsion-free modules over an integral noetherian domain, the suspension model of the Tits building, the reduced Steinberg module (Definition 0.2) and the remark that unreduced homology is wrong in dimension two, and Quillen's conditions (1)–(2) with the Hochschild–Serre passage through a normal subgroup of finite index.

### Kbook.IV.chapter: Weibel, K-book chapter IV, separately hosted author chapter

Charles A. Weibel. Separately hosted author chapter downloaded 2026-09-30; checksum and chapter-PDF pagination distinguish it from the earlier combined draft.. [Weibel, K-book chapter IV, separately hosted author chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf).

SHA-256: `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248`.

**Source coverage recorded for N.1–N.6.**

- PDF p.59: IV.6.8–6.9, criterion and two arithmetic cases

### CGZ.1712.04887v3.fix: Calegari–Garoufalidis–Zagier, Bloch groups, algebraic K-theory, units, and Nahm’s conjecture (v3)

Frank Calegari, Stavros Garoufalidis, Don Zagier. arXiv:1712.04887v3; preprint, not the published Ann. Sci. ENS text.. [Calegari–Garoufalidis–Zagier, Bloch groups, algebraic K-theory, units, and Nahm’s conjecture (v3)](https://arxiv.org/pdf/1712.04887v3).

SHA-256: `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5`.

**Source coverage recorded for N.1–N.6.**

- PDF p.20: Lemma 3.5, Keune coinvariants and unit descent
- PDF pp.23–24: §4.2, finite-field homology maps
- PDF pp.37–39: Theorem 7.4 and proof

### Kbook.VI.chapter: Weibel, K-book chapter VI

Charles A. Weibel. Separately hosted author chapter downloaded 2026-09-30; checksum and chapter-PDF pagination distinguish it from the earlier combined draft.. [Weibel, K-book chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf).

SHA-256: `efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1`.

**Source coverage recorded for N.1–N.6.**

- PDF p.37: VI.6.1 finite-generation use and proof

### Tate.1976: Relations between K₂ and Galois cohomology

John Tate. Inventiones mathematicae 36 (1976), 257–274; the journal pages as scanned by the Göttingen digitisation centre (GDZ), without a text layer. [Relations between K₂ and Galois cohomology](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf).

SHA-256: `5d1ee68e3f9cc49ba6cac8269e1c9ca510411c6a154f36b559290849a72db7b7`.

**Source coverage recorded for N.7–N.8.**

- Downloaded from GDZ on 6 October 2026 and read from page images (PDF page n is printed page 255 + n).
- §1 (printed pp. 257–258): the plan of the paper, including the statement that for a global field containing a primitive l-th root of unity z every element of order l of K₂F is {z, a}.
- §6, Theorems (6.1), (6.2) and (6.3) with their proofs (printed pp. 270–272, PDF pp. 15–17): the image of γ is (K₂F)_l, so that every element of order l is {z, a} when μ_l ⊂ F; the exact sequence 0 → μ_l ⊗ Pic O_S → K₂O_S/l → (∐_{v∈S−S_c} μ_l)_0 → 0 for S containing the archimedean places and those above l.
- Not read: §§2–5 beyond the statement of Theorem (5.4), and Theorems (6.5)–(6.6) beyond their statements.

### Browkin.2000: Computing the tame kernel of quadratic imaginary fields

Jerzy Browkin, with an appendix by Karim Belabas and Herbert Gangl. Mathematics of Computation 69 (2000), no. 232, 1667–1683; the publisher's PDF, free on the AMS site. [Computing the tame kernel of quadratic imaginary fields](https://www.ams.org/journals/mcom/2000-69-232/S0025-5718-00-01182-0/S0025-5718-00-01182-0.pdf).

SHA-256: `99001ec60a5df5be749f6122877f944545b24e00513051f6dd8b2ddc2e2f7028`.

**Source coverage recorded for N.7–N.8.**

- §1 (p. 1667): Tate determined the tame kernel of every Euclidean imaginary quadratic field and of ℚ(√−15), proving that the maps ∂_v are isomorphisms for N v large and treating the remaining places by computations with symbols; the remark that orders of tame kernels of real quadratic fields are usually obtained from Bernoulli numbers, that is from the Birch–Tate formula.
- §2 (p. 1668): the ordering of places by norm, the filtration K₂^{S_m}(F), the maps α and β, the group U₁, and the descent: if ∂_{v_j} is an isomorphism for all j ≥ m then ker ∂ ⊂ K₂^{S_{m−1}}(F).
- §3 up to Lemma 7 (pp. 1668–1673): Tate's Proposition 1 (Theorem 1, stated without proof), Tate's Lemma 1 (Lemma 4, stated without proof), Remark 1, the sets W and C for imaginary quadratic fields, and the statement of Skalba's generalised Thue theorem for imaginary quadratic fields (Theorem 2).
- Not read: the rest of §3, §§4–6 (the field ℚ(√−23)) and the appendix.

### ZhangXu.2016: The tame kernel of ℚ(ζ₅) is trivial

Long Zhang and Kejian Xu. Mathematics of Computation 85 (2016), no. 299, 1523–1538, electronically published 11 August 2015; the publisher's PDF, free on the AMS site. [The tame kernel of ℚ(ζ₅) is trivial](https://www.ams.org/journals/mcom/2016-85-299/S0025-5718-2015-03003-8/S0025-5718-2015-03003-8.pdf).

SHA-256: `08576560a20ee5c8a45b3993d314d8d3818e4e98e4e99e724d0d94f5fd511ed3`.

**Source coverage recorded for N.7–N.8.**

- The whole paper: §1 (Tate's method and its history), §2 (the tame map, the filtration K₂^{S_m}(F), Tate's Lemma 2.1 and Lemma 2.2, the arithmetic of ℚ(ζ₅) in Lemma 2.3), §3 (Lemmas 3.1–3.2, the sets W_m, C_m and G_m, Theorems 3.3–3.6 with Tables 1 and 2, and Theorem 3.7 with its proof), and the references.
- The proof of Theorem 3.5 and the construction of G_m cite Skalba's generalised Thue theorem (reference [11]), which was not obtained (recorded gap).

## Layer overview

| Layer | Aim | Nodes |
| --- | --- | --- |
| [N.1](#layer-n-1) | S-integers, low degrees and functoriality | 7 |
| [N.2](#layer-n-2) | Dedekind localisation and classical rows | 6 |
| [N.3](#layer-n-3) | Finite generation and ranks | 1 |
| [N.3:finite-generation](#layer-n-3-finite-generation) | Quillen’s rank filtration | 12 |
| [N.3:ranks](#layer-n-3-ranks) | Borel ranks and even-group finiteness | 3 |
| [N.4](#layer-n-4) | Twisted roots of unity and the w-invariant | 7 |
| [N.5](#layer-n-5) | Odd groups and integral torsion | 7 |
| [N.6](#layer-n-6) | Even groups, wild kernels and order certificates | 13 |
| [N.7](#layer-n-7) | Regular primes and Bernoulli numbers | 9 |
| [N.8](#layer-n-8) | Certified examples | 11 |

N.1–N.6 form the arithmetic spine; N.7–N.8 consume its explicit nodes. The node prerequisites below give the declaration-level order, including sublayers of N.3.

<a id="layer-n-1"></a>

## N.1. S-integers, low degrees and functoriality

Start with the existing S-integer ring. Its localisation presentation and extension behaviour connect the imported K₀ and K₁ computations to ideal classes and units. The transfer on K₀ includes the Steinitz class of the underlying extension module.

<a id="node-arithmeticktheory-n-1-s-integers-as-a-localisation"></a>

### When the ring of S-integers is a localisation, and independence of the presentation

**Theorem · `ArithmeticKTheory:N.1/S-integers-as-a-localisation`.** Let R be a Dedekind domain with fraction field K, S any set of height-one primes of R, and O_S = S.integer K the ring of S-integers (Mathlib's Set.integer: the x ∈ K with v(x) ≤ 1 for every v ∉ S), an R-subalgebra of K. Let M_S ⊆ R be the submonoid of the r ∈ R whose image in O_S is a unit, equivalently r ≠ 0 and v(r) = 1 for every v ∉ S (the preimage of the units of O_S, Mathlib's Submonoid.comap of IsUnit.submonoid). For a submonoid M of R the following are equivalent: (i) O_S is the localisation of R at M (Mathlib's IsLocalization M O_S); (ii) M ⊆ M_S and every v ∈ S contains an element of M. Consequently a presentation of O_S as a localisation of R, when one exists, is any submonoid satisfying (ii), and every such presentation yields the same subring O_S of K: the ring does not depend on the presentation. No finiteness of S is needed. The carrier itself, its Dedekind property and its class group are already in the pinned libraries and are not re-planned.

**Hypotheses and conventions.**

1. R is a Dedekind domain (Mathlib's IsDedekindDomain) with fraction field K; valuations are Mathlib's HeightOneSpectrum.valuation, written multiplicatively, so v(r) ≤ 1 for r ∈ R and v(r) < 1 iff r ∈ v.
2. S is an arbitrary set of height-one primes; the stage's O_{F,S} is the case R = 𝓞_F, S finite.
3. O_S is Mathlib's Set.integer S K; Tau Ceti already proves that it is a Dedekind domain (TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean:271, an anonymous instance) and computes its class group (IsDedekindDomain.integerClassGroupEquiv), so neither is planned here.
4. Whether (ii) can be met is a class-group question: the next node shows M_S meets it when Cl(R) is torsion, and Tau Ceti's SInteger/Basic.lean docstring gives a Dedekind domain with Cl(R) ≅ ℤ where it cannot.

**Construction or proof.**

1. (i) ⇒ (ii), first half: the elements of M become units of O_S, and a unit of O_S has valuation 1 at every v ∉ S (Set.unitEquivUnitsInteger, Set.mem_integer_iff), so M ⊆ M_S.
2. (i) ⇒ (ii), second half: if some v ∈ S met M in no element, then M ⊆ R ∖ v, so M⁻¹R ⊆ R_v and the extension of v to M⁻¹R is proper; but v·O_S = O_S (Tau Ceti's IsDedekindDomain.integer_map_asIdeal_eq_top), a contradiction.
3. (ii) ⇒ (i), units: M ⊆ M_S. Kernel: R → K is injective, so the kernel condition of IsLocalization is vacuous.
4. (ii) ⇒ (i), surjectivity: for x ∈ O_S the set of v with v(x) > 1 is finite (Mathlib's HeightOneSpectrum.Support.finite) and contained in S; for each such v choose m_v ∈ M ∩ v, so v(m_v) < 1 (valuation_lt_one_iff_mem) and w(m_v) ≤ 1 for all w; for k large, y = x·∏ m_v^k has w(y) ≤ 1 for every w, hence y ∈ R (mem_integers_of_valuation_le_one) and x = y/∏ m_v^k.
5. Independence: under (ii) the ring M⁻¹R is, as a subring of K, the fixed ring S.integer K, whatever M is.

**Acceptance checks.**

1. S = ∅: M = {1} satisfies (ii) vacuously and O_∅ = R, which is Mathlib's IsDedekindDomain.integer_empty.
2. S = all height-one primes: M = R ∖ {0} satisfies (ii) and O_S = K, Mathlib's IsDedekindDomain.integer_univ.
3. R = ℤ, S = {(p)}: M = {p^k} satisfies (ii), so O_S = ℤ[1/p]; M = {1} does not.
4. R = 𝓞 of ℚ(√−5), S = {𝔭₂} with 𝔭₂ = (2, 1 + √−5) non-principal and 𝔭₂² = (2): M = {2^k} satisfies (ii) (2 ∈ 𝔭₂ and v(2) = 1 for v ≠ 𝔭₂), so O_S = 𝓞[1/2]; M = {1} does not.
5. If Cl(R) ≅ ℤ is generated by the class of a prime v and S = {v} (Tau Ceti's docstring example), then M_S = R^× and no M satisfies (ii): O_S is not a localisation of R.

**Prerequisites.** `mathlib:Set.integer`; `mathlib:IsLocalization`; `mathlib:IsDedekindDomain.HeightOneSpectrum`; `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite`; `mathlib:IsDedekindDomain.HeightOneSpectrum.mem_integers_of_valuation_le_one`; `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_lt_one_iff_mem`; `mathlib:Set.unitEquivUnitsInteger`; `tauceti:Set.mem_integer_iff`; `tauceti:IsDedekindDomain.integer_map_asIdeal_eq_top`; `mathlib:IsDedekindDomain.integer_empty`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. I.3.8, Relative Class groups (PDF p. 37; book p. 29). The K-book treats rings of S-integers as localisations S⁻¹R whose lost primes are those meeting the multiplicative set; condition (ii) is that property for a submonoid of R. The K-book states no theorem of this form: the node follows the library (Mathlib's Set.integer, and Tau Ceti's SInteger/Basic.lean docstring, which records that O_S need not be a localisation).

<a id="node-arithmeticktheory-n-1-k1-of-s-integers-and-the-determinant"></a>

### K₁ of the S-integers inside K₁ of the field: the S-units, and a group that is not finitely generated

**Comparison · `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`.** Let F be a number field and S a finite set of nonzero primes of 𝓞_F. Under the determinant identifications K₁(O_{F,S}) ≅ O_{F,S}^× (KTheoryLowDegrees U.4, Bass–Milnor–Serre) and K₁(F) ≅ F^× (KTheoryLowDegrees U.3), the map K₁(O_{F,S}) → K₁(F) is the inclusion of the S-unit group (Mathlib's Set.unit S F, identified with (S.integer F)^× by Set.unitEquivUnitsInteger). Its image is finitely generated (Tau Ceti's Set.unit_fg_of_units, from Mathlib's Monoid.FG (𝓞 F)^×) of rank r₁ + r₂ + |S| − 1 with torsion μ(F) (U.4), whereas F^× = K₁(F) is not finitely generated. So the map is injective but never surjective, and no statement about the rank or the finite generation of K₁(O_{F,S}) transfers to K₁(F). The identifications and the rank are imported from U.4; what this node adds is that F^× is not finitely generated and the comparison of the two groups.

**Hypotheses and conventions.**

1. F is a number field, S a finite set of nonzero primes of 𝓞_F; O_{F,S} = S.integer F.
2. SK₁(O_{F,S}) = 0, the determinant identification and the S-unit rank are KTheoryLowDegrees U.4's; K₁ of a field is U.3's ('Prove SK₁ vanishing for fields').
3. Mathlib has Dirichlet's theorem only for S = ∅ (NumberField.Units.rank = r₁ + r₂ − 1); Tau Ceti's Set.unit_fg_of_units gives finite generation for finite S but no rank (TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:195–207).

**Construction or proof.**

1. Import from U.4 the determinant isomorphism K₁(O_{F,S}) ≅ O_{F,S}^×, the S-unit rank and the comparison with the unit inclusion into K₁(F); import K₁(F) ≅ F^× from U.3.
2. Identify O_{F,S}^× with Mathlib's Set.unit S F (Set.unitEquivUnitsInteger); finite generation is Tau Ceti's Set.unit_fg_of_units with Mathlib's instance Monoid.FG (𝓞 F)^×.
3. F^× is not finitely generated: ℚ^× ⊆ F^×, and ℚ^× maps onto the free abelian group ⊕_{p prime} ℤ by the p-adic valuations (padicValRat; p ↦ e_p), which has infinite rank since there are infinitely many primes (Nat.exists_infinite_primes); a subgroup of a finitely generated abelian group is finitely generated (ℤ is noetherian), and a quotient of one is too.
4. Hence the inclusion O_{F,S}^× ⊂ F^× is proper, and K₁(O_{F,S}) → K₁(F) is injective with a finitely generated image in a group that is not finitely generated.

**Acceptance checks.**

1. F = ℚ, S = ∅: K₁(ℤ) = {±1} → K₁(ℚ) = ℚ^× is the inclusion of {±1} (III.1.3.5).
2. F = ℚ, S = {p}: the image is {±1} × p^ℤ, of rank 1 = r₁ + r₂ + |S| − 1.
3. F^× is not finitely generated, already for F = ℚ.
4. The rank r₁ + r₂ + |S| − 1 is U.4's; Classical Data VI.8.1 misprints it as r₂ + |S| − 1 (known erratum; see sourceIssues).

**Prerequisites.** `KTheoryLowDegrees:U.4`; `KTheoryLowDegrees:U.3`; `mathlib:Set.unit`; `mathlib:Set.unitEquivUnitsInteger`; `tauceti:Set.unit_fg_of_units`; `mathlib:NumberField.Units.rank`; `mathlib:NumberField.Units.torsion`; `mathlib:padicValRat`; `mathlib:Nat.exists_infinite_primes`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.1.3.5 (PDF p. 191; book p. 183). K₁ of the field is its multiplicative group.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.1.3.6 (PDF p. 191; book p. 183). Bass–Milnor–Serre: K₁ of the S-integers is their unit group; this is the part imported from U.4.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.1.3.6 (PDF p. 191; book p. 183). Finite generation and the rank s − 1 of K₁(O_{F,S}), with s = r₁ + r₂ + |S| the places at infinity for O_{F,S}; the finitely generated group this node contrasts with F^×.

<a id="node-arithmeticktheory-n-1-norms-transfers-and-pullbacks"></a>

### Extension of ideals and the relative norm against pullback and transfer on K₀ of S-integers

**Comparison · `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`.** Let F′/F be an extension of number fields of degree d, S a finite set of nonzero primes of 𝓞_F, S′ the primes of 𝓞_{F′} over S, and i : O_{F,S} → O_{F′,S′} the inclusion, which makes O_{F′,S′} a finitely generated projective O_{F,S}-module of rank d (N.1/S-integers-in-a-finite-extension). Write K₀ ≅ ℤ ⊕ Cl via (rank, det) (KTheoryLowDegrees Z.4), Cl multiplicatively, and let 𝔰 = det_{O_{F,S}}(O_{F′,S′}) ∈ Cl(O_{F,S}) be the Steinitz class. Then the pullback i^* (base change) is (n, c) ↦ (n, ext(c)), with ext Mathlib's ClassGroup.extendedHom (extension of ideals), and the transfer i_* (restriction of scalars) is (n, c′) ↦ (d·n, N(c′)·𝔰^n), with N Tau Ceti's ClassGroup.relNorm (the relative norm), by Z.4's formula det(Res P) = Norm(det P)·𝔰^{rank P}. Consequently i_*∘i^* is multiplication by the class [O_{F′,S′}] = (d, 𝔰) ∈ K₀(O_{F,S}): (n, c) ↦ (d·n, c^d·𝔰^n). On the class-group summand it is c ↦ c^d (Tau Ceti's ClassGroup.relNorm_extendedHom), but on K₀ it is multiplication by the degree only when 𝔰 = 1.

**Hypotheses and conventions.**

1. F′/F is a finite extension of number fields (hence separable) of degree d; S is finite and S′ is the set of primes of 𝓞_{F′} lying over a prime of S.
2. K₀ ≅ ℤ ⊕ Pic by rank and determinant, the comparison of Pic with the class group, and the restriction-of-scalars determinant formula are KTheoryLowDegrees Z.4's ('The transfer of an ideal class requires the determinant/norm formula; it is not just multiplication by the extension degree on every summand'). The projection formula against K₀ is U.5's.
3. The transfer exists because O_{F′,S′} is finitely generated projective over O_{F,S}; that is the lemma N.1/S-integers-in-a-finite-extension, not an assumption.

**Construction or proof.**

1. Pullback: base change P ↦ P ⊗ O_{F′,S′} preserves rank and sends det P to its extension, which on classes is ClassGroup.extendedHom.
2. Transfer: restriction of scalars sends a projective of rank n to one of rank d·n with determinant Norm(det P)·𝔰^n (Z.4's formula); on the rank-zero part this is ClassGroup.relNorm.
3. Composite: i_*i^*(n, c) = (d·n, N(ext c)·𝔰^n) = (d·n, c^d·𝔰^n) by relNorm_extendedHom; equivalently i_*i^* is multiplication by i_*(1) = [O_{F′,S′}] (projection formula, U.5; Ex. II.2.2(b)).
4. Compare with the K₀ ring structure of Z.4, (m, a)(n, b) = (mn, a^n b^m): multiplication by (d, 𝔰) is the displayed map.

**Acceptance checks.**

1. F = ℚ, F′ = ℚ(i), S = {2}: O_{F,S} = ℤ[1/2], O_{F′,S′} = ℤ[i][1/2] is free with basis 1, i, so 𝔰 = 1 and i_*i^* is multiplication by 2 on K₀(ℤ[1/2]) ≅ ℤ.
2. On the class-group summand i_*i^* is c ↦ c^d for every extension (ClassGroup.relNorm_extendedHom).
3. i_*(1) = (d, 𝔰), not (d, 1) in general: a formalisation that makes i_*i^* multiplication by d on all of K₀ is wrong whenever the Steinitz class is non-trivial.
4. i^* on Cl(O_{F,S}) is compatible with Tau Ceti's integerClassGroupEquiv for F and F′.

**Prerequisites.** [ArithmeticKTheory:N.1/S-integers-in-a-finite-extension](#node-arithmeticktheory-n-1-s-integers-in-a-finite-extension); `KTheoryLowDegrees:Z.4/rank-pic-equivalence`; `KTheoryLowDegrees:Z.4`; `KTheoryLowDegrees:U.5`; `mathlib:ClassGroup.extendedHom`; `tauceti:ClassGroup.relNorm`; `tauceti:ClassGroup.relNorm_extendedHom`; `tauceti:IsDedekindDomain.integerClassGroupEquiv`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. II.2.2, Projection Formula (PDF p. 86; book p. 78). The setting: A = O_{F′,S′} is finitely generated projective of rank d over R = O_{F,S}.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. II.2.2(b) (PDF p. 86; book p. 78). The composite f_∗f^∗ is multiplication by the class [A], not by the rank: the source of the Steinitz-class correction.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.3 (PDF p. 418; book p. 410). Restriction of scalars along R ⊂ R′ defines the transfer; the node applies it to O_{F,S} ⊂ O_{F′,S′}.

<a id="node-arithmeticktheory-n-1-s-integers-localisation-of-torsion-class-group"></a>

### With a torsion class group, the S-integers are the localisation at M_S

**Theorem · `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`.** Let R be a Dedekind domain with fraction field K whose class group is torsion — for instance finite, as for R = 𝓞_F with F a number field (Mathlib's NumberField.RingOfIntegers.instFintypeClassGroup). For every set S of height-one primes, the submonoid M_S of N.1/S-integers-as-a-localisation satisfies its condition (ii), so S.integer K is the localisation of R at M_S. Concretely, if h_v is the order of the class of v ∈ S and v^{h_v} = (a_v), any submonoid M with {a_v : v ∈ S} ⊆ M ⊆ M_S presents S.integer K; for finite S, S.integer K = R[1/∏_{v∈S} a_v].

**Hypotheses and conventions.**

1. R is a Dedekind domain with torsion class group; S is any set of height-one primes.
2. The a_v are not canonical; by the previous node nothing depends on them.

**Construction or proof.**

1. For v ∈ S the class [v] has finite order h ≥ 1 (isOfFinOrder_of_finite for a finite class group), so v^h = (a) is principal (ClassGroup.mk0_eq_one_iff).
2. a ∈ v since h ≥ 1, and w(a) = 1 for every w ≠ v since (a) = v^h; hence a ∈ M_S ∩ v.
3. So M_S, and any submonoid between {a_v} and M_S, satisfies condition (ii); apply N.1/S-integers-as-a-localisation.
4. For finite S the submonoid generated by a = ∏ a_v gives R[1/a].

**Acceptance checks.**

1. ℚ(√−5), S = {𝔭₂}: h = 2 and a = 2, so O_S = 𝓞[1/2], and Cl(O_S) = Cl(𝓞)/⟨[𝔭₂]⟩ = 1 by Tau Ceti's integerClassGroupEquiv, [𝔭₂] generating Cl(𝓞) ≅ ℤ/2.
2. R = ℤ, S = {(p) : p ∈ P} for any set P of primes: O_S = ℤ[1/p : p ∈ P]; for P all primes this is ℚ, so S need not be finite.
3. The hypothesis cannot be dropped: Tau Ceti's SInteger/Basic.lean docstring example (Cl(R) ≅ ℤ, S = {v}).

**Prerequisites.** [ArithmeticKTheory:N.1/S-integers-as-a-localisation](#node-arithmeticktheory-n-1-s-integers-as-a-localisation); `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`; `mathlib:isOfFinOrder_of_finite`; `mathlib:ClassGroup.mk0_eq_one_iff`; `mathlib:ClassGroup`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), I.3, Dedekind domains (PDF p. 30; book p. 22). Finiteness of the class group of 𝓞_F, the hypothesis that makes a power of each prime principal.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof (PDF p. 521; book p. 513). The source uses the presentation O_S[1/ℓ] of a larger ring of S-integers as a localisation.

<a id="node-arithmeticktheory-n-1-s-integers-monotone"></a>

### Enlarging S: the rings grow and the presentations are compatible

**Lemma · `ArithmeticKTheory:N.1/S-integers-monotone`.** Let R be a Dedekind domain with fraction field K and S ⊆ S′ sets of height-one primes. Then S.integer K ≤ S′.integer K as R-subalgebras of K. If the class group of R is torsion, S′.integer K is moreover the localisation of S.integer K at the image of M_{S′} (IsLocalization (M_{S′}.map (algebraMap R (S.integer K))) (S′.integer K)), so a presentation of O_{S′} is obtained from one of O_S by inverting further elements.

**Hypotheses and conventions.**

1. S ⊆ S′; the second statement uses the torsion class group through the previous node.

**Construction or proof.**

1. Monotonicity: the condition v(x) ≤ 1 for all v ∉ S′ is weaker than for all v ∉ S (as in Tau Ceti's Set.unit_mono for the units).
2. M_S ≤ M_{S′}, and R → S.integer K → S′.integer K is a scalar tower.
3. By the previous node R → S.integer K and R → S′.integer K are the localisations at M_S and M_{S′}; Mathlib's IsLocalization.isLocalization_of_submonoid_le gives the localisation of S.integer K at the image of M_{S′}.

**Acceptance checks.**

1. S = ∅ ⊆ S′: 𝓞 ≤ O_{S′}, the inclusion of the ring of integers.
2. R = ℤ, S = {2} ⊆ S′ = {2, 3}: ℤ[1/2] ≤ ℤ[1/6], and ℤ[1/6] is ℤ[1/2] with 3 inverted.
3. The unit groups grow too (Tau Ceti's Set.unit_mono), compatibly with Set.unitEquivUnitsInteger.

**Prerequisites.** [ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group](#node-arithmeticktheory-n-1-s-integers-localisation-of-torsion-class-group); `mathlib:Set.integer`; `tauceti:Set.mem_integer_iff`; `tauceti:Set.unit_mono`; `mathlib:IsLocalization.isLocalization_of_submonoid_le`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.4 (PDF p. 527; book p. 519). The source compares rings of S-integers by inclusion (O_S ⊇ O_F[1/2]), which is this lemma.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof (PDF p. 521; book p. 513). Enlarging S by the primes over ℓ is inverting ℓ in O_S.

<a id="node-arithmeticktheory-n-1-s-integers-in-a-finite-extension"></a>

### The S-integers of a finite extension are finite projective over those of the base

**Lemma · `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`.** Let F′/F be a finite extension of number fields, S a set of nonzero primes of 𝓞_F and S′ the primes of 𝓞_{F′} lying over a prime of S. Then S.integer F ⊆ S′.integer F′, and S′.integer F′ is the integral closure of S.integer F in F′ (Mathlib's IsIntegralClosure); it is a finitely generated projective S.integer F-module of rank [F′ : F].

**Hypotheses and conventions.**

1. F′/F is finite, hence separable; S is any set of nonzero primes of 𝓞_F.
2. Only the class group of 𝓞_F is used, through N.1/S-integers-localisation-of-torsion-class-group; the class group of 𝓞_{F′} is not needed.

**Construction or proof.**

1. The image of M_S in 𝓞_{F′} lies in M_{S′}: an m ∈ 𝓞_F outside every v ∉ S lies in no w ∉ S′, since w ∩ 𝓞_F ∉ S; and each w ∈ S′ contains a_v for v = w ∩ 𝓞_F ∈ S. By N.1/S-integers-as-a-localisation (applied to 𝓞_{F′}), S′.integer F′ = M_S⁻¹𝓞_{F′}; in particular S.integer F = M_S⁻¹𝓞_F ⊆ S′.integer F′.
2. Integrality: 𝓞_{F′} is integral over 𝓞_F and the elements of M_S are units of S.integer F, so M_S⁻¹𝓞_{F′} is integral over S.integer F; conversely S′.integer F′ is integrally closed with fraction field F′ (Tau Ceti's instance), so it is the integral closure.
3. Finiteness: Mathlib's IsIntegralClosure.finite (S.integer F is integrally closed and noetherian).
4. Projectivity: finitely generated and torsion-free over a Dedekind domain, hence flat (IsDedekindDomain.flat_iff_torsion_eq_bot) and finitely presented, hence projective (Module.Flat.projective_of_finitePresentation).
5. Rank: F′ is the localisation of S′.integer F′ at the non-zero elements of S.integer F (IsIntegralClosure.isLocalization), so the rank is [F′ : F].

**Acceptance checks.**

1. F = ℚ, F′ = ℚ(i), S = {2}: S′ = {(1 + i)} and S′.integer F′ = ℤ[i][1/2], free over ℤ[1/2] with basis 1, i.
2. S = ∅: 𝓞_{F′} is the integral closure of 𝓞_F in F′, as Mathlib has.
3. The hypothesis of V.6.6.3 (R′ finitely generated as an R-module) holds for O_{F,S} ⊂ O_{F′,S′}.

**Prerequisites.** [ArithmeticKTheory:N.1/S-integers-as-a-localisation](#node-arithmeticktheory-n-1-s-integers-as-a-localisation); [ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group](#node-arithmeticktheory-n-1-s-integers-localisation-of-torsion-class-group); `mathlib:IsIntegralClosure`; `mathlib:IsIntegralClosure.finite`; `mathlib:IsIntegralClosure.isLocalization`; `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`; `mathlib:Module.Flat.projective_of_finitePresentation`; `mathlib:NumberField.RingOfIntegers`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.3 (PDF p. 418; book p. 410). The hypothesis the transfers of N.1 and N.2 need; this lemma supplies it for rings of S-integers.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), I.3, Dedekind domains (PDF p. 29; book p. 21). The projectivity step.

<a id="node-arithmeticktheory-n-1-transfer-and-norm-on-units"></a>

### Transfer and pullback on K₁ of S-integers are the norm and the inclusion of units

**Comparison · `ArithmeticKTheory:N.1/transfer-and-norm-on-units`.** In the setting of N.1/norms-transfers-and-pullbacks (F′/F of degree d, S finite, S′ over S), under K₁ = units (KTheoryLowDegrees U.4) the pullback i^* : K₁(O_{F,S}) → K₁(O_{F′,S′}) is the inclusion O_{F,S}^× ⊂ O_{F′,S′}^×, and the transfer i_* is the field norm N_{F′/F} (Mathlib's Algebra.norm) restricted to S′-units, which takes values in O_{F,S}^×. Hence i_*i^*(u) = u^d, which is multiplication by [O_{F′,S′}] ∈ K₀(O_{F,S}) acting on K₁ (the Steinitz class acts trivially on units).

**Hypotheses and conventions.**

1. U.5 owns the transfer by restriction of scalars and its agreement with the field norm on a field's unit group; U.4 owns K₁(O_{F,S}) = O_{F,S}^× and its injection into K₁(F).
2. S finite; S′ the primes over S.

**Construction or proof.**

1. Pullback: base change of an automorphism of O_{F,S} is its extension; on units the inclusion.
2. Transfer: restriction of scalars commutes with inverting the non-zero elements of O_{F,S} (O_{F′,S′} ⊗ F = F′), so i_* is compatible with the transfer K₁(F′) → K₁(F) through the injections K₁(O_{F,S}) ↪ K₁(F) and K₁(O_{F′,S′}) ↪ K₁(F′) (U.4); on F′^× the transfer is N_{F′/F} (U.5).
3. N_{F′/F} maps S′-units to S-units: v(N x) = Σ_{w|v} f_w·w(x) = 0 for v ∉ S.
4. i_*i^*(u) = N_{F′/F}(u) = u^d for u ∈ F^×.

**Acceptance checks.**

1. F = ℚ, F′ = ℚ(i), S = {2}: i_*(1 + i) = N(1 + i) = 2 ∈ ℤ[1/2]^×, and i_*i^*(2) = N(2) = 4 = 2².
2. S = ∅: i_*(i) = N(i) = 1 and i_*i^*(−1) = (−1)² = 1 for ℚ(i)/ℚ.
3. The composite is u ↦ u^d on K₁ even when the Steinitz class is non-trivial, unlike on K₀.

**Prerequisites.** [ArithmeticKTheory:N.1/S-integers-in-a-finite-extension](#node-arithmeticktheory-n-1-s-integers-in-a-finite-extension); `KTheoryLowDegrees:U.4`; `KTheoryLowDegrees:U.5`; `mathlib:Algebra.norm`; `mathlib:Set.unitEquivUnitsInteger`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. II.2.2(b) (PDF p. 86; book p. 78). The composite is multiplication by [A]; in degree one [A] acts through its rank.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.3 (PDF p. 418; book p. 410). The transfer along O_{F,S} ⊂ O_{F′,S′}.

<a id="layer-n-2"></a>

## N.2. Dedekind localisation and classical rows

Finite support makes the residue sum meaningful. Specialise general localisation, identify the classical rows and derive the S-unit/class-group sequence. Even injectivity uses finite-field K-theory; the odd isomorphism waits for N.5.

<a id="node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain"></a>

### The localisation sequence for a Dedekind domain

**Theorem · `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`.** Let R be a Dedekind domain with fraction field F. There is a long exact sequence of K_*(R)-modules (6.6) ⋯ → K_{n+1}(F) →∂ ⊕_𝔭 K_n(R/𝔭) →⊕(i_𝔭)_* K_n(R) → K_n(F) →∂ ⊕_𝔭 K_{n−1}(R/𝔭) → ⋯ → K₀(R) → K₀(F) → 0, the sums over the nonzero primes 𝔭, (i_𝔭)_* the transfer along R → R/𝔭 and ∂ the boundary of N.2/finite-support, with values in the direct sum. For R = O_{F,S} = S.integer F with F a number field, the nonzero primes of O_{F,S} are the 𝔭·O_{F,S} with 𝔭 ∉ S (Tau Ceti's integerHeightOneSpectrumEquiv) and O_{F,S}/𝔭O_{F,S} = 𝓞_F/𝔭 = k(𝔭), so the sums run over 𝔭 ∉ S: this is the sequence displayed in the stage text.

**Hypotheses and conventions.**

1. R is a Dedekind domain; R, R[1/s], F and the R/𝔭 are regular in the sense needed by the resolution theorem: every finitely generated module has a projective resolution of length at most one.
2. The sequence is obtained from K.3's localisation theorem for the Serre subcategories M_s(R) and a filtered colimit over s (N.2/finite-support), not from a localisation theorem for arbitrary exact subcategories.
3. K-groups are those of GeneralAlgebraicKTheory K.1 (π_{n+1} of the Q-construction).

**Construction or proof.**

1. Import S.3 regular-scheme localization and dévissage for Spec(O_{F,S}), its generic point and its closed residue fields. The following arithmetic steps specialize that theorem: they do not reconstruct generic scheme localization.
2. Regularity: a submodule of a finitely generated free R-module is finitely generated and torsion-free, hence flat (Mathlib's IsDedekindDomain.flat_iff_torsion_eq_bot) and finitely presented, hence projective (Module.Flat.projective_of_finitePresentation); so every finitely generated module over R, R[1/s] or a field has projective dimension ≤ 1, and K = G by K.3's resolution theorem.
3. For each s ≠ 0 take the sequence of R → R[1/s] with fibre ⊕_{𝔭 ∋ s} K_n(R/𝔭) (N.2/finite-support).
4. Pass to the filtered colimit over s (K.7, filtered colimits for rings; a filtered colimit of exact sequences is exact), obtaining (6.6).
5. The maps: (i_𝔭)_* is restriction of scalars along R → R/𝔭 (V.3.3.2), defined because R/𝔭 has projective dimension ≤ 1 over R; the K_*(R)-module structure comes from the action of P(R) on M(R) and its compatibility with localisation boundaries (V.6.1.1; K.7).
6. S-integers: by N.1/S-integers-localisation-of-torsion-class-group, O_{F,S} = M_S⁻¹𝓞_F, and for 𝔭 ∉ S the images of M_S in the field 𝓞_F/𝔭 are units, so O_{F,S}/𝔭O_{F,S} = 𝓞_F/𝔭; the primes correspond by Tau Ceti's integerHeightOneSpectrumEquiv.

**Acceptance checks.**

1. R = ℤ, degrees ≤ 1: ⊕_p 𝔽_p^× → K₁(ℤ) = {±1} → ℚ^× → ⊕_p ℤ → K₀(ℤ) = ℤ → K₀(ℚ) = ℤ → 0, the first map zero (SK₁(ℤ) = 1 and {±1} ↪ ℚ^×), ℚ^× → ⊕_p ℤ the valuations with kernel {±1}, and ℤ → ℤ the identity.
2. For R = O_{F,S} the sums run over 𝔭 ∉ S; the primes of S do not appear.
3. It is a sequence of K_*(R)-modules: ∂(x·y) = ∂(x)·ȳ for y ∈ K_*(R), with the side fixed as in K2SymbolsBrauer T.3/localization-boundary.
4. K₀(R) → K₀(F) = ℤ is the rank; its kernel is Pic(R), so the sequence does not make K₀(R) → K₀(F) injective (N.2/even-degree-injectivity).

**Prerequisites.** [ArithmeticKTheory:N.2/finite-support](#node-arithmeticktheory-n-2-finite-support); `GeneralAlgebraicKTheory:K.3`; `GeneralAlgebraicKTheory:K.7`; `GeneralAlgebraicKTheory:K.1`; [ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group](#node-arithmeticktheory-n-1-s-integers-localisation-of-torsion-class-group); `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`; `mathlib:Module.Flat.projective_of_finitePresentation`; `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv`; `mathlib:IsDedekindDomain.HeightOneSpectrum`; `SchemeKTheoryOperations:S.3`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6, Dedekind Domains (PDF p. 417; book p. 409). The sequence (6.6) for a Dedekind domain. 'R and F and regular' is the source's misprint for 'are regular' (sourceIssues).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6 (PDF p. 417; book p. 409). The primes and the transfer maps.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1 (PDF p. 414; book p. 406). The Serre subcategory and quotient to which the localisation theorem is applied.

<a id="node-arithmeticktheory-n-2-finite-support"></a>

### Finite support: the boundary lands in the direct sum

**Lemma · `ArithmeticKTheory:N.2/finite-support`.** Let R be a Dedekind domain with fraction field F. For 0 ≠ s ∈ R, the localisation sequence of R → R[1/s] (GeneralAlgebraicKTheory K.3, for the Serre subcategory M_s(R) of finitely generated modules killed by a power of s, with quotient M(R[1/s])) has fibre term K_n(M_s(R)) ≅ ⊕_{𝔭 ∋ s} K_n(R/𝔭), a finite sum, by dévissage; for s | s′ the sequences are compatible, the map of fibre terms being the inclusion of summands. Since K_{n+1}(F) = colim_s K_{n+1}(R[1/s]), every x ∈ K_{n+1}(F) comes from K_{n+1}(R[1/s]) for some s, and its boundary lies in ⊕_{𝔭 ∋ s} K_n(R/𝔭): the boundary ∂ : K_{n+1}(F) → ⊕_𝔭 K_n(R/𝔭) is defined into the direct sum, each class having non-zero components at only finitely many primes. In degree one ∂[f] = (ord_𝔭 f)_𝔭 (V.6.1.2).

**Hypotheses and conventions.**

1. R is a Dedekind domain with fraction field F; the colimit is over s ∈ R ∖ {0} ordered by divisibility.
2. Finite support is a property of each class, not a uniform bound on the group.
3. The colimit is taken over rings (K.7: 'filtered-colimit compatibility for rings'); no colimit of exact categories is needed, because each M_s(R) has a finite semisimple dévissage.

**Construction or proof.**

1. For s ≠ 0, M_s(R) is a Serre subcategory of M(R) with quotient M(R[1/s]) (V.6.1), so K.3's localisation theorem gives the sequence of R → R[1/s].
2. Every object of M_s(R) has finite length; its simple objects are the R/𝔭 with s ∈ 𝔭, finitely many; dévissage (K.3) and the finite-product compatibility (K.7) give K(M_s(R)) ≃ ⊕_{𝔭 ∋ s} K(R/𝔭) (V.4.3, V.4.4).
3. For s | s′ the inclusions M_s(R) ⊂ M_{s′}(R) and R[1/s] → R[1/s′] give a map of sequences, which on fibre terms is the inclusion of summands.
4. F is the filtered colimit of the R[1/s], so K_{n+1}(F) = colim_s K_{n+1}(R[1/s]) (K.7); the boundaries ∂_s assemble into ∂ with values in colim_s ⊕_{𝔭 ∋ s} K_n(R/𝔭) = ⊕_𝔭 K_n(R/𝔭).
5. Degree one: ∂[s] = [R/sR] (V.6.1.2), which by dévissage is Σ_𝔭 ord_𝔭(s)·[R/𝔭]; its finite support is Tau Ceti's IsDedekindDomain.HeightOneSpectrum.finite_setOfPred_valuation_ne_one.

**Acceptance checks.**

1. R = ℤ, x = [12] ∈ K₁(ℚ) = ℚ^×: ∂x = 2·[𝔽₂] + 1·[𝔽₃], supported on {2, 3}.
2. A class coming from K_{n+1}(R[1/s]) has boundary supported on the primes containing s.
3. The target is the direct sum: the next map ⊕_𝔭 K_n(R/𝔭) → K_n(R) is only defined on finitely supported families, so a formalisation with the product would not have the sequence.

**Prerequisites.** `GeneralAlgebraicKTheory:K.3`; `GeneralAlgebraicKTheory:K.7`; `mathlib:IsDedekindDomain.HeightOneSpectrum`; `tauceti:IsDedekindDomain.HeightOneSpectrum.finite_setOfPred_valuation_ne_one`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.4.4, Application 4.4 (PDF p. 409; book p. 401). The torsion category is the filtered colimit of the categories supported at one element s.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.4.3, Application 4.3 (PDF p. 409; book p. 401). Dévissage to semisimple objects applies to finitely generated torsion modules over a Dedekind domain, giving the finite direct sum.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1.2 (PDF p. 414; book p. 406). The degree-one boundary is the divisor.

<a id="node-arithmeticktheory-n-2-the-three-classical-rows"></a>

### The low-degree end of the localisation sequence: divisors, Picard group and tame symbols

**Comparison · `ArithmeticKTheory:N.2/the-three-classical-rows`.** For a Dedekind domain R with fraction field F, the end of (6.6) is identified with the classical sequences. (a) Degrees one and zero: with K₁(R) = R^× ⊕ SK₁(R) and K₁(F) = F^× (determinant, KTheoryLowDegrees U.3), K₀(R/𝔭) = ℤ·[R/𝔭], K₀(R) ≅ ℤ ⊕ Pic(R) and K₀(F) = ℤ (Z.4), the boundary K₁(F) → ⊕_𝔭 ℤ is the divisor f ↦ (ord_𝔭 f)_𝔭, and ⊕_𝔭 ℤ → K₀(R) sends e_𝔭 to [R/𝔭] = [R] − [𝔭], which is (0, [𝔭]⁻¹); restricting K₁(R) to R^× (SK₁(R) is the kernel of K₁(R) → K₁(F)) this is the exact sequence 1 → R^× → F^× →div ⊕_𝔭 ℤ → K₀(R) → ℤ → 0 of I.3.6, and in particular the ideal-class-group sequence F^× → ⊕_𝔭 ℤ → Pic(R) → 0, whose class map is e_𝔭 ↦ [𝔭]⁻¹. (b) Degrees two and one, for R = O_{F,S} with F a number field and S finite: the segment ⊕_{𝔭∉S} K₂(k(𝔭)) → K₂(O_{F,S}) → K₂(F) →∂ ⊕_{𝔭∉S} k(𝔭)^× → SK₁(O_{F,S}) → 1 of (6.6) is the tame-kernel sequence 0 → K₂(O_{F,S}) → K₂(F) → ⊕_{𝔭∉S} k(𝔭)^× → 0, which N.2 imports from K2SymbolsBrauer T.5 with its injectivity and its surjectivity (T.5/tame-kernel-sequence for S = ∅, T.5/s-integer-tame-kernel-sequence for finite S) and does not re-prove: in degrees at most two (6.6) is the Dedekind localisation sequence of K2SymbolsBrauer T.3/dedekind-localization-boundary (the same instance of GeneralAlgebraicKTheory K.3's theorem), whose boundary is the residue sum of the tame symbols with the sign fixed in T.3/localization-boundary, and T.5 states its third map that way. The relative sequence 0 → K₂(𝓞_F) → K₂(O_{F,S}) → ⊕_{𝔭∈S} k(𝔭)^× → 0, with residues at the primes in S, is T.5/relative-s-integer-sequence. Consequently ⊕_{𝔭∉S} K₂(k(𝔭)) → K₂(O_{F,S}) is zero and ∂ is onto in (6.6). For a general Dedekind domain only the exactness of this segment is claimed here.

**Hypotheses and conventions.**

1. R is a Dedekind domain with fraction field F; in (b), R = O_{F,S} with F a number field and S a finite set of finite places, which is the generality of T.5's sequence.
2. The degree-two row is K2SymbolsBrauer T.5's (RT-AREA-ktheory-1/9): T.5 derives it from the comparison of tame residues with the localisation boundary (K2SymbolsBrauer T.3/dedekind-localization-boundary and T.3/localization-boundary, built on GeneralAlgebraicKTheory K.3) and from SK₁(O_{F,S}) = 0 (KTheoryLowDegrees U.4), not from N.2 (RT-AREA-ktheory-1/26). The import is acyclic because T.5's nodes do not list ArithmeticKTheory:N.2 as a prerequisite (checked against the K2SymbolsBrauer packet revised for the same findings).
3. The sign in (a) is a convention the node fixes: with ∂ = div, the map to Pic is e_𝔭 ↦ [𝔭]⁻¹.

**Construction or proof.**

1. Identify K₁ of R, F and the residue fields by the determinant (U.3), and K₀(R) by rank and determinant (Z.4).
2. ∂ on K₁(F): ∂[s] = [R/sR] for 0 ≠ s ∈ R (V.6.1.2), which by dévissage is Σ ord_𝔭(s)[R/𝔭]; extend multiplicatively to F^× (U.5 records the valuation convention for the boundary of a discrete valuation field).
3. The class of R/𝔭 in K₀(R) is [R] − [𝔭] by 0 → 𝔭 → R → R/𝔭 → 0; its determinant is [𝔭]⁻¹.
4. Extract (a) using R^× ↪ F^×; compare with I.3.6.
5. (b): import T.5/tame-kernel-sequence and T.5/s-integer-tame-kernel-sequence; match the maps with the segment of (6.6) for O_{F,S} (N.2/localisation-sequence-for-a-dedekind-domain), which in degrees at most two is the sequence of T.3/dedekind-localization-boundary; exactness of T.5's sequence then says that ⊕_{𝔭∉S} K₂(k(𝔭)) → K₂(O_{F,S}) is zero and that ∂ is onto.
6. Specialise (a) to O_{F,S} by N.2/localisation-sequence-for-a-dedekind-domain.

**Acceptance checks.**

1. R = ℤ: (a) reads 1 → {±1} → ℚ^× → ⊕_p ℤ → ℤ → ℤ → 0, with Pic(ℤ) = 0.
2. R = 𝓞 of ℚ(√−5): e_{𝔭₂} ↦ (0, [𝔭₂]⁻¹) = (0, [𝔭₂]), the non-trivial class (Tau Ceti's classNumber_eq_two_of_minpoly_eq_X_sq_add_five), so ⊕_𝔭 ℤ → K₀(R) is not zero.
3. Sign: a formalisation with class map e_𝔭 ↦ [𝔭] must also replace div by −div.
4. For F = ℚ, (b) is T.5's 1 → K₂(ℤ) → K₂(ℚ) → ⊕_p 𝔽_p^× → 1 (Application III.6.5.1), imported, not proved again: the degree-two segment of (6.6) for ℤ agrees with it.

**Prerequisites.** [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); `KTheoryLowDegrees:Z.4/rank-pic-equivalence`; `KTheoryLowDegrees:U.3`; `KTheoryLowDegrees:U.5`; `GeneralAlgebraicKTheory:K.1`; `K2SymbolsBrauer:T.5/tame-kernel-sequence`; `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`; `K2SymbolsBrauer:T.3/dedekind-localization-boundary`; `K2SymbolsBrauer:T.3/localization-boundary`; `mathlib:ClassGroup.equivPic`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6 (PDF p. 417; book p. 409). The identification (a) of the end of (6.6).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.1 (PDF p. 417; book p. 409). The segment (6.6.1) of (b), whose identification with the tame symbol and whose exactness (the tame-kernel sequence) are imported from K2SymbolsBrauer T.3 and T.5.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1.2 (PDF p. 414; book p. 406). The degree-one boundary, ∂(s) = [R/sR].

<a id="node-arithmeticktheory-n-2-localisation-sequence-and-finite-extensions"></a>

### Compatibility of the localisation sequence with finite extensions

**Theorem · `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions`.** Let R ⊂ R′ be an inclusion of Dedekind domains with R′ finitely generated as an R-module, with fraction fields F ⊂ F′. Restriction of scalars M(R′) → M(R), M(F′) → M(F) and on torsion modules are compatible exact functors, so they give a morphism from the localisation sequence (6.6) of R′ to that of R: the transfers N_{R′/R} : K_n(R′) → K_n(R), N_{F′/F} : K_n(F′) → K_n(F) and, on residue terms, N̄ = ⊕ N_{𝔭′/𝔭} : ⊕_{𝔭′} K_{n−1}(R′/𝔭′) → ⊕_𝔭 K_{n−1}(R/𝔭), N_{𝔭′/𝔭} the transfer of the finite field extension R/𝔭 ⊂ R′/𝔭′ (𝔭 = 𝔭′ ∩ R), commute with all maps of the sequences, ∂ included. For O_{F,S} ⊂ O_{F′,S′} the hypothesis holds by N.1/S-integers-in-a-finite-extension.

**Hypotheses and conventions.**

1. R ⊂ R′ Dedekind with R′ finitely generated as an R-module; F′/F is then finite.
2. The source proves the transfer (covariant) compatibility (6.6.3)–(6.6.4); compatibility with base change along F → F′, where the residue terms acquire ramification indices, is not stated in the sections read (gap).

**Construction or proof.**

1. The exact functors M(R′) → M(R), M(F′) → M(F) and M_tors(R′) → M_tors(R) are compatible, giving the homotopy commutative diagram (6.6.3) of fibration sequences.
2. Take homotopy groups to get the morphism of long exact sequences (6.6.4).
3. On residue terms: R′/𝔭′ restricted to R is killed by 𝔭 and is a finite-dimensional R/𝔭-vector space; under dévissage the induced map K(R′/𝔭′) → K(R/𝔭) is the transfer of the residue field extension.

**Acceptance checks.**

1. Degree one, F′ = ℚ(i), F = ℚ, x = 1 + 2i: N x = 5; the only prime of ℤ[i] with ord ≠ 0 is (1 + 2i), over 5 with residue degree 1, and ord_5(N x) = 1 = f·ord_{(1+2i)}(x).
2. In degree one N̄ on ⊕ K₀ is multiplication by the residue degrees f(𝔭′|𝔭).
3. For R′ = R the morphism is the identity.

**Prerequisites.** [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); [ArithmeticKTheory:N.1/S-integers-in-a-finite-extension](#node-arithmeticktheory-n-1-s-integers-in-a-finite-extension); `GeneralAlgebraicKTheory:K.3`; `GeneralAlgebraicKTheory:K.1`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.3–6.6.4 (PDF p. 418; book p. 410). The morphism of localisation sequences induced by restriction of scalars.

**Open inputs.** Compatibility of the localisation sequence with base change along a finite extension. See the gap register.

<a id="node-arithmeticktheory-n-2-s-unit-and-class-group-sequence"></a>

### The S-unit valuation sequence and the class-group sequence from the localisation sequence

**Theorem · `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`.** Let F be a number field, S a finite set of nonzero primes of 𝓞_F and O_{F,S} = S.integer F. The flat map 𝓞_F → O_{F,S} induces a morphism from the localisation sequence (6.6) of 𝓞_F to that of O_{F,S}, the identity on K_*(F) and, on residue terms, the projection ⊕_𝔭 K_n(k(𝔭)) → ⊕_{𝔭∉S} K_n(k(𝔭)). Applied to N.2/the-three-classical-rows (a) for both rings, the snake lemma gives the exact sequence 1 → 𝓞_F^× → O_{F,S}^× →(ord_𝔭)_{𝔭∈S} ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) → Cl(O_{F,S}) → 0, whose last map is extension of ideal classes and whose middle map is e_𝔭 ↦ [𝔭]⁻¹: the S-unit valuation sequence and the ideal-class-group sequence, derived from the one construction. Exactness at O_{F,S}^× is Tau Ceti's Set.unitValuation_ker, exactness at Cl(𝓞_F) is IsDedekindDomain.ker_integer_extendedHom and surjectivity at the end is IsDedekindDomain.integer_extendedHom_surjective, all proved there without K-theory; exactness at ⊕_{𝔭∈S} ℤ is not pinned.

**Hypotheses and conventions.**

1. F a number field, S finite; the class group is Mathlib's ClassGroup, compared with Pic by ClassGroup.equivPic.
2. The sign of the middle map follows N.2/the-three-classical-rows; exactness does not depend on it.
3. Tau Ceti's Set.unitValuation records −ord_v, not ord_v; in its coordinates the pinned class map e_𝔭 ↦ [𝔭]⁻¹ reads f ↦ ∏_v [v]^{f(v)}, with no inverse.

**Construction or proof.**

1. Naturality: base change along the flat map 𝓞_F → O_{F,S} is exact and preserves torsion modules; k(𝔭) ⊗ O_{F,S} = k(𝔭) for 𝔭 ∉ S and 0 for 𝔭 ∈ S (𝔭·O_{F,S} = O_{F,S}, Tau Ceti's integer_map_asIdeal_eq_top).
2. In degrees ≤ 1 this is a map between the sequences 0 → F^×/R^× → ⊕ ℤ → Pic(R) → 0 for R = 𝓞_F and R = O_{F,S}, with vertical maps the quotient F^×/𝓞_F^× → F^×/O_{F,S}^× (kernel O_{F,S}^×/𝓞_F^×), the projection (kernel ⊕_{𝔭∈S} ℤ, onto) and extension of classes.
3. Snake lemma: 0 → O_{F,S}^×/𝓞_F^× → ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) → Cl(O_{F,S}) → 0, the connecting cokernel being 0 because the first vertical map is onto; add 1 → 𝓞_F^× → O_{F,S}^×.
4. Compare with the pinned classical pieces named in the statement.

**Acceptance checks.**

1. F = ℚ, S = {p}: 1 → {±1} → {±1} × p^ℤ → ℤ → 0 → 0 → 0, the valuation onto.
2. F = ℚ(√−5), S = {𝔭₂}: O_{F,S}^× = {±1} × 2^ℤ and ord_{𝔭₂}(2) = 2, so the image of the valuation is 2ℤ and the cokernel ℤ/2 ≅ Cl(𝓞) maps to Cl(O_{F,S}) = 1: the middle exactness is where the class group enters.
3. The composite ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) → Cl(O_{F,S}) is trivial.

**Prerequisites.** [ArithmeticKTheory:N.2/the-three-classical-rows](#node-arithmeticktheory-n-2-the-three-classical-rows); [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); `tauceti:Set.unitValuation_ker`; `tauceti:IsDedekindDomain.ker_integer_extendedHom`; `tauceti:IsDedekindDomain.integer_extendedHom_surjective`; `tauceti:IsDedekindDomain.integer_map_asIdeal_eq_top`; `mathlib:ClassGroup.extendedHom`; `mathlib:ClassGroup.equivPic`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. I.3.8(a) (PDF p. 37; book p. 29). The classical sequence for a localisation R_S = S⁻¹R, here with R = 𝓞_F and R_S = O_{F,S}.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6 (PDF p. 417; book p. 409). The end of (6.6) whose naturality is used.

<a id="node-arithmeticktheory-n-2-even-degree-injectivity"></a>

### Injectivity into the field in even degrees, and why exactness alone does not give it

**Theorem · `ArithmeticKTheory:N.2/even-degree-injectivity`.** Let R be a Dedekind domain with fraction field F all of whose residue fields are finite (for instance R = O_{F,S}). Then K_n(R) → K_n(F) is injective for every even n ≥ 4, and for n = 2 when R = O_{F,S}. By exactness of (6.6) its kernel is the image of ⊕_𝔭 K_n(R/𝔭), and for n ≥ 4 this vanishes here only because K_n(𝔽_q) = 0 for even n ≥ 2 (Quillen; KTheoryFiniteLocalFields L.1). In degree two the injectivity is the left half of K2SymbolsBrauer T.5's tame-kernel sequence, imported through N.2/the-three-classical-rows (b) and not proved again. In the other degrees the kernel is not zero for formal reasons: in degree zero it is Pic(R); in degree one it is SK₁(R), which vanishes for O_{F,S} by the Bass–Milnor–Serre theorem (KTheoryLowDegrees U.4); in odd degrees n ≥ 3 its vanishing is Soulé's theorem (N.5/soule-theorem), whose proof uses finite generation.

**Hypotheses and conventions.**

1. All residue fields R/𝔭 are finite.
2. Degree two is imported from K2SymbolsBrauer T.5 (RT-AREA-ktheory-1/9), which proves it for rings of S-integers of number fields from K₂(𝔽_q) = 0; the argument for n ≥ 4 is the same shape, with Quillen's K_{2j}(𝔽_q) = 0.
3. This is the injectivity N.2 can prove from its own inputs; the odd-degree isomorphism needs N.3:finite-generation, which the atlas places after N.2.

**Construction or proof.**

1. Exactness of (6.6) at K_n(R): ker(K_n(R) → K_n(F)) = image of ⊕_𝔭 K_n(R/𝔭).
2. K_n(𝔽_q) = 0 for even n ≥ 2 (L.1); hence the kernel is zero for even n ≥ 4.
3. n = 2, R = O_{F,S}: the injectivity in T.5/tame-kernel-sequence (S = ∅) and T.5/s-integer-tame-kernel-sequence, matched with (6.6) by N.2/the-three-classical-rows (b).

**Acceptance checks.**

1. n = 2, R = ℤ: K₂(ℤ) → K₂(ℚ) is injective, as in Application III.6.5.1 (T.5's sequence, imported).
2. n = 4, R = ℤ[1/p]: K₄(ℤ[1/p]) → K₄(ℚ) is injective, since K₄(𝔽_ℓ) = 0 for every prime ℓ ≠ p.
3. Degree zero: for R = 𝓞 of ℚ(√−5), ker(K₀(R) → K₀(F)) = Pic(R) ≅ ℤ/2, containing [R/𝔭₂] = [R] − [𝔭₂].
4. Degree one without the arithmetic input fails: for the Dedekind domain ℝ[x, y]/(x² + y² − 1) (infinite residue fields), SK₁ ≠ 0 (Example III.1.5.4), so K₁(R) → K₁(F) is not injective.
5. No statement of injectivity in odd degrees follows from this node.

**Prerequisites.** [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); [ArithmeticKTheory:N.2/the-three-classical-rows](#node-arithmeticktheory-n-2-the-three-classical-rows); `K2SymbolsBrauer:T.5/tame-kernel-sequence`; `KTheoryFiniteLocalFields:L.1`; `KTheoryLowDegrees:U.4`; `KTheoryLowDegrees:Z.4/rank-pic-equivalence`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, proof (PDF p. 420; book p. 412). The source's even-degree step, which uses only K_*(𝔽_q); the finite generation it cites is needed for the odd degrees only.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6 (PDF p. 417; book p. 409). The case n = 2, which the source derives from K₂(R/𝔭) = 0; here it is imported from K2SymbolsBrauer T.5.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.1.5.4 (PDF p. 193; book p. 185). The degree-one non-example.

<a id="layer-n-3"></a>

## N.3. Finite generation and ranks

The integral finite-generation argument and Borel’s rational rank argument are separate inputs. They combine to give a free part and finite torsion, without determining the torsion or extension data.

<a id="node-arithmeticktheory-n-3-finiteness-and-ranks-combined"></a>

### Finite generation and the ranks together

**Theorem · `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`.** For a number field F, a finite set S of finite primes and n ≥ 2, K_n(𝓞_{F,S}) is a finitely generated abelian group of rank ρ(n), where ρ(n) = r_1 + r_2, r_2 or 0 according as n ≡ 1 (mod 4), n ≡ 3 (mod 4) or n is even. Hence K_n(𝓞_{F,S}) ≅ Z^{ρ(n)} ⊕ T_n with T_n = K_n(𝓞_{F,S})_tors finite; in particular every positive even K-group of 𝓞_{F,S} is finite, and every odd one in degree at least three is Z^{ρ(n)} plus a finite group. The torsion subgroup T_n is canonical; a complement to it is not.

**Hypotheses and conventions.**

1. F a number field, S a finite set of finite primes, n ≥ 2.
2. Degrees zero and one are K_0 = Z ⊕ Pic(𝓞_{F,S}) and K_1 = 𝓞_{F,S}^× ≅ µ(F) ⊕ Z^{r_1+r_2+|S|−1} (N.1, from KTheoryLowDegrees Z.4 and U.4's Dirichlet S-unit theorem) and are not covered by ρ.
3. The decomposition is the structure theorem for finitely generated abelian groups and is not natural.

**Construction or proof.**

1. K_n(𝓞_{F,S}) is finitely generated (N.3:finite-generation/finite-generation-of-K-of-S-integers) of rank ρ(n) (N.3:ranks/borel-rank-theorem).
2. Apply Mathlib's structure theorem (AddCommGroup.equiv_free_prod_directSum_zmod) to obtain Z^{ρ(n)} ⊕ T_n with T_n finite; for n even ρ(n) = 0 and the group is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite).
3. Record that only T_n is canonical: no later statement may depend on a chosen splitting.

**Acceptance checks.**

1. K_2(Z), K_4(Z) and K_6(Z) are finite; K_3(Z) is finite (ρ(3) = r_2 = 0) and K_5(Z) has rank 1.
2. For n even T_n is all of K_n(𝓞_{F,S}), while K_n(F) is infinite (N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion).
3. The rank does not determine T_n or the extension data; N.4 to N.6 compute them (for instance K_n(F) ≅ Z^{r_2} ⊕ Z/2w_i(F) ⊕ (Z/2)^{r_1−1} for n ≡ 3 (mod 8) and r_1 > 0, Theorem VI.9.5).

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers](#node-arithmeticktheory-n-3-finite-generation-finite-generation-of-k-of-s-integers); [ArithmeticKTheory:N.3:ranks/borel-rank-theorem](#node-arithmeticktheory-n-3-ranks-borel-rank-theorem); [ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite](#node-arithmeticktheory-n-3-ranks-even-k-groups-of-s-integers-are-finite); `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1, Classical Data 8.1 (PDF p. 521; book p. 513). The combined statement, verbatim, with a misprint: 'the groups K_n(F) are finite when n is even and nonzero' must read K_n(O_S) (K_2(Q) is infinite); see source issue. The odd half is right for F by Soulé's theorem and is stated here for O_S.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.18, last sentence (PDF p. 279; book p. 271). The torsion of the even groups of an order, which with finite generation gives their finiteness.

<a id="layer-n-3-finite-generation"></a>

## N.3:finite-generation. Quillen’s rank filtration

Use cellular inclusions in the Q-construction, suspended buildings and the rank spectral sequence. Arithmetic-group Steinberg homology is supplied by R.1, with its orientation twist; function-field applications retain their distinct source input.

<a id="node-arithmeticktheory-n-3-finite-generation-finite-generation-of-k-of-s-integers"></a>

### Finite generation of the K-groups of rings of S-integers

**Theorem · `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`.** Let F be a number field and S a finite set of finite primes of 𝓞_F. Then K_n(𝓞_{F,S}) is a finitely generated abelian group for every n ≥ 0 (the stage asks for n ≥ 1; degree zero holds as well). It is deduced from Quillen's theorem for 𝓞_F through the localisation sequence of 𝓞_F ⊂ 𝓞_{F,S} = 𝓞_F[1/s], whose residue terms are the K-groups of the finitely many residue fields k(𝔭), 𝔭 ∈ S; these are finite in positive degrees and Z in degree zero by Quillen's finite-field calculation.

**Hypotheses and conventions.**

1. F is a number field and S a finite set of finite primes; 𝓞_{F,S} = 𝓞_F[1/s] for an s ∈ 𝓞_F whose prime divisors are exactly the primes of S (N.1/S-integers-as-a-localisation, which uses the finiteness of the class group).
2. S finite is used: for infinite S the residue term ⊕_{𝔭∈S} K_0(k(𝔭)) is free of infinite rank, and inverting every prime gives K_1 = F^×, which is not finitely generated.
3. The source's Theorem IV.6.9 does not cover 𝓞_{F,S} directly when S ≠ ∅ (it is not finite over Z); the passage is the stage's own route: 'Obtain finite generation for S-integers using localisation and the finite-field calculation'.
4. Finite generation is integral: K_n(𝓞_{F,S}) is a finitely generated abelian group, not merely of finite rank.

**Construction or proof.**

1. Write 𝓞_{F,S} = 𝓞_F[1/s] (N.1/S-integers-as-a-localisation).
2. Apply the localisation sequence for the multiplicative set {s^n} (K-book V.6.1, (6.1.1)): … → G_n(𝓞_F/s) → K_n(𝓞_F) → K_n(𝓞_{F,S}) → G_{n−1}(𝓞_F/s) → …, where G = K for the regular rings 𝓞_F and 𝓞_{F,S} and, by dévissage, G_*(𝓞_F/s) ≅ ⊕_{𝔭∈S} K_*(k(𝔭)). This is the Dedekind-domain localisation of N.2/localisation-sequence-for-a-dedekind-domain for 𝓞_F → 𝓞_{F,S} instead of 𝓞_{F,S} → F; the general theorem (localisation, dévissage, resolution) is GeneralAlgebraicKTheory K.3's.
3. By Quillen's finite-field calculation (KTheoryFiniteLocalFields L.1; K-book IV.1.13) K_m(k(𝔭)) is finite for m ≥ 1 and is Z for m = 0; S being finite, ⊕_{𝔭∈S} K_{n−1}(k(𝔭)) is finitely generated.
4. K_n(𝓞_F) is finitely generated (quillen-finite-generation-theorem). In the exact segment K_n(𝓞_F) → K_n(𝓞_{F,S}) → ⊕_{𝔭∈S} K_{n−1}(k(𝔭)) the middle group is an extension of a subgroup of a finitely generated group by a quotient of a finitely generated group, hence finitely generated.
5. Cross-check degrees zero and one with the pinned libraries: Pic(𝓞_{F,S}) is finite (tauceti:IsDedekindDomain.finite_integer_classGroup, with Mathlib's finiteness of Cl(𝓞_F) as its hypothesis) and the S-unit group is finitely generated (tauceti:Set.unit_fg_of_units, with Mathlib's finite generation of (𝓞 F)ˣ as its hypothesis); with K_0 = Z ⊕ Pic and K_1 = units (N.1) these are the classical cases.

**Acceptance checks.**

1. K_n(𝓞_{F,S}) is finitely generated for every n ≥ 0 and every finite S.
2. For Z[1/p] the sequence K_n(Z) → K_n(Z[1/p]) → K_{n−1}(F_p) exhibits K_n(Z[1/p]) as finitely generated; in degree one it reads Z/2 = K_1(Z) ↪ K_1(Z[1/p]) = {±1} × p^Z → K_0(F_p) = Z, the p-adic valuation.
3. For infinite S the conclusion fails already in degree one (the units of the ring obtained by inverting every prime are F^×, N.1).
4. The K-groups of the FIELD are not finitely generated in positive even degrees: N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion.

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem](#node-arithmeticktheory-n-3-finite-generation-quillen-finite-generation-theorem); [ArithmeticKTheory:N.1/S-integers-as-a-localisation](#node-arithmeticktheory-n-1-s-integers-as-a-localisation); [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); `GeneralAlgebraicKTheory:K.3`; `KTheoryFiniteLocalFields:L.1`; `tauceti:IsDedekindDomain.finite_integer_classGroup`; `tauceti:Set.unit_fg_of_units`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.9 (PDF p. 333; book p. 325). Quillen's theorem, verbatim; with 'finite over Z' it covers 𝓞_F, and this node derives the S-integer case from it.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1, Application 6.1 and (6.1.1) (PDF p. 414; book p. 406). The localisation sequence for R → R[1/s] (cross-reference tags dropped, the elided sentence identifies G(R/sR) with the fibre), applied with R = 𝓞_F.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.13 (PDF p. 277; book p. 269). Quillen's finite-field calculation, which makes the residue terms finite in positive degrees.

<a id="node-arithmeticktheory-n-3-finite-generation-rank-filtration"></a>

### Quillen's rank filtration of the Q-construction of a Dedekind domain

**Construction · `ArithmeticKTheory:N.3:finite-generation/rank-filtration`.** Let A be a Dedekind domain with fraction field F, P(A) the exact category of finitely generated projective A-modules and Q = Q(P(A)) its Q-construction (GeneralAlgebraicKTheory K.1: a morphism M → N is an admissible subobject N₂ ↣ N with an admissible epimorphism N₂ ↠ M, i.e. an isomorphism of M with an admissible subquotient N₂/N₁ of N). For P ∈ P(A) put rank P = dim_F(P ⊗_A F). For m ≥ 0 let Q_m ⊂ Q be the full subcategory on the modules of rank ≤ m. Then: (a) a morphism M → N of Q has rank M ≤ rank N, with equality only when it is an isomorphism; hence, for m ≥ 1, Q_{m−1} ⊂ Q_m is fully faithful and Q_m has no morphism from an object of rank m to an object of Q_{m−1} (the inclusion is cellular in the sense of Kahn, Definition 2.3.2); (b) for m ≥ 1 the full subcategory Q_m − Q_{m−1} of the objects of rank exactly m is a groupoid, equivalent to the disjoint union over the isomorphism classes [P] of rank-m projectives of the one-object groupoids Aut_A(P); (c) Q is the union of the Q_m, so the nerve of Q is the union of the nerves of the Q_m and H_*(BQ) = colim_m H_*(BQ_m); (d) every object of Q_0 is a zero module and there is exactly one morphism between any two, so Q_0 is equivalent to the terminal category and BQ_0 is contractible; (e) if Pic(A) is finite, each rank m ≥ 1 has exactly #Pic(A) isomorphism classes of projectives (Steinitz: P ≅ A^{m−1} ⊕ I, determined by rank and det P ∈ Pic(A)).

**Hypotheses and conventions.**

1. A is a Dedekind domain with fraction field F; P(A) carries its split exact structure (all short exact sequences of projectives), imported as GeneralAlgebraicKTheory K.2's P(R) = finiteProjectiveModules.
2. Rank is additive on short exact sequences of projectives and a finitely generated projective module of rank zero over a domain is zero; these two facts give (a).
3. The filtration is taken on P(A), not on all finitely generated modules: in Q(M(A)) the rank-zero objects are the torsion modules and Q_0 is not a point (see the non-example test).
4. Rank strata Q_m − Q_{m−1} and their cellular inclusions use m ≥ 1. Q_0 is equivalent to the terminal category; it is literally the one-object category only after choosing a skeleton with one zero object. Natural-number subtraction must not turn the m = 0 stratum into Q_0 − Q_0.

**Construction or proof.**

1. Define Q_m as the full subcategory of GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction on the objects of rank ≤ m.
2. (a) If M ≅ N₂/N₁ with N₁ ↣ N₂ ↣ N admissible, rank M = rank N₂ − rank N₁ ≤ rank N₂ ≤ rank N. Equality forces rank N₁ = 0 and rank N/N₂ = 0, so N₁ = 0 and N₂ = N (projectives of rank zero vanish), and the morphism is the image of an isomorphism M ≅ N of P(A), an isomorphism of Q (K.1: the isomorphisms of Q(A) are those of A).
3. Cellularity: Q_{m−1} ⊂ Q_m is full by definition, and a morphism from an object of rank m to one of rank < m would contradict (a).
4. (b) By (a) every morphism between objects of rank m is an isomorphism; choosing one object in each isomorphism class gives the equivalence with ⊔_{[P]} Aut_A(P).
5. (d) Every rank-zero projective over the domain A is a zero module; each admissible layer of a zero module is zero, giving a unique Q-morphism between any two such objects. Inclusion of a chosen zero object is therefore an equivalence from the terminal category to Q_0.
6. (d) A morphism 0 → 0 is an admissible subquotient of 0, so it is the identity.
7. (e) Steinitz's classification (KTheoryLowDegrees Z.4/steinitz and Z.4/projective-classification).

**Acceptance checks.**

1. A = ℤ: Q_m − Q_{m−1} is equivalent to the one-object groupoid of GL_m(ℤ).
2. A = 𝓞 of ℚ(√−5) (class number two): the rank-one stratum has two isomorphism classes, 𝓞 and 𝔭₂ = (2, 1 + √−5), each with automorphism group 𝓞^× = {±1}.
3. BQ_0 is a point, while π₁ BQ(P(ℤ)) = K₀(ℤ) = ℤ (GeneralAlgebraicKTheory K.1/pi1-BQ-equals-K0): the filtration is not constant from rank one on.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`; `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`; `KTheoryLowDegrees:Z.4/steinitz`; `KTheoryLowDegrees:Z.4/projective-classification`; `StableHomotopyKTheory:H.1`; `mathlib:ClassGroup`.

**Library API.**

- `QCat.rankFiltration` (data): For a Dedekind domain A and m : ℕ, the full subcategory Q_m of QCat (P(A)) on the modules of rank ≤ m.
- `QCat.rankFiltration_mono` (structure): m ≤ m' → Q_m ⊆ Q_{m'}.
- `QCat.rank_le_of_hom` (characterisation): For a morphism M ⟶ N of QCat (P(A)), rank M ≤ rank N, and if rank M = rank N the morphism is an isomorphism.
- `QCat.rankFiltration_cellular` (other): For m ≥ 1: The inclusion Q_{m−1} ⥤ Q_m is fully faithful and there is no morphism from an object of rank m to an object of Q_{m−1}.
- `QCat.rankStratum` (data): For m ≥ 1: Q_m − Q_{m−1}, the full subcategory on the objects of rank exactly m, as a groupoid.
- `QCat.rankStratumEquiv` (equivalence): For m ≥ 1: Q_m − Q_{m−1} is equivalent to the disjoint union, over the isomorphism classes [P] of rank-m projectives, of the one-object groupoids of Aut_A(P).
- `QCat.iSup_rankFiltration` (characterisation): Q = ⋃_m Q_m; the nerve of Q is the union of the nerves of the Q_m.
- `QCat.rankFiltration_zero` (simp): Q_0 is equivalent to the terminal category (and its classifying space is contractible); no equality of all rank-zero objects is required.
- `QCat.finite_rankStratum_classes` (other): If Pic(A) is finite, for m ≥ 1 the rank-m stratum has exactly Nat.card (ClassGroup A) isomorphism classes.

**Discriminating unit tests.**

- `rankFiltration_zero_isPoint` (degenerate): Q_0(P(A)) is equivalent to the terminal category for every Dedekind domain A, even when the chosen exact-category model contains distinct isomorphic zero objects.
- `rankStratum_int` (computation): For A = ℤ and m ≥ 1 the stratum Q_m − Q_{m−1} is equivalent to the one-object groupoid of GL_m(ℤ): one isomorphism class, ℤ^m.
- `rankStratum_one_sqrt_neg_five` (computation): For A = 𝓞 of ℚ(√−5) the rank-one stratum has two isomorphism classes (Pic(A) ≅ ℤ/2), each with automorphism group {±1}.
- `rankFiltration_allModules_not_cellular` (non-example): On Q(M(A)) for all finitely generated A-modules the rank-zero part contains every torsion module, e.g. A/𝔭, so it is not a point; the construction must be made on P(A) (equivalently on torsion-free modules, Kahn 4.2.7).
- `rank_le_of_hom_zero` (characterisation): For every P, the morphisms 0 → P of Q(P(A)) are the admissible subobjects of P (K.1's QCat.hom_zero), and rank 0 ≤ rank P.

**Consumers.**

- K-book IV.6.8–6.9 (PDF p. 333): 'Quillen used a filtration of the Q–construction' to prove finite generation
- Kahn, 'Around Quillen's theorem A', 4.1 and 2.4.1: the filtration by rank is a sequence of cellular functors, which gives the rank spectral sequence
- N.3:finite-generation/comma-category-is-the-layer-poset: the comma categories Q_{m−1} ↓ P of the cellular inclusions
- N.3:finite-generation/rank-spectral-sequence: the strata Q_m − Q_{m−1} give the E¹ terms
- N.3:finite-generation/quillen-finiteness-criterion: finitely many components per rank when Pic(A) is finite, and the exhaustion Q = ⋃ Q_m

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.8–6.9, the paragraph between Bass' Conjecture 6.8 and Theorem 6.9 (PDF p. 333; book p. 325). The filtration of the Q-construction that Quillen uses; the source does not give it.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.1 (arXiv:1108.2441v3, p. 15). The filtration by rank, and the property (a) that makes the inclusions cellular; Kahn states it for locally free sheaves on a scheme, of which P(A) is the affine case.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.1, after (4.1) is introduced (arXiv:1108.2441v3, p. 15). Property (b).

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 2.3.2, Definition (arXiv:1108.2441v3, p. 10). The notion of cellular functor used in (a).

<a id="node-arithmeticktheory-n-3-finite-generation-layer-poset"></a>

### The poset of proper layers of a vector space

**Definition · `ArithmeticKTheory:N.3:finite-generation/layer-poset`.** Let V be a finite-dimensional vector space over a field F. The poset J(V) of proper layers of V has as elements the pairs (W₀, W₁) of subspaces with W₀ ⊆ W₁ ⊆ V and (W₀, W₁) ≠ (0, V), ordered by (W₀, W₁) ≤ (W₀', W₁') if and only if W₀' ⊆ W₀ ⊆ W₁ ⊆ W₁' (a layer is below the layers that contain it as a subquotient). GL(V) acts on J(V) by order automorphisms, and a linear isomorphism V ≅ V' induces an isomorphism J(V) ≅ J(V'). The subposets J₀(V) = {W₀ ≠ 0} and J₁(V) = {W₁ ≠ V} cover J(V), no chain of J(V) meets both J(V) ∖ J₀(V) and J(V) ∖ J₁(V), and J₀(V) ∩ J₁(V) = {0 ≠ W₀ ⊆ W₁ ≠ V}. For dim V = 1, J(V) = {(0, 0), (V, V)} is two incomparable points; for V = 0 it is empty.

**Hypotheses and conventions.**

1. V is finite-dimensional over a field F; subspaces are Mathlib's Submodule F V.
2. The excluded pair (0, V) is the largest element of the full poset of layers; including it makes the poset contractible, which is why it is excluded.

**Construction or proof.**

1. Define J(V) as a subtype of Submodule F V × Submodule F V with the stated order; check reflexivity, transitivity and antisymmetry from those of ⊆.
2. The action of g ∈ GL(V) is (W₀, W₁) ↦ (gW₀, gW₁); functoriality in linear isomorphisms likewise.
3. Covering: (W₀, W₁) ∉ J₀ ∪ J₁ would mean W₀ = 0 and W₁ = V.
4. No chain meets both complements: (0, W₁) ≤ (W₀', V) forces W₀' = 0 and so (0, V); (W₀', V) ≤ (0, W₁) forces W₁ = V and so (0, V); both are excluded.
5. dim V = 1: the only subspaces are 0 and V.

**Acceptance checks.**

1. dim V = 1: J(V) has exactly the two incomparable elements (0, 0) and (V, V).
2. dim V = 2: the elements are (0, 0), (V, V), and for each line L the three layers (0, L), (L, L), (L, V), with (0, 0) ≤ (0, L) ≥ (L, L) ≤ (L, V) ≥ (V, V): one path from (0, 0) to (V, V) through each line, the suspension of the discrete set of lines.
3. Adding (0, V) back gives a poset with a largest element, hence contractible.

**Prerequisites.** `mathlib:Submodule`.

**Library API.**

- `LayerPoset` (data): For a finite-dimensional F-vector space V, the poset of pairs (W₀, W₁) of subspaces with W₀ ≤ W₁ and (W₀, W₁) ≠ (⊥, ⊤).
- `LayerPoset.le_iff` (characterisation): (W₀, W₁) ≤ (W₀', W₁') ↔ W₀' ≤ W₀ ∧ W₁ ≤ W₁'.
- `LayerPoset.map` (functoriality): A linear equivalence e : V ≃ₗ[F] V' induces an order isomorphism LayerPoset V ≃o LayerPoset V'; map_refl and map_trans hold.
- `LayerPoset.glAction` (instance): The action of GL(V) = (V ≃ₗ[F] V) on LayerPoset V by order automorphisms, (W₀, W₁) ↦ (gW₀, gW₁).
- `LayerPoset.lowerPart` (data): J₀(V), the subposet of layers with W₀ ≠ ⊥.
- `LayerPoset.upperPart` (data): J₁(V), the subposet of layers with W₁ ≠ ⊤.
- `LayerPoset.lowerPart_sup_upperPart` (relation): J₀(V) ∪ J₁(V) = J(V), and no chain of J(V) meets both complements.
- `LayerPoset.of_finrank_eq_one` (simp): If finrank F V = 1, LayerPoset V is the two-element antichain {(⊥, ⊥), (⊤, ⊤)}.

**Discriminating unit tests.**

- `layerPoset_zero` (degenerate): LayerPoset (0 : F-vector space) is empty: the only pair (⊥, ⊥) equals (⊥, ⊤).
- `layerPoset_dim_one` (computation): For finrank F V = 1, LayerPoset V has two elements and they are incomparable.
- `layerPoset_dim_two_card` (computation): For V = 𝔽₂², LayerPoset V has 2 + 3·3 = 11 elements (three lines, three layers through each).
- `layerPoset_with_top_contractible` (non-example): The poset of all layers, (⊥, ⊤) included, has a largest element, so its nerve is contractible; a definition that forgot to exclude (⊥, ⊤) would make every fibre of the rank filtration trivial.
- `layerPoset_map_gl` (compatibility): For g ∈ GL(V), LayerPoset.map g sends (W₀, W₁) to (W₀.map g, W₁.map g) (Mathlib's Submodule.map).

**Consumers.**

- Kahn, 'Around Quillen's theorem A', 4.2.6 and 4.3.1: the comma categories of the rank filtration are equivalent to the posets of proper layers
- N.3:finite-generation/comma-category-is-the-layer-poset: target of the equivalence Q_{n−1} ↓ P ≃ J(P ⊗ F)
- N.3:finite-generation/layer-poset-is-the-suspended-building: J(V) ≃ ΣT(V)

**Source.** [Sun.2016](https://arxiv.org/pdf/1604.04700), p. 5 (arXiv:1604.04700v1). The definition of J(V) with its order, verbatim (spacing of the text layer kept).

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.3.2 (arXiv:1108.2441v3, p. 17). The dimension-one case.

<a id="node-arithmeticktheory-n-3-finite-generation-comma-category-is-the-layer-poset"></a>

### The comma categories of the rank filtration are posets of layers

**Lemma · `ArithmeticKTheory:N.3:finite-generation/comma-category-is-the-layer-poset`.** Let A be a Dedekind domain with fraction field F, P a finitely generated projective A-module of rank n ≥ 1 and V = P ⊗_A F. The comma category Q_{n−1} ↓ P of the inclusion Q_{n−1} ⊂ Q(P(A)) (objects: morphisms M → P of Q with rank M ≤ n − 1) is equivalent, Aut_A(P)-equivariantly, to the poset J(V) of proper layers of V: a morphism M → P is an admissible layer P₁ ↣ P₂ ↣ P with P₂/P₁ ≅ M, it is sent to (P₁ ⊗ F, P₂ ⊗ F), and rank M ≤ n − 1 says exactly that (P₁ ⊗ F, P₂ ⊗ F) ≠ (0, V). The inverse sends a subspace W ⊆ V to the pure submodule W ∩ P, which is a direct summand of P.

**Hypotheses and conventions.**

1. A is a Dedekind domain; P ∈ P(A) has rank n ≥ 1; Aut_A(P) acts on V = P ⊗ F and on both sides.
2. The admissible monomorphisms of P(A) into P are the injections with projective cokernel, i.e. the pure submodules of P (a finitely generated torsion-free module over a Dedekind domain is projective).

**Construction or proof.**

1. A morphism M → P of Q is an admissible layer P₁ ⊆ P₂ ⊆ P with an isomorphism P₂/P₁ ≅ M (GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction); morphisms of the comma category are inclusions of layers, so Q_{n−1} ↓ P is equivalent to the poset of admissible layers with rank P₂/P₁ < n (Kahn 4.2.6, proof).
2. Pure submodules of P correspond to subspaces of V: W ↦ W ∩ P and N ↦ N ⊗ F are inverse (Kahn 4.2.4); P/(W ∩ P) embeds in V/W, so it is finitely generated and torsion-free, hence flat (mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot) and finitely presented, hence projective (mathlib:Module.Flat.projective_of_finitePresentation), and W ∩ P is a direct summand (Putman–Studenmund §4.1).
3. A layer has rank P₂/P₁ = n exactly when P₁ = 0 and P₂ = P, i.e. when its image is (0, V).
4. Equivariance: g ∈ Aut_A(P) acts on layers and on J(V) through g ⊗ F, and the bijection commutes with it.

**Acceptance checks.**

1. n = 1: Q_0 ↓ P has two objects, 0 ↣ P (the subobject 0) and P ↠ 0 (the quotient of P onto 0), matching J(V) = {(0, 0), (V, V)}.
2. A = ℤ, P = ℤ²: the lines of ℚ² correspond to the rank-one direct summands of ℤ², i.e. to primitive vectors up to sign.
3. A non-pure submodule such as 2ℤ ⊂ ℤ is not an admissible subobject of ℤ in P(ℤ): its cokernel ℤ/2 is not projective.

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/rank-filtration](#node-arithmeticktheory-n-3-finite-generation-rank-filtration); [ArithmeticKTheory:N.3:finite-generation/layer-poset](#node-arithmeticktheory-n-3-finite-generation-layer-poset); `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`; `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`; `mathlib:Module.Flat.projective_of_finitePresentation`.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.2.4, Proposition (arXiv:1108.2441v3, p. 16). Pure submodules of P ↔ subspaces of V (for X = Spec A); the text layer renders ↦ as '7→'.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.2.6, Corollary, with its proof (arXiv:1108.2441v3, p. 16). The equivalence of the comma category with the poset of proper layers.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.2.7, Example (arXiv:1108.2441v3, p. 17). For a Dedekind domain the torsion-free and the projective versions agree.

**Source.** [PutmanStudenmund.2021](https://arxiv.org/pdf/1909.01217v4), §4.1, 'Subspace stabilizers and projective modules' (arXiv:1909.01217v4, p. 17). W ∩ P is a direct summand, with the same one-line proof.

<a id="node-arithmeticktheory-n-3-finite-generation-layer-poset-is-the-suspended-building"></a>

### The layer poset is the suspension of the Tits building

**Lemma · `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`.** Let V be an F-vector space of dimension n ≥ 1 and T(V) its Tits building, the poset of proper non-zero subspaces (empty for n = 1), imported from BorelRegulators R.1. Then the nerve of J(V) is GL(V)-equivariantly homotopy equivalent to the unreduced suspension ΣT(V) (two points for n = 1). Consequently J(V) has the homotopy type of a wedge of (n − 1)-spheres, its reduced integral homology is concentrated in degree n − 1, and H̃_{n−1}(J(V); ℤ) ≅ St(V) := H̃_{n−2}(T(V); ℤ) as ℤ[GL(V)]-modules, with St(V) = ℤ (trivial action) for n = 1. For n = 2, T(V) is the discrete set of lines and St(V) is the kernel of the augmentation ℤ[lines] → ℤ, the reduced homology, not H₀(T(V)).

**Hypotheses and conventions.**

1. n = dim V ≥ 1. The building T(V), the Solomon–Tits theorem (T(V) is a wedge of (n − 2)-spheres for n ≥ 2) and the Steinberg module St(V) with its GL(V)-action are BorelRegulators R.1's (RT-AREA-ktheory-1/1); this node uses them and proves only the comparison with J(V).
2. Homology is reduced homology: with unreduced H₀ the rank-two term would be wrong (Sun's remark on Ash–Rudolph).

**Construction or proof.**

1. J₀(V) is contractible: (W₀, W₁) ≤ (W₀, V) ≥ (V, V) in J₀(V), a zigzag of monotone maps to a constant (StableHomotopyKTheory H.1: comparable monotone maps induce homotopic maps of nerves); likewise J₁(V) through (W₀, W₁) ≤ (0, W₁) ≥ (0, 0).
2. J₀(V) ∩ J₁(V) = {0 ≠ W₀ ⊆ W₁ ≠ V} is the poset of closed intervals [W₀, W₁] of T(V) ordered by inclusion; the map (W₀, W₁) ↦ W₁ to T(V) is order-preserving, and the preimage of T(V)_{≤W} is contractible, since (W₀, W₁) ≤ (W₀, W) ≥ (W, W) there; by Quillen's Theorem A (StableHomotopyKTheory H.2) it is a homotopy equivalence.
3. Since no chain of J(V) meets both complements (N.3:finite-generation/layer-poset), the nerve of J(V) is the union of the nerves of J₀(V) and J₁(V) along that of their intersection: two cones on T(V), i.e. ΣT(V). Every step is GL(V)-equivariant.
4. Apply the Solomon–Tits theorem (R.1): ΣT(V) is a wedge of (n − 1)-spheres, so H̃_*(J(V)) is St(V) in degree n − 1 and zero elsewhere; for n = 1 the two points give H̃₀ = ℤ with trivial action.

**Acceptance checks.**

1. n = 1: J(V) is two points, H̃₀ = ℤ = St(V).
2. n = 2, F = ℚ: H̃₁(J(V)) ≅ St(V) = ker(ℤ[ℙ¹(ℚ)] → ℤ), a free abelian group of infinite rank.
3. n = 3, F = 𝔽₂ (a finite field, as a check of the building side): T(V) is the incidence graph of the Fano plane, a wedge of 2³ = 8 circles, and J(V) ≃ a wedge of eight 2-spheres.

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/layer-poset](#node-arithmeticktheory-n-3-finite-generation-layer-poset); `BorelRegulators:R.1`; `StableHomotopyKTheory:H.1`; `StableHomotopyKTheory:H.2`.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.3.1 (arXiv:1108.2441v3, p. 17). The statement, with Quillen's proposition as Kahn cites it (Quillen's paper itself was not read; the proof steps are this packet's).

**Source.** [Sun.2016](https://arxiv.org/pdf/1604.04700), p. 6 (arXiv:1604.04700v1). Why the Steinberg module in rank two must be reduced homology.

**Source.** [PutmanStudenmund.2021](https://arxiv.org/pdf/1909.01217v4), §1, 'Special linear group and the Steinberg module' (arXiv:1909.01217v4, p. 3). Solomon–Tits and the definition of the Steinberg module ('eH' is the text layer's H̃), which R.1 supplies.

<a id="node-arithmeticktheory-n-3-finite-generation-rank-spectral-sequence"></a>

### Quillen's rank spectral sequence

**Theorem · `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`.** Let A be a Dedekind domain with fraction field F. There is a spectral sequence of homological type E¹_{p,q} = ⊕_{[P], rank P = p} H_q(Aut_A(P); St(P ⊗_A F)) ⇒ H_{p+q}(BQ(P(A)); ℤ) for p ≥ 1, with E¹_{0,q} = H_q(BQ_0) = ℤ for q = 0 and 0 otherwise, where [P] runs over the isomorphism classes of projectives of rank p and H_q is group homology (Mathlib's groupHomology of the ℤ-linear representation St(P ⊗ F)). Equivalently, for each n ≥ 1 there is a long exact sequence ⋯ → H_i(BQ_{n−1}) → H_i(BQ_n) → ⊕_{[P], rank P = n} H_{i−n}(Aut_A(P); St(P ⊗ F)) → H_{i−1}(BQ_{n−1}) → ⋯, which is Quillen's Theorem 3 (1973). The E¹ term vanishes for q < 0, and in total degree i only the columns 0 ≤ p ≤ i contribute.

**Hypotheses and conventions.**

1. A is a Dedekind domain; the coefficients are integral. No finiteness of Pic(A) is needed for the spectral sequence itself.
2. St(P ⊗ F) is the reduced Steinberg module of N.3:finite-generation/layer-poset-is-the-suspended-building, with St = ℤ in rank one; Aut_A(P) acts through Aut_A(P) ⊂ GL(P ⊗ F).
3. The homotopy theory of categories used, Thomason's homotopy-colimit theorem and the cofibre sequence of a cellular functor, is requested from StableHomotopyKTheory H.2; the comparison of the homology of a one-object groupoid with local coefficients with group homology is H.1's.

**Construction or proof.**

1. The inclusions Q_{n−1} ⊂ Q_n are cellular and Q = ⋃ Q_n (N.3:finite-generation/rank-filtration), so the cellular-filtration spectral sequence (Kahn, Theorem 2.4.1, from Corollary 2.3.7) gives E¹_{p,q} = H_{p+q−1}(Q_p − Q_{p−1}, F̃_p) ⇒ H_{p+q}(BQ), with F̃_p the reduced coefficient system P ↦ C_*(Q_{p−1} ↓ P) on the groupoid Q_p − Q_{p−1}.
2. Q_p − Q_{p−1} ≃ ⊔_{[P]} Aut_A(P) (rank-filtration (b)), so the homology with coefficients splits as a direct sum over [P] of the homology of the one-object groupoid Aut_A(P) with coefficients in the reduced chains of Q_{p−1} ↓ P (H.1).
3. Q_{p−1} ↓ P ≃ J(P ⊗ F) (N.3:finite-generation/comma-category-is-the-layer-poset), whose reduced homology is St(P ⊗ F) concentrated in degree p − 1 (N.3:finite-generation/layer-poset-is-the-suspended-building). The hyperhomology spectral sequence (Kahn, Lemma 1.3.5) collapses: H_{p+q−1}(Aut P, C̃_*(J)) ≅ H_q(Aut P; St).
4. The long exact sequences are the exact couple of the filtration; Kahn's Remark 4.3.4 (Vogel's argument) shows that they agree with Quillen's.

**Acceptance checks.**

1. A = ℤ, total degree one: E¹_{0,1} = 0 and E¹_{1,0} = H₀(GL₁(ℤ); ℤ) = ℤ, and H₁(BQ(P(ℤ))) = π₁(BQ)^{ab} = K₀(ℤ) = ℤ; so the differential d¹ : E¹_{2,0} → E¹_{1,0} vanishes.
2. Rank two over ℤ, rationally: by virtual duality with Putman–Studenmund's dualizing module St₂(ℚ) ⊗ ℤ_det (Theorem C; vcd GL₂(ℤ) = 1), H_q(GL₂(ℤ); St₂(ℚ) ⊗ ℚ) ≅ H^{1−q}(GL₂(ℤ); ℚ_det), which vanishes for q = 0, 1 (H¹(SL₂(ℤ); ℚ) = 0 and det is non-trivial); with the untwisted module the identification would be wrong (their Example 1.4).
3. In total degree i only p ≤ i contributes: H_i(BQ_n) → H_i(BQ) is onto for n ≥ i and bijective for n ≥ i + 1.

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/rank-filtration](#node-arithmeticktheory-n-3-finite-generation-rank-filtration); [ArithmeticKTheory:N.3:finite-generation/comma-category-is-the-layer-poset](#node-arithmeticktheory-n-3-finite-generation-comma-category-is-the-layer-poset); [ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building](#node-arithmeticktheory-n-3-finite-generation-layer-poset-is-the-suspended-building); `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`; `StableHomotopyKTheory:H.1`; `StableHomotopyKTheory:H.2`; `mathlib:groupHomology`.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.3.3, Theorem (arXiv:1108.2441v3, p. 17). The E¹ term, verbatim up to the typesetting of the direct sum; for X = Spec A with A Dedekind the torsion-free sheaves are the projectives (4.2.7).

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 2.4.1, Theorem (arXiv:1108.2441v3, p. 12). The spectral sequence of a cellular filtration (step 1).

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.3.4, Remark (arXiv:1108.2441v3, p. 17). Identification with Quillen's Theorem 3.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), Introduction (arXiv:1108.2441v3, p. 1). Quillen's exact sequences assemble into this spectral sequence.

<a id="node-arithmeticktheory-n-3-finite-generation-quillen-finiteness-criterion"></a>

### Quillen's finiteness criterion for a Dedekind domain

**Theorem · `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`.** Let R be a Dedekind domain with fraction field F. Suppose that (1) Pic(R) is finite, and (2) for every finitely generated projective R-module P of positive rank and every q ≥ 0 the group H_q(Aut_R(P); St(P ⊗_R F)) is a finitely generated abelian group. Then H_i(BQ(P(R)); ℤ) is finitely generated for every i, and K_n(R) is a finitely generated abelian group for every n ≥ 0. This node is the assembly: it combines the rank spectral sequence with the two hypotheses and passes from homology to homotopy; hypothesis (2) for R = 𝓞_F is N.3:finite-generation/steinberg-homology-of-automorphism-groups.

**Hypotheses and conventions.**

1. R is a Dedekind domain with fraction field F; K_n(R) = π_{n+1} BQ(P(R)) (GeneralAlgebraicKTheory K.1/K-groups-of-exact-categories).
2. Pic(R) is finite (hypothesis (1) of the source).
3. For every finitely generated projective P of positive rank and every q, H_q(Aut_R(P); St(P ⊗_R F)) is finitely generated (hypothesis (2), written st(P ⊗_R F) in the source), with integral coefficients.
4. The passage from homology to homotopy is Serre's theorem for simple spaces, requested from StableHomotopyKTheory H.6; BQ(P(R)) is simple because direct sum makes it a connected H-space.

**Construction or proof.**

1. Total degree i of the rank spectral sequence (N.3:finite-generation/rank-spectral-sequence): E¹_{p,q} with p + q = i, q ≥ 0 and p ≥ 0, so 0 ≤ p ≤ i — finitely many columns.
2. Each E¹_{p,q} is a finite direct sum (by (1), finitely many isomorphism classes of each rank, N.3:finite-generation/rank-filtration (e)) of groups that are finitely generated by (2); E¹_{0,q} is ℤ or 0.
3. The filtration of H_i(BQ) is finite and exhaustive (rank-filtration (c)), with subquotients subquotients of E¹ terms of total degree i; so H_i(BQ; ℤ) is finitely generated.
4. Direct sum ⊕ : P(R) × P(R) → P(R) is exact, so it induces Q(P(R)) × Q(P(R)) → Q(P(R)) and, since the nerve and realisation preserve finite products (StableHomotopyKTheory H.1), a multiplication BQ × BQ → BQ with unit 0 up to the homotopy given by the natural isomorphism 0 ⊕ M ≅ M; BQ is connected (π₀ is one point), so it is a connected H-space, hence simple.
5. Serre's theorem (StableHomotopyKTheory H.6, request): for a simple space with finitely generated integral homology in every degree, every homotopy group is finitely generated. Hence K_n(R) = π_{n+1} BQ is finitely generated.

**Acceptance checks.**

1. For R = ℤ both hypotheses hold (Pic(ℤ) = 0; hypothesis (2) for GL_m(ℤ) by N.3:finite-generation/steinberg-homology-of-automorphism-groups), so K_n(ℤ) is finitely generated for every n.
2. A finiteness hypothesis on Pic(R) cannot be dropped: K_0(R) = ℤ ⊕ Pic(R) (KTheoryLowDegrees Z.4), and for the coordinate ring R of an elliptic curve over ℂ with one point removed Pic(R) ≅ E(ℂ) is not finitely generated, so neither is K_0(R).
3. Rational finiteness of (2) would give only finite-dimensionality of H_i(BQ) ⊗ ℚ and so of K_n(R) ⊗ ℚ; integral finite generation needs (2) integrally.

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence](#node-arithmeticktheory-n-3-finite-generation-rank-spectral-sequence); [ArithmeticKTheory:N.3:finite-generation/rank-filtration](#node-arithmeticktheory-n-3-finite-generation-rank-filtration); `KTheoryLowDegrees:Z.4/projective-classification`; `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`; `StableHomotopyKTheory:H.1`; `StableHomotopyKTheory:H.6`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.8–6.9, the paragraph between Bass' Conjecture 6.8 and Theorem 6.9 (PDF p. 333; book p. 325). The criterion with both hypotheses, verbatim (reference numbers kept, cross-reference tags dropped); the source gives no proof, which is decomposed here from Kahn's rank spectral sequence.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), Introduction (arXiv:1108.2441v3, p. 1). Quillen's proof runs through these exact sequences.

**Source.** [Sun.2016](https://arxiv.org/pdf/1604.04700), p. 7 (arXiv:1604.04700v1). The two hypotheses in the form used here.

<a id="node-arithmeticktheory-n-3-finite-generation-steinberg-homology-of-automorphism-groups"></a>

### Finite generation of the Steinberg homology of Aut(P), nonfree P included

**Lemma · `ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups`.** Let F be a number field, A = 𝓞_F and P a finitely generated projective A-module of rank n ≥ 1 (free or not), V = P ⊗_A F. Choosing an F-basis V ≅ Fⁿ, the group Aut_A(P) ⊂ GL(V) ≅ GL_n(F) is commensurable with GL_n(𝓞_F): Aut_A(P) ∩ GL_n(𝓞_F) has finite index in both. Hence, by BorelRegulators R.1's finiteness of the Steinberg homology of arithmetic groups, H_i(Aut_A(P); St(V)) is a finitely generated abelian group for every i ≥ 0 — integrally, not only after ⊗ ℚ. In rank one Aut_A(P) = 𝓞_F^× and St(V) = ℤ. This is hypothesis (2) of Quillen's criterion for A = 𝓞_F.

**Hypotheses and conventions.**

1. F a number field, A = 𝓞_F, n = rank P ≥ 1; the identification St(V) ≅ St_n(F) is induced by the chosen basis and is equivariant for Aut_A(P) → GL_n(F).
2. R.1 supplies (request): for every n ≥ 1 and every subgroup Γ ⊂ GL_n(F) commensurable with GL_n(𝓞_F), H_i(Γ; St_n(F)) is finitely generated for all i, proved from the duality of torsion-free finite-index subgroups with the twisted dualizing module St_n(F) ⊗ ℤ_χ^{⊗(n−1)}, χ = N_{F/ℚ} ∘ det (Putman–Studenmund, Theorem C), and descent through a normal subgroup of finite index. Rational duality alone would give only finite-dimensionality of H_i ⊗ ℚ, which does not suffice.
3. The node owns the passage from GL_n(𝓞_F) to Aut_A(P) for nonfree P and the low ranks; it does not re-prove the arithmetic finiteness.

**Construction or proof.**

1. Under V ≅ Fⁿ, L = 𝓞_Fⁿ and P are two 𝓞_F-lattices spanning V; there is a nonzero N ∈ ℤ with N·L ⊆ P ⊆ N⁻¹·L (both are finitely generated and span V).
2. The principal congruence subgroup Γ_L(N²) = ker(GL(L) → GL(L/N²L)) preserves P: for x ∈ P ⊆ N⁻¹L and g ∈ Γ_L(N²), (g − 1)x ∈ N²·N⁻¹L = N·L ⊆ P, and likewise for g⁻¹; it has finite index in GL(L) = GL_n(𝓞_F) because L/N²L is finite. Symmetrically Γ_P(N²) ⊆ GL(L) has finite index in Aut_A(P). So the two groups are commensurable.
3. Apply R.1's finiteness of H_i(Γ; St_n(F)) to Γ = Aut_A(P), transported along the equivariant identification St(V) ≅ St_n(F).
4. Rank one: End_A(P) = A for an invertible module P, so Aut_A(P) = 𝓞_F^× = GL₁(𝓞_F), and St(V) = ℤ (N.3:finite-generation/layer-poset-is-the-suspended-building); this is R.1's case n = 1, the homology of the finitely generated abelian group 𝓞_F^×.

**Acceptance checks.**

1. A = ℤ, P = ℤⁿ: Aut(P) = GL_n(ℤ) itself.
2. A = 𝓞 of ℚ(√−5), P = 𝓞 ⊕ 𝔭₂ (rank two, not free, since det P = [𝔭₂] is the non-trivial class): Aut(P) is an arithmetic group commensurable with GL₂(𝓞), containing the principal congruence subgroup of level N² of GL₂(𝓞) for N = 2 (since 2·𝓞² ⊆ P ⊆ 𝓞²).
3. Rank one: H_i(𝓞_F^×; ℤ) is finitely generated for every i because 𝓞_F^× ≅ μ(F) × ℤ^{r_1+r_2−1}.
4. The untwisted Steinberg module is not the dualizing module of GL₂(ℤ) (Putman–Studenmund, Example 1.4); the finiteness statement imported from R.1 is insensitive to the twist, but its proof must use the right module.

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building](#node-arithmeticktheory-n-3-finite-generation-layer-poset-is-the-suspended-building); `BorelRegulators:R.1`; `KTheoryLowDegrees:Z.4/steinitz`; `mathlib:NumberField.RingOfIntegers`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.8–6.9, the paragraph between Bass' Conjecture 6.8 and Theorem 6.9 (PDF p. 333; book p. 325). Hypothesis (2), whose verification for rings of integers this node assembles from R.1.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.8–6.9, the sentence before Theorem 6.9 (PDF p. 333; book p. 325). Quillen's verification of (2) for number fields, which the source does not reproduce.

**Source.** [Sun.2016](https://arxiv.org/pdf/1604.04700), p. 7 (arXiv:1604.04700v1). The statement for every projective d, and the descent through a normal subgroup of finite index that R.1's proof uses.

**Source.** [PutmanStudenmund.2021](https://arxiv.org/pdf/1909.01217v4), Theorem C (arXiv:1909.01217v4, p. 4). The correctly twisted dualizing module on which R.1's finiteness rests (RT-AREA-ktheory-1/1, verifier).

<a id="node-arithmeticktheory-n-3-finite-generation-quillen-finite-generation-theorem"></a>

### Quillen's finite generation theorem for rings of integers

**Theorem · `ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem`.** Let R be an integrally closed subring of a number field F which is finite over Z. Then K_n(R) is a finitely generated abelian group for every n ≥ 0. Being integral over Z and integrally closed, such an R is the ring of integers of its fraction field, so this is the theorem for rings of integers 𝓞_F. The source's Theorem IV.6.9 also covers the coordinate ring of a smooth affine curve over a finite field; that half is outside this roadmap and is not planned here.

**Hypotheses and conventions.**

1. R ⊂ F is integrally closed and finitely generated as a Z-module, as the source's 'finite over Z' says; hence R = 𝓞_{F'} with F' = Frac(R).
2. A ring of S-integers with S non-empty is not finite over Z (Z[1/2] is not a finitely generated Z-module), so it is not covered by this theorem as printed; it is the next node, finite-generation-of-K-of-S-integers.

**Construction or proof.**

1. Hypothesis (1) of quillen-finiteness-criterion: the class group of a ring of integers is finite (mathlib:NumberField.RingOfIntegers.instFintypeClassGroup).
2. Hypothesis (2): for every finitely generated projective 𝓞_F-module P of positive rank, H_q(Aut(P); St(P ⊗ F)) is finitely generated (N.3:finite-generation/steinberg-homology-of-automorphism-groups, which imports the arithmetic finiteness from BorelRegulators R.1; the source: 'He then verified (2) in [154] (number field case)').
3. Apply quillen-finiteness-criterion.

**Acceptance checks.**

1. K_n(Z) is finitely generated for every n.
2. Degree zero: K_0(𝓞_F) = Z ⊕ Cl(𝓞_F) is finitely generated because the class group is finite.
3. Degree one: K_1(𝓞_F) = 𝓞_F^× (SK_1(𝓞_F) = 0, KTheoryLowDegrees U.4) is finitely generated, in agreement with Mathlib's Dirichlet unit theorem (the Monoid.FG instance for (𝓞 F)ˣ in NumberTheory/NumberField/Units/DirichletTheorem.lean).

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion](#node-arithmeticktheory-n-3-finite-generation-quillen-finiteness-criterion); [ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups](#node-arithmeticktheory-n-3-finite-generation-steinberg-homology-of-automorphism-groups); `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.9 (PDF p. 333; book p. 325). The theorem, verbatim; this node states its number-field half. 'Finite over Z' makes R a ring of integers.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.8–6.9, the sentence before Theorem 6.9 (PDF p. 333). The verification of hypothesis (2) for rings of integers, assembled in N.3:finite-generation/steinberg-homology-of-automorphism-groups from BorelRegulators R.1.

<a id="node-arithmeticktheory-n-3-finite-generation-function-field-steinberg-finiteness"></a>

### The function-field input to Quillen’s criterion

**Theorem · `ArithmeticKTheory:N.3:finite-generation/function-field-steinberg-finiteness`.** For R the coordinate ring of a smooth geometrically integral affine curve over a finite field, Pic(R) is finite and H_i(Aut_R(Q); St(Q⊗Frac(R))) is a finitely generated abelian group for every finitely generated projective Q of positive rank and i≥0. This is the function-field input cited as [GQ82] in K-book IV.6.9; the number-field arithmetic-group theorem does not supply it.

**Hypotheses and conventions.**

1. R is a smooth affine curve ring over a finite field; integral Steinberg coefficients, every projective Q and every i are required.

**Construction or proof.**

1. Use finiteness of the Jacobian’s finite-field points and quotient Pic of the proper curve by the nonempty boundary to obtain finite Pic(R).
2. Import the affine-curve Steinberg-homology theorem cited by Weibel as [GQ82]. Its original proof is not inspected: this is an explicit source/proof gap, not a deduction from the number-field theorem.

**Acceptance checks.**

1. Do not substitute number-field units or real embeddings into the function-field input.
2. For F_q[t], Pic=0; the homology hypothesis still requires the function-field theorem.

**Prerequisites.** .

**Discriminating unit tests.**

- `function_field_steinberg_finiteness_1` (characterisation): Do not substitute number-field units or real embeddings into the function-field input.
- `function_field_steinberg_finiteness_2` (characterisation): For F_q[t], Pic=0; the homology hypothesis still requires the function-field theorem.

**Source.** [Kbook.IV.chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), IV.6.9, PDF p.59. Paraphrase of the inspected passage, not a quotation. The affine-curve verification of the Steinberg-homology hypothesis is separately attributed to [GQ82].

**Open inputs.** Function-field Steinberg-homology proof remains to be read. See the gap register.

<a id="node-arithmeticktheory-n-3-finite-generation-affine-curve-finite-generation"></a>

### Finite generation for a smooth affine curve over a finite field

**Theorem · `ArithmeticKTheory:N.3:finite-generation/affine-curve-finite-generation`.** For R as above and every n≥0, K_n(R) is finitely generated over ℤ. This is the function-field branch of Quillen IV.6.9.

**Hypotheses and conventions.**

1. Smooth geometrically integral affine curve over a finite field; n≥0.

**Construction or proof.**

1. Supply both hypotheses of quillen-finiteness-criterion from function-field-steinberg-finiteness.
2. Apply the existing rank-filtration, homology and simple-space argument once; no second Q-construction or arithmetic-group proof is planned.

**Acceptance checks.**

1. K₁(F_q[t,t⁻¹]) contains the infinite cyclic subgroup generated by t: finite generation does not imply finiteness for affine curves.

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/function-field-steinberg-finiteness](#node-arithmeticktheory-n-3-finite-generation-function-field-steinberg-finiteness); [ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion](#node-arithmeticktheory-n-3-finite-generation-quillen-finiteness-criterion).

**Discriminating unit tests.**

- `affine_curve_finite_generation_1` (characterisation): K₁(F_q[t,t⁻¹]) contains the infinite cyclic subgroup generated by t: finite generation does not imply finiteness for affine curves.

**Source.** [Kbook.IV.chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), IV.6.9, PDF p.59. Paraphrase of the inspected passage, not a quotation. The coordinate ring of a smooth affine curve over a finite field has finitely generated K-groups.

**Open inputs.** Function-field Steinberg-homology proof remains to be read. See the gap register.

<a id="node-arithmeticktheory-n-3-finite-generation-proper-curve-finite-generation"></a>

### Finite generation for a smooth proper curve over a finite field

**Theorem · `ArithmeticKTheory:N.3:finite-generation/proper-curve-finite-generation`.** For a smooth projective geometrically integral curve X/F_q and n≥0, K_n(X) is finitely generated. This is the finite-generation input to Harder’s theorem, without its torsion or prime-to-p conclusions.

**Hypotheses and conventions.**

1. Choose a nonempty finite closed subset S⊂X; U=X∖S is affine.

**Construction or proof.**

1. Apply affine-curve-finite-generation to U.
2. Import the regular-scheme localization segment ⊕_{x∈S}K_n(k(x)) → K_n(X) → K_n(U) from S.3.
3. The finite direct sum on the left is finitely generated (K₀ of a finite field is ℤ; positive groups are finite). The image on the right is a subgroup of a finitely generated abelian group.
4. Conclude by closure of finite generation under quotients, subgroups and extensions.

**Acceptance checks.**

1. The finite subset S is essential for this finite-sum argument.
2. No finiteness of positive K-groups is assumed in proving finite generation.

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/affine-curve-finite-generation](#node-arithmeticktheory-n-3-finite-generation-affine-curve-finite-generation); `SchemeKTheoryOperations:S.3`; `KTheoryFiniteLocalFields:L.1`.

**Discriminating unit tests.**

- `proper_curve_finite_generation_1` (characterisation): The finite subset S is essential for this finite-sum argument.
- `proper_curve_finite_generation_2` (characterisation): No finiteness of positive K-groups is assumed in proving finite generation.

**Source.** [Kbook.VI.chapter](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6.1 proof, PDF p.37. Paraphrase of the inspected passage, not a quotation. Harder uses Quillen finite generation; localization supplies the proper-curve passage from IV.6.9.

**Open inputs.** Function-field Steinberg-homology proof remains to be read. See the gap register.

<a id="layer-n-3-ranks"></a>

## N.3:ranks. Borel ranks and even-group finiteness

Apply Borel’s theorem for orders and localisation with finite residue groups to pass to S-integers in degrees at least two. Positive even groups of the ring are finite; this conclusion does not extend to K₂ of its fraction field.

<a id="node-arithmeticktheory-n-3-ranks-borel-rank-theorem"></a>

### Ranks of the K-groups of S-integers: the passage from the ring of integers, and the degree-one exception

**Theorem · `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`.** Let F be a number field with r_1 real and r_2 complex places (Mathlib's nrRealPlaces and nrComplexPlaces), S a finite set of nonzero primes of 𝓞_F and 𝓞_{F,S} = S.integer F. (a) For every n ≥ 2 the maps K_n(𝓞_F) → K_n(𝓞_{F,S}) → K_n(F) become isomorphisms after ⊗ ℚ; hence rank K_n(𝓞_{F,S}) = rank K_n(𝓞_F), which by Borel's theorem for the order 𝓞_F (imported from BorelRegulators R.3; K-book IV.1.17–1.18) is r_1 + r_2 if n ≡ 1 (mod 4), r_2 if n ≡ 3 (mod 4) and 0 if n is even. (b) In degree one the passage fails: K_1(𝓞_F) → K_1(𝓞_{F,S}) is injective with cokernel of rank |S|, because the residue terms K_0(k(𝔭)) = ℤ are not torsion, and rank K_1(𝓞_{F,S}) = r_1 + r_2 + |S| − 1, the rank of Dirichlet's S-unit theorem (KTheoryLowDegrees U.4), not the n ≡ 1 value r_1 + r_2. This node owns only the passage from 𝓞_F to 𝓞_{F,S} and to F; the rank theorem for 𝓞_F and for orders is R.3's.

**Hypotheses and conventions.**

1. n ≥ 2 in (a). The rank is dim_ℚ K_n ⊗ ℚ; since K_n(𝓞_{F,S}) is finitely generated (N.3:finite-generation) it is the rank of a finitely generated abelian group.
2. 𝓞_{F,S} with S ≠ ∅ is not an order in the source's sense ('a subring of A which is finitely generated over Z and has R ⊗ Q = A'), so Borel's Theorem IV.1.17 does not apply to it; the passage from 𝓞_F is this node's (RT-AREA-ktheory-1/7), by the localisation sequence of 𝓞_F ⊂ 𝓞_{F,S} = 𝓞_F[1/s] with the finitely many residue fields k(𝔭), 𝔭 ∈ S.
3. The finiteness of the positive even groups is for the ring, not for the field: K_{2i}(F) is infinite (N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion), and the K-book's Classical Data VI.8.1 prints K_n(F) there by mistake (sourceIssues ArithmeticKTheory/E15).

**Construction or proof.**

1. Import from BorelRegulators R.3 Borel's theorem for the order 𝓞_F of the number field F (K-book IV.1.17 with A = F, R = 𝓞_F, and IV.1.18 with A = F): for n ≥ 2, K_n(𝓞_F) ⊗ ℚ ≅ K_n(F) ⊗ ℚ has dimension r_1 + r_2, r_2 or 0 according as n ≡ 1 (mod 4), n ≡ 3 (mod 4) or n is even.
2. Write 𝓞_{F,S} = 𝓞_F[1/s] with the primes dividing s exactly those of S (N.1/S-integers-as-a-localisation). The localisation sequence of 𝓞_F → 𝓞_F[1/s] (N.2/finite-support: its fibre term is ⊕_{𝔭∈S} K_*(k(𝔭))) reads ⋯ → ⊕_{𝔭∈S} K_n(k(𝔭)) → K_n(𝓞_F) → K_n(𝓞_{F,S}) → ⊕_{𝔭∈S} K_{n−1}(k(𝔭)) → ⋯.
3. For n ≥ 2 both residue terms are finite (K_m(𝔽_q) is finite for m ≥ 1, KTheoryFiniteLocalFields L.1); ⊗ ℚ is exact, so K_n(𝓞_F) ⊗ ℚ ≅ K_n(𝓞_{F,S}) ⊗ ℚ.
4. The same argument with the sequence (6.6) of 𝓞_{F,S} ⊂ F (N.2/localisation-sequence-for-a-dedekind-domain), whose residue terms are torsion in the relevant degrees, gives K_n(𝓞_{F,S}) ⊗ ℚ ≅ K_n(F) ⊗ ℚ, compatibly with step 1.
5. Conclude with finite generation (N.3:finite-generation/finite-generation-of-K-of-S-integers): the rank of the finitely generated group K_n(𝓞_{F,S}) is dim_ℚ K_n(𝓞_{F,S}) ⊗ ℚ.
6. (b) Degree one: K_1 = units (N.1/K1-of-S-integers-and-the-determinant), and the degree-one end of the relative sequence is the S-unit sequence 1 → 𝓞_F^× → 𝓞_{F,S}^× → ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) (N.2/S-unit-and-class-group-sequence); Cl(𝓞_F) is finite, so the image in ⊕_{𝔭∈S} ℤ has finite index and the cokernel of K_1(𝓞_F) → K_1(𝓞_{F,S}) has rank |S|. With Dirichlet's S-unit theorem (KTheoryLowDegrees U.4) this is rank r_1 + r_2 + |S| − 1.

**Acceptance checks.**

1. K_3(ℤ), K_7(ℤ) and every K_{2j}(ℤ), j ≥ 1, have rank 0, while K_5(ℤ) and K_9(ℤ) have rank 1 (r_1 = 1, r_2 = 0); the same holds for ℤ[1/p], since K_n(ℤ) → K_n(ℤ[1/p]) is a rational isomorphism for n ≥ 2.
2. For F = ℚ(√−1) (r_1 = 0, r_2 = 1) every K_n(ℤ[√−1]) with n odd and n ≥ 3 has rank 1.
3. For a real quadratic field (r_1 = 2, r_2 = 0), rank K_5 = 2 and rank K_3 = 0; for an imaginary quadratic field rank K_3 = rank K_5 = 1.
4. For n ≥ 2 the rank does not depend on S.
5. Degree one is excluded, and must be excluded by the hypothesis n ≥ 2 rather than by a check of values: rank K_1(𝓞_{F,S}) = r_1 + r_2 + |S| − 1, which equals the n ≡ 1 value r_1 + r_2 exactly when |S| = 1. For ℤ it is 0 against 1, for ℤ[1/6] it is 2 against 1, and for ℤ[1/2] both are 1; K_1(ℤ) = {±1} → K_1(ℤ[1/2]) = {±1} × 2^ℤ has cokernel ℤ, of rank |S| = 1.
6. The source's own degree-one warning: for the group ring ℤ[C_p] of a cyclic group of prime order p ≥ 3, r_1 + r_2 = (p + 1)/2 while K_1(ℤ[C_p]) has rank (p − 3)/2.

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers](#node-arithmeticktheory-n-3-finite-generation-finite-generation-of-k-of-s-integers); [ArithmeticKTheory:N.1/S-integers-as-a-localisation](#node-arithmeticktheory-n-1-s-integers-as-a-localisation); [ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant](#node-arithmeticktheory-n-1-k1-of-s-integers-and-the-determinant); [ArithmeticKTheory:N.2/finite-support](#node-arithmeticktheory-n-2-finite-support); [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); [ArithmeticKTheory:N.2/S-unit-and-class-group-sequence](#node-arithmeticktheory-n-2-s-unit-and-class-group-sequence); `BorelRegulators:R.3`; `KTheoryFiniteLocalFields:L.1`; `KTheoryLowDegrees:U.4`; `mathlib:NumberField.InfinitePlace.nrRealPlaces`; `mathlib:NumberField.InfinitePlace.nrComplexPlaces`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.18 (PDF p. 279; book p. 271). Borel's theorem, verbatim with its cases display written on one line; imported from R.3 with A = F.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.17 (PDF p. 279; book p. 271). Borel's comparison for orders, imported from R.3 for the order 𝓞_F; 𝓞_{F,S} with S ≠ ∅ is not an order, which is why this node passes from 𝓞_F to 𝓞_{F,S} itself.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Before IV.1.17 (PDF p. 279). The definition of an order, which excludes 𝓞_{F,S} for S ≠ ∅; hence the localisation step.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Before IV.1.18 (PDF p. 279). The degrees of the primitive generators, from which the period-four pattern is read off (numerical check of the rank formula).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.18.2, Example 1.18.2 (PDF p. 280; book p. 272). The source's warning that degree one does not follow the pattern.

<a id="node-arithmeticktheory-n-3-ranks-even-k-groups-of-s-integers-are-finite"></a>

### The positive even K-groups of rings of S-integers are finite

**Theorem · `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`.** Let F be a number field and S a finite set of nonzero primes of 𝓞_F. For every i ≥ 1 the group K_{2i}(𝓞_{F,S}) is finite; in particular K_2(𝓞_F) is finite. The statement is about the ring: the corresponding groups K_{2i}(F) of the field are infinite torsion groups (N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion), and the K-book's Classical Data VI.8.1, which prints the finiteness for K_n(F), is misprinted there (sourceIssues ArithmeticKTheory/E15).

**Hypotheses and conventions.**

1. F a number field, S finite (S = ∅ allowed), i ≥ 1.
2. This is the finiteness theorem for K_2(𝓞_F) that SpecialValuesBirchTate B.1 uses (RT-AREA-ktheory-1/10); it is exported from this stage, N.3:ranks.

**Construction or proof.**

1. K_{2i}(𝓞_{F,S}) is finitely generated (N.3:finite-generation/finite-generation-of-K-of-S-integers).
2. Its rank is 0 (N.3:ranks/borel-rank-theorem (a), n = 2i even).
3. A finitely generated abelian group of rank 0 is finite (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod).

**Acceptance checks.**

1. K_2(ℤ) has order two (K2SymbolsBrauer T.5/k2-of-the-integers) and K_2(ℤ[1/p]) has order 2(p − 1) (T.5/s-integer-tame-kernel-sequence); both are finite, as they must be.
2. K_4(ℤ) and K_6(ℤ) are finite.
3. Non-example: K_2(ℚ) is infinite (T.5/k2-of-the-rationals); the theorem is false for the field.

**Prerequisites.** [ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers](#node-arithmeticktheory-n-3-finite-generation-finite-generation-of-k-of-s-integers); [ArithmeticKTheory:N.3:ranks/borel-rank-theorem](#node-arithmeticktheory-n-3-ranks-borel-rank-theorem); `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.18, last sentence (PDF p. 279; book p. 271). Torsion of the even groups of an order; with finite generation and the passage to 𝓞_{F,S} this gives finiteness.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1, Classical Data 8.1 (PDF p. 521; book p. 513). The finiteness statement with the misprint K_n(F) for K_n(O_S) (sourceIssues ArithmeticKTheory/E15); this node states it for the ring.

<a id="node-arithmeticktheory-n-3-ranks-even-k-groups-of-the-field-are-infinite-torsion"></a>

### The positive even K-groups of a number field are infinite torsion groups

**Theorem · `ArithmeticKTheory:N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion`.** Let F be a number field and i ≥ 1. Then K_{2i}(F) is a torsion group, and it is infinite. Torsion: in the localisation sequence K_{2i}(𝓞_F) → K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) the left term is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite) and the right term is torsion. Infinite: in the localisation sequence of 𝓞_F the boundary K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) ≅ ⊕_𝔭 Z/(N𝔭^i − 1) has infinite image, because the next map lands in the finitely generated group K_{2i−1}(𝓞_F). By contrast K_{2i}(𝓞_{F,S}) is finite for every finite S (N.3/finiteness-and-ranks-combined).

**Hypotheses and conventions.**

1. F is a number field and i ≥ 1; the direct sum runs over all non-zero primes 𝔭 of 𝓞_F, and N𝔭 = #k(𝔭).
2. The argument does not use Soulé's theorem, which would give the sharper exact sequence 0 → K_{2i}(𝓞_F) → K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) → 0; Soulé's proof itself uses finite generation (see restructure), so this node avoids it.

**Construction or proof.**

1. Torsion: the localisation sequence of 𝓞_F (N.2) gives an exact segment K_{2i}(𝓞_F) → K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)); K_{2i}(𝓞_F) is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite) and the direct sum is torsion (KTheoryFiniteLocalFields L.1), so K_{2i}(F) is torsion.
2. The localisation sequence of 𝓞_F (N.2) gives an exact segment K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) → K_{2i−1}(𝓞_F).
3. Each K_{2i−1}(k(𝔭)) ≅ Z/(N𝔭^i − 1) (KTheoryFiniteLocalFields L.1) is non-zero as soon as N𝔭^i > 2, which excludes only the primes of norm 2 when i = 1; infinitely many 𝔭 remain, so the direct sum is an infinite torsion group.
4. Its image in the finitely generated group K_{2i−1}(𝓞_F) (N.3:finite-generation) is a finitely generated torsion group, hence finite; so the kernel, which is the image of the boundary, is infinite, and K_{2i}(F) is infinite.

**Acceptance checks.**

1. K_2(Q) is infinite (its boundary maps onto ⊕_p F_p^×, the tame symbol of N.2), while K_2(Z) ≅ Z/2 is finite (K2SymbolsBrauer T.5).
2. K_4(Q) is an infinite torsion group although K_4(Z) is finite.
3. The contrast is special to even degrees: for odd n ≥ 3 the groups of the ring and of the field agree (Soulé) and are finitely generated.

**Prerequisites.** [ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite](#node-arithmeticktheory-n-3-ranks-even-k-groups-of-s-integers-are-finite); [ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers](#node-arithmeticktheory-n-3-finite-generation-finite-generation-of-k-of-s-integers); [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); `KTheoryFiniteLocalFields:L.1`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, Theorem 6.8 (PDF p. 420; book p. 412). The even-degree sequences exhibit K_n(F) as an extension of the infinite group ⊕_p K_{n−1}(R/p) by K_n(R); this node proves the weaker statement it needs without Soulé's theorem.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.18, last sentence (PDF p. 279). Torsion of the even groups, for orders and, through Theorem 1.18 with A = F, for the field.

<a id="layer-n-4"></a>

## N.4. Twisted roots of unity and the w-invariant

Build the finite cyclic fixed-point groups before using them in K-theory. Cyclotomic exponents give odd-prime and dyadic formulas; exceptional fields control the latter. N.7 imports this invariant and compares its rational values with Bernoulli denominators.

<a id="node-arithmeticktheory-n-4-the-w-invariant"></a>

### The group W_i(F) = H⁰(F, ℚ/ℤ(i)) and its order w_i(F)

**Definition · `ArithmeticKTheory:N.4/the-w-invariant`.** Let F be a field with separable closure F^s and absolute Galois group G_F = Gal(F^s/F), and i ∈ Z. Let µ(i) be the i-th Tate twist of µ = µ(F^s): the group µ with g ∈ G_F acting by ζ ↦ g^i(ζ), that is, on µ_{ℓ^ν} by ζ ↦ ζ^{χ_ℓ(g)^i} for the ℓ-adic cyclotomic character χ_ℓ (K-book Definition VI.1.7); it is ℚ/ℤ(i) (its prime-to-p part in characteristic p), imported from MotivicEtaleKTheory M.1. Define W_i(F) = H⁰(G_F, µ(i)) = µ(i)^{G_F} and, for a prime ℓ ≠ char F, W_i^{(ℓ)}(F) = (ℤ/ℓ^∞(i))^{G_F}, so that W_i(F) = ⊕_ℓ W_i^{(ℓ)}(F). When W_i(F) is finite it is cyclic, and w_i(F) = #W_i(F), w_i^{(ℓ)}(F) = #W_i^{(ℓ)}(F), with w_i(F) = ∏_ℓ w_i^{(ℓ)}(F); these numbers are written only under a finiteness hypothesis. For a finite separable extension E/F there are restriction W_i(F) → W_i(E) and transfer W_i(E) → W_i(F) with transfer ∘ restriction = [E : F]. No K-theory enters the definition; W_i(F) is the target of the e-invariant of N.5.

**Hypotheses and conventions.**

1. F is a field and i ∈ Z; for the applications F is a number field and i ≥ 1, where W_i(F) is finite (N.4/finiteness-of-the-w-invariant).
2. The twist is MotivicEtaleKTheory M.1's primewise-compatible ℚ/ℤ(i) ('Q/Z(j) uses primewise compatible twists, not the ordinary tensor power of Q/Z'); in weight one it is the colimit of Tau Ceti's KummerCoeff F ℓ^ν. K2SymbolsBrauer T.7 does not own it: its reviewed packet imports the twists from M.1.
3. For i = 0 the action is trivial, W_0(F) = µ(F^s) is infinite and w_0 is not defined.

**Construction or proof.**

1. Import µ(i) = ℚ/ℤ(i) as a discrete G_F-module from MotivicEtaleKTheory M.1, with g acting on µ_{ℓ^ν}(i) through χ_ℓ(g)^i, χ_ℓ being Mathlib's cyclotomicCharacter (its reduction modulo ℓ^ν is modularCyclotomicCharacter).
2. Define W_i(F) as Tau Ceti's ContCohomology.H0 of G_F (TauCeti.AbsoluteGaloisGroup) acting on µ(i), and W_i^{(ℓ)}(F) as its ℓ-primary component (Mathlib's primaryComponent).
3. Primary decomposition: µ(i) is torsion, so W_i(F) is the internal direct sum of the W_i^{(ℓ)}(F), ℓ ≠ char F.
4. Cyclicity: the underlying group of µ(i) is µ(F^s) ⊂ (F^s)^×, so a finite subgroup is cyclic (Mathlib's isCyclic_subgroup_units); each finite W_i^{(ℓ)}(F) is µ_{ℓ^m}(i) for a unique m.
5. Define w_i(F) and w_i^{(ℓ)}(F) as cardinalities under a finiteness hypothesis and prove w_i(F) = ∏_ℓ w_i^{(ℓ)}(F).
6. Restriction and transfer: for E/F finite separable, G_E is an open subgroup of index [E : F] in G_F; restriction is Tau Ceti's explicitRes0 (the inclusion of fixed points, injective), transfer is explicitCor0 (the norm over G_F/G_E), and explicitCor0_comp_res0 gives transfer ∘ restriction = [E : F]. Hence w_i(F) divides w_i(E) when both are finite.

**Acceptance checks.**

1. W_1(F) = µ(F); for a number field w_1(F) is the order of the torsion of 𝓞_F^×.
2. W_i(F_q) is cyclic of order q^i − 1 for i ≥ 1.
3. w_i(Q) = 2 for odd i, and w_2(Q) = 24 (N.4/w2-of-the-rationals-and-the-divisibility-tests).
4. W_i(F) is not the group of roots of unity of F: the two agree for i = 1 and differ already for Q and i = 2 (orders 24 and 2).

**Prerequisites.** `MotivicEtaleKTheory:M.1`; `mathlib:cyclotomicCharacter`; `mathlib:modularCyclotomicCharacter`; `mathlib:rootsOfUnity`; `mathlib:isCyclic_subgroup_units`; `mathlib:CommMonoid.primaryComponent`; `tauceti:TauCeti.KummerCoeff`; `tauceti:TauCeti.AbsoluteGaloisGroup`; `tauceti:TauCeti.ContCohomology.H0`; `tauceti:TauCeti.ContCohomology.explicitRes0`; `tauceti:TauCeti.ContCohomology.explicitCor0`; `tauceti:TauCeti.ContCohomology.explicitCor0_comp_res0`.

**Library API.**

- `TauCeti.WInvariant` (data): W_i(F) = H⁰(G_F, ℚ/ℤ(i)), the fixed points of G_F on M.1's twist ℚ/ℤ(i), as an additive subgroup.
- `TauCeti.WInvariant.primary` (data): For a prime ℓ ≠ char F, W_i^{(ℓ)}(F) = (ℤ/ℓ^∞(i))^{G_F}, the ℓ-primary component of W_i(F).
- `TauCeti.WInvariant.isInternal_primary` (structure): W_i(F) is the internal direct sum of the W_i^{(ℓ)}(F) over the primes ℓ ≠ char F.
- `TauCeti.WInvariant.isCyclic` (instance): If W_i(F) is finite it is cyclic (a finite subgroup of µ(F^s) ⊂ (F^s)^×).
- `TauCeti.wInvariant` (data): w_i(F) = #W_i(F); every statement about it carries the hypothesis that W_i(F) is finite, since the cardinality of an infinite group is not the source's w_i(F).
- `TauCeti.wInvariant_eq_prod_primary` (relation): If W_i(F) is finite, w_i(F) = ∏_ℓ w_i^{(ℓ)}(F), a finite product.
- `TauCeti.WInvariant.neg_eq` (characterisation): W_{−i}(F) = W_i(F) as subgroups of µ(F^s): χ(g)^i x = x if and only if x = χ(g)^{−i} x.
- `TauCeti.WInvariant.zero_eq_top` (example): W_0(F) is all of µ(F^s) (the action is trivial); it is infinite.
- `TauCeti.WInvariant.oneEquivRootsOfUnity` (compatibility): W_1(F) ≅ µ(F), the roots of unity of F; for a number field, W_1(F) ≅ Additive (NumberField.Units.torsion F).
- `TauCeti.WInvariant.res` (functoriality): For an intermediate field E of F^s/F, restriction W_i(F) →+ W_i(E), built on TauCeti.ContCohomology.explicitRes0; it is injective. For an abstract extension E the map depends on the embedding E → F^s when i ≠ 1: two embeddings differ by ζ ↦ ζ^{χ(σ)}, which is non-trivial on W_2(ℚ) = μ_24.
- `TauCeti.WInvariant.cor` (functoriality): For a finite intermediate field E of F^s/F, transfer W_i(E) →+ W_i(F), built on TauCeti.ContCohomology.explicitCor0 (the norm over G_F/G_E).
- `TauCeti.WInvariant.cor_comp_res` (relation): cor ∘ res = [E : F] • id on W_i(F) for a finite intermediate field E of F^s/F (from explicitCor0_comp_res0).
- `TauCeti.wInvariant_dvd_of_finite` (relation): For E/F finite separable with W_i(E) finite, W_i(F) is finite and w_i(F) divides w_i(E).

**Discriminating unit tests.**

- `TauCeti.wInvariant_finiteField` (computation): For i ≥ 1, w_i(F_q) = q^i − 1: the Frobenius acts on µ(i) by ζ ↦ ζ^{q^i}, whose fixed points are µ_{q^i−1}. An untwisted action would give q − 1 for every i.
- `TauCeti.wInvariant_rat_of_odd` (computation): For odd i, w_i(Q) = 2.
- `TauCeti.wInvariant_gaussian_of_odd` (computation): For odd i, w_i(Q(√−1)) = 4.
- `TauCeti.wInvariant_one_eq_torsionOrder` (compatibility): For a number field F, w_1(F) = NumberField.Units.torsionOrder F; for the n-th cyclotomic field this is n for n even and 2n for n odd (IsCyclotomicExtension.Rat.torsionOrder_eq).
- `TauCeti.WInvariant.zero_infinite` (degenerate): W_0(F) is infinite for every field F, so w_0(F) is not defined.
- `TauCeti.wInvariant_two_rat_ne_torsionOrder` (non-example): w_2(Q) = 24 while NumberField.Units.torsionOrder ℚ = 2 (NumberField.Units.torsionOrder_eq_two_of_odd_finrank): a definition by the roots of unity of F fails.
- `TauCeti.WInvariant.not_tensorPower` (non-example): The ordinary tensor power ℚ/ℤ ⊗_ℤ ℚ/ℤ is zero, so defining ℚ/ℤ(2) as it would give W_2(Q) = 0 instead of a cyclic group of order 24.
- `TauCeti.WInvariant.neg_eq_rat` (characterisation): W_{−2}(Q) = W_2(Q) as subgroups of µ(Q̄), of order 24.

**Consumers.**

- N.5, e-invariant and Harris-Segal summand: W_i(F) is the target of the e-invariant, and the Harris-Segal summand is cyclic of order w_i^{(ℓ)}(F).
- N.5, the odd tables (K-book VI.8.4, VI.9.5): the torsion of K_{2i−1}(𝓞_{F,S}) is Z/w_i(F), Z/2w_i(F) ⊕ (Z/2)^{r_1−1} or Z/(w_i(F)/2).
- N.6, even groups: the cohomological descriptions are stated at the same twists ℤ_ℓ(i + 1).
- SpecialValuesBirchTate B.1–B.3: B.1 imports W_2(F) = H⁰(F, ℚ/ℤ(2)) — the invariants of the twist ℚ/ℤ(2), not the roots of unity of F — from this node, with its finiteness and positivity from N.4/finiteness-of-the-w-invariant and the cyclotomic computation from N.4/computing-w-from-the-cyclotomic-character (RT-AREA-ktheory-1/10; atlas edge N.4 → B.1); the Birch-Tate formula ζ_F(−1) = (−1)^{[F:Q]} #K_2(𝓞_F)/w_2(F) uses w_2(F), and B.3 uses w_2(Q) = 24.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.1.7, Definition 1.7 (PDF p. 476; book p. 468). The Tate twist µ(i), verbatim; g^i(ζ) = ζ^{χ(g)^i}.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, before Definition 2.1 (PDF p. 477; book p. 469). The primary decomposition of the invariants.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1, Definition 2.1, second half (PDF p. 477). Cyclicity, the notation w_i(F) only for a finite group, and the product formula, verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.1 (PDF p. 478; book p. 470). The finite-field value, used as a test; 'for all i' means i ≥ 1 (see source issue).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.2 (PDF p. 478). The values over Q and Q(√−1), used as tests.

<a id="node-arithmeticktheory-n-4-computing-w-from-the-cyclotomic-character"></a>

### Computing w_i^{(ℓ)}(F) at odd primes from the cyclotomic character (Proposition VI.2.2)

**Theorem · `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`.** Fix a prime ℓ ≠ 2 and a field F of characteristic ≠ ℓ. Let a ≤ ∞ be maximal such that F(ζ_ℓ) contains a primitive ℓ^a-th root of unity, and let r = [F(ζ_ℓ) : F], a divisor of ℓ − 1. Write i = cℓ^b with ℓ ∤ c (i ≠ 0). Then w_i^{(ℓ)}(F) = ℓ^{a+b} if r | i, and 1 otherwise: (a) if ζ_ℓ ∈ F then w_i^{(ℓ)} = ℓ^{a+b}; (b) if ζ_ℓ ∉ F and r | i then w_i^{(ℓ)} = ℓ^{a+b}; (c) if ζ_ℓ ∉ F and r ∤ i then w_i^{(ℓ)} = 1. When a = ∞ and r | i the ℓ-primary part is infinite.

**Hypotheses and conventions.**

1. ℓ is odd; the prime 2 is N.4/two-primary-w-invariant and is genuinely different, since (ℤ/2^ν)^× is not cyclic for ν ≥ 3.
2. char F ≠ ℓ, and a ≤ ∞ as in the source; a is finite for a number field.
3. i ≠ 0, so that b = v_ℓ(i) is defined.

**Construction or proof.**

1. For ν ≥ a (a finite), [F(ζ_{ℓ^ν}) : F(ζ_ℓ)] = ℓ^{ν−a}: the image of Gal(F(ζ_{ℓ^ν})/F(ζ_ℓ)) in the cyclic group 1 + ℓ^a ℤ/ℓ^ν of order ℓ^{ν−a} cannot lie in its maximal proper subgroup 1 + ℓ^{a+1} ℤ/ℓ^ν, which fixes ζ_{ℓ^{a+1}} ∉ F(ζ_ℓ).
2. So Gal(F(ζ_{ℓ^ν})/F) is a subgroup of the cyclic group (ℤ/ℓ^ν)^× (Mathlib's ZMod.isCyclic_units_of_prime_pow), hence cyclic, of order rℓ^{ν−a}, and its exponent is its order; for 1 ≤ ν ≤ a, F(ζ_{ℓ^ν}) = F(ζ_ℓ) and the group is Gal(F(ζ_ℓ)/F), cyclic of order r.
3. By the exponent criterion, ℓ^ν | w_i^{(ℓ)}(F) exactly when rℓ^{ν−a} | cℓ^b for ν ≥ a, that is r | i and ν ≤ a + b (r is prime to ℓ); and for 1 ≤ ν ≤ a exactly when r | i. This gives ℓ^{a+b} if r | i and 1 otherwise.
4. Derive the cyclotomic example (Example VI.2.2.2) and the value over Q (a = 1, r = ℓ − 1).

**Acceptance checks.**

1. F = Q: a = 1 and r = ℓ − 1, so w_i^{(ℓ)}(Q) = ℓ^{1+v_ℓ(i)} when (ℓ − 1) | i and 1 otherwise; for example w_2^{(3)}(Q) = 3, w_6^{(3)}(Q) = 9, w_6^{(7)}(Q) = 7 and w_4^{(5)}(Q) = 5.
2. F = Q(ζ_{p^a}), p odd: w_i^{(p)}(F) = p^{a+b} for i = cp^b, and for ℓ ≠ 2, p, w_i^{(ℓ)}(F) = w_i^{(ℓ)}(Q) (Example VI.2.2.2).
3. F = Q(√−7), ℓ = 7: Q(√−7) ⊂ Q(ζ_7), so a = 1 and r = 3, and w_3^{(7)}(Q(√−7)) = 7 while w_3^{(7)}(Q) = 1.
4. F = Q(ζ_3), ℓ = 3: ζ_3 ∈ F and a = 1, so w_3^{(3)}(F) = 9 and w_1^{(3)}(F) = 3.

**Prerequisites.** [ArithmeticKTheory:N.4/the-w-invariant](#node-arithmeticktheory-n-4-the-w-invariant); [ArithmeticKTheory:N.4/exponent-criterion](#node-arithmeticktheory-n-4-exponent-criterion); `mathlib:IsCyclotomicExtension`; `mathlib:ZMod.isCyclic_units_of_prime_pow`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.2, Proposition 2.2 (PDF pp. 478–479; book pp. 470–471). The proposition, verbatim (a ≤ ∞ kept); the cases (a)–(c) follow on PDF p. 479.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.2, the proof (PDF p. 479). The first step of the proof, verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.2.2, Example 2.2.2 (PDF p. 479). The cyclotomic example, verbatim.

<a id="node-arithmeticktheory-n-4-exceptional-fields-at-two"></a>

### Exceptional fields

**Definition · `ArithmeticKTheory:N.4/exceptional-fields-at-two`.** A field F is exceptional if char F = 0 and the Galois groups Gal(F(ζ_{2^ν})/F) are not cyclic for all large ν; otherwise F is non-exceptional. For a number field F this holds exactly when F ∩ Q(ζ_{2^∞}), taken in an algebraic closure of F, is totally real, i.e. when the image of G_F under the 2-adic cyclotomic character contains −1. Every number field with a real place is exceptional, and so are some totally imaginary fields, such as Q(√−7) and Q(√−3); Q(√−1) and Q(√−2) are non-exceptional. The distinction is needed only at ℓ = 2, where (ℤ/2^ν)^× is not cyclic for ν ≥ 3.

**Hypotheses and conventions.**

1. F is a field; exceptionality requires char F = 0.
2. For a number field F, Gal(F(ζ_{2^ν})/F) ≅ Gal(Q(ζ_{2^ν})/F ∩ Q(ζ_{2^ν})), a subgroup H_ν of (ℤ/2^ν)^× ≅ {±1} × ⟨5⟩; for ν ≥ 3, H_ν is non-cyclic exactly when it contains −1 and has order at least 4, which gives the characterisation.
3. The source also asserts that R is exceptional; under the definition as printed it is not (Gal(C/R) ≅ ℤ/2 is cyclic). Nothing in this roadmap uses R (source issue).

**Construction or proof.**

1. Define IsExceptional F as in the source, with the Galois groups of the cyclotomic extensions F(ζ_{2^ν})/F.
2. For a number field, identify Gal(F(ζ_{2^ν})/F) with the subgroup H_ν of (ℤ/2^ν)^× fixing F ∩ Q(ζ_{2^ν}) (IsCyclotomicExtension.autEquivPow over Q), and prove that a subgroup of (ℤ/2^ν)^×, ν ≥ 3, is cyclic unless it contains −1 and has order at least 4 (an abelian 2-group with a unique involution is cyclic; ±(1 + 2^{ν−1}) are both in H once −1 and 1 + 2^{ν−1} are).
3. Real places: complex conjugation for a real embedding acts on µ_{2^∞} as −1, and |H_ν| → ∞, so every number field with a real place is exceptional.
4. √−1 ∈ F: H_ν ⊂ 1 + 4ℤ/2^ν = ⟨5⟩ is cyclic, so F is non-exceptional.
5. Subfields: if E/F is an extension and E is exceptional, then Gal(E(ζ_{2^ν})/E) embeds in Gal(F(ζ_{2^ν})/F), so F is exceptional.

**Acceptance checks.**

1. Q and every real number field are exceptional.
2. Q(√−7) is exceptional, as the source says, and so is Q(√−3).
3. Q(√−1) and Q(√−2) are non-exceptional.

**Prerequisites.** `mathlib:IsCyclotomicExtension`; `mathlib:IsCyclotomicExtension.autEquivPow`; `mathlib:ZMod.isCyclic_units_two_pow_iff`; `mathlib:cyclotomicCharacter`; `mathlib:NumberField.InfinitePlace.nrRealPlaces`.

**Library API.**

- `TauCeti.IsExceptional` (data): F is exceptional: char F = 0 and Gal(F(ζ_{2^ν})/F) is not cyclic for all sufficiently large ν.
- `TauCeti.IsExceptional.charZero` (projection): An exceptional field has characteristic zero.
- `TauCeti.IsExceptional.iff_inf_cyclotomic_isTotallyReal` (characterisation): For a number field F: F is exceptional if and only if F ∩ Q(ζ_{2^∞}) is totally real, if and only if −1 lies in the image of G_F under the 2-adic cyclotomic character.
- `TauCeti.IsExceptional.of_nrRealPlaces_pos` (characterisation): A number field with nrRealPlaces F > 0 is exceptional.
- `TauCeti.IsExceptional.not_of_sqrt_neg_one_mem` (characterisation): If −1 is a square in F, F is non-exceptional.
- `TauCeti.IsExceptional.of_extension` (functoriality): If E/F is a field extension and E is exceptional, then F is exceptional.
- `TauCeti.IsExceptional.rat` (example): Q is exceptional.

**Discriminating unit tests.**

- `TauCeti.IsExceptional.rat` (computation): Q is exceptional: Gal(Q(ζ_{2^ν})/Q) ≅ (ℤ/2^ν)^× (IsCyclotomicExtension.autEquivPow with Polynomial.cyclotomic.irreducible_rat), which is not cyclic for ν ≥ 3 (ZMod.isCyclic_units_two_pow_iff).
- `TauCeti.IsExceptional.not_gaussian` (computation): Q(√−1) is non-exceptional: Gal(Q(ζ_{2^ν})/Q(√−1)) is the subgroup of classes ≡ 1 (mod 4), generated by 5.
- `TauCeti.IsExceptional.sqrt_neg_seven` (computation): Q(√−7) is exceptional: 7 ramifies in Q(√−7) and not in Q(ζ_{2^ν}), so Q(√−7) ∩ Q(ζ_{2^ν}) = Q and Gal(Q(√−7, ζ_{2^ν})/Q(√−7)) ≅ (ℤ/2^ν)^×.
- `TauCeti.IsExceptional.not_sqrt_neg_two` (non-example): Q(√−2) is totally imaginary, does not contain √−1, and is non-exceptional: Q(√−2) ⊂ Q(ζ_8) and Gal(Q(ζ_{2^ν})/Q(√−2)) is the cyclic subgroup of classes ≡ 1, 3 (mod 8), generated by 3. So neither 'exceptional = √−1 ∉ F' nor 'exceptional = has a real place' is the definition (the latter fails on Q(√−7)).
- `TauCeti.IsExceptional.not_of_charP` (degenerate): A field of positive characteristic, e.g. F_3, is non-exceptional; Gal(F_3(ζ_{2^ν})/F_3) is in any case cyclic, generated by the Frobenius.

**Consumers.**

- N.4/two-primary-w-invariant (K-book Proposition VI.2.3): cases (c) and (d) of the 2-primary formula differ by exceptionality.
- N.5/harris-segal-summand (K-book Theorem VI.2.5, Remark 2.5.1): the Harris-Segal theorem at ℓ = 2 is proved for non-exceptional fields only.
- N.5/the-real-case-modulo-eight and N.6: every real number field is exceptional, so the dyadic corrections are the general case there, not a corner case.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, after Example 2.2.2 (PDF p. 479; book p. 471). The definition, verbatim; 'two involutions' is a misprint for three (source issue).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, after Proposition 2.3 (PDF p. 479). Which fields are exceptional, verbatim; correct for number fields and for Q_2 and its subfields, not for R (source issue).

<a id="node-arithmeticktheory-n-4-w2-of-the-rationals-and-the-divisibility-tests"></a>

### The numbers w_i(ℚ), and w₂(ℚ) = 24

**Theorem · `ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`.** w_i(Q) = 2 for odd i. For even i ≠ 0, w_i(Q) = 2^{2+v_2(i)} · ∏ ℓ^{1+v_ℓ(i)}, the product over the odd primes ℓ with (ℓ − 1) | i. In particular w_2(Q) = 2^3 · 3 = 24, with w_2^{(2)}(Q) = 8, w_2^{(3)}(Q) = 3 and w_2^{(ℓ)}(Q) = 1 for ℓ ≥ 5. The divisibility test by prime powers is N.4/exponent-criterion; for Q it reads ℓ^ν | w_i(Q) if and only if (ℤ/ℓ^ν)^× has exponent dividing i.

**Hypotheses and conventions.**

1. The field is Q; i ∈ Z, i ≠ 0.
2. Q is exceptional (N.4/exceptional-fields-at-two) and does not contain √−1, so the 2-part is case (b) or (c) of Proposition VI.2.3.

**Construction or proof.**

1. Odd primes (N.4/computing-w-from-the-cyclotomic-character with F = Q): a = 1, since Q(ζ_ℓ) contains ζ_ℓ but not ζ_{ℓ^2}, and r = [Q(ζ_ℓ) : Q] = ℓ − 1 (IsCyclotomicExtension.Rat.finrank); so w_i^{(ℓ)}(Q) = ℓ^{1+v_ℓ(i)} if (ℓ − 1) | i and 1 otherwise. For i = 2 only ℓ = 3 qualifies, with v_3(2) = 0, giving 3.
2. The prime 2 (N.4/two-primary-w-invariant): a = 2, since Q(√−1) contains ζ_4 but not ζ_8; so w_i^{(2)}(Q) = 2 for odd i and 2^{2+v_2(i)} for even i, which is 8 for i = 2.
3. The product is finite (N.4/finiteness-of-the-w-invariant): w_2(Q) = 8 · 3 = 24.

**Acceptance checks.**

1. w_2(Q) = 24, w_4(Q) = 240 = 2^4 · 3 · 5, w_6(Q) = 504 = 2^3 · 3^2 · 7, w_8(Q) = 480 = 2^5 · 3 · 5, w_10(Q) = 264 = 2^3 · 3 · 11, w_12(Q) = 65520 = 2^4 · 3^2 · 5 · 7 · 13.
2. Cross-check with Lemma VI.2.4: for i = 2k these are the denominators of B_k/4k with the topologists' Bernoulli numbers B_1, …, B_6 = 1/6, 1/30, 1/42, 1/30, 5/66, 691/2730; in particular B_5/20 = 1/264. The source's Example VI.2.1.2 prints w_10 = 1320 = 2^3 · 3 · 5 · 11, contradicting Lemma VI.2.4 and its own rule (5 − 1 = 4 does not divide 10); see source issue.
3. w_2(Q) = 24 is not the order 2 of the group of roots of unity of Q.
4. SpecialValuesBirchTate B.3 consumes w_2(Q) = 24, with |K_2(Z)| = 2 and ζ_Q(−1) = −1/12 = (−1)^1 · 2/24; this node does not depend on B.3, which lies downstream of N.4.

**Prerequisites.** [ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character](#node-arithmeticktheory-n-4-computing-w-from-the-cyclotomic-character); [ArithmeticKTheory:N.4/two-primary-w-invariant](#node-arithmeticktheory-n-4-two-primary-w-invariant); [ArithmeticKTheory:N.4/exceptional-fields-at-two](#node-arithmeticktheory-n-4-exceptional-fields-at-two); [ArithmeticKTheory:N.4/finiteness-of-the-w-invariant](#node-arithmeticktheory-n-4-finiteness-of-the-w-invariant); `mathlib:IsCyclotomicExtension.Rat.finrank`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.2, Example 2.1.2 (PDF p. 478; book p. 470). The values for even i, verbatim; all are correct except w_10, which is 264 (source issue).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4, Lemma 2.4 (PDF p. 480; book p. 472). The Bernoulli description used as the cross-check.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, before Lemma 2.4 (PDF p. 480). The Bernoulli convention and values used in the cross-check.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, after Birch-Tate Conjecture 8.6 (PDF p. 523; book p. 515). The value 24 in the Birch-Tate example, verbatim.

<a id="node-arithmeticktheory-n-4-exponent-criterion"></a>

### The exponent criterion for w_i^{(ℓ)}(F)

**Lemma · `ArithmeticKTheory:N.4/exponent-criterion`.** Let F be a field, ℓ a prime different from char F, i ∈ Z and ν ≥ 0. Then µ_{ℓ^ν}(i) ⊆ W_i(F) (equivalently, ℓ^ν divides w_i^{(ℓ)}(F) when it is finite) if and only if the Galois group Gal(F(ζ_{ℓ^ν})/F) has exponent dividing i. Hence w_i^{(ℓ)}(F) = max{ℓ^ν : Gal(F(ζ_{ℓ^ν})/F) has exponent dividing i} (K-book Lemma VI.2.2.1). This is the stage's 'cyclotomic-subfield test for divisibility by prime powers': for F = Q it reads ℓ^ν | w_i(Q) if and only if (ℤ/ℓ^ν)^× has exponent dividing i.

**Hypotheses and conventions.**

1. ℓ ≠ char F; the lemma holds for ℓ = 2 as well as for odd ℓ.
2. F(ζ_{ℓ^ν}) is the cyclotomic extension of F generated by a primitive ℓ^ν-th root of unity in F^s.

**Construction or proof.**

1. µ_{ℓ^ν}(i) is cyclic, generated by a primitive ℓ^ν-th root of unity ζ; it lies in W_i(F) if and only if g acts trivially on ζ for every g ∈ G_F, that is χ(g)^i ≡ 1 (mod ℓ^ν), where χ(g) mod ℓ^ν is modularCyclotomicCharacter(g).
2. G_F maps onto Gal(F(ζ_{ℓ^ν})/F), and Gal(F(ζ_{ℓ^ν})/F) → (ℤ/ℓ^ν)^× is injective (IsPrimitiveRoot.autToPow_injective, identified with the cyclotomic character by IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter); so the condition says that every element of Gal(F(ζ_{ℓ^ν})/F) has order dividing i, i.e. its Monoid.exponent divides i.
3. W_i^{(ℓ)}(F) is a subgroup of the ℓ-primary cyclic group ℤ/ℓ^∞(i), hence equal to µ_{ℓ^m}(i) for the largest admissible m, or to all of ℤ/ℓ^∞(i); this is the max formula.
4. The source's proof ends 'has exponent i', which must read 'has exponent dividing i' (source issue).

**Acceptance checks.**

1. F = Q, ℓ = 3, i = 2: (ℤ/3)^× has exponent 2, which divides 2, and (ℤ/9)^× has exponent 6, which does not; so w_2^{(3)}(Q) = 3.
2. F = Q, ℓ = 2, i = 2: (ℤ/8)^× has exponent 2 and (ℤ/16)^× has exponent 4; so w_2^{(2)}(Q) = 8.
3. F = Q, ℓ = 5, i = 2: (ℤ/5)^× has exponent 4, which does not divide 2; so 5 does not divide w_2(Q).
4. F = F_q, ℓ ∤ q: Gal(F_q(ζ_{ℓ^ν})/F_q) is generated by the Frobenius, of order the order of q modulo ℓ^ν, and the criterion returns the ℓ-part of q^i − 1.

**Prerequisites.** [ArithmeticKTheory:N.4/the-w-invariant](#node-arithmeticktheory-n-4-the-w-invariant); `mathlib:IsCyclotomicExtension`; `mathlib:modularCyclotomicCharacter`; `mathlib:IsPrimitiveRoot.autToPow_injective`; `mathlib:IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter`; `mathlib:Monoid.exponent`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.2.1, Lemma 2.2.1 (PDF p. 479; book p. 471). The criterion, verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.2.1, the proof (PDF p. 479). The proof, verbatim; its last clause has a misprint ('exponent i' for 'exponent dividing i').

<a id="node-arithmeticktheory-n-4-finiteness-of-the-w-invariant"></a>

### Finiteness of W_i(F) for a number field

**Theorem · `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`.** Let F be a number field and i ≠ 0. Then W_i(F) is finite. More precisely, every W_i^{(ℓ)}(F) is finite, and W_i^{(ℓ)}(F) = 0 whenever ℓ − 1 > |i|·[F : Q]; hence w_i(F) = ∏_{ℓ ≤ |i|[F:Q] + 1} w_i^{(ℓ)}(F) is a positive integer. This is the stage's 'prove finiteness for positive j', for all non-zero j. Positivity is part of the statement: w_i(F) ≥ 1 because W_i(F) is a finite group. SpecialValuesBirchTate B.1 imports this node for the finiteness and positivity of w_2(F) (RT-AREA-ktheory-1/10) and does not re-prove them.

**Hypotheses and conventions.**

1. F is a number field (finite over Q) and i ≠ 0.
2. For i = 0, or for F of infinite degree such as Q(µ_{ℓ^∞}), the statement fails.

**Construction or proof.**

1. For each ℓ, F(ζ_ℓ) is a number field and so has finitely many roots of unity (Mathlib's finiteness of NumberField.Units.torsion); hence a < ∞, and w_i^{(ℓ)}(F) is finite by Proposition VI.2.2 for odd ℓ and Proposition VI.2.3 for ℓ = 2.
2. Let ℓ be a prime with ℓ − 1 > |i|·[F : Q]. Then [F(ζ_ℓ) : Q] ≥ [Q(ζ_ℓ) : Q] = ℓ − 1 (IsCyclotomicExtension.Rat.finrank) and the tower law (Module.finrank_mul_finrank) give r = [F(ζ_ℓ) : F] ≥ (ℓ − 1)/[F : Q] > |i|, so r does not divide i and ζ_ℓ ∉ F.
3. By the exponent criterion with ν = 1 (Gal(F(ζ_ℓ)/F) is cyclic of order r), ℓ does not divide w_i^{(ℓ)}(F), i.e. W_i^{(ℓ)}(F) = 0.
4. Only finitely many primes remain, each with a finite component, so W_i(F) is finite.

**Acceptance checks.**

1. w_i(Q) involves only primes ℓ ≤ |i| + 1; for example w_12(Q) = 65520 = 2^4 · 3^2 · 5 · 7 · 13, and 13 = 12 + 1.
2. W_0(F) = µ(F^s) is infinite.
3. For F = Q(µ_{ℓ^∞}), which is not a number field, the ℓ-part of W_i(F) is infinite for every i with r | i.
4. F_q is not a number field, but W_i(F_q) is finite of order q^i − 1 for i ≥ 1 (Example VI.2.1.1).

**Prerequisites.** [ArithmeticKTheory:N.4/exponent-criterion](#node-arithmeticktheory-n-4-exponent-criterion); [ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character](#node-arithmeticktheory-n-4-computing-w-from-the-cyclotomic-character); [ArithmeticKTheory:N.4/two-primary-w-invariant](#node-arithmeticktheory-n-4-two-primary-w-invariant); `mathlib:NumberField.Units.torsion`; `mathlib:IsCyclotomicExtension.Rat.finrank`; `mathlib:Module.finrank_mul_finrank`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, Exercise 2.1 (PDF p. 482; book p. 474). The ℓ-primary finiteness, verbatim; the vanishing for large ℓ, which the global statement needs, is derived from Proposition 2.2(c) in the proof steps.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1, Definition 2.1, second half (PDF p. 477). The source writes w_i(F) only for a finite group; this node supplies finiteness for number fields.

<a id="node-arithmeticktheory-n-4-two-primary-w-invariant"></a>

### The 2-primary numbers w_i^{(2)}(F) (Proposition VI.2.3)

**Theorem · `ArithmeticKTheory:N.4/two-primary-w-invariant`.** Let F be a field of characteristic ≠ 2, a maximal such that F(√−1) contains a primitive 2^a-th root of unity (so a ≥ 2), and i = c2^b with c odd. Then (a) if √−1 ∈ F, w_i^{(2)}(F) = 2^{a+b} for all i; (b) if √−1 ∉ F and i is odd, w_i^{(2)}(F) = 2; (c) if √−1 ∉ F, F is exceptional and i is even, w_i^{(2)}(F) = 2^{a+b}; (d) if √−1 ∉ F, F is non-exceptional and i is even, w_i^{(2)}(F) = 2^{a+b−1}. This is where the description by a single cyclic tower at odd primes stops covering the dyadic cases.

**Hypotheses and conventions.**

1. char F ≠ 2; a ≤ ∞, and the values are infinite when a = ∞ (case (b) excepted).
2. In case (c) F has characteristic zero (exceptional fields do).

**Construction or proof.**

1. Let G ⊂ ℤ_2^× be the image of G_F under the 2-adic cyclotomic character and H the image of G_{F(√−1)}; as in Proposition VI.2.2, H = 1 + 2^a ℤ_2, and [G : H] = 1 or 2 according as √−1 ∈ F or not.
2. (a): G = 1 + 2^a ℤ_2 and v_2((1 + 2^a)^i − 1) = a + b for a ≥ 2; apply the exponent criterion.
3. (b): √−1 ∉ F gives g ∈ G with g ≡ 3 (mod 4), so g^i ≡ 3 (mod 4) for odd i and only µ_2 is fixed.
4. (c), the source's Exercise VI.2.2: an exceptional F has −1 ∈ G, so G = ±(1 + 2^a ℤ_2), and for even i the condition reduces to (1 + 2^a)^i ≡ 1 (mod 2^ν), i.e. ν ≤ a + b.
5. (d): a non-exceptional F with √−1 ∉ F has G topologically cyclic, generated by some g ≡ 3 (mod 4) with g^2 generating 1 + 2^a ℤ_2, so v_2(g^i − 1) = a + (b − 1) for even i.

**Acceptance checks.**

1. Q: exceptional, √−1 ∉ Q and a = 2, so w_i^{(2)}(Q) = 2 for odd i and 2^{2+v_2(i)} for even i: 8 for i = 2, 16 for i = 4.
2. Q(√−1): a = 2, so w_i^{(2)} = 4 for odd i and 8 for i = 2.
3. Q(√−2): non-exceptional with a = 3 (Q(√−2, √−1) = Q(ζ_8)), so w_2^{(2)}(Q(√−2)) = 2^{3+1−1} = 8; case (c) would wrongly give 16.
4. Q(√2): real, hence exceptional, with a = 3, so w_2^{(2)}(Q(√2)) = 16 and w_2(Q(√2)) = 48.
5. F_3 (characteristic 3, non-exceptional): a = 3 because F_9 ⊃ µ_8, so w_2^{(2)}(F_3) = 8, the 2-part of 3^2 − 1.

**Prerequisites.** [ArithmeticKTheory:N.4/the-w-invariant](#node-arithmeticktheory-n-4-the-w-invariant); [ArithmeticKTheory:N.4/exponent-criterion](#node-arithmeticktheory-n-4-exponent-criterion); [ArithmeticKTheory:N.4/exceptional-fields-at-two](#node-arithmeticktheory-n-4-exceptional-fields-at-two); `mathlib:cyclotomicCharacter`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.3, Proposition 2.3 (PDF p. 479; book p. 471). The proposition and case (a), verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.3, Proposition 2.3 (PDF p. 479). Cases (b)–(d), verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.3, after the proposition (PDF p. 479). The source's proof, which leaves (c) to an exercise.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, Exercise 2.2 (PDF p. 483; book p. 475). The exercise proving (c), with its hint.

<a id="layer-n-5"></a>

## N.5. Odd groups and integral torsion

Finite generation enters Soulé’s comparison. The e-invariant and Harris–Segal summands then connect twisted roots of unity to odd K-group torsion. Real-place extensions require the actual motivic/étale comparison, not a guess from cardinalities.

<a id="node-arithmeticktheory-n-5-totally-imaginary-integral-structure"></a>

### The odd K-groups of a totally imaginary field (Theorem VI.8.4, odd rows; Theorem VI.9.5(a))

**Theorem · `ArithmeticKTheory:N.5/totally-imaginary-integral-structure`.** Let F be a totally imaginary number field (no real place) with r_2 complex places and O_S the ring of S-integers for a finite set S of finite places. For every n = 2i − 1 ≥ 3, K_n(O_S) ≅ K_n(F) ≅ ℤ^{r_2} ⊕ ℤ/w_i(F), where w_i(F) is the order of W_i(F) = H^0(F; ℚ/ℤ(i)) of N.4. The torsion subgroup is cyclic of order w_i(F), its ℓ-primary part being identified with W_i(F){ℓ} for every prime ℓ including ℓ = 2 (N.5/odd-torsion-at-a-prime-where-cd-is-two, available at 2 because F has no real place); the free summand is not canonical. The theorem covers exceptional totally imaginary fields such as ℚ(√−7). The other rows of Theorem VI.8.4 are owned elsewhere: n = 0 and n = 1 by N.1 (K_0 = ℤ ⊕ Pic(O_S), K_1 = O_S^× ≅ ℤ^{r_2+|S|−1} ⊕ μ(F) with μ(F) cyclic of order w_1(F)), and n = 2i ≥ 2 by N.6/even-groups-of-a-totally-imaginary-field, which N.5 cannot import because N.6 lies downstream of N.5.

**Hypotheses and conventions.**

1. F is a number field with NumberField.IsTotallyComplex F, equivalently nrRealPlaces F = 0 (mathlib:NumberField.nrRealPlaces_eq_zero_iff); r_2 = nrComplexPlaces F.
2. S is a finite set of finite places; for odd n ≥ 3 the group does not depend on S (N.5/soule-theorem).
3. n = 2i − 1 ≥ 3, that is i ≥ 2.

**Construction or proof.**

1. K_n(O_S) ≅ K_n(F) for odd n ≥ 3 (N.5/soule-theorem).
2. K_n(O_S) is finitely generated of rank r_2: for r_1 = 0 both classes n ≡ 1 and n ≡ 3 (mod 4) of N.3/finiteness-and-ranks-combined give r_2. By the structure theorem (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod) K_n(O_S) ≅ ℤ^{r_2} ⊕ T with T finite.
3. T = ⊕_ℓ T{ℓ} and T{ℓ} ≅ ℤ/w_i^{(ℓ)}(F) for every prime ℓ by N.5/odd-torsion-at-a-prime-where-cd-is-two, whose hypothesis at ℓ = 2 holds because F is totally imaginary.
4. w_i(F) = ∏_ℓ w_i^{(ℓ)}(F) (N.4/the-w-invariant), so ⊕_ℓ ℤ/w_i^{(ℓ)}(F) ≅ ℤ/w_i(F) by the Chinese remainder theorem.

**Acceptance checks.**

1. K_3(ℤ[i]) ≅ ℤ ⊕ ℤ/24, K_7(ℤ[i]) ≅ ℤ ⊕ ℤ/240 and K_{4k+1}(ℤ[i]) ≅ ℤ ⊕ ℤ/4 for k > 0 (Exercise VI.8.5): r_2 = 1, w_2(ℚ(i)) = w_2(ℚ) = 24, w_4 = 240 and w_i(ℚ(i)) = 4 for odd i (Example VI.2.1.2).
2. Exceptional totally imaginary fields such as ℚ(√−7) are covered; no non-exceptionality hypothesis is used.
3. This is not the real-embedding table read at r_1 = 0: for ℚ(i) and n = 3 the torsion is ℤ/24 = ℤ/w_2, not ℤ/2w_2, and for n = 5 it is ℤ/4 = ℤ/w_3, not ℤ/(w_3/2).

**Prerequisites.** [ArithmeticKTheory:N.5/soule-theorem](#node-arithmeticktheory-n-5-soule-theorem); [ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two](#node-arithmeticktheory-n-5-odd-torsion-at-a-prime-where-cd-is-two); [ArithmeticKTheory:N.3/finiteness-and-ranks-combined](#node-arithmeticktheory-n-3-finiteness-and-ranks-combined); [ArithmeticKTheory:N.4/the-w-invariant](#node-arithmeticktheory-n-4-the-w-invariant); `mathlib:NumberField.IsTotallyComplex`; `mathlib:NumberField.nrRealPlaces_eq_zero_iff`; `mathlib:NumberField.InfinitePlace.nrComplexPlaces`; `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.4, Theorem 8.4 (PDF p. 522; book p. 514). Theorem 8.4; this node states its odd row n = 2i − 1 ≥ 3, the rows n = 0, 1 being N.1's and the row n = 2i ≥ 2 N.6's.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.4, proof (PDF p. 522; book p. 514). The proof: ranks from the classical data, torsion from Theorem 8.2 (proof steps 2 and 3).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.4, the sentence before the theorem (PDF p. 522; book p. 514). The scope of the theorem, which includes exceptional totally imaginary fields.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5, Theorem 9.5, opening and part (a) (PDF p. 527; book p. 519). The same row restated as Theorem 9.5(a), with K_n(O_S) ≅ K_n(F).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI, Exercise 8.5 (PDF p. 524; book p. 516). The worked instances used in the acceptance.

<a id="node-arithmeticktheory-n-5-the-real-case-modulo-eight"></a>

### The odd K-groups of a number field with a real embedding (Theorem VI.9.5(b))

**Theorem · `ArithmeticKTheory:N.5/the-real-case-modulo-eight`.** Let F be a number field with r_1 > 0 real embeddings and r_2 complex places, and O_S a ring of S-integers in F. For each odd n ≥ 3, with i = (n + 1)/2, K_n(O_S) ≅ K_n(F) and K_n(F) ≅ ℤ^{r_1+r_2} ⊕ ℤ/w_i(F) for n ≡ 1 (mod 8); ℤ^{r_2} ⊕ ℤ/2w_i(F) ⊕ (ℤ/2)^{r_1−1} for n ≡ 3 (mod 8); ℤ^{r_1+r_2} ⊕ ℤ/(w_i(F)/2) for n ≡ 5 (mod 8); ℤ^{r_2} ⊕ ℤ/w_i(F) for n ≡ 7 (mod 8). In the class n ≡ 5 (mod 8) the index i is odd, so w_i^{(2)}(F) = 2 and w_i(F)/2 is an odd integer: K_n(F) has no two-primary torsion. These groups are determined by r_1, r_2 and w_i(F). The direct-sum decompositions are of abstract groups and are not natural; what is natural is the identification of the ℓ-primary torsion through the comparison maps (N.5/odd-torsion-at-a-prime-where-cd-is-two for ℓ odd, and for ℓ = 2 the ℚ_2/ℤ_2-coefficient computation of MotivicEtaleKTheory M.7, Theorem VI.9.4, induced by the morphism to the real places), including the non-split extension that produces ℤ/2w_i(F) ⊕ (ℤ/2)^{r_1−1}.

**Hypotheses and conventions.**

1. r_1 = nrRealPlaces F > 0. The hypothesis is essential: for a totally imaginary field the classes n ≡ 3 and n ≡ 5 (mod 8) have torsion ℤ/w_i(F) (N.5/totally-imaginary-integral-structure), and (ℤ/2)^{r_1−1} is undefined for r_1 = 0.
2. O_S is any ring of S-integers; since n is odd, K_n(O_S) ≅ K_n(F) ≅ K_n(O_S[1/2]) (N.5/soule-theorem), so one may assume 1/2 ∈ O_S, which Theorem VI.9.4 requires.
3. w_i(F) = ∏_ℓ w_i^{(ℓ)}(F). Every real number field is exceptional and does not contain √−1, so w_i^{(2)}(F) = 2 for odd i (Proposition VI.2.3(b), N.4/exceptional-fields-at-two).
4. The dyadic calculation is MotivicEtaleKTheory M.7's and is imported, not repeated (RT-AREA-ktheory-1/3): Theorem VI.9.4 with Lemma VI.9.3, the spectral sequences of ℝ (Theorem VI.9.1, Variant VI.9.1.2), whose differentials M.7 fixes from Suslin's K_n(ℝ; ℤ/m) ≅ π_n(BO; ℤ/m) for n ≥ 1 (K-book VI.3.1) and real topological K-theory, and the real-place maps α^n_S(i) with the extension data they detect. This node uses only that output: the groups K_{n+1}(R; ℚ_2/ℤ_2), the maps to ⊕_{real} K_*(ℝ; ℚ_2/ℤ_2) and the extensions, and performs no second spectral-sequence computation.

**Construction or proof.**

1. Replace O_S by R = O_S[1/2], which contains O_F[1/2] (N.5/soule-theorem).
2. Rank: r_1 + r_2 for n ≡ 1 (mod 4) and r_2 for n ≡ 3 (mod 4) (N.3/finiteness-and-ranks-combined), so K_n(R) ≅ ℤ^r ⊕ T with T finite (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod).
3. Odd torsion: T{ℓ} ≅ ℤ/w_i^{(ℓ)}(F) for every odd ℓ (N.5/odd-torsion-at-a-prime-where-cd-is-two).
4. Two-primary torsion: K_{n+1}(R) is finite, so T{2} ≅ K_{n+1}(R; ℚ_2/ℤ_2) by the universal coefficient sequence (StableHomotopyKTheory H.6). Read it off from Theorem VI.9.4, imported from MotivicEtaleKTheory M.7 together with its real-place maps and extension data (no spectral-sequence computation here) in degree n + 1 ≡ 2, 4, 6, 0 (mod 8): ℤ/2 = ℤ/w_i^{(2)}(F) for i = 4k + 1; ℤ/2w_{4k+2}^{(2)}(F) ⊕ (ℤ/2)^{r_1−1}; 0; and ℤ/w_{4k+4}^{(2)}(F) (the row n + 1 = 8(k + 1) of Theorem VI.9.4, where the source's w_{4k}(F) is the two-primary w^{(2)}), using w_i^{(2)}(F) = 2 for odd i (N.4/exceptional-fields-at-two).
5. Assemble T = T{2} ⊕ ⊕_{ℓ odd} T{ℓ} with the Chinese remainder theorem: for n ≡ 3 (mod 8) the factor ℤ/2w_i^{(2)} combines with the odd parts to ℤ/2w_i(F); for n ≡ 5 (mod 8) the two-primary part is 0 and the odd part is ℤ/(w_i(F)/2), an integer because w_i^{(2)}(F) = 2.

**Acceptance checks.**

1. K_3(ℤ) ≅ ℤ/48 = ℤ/2w_2(ℚ) (r_1 = 1, r_2 = 0, (ℤ/2)^0 = 0), the value of Lee and Szczarba quoted in Example VI.2.1.2.
2. K_5(ℚ) ≅ ℤ since w_3(ℚ) = 2 (Example VI.9.5.1); K_7(ℤ) ≅ ℤ/240 = ℤ/w_4(ℚ); K_9(ℤ) ≅ ℤ ⊕ ℤ/2 since w_5(ℚ) = 2.
3. F = ℚ(√2), r_1 = 2, r_2 = 0, n = 3: w_2(F) = 48 (two-primary part 2^{a+b} = 2^{3+1} = 16 by Proposition VI.2.3(c) with a = 3 because F(√−1) = ℚ(ζ_8), three-part 3 by Proposition VI.2.2, and no other prime), so K_3(ℤ[√2]) ≅ ℤ/96 ⊕ ℤ/2.
4. The hypothesis r_1 > 0 cannot be dropped: for ℚ(i) the classes n = 3 and n = 5 give ℤ ⊕ ℤ/24 and ℤ ⊕ ℤ/4 (Exercise VI.8.5), not ℤ ⊕ ℤ/48 ⊕ (ℤ/2)^{−1} and ℤ ⊕ ℤ/2.
5. Matching orders is not a proof: ℤ/2w_i ⊕ (ℤ/2)^{r_1−1} and ℤ/2^{r_1}w_i have the same order; the proof identifies the torsion through the comparison maps of N.5/odd-torsion-at-a-prime-where-cd-is-two and MotivicEtaleKTheory M.7.

**Prerequisites.** [ArithmeticKTheory:N.5/soule-theorem](#node-arithmeticktheory-n-5-soule-theorem); [ArithmeticKTheory:N.3/finiteness-and-ranks-combined](#node-arithmeticktheory-n-3-finiteness-and-ranks-combined); [ArithmeticKTheory:N.3:ranks/borel-rank-theorem](#node-arithmeticktheory-n-3-ranks-borel-rank-theorem); [ArithmeticKTheory:N.4/the-w-invariant](#node-arithmeticktheory-n-4-the-w-invariant); [ArithmeticKTheory:N.4/exceptional-fields-at-two](#node-arithmeticktheory-n-4-exceptional-fields-at-two); [ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two](#node-arithmeticktheory-n-5-odd-torsion-at-a-prime-where-cd-is-two); `MotivicEtaleKTheory:M.7`; `StableHomotopyKTheory:H.6`; `mathlib:NumberField.InfinitePlace.nrRealPlaces`; `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5, Theorem 9.5, opening and part (a) (PDF p. 527; book p. 519). The opening of Theorem 9.5, with K_n(O_S) ≅ K_n(F).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5, Theorem 9.5(b) (PDF p. 527; book p. 519). The four rows modulo eight, which this node states.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5, the remark after the theorem (PDF p. 527; book p. 519). What the groups are determined by; the abstract groups, not the maps.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5, proof (PDF p. 528; book p. 520). The proof: odd torsion from Theorem 8.2, two-primary torsion from Theorem 9.4 through universal coefficients (proof steps 3 and 4).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5.1, Example 9.5.1 (PDF p. 528; book p. 520). The divisibility in the class n ≡ 5 (mod 8): w_i(F)/2 is odd.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.3, Proposition 2.3(b) and the remark after it (PDF p. 479; book p. 471). w_i^{(2)}(F) = 2 for odd i when √−1 ∉ F, and every real number field is exceptional.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.2, Example 2.1.2, second paragraph (PDF p. 478; book p. 470). The value K_3(ℤ) ≅ ℤ/48 used in the acceptance.

<a id="node-arithmeticktheory-n-5-soule-theorem"></a>

### Soulé's theorem: the K-groups of the S-integers and of the field agree in odd degrees

**Theorem · `ArithmeticKTheory:N.5/soule-theorem`.** Let F be a number field, S a finite set of nonzero primes of 𝓞_F and R = O_{F,S}. Then K_n(R) → K_n(F) is an isomorphism for every odd n ≥ 3, and for every even n ≥ 2 the localisation sequence breaks up into short exact sequences 0 → K_n(R) → K_n(F) → ⊕_{𝔭∉S} K_{n−1}(k(𝔭)) → 0; equivalently SK_n(R) := ker(K_n(R) → K_n(F)) = 0 for all n ≥ 1. This is an additional theorem, not a consequence of exactness. The source states it for every Dedekind domain whose fraction field is a global field; this node states the case of rings of S-integers of number fields, which is the roadmap's.

**Hypotheses and conventions.**

1. F is a number field and S finite. The function-field case needs Bass–Milnor–Serre's Variant III.2.5.1 and Quillen's theorem for affine curves over finite fields, which KTheoryLowDegrees U.4 (number fields only) does not supply.
2. For Dedekind domains not of finite type, such as ℤ_(p), the source's proof cites IV.6.9 outside its hypotheses (K₁(ℤ_(p)) = ℤ_(p)^× is not finitely generated); the statement follows there by a filtered colimit over rings of S-integers (sourceIssues).
3. The node lives in N.5, whose text asks for it ('Prove K_{2j−1}(O_{F,S}) ≅ K_{2j−1}(F) for j≥2'): its proof uses N.3:finite-generation, and a proof in N.2 would close the stage cycle N.2 → N.3:finite-generation → N.2.

**Construction or proof.**

1. Reduction: if SK_n(R) = 0 for all n ≥ 1, the maps ⊕ K_n(k(𝔭)) → K_n(R) vanish and (6.6) breaks into 0 → K_n(R) → K_n(F) → ⊕ K_{n−1}(k(𝔭)) → 0; for odd n ≥ 3 the right-hand term is 0 (n − 1 even, L.1), so K_n(R) ≅ K_n(F).
2. n = 1: SK₁(O_{F,S}) = 0, Bass–Milnor–Serre (U.4).
3. n even: N.2/even-degree-injectivity.
4. n = 2i − 1 ≥ 3: SK_n(R) is the image of the torsion group ⊕ K_n(k(𝔭)) and K_n(R) is finitely generated (N.3:finite-generation), so SK_n(R) is finite; choose ℓ annihilating the torsion of K_n(R), so that SK_n(R) injects into K_n(R)/ℓ ⊆ K_n(R; ℤ/ℓ).
5. K_n(R; ℤ/ℓ) → K_n(F; ℤ/ℓ) is injective for odd n: by the mod-ℓ localisation sequence this is the surjectivity of ∂ in N.5/soule-mod-l-surjectivity.
6. SK_n(R) maps to 0 in K_n(F), hence in K_n(F; ℤ/ℓ), so it is 0.

**Acceptance checks.**

1. n = 2: 0 → K₂(O_{F,S}) → K₂(F) → ⊕_{𝔭∉S} k(𝔭)^× → 0, which K2SymbolsBrauer T.5 proves directly from K₂(𝔽_q) = 0 and SK₁ = 0; the two must agree.
2. The corresponding statement in degree zero is false: ker(K₀(R) → K₀(F)) = Pic(R), ≅ ℤ/2 for 𝓞 of ℚ(√−5).
3. Both O_F and O_{F,S} have the odd K-groups of F in degrees ≥ 3, so K_n(O_F) ≅ K_n(O_{F,S}) there.

**Prerequisites.** [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); [ArithmeticKTheory:N.2/even-degree-injectivity](#node-arithmeticktheory-n-2-even-degree-injectivity); [ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers](#node-arithmeticktheory-n-3-finite-generation-finite-generation-of-k-of-s-integers); [ArithmeticKTheory:N.5/soule-mod-l-surjectivity](#node-arithmeticktheory-n-5-soule-mod-l-surjectivity); `KTheoryLowDegrees:U.4`; `KTheoryFiniteLocalFields:L.1`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8 (PDF p. 420; book p. 412). The theorem, in the source's generality.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, proof (PDF p. 420; book p. 412). The reduction and the degree-one case.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, proof (PDF p. 420; book p. 412). The odd-degree argument.

**Open inputs.** K-theory with finite coefficients has no supplier stage. See the gap register.

<a id="node-arithmeticktheory-n-5-soule-mod-l-surjectivity"></a>

### Soulé's surjectivity of the boundary with finite coefficients

**Theorem · `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`.** Let F be a number field, S a finite set of nonzero primes and R = O_{F,S} (the source: any Dedekind domain whose fraction field is a global field). For every ℓ ≥ 2 and every even n ≥ 2 the boundary ∂ : K_n(F; ℤ/ℓ) → ⊕_𝔭 K_{n−1}(R/𝔭; ℤ/ℓ) of the localisation sequence with ℤ/ℓ coefficients is onto; equivalently K_{n−1}(R; ℤ/ℓ) → K_{n−1}(F; ℤ/ℓ) is injective.

**Hypotheses and conventions.**

1. K-theory with ℤ/ℓ coefficients, its localisation sequence (V.5.2), the product on K_*(R; ℤ/ℓ) for ℓ ≢ 2 (mod 4) (IV.2.8) and the Bott element (IV.2.5.2) have no supplier stage in the atlas (gap).
2. The analogue for n = 1 fails exactly when Pic(R)/ℓ ≠ 0 (the source says it is false; sourceIssues).

**Construction or proof.**

1. Replace ℓ by 2ℓ if necessary so that ℓ ≢ 2 (mod 4): K_{n−1}(R/𝔭)/2ℓ surjects onto K_{n−1}(R/𝔭)/ℓ, and the product on K_*(R; ℤ/ℓ) is defined.
2. n = 2: K₁(R; ℤ/ℓ) → K₁(F; ℤ/ℓ) is injective (Ex. IV.2.3), which is the claim.
3. n = 2i, ζ_ℓ ∈ R: with β ∈ K₂(R; ℤ/ℓ) the Bott element, multiplication by β^{i−1} is onto ⊕ K_{2i−1}(R/𝔭; ℤ/ℓ) from ⊕ K₁(R/𝔭)/ℓ (IV.1.13, L.1); lift a ∈ ⊕ K₁(R/𝔭)/ℓ to s ∈ K₂(F; ℤ/ℓ) by the case n = 2; then ∂(β^{i−1}s) = β^{i−1}∂(s) = β^{i−1}a by K_*(R)-linearity of ∂.
4. General case: pass to R′, the integral closure of R in F′ = F(ζ_ℓ); every 𝔭 has a 𝔭′ over it and the transfers K_{2i−1}(R′/𝔭′) → K_{2i−1}(R/𝔭) are onto (IV.1.13, L.1); conclude by the morphism of localisation sequences with coefficients (N.2/localisation-sequence-and-finite-extensions).

**Acceptance checks.**

1. n = 2, R = ℤ: ∂ : K₂(ℚ; ℤ/ℓ) → ⊕_p 𝔽_p^×/ℓ is onto.
2. The statement is about coefficients: the integral boundary K_n(F) → ⊕ K_{n−1}(R/𝔭) is onto for even n by N.5/soule-theorem, whose proof uses this node.
3. For n = 1 and R = 𝓞 of ℚ(√−5), ℓ = 2, the analogous map K₁(F; ℤ/2) → ⊕ ℤ/2 is not onto, its cokernel being Pic(R)/2 ≅ ℤ/2.

**Prerequisites.** [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); [ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions](#node-arithmeticktheory-n-2-localisation-sequence-and-finite-extensions); `KTheoryFiniteLocalFields:L.1`; [ArithmeticKTheory:N.1/S-integers-in-a-finite-extension](#node-arithmeticktheory-n-1-s-integers-in-a-finite-extension).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.1 (PDF p. 420; book p. 412). The proposition.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.1, proof (PDF p. 421; book p. 413). The first reduction.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.1, proof (PDF p. 421; book p. 413). The passage to F(ζ_ℓ).

**Open inputs.** K-theory with finite coefficients has no supplier stage. See the gap register.

<a id="node-arithmeticktheory-n-5-e-invariant"></a>

### The e-invariant

**Definition · `ArithmeticKTheory:N.5/e-invariant`.** For a field F with separable closure F^s, G = Gal(F^s/F), and i ≥ 1, the e-invariant is the natural map e : K_{2i−1}(F)_tors → K_{2i−1}(F^s)^G_tors ≅ µ(i)^G = W_i(F) induced by F → F^s; it is defined because K_*(F) → K_*(F^s) is G-equivariant with G acting trivially on K_*(F), and the identification of K_{2i−1}(F^s)_tors with µ(i) as a G-module is Suslin's (K-book Proposition VI.1.7.1 and Exercise VI.1.1). Its ℓ-primary component is e^{(ℓ)} : K_{2i−1}(F){ℓ} → W_i^{(ℓ)}(F). For a ring of S-integers it is composed with K_{2i−1}(𝓞_{F,S}) → K_{2i−1}(F). The e-invariant is natural in F.

**Hypotheses and conventions.**

1. F is a field and i ≥ 1; the arithmetic cases are number fields and their rings of S-integers.
2. The G-isomorphism K_{2i−1}(F^s)_tors ≅ µ(i) is imported; see the gap on its owner.
3. This node belongs to N.5, not N.4: N.4's stage text defines W_j(F) without K-theory, while N.5's text requires 'the e-invariant/Chern maps, their kernels and the extension classes used to obtain them' to be natural.

**Construction or proof.**

1. Functoriality of K-theory along F → F^s and along the automorphisms of F^s (GeneralAlgebraicKTheory K.1) makes K_{2i−1}(F) → K_{2i−1}(F^s)^G well defined, and it preserves torsion.
2. Import the G-isomorphism K_{2i−1}(F^s)_tors ≅ µ(i) (Proposition VI.1.7.1, through the rigidity theorems of MotivicEtaleKTheory M.7).
3. Compose with µ(i)^G = W_i(F) (N.4/the-w-invariant).
4. Naturality: for E/F finite separable, e_E composed with K_{2i−1}(F) → K_{2i−1}(E) equals the restriction W_i(F) → W_i(E) composed with e_F.

**Acceptance checks.**

1. For F_q, e is an isomorphism K_{2i−1}(F_q) ≅ Z/(q^i − 1) (Example VI.2.1.1).
2. For Q and i = 2, e : K_3(Q) ≅ Z/48 → W_2(Q) ≅ Z/24 is not injective (Example VI.2.1.2).

**Prerequisites.** [ArithmeticKTheory:N.4/the-w-invariant](#node-arithmeticktheory-n-4-the-w-invariant); `MotivicEtaleKTheory:M.7`; `GeneralAlgebraicKTheory:K.1`.

**Library API.**

- `TauCeti.eInvariant` (data): e : K_{2i−1}(F)_tors →+ W_i(F), for i ≥ 1.
- `TauCeti.eInvariant.primary` (projection): Its ℓ-primary component K_{2i−1}(F){ℓ} →+ W_i^{(ℓ)}(F).
- `TauCeti.eInvariant_natural` (functoriality): For E/F finite separable, e_E ∘ K_{2i−1}(F → E) = WInvariant.res ∘ e_F.
- `TauCeti.eInvariant_one` (compatibility): For i = 1, under K_1(F) = F^×, e is the identity of µ(F) = W_1(F).
- `TauCeti.eInvariant_finiteField_bijective` (example): For F_q, e : K_{2i−1}(F_q) → W_i(F_q) is a bijection.

**Discriminating unit tests.**

- `TauCeti.eInvariant_finiteField_bijective` (computation): For F_q and i ≥ 1, e : K_{2i−1}(F_q) ≅ Z/(q^i − 1) → W_i(F_q) ≅ Z/(q^i − 1) is an isomorphism.
- `TauCeti.eInvariant_rat_three_not_injective` (non-example): For Q and i = 2, K_3(Q) ≅ Z/48 and W_2(Q) ≅ Z/24, so e is not injective; it kills the symbol {−1, −1, −1} (Remark VI.2.1.3).
- `TauCeti.eInvariant_sepClosed` (degenerate): If F is separably closed, G is trivial and e is the identification K_{2i−1}(F)_tors ≅ µ(i).
- `TauCeti.eInvariant_one` (compatibility): For i = 1, e : µ(F) = K_1(F)_tors → W_1(F) = µ(F) is the identity.

**Consumers.**

- N.5/harris-segal-summand (K-book Theorem VI.2.5): the Harris-Segal summand is the one on which e is an isomorphism.
- N.5/the-real-case-modulo-eight and N.6/the-two-primary-corrections: the stage text requires the e-invariant and the Chern maps to be natural; the natural identifications are imported from MotivicEtaleKTheory M.7 and M.8, and the tables are proved through them.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1, Definition 2.1, first half (PDF p. 477; book p. 469). The definition, verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.1.7.1 (PDF p. 476; book p. 468). The identification the definition uses, verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.2 (PDF p. 478). The non-injectivity for Q, verbatim.

**Open inputs.** No stage names Suslin's computation of the torsion of K_*(F^s). See the gap register.

<a id="node-arithmeticktheory-n-5-harris-segal-summand"></a>

### The Harris–Segal summand

**Theorem · `ArithmeticKTheory:N.5/harris-segal-summand`.** Let F be a number field, ℓ a prime and i ≥ 1; if ℓ = 2 assume F non-exceptional. Put w = w_i^{(ℓ)}(F). Then K_{2i−1}(F) has a direct summand isomorphic to Z/w on which the e-invariant is an isomorphism onto W_i^{(ℓ)}(F), and so has K_{2i−1}(𝓞_{F,S}) for every finite S. For an exceptional F at ℓ = 2 only the weaker Remark VI.2.5.1 is available: a cyclic summand of order w_i(F), 2w_i(F) or w_i(F)/2; for real number fields Theorem VI.2.6 (extracted from Theorem VI.9.5, N.5/the-real-case-modulo-eight) says which.

**Hypotheses and conventions.**

1. F is a number field. The source states the theorem for any field with 1/ℓ ∈ F and for integrally closed domains with fraction field F, but its proof reduces to subrings of cyclotomic fields and so covers characteristic zero only; this node is restricted to number fields and their rings of S-integers.
2. At ℓ = 2, F is non-exceptional (N.4/exceptional-fields-at-two); every real number field is exceptional and is excluded.

**Construction or proof.**

1. Case ζ_ℓ ∈ F (ζ_4 ∈ F if ℓ = 2): with m = ℓ^a the number of ℓ-primary roots of unity in F, w_i^{(ℓ)}(Q(ζ_m)) = w (Propositions VI.2.2 and VI.2.3), which reduces the claim to R = Z[ζ_m].
2. Choose a prime p ≢ 1 (mod ℓ^{a+1}) and 𝔭 over p; the residue field is F_q = F_p(ζ_m) with w_i^{(ℓ)}(F_q) = w, and for the local field E = Q_p(ζ_m) the e-invariant K_{2i−1}(E){ℓ} → Z/w is an isomorphism (Example VI.2.3.1 and Exercise VI.1.3; KTheoryFiniteLocalFields L.2).
3. By Corollary VI.1.5.2 (Harris and Segal's theorem, quoted as Theorem VI.1.5, together with Soulé's K_{2i−1}(Z[ζ_m]) ≅ K_{2i−1}(Q(ζ_m)), N.2), K_{2i−1}(R) has a cyclic summand A of order w mapping isomorphically onto the ℓ-part of K_{2i−1}(F_q) (KTheoryFiniteLocalFields L.1); hence A ≅ K_{2i−1}(E){ℓ} and e is an isomorphism on A.
4. Case ζ_ℓ ∉ F: reduce (Exercise VI.2.5) to F ⊂ Q(ζ_m) = F(ζ_ℓ) with r = [Q(ζ_m) : F] dividing i; for the transfer f_* along the Galois extension (N.1/norms-transfers-and-pullbacks), f^* f_* is multiplication by r on the Galois-fixed summand A, so f_*(A) is a summand of K_{2i−1}(R) on which e is an isomorphism.
5. Case ℓ = 2, F non-exceptional and √−1 ∉ F: F has index 2 in Q(ζ_m) = F(√−1), w_i^{(2)}(Q(ζ_m)) = 2w, and the image under f_* of the summand of order 2w is a summand of order w (the source's diagram).
6. Harris and Segal's theorem on K_*(B(µ_m ≀ Σ_∞)^+) is quoted by the source, not proved; see the gap.

**Acceptance checks.**

1. For Q, ℓ = 3 and i = 2, K_3(Q) ≅ Z/48 has a summand Z/3 detected by e (w_2^{(3)}(Q) = 3).
2. For Q(√−1) and i = 2 (non-exceptional, √−1 ∈ F), K_3(Q(√−1)) has summands Z/8 (ℓ = 2) and Z/3 (ℓ = 3), together Z/24 = Z/w_2(Q(√−1)), in agreement with K_3(Q(i)) ≅ Z ⊕ Z/24 in N.8.
3. For Q at ℓ = 2 the theorem does not apply (Q is exceptional); there the Harris-Segal summand of K_3(Q) ≅ Z/48 is Z/2w_2(Q) (Theorem VI.2.6(2), i ≡ 2 (mod 4)).

**Prerequisites.** [ArithmeticKTheory:N.5/e-invariant](#node-arithmeticktheory-n-5-e-invariant); [ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character](#node-arithmeticktheory-n-4-computing-w-from-the-cyclotomic-character); [ArithmeticKTheory:N.4/two-primary-w-invariant](#node-arithmeticktheory-n-4-two-primary-w-invariant); [ArithmeticKTheory:N.4/exceptional-fields-at-two](#node-arithmeticktheory-n-4-exceptional-fields-at-two); [ArithmeticKTheory:N.5/soule-theorem](#node-arithmeticktheory-n-5-soule-theorem); [ArithmeticKTheory:N.1/norms-transfers-and-pullbacks](#node-arithmeticktheory-n-1-norms-transfers-and-pullbacks); `KTheoryFiniteLocalFields:L.1`; `KTheoryFiniteLocalFields:L.2`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.5, Harris-Segal Theorem 2.5 (PDF p. 481; book p. 473). The theorem for the field, verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.5, Harris-Segal Theorem 2.5, continued (PDF p. 481). The ring form, verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.5, the proof (PDF p. 481). The first reduction of the proof, verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.1.5.2 (PDF p. 475; book p. 467). The input from Harris and Segal's theorem, verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.5.1, Remark 2.5.1 (PDF p. 482; book p. 474). The exceptional case, verbatim.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.6, Theorem 2.6 (PDF p. 482). The orders for real number fields (display flattened, the 'i.e.' clauses elided).

**Open inputs.** Harris and Segal's theorem is quoted, not proved. See the gap register.

<a id="node-arithmeticktheory-n-5-odd-torsion-at-a-prime-where-cd-is-two"></a>

### The odd K-groups at a prime where the cohomological dimension is two (Theorem VI.8.2, odd rows)

**Theorem · `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`.** Let F be a number field with r_1 real and r_2 complex places, O_S a ring of S-integers in F, and ℓ a prime; if ℓ = 2 suppose F totally imaginary. For every n = 2i − 1 ≥ 3 the localisation of K_n(O_S) at ℓ is K_n(O_S)_(ℓ) ≅ ℤ_(ℓ)^{r_2} ⊕ ℤ/w_i^{(ℓ)}(F) when i is even and ℤ_(ℓ)^{r_1+r_2} ⊕ ℤ/w_i^{(ℓ)}(F) when i is odd. Equivalently the ℓ-primary torsion K_n(O_S){ℓ} is cyclic of order w_i^{(ℓ)}(F), and it is identified with H^0_et(O_S[1/ℓ]; ℚ_ℓ/ℤ_ℓ(i)) = W_i(F){ℓ} through K_{2i−1}(R){ℓ} ≅ K_{2i}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^0(R; ℚ_ℓ/ℤ_ℓ(i)), R = O_S[1/ℓ]; these identifications are induced by the comparison maps of MotivicEtaleKTheory M.7 (the étale Chern classes of M.8) and are natural for O_S ⊂ O_{S'}. The free summand is not canonical.

**Hypotheses and conventions.**

1. ℓ is any prime; for ℓ = 2 the field is totally imaginary. This is exactly the case in which the étale ℓ-cohomological dimension of O_S[1/ℓ] is two: for ℓ odd it is two for every number field, for ℓ = 2 it is two unless F has a real embedding (source, proof of VI.8.2).
2. n = 2i − 1 ≥ 3; the ranks are Borel's (N.3); degree one is N.1's S-unit group and is not covered.
3. w_i^{(ℓ)}(F) is the order of W_i(F){ℓ} = H^0(F; ℚ_ℓ/ℤ_ℓ(i)), finite for i ≥ 1 (N.4/the-w-invariant).

**Construction or proof.**

1. Set R = O_S[1/ℓ]. For each prime 𝔭 of O_S over ℓ the groups K_m(O_S/𝔭), m ≥ 1, are finite of order prime to ℓ (Quillen's computation, KTheoryFiniteLocalFields L.1: K_{2j}(𝔽_q) = 0 and K_{2j−1}(𝔽_q) ≅ ℤ/(q^j − 1) with q a power of ℓ), so the localisation sequence of N.2/localisation-sequence-for-a-dedekind-domain for O_S ⊂ R gives K_n(O_S)_(ℓ) ≅ K_n(R)_(ℓ). (The source writes K_{n−1}(R/𝔭); R/𝔭 = 0, and the residue field meant is O_S/𝔭.)
2. K_n(R) is finitely generated of the rank of N.3/finiteness-and-ranks-combined, and K_{n+1}(R) is finite; by the universal coefficient sequence for ℚ_ℓ/ℤ_ℓ coefficients (StableHomotopyKTheory H.6; the source's Ex. IV.2.6) K_n(R){ℓ} ≅ K_{n+1}(R; ℚ_ℓ/ℤ_ℓ).
3. Import from MotivicEtaleKTheory M.7: since the ℓ-cohomological dimension of R is two and H^2(R; ℚ_ℓ/ℤ_ℓ(i)) = 0 (source Ex. VI.8.1), the descent spectral sequence with ℚ_ℓ/ℤ_ℓ coefficients has one nonzero term in each total degree and K_{2i}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^0(R; ℚ_ℓ/ℤ_ℓ(i)) for i ≥ 1, naturally in R.
4. H^0(R; ℚ_ℓ/ℤ_ℓ(i)) = H^0(F; ℚ_ℓ/ℤ_ℓ(i)) is cyclic of order w_i^{(ℓ)}(F) (N.4/the-w-invariant). Combine with the rank and the structure theorem for finitely generated abelian groups (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod) after localising at ℓ.

**Acceptance checks.**

1. F = ℚ, ℓ odd, n = 3: K_3(ℤ){ℓ} ≅ ℤ/w_2^{(ℓ)}(ℚ), which is ℤ/3 for ℓ = 3 and 0 for ℓ ≥ 5, since w_2(ℚ) = 24 = 8 · 3 (Example VI.2.1.2); this is the odd part of K_3(ℤ) ≅ ℤ/48.
2. F = ℚ(i), ℓ = 2, n = 3: K_3(ℤ[i]){2} ≅ ℤ/8, since w_2(ℚ(i)) = w_2(ℚ) = 24 (Example VI.2.1.2), in agreement with K_3(ℤ[i]) ≅ ℤ ⊕ ℤ/24 (Exercise VI.8.5).
3. The hypothesis at ℓ = 2 cannot be dropped: K_3(ℤ){2} ≅ ℤ/16 (Corollary VI.9.8), while w_2^{(2)}(ℚ) = 8.
4. The rank depends on the parity of i: for F = ℚ, K_5(ℤ) has rank one (i = 3 odd, r_1 + r_2 = 1) and K_3(ℤ), K_7(ℤ) have rank zero (r_2 = 0).

**Prerequisites.** [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); `KTheoryFiniteLocalFields:L.1`; [ArithmeticKTheory:N.3/finiteness-and-ranks-combined](#node-arithmeticktheory-n-3-finiteness-and-ranks-combined); `StableHomotopyKTheory:H.6`; `MotivicEtaleKTheory:M.7`; `MotivicEtaleKTheory:M.8`; [ArithmeticKTheory:N.4/the-w-invariant](#node-arithmeticktheory-n-4-the-w-invariant); `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, Theorem 8.2, the odd rows (PDF p. 521; book p. 513). The odd rows of Theorem 8.2 with its hypothesis at the prime two, which this node states.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, first paragraph (PDF p. 521; book p. 513). The reduction from O_S to O_S[1/ℓ] through the localisation sequence and Quillen's finite-field computation (proof step 1; the printed R/p is the misprint recorded in sourceIssues).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, second paragraph (PDF p. 521; book p. 513). Why the hypothesis at two is the cohomological-dimension hypothesis.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, end of second paragraph (PDF p. 521; book p. 513). The identification of the ℓ-primary torsion of K_{2i−1}(R) with H^0(R; ℚ_ℓ/ℤ_ℓ(i)) = ℤ/w_i^{(ℓ)}(F) (proof steps 2 to 4).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.8, Corollary 9.8, the table (PDF p. 530; book p. 522). The non-example at ℓ = 2 for ℚ: the two-primary part of K_3(ℤ) is ℤ/16, not ℤ/w_2^{(2)}(ℚ) = ℤ/8.

<a id="layer-n-6"></a>

## N.6. Even groups, wild kernels and order certificates

Use arithmetic cohomology for primary components, with the full dyadic correction table. Separate wild kernels from tame kernels and divisible elements. The reusable presentation certificate is owned here and receives its arithmetic instances in N.8.

<a id="node-arithmeticktheory-n-6-even-groups-at-odd-primes"></a>

### The even K-groups at a prime where the cohomological dimension is two (Theorem VI.8.2, even row)

**Theorem · `ArithmeticKTheory:N.6/even-groups-at-odd-primes`.** Let F be a number field, O_S a ring of S-integers in F and ℓ a prime; if ℓ = 2 suppose F totally imaginary. For every i ≥ 1 the group K_{2i}(O_S) is finite and its ℓ-primary part K_{2i}(O_S){ℓ} = K_{2i}(O_S)_(ℓ) is isomorphic to H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)). The isomorphism is the composite of K_{2i}(O_S){ℓ} ≅ K_{2i}(R){ℓ} = K_{2i}(R; ℤ_ℓ), R = O_S[1/ℓ], with MotivicEtaleKTheory M.7's comparison K_{2i}(R; ℤ_ℓ) ≅ H^2(R; ℤ_ℓ(i+1)), and is natural for O_S ⊂ O_{S'}. This is the cohomological description with its inverse-limit (ℤ_ℓ-coefficient) passage; at ℓ = 2 with a real embedding it is replaced by N.6/the-two-primary-corrections, and the odd rows of the same theorem are N.5/odd-torsion-at-a-prime-where-cd-is-two.

**Hypotheses and conventions.**

1. ℓ is any prime; for ℓ = 2 the field is totally imaginary, which is exactly when the étale 2-cohomological dimension of O_S[1/2] is two.
2. The coefficients are ℤ_ℓ(i+1) = lim_ν μ_{ℓ^ν}^{⊗(i+1)} on O_S[1/ℓ]; for i ≥ 1, H^n(R; ℤ_ℓ(i+1)) = 0 for n ≠ 1, 2 and H^2 is finite (source Ex. VI.8.1–8.2, imported with M.7).
3. i ≥ 1; K_0 is N.1's.

**Construction or proof.**

1. Replace O_S by R = O_S[1/ℓ]: K_{2i}(O_S)_(ℓ) ≅ K_{2i}(R)_(ℓ) by the localisation sequence (N.2/localisation-sequence-for-a-dedekind-domain), since K_m(O_S/𝔭) has no ℓ-torsion for m ≥ 1 and 𝔭 over ℓ (KTheoryFiniteLocalFields L.1).
2. K_{2i}(R) is finite (N.3/finiteness-and-ranks-combined), so K_{2i}(R){ℓ} = K_{2i}(R)_(ℓ) ≅ K_{2i}(R; ℤ_ℓ) (StableHomotopyKTheory H.6: the ℓ-adic completion of a finite group is its ℓ-part, and the lim^1 term vanishes).
3. Import from MotivicEtaleKTheory M.7: the ℤ_ℓ-coefficient descent spectral sequence degenerates because H^n(R; ℤ_ℓ(j)) = 0 for n ≠ 1, 2 and j > 0, giving K_{2i}(R; ℤ_ℓ) ≅ H^2(R; ℤ_ℓ(i+1)).

**Acceptance checks.**

1. F = ℚ, ℓ odd, i = 1: H^2(ℤ[1/ℓ]; ℤ_ℓ(2)) ≅ K_2(ℤ){ℓ} = 0, since K_2(ℤ) ≅ ℤ/2 (K2SymbolsBrauer T.5).
2. For an odd regular prime ℓ, K_{2i}(ℤ[ζ_ℓ]) has no ℓ-torsion for every i ≥ 1 (Example VI.8.3.2; see N.6/l-rank-from-class-group-data).
3. The totally imaginary hypothesis at ℓ = 2 cannot be dropped: for F = ℚ and i = 3, K_6(ℤ){2} = 0 (Corollary VI.9.8) while H^2(ℤ[1/2]; ℤ_2(4)) has order 2, the two-primary part of K_6 being the kernel H̃^2 of the surjection α^2(4) onto (ℤ/2)^{r_1} = ℤ/2 (Theorem VI.9.11).

**Prerequisites.** [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); `KTheoryFiniteLocalFields:L.1`; [ArithmeticKTheory:N.3/finiteness-and-ranks-combined](#node-arithmeticktheory-n-3-finiteness-and-ranks-combined); `StableHomotopyKTheory:H.6`; `MotivicEtaleKTheory:M.7`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, Theorem 8.2, the even row (PDF p. 521; book p. 513). The even row of Theorem 8.2 with its hypothesis at the prime two, which this node states.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, first paragraph (PDF p. 521; book p. 513). The reduction from O_S to O_S[1/ℓ] (proof step 1).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, last paragraph (PDF p. 522; book p. 514). The ℤ_ℓ-coefficient argument that gives K_{2i}(R; ℤ_ℓ) ≅ H^2(R, ℤ_ℓ(i+1)) (proof steps 2 and 3).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, second paragraph (PDF p. 521; book p. 513). The cohomological-dimension hypothesis.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.2, Example 8.3.2 (PDF p. 522; book p. 514). The regular-prime instance used in the acceptance.

<a id="node-arithmeticktheory-n-6-the-two-primary-corrections"></a>

### The two-primary part of the K-groups of a number field with a real embedding (Theorem VI.9.11)

**Theorem · `ArithmeticKTheory:N.6/the-two-primary-corrections`.** Let F be a number field with r_1 ≥ 1 real embeddings and R = O_S a ring of S-integers in F containing 1/2; let j = j(R) be its signature defect (N.6/signature-defect) and write w_m = w_m^{(2)}(F). There is an integer ρ with j ≤ ρ ≤ r_1 − 1 such that for all n ≥ 2 the two-primary subgroup K_n(O_S){2} is isomorphic to: H^2_et(R; ℤ_2(4k+1)) for n = 8k; ℤ/2 for n = 8k+1; H^2_et(R; ℤ_2(4k+2)) for n = 8k+2; (ℤ/2)^{r_1−1} ⊕ ℤ/2w_{4k+2} for n = 8k+3; an extension of H^2_et(R; ℤ_2(4k+3)) by (ℤ/2)^ρ for n = 8k+4; 0 for n = 8k+5; H̃^2_et(R; ℤ_2(4k+4)), the kernel of α^2(4k+4) : H^2_et(R; ℤ_2(4k+4)) → (ℤ/2)^{r_1}, for n = 8k+6; and ℤ/w_{4k+4} for n = 8k+7. The integer ρ is the rank of the image of K^M_4(F) ≅ (ℤ/2)^{r_1} in K_4(F) (Corollary VI.9.10); it depends on F and not on S, and it is not determined by r_1: it is 0 for ℚ(√2) and 1 for ℚ(√7), both with r_1 = 2. The row n = 8k+4 is an extension, not a direct sum, and the theorem does not decide it.

**Hypotheses and conventions.**

1. r_1 ≥ 1 and 1/2 ∈ R. For F totally imaginary the two-primary part is given by N.6/even-groups-at-odd-primes and N.5/totally-imaginary-integral-structure.
2. j = j(R) (Definition VI.9.6.1) and w_m = w_m^{(2)}(F).
3. In the source's notation A ⋊ B is an abelian group extension of B by A; (ℤ/2)^ρ ⋊ H^2 is an extension 0 → (ℤ/2)^ρ → K → H^2 → 0.
4. ρ satisfies j ≤ ρ ≤ r_1 − 1; the source asks whether ρ can be less than min(r_1 − 1, j + s + t − 1) (Question VI.9.10.2), so ρ is data of F and is not a function of r_1 and j.

**Construction or proof.**

1. Odd n = 2i − 1: the two-primary part of N.5/the-real-case-modulo-eight, using w_i^{(2)}(F) = 2 for n ≡ 1 (mod 4) (Proposition VI.2.3(b), N.4/exceptional-fields-at-two).
2. n = 2: K_2(O_S){2} ≅ H^2(R; ℤ_2(2)) by Tate's theorem K_2(O_S)/2^ν ≅ H^2(R; μ_{2^ν}^{⊗2}) for rings of S-integers with 2 inverted, which MotivicEtaleKTheory M.3 owns (RT-AREA-ktheory-1/8; not K2SymbolsBrauer T.7), and finiteness of K_2(O_S). (The source cites III.6.9.3 here.)
3. Even n = 2m ≥ 4: K_{n+1}(O_S) has rank r = r_1 + r_2 or r_2 (N.3/finiteness-and-ranks-combined), and the universal coefficient sequence 0 → (ℚ_2/ℤ_2)^r → K_{n+1}(O_S; ℚ_2/ℤ_2) → K_n(O_S){2} → 0 (StableHomotopyKTheory H.6) identifies K_n(O_S){2} with the finite part of K_{n+1}(O_S; ℚ_2/ℤ_2).
4. Import Theorem VI.9.4 from MotivicEtaleKTheory M.7: K_{n+1}(O_S; ℚ_2/ℤ_2) is H^1(R; ℚ_2/ℤ_2(m+1)) for n + 1 ≡ 1, 3 (mod 8), its subgroup H̃^1 for n + 1 ≡ 7 (mod 8), and an extension of H^1(R; ℚ_2/ℤ_2(4k+3)) by (ℤ/2)^{r_1−1} for n + 1 = 8k + 5. The finite part of H^1(R; ℚ_2/ℤ_2(m+1)) is H^2(R; ℤ_2(m+1)); α^1 vanishes on the divisible part and induces α^2, so the finite part of H̃^1 is H̃^2 (MotivicEtaleKTheory M.2). (The source writes the twist as i although n = 2i + 2; the twist of the row n = 2m is m + 1.)
5. n = 8k + 4: by mod-2 periodicity the image of H^4(O_S; ℤ/2(4)) ≅ (ℤ/2)^{r_1} in Hom(ℤ/2, K_n(O_S)) has rank ρ, which gives the (ℤ/2)^ρ; the bounds j(O_S) ≤ ρ ≤ r_1 − 1 are Corollary VI.9.10, whose proof uses {−1, −1, −1, −1} = 0 in K_4(F) and the edge map of the motivic spectral sequence (imported with MotivicEtaleKTheory M.7).

**Acceptance checks.**

1. F = ℚ, R = ℤ[1/2] (r_1 = 1, j = ρ = 0): K_n(ℤ){2} for n ≥ 2 and n ≡ 1, …, 8 (mod 8) is ℤ/2, ℤ/2, ℤ/16, 0, 0, 0, ℤ/2^ν, 0, with 2^ν the two-primary part of 16k for n = 8k − 1 (Corollary VI.9.8); here w_{4k+2}^{(2)}(ℚ) = 8 (Proposition VI.2.3(c) with a = 2, b = 1).
2. The row n = 8k+4 needs ρ: for F = ℚ(√7) and R = ℤ[√7, 1/2] (j = ρ = 1) the two-primary part of K_4(ℤ[√7]) is ℤ/2, generated by the image of {−1, −1, −1, √7} ∈ K^M_4(F) (Example VI.9.10.1), although H^2(R; ℤ_2(3)) = 0.
3. For F = ℚ(√2) (j = 0, r_1 = 2), K_4(ℤ[√2]) has odd order and ρ = 0 (Example VI.9.9.2).
4. K_n(O_S){2} = 0 for n ≡ 5 (mod 8), in agreement with Example VI.9.5.1.
5. The odd rows agree with N.5/the-real-case-modulo-eight.

**Prerequisites.** [ArithmeticKTheory:N.6/signature-defect](#node-arithmeticktheory-n-6-signature-defect); [ArithmeticKTheory:N.5/the-real-case-modulo-eight](#node-arithmeticktheory-n-5-the-real-case-modulo-eight); [ArithmeticKTheory:N.4/exceptional-fields-at-two](#node-arithmeticktheory-n-4-exceptional-fields-at-two); [ArithmeticKTheory:N.3/finiteness-and-ranks-combined](#node-arithmeticktheory-n-3-finiteness-and-ranks-combined); `MotivicEtaleKTheory:M.7`; `MotivicEtaleKTheory:M.2`; `MotivicEtaleKTheory:M.3`; `StableHomotopyKTheory:H.6`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.11, Theorem 9.11, hypotheses (PDF p. 532; book p. 524). The hypotheses of Theorem 9.11 and the integer ρ with j ≤ ρ < r_1.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.11, Theorem 9.11, the eight rows (PDF p. 532; book p. 524). The eight rows, which this node states with the twists.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9, the sentence before Theorem 9.4 (PDF p. 526; book p. 518). The meaning of ⋊: an extension, not a product.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.11, proof (PDF p. 532; book p. 524). The proof: the case n = 2 and the universal coefficient sequence for even n (proof steps 2 and 3).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.11, end of the proof (PDF p. 533; book p. 525). Where ρ comes from (proof step 5).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.10, Corollary 9.10 and the definition of ρ (PDF p. 531; book p. 523). The definition of ρ and its bounds.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.10.1, Example 9.10.1, continued (PDF p. 532; book p. 524). The instance ρ = 1 for ℚ(√7) in the acceptance.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.9.2, Example 9.9.2, last paragraph (PDF p. 531; book p. 523). The instance ρ = 0 for ℚ(√2).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.8, Corollary 9.8, the table (PDF p. 530; book p. 522). The table for ℤ used in the acceptance.

<a id="node-arithmeticktheory-n-6-tame-and-wild-kernels"></a>

### The wild kernel, and its place inside the tame kernel

**Definition · `ArithmeticKTheory:N.6/tame-and-wild-kernels`.** Let F be a number field and i ≥ 1. The wild kernel WK_{2i}(F) is the intersection, over all places v of F, of the kernels of the maps K_{2i}(F) → K_{2i}(F_v) to the K-groups of the completions (the source's definition). It lies in the image of K_{2i}(O_F) and is therefore finite. In degree two it lies in the tame kernel, which is K2SymbolsBrauer T.5's unramified subgroup of K_2(F), identified there with K_2(O_F), and it equals the kernel of the norm-residue (Hilbert) symbols at the finite and real places, because K_2(F_v) is μ(F_v) plus a uniquely divisible group (Moore's theorem) and K_2(F) is torsion. The tame kernel is not redefined here. The two are distinct objects already for ℚ: the tame kernel is K_2(ℤ) ≅ ℤ/2, generated by {−1, −1}, while WK_2(ℚ) = 0.

**Hypotheses and conventions.**

1. F is a number field; v runs over all places, the real ones included, as the source's 'all valuations v on F' and Weibel 2006, Definition 0.2 (where the real places contribute (ℤ/2)^{r_1} for i ≡ 1 mod 4) require.
2. The completions F_v and the maps K_{2i}(F) → K_{2i}(F_v), with their compatibility with the localisation boundary and with restriction, are KTheoryFiniteLocalFields L.7's.
3. Weibel 2006 defines the higher wild kernel through the maps K_{2i}(F) → K_{2i}(F_v) → H^2(F_v; μ^{⊗(i+1)}) ≅ μ^{⊗i}(F_v); the two definitions agree for i = 1 by Moore's theorem, and their agreement for i ≥ 2 is part of the recorded gap.

**Construction or proof.**

1. Define WK_{2i}(F) as the infimum over places v of the kernels of the homomorphisms K_{2i}(F) → K_{2i}(F_v) (functoriality of K-theory along F → F_v; KTheoryFiniteLocalFields L.7).
2. Containment in K_{2i}(O_F): for a finite place v the boundary K_{2i}(F) → K_{2i−1}(k(v)) of N.2's localisation sequence factors through K_{2i}(F_v) (L.7), so WK_{2i}(F) lies in the kernel of the boundary, which is the image of K_{2i}(O_F) by N.5/soule-theorem; K_{2i}(O_F) is finite (N.3/finiteness-and-ranks-combined).
3. Degree two: each tame symbol factors through K_2(F_v), so WK_2(F) is contained in K2SymbolsBrauer T.5/unramified-subgroup, which T.5/tame-kernel-sequence identifies with K_2(O_F). K_2(F) is torsion (the tame-kernel sequence has finite kernel and torsion cokernel), and by Moore's theorem (KTheoryFiniteLocalFields L.3) the torsion of K_2(F_v) maps isomorphically to μ(F_v) under the Hilbert symbol (K2SymbolsBrauer T.7/classical-local-symbols), so WK_2(F) is the kernel of the Hilbert symbols.
4. Restriction along a finite extension E/F maps WK_{2i}(F) into WK_{2i}(E), because K_{2i}(F) → K_{2i}(E_w) factors through K_{2i}(F_v) for w over v.

**Acceptance checks.**

1. WK_2(ℚ) = 0, while the tame kernel K_2(ℤ) ≅ ℤ/2 is generated by {−1, −1}, whose Hilbert symbols at 2 and at ∞ are −1.
2. WK_{2i}(F) is a subgroup of the image of K_{2i}(O_F), hence finite.
3. For F = ℚ(√−14), {−1, −1} is a nonzero element of WK_2(F) (Weibel 2006, Example 5.6, after Hutchinson), so the wild kernel can be nonzero.

**Prerequisites.** `KTheoryFiniteLocalFields:L.7`; `KTheoryFiniteLocalFields:L.3`; `K2SymbolsBrauer:T.5/unramified-subgroup`; `K2SymbolsBrauer:T.5/tame-kernel-sequence`; `K2SymbolsBrauer:T.7/classical-local-symbols`; [ArithmeticKTheory:N.5/soule-theorem](#node-arithmeticktheory-n-5-soule-theorem); [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); [ArithmeticKTheory:N.3/finiteness-and-ranks-combined](#node-arithmeticktheory-n-3-finiteness-and-ranks-combined).

**Library API.**

- `wildKernel` (data): For a number field F and i ≥ 1, ⨅ v, ker (K_{2i}(F) → K_{2i}(F_v)) as an AddSubgroup of K_{2i}(F).
- `mem_wildKernel_iff` (characterisation): x ∈ wildKernel F i ↔ ∀ v, the image of x in K_{2i}(F_v) is 0.
- `wildKernel_le_ker` (compatibility): wildKernel F i ≤ ker (K_{2i}(F) → K_{2i}(F_v)) for each place v.
- `wildKernel_le_range` (relation): wildKernel F i ≤ range (K_{2i}(O_F) → K_{2i}(F)); in particular it is finite.
- `wildKernel_two_le_unramifiedSubgroup` (relation): wildKernel F 1 ≤ K2SymbolsBrauer's unramifiedSubgroup of K_2(F) for the family of finite places (the tame kernel).
- `wildKernel_two_eq_ker_hilbert` (characterisation): wildKernel F 1 = ker (K_2(F) → ⨁_{v finite or real} μ(F_v)), the kernel of the Hilbert symbols.
- `wildKernel_restrict_le` (functoriality): For a finite extension E/F the restriction K_{2i}(F) → K_{2i}(E) maps wildKernel F i into wildKernel E i.

**Discriminating unit tests.**

- `wildKernel_two_rat` (computation): wildKernel ℚ 1 = 0: it lies in K_2(ℤ) = {1, {−1, −1}}, and {−1, −1} maps to the nontrivial element of K_2(ℝ) under the real sign symbol (K2SymbolsBrauer T.5/real-sign-symbol).
- `wildKernel_ne_tameKernel_rat` (non-example): The tame kernel of ℚ contains {−1, −1} and the wild kernel does not: a definition using only the tame symbols (the residue maps at the finite places) instead of the whole maps to K_2(ℚ_p) and K_2(ℝ) would give K_2(ℤ) ≅ ℤ/2, missing that the Hilbert symbols (−1, −1)_2 and (−1, −1)_∞ are −1.
- `wildKernel_two_gaussian` (degenerate): wildKernel ℚ(i) 1 = 0, since it lies in K_2(ℤ[i]) = 1 (Tate, quoted in Example III.5.2.2).
- `wildKernel_two_hilbert` (compatibility): For every number field, wildKernel F 1 is the kernel of the Hilbert symbols of K2SymbolsBrauer T.7/classical-local-symbols at the finite places together with the real sign symbols, the classical wild kernel of the Moore sequence.
- `wildKernel_two_Q_sqrt_neg14` (characterisation): For F = ℚ(√−14), {−1, −1} ∈ wildKernel F 1 and {−1, −1} ≠ 1 (Weibel 2006, Example 5.6).

**Consumers.**

- N.6's text: 'Develop tame and wild kernels as distinct objects, and compare localisation to completions'
- K2SymbolsBrauer T.5: the tame kernel (unramified subgroup) is imported, not redefined
- N.6/divisible-subgroup-and-the-wild-kernel: the divisible subgroup is compared with it
- N.8, the certified examples: a computation of an even group states which of the two kernels it bounds

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413). The definition of the wild kernel as the intersection of the kernels of the maps to the completions; the identification with div K_{2i}(F) claimed in the same sentence is corrected in N.6/divisible-subgroup-and-the-wild-kernel.

**Open inputs.** The comparison of the divisible subgroup with the wild kernel rests on Weibel 2006, which corrects the K-book. See the gap register.

<a id="node-arithmeticktheory-n-6-order-certificate"></a>

### Order certificates: a finite presentation with independent upper and lower bounds

**Definition · `ArithmeticKTheory:N.6/order-certificate`.** For an abelian group A (a ℤ-module), an order certificate consists of: relations rel : Module.Relations ℤ with finitely many generators and relations and finite presented group rel.Quotient; a solution s : rel.Solution A whose values span A, so that s.fromQuotient : rel.Quotient → A is onto (the upper bound Nat.card A ≤ Nat.card rel.Quotient); and a lower bound, a surjective homomorphism φ : A → B onto a finite group B with Nat.card B = Nat.card rel.Quotient. Soundness: s is then a presentation (Mathlib's IsPresentation), A ≃ rel.Quotient and Nat.card A = Nat.card B. The two bounds are independent obligations: without the lower bound, or a complete kernel argument (IsPresentation itself), only the upper bound holds, and an upper bound with a surjective presentation is never reported as an isomorphism. This is the certificate engine of N.6's text ('supply a finite presentation, verify relations and surjectivity, and certify the kernel/order through cohomology or a second independently proved bound'); the lower bound may come from symbols (the real sign, tame or Hilbert symbols), from cohomology (N.6/certificate-driven-computation) or from another proved order statement, but never from a formula for which the certified group is to serve as the independent test (RT-AREA-ktheory-1/9, /11). The format moves here from K2SymbolsBrauer T.5/certified-presentation, whose competing certificate obligation T.5 drops.

**Hypotheses and conventions.**

1. A is an abelian group; the intended instances are tame kernels K_2(O_F), the K_2 of rings of S-integers and the finite even K-groups K_{2i}(O_S).
2. Generation (span) and the lower bound are separate fields carried with their proofs; neither may be inferred from the other or from a numerical coincidence.

**Construction or proof.**

1. Define the certificate as a structure on top of Mathlib's Module.Relations and Module.Relations.Solution; do not introduce a second presentation type.
2. Upper bound: surjectivity of s.fromQuotient from the span condition (mathlib:Module.Relations.Solution.surjective_π_iff_span_eq_top and mathlib:Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π).
3. Soundness: the composite rel.Quotient → A → B is a surjection between finite sets of equal cardinality, hence bijective (mathlib:Function.Surjective.bijective_of_nat_card_le), so s.fromQuotient is injective and s is a presentation.
4. Package a certificate as a Mathlib Module.Presentation ℤ A (mathlib:Module.Presentation.ofIsPresentation), and a complete kernel argument (IsPresentation with finite quotient) as a certificate with B = A and φ = id.

**Acceptance checks.**

1. A certificate without its lower bound gives Nat.card A ≤ Nat.card rel.Quotient and nothing more.
2. K_2(ℤ): one generator {−1, −1}, the relation 2g = 0, span by Milnor's bound and lower bound the real sign symbol onto ℤˣ (both K2SymbolsBrauer T.5's) — the model instance, used by N.8.
3. For a tame kernel with a claimed order the certificate carries both bounds, which is N.6's and N.8's acceptance condition.

**Prerequisites.** `mathlib:Module.Relations`; `mathlib:Module.Relations.Solution`; `mathlib:Module.Relations.Quotient`; `mathlib:Module.Relations.Solution.fromQuotient`; `mathlib:Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π`; `mathlib:Module.Relations.Solution.surjective_π_iff_span_eq_top`; `mathlib:Module.Relations.Solution.IsPresentation`; `mathlib:Module.Presentation`; `mathlib:Module.Presentation.ofIsPresentation`; `mathlib:Function.Surjective.bijective_of_nat_card_le`.

**Library API.**

- `OrderCertificate` (structure): For an abelian group A: rel : Module.Relations ℤ with Finite rel.G and Finite rel.R, s : rel.Solution A with span_eq_top, a finite group B in the universe of A with a surjective φ : A →+ B, and card_quotient_eq : Nat.card B = Nat.card rel.Quotient with rel.Quotient finite.
- `OrderCertificate.fromQuotient_surjective` (projection): The upper bound: s.fromQuotient is surjective, so Nat.card A ≤ Nat.card rel.Quotient.
- `OrderCertificate.isPresentation` (characterisation): Soundness: s.IsPresentation.
- `OrderCertificate.toPresentation` (compatibility): The Mathlib Module.Presentation ℤ A with relations rel and solution s.
- `OrderCertificate.card_eq` (simp): Nat.card A = Nat.card B = Nat.card rel.Quotient.
- `OrderCertificate.linearEquiv` (equivalence): rel.Quotient ≃ₗ[ℤ] A, from IsPresentation.linearEquiv.
- `OrderCertificate.ofIsPresentation` (constructor): A complete kernel argument (s.IsPresentation with rel.Quotient finite) gives a certificate with B = A and φ = id.

**Discriminating unit tests.**

- `orderCertificate_k2_int` (computation): For K_2(ℤ): one generator g ↦ {−1, −1}, one relation 2g = 0, span from Milnor's bound (K2SymbolsBrauer T.5's recorded gap), lower bound the real sign symbol onto ℤˣ; the certificate gives K_2(ℤ) ≃ ℤ/2.
- `orderCertificate_trivial` (degenerate): No generators and no relations certify the trivial group: rel.Quotient = 0, span_eq_top forces A = 0 (for instance K_2(𝔽_q)), and B = 0.
- `upper_bound_not_iso` (non-example): One generator with the relation 4g = 0, sent to the generator of ℤ/2, spans and satisfies the relation, but ℤ/4 → ℤ/2 is not injective, and no surjection from ℤ/2 onto a group of order 4 exists: the certificate cannot be completed.
- `orderCertificate_isPresentation` (characterisation): From any certificate, Mathlib's predicate s.IsPresentation holds, so A ≃ rel.Quotient.
- `orderCertificate_toPresentation` (compatibility): toPresentation.toRelations = rel and toPresentation.toSolution = s.

**Consumers.**

- N.6's text: 'Construct certificate-driven computations: supply a finite presentation, verify relations and surjectivity, and certify the kernel/order through cohomology or a second independently proved bound'
- N.6/certificate-driven-computation: the cohomological lower bound completes a certificate of this format
- ArithmeticKTheory N.8, the certified examples: K₂(ℤ[i]) = 0 and the real quadratic tame kernel are certificates of this format, exported to SpecialValuesBirchTate B.3
- K2SymbolsBrauer T.5/k2-of-the-integers: its proof of K₂(ℤ) ≅ ℤ/2 (Milnor's bound and the sign symbol) is the model instance; T.5 is upstream of N.6 and does not import the format

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2.2, Example 5.2.2 (PDF p. 226; book p. 218). The model upper bound: the order-two statement comes from a computation in the Steinberg group, which the source cites.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.1, Example 6.2.1 (PDF p. 240; book p. 232). The model lower bound: a surjection onto a group of known order.

<a id="node-arithmeticktheory-n-6-certificate-driven-computation"></a>

### The cohomological lower bound for order certificates of even K-groups, in every even degree

**Construction · `ArithmeticKTheory:N.6/certificate-driven-computation`.** Let F be a number field, O_S a ring of S-integers and i ≥ 1, so that A = K_{2i}(O_S) is finite. Given the upper half of an order certificate for A (a finite presentation with span, N.6/order-certificate), a finite set L of primes containing every prime factor of the order of the presented group, and for each ℓ ∈ L a certified value h_ℓ of #K_{2i}(O_S){ℓ} computed from cohomology — h_ℓ = #H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) when ℓ is odd, or ℓ = 2 and F is totally imaginary (N.6/even-groups-at-odd-primes); and, for ℓ = 2 and r_1 > 0 with R = O_S[1/2], h_2 = #H²_et(R; ℤ_2(i+1)) for 2i ≡ 0, 2 (mod 8), #H̃²_et(R; ℤ_2(i+1)) for 2i ≡ 6 (mod 8), and 2^ρ · #H²_et(R; ℤ_2(4k+3)) for 2i = 8k + 4, with ρ a separately certified input, j(R) ≤ ρ ≤ r_1 − 1 (N.6/the-two-primary-corrections) — with ∏_{ℓ∈L} h_ℓ equal to that order, the projection φ : K_{2i}(O_S) → ⊕_{ℓ∈L} K_{2i}(O_S){ℓ} is onto a group of order ∏ h_ℓ and completes the certificate. So the cohomological order computation is available in every even degree; in degree 8k + 4 with real places it needs ρ, which neither r_1 nor j determines. A zeta value is never an input: Theorems VI.8.7 and VI.8.8 enter only through a proved theorem supplying the order, and a match of orders between an unproved formula and a presentation certifies nothing.

**Hypotheses and conventions.**

1. F is a number field, O_S a ring of S-integers and i ≥ 1; K_{2i}(O_S) is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite).
2. The format, with its upper-bound half (presentation, relations, span), is N.6/order-certificate; this node supplies a lower bound from cohomology.
3. The cohomology orders h_ℓ, and ρ in degree 8k + 4, are inputs to be certified (by the class-group and unit data of N.6/l-rank-from-class-group-data and the Brauer group, or otherwise); the construction does not compute them.

**Construction or proof.**

1. Import OrderCertificate from N.6/order-certificate, with its soundness lemma and its packaging as mathlib:Module.Presentation.
2. For ℓ ∈ L the projection of the finite group K_{2i}(O_S) onto its ℓ-primary component is surjective; N.6/even-groups-at-odd-primes (or N.6/the-two-primary-corrections at ℓ = 2 with real places) gives its order h_ℓ: H² or H̃² in the rows 2i ≡ 0, 2, 6 (mod 8), and 2^ρ · #H²(R; ℤ_2(4k+3)) in the row 2i = 8k + 4, the extension of H² by (ℤ/2)^ρ having that order whatever its class.
3. The presented group surjects onto K_{2i}(O_S), which surjects onto B = ⊕_{ℓ∈L} K_{2i}(O_S){ℓ} of order ∏ h_ℓ; equality with the presented order fills the lower-bound field, and soundness makes both maps bijective.
4. Record why ρ is an input in degree 8k + 4: Theorem VI.9.11 determines only j ≤ ρ ≤ r_1 − 1, and ρ is 0 for ℚ(√2) and 1 for ℚ(√7) with the same r_1 = 2.

**Acceptance checks.**

1. The certificate for K_2(ℤ) (one generator {−1, −1}, relation 2g = 0) is completed equally by the real sign symbol and by the cohomological bound with L = {2}, h_2 = #H²(ℤ[1/2]; ℤ_2(2)) = 2 (degree 2 ≡ 2 mod 8, Theorem VI.9.11); both give order 2.
2. Without the lower bound only Nat.card K_{2i}(O_S) ≤ Nat.card of the presented group follows.
3. For ℚ(√7), 2i = 4: h_2 = 2^ρ · #H²(ℤ[√7, 1/2]; ℤ_2(3)) = 2 · 1 with ρ = 1 (Example VI.9.10.1); taking h_2 = #H² alone would undercount by 2^ρ.
4. A zeta value alone certifies nothing: ζ(−1) = −1/12 gives |K_2(ℤ)| = 2 only through the proved Theorem VI.8.8 for abelian fields (for ℚ, k = 1: −1/12 = −2 · |K_2(ℤ)|/|K_3(ℤ)| with |K_3(ℤ)| = 48).

**Prerequisites.** [ArithmeticKTheory:N.6/order-certificate](#node-arithmeticktheory-n-6-order-certificate); [ArithmeticKTheory:N.6/even-groups-at-odd-primes](#node-arithmeticktheory-n-6-even-groups-at-odd-primes); [ArithmeticKTheory:N.6/the-two-primary-corrections](#node-arithmeticktheory-n-6-the-two-primary-corrections); [ArithmeticKTheory:N.6/signature-defect](#node-arithmeticktheory-n-6-signature-defect); [ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite](#node-arithmeticktheory-n-3-ranks-even-k-groups-of-s-integers-are-finite); `mathlib:Module.Relations`; `mathlib:Module.Presentation`.

**Library API.**

- `OrderCertificate.ofCohomology` (constructor): For a presentation of K_{2i}(O_S) with span, a finite set L of primes containing the prime factors of its order, and certified orders h_ℓ of the ℓ-primary parts computed from cohomology with ∏_{ℓ∈L} h_ℓ equal to that order, the OrderCertificate (N.6/order-certificate) whose lower bound is the projection onto ⊕_{ℓ∈L} K_{2i}(O_S){ℓ}.
- `evenK_toPrimaryCohomology_surjective` (projection): K_{2i}(O_S) → ⊕_{ℓ∈L} K_{2i}(O_S){ℓ}, the ℓ-primary projections, is surjective, and for ℓ odd (or F totally imaginary) its ℓ-component is identified with H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) by N.6/even-groups-at-odd-primes.
- `OrderCertificate.ofCohomology_card` (simp): Nat.card K_{2i}(O_S) = ∏_{ℓ∈L} h_ℓ.
- `OrderCertificate.ofCohomology_two_real` (constructor): For F with a real embedding and 2 ∈ L: the two-primary factor is h_2 = #H²_et(R; ℤ_2(i+1)) for 2i ≡ 0, 2 (mod 8), #H̃²_et(R; ℤ_2(i+1)) for 2i ≡ 6 (mod 8), and 2^ρ · #H²_et(R; ℤ_2(4k+3)) for 2i = 8k + 4 with ρ a certified input (N.6/the-two-primary-corrections).
- `OrderCertificate.ofCohomology_toPresentation` (compatibility): The Mathlib Module.Presentation of the resulting certificate has the given relations and solution (OrderCertificate.toPresentation of N.6/order-certificate).

**Discriminating unit tests.**

- `ofCohomology_K2_int` (compatibility): For K_2(ℤ) the cohomological certificate (L = {2}, h_2 = 2) and the sign-symbol certificate (N.6/order-certificate's test orderCertificate_k2_int) give the same Nat.card = 2.
- `ofCohomology_trivial` (degenerate): The empty presentation with L = ∅ (empty product 1) certifies K_{2i}(O_S) = 0.
- `ofCohomology_missing_prime` (non-example): For K_2(ℤ) with L = ∅ the product is 1 ≠ 2, the order of the presented group ⟨g | 2g⟩, so no certificate is produced: every prime factor of the presented order must be in L.
- `ofCohomology_two_row_four` (characterisation): For F = ℚ(√7), R = ℤ[√7, 1/2] and 2i = 4, the two-primary part of K_4(ℤ[√7]) is ℤ/2 while H²(R; ℤ_2(3)) = 0 (Example VI.9.10.1, ρ = 1): ofCohomology_two_real with ρ = 1 gives h_2 = 2, while a variant using #H²(R; ℤ_2(3)) alone would give 1 and undercount by 2^ρ.
- `ofCohomology_isPresentation` (characterisation): The certificate produced satisfies Mathlib's IsPresentation, so K_{2i}(O_S) is isomorphic to the presented group.

**Consumers.**

- N.6's text: 'certify the kernel/order through cohomology or a second independently proved bound. This is a reusable calculation method, not an oracle defining the group order from a zeta value'
- N.6/order-certificate: the format, now owned by N.6 (RT-AREA-ktheory-1/9); K2SymbolsBrauer T.5 drops its competing certificate obligation
- N.8, the certified examples: its even-group and tame-kernel certificates are built with this lower bound or with symbol bounds, and exported to SpecialValuesBirchTate B.3
- SpecialValuesBirchTate: a proved zeta-value theorem may supply a second lower bound in the same format

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, Theorem 8.2, the even row (PDF p. 521; book p. 513). The isomorphism K_{2i}(O_S){ℓ} ≅ H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) that supplies the lower bound.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.11, Theorem 9.11, the eight rows (PDF p. 532; book p. 524). The two-primary rows usable at ℓ = 2 with real places, and the row n = 8k + 4 that is not.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.7, Theorem 8.7 (PDF p. 523; book p. 515). Wiles's theorem relating zeta values to orders of étale cohomology (denominator |H^1| elided), admissible only as a proved bound.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.8, Theorem 8.8 (PDF p. 523; book p. 515). Theorem 8.8 relating ζ_F(1 − 2k) to |K_{4k−2}(O_F)|/|K_{4k−1}(O_F)| for abelian F (denominator elided), admissible only as a proved bound.

<a id="node-arithmeticktheory-n-6-even-groups-of-a-totally-imaginary-field"></a>

### The even K-groups of a totally imaginary field (Theorem VI.8.4, even row)

**Theorem · `ArithmeticKTheory:N.6/even-groups-of-a-totally-imaginary-field`.** Let F be a totally imaginary number field and O_S the ring of S-integers for a finite set S of finite places. For every i ≥ 1, K_{2i}(O_S) ≅ ⊕_ℓ H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)), the sum over all primes ℓ, a finite group with only finitely many nonzero summands.

**Hypotheses and conventions.**

1. F is totally imaginary, so N.6/even-groups-at-odd-primes applies at every prime including ℓ = 2.
2. i ≥ 1.

**Construction or proof.**

1. K_{2i}(O_S) is finite (N.3/finiteness-and-ranks-combined), hence the direct sum of its ℓ-primary parts, only finitely many of them nonzero.
2. For every ℓ the ℓ-primary part is H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) by N.6/even-groups-at-odd-primes.

**Acceptance checks.**

1. F = ℚ(i): K_{2i}(ℤ[i]) has odd order for every i ≥ 1, since H^2(ℤ[1/2, i]; μ_4) = 0 forces H^2(ℤ[1/2, i]; ℤ_2(i+1)) = 0 (Exercise VI.8.4).
2. The formula fails for fields with a real embedding at ℓ = 2 (N.6/the-two-primary-corrections).

**Prerequisites.** [ArithmeticKTheory:N.6/even-groups-at-odd-primes](#node-arithmeticktheory-n-6-even-groups-at-odd-primes); [ArithmeticKTheory:N.3/finiteness-and-ranks-combined](#node-arithmeticktheory-n-3-finiteness-and-ranks-combined); `mathlib:NumberField.IsTotallyComplex`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.4, Theorem 8.4 (PDF p. 522; book p. 514). Theorem 8.4; this node states its row n = 2i ≥ 2.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI, Exercise 8.4 (PDF p. 524; book p. 516). The instance for ℤ[i] used in the acceptance.

<a id="node-arithmeticktheory-n-6-even-groups-modulo-l"></a>

### The even K-groups modulo ℓ (Corollary VI.8.3)

**Theorem · `ArithmeticKTheory:N.6/even-groups-modulo-l`.** Let F be a number field, O_S a ring of S-integers in F and i > 0. For every odd prime ℓ, K_{2i}(O_S)/ℓ ≅ H^2_et(O_S[1/ℓ]; μ_ℓ^{⊗(i+1)}); the same holds for ℓ = 2 when F is totally imaginary.

**Hypotheses and conventions.**

1. ℓ odd, or ℓ = 2 and F totally imaginary; the cohomological dimension of O_S[1/ℓ] is then two.
2. i > 0.

**Construction or proof.**

1. K_{2i}(O_S) is finite, so K_{2i}(O_S)/ℓ = K_{2i}(O_S){ℓ}/ℓ ≅ H^2(R; ℤ_ℓ(i+1))/ℓ with R = O_S[1/ℓ] (N.6/even-groups-at-odd-primes).
2. The coefficient sequence 0 → ℤ_ℓ(i+1) → ℤ_ℓ(i+1) → μ_ℓ^{⊗(i+1)} → 0 (multiplication by ℓ; MotivicEtaleKTheory M.1) and H^3(R; ℤ_ℓ(i+1)) = 0 (cohomological dimension two; MotivicEtaleKTheory M.2) give H^2(R; ℤ_ℓ(i+1))/ℓ ≅ H^2(R; μ_ℓ^{⊗(i+1)}).

**Acceptance checks.**

1. The hypothesis at 2 cannot be dropped: for F = ℚ and i = 3, K_6(ℤ)/2 = 0 (Corollary VI.9.8), while H^2(ℤ[1/2]; μ_2) ≅ ℤ/2 (Pic(ℤ[1/2]) = 0 and the two-torsion of Br(ℤ[1/2]) ≅ ℤ/2, from (8.1.1) with S = {2}).
2. F = ℚ(i), ℓ = 2: K_{2i}(ℤ[i])/2 = 0 corresponds to H^2(ℤ[1/2, i]; μ_2) = 0, the vanishing behind Exercise VI.8.4.

**Prerequisites.** [ArithmeticKTheory:N.6/even-groups-at-odd-primes](#node-arithmeticktheory-n-6-even-groups-at-odd-primes); `MotivicEtaleKTheory:M.1`; `MotivicEtaleKTheory:M.2`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3, Corollary 8.3 with its proof (PDF p. 522; book p. 514). Corollary 8.3 with its one-line proof, which this node states and expands.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.8, Corollary 9.8, the table (PDF p. 530; book p. 522). K_6(ℤ) has no two-primary torsion, used in the non-example.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1, the sequence (8.1.1) (PDF p. 521; book p. 513). The Brauer group of O_S, used in the non-example with S = {2}.

<a id="node-arithmeticktheory-n-6-l-rank-from-class-group-data"></a>

### The ℓ-rank of the even K-groups from class-group data (Example VI.8.3.1)

**Application · `ArithmeticKTheory:N.6/l-rank-from-class-group-data`.** Let ℓ be an odd prime, F a number field containing a primitive ℓ-th root of unity, S the set of primes of O_F over ℓ, and t the 𝔽_ℓ-rank of Pic(O_S)/ℓ. Then H^2_et(O_S; μ_ℓ) has 𝔽_ℓ-rank t + |S| − 1; hence for every i ≥ 1, K_{2i}(O_S)/ℓ has rank t + |S| − 1, and the ℓ-primary subgroup of the finite group K_{2i}(O_F) is a direct sum of exactly t + |S| − 1 nonzero cyclic groups.

**Hypotheses and conventions.**

1. ℓ is odd and ζ_ℓ ∈ F, so F is totally imaginary (r_1 = 0).
2. S is the set of primes over ℓ, which is non-empty, as (8.1.1) requires.

**Construction or proof.**

1. Kummer sequence on O_S (1/ℓ ∈ O_S): 0 → Pic(O_S)/ℓ → H^2(O_S; μ_ℓ) → ℓBr(O_S) → 0 (MotivicEtaleKTheory M.1); Pic(O_S) is the class group of O_S (mathlib:ClassGroup, with tauceti:IsDedekindDomain.integerClassGroupEquiv).
2. By (8.1.1) with r_1 = 0 and S non-empty, ℓBr(O_S) ≅ ker((ℤ/ℓ)^{|S|} → ℤ/ℓ) has rank |S| − 1 (class field theory, MotivicEtaleKTheory M.2).
3. Since ζ_ℓ ∈ F, μ_ℓ^{⊗i} ≅ ℤ/ℓ as Galois modules over O_S (the trivialisation K2SymbolsBrauer T.7/twisted-roots-of-unity), so H^2(O_S; μ_ℓ^{⊗(i+1)}) ≅ H^2(O_S; μ_ℓ) ⊗ μ_ℓ^{⊗i} has the same rank; N.6/even-groups-modulo-l gives the rank of K_{2i}(O_S)/ℓ.
4. By N.5/soule-theorem, 0 → K_{2i}(O_F) → K_{2i}(O_S) → ⊕_{𝔭∈S} K_{2i−1}(k(𝔭)) → 0, and the right-hand term has order prime to ℓ (KTheoryFiniteLocalFields L.1), so the ℓ-primary parts of K_{2i}(O_F) and K_{2i}(O_S) agree; a finite ℓ-group whose quotient by ℓ has rank r is a sum of r nonzero cyclic groups.

**Acceptance checks.**

1. Regular primes (Example VI.8.3.2): F = ℚ(ζ_ℓ), S = {(1 − ζ_ℓ)}, t = 0, so K_{2i}(ℤ[ζ_ℓ]) has no ℓ-torsion for all i ≥ 1.
2. ℓ = 37, which is irregular (Example VI.2.4.1): 37 divides the class number of ℚ(ζ_37) and (1 − ζ_37) is principal, so t ≥ 1 and |S| = 1, and K_{2i}(ℤ[ζ_37]) has nonzero 37-torsion for every i ≥ 1.

**Prerequisites.** [ArithmeticKTheory:N.6/even-groups-modulo-l](#node-arithmeticktheory-n-6-even-groups-modulo-l); [ArithmeticKTheory:N.5/soule-theorem](#node-arithmeticktheory-n-5-soule-theorem); `KTheoryFiniteLocalFields:L.1`; `MotivicEtaleKTheory:M.1`; `MotivicEtaleKTheory:M.2`; `K2SymbolsBrauer:T.7/twisted-roots-of-unity`; `mathlib:ClassGroup`; `tauceti:IsDedekindDomain.integerClassGroupEquiv`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.1, Example 8.3.1 (PDF p. 522; book p. 514). The rank of H^2(O_S, μ_ℓ) from the class group and |S|.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.1, Example 8.3.1, conclusion (PDF p. 522; book p. 514). The consequence for K_{2i}(O_F).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1, the sequence (8.1.1) (PDF p. 521; book p. 513). The Brauer group sequence used in proof step 2 (valid here because S is non-empty; see sourceIssues).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.2, Example 8.3.2 (PDF p. 522; book p. 514). The regular-prime instance.

<a id="node-arithmeticktheory-n-6-signature-defect"></a>

### The signature defect of a ring of S-integers (Definition VI.9.6.1)

**Definition · `ArithmeticKTheory:N.6/signature-defect`.** Let F be a number field with r_1 real places and R = O_S a ring of S-integers in F. The signature defect j(R) is r_1 − dim_{𝔽_2} sign(F⟮S, 2⟯), the codimension in (ℤ/2)^{r_1} of the signs of the Selmer group F⟮S, 2⟯ of classes x·F^{×2} with even valuation at every prime not in S (Mathlib's IsDedekindDomain.selmerGroup; the sign map is Tau Ceti's signHom on representatives). When 1/2 ∈ R, Kummer theory identifies F⟮S, 2⟯ with H^1_et(R; μ_2) = H^1_et(R; ℤ/2) and the sign map with the restriction α^1 : H^1_et(R; ℤ/2) → ⊕_{σ real} H^1(ℝ; ℤ/2) ≅ (ℤ/2)^{r_1}, so j(R) is the 𝔽_2-dimension of the cokernel of α^1: Definition VI.9.6.1, in the setting of Theorem VI.9.11. Without 1/2 ∈ R the étale form differs: for R = ℤ, H^1_et(ℤ; ℤ/2) = 0 and its cokernel has dimension 1 = r_1, while j(ℤ) = 0. Equivalently j(R) = u − t, where t and u are the 𝔽_2-dimensions of Pic(R)/2 and of the narrow Picard group Pic^+(R)/2.

**Hypotheses and conventions.**

1. F is a number field; for r_1 = 0 the target is zero and j(R) = 0.
2. R = O_S; the étale description of j(R) needs 1/2 ∈ R, which is the case Theorem VI.9.11 uses; the Selmer form defines j(R) for every S, and it is the form under which the API below holds.

**Construction or proof.**

1. Define j(R) as finrank_{ZMod 2} of the cokernel of α^1, with H^1_et(R; ℤ/2) and the real-place maps imported from MotivicEtaleKTheory M.1 and M.2.
2. Bounds: the class of −1 maps to (1, …, 1) ≠ 0 when r_1 > 0, so the image is nonzero and 0 ≤ j(R) < r_1.
3. Monotonicity: for S ⊆ S' the Selmer group grows, so j(O_{S'}) ≤ j(O_S); and since the sign map F^× → (ℤ/2)^{r_1} is onto (tauceti:NumberField.fieldUnitSignature_surjective), j(O_S) = 0 for S large (the source's j(F) = 0).
4. Kummer description for 1/2 ∈ R: H^1_et(R; μ_2) ≅ F⟮S, 2⟯ and α^1 is the sign map (MotivicEtaleKTheory M.1; mathlib:IsDedekindDomain.selmerGroup; tauceti:TauCeti.GlobalNumberFields.signHom).
5. Narrow-Picard description: the exact sequence (9.6.2) 0 → H̃^1(R; ℤ/2) → H^1(R; ℤ/2) → (ℤ/2)^{r_1} → Pic^+(R)/2 → Pic(R)/2 → 0 (source Ex. VI.9.3) gives u = t + j(R); for R = O_F compare with Tau Ceti's narrow class group.

**Acceptance checks.**

1. j(ℤ[1/2]) = 0 (proof of Corollary VI.9.8).
2. F = ℚ(√7), R = ℤ[√7, 1/2]: j(R) = 1 (Example VI.9.10.1).
3. 0 ≤ j(R) < r_1 when r_1 > 0.

**Prerequisites.** `MotivicEtaleKTheory:M.1`; `MotivicEtaleKTheory:M.2`; `mathlib:IsDedekindDomain.selmerGroup`; `mathlib:Set.integer`; `mathlib:NumberField.InfinitePlace.nrRealPlaces`; `tauceti:TauCeti.GlobalNumberFields.signHom`; `tauceti:NumberField.fieldUnitSignature_surjective`; `tauceti:NumberField.NarrowClassGroup.twoRank`; `tauceti:TauCeti.ClassGroup.twoRank`.

**Library API.**

- `signatureDefect` (data): For R = O_S in a number field F, the 𝔽_2-dimension of the cokernel of the sign map F⟮S, 2⟯ → ({σ : real places} → ℤˣ).
- `signatureDefect_eq_sub_finrank_selmer` (characterisation): signatureDefect R = nrRealPlaces F − finrank (ZMod 2) (sign '' F⟮S, 2⟯); when 1/2 ∈ R this is the dimension of the cokernel of α^1 on H^1_et(R; ℤ/2), by Kummer theory (MotivicEtaleKTheory M.1).
- `signatureDefect_lt_nrRealPlaces` (relation): If 0 < nrRealPlaces F then signatureDefect R < nrRealPlaces F.
- `signatureDefect_antitone` (functoriality): S ⊆ S' → signatureDefect (O_{S'}) ≤ signatureDefect (O_S).
- `signatureDefect_eventually_eq_zero` (relation): There is a finite S₀ with signatureDefect (O_S) = 0 for every S ⊇ S₀.
- `add_signatureDefect_eq` (characterisation): dim (Pic(R)/2) + signatureDefect R = dim (Pic^+(R)/2).
- `signatureDefect_ringOfIntegers` (compatibility): signatureDefect (𝓞 F) = NumberField.NarrowClassGroup.twoRank F − TauCeti.ClassGroup.twoRank (𝓞 F).
- `signatureDefect_of_isTotallyComplex` (simp): If F is totally complex then signatureDefect R = 0.

**Discriminating unit tests.**

- `signatureDefect_int_half` (computation): signatureDefect ℤ[1/2] = 0: the class of −1 has sign −1 at the unique real place.
- `signatureDefect_sqrt7_half` (computation): For F = ℚ(√7) and R = ℤ[√7, 1/2] (class number one), F⟮S, 2⟯ is spanned by −1, the totally positive fundamental unit 8 + 3√7 and the totally positive generator 3 + √7 of the prime over 2; their sign patterns span a line in (ℤ/2)^2, so signatureDefect R = 1.
- `signatureDefect_sqrt7_fourteen` (computation): For F = ℚ(√7) and R = ℤ[√7, 1/14], the element √7 has signs (+, −), so the signs span (ℤ/2)^2 and signatureDefect R = 0: the defect drops as S grows.
- `signatureDefect_ringOfIntegers_sqrt7` (compatibility): For F = ℚ(√7): the class group is trivial and the narrow class group has order 2 (the fundamental unit has norm +1), so NarrowClassGroup.twoRank F − ClassGroup.twoRank (𝓞 F) = 1 − 0 = 1 = signatureDefect ℤ[√7], agreeing with j = 1 for O_F in Example VI.9.9.1 (p = 7).
- `signatureDefect_not_unit_sign_codim` (non-example): The defect is not r_1 minus the rank of the signs of the units: for F = ℚ(√34) and R = O_F[1/2] the units ±1, the totally positive fundamental unit 35 + 6√34 and the totally positive generator 6 + √34 of the prime over 2 have signs (−,−) or (+,+), but x = 5 + √34 (norm −9, (x) = 𝔭_3^2 with 𝔭_3 non-principal since a^2 − 34b^2 = ±3 has no solution modulo 17) lies in F⟮S, 2⟯ with signs (+,−); so signatureDefect R = 0 while the unit-only formula gives 1.
- `signatureDefect_totallyComplex` (degenerate): For F = ℚ(i) the target of α^1 is zero and signatureDefect R = 0 for every S.

**Consumers.**

- Theorem VI.9.11: j is the lower bound for the integer ρ of the two-primary table
- Corollary VI.9.9: the 2-ranks j + s + t − 1 of K_n(O_S) for n ≡ 4, 6 (mod 8)
- Corollary VI.9.10: j(O_F[1/2]) ≤ ρ ≤ r_1 − 1

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.6.1, Definition 9.6.1 (PDF p. 528; book p. 520). The definition, its bounds and monotonicity.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.6, before (9.6) (PDF p. 528; book p. 520). The map α^1 whose cokernel is taken, on H^1_et(R, ℤ/2).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.6.2, after (9.6.2) (PDF p. 529; book p. 521). The narrow-Picard characterisation u = t + j(R).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.10.1, Example 9.10.1 (PDF p. 532; book p. 524). The value j = 1 for ℤ[√7][1/2] used in the tests.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.8, proof (PDF p. 530; book p. 522). The value j = 0 for ℤ[1/2].

<a id="node-arithmeticktheory-n-6-order-ratio-for-totally-real-fields"></a>

### Orders of K-groups and of étale cohomology for a totally real field (Theorem VI.9.12)

**Theorem · `ArithmeticKTheory:N.6/order-ratio-for-totally-real-fields`.** Let F be a totally real number field with r_1 real embeddings and O_S a ring of S-integers in F. For every even i > 0, 2^{r_1} · |K_{2i−2}(O_S)| / |K_{2i−1}(O_S)| = ∏_ℓ |H^2_et(O_S[1/ℓ]; ℤ_ℓ(i))| / ∏_ℓ |H^1_et(O_S[1/ℓ]; ℤ_ℓ(i))|, all groups being finite and only finitely many factors differing from 1.

**Hypotheses and conventions.**

1. F totally real (r_2 = 0) and i even: 2i − 1 ≡ 3 (mod 4), so K_{2i−1}(O_S) has rank r_2 = 0 and every group in the formula is finite.
2. i > 0 even; O_S any ring of S-integers.

**Construction or proof.**

1. Finiteness from N.3/finiteness-and-ranks-combined and, for the cohomology, MotivicEtaleKTheory M.7 (source Ex. VI.8.2–8.3). Write h^{n,i}(ℓ) = |H^n_et(O_S[1/ℓ]; ℤ_ℓ(i))|.
2. h^{1,i}(ℓ) = w_i^{(ℓ)}(F): for ℓ odd this is the source's Exercise VI.8.3; for ℓ = 2 it follows from the Bockstein sequence of MotivicEtaleKTheory M.1, since H^0(O_S[1/2]; ℤ_2(i)) = 0 for i ≠ 0 and H^1 is finite, so H^1(ℤ_2(i)) ≅ H^0(ℚ_2/ℤ_2(i)) (the source cites Exercise VI.8.3, stated only for odd ℓ, in this case; recorded in sourceIssues).
3. The ℓ-primary part of K_{2i−1}(O_S) has order h^{1,i}(ℓ) for ℓ odd (N.5/odd-torsion-at-a-prime-where-cd-is-two) and for ℓ = 2 except that for 2i − 1 ≡ 3 (mod 8) it is 2^{r_1} h^{1,i}(2) (N.5/the-real-case-modulo-eight).
4. The ℓ-primary part of K_{2i−2}(O_S) has order h^{2,i}(ℓ) for ℓ odd (N.6/even-groups-at-odd-primes) and for ℓ = 2 (N.6/the-two-primary-corrections) except that for 2i − 2 ≡ 6 (mod 8) it is H̃^2, of order h^{2,i}(2)/2^{r_1} because α^2(i) is onto (the source prints h^{1,i}(2)/2^{r_1}, a misprint recorded in sourceIssues).
5. Multiply over ℓ: for i ≡ 2 (mod 4) the factor 2^{r_1} occurs in |K_{2i−1}|, for i ≡ 0 (mod 4) as the divisor of |K_{2i−2}{2}|, and in both cases 2^{r_1} · |K_{2i−2}| / |K_{2i−1}| = ∏ h^{2,i}(ℓ) / ∏ h^{1,i}(ℓ).

**Acceptance checks.**

1. F = ℚ, i = 2: 2 · |K_2(ℤ)| / |K_3(ℤ)| = 2 · 2 / 48 = 1/12, and the right side is |H^2(ℤ[1/2]; ℤ_2(2))| / w_2(ℚ) = 2/24, the odd H^2 vanishing because K_2(ℤ) has no odd torsion.
2. F = ℚ, i = 4: K_7(ℤ) ≅ ℤ/240 = ℤ/w_4(ℚ) and K_6(ℤ){2} = 0 (Corollary VI.9.8), so |H^2(ℤ[1/2]; ℤ_2(4))| = 2^{r_1} · |K_6(ℤ){2}| = 2; the printed h^{1,4}(2)/2^{r_1} = 16/2 = 8 would give K_6(ℤ){2} of order 8.
3. With Theorem VI.8.8 (proved for abelian F; owned by SpecialValuesBirchTate) the ratio is |ζ_F(1 − 2k)|: for F = ℚ and k = 1, ζ(−1) = −1/12 = −2 · 2/48.

**Prerequisites.** [ArithmeticKTheory:N.3/finiteness-and-ranks-combined](#node-arithmeticktheory-n-3-finiteness-and-ranks-combined); [ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two](#node-arithmeticktheory-n-5-odd-torsion-at-a-prime-where-cd-is-two); [ArithmeticKTheory:N.5/the-real-case-modulo-eight](#node-arithmeticktheory-n-5-the-real-case-modulo-eight); [ArithmeticKTheory:N.6/even-groups-at-odd-primes](#node-arithmeticktheory-n-6-even-groups-at-odd-primes); [ArithmeticKTheory:N.6/the-two-primary-corrections](#node-arithmeticktheory-n-6-the-two-primary-corrections); [ArithmeticKTheory:N.4/the-w-invariant](#node-arithmeticktheory-n-4-the-w-invariant); `MotivicEtaleKTheory:M.7`; `MotivicEtaleKTheory:M.1`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.12, Theorem 9.12 (PDF p. 533; book p. 525). Theorem 9.12; the displayed fraction is printed as a quotient, rendered here with the numerator and denominator separated.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.12, proof (PDF p. 533; book p. 525). h^{1,i}(ℓ) = w_i^{(ℓ)}(F), cited to Exercise 8.3.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.12, proof, second paragraph (PDF p. 533; book p. 525). The order of the ℓ-primary part of K_{2i−2}, with the printed misprint h^{1,i}(2)/2^{r_1}.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI, Exercise 8.3 (PDF p. 524; book p. 516). Exercise 8.3, stated for odd ℓ only.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.8, Theorem 8.8 (PDF p. 523; book p. 515). The zeta-value theorem that this order formula feeds, owned by SpecialValuesBirchTate.

<a id="node-arithmeticktheory-n-6-divisible-subgroup"></a>

### The subgroup of divisible elements

**Definition · `ArithmeticKTheory:N.6/divisible-subgroup`.** For an abelian group A, the subgroup of divisible elements is div A = ⋂_{m ≥ 1} m·A, the elements that map to zero in every quotient A/mA. It contains every divisible subgroup of A, is functorial for homomorphisms, commutes with direct sums, and is zero for a finite group. For a field F and n ≥ 1 it is applied to A = K_n(F), giving the source's div K_n(F); Tate observed that div K_2(F) can be nonzero for a number field.

**Hypotheses and conventions.**

1. A is any abelian group (an additive commutative group); Mathlib has the class DivisibleBy of divisible groups but no subgroup of divisible elements.
2. div A need not itself be divisible, so it is in general larger than the maximal divisible subgroup.

**Construction or proof.**

1. Define div A as the infimum over m ≥ 1 of the subgroups m·A (the range of multiplication by m).
2. Functoriality: f(m·A) ≤ m·B for f : A → B, so f(div A) ≤ div B.
3. Direct sums: an element of ⊕ A_i has finitely many nonzero components, so it is divisible by m exactly when each component is; hence div(⊕ A_i) = ⊕ div A_i.
4. Finite A: m = |A| gives m·A = 0.
5. Compatibility with mathlib:DivisibleBy: a subgroup D with DivisibleBy D ℤ lies in div A.

**Acceptance checks.**

1. div(ℚ/ℤ) = ℚ/ℤ, div ℤ = 0 and div A = 0 for A finite.
2. div K_2(ℚ) = 0 (test divisibleSubgroup_K2_rat).

**Prerequisites.** `mathlib:DivisibleBy`.

**Library API.**

- `divisibleSubgroup` (data): For an abelian group A, ⨅ m ≥ 1, (m • ⊤ : AddSubgroup A).
- `mem_divisibleSubgroup_iff` (characterisation): x ∈ divisibleSubgroup A ↔ ∀ m ≥ 1, ∃ y, m • y = x.
- `divisibleSubgroup_map_le` (functoriality): For f : A →+ B, (divisibleSubgroup A).map f ≤ divisibleSubgroup B.
- `divisibleSubgroup_directSum` (relation): divisibleSubgroup (⨁ i, A i) is the direct sum of the divisibleSubgroup (A i).
- `divisibleSubgroup_eq_bot_of_finite` (simp): If A is finite then divisibleSubgroup A = ⊥.
- `le_divisibleSubgroup_of_divisibleBy` (compatibility): If D ≤ A carries DivisibleBy D ℤ then D ≤ divisibleSubgroup A.

**Discriminating unit tests.**

- `divisibleSubgroup_ratCircle` (computation): divisibleSubgroup (ℚ ⧸ ℤ) = ⊤.
- `divisibleSubgroup_int` (degenerate): divisibleSubgroup ℤ = ⊥, and divisibleSubgroup A = ⊥ for every finite A.
- `divisibleSubgroup_ne_maxDivisible` (non-example): For a prime p, the p-group A generated by a and b_1, b_2, … with p·a = 0 and p^k·b_k = a has divisibleSubgroup A = ⟨a⟩ ≅ ℤ/p, which is not divisible; so div A is not the maximal divisible subgroup (which is 0 here).
- `divisibleSubgroup_K2_rat` (compatibility): divisibleSubgroup K_2(ℚ) = 0: K_2(ℚ) ≅ ℤ/2 ⊕ ⨁_p 𝔽_p^× (K2SymbolsBrauer T.5, Application III.6.5.1) is a direct sum of finite groups; in particular {−1, −1} is not divisible, since the real sign symbol K_2(ℚ) → {±1} kills 2·K_2(ℚ) and sends {−1, −1} to −1.
- `mem_divisibleSubgroup_iff_quotients` (characterisation): x ∈ divisibleSubgroup A exactly when the image of x in A/mA is 0 for every m ≥ 1 (the source's formulation).

**Consumers.**

- V.6.8.2: div K_n(F), the elements of K_n(F) mapping to zero in each K_n(F)/ℓ
- N.6/divisible-subgroup-and-the-wild-kernel: compared with the wild kernel
- Weibel 2006, Theorem A: div K_{2i}(F) ⊆ K^w_{2i}(F) with index at most two

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413). The definition of div K_n(F) as the elements vanishing in every K_n(F)/ℓ, and Tate's observation.

<a id="node-arithmeticktheory-n-6-divisible-subgroup-and-the-wild-kernel"></a>

### The divisible subgroup inside the wild kernel, with the exception for special fields

**Theorem · `ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel`.** Let F be a number field and i ≥ 1. Then div K_{2i}(F) ⊆ WK_{2i}(F), with index at most two. The two are equal when i is even or F is not special; when i is odd and F is special, div K_{2i}(F) has index two in WK_{2i}(F). Here F is special when it is exceptional (N.4/exceptional-fields-at-two) and for every prime 𝔭 of F over 2 there is a 2-primary root of unity ζ with ζ ∈ F_𝔭(√−1) but ζ ∉ F(√−1) (Hutchinson; Weibel 2006, Definition 5.2). The K-book states that div K_{2i}(F) is isomorphic to the wild kernel with no exception; that is false for special F and odd i (both groups are finite and their orders differ), and the exception is the exceptional dyadic case in which the stage text forbids asserting equality.

**Hypotheses and conventions.**

1. F is a number field; WK_{2i}(F) is the wild kernel of N.6/tame-and-wild-kernels; div is N.6/divisible-subgroup.
2. Special fields are among the exceptional ones; for quadratic fields ℚ(√d), F is special exactly when d ≡ −1 (mod 8) with d ≠ −1, or d ≡ ±2 (mod 16) with d ≠ ±2 (Weibel 2006, Example 5.3, after Hutchinson).
3. The theorem is Weibel 2006, Theorem A (for i = 1, Tate and Hutchinson); it is not proved in the K-book, and it is stated with that paper's definition of the wild kernel, whose agreement with the K-book's is recorded in the gap.

**Construction or proof.**

1. div K_{2i}(F) ⊆ WK_{2i}(F): each map defining the wild kernel in Weibel 2006, Definition 0.2, takes values in a finite group, μ^{⊗i}(F_v) or ℤ/2, where divisible elements are zero (Weibel 2006, the sentence after Definition 0.2).
2. The ℓ-primary parts agree for ℓ odd (Schneider; Banaszak–Kolster; Weibel 2006, §1), using N.6/even-groups-at-odd-primes and MotivicEtaleKTheory M.7.
3. The two-primary comparison, index at most two, and the characterisation of equality by i even or F not special (Weibel 2006, Theorem A, §§3–6; for i = 1 Hutchinson [Hu1, 4.4]): recorded as a gap, to be decomposed from that paper.

**Acceptance checks.**

1. F = ℚ: div K_2(ℚ) = WK_2(ℚ) = 0 (ℚ is exceptional but not special: μ_{2^∞}(ℚ_2(i)) = μ_4 ⊂ ℚ(i)).
2. F = ℚ(√−14) (special, −14 ≡ 2 mod 16): {−1, −1} lies in WK_2(F) but not in div K_2(F), and WK_2(F) ≅ div K_2(F) ⊕ ℤ/2 (Weibel 2006, Example 5.6, after Hutchinson [Hu2, 3.1]); so the two groups are not isomorphic.
3. For i even the two always agree, even for special F.

**Prerequisites.** [ArithmeticKTheory:N.6/divisible-subgroup](#node-arithmeticktheory-n-6-divisible-subgroup); [ArithmeticKTheory:N.6/tame-and-wild-kernels](#node-arithmeticktheory-n-6-tame-and-wild-kernels); [ArithmeticKTheory:N.6/even-groups-at-odd-primes](#node-arithmeticktheory-n-6-even-groups-at-odd-primes); [ArithmeticKTheory:N.4/exceptional-fields-at-two](#node-arithmeticktheory-n-4-exceptional-fields-at-two); `MotivicEtaleKTheory:M.7`; `KTheoryFiniteLocalFields:L.7`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413). The source's claim that div K_{2i}(F) is isomorphic to the wild kernel, attributed to [225] = Weibel, 'Higher wild kernels and divisibility in the K-theory of number fields', J. Pure Appl. Algebra 206 (2006) 222–244, whose Theorem A proves the corrected statement of this node (see sourceIssues).

**Open inputs.** The comparison of the divisible subgroup with the wild kernel rests on Weibel 2006, which corrects the K-book. See the gap register.

<a id="node-arithmeticktheory-n-6-keune-cyclotomic-picard-injection"></a>

### Keune’s cyclotomic Picard injection, in the scope needed by CGZ

**Theorem · `ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection`.** Let F be a number field, p an odd prime unramified in F, n=p^m (m≥1), L=F(ζ_n), G=Gal(L/F), and χ the cyclotomic character. In the setting used by CGZ Lemma 3.5 there is an injection (Pic(O_L[1/p])/p^m)_{χ⁻¹} → K₂(O_F)/p^m. The subscript denotes the twisted coinvariant quotient. This is the requested Keune theorem; its original proof and the translation of its exact hypotheses remain to be inspected.

**Hypotheses and conventions.**

1. p is odd and p∤disc(F); use the cyclotomic extension, twist and coinvariant convention of CGZ Lemma 3.5.
2. The further hypothesis p∤#K₂(O_F) is needed for the vanishing corollary, not asserted as part of the injection itself.

**Construction or proof.**

1. Import the Kummer exact sequence over O_L[1/p] from M.3, keeping Pic[p^m], Pic/p^m and the unit terms distinct.
2. Obtain and decompose Keune, On the structure of the K₂ of the ring of integers in a number field (1989), for the displayed injection; CGZ’s citation is presently the inspected evidence. This is an unresolved proof input.
3. For the HB.1 application, K₂(O_F)/p^m=0 forces the twisted Pic/p^m coinvariants to vanish. Use the finite p-primary module vanishing criterion to kill the corresponding twisted invariants of Pic[p^m]; do not replace coinvariants by a canonical invariants isomorphism.

**Acceptance checks.**

1. The p-unit class obtained from Kummer need not be an ordinary unit until the valuation obstruction at p is killed.
2. For the finite p-primary Picard modules with this cyclotomic G-action and χ⁻¹ twist, prove the needed invariants/coinvariants vanishing criterion; no canonical isomorphism between the two is asserted.

**Prerequisites.** [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); [ArithmeticKTheory:N.3/finiteness-and-ranks-combined](#node-arithmeticktheory-n-3-finiteness-and-ranks-combined); `MotivicEtaleKTheory:M.3`.

**Discriminating unit tests.**

- `keune_cyclotomic_picard_injection_1` (characterisation): The p-unit class obtained from Kummer need not be an ordinary unit until the valuation obstruction at p is killed.
- `keune_cyclotomic_picard_injection_2` (characterisation): For the finite p-primary Picard modules with this cyclotomic G-action and χ⁻¹ twist, prove the needed invariants/coinvariants vanishing criterion; no canonical isomorphism between the two is asserted.

**Source.** [CGZ.1712.04887v3.fix](https://arxiv.org/pdf/1712.04887v3), Lemma 3.5 and proof, PDF p.20. Paraphrase of the inspected passage, not a quotation. The proof uses Keune’s injection on twisted Picard coinvariants, followed by Kummer and valuation arguments.

**Open inputs.** Keune original proof and finite-module translation. See the gap register.

<a id="layer-n-7"></a>

## N.7. Regular primes and Bernoulli numbers

Fix the Bernoulli indexing, import N.4’s invariant, and connect regularity with cyclotomic eigenspaces. Apply Tate’s comparison to tame kernels and N.5/N.6 to torsion consequences. Vandiver remains an explicitly separate condition.

<a id="node-arithmeticktheory-n-7-bernoulli-conventions"></a>

### The two Bernoulli conventions, and the conversion between them

**Definition · `ArithmeticKTheory:N.7/bernoulli-conventions`.** Fix the ARITHMETIC convention: Mathlib's bernoulli, defined by the generating series t/(e^t − 1), so B_1 = −1/2, B_2 = 1/6 and B_n = 0 for odd n > 1. Mathlib's bernoulli' (B_1 = +1/2) differs from it only at index one (bernoulli_eq_bernoulli'_of_ne_one). The SOURCE uses neither: Weibel's K-book uses the topologists' numbers B_k^top = (−1)^(k+1) B_{2k} = |B_{2k}| (k ≥ 1), all positive, with B_1^top = 1/6, B_5^top = 5/66 and B_6^top = 691/2730. Every formula quoted from the source is therefore re-indexed here by k ↦ 2k: the source's B_k is the arithmetic B_{2k} up to sign. The denominator facts are von Staudt–Clausen, which the pinned Mathlib proves: for k ≥ 1 the denominator of B_{2k} is the product of the primes p with (p − 1) | 2k, hence squarefree and divisible by 6 (Bernoulli.vonStaudt_clausen, dvd_den_bernoulli, not_sq_dvd_den_bernoulli); and if (p − 1) ∤ 2k then p does not divide the denominator of B_{2k}/k even when p | k.

**Hypotheses and conventions.**

1. k is a natural number; the numbers are rational.
2. Both conventions are pinned in Mathlib, together with the lemma that they agree away from index one; this layer imports them and defines nothing new.
3. The statement about the denominator is von Staudt-Clausen with the refinement the source records; the numerator has no such description, which is what makes the regular-prime story non-trivial.

**Construction or proof.**

1. Import the two pinned definitions and the conversion lemma, and fix the arithmetic convention as this roadmap's default.
2. State the denominator facts as the source gives them, and record where each is proved in the pinned library.
3. Record the refinement: for p - 1 not dividing 2k, the prime p does not divide the denominator of B_k/k even if it divides k, the example being 5 dividing B_5.
4. Record that no statement of this roadmap may use a Bernoulli number without naming the convention, since the two differ exactly at the index the regular-prime criterion never uses but the topologists' formulas do.

**Acceptance checks.**

1. B_1 is minus one half in the arithmetic convention and plus one half in the other, and the two agree elsewhere.
2. The denominator of B_6 is 2730, which is the product of the primes p with p - 1 dividing 12, namely 2, 3, 5, 7 and 13.
3. The numerator has no analogous description, and a formalisation that treats it as computable by a closed formula is wrong.

**Prerequisites.** `mathlib:bernoulli`; `mathlib:bernoulli'`; `mathlib:bernoulli_eq_bernoulli'_of_ne_one`; `mathlib:bernoulli_one`; `mathlib:bernoulli'_one`; `mathlib:Polynomial.bernoulli`; `mathlib:Bernoulli.vonStaudt_clausen`; `mathlib:Bernoulli.dvd_den_bernoulli`; `mathlib:Bernoulli.not_sq_dvd_den_bernoulli`; `mathlib:bernoulli_eq_zero_of_odd`; `mathlib:bernoulli_two`.

**Library API.**

- `bernoulliArith` (data): The arithmetic Bernoulli numbers: Mathlib's bernoulli, used directly (no new definition).
- `bernoulliTop` (data): The source's topologists' numbers, bernoulliTop k := (−1)^(k+1) * bernoulli (2k), a named translation used only when quoting Weibel.
- `bernoulliTop_eq_abs` (characterisation): For k ≥ 1, bernoulliTop k = |bernoulli (2k)| > 0.
- `bernoulli_convert` (compatibility): bernoulli n = bernoulli' n for n ≠ 1 (Mathlib's bernoulli_eq_bernoulli'_of_ne_one); bernoulli' is NOT the source's convention.
- `bernoulli_one_arith` (simp): bernoulli 1 = −1/2 (Mathlib's bernoulli_one).
- `bernoulli_denominator` (compatibility): For k ≥ 1, (bernoulli (2k)).den = ∏_{p prime, (p−1) | 2k} p: von Staudt–Clausen with dvd_den_bernoulli and not_sq_dvd_den_bernoulli, all in the pinned Mathlib.
- `bernoulli_denominator_squarefree` (compatibility): For k ≥ 1, (bernoulli (2k)).den is squarefree and divisible by 6 (2 and 3 always qualify).

**Discriminating unit tests.**

- `b_one` (computation): bernoulli 1 = −1/2 and bernoulli' 1 = +1/2.
- `b_twelve_denominator` (computation): The denominator of bernoulli 12 = −691/2730 is 2730 = 2·3·5·7·13, the source's 'B_6 = 691/2730'; the arithmetic bernoulli 6 = 1/42. A statement that read the source's B_6 as bernoulli 6 fails.
- `agree_away_from_one` (compatibility): For every index other than one, bernoulli and bernoulli' agree.
- `five_divides_top_b_five` (non-example): The source's B_5 = 5/66 is bernoulli 10: 5 divides it but not the numerator of bernoulli 10 / 5 = 1/66. The arithmetic bernoulli 5 is 0, so reading the source's example with the arithmetic index is vacuous.
- `top_not_primed` (non-example): bernoulliTop 1 = 1/6 while bernoulli' 1 = 1/2: the source's convention is not Mathlib's bernoulli'.

**Consumers.**

- N.7, the invariant w: w_{2k}(Q) is the denominator of B_{2k}/4k in the arithmetic convention (the source's B_k/4k), so the re-indexing must be fixed first.
- N.7, Kummer's criterion: The criterion concerns the numerators of B_2, B_4, …, B_{p−3} (the source's B_1, …, B_{(p−3)/2}).
- The Handbook comparison: Parts of the K-theory literature use the topologists' numbering; a translated statement says which one it is in.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, the paragraph 'Bernoulli numbers' before Lemma 2.4, printed p. 472 (PDF p. 480). The source's convention and its first values, verbatim; the node re-indexes them. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, same paragraph, printed p. 472 (PDF p. 480). The denominator facts, in the source's indexing (its B_k = arithmetic B_{2k}). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4.1, printed p. 472 (PDF p. 480). The Kummer-congruence refinement and the example 5 | B_5 (arithmetic B_10 = 5/66). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Open inputs.** Washington's book, the source of Kummer's criterion, was not obtained; The Herbrand-Ribet theorem is quoted from a remark. See the gap register.

<a id="node-arithmeticktheory-n-7-w-invariant"></a>

### The Bernoulli denominator comparison for N.4’s invariant

**Theorem · `ArithmeticKTheory:N.7/w-invariant`.** Use N.4’s W_i(F) = H⁰(F, ℚ/ℤ(i)) and w_i(F) = |W_i(F)|, finite for a number field F and a positive integer i. This node introduces no second invariant. For Q, w_i(Q) = 2 when i is odd. For i = 2k with k ≥ 1, w_{2k}(Q) is the denominator of B_{2k}/(4k), with B_1 = −1/2; equivalently it is the denominator of B_k^top/(4k), where B_k^top = |B_{2k}|. Thus w_2(Q) = 24 and w_4(Q) = 240. For a positive even i and a prime l, l divides w_i(Q) if and only if l−1 divides i. The cyclotomic definition and the prime-power computations belong to N.4; N.7 compares them with its Bernoulli convention.

**Hypotheses and conventions.**

1. F is a number field and i is positive; N.4 supplies the invariant and its finiteness.
2. For the Bernoulli denominator formula F = Q, i = 2k and k ≥ 1. B_{2k} is Mathlib’s arithmetic Bernoulli number, not bernoulli' k.
3. The statement over Q is a comparison theorem about the denominator, not a definition.

**Construction or proof.**

1. Import N.4/the-w-invariant and N.4/finiteness-of-the-w-invariant. The largest-m description is N.4/exponent-criterion applied to the finite cyclic fixed-point group.
2. Import the odd value and the even prime-power product from N.4/w2-of-the-rationals-and-the-divisibility-tests; do not repeat their cyclotomic proofs.
3. Compare that product with the denominator of B_{2k}/(4k), using the convention of N.7/bernoulli-conventions and K-book VI.2.4. The sign of B_{2k} does not change its denominator.
4. The odd-prime factors are exactly those with l−1 dividing 2k, and the two-primary factor is 2^{2+v_2(2k)}. This gives the prime-divisibility criterion in positive even weight.
5. N.5 supplies the odd K-group torsion measured by w_i; SpecialValuesBirchTate B.3 consumes N.4’s invariant and N.8’s independent certificate. Neither result defines w_i.

**Acceptance checks.**

1. Over Q, w_2(Q) = 24 is the denominator of B_2/4 = (1/6)/4 = 1/24 in the arithmetic convention. The source’s B_1^top is B_2 = 1/6.
2. For odd i over the rationals the invariant is 2, so the odd twists contribute only two-torsion.
3. For the Gaussian rationals the invariant at i = 2 is again 24, which is what makes the third K-group of that field have a cyclic summand of order 24.

**Prerequisites.** [ArithmeticKTheory:N.7/bernoulli-conventions](#node-arithmeticktheory-n-7-bernoulli-conventions); [ArithmeticKTheory:N.4/the-w-invariant](#node-arithmeticktheory-n-4-the-w-invariant); [ArithmeticKTheory:N.4/exponent-criterion](#node-arithmeticktheory-n-4-exponent-criterion); [ArithmeticKTheory:N.4/finiteness-of-the-w-invariant](#node-arithmeticktheory-n-4-finiteness-of-the-w-invariant); [ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests](#node-arithmeticktheory-n-4-w2-of-the-rationals-and-the-divisibility-tests).

**Library API.**

- `wInvariant` (data): Reuse TauCeti.wInvariant from N.4/the-w-invariant; no new data declaration.
- `wInvariant_even` (characterisation): For a number field F and positive weight i, 2 divides N.4’s w_i(F).
- `wInvariant_odd_rat` (example): Over the rationals it is two for odd i.
- `wInvariant_even_rat` (characterisation): Over the rationals, for k ≥ 1, w_{2k}(Q) = the denominator of bernoulli (2k) / 4k.
- `wInvariant_prime_divides` (characterisation): For a positive even i and a prime l, l divides w_i(Q) if and only if l−1 divides i.
- `wInvariant_two_rat` (example): Its value at i = 2 over the rationals is 24.

**Discriminating unit tests.**

- `w_two_rat` (computation): w_2(Q) = 24 = denominator of (1/6)/4.
- `w_odd` (computation): For odd i, w_i(Q) = 2.
- `w_gaussian` (computation): w_2(Q(i)) = 24.
- `prime_divisibility` (computation): 7 divides w_6(Q) = 504, since 6 is divisible by 6.
- `w_four_rat` (non-example): w_4(Q) = 240 = denominator of bernoulli 4 / 8 = −1/240; the unconverted formula with bernoulli 2 = 1/6 would give 48.

**Consumers.**

- SpecialValuesBirchTate B.3: The Birch–Tate check consumes w_2 and N.8’s independently certified tame kernel; it does not provide either certificate bound.
- N.7, the torsion consequences: The Harris-Segal torsion of the odd K-groups has order this invariant.
- K3BlochGroups V.5: The third K-group of a number field has a cyclic summand of order this invariant at i = 2, which is the computation that packet carries.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4 (Lemma 2.4) and the recall of 2.1.2 before it, printed p. 472 (PDF p. 480). The value over the rationals, verbatim, in the source's indexing. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Open inputs.** Washington's book, the source of Kummer's criterion, was not obtained; The Herbrand-Ribet theorem is quoted from a remark. See the gap register.

<a id="node-arithmeticktheory-n-7-regular-prime"></a>

### Regular and irregular primes

**Definition · `ArithmeticKTheory:N.7/regular-prime`.** A prime p is IRREGULAR when it divides the class number of the p-th cyclotomic field, that is the order of the Picard group of the ring of integers of the field obtained by adjoining a primitive p-th root of unity; otherwise p is REGULAR. Iwasawa's equivalent form concerns the whole cyclotomic tower: p is regular exactly when, for every ν ≥ 1, the Picard group of the ring of integers of Q(μ_{p^ν}) has no p-torsion. The smallest irregular primes are 37, 59, 67, 101, 103, 131 and 149, and Siegel conjectured that asymptotically about 39 per cent of primes are irregular, a proportion the numerical evidence up to four million matches. The definition is about the class number and nothing else: no statement of this roadmap may fold Vandiver's conjecture, or any other class-group hypothesis, into the word regular.

**Hypotheses and conventions.**

1. p is a prime; the cyclotomic field is the one obtained by adjoining a primitive p-th root of unity, and the Picard group is that of its ring of integers.
2. Mathlib has the cyclotomic extension, the ring of integers and the class number, so the definition is a composition of pinned objects; what it does not have is the word, which neither library defines.
3. Iwasawa's equivalent form is quoted from the source and is not proved here.

**Construction or proof.**

1. Define irregularity as divisibility of the class number of the cyclotomic field by the prime, using the pinned class number.
2. Define regularity as its negation and record that it is decidable for a given prime once the class number is computed.
3. Record Iwasawa's equivalent form, that regularity is the absence of p-power torsion in the Picard group, as a quoted statement.
4. Record the list of the smallest irregular primes and the statistical expectation, both as data with the source named.
5. State the discipline the layer's text demands: regularity is this property and nothing more, and any theorem that needs Vandiver's conjecture or another class-group hypothesis states it separately.

**Acceptance checks.**

1. The first irregular prime is 37, so every prime below it is regular; this is the smallest instance of the definition.
2. Regularity is not the same as the absence of torsion in the class group of the real subfield, which is Vandiver's conjecture and is a separate statement.
3. The definition is decidable for a given prime, which is what makes the certified examples of N.8 possible.

**Prerequisites.** [ArithmeticKTheory:N.7/bernoulli-conventions](#node-arithmeticktheory-n-7-bernoulli-conventions); `mathlib:NumberField.classNumber`; `mathlib:IsCyclotomicExtension`; `mathlib:ClassGroup`; `mathlib:NumberField.RingOfIntegers`; `mathlib:Nat.Prime`; `mathlib:CyclotomicField`.

**Library API.**

- `IsRegularPrime` (data): The predicate on a prime.
- `IsRegularPrime.iff_not_dvd_classNumber` (characterisation): The definition: the prime does not divide the class number of the cyclotomic field.
- `IsRegularPrime.iwasawa` (characterisation): p is regular iff for all ν ≥ 1, p does not divide the class number of Q(μ_{p^ν}).
- `IsRegularPrime.decidable` (instance): Decidability for a given prime, once the class number is known.
- `not_isRegularPrime_37` (example): The prime 37 is irregular.
- `isRegularPrime_of_lt_37` (example): Every prime below 37 is regular.

**Discriminating unit tests.**

- `thirty_seven_irregular` (computation): The prime 37 is irregular, so the predicate fails there.
- `small_primes_regular` (computation): Every prime below 37 is regular.
- `not_vandiver` (non-example): The predicate is about the full cyclotomic class number, not about the real subfield; a definition that used the real subfield would be Vandiver’s condition and is a different predicate.
- `decidable_instance` (degenerate): For a given prime the predicate is decidable once the class number is computed.

**Consumers.**

- N.7, Kummer's criterion: The criterion is an equivalent condition on Bernoulli numerators for exactly this predicate.
- N.7, the tame kernel theorem: The vanishing theorem is stated for an odd regular prime.
- N.8: The certified examples are stated for explicit primes, and regularity is checked there.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4.1 (Example 2.4.1, Irregular Primes), printed p. 472 (PDF p. 480). The definition, Iwasawa's equivalent form and the list, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Open inputs.** Washington's book, the source of Kummer's criterion, was not obtained; The Herbrand-Ribet theorem is quoted from a remark. See the gap register.

<a id="node-arithmeticktheory-n-7-kummer-criterion"></a>

### Kummer's criterion, and what the numerators can be

**Theorem · `ArithmeticKTheory:N.7/kummer-criterion`.** An odd prime p is irregular exactly when it divides the numerator of one of the Bernoulli numbers B_2, B_4, …, B_{p−3} (arithmetic convention; the source's B_k with k ≤ (p−3)/2). Consequently, by Kummer's congruences, a regular prime divides the numerator of no B_{2k}/k: only irregular primes can. The criterion converts a class-number condition into a finite arithmetic check, which is what makes the regularity of a given prime decidable in practice and what ties this layer's two halves together.

**Hypotheses and conventions.**

1. p is an odd prime; the Bernoulli numbers are in the arithmetic convention, where the criterion is insensitive to the convention because it concerns even indices only.
2. The source states the criterion and attributes it to Kummer, referring to Washington's book for the proof; that book was not obtained and the criterion is not proved here.
3. The bound on k is (p-3)/2 and is part of the statement, since it is what makes the check finite.

**Construction or proof.**

1. State the criterion with its bound.
2. Record the direction that is used in practice: to certify that a prime is regular it suffices to check that it divides no numerator in the finite range.
3. Record the consequence through Kummer's congruences: a prime divides the numerator of B_k/k only if it is irregular, and the example that 5 divides the source's B_5 = B_10 = 5/66 but not the numerator of B_10/5.
4. Record the status: the criterion is quoted from the source, which cites Washington for the proof, and this packet does the same and records the gap.
5. Record the historical use the source records, Kummer's proof of the first case of Fermat's Last Theorem for regular exponents, as context and not as a target of this roadmap.

**Acceptance checks.**

1. For p = 37 the criterion is satisfied at B_32 (the source's k = 16), which is why 37 is the first irregular prime; the source records the same fact from the K-theoretic side.
2. For a prime below 37 the finite check finds no numerator divisibility, which certifies regularity.
3. The criterion is an equivalence, so it may be used in both directions, but the proof is imported in both.

**Prerequisites.** [ArithmeticKTheory:N.7/regular-prime](#node-arithmeticktheory-n-7-regular-prime); [ArithmeticKTheory:N.7/bernoulli-conventions](#node-arithmeticktheory-n-7-bernoulli-conventions).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4.1, printed p. 472 (PDF p. 480). The criterion, verbatim, in the source's indexing, with its reference for the proof. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4.1, the sentence after the criterion, printed p. 472 (PDF p. 480). Its consequence through Kummer's congruences, verbatim, with the source's reference. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4.1, the historical remark, printed p. 472 (PDF p. 480). The context, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Open inputs.** Washington's book, the source of Kummer's criterion, was not obtained; The Herbrand-Ribet theorem is quoted from a remark. See the gap register.

<a id="node-arithmeticktheory-n-7-eigenspaces-and-herbrand-ribet"></a>

### Character eigenspaces of the cyclotomic class group, and the Herbrand-Ribet theorem

**Theorem · `ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet`.** Let l be an odd prime, G the Galois group of the l-th cyclotomic field over the rationals, which is cyclic of order l-1, and P the Picard group of the ring of integers with the prime inverted, modulo l. Since l-1 is invertible modulo l, the group algebra of G over the field with l elements splits into the eigenspaces of the powers of the cyclotomic character, and P decomposes accordingly. The Herbrand-Ribet theorem identifies the eigenspaces that can be non-zero: for 1 ≤ k ≤ (l−3)/2, l divides the numerator of B_{2k} (arithmetic convention; the source's B_k) exactly when the eigenspace of index l−2k is non-zero. Among irregular primes below four thousand this happens for at most three values of k. The projectors are the usual idempotents of the group algebra, and their denominators are exactly the factor l-1, which is invertible; a statement that uses them must say so, since over the integers they do not exist.

**Hypotheses and conventions.**

1. l is an odd prime; the base field is the l-th cyclotomic field; the coefficients are the field with l elements.
2. The projectors require the inverse of l-1 and therefore do not exist integrally; every statement using them carries that restriction, which is the denominator restriction the layer's text demands.
3. The Herbrand-Ribet theorem is quoted from the source, which cites the original papers; it is not proved here.

**Construction or proof.**

1. Construct the idempotents of the group algebra attached to the powers of the cyclotomic character, and record the denominator l-1 and its invertibility modulo l.
2. Decompose the modulo-l Picard group into eigenspaces and prove that the decomposition is natural in the module.
3. State the Herbrand-Ribet theorem in the form the source gives: divisibility of the numerator of B_{2k} by l is equivalent to non-vanishing of the eigenspace of index l-2k.
4. Record the numerical statement: among irregular primes below four thousand at most three values of k occur.
5. Record how the eigenspace decomposition connects to the definition of regularity: the prime is regular exactly when every eigenspace vanishes, which is the class-number condition.

**Acceptance checks.**

1. For a regular prime every eigenspace vanishes, which is the class-number condition of the definition.
2. For l = 37 exactly one eigenspace is non-zero, at index 37 − 32 = 5, attached to B_32 (the source's k = 16), which the source records.
3. The projectors are not available over the integers, so an integral statement that used them would be wrong; the restriction is part of the statement.

**Prerequisites.** [ArithmeticKTheory:N.7/regular-prime](#node-arithmeticktheory-n-7-regular-prime); [ArithmeticKTheory:N.7/kummer-criterion](#node-arithmeticktheory-n-7-kummer-criterion); `mathlib:ZMod`; `mathlib:IsCyclotomicExtension`; `mathlib:ClassGroup`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.8.1 (Remark 10.8.1), printed p. 532 (PDF p. 540). The theorem and the numerical remark, verbatim, in the source's indexing. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.4.2 (Example 10.4.2), printed p. 530 (PDF p. 538). The eigenspace bookkeeping, verbatim; the packet had cited it as 10.4.1. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Open inputs.** Washington's book, the source of Kummer's criterion, was not obtained; The Herbrand-Ribet theorem is quoted from a remark. See the gap register.

<a id="node-arithmeticktheory-n-7-residue-field-units-prime-to-l"></a>

### The residue field above a cyclotomic prime has prime-to-l unit order

**Lemma · `ArithmeticKTheory:N.7/residue-field-units-prime-to-l`.** Let l be a prime, F = Q(mu_l), and P a maximal ideal of its ring of integers lying over (l) in Z. Then the actual quotient field k(P) = O_F/P has l elements, its multiplicative unit group has l−1 elements, and l does not divide that order. No regularity or oddness is assumed.

**Hypotheses and conventions.**

1. l is prime (including l=2); F is the l-th cyclotomic field over Q.
2. P is maximal in O_F and lies over the ideal (l) of Z; the quotient is the genuine ideal quotient, with its field structure.
3. The theorem is arithmetic and independent of tame-kernel or higher K-theory vanishing.

**Construction or proof.**

1. Use the pinned uniqueness theorem to identify P with (zeta−1), for a primitive l-th root. The previously cited inertia degree is one.
2. Use IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one at k=0, rewriting l^1=l, to obtain absolute norm l. Ideal.absNorm_apply and Submodule.cardQuot_apply identify this norm with the natural-number cardinality of O_F/P.
3. Install Ideal.Quotient.field P locally and apply Nat.card_units to get unit order l−1.
4. Since l≥2, 0<l−1<l; elementary divisibility implies l does not divide l−1. No K-theoretic input is used.

**Acceptance checks.**

1. For l=2, the quotient has two elements and the unit group has order one.
2. For l=5, the quotient has five elements and the unit group has order four.
3. Removing regularity does not change the result; a supposed proof importing regular-prime K-theory is circular for its intended use.

**Prerequisites.** `mathlib:CyclotomicField`; `mathlib:NumberField.RingOfIntegers`; `mathlib:Nat.Prime`; `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver'`; `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'`; `mathlib:IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one`; `mathlib:Ideal.absNorm_apply`; `mathlib:Submodule.cardQuot_apply`; `mathlib:Ideal.Quotient.field`; `mathlib:Nat.card_units`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.2 (Example 8.3.2), printed p. 514 (PDF p. 522); cyclotomic prime arithmetic in the pinned Mathlib declarations listed as prerequisites. The book supplies the single-prime localisation used by the tame-kernel application. The elementary residue-field/unit-order lemma is derived from the pinned cyclotomic norm and quotient-cardinality declarations, not attributed as a separately stated theorem of the book.

**Open inputs.** Washington's book, the source of Kummer's criterion, was not obtained; The Herbrand-Ribet theorem is quoted from a remark. See the gap register.

<a id="node-arithmeticktheory-n-7-tame-kernel-vanishing-at-a-regular-prime"></a>

### For an odd regular prime the l-primary tame kernel of the cyclotomic field vanishes

**Theorem · `ArithmeticKTheory:N.7/tame-kernel-vanishing-at-a-regular-prime`.** Let l be an odd regular prime and F the l-th cyclotomic field. Then the l-primary part of the tame kernel of F, that is of the second K-group of its ring of integers, vanishes. The proof combines three inputs: Tate's comparison, which identifies the second K-group modulo l with a Galois cohomology group; the class-group input, which is that the Picard group of the ring of integers has no l-torsion, by definition of regularity; and the local Brauer calculation, which is the exact sequence computing the Brauer group of a ring of S-integers from the real places and the finite places in S. Moreover, inverting the unique prime above l introduces no l-primary residue-field-unit term: that prime is totally ramified with inertia degree one, so its residue field is the field with l elements, whose unit group has order l-1, which is prime to l.

**Hypotheses and conventions.**

1. l is an odd regular prime; F is the l-th cyclotomic field; S is either empty or the singleton of the unique prime above l.
2. Tate's comparison is imported from MotivicEtaleKTheory M.3 and the tame kernel and its exact sequence from K2SymbolsBrauer T.5; neither is reproved here.
3. The ramification statement, that l has a unique prime above it with ramification index l-1 and inertia degree one, is pinned in Mathlib and is cited.

**Construction or proof.**

1. State the tame-kernel sequence for F, importing it from K2SymbolsBrauer T.5, and localise it at l.
2. Apply Tate's comparison to identify the l-primary part of the second K-group modulo l with the Galois cohomology of the twice-twisted roots of unity.
3. Use regularity: the Picard group has no l-torsion, so the class-group contribution to that cohomology vanishes.
4. Use the local Brauer calculation of the source's Classical Data to control the remaining contribution from the finite places.
5. Conclude the vanishing of the l-primary part.
6. For the S-integer version, use residue-field-units-prime-to-l: the unique prime above l has residue-unit order l−1, which is prime to l. Localisation therefore adds no l-primary residue term. This named arithmetic input is proved without K-theory and no longer hidden inside the vanishing application.

**Acceptance checks.**

1. For l = 5 the statement says that the tame kernel of the fifth cyclotomic field has no 5-torsion.
2. The residue-field remark is an elementary computation with the ramification data and does not need any K-theory; a proof that invoked a K-theoretic vanishing instead would be circular.
3. For an irregular prime the argument breaks at the class-group step, which is exactly where the eigenspace analysis of the previous node takes over.

**Prerequisites.** [ArithmeticKTheory:N.7/regular-prime](#node-arithmeticktheory-n-7-regular-prime); [ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet](#node-arithmeticktheory-n-7-eigenspaces-and-herbrand-ribet); `K2SymbolsBrauer:T.5`; `K2SymbolsBrauer:T.7`; `MotivicEtaleKTheory:M.3`; `mathlib:IsCyclotomicExtension`; `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'`; `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'`; `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver'`; [ArithmeticKTheory:N.7/residue-field-units-prime-to-l](#node-arithmeticktheory-n-7-residue-field-units-prime-to-l).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.2 (Example 8.3.2), printed p. 514 (PDF p. 522). The statement itself, for all K_{2i}, with the three inputs (Pic, |S| = 1, Br = 0); the packet did not cite it. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1 (Classical Data), (8.1.1), printed p. 513 (PDF p. 521). The Brauer sequence the argument uses. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.5 (Proposition 10.5), printed p. 530 (PDF p. 538). The analogous statement over the integers. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Open inputs.** Washington's book, the source of Kummer's criterion, was not obtained; The Herbrand-Ribet theorem is quoted from a remark. See the gap register.

<a id="node-arithmeticktheory-n-7-regular-prime-torsion-consequences"></a>

### Torsion in the K-groups at an odd regular prime

**Theorem · `ArithmeticKTheory:N.7/regular-prime-torsion-consequences`.** Let l be an odd regular prime. Then the even K-groups of the integers have no l-torsion, and the only l-torsion in the K-groups of the integers is the l-primary part Z/w_i(Q)_(l) of the Harris-Segal summand of the odd group K_{2i-1}, present exactly when i is divisible by l-1. With finite coefficients the statement is cleaner still: the mod-l K-theory of the integers with l inverted is a free graded module over the polynomial ring on β^(l-1), the (l-1)-st power of the Bott element, in degree 2l-2, with (l+3)/2 generators, namely the unit in degree zero, a class in degree 2l-3 and classes in the degrees 4k+1 for k from zero to (l-3)/2. The degrees and the character indices are part of the statement and may not be compressed.

**Hypotheses and conventions.**

1. l is an odd regular prime; the ring is the integers, or the integers with l inverted for the statement with finite coefficients.
2. The identification of the torsion as Harris-Segal summands is imported from the earlier parts of this roadmap, which own the etale descent computation.
3. The free-module statement is the source's Theorem 10.6, stated for l odd and regular.

**Construction or proof.**

1. State the vanishing of l-torsion in the even groups.
2. State the identification of the remaining l-torsion with the Harris-Segal summands, with the index condition that i is divisible by l-1.
3. State the free graded module structure with finite coefficients, with the explicit generator count and degrees.
4. Record the example the source gives for l = 5: the groups are eight-periodic with ranks 1, 1, 0, 0, 0, 1, 0, 1 in the degrees zero to seven, generated by a power of the Bott element times one of four explicit classes.
5. Record what is not claimed: nothing here is asserted at an irregular prime, where the module structure is not known and the eigenspace decomposition is the only available tool.

**Acceptance checks.**

1. For l = 5 the explicit periodic structure is the source's worked example, and the generator in degree five is attached to the golden ratio.
2. The count of generators is (l+3)/2, which for l = 5 is four, matching the four classes named.
3. At an irregular prime none of these statements is asserted.

**Prerequisites.** [ArithmeticKTheory:N.7/tame-kernel-vanishing-at-a-regular-prime](#node-arithmeticktheory-n-7-tame-kernel-vanishing-at-a-regular-prime); [ArithmeticKTheory:N.7/w-invariant](#node-arithmeticktheory-n-7-w-invariant); `K3BlochGroups:V.5`; [ArithmeticKTheory:N.5/harris-segal-summand](#node-arithmeticktheory-n-5-harris-segal-summand); [ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two](#node-arithmeticktheory-n-5-odd-torsion-at-a-prime-where-cd-is-two); [ArithmeticKTheory:N.6/even-groups-at-odd-primes](#node-arithmeticktheory-n-6-even-groups-at-odd-primes); [ArithmeticKTheory:N.6/even-groups-modulo-l](#node-arithmeticktheory-n-6-even-groups-modulo-l).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.5 (Proposition 10.5), printed p. 530 (PDF p. 538). The first two statements, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.6 (Theorem 10.6), printed p. 531 (PDF p. 539). The module statement, verbatim: the polynomial ring is on β^{ℓ−1}. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.6, the case ℓ = 5, printed p. 532 (PDF p. 540). The worked example, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Open inputs.** Washington's book, the source of Kummer's criterion, was not obtained; The Herbrand-Ribet theorem is quoted from a remark; Finite-coefficient Bott-module input for the regular-prime consequence has no supplier stage. See the gap register.

<a id="node-arithmeticktheory-n-7-vandiver-separation"></a>

### Vandiver's conjecture, and keeping the conditional results apart

**Comparison · `ArithmeticKTheory:N.7/vandiver-separation`.** Import Vandiver(l) from its single owner IntegralIwasawaTheory L3: for a prime l it is nondivisibility by l of the class number of Q(mu_l)^+, identified with the pinned maximal real subfield of CyclotomicField l Q. This node does not define a second predicate. Vandiver's conjecture asserts that for an irregular prime l the Picard group of the ring of integers of the maximal real subfield of the l-th cyclotomic field has no l-torsion; equivalently, that the representation of the Galois group on the modulo-l Picard group of the full cyclotomic field is a sum of odd twists of the roots of unity, which says that complex conjugation acts as minus one on the l-torsion. The 2013 source reports verification for all primes up to a hundred and sixty-three million and treats the global conjecture as open; this is historical source evidence, not a claim about the latest verification bound or current status. Under it, the K-groups of the integers are given by an explicit table, and in particular the groups K_{4i}(Z) with 4i ≥ 8 vanish (K_4(Z) = 0 is a theorem, of Rognes); the 2013 source states unconditionally that those higher groups have order a product of irregular primes greater than ten to the eighth, and their joint vanishing for all i ≥ 2 is equivalent to the global Vandiver conjecture at every odd prime. Every statement of this roadmap that uses the conjecture says so in its hypotheses, and no definition of regularity contains it.

**Hypotheses and conventions.**

1. l is an irregular prime; the real subfield is the fixed field of complex conjugation.
2. The equivalence between the two forms of the conjecture uses that complex conjugation is the unique element of order two in the Galois group, which the source records.
3. The conditional table is the source's Theorem 10.2 and is quoted as conditional.
4. The predicate and its transport to the intrinsic maximal-real-subfield model are supplied by IntegralIwasawaTheory L3; the equivalence and conditional K-theory consequences, not that definition, are owned here.

**Construction or proof.**

1. Import IntegralIwasawaTheory L3's predicate, whose exact contract is l not dividing the class number of the maximal real subfield of Q(mu_l). Prove the comparison to the odd-character condition on the full cyclotomic class group; do not introduce a second definition.
2. Record the verification bound as historical to the 2013 source, without claiming it is the current bound, and the historical remark that the statement was discussed by Kummer and Kronecker long before Vandiver.
3. State the conditional theorem: under the conjecture the K-groups of the integers are given by the explicit table.
4. State the unconditional order restriction for K_{4i}(Z), i≥2, and the equivalence of their joint vanishing with the global Vandiver conjecture at every odd prime. A hypothesis at one irregular prime is not the global conjecture; K_4(Z)=0 is an unconditional imported result.
5. State the discipline: a theorem conditional on the conjecture is labelled conditional, and the definition of a regular prime does not mention it.

**Acceptance checks.**

1. The conjecture is open, and a formalisation that assumed it silently would make the conditional table look unconditional.
2. The equivalence of the two forms is a statement about the action of complex conjugation and is proved, not assumed.
3. The unconditional statement about the groups in degrees divisible by four is weaker and is what may be used without the conjecture.

**Prerequisites.** [ArithmeticKTheory:N.7/regular-prime](#node-arithmeticktheory-n-7-regular-prime); [ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet](#node-arithmeticktheory-n-7-eigenspaces-and-herbrand-ribet); [ArithmeticKTheory:N.7/regular-prime-torsion-consequences](#node-arithmeticktheory-n-7-regular-prime-torsion-consequences); `IntegralIwasawaTheory:L3`; `mathlib:NumberField.maximalRealSubfield`; `mathlib:NumberField.of_subfield`; [ArithmeticKTheory:N.5/the-real-case-modulo-eight](#node-arithmeticktheory-n-5-the-real-case-modulo-eight); [ArithmeticKTheory:N.6/even-groups-at-odd-primes](#node-arithmeticktheory-n-6-even-groups-at-odd-primes); [ArithmeticKTheory:N.6/the-two-primary-corrections](#node-arithmeticktheory-n-6-the-two-primary-corrections).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.8 (Vandiver's Conjecture 10.8), printed p. 532 (PDF p. 540). The conjecture and the equivalence, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.1, the paragraph before Table 10.1.1, printed p. 527 (PDF p. 535). The unconditional statement and the equivalence, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.8.2 (Historical Remark 10.8.2), printed p. 532 (PDF p. 540). The historical remark, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Open inputs.** Washington's book, the source of Kummer's criterion, was not obtained; The Herbrand-Ribet theorem is quoted from a remark. See the gap register.

<a id="layer-n-8"></a>

## N.8. Certified examples

Import low-degree computations from their owners. Tate’s filtration and criterion supply the independent upper-generation arguments for Gaussian and real-quadratic tame kernels. The real-quadratic proof passes through ℚ(ζ₅), whose small-residue-generator source gap remains visible. Birch–Tate is a downstream check.

<a id="node-arithmeticktheory-n-8-certified-example-format"></a>

### What a certified example is

**Definition · `ArithmeticKTheory:N.8/certified-example-format`.** A certified example of this roadmap consists of three things: the ARITHMETIC DATA of the field, namely its degree, its signature, its class number, its unit rank and the invariants w_i, each with a proof or with the pinned declaration that computes it; a TAME-KERNEL CERTIFICATE (or, for an even K-group, an order certificate) in the format of ArithmeticKTheory N.6/order-certificate, that is a finite presentation with a proof that its generators span (the upper bound) and an independent lower bound — a surjection onto a group of the presented order, from symbols (the real sign, tame or Hilbert symbols), from cohomology (N.6/certificate-driven-computation) or from a complete kernel argument — so that an upper bound and a surjection are never reported as an isomorphism; and an explicit LABELLING of every number that is deduced rather than computed. The last is the rule the layer's text insists on: an order obtained from the Birch-Tate formula is a valid corollary of that formula and is labelled as one, it may not then be used as the independent test of the formula, and it may not supply either bound of a certificate that SpecialValuesBirchTate B.3 uses as that test (RT-AREA-ktheory-1/11).

**Hypotheses and conventions.**

1. F is a number field; the data are those of its ring of integers or of a ring of S-integers, as the example states.
2. The certificate format is ArithmeticKTheory N.6's (RT-AREA-ktheory-1/9) and is not redefined here; the tame kernel and its exact sequences are K2SymbolsBrauer T.5's.
3. The labelling rule is a condition on the example, not on the mathematics: the same equality may appear as a computation in one example and as a corollary in another, and the example says which.

**Construction or proof.**

1. Define the record of arithmetic data with a field for each invariant and a proof obligation attached to it.
2. Import the order certificate of N.6/order-certificate and record which of its fields are present in a given example.
3. Define the labelling: each numerical claim carries a tag saying whether it is computed, imported or deduced, and from what.
4. State the circularity rule: a claim tagged as deduced from a formula may not be cited as evidence for that formula, and may not fill a bound of a certificate used to test it.
5. Record the minimum an example must contain to be admissible: the arithmetic data, at least an upper bound for the tame kernel, and the labelling; it is certified only with both bounds.

**Acceptance checks.**

1. An example whose tame-kernel order is deduced from Birch-Tate is admissible and is labelled as a corollary; the same example may not then be listed as a test of Birch-Tate.
2. An example with a surjective presentation and no completeness proof reports an upper bound, not an order.
3. The arithmetic data half can be discharged from the pinned libraries for the small fields this layer uses, which is why those are the required first examples.
4. The tame-kernel certificates of this layer carry both bounds: K₂(ℤ) (span by K2SymbolsBrauer T.5's Silvester argument, lower bound the real sign symbol), K₂(ℤ[i]) = 0 (span by N.8/gaussian-tame-kernel-vanishes, trivial lower bound) and K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)² (span by N.8/real-quadratic-upper-generation, lower bound the two sign symbols).

**Prerequisites.** [ArithmeticKTheory:N.6/order-certificate](#node-arithmeticktheory-n-6-order-certificate); `mathlib:NumberField.classNumber`; `mathlib:NumberField.Units.rank`; `mathlib:NumberField.InfinitePlace.nrRealPlaces`; `mathlib:NumberField.InfinitePlace.nrComplexPlaces`.

**Library API.**

- `ArithmeticData` (structure): Degree, signature, class number, unit rank and the invariants w_i, with their proofs.
- `CertifiedExample` (structure): The arithmetic data, an order certificate in N.6's format (OrderCertificate) for the tame kernel, and the labelling.
- `CertifiedExample.tag` (projection): The tag of a numerical claim: computed, imported or deduced.
- `CertifiedExample.no_circularity` (characterisation): A claim tagged as deduced from a formula is not evidence for that formula.
- `CertifiedExample.admissible` (characterisation): The minimum an example must contain.

**Discriminating unit tests.**

- `deduced_not_evidence` (non-example): An order deduced from Birch-Tate cannot be listed as a test of Birch-Tate.
- `upper_bound_only` (degenerate): Without the lower bound (or a complete kernel argument) the example reports an upper bound, not an order.
- `rationals_admissible` (computation): The rational example is admissible: its three numbers are known independently.
- `data_from_libraries` (compatibility): For the small fields used here the arithmetic data can be discharged from the pinned libraries.
- `gaussian_certified` (computation): The Gaussian example is certified: no generators, span by N.8/gaussian-tame-kernel-vanishes, lower bound onto the trivial group; its tame-kernel order 1 is tagged computed.
- `sqrt_five_certified` (computation): The ℚ(√5) example is certified: generators {−1, −1}, {−1, ε} with relations 2g = 0, span by N.8/real-quadratic-upper-generation, lower bound the two sign symbols onto (ℤˣ)²; its order 4 is tagged computed, and the Birch–Tate identity 1/30 = 4/120 is tagged as B.3's test of it.

**Consumers.**

- N.8, every example: Each of the five required examples is an instance of this record.
- SpecialValuesBirchTate B.3: B.3 imports N.8's certified examples, the real-quadratic tame kernel among them, as the independent input of its Birch–Tate check (atlas edge N.8 → B.3); the labelling is what keeps that check independent.
- ArithmeticKTheory N.6/order-certificate: The certificate half is N.6's format, imported here; K2SymbolsBrauer T.5 supplies the tame kernel it is applied to.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, the worked case of the rationals, printed p. 515 (PDF p. 523). The shape of a certified example: three independently known numbers. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

<a id="node-arithmeticktheory-n-8-k-groups-of-the-integers"></a>

### The first K-groups of the integers

**Application · `ArithmeticKTheory:N.8/k-groups-of-the-integers`.** The required first computation: the zeroth K-group of the integers is the integers, the first is cyclic of order two, the second is cyclic of order two generated by the symbol of minus one with itself, the third is cyclic of order forty-eight, and the fourth vanishes. None is computed here: K₀(ℤ) = ℤ is KTheoryLowDegrees Z.6's, K₁(ℤ) = {±1} is KTheoryLowDegrees U.6's, K₂(ℤ) ≅ ℤ/2 with generator {−1, −1} is K2SymbolsBrauer T.5's (T.5/k2-of-the-integers, through Milnor's bound and the sign symbol), and K₃(ℤ) ≅ ℤ/48 is K3BlochGroups V.5's; the fourth is the source's table. This node records the five values with the roadmap that owns each, and the two consistency checks the layer's text asks for.

**Hypotheses and conventions.**

1. The ring is the integers; the groups are Quillen's K-groups.
2. Each value is attributed; none is proved here.
3. The fourth group vanishing is a theorem, unlike the groups in higher degrees divisible by four, whose vanishing is equivalent to Vandiver's conjecture.

**Construction or proof.**

1. Record the five values with their owners: Z.6 (K₀), U.6 (K₁), T.5/k2-of-the-integers (K₂), V.5 (K₃), the source's table (K₄).
2. Record the generator of the second group, the symbol of minus one with itself, and the sign symbol that detects it.
3. Record the first consistency check: the second group has order two while the second K-group of the rationals is infinite, and the tame-kernel sequence accounts for the difference.
4. Record the second consistency check: the third group has order forty-eight, which is twice the invariant w_2 of the rationals, matching the odd-degree formula for a field with a real place.
5. Record the boundary: the vanishing of the fourth group is a theorem, and the vanishing of the higher groups in degrees divisible by four is not.

**Acceptance checks.**

1. The third group has order forty-eight and the invariant w_2 of the rationals is twenty-four; the factor of two is the real place, as the general formula predicts.
2. The second group has order two, and the second K-group of the rationals is infinite; both are consistent with the tame-kernel sequence.
3. The fourth group vanishes; the eighth is only conjectured to vanish, and the packet says so.
4. As a certified example, K₂(ℤ) instantiates N.6's engine with T.5's bounds: one generator {−1, −1}, the relation 2g = 0, span by Milnor's bound, lower bound the real sign symbol onto ℤˣ (the instance orderCertificate_k2_int of ArithmeticKTheory N.6/order-certificate).

**Prerequisites.** [ArithmeticKTheory:N.8/certified-example-format](#node-arithmeticktheory-n-8-certified-example-format); [ArithmeticKTheory:N.7/w-invariant](#node-arithmeticktheory-n-7-w-invariant); [ArithmeticKTheory:N.7/vandiver-separation](#node-arithmeticktheory-n-7-vandiver-separation); `KTheoryLowDegrees:Z.6`; `KTheoryLowDegrees:U.6`; `K2SymbolsBrauer:T.5/k2-of-the-integers`; `K2SymbolsBrauer:T.5/k2-of-the-rationals`; `K3BlochGroups:V.5`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.1.1 (Table 10.1.1) and its note, printed p. 528 (PDF p. 536). The first column of the table (transcribed) and its note, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

<a id="node-arithmeticktheory-n-8-tate-norm-filtration"></a>

### Tate's filtration of K₂ by symbols of S_m-units

**Definition · `ArithmeticKTheory:N.8/tate-norm-filtration`.** Let F be a number field. List its finite places as v₁, v₂, … with N v_{m−1} ≤ N v_m, where N v = #k(v) is the absolute norm of the prime, and put S_m = {v₁, …, v_m}, S₀ = ∅. Let U_m be the group of S_m-units, the a ∈ F^× with v(a) = 0 at every finite place v ∉ S_m (so U₀ = 𝓞_F^×), and let K₂^{S_m}(F) be the subgroup of K₂(F) generated by the symbols {a, b} with a, b ∈ U_m. Then K₂^{S_0}(F) ⊆ K₂^{S_1}(F) ⊆ ⋯ exhausts K₂(F), the tame symbol ∂_{v_m} vanishes on K₂^{S_{m−1}}(F), and it induces the graded residue ∂_{v_m} : K₂^{S_m}(F)/K₂^{S_{m−1}}(F) → k(v_m)^×. When the prime of 𝓞_{S_{m−1}} at v_m is principal, generated by π, put U = U_{m−1}; then U_m = U × π^ℤ, and there are homomorphisms α : U → K₂^{S_m}(F)/K₂^{S_{m−1}}(F), u ↦ {u, π}, onto, and β : U → k(v_m)^×, u ↦ u mod v_m, with ∂_{v_m} ∘ α = β in the convention of K2SymbolsBrauer T.3/tame-symbol (∂_v{u, t} = ū). Finally U₁ ⊆ U is the subgroup generated by (1 + πU) ∩ U; it lies in ker β, and α kills it. This is the notation of Tate's method as Browkin and Zhang–Xu state it; the only data are the ordering of the places and, at a principal place, the generator π.

**Hypotheses and conventions.**

1. F is a number field; places of equal norm are ordered arbitrarily, and every statement below holds for any such ordering.
2. α, β and U₁ are defined at a place v_m whose prime in 𝓞_{S_{m−1}} is principal; every field this layer uses (ℚ(i), ℚ(√5), ℚ(ζ₅)) has class number one, so π can be taken in 𝓞_F.
3. K₂(F) is described by Matsumoto's presentation (K2SymbolsBrauer T.2/matsumoto); the tame symbols are T.3's.

**Construction or proof.**

1. Order the finite places by the absolute norm of their primes (mathlib:Ideal.absNorm); only finitely many places have a given norm, so the enumeration exists. Take U_m to be Mathlib's S-units (mathlib:Set.unit) for S = S_m.
2. Define K₂^{S_m}(F) as the subgroup generated by the symbols of U_m. It is monotone in m, and it exhausts K₂(F) because K₂(F) is generated by symbols (T.2/matsumoto) and each a ∈ F^× has non-zero valuation at only finitely many places (T.3/finite-support).
3. ∂_{v_m} vanishes on K₂^{S_{m−1}}(F): a symbol of two v_m-units has tame symbol 1 by T.3/tame-symbol. Hence the graded residue is defined on the quotient.
4. At a principal v_m with generator π, every element of U_m is uπ^r with u ∈ U. By bimultiplicativity {uπ^r, u′π^s} is a product of {u, u′}, powers of {u, π} and {u′, π}^{±1}, and {π, π}^{rs} = {π, −1}^{rs} (T.2/symbol-consequences); modulo K₂^{S_{m−1}}(F) this is a power product of values of α, so α is onto.
5. ∂_{v_m}{u, π} = ū for a v_m-unit u and the uniformiser π (T.3/tame-symbol), so ∂_{v_m} ∘ α = β.
6. U₁ ⊆ ker β because 1 + πx ≡ 1 mod π. α kills U₁: for x ∈ U with 1 + πx ∈ U, the Steinberg identity {1 + πx, −πx} = 1 (T.2/steinberg-identity, since −πx = 1 − (1 + πx)) gives {1 + πx, π} = {1 + πx, −x}^{−1}, a symbol of two elements of U, hence in K₂^{S_{m−1}}(F).
7. K₂^{S_0}(F) is generated by symbols of units of 𝓞_F and lies in the unramified subgroup of T.5/unramified-subgroup (symbol_mem_unramifiedSubgroup).

**Acceptance checks.**

1. For F = ℚ(i) the first place is v₁ = (1 + i), of norm 2, followed by the two places of norm 5, (2 + i) and (2 − i), in either order; U₀ = ⟨i⟩ and U₁ = ⟨i⟩ × (1 + i)^ℤ.
2. At v₁ = (1 + i) one has i = 1 + (1 + i)·i ∈ (1 + πU) ∩ U, so the subgroup U₁ of this node (not to be confused with the group of S₁-units) is all of U = ⟨i⟩.
3. For F = ℚ the filtration step at the prime p is generated, modulo the previous step, by the symbols {u, p} with u ∈ ⟨−1⟩ × ∏_{q<p} q^ℤ, and β is reduction mod p.

**Prerequisites.** `K2SymbolsBrauer:T.2/matsumoto`; `K2SymbolsBrauer:T.2/steinberg-identity`; `K2SymbolsBrauer:T.2/symbol-consequences`; `K2SymbolsBrauer:T.3/tame-symbol`; `K2SymbolsBrauer:T.3/finite-support`; `K2SymbolsBrauer:T.5/unramified-subgroup`; `mathlib:Set.unit`; `mathlib:Ideal.absNorm`.

**Library API.**

- `tateFiltration` (data): For a number field F and an enumeration v : ℕ → finite places of F with nondecreasing absolute norm, m ↦ K₂^{S_m}(F), the subgroup of K₂(F) generated by the symbols of the S_m-units (Set.unit with S = {v₁, …, v_m}).
- `tateFiltration_mono` (relation): Monotone in m.
- `iSup_tateFiltration` (characterisation): ⨆ m, tateFiltration F v m = ⊤: every element of K₂(F) lies in some step.
- `tameSymbol_eq_one_of_mem_tateFiltration` (simp): ∂_{v_m} x = 1 for x in step m − 1.
- `tateGradedResidue` (constructor): The homomorphism step m ⧸ step (m − 1) → k(v_m)ˣ induced by ∂_{v_m}.
- `tateAlpha` (constructor): For a generator π of the prime at v_m: u ↦ {u, π} from the S_{m−1}-units to step m ⧸ step (m − 1); surjective.
- `tateGradedResidue_comp_tateAlpha` (compatibility): tateGradedResidue ∘ tateAlpha = β, reduction modulo v_m, in T.3's convention ∂_v{u, t} = ū.
- `tateUnitSubgroup` (data): U₁, the subgroup of the S_{m−1}-units generated by (1 + πU) ∩ U.
- `tateAlpha_tateUnitSubgroup` (relation): tateAlpha kills tateUnitSubgroup, and tateUnitSubgroup ≤ ker β.
- `tateFiltration_zero_le_unramified` (compatibility): Step 0, generated by symbols of units of 𝓞_F, lies in K2SymbolsBrauer's unramifiedSubgroup.

**Discriminating unit tests.**

- `tateFiltration_zero_rat` (computation): For F = ℚ, step 0 is generated by the single unit symbol {−1, −1}.
- `tateUnitSubgroup_gaussian_one_add_i` (computation): For F = ℚ(i) at v₁ = (1 + i): i = 1 + (1 + i)·i, so tateUnitSubgroup = ⟨i⟩ = U₀.
- `tateFiltration_units_not_integers` (non-example): Over ℚ, {−1, 3} is not in step 1 (S₁ = {2}), since ∂₃{−1, 3} = −1 ≠ 1 in 𝔽₃^×; a filtration generated by symbols of S_m-integers instead of S_m-units would put it in step 0, among the symbols of integers.
- `tateFiltration_zero_le_unramified_rat` (compatibility): For F = ℚ, step 0 lies in the unramified subgroup of K2SymbolsBrauer T.5, which T.5/tame-kernel-sequence identifies with K₂(ℤ).
- `tateGradedResidue_surjective_rat_five` (characterisation): For F = ℚ at v = (5): β(2) = 2 generates 𝔽₅^×, so the graded residue is onto, and {2, 5} maps to 2.

**Consumers.**

- N.8/tate-criterion: Tate's criterion is a statement about the graded residue of one step, through α, β and U₁.
- N.8/gaussian-tame-kernel-vanishes and N.8/tame-kernel-of-q-zeta-five: both proofs show that every graded residue is bijective and conclude that the tame kernel equals step 0, generated by symbols of units.
- ArithmeticKTheory N.6/order-certificate: the span field of a tame-kernel certificate is discharged through this filtration in N.8's examples; N.6's format itself is not changed.

**Source.** [Browkin.2000](https://www.ams.org/journals/mcom/2000-69-232/S0025-5718-00-01182-0/S0025-5718-00-01182-0.pdf), §2, Notation (p. 1668). The filtration, its exhaustion and the induced graded residue. Prose verbatim from the publisher's text layer; sub- and superscripts transcribed.

**Source.** [Browkin.2000](https://www.ams.org/journals/mcom/2000-69-232/S0025-5718-00-01182-0/S0025-5718-00-01182-0.pdf), §2, Notation (p. 1668). The maps α, β and the group U₁. The facts that α is onto and kills U₁ are not stated there; proof steps 4 and 6 prove them from the Steinberg relations.

**Source.** [ZhangXu.2016](https://www.ams.org/journals/mcom/2016-85-299/S0025-5718-2015-03003-8/S0025-5718-2015-03003-8.pdf), §2, Preliminaries (p. 1524). The ordering of the places by norm. Verbatim from the publisher's text layer.

<a id="node-arithmeticktheory-n-8-tate-criterion"></a>

### Tate's criterion: when the graded tame symbol is bijective

**Theorem · `ArithmeticKTheory:N.8/tate-criterion`.** In the notation of N.8/tate-norm-filtration, let v = v_m (m ≥ 1) be a place whose prime is principal, generated by π, and put U = U_{m−1}, β : U → k(v)^× and U₁ = ⟨(1 + πU) ∩ U⟩. (a) Tate's Proposition 1. If W, C, G ⊆ U satisfy (1) W ⊆ C·U₁ and W generates U, (2) C·G ⊆ C·U₁ and β(G) generates k(v)^×, and (3) 1 ∈ C and C ∩ ker β ⊆ U₁, then the graded residue ∂_v : K₂^{S_m}(F)/K₂^{S_{m−1}}(F) → k(v)^× is bijective. (b) Tate's Lemma 1. If a, b ∈ 𝓞_F ∩ U, a ≡ b mod v and |N_{F/ℚ}(a − b)| < (N v)², then a/b ∈ U₁; for an imaginary quadratic F it suffices that |a| + |b| < N v. (c) Descent. If ∂_{v_j} is bijective for every j > m₀, then the tame kernel K₂(𝓞_F) is contained in K₂^{S_{m₀}}(F); if this holds with m₀ = 0, then K₂(𝓞_F) = K₂^{S_0}(F), the subgroup generated by the symbols of units of 𝓞_F.

**Hypotheses and conventions.**

1. F is a number field with its finite places ordered by norm (N.8/tate-norm-filtration); v = v_m is principal, generated by π.
2. W, C and G are arbitrary subsets of U; in the applications they are finite and explicit.
3. In (b) the elements a and b are integral, and N_{F/ℚ} is the field norm; in (c) the tame kernel is the unramified subgroup, identified with K₂(𝓞_F) by K2SymbolsBrauer T.5/tame-kernel-sequence.

**Construction or proof.**

1. Reduction to β. By N.8/tate-norm-filtration, α : U → K₂^{S_m}(F)/K₂^{S_{m−1}}(F) is onto, ∂_v ∘ α = β, and α and β both kill U₁. So ∂_v ∘ ᾱ = β̄ on U/U₁ with ᾱ onto, and it suffices to prove ker β ⊆ U₁: then β̄ is injective, hence ᾱ is injective, hence bijective, and ∂_v = β̄ ∘ ᾱ^{−1} is injective. ∂_v is onto because β(G) generates the finite group k(v)^×.
2. β̄ is injective on the image C̄ of C. In the finite group k(v)^× every element is a product of elements of the generating set β(G), inverses included. Given c, c′ ∈ C with β(c) = β(c′), choose g₁, …, g_r ∈ G with β(c·g₁⋯g_r) = 1. Applying (2) r times gives c·g₁⋯g_r ∈ c_r·U₁ with c_r ∈ C and β(c_r) = 1, so c_r ∈ U₁ by (3) and c·g₁⋯g_r ∈ U₁. The same word gives c′·g₁⋯g_r ∈ U₁, hence c/c′ ∈ U₁. (Browkin's Remark 1 records the related consequence β(C) = k^× of (2).)
3. C̄ = U/U₁. C̄ is finite, since β̄ is injective on it. By (2), multiplication by ḡ (g ∈ G) maps C̄ into itself, injectively, hence bijectively; so C̄ is stable under the subgroup ⟨Ḡ⟩ and contains it, because 1 ∈ C. As β̄ is injective on C̄ and β̄(⟨Ḡ⟩) = k(v)^×, C̄ = ⟨Ḡ⟩ is a subgroup. By (1) it contains W̄, which generates U/U₁. Hence β̄ is injective on U/U₁, which is (a).
4. (b): if a ≠ b, write a − b = πd with d ∈ 𝓞_F. Then |N(d)| = |N(a − b)|/N v < N v, so every prime factor of d has norm < N v and is one of v₁, …, v_{m−1}; hence d ∈ U, and a/b = 1 + π·(d/b) with d/b ∈ U and a/b ∈ U, so a/b ∈ (1 + πU) ∩ U ⊆ U₁. For imaginary quadratic F, |N(a − b)| = |a − b|² ≤ (|a| + |b|)² < (N v)².
5. (c): every x ∈ K₂(F) lies in some K₂^{S_m}(F). If x is unramified and m > m₀, then ∂_{v_m}(x) = 1 and bijectivity put x in K₂^{S_{m−1}}(F); descend to m₀. With m₀ = 0, conversely K₂^{S_0}(F) ⊆ K₂(𝓞_F), since symbols of units are unramified (T.5/unramified-subgroup).

**Acceptance checks.**

1. For F = ℚ(i) and v = (1 + i): W = {i} and C = G = {1} satisfy (1)–(3), because i = 1 + (1 + i)·i lies in (1 + πU) ∩ U; so the graded residue at the place of norm 2 is bijective onto the trivial group 𝔽₂^×.
2. For F = ℚ(i) at every place of norm at least 5 the sets of N.8/gaussian-tame-kernel-vanishes satisfy (1)–(3), and for ℚ(ζ₅) at every place those of Zhang–Xu do (N.8/tame-kernel-of-q-zeta-five); in both cases (c) holds with m₀ = 0.
3. (c) with m₀ = 0 for ℚ(ζ₅) is Zhang–Xu's reduction of K₂(ℤ[ζ₅]) to the six symbols {−1, −1}, {−1, ζ}, {−1, ξ}, {ζ, ζ}, {ζ, ξ}, {ξ, ξ}.
4. The criterion concerns one place at a time: Browkin notes that the number of places of small norm that must be treated individually grows quickly with the discriminant, which is why this layer uses the method only for fields of small discriminant.

**Prerequisites.** [ArithmeticKTheory:N.8/tate-norm-filtration](#node-arithmeticktheory-n-8-tate-norm-filtration); `K2SymbolsBrauer:T.3/tame-symbol`; `K2SymbolsBrauer:T.5/unramified-subgroup`; `K2SymbolsBrauer:T.5/tame-kernel-sequence`.

**Source.** [Browkin.2000](https://www.ams.org/journals/mcom/2000-69-232/S0025-5718-00-01182-0/S0025-5718-00-01182-0.pdf), §3, Theorem 1 (p. 1668). Part (a), verbatim. Browkin states it without proof and cites Tate's appendix to Bass–Tate (Lecture Notes in Mathematics 342, 1973, pp. 429–446), which was not obtained; proof steps 1–3 are written for this packet from the statement, using Browkin's Remark 1 (β(C) = k^×) as the first half of step 2.

**Source.** [Browkin.2000](https://www.ams.org/journals/mcom/2000-69-232/S0025-5718-00-01182-0/S0025-5718-00-01182-0.pdf), §3.2, Lemma 4 (p. 1671). Part (b) in the imaginary quadratic form, verbatim; stated without proof.

**Source.** [ZhangXu.2016](https://www.ams.org/journals/mcom/2016-85-299/S0025-5718-2015-03003-8/S0025-5718-2015-03003-8.pdf), §2, Lemma 2.2 (p. 1525). Part (b) for a general number field, verbatim (Zhang–Xu index the place as v_{m+1}); they cite Tate's letter to Iwasawa for the proof, which step 4 writes out.

**Source.** [Browkin.2000](https://www.ams.org/journals/mcom/2000-69-232/S0025-5718-00-01182-0/S0025-5718-00-01182-0.pdf), §2, Notation (p. 1668). Part (c), verbatim.

<a id="node-arithmeticktheory-n-8-gaussian-tame-kernel-vanishes"></a>

### K₂ of the Gaussian integers vanishes, by Tate's method

**Theorem · `ArithmeticKTheory:N.8/gaussian-tame-kernel-vanishes`.** K₂(ℤ[i]) = 0. More precisely, for F = ℚ(i) with its places ordered by norm, the graded residue ∂_{v_m} : K₂^{S_m}(F)/K₂^{S_{m−1}}(F) → k(v_m)^× is bijective for every m ≥ 1, and K₂^{S_0}(F) is generated by {i, i}, which is trivial; so the tame kernel, which is K₂(ℤ[i]) (K2SymbolsBrauer T.5/tame-kernel-sequence), vanishes. At a place of norm at least 5 Tate's criterion applies with C = G = the non-zero Gaussian integers c with 2N(c) ≤ N v, and W = {i} together with generators of the earlier primes; at the place 1 + i of norm 2 it applies with W = {i} and C = G = {1}. This is the span obligation of the Gaussian certificate of N.8/gaussian-and-imaginary-quadratic: the empty presentation generates.

**Hypotheses and conventions.**

1. F = ℚ(i), 𝓞_F = ℤ[i], a Euclidean domain (mathlib:GaussianInt.norm_mod_lt) and so a principal ideal domain, with unit group ⟨i⟩ of order 4; N(x) = |x|² = x·x̄.
2. The places are the Gaussian primes up to units, of norms 2 (the prime 1 + i), p for p ≡ 1 mod 4 (two places) and p² for p ≡ 3 mod 4; every place other than 1 + i has norm at least 5.
3. The vanishing is unconditional and uses no zeta value.

**Construction or proof.**

1. Small representatives. For π ≠ 0 every residue class mod π contains an r with 2N(r) ≤ N(π): round x/π to the nearest Gaussian integer, with error at most 1/2 in each coordinate. This is the intermediate bound normSq ≤ normSq(1/2 + i/2) = 1/2 in the proof of mathlib:GaussianInt.normSq_div_sub_div_lt_one, whose stated conclusion is only < 1; the suggested file states it as gaussian_two_mul_norm_mod_le.
2. Places of norm at least 5. Let v = v_m = (π), U = U_{m−1} = ⟨i⟩ × ∏_{j<m} π_j^ℤ. Put C = G = {c ∈ ℤ[i] : c ≠ 0, 2N(c) ≤ N v} and W = {i, π₁, …, π_{m−1}}, which generates U. Each c ∈ C has N(c) < N v, so its prime factors precede v and C ⊆ U ∩ ℤ[i]; and β(C) = k(v)^× by step 1.
3. Check (1)–(3) of N.8/tate-criterion with its part (b) in the form |a| + |b| < N v. (3): 1 ∈ C, and for c ∈ C ∩ ker β, |c| + 1 ≤ √(N v/2) + 1 < N v. (2): for c, c′ ∈ C choose c″ ∈ C with β(c″) = β(cc′); then |cc′| + |c″| ≤ N v/2 + √(N v/2) < N v because N v > 2. (1): for w ∈ W choose c ∈ C with β(c) = β(w); then |c| + |w| ≤ (1 + 1/√2)·√(N v) < N v because N v ≥ 5 > (1 + 1/√2)² ≈ 2.91. So ∂_v is bijective.
4. The place 1 + i. Here N v = 2, U = ⟨i⟩ and k(v)^× = 1. Take W = {i} and C = G = {1}: i = 1 + (1 + i)·i lies in (1 + πU) ∩ U ⊆ U₁, so (1)–(3) hold and ∂_{v₁} is bijective, that is K₂^{S_1}(F) = K₂^{S_0}(F). Directly: the Steinberg identity {i, 1 − i} = 1, 1 − i = −i(1 + i) and {i, −i} = 1 give {i, 1 + i} = 1.
5. Step 0. K₂^{S_0}(F) is generated by {i, i}, and {i, i} = {i, −1} = {i, i²} = {i, i}² (K2SymbolsBrauer T.2/symbol-consequences), so {i, i} = 1 and K₂^{S_0}(F) = 1.
6. By N.8/tate-criterion (c) with m₀ = 0, K₂(ℤ[i]) = K₂^{S_0}(F) = 1.

**Acceptance checks.**

1. {−1, −1} = {i², i²} = {i, i}⁴ = 1 in K₂(ℚ(i)), whereas {−1, −1} is the non-trivial element of K₂(ℤ) (K2SymbolsBrauer T.5/k2-of-the-integers): restriction to ℚ(i) kills it.
2. At v = (2 + i), N v = 5: ℤ[i]/(2 + i) ≅ 𝔽₅ with i ↦ −2, the elements ±1, ±i already map onto 𝔽₅^× = {1, 4, 3, 2}, and C = {±1, ±i, ±1 ± i}.
3. The bound N v ≥ 5 in step 3 is used: at the place of norm 2 the inequality |c| + |w| < N v fails for c = w = 1, and that place is treated by the explicit unit identity i = 1 + (1 + i)·i.
4. With this theorem the Gaussian certificate is complete: empty presentation, span by this node, trivial lower bound; no zeta value and no Birch–Tate statement enters.

**Prerequisites.** [ArithmeticKTheory:N.8/tate-criterion](#node-arithmeticktheory-n-8-tate-criterion); [ArithmeticKTheory:N.8/tate-norm-filtration](#node-arithmeticktheory-n-8-tate-norm-filtration); `K2SymbolsBrauer:T.2/symbol-consequences`; `K2SymbolsBrauer:T.2/steinberg-identity`; `K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`; `K2SymbolsBrauer:T.5/tame-kernel-sequence`; `mathlib:GaussianInt.normSq_div_sub_div_lt_one`; `mathlib:GaussianInt.norm_mod_lt`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2.2 (Example 5.2.2), printed p. 218 (PDF p. 226). The statement and its attribution to Tate, verbatim.

**Source.** [Browkin.2000](https://www.ams.org/journals/mcom/2000-69-232/S0025-5718-00-01182-0/S0025-5718-00-01182-0.pdf), §1, Introduction (p. 1667). The attribution of the Gaussian case to Tate, verbatim: ℤ[i] is a Euclidean imaginary quadratic ring.

**Source.** [Browkin.2000](https://www.ams.org/journals/mcom/2000-69-232/S0025-5718-00-01182-0/S0025-5718-00-01182-0.pdf), §1, Introduction (p. 1667). The shape of Tate's argument, verbatim. Tate's own computation for ℤ[i] (in his appendix to Bass–Tate) was not obtained: the sets C, G and W of steps 2–4 and the inequalities are this packet's application of N.8/tate-criterion, written out in full.

<a id="node-arithmeticktheory-n-8-gaussian-and-imaginary-quadratic"></a>

### The Gaussian integers: a vanishing tame kernel and a third K-group of order twenty-four

**Application · `ArithmeticKTheory:N.8/gaussian-and-imaginary-quadratic`.** For the Gaussian rationals the required computations are that the tame kernel vanishes and that the third K-group is the direct sum of the integers and a cyclic group of order twenty-four. The first is Tate's computation, recorded by the source together with the other imaginary quadratic rings of class number one for which the same vanishing holds; this node owns it as a certified example in N.6's format (RT-AREA-ktheory-1/9): the tame kernel K₂(ℤ[i]) — T.5's unramified subgroup of K₂(ℚ(i)) — is certified trivial by the empty presentation, whose span obligation, that every element of K₂(ℤ[i]) is trivial, is N.8/gaussian-tame-kernel-vanishes (Tate's method, through N.8/tate-criterion), the lower bound being trivial. The second follows from the general structure theorem for the third K-group of a number field: for a totally imaginary field with r_2 complex places the group is the direct sum of r_2 copies of the integers and a cyclic group of order the invariant w_2; the Gaussian rationals have one complex place and no real place, and their invariant w_2 is twenty-four, so the group is as stated.

**Hypotheses and conventions.**

1. The field is the Gaussian rationals and the ring is the Gaussian integers; the field is totally imaginary with one complex place and no real place.
2. The structure theorem for the third K-group is the source's Corollary 5.3, which K3BlochGroups V.5 owns and this layer imports; the case distinction between the totally imaginary case and the case with a real place is part of it.
3. The value twenty-four for the invariant is computed by N.7's node and is the same as for the rationals.

**Construction or proof.**

1. Gaussian certificate in N.6's format: no generators and no relations, span by N.8/gaussian-tame-kernel-vanishes, lower bound the trivial group; equivalently the complete kernel argument OrderCertificate.ofIsPresentation with B = A = 0. Identify the tame kernel with K₂(ℤ[i]) through T.5/tame-kernel-sequence, and record the other imaginary quadratic cases in the source.
2. State the structure theorem for the third K-group of a number field in both cases, totally imaginary and with a real place.
3. Compute the signature of the Gaussian rationals and its invariant w_2.
4. Substitute into the totally imaginary case to obtain the direct sum of the integers and a cyclic group of order twenty-four.
5. Record the contrast with the rationals, where the real place contributes the extra factor of two that gives order forty-eight, and record that this contrast is the point of having both examples.

**Acceptance checks.**

1. The tame kernel of the Gaussian integers vanishes, while that of the integers has order two; the difference is the absence of a real place.
2. The third K-group of the Gaussian rationals has torsion of order twenty-four and that of the rationals of order forty-eight, and both are instances of the same formula.
3. The vanishing is Tate's computation, proved in N.8/gaussian-tame-kernel-vanishes by Tate's criterion at every place; a formalisation may not derive it from the structure theorem, which does not give the tame kernel.
4. The certificate is complete: the presented group and the lower-bound group are both trivial, so soundness gives K₂(ℤ[i]) = 0 with no appeal to a zeta value.

**Prerequisites.** [ArithmeticKTheory:N.8/gaussian-tame-kernel-vanishes](#node-arithmeticktheory-n-8-gaussian-tame-kernel-vanishes); [ArithmeticKTheory:N.8/k-groups-of-the-integers](#node-arithmeticktheory-n-8-k-groups-of-the-integers); [ArithmeticKTheory:N.8/certified-example-format](#node-arithmeticktheory-n-8-certified-example-format); [ArithmeticKTheory:N.6/order-certificate](#node-arithmeticktheory-n-6-order-certificate); [ArithmeticKTheory:N.7/w-invariant](#node-arithmeticktheory-n-7-w-invariant); `K3BlochGroups:V.5`; `K2SymbolsBrauer:T.5/tame-kernel-sequence`; `K2SymbolsBrauer:T.5/unramified-subgroup`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.5.3 (Corollary 5.3), printed p. 488 (PDF p. 496). The structure theorem in both cases, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2.2 (Example 5.2.2), printed p. 218 (PDF p. 226). Tate's vanishing for Z[i] and the other rings, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

<a id="node-arithmeticktheory-n-8-s-integer-sequence-for-one-inverted-prime"></a>

### The localisation sequence of the integers with one prime inverted, in every degree

**Application · `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`.** Let p be a prime. The localisation sequence of ℤ ⊂ ℤ[1/p], whose fibre term is K_*(𝔽_p) (N.2/finite-support with R = ℤ and s = p), breaks up into short exact sequences 0 → K_n(ℤ) → K_n(ℤ[1/p]) → K_{n−1}(𝔽_p) → 0 for every n ≥ 1, and K₀(ℤ) → K₀(ℤ[1/p]) is an isomorphism. Hence K_n(ℤ[1/p]) ≅ K_n(ℤ) for odd n ≥ 3; for n = 2i ≥ 2, K_{2i}(ℤ[1/p]) is an extension of ℤ/(p^i − 1) by K_{2i}(ℤ), of order #K_{2i}(ℤ)·(p^i − 1); and in degree one K₁(ℤ[1/p]) = ℤ[1/p]^× = {±1} × p^ℤ ≅ ℤ/2 ⊕ ℤ (KTheoryLowDegrees U.6). In degree two the sequence is K2SymbolsBrauer T.5's relative sequence 0 → K₂(ℤ) → K₂(ℤ[1/p]) → 𝔽_p^× → 0 (residue at p ∈ S), imported, and it splits: the retraction K₂(ℚ) → K₂(ℤ) given by the real sign symbol (T.5/k2-of-the-rationals) restricts to K₂(ℤ[1/p]). In the degrees 2i ≥ 4 the extension class is not determined here. The demonstration is what the layer's text asks for ('demonstrate the S-integer exact sequence for Z[1/p]'), and N.8 owns it in every degree (RT-AREA-ktheory-1/9).

**Hypotheses and conventions.**

1. p is a prime; S = {p} (with the infinite place for the K-book's count of S-units); the ring is ℤ[1/p].
2. The localisation sequence is N.2's (the sequence of R → R[1/s] of N.2/finite-support); the injectivity of K_n(ℤ) → K_n(ℚ) for n ≥ 1 is Bass–Milnor–Serre in degree one (SK₁(ℤ) = 0), N.2/even-degree-injectivity in even degrees (T.5 in degree two) and Soulé's theorem (N.5/soule-theorem) in odd degrees n ≥ 3.
3. The extension class in degrees 2i ≥ 4 is not claimed; in degree two the splitting comes from the real place.

**Construction or proof.**

1. Take the localisation sequence of ℤ → ℤ[1/p] with fibre K_*(𝔽_p) (N.2/finite-support, dévissage for the p-torsion modules): ⋯ → K_n(𝔽_p) → K_n(ℤ) → K_n(ℤ[1/p]) → K_{n−1}(𝔽_p) → K_{n−1}(ℤ) → ⋯.
2. For n ≥ 1, K_n(ℤ) → K_n(ℚ) is injective (SK₁(ℤ) = 0, KTheoryLowDegrees U.6; N.2/even-degree-injectivity for even n; N.5/soule-theorem with S = ∅ for odd n ≥ 3); it factors through K_n(ℤ[1/p]), so K_n(ℤ) → K_n(ℤ[1/p]) is injective and every map K_n(𝔽_p) → K_n(ℤ), n ≥ 1, is zero.
3. Degree zero: K₀(𝔽_p) → K₀(ℤ) sends [𝔽_p] to [ℤ] − [pℤ] = 0 (N.2/the-three-classical-rows (a)), so 0 → K₁(ℤ) → K₁(ℤ[1/p]) → K₀(𝔽_p) = ℤ → 0 is exact and K₀(ℤ) ≅ K₀(ℤ[1/p]).
4. Insert Quillen's K_*(𝔽_p) (KTheoryFiniteLocalFields L.1): K_{2i}(𝔽_p) = 0 and K_{2i−1}(𝔽_p) ≅ ℤ/(p^i − 1) for i ≥ 1; this gives the odd-degree isomorphisms and the even-degree extensions.
5. Degree two: identify the sequence with T.5/relative-s-integer-sequence, and split it by restricting the retraction of T.5/k2-of-the-rationals.
6. Degree one: compare with K₁(ℤ[1/p]) = ℤ/2 ⊕ ℤ (KTheoryLowDegrees U.6), the map to K₀(𝔽_p) = ℤ being the p-adic valuation.

**Acceptance checks.**

1. p = 2: K₂(ℤ[1/2]) ≅ K₂(ℤ) = ℤ/2, since 𝔽₂^× is trivial.
2. p = 3: K₂(ℤ[1/3]) ≅ ℤ/2 ⊕ ℤ/2, split by the real sign symbol.
3. K₃(ℤ[1/p]) ≅ K₃(ℤ) ≅ ℤ/48 for every p, and K₄(ℤ[1/p]) ≅ ℤ/(p² − 1) since K₄(ℤ) = 0 (the source's table); for p = 2 this is ℤ/3.
4. Degree one: 0 → {±1} → {±1} × p^ℤ → ℤ → 0, the last map the p-adic valuation.
5. A formalisation that asserted a splitting in degrees 2i ≥ 4 would be claiming more than the argument gives.

**Prerequisites.** [ArithmeticKTheory:N.8/k-groups-of-the-integers](#node-arithmeticktheory-n-8-k-groups-of-the-integers); [ArithmeticKTheory:N.2/finite-support](#node-arithmeticktheory-n-2-finite-support); [ArithmeticKTheory:N.2/the-three-classical-rows](#node-arithmeticktheory-n-2-the-three-classical-rows); [ArithmeticKTheory:N.2/even-degree-injectivity](#node-arithmeticktheory-n-2-even-degree-injectivity); [ArithmeticKTheory:N.5/soule-theorem](#node-arithmeticktheory-n-5-soule-theorem); `KTheoryFiniteLocalFields:L.1`; `KTheoryLowDegrees:U.6`; `K2SymbolsBrauer:T.5/relative-s-integer-sequence`; `K2SymbolsBrauer:T.5/k2-of-the-rationals`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1 (Classical Data), printed p. 513 (PDF p. 521). The degree-zero and degree-one formulas. The printed rank r2 + |S| − 1 is wrong for fields with real places (it gives rank 0 for Z[1/p]); the node uses the correct rank r1 + r2 + |S| − 1 = 1, recorded as ArithmeticKTheory/E1. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.1 (Application 6.5.1), printed p. 236 (PDF p. 244). The sequence for the integers, which is one of the two compared. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1, Application 6.1 and (6.1.1) (PDF p. 414; book p. 406). The localisation sequence for R → R[1/s], here with R = ℤ and s = p, whose fibre is G_*(ℤ/p) = K_*(𝔽_p).

<a id="node-arithmeticktheory-n-8-the-rationals-infinite-against-finite"></a>

### The rationals: an infinite second K-group over a tame kernel of order two

**Application · `ArithmeticKTheory:N.8/the-rationals-infinite-against-finite`.** The explicit check the layer's text asks for: the second K-group of the rationals is infinite, being the direct sum of a cyclic group of order two and the direct sum over the primes of the multiplicative groups of the prime fields, while the tame kernel, that is the second K-group of the integers, has order two. The two statements are consistent because the tame-kernel sequence is exact and its right-hand term is the infinite direct sum; the splitting is given by the sign symbol at the real place. Both halves are K2SymbolsBrauer T.5's and are imported; what this node adds is the check itself and its record as a certified example.

**Hypotheses and conventions.**

1. The field is the rationals and the ring the integers.
2. Both computations are imported from K2SymbolsBrauer T.5 (T.5/k2-of-the-integers and T.5/k2-of-the-rationals); the sign symbol that splits the sequence is that layer's own contribution.
3. The infinite direct sum is over all primes, and each summand is finite cyclic, so the sum is infinite but torsion.

**Construction or proof.**

1. Record the two statements with their owner.
2. Record the exact sequence that relates them and the splitting by the sign symbol.
3. Perform the check: the finite group on the left and the infinite group in the middle are consistent exactly because the right-hand term is infinite.
4. Record the resulting certified example: three numbers, the order two, the infinitude, and the splitting, each tagged with its status.
5. Record the contrast with the Gaussian case, where the tame kernel vanishes and there is no real place to split the sequence.

**Acceptance checks.**

1. The second K-group of the rationals is infinite and torsion, which is not a contradiction.
2. The tame kernel has order two and is a direct summand, by the sign symbol.
3. The example is admissible in the sense of this layer's format: every number is tagged and none is deduced from Birch-Tate.

**Prerequisites.** [ArithmeticKTheory:N.8/certified-example-format](#node-arithmeticktheory-n-8-certified-example-format); [ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime](#node-arithmeticktheory-n-8-s-integer-sequence-for-one-inverted-prime); `K2SymbolsBrauer:T.5/k2-of-the-integers`; `K2SymbolsBrauer:T.5/k2-of-the-rationals`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.1 (Application 6.5.1), printed p. 236 (PDF p. 244). The decomposition that makes the check, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

<a id="node-arithmeticktheory-n-8-tame-kernel-of-q-zeta-five"></a>

### The tame kernel of ℚ(ζ₅) is trivial (Zhang–Xu)

**Theorem · `ArithmeticKTheory:N.8/tame-kernel-of-q-zeta-five`.** Let E = ℚ(ζ), ζ = ζ₅, with 𝓞_E = ℤ[ζ]. Then K₂(𝓞_E) = 0. Zhang and Xu prove it by Tate's method: the graded residue is bijective at every finite place of E, so K₂(𝓞_E) is generated by the symbols of the units −ζ and ζξ, ξ = 1 + ζ + ζ², that is by {−1, −1}, {−1, ζ}, {−1, ξ}, {ζ, ζ}, {ζ, ξ}, {ξ, ξ}; K₂(𝓞_E) has no element of order 2, so the symbols of order dividing two vanish, and {ζ, ξ} = 1 by the Steinberg identity. N.8 uses the theorem only through restriction and transfer to the real subfield ℚ(√5) (N.8/real-quadratic-upper-generation), where it supplies the odd and the four-torsion part of the upper bound without the Birch–Tate formula.

**Hypotheses and conventions.**

1. 𝓞_E = ℤ[ζ] is a principal ideal domain (mathlib:IsCyclotomicExtension.Rat.five_pid); [E : ℚ] = 4 (mathlib:IsCyclotomicExtension.finrank); E is totally complex with two complex places.
2. The unit group is ⟨−ζ⟩ × (ζξ)^ℤ (Zhang–Xu, from Dirichlet's unit theorem; the unit rank is 1 by mathlib:NumberField.Units.rank).
3. 2 is inert in E (2 has order 4 modulo 5), with residue field 𝔽₁₆; 5 is totally ramified, (5) = (1 − ζ)⁴; 11, 31, 41, 61 and 71 split completely.
4. Zhang–Xu's finite verifications at the places of norm at most 364 were made with GP/Pari; their tables give the data (generators of the primes, the sets C and G, the bounds M₁, M₂ and t) that a formal proof checks.

**Construction or proof.**

1. Generators. Each place v_{m+1} = (α) has a generator with |σ(ξ)| ≤ |σ(α)/α| ≤ |ξ| (Lemma 3.1, multiplying by powers of the unit ξ); W_m = {α₁, …, α_m} ∪ {−1, ζ, ξ} generates U_m.
2. Representatives. Coordinate rounding in the basis 1, ζ, ζ², ζ³ (Lemma 3.2, with the norm formula of Lemma 2.3) gives in every residue class a c with N(c) ≤ (25/16)·N(P_{m+1}) and both archimedean sizes at most |ξ| times those of α_{m+1}; C_m is a set of such representatives containing 1, and condition (3) of N.8/tate-criterion holds by Lemma 2.2, which is part (b) of that node.
3. Generators of the residue group. G_m consists of elements of small size whose residues generate k(v)^×: from Skalba's generalised Thue theorem when N(P_{m+1}) ≥ (2/π)⁴·|D| ≈ 20.53 (D = 125, recorded gap: the theorem was not obtained), and by the explicit lists of Tables 1 and 2 otherwise.
4. Condition (1): Theorem 3.3 for N(P_{m+1}) ≥ 90, from (N(w)^{1/2} + |wσ(c)| + |cσ(w)| + N(c)^{1/2})² ≤ 86.25·N(P_{m+1}) and Lemma 2.2; Theorem 3.4 for the places of norm below 90 (norms 5, 11, 16, 31, 41, 61, 71, 81), from explicit generators and a machine check.
5. Condition (2): Theorem 3.5 for N(P_m) > 364 by the analogous estimate (3.4); Theorem 3.6 for the places of norm at most 364 by the explicit data of Tables 1 and 2, machine-checked.
6. By N.8/tate-criterion (a) at every place and (c) with m₀ = 0, K₂(𝓞_E) = K₂^{S_0}(E), generated by the six symbols of −1, ζ and ξ; in particular K₂(𝓞_E) is finitely generated.
7. No element of order 2. Tate's Theorem (6.2) with l = 2 and S = {(2)} ∪ {the two complex places} (MotivicEtaleKTheory M.3): Pic(𝓞_{E,S}) = 0, a localisation of the principal ideal domain ℤ[ζ], and (∐_{v∈S−S_c} μ₂)₀ = 0, as only one place of S is not complex; so K₂(𝓞_{E,S})/2 = 0. The relative sequence 0 → K₂(𝓞_E) → K₂(𝓞_{E,S}) → 𝔽₁₆^× → 0 (K2SymbolsBrauer T.5/relative-s-integer-sequence) has cokernel of odd order 15, so K₂(𝓞_E)/2 = 0, and a finitely generated abelian group A with A = 2A is finite of odd order. Zhang–Xu quote this as the 2-rank formula r₁ + g₂ − 1 + rank₂ Cl(𝓞_E[1/2]) = 0 + 1 − 1 + 0 = 0, after Browkin.
8. Hence {−1, −1}, {−1, ζ} = {ζ, ζ} and {−1, ξ} = {ξ, ξ}, each of order dividing 2 (K2SymbolsBrauer T.2/symbol-consequences), vanish, and {ζ, ξ} = {ζ, 1 − ζ}·{ζ, ξ} = {ζ, 1 − ζ³} = {ζ⁶, 1 − ζ³} = {ζ³, 1 − ζ³}² = 1 (K2SymbolsBrauer T.2/steinberg-identity). So K₂(𝓞_E) = 0.

**Acceptance checks.**

1. The unit symbols reduce to six, and all six vanish: K₂(ℤ[ζ₅]) = 0.
2. The 2-rank formula gives 0 + 1 − 1 + 0 = 0 for ℚ(ζ₅) (no real place, one prime above 2, class number one) and 2 + 1 − 1 + 0 = 2 for ℚ(√5); the second agrees with the two sign symbols of N.8/real-quadratic-example-and-birch-tate.
3. The proof uses no zeta value and no Birch–Tate or Lichtenbaum statement: Browkin had conjectured the result assuming Lichtenbaum's conjecture, and Zhang–Xu prove it without that assumption.
4. The machine-checked cases are finite: Theorems 3.4 and 3.6 concern the places of norm at most 364, and a formalisation reproduces them from the data printed in the paper.

**Prerequisites.** [ArithmeticKTheory:N.8/tate-criterion](#node-arithmeticktheory-n-8-tate-criterion); [ArithmeticKTheory:N.8/tate-norm-filtration](#node-arithmeticktheory-n-8-tate-norm-filtration); `MotivicEtaleKTheory:M.3`; `K2SymbolsBrauer:T.5/relative-s-integer-sequence`; `K2SymbolsBrauer:T.5/tame-kernel-sequence`; `K2SymbolsBrauer:T.2/steinberg-identity`; `K2SymbolsBrauer:T.2/symbol-consequences`; `mathlib:IsCyclotomicExtension.Rat.five_pid`; `mathlib:IsCyclotomicExtension.finrank`; `mathlib:NumberField.Units.rank`.

**Source.** [ZhangXu.2016](https://www.ams.org/journals/mcom/2016-85-299/S0025-5718-2015-03003-8/S0025-5718-2015-03003-8.pdf), §3, Theorem 3.7 (p. 1536). The theorem and the reduction to unit symbols, verbatim from the publisher's text layer.

**Source.** [ZhangXu.2016](https://www.ams.org/journals/mcom/2016-85-299/S0025-5718-2015-03003-8/S0025-5718-2015-03003-8.pdf), §3, proof of Theorem 3.7 (p. 1537). The 2-rank step, verbatim; proof step 7 derives the formula's value from Tate's Theorem (6.2).

**Source.** [ZhangXu.2016](https://www.ams.org/journals/mcom/2016-85-299/S0025-5718-2015-03003-8/S0025-5718-2015-03003-8.pdf), §3.4, Theorem 3.3 (p. 1529). Condition (1) for the large places, verbatim; Theorems 3.4–3.6 are summarised in proof steps 4–5.

**Source.** [Tate.1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §6, Theorem (6.2), printed p. 270 (PDF p. 15). Transcribed from the page image; the subscript 0 denotes the elements with product 1.

**Open inputs.** Skalba's generalised Thue theorem, an input of Zhang–Xu's proof, was not obtained. See the gap register.

<a id="node-arithmeticktheory-n-8-real-quadratic-upper-generation"></a>

### {−1, −1} and {−1, ε} generate K₂ of the integers of ℚ(√5)

**Theorem · `ArithmeticKTheory:N.8/real-quadratic-upper-generation`.** Let F = ℚ(√5), 𝓞_F = ℤ[ε], ε = (1 + √5)/2. Every element of K₂(𝓞_F) lies in the subgroup generated by {−1, −1} and {−1, ε}; in particular 2·K₂(𝓞_F) = 0 and #K₂(𝓞_F) ≤ 4. Two inputs give this. First, K₂(𝓞_F) is killed by 2: restriction to E = ℚ(ζ₅) ⊇ F lands in K₂(𝓞_E) = 0 (N.8/tame-kernel-of-q-zeta-five), and transfer after restriction is multiplication by [E : F] = 2. Second, an element of order dividing 2 is a symbol {−1, b} by Tate's Theorem (6.1), and unramifiedness, class number one and the unit group force b ∈ ±ε^ℤ·2^ℤ·(F^×)², so {−1, b} is a product of {−1, −1} and {−1, ε}. This is the span obligation of the certificate of N.8/real-quadratic-example-and-birch-tate. Neither input uses a zeta value or the Birch–Tate formula.

**Hypotheses and conventions.**

1. F = ℚ(√5) ⊆ E = ℚ(ζ₅), since √5 = ζ − ζ² − ζ³ + ζ⁴ (the quadratic Gauss sum), and [E : F] = 2, as [E : ℚ] = 4 (mathlib:IsCyclotomicExtension.finrank).
2. 𝓞_F = ℤ[ε] is a principal ideal domain (mathlib:RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt: |d_F| = 5 < 16), its unit group is {±ε^n : n ∈ ℤ}, and 2 is inert, with residue field 𝔽₄.
3. K₂(𝓞_F) is identified with the unramified subgroup of K₂(F) by K2SymbolsBrauer T.5/tame-kernel-sequence, and likewise for E.

**Construction or proof.**

1. Arithmetic of F. Class number one from mathlib:RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt with n = 2 and r₂ = 0: the bound is (2·2²/2!)² = 16 > 5 = |d_F|. The prime 2 is inert because X² − X − 1, the minimal polynomial of ε, has no root modulo 2. The units are ±ε^n: the unit rank is 1 (mathlib:NumberField.Units.rank), and a unit (a + b√5)/2 > 1 has conjugate of absolute value < 1, so a = u + ū > 0 and b√5 = u − ū > 0, whence a, b ≥ 1 and u ≥ ε; so ε is the least unit greater than 1.
2. Killed by two. E = F(ζ) has degree 2 over F. For x ∈ K₂(𝓞_F) ⊆ K₂(F), res_{E/F}(x) is unramified at every finite place of E (T.5/unramified-subgroup, restriction), so it lies in K₂(𝓞_E) = 0 (N.8/tame-kernel-of-q-zeta-five). By K2SymbolsBrauer T.4/restriction-transfer-degree, applied to K₂ = K^M_2 through T.2/matsumoto, 2x = N_{E/F}(res_{E/F}(x)) = 0.
3. Two-torsion is a symbol. By Tate's Theorem (6.1) with l = 2 and z = −1 (MotivicEtaleKTheory M.3), x = {−1, b} for some b ∈ F^×.
4. Unramified condition. For a prime 𝔭 ∤ 2, ∂_𝔭{−1, b} = (−1)^{v_𝔭(b)} in k(𝔭)^× (K2SymbolsBrauer T.3/tame-symbol), and −1 ≠ 1 there, so v_𝔭(b) is even. At the inert prime (2) the residue field 𝔽₄ has −1 = 1, and there is no condition.
5. Class number one. b𝓞_F = (2)^k·𝔞² with 𝔞 = ∏_{𝔭∤2} 𝔭^{v_𝔭(b)/2} = (c); then u = b/(2^k c²) has valuation 0 everywhere, so u ∈ 𝓞_F^× = {±ε^n}.
6. Reduction. {−1, c²} = {−1, c}² = {1, c} = 1; {−1, 2} = {−1, 1 − (−1)} = 1 by the Steinberg identity (K2SymbolsBrauer T.2/steinberg-identity); {−1, ±ε^n} = {−1, ±1}·{−1, ε}^n. Hence x ∈ ⟨{−1, −1}, {−1, ε}⟩.
7. The subgroup is generated by two elements of order dividing 2, so it has at most 4 elements. This discharges the span field of ArithmeticKTheory N.6/order-certificate for the presentation with generators {−1, −1}, {−1, ε} and relations 2g = 0; the independent lower bound is the pair of sign symbols of N.8/real-quadratic-example-and-birch-tate.

**Acceptance checks.**

1. Cross-check by Tate's Theorem (6.2) with l = 2 and S = {the two real places, (2)}: K₂(𝓞_F[1/2])/2 ≅ (μ₂³)₀ ≅ (ℤ/2)², and the relative sequence with cokernel 𝔽₄^× of order 3 gives K₂(𝓞_F)/2 ≅ (ℤ/2)², the 2-rank r₁ + g₂ − 1 + rank₂ Cl(𝓞_F[1/2]) = 2 + 1 − 1 + 0 = 2.
2. Consistency with the source: the K-book lists ℚ(√p), p ≡ 3, 5 mod 8, among the 2-regular fields, whose K₂(𝓞_F) is (ℤ/2)^{r₁} plus a finite group of odd order; for ℚ(√5) the odd part is excluded by step 2.
3. The argument never mentions ζ_F(−1) or w₂(F): the Birch–Tate identity 1/30 = 4/120 of SpecialValuesBirchTate B.3 is a test this certificate passes, not an input.
4. Other candidate b give nothing new: {−1, 5} = {−1, √5}² = 1 and {−1, 2} = 1 in K₂(F).
5. Without step 2 the argument bounds only the 2-torsion subgroup; elements of odd order or of order 4 are excluded by restriction to ℚ(ζ₅) and transfer.

**Prerequisites.** [ArithmeticKTheory:N.8/tame-kernel-of-q-zeta-five](#node-arithmeticktheory-n-8-tame-kernel-of-q-zeta-five); `K2SymbolsBrauer:T.4/restriction-transfer-degree`; `K2SymbolsBrauer:T.5/unramified-subgroup`; `K2SymbolsBrauer:T.5/tame-kernel-sequence`; `K2SymbolsBrauer:T.3/tame-symbol`; `K2SymbolsBrauer:T.2/matsumoto`; `K2SymbolsBrauer:T.2/steinberg-identity`; `MotivicEtaleKTheory:M.3`; `mathlib:RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt`; `mathlib:NumberField.Units.rank`; `mathlib:IsCyclotomicExtension.finrank`.

**Source.** [Tate.1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §6, Theorem (6.1), printed p. 270 (PDF p. 15). The two-torsion step with l = 2 and z = −1. Transcribed from the page image.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.8 (Theorem 6.8), printed p. 239 (PDF p. 247). The same statement for every field, proved there through Hilbert's Theorem 90 for K₂; this packet imports the number-field case from MotivicEtaleKTheory M.3, Tate's arithmetic route. Prose verbatim from the text layer.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.9.2 (Example 9.9.2), printed p. 523 (PDF p. 531). The two-primary part for 2-regular fields; the example lists ℚ(√p) with p ≡ 3, 5 mod 8 among them. Used only as a consistency check (acceptance 2).

**Source.** [ZhangXu.2016](https://www.ams.org/journals/mcom/2016-85-299/S0025-5718-2015-03003-8/S0025-5718-2015-03003-8.pdf), title and abstract (p. 1523). The input of the restriction–transfer step. The deduction for the real subfield (step 2) is not in the paper; it is written for this packet from T.4/restriction-transfer-degree.

<a id="node-arithmeticktheory-n-8-real-quadratic-example-and-birch-tate"></a>

### An independent tame-kernel certificate for ℚ(√5), exported to SpecialValuesBirchTate B.3

**Application · `ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate`.** The required real quadratic example is F = ℚ(√5), with 𝓞_F = ℤ[(1 + √5)/2] and fundamental unit ε = (1 + √5)/2 of norm −1. The arithmetic data to certify are degree 2, signature (2, 0), class number 1 and unit rank 1 with fundamental unit ε. The tame-kernel certificate in N.6's format is K₂(𝓞_F) ≅ (ℤ/2)², generated by {−1, −1} and {−1, ε}. Lower bound: the sign symbols at the two real places, σ₁(√5) > 0 and σ₂(√5) < 0, give a homomorphism K₂(𝓞_F) → K₂(F) → (ℤˣ)² sending {−1, −1} to (−1, −1) and {−1, ε} to (1, −1) (σ₁(ε) > 0 > σ₂(ε)), hence onto a group of order 4; both symbols are symbols of units and so lie in the tame kernel. Upper bound: the finite presentation with generators {−1, −1}, {−1, ε} and relations 2g = 0 for each, whose span obligation — that the two symbols generate K₂(𝓞_F) — is N.8/real-quadratic-upper-generation (restriction to ℚ(ζ₅) and transfer, with Zhang–Xu's vanishing there, and Tate's description of the two-torsion). The certificate uses neither the Birch–Tate formula nor a zeta value: N.8 owns it and exports it to SpecialValuesBirchTate B.3, which combines it with its own computations of ζ_F(−1) = 1/30 and w₂(F) = 120 for the Birch–Tate check 1/30 = 4/120 (RT-AREA-ktheory-1/11); that check is B.3's and supplies neither bound here.

**Hypotheses and conventions.**

1. F = ℚ(√5) is real quadratic, so totally real with two real places; the ring is its ring of integers.
2. The format is N.6/order-certificate; the sign symbols are K2SymbolsBrauer T.5/real-sign-symbol at the two real embeddings, and the tame kernel is T.5's unramified subgroup, identified with K₂(𝓞_F) by T.5/tame-kernel-sequence.
3. The upper bound is N.8/real-quadratic-upper-generation, whose inputs are Zhang–Xu's theorem K₂(ℤ[ζ₅]) = 0 (N.8/tame-kernel-of-q-zeta-five), restriction and transfer (K2SymbolsBrauer T.4/restriction-transfer-degree) and Tate's Theorem (6.1) (MotivicEtaleKTheory M.3). Browkin and Schinzel's paper, which the K-book cites for 2-torsion in K₂ of quadratic fields, is not used.
4. Although the Birch–Tate formula is a theorem for this abelian field (Wiles, with the two-primary part; SpecialValuesBirchTate), reading #K₂(𝓞_F) = 4 off it would be a corollary, labelled as such, and not a certificate.

**Construction or proof.**

1. Certify the arithmetic data: degree and signature from the minimal polynomial X² − X − 1 of ε, the class number from the pinned quadratic-field and class-number API, the unit rank r_1 + r_2 − 1 = 1 (Mathlib's NumberField.Units.rank) with ε fundamental.
2. Lower bound: compute the two sign symbols of {−1, −1} and {−1, ε} (T.5/real-sign-symbol; K-book Ex. III.6.4 for the surjection K₂(F) → {±1}^{r_1}) and conclude that K₂(𝓞_F) → (ℤˣ)² is onto.
3. Upper bound: present K₂(𝓞_F) by the two generators with relations 2g = 0; the span obligation is N.8/real-quadratic-upper-generation.
4. Fill N.6/order-certificate: the presented group (ℤ/2)² and the lower-bound group (ℤˣ)² have order 4, so certificate soundness gives K₂(𝓞_F) ≅ (ℤ/2)², with the two symbols as a basis.
5. Export the certificate to SpecialValuesBirchTate B.3 as the independent input of its Birch–Tate check; its ζ-value and w₂(F) computations are B.3's and fill neither bound.

**Acceptance checks.**

1. The two sign symbols separate {−1, −1} and {−1, ε}: their images (−1, −1) and (1, −1) generate (ℤˣ)².
2. Without the generation argument the example would report #K₂(𝓞_F) ≥ 4 only; with N.8/real-quadratic-upper-generation it reports the order 4 and the isomorphism K₂(𝓞_F) ≅ (ℤ/2)².
3. The Birch–Tate identity 1/30 = (+1)·4/120 is SpecialValuesBirchTate B.3's check, which uses this certificate as its independent input; an order read off from the formula would be tagged as a corollary and could not fill either bound.
4. Every number in the example is tagged: degree, signature, class number and units are computed (Mathlib's Minkowski criterion and the unit argument of N.8/real-quadratic-upper-generation), the order 4 is computed from two independent bounds, and none is deduced from Birch–Tate.

**Prerequisites.** [ArithmeticKTheory:N.8/real-quadratic-upper-generation](#node-arithmeticktheory-n-8-real-quadratic-upper-generation); [ArithmeticKTheory:N.8/certified-example-format](#node-arithmeticktheory-n-8-certified-example-format); [ArithmeticKTheory:N.6/order-certificate](#node-arithmeticktheory-n-6-order-certificate); `K2SymbolsBrauer:T.5/real-sign-symbol`; `K2SymbolsBrauer:T.5/unramified-subgroup`; `K2SymbolsBrauer:T.5/tame-kernel-sequence`; `mathlib:NumberField.classNumber`; `mathlib:NumberField.Units.rank`; `mathlib:NumberField.InfinitePlace.nrRealPlaces`.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.6.4 (PDF p. 251; book p. 243). The sign symbols at the real places, the lower bound of the certificate (text layer as extracted; '֒ →' is the hooked arrow).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6 (Birch-Tate Conjecture 8.6), printed p. 515 (PDF p. 523). The formula whose independent test in SpecialValuesBirchTate B.3 this certificate feeds, and which may therefore not supply its bounds.

## Open inputs and coverage

The assembly retains each part’s source gaps and coverage limits. A source-decomposed statement can still depend on an imported proof with an open source gap. The Gaussian and real-quadratic generation nodes are supplied in the parts; their independent review remains open, and the real-quadratic chain depends on the recorded Skalba input.

### K-theory with finite coefficients has no supplier stage

Soulé's proof (V.6.8, PDF p. 420) and Proposition 6.8.1 (PDF pp. 420–421) have now been read in full. They use K-theory with ℤ/ℓ coefficients: its localisation sequence (V.5.2), the product on K_*(R; ℤ/ℓ) for ℓ ≢ 2 (mod 4) (IV.2.8), the Bott element β ∈ K₂(R; ℤ/ℓ) when ζ_ℓ ∈ R (IV.2.5.2), and the injectivity K₁(R; ℤ/ℓ) → K₁(F; ℤ/ℓ) (Ex. IV.2.3). No stage of data/atlas.json states these (searched: GeneralAlgebraicKTheory K.1–K.7, KTheoryFiniteLocalFields L.1–L.2, MotivicEtaleKTheory M.1–M.3, StableHomotopyKTheory H.2–H.3). NEXT ACTION: assign an owner, GeneralAlgebraicKTheory K.7 or KTheoryFiniteLocalFields L.1 being the natural candidates, and import from it.

Needed by: [ArithmeticKTheory:N.5/soule-mod-l-surjectivity](#node-arithmeticktheory-n-5-soule-mod-l-surjectivity); [ArithmeticKTheory:N.5/soule-theorem](#node-arithmeticktheory-n-5-soule-theorem).

### The comparison of the divisible subgroup with the wild kernel rests on Weibel 2006, which corrects the K-book

V.6.8.2 states that div K_{2i}(F) is isomorphic to the wild kernel and cites [225] = C. Weibel, 'Higher wild kernels and divisibility in the K-theory of number fields', J. Pure Appl. Algebra 206 (2006) 222–244. The author's preprint (dated 23 July 2004; https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf, SHA-256 2675756f…) was read on its pages 1–2 and 13–15: Theorem A says that div K_{2i}(F) has index 2 in K^w_{2i}(F) when i is odd and F is special, and that they are equal when i is even or F is not special; Example 5.6 (after Hutchinson) gives F = ℚ(√d), d < 0, d ≡ 2 (mod 16), with {−1, −1} ∈ K^w_2(F) ∖ div K_2(F). Two things are not established here: the proof of Theorem A (§§1–6 of that paper, and Hutchinson [Hu1, 4.4] for i = 1), and the agreement of the K-book's wild kernel (kernels of K_{2i}(F) → K_{2i}(F_v)) with Weibel's Definition 0.2 (kernels of the Dwyer–Friedlander maps K_{2i}(F) → K_{2i}(F_v) → H^2(F_v; μ^{⊗(i+1)}) ≅ μ^{⊗i}(F_v) at finite places, and to ℤ/2 at real places), which holds for i = 1 by Moore's theorem but is not proved for i ≥ 2 in either text. NEXT SOURCE ACTION: add the paper to the packet's sources, decompose Theorem A, and prove or cite the comparison of the two definitions; until then N.6/divisible-subgroup-and-the-wild-kernel is conditional on this gap.

Needed by: [ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel](#node-arithmeticktheory-n-6-divisible-subgroup-and-the-wild-kernel); [ArithmeticKTheory:N.6/tame-and-wild-kernels](#node-arithmeticktheory-n-6-tame-and-wild-kernels).

### Compatibility of the localisation sequence with base change along a finite extension

N.2's text asks for 'compatibility with extensions of fields'. The K-book proves the transfer (covariant) compatibility, (6.6.3)–(6.6.4) (PDF p. 418), which N.2/localisation-sequence-and-finite-extensions states. The contravariant compatibility, base change along R → R′ with the ramification index e(𝔭′|𝔭) multiplying the residue terms, is not stated in the sections read. NEXT SOURCE ACTION: find a source for it, or derive it from dévissage (R/𝔭 ⊗ R′ = ∏ R′/𝔭′^{e}) and record the derivation as a node.

Needed by: [ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions](#node-arithmeticktheory-n-2-localisation-sequence-and-finite-extensions).

### No stage names Suslin's computation of the torsion of K_*(F^s)

The e-invariant needs the Aut(F^s)-isomorphism K_{2i−1}(F^s)_tors ≅ µ(i) (K-book Proposition VI.1.7.1 and Exercise VI.1.1, proved from K_*(F^s; Z/m) ≅ Z/m[β] by rigidity, VI.1.3–1.4). MotivicEtaleKTheory M.7 ('Prove the relevant rigidity and étale descent theorems') is the nearest owner and is cited, but no stage text names this statement. NEXT ACTION: confirm with M.7 (or KTheoryFiniteLocalFields L.2, 'Prove rigidity ...') that it owns Suslin's theorem, and read K-book VI.1.1–1.7 to decompose it there.

Needed by: [ArithmeticKTheory:N.5/e-invariant](#node-arithmeticktheory-n-5-e-invariant).

### Harris and Segal's theorem is quoted, not proved

The proof of the Harris–Segal Theorem VI.2.5 rests on Corollary VI.1.5.2, which rests on Theorem VI.1.5, quoted from Harris–Segal [HS, Thm. 3.1] ('Ki groups of rings of algebraic integers', Ann. of Math. 101 (1975)): the surjectivity of π_*(B(µ_m ≀ Σ_∞)^+) → K_*(F_q) on ℓ-parts. NEXT SOURCE ACTION: read Harris–Segal §3 and decide its owner (it is K-theory of finite fields and of B(µ_m ≀ Σ_∞)^+, closest to KTheoryFiniteLocalFields L.1).

Needed by: [ArithmeticKTheory:N.5/harris-segal-summand](#node-arithmeticktheory-n-5-harris-segal-summand).

### Function-field Steinberg-homology proof remains to be read

Weibel IV.6.9 distinguishes [GQ82] for affine curves from [Q73] for number fields. Obtain the original function-field proof and decompose its integral homology theorem; the new nodes expose this dependency and do not claim it has been formalized.

Needed by: [ArithmeticKTheory:N.3:finite-generation/function-field-steinberg-finiteness](#node-arithmeticktheory-n-3-finite-generation-function-field-steinberg-finiteness); [ArithmeticKTheory:N.3:finite-generation/affine-curve-finite-generation](#node-arithmeticktheory-n-3-finite-generation-affine-curve-finite-generation); [ArithmeticKTheory:N.3:finite-generation/proper-curve-finite-generation](#node-arithmeticktheory-n-3-finite-generation-proper-curve-finite-generation).

### Keune original proof and finite-module translation

Read Keune (1989) and verify the injection, normalization of the χ⁻¹ coinvariant quotient and all ramification/root-of-unity hypotheses. CGZ Lemma 3.5 was read; its citation is not a proof decomposition of Keune. Decompose the finite p-primary module argument linking Pic/p^m coinvariants and Pic[p^m] invariants before declaring this API implemented.

Needed by: [ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection](#node-arithmeticktheory-n-6-keune-cyclotomic-picard-injection).

### Washington's book, the source of Kummer's criterion, was not obtained

The K-book states Kummer's criterion, that a prime is irregular exactly when it divides the numerator of one of the Bernoulli numbers in the finite range, and refers to Washington's Introduction to Cyclotomic Fields for the proof, as it does for Kummer's congruences. That book is not freely available and was not obtained. This packet states the criterion as the source states it, with the attribution, and proves nothing about it. NEXT SOURCE ACTION: obtain Washington, chapters 5 and 6, and decompose the proof of the criterion and of the congruences; both are needed before the criterion can be used as anything but an import.

Needed by: `ArithmeticKTheory:N.7`.

### The Herbrand-Ribet theorem is quoted from a remark

The eigenspace statement, that l divides the k-th Bernoulli number exactly when the eigenspace of index l-2k of the modulo-l class group is non-zero, appears in the K-book as a remark with a reference to the original papers of Herbrand and of Ribet. Neither was obtained. The node states the theorem in the form the remark gives and records the numerical statement that among irregular primes below four thousand at most three values of k occur. NEXT SOURCE ACTION: obtain Ribet's 1976 Inventiones paper and Herbrand's original, or Washington chapter 6, and decompose the proof; Ribet's half uses modular forms and is a substantial piece of work in its own right.

Needed by: `ArithmeticKTheory:N.7`.

### Skalba's generalised Thue theorem, an input of Zhang–Xu's proof, was not obtained

Zhang and Xu construct the sets G_m of small elements whose residues generate k(v)^× at the places of ℚ(ζ₅) of norm at least (2/π)⁴·125 ≈ 20.53 from M. Skalba's generalisation of Thue's theorem (J. Number Theory 46 (1994), 303–322), and their Theorem 3.5, condition (2) of Tate's criterion for the places of norm above 364, rests on it. The publisher's page refused access (HTTP 403) on 6 October 2026, and Browkin's Mathematics of Computation paper states the theorem only for imaginary quadratic fields. Everything else in N.8/tame-kernel-of-q-zeta-five is decomposed from the paper, which also prints the data of its machine-checked cases. NEXT SOURCE ACTION: obtain Skalba's paper, state the generalised Thue theorem for ℚ(ζ₅) with its constant, and decompose the construction of G_m (the proof of Skalba's Lemma 1.2 that Zhang–Xu cite).

Needed by: [ArithmeticKTheory:N.8/tame-kernel-of-q-zeta-five](#node-arithmeticktheory-n-8-tame-kernel-of-q-zeta-five).

### Finite-coefficient Bott-module input for the regular-prime consequence has no supplier stage

The graded statement of K-book VI.10.6 needs higher K-theory with ℤ/l coefficients, products and the Bott action, not just the integral Harris–Segal summand or the degree-two tame-kernel vanishing theorem. N.1’s gap “K-theory with finite coefficients has no supplier stage” applies to this consumer as well. The new N.5/N.6 node references supply integral torsion and arithmetic comparisons, but do not close this input. NEXT ACTION: assign the finite-coefficient product/Bott interface once and decompose the regular-prime graded-module proof at VI.10.6 against that interface.

Needed by: [ArithmeticKTheory:N.7/regular-prime-torsion-consequences](#node-arithmeticktheory-n-7-regular-prime-torsion-consequences).

**ArithmeticKTheory:N.2 remaining work.**

- The contravariant compatibility of the localisation sequence with base change along a finite extension (ramification indices on the residue terms) is not in the source read (gap).
- Gap: 'Compatibility of the localisation sequence with base change along a finite extension'.

**ArithmeticKTheory:N.3 remaining work.**

- The remaining items of the sub-stages N.3:finite-generation and N.3:ranks.

**ArithmeticKTheory:N.3:finite-generation remaining work.**

- Receive from BorelRegulators R.1 the building, the Solomon–Tits theorem, the Steinberg module and the integral finiteness of H_i(Γ; St_n(F)) for arithmetic Γ (request).
- Receive from StableHomotopyKTheory H.2 the cellular-functor spectral sequence and from H.6 Serre's theorem for simple spaces (requests); from H.1 the nerve and local-coefficient comparisons (request).

**ArithmeticKTheory:N.5 remaining work.**

- The real two-primary calculation, Theorem VI.9.4 with Lemma VI.9.3, is imported from MotivicEtaleKTheory M.7 (open request).
- The comparison of N.4's e-invariant with the identification K_{2i−1}(O_S){ℓ} ≅ W_i(F){ℓ}, and its kernel on the two-primary torsion in the class n ≡ 3 (mod 8), are not decomposed; the source shows only that e : K_3(ℚ) → ℤ/24 and e : K_{8k+3}(ℚ) → ℤ/w_{4k+2}(ℚ) are not injective (Example VI.2.1.2, Remark VI.2.1.3).
- Gap: 'K-theory with finite coefficients has no supplier stage'.
- Gap: 'No stage names Suslin's computation of the torsion of K_*(F^s)'.
- Gap: 'Harris and Segal's theorem is quoted, not proved'.

**ArithmeticKTheory:N.6 remaining work.**

- Corollary VI.9.9 (the 2-ranks r_1+s+t−1, j+s+t−1, j+s+t−1 and s+t−1 of K_n(O_S) for n ≡ 2, 4, 6, 8 mod 8) with Theorem VI.9.7 and Lemma VI.9.6.3, the source's computation of the even groups at 2 from class-group and unit data, are not yet nodes.
- Local norm groups, named in N.6's text, are not used by any node.
- The comparison with Selmer/cohomological kernels (V.6.8.2's description of div K_n(F) as the kernel of K_n(R; ℤ/ℓ) → K_n(F; ℤ/ℓ), and Weibel 2006, Lemma 0.3 and Corollary 0.4) is not decomposed.
- Theorem A of Weibel 2006 and the comparison of the two definitions of the wild kernel (gap: The comparison of the divisible subgroup with the wild kernel rests on Weibel 2006, which corrects the K-book).

**ArithmeticKTheory:N.7 remaining work.**

- Finite-coefficient Bott-module input for the regular-prime consequence has no supplier stage

## Supplier contracts

Requests below specify the interfaces consumed. The consolidated ownership proposals and their operational status are in [the assembly handoff](../handoff/ASM-ArithmeticKTheory.md).

### KTheoryLowDegrees:Z.4

(1) K₀(A) ≅ ℤ ⊕ Pic(A) by rank and determinant for a Dedekind domain A (KTheoryLowDegrees:Z.4/rank-pic-equivalence), used for A = S.integer F, with Pic compared to the class group (Mathlib's ClassGroup.equivPic) and Cl(O_{F,S}) ≅ Cl(𝓞_F)/⟨[𝔭] : 𝔭 ∈ S⟩ taken from Tau Ceti's IsDedekindDomain.integerClassGroupEquiv; this is N.1's target 'Import Z ... to obtain K₀(O_{F,S}) ≅ Z ⊕ Cl(O_{F,S})', and the former node N.1/K0-of-S-integers is deleted in its favour. (2) The restriction-of-scalars formula det_R(Res P) = Norm(det P)·det_R(R′)^{rank P} for the finite projective extension O_{F,S} ⊂ O_{F′,S′}. Z.4: 'Specialise to O_F and O_{F,S}, using the actual localised ring and the quotient of the class group by classes of primes in S. Compute the induced maps under localisation, extension of number fields and finite-flat restriction of scalars. The transfer of an ideal class requires the determinant/norm formula'. Z.4 is upstream of N.1, so its specialisation should be stated for Mathlib's Set.integer, which Tau Ceti already makes a Dedekind domain; the presentation of O_{F,S} as a localisation and its independence are N.1's ('Prove independence of a chosen presentation of O_{F,S} as a localisation') and must not be re-planned in Z.4's remaining item 'the number-field S-integer ring identification'. (3) The Steinitz classification P ≅ A^{n−1} ⊕ I, with P determined by rank and det P (Z.4/steinitz, Z.4/projective-classification), which counts the components of the strata of Quillen's rank filtration (N.3:finite-generation/rank-filtration) and the classes used in N.3:finite-generation/steinberg-homology-of-automorphism-groups.

Consumers: [ArithmeticKTheory:N.1/norms-transfers-and-pullbacks](#node-arithmeticktheory-n-1-norms-transfers-and-pullbacks); [ArithmeticKTheory:N.2/the-three-classical-rows](#node-arithmeticktheory-n-2-the-three-classical-rows); [ArithmeticKTheory:N.2/even-degree-injectivity](#node-arithmeticktheory-n-2-even-degree-injectivity); [ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion](#node-arithmeticktheory-n-3-finite-generation-quillen-finiteness-criterion); [ArithmeticKTheory:N.3:finite-generation/rank-filtration](#node-arithmeticktheory-n-3-finite-generation-rank-filtration); [ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups](#node-arithmeticktheory-n-3-finite-generation-steinberg-homology-of-automorphism-groups).

### KTheoryLowDegrees:U.4

SK₁(O_{F,S}) = 0 (Bass–Milnor–Serre), K₁(O_{F,S}) ≅ O_{F,S}^× by the determinant, O_{F,S}^× ≅ μ(F) ⊕ ℤ^{r₁+r₂+|S|−1}, and the comparison with the unit inclusion into K₁(F). U.4: 'Prove the Bass–Milnor–Serre result needed for SK₁(O_{F,S})=0, with F a number field and S finite ... Combine determinant with Dirichlet's S-unit theorem to identify K₁(O_{F,S}) ≅ O_{F,S}^×, O_{F,S}^× ≅ μ(F)⊕ℤ^{r₁+r₂+|S|−1} ... Compare finite-field and local-ring specialisations and the unit inclusion into K₁(F).' U.4 is upstream of N.1 through U.5, which the atlas lists. N.3:ranks cites U.4's Dirichlet S-unit theorem for the rank r₁ + r₂ + |S| − 1 of K₁(O_{F,S}), the degree-one exception to the period-four pattern (RT-AREA-ktheory-1/24 and /7); the checkpointed KTheoryLowDegrees U.1 packet plans it as U.4/s-unit-theorem, which this packet will cite by id once that packet is accepted.

Consumers: [ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant](#node-arithmeticktheory-n-1-k1-of-s-integers-and-the-determinant); [ArithmeticKTheory:N.5/soule-theorem](#node-arithmeticktheory-n-5-soule-theorem); [ArithmeticKTheory:N.1/transfer-and-norm-on-units](#node-arithmeticktheory-n-1-transfer-and-norm-on-units); [ArithmeticKTheory:N.2/even-degree-injectivity](#node-arithmeticktheory-n-2-even-degree-injectivity); [ArithmeticKTheory:N.3:ranks/borel-rank-theorem](#node-arithmeticktheory-n-3-ranks-borel-rank-theorem).

### BorelRegulators:R.1

The arithmetic-group input to Quillen's finite generation theorem, with R.1 as its single owner (RT-AREA-ktheory-1/1): (i) the Tits building T(V) of a finite-dimensional F-vector space V (the poset of proper non-zero subspaces, empty when dim V = 1), functorial in linear isomorphisms and GL(V)-equivariant; (ii) the Solomon–Tits theorem, T(V) ≃ a wedge of (dim V − 2)-spheres for dim V ≥ 2; (iii) the Steinberg module St(V) = H̃_{dim V−2}(T(V); ℤ), a free abelian group with its GL(V)-action (St(V) = ℤ for dim V = 1; reduced homology in dimension two); (iv) the correctly twisted arithmetic duality: for a number field F with r₁ real and r₂ complex places and a torsion-free subgroup G of finite index in GL_n(𝓞_F), H^{vcd−i}(G; M) ≅ H_i(G; M ⊗ D) with vcd = r₁·n(n+1)/2 + r₂·n² − n and integral coefficients, where D = St_n(F) ⊗ ℤ_χ^{⊗(n−1)} and χ = N_{F/ℚ} ∘ det : GL_n(𝓞_F) → {±1} (Putman–Studenmund, arXiv:1909.01217v4, Theorem C, p. 4, and the duality display, p. 2; the untwisted St_n(F) is wrong when n is even and 𝓞_F^× has an element of norm −1, their Example 1.4), or equivalently the untwisted duality for G ⊂ ker χ followed by descent; built on the Borel–Serre bordification from ArithmeticLocallySymmetricSpaces ALS.2 and its finite-level cohomology, with boundary ≃ T_n(F) and the orientation behaviour of their Proposition 2.1; (v) the finiteness consequence that N.3 imports: for every n ≥ 1 and every subgroup Γ ⊂ GL_n(F) commensurable with GL_n(𝓞_F), H_i(Γ; St_n(F)) is a finitely generated abelian group for every i ≥ 0 — integrally, not only after ⊗ ℚ — by (iv) for a torsion-free normal subgroup G ⊂ Γ ∩ GL_n(𝓞_F) of finite index (a finite K(G, 1) from the compact Borel–Serre quotient makes H^*(G; M) finitely generated for finitely generated M) and the Hochschild–Serre spectral sequence H_p(Γ/G; H_q(G; St)) ⇒ H_{p+q}(Γ; St) for the finite group Γ/G; n = 1 is the elementary case Γ ⊂ F^× commensurable with 𝓞_F^×. N.3 keeps the rank filtration, the commensurability of Aut_A(P) with GL_n(𝓞_F) for nonfree P, the low ranks and the assembly, and does not re-prove (i)–(v). R.1's text claims 'the finite-type homotopy consequences needed by K-theory'; what K-theory needs is exactly (v), and N.3's stage text should drop its clause 'Develop the arithmetic-group finiteness and finite-type homotopy input' (maintainer). Atlas edge R.1 → N.3:finite-generation exists; no cycle.

Consumers: [ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building](#node-arithmeticktheory-n-3-finite-generation-layer-poset-is-the-suspended-building); [ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups](#node-arithmeticktheory-n-3-finite-generation-steinberg-homology-of-automorphism-groups).

### BorelRegulators:R.3

Borel's rank theorem for orders, 𝓞_F included (K-book IV.1.17 and IV.1.18): for an order R in a finite-dimensional semisimple ℚ-algebra A, K_n(R) ⊗ ℚ ≅ K_n(A) ⊗ ℚ for n ≥ 2; for a number field F with r_1 real and r_2 complex places, dim_ℚ K_n(𝓞_F) ⊗ ℚ = dim_ℚ K_n(F) ⊗ ℚ = r_1 + r_2, r_2 or 0 for n ≥ 2 according as n ≡ 1 (mod 4), n ≡ 3 (mod 4) or n even. Used with A = F and R = 𝓞_F. The S-integer case is N.3:ranks's (RT-AREA-ktheory-1/7): 𝓞_{F,S} with S ≠ ∅ is not an order, and the passage uses N.2's localisation sequence and L.1, which are not R.3's ancestors; R.3's text should drop 'Include the commutative order and S-integer cases via the appropriate comparison/localisation results' for the S-integer part (maintainer; BorelRegulators' blueprint job). The higher regulator is not needed here; it is R.4's. Atlas edge R.3 → N.3:ranks exists; no cycle.

Consumers: [ArithmeticKTheory:N.3:ranks/borel-rank-theorem](#node-arithmeticktheory-n-3-ranks-borel-rank-theorem).

### GeneralAlgebraicKTheory:K.1

The K-groups K_n(C) = π_{n+1}(|NQ(C)|, 0) of an exact category, natural in exact functors, with π₁NQ(C) identified with ExactK0 and K_n(R) = K_n(P(R)) for a ring: used by N.2's localisation sequences and finite support, by Quillen's finiteness criterion (whose proof filters Q(P(R)) by rank) and by the e-invariant. K.1: 'Define K_n(C)=π_(n+1)(|NQ(C)|,0) for every natural number ... natural in exact functors ... Prove that π₁ NQ(C) is the existing ExactK0'. Two things the earlier request asked of K.1 are not in its text: Quillen's computation of K_*(𝔽_q) is KTheoryFiniteLocalFields L.1's, and compatibility with filtered colimits is GeneralAlgebraicKTheory K.7's. The rank filtration also uses the node K.1/exact-categories-and-Q-construction (morphisms of Q(A) as admissible layers, the isomorphisms of Q(A) as those of A, QCat.hom_zero) and K.1/K-groups-of-exact-categories (K_n = π_{n+1} BQ), cited by id.

Consumers: [ArithmeticKTheory:N.2/finite-support](#node-arithmeticktheory-n-2-finite-support); [ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers](#node-arithmeticktheory-n-3-finite-generation-finite-generation-of-k-of-s-integers); [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); [ArithmeticKTheory:N.2/the-three-classical-rows](#node-arithmeticktheory-n-2-the-three-classical-rows); [ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions](#node-arithmeticktheory-n-2-localisation-sequence-and-finite-extensions); [ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion](#node-arithmeticktheory-n-3-finite-generation-quillen-finiteness-criterion); [ArithmeticKTheory:N.5/e-invariant](#node-arithmeticktheory-n-5-e-invariant); [ArithmeticKTheory:N.3:finite-generation/rank-filtration](#node-arithmeticktheory-n-3-finite-generation-rank-filtration); [ArithmeticKTheory:N.3:finite-generation/comma-category-is-the-layer-poset](#node-arithmeticktheory-n-3-finite-generation-comma-category-is-the-layer-poset); [ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence](#node-arithmeticktheory-n-3-finite-generation-rank-spectral-sequence).

### GeneralAlgebraicKTheory:K.3

Quillen localisation for the Serre subcategory M_s(R) ⊂ M(R) with quotient M(R[1/s]), dévissage for finite-length torsion modules, and the resolution theorem giving K = G for Dedekind domains and fields. K.3: 'Prove dévissage for an appropriate full abelian subcategory closed under subobjects and quotients, with a finite filtration of every object ... Prove the resolution theorem ... Prove Quillen localisation for a Serre subcategory of a small abelian category and its quotient.' The projection formula, which this request also asked of K.3, is not in K.3's text; it is KTheoryLowDegrees U.5's (against K₀) and GeneralAlgebraicKTheory K.7's ('compatibility with ... transfers').

Consumers: [ArithmeticKTheory:N.1/norms-transfers-and-pullbacks](#node-arithmeticktheory-n-1-norms-transfers-and-pullbacks); [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); [ArithmeticKTheory:N.2/finite-support](#node-arithmeticktheory-n-2-finite-support); [ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions](#node-arithmeticktheory-n-2-localisation-sequence-and-finite-extensions); [ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers](#node-arithmeticktheory-n-3-finite-generation-finite-generation-of-k-of-s-integers).

### K2SymbolsBrauer:T.5

The tame kernel as a group and its exact sequences, which N.2 and N.6 import (RT-AREA-ktheory-1/9): T.5/unramified-subgroup (the tame kernel, defined by the vanishing of the tame symbols), T.5/tame-kernel-sequence (0 → K_2(O_F) → K_2(F) → ⊕_𝔭 k(𝔭)^× → 0, with injectivity from K_2(𝔽_q) = 0 and surjectivity from SK_1(O_F) = 0) T.5/s-integer-tame-kernel-sequence (0 → K_2(O_{F,S}) → K_2(F) → ⊕_{𝔭∉S} k(𝔭)^× → 0, residues at the primes outside S) and T.5/relative-s-integer-sequence (0 → K_2(O_F) → K_2(O_{F,S}) → ⊕_{𝔭∈S} k(𝔭)^× → 0, residues at the primes in S), stated separately. N.2/the-three-classical-rows identifies the degree-two segment of its localisation sequence with these sequences and does not re-prove them; the import is acyclic because T.5 derives them from K2SymbolsBrauer T.3/dedekind-localization-boundary and KTheoryLowDegrees U.4 (RT-AREA-ktheory-1/26) and lists no ArithmeticKTheory:N.2 prerequisite (the K2SymbolsBrauer packet revised for the same findings; its request to N.2 is withdrawn). The certificate format is no longer requested: it is N.6/order-certificate, and T.5 drops its competing certificate paragraph and T.5/certified-presentation (RT-AREA-ktheory-1/9).

Consumers: [ArithmeticKTheory:N.2/the-three-classical-rows](#node-arithmeticktheory-n-2-the-three-classical-rows); [ArithmeticKTheory:N.2/even-degree-injectivity](#node-arithmeticktheory-n-2-even-degree-injectivity); [ArithmeticKTheory:N.6/tame-and-wild-kernels](#node-arithmeticktheory-n-6-tame-and-wild-kernels).

### K2SymbolsBrauer:T.7

T.7/classical-local-symbols (the Hilbert symbols of local fields, with their normalisation) and T.7/twisted-roots-of-unity (the trivialisation of μ_ℓ^{⊗i} by a root of unity in F). Tate's comparison K_2/m ≅ H² and its S-integer extension are no longer requested from T.7: MotivicEtaleKTheory M.3 owns them (RT-AREA-ktheory-1/8; request to M.3). The twisted coefficient modules themselves are MotivicEtaleKTheory M.1's (reviewed T.7/twisted-roots-of-unity: 'The twists themselves are M.1's'), so N.4 imports them from M.1 (a separate request); no N.4 node depends on T.7.

Consumers: [ArithmeticKTheory:N.6/tame-and-wild-kernels](#node-arithmeticktheory-n-6-tame-and-wild-kernels); [ArithmeticKTheory:N.6/l-rank-from-class-group-data](#node-arithmeticktheory-n-6-l-rank-from-class-group-data).

### MotivicEtaleKTheory:M.7

(a) For ℓ odd, or ℓ = 2 with F totally imaginary, and R = O_S[1/ℓ], i ≥ 1: K_{2i}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^0(R; ℚ_ℓ/ℤ_ℓ(i)), K_{2i−1}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^1(R; ℚ_ℓ/ℤ_ℓ(i)), K_{2i−1}(R; ℤ_ℓ) ≅ H^1(R; ℤ_ℓ(i)) and K_{2i}(R; ℤ_ℓ) ≅ H^2(R; ℤ_ℓ(i+1)), natural in R, with the vanishing and finiteness statements of the source's Exercises VI.8.1–8.3 (proof of VI.8.2). M.7's text: 'At odd ℓ and j≥2 the expected arithmetic outputs identify K_{2j−1} with H¹ of twist j and K_{2j−2} with H² of twist j after the stated ℓ-adic passage.' (b) At 2 with real places, Theorem VI.9.4: for O_S ⊇ O_F[1/2], α^1_S(4k) is onto for k > 0 and K_n(O_S; ℚ_2/ℤ_2) is given by the eight-row table, with the non-split extension in degree 8k+4 detected by comparison with ℝ and the undetermined extension in degree 8k+5, all induced by the natural morphism of descent spectral sequences to r_1 copies of that of ℝ (with Lemma VI.9.3 and the spectral sequences of ℝ, Theorem VI.9.1 and Variant VI.9.1.2); M.7's text: 'At 2 with real places, prove the corrected long exact sequences and extension data'. AUDIT-27 records M.7 as the owner of N.5's real two-primary calculation. (c) The bounds j(O_F[1/2]) ≤ ρ ≤ r_1 − 1 of Corollary VI.9.10 from the edge map of the mod-2 spectral sequence. M.7 owns the whole dyadic calculation (RT-AREA-ktheory-1/3): the real-place spectral sequences whose differentials are fixed by Suslin's theorem K_n(ℝ; ℤ/m) ≅ π_n(BO; ℤ/m) for n ≥ 1 (K-book VI.3.1, PDF p. 483; degree zero identified separately) and real topological K-theory, as used in VI.9.1–9.4; N.5 and N.6 import its output — the groups of Theorem VI.9.4, the real-place maps α^n_S(i) to ⊕_{real} H^n(ℝ; −) and to K_*(ℝ; ℚ_2/ℤ_2), and the extension data, with their naturality — and perform no second dyadic calculation.

Consumers: [ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two](#node-arithmeticktheory-n-5-odd-torsion-at-a-prime-where-cd-is-two); [ArithmeticKTheory:N.5/the-real-case-modulo-eight](#node-arithmeticktheory-n-5-the-real-case-modulo-eight); [ArithmeticKTheory:N.6/even-groups-at-odd-primes](#node-arithmeticktheory-n-6-even-groups-at-odd-primes); [ArithmeticKTheory:N.6/the-two-primary-corrections](#node-arithmeticktheory-n-6-the-two-primary-corrections); [ArithmeticKTheory:N.6/order-ratio-for-totally-real-fields](#node-arithmeticktheory-n-6-order-ratio-for-totally-real-fields); [ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel](#node-arithmeticktheory-n-6-divisible-subgroup-and-the-wild-kernel); [ArithmeticKTheory:N.5/e-invariant](#node-arithmeticktheory-n-5-e-invariant).

### MotivicEtaleKTheory:M.8

The étale Chern classes K_{2i−1}(O_S; ℤ_ℓ) → H^1(O_S[1/ℓ]; ℤ_ℓ(i)) and their agreement with M.7's comparison maps, compatible with the maps induced by O_S ⊂ O_{S'} and by finite extensions (M.8's text: 'Construct étale Chern classes ... Prove compatibility with the higher K-theory Chern character, residues, norms and products'). This is the naturality of the identifications that N.5's text requires ('the e-invariant/Chern maps, their kernels and the extension classes used to obtain them must be natural'); AUDIT-27 records M.8 as its owner. M.8 is not in N.5's atlas requirements; the edge M.8 → N.5 is acyclic in the atlas, but K3BlochGroups' packet imports N.5 into V.2, which with Polylogarithms P.2 → BorelRegulators R.7 → M.8 closes a cycle (see restructure).

Consumers: [ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two](#node-arithmeticktheory-n-5-odd-torsion-at-a-prime-where-cd-is-two).

### KTheoryLowDegrees:U.3

The determinant splitting K₁(A) = A^× ⊕ SK₁(A) for commutative A and SK₁ = 0 for fields, so that K₁(F) = F^× and K₁(k(𝔭)) = k(𝔭)^×. U.3: 'For commutative A construct the stable determinant and its section from Aˣ. Define SK₁(A) as its kernel and prove the split decomposition as abelian groups. Prove SK₁ vanishing for fields and commutative semilocal rings'. U.3 is upstream of N.1 (U.3 → U.4 → U.5 → N.1).

Consumers: [ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant](#node-arithmeticktheory-n-1-k1-of-s-integers-and-the-determinant); [ArithmeticKTheory:N.2/the-three-classical-rows](#node-arithmeticktheory-n-2-the-three-classical-rows).

### KTheoryLowDegrees:U.5

Transfer by restriction of scalars for the finite projective extension O_{F,S} ⊂ O_{F′,S′}, its agreement with the field norm on units, the projection formula against K₀, and the valuation convention for the degree-one boundary. U.5: 'For a finite projective algebra extension construct transfer by restriction of scalars. Prove that, on a field's unit group, this agrees with the field norm. Prove the projection formula against K₀, and the boundary map from a discrete valuation field's units to K₀ of its residue field equals the valuation with the chosen convention.' The atlas lists U.5 as a prerequisite of N.1.

Consumers: [ArithmeticKTheory:N.1/norms-transfers-and-pullbacks](#node-arithmeticktheory-n-1-norms-transfers-and-pullbacks); [ArithmeticKTheory:N.1/transfer-and-norm-on-units](#node-arithmeticktheory-n-1-transfer-and-norm-on-units); [ArithmeticKTheory:N.2/the-three-classical-rows](#node-arithmeticktheory-n-2-the-three-classical-rows).

### GeneralAlgebraicKTheory:K.7

Filtered-colimit compatibility of K-theory for rings (K_n(F) = colim_s K_n(R[1/s])), finite-product compatibility, and products compatible with localisation boundaries and transfers (the K_*(R)-module structure of (6.6) and the projection formula in all degrees). K.7: 'Prove Morita invariance, finite-product compatibility, filtered-colimit compatibility for rings ... Prove compatibility with relative groups, localisation boundaries and transfers.' The atlas lists K.7 as a prerequisite of N.1.

Consumers: [ArithmeticKTheory:N.2/finite-support](#node-arithmeticktheory-n-2-finite-support); [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain).

### KTheoryFiniteLocalFields:L.1

Quillen's finite-field calculation K₀(𝔽_q) = ℤ, K_{2j}(𝔽_q) = 0 and K_{2j−1}(𝔽_q) ≅ ℤ/(q^j − 1) for j ≥ 1 (K-book IV.1.13), with the determinant in degree one and the restriction and transfer maps for finite extensions. It gives the residue terms of the localisation sequences in N.2 and N.3 (at primes over ℓ they have no ℓ-torsion), the even-degree injectivity and Soulé's theorem, Corollary VI.1.5.2 in N.5, and the odd-prime computations of N.6. L.1: 'Prove, for every finite field with q elements and every j≥1, K₀(𝔽_q)=ℤ, K_{2j}(𝔽_q)=0, K_{2j−1}(𝔽_q)≅ℤ/(q^j−1) ... Construct the restriction and transfer maps for finite extensions and prove their formulas'. The atlas lists L.1 as a prerequisite of N.2; no cycle.

Consumers: [ArithmeticKTheory:N.2/even-degree-injectivity](#node-arithmeticktheory-n-2-even-degree-injectivity); [ArithmeticKTheory:N.5/soule-theorem](#node-arithmeticktheory-n-5-soule-theorem); [ArithmeticKTheory:N.5/soule-mod-l-surjectivity](#node-arithmeticktheory-n-5-soule-mod-l-surjectivity); [ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers](#node-arithmeticktheory-n-3-finite-generation-finite-generation-of-k-of-s-integers); [ArithmeticKTheory:N.3:ranks/borel-rank-theorem](#node-arithmeticktheory-n-3-ranks-borel-rank-theorem); [ArithmeticKTheory:N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion](#node-arithmeticktheory-n-3-ranks-even-k-groups-of-the-field-are-infinite-torsion); [ArithmeticKTheory:N.5/harris-segal-summand](#node-arithmeticktheory-n-5-harris-segal-summand); [ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two](#node-arithmeticktheory-n-5-odd-torsion-at-a-prime-where-cd-is-two); [ArithmeticKTheory:N.6/even-groups-at-odd-primes](#node-arithmeticktheory-n-6-even-groups-at-odd-primes); [ArithmeticKTheory:N.6/l-rank-from-class-group-data](#node-arithmeticktheory-n-6-l-rank-from-class-group-data).

### MotivicEtaleKTheory:M.1

The Tate twists ℚ/ℤ(j), j ∈ Z, of a field F as discrete G_F-modules: ℚ/ℤ(j) = ⊕_{ℓ ≠ char F} ℚ_ℓ/ℤ_ℓ(j), ℚ_ℓ/ℤ_ℓ(j) = colim_ν µ_{ℓ^ν}^{⊗j}, with g ∈ G_F acting through χ_ℓ(g)^j for Mathlib's cyclotomicCharacter; equivalently the K-book's µ(j) of Definition VI.1.7 (the group µ(F^s) with g acting by ζ ↦ g^j(ζ)); weight one is the colimit of Tau Ceti's KummerCoeff F ℓ^ν. M.1's text: 'Import finite/continuous Tate twists ... Q/Z(j) uses primewise compatible twists, not the ordinary tensor power of Q/Z.' Atlas: N.4 requires MotivicEtaleKTheory:M.1; no cycle. N.6 also needs, from the same stage, the finite and continuous twists μ_m^{⊗j}, ℤ_ℓ(j) and ℚ_ℓ/ℤ_ℓ(j) with the coefficient and Bockstein sequences for ℤ_ℓ(j) → ℤ_ℓ(j) → μ_ℓ^{⊗j}; the étale cohomology of O_S[1/ℓ] with these coefficients and the Kummer sequence are requested from MotivicEtaleKTheory M.2.

Consumers: [ArithmeticKTheory:N.4/the-w-invariant](#node-arithmeticktheory-n-4-the-w-invariant); [ArithmeticKTheory:N.4/exponent-criterion](#node-arithmeticktheory-n-4-exponent-criterion); [ArithmeticKTheory:N.6/even-groups-modulo-l](#node-arithmeticktheory-n-6-even-groups-modulo-l); [ArithmeticKTheory:N.6/l-rank-from-class-group-data](#node-arithmeticktheory-n-6-l-rank-from-class-group-data); [ArithmeticKTheory:N.6/signature-defect](#node-arithmeticktheory-n-6-signature-defect); [ArithmeticKTheory:N.6/order-ratio-for-totally-real-fields](#node-arithmeticktheory-n-6-order-ratio-for-totally-real-fields).

### StableHomotopyKTheory:H.2

Quillen's Theorems A and B and the long exact homotopy sequence of a homotopy fibre, and the homotopy theory of categories that the rank spectral sequence of N.3:finite-generation uses: (a) Theorem A for maps of posets, applied to the poset of layers J(V) and to the interval poset of the Tits building; (b) Thomason's theorem δN(D, F) ≃ N(D ∫ F) for a functor F : D → Cat and the resulting spectral sequence E²_{p,q} = H_p(D, H_q(T ↓ −)) ⇒ H_{p+q}(C) for a functor T : C → D (Kahn, arXiv:1108.2441v3, 1.4.3–1.4.6); (c) for a cellular functor T : C → D (fully faithful, no morphism from D − C to C) the homotopy cocartesian square and long exact sequence ⋯ → H_i(D − C, F̃_T) → H_i(C) → H_i(D) → H_{i−1}(D − C, F̃_T) → ⋯, and the spectral sequence of a sequence of cellular functors with Q = colim Q_n (Kahn 2.3.6, 2.3.7, 2.4.1). H.2's text: 'Prove Quillen's Theorem A from contractible comma categories. Prove Theorem B with its homotopy-fibre hypothesis on transition functors ... Develop the bisimplicial diagonal/iterated-realisation comparison and the levelwise-equivalence theorem'. Atlas edge H.2 → N.3:finite-generation exists; no cycle.

Consumers: [ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building](#node-arithmeticktheory-n-3-finite-generation-layer-poset-is-the-suspended-building); [ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence](#node-arithmeticktheory-n-3-finite-generation-rank-spectral-sequence).

### KTheoryFiniteLocalFields:L.2

The prime-to-p part of the K-theory of a p-adic local field E with residue field F_q: K_{2i−1}(E){ℓ} ≅ Z/w_i^{(ℓ)}(E) for ℓ ≠ p, detected by the e-invariant (K-book Example VI.2.3.1 and Exercise VI.1.3), used in the proof of the Harris–Segal theorem. L.2's text: 'Deduce the prime-to-residue-characteristic part of local-field K-theory.' L.2's upstream contains no ArithmeticKTheory stage; no cycle.

Consumers: [ArithmeticKTheory:N.5/harris-segal-summand](#node-arithmeticktheory-n-5-harris-segal-summand).

### KTheoryFiniteLocalFields:L.7

The maps K_{2i}(F) → K_{2i}(F_v) to the completions of a number field, their compatibility with the localisation boundary K_{2i}(F) → K_{2i−1}(k(v)) and with restriction along finite extensions (L.7's text: 'Prove compatibility of local restriction/transfer, arithmetic Chern classes, Hilbert symbols, and cyclotomic traces with completion of a number field at a finite place. This supplies N's local conditions'). N.6's atlas entry already requires L.7.

Consumers: [ArithmeticKTheory:N.6/tame-and-wild-kernels](#node-arithmeticktheory-n-6-tame-and-wild-kernels); [ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel](#node-arithmeticktheory-n-6-divisible-subgroup-and-the-wild-kernel).

### KTheoryFiniteLocalFields:L.3

Moore's theorem for a nonarchimedean local field E: K_2(E) is μ(E) plus a uniquely divisible group, the projection being the Hilbert symbol (L.3's text: 'the uniquely divisible kernel and the finite roots-of-unity quotient'), so that the kernel of K_2(F) → K_2(F_v) is the kernel of the Hilbert symbol at v.

Consumers: [ArithmeticKTheory:N.6/tame-and-wild-kernels](#node-arithmeticktheory-n-6-tame-and-wild-kernels).

### MotivicEtaleKTheory:M.2

Tate–Poitou duality and the real places for O_S[1/ℓ]: cd_ℓ = 2 unless ℓ = 2 and r_1 > 0; the maps α^n_S(i) to ⊕_{real} H^n(ℝ; −) and the modified groups H̃^n = ker α^n, with α^2(4k) onto (M.2's text: 'Keep ordinary, positive and modified cohomology separate'); and the Brauer group sequence (8.1.1) for S containing a finite place.

Consumers: [ArithmeticKTheory:N.6/even-groups-modulo-l](#node-arithmeticktheory-n-6-even-groups-modulo-l); [ArithmeticKTheory:N.6/l-rank-from-class-group-data](#node-arithmeticktheory-n-6-l-rank-from-class-group-data); [ArithmeticKTheory:N.6/signature-defect](#node-arithmeticktheory-n-6-signature-defect); [ArithmeticKTheory:N.6/the-two-primary-corrections](#node-arithmeticktheory-n-6-the-two-primary-corrections).

### MotivicEtaleKTheory:M.3

The Galois symbol K_2(F)/m → H²(F; μ_m^{⊗2}) with its symbol formula, and Tate's theorems: the local and global cases and the S-integer form K_2(O_{F,S})/ℓ^r ≅ H²_et(O_{F,S}; μ_{ℓ^r}^{⊗2}) when ℓ is invertible in O_{F,S} (M.3's text), used at ℓ = 2 for the row n = 2 of Theorem VI.9.11. M.3 is the single owner (RT-AREA-ktheory-1/8); N.6 cites it and not K2SymbolsBrauer T.7 for this theorem.

Consumers: [ArithmeticKTheory:N.6/the-two-primary-corrections](#node-arithmeticktheory-n-6-the-two-primary-corrections).

### StableHomotopyKTheory:H.6

The universal coefficient sequence 0 → π_n(E)/m → π_n(E/m) → π_{n−1}(E)[m] → 0 and its ℚ_ℓ/ℤ_ℓ and ℤ_ℓ limits (H.6's text), applied to K(R): if K_{n+1}(R) is finite then K_n(R){ℓ} ≅ K_{n+1}(R; ℚ_ℓ/ℤ_ℓ), and if K_n(R) is finite then K_n(R){ℓ} ≅ K_n(R; ℤ_ℓ) (the source's Ex. IV.2.6 and IV.2.9). Also Serre's theorem for the class of finitely generated abelian groups: for a simple space X (in particular a connected H-space) the integral homology groups H_i(X; ℤ), i ≥ 1, are all finitely generated if and only if the homotopy groups π_i(X), i ≥ 1, are; used to pass from the finitely generated homology of BQ(P(R)) to K_n(R) = π_{n+1} BQ(P(R)) in N.3:finite-generation/quillen-finiteness-criterion (with the rational Hurewicz theory of the same owner, RT-AREA-ktheory-1/33). H.6 → N.3:finite-generation is a new atlas edge; it is acyclic.

Consumers: [ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two](#node-arithmeticktheory-n-5-odd-torsion-at-a-prime-where-cd-is-two); [ArithmeticKTheory:N.5/the-real-case-modulo-eight](#node-arithmeticktheory-n-5-the-real-case-modulo-eight); [ArithmeticKTheory:N.6/even-groups-at-odd-primes](#node-arithmeticktheory-n-6-even-groups-at-odd-primes); [ArithmeticKTheory:N.6/the-two-primary-corrections](#node-arithmeticktheory-n-6-the-two-primary-corrections); [ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion](#node-arithmeticktheory-n-3-finite-generation-quillen-finiteness-criterion).

### StableHomotopyKTheory:H.1

Nerves of small categories and posets with their realisations, homotopies from comparable monotone maps, compatibility with finite products and with increasing unions of subcategories (homology commuting with the union), and the comparison of the homology of a one-object groupoid with local coefficients with group homology (H.1's text: 'Construct local coefficient systems and the comparison of bar homology with singular homology of BG'). Used by Quillen's rank filtration and its spectral sequence, and for the H-space structure on BQ(P(R)) given by direct sum. H.1 → N.3:finite-generation is a new atlas edge; it is acyclic.

Consumers: [ArithmeticKTheory:N.3:finite-generation/rank-filtration](#node-arithmeticktheory-n-3-finite-generation-rank-filtration); [ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building](#node-arithmeticktheory-n-3-finite-generation-layer-poset-is-the-suspended-building); [ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence](#node-arithmeticktheory-n-3-finite-generation-rank-spectral-sequence); [ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion](#node-arithmeticktheory-n-3-finite-generation-quillen-finiteness-criterion).

### SchemeKTheoryOperations:S.3

Regular-scheme localization with closed-point dévissage, finite/open support and naturality; N.2 supplies arithmetic residues, support, classical rows and extension compatibility.

Consumers: [ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain](#node-arithmeticktheory-n-2-localisation-sequence-for-a-dedekind-domain); [ArithmeticKTheory:N.3:finite-generation/proper-curve-finite-generation](#node-arithmeticktheory-n-3-finite-generation-proper-curve-finite-generation).

### MotivicEtaleKTheory:M.3

Kummer exact sequence for cyclotomic S-integers, functorial with Galois action and twist. Preserve unit classes, H¹ and Pic[p^m] as separate terms.

Consumers: [ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection](#node-arithmeticktheory-n-6-keune-cyclotomic-picard-injection).

### K2SymbolsBrauer:T.5

The tame kernel and its exact sequences (T.5/unramified-subgroup, T.5/tame-kernel-sequence, T.5/relative-s-integer-sequence), the real sign symbol (T.5/real-sign-symbol), and the computations K₂(ℤ) ≅ ℤ/2 with generator {−1, −1} (T.5/k2-of-the-integers) and K₂(ℚ) ≅ K₂(ℤ) ⊕ ⊕_p 𝔽_p^×, infinite (T.5/k2-of-the-rationals), which N.8 imports and does not recompute (RT-AREA-ktheory-1/9). The certificate format is no longer requested from T.5: it is ArithmeticKTheory N.6/order-certificate, and T.5 drops its competing certificate paragraph. N.8's two generation proofs also use T.5/relative-s-integer-sequence for ℚ(ζ₅), the restriction clause of T.5/unramified-subgroup (unramifiedSubgroup_map_le) for ℚ(ζ₅)/ℚ(√5), and, from the same packet, T.4/restriction-transfer-degree and T.3/tame-symbol with its convention ∂_v{u, t} = ū.

### K2SymbolsBrauer:T.7

The twisted coefficient modules and the norm residue symbol. N.4’s invariant uses the twisted modules; N.7 imports that invariant by node id. Tate's comparison K₂/m ≅ H² is no longer requested from T.7: MotivicEtaleKTheory M.3 owns it (RT-AREA-ktheory-1/8), and N.7's tame-kernel vanishing theorem imports it from there (request to M.3).

### K3BlochGroups:V.5

The third K-group of the integers, of the rationals and of the Gaussian rationals. AUDIT-27 names V.5 as owning the order forty-eight and the Gaussian computation that N.8 records.

### MotivicEtaleKTheory:M.3

The Galois symbol and Tate's comparison K₂/m ≅ H²(μ_m^{⊗2}) for local and global fields and for rings of S-integers with the primes above m inverted, M.3 being its single owner (RT-AREA-ktheory-1/8): the first of the three inputs of N.7's tame-kernel vanishing theorem. N.8 also needs two consequences that Tate proves in §6 of 'Relations between K₂ and Galois cohomology' (Invent. Math. 36, 1976): Theorem (6.1), that for a global field F containing a primitive l-th root of unity z every element of order l of K₂F is {z, a} (used with l = 2, z = −1 for ℚ(√5)); and Theorem (6.2), the exact sequence 0 → μ_l ⊗ Pic O_S → K₂O_S/l → (∐_{v∈S−S_c} μ_l)_0 → 0 for S containing the archimedean places and those above l, with μ_l ⊆ F (used with l = 2 for ℚ(ζ₅) and ℚ(√5)). The general-field form of (6.1), K-book III.6.8 through Hilbert's Theorem 90 for K₂, has no owner (KTheoryFiniteLocalFields records the proposal of a K2SymbolsBrauer part for it); N.8 needs only the number-field case.

Consumers: [ArithmeticKTheory:N.7/tame-kernel-vanishing-at-a-regular-prime](#node-arithmeticktheory-n-7-tame-kernel-vanishing-at-a-regular-prime); [ArithmeticKTheory:N.8/tame-kernel-of-q-zeta-five](#node-arithmeticktheory-n-8-tame-kernel-of-q-zeta-five); [ArithmeticKTheory:N.8/real-quadratic-upper-generation](#node-arithmeticktheory-n-8-real-quadratic-upper-generation).

### K2SymbolsBrauer:T.2

Matsumoto's presentation of the second K-group of a field by Steinberg symbols, the skew-symmetry and the relation between the symbol of an element with itself and with minus one, all used by the computations N.8 imports. Tate's method in N.8 (N.8/tate-norm-filtration, N.8/gaussian-tame-kernel-vanishes) uses the Steinberg identity (T.2/steinberg-identity), {a, a} = {a, −1} (T.2/symbol-consequences) and {r, −r} = 1 (T.2:symbols/symbol-negative-unit).

### KTheoryLowDegrees:U.6

K₁(ℤ) = {±1} by the determinant (SK₁(ℤ) = 0), and K₁(ℤ[1/p]) = ℤ[1/p]^× ≅ ℤ/2 ⊕ ℤ with the p-adic valuation as boundary, which N.8 imports for the first K-groups of the integers and the degree-one row of the ℤ[1/p] sequence (RT-AREA-ktheory-1/9). The checkpointed KTheoryLowDegrees U.1 packet plans them as U.6/K1-integers and U.6/K1-integers-away-from-p; N.8 will cite them by id once that packet is accepted. U.6 → N.8 is a new atlas edge; it is acyclic.

Consumers: [ArithmeticKTheory:N.8/k-groups-of-the-integers](#node-arithmeticktheory-n-8-k-groups-of-the-integers); [ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime](#node-arithmeticktheory-n-8-s-integer-sequence-for-one-inverted-prime).

### KTheoryLowDegrees:Z.6

K₀(ℤ) = ℤ (with π₀ of the K-theory space), which N.8 imports for the first K-groups of the integers (RT-AREA-ktheory-1/9). The checkpointed KTheoryLowDegrees Z.3 packet plans it as Z.6/integers-test. Z.6 → N.8 is a new atlas edge; it is acyclic.

Consumers: [ArithmeticKTheory:N.8/k-groups-of-the-integers](#node-arithmeticktheory-n-8-k-groups-of-the-integers).

### KTheoryFiniteLocalFields:L.1

Quillen's computation K₀(𝔽_q) = ℤ, K_{2i}(𝔽_q) = 0 and K_{2i−1}(𝔽_q) ≅ ℤ/(q^i − 1) for i ≥ 1 (K-book IV.1.13), which gives the residue terms of the localisation sequence of ℤ ⊂ ℤ[1/p] in N.8's example in every degree. The atlas already has L.1 upstream of ArithmeticKTheory (L.1 → N.2); no cycle.

Consumers: [ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime](#node-arithmeticktheory-n-8-s-integer-sequence-for-one-inverted-prime).

### IntegralIwasawaTheory:L3

Supply the single Vandiver(l) predicate for primes l, with its defining equivalence l not dividing the class number of Q(mu_l)^+, and transport along a rational cyclotomic-field isomorphism to NumberField.maximalRealSubfield (CyclotomicField l Q). Its Lean module/declaration is not yet published; N.7 records the import contract, not a second definition. The odd-character equivalence and conditional K-theory consequences remain in N.7.

Consumers: [ArithmeticKTheory:N.7/vandiver-separation](#node-arithmeticktheory-n-7-vandiver-separation).

## Source corrections

The following records preserve the distinction between the printed source and the corrected mathematical statement. Identical issue ids in the two parts refer to the same source location; both provenance records remain in the packets.

### ArithmeticKTheory/E1: misprint

**Locator.** Kbook.2013, III.2.5 (Bass–Milnor–Serre), PDF p. 202 (book p. 194).

**Printed.** Theorem 2.5 (Bass-Milnor-Serre). Let R be an integrally closed subring of a number field F, and I an ideal of R. Then (1) If F has any embedding into ℝ then SK1(R, I) = 0. … The exponent ord_p n of p in the integer n is the minimum over all prime ideals 𝔭 of R containing I of the integer

**Corrected statement.** I should be a nonzero ideal (and the formula in (2) read for I ≠ R); for I = R the theorem is SK₁(R) = 0, as III.1.3.6 states.

**Reason.** For I = 0 every prime, including (0), contains I, and the displayed formula would give n = w₁, whereas SK₁(R, 0) = 0 because GL(0) is trivial; for I = R the minimum is over the empty set. The intended statement, for nonzero I, is clear from the citation [19, 4.3]. The nodes of this packet cite III.1.3.6 for SK₁(O_{F,S}) = 0.

### ArithmeticKTheory/E2: misprint

**Locator.** Kbook.2013, V.6.6, Dedekind Domains, PDF p. 417 (book p. 409).

**Printed.** Then R and F and regular, as are the residue fields R/𝔭

**Corrected statement.** Then R and F are regular, as are the residue fields R/𝔭

**Reason.** The sentence lists what is regular; 'and' is a slip for 'are'.

### ArithmeticKTheory/E3: misprint

**Locator.** Kbook.2013, V.6.6.1, the paragraph after (6.6.1), PDF p. 417 (book p. 409).

**Printed.** In this case, we know that ∂ in K∗(R)-linear

**Corrected statement.** In this case, we know that ∂ is K∗(R)-linear

**Reason.** Grammar; the reviewed K2SymbolsBrauer packet reads it the same way in a match note but records no issue.

### ArithmeticKTheory/E4: gap

**Locator.** Kbook.2013, V.6.8, proof of Theorem 6.8, PDF p. 420 (book p. 412).

**Printed.** From the computation of Kn(Fq) in IV.1.13 and the fact that Kn(R) is finitely generated (IV.6.9), we see that SKn(R) is 0 for n > 0 even, and is finite for n odd.

**Corrected statement.** For R not of finite type over ℤ or 𝔽_q the finite generation of K_n(R) is not supplied by IV.6.9; reduce to that case by writing R as the filtered union of rings of S-integers with S finite (ℤ_(p) = colim ℤ[1/N], p ∤ N) and using that K_* and the kernel SK_n commute with filtered colimits.

**Reason.** Theorem 6.8 is stated for every Dedekind domain whose fraction field is global, but IV.6.9 (PDF p. 333) covers integrally closed subrings of a number field finite over ℤ and coordinate rings of smooth affine curves over a finite field. For R = ℤ_(p), K₁(R) = ℤ_(p)^× contains the independent primes ℓ ≠ p and is not finitely generated. The theorem is still true there by the colimit argument.

### ArithmeticKTheory/E5: error

**Locator.** Kbook.2013, V.6.8, the remark after Proposition 6.8.1, PDF p. 420 (book p. 412).

**Printed.** The conclusion of 6.8.1 is false for n = 1. Indeed, the kernel of K0(R) → K0(F) is the finite group Pic(R), so K1(F; Z/ℓ) → ⊕K0(R/𝔭; Z/ℓ) is not onto.

**Corrected statement.** The conclusion of 6.8.1 can fail for n = 1: the cokernel of ∂ : K₁(F; ℤ/ℓ) → ⊕K₀(R/𝔭; ℤ/ℓ) is Pic(R)/ℓ, so ∂ is onto exactly when Pic(R)/ℓ = 0.

**Reason.** The mod-ℓ sequence ends K₁(F; ℤ/ℓ) → ⊕ ℤ/ℓ → K₀(R)/ℓ = ℤ/ℓ ⊕ Pic(R)/ℓ → K₀(F)/ℓ = ℤ/ℓ → 0, so the image of ⊕ ℤ/ℓ is Pic(R)/ℓ. For R = ℤ, Pic = 0 and ℚ^×/ℓ → ⊕_p ℤ/ℓ is onto (p ↦ e_p); the remark's 'is false for n = 1' holds only when ℓ divides the class number, e.g. R = 𝓞 of ℚ(√−5), ℓ = 2.

### ArithmeticKTheory/E6: misprint

**Locator.** Kbook.2013, V.6.8.1, proof, second paragraph, PDF p. 421 (book p. 413).

**Printed.** then multiplication by β^{i−1} induces an isomorphism ⊕Z/ℓ ≅ ⊕K1(R/𝔭)/ℓ → ⊕K2i−1(R/𝔭) by IV.1.13. That is, every element of ⊕K2i−1(R/𝔭) has the form β^{i−1}a for a in ⊕K1(R/𝔭). … Lifting a to s ∈ K2(F), the element x = β^{i−1}s of K2i(F; Z/ℓ) satisfies ∂(x) = β^{i−1}∂(x) = β^{i−1}a, as desired.

**Corrected statement.** Multiplication by β^{i−1} is an isomorphism ⊕K₁(R/𝔭)/ℓ → ⊕K_{2i−1}(R/𝔭; ℤ/ℓ), every element of ⊕K_{2i−1}(R/𝔭; ℤ/ℓ) has the form β^{i−1}a, and ∂(x) = β^{i−1}∂(s) = β^{i−1}a.

**Reason.** β lies in K₂(R; ℤ/ℓ), so β^{i−1}a lies in K_{2i−1}(R/𝔭; ℤ/ℓ), which is the target in the diagram that follows; the integral group K_{2i−1}(𝔽_q) ≅ ℤ/(q^i − 1) is not ℤ/ℓ in general. '∂(x) = β^{i−1}∂(x)' is a slip for β^{i−1}∂(s), s being the lift. At primes 𝔭 over ℓ the identification ℤ/ℓ ≅ K₁(R/𝔭)/ℓ also fails (K₁(R/𝔭)/ℓ has order prime to the residue characteristic), though multiplication by β^{i−1} is still an isomorphism there.

### ArithmeticKTheory/E7: error

**Locator.** Kbook.2013, V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413), in the author-hosted combined draft of 29 August 2013.

**Printed.** In fact, divK2i(F) is isomorphic to the wild kernel, defined as the intersection (over all valuations v on F) of the kernels of all maps K2i(F) → K2i(Fv). This is proven in [225].

**Corrected statement.** div K_{2i}(F) is a subgroup of the wild kernel of index at most two; they are equal when i is even or F is not special, and div K_{2i}(F) has index two in the wild kernel when i is odd and F is special (Hutchinson's condition). For K_2, div K_2(F) ≠ WK_2(F) exactly when F is special.

**Reason.** The cited paper [225] (Weibel, J. Pure Appl. Algebra 206 (2006) 222–244; author's preprint of 23 July 2004) proves this in Theorem A and Theorem 5.5, and its Example 5.6 (after Hutchinson) gives F = ℚ(√d), d < 0, d ≡ 2 (mod 16), for instance ℚ(√−14), where {−1, −1} lies in K^w_2(F) but not in div K_2(F) and K^w_2(F) ≅ div K_2(F) ⊕ ℤ/2. Both groups are finite subgroups of K_2(O_F), so they are not isomorphic. For i = 1 the K-book's wild kernel is the classical one: K_2(F) is torsion and K_2(F_v) is μ(F_v) plus a uniquely divisible group (Moore), so the kernel of K_2(F) → K_2(F_v) is the kernel of the Hilbert symbol.

### ArithmeticKTheory/E8: misprint

**Locator.** Kbook.2013, VI.2.1.1, Example 2.1.1, PDF p. 478 (book p. 470), author-hosted draft of 29 August 2013.

**Printed.** It is a pleasant exercise to show that w_i(F_q) = q^i − 1 for all i.

**Corrected statement.** ... for all i ≥ 1 (and w_{−i} = w_i; W_0(F_q) is infinite).

**Reason.** For i = 0 the formula gives 0 while W_0(F_q) = µ(F̄_q) is infinite; for i < 0, q^i − 1 is not an integer, and W_{−i}(F_q) = W_i(F_q) has order q^{|i|} − 1.

### ArithmeticKTheory/E9: error

**Locator.** Kbook.2013, VI.2.1.2, Example 2.1.2, PDF p. 478 (book p. 470), author-hosted draft of 29 August 2013.

**Printed.** w_10 = 1320 = 2^3 · 3 · 5 · 11

**Corrected statement.** w_10(Q) = 264 = 2^3 · 3 · 11.

**Reason.** By Propositions 2.2–2.3, w_10^{(2)}(Q) = 2^{2+1} = 8, w_10^{(3)}(Q) = 3 and w_10^{(11)}(Q) = 11, while 5 does not divide w_10(Q) because 5 − 1 = 4 does not divide 10 — the example's own rule 'ℓ|w_i(Q) exactly when (ℓ−1) divides i'. Lemma 2.4 agrees: B_5/20 = (5/66)/20 = 1/264. Remark 2.4.2 agrees too: ζ_Q(−9) = −1/132 has denominator 264/2. 1320 = 66 · 20 is the unreduced denominator of B_5/20. A brute-force computation of the invariants of (ℤ/ℓ^ν)^× acting through the 10th power confirms 264; the other five printed values are right.

### ArithmeticKTheory/E10: misprint

**Locator.** Kbook.2013, VI.2.1.3, Remark 2.1.3, PDF p. 478 (book p. 470), author-hosted draft of 29 August 2013.

**Printed.** Since the map from π_{8k+3}(BO) = Z to π_{8k+3}(BU) = Z has image 2Z

**Corrected statement.** Since the map from π_{8k+4}(BO) = Z to π_{8k+4}(BU) = Z has image 2Z

**Reason.** By Bott periodicity π_j(BU) = Z for even j and 0 for odd j, and π_j(BO) = π_{j−1}(O) is Z for j ≡ 0, 4 (mod 8) and 0 for j ≡ 3 (mod 8); the remark's own real e-invariant for i ≡ 2 (mod 4) lands in π_{2i}(BO) with 2i = 8k + 4, where complexification is multiplication by 2.

### ArithmeticKTheory/E11: misprint

**Locator.** Kbook.2013, VI.2.2.1, proof of Lemma 2.2.1, PDF p. 479 (book p. 471), author-hosted draft of 29 August 2013.

**Printed.** ζ^{⊗i} is invariant under all of G precisely when the group Gal(F(ζ_{ℓ^ν})/F) has exponent i.

**Corrected statement.** ... precisely when the group Gal(F(ζ_{ℓ^ν})/F) has exponent dividing i.

**Reason.** Invariance under g means χ(g)^i ≡ 1 (mod ℓ^ν), i.e. the order of the image of g divides i; the lemma's statement says 'exponent dividing i'. For F = Q, ℓ = 3, ν = 1 and i = 4, (Z/3)^× has exponent 2, not 4, and µ_3(4) is invariant.

### ArithmeticKTheory/E12: misprint

**Locator.** Kbook.2013, VI.2, the paragraph after Example 2.2.2, PDF p. 479 (book p. 471), author-hosted draft of 29 August 2013.

**Printed.** Aut(µ_{2^ν}) = (Z/2^ν)^× contains two involutions if ν ≥ 3.

**Corrected statement.** (Z/2^ν)^× contains three involutions (−1 and 2^{ν−1} ± 1) if ν ≥ 3; the point is that it is not cyclic.

**Reason.** (Z/2^ν)^× ≅ Z/2 × Z/2^{ν−2} for ν ≥ 3 has three elements of order 2; for ν = 3 they are 3, 5 and 7, each squaring to 1 modulo 8.

### ArithmeticKTheory/E13: error

**Locator.** Kbook.2013, VI.2, the paragraph after Proposition 2.3, PDF p. 479 (book p. 471), author-hosted draft of 29 August 2013.

**Printed.** Both R and Q_2 are exceptional, and so are each of their subfields.

**Corrected statement.** Q_2 and its subfields are exceptional, and so is every number field embeddable in R; R itself is non-exceptional under the definition given (as is the infinite subfield Q(ζ_{2^∞})^+ of R).

**Reason.** The definition asks that Gal(F(ζ_{2^ν})/F) be non-cyclic for large ν. For F = R this group is Gal(C/R) ≅ ℤ/2, cyclic; for F = Q(ζ_{2^∞})^+ it is {±1}. For a number field F ⊂ R the group contains −1 (complex conjugation) and has order tending to infinity, and a subgroup of (ℤ/2^ν)^× containing −1 of order at least 4 is not cyclic, so the conclusion for real number fields stands. Nothing in the book uses the exceptionality of R: Proposition 2.3 gives an infinite 2-part for R in cases (c) and (d) alike.

### ArithmeticKTheory/E14: misprint

**Locator.** Kbook.2013, VI.8.1, Classical Data 8.1 (PDF p. 521; book p. 513); published GSM 145, p. 564.

**Printed.** The formulas for K0(OS) = Z ⊕ Pic(OS) and K1(OS) = O×S ≅ Zr2+|S|−1 ⊕ µ(F) are different;

**Corrected statement.** K_1(O_S) = O_S^× ≅ ℤ^{r_1+r_2+|S|−1} ⊕ μ(F).

**Reason.** Dirichlet's S-unit theorem; for F = ℚ and S = {p}, ℤ[1/p]^× = ±p^ℤ has rank 1 = r_1 + r_2 + |S| − 1, not r_2 + |S| − 1 = 0. Theorem 8.4's row n = 1 is right because there r_1 = 0.

### ArithmeticKTheory/E15: misprint

**Locator.** Kbook.2013, VI.8.1, Classical Data 8.1, PDF p. 521 (book p. 513), author-hosted draft of 29 August 2013.

**Printed.** By Chapter IV, 1.18 and 6.9, the groups K_n(F) are finite when n is even and nonzero

**Corrected statement.** ... the groups K_n(O_S) are finite when n is even and nonzero; the groups K_n(F) are infinite torsion groups for even n > 0.

**Reason.** K_2(Q) is infinite (the tame symbol maps it onto ⊕_p F_p^×), and in general V.6.8 gives 0 → K_n(O_S) → K_n(F) → ⊕_p K_{n−1}(O_S/p) → 0 for even n ≥ 2, whose right-hand term is infinite. The cited IV.1.18 and IV.6.9 give finiteness for O_S (rank zero and finitely generated), not for F. The odd half of the sentence is right for F by V.6.8.

### ArithmeticKTheory/E16: error

**Locator.** Kbook.2013, VI.8.1, the sequence (8.1.1) (PDF p. 521; book p. 513).

**Printed.** The Brauer group of OS is determined by the sequence 0 → Br(OS) → (Z/2)r1 ⊕ ∐v∈S finite (Q/Z) add −→ Q/Z → 0.

**Corrected statement.** The sum map is onto Q/Z only when S contains a finite place; for S = ∅ the sequence is 0 → Br(O_F) → (ℤ/2)^{r_1} → ℤ/2 (onto if r_1 > 0), i.e. Br(O_F) ≅ (ℤ/2)^{max(r_1 − 1, 0)}.

**Reason.** For F = ℚ and O_S = ℤ the displayed sequence would read 0 → Br(ℤ) → ℤ/2 → ℚ/ℤ → 0, which is not exact at ℚ/ℤ. All uses of (8.1.1) in the source (Examples 8.3.1 and 8.3.2, the dimension count after (9.6.2), Exercise 9.1) have S non-empty.

### ArithmeticKTheory/E17: misprint

**Locator.** Kbook.2013, VI.8.2, proof (PDF p. 521; book p. 513).

**Printed.** Set R = OS[1/ℓ]. For each prime ideal p over ℓ, Kn−1(R/p) has no ℓ-torsion by IV.1.13.

**Corrected statement.** K_{n−1}(O_S/𝔭) (the residue field of O_S at 𝔭; the argument also needs K_n(O_S/𝔭), which has no ℓ-torsion for the same reason).

**Reason.** 𝔭 lies over ℓ and ℓ is inverted in R, so R/𝔭 = 0; the localisation sequence for O_S ⊂ O_S[1/ℓ] has the residue fields O_S/𝔭 of characteristic ℓ, whose positive-degree K-groups have order prime to ℓ.

### ArithmeticKTheory/E18: error

**Locator.** Kbook.2013, VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515); also the remark after Theorem 8.7 on the same page, author-hosted draft of 29 August 2013.

**Printed.** If F is a number field, the zeta function ζ_F(s) has a pole of order r_2 at s = −1.

**Corrected statement.** ζ_F(s) has a zero of order r_2 at s = −1 (and, after Theorem 8.7, a zero of order r_2 at s = 1 − 2k when F is not totally real).

**Reason.** ζ_F is holomorphic except for a simple pole at s = 1. By the functional equation the order of vanishing at s = 1 − 2k, k ≥ 1, is r_2. For F = Q(√−1), ζ_F(s) = ζ(s)L(s, χ_{−4}) with ζ(−1) = −1/12 ≠ 0 and L(−1, χ_{−4}) = 0 (χ_{−4} is odd), a simple zero, r_2 = 1. SpecialValuesBirchTate B.1's text already refuses the word 'pole' for the Handbook's version of this passage.

### ArithmeticKTheory/E19: misprint

**Locator.** Kbook.2013, VI.8.8, proof (PDF p. 524; book p. 516).

**Printed.** By Theorem 9.12 in the next section, the power of 2 on the right side equals |H2et(OF[1/ℓ], Z2(2k))|/|H1et(OF[1/ℓ], Z2(2k))|.

**Corrected statement.** |H^2_et(O_F[1/2]; ℤ_2(2k))| / |H^1_et(O_F[1/2]; ℤ_2(2k))|.

**Reason.** The coefficients are ℤ_2, so the ring is O_F[1/2]; ℓ here was the odd prime of the preceding paragraph.

### ArithmeticKTheory/E20: misprint

**Locator.** Kbook.2013, VI.9.4, Theorem 9.4, row n = 8k (PDF p. 527; book p. 519).

**Printed.** Kn(OS; Z/2∞) ≅ Z/w4k(F) for n = 8k,

**Corrected statement.** ℤ/w^{(2)}_{4k}(F), the two-primary part (for k = 0 the group is K_0(O_S; ℚ_2/ℤ_2) ≅ ℚ_2/ℤ_2).

**Reason.** K_n(O_S; ℤ/2^∞) is a 2-primary torsion group, while w_{4k}(F) as defined in VI.2.1 has odd prime factors (w_4(ℚ) = 240); Theorem 9.11 states the convention 'write wi for w(2)i(F)' explicitly, Theorem 9.4 does not.

### ArithmeticKTheory/E21: misprint

**Locator.** Kbook.2013, VI.9.11, proof (PDF p. 532; book p. 524).

**Printed.** To determine the two-primary subgroup Kn(OS){2} of the finite group K2i+2(OS) when n = 2i + 2, … we note that H1(OS, Z/2∞(i)) is the direct sum of (Z/2∞)r and a finite group, which must be H2(OS, Z2(i))

**Corrected statement.** With n = 2i + 2 the group compared with K_{2i+3}(O_S; ℤ/2^∞) is H^1(O_S; ℤ/2^∞(i+2)), whose finite part is H^2(O_S; ℤ_2(i+2)).

**Reason.** By Theorem 9.4, K_{2m−1}(O_S; ℤ/2^∞) involves H^1(O_S; ℤ/2^∞(m)); here 2m − 1 = 2i + 3, so m = i + 2, which matches the twists 4k+1, 4k+2, 4k+3, 4k+4 of Theorem 9.11 for n = 8k, …, 8k+6.

### ArithmeticKTheory/E22: misprint

**Locator.** Kbook.2013, VI.9.11, proof (PDF pp. 532–533; book pp. 524–525).

**Printed.** Since α1S(i) : H1(R; Z2(i)) → (Z/2)r1 must vanish on the divisible group (Z/2∞)r,

**Corrected statement.** α^1_S(i) : H^1(R; ℤ/2^∞(i)) → (ℤ/2)^{r_1}; the divisible subgroup (ℤ/2^∞)^r lies in H^1 with ℚ_2/ℤ_2 coefficients, whose finite part is H^2(R; ℤ_2(i)).

**Reason.** H^1(R; ℤ_2(i)) is a finitely generated ℤ_2-module and has no divisible subgroup (ℤ/2^∞)^r; the preceding sentence of the proof is about H^1(O_S, ℤ/2^∞(i)).

### ArithmeticKTheory/E23: misprint

**Locator.** Kbook.2013, VI.9.12, proof (PDF p. 533; book p. 525).

**Printed.** By Theorems 8.2 and 9.11, the ℓ-primary subgroup of K2i−2(OS) has order h2,i(ℓ) for all ℓ, except when ℓ = 2 and 2i−2 ≡ 6 (mod 8) when it is h1,i(2)/2r1.

**Corrected statement.** … when it is h^{2,i}(2)/2^{r_1}.

**Reason.** For 2i − 2 ≡ 6 (mod 8) Theorem 9.11 gives the two-primary part H̃^2(R; ℤ_2(i)), the kernel of the surjection α^2(i) onto (ℤ/2)^{r_1}, of order h^{2,i}(2)/2^{r_1}; only with h^{2,i} does the product formula balance. For F = ℚ, i = 4: K_6(ℤ){2} = 0 (Corollary 9.8), whereas h^{1,4}(2)/2^{r_1} = w_4^{(2)}(ℚ)/2 = 16/2 = 8.

### ArithmeticKTheory/E24: gap

**Locator.** Kbook.2013, VI.9.12, proof (PDF p. 533; book p. 525).

**Printed.** Write hn,i(ℓ) for the order of Hnet(OS[1/ℓ]; Zℓ(i)). By Ex. 8.3, h1,i(ℓ) = w(ℓ)i(F).

**Corrected statement.** The identity h^{1,i}(2) = w_i^{(2)}(F), used for ℓ = 2, needs its own argument: for F totally real and i even, H^1(O_S[1/2]; ℤ_2(i)) is finite (rank r_2 = 0) and H^0(O_S[1/2]; ℤ_2(i)) = 0, so the Bockstein sequence gives H^1(ℤ_2(i)) ≅ H^0(ℚ_2/ℤ_2(i)) = ℤ/w_i^{(2)}(F).

**Reason.** Exercise VI.8.3, which the proof cites, is stated only for an odd prime ℓ ('Let ℓ be an odd prime'), yet the next sentence uses h^{1,i}(2).

## Baseline declaration register

These are the part packets’ checked baseline contracts, grouped by declaration. Their modules and uses are retained so that an implementation can distinguish an existing carrier from a stronger theorem that must still be built.

- `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod` — `Mathlib/GroupTheory/FiniteAbelian/Basic.lean`. Structure theorem: a finitely generated abelian group is ℤ^n × a finite direct sum of cyclic groups of prime-power order; the free-plus-torsion shape of the tables.
- `mathlib:Algebra.norm` — `Mathlib/RingTheory/Norm/Defs.lean`. The field norm of a finite extension.
- `mathlib:Bernoulli.dvd_den_bernoulli` — `Mathlib/NumberTheory/Bernoulli.lean`. For k > 0 and (p − 1) | 2k, p divides the denominator of B_{2k}.
- `mathlib:Bernoulli.not_sq_dvd_den_bernoulli` — `Mathlib/NumberTheory/Bernoulli.lean`. For k > 0 and (p − 1) | 2k, p² does not divide the denominator of B_{2k}.
- `mathlib:Bernoulli.vonStaudt_clausen` — `Mathlib/NumberTheory/Bernoulli.lean`. B_{2k} + ∑_{p prime, (p−1) | 2k} 1/p is an integer (von Staudt–Clausen).
- `mathlib:ClassGroup` — `Mathlib/RingTheory/ClassGroup/Basic.lean`. The ideal class group of a domain: invertible fractional ideals modulo principal ones; the torsion of the degree-zero computation. The class group of a Dedekind domain, whose eigenspace decomposition is what Herbrand-Ribet describes.
- `mathlib:ClassGroup.equivPic` — `Mathlib/RingTheory/PicardGroup.lean`. The class group of a domain is its Picard group.
- `mathlib:ClassGroup.extendedHom` — `Mathlib/RingTheory/ClassGroup/ExtendedHom.lean`. Extension of ideal classes along an injective extension of domains.
- `mathlib:ClassGroup.mk0_eq_one_iff` — `Mathlib/RingTheory/ClassGroup/Basic.lean`. The class of a nonzero ideal is trivial iff the ideal is principal.
- `mathlib:CommMonoid.primaryComponent` — `Mathlib/GroupTheory/Torsion.lean`. The p-primary component (additive form by to_additive), for W_i^{(ℓ)}(F).
- `mathlib:CyclotomicField` — `Mathlib/NumberTheory/Cyclotomic/Basic.lean`. The n-th cyclotomic field over K, with a NumberField instance over ℚ.
- `mathlib:DivisibleBy` — `Mathlib/GroupTheory/Divisible.lean`. The class of divisible groups (a division function with n • div a n = a for n ≠ 0); there is no subgroup of divisible elements, which N.6/divisible-subgroup adds.
- `mathlib:Function.Surjective.bijective_of_nat_card_le` — `Mathlib/SetTheory/Cardinal/Finite.lean`. A surjection f : α → β with α finite and Nat.card α ≤ Nat.card β is bijective (line 132).
- `mathlib:GaussianInt.normSq_div_sub_div_lt_one` — `Mathlib/NumberTheory/Zsqrtd/GaussianInt.lean`. normSq(x/y − (x/y : ℤ[i])) < 1, the rounding error of Gaussian division. Its proof passes through normSq ≤ normSq(1/2 + i/2) = 1/2; the stated conclusion is only < 1, so the factor one half that Tate's method needs (2·N(x % y) ≤ N(y)) is a lemma of N.8/gaussian-tame-kernel-vanishes, not a pinned statement.
- `mathlib:GaussianInt.norm_mod_lt` — `Mathlib/NumberTheory/Zsqrtd/GaussianInt.lean`. (x % y).norm < y.norm for y ≠ 0: the Euclidean property of ℤ[i], weaker than the factor one half used in Tate's method.
- `mathlib:Ideal.Quotient.field` — `Mathlib/RingTheory/Ideal/Quotient/Basic.lean`. The quotient of a commutative ring by a maximal ideal has a Field structure; noncomputable abbrev, not an automatic instance.
- `mathlib:Ideal.absNorm` — `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean`. The absolute norm of an ideal of a Dedekind domain, the cardinality of the quotient: the norm N v = #k(v) by which Tate's method orders the places.
- `mathlib:Ideal.absNorm_apply` — `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean`. For an infinite finite-free integral ring, absolute ideal norm is the cardinality of its quotient, via Submodule.cardQuot.
- `mathlib:Ideal.inertiaDeg` — `Mathlib/RingTheory/RamificationInertia/Inertia.lean`. The inertia degree, as a definition; its value 1 at the prime above p in Q(ζ_p) is IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'.
- `mathlib:Ideal.ramificationIdx` — `Mathlib/RingTheory/RamificationInertia/Ramification.lean`. The ramification index, as a definition; its value p − 1 at the prime above p in Q(ζ_p) is IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'.
- `mathlib:IsCyclotomicExtension` — `Mathlib/NumberTheory/Cyclotomic/Basic.lean`. The predicate that B is generated over A by primitive n-th roots of unity for n in S; the cyclotomic extensions in which N.4 computes the invariant. Cyclotomic extensions, in which the class number defining regularity is taken.
- `mathlib:IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one` — `Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean`. For p prime and Q(mu_(p^(k+1))), the ideal (zeta−1) has absolute norm p. At k=0, after rewriting p^1=p, this computes the residue cardinality in Q(mu_p).
- `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver'` — `Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean`. Every prime of the ring of integers of the p-th cyclotomic field lying over p equals (ζ − 1): the prime above p is unique.
- `mathlib:IsCyclotomicExtension.Rat.finrank` — `Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean`. [ℚ(ζ_k) : ℚ] = φ(k); gives r = ℓ − 1 over ℚ and the degree bound in the finiteness theorem.
- `mathlib:IsCyclotomicExtension.Rat.five_pid` — `Mathlib/NumberTheory/NumberField/Cyclotomic/PID.lean`. For a number field K with IsCyclotomicExtension {5} ℚ K, the ring of integers 𝓞 K is a principal ideal ring (Minkowski's bound with discriminant 125): the class-number-one input of the tame kernel of ℚ(ζ₅).
- `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'` — `Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean`. In the p-th cyclotomic field the prime (ζ − 1) has inertia degree 1 over p.
- `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'` — `Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean`. In the p-th cyclotomic field the prime (ζ − 1) has ramification index p − 1 over p.
- `mathlib:IsCyclotomicExtension.autEquivPow` — `Mathlib/NumberTheory/Cyclotomic/Gal.lean`. Gal(L/K) ≃* (ZMod n)ˣ when the cyclotomic polynomial is irreducible over K (for K = ℚ always).
- `mathlib:IsCyclotomicExtension.finrank` — `Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean`. finrank K L = n.totient when cyclotomic n K is irreducible; for n = 5 over ℚ the degree is 4, so ℚ(ζ₅) has degree 2 over its subfield ℚ(√5).
- `mathlib:IsDedekindDomain.HeightOneSpectrum` — `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean`. The nonzero prime ideals of a Dedekind domain, which index the localisation sequence.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite` — `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean`. An element of K has v(x) > 1 at only finitely many height-one primes.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.mem_integers_of_valuation_le_one` — `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`. An element of K with v(x) ≤ 1 at every height-one prime lies in R.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_lt_one_iff_mem` — `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`. v(r) < 1 iff r ∈ v, for r ∈ R.
- `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot` — `Mathlib/RingTheory/Flat/TorsionFree.lean`. A module over a Dedekind domain is flat iff it is torsion-free.
- `mathlib:IsDedekindDomain.integer_empty` — `Mathlib/RingTheory/DedekindDomain/SInteger.lean`. The ∅-integers are R (as the bottom R-subalgebra of K).
- `mathlib:IsDedekindDomain.selmerGroup` — `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean`. K⟮S, n⟯: classes in Kˣ/(Kˣ)^n with valuation ≡ 0 mod n at every v ∉ S; for n = 2 and 1/2 ∈ O_S this is H^1_et(O_S; μ_2), the domain of α^1 in the signature defect.
- `mathlib:IsIntegralClosure` — `Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Defs.lean`. The predicate that a ring is the integral closure of R in an algebra.
- `mathlib:IsIntegralClosure.finite` — `Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean`. The integral closure of an integrally closed noetherian domain in a finite separable extension of its fraction field is finite over it.
- `mathlib:IsIntegralClosure.isLocalization` — `Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean`. L is the localisation of the integral closure at the non-zero elements of the base.
- `mathlib:IsLocalization` — `Mathlib/RingTheory/Localization/Defs.lean`. The localisation predicate (an abbrev for IsLocalization'), in which N.1 states that the S-integers of a number field are a localisation of the ring of integers.
- `mathlib:IsLocalization.isLocalization_of_submonoid_le` — `Mathlib/RingTheory/Localization/LocalizationLocalization.lean`. If M ≤ N, IsLocalization M S and IsLocalization N T with a scalar tower, then T is the localisation of S at the image of N.
- `mathlib:IsPrimitiveRoot` — `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean`. Primitive roots of unity, needed for the cyclotomic field and for the trivialisation of a twist.
- `mathlib:IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter` — `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`. autToPow agrees with the modular cyclotomic character.
- `mathlib:IsPrimitiveRoot.autToPow_injective` — `Mathlib/NumberTheory/Cyclotomic/Gal.lean`. Gal(L/K) → (ZMod n)ˣ is injective for a cyclotomic extension L/K.
- `mathlib:Module.Flat.projective_of_finitePresentation` — `Mathlib/RingTheory/Flat/EquationalCriterion.lean`. A flat finitely presented module is projective.
- `mathlib:Module.Presentation` — `Mathlib/Algebra/Module/Presentation/Basic.lean`. A presentation of a module (relations with a solution that is a presentation).
- `mathlib:Module.Presentation.ofIsPresentation` — `Mathlib/Algebra/Module/Presentation/Basic.lean`. The Module.Presentation built from a solution with IsPresentation (line 501).
- `mathlib:Module.Relations` — `Mathlib/Algebra/Module/Presentation/Basic.lean`. Generators and relations for a module, with Quotient, Solution and IsPresentation; the base of K2SymbolsBrauer T.5's order certificates.
- `mathlib:Module.Relations.Quotient` — `Mathlib/Algebra/Module/Presentation/Basic.lean`. The module presented by generators and relations, (G →₀ A) ⧸ span(range relation) (line 70).
- `mathlib:Module.Relations.Solution` — `Mathlib/Algebra/Module/Presentation/Basic.lean`. Solutions in a module M of the equations of relations : Relations A (line 127).
- `mathlib:Module.Relations.Solution.IsPresentation` — `Mathlib/Algebra/Module/Presentation/Basic.lean`. The solution is a presentation: fromQuotient is bijective (line 283).
- `mathlib:Module.Relations.Solution.fromQuotient` — `Mathlib/Algebra/Module/Presentation/Basic.lean`. The linear map relations.Quotient →ₗ M induced by a solution (line 172).
- `mathlib:Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π` — `Mathlib/Algebra/Module/Presentation/Basic.lean`. fromQuotient is onto iff the map π from the free module is onto (line 268).
- `mathlib:Module.Relations.Solution.surjective_π_iff_span_eq_top` — `Mathlib/Algebra/Module/Presentation/Basic.lean`. π is onto iff the values of the generators span (line 274).
- `mathlib:Module.finrank_mul_finrank` — `Mathlib/LinearAlgebra/Dimension/Free.lean`. The tower law for finrank.
- `mathlib:Monoid.exponent` — `Mathlib/GroupTheory/Exponent.lean`. The exponent of a group, for the criterion of Lemma VI.2.2.1.
- `mathlib:Nat.Prime` — `Mathlib/Data/Nat/Prime/Defs.lean`. Primality, the carrier of the regular-prime predicate.
- `mathlib:Nat.card_units` — `Mathlib/Algebra/GroupWithZero/Units/Fintype.lean`. For a group with zero, Nat.card of its units is Nat.card of the carrier minus one; applies to the genuine quotient field.
- `mathlib:Nat.exists_infinite_primes` — `Mathlib/Data/Nat/Prime/Infinite.lean`. There are infinitely many primes.
- `mathlib:NumberField` — `Mathlib/NumberTheory/NumberField/Basic.lean`. Number fields, the setting of both layers.
- `mathlib:NumberField.InfinitePlace.nrComplexPlaces` — `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`. r_2, the number of complex infinite places, the rank of the odd K-groups of a totally imaginary field. The number of complex places, which is the rank in the structure theorem for the third K-group.
- `mathlib:NumberField.InfinitePlace.nrRealPlaces` — `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`. r_1, the number of real infinite places. The number of real places, which enters the structure theorem for the third K-group and the sign in the Birch-Tate formula.
- `mathlib:NumberField.IsTotallyComplex` — `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`. The class asserting that every infinite place is complex: the totally imaginary hypothesis of N.5 and N.6.
- `mathlib:NumberField.RingOfIntegers` — `Mathlib/NumberTheory/NumberField/Basic.lean`. The ring of integers 𝓞 K (integral closure of ℤ), the base of every carrier in this packet. The ring of integers of a number field.
- `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup` — `Mathlib/NumberTheory/NumberField/ClassNumber.lean`. Finiteness of the class group of 𝓞_K: hypothesis (1) of Quillen's criterion.
- `mathlib:NumberField.Units.rank` — `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`. Only the number card (InfinitePlace K) − 1 = r_1 + r_2 − 1 (a definition). Dirichlet's theorem that it is the rank of the units is NumberField.Units.finrank_modTorsion, which the nodes citing the unit rank should add. The unit rank, part of the arithmetic data of a certified example.
- `mathlib:NumberField.Units.torsion` — `Mathlib/NumberTheory/NumberField/Units/Basic.lean`. The torsion subgroup of (𝓞 K)ˣ, that is the roots of unity μ(F), cyclic; N.4 insists it is not W_i(F).
- `mathlib:NumberField.classNumber` — `Mathlib/NumberTheory/NumberField/ClassNumber.lean`. The class number of a number field, whose divisibility by p is the definition of an irregular prime.
- `mathlib:NumberField.dedekindZeta` — `Mathlib/NumberTheory/NumberField/DedekindZeta.lean`. The Dedekind zeta function, whose value at minus one is one side of the Birch-Tate formula.
- `mathlib:NumberField.maximalRealSubfield` — `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`. The intrinsic maximal real subfield; supplies the carrier in L3's imported Vandiver condition, not the conjecture.
- `mathlib:NumberField.nrRealPlaces_eq_zero_iff` — `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`. nrRealPlaces K = 0 ↔ IsTotallyComplex K, connecting the hypothesis r_1 = 0 with the class.
- `mathlib:NumberField.of_subfield` — `Mathlib/NumberTheory/NumberField/Basic.lean`. A subfield of a number field is a number field, allowing its class number in the Vandiver import contract.
- `mathlib:Polynomial.bernoulli` — `Mathlib/NumberTheory/BernoulliPolynomials.lean`. The Bernoulli polynomials, which carry the generating-series proofs the denominator statements rest on.
- `mathlib:RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt` — `Mathlib/NumberTheory/NumberField/ClassNumber.lean`. If |discr K| < (2·(π/4)^{r₂}·n^n/n!)² with n = [K : ℚ], then 𝓞 K is a principal ideal ring. For ℚ(√5) (n = 2, r₂ = 0) the bound is 16 and |discr| = 5. The declaration sits in the root namespace RingOfIntegers, not under NumberField.
- `mathlib:Set.integer` — `Mathlib/RingTheory/DedekindDomain/SInteger.lean`. The subalgebra of S-integers of the fraction field of a Dedekind domain: v(x) ≤ 1 for every v ∉ S.
- `mathlib:Set.unit` — `Mathlib/RingTheory/DedekindDomain/SInteger.lean`. The subgroup of S-units: v(x) = 1 for every v ∉ S. The subgroup of S-units of Kˣ, for a Dedekind domain R with fraction field K and S a set of height-one primes: the groups U_m of Tate's filtration, with S = S_m.
- `mathlib:Set.unitEquivUnitsInteger` — `Mathlib/RingTheory/DedekindDomain/SInteger.lean`. S.unit K ≃* (S.integer K)ˣ, the S-units as the units of the ring of S-integers.
- `mathlib:Submodule` — `Mathlib/Algebra/Module/Submodule/Defs.lean`. Submodules (for a field, subspaces), the carrier of the layer poset J(V) and of the flags of the Tits building (line 41).
- `mathlib:Submodule.cardQuot_apply` — `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean`. The natural-number cardinality of the quotient is cardQuot; this identifies the actual ideal quotient cardinality, not a replacement carrier.
- `mathlib:ZMod` — `Mathlib/Data/ZMod/Defs.lean`. The cyclic rings, the coefficients of the eigenspace decomposition and the residue fields of the tame symbols.
- `mathlib:ZMod.isCyclic_units_of_prime_pow` — `Mathlib/RingTheory/ZMod/UnitsCyclic.lean`. (ZMod (p^n))ˣ is cyclic for an odd prime p.
- `mathlib:ZMod.isCyclic_units_two_pow_iff` — `Mathlib/RingTheory/ZMod/UnitsCyclic.lean`. (ZMod (2^n))ˣ is cyclic iff n ≤ 2; the reason exceptional fields exist.
- `mathlib:bernoulli` — `Mathlib/NumberTheory/Bernoulli.lean`. The Bernoulli numbers in the arithmetic convention, with B_1 = -1/2; this roadmap's default, and the one every statement here names.
- `mathlib:bernoulli'` — `Mathlib/NumberTheory/Bernoulli.lean`. The B_1 = +1/2 convention, equal to bernoulli away from index one. It is NOT the convention of the source, which uses the topologists' B_k = |B_{2k}|; it is imported only so that the conversion can be stated.
- `mathlib:bernoulli'_one` — `Mathlib/NumberTheory/Bernoulli.lean`. The value of the first Bernoulli number in the other convention.
- `mathlib:bernoulli_eq_bernoulli'_of_ne_one` — `Mathlib/NumberTheory/Bernoulli.lean`. The conversion: the two conventions agree at every index other than one.
- `mathlib:bernoulli_eq_zero_of_odd` — `Mathlib/NumberTheory/Bernoulli.lean`. bernoulli n = 0 for odd n > 1.
- `mathlib:bernoulli_one` — `Mathlib/NumberTheory/Bernoulli.lean`. The value of the first Bernoulli number in the arithmetic convention.
- `mathlib:bernoulli_two` — `Mathlib/NumberTheory/Bernoulli.lean`. bernoulli 2 = 1/6.
- `mathlib:cyclotomicCharacter` — `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`. The ℓ-adic cyclotomic character (L ≃+* L) →* ℤ_[ℓ]ˣ, through which G_F acts on ℚ_ℓ/ℤ_ℓ(i) by χ_ℓ^i.
- `mathlib:groupHomology` — `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`. groupHomology A n : ModuleCat k, the homology of the inhomogeneous chains of a k-linear G-representation A (line 230); with k = ℤ and A the Steinberg module of Aut(P) it is the E¹ term of the rank spectral sequence.
- `mathlib:isCyclic_subgroup_units` — `Mathlib/RingTheory/IntegralDomain.lean`. A finite subgroup of the units of an integral domain is cyclic; gives cyclicity of W_i(F).
- `mathlib:isOfFinOrder_of_finite` — `Mathlib/GroupTheory/OrderOfElement.lean`. Every element of a finite group has finite order.
- `mathlib:modularCyclotomicCharacter` — `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`. The mod-n cyclotomic character (L ≃+* L) →* (ZMod n)ˣ, with g t = t ^ χ(g) on n-th roots of unity (spec, line 222).
- `mathlib:padicValRat` — `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean`. The p-adic valuation on ℚ.
- `mathlib:rootsOfUnity` — `Mathlib/RingTheory/RootsOfUnity/Basic.lean`. The subgroup of k-th roots of unity of a commutative monoid, the untwisted coefficients of N.4. The roots of unity of a ring, the carrier of the invariant w_i and of the twisted modules it is defined with.
- `tauceti:ClassGroup.relNorm` — `TauCeti/RingTheory/ClassGroup/RelNorm.lean`. The relative norm on class groups of a finite extension of Dedekind domains.
- `tauceti:ClassGroup.relNorm_extendedHom` — `TauCeti/RingTheory/ClassGroup/RelNorm.lean`. relNorm (extendedHom c) = c ^ finrank: the composite on class groups.
- `tauceti:IsDedekindDomain.HeightOneSpectrum.finite_setOfPred_valuation_ne_one` — `TauCeti/RingTheory/DedekindDomain/SelmerGroup.lean`. A nonzero element of K has v(x) ≠ 1 at only finitely many primes: finite support of the divisor.
- `tauceti:IsDedekindDomain.finite_integer_classGroup` — `TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`. Instance: Finite (ClassGroup R) → Finite (ClassGroup (S.integer K)).
- `tauceti:IsDedekindDomain.integerClassGroupEquiv` — `TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`. ClassGroup (S.integer K) ≃* ClassGroup R ⧸ ⟨classes of the primes of S⟩.
- `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv` — `TauCeti/RingTheory/DedekindDomain/SInteger/Spectrum.lean`. The height-one primes of the S-integers are the primes of R not in S, via v ↦ v·O_S.
- `tauceti:IsDedekindDomain.integer_extendedHom_surjective` — `TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`. Extension of ideal classes Cl(R) → Cl(O_S) is surjective.
- `tauceti:IsDedekindDomain.integer_map_asIdeal_eq_top` — `TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean`. For v ∈ S, v extends to the unit ideal of the S-integers.
- `tauceti:IsDedekindDomain.ker_integer_extendedHom` — `TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`. The kernel of extension Cl(R) → Cl(O_S) is generated by the classes of the primes of S: exactness at Cl(R) of the degree-zero row in classical form.
- `tauceti:NumberField.NarrowClassGroup.twoRank` — `TauCeti/NumberTheory/NumberField/NarrowClassGroup/ElementaryTwoQuotient.lean`. dim_{ZMod 2} Cl⁺(K)/Cl⁺(K)², the u of Definition VI.9.6.1 for R = 𝓞 K.
- `tauceti:NumberField.fieldUnitSignature_surjective` — `TauCeti/NumberTheory/NumberField/Units/Signature/Surjective.lean`. The signature map Kˣ → ∏_{real} ℝˣ/ℝ_{>0} is surjective (approximation at the real places); gives j(O_S) = 0 for S large.
- `tauceti:Set.mem_integer_iff` — `TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean`. Membership in Set.integer is the valuation condition.
- `tauceti:Set.unitValuation_ker` — `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean`. The kernel of the valuation map S.unit K → (S → Multiplicative ℤ) is the ∅-units, i.e. exactness of 1 → Rˣ → O_Sˣ → ∏_{v∈S} ℤ at O_Sˣ only; exactness at ℤ^S (image equal to the kernel of ℤ^S → Cl(R)) is not pinned, and S need not be finite.
- `tauceti:Set.unit_fg_of_units` — `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean`. Instance: [Finite S] [Monoid.FG Rˣ] → Group.FG (S.unit K), finite generation of the S-units (the file notes it is not Dirichlet's S-unit theorem: no rank); to be cited where the nodes need finite generation for a general S.
- `tauceti:Set.unit_mono` — `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean`. S ⊆ S' → S.unit K ≤ S'.unit K, monotonicity of the S-unit group.
- `tauceti:TauCeti.AbsoluteGaloisGroup` — `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup.lean`. G_K = Gal(Kˢ/K), the group at which Tau Ceti states Galois cohomology.
- `tauceti:TauCeti.ClassGroup.twoRank` — `TauCeti/NumberTheory/ClassGroup/ElementaryTwoQuotient.lean`. dim_{ZMod 2} Cl(R)/Cl(R)², the t of Definition VI.9.6.1.
- `tauceti:TauCeti.ContCohomology.H0` — `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`. H⁰(G, M) = FixedPoints.addSubgroup G M, the carrier of W_i(F).
- `tauceti:TauCeti.ContCohomology.explicitCor0` — `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean`. Corestriction H⁰(U, M) → H⁰(G, M) for a finite-index subgroup, the norm over G/U.
- `tauceti:TauCeti.ContCohomology.explicitCor0_comp_res0` — `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean`. cor⁰ ∘ res⁰ = (G : U) • id.
- `tauceti:TauCeti.ContCohomology.explicitRes0` — `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`. Restriction H⁰(G, M) → H⁰(U, M), the inclusion of fixed points.
- `tauceti:TauCeti.GlobalNumberFields.signHom` — `TauCeti/NumberTheory/NumberField/Units/Signature/Integer.lean`. The total sign homomorphism Kˣ → ({real places} → ℤˣ), the map α^1 on classes of elements.
- `tauceti:TauCeti.KummerCoeff` — `TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean`. For each n, the n-th roots of unity μ_n of the separable closure, written additively, as a discrete G_K-module; the untwisted finite coefficients (not all roots of unity at once).
