# Q-series, partitions, Jacobi and mock modular forms

Blueprint for the roadmap `QSeriesPartitionsAndMockModularForms`, job `BP-QSeriesPartitionsAndMockModularForms` (issue #1042).
Packet: `research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json`. Suggested Lean file:
`research/blueprint/suggested/QSeriesPartitionsAndMockModularForms.lean`. Handoff: `research/blueprint/handoff/BP-QSeriesPartitionsAndMockModularForms.md`.

The roadmap runs from formal q-series to moonshine. QM.0 builds the formal layer (q-Pochhammer symbols, Gaussian
polynomials, the Jacobi triple product, Ramanujan's congruences, Rogers–Ramanujan) on Mathlib's partitions and x-adic
products. QM.1 adds the modular side: the eta and theta multipliers, Zwegers' ϑ(z; τ) and Eichler–Zagier Jacobi forms. QM.2 proves
Rademacher's exact formula and the Hardy–Ramanujan asymptotic. QM.3 and QM.4 develop harmonic Maass forms and Zwegers'
completions of mock theta functions. QM.5 connects them to quantum modular forms, radial limits of WRT invariants, cranks
and traces of singular moduli, and QM.6 states and plans the proof chain of monstrous moonshine.

**Status: partial.** QM.0 and QM.3 are source decomposed; QM.1, QM.2, QM.4, QM.5 and QM.6 are partial, each with a
precise `remaining` list in the packet's coverage record. The packet has 457 nodes, 709 API items and
463 unit tests, cites 352 declarations of the pinned libraries, records
60 mistakes in its sources, 13 gaps and 24 requests to other roadmaps.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

| Layer | Status | Nodes | Planets |
|---|---|---|---|
| QM.0 | source decomposed | 43 | q-Pochhammer symbols; Gaussian binomial coefficients; q-binomial theorem; Jacobi triple product identity; Ramanujan's partition congruences; Rogers–Ramanujan identities |
| QM.1 | partial | 67 | Dedekind eta transformation formula; Ligozat's cusp-order formula; Theta transformation law on the theta group; Jacobi theta function ϑ(z; τ); Jacobi forms of weight k and index m; Theta decomposition |
| QM.2 | partial | 44 | Ford circles; Modified Bessel function I_ν; Rademacher's Kloosterman sum A_k(n); Rademacher's exact formula; Effective remainder bound; Hardy–Ramanujan asymptotic formula |
| QM.3 | source decomposed | 66 | Weight-k hyperbolic Laplacian; ξ-operator (shadow map); Harmonic weak Maass form; Bruinier–Funke pairing {g, f}; Bruinier–Funke exact sequences; Maass–Poincaré series |
| QM.4 | partial | 102 | Appell–Lerch sum μ(u, v; τ); Zwegers' completion μ̃; Transformation law of μ̃ (Zwegers Thm 1.11); Zwegers' indefinite theta function; Modularity of indefinite theta functions; Zwegers' completion of F₇ (weight 1/2) |
| QM.5 | partial | 72 | Quantum modular form; Eichler integral; Kontsevich–Zagier strange identity; WRT invariants as radial limits; Andrews–Garvan crank; Traces of singular moduli |
| QM.6 | partial | 63 | Vertex operator algebra; McKay–Thompson series; No-ghost theorem; Monster Lie algebra; Twisted denominator identity; Monstrous moonshine theorem |

## What this roadmap owns, and what it imports

- **From the pinned libraries** (baseline citations, listed in each layer's section): partitions and their generating
  products, the x-adic topology on power series with multipliability of infinite products and Euler's pentagonal number
  theorem, Jacobi's theta functions with their S and T² laws, the Dedekind eta function with its S-transformation,
  modular forms, slash actions and Eisenstein series, and Mathlib's vertex operators.
- **From other roadmaps:**
  - ClassicalArithmeticCompletion CA.2, for Farey sequences and Ford circles;
  - MetaplecticAutomorphicForms MP.7, for half-integral-weight automorphy factors, Shimura's theta multiplier and Mp₂(ℤ)
    with the Weil representation;
  - ArithmeticQuantumTopology QT.4 and HabiroCyclotomicCompletions HC.1, HC.3 and HC.4, for WRT invariants and the Habiro
    ring;
  - Tau Ceti's ModularForms, FuchsianOrbifolds and LieHighestWeight layers, for j, Hecke operators, compact modular
    curves, Hauptmoduln and the Poincaré–Birkhoff–Witt theorem.

  Each is a `requests` entry.
- **Supplied to others:** the formal Jacobi triple product and its specialisations, requested by ClassicalArithmeticCompletion
  CA.4 for Jacobi's four-square theorem.
- **Retired supplier.** The roadmap's inputs name `FoundationsAndLibraryIntegration`, retired on 16 September 2026. No node
  names it; what it would have supplied is cited to the pinned libraries directly.

## Sources

Every source is freely available and was opened and read; the sections read, and the SHA-256 of each file, are in the
packet. The roadmap's ANDREWS source (*The Theory of Partitions*) is not public and was replaced by public proofs.

- **`stanley-ec1`** — Richard P. Stanley, *Enumerative Combinatorics, Volume 1, second edition*. The author's freely posted PDF of the second edition (725 pages; its page numbers, which are cited here, differ from the Cambridge printing by about 22 pages in Chapter 1), read 2026-09-24 <https://math.mit.edu/~rstan/ec/ec1.pdf>.
- **`stanley-ec1-errata`** — Richard P. Stanley, *Errata for Enumerative Combinatorics, vol. 1, 2nd ed., 2012*. Version of 17 August 2025 (26 pages; page numbers refer to the Cambridge printing), read 2026-09-24 <https://math.mit.edu/~rstan/ec/errata_2ed.pdf>.
- **`gasper-minicourse-1995`** — George Gasper, *Lecture notes for an introductory minicourse on q-series*. arXiv:math/9509223v1 (25 September 1995; notes dated 19 September 1995), 39 pages <https://arxiv.org/abs/math/9509223>.
- **`andrews-jtp-1965`** — George E. Andrews, *A simple proof of Jacobi's triple product identity*. Proceedings of the American Mathematical Society 16 (1965), 333-334 (doi 10.1090/S0002-9939-1965-0171725-X), publisher scan, free on the AMS site, read 2026-09-24 <https://www.ams.org/journals/proc/1965-016-02/S0002-9939-1965-0171725-X/S0002-9939-1965-0171725-X.pdf>.
- **`ramanujan-pn-1919`** — S. Ramanujan, *Some properties of p(n), the number of partitions of n*. Proceedings of the Cambridge Philosophical Society 19 (1919), 207-210, read in the re-typeset online edition of Ramanujan's Collected Papers (Paper 25, printed pp. 265-268): the PDF of Paper 25 (file ram25.pdf, whose SHA-256 is given) and its HTML version, both linked from the index of published papers at the URL given, read 2026-09-24 <https://ramanujan.sirinudi.org/html/published_papers.html>.
- **`alladi-berkovich-2002`** — Krishnaswami Alladi and Alexander Berkovich, *New polynomial analogues of Jacobi's triple product and Lebesgue's identities*. arXiv:math/0203094v1 (11 March 2002), 19 pages <https://arxiv.org/abs/math/0203094>.
- **`cigler-bressoud-2007`** — Johann Cigler, *Simple proofs of Bressoud's and Schur's polynomial versions of the Rogers-Ramanujan identities*. arXiv:math/0701802v2, 7 pages <https://arxiv.org/abs/math/0701802>.
- **`zhu-semifinite-2021`** — Jun-Ming Zhu, *A semi-finite proof of Jacobi's triple product identity*. arXiv:2106.16156v1 (29 June 2021; published in the American Mathematical Monthly 2015), 2 pages <https://arxiv.org/abs/2106.16156>.
- **`rosengren-rr-2024`** — Hjalmar Rosengren, *A New (But Very Nearly Old) Proof of the Rogers-Ramanujan Identities*. arXiv:2212.02355v3 (2 July 2024), the arXiv version of SIGMA 20 (2024), 059 <https://arxiv.org/abs/2212.02355>.
- **`zwegers-thesis`** — S. Zwegers, *Mock Theta Functions (PhD thesis, Utrecht 2002)*. arXiv:0807.4834v1 (30 July 2008), read 24 September 2026 <https://arxiv.org/abs/0807.4834>.
- **`dmz-quantum-black-holes`** — A. Dabholkar, S. Murthy, D. Zagier, *Quantum Black Holes, Wall Crossing, and Mock Modular Forms*. arXiv:1208.4074v2, read 24 September 2026 <https://arxiv.org/abs/1208.4074>.
- **`kong-teo-eta`** — Z.-Y. Kong, L.-P. Teo, *An Elementary Proof of the Transformation Formula for the Dedekind Eta Function*. arXiv:2302.03280v1 (7 February 2023), read 24 September 2026 <https://arxiv.org/abs/2302.03280>.
- **`savitt-newman`** — D. Savitt, *An elementary proof of Newman's eta-quotient theorem*. arXiv:2507.16225v1 (22 July 2025), read 24 September 2026 <https://arxiv.org/abs/2507.16225>.
- **`matsuda-theta-group`** — K. Matsuda, *Analogue of the theta group Γθ*. arXiv:2602.22471v1 (25 February 2026), read 24 September 2026 <https://arxiv.org/abs/2602.22471>.
- **`andersen-anderson-woodall`** — N. Andersen, G. Anderson, A. Woodall, *The Weil bound for generalized Kloosterman sums of half-integral weight*. arXiv:2309.08528v1, read 24 September 2026 <https://arxiv.org/abs/2309.08528>.
- **`kong-teo-rademacher-2023`** — Ze-Yong Kong, Lee-Peng Teo, *Rademacher's formula for the partition function*. arXiv:2302.03835v1 (8 February 2023), read 2026-09-24 <https://arxiv.org/abs/2302.03835>.
- **`hardy-ramanujan-1918`** — G. H. Hardy, S. Ramanujan, *Asymptotic formulæ in combinatory analysis*. Proc. London Math. Soc. (2) 17 (1918) 75–115; read in the retypeset Collected Papers of Srinivasa Ramanujan, Paper 36 (pp. 341–378), the PDF linked as paper 36 from the listing at the url; read 2026-09-24 <https://ramanujan.sirinudi.org/html/published_papers.html>.
- **`rademacher-1940-bams`** — Hans Rademacher, *Fourier expansions of modular forms and problems of partition*. Bull. Amer. Math. Soc. 46 (1940) 59–73, read 2026-09-24 <https://www.ams.org/journals/bull/1940-46-02/S0002-9904-1940-07129-0/>.
- **`lehmer-1938-tams`** — D. H. Lehmer, *On the series for the partition function*. Trans. Amer. Math. Soc. 43 (1938) 271–295, read 2026-09-24 <https://www.ams.org/journals/tran/1938-043-02/S0002-9947-1938-1501943-5/>.
- **`lehmer-1939-tams`** — D. H. Lehmer, *On the remainders and convergence of the series for the partition function*. Trans. Amer. Math. Soc. 46 (1939) 362–373, read 2026-09-24 <https://www.ams.org/journals/tran/1939-046-00/S0002-9947-1939-0000410-9/>.
- **`whiteman-1956-pjm`** — Albert Leon Whiteman, *A sum connected with the series for the partition function*. Pacific J. Math. 6 (1956) 159–176, read 2026-09-24 <https://msp.org/pjm/1956/6-1/p18.xhtml>.
- **`pribitkin-williams-2019`** — Wladimir de Azevedo Pribitkin, Brandon Williams, *Short proof of Rademacher's formula for partitions*. arXiv:1801.06244v3 (17 November 2018); Res. Number Theory 5 (2019) Paper 17; read 2026-09-24 <https://arxiv.org/abs/1801.06244>.
- **`dlmf-chapter-10`** — F. W. J. Olver, A. B. Olde Daalhuis, D. W. Lozier et al. (eds.), *NIST Digital Library of Mathematical Functions, Chapter 10: Bessel Functions*. online release current on 2026-09-24 <https://dlmf.nist.gov/10>.
- **`borcherds-gkz-1999`** — Richard E. Borcherds, *The Gross–Kohnen–Zagier theorem in higher dimensions*. arXiv:alg-geom/9710002v3; Duke Math. J. 97 (1999) 219–233, correction Duke Math. J. 105 (2000) 183–184 <https://arxiv.org/abs/alg-geom/9710002v3>.
- **`bruinier-funke-2004`** — Jan Hendrik Bruinier, Jens Funke, *On two geometric theta lifts*. arXiv:math/0212286v4 (14 March 2003); published in Duke Math. J. 125 (2004), 45–90 <https://arxiv.org/abs/math/0212286v4>.
- **`bruinier-ono-rhoades-2008`** — Jan H. Bruinier, Ken Ono, Robert C. Rhoades, *Differential operators for harmonic weak Maass forms and the vanishing of Hecke eigenvalues*. arXiv:0802.0963v3 (26 January 2009); published in Math. Ann. 342 (2008), 673–693; v1, v2 compared for the introduction <https://arxiv.org/abs/0802.0963v3>.
- **`dlmf-incomplete-gamma`** — F. W. J. Olver et al. (eds.), *NIST Digital Library of Mathematical Functions, Chapter 8 (Incomplete Gamma and Related Functions) and §13.14 (Whittaker functions)*. online, accessed 2026-09-24 <https://dlmf.nist.gov/8.2>.
- **`lewis-zagier-2001`** — J. Lewis, D. Zagier, *Period functions for Maass wave forms. I*. arXiv:math/0101270v1; Ann. of Math. 153 (2001) 191–258 <https://arxiv.org/abs/math/0101270v1>.
- **`zagier-qmf`** — D. Zagier, *Quantum modular forms*. In Quanta of Maths (Conference in honor of Alain Connes), Clay Mathematics Proceedings 11, AMS and Clay Mathematics Institute 2010, 659–675; author's PDF from the author's MPIM page (its running header reads 'Volume 12'), read 2026-09-24 <https://people.mpim-bonn.mpg.de/zagier/files/qmf/fulltext.pdf>.
- **`zagier-strange`** — D. Zagier, *Vassiliev invariants and a strange identity related to the Dedekind eta-function*. Topology 40 (2001) 945–960; publisher-typeset copy from the author's MPIM page, read 2026-09-24 <https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1016/S0040-9383(00)00005-7/fulltext.pdf>.
- **`lawrence-zagier`** — R. Lawrence, D. Zagier, *Modular forms and quantum invariants of 3-manifolds*. Asian J. Math. 3 (1999) 93–108; published PDF from the author's MPIM page, read 2026-09-24 <https://people.mpim-bonn.mpg.de/zagier/files/ajm/3-1/fulltext.pdf>.
- **`zagier-traces`** — D. Zagier, *Traces of singular moduli*. In Motives, Polylogarithms and Hodge Theory, Part I (F. Bogomolov, L. Katzarkov, eds.), International Press Lecture Series 3, Somerville 2002, 209–244; author's TeX PDF (23 pages, paginated 1–23), read 2026-09-24 <https://people.mpim-bonn.mpg.de/zagier/files/tex/TracesSingModuli/fulltext.pdf>.
- **`bringmann-rolen-eichler`** — K. Bringmann, L. Rolen, *Half-integral weight Eichler integrals and quantum modular forms*. arXiv:1409.3781v4 (18 August 2015), read 2026-09-24; the journal version was not read <https://arxiv.org/abs/1409.3781v4>.
- **`bringmann-rolen-radial`** — K. Bringmann, L. Rolen, *Radial limits of mock theta functions*. arXiv:1409.3782v4 (25 July 2015), read 2026-09-24 <https://arxiv.org/abs/1409.3782v4>.
- **`folsom-ono-rhoades`** — A. Folsom, K. Ono, R. C. Rhoades, *Mock theta functions and quantum modular forms*. Forum of Mathematics, Pi 1 (2013), e2, 27 pp.; published open-access PDF (CC BY 3.0), read 2026-09-24 <https://doi.org/10.1017/fmp.2013.3>.
- **`andrews-garvan-1988`** — G. E. Andrews, F. G. Garvan, *Dyson's crank of a partition*. Bull. Amer. Math. Soc. (N.S.) 18 (1988) 167–171; scanned pages hosted by F. Garvan (five one-page PDFs; the hash is of page 1), read 2026-09-24 <https://qseries.org/fgarvan/papers/dysoncrank>.
- **`garvan-urbana`** — F. G. Garvan, *Combinatorial interpretations of Ramanujan's partition congruences*. In Ramanujan Revisited (Urbana-Champaign 1987), Academic Press 1988, 29–45; the author's preprint version, read 2026-09-24 <https://qseries.org/fgarvan/papers/urbana.pdf>.
- **`zagier-mellin`** — D. Zagier, *The Mellin transform and other useful analytic techniques*. Appendix to E. Zeidler, Quantum Field Theory I: Basics in Mathematics and Physics, Springer 2006, 305–323; author's PDF (paginated 1–16), read 2026-09-24 <https://people.mpim-bonn.mpg.de/zagier/files/tex/MellinTransform/fulltext.pdf>.
- **`borcherds1992`** — R. E. Borcherds, *Monstrous moonshine and monstrous Lie superalgebras*. Invent. Math. 109 (1992) 405–444; author's copy (41 pp.), page numbers of that copy <https://math.berkeley.edu/~reb/papers/monster/monster.pdf>.
- **`borcherds1986`** — R. E. Borcherds, *Vertex algebras, Kac–Moody algebras, and the Monster*. Proc. Natl. Acad. Sci. USA 83 (1986) 3068–3071; author's copy (9 pp.) <https://math.berkeley.edu/~reb/papers/va/va.pdf>.
- **`borcherds1988`** — R. E. Borcherds, *Generalized Kac–Moody algebras*. J. Algebra 115 (1988) 501–512; author's copy (10 pp.) <https://math.berkeley.edu/~reb/papers/gkma/gkma.pdf>.
- **`jurisich1998`** — E. Jurisich, *Generalized Kac–Moody Lie algebras, free Lie algebras and the structure of the Monster Lie algebra*. J. Pure Appl. Algebra 126 (1998) 233–266; arXiv:1311.3258v1 (1996 preprint version) <https://arxiv.org/abs/1311.3258>.
- **`jurisich2009`** — E. Jurisich, *Borcherds' proof of the Conway–Norton conjecture*. arXiv:0903.4456v1 (2009) <https://arxiv.org/abs/0903.4456>.
- **`jurisichlepowskywilson1995`** — E. Jurisich, J. Lepowsky, R. L. Wilson, *Realizations of the Monster Lie algebra*. Selecta Math. (N.S.) 1 (1995) 129–161; arXiv:hep-th/9408037v1 <https://arxiv.org/abs/hep-th/9408037>.
- **`gannon2004`** — T. Gannon, *Monstrous moonshine: the first twenty-five years*. arXiv:math/0402345v2 (Bull. London Math. Soc. 38 (2006) 1–33) <https://arxiv.org/abs/math/0402345>.
- **`matsuonagatomo1997`** — A. Matsuo, K. Nagatomo, *On axioms for a vertex algebra and the locality of quantum fields*. arXiv:hep-th/9706118 (MSJ Memoirs 4, 1999) <https://arxiv.org/abs/hep-th/9706118>.
- **`bakalovkac2006`** — B. Bakalov, V. G. Kac, *Generalized vertex algebras*. arXiv:math/0602072v1 <https://arxiv.org/abs/math/0602072>.
- **`milne2017`** — J. S. Milne, *Modular Functions and Modular Forms (Elliptic Modular Curves)*. Course notes, version 1.31 (March 22, 2017) <https://www.jmilne.org/math/CourseNotes/MF.pdf>.

## Layers

## QM.0 Formal q-series and partitions

This layer builds the formal theory of q-series that the rest of the roadmap reads coefficients
from: the partition function and its generating products, the finite and infinite q-Pochhammer
symbols in a power-series ring, q-integers, q-factorials and Gaussian polynomials, the
q-binomial theorems (Rothe's finite theorem, q-Vandermonde, Euler's two identities and Cauchy's
q-binomial theorem), the Jacobi triple product identity in a universal two-series form and in the
classical form with Laurent-polynomial coefficients, with its standard specialisations (Jacobi's
identity for (q; q)_∞³, the product formulas for ∑ x^{n²}, ∑ x^{r²+r} and ∑ (−1)ⁿx^{n²}, Gauss's
triangular-number identity), Ramanujan's partition congruences modulo 5, 7 and 35, and the
Rogers–Ramanujan identities in series and partition form. Every identity is an identity of formal
power series, with infinite products and sums converging in the coefficientwise (x-adic) topology;
the passage to complex values is a separate theorem (0H) with its disc stated, and no identity of
this layer assigns a value on or beyond the boundary of that disc.

Sources: R. P. Stanley, *Enumerative Combinatorics* 1, 2nd ed. (author's PDF), §§1.1, 1.3, 1.7,
1.8 and Exercises 1.82, 1.88, 1.91, 1.100 with their solutions, and the author's errata of
17 August 2025; G. Gasper, *Lecture notes for an introductory minicourse on q-series*
(arXiv:math/9509223), §§1–2; G. E. Andrews, *A simple proof of Jacobi's triple product identity*,
Proc. AMS 16 (1965); S. Ramanujan, *Some properties of p(n), the number of partitions of n*,
Proc. Cambridge Philos. Soc. 19 (1919) (online Collected Papers, Paper 25); K. Alladi and
A. Berkovich, *New polynomial analogues of Jacobi's triple product and Lebesgue's identities*
(arXiv:math/0203094), §1; J. Cigler, *Simple proofs of Bressoud's and Schur's polynomial versions
of the Rogers–Ramanujan identities* (arXiv:math/0701802), §1; J.-M. Zhu, *A semi-finite proof of
Jacobi's triple product identity* (arXiv:2106.16156); H. Rosengren, *A new (but very nearly old)
proof of the Rogers–Ramanujan identities* (arXiv:2212.02355), §§1–2.

### What Mathlib and Tau Ceti already provide (consume; never restate)

- **Partitions.** `Nat.Partition n` (a multiset of positive parts with sum n, a `Fintype`), with the
  families `Nat.Partition.restricted n p` (all parts satisfy p), `odds`, `distincts` and
  `countRestricted n m` (each part fewer than m times); `Nat.Partition.ofSums` builds partitions
  from multisets. Tau Ceti has the conjugate partition `TauCeti.conjugate` (an involution,
  `TauCeti.conjugate_conjugate`) through Young diagrams (`TauCeti.diagramOf_conjugate`,
  `TauCeti.rowLen_diagramOf`, `TauCeti.colLen_zero_diagramOf`).
- **Generating products.** `Nat.Partition.genFun f` for a character f(part, multiplicity) and
  `Nat.Partition.hasProd_genFun` (it is the product over parts i of 1 + ∑_j f(i, j)X^{ij}, for every
  topology on the coefficients), `multipliable_genFun`, `genFun_eq_tprod`; the specialisations
  `hasProd_powerSeriesMk_card_restricted` and `hasProd_powerSeriesMk_card_countRestricted`, with
  Glaisher's theorem `card_restricted_eq_card_countRestricted` and Euler's
  `card_odds_eq_card_distincts`. The case "every part allowed", the generating function of p(n)
  itself, is not stated in Mathlib (its module docstring lists it as a TODO); it is 0D below.
- **Coefficientwise finiteness.** `PowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_order_atTop_nhds_top`
  (a product of 1 + fᵢ with order fᵢ → ∞ converges), `summable_of_tendsto_order_atTop_nhds_top`,
  `hasSum_iff_hasSum_coeff`, `tendsto_iff_coeff_tendsto`, the geometric series
  `tsum_pow_mul_one_sub_of_constantCoeff_eq_zero`, completeness `instCompleteSpace`.
- **Specialisation maps.** `PowerSeries.map` (coefficients), `PowerSeries.subst` with `HasSubst`,
  `substAlgHom` and `MvPowerSeries.continuous_subst`; `PowerSeries.rescale` (= subst of c·X) and
  `PowerSeries.expand` (= subst of X^p) with `coeff_expand_mul`, `coeff_expand_of_not_dvd` and the
  Frobenius relation `map_frobenius_expand`; evaluation `PowerSeries.eval₂`, `eval₂Hom`,
  `continuous_eval₂` at topologically nilpotent points; `HasProd.map`, `Multipliable.map_tprod`.
- **Euler's pentagonal number theorem.** Formally, `PowerSeries.WithPiTopology.hasProd_one_sub_X_pow`:
  ∏_{n≥0}(1 − X^{n+1}) = `pentagonalSeries R` = ∑_{k∈ℤ}(−1)^k X^{k(3k−1)/2}
  (`hasSum_pentagonalSeries`, `coeff_pentagonalSeries_pentagonal`, `coeff_pentagonalSeries_eq_zero`,
  `pentagonal`, `pentagonal_injective`), over every commutative ring and every topology;
  analytically, `eulerFunction_eq_tprod` and `hasProd_eulerFunction` for ‖x‖ < 1 in a complete
  normed ring. The layer cites these and plans no pentagonal node.
- **Analysis.** `multipliable_one_add_of_summable` (products in complete normed rings),
  `tendsto_tsum_of_dominated_convergence` (Tannery), `tsum_mul_tsum_eq_tsum_sum_antidiagonal_of_summable_norm`.

Mathlib and Tau Ceti have no q-Pochhammer symbol, q-integer, q-factorial or Gaussian polynomial
(Mathlib's `Pochhammer` is the ordinary rising factorial and its file lists the q-analogues as a
TODO), no q-binomial theorem, no Jacobi triple product, no Rogers–Ramanujan identity and no
partition congruence.

### Conventions

- **Formal variable.** R is a commutative ring and R⟦X⟧ its power series; X plays the role of q
  (or x). Convergence of infinite sums and products in R⟦X⟧ is Mathlib's coefficientwise topology
  (`PowerSeries.WithPiTopology`) over an arbitrary topology on R; every identity of this layer has
  eventually constant coefficients, so it holds for every topology on R, in particular the discrete
  one. Statements with `∑'` or `∏'` assume R is T2.
- **q-Pochhammer symbols** take the base as a parameter: (a; b)_n = ∏_{0≤i<n}(1 − a bⁱ) for
  a, b ∈ R⟦X⟧, and (a; b)_∞ is defined coefficientwise (coefficient m is that of (a; b)_{m+1}); it is
  the infinite product exactly when constantCoeff b = 0. So (q; q)_∞ = (X; X)_∞ = ∏_{n≥1}(1 − qⁿ),
  (q; q²)_∞ = ∏(1 − q^{2n−1}), (−q; q)_∞ = ∏_{n≥1}(1 + qⁿ). Quotients are `PowerSeries.invOfUnit`
  of series with constant coefficient 1.
- **Gaussian polynomials** [n, k] live in S[q] (`Polynomial`) over any commutative semiring S,
  vanish for k > n, and are evaluated at a base q ∈ T by `Polynomial.eval` or at a series by
  `Polynomial.aeval`. The recursion is [n + 1, k + 1] = [n, k] + q^{k+1}[n, k + 1].
- **Partition counts** are cardinalities of filters of `Finset.univ : Finset (Nat.Partition n)`;
  p(n) = `partitionCount n`. "Parts differ by at least 2" means the multiset of parts has no
  repetition and never contains both i and i + 1.
- **Integer exponents** k(k ± 1)/2, j(3j − 1)/2, j(5j − 1)/2, j(5j − 3)/2 are nonnegative integers for
  every k, j ∈ ℤ and are converted with `Int.toNat`; signs (−1)^k for k ∈ ℤ are `Int.negOnePow`.
- **Congruences** are stated as divisibility of natural numbers, or as vanishing in `ZMod p`.

### 0A. Objects

- **`partitionCount`** (definition, `partition-function`; Stanley p. 65). p(n) = #Nat.Partition n.
  API: `partitionCount_eq_card` (definitional), `partitionCount_zero` (p(0) = 1),
  `partitionCount_one`, `partitionCount_eq_card_restricted` (p(n) = #(restricted n (fun _ ↦ True)),
  so Mathlib's generating-function lemmas apply), `partitionCount_pos`, `partitionCount_le_succ`.
  Unit tests: `partitionCount_five` (p(5) = 7), `partitionCount_twenty` (p(20) = 627),
  `partitionCount_zero_eq_one` (the empty partition), `partitionCount_four_ne_compositions`
  (p(4) = 5 ≠ 2³, the number of compositions).
- **`qPochhammer`, `qPochhammerInf`** (construction, `q-pochhammer`; Gasper (1.2.3), (1.2.7)).
  (a; b)_n and (a; b)_∞ as in the conventions. API: `qPochhammer_zero`, `qPochhammer_succ`
  ((a; b)_{n+1} = (a; b)_n(1 − abⁿ)), `qPochhammer_succ'` (= (1 − a)(ab; b)_n), `qPochhammer_add`
  ((a; b)_{m+n} = (a; b)_m(ab^m; b)_n); for constantCoeff b = 0: `coeff_qPochhammerInf`
  (coefficientwise finiteness: coeff m (a; b)_∞ = coeff m (a; b)_n for m < n),
  `hasProd_qPochhammerInf` (the product ∏_{i≥0}(1 − abⁱ), every topology on R),
  `tendsto_qPochhammer`, `qPochhammerInf_eq_mul` ((a; b)_∞ = (a; b)_n(abⁿ; b)_∞),
  `constantCoeff_qPochhammerInf` (= 1 − constantCoeff a), `isUnit_qPochhammerInf`,
  `expand_qPochhammerInf` (q ↦ q^k); and `qPochhammerInf_X_X` ((q; q)_∞ = `pentagonalSeries R`),
  `map_qPochhammerInf`, the multisection `qPochhammerInf_X_X_eq_prod`
  ((q; q)_∞ = ∏_{r=1}^{m}(q^r; q^m)_∞ for m ≥ 1), and the analytic compatibility
  `hasSum_eval_qPochhammerInf` (for a ∈ ℂ and |z| < 1, ∑ₙ coeff n ((a; q)_∞) zⁿ converges to
  ∏_{i≥0}(1 − azⁱ), by 0H). Unit tests: `qPochhammer_two` ((a; q)_2 = (1 − a)(1 − aq)),
  `qPochhammerInf_zero_left` ((0; b)_∞ = 1), `qPochhammerInf_one_X` ((1; q)_∞ = 0: the product
  starts at i = 0), `coeff_qPochhammerInf_X_X` (coefficients −1, 0, 1 at q², q³, q⁵, as in
  `pentagonalSeries`), `qPochhammerInf_base_matters` ((q; q²)_∞ ≠ (q; q)_∞),
  `not_summable_eval_one_qPochhammerInf` (the formal (q; q)_∞ has no value at q = 1: its
  coefficients do not tend to 0, although every (q; q)_n vanishes at 1).
- **`qInt`** (definition, `q-integer`; Stanley p. 37). (n) = 1 + q + ⋯ + q^{n−1} ∈ S[q]. API:
  `qInt_zero`, `qInt_succ` ((n + 1) = (n) + qⁿ), `qInt_succ'` (= 1 + q(n)), `one_sub_X_mul_qInt`
  ((1 − q)(n) = 1 − qⁿ over a ring), `eval_one_qInt` ((n)(1) = n), `map_qInt`. Unit tests:
  `qInt_three`, `qInt_zero_one` ((0) = 0, (1) = 1), `eval_one_qInt_five`, `qInt_two_ne_const`.
- **`qFactorial`** (definition, `q-factorial`; Stanley p. 37, Gasper (3.2.3)). (n)! = (1)(2)⋯(n).
  API: `qFactorial_zero`, `qFactorial_succ`, `eval_one_qFactorial` ((n)!(1) = n!),
  `one_sub_X_pow_mul_qFactorial` ((1 − q)ⁿ(n)! = (q; q)_n in R⟦q⟧), `map_qFactorial`. Unit tests:
  `qFactorial_three` ((1 + q)(1 + q + q²)), `qFactorial_zero_eq_one`, `eval_one_qFactorial_four`
  (24), `qFactorial_two_ne_const`.
- **`qBinomial`** (definition, `q-binomial-coefficient`; Stanley (1.66)–(1.67), Gasper (1.3.4) and
  Exercise 1.6(iii)). API: `qBinomial_zero_right`, `qBinomial_zero_succ`, `qBinomial_succ_succ`
  (the defining rule), `qBinomial_succ_succ'` ([n + 1, k + 1] = q^{n−k}[n, k] + [n, k + 1] for k ≤ n,
  Stanley (1.67)), `qBinomial_eq_zero_of_lt`, `qBinomial_self`, `qBinomial_symm`
  ([n, n − k] = [n, k]), `qFactorial_eq_qBinomial_mul` ((n)! = [n, k](k)!(n − k)!),
  `qPochhammer_X_X_eq_qBinomial_mul` ((q; q)_n = [n, k](q; q)_k(q; q)_{n−k}), `eval_one_qBinomial`
  ([n, k](1) = C(n, k)), `map_qBinomial`, `natDegree_qBinomial` (k(n − k)), `monic_qBinomial`,
  `reverse_qBinomial` (palindromic). Everything is proved from the two Pascal rules without
  division, so it holds over every commutative semiring. Unit tests: `qBinomial_four_two`
  ([4, 2] = 1 + q + 2q² + q³ + q⁴), `qBinomial_five_two` ([5, 2] = 1 + q + 2q² + 2q³ + 2q⁴ + q⁵ + q⁶,
  Stanley p. 67), `qBinomial_degenerate` ([3, 0] = 1, [0, 1] = 0, [2, 3] = 0),
  `eval_one_qBinomial_five_two` (10), `eval_two_qBinomial_four_two` (35 two-dimensional subspaces
  of 𝔽₂⁴, Stanley Proposition 1.7.2), `qBinomial_two_one_ne_choose` ([2, 1] ≠ 2).

### 0B. Specialisation maps

- **Lemma** `coefficient-maps-preserve-products` (`continuous_powerSeries_map`,
  `hasProd_powerSeries_map`): a continuous ring homomorphism φ : R → T gives a continuous
  `PowerSeries.map φ`, hence maps convergent products and sums to convergent products and sums.
  With discrete topologies every φ qualifies: a ↦ ±1 on ℤ[a, a⁻¹], v ↦ −1 on ℤ[v], ℤ → ZMod p.
- **Lemma** `substitution-preserves-products` (`hasProd_subst`): for substitutable a (nilpotent
  constant coefficient) and discrete coefficients, f ↦ f.subst a maps convergent products to
  convergent products; this covers `expand` (q ↦ q^k) and `rescale` (q ↦ cq).
- **Lemma** `evaluation-preserves-products` (`hasProd_eval₂`): evaluation `eval₂ φ t` at a
  topologically nilpotent t of a complete, separated, linearly topologised ring is a continuous
  ring homomorphism and maps convergent products to convergent products. It is used for a series
  in two variables A⟦w⟧, A = R⟦q⟧, evaluated at w = z with constantCoeff z = 0.

### 0C. q-binomial identities

- **Theorem (the q-binomial theorem; Rothe, Stanley (1.87))** `q-binomial-theorem`
  (`prod_one_add_mul_pow_eq_sum`): in every commutative ring T, for all x, q ∈ T,
  ∏_{0≤i<n}(1 + xqⁱ) = ∑_{k=0}^{n} q^{k(k−1)/2}[n, k](q)x^k. Proof by induction on n with the second
  Pascal rule. At q = 1 the binomial theorem; the factor q^{k(k−1)/2} is essential.
- **Theorem (q-Vandermonde; Stanley, solution to Exercise 1.100; Cigler (9))**
  `q-vandermonde-identity` (`qBinomial_add`): [a + b, n] = ∑_k q^{k(k+b−n)}[a, k][b, n − k], from
  ∏_{i<a+b}(1 + qⁱx) = ∏_{i<b}(1 + qⁱx)·∏_{i<a}(1 + qⁱ(q^b x)) and the q-binomial theorem.
- **Lemma** `gaussian-polynomial-limits` (`tendsto_aeval_qBinomial_mul_qPochhammer`,
  `tendsto_aeval_qBinomial_mul_qPochhammerInf`): for a base q ∈ R⟦X⟧ with constantCoeff q = 0,
  [n, k](q) → 1/(q; q)_k as n → ∞ with k fixed, and [n, k](q) → 1/(q; q)_∞ as k → ∞ and n − k → ∞
  (Alladi–Berkovich (1.10)). The coefficient of X^m stabilises once n − k > m (resp. k, n − k > m),
  by (q; q)_n = [n, k](q; q)_k(q; q)_{n−k} and coefficientwise finiteness.
- **Theorem (Euler's first identity; Andrews (E1), Gasper (1.3.8), Stanley 1.8.6(c))**
  `euler-first-identity` (`hasSum_qPochhammerInf_neg`): for every x ∈ R⟦q⟧,
  (−x; q)_∞ = ∑_{k≥0} q^{k(k−1)/2}x^k/(q; q)_k. Proof: the q-binomial theorem and the Gaussian
  limits; the factor q^{k(k−1)/2} gives convergence for every x, including constants.
- **Theorem (Cauchy's q-binomial theorem; Gasper (1.2.8))** `cauchy-q-binomial-theorem`
  (`hasSum_cauchy`): for a ∈ R⟦q⟧ and z with constantCoeff z = 0,
  ∑_{n≥0}(a; q)_n zⁿ/(q; q)_n = (az; q)_∞/(z; q)_∞. Proof: in A⟦w⟧ (A = R⟦q⟧) the quotient
  g(w) = (aw; q)_∞/(w; q)_∞ satisfies (1 − w)g(w) = (1 − aw)g(qw) (Gasper (1.2.15)), so its
  coefficients satisfy cₙ(1 − qⁿ) = (1 − aq^{n−1})c_{n−1} (Gasper (1.2.16)); 1 − qⁿ is a unit of A, so
  cₙ = (a; q)_n/(q; q)_n; then evaluate at w = z (0B). The terminating case a = q^{−m} is not formal
  (q is not a unit of R⟦q⟧); it is the q-binomial theorem.
- **Theorem (Euler's second identity; Stanley (1.82), Gasper (1.3.6), Andrews (E2))**
  `euler-second-identity` (`hasSum_invOfUnit_qPochhammerInf`): for every x ∈ R⟦q⟧,
  1/(xq; q)_∞ = ∑_{k≥0} x^k q^k/(q; q)_k; the case a = 0, z = xq of Cauchy's theorem.

### 0D. Partitions and their generating products

- **Theorem (Euler's generating function; Stanley (1.77))** `euler-partition-generating-function`
  (`partitionSeries_mul_qPochhammerInf`): (∑ p(n)qⁿ)·(q; q)_∞ = 1 in R⟦q⟧ for every commutative ring
  R; this is the unrestricted case of `hasProd_powerSeriesMk_card_restricted`, multiplied by
  (q; q)_∞ factor by factor.
- **Theorem (Euler's recurrence; Stanley (1.91))** `euler-partition-recurrence`
  (`partitionCount_recurrence`): ∑_{k∈ℤ}(−1)^k p(n − k(3k − 1)/2) = 0 for n ≥ 1, from the generating
  function and Mathlib's pentagonal series. Acceptance: p(20) = 490 + 385 − 176 − 101 + 22 + 7 = 627.
- **Theorem (Stanley (1.76))** `partitions-with-at-most-k-parts` (`partitionsAtMost_mul_qPochhammer`):
  the partitions with at most k parts have generating function 1/(q; q)_k; for "largest part ≤ k"
  it is Mathlib's restricted product, and Tau Ceti's conjugation exchanges the two conditions.
- **Theorem (partitions in a box; Stanley Proposition 1.7.3)** `partitions-in-a-box`
  (`coeff_qBinomial_eq_card`): the coefficient of q^m in [j + k, j] is the number of partitions of m
  with at most k parts, each at most j. Proof by induction on j + k: split by "fewer than k parts"
  versus "exactly k parts" (subtract 1 from each part), and use the defining Pascal rule.
- **Lemma (Stanley (1.81))** `euler-odd-distinct-product-identity`
  (`qPochhammerInf_neg_X_mul_qPochhammerInf_X_sq`): (−q; q)_∞(q; q²)_∞ = 1, from
  (1 + qⁿ)(1 − qⁿ) = 1 − q^{2n} and the multisection of (q; q)_∞.

### 0E. The Jacobi triple product identity

- **Theorem (MacMahon's finite form; Alladi–Berkovich (1.8))** `finite-jacobi-triple-product`
  (`finite_jacobi_triple_product`): in every commutative ring, for all b, u,
  ∏_{i=1}^{N}(1 + b^{i−1}uⁱ)(1 + bⁱu^{i−1}) = ∑_{k=−N}^{N} b^{k(k−1)/2}u^{k(k+1)/2}[2N, N + k](bu).
  Proof: with q = bu both products are q-binomial products (0C); group the terms b^m u^l by
  k = l − m and apply q-Vandermonde in the form ∑_m q^{m(m+k)}[N, m][N, m + k] = [2N, N + k]; negative
  k by the symmetry b ↔ u. (Alladi–Berkovich print the product side of (1.8) as
  (−qz, qz^{−1}; q²)_L; it is (−qz, −qz^{−1}; q²)_L.)
- **Theorem (universal triple product)** `universal-jacobi-triple-product`
  (`universal_jacobi_triple_product`): for α, β ∈ R⟦X⟧ with constantCoeff α = 0,
  ∏_{n≥0}(1 + βⁿα^{n+1})(1 + β^{n+1}αⁿ)(1 − β^{n+1}α^{n+1}) = ∑_{k∈ℤ} β^{k(k−1)/2}α^{k(k+1)/2}
  (Ramanujan's f(α, β)). Proof: the finite form with b = β, u = α and the Gaussian limit
  [2N, N + k](αβ) → 1/(αβ; αβ)_∞. β is arbitrary (β = 1 is allowed); constantCoeff α = 0 is needed
  (α = β = 1: the sum diverges). The universal case is R = ℤ[v], α = X, β = v, and every
  specialisation below is a choice of (α, β).
- **Theorem (the Jacobi triple product identity; Andrews 1965, Stanley Exercise 1.91(a), Gasper
  (2.2.1))** `jacobi-triple-product` (`jacobi_triple_product`): for every commutative ring R and
  unit a ∈ Rˣ, in R⟦x⟧,
  ∏_{n≥1}(1 + ax^{2n−1})(1 + a⁻¹x^{2n−1})(1 − x^{2n}) = ∑_{n∈ℤ} aⁿx^{n²},
  by α = ax, β = a⁻¹x. For R = ℤ[a, a⁻¹] (`LaurentPolynomial ℤ`, a = T 1) it is the identity of
  formal power series in x with Laurent-polynomial coefficients in a. Andrews' proof is analytic
  (valid for |x| < |z| and extended by analytic continuation); the formal proof goes through the
  finite form instead.
- **Theorem (Jacobi's identity; Stanley Exercise 1.91(d))** `jacobi-cube-identity` (`jacobi_cube`,
  `two_mul_jacobi_cube`): ∏(1 − qⁿ)³ = ∑_{n≥0}(−1)ⁿ(2n + 1)q^{n(n+1)/2}, equivalently
  2∏(1 − qⁿ)³ = ∑_{n∈ℤ}(−1)ⁿ(2n + 1)q^{n(n+1)/2}, which is ½∑_{n∈ℤ} where 2 is invertible. Proof: the
  universal identity over ℤ[v] with α = X, β = v has the factor 1 + v on both sides; cancel it in the
  domain ℤ[v]⟦X⟧, then specialise v ↦ −1 (0B) and X ↦ −X. This is the formal content of Stanley's
  "divide by 1 − x and let x → 1"; the intermediate lines of his solution are misprinted (the
  left side is ∑_{n≥1}(−1)ⁿ(xⁿ − x^{1−n})q^{(n 2)}, and the limit has q^{(n+1 2)}), and the errata's
  replacement line is still incorrect.
- **Theorem** `theta-three-product-identity` (`theta_three_product`):
  ∏(1 + x^{2n−1})²(1 − x^{2n}) = ∑_{n∈ℤ} x^{n²} (a = 1).
- **Theorem** `theta-two-product-identity` (`theta_two_product`):
  2∏(1 + x^{2n})²(1 − x^{2n}) = ∑_{r∈ℤ} x^{r²+r} (α = x², β = 1; the factor 2 is the n = 0 factor
  1 + β).
- **Theorem (Gauss, Stanley (1.131))** `gauss-theta-four-product-identity` (`gauss_theta_four`):
  ∏(1 − xⁿ)/(1 + xⁿ) = ∑_{n∈ℤ}(−1)ⁿx^{n²}, stated as (x; x)_∞ = (−x; x)_∞·∑(−1)ⁿx^{n²} (a = −1,
  multisection and the odd–distinct identity).
- **Theorem (Gauss, Stanley (1.132))** `gauss-triangular-number-identity` (`gauss_triangular`):
  (∑_{n≥0} q^{n(n+1)/2})·(q; q²)_∞ = (q²; q²)_∞. Over ℤ from α = q, β = 1 after cancelling 2; over
  every ring by mapping from ℤ (over ZMod 2 the cancellation itself is not available).

### 0F. Ramanujan's congruences

- **Lemma (Frobenius)** `frobenius-congruence-for-the-euler-product` (`qPochhammerInf_pow_prime`):
  in 𝔽_p⟦q⟧, (q; q)_∞^p = expand p ((q; q)_∞) = (q^p; q^p)_∞ (`map_frobenius_expand`,
  `ZMod.frobenius_zmod`). Over ℤ it fails (the coefficient of q in (q; q)_∞⁵ is −5).
- **Lemma (congruence criterion)** `partition-congruence-criterion`
  (`partitionCount_modEq_zero_of_coeff`): for p prime and 0 ≤ r ≤ p, if the coefficients of
  q^r(q; q)_∞^{p−1} at the multiples of p vanish in 𝔽_p, then p(pn + p − r) ≡ 0 (mod p) for all n.
  Proof: q^r E^{p−1} = expand p (E)·q^r F with E·F = 1; the coefficient of q^{pn} of
  expand p (E)·G is ∑_{i≤n} coeff i (E)·coeff (p(n − i)) G, and e₀ = 1 gives the vanishing of all
  coeff (pn)(q^r F) by strong induction. This is the coefficient form of the relation
  Λ₀(g^p h) = gΛ₀(h) of ClassicalArithmeticCompletion's Cartier operators.
- **Lemma** `fifth-dissection-of-q-times-euler-fourth-power` (`five_dvd_coeff_X_mul_pow_four`):
  every coefficient of q^{5n} in q(q; q)_∞⁴ is divisible by 5. Write q E⁴ = q·E·E³ (pentagonal
  theorem and Jacobi's identity); a term of exponent 1 + k(3k − 1)/2 + μ(μ + 1)/2 ≡ 0 (mod 5) has
  (2μ + 1)² + 2(1 − k)² ≡ 0, hence 5 ∣ 2μ + 1.
- **Lemma** `seventh-dissection-of-q-squared-times-euler-sixth-power`
  (`fortynine_dvd_coeff_X_sq_mul_pow_six`): every coefficient of q^{7n} in q²(q; q)_∞⁶ is divisible
  by 49, since q²E⁶ = q²(E³)² and (2μ + 1)² + (2ν + 1)² ≡ 0 (mod 7) forces 7 ∣ 2μ + 1, 2ν + 1.
- **Theorems (Ramanujan 1919)** `ramanujan-congruence-mod-five` (`ramanujan_congruence_five`):
  5 ∣ p(5n + 4); `ramanujan-congruence-mod-seven` (`ramanujan_congruence_seven`): 7 ∣ p(7n + 5);
  `ramanujan-congruences` (`ramanujan_congruence_thirtyfive`): 35 ∣ p(35n + 19). Acceptance:
  p(4) = 5, p(9) = 30, p(14) = 135, p(19) = 490; p(5) = 7, p(12) = 77, p(26) = 2436.

The congruence p(11n + 6) ≡ 0 (mod 11) and the prime-power congruences are stated in Ramanujan's
paper but not proved there; they are not part of this layer.

### 0G. The Rogers–Ramanujan identities

- **Lemma (Cigler, Theorem 1)** `cigler-identity` (`cigler_identity`):
  ∑_{j=−k}^{k}(−1)^j q^{j(3j−1)/2}[n, k − j][n, k + j] = [n, k]. Proof: both variants in Cigler (4), (6)
  follow from the two Pascal rules and the sign-reversing involution j ↦ 1 − j; then the sum obeys
  the Pascal recurrence with the boundary values of [n, k].
- **Lemma** `cigler-shifted-identity` (`cigler_identity_shifted`):
  ∑_j(−1)^j q^{3j(j−1)/2}[n, k − j][n + 1, k + j] = q^k[n, k].
- **Theorem (Bressoud)** `bressoud-first-polynomial-identity` (`bressoud_first`):
  ∑_k q^{k²}[n, k] = ∑_j(−1)^j q^{j(5j−1)/2}[2n, n − 2j]; and `bressoud-second-polynomial-identity`
  (`bressoud_second`): ∑_k q^{k²+k}[n, k] = ∑_j(−1)^j q^{j(5j−3)/2}[2n + 1, n + 1 − 2j]. Proof: multiply
  Cigler's identities by q^{k²}, sum over k and apply q-Vandermonde (Cigler (8), (10)).
- **Theorems (Rogers–Ramanujan)** `rogers-ramanujan-first` (`rogers_ramanujan_first`):
  ∑_{k≥0} q^{k²}/(q; q)_k = 1/((q; q⁵)_∞(q⁴; q⁵)_∞); `rogers-ramanujan-second`
  (`rogers_ramanujan_second`): ∑_{k≥0} q^{k²+k}/(q; q)_k = 1/((q²; q⁵)_∞(q³; q⁵)_∞). Proof: let n → ∞
  in Bressoud's identities (Gaussian limits), evaluate ∑(−1)^j q^{j(5j−1)/2} and ∑(−1)^j q^{j(5j−3)/2}
  by the universal triple product at (α, β) = (−q², −q³) and (−q, −q⁴), and divide by the
  multisection of (q; q)_∞ modulo 5. Acceptance: coefficients 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 6 and
  1, 0, 1, 1, 1, 1, 2, 2, 3, 3, 4.
- **Lemma** `difference-two-partitions` (`differenceTwo_mul_qPochhammer`): partitions into k parts
  differing by at least 2 have generating function q^{k²}/(q; q)_k, and q^{k²+k}/(q; q)_k when 1 is not
  a part, by (λ₁, …, λ_k) ↦ (λ₁ + 2k − 1, …, λ_k + 1) (resp. + 2k, …, + 2) from partitions with at most
  k parts (Stanley, solution to Exercise 1.88(b)).
- **Theorem (MacMahon, Schur)** `rogers-ramanujan-partition-theorem` (`rogers_ramanujan_partitions`):
  the partitions of n into parts ≡ ±1 (mod 5) are as many as those with parts differing by at least
  2; the partitions into parts ≡ ±2 (mod 5) are as many as those with parts differing by at least 2
  and no part 1.

### 0H. Evaluation and the acceptance distinction

- **Theorem** `evaluation-of-formal-products` (`hasSum_eval_tprod_one_add`,
  `hasProd_eval_one_add`): let fₙ ∈ ℂ⟦X⟧ with order fₙ → ∞ and r ≥ 0 with
  ∑ₙ∑_k |coeff k fₙ| r^k < ∞. For |z| ≤ r the series ∑_k coeff k (∏(1 + fₙ)) z^k converges absolutely
  and equals the convergent analytic product ∏(1 + fₙ(z)). Proof: majorise by ∏(1 + |fₙ|), whose
  weighted ℓ¹ norm is at most exp(∑‖fₙ‖_r), and pass to the limit by dominated convergence.
  Acceptance: fₙ = −X^{n+1} gives Mathlib's `eulerFunction` for |z| < 1; at z = 1 the hypothesis
  and the conclusion both fail for (q; q)_∞.

A formal identity of this layer never supplies a value at a root of unity or on |q| = 1: the only
evaluations are those of 0H, inside a disc where the majorant series converge, and the boundary
behaviour of such functions (radial limits at roots of unity, quantum modular behaviour) is a
separate theorem owned by QM.5.

### Dependencies

- Inside the roadmap: QM.0 is the formal base of QSeriesPartitionsAndMockModularForms:QM.1 (the
  eta product q^{1/24}(q; q)_∞ and the theta product formulas come from 0A, 0E and 0H) and of
  QM.2 (p(n) and its generating function), and supplies the Gaussian polynomials and q-Pochhammer
  symbols used in QM.5.
- Other roadmaps: ClassicalArithmeticCompletion:CA.2 (formal generating functions; its Cartier
  operators Λ_r are the decimation behind 0F and its disc theorem for quotients complements 0H);
  ClassicalArithmeticCompletion:CA.4 consumes 0E (Hirschhorn's proof of Jacobi's four-square
  theorem uses the triple product and its specialisations (i)–(iv)); ArithmeticStatistics:ST.5
  consumes the Gaussian polynomials and the q-binomial theorem (subspace counts over 𝔽_q);
  HabiroNahmSeries:HB.4 and HabiroCyclotomicCompletions:HC.1 consume the q-Pochhammer symbols
  (analytic Nahm-sum products and the cofinal system (q; q)_N).
- Tau Ceti: conjugation of partitions (TauCeti/Combinatorics/Enumerative/Partition/Conjugate.lean).

### Acceptance tests

- p(5) = 7, p(20) = 627, and the recurrence reproduces p(20) from p(19), p(18), p(15), p(13), p(8),
  p(5).
- (q; q)_∞ equals Mathlib's `pentagonalSeries`; (1; q)_∞ = 0; the formal (q; q)_∞ has no value at 1.
- [5, 2] = 1 + q + 2q² + 2q³ + 2q⁴ + q⁵ + q⁶, [5, 2](1) = 10, [4, 2](2) = 35.
- The triple product at a = T 1 over ℤ[a, a⁻¹] is the requested Laurent-polynomial identity; at
  (α, β) = (−q, −q²) the universal form gives Mathlib's pentagonal theorem.
- ∏(1 − qⁿ)³ = 1 − 3q + 5q³ − 7q⁶ + 9q^{10} − ⋯.
- p(4), p(9), p(14), p(19) are divisible by 5; p(5), p(12), p(19), p(26) by 7; p(19) by 35.
- ∑ q^{k²}/(q; q)_k and 1/((q; q⁵)_∞(q⁴; q⁵)_∞) agree; for n = 6 there are three partitions into
  parts ≡ ±1 (mod 5) (6, 4 + 1 + 1, 1⁶) and three with parts differing by at least 2 (6, 5 + 1, 4 + 2).
- Evaluating (q; q)_∞ at |z| < 1 gives Mathlib's `eulerFunction z`.

---

## QM.1 Theta, eta and Jacobi forms

This layer builds the analytic theta and eta functions with their full multiplier systems, eta
quotients with their orders at every cusp, the Jacobi theta function `ϑ(z; τ)`, and classical
Jacobi forms of weight `k` and index `m` on `SL(2, ℤ) ⋉ ℤ²`, including forms with multiplier
systems and the theta decomposition into vector-valued forms of weight `k − 1/2`. It starts from
Mathlib's `ModularForm.eta` (with its `S`-law, nonvanishing and `logDeriv η = (πi/12)E₂`),
`ModularForm.discriminant = η²⁴`, `jacobiTheta` (with its `S`- and `T²`-laws) and `jacobiTheta₂`
(with its functional equation and quasi-periodicity). Everything below is new; nothing restates
those declarations.

**Sources.** Zwegers, *Mock Theta Functions* (thesis, arXiv:0807.4834), Proposition 1.3,
Theorem 1.11 and Chapter 3 §3.1; Kong–Teo, *An elementary proof of the transformation formula for
the Dedekind eta function* (arXiv:2302.03280), §§3–7; Savitt, *An elementary proof of Newman's
eta-quotient theorem* (arXiv:2507.16225), §§1–4 and Appendix A; Dabholkar–Murthy–Zagier, *Quantum
black holes, wall crossing, and mock modular forms* (arXiv:1208.4074v2), §§3.1, 4.1–4.3; Matsuda,
*Analogue of the theta group Γθ* (arXiv:2602.22471), §§1–2; Andersen–Anderson–Woodall, *The Weil
bound for generalized Kloosterman sums of half-integral weight* (arXiv:2309.08528), §§2, 3.2.

**Boundaries.**
- `MetaplecticAutomorphicForms:MP.7` owns the half-integral-weight framework: the principal-branch
  factor `j(γ, τ)^r`, the sign cocycle `σ_r`, the definition of a multiplier system of weight
  `r ∈ ½ℤ`, the spaces of forms with multiplier, Shimura's theta law on `Γ₀(4)`, the group `Mp₂(ℤ)`
  and the Weil representation `ρ_L`. This layer imports them (three requests) and proves that its
  own multipliers are multiplier systems in that sense and agree with Shimura's convention.
- `MetaplecticAutomorphicForms:MP.8` owns the Jacobi group of the double cover of `GSp(4)` used by
  Bump–Friedberg–Hoffstein. The classical Jacobi forms on `SL(2, ℤ) ⋉ ℤ²` are this layer's; MP.8
  consumes them where its objects restrict to `SL(2, ℤ)`.
- The Tau Ceti ModularForms roadmap computes eta-quotient worked examples (`η²⁴ = Δ`, `η(z)²η(11z)²`,
  `η(z)³η(7z)³`, `η(z)η(23z)`) with Newman's integral-weight Dirichlet-character criterion. This layer
  supplies the general eta multiplier and eta-quotient theory those computations rest on and does
  not restate Newman's criterion.
- `QSeriesPartitionsAndMockModularForms:QM.0` owns the formal Jacobi triple product in
  `ℤ[a, a⁻¹][[x]]`; this layer proves the analytic identity for `|e^{πiτ}| < 1` independently.
- Appell–Lerch sums, `µ`, `µ̃`, indefinite theta functions and mock Jacobi forms are
  `QSeriesPartitionsAndMockModularForms:QM.4`'s; partition asymptotics and the Rademacher sum
  `A_k(n)` are `QSeriesPartitionsAndMockModularForms:QM.2`'s.

**Conventions (pinned).**
- `ℍ` is Mathlib's upper half-plane, `e(x) = e^{2πix}`, `q = e(τ)`, `ζ = e(z)`,
  `γ = (a b; c d) ∈ SL(2, ℤ)`, `j(γ, τ) = cτ + d` (Mathlib's `UpperHalfPlane.denom`).
- Every square root is Mathlib's principal branch: `w^{1/2} = exp(½ Log w)` with
  `arg w ∈ (−π, π]`, so `j(γ, τ)^{1/2}` has argument in `(−π/2, π/2]`. This is the convention of
  Savitt §2 and of MP.7.
- A multiplier `v` of a function `f` of weight `r` means `f(γτ) = v(γ) j(γ, τ)^r f(τ)`.
- `ϑ(τ) = jacobiTheta τ = Σ e^{πin²τ}` (weight 1/2 on the theta group); Shimura's
  `θ(τ) = Σ e^{2πin²τ} = ϑ(2τ)` (weight 1/2 on `Γ₀(4)`).
- `ϑ(z; τ)` is Zwegers' odd theta function; the classical `ϑ₁` used by Dabholkar–Murthy–Zagier is
  `−iϑ`.
- Jacobi forms are functions `φ(τ, z)` (DMZ's argument order), written `ℍ → ℂ → ℂ`.

### Dedekind sums

**Definition** (`dedekindSum`, node `QM.1/dedekind-sum`). For `h ∈ ℤ`, `k ∈ ℕ`,
`s(h, k) = Σ_{r=1}^{k−1} (r/k)(hr/k − ⌊hr/k⌋ − 1/2) ∈ ℚ` (Kong–Teo (6.1)); `s(h, 0) = s(h, 1) = 0`.
For `gcd(h, k) = 1` this is the classical `Σ_{r mod k} ((r/k))((hr/k))`. All theorems assume
`gcd(h, k) = 1`.

API: `dedekindSum_one_right` (`s(h, 1) = 0`), `dedekindSum_one_left`
(`s(1, k) = (k − 1)(k − 2)/(12k)`), `exists_int_eq_six_mul_dedekindSum` (`6k·s(h, k) ∈ ℤ`, the fact
that makes `e^{πi s(h,k)}` a root of unity in QM.2's Rademacher sums). Unit tests: `s(1, 3) = 1/18`;
`s(2, 5) = 0`; `s(3, 7) = −1/14` and `s(7, 3) = 1/18`; `s(h, 1) = 0`; `s(4, 9) = −4/27 ≠ 1/8 = s(9, 4)`
(non-example: `s` is not symmetric).

**Lemmas.**
- `QM.1/dedekind-sum-congr` (`dedekindSum_congr`): `h ≡ h′ (mod k) ⇒ s(h, k) = s(h′, k)`.
- `QM.1/dedekind-sum-neg` (`dedekindSum_neg`): `s(−h, k) = −s(h, k)` for `gcd(h, k) = 1`.
- `QM.1/sum-floor-mul-div` (`sum_floor_mul_div`): `Σ_{r=1}^{k−1} ⌊hr/k⌋ = (h − 1)(k − 1)/2`.
- `QM.1/sum-floor-mul-div-sq` (`sum_floor_mul_div_sq`):
  `Σ_{r=1}^{k−1} ⌊hr/k⌋² = 2h·s(k, h) + (2hk − 3h − k + 3)(h − 1)/6` (lattice-point count).

**Theorem** (Dedekind reciprocity, `dedekindSum_reciprocity`, node `QM.1/dedekind-reciprocity`).
For coprime `h, k ≥ 1`: `s(h, k) + s(k, h) = (h² + k² − 3hk + 1)/(12hk)` (Kong–Teo Theorem 6.5).
Acceptance: `s(4, 9) + s(9, 4) = −5/216`.

### The eta multiplier system

**Lemma** (`eta_add_int`, node `QM.1/eta-add-int`). `η(τ + m) = e^{πim/12}η(τ)` for `m ∈ ℤ`.

**Lemma** (`cpow_neg_I_mul_half_mul`, node `QM.1/cpow-neg-I-mul-half-mul`). For `x, y, xy ∈ ℍ`:
`(−ix)^{1/2}(−iy)^{1/2} = e^{−πi/4}(−ixy)^{1/2}`. This fills the branch step Kong–Teo assert without
proof.

**Definition** (`etaMultiplier`, node `QM.1/dedekind-eta-multiplier`). For `γ ∈ SL(2, ℤ)`:
- `c > 0`: `v_η(γ) = exp(πi[(a + d)/(12c) + s(−d, c) − 1/4])`;
- `c = 0, d = 1`: `v_η(T^b) = e^{πib/12}`; `c = 0, d = −1`: `v_η(−T^{−b}) = −i·e^{−πib/12}`;
- `c < 0`: `v_η(γ) = i·v_η(−γ)`.

It is normalised by `η(γτ) = v_η(γ)(cτ + d)^{1/2}η(τ)` with the principal branch; Kong–Teo's
factor `exp(πi[(a + d)/(12c) + s(−d, c)])` goes with `{−i(cτ + d)}^{1/2}` and differs by `e^{−πi/4}`.

API: `etaMultiplier_of_pos` (the `c > 0` formula), `etaMultiplier_T_zpow` (`v_η(Tⁿ) = e^{πin/12}`),
`etaMultiplier_S` (`e^{−πi/4}`), `etaMultiplier_neg_one` (`−i`), `etaMultiplier_neg_of_pos`
(`v_η(−γ) = i v_η(γ)` for `c > 0`), `norm_etaMultiplier` (`|v_η| = 1`), `etaMultiplier_pow_24`
(`v_η²⁴ = 1`), `etaMultiplier_mul_T` (`v_η(γT) = e^{πi/12}v_η(γ)`). Unit tests: `v_η(T) = e^{πi/12}`;
`v_η(S) = (√i)⁻¹`, the constant of Mathlib's `ModularForm.eta_comp_eq_csqrt_I_inv` (compatibility);
`v_η(−1) = −i` (degenerate); `v_η((1 0; 3 1)) = e^{−πi/4}` (the sign of the Dedekind sum: the other
sign gives `e^{−5πi/36}`, not a 24th root of unity); `v_η(Sγ) = −v_η(S)v_η(γ)` for
`γ = (−1 0; 1 −1)` (non-example: not a homomorphism); `v_η((2 1; 5 3)) = e^{−πi/6}`.

**Theorem** (Dedekind's functional equation for `c > 0`, `eta_transform_of_pos`, node
`QM.1/eta-transform-of-pos`). For `c > 0`:
`η(γτ) = exp(πi[(a + d)/(12c) + s(−d, c)]){−i(cτ + d)}^{1/2}η(τ)`, and
`ω(a, b, c, d) = (a + d)/c + 12s(−d, c)` is an integer. Proof: strong induction on `c` via
`γ = (u a; r c)·S·T^q` with `d = cq − r`, `0 < r < c`, using Dedekind reciprocity, the two
Dedekind-sum lemmas, `eta_add_int`, Mathlib's `S`-law and the branch lemma (Kong–Teo Theorem 7.1).

**Theorem** (the Dedekind eta transformation formula, `eta_transform`, node
`QM.1/eta-transformation-law`). For every `γ ∈ SL(2, ℤ)` and `τ ∈ ℍ`:
`η(γτ) = v_η(γ)(cτ + d)^{1/2}η(τ)`. Acceptance: for `γ = S` it is Mathlib's
`eta_comp_eq_csqrt_I_inv`; its 24th power is Mathlib's `discriminant_S_invariant` and
`discriminant_T_invariant`; the formula agrees numerically with `η(γτ)/((cτ + d)^{1/2}η(τ))` for
thirteen matrices of all sign patterns.

**Theorem** (`etaMultiplier_mul`, node `QM.1/eta-multiplier-is-multiplier-system`).
`v_η(γ₁γ₂)j(γ₁γ₂, τ)^{1/2} = v_η(γ₁)v_η(γ₂)j(γ₁, γ₂τ)^{1/2}j(γ₂, τ)^{1/2}`, i.e.
`v_η(γ₁γ₂) = σ(γ₁, γ₂)v_η(γ₁)v_η(γ₂)` with MP.7's sign cocycle, and `v_η(−1) = e^{−πi/2}`: `v_η` is a
multiplier system of weight 1/2 on `SL(2, ℤ)` in MP.7's sense.

**Cusps.** `QM.1/eta-product-tendsto-one` (`tendsto_cexp_mul_eta_atImInfty`):
`e^{−2πiτ/24}η(τ) → 1` at `i∞`. `QM.1/eta-at-every-cusp` (`tendsto_eta_slash_atImInfty`): for every
`σ ∈ SL(2, ℤ)`, `e^{−2πiτ/24}(cτ + d)^{−1/2}η(στ) → v_η(σ) ≠ 0`, so `η` has order exactly `1/24` at
every cusp.

**Theorem** (Savitt's Jacobi-symbol formula on `Γ₀(4)`, `etaMultiplier_of_mem_gamma0_four`, node
`QM.1/eta-multiplier-gamma0-four`). For `γ ∈ Γ₀(4)`: `v_η(γ) = (c/d)e^{πiE/12}` with
`E = ac(1 − d²) + d(b − c + 3) − 3` and the extended Jacobi symbol (`(c/d) = sgn(c)(c/|d|)` for
`d < 0`, `(0/±1) = 1`). It rests on `QM.1/gamma0-four-generation` (`gamma0_four_eq_closure`:
`Γ₀(4) = ⟨T, (1 0; 4 1), −1⟩`), Mathlib's Jacobi-symbol reciprocity and periodicity, and MP.7's
explicit cocycle. Acceptance: `v_η((1 0; 4 1)) = e^{−πi/3}`, `v_η(−1) = −i`.

### Eta quotients and their cusps

**Definition** (`gamma0Dilate`, node `QM.1/gamma0-dilate`). For `δ ∣ N`, the homomorphism
`Γ₀(N) → SL(2, ℤ)`, `γ ↦ γ_δ = (a, δb; c/δ, d)` (conjugation by `diag(δ, 1)`), with
`δ·(γτ) = γ_δ(δτ)` and `j(γ_δ, δτ) = j(γ, τ)`. API: `gamma0Dilate_apply`, `gamma0Dilate_smul`,
`denom_gamma0Dilate`. Unit tests: `γ_1 = γ`; `T_δ = T^δ`; for `γ = (1 0; 4 1)`,
`γ_2 = (1 0; 2 1)` (the transposed convention gives `(1 0; 8 1)`).

**Definition** (`etaQuotient`, node `QM.1/eta-quotient`). For `r : ℕ →₀ ℤ` on positive integers,
`η_r(τ) = ∏_δ η(δτ)^{r_δ}`, of weight `k = ½Σ r_δ`. API: `etaQuotient_add`, `etaQuotient_single`,
`etaQuotient_ne_zero`, `differentiableOn_etaQuotient`, `tendsto_etaQuotient_atImInfty` (order
`Σ δr_δ/24` at `∞`). Unit tests: `η_{24·[1]} = ` Mathlib's `ModularForm.discriminant`
(compatibility); `η(τ)η(11τ)` satisfies `f(τ + 1) = −f(τ)` (non-example); `η_0 = 1` (degenerate).

**Theorem** (`etaQuotient_transform`, node `QM.1/eta-quotient-transformation`). If every
`δ ∈ supp r` divides `N`, then for `γ ∈ Γ₀(N)`:
`η_r(γτ) = (∏_δ v_η(γ_δ)^{r_δ})·((cτ + d)^{1/2})^{2k}·η_r(τ)`, and `v_r = ∏_δ v_η(γ_δ)^{r_δ}` is a
multiplier system of weight `k` on `Γ₀(N)` (a character when `k ∈ ℤ`).

**Lemma** (`eta_dilate_slash`, node `QM.1/eta-dilate-slash`). For `δ ≥ 1` and `σ ∈ SL(2, ℤ)`, with
`A = gcd(c, δ)`, `D = δ/A`, there are `σ′ ∈ SL(2, ℤ)` and `0 ≤ B < D` with
`diag(δ, 1)σ = σ′(A B; 0 D)` and `η(δστ) = v_η(σ′)D^{−1/2}(cτ + d)^{1/2}η((Aτ + B)/D)`.

**Theorem** (Ligozat's cusp-order formula, `etaQuotient_slash_tendsto`, node
`QM.1/ligozat-cusp-order`). For `σ ∈ SL(2, ℤ)` with lower-left entry `c`, `η_r` has order exactly
`ρ_σ(r) = (1/24)Σ_δ r_δ gcd(c, δ)²/δ` at the cusp `σ∞`: `e^{−2πiρτ}((cτ + d)^{1/2})^{−2k}η_r(στ)`
tends to a nonzero constant. On `Γ₀(N)` the cusp `a/c` has width `N/gcd(c², N)`, and the order in the
local parameter is `(N/24)Σ_δ gcd(c, δ)²r_δ/(gcd(c, N/c)·c·δ)` for `c ∣ N`. Acceptance: Shimura's
`θ` has orders `0, 0, 1/4` at the cusps `∞, 0, 1/2` of `Γ₀(4)`; `η(τ)²η(11τ)²` has orders `1` at `∞`
and `1/11` (local order 1, width 11) at `0`.

**Theorem** (`jacobiTheta_two_mul_eq_etaQuotient`, node `QM.1/theta-eta-quotient`).
`θ(τ) = Σ q^{n²} = η(2τ)⁵/(η(τ)²η(4τ)²)`, from the analytic triple product.

**Theorem** (`etaQuotient_theta_multiplier_eq_shimura`, node
`QM.1/theta-eta-multiplier-matches-shimura`). For `γ ∈ Γ₀(4)`:
`v_η(γ_1)^{−2}v_η(γ_2)^{5}v_η(γ_4)^{−2} = (c/d)ε_d^{−1}` (`ε_d = 1` or `i` as `d ≡ 1` or `3 mod 4`):
the half-integral multiplier QM.1 produces for `θ` is exactly MP.7's theta multiplier. Acceptance:
at `γ = (1 0; 4 1)` both sides are `1`; at `γ = −1` both are `−i`.

### The theta group and the multiplier of `jacobiTheta`

**Definition** (`thetaGroup`, node `QM.1/theta-group`).
`Γ_θ = {γ ∈ SL(2, ℤ) : a ≡ d, b ≡ c (mod 2)}` (matrices `≡ 1` or `S` mod 2). API:
`mem_thetaGroup_iff`, `S_mem_thetaGroup`, `T_sq_mem_thetaGroup`, `T_notMem_thetaGroup`,
`Gamma_two_le_thetaGroup` (Mathlib's `Γ(2) ≤ Γ_θ`), `thetaGroup_index` (index 3),
`thetaGroup_eq_closure` (`Γ_θ = ⟨S, T²⟩`). Unit tests: `S, T², −1 ∈ Γ_θ`; `T, ST ∉ Γ_θ`
(non-example); index 3 while `S ∉ Γ₀(2)` (so `Γ_θ` is not Mathlib's `Γ₀(2)`).

**Lemmas.** `QM.1/theta-group-gamma-two` (`mem_thetaGroup_iff_Gamma_two`): `Γ_θ = Γ(2) ⊔ Γ(2)S`.
`QM.1/theta-group-cosets` (`thetaGroup_right_cosets`): `σ ∈ Γ_θT^ℤ` iff `a + c` is odd, and
`σ ∈ Γ_θ(TS)T^ℤ` iff `a, c` are both odd; so `Γ_θ` has the two cusp classes `∞` (width 2) and `1`
(width 1).

**Definition** (`thetaMultiplier`, node `QM.1/theta-multiplier`).
`v_θ(γ) = ϑ(γi)/((ci + d)^{1/2}ϑ(i))` (`ϑ(i) > 0`); on `Γ_θ` it is the multiplier of `ϑ`. API:
`thetaMultiplier_S` (`e^{−πi/4}`), `thetaMultiplier_T_sq` (`1`), `thetaMultiplier_neg_one` (`−i`),
`thetaMultiplier_pow_eight`. Unit tests: `v_θ(S) = e^{−πi/4}`, agreeing with Mathlib's
`jacobiTheta_S_smul` (compatibility); `v_θ((3 2; 4 3)) = i`; `v_θ(T²) = 1 ≠ e^{πi/6} = v_η(T²)`
(non-example: `v_θ` is not the restriction of `v_η`).

**Lemma** (`jacobiTheta_transform_Gamma_two`, node `QM.1/theta-gamma-two-transformation`). For
`γ ∈ Γ(2)`: `ϑ(γτ) = (2c/d)ε_d^{−1}(cτ + d)^{1/2}ϑ(τ)`, from MP.7's Shimura law by `ϑ(τ) = θ(τ/2)`
and `γτ/2 = (a, b/2; 2c, d)(τ/2)`.

**Theorem** (the theta transformation law on the theta group, `jacobiTheta_transform`, node
`QM.1/theta-transformation-theta-group`). For `γ ∈ Γ_θ`: `ϑ(γτ) = v_θ(γ)(cτ + d)^{1/2}ϑ(τ)`.
`QM.1/theta-multiplier-is-multiplier-system` (`thetaMultiplier_mul`): `v_θ` is a multiplier system
of weight 1/2 on `Γ_θ`.

**Cusps and zeros.** `QM.1/jacobi-theta-nonvanishing` (`jacobiTheta_ne_zero`): `ϑ` has no zeros in
`ℍ`. `QM.1/theta-TS-slash` (`jacobiTheta_TS_slash`):
`τ^{−1/2}ϑ(1 − 1/τ) = e^{−πi/4}e^{πiτ/4}jacobiTheta₂(τ/2, τ)`. `QM.1/theta-half-period-limit`
(`tendsto_jacobiTheta₂_half_atImInfty`): `jacobiTheta₂(τ/2, τ) → 2`. **Theorem**
(`jacobiTheta_slash_tendsto`, node `QM.1/theta-at-every-cusp`): for `a + c` odd,
`(cτ + d)^{−1/2}ϑ(στ)` tends to a nonzero constant (order 0); for `a, c` odd,
`e^{−πiτ/4}(cτ + d)^{−1/2}ϑ(στ)` does (order `1/8`, width 1). This is the whole divisor of `ϑ` on
`Γ_θ\ℍ*`, matching the valence count `(1/2)·3/12 = 1/8`.

### Fourier expansions and the Jacobi triple product

**Lemma** (`hasSum_fourier_of_periodic`, node `QM.1/periodic-holomorphic-fourier-expansion`). A
holomorphic 1-periodic `f` on `{Im z > y₀}` equals `Σ aₙe(nz)` with
`aₙ = ∫₀¹ f(x + iy)e(−n(x + iy))dx` for any `y > y₀`, absolutely and locally uniformly; `f` is
determined by `(aₙ)`. Proof: Cauchy–Goursat on rectangles, two integrations by parts, Mathlib's
pointwise convergence of Fourier series with summable coefficients.

**Theorem** (the analytic Jacobi triple product, `jacobiTheta₂_eq_tprod`, node
`QM.1/jacobi-triple-product-analytic`). For `τ ∈ ℍ`, `z ∈ ℂ`:
`jacobiTheta₂(z, τ) = ∏_{n≥1}(1 − e^{2πinτ})(1 + e^{πi(2n−1)τ}e^{2πiz})(1 + e^{πi(2n−1)τ}e^{−2πiz})`.
Proof as Kong–Teo Theorem 3.1: quasi-periodicity pins the Fourier coefficients up to `a₀(τ)`, and
`a₀(w⁴) = a₀(w)` with continuity at `w = 0` gives `a₀ = 1`.

### The Jacobi theta function `ϑ(z; τ)`

**Definition** (`oddJacobiTheta`, node `QM.1/jacobi-theta-function`).
`ϑ(z; τ) = Σ_{ν ∈ 1/2 + ℤ} e^{πiν²τ + 2πiν(z + 1/2)} = e^{πiτ/4 + πi(z+1/2)}jacobiTheta₂(z + 1/2 + τ/2, τ)`.
API: `oddJacobiTheta_eq_jacobiTheta₂`, `oddJacobiTheta_neg` (odd), `differentiableOn_oddJacobiTheta`,
`oddJacobiTheta_add_one_right` (`ϑ(z; τ + 1) = e^{πi/4}ϑ(z; τ)`), `oddJacobiTheta_S`
(`ϑ(z/τ; −1/τ) = −i(−iτ)^{1/2}e^{πiz²/τ}ϑ(z; τ)`). Unit tests: `ϑ(0; τ) = 0` (degenerate);
`ϑ(1/2; τ) = −e^{πiτ/4}jacobiTheta₂(τ/2, τ)` (compatibility with Mathlib); `e^{−πiτ/4}ϑ(z; τ) → −2 sin(πz)`
(normalisation); `ϑ(−1/4; i) ≠ ϑ(1/4; i)` (non-example: not even).

**Results** (Zwegers Proposition 1.3):
- `QM.1/jacobi-theta-elliptic` (`oddJacobiTheta_add_int_mul_add_int`):
  `ϑ(z + lτ + μ) = (−1)^{l+μ}e^{−πil²τ − 2πilz}ϑ(z)`;
- `QM.1/jacobi-theta-triple-product` (`oddJacobiTheta_eq_tprod`):
  `ϑ(z; τ) = −iq^{1/8}ζ^{−1/2}∏_{n≥1}(1 − qⁿ)(1 − ζq^{n−1})(1 − ζ^{−1}qⁿ)`;
- `QM.1/jacobi-theta-derivative` (`deriv_oddJacobiTheta_zero`): `ϑ′(0; τ) = −2πη(τ)³`;
- `QM.1/jacobi-theta-zeros` (`oddJacobiTheta_eq_zero_iff`): zeros exactly `ℤτ + ℤ`, all simple;
- `QM.1/jacobi-theta-uniqueness` (`oddJacobiTheta_unique`): an entire `f` with `f(z + 1) = −f(z)`
  and `f(z + τ) = −e^{−πiτ−2πiz}f(z)` is a multiple of `ϑ(·; τ)`.

**Theorem** (`oddJacobiTheta_transform`, node `QM.1/jacobi-theta-transformation`). For every
`γ ∈ SL(2, ℤ)`: `ϑ(z/(cτ + d); γτ) = v_η(γ)³(cτ + d)^{1/2}e^{πicz²/(cτ+d)}ϑ(z; τ)`. Proof: the
left side, times `e^{−πicz²/(cτ+d)}`, has the elliptic laws of `ϑ(·; τ)`, so it is `C(γ, τ)ϑ(z; τ)`;
differentiating at `z = 0` gives `C = η(γτ)³/((cτ + d)η(τ)³) = v_η(γ)³(cτ + d)^{1/2}`. This is the
multiplier `v(γ)³` whose inverse appears in Zwegers' Theorem 1.11 for `µ̃`.

### Jacobi forms

**Definition** (`jacobiModularSlash`, node `QM.1/jacobi-modular-slash`). For `k, m ∈ ½ℤ`:
`(φ|_{k,m}γ)(τ, z) = (cτ + d)^{−k}e(−mcz²/(cτ + d))φ(γτ, z/(cτ + d))`. API:
`jacobiModularSlash_mul` (right action for `k ∈ ℤ`), `jacobiModularSlash_one`,
`jacobiModularSlash_neg_one` (`φ|(−1)(τ, z) = (−1)^kφ(τ, −z)`), `jacobiModularSlash_index_zero` (index
0 is Mathlib's weight-`k` slash). Unit tests: `φ|T(τ, z) = φ(τ + 1, z)`;
`φ|S(τ, z) = τ^{−k}e(−mz²/τ)φ(−1/τ, z/τ)`; index-0 compatibility with Mathlib's `SlashAction`.

**Definition** (`jacobiEllipticSlash`, node `QM.1/jacobi-elliptic-slash`).
`(φ|_m[l, μ])(τ, z) = e(m(l²τ + 2lz))φ(τ, z + lτ + μ)`, an action of `ℤ²` for `2m ∈ ℤ`. API:
`jacobiEllipticSlash_add`, `jacobiEllipticSlash_zero`. Unit tests: `φ|_m[0, μ](τ, z) = φ(τ, z + μ)`;
`ϑ|_{1/2}[l, μ] = (−1)^{l+μ}ϑ`; index 0 is translation.

**Lemma** (`jacobiModularSlash_jacobiEllipticSlash`, node `QM.1/jacobi-group-law`).
`(φ|_mX)|_{k,m}γ = (φ|_{k,m}γ)|_m(Xγ)` for `X = (l, μ)`: the two actions assemble to an action of the
Jacobi group `SL(2, ℤ) ⋉ ℤ²` with `(γ, X)(γ′, X′) = (γγ′, Xγ′ + X′)`.

**Definition** (`JacobiForm`, node `QM.1/jacobi-form`). For `k, m ∈ ½ℤ`, a multiplier system `v` of
weight `k` on `SL(2, ℤ)` (MP.7) and a character `χ` of `ℤ²`, `J_{k,m}(v, χ)` is the space of
holomorphic `φ` on `ℍ × ℂ` with `φ|_{k,m}γ = v(γ)φ`, `φ|_m[l, μ] = χ(l, μ)φ`, and
`e(mα²τ)φ(τ, ατ + β)` bounded at `i∞` for all `α, β ∈ ℚ`. The Eichler–Zagier space is
`J_{k,m} = J_{k,m}(1, 1)` (`k ∈ ℤ`, `m ∈ ℕ`). The growth condition is DMZ's characterisation by
torsion points; the Fourier condition `c(n, r) = 0` unless `4nm ≥ r²` is a theorem. API:
`mul_mem_JacobiForm`, `modularForm_smul_mem_JacobiForm`, `mem_JacobiForm_index_zero_iff`
(`J_{k,0} ≅ M_k(SL(2, ℤ))`). Unit tests: `J_{k,1} = 0` for odd `k`; `1 ∈ J_{0,0}`;
`φ_{−2,1} ∉ J_{−2,1}` (non-example); `J_{−2,1} = 0`.

**Variants.**
- `JacobiCuspForm` (node `QM.1/jacobi-cusp-form`): the torsion-point functions tend to 0. API:
  `JacobiCuspForm_le_JacobiForm`, `mem_JacobiCuspForm_iff_fourierCoeff` (`c(n, r) = 0` unless
  `4nm > r²`). Unit tests: `ϑ` is not a cusp form; `0` is; the constant `1` is not.
- `WeakJacobiForm` (node `QM.1/weak-jacobi-form`): `φ(τ, z)` bounded at `i∞` for each fixed `z`.
  API: `JacobiForm_le_WeakJacobiForm`, `mem_WeakJacobiForm_iff_fourierCoeff` (`c(n, r) = 0` unless
  `n ≥ 0`). Unit tests: `φ_{−2,1} ∈ J̃_{−2,1}`; `φ_{−2,1}/Δ ∉ J̃_{−14,1}`; `E₄ ∈ J̃_{4,0}`.
- `WeaklyHolomorphicJacobiForm` (node `QM.1/weakly-holomorphic-jacobi-form`): `e(Nτ)φ(τ, z)` bounded
  for some `N`. API: `WeakJacobiForm_le_WeaklyHolomorphicJacobiForm`,
  `exists_discriminant_pow_mul_mem_WeakJacobiForm`. Unit tests: `φ_{−2,1}/Δ ∈ J^!_{−14,1}`;
  `1/Δ ∈ J^!_{−12,0}`; `exp(E₄³/Δ) ∉ J^!_{0,0}`.

**Definition** (`jacobiFourierCoeff`, node `QM.1/jacobi-fourier-coefficient`).
`c_φ(n, r) = ∫₀¹∫₀¹ φ(x + i, u)e(−n(x + i) − ru) du dx`. API: `eq_of_jacobiFourierCoeff_eq`,
`jacobiFourierCoeff_neg` (`c(n, −r) = (−1)^kc(n, r)`). Unit tests: the coefficients of `φ_{−2,1}`;
the constant `1`; a monomial `qⁿζ^r`.

**Lemmas and theorems.**
- `QM.1/jacobi-fourier-expansion` (`hasSum_jacobiFourierCoeff`): a holomorphic function 1-periodic in
  `τ` and `z` is `Σ c(n, r)qⁿζ^r`, absolutely.
- `QM.1/jacobi-coefficient-discriminant` (`jacobiFourierCoeff_eq_of_discriminant`): for
  `φ ∈ J^!_{k,m}`, `c(n, r) = C(4nm − r², r mod 2m)` (DMZ (4.4)).
- `QM.1/jacobi-fourier-support` (`mem_JacobiForm_iff_fourierCoeff`): for `φ ∈ J^!_{k,m}`,
  `φ ∈ J_{k,m}` iff `c(n, r) = 0` whenever `4nm < r²` (DMZ (4.5)).
- `QM.1/jacobi-form-restriction-zero` (`exists_modularForm_eq_jacobiForm_zero`): `φ(τ, 0)` is a
  modular form of weight `k` (Mathlib's `ModularForm`).

### Theta decomposition

**Definition** (`jacobiThetaIndex`, node `QM.1/jacobi-theta-index`).
`ϑ_{m,μ}(τ, z) = Σ_{r ≡ μ (2m)} q^{r²/4m}ζ^r = e(μ²τ/4m + μz)jacobiTheta₂(2mz + μτ, 2mτ)`. API:
`jacobiThetaIndex_eq_jacobiTheta₂`, `jacobiThetaIndex_add`, `jacobiThetaIndex_T`,
`jacobiEllipticSlash_jacobiThetaIndex`. Unit tests: `ϑ_{1,0}(τ, 0) = jacobiTheta(2τ)`;
`e(−τ/4)ϑ_{1,1}(τ, z) → ζ + ζ^{−1}`; `ϑ_{1,0}` alone is not an `S`-eigenfunction (non-example).

**Lemmas.** `QM.1/theta-index-S` (`jacobiThetaIndex_S`):
`ϑ_{m,μ}(−1/τ, z/τ) = (τ/2mi)^{1/2}e(mz²/τ)Σ_{ν mod 2m} e(−μν/2m)ϑ_{m,ν}(τ, z)` (Poisson summation
through Mathlib's `jacobiTheta₂_functional_equation`). `QM.1/theta-index-linear-independence`
(`jacobiThetaIndex_linearIndependent`).

**Definition** (`thetaDecompositionCoeff`, node `QM.1/theta-decomposition-coefficient`).
`h_μ(τ) = e(−μ²τ/4m)∫₀¹φ(τ, u)e(−μu)du`. API: `thetaDecompositionCoeff_add`,
`differentiableOn_thetaDecompositionCoeff`, `thetaDecompositionCoeff_eq_tsum`
(`h_μ = Σ_Δ C(Δ, μ)q^{Δ/4m}`). Unit tests: for `φ = ϑ_{m,ν}`, `h_μ = δ_{μν}`; for `φ_{−2,1}`,
`e(τ/4)h_1 → 1` and `h_0 → −2`; for `ϑ_{2,1}`, `h_1 = 1` (the normalisation `e(−μ²τ/4m)`).

**Theorem** (theta decomposition, `eq_sum_thetaDecompositionCoeff_mul`, node
`QM.1/theta-decomposition`). If `z ↦ φ(τ, z)` is entire and `φ` has the index-`m` elliptic law,
then `φ = Σ_{μ mod 2m} h_μϑ_{m,μ}`, with unique coefficients (Zwegers Theorem 3.1).

**Theorem** (`thetaDecompositionCoeff_transform`, node `QM.1/theta-decomposition-transformation`).
Under the weight-`k` modular law: `h_μ(τ + 1) = e(−μ²/4m)h_μ(τ)` and
`h_μ(−1/τ) = τ^k(−iτ)^{−1/2}(2m)^{−1/2}Σ_ν e(μν/2m)h_ν(τ)` (Zwegers (3.3), (3.4)).

**Theorem** (`mem_JacobiForm_iff_thetaDecompositionCoeff`, node `QM.1/theta-decomposition-growth`).
`φ ∈ J_{k,m}` iff all `h_μ` are bounded; `φ ∈ J⁰_{k,m}` iff all `h_μ → 0`; `φ ∈ J̃_{k,m}` iff
`h_μ = O(e^{2π Im τ·μ̄²/4m})` with `μ̄` the least representative.

**Theorem** (`jacobiModularSlash_sum_thetaIndex`, node `QM.1/theta-decomposition-converse`). Holomorphic
`h_μ` with the `T`- and `S`-laws give `Σ h_μϑ_{m,μ}` invariant under all of `SL(2, ℤ)` (generation
by `S` and `T`) and under `ℤ²`; hence `J_{k,m}` and `J^!_{k,m}` are isomorphic to the corresponding
spaces of vector-valued forms.

**Comparison** (node `QM.1/theta-decomposition-weil-representation`). The vector
`Σ h_μe_μ ∈ ℂ[ℤ/2m]` is a vector-valued modular form of weight `k − 1/2` for the Weil representation
`ρ_{L(−1)}` of `Mp₂(ℤ)`, `L = (ℤ, mx²)` (the dual Weil representation), in MP.7's convention:
`J_{k,m} ≅ M_{k−1/2}(ρ_{L(−1)})`. It is stated against MP.7's `Mp₂(ℤ)` and `ρ_L`.

### Examples

**Theorem** (`oddJacobiTheta_mem_JacobiForm`, node `QM.1/jacobi-theta-is-jacobi-form`).
`ϑ ∈ J_{1/2,1/2}(v_η³, (−1)^{l+μ})`, and `ϑ` is not a cusp form (all its terms have discriminant 0).

**Definition** (`phiMinusTwoOne`, node `QM.1/phi-minus-two-one`). `φ_{−2,1} = −ϑ(z; τ)²/η(τ)⁶`
(`= ϑ₁²/η⁶`, DMZ (4.29)) `= (ζ − 2 + ζ^{−1}) + (−2ζ² + 8ζ − 12 + 8ζ^{−1} − 2ζ^{−2})q + O(q²)`. API:
`phiMinusTwoOne_neg` (even), `phiMinusTwoOne_eq_zero_iff` (zeros `ℤτ + ℤ`),
`iteratedDeriv_two_phiMinusTwoOne_zero` (`∂_z²φ_{−2,1}(τ, 0) = −8π²`). Unit tests:
`c(0, 1) = 1, c(0, 0) = −2, c(1, 0) = −12, c(1, 1) = 8, c(2, 0) = −56` (DMZ Table 1);
`φ_{−2,1} → ζ − 2 + ζ^{−1}`; `+ϑ²/η⁶` has `c(0, 1) = −1` (non-example fixing the sign);
`φ_{−2,1}(τ, 0) = 0`.

**Theorem** (`phiMinusTwoOne_mem_WeakJacobiForm`, node `QM.1/phi-minus-two-one-weak`).
`φ_{−2,1} ∈ J̃_{−2,1}` and `φ_{−2,1} ∉ J_{−2,1}`.

### Dependencies

- Inside this roadmap: none from `QSeriesPartitionsAndMockModularForms:QM.0` is consumed (the
  analytic triple product is proved here); `QSeriesPartitionsAndMockModularForms:QM.2` consumes the
  Dedekind sums and the eta transformation formula; `QSeriesPartitionsAndMockModularForms:QM.4`
  consumes `ϑ(z; τ)`, its multiplier `v_η³`, Jacobi forms and the theta decomposition;
  `QSeriesPartitionsAndMockModularForms:QM.6` consumes eta quotients and their cusp orders.
- Other roadmaps: `MetaplecticAutomorphicForms:MP.7` (half-integral-weight automorphy factor, sign
  cocycle and multiplier systems; Shimura's theta law on `Γ₀(4)`; `Mp₂(ℤ)` and `ρ_L`).

### Acceptance tests

- `v_η(S) = (√i)⁻¹` recovers Mathlib's `eta_comp_eq_csqrt_I_inv`; `v_η²⁴ = 1` recovers
  `discriminant_S_invariant` and `discriminant_T_invariant`.
- `v_η((1 0; 3 1)) = e^{−πi/4}`, `v_η((2 1; 5 3)) = e^{−πi/6}`, `v_η((−1 0; 1 −1)) = e^{−5πi/12}`,
  each equal to `η(γτ)/((cτ + d)^{1/2}η(τ))`.
- Savitt's formula gives `v_η((1 0; 4 1)) = e^{−πi/3}`, matching the Dedekind-sum formula.
- The eta-quotient multiplier of `θ = η(2τ)⁵/(η(τ)²η(4τ)²)` equals Shimura's `(c/d)ε_d^{−1}` on
  `Γ₀(4)`: QM.1's half-integral multipliers match MP.7's convention.
- `θ` has orders `0, 0, 1/4` at the cusps `∞, 0, 1/2` of `Γ₀(4)`; `jacobiTheta` has orders `0` and
  `1/8` at the two cusps of `Γ_θ`; `η` has order `1/24` at every cusp: the cusp behaviour of theta
  and eta is verified at every cusp.
- `v_θ((3 2; 4 3)) = i` and `v_θ(S) = e^{−πi/4}`.
- `ϑ(z; τ)` satisfies Zwegers' Proposition 1.3 (1)–(10), and its multiplier is `v_η³`.
- `φ_{−2,1}` has DMZ's Table 1 coefficients, lies in `J̃_{−2,1}` and not in `J_{−2,1}`; its theta
  coefficients satisfy the weight `−5/2` laws of the theta decomposition.

---

## QM.2 Partition asymptotics and exact formulas

This layer proves Rademacher's exact formula for the partition function p(n), with every analytic
input built: the partition generating function on the unit disc and its transformation law near
each root of unity (from the eta multiplier of QM.1), Ford circles and the Rademacher path over
the Farey sequence of ClassicalArithmeticCompletion CA.2, the Bessel functions I_ν and J_ν with
Laplace's vertical-line integral for 1/Γ, and Rademacher's Kloosterman sum A_k(n) of the eta
multiplier system with the trivial bound and Lehmer's multiplication theorems. From the exact
formula it derives, with explicit constants, the effective remainder bound for truncations, the
certified evaluation of p(n) as the nearest integer to a truncated sum, the Hardy–Ramanujan
asymptotic p(n) ~ e^{π√(2n/3)}/(4√3 n), and Hardy and Ramanujan's truncated formula with error
O(n^{−1/4}). The infinite identity and its finite truncations are separate theorems: equality
of p(n) with the convergent series is one statement; the facts that a truncation lies within an
explicit distance of p(n), and that p(n) is then the nearest integer, are others.

Sources: Z.-Y. Kong and L.-P. Teo, *Rademacher's formula for the partition function*
(arXiv:2302.03835v1), a complete exposition of the proof in Apostol's form (§§2–4); G. H. Hardy
and S. Ramanujan, *Asymptotic formulæ in combinatory analysis*, Proc. London Math. Soc. (2) 17
(1918), read in the retypeset *Collected Papers*, Paper 36 (§1, the main theorem (1.71)–(1.75)
and the tables); H. Rademacher, *Fourier expansions of modular forms and problems of
partition*, Bull. AMS 46 (1940) 59–73; D. H. Lehmer, *On the series for the partition
function*, Trans. AMS 43 (1938) 271–295 (§§1–2), and *On the remainders and convergence of the
series for the partition function*, Trans. AMS 46 (1939) 362–373; A. L. Whiteman, *A sum
connected with the series for the partition function*, Pacific J. Math. 6 (1956) 159–176;
W. de Azevedo Pribitkin and B. Williams, *Short proof of Rademacher's formula for partitions*
(arXiv:1801.06244v3); the NIST DLMF, Chapter 10 (Bessel functions).

### What Mathlib and Tau Ceti already provide (consume; never restate)

- **Partitions.** `Nat.Partition n` with its `Fintype` instance, so p(n) = `Fintype.card
  (Nat.Partition n)`; the formal generating function `Nat.Partition.genFun f` with the product
  formula `Nat.Partition.hasProd_genFun` in R⟦X⟧.
- **Eta.** `ModularForm.eta` (η(z) = q^{1/24}∏(1 − q^{n+1})), `ModularForm.eta_q_eq_pow`,
  `ModularForm.eta_ne_zero`, `ModularForm.multipliable_one_sub_pow`; products:
  `tprod_one_add_ne_zero_of_summable`, `hasSum_geometric_of_norm_lt_one`.
- **Special functions.** `Complex.Gamma` with `Complex.Gamma_add_one`, `Real.Gamma_one_half_eq`,
  `Complex.integral_cpow_mul_exp_neg_mul_Ioi` (the Laplace transform of t^{a−1} at real r > 0);
  the regularized hypergeometric function `Complex.regularizedHGFun a b` with its coefficients
  `Complex.regularizedHGFunCoeff` and `Complex.radius_regularizedHGFunSeries_eq_top` (infinite
  radius when card a ≤ card b), which contains the Bessel functions as its ₀F̃₁ case but names none.
- **Analysis.** Fourier inversion `MeasureTheory.Integrable.fourierInv_fourier_eq`; the identity
  theorem `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`;
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; Cauchy's mean value theorem
  `exists_ratio_hasDerivAt_eq_ratio_slope`; Jordan's inequality `Real.mul_le_sin`;
  `Real.summable_nat_rpow_inv`, `AntitoneOn.sum_le_integral`, `Asymptotics.IsEquivalent`;
  the half-planes `convex_halfSpace_re_gt`, `convex_halfSpace_im_gt`, `Complex.isOpen_re_gt`,
  `UpperHalfPlane.isOpen_upperHalfPlaneSet`.
- **Contour integration (Tau Ceti).** `TauCeti.Contour.IsPiecewiseC1On` and Cauchy's theorem on
  a star-shaped open set `TauCeti.Contour.cauchyTheorem_starConvex` (∫ γ′·f∘γ = 0 for a closed
  piecewise-C¹ curve).
- **Arithmetic.** `Nat.totient` with `Nat.totient_le`, `jacobiSym` with
  `jacobiSym.quadratic_reciprocity`, `ZMod.chineseRemainder`.

Neither library has an asymptotic for p(n), a Bessel function, a Kloosterman sum of any kind, a
Dedekind sum, a Ford circle, or anything on the Rademacher series.

### Conventions

- **p(n)** is `Fintype.card (Nat.Partition n)`, p(0) = 1. F(x) = Σ_{n≥0} p(n)xⁿ is the
  *analytic* generating function on |x| < 1; the formal series is Mathlib's
  `Nat.Partition.genFun (fun _ _ ↦ 1)`.
- **Powers and roots** are Mathlib's principal complex powers (`Complex.cpow`, arg ∈ (−π, π]);
  z^{1/2} and (z/k)^{1/2} are only used with Re z > 0.
- **Dedekind sums** are QM.1's: s(h, k) = Σ_{r=1}^{k−1} (r/k)((hr/k)) with ((x)) = x − ⌊x⌋ − 1/2
  for x ∉ ℤ and ((x)) = 0 for x ∈ ℤ, s(h, 1) = 0. The eta law is used in the form: for
  ad − bc = 1 and c > 0, η((aτ + b)/(cτ + d)) = exp(πi((a + d)/(12c) + s(−d, c)))(−i(cτ + d))^{1/2}η(τ).
- **Rademacher's notation.** λ_n = √(n − 1/24), α(n) = π√(2/3)·λ_n = (π/6)√(24n − 1) (Lehmer's μ),
  u = α(n)/k. ω_{h,k} = exp(πi s(h, k)), and A_k(n) = Σ_{h mod k, (h,k)=1} ω_{h,k}e^{−2πinh/k}.
- **Model circle** K = {w : |w − 1/2| = 1/2}; the local coordinate at the Ford circle C(h, k) is
  w = −ik²(τ − h/k), i.e. τ = h/k + iw/k².
- **Farey sequences** are CA.2's F_N (fractions in [0, 1] with denominator ≤ N, both endpoints
  included), extended periodically when an arc needs the right neighbour of 1/1, which is (N + 1)/N.

### 2A. The partition generating function

- **`partitionGenFun`** (definition, `partition-generating-function`; Kong–Teo Lemma 3.2,
  Hardy–Ramanujan (1.11)). F(x) = Σ p(n)xⁿ. For |x| < 1 the series converges absolutely,
  F(x) = ∏_{m≥1}(1 − xᵐ)⁻¹ (HasProd), F(x) ≠ 0, F is holomorphic on the unit disc, |F(x)| ≤ F(|x|),
  and F is real, ≥ 1 and strictly increasing on [0, 1). API: `hasSum_partitionGenFun`,
  `summable_norm_partitionGenFun`, `hasProd_partitionGenFun`,
  `partitionGenFun_mul_tprod_one_sub_pow`, `partitionGenFun_ne_zero`,
  `differentiableOn_partitionGenFun`, `norm_partitionGenFun_le`,
  `partitionGenFun_ofReal_strictMonoOn`, `partitionGenFun_zero`, `coeff_genFun_one_eq_card` (the
  coefficients of Mathlib's formal genFun with f = 1 are the p(n)). Unit tests:
  `partitionGenFun_zero` (F(0) = 1), `card_partition_seven` (p(7) = 15), `coeff_genFun_one_eq_card`,
  `card_partition_four_ne_compositions` (p(4) = 5, not the 8 compositions).
- **Monotonicity** (`partition-count-monotone`): p(m) ≤ p(m + 1) (add a part 1), hence
  p(m) ≤ p(24m − 1) for m ≥ 1. Strictness fails at m = 0.
- **Eta** (`partition-generating-function-eq-eta`): for Im τ > 0,
  F(e^{2πiτ})·η(τ) = e^{πiτ/12}, with Mathlib's η.
- **Transformation law** (`partition-generating-function-transformation`; Kong–Teo Theorem 3.3,
  Rademacher 1940 (6)). For k ≥ 1, gcd(h, k) = 1, hH ≡ −1 (mod k) and Re z > 0:
  F(exp(2πih/k − 2πz/k²)) = e^{πi s(h,k)}(z/k)^{1/2} exp(π/(12z) − πz/(12k²)) F(exp(2πiH/k − 2π/z)).
  It is the eta law at (H, −K; k, −h) with kK − hH = 1, applied at τ = h/k + iz/k².

### 2B. Ford circles and the Rademacher path

- **`fordCircle`** (definition, `ford-circle`; Kong–Teo §2.3). For q = h/k in lowest terms,
  C(q) is the circle of centre h/k + i/(2k²) and radius 1/(2k²); it touches ℝ at h/k and otherwise
  lies in the upper half-plane. API: `fordCircle_eq_sphere`, `mem_fordCircle_iff`,
  `coe_mem_fordCircle`, `im_pos_of_mem_fordCircle`, `fordCircle_add_intCast` (C(q + m) = C(q) + m),
  `fordCircle_tangent_or_disjoint`. Unit tests: `fordCircle_zero_eq` (C(0): centre i/2, radius
  1/2), `fordCircle_half_mem` (2/5 + i/5 lies on C(0) and C(1/2)), `fordCircle_intCast`,
  `fordCircle_third_twoThirds_disjoint` (determinant 3: disjoint).
- **Tangent or disjoint** (`ford-circles-tangent-or-disjoint`; Kong–Teo Theorem 2.10). Distinct
  Ford circles C(a/b), C(c/d) are tangent iff |bc − ad| = 1 and disjoint otherwise
  (D² − S² = ((bc − ad)² − 1)/(b²d²)); consecutive Farey fractions give tangent circles by CA.2's
  neighbour property.
- **Tangency points** (`ford-circle-tangency-point`; Kong–Teo Theorem 2.11). With hk₁ − kh₁ = 1
  and kh₂ − hk₂ = 1: α₁ = h/k − k₁/(k(k² + k₁²)) + i/(k² + k₁²) and
  α₂ = h/k + k₂/(k(k² + k₂²)) + i/(k² + k₂²).
- **Local coordinate** (`ford-circle-local-coordinate`; Kong–Teo Theorem 2.13). w = −ik²(τ − h/k)
  maps C(h, k) onto K, α₁ ↦ w₁ = k²/(k² + k₁²) + ikk₁/(k² + k₁²), α₂ ↦ w₂ = k²/(k² + k₂²) − ikk₂/(k² + k₂²),
  and the upper arc onto the clockwise arc of K from w₁ to w₂ avoiding 0.
- **Inversion** (`rademacher-circle-inversion`; Kong–Teo Proposition 2.14). On K ∖ {0}, Re w > 0
  and Re(1/w) = 1; w ↦ 1/w maps K ∖ {0} onto the line Re = 1, the counterclockwise orientation
  going to Im decreasing from +∞ to −∞ (1/w = 1 − i tan(θ/2) for w = (1 + e^{iθ})/2).
- **Chord estimates** (`ford-chord-estimates`; Kong–Teo Theorem 2.15). For consecutive terms
  h₁/k₁ < h/k < h₂/k₂ of F_N: |w₁| = k/√(k² + k₁²), and on the chord [w₁, w₂]: |w| ≤ √2k/(N + 1),
  Re w ≥ k²/(2N²), Re(1/w) > 1/4; the chord has length ≤ 2√2k/(N + 1). The input is
  k + k₁, k + k₂ ≥ N + 1.
- **Minor arcs** (`rademacher-circle-minor-arc-estimates`; Kong–Teo Proposition 2.16). The minor
  arc of K from 0 to w has length ≤ π|w|/2 (Jordan's inequality) and lies in |z| ≤ |w|.
- **`rademacherPath`** (construction, `rademacher-path`; Kong–Teo (2.9)–(2.10), Rademacher 1940
  p. 62). For N ≥ 1, the piecewise-C¹ path P(N) in the upper half-plane from i to 1 + i through the
  upper arcs of the Ford circles over F_N, parametrised on [0, #F_N] with the j-th unit interval
  on the j-th Ford circle; #F_N = 1 + Σ_{k≤N}φ(k). API: `rademacherPath_start` (P(N)(0) = i),
  `rademacherPath_end` (P(N)(#F_N) = 1 + i), `isPiecewiseC1On_rademacherPath`,
  `im_rademacherPath_pos`, `rademacherPath_mem_fordCircle`, `rademacherPath_eq_tangency`. Unit
  tests: `rademacherPath_one_half` (P(1)(1) = (1 + i)/2), `rademacherPath_two_tangency`
  (P(2)(1) = 2/5 + i/5, P(2)(2) = 3/5 + i/5), `rademacherPath_start_end`,
  `rademacherPath_tangency_im` (P(N)(1) has height 1/(N² + 1), so the paths approach ℝ).

### 2C. Laplace's integral and Bessel functions

- **Laplace transform** (`laplace-transform-cpow`). For Re s > 0 and Re t > 0,
  ∫_0^∞ u^{s−1}e^{−tu} du = Γ(s)t^{−s}: Mathlib's real case extended by the identity theorem on the
  right half-plane.
- **Laplace's integral for 1/Γ** (`bromwich-integral-reciprocal-gamma`; Kong–Teo Lemma 2.3 in its
  Hankel form, Pribitkin–Williams p. 3). For c > 0 and Re s > 1,
  1/Γ(s) = (1/2π)∫_ℝ (c + iy)^{−s}e^{c+iy} dy, absolutely convergent; proof by Fourier inversion
  of u ↦ u^{s−1}e^{−cu}/Γ(s) at u = 1.
- **`besselJ`** (definition, `bessel-function-j`; DLMF 10.2.2). J_ν(z) = (z/2)^ν ₀F̃₁(; ν + 1; −z²/4)
  = (z/2)^ν Σ (−1)^j(z²/4)^j/(j!Γ(ν + j + 1)), through `Complex.regularizedHGFun 0 {ν + 1}`. API:
  `hasSum_besselJ`, `differentiableOn_besselJ` (slit plane), `besselJ_ode`
  (z²w″ + zw′ + (z² − ν²)w = 0), `besselJ_add_besselJ` (J_{ν−1} + J_{ν+1} = (2ν/z)J_ν),
  `besselJ_one_half` (J_{1/2}(x) = √(2/(πx)) sin x), `besselJ_neg_natCast`
  (J_{−n} = (−1)ⁿJ_n). Unit tests: `besselJ_zero_zero` (J_0(0) = 1), `besselJ_one_half_pi`
  (J_{1/2}(π) = 0), `besselJ_zero_eq_regularizedHGFun`, `exists_besselJ_zero_eq_zero` (a zero in
  (2, 3)).
- **`modifiedBesselI`** (definition, `modified-bessel-function-i`; Kong–Teo (2.5), DLMF 10.25.2).
  I_ν(z) = (z/2)^ν ₀F̃₁(; ν + 1; z²/4) = (z/2)^ν Σ (z²/4)^j/(j!Γ(ν + j + 1)) for all ν, z ∈ ℂ (1/Γ is
  entire); I_0(0) = 1 and I_ν(0) = 0 for ν ≠ 0 by the cpow convention. API:
  `modifiedBesselI_eq_regularizedHGFun`, `hasSum_modifiedBesselI`,
  `differentiable_regularizedHGFun_modifiedBessel`, `differentiableOn_modifiedBesselI`,
  `modifiedBesselI_neg_natCast` (I_{−n} = I_n), `modifiedBesselI_sub_modifiedBesselI`
  (I_{ν−1} − I_{ν+1} = (2ν/z)I_ν), `deriv_modifiedBesselI` (I_ν′ = I_{ν+1} + (ν/z)I_ν),
  `modifiedBesselI_ode` (z²w″ + zw′ − (z² + ν²)w = 0), `modifiedBesselI_one_half` and
  `modifiedBesselI_neg_one_half` (√(2/(πx)) sinh x, √(2/(πx)) cosh x), `modifiedBesselI_ofReal_pos`
  (positive for real ν > −1, x > 0), `norm_modifiedBesselI_le` (|I_ν(x)| ≤ (x/2)^ν e^{x²/4}/Γ(ν + 1)
  for ν, x ≥ 0), `isEquivalent_modifiedBesselI_atTop` (I_ν(x) ~ e^x/√(2πx)),
  `modifiedBesselI_eq_besselJ` (I_ν(z) = e^{−νπi/2}J_ν(iz) for −π < arg z ≤ π/2). Unit tests:
  `modifiedBesselI_zero_zero`, `modifiedBesselI_one_half_one` (I_{1/2}(1) = √(2/π) sinh 1),
  `modifiedBesselI_zero_eq_regularizedHGFun`, `one_le_re_modifiedBesselI_zero` (I_0 ≥ 1 on ℝ,
  unlike J_0).
- **I_{3/2}** (`modified-bessel-i-three-halves`; Kong–Teo Proposition 2.5). For x > 0,
  I_{3/2}(x) = √(2x/π) d/dx(sinh x/x) = √(2/(πx))(cosh x − sinh x/x).
- **Vertical-line integral** (`modified-bessel-i-bromwich-integral`; Kong–Teo Proposition 2.4
  with corrected hypotheses). For x > 0, c > 0 and Re ν > 0,
  I_ν(x) = (x/2)^ν(1/2πi)∫_{c−i∞}^{c+i∞} t^{−ν−1}exp(t + x²/(4t)) dt, absolutely convergent.

### 2D. Rademacher's Kloosterman sum A_k(n)

- **`rademacherKloosterman`** (definition, `kloosterman-sum-rademacher`; Kong–Teo Theorem 3.1,
  Rademacher 1940 (8)). A_k(n) = Σ_{0≤h<k, (h,k)=1} exp(πi s(h, k) − 2πinh/k) for k ≥ 1, n ∈ ℤ. It is
  real, periodic in n with period k, and |A_k(n)| ≤ φ(k). API: `rademacherKloosterman_one`,
  `rademacherKloosterman_two` ((−1)ⁿ), `rademacherKloosterman_three` (2cos(π(12n − 1)/18)),
  `rademacherKloosterman_add_mul_self`, `rademacherKloosterman_im`,
  `star_rademacherKloosterman`, `norm_rademacherKloosterman_le_totient`,
  `norm_rademacherKloosterman_le`, `rademacherKloosterman_eq_jacobi`,
  `rademacherKloosterman_mul`. Unit tests: `rademacherKloosterman_one_apply`,
  `rademacherKloosterman_four` (A_4(n) = 2cos(π(4n − 1)/8)), `rademacherKloosterman_five_one`
  (A_5(1) = 0), `rademacherKloosterman_three_zero_ne_ramanujan` (A_3(0) = 2cos(π/18) ≠ 2, the
  Ramanujan sum without the multiplier), `rademacherKloosterman_im_eq_zero`.
- **Trivial bound** (`kloosterman-sum-rademacher-trivial-bound`; Rademacher 1940 p. 67).
  |A_k(n)| ≤ φ(k) ≤ k, with equality at k = 1.
- **Jacobi-symbol form** (`kloosterman-sum-rademacher-jacobi-form`; Hardy–Ramanujan (1.721)–(1.722),
  Whiteman (1.2)–(1.3)). With hh̄ ≡ 1 (mod k): e^{πi s(h,k)} =
  (−h | k) exp(−πi[(k − 1)/4 + (1/12)(k − 1/k)(2h + h̄ − h²h̄)]) for k odd and
  (−k | h) exp(−πi[(2 − hk − h)/4 + (1/12)(k − 1/k)(2h + h̄ − h²h̄)]) for k even. Its proof is the
  Dedekind-sum congruences modulo 8, 3 and k, which rest on the gap recorded below.
- **Lehmer's exponent form and congruences** (`lehmer-exponent-form`,
  `lehmer-exponent-congruences`; Lehmer 1938 (1.6)–(1.16)). A_k(n) = Σ_ρ exp(πi f_n(ρ, k)/(12k))
  (k odd) or Σ_ρ exp(πi g_n(ρ, k)/(12k)) (k even), with f_n = −{24nρ + 6k(−ρ | k) + 3k(k − 3) +
  (k² − 1)(2ρ + ρ̄ − ρ²ρ̄)} and g_n = −{24nρ + 6k(−k | ρ) − ρ(k + 1)(k + 2) − (k² − 1)(ρ² − 1)ρ̄}; with
  ν = 1 − 24n: f_n ≡ νρ + ρ̄ (mod k, or 3k when 3 | k), f_n ≡ 0 (mod 3) when 3 ∤ k,
  f_n ≡ 2k(−ρ | k) + k − 3 (mod 8), and the analogues for g_n modulo k₁ (3k₁), 3 and 2^{λ+3}.
- **Multiplication theorems** (Lehmer 1938 Theorems 1–3).
  `kloosterman-sum-rademacher-mul-odd`: for odd coprime k₁, k₂,
  A_{k₁}(n₁)A_{k₂}(n₂) = A_{k₁k₂}(n₃) with n₃ ≡ k₁²n₂ + k₂²n₁ − (k₁² + k₂² − 1)/24 (mod k₁k₂), the
  fraction read modulo k₁k₂ (24 inverted when 3 ∤ k₁k₂; otherwise the numerator divided by 3 and 8
  inverted). `kloosterman-sum-rademacher-mul-two-power`: for k odd and λ ≥ 2,
  A_k(n₁)A_{2^λ}(n₂) = (−1)^{2^{λ−2}}A_{2^λk}(n₃) with n₃ ≡ k²n₂ + 2^{2λ}n₁ − (k² − 1 + 2^{2λ})/24
  (mod 2^λk). `kloosterman-sum-rademacher-double-odd`: A_k(n) = A_{2k}(4n + (k² − 1)/8) for k odd.

### 2E. The circle method and the exact formula

- **`rademacherTerm`** (definition, `rademacher-term`). For k, n ≥ 1,
  R_k(n) = A_k(n)√k(u cosh u − sinh u)/(2√2πλ_n³), u = α(n)/k, a real number. API:
  `rademacherTerm_eq_deriv` (R_k(n) = (1/(π√2))A_k(n)√k d/dn[sinh((π/k)√((2/3)(n − 1/24)))/√(n − 1/24)]),
  `rademacherTerm_eq_modifiedBesselI` (R_k(n) = (2π/(24n − 1)^{3/4})(A_k(n)/k)I_{3/2}(π√(24n − 1)/(6k))),
  `rademacherTerm_one` (R_1(n) = ((1 − 1/α)e^α + (1 + 1/α)e^{−α})/(4√3(n − 1/24))),
  `rademacherTerm_eq_zero_of_kloosterman_eq_zero`. Unit tests: `rademacherTerm_three_hundred`
  (|R_3(100) + 2.598| < 10⁻³), `rademacherTerm_five_one` (R_5(1) = 0),
  `rademacherTerm_one_one_eq_besselI`, `rademacherTerm_one_one_ne_hardyRamanujan` (R_1(1) ≈ 1.13356
  differs from the Hardy–Ramanujan term φ_1(1) ≈ 1.11646).
- **Coefficient integral** (`partition-number-path-integral`). p(n) = ∫_γ F(e^{2πiτ})e^{−2πinτ} dτ
  for every piecewise-C¹ path γ in the upper half-plane from τ₀ to τ₀ + 1, in particular for P(N):
  the horizontal segment gives p(n) by termwise integration, and Tau Ceti's Cauchy theorem on the
  convex half-plane moves the path.
- **Arc decomposition** (`rademacher-arc-decomposition`; Kong–Teo (3.6)–(3.9)). With
  Φ_{n,k}(z) = z^{1/2}exp(π/(12z) + 2π(n − 1/24)z/k²), G = F − 1 and V_{h,k} the clockwise arc of K from
  w₁ to w₂: p(n) = Σ_{k≤N}Σ_h (I_{h,k} + J_{h,k}), where I_{h,k} = ik^{−5/2}e^{πis(h,k)−2πinh/k}∫_{V_{h,k}}Φ_{n,k}
  and J_{h,k} carries the extra factor G(exp(2πiH/k − 2π/z)).
- **Error integrals** (`rademacher-error-integral-bound`). |Σ J_{h,k}| ≤ C₁(n)/√(N + 1) with
  C₁(n) = 2^{7/4}(F(e^{−π/48}) − 1)e^{2πn}: Cauchy's theorem on {Re z > 0} replaces V_{h,k} by its
  chord, where Re(1/z) > 1/4 bounds the G-factor by F(e^{−π/48}) − 1 (monotonicity of p and of F).
- **Completion** (`rademacher-main-integral-completion`). Replacing V_{h,k} by the full circle K
  costs at most C₂(n)/√(N + 1) in total, C₂(n) = 2^{3/4}πe^{π/12 + 2πn}, by the minor-arc estimates.
- **Evaluation** (`rademacher-main-integral-evaluation`). Σ_h I⁰_{h,k} = R_k(n): inversion w = 1/z,
  t = πw/12, and the vertical-line integral for I_{3/2}.
- **Truncation estimate** (theorem, `circle-method-truncation-estimate`; Kong–Teo (3.13)). For
  n, N ≥ 1, |p(n) − Σ_{k≤N}R_k(n)| ≤ (C₁(n) + C₂(n))/√(N + 1).
- **Rademacher's exact formula** (theorem, `rademacher-exact-formula`; Kong–Teo Theorem 3.1,
  Rademacher 1940 (9)). For every n ≥ 1, Σ_{k≥1}R_k(n) converges absolutely and equals p(n):
  p(n) = (1/(π√2))Σ_{k≥1}A_k(n)√k d/dn[sinh((π/k)√((2/3)(n − 1/24)))/√(n − 1/24)]
  = (2π/(24n − 1)^{3/4})Σ_{k≥1}(A_k(n)/k)I_{3/2}(π√(24n − 1)/(6k)).

### 2F. Effective bounds and asymptotics

- **Elementary bound** (`cosh-sub-sinh-bound`; Kong–Teo Lemma 4.3). For u > 0,
  0 < u cosh u − sinh u ≤ u³cosh u/2.
- **Termwise bound** (`rademacher-term-bound`). |R_k(n)| ≤ (π²/(6√3))k^{−3/2}cosh(α(n)/k).
- **Absolute convergence** (theorem, `rademacher-series-absolutely-convergent`). Σ_k|R_k(n)| < ∞
  for n ≥ 1, by comparison with Σ k^{−3/2}.
- **Remainder bound** (theorem, `rademacher-remainder-bound`). For n, N ≥ 1,
  |p(n) − Σ_{k≤N}R_k(n)| ≤ Σ_{k>N}|R_k(n)| ≤ (π²/(3√3))N^{−1/2}cosh(α(n)/(N + 1)); at N ≍ √n this is
  O(n^{−1/4}), the order of Rademacher's own estimate (Lehmer 1939 (7)).
- **Integrality** (theorem, `partition-number-nearest-integer`). If
  (π²/(3√3))N^{−1/2}cosh(α(n)/(N + 1)) < 1/2 then p(n) = round(Σ_{k≤N}R_k(n)); this holds for every
  N ≥ max(35, α(n)).
- **Leading term** (`rademacher-leading-term-asymptotic`; Kong–Teo Lemma 4.2).
  R_1(n) ~ e^{π√(2n/3)}/(4√3n).
- **Hardy–Ramanujan asymptotic** (theorem, `hardy-ramanujan-asymptotic`; Hardy–Ramanujan (1.41),
  Kong–Teo Theorem 4.1). p(n) ~ e^{π√(2n/3)}/(4√3n): the tail Σ_{k≥2}R_k(n) is
  O(e^{α(n)/2}) = o(e^{π√(2n/3)}/n).
- **Truncated Hardy–Ramanujan sums** (`hardy-ramanujan-truncation-bound`, theorems
  `hardy-ramanujan-truncated-formula` and `hardy-ramanujan-nearest-integer`; Hardy–Ramanujan
  (1.71)–(1.75), Lehmer 1939 (1)–(2)). With φ_k(n) = (√k/(2π√2))d/dn(e^{α(n)/k}/λ_n):
  |p(n) − Σ_{k≤N}A_k(n)φ_k(n)| ≤ (π²/(3√3))N^{−1/2}cosh(α(n)/(N + 1)) + N^{5/2}/(4√2πλ_n³); hence
  for every a > 0, p(n) − Σ_{k≤⌊a√n⌋}A_k(n)φ_k(n) = O(n^{−1/4}), and p(n) is the nearest integer to
  that sum for all large n.

### Dependencies

Inside the roadmap: `QSeriesPartitionsAndMockModularForms:QM.1` (node `QM.1/dedekind-eta-multiplier`:
the eta law on SL₂(ℤ) with its Dedekind sums). From other roadmaps:
`ClassicalArithmeticCompletion:CA.2` (nodes `farey-sequence` and `farey-neighbour-property`). The
layer consumes Tau Ceti's contour-integration library at the pinned commit. Its outputs feed
`QSeriesPartitionsAndMockModularForms:QM.3` (Bessel functions for Poincaré series and the
Kloosterman sums of the eta multiplier) and QM.5 (partition congruences and exact formulas for
coefficients). The stage edge from `ExponentialSumsAndCircleMethod:ES.3` carries no dependency.

Missing input (gap): the Jacobi-symbol closed form of e^{πi s(h,k)} (equivalently the
Dedekind-sum congruences modulo 8, 3 and k) has no public proof among the sources read; it is
needed only by the Jacobi-symbol lemma, Lehmer's exponent forms and the multiplication theorems,
and it closes once QM.1 plans the Petersson–Rademacher Jacobi-symbol form of the eta multiplier
or a public proof of the congruences is decomposed. Lehmer's prime-power evaluations of A_k(n)
through Salié sums with the bound |A_k(n)| < 2^{ω(k)}k^{1/2}, and Selberg's cosine formula with
Whiteman's factorisation theorems, remain to be decomposed in this layer.

### Acceptance tests

- **The infinite identity is proved, not observed.** `rademacher-exact-formula` is an equality of
  p(n) with a convergent series for every n ≥ 1; matching finitely many values is not evidence
  for it. Numerically Σ_{k≤100}R_k(1) = 0.99986 and Σ_{k≤40}R_k(100) = 190569291.9996.
- **Truncation is a separate, effective theorem.** For n = 100 and N = 40 the remainder bound is
  0.361 (actual error 0.00035), so p(100) = round(Σ_{k≤40}R_k(100)) = 190569292; for n = 200,
  N = 40: bound 0.426, p(200) = 3972999029388.
- **Hardy and Ramanujan's numbers.** The six terms A_kφ_k(100) sum to 190569291.996 (Hardy–Ramanujan
  §1.7); for n = 200 the eight terms sum to 3972999029387.976 (the printed 3972999029388.004 carries
  a slip in the third term, −87.555 for −87.584).
- **Asymptotic.** p(n)·4√3n·e^{−π√(2n/3)} = 0.95628 at n = 100 and 0.98605 at n = 1000, tending to 1.
- **Kloosterman sums.** A_2(n) = (−1)ⁿ, A_3(n) = 2cos(π(12n − 1)/18), A_4(n) = 2cos(π(4n − 1)/8),
  A_5(1) = A_5(2) = 0; Lehmer's three multiplication theorems hold on all residues for moduli up to
  120 (numerical check), and the multiplier matters: A_3(0) ≠ c_3(0).
- **Bessel functions.** I_{3/2}(π√23/6) ≈ 1.894785 = √(2/(πx))(cosh x − sinh x/x) at x = π√23/6;
  J_0 has its first zero near 2.4048; the vertical-line formula for I_ν is used only with Re ν > 0.

---

## QM.3 Harmonic Maass forms

This layer builds the analytic theory of harmonic weak Maass forms of Bruinier and Funke in the
scalar-valued, integral-weight setting, and the Maass–Poincaré series that realise them. It
constructs the Wirtinger derivatives, the weight-k hyperbolic Laplacian Δ_k, the Maass raising and
lowering operators and the ξ-operator ξ_k (the shadow map), with their factorisations and
slash-equivariance and Bol's identity; the upper incomplete gamma function Γ(s, x) and the
non-holomorphic Fourier basis of Δ_k-harmonic functions; the spaces M^!_k(Γ) of weakly holomorphic
modular forms and H_k(Γ) ⊇ H_k^+(Γ) of harmonic weak Maass forms with their Fourier expansions,
holomorphic parts (mock modular forms) and principal parts; the Bruinier–Funke pairing
{g, f} = (g, ξ_k f), its evaluation through principal parts, the surjectivity of ξ_k (with the
exact sequences 0 → M^!_k → H_k → M^!_{2−k} → 0 and 0 → M^!_k → H_k^+ → S_{2−k} → 0) and the
duality theorems, together with Borcherds' obstruction theorem for principal parts; the classical
Kloosterman sums, the holomorphic Poincaré series P(m, k, N) and the Maass–Poincaré series
Q(−m, k, N) with their Fourier expansions and ξ- and Bol images; the regularized Petersson product
with the image of the Bol operator D^{k−1}; and the non-holomorphic Eisenstein series
E₂* = E₂ − 3/(πv) as the first example of a harmonic Maass form outside H^+.

Sources: J. H. Bruinier and J. Funke, *On two geometric theta lifts* (arXiv:math/0212286v4; Duke
Math. J. 125 (2004)), §3 and the notation of §2; J. H. Bruinier, K. Ono and R. C. Rhoades,
*Differential operators for harmonic weak Maass forms and the vanishing of Hecke eigenvalues*
(arXiv:0802.0963v3; Math. Ann. 342 (2008)), §§1–4 and 6; R. E. Borcherds, *The Gross–Kohnen–Zagier
theorem in higher dimensions* (arXiv:alg-geom/9710002v3; Duke Math. J. 97 (1999)), §3; J. Lewis and
D. Zagier, *Period functions for Maass wave forms. I* (arXiv:math/0101270v1; Ann. of Math. 153
(2001)), Chapter IV §4 (Bol's identity); the NIST DLMF, §§8.2–8.11 (incomplete gamma functions),
§13.14 (Whittaker functions) and §10.9 (Schläfli's integral).

### What Mathlib and Tau Ceti already provide (consume; never restate)

- **Modular forms (Mathlib).** `ModularForm Γ k`, `CuspForm Γ k`, `SlashInvariantForm` for
  Γ ≤ GL₂(ℝ), the slash action `ModularForm.slash_def`, cusps `IsCusp`, boundedness at a cusp
  `OnePoint.IsBoundedAt`, the strict width at ∞ `Subgroup.strictWidthInfty`, the congruence
  subgroups `CongruenceSubgroup.Gamma0`, `CongruenceSubgroup.Gamma` with
  `CongruenceSubgroup.Gamma_normal` and `CongruenceSubgroup.IsCongruenceSubgroup.finiteIndex`, the
  normal core `Subgroup.normalCore` with `Subgroup.normalCore_normal` and
  `Subgroup.finiteIndex_normalCore`; q-expansions `UpperHalfPlane.qExpansion`,
  `UpperHalfPlane.cuspFunction`, `CuspFormClass.qExpansion_isBigO`; the filter
  `UpperHalfPlane.atImInfty`; the fundamental domain `ModularGroup.fd` with
  `ModularGroup.exists_smul_mem_fd`; holomorphic Eisenstein series `ModularForm.E` with
  `EisensteinSeries.summable_norm_eisSummand` and
  `EisensteinSeries.eisensteinSeries_tendstoLocallyUniformly`; the quasimodular E₂
  (`EisensteinSeries.E2`, `EisensteinSeries.E2_eq_tsum_cexp`, `E2_mdifferentiable`) with its
  defect `EisensteinSeries.E2_slash_action` and `EisensteinSeries.D2`; the discriminant
  `ModularForm.discriminant` with `ModularForm.discriminant_ne_zero` and
  `ModularForm.exp_isBigO_discriminant`; the vanishing of negative-weight level-one forms
  `ModularFormClass.levelOne_neg_weight_eq_zero`.
- **Analysis (Mathlib).** The Laplacian on ℂ = ℝ² (`InnerProductSpace.instLaplacian`,
  `InnerProductSpace.laplacian_eq_iteratedFDeriv_complexPlane`), `ContDiffOn`, `MDifferentiable`,
  `Real.Gamma` with `Real.Gamma_eq_integral`, Fourier series `fourierCoeff` and
  `hasSum_fourier_series_of_summable`, differentiation under the integral
  (`hasDerivAt_integral_of_dominated_loc_of_deriv_le` and its interval form),
  `intervalIntegral.integral_eq_sub_of_hasDerivAt`, `MeasureTheory.integral_prod`,
  `LaurentPolynomial`, `ZMod`.
- **Tau Ceti.** The lower incomplete gamma function `TauCeti.lowerIncompleteGamma` with
  `TauCeti.lowerIncompleteGamma_eq_integral` and `TauCeti.regularizedGamma`; `TauCeti.Real.erfc`;
  the Petersson product `UpperHalfPlane.peterssonInner`, the finite-index coset product
  `CuspForm.peterssonInnerCosets` with `CuspForm.peterssonInnerCosets_definite` (over
  `Subgroup.withCenter`), the integrability lemmas `UpperHalfPlane.integrableOn_petersson_sl_smul_fd_left`
  and `_right`; the boundary path of the truncated fundamental domain `TauCeti.ModularForm.fdBoundary`;
  finiteness of stabilisers `TauCeti.ModularGroup.finite_stabilizer`; and
  `ModularForm.subsingleton_of_neg_weight`.

Neither library has a Wirtinger derivative, a hyperbolic Laplacian, any Maass form, the upper
incomplete gamma function, a weakly holomorphic modular form, a Kloosterman sum, a Poincaré series
other than Eisenstein series, a Bessel function, or a regularized Petersson product.

### Conventions

- **Setting (pinned).** Scalar-valued forms of integral weight k on arithmetic subgroups
  Γ ≤ GL₂(ℝ) with determinant 1, i.e. images of finite-index subgroups of SL₂(ℤ); statements that
  use cusp data assume Γ ≤ SL₂(ℤ). Theorems on ξ_k assume k ≠ 1. Poincaré series live on Γ₀(N) in
  even weight k ≥ 4 (Maass–Poincaré series in weight 2 − k). Bruinier–Funke work with
  vector-valued forms for the Weil representation ρ_L of Mp₂(ℤ) attached to an even lattice L, in
  weight k ∈ ½ℤ, on Γ = Mp₂(ℤ); their Γ″ in the proof of Theorem 3.7 is a normal torsion-free
  subgroup on which ρ_L is trivial. The scalar setting is the case of unimodular L with the group
  replaced by an arbitrary finite-index Γ; the Weil-representation setting is recorded here and not
  built (it is the natural generalisation for QM.4's vector-valued forms and for
  MetaplecticAutomorphicForms MP.7).
- **Differential operators.** τ = u + iv; ∂ = ½(∂_u − i∂_v), ∂̄ = ½(∂_u + i∂_v) as Wirtinger
  derivatives of f ∘ ofComplex; Δ_k = −4v²∂∂̄ + 2ikv∂̄, R_k = 2i∂ + k/v, L_k = −2iv²∂̄,
  ξ_k f = 2iv^k·conj(∂̄f), D = (2πi)^{−1}∂. The operators accept real k.
- **Fourier expansions.** e(x) = e^{2πix}; at ∞ the width is h = Γ.strictWidthInfty and modes are
  e(nτ/h); a⁺(n) are holomorphic coefficients and a⁻(n) the coefficients of the decaying
  non-holomorphic basis functions Γ(1 − k, 4π|n|v/h)e(nτ/h) (n < 0). The principal part includes
  the constant term, as in Bruinier–Funke (3.6).
- **Petersson products** are unnormalised integrals over Γ\ℍ with dμ = du dv/v² (Mathlib's measure
  on ℍ), linear in the first and conjugate-linear in the second argument as written in the
  statements; the regularized product is normalised by [SL₂(ℤ) : Γ]^{−1}, as in
  Bruinier–Ono–Rhoades §4.

### 3A. Wirtinger calculus and the weight-k operators

The operators act on functions ℍ → ℂ through f ∘ ofComplex and are defined for real weight k, so that QM.4 applies them in weight 1/2.

- **`Complex.wirtingerDeriv`** (definition, `wirtinger-derivatives`; Bruinier–Funke §3, p. 10 (definition of R_k, L_k)). For F : ℂ → ℂ and z ∈ ℂ put ∂F(z) := ½(DF(z)(1) − i·DF(z)(i)) and ∂̄F(z) := ½(DF(z)(1) + i·DF(z)(i)), where DF(z) = fderiv ℝ F z is the real Fréchet derivative (junk value 0 where F is not real-differentiable). In coordinates z = u + iv these are ½(∂_u − i∂_v) and ½(∂_u + i∂_v). A function f : ℍ → ℂ is differentiated through F = f ∘ ofComplex (which agrees with f on the open set {Im z > 0}); we write ∂_τ f and ∂_τ̄ f for these, following the notation ∂/∂τ, ∂/∂τ̄ of Bruinier–Funke §3. Hypotheses: Two declarations defined together: Complex.wirtingerDeriv (∂) and Complex.wirtingerDerivBar (∂̄); the ℍ-versions are the compositions with UpperHalfPlane.ofComplex, not new definitions. No holomorphy is assumed; for complex-differentiable F one has ∂F = F′ and ∂̄F = 0. API: `Complex.wirtingerDeriv`, `Complex.wirtingerDerivBar`, `Complex.wirtingerDerivBar_eq_zero_of_differentiableAt`, `Complex.differentiableAt_of_wirtingerDerivBar_eq_zero`, `Complex.wirtingerDeriv_eq_deriv`, `Complex.wirtingerDerivBar_conj`, `Complex.wirtingerDerivBar_mul`, `Complex.four_mul_wirtingerDeriv_wirtingerDerivBar`. Unit tests: `wirtingerDerivBar_id_test` (∂̄(z ↦ z)(z) = 0 for all z); `wirtingerDerivBar_conj_test` (∂̄(z ↦ z̄)(z) = 1 for all z); `wirtingerDeriv_conj_test` (∂(z ↦ z̄)(z) = 0: a definition with the signs of ∂ and ∂̄ exchanged would give 1); `wirtingerDerivBar_im_test` (∂̄(z ↦ Im z)(z) = i/2).

- **`hyperbolicLaplacian`** (definition, `weight-k-hyperbolic-laplacian`; Bruinier–Funke §3, (3.1), p. 8). For k ∈ ℝ and f : ℍ → ℂ, Δ_k f(τ) := −v²(∂²_u + ∂²_v)f(τ) + ikv(∂_u + i∂_v)f(τ) = −4v²∂_τ∂_τ̄ f(τ) + 2ikv ∂_τ̄ f(τ), where τ = u + iv (Bruinier–Funke (3.1); Bruinier–Ono–Rhoades (2.1)). Real weight is admitted so that the same operator serves the integral weights of QM.3 and the weight 1/2 of QM.4. Zwegers' weight-1/2 Casimir operator Ω_{1/2} = −4v²∂_τ∂_τ̄ + iv∂_τ̄ + 3/16 equals Δ_{1/2} + 3/16, so 'eigenfunction of Ω_{1/2} with eigenvalue 3/16' means 'annihilated by Δ_{1/2}'. Hypotheses: k ∈ ℝ; f is differentiated through f ∘ ofComplex; the value is only meaningful where f is C². Sign convention pinned: the first-order term is +ikv(∂_u + i∂_v) = 2ikv∂_τ̄, so holomorphic functions are annihilated for every k. API: `hyperbolicLaplacian`, `hyperbolicLaplacian_eq_laplacian`, `hyperbolicLaplacian_zero_weight`, `hyperbolicLaplacian_add`, `hyperbolicLaplacian_of_mdifferentiable`, `hyperbolicLaplacian_im_rpow`, `hyperbolicLaplacian_half_add_eq_casimir`. Unit tests: `hyperbolicLaplacian_one_test` (Δ_k(τ ↦ 1) = 0 for every real k); `hyperbolicLaplacian_im_rpow_one_sub_test` (Δ_k(τ ↦ (Im τ)^{1−k}) = 0 for every real k); `hyperbolicLaplacian_im_test` (Δ_k(τ ↦ Im τ) = −k·Im τ); `hyperbolicLaplacian_conj_test` (Δ_k(τ ↦ τ̄)(τ) = 2ik·Im τ; an operator with first-order term ikv(∂_u − i∂_v) would annihilate τ̄). Planet: Weight-k hyperbolic Laplacian.

- **`raisingOperator`** (definition, `maass-raising-operator`; Bruinier–Funke §3, p. 10). For k ∈ ℝ and f : ℍ → ℂ, R_k f(τ) := 2i ∂_τ f(τ) + k v^{−1} f(τ). Writing D := (2πi)^{−1}∂_τ (= q d/dq on holomorphic functions) one has R_k = −4πD + k/v (BOR p. 7). Hypotheses: k ∈ ℝ; f real-differentiable where evaluated. API: `raisingOperator`, `raisingOperator_eq`, `raisingOperator_add`, `raisingOperator_qParam`. Unit tests: `raisingOperator_one_test` (R_k(τ ↦ 1)(τ) = k / Im τ); `raisingOperator_qParam_test` (R_0(τ ↦ e(τ)) = −4π e(τ)); `raisingOperator_im_rpow_neg_test` (R_k(τ ↦ v^{−k}) = 0 although v^{−k} is not holomorphic: R_k does not detect holomorphy (unlike L_k)).

- **`loweringOperator`** (definition, `maass-lowering-operator`; Bruinier–Funke §3, p. 10). For k ∈ ℝ and f : ℍ → ℂ, L_k f(τ) := −2iv² ∂_τ̄ f(τ) = −iv²(∂_u + i∂_v)f(τ). It does not depend on k; the index records that it maps weight k to weight k − 2. Hypotheses: k ∈ ℝ (bookkeeping only); f real-differentiable where evaluated. API: `loweringOperator`, `loweringOperator_eq_zero_iff`, `loweringOperator_add`, `loweringOperator_im_rpow`. Unit tests: `loweringOperator_qParam_test` (L_k(τ ↦ e(nτ)) = 0 for n ∈ ℤ); `loweringOperator_im_one_sub_test` (L_k(τ ↦ v^{1−k}) = (1 − k)v^{2−k}); `loweringOperator_incompleteGamma_test` (For n < 0 and k ∈ ℤ, k ≤ 0: L_k(τ ↦ Γ(1−k, 4π|n|v)e(nτ)) = −v^{2−k}(4π|n|)^{1−k}e(nτ̄), not −2v^{2−k}(4π|n|)^{1−k}e(nτ̄) as printed in BF Lemma 3.1).

- **Factorisation of Δ_k through raising and lowering** (lemma `neg_hyperbolicLaplacian_eq`, `laplacian-raising-lowering-factorisation`; Bruinier–Funke (3.3), p. 10). For k ∈ ℝ and f : ℍ → ℂ of class C²: −Δ_k f = L_{k+2}R_k f + k f = R_{k−2}L_k f (Bruinier–Funke (3.3), Bruinier–Ono–Rhoades (2.2)). Hypotheses: f of class C² on ℍ (as f ∘ ofComplex on {Im > 0}).

- **Raising and lowering shift Δ-eigenvalues** (lemma, `raising-lowering-eigenvalue-shift`; Bruinier–Ono–Rhoades (2.3), (2.4), p. 7). If f : ℍ → ℂ is of class C³ and Δ_k f = λf, then Δ_{k+2}(R_k f) = (λ + k)R_k f and Δ_{k−2}(L_k f) = (λ − k + 2)L_k f (Bruinier–Ono–Rhoades (2.3), (2.4)). Hypotheses: k ∈ ℝ, λ ∈ ℂ, f of class C³ (so that R_k f, L_k f are C²).

- **`xiOperator`** (definition, `xi-operator`; Bruinier–Funke Prop. 3.2, p. 10). For k ∈ ℝ and f : ℍ → ℂ, ξ_k f(τ) := 2i v^k \overline{∂_τ̄ f(τ)} = v^{k−2} \overline{L_k f(τ)} = R_{−k}(v^k \overline{f})(τ) (Bruinier–Funke Prop. 3.2; Bruinier–Ono–Rhoades (1.1)). It is conjugate-linear, kills exactly the holomorphic functions, and maps weight k to weight 2 − k. For a harmonic Maass form f, ξ_k f is its shadow (up to the convention of complex conjugation of coefficients made explicit in QM.3/xi-fourier-expansion). Hypotheses: k ∈ ℝ; v^k is the real power (Im τ)^k. ξ_k is ℝ-linear and conjugate-linear over ℂ: ξ_k(cf) = c̄ ξ_k f. API: `xiOperator`, `xiOperator_eq_lowering`, `xiOperator_eq_raising_conj`, `xiOperator_add`, `xiOperator_eq_zero_iff`, `xiOperator_im_rpow_one_sub`. Unit tests: `xiOperator_qParam_test` (ξ_k(τ ↦ e(nτ)) = 0 for n ∈ ℤ and every real k); `xiOperator_im_rpow_test` (ξ_2(τ ↦ −(3/π)(Im τ)^{−1}) = 3/π (constant function)); `xiOperator_not_linear_test` (ξ_k(τ ↦ i·v^{1−k}) = −i(1 − k): ξ_k is conjugate-linear, not ℂ-linear); `xiOperator_incompleteGamma_test` (For n < 0 and k ∈ ℤ, k ≤ 0: ξ_k(τ ↦ Γ(1−k, 4π|n|v)e(nτ)) = −(4π|n|)^{1−k}e(−nτ)). Planet: ξ-operator (shadow map).

- **ξ_{2−k} ∘ ξ_k = −Δ_k** (lemma `xiOperator_xiOperator`, `xi-xi-eq-neg-laplacian`; Bruinier–Funke (3.3) and Prop. 3.2, p. 10). For k ∈ ℝ and f : ℍ → ℂ of class C²: ξ_{2−k}(ξ_k f) = −Δ_k f. Hypotheses: f of class C² on ℍ.

- **ξ_k f is holomorphic iff Δ_k f = 0** (lemma `mdifferentiable_xiOperator_iff`, `xi-holomorphic-iff-harmonic`; Bruinier–Funke Prop. 3.2, proof, p. 10). Let U ⊆ ℍ be open, k ∈ ℝ and f of class C² on U. Then ξ_k f is holomorphic on U if and only if Δ_k f = 0 on U. Pointwise: ∂_τ(v^k ∂_τ̄ f) = −¼ v^{k−2} Δ_k f. Hypotheses: f of class C² on the open set U (ξ_k f is then C¹, so holomorphy is ∂̄(ξ_k f) = 0).

- **R_k and L_k intertwine the slash actions** (lemma `raisingOperator_slash`, `raising-lowering-slash-equivariance`; Bruinier–Ono–Rhoades §2, p. 7). For k ∈ ℤ, γ ∈ GL₂(ℝ) with det γ = 1 and f : ℍ → ℂ real-differentiable: R_k(f|_kγ) = (R_k f)|_{k+2}γ and L_k(f|_kγ) = (L_k f)|_{k−2}γ, where |_k is Mathlib's weight-k slash action (f|_kγ)(τ) = (cτ + d)^{−k}f(γτ). Hypotheses: det γ = 1 (for det γ > 0 Mathlib's slash carries the extra factor det(γ)^{k−1}, which changes the statement by a scalar).

- **Δ_k commutes with the weight-k slash action** (lemma `hyperbolicLaplacian_slash`, `laplacian-slash-equivariance`; Bruinier–Funke §3, p. 10). For k ∈ ℤ, γ ∈ GL₂(ℝ) with det γ = 1 and f of class C² on ℍ: Δ_k(f|_kγ) = (Δ_k f)|_kγ. In particular the Δ_k-harmonic functions of weight k form a space stable under the slash action. Hypotheses: det γ = 1.

- **ξ_k intertwines weight k and weight 2 − k** (lemma `xiOperator_slash`, `xi-slash-equivariance`; Bruinier–Funke Prop. 3.2, proof, p. 10). For k ∈ ℤ, γ ∈ GL₂(ℝ) with det γ = 1 and f real-differentiable on ℍ: ξ_k(f|_kγ) = (ξ_k f)|_{2−k}γ. Hypotheses: det γ = 1.

- **`iteratedRaising`** (definition, `iterated-raising-operator`; Bruinier–Ono–Rhoades §2, p. 7). For k ∈ ℝ, n ∈ ℕ: R^0_k := id and R^{n+1}_k := R_{k+2n} ∘ R^n_k, so R^n_k = R_{k+2(n−1)} ∘ ⋯ ∘ R_{k+2} ∘ R_k maps weight k to weight k + 2n (Bruinier–Ono–Rhoades p. 7). Closed form (Lewis–Zagier (4.15), with ∂_h := D − h/(2πv) = −(4π)^{−1}R_{2h}): R^n_k = (−4π)^n Σ_{m=0}^{n} n!/(n−m)! · binom(n + k − 1, m) · (−1/(4πv))^m D^{n−m}, D = (2πi)^{−1}∂_τ. Hypotheses: k ∈ ℝ, n ∈ ℕ; f of class C^n; binom(x, m) is the generalised binomial coefficient for real x. API: `iteratedRaising`, `iteratedRaising_succ`, `iteratedRaising_eq_sum`, `iteratedRaising_slash`. Unit tests: `iteratedRaising_zero_test` (R^0_k f = f); `iteratedRaising_one_test` (R^1_k f = R_k f); `iteratedRaising_qParam_test` (R^2_0(τ ↦ e(τ)) = (16π² − 8π/v)·e(τ): R_0e(τ) = −4πe(τ) and R_2e(τ) = (−4π + 2/v)e(τ)); `iteratedRaising_bol_vanishing_test` (R^1_0(τ ↦ 1) = 0 but R^1_{1}(τ ↦ 1) = 1/v ≠ 0: the weight index matters (Bol's cancellation happens only in weight 1 − n)).

- **Bol's identity D^{k−1} = (−4π)^{1−k}R^{k−1}_{2−k}** (lemma `bol_identity`, `bol-identity`; Bruinier–Ono–Rhoades Lemma 2.1, p. 7). For an integer k ≥ 2 and f : ℍ → ℂ of class C^{k−1}: D^{k−1}f = (−4π)^{1−k} R^{k−1}_{2−k} f, where D = (2πi)^{−1}∂_τ. Consequently, for k ∈ ℤ and det γ = 1, D^{k−1}(f|_{2−k}γ) = (D^{k−1}f)|_kγ. Hypotheses: k ∈ ℤ, k ≥ 2.


### 3B. The upper incomplete gamma function and the non-holomorphic Fourier basis

Tau Ceti has the lower incomplete gamma function γ(s, x) and P(s, x) = γ(s, x)/Γ(s), but not Γ(s, x) for real s ≤ 0, which the Fourier expansions of forms of negative weight need; it is built here.

- **`upperIncompleteGamma`** (definition, `upper-incomplete-gamma`; DLMF §8.2(i), eq. 8.2.2). For s ∈ ℝ and x > 0, Γ(s, x) := ∫_x^∞ t^{s−1}e^{−t} dt (DLMF 8.2.2); the integral converges for every real s because x > 0. Totalised by Γ(s, x) := 0 for x ≤ 0. For s > 0: Γ(s, x) + γ(s, x) = Γ(s), with Tau Ceti's lower incomplete gamma γ(s, x) = TauCeti.lowerIncompleteGamma s x. Hypotheses: Real parameter s (every real value, including s ≤ 0), real argument x > 0. The complex and branch-cut continuations of DLMF 8.2 are not needed. API: `upperIncompleteGamma`, `upperIncompleteGamma_add_lowerIncompleteGamma`, `upperIncompleteGamma_add_one`, `hasDerivAt_upperIncompleteGamma`, `upperIncompleteGamma_one`, `upperIncompleteGamma_nat_add_one`, `upperIncompleteGamma_half_sq`, `upperIncompleteGamma_isEquivalent`, `upperIncompleteGamma_pos`. Unit tests: `upperIncompleteGamma_one_test` (Γ(1, x) = e^{−x} for x > 0); `upperIncompleteGamma_two_test` (Γ(2, x) = (1 + x)e^{−x} for x > 0); `upperIncompleteGamma_tendsto_zero_test` (For s > 0: Γ(s, x) → Γ(s) as x → 0⁺); `upperIncompleteGamma_ne_lower_test` (Γ(1, 1) = e^{−1} ≠ 1 − e^{−1} = γ(1, 1): the upper and lower functions are not interchangeable); `upperIncompleteGamma_zero_pos_test` (0 < Γ(0, 1): the function is finite at s = 0).

- **The decaying non-holomorphic Fourier basis functions** (lemma `xiOperator_decayingBasis`, `nonholomorphic-fourier-basis-decaying`; Bruinier–Funke §3, p. 9). Let w ∈ ℝ, h > 0 and n ∈ ℤ with n < 0, and put φ_n(τ) := Γ(1 − w, 4π|n|v/h)·e(nτ/h). Then Δ_w φ_n = 0, ξ_w φ_n = −(4π|n|/h)^{1−w}·e(|n|τ/h), L_w φ_n(τ) = −v^{2−w}(4π|n|/h)^{1−w}e(nτ̄/h), and φ_n(τ) = O(v^{−w}e^{−2π|n|v/h}) as v → ∞. Also Δ_w(v^{1−w}) = 0 and ξ_w(v^{1−w}) = 1 − w. Hypotheses: w ∈ ℝ arbitrary; n < 0; h > 0 (the cusp width).

- **The growing non-holomorphic Fourier basis functions** (lemma `xiOperator_growingBasis`, `nonholomorphic-fourier-basis-growing`; Bruinier–Funke §3, p. 9). Let w ∈ ℝ, h > 0, n ∈ ℤ with n > 0, W := 2πnv/h and ψ_n(τ) := e^{−W}(∫_1^W s^{−w}e^{2s}ds)·e(nu/h). Then Δ_w ψ_n = 0 and ξ_w ψ_n = (2πn/h)^{1−w}e(−nτ/h); ψ_n(τ) ~ ½W^{−w}e^{W} as v → ∞. Every solution b of b″ − b + (w/W)(b′ + b) = 0 on W > 0 is a combination of e^{−W} and e^{−W}∫_1^W s^{−w}e^{2s}ds. Hypotheses: n > 0, h > 0, w ∈ ℝ. The base point 1 of the integral is a fixed normalisation; changing it adds a multiple of e^{−W}, i.e. of the holomorphic term e(nτ/h) (see sourceIssue E403).


### 3C. Weakly holomorphic forms and harmonic weak Maass forms

- **`OnePoint.IsExpGrowthAt`** (definition, `exponential-growth-at-cusps`; Bruinier–Funke §3, condition (ii), p. 8). For c ∈ ℙ¹(ℝ) = OnePoint ℝ, f : ℍ → ℂ and k ∈ ℤ: f has exponential growth at c in weight k if for every g ∈ GL₂(ℝ) with g·∞ = c there is C ∈ ℝ with (f|_kg)(τ) = O(e^{C·Im τ}) as Im τ → ∞ (uniformly in Re τ, i.e. along Mathlib's filter atImInfty). For a subgroup Γ ≤ GL₂(ℝ), f has exponential growth at the cusps of Γ if this holds at every c with IsCusp c Γ. This is condition (ii) of Bruinier–Funke §3 and the growth condition of weakly holomorphic forms; it is the analogue of Mathlib's OnePoint.IsBoundedAt with the bound 1 replaced by e^{C Im τ}. Hypotheses: Two declarations: OnePoint.IsExpGrowthAt c f k (one cusp) and IsExpGrowthAtCusps Γ f k (all cusps of Γ). API: `OnePoint.IsExpGrowthAt`, `IsExpGrowthAtCusps`, `OnePoint.IsBoundedAt.isExpGrowthAt`, `OnePoint.IsExpGrowthAt.add`, `OnePoint.IsExpGrowthAt.mul`, `OnePoint.IsExpGrowthAt.smul_iff`. Unit tests: `isExpGrowthAt_qParam_inv_test` (τ ↦ e(−τ) has exponential growth at ∞ in weight 0); `not_isBoundedAt_qParam_inv_test` (τ ↦ e(−τ) is not bounded at ∞ (OnePoint.IsBoundedAt fails), so exponential growth is strictly weaker than boundedness); `not_isExpGrowthAt_exp_qParam_inv_test` (τ ↦ exp(e(−τ)) does not have exponential growth at ∞); `isExpGrowthAt_zero_test` (The zero function has exponential growth at every c in every weight).

- **`WeaklyHolomorphicModularForm`** (definition, `weakly-holomorphic-modular-form`; Bruinier–Funke §3, p. 10). For Γ ≤ GL₂(ℝ) and k ∈ ℤ, a weakly holomorphic modular form of weight k for Γ is a function f : ℍ → ℂ that is holomorphic on ℍ, satisfies f|_kγ = f for all γ ∈ Γ, and has exponential growth at every cusp of Γ (QM.3/exponential-growth-at-cusps); equivalently (for arithmetic Γ) its expansion at every cusp has only finitely many negative powers of q (QM.3/weakly-holomorphic-laurent-expansion). The ℂ-vector space is M^!_k(Γ). It contains Mathlib's ModularForm Γ k (bounded at the cusps). Hypotheses: Γ : Subgroup (GL (Fin 2) ℝ); theorems about expansions assume Γ arithmetic (Subgroup.IsArithmetic) and, for linearity of the slash action over ℂ, Γ.HasDetOne. Poles are allowed only at the cusps (the source's 'meromorphic at the cusps'), never in ℍ. API: `WeaklyHolomorphicModularForm`, `WeaklyHolomorphicModularForm.instModule`, `ModularForm.toWeaklyHolomorphic`, `WeaklyHolomorphicModularForm.mul`, `WeaklyHolomorphicModularForm.invDiscriminant`, `WeaklyHolomorphicModularForm.eq_zero_of_odd`. Unit tests: `inv_discriminant_not_bounded_test` (1/Δ, which lies in M^!_{−12}(SL₂(ℤ)), is not bounded at ∞; so M^!_k strictly contains M_k); `toWeaklyHolomorphic_injective_test` (The coercion ModularForm Γ k → WeaklyHolomorphicModularForm Γ k is injective and preserves the underlying function); `weaklyHolomorphic_levelOne_odd_test` (For odd k every element of M^!_k(SL₂(ℤ)) is 0); `inv_discriminant_expansion_test` (1/Δ(τ) − (e(−τ) + 24) = O(e^{−2πv}) as v → ∞).

- **Laurent expansion of weakly holomorphic forms at a cusp** (lemma, `weakly-holomorphic-laurent-expansion`; Bruinier–Funke §3, p. 10). Let Γ ≤ GL₂(ℝ) be arithmetic, f ∈ M^!_k(Γ) and h = Γ.strictWidthInfty > 0. Then there are N ∈ ℕ and a : ℤ → ℂ with a(n) = 0 for n < −N such that f(τ) = Σ_{n∈ℤ} a(n)e(nτ/h), absolutely and locally uniformly convergent on ℍ; a(n) = h^{−1}∫_0^h f(u + iv)e(−n(u+iv)/h)du for every v > 0. Conversely a holomorphic h-periodic function with such an expansion has exponential growth at ∞. Hypotheses: Γ arithmetic, so h > 0 and T^h ∈ Γ (Mathlib's strictPeriods).

- **`HarmonicMaassForm`** (definition, `harmonic-maass-form`; Bruinier–Funke §3, p. 8). For Γ ≤ GL₂(ℝ) and k ∈ ℤ, a harmonic weak Maass form of weight k for Γ is a function f : ℍ → ℂ of class C² (as f ∘ ofComplex on {Im > 0}) such that (i) f|_kγ = f for all γ ∈ Γ, (ii) f has exponential growth at every cusp of Γ, (iii) Δ_k f = 0. The ℂ-vector space is H_k(Γ) (Bruinier–Funke's H_{k,L}(Γ″) with trivial representation). Choice of setting, pinned: scalar-valued, integral weight k, Γ a subgroup of GL₂(ℝ) (in the theorems: the image of a finite-index subgroup of SL₂(ℤ)); the Weil-representation setting of Bruinier–Funke (vector-valued forms of weight k ∈ ½ℤ for ρ_L on Mp₂(ℤ)) specialises to this one for unimodular L and is not built here. Bruinier–Ono–Rhoades' space 'H_k(Γ₀(N), χ)' is the subspace H_k^+ of QM.3/harmonic-maass-form-plus-space. Hypotheses: k ∈ ℤ; theorems exclude k = 1 where BF do. C² as in BF; real analyticity (BF: 'automatically real analytic') is not part of the definition and not needed by any result here. API: `HarmonicMaassForm`, `HarmonicMaassForm.instModule`, `WeaklyHolomorphicModularForm.toHarmonic`, `HarmonicMaassForm.hyperbolicLaplacian_eq_zero`, `HarmonicMaassForm.ofLe`, `HarmonicMaassForm.eq_zero_of_odd`. Unit tests: `e2Star_mem_test` (E₂* = E₂ − 3/(πv) underlies an element of H_2(SL₂(ℤ))); `harmonic_levelOne_odd_test` (For odd k, H_k(SL₂(ℤ)) = 0); `E2_not_slashInvariant_test` (E₂|_2 S ≠ E₂, so E₂ (holomorphic, hence Δ_2-harmonic and of moderate growth) does not underlie an element of H_2(SL₂(ℤ))); `toHarmonic_coe_test` (The underlying function of the image of f ∈ M^!_k(Γ) in H_k(Γ) is f). Planet: Harmonic weak Maass form.

- **Fourier coefficients of a harmonic Maass form solve the radial ODE** (lemma, `harmonic-fourier-coefficient-ode`; Bruinier–Funke §3, p. 9). Let Γ be arithmetic, k ∈ ℤ, k ≠ 1, f ∈ H_k(Γ), h = Γ.strictWidthInfty and a(n; v) := h^{−1}∫_0^h f(u + iv)e(−nu/h)du. Then f(u + iv) = Σ_{n∈ℤ} a(n; v)e(nu/h) (absolutely convergent), and there are unique α_n, β_n ∈ ℂ with: a(0; v) = α₀ + β₀v^{1−k}; for n < 0, a(n; v) = α_n e^{−2πnv/h} + β_n Γ(1−k, 4π|n|v/h)e^{−2πnv/h}; for n > 0, a(n; v) = α_n e^{−2πnv/h} + β_n e^{−W}∫_1^W s^{−k}e^{2s}ds with W = 2πnv/h. Hypotheses: k ≠ 1 (for k = 1 the constant term involves log v). f ∈ H_k(Γ) only (no plus-space condition).

- **Growth kills all but finitely many polar coefficients** (lemma, `harmonic-coefficients-eventually-zero`; Bruinier–Funke §3, p. 10). In the situation of QM.3/harmonic-fourier-coefficient-ode, exponential growth of f at ∞ implies: α_n = 0 for all but finitely many n < 0, and β_n = 0 for all but finitely many n > 0. Hypotheses: f ∈ H_k(Γ), Γ arithmetic, k ∈ ℤ, k ≠ 1.

- **`HarmonicMaassForm.xi`** (construction, `xi-map`; Bruinier–Funke Prop. 3.2 and proof, p. 10). Let Γ ≤ GL₂(ℝ) be arithmetic with Γ.HasDetOne and k ∈ ℤ, k ≠ 1. For f ∈ H_k(Γ), ξ_k f (QM.3/xi-operator) is a weakly holomorphic modular form of weight 2 − k for Γ, and f ↦ ξ_k f is a conjugate-linear map ξ_k : H_k(Γ) → M^!_{2−k}(Γ) (Bruinier–Funke Prop. 3.2). Hypotheses: Γ arithmetic and Γ.HasDetOne (e.g. the image of a finite-index subgroup of SL₂(ℤ)); k ∈ ℤ, k ≠ 1. Conjugate-linear: a σ-semilinear map for σ = complex conjugation (Mathlib's →ₗ⋆[ℂ]). API: `HarmonicMaassForm.xi`, `HarmonicMaassForm.coe_xi`, `HarmonicMaassForm.xi_toHarmonic`, `HarmonicMaassForm.xi_ofLe`. Unit tests: `xi_e2Star_test` (ξ_2(E₂*) is the constant weakly holomorphic form 3/π of weight 0 for SL₂(ℤ)); `xi_toHarmonic_test` (ξ_k(f) = 0 for every f in the image of M^!_k(Γ) → H_k(Γ)); `xi_smul_test` (ξ_k(i·f) = −i·ξ_k(f): the map is conjugate-linear, and for E₂* one gets ξ_2(i E₂*) = −3i/π ≠ 3i/π).

- **ker ξ_k = M^!_k(Γ)** (theorem `HarmonicMaassForm.ker_xi`, `xi-kernel-weakly-holomorphic`; Bruinier–Funke Prop. 3.2, p. 10). For Γ arithmetic with Γ.HasDetOne and k ∈ ℤ, k ≠ 1, the kernel of ξ_k : H_k(Γ) → M^!_{2−k}(Γ) is the image of M^!_k(Γ) (Bruinier–Funke Prop. 3.2). Hypotheses: As in QM.3/xi-map.

- **`HarmonicMaassForm.plusSpace`** (definition, `harmonic-maass-form-plus-space`; Bruinier–Funke p. 11). For Γ arithmetic with Γ.HasDetOne and k ∈ ℤ, k ≠ 1: H_k^+(Γ) := {f ∈ H_k(Γ) : ξ_k f is a cusp form}, the preimage of S_{2−k}(Γ) (Mathlib's CuspForm Γ (2 − k)) under ξ_k. It is a ℂ-subspace (ξ_k is additive and S_{2−k} is stable under conjugate scalars). Equivalently (QM.3/plus-space-principal-part-characterisation) at every cusp f minus a Laurent polynomial in q^{−1} decays exponentially — the definition of Bruinier–Ono–Rhoades' H_k. Hypotheses: As in QM.3/xi-map. API: `HarmonicMaassForm.plusSpace`, `HarmonicMaassForm.mem_plusSpace_iff`, `HarmonicMaassForm.range_toHarmonic_le_plusSpace`, `HarmonicMaassForm.plusSpace_eq_range_of_two_le`. Unit tests: `e2Star_not_mem_plusSpace_test` (E₂* ∈ H_2(SL₂(ℤ)) but E₂* ∉ H_2^+(SL₂(ℤ))); `toHarmonic_mem_plusSpace_test` (Every weakly holomorphic form lies in H_k^+(Γ)); `plusSpace_eq_range_of_two_le_test` (For k ≥ 2, H_k^+(Γ) equals the image of M^!_k(Γ)).

- **Fourier expansion of f ∈ H_k^+(Γ)** (theorem `HarmonicMaassForm.hasSum_fourier`, `harmonic-maass-form-fourier-expansion`; Bruinier–Funke (3.2a), (3.2b), p. 9). Let Γ be arithmetic with Γ.HasDetOne, k ∈ ℤ, k ≠ 1, h = Γ.strictWidthInfty and f ∈ H_k^+(Γ). There are N ∈ ℕ and a⁺, a⁻ : ℤ → ℂ with a⁺(n) = 0 for n < −N, a⁻(n) = 0 for n ≥ 0, such that for all τ ∈ ℍ, f(τ) = Σ_{n∈ℤ} a⁺(n)e(nτ/h) + Σ_{n<0} a⁻(n)Γ(1−k, 4π|n|v/h)e(nτ/h), both series converging absolutely and locally uniformly. The coefficients are unique; a⁺(n) = lim_{v→∞} a(n; v)e^{2πnv/h}. (Bruinier–Funke (3.2) restricted to H^+; Bruinier–Ono–Rhoades (1.2) with h = 1 and weight 2 − k.) Hypotheses: k ≠ 1; f ∈ H_k^+ (for f ∈ H_k \ H_k^+ the constant term v^{1−k} and the growing terms ψ_n also occur, see QM.3/harmonic-fourier-coefficient-ode).

- **`HarmonicMaassForm.holoCoeff`** (definition, `holomorphic-part`; Bruinier–Funke (3.2a), (3.2b), p. 9). For f ∈ H_k^+(Γ) (Γ arithmetic, Γ.HasDetOne, k ∈ ℤ, k ≠ 1, h = Γ.strictWidthInfty), with a⁺, a⁻ as in QM.3/harmonic-maass-form-fourier-expansion: the holomorphic part f⁺(τ) := Σ_n a⁺(n)e(nτ/h) and the non-holomorphic part f⁻ := f − f⁺ = Σ_{n<0} a⁻(n)Γ(1−k, 4π|n|v/h)e(nτ/h). Coefficient functionals: a⁺(n) = lim_{v→∞} (h^{−1}∫_0^h f(u+iv)e(−nu/h)du)·e^{2πnv/h} (defined for every function) and a⁻(n) = the coefficient of Γ(1−k, 4π|n|v/h)e(nτ/h). f⁺ is a mock modular form in Zagier's sense: its shadow is ξ_k f, a cusp form of weight 2 − k. Hypotheses: Defined at the cusp ∞ with the width of Γ; at another cusp σ∞ apply the definition to f|_kσ ∈ H_k^+(σ^{−1}Γσ). Normalisation pinned: f⁺ carries all holomorphic terms including the constant term a⁺(0); f⁻ has no constant term. API: `HarmonicMaassForm.holoCoeff`, `HarmonicMaassForm.nonHoloCoeff`, `HarmonicMaassForm.holomorphicPart`, `HarmonicMaassForm.nonHolomorphicPart`, `HarmonicMaassForm.holomorphicPart_add_nonHolomorphicPart`, `HarmonicMaassForm.mdifferentiable_holomorphicPart`, `HarmonicMaassForm.xi_nonHolomorphicPart`, `HarmonicMaassForm.holomorphicPart_toHarmonic`. Unit tests: `holomorphicPart_toHarmonic_test` (For g ∈ M^!_k(Γ), the holomorphic part of its image in H_k^+(Γ) is g itself); `holoCoeff_maassPoincare_test` (For the Maass–Poincaré series Q(−m, k, N): holoCoeff(Q)(−m) = 1 and holoCoeff(Q)(n) = 0 for n < −m); `holomorphicPart_not_invariant_test` (The holomorphic part Q⁺ of Q = Q(−1, 12, 1) is not invariant under |_{−10}SL₂(ℤ): otherwise Q⁻ = Q − Q⁺ would lie in H^+_{−10}(SL₂(ℤ)) with all holomorphic coefficients 0, so {Δ, Q⁻} = 0 (QM.3/bruinier-funke-pairing-formula), i.e. (Δ, ξQ⁻) = 0 with ξQ⁻ = ξQ ∈ S₁₂ = ℂΔ, forcing ξQ = 0, which contradicts QM.3/xi-maass-poincare-series); `holomorphicPart_add_test` (f = f⁺ + f⁻ pointwise, and f⁻ → 0 as Im τ → ∞).

- **`HarmonicMaassForm.principalPart`** (definition, `principal-part`; Bruinier–Funke (3.6), p. 11). For f ∈ H_k^+(Γ) as in QM.3/holomorphic-part, P(f) := Σ_{n≤0} a⁺(n)T^n ∈ ℂ[T, T^{−1}] (a Laurent polynomial by QM.3/harmonic-coefficients-eventually-zero), read as the Fourier polynomial P(f)(τ) = Σ_{n≤0} a⁺(n)e(nτ/h) (Bruinier–Funke (3.6)). It includes the constant term a⁺(0). Hypotheses: At the cusp ∞ with the width h of Γ; at σ∞ use f|_kσ. API: `HarmonicMaassForm.principalPart`, `HarmonicMaassForm.principalPart_coeff`, `HarmonicMaassForm.principalPart_add`, `HarmonicMaassForm.sub_principalPart_isBigO`. Unit tests: `principalPart_inv_discriminant_test` (P(1/Δ) = T^{−1} + 24); `principalPart_E4_test` (P(E₄) = 1); `principalPart_discriminant_test` (P(Δ) = 0 (cusp forms have zero principal part)); `principalPart_ne_nonHolo_test` (For Q(−m, k, N) the principal part is T^{−m} + a⁺(0); the non-holomorphic term −Γ(k−1, 4πmv)q^{−m}/(k−2)! does not contribute, although it is also of order q^{−m} in the exponent of e(·)).

- **H_k^+ via exponential decay after removing a principal part** (lemma, `plus-space-principal-part-characterisation`; Bruinier–Ono–Rhoades §2 (iii), p. 6). Let Γ ≤ SL₂(ℤ) have finite index, k ∈ ℤ, k ≠ 1, f ∈ H_k(Γ). Then f ∈ H_k^+(Γ) if and only if for every σ ∈ SL₂(ℤ) there are a Laurent polynomial P_σ ∈ ℂ[T^{−1}] and ε > 0 with (f|_kσ)(τ) − P_σ(e(τ/h_σ)) = O(e^{−εv}) as v → ∞, h_σ the width of σ^{−1}Γσ at ∞. This is the definition of Bruinier–Ono–Rhoades' space H_k(Γ₀(N), χ) (their condition (iii)), so their H_k is BF's H_k^+. Hypotheses: Finite-index Γ ≤ SL₂(ℤ), so every cusp is σ∞ with σ ∈ SL₂(ℤ).

- **Fourier expansion of ξ_k f** (lemma, `xi-fourier-expansion`; Bruinier–Ono–Rhoades (1.3), p. 2). For f ∈ H_k^+(Γ) with expansion as in QM.3/harmonic-maass-form-fourier-expansion: ξ_k f(τ) = −Σ_{n<0} \overline{a⁻(n)}(4π|n|/h)^{1−k} e(|n|τ/h). Equivalently, with b(m) the coefficients of the cusp form ξ_k f: b(m) = −\overline{a⁻(−m)}(4πm/h)^{1−k} for m ≥ 1 (Bruinier–Ono–Rhoades (1.3), with h = 1 and weight 2 − k). This corrects the constant in Bruinier–Funke Lemma 3.1 (factor 1, not 2; sourceIssue E401). Hypotheses: k ∈ ℤ, k ≠ 1, f ∈ H_k^+(Γ).

- **Growth of harmonic Maass forms towards the real axis** (lemma, `harmonic-growth-near-real-axis`; Bruinier–Funke Lemma 3.3, p. 11). Let Γ ≤ SL₂(ℤ) have finite index and f ∈ H_k(Γ). Then there are A, C > 0 with |f(u + iv)| ≤ A e^{C/v} for all u ∈ ℝ and 0 < v ≤ 1 (Bruinier–Funke Lemma 3.3). (The same bound for f⁺, f⁻ is part of QM.3/holomorphic-coefficient-bound.) Hypotheses: Γ of finite index in SL₂(ℤ) (finitely many cosets).

- **Polynomial bound for the non-holomorphic coefficients a⁻(n)** (lemma, `nonholomorphic-coefficient-bound`; Bruinier–Funke Lemma 3.4, p. 11). Let Γ ≤ SL₂(ℤ) have finite index, k ∈ ℤ, k ≠ 1, f ∈ H_k^+(Γ), and let β_n (n < 0) be the coefficients of the decaying basis functions in QM.3/harmonic-fourier-coefficient-ode (width h). If b(m) (m ≥ 1) are the Fourier coefficients of the cusp form ξ_k f, then b(m) = −\overline{β_{−m}}(4πm/h)^{1−k}, and consequently β_{−m} = O(m^{k/2}) as m → ∞ (Bruinier–Funke Lemma 3.4, second part). Hypotheses: f ∈ H_k^+; the identity is proved mode by mode, before the full expansion is known to converge.

- **Subexponential bound for the holomorphic coefficients a⁺(n)** (lemma, `holomorphic-coefficient-bound`; Bruinier–Funke Lemma 3.4, p. 11). Let Γ ≤ SL₂(ℤ) have finite index, k ∈ ℤ, k ≠ 1, f ∈ H_k^+(Γ). Then f⁺ and f⁻ satisfy the bound of QM.3/harmonic-growth-near-real-axis, and there is C > 0 with a⁺(n) = O(e^{C√n}) as n → +∞ (Bruinier–Funke Lemma 3.4, first part). Hypotheses: f ∈ H_k^+(Γ).


### 3D. The Bruinier–Funke pairing, surjectivity of ξ and duality

Pairings over Γ\ℍ are sums over the cosets of Γ̃ = Γ·{±1} in SL₂(ℤ) of level-one integrals over the standard fundamental domain (the form of Tau Ceti's Petersson product); sums over cusps are written with the widths h_c, equivalently as coset sums with a common period.

- **Stokes' theorem on the truncated fundamental domain** (lemma, `truncated-fundamental-domain-stokes`; Bruinier–Funke proof of Prop. 3.5, p. 12). Let F_T := {τ ∈ ℍ : |τ| ≥ 1, |Re τ| ≤ 1/2, Im τ ≤ T} (T > 1) and let G be a C¹ function on a neighbourhood of F_T. Then ∫_{F_T} ∂_τ̄ G(τ) du dv = (1/(2i))∮_{∂F_T} G(τ) dτ, with ∂F_T positively oriented (the boundary path is Tau Ceti's TauCeti.ModularForm.fdBoundary T). In the form used by Bruinier–Funke: for the 1-form ω = G dτ, dω = ∂_τ̄G dτ̄ ∧ dτ = 2i ∂_τ̄G du ∧ dv. Hypotheses: G of class C¹ on an open set containing F_T; T > 1.

- **`bruinierFunkePairing`** (definition, `bruinier-funke-pairing`; Bruinier–Funke (3.9), p. 12). Let Γ ≤ SL₂(ℤ) have finite index, k ∈ ℤ, k ≠ 1, κ := 2 − k. For g ∈ M_κ(Γ) (Mathlib's ModularForm Γ κ) and f ∈ H_k^+(Γ): {g, f} := (g, ξ_k f)_κ, the Petersson product of the modular form g with the cusp form ξ_k f, (g, h)_κ := Σ_{q ∈ SL₂(ℤ)/Γ̃} ∫_{F} (g|_κq^{−1})(τ)·\overline{(h|_κq^{−1})(τ)}·v^κ dμ(τ), where Γ̃ = Γ·{±I}, F = ModularGroup.fd and dμ = du dv/v² is Mathlib's measure on ℍ (an unnormalised integral over Γ̃\ℍ). In Tau Ceti's notation (g, h)_κ = Σ_q UpperHalfPlane.peterssonInner κ F (h|q^{−1}) (g|q^{−1}), which for a cusp form g is CuspForm.peterssonInnerCosets h g. The pairing is ℂ-bilinear (ξ_k is conjugate-linear and the Petersson product conjugate-linear in h). Hypotheses: Γ of finite index in SL₂(ℤ) (viewed in GL₂(ℝ)); k ≠ 1. Convention pinned: linear in g, and linear in f; the Petersson product is not normalised by the index. API: `bruinierFunkePairing`, `bruinierFunkePairing_add_left`, `bruinierFunkePairing_toHarmonic`, `bruinierFunkePairing_eq_peterssonInnerCosets`. Unit tests: `bruinierFunkePairing_toHarmonic_test` ({g, f} = 0 whenever f is (the image of) a weakly holomorphic form); `bruinierFunkePairing_maassPoincare_test` (For even k ≥ 4, g ∈ S_k(SL₂(ℤ)) with coefficients b(n), and the Maass–Poincaré series Q(−m, k, 1) ∈ H_{2−k}^+(SL₂(ℤ)): {g, Q(−m, k, 1)} = b(m)); `bruinierFunkePairing_smul_right_test` ({g, c·f} = c·{g, f} (linear, not conjugate-linear, in f although ξ_k is conjugate-linear)); `bruinierFunkePairing_eq_peterssonInnerCosets_test` (For g a cusp form, {g, f} equals Tau Ceti's CuspForm.peterssonInnerCosets (ξ_k f) g). Planet: Bruinier–Funke pairing {g, f}.

- **{g, f} in terms of principal parts** (theorem `bruinierFunkePairing_eq_sum`, `bruinier-funke-pairing-formula`; Bruinier–Funke Prop. 3.5, p. 12). Let Γ ≤ SL₂(ℤ) have finite index, k ∈ ℤ, k ≠ 1, κ = 2 − k, g ∈ M_κ(Γ), f ∈ H_k^+(Γ). For each cusp c of Γ choose σ_c ∈ SL₂(ℤ) with σ_c∞ = c and let h_c be the width, a⁺_c(n) the holomorphic coefficients of f|_kσ_c and b_c(n) the coefficients of g|_κσ_c (in e(nτ/h_c)). Then {g, f} = Σ_{c ∈ Γ\ℙ¹(ℚ)} h_c Σ_{n≤0} a⁺_c(n) b_c(−n). In particular the pairing depends only on the principal parts of f at the cusps. For Γ = SL₂(ℤ): {g, f} = Σ_{n≤0} a⁺(n)b(−n) (Bruinier–Funke Prop. 3.5). Hypotheses: Finite-index Γ; the choice of σ_c does not matter (another choice changes both expansions by the same translation).

- **Finite-index subgroups contain a normal subgroup acting freely** (lemma, `normal-torsion-free-subgroup`; Bruinier–Funke proof of Thm. 3.7, p. 14). Every finite-index subgroup Γ ≤ SL₂(ℤ) contains a subgroup Γ″ of finite index in SL₂(ℤ), normal in SL₂(ℤ), that acts freely on ℍ; one may take Γ″ = Γ(3) ∩ core(Γ), where core(Γ) = ⋂_{g} gΓg^{−1} is the normal core and Γ(3) the principal congruence subgroup of level 3. Hypotheses: Γ of finite index in SL₂(ℤ).

- **Local ξ-preimages near a cusp** (lemma, `local-xi-preimage-at-cusps`; Bruinier–Funke proof of Thm. 3.7, p. 14). Let Γ ≤ SL₂(ℤ) have finite index, k ∈ ℤ, k ≠ 1, g ∈ M^!_{2−k}(Γ), σ ∈ SL₂(ℤ), h the width of σ^{−1}Γσ at ∞ and (g|_{2−k}σ)(τ) = Σ_{m≥−N} b(m)e(mτ/h). Then F_σ(τ) := Σ_{m≥1} −\overline{b(m)}(4πm/h)^{k−1}Γ(1−k, 4πmv/h)e(−mτ/h) + \overline{b(0)}(1−k)^{−1}v^{1−k} + Σ_{m=1}^{N}\overline{b(−m)}(2πm/h)^{k−1}ψ_m(τ), with ψ_m as in QM.3/nonholomorphic-fourier-basis-growing (weight k, width h), converges absolutely and locally uniformly on ℍ with all derivatives, is h-periodic and C^∞, satisfies Δ_k F_σ = 0, and ξ_k F_σ = g|_{2−k}σ on ℍ. Hypotheses: k ≠ 1 (the constant term needs (1 − k)^{−1}). No invariance beyond the translations T^h is claimed: F_σ is only used near the cusp.

- **ξ_k is surjective for a normal subgroup acting freely** (theorem `HarmonicMaassForm.xi_surjective_of_free`, `xi-surjective-free-normal`; Bruinier–Funke Thm. 3.7, p. 13). Let Γ″ ≤ SL₂(ℤ) be of finite index, normal in SL₂(ℤ) and acting freely on ℍ, and k ∈ ℤ, k ≠ 1. Then ξ_k : H_k(Γ″) → M^!_{2−k}(Γ″) is surjective (Bruinier–Funke Thm. 3.7 for Γ″, repaired at the cusps). Hypotheses: Γ″ acts freely on ℍ, so X = X(Γ″) is a compact Riemann surface with no elliptic points and the weight-k forms form a holomorphic line bundle L_k on X (holomorphic at the cusps); D = sum of the cusps.

- **Descent of ξ-preimages along a normal subgroup** (lemma, `xi-surjective-descent`; Bruinier–Funke proof of Thm. 3.7, p. 15). Let Γ″ ⊴ Γ be arithmetic subgroups with finite index [Γ : Γ″], k ∈ ℤ, and g ∈ M^!_{2−k}(Γ). If f″ ∈ H_k(Γ″) satisfies ξ_k f″ = g, then f := [Γ : Γ″]^{−1}Σ_{γ ∈ Γ″\Γ} f″|_kγ lies in H_k(Γ) and ξ_k f = g. Hypotheses: Γ″ normal in Γ, of finite index; Γ.HasDetOne.

- **Surjectivity of ξ_k (Bruinier–Funke Theorem 3.7)** (theorem `HarmonicMaassForm.xi_surjective`, `xi-surjective`; Bruinier–Funke Thm. 3.7, p. 13). Let Γ ≤ SL₂(ℤ) have finite index and k ∈ ℤ, k ≠ 1. Then ξ_k : H_k(Γ) → M^!_{2−k}(Γ) is surjective. Hypotheses: Finite index in SL₂(ℤ); k ≠ 1.

- **The exact sequences 0 → M^!_k → H_k → M^!_{2−k} → 0 and 0 → M^!_k → H_k^+ → S_{2−k} → 0** (theorem `HarmonicMaassForm.exact_sequences`, `bruinier-funke-exact-sequences`; Bruinier–Funke Cor. 3.8, p. 15). For Γ ≤ SL₂(ℤ) of finite index and k ∈ ℤ, k ≠ 1, the sequences 0 → M^!_k(Γ) → H_k(Γ) → M^!_{2−k}(Γ) → 0 and 0 → M^!_k(Γ) → H_k^+(Γ) → S_{2−k}(Γ) → 0 (the second map is ξ_k) are exact (Bruinier–Funke Cor. 3.8). Hypotheses: As in QM.3/xi-surjective. The maps are ℂ-linear (inclusion) and conjugate-linear (ξ_k); exactness is as sets/additive groups. Planet: Bruinier–Funke exact sequences.

- **Non-degeneracy of {·,·} on H_k^+/M^!_k × S_{2−k} (Bruinier–Funke Theorem 3.6)** (theorem `bruinierFunkePairing_nondegenerate`, `bruinier-funke-duality`; Bruinier–Funke Thm. 3.6, p. 13). For Γ ≤ SL₂(ℤ) of finite index and k ∈ ℤ, k ≠ 1: (a) if g ∈ S_{2−k}(Γ) and {g, f} = 0 for all f ∈ H_k^+(Γ) then g = 0; (b) if f ∈ H_k^+(Γ) and {g, f} = 0 for all g ∈ S_{2−k}(Γ) then f ∈ M^!_k(Γ). Hence {·,·} induces a perfect pairing between H_k^+(Γ)/M^!_k(Γ) and S_{2−k}(Γ) (finite-dimensional). Hypotheses: As before.

- **`bruinierFunkePairing'`** (definition, `bruinier-funke-negative-pairing`; Bruinier–Funke (3.15), p. 15). For Γ ≤ SL₂(ℤ) of finite index, k ∈ ℤ, k ≠ 1, g ∈ M_{2−k}(Γ) and f ∈ H_k^+(Γ): {g, f}′ := Σ_{c ∈ Γ\ℙ¹(ℚ)} h_c Σ_{n<0} a⁺_c(n)b_c(−n) (notation of QM.3/bruinier-funke-pairing-formula); for Γ = SL₂(ℤ), {g, f}′ = Σ_{n<0}a⁺(n)b(−n) (Bruinier–Funke (3.15)). It differs from {g, f} by the constant-term contribution Σ_c h_c a⁺_c(0)b_c(0). Hypotheses: Same data as the pairing formula. API: `bruinierFunkePairing'`, `bruinierFunkePairing'_eq_of_isCuspForm`, `bruinierFunkePairing_sub_bruinierFunkePairing'`. Unit tests: `bruinierFunkePairing'_cuspForm_test` (For g a cusp form, {g, f}′ = {g, f}); `bruinierFunkePairing'_const_test` (Level one, f ∈ M^!_k(SL₂(ℤ)) with principal part a(−1)q^{−1} + a(0), g ∈ M_{2−k}: {g, f}′ = a(−1)b(1)); `bruinierFunkePairing'_ne_test` (Level one, k = −10, g = E₁₂, f = Q(−1, 12, 1): {g, f} = 0 but {g, f}′ = b_{E₁₂}(1) = 65520/691 ≠ 0).

- **`weaklyHolomorphicPerp`** (definition, `weakly-holomorphic-constant-term-orthogonal`; Bruinier–Funke p. 15). For Γ ≤ SL₂(ℤ) of finite index and k ∈ ℤ: M^!!_k(Γ) := {f ∈ M^!_k(Γ) : Σ_c h_c a_c(0)b_c(0) = 0 for every g ∈ M_{2−k}(Γ)}, the weakly holomorphic forms whose constant terms are orthogonal to the constant terms of all holomorphic modular forms of weight 2 − k (Bruinier–Funke p. 15, scalar case). For f ∈ M^!!_k or g ∈ S_{2−k}: {g, f} = {g, f}′. Hypotheses: Finite-index Γ. API: `weaklyHolomorphicPerp`, `mem_weaklyHolomorphicPerp_iff`, `weaklyHolomorphicPerp_eq_of_neg`. Unit tests: `mem_weaklyHolomorphicPerp_j_test` (j = E₄³/Δ ∈ M^!!_0(SL₂(ℤ)) (M_2(SL₂(ℤ)) = 0) although its constant term is 744); `not_mem_weaklyHolomorphicPerp_test` (E₄/Δ ∈ M^!_{−8}(SL₂(ℤ)) has constant term 264 ≠ 0 (E₄/Δ = q^{−1} + 264 + O(q)), so it is not in M^!!_{−8}); `weaklyHolomorphicPerp_le_test` (M^!!_k(Γ) ≤ M^!_k(Γ); for k ≥ 3, M_{2−k}(Γ) = 0 and M^!!_k = M^!_k).

- **`PrincipalPartSpace`** (definition, `principal-part-residue-pairing`; Borcherds GKZ §3, p. 4). For Γ ≤ SL₂(ℤ) of finite index with cusp classes c (representatives σ_c, widths h_c): Sing(Γ) := ⊕_c ℂ[q_c^{−1}] (Laurent polynomials in q_c = e(τ/h_c) with non-positive exponents: possible principal parts including constant terms), PowSer(Γ) := ⊕_c ℂ[[q_c]], and the residue pairing ⟨F, P⟩ := Σ_c h_c Σ_{n≥0} F_c(n)P_c(−n) = Σ_c h_c Res_{q_c=0}(F_cP_c q_c^{−1}dq_c) (Borcherds, GKZ §3, scalar case). The maps λ : M^!_k(Γ) → Sing(Γ) (principal parts with constant terms at all cusps) and λ : M_{2−k}(Γ) → PowSer(Γ) (expansions at all cusps). Hypotheses: Scalar case of Borcherds' construction (ρ trivial); the factor h_c normalises the residue in the local parameter q_c. API: `PrincipalPartSpace`, `residuePairing`, `principalPartMap`, `residuePairing_principalPartMap_eq_zero`. Unit tests: `residuePairing_levelOne_test` (Level one: ⟨λ(E₄), T^{−1} + c⟩ = 240 + c); `residuePairing_weaklyHolomorphic_test` (For f ∈ M^!_k(Γ), g ∈ M_{2−k}(Γ): ⟨λ(g), λ(f)⟩ = 0 (residue theorem on X(Γ))); `residuePairing_zero_test` (⟨F, 0⟩ = 0 and ⟨0, P⟩ = 0).

- **Borcherds' obstruction theorem (Serre duality for principal parts)** (theorem `exists_weaklyHolomorphic_principalPart_iff`, `borcherds-obstruction-theorem`; Borcherds GKZ Thm. 3.1, p. 5). Let Γ ≤ SL₂(ℤ) have finite index and k ∈ ℤ. A principal part P ∈ Sing(Γ) is the principal part (with constant terms) of some f ∈ M^!_k(Γ) if and only if ⟨λ(g), P⟩ = 0 for every g ∈ M_{2−k}(Γ). Equivalently λ(M^!_k(Γ)) = λ(M_{2−k}(Γ))^⊥ and the obstruction space Sing(Γ)/λ(M^!_k(Γ)) is dual to M_{2−k}(Γ) (Borcherds, GKZ Theorem 3.1, scalar case with Borcherds' k replaced by 2 − k). Hypotheses: Scalar case; Γ of finite index in SL₂(ℤ).

- **Non-degeneracy of {·,·}′ (Bruinier–Funke Corollary 3.9)** (theorem `bruinierFunkePairing'_nondegenerate`, `bruinier-funke-duality-negative`; Bruinier–Funke Cor. 3.9, p. 15). For Γ ≤ SL₂(ℤ) of finite index and k ∈ ℤ, k ≠ 1, the pairing {·,·}′ induces non-degenerate pairings between H_k^+(Γ)/M^!!_k(Γ) and M_{2−k}(Γ), and between H_k^+(Γ)/M^!_k(Γ) and S_{2−k}(Γ). Hypotheses: As before.

- **Harmonic Maass forms with prescribed principal parts (Bruinier–Funke Prop. 3.11)** (theorem `HarmonicMaassForm.exists_principalPart`, `harmonic-maass-form-prescribed-principal-parts`; Bruinier–Funke Prop. 3.11, p. 16). Let Γ ≤ SL₂(ℤ) have finite index, k ∈ ℤ, k ≠ 1. For every family (Q_c)_c of Laurent polynomials in q_c^{−1} with only negative exponents, one per cusp class c, there is f ∈ H_k^+(Γ) whose principal part at every cusp c is Q_c + (a constant). If k < 0, f is unique (M_k(Γ) = 0 and constant principal parts force f ∈ M_k). For Γ = SL₂(ℤ) this is Bruinier–Funke Prop. 3.11; the all-cusps form is the one used in Bruinier–Ono–Rhoades' proof of Corollary 4.3 ('According to Lemma 3.11 of [7]'). Hypotheses: k ≠ 1; for uniqueness k < 0.


### 3E. Poincaré series

Scalar level N on Γ₀(N), even k ≥ 4; P(m, k, N) has weight k and Q(−m, k, N) weight 2 − k.

- **`kloostermanSum`** (definition, `classical-kloosterman-sum`; Bruinier–Ono–Rhoades (6.6), p. 15). For m, n ∈ ℤ and c ∈ ℕ, c ≥ 1: K(m, n, c) := Σ_{v ∈ (ℤ/cℤ)^×} e((m v̄ + n v)/c), where v v̄ ≡ 1 mod c (Bruinier–Ono–Rhoades (6.6)). This is the untwisted Kloosterman sum; it is not the eta-multiplier sum A_k(n) of Rademacher's formula (QM.2/kloosterman-sum-rademacher). Hypotheses: c ≥ 1; for c = 1 the sum has the single term v = 0 ∈ (ℤ/1)^× and K(m, n, 1) = 1. API: `kloostermanSum`, `kloostermanSum_comm`, `kloostermanSum_neg`, `kloostermanSum_zero_right`, `kloostermanSum_one`. Unit tests: `kloostermanSum_one_one_three_test` (K(1, 1, 3) = −1); `kloostermanSum_zero_zero_test` (K(0, 0, c) = φ(c) (Euler's totient) for c ≥ 1); `kloostermanSum_one_one_five_test` (K(1, 1, 5) = 2 + 2cos(4π/5) ≠ −1 = Σ_{v ∈ (ℤ/5)^×} e(2v/5): the inverse v̄ matters); `kloostermanSum_conj_test` (conj K(m, n, c) = K(m, n, c) (K is real)).

- **`holomorphicPoincareSeries`** (definition, `holomorphic-poincare-series`; Bruinier–Ono–Rhoades (6.4), (6.5), pp. 14–15). For N ≥ 1, an even integer k ≥ 4 and m ∈ ℤ: P(m, k, N; τ) := Σ_{A ∈ Γ∞\Γ₀(N)} (e(mτ)|_kA)(τ), Γ∞ = {±T^n}, i.e. Σ over coprime (c, d) with N | c modulo ±1 of (cτ + d)^{−k}e(m(aτ + b)/(cτ + d)) (Bruinier–Ono–Rhoades (6.4), (6.5) with φ_m(y) = e(imy) = e^{−2πmy}). The series converges absolutely and locally uniformly for k ≥ 3 when m ≥ 0 and for all m (poles are only at the cusps) because |e(mAτ)| ≤ e^{2π|m|Im Aτ} and Im Aτ ≤ 1/(c²v) for c ≠ 0. Hypotheses: k even (for odd k the terms for ±A cancel), k ≥ 4 (absolute convergence; BOR treat k = 2 by analytic continuation, not planned here). Normalisation: the identity coset contributes e(mτ). API: `holomorphicPoincareSeries`, `holomorphicPoincareSeries_summable`, `holomorphicPoincareSeries_slash`, `holomorphicPoincareSeries_toCuspForm`, `holomorphicPoincareSeries_toWeaklyHolomorphic`, `holomorphicPoincareSeries_zero_one`. Unit tests: `holomorphicPoincare_zero_levelOne_test` (P(0, k, 1) = ModularForm.E k for even k ≥ 4); `holomorphicPoincare_isCuspForm_test` (For m ≥ 1, P(m, k, N) vanishes at every cusp of Γ₀(N)); `holomorphicPoincare_neg_not_bounded_test` (For m ≥ 1, P(−m, k, N) is not bounded at ∞ (its expansion starts q^{−m})); `holomorphicPoincare_one_twelve_test` (P(1, 12, 1) = c·Δ with c ≠ 0 (S_12(SL₂(ℤ)) = ℂΔ and P(1, 12, 1) ≠ 0 since its pairing with Δ is non-zero)).

- **`maassPoincareSeries`** (definition, `maass-poincare-series`; Bruinier–Ono–Rhoades (6.7), p. 15). For N ≥ 1, even k ≥ 4 and m ≥ 1: Q(−m, k, N; τ) := Σ_{A ∈ Γ∞\Γ₀(N)} (ψ_m|_{2−k}A)(τ) with seed ψ_m(τ) := P(k−1, 4πmv)·e(−mτ), where P(s, x) = γ(s, x)/Γ(s) is Tau Ceti's TauCeti.regularizedGamma. The seed is Hejhal's M-Whittaker seed of Bruinier–Ono–Rhoades (6.7) in its intended normalisation: (1/(k−1)!)·M_{k/2}(−4πmv)e(−mu) with M_s(y) = |y|^{(k−2)/2}M_{(1−k/2)sgn y, s−1/2}(|y|) (DLMF 8.5.4 gives M_{(k−2)/2,(k−1)/2}(x) = (k−1)x^{1−k/2}e^{x/2}γ(k−1, x)); BOR print the weight-k normalisation, which is undefined here (sourceIssue E404). Equivalently ψ_m = e(−mτ) − Γ(k−1, 4πmv)e(−mτ)/(k−2)!, the sum of the holomorphic term q^{−m} and a decaying non-holomorphic basis function of weight 2 − k. Hypotheses: k even ≥ 4, m ≥ 1, N ≥ 1; weight of Q is 2 − k ≤ −2. The case k = 2 (weight 0, Rademacher-type sums, needing analytic continuation) is not part of this definition. API: `maassPoincareSeries`, `maassPoincareSeed`, `maassPoincareSeed_eq`, `maassPoincareSeries_summable`, `maassPoincareSeries_toHarmonic`. Unit tests: `maassPoincare_seed_test` (ψ_m(τ) = e(−mτ) − Γ(k−1, 4πmv)e(−mτ)/(k−2)! for every τ); `maassPoincare_mem_plusSpace_test` (Q(−m, k, N) underlies an element of H_{2−k}^+(Γ₀(N))); `maassPoincare_constant_term_test` (For N = 1, m = 1, k = 12 the holomorphic part has constant term −65520/691); `maassPoincare_not_weaklyHolomorphic_test` (Q(−m, k, N) is not holomorphic: ξ_{2−k}Q(−m, k, N) = (4πm)^{k−1}/(k−2)!·P(m, k, N) ≠ 0 whenever S_k(Γ₀(N)) ≠ 0 and P(m, k, N) ≠ 0 (e.g. N = 1, k = 12, m = 1)). Planet: Maass–Poincaré series.

- **Q(−m, k, N) is a harmonic Maass form in H_{2−k}^+** (theorem `maassPoincareSeries_mem_plusSpace`, `maass-poincare-series-harmonic`; Bruinier–Ono–Rhoades Prop. 6.2, p. 15). For N ≥ 1, even k ≥ 4, m ≥ 1: Q(−m, k, N) ∈ H_{2−k}^+(Γ₀(N)); its principal part at ∞ is q^{−m} + a constant, and at every cusp of Γ₀(N) inequivalent to ∞ its principal part is constant (Bruinier–Ono–Rhoades Prop. 6.2, first assertion). Hypotheses: As in QM.3/maass-poincare-series.

- **ξ_{2−k}Q(−m, k, N) = (4πm)^{k−1}/(k−2)!·P(m, k, N)** (theorem `xiOperator_maassPoincareSeries`, `xi-maass-poincare-series`; Bruinier–Ono–Rhoades §6.2, p. 16). For N ≥ 1, even k ≥ 4, m ≥ 1: ξ_{2−k}(Q(−m, k, N)) = ((4πm)^{k−1}/(k−2)!)·P(m, k, N) (Bruinier–Ono–Rhoades §6.2). Hypotheses: As in QM.3/maass-poincare-series.

- **The vertical-line integral for J_ν** (lemma, `bessel-j-bromwich-integral`; DLMF §10.9(ii), equation 10.9.19). For real x > 0, real c > 0 and ν ∈ ℂ with Re ν > 0: J_ν(x) = (x/2)^ν·(1/(2π))∫_{−∞}^{∞}(c + iy)^{−ν−1}exp(c + iy − x²/(4(c + iy)))dy, i.e. J_ν(x) = (x/2)^ν(1/(2πi))∫_{c−i∞}^{c+i∞}t^{−ν−1}exp(t − x²/(4t))dt, the integral converging absolutely (t^{−ν−1} the principal power). This is the vertical-line form of Schläfli's loop integral (DLMF 10.9.19) and the J-analogue of QM.2/modified-bessel-i-bromwich-integral. Hypotheses: x > 0, c > 0, Re ν > 0.

- **Fourier coefficients of holomorphic Poincaré series** (theorem `holomorphicPoincareSeries_eq_tsum`, `holomorphic-poincare-series-fourier-expansion`; Bruinier–Ono–Rhoades Prop. 6.1, p. 15). For even k ≥ 4 and m, N ≥ 1: P(m, k, N) = q^m + Σ_{n≥1} a(m, k, N; n)q^n with a(m, k, N; n) = 2π(−1)^{k/2}(n/m)^{(k−1)/2} Σ_{c>0, N|c} K(m, n, c)/c · J_{k−1}(4π√(mn)/c) for n ≥ 1 (the q^m term included in the n = m term by the Kronecker delta convention of BOR (6.5)); and P(−m, k, N) = q^{−m} + Σ_{n≥1} a(−m, k, N; n)q^n with a(−m, k, N; n) = 2π(−1)^{k/2}(n/m)^{(k−1)/2}Σ_{c>0, N|c} K(−m, n, c)/c · I_{k−1}(4π√(mn)/c) (Bruinier–Ono–Rhoades Prop. 6.1). Hypotheses: k even ≥ 4, m ≥ 1, N ≥ 1; J_ν = QM.2/bessel-function-j, I_ν = QM.2/modified-bessel-function-i; a(±m, k, N; n) real.

- **Fourier expansion of Maass–Poincaré series** (theorem `maassPoincareSeries_coeff`, `maass-poincare-series-fourier-expansion`; Bruinier–Ono–Rhoades Prop. 6.2, p. 16). For even k ≥ 4 and m, N ≥ 1: Q(−m, k, N) = Q⁺ + Q⁻ with Q⁻ = −Γ(k−1, 4πmv)q^{−m}/(k−2)! + Σ_{n<0} b(n)Γ(k−1, 4π|n|v)q^n and Q⁺ = q^{−m} + Σ_{n≥0} b(n)q^n, where for n < 0: b(n) = −2π(−1)^{k/2}/(k−2)!·|m/n|^{(k−1)/2}Σ_{c>0, N|c} K(−m, n, c)/c·J_{k−1}(4π√|mn|/c); b(0) = −(2π)^k(−1)^{k/2}m^{k−1}/(k−1)!·Σ_{c>0, N|c} K(−m, 0, c)/c^k; for n > 0: b(n) = −2π(−1)^{k/2}(m/n)^{(k−1)/2}Σ_{c>0, N|c} K(−m, n, c)/c·I_{k−1}(4π√(mn)/c) (Bruinier–Ono–Rhoades Prop. 6.2). Hypotheses: As in QM.3/maass-poincare-series; J_ν, I_ν as in QM.3/holomorphic-poincare-series-fourier-expansion; the Kronecker-delta convention of BOR (6.5) puts the seed coefficients into the terms n = −m and n = m.

- **H_{2−k}^+(SL₂(ℤ)) is spanned by Maass–Poincaré series** (theorem `mem_span_maassPoincareSeries`, `level-one-plus-space-spanned-by-poincare-series`; Bruinier–Funke Remark 3.10, p. 15). For even k ≥ 4: every f ∈ H_{2−k}^+(SL₂(ℤ)) is a finite linear combination Σ_{m=1}^{M} a⁺(−m)·Q(−m, k, 1) of Maass–Poincaré series (a⁺ its holomorphic coefficients). In particular f is determined by its principal part without constant term, and M^!_{2−k}(SL₂(ℤ)) ⊆ span{Q(−m, k, 1)} (Bruinier–Funke Remark 3.10, scalar level one). Hypotheses: Level one; weight 2 − k ≤ −2.

- **S_k(SL₂(ℤ)) is spanned by holomorphic Poincaré series** (theorem `span_holomorphicPoincareSeries`, `level-one-cusp-forms-spanned-by-poincare-series`; Bruinier–Funke Remark 3.10, p. 15). For even k ≥ 4, S_k(SL₂(ℤ)) is spanned by {P(m, k, 1) : m ≥ 1}. Hypotheses: Level one, k even ≥ 4.


### 3F. The Bol operator, regularized products and E₂*

- **D^{k−1} maps H_{2−k}^+ to weakly holomorphic forms (Bruinier–Ono–Rhoades Theorem 1.1)** (theorem `qDeriv_iterate_mem`, `flipping-derivative-theorem`; Bruinier–Ono–Rhoades Theorem 1.1, p. 2). Let Γ ≤ SL₂(ℤ) have finite index, k ≥ 2 an integer and f ∈ H_{2−k}^+(Γ). Then D^{k−1}f ∈ M^!_k(Γ) (D = (2πi)^{−1}∂_τ), and at ∞ (width h) D^{k−1}f = D^{k−1}f⁺ = Σ_{n≫−∞} a⁺(n)(n/h)^{k−1}e(nτ/h); for h = 1 this is Σ a⁺(n)n^{k−1}q^n. Hypotheses: k ≥ 2; BOR state it for Γ₀(N) with character; the proof is the same for finite-index Γ.

- **D^{k−1}Q(−m, k, N) = −m^{k−1}P(−m, k, N)** (theorem `qDeriv_iterate_maassPoincareSeries`, `bol-image-of-maass-poincare-series`; Bruinier–Ono–Rhoades (6.8), p. 16). For even k ≥ 4 and m, N ≥ 1: D^{k−1}Q(−m, k, N) = −m^{k−1}·P(−m, k, N) (Bruinier–Ono–Rhoades (6.8)). Hypotheses: As in QM.3/maass-poincare-series.

- **`regularizedPetersson`** (definition, `regularized-petersson-product`; Bruinier–Ono–Rhoades §4, p. 9). Let Γ ≤ SL₂(ℤ) have finite index and k ∈ ℤ. For g ∈ M_k(Γ) and h ∈ M^!_k(Γ) with vanishing constant term at every cusp: (g, h)^{reg} := [SL₂(ℤ) : Γ]^{−1}·lim_{T→∞} ∫_{F_T(Γ)} g(τ)\overline{h(τ)}v^k dμ, where F_T(Γ) = ⋃_{γ ∈ Γ\SL₂(ℤ)} γF_T and F_T is the truncated standard fundamental domain. This is Borcherds' regularization (constant term at s = 0 of the continuation in s) in the case where no continuation is needed (Bruinier–Ono–Rhoades §4, Remark 8); it reduces to the normalised Petersson product for cusp forms. Hypotheses: h has vanishing constant term at every cusp (otherwise the limit need not exist and Borcherds' meromorphic continuation in s is required; that general regularization is not planned here). Normalisation: divided by the index [SL₂(ℤ) : Γ] (BOR), unlike QM.3/bruinier-funke-pairing. API: `regularizedPetersson`, `regularizedPetersson_tendsto`, `regularizedPetersson_eq_of_isCuspForm`. Unit tests: `regularizedPetersson_cuspForm_test` (For g, h ∈ S_k(Γ) the regularized product equals the (index-normalised) Petersson product); `regularizedPetersson_zero_test` ((g, 0)^{reg} = 0); `regularizedPetersson_bol_test` (Level one, k = 12: (Δ, D^{11}Q(−1, 12, 1))^{reg} = 0 (QM.3/regularized-pairing-with-bol-image with vanishing cusp-form constant term)); `regularizedPetersson_ne_test` (For g = h = E₁₂ (constant term 1) the truncated integrals ∫_{F_T}|E₁₂|²v^{12}dμ grow like T^{11}/11: the hypothesis on constant terms cannot be dropped).

- **(g, R^{k−1}_{2−k}f)^{reg} via constant terms (Bruinier–Ono–Rhoades Theorem 4.1, corrected)** (theorem `regularizedPetersson_iteratedRaising`, `regularized-pairing-with-bol-image`; Bruinier–Ono–Rhoades Theorem 4.1, p. 9). Let Γ ≤ SL₂(ℤ) have finite index, k ≥ 2, g ∈ M_k(Γ), f ∈ H_{2−k}^+(Γ). Then (g, R^{k−1}_{2−k}f)^{reg} = ((−1)^k(k−2)!/[SL₂(ℤ) : Γ])·Σ_{κ ∈ Γ\ℙ¹(ℚ)} w_κ·c_g(0, κ)·\overline{c⁺_f(0, κ)}, where c_g(0, κ), c⁺_f(0, κ) are the constant terms at the cusp κ and w_κ its width. BOR print the formula without the factor (k−2)! (sourceIssue E408). In particular (g, D^{k−1}f)^{reg} = 0 for cusp forms g (Bruinier–Ono–Rhoades Cor. 4.2). Hypotheses: k ≥ 2; h := R^{k−1}_{2−k}f = (−4π)^{k−1}D^{k−1}f ∈ M^!_k has vanishing constant terms (coefficients a⁺(n)(−4πn)^{k−1}), so the truncated product is defined.

- **The image of D^{k−1} on H_{2−k}^+ (Bruinier–Ono–Rhoades Theorem 1.2 / Corollary 4.3)** (theorem `exists_qDeriv_iterate_eq_iff`, `image-of-bol-operator`; Bruinier–Ono–Rhoades Cor. 4.3, p. 10). Let Γ ≤ SL₂(ℤ) have finite index and k ≥ 2. The image of D^{k−1} : H_{2−k}^+(Γ) → M^!_k(Γ) consists exactly of those h ∈ M^!_k(Γ) with vanishing constant term at every cusp and (g, h)^{reg} = 0 for all g ∈ S_k(Γ). Hypotheses: k ≥ 2; Γ of finite index.

- **`e2Star`** (construction, `nonholomorphic-eisenstein-series-e2-star`; Bruinier–Funke §3, p. 9). E₂*(τ) := E₂(τ) − 3/(πv), with Mathlib's E₂ = EisensteinSeries.E2 (= 1 − 24Σσ₁(n)q^n). It is SL₂(ℤ)-invariant of weight 2, harmonic (Δ_2(v^{−1}) = 0), of moderate growth, hence E₂* ∈ H_2(SL₂(ℤ)), and ξ_2E₂* = 3/π. Since 3/π is not a cusp form, E₂* ∉ H_2^+(SL₂(ℤ)). Hypotheses: Level one, weight 2 (the case k ≥ 2 of the first exact sequence, where ξ_2 maps onto M^!_0). API: `e2Star`, `e2Star_slash`, `e2StarHarmonic`, `xiOperator_e2Star`, `e2Star_not_mem_plusSpace`. Unit tests: `e2Star_slash_test` (E₂*|_2γ = E₂* for every γ ∈ SL₂(ℤ)); `e2Star_i_test` (E₂*(i) = 0, i.e. E₂(i) = 3/π); `e2Star_ne_E2_test` (E₂* ≠ E₂ and E₂ itself is not SL₂(ℤ)-invariant of weight 2); `xi_e2Star_const_test` (ξ_2(E₂*) = 3/π, the ξ-image of −(3/π)v^{−1}).

### Dependencies

Inside the roadmap: `QSeriesPartitionsAndMockModularForms:QM.2` (nodes `QM.2/bessel-function-j`,
`QM.2/modified-bessel-function-i`, `QM.2/modified-bessel-i-bromwich-integral` and
`QM.2/bromwich-integral-reciprocal-gamma`, for the Fourier coefficients of Poincaré series). The
layer's outputs feed `QSeriesPartitionsAndMockModularForms:QM.4` (the operators Δ_k and ξ_k in
weight 1/2, the upper incomplete gamma function behind Zwegers' β), QM.5 (the upper incomplete
gamma function of the non-holomorphic Eichler integral) and QM.6 (weakly holomorphic forms: QM.6's
level-one weight-0 modular functions are the case Γ = SL₂(ℤ), k = 0 of
`QM.3/weakly-holomorphic-modular-form`).

From Tau Ceti's ModularForms roadmap (upstream prerequisites of `QM.3/xi-surjective-free-normal`
and `QM.3/borcherds-obstruction-theorem`, with requests recorded): layer 10A (the compact modular
curve X(Γ″) as a compact Riemann surface with its cusp charts and cusp divisor D), layer 10B
(Dolbeault's theorem for holomorphic line bundles, Serre duality for invertible sheaves with the
residue pairing, and the Mittag-Leffler obstruction for prescribed principal parts) and layer 10C
(the automorphy line bundles L_k on X(Γ″) for every integer k, Ω ≅ L₂ ⊗ O(−D), and the valence
bound H⁰(X, L_κ ⊗ O(−nD)) = 0 for n > κ[PSL₂(ℤ) : Γ̄″]/12).

Mistakes found in the sources (recorded as source issues): Bruinier–Funke Lemma 3.1 has a factor
−2v^{2−k} for −v^{2−k} (known, corrected by Bruinier–Ono–Rhoades); the proof of their Theorem 3.7
drops a factor 2 in ξ_k f = 2g and uses a form iv^{−k}ḡ dτ̄ that is not smooth at the cusps
(repaired here by explicit local ξ-preimages at the cusps and Dolbeault for compactly supported
data); their H(w) for w > 0 depends on a branch; Corollary 3.9 is left to the reader (supplied
through Borcherds' theorem); Bruinier–Ono–Rhoades (6.7) print the Whittaker seed in the weight-k
normalisation, their Theorem 4.1 lacks the factor (k − 2)!, and the constant term of their
example Q⁺(−1, 12, 1) is −65520/691, not −0.04629.

### Acceptance tests

- **Harmonicity and shadows of the basis functions.** Δ_k(v^{1−k}) = 0 and ξ_k(v^{1−k}) = 1 − k;
  for n < 0, ξ_k(Γ(1 − k, 4π|n|v)e(nτ)) = −(4π|n|)^{1−k}e(−nτ) and
  L_k(Γ(1 − k, 4π|n|v)e(nτ)) = −v^{2−k}(4π|n|)^{1−k}e(nτ̄) (the constant of Bruinier–Funke Lemma 3.1
  is wrong by a factor 2).
- **E₂*.** E₂* = E₂ − 3/(πv) is SL₂(ℤ)-invariant of weight 2, Δ₂-harmonic, ξ₂E₂* = 3/π, so
  E₂* ∈ H₂(SL₂(ℤ)) but E₂* ∉ H₂^+(SL₂(ℤ)); E₂*(i) = 0.
- **Exactness.** ξ_k : H_k^+(Γ) → S_{2−k}(Γ) is surjective with kernel M^!_k(Γ), for every
  finite-index Γ ≤ SL₂(ℤ) and k ≠ 1; for k ≥ 2, H_k^+(Γ) = M^!_k(Γ).
- **The pairing depends only on principal parts.** For g ∈ S_k(SL₂(ℤ)) with coefficients b(n),
  {g, Q(−m, k, 1)} = b(m); for g = E₁₂ and f = Q(−1, 12, 1), {g, f} = 0 while
  {g, f}′ = 65520/691.
- **Maass–Poincaré series.** Q(−1, 12, 1) has holomorphic part q^{−1} − 65520/691 − 1842.89472q −
  23274.07545q² − 225028.75877q³ − ⋯, with non-holomorphic part −Γ(11, 4πv)q^{−1}/10! + ⋯ and
  ξ_{−10}Q(−1, 12, 1) = (4π)^{11}/10!·P(1, 12, 1), a non-zero multiple of Δ (the ratios of the
  Kloosterman–Bessel coefficients of P(1, 12, 1) reproduce τ(2) = −24 and τ(3) = 252).
- **Bol operator.** D^{11}Q(−1, 12, 1) = −P(−1, 12, 1) is a weakly holomorphic form of weight 12
  with vanishing constant term and regularized product 0 with Δ.
- **Kloosterman sums.** K(1, 1, 3) = −1, K(0, 0, c) = φ(c), K(1, 1, 5) = 2 + 2cos(4π/5).

---

## QM.4 Mock modular completions

This layer builds Zwegers' theory of mock theta functions: the error function E(x) = erf(√π x)
and β(x) = π^{−1/2}Γ(1/2, πx); the Mordell integral h(z; τ) with its functional equations and
modular transformations; the Appell–Lerch sum μ(u, v; τ) with its elliptic and modular
transformation laws (Zwegers Props. 1.4, 1.5); the non-holomorphic correction R(u; τ) (Lemma 1.8,
Props. 1.9, 1.10) and the completion μ̃ = μ + (i/2)R, which transforms like a two-variable Jacobi
form of weight 1/2 (Theorem 1.11); the weight-3/2 unary theta functions g_{a,b} and the
expressions of R and h as period integrals of them (Theorem 1.16); Zwegers' indefinite theta
functions ϑ^{c₁,c₂} for quadratic forms of type (r − 1, 1), their convergence, elliptic and
modular transformation laws and O_A^+(ℤ)-invariance (Chapter 2); the Fourier coefficients of
meromorphic Jacobi forms through the completed level-m Appell functions f̃_u (Chapter 3, Theorem
3.9, Corollary 3.10, Proposition 3.11); and the non-holomorphic unary theta functions R_{a,b},
whose ξ_{1/2}-images are the unary theta functions g_{a,b}. The worked mock series is the vector
F₇ of Ramanujan's seventh-order mock theta functions: F₇ = H₇ + G₇ with H₇ a real-analytic
vector-valued modular form of weight 1/2 for SL₂(ℤ) (Proposition 4.5), shadow
ξ_{1/2}H₇ = −√42·g₇ with g₇ a vector of weight-3/2 unary theta functions, and the
non-modularity of F₇ as a period integral of g₇ (Corollary 4.6).

Source: S. P. Zwegers, *Mock Theta Functions*, PhD thesis, Utrecht 2002 (arXiv:0807.4834v1),
Chapters 1–3 and Chapter 4 §§4.1–4.3 (page numbers are those printed in the thesis).

### What Mathlib and Tau Ceti already provide (consume; never restate)

- **Theta and eta (Mathlib).** `jacobiTheta₂_term`, the derivative `jacobiTheta₂'` with
  `jacobiTheta₂'_functional_equation` (the two-variable theta function and its modular law, which
  QM.1 uses for Zwegers' ϑ); `ModularForm.eta` with `ModularForm.eta_ne_zero` and
  `ModularForm.eta_comp_eq_csqrt_I_inv` (η(−1/τ) = √(−iτ)η(τ)); the analytic pentagonal number
  theorem `eulerFunction_eq_tprod`, `eulerFunction_eq_tsum_pentagonal`; `HasProd`, `Multipliable`.
- **Integrals (Mathlib).** Gaussian integrals `integral_cexp_quadratic` and
  `GaussianFourier.integral_cexp_neg_mul_sq_norm_add`, `Real.Gamma_one_half_eq`,
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `hasSum_fourier_series_of_summable`;
  `Real.cosh`, `Complex.cosh`; Liouville's theorem `Differentiable.apply_eq_apply_of_bounded`.
- **Linear algebra (Mathlib).** `Matrix.IsSymm`, `Matrix.PosDef`, `Matrix.det`, `QuadraticMap`.
- **Error function (Tau Ceti).** `TauCeti.Real.erf` with `TauCeti.Real.erf_neg`,
  `TauCeti.Real.hasDerivAt_erf`, `TauCeti.Real.tendsto_erf_atTop`, `TauCeti.Real.tendsto_erf_atBot`,
  and `TauCeti.Real.erfc`.

Neither library has an indefinite theta series, an Appell–Lerch sum, a Mordell integral, a
correction term of a mock modular form, or a completion; no complex error function is needed,
because every use of E in the thesis is at real arguments.

### Conventions

- **Variables.** Functions of (z; τ) in Zwegers' order, τ ∈ ℍ, y = Im τ, e(x) = e^{2πix},
  q = e(τ), ζ_N = e^{2πi/N}; (−iτ)^s is the principal power. "u ∉ ℤτ + ℤ" is a standing
  hypothesis for μ.
- **Theta functions.** ϑ(z; τ) = Σ_{ν∈½+ℤ} e^{πiν²τ + 2πiν(z+½)} is QM.1's Zwegers normalisation
  (QM.1/jacobi-theta-function; the classical ϑ₁ is −iϑ), with the elliptic law, zeros, triple
  product, derivative ϑ′(0) = −2πη³ and modular law with multiplier v_η³ from QM.1;
  ϑ_{m,l}(z; τ) = Σ_{λ≡l (2m)} q^{λ²/4m}e^{2πiλz} is QM.1/jacobi-theta-index.
- **The eta multiplier** v(γ) of QM.1/dedekind-eta-multiplier enters Theorem 1.11 only through
  v(γ)^{−3}(cτ + d)^{1/2} = (cτ + d)²(η(τ)/η(γτ))³.
- **Quadratic forms of type (r − 1, 1).** A ∈ M_r(ℤ) symmetric with det A ≠ 0, Q(x) = ½⟨x, Ax⟩,
  B(x, y) = ⟨x, Ay⟩, and a chosen c₀ with Q(c₀) < 0 selecting the component C_Q of the negative
  cone; the S-transformation sums over A^{−1}ℤ^r/ℤ^r.
- **Operators.** ξ_{1/2} and Δ_{1/2} are QM.3's operators in weight 1/2 (real weight is allowed
  there); Zwegers' Casimir operator is Ω_{1/2} = Δ_{1/2} + 3/16.

### 4A. The error function E and β

- **`zwegersE`** (definition, `zwegers-error-function`; Zwegers Def. 1.6, p. 11). For x ∈ ℝ, E(x) := 2∫_0^x e^{−πu²}du = erf(√π·x), where erf = TauCeti.Real.erf. E is odd, increasing, E(x) → ±1 as x → ±∞, E′(x) = 2e^{−πx²}, and E(x) = Σ_{n≥0}(−π)^n x^{2n+1}/(n!(n + 1/2)) (Zwegers Def. 1.6). Zwegers defines E as an entire function of z ∈ ℂ, but every use in the thesis (R, R_{m,l}, ρ^c) evaluates it at real arguments, so the real function is the object built here. Hypotheses: Real variable only; the entire extension is not needed by any node. API: `zwegersE`, `zwegersE_eq_erf`, `zwegersE_neg`, `hasDerivAt_zwegersE`, `abs_zwegersE_lt_one`, `tendsto_zwegersE_atTop`. Unit tests: `zwegersE_zero_test` (E(0) = 0); `zwegersE_eq_erf_test` (E(x) = TauCeti.Real.erf(√π·x) for all real x); `zwegersE_deriv_test` (E′(0) = 2 (a definition with erf(x) instead of erf(√π x) would give 2/√π)); `zwegersE_tendsto_test` (E(x) → 1 as x → +∞ and E(x) → −1 as x → −∞).

- **`zwegersBeta`** (definition, `zwegers-beta-function`; Zwegers Lemma 1.7, p. 11). For x ≥ 0, β(x) := ∫_x^∞ u^{−1/2}e^{−πu}du = π^{−1/2}Γ(1/2, πx) = erfc(√(πx)) (Zwegers Lemma 1.7), with Γ(s, x) the upper incomplete gamma function (QM.3/upper-incomplete-gamma). It satisfies β(0) = 1, 0 ≤ β(x) ≤ e^{−πx}, β decreasing, β′(x) = −x^{−1/2}e^{−πx} for x > 0. Hypotheses: x ≥ 0 (β(0) = 1 via Γ(1/2) = √π); totalised by β(x) := 1 for x < 0 is not used. API: `zwegersBeta`, `zwegersBeta_eq_upperIncompleteGamma`, `zwegersBeta_eq_erfc`, `zwegersBeta_le_exp`, `tendsto_zwegersBeta_atTop`. Unit tests: `zwegersBeta_zero_test` (β(0) = 1); `zwegersBeta_eq_erfc_test` (β(x) = TauCeti.Real.erfc(√(πx)) for x ≥ 0); `zwegersBeta_le_exp_test` (0 ≤ β(x) ≤ e^{−πx} for x ≥ 0); `zwegersBeta_ne_upper_gamma_test` (β(1) = π^{−1/2}Γ(1/2, π) ≠ Γ(1/2, 1): the argument is scaled by π).

- **E(x) = sgn(x)(1 − β(x²)) (Zwegers Lemma 1.7)** (lemma `zwegersE_eq_sign_mul`, `error-function-sign-beta`; Zwegers Lemma 1.7, p. 11). For every real x: E(x) = sgn(x)·(1 − β(x²)). Hypotheses: sgn(0) = 0, consistent with E(0) = 0.


### 4B. The Mordell integral

- **`mordellIntegral`** (definition, `mordell-integral`; Zwegers Def. 1.1, p. 6). For z ∈ ℂ and τ ∈ ℍ, h(z; τ) := ∫_ℝ e^{πiτx² − 2πzx}/cosh(πx) dx (Zwegers Def. 1.1). The integral converges absolutely (|e^{πiτx²}| = e^{−πyx²}) and h is entire in z and holomorphic in τ. Hypotheses: τ ∈ ℍ; z ∈ ℂ arbitrary. API: `mordellIntegral`, `mordellIntegral_neg`, `differentiable_mordellIntegral`, `mordellIntegral_integrable`. Unit tests: `mordellIntegral_neg_test` (h(−z; τ) = h(z; τ)); `mordellIntegral_shift_test` (h(z; τ) + h(z + 1; τ) = (−iτ)^{−1/2}·2e^{πi(z+1/2)²/τ} (principal branch)); `mordellIntegral_zero_i_pos_test` (h(0; i) is real and positive); `mordellIntegral_not_periodic_test` (h is not 1-periodic in z: h(0; i) + h(1; i) = 2e^{π/4} while 0 < h(0; i) ≤ ∫e^{−πx²}dx = 1 < e^{π/4}, so h(1; i) ≠ h(0; i)).

- **h(z) + h(z + 1) = 2(−iτ)^{−1/2}e^{πi(z+1/2)²/τ} (Zwegers Prop. 1.2(1))** (lemma, `mordell-integral-translation-one`; Zwegers Prop. 1.2(1), p. 6). For τ ∈ ℍ, z ∈ ℂ: h(z; τ) + h(z + 1; τ) = (2/√(−iτ))·e^{πi(z + 1/2)²/τ}, with the principal branch of the square root (Re √(−iτ) > 0). Hypotheses: √(−iτ) principal (−iτ has positive real part).

- **h(z) + e^{−2πiz−πiτ}h(z + τ) = 2e^{−πiz−πiτ/4} (Zwegers Prop. 1.2(2))** (lemma, `mordell-integral-translation-tau`; Zwegers Prop. 1.2(2), p. 6). For τ ∈ ℍ, z ∈ ℂ: h(z) + e^{−2πiz − πiτ}h(z + τ) = 2e^{−πiz − πiτ/4}. Hypotheses: τ ∈ ℍ.

- **Uniqueness of solutions of the two functional equations (Zwegers Prop. 1.2(3))** (lemma, `mordell-integral-uniqueness`; Zwegers Prop. 1.2(3), p. 6). For fixed τ ∈ ℍ, z ↦ h(z; τ) is the unique holomorphic function f on ℂ with f(z) + f(z + 1) = 2(−iτ)^{−1/2}e^{πi(z+1/2)²/τ} and f(z) + e^{−2πiz−πiτ}f(z + τ) = 2e^{−πiz−πiτ/4} for all z. Hypotheses: τ ∈ ℍ fixed.

- **h(z/τ; −1/τ) = √(−iτ)e^{−πiz²/τ}h(z; τ) (Zwegers Prop. 1.2(5))** (theorem `mordellIntegral_S`, `mordell-integral-s-transformation`; Zwegers Prop. 1.2(5), p. 6). For τ ∈ ℍ, z ∈ ℂ: h(z/τ; −1/τ) = √(−iτ)·e^{−πiz²/τ}·h(z; τ). Hypotheses: Principal square root.

- **The τ ↦ τ + 1 relation for h (Zwegers Prop. 1.2(6))** (lemma, `mordell-integral-t-transformation`; Zwegers Prop. 1.2(6), p. 6). For τ ∈ ℍ, z ∈ ℂ: h(z; τ) = e^{πi/4}h(z; τ + 1) + (e^{−πi/4}/√(τ + 1))·e^{πiz²/(τ+1)}·h(z/(τ + 1); τ/(τ + 1)). Hypotheses: Principal square root of τ + 1 ∈ ℍ.


### 4C. The Appell–Lerch sum

Zwegers' ϑ and Proposition 1.3 are QM.1's; this layer adds only the transformation of ϑ′(0) (Proposition 1.3(9)).

- **Transformations of ϑ′(0; τ) (Zwegers Prop. 1.3(9))** (lemma `deriv_zwegersTheta_zero_transform`, `odd-theta-derivative-transformations`; Zwegers Prop. 1.3(9), p. 8). ϑ′(0; τ + 1) = e^{πi/4}ϑ′(0; τ) and ϑ′(0; −1/τ) = (−iτ)^{3/2}ϑ′(0; τ), with ′ = ∂/∂z. Hypotheses: Principal branch for (−iτ)^{3/2}.

- **`appellLerch`** (definition, `appell-lerch-sum`; Zwegers Prop. 1.4, p. 8). For τ ∈ ℍ and u, v ∈ ℂ \ (ℤτ + ℤ): μ(u, v; τ) := (e^{πiu}/ϑ(v; τ))·Σ_{n∈ℤ} (−1)^n e^{πi(n²+n)τ + 2πinv}/(1 − e^{2πinτ + 2πiu}) (Zwegers Prop. 1.4, the normalised Lerch sum). The series converges absolutely and locally uniformly on u ∉ ℤτ + ℤ (the numerator decays like e^{−πn²y}); as a function of u it is meromorphic with simple poles at ℤτ + ℤ. Hypotheses: u, v ∉ ℤτ + ℤ (ϑ(v) ≠ 0 by QM.1/jacobi-theta-zeros); junk value 0 elsewhere in the Lean definition. API: `appellLerch`, `appellLerch_summable`, `oddJacobiTheta_mul_appellLerch`, `meromorphic_appellLerch`. Unit tests: `appellLerch_symm_test` (μ(u, v; τ) = μ(v, u; τ) for u, v ∉ ℤτ + ℤ); `appellLerch_residue_test` (lim_{u→0} u·μ(u, v; τ) = −1/(2πi ϑ(v; τ))); `appellLerch_neg_test` (μ(−u, −v) = μ(u, v)); `appellLerch_not_elliptic_test` (μ(u + τ, v) ≠ −e^{2πi(u−v)+πiτ}μ(u, v) in general: by Prop. 1.4(3) the defect is −ie^{−πi(u−v)−πiτ/4}·e^{2πi(u−v)+πiτ} ≠ 0; only μ̃ is elliptic). Planet: Appell–Lerch sum μ(u, v; τ).

- **μ(u + 1, v) = −μ(u, v) (Zwegers Prop. 1.4(1))** (lemma, `appell-lerch-translation-u-one`; Zwegers Prop. 1.4(1), p. 8). μ(u + 1, v; τ) = −μ(u, v; τ). Hypotheses: u, v ∉ ℤτ + ℤ.

- **μ(u, v + 1) = −μ(u, v) (Zwegers Prop. 1.4(2))** (lemma, `appell-lerch-translation-v-one`; Zwegers Prop. 1.4(2), p. 9). μ(u, v + 1; τ) = −μ(u, v; τ). Hypotheses: u, v ∉ ℤτ + ℤ.

- **μ(u, v) + e^{−2πi(u−v)−πiτ}μ(u + τ, v) = −ie^{−πi(u−v)−πiτ/4} (Zwegers Prop. 1.4(3))** (lemma `appellLerch_add_tau`, `appell-lerch-translation-tau`; Zwegers Prop. 1.4(3), p. 9). For u, v, u + τ ∉ ℤτ + ℤ: μ(u, v) + e^{−2πi(u−v)−πiτ}μ(u + τ, v) = −i e^{−πi(u−v)−πiτ/4}. Hypotheses: u, v ∉ ℤτ + ℤ.

- **μ(u + τ, v + τ) = μ(u, v) (Zwegers Prop. 1.4(4))** (lemma, `appell-lerch-diagonal-translation`; Zwegers Prop. 1.4(4), p. 9). μ(u + τ, v + τ) = μ(u, v). Hypotheses: u, v ∉ ℤτ + ℤ.

- **μ(−u, −v) = μ(u, v) (Zwegers Prop. 1.4(5))** (lemma, `appell-lerch-negation`; Zwegers Prop. 1.4(5), p. 9). μ(−u, −v) = μ(u, v). Hypotheses: u, v ∉ ℤτ + ℤ.

- **Poles and residue of μ (Zwegers Prop. 1.4(6))** (lemma, `appell-lerch-poles`; Zwegers Prop. 1.4(6), p. 9). u ↦ μ(u, v) is meromorphic with simple poles exactly at u = nτ + m (n, m ∈ ℤ), and Res_{u=0}μ(u, v) = −1/(2πi ϑ(v)). Hypotheses: v ∉ ℤτ + ℤ.

- **μ(u + z, v + z) − μ(u, v) as a theta quotient (Zwegers Prop. 1.4(7))** (lemma `appellLerch_add_sub`, `appell-lerch-difference-formula`; Zwegers Prop. 1.4(7), p. 9). For u, v, u + z, v + z ∉ ℤτ + ℤ: μ(u + z, v + z) − μ(u, v) = (1/2πi)·ϑ′(0)ϑ(u + v + z)ϑ(z)/(ϑ(u)ϑ(v)ϑ(u + z)ϑ(v + z)). Hypotheses: As stated.

- **μ(v, u) = μ(u, v) (Zwegers Prop. 1.4(8))** (lemma, `appell-lerch-symmetry`; Zwegers Prop. 1.4(8), p. 9). μ(v, u) = μ(u, v). Hypotheses: u, v ∉ ℤτ + ℤ.

- **μ(u, v; τ + 1) = e^{−πi/4}μ(u, v; τ) (Zwegers Prop. 1.5(1))** (lemma, `appell-lerch-t-transformation`; Zwegers Prop. 1.5(1), p. 11). μ(u, v; τ + 1) = e^{−πi/4}μ(u, v; τ).

- **S-transformation of μ with the Mordell integral (Zwegers Prop. 1.5(2))** (theorem `appellLerch_S`, `appell-lerch-s-transformation`; Zwegers Prop. 1.5(2), p. 11). (−iτ)^{−1/2}e^{πi(u−v)²/τ}μ(u/τ, v/τ; −1/τ) + μ(u, v; τ) = (1/2i)h(u − v; τ), for u, v ∉ ℤτ + ℤ. Hypotheses: Principal branch of √(−iτ).


### 4D. The correction R and the completion μ̃

- **`zwegersR`** (definition, `zwegers-r-function`; Zwegers §1.4, p. 11). For u ∈ ℂ and τ ∈ ℍ, with y = Im τ and a = Im u/Im τ: R(u; τ) := Σ_{ν∈1/2+ℤ} {sgn(ν) − E((ν + a)√(2y))}(−1)^{ν−1/2}e^{−πiν²τ − 2πiνu} (Zwegers §1.4, before Lemma 1.8), with E = QM.4/zwegers-error-function. R is real-analytic in (u, τ), not holomorphic. Hypotheses: (−1)^{ν−1/2} for ν ∈ 1/2 + ℤ is the integer power; sgn(0) = 0 never occurs since ν ≠ 0. API: `zwegersR`, `zwegersR_summable`, `zwegersR_eq_sign_add_beta`, `continuous_zwegersR`. Unit tests: `zwegersR_add_one_test` (R(u + 1; τ) = −R(u; τ)); `zwegersR_neg_test` (R(−u; τ) = R(u; τ)); `zwegersR_not_holomorphic_test` (∂R/∂ū ≠ 0: by Lemma 1.8, ∂R/∂ū = √2y^{−1/2}e^{−2πa²y}ϑ(ū; −τ̄), not identically zero); `zwegersR_t_test` (R(u; τ + 1) = e^{−πi/4}R(u; τ)).

- **R(u + 1) = −R(u) (Zwegers Prop. 1.9(1))** (lemma, `zwegers-r-translation-one`; Zwegers Prop. 1.9(1), p. 13). R(u + 1; τ) = −R(u; τ).

- **R(−u) = R(u) (Zwegers Prop. 1.9(3))** (lemma, `zwegers-r-even`; Zwegers Prop. 1.9(3), p. 13). R(−u; τ) = R(u; τ).

- **R(u; τ + 1) = e^{−πi/4}R(u; τ) (Zwegers Prop. 1.10(1))** (lemma, `zwegers-r-t-transformation`; Zwegers Prop. 1.10(1), p. 14). R(u; τ + 1) = e^{−πi/4}R(u; τ).

- **Convergence and real-analyticity of R (Zwegers Lemma 1.8, first part)** (lemma, `zwegers-r-convergence`; Zwegers Lemma 1.8, p. 12). For all c, ε > 0 the series defining R converges absolutely and uniformly on {(u, τ) : |Im u/Im τ| < c, Im τ > ε}; R is real-analytic on ℂ × ℍ.

- **∂R/∂ū = √2 y^{−1/2}e^{−2πa²y}ϑ(ū; −τ̄) (Zwegers Lemma 1.8 (1.4))** (lemma, `zwegers-r-ubar-derivative`; Zwegers Lemma 1.8 (1.4), p. 12). ∂R/∂ū(u; τ) = √2·y^{−1/2}·e^{−2πa²y}·ϑ(ū; −τ̄), with a = Im u/Im τ. Hypotheses: Wirtinger derivative in u (QM.3/wirtinger-derivatives).

- **∂/∂τ̄ R(aτ − b; τ) (Zwegers Lemma 1.8 (1.5))** (lemma, `zwegers-r-tau-derivative`; Zwegers Lemma 1.8 (1.5), p. 12). For a, b ∈ ℝ: ∂/∂τ̄ R(aτ − b; τ) = −(i/√(2y))·e^{−2πa²y}·Σ_{ν∈1/2+ℤ}(−1)^{ν−1/2}(ν + a)e^{−πiν²τ̄ − 2πiν(aτ̄ − b)}. Hypotheses: a, b fixed reals (u moves with τ).

- **R(u) + e^{−2πiu−πiτ}R(u + τ) = 2e^{−πiu−πiτ/4} (Zwegers Prop. 1.9(2))** (lemma `zwegersR_add_tau`, `zwegers-r-translation-tau`; Zwegers Prop. 1.9(2), p. 13). R(u; τ) + e^{−2πiu−πiτ}R(u + τ; τ) = 2e^{−πiu−πiτ/4}.

- **S-transformation of R (Zwegers Prop. 1.10(2))** (theorem `zwegersR_S`, `zwegers-r-s-transformation`; Zwegers Prop. 1.10(2), p. 14). (−iτ)^{−1/2}e^{πiu²/τ}R(u/τ; −1/τ) + R(u; τ) = h(u; τ). Hypotheses: Principal branch.

- **`zwegersCompletion`** (definition, `zwegers-completion`; Zwegers Thm 1.11, (1.8), p. 15). μ̃(u, v; τ) := μ(u, v; τ) + (i/2)R(u − v; τ) (Zwegers (1.8)). It is real-analytic in (u, v, τ) off the singular set u ∈ ℤτ + ℤ (inherited from μ; v ∉ ℤτ + ℤ), no longer meromorphic, and transforms like a two-variable Jacobi form of weight 1/2 and index (−1 1; 1 −1) (Theorem 1.11, Remark 1.12). Hypotheses: u, v ∉ ℤτ + ℤ. API: `zwegersCompletion`, `zwegersCompletion_symm`, `zwegersCompletion_diff`, `zwegersCompletion_residue`. Unit tests: `zwegersCompletion_symm_test` (μ̃(v, u) = μ̃(u, v) and μ̃(−u, −v) = μ̃(u, v) (Thm 1.11(3))); `zwegersCompletion_residue_test` (lim_{u→0} u μ̃(u, v) = −1/(2πiϑ(v)) (Thm 1.11(5))); `zwegersCompletion_s_test` (μ̃(u/τ, v/τ; −1/τ) = −√(−iτ)e^{−πi(u−v)²/τ}μ̃(u, v; τ)); `zwegersCompletion_ne_appellLerch_test` (μ̃ ≠ μ: their difference (i/2)R(u − v; τ) is not holomorphic in u (Lemma 1.8 (1.4))). Planet: Zwegers' completion μ̃.

- **Elliptic transformation of μ̃ (Zwegers Thm 1.11(1))** (theorem `zwegersCompletion_add_lattice`, `completion-elliptic-transformation`; Zwegers Thm 1.11(1), p. 15). For k, l, m, n ∈ ℤ: μ̃(u + kτ + l, v + mτ + n) = (−1)^{k+l+m+n}e^{πi(k−m)²τ + 2πi(k−m)(u−v)}μ̃(u, v). Hypotheses: u, v ∉ ℤτ + ℤ.

- **Modular transformation of μ̃ (Zwegers Thm 1.11(2))** (theorem `zwegersCompletion_modular`, `completion-modular-transformation`; Zwegers Thm 1.11(2), p. 15). For γ = (a b; c d) ∈ SL₂(ℤ): μ̃(u/(cτ + d), v/(cτ + d); (aτ + b)/(cτ + d)) = v(γ)^{−3}(cτ + d)^{1/2}e^{−πic(u−v)²/(cτ+d)}μ̃(u, v; τ), where v(γ) = η(γτ)/((cτ + d)^{1/2}η(τ)) is the eta multiplier. Hypotheses: Branch of (cτ + d)^{1/2} as in the eta multiplier system of QM.1 (the product v(γ)^{−3}(cτ+d)^{1/2} is independent of the branch choice). Planet: Transformation law of μ̃ (Zwegers Thm 1.11).


### 4E. Unary theta functions and period integrals

- **`unaryTheta`** (definition, `unary-theta-function`; Zwegers Def. 1.14, p. 17). For a, b ∈ ℝ and τ ∈ ℍ: g_{a,b}(τ) := Σ_{ν∈a+ℤ} ν e^{πiν²τ + 2πiνb} (Zwegers Def. 1.14). It is holomorphic in τ; for rational a, b it is a modular form of weight 3/2 on a congruence subgroup (Zwegers, after Prop. 1.15). In Mathlib's terms g_{a,b}(τ) = (2πi)^{−1}e^{πia²τ + 2πiab}·jacobiTheta₂′(aτ + b, τ)-type derivative of a shifted theta function. Hypotheses: a, b real; the modularity for rational a, b is stated through Prop. 1.15(4), (5) (the precise congruence subgroup is not needed by any node). API: `unaryTheta`, `unaryTheta_add_one_left`, `unaryTheta_add_one_right`, `unaryTheta_neg`, `differentiable_unaryTheta`. Unit tests: `unaryTheta_add_one_left_test` (g_{a+1,b} = g_{a,b}); `unaryTheta_neg_test` (g_{−a,−b} = −g_{a,b}); `unaryTheta_zero_test` (g_{0,b} has no ν = 0 contribution (the factor ν kills it): g_{0,0}(τ) = 0); `unaryTheta_not_weight_half_test` (g_{a,b} is not the weight-1/2 theta Σ e^{πiν²τ+2πiνb}: e.g. g_{0,0} = 0 while Σ_{ν∈ℤ} e^{πiν²τ} ≠ 0).

- **g_{a,b}(τ + 1) (Zwegers Prop. 1.15(4))** (lemma, `unary-theta-t-transformation`; Zwegers Prop. 1.15(4), p. 17). g_{a,b}(τ + 1) = e^{−πia(a+1)}g_{a, a+b+1/2}(τ). Hypotheses: a, b ∈ ℝ.

- **g_{a,b}(−1/τ) (Zwegers Prop. 1.15(5))** (lemma `unaryTheta_S`, `unary-theta-s-transformation`; Zwegers Prop. 1.15(5), p. 18). g_{a,b}(−1/τ) = i e^{2πiab}(−iτ)^{3/2}g_{b,−a}(τ). Hypotheses: Principal branch of (−iτ)^{3/2}.

- **∫ e^{πiτw²}/(w + ir) dw as a period integral (Zwegers Lemma 1.18)** (lemma, `gaussian-over-linear-integral`; Zwegers Lemma 1.18, p. 18). For r ∈ ℝ, r ≠ 0, τ ∈ ℍ: ∫_{−∞}^{∞} e^{πiτw²}/(w + ir) dw = −πr∫_0^{i∞} e^{πir²z}/√(−i(z + τ)) dz. Hypotheses: r ≠ 0; principal branch; the z-integral along the imaginary axis.

- **Partial fractions for e^{2πbz}/cosh πz (Zwegers Lemma 1.19)** (lemma, `cosh-partial-fractions`; Zwegers Lemma 1.19, p. 19). For b ∈ (−1/2, 1/2) and z ∈ ℂ, z ∉ (1/2 + ℤ)i: −e^{2πbz}/cosh(πz) = (1/π)Σ_{ν∈1/2+ℤ} e^{2πiν(b+1/2)}/(z − iν), the series converging (conditionally, as a symmetric limit; the source proves convergence by partial summation). Hypotheses: |b| < 1/2.

- **R as a period integral of a unary theta function (Zwegers Thm 1.16(1))** (theorem `zwegersR_eq_periodIntegral`, `r-as-period-integral`; Zwegers Thm 1.16(1), p. 18). For a ∈ (−1/2, 1/2), b ∈ ℝ, τ ∈ ℍ: ∫_{−τ̄}^{i∞} g_{a+1/2, b+1/2}(z)/√(−i(z + τ)) dz = −e^{−πia²τ + 2πia(b+1/2)}R(aτ − b; τ). Hypotheses: |a| < 1/2 (so sgn(ν + a) = sgn(ν) on 1/2 + ℤ); the path from −τ̄ vertically to i∞; principal branch.

- **h as a period integral (Zwegers Thm 1.16(2))** (theorem `mordellIntegral_eq_periodIntegral`, `mordell-integral-as-period-integral`; Zwegers Thm 1.16(2), p. 18). For a, b ∈ (−1/2, 1/2), τ ∈ ℍ: ∫_0^{i∞} g_{a+1/2, b+1/2}(z)/√(−i(z + τ)) dz = −e^{−πia²τ + 2πia(b+1/2)}h(aτ − b; τ). Hypotheses: |a|, |b| < 1/2.


### 4F. Indefinite theta functions

- **`ZwegersForm`** (definition, `indefinite-form-of-type-r-minus-one-one`; Zwegers §2.2, p. 25). Data (Zwegers §2.2): r ≥ 1, a symmetric matrix A ∈ M_r(ℤ) with det A ≠ 0, Q(x) := ½⟨x, Ax⟩ and B(x, y) := ⟨x, Ay⟩ = Q(x + y) − Q(x) − Q(y) on ℝ^r (and ℂ^r), of type (r − 1, 1) — the largest subspace on which Q is negative definite has dimension 1 — together with a vector c₀ ∈ ℝ^r with Q(c₀) < 0 selecting one of the two components of {Q < 0}. Pinned encoding: the structure records A, symmetry, det A ≠ 0, c₀ with Q(c₀) < 0, and positivity of Q on the B-orthogonal complement of c₀ (equivalent to type (r − 1, 1) given Q(c₀) < 0). Hypotheses: A integral, symmetric, non-degenerate; A need not be even (Prop. 2.7(6) treats odd diagonals). API: `ZwegersForm`, `ZwegersForm.Q`, `ZwegersForm.B`, `ZwegersForm.B_self`, `ZwegersForm.B_neg_of_same_component`. Unit tests: `zwegersForm_example_test` (A = (1 2; 2 1), c₀ = (−1, 2) defines a form of type (1, 1) with Q(c₀) = −3/2); `zwegersForm_posDef_non_example_test` (For A = identity (r = 2) there is no c₀ with Q(c₀) < 0: positive definite forms are excluded); `zwegersForm_B_polar_test` (B(x, y) = Q(x + y) − Q(x) − Q(y) and Q(x) = ½B(x, x)); `zwegersForm_seventh_test` (A = (3 4; 4 3), c₀ = (−3, 4) is of type (1, 1) with Q(c₀) = −21/2 (Zwegers §4.3)).

- **`ZwegersForm.negCone`** (definition, `negative-cone`; Zwegers §2.2, p. 26). For a form of type (r − 1, 1) with chosen c₀: C_Q := {c ∈ ℝ^r : Q(c) < 0, B(c, c₀) < 0}; S_Q := {c ∈ ℤ^r primitive : Q(c) = 0, B(c, c₀) < 0} (representatives of the cusps of C_Q/ℝ₊); C̄_Q := C_Q ∪ S_Q (Zwegers §2.2). Hypotheses: Primitive: gcd of the coordinates is 1. API: `ZwegersForm.negCone`, `ZwegersForm.cuspVectors`, `ZwegersForm.closedCone`, `ZwegersForm.add_smul_mem_negCone`. Unit tests: `negativeCone_example_test` (For A = (1 2; 2 1), c₀ = (−1, 2): (−2, 1) ∈ C_Q); `cuspVectors_empty_test` (For A = (1 0; 0 −3), S_Q = ∅); `negativeCone_neg_non_example_test` (−c₀ ∉ C_Q (it lies in the other component)); `negativeCone_smul_test` (c ∈ C_Q and λ > 0 imply λc ∈ C_Q).

- **`ZwegersForm.admissible`** (definition, `admissible-characteristics`; Zwegers §2.2, p. 26). For c ∈ C̄_Q: R(c) := ℝ^r if c ∈ C_Q and R(c) := {a ∈ ℝ^r : B(c, a) ∉ ℤ} if c ∈ S_Q; D(c) := {(z, τ) ∈ ℂ^r × ℍ : Im z/Im τ ∈ R(c)} (Zwegers §2.2). For z = aτ + b (a, b ∈ ℝ^r): (z, τ) ∈ D(c) iff a ∈ R(c). API: `ZwegersForm.admissible`, `ZwegersForm.admissibleDomain`, `ZwegersForm.admissible_add_int`. Unit tests: `admissible_negCone_test` (For c ∈ C_Q, R(c) = ℝ^r); `admissible_cusp_test` (For A = (1 2; 2 1)-type examples with c ∈ S_Q and a with B(c, a) = 1/2: a ∈ R(c); with B(c, a) = 1: a ∉ R(c)); `admissible_translate_test` (a ∈ R(c) ⇔ a + λ ∈ R(c) for λ ∈ ℤ^r).

- **`ZwegersForm.rho`** (definition, `zwegers-rho`; Zwegers Def. 2.1, pp. 26–27). For c ∈ C̄_Q, ν ∈ ℝ^r, τ ∈ ℍ with y = Im τ: ρ^c(ν; τ) := E(B(c, ν)y^{1/2}/√(−Q(c))) if c ∈ C_Q and ρ^c(ν; τ) := sgn(B(c, ν)) if c ∈ S_Q; ρ^{c₁,c₂} := ρ^{c₁} − ρ^{c₂} (Zwegers Def. 2.1). ρ depends on τ only through y; replacing c by λc (λ > 0) does not change ρ^c (Remark 2.2). Hypotheses: E = QM.4/zwegers-error-function; sgn(0) = 0. API: `ZwegersForm.rho`, `ZwegersForm.rhoPair`, `ZwegersForm.rhoPair_cocycle`, `ZwegersForm.rho_smul`, `ZwegersForm.rho_eq_sign_mul_one_sub_beta`. Unit tests: `zwegersRho_self_test` (ρ^{c,c}(ν; τ) = 0); `zwegersRho_cusp_test` (For c ∈ S_Q, ρ^c(ν; τ) = sgn(B(c, ν)) independently of τ); `zwegersRho_tendsto_test` (For c ∈ C_Q and B(c, ν) ≠ 0, ρ^c(ν; x + iy) → sgn(B(c, ν)) as y → ∞); `zwegersRho_not_sign_test` (For c ∈ C_Q, ρ^c(ν; τ) ≠ sgn(B(c, ν)) in general: |ρ^c| < 1 always).

- **`ZwegersForm.indefiniteTheta`** (definition, `indefinite-theta-function`; Zwegers Def. 2.1, p. 26). For c₁, c₂ ∈ C̄_Q, a ∈ R(c₁) ∩ R(c₂), b ∈ ℝ^r: ϑ_{a,b}(τ) = ϑ^{c₁,c₂}_{a,b}(τ) := Σ_{ν∈a+ℤ^r} ρ^{c₁,c₂}(ν; τ)e^{2πiQ(ν)τ + 2πiB(ν,b)}, and for (z, τ) ∈ D(c₁) ∩ D(c₂), with z = aτ + b: ϑ(z; τ) = ϑ^{c₁,c₂}_A(z; τ) := e^{−2πiQ(a)τ − 2πiB(a,b)}ϑ_{a,b}(τ) = Σ_{n∈ℤ^r} ρ(n + a; τ)e^{2πiQ(n)τ + 2πiB(n, z)} (Zwegers Def. 2.1). The series converge absolutely (Prop. 2.4). In general ϑ is not holomorphic (Remark 2.3); for c₁, c₂ ∈ S_Q it is the holomorphic Göttsche–Zagier theta function. Hypotheses: z = aτ + b with a = Im z/Im τ and b = Im(z̄τ)/Im τ in ℝ^r, uniquely determined by (z, τ). API: `ZwegersForm.indefiniteTheta`, `ZwegersForm.indefiniteThetaChar`, `ZwegersForm.indefiniteThetaChar_eq`, `ZwegersForm.indefiniteTheta_self`. Unit tests: `indefiniteTheta_self_test` (ϑ^{c,c}(z; τ) = 0); `indefiniteTheta_neg_test` (ϑ(−z; τ) = −ϑ(z; τ)); `indefiniteTheta_eta_squared_test` (A = (1 2; 2 1), c₁ = (−1, 2), c₂ = (−2, 1), a = b = (1/6, 1/6): ϑ_{a,b}(τ) = 2e^{πi/3}η(τ)²); `indefiniteTheta_char_test` (ϑ_{a,b}(τ) = e^{2πiQ(a)τ + 2πiB(a,b)}ϑ(aτ + b; τ)). Planet: Zwegers' indefinite theta function.

- **Q_c is positive definite and dominates Q_{c₀} (Zwegers Lemma 2.5)** (lemma, `positive-definite-comparison`; Zwegers Lemma 2.5, p. 27). For c ∈ C_Q the form Q_c(ν) := Q(ν) − B(c, ν)²/(2Q(c)) is positive definite, and Q_c(ν) ≥ λ_{c,c₀}Q_{c₀}(ν) with λ_{c,c₀} = (B(c,c₀)² − 2Q(c)Q(c₀) − |B(c,c₀)|√(B(c,c₀)² − 4Q(c)Q(c₀)))/(2Q(c)Q(c₀)) > 0; λ_{c,c₀} depends continuously on c. Hypotheses: c ∈ C_Q.

- **Q⁺ is positive definite (Zwegers Lemma 2.6)** (lemma, `positive-definite-q-plus`; Zwegers Lemma 2.6, p. 29). For linearly independent c₁, c₂ ∈ C_Q, Q⁺(ν) := Q(ν) + B(c₁,c₂)/(4Q(c₁)Q(c₂) − B(c₁,c₂)²)·B(c₁,ν)B(c₂,ν) is positive definite. Hypotheses: c₁, c₂ ∈ C_Q linearly independent.

- **Convergence of the β-series (Zwegers, proof of Prop. 2.4, (2.10))** (lemma, `indefinite-theta-beta-series-convergence`; Zwegers proof of Prop. 2.4, p. 30). For c ∈ ℝ^r with Q(c) < 0, a, b ∈ ℝ^r, τ ∈ ℍ: Σ_{ν∈a+ℤ^r} sgn(B(c,ν))β(−B(c,ν)²y/Q(c))e^{2πiQ(ν)τ+2πiB(ν,b)} converges absolutely, locally uniformly in (c, τ). Hypotheses: Q(c) < 0.

- **Convergence of the sign-difference series (Zwegers, proof of Prop. 2.4, (2.11))** (lemma, `indefinite-theta-sign-series-convergence`; Zwegers proof of Prop. 2.4, pp. 30–32). For c₁, c₂ ∈ C̄_Q, a ∈ R(c₁) ∩ R(c₂), b ∈ ℝ^r, τ ∈ ℍ: Σ_{ν∈a+ℤ^r}{sgn(B(c₁,ν)) − sgn(B(c₂,ν))}e^{2πiQ(ν)τ + 2πiB(ν,b)} converges absolutely. Hypotheses: a admissible for the cusp vectors among c₁, c₂.

- **Absolute convergence of ϑ^{c₁,c₂} (Zwegers Prop. 2.4)** (theorem `ZwegersForm.indefiniteTheta_summable`, `indefinite-theta-convergence`; Zwegers Prop. 2.4, p. 27). For c₁, c₂ ∈ C̄_Q and (z, τ) ∈ D(c₁) ∩ D(c₂), the series defining ϑ^{c₁,c₂}(z; τ) (and ϑ_{a,b}(τ)) converges absolutely. Hypotheses: As stated.

- **Cocycle relations (Zwegers Prop. 2.7(1))** (lemma, `indefinite-theta-cocycle`; Zwegers Prop. 2.7(1), p. 32). ϑ^{c₁,c₂} + ϑ^{c₂,c₁} = 0 and ϑ^{c₁,c₂} + ϑ^{c₂,c₃} + ϑ^{c₃,c₁} = 0 on D(c₁) ∩ D(c₂) ∩ D(c₃). Hypotheses: c₁, c₂, c₃ ∈ C̄_Q.

- **Elliptic transformation (Zwegers Prop. 2.7(2))** (lemma, `indefinite-theta-elliptic`; Zwegers Prop. 2.7(2), p. 32). ϑ(z + λτ + μ; τ) = e^{−2πiQ(λ)τ − 2πiB(z,λ)}ϑ(z; τ) for λ ∈ ℤ^r, μ ∈ A^{−1}ℤ^r. Hypotheses: (z, τ) ∈ D(c₁) ∩ D(c₂).

- **ϑ(−z) = −ϑ(z) (Zwegers Prop. 2.7(3))** (lemma, `indefinite-theta-odd`; Zwegers Prop. 2.7(3), p. 32). ϑ(−z; τ) = −ϑ(z; τ).

- **Continuity in (c₁, c₂) (Zwegers Prop. 2.7(4))** (lemma, `indefinite-theta-continuity`; Zwegers Prop. 2.7(4), p. 32). (c₁, c₂) ↦ ϑ^{c₁,c₂}(z; τ) is continuous on C_Q × C_Q.

- **The sign part tends to 0 at a cusp (Zwegers (2.17))** (lemma, `indefinite-theta-sign-limit`; Zwegers proof of Prop. 2.7(5), p. 34). For c₁ ∈ C_Q, c₂ ∈ S_Q, c(t) = c₂ + tc₁ and (z, τ) ∈ D(c₂): lim_{t↓0}Σ_{ν∈a+ℤ^r}{sgn(B(c₂,ν)) − sgn(B(c(t),ν))}e^{2πiQ(ν)τ+2πiB(ν,b)} = 0. Hypotheses: As stated (one may take c₃ = c₁).

- **The β part tends to 0 at a cusp (Zwegers (2.18))** (lemma, `indefinite-theta-beta-limit`; Zwegers proof of Prop. 2.7(5), p. 35). In the situation of the previous node: lim_{t↓0}Σ_{ν∈a+ℤ^r} sgn(B(c(t),ν))β(−B(c(t),ν)²y/Q(c(t)))e^{2πiQ(ν)τ+2πiB(ν,b)} = 0. Hypotheses: As before.

- **Limit to a cusp vector (Zwegers Prop. 2.7(5))** (lemma, `indefinite-theta-cusp-limit`; Zwegers Prop. 2.7(5), p. 32). Let c₁, c₃ ∈ C_Q, c₂ ∈ S_Q, (z, τ) ∈ D(c₂), c(t) := c₂ + tc₃. Then c(t) ∈ C_Q for t > 0 and lim_{t↓0}ϑ^{c₁,c(t)}(z; τ) = ϑ^{c₁,c₂}(z; τ). Hypotheses: As stated.

- **ϑ(z; τ + 1) (Zwegers Prop. 2.7(6))** (lemma, `indefinite-theta-t-transformation`; Zwegers Prop. 2.7(6), p. 32). ϑ(z; τ + 1) = ϑ(z + ½A^{−1}A*; τ), where A* = (A₁₁, …, A_rr)^T; in particular ϑ(z; τ + 2) = ϑ(z; τ), and ϑ(z; τ + 1) = ϑ(z; τ) if A is even.

- **Gaussian integrals for a positive definite matrix and τ ∈ ℍ** (lemma, `multivariate-gaussian-integral`; Zwegers proof of Lemma 2.8, p. 40). For a positive definite symmetric M ∈ M_n(ℝ), τ ∈ ℍ and α ∈ ℂ^n: ∫_{ℝ^n} e^{πi⟨a, Ma⟩τ + 2πi⟨a, Mα⟩}da = (−iτ)^{−n/2}(det M)^{−1/2}e^{−πi⟨α, Mα⟩/τ}. Hypotheses: Principal branch of (−iτ)^{−n/2} (as the n-th power of (−iτ)^{−1/2}).

- **a ↦ ρ(a; τ)e^{2πiQ(a)τ} is essentially its own Fourier transform (Zwegers Lemma 2.8)** (lemma, `rho-fourier-self-duality`; Zwegers Lemma 2.8, p. 39). For c₁, c₂ ∈ C_Q, all α ∈ ℝ^r and τ ∈ ℍ: the function a ↦ ρ(a; τ)e^{2πiQ(a)τ + 2πiB(a,α)} is integrable (indeed a Schwartz function of a), and ∫_{ℝ^r}ρ(a; τ)e^{2πiQ(a)τ+2πiB(a,α)}da = (i/√(−det A))(−iτ)^{−r/2}ρ(α; −1/τ)e^{−2πiQ(α)/τ}. Hypotheses: c₁, c₂ in the open cone (the cusp case follows by Prop. 2.7(5)).

- **Modular S-transformation of ϑ^{c₁,c₂} (Zwegers Prop. 2.7(7))** (theorem `ZwegersForm.indefiniteTheta_S`, `indefinite-theta-s-transformation`; Zwegers Prop. 2.7(7), p. 32). Let D′(c) := {(z, τ) ∈ D(c) : (z/τ, −1/τ) ∈ D(c)} (for c ∈ S_Q: z = aτ + b with B(c, a), B(c, b) ∉ ℤ; for c ∈ C_Q: all (z, τ)). For (z, τ) ∈ D′(c₁) ∩ D′(c₂): ϑ(z/τ; −1/τ) = (i/√(−det A))(−iτ)^{r/2}Σ_{p∈A^{−1}ℤ^r/ℤ^r} e^{2πiQ(z + pτ)/τ}ϑ(z + pτ; τ). Hypotheses: Principal branches; D′(c) as corrected in sourceIssue E504. Planet: Modularity of indefinite theta functions.

- **ϑ_{a,b} under shifts of a, b (Zwegers Cor. 2.9(1)–(3))** (lemma, `indefinite-theta-characteristics-elliptic`; Zwegers Cor. 2.9(1)–(3), p. 42). ϑ_{a+λ,b} = ϑ_{a,b} (λ ∈ ℤ^r); ϑ_{a,b+μ} = e^{2πiB(a,μ)}ϑ_{a,b} (μ ∈ A^{−1}ℤ^r); ϑ_{−a,−b} = −ϑ_{a,b}. Hypotheses: a ∈ R(c₁) ∩ R(c₂).

- **ϑ_{a,b}(τ + 1) (Zwegers Cor. 2.9(4))** (lemma, `indefinite-theta-characteristics-t`; Zwegers Cor. 2.9(4), p. 42). ϑ_{a,b}(τ + 1) = e^{−2πiQ(a) − πiB(A^{−1}A*, a)}ϑ_{a, a+b+½A^{−1}A*}(τ). Hypotheses: As in Cor. 2.9.

- **ϑ_{a,b}(−1/τ) (Zwegers Cor. 2.9(5))** (theorem `ZwegersForm.indefiniteThetaChar_S`, `indefinite-theta-characteristics-s`; Zwegers Cor. 2.9(5), p. 42). If a, b ∈ R(c₁) ∩ R(c₂) then ϑ_{a,b}(−1/τ) = (i/√(−det A))(−iτ)^{r/2}e^{2πiB(a,b)}Σ_{p∈A^{−1}ℤ^r mod ℤ^r} ϑ_{b+p,−a}(τ). Hypotheses: Both a and b admissible.

- **`ZwegersForm.orthogonalPlus`** (definition, `orthogonal-group-of-positive-cone`; Zwegers Def. 2.10, p. 43). O_A^+(ℝ) := {C ∈ GL_r(ℝ) : CᵀAC = A, B(Cc, c) < 0 for all c ∈ C_Q} (the index-2 subgroup of O_A(ℝ) preserving C_Q) and O_A^+(ℤ) := O_A^+(ℝ) ∩ GL_r(ℤ) (Zwegers Def. 2.10). API: `ZwegersForm.orthogonalPlus`, `ZwegersForm.orthogonalPlus_mem_iff`, `ZwegersForm.orthogonalPlus_smul_negCone`. Unit tests: `orthogonalPlus_example_test` (For A = (1 2; 2 1): C = (1 0; −4 −1) ∈ O_A^+(ℤ) and Cc₁ = c₁ for c₁ = (−1, 2) (Example 2.16)); `orthogonalPlus_det_test` (C ∈ O_A^+(ℤ) ⇒ det C = ±1); `orthogonalPlus_neg_one_test` (−I ∈ O_A(ℤ) but −I ∉ O_A^+(ℤ) (it swaps the components)).

- **Invariance under O_A^+(ℤ) (Zwegers Prop. 2.13)** (theorem `ZwegersForm.indefiniteTheta_orthogonalPlus`, `indefinite-theta-orthogonal-invariance`; Zwegers Prop. 2.13, p. 43). For C ∈ O_A^+(ℤ), c₁, c₂ ∈ C̄_Q and (z, τ) ∈ D(c₁) ∩ D(c₂): (Cz, τ) ∈ D(Cc₁) ∩ D(Cc₂) and ϑ^{Cc₁,Cc₂}(Cz; τ) = ϑ^{c₁,c₂}(z; τ).

- **ϑ^{Cc₁,Cc₂}_{Ca,Cb} = ϑ^{c₁,c₂}_{a,b} (Zwegers Cor. 2.15)** (lemma, `indefinite-theta-characteristics-orthogonal-invariance`; Zwegers Cor. 2.15, p. 44). For C ∈ O_A^+(ℤ), c₁, c₂ ∈ C̄_Q and a ∈ R(c₁) ∩ R(c₂): ϑ^{Cc₁,Cc₂}_{Ca,Cb}(τ) = ϑ^{c₁,c₂}_{a,b}(τ).

- **An indefinite theta function equal to 2e^{πi/3}η² (Zwegers Example 2.16)** (lemma, `indefinite-theta-eta-squared`; Zwegers Example 2.16, p. 45). For A = (1 2; 2 1), c₁ = (−1, 2), c₂ = (−2, 1), e = (1, 1): ϑ^{c₁,c₂}_{e/6,e/6} = 2e^{πi/3}η², equivalently (Σ_{n,m≥0} − Σ_{n,m<0})(−1)^{n+m}q^{n²/2+2nm+m²/2+n/2+m/2} = ∏_{n≥1}(1 − q^n)².


### 4G. Meromorphic Jacobi forms and Appell functions of level m

- **`SatisfiesEllipticLaw`** (definition, `meromorphic-jacobi-transformation-laws`; Zwegers §3.1, p. 49). For ϕ : ℂ × ℍ → ℂ (meromorphic in z, with junk value 0 at its poles), m ∈ ℤ_{>0} and k ∈ ℤ, put ϕ̂(τ, z) := ϕ(z; τ). ϕ satisfies (E) of index m if ϕ̂|_m[λ, μ] = ϕ̂ for all (λ, μ) ∈ ℤ² (QM.1/jacobi-elliptic-slash), i.e. ϕ(z + λτ + μ; τ) = e^{−2πim(λ²τ + 2λz)}ϕ(z; τ); and (M) of weight k and index m if ϕ̂|_{k,m}γ = ϕ̂ for all γ = (a b; c d) ∈ SL₂(ℤ) (QM.1/jacobi-modular-slash), i.e. ϕ(z/(cτ+d); (aτ+b)/(cτ+d)) = (cτ + d)^k e^{2πimcz²/(cτ+d)}ϕ(z; τ) (Zwegers §3.1). Jacobi forms of weight k and index m (QM.1/jacobi-form) are the holomorphic ϕ satisfying (E), (M) and a growth condition; here neither holomorphy nor growth is assumed, which is what Zwegers' Chapter 3 needs (ϕ has poles in z). Hypotheses: Two predicates on functions. The pole set of a ϕ satisfying the laws is invariant under the actions, so with the junk value 0 at poles the equalities hold everywhere. API: `SatisfiesEllipticLaw`, `SatisfiesModularLaw`, `SatisfiesEllipticLaw.mul_modularForm`, `SatisfiesEllipticLaw.periodic`. Unit tests: `jacobiLaws_phi_minus_two_one_test` (φ(z; τ) = −ϑ(z; τ)²/η(τ)⁶ satisfies (E) with m = 1 and (M) with k = −2); `jacobiLaws_zero_test` (The zero function satisfies (E) and (M) for all m, k); `jacobiLaws_theta_non_example_test` (ϑ(z; τ) itself does not satisfy (E) for any integer m ≥ 1 (its index is 1/2: ϑ(z + τ) = −e^{−πiτ−2πiz}ϑ(z))); `jacobiLaws_jacobiForm_test` (Every Jacobi form of weight k and index m (QM.1/jacobi-form) satisfies (E) and (M)).

- **`levelAppell`** (definition, `level-m-appell-function`; Zwegers Def. 3.2, p. 51). For u ∈ ℂ, m ∈ ℤ_{>0}: f_u(z; τ) = f_u^{(m)}(z; τ) := Σ_{λ∈ℤ} e^{2πimλ²τ + 4πimλz}/(1 − e^{2πiλτ + 2πi(z − u)}) (Zwegers Def. 3.2), meromorphic in z with simple poles at u + ℤτ + ℤ. Hypotheses: z ∉ u + ℤτ + ℤ. API: `levelAppell`, `levelAppell_add_one_left`, `levelAppell_add_one_tau`, `meromorphic_levelAppell`. Unit tests: `levelAppell_add_one_u_test` (f_{u+1}(z; τ) = f_u(z; τ)); `levelAppell_t_test` (f_u(z; τ + 1) = f_u(z; τ)); `levelAppell_residue_test` (lim_{z→u}(z − u)f_u(z; τ) = −1/(2πi)); `levelAppell_not_modular_test` (For some u, z, τ: f_{u/τ}(z/τ; −1/τ) ≠ τe^{2πimz²/τ}f_u(z; τ), so f_u does not satisfy the weight-1, index-m S-law; Prop. 3.3(6) gives the correct law, with a theta-series defect Σ_l h_l(u; τ)ϑ_{m,l}(z; τ)).

- **f_u satisfies (E) (Zwegers Prop. 3.3(1))** (lemma, `level-m-appell-elliptic`; Zwegers Prop. 3.3(1), p. 51). f_u^{(m)} satisfies (E) of index m.

- **Poles and residue of f_u (Zwegers Prop. 3.3(2))** (lemma, `level-m-appell-poles`; Zwegers Prop. 3.3(2), p. 51). z ↦ f_u(z; τ) is meromorphic with simple poles exactly at u + ℤτ + ℤ and residue −1/(2πi) at z = u.

- **f_u − e^{−2πimτ−4πimu}f_{u+τ} (Zwegers Prop. 3.3(4))** (lemma, `level-m-appell-shift`; Zwegers Prop. 3.3(4), p. 51). f_u(z; τ) − e^{−2πimτ−4πimu}f_{u+τ}(z; τ) = Σ_{l=0}^{2m−1} e^{−πil²τ/(2m) − 2πilu}ϑ_{m,l}(z; τ), with ϑ_{m,l}(z; τ) = Σ_{λ≡l mod 2m} e^{πiλ²τ/(2m) + 2πiλz}. Hypotheses: ϑ_{m,l} as in Zwegers (3.2) (the theta functions of the theta decomposition, QM.1/theta-decomposition).

- **S-transformation of f_u (Zwegers Prop. 3.3(6))** (lemma, `level-m-appell-s-transformation`; Zwegers Prop. 3.3(6), p. 51). f_u(z; τ) − τ^{−1}e^{2πim(u²−z²)/τ}f_{u/τ}(z/τ; −1/τ) = Σ_{l=0}^{2m−1} h_l(u; τ)ϑ_{m,l}(z; τ), where h_l(u; τ) = ie^{−πil²τ/2m−2πilu}∫_L e^{2πimτx²−2π(2mu+lτ)x}/(1 − e^{2πx})dx, L = ℝ − it (0 < t < 1).

- **`levelR`** (definition, `level-m-r-function`; Zwegers Def. 3.4, p. 53). For m ∈ ℤ_{>0}, l ∈ ℤ/2mℤ, u ∈ ℂ, τ ∈ ℍ, y = Im τ: R_{m,l}(u; τ) := Σ_{λ∈ℤ, λ≡l mod 2m}{sgn(λ + 1/2) − E((λ + 2m Im u/y)√(y/m))}e^{−πiλ²τ/(2m) − 2πiλu} (Zwegers Def. 3.4). Convergence is as for R (Lemma 1.8), which the source says without proof. Hypotheses: Convergence proof supplied here by the argument of Lemma 1.8 (split sign part, finite, and β-part bounded by a Gaussian). API: `levelR`, `levelR_summable`, `levelR_add_two_m`. Unit tests: `levelR_shift_test` (R_{m,l+2m} = R_{m,l} (the definition depends on l mod 2m)); `levelR_decomposition_test` (With a = 2m Im u/y: |R_{m,l}(u; τ) − Σ_{λ≡l}[sgn(λ + ½) − sgn(λ + a)]e^{−πiλ²τ/2m−2πiλu}| ≤ e^{−πya²/(2m)}·Σ_{λ≡l} e^{−πy(λ + a)²/(2m)} (from sgn(x) − E(x) = sgn(x)β(x²) and β(t) ≤ e^{−πt})); `levelR_not_holomorphic_test` (∂/∂τ̄ of e^{−2πimα²τ}R_{m,l}(ατ + β; τ) is non-zero (Prop. 3.7(1))).

- **`completedAppell`** (definition, `completed-level-m-appell-function`; Zwegers Def. 3.4, p. 53). f̃_u(z; τ) := f_u(z; τ) − ½Σ_{l mod 2m} R_{m,l}(u; τ)ϑ_{m,l}(z; τ) (Zwegers Def. 3.4). It is meromorphic in z (poles u + ℤτ + ℤ) and real-analytic in (u, τ). Hypotheses: z ∉ u + ℤτ + ℤ. API: `completedAppell`, `completedAppell_add_one_left`, `completedAppell_poles`. Unit tests: `completedAppell_residue_test` (Res_{z=u}f̃_u(z; τ) = −1/(2πi)); `completedAppell_elliptic_test` (f̃_u satisfies (E) in z of index m); `completedAppell_ne_test` (f̃_u ≠ f_u: the correction ½ΣR_{m,l}ϑ_{m,l} is non-zero and non-holomorphic in u); `completedAppell_indefinite_theta_test` (f̃_u(z; τ) = ½ϑ^{c₁,c₂}_A((z − u, 2mu); τ) for A = (2m 1; 1 0), c₁ = (0, 1), c₂ = (−1, 2m)).

- **f̃_u is an indefinite theta function (Zwegers Prop. 3.5(3))** (lemma, `completed-appell-as-indefinite-theta`; Zwegers Prop. 3.5(3), p. 54). f̃_u(z; τ) = ½ϑ^{c₁,c₂}_A((z − u, 2mu); τ) with A = (2m 1; 1 0), c₁ = (0, 1) ∈ S_Q and c₂ = (−1, 2m) ∈ C_Q. Hypotheses: Q(n) = mn₁² + n₁n₂ of type (1, 1); c₀ chosen with c₂ ∈ C_Q.

- **f̃_u transforms like a two-variable Jacobi form (Zwegers Prop. 3.5(1))** (lemma, `completed-appell-jacobi-transformation`; Zwegers Prop. 3.5(1), p. 53). (a) f̃_u satisfies (E) in z; (b) f̃_{u+λτ+μ}(z; τ) = e^{2πim(λ²τ+2λu)}f̃_u(z; τ) for λ, μ ∈ ℤ; (c) f̃_{u/(cτ+d)}(z/(cτ+d); (aτ+b)/(cτ+d)) = (cτ + d)e^{2πimc(z²−u²)/(cτ+d)}f̃_u(z; τ) for (a b; c d) ∈ SL₂(ℤ): weight 1 and index (2m 0; 0 −2m) in (z, u).

- **Poles of f̃_u (Zwegers Prop. 3.5(2))** (lemma, `completed-appell-poles`; Zwegers Prop. 3.5(2), p. 54). For fixed u, z ↦ f̃_u(z; τ) is meromorphic with simple poles exactly at u + ℤτ + ℤ and residue −1/(2πi) at z = u.

- **τ̄-derivative of R_{m,l} along torsion points (Zwegers Prop. 3.7(1))** (lemma, `level-m-r-tau-bar-derivative`; Zwegers Prop. 3.7(1), p. 55). For α, β ∈ ℝ: ∂/∂τ̄[e^{−2πimα²τ}R_{m,l}(ατ + β; τ)] = −i√(m/y)·e^{4πimαβ}Σ_{λ∈α+l/2m+ℤ} λ e^{−2πimλ²τ̄ − 4πimλβ}. Hypotheses: α, β real.

- **e^{−2πimα²τ}R_{m,l}(ατ + β; τ) is Δ_{1/2}-harmonic (Zwegers Prop. 3.7(2))** (lemma, `level-m-r-harmonic`; Zwegers Prop. 3.7(2), p. 55). τ ↦ e^{−2πimα²τ}R_{m,l}(ατ + β; τ) is an eigenfunction of Zwegers' Ω_{1/2} with eigenvalue 3/16, i.e. it is annihilated by the weight-1/2 Laplacian Δ_{1/2} (QM.3/weight-k-hyperbolic-laplacian).

- **`realAnalyticResidue`** (definition, `real-analytic-residue`; Zwegers Def. 3.8, pp. 56–57). Let f be real-analytic near u and g meromorphic with a pole of order s at u; then f·g = Σ_{n≥−s}Σ_{k≥0}a_{nk}(v − u)^n\overline{(v − u)}^k near u, and Res_{v=u}[f(v)g(v)] := a_{−1,0} = (1/(s−1)!)·∂^{s−1}/∂v^{s−1}|_{v=u}[f(v)(v − u)^s g(v)] (holomorphic derivative ∂_v) (Zwegers Def. 3.8). For holomorphic f it is the usual residue. Hypotheses: f real-analytic in a neighbourhood of u; g meromorphic with a pole of order s ≥ 1 at u. API: `realAnalyticResidue`, `realAnalyticResidue_eq_residue`, `realAnalyticResidue_simple`. Unit tests: `realAnalyticResidue_holomorphic_test` (If f is holomorphic, Res_{v=u}[f g] is the classical residue of fg); `realAnalyticResidue_simple_test` (For g = 1/(v − u): Res_{v=u}[f g] = f(u)); `realAnalyticResidue_conj_test` (For f(v) = \overline{v − u} and g = (v − u)^{−2}: Res = 0 (the term (v̄ − ū)/(v − u)² has k = 1, not counted), although the naive 'coefficient of 1/(v − u)' of the non-holomorphic function f g is not 0).

- **Fourier coefficients of meromorphic Jacobi forms (Zwegers Thm 3.9)** (theorem `meromorphicJacobi_eq_sum`, `meromorphic-jacobi-fourier-coefficients`; Zwegers Thm 3.9, p. 57). Let ϕ(·; τ) be meromorphic for each τ and satisfy (E) of index m. Then for τ ∈ ℍ and z ∉ Sing ϕ(·; τ): ϕ(z; τ) = Σ_{l mod 2m} h_l(τ)ϑ_{m,l}(z; τ) − 2πiΣ_{u ∈ Sing ϕ(·;τ) mod Λ_τ} Res_{v=u}[f̃_v(z; τ)ϕ(v; τ)], Λ_τ = ℤτ + ℤ, with h_l(τ) = e^{−πil²τ/2m}∫_p^{p+1}ϕ(z; τ)e^{−2πilz}dz − πiΣ_{u ∈ Sing ϕ ∩ P_p} Res_{v=u}[R_{m,l}(v; τ)ϕ(v; τ)] for 0 ≤ l ≤ 2m − 1 and any p with no poles on ∂P_p, P_p = p + (0, 1)τ + (0, 1). If ϕ also satisfies (M) of weight k, the vector (h_l) transforms like the theta coefficients of a Jacobi form: h_l(τ + 1) = e^{−πil²/2m}h_l(τ) and h_l(−1/τ) = (τ^k/√(−iτ))(2m)^{−1/2}Σ_ν e^{πilν/m}h_ν(τ). Hypotheses: Residues in the sense of QM.4/real-analytic-residue.

- **The case of simple poles (Zwegers Cor. 3.10)** (theorem `meromorphicJacobi_eq_sum_simple`, `meromorphic-jacobi-simple-poles`; Zwegers Cor. 3.10, p. 59). If ϕ has only simple poles in z and satisfies (E): ϕ(z; τ) = Σ_{l mod 2m}h_l(τ)ϑ_{m,l}(z; τ) + Σ_{u ∈ Sing mod Λ_τ}d_u(τ)f̃_u(z; τ), with d_u(τ) = −2πi Res_{z=u}ϕ(z; τ) and h_l(τ) = e^{−πil²τ/2m}∫_p^{p+1}ϕ(z; τ)e^{−2πilz}dz + ½Σ_{u ∈ Sing ∩ P_p}d_u(τ)R_{m,l}(u; τ); under (M) the h_l transform as in Thm 3.9. Hypotheses: Only simple poles.

- **Modularity of the residue functions (Zwegers Prop. 3.11)** (theorem `residueFunction_modular`, `residue-function-modularity`; Zwegers Prop. 3.11, p. 60). In Cor. 3.10, if a pole u of ϕ(·; τ) has the form u = ατ + β with α, β ∈ ℚ independent of τ, then τ ↦ e^{2πimα²τ}d_u(τ) transforms like a modular form of weight k − 1 on some subgroup Γ_{α,β} ≤ SL₂(ℤ) of finite index. Hypotheses: α, β ∈ ℚ; ϕ satisfies (E) and (M).


### 4H. Non-holomorphic unary theta functions

- **`unaryR`** (definition, `unary-real-analytic-theta`; Zwegers Def. 4.1, p. 64). For a, b ∈ ℝ and τ ∈ ℍ (y = Im τ): R_{a,b}(τ) := Σ_{ν∈a+ℤ} sgn(ν)β(2ν²y)e^{−πiν²τ − 2πiνb} (Zwegers Def. 4.1), with β = QM.4/zwegers-beta-function. It is the non-holomorphic Eichler integral of the weight-3/2 theta function g_{a,−b}. Hypotheses: sgn(0) = 0 (the term ν = 0 vanishes). API: `unaryR`, `unaryR_add_one_left`, `unaryR_summable`, `continuous_unaryR`. Unit tests: `unaryR_add_one_test` (R_{a+1,b}(τ) = R_{a,b}(τ)); `unaryR_zero_test` (R_{0,b}(τ) = Σ_{n≠0} sgn(n)β(2n²y)e^{−πin²τ−2πinb}: the ν = 0 term vanishes (sgn 0 = 0)); `unaryR_not_holomorphic_test` (∂R_{a,b}/∂τ̄ = −i(2y)^{−1/2}g_{a,−b}(−τ̄) ≠ 0 for a ∉ ℤ (Prop. 4.2(4))); `unaryR_eq_R_test` (For a ∈ (0, 1): R_{a,b}(τ) = ie^{−πi(a−½)²τ−2πi(a−½)b}R((a − ½)τ + b + ½; τ)).

- **R_{a,b} as a specialisation of R (Zwegers Prop. 4.2(1))** (lemma, `unary-r-relation-to-r`; Zwegers Prop. 4.2(1), p. 65). For a ∈ (0, 1), b ∈ ℝ: R_{a,b}(τ) = ie^{−πi(a−½)²τ − 2πi(a−½)b}R((a − ½)τ + b + ½; τ). Hypotheses: a ∈ (0, 1) (so sgn(ν) = sgn(ν + a − ½) on ½ + ℤ).

- **R_{a,b} as a period integral (Zwegers Prop. 4.2(2))** (lemma, `unary-r-period-integral`; Zwegers Prop. 4.2(2), p. 65). For a ∈ (0, 1), b ∈ ℝ: R_{a,b}(τ) = −i∫_{−τ̄}^{i∞} g_{a,−b}(z)/√(−i(z + τ)) dz. Hypotheses: Principal branch; path from −τ̄ vertically to i∞.

- **R_{a,b} is bounded towards rationals (Zwegers Prop. 4.2(3))** (lemma, `unary-r-bounded-at-rationals`; Zwegers Prop. 4.2(3), p. 65). For a ∈ (0, 1), b ∈ ℝ and ξ ∈ ℚ: R_{a,b}(τ) is bounded as τ ↓ ξ (τ = ξ + it, t ↓ 0).

- **∂R_{a,b}/∂τ̄ (Zwegers Prop. 4.2(4))** (lemma, `unary-r-tau-bar-derivative`; Zwegers Prop. 4.2(4), p. 65). For a ∈ (0, 1), b ∈ ℝ: ∂/∂τ̄ R_{a,b}(τ) = −i(2y)^{−1/2}g_{a,−b}(−τ̄).

- **R_{a,b} is annihilated by Δ_{1/2} (Zwegers Prop. 4.2(5))** (lemma, `unary-r-harmonic`; Zwegers Prop. 4.2(5), p. 65). For a ∈ (0, 1), b ∈ ℝ: τ ↦ R_{a,b}(τ) is an eigenfunction of Ω_{1/2} with eigenvalue 3/16, i.e. Δ_{1/2}R_{a,b} = 0.

- **ξ_{1/2}R_{a,b} = −√2·g_{a,b}: the shadow** (lemma `xiOperator_unaryR`, `xi-of-unary-real-analytic-theta`; Zwegers Prop. 4.2(4), p. 65). For a ∈ (0, 1), b ∈ ℝ and N ∈ ℕ_{>0}: ξ_{1/2}(R_{a,b}) = −√2·g_{a,b}, and ξ_{1/2}(τ ↦ R_{a,b}(Nτ)) = −√(2N)·g_{a,b}(Nτ), with ξ_{1/2} the ξ-operator of QM.3 in weight 1/2. Hypotheses: ξ_{1/2}f = 2iy^{1/2}\overline{∂_τ̄f} (QM.3/xi-operator with k = 1/2).

- **β-parts of indefinite theta series as unary series (Zwegers Prop. 4.3)** (lemma, `beta-series-as-unary-theta`; Zwegers Prop. 4.3, p. 66). Let c ∈ C_Q ∩ ℤ^r be primitive. Then there is a finite set P₀ ⊂ a + ℤ^r with {μ ∈ a + ℤ^r : B(c,μ)/(2Q(c)) ∈ [0, 1)} = ⊔_{μ₀∈P₀}(μ₀ + ⟨c⟩^⊥_ℤ) such that Σ_{ν∈a+ℤ^r} sgn(B(c,ν))β(−B(c,ν)²y/Q(c))e^{2πiQ(ν)τ+2πiB(ν,b)} = −Σ_{μ₀∈P₀} R_{B(c,μ₀)/2Q(c), −B(c,b)}(−2Q(c)τ)·Σ_{ξ∈μ₀^⊥+⟨c⟩^⊥_ℤ} e^{2πiQ(ξ)τ+2πiB(ξ, b^⊥)}, where μ₀^⊥ = μ₀ − B(c,μ₀)c/(2Q(c)), b^⊥ = b − B(c,b)c/(2Q(c)) and ⟨c⟩^⊥_ℤ = {ξ ∈ ℤ^r : B(c, ξ) = 0}. Hypotheses: c integral primitive in C_Q; the inner sums are positive definite theta series of rank r − 1 (Remark 4.4).


### 4I. The seventh-order mock theta functions

- **`seventhOrderF0`** (definition, `seventh-order-mock-theta-functions`; Zwegers §4.3, p. 67). Following Zwegers §4.3 (Hickerson's identities used as definitions): (q)_∞F₀(q) := (Σ_{r,s≥0} − Σ_{r,s<0})(−1)^{r+s}q^{3r²/2+4rs+3s²/2+r/2+s/2}, (q)_∞F₁(q) := (Σ_{r,s≥0} − Σ_{r,s<0})(−1)^{r+s}q^{3r²/2+4rs+3s²/2+5r/2+5s/2+1}, (q)_∞F₂(q) := (Σ_{r,s≥0} − Σ_{r,s<0})(−1)^{r+s}q^{3r²/2+4rs+3s²/2+3r/2+3s/2}, with (q)_∞ = ∏(1 − q^n) and q = e(τ); and F₇(τ) := (q^{−1/168}F₀(q), q^{47/168}F₂(q), q^{−25/168}F₁(q)) (fractional powers e(sτ)). Hypotheses: The identification with Ramanujan's Eulerian series (e.g. F₀(q) = Σ_{n≥0}q^{n²}/(q^{n+1}; q)_n) is Hickerson's theorem, which Zwegers takes as the definition; it is recorded as a gap, not used. API: `seventhOrderF0`, `seventhOrderF1`, `seventhOrderF2`, `seventhOrderVector`, `differentiable_seventhOrderVector`. Unit tests: `seventhOrder_F0_coeff_test` (The q-expansion of F₀ begins 1 + q + q³ + q⁴ + q⁵ + 2q⁷ + q⁸ + 2q⁹); `seventhOrder_T_test` (F₇(τ + 1) = diag(ζ₁₆₈^{−1}, ζ₁₆₈^{47}, ζ₁₆₈^{−25})F₇(τ)); `seventhOrder_not_modular_test` (F₇(−1/τ) ≠ √(−iτ)M₇F₇(τ): the defect is the non-zero period integral of Cor. 4.6); `seventhOrder_F_holo_test` (Each component of F₇ is holomorphic on ℍ (ξ_{1/2}F₇ = 0)).

- **F₀, F₁, F₂ as sign-difference sums (Zwegers §4.3)** (lemma, `seventh-order-indefinite-theta-identities`; Zwegers §4.3, p. 67). With A = (3 4; 4 3), c₁ = (−3, 4), c₂ = (−4, 3), e = (1, 1) (B(c₁,c₂) = −28, Q(c₁) = Q(c₂) = −21/2): 2η(τ)ζ₁₄q^{−1/168}F₀(q) = Σ_{ν∈e/14+ℤ²}{sgn B(ν,c₁) − sgn B(ν,c₂)}e^{2πiQ(ν)τ+2πiB(ν,e/14)}; 2ηζ₁₄q^{47/168}F₂(q) = the same with ν ∈ 3e/14 + ℤ² and B(ν, 5e/14); 2ηζ₁₄q^{−25/168}F₁(q) = the same with ν ∈ 5e/14 + ℤ² and B(ν, 3e/14). Hypotheses: ζ_n = e^{2πi/n}; η = q^{1/24}(q)_∞.

- **`seventhOrderH`** (construction, `seventh-order-completion`; Zwegers §4.3, p. 68). With A = (3 4; 4 3), c₁ = (−3, 4), c₂ = (−4, 3), e = (1, 1): H₇(τ) := (ζ₁₄^{−1}/(2η(τ)))·(ϑ_{e/14,e/14}, ϑ_{3e/14,5e/14}, ϑ_{5e/14,3e/14})(τ) (indefinite theta functions with respect to (c₁, c₂)), and G₇(τ) := −(ζ₈₄^{−13}R_{13/42,−1/2} + ζ₈₄R_{41/42,−1/2}, ζ₈₄^{29}R_{11/42,−5/2} + ζ₈₄^{−41}R_{25/42,−5/2}, ζ₂₈^{5}R_{23/42,−3/2} + ζ₂₈^{−9}R_{37/42,−3/2})(21τ) (Zwegers §4.3). H₇ is real-analytic; G₇ is a vector of non-holomorphic unary theta functions. Hypotheses: c₁, c₂ ∈ C_Q (the component containing c₁); a, b admissible (all in the open cone, so R(c) = ℝ²). API: `seventhOrderH`, `seventhOrderG`, `seventhOrderM`, `seventhOrderM_sq`. Unit tests: `seventhOrderH_T_test` (H₇(τ + 1) = diag(ζ₁₆₈^{−1}, ζ₁₆₈^{47}, ζ₁₆₈^{−25})H₇(τ)); `seventhOrderH_S_test` (H₇(−1/τ) = √(−iτ)M₇H₇(τ)); `seventhOrderG_ne_zero_test` (G₇ ≠ 0 (it is not holomorphic: ∂_τ̄G₇ ≠ 0), so H₇ ≠ F₇); `seventhOrderH_decomp_test` (H₇ = F₇ − G₇).

- **F₇ = H₇ + G₇ (Zwegers Prop. 4.5, identity)** (lemma `seventhOrderVector_eq`, `seventh-order-decomposition`; Zwegers Prop. 4.5, p. 68). F₇(τ) = H₇(τ) + G₇(τ) for all τ ∈ ℍ.

- **H₇ is a vector-valued real-analytic modular form of weight 1/2 (Zwegers Prop. 4.5(1))** (theorem `seventhOrderH_transform`, `seventh-order-completion-transformation`; Zwegers Prop. 4.5(1), p. 68). H₇(τ + 1) = diag(ζ₁₆₈^{−1}, ζ₁₆₈^{47}, ζ₁₆₈^{−25})H₇(τ) and H₇(−1/τ) = √(−iτ)M₇H₇(τ), with M₇ = (2/√7)(sin π/7, sin 3π/7, sin 2π/7; sin 3π/7, −sin 2π/7, sin π/7; sin 2π/7, sin π/7, −sin 3π/7); each component of H₇ is an eigenfunction of Ω_{1/2} with eigenvalue 3/16. Hypotheses: Principal branch of √(−iτ). Planet: Zwegers' completion of F₇ (weight 1/2).

- **G₇ is bounded towards rationals (Zwegers Prop. 4.5(2))** (lemma `seventhOrderG_bounded`, `seventh-order-correction-bounded`; Zwegers Prop. 4.5(2), p. 68). For ξ ∈ ℚ, G₇(τ) is bounded as τ ↓ ξ.

- **`seventhOrderShadow`** (definition, `seventh-order-shadow-theta`; Zwegers §4.3, p. 70). g₇(τ) := (ζ₈₄^{−13}g_{13/42,1/2} + ζ₈₄g_{41/42,1/2}, ζ₈₄^{73}g_{11/42,1/2} + ζ₈₄^{59}g_{25/42,1/2}, ζ₈₄^{61}g_{23/42,1/2} + ζ₈₄^{47}g_{37/42,1/2})(21τ), with g_{a,b} = QM.4/unary-theta-function (Zwegers §4.3). It satisfies g₇(−1/τ) = −M₇(−iτ)^{3/2}g₇(τ) (stated by Zwegers as 'verified using standard methods'; derived here from Prop. 4.5(1) and QM.4/seventh-order-shadow). Hypotheses: Principal branch of (−iτ)^{3/2}. API: `seventhOrderShadow`, `seventhOrderShadow_S`, `differentiable_seventhOrderShadow`. Unit tests: `seventhOrderShadow_S_test` (g₇(−1/τ) = −M₇(−iτ)^{3/2}g₇(τ)); `seventhOrderShadow_first_test` (The first component of g₇ is ζ₈₄^{−13}g_{13/42,1/2}(21τ) + ζ₈₄g_{41/42,1/2}(21τ)); `seventhOrderShadow_ne_zero_test` (g₇ ≠ 0 (so F₇ is not modular)); `seventhOrderShadow_holo_test` (g₇ is holomorphic on ℍ).

- **Δ_{1/2}H₇ = 0 and ξ_{1/2}H₇ = −√42·g₇** (theorem `xiOperator_seventhOrderH`, `seventh-order-shadow`; Zwegers proof of Prop. 4.5, p. 70). Each component of H₇ is annihilated by Δ_{1/2}, and ξ_{1/2}H₇ = −√42·g₇ (componentwise, ξ_{1/2} of QM.3). Hence the holomorphic part F₇ of H₇ is a vector-valued mock modular form of weight 1/2 whose shadow is the weight-3/2 unary theta vector g₇. Hypotheses: ξ_{1/2}, Δ_{1/2} from QM.3 in weight 1/2 (real weight).

- **The non-modularity of F₇ as a period integral (Zwegers Cor. 4.6)** (theorem `seventhOrderVector_sub_S`, `seventh-order-non-modularity`; Zwegers Cor. 4.6, p. 71). F₇(τ) − (−iτ)^{−1/2}M₇F₇(−1/τ) = i√21∫_0^{i∞} g₇(z)/√(−i(z + τ)) dz (componentwise), and F₇(τ + 1) = diag(ζ₁₆₈^{−1}, ζ₁₆₈^{47}, ζ₁₆₈^{−25})F₇(τ). Hypotheses: Principal branches.


### 4J. The fifth-order mock theta functions (second pass)

- **The eight fifth-order mock theta functions, through Andrews' double-sum identities** (definition, `fifth-order-mock-theta-functions`; §4.4, the eight displayed identities and the sentence after them (printed pp. 71-72)). Eight of Ramanujan's ten fifth-order mock theta functions are defined here, and the definitions used are Andrews' double-sum identities rather than Ramanujan's Eulerian series: f0, F0, psi0, phi0, f1, F1, psi1, phi1, each written as a double sum over n at least zero and j in the stated range, divided by one of the products (q)_infinity, (q^2; q^2)_infinity, (-q)_infinity/(q)_infinity or (-q; q^2)_infinity/(q^2; q^2)_infinity. The exponents are quadratic in n and j with the fifth-order shape, and each summand carries a factor 1 minus or 1 plus a power of q. Two of the eight identities as printed in Andrews' paper are wrong, and Zwegers records that: the third and the eighth. He uses the corrected identities as the definitions, and so does this node, so that every later statement is about the corrected objects. The remaining two fifth-order functions of Ramanujan's list are treated in the next section of the thesis and are not planned here. Hypotheses: The identities are taken as definitions; the equivalence with Ramanujan's Eulerian series is Andrews' theorem and is not re-proved here. Two of Andrews' printed identities contain errors, which Zwegers corrects; the corrected forms are the definitions. Only eight of the ten fifth-order functions are covered. API: `fifthOrderF0`, `fifthOrderCapF0`, `fifthOrderPsi0`, `fifthOrderPhi0`, `fifthOrderVectorOne`, `andrews_corrections`. Unit tests: `fifthOrder_f0_coeff_test` (The q-expansion of f0 begins 1 + q/(1 + q) + ...; its first integral coefficients are 1, 1, -1, 0, 1, ... in the normalisation fixed here.); `fifthOrder_prefactor_test` (The prefactors of F_{5,1} are q^{-1/60}, q^{11/60}, q^{-1/240}, q^{71/240}, q^{-1/240}, q^{71/240}; a wrong prefactor breaks the T-transformation of the next node.); `fifthOrder_two_missing_test` (The two remaining fifth-order functions of Ramanujan's list are not among these eight and are not planned here.); `fifthOrder_andrews_error_test` (Andrews' printed third and eighth identities do not define the same functions as the corrected ones; using them as printed would make the following lemma false.).

- **The first six fifth-order functions as sign-difference sums (Zwegers Lemma 4.8)** (lemma, `fifth-order-indefinite-theta-identities-first-six`; §4.4, Lemma 4.8 and the Remark after it (printed pp. 72-73)). Set A to be the diagonal two by two matrix with entries 5 and -2, let Q and B be the associated quadratic and bilinear forms, and set c1 to be the vector with entries 2 and 5 and c2 the vector with entries -2 and 5. Then each of the six functions of the vector F_{5,1}, multiplied by twice the eta function and by its q-power prefactor, equals a sum over the shifted lattice of the difference of the signs of B(nu, c1) and B(nu, c2), times the exponential of 2 pi i Q(nu) tau plus 2 pi i B(nu, b), for the six explicitly listed pairs of characteristics. The six shifts are (1/10, 0), (3/10, 0), (1/5, 1/4), (2/5, 1/4), (1/5, 1/4) and (2/5, 1/4), and the six second characteristics are (0, 1/4), (0, 1/4), (1/2, 1), (1/2, 2), (0, 1/4) and (0, 1/4), with the last two identities carrying an extra factor of the inverse of a primitive eighth root of unity. Moreover B(c1, c2) is -70 and Q(c1) = Q(c2) = -15, so that if the positive cone is chosen to contain c1 it also contains c2, which is the hypothesis the indefinite theta machinery needs. Hypotheses: A is the diagonal matrix with entries 5 and -2, so the form is indefinite of signature (1, 1), which is what the indefinite theta construction requires. c1 and c2 must lie in the same component of the positive cone; the computation B(c1, c2) = -70 and Q(c1) = Q(c2) = -15 is what guarantees it. The identities are for the corrected Andrews definitions of the previous node.

- **The completion H_{5,1} and the correction G_{5,1} for the first six** (construction, `fifth-order-completion-first-six`; §4.4, the displays defining H_{5,1} and G_{5,1} (printed pp. 74-75)). Define H_{5,1} to be one over twice the eta function times the vector of the six indefinite theta functions with characteristics as in the previous lemma, the last two multiplied by a primitive eighth root of unity. Define G_{5,1} to be one half times the vector whose six entries are the explicitly listed combinations of the unary real-analytic theta functions R with the stated rational indices and second parameters, all evaluated at thirty times tau: the first two entries are combinations of two R's with twelfth roots of unity as coefficients, the third and fourth are alternating sums of four R's with second parameter zero, and the last two are combinations of four R's with twenty-fourth roots of unity and second parameter five halves. The construction mirrors the seventh-order one exactly, with the level 30 in place of 21 and six components in place of three. Hypotheses: The indefinite theta functions are those of the previous lemma, so their characteristics and their cone data are fixed there. The unary R functions are the ones of the unary real-analytic theta node, evaluated at thirty tau. This is a construction, not yet a theorem; the identity F = H + G and the transformation law are the next node. API: `fifthOrderH`, `fifthOrderG`, `fifthOrderM`, `fifthOrderLevel`. Unit tests: `fifthOrderH_entries_test` (The last two entries of H_{5,1} carry a primitive eighth root of unity and the first four do not.); `fifthOrderG_level_test` (Every unary R in G_{5,1} is evaluated at thirty tau; the seventh-order analogue uses twenty-one tau.); `fifthOrderG_ne_zero_test` (G_{5,1} is not zero, since its tau-bar derivative is a non-zero weight three halves theta vector; so H_{5,1} is not F_{5,1}.); `fifthOrderM_block_test` (M_5 is block structured: it exchanges the first two components with the third and fourth and acts on the last two by a two by two block.).

- **F_{5,1} = H_{5,1} + G_{5,1}, and the modularity of the completion (Zwegers Prop. 4.10)** (theorem, `fifth-order-decomposition-and-transformation-first-six`; §4.4, Proposition 4.10 (printed pp. 75-76)). The vector F_{5,1} of the first six fifth-order mock theta functions equals H_{5,1} plus G_{5,1}, and moreover: H_{5,1} is a vector-valued real-analytic modular form of weight one half, with H_{5,1} at tau plus one equal to the displayed diagonal-and-permutation matrix, whose entries are a primitive sixtieth root of unity to the powers minus one and eleven in the first two places and a primitive two hundred and fortieth root of unity to the powers minus one and seventy-one in the four remaining places, times H_{5,1} at tau; and H_{5,1} at minus one over tau equal to the square root of minus i tau times two over the square root of five times the matrix M_5 times H_{5,1} at tau, where M_5 is the displayed six by six matrix of sines. H_{5,1} is an eigenfunction of the weight one half Casimir operator with eigenvalue three sixteenths. And G_{5,1} is bounded as tau tends to any rational point from above. Hypotheses: The vectors are those of the previous node; the characteristics and the cone data come from the lemma. The T-matrix is not diagonal: it permutes the third and fifth and the fourth and sixth components, because the two half-argument variants are exchanged. The boundedness of G is towards rationals from above and is what makes the radial-limit statements of the consuming layer possible.

- **The remaining four fifth-order functions as sign-difference sums (Zwegers Lemma 4.11)** (lemma, `fifth-order-indefinite-theta-identities-last-four`; §4.4, Lemma 4.11 (printed pp. 77-78)). With the same matrix A, the same c1 and c2, the four functions psi0, psi1, phi0 and phi1 also become sign-difference sums, after multiplication by twice a root of unity times a quotient of eta functions and by a q-power prefactor: for the two psi functions the quotient is eta of tau squared over eta of two tau, with the shifts (1/10, 1/6) and (3/10, 1/6) and second characteristic (0, 1/6); for the two phi functions, evaluated at minus the square root of q, the quotient is eta of tau squared over eta of tau over two, with the shifts (1/5, 1/6) and (2/5, 1/6) and second characteristic (1/10, 1/6), and the fourth identity carries an overall minus sign. The prefactors are q to the minus one sixtieth, q to the eleven sixtieths, q to the minus one two hundred and fortieth and q to the minus forty-nine two hundred and fortieths respectively, and the roots of unity are inverse twelfth and sixtieth roots. Hypotheses: The same A, c1, c2 as for the first six, so the cone computation carries over unchanged. The eta quotients are different for the psi and the phi families, and the phi functions are evaluated at minus the square root of q. One of the four identities carries an overall minus sign, which must not be dropped.

- **F_{5,2} = H_{5,2} + G_{5,2}, and the holomorphic sum F_5 (Zwegers Props. 4.13 and 4.14)** (theorem, `fifth-order-completion-and-transformation-last-four`; §4.4, Proposition 4.13 (printed pp. 79-81)). The four remaining functions are collected into a second vector F_{5,2} of six components, built from psi0, psi1 and the two phi functions at both square roots of q. It decomposes as H_{5,2} plus G_{5,2}, where H_{5,2} is one over twice the relevant eta quotient times the vector of the four indefinite theta functions of the previous lemma with their characteristics, and G_{5,2} is the corresponding combination of unary real-analytic theta functions. H_{5,2} is a vector-valued real-analytic modular form of weight one half with exactly the same T-matrix and the same S-matrix M_5 as H_{5,1}, and with the same Casimir eigenvalue three sixteenths; and G_{5,2} is bounded as tau tends to a rational point from above. The point of the section is the consequence: G_{5,2} equals minus G_{5,1}, so the two corrections cancel and the holomorphic sum F_5 := F_{5,1} + F_{5,2} equals H_{5,1} + H_{5,2} and is therefore a genuine vector-valued modular form of weight one half, with the same two matrices. Concretely, each of the six explicit combinations - f0 plus twice psi0, f1 plus twice psi1, the F0 and phi0 combination at the square root of q, the F1 minus phi1 combination, and the two variants at minus the square root of q - is a modular form on a suitable congruence subgroup. The first four of these six identities were already known to Watson. Hypotheses: The four functions and their identities are those of the previous lemma; the second vector has six components, built from the four functions at both square roots of q. The cancellation G_{5,2} = -G_{5,1} is what makes the sum holomorphic; it is a computation with the unary R functions and is not a formal consequence of the two decompositions. The resulting modularity is on a congruence subgroup, which is not named explicitly in the source.

### 4K. The index-13 meromorphic Jacobi example (second pass)

- **The index-13 weight-1 meromorphic Jacobi form and its vector-valued completion (Zwegers Prop. 3.12)** (construction, `index-thirteen-weight-one-meromorphic-jacobi-example`; §3.5, the opening definition and the residue computation (printed pp. 60-61)). Let phi be the quotient whose numerator is the ninth power of the product of the three even theta functions of characteristics (0,0), (0,1/2) and (1/2,0), and whose denominator is the discriminant function times the odd theta function of characteristic (1/2,1/2). Then phi transforms like a Jacobi form of weight one and index thirteen on the full modular group; it is meromorphic in the elliptic variable with simple poles exactly on the lattice; and with the base point taken to be minus half tau minus one half the singular set reduces to the single point zero. The residue at zero is computed by Jacobi's derivative formula to be minus one hundred and twenty eight over pi, a constant. Applying the corollary on meromorphic Jacobi forms with simple poles gives the decomposition of phi as the sum over the twenty six residue classes of a coefficient function times the index-thirteen theta function, plus five hundred and twelve i times the completed level-thirteen Appell function; the coefficient functions are given by the explicit integral over a period plus two hundred and fifty six i times the level-thirteen R at zero. The twenty six coefficient functions form a vector-valued real-analytic modular form of weight one half, with the displayed T and S transformations, and they are eigenfunctions of the weight one half Casimir operator with eigenvalue three sixteenths; their tau-bar derivative is the stated multiple of the complex conjugate of a weight three halves theta function. Hypotheses: The quotient is meromorphic in the elliptic variable with simple poles on the lattice; the base point must be chosen so that the singular set is a single point, and the choice minus half tau minus one half does that. The residue is constant in tau, and that is special to this example. The transformation of phi like a Jacobi form of weight one and index thirteen is read off from the classical theta transformation table; Zwegers records a misprint in that table, in the fourth formula on the right, which should carry a factor minus i. API: `indexThirteenPhi`, `indexThirteenPhi_jacobi`, `indexThirteenPhi_residue`, `indexThirteenCoefficients`, `indexThirteenCoefficients_modular`, `indexThirteenCoefficients_shadow`. Unit tests: `indexThirteen_residue_test` (The residue at zero is minus one hundred and twenty eight over pi, independent of tau; this is the computation that makes the example work.); `indexThirteen_index_test` (The index is thirteen, so the decomposition runs over twenty six residue classes and the theta functions are the index thirteen ones.); `indexThirteen_T_test` (The coefficient function at tau plus one is a primitive twenty sixth root of unity to the minus the square of the index, times itself.); `indexThirteen_not_generic_test` (The coefficient functions are Casimir eigenfunctions only because the residues are constant; for a general meromorphic Jacobi form they are not, and one does not obtain a real-analytic modular form at all.).

- **Why the index-13 example is special, and what the general case does not give** (comparison, `index-thirteen-example-is-not-the-general-case`; §3.5, the closing paragraph (printed p. 62)). The index-thirteen example is constructed so that the residues of the meromorphic Jacobi form are constant as functions of tau. That is what makes the level-thirteen correction terms Casimir eigenfunctions, and hence makes the vector of coefficient functions a real-analytic modular form. In general the residues are not constant, the coefficient functions are not eigenfunctions of a Casimir operator, and one does not end up with a real-analytic modular form at all: the general statement is the corollary on meromorphic Jacobi forms with simple poles, which gives a decomposition and the modularity of the residue functions, and nothing more. This node records that boundary, so that the worked example is not quoted as a general theorem about meromorphic Jacobi forms. Hypotheses: The general statement available is the corollary on simple poles together with the modularity of the residue functions. The constancy of the residues is a property of this particular quotient and is proved by Jacobi's derivative formula. This node records a boundary and proves nothing.
### Dependencies

Inside the roadmap: `QSeriesPartitionsAndMockModularForms:QM.1` (nodes `QM.1/jacobi-theta-function`,
`QM.1/jacobi-theta-elliptic`, `QM.1/jacobi-theta-zeros`, `QM.1/jacobi-theta-derivative`,
`QM.1/jacobi-theta-transformation`, `QM.1/dedekind-eta-multiplier`, `QM.1/jacobi-form`,
`QM.1/jacobi-elliptic-slash`, `QM.1/jacobi-modular-slash`, `QM.1/jacobi-theta-index` and
`QM.1/theta-decomposition`) and `QSeriesPartitionsAndMockModularForms:QM.3` (nodes
`QM.3/wirtinger-derivatives`, `QM.3/weight-k-hyperbolic-laplacian`, `QM.3/xi-operator` and
`QM.3/upper-incomplete-gamma`). From other roadmaps: `AutomorphicLFunctionsAndLocalFactors:AL.0`,
for Poisson summation over ℤ^r for Schwartz functions on ℝ^r (Mathlib has only r = 1), used in the
S-transformation of indefinite theta functions (request recorded). The layer's outputs feed QM.5
(the rank generating function and the asymptotics of mixed mock modular forms use
`QM.4/appell-lerch-sum` and `QM.4/zwegers-completion`).

Missing inputs (gaps): Hickerson's identification of the double sums defining F₀, F₁, F₂ with
Ramanujan's Eulerian series (a formal q-series identity, not public; the definitions and all
theorems here stand without it, and F₀ = 1 + q + q³ + q⁴ + q⁵ + 2q⁷ + q⁸ + 2q⁹ + ⋯ agrees with the
Eulerian series numerically); and the specialisation of functions satisfying the Jacobi laws at
torsion points without growth conditions (Eichler–Zagier Theorem 1.3), which Proposition 3.11 uses
and QM.1/jacobi-form must supply in that form.

**Second pass: this layer is now decomposed.** Zwegers §4.4 is the eight nodes of 4J and 4K above:
the eight functions through Andrews' identities (with the two printed identities Zwegers corrects),
Lemma 4.8 with A = (5 0; 0 −2), c₁ = (2, 5), c₂ = (−2, 5) and the cone computation B(c₁,c₂) = −70,
Q(c₁) = Q(c₂) = −15 that admits them, the completion H_{5,1} and correction G_{5,1} at level 30,
Proposition 4.10 with its 6 × 6 T- and S-matrices and the Casimir eigenvalue 3/16, Lemma 4.11 for
the remaining four, and Propositions 4.13 and 4.14 — where **G_{5,2} = −G_{5,1}**, so the two
corrections cancel and F₅ = F_{5,1} + F_{5,2} is a genuine *holomorphic* vector-valued modular form
of weight 1/2, its six components being the explicit combinations of the eight mock theta functions
(the first four of which were already known to Watson). And Proposition 3.12 of §3.5 is the
index-13 weight-1 meromorphic Jacobi form (ϑ₀₀ϑ₀₁ϑ₁₀)⁹/(Δϑ₁₁), whose residue at 0 is the *constant*
−128/π, with its decomposition and the modularity of (h_l)_{l mod 26} — together with the record
that **the example is special**: in general the residues are not constant, the coefficient functions
are not Casimir eigenfunctions, and one does not obtain a real-analytic modular form at all.
Ramanujan's third-order f(q) is not treated in the thesis (it refers to a paper that is not public).

Mistakes found in the source (recorded as source issues, none affecting a stated theorem): in the
proof of Theorem 3.9, "(5) of Proposition 3.5" should read (1c), and "(aτ + d)/(cτ + d)" should be
(aτ + b)/(cτ + d); after Definition 3.2, "Section 1.2" should be Section 1.3 (and m = 1/2 lies
outside the definition); the description of D′(c) in Proposition 2.7(7) holds only for c ∈ S_Q;
the S-law of g₇ is asserted without proof (derived here from Proposition 4.5(1) and the shadow
identity); and the convergence of R_{m,l} is asserted without proof (supplied).

### Acceptance tests

- **A mock series with its completion and transformation proof.** F₇ = H₇ + G₇, where
  H₇(τ + 1) = diag(ζ₁₆₈^{−1}, ζ₁₆₈^{47}, ζ₁₆₈^{−25})H₇(τ) and H₇(−1/τ) = √(−iτ)M₇H₇(τ) with
  M₇ = (2/√7)(sin π/7, sin 3π/7, sin 2π/7; sin 3π/7, −sin 2π/7, sin π/7; sin 2π/7, sin π/7,
  −sin 3π/7), M₇² = I; Δ_{1/2}H₇ = 0 and ξ_{1/2}H₇ = −√42·g₇; G₇ is bounded towards the rationals;
  F₇(τ) − (−iτ)^{−1/2}M₇F₇(−1/τ) = i√21∫_0^{i∞}g₇(z)(−i(z + τ))^{−1/2}dz ≠ 0, so F₇ itself is not
  modular.
- **Coefficients.** F₀(q) = 1 + q + q³ + q⁴ + q⁵ + 2q⁷ + q⁸ + 2q⁹ + ⋯ from Hickerson's double sum.
- **Completion.** μ̃(u/τ, v/τ; −1/τ) = −√(−iτ)e^{−πi(u−v)²/τ}μ̃(u, v; τ), while μ itself fails
  this law by (1/2i)h(u − v; τ); μ̃ is elliptic in (u, v) and has residue −1/(2πiϑ(v)) at u = 0.
- **Indefinite theta functions.** For A = (1 2; 2 1), c₁ = (−1, 2), c₂ = (−2, 1) and
  a = b = (1/6, 1/6): ϑ_{a,b} = 2e^{πi/3}η² (Zwegers Example 2.16); ϑ^{c,c} = 0; ϑ(−z) = −ϑ(z).
- **Special functions.** E(0) = 0, E′(0) = 2, E(x) = sgn(x)(1 − β(x²)); β(0) = 1; h(0; i) > 0 and
  h(0; i) + h(1; i) = 2e^{π/4}.

---

## QM.5 Arithmetic and quantum connections

This layer connects the q-series of QM.0–QM.4 with three kinds of arithmetic and quantum-topological
object: partition statistics that explain Ramanujan's congruences, traces of singular moduli, and
quantum modular forms, the functions on ℚ that arise as limits of q-series at roots of unity and, through
the Habiro ring, as quantum invariants of 3-manifolds. Its organising rule is the acceptance criterion of
the layer: **three different objects are kept apart and compared only by named theorems**.

* A **formal evaluation** at a root of unity ξ is the image of an element of the Habiro ring ℤ[q]^ under the
  evaluation map ev_ξ, or of its Taylor map at ξ (HabiroCyclotomicCompletions:HC.3). It is a finite algebraic
  expression, e.g. F(ξ) = Σ_{n<ord ξ}(ξ;ξ)_n.
* A **radial limit** (or **radial asymptotic expansion**) is an analytic statement about a q-series that
  converges only in the unit disc, as q → ξ along the radius.
* An **Eichler integral** is a function on the upper half-plane (holomorphic, f̃) or the lower half-plane
  (non-holomorphic, f*), built from a modular form.

The layer's theorems are exactly the comparisons: the Kontsevich–Zagier strange identity (formal evaluation
of F = radial expansion of an Eichler integral of η), the Lawrence–Zagier theorem and its Habiro form
(unified WRT invariant of the Poincaré sphere = radial limits of an Eichler integral), the
Bringmann–Rolen theorem (Eichler integrals of half-integral weight have quantum modular radial limits),
the Folsom–Ono–Rhoades theorem (radial limits of rank minus crank are formal unimodal values), and
Zagier's theorem on traces of singular moduli. No statement of this layer infers one kind of object from
another without such a theorem.

Suggested home: `TauCeti/NumberTheory/QSeries/{RadialLimit, PeriodicLValues, QuantumModularForm,
EichlerIntegral, Kontsevich, PoincareSphere, RankCrankRadial}` and
`TauCeti/Combinatorics/Enumerative/Partition/Crank`, `TauCeti/NumberTheory/ModularForms/SingularModuli/Traces`.

### Conventions (pinned)

* **Variables.** q = e^{2πiτ} with τ ∈ ℍ. A rational point x corresponds to the root of unity ξ = e^{2πix}.
  The **radial approach** is τ = x + it/(2π), t → 0⁺, which is q = ξe^{−t}; the approach from below is
  τ = x − it/(2π). Asymptotic expansions at x are power series in the single variable t = 2π·Im τ (from
  above) or −t (from below), exactly as in Bringmann–Rolen's definition of agreeing expansions.
* **Boundary factor.** For γ = (a b; c d) ∈ SL₂(ℤ), x ∈ ℝ with cx + d ≠ 0 and k ∈ ℝ, the factor j_k(γ, x) is the
  limit as y → 0⁺ of the principal power (c(x − iy) + d)^{−k}, i.e. the branch of the **lower** half-plane:
  |cx+d|^{−k} if cx + d > 0, |cx+d|^{−k}e^{iπk} if cx + d < 0 and c > 0, |cx+d|^{−k}e^{−iπk} if cx + d < 0 and
  c ≤ 0 (and 0 when cx + d = 0). In integral weight the branch plays no role. The lower branch is pinned
  because it is the one in which the half-integral weight examples (Eichler integrals, Kontsevich's φ) have
  constant multipliers; with the principal branch on ℝ the factor relating the two signs of x differs by −1.
* **Eichler integrals.** For f = Σ_{n≥1}a(n)e^{2πinτ/N} and weight w, f̃ = Σ (n/N)^{1−w}a(n)e^{2πinτ/N}, with
  no constant term. For unary theta series the sources drop the scalar N^{ν−1/2}; the declarations keep it
  and record the relation.
* **Partition statistics.** The crank count M(m, n) uses the convention M(0, 1) = −1, M(±1, 1) = 1 at n = 1
  (the vector-partition count), which is the one for which the crank generating function is exact. The rank
  count N(m, n) counts the empty partition (N(0, 0) = 1), as in Folsom–Ono–Rhoades; Atkin–Swinnerton-Dyer and
  Garvan set N(0, 0) = 0, which changes only the constant term.
* **Traces.** Q_d is the set of all (primitive or not) positive definite forms of discriminant −d, weighted by
  1/w_Q with w_Q = |PSL₂(ℤ)_Q| ∈ {1, 2, 3}; J = j − 744.

### What the libraries already have (consume)

Nothing of this layer's targets is in Mathlib or Tau Ceti at the pinned commits (the library audit finds all
four targets absent; there is no j-function on ℍ, no Eichler integral, no quantum modular form and no crank).
The layer consumes:

* Mathlib's **periodic L-functions** `ZMod.LFunction` (with `ZMod.LFunction_eq_LSeries` and
  `ZMod.differentiable_LFunction_of_sum_zero`), the **Hurwitz zeta function** `HurwitzZeta.hurwitzZeta` with
  `hurwitzZeta_neg_nat` (values at −k, k ≠ 0), `hurwitzZetaEven_apply_zero` and `hurwitzZetaOdd_one_sub`,
  **Bernoulli polynomials** (`Polynomial.bernoulli`, `bernoulliFun`, `bernoulliFun_eval_one`,
  `Polynomial.bernoulli_generating_function`);
* **Euler's pentagonal number theorem** `PowerSeries.WithPiTopology.hasProd_one_sub_X_pow` with
  `PowerSeries.pentagonalSeries`, the pi topology on power series
  (`PowerSeries.WithPiTopology.summable_of_tendsto_order_atTop_nhds_top`), `LaurentPolynomial`, `Nat.Partition`
  and `Nat.Partition.genFun`;
* the **Dedekind eta function** `ModularForm.eta` with its S-transformation `ModularForm.eta_comp_eq_csqrt_I_inv`
  and `ModularForm.eta_ne_zero`, `ModularForm.E₄`, `ModularForm.discriminant`, the level-one dimension facts
  `ModularForm.levelOne_weight_two_rank_zero` and `ModularForm.levelOne_weight_four_rank_one`, `jacobiTheta₂`,
  `jacobiTheta₂'` and `jacobiTheta₂'_functional_equation`, `CongruenceSubgroup.Gamma0`;
* complex analysis: `Complex.Gamma` with `Complex.Gamma_add_one` and `Complex.Gamma_mul_Gamma_one_sub`,
  `mellin` and `mellinInv_mellin_eq`, `Complex.integral_boundary_rect_eq_zero_of_differentiableOn`,
  `PhragmenLindelof.vertical_strip`, `AnalyticOnNhd`, `Asymptotics.IsBigO`, `Complex.betaIntegral`,
  `ordinaryHypergeometric`;
* cyclotomic arithmetic: `IsPrimitiveRoot`, `IsPrimitiveRoot.geom_sum_eq_zero`,
  `Polynomial.cyclotomic_eq_minpoly_rat`, `Polynomial.cyclotomic_prime`;
* Tau Ceti's **conjugate partition** `TauCeti.conjugate` (an involution, `TauCeti.conjugate_conjugate`) and the
  coset-permutation argument of `HeckeRing.GL2.heckeSlashSum_slash_invariant`.

### 5A. Radial limits, asymptotic expansions and periodic L-values

* **`HasRadialLimit G x L`** (definition): G(x + it/2π) → L as t → 0⁺; `HasRadialLimitBelow` is the same for
  G(x − it/2π); `radialLimit G x` is the value (0 if none). API: `HasRadialLimit.unique`,
  `HasRadialLimit.radialLimit_eq`, `HasRadialLimit.add`, `HasRadialLimit.const_mul`, `hasRadialLimit_iff_disc`
  (for G(τ) = g(e^{2πiτ}) this is g(e^{2πix}e^{−t}) → L), `HasRadialLimit.of_continuousWithinAt`,
  `HasRadialLimit.comp_add_one` (if G(τ + 1) = cG(τ) the limit at x + 1 is c·L). Unit tests:
  `HasRadialLimit.test_qParam` (e^{2πiτ} has limit e^{2πix}), `.test_const`, `.test_geometric_pole` (q/(1 − q) has
  no radial limit at 0), `.test_below_conj`.
* **`HasRadialExpansion G x a`** (definition): for every R, G(x + it/2π) − Σ_{r<R}a_r t^r = O(t^R) as t → 0⁺;
  `HasRadialExpansionBelow` uses (−t)^r; **`RadialExpansionsAgree f g x`** (Bringmann–Rolen) means one series a
  serves as expansion of f from above and of g from below. API: `HasRadialExpansion.unique`,
  `.hasRadialLimit` (constant term = radial limit), `.add`, `.mul`, `.of_isBigO_all` (flat functions),
  `.of_hasSum` (convergent Taylor series), `RadialExpansionsAgree.radialLimit_eq`. Unit tests:
  `HasRadialExpansion.test_qParam_pow` (q^m has expansion e^{2πimx}exp(−mt)), `.test_zero`, `.test_flat`
  (e^{−2πi/τ} is flat at 0 but non-zero: the expansion does not determine the function),
  `.test_constantCoeff`.
* **Hurwitz zeta at 0** (lemma): hurwitzZeta x 0 = 1/2 − x for x ∈ (0, 1] (the k = 0 case missing from
  Mathlib's `hurwitzZeta_neg_nat`; false at x = 0).
* **Periodic L-values** (lemma, Lawrence–Zagier (12)): for Φ : ZMod M → ℂ and r ≥ 1,
  L(−r, Φ) = −(M^r/(r+1))Σ_{n=1}^{M}Φ(n)B_{r+1}(n/M); for r = 0 the same with Σ Φ = 0, i.e. the
  **renormalised sum** L(0, Φ) = −Σ_{n=1}^{M}(n/M − 1/2)Φ(n).
* **Euler–Maclaurin asymptotics** (lemma): for f smooth with rapidly decaying derivatives and a ∈ (0, 1],
  Σ_{m≥0}f((m + a)t) = I_f/t − Σ_{n<N}b_n B_{n+1}(a)/(n+1)·t^n + O(t^N), b_n = f^{(n)}(0)/n!, I_f = ∫_0^∞f. Note the
  sign: the Euler ansatz Σ b_nζ(−n, a)t^n with ζ(−n, a) = −B_{n+1}(a)/(n+1); for f = e^{−x} the formula must
  reproduce e^{−at}/(1 − e^{−t}). Periodic corollary: for mean-zero Φ, Σ Φ(n)f(nt) ∼ Σ b_nL(−n, Φ)t^n.
* **Exponential and Gaussian sums** (lemmas, Lawrence–Zagier Proposition): for mean-zero Φ,
  Σ_{n≥1}Φ(n)e^{−nt} = Σ_r L(−r, Φ)(−t)^r/r! (convergent for t < 2π/M), and for ν ∈ {0, 1},
  Σ_{n≥1}n^νΦ(n)e^{−n²t} ∼ Σ_r L(−2r − ν, Φ)(−t)^r/r!; hence the three renormalised sums (the two limits and
  L(0, Φ)) coincide. These are the engine of every radial-limit computation below.

### 5B. Quantum modular forms and Eichler integrals

* **`IsQuantumModularForm Γ k ε f`** (definition, Zagier's canonical definition): for f : ℚ → ℂ, the quantum
  slash (f|_{k,ε}γ)(x) = ε(γ)j_k(γ, x)f(γx) (`quantumSlash`) and the period function
  h_γ = f − f|_{k,ε}γ (`quantumPeriodFunction`); f is quantum modular of weight k on Γ ≤ SL₂(ℤ) with multiplier
  ε : SL₂(ℤ) → ℂ if for every γ ∈ Γ there are a finite S_γ ⊂ ℝ and H : ℝ → ℂ real-analytic on ℝ ∖ S_γ with
  H = h_γ on ℚ ∖ S_γ. The definition is deliberately weak: restrictions of real-analytic functions are quantum
  modular of every integral weight. API: `boundaryFactor` (the pinned j_k), `boundaryFactor_of_pos`,
  `boundaryFactor_eq_limit` (the lower-half-plane limit of Mathlib's principal power), `boundaryFactor_int`,
  `IsQuantumModularForm.add`, `.smul`, `.mono`, `isQuantumModularForm_of_analyticOnNhd`,
  `isQuantumModularForm_iff_generators`. Unit tests: `IsQuantumModularForm.test_const`, `.test_sq`
  (x ↦ x² in weight 1), `.test_indicator_int` (the indicator of ℤ is not quantum modular: its S-period function
  is −1 at the points 1/m, which accumulate only at 0), `boundaryFactor.test_neg`
  (j_{3/2}(S, x) = −i|x|^{−3/2} for x < 0), `boundaryFactor.test_int_compat`.
* **Cocycle relation** (lemma): if ε·j_k is a multiplier system on Γ (J(γ₁γ₂, x) = J(γ₁, γ₂x)J(γ₂, x)), then
  h_{γ₁γ₂} = h_{γ₁}|γ₂ + h_{γ₂}, and quantum modularity need only be checked on generators.
* **`eichlerIntegral w N a`** (definition): f̃(τ) = Σ_{n≥1}(n/N)^{1−w}a(n)e^{2πinτ/N}; (2πi)^{−1}d/dτ lowers the
  weight by one and weight 1 gives f itself, so for integer k ≥ 1 it is the normalised (k − 1)-fold primitive.
  For a level-one cusp form of integral weight it is Σ a(n)n^{1−k}qⁿ, the Eichler integral of Tau Ceti's modular
  symbols layer. API: `hasSum_eichlerIntegral`, `differentiableOn_eichlerIntegral`, `eichlerIntegral_add`,
  `eichlerIntegral_smul`, `eichlerIntegral_one`, `deriv_eichlerIntegral`, `eichlerIntegral_add_N`,
  `eichlerIntegral_unaryTheta` (for a(n²) = n^νC(n) the integral is N^{ν−1/2}Σ n^{1−ν}C(n)q^{n²/N}),
  `eichlerIntegral_qExpansion`, `tendsto_eichlerIntegral_atImInfty`. Unit tests: `eichlerIntegral.test_weight_one`,
  `.test_delta_coeff` (the q²-coefficient of Δ̃ is −3/256), `.test_eta_normalisation` (Zagier's
  η̃ = Σ nχ₁₂(n)q^{n²/24} is √24 times the weight-1/2 Eichler integral of η), `.test_no_constant`.
* **`nonholomorphicEichlerIntegral k f`** (construction): for f ∈ S_k(N), k ∈ ½ + ℕ₀, 4 | N (half-integral weight
  cusp forms with Shimura's multiplier, MetaplecticAutomorphicForms:MP.7),
  f*(τ) = ((−2πi)^{k−1}/Γ(k − 1))∫_{τ̄}^{i∞}f(w)(w − τ)^{k−2}dw on H⁻; termwise
  f* = Γ(k − 1)^{−1}Σ a(n)n^{1−k}e^{2πinτ}Γ(k − 1, 4πn|Im τ|) with the upper incomplete gamma function of complex
  parameter. API: `nonholomorphicEichlerIntegral_eq_tsum`, `_add`, `_smul`, `_add_one`, `_path`. Unit tests:
  `nonholomorphicEichlerIntegral.test_zero`, `.test_single_term`, `.test_not_holomorphic`.
* **`eichlerPeriodIntegral k f α`** (construction): r_{f,α}(z) = ((−2πi)^{k−1}/Γ(k − 1))∫_α^{i∞}f(w)(w − z)^{k−2}dw,
  real-analytic on ℝ ∖ {α} — the half-integral weight analogue of the period polynomial, never a polynomial.
  API: `analyticOnNhd_eichlerPeriodIntegral`, `eichlerPeriodIntegral_sub` (difference of two base points as an
  integral along an arc from α to β in ℍ), `eichlerPeriodIntegral_add_one`, `eichlerPeriodIntegral_linear`. Unit
  tests: `eichlerPeriodIntegral.test_zero`, `.test_self_difference`, `.test_sub_nonholomorphic`.
* **The Bringmann–Rolen chain** (lemmas), each with its hypotheses:
  1. *Transformation law* (their (2.4)): for γ ∈ Γ₀(N), f* − χ₋₄(d)·f*|_{2−k}γ = r_{f,−d/c} on H⁻, Shimura's slash,
     principal branch; the proof substitutes w = γu and tracks the branch of ((cu+d)(cτ+d))^{2−k}.
  2. *Non-tangential boundary values*: f* extends continuously to x ∈ ℚ within Stolz angles, with the vertical
     limit as value (needed because f*(γτ) approaches γx along a curve tangent to the vertical, not along it).
  3. *Twisted L-functions* L_f(e^{2πid/c}; s): entire, vanishing at s = 0, −1, −2, … (Hecke's integral and the
     Fricke involution on each nebentypus component of S_k(Γ₁(Nc²))).
  4. *Stirling's estimate* |Γ(x + iy)| ≍ |y|^{x−1/2}e^{−π|y|/2} uniformly in vertical strips, and the resulting
     polynomial growth of L_f(ζ; s) in vertical strips (Phragmén–Lindelöf).
  5. *Mellin transfer*: poles of the Mellin transform with rapid vertical decay give the asymptotic expansion.
  6. *Expansion of f̃*: f̃(x + it/2π) ∼ Σ ((−1)ⁿ/n!)L_f(ζ_x; k − 1 − n)tⁿ.
  7. *Incomplete-gamma residues*: M(e^tΓ(k − 1, 2t))(s) = β(1/2; s, 2 − k − s)Γ(k − 1 + s) has simple poles at −ℕ₀
     with residue Γ(k − 1)/n! and poles at s ≤ 1 − k half-integral, cancelled by the zeros of L_f.
  8. *Expansion of f**: f*(x − it/2π) ∼ Σ (1/n!)L_f(ζ_x; k − 1 − n)tⁿ.
* **Theorem (agreement, Bringmann–Rolen Proposition 2.1).** f̃ and f* have agreeing radial expansions at every
  rational point.
* **Theorem (Bringmann–Rolen Theorem 1.1).** For f ∈ S_k(N), k ∈ ½ + ℕ₀, 4 | N, the radial limits of f̃ form a
  quantum modular form of weight 2 − k on Γ₀(N) with multiplier χ₋₄(d)ε_d^{2(2−k)}(c/d), whose period function
  for γ is r_{f,−d/c}, real-analytic except at γ⁻¹∞. **Corollary 1.2:** Q_f(x) = L_f(e^{2πix}; k − 1) is quantum
  modular in the same way. The statement is for trivial character; the applications below need the
  multiplier-system version (η on SL₂(ℤ), the pair Θ± with a Weil representation), whose proof is the same chain
  with the multiplier replacing χ₋₄(d)ε_d^{2(2−k)}(c/d) and periodic L-functions (`ZMod.LFunction`) replacing
  step 3.

### 5C. Kontsevich's strange series and Cohen's σ

* **Kontsevich's series** (definition): F = Σ_{n≥0}(q;q)_n as an element of the Habiro ring
  (HabiroCyclotomicCompletions:HC.1; each term lies in the n-th defining ideal). It is not a power series in q
  (the q-coefficient of the partial sums is −M) and converges on no open set. Its formal values
  `kontsevichValue ξ` = F(ξ) = Σ_{n<ord ξ}(ξ;ξ)_n are the Habiro evaluations, its expansions
  `kontsevichTaylor ξ` = Σ_n(ξe^{−t};ξe^{−t})_n ∈ ℂ⟦t⟧ the Taylor maps (HC.3), and `kontsevichPhi` is
  φ(x) = e^{πix/12}F(e^{2πix}). API: `kontsevichValue_eq_sum_range`, `constantCoeff_kontsevichTaylor`,
  `kontsevichValue_galois` (σ(F(ξ)) = F(σξ)), `kontsevichPhi_add_one` (φ(x + 1) = e^{2πi/24}φ(x)),
  `kontsevichPhi_neg` (φ(−x) = φ(x)‾). Unit tests: `kontsevichValue.test_one` (F(1) = 1), `.test_neg_one`
  (F(−1) = 3), `.test_I` (F(i) = 8 − 3i), `kontsevichTaylor.test_one_coeffs` (1, 1, 3/2),
  `kontsevichValue.test_not_power_series`.
* **Sum of tails** (definition): F₁ = Σ_{n≥1}n(q;q)_{n−1}qⁿ ∈ ℤ⟦q⟧ (`sumOfTails`), equal to
  F₂ = Σ[(q;q)_n − (q;q)_∞] (`tailsSeries`), also a holomorphic function on the disc (`sumOfTailsFun`). API:
  `sumOfTails_eq_tailsSeries`, `sumOfTailsFun_eq_tsum`, `coeff_sumOfTails`. Unit tests: `sumOfTails.test_coeffs`
  (q + 2q² + q³ + ⋯), `.test_constantCoeff`, `.test_eq_tails`.
* **Uniform Pochhammer bound** (lemma): at q = ξe^{−t}, ξ = e^{2πih/k}, and w ∈ ⟨ξ⟩, |(wq;q)_n| ≤ C and
  |(wq;q)_n| ≤ C_m t^m for n ≥ (m + 1)k, uniformly in n and t. The proof groups factors in blocks of k, where
  ∏_{i≤k}(1 − wξ^ix) = 1 − x^k; termwise bounds grow like e^{c/t} and are useless.
* **Agreement of F₁ with F** (lemma): the partial summation identity Σ_{n<N}[(q;q)_n − (q;q)_N] =
  Σ_{n≤N}n(q;q)_{n−1}qⁿ, and, from the uniform bound, F₁ has radial expansion T_ξF at every root of unity. The
  formal equality F = F₁ in ℤ[[1 − q]] alone does not give this analytic statement.
* **Andrews' exercise** (lemma): Σ_{n≥0}(x;q)_{n+1}xⁿ = Σ_{n≥1}χ₁₂(n)x^{(n−1)/2}q^{(n²−1)/24} in ℤ[x]⟦q⟧, via the
  recursion S(x) = 1 − qx² − q²x³S(qx).
* **Theorem (Zagier's sum-of-tails identity).** F₁ = −½H + (½ − E)(q;q)_∞ in ℚ⟦q⟧, with
  H = Σ nχ₁₂(n)q^{(n²−1)/24} and E = Σ d(n)qⁿ (the x-derivative at x = 1 of the two expressions for S).
* **Infinite-order vanishing** (lemma): (q;q)_∞ and E(q)(q;q)_∞ have radial expansion 0 at every rational
  point (η's transformation law, QSeriesPartitionsAndMockModularForms:QM.1/dedekind-eta-multiplier).
* **Theorem (Kontsevich–Zagier strange identity).** For every root of unity ξ = e^{2πix}, H(e^{2πiτ}) has radial
  expansion −2T_ξF at x; in particular its radial limit is −2F(ξ), i.e. the radial limit of η̃ at x is −2φ(x).
  This is the precise content of the “identity” Σ(q;q)_n = −½Σ nχ₁₂(n)q^{(n²−1)/24}: a formal Habiro evaluation
  on the left, radial expansions of a disc-convergent series on the right.
* **Value formula** (lemma): with ξ = e^{2πiα}, 12 | N, ξ^{N/12} = 1, F(ξ) = (1/4N)Σ_{m=1}^{N}m²χ₁₂(m)ξ^{(m²−1)/24};
  the Taylor coefficients are c_n(ξ) = (−1)^{n−1}L(−2n − 1, Φ_ξ)/2 with Φ_ξ(m) = χ₁₂(m)ξ^{(m²−1)/24}, and at ξ = 1
  they are the Glaisher numbers (Σ T_nx^{2n+1}/(2n+1)! = sin 2x/(2 cos 3x); T₀, T₁, T₂ = 1, 23, 1681). The
  generating function is 1/(1 − e^{−Nt})Σ_{m≤N}Φ_ξ(m)e^{−mt} ∼ 2Σ(−1)ⁿc_n(ξ)t^{2n+1}/(2n + 1)!.
* **Theorem (quantum modularity of φ).** φ(x) + (ix)^{−3/2}φ(−1/x) = g(x) for x ∈ ℚ ∖ {0}, with g smooth and
  real-analytic off 0 and g^{(n)}(0) = (−πi/12)ⁿc_n; equivalently φ is quantum modular of weight 3/2 on SL₂(ℤ)
  with ε(T) = e^{−2πi/24}, ε(S) = e^{2πi/8} on the lower branch.
* **Cohen's σ** (definition): the terminating values `cohenSigma ξ` = 1 + Σ(−1)ⁿξ^{n+1}(ξ;ξ)_n and
  `cohenSigmaStar ξ` = −2Σξ^{n+1}(ξ²;ξ²)_n at roots of unity. API: `cohenSigma_eq_sum_range`,
  `cohenSigmaStar_eq_sum_range`, `cohenSigma_galois`, `cohenSigma_one`. Unit tests: `cohenSigma.test_one` (2),
  `.test_neg_one` (−2), `.test_I` (−2i − 4), `cohenSigmaStar.test_one` (−2).
* **Cohen's telescoping identity** (lemma) in ℤ[q, q⁻¹] and **Cohen's duality** (lemma): σ(ξ) = −σ*(ξ⁻¹) for every
  root of unity — a statement about formal evaluations only.

### 5D. The Poincaré homology sphere (Lawrence–Zagier) and the Habiro comparison

* **χ₊, χ₋** (definition, `lzChiPlus`, `lzChiMinus` on ZMod 60): χ₊(n) = (−1)^{⌊n/30⌋} if n² ≡ 1 (mod 120),
  χ₋(n) = (−1)^{⌊n/30⌋} if n² ≡ 49 (mod 120), 0 otherwise; the real and imaginary parts of (12/·)ε with ε of
  conductor 5. API: `lzChiPlus_ne_zero_iff`, `lzChiPlus_neg`, `sum_lzChiPlus`, `lzChiPlus_eq_re`. Unit tests:
  `lzChiPlus.test_values`, `.test_zagier_description` ((n, 6) = 1 and n ≡ ±1 mod 5), `.test_mean_zero`,
  `.test_not_multiplicative`.
* **A(q) = Σχ₊(n)q^{(n²−1)/120}** (definition, `lzSeries`, `lzSeriesFun`, `lzThetaTilde`): Θ̃₊ = q^{1/120}A(q) is the
  Eichler integral of Θ₊ = Σ nχ₊(n)q^{n²/120} (√120·Θ̃₊ = `eichlerIntegral` (3/2) 120). API: `lzThetaTilde_eq`,
  `lzThetaTilde_eq_eichlerIntegral`, `coeff_lzSeries`. Unit tests: `lzSeries.test_coeffs`
  (A = 1 + q + q³ + q⁷ − q⁸ − ⋯), `.test_constantCoeff`, `.test_coeff_range`.
* **Theorem (Lawrence–Zagier 1).** For every root of unity ξ of order K, the radial limit of 1 − ½A(q) at ξ
  equals W(ξ) = ξ(ξ − 1)Z(ξ), Z the WRT invariant of Σ(2, 3, 5) (ArithmeticQuantumTopology:QT.4/
  WRT-invariant-at-a-root); explicitly W(ξ) = 1 − ½Σ_{n=1}^{30K}χ₊(n)(1 − n/(30K))ξ^{(n²−1)/120}. The radial limit
  is a renormalised sum (5A); its identification with the Lawrence–Rozansky formula uses the Gauss-sum
  expansion of ξ^{(n²−1)/120} and the rational functions ψ(u) = Σχ₊(n)uⁿ, φ(u) = u + u⁻¹ − ψ(u).
* **Theorem (Lawrence–Zagier 2).** The radial expansion of 1 − ½A(q) at q = 1 is W_∞(e^{−t} − 1), with
  W_∞ = h(1 + h)Z_∞ and Z_∞ the Ohtsuki series (ArithmeticQuantumTopology:QT.4/ohtsuki-series), via the Bernoulli
  values L(−2r, χ₊) and the modified Euler numbers.
* **Comparison (Habiro form).** With J ∈ ℤ[q]^ the unified invariant of Σ(2, 3, 5)
  (ArithmeticQuantumTopology:QT.3/definition-of-JM) and U = q(q − 1)J: ev_ξ(U) is the radial limit of 1 − ½A at ξ
  for every root of unity (QT.4/evaluation-theorem and Theorem 1); the Taylor map of U at 1 is the radial
  expansion at 0 (QT.4/ohtsuki-series and Theorem 2); and U is the only Habiro element with these evaluations
  (HC.4). This is the layer's link between the Habiro ring and ArithmeticQuantumTopology: a formal evaluation and
  an analytic radial limit, identified root by root.
* **Theta transformation** (lemma, Lawrence–Zagier (15)): Θ₊(τ + 1) = e^{πi/60}Θ₊, Θ₋(τ + 1) = e^{49πi/60}Θ₋, and
  (Θ₊, Θ₋)(−1/τ) = (τ/i)^{3/2}(a b; b −a)(Θ₊, Θ₋)(τ), a = √(½(1 − 1/√5)), b = √(½(1 + 1/√5)); the pair spans an
  SL₂(ℤ)-invariant space with finite projective image.
* **Theorem (quantum modularity of the WRT function).** The radial limits f± of Θ̃± satisfy
  j(γ, x)f(γx) + M_γf(x) = M_γr_{−d/c}(x) (vector form), so f₊(x) = 2e^{πix/60}(1 − W(e^{2πix})) is quantum modular of
  weight 1/2 on the finite-index subgroup where M_γ is scalar.

### 5E. Partition statistics: crank, rank, and radial limits of rank minus crank

* **`partitionCrank`** (definition, Andrews–Garvan): ℓ(λ) if λ has no ones, μ(λ) − ω(λ) otherwise (ω = number of
  ones, μ = number of parts > ω). API: `partitionCrank_of_numOnes_eq_zero`, `partitionCrank_of_numOnes_pos`,
  `partitionCrank_indiscrete` (crank n for n ≥ 2), `partitionCrank_ones` (−n), `abs_partitionCrank_le`. Unit
  tests: `partitionCrank.test_six` (the cranks 6, 0, 4, −1, 3, 1, −3, 2, −2, −4, −6 of the partitions of 6),
  `.test_one` (−1), `.test_ne_rank` (5 + 1 has crank 0, rank 3), `.test_eleven_classes`.
* **`crankCount`, `crankCountMod`** (definition): M(m, n) with the n = 1 convention and M(k, t, n). API:
  `sum_crankCount` (= p(n)), `sum_crankCountMod`, `crankCount_neg`, `crankCount_eq_zero_of_lt`, `crankCount_one`.
  Unit tests: `crankCount.test_sum_six` (11), `crankCountMod.test_eleven_six` (all 1), `crankCount.test_one`,
  `crankCount.test_convention_differs`.
* **Theorem (crank generating function).** Σ_nΣ_mM(m, n)z^mqⁿ = ∏(1 − qⁿ)/((1 − zqⁿ)(1 − z⁻¹qⁿ)) in
  ℤ[z, z⁻¹]⟦q⟧, via Cauchy's q-binomial theorem (QM.0) and the combinatorial reading of
  (1 − q)/(zq;q)_∞ + Σ_{j≥1}q^jz^{−j}/((q²;q)_{j−1}(zq^{j+1};q)_∞).
* **Equal classes** (lemma): for t prime and a primitive t-th root ζ, Σ_k c(k)ζ^k = 0 forces c constant
  (the minimal polynomial of ζ is 1 + X + ⋯ + X^{t−1}).
* **Theorems (crank mod 5, 7, 11).** M(k, 5, 5n + 4) = p(5n + 4)/5, M(k, 7, 7n + 5) = p(7n + 5)/7,
  M(k, 11, 11n + 6) = p(11n + 6)/11 for all k. Mod 5: C(ζ₅; q)(q⁵;q⁵)_∞(1 − ζ²) = (q;q)_∞·T(ζ²) with the triple
  product T (QM.0/jacobi-triple-product) and Euler's series; only m ≡ 3, n ≡ 1 (mod 5) reach exponents
  ≡ 4 (mod 5), and m ↦ 1 − m cancels them. Mod 7: C(ζ₇; q) ∝ T(ζ²)T(ζ³)/(q⁷;q⁷)_∞; only m ≡ n ≡ 4 reach exponents
  ≡ 5, cancelled by m ↦ 1 − m. Mod 11: Winquist's identity with a = ζ₁₁², b = ζ₁₁⁵ and the 11-dissection of its
  double series. **Theorem (Ramanujan).** 11 | p(11n + 6).
* **`dysonRank`, `dysonRankCount`, `dysonRankCountMod`** (definition): rank = largest part − number of parts;
  N(m, n), N(k, t, n). API: `dysonRank_conjugate` (conjugation negates the rank), `dysonRankCount_neg`,
  `sum_dysonRankCount`. Unit tests: `dysonRank.test_garvan_example` (4+4+3+2+1+1+1 has rank −3),
  `dysonRankCountMod.test_five_four`, `dysonRank.test_empty`, `dysonRankCountMod.test_not_eleven` (the rank does
  not split the partitions of 6 into eleven classes).
* **Theorem (rank generating function).** Σ N(m, n)z^mqⁿ = 1 + Σ_{n≥1}q^{n²}/((zq;q)_n(z⁻¹q;q)_n) (Durfee square);
  R(−1; q) = f(q) is Ramanujan's third-order mock theta function (QM.4). **Theorem (Atkin–Swinnerton-Dyer).**
  N(k, 5, 5n + 4) = p(5n + 4)/5 and N(k, 7, 7n + 5) = p(7n + 5)/7, from the 5- and 7-dissections of R(ζ; q).
* **`unimodalSeries`, `unimodalValue`** (definition): U(w; q) = Σ(wq;q)_n(w⁻¹q;q)_nq^{n+1}, and for b | k the
  terminating value U(ζ_b^a; ζ_k^h) = Σ_{n<k}(wζ;ζ)_n(w⁻¹ζ;ζ)_nζ^{n+1}. API: `unimodalValue_eq_sum_range`,
  `sum_pochhammer_eq_unimodalSeries` (Σ_{n≥1}qⁿ(w;q)_n(w⁻¹;q)_n = (1 − w)(1 − w⁻¹)U(w; q)), `unimodalValue_neg_one`.
  Unit tests: `unimodalSeries.test_coeffs` (1, 1, 3), `unimodalValue.test_neg_one` (−1), `.test_I` (−i),
  `.test_nonterminating` (no factor vanishes at e^{2πi/3}).
* **Choi's identity** (lemma): R(ζ_b^a; q) + (1 − ζ_b^a)(1 − ζ_b^{−a})U(ζ_b^a; q) = m(a, b; z)µ(−a/b, a/b; z) with
  Zwegers' Appell–Lerch sum µ (QM.4/appell-lerch-sum). **Radial asymptotics** (lemmas): the mixed mock form m·µ
  (via the completion, QM.4/zwegers-completion) and the crank function C(ζ_b^a; q) (via η and ϑ, QM.1) have the
  same leading term (i/z)^{1/2}ψ(γ)^{−1}q^{1/24}q₁^{−1/24}·(explicit root of unity) up to the constant
  ζ_{b²}^{−a²h′k}, with exponentially small errors.
* **Theorem (Folsom–Ono–Rhoades 1.2).** For 1 ≤ a < b, 1 ≤ h < k, gcd(a, b) = gcd(h, k) = 1, b | k,
  hh′ ≡ −1 (mod k): as q → ζ_k^h radially, R(ζ_b^a; q) − ζ_{b²}^{−a²h′k}C(ζ_b^a; q) → −(1 − ζ_b^a)(1 − ζ_b^{−a})U(ζ_b^a; ζ_k^h).
  The limit of the convergent series U(ζ_b^a; q) at ζ_k^h is the terminating value by the uniform Pochhammer bound.
  **Theorem (Ramanujan's claim, FOR 1.1).** For ζ primitive of order 2k, f(q) − (−1)^k b(q) → −4Σ_{n<k}(−ζ;ζ)_n²ζ^{n+1},
  b(q) = (q;q)_∞/(−q;q)_∞² = C(−1; q); e.g. f(q) + b(q) → 4 at q = −1 and f(q) − b(q) → 4i at q = i.

### 5F. Traces of singular moduli

* **`heegnerForms`, `cmPoint`, `stabiliserOrder`, `heegnerClasses`** (definition): Q_d, α_Q = (−b + i√d)/(2a), w_Q,
  and the reduced representatives |b| ≤ a ≤ c (b ≥ 0 if |b| = a or a = c) of Q_d/PSL₂(ℤ). API: `cmPoint_smul`
  (α_{Q∘γ} = γ⁻¹α_Q), `stabiliserOrder_eq`, `sum_inv_stabiliserOrder` (Σ 1/w_Q = H(d), the Hurwitz class number of
  Tau Ceti's modular forms layer 11), `heegnerForms_eq_empty`. Unit tests: `heegnerClasses.test_three`
  ({[1, 1, 1]}, w = 3), `.test_twelve` (H(12) = 4/3), `heegnerForms.test_empty`, `cmPoint.test_four` (i).
* **`modularTrace`** (definition): t(d) = Σ_{Q∈Q_d/Γ}J(α_Q)/w_Q, J = j − 744 with j = E₄³/Δ (Tau Ceti ModularForms
  layer 0). API: `modularTrace_eq_zero`, `modularTrace_three` (−248), `modularTrace_four` (492),
  `modularTrace_eq_coeff_logDeriv`. Unit tests: `modularTrace.test_three`, `.test_twelve` (53008, the imprimitive
  [2, 2, 2] contributing −248), `.test_five`, `.test_not_trace_of_j`.
* **`zagierTraceForm`, `zagierTraceCoeff`** (definition): g = θ₁(τ)E₄(4τ)/η(4τ)⁶ = Σ_{d≥−1}B(d)q^d, weakly holomorphic
  of weight 3/2 in Kohnen's plus space. API: `hasSum_zagierTraceForm`, `zagierTraceCoeff_eq_zero`,
  `zagierTraceCoeff_neg_one`, `zagierTraceCoeff_zero`. Unit tests: `zagierTraceCoeff.test_three` (248),
  `.test_four` (−492), `.test_plus`, `.test_polar`.
* **Coefficient recursions** (lemma): Σ_rB(4n − r²) = 0 and Σ_{r>0}r²B(4n − r²) = 240σ₃(n) (σ₃(0) = 1/240), from
  (gθ)|U₄ ∈ M₂(SL₂(ℤ)) = 0 and [g, θ]|U₄ = −8E₄ (Kohnen plus space, MP.7; the Rankin–Cohen bracket
  g′θ − 3gθ′).
* **`heegnerLogDeriv`** (definition): Λ_d = Σ_Q(1/w_Q)j′/(j − j(α_Q)), a meromorphic weight-2 form, holomorphic at ∞,
  with a simple pole of residue 1 (as a function on ℍ) at each CM point of discriminant −d, and
  −(2πi)^{−1}Λ_d = H(d) + t(d)q + O(q²). API: `heegnerLogDeriv_slash`, `heegnerLogDeriv_qExpansion`,
  `heegnerLogDeriv_residue`, `heegnerLogDeriv_unique` (rigidity from M₂(SL₂(ℤ)) = 0). Unit tests:
  `heegnerLogDeriv.test_three` (−(2πi)^{−1}Λ₃ = (1/3)E₆/E₄), `.test_constant_term`, `.test_empty`.
* **Modular polynomial diagonal** (lemma): D_n = ∏_{ad=n, 0≤b<d}(j(τ) − j((aτ + b)/d)) satisfies
  D′_n/D_n = Σ_{|r|<2√n}Λ_{4n−r²} for non-square n (and the quotient form for squares).
* **Theorems (Zagier's recursions).** Σ_{|r|<2√n}t(4n − r²) = −4, 2 or 0 according as n or 4n + 1 is a square or
  neither, together with the Kronecker–Hurwitz relation Σ H(4n − r²) = Σ_{d|n}max(d, n/d) + (1/6 if n = □); and
  Σ_{1≤r<2√n}r²t(4n − r²) = −240σ₃(n) + (−8n if n = □; 4n + 1 if 4n + 1 = □; 0), via the weight-2 identity
  (E₄E₆/Δ)Σ_{M}(E₄|M)/(j − j∘M) = (1/4πi)Σ_r(r² − n)Λ_{4n−r²}, whose residue comparison must treat the elliptic points
  i and ρ explicitly, and whose square case includes the terms a = d.
* **Theorem (Zagier 1).** t(d) = −B(d) for all d > 0; e.g. t(3) = −248, t(4) = 492, t(7) = −4119, t(8) = 7256.

### Dependencies

* Within this roadmap: QSeriesPartitionsAndMockModularForms:QM.0 (`q-pochhammer`, `jacobi-triple-product`,
  Cauchy's q-binomial theorem, Winquist's identity), QM.1 (`dedekind-eta-multiplier`, the SL₂(ℤ) law of ϑ(v; z)),
  QM.4 (`appell-lerch-sum`, `zwegers-completion` with Zwegers' R and the Mordell integral).
* HabiroCyclotomicCompletions:HC.1 (the Habiro ring and convergence of Σ a_n(q;q)_n), HC.3 (evaluation and Taylor
  maps, Galois compatibility), HC.4 (evaluation rigidity).
* ArithmeticQuantumTopology:QT.3/definition-of-JM, QT.4/WRT-invariant-at-a-root, QT.4/evaluation-theorem,
  QT.4/integrality-and-galois, QT.4/determination-by-WRT, QT.4/ohtsuki-series, and from QT.4 the Lawrence–Rozansky
  formula for Σ(2, 3, 5) and Lawrence's closed form of its Ohtsuki series.
* MetaplecticAutomorphicForms:MP.7 (half-integral weight cusp forms with Shimura's multiplier, their
  character decomposition and Fricke involution, Kohnen's plus space and U₄).
* Tau Ceti ModularForms layer 0 (the j-function), layer 8 (integral-weight Eichler integrals, whose convention
  `eichlerIntegral` extends), layer 11 (Hurwitz class numbers).
* The definition QSeriesPartitionsAndMockModularForms:QM.5/quantum-modular-form is the one ArithmeticQuantumTopology:QT.7
  uses for knot-invariant quantum modularity; QT.7 keeps the knot-invariant statements (Kashaev invariants and their
  conjectures).

### Acceptance tests

* F(ξ) for ξ = 1, −1, i, e^{2πi/3} equals 1, 3, 8 − 3i, 5 − e^{2πi/3}, both from the terminating sum and from
  (1/4N)Σ m²χ₁₂(m)ξ^{(m²−1)/24}; the Taylor coefficients of e^{−t/24}F(e^{−t}) are 1, 23, 1681, 257543.
* The radial limit of H(q) at q = −1 is −6 = −2F(−1), while F has no q-expansion and H has no values on the circle.
* σ(ω) = −σ*(ω²) = 2ω + 6 and σ(±i) = −σ*(∓i) = ∓2i − 4.
* W(−1) = 2, W(e^{2πi/3}) = −2ξ − 1, W(i) = ξ + 1 as radial limits of 1 − ½A, and W(1) = 0 = 1 − ½·2.
* The cranks of the seven partitions of 5 are 5, 0, 3, −1, 1, −3, −5 (one per class mod 7) and those of the eleven
  partitions of 6 are pairwise incongruent mod 11; the ranks of the partitions of 6 are not.
* f(q) + b(q) → 4 as q → −1 and f(q) − b(q) → 4i as q → i radially.
* t(3) = −248, t(12) = 53008 and B(3) = 248, B(4) = −492; the recursions reproduce B(3) = 240 + 8 and
  B(4) = −496 + 4.
* The boundary factor is the lower branch: j_{3/2}(S, x) = −i|x|^{−3/2} for x < 0, and Kontsevich's S-law holds with
  the single constant ε(S) = e^{2πi/8} for both signs of x.

---

## QM.6 Moonshine and representation-theoretic arithmetic

This layer builds the mathematics of Borcherds' proof of the Conway–Norton moonshine conjecture, from vertex algebras to the statement that every McKay–Thompson series of the Monster is the normalized Hauptmodul of a genus-zero group. It is organised so that everything that does not depend on the Monster is proved for an arbitrary *moonshine module* — a real vertex operator algebra of central charge 24 with a positive definite invariant form and graded dimension J = j − 744 — and every automorphism of it. For such data the layer proves the no-ghost theorem, constructs the Monster Lie algebra m(V), identifies it with the Borcherds algebra of Jurisich's matrix, and derives Borcherds' twisted denominator identity, so that every McKay–Thompson series T_g is completely replicable and is determined by the coefficients c_{gˢ}(1), c_{gˢ}(2), c_{gˢ}(3), c_{gˢ}(5). The modular side is built from Mathlib's Δ and E₄ and the ModularForms roadmap's j: the product formula p⁻¹Π(1 − pᵐqⁿ)^{c(mn)} = J(p) − J(q), weight-zero Hecke operators on level-one modular functions, and Hauptmoduln of moonshine-type groups. The proven moonshine examples of the layer are the identity element (T₁ = J, the normalized Hauptmodul of SL₂(ℤ)) and the Γ₀(2)-Hauptmodul q⁻¹Π(1 − q^{2n−1})²⁴ + 24 of the class 2B. The final identification T_g = t_g for the Monster rests on inputs recorded below as gaps: the Frenkel–Lepowsky–Meurman moonshine module V♮, the identification of its automorphism group with Tau Ceti's presented Monster, the Monster character table, and the Conway–Norton functions with Koike's replicability theorem.

The proof follows Borcherds, *Monstrous moonshine and monstrous Lie superalgebras* (1992), §§3–9, with the structure of the Monster Lie algebra taken from Jurisich (1998) and Jurisich–Lepowsky–Wilson (1995): the free-Lie-algebra decomposition m = u⁺ ⊕ gl₂ ⊕ u⁻ replaces the general Weyl–Kac–Borcherds character formula and the Garland–Lepowsky homology computation, which in the sources rest on Kac's book. Suggested homes: `TauCeti/Algebra/Vertex/` (vertex algebras, lattice vertex algebras, no-ghost theorem), `TauCeti/Algebra/Lie/Borcherds/` and `TauCeti/Algebra/Lie/Free/` (Borcherds algebras, Lazard elimination, Witt's formula), `TauCeti/NumberTheory/ModularForms/WeaklyHolomorphic/` (Laurent q-expansions, M^!_0, weight-zero Hecke operators, M^!_0 = ℂ[j]) and `TauCeti/NumberTheory/Moonshine/` (J, the product formula, the Monster Lie algebra, replication, Hauptmoduln, the moonshine theorem); all declarations live in the namespace `TauCeti.QSeries`.

### Scope and boundaries

- **Owned here.** Vertex algebras (Borcherds' axioms on Mathlib's `VertexOperator`), conformal vectors, vertex operator algebras, invariant forms, graded traces and McKay–Thompson series; lattice vertex algebras of even lattices; the Virasoro algebra; physical-state Lie algebras and the no-ghost theorem; Borcherds (generalized Kac–Moody) algebras and their characterisation, Lazard elimination and Witt's formula (the RepresentationTheory family stops at finite root systems and excludes Kac–Moody theory, and no other roadmap of the atlas plans vertex algebras); the Monster Lie algebra; the j product formula, level-one weight-zero Hecke operators and M^!_0 = ℂ[j]; replication; moonshine-type groups and normalized Hauptmoduln; the moonshine theorem.
- **Imported.** The normalized j = E₄³/Δ with its q-expansion (`tauceti:TauCetiRoadmap/ModularForms`, Layer 0); level-one coset representatives of integer matrices of determinant n (ModularForms, Layer 2); cusps of Γ₀(N) (ModularForms, 10A); cofinite Fuchsian groups, cusp coordinates, compactified quotients X(Γ) and degree-one maps (`tauceti:TauCetiRoadmap/FuchsianOrbifolds`, Layers 2–5); sl₂-representation theory and the Poincaré–Birkhoff–Witt theorem (`tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight`, Layers 0 and 3); the q-Pochhammer symbol (`QSeriesPartitionsAndMockModularForms:QM.0`); the Y₄₄₃ presentation of the Monster (Tau Ceti, CFSGStatement S1, built); integral lattices (Tau Ceti `TauCeti.IntegralLattice`, built).
- **Outside this layer.** Generalized moonshine (Norton's conjecture), umbral and Mathieu moonshine, modular moonshine, Borcherds' monstrous Lie superalgebras and fake Monster Lie algebras (Borcherds 1992 §§10–14), the uniqueness of V♮, and the Leech lattice construction; a coefficient pattern alone is never taken as a group representation or a modularity theorem.

### Conventions

- Vertex algebras are defined over a commutative ring R: a state–field map `Y : V →ₗ[R] VertexOperator R V` (Mathlib) and a vacuum 1, with u_n := `VertexOperator.ncoeff (Y u) n`, so Y(u,z) = Σ u_n z^{−n−1}. The axioms are Borcherds' (1992 §3): creation (u_n1 = 0 for n ≥ 0, u_{−1}1 = u) and the Borcherds identity Σ_{i≥0} C(m,i)(u_{q+i}v)_{m+n−i}w = Σ_{i≥0}(−1)^i C(q,i)(u_{m+q−i}(v_{n+i}w) − (−1)^q v_{n+q−i}(u_{m+i}w)) with C(m,i) = `Ring.choose m i`; truncation is built into Mathlib's vertex operators. D v := v_{−2}1 and D^{(k)}v := v_{−k−1}1.
- Conformal vectors, vertex operator algebras, invariant forms and everything after them are over a field k of characteristic 0 (ℝ for moonshine). L_n := ω_{n+1}; the weight space V_n := ker(L₀ − n). A vertex operator algebra has finite-dimensional weight spaces and weights bounded below (Frenkel–Lepowsky–Meurman, Jurisich 1998 Definition 4); Borcherds' definition is the nonnegatively graded case.
- Indexing: Borcherds writes V_n for the L₀-eigenspace of eigenvalue n + 1. Here V_n always means L₀-weight n, c_g(n) := tr(g|V_{n+1}) and T_g := q^{−1}Σ_n tr(g|V_n)qⁿ = Σ_n c_g(n)qⁿ; the Monster Lie algebra piece of degree (a,b) is V_{ab+1}.
- II_{1,1} = ℤ² with ⟨(m,n),(m',n')⟩ = −(mn' + m'n) (Borcherds' sign; norm −2mn); Gannon's form mn' + m'n differs by (m,n) ↦ (m,−n).
- Invariant forms on a vertex algebra with conformal vector ω and involution θ: (u_nv, w) = (−1)^i Σ_{j≥0}(1/j!)(v, (L₁^jθu)_{2i−j−n−2}w) for u of weight i. For the moonshine module θ = id; the contravariant form is (x,y)₀ = −(x,θy); the form on V_{II_{1,1}} is normalized by (1,1) = −1 (Jurisich 1998 §6.2).
- J := j − 744 = Σ_{n≥−1} c(n)qⁿ is defined formally over ℤ as q^{−1}E₄(q)³(q;q)_∞^{−24} − 744 and compared with the analytic j. A normalized q-series is q^{−1} + Σ_{n≥1} a_nqⁿ. The formal Hecke operator is (T_mf)_n = Σ_{a|(m,n)} a^{−1}f_{mn/a²} (all a | m when n = 0), the q-expansion of (1/m)Σ_{ad=m, 0≤b<d} f((aτ+b)/d).
- Formal identities in two variables are stated in ℤ((q))((p)) or, equivalently, in k⟦p,q⟧ after removing the factor 1 − p/q; exp and log of series in the maximal ideal use Mathlib's `PowerSeries.exp`, `PowerSeries.log` and `PowerSeries.subst`; ψ^i is the Adams operation (p ↦ pⁱ, q ↦ qⁱ, g ↦ gⁱ).
- A group Γ ≤ SL₂(ℝ) is of moonshine type (Gannon Definition 1) when it is discrete, contains some Γ₀(N), and (1 t; 0 1) ∈ Γ exactly for t ∈ ℤ. A normalized Hauptmodul is Γ-invariant, holomorphic on ℍ, equal to q^{−1} + O(q) at ∞ and bounded at every cusp not Γ-equivalent to ∞.

### What the pinned libraries already provide

Mathlib (082e2d3): vertex operators `VertexOperator`, `VertexOperator.ncoeff`, `HVertexOperator.coeff`; binomial coefficients `Ring.choose`; Lie algebras, modules, ideals, `FreeLieAlgebra` with `FreeLieAlgebra.universalEnvelopingEquivFreeAlgebra`, `UniversalEnvelopingAlgebra`, `IsSl2Triple`, `Matrix.ToLieAlgebra`; `TensorAlgebra`, `SymmetricAlgebra`, `ExteriorAlgebra.exteriorPower`, `exteriorPower.map`, `TensorProduct`, `AddMonoidAlgebra`, `LinearMap.trace`, `LinearMap.det`, bilinear forms; `LaurentSeries`, `HahnSeries`, `PowerSeries.exp`, `PowerSeries.log`, `PowerSeries.subst`; `ArithmeticFunction.sigma`, `ArithmeticFunction.moebius`; modular forms `ModularForm`, `SlashInvariantForm`, `ModularForm.E₄`, the discriminant `ModularForm.discriminant` with `discriminant_eq_q_prod`, `discriminant_ne_zero`, `discriminant_S_invariant`, `discriminant_T_invariant`, `ModularFormClass.levelOne_weight_zero_const`, `UpperHalfPlane.qExpansion` with `qExpansion_mul` and `qExpansion_coeff_unique`, `CongruenceSubgroup.Gamma0`. There is no vertex algebra class, no Virasoro algebra, no j-function, no Hauptmodul and no Borcherds algebra.
Tau Ceti (f790474): `TauCeti.IntegralLattice` with `IsEven`, `IsUnimodular`, `IsNondegenerate`, `ofGramMatrix`; the Y₄₄₃ presentation `TauCeti.Sporadic.Monster.presentation` and `TauCeti.SporadicName.Group` (no order, finiteness or character table is proved). There is no moonshine, no vertex algebra and no Monster action.

### QM.6a Vertex algebras and lattice vertex algebras

The foundations: vertex algebras over a commutative ring with their elementary identities, the Lie algebra V/DV, homomorphisms and automorphisms, the existence theorem (locality) and tensor products; the Virasoro algebra, conformal vectors and vertex operator algebras; invariant forms; graded traces and McKay–Thompson series; lattice vertex algebras, their invariant forms, and the Lorentzian lattice II_{1,1}.

#### Vertex algebra (Borcherds' axioms) (`QM.6/vertex-algebra`, definition)

Let R be a commutative ring and V an R-module. A vertex algebra structure on V is a pair (Y, 1) with Y : V →ₗ[R] VertexOperator R V (Mathlib's vertex operators: R-linear maps from V to Laurent series in z with coefficients in V, support bounded below) and a vacuum vector 1 ∈ V. Write u_n := VertexOperator.ncoeff (Y u) n ∈ End_R(V), so that Y(u,z) = Σ_{n∈ℤ} u_n z^{−n−1}. The axioms are: (creation) u_n 1 = 0 for n ≥ 0 and u_{−1} 1 = u; (Borcherds identity) for all u, v, w ∈ V and m, n, q ∈ ℤ, Σ_{i≥0} C(m,i) (u_{q+i} v)_{m+n−i} w = Σ_{i≥0} (−1)^i C(q,i) ( u_{m+q−i}(v_{n+i} w) − (−1)^q v_{n+q−i}(u_{m+i} w) ), where C(m,i) = m(m−1)⋯(m−i+1)/i! ∈ ℤ is Mathlib's Ring.choose m i. The truncation axiom (for u, v there is N with u_n v = 0 for all n ≥ N) holds automatically because the support of Y(u,z)v is bounded below in z; hence both sums in the Borcherds identity are finite. Convention: index n of u_n is the 'mode' of Borcherds and Matsuo–Nagatomo; (u_n) for n ≥ 0 are the annihilation modes.

API:
- `VertexAlgebra.nprod` (data): The n-th product u_n v := VertexOperator.ncoeff (Y u) n v, R-bilinear in (u, v).
- `VertexAlgebra.nprod_eq_zero_of_le` (other): Truncation: for all u, v there is N : ℤ with u_n v = 0 for all n ≥ N.
- `VertexAlgebra.nprod_vac_of_nonneg` (simp): u_n 1 = 0 for n ≥ 0.
- `VertexAlgebra.nprod_vac_neg_one` (simp): u_{−1} 1 = u.
- `VertexAlgebra.borcherds_identity` (relation): The Borcherds identity in the form above, with both sides finite sums over ℕ.
- `VertexAlgebra.ext` (extensionality): Two vertex algebra structures on V with equal Y and equal vacuum are equal.
- `VertexAlgebra.ofDerivation` (constructor): For a commutative ℚ-algebra A and a derivation ∂ of A, the vertex algebra with u_n v = (∂^{−n−1}u/(−n−1)!)v for n ≤ −1 and 0 for n ≥ 0, vacuum 1.

Unit tests:
- `VertexAlgebra.ofDerivation_polynomial_nprod` (computation): In VertexAlgebra.ofDerivation for A = ℚ[X] and ∂ = d/dX: X_{−2}1 = 1, X_{−1}X = X² and X_n X = 0 for n ≥ 0.
- `VertexAlgebra.subsingleton_of_zero_module` (degenerate): On the zero module there is exactly one vertex algebra structure (Y = 0, vacuum 0).
- `VertexAlgebra.not_matrix_ring_vertexAlgebra` (non-example): For the non-commutative ring M₂(ℚ), the rule u_n v := δ_{n,−1}uv with vacuum 1 violates the Borcherds identity (with m = 0, n = −1, q = −1 and w = 1 it forces uv = vu for the matrix units u = E₁₂, v = E₂₁).
- `VertexAlgebra.ofDerivation_nprod_nonneg` (characterisation): In VertexAlgebra.ofDerivation every product u_n v with n ≥ 0 vanishes and u_{−1}v = uv, so the commutative algebra is recovered from the (−1)-product.

Depends on: `mathlib:VertexOperator`, `mathlib:VertexOperator.ncoeff`, `mathlib:HVertexOperator.coeff`, `mathlib:Ring.choose`, `mathlib:BinomialRing`.

#### Vacuum, translation and derivation rules in a vertex algebra (`QM.6/vertex-algebra-vacuum-translation`, lemma)

Let (V, Y, 1) be a vertex algebra over a commutative ring R. Define D : V → V by D v := v_{−2}1 and, for k ≥ 0, D^{(k)} v := v_{−k−1}1. Then: (a) 1_n v = δ_{n,−1} v for all n (Y(1,z) = id); (b) D 1 = 0; (c) (Dv)_n = −n v_{n−1} for all n; (d) [D, v_n] = −n v_{n−1}, i.e. D(v_n w) = (Dv)_n w + v_n(Dw), so D is a derivation of every product; (e) k·D^{(k)} v = D(D^{(k−1)} v) for k ≥ 1, hence k!·D^{(k)} = D^k; (f) u_n 1 = D^{(−n−1)} u for n ≤ −1.

Hypotheses: (V, Y, 1) is a vertex algebra over R.

Proof outline: (b): put u = v = w = 1 and m = n = q = −1 in the Borcherds identity (Matsuo–Nagatomo (18)). (e),(f): put v = w = 1, m = 0, n = −2, q = n; the creation axiom gives (u_n 1)_{−2}1 = −n u_{n−1}1, which is (e) after reindexing (Matsuo–Nagatomo (19)). (a): put v = w = 1, m = −1, n = q', q = 0 and use (b) (Matsuo–Nagatomo (20)). (c): put v = 1, m = n', n = 0, q = −2 and use (a) (Matsuo–Nagatomo (21)). (d): put w = 1, m = 0, n = −2, q = n (Matsuo–Nagatomo (22)); compare with (c).

Depends on: `QM.6/vertex-algebra`.

#### Commutator and associativity formulas (`QM.6/vertex-algebra-commutator-formula`, lemma)

In a vertex algebra over a commutative ring, for all u, v ∈ V and m, n, q ∈ ℤ: (commutator formula) [u_m, v_n] = Σ_{i≥0} C(m,i) (u_i v)_{m+n−i}; (associativity formula) (u_q v)_n = Σ_{i≥0} (−1)^i C(q,i) ( u_{q−i} v_{n+i} − (−1)^q v_{n+q−i} u_i ) as endomorphisms of V. In particular [u_0, v_n] = (u_0 v)_n, so u ↦ u_0 acts by derivations of all products.

Hypotheses: (V, Y, 1) is a vertex algebra.

Proof outline: Set q = 0 in the Borcherds identity: the right side is u_m v_n w − v_n u_m w since C(0,i) = δ_{i,0} (Matsuo–Nagatomo (25)). Set m = 0 in the Borcherds identity: the left side is (u_q v)_n w since C(0,i) = δ_{i,0} (Matsuo–Nagatomo (26)). For m = 0 the commutator formula reads [u_0, v_n] = (u_0 v)_n.

Depends on: `QM.6/vertex-algebra`, `mathlib:Ring.choose`.

#### Skew symmetry (`QM.6/vertex-algebra-skew-symmetry`, lemma)

In a vertex algebra over a commutative ring R, for all u, v ∈ V and n ∈ ℤ: v_n u = Σ_{i≥0} (−1)^{n+i+1} D^{(i)}(u_{n+i} v), where D^{(i)}x := x_{−i−1}1 (a finite sum by truncation). In particular v_0 u + u_0 v = Σ_{i≥1} (−1)^{i+1} D^{(i)}(u_i v) lies in the R-span DV_div := Σ_{i≥1} D^{(i)}(V), and u_0 u ∈ DV_div.

Hypotheses: (V, Y, 1) is a vertex algebra.

Proof outline: Put w = 1, m = −1, n = 0, q = n in the Borcherds identity and simplify with the creation axiom and the vacuum-translation lemma (Matsuo–Nagatomo (23)). For n = 0 separate the i = 0 term: v_0 u = −u_0 v + Σ_{i≥1}(−1)^{i+1}D^{(i)}(u_i v).

Depends on: `QM.6/vertex-algebra`, `QM.6/vertex-algebra-vacuum-translation`.

#### The Lie algebra V/DV of a vertex algebra (`QM.6/vertex-algebra-lie-algebra`, construction)

Let V be a vertex algebra over a commutative ring R and let DV := Σ_{i≥1} D^{(i)}(V) (the R-span of all D^{(i)}w, i ≥ 1; over a ℚ-algebra this is the image of D). Then DV is a two-sided ideal for the product (u, v) ↦ u_0 v, and V/DV is a Lie algebra over R with bracket [u + DV, v + DV] := u_0 v + DV. The map u ↦ u_0 makes V a module over the Lie algebra V/DV (DV acts by 0: (D^{(i)}w)_0 = 0 for i ≥ 1), and each u_0 acts by derivations of all products.

API:
- `VertexAlgebra.translationSpan` (data): The submodule DV = Σ_{i≥1} D^{(i)}(V) of V.
- `VertexAlgebra.LieQuotient` (structure): The quotient module V ⧸ DV with its LieRing and LieAlgebra R instances.
- `VertexAlgebra.LieQuotient.bracket_mk` (simp): ⁅mk u, mk v⁆ = mk (u_0 v).
- `VertexAlgebra.zeroMode_translation` (simp): (D^{(i)} w)_0 = 0 for i ≥ 1.
- `VertexAlgebra.lieModuleQuotient` (instance): V is a LieModule over V ⧸ DV via (u + DV) · w = u_0 w.
- `VertexAlgebra.zeroMode_derivation` (relation): u_0(v_n w) = (u_0 v)_n w + v_n(u_0 w).

Unit tests:
- `VertexAlgebra.LieQuotient.ofDerivation_abelian` (degenerate): For VertexAlgebra.ofDerivation the Lie algebra V/DV is abelian.
- `VertexAlgebra.LieQuotient.bracket_self` (characterisation): ⁅mk u, mk u⁆ = 0 in V/DV although u_0 u need not vanish in V.
- `VertexAlgebra.zeroMode_vacuum` (computation): 1_0 = 0 and u_0 1 = 0 for every u, so mk 1 is central in V/DV.
- `VertexAlgebra.zeroMode_not_antisymmetric` (non-example): The 0-product on V itself is not antisymmetric: for the conformal vector ω of the rank-one lattice vertex algebra, ω_0 ω = Dω ≠ 0 (D is injective on vectors of nonzero weight there), whereas ⁅mk ω, mk ω⁆ = 0 in V/DV.

Depends on: `QM.6/vertex-algebra`, `QM.6/vertex-algebra-vacuum-translation`, `QM.6/vertex-algebra-commutator-formula`, `QM.6/vertex-algebra-skew-symmetry`, `mathlib:LieAlgebra`, `mathlib:LieModule`.

#### Homomorphisms and automorphisms of vertex algebras (`QM.6/vertex-algebra-automorphism`, definition)

For vertex algebras (V, Y, 1) and (W, Y', 1') over R, a homomorphism is an R-linear map f : V → W with f(1) = 1' and f(u_n v) = f(u)_n f(v) for all u, v, n (equivalently f ∘ Y(u,z) = Y'(f u, z) ∘ f). The automorphisms of V form a group Aut(V) under composition. If V carries a conformal vector ω (node conformal-vector) the conformal automorphisms are those with g(ω) = ω; if V carries a bilinear form (,) the isometric conformal automorphisms are those with (gu, gv) = (u, v). For a group G, an action of G on V by vertex algebra automorphisms is a group homomorphism G →* Aut(V).

API:
- `VertexAlgebra.Hom` (structure): Homomorphisms f with f 1 = 1 and f(u_n v) = (f u)_n (f v).
- `VertexAlgebra.Hom.map_nprod` (simp): f (u_n v) = (f u)_n (f v).
- `VertexAlgebra.Aut` (instance): Aut(V) is a group under composition.
- `VertexAlgebra.Aut.commute_translation` (relation): g ∘ D = D ∘ g for g ∈ Aut(V).
- `VertexAlgebra.Aut.conformal` (data): The subgroup of g ∈ Aut(V) with g ω = ω (for V with conformal vector ω).
- `VertexAlgebra.Aut.mapsTo_weightSpace` (relation): A conformal automorphism maps each L_0-eigenspace V_n into itself.

Unit tests:
- `VertexAlgebra.Aut.one_apply` (computation): The identity automorphism acts as the identity on V and fixes 1.
- `VertexAlgebra.Aut.of_zero_module` (degenerate): The automorphism group of the zero vertex algebra is trivial.
- `VertexAlgebra.Aut.neg_not_hom` (non-example): On a nonzero vertex algebra, v ↦ −v is not a homomorphism (it sends 1 to −1 ≠ 1).
- `VertexAlgebra.Aut.ofDerivation_algEquiv` (compatibility): For VertexAlgebra.ofDerivation A ∂, an R-algebra automorphism σ of A with σ∂ = ∂σ is a vertex algebra automorphism.

Depends on: `QM.6/vertex-algebra`, `mathlib:LinearMap.BilinForm`.

#### Existence theorem for vertex algebras (locality criterion) (`QM.6/vertex-algebra-existence-theorem`, theorem)

Let k be a field of characteristic 0, V a k-vector space, 1 ∈ V nonzero, T ∈ End_k(V), and S a set of fields on V (formal series A(z) = Σ A_n z^{−n−1} with A_n ∈ End(V) and A(z)w ∈ V((z)) for every w) such that: (S1) the fields in S are pairwise local: for A, B ∈ S there is N with (y−z)^N [A(y), B(z)] = 0; (S2) the vectors A^{λ1}_{−j1−1}⋯A^{λk}_{−jk−1}1 (k ≥ 0, j_i ≥ 0, A^{λi} ∈ S) span V; (S3) each A ∈ S is creative (A_n 1 = 0 for n ≥ 0) and translation covariant: [T, A(z)] = ∂_z A(z), with T1 = 0. Then there is a unique vertex algebra structure on V with vacuum 1 such that Y(A_{−1}1, z) = A(z) for every A ∈ S; its translation operator is T.

Hypotheses: k field of characteristic 0; S pairwise local, creative, translation covariant, generating V from 1.

Proof outline: Let O be the space of creative fields; the residual products A(z)_{(m)}B(z) of local fields are local (Dong's lemma, Matsuo–Nagatomo Proposition 1.5.5) and creative (Lemma 4.1.2). The space ⟨S⟩ of fields generated by S under residual products is pairwise local and contains the identity field; by Li's theorem (Matsuo–Nagatomo Theorem 3.3.1, via the Borcherds identity for local fields, Corollary 2.2.2 and Theorem 2.4.1) it is a vertex algebra. Translation covariance and (S2) make the state map A(z) ↦ A_{−1}1 bijective from ⟨S⟩ onto V (Theorem 5.3.3); transport the structure along it. Uniqueness: a vertex algebra structure is determined by the fields of a generating set, by the associativity formula (node vertex-algebra-commutator-formula).

Depends on: `QM.6/vertex-algebra`, `QM.6/vertex-algebra-vacuum-translation`, `QM.6/vertex-algebra-commutator-formula`, `mathlib:VertexOperator`.

#### Tensor product of vertex algebras (`QM.6/vertex-algebra-tensor-product`, construction)

Let V, W be vertex algebras over a field k of characteristic 0. The k-vector space V ⊗_k W carries a unique vertex algebra structure with vacuum 1 ⊗ 1 and (a ⊗ b)_n (c ⊗ d) = Σ_{i∈ℤ} (a_i c) ⊗ (b_{n−1−i} d) (a finite sum by truncation), i.e. Y(a⊗b, z) = Y(a,z) ⊗ Y(b,z). The maps a ↦ a ⊗ 1 and b ↦ 1 ⊗ b are vertex algebra homomorphisms whose images commute: [(a⊗1)_m, (1⊗b)_n] = 0.

API:
- `VertexAlgebra.tensorProduct` (constructor): The vertex algebra structure on V ⊗[k] W with vacuum 1 ⊗ 1.
- `VertexAlgebra.tensorProduct_nprod_tmul` (simp): (a ⊗ b)_n (c ⊗ d) = Σ_i (a_i c) ⊗ (b_{n−1−i} d).
- `VertexAlgebra.tensorProduct.inl` (functoriality): a ↦ a ⊗ 1 is a vertex algebra homomorphism V → V ⊗ W.
- `VertexAlgebra.tensorProduct.inr` (functoriality): b ↦ 1 ⊗ b is a vertex algebra homomorphism W → V ⊗ W.
- `VertexAlgebra.tensorProduct.map` (functoriality): Homomorphisms f : V → V', g : W → W' induce f ⊗ g : V ⊗ W → V' ⊗ W'; in particular Aut(V) acts on V ⊗ W through the first factor.
- `VertexAlgebra.tensorProduct_translation` (simp): D_{V⊗W} = D_V ⊗ 1 + 1 ⊗ D_W.

Unit tests:
- `VertexAlgebra.tensorProduct_vac_nprod` (computation): (1 ⊗ 1)_n = δ_{n,−1} id on V ⊗ W, and (a ⊗ 1)_{−1}(1 ⊗ b) = a ⊗ b.
- `VertexAlgebra.tensorProduct_unit` (degenerate): For the one-dimensional vertex algebra k, V ⊗ k ≃ V as vertex algebras.
- `VertexAlgebra.tensorProduct_inl_inr_commute` (characterisation): [(a⊗1)_m, (1⊗b)_n] = 0 for all a, b, m, n.
- `VertexAlgebra.tensorProduct_not_shifted` (non-example): The shifted rule (a⊗b)_n(c⊗d) := Σ_i (a_i c) ⊗ (b_{n−i} d) violates the creation axiom: (a⊗b)_{−1}(1⊗1) = 0, because a_i 1 ≠ 0 forces i ≤ −1 while b_{−1−i}1 ≠ 0 forces i ≥ 0; with the correct index n−1−i only i = −1 survives and gives a⊗b.

Depends on: `QM.6/vertex-algebra`, `QM.6/vertex-algebra-existence-theorem`, `QM.6/vertex-algebra-automorphism`.

#### The Virasoro algebra and modules of given central charge (`QM.6/virasoro-algebra`, definition)

Let k be a field of characteristic 0. The Virasoro algebra Vir_k is the Lie algebra over k with basis {L_n : n ∈ ℤ} ∪ {C} and bracket [L_m, L_n] = (m − n) L_{m+n} + ((m³ − m)/12) δ_{m+n,0} C, [C, x] = 0 for all x. For c ∈ k, a Virasoro module of central charge c is a Lie module M over Vir_k on which C acts as multiplication by c; equivalently a family of operators L_n ∈ End(M) with [L_m, L_n] = (m−n)L_{m+n} + c(m³−m)/12 δ_{m+n,0}.

API:
- `Virasoro` (structure): The Lie algebra Vir_k with its LieRing and LieAlgebra k instances.
- `Virasoro.L` (constructor): The basis elements L_n, n ∈ ℤ.
- `Virasoro.C` (constructor): The central element C.
- `Virasoro.lie_L_L` (simp): ⁅L m, L n⁆ = (m − n) • L (m + n) + (if m + n = 0 then (m³ − m)/12 else 0) • C.
- `Virasoro.lie_C` (simp): ⁅C, x⁆ = 0.
- `Virasoro.basis` (data): The k-basis indexed by ℤ ⊕ Unit.
- `Virasoro.isSl2Triple` (compatibility): IsSl2Triple (2 • L 0) (L (−1)) (−L 1), relating to Mathlib's sl₂ theory.
- `Virasoro.HasCentralCharge` (other): A Lie module M has central charge c when C acts on M as c • id.

Unit tests:
- `Virasoro.lie_L_two_L_neg_two` (computation): ⁅L 2, L (−2)⁆ = 4 • L 0 + (1/2) • C.
- `Virasoro.lie_L_one_L_neg_one` (computation): ⁅L 1, L (−1)⁆ = 2 • L 0 (no central term).
- `Virasoro.trivial_hasCentralCharge_zero` (degenerate): The trivial one-dimensional module has central charge 0.
- `Virasoro.C_mem_derivedSeries` (non-example): C ∈ ⁅Vir, Vir⁆ (C = 2(⁅L 2, L (−2)⁆ − 2⁅L 1, L (−1)⁆)), so Vir is not isomorphic to the split extension of the Witt algebra by k with a trivial cocycle.

Depends on: `mathlib:LieAlgebra`, `mathlib:LieModule`, `mathlib:IsSl2Triple`.

#### Conformal vector of a vertex algebra (`QM.6/conformal-vector`, definition)

Let V be a vertex algebra over a field k of characteristic 0 with translation D (node vertex-algebra-vacuum-translation). A conformal vector of central charge c ∈ k is ω ∈ V such that: ω_0 v = Dv for all v; ω_1 ω = 2ω; ω_2 ω = 0; ω_3 ω = (c/2)·1; ω_i ω = 0 for i ≥ 4; and L_0 := ω_1 is diagonalizable with integer eigenvalues: V = ⊕_{n∈ℤ} V_n (internal direct sum) with V_n := ker(L_0 − n). Put L_n := ω_{n+1}. The eigenvalue n of v ∈ V_n is its (conformal) weight. Convention (Borcherds): in the moonshine module the space of weight n + 1 is Borcherds' V_n (degree n).

API:
- `ConformalVector.L` (data): L n := ω_{n+1} ∈ End_k(V).
- `ConformalVector.L_neg_one` (simp): L (−1) = D.
- `ConformalVector.weightSpace` (data): V_n := ker(L_0 − n) for n ∈ ℤ.
- `ConformalVector.isInternal_weightSpace` (structure): V = ⊕_{n∈ℤ} V_n (DirectSum.IsInternal).
- `ConformalVector.nprod_mem_weightSpace` (relation): u ∈ V_a, v ∈ V_b ⇒ u_n v ∈ V_{a+b−n−1}.
- `ConformalVector.vac_mem_weightSpace_zero` (simp): 1 ∈ V_0 and ω ∈ V_2.
- `ConformalVector.centralCharge` (projection): The central charge c.

Unit tests:
- `ConformalVector.ofDerivation_zero` (degenerate): For VertexAlgebra.ofDerivation A 0, ω = 0 is a conformal vector of central charge 0 and V = V_0.
- `ConformalVector.lattice_rankOne` (computation): In the lattice vertex algebra of ℤα with ⟨α,α⟩ = 2, ω = ¼ α(−1)²1 is a conformal vector of central charge 1 and L_0 e^α = e^α.
- `ConformalVector.two_omega_not_conformal` (non-example): In the same vertex algebra, 2ω is not a conformal vector: (2ω)_1(2ω) = 8ω ≠ 2·(2ω).
- `ConformalVector.weight_omega` (characterisation): ω ∈ V_2, L_0 1 = 0 and L_{−1}ω = Dω.

Depends on: `QM.6/vertex-algebra`, `QM.6/vertex-algebra-vacuum-translation`, `mathlib:Module.End.eigenspace`, `mathlib:DirectSum.IsInternal`.

#### Modes of a conformal vector form a Virasoro module (`QM.6/conformal-vector-virasoro-representation`, theorem)

Let ω be a conformal vector of central charge c in a vertex algebra V over a field of characteristic 0, and L_n := ω_{n+1}. Then (a) [L_m, L_n] = (m − n)L_{m+n} + c (m³ − m)/12 δ_{m+n,0} for all m, n ∈ ℤ, so V is a Virasoro module of central charge c; (b) L_{−1} = D; (c) for v ∈ V_h with L_n v = 0 for all n > 0 (a primary vector of weight h), [L_m, v_n] = ((m+1)(h−1) − n) v_{m+n}; in particular for v ∈ P^1 (h = 1), [L_m, v_0] = 0, so v_0 commutes with the Virasoro action; (d) (L_{−1}v)_n = −n v_{n−1}.

Hypotheses: ω conformal vector of central charge c.

Proof outline: (a): apply the commutator formula [ω_{m+1}, ω_{n+1}] = Σ_i C(m+1,i)(ω_i ω)_{m+n+2−i} and substitute ω_0 ω = Dω, ω_1ω = 2ω, ω_2ω = 0, ω_3ω = (c/2)1, ω_iω = 0 (i ≥ 4), with (Dω)_k = −k ω_{k−1} and 1_k = δ_{k,−1}. (b) is the axiom ω_0 = D. (c): commutator formula [ω_{m+1}, v_n] = Σ_i C(m+1,i) (ω_i v)_{m+n+1−i}; for primary v, ω_i v = L_{i−1} v vanishes for i ≥ 2, ω_1 v = hv and ω_0 v = Dv, and (Dv)_k = −k v_{k−1}. (d) is the vacuum-translation lemma (c).

Depends on: `QM.6/conformal-vector`, `QM.6/vertex-algebra-commutator-formula`, `QM.6/vertex-algebra-vacuum-translation`, `QM.6/virasoro-algebra`.

#### Vertex operator algebra (`QM.6/vertex-operator-algebra`, definition)

A vertex operator algebra over a field k of characteristic 0 is a vertex algebra V over k with a conformal vector ω of central charge c such that each weight space V_n = ker(L_0 − n) is finite-dimensional and V_n = 0 for all sufficiently negative n (V = ⊕_{n ≥ N} V_n). It is nonnegatively graded when V_n = 0 for n < 0 (Borcherds' definition: all L_0-eigenvalues are nonnegative integers), and of CFT type when moreover V_0 = k·1. A homomorphism of vertex operator algebras is a vertex algebra homomorphism sending ω to ω; Aut(V, ω) is the group of conformal automorphisms, and each of its elements preserves every V_n.

API:
- `VertexOperatorAlgebra` (structure): Vertex algebra with conformal vector, finite-dimensional weight spaces and weights bounded below.
- `VertexOperatorAlgebra.weightSpace` (data): The weight space V_n, n ∈ ℤ.
- `VertexOperatorAlgebra.finiteDimensional_weightSpace` (instance): FiniteDimensional k (V_n).
- `VertexOperatorAlgebra.exists_weightSpace_eq_bot` (other): ∃ N, ∀ n < N, V_n = ⊥.
- `VertexOperatorAlgebra.IsNonnegGraded` (other): Predicate: V_n = ⊥ for n < 0.
- `VertexOperatorAlgebra.IsCFTType` (other): Predicate: nonnegatively graded and V_0 = span{1}.
- `VertexOperatorAlgebra.Aut` (data): The group of conformal automorphisms (g1 = 1, g(u_n v) = (gu)_n(gv), gω = ω).
- `VertexOperatorAlgebra.Aut.mapsTo_weightSpace` (relation): g ∈ Aut maps V_n onto V_n.

Unit tests:
- `VertexOperatorAlgebra.ofFiniteCommAlgebra` (degenerate): A finite-dimensional commutative k-algebra with ∂ = 0 and ω = 0 is a vertex operator algebra of central charge 0 with V = V_0.
- `VertexOperatorAlgebra.lattice_rankOne_weightSpace_one` (computation): For the lattice vertex algebra of ℤα with ⟨α,α⟩ = 2 (central charge 1), dim V_0 = 1 and dim V_1 = 3, spanned by α(−1)1, e^α, e^{−α}.
- `VertexOperatorAlgebra.not_II11` (non-example): The lattice vertex algebra of II_{1,1} with its conformal vector is not a vertex operator algebra: e^r has L_0-weight (r,r)/2 = −mn for r = (m,n), so e^{(1,n)} has weight −n (unbounded below) and V_0 contains the infinitely many independent vectors e^{(m,0)}, m ∈ ℤ.
- `VertexOperatorAlgebra.isCFTType_lattice` (compatibility): For a positive definite even lattice L the lattice vertex algebra satisfies IsCFTType, matching Borcherds' definition.

Depends on: `QM.6/vertex-algebra`, `QM.6/conformal-vector`, `QM.6/vertex-algebra-automorphism`, `QM.6/conformal-vector-virasoro-representation`.

#### Invariant bilinear forms compatible with the conformal vector (`QM.6/invariant-bilinear-form`, definition)

Let V be a vertex algebra over a field k of characteristic 0 with conformal vector ω, and θ a vertex algebra automorphism of V with θ² = 1 and θ(ω) = ω (the Cartan involution; θ = id for the moonshine module). A symmetric bilinear form (·,·) on V is θ-invariant (compatible with ω in Borcherds' sense) if for every u ∈ V_i (L_0-weight i), all n ∈ ℤ and all v, w ∈ V: (u_n v, w) = (−1)^i Σ_{j≥0} (1/j!) (v, (L_1^j θ(u))_{2i−j−n−2} w). For θ = id this is the Frenkel–Huang–Lepowsky invariance (Y(u,z)v, w) = (v, Y(e^{zL_1}(−z^{−2})^{L_0}u, z^{−1})w). The associated contravariant form is (u, v)_0 := −(u, θ v).

API:
- `VertexAlgebra.IsInvariantForm` (other): The predicate: B symmetric and θ-invariant in the displayed sense.
- `VertexAlgebra.IsInvariantForm.adjoint_L` (relation): B (L n v) w = B v (L (−n) w).
- `VertexAlgebra.IsInvariantForm.orthogonal_weightSpace` (relation): B v w = 0 for v ∈ V_i, w ∈ V_j, i ≠ j.
- `VertexAlgebra.IsInvariantForm.adjoint_zeroMode` (relation): For u ∈ P^1: B (u_0 v) w = −B v ((θ u)_0 w).
- `VertexAlgebra.contravariantForm` (data): The contravariant form (u, v)_0 := −B u (θ v).
- `VertexAlgebra.IsInvariantForm.comp_aut` (functoriality): If g ∈ Aut(V, ω) commutes with θ then B(g·, g·) is again θ-invariant.

Unit tests:
- `VertexAlgebra.isInvariantForm_zero` (degenerate): The zero bilinear form is θ-invariant for every θ.
- `VertexAlgebra.IsInvariantForm.lattice_fock` (computation): For V_L with L even unimodular, the Fock form with (e^r, e^s) = δ_{r,s} is θ-invariant for the Cartan involution and gives (α(−1)1, β(−1)1) = ⟨α, β⟩.
- `VertexAlgebra.IsInvariantForm.lattice_fock_not_id` (non-example): For θ = id every invariant form on V_L pairs lattice degree r only with −r; hence the Fock form (e^r, e^s) = δ_{r,s} is not id-invariant on V_L for L = ℤα, ⟨α,α⟩ = 2.
- `VertexAlgebra.IsInvariantForm.vac_orthogonal` (characterisation): For an invariant form, (1, v) = 0 for every v of nonzero weight.

Depends on: `QM.6/conformal-vector`, `QM.6/vertex-algebra-automorphism`, `mathlib:LinearMap.BilinForm`, `mathlib:LinearMap.BilinForm.IsSymm`.

#### Conformal vector and invariant form of a tensor product (`QM.6/tensor-product-conformal-structure`, lemma)

Let V, W be vertex algebras over a field k of characteristic 0 with conformal vectors ω_V, ω_W of central charges c_V, c_W, involutions θ_V, θ_W and θ-invariant symmetric forms B_V, B_W. Then ω := ω_V ⊗ 1 + 1 ⊗ ω_W is a conformal vector of V ⊗ W of central charge c_V + c_W, L_n^{V⊗W} = L_n^V ⊗ 1 + 1 ⊗ L_n^W, (V⊗W)_n = ⊕_{a+b=n} V_a ⊗ W_b, θ_V ⊗ θ_W is an involution fixing ω, and B_V ⊗ B_W is a (θ_V ⊗ θ_W)-invariant symmetric form, nondegenerate when B_V and B_W are.

Hypotheses: V, W vertex algebras with conformal vectors, involutions and invariant forms.

Proof outline: Mode formula of the tensor product: (ω_V ⊗ 1)_{n+1} = L_n^V ⊗ 1 and (1 ⊗ ω_W)_{n+1} = 1 ⊗ L_n^W; check the six conformal-vector conditions factorwise (the cross terms vanish because the two factors commute). Invariance: the adjoint formula is multiplicative for a ⊗ b with a, b homogeneous since L_1 and L_0 act as derivations of the tensor product; check on pure tensors.

Depends on: `QM.6/vertex-algebra-tensor-product`, `QM.6/conformal-vector`, `QM.6/invariant-bilinear-form`.

#### Graded trace (graded character) of an endomorphism (`QM.6/graded-trace`, definition)

Let V be a vertex operator algebra over a field k of characteristic 0 and g ∈ End_k(V) with g(V_n) ⊆ V_n for all n (for example g ∈ Aut(V, ω)). The graded trace of g is Z_V(g) := Σ_{n∈ℤ} tr(g|V_n) q^n ∈ k((q)) (a Laurent series because V_n = 0 for n ≪ 0). The graded dimension is Z_V(1) = Σ_n dim(V_n) q^n. Convention: no factor q^{−c/24} is included here (it is added in node mckay-thompson-series for c = 24).

API:
- `VertexOperatorAlgebra.gradedTrace` (data): Z_V(g) ∈ LaurentSeries k.
- `VertexOperatorAlgebra.gradedTrace_coeff` (simp): coeff n (Z_V g) = tr(g|V_n).
- `VertexOperatorAlgebra.gradedDimension` (data): Z_V(1) with coefficients dim V_n.
- `VertexOperatorAlgebra.gradedTrace_conj` (relation): Z_V(h g h⁻¹) = Z_V(g) for h ∈ Aut(V, ω).
- `VertexOperatorAlgebra.gradedTrace_tensor` (relation): Z_{V⊗W}(g⊗h) = Z_V(g) Z_W(h).
- `VertexOperatorAlgebra.gradedTrace_one_coeff_nonneg` (other): Every coefficient of the graded dimension is a natural number.

Unit tests:
- `VertexOperatorAlgebra.gradedTrace_trivial` (degenerate): For the one-dimensional vertex operator algebra k (c = 0) and g = t·id, Z(g) = t.
- `VertexOperatorAlgebra.gradedDimension_heisenberg` (computation): For the rank-one Heisenberg vertex operator algebra (lattice degree 0 part of V_{ℤα}), Z(1) = Π_{n≥1}(1 − q^n)^{−1}, with coefficients the partition numbers 1, 1, 2, 3, 5, 7.
- `VertexOperatorAlgebra.gradedTrace_neg_heisenberg` (computation): For the involution α ↦ −α of the rank-one Heisenberg vertex operator algebra, Z(g) = Π_{n≥1}(1 + q^n)^{−1}.
- `VertexOperatorAlgebra.gradedTrace_not_multiplicative` (non-example): Z is not multiplicative in g: for that involution Z(g)² has q-coefficient −2 while Z(g²) = Z(1) has q-coefficient 1.

Depends on: `QM.6/vertex-operator-algebra`, `mathlib:LinearMap.trace`, `mathlib:LaurentSeries`, `mathlib:HahnSeries`.

#### McKay–Thompson series (`QM.6/mckay-thompson-series`, definition)

Let V be a vertex operator algebra over a field k of characteristic 0 and g ∈ Aut(V, ω). The McKay–Thompson series of g is T_g := q^{−1}·Z_V(g) = Σ_{n∈ℤ} tr(g|V_{n+1}) q^n ∈ k((q)), and c_g(n) := tr(g|V_{n+1}) (Borcherds' Thompson series Σ Tr(g|V_n)q^n with Borcherds' V_n = V_{n+1} here). The factor q^{−1} is q^{−c/24} for central charge c = 24, the case used in this stage. For a group G acting on V by conformal automorphisms, T_g for g ∈ G is a class function of g. When V is nonnegatively graded with V_0 = k·1 and V_1 = 0, T_g = q^{−1} + Σ_{n≥1} c_g(n) q^n.

API:
- `VertexOperatorAlgebra.mckayThompsonSeries` (data): T_g := q^{−1} Z_V(g).
- `VertexOperatorAlgebra.mckayThompsonSeries_coeff` (simp): coeff n T_g = tr(g|V_{n+1}).
- `VertexOperatorAlgebra.mckayThompsonSeries_conj` (relation): T_{hgh⁻¹} = T_g.
- `VertexOperatorAlgebra.mckayThompsonSeries_coeff_neg_one` (simp): If V_0 = k·1 then coeff (−1) T_g = 1.
- `VertexOperatorAlgebra.mckayThompsonSeries_coeff_zero` (simp): If V_1 = 0 then coeff 0 T_g = 0.
- `VertexOperatorAlgebra.mckayThompsonSeries_mul_single` (compatibility): HahnSeries.single 1 1 * T_g = gradedTrace V g.

Unit tests:
- `VertexOperatorAlgebra.mckayThompsonSeries_heisenberg24` (computation): For the rank-24 Heisenberg vertex operator algebra and g = 1, the coefficients of T_1 at q^{−1}, q^0, q^1, q^2 are 1, 24, 324, 3200.
- `VertexOperatorAlgebra.mckayThompsonSeries_coeff_lt` (degenerate): If V is nonnegatively graded then coeff n T_g = 0 for every n < −1 (T_g has at most a simple pole at q = 0).
- `VertexOperatorAlgebra.mckayThompsonSeries_heisenberg24_not_invariant` (non-example): For the rank-24 Heisenberg vertex operator algebra, T_1 = q^{−1}Π(1−q^n)^{−24} is the q-expansion of 1/Δ, a modular form of weight −12; no constant shift of it is SL₂(ℤ)-invariant, so a McKay–Thompson series of central charge 24 need not be a modular function.
- `VertexOperatorAlgebra.mckayThompsonSeries_normalized` (characterisation): If V is of CFT type with V_1 = 0, then T_g − q^{−1} ∈ q·k[[q]] for every g.

Depends on: `QM.6/graded-trace`, `QM.6/vertex-operator-algebra`, `mathlib:HahnSeries.single`.

#### Double cover of an even lattice and its twisted group algebra (`QM.6/even-lattice-double-cover`, construction)

Let (L, ⟨·,·⟩) be an even lattice: a finitely generated free ℤ-module with a symmetric ℤ-valued bilinear form with ⟨α,α⟩ ∈ 2ℤ for all α (in Tau Ceti: the carrier of a TauCeti.IntegralLattice satisfying IsEven). A lattice cocycle is a bimultiplicative map ε : L × L → {±1} with ε(α,α) = (−1)^{⟨α,α⟩/2} for all α; it satisfies ε(α,β)ε(β,α) = (−1)^{⟨α,β⟩}. Cocycles exist: for a ℤ-basis e_1, …, e_d put ε(e_i,e_j) = (−1)^{⟨e_i,e_j⟩} for i < j, (−1)^{⟨e_i,e_i⟩/2} for i = j, 1 for i > j, and extend bimultiplicatively. For a field k, the twisted group algebra k_ε[L] has k-basis {e^α : α ∈ L} and product e^α e^β = ε(α,β) e^{α+β}; it is associative with unit e^0. The group L̂ = {±e^α} is a central extension 1 → {±1} → L̂ → L → 1 with commutator (−1)^{⟨α,β⟩}, unique up to isomorphism; two cocycles give isomorphic twisted group algebras.

API:
- `EvenLattice.Cocycle` (structure): Bimultiplicative ε : L → L → ℤˣ with ε α α = (−1)^{⟨α,α⟩/2}.
- `EvenLattice.Cocycle.exists` (constructor): Every even lattice admits a cocycle (built from a basis).
- `EvenLattice.Cocycle.mul_swap` (relation): ε α β * ε β α = (−1)^{⟨α,β⟩}.
- `EvenLattice.TwistedGroupAlgebra` (data): k_ε[L] with basis e^α and e^α e^β = ε(α,β)e^{α+β}.
- `EvenLattice.TwistedGroupAlgebra.single_mul_single` (simp): e^α * e^β = ε α β • e^{α+β}.
- `EvenLattice.TwistedGroupAlgebra.equivOfCocycle` (equivalence): Two cocycles give isomorphic twisted group algebras (by rescaling basis vectors).

Unit tests:
- `EvenLattice.TwistedGroupAlgebra.A1_sq` (computation): For L = ℤα, ⟨α,α⟩ = 2: e^α * e^α = −e^{2α} and e^α * e^{−α} = −e^0.
- `EvenLattice.TwistedGroupAlgebra.zero_lattice` (degenerate): For L = 0, k_ε[L] ≃ k.
- `EvenLattice.Cocycle.one_not_cocycle` (non-example): The constant map ε = 1 is not a cocycle for L = ℤα with ⟨α,α⟩ = 2, since ε(α,α) must be −1.
- `EvenLattice.TwistedGroupAlgebra.commute_iff` (characterisation): e^α e^β = e^β e^α if and only if ⟨α,β⟩ is even.

Depends on: `tauceti:TauCeti.IntegralLattice`, `tauceti:TauCeti.IntegralLattice.IsEven`, `mathlib:AddMonoidAlgebra`.

#### The vertex algebra of an even lattice (`QM.6/lattice-vertex-algebra`, construction)

Let L be an even lattice with cocycle ε, k a field of characteristic 0, h := L ⊗_ℤ k with the k-bilinear extension of ⟨·,·⟩. Put V_L := S(ĥ⁻) ⊗_k k_ε[L], where S(ĥ⁻) is the symmetric algebra of ⊕_{n≥1} h ⊗ t^{−n} (write α(−n) := α ⊗ t^{−n}). For α ∈ h, n ∈ ℤ define α(n) ∈ End(V_L): multiplication by α(n) for n < 0; α(0)(s ⊗ e^γ) = ⟨α,γ⟩ s ⊗ e^γ; for n > 0 the derivation of S(ĥ⁻) with α(n)β(−m) = n⟨α,β⟩δ_{n,m}; so [α(m), β(n)] = m⟨α,β⟩δ_{m+n,0}. Then there is a unique vertex algebra structure on V_L with vacuum 1 := 1 ⊗ e^0 such that Y(α(−1)1, z) = Σ_n α(n) z^{−n−1} and Y(1 ⊗ e^β, z) = exp(Σ_{n≥1} β(−n)z^n/n) exp(−Σ_{n≥1} β(n)z^{−n}/n) e^β z^{β(0)}, where e^β acts by left multiplication in k_ε[L] and z^{β(0)}(s ⊗ e^γ) = z^{⟨β,γ⟩} s ⊗ e^γ. It is L-graded (V_{L,γ} := S(ĥ⁻) ⊗ e^γ, u_n v ∈ V_{L,α+β} for u ∈ V_{L,α}, v ∈ V_{L,β}). If ⟨·,·⟩ is nondegenerate with dual bases (h_i), (h^i) of h, then ω := ½ Σ_i h_i(−1)h^i(−1)1 is a conformal vector of central charge d = rank L, and L_0(α_1(−n_1)⋯α_k(−n_k) ⊗ e^γ) = (Σ n_i + ⟨γ,γ⟩/2)·(same vector). The Cartan involution θ(α(n)) = −α(n), θ(e^γ) = (−1)^{⟨γ,γ⟩/2} e^{−γ} (for a cocycle with ε(γ,−γ) = ε(γ,γ)) is an automorphism fixing ω. If L is positive definite, V_L is a vertex operator algebra of CFT type.

API:
- `latticeVertexAlgebra` (constructor): The vertex algebra structure on V_L = S(ĥ⁻) ⊗ k_ε[L].
- `latticeVertexAlgebra.nprod_mem_degree` (relation): u ∈ V_{L,α}, v ∈ V_{L,β} ⇒ u_n v ∈ V_{L,α+β}.
- `latticeVertexAlgebra.expMode` (simp): (e^α)_n e^β = 0 for n ≥ −⟨α,β⟩ and (e^α)_{−⟨α,β⟩−1} e^β = ε(α,β) e^{α+β}.
- `latticeVertexAlgebra.heisenbergMode` (simp): (α(−1)1)_n = α(n).
- `latticeVertexAlgebra.conformalVector` (data): For nondegenerate ⟨·,·⟩, the conformal vector ω = ½Σ h_i(−1)h^i(−1)1 of central charge rank L.
- `latticeVertexAlgebra.L_zero_apply` (simp): L_0(α_1(−n_1)⋯α_k(−n_k) ⊗ e^γ) = (Σn_i + ⟨γ,γ⟩/2)·(same).
- `latticeVertexAlgebra.cartanInvolution` (data): The involution θ with θ(α(n)) = −α(n), θ(e^γ) = (−1)^{⟨γ,γ⟩/2}e^{−γ}.
- `latticeVertexAlgebra.toVOA` (coercion): For positive definite L, the vertex operator algebra of CFT type (V_L, ω).

Unit tests:
- `latticeVertexAlgebra.A1_bracket` (computation): For L = ℤα, ⟨α,α⟩ = 2: (e^α)_0 e^{−α} = ε(α,−α)·α(−1)1 and (α(−1)1)_0 e^α = 2e^α (sl₂ relations in V_1).
- `latticeVertexAlgebra.zero_lattice` (degenerate): For L = 0 the vertex algebra V_L is one-dimensional, spanned by 1.
- `latticeVertexAlgebra.odd_not_local` (non-example): For the odd lattice ℤα with ⟨α,α⟩ = 1 the fields Y(e^α,z) and Y(e^α,w) are mutually anti-local ((z−w)^N{Y(e^α,z),Y(e^α,w)} = 0), so the construction produces a vertex superalgebra, not a vertex algebra; evenness is necessary.
- `latticeVertexAlgebra.gradedDimension_posDef` (compatibility): For positive definite L of rank d, gradedDimension (toVOA) = (Σ_{γ∈L} q^{⟨γ,γ⟩/2}) · Π_{n≥1}(1 − q^n)^{−d}.

Depends on: `QM.6/even-lattice-double-cover`, `QM.6/vertex-algebra-existence-theorem`, `QM.6/conformal-vector`, `QM.6/vertex-operator-algebra`, `mathlib:SymmetricAlgebra`, `mathlib:TensorProduct`, `tauceti:TauCeti.IntegralLattice.IsNondegenerate`.

#### Invariant form on the vertex algebra of an even unimodular lattice (`QM.6/lattice-vertex-algebra-invariant-form`, lemma)

Let L be an even unimodular lattice (for example II_{1,1}) and V_L its vertex algebra over a field k of characteristic 0 with conformal vector ω and Cartan involution θ. Then V_L carries a nondegenerate symmetric bilinear form (·,·), invariant in the Frenkel–Huang–Lepowsky sense (θ = id in node invariant-bilinear-form), unique up to a nonzero scalar; it satisfies (V_{L,r}, V_{L,s}) = 0 unless r + s = 0, (α(n)u, v) = −(u, α(−n)v), θ preserves it, and with the normalization (1,1) = −1 one has (e^r, θ(e^r)) = −1 for every r ∈ L. Consequently, for a vertex algebra V with id-invariant form (·,·)_V, the product form on V ⊗ V_L satisfies (u ⊗ e^r, θ(u ⊗ e^r)) = −(u,u)_V.

Hypotheses: L even unimodular; k field of characteristic 0.

Proof outline: V_L is an irreducible module over itself and every irreducible V_L-module is isomorphic to V_L (Dong 1993, cited in Jurisich 1998 Lemma 6.1); the contragredient module V_L' (restricted dual with respect to the L × ℤ grading) is irreducible, hence isomorphic to V_L; an isomorphism V_L ≅ V_L' is a nondegenerate invariant form, and symmetry holds by Frenkel–Huang–Lepowsky Remark 5.3.3 (Jurisich 1998 Lemma 6.1). Orthogonality of degrees: invariance with u = α(−1)1 gives (α(0)x, y) = −(x, α(0)y), so (x,y) = 0 unless the degrees add to 0. (e^r, θe^r) = (1,1): apply the invariance formula to u = e^r, which is primary of weight ⟨r,r⟩/2, with v = 1: (e^r, θe^r) = ((e^r)_{−1}1, θe^r) = (−1)^{⟨r,r⟩/2}(1, (e^r)_{⟨r,r⟩−1} θe^r); by the expMode formula (e^r)_{⟨r,r⟩−1}e^{−r} = ε(r,−r)1, and the signs (−1)^{⟨r,r⟩/2} from θ and from the adjoint formula and ε(r,−r) = ε(r,r) = (−1)^{⟨r,r⟩/2} cancel (Jurisich 1998, proof of Theorem 6.1). The product-form statement is the tensor-product lemma applied to V ⊗ V_L.

Depends on: `QM.6/lattice-vertex-algebra`, `QM.6/invariant-bilinear-form`, `QM.6/tensor-product-conformal-structure`, `tauceti:TauCeti.IntegralLattice.IsUnimodular`.

#### The even unimodular Lorentzian lattice II_{1,1} (`QM.6/lorentzian-lattice-II11`, definition)

II_{1,1} is ℤ² with the symmetric bilinear form ⟨(m,n),(m',n')⟩ = −(mn' + m'n) (Gram matrix [[0,−1],[−1,0]] in the standard basis); the norm of (m,n) is ⟨(m,n),(m,n)⟩ = −2mn. It is even, unimodular (Gram determinant −1) and of signature (1,1). Its norm-2 vectors are exactly ±(1,−1); the reflection in (1,−1) is (m,n) ↦ (n,m). Convention: Borcherds' sign; Gannon uses the form mn' + m'n, which differs by the isometry (m,n) ↦ (m,−n).

API:
- `II11` (constructor): The integral lattice II_{1,1} on ℚ² (TauCeti.IntegralLattice.ofGramMatrix).
- `II11.form_apply` (simp): ⟨(m,n),(m',n')⟩ = −(mn' + m'n).
- `II11.isEven` (instance): II_{1,1} is even.
- `II11.isUnimodular` (instance): II_{1,1} is unimodular.
- `II11.norm_eq_two_iff` (characterisation): ⟨v,v⟩ = 2 ↔ v = (1,−1) ∨ v = (−1,1).
- `II11.reflection` (data): The reflection in (1,−1): (m,n) ↦ (n,m), an isometry.

Unit tests:
- `II11.norm_one_neg_one` (computation): ⟨(1,−1),(1,−1)⟩ = 2 and ⟨(1,1),(1,1)⟩ = −2.
- `II11.norm_eq_zero_iff` (characterisation): ⟨(m,n),(m,n)⟩ = 0 ↔ m = 0 ∨ n = 0.
- `II11.gram_det` (degenerate): The Gram determinant of the standard basis is −1.
- `II11.not_posDef` (non-example): II_{1,1} is not positive definite: (1,1) has negative norm.

Depends on: `tauceti:TauCeti.IntegralLattice.ofGramMatrix`, `tauceti:TauCeti.IntegralLattice.IsEven`, `tauceti:TauCeti.IntegralLattice.IsUnimodular`.

### QM.6b The no-ghost theorem and the Monster Lie algebra

Physical states and their Lie algebra, the no-ghost theorem in Jurisich's algebraic form, Borcherds' axioms for a moonshine module and the Monster Lie algebra m(V) = g(V ⊗ V_{II_{1,1}}); Borcherds algebras by generators and relations, their canonical central extension and Borcherds' characterisation; Lazard elimination, Adams operations and Witt's formula; Jurisich's free subalgebras; the identification m ≅ g(M)/c with the simple roots (1,−1) and (1,n) of multiplicity c(n), and the equivariant free decomposition of u⁻.

#### Physical spaces P^i of a vertex algebra with conformal vector (`QM.6/physical-space`, definition)

Let V be a vertex algebra over a field k of characteristic 0 with conformal vector ω and L_n = ω_{n+1}. For i ∈ ℤ the physical space of weight i is P^i := {v ∈ V : L_0 v = i v and L_n v = 0 for all n ≥ 1} (the lowest-weight vectors of the Virasoro action of weight i). If V is graded by an abelian group Λ compatibly with the vertex algebra structure and with L_0 ∈ End of degree 0, then P^i = ⊕_{r∈Λ} P^i_r.

API:
- `VertexAlgebra.physicalSpace` (data): P^i as a k-submodule of V.
- `VertexAlgebra.mem_physicalSpace` (characterisation): v ∈ P^i ↔ L_0 v = i v ∧ ∀ n ≥ 1, L_n v = 0.
- `VertexAlgebra.mem_physicalSpace_iff_L_one_L_two` (characterisation): v ∈ P^i ↔ L_0 v = i v ∧ L_1 v = 0 ∧ L_2 v = 0.
- `VertexAlgebra.zeroMode_mem_physicalSpace` (relation): u, v ∈ P^1 ⇒ u_0 v ∈ P^1.
- `VertexAlgebra.translation_physicalSpace_zero` (relation): D(P^0) ⊆ P^1.
- `VertexAlgebra.physicalSpace_map` (functoriality): A conformal automorphism g maps P^i onto P^i.

Unit tests:
- `VertexAlgebra.vac_mem_physicalSpace_zero` (degenerate): 1 ∈ P^0.
- `VertexAlgebra.omega_not_mem_physicalSpace_two` (non-example): For central charge c ≠ 0, ω ∉ P^2 because L_2 ω = (c/2)·1 ≠ 0.
- `VertexAlgebra.physicalSpace_A1` (computation): In the lattice vertex algebra of ℤα, ⟨α,α⟩ = 2: e^α, e^{−α} and α(−1)1 lie in P^1.
- `VertexAlgebra.physicalSpace_one_eq_weightSpace` (characterisation): For a vertex operator algebra of CFT type with a nondegenerate invariant form, P^1 = V_1: for v ∈ V_1, L_nv ∈ V_{1−n} = 0 for n ≥ 2, and L_1v = a·1 with a(1,1) = (L_1v, 1) = (v, L_{−1}1) = 0 while (1,1) ≠ 0.

Depends on: `QM.6/conformal-vector`, `QM.6/conformal-vector-virasoro-representation`.

#### The Lie algebra of physical states (`QM.6/physical-lie-algebra`, construction)

Let V be a vertex algebra over a field k of characteristic 0 with conformal vector ω, an involution θ ∈ Aut(V) fixing ω, and a symmetric bilinear form (·,·) that is invariant (Frenkel–Huang–Lepowsky sense, node invariant-bilinear-form with θ = id) and θ-stable. Let N := {p ∈ P^1 : (p, P^1) = 0}. Then g(V) := P^1/N is a Lie algebra over k with bracket [u + N, v + N] := u_0 v + N; (·,·) induces on g(V) a nondegenerate symmetric invariant form ([x,y],z) = −(y,[x,z]); θ induces a Lie algebra involution; the contravariant form is (x,y)_0 := −(x, θy). P^1 ∩ DV ⊆ N, so g(V) is a quotient of the Lie subalgebra P^1/(P^1 ∩ DV) of V/DV. If V is graded by an abelian group Λ (compatibly with products, L_0 of degree 0, (V_r, V_s) = 0 unless r + s = 0, θ(V_r) = V_{−r}), then g(V) = ⊕_{r∈Λ} g(V)_r is a Λ-graded Lie algebra. Every g ∈ Aut(V) fixing ω, commuting with θ and preserving (·,·) induces an automorphism of g(V) preserving the grading and both forms.

API:
- `VertexAlgebra.physicalLieAlgebra` (structure): g(V) = P^1 ⧸ N with its LieRing and LieAlgebra k instances.
- `VertexAlgebra.physicalLieAlgebra.bracket_mk` (simp): ⁅mk u, mk v⁆ = mk (u_0 v) for u, v ∈ P^1.
- `VertexAlgebra.physicalLieAlgebra.form` (data): The induced nondegenerate symmetric invariant form.
- `VertexAlgebra.physicalLieAlgebra.form_lie` (relation): form ⁅x, y⁆ z = −form y ⁅x, z⁆.
- `VertexAlgebra.physicalLieAlgebra.involution` (data): The Lie algebra involution induced by θ.
- `VertexAlgebra.physicalLieAlgebra.gradedPiece` (data): g(V)_r for a Λ-graded V, with ⁅g_r, g_s⁆ ⊆ g_{r+s}.
- `VertexAlgebra.physicalLieAlgebra.map` (functoriality): Automorphisms of (V, ω, θ, form) act by Lie algebra automorphisms preserving grading and forms; map_id and map_comp.

Unit tests:
- `VertexAlgebra.physicalLieAlgebra.A1_iso_sl2` (computation): For the lattice vertex algebra of ℤα with ⟨α,α⟩ = 2 (Fock form twisted by θ), g(V) is three-dimensional and (mk e^α, −mk e^{−α}, mk α(−1)1) is an sl₂-triple up to the cocycle sign.
- `VertexAlgebra.physicalLieAlgebra.trivial` (degenerate): For the one-dimensional vertex algebra k (c = 0), P^1 = 0 and g(V) = 0.
- `VertexAlgebra.physicalLieAlgebra.radical_II11_ne_bot` (non-example): For V = V_{II_{1,1}}, D(e^{(1,0)}) is a nonzero element of P^1 lying in N (e^{(1,0)} ∈ P^0 has weight 0), so the bracket on P^1 itself does not give the Lie algebra; the quotient by N is needed.
- `VertexAlgebra.physicalLieAlgebra.form_nondegenerate` (characterisation): The induced form on g(V) is nondegenerate and invariant.

Depends on: `QM.6/physical-space`, `QM.6/invariant-bilinear-form`, `QM.6/vertex-algebra-skew-symmetry`, `QM.6/vertex-algebra-commutator-formula`, `QM.6/vertex-algebra-lie-algebra`, `mathlib:LieAlgebra`, `mathlib:LinearMap.BilinForm.Nondegenerate`.

#### No-ghost theorem, step 1: adjoints, commutators and nondegeneracy (`QM.6/no-ghost-operator-adjoints`, lemma)

Setting: V is a vertex operator algebra over ℝ with conformal vector of central charge 24, nonnegatively graded with dim V_0 = 1, with a nondegenerate symmetric invariant bilinear form (·,·)_V, and a group G acting by automorphisms preserving ω and (·,·)_V. L := II_{1,1}; W := V ⊗ V_L with conformal vector of central charge 26, involution θ := id ⊗ θ_L, product form (·,·) (with (1,1)_{V_L} = −1) and contravariant form (x,y)_0 := −(x, θy); G acts trivially on V_L. For 0 ≠ r ∈ L fix w ∈ L with ⟨w,w⟩ = 0 and ⟨r,w⟩ ≠ 0, and put K_i := (1 ⊗ w(−1)1)_i = 1 ⊗ w(i). H := V ⊗ S(ĥ⁻) ⊗ e^r (the degree-r subspace), 𝒜 the Lie algebra spanned by all L_i, K_i, 𝒲 = span{L_i}, 𝒴 = span{K_i}, with ± and 0 parts by the sign of i. P := {v ∈ H : L_i v = 0 for i > 0}, T := {v ∈ H : L_i v = K_i v = 0 for i > 0}, N := rad((·,·)_0|_P), K := U(𝒴)T, S := 𝒲⁻U(𝒲⁻)U(𝒴⁻)T; a subscript 1 means the L_0-weight-one part. Claim: (a) with respect to (·,·)_0, L_i* = L_{−i} and K_i* = K_{−i} for all i; (b) [L_i, K_j] = −j K_{i+j} and [K_i, K_j] = 0; (c) (·,·)_0 restricted to H is nondegenerate; (d) H = ⊕_{n ≥ ⟨r,r⟩/2} H_n with each L_0-weight space H_n finite-dimensional.

Hypotheses: Setting as stated; r ≠ 0.

Proof outline: (a): apply the adjoint formula to ω (weight 2, L_1ω = 0, θω = ω) and to 1 ⊗ w(−1)1 (weight 1, L_1 = 0, θ = −1). (b): [L_m, w(n)] = −n w(m+n) in V_L and w(i), w(j) commute because ⟨w,w⟩ = 0. (c): the form on W is nondegenerate and pairs degree r with degree r only (for the contravariant form), so its radical on H lies in the radical on W. (d): weights of v ⊗ α_1(−n_1)⋯ ⊗ e^r are wt(v) + Σn_i + ⟨r,r⟩/2 with wt(v) ≥ 0; finitely many vectors of each weight because V has finite-dimensional weight spaces and the partitions are finite.

Depends on: `QM.6/lattice-vertex-algebra`, `QM.6/lattice-vertex-algebra-invariant-form`, `QM.6/tensor-product-conformal-structure`, `QM.6/invariant-bilinear-form`, `QM.6/lorentzian-lattice-II11`.

#### No-ghost theorem, step 2: H is generated by transverse states (`QM.6/no-ghost-transverse-generation`, lemma)

Setting: V is a vertex operator algebra over ℝ with conformal vector of central charge 24, nonnegatively graded with dim V_0 = 1, with a nondegenerate symmetric invariant bilinear form (·,·)_V, and a group G acting by automorphisms preserving ω and (·,·)_V. L := II_{1,1}; W := V ⊗ V_L with conformal vector of central charge 26, involution θ := id ⊗ θ_L, product form (·,·) (with (1,1)_{V_L} = −1) and contravariant form (x,y)_0 := −(x, θy); G acts trivially on V_L. For 0 ≠ r ∈ L fix w ∈ L with ⟨w,w⟩ = 0 and ⟨r,w⟩ ≠ 0, and put K_i := (1 ⊗ w(−1)1)_i = 1 ⊗ w(i). H := V ⊗ S(ĥ⁻) ⊗ e^r (the degree-r subspace), 𝒜 the Lie algebra spanned by all L_i, K_i, 𝒲 = span{L_i}, 𝒴 = span{K_i}, with ± and 0 parts by the sign of i. P := {v ∈ H : L_i v = 0 for i > 0}, T := {v ∈ H : L_i v = K_i v = 0 for i > 0}, N := rad((·,·)_0|_P), K := U(𝒴)T, S := 𝒲⁻U(𝒲⁻)U(𝒴⁻)T; a subscript 1 means the L_0-weight-one part. Claim: H = U(𝒜)T, i.e. every vector of H is obtained from vectors annihilated by all L_i, K_i (i > 0) by applying the operators L_i, K_i.

Hypotheses: Setting as stated.

Proof outline: By step 1 the form on each finite-dimensional H_n is nondegenerate and distinct weight spaces are orthogonal, so H_n = (U(𝒜)T)_n ⊕ ((U(𝒜)T)^⊥)_n and H = U(𝒜)T ⊕ (U(𝒜)T)^⊥ as 𝒜-modules (the orthogonal complement is 𝒜-stable because 𝒜 is closed under adjoints). If (U(𝒜)T)^⊥ ≠ 0, take its lowest weight n (weights are bounded below by step 1 (d)); since L_i, K_i (i > 0) lower weight, its weight-n part is annihilated by them, so lies in T ⊆ U(𝒜)T, a contradiction.

Depends on: `QM.6/no-ghost-operator-adjoints`.

#### No-ghost theorem, step 3: the transverse space is isomorphic to V ⊗ e^r (`QM.6/no-ghost-transverse-space`, lemma)

Setting: V is a vertex operator algebra over ℝ with conformal vector of central charge 24, nonnegatively graded with dim V_0 = 1, with a nondegenerate symmetric invariant bilinear form (·,·)_V, and a group G acting by automorphisms preserving ω and (·,·)_V. L := II_{1,1}; W := V ⊗ V_L with conformal vector of central charge 26, involution θ := id ⊗ θ_L, product form (·,·) (with (1,1)_{V_L} = −1) and contravariant form (x,y)_0 := −(x, θy); G acts trivially on V_L. For 0 ≠ r ∈ L fix w ∈ L with ⟨w,w⟩ = 0 and ⟨r,w⟩ ≠ 0, and put K_i := (1 ⊗ w(−1)1)_i = 1 ⊗ w(i). H := V ⊗ S(ĥ⁻) ⊗ e^r (the degree-r subspace), 𝒜 the Lie algebra spanned by all L_i, K_i, 𝒲 = span{L_i}, 𝒴 = span{K_i}, with ± and 0 parts by the sign of i. P := {v ∈ H : L_i v = 0 for i > 0}, T := {v ∈ H : L_i v = K_i v = 0 for i > 0}, N := rad((·,·)_0|_P), K := U(𝒴)T, S := 𝒲⁻U(𝒲⁻)U(𝒴⁻)T; a subscript 1 means the L_0-weight-one part. Claim: (a) K = T ⊕ rad(K) with (·,·)_0 nondegenerate on T; (b) K = (V ⊗ e^r) ⊕ rad(K), and K is exactly the space of lowest-weight vectors of the abelian Lie algebra 𝒴 in H; (c) consequently the projections give a G-equivariant isometric isomorphism V ⊗ e^r ≅ T respecting L_0-weights, so T_1 ≅ V_{1−⟨r,r⟩/2} as G-modules with forms, where (u ⊗ e^r, u ⊗ e^r)_0 = (u,u)_V.

Hypotheses: Setting as stated; PBW theorem for U(𝒴) and U(𝒜).

Proof outline: (a): by PBW, K = U(𝒴⁻)U(𝒴⁺)U(𝒴⁰)T = U(𝒴⁻)T = T ⊕ 𝒴⁻U(𝒴⁻)T; the second summand is orthogonal to K (adjoints K_i* = K_{−i}), hence in rad(K); T ∩ rad = 0 by step 1 (c) and step 2. (b): H = U(𝒲⁻)U(𝒴⁻)T by PBW and step 2, and no nonzero vector of 𝒲⁻U(𝒲⁻)U(𝒴⁻)T is a 𝒴-lowest-weight vector, so K is the space of 𝒴-lowest-weight vectors. Since ⟨w,w⟩ = 0 and ⟨r,w⟩ ≠ 0, (w, r) is a basis of ℝ²; writing S(ĥ⁻) = ℝ[x_i] ⊗ ℝ[z_i] with x_i = w(−i), z_i = r(−i), K_k = 1 ⊗ w(k) acts on ℝ[z_i] as k⟨r,w⟩∂/∂z_k (k > 0) and commutes with ℝ[x_i]; ⟨r,w⟩ ≠ 0 forces the lowest-weight vectors to be V ⊗ ℝ[x_i] ⊗ e^r, of which the part of positive x-degree is null. (c): both V ⊗ e^r and T map isomorphically onto K/rad(K); the maps commute with G (G acts trivially on V_L) and with L_0 on the weight-one parts.

Depends on: `QM.6/no-ghost-transverse-generation`, `QM.6/no-ghost-operator-adjoints`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

#### No-ghost theorem, step 4: spurious states in critical dimension (`QM.6/no-ghost-spurious-states`, lemma)

Setting: V is a vertex operator algebra over ℝ with conformal vector of central charge 24, nonnegatively graded with dim V_0 = 1, with a nondegenerate symmetric invariant bilinear form (·,·)_V, and a group G acting by automorphisms preserving ω and (·,·)_V. L := II_{1,1}; W := V ⊗ V_L with conformal vector of central charge 26, involution θ := id ⊗ θ_L, product form (·,·) (with (1,1)_{V_L} = −1) and contravariant form (x,y)_0 := −(x, θy); G acts trivially on V_L. For 0 ≠ r ∈ L fix w ∈ L with ⟨w,w⟩ = 0 and ⟨r,w⟩ ≠ 0, and put K_i := (1 ⊗ w(−1)1)_i = 1 ⊗ w(i). H := V ⊗ S(ĥ⁻) ⊗ e^r (the degree-r subspace), 𝒜 the Lie algebra spanned by all L_i, K_i, 𝒲 = span{L_i}, 𝒴 = span{K_i}, with ± and 0 parts by the sign of i. P := {v ∈ H : L_i v = 0 for i > 0}, T := {v ∈ H : L_i v = K_i v = 0 for i > 0}, N := rad((·,·)_0|_P), K := U(𝒴)T, S := 𝒲⁻U(𝒲⁻)U(𝒴⁻)T; a subscript 1 means the L_0-weight-one part. Claim: H = S ⊕ K, and the operators L_1 and L_2 + (3/2)L_1², which generate the associative algebra generated by all L_i with i > 0, map S_1 into S. This uses that the central charge of W is 26.

Hypotheses: Setting as stated; central charge of V ⊗ V_{II_{1,1}} equal to 26.

Proof outline: H = S ⊕ K from H = U(𝒲⁻)U(𝒴⁻)T (PBW) and K = U(𝒴⁻)T. Every s ∈ S_1 can be written s = L_{−1}f_1 + L_{−2}f_2 with L_0 f_1 = 0 and L_0 f_2 = −f_2, since every L_{−m} (m > 0) is a polynomial in L_{−1}, L_{−2}. Compute with the Virasoro relations of central charge c: L_1 s = L_{−1}(L_1f_1 + 3f_2) + L_{−2}L_1f_2 and (L_2 + (3/2)L_1²)s = L_{−1}(L_2 + (3/2)L_1²)f_1 + L_{−2}(L_2 + (3/2)L_1²)f_2 + 9L_{−1}L_1f_2 + (c/2 − 13)f_2. Since S = L_{−1}H + L_{−2}H, both lie in S exactly because c = 26 kills the last term. L_1 and L_2 + (3/2)L_1² generate the associative algebra generated by the L_i, i > 0 (L_2 is obtained, then L_{i+1} = [L_i, L_1]/(i−1) for i ≥ 2).

Depends on: `QM.6/no-ghost-transverse-space`, `QM.6/conformal-vector-virasoro-representation`, `QM.6/tensor-product-conformal-structure`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

#### No-ghost theorem, step 5: physical states are transverse plus null (`QM.6/no-ghost-physical-decomposition`, lemma)

Setting: V is a vertex operator algebra over ℝ with conformal vector of central charge 24, nonnegatively graded with dim V_0 = 1, with a nondegenerate symmetric invariant bilinear form (·,·)_V, and a group G acting by automorphisms preserving ω and (·,·)_V. L := II_{1,1}; W := V ⊗ V_L with conformal vector of central charge 26, involution θ := id ⊗ θ_L, product form (·,·) (with (1,1)_{V_L} = −1) and contravariant form (x,y)_0 := −(x, θy); G acts trivially on V_L. For 0 ≠ r ∈ L fix w ∈ L with ⟨w,w⟩ = 0 and ⟨r,w⟩ ≠ 0, and put K_i := (1 ⊗ w(−1)1)_i = 1 ⊗ w(i). H := V ⊗ S(ĥ⁻) ⊗ e^r (the degree-r subspace), 𝒜 the Lie algebra spanned by all L_i, K_i, 𝒲 = span{L_i}, 𝒴 = span{K_i}, with ± and 0 parts by the sign of i. P := {v ∈ H : L_i v = 0 for i > 0}, T := {v ∈ H : L_i v = K_i v = 0 for i > 0}, N := rad((·,·)_0|_P), K := U(𝒴)T, S := 𝒲⁻U(𝒲⁻)U(𝒴⁻)T; a subscript 1 means the L_0-weight-one part. Claim: P_1 = T_1 ⊕ N_1, where N_1 = rad((·,·)_0|_{P_1}) = S_1 ∩ P_1.

Hypotheses: Setting as stated.

Proof outline: Write p ∈ P_1 as p = k + s with k ∈ K_1, s ∈ S_1 (step 4). For a generator u ∈ {L_1, L_2 + (3/2)L_1²}: 0 = up = uk + us with uk ∈ K (K is stable under L_i, i > 0, being U(𝒴)T with [L_i, K_j] ∈ 𝒴) and us ∈ S (step 4); directness of H = S ⊕ K gives uk = us = 0. Hence k ∈ K ∩ P = T and s ∈ S ∩ P; S is orthogonal to P (adjoints: (L_{−m}f, p) = (f, L_m p) = 0), so s ∈ N_1; T_1 ∩ N_1 = 0 by step 3 (a).

Depends on: `QM.6/no-ghost-spurious-states`, `QM.6/no-ghost-transverse-space`.

#### The no-ghost theorem (Goddard–Thorn, Borcherds) (`QM.6/no-ghost-theorem`, theorem)

Let V be a vertex operator algebra over ℝ of central charge 24, nonnegatively graded with dim V_0 = 1, with a nondegenerate symmetric invariant bilinear form, and let G be a group acting on V by automorphisms preserving ω and the form. Let W := V ⊗ V_{II_{1,1}} with its conformal vector (central charge 26), involution θ = id ⊗ θ_{II_{1,1}}, product form and contravariant form (x,y)_0 = −(x,θy); let P^1_r ⊆ W be the physical space of weight 1 and degree r ∈ II_{1,1}, with G acting through V. Then the quotient of P^1_r by the radical of (·,·)_0 restricted to P^1_r is isomorphic, as a G-module with invariant bilinear form, to V_{1−⟨r,r⟩/2} if r ≠ 0, and to V_1 ⊕ ℝ² (G acting trivially on ℝ²) if r = 0. In particular, if (·,·)_V is positive definite then the induced contravariant form on P^1_r/rad is positive definite for r ≠ 0.

Hypotheses: V vertex operator algebra over ℝ, c = 24; V nonnegatively graded, dim V_0 = 1; nondegenerate symmetric invariant form on V; G acts by automorphisms preserving ω and the form.

Proof outline: r ≠ 0: combine step 3 (V_{1−⟨r,r⟩/2} ⊗ e^r ≅ T_1, weights: wt(v ⊗ e^r) = wt(v) + ⟨r,r⟩/2 = 1) with step 5 (P^1_r/N_1 ≅ T_1); all maps are G-equivariant and preserve the forms. Positivity: for x = u ⊗ e^r, (x, θx) = −(u,u)_V (lattice invariant-form lemma), so (x,x)_0 = (u,u)_V > 0 for u ≠ 0. r = 0: the weight-one degree-zero space of W is V_1 ⊗ 1 ⊕ V_0 ⊗ span{α(−1)1 : α ∈ ℝ²}; since dim V_0 = 1, L_1V_1 ⊆ V_0 = ℝ1 and (L_1v, 1) = (v, L_{−1}1) = 0 give L_1V_1 = 0, and L_n (n ≥ 2) kills it by weight; the form on this space is nondegenerate, so P^1_0/rad ≅ V_1 ⊕ ℝ².

Depends on: `QM.6/no-ghost-physical-decomposition`, `QM.6/no-ghost-transverse-space`, `QM.6/lattice-vertex-algebra-invariant-form`, `QM.6/vertex-operator-algebra`, `QM.6/physical-space`.

#### Borcherds' axioms for a moonshine module (`QM.6/moonshine-module-axioms`, definition)

A moonshine module (Borcherds' properties (1)–(2)) is a vertex operator algebra V over ℝ such that: (1) the central charge is 24 and V carries a positive definite symmetric bilinear form that is invariant in the Frenkel–Huang–Lepowsky sense (θ = id in node invariant-bilinear-form); (2) V is nonnegatively graded and q^{−1}·gradedDimension(V) = J, the Laurent series q^{−1} + Σ_{n≥1} c(n)qⁿ of j − 744 (node j-laurent-series); equivalently dim V_{n+1} = c(n) for all n ≥ −1, so V_0 = ℝ·1, V_1 = 0, dim V_2 = 196884. A moonshine module with symmetry group G is moreover a group homomorphism ρ : G →* Aut(V, ω, (·,·)) into the conformal automorphisms preserving the form (Borcherds' property (3) for G the Monster).

API:
- `IsMoonshineModule` (structure): The Prop-valued structure of properties (1)–(2) on a real vertex operator algebra with a bilinear form.
- `IsMoonshineModule.mckayThompsonSeries_one` (simp): mckayThompsonSeries V 1 = J.
- `IsMoonshineModule.finrank_weightSpace` (simp): finrank V_{n+1} = c(n) for n ≥ −1.
- `IsMoonshineModule.weightSpace_zero` (characterisation): V_0 = span{1}.
- `IsMoonshineModule.weightSpace_one` (simp): V_1 = ⊥.
- `IsMoonshineModule.formAut` (data): The group Aut(V, ω, (·,·)) of conformal automorphisms preserving the form.
- `IsMoonshineModule.noGhostHypotheses` (other): V satisfies the hypotheses of the no-ghost theorem for every subgroup of Aut(V, ω, (·,·)).

Unit tests:
- `IsMoonshineModule.finrank_weightSpace_two` (computation): finrank V_2 = 196884 and finrank V_3 = 21493760.
- `IsMoonshineModule.weightSpace_neg` (degenerate): V_n = ⊥ for n < 0.
- `IsMoonshineModule.not_heisenberg24` (non-example): The rank-24 Heisenberg vertex operator algebra (central charge 24, positive definite form) is not a moonshine module: its graded dimension has coefficient 24 at q^1, so V_1 ≠ 0.
- `IsMoonshineModule.mckayThompsonSeries_one_coeff` (characterisation): The coefficients of T_1 at q^{−1}, q^0, q^1, q^2, q^3 are 1, 0, 196884, 21493760, 864299970.

Depends on: `QM.6/vertex-operator-algebra`, `QM.6/invariant-bilinear-form`, `QM.6/mckay-thompson-series`, `QM.6/j-laurent-series`, `QM.6/vertex-algebra-automorphism`.

#### The Monster Lie algebra m(V) (`QM.6/monster-lie-algebra`, construction)

Let V be a moonshine module (node moonshine-module-axioms) and G ≤ Aut(V, ω, (·,·)). Let W := V ⊗ V_{II_{1,1}} with conformal vector of central charge 26, involution θ = id ⊗ θ_{II_{1,1}} and product form (normalized (1,1)_{V_{II_{1,1}}} = −1). The Monster Lie algebra is m(V) := g(W), the physical Lie algebra of W (P^1 modulo the radical of the form). It satisfies: (1) m = ⊕_{r∈II_{1,1}} m_r is II_{1,1}-graded; (2) θ maps m_r onto m_{−r} and the contravariant form (x,y)_0 = −(x,θy) is positive definite on m_r for r ≠ 0; (3) G acts on m by graded Lie algebra automorphisms, and m_{(a,b)} ≅ V_{ab+1} as G-modules for (a,b) ≠ (0,0) (so dim m_{(a,b)} = c(ab)), while m_{(0,0)} = span{1 ⊗ α(−1)1 : α ∈ ℝ²} ≅ ℝ² with trivial G-action; (4) m_{(0,0)} is abelian and 1 ⊗ α(−1)1 acts on m_r by the scalar ⟨α, r⟩.

API:
- `monsterLieAlgebra` (structure): m(V) with its LieRing and LieAlgebra ℝ instances.
- `monsterLieAlgebra.rootSpace` (data): m_r for r ∈ II_{1,1}; ⁅m_r, m_s⁆ ⊆ m_{r+s}.
- `monsterLieAlgebra.isInternal_rootSpace` (structure): m = ⊕_r m_r (DirectSum.IsInternal).
- `monsterLieAlgebra.rootSpaceEquiv` (equivalence): For (a,b) ≠ 0, a G-equivariant linear equivalence m_{(a,b)} ≃ V_{ab+1}.
- `monsterLieAlgebra.finrank_rootSpace` (simp): finrank m_{(a,b)} = c(ab) for (a,b) ≠ 0 and = 2 for (a,b) = 0.
- `monsterLieAlgebra.contravariantForm_pos` (other): (x,x)_0 > 0 for 0 ≠ x ∈ m_r, r ≠ 0.
- `monsterLieAlgebra.cartan_act` (simp): ⁅1 ⊗ α(−1)1, x⁆ = ⟨α, r⟩ • x for x ∈ m_r.
- `monsterLieAlgebra.action` (functoriality): G →* (m ≃ₗ⁅ℝ⁆ m), preserving grading and forms.

Unit tests:
- `monsterLieAlgebra.finrank_one_one` (computation): finrank m_{(1,1)} = 196884 and finrank m_{(1,−1)} = 1.
- `monsterLieAlgebra.rootSpace_eq_bot` (degenerate): m_{(a,b)} = 0 when ab < −1 and m_{(1,0)} = m_{(0,1)} = 0.
- `monsterLieAlgebra.physical_not_quotient` (non-example): P^1_{(1,0)} ≠ 0 in W (it contains D(1 ⊗ e^{(1,0)}), e^{(1,0)} being a weight-zero primary) although m_{(1,0)} = 0: the radical must be divided out.
- `monsterLieAlgebra.gl2` (characterisation): m_{(−1,1)} ⊕ m_{(0,0)} ⊕ m_{(1,−1)} is a Lie subalgebra isomorphic to gl₂(ℝ).

Depends on: `QM.6/moonshine-module-axioms`, `QM.6/physical-lie-algebra`, `QM.6/no-ghost-theorem`, `QM.6/lattice-vertex-algebra`, `QM.6/lattice-vertex-algebra-invariant-form`, `QM.6/lorentzian-lattice-II11`, `QM.6/vertex-algebra-tensor-product`, `QM.6/tensor-product-conformal-structure`.

#### Borcherds (generalized Kac–Moody) algebra of a matrix (`QM.6/borcherds-algebra`, definition)

Let I be a countable set and A = (a_ij)_{i,j∈I} a real matrix with (C1) A symmetric, (C2) a_ij ≤ 0 for i ≠ j, (C3) 2a_ij/a_ii ∈ ℤ whenever a_ii > 0. The Borcherds algebra g(A) is the real Lie algebra generated by h_i, e_i, f_i (i ∈ I) with relations [h_i,h_j] = 0, [h_i,e_k] = a_ik e_k, [h_i,f_k] = −a_ik f_k, [e_i,f_j] = δ_ij h_i, (ad e_i)^{1−2a_ij/a_ii} e_j = 0 = (ad f_i)^{1−2a_ij/a_ii} f_j for i ≠ j with a_ii > 0, and [e_i,e_j] = [f_i,f_j] = 0 whenever a_ij = 0. It is graded by the root lattice Q := ⊕_{i∈I} ℤα_i ((α_i,α_j) := a_ij; deg e_i = α_i, deg f_i = −α_i, deg h_i = 0). A simple root α_i is real if a_ii > 0 and imaginary otherwise. The Chevalley involution η acts as −1 on span{h_i} and maps e_i ↦ −f_i, f_i ↦ −e_i. When A is a symmetrized generalized Cartan matrix, g(A) is the (derived) Kac–Moody algebra.

API:
- `BorcherdsAlgebra` (structure): g(A) with LieRing and LieAlgebra ℝ instances.
- `BorcherdsAlgebra.e` (constructor): The generators e_i.
- `BorcherdsAlgebra.f` (constructor): The generators f_i.
- `BorcherdsAlgebra.h` (constructor): The generators h_i.
- `BorcherdsAlgebra.lie_e_f` (simp): ⁅e i, f j⁆ = if i = j then h i else 0.
- `BorcherdsAlgebra.rootGrading` (structure): The Q-grading, as a family of submodules with DirectSum.IsInternal.
- `BorcherdsAlgebra.chevalleyInvolution` (data): The involution η.
- `BorcherdsAlgebra.equivToLieAlgebra` (compatibility): For a symmetric generalized Cartan matrix, g(A) ≃ Matrix.ToLieAlgebra of the matrix.

Unit tests:
- `BorcherdsAlgebra.sl2` (computation): For A = (2), g(A) ≃ₗ⁅ℝ⁆ sl₂(ℝ) with e ↦ E₁₂, f ↦ E₂₁, h ↦ diag(1,−1).
- `BorcherdsAlgebra.heisenberg` (computation): For A = (0), g(A) is three-dimensional with h central.
- `BorcherdsAlgebra.empty` (degenerate): For I = ∅, g(A) = 0.
- `BorcherdsAlgebra.no_serre_imaginary` (non-example): For A = [[−1,−1],[−1,−1]], (ad e_1)^n e_2 ≠ 0 for every n: imaginary simple roots obey no Serre relations.

Depends on: `mathlib:FreeLieAlgebra`, `mathlib:LieIdeal`, `mathlib:Matrix.ToLieAlgebra`.

#### Triangular and root space decomposition of a Borcherds algebra (`QM.6/borcherds-algebra-triangular-decomposition`, lemma)

For A satisfying (C1)–(C3): g(A) = n⁻ ⊕ h ⊕ n⁺ as vector spaces, where h = span{h_i} is abelian with basis {h_i}_{i∈I}, n⁺ (resp. n⁻) is the subalgebra generated by the e_i (resp. f_i) and is the quotient of the free Lie algebra on {e_i} (resp. {f_i}) by the ideal generated by the relations of degree > 0 (resp. < 0). Every root space g_α (α ∈ Q∖{0}) is finite-dimensional and nonzero only for α ∈ Q_+ ∪ (−Q_+) (Q_+ = ⊕ℕα_i); g_{α_i} = ℝe_i. There is a unique symmetric invariant bilinear form with (e_i, f_j) = δ_ij, (h_i,h_j) = a_ij; it pairs g_α with g_{−α} nondegenerately for α ≠ 0.

Hypotheses: A satisfies (C1)–(C3).

Proof outline: For the algebra g_0 (relations without the Serre-type ones) construct the module X (free associative algebra on symbols x_i) of Jurisich 1998 Proposition 3.1 to prove g_0 = n_0⁻ ⊕ h ⊕ n_0⁺ with n_0^± free and {h_i} independent. The Serre-type relations generate an ideal k_0 = k_0⁺ ⊕ k_0⁻ contained in n_0^+ ⊕ n_0^− (Jurisich 1998 Propositions 3.2–3.3), so the decomposition descends to g(A). Finite-dimensionality: g_α ⊆ image of the degree-α part of the free Lie algebra, finite-dimensional for α ∈ Q_+. The invariant form: construct inductively on height as for Kac–Moody algebras (Jurisich 1998 §2.1); nondegenerate pairing of g_α and g_{−α} for α ≠ 0 after quotienting by the radical, which is zero for the matrices of Jurisich 1998 Corollary 5.3.

Depends on: `QM.6/borcherds-algebra`, `mathlib:FreeLieAlgebra`.

#### The canonical central extension ĝ(A) (`QM.6/borcherds-algebra-central-extension`, construction)

For A satisfying (C1)–(C3), ĝ(A) is the real Lie algebra with generators e_i, f_i, h_ij (i, j ∈ I) and relations [h_ij, h_kl] = 0, [h_ij, e_k] = δ_ij a_ik e_k, [h_ij, f_k] = −δ_ij a_ik f_k, [e_i, f_j] = h_ij, (ad e_i)^{1−2a_ij/a_ii}e_j = 0 = (ad f_i)^{1−2a_ij/a_ii}f_j (i ≠ j, a_ii > 0), [e_i,e_j] = [f_i,f_j] = 0 when a_ij = 0 (Borcherds' universal generalized Kac–Moody algebra). Then h_ij = 0 unless the i-th and j-th columns of A are equal; the h_ij with equal columns form a basis of an abelian subalgebra ĥ; ĝ = n⁻ ⊕ ĥ ⊕ n⁺ with n^± as in g(A); c := span{h_ij : i ≠ j} is central, and ĝ(A)/c ≅ g(A).

API:
- `BorcherdsAlgebra.Universal` (structure): ĝ(A) with its Lie algebra structure.
- `BorcherdsAlgebra.Universal.hh` (constructor): The generators h_ij.
- `BorcherdsAlgebra.Universal.hh_eq_zero` (simp): h_ij = 0 unless the i-th and j-th columns of A are equal.
- `BorcherdsAlgebra.Universal.center` (data): c = span{h_ij : i ≠ j}, a central ideal.
- `BorcherdsAlgebra.Universal.quotientEquiv` (equivalence): ĝ(A) ⧸ c ≃ₗ⁅ℝ⁆ g(A).
- `BorcherdsAlgebra.Universal.invariantForm` (data): The invariant form (x,y)_ĝ := (x̄,ȳ) pulled back from g(A), with c in its radical.

Unit tests:
- `BorcherdsAlgebra.Universal.kacMoody` (degenerate): If all a_ii > 0 then c = 0 and ĝ(A) ≃ g(A).
- `BorcherdsAlgebra.Universal.hh_ne_zero` (computation): For A = [[−2,−2],[−2,−2]], h_12 ≠ 0 in ĝ(A) and h_12 is central.
- `BorcherdsAlgebra.Universal.center_ne_c` (non-example): c need not be the whole centre: for A = (0), ĝ(A) = g(A) is the Heisenberg algebra, whose centre ℝh_11 is nonzero while c = 0.
- `BorcherdsAlgebra.Universal.quotient_mk_hh` (compatibility): The quotient map sends h_ii to h_i and h_ij (i ≠ j) to 0.

Depends on: `QM.6/borcherds-algebra`, `QM.6/borcherds-algebra-triangular-decomposition`, `mathlib:FreeLieAlgebra`, `mathlib:LieIdeal`.

#### Borcherds' characterisation of generalized Kac–Moody algebras (`QM.6/borcherds-characterisation-theorem`, theorem)

Let g be a real Lie algebra such that: (1) g = ⊕_{i∈ℤ} g_i is ℤ-graded with g_i finite-dimensional for i ≠ 0, and g is diagonalizable with respect to g_0; (2) g has an involution ω with ω(g_i) = g_{−i} acting as −1 on the noncentral elements of g_0 (so g_0 is abelian); (3) g has an ω-invariant symmetric invariant bilinear form (·,·) with (g_i, g_j) = 0 unless i + j = 0, such that (x,y)_0 := −(x, ω(y)) is positive definite on g_m for every m ≠ 0; (4) g_0 ⊆ [g,g]. Then there is a matrix A satisfying (C1)–(C3) and a surjective Lie algebra homomorphism π : ĝ(A) → g whose kernel is central. If moreover (·,·) is nondegenerate, then g ≅ l/c for a Borcherds algebra l = g(A) with c the centre of l. The generators e_i can be chosen as g_0-weight vectors forming orthonormal bases (for (·,·)_0) of the orthogonal complements e_m of the subalgebra generated by ⊕_{0<n<m} g_n in g_m, with f_i = −ω(e_i).

Hypotheses: g real Lie algebra with (1)–(4).

Proof outline: For m > 0 let l_m be the subalgebra generated by the g_n, 0 < n < m, and e_m := (l_m ∩ g_m)^⊥ in g_m for (·,·)_0; e_m is g_0-stable and has an orthonormal basis of g_0-weight vectors; their union {e_i} generates ⊕_{n>0} g_n; put f_i := −ω(e_i), h_ij := [e_i, f_j]. h_ij ∈ g_0 and h_ij = 0 unless deg e_i = deg e_j (contravariance and positivity); by (4) g_0 is spanned by the h_ij. The radical of (·,·) is central; for i ≠ j, h_ij lies in the radical. [h, e_i] = (h, h_ii)e_i, and (x,y)_0-positivity gives a_ij := (h_ii,h_jj) ≤ 0 for i ≠ j, with [e_i, e_j] = 0 iff a_ij = 0 (Jurisich 1998 equation (10)); for a_ii > 0 the sl₂-representation theory gives 2a_ij/a_ii ∈ ℤ and the Serre relations (using Jurisich 1998 Proposition 3.2 and positivity). Hence the generators satisfy the relations of ĝ(A) and π exists; the form pulls back and nondegeneracy on ĝ_n ⊕ ĝ_{−n} shows the kernel lies in ĥ and is central. If the form is nondegenerate then all h_ij (i ≠ j) vanish and Jurisich 1998 Corollary 4.1 gives g ≅ l/c.

Depends on: `QM.6/borcherds-algebra-central-extension`, `QM.6/borcherds-algebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.

#### Lazard elimination for free Lie algebras (`QM.6/lazard-elimination`, lemma)

Let X be a set, S ⊆ X, and L(X) the free Lie algebra on X over a field (Mathlib FreeLieAlgebra). Then (a) L(X) = L(S) ⊕ 𝔞 as vector spaces, where L(S) is the subalgebra generated by S and 𝔞 is the ideal generated by X ∖ S; (b) 𝔞 is a free Lie algebra: the map (s_1, …, s_n, x) ↦ (ad s_1 ⋯ ad s_n)(x), for n ≥ 0, s_i ∈ S, x ∈ X ∖ S, extends to an isomorphism L(T) ≅ 𝔞 from the free Lie algebra on the set T of such sequences. All statements are compatible with gradings in which X is homogeneous.

Hypotheses: X a set, S ⊆ X.

Proof outline: Define the Lie algebra map L(X) → L(S) killing X ∖ S (a retraction onto L(S)); its kernel is 𝔞, giving (a). Construct L(S) ⋉ L(T) with L(S) acting on L(T) by derivations extending s · (s_1,…,s_n,x) = (s, s_1, …, s_n, x); the universal property of L(X) gives a map L(X) → L(S) ⋉ L(T), inverse to the map induced by (ad s_1⋯ad s_n)(x); restrict to 𝔞 (Bourbaki, Lie Groups and Lie Algebras II §2.9).

Depends on: `mathlib:FreeLieAlgebra`, `mathlib:LieIdeal`.

#### Traces on exterior, symmetric and tensor powers (Adams operations) (`QM.6/graded-trace-exterior-symmetric-power`, lemma)

Let k be a field of characteristic 0. (a) For a finite-dimensional k-vector space U and g ∈ End(U), in k[[t]]: Σ_{n≥0} (−1)ⁿ tr(g|Λⁿ U) tⁿ = det(1 − tg) = exp(−Σ_{m≥1} tr(g^m) t^m/m), Σ_{n≥0} tr(g|Sⁿ U) tⁿ = det(1 − tg)^{−1} = exp(Σ_{m≥1} tr(g^m) t^m/m), and Σ_{n≥0} tr(g|U^{⊗n}) tⁿ = (1 − tr(g) t)^{−1}. (b) Let Γ be a finitely generated free abelian group with a homomorphism deg : Γ → ℤ, U = ⊕_{γ∈Γ} U_γ with U_γ finite-dimensional and U_γ = 0 unless deg γ > 0, finitely many γ of each degree, and g a graded endomorphism. In the completed group ring k[[Γ_{>0}]] (series Σ a_γ e^γ over deg γ > 0 ∪ {0}), with ch_g(U) := Σ_γ tr(g|U_γ)e^γ and the Adams operation ψ^m(Σ a_γ e^γ)[g] := Σ tr(g^m|U_γ) e^{mγ}: ch_g Λ_{−1}(U) := Σ_n (−1)ⁿ ch_g(Λⁿ U) = exp(−Σ_{m≥1} ψ^m ch_g(U)/m), ch_g S(U) = exp(Σ_m ψ^m ch_g(U)/m), ch_g T(U) = (1 − ch_g U)^{−1}.

Hypotheses: k field of characteristic 0; U finite-dimensional, or graded with finite-dimensional pieces of positive degree.

Proof outline: (a) Extend scalars to an algebraic closure and triangularize g with eigenvalues λ_1, …, λ_d: tr(g|Λⁿ) = e_n(λ), tr(g|Sⁿ) = h_n(λ), and Π(1 − λ_i t) = exp(Σ_i log(1 − λ_i t)) = exp(−Σ_m p_m(λ)t^m/m) with p_m(λ) = tr(g^m); the tensor power statement is tr(g^{⊗n}) = tr(g)ⁿ. (b) Truncate to degrees ≤ N: finitely many U_γ contribute; Λ(⊕U_γ) = ⊗Λ(U_γ) as graded g-modules, so characters multiply; apply (a) to each U_γ with t replaced by e^γ (the splitting principle of Borcherds 1992 §8). Traces on Λⁿ, Sⁿ use Mathlib's exteriorPower.map, SymmetricAlgebra and LinearMap.trace; exp and log of series in the maximal ideal via PowerSeries.exp and PowerSeries.subst.

Depends on: `mathlib:ExteriorAlgebra.exteriorPower`, `mathlib:exteriorPower.map`, `mathlib:SymmetricAlgebra`, `mathlib:TensorAlgebra`, `mathlib:LinearMap.trace`, `mathlib:LinearMap.det`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.subst`.

#### Character formula for graded free Lie algebras (Witt's formula) (`QM.6/free-lie-algebra-character-formula`, theorem)

Let k be a field of characteristic 0, Γ, deg as in node graded-trace-exterior-symmetric-power, W = ⊕_γ W_γ a Γ-graded vector space with W_γ finite-dimensional, zero unless deg γ > 0, finitely many γ of each degree, and g a graded linear automorphism of W. Let L(W) be the free Lie algebra on W (graded, with g acting by the induced Lie algebra automorphism). Then each L(W)_γ is finite-dimensional and, in k[[Γ_{>0}]], exp(−Σ_{m≥1} ψ^m ch_g(L(W))/m) = 1 − ch_g(W); for g = 1: Π_{γ} (1 − e^γ)^{dim L(W)_γ} = 1 − Σ_γ dim(W_γ) e^γ, and by Möbius inversion dim L(W)_β = Σ_{mγ=β} (μ(m)/m) Σ_{a∈P(γ)} ((|a|−1)!/a!) Π_α (dim W_α)^{a_α}, where P(γ) is the set of multi-indices a = (a_α) with Σ a_α α = γ.

Hypotheses: k field of characteristic 0; W graded as stated, g graded automorphism.

Proof outline: U(L(W)) ≅ T(W) as graded algebras with g-action: Mathlib's FreeLieAlgebra.universalEnvelopingEquivFreeAlgebra and FreeAlgebra ≅ TensorAlgebra on a basis (the equivalences are natural, hence g-equivariant). PBW: the associated graded of U(L) for the PBW filtration is Sym(L), naturally in Lie algebra automorphisms; since traces of a filtered endomorphism on a finite-dimensional space equal those on the associated graded, ch_g U(L(W)) = ch_g Sym(L(W)) (request to LieHighestWeight Layer 3). By the trace lemma, ch_g Sym(L) = exp(Σ_m ψ^m ch_g(L)/m) and ch_g T(W) = (1 − ch_g W)^{−1}; equate and invert. g = 1 case and Möbius inversion: take logarithms, compare coefficients of e^β and invert the divisor sum (Jurisich 1998 Propositions 5.1–5.2).

Depends on: `QM.6/graded-trace-exterior-symmetric-power`, `mathlib:FreeLieAlgebra`, `mathlib:FreeLieAlgebra.universalEnvelopingEquivFreeAlgebra`, `mathlib:UniversalEnvelopingAlgebra`, `mathlib:TensorAlgebra`, `mathlib:ArithmeticFunction.moebius`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

#### Free subalgebras of Borcherds algebras (Jurisich) (`QM.6/borcherds-algebra-free-subalgebra`, theorem)

Let A satisfy (C1)–(C3), J := {i ∈ I : a_ii > 0} (real simple roots) and g_J the Kac–Moody subalgebra generated by e_i, f_i (i ∈ J), g_J = n_J⁺ ⊕ h_J ⊕ n_J⁻. Assume that a_ij < 0 for all distinct i, j ∈ I ∖ J (no two imaginary simple roots are orthogonal). Then g(A) = u⁺ ⊕ (g_J + h) ⊕ u⁻, where u⁻ is the free Lie algebra on ⊕_{j∈I∖J} U(n_J⁻)·f_j and u⁺ the free Lie algebra on ⊕_{j∈I∖J} U(n_J⁺)·e_j; each U(n_J⁻)·f_j is an integrable highest-weight g_J-module and each U(n_J⁺)·e_j an integrable lowest-weight g_J-module (quotients of U(n_J^±)e_j by the Serre relations (ad e_i)^{1−2a_ij/a_ii}e_j, i ∈ J). u^± are g_J-stable ideals of n^±.

Hypotheses: A satisfies (C1)–(C3); a_ij < 0 for i ≠ j in I ∖ J.

Proof outline: n⁺ = L({e_i}_{i∈I})/k_0⁺ with k_0⁺ generated by the Serre elements with i ∈ J (no relations of type [e_i,e_j] = 0 occur among imaginary indices by hypothesis). Eliminate S = {e_i}_{i∈J} (Lazard): L({e_i}) = L({e_i}_{i∈J}) ⋉ L(W), W = ⊕_{j∉J} U(l)e_j with l = L({e_i}_{i∈J}). Split W = ⊕_j (U(l)e_j/R_j ⊕ R_j) with R_j generated by the Serre elements, and eliminate again twice (the ideals b, c generated by R_j and K e_j lie in k_0⁺). Conclude n⁺ = n_J⁺ ⋉ L(⊕_j U(n_J⁺)·e_j) and similarly for n⁻ (apply η).

Depends on: `QM.6/lazard-elimination`, `QM.6/borcherds-algebra-triangular-decomposition`, `QM.6/borcherds-algebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.

#### The Monster Lie algebra is a Borcherds algebra (`QM.6/monster-lie-algebra-is-borcherds-algebra`, theorem)

Let V be a moonshine module and m = m(V). Grade m by i := 2a + b on m_{(a,b)} and let θ be the induced involution. Then m satisfies hypotheses (1)–(4) of Borcherds' characterisation with nondegenerate form, hence m ≅ g(A)/c for a matrix A satisfying (C1)–(C3), c the centre of g(A); under this isomorphism m_{(0,0)} is the image of the Cartan subalgebra, the II_{1,1}-grading of m is the root grading, and the simple roots have degrees (a,b) with 2a + b > 0.

Hypotheses: V moonshine module.

Proof outline: (1): m_{(a,b)} ≠ 0 forces ab ≥ −1, so for i ≠ 0 only finitely many (a,b) with 2a + b = i contribute, each finite-dimensional; i = 0 forces (a,b) = (0,0). m is diagonalizable for m_{(0,0)} by the scalar action ⟨α, r⟩ (Monster Lie algebra API (4)), which separates degrees. (2),(3): θ maps m_r to m_{−r}, is −1 on m_{(0,0)}, preserves the form; the contravariant form is positive definite off degree 0 (Monster Lie algebra API). (4): the brackets [u ⊗ e^{(1,1)}, v ⊗ e^{−(1,1)}] = (u_3 v) ⊗ (1,1)(−1)1 (u, v ∈ V_2 with u_3v = c1, c ≠ 0) and [e^{(1,−1)}, e^{−(1,−1)}] = (1,−1)(−1)1 are linearly independent in the two-dimensional m_{(0,0)} (Jurisich 1998 (25)–(26)). The radical of the form on m is zero by construction; apply the nondegenerate case of the characterisation theorem.

Depends on: `QM.6/monster-lie-algebra`, `QM.6/borcherds-characterisation-theorem`, `QM.6/lattice-vertex-algebra`.

#### Simple roots and denominator formula of the Monster Lie algebra (`QM.6/monster-lie-algebra-simple-roots`, theorem)

Let V be a moonshine module. The Monster Lie algebra m = m(V) is isomorphic to g(M)/c, where M is Jurisich's matrix indexed by pairs (j,k) with j ∈ {−1} ∪ ℤ_{≥1}, 1 ≤ k ≤ c(j), with entries −(j + j') (so the simple roots are (1,−1), real of norm 2, and (1,n) for n ≥ 1, imaginary of norm −2n, each with multiplicity c(n)); the isomorphism matches root spaces with II_{1,1}-graded pieces. Its denominator formula is p·(J(p) − J(q)) = Π_{m≥1, n≥−1} (1 − p^m q^n)^{c(mn)}, where p, q stand for e^{(1,0)}, e^{(0,1)} and J = Σ c(n)qⁿ.

Hypotheses: V moonshine module.

Proof outline: By the previous theorem m ≅ g(A)/c with simple roots in degrees of positive 2a + b. Real roots have norm −2ab > 0 and m_{(a,b)} ≠ 0 needs ab ≥ −1, so the only positive real root is (1,−1), which is simple; imaginary simple roots have degrees (a,b) with a, b ≥ 1 (m_{(a,0)} ≅ V_1 = 0), and two of them have inner product −(ab' + a'b) < 0. Hence the free-subalgebra theorem applies with g_J = sl₂: u⁺ = L(W) with W = ⊕_j U(n_J⁺)e_j, the sl₂-string of a simple root (a,b) (b ≥ a, since ⟨(1,−1),(a,b)⟩ = a − b ≤ 0) consisting of the degrees (a+k, b−k), 0 ≤ k ≤ b − a. Free Lie character formula for u⁺ = ⊕_{a,b≥1} m_{(a,b)} with dim m_{(a,b)} = c(ab) (no-ghost): 1 − ch W = Π_{a,b≥1}(1 − p^a q^b)^{c(ab)}. The j product formula p(J(p) − J(q)) = (1 − pq^{−1})·Π_{a,b≥1}(1 − p^aq^b)^{c(ab)} (the only factor with n = −1 is 1 − pq^{−1}, and the factors with n = 0 have exponent c(0) = 0) together with the telescoping identity p(J(p) − J(q)) = (1 − pq^{−1})(1 − Σ_{a,b≥1} c(a+b−1)p^aq^b) gives ch W = Σ_{a,b≥1} c(a+b−1)p^aq^b. Induction on a: the coefficient at (1,n) comes only from strings starting at (1,n), so the multiplicity of the simple root (1,n) is c(n); the string from (1, a+b−1) already accounts for (a,b), so there are no simple roots with a ≥ 2. The denominator formula is the j product formula with (1 − p/q) = the factor of the real simple root.

Depends on: `QM.6/monster-lie-algebra-is-borcherds-algebra`, `QM.6/borcherds-algebra-free-subalgebra`, `QM.6/free-lie-algebra-character-formula`, `QM.6/j-product-formula`, `QM.6/monster-lie-algebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.

#### m = u⁺ ⊕ gl₂ ⊕ u⁻ with u⁻ free, equivariantly (`QM.6/monster-lie-algebra-free-decomposition`, theorem)

Let V be a moonshine module, G ≤ Aut(V, ω, (·,·)) and m = m(V). Then m = u⁺ ⊕ gl₂ ⊕ u⁻ where gl₂ = m_{(−1,1)} ⊕ m_{(0,0)} ⊕ m_{(1,−1)} and u⁻ = ⊕_{a,b≥1} m_{(−a,−b)}, u⁺ = ⊕_{a,b≥1} m_{(a,b)} are free Lie algebras. Let W ⊆ u⁻ be the orthogonal complement of [u⁻,u⁻] for the contravariant form, degree by degree. Then W is G-stable, the inclusion induces a G-equivariant Lie algebra isomorphism L(W) ≅ u⁻ (G acting on L(W) through W), W is stable under gl₂, and for all a, b ≥ 1 there is a G-equivariant linear isomorphism W_{−(a,b)} ≅ V_{a+b} (VOA weight a + b), while W_{−(a,b)} = 0 unless a, b ≥ 1.

Hypotheses: V moonshine module; G ≤ Aut(V, ω, (·,·)).

Proof outline: By the simple-roots theorem and the free-subalgebra theorem (via m ≅ g(M)/c, an isomorphism on n^±) u⁻ is free on ⊕_j U(n_J⁻)f_j, and gl₂ = sl₂ + m_{(0,0)} normalizes u⁻. A positively graded Lie algebra that is free on some graded subspace is free on every graded complement W of its derived algebra: W generates (induction on degree) and L(W) → u⁻ is injective by comparing graded dimensions through the free Lie character formula (g = 1). The contravariant form is positive definite and G-invariant on each finite-dimensional m_r, r ≠ 0, and [u⁻,u⁻] is G-stable, so the orthogonal complement W is G-stable; hence L(W) ≅ u⁻ is G-equivariant. W ≅ u⁻/[u⁻,u⁻] as G × gl₂-modules. For n ≥ 1, W_{−(1,n)} = u⁻_{−(1,n)} = m_{−(1,n)} ≅ V_{n+1} (no bracket of two elements of u⁻ has first coordinate −1). By the free Lie character formula and the j product formula (as in the simple-roots proof) dim W_{−(a,b)} = c(a+b−1) for a,b ≥ 1. As an sl₂-module (raising operator f_{(−1,1)} of degree (−1,1)), W is finite-dimensional in each string {−(a,b) : a + b = s} with constant multiplicity c(s−1) from weight a − b = −(s−2) to s−2, so it is c(s−1) copies of the s−1-dimensional irreducible, and the powers of the lowering operator give isomorphisms W_{−(1,s−1)} ≅ W_{−(a,s−a)} (sl₂ theory, request to LieHighestWeight Layer 0). These isomorphisms commute with G because G fixes the one-dimensional spaces m_{±(1,−1)} ≅ V_0 = ℝ1 pointwise.

Depends on: `QM.6/monster-lie-algebra-simple-roots`, `QM.6/borcherds-algebra-free-subalgebra`, `QM.6/free-lie-algebra-character-formula`, `QM.6/j-product-formula`, `QM.6/monster-lie-algebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.

### QM.6c The product formula for j and replication

The Laurent series J, Laurent q-expansions, level-one modular functions holomorphic on ℍ and the theorem M^!_0 = ℂ[j], formal and analytic weight-zero Hecke operators, and Borcherds' proof of the product formula p^{−1}Π(1 − pᵐqⁿ)^{c(mn)} = J(p) − J(q) (Lemma 7.1). With the Monster Lie algebra this gives the twisted denominator identity, replication families, Borcherds' recursions (9.1) and the complete replicability of every McKay–Thompson series of a moonshine module.

#### The Laurent series J = j − 744 (`QM.6/j-laurent-series`, definition)

Let E₄(q) := 1 + 240 Σ_{n≥1} σ₃(n)qⁿ ∈ ℤ[[q]] and (q;q)_∞ := Π_{n≥1}(1 − qⁿ) ∈ ℤ[[q]] (the infinite q-Pochhammer symbol of QM.0; a unit since its constant term is 1). Define j(q) := q^{−1}·E₄(q)³·(q;q)_∞^{−24} ∈ ℤ((q)) and J := j(q) − 744 = Σ_{n≥−1} c(n)qⁿ. Then c(−1) = 1, c(0) = 0, c(1) = 196884, c(2) = 21493760, c(3) = 864299970, c(4) = 20245856256, c(5) = 333202640600, and c(n) ∈ ℤ for all n. Compatibility: for the analytic normalized j = E₄³/Δ of the ModularForms roadmap, j(τ) = Σ_{n≥−1} c_j(n) e^{2πinτ} for all τ ∈ ℍ with c_j the coefficients of j(q).

API:
- `jLaurentSeries` (data): j(q) ∈ LaurentSeries ℤ.
- `JLaurentSeries` (data): J := j(q) − 744.
- `JLaurentSeries.coeff_neg_one` (simp): coeff (−1) J = 1.
- `JLaurentSeries.coeff_zero` (simp): coeff 0 J = 0.
- `JLaurentSeries.coeff_eq_zero_of_lt` (simp): coeff n J = 0 for n < −1.
- `jLaurentSeries_mul_discriminant` (characterisation): j(q) · (q · (q;q)_∞^{24}) = E₄(q)³.
- `jLaurentSeries_hasLaurentQExpansion` (compatibility): The analytic j of ModularForms Layer 0 has Laurent q-expansion j(q) (cast to ℂ).

Unit tests:
- `JLaurentSeries.coeff_one` (computation): coeff 1 J = 196884, coeff 2 J = 21493760, coeff 3 J = 864299970.
- `JLaurentSeries.coeff_four` (computation): coeff 4 J = 20245856256 and coeff 5 J = 333202640600.
- `JLaurentSeries.order` (degenerate): The order of J is −1 (J ≠ 0 and coeff n J = 0 for n < −1).
- `JLaurentSeries.ne_inv_discriminant` (non-example): J ≠ q^{−1}(q;q)_∞^{−24} (= 1/Δ): the latter has coefficient 24 at q^0.

Depends on: `QM.0/q-pochhammer`, `mathlib:ArithmeticFunction.sigma`, `mathlib:PowerSeries`, `mathlib:LaurentSeries`, `mathlib:HahnSeries.single`, `mathlib:ModularForm.E₄`, `mathlib:ModularForm.discriminant`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

#### Laurent q-expansions of periodic holomorphic functions on ℍ (`QM.6/laurent-q-expansion`, definition)

For f : ℍ → ℂ and F ∈ ℂ((q)) (a Laurent series, finitely many negative powers), f has Laurent q-expansion F if for every τ ∈ ℍ the series Σ_{n∈ℤ} F_n e^{2πinτ} converges absolutely with sum f(τ). If f is holomorphic, f(τ + 1) = f(τ), and (τ ↦ e^{2πiNτ}f(τ)) is bounded as Im τ → ∞ for some N ∈ ℕ, then f has a unique Laurent q-expansion (the expansion of QM.3/weakly-holomorphic-laurent-expansion at width h = 1, packaged as an element of ℂ((q))), namely laurentQExpansion f := q^{−N}·qExpansion(1, e^{2πiN·}f) (Mathlib's q-expansion of a bounded periodic holomorphic function), independent of N, with coefficients F_n = 0 for n < −N. The map f ↦ laurentQExpansion f is an injective ring homomorphism on such functions.

API:
- `HasLaurentQExpansion` (other): ∀ τ, HasSum (n ↦ F_n · qParam 1 τ ^ n) (f τ) (absolutely).
- `laurentQExpansion` (data): The Laurent q-expansion of f (defined via qExpansion of q^N f).
- `hasLaurentQExpansion_laurentQExpansion` (characterisation): Under the hypotheses, f has Laurent q-expansion laurentQExpansion f.
- `HasLaurentQExpansion.unique` (extensionality): Two Laurent q-expansions of the same f are equal.
- `laurentQExpansion_mul` (simp): laurentQExpansion (f * g) = laurentQExpansion f * laurentQExpansion g.
- `laurentQExpansion_ofBounded` (compatibility): For bounded f: laurentQExpansion f = HahnSeries.ofPowerSeries ℤ ℂ (UpperHalfPlane.qExpansion 1 f).

Unit tests:
- `laurentQExpansion_qParam_inv` (computation): laurentQExpansion (τ ↦ e^{−2πiτ}) = HahnSeries.single (−1) 1.
- `laurentQExpansion_zero` (degenerate): laurentQExpansion 0 = 0.
- `laurentQExpansion_discriminant_coeff_one` (compatibility): For Mathlib's discriminant Δ, coeff 1 (laurentQExpansion Δ) = 1 and coeff n = 0 for n ≤ 0.
- `not_hasLaurentQExpansion_id` (non-example): The function τ ↦ τ has no Laurent q-expansion (it is not 1-periodic).

Depends on: `QM.3/weakly-holomorphic-laurent-expansion`, `mathlib:UpperHalfPlane.qExpansion`, `mathlib:UpperHalfPlane.cuspFunction`, `mathlib:UpperHalfPlane.qExpansion_coeff_unique`, `mathlib:UpperHalfPlane.qExpansion_mul`, `mathlib:UpperHalfPlane.IsBoundedAtImInfty`, `mathlib:Function.Periodic.qParam`, `mathlib:HahnSeries.ofPowerSeries`, `mathlib:LaurentSeries`.

#### Level-one modular functions holomorphic on ℍ (`QM.6/weakly-holomorphic-modular-function`, definition)

M^!_0 is the weight-0, level-one case of the weakly holomorphic modular forms of QM.3 (QM.3/weakly-holomorphic-modular-form with Γ = SL₂(ℤ) and k = 0): the set of f : ℍ → ℂ that are holomorphic on ℍ, invariant under SL₂(ℤ) (f(γτ) = f(τ) for all γ), and meromorphic at i∞: τ ↦ e^{2πiNτ}f(τ) is bounded as Im τ → ∞ for some N ∈ ℕ (for level one, exponential growth at the single cusp is equivalent to this). This node adds the ring structure used by the moonshine chain. It is a ℂ-subalgebra of the functions ℍ → ℂ; each f ∈ M^!_0 has a Laurent q-expansion with coefficients zero below −N; f is bounded at i∞ if and only if its Laurent expansion has no negative powers, and then f is a level-one modular form of weight 0, hence constant.

API:
- `WeaklyHolomorphicModularFunction` (structure): M^!_0 as a Subalgebra ℂ (ℍ → ℂ).
- `WeaklyHolomorphicModularFunction.mem_iff` (characterisation): f ∈ M^!_0 ↔ holomorphic ∧ SL₂(ℤ)-invariant ∧ ∃ N, IsBoundedAtImInfty (q^N · f).
- `WeaklyHolomorphicModularFunction.laurentQExpansion` (data): The Laurent q-expansion of f ∈ M^!_0.
- `WeaklyHolomorphicModularFunction.toModularForm` (coercion): A bounded element of M^!_0 as a ModularForm of weight 0 for SL₂(ℤ).
- `WeaklyHolomorphicModularFunction.const_of_bounded` (characterisation): A bounded element of M^!_0 is constant (Mathlib ModularFormClass.levelOne_weight_zero_const).
- `WeaklyHolomorphicModularFunction.laurentQExpansion_injective` (extensionality): f is determined by its Laurent q-expansion.

Unit tests:
- `WeaklyHolomorphicModularFunction.const_mem` (degenerate): Every constant function belongs to M^!_0, with Laurent expansion the constant.
- `WeaklyHolomorphicModularFunction.bounded_eq_const` (characterisation): If f ∈ M^!_0 is bounded at i∞ then f is constant.
- `WeaklyHolomorphicModularFunction.E4_not_mem` (non-example): Mathlib's E₄ is not in M^!_0: E₄(−1/τ) = τ⁴E₄(τ) ≠ E₄(τ) at τ = 2i.
- `WeaklyHolomorphicModularFunction.j_mem` (computation): The analytic j of ModularForms Layer 0 lies in M^!_0 with Laurent expansion j(q).

Depends on: `QM.3/weakly-holomorphic-modular-form`, `QM.6/laurent-q-expansion`, `mathlib:ModularForm`, `mathlib:SlashInvariantForm`, `mathlib:UpperHalfPlane.IsBoundedAtImInfty`, `mathlib:Function.Periodic.qParam`.

#### Holomorphic level-one modular functions are polynomials in j (`QM.6/modular-function-polynomial-in-j`, theorem)

Every f ∈ M^!_0 whose Laurent q-expansion has no powers below q^{−N} is P(j) for a unique polynomial P ∈ ℂ[X] of degree ≤ N; P is determined by the coefficients of f at q^{−N}, …, q^0. Hence M^!_0 = ℂ[j] and evaluation at j is an isomorphism of ℂ-algebras ℂ[X] ≅ M^!_0.

Hypotheses: f ∈ M^!_0.

Proof outline: Induction on N. N = 0: f is bounded at i∞, hence a weight-0 level-one modular form, hence constant (ModularFormClass.levelOne_weight_zero_const). N > 0: j ∈ M^!_0 has Laurent expansion q^{−1} + 744 + O(q) (ModularForms Layer 0), so j^N = q^{−N} + (higher powers); f − a_{−N} j^N ∈ M^!_0 has no powers below q^{−(N−1)}; apply the induction hypothesis. Uniqueness: j^n has leading term q^{−n}, so the j^n are linearly independent and a nonzero P(j) has leading term (lead P)·q^{−deg P}.

Depends on: `QM.6/weakly-holomorphic-modular-function`, `QM.6/laurent-q-expansion`, `mathlib:ModularFormClass.levelOne_weight_zero_const`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

#### Formal weight-zero Hecke operators on Laurent series (`QM.6/formal-hecke-operator`, definition)

Let k be a field of characteristic 0 and m ≥ 1. The formal Hecke operator T_m : k((q)) → k((q)) is the k-linear map with (T_m f)_n := Σ_{a ≥ 1, a | m, a | n} a^{−1} f_{mn/a²} for n ∈ ℤ (for n = 0 the sum is over all a | m). It is the q-expansion of the weight-zero Hecke operator (1/m)Σ_{ad=m, 0≤b<d} f((aτ+b)/d). If f = q^{−1} + Σ_{n≥1} f_n qⁿ is normalized then T_m f = (1/m)q^{−m} + Σ_{n≥1}(T_m f)_n qⁿ.

API:
- `formalHecke` (data): T_m : LaurentSeries k →ₗ[k] LaurentSeries k.
- `formalHecke_coeff` (simp): (T_m f)_n = Σ_{a ∈ divisors of gcd(m, n)} a⁻¹ f_{mn/a²} (all divisors of m when n = 0).
- `formalHecke_one` (simp): T_1 = id.
- `formalHecke_mul_coprime` (relation): T_m ∘ T_n = T_{mn} for coprime m, n.
- `formalHecke_normalized` (relation): For normalized f: T_m f − (1/m)q^{−m} ∈ q·k[[q]].
- `formalHecke_map` (functoriality): T_m commutes with coefficientwise ring homomorphisms k → k'.

Unit tests:
- `formalHecke_two_J` (computation): The coefficients of T_2 J at q^{−2}, q^{−1}, q^0, q^1, q^2 are 1/2, 0, 0, 21493760, 20245856256 + 98442.
- `formalHecke_one_apply` (degenerate): T_1 f = f.
- `formalHecke_not_mul` (non-example): T_m is not multiplicative: T_2(q^{−2}) = q^{−1} + (1/2)q^{−4} while (T_2 q^{−1})² = (1/4)q^{−4}.
- `formalHecke_const` (computation): T_m (constant a) = σ_{−1}(m)·a = (σ₁(m)/m)·a.

Depends on: `mathlib:LaurentSeries`, `mathlib:HahnSeries`.

#### Weight-zero Hecke operators on M^!_0 (`QM.6/weakly-holomorphic-hecke-operator`, construction)

For m ≥ 1 and f ∈ M^!_0 define (T_m f)(τ) := (1/m)·Σ_{a,d ≥ 1, ad = m} Σ_{b=0}^{d−1} f((aτ + b)/d). Then T_m f ∈ M^!_0 and laurentQExpansion(T_m f) = formalHecke m (laurentQExpansion f); T_m is ℂ-linear.

API:
- `WeaklyHolomorphicModularFunction.hecke` (constructor): T_m : M^!_0 →ₗ[ℂ] M^!_0.
- `WeaklyHolomorphicModularFunction.hecke_apply` (simp): (T_m f) τ = (1/m) Σ_{ad=m} Σ_{b<d} f((aτ+b)/d).
- `WeaklyHolomorphicModularFunction.laurentQExpansion_hecke` (compatibility): laurentQExpansion (T_m f) = formalHecke m (laurentQExpansion f).
- `WeaklyHolomorphicModularFunction.hecke_one` (simp): T_1 = id.
- `WeaklyHolomorphicModularFunction.hecke_const` (simp): T_m c = (σ₁(m)/m)·c for constants c.

Unit tests:
- `WeaklyHolomorphicModularFunction.hecke_one_apply` (degenerate): T_1 f = f.
- `WeaklyHolomorphicModularFunction.hecke_const_two` (computation): T_2 1 = (3/2)·1.
- `WeaklyHolomorphicModularFunction.hecke_J_leading` (computation): The Laurent expansion of T_m J is (1/m)q^{−m} + O(q).
- `WeaklyHolomorphicModularFunction.partial_sum_not_invariant` (non-example): The partial sum τ ↦ (1/2)(J(τ/2) + J((τ+1)/2)) (the term with a = 1, d = 2 only) is not SL₂(ℤ)-invariant: its Laurent expansion Σ_{n≥1} c(2n)qⁿ = 21493760q + ⋯ is bounded at i∞ and nonconstant, whereas bounded elements of M^!_0 are constant.

Depends on: `QM.6/weakly-holomorphic-modular-function`, `QM.6/formal-hecke-operator`, `QM.6/laurent-q-expansion`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`.

#### Hecke transforms of J are polynomials in J (`QM.6/hecke-transform-of-j`, lemma)

For every m ≥ 1 there is a polynomial P_m ∈ ℂ[X] of degree m with leading coefficient 1/m such that formalHecke m J = P_m(J) in ℂ((q)) (J = j − 744 viewed in ℂ((q))); equivalently m·T_m J is the unique polynomial Q_m(J) with Q_m(J) = q^{−m} + O(q).

Hypotheses: m ≥ 1.

Proof outline: The analytic J = j − 744 lies in M^!_0 with Laurent expansion J (j-laurent-series compatibility, ModularForms Layer 0). T_m J ∈ M^!_0 (weakly holomorphic Hecke operator), so T_m J = P_m(J) as functions by the polynomial theorem. Take Laurent expansions: laurentQExpansion is a ring homomorphism and laurentQExpansion(T_m J) = formalHecke m J; the leading term (1/m)q^{−m} fixes deg P_m = m and its leading coefficient.

Depends on: `QM.6/weakly-holomorphic-hecke-operator`, `QM.6/modular-function-polynomial-in-j`, `QM.6/j-laurent-series`, `QM.6/formal-hecke-operator`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

#### A polynomial in J is determined by its principal part and constant term (`QM.6/polynomial-in-j-principal-part`, lemma)

Let k be a field and J ∈ k((q)) any series of the form q^{−1} + (terms of degree ≥ 1). If P ∈ k[X] and the coefficients of P(J) at q^n vanish for all n ≤ 0, then P = 0. More precisely, if P has degree d ≥ 0 and leading coefficient a ≠ 0, the coefficient of P(J) at q^{−d} is a.

Hypotheses: J = q^{−1} + O(q).

Proof outline: J^i = q^{−i} + (terms of degree > −i), so P(J) = a·q^{−d} + (higher terms); if d ≥ 1 the q^{−d} coefficient is a ≠ 0; if d = 0, P(J) = a with q^0 coefficient a ≠ 0.

Depends on: `mathlib:LaurentSeries`, `mathlib:HahnSeries.order`.

#### Logarithm of the j product (`QM.6/formal-product-logarithm`, lemma)

In the ring ℚ((q))[[p]] (formal power series in p over Laurent series in q), the product Π_{m≥1, n≥−1}(1 − p^m q^n)^{c(mn)} = (1 − pq^{−1})·Π_{m,n≥1}(1 − p^mq^n)^{c(mn)} converges (the second factor in ℚ[[p,q]] in the (p,q)-adic topology; factors with n ≤ −2 or n = 0 have exponent 0 and the only factor with n = −1 is 1 − pq^{−1}), and it equals exp(−Σ_{M≥1} (formalHecke M J)(q)·p^M).

Hypotheses: c(n) the coefficients of J.

Proof outline: log(1 − x) = −Σ_k x^k/k for x in the maximal ideal (PowerSeries.log / PowerSeries.subst); log of a convergent product of units 1 + (ideal) is the sum of the logs. −Σ_{m≥1}Σ_n c(mn)Σ_{k≥1} p^{mk}q^{nk}/k: the coefficient of p^M q^N is −Σ_{k | (M,N)} c(MN/k²)/k = −(formalHecke M J)_N (put m = M/k, n = N/k). Exponentiate (exp ∘ log = id on 1 + (p)).

Depends on: `QM.6/formal-hecke-operator`, `QM.6/j-laurent-series`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.log`, `mathlib:PowerSeries.subst`.

#### The product formula for j (Koike–Norton–Zagier; Borcherds' Lemma 7.1) (`QM.6/j-product-formula`, theorem)

In ℤ((q))((p)) (formal Laurent series in p over ℤ((q))): p^{−1} Π_{m≥1, n∈ℤ} (1 − p^m q^n)^{c(mn)} = J(p) − J(q), where J = Σ_{n≥−1} c(n)qⁿ is the Laurent series of j − 744 (equivalently j(p) − j(q)). Equivalently, in ℤ[[p,q]]: Π_{m,n≥1}(1 − p^mq^n)^{c(mn)} = 1 − Σ_{m,n≥1} c(m+n−1)p^mq^n.

Proof outline: By the logarithm lemma, p·LHS = exp(−Σ_M T_M(J) p^M); each T_M J = P_M(J) ∈ ℂ[J] (hecke-transform-of-j), and the coefficient of p^M in exp(−Σ T_M(J)p^M) is a polynomial with rational coefficients in the T_{M'}J, M' ≤ M, hence lies in ℂ[J]. p·RHS = 1 − pJ(q) + Σ_{M≥2} c(M−1)p^M also has all p-coefficients in ℂ[J]. Coefficients at q^n, n ≤ 0: p·LHS = (1 − pq^{−1})(1 + q·ℚ[[p,q]]) has q^{−1}-part −p and q^0-part 1 + Σ_{m≥1}c(m)p^{m+1} (the q¹ coefficient of Π_{m,n≥1} is −Σ c(m)p^m); p·RHS has the same q^{−1}- and q^0-parts and no lower terms. Hence for each M the difference of p^M-coefficients is P(J) with vanishing coefficients at q^n, n ≤ 0, so it is 0 (principal-part lemma); the identity holds over ℂ and therefore over ℤ. The second form: divide by 1 − pq^{−1} and use the telescoping identity p(J(p) − J(q)) = (1 − pq^{−1})(1 − Σ c(m+n−1)p^mq^n).

Depends on: `QM.6/formal-product-logarithm`, `QM.6/hecke-transform-of-j`, `QM.6/polynomial-in-j-principal-part`, `QM.6/j-laurent-series`, `mathlib:PowerSeries.exp`.

#### Borcherds' twisted denominator identity (`QM.6/twisted-denominator-identity`, theorem)

Let V be a moonshine module and g ∈ Aut(V, ω, (·,·)); write c_h(n) := tr(h|V_{n+1}) for h = g^i (so c_h(−1) = 1, c_h(0) = 0 and c_h(n) = 0 for n < −1) and T_g = Σ_n c_g(n)qⁿ. Then in the ring ℝ((q))((p)) of formal Laurent series in p with coefficients in ℝ((q)): p^{−1} exp(−Σ_{i≥1} Σ_{m≥1, n∈ℤ} c_{g^i}(mn) p^{mi} q^{ni}/i) = T_g(p) − T_g(q). Equivalently, in ℝ[[p,q]]: exp(−Σ_{i≥1} Σ_{a,b≥1} c_{g^i}(ab) p^{ai}q^{bi}/i) = 1 − Σ_{a,b≥1} c_g(a+b−1) p^a q^b.

Hypotheses: V moonshine module; g conformal automorphism preserving the form.

Proof outline: Apply the free-decomposition theorem with G = ⟨g⟩: u⁻ ≅ L(W) g-equivariantly with W_{−(a,b)} ≅ V_{a+b}. The equivariant free Lie character formula (p, q recording the degrees −(1,0), −(0,1)) with ch_g(u⁻) = Σ_{a,b≥1} c_g(ab)p^aq^b (Monster Lie algebra: m_{(−a,−b)} ≅ V_{ab+1} g-equivariantly) and ch_g(W) = Σ c_g(a+b−1)p^aq^b gives the second form (ψ^i ch_g(u⁻) = Σ c_{g^i}(ab)p^{ai}q^{bi}). Multiply by p^{−1}(1 − p/q) = p^{−1}exp(−Σ_i p^iq^{−i}/i) (the terms with n = −1, m = 1; the terms with n = 0 vanish as c(0) = 0; terms with mn < −1 vanish) and use the telescoping identity (p^{−1} − q^{−1})(1 − Σ c_g(a+b−1)p^aq^b) = T_g(p) − T_g(q).

Depends on: `QM.6/monster-lie-algebra-free-decomposition`, `QM.6/free-lie-algebra-character-formula`, `QM.6/graded-trace-exterior-symmetric-power`, `QM.6/monster-lie-algebra`, `QM.6/mckay-thompson-series`.

#### Completely replicable functions and replication families (`QM.6/completely-replicable-function`, definition)

Let k be a field of characteristic 0. A normalized q-series is f ∈ k((q)) with f = q^{−1} + Σ_{n≥1} a(n)qⁿ (coefficient 1 at q^{−1}, 0 at q^0, and no other negative powers); write a(−1) = 1, a(0) = 0, a(n) = 0 for n < −1. A replication family is a map F : ℕ_{≥1} → k((q)) with each F(s) normalized, coefficients a_s(n), such that for every s ≥ 1, in k((q))((p)): p^{−1} exp(−Σ_{i≥1} Σ_{m≥1, n∈ℤ} a_{si}(mn) p^{mi} q^{ni}/i) = F(s)(p) − F(s)(q). A normalized f is completely replicable if f = F(1) for some replication family F (its replicates are f^{(s)} := F(s)); Norton's definition via the identities Σ_{ad=n, 0≤b<d} f^{(a)}((aτ+b)/d) = Q_n(f(τ)) is equivalent (Borcherds 1992 §8).

API:
- `IsNormalizedQSeries` (other): f = q^{−1} + Σ_{n≥1} a(n)qⁿ.
- `ReplicationIdentity` (other): The replication identity of F at index s, stated in k⟦p, q⟧ in the equivalent form exp(−Σ_i ψⁱ(Σ_{a,b≥1} a_{si}(ab)pᵃqᵇ)/i) = 1 − Σ_{a,b≥1} a_s(a+b−1)pᵃqᵇ (ψⁱ: p ↦ pⁱ, q ↦ qⁱ).
- `IsReplicationFamily` (other): Every F(s) is normalized and the replication identity holds at every s.
- `IsCompletelyReplicable` (other): ∃ F, IsReplicationFamily F ∧ F 1 = f.
- `IsReplicationFamily.comp_mul` (functoriality): If F is a replication family then so is s ↦ F(ts) for every t ≥ 1 (replicates of replicates).
- `IsReplicationFamily.coeff_four` (relation): a_s(4) = a_s(3) + (a_s(1)² − a_{2s}(1))/2.

Unit tests:
- `IsCompletelyReplicable.qInv` (degenerate): f = q^{−1} is completely replicable with F(s) = q^{−1} for all s (p^{−1}(1 − p/q) = p^{−1} − q^{−1}).
- `IsReplicationFamily.const_J` (computation): The constant family F(s) = J is a replication family, so a(4) = a(3) + (a(1)² − a(1))/2 holds for J: 20245856256 = 864299970 + (196884² − 196884)/2.
- `IsReplicationFamily.not_const_T2B` (non-example): The constant family F(s) = q^{−1}Π(1−q^{2n−1})^{24} + 24 (the 2B series q^{−1} + 276q − 2048q² + 11202q³ − 49152q⁴ + ⋯) is not a replication family: the relation for a(4) forces a_2(1) = a(1)² − 2(a(4) − a(3)) = 196884 ≠ 276.
- `IsReplicationFamily.T2B_J` (computation): The family F(s) = T_{2B} for odd s and J for even s satisfies the a(4)-relation: −49152 = 11202 + (276² − 196884)/2.

Depends on: `QM.6/mckay-thompson-series`, `mathlib:LaurentSeries`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.subst`.

#### Recursion formulas and determination of replication families (`QM.6/replication-recursion`, theorem)

Let F be a replication family over a field of characteristic 0 with coefficients a_s(n). (a) For all s ≥ 1 and k ≥ 1 (writing a = a_s, a' = a_{2s}): a(4k) = a(2k+1) + (a(k)² − a'(k))/2 + Σ_{1≤j<k} a(j)a(2k−j); a(4k+1) = a(2k+3) − a(2)a(2k) + (a(2k)² + a'(2k))/2 + (a(k+1)² − a'(k+1))/2 + Σ_{1≤j≤k} a(j)a(2k−j+2) + Σ_{1≤j<k} a'(j)a(4k−4j) + Σ_{1≤j<2k} (−1)^j a(j)a(4k−j); a(4k+2) = a(2k+2) + Σ_{1≤j≤k} a(j)a(2k−j+1); a(4k+3) = a(2k+4) − a(2)a(2k+1) − (a(2k+1)² − a'(2k+1))/2 + Σ_{1≤j≤k+1} a(j)a(2k−j+3) + Σ_{1≤j≤k} a'(j)a(4k−4j+2) + Σ_{1≤j≤2k} (−1)^j a(j)a(4k−j+2). (b) Consequently, for n = 4 or n ≥ 6, a_s(n) is determined by the a_s(j) and a_{2s}(j) with j < n; hence two replication families F, F' with a_s(n) = a'_s(n) for all s ≥ 1 and n ∈ {1, 2, 3, 5} are equal.

Hypotheses: F replication family.

Proof outline: Compare the coefficients of p² and p⁴ of both sides of the replication identity at index s (Borcherds 1992 §9) and solve for the coefficient of highest index. (b): strong induction on n, simultaneously for all s; the right sides of (a) involve only indices < n when n = 4 or n ≥ 6 (for n = 5 the formula for a(4·1+1) degenerates to a(5) = a(5)). Alternative: Möbius inversion of the p^iq^j coefficients shows a_s(ij) = a_s(i+j−1) + (terms of level ≤ i+j−3) (Jurisich–Lepowsky–Wilson (37)–(38)).

Depends on: `QM.6/completely-replicable-function`, `mathlib:ArithmeticFunction.moebius`.

#### McKay–Thompson series of a moonshine module are completely replicable (`QM.6/moonshine-module-complete-replicability`, theorem)

Let V be a moonshine module (Borcherds' properties (1)–(2)) and g ∈ Aut(V, ω, (·,·)). Then s ↦ T_{g^s} is a replication family; in particular T_g is completely replicable with replicates T_{g^s}, and T_g is determined by the numbers c_{g^s}(n), s ≥ 1, n ∈ {1, 2, 3, 5}. This holds for every automorphism, without reference to the Monster.

Hypotheses: V moonshine module; g conformal automorphism preserving the form.

Proof outline: Each T_{g^s} is normalized: V_0 = ℝ1 with g^s·1 = 1 and V_1 = 0. The replication identity at index s is the twisted denominator identity for g^s (since (g^s)^i = g^{si}). Determination by the listed coefficients is the recursion theorem.

Depends on: `QM.6/twisted-denominator-identity`, `QM.6/completely-replicable-function`, `QM.6/replication-recursion`, `QM.6/moonshine-module-axioms`.

### QM.6d Hauptmoduln and monstrous moonshine

Moonshine-type groups, normalized Hauptmoduln and the genus-zero theorem (through the FuchsianOrbifolds compactification), the Hauptmoduln of SL₂(ℤ) and Γ₀(2), moonshine for the identity element, the head characters of V♮, and the monstrous moonshine theorem.

#### Modular groups of moonshine type (`QM.6/moonshine-type-modular-group`, definition)

A subgroup Γ ≤ SL₂(ℝ) is of moonshine type if it is discrete, contains the image of Γ₀(N) = {(a b; c d) ∈ SL₂(ℤ) : N | c} for some N ≥ 1, and for t ∈ ℝ the matrix (1 t; 0 1) lies in Γ if and only if t ∈ ℤ. Such Γ is commensurable with SL₂(ℤ), hence a cofinite Fuchsian group whose cusps are the Γ-orbits of ℚ ∪ {∞}; the cusp ∞ has width 1. Examples: SL₂(ℤ), Γ₀(N), and the Atkin–Lehner extensions Γ₀(N)+ (for N = 2: generated by Γ₀(2) and (0 −1/√2; √2 0)).

API:
- `IsMoonshineType` (other): The predicate on Subgroup SL(2, ℝ).
- `IsMoonshineType.gamma0_le` (projection): Some Γ₀(N) (mapped to SL₂(ℝ)) is contained in Γ.
- `IsMoonshineType.translation_mem_iff` (characterisation): (1 t; 0 1) ∈ Γ ↔ t ∈ ℤ.
- `IsMoonshineType.periodic` (relation): A Γ-invariant function on ℍ is 1-periodic.
- `IsMoonshineType.commensurable` (other): Γ ∩ SL₂(ℤ) has finite index in Γ and in SL₂(ℤ).

Unit tests:
- `IsMoonshineType.SL2Z` (degenerate): The image of SL₂(ℤ) is of moonshine type with N = 1.
- `IsMoonshineType.gamma0_two` (computation): The image of Γ₀(2) is of moonshine type.
- `IsMoonshineType.gamma0_two_plus` (computation): The group generated by Γ₀(2) and (0 −1/√2; √2 0) is of moonshine type.
- `IsMoonshineType.not_gamma_two` (non-example): The principal congruence subgroup Γ(2) is not of moonshine type (it does not contain (1 1; 0 1)).

Depends on: `mathlib:CongruenceSubgroup.Gamma0`, `mathlib:Matrix.SpecialLinearGroup.map`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.

#### Normalized Hauptmodul of a genus-zero group (`QM.6/normalized-hauptmodul`, definition)

Let Γ be of moonshine type. A function f : ℍ → ℂ is a normalized Hauptmodul for Γ if: f is holomorphic on ℍ; f(γτ) = f(τ) for all γ ∈ Γ; f(τ) − e^{−2πiτ} → 0 as Im τ → ∞ (so f = q^{−1} + Σ_{n≥1} a_n qⁿ); and for every A ∈ SL₂(ℤ) such that A·∞ is not Γ-equivalent to ∞ (no γ ∈ Γ has (γ⁻¹A)₁₀ = 0), the function τ ↦ f(Aτ) is bounded as Im τ → ∞. Equivalently (theorem hauptmodul-genus-zero), f descends to a biholomorphism from the compactified quotient X(Γ) to ℙ¹ sending the cusp ∞ to ∞; this is Borcherds' 'isomorphism from the compact Riemann surface H/G to the sphere taking i∞ to ∞' with the normalization e^{−2πiτ} + (a function vanishing at i∞).

API:
- `IsNormalizedHauptmodul` (other): The predicate on (Γ, f).
- `IsNormalizedHauptmodul.invariant` (projection): f (γ • τ) = f τ for γ ∈ Γ.
- `IsNormalizedHauptmodul.hasLaurentQExpansion` (characterisation): f has a Laurent q-expansion of the form q^{−1} + Σ_{n≥1} a_n qⁿ.
- `IsNormalizedHauptmodul.unique` (extensionality): Two normalized Hauptmoduln for the same Γ are equal.
- `IsNormalizedHauptmodul.of_le` (relation): If Γ ≤ Γ' and f is a normalized Hauptmodul for Γ that is Γ'-invariant, it is one for Γ'.

Unit tests:
- `IsNormalizedHauptmodul.J` (computation): J = j − 744 (ModularForms Layer 0) is a normalized Hauptmodul for SL₂(ℤ).
- `IsNormalizedHauptmodul.not_j` (non-example): j itself is not normalized: j(τ) − e^{−2πiτ} → 744 ≠ 0.
- `IsNormalizedHauptmodul.not_J_gamma0_two` (non-example): J is Γ₀(2)-invariant with the right expansion at ∞ but is not a normalized Hauptmodul for Γ₀(2): J(A·τ) is unbounded for A = S = (0 −1; 1 0), whose cusp 0 is not Γ₀(2)-equivalent to ∞.
- `IsNormalizedHauptmodul.not_const` (degenerate): No constant function is a normalized Hauptmodul (the q^{−1} term is required).

Depends on: `QM.6/moonshine-type-modular-group`, `QM.6/laurent-q-expansion`, `mathlib:UpperHalfPlane.IsBoundedAtImInfty`, `mathlib:Function.Periodic.qParam`.

#### Normalized Hauptmoduln and genus zero (`QM.6/hauptmodul-genus-zero`, theorem)

Let Γ be of moonshine type and X(Γ) its compactified quotient (a compact Riemann surface, FuchsianOrbifolds). (a) If f is a normalized Hauptmodul for Γ, then f descends to a meromorphic function on X(Γ) whose only pole is a simple pole at the cusp ∞; hence the induced holomorphic map X(Γ) → ℙ¹ has degree one and is a biholomorphism, X(Γ) has genus 0, and every Γ-invariant meromorphic function on ℍ that is meromorphic at the cusps is a rational function of f. (b) Conversely, if X(Γ) has genus 0 there is exactly one normalized Hauptmodul for Γ.

Hypotheses: Γ of moonshine type.

Proof outline: Descent and extension over cusps: f is Γ-invariant, holomorphic, with q-expansion at ∞ in the width-one parameter q (simple pole) and bounded at the other cusps (removable singularities) — FuchsianOrbifolds Layers 3–5. Degree: the fibre over ∞ ∈ ℙ¹ is the single cusp ∞ with local multiplicity 1; degree-one theorem (FuchsianOrbifolds Layer 5) gives a biholomorphism, so genus X(Γ) = genus ℙ¹ = 0. Function field: a meromorphic function on X(Γ) ≅ ℙ¹ is a rational function of the coordinate f. Uniqueness: the difference of two normalized Hauptmoduln is holomorphic on X(Γ) and vanishes at ∞, hence 0. Converse: genus 0 gives a biholomorphism X(Γ) ≅ ℙ¹; composing with a Möbius map sending the cusp ∞ to ∞ gives a Hauptmodul, and scaling and translating normalizes it (the pole at ∞ is simple since the degree is one and the width is one).

Depends on: `QM.6/normalized-hauptmodul`, `QM.6/moonshine-type-modular-group`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`.

#### J is the normalized Hauptmodul of SL₂(ℤ) (`QM.6/j-normalized-hauptmodul`, theorem)

The function J := j − 744 (j the normalized modular j-function E₄³/Δ) is a normalized Hauptmodul for SL₂(ℤ), and its Laurent q-expansion is the formal series J of node j-laurent-series.

Proof outline: j is holomorphic on ℍ and SL₂(ℤ)-invariant with Laurent expansion q^{−1} + 744 + O(q) (ModularForms Layer 0); subtract 744. SL₂(ℤ) has one cusp, so the boundedness condition at other cusps is vacuous. The Laurent expansion agrees with the formal J by the compatibility API of j-laurent-series.

Depends on: `QM.6/normalized-hauptmodul`, `QM.6/j-laurent-series`, `QM.6/moonshine-type-modular-group`, `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`.

#### The normalized Hauptmodul of Γ₀(2) (`QM.6/gamma0-two-hauptmodul`, theorem)

Let Δ be Mathlib's modular discriminant and t_{2B}(τ) := Δ(τ)/Δ(2τ) + 24. Then t_{2B} is a normalized Hauptmodul for Γ₀(2) (so X₀(2) has genus 0), and its Laurent q-expansion is q^{−1}Π_{n≥1}(1 − q^{2n−1})^{24} + 24 = q^{−1} + 276q − 2048q² + 11202q³ − 49152q⁴ + 184024q⁵ + ⋯.

Proof outline: Δ(2τ) = Δ|₁₂ diag(2,1) is a modular form of weight 12 for Γ₀(2) and never vanishes on ℍ (Mathlib discriminant_ne_zero); so Δ(τ)/Δ(2τ) is holomorphic and Γ₀(2)-invariant (both numerator and denominator have weight 12). At ∞: Δ(τ)/Δ(2τ) = q^{−1}Π(1 − qⁿ)^{24}(1 − q^{2n})^{−24} = q^{−1}Π(1 + qⁿ)^{−24} = q^{−1}Π(1 − q^{2n−1})^{24} (Euler's identity Π(1 + qⁿ)(1 − q^{2n−1}) = 1), using Mathlib's product formula discriminant_eq_q_prod. Cusps of Γ₀(2): ∞ and 0 (ModularForms 10A). At 0: Δ(Sτ)/Δ(2Sτ) = τ^{12}Δ(τ)/((τ/2)^{12}Δ(τ/2)) = 2^{12}Δ(τ)/Δ(τ/2) → 0 as Im τ → ∞ (discriminant_S_invariant), so t_{2B}∘S is bounded. Expand the product to obtain the displayed coefficients (finite computation).

Depends on: `QM.6/normalized-hauptmodul`, `QM.6/hauptmodul-genus-zero`, `QM.6/laurent-q-expansion`, `mathlib:ModularForm.discriminant`, `mathlib:ModularForm.discriminant_ne_zero`, `mathlib:ModularForm.discriminant_S_invariant`, `mathlib:ModularForm.discriminant_T_invariant`, `mathlib:ModularForm.discriminant_eq_q_prod`, `mathlib:CongruenceSubgroup.Gamma0`, `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`.

#### Moonshine for the identity element (`QM.6/moonshine-identity-thompson-series`, theorem)

For every moonshine module V, the McKay–Thompson series of the identity, T_1 = q^{−1}·gradedDimension(V), equals J and is the Laurent q-expansion of the normalized Hauptmodul j − 744 of the genus-zero group SL₂(ℤ).

Hypotheses: V moonshine module.

Proof outline: T_1 = J is Borcherds' property (2) (moonshine-module-axioms). J is the Laurent expansion of the normalized Hauptmodul j − 744 (j-normalized-hauptmodul).

Depends on: `QM.6/moonshine-module-axioms`, `QM.6/j-normalized-hauptmodul`, `QM.6/mckay-thompson-series`.

#### Head characters of the moonshine module (`QM.6/monster-head-characters`, theorem)

Let V♮ be the Frenkel–Lepowsky–Meurman moonshine module with its Monster 𝕄 ≤ Aut(V♮, ω, (·,·)), and χ_1, …, χ_7 the irreducible characters of 𝕄 of degrees 1, 196883, 21296876, 842609326, 18538750076, 19360062527, 293553734298. Then as 𝕄-modules V♮_2 ≅ χ_1 + χ_2, V♮_3 ≅ χ_1 + χ_2 + χ_3, V♮_4 ≅ 2χ_1 + 2χ_2 + χ_3 + χ_4, V♮_6 ≅ 4χ_1 + 5χ_2 + 3χ_3 + 2χ_4 + χ_5 + χ_6 + χ_7 (Borcherds' V_1, V_2, V_3, V_5). Consequently, for every g ∈ 𝕄 the coefficients c_g(n), n ∈ {1, 2, 3, 5}, of T_g equal the corresponding coefficients of the Conway–Norton function of the class of g.

Hypotheses: V♮ the FLM moonshine module (gap); Monster character table (gap).

Proof outline: The irreducible 𝕄-modules of dimension ≤ dim V♮_6 are exactly those with characters χ_1, …, χ_7 (ATLAS), so the decompositions are determined by the values c_g(n) on seven classes g_1, …, g_7 with det(χ_i(g_j)) ≠ 0. Take g_1 of class 2B (Thompson series computed by FLM) and six elements of classes 3B, 5B, 7B, 9B, 13B, 15D in the centralizer 2^{1+24}.Co₁ of a 2B element, corresponding to fixed-point-free odd-order automorphisms of the Leech lattice (Co₁ classes 3A, 5A, 7A, 9A, 13A, 15C), for which FLM's formula gives 2Σ_n c_g(n)qⁿ = 1/η_g(q) + η_g(q)/η_g(q²) + η_g(q)/η_g(q^{1/2}) + η_g(q)/η_g(−q^{1/2}). det(χ_i(g_j)) = 35672555520 = 2^{22}·3^5·5·7 ≠ 0; compare the first coefficients (finite computation) to obtain the decompositions, and read off c_g(n) for all g from the character table. Dimension checks: 1 + 196883 = 196884, 1 + 196883 + 21296876 = 21493760, 2 + 2·196883 + 21296876 + 842609326 = 864299970, and 4 + 5·196883 + 3·21296876 + 2·842609326 + 18538750076 + 19360062527 + 293553734298 = 333202640600.

Depends on: `QM.6/moonshine-module-axioms`, `QM.6/mckay-thompson-series`.

#### The monstrous moonshine theorem (Borcherds) (`QM.6/monstrous-moonshine-theorem`, theorem)

Let 𝕄 be the Monster group, presented as TauCeti.SporadicName.Group M (the Y₄₄₃ presentation with Ivanov's central relator). There exist a moonshine module V (Borcherds' axioms: a real vertex operator algebra of central charge 24 with positive definite invariant form and graded dimension J — the Frenkel–Lepowsky–Meurman module V♮) and an injective group homomorphism ρ : 𝕄 →* Aut(V, ω, (·,·)) such that for every g ∈ 𝕄 there are a moonshine-type group Γ_g ≤ SL₂(ℝ) containing Γ₀(N) with N = o(g)·h for some h | gcd(24, o(g)), and a normalized Hauptmodul f_g for Γ_g, whose Laurent q-expansion is the McKay–Thompson series T_{ρ(g)} = Σ_n tr(ρ(g)|V_{n+1}) qⁿ. In particular every Γ_g has genus 0, and T_{ρ(g)} is the function t_g attached to the class of g in Conway–Norton's Table 2.

Hypotheses: 𝕄 the Monster (Tau Ceti presentation).

Proof outline: FLM (gap 'FLM moonshine module'): V♮ satisfies the moonshine-module axioms and FLM's Monster acts faithfully by conformal isometries; identify FLM's Monster with the presented group (gap 'Identification of the Monster'). Complete replicability (moonshine-module-complete-replicability): for every g, s ↦ T_{g^s} is a replication family, so T_g is determined by c_{g^s}(n), n ∈ {1, 2, 3, 5}, s ≥ 1 (replication-recursion). Head characters (monster-head-characters): these numbers equal the corresponding coefficients of the Conway–Norton functions t_{g^s}. The Conway–Norton functions form replication families with t_{g^s} as replicates (Koike; gap 'Conway–Norton functions'): by the recursion theorem T_g = t_g for all g. Each t_g is the normalized Hauptmodul of the explicit moonshine-type group Γ_g ⊇ Γ₀(o(g)h) of Conway–Norton's Table 2 (gap 'Conway–Norton functions'); by hauptmodul-genus-zero Γ_g has genus 0.

Depends on: `QM.6/moonshine-module-axioms`, `QM.6/moonshine-module-complete-replicability`, `QM.6/replication-recursion`, `QM.6/monster-head-characters`, `QM.6/normalized-hauptmodul`, `QM.6/hauptmodul-genus-zero`, `QM.6/moonshine-type-modular-group`, `QM.6/mckay-thompson-series`, `QM.6/laurent-q-expansion`, `tauceti:TauCeti.SporadicName.Group`, `tauceti:TauCeti.Sporadic.Monster.presentation`.

### Dependencies

Inside this roadmap: `QSeriesPartitionsAndMockModularForms:QM.0` (the infinite q-Pochhammer symbol (q;q)_∞, node `QM.0/q-pochhammer`, used for Δ(q) and J) and `QSeriesPartitionsAndMockModularForms:QM.3` (weakly holomorphic modular forms `QM.3/weakly-holomorphic-modular-form` and their Laurent expansions `QM.3/weakly-holomorphic-laurent-expansion`, specialized here to weight 0 and level one). The stage edge from `QM.1` carries only the eta products η_g of the Monster-specific trace formula (Borcherds (9.2)), which lie inside the recorded gap on V♮.
Tau Ceti roadmaps (each with a request in the packet):
- `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`: The normalized modular function j := E₄³/Δ : ℍ → ℂ (the JInputs module of Layer 0): j is holomorphic on ℍ and SL₂(ℤ)-invariant, τ ↦ e^{2πiτ}j(τ) is bounded as Im τ → ∞, and j(τ) = Σ_{n≥−1} c_j(n)e^{2πinτ} for all τ ∈ ℍ (absolutely convergent) with c_j(−1) = 1, c_j(0) = 744, c_j(1) = 196884 and all c_j(n) ∈ ℤ; in Laurent-series form, the Laurent q-expansion of j equals q^{−1}E₄(q)³Π_{n≥1}(1 − qⁿ)^{−24}, E₄(q) = 1 + 240Σσ₃(n)qⁿ. Used by: `hecke-transform-of-j`, `j-laurent-series`, `j-normalized-hauptmodul`, `modular-function-polynomial-in-j`.
- `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`: Level-one coset representatives for the Hecke operators at every n ≥ 1: the set M(n) of integer 2×2 matrices of determinant n is the disjoint union of the cosets SL₂(ℤ)·(a b; 0 d) over a, d ≥ 1 with ad = n and 0 ≤ b < d, and for every γ ∈ SL₂(ℤ) right multiplication by γ permutes these cosets (stated for arbitrary functions ℍ → ℂ invariant under SL₂(ℤ), in weight 0, so that it applies to functions with poles at the cusp). Used by: `weakly-holomorphic-hecke-operator`.
- `tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve`: For N ≥ 1, the cusps of Γ₀(N) are the Γ₀(N)-orbits on ℙ¹(ℚ) with the explicit representatives of the layer; in particular Γ₀(2) has exactly two cusps, represented by ∞ and 0, with widths 1 and 2. Used by: `gamma0-two-hauptmodul`.
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`: A discrete subgroup Γ ≤ SL₂(ℝ) containing the image of Γ₀(N) for some N ≥ 1 is a cofinite Fuchsian group; Γ₀(N) has finite index in Γ, and the parabolic fixed points of Γ are exactly ℚ ∪ {∞}. Used by: `moonshine-type-modular-group`.
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates`: For a cofinite Fuchsian group Γ with (1 t; 0 1) ∈ Γ ⟺ t ∈ ℤ: the cusp datum at ∞ has width 1 and q-coordinate e^{2πiτ}; the Laurent/q-expansion criterion: a Γ-invariant holomorphic function on ℍ that is O(|q|^{−N}) near ∞ descends and extends meromorphically over the cusp with pole order ≤ N, and one bounded near a cusp extends holomorphically. Used by: `hauptmodul-genus-zero`.
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces`: The compactified quotient X(Γ) of a cofinite Fuchsian group Γ is a compact connected Riemann surface, with cusp charts given by the q-coordinates. Used by: `hauptmodul-genus-zero`.
- `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`: Degree theory on compact Riemann surfaces: a nonconstant meromorphic function on X(Γ) with exactly one pole, of order one, defines a holomorphic map X(Γ) → ℙ¹ of degree one, hence a biholomorphism (RiemannSurface.biholomorph_of_degree_eq_one) and genus X(Γ) = 0; descent of Γ-invariant meromorphic functions to X(Γ). Used by: `hauptmodul-genus-zero`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`: For the sl₂-triple of a real Lie algebra acting on a module that is a direct sum of finite-dimensional sl₂-modules with integral h-weights (for example a locally finite module): complete reducibility into the V(n), and for a finite-dimensional module M with weight spaces M_μ, the maps e^k : M_{−j} → M_{−j+2k} are injective for 0 ≤ k ≤ j (and f^k symmetrically); an integrable lowest-weight module generated by a vector of weight −n (n ∈ ℕ) is the (n+1)-dimensional irreducible V(n). Used by: `borcherds-algebra-free-subalgebra`, `borcherds-characterisation-theorem`, `monster-lie-algebra-free-decomposition`, `monster-lie-algebra-simple-roots`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`: The Poincaré–Birkhoff–Witt theorem for an arbitrary (possibly infinite-dimensional) Lie algebra L over a field of characteristic 0: the PBW filtration of U(L) has associated graded algebra canonically isomorphic to Sym(L), naturally in Lie algebra homomorphisms (in particular equivariant for Lie algebra automorphisms), with the ordered-monomial basis for any well-ordered basis of L; consequences U(L) = U(L₁)U(L₂) for L = L₁ ⊕ L₂ as vector spaces with L₁, L₂ subalgebras. Used by: `free-lie-algebra-character-formula`, `no-ghost-spurious-states`, `no-ghost-transverse-space`.

The algebraic modular-curve layers named by the atlas edges into this stage (ModularCurvesPartII R12.3, R13.3, R13.4a and ModularCurves Layer 10) are not used: the genus-zero statements are analytic and are taken from FuchsianOrbifolds (see the restructuring proposal in the packet).

### Acceptance tests

- The coefficients of J: c(−1) = 1, c(0) = 0, c(1) = 196884, c(2) = 21493760, c(3) = 864299970, c(4) = 20245856256, c(5) = 333202640600.
- The product formula: the coefficient of p²q² gives Mahler's recursion c(4) = c(3) + (c(1)² − c(1))/2.
- Borcherds' recursions (9.1) hold for J (with c_{g²} = c) and for the 2B series q^{−1} + 276q − 2048q² + 11202q³ − 49152q⁴ + ⋯ (with c_{g²} = c) for k = 1, …, 4; the constant family T_{2B} is not a replication family.
- dim m_{(1,1)} = 196884, dim m_{(1,−1)} = 1, m_{(1,0)} = 0, and m_{(a,b)} = 0 for ab < −1; the gl₂ = m_{(−1,1)} ⊕ m_{(0,0)} ⊕ m_{(1,−1)}.
- The no-ghost theorem at r = (1,1) gives P¹_r/N_r ≅ V_2; its r = 0 case needs dim V_0 = 1.
- J = j − 744 is the normalized Hauptmodul of SL₂(ℤ); Δ(τ)/Δ(2τ) + 24 is the normalized Hauptmodul of Γ₀(2) and J is not (it is unbounded at the cusp 0).
- The head characters: 1 + 196883 = 196884, 1 + 196883 + 21296876 = 21493760, 2 + 2·196883 + 21296876 + 842609326 = 864299970, and the seven-class determinant 35672555520 = 2²²·3⁵·5·7.

### Gaps and remaining work

- **The Frenkel–Lepowsky–Meurman moonshine module V♮ and its Monster action.** Needed statement: there is a real vertex operator algebra V♮ satisfying QM.6/moonshine-module-axioms (central charge 24, positive definite invariant form with trivial involution, q^{−1}·graded dimension = J, hence V♮_0 = ℝ1 and V♮_1 = 0) together with a finite group 𝕄_FLM ≤ Aut(V♮, ω, (·,·)) acting faithfully; moreover (FLM trace formula, Borcherds (9.2)) for g in the centralizer 2^{1+24}.Co₁ of a 2B element acting on the Leech lattice Λ by an odd-order fixed-point-free automorphism with eigenvalues ε_1, …, ε_24, 2Σ_n tr(g|V♮_{n+1})qⁿ = 1/η_g(q) + η_g(q)/η_g(q²) + η_g(q)/η_g(q^{1/2}) + η_g(q)/η_g(−q^{1/2}) with η_g(q) = Π_i η(ε_i q), and T_{2B} = q^{−1}Π(1 − q^{2n−1})^{24} + 24. Source: Frenkel–Lepowsky–Meurman, Vertex Operator Algebras and the Monster (Academic Press 1988), Theorem 12.3.1 and Corollary 12.5.4 (not public; the announcement PNAS 81 (1984) 3256–3260, PMC345262, is public but has no proofs). The construction needs the Leech lattice (no roadmap of the atlas constructs it; AlgebraicCodingTheory Layers 5–6 supply the Golay code and Construction A), its lattice vertex algebra V_Λ (node lattice-vertex-algebra), the ±1-twisted V_Λ-module, the fixed-point subalgebra V_Λ⁺ and the vertex algebra structure on V_Λ⁺ ⊕ (V_Λ^T)⁺, and the Griess algebra V♮_2. Public alternative constructions: Dong–Griess–Höhn, arXiv:q-alg/9707008 (framed vertex operator algebras); not decomposed here. Needed by: `monster-head-characters`, `monstrous-moonshine-theorem`.
- **Identification of the automorphism group of V♮ with the presented Monster.** Needed statement: the group 𝕄_FLM (equivalently Aut(V♮, ω, (·,·))) is isomorphic to TauCeti.SporadicName.Group SporadicName.M, the Y₄₄₃ Coxeter group modulo the spider relator and Ivanov's f₃₁₂. Inputs: Ivanov, Y-groups via transitive extension, J. Algebra 218 (1999) 412–435 (Y₄₄₃/⟨f₃₁₂⟩ ≅ 𝕄 for the Monster of Griess/Conway) and the uniqueness of the Monster (Griess–Meierfrankenfeld–Segev, Ann. of Math. 130 (1989)); neither is decomposed in the atlas (CFSGStatement S1 records only the presentation). Needed by: `monstrous-moonshine-theorem`.
- **Character table data of the Monster used in Borcherds' final step.** Needed data (Conway–Curtis–Norton–Parker–Wilson, ATLAS of Finite Groups, 1985; not public): the irreducible characters χ_1, …, χ_7 of 𝕄 of degrees 1, 196883, 21296876, 842609326, 18538750076, 19360062527, 293553734298 are exactly the irreducibles of degree ≤ 333202640600; their values on the classes 2B, 3B, 5B, 7B, 9B, 13B, 15D (whose determinant is 35672555520 = 2^{22}·3^5·5·7); the power maps of 𝕄; and the correspondence of these classes with the Co₁ classes 3A, 5A, 7A, 9A, 13A, 15C (cycle shapes 3⁹/1³, 5⁶/1⁶, 7⁴/1⁴, 9³/1³, 13²/1², 15·5/3·1 in Borcherds' notation 3^{12}1^{−12} etc.). Formal verification needs a computer-checked character table of 𝕄 (RepresentationTheory/CharacterTheory Layer 6 algorithm is not applicable to 𝕄 directly). Needed by: `monster-head-characters`.
- **The Conway–Norton functions and their replicability.** Needed statements: for each conjugacy class [g] of 𝕄 the explicit moonshine-type group Γ_g ⊇ Γ₀(o(g)h), h | gcd(24, o(g)), and its normalized Hauptmodul t_g (Conway–Norton, Monstrous moonshine, Bull. London Math. Soc. 11 (1979) 308–339, Table 2; not public), with the Hauptmodul property verified group by group; and Koike's theorem (On replication formula and Hecke operators, Nagoya preprint; not public; also Ferenbaugh, J. Algebra 179 (1996), and Cummins–Norton, Canad. J. Math. 47 (1995)) that s ↦ t_{g^s} is a replication family in the sense of QM.6/completely-replicable-function; plus the first coefficients of t_g (Conway–Norton Table 4). Borcherds' route uses these as imported facts. Needed by: `monstrous-moonshine-theorem`.
- **Invariant form on lattice vertex algebras (Dong; Frenkel–Huang–Lepowsky).** The proof in Jurisich 1998 Lemma 6.1 uses: V_L is an irreducible module over itself and every irreducible V_L-module is isomorphic to V_L for L even unimodular (C. Dong, Vertex algebras associated with even lattices, J. Algebra 161 (1993) 245–265), and the contragredient-module construction with its symmetry criterion (Frenkel–Huang–Lepowsky, Mem. AMS 104 (1993), §5.2–5.3); neither is decomposed here. A direct route (check the adjoint formula on the generating fields α(z), Y(e^β,z) for the Fock form twisted by θ and propagate it through products by the associativity formula) is the planned alternative but its propagation lemma is the missing FHL input. Needed by: `lattice-vertex-algebra-invariant-form`.

Remaining decomposition work for this layer:
- Decompose a public construction of the moonshine module V♮ (for example Dong–Griess–Höhn, arXiv:q-alg/9707008, framed vertex operator algebras) together with the Leech lattice (requested from a roadmap owning explicit rank-24 lattice constructions; none exists in the atlas), the twisted module of V_Λ and the Monster action, so that the gap 'FLM moonshine module' becomes nodes.
- Identify Aut(V♮) with TauCeti.SporadicName.Group M (gap 'Identification of the Monster'): needs Ivanov 1999 and the uniqueness of the Monster.
- Supply the Monster character-table data (gap 'Character table data'), the Conway–Norton Table 2 groups Γ_g with the verification that each t_g is a normalized Hauptmodul, and Koike's replicability theorem (gap 'Conway–Norton functions').
- Replace the Dong/FHL input of lattice-vertex-algebra-invariant-form by a decomposed propagation lemma for the adjoint formula (gap 'Invariant form on lattice vertex algebras').

### Mistakes found in the sources

- `QSeriesPartitionsAndMockModularForms/E701` (misprint, gannon2004, §2, equation (2.7), p. 4 of arXiv:math/0402345v2 (identical in v1)): The coefficient of q³ is 864299970 (8642 99970 in the paper's digit grouping), as printed correctly in (3.1b) of the same paper. Known: new.
- `QSeriesPartitionsAndMockModularForms/E702` (misprint, gannon2004, §3.3, text between (3.7a) and (3.7b), p. 8 of arXiv:math/0402345v2 (identical in v1)): a4(g) = a3(g) + (a1(g)² − a1(g²))/2. Known: new.
- `QSeriesPartitionsAndMockModularForms/E703` (misprint, borcherds1992, §1, p. 3 of the author's copy (Invent. Math. 109, p. 407)): T_{2−}(q) = 24 + q^{−1}Π_{n≥0}(1 − q^{2n+1})^{24} = 24 + q^{−1}Π_{n>0}(1 − q^{2n−1})^{24}. Known: new.
- `QSeriesPartitionsAndMockModularForms/E704` (misprint, borcherds1992, §5, Lemma 5.4 and its proof, p. 21 of the author's copy): The lemma concerns the L_i with i > 0: the associative algebra they generate is generated by L_1 and L_2 + (3/2)L_1², which map S¹ into S when the central charge is 26. Known: Jurisich 1998 (arXiv:1311.3258), Appendix A, Lemma A.6 states the corrected form (without remarking on the misprint).
- `QSeriesPartitionsAndMockModularForms/E705` (error, borcherds1992, §5, Theorem 5.1, p. 19 of the author's copy): The case r = 0 needs the extra hypothesis V⁰ = ℝ·1 (dim V⁰ = 1), as in Jurisich 1998 Theorem 6.2 (iii); in general, when L_1V¹ = 0, the quotient is V¹ ⊕ (V⁰ ⊗ ℝ²). Known: Jurisich 1998 (arXiv:1311.3258), Theorem 6.2, adds hypothesis (iii) dim V(0) = 1 (without remarking on the omission).
- `QSeriesPartitionsAndMockModularForms/E706` (gap, borcherds1988, §2, proof of Corollary 2.5, p. 3 of the author's copy): A complete proof that the contravariant form is positive definite on the root spaces of a generalized Kac–Moody algebra is in Kac, Infinite dimensional Lie algebras, 3rd ed. (1990), §11; for the matrices used in this stage it also follows from Jurisich 1998 Theorem 5.1 and Corollary 5.3. Known: author's footnote in the online copy; Kac, Infinite dimensional Lie algebras, 3rd ed. (1990); Borcherds 1992 §4.
- `QSeriesPartitionsAndMockModularForms/E707` (misprint, borcherds1986, §5, p. 5 of the author's copy): More generally if u is in P^i then [L_j, u_k] = ((j + 1)(i − 1) − k)u_{j+k}. Known: new.
- `QSeriesPartitionsAndMockModularForms/E708` (error, borcherds1992, §4, remark after Theorem 4.1, p. 15 of the author's copy): The converse needs a finiteness hypothesis allowing a grading with finite-dimensional pieces (for example finitely many simple roots with each column of the matrix); it fails in general. Known: Jurisich 1998 (arXiv:1311.3258), §4, remark before Theorem 4.1.

### Sources

- R. E. Borcherds, *Monstrous moonshine and monstrous Lie superalgebras*, Invent. Math. 109 (1992) 405–444; author's copy (41 pp.), page numbers of that copy, <https://math.berkeley.edu/~reb/papers/monster/monster.pdf>. Read: §1 Introduction and notation; §3 Vertex algebras; §4 Generalized Kac–Moody algebras; §5 The no-ghost theorem; §6 Construction of the monster Lie algebra; §7 Simple roots; §8 Twisted denominator formula; §9 The moonshine conjectures; §10 (opening paragraphs).
- R. E. Borcherds, *Vertex algebras, Kac–Moody algebras, and the Monster*, Proc. Natl. Acad. Sci. USA 83 (1986) 3068–3071; author's copy (9 pp.), <https://math.berkeley.edu/~reb/papers/va/va.pdf>. Read: §§1–5; §8; §9.
- R. E. Borcherds, *Generalized Kac–Moody algebras*, J. Algebra 115 (1988) 501–512; author's copy (10 pp.), <https://math.berkeley.edu/~reb/papers/gkma/gkma.pdf>. Read: §1 Definitions; §2 Geometry of the root system; §3 Characterization; §4 Lowest weight modules; §5 Examples.
- E. Jurisich, *Generalized Kac–Moody Lie algebras, free Lie algebras and the structure of the Monster Lie algebra*, J. Pure Appl. Algebra 126 (1998) 233–266; arXiv:1311.3258v1 (1996 preprint version), <https://arxiv.org/abs/1311.3258>. Read: §§1–6; Appendix A (proof of the no-ghost theorem).
- E. Jurisich, *Borcherds' proof of the Conway–Norton conjecture*, arXiv:0903.4456v1 (2009), <https://arxiv.org/abs/0903.4456>. Read: §§1–5.
- E. Jurisich, J. Lepowsky, R. L. Wilson, *Realizations of the Monster Lie algebra*, Selecta Math. (N.S.) 1 (1995) 129–161; arXiv:hep-th/9408037v1, <https://arxiv.org/abs/hep-th/9408037>. Read: §1 Introduction; §5 Application to Borcherds' proof (5.1–5.4).
- T. Gannon, *Monstrous moonshine: the first twenty-five years*, arXiv:math/0402345v2 (Bull. London Math. Soc. 38 (2006) 1–33), <https://arxiv.org/abs/math/0402345>. Read: §2 Modular functions and Hauptmoduln; §3 The Monstrous Moonshine conjectures (3.1–3.3); §4 Proof of the conjectures (4.3–4.4).
- A. Matsuo, K. Nagatomo, *On axioms for a vertex algebra and the locality of quantum fields*, arXiv:hep-th/9706118 (MSJ Memoirs 4, 1999), <https://arxiv.org/abs/hep-th/9706118>. Read: §1.5–1.6 locality; §3 Vertex algebras (3.1–3.3); §4 State-field correspondence; §5 Goddard's axioms and the existence theorem (5.1–5.4).
- B. Bakalov, V. G. Kac, *Generalized vertex algebras*, arXiv:math/0602072v1, <https://arxiv.org/abs/math/0602072>. Read: §3 (existence theorem, central extensions); §5 (the generalized vertex algebra V_h and lattice vertex algebras).
- J. S. Milne, *Modular Functions and Modular Forms (Elliptic Modular Curves)*, Course notes, version 1.31 (March 22, 2017), <https://www.jmilne.org/math/CourseNotes/MF.pdf>. Read: §4 Modular functions and modular forms (Proposition 4.3, Remark 4.4, Definition 4.5, Theorem 4.22); §5 Hecke operators (Lemma 5.13, Remarks 5.14–5.15, Proposition 5.16).

---

## Gaps

Each of these is something this packet could not establish from the sources read. None is papered over,
and every node that depends on one names it.

### Jacobi-symbol closed form of exp(πi s(h, k))

The identity between the Dedekind-sum root of unity exp(πi s(h, k)) of the eta multiplier and the Jacobi-symbol expressions of Hardy–Ramanujan (1.721)–(1.722), Lehmer (1.4)–(1.5) and Whiteman (1.2)–(1.3) is stated in those sources but proved in none read for this layer (its proofs are in Rademacher's 1932 Crelle paper, Rademacher–Grosswald's Dedekind Sums and Knopp's Modular Functions in Analytic Number Theory, Ch. 4, none of them public). It is equivalent to the Dedekind-sum congruences 12hk·s(h, k) ≡ h² + 1 (mod θk), θ = gcd(3, k), and 12k·s(h, k) ≡ k + 1 − 2(h | k) (mod 8) for k odd, with the even-k analogue. The identity was verified numerically for all k ≤ 40. Closing it needs either a public proof of these congruences or the Petersson–Rademacher Jacobi-symbol form of the eta multiplier as a node of QM.1, from which the lemma follows by comparing the two forms at (H, −K; k, −h). The exact formula, the asymptotic and the effective bounds do not depend on it.

Needed by: `QM.2/kloosterman-sum-rademacher-jacobi-form`, `QM.2/lehmer-exponent-form`, `QM.2/lehmer-exponent-congruences`, `QM.2/kloosterman-sum-rademacher-mul-odd`, `QM.2/kloosterman-sum-rademacher-mul-two-power`, `QM.2/kloosterman-sum-rademacher-double-odd`.

### Hickerson's identities for the seventh-order mock theta functions

Zwegers takes the indefinite double sums (Hickerson, Invent. Math. 94 (1988), p. 666) as the definitions of F₀, F₁, F₂. Their equality with Ramanujan's Eulerian series (F₀ = Σq^{n²}/(q^{n+1};q)_n, etc.) is Hickerson's theorem, not public and not planned (it is a formal q-series identity, naturally in QM.0's scope). The definitions and all QM.4 theorems stand without it; only the identification with Ramanujan's functions needs it. Checked numerically to q^{14} for F₀.

Needed by: `QM.4/seventh-order-mock-theta-functions`.

### Specialisation of Jacobi-type functions at torsion points (Eichler–Zagier Theorem 1.3) without growth condition

Zwegers Prop. 3.11 applies Eichler–Zagier Thm 1.3 to (u, τ) ↦ d_u(τ), which satisfies the Jacobi transformation laws but no growth condition. QM.1/jacobi-form must provide: if ϕ satisfies (E) of index m and (M) of weight k, then for α, β ∈ ℚ, τ ↦ e^{2πimα²τ}ϕ(ατ + β; τ) satisfies the weight-k transformation law on the finite-index subgroup Γ_{α,β}. Not confirmed in the QM.1 interface.

Needed by: `QM.4/residue-function-modularity`.

### Winquist's identity and the 11-dissection for the crank mod 11

The proof of M(k, 11, 11n + 6) = p(11n + 6)/11 needs Winquist's identity (J. Combin. Theory 6 (1969) 56–59) expressing (q;q)_∞²(a)_∞(q/a)_∞(b)_∞(q/b)_∞(ab)_∞(q/ab)_∞(a/b)_∞(qb/a)_∞ as a double theta series, and the 11-dissection of that series at a = ζ₁₁², b = ζ₁₁⁵ (Garvan, Trans. Amer. Math. Soc. 305 (1988), §6). Neither source was available (publisher pages refuse non-browser access), and no roadmap plans Winquist's identity; its natural owner is QSeriesPartitionsAndMockModularForms:QM.0 (formal q-series identities).

Needed by: `QM.5/crank-mod-eleven`, `QM.5/ramanujan-congruence-mod-eleven`.

### The rank dissections of Atkin–Swinnerton-Dyer

The 5- and 7-dissections of R(ζ₅; q) and R(ζ₇; q) (Atkin–Swinnerton-Dyer, Proc. London Math. Soc. (3) 4 (1954) 84–106; equivalently Ramanujan's lost-notebook identity (4.4) of Garvan's Urbana paper) are stated but not proved in the read sources.

Needed by: `QM.5/atkin-swinnerton-dyer-theorem`.

### Choi's identity and the Bringmann–Folsom dissection of Zwegers' R

Folsom–Ono–Rhoades quote Choi's identity (their Theorem 3.1, from Ramanujan's lost notebook Entry 3.4.7) and the dissection of R(v; z) from Bringmann–Folsom (their Lemma 3.4 cites [12, Proposition 2.3]); neither primary proof was read.

Needed by: `QM.5/choi-identity`, `QM.5/rank-mixed-mock-asymptotic`.

### Character and multiplier-system versions of the Bringmann–Rolen theorem

Bringmann–Rolen prove quantum modularity of f̃ for f ∈ S_k(N) with trivial character. Kontsevich's φ needs η (the η multiplier on SL₂(ℤ), or η(24τ) with character χ₁₂) and the Poincaré sphere needs the pair Θ± with a Weil-representation multiplier. The nodes adapt the proof (the multiplier replaces χ₋₄(d)ε_d^{2(2−k)}(c/d) in the transformation law, and periodic L-functions ZMod.LFunction replace Lemma 2.2), but no read source carries out the adaptation; Zagier (Topology 40, §6) and Lawrence–Zagier (§4) give only sketches.

Needed by: `QM.5/kontsevich-quantum-modular`, `QM.5/poincare-sphere-quantum-modular`.

### Special-function identities with complex parameters

The residue computation of Bringmann–Rolen Lemma 3.2 uses DLMF 8.14.6 (Mellin transform of the incomplete gamma function), DLMF 8.17.9 and A&S 26.5.2, 26.5.15 (incomplete beta), the Pfaff transformation DLMF 15.8.1, and Stirling's estimate DLMF 5.11.9 in vertical strips. None is in the pinned libraries (Tau Ceti's incomplete gamma and beta have positive real parameters), and no roadmap plans them with complex parameters; the nodes cite them rather than decompose them.

Needed by: `QM.5/incomplete-gamma-mellin-poles`, `QM.5/gamma-vertical-decay`.

### The Frenkel–Lepowsky–Meurman moonshine module V♮ and its Monster action

Needed statement: there is a real vertex operator algebra V♮ satisfying QM.6/moonshine-module-axioms (central charge 24, positive definite invariant form with trivial involution, q^{−1}·graded dimension = J, hence V♮_0 = ℝ1 and V♮_1 = 0) together with a finite group 𝕄_FLM ≤ Aut(V♮, ω, (·,·)) acting faithfully; moreover (FLM trace formula, Borcherds (9.2)) for g in the centralizer 2^{1+24}.Co₁ of a 2B element acting on the Leech lattice Λ by an odd-order fixed-point-free automorphism with eigenvalues ε_1, …, ε_24, 2Σ_n tr(g|V♮_{n+1})qⁿ = 1/η_g(q) + η_g(q)/η_g(q²) + η_g(q)/η_g(q^{1/2}) + η_g(q)/η_g(−q^{1/2}) with η_g(q) = Π_i η(ε_i q), and T_{2B} = q^{−1}Π(1 − q^{2n−1})^{24} + 24. Source: Frenkel–Lepowsky–Meurman, Vertex Operator Algebras and the Monster (Academic Press 1988), Theorem 12.3.1 and Corollary 12.5.4 (not public; the announcement PNAS 81 (1984) 3256–3260, PMC345262, is public but has no proofs). The construction needs the Leech lattice (no roadmap of the atlas constructs it; AlgebraicCodingTheory Layers 5–6 supply the Golay code and Construction A), its lattice vertex algebra V_Λ (node lattice-vertex-algebra), the ±1-twisted V_Λ-module, the fixed-point subalgebra V_Λ⁺ and the vertex algebra structure on V_Λ⁺ ⊕ (V_Λ^T)⁺, and the Griess algebra V♮_2. Public alternative constructions: Dong–Griess–Höhn, arXiv:q-alg/9707008 (framed vertex operator algebras); not decomposed here.

Needed by: `QM.6/monster-head-characters`, `QM.6/monstrous-moonshine-theorem`.

### Identification of the automorphism group of V♮ with the presented Monster

Needed statement: the group 𝕄_FLM (equivalently Aut(V♮, ω, (·,·))) is isomorphic to TauCeti.SporadicName.Group SporadicName.M, the Y₄₄₃ Coxeter group modulo the spider relator and Ivanov's f₃₁₂. Inputs: Ivanov, Y-groups via transitive extension, J. Algebra 218 (1999) 412–435 (Y₄₄₃/⟨f₃₁₂⟩ ≅ 𝕄 for the Monster of Griess/Conway) and the uniqueness of the Monster (Griess–Meierfrankenfeld–Segev, Ann. of Math. 130 (1989)); neither is decomposed in the atlas (CFSGStatement S1 records only the presentation).

Needed by: `QM.6/monstrous-moonshine-theorem`.

### Character table data of the Monster used in Borcherds' final step

Needed data (Conway–Curtis–Norton–Parker–Wilson, ATLAS of Finite Groups, 1985; not public): the irreducible characters χ_1, …, χ_7 of 𝕄 of degrees 1, 196883, 21296876, 842609326, 18538750076, 19360062527, 293553734298 are exactly the irreducibles of degree ≤ 333202640600; their values on the classes 2B, 3B, 5B, 7B, 9B, 13B, 15D (whose determinant is 35672555520 = 2^{22}·3^5·5·7); the power maps of 𝕄; and the correspondence of these classes with the Co₁ classes 3A, 5A, 7A, 9A, 13A, 15C (cycle shapes 3⁹/1³, 5⁶/1⁶, 7⁴/1⁴, 9³/1³, 13²/1², 15·5/3·1 in Borcherds' notation 3^{12}1^{−12} etc.). Formal verification needs a computer-checked character table of 𝕄 (RepresentationTheory/CharacterTheory Layer 6 algorithm is not applicable to 𝕄 directly).

Needed by: `QM.6/monster-head-characters`.

### The Conway–Norton functions and their replicability

Needed statements: for each conjugacy class [g] of 𝕄 the explicit moonshine-type group Γ_g ⊇ Γ₀(o(g)h), h | gcd(24, o(g)), and its normalized Hauptmodul t_g (Conway–Norton, Monstrous moonshine, Bull. London Math. Soc. 11 (1979) 308–339, Table 2; not public), with the Hauptmodul property verified group by group; and Koike's theorem (On replication formula and Hecke operators, Nagoya preprint; not public; also Ferenbaugh, J. Algebra 179 (1996), and Cummins–Norton, Canad. J. Math. 47 (1995)) that s ↦ t_{g^s} is a replication family in the sense of QM.6/completely-replicable-function; plus the first coefficients of t_g (Conway–Norton Table 4). Borcherds' route uses these as imported facts.

Needed by: `QM.6/monstrous-moonshine-theorem`.

### Invariant form on lattice vertex algebras (Dong; Frenkel–Huang–Lepowsky)

The proof in Jurisich 1998 Lemma 6.1 uses: V_L is an irreducible module over itself and every irreducible V_L-module is isomorphic to V_L for L even unimodular (C. Dong, Vertex algebras associated with even lattices, J. Algebra 161 (1993) 245–265), and the contragredient-module construction with its symmetry criterion (Frenkel–Huang–Lepowsky, Mem. AMS 104 (1993), §5.2–5.3); neither is decomposed here. A direct route (check the adjoint formula on the generating fields α(z), Y(e^β,z) for the Fock form twisted by θ and propagate it through products by the associativity formula) is the planned alternative but its propagation lemma is the missing FHL input.

Needed by: `QM.6/lattice-vertex-algebra-invariant-form`.

## Requests to other roadmaps

- **MetaplecticAutomorphicForms:MP.7** — Classical half-integral-weight automorphy factors and multiplier systems on SL(2, ℤ) and its finite-index subgroups: for r ∈ ½ℤ, γ = (a b; c d) ∈ SL(2, ℤ), τ ∈ ℍ, the principal-branch factor j(γ, τ)^r = exp(r·Log(cτ + d)) (arg ∈ (−π, π]); the sign cocycle σ_r(γ₁, γ₂) = j(γ₁, γ₂τ)^r j(γ₂, τ)^r / j(γ₁γ₂, τ)^r, independent of τ, in {±1}, equal to 1 for r ∈ ℤ and, for r ∈ ½ + ℤ, given by Petersson's rule σ(γ₁, γ₂) = −1 iff sgn γ₁ = sgn γ₂ ≠ sgn(γ₁γ₂), where sgn γ = +1 if c > 0 or (c = 0, d < 0) and −1 otherwise (Savitt, Lemma 4.6); the weight-r slash f|_rγ = j(γ, ·)^{−r}·f(γ·) with (f|γ₁)|γ₂ = σ_r(γ₁, γ₂)^{−1}·f|(γ₁γ₂); the definition of a multiplier system of weight r on a finite-index Γ ≤ SL(2, ℤ): v : Γ → ℂ with |v| = 1, v(γ₁γ₂) = σ_r(γ₁, γ₂)v(γ₁)v(γ₂) and v(−1) = e^{−πir} when −1 ∈ Γ; and the spaces of holomorphic, cuspidal and weakly holomorphic modular forms of weight r and multiplier v on Γ (holomorphic f with f|_rγ = v(γ)f, with the growth condition at every cusp measured through the cusp parameter κ ∈ [0, 1) of v). Needed by: `QM.1/eta-multiplier-is-multiplier-system`, `QM.1/eta-quotient-transformation`, `QM.1/eta-multiplier-gamma0-four`, `QM.1/theta-transformation-theta-group`, `QM.1/theta-multiplier-is-multiplier-system`, `QM.1/jacobi-form`, `QM.1/jacobi-cusp-form`, `QM.1/weak-jacobi-form`, `QM.1/weakly-holomorphic-jacobi-form`.
- **MetaplecticAutomorphicForms:MP.7** — Shimura's theta multiplier on Γ₀(4) as a theorem about the function θ(τ) = Σ_{n∈ℤ} e^{2πin²τ} (= Mathlib's jacobiTheta(2τ)): for every γ = (a b; c d) ∈ Γ₀(4) and τ ∈ ℍ, θ(γτ) = (c/d)·ε_d^{−1}·(cτ + d)^{1/2}·θ(τ), principal branch, where (c/d) is the extended Jacobi symbol ((c/d) = (c/|d|) for d > 0, (c/d) = sgn(c)·(c/|d|) for d < 0, (0/±1) = 1) and ε_d = 1 if d ≡ 1 (mod 4), ε_d = i if d ≡ 3 (mod 4); i.e. the automorphy factor j_θ(γ, τ) = θ(γτ)/θ(τ) that defines classical half-integral-weight forms M_{k/2}(Γ₀(4N), χ) in MP.7's convention. Needed by: `QM.1/theta-gamma-two-transformation`, `QM.1/theta-eta-multiplier-matches-shimura`.
- **MetaplecticAutomorphicForms:MP.7** — The classical metaplectic group Mp₂(ℤ) = {(γ, φ) : γ ∈ SL(2, ℤ), φ holomorphic on ℍ, φ(τ)² = cτ + d} with (γ₁, φ₁)(γ₂, φ₂) = (γ₁γ₂, φ₁(γ₂τ)φ₂(τ)), generated by T̃ = (T, 1) and S̃ = (S, √τ); for an even lattice L of signature (b⁺, b⁻) with discriminant group L′/L and q(x) = (x, x)/2, the Weil representation ρ_L : Mp₂(ℤ) → GL(ℂ[L′/L]) with ρ_L(T̃)e_α = e(q(α))e_α and ρ_L(S̃)e_α = i^{(b⁻−b⁺)/2}|L′/L|^{−1/2}Σ_β e(−(α, β))e_β (a representation: the relations S̃² = (S̃T̃)³, S̃⁸ = 1 hold); and the spaces of holomorphic and weakly holomorphic vector-valued modular forms of weight κ ∈ ½ℤ for ρ_L (f(γτ) = φ(τ)^{2κ}ρ_L(γ̃)f(τ)). Needed by: `QM.1/theta-decomposition-weil-representation`.
- **tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve** — For every finite-index subgroup Γ″ ≤ SL(2, ℤ) acting freely on ℍ (e.g. Γ(3) ∩ core(Γ)): the compactified modular curve X(Γ″) as a compact Riemann surface with charts q_c = e(σ_c^{−1}τ/h_c) at the cusps c (width h_c), and the divisor D = Σ_c c of the cusps. Needed by: `QM.3/xi-surjective-free-normal`, `QM.3/borcherds-obstruction-theorem`.
- **tauceti:TauCetiRoadmap/ModularForms#10b--compact-riemann-surface-cohomology** — For a holomorphic line bundle L on a compact Riemann surface X: (a) Dolbeault — every smooth L-valued (0,1)-form ω is ∂̄f for a smooth section f whenever H¹(X, L) = 0 (equivalently H¹(X, L) ≅ E^{0,1}(X, L)/∂̄E^{0,0}(X, L)); (b) Serre duality for invertible sheaves, H¹(X, L)^∨ ≅ H⁰(X, Ω ⊗ L^{−1}) with the residue pairing; (c) Mittag-Leffler: for a non-empty finite set S ⊂ X, the obstruction to meromorphic sections of L holomorphic off S with prescribed principal parts at S is H¹(X, L), dual to H⁰(X, Ω ⊗ L^{−1}) via residues. Needed by: `QM.3/xi-surjective-free-normal`, `QM.3/borcherds-obstruction-theorem`.
- **tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas** — For Γ″ as above and every k ∈ ℤ (odd k allowed, −I ∉ Γ″): the weight-k automorphy line bundle L_k on X(Γ″) whose sections over U are the Γ″-invariant weight-k holomorphic functions on π^{−1}(U) holomorphic at the cusps in U; the isomorphism Ω_X ≅ L_2 ⊗ O(−D) (weight-2 cusp forms = holomorphic differentials); and H⁰(X, L_κ ⊗ O(−nD)) = 0 for n > κ·[PSL₂(ℤ) : Γ̄″]/12 (valence bound). Needed by: `QM.3/xi-surjective-free-normal`, `QM.3/borcherds-obstruction-theorem`.
- **AutomorphicLFunctionsAndLocalFactors:AL.0** — Poisson summation on ℝ^r for the lattice ℤ^r (the archimedean, lattice form of the adelic Poisson summation of AL.0): for f a Schwartz function on ℝ^r with Fourier transform f̂(ξ) = ∫_{ℝ^r} f(x)e^{−2πi⟨x,ξ⟩}dx, Σ_{n∈ℤ^r} f(n + x) = Σ_{m∈ℤ^r} f̂(m)e^{2πi⟨m,x⟩} for all x ∈ ℝ^r, both sides absolutely convergent. Mathlib 082e2d3 has only the case r = 1 (Real.tsum_eq_tsum_fourier_of_rpow_decay, SchwartzMap.tsum_eq_tsum_fourier). Needed by: `QM.4/indefinite-theta-s-transformation`.
- **HabiroCyclotomicCompletions:HC.1** — The Habiro ring ℤ[q]^ = lim_n ℤ[q]/((q;q)_n) as a complete topological ring, with the convergence criterion that Σ_n a_n(q)(q;q)_n converges for arbitrary a_n ∈ ℤ[q] (more generally Σ b_n with b_n ∈ ((q;q)_{m_n}), m_n → ∞). QM.5 defines Kontsevich's F = Σ (q;q)_n as an element of this ring. Needed by: `QM.5/kontsevich-strange-series`.
- **HabiroCyclotomicCompletions:HC.3** — For every root of unity ξ: the evaluation ring homomorphism ev_ξ : ℤ[q]^ → ℤ[ξ] with ev_ξ(Σ a_n(q;q)_n) = Σ_{n<ord ξ} a_n(ξ)(ξ;ξ)_n, independent of the truncation; the Taylor map T_ξ : ℤ[q]^ → ℤ[ξ][[q − ξ]] whose constant term is ev_ξ, and its composite with the substitution q = ξe^{−t} into ℂ[[t]]; compatibility with field automorphisms, σ(ev_ξ F) = ev_{σ(ξ)} F. Needed by: `QM.5/kontsevich-strange-series`, `QM.5/poincare-sphere-unified-invariant-radial-limit`.
- **HabiroCyclotomicCompletions:HC.4** — Evaluation rigidity for ℤ[q]^ (Habiro, Cyclotomic completions, Theorem 6.1 in its infinite-set form): an element whose evaluations ev_ξ vanish at all roots of unity is zero. QM.5 uses it to say that a Habiro element is determined by the radial limits it is compared with. Needed by: `QM.5/poincare-sphere-unified-invariant-radial-limit`.
- **ArithmeticQuantumTopology:QT.4** — (a) The Lawrence–Rozansky closed formula for the sl₂ WRT invariant Z(ξ) of the Poincaré homology sphere Σ(2, 3, 5) at every root of unity ξ of order K: with ζ a primitive 120K-th root of unity with ζ^{120} = ξ and G = Σ_{β mod 60K}ζ^{−β²}, ξ(ξ − 1)Z(ξ) = (2G)^{−1}Σ_{β mod 60K, K∤β}(1 − ζ^{24β})(1 − ζ^{40β})/(1 + ζ^{60β})·ζ^{−(β+1)²}, in the orientation of Σ(2, 3, 5) and the normalisation Z(S³) = 1 of QT.4/WRT-invariant-at-a-root. (b) Lawrence's closed form of the Ohtsuki series of Σ(2, 3, 5): with W_∞(h) = h(1 + h)Z_∞(h), 2(1 + h)^{1/120}W_∞(h) = (1 + h)^{30(B̄−4/15)²} − (1 + h)^{30(B̄−1/15)²}, where the powers of B̄ are the modified Euler numbers with e^{zB̄} = sech(z/4), in the normalisation of QT.4/ohtsuki-series. Needed by: `QM.5/lawrence-zagier-radial-limit`, `QM.5/lawrence-zagier-ohtsuki-expansion`, `QM.5/poincare-sphere-unified-invariant-radial-limit`.
- **MetaplecticAutomorphicForms:MP.7** — Classical half-integral weight forms: for k ∈ ½ + ℕ₀ and 4 | N, the cusp forms S_k(N, χ) on Γ₀(N) with Shimura's multiplier f|_kγ = ε_d^{2k}(c/d)(cτ + d)^{−k}f(γτ), decaying exponentially at every cusp; the decomposition S_k(Γ₁(N)) = ⊕_χ S_k(N, χ); the Fricke involution g|_kW_M ∈ S_k(M, χ(M/·)); and, for weakly holomorphic forms on Γ₀(4), Kohnen's plus space M^{!,+}_{k+1/2} with the operator U₄ and the facts that for g ∈ M^{!,+}_{3/2} and θ = Σq^{n²}, (gθ)|U₄ ∈ M^!_2(SL₂(ℤ)) and [g, θ]|U₄ ∈ M^!_4(SL₂(ℤ)) for the first Rankin–Cohen bracket [g, θ] = g′θ − 3gθ′. Needed by: `QM.5/nonholomorphic-eichler-integral`, `QM.5/nonholomorphic-eichler-transformation`, `QM.5/nonholomorphic-eichler-nontangential-limit`, `QM.5/twisted-cusp-form-l-function`, `QM.5/zagier-trace-form`, `QM.5/zagier-trace-form-recursions`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus** — The normalised modular invariant j = E₄³/Δ on ℍ (module ModularForms.LevelOne.JInputs), its SL₂(ℤ)-invariance and q-expansion j = q⁻¹ + 744 + 196884q + ⋯, the identities (2πi)⁻¹dj/dτ = −E₄²E₆/Δ and j − 1728 = E₆²/Δ, and its injectivity on SL₂(ℤ)\ℍ (from the X(1) ≃ ℙ¹ statement of layer 10). Needed by: `QM.5/modular-trace`, `QM.5/weight-two-heegner-function`, `QM.5/modular-diagonal-log-derivative`, `QM.5/weight-two-trace-proposition`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-11-the-eichlerselberg-trace-formula-level-one** — The Hurwitz class numbers H(D) defined by reduced positive definite binary quadratic forms of discriminant −D with the weights 1/2 and 1/3, with H(3) = 1/3, H(4) = 1/2; QM.5 identifies Σ_{Q∈Q_d/Γ}1/w_Q with H(d) and uses H(d) as the constant terms of the functions Λ_d. Needed by: `QM.5/heegner-quadratic-forms`, `QM.5/weight-two-heegner-function`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields** — The integral-weight Eichler integral of a cusp form f = Σ a_mq^m of weight k ≥ 2, Σ_{m≥1}(a_m/m^{k−1})q^m (eichlerCoeff), with Bol's identity D^{k−1}f̃ = f; QM.5's eichler-integral extends this convention to real weight and must agree with it for integer weight. Needed by: `QM.5/eichler-integral`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus** — The normalized modular function j := E₄³/Δ : ℍ → ℂ (the JInputs module of Layer 0): j is holomorphic on ℍ and SL₂(ℤ)-invariant, τ ↦ e^{2πiτ}j(τ) is bounded as Im τ → ∞, and j(τ) = Σ_{n≥−1} c_j(n)e^{2πinτ} for all τ ∈ ℍ (absolutely convergent) with c_j(−1) = 1, c_j(0) = 744, c_j(1) = 196884 and all c_j(n) ∈ ℤ; in Laurent-series form, the Laurent q-expansion of j equals q^{−1}E₄(q)³Π_{n≥1}(1 − qⁿ)^{−24}, E₄(q) = 1 + 240Σσ₃(n)qⁿ. Needed by: `QM.6/hecke-transform-of-j`, `QM.6/j-laurent-series`, `QM.6/j-normalized-hauptmodul`, `QM.6/modular-function-polynomial-in-j`.
- **tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra** — Level-one coset representatives for the Hecke operators at every n ≥ 1: the set M(n) of integer 2×2 matrices of determinant n is the disjoint union of the cosets SL₂(ℤ)·(a b; 0 d) over a, d ≥ 1 with ad = n and 0 ≤ b < d, and for every γ ∈ SL₂(ℤ) right multiplication by γ permutes these cosets (stated for arbitrary functions ℍ → ℂ invariant under SL₂(ℤ), in weight 0, so that it applies to functions with poles at the cusp). Needed by: `QM.6/weakly-holomorphic-hecke-operator`.
- **tauceti:TauCetiRoadmap/ModularForms#10a--the-analytic-modular-curve** — For N ≥ 1, the cusps of Γ₀(N) are the Γ₀(N)-orbits on ℙ¹(ℚ) with the explicit representatives of the layer; in particular Γ₀(2) has exactly two cusps, represented by ∞ and 0, with widths 1 and 2. Needed by: `QM.6/gamma0-two-hauptmodul`.
- **tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups** — A discrete subgroup Γ ≤ SL₂(ℝ) containing the image of Γ₀(N) for some N ≥ 1 is a cofinite Fuchsian group; Γ₀(N) has finite index in Γ, and the parabolic fixed points of Γ are exactly ℚ ∪ {∞}. Needed by: `QM.6/moonshine-type-modular-group`.
- **tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-3-cusps-and-q-coordinates** — For a cofinite Fuchsian group Γ with (1 t; 0 1) ∈ Γ ⟺ t ∈ ℤ: the cusp datum at ∞ has width 1 and q-coordinate e^{2πiτ}; the Laurent/q-expansion criterion: a Γ-invariant holomorphic function on ℍ that is O(|q|^{−N}) near ∞ descends and extends meromorphically over the cusp with pole order ≤ N, and one bounded near a cusp extends holomorphically. Needed by: `QM.6/hauptmodul-genus-zero`.
- **tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-4-compactified-quotient-riemann-surfaces** — The compactified quotient X(Γ) of a cofinite Fuchsian group Γ is a compact connected Riemann surface, with cusp charts given by the q-coordinates. Needed by: `QM.6/hauptmodul-genus-zero`.
- **tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications** — Degree theory on compact Riemann surfaces: a nonconstant meromorphic function on X(Γ) with exactly one pole, of order one, defines a holomorphic map X(Γ) → ℙ¹ of degree one, hence a biholomorphism (RiemannSurface.biholomorph_of_degree_eq_one) and genus X(Γ) = 0; descent of Γ-invariant meromorphic functions to X(Γ). Needed by: `QM.6/hauptmodul-genus-zero`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine** — For the sl₂-triple of a real Lie algebra acting on a module that is a direct sum of finite-dimensional sl₂-modules with integral h-weights (for example a locally finite module): complete reducibility into the V(n), and for a finite-dimensional module M with weight spaces M_μ, the maps e^k : M_{−j} → M_{−j+2k} are injective for 0 ≤ k ≤ j (and f^k symmetrically); an integrable lowest-weight module generated by a vector of weight −n (n ∈ ℕ) is the (n+1)-dimensional irreducible V(n). Needed by: `QM.6/borcherds-algebra-free-subalgebra`, `QM.6/borcherds-characterisation-theorem`, `QM.6/monster-lie-algebra-free-decomposition`, `QM.6/monster-lie-algebra-simple-roots`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ** — The Poincaré–Birkhoff–Witt theorem for an arbitrary (possibly infinite-dimensional) Lie algebra L over a field of characteristic 0: the PBW filtration of U(L) has associated graded algebra canonically isomorphic to Sym(L), naturally in Lie algebra homomorphisms (in particular equivariant for Lie algebra automorphisms), with the ordered-monomial basis for any well-ordered basis of L; consequences U(L) = U(L₁)U(L₂) for L = L₁ ⊕ L₂ as vector spaces with L₁, L₂ subalgebras. Needed by: `QM.6/free-lie-algebra-character-formula`, `QM.6/no-ghost-spurious-states`, `QM.6/no-ghost-transverse-space`.

## Structural proposals

Recorded in the packet's `restructure` list. This packet works with the current structure.

### `rescope`: QSeriesPartitionsAndMockModularForms, ArithmeticStatistics

ArithmeticStatistics:ST.5 plans ArithmeticStatistics:ST.5/gaussian-binomial-coefficient (gaussBinom t n k by the q-Pascal recursion, product formula, symmetry, value at 1, and the count of k-dimensional subspaces of 𝔽_q^n) and ArithmeticStatistics:ST.5/cauchy-q-binomial-theorem (the finite q-binomial theorem ∏(1 + tⁱz) = ∑ t^{k(k−1)/2}[n, k]_t z^k). QM.0 plans the same objects as QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-coefficient (a polynomial over every commutative semiring, with both Pascal rules, symmetry, factorial and q-Pochhammer forms, degree, palindromy and the partitions-in-a-box theorem) and QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-theorem (Rothe's theorem in every commutative ring). The audit also records that HabiroNahmSeries:HB.4 defines q-Pochhammer products analytically.

**Proposal.** One owner (PROTOCOL §15, the most foundational roadmap): QM.0 owns the Gaussian polynomials, the q-binomial theorem and the formal q-Pochhammer symbols. ST.5 keeps only the subspace count #{W ≤ 𝔽_q^n : dim W = k} = [n, k](q) (Stanley's Proposition 1.7.2) as a lemma with prerequisite QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-coefficient, reads gaussBinom t n k as the evaluation of qBinomial at t, and replaces ST.5/cauchy-q-binomial-theorem by QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-theorem. HB.4 imports QSeriesPartitionsAndMockModularForms:QM.0/q-pochhammer and obtains its analytic products as the evaluations of QSeriesPartitionsAndMockModularForms:QM.0/evaluation-of-formal-products (API item hasSum_eval_qPochhammerInf) instead of defining them again.

### `rescope`: QSeriesPartitionsAndMockModularForms, MetaplecticAutomorphicForms

The atlas records a stage edge MetaplecticAutomorphicForms:MP.8 → QSeriesPartitionsAndMockModularForms:QM.1, and the library audit lists MP.8 and QM.1 as both defining Jacobi forms and theta decomposition. QM.1 needs nothing from MP.8: classical Jacobi forms on SL(2, ℤ) ⋉ ℤ² (Eichler–Zagier), their slash operators, Fourier expansion, theta decomposition and the Jacobi theta function are built here from Mathlib and MP.7 alone. MP.8's object is the Jacobi group inside the specific double cover of GSp(4) used by Bump–Friedberg–Hoffstein, with half-integral-weight Jacobi forms and Fourier–Jacobi/Whittaker expansions.

**Proposal.** QM.1 owns the classical Jacobi forms on SL(2, ℤ) ⋉ ℤ² of weight k ∈ ½ℤ and index m ∈ ½ℤ with multiplier system and character (nodes QM.1/jacobi-modular-slash … QM.1/theta-decomposition-weil-representation). MP.8 keeps the GSp(4)-cover Jacobi group, cover-specific Jacobi forms and Fourier–Jacobi expansions, and imports QM.1's slash operators, Fourier characterisation and theta decomposition wherever its objects restrict to SL(2, ℤ) ⋉ ℤ². Replace the edge MP.8 → QM.1 by QM.1 → MP.8 (no cycle arises: MP.7 → QM.1 → MP.8 and MP.7 → MP.8).

### `rescope`: MetaplecticAutomorphicForms, QSeriesPartitionsAndMockModularForms

The finite Weil representation ρ_L of Mp₂(ℤ) attached to an even lattice, and vector-valued modular forms for ρ_L, are used by QM.1 (theta decomposition, J_{k,m} ≅ M_{k−1/2}(ρ_{L(−1)})), by QM.3 (Bruinier–Funke's harmonic Maass forms H_{k,L} take values in ℂ[L′/L]) and by QM.4 (vector-valued completions), but no stage names them. MetaplecticAutomorphicForms owns 'the extension to the metaplectic cover and the Weil representation' and MP.7 compares classical half-integral-weight forms with the cover.

**Proposal.** Add to MP.7's scope, explicitly: the classical group Mp₂(ℤ), the Weil representation ρ_L of an even lattice (with the relations that make it a representation, via Milgram's formula), and the spaces of holomorphic and weakly holomorphic vector-valued modular forms of weight κ ∈ ½ℤ for ρ_L; QM.1, QM.3 and QM.4 import them (request recorded by QM.1).

### `rescope`: QSeriesPartitionsAndMockModularForms, ExponentialSumsAndCircleMethod

The stage edge ExponentialSumsAndCircleMethod:ES.3 → QSeriesPartitionsAndMockModularForms:QM.2 carries no dependency: QM.2's circle method uses the Farey dissection of ClassicalArithmeticCompletion:CA.2, the eta transformation of QM.1 and its own Ford-circle and Bessel nodes, and nothing from ES.3's singular integrals or p-adic local densities (the two share only the words 'circle method').

**Proposal.** Drop the edge ES.3 → QM.2; QM.2's inputs are QSeriesPartitionsAndMockModularForms:QM.1 and ClassicalArithmeticCompletion:CA.2.

### `rescope`: ExponentialSumsAndCircleMethod, QSeriesPartitionsAndMockModularForms

Kloosterman sums and the Weil bound are planned by no layer of the atlas; ExponentialSumsAndCircleMethod's layers name Weyl differencing, van der Corput, completion of sums and Vinogradov mean values but not Kloosterman sums. QM.2 plans only Rademacher's sum A_k(n) of the eta multiplier system.

**Proposal.** Name the classical Kloosterman sum S(m, n; c), the Weil bound |S(m, n; p)| ≤ 2√p and the Kloosterman sums of general multiplier systems (Rademacher 1940, p. 67; Pribitkin–Williams, Lemma 2) as targets of ExponentialSumsAndCircleMethod:ES.0, with QM.2's A_k(n) proved to be the case of the eta multiplier there.

### `rescope`: QSeriesPartitionsAndMockModularForms, ArithmeticQuantumTopology

The reviewed audit records ArithmeticQuantumTopology:QT.7 as owner of 'the quantum-modularity statements … which QM.5 imports'. QT.7 has no nodes (its packet coverage is not_read) and its stage text is about knot invariants and conjectures, while the definition of quantum modular form, Eichler integrals of half-integral weight and the proved q-series examples (Kontsevich, Lawrence–Zagier, radial limits of mock theta functions) are q-series mathematics that QM.5 decomposes here.

**Proposal.** QM.5 owns the definition QSeriesPartitionsAndMockModularForms:QM.5/quantum-modular-form and the q-series examples; QT.7 keeps the quantum-modularity statements for knot invariants (Kashaev invariants, Zagier's Example 5 and its conjecture) and imports the definition, with a new stage link QM.5 → QT.7 (no cycle: QT.4 → QM.5 and QT.4 → QT.6 → QT.7 already hold).

### `rescope`: QSeriesPartitionsAndMockModularForms, HabiroNahmSeries, AnalyticNumberTheory

The general Euler–Maclaurin asymptotic Σ f((m + a)t) ∼ I_f/t − Σ b_nB_{n+1}(a)tⁿ/(n + 1) is planned here as QM.5/euler-maclaurin-asymptotic because no packet plans it; HabiroNahmSeries:HB.4 lists Euler–Maclaurin estimates inside its radial asymptotics and AnalyticNumberTheory:AN.0 plans summation methods.

**Proposal.** Keep the lemma in QM.5 (in the general form above) and let HB.4 import it; if AN.0's blueprint plans Euler–Maclaurin summation with remainder, QM.5 imports that instead and keeps only the periodic corollary.

### `split`: QSeriesPartitionsAndMockModularForms

QM.5 carries about seventy declarations in four independent strands, too broad to read as one star.

**Proposal.** Sub-layers of QM.5 for the atlas: QM.5a 'Radial limits, Eichler integrals and quantum modular forms' (radial-limit … twisted-l-value-quantum-modular, hurwitz-zeta-at-zero … renormalised-sum); QM.5b 'Kontsevich, Cohen and the Poincaré sphere' (kontsevich-strange-series … kontsevich-quantum-modular, cohen-*, lawrence-zagier-*, poincare-sphere-*); QM.5c 'Partition statistics and mock theta radial limits' (partition-crank … ramanujan-radial-limit-claim); QM.5d 'Traces of singular moduli' (heegner-quadratic-forms … zagier-traces-theorem).

### `rescope`: QSeriesPartitionsAndMockModularForms

QM.6 is broad (63 nodes). For the atlas, divide it into four sub-layers along the proof chain; each node keeps parentStageId QM.6.

**Proposal.** QM.6a Vertex algebras and lattice vertex algebras: vertex-algebra, vertex-algebra-vacuum-translation, vertex-algebra-commutator-formula, vertex-algebra-skew-symmetry, vertex-algebra-lie-algebra, vertex-algebra-automorphism, vertex-algebra-existence-theorem, vertex-algebra-tensor-product, virasoro-algebra, conformal-vector, conformal-vector-virasoro-representation, vertex-operator-algebra, invariant-bilinear-form, tensor-product-conformal-structure, graded-trace, mckay-thompson-series, even-lattice-double-cover, lattice-vertex-algebra, lattice-vertex-algebra-invariant-form, lorentzian-lattice-II11; QM.6b The no-ghost theorem and the Monster Lie algebra: physical-space, physical-lie-algebra, no-ghost-operator-adjoints, no-ghost-transverse-generation, no-ghost-transverse-space, no-ghost-spurious-states, no-ghost-physical-decomposition, no-ghost-theorem, moonshine-module-axioms, monster-lie-algebra, borcherds-algebra, borcherds-algebra-triangular-decomposition, borcherds-algebra-central-extension, borcherds-characterisation-theorem, lazard-elimination, graded-trace-exterior-symmetric-power, free-lie-algebra-character-formula, borcherds-algebra-free-subalgebra, monster-lie-algebra-is-borcherds-algebra, monster-lie-algebra-simple-roots, monster-lie-algebra-free-decomposition; QM.6c The product formula for j and replication: j-laurent-series, laurent-q-expansion, weakly-holomorphic-modular-function, modular-function-polynomial-in-j, formal-hecke-operator, weakly-holomorphic-hecke-operator, hecke-transform-of-j, polynomial-in-j-principal-part, formal-product-logarithm, j-product-formula, twisted-denominator-identity, completely-replicable-function, replication-recursion, moonshine-module-complete-replicability; QM.6d Hauptmoduln and monstrous moonshine: moonshine-type-modular-group, normalized-hauptmodul, hauptmodul-genus-zero, j-normalized-hauptmodul, gamma0-two-hauptmodul, moonshine-identity-thompson-series, monster-head-characters, monstrous-moonshine-theorem

### `rescope`: QSeriesPartitionsAndMockModularForms, ModularCurvesPartII, tauceti:TauCetiRoadmap/ModularCurves, tauceti:TauCetiRoadmap/FuchsianOrbifolds, tauceti:TauCetiRoadmap/ModularForms, tauceti:TauCetiRoadmap/RepresentationTheory

The genus-zero and Hauptmodul statements of QM.6 are analytic (compact Riemann surfaces X(Γ) for moonshine-type Γ, which need not lie in SL₂(ℤ), e.g. Γ₀(2)+). The planned chain consumes FuchsianOrbifolds Layers 2–5 (cofinite groups, cusps, compactification, degree one), ModularForms Layers 0 (j), 2 (coset representatives) and 10A (cusps of Γ₀(N)), and LieHighestWeight Layers 0 (sl₂) and 3 (PBW). It does not use the algebraic compactification comparison of ModularCurvesPartII R12.3, the Tate curve of R13.3, the coarse algebraic curves of R13.4a or ModularCurves Layer 10 (the RS-06 links into QM.6). The edge QM.1 → QM.6 carries only the eta products η_g of Borcherds (9.2), which occur inside the gap on the FLM module. Inside the roadmap QM.6 also consumes QM.3 (weakly holomorphic modular forms and their Laurent expansions, specialized to weight 0 and level one) and QM.0 (the q-Pochhammer symbol), which the atlas does not yet record as stage edges.

**Proposal.** Replace the stage edges ModularCurvesPartII:R12.3 → QM.6 and the RS-06 links R13.3, R13.4a, ModularCurves Layer 10 → QM.6 by FuchsianOrbifolds Layers 2, 3, 4, 5 → QM.6 and ModularForms Layers 0, 2 → QM.6 (keep ModularForms 10A → QM.6); replace UPSTREAM:RepresentationTheory → QM.6 by LieHighestWeight Layers 0 and 3 → QM.6; keep QM.1 → QM.6 for the eta products of the Monster-specific step; add the in-roadmap edges QM.0 → QM.6 and QM.3 → QM.6.

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json --index <pinned declaration index>

Zero errors and zero warnings. The suggested Lean file elaborates against Mathlib `082e2d3` with `lake env lean`;
its only messages are `declaration uses 'sorry'` warnings. Every API item and unit test of the packet occurs in it
under its packet name.
