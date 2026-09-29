# PAPER-GAROUFALIDIS-SCHOLZE-WHEELER-ETAL-24 — extraction and routing

Agent: Claude Code. Session: cc-58621d. Issue: #4515. Status: complete extraction, awaiting its
independent review. This session wrote the result file, so it cannot review or red-team it.

## Outcome

The result lists **151 items: 6 library, 133 planned and 12 missing**. There are four `source`
routes, which send the 12 missing items to the Habiro roadmaps the paper was built for, and no new
roadmap. It also records **67 mistakes** in the paper. 49 of them were already in the
HabiroNumberFields and HabiroNahmSeries blueprint packets; they were re-checked here at their v2
locators and are cross-referenced by `alsoRecordedAs`. The other 18 are new.

## The source read

The whole of arXiv 2412.04241v2 was read, 73 pages and the references, together with its LaTeX
source. The PDF's SHA-256 is `308d1dd1…73de9`; its title page is dated 13 August 2025, and it was
posted on 27 August 2025. Every page and equation number in the result refers to v2.

Two other versions were compared with it:

- **arXiv v1** (5 December 2024), compared at every recorded mistake through the LaTeX source. v1
  lacks §§1.1 and 1.8, so its §1 subsections are numbered one lower. Every mistake recorded here is
  also in v1, except E67, the duplicated reference, which v2 introduced.
- **The authors' copy** on Garoufalidis's web page. It has the same title-page date, but its
  prologue, §1.2 and §1.8 are reworded. A word-level comparison with v2 found no other change
  beyond layout, and each quoted passage is unchanged.

There is no journal version. Crossref and a web search on 29 September 2026 found neither a journal
record nor an erratum. The MPIM preprint (2024-31) is the v1 text.

## What the paper proves

Let K be a number field and R = O_K[1/Δ], with disc(K) and 6 dividing Δ.

- **The Habiro ring H_R** (Definition 1.1) consists of families of power series at all roots of
  unity with coefficients in R[ζ_m]. They glue p-adically after a Frobenius twist:
  f_m(x + ζ_{pm} − ζ_m) = φ_p f_{pm}(x).
- **The modules H_{R,ξ}** (Definitions 1.3–1.4) are indexed by ξ ∈ K_3(K). Their families have
  leading terms ε_m(ξ)^{1/m}, the Chern-class units of Calegari–Garoufalidis–Zagier. They glue only
  after the p-adic modification D_p(ξ)/(m² log q), where D_p is Coleman's p-adic dilogarithm.

The main theorems:

- **Theorem 1.** The local modules are free of rank one.
- **Theorem 9.** For p > 3 unramified, D_p : K_3(K_p; Z_p) ≅ p²O_{K_p}, and roots of unity
  generate. Theorem 1 rests on it, on Dwork's lemma, and on the explicit Pochhammer sections of
  Theorem 10.
- **Theorem 2.** H_{R,0} = H_R, and ξ ↦ H_{R,ξ} is multiplicative.
- **Theorem 5**, the main result. For a symmetric integral matrix A and a non-degenerate solution z
  of Nahm's equations, the perturbative series f_{A,z} of complex Chern–Simons theory lie in
  H_{R[δ^{−1/2}],ξ}|_Δ. Four ingredients prove it:
  - the Nahm sums F_A are admissible in the sense of Kontsevich–Soibelman (Theorem 6);
  - their congruence sums are admissible at level m (Theorem 7);
  - the admissible and formal-Gaussian series coincide (Theorems 3 and 8);
  - a Dwork-type Frobenius congruence holds (Theorem 4).
- **Corollaries 1.10–1.11 and Theorems 11–12.** They give constant terms, the symmetrisation
  f(q)f(q^{−1}), and torsion powers in the Habiro ring, with a residue formula for the
  symmetrisation.

Sections 4 and 5:

- **§4** works out examples: the rank-one series A = (3) and its Donaldson–Thomas invariants; the
  60-torsion matrix (8 5; 5 4); the knots 4_1, 5_2 and the (−2,3,7) pretzel; a 5-adic instance of
  Theorem 9; and Gauss sums and Rogers–Ramanujan.
- **§5** describes the classical Habiro ring inside the functions near roots of unity by explicit
  congruences of index D(N) (Propositions 5.1–5.2), and the number-field ring by the same
  congruences twisted by Frobenius (Propositions 5.3–5.4).
- **§5.4** gives "wilder" Habiro-like elements, whose expansions at different roots of unity live
  over different fields.

## What the libraries and the atlas have

The library search covered 28 groups of concepts at the pinned commits. None of the paper's
objects exists in Mathlib or Tau Ceti:

- Habiro rings;
- q-Pochhammer symbols (a Mathlib TODO);
- polylogarithms, the Bloch–Wigner function, and p-adic logarithms and Coleman integration;
- Bloch groups, and K-theory above K₀;
- Dwork's lemma;
- formal Gaussian integration.

This matches the reviewed library audit (`data/library-coverage.json`), where every Habiro layer is
"not built". The six library items are tools:

- Bernoulli polynomials (with B₁ = −½, as in the paper);
- Picard groups and invertible modules;
- Teichmüller lifts in unramified extensions (Tau Ceti);
- cyclotomic discriminants;
- the Chinese remainder decomposition;
- adic completion of a finite module.

The atlas was designed around this paper (`papers.json` says so):

| Part of the paper | Layers that plan it |
| --- | --- |
| The ring and the modules | HabiroNumberFields HB.6–HB.7, fed by HB.1–HB.2 (the CGZ units) |
| Admissibility, the formal-Gaussian comparison, Theorems 4–5 and the examples | HabiroNahmSeries HB.8, HB.9, HB.10 |
| Nahm's equations | HabiroNahmSeries HB.3 |
| Theorem 9 and the p-adic dilogarithm | PadicHodgeRegulators D.1–D.4, with ColemanIntegration L2 |
| The classical ring | HabiroCyclotomicCompletions |
| The finite-étale claim and the relative ring of §4.2 | HabiroRings HR.4–HR.5 |
| K-theory inputs | ArithmeticKTheory N.2, MotivicEtaleKTheory M.7–M.8, K3BlochGroups V.3–V.4 |

So 133 items are planned, most with the exact theorem as their layer's target.

## Why these routes

Every missing item extends a layer that already exists, so every route is a `source` route.

1. **HabiroCyclotomicCompletions (HC.2, HC.4, HC.6)** takes five items:
   - the filtrations and graded pieces of §5.1;
   - the leading coefficients D_{m,ℓ} = m^{2ℓ−1}(ℓ − 1)! of (q;q)_{mℓ−1};
   - Proposition 5.1, in its corrected form |det M_N| = D(N − 1);
   - Proposition 5.2, the congruence test;
   - the first congruences and their identification with Ohtsuki's.

   Together they give a finite-precision, lattice-theoretic description of the completion (HC.2)
   and a second proof of Habiro's injectivity (HC.4). Examples 5.6–5.7 are ready acceptance tests
   for HC.6.
2. **HabiroNumberFields (HB.6, HB.7)** takes three items:
   - Proposition 5.4, the Frobenius-twisted congruence test for H_R, which Example 5.8 applies to
     the cubic field of discriminant −23;
   - Remark 5.5, its analogue for the modules;
   - Remark 3.8, the meromorphic continuation of the formal completion of a local section.

   All three extend the ring and module layers and need nothing else. The route also carries the
   corrections these layers must build on: Definition 1.3 (E9), Remark 1.2 (E5), footnote 1 (E2)
   and Theorem 2 (E41).
3. **HabiroNahmSeries (HB.8–HB.10)** takes the four items of §5.4. These are the series
   Σ∏P(q^j w)t^k, their residues, and Examples 5.9 and 5.10. For P = (−w)^a(1 − w)^b they are
   exactly the residue construction of §4.1, which gives Theorems 11–12. So they are examples of
   HB.9's machinery and belong with HB.10. The value (360) is conjectural in the paper and stays so.
4. **PadicHodgeRegulators (D.1, D.3, D.4)** takes no missing item. The paper is the source of D.3,
   and the route records what D.3 must supply beyond the printed proof of Theorem 9 (E38, E39). It
   also gives Example 4.3, recomputed here, as an acceptance test.

**Prerequisites.** Ten works the atlas does not yet cover are listed:

- Kontsevich–Soibelman and Efimov, for Theorem 6;
- Coleman 1982, the p-adic dilogarithm;
- Besser–de Jeu's algorithm paper, whose Corollary 4.9 underlies Lemma 3.1;
- Dimofte–Garoufalidis (two papers), the formal-Gaussian series;
- Garoufalidis–Storzer–Wheeler, the m-periodicity in Definition 2.11;
- Garoufalidis–Zagier, *Knots and their related q-series*;
- Garoufalidis–Lê;
- Rodriguez Villegas.

Calegari–Garoufalidis–Zagier, Habiro 2004, Hutchinson, Besser–de Jeu 2003, Scholze 2017 and Wagner
are already cited by the atlas.

## The mistakes

The mistakes that change what a formaliser must prove:

- **Definition 1.3 (E9).** As printed, (20) lets the linear coefficient of a section be
  non-integral. Then H_{Z_5,0} contains 1 and (1 + x)^{1/5}, and Theorem 1 fails for ξ = 0. The
  shape (195) used later in the paper, R^× + xR + x²K[[x]], fixes it, and the items use it.
- **Theorem 2 (E41).** The proof shows only that products land in the right module. The isomorphism
  H_{R,ξ} ⊗ H_{R,ξ′} ≅ H_{R,ξ+ξ′}, invertibility and the map to Pic(H_R) are unproved; they need
  global elements for every ξ.
- **Theorem 9 (E39, new).** The proof applies Lemma 3.1, which covers only symbols [z] with
  |z| = |1 − z| = 1, to all of K_3(K_p; Z_p). It never says how D_p extends to the p-completed
  group. The containment D_p(K_3(K_p; Z_p)) ⊆ p²O is what makes the rank argument work, and it is
  not proved. PadicHodgeRegulators D.3 already lists p²-integrality as one of its proof steps.
- **Proposition 5.1 (E62, new).** M_N has rank N(N − 1)/2, and its graded pieces are those with
  n ≤ N − 1. So |det M_N| = D(N − 1), not D(N). The displayed M_5 has determinant
  1327104 = D(4), and the N = 4 congruences cut out a lattice of index 216 = D(3). Proposition 5.2
  survives, because D(N)M_N^{−1} is still integral.
- **Corollary 1.10 (E16), Corollary 1.11(a) and Theorem 12 (E18), and Corollary 3.12 (E47, new).**
  The constant terms carry δ^{−1/2} and the Kummer root. The symmetrisation lies in H_{R[δ^{−1}]},
  and "Δ-integral" needs δ to be a unit away from Δ.
- **Theorem 7 (E28).** The level-m admissible ring must allow poles at Φ_d with m | d and
  gcd(d/m, m) > 1. For example, Σ t^j/(q;q)_{2j} has a pole at Φ_4, which the definition forbids.

The other new findings are slips with the mathematics intact:

- **Lemma 3.4, Dwork's lemma (E40).** The x^n coefficient should be ζ_m^{n(p−1)}p^n φ(a_n). The
  telescoping must then twist the constants by Frobenius, and gives (1 − p^{s(n−1)})a_n.
- **Proposition 3.3 and Theorem 9 (E38).** They include ζ = 1, where D_p is undefined.
- **(109), (166), (253), (254) (E31, E35, E52, E53).** Indices, an exponent, and the signs of the
  rank-one expansions. For A = 3 the printed (253)–(254) contradict (240)–(241).
- **(273) (E56).** The second line is labelled ζ_24^5 but holds the values of ζ_24²; this was
  recomputed 5-adically to 5^{12}.
- **(285) and (287) (E58, E59).** They have x for ζ_5, and f_5 for f_1.
- **(323) (E63).** Ohtsuki's sums are off by one in the index.
- **(353)–(359) (E64–E66).** The special form should be (−w)^a(1 − w)^b; (357) prints P_m(X^m);
  and one sign in the factorisation (359) is wrong.
- **The finite-étale claim of §1.4 (E3).** It has only a one-line sketch.
- **References (E67).** [23] and [24] are the same paper.

## Checks run

- `python3 scripts/check_paper.py` on the result: ok.
- `python3 research/blueprint/intake.py check-files` on both files: ok.
- PARI/GP 2.17 computations, run in the job's scratch space:
  - the 5-adic dilogarithms of Example 4.3 to precision 5^{12};
  - the determinant of (312) and the index of the lattices (321)–(322);
  - D_1, D_2, D(N), D(25) and D(100);
  - the factorisation (359);
  - the rank-one and Nahm-solution data of §§4.2–4.3;
  - the recursions behind E30 and E35;
  - the level-2 exponents behind E28;
  - (43) for m = 5, 7, 11, 13 (E17);
  - the gluing check (286).
- Hand checks: four columns of (312) at ζ_1, …, ζ_4; the trefoil expansions (334); Example 5.7 at
  q = 1, −1, ζ_3, i; the Gauss sums G_4 and G_8; and the rank-one coefficients (252)–(254).
- No Lean file is part of a paper job, and nothing was compiled.
