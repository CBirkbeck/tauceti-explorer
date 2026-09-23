# Lipnowski–Tsimerman (2018): How large is A_g(F_q)?, extraction and routing

Issue [#1332](https://github.com/CBirkbeck/tauceti-explorer/issues/1332). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues six merged checkpoints:
  - Codex codex-c83e7a (#1652);
  - Codex codex-a71f92 (#1848, #2155, #2199, #2228);
  - ChatGPT Pro cgp-20260923-h7q4 (#2204);
  - Codex codex-7e92bd (#2215).

  Their items, proof outlines and findings are kept. The changes are listed under "What this continuation changed", and their reports follow unchanged as the checkpoint record.
- **The paper.** M. Lipnowski and J. Tsimerman, *How large is A_g(F_q)?*, Duke Math. J. 167 (2018), no. 18, 3403–3453, DOI 10.1215/00127094-2018-0029; arXiv:1511.02212v1.
- **Items.** The result has **184 items: 30 library, 33 planned and 121 missing**. Every missing item is routed exactly once.
- **Mistakes.** 22 findings are recorded under `sourceIssues`, 5 of them already corrected by J. Lee (IMRN 2022). Four reach stated results in ways that matter:
  - **Theorem 0.1's constant (E21).** The printed bound o(p^((17/2+ε)g²)) is not established. Three slips feed it:
    - (14) and (20) count only half the ordered pairs of roots (E19);
    - the class-group exponent in (26)–(27) is too small (E6, E20);
    - powers of 2 with exponent of order g² are dropped (E7).

    The corrected argument gives 2^(34g²)·p^((69/4)g²(1+o(1))) (Lee, Theorem 1.1). Lee improves this to p^((45/4)g²(1+o(1))). The qualitative result log B(p,g) = O_p(g²) stands.
  - **The mass coefficient (E13).** Lemma 5.11 and (51)–(56) have leading term g² log g, but the mass formula the paper itself displays gives (1/2)g² log g. Theorems 0.2 and 0.3 survive with rescaled thresholds.
  - **Theorem 0.2 and the real-Weil factor (E14).** Conjecture 5.2 does not cover isogeny classes containing B0, the abelian surface over F_p with Frobenius ±√p and quaternionic endomorphism algebra. Their polarization counts have the same leading term per dimension as those of E^g. So the conditional conclusion must allow a large factor B0^(h/2) as well as E^h.
  - **Lemma 5.19 at p = 2 (E17).** The lemma is false for p = 2 (curves of trace ±1) and true for every odd p, by a two-line argument. Corollary 5.20 must exclude p = 2.
  - **The rest.**
    - Lemma 2.1's constant (E5).
    - Steps in v1's local counting (E1–E4).
    - Polarization normalisations (E8–E10).
    - Details in (41) and (49) (E11, E12).
    - The spacing measure and the enhanced Cohen–Lenstra definition (E15, E16).
    - Proposition 4.14's alternative proof (E18).
    - A misprint in Milne 1968, one of the paper's inputs.

## The version read

- **arXiv v1.** This is the only public version (6 November 2015, 38 pages, SHA-256 `5ceed816…`). It was read in full, with page images of pp.11–16 for the constants. Locators are to v1.
- **The published version was not read.** The Duke article (51 pages) is open on Project Euclid, but its PDF sits behind a JavaScript challenge that no available tool passes. Unpaywall lists only that PDF and arXiv v1. The two versions differ:
  - Lee 2022 cites published Corollaries 3.7, 3.16–3.18 and 3.22, Proposition 3.23, and equations (14), (15), (25), (31) and (32), numbering that v1 lacks.
  - Lee also quotes a revised local count from published p. 3421.
  - Lee quotes the published Theorem 0.1 with the same exponent 17/2 as v1.

  Findings E1–E4 concern v1's local count and may be v1-only. The maintainer's copy should be compared at review.
- **Other sources read here.**
  - Lee 2022 (arXiv:2002.04420v3) §§1–3.3, which records corrections to the published text.
  - DiPippo–Howe (arXiv:math/9803097v3) §1.
  - Lemmermeyer (arXiv:1309.1071) §1.

  The earlier checkpoints read Conrad's notes on polarizations, Yun §§4.8–4.13, Waterhouse 1969, Tate 1966, Tate's Bourbaki exposé, Waterhouse–Milne 1971 and parts of Milne 1968 (see `source.readSections`).

## What the paper proves

**Isogeny classes (§2).** Tate's theorem says a g-dimensional abelian variety over F_q is determined up to isogeny by its Frobenius polynomial, a Weil q-polynomial. Counting these polynomials by their first g power sums bounds the number of isogeny classes by q^(g²/4) up to lower-order factors (Lemma 2.1 and Corollary 2.2; the printed constant is corrected in E5). DiPippo and Howe's lower bound shows that the exponent 1/4 is sharp for every q.

**One isogeny class (§3).** Fix A0/F_p with Frobenius γ, and put G = End⁰(A0)^×.
- **Lattices.** Abelian varieties with a quasi-isogeny to A0 correspond to tuples of lattices:
  - γ-stable lattices in V_ℓ(A0) for ℓ ≠ p;
  - F,V-stable lattices in the Dieudonné module.

  Forgetting the quasi-isogeny is the quotient by G(Q) (9). Over F_p the Dieudonné side is a single Z_p-linear operator (Remark 3.2).
- **Local counts.** Filtrations and resultants reduce the count to one isotypic block. There, Yun's bound on punctual Hilbert schemes of Z_ℓ[[x]] counts orbits (§3.1). Stabilizer indices are bounded the same way (§3.2.1).
- **Global assembly.** Reduced norms and strong approximation turn the class set into class groups (21). Three inputs bound those class groups (22)–(27):
  - the class number formula;
  - regulator and residue bounds;
  - a discriminant bound for p-Weil numbers.

  The result is log B(p,g) = O_p(g²), which is Theorem 0.1 with a corrected constant.

**Polarizations (§4).**
- **Rosati orbits.** Principal polarizations of A are the Rosati-conjugacy orbits of Aut(A) on the positive symmetric automorphisms (Proposition 4.11). This rests on three inputs:
  - Mumford's φ_L;
  - the dictionary between Néron–Severi classes and symmetric elements;
  - positivity (Lemma 4.6, Proposition 4.9, Koecher–Vinberg).
- **Prime fields.** Over F_p, a simple A whose Frobenius field has no real place has a CM field as endomorphism algebra (Proposition 4.14).
- **Few polarizations.** An abelian variety with no repeated factor and Frobenius polynomial prime to x²−p therefore has at most p^(O(g²)) principal polarizations (Proposition 4.16).
- **Many polarizations.** E^g has far more, which gives Theorem 0.3.

**Speculation (§5).**
- **Counting on E^g.** Principal polarizations on E^g are unimodular hermitian lattices. The Siegel mass formula counts them as exp((1/2)g² log g + O(g²)) (Lemma 5.11, corrected).
- **A conjecture.** Model rings with positive involution count polarizations heuristically (Conjecture 5.2). Assuming it, most ppavs have a huge isogeny factor (Theorem 0.2, corrected to allow B0).
- **Consequences.** The spacing statistics of Frobenius angles are then far from GUE (Corollary 5.14). An enhanced Cohen–Lenstra model for the pair (A(F_p), A(F_(p²))) fails (Corollary 5.20).

## What the atlas has

- **Libraries.** 30 items are `library`, cited at the pinned commits:
  - Tau Ceti's abelian varieties and isogenies;
  - Mathlib's isocrystals, Witt vectors, CM fields, Dedekind zeta residue and class number formula;
  - Tau Ceti's class-number bound h_K ≤ |D_K|·4^[K:Q], resultants, Brauer groups and centralizers;
  - general algebraic suppliers.

  All 61 cited declarations were found again at Mathlib 082e2d3 and Tau Ceti f790474.
- **Planned elsewhere (33 items).** The main ones are:
  - duals, φ_L, polarizations and the Rosati involution (AbelianSchemesAndArithmeticModuli A2);
  - Tate modules (A4), and endomorphism algebras and the trace (A6);
  - Dieudonné theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2);
  - hermitian lattices, their local classification and the hermitian Hasse principle (GeometryOfNumbersAndQuadraticArithmetic GN.2), and masses (GN.3);
  - strong approximation (AdelicAlgebraicGroups AA.4);
  - the Cohen–Lenstra measure and Friedman–Washington (ArithmeticStatistics ST.5);
  - the Hasse norm theorem and local invariants (Tau Ceti ClassFieldTheory, Layers 13 and 5);
  - regulator lower bounds (Tau Ceti EffectiveBounds, Layer 3);
  - the trace formula (WeilConjectures WC.0) and weights (DeligneWeightsAndPurity DWP.7).
- **Not planned anywhere:**
  - Honda–Tate theory and Waterhouse's classification;
  - lattice and polarization counting over finite fields;
  - the characteristic-polynomial comparison behind the p-adic Tate theorem;
  - Lang's theorem;
  - explicit residue bounds;
  - DiPippo–Howe's lower bound.

## Routes

The checkpoints' routing is kept, with three changes: the finite-field Part II is re-centred on its final theorems, two small source routes are added, and one proposed Part II is withdrawn.

- **Part II of Abelian Schemes and Arithmetic Moduli: finite-field isogeny classes** (AbelianSchemesAndArithmeticModuliPartIIFiniteFields, 49 items). This is the heart of the paper.
  - **Contents.** Tate and Honda–Tate over finite fields, Waterhouse, the lattice description of an isogeny class, the adelic assembly, and the polarization counts.
  - **Final theorems.** The corrected Theorem 0.1, Proposition 4.16, the corrected Lemma 5.11 and Theorem 0.3.
  - **Why a Part II.** AbelianSchemes A1–A6 build abelian schemes, duals and realizations but nothing specific to finite fields, so this extends that roadmap rather than starting a new one.
  - **The brief.** It was rewritten around those final theorems and is reproduced below.
- **Sources of existing layers:**
  - **AbelianSchemesAndArithmeticModuli.** A2 (16 items): polarizations, Néron–Severi and Conrad's corrections. A4 (1): Tate modules. A6 (9): endomorphism algebras, the trace (Remark 4.8, corrected), positivity and Albert's CM case.
  - **FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2** (7): the Dieudonné inputs and the Witt-vector coefficient descent.
  - **GeometryOfNumbersAndQuadraticArithmetic.** GN.2 (18): hermitian lattices, local orders and Yun's resultant formula. GN.3 (24): local orbit and stabilizer bounds, and the masses (39)–(55) with the corrected coefficient.
  - **AdelicAlgebraicGroups AA.4** (5): level maps and finite-index comparisons.
  - **PELModuli M6** (1): finiteness at fixed polarization degree, used in Tate's proof.
  - **ArithmeticStatistics.** ST.0 (3): the counts as measures. ST.5 (13): Conjecture 5.2, the conditional Theorem 0.2 and Corollaries 5.13, 5.14 and 5.20, and the enhanced Cohen–Lenstra definitions.
  - **AnalyticNumberTheory AN.4** (1, new route): Louboutin's residue bound, together with the lower bound that (49) needs.
  - **ReductiveGroupsPartII RG2.3** (1, new route): Lang's theorem.
- **Withdrawn: the proposed Part II of Tau Ceti LocalFieldsRamification**, "Witt constants and polynomial recognition".
  - Its eight lemmas serve a single proof, the p-adic characteristic-polynomial comparison, so a design job of their own is disproportionate.
  - The Witt-vector descent goes to R07.2, which owns Dieudonné modules.
  - The resultant-recognition lemmas go to the finite-field Part II, their only consumer.

## What this continuation changed

- **Withheld claims.** The checkpoints kept 19 literal claims unrouted ("withheld"). PROTOCOL §18 says items use corrected statements, so each was resolved:
  - **Merged (4).** Each literal item went into its corrected twin:
    - power-sum-source → power-sum-count;
    - local-orbit-source → repeated-block-orbit-bound;
    - stabilizer-depth-source → nonisotypic-stabilizer-bound;
    - elliptic-pgroups-source → elliptic-pgroups-large.
  - **Dropped (1).** euler-source: §1 is motivation, "not used in the rest of the paper".
  - **Restated (14).** Each was given its corrected form and routed or marked planned. These include Theorems 0.1–0.3.
- **Added items (6):**
  - DiPippo–Howe's lower bound (Remark 2.3);
  - the positive-involution case of Albert's classification;
  - the Hasse norm theorem;
  - Lemmermeyer's exact sequence, for (31);
  - the hermitian Hasse principle (Proposition 5.4);
  - Lang's theorem, for (47).
- **Findings.**
  - **From Lee 2022.** E19–E21 are added, and E6 and E7 are marked known.
  - **Upgraded.** E13 and E14 now reach "a stated result", with the corrected coefficient and the B0 argument.
  - **Corrected.** E17: Lemma 5.19 is true for every odd p.
  - **Flagged.** E1–E4 may be v1-only.
  - **Searches.** Every finding's `searched` list now includes Lee, OpenAlex and Crossref.
- **Housekeeping.**
  - Each of the gaps G0–G9 is now marked resolved, handed to the design job, withdrawn, or open. Only G0, the published text, stays open.
  - Prerequisite links that pointed at LT's own arXiv page are replaced by DOIs.
  - The earlier verification record is kept under `verification.previousVerification`.

## The routes in detail

### Route 1: source of AbelianSchemesAndArithmeticModuli:A2

**Missing items taken (9).** Correct graph-pullback normalization (/graph-pullback); Kernel of the Mumford map (/phi-kernel); Rational Néron–Severi space (/ns-rational); Normalized Néron–Severi/Rosati map (/ns-rosati-map); Ample classes and positive symmetric elements (/positive-ample); Polarizations as Rosati-conjugacy orbits (/polarization-orbits); No-CM elliptic-power orbit example (/integer-matrix-example); Polarizations for a maximal CM endomorphism order (/cm-unit-orbits); Prime-to-characteristic divisibility of a polarization (/polarization-divisibility).

**Planned items the paper is a source for (7).** Dual variety and rigidified Poincaré bundle (/dual-poincare); Polarization as a positive symmetric morphism (/polarization); Mumford homomorphism of a line bundle (/mumford-map); Ample line bundles induce isogenies (/phi-ample-isogeny); Isomorphism of symmetric morphisms (/polarized-isomorphism); Pullback covariance (/phi-pullback); Rosati involution (/rosati).

### Route 2: source of AbelianSchemesAndArithmeticModuli:A4

**Planned items the paper is a source for (1).** Prime-to-characteristic Tate module (/tate-module).

### Route 3: source of AbelianSchemesAndArithmeticModuli:A6

**Missing items taken (4).** Real ample-cone matrix description (/real-cone); Torsion detects integral quasi-homomorphisms (/torsion-integrality-detection); Remark 4.8, corrected: trace versus reduced trace (/reduced-trace-source); A positive involution of a CM field is complex conjugation (/positive-involution-cm).

**Planned items the paper is a source for (5).** Rational endomorphism algebra (/rational-endomorphism); Isogeny decomposition and semisimplicity (/poincare-decomposition); Geometric endomorphism trace (/endomorphism-trace); Degree characteristic polynomial (/degree-polynomial); Positive Rosati trace pairing (/rosati-positivity).

### Route 4: source of FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

**Missing items taken (4).** Prime-field linear-dual realization (/prime-field-covariant-dual); Canonical p-adic constants in Witt vectors (/witt-constant-embedding); Frobenius-fixed Witt vectors are precisely p-adic constants (/witt-frobenius-fixed-ring); Integral characteristic polynomial descends along Witt Frobenius (/semilinear-charpoly-descent).

**Planned items the paper is a source for (3).** Integral Dieudonné realization (/dieudonne-lattice); Exact finite-level contravariant Dieudonné comparison (/finite-dieudonne-exactness); Dieudonné length measures group-scheme rank (/finite-dieudonne-length-rank).

### Route 5: source of GeometryOfNumbersAndQuadraticArithmetic:GN.2

**Missing items taken (14).** Local monogenic order (/local-order); Normalized lattice sandwiches (/saturation-normalization); Stable lattice with prescribed flag quotients (/flag-fiber); Model ring with positive involution (/model-ring); Totally positive unit norm labels (/unit-norm-label); Unitary group of a definite hermitian space (/unitary-group); Free unimodular lattices and Gram congruence (/gram-orbit-bijection); Norm ideal of a local hermitian lattice (/norm-ideal); Free versus projective mass classes (/free-projective-comparison); Monogenic conductor and dual sandwich (/monogenic-conductor-bound); Residue-correct coefficient DVR (/coefficient-dvr-model); Isotypic integral stabilizer via a congruence kernel (/isotypic-stabilizer-congruence-bound); Determinant index of a stable DVR lattice (/finite-dvr-determinant-index); Unique local orbit away from the minimal-polynomial discriminant (/good-prime-lattice-orbit).

**Planned items the paper is a source for (4).** Integral projective hermitian lattice (/hermitian-lattice); Dual and unimodularity (/hermitian-dual); Local unimodular classification input (/local-hermitian-classification); Genus of a hermitian lattice (/hermitian-genus).

### Route 6: source of GeometryOfNumbersAndQuadraticArithmetic:GN.3

**Missing items taken (22).** Centralizer shears identify equivalent extensions (/extension-shear); Resultant cardinality of a disjoint-spectrum fiber (/yun-resultant-fiber); Bound after removing zero eigenspaces (/extension-determinant-bound); Finite-colength ideal count (/punctual-hilbert-count); Yun finite-colength partition formula (/yun-partition-formula); Crude partition upper bound (/hilbert-crude-bound); Positive-unit model orbit count (/model-orbit-count); Hermitian genus as a unitary class set (/genus-double-cosets); Elementary CM relative-discriminant bound (/relative-discriminant); Factorial product asymptotic (/factorial-asymptotic); Minkowski finite integral group bound (/finite-integral-group); Passing from mass to class count (/mass-cardinality-comparison); Ramified-prime count from the relative discriminant (/ramification-count); Weighted partition cumulative bound (/weighted-partition-cumulative-bound); Rank-one local ideal-class bound (/rank-one-local-class-bound); Repeated-block local orbit bound (/repeated-block-orbit-bound); Semisimple local orbit bound with multiplicities (/semisimple-local-orbit-bound); Adelic local-orbit bound for Weil polynomials (/adelic-local-orbit-bound); Integral stabilizer controlled by successive graded lattices (/nonisotypic-stabilizer-bound); Stabilizer volume of a self-dual hermitian lattice (Gan–Yu), as used in (39) (/density-source); Mass of unimodular hermitian lattices, corrected (51)–(53) (/mass-asymptotic-source); Orbit count on a model ring, corrected (55) (/model-count-source).

**Planned items the paper is a source for (2).** Weighted hermitian genus mass (/hermitian-mass); Unitary Tamagawa mass formula (/tamagawa-mass).

### Route 7: source of AdelicAlgebraicGroups:AA.4

**Missing items taken (4).** Nested right-level map on double cosets (/double-coset-level-map); Finite-index bound for a double-coset level change (/double-coset-level-cardinality); Conjugate right levels have equivalent double-coset sets (/double-coset-conjugate-level); Index of product subgroups with finite exceptional support (/finite-support-product-index).

**Planned items the paper is a source for (1).** Strong approximation supplier (/strong-approximation).

### Route 8: source of ArithmeticStatistics:ST.0

**Missing items taken (1).** Number of polarizations on a fixed variety (/polarization-fiber).

**Planned items the paper is a source for (2).** Unweighted abelian-variety count (/unpolarized-count); Unweighted principally polarized count (/ppav-count).

### Route 9: source of ArithmeticStatistics:ST.5

**Missing items taken (11).** Conjectural comparison with the model ring (/model-comparison-conjecture); Convex mass-concentration inequality (/convex-concentration); Normalized eigenangle spacing measure (/spacing-measure); Proposed enhanced Cohen–Lenstra law (/enhanced-cl); Two-extension zero-cokernel probability at two (/cl-two-prime); Uniform positive bound at odd primes (/cl-odd-prime); Source enhanced-statistics conjecture (/enhanced-cl-conjecture); Theorem 0.2 (Corollary 5.13), corrected: a large elliptic or B0 factor, conditionally (/main-elliptic-source); Proposition 5.10, corrected threshold (/model-concentration-source); Corollary 5.14, corrected: spacing discrepancy (/spacing-source); Corollary 5.20, corrected: odd p (/enhanced-failure-source).

**Planned items the paper is a source for (2).** Cohen–Lenstra probability measure (/cl-measure); Random integral matrices and Cohen–Lenstra (/friedman-washington).

### Route 10: Part II — Abelian Schemes and Arithmetic Moduli, Part II: finite-field isogeny classes (AbelianSchemesAndArithmeticModuliPartIIFiniteFields, area arithmeticgeometry)

**Brief for the design job.** Count abelian varieties and principally polarized abelian varieties over a prime field F_p as g→∞, following Lipnowski–Tsimerman, "How large is A_g(F_q)?" (Duke Math. J. 167 (2018)), with the corrections of J. Lee (IMRN 2022, §3.1) and those recorded in PAPER-LIPNOWSKI-TSIMERMAN-18 sourceIssues. Final theorems, as corrected: (T1) Isogeny classes (Lemma 2.1, Corollary 2.2 and DiPippo–Howe, Theorem 1.3): the number of isogeny classes of g-dimensional abelian varieties over F_q is at most (4g+1)^g q^(g(g+1)/4), and its logarithm is (1/4)g² log q (1+o(1)). (T2) Theorem 0.1: for fixed p, B(p,g) ≤ 2^(34g²)·p^((69/4)g²(1+o(1))); in particular log B(p,g) = O_p(g²). Do not state the printed exponent 17/2+ε. Lee's sharper p^((45/4)g²(1+o(1))) is optional. (T3) Proposition 4.16: an abelian variety over F_p with no repeated simple isogeny factor and Frobenius polynomial coprime to x²−p has at most p^(Cg²) principal polarizations up to isomorphism, C absolute. (T4) Lemma 5.11: if p splits in Q(√−d) for one of the nine class-number-one d, some E/F_p with End(E) the maximal order has exp((1/2)g² log g + O_p(g²)) principal polarizations on E^g (printed coefficient 1). (T5) Theorem 0.3 (Proposition 4.17): for such p, the proportion of g-dimensional ppavs over F_p that have no repeated isogeny factor and Frobenius polynomial coprime to x²−p tends to 0. What to cover: (1) Frobenius polynomials, their integrality, independence of ℓ and reciprocity; Tate's isogeny theorem over finite fields and its p-adic analogue on Dieudonné modules, including the characteristic-polynomial comparison (via R07.2's Witt descent and this route's resultant-recognition lemmas); Honda–Tate with Tate's local invariants; Waterhouse's realization of orders (Theorem 6.1) in the nonreal prime-field case; Proposition 4.14 (End⁰ of a simple A/F_p is a CM field unless Frobenius is ±√p). (2) The lattice description of an isogeny class (§3): marked quasi-isogenies correspond to Frobenius-stable lattice tuples; isomorphism classes are G(Q)-orbits; over F_p the p-component reduces to one Z_p-linear Frobenius (Remark 3.2). (3) Local lattice-orbit counts and stabilizer indices (the checkpoint replacement items: repeated-block, adelic and non-isotypic bounds) and the adelic assembly with class sets via reduced norms. (4) Class-number bounds (22)–(27) with the corrected exponents, or the library bound h_K ≤ |D_K|·4^[K:Q] where constants do not matter. (5) Principal polarizations as Rosati orbits (Proposition 4.11), the CM case (Example 4.13) with the Hasse norm theorem and Lemmermeyer's exact sequence, and T3–T5. Keep the real-Weil factor B0 (Frobenius ±√p, quaternionic End⁰) explicit throughout. Imports, by title and id: Abelian Schemes and Arithmetic Moduli (AbelianSchemesAndArithmeticModuli) A2, A4, A6; Finite flat group schemes and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory) R07.2; Geometry of numbers, quadratic forms and homogeneous arithmetic (GeometryOfNumbersAndQuadraticArithmetic) GN.2–GN.3, including the hermitian mass formula; Adelic algebraic groups and arithmetic quotients (AdelicAlgebraicGroups) AA.3–AA.4; Siegel and PEL moduli problems (PELModuli) M6, for finiteness at fixed polarization degree in Tate's proof (never the count being proved); Deligne weights and purity (DeligneWeightsAndPurity) DWP.1, for the Riemann hypothesis for abelian varieties; Class field theory (tauceti:TauCetiRoadmap/ClassFieldTheory) Layers 5 and 13; Effective bounds (tauceti:Completed/EffectiveBounds) Layers 1 and 3; Analytic number theory (AnalyticNumberTheory) AN.4; Reductive groups, Part II (ReductiveGroupsPartII) RG2.3, for Lang's theorem. Arithmetic statistics (ArithmeticStatistics) ST.0 owns the counting measures and ST.5 the conditional statements (Theorem 0.2, Corollaries 5.13, 5.14, 5.20). Scope: T2–T5 are over prime fields only (Remarks 3.2 and 4.18). The published text (51 pages) was not available to the extraction: locators are to arXiv v1, and Lee's corrections cite the published numbering (Corollaries 3.16–3.18 and 3.22, Proposition 3.23, equations (25), (31), (32)).

**Missing items taken (49).** Tate full faithfulness over finite fields (/tate-hom); Frobenius polynomial and reciprocity (/weil-polynomial); Frobenius polynomial determines the isogeny class (/isogeny-polynomial); Honda–Tate simple isogeny classification (/honda-tate); Lemma 2.1, corrected: counting Weil polynomials (/power-sum-count); Asymptotic count of isogeny classes (/isogeny-class-upper); Prime-to-p and p lattice spaces (/marked-lattice-space); Marked quasi-isogenies classified by lattices (/marked-quasi-isogeny); Isomorphism classes as rational orbits (/forget-marking); The prime-field p-component reduction (/prime-p-centralizer); Adelic class set of the endomorphism group (/adelic-class-set); Class-set comparison by reduced norms (/nonabelian-class-comparison); Correct elementary discriminant estimate (/weil-discriminant-bound); Line-bundle realization over a finite field (/finite-field-polarization-descent); Commutative endomorphisms in the nonreal prime-field case (/prime-field-end-algebra); Realization of nonreal prime-field orders (/waterhouse-orders); Squarefree nonreal polarization bound (/squarefree-pol-count); Density of primes splitting in a class-number-one CM field (/split-prime-density); Elliptic curve with class-number-one endomorphisms (/cm-elliptic-existence); Lemma 5.19, corrected: odd characteristic (/elliptic-pgroups-large); Point counts are isogeny invariant (/point-count-isogeny); Conditional rational-orbit bound from local lattices (/conditional-rational-orbit-bound); Tate’s isotropic image lemma (/tate-isotropic-image); Tate full faithfulness at a split Frobenius prime (/tate-split-commutant); Integral Tate full faithfulness at the characteristic prime (/p-tate-hom); Prime-field p-realization Frobenius polynomial (/prime-field-p-frobenius); Finite-support lattice tuples are realized over the prime field (/prime-field-lattice-realization); Prime-field marked and unmarked classification (/prime-field-marked-classification); Finite-support adelic stabilizers in a prime-field isogeny class (/prime-field-adelic-stabilizers); Coarse prime-field isomorphism count at fixed adelic level (/prime-field-isogeny-class-bound); Dieudonné determinant detects the p-part of isogeny degree (/p-realization-degree-valuation); Characteristic polynomial on the p-realization (/p-realization-characteristic-polynomial); Semisimplicity of the linear q-Frobenius realization (/p-frobenius-semisimplicity); Saturated injection on integral p-realization Hom groups (/p-realization-saturated-hom); Algebra acting on a Frobenius polynomial block (/p-frobenius-block-algebra); Central simplicity of a Frobenius block algebra (/p-frobenius-block-split); Dimension of the semilinear Frobenius commutant (/p-frobenius-centralizer-dimension); Rational p-Tate comparison (/rational-p-tate-hom); Characteristic-prime invariant of a simple endomorphism algebra (/p-endomorphism-local-invariant); Monic polynomial lifting at an ideal-power precision (/monic-coefficient-lift); Resultant respects congruence in the second polynomial (/resultant-congruence); A shifted approximate factor detects its multiplicity (/resultant-factor-slope); Monic polynomials are determined by nonzero resultant valuations (/resultant-valuation-recognition); Integer polynomial tests determine a monic p-adic polynomial (/padic-resultant-recognition); Theorem 0.1, corrected: abelian varieties over F_p number p^(O(g²)) (/main-unpolarized-source); Theorem 0.3 (Proposition 4.17): most ppavs over F_p have a repeated factor (/main-repeated-source); Lemma 5.11, corrected: principal polarizations on E^g (/elliptic-power-source); DiPippo–Howe lower bound for isogeny classes (/dipippo-howe); Units that are norms modulo norms of units (Lemmermeyer) (/ambiguous-unit-norms).


### Route 11: source of PELModuli:M6

**Missing items taken (1).** Finite-field finiteness at fixed polarization degree (/fixed-polarization-finiteness).


### Route 12: source of AnalyticNumberTheory:AN.4

**Missing items taken (1).** Explicit residue bound for Dedekind zeta functions (Louboutin) (/residue-source).


### Route 13: source of ReductiveGroupsPartII:RG2.3

**Missing items taken (1).** Lang's theorem over finite fields (/lang-theorem).


## Prerequisite papers the atlas does not cover

- Yun, Orbital integrals and Dedekind zeta functions (2013), arXiv v2 (https://arxiv.org/abs/1303.2420). Selected original proof read: §§1.3–1.5 and 4.8–4.13; full orbital-integral functional equation and repeated-eigenvalue extension remain outside this checkpoint. Continuation L5–L8 now supplies a separate coarse repeated-block/local-orbit argument; the regular-semisimple theorem is still not applied directly beyond its scope, and general global stabilizer closure remains outstanding. S2–S3 freshly recheck the full §4.8/Lemma 4.9 proof and supply the repeated-multiplicity version directly by an invertible Sylvester operator; S4–S6 close the abstract finite-index gluing only under explicit arithmetic inputs.
- Conrad, Polarizations, VIGRE notes (https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf). All ten pages read; corrects graph pullback, finite-field descent and Rosati positivity. Underlying Mumford representability and intersection theory still belong to A2/A6.
- Waterhouse, Abelian varieties over finite fields, Ann. Sci. ENS 2 (1969), 521–560 (https://www.numdam.org/article/ASENS_1969_4_2_4_521_0.pdf). Read introduction and all Chapters 1–3, the Porism 4.3 order-patching proof, Chapter 6 and bibliography; Theorem 6.1 proof additionally checked as an image. Finite-flat/Dieudonné and Brauer inputs are imported, not claimed proved from this paper. Chapters 4–5,7 and Appendix have not received a full source audit.
- Tate, Endomorphisms of abelian varieties over finite fields (1966); Honda, Isogeny classes (1968) (https://pazuki.perso.math.cnrs.fr/index_fichiers/Tate66.pdf). Tate 1966 prime-to-p proof reading inherited from codex-a71f92; D1–D5 now read the original characteristic-p comparison and invariant proofs in WM71 Part II with M68 pp.65–66. Honda CM existence and original finite Dieudonné/degree suppliers remain unfinished. Tate’s projected second endomorphism paper never appeared; use WM71, whose bibliography explicitly says so.
- Gan–Yu, Group schemes and local densities, Duke Math. J. 105 (2000), 497–524 (doi:10.1215/S0012-7094-00-10535-2). Acquire Theorem 10.20 and §10.9, measure conventions and residue-characteristic-two exclusions before accepting (39). Original exact public source URL remains to establish.
- Jacobowitz, Hermitian forms over local fields, Amer. J. Math. 84 (1962), 441–465 (doi:10.2307/2372982). Read Theorems 7.1,8.2 and Proposition 10.4, including dyadic norm/scale ideals and split cases; locator as cited by main paper.
- Lang, Divisors and endomorphisms on an abelian variety, Amer. J. Math. 79 (1957), 761–777 (doi:10.2307/2372433). Original positivity and NS comparison, cited as [15]; exact public article link not yet established.
- Louboutin (2000), Explicit bounds for residues; Skoruppa (1993), Quick lower bounds for regulators (doi:10.1006/jnth.2000.2545 (Louboutin); Skoruppa: Enseign. Math. (2) 39 (1993), 137–141, no DOI). Original references [18],[24] not acquired. Their hypotheses and residue-ratio lower bound remain G8; this link identifies the checked bibliography only.
- Friedman–Washington (1989), On the distribution of divisor class groups of curves over a finite field (doi:10.1515/9783110852790.227). Original [9] and joint matrix-cokernel limit/tightness needed. The ordinary CL law does not alone imply Definition 5.16.
- Serre (2007), Bounds for the orders of finite subgroups of G(k) (Group representation theory (EPFL Press, 2007), 405–450; no DOI). Original [23] congruence/primes-in-progressions input remains to acquire; main-paper proof of Lemma 5.8 was read.
- Tate, Classes d’isogénie des variétés abéliennes sur un corps fini, Séminaire Bourbaki, exposé 352 (November 1968), printed 1971, pp.95–110 (https://numdam.org/item/SB_1968-1969__11__95_0/). Whole extracted text surveyed; §§1–2 read with rendered formulas on pp.96,98,99. Normalizes inv_v(E)=f_v ord_v(π)/a and records the p-divisible full-faithfulness argument’s unsupplied proof details. §§3–6 formulas have not all been image-audited; do not treat this as a complete Honda/CM proof read. D1–D5 replace only the p-proof unread-source boundary by the original WM71 Part II proof; no fresh full Honda/CM audit is asserted.
- Waterhouse–Milne, Abelian varieties over finite fields, Proc. Symp. Pure Math. 20 (1971), 53–64 (https://www.jmilne.org/math/articles/1971a.pdf). All twelve pages freshly image-read. Part II supplies the original p-Tate and p-local invariant proofs; R07.2 exact classification, local cyclic invariant and Honda existence remain imports.
- Milne, Extensions of abelian varieties defined over a finite field, Invent. Math. 5 (1968), 63–84 (https://www.jmilne.org/math/articles/1968a.pdf). Only pp.63–67 and p.84 freshly image-read. The independent p-characteristic-polynomial comparison is pp.65–66; the Lang uniqueness citation is expanded by a valuation argument, not claimed read. The proposed p.67 Newton-abscissa misprint is incorporated from the handoff. Later Ext proofs and the author’s corrections to pp.78–81 are outside this extraction scope.
- DiPippo and Howe, Real polynomials with all roots on the unit circle and abelian varieties over finite fields, J. Number Theory 73 (1998), 426–450; corrigendum 83 (2000), 182 (doi:10.1006/jnth.1998.2302 (arXiv:math/9803097)). Theorem 1.3, the lower bound behind Remark 2.3, read at the source; needed for T1 of the finite-field Part II.
- Lemmermeyer, The ambiguous class number formula revisited, J. Ramanujan Math. Soc. 28 (2013), 415–421 (arXiv:1309.1071). Proposition 1 (read) bounds the units that are norms modulo norms of units, used in (31).
- Scharlau, Quadratic and Hermitian Forms, Grundlehren 270 (1985), Chapter 10 (doi:10.1007/978-3-642-69971-9). The Hasse principle for hermitian forms used in Proposition 5.4; for GN.2.
- Lee, On the lower bound of the number of abelian varieties over F_p, IMRN 2022, 4290–4317 (doi:10.1093/imrn/rnaa153 (arXiv:2002.04420)). Not a prerequisite of LT but of its corrected form: §3.1 corrects LT's published constants (Theorem 1.1) and Theorem 1.4 improves them. The finite-field Part II follows it.

## Mistakes found (`sourceIssues`)

Locators are to arXiv v1, with published locators where Lee 2022 gives them. Where each finding was searched for an existing correction is recorded in the result. Text marked [cc-442dc5] was added in this continuation.

- **E1** (error; affects the proof), v1 p.10, §3.1.5 (13); final 2018 text not obtained.
  - *Printed:* Σ_(a₁+⋯+a_n≤δn)1 ≤ (nδ)^n/n!
  - *Correction:* Use the weighted-partition/rank-one argument L3–L6 for a coarse replacement; do not retain this weak-composition bound.
  - *Why:* At n=1,δ=0 the two sides are 1 and 0; even δ=1 gives 2≤1. The source's claimed sharper final exponent is not proved by the replacement. Lee 2022 §3.3 quotes a different local count from the published version (a factor ℓ^(n(n−1)δ/2), partitions weighted by (ℓ^d)^(a−ℓ(λ)), "[7, p. 3421] and inequalities (14) and (15)"), so the published proof of this step differs from v1 and may already avoid this finding; the published text could not be read. [cc-442dc5]
- **E2** (error; affects the proof), v1 p.12, §3.2.1 orbit-map display; final 2018 text not obtained.
  - *Printed:* gM ↦ (m ↦ gm mod R^n)
  - *Correction:* This formula does not descend from elements to orbit points. Use the isotypic congruence-kernel argument L9; general blocks still need work.
  - *Why:* Take ℓ=3,F=Q₃(i),R=Z₃[3i],S=Z₃[i],M=S,n=1. Both 1 and −1 belong to GL₁(R), and M=(−1)M; evaluating the two proposed maps at i gives i and −i modulo R, differing by 2i∉R. Also S⊆R^∨, so the claimed target is defined. No element outside GL₁(R) is used. Lee 2022 §3.3 quotes a different local count from the published version (a factor ℓ^(n(n−1)δ/2), partitions weighted by (ℓ^d)^(a−ℓ(λ)), "[7, p. 3421] and inequalities (14) and (15)"), so the published proof of this step differs from v1 and may already avoid this finding; the published text could not be read. [cc-442dc5]
- **E3** (misprint; affects the proof), v1 p.9, §3.1.4 display after (10); final 2018 text not obtained.
  - *Printed:* M'/(F(M)∩W') ⊂ M'/F(M')
  - *Correction:* There is a canonical surjection M'/F(M')→M'/F(M), not the displayed inclusion. Since F(M)⊆M', the denominator intersection is redundant.
  - *Why:* F(M')⊆F(M)⊆M'. Passing to quotients reverses the direction of the natural map. The cardinality upper bound survives via this surjection; see L5. Lee 2022 §3.3 quotes a different local count from the published version (a factor ℓ^(n(n−1)δ/2), partitions weighted by (ℓ^d)^(a−ℓ(λ)), "[7, p. 3421] and inequalities (14) and (15)"), so the published proof of this step differs from v1 and may already avoid this finding; the published text could not be read. [cc-442dc5]
- **E4** (error; affects the proof), v1 p.10, §3.1.5, power-series quotient assertion; final 2018 text not obtained.
  - *Printed:* R is a quotient of Z_ℓ[[X]]
  - *Correction:* First pass to the unramified coefficient DVR O₀ with residue field R/rad R; then R is a quotient of O₀[[T]].
  - *Why:* An unramified quadratic order has residue field F_(ℓ²), whereas the local ring Z_ℓ[[X]] has residue F_ℓ; no such local quotient is possible. L2 also tracks the residue degree in colength. Lee 2022 §3.3 quotes a different local count from the published version (a factor ℓ^(n(n−1)δ/2), partitions weighted by (ℓ^d)^(a−ℓ(λ)), "[7, p. 3421] and inequalities (14) and (15)"), so the published proof of this step differs from v1 and may already avoid this finding; the published text could not be read. [cc-442dc5]
- **E5** (error; affects a stated result), v1 p.5, Lemma 2.1; final 2018 text not obtained.
  - *Printed:* (2g)^g q^(g(g+1)/4)
  - *Correction:* For reciprocal polynomials use the safe bound (4g+1)^g q^(g(g+1)/4); impose reciprocity explicitly for the reconstruction by g coefficients.
  - *Why:* At g=1,q=2 there are five reciprocal polynomials X²−aX+2 with −2≤a≤2, exceeding 2√2. The root-radius condition alone also admits X²−q, which does not satisfy the asserted reciprocity.
- **E6** (error; affects the proof), v1 p.15, (26); final 2018 text not obtained.
  - *Printed:* (2√p)^binom(d,2)
  - *Correction:* The elementary discriminant bound has exponent d(d−1).
  - *Why:* The discriminant is the square of the Vandermonde product. Each unordered pair contributes two differences, so the displayed argument loses a square. The corrected bound is retained by weil-discriminant-bound; the sharp main constant is not certified. *Known:* J. Lee, "On the lower bound of the number of abelian varieties over F_p", Int. Math. Res. Not. IMRN 2022, no. 6, 4290–4317, DOI 10.1093/imrn/rnaa153 (arXiv:2002.04420v3), §3.1(2): "The upper bound in the inequality (31) of [7] should be corrected to (2√p)^(2·C(d,2))" (published (31) = v1 (26)).
- **E7** (gap; affects the proof), v1 p.16, (28), final fixed-p asymptotic; final 2018 text not obtained.
  - *Printed:* p^((33/4)g²(1+o(1)))
  - *Correction:* Keep powers of 2 with exponents proportional to g² in the fixed-p leading coefficient, or export only exp(O_p(g²)).
  - *Why:* For fixed p, log_p(2) is a nonzero constant; C·g²·log_p(2) is not o(g²). Neither the displayed equality nor the stated sharp main coefficient follows from discarding it. *Known:* J. Lee, "On the lower bound of the number of abelian varieties over F_p", Int. Math. Res. Not. IMRN 2022, no. 6, 4290–4317, DOI 10.1093/imrn/rnaa153 (arXiv:2002.04420v3), Theorem 1.1 and (9)–(10) keep the factor 2^(34g²); Lee's Lemma 3.1 (|d′(A_0)|_∞ ≤ (2g)^(2g) p^(C(2g,2))) removes it in his improved bound.
- **E8** (error; affects the proof), v1 p.16, §4.1 graph-pullback assertion; final 2018 text not obtained.
  - *Printed:* (1,φ_L)*P_A = L
  - *Correction:* Use [2]*L⊗L^(−2), up to the chosen rigidification, with Néron–Severi class 2[L].
  - *Why:* Inherited checked Conrad Example 2.2 supplier from PR #1652: the Poincaré biextension pullback is not L. On a symmetric ample L its class is twice that of L. The continuation preserves that primary-source evidence; it does not claim a fresh full Conrad reading.
- **E9** (error; affects a stated result), v1 pp.17–18, §4.2 and Lemma 4.6; final 2018 text not obtained.
  - *Printed:* Φ_f : NS(A) → S⁰(A)
  - *Correction:* Use NS(A)⊗Q for the claimed rational vector-space isomorphism and rational pullback D_f on quasi-endomorphisms.
  - *Why:* The domain displayed is an integral lattice, whereas S⁰(A) is rational. The formula on End⁰(A) needs rationalized pullback. At a principal class L₀, Φ_f(L₀)=1/2 and D_f(1,1)=2[L₀], consistent only after the domain and normalization are made explicit.
- **E10** (error; affects a stated result), v1 p.18, Remark 4.8; final 2018 text not obtained.
  - *Printed:* t = reduced trace_(D/Q)
  - *Correction:* Use the trace of the Tate representation, including representation multiplicity over the reduced trace.
  - *Why:* For a simple positive-dimensional abelian variety with End⁰(A)=Q, t(1)=2g but Trd_(Q/Q)(1)=1. The identity without multiplicity is false.
- **E11** (misprint; affects the proof), v1 p.27, (41), quadratic discriminant factor; final 2018 text not obtained.
  - *Printed:* p sin²θ
  - *Correction:* The absolute quadratic discriminant factor is 4p sin²θ.
  - *Why:* If α=√p exp(iθ), then (α−conj α)²=−4p sin²θ. Restoring the factor does not change the O_p(d) logarithmic bound.
- **E12** (gap; affects the proof), v1 p.29, (49); final 2018 text not obtained.
  - *Printed:* log L(1,χ_(L/K)) = O([K:Q] log[K:Q])
  - *Correction:* Supply lower as well as upper controls for the residue ratio before asserting this two-sided logarithmic bound.
  - *Why:* Equation (24) only supplies upper bounds for each residue; subtracting their logarithms does not bound their difference without lower bounds. No claim that the displayed bound itself is false.
- **E13** (error; affects a stated result), v1 p.30, (51), compared with p.26 (39); final 2018 text not obtained.
  - *Printed:* [K:Q] n² log n + O(n²[K:Q]²)
  - *Correction:* The displayed factorial product contributes (1/2)[K:Q]n²log n+O([K:Q]n²). Recheck the mass normalization and all consumers before asserting a total asymptotic. The corrected leading coefficient is 1/2 throughout: log #C_σ = (1/2)[K:Q]n² log n + O_p([K:Q]²n²), (55) becomes (1/2)Σ[K_i:Q]n_i² log n_i + O_p(g²), and Lemma 5.11 (56) becomes exp((1/2)g² log g + O_p(g²)). Example 4.12's "≈ exp(g² log g)" becomes exp((1/4)g² log g + O(g²)) (unimodular Z-lattices). Theorems 0.2 and 0.3 survive with rescaled thresholds (Proposition 5.10: 0.495g² log g). [cc-442dc5]
  - *Why:* Σ_(d=1)^n log((d−1)!)=(1/2)n²log n+O(n²). For fixed K, a missing half of n²log n is not absorbed by O(n²[K:Q]²). No corrected full mass theorem is asserted without Gan–Yu and the remaining factors. Lemma 5.11 and Example 4.12 state the wrong leading term, so a stated result is affected. For E^g the principal polarizations are the classes of unimodular hermitian O_K-lattices of rank g, whose mass has logarithm (1/2)g² log g + O(g²) (the unitary group has dimension g²); Aut groups are exp(O(g log g)) by Lemma 5.8. [cc-442dc5]
- **E14** (gap; affects a stated result), v1 p.33, Corollary 5.13 proof applying Conjecture 5.2; final 2018 text not obtained.
  - *Printed:* Conjecture 5.2 and Proposition 5.10 imply the bound for bad A
  - *Correction:* Assume in addition the analogue of Conjecture 5.2 for isogeny classes with factors B0 (Frobenius ±√p, End⁰ the definite quaternion algebra over Q(√p)), and conclude that a large factor E^h or B0^(h/2), h ≥ 0.99g, occurs with probability tending to 1. The printed conclusion (an elliptic factor) is not established.
  - *Why:* Conjecture 5.2 assumes products of matrix algebras over CM fields; Q(√p) real Frobenius factors with quaternionic endomorphisms were already separated in §3.2.2. No covering estimate for this omitted family is supplied by that conjecture. The omitted family is not negligible. Principal polarizations on B0^n correspond to classes of unimodular quaternion-hermitian lattices of rank n over O_D; their mass is ∏_(i≤n)|ζ_(Q(√p))(1−2i)| up to exp(O(n²)) factors, with logarithm 2n² log n + O(n²) = (1/2)(2n)² log n. That is the same leading term per dimension as E^g (E13), so Proposition 5.10's dichotomy must allow B0^(h/2), and Corollary 5.13 cannot conclude an elliptic factor. Corollaries 5.14 and 5.20 (odd p) survive with the B0 alternative, because B0^(h/2) has the roots ±√p with multiplicity h and #B0(F_p) = (p−1)². [cc-442dc5]
- **E15** (error; affects the proof), v1 p.34, Corollary 5.14 proof; final 2018 text not obtained.
  - *Printed:* αδ₀, with α=h/g
  - *Correction:* For 2g cyclic gaps, two distinct roots each repeated h times force zero mass at least (2h−2)/(2g)=h/g−1/g; state a limiting discrepancy conclusion in a specified metric.
  - *Why:* Each group of h equal roots contributes h−1 zero gaps. At g=h with two distinct roots the exact zero mass is 1−1/g, not 1. Other coincident roots can only increase the lower bound.
- **E16** (gap; affects a stated result), v1 pp.35–36, Definition 5.16 and Example 5.17; final 2018 text not obtained.
  - *Printed:* CL_(n,ℓ) := lim_(g→∞) Haar_g(...)
  - *Correction:* Prove existence and total mass one of the joint limiting law. The odd-prime union bound supplies a positive liminf, not convergence.
  - *Why:* A definition by a limit requires that limit; pointwise convergence alone also need not preserve mass without tightness. A uniform positive lower bound does not imply convergence. The ℓ=2 special calculation is not a proof for general tuples.
- **E17** (error; affects a stated result), v1 p.36, Lemma 5.19 and its proof; Corollary 5.20 at p = 2.
  - *Printed:* E(F_p) and E(F_(p²)) are not both p-groups
  - *Correction:* The lemma holds exactly for odd p. For odd p: if p^i = p+1−a and p^j = p+1+a then p^i+p^j = 2p+2, which forces i = 0 or j = 0 modulo p and then p^(j) = 2p+1, impossible. For p = 2 the curves with a = ±1 are counterexamples. The printed proof ("a = 1 and b = 1") is wrong for every p, since #E(F_(p²)) = p²+1−(a²−2p). Corollary 5.20 must exclude p = 2.
  - *Why:* Over F₂, y²+xy=x³+x²+1 is smooth and has 2 points over F₂ and 8 over F₄. Both groups are 2-groups. PR #1652 enumerated them; the continuation retains its finite check and the source argument's small-prime failure. p = 2 satisfies the hypothesis of Lemma 5.11 (2 splits in Q(√−7)), so Corollary 5.20 as stated covers p = 2, where its proof fails; there #B0(F_2) = #B0(F_4) = 1 as well. [cc-442dc5]
- **E-MILNE68-NEWTON-ABSCISSA** (misprint; affects nothing), Milne, Extensions of abelian varieties defined over a finite field, Invent. Math. 5 (1968), published p.67, proof of Theorem 1(c), definition of the Newton polygon; author-hosted published page image..
  - *Printed:* (c_i, ord_p(c_i))
  - *Correction:* Use (i, ord_p(c_i)) for each nonzero coefficient c_i of F^i.
  - *Why:* The horizontal coordinate is the exponent. For 1+F the printed point set has just (1,0), whereas the Newton polygon has endpoints (0,0) and (1,0). General coefficients lie in a p-adic field, not canonically in R. The subsequent formula ord_s(lambda)=min_i(ord_p(c_i)-s i) also confirms the intended exponent coordinate. This is a notation slip, not a disproof of Theorem 1(c), and is outside the degree-comparison proof used above.
- **E18** (error; affects the proof), LT arXiv:1511.02212v1, p.21, Proposition 4.14(1), final sentence of the alternative p-adic proof; final journal text not acquired..
  - *Printed:* the centralizer of F, which is not a division algebra
  - *Correction:* A Frobenius centralizer can be a division algebra (a field). Use the preceding local-invariant calculation to prove splitting over each local center; being a Q_p-centralizer or merely not being a division algebra does not establish that splitting.
  - *Why:* Take E/F_5: y²=x³+1. Its discriminant is nonzero mod 5 and it has six rational points, so P_E=X²+5 and Q(π)=Q(√−5) has no real place. On the two-dimensional prime-field rational realization F has this characteristic polynomial; it is irreducible over Q_5 by Eisenstein. Hence the commutant is Q_5[F]≅Q_5[X]/(X²+5), a field and therefore a division algebra. In companion coordinates F=[[0,−5],[1,0]], every commuting matrix is xI+yF with determinant x²+5y²; unequal parity of valuations prevents a nonzero zero determinant. The proposition is not disproved: the preceding invariant proof is valid, and a field is split over its own center.
- **E19** (error; affects the proof), v1 p.11, (14), and p.14, (20); published Corollary 3.18 and (25) in the proof of Corollary 3.22 (numbering from Lee 2022).
  - *Printed:* ≤ (∏_(λ≠μ)|λ−μ|_∞)^4 ≤ (2p^(1/2))^(4·C(2g,2)) in (14), and #G(Ẑ)/Stab(L) ≤ (2p^(1/2))^(4·C(2g,2)) in (20)
  - *Correction:* (2p^(1/2))^(8·C(2g,2)) in both places.
  - *Why:* The exponent in §3.1.6 sums val_ℓ(λ−μ) over ordered pairs of unequal roots (δ_i = val_ℓ disc(R_i) is an ordered-pair sum), and there are 2g(2g−1) = 2·C(2g,2) ordered pairs, each with |λ−μ| ≤ 2√p. (19) gives (20) the same way. *Known:* J. Lee, "On the lower bound of the number of abelian varieties over F_p", Int. Math. Res. Not. IMRN 2022, no. 6, 4290–4317, DOI 10.1093/imrn/rnaa153 (arXiv:2002.04420v3), §3.1(1)(c) and (2).
- **E20** (error; affects the proof), v1 p.15, (27); published (32) (numbering from Lee 2022).
  - *Printed:* #∏Cl(O_K) ≤ (2√p)^(g²/2)·(g/2)^g·(log 2√p)^g·500^g e^g = (2√p)^((g²/2)(1+o(1)))
  - *Correction:* (2√p)^(2g²(1+o(1))) with the corrected (26) (E6); even with (26) as printed the exponent is g²(1+o(1)).
  - *Why:* The fields K are the Frobenius fields of the simple factors, of degrees d_i with Σd_i ≤ 2g, so Σ(1/2)C(d_i,2) can be as large as (1/2)C(2g,2) ≈ g², not g²/2; with |D_K| ≤ (2√p)^(d(d−1)) the square root contributes (2√p)^(C(d,2)) and the total is (2√p)^(C(2g,2)) ≈ (2√p)^(2g²). *Known:* J. Lee, "On the lower bound of the number of abelian varieties over F_p", Int. Math. Res. Not. IMRN 2022, no. 6, 4290–4317, DOI 10.1093/imrn/rnaa153 (arXiv:2002.04420v3), §3.1(2), inequality (8).
- **E21** (error; affects a stated result), v1 p.1, Theorem 0.1, and p.16, (28); published Theorem 0.1 and Proposition 3.23.
  - *Printed:* B(p,g) = o_ε(p^((17/2+ε)g²)), from #{isomorphism classes in an isogeny class} ≤ p^((33/4)g²(1+o(1))) in (28)
  - *Correction:* B(p,g) ≤ 2^(34g²)·p^((69/4)g²(1+o(1))) by the corrected argument; the sharpest published bound is B(p,g) ≤ p^((45/4)g²(1+o(1))) (Lee, Theorem 1.4). The exponent 17/2 is not established.
  - *Why:* Combine E19 (a factor 2 in two exponents), E20 (a factor 4 in the class-group exponent) and E7 (powers of 2 with exponent of order g² are not p^(o(g²)) for fixed p): (28) becomes 2^(34g²)p^(17g²(1+o(1))) and B(p,g) gains the factor p^(g²/4) of Corollary 2.2. *Known:* J. Lee, "On the lower bound of the number of abelian varieties over F_p", Int. Math. Res. Not. IMRN 2022, no. 6, 4290–4317, DOI 10.1093/imrn/rnaa153 (arXiv:2002.04420v3), Theorem 1.1 ("a (corrected) main result of [7]") and Theorem 1.4.

## Gaps

- **G0** (open). The published text is still not readable here (Project Euclid returns a JavaScript challenge). Lee 2022 shows that §3 was renumbered and its local count revised in print; its corrections are recorded as known (E6, E7, E19–E21). The maintainer's copy should be compared at review. [cc-442dc5] Earlier: Final 2018 paper not acquired; legitimate publisher download returned security HTML. All findings are v1-only.
- **G1** (resolved). The unpolarized constant is settled by E21: the corrected statement is Lee's Theorem 1.1, and the item states it. [cc-442dc5] Earlier: Sharp unpolarized numerical coefficient and original lower-count proof interiors remain unverified; existing corrected reciprocal/discriminant bounds retained.
- **G2** (handed to design). The replacement local and adelic bounds are routed (GN.2, GN.3, AA.4, the finite-field Part II); proving them is the design job's work. [cc-442dc5] Earlier: L1–L9/S1–S6 provide coarse local orbit/stabilizer and abstract D_*³h bounds. C3–C6 now give prime-field linear-dual conventions, torsion integrality detection, a finite-flat construction realizing finite-support tuples, the marked/rational-orbit comparison, and a finite-support adelic stabilizer assembly. The latter explicitly consumes p-Tate full faithfulness and the p-Frobenius-polynomial comparison, whose original arithmetic proofs are now decomposed in D1–D5, while their R07.2/A3/A6 geometric imports remain G8. Local order/maximal-order, coefficient-DVR, topology, trace-dual and flag-carrier adapters are not implemented; AA.1/AA.3 group/class-set hypotheses still require formal composition. General-q covariance is not solved. The sharp linear 4nδ estimate and literal stabilizer-depth-source remain withheld.
- **G3** (resolved). E8–E10 are recorded and the items use the corrected normalizations; reduced-trace-source now states the corrected Remark 4.8. [cc-442dc5] Earlier: Polarization normalization, rational NS, geometric/reduced trace and original Lang supplier closure remain as in predecessor.
- **G4** (resolved in part). The mass coefficient is 1/2 (E13). Gan–Yu (39) is routed to GN.3 with the check it needs; the residue-ratio lower bound (E12) goes to AnalyticNumberTheory AN.4; the free/projective comparison is routed. [cc-442dc5] Earlier: Gan–Yu dyadic measures, mass leading coefficient, residue-ratio bounds and free/projective comparison unresolved.
- **G5** (resolved). E14 now shows that the real-Weil factor B0 is not negligible; Theorem 0.2 is restated with the B0 alternative and an extended conjecture. [cc-442dc5] Earlier: Real-Weil/quaternionic conditional-scope and reduced-norm/narrow class-set obstructions unresolved.
- **G6** (resolved). Lemma 5.19 holds exactly for odd p (elliptic-pgroups-large); Corollary 5.20 is restated for odd p (E17). [cc-442dc5] Earlier: F₂ counterexample retained; only p≥7 repaired source lemma is routed; final-version comparison outstanding.
- **G7** (resolved). Corollary 5.14 is restated with the Kolmogorov distance and the (h−1)/g zero-gap mass (E15); CL limits remain a hypothesis (E16), routed to ST.5. [cc-442dc5] Earlier: Spacing normalization, asymptotic quantifiers, enhanced joint-limit existence/tightness and odd-prime convergence unresolved.
- **G8** (handed to design). The classical inputs (Tate, Honda–Tate, Dieudonné classification, Waterhouse) are items with owners; their proofs belong to the design and blueprint jobs, not to the extraction. [cc-442dc5] Earlier: D1–D5 freshly read WM71 Part II and M68 pp.65–66 and decompose p-realization degree/characteristic polynomials, semisimplicity, saturated injection, Frobenius block algebras and dimension counts, rational/integral p-Tate, and the p-local invariant. The previous original-p-proof lookup is discharged. Remaining: original R07.2 finite/p-divisible Dieudonné exact classification and length/rank proofs; A3 finite-flat quotient/torsion; A6 intrinsic degree polynomial and finite-rank Hom; PEL fixed-polarization/twist finiteness; polarization divisibility/positivity; split-prime existence; generic semisimple intertwiner assembly; the precise generic valuation-separation, fixed-Witt-ring, unramified tensor and central-simple descent adapters; local cyclic-invariant/algebraic–cohomological Brauer proof; global Brauer classification and Honda CM existence. Gan–Yu/Jacobowitz/Lang/Friedman–Washington and the inherited Euler/trace-formula and atomic-closure gaps remain. All are proof/source or adapter obligations, not new parallel carriers. V1–V5 close the mathematical decomposition and exact baseline audit of the fixed-Witt-ring and valuation-separation placeholders, replacing splitting-field valuations by quotient-ring determinant congruences. Eight generic implementation items are routed to a proposed LocalFields Part II; these are not implemented or independently reviewed. Unramified-field/tensor identification and central-simple descent remain separate, as do all named geometric and source obligations.
- **G9** (withdrawn). API outlines and unit tests are blueprint requirements (PROTOCOL §§4, 12), not paper-v1 extraction requirements (§16). The design and blueprint jobs derive them. [cc-442dc5] Earlier: Legacy schema/API normalization: of 44 definition/construction items, 37 inherited entries retain API/tests only in prose notes, and the inherited double-coset-level-map has string tests. The six structured entries (three inherited and three new here) each have a nonempty API, explicit uses and ≥3 typed tests. Preserve the existing mathematical content, but normalize the 38 legacy entries to consumer-derived API/uses and §12 name/kind/statement test objects before claiming complete. check_paper.py does not enforce this requirement.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LIPNOWSKI-TSIMERMAN-18.result.json`: ok, with status complete.
- `python3 research/blueprint/intake.py check-files` on the result, this report and the handoff note: 0 problems.
- **Library checks.** All 61 cited declarations were found again at Mathlib 082e2d3 and Tau Ceti f790474 (git grep). The new inputs were searched for too: the Hasse norm theorem, Lang's theorem, positive involutions and hermitian forms. None is in either library; the Hasse norm theorem is planned in Tau Ceti ClassFieldTheory Layer 13.
- **Checked by cc-442dc5.**
  - The v1 constants (14), (20), (26), (27) and (28), on the page images, against Lee §3.1.
  - The factorial asymptotic behind E13, and the corrected thresholds of Proposition 5.10.
  - The mass comparison behind E14.
  - Lemma 5.19 for odd p, and its counterexamples at p = 2.
  - The formula t = (2g/(em))·Trd in Remark 4.8.
  - DiPippo–Howe's Theorem 1.3 on its page image, and Lemmermeyer's Proposition 1.
- **Lean.** No Lean file is part of a paper job; none was written or compiled.

## Item index

| Item | Kind | Name | Locator | Status | Layers, declarations or route |
|---|---|---|---|---|---|
| /abelian-variety | definition | Abelian variety over a field | §0; §3 setup | library | tauceti:TauCeti.AlgebraicGeometry.AbelianVariety, tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.dim, tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.smooth |
| /unpolarized-count | definition | Unweighted abelian-variety count | §0 p.1 | planned | ArithmeticStatistics:ST.0 |
| /ppav-count | definition | Unweighted principally polarized count | §0 pp.1–2 | planned | ArithmeticStatistics:ST.0 |
| /polarization-fiber | definition | Number of polarizations on a fixed variety | §4.4; Conjecture 5.2 | missing | routed: ArithmeticStatistics:ST.0 |
| /main-unpolarized-source | theorem | Theorem 0.1, corrected: abelian varieties over F_p number p^(O(g²)) | Theorem 0.1; §3.2.3 (28), with Corollary 2.2 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /main-repeated-source | theorem | Theorem 0.3 (Proposition 4.17): most ppavs over F_p have a repeated factor | Theorem 0.3; Proposition 4.17 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /main-elliptic-source | theorem | Theorem 0.2 (Corollary 5.13), corrected: a large elliptic or B0 factor, conditionally | Theorem 0.2; Corollary 5.13 | missing | routed: ArithmeticStatistics:ST.5 |
| /trace-formula | theorem | Compactly supported trace formula | §1 (1)–(2) | planned | WeilConjectures:WC.0 |
| /weights-source | theorem | Weights used in the point-count heuristic | §1 p.3 | planned | DeligneWeightsAndPurity:DWP.7 |
| /isogeny | definition | Isogeny of abelian varieties | §3 setup | library | tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny, tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.isIsogeny_iff |
| /rational-endomorphism | definition | Rational endomorphism algebra | §3 pp.6–7 | planned | AbelianSchemesAndArithmeticModuli:A6 |
| /poincare-decomposition | theorem | Isogeny decomposition and semisimplicity | §3.2.2; Proposition 4.16 | planned | AbelianSchemesAndArithmeticModuli:A6 |
| /tate-module | definition | Prime-to-characteristic Tate module | §3 setup | planned | AbelianSchemesAndArithmeticModuli:A4 |
| /tate-hom | theorem | Tate full faithfulness over finite fields | §3 lattice classification; [25] | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /weil-polynomial | definition | Frobenius polynomial and reciprocity | §2; §4.3 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /isogeny-polynomial | theorem | Frobenius polynomial determines the isogeny class | Corollary 2.2, Tate input | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /honda-tate | theorem | Honda–Tate simple isogeny classification | §0; §3.2.2; Proposition 4.14 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /power-sum-count | theorem | Lemma 2.1, corrected: counting Weil polynomials | §2 Lemma 2.1 (corrected constant) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /isogeny-class-upper | theorem | Asymptotic count of isogeny classes | Corollary 2.2 with repaired power-sum-count | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /isocrystal | definition | Frobenius isocrystal carrier | §3 p-adic realization | library | mathlib:WittVector.Isocrystal, mathlib:WittVector.Isocrystal.frobenius, mathlib:WittVector.IsocrystalHom |
| /dieudonne-lattice | definition | Integral Dieudonné realization | §3 setup | planned | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 |
| /marked-lattice-space | definition | Prime-to-p and p lattice spaces | §3 equations (5)–(6) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /marked-quasi-isogeny | theorem | Marked quasi-isogenies classified by lattices | §3 (5)–(6) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /forget-marking | theorem | Isomorphism classes as rational orbits | §3 (7) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /prime-p-centralizer | theorem | The prime-field p-component reduction | Remark 3.2 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /local-order | definition | Local monogenic order | §3.1.2 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /saturation-normalization | theorem | Normalized lattice sandwiches | §3.1.2 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /flag-fiber | definition | Stable lattice with prescribed flag quotients | §3.1.3; Yun §4.8–4.9 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /extension-shear | theorem | Centralizer shears identify equivalent extensions | Lemma 3.1 and proof | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /yun-resultant-fiber | theorem | Resultant cardinality of a disjoint-spectrum fiber | Yun Lemma 4.9 pp.14–15; LT §3.1.1 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /extension-determinant-bound | theorem | Bound after removing zero eigenspaces | §3.1.4 pp.8–10 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /punctual-hilbert-count | definition | Finite-colength ideal count | Yun §4.12–4.13 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /yun-partition-formula | theorem | Yun finite-colength partition formula | Yun Proposition 4.13 pp.16–17 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /hilbert-crude-bound | theorem | Crude partition upper bound | LT §3.1.5; Yun Proposition 4.13 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /adelic-class-set | definition | Adelic class set of the endomorphism group | §3.2 (15) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /strong-approximation | theorem | Strong approximation supplier | §3.2.2 before (21) | planned | AdelicAlgebraicGroups:AA.4 |
| /nonabelian-class-comparison | theorem | Class-set comparison by reduced norms | §3.2.2 (21) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /class-formula | theorem | Analytic class number formula | §3.2.2 (22) | library | mathlib:NumberField.dedekindZeta_residue, mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT |
| /coarse-class-bound | theorem | Available uniform class-number bound | Coarser available replacement for §3.2.2 | library | tauceti:NumberField.classNumber_le_bound |
| /weil-discriminant-bound | theorem | Correct elementary discriminant estimate | §3.2.2 (26), corrected exponent | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /regulator-source | theorem | Explicit lower bound for regulators (Skoruppa), as quoted | §3.2.2 (23), [24] | planned | tauceti:Completed/EffectiveBounds#… |
| /residue-source | theorem | Explicit residue bound for Dedekind zeta functions (Louboutin) | §3.2.2 (24), [18]; used again in §5.4.2 (49) | missing | routed: AnalyticNumberTheory:AN.4 |
| /dual-poincare | definition | Dual variety and rigidified Poincaré bundle | §4.1; Conrad §1 | planned | AbelianSchemesAndArithmeticModuli:A2 |
| /polarization | definition | Polarization as a positive symmetric morphism | Definition 4.1; Conrad Definitions 2.1,3.2 | planned | AbelianSchemesAndArithmeticModuli:A2 |
| /mumford-map | construction | Mumford homomorphism of a line bundle | §4.1; Conrad Example 2.2 | planned | AbelianSchemesAndArithmeticModuli:A2 |
| /graph-pullback | theorem | Correct graph-pullback normalization | Conrad Example 2.2 pp.6–7, correcting LT §4.1 | missing | routed: AbelianSchemesAndArithmeticModuli:A2 |
| /phi-kernel | theorem | Kernel of the Mumford map | §4.1 (1)–(2); Conrad Lemma 2.3 and p.8 | missing | routed: AbelianSchemesAndArithmeticModuli:A2 |
| /phi-ample-isogeny | theorem | Ample line bundles induce isogenies | §4.1 (3); Conrad Remark 2.4 | planned | AbelianSchemesAndArithmeticModuli:A2 |
| /finite-field-polarization-descent | theorem | Line-bundle realization over a finite field | Remark 4.2; Conrad Theorem 2.6 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /polarized-isomorphism | definition | Isomorphism of symmetric morphisms | Definition 4.3 | planned | AbelianSchemesAndArithmeticModuli:A2 |
| /phi-pullback | theorem | Pullback covariance | Remark 4.4 (29) | planned | AbelianSchemesAndArithmeticModuli:A2 |
| /rosati | definition | Rosati involution | Definition 4.5; Conrad §3 | planned | AbelianSchemesAndArithmeticModuli:A2 |
| /ns-rational | definition | Rational Néron–Severi space | §4.2 with rationalization made explicit | missing | routed: AbelianSchemesAndArithmeticModuli:A2 |
| /ns-rosati-map | construction | Normalized Néron–Severi/Rosati map | §4.2, Lemma 4.6 with rational domain corrected | missing | routed: AbelianSchemesAndArithmeticModuli:A2 |
| /endomorphism-trace | definition | Geometric endomorphism trace | Definition 4.7; Conrad Definition 3.3 | planned | AbelianSchemesAndArithmeticModuli:A6 |
| /degree-polynomial | theorem | Degree characteristic polynomial | §4.3, Mumford §19 Theorem 4 | planned | AbelianSchemesAndArithmeticModuli:A6 |
| /rosati-positivity | theorem | Positive Rosati trace pairing | §4.3; Conrad Theorem 3.4 pp.9–10 | planned | AbelianSchemesAndArithmeticModuli:A6 |
| /positive-ample | theorem | Ample classes and positive symmetric elements | Proposition 4.9 | missing | routed: AbelianSchemesAndArithmeticModuli:A2 |
| /real-cone | theorem | Real ample-cone matrix description | Proposition 4.10 | missing | routed: AbelianSchemesAndArithmeticModuli:A6 |
| /polarization-orbits | theorem | Polarizations as Rosati-conjugacy orbits | Proposition 4.11 | missing | routed: AbelianSchemesAndArithmeticModuli:A2 |
| /integer-matrix-example | theorem | No-CM elliptic-power orbit example | Example 4.12 | missing | routed: AbelianSchemesAndArithmeticModuli:A2 |
| /cm-field | definition | CM field and maximal real subfield | §4.4.1; Definition 5.1 | library | mathlib:NumberField.IsCMField |
| /cm-conjugation | definition | Intrinsic CM conjugation | Definition 5.1 | library | mathlib:NumberField.IsCMField.complexConj, mathlib:NumberField.IsCMField.complexEmbedding_complexConj, mathlib:NumberField.IsCMField.complexConj_apply_apply |
| /cm-unit-orbits | theorem | Polarizations for a maximal CM endomorphism order | Example 4.13 | missing | routed: AbelianSchemesAndArithmeticModuli:A2 |
| /prime-field-end-algebra | theorem | Commutative endomorphisms in the nonreal prime-field case | Proposition 4.14(1) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /waterhouse-orders | theorem | Realization of nonreal prime-field orders | Proposition 4.14(2), Waterhouse Theorem 6.1 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /squarefree-pol-count | theorem | Squarefree nonreal polarization bound | Proposition 4.16 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /model-ring | definition | Model ring with positive involution | Definition 5.1 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /model-orbit-count | definition | Positive-unit model orbit count | Definition 5.1; Conjecture 5.2 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /model-comparison-conjecture | theorem | Conjectural comparison with the model ring | Conjecture 5.2 | missing | routed: ArithmeticStatistics:ST.5 |
| /unit-norm-label | definition | Totally positive unit norm labels | §5.2 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /unitary-group | definition | Unitary group of a definite hermitian space | §5.2 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /hermitian-lattice | definition | Integral projective hermitian lattice | Definition 5.3 | planned | GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /hermitian-dual | definition | Dual and unimodularity | Definition 5.3 | planned | GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /gram-orbit-bijection | theorem | Free unimodular lattices and Gram congruence | Proposition 5.4 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /norm-ideal | definition | Norm ideal of a local hermitian lattice | Definition 5.5 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /local-hermitian-classification | theorem | Local unimodular classification input | Proposition 5.6 and following paragraph | planned | GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /hermitian-genus | definition | Genus of a hermitian lattice | §5.3 (37) | planned | GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /genus-double-cosets | theorem | Hermitian genus as a unitary class set | §5.3 (37) | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /hermitian-mass | definition | Weighted hermitian genus mass | §5.4 (38) | planned | GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /tamagawa-mass | theorem | Unitary Tamagawa mass formula | §5.4 (38) | planned | GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /density-source | theorem | Stabilizer volume of a self-dual hermitian lattice (Gan–Yu), as used in (39) | §5.4 (39); Gan–Yu [10, Theorem 10.20] | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /relative-discriminant | theorem | Elementary CM relative-discriminant bound | §5.4.1 (41), corrected factor | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /factorial-asymptotic | theorem | Factorial product asymptotic | §5.4.3, elementary audit of (39) to (51) | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /mass-asymptotic-source | theorem | Mass of unimodular hermitian lattices, corrected (51)–(53) | §§5.4.3–5.4.4 (51)–(53) | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /gl-card | theorem | Finite general linear group cardinality | Lemma 5.8; Example 5.17 | library | mathlib:Matrix.card_GL_field, mathlib:Matrix.card_matrix |
| /finite-integral-group | theorem | Minkowski finite integral group bound | Lemma 5.8 and full proof | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /mass-cardinality-comparison | theorem | Passing from mass to class count | §5.4.4 (52)–(53) | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /free-projective-comparison | theorem | Free versus projective mass classes | Remark 5.7; (54) | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /model-count-source | theorem | Orbit count on a model ring, corrected (55) | §5.4.5 (55) | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /convex-concentration | theorem | Convex mass-concentration inequality | Lemma 5.9 | missing | routed: ArithmeticStatistics:ST.5 |
| /model-concentration-source | theorem | Proposition 5.10, corrected threshold | Proposition 5.10 | missing | routed: ArithmeticStatistics:ST.5 |
| /split-prime-density | theorem | Density of primes splitting in a class-number-one CM field | Lemma 5.11 proof | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /cm-elliptic-existence | theorem | Elliptic curve with class-number-one endomorphisms | Lemma 5.11 proof | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /elliptic-power-source | theorem | Lemma 5.11, corrected: principal polarizations on E^g | Lemma 5.11 (56) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /spacing-measure | definition | Normalized eigenangle spacing measure | §5.6, expanded convention | missing | routed: ArithmeticStatistics:ST.5 |
| /spacing-source | theorem | Corollary 5.14, corrected: spacing discrepancy | Corollary 5.14 | missing | routed: ArithmeticStatistics:ST.5 |
| /cl-measure | definition | Cohen–Lenstra probability measure | §5.7.1 | planned | ArithmeticStatistics:ST.5 |
| /friedman-washington | theorem | Random integral matrices and Cohen–Lenstra | §5.7.1 [9] | planned | ArithmeticStatistics:ST.5 |
| /enhanced-cl | definition | Proposed enhanced Cohen–Lenstra law | Definition 5.16 | missing | routed: ArithmeticStatistics:ST.5 |
| /cl-two-prime | theorem | Two-extension zero-cokernel probability at two | Example 5.17, first case | missing | routed: ArithmeticStatistics:ST.5 |
| /cl-odd-prime | theorem | Uniform positive bound at odd primes | Example 5.17, second case | missing | routed: ArithmeticStatistics:ST.5 |
| /enhanced-cl-conjecture | theorem | Source enhanced-statistics conjecture | Conjecture 5.18 | missing | routed: ArithmeticStatistics:ST.5 |
| /elliptic-pgroups-large | theorem | Lemma 5.19, corrected: odd characteristic | Lemma 5.19 (corrected: p odd) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /point-count-isogeny | theorem | Point counts are isogeny invariant | Corollary 5.20 proof | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /enhanced-failure-source | theorem | Corollary 5.20, corrected: odd p | Corollary 5.20 | missing | routed: ArithmeticStatistics:ST.5 |
| /reduced-trace-source | theorem | Remark 4.8, corrected: trace versus reduced trace | Remark 4.8 | missing | routed: AbelianSchemesAndArithmeticModuli:A6 |
| /ramification-count | theorem | Ramified-prime count from the relative discriminant | §5.4.2 (44), sharper elementary bound | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /monogenic-trace-dual-library | theorem | Monogenic trace-dual formula | Mathlib/RingTheory/DedekindDomain/Different.lean:592–631 at 082e2d37e8b0463410cdb532e111cd43d5a66174 | library | mathlib:traceForm_dualSubmodule_adjoin, mathlib:Submodule.traceDual, mathlib:Submodule.traceDual_span_of_basis |
| /complete-hensel-library | theorem | Hensel lifting from adic completeness | Mathlib/RingTheory/Henselian.lean:88–178 at 082e2d37e8b0463410cdb532e111cd43d5a66174 | library | mathlib:IsAdicComplete.henselianRing, mathlib:HenselianRing.is_henselian |
| /local-length-scalar-library | theorem | Length under restriction of local scalars | Mathlib/RingTheory/LocalRing/Length.lean:54–81 at 082e2d37e8b0463410cdb532e111cd43d5a66174 | library | mathlib:IsLocalRing.length_restrictScalars |
| /monogenic-conductor-bound | theorem | Monogenic conductor and dual sandwich | §3.1.2; continuation L1 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /coefficient-dvr-model | theorem | Residue-correct coefficient DVR | Yun §4.12; LT §3.1.5; continuation L2 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /weighted-partition-cumulative-bound | theorem | Weighted partition cumulative bound | Yun Proposition 4.13; continuation L3 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /rank-one-local-class-bound | theorem | Rank-one local ideal-class bound | LT §3.1.2 and corrected §3.1.5; continuation L4 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /repeated-block-orbit-bound | theorem | Repeated-block local orbit bound | LT §§3.1.3–3.1.5; continuation L5–L6 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /semisimple-local-orbit-bound | theorem | Semisimple local orbit bound with multiplicities | LT §§3.1.1–3.1.6 and Yun Lemma 4.9; continuation L7 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /adelic-local-orbit-bound | theorem | Adelic local-orbit bound for Weil polynomials | LT §3.1.6; continuation L8 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /isotypic-stabilizer-congruence-bound | theorem | Isotypic integral stabilizer via a congruence kernel | LT §3.2.1 p.12; continuation L9 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /smith-quotient-supplier | theorem | Full-rank PID quotient in Smith coordinates | Mathlib/LinearAlgebra/FreeModule/Finite/Quotient.lean:37–77; FreeModule/PID.lean:576–641 | library | mathlib:Submodule.quotientEquivPiSpan, mathlib:Submodule.smithNormalFormBotBasis_def, mathlib:Submodule.smithNormalFormCoeffs_ne_zero |
| /prime-power-cardinality-supplier | theorem | Cardinality of a prime-power quotient | Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean:52–85,112–180 | library | mathlib:cardQuot_pow_of_prime, mathlib:Submodule.cardQuot_apply |
| /dvr-unit-power-supplier | theorem | Unit times uniformizer power in a DVR | Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:320–344 | library | mathlib:IsDiscreteValuationRing.eq_unit_mul_pow_irreducible |
| /double-coset-relation-supplier | theorem | Representative criterion for a double coset | Mathlib/GroupTheory/DoubleCoset.lean:73–126 | library | mathlib:DoubleCoset.eq |
| /orbit-index-supplier | theorem | Index of a stabilizer equals its orbit cardinal | Mathlib/GroupTheory/Index.lean:891–900 | library | mathlib:MulAction.index_stabilizer |
| /finite-dvr-determinant-index | theorem | Determinant index of a stable DVR lattice | Yun v2 Lemma 4.9 determinant/length step; continuation S1 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /nonisotypic-stabilizer-bound | theorem | Integral stabilizer controlled by successive graded lattices | LT v1 §§3.1.1,3.2.1, especially (20); Yun v2 Lemma 4.9 proof; replacement proof S2–S3 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.3 |
| /double-coset-level-map | construction | Nested right-level map on double cosets | LT v1 §3.2, (15) and use of (20); AA.4 level-map specialization; continuation S4 | missing | routed: AdelicAlgebraicGroups:AA.4 |
| /double-coset-level-cardinality | theorem | Finite-index bound for a double-coset level change | LT v1 §3.2.3 level-index step; continuation S4 | missing | routed: AdelicAlgebraicGroups:AA.4 |
| /double-coset-conjugate-level | theorem | Conjugate right levels have equivalent double-coset sets | LT v1 §3.2 choice of integral compact subgroup; continuation S5 | missing | routed: AdelicAlgebraicGroups:AA.4 |
| /finite-support-product-index | theorem | Index of product subgroups with finite exceptional support | LT v1 (20), local-to-global index step; continuation S5 | missing | routed: AdelicAlgebraicGroups:AA.4 |
| /conditional-rational-orbit-bound | theorem | Conditional rational-orbit bound from local lattices | LT v1 §§3.1.6,3.2.1–3.2.3; continuation S5–S6 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /semisimple-bicommutant-supplier | theorem | Finite semisimple-module bicommutant supplier | Mathlib/RingTheory/SimpleModule/Basic.lean:552–584, pinned commit | library | mathlib:Module.Finite.toModuleEnd_moduleEnd_surjective, mathlib:jacobson_density |
| /padic-compactness-supplier | theorem | Compactness of p-adic integers | Mathlib/NumberTheory/Padics/ProperSpace.lean:38–61, pinned commit | library | mathlib:PadicInt.compactSpace |
| /compact-subsequence-supplier | theorem | Convergent subsequences in first-countable compact sets | Mathlib/Topology/Sequences.lean:284–302, pinned commit | library | mathlib:IsCompact.tendsto_subseq |
| /fixed-polarization-finiteness | theorem | Finite-field finiteness at fixed polarization degree | Tate 1966 §2, printed p.136, Hyp(k,A,d,ℓ) | missing | routed: PELModuli:M6 |
| /polarization-divisibility | theorem | Prime-to-characteristic divisibility of a polarization | Tate 1966 Proposition 1 proof, p.137, invoking Weil [12] | missing | routed: AbelianSchemesAndArithmeticModuli:A2 |
| /tate-isotropic-image | theorem | Tate’s isotropic image lemma | Tate 1966 Proposition 1, pp.136–137 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /tate-split-commutant | theorem | Tate full faithfulness at a split Frobenius prime | Tate 1966 Proposition 2 and following paragraph, pp.137–138 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /p-tate-hom | theorem | Integral Tate full faithfulness at the characteristic prime | WM71 Part II Theorem 1, pp.60–61; integral saturation in Part I pp.55–57; Waterhouse 1969 §1.2. | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /prime-field-covariant-dual | construction | Prime-field linear-dual realization | Waterhouse 1969 §§1.2 and 2.1; LT v1 Remark 3.2; continuation C3 | missing | routed: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 |
| /torsion-integrality-detection | theorem | Torsion detects integral quasi-homomorphisms | Waterhouse 1969 §1.1–1.2; Tate 1966 Lemma 1; continuation C4 | missing | routed: AbelianSchemesAndArithmeticModuli:A6 |
| /prime-field-lattice-realization | theorem | Finite-support lattice tuples are realized over the prime field | Waterhouse 1969 §§1.1–1.2 and lattice changes in Theorem 6.1; LT v1 §3 (5)–(6); continuation C4 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /prime-field-marked-classification | theorem | Prime-field marked and unmarked classification | LT v1 §3 (5)–(7); continuation C4 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /good-prime-lattice-orbit | theorem | Unique local orbit away from the minimal-polynomial discriminant | LT v1 §3.1 integral-order setup; Waterhouse 1969 Theorem 6.1 good-prime step; continuation C5 | missing | routed: GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /prime-field-adelic-stabilizers | theorem | Finite-support adelic stabilizers in a prime-field isogeny class | LT v1 §§3.1.6,3.2.1–3.2.3; continuation C5 | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /prime-field-isogeny-class-bound | theorem | Coarse prime-field isomorphism count at fixed adelic level | LT v1 §§3.1.6–3.2.3; continuation C6, coarse replacement only | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /prime-field-p-frobenius | theorem | Prime-field p-realization Frobenius polynomial | M68 §1 pp.65–66; WM71 Part II p.60; specialization a=1 of p-frobenius-semisimplicity. | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /simple-module-end-dimension-supplier | theorem | Dimension of an endomorphism algebra over a simple algebra | TauCeti/RingTheory/Semisimple/EndAlgebra.lean, variables at lines 109–145 and theorem at line 144, pinned f790474. | library | tauceti:TauCeti.IsSimpleRing.finrank_end_mul_finrank_eq_sq |
| /brauer-opposite-supplier | theorem | Opposite algebra gives the inverse Brauer class | TauCeti/Algebra/BrauerGroup/Group.lean, lines 130–207, mk_op. | library | tauceti:TauCeti.BrauerGroup.mk_op |
| /centralizer-tensor-supplier | construction | Tensor decomposition along a central simple subalgebra | TauCeti/Algebra/CentralSimple/Centralizer.lean, Centralizer section, tensorCentralizerAlgEquiv and tensorCentralizerAlgEquiv_tmul. | library | tauceti:TauCeti.tensorCentralizerAlgEquiv, tauceti:TauCeti.tensorCentralizerAlgEquiv_tmul |
| /finite-dieudonne-exactness | theorem | Exact finite-level contravariant Dieudonné comparison | WM71 Part I Theorem 4, p.56; M68 §1, p.65. | planned | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 |
| /finite-dieudonne-length-rank | theorem | Dieudonné length measures group-scheme rank | WM71 Part I Theorem 4, p.56; M68 §1, p.65. | planned | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 |
| /local-cyclic-invariant-supplier | theorem | Invariant of an unramified cyclic algebra | WM71 Part II proof of Theorem 2, p.61; imported local invariant convention in ClassFieldTheory Layer 5. | planned | tauceti:TauCetiRoadmap/ClassFieldTheory#… |
| /p-realization-degree-valuation | theorem | Dieudonné determinant detects the p-part of isogeny degree | M68 §1, p.65, determinant/length/degree comparison; WM71 Part I pp.56–57. | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /p-realization-characteristic-polynomial | theorem | Characteristic polynomial on the p-realization | M68 §1, pp.65–66; WM71 Part I p.57 and Part II p.60; handoff P1 expanded in report D1. | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /p-frobenius-semisimplicity | theorem | Semisimplicity of the linear q-Frobenius realization | M68 p.66, paragraph before Theorem 1; WM71 Part I p.57 and Part II p.60. | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /p-realization-saturated-hom | theorem | Saturated injection on integral p-realization Hom groups | WM71 Part I Theorems 3 and 5, pp.55–56, and saturation step p.57; expanded handoff P2/report D2. | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /p-frobenius-block-algebra | construction | Algebra acting on a Frobenius polynomial block | WM71 Part II p.60 cyclic quotient and p.61 presentation; explicit finite-sum presentation of handoff P3. | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /p-frobenius-block-split | theorem | Central simplicity of a Frobenius block algebra | WM71 Part II pp.60–61; weighted-cycle expansion of handoff P3/report D3. | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /p-frobenius-centralizer-dimension | theorem | Dimension of the semilinear Frobenius commutant | WM71 Part II Theorem 1 proof, pp.60–61; handoff P3/report D3. | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /rational-p-tate-hom | theorem | Rational p-Tate comparison | WM71 Part II Theorem 1 proof, pp.60–61. | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /p-endomorphism-local-invariant | theorem | Characteristic-prime invariant of a simple endomorphism algebra | WM71 Part II Theorem 2 and proof, pp.60–61; LT v1 Proposition 4.14(1). | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /witt-coordinate-supplier | theorem | Witt maps and Frobenius act on Witt coordinates | Mathlib/RingTheory/WittVector/Basic.lean:253–267; Frobenius.lean:258–278. | library | mathlib:WittVector.map_coeff, mathlib:WittVector.map_injective, mathlib:WittVector.coeff_frobenius_charP, mathlib:WittVector.frobenius_zmodp |
| /witt-prime-comparison-supplier | construction | Prime-field Witt vectors are the p-adic integers | Mathlib/RingTheory/WittVector/Compare.lean:155–208. | library | mathlib:WittVector.equiv, mathlib:WittVector.toPadicInt, mathlib:WittVector.fromPadicInt |
| /prime-field-fixed-supplier | theorem | Fixed elements of absolute Frobenius in a field | Mathlib/FieldTheory/Finite/Basic.lean:720–756. | library | mathlib:Subfield.mem_bot_iff_pow_eq_self, mathlib:mem_bot_iff_intCast |
| /padic-approximation-supplier | construction | Bounded integral representatives modulo p powers | Mathlib/NumberTheory/Padics/RingHoms.lean:354–440. | library | mathlib:PadicInt.appr, mathlib:PadicInt.appr_lt, mathlib:PadicInt.appr_spec |
| /monic-factor-integrality-supplier | theorem | A monic fraction-field factor has integral coefficients | Mathlib/RingTheory/Polynomial/GaussLemma.lean:57–104. | library | mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd |
| /monic-norm-resultant-supplier | theorem | Norm in a monic polynomial quotient equals the resultant | TauCeti/RingTheory/Polynomial/Resultant/AdjoinRoot.lean:269–303. | library | tauceti:AdjoinRoot.norm_mk_eq_resultant, tauceti:AdjoinRoot.norm_mk_eq_det_mulModByMonic |
| /resultant-algebra-supplier | theorem | Base change, multiplicativity and monic degree padding for resultants | Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:140,581–585,641–665,908–921; TauCeti/RingTheory/Polynomial/Resultant/Basic.lean:65–71. | library | mathlib:Polynomial.resultant_map_map, mathlib:Polynomial.resultant_mul_left, mathlib:Polynomial.resultant_pow_left, mathlib:Polynomial.resultant_eq_zero_iff, tauceti:Polynomial.Monic.resultant_of_le |
| /charpoly-conjugacy-supplier | theorem | Characteristic polynomials commute with scalar maps and conjugation | Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:175–178,285–293. | library | mathlib:Matrix.charpoly_map, mathlib:Matrix.charpoly_units_conj |
| /witt-constant-embedding | construction | Canonical p-adic constants in Witt vectors | M68 §1, p.65, coefficient and polynomial uniqueness inputs; self-contained adapter proof in report V1–V5 (not an assertion that Lang VII §1 Lemma 1 was read). | missing | routed: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 |
| /witt-frobenius-fixed-ring | theorem | Frobenius-fixed Witt vectors are precisely p-adic constants | M68 §1, p.65, coefficient and polynomial uniqueness inputs; self-contained adapter proof in report V1–V5 (not an assertion that Lang VII §1 Lemma 1 was read). | missing | routed: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 |
| /semilinear-charpoly-descent | theorem | Integral characteristic polynomial descends along Witt Frobenius | M68 §1, p.65, coefficient and polynomial uniqueness inputs; self-contained adapter proof in report V1–V5 (not an assertion that Lang VII §1 Lemma 1 was read). | missing | routed: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 |
| /monic-coefficient-lift | theorem | Monic polynomial lifting at an ideal-power precision | M68 §1, p.65, coefficient and polynomial uniqueness inputs; self-contained adapter proof in report V1–V5 (not an assertion that Lang VII §1 Lemma 1 was read). | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /resultant-congruence | theorem | Resultant respects congruence in the second polynomial | M68 §1, p.65, coefficient and polynomial uniqueness inputs; self-contained adapter proof in report V1–V5 (not an assertion that Lang VII §1 Lemma 1 was read). | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /resultant-factor-slope | theorem | A shifted approximate factor detects its multiplicity | M68 §1, p.65, coefficient and polynomial uniqueness inputs; self-contained adapter proof in report V1–V5 (not an assertion that Lang VII §1 Lemma 1 was read). | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /resultant-valuation-recognition | theorem | Monic polynomials are determined by nonzero resultant valuations | M68 §1, p.65, coefficient and polynomial uniqueness inputs; self-contained adapter proof in report V1–V5 (not an assertion that Lang VII §1 Lemma 1 was read). | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /padic-resultant-recognition | theorem | Integer polynomial tests determine a monic p-adic polynomial | M68 §1, p.65, coefficient and polynomial uniqueness inputs; self-contained adapter proof in report V1–V5 (not an assertion that Lang VII §1 Lemma 1 was read). | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /dipippo-howe | theorem | DiPippo–Howe lower bound for isogeny classes | Remark 2.3; [6] DiPippo–Howe, J. Number Theory 73 (1998), Theorem 1.3 (arXiv:math/9803097v3, p.2) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /positive-involution-cm | theorem | A positive involution of a CM field is complex conjugation | §4.5 before Proposition 4.16 and its proof; [19, §21] (Albert's classification) | missing | routed: AbelianSchemesAndArithmeticModuli:A6 |
| /hasse-norm-theorem | theorem | Hasse norm theorem for cyclic extensions | Example 4.13 | planned | tauceti:TauCetiRoadmap/ClassFieldTheory#… |
| /ambiguous-unit-norms | theorem | Units that are norms modulo norms of units (Lemmermeyer) | Example 4.13, [17] Lemmermeyer, Proposition 1 (arXiv:1309.1071v1, p.2) | missing | routed: part-ii AbelianSchemesAndArithmeticModuliPartIIFiniteFields |
| /hermitian-hasse-principle | theorem | Hasse principle for hermitian forms (Landherr) | Proof of Proposition 5.4; [22, Chapter 10, Theorem 1.1] (Scharlau) | planned | GeometryOfNumbersAndQuadraticArithmetic:GN.2 |
| /lang-theorem | theorem | Lang's theorem over finite fields | §5.4.2, the exact sequence before (47) | missing | routed: ReductiveGroupsPartII:RG2.3 |

---

# Checkpoint record (preserved)

The reports of the earlier checkpoints follow unchanged. Item notes cite their sections (L1–L9, S1–S7, C0–C7, D0–D7, V0–V6). Where they call a claim withheld, or a route or gap open, the sections above supersede them.

# Coefficient recognition before the p-Tate comparison

**Partial checkpoint — Codex, codex-a71f92, 23 September 2026; Refs #1332.**

This continues [PR #2215](https://github.com/CBirkbeck/tauceti-explorer/pull/2215)
and preserves its incorporation of ChatGPT Pro's
[PR #2204](https://github.com/CBirkbeck/tauceti-explorer/pull/2204).
It is not an independent review. The inventory is now **183 items: 30 library,
29 planned, 124 missing**, with twelve routes. All 167 inherited item IDs,
kinds, statuses and statements, all inherited route memberships, all nineteen
source findings and the nineteen withheld claims remain unchanged. Only the
p-characteristic-polynomial item's proof/dependencies/note are extended.

V1–V5 resolve two explicit generic proof/audit obligations in D1: Witt
Frobenius constants and polynomial recognition by resultant valuations.
They do not prove the geometric Dieudonné/degree inputs or complete LT.
Eight supplier blocks are imported from the actual pinned declarations;
eight remaining adapter implementations have a proposed shared LocalFields
Part II owner. There is no new Witt, DVR, valuation, polynomial or quotient
algebra carrier.

## V0. Source, baseline and ownership boundary

[Milne 1968](https://www.jmilne.org/math/articles/1968a.pdf?download=1)
was downloaded on 23 September 2026, SHA-256
8abdaf4fa604d5ed7faee3f9d4e9dc9382dc35d7b79382fe3540f495fe98fc35,
1,229,128 bytes. Published pp.65–66 were freshly image-read: their text
extraction is empty. The full LT/WM71 and other readings remain credited
to the earlier checkpoints. Lang's cited VII §1 Lemma 1 was **not** acquired.
The proofs below expand the previous handoff mathematically rather than
claim a reading of that book. No fresh journal-version comparison was made.

Working explorer snapshot: 203b2166cc0a6a8db1a6c5f1d7ca3f79a8c503c3.
Read reviewed AUDIT-04 coverage for LocalFieldsRamification Layers 0 and 2,
the complete upstream LocalFieldsRamification document and the relevant
R07.2/CR.3/CR.4/PR.4/PR.5 descriptions. The complete GlobalNumberFields
document read in the preceding claim was byte-compared unchanged.
The finite-length-DVR and Kato-Swan Part II candidate briefs were checked:
neither owns coefficient recognition. Portfolio and pinned-tree searches
found no declaration of the two requested adapters.

| Exact pinned import | Scope used here |
| --- | --- |
| WittVector.map_coeff, map_injective, coeff_frobenius_charP, frobenius_zmodp | Witt coordinates, not ghost coordinates; characteristic p for the Frobenius formula |
| WittVector.equiv, toPadicInt, fromPadicInt | The implemented ring equivalence W(F_p)≃Z_p |
| Subfield.mem_bot_iff_pow_eq_self, mem_bot_iff_intCast | In a characteristic-p field, x^p=x exactly in the prime subfield; finiteness is unnecessary |
| PadicInt.appr, appr_lt, appr_spec | Integer coefficient representatives modulo p^N |
| IsIntegrallyClosed.eq_map_mul_C_of_dvd | Monic factors over the fraction field descend to an integrally closed coefficient ring |
| AdjoinRoot.norm_mk_eq_resultant, norm_mk_eq_det_mulModByMonic | Norm and multiplication determinant in the quotient by a monic polynomial; irreducibility unnecessary |
| Polynomial.resultant_map_map, resultant_mul_left, resultant_pow_left, resultant_eq_zero_iff, Monic.resultant_of_le | Scalar maps, factor multiplicities, nonvanishing and explicit degree-padding control |
| Matrix.charpoly_map, charpoly_units_conj | Base change and invariance under conjugation |

The JSON locators name the containing files and lines. Their ten files were
byte-matched against raw GitHub at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.
Library status applies to those actual statements, not to their unimplemented
compositions below.

The proposed **Local fields and ramification, Part II: Witt constants and
polynomial recognition** starts beyond the existing substrate. It owns
only these generic algebraic compositions, including their stronger
field/DVR generality. The finite-field abelian-variety Part II imports them.
The existing local-field Layer 2 still owns the unramified-field/Frobenius
and tensor-factor arithmetic; CR/R07 still own their geometric realizations.
Neither finite-length-module classification nor derived Frobenius fixed
points is re-planned. This candidate must be independently reviewed before
activation; it is not an accepted atlas stage.

## V1. Identify the actual Frobenius-fixed coefficient image

For a prime p and any field k of characteristic p, define the ring map

    ι_k : Z_p → W(k)
        = W(F_p→k) ∘ (WittVector.equiv p)⁻¹.

This is witt-constant-embedding. Its injectivity, naturality in k and
coefficient formula are compositions of the pinned Witt APIs. In particular,
the coordinate formula uses the Witt coordinates of the inverse comparison,
not the residue of z repeated as a constant sequence.

For x∈W(k), Witt Frobenius satisfies (Fx)_j=x_j^p. Thus Fx=x iff every
coordinate lies in F_p. Lift each coordinate uniquely to F_p, forming
y∈W(F_p); then W(F_p→k)y=x, and z=equiv(y) is the unique desired preimage.
Conversely Frobenius is the identity on W(F_p). This proves
witt-frobenius-fixed-ring:

    Fx=x  ⇔  ∃! z∈Z_p, ι_k(z)=x.

No finiteness or perfection of k is needed for this statement. A field
hypothesis is essential to this proof: an arbitrary product F_p-algebra
can have extra Frobenius-fixed elements.

Two discriminating conventions are recorded in the tests. Over F_9, F²
fixes every vector, but F need not. Also the vector (0,t,0,…) for
t²+1=0 in F_9 has all ghost coordinates zero in characteristic three,
yet F sends its second Witt coordinate to t³=−t. Ghost coordinates cannot
be used as an injective comparison here. Finally ι_k(3) has Witt
coordinates beginning (0,1), not the Teichmüller lift of its residue zero.

## V2. Descend the characteristic polynomial, not the Frobenius matrix

Let k now be perfect, W=W(k), L=Frac(W), and σ the extended Witt Frobenius.
Let T be a square matrix over W, and suppose B is invertible over L with

    T_L = B σ(T_L) B⁻¹.

The pinned characteristic-polynomial identities give σ(charpoly_L T_L)
=charpoly_L T_L. Since W→L is injective, the coefficients of charpoly_W T
are fixed in W. V1 supplies their unique preimages in Z_p, hence the unique
monic descended polynomial of the same degree.

This is semilinear-charpoly-descent. In the p-realization application B
represents the semilinear Frobenius, which becomes invertible after
inverting p. **B need not be invertible over W.** Conjugate over L first
and descend the coefficients by injectivity. No semisimplicity of T is
required. A nilpotent 2×2 matrix has polynomial X²; the empty matrix has
polynomial 1. In contrast, σ²-invariance over F_9 alone cannot descend a
coefficient to Z_3.

## V3. Monic lifts and resultant congruences on existing carriers

For the generic argument, let O be any DVR, π a uniformizer and K=Frac(O).
Let ι:D→O be a commutative-ring homomorphism surjective modulo (π^N) for
every N≥1. Neither a finite residue field nor completeness is assumed.

monic-coefficient-lift chooses representatives of the finitely many
nonleading coefficients of a monic f∈O[X] modulo π^N and retains leading
coefficient exactly 1. This produces a monic g∈D[X] of the same degree.
For f=1 choose 1. For Z→Z_3, the bounded lift of X−1 modulo 9 is X+8.
The special Z→Z_p case is supplied by PadicInt.appr_spec; the generic
lemma merely assumes the stated quotient-surjectivity.

resultant-congruence says that for monic S and arbitrary G,H over a
commutative ring, coefficientwise congruence modulo an ideal I gives

    Res(S,G) ≡ Res(S,H) mod I.

Apply the quotient coefficient map to a Sylvester determinant with a
**common valid second degree bound**, using Monic.resultant_of_le
to compare each actual-degree resultant. This handles degree drops in
G or H. If I is the whole ring the assertion is trivial; otherwise
monicity preserves the first degree after reduction. For example,
S=X, G=1+3X, H=1 all give resultant 1 despite the degree change.
The norm-as-multiplication-determinant description is an equivalent proof.

## V4. Detect multiplicities without a splitting-field valuation

Fix a monic R∈O[X], irreducible over K, of positive degree d. Write
P=R^e S with R not dividing S over K. The monic Gauss lemma ensures the
factors have coefficients in O. Put c=v(Res(S,R)); this is finite because
R and S are coprime over K. The convention is v(π)=1, and v is used here
only on nonzero elements.

Choose for n≥1 an O-polynomial ψ_n satisfying

    ψ_n ≡ R+π^n mod π^(2n), coefficientwise.

In O[X]/(R), a free rank-d O-module even when its reduction is nonreduced,
multiplication by ψ_n is

    π^n (I+π^n M_n).

The determinant of I+π^n M_n reduces to 1 in the residue field, hence is
a unit. The existing norm–resultant identity therefore gives
v Res(R,ψ_n)=nd. On the complementary factor, V3 gives

    Res(S,ψ_n) ≡ Res(S,R) mod π^n.

For n>c, its valuation is c. Multiplicativity now proves
resultant-factor-slope:

    v Res(P,ψ_n) = n d e + c,  whenever n≥1 and n>c.

This includes e=0 and S=1. A factor of degree d occurring e times gives
slope de, not e. Accuracy only modulo π^n would allow ψ_n=R itself and
a zero resultant, so the 2n precision has a real role.

For monic P,Q∈O[X], suppose their valuations agree against every monic
test from D[X] for which **both** resultants are nonzero. Choose R to be
each nonconstant irreducible factor of PQ over K. Lift R+π^n monically
from D modulo π^(2n), by V3. The two slope formulas apply for all
sufficiently large n and make both resultants nonzero. Subtract the
equality at consecutive n to obtain d e_P=d e_Q, hence e_P=e_Q.
Monicity removes the remaining unit factor. This proves
resultant-valuation-recognition, including P=1 or Q=1 and without
assuming that the degrees were equal.

The proof needs no splitting field, separability, characteristic zero
or extension of a valuation. It is a stronger algebraic formulation of
the previous handoff's root-wise argument, not a claim that the generic
theorem is already in Lean.

Two tempting weaker hypotheses fail. Over Z_3, X and 2X have the same
nonzero resultant valuations against every test, so monicity matters.
The distinct monic polynomials X²+1 and X²+X+2 are both root-free modulo
3, so every integral linear test gives valuation zero for each. But the
quadratic tests ψ_n=X²+1+3^n give valuations 2n and 0. Linear tests
alone do not recover the polynomial.

## V5. Specialize and reconnect the noncircular p-realization proof

For O=Z_p, D=Z and π=p, PadicInt.appr verifies the hypothesis at every
precision. Thus padic-resultant-recognition identifies monic p-adic
polynomials from common-nonzero **integer** test resultants.

Return to D1. V2 first places the realization characteristic polynomial
Q in Z_p[X], using only semilinear commutation. The intrinsic P_u is
supplied separately by A6. For the monic tests constructed in V4,
both resultants are eventually nonzero. The A6 degree/isogeny criterion
makes ψ_n(u) an isogeny. Its geometric degree and Dieudonné length give
the required equality of valuations, so V4–V5 imply Q=P_u. This still
does not invoke p-Tate to prove its own characteristic-polynomial input.

Only this adapter boundary is resolved mathematically. The original
finite-group/p-divisible classification, A3 quotients, A6 degree and
Hom finiteness, unramified tensor arithmetic, central-simple descent,
local/global Brauer and Honda inputs remain open as specified in G8.
G0–G7 and the nineteen withheld LT claims retain their previous scope.


A structural audit also records **G9**: 37 legacy definition/construction
entries carry API/tests only in prose, and one has string tests. The six
structured entries pass the ≥3 typed-test/API check, including all three new
constructions. The 38 legacy entries need normalization before completion;
the paper checker does not enforce that requirement.

## V6. Exact diagnostics and verification boundary

The following **standard-library-only** program passes 28,732 exact
cases: 8,214 multiplicity slopes, 3,126 coefficient/resultant congruences,
211 rejection examples, and 17,181 finite-field Witt-coordinate cases.
Rational coefficients with denominators prime to p exercise integral
factors that are not integer polynomials. The Witt tests use the actual
coordinate formula; they do not confuse coordinatewise operations with
Witt addition. The tests are diagnostics, not proofs of the generic results.

The inherited SymPy code and its earlier execution claims are preserved
below, but that program was not rerun in this claim. No Lean file was
written or compiled. Final schema, intake, preservation and regression
checks are recorded in the current verification object and handoff.

```python
from fractions import Fraction as Q
from itertools import product

def trim(f):
    f = list(map(Q, f))
    while len(f) > 1 and not f[-1]:
        f.pop()
    return f

def mul(f, g):
    z = [Q(0)] * (len(f) + len(g) - 1)
    for i, a in enumerate(f):
        for j, b in enumerate(g):
            z[i+j] += a*b
    return trim(z)

def power(f, e):
    z = [Q(1)]
    for _ in range(e):
        z = mul(z, f)
    return z

def det(a):
    a = [list(map(Q, r)) for r in a]
    n, out = len(a), Q(1)
    for j in range(n):
        k = next((k for k in range(j, n) if a[k][j]), None)
        if k is None:
            return Q(0)
        if k != j:
            a[j], a[k] = a[k], a[j]
            out = -out
        pivot = a[j][j]
        out *= pivot
        for k in range(j+1, n):
            c = a[k][j]/pivot
            for l in range(j+1, n):
                a[k][l] -= c*a[j][l]
    return out

def resultant(f, g):
    f, g = trim(f), trim(g)
    m, n = len(f)-1, len(g)-1
    rows = []
    for j in range(n):
        rows.append([Q(0)]*j + f[::-1] + [Q(0)]*(n-1-j))
    for j in range(m):
        rows.append([Q(0)]*j + g[::-1] + [Q(0)]*(m-1-j))
    return det(rows)

def val(x, p):
    x = Q(x)
    assert x
    a, b, e = abs(x.numerator), x.denominator, 0
    while a % p == 0:
        a //= p
        e += 1
    while b % p == 0:
        b //= p
        e -= 1
    return e

def lift(c, p, n):
    c = Q(c)
    assert c.denominator % p
    modulus = p**n
    return c.numerator*pow(c.denominator, -1, modulus) % modulus

counts = dict(slopes=0, congruences=0, rejection=0, witt_coordinates=0)
for p in (2, 3, 5):
    denominator = 3 if p == 2 else 2
    cs = [Q(-1), Q(0), Q(1), Q(1, denominator)]
    factors = [[c, Q(1)] for c in cs]
    factors += [[a, b, Q(1)] for a, b in product(cs, repeat=2)]
    for R, S in product(factors, repeat=2):
        cross = resultant(S, R)
        if not cross:
            continue
        c = val(cross, p)
        for n in range(1, 4):
            psi = [Q(lift(x, p, 2*n)) for x in R[:-1]] + [Q(1)]
            psi[0] += p**n
            rself, rother = resultant(R, psi), resultant(S, psi)
            assert val(rself, p) == n*(len(R)-1)
            delta = rother-cross
            assert not delta or val(delta, p) >= n
            counts["congruences"] += 1
            if n > c:
                assert rother and val(rother, p) == c
                for e in (0, 1, 2):
                    P = mul(power(R, e), S)
                    assert val(resultant(P, psi), p) == n*e*(len(R)-1)+c
                    counts["slopes"] += 1
    # Degree-zero first factor, and preservation of an exactly monic lift.
    for n in range(1, 5):
        assert resultant([1], [p**n, 1]) == 1
        assert lift(-1, p, n) == p**n-1
        counts["congruences"] += 1

# Linear tests alone do not distinguish these two polynomials over Z_3.
P, Qpoly = [1, 0, 1], [2, 1, 1]
for t in range(-81, 82):
    assert val(resultant(P, [-t, 1]), 3) == 0
    assert val(resultant(Qpoly, [-t, 1]), 3) == 0
    counts["rejection"] += 1
for n in range(1, 6):
    psi = [1+3**n, 0, 1]
    assert val(resultant(P, psi), 3) == 2*n
    assert val(resultant(Qpoly, psi), 3) == 0
    counts["rejection"] += 1
# Unit scaling is invisible to resultant valuations, so monicity is essential.
for t in range(1, 40):
    a, b = resultant([0, 1], [t, 1]), resultant([0, 2], [t, 1])
    assert val(a, 3) == val(b, 3)
    counts["rejection"] += 1
# Precision n alone allows psi=R when approximating R+p^n.
for n in range(1, 5):
    assert val(-3**n, 3) == n
    assert resultant([1, 0, 1], [1, 0, 1]) == 0
    counts["rejection"] += 1

# F_{p^2} = F_p[t]/(t^2+b*t+c). Frobenius on Witt coordinates
# is coordinatewise p-th power; coordinate addition is NOT Witt addition.
for p, b, c in ((2, 1, 1), (3, 0, 1), (5, 0, 2)):
    def fm(x, y):
        a0, a1 = x
        d0, d1 = y
        return ((a0*d0-c*a1*d1) % p,
                (a0*d1+a1*d0-b*a1*d1) % p)
    def fp(x, n):
        z = (1, 0)
        for _ in range(n):
            z = fm(z, x)
        return z
    field = list(product(range(p), repeat=2))
    fixed = [x for x in field if fp(x, p) == x]
    assert fixed == [(a, 0) for a in range(p)]
    assert all(fp(fp(x, p), p) == x for x in field)
    for length in (0, 1, 2, 3):
        fixed_count = 0
        for w in product(field, repeat=length):
            fw = tuple(fp(x, p) for x in w)
            assert (fw == w) == all(x[1] == 0 for x in w)
            fixed_count += fw == w
            counts["witt_coordinates"] += 1
        assert fixed_count == p**length
    a = (0, 1)
    assert fp(a, p) != a
    # (0,a) and zero have identical ghost coordinates in char p,
    # but the former is not Frobenius-fixed.
    assert (fp((0, 0), p), fp(a, p)) != ((0, 0), a)
print(counts)
print("Total exact diagnostic cases:", sum(counts.values()))
print("Finite diagnostics only: no general theorem or Lean compilation follows.")
```

---

# Preserved characteristic-p checkpoint and earlier reports

# Characteristic-p comparison and Frobenius blocks

**Partial checkpoint — Codex, codex-7e92bd, 23 September 2026; Refs #1332.**

This incorporates the mathematical work in [PR #2204](https://github.com/CBirkbeck/tauceti-explorer/pull/2204),
the handoff by ChatGPT Pro, cgp-20260923-h7q4. Its P1–P4 supplied the
independent characteristic-polynomial argument, integral saturation, the
cyclic-block proof and the two opposite-algebra signs; P5 supplied the
Milne Newton-polygon finding. Those contributions are now represented in
the extraction and this report, after a fresh source check.

The inventory has **167 items: 22 library, 29 planned, 116 missing**.
There are still eleven routes. The nine new missing items all belong to the
existing finite-field Part II. Ninety-seven missing items are routed; the
same nineteen disputed LT claims are withheld. Two precise R07.2 imports
join its existing source route; the local cyclic invariant is a planned
ClassFieldTheory import. All 152 previous item IDs, kinds, statuses and
statements, their route memberships, and the seventeen earlier source
findings are preserved. Three inherited proof notes/dependency lists are
updated. Two unreviewed findings are appended, bringing the total to nineteen.

The original p-Tate and local-invariant proofs have been located and
decomposed. This does not close their geometric/classification inputs,
the whole paper's extraction, or its implementation. The earlier report
is preserved after this supplement; only its specifically identified
unread-p-source boundaries are superseded.

## D0. Sources, pins and ownership

All downloads and reads below were on 23 September 2026.

| Source | Fresh reading | SHA-256 |
| --- | --- | --- |
| [LT arXiv v1](https://arxiv.org/pdf/1511.02212v1) | All 38 pages of extracted text, including references; p.21 also image-checked | `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a` |
| [Waterhouse–Milne 1971](https://www.jmilne.org/math/articles/1971a.pdf), pp.53–64 (WM71) | All twelve published page images, including Part II Theorems 1–2 and their proofs | `e482e1c60ccd76a068057b18ac28cec02f2746f87048947d8c2a4c328f6c88a8` |
| [Milne 1968](https://www.jmilne.org/math/articles/1968a.pdf), pp.63–84 (M68) | Images of pp.63–67 and p.84 only | `8abdaf4fa604d5ed7faee3f9d4e9dc9382dc35d7b79382fe3540f495fe98fc35` |

M68's later extension-group proofs were not read. Prior Conrad, Yun,
Tate 1966, Waterhouse 1969 and Bourbaki readings retain their earlier
workers' attribution. WM71 p.64 explicitly says that Tate's projected
second endomorphism paper does not exist; WM71 Part II is the original
public proof to use. The DOI for LT again resolved to publisher security
HTML. Both authors still link arXiv v1; **G0 remains open**, and no
finding about that preprint is asserted of the final 2018 publication.

The working explorer snapshot is `54dbb5b`. The reviewed A3/A4/A6 and
ClassFieldTheory Layer 5 coverage rows were read. Consolidated R07.2 and
SemisimpleAlgebras rows are absent at this snapshot; this is not treated
as evidence that their whole subject is missing. The actual R07.1/R07.2,
A3/A4/A6 and ClassFieldTheory Layer 5 descriptions, and the upstream
JacobianChallenge and SemisimpleAlgebras documents, were read. The
AUDIT-08 accepted review identifies the available Cartier duality and
the absent abelian-variety Tate/Dieudonné and general torsion interfaces.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the
`WittVector.Isocrystal`, Frobenius and equivariant Hom definitions were
reread. They supply the carrier, not the group-scheme realization.
The classification at the end of that file is one-dimensional over an
algebraically closed field, not the required finite-group classification.

The following Tau Ceti statements were read at
`f790474821cf4256814db967cb154e7af3d0c369`. Each containing file was
matched byte-for-byte against its raw GitHub URL at that commit.

| Imported statement | Exact scope and use |
| --- | --- |
| `TauCeti.IsSimpleRing.finrank_end_mul_finrank_eq_sq`, `RingTheory/Semisimple/EndAlgebra.lean:144` | A finite-dimensional simple K-algebra R and a finite-dimensional compatible module M satisfy dim End_R(M) · dim R = (dim M)². Centrality and nonzero M are not required. This directly supplies D3's module dimension count. |
| `TauCeti.tensorCentralizerAlgEquiv` and its pure-tensor evaluation, `Algebra/CentralSimple/Centralizer.lean` | Central simple B inside finite-dimensional simple T gives B⊗C_T(B)≅T by multiplication. Used inside T=End_K(V) in D5. |
| `TauCeti.BrauerGroup.mk_op`, `Algebra/BrauerGroup/Group.lean:207` | The opposite class is the inverse class. In the same file, `mk_tensorProduct`, `mk_matrix`, and `mk_end` give the tensor, matrix and split-endomorphism comparisons used in D5. |

The generic endomorphism-dimension theorem, centralizer theorem and
Brauer-group laws are therefore imported. This continuation does not
plan them again. The arithmetic Frobenius-block presentation and its
application to abelian varieties are the new Part II work. The generic
descent, unramified-field and valuation adapters still needing exact
declaration audits are listed as requests, not assigned invented library
names. The A3 finite-flat quotient, A6 degree/finite-rank Hom and R07.2
finite/p-divisible classification owners remain unchanged.

## D1. Degree and characteristic polynomial before p-Tate

Let k=F_(p^a), W=W(k), L=Frac(W), and σ be Witt Frobenius. All uses of
C(A) below are **contravariant**. The two new planned R07.2 items expose
the exact inputs from WM71 p.56 and M68 p.65: exact finite-level comparison
with C(A)/p^n=D(A[p^n]), and rank(H)=p^length_W D(H). Rank means finite
group-scheme rank; it is neither the number of geometric points nor
|k| raised to this length. The p-divisible comparison gives rank_W C(A)=2g.
These classification proofs are imported, not consequences of p-Tate.

For an isogeny f:A→B, exactness identifies coker C(f) with the module of
the p-primary kernel. Its length equals v_p(deg f). For an endomorphism
isogeny, Smith normal form over W gives the same value as v_p(det C(f)).
This is `p-realization-degree-valuation`. Between different varieties
one uses length or the determinant ideal; no canonical scalar determinant
between two different vector spaces is asserted.

For arbitrary u∈End_k(A), write T=C(u) and F=Bσ. Since T commutes with F,
T=Bσ(T)B⁻¹. Thus Q=charpoly_L(T) has coefficients fixed by σ and integral,
hence in Z_p. Let P_u be the intrinsic polynomial supplied by A6 and
realized on V_ℓ(A), ℓ≠p. For an integral polynomial ψ with ψ(u) an
isogeny, the determinant/degree comparison gives

    v_p Res(Q,ψ) = v_p deg ψ(u) = v_p Res(P_u,ψ).

The last equality uses the A6 degree identity on the prime-to-p
realization and determinant/resultant algebra. It does not use p-Tate.

Here is the separation argument supplied in the preceding handoff.
For each monic irreducible factor R of PQ in Q_p[X], integrality of its
roots gives R∈Z_p[X]. Choose a monic integral R_n congruent to R
coefficientwise modulo p^(2n), and put ψ_n=R_n+p^n. At each root α of
R the value has valuation n. At every other root β of PQ it eventually
has the constant valuation v_p R(β). Therefore, for large n,

    v_p Res(P,ψ_n) = n N_R(P) + c_P,

and similarly for Q. N_R counts roots with multiplicity: a factor of
degree d repeated e times contributes de, not just e. Equal valuations
force equal slopes, hence equal irreducible multiplicities and P=Q.
The test resultants are nonzero for sufficiently large n; the degree
formula consequently ensures that ψ_n(u) is an isogeny, so these are
admissible tests in the application.

This proves `p-realization-characteristic-polynomial` relative to the
named geometric inputs. M68 pp.65–66 provides the comparison; it cites
Lang VII §1 Lemma 1 for uniqueness. That book lemma was not read here;
the expanded separation argument is recorded instead. Its precise
generic valuation, integrality-of-factors and coefficient-density
adapters still need a pinned declaration audit under the existing local
fields owner. They are not silently declared formalized.

For Frobenius π_A specifically, centrality in the semisimple Q-algebra
End⁰_k(A) gives a squarefree minimal polynomial. Transporting it to the
realization gives semisimplicity of C(π_A)=F^a. This is a separate
`p-frobenius-semisimplicity` item. F itself is semilinear when a>1.
Specializing a=1 and taking the ordinary linear dual proves the existing
`prime-field-p-frobenius` item. Arbitrary endomorphisms of E² can be
nilpotent; they are not covered by the semisimplicity conclusion.

## D2. Integral injection and saturation before dimension comparison

Set M=Hom_k(A,B) and H=Hom_(W,F,V)(C(B),C(A)). A6 gives finite free M
over Z. H is finite torsion-free over Z_p because W has finite Z_p-rank.
It is p-saturated in the W-linear maps: cancel p in both equivariance
equations. Hence reduction of H embeds in the linear maps modulo p.

A homomorphism f∈M vanishes on C modulo p exactly when it kills the
**group scheme** A[p]. By the quotient A/A[p]≅A given by [p], this is
equivalent to f=pg for a unique g. Thus M/pM→H/pH is injective. For
j:M⊗Z_p→H, iterated reduction proves injectivity. If j(x)=ph, the same
mod-p injection gives x=px′, and cancellation shows h=j(x′). This proves
`p-realization-saturated-hom` without assuming a rational rank identity.

The geometric input is A3's quotient universal property and finite-level
R07.2 faithfulness. Replacing A[p] by its geometric points loses its
connected part and breaks the argument. End composition reverses;
the Hom map goes from C(B) to C(A).

## D3. Finite Frobenius blocks and the existing dimension theorem

Factor P_A over Q_p as ∏m_i^e_i, with distinct monic irreducible m_i of
degrees d_i. Since F^a is semisimple, V=C(A)[1/p] splits into V_i killed
by m_i(F^a). Write K_i=Q_p[X]/m_i and θ_i=X mod m_i, which is nonzero.
The characteristic-polynomial comparison gives

    dim_L V_i = d_i e_i,       dim_Ki V_i = a e_i.

The new construction `p-frobenius-block-algebra` avoids a dependency on
an unexamined general Ore-polynomial classification. It is the finite
direct sum of a copies of L⊗K_i, with elements ∑b_j U^j and multiplication

    (b U^i)(c U^j) = b σ^i(c) θ_i^floor((i+j)/a) U^((i+j) mod a).

Here σ acts on L and fixes K_i. Associativity follows from σ^a=1 and
the elementary carry identity for the exponents; the dimension is a².
The API specifies coefficient inclusion, generator/inverse, component
extensionality, multiplication, the universal action and scalar extension.
U acts as F and θ_i as F^a on V_i. The construction explicitly allows
L⊗K_i to be a product, as happens when K_i contains L.

Over an algebraic closure Ω of K_i, the coefficient algebra is Ω^a.
Choose its cyclically ordered idempotents as diagonal matrices and U
as a cyclic shift whose nonzero wrap weight is θ_i. The a² elements
e_j U^r are nonzero multiples of every matrix unit, so B_i⊗Ω≅M_a(Ω).
Descent of ideals and centers along a field extension proves central
simplicity. `p-frobenius-block-split` records this step and the still
required exact adapter audit under the existing semisimple-algebra owner.

For the commutant dimension, the fresh pinned library check improves the
handoff's proposed Morita/base-change proof: apply
`TauCeti.IsSimpleRing.finrank_end_mul_finrank_eq_sq` directly to B_i and V_i.
It gives

    dim_Ki End_Bi(V_i) · a² = (a e_i)²,

so the dimension is e_i². B_i-linearity is exactly L-linearity plus
commutation with F. Distinct polynomial blocks have no intertwiners,
by Bézout applied to their coprime annihilators. Thus

    dim_Qp End_(L,F)(V) = Σ_i d_i e_i².

This is `p-frobenius-centralizer-dimension`. It includes V=0 by the empty
sum. Commuting only with F^a does not suffice: over the finite F_9 model
with F=σ on two coordinates there are 9⁴ linear maps but only 3⁴ maps
commuting with F.

## D4. Rational comparison and the integral upgrade

Prime-to-p Tate gives the same dimension for End⁰_k(A). One computes
after a splitting field: each root of P_A contributes its multiplicity
squared, and factoring a separable polynomial over any characteristic-zero
completion preserves that sum. This is a generic semisimple-polynomial
adapter, not a p-Tate hypothesis hidden in the argument.

D2 gives the rational injection; D3 and the prime-to-p comparison give
equal dimensions. This yields the End anti-isomorphism. Apply it to A×B
and take the off-diagonal projector corners to obtain
`rational-p-tate-hom`, with its direction C(B)→C(A). Rational equivariant
maps admit a common p-power denominator, identifying the rationalized
integral target with the isocrystal Hom space. Finally the integral map
has saturated image, equal rank and finite cokernel; a finite torsion
Z_p-module with no p-torsion is zero. This proves the existing integral
`p-tate-hom` relative to its displayed suppliers.

The dependency order is therefore

    R07.2 + A3 → saturated injection
    R07.2 + A3 + A6 → degree/polynomial comparison → Frobenius semisimplicity
    block construction + pinned dimension theorem → p-commutant dimension
    these + prime-to-p Tate → rational p-Tate → integral p-Tate.

In particular the polynomial comparison never depends on p-Tate. The
all-q Hom comparison is now explained; the earlier prime-field linear-dual
lattice convention and numerical counting bounds are not generalized by it.

## D5. Local invariant and two sign changes

For simple A and a place v|p of Q(π), let K=Q(π)_v, with residue degree
f_v and ramification index e_v. Put g=gcd(f_v,a), n=a/g. The coefficient
tensor product L⊗K consists of g copies of LK, an unramified degree-n
extension of K. WM71 p.61 explicitly identifies the Frobenius block with
M_g(D), where D has generator U with Uc=σ^g(c)U and U^n=π.

Arithmetic Frobenius of LK/K restricts to σ^(f_v) on L. Hence, if
τ=σ^g, arithmetic Frobenius is τ^(f_v/g). The imported local cyclic
invariant gives

    inv(D) = (f_v/g) ord_v(π)/(a/g)
           = f_v ord_v(π)/a
           = [K:Q_p] ord_v(π)/ord_v(p^a)  in Q/Z.

The module commutant has the opposite Brauer class: the tensor-centralizer
equivalence inside End_K(V_v), together with its trivial Brauer class,
gives [B_v][End_Bv(V_v)]=1. Rational p-Tate identifies E_v^op with that
commutant. Its second opposite cancels the first. This is the new
`p-endomorphism-local-invariant` item. The existing prime-field
commutativity item consumes it. At a=1 the finite p-invariants vanish,
while the real-place exception remains essential.

The local unramified cyclic-invariant formula and algebraic/cohomological
Brauer comparison are imported from ClassFieldTheory Layer 5, which has
an absent invariant in the reviewed audit. WM71 invokes the cocycle
calculation without supplying its complete proof. That input and global
Brauer classification remain G8. Neither the generic Brauer group nor
the tensor-centralizer theorem is missing at the pinned baseline.

## D6. Two source findings, with their distinct provenance

`E-MILNE68-NEWTON-ABSCISSA` is the handoff's proposed misprint in M68 p.67.
The page prints `(c_i, ord_p(c_i))` for a polynomial's Newton polygon;
the abscissa must be i. For 1+F the printed points collapse to one point,
whereas the correct endpoints have abscissae zero and one. The following
formula on the same page uses the exponent i, confirming the intended
meaning. This does not affect the degree comparison on pp.65–66. The
[author's erratum page](https://www.jmilne.org/math/articles/1968a.html)
lists different corrections on pp.78–81, not this notation.

`E18` is a separate finding from this continuation. LT v1 p.21 concludes
its alternative argument in Proposition 4.14(1) by calling the Frobenius
centralizer non-division. The curve E/F_5 given by y²=x³+1 is a concrete
counterexample to that sentence. It is nonsingular and has affine points
(0,1), (0,4), (2,2), (2,3), (4,0), plus infinity, so its trace is zero and
P_E=X²+5. Its Frobenius field Q(√−5) has no real embedding. Since X²+5
is Eisenstein over Q_5, the commutant on its two-dimensional p-realization
is Q_5[X]/(X²+5), a field, hence a division algebra. In a companion basis,

    F = [[0,−5],[1,0]],   C(F) = {xI+yF},   det(xI+yF)=x²+5y².

For nonzero x,y the two summands have valuations of opposite parity,
so the determinant cannot vanish. A field is split over its own center;
this counterexample does **not** disprove Proposition 4.14. The preceding
local-invariant argument proves the desired splitting and should be used.
Neither being a centralizer nor merely being non-division as a Q_p-algebra
would be enough to prove splitting over its center.

Both findings retain `known: new` only in the protocol's limited-search
sense. The sources/images, author pages, arXiv history and searches are
listed in their JSON entries. No independent-review verdict is attached,
and E18 remains v1-only until the final text can be compared.

## D7. Verification and remaining work

The finite diagnostic code below includes the preceding handoff's exact
cyclic-module, semilinear, multiplicity and normalization checks, rerun
here. The new checks add irreducible quadratic valuation tests with a
nontrivial p^(2n) coefficient approximation, explicit twisted-product
associativity, and the E18 point-count/commutant calculation. They test
normalizations and failure cases; they do not establish the general
geometric or local-class-field theorems.

The repository paper checker, preservation/route/dependency/API checks,
and `git diff --check` are recorded in the handoff after execution.
No Lean file was written or compiled. The nineteen previously withheld
claims remain withheld. G0–G7 retain their stated scopes; G8 now replaces
the missing original-p-source lookup by the exact remaining classification,
geometry, local-invariant and generic-adapter proof/audit obligations.

Resume with those geometric suppliers, PEL fixed-degree/twist finiteness,
Honda CM existence, class-set/narrow-norm issues, the final journal text,
and the mass/residue/limit-law inputs. None is discharged by this
characteristic-p comparison alone.

### Exact diagnostics (Python 3 and SymPy 1.14.0)

```python
"""Exact finite diagnostics for the LT18 p-source continuation, not Lean proofs."""
from fractions import Fraction
from itertools import product, combinations_with_replacement
from math import gcd
import sympy as s

# A split cyclic algebra is generated by diagonal idempotents and a weighted cycle.
# Check both the a^2-dimensional span and its r^2-dimensional module commutant.
cyclic_cases = 0
for a in range(1, 5):
    S = s.zeros(a)
    for j in range(a - 1):
        S[j + 1, j] = 1
    S[0, a - 1] = 2
    assert S ** a == 2 * s.eye(a)
    E = []
    for i in range(a):
        e = s.zeros(a); e[i, i] = 1; E.append(e)
    basis = [e * S ** j for e in E for j in range(a)]
    assert s.Matrix.hstack(*(b.reshape(a*a, 1) for b in basis)).rank() == a*a
    for r in (1, 2):
        n = a*r
        gens = [s.kronecker_product(g, s.eye(r)) for g in E + [S]]
        # Column vectorization: vec(XG-GX)=(G^T tensor I-I tensor G) vec(X).
        eq = s.Matrix.vstack(*(s.kronecker_product(g.T, s.eye(n))
                               - s.kronecker_product(s.eye(n), g) for g in gens))
        assert n*n - eq.rank() == r*r
        cyclic_cases += 1

# F_9 = F_3[t]/(t^2+1), encoded by x+3*y. Frobenius fixes exactly F_3.
def add(x, y):
    return ((x % 3 + y % 3) % 3) + 3*((x // 3 + y // 3) % 3)
def neg(x):
    return (-x % 3) + 3*((-(x // 3)) % 3)
def mul(x, y):
    a,b = x % 3, x // 3; c,d = y % 3, y // 3
    return ((a*c-b*d) % 3) + 3*((a*d+b*c) % 3)
def frob(x):
    return mul(mul(x, x), x)
def mm(A, B):
    return tuple(add(mul(A[2*i], B[j]), mul(A[2*i+1], B[2+j]))
                 for i in range(2) for j in range(2))
def det(A):
    return add(mul(A[0], A[3]), neg(mul(A[1], A[2])))
assert all(frob(frob(x)) == x for x in range(9))
assert {x for x in range(9) if frob(x) == x} == {0, 1, 2}
linear_maps = semilinear_commutants = invertible_cases = 0
for B in product(range(9), repeat=4):
    linear_maps += 1
    semilinear_commutants += all(frob(x) == x for x in B)
    if det(B) == 0:
        continue
    # For F=B sigma, F^2=B sigma(B); its characteristic polynomial is sigma-fixed.
    P = mm(B, tuple(frob(x) for x in B))
    tr = add(P[0], P[3]); d = det(P)
    assert frob(tr) == tr and frob(d) == d
    invertible_cases += 1
assert linear_maps == 9**4 and semilinear_commutants == 3**4
assert invertible_cases == (9**2-1)*(9**2-9)

# Valuation tests recover multiplicity in a split integral-root model.
def vp(x, p):
    assert x != 0
    x = abs(x); n = 0
    while x % p == 0:
        x //= p; n += 1
    return n
multiplicity_cases = 0
for p in (2, 3, 5):
    for rank in range(5):
        for roots in combinations_with_replacement(range(4), rank):
            for alpha in range(4):
                # psi_n(T)=T-alpha+p^n, with n beyond every nonzero separation valuation.
                values = [sum(vp(beta-alpha+p**n, p) for beta in roots) for n in (5, 6)]
                assert values[1] - values[0] == roots.count(alpha)
                multiplicity_cases += 1

# Arithmetic Frobenius versus the chosen cyclic generator, with ramification explicit.
invariant_cases = 0
for a in range(1, 13):
    for f in range(1, 7):
        g = gcd(a, f)
        assert gcd(a//g, f//g) == 1
        for e in range(1, 7):
            for t in range(a*e + 1):
                I = Fraction((f//g)*t, a//g)
                assert I == Fraction(f*t, a) == Fraction(e*f*t, a*e)
                invariant_cases += 1
assert Fraction(1, 2) % 1 == Fraction(1, 2)
assert (-(-Fraction(1, 2))) % 1 == Fraction(1, 2)
# A value away from order two detects a missing sign reversal.
assert (-(-Fraction(1, 3))) % 1 == Fraction(1, 3)
assert (-Fraction(1, 3)) % 1 == Fraction(2, 3)
# Group-scheme rank uses p^length, not |F_q|^length.
p, a, length = 3, 2, 3
assert p**length == 27 and (p**a)**length == 729

print(f'PASS: {cyclic_cases} split cyclic-module commutants; '
      f'{invertible_cases} F_9 semilinear Frobenius matrices; '
      f'{multiplicity_cases} valuation-multiplicity tests; '
      f'{invariant_cases} invariant-normalization identities.')
print(f'Naive versus semilinear commutant sizes: {linear_maps} versus {semilinear_commutants}.')
print('Finite diagnostics only; no general theorem or Lean compilation is inferred.')

# Supplement to the handoff's diagnostics; same SymPy and F_9 helpers.
x = s.symbols('x')
quadratic_cases = 0
for prime, constant in ((3, 1), (5, 2)):
    R = x*x + constant
    assert all((z*z + constant) % prime for z in range(prime))
    for exponent in range(5):
        for extra in range(4):
            P = R**exponent * (x - 2)**extra
            valuations = []
            for n in (2, 3):
                # A genuine coefficient perturbation of the irreducible factor.
                psi = R + prime**n + prime**(2*n)*x
                value = int(s.resultant(P, psi, x))
                valuations.append(vp(value, prime))
            assert valuations[1] - valuations[0] == 2*exponent
            quadratic_cases += 1

# The a=2 cyclic product over F_9/F_3. The F_3 basis includes both L-coordinates.
twisted_cases = 0
units = ((1, 0), (3, 0), (0, 1), (0, 3))
for theta in (1, 2):
    def crossed(X, Y):
        b, c = X; d, e = Y
        return (add(mul(b, d), mul(theta, mul(c, frob(e)))),
                add(mul(b, e), mul(c, frob(d))))
    assert crossed((0, 1), (0, 1)) == (theta, 0)
    for A, B, C in product(units, repeat=3):
        assert crossed(crossed(A, B), C) == crossed(A, crossed(B, C))
        twisted_cases += 1
    for z in range(9):
        assert crossed((0, 1), (z, 0)) == crossed((frob(z), 0), (0, 1))

# E18: point count and the exact companion-matrix commutant.
points = [(a, b) for a in range(5) for b in range(5) if (b*b-a*a*a-1) % 5 == 0]
assert len(points) + 1 == 6
assert (-16*27) % 5 != 0
F = s.Matrix([[0, -5], [1, 0]])
a, b, c, d = s.symbols('a b c d')
Z = s.Matrix([[a, b], [c, d]])
assert s.linsolve(list(Z*F-F*Z), (a, b, c, d)) == s.FiniteSet((d, -5*c, c, d))
z, w = s.symbols('z w')
assert F.charpoly(x).as_expr() == x*x+5
assert (z*s.eye(2)+w*F).det() == z*z+5*w*w
# Eisenstein gives the Q_5 field; parity of valuations supplies the nonzero determinant argument.
for i in range(-8, 9):
    for j in range(-8, 9):
        assert 2*i != 1+2*j
# E^2 may have a nonsemisimple endomorphism even though Frobenius is semisimple.
N = s.Matrix([[0, 1], [0, 0]])
assert N != s.zeros(2) and N*N == s.zeros(2)
# M68's printed abscissae lose the constant coefficient for 1+F.
assert {(1, 0), (1, 0)} != {(0, 0), (1, 0)}
print(f'PASS: {quadratic_cases} irreducible-factor valuation cases; '
      f'{twisted_cases} twisted basis associativity cases; E18 point count and commutant; '
      'valuation parity, nonsemisimple endomorphism and Newton-abscissa controls.')

```

---

# Preserved report through PR #2199

# Classification-source continuation: prime-field realizations and adelic levels

**Status: partial; Codex, session codex-a71f92; 23 September 2026.**
This continues PR #2155, following #1848 and #1652. It adds sixteen items:
three pinned library suppliers and thirteen missing mathematical endpoints.
The inventory is now **152 items: 19 library, 26 planned, 107 missing**.
There are eleven routes: 88 missing items and 25 planned items are routed;
the same nineteen disputed source claims remain withheld. There are thirty-nine
definition/construction API-and-test blocks. All seventeen inherited findings
remain version-qualified, unreviewed proposals; no source issue is added.

The new result is a prime-field proof plan for the arithmetic inputs to S6,
with its original-source leaves exposed. It does **not** certify a gap-free
formal proof, a class-number estimate, an all-q classification, or agreement
with the final journal article. The complete preceding report is preserved
below. Historical statements about unread references are superseded only by
the exact reading record here.

## C0. Sources, library evidence and ownership

The LT source remains [arXiv v1](https://arxiv.org/pdf/1511.02212v1).
Its complete reading belongs to the preceding claim. This claim acquired:

| Source | Reading extent | SHA-256 |
| --- | --- | --- |
| [Tate 1966](https://pazuki.perso.math.cnrs.fr/index_fichiers/Tate66.pdf), Invent. Math. 2, 134–144 | All 489 extracted lines, §§1–3 and references; p.137 additionally rendered | 47f284526522fb48840e1a1383b9bfc0bfc3f6aded39db6119a34a6e02214b87 |
| [Waterhouse 1969](https://www.numdam.org/article/ASENS_1969_4_2_4_521_0.pdf), Ann. Sci. ENS 2, 521–560 | Introduction, Chapters 1–3, Porism 4.3 with its preceding proof, Chapter 6 and bibliography; p.551 additionally rendered | 7be2bf9dde45454afa3dd9a0ea1ba05acbe952b6b573a0c37c2b1b8f0cccbb47 |
| [Tate, Bourbaki exposé 352](https://numdam.org/item/SB_1968-1969__11__95_0/), November 1968, printed 1971, pp.95–110 | All extracted text surveyed; §§1–2 checked with images of pp.96,98,99. Many later formulas are absent from OCR; §§3–6 are not a complete proof audit | a23d9cd18c2ccc155285428ca02f284bc546711c9eb9fe43555dd020fdd328f3 |

Access date: 23 September 2026. Waterhouse is **not** recorded as read in full.
In particular the dyadic matrices of Theorem 6.2 have not been image-audited,
even though Chapter 6 text was read; no new dyadic endpoint is extracted.
Tate 1966 proves the prime-to-characteristic Hom theorem; its p-local
invariant discussion explicitly omits the proof. Bourbaki §2 is an outline
with further inputs, not a complete original p-proof.

At Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**, statements read:

- Module.Finite.toModuleEnd_moduleEnd_surjective and jacobson_density,
  Mathlib/RingTheory/SimpleModule/Basic.lean, lines 552–584. The hypothesis
  is **semisimple** module, not only simple; finiteness over End supplies
  surjectivity onto the bicommutant.
- PadicInt.compactSpace, Mathlib/NumberTheory/Padics/ProperSpace.lean,
  lines 38–61: compactness of p-adic integers for a prime p.
- IsCompact.tendsto_subseq, Mathlib/Topology/Sequences.lean, lines 284–302:
  compact-set subsequence extraction in a first-countable space.

These are existing results, not new roadmap tasks. Basis/topology transport
to Tate-module matrices and the semisimple-algebra action comparison remain
application obligations. At Tau Ceti
**f790474821cf4256814db967cb154e7af3d0c369**, the complete field
AbelianVariety/Isogeny.lean was read. It provides the finite-surjective
isogeny predicate and closure properties, not the required finite-flat
quotients, general [n] torsion theorem or realization functors.

ASAM A2/A3/A4/A6 and PELModuli M0–M6 descriptions and reviewed coverage were
read, together with AA.3 and the relevant AA.1 interface. The full ASAM
campaign document and upstream JacobianChallenge and SemisimpleAlgebras
documents were read. The latter determine granularity and existing-carrier
boundaries; neither is re-planned.

There is no consolidated R07.2 entry in data/library-coverage.json at the
working snapshot. AUDIT-37 is a **lead, not an accepted review**.
Its absence claims were checked against the reviewed A4 import row and
fresh pinned-tree searches. Its one-dimensional isocrystal classification
over an algebraically closed residue field is not Dieudonné classification
of group schemes.

Ownership remains:

| New need | Owner / consumer |
| --- | --- |
| Positive division of a polarization | ASAM A2, with A3 torsion and pairings |
| Integral quasi-homomorphism detection | ASAM A6, on its field Hom carrier |
| Prime-field linear-dual realization | R07.2, on imported modules and existing linear dual |
| Good-prime integral-order/lattice adapter | GN.2 |
| Fixed-degree finite-field finiteness | PELModuli M6, with finite-type moduli and rational-family inputs |
| Tate arithmetic applications, marked classification and counting assembly | Existing proposed ASAM finite-field Part II |
| Restricted products and finite coarse class sets | AA.1 and AA.3 imports |

The PEL route is the only new route. It requests the fixed-degree adapter,
not another moduli stack. It includes degrees divisible by p; M2's
good-prime smoothness alone is insufficient. Seven inherited item notes
are updated. Every inherited ID, kind, status, statement and route
assignment is retained. All source-issue objects are unchanged.

## C1. Tate's proof without a circular counting input

Let A/k have dimension g and a k-polarization θ of degree d², and let
ℓ≠char(k). Tate's hypothesis is finiteness of k-isomorphism classes B
admitting both a degree-d² k-polarization and an ℓ-power isogeny B→A.
Over finite fields, fixed-dimension, fixed-polarization-degree finiteness
suffices. **No unpolarized counting theorem is assumed.**

The PEL M6 supplier must turn finite-type polarized geometry into finiteness
of actual k-isomorphism classes. Rational coarse points alone do not account
for descent and twists. Tate also describes a bounded projective-embedding
argument; its original Mumford/Weil inputs remain unread source leaves.

For a Galois-stable maximal θ-isotropic W⊂V=T_ℓ(A)⊗Q_ℓ, put

\[
T=T_\ell(A),\qquad X_n=(T\cap W)+\ell^nT.
\]

The intersection T∩W is saturated of rank g, so [T:X_n]=ℓ^{ng},
without θ being principal. To produce f_n:B_n→A with image lattice X_n,
take the finite étale subgroup represented by ℓ^{-n}X_n/T, quotient A
by it, and factor [ℓ^n] through that quotient. This uses A3 torsion
and quotients, **not** Tate full faithfulness.

The pullback f_n*θ has degree ℓ^{2ng}d². Its alternating Tate form has
values in ℓ^n Z_ℓ(1), by expanding on T∩W+ℓ^nT and using isotropy.
The separate A2 polarization-divisibility item gives
θ_n=ℓ^{-n}f_n*θ, of degree d². The perfect torsion pairing and
quotient-by-[ℓ^n] detect divisibility as a homomorphism; positive scaling
makes the quotient a polarization. Matrix divisibility does not replace
the positivity input.

Finiteness supplies infinitely many B_i isomorphic to a fixed B_n.
Choose v_i:B_n→B_i and set u_i=f_i v_i f_n^{-1}. They preserve X_n
and have image X_i. Its endomorphism lattice is a finite matrix power
over Z_ℓ, hence compact. Extract u_i→u; the limit lies in
E_ℓ=End_k(A)⊗Q_ℓ because this finite-dimensional subspace is closed.

For y∈X_n, the limit u(y) lies in each closed X_j. Conversely, for
x∈∩X_i choose y_i∈X_n with u_i(y_i)=x. Compactness gives a convergent
subsequence y_i→y, and continuity gives u(y)=x. Therefore
u(X_n)=∩X_i=T∩W and u(V)=W. This compact-preimage argument is essential;
one cannot simply commute image and intersection.

Now let k=F_q and suppose Q_ℓ[π] is split. Write D for the commutant
of E_ℓ. Maximal π-stable isotropic subspaces are E_ℓ-images and hence
D-stable. For smaller W, the split module W⊥/W has even dimension at
least two; two distinct stable lines give larger isotropic extensions
whose intersection is W. Descending induction makes every π-eigenline
D-stable. An operator preserving every line of an eigenspace is scalar
there, so D=Q_ℓ[π]. The existing semisimple bicommutant theorem gives
E_ℓ=End_π(V).

The remaining argument is recorded in the inherited tate-hom item.
Centrality and semisimplicity make Q[π] finite étale; choose a prime
splitting it completely. Two semisimple polynomial modules with
factor multiplicities a_P,b_P have intertwiner dimension

\[
\sum_P a_Pb_P\deg P.
\]

This sum is unchanged when separable factors split further. Comparison
with the split-prime result gives rational full faithfulness at every
ℓ≠p; A×B yields Hom from End. The integral image is saturated because
a homomorphism killing A[ℓ] factors through [ℓ]. Equal rank and
saturation give integral full faithfulness.

Still to supply atomically: fixed-degree moduli finiteness, original
polarization positivity/divisibility, split-prime existence, the
semisimple polynomial dimension adapter, and realization/topology
interfaces. Density and compactness themselves are not missing.

## C2. What Waterhouse supplies

Chapter 1 uses different variances. Away from p, T_ℓ is covariant and
V_ℓ/T_ℓ represents ℓ-power torsion. For q:A→B an isogeny,

\[
q_\ell^{-1}(T_\ell B)/T_\ell A=(\ker q)_\ell.
\]

At p, C(A)=Waterhouse's T_pA is **contravariant**:
C(q):C(B)→C(A) is injective with finite cokernel, the Dieudonné module
of the p-primary kernel. Finite p-subgroups correspond to full
F,V-stable **sublattices** of C(A), not superlattices.

For a simple variety over F_p with nonreal Frobenius field E=Q(π),
the local invariant formula is

\[
\operatorname{inv}_v\operatorname{End}^0(A)
 = f_v\,\operatorname{ord}_v(\pi)/a \pmod{\mathbb Z},
 \qquad q=p^a.
\]

At a=1 all finite invariants vanish; there are no real ones.
Brauer classification then gives End⁰(A)=E, a CM field. The simple,
nonreal and prime-field hypotheses matter, and the invariant/Brauer
supplier is distinct from the lattice calculation.

Waterhouse Theorem 6.1(2) realizes every order R containing π and pπ^{-1}.
Choose rank-one R_ℓ-lattices away from p, and one stable under
F=π,V=pπ^{-1} at p. Only finitely many modifications are needed,
because an order is maximal almost everywhere. C4's quotient construction
realizes them. In C3's convention, take the linear dual of Waterhouse's
chosen contravariant p-lattice.

Theorem 6.1(3) uses a **special reference variety** with every local
realization free of rank one over R_ℓ, so all its ideals are kernel
ideals. A general R-lattice with multiplier order R need not be projective.
The whole class set must not be replaced by Pic(R): the locally free
classes form its Picard torsor but do not necessarily exhaust the set.
The original order-realization item is expanded in place.

Waterhouse Proposition 3.1 is conjugacy of endomorphism-algebra embeddings
fixing π. It is **not** the lattice-realization theorem.

## C3. Prime-field convention and two separate p-inputs

Over F_p, W(F_p)=Z_p and scalar Frobenius is the identity. Define

\[
D^{\mathrm{lin}}_0(A)=\operatorname{Hom}_{\mathbb Z_p}(C(A),\mathbb Z_p),
\quad F_D(\phi)=\phi\circ F_C,\quad V_D(\phi)=\phi\circ V_C.
\]

For f:A→B, D^lin₀(f) is precomposition with C(f):C(B)→C(A).
Transposition reverses the reversed composition, hence gives a covariant
realization of rank 2dim A with FV=VF=p and π_D=F_D.
After inverting p, V_D=pF_D^{-1}.

Use the existing linear dual, not a second Dieudonné category.
This is **linear dual**, not an unannounced interchange of F,V by Cartier
duality. Over F_(p^a), a>1, φ∘F is σ-semilinear rather than W-linear,
so this formula is not the general-q construction. That inherited
convention comparison remains G2.

The JSON specifies constructor, evaluation, identity/composition laws,
Frobenius compatibility and annihilator-lattice equivalence. Four tests
cover zero rank, F=diag(1,p),V=diag(p,1), the [p] scaling direction,
and failure of the naive formula over F_(p²).

Two supplier theorems are kept separate:

1. p-tate-hom: Hom(A,B)⊗Z_p identifies with the **contravariant**
   F,V-equivariant maps C(B)→C(A), as stated in Waterhouse §1.2.
2. prime-field-p-frobenius: the linear p-Frobenius is semisimple with
   the same intrinsic characteristic polynomial as the ℓ≠p realizations;
   Waterhouse Chapter 2 states semisimplicity and the component dimensions.

The latter is required for one discriminant product D_* at every prime.
Transposition preserves a polynomial but does **not** prove the
cross-realization comparison. Tate's Bourbaki §2 outlines dimension
comparison through p-divisible groups; its original realization/degree
and rational-faithfulness inputs are not fully decomposed here. The
integral upgrade needs finite-group-scheme faithfulness and saturation.
Do not use the polynomial comparison to prove p-Tate and simultaneously
derive it from p-Tate. Both source boundaries remain visible in G8.

## C4. Realizing tuples and forgetting the marking

Fix A₀/F_p with reference integral realizations T₀,ℓ (D^lin₀ at p).
Take full lattices M_ℓ equal to T₀,ℓ almost everywhere, π-stable away
from p and F,V-stable at p. Away from p the Frobenius determinant is
an ℓ-adic unit, so π-stability implies inverse and Galois invariance.

Choose N>0 with NT₀,ℓ⊆M_ℓ everywhere. Then

\[
L_\ell=N^{-1}M_\ell\supseteq T_{0,\ell}.
\]

The inverse scaling matters: multiplying M by N shrinks it.
Away from p, L_ℓ/T₀,ℓ is a finite Galois-stable torsion subgroup.
At p its annihilator

\[
L_p^\vee=\{c\in C(A_0)[1/p]:\phi(c)\in\mathbb Z_p
                 \text{ for all }\phi\in L_p\}\subseteq C(A_0)
\]

is F,V-stable by the transpose identities. The finite Dieudonné
anti-equivalence turns C(A₀)/L_p∨ into a finite subgroup H_p.
Combine the finitely many primary subgroups inside A₀ to a finite
flat H, and use A3 to form q:A₀→B=A₀/H. Exact realization comparisons
give q_ℓ^{-1}(T_ℓB)=L_ℓ, including the p-realization.
Thus **f=Nq^{-1}:B→A₀** transports the realization lattices to M_ℓ.
The one quotient by H performs the primewise gluing.

Injectivity is a separate integrality argument. Suppose an already
algebraic rational morphism α:A→B carries all integral realizations
into their targets. Write nα=h with h actual and n>0. For ℓ^a exactly
dividing n, its realization is divisible by ℓ^a, so h kills A[ℓ^a].
At p use finite group schemes and Dieudonné faithfulness, **not
geometric points**. Hence h kills A[n] and factors through its quotient
[n]; the factor is α. Apply this also to α^{-1} to detect isomorphisms.

This does **not** use p-Tate full faithfulness: it tests an already
algebraic rational morphism, not whether an arbitrary local linear map
is algebraic. Equal transported tuples give α=(f′)^{-1}f, integral in
both directions, hence the unique marked isomorphism. Postcomposition
by Γ=End⁰(A₀)^× changes the marking, and Γ\\X is precisely the set
of underlying F_p-isomorphism classes.

The all-q target statements stay unchanged; this is their explicit
prime-field restriction. Nonroutine inputs are the named A3/R07.2
quotient, torsion and exactness suppliers, not an implicit classification.

## C5. Finite support of the adelic conjugators

Let f_min be the monic squarefree minimal polynomial of Frobenius.
Its discriminant is nonzero. Away from its prime divisors,

\[
R_\ell=\mathbb Z_\ell[\pi]=S_\ell=\prod_i\mathcal O_{i,\ell}
\]

is finite étale and maximal. Integral idempotents split every full
π-stable lattice into free modules over the DVR factors. There is one
centralizer orbit, with stabilizer conjugate to ∏GL_{n_i}(O_i).
This is the new GN.2 adapter.

Use **f_min**, not the full characteristic polynomial: repeated factors
make the latter discriminant zero. A scalar operator on rank n has
minimal polynomial T−a of discriminant one. Finite-étale/maximal-order
and local freeness interfaces are still implementation work.

Use Tate away from p and both p-inputs of C3 to identify G(Q_ℓ),
G=End⁰(A₀)^×, with the Frobenius centralizer. At p, V=pF^{-1},
so the simultaneous centralizer is the F-centralizer and preserves
the F,V-stable subset.

Choose a finite exceptional set containing p and the divisors of
disc(f_min). At good primes take H₀,ℓ=Stab(T₀,ℓ); at exceptional
primes use S3 for the reference lattice. Their product K₀ is a compact
open of the AA.1 restricted product.

For a tuple M, use H_M,ℓ=H₀,ℓ and a_ℓ=1 outside that exceptional
set and the support of M. At the remaining finitely many places,
S3 gives H_M,ℓ conjugate to H₀,ℓ, containing
S_M,ℓ=Stab(M_ℓ), of index at most ℓ^{Δ_ℓ}.
These groups come from **successive graded saturations**, not the
saturation of the whole mixed lattice. Each is a product of integral
GL groups in block bases, giving local conjugacy in the centralizer.

The tuple a=(a_ℓ) is an actual finite adele because its support is finite.
Then K_M=aK₀a^{-1}. Componentwise stabilization gives
Stab(M)=∏S_M,ℓ; almost all factors equal H₀,ℓ, so this product lies
inside the restricted product. S5 yields

\[
[K_M:\operatorname{Stab}(M)]
 =\prod_\ell[H_{M,\ell}:S_{M,\ell}]
 \le\prod_\ell\ell^{\Delta_\ell}=D_*.
\]

The same support argument identifies adelic orbits with tuples of local
orbits: choose conjugators 1 wherever both tuples are the reference.
Good primes contribute one orbit. The F,V-stable p-subset is invariant
under the same centralizer, so its orbits inject into the F-stable orbit
set. L8 gives #G(A_f)\\X≤D_*². No strong approximation is used.

## C6. Coarse bound and remaining boundary

C4 identifies the desired isomorphism classes with Γ\\X.
C5 supplies S6's arithmetic interfaces in terms of exact A3/R07.2/Tate/AA
supplier theorems. For m=2g and

\[
h=\#\bigl(G(\mathbb Q)\backslash G(\mathbb A_f)/K_0\bigr)<\infty
\]

the resulting bound is

\[
\#\{\text{F}_p\text{-isomorphism classes isogenous to }A_0\}
 \le D_*^3h
 \le (2\sqrt p)^{3m(m-1)}h.
\]

This is assembly on named suppliers, not a claim that their proofs or
Lean interfaces are complete. AA.3 must supply coarse class-set
finiteness for this reductive semisimple-unit group and relate it to
its archimedean-component formulation. The value h is **not estimated**.
Real-Weil/quaternionic groups, norm images and narrow ideal classes
are retained. D_*=1 gives at most h, not one rational class.

G2 is narrowed, not closed. G8 now names remaining geometric,
p-realization, split-prime, Brauer and Honda proof leaves rather than
saying Tate and Waterhouse are unacquired. G0 final-journal comparison,
G1 sharp estimates, G3 polarization/Lang, G4 mass/dyadic/residue,
G5 quaternionic comparison, G6 small-prime repair and G7 statistical
limits remain as before. No new source error is alleged.

## C7. Reproducible finite checks

The following standard-library-only diagnostic passed **32,608 assertions**:
6,817 dual-composition cases; 3,984 F,V transpose cases and 3,984 rejected
F/V swaps; 15,625 three-prime rank-two scaling/duality cases;
1,230 denominator tests; 180 good-prime projection cases; 28 scalar
cases; five bad-prime examples; 54 nested-image/projection checks;
700 factor-refinement dimension checks; and one F_4 semilinearity test.

These test signs, directions and finite algebra. They are not proofs
of geometric representability, Tate/Dieudonné equivalence, compact
limiting arguments or adelic finiteness.

```python
"""Finite diagnostics for continuation C1-C6; not geometric or infinite proofs."""
from fractions import Fraction
from itertools import product
from collections import Counter

counts = Counter()
def ok(label, assertion):
    assert assertion, label
    counts[label] += 1

def mul(A, B, m):
    a,b,c,d = A
    e,f,g,h = B
    return ((a*e+b*g)%m, (a*f+b*h)%m,
            (c*e+d*g)%m, (c*f+d*h)%m)
def tr(A):
    a,b,c,d = A
    return (a,c,b,d)
def det(A):
    a,b,c,d = A
    return a*d-b*c
def inv(A,m):
    a,b,c,d = A
    u = pow(det(A)%m,-1,m)
    return tuple(u*x%m for x in (d,-b,-c,a))
def mv(A,v,p):
    a,b,c,d=A
    x,y=v
    return ((a*x+b*y)%p,(c*x+d*y)%p)

# Covariance: transposition reverses the contravariant matrix composition.
for prime in (2,3):
    mats=list(product(range(prime),repeat=4))
    for A,B in product(mats,repeat=2):
        ok("dual_composition", tr(mul(A,B,prime)) == mul(tr(B),tr(A),prime))

# Linear F,V need transposition, not interchange. Test all integral basis changes mod p^2.
for prime in (2,3):
    m=prime**2
    F=(1,0,0,prime)
    V=(prime,0,0,1)
    for P in product(range(m),repeat=4):
        if det(P)%prime == 0:
            continue
        Q=inv(P,m)
        A=mul(mul(P,F,m),Q,m)
        B=mul(mul(P,V,m),Q,m)
        ok("dual_fv", mul(tr(A),tr(B),m)==(prime,0,0,prime)
           and mul(tr(B),tr(A),m)==(prime,0,0,prime)
           and det(tr(A))==det(A)
           and (tr(A)[0]+tr(A)[3])%m==(A[0]+A[3])%m)
        ok("nontrivial_fv_swap", A != B)

# F_4 = F_2[a]/(a^2+a+1): the naive transpose is not F_4-linear.
def f4mul(a,b):
    out=0
    while b:
        if b&1:
            out ^= a
        b >>= 1
        a <<= 1
        if a&4:
            a ^= 7
    return out
sigma=lambda x:f4mul(x,x)
ok("nonprime_semilinearity",sigma(2)!=2 and sigma(f4mul(2,1))!=f4mul(2,sigma(1)))

# Diagonal lattice tuples at three primes, rank two each.
# M_l has exponents a_l; choose v_l(N)=max(0,a_l1,a_l2).
for exps in product(range(-2,3),repeat=6):
    for offset in (0,2,4):
        a,b=exps[offset:offset+2]
        n=max(0,a,b)
        L=(a-n,b-n)
        dual=(-L[0],-L[1])
        assert n>=a and n>=b and max(L)<=0 and min(dual)>=0
        assert tuple(n+x for x in L)==(a,b)
        assert tuple(-x for x in dual)==L
    ok("tuple_scaling_and_dual",True)

# A rational number belongs to all Z_l iff its reduced denominator is one.
def vp(n,p):
    if n==0:
        return 10**9
    n=abs(n)
    out=0
    while n%p==0:
        out+=1
        n//=p
    return out
primes=(2,3,5,7,11,13,17,19,23,29)
for n,d in product(range(-20,21),range(1,31)):
    x=Fraction(n,d)
    integral=all(vp(x.numerator,p)>=vp(x.denominator,p) for p in primes)
    ok("integrality_detection",integral==(x.denominator==1))

# Finite quotient analogue of X_n = (T intersect W)+p^n T, W first coordinate.
for p in (2,3,5):
    for r in range(1,5):
        m=p**r
        previous=None
        for n in range(r+1):
            image=frozenset((x,(p**n*y)%m) for x,y in product(range(m),repeat=2))
            ok("nested_images", len(image)==p**(2*r-n)
               and (previous is None or image<=previous))
            previous=image
        ok("limit_projection",previous==frozenset((x,0) for x in range(m)))

# Mod-l stable subspaces and integral idempotents at good primes.
for p in (2,3,5,7,11):
    zero=frozenset({(0,0)})
    full=frozenset(product(range(p),repeat=2))
    lines=[frozenset((t,t*s%p) for t in range(p)) for s in range(p)]
    lines.append(frozenset((0,t) for t in range(p)))
    spaces=[zero,full]+lines
    for a,b in product(range(p),repeat=2):
        stable=[W for W in spaces if all(mv((a,0,0,b),v,p) in W for v in W)]
        if a!=b:
            ok("good_prime_projections",len(stable)==4 and all(
                (x,0) in W and (0,y) in W for W in stable for x,y in W))
        else:
            ok("scalar_repeated_block",len(stable)==p+3)
    diagonal=frozenset((t,t) for t in range(p))
    ok("bad_prime_no_idempotent", (1,0) not in diagonal
       and all(mv((0,0,0,0),v,p) in diagonal for v in diagonal))

# Splitting a separable factor preserves the intertwiner-dimension sum.
for degree,a,b in product(range(1,9),range(5),range(5)):
    for first in range(1,degree):
        ok("hom_dimension_refinement",
           a*b*degree==a*b*first+a*b*(degree-first))

for label,count in sorted(counts.items()):
    print(f"{label}: {count}")
print(f"TOTAL: {sum(counts.values())}")
```

Validation and handoff results are recorded in the current JSON verification and handoff. No Lean file is authorized, written or compiled.

---

# Preserved earlier report

# Lipnowski–Tsimerman: stabilizer and level-map continuation

## Continuation by codex-a71f92 — 23 September 2026

Refs #1332. This is a continuation of PR #1848 (this session), itself
continuing PR #1652 (codex-c83e7a), not an independent review. Status:
**partial**. The 124 inherited item objects, 17 proposed v1 source issues,
all 19 withheld claims and the full earlier report/handoff are preserved.
The current JSON has **136 items: 16 library, 26 planned, 94 missing**.
Ten existing routes contain 75 missing and 25 planned items; the other
19 missing items remain explicitly withheld. There are 38
definition/construction API/test blocks and 42 selected, acyclic,
known-endpoint dependency edges. This selected graph is not full closure.

The new contribution is a replacement proof of a coarse non-isotypic
stabilizer bound, followed by an abstract rational-orbit counting argument
with its arithmetic hypotheses exposed. It does not certify the printed
proof, the sharp constant of Theorem 0.1, or the final journal version.

### Read boundary and provenance

At explorer snapshot
`277594a65a53ae5f7530539524add19c453b4e19`, freshly read all 38 pages /
1804 extracted lines of [LT arXiv v1](https://arxiv.org/pdf/1511.02212v1),
including §§0–5.7.3 and the whole bibliography. SHA-256:
`5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a`.
Freshly fetched and read §4.8 and the complete Lemma 4.9 proof, printed
pp.14–15, of [Yun v2](https://arxiv.org/pdf/1303.2420v2), SHA-256
`a9f560f9c7ed334ff4895cde2676476cd430e0efa7c14e3d6d508df5326bc347`.
Retrieval/read date: 23 September 2026. This is not a whole-Yun reading.
The earlier Conrad reading, other Yun sections, page-image inspections and
first eleven library checks remain historical evidence attributed below;
no fresh image inspection is claimed here.

The author listings at [Tsimerman's homepage](https://www.math.toronto.edu/jacobt/)
and [Lipnowski's homepage](https://sites.google.com/site/michaellipnowski/)
and [arXiv metadata](https://arxiv.org/abs/1511.02212) were checked again.
They do not establish agreement with the 51-page 2018 journal article.
The earlier publisher-security-HTML failure is historical, not a fresh
publisher retrieval in this claim. G0 remains open. No new sourceIssue or
independent-review verdict is added. Every inherited proposed error remains
scoped to the public v1, not asserted about the unavailable final text.

### Ownership and pinned API boundary

The reviewed GN.2, GN.3 and AA.4 rows were read along with the GN and AA
campaign documents and relevant atlas descriptions. The full upstream
Completed/IntegralLattices and GlobalNumberFields roadmaps were also read.
IntegralLattices supplies algebraic lattice/quotient vocabulary; its
implemented rational integral-form theory is not an implementation of the
finite-residue DVR adapter below. GlobalNumberFields supplies arithmetic
adele/idele carriers, not algebraic-group level quotients. GN.2 owns the
local lattice adapter, GN.3 the arithmetic lattice-orbit count, and AA.4 the
nested-level maps and stabilizer-sensitive bounds. The existing finite-field
Part II consumes them. No roadmap or competing carrier is introduced.

Five new library items are exact suppliers at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `Submodule.quotientEquivPiSpan`, together with the Smith basis equation
  and nonzero coefficients: FreeModule/Finite/Quotient.lean:37–77 and
  FreeModule/PID.lean:576–641. These are PID-generic.
- `cardQuot_pow_of_prime`, in the root namespace, and
  `Submodule.cardQuot_apply): Ideal/Norm/AbsNorm.lean:52–85,112–180.
  The prime ideal is nonzero; the consumer supplies a finite residue field.
- `IsDiscreteValuationRing.eq_unit_mul_pow_irreducible):
  DiscreteValuationRing/Basic.lean:320–344.
- `DoubleCoset.eq): GroupTheory/DoubleCoset.lean:73–126. The whole file
  was read; the carrier is `DoubleCoset.Quotient`, not a newly bundled
  adelic quotient.
- `MulAction.index_stabilizer): GroupTheory/Index.lean:891–900.
  It works for infinite groups; finiteness of the orbit is proved first.

The compared Tau Ceti statement
`HeckeCoset.degree_eq_relIndex`, NumberTheory/HeckeRing/Basic.lean:530,
was read at `f790474821cf4256814db967cb154e7af3d0c369`. It counts cosets
inside one Hecke double coset, not the coarse fiber after changing the
right level and retaining a left subgroup. It is not a substitute for S4.

Scoped pinned-library and atlas/packet/decomposition searches found no
exact implementation of the seven new assembly endpoints. A live read-only
Mathlib PR search for “double coset” found, among others,
[#43327](https://github.com/leanprover-community/mathlib4/pull/43327),
[#43328](https://github.com/leanprover-community/mathlib4/pull/43328) and
[#41253](https://github.com/leanprover-community/mathlib4/pull/41253);
their descriptions were read. These develop Hecke left-decompositions and
finiteness, reinforce using the existing quotient carrier, and are not
pinned-baseline suppliers for this job. The open-PR DVR search and a public
Zulip search did not identify the exact requested assembly; this is a
limited search, not an absence proof. Build the specified Tau Ceti adapter
on the existing API, not an upstream-PR prerequisite.

## S1. Finite-DVR determinant index

Let O be a DVR with fraction field K, uniformizer π, normalized valuation v
and finite residue field k of size q. Let T span W over K and be finite free
over O. If F is a K-linear automorphism with F(T)⊆T, then

`F⁻¹T/T ≃ T/FT; [x]↦[Fx]; #T/FT=q^{v(det_K F)}.`

The first equivalence is literal: changing x by T changes Fx by FT, and
the inverse takes y to F⁻¹y. For the cardinality, apply the pinned Smith
quotient equivalence to FT≤T. Its nonzero coefficients have form
u_iπ^{a_i}, with a_i≥0. Their principal ideals are the a_i-th powers of
the maximal ideal, whose quotient cardinalities are q^{a_i}. They are
finite: the positive Nat.card formula excludes the infinite case.
The product quotient has cardinality q^{Σa_i}.

To identify the exponent, a basis of T carried by F is a basis of FT.
The Smith basis of FT differs from it by an invertible O-matrix. The top
Smith basis differs from the chosen basis of T by another invertible
O-matrix. Their determinants are units, so v(det F)=Σa_i. The determinant
may equally be computed after scalar extension to W; basis invariance and
scalar extension are ordinary matrix determinant identities. Rank zero
gives the empty product 1. An invertible map with unit determinant gives
FT=T. The zero map on positive rank is excluded.

This is a missing assembly lemma, not a claim that the Z-only determinant
index theorem generalizes by changing its name. It supplies the exact
finite index used in S2 and also the finite-DVR steps isolated in L1/L5.
Suggested home: `TauCeti/LinearAlgebra/Lattice/DVRIndex.lean`, consuming
the existing submodule/basis/quotient API. No Lean file is part of this job.

## S2. Count a fixed successive profile, not intersections with summands

Work over K=Q_ℓ and O=Z_ℓ. Let γ be semisimple with distinct irreducible
monic integral factors f_i and multiplicities n_i. Write
V=⊕V_i, V_i=F_i^{n_i}, F_i=K[X]/f_i; set

`δ_i=v_ℓ disc(f_i); ρ_{ij}=v_ℓ Res(f_i,f_j).`

Fix an order of the blocks and set V_{≤i}=⊕_{j≤i}V_j.
For a full γ-stable lattice M, its successive profile is

`U_i=pr_i(M∩V_{≤i})⊂V_i.`

Each U_i is a full stable lattice. It is the image of the intersection with
the prefix, not M∩V_i. This distinction is the existing `flag-fiber`
definition's point; no second profile carrier is needed.

For fixed prefix lattice L⊂V_{<i} and fixed U_i, all lattices extending them
are graphs of O-linear maps U_i→V_{<i}/L. Because U_i is O-free, choose
lifts of a basis and extend K-linearly. Thus this Hom group is

`W/T; W=Hom_K(V_i,V_{<i}); T=Hom_O(U_i,L).`

The split γ-action gives the Sylvester map
F(t)=γ_{<i}t−tγ_i. It preserves T. Its K-kernel is zero because the two
spectra are disjoint, hence it is invertible. A graph is γ-stable exactly
when its class lies in ker(F:W/T→W/T)=F⁻¹T/T. There is no quotient by a
nonzero rational commuting shear at this step. Such shears matter inside
repeated blocks in L5, not between distinct irreducible factors here.

S1 gives the cardinality ℓ^{v(det F)}. Over a splitting field, the
eigenvalues of F are differences of eigenvalues in the prefix and the new
block. Consequently

`v(det F)=Σ_{j<i} n_j n_i ρ_{ji}.`

The determinant is computed on the ambient K-space, so this exponent does
not depend on the particular prefix lattice L or its basis. Induction on
the number of blocks proves the exact raw profile count

`#{M with successive profile (U_i)}=ℓ^{Σ_{i<j}n_i n_jρ_{ij}}.`

This expands the already present `yun-resultant-fiber` item, rather than
adding a duplicate theorem. Yun's global setup uses regular semisimple
elements. The displayed proof separately checks that the invertible
Sylvester calculation permits repeated multiplicities within each block;
it does not apply a regular-semisimple theorem outside its hypotheses.
The signs of resultants disappear under valuation, and each unordered
pair occurs once. All factors and cross resultants are nonzero integral
elements, so every displayed valuation is nonnegative.

Acceptance: γ=diag(0,0,ℓ^t), with rank-two and rank-one standard graded
lattices, gives ℓ^{2t} raw extensions. For three rank-one blocks 0,2,4
over Q₂, the valuations are 1,2,1 and the total is 16; the prefix Sylvester
matrix need not stay diagonal in a lattice basis. Replacing projected
quotients with coordinate intersections fails to describe these graphs.

## S3. Non-isotypic stabilizer bound

Put R_i=O[θ_i] and S_i=O_{F_i}. Normalize each U_i separately by the
inherited saturation-normalization theorem:

`R_i^{n_i}⊆U_i⊆S_i^{n_i}; S_iU_i=S_i^{n_i}.`

A block-diagonal centralizer element makes all these normalizations
simultaneously. This does not say the whole M lies in the direct sum of
these normalized graded lattices. Let H_i=GL_{n_i}(S_i) and H=∏H_i.

First, any element stabilizing M preserves every prefix V_{≤i}, hence its
intersection with M and the quotient U_i. It also preserves S_iU_i.
Therefore Stab_{Z_γ(K)}(M)⊆H. The relevant compact level is the one from
the **graded saturations**, not an unexplained normalization of SM.

Second, there is an equivariant map

`H·M → ∏_i H_i·U_i.`

L9 bounds each factor by ℓ^{n_i²δ_i}. Its congruence kernel argument also
handles δ_i=0. Thus the profile image has at most
ℓ^{Σn_i²δ_i} elements. For each profile, S2 bounds the subset belonging to
H·M by the number of all lattices with that profile. Multiplication gives

`#(H·M) ≤ ℓ^E; E=Σ_i n_i²δ_i+Σ_{i<j}n_i n_jρ_{ij}.`

This proves the orbit finite. Now apply the pinned `index_stabilizer`,
not a finite-group formula: H itself is generally infinite. With
Δ=Σn_i²δ_i+2Σ_{i<j}n_i n_jρ_{ij}, nonnegative valuations give E≤Δ.
Conjugating back yields the new `nonisotypic-stabilizer-bound` item.

This avoids the unnecessary extra multiplicity introduced by applying a
single global conductor to all matrix entries. It proves a new coarse
bound; it does not repair the printed p.12 map by pretending it is
well-defined. The literal `stabilizer-depth-source` remains withheld.
No sharp global asymptotic constant follows just from S3.

## S4. Nested double-coset levels retain the left stabilizer

For any group G, subgroups H,K and K'≤K, use Mathlib's double-coset carrier.
The map π:H\G/K'→H\G/K sends [g] to [g]. The representative criterion
`DoubleCoset.eq` proves it well-defined.

For a fixed coarse class [g], map the left coset set K/K' to its fiber by
kK'↦[gk]. If k₂=k₁s for s∈K', the two fine double cosets agree.
For surjectivity, [x] lies over [g] exactly when x=h g k for some h∈H,k∈K;
then [x]=[gk] at the fine level. K' need not be normal. The map is a map
of sets, not a homomorphism of quotient groups.

If N=[K:K'] is finite, each fiber has at most N elements. If H\G/K has
h elements, the fine quotient is a finite dependent sum of fibers and has
at most Nh elements. It is generally wrong to replace either bound by an
equality. With H=G every fiber is a singleton for any N. With H=1 the
fiber bound is attained. No neatness, freeness, discrete action, finite G,
or Haar measure is assumed.

The one new construction has an explicit API in JSON: representative
formula, surjectivity, fiber surjection, identity/composition of level
maps, and coset compatibility. Its four tests include a nonnormal
transposition subgroup of S₃. Build in the existing AA.4 direction,
suggested home
`TauCeti/NumberTheory/AdelicAlgebraicGroups/LevelMaps/DoubleCoset.lean`.
The theorem counting its fibers is a separate endpoint.

## S5. Conjugate levels and finite-support products

Two further group-theoretic adapters prevent silent global assumptions.

If K_a=aKa⁻¹, the map H\G/K_a→H\G/K is [g]↦[ga], with inverse
[x]↦[xa⁻¹]. Indeed g'=h g(a k a⁻¹) implies g'a=h(ga)k.
No rationality or normalization of H is imposed on a. Conjugating g itself
would change the left subgroup and would be a different statement.

For S_v≤H_v with S_v=H_v outside a finite set B, the coset set
(∏H_v)/(∏S_v) is equivalent to ∏_{v∈B}H_v/S_v. Equality on the right
means coordinatewise subgroup membership, exactly equality on the left.
Choose representatives at the finitely many exceptional places and fill
all other coordinates with identity for the inverse. Consequently the
index is the finite product of the local indices. No normality is used.
In a restricted-product group, verify that these product subgroups really
embed in the specified ambient group before using the statement.

Both adapters belong to AA.4 for this consumer; neither constructs a new
adele ring. Infinitely many proper local subgroups are excluded. A bare
collection of locally conjugate compact levels does not yet produce an
adelic conjugating element: the integrality/restricted-product condition
must be checked.

## S6. Conditional global counting, with arithmetic inputs still visible

Let G_f act on X and let Γ≤G_f. Suppose there are at most D_*² G_f-orbits,
as the local-orbit bound L8 would supply after the group identifications.
For each representative M, suppose

- Stab(M)=∏S_{M,ℓ} is contained in K_M=∏H_{M,ℓ};
- S_{M,ℓ}=H_{M,ℓ} outside finitely many primes and the product of local
  indices is at most D_*;
- K_M=a_M K₀a_M⁻¹ for a_M∈G_f and a fixed K₀;
- h=#(Γ\G_f/K₀) is finite.

Within one transitive orbit the rational-orbit set is
Γ\G_f/Stab(M): represent a point by gM, and equality modulo Γ is exactly
the double-coset relation. S4 bounds its cardinality by D_* times the
coarse class-set size at K_M. S5 identifies that coarse set with the one
at K₀. Summing over the at most D_*² orbits gives

`#(Γ\X)≤D_*³ h.`

For the semisimple Weil polynomial data of L8, the product of ℓ^{Δ_ℓ}
is the positive integer D_* formed from the ordered unequal root
occurrences, with multiplicities. S3 gives each local index at most
ℓ^{E_ℓ}≤ℓ^{Δ_ℓ}. When the finite-support and ambient-group assumptions
above have been verified, the product bound follows, and

`#(Γ\X)≤(2√p)^{3m(m−1)}h; m=2g.`

This is a conditional mathematical endpoint, not a hypothesis field
asserting the desired conclusion. The actual missing producer contracts
remain `marked-quasi-isogeny`, `forget-marking`,
`prime-p-centralizer`, `adelic-class-set` and
`nonabelian-class-comparison`, with the original classification references
listed in prerequisites. They must establish the action identification,
semisimple local centralizers, product stabilizers, finite-support
conjugacy and finite class-set comparison. At p the prime-field F,V
adapter is required; this is not a statement for arbitrary F_{p^r}.

No strong approximation or reduced-norm class-number identification was
used in the abstract proof. In particular h is not silently replaced by a
product of wide class numbers. The real-Weil/quaternionic rank-one
exception and narrow-class issues in G5 remain. Even D_*=1 leaves h
rational classes, not necessarily one. The Part II brief now names this
conditional bound and its exact supplier obligations; it does not adopt
the source's disputed numerical coefficient.

## S7. Diagnostics and remaining work

The standard-library Python below ran successfully with 47,689 exact
cases: 384 DVR cokernels; 11 flag fibers; 48 stable graph lattices; four
profile counts; nine unequal-block fibers; 135 unequal-block compact
orbit models; 136 double-coset fibers; 90 total bounds; 216 conjugate-level
comparisons; 46,656 exponent inequalities. These are diagnostics of the
written formulas, not proofs or Lean tests. The S₃ test enumerates every
subgroup triple K'≤K and retains H; the lattice test uses exact fractions.

The determinant/index and general non-isotypic steps now have concrete
mathematical proof plans. G2 is narrower, not closed: local type adapters
and the arithmetic identification/finite-support suppliers remain.
G0/G1 and G3–G8 remain unchanged. The report deliberately preserves the
earlier statements of what was unresolved **at the earlier checkpoint**
below; the current S1–S6 supplement and JSON verification describe what
this claim adds.

The source checker, intake checker (three files, zero problems),
preservation/routing/API/DAG checks and all 48 checker/intake regression
tests pass at publication snapshot
`d546d126d455b9add0ac32d9cb30b5ff488dece7`. No Lean
file was written or compiled. Independent review is still required.

```python
from fractions import Fraction as Q
from itertools import product, permutations
from math import gcd

checks = {}

def record(k):
    checks[k] = checks.get(k, 0) + 1

def vp(a, p):
    assert a
    n = 0
    while a % p == 0:
        a //= p
        n += 1
    return n

def matmul(a, b):
    return [[sum(x*y for x, y in zip(row, col)) for col in zip(*b)] for row in a]

def inv(a):
    n = len(a)
    b = [[Q(x) for x in row] + [Q(i == j) for j in range(n)] for i, row in enumerate(a)]
    for i in range(n):
        r = next(r for r in range(i, n) if b[r][i])
        b[i], b[r] = b[r], b[i]
        d = b[i][i]
        b[i] = [x/d for x in b[i]]
        for r in range(n):
            if r != i:
                d = b[r][i]
                b[r] = [x-d*y for x, y in zip(b[r], b[i])]
    return [r[n:] for r in b]

def integral(a):
    return all(x.denominator == 1 for row in a for x in row)

# Exhaustive nonsingular two-dimensional DVR cokernels modulo p^N.
# N exceeds the determinant valuation, hence all Smith factors fit.
for p in (2, 3):
    for entries in product(range(4), repeat=4):
        a, b, c, d = entries
        det = a*d-b*c
        if not det:
            continue
        v = vp(abs(det), p)
        modulus = p**(v+1)
        image = {( (a*x+b*y) % modulus, (c*x+d*y) % modulus)
                 for x, y in product(range(modulus), repeat=2)}
        assert modulus**2 // len(image) == p**v
        record('dvr_cokernel')

# Successive graded profiles are Z_p, not coordinate intersections.
# In the prefix basis the Sylvester matrix need not be diagonal.
for p, eigen in ((2, (0, 2, 4)), (3, (0, 3, 6)), (2, (0, 1, 2)), (3, (0, 1, 3))):
    lattices = [[[Q(1)]]]
    for i in range(1, len(eigen)):
        v = sum(vp(abs(eigen[j]-eigen[i]), p) for j in range(i))
        modulus = p**v
        next_lattices = []
        for basis in lattices:
            f = [[Q((eigen[j]-eigen[i]) if j == k else 0) for k in range(i)] for j in range(i)]
            sylvester = matmul(matmul(inv(basis), f), basis)
            fibers = []
            for numer in product(range(modulus), repeat=i):
                w = [[Q(t, modulus)] for t in numer]
                if integral(matmul(sylvester, w)):
                    col = matmul(basis, w)
                    extended = [row+[col[j][0]] for j, row in enumerate(basis)] + [[Q(0)]*i+[Q(1)]]
                    fibers.append(extended)
            assert len(fibers) == p**v
            next_lattices.extend(fibers)
            record('flag_fiber')
        lattices = next_lattices
    exponent = sum(vp(abs(a-b), p) for j, a in enumerate(eigen) for b in eigen[j+1:])
    assert len(lattices) == p**exponent
    gamma = [[Q(eigen[j] if j == k else 0) for k in range(3)] for j in range(3)]
    for basis in lattices:
        assert integral(matmul(matmul(inv(basis), gamma), basis))
        record('flag_stability')
    record('profile_count')

# Unequal repeated multiplicities: rank-two scalar block against rank one.
for p in (2, 3, 5):
    for t in range(3):
        modulus = p**t
        fibers = list(product(range(modulus), repeat=2))
        assert len(fibers) == p**(2*t)
        # GL_2(Z/p^t) x GL_1 acts on these graph parameters. For t>0,
        # count the orbit of (1,0) directly; its stabilizer is not discarded.
        if t and modulus <= 9:
            units = [u for u in range(modulus) if gcd(u, modulus) == 1]
            matrices = [a for a in product(range(modulus), repeat=4)
                        if gcd(a[0]*a[3]-a[1]*a[2], modulus) == 1]
            for z in fibers:
                orbit = {((a[0]*z[0]+a[1]*z[1])*pow(u, -1, modulus) % modulus,
                          (a[2]*z[0]+a[3]*z[1])*pow(u, -1, modulus) % modulus)
                         for a in matrices for u in units}
                stab = sum(((a[0]*z[0]+a[1]*z[1]-u*z[0]) % modulus == 0 and
                            (a[2]*z[0]+a[3]*z[1]-u*z[1]) % modulus == 0)
                           for a in matrices for u in units)
                assert len(matrices)*len(units) == len(orbit)*stab
                assert len(orbit) <= p**(2*t)
                record('unequal_block_orbit')
        record('unequal_block_fiber')

# Infinite compact groups are not enumerated here: these are finite models.
def mul(a, b):
    return tuple(a[i] for i in b)

def inverse(a):
    return tuple(a.index(i) for i in range(len(a)))

g = set(permutations(range(3)))
identity = tuple(range(3))
subgroups = []
gl = sorted(g)
for mask in range(1 << len(gl)):
    h = {x for i, x in enumerate(gl) if mask >> i & 1}
    if identity in h and all(mul(x, y) in h for x in h for y in h):
        subgroups.append(h)

def dc(h, k, x):
    return frozenset(mul(mul(a, x), b) for a in h for b in k)

def classes(h, k):
    return {dc(h, k, x) for x in g}

strict = 0
for h, k, small in product(subgroups, repeat=3):
    if not small <= k:
        continue
    large_classes, small_classes = classes(h, k), classes(h, small)
    index = len(k)//len(small)
    for cls in large_classes:
        fiber = {c for c in small_classes if c <= cls}
        x = next(iter(cls))
        image = {dc(h, small, mul(x, a)) for a in k}
        assert fiber == image and 1 <= len(fiber) <= index
        strict += len(fiber) < index
        record('double_coset_fiber')
    assert len(small_classes) <= index*len(large_classes)
    record('double_coset_total')
assert strict > 0
assert len(classes(g, {identity})) == 1 < len(g)
for h, k in product(subgroups, repeat=2):
    for a in g:
        ka = {mul(mul(a, x), inverse(a)) for x in k}
        images = []
        for cls in classes(h, ka):
            image = {dc(h, k, mul(x, a)) for x in cls}
            assert len(image) == 1
            images.extend(image)
        assert set(images) == classes(h, k) and len(images) == len(set(images))
        record('conjugate_level')

for n1, n2, n3 in product(range(1, 5), repeat=3):
    for d1, d2, d3, r12, r13, r23 in product(range(3), repeat=6):
        diagonal = n1*n1*d1+n2*n2*d2+n3*n3*d3
        cross = n1*n2*r12+n1*n3*r13+n2*n3*r23
        assert diagonal+cross <= diagonal+2*cross
        record('stabilizer_exponent')

print(checks)
print('PASS', sum(checks.values()), 'exact diagnostic cases; not proofs or Lean tests')
```

---

## Historical report through PR #1848 (unchanged)

# Lipnowski–Tsimerman: local-counting continuation


## Continuation by codex-a71f92 — 22 September 2026

Refs #1332. This continues, rather than independently reviews, PR #1652.
Current totals: **124 items: 11 library, 26 planned, 87 missing**. The ten
existing routes take 68 missing and 25 planned items; all 19 withheld items
stay withheld. There are 37 unchanged definition/construction API/test
blocks, eight new theorem plans, three generic library imports and 24
selected prerequisite edges. This is not a complete DAG or formalization.

### Evidence, imports and ownership

Freshly read all 38 pages of [v1](https://arxiv.org/pdf/1511.02212v1), including
the bibliography, and inspected page images 9, 10 and 12. Freshly read
selected [Yun v2](https://arxiv.org/pdf/1303.2420v2) sections: §§1–2.2,
4.1–4.7 (4.7 only partly), 4.8–4.14, including complete proofs of Lemma 4.9
and Proposition 4.13. This is not a whole-Yun reading. The source hashes are
unchanged. Conrad and the original eight library checks remain attributed
to PR #1652, not claimed as fresh reading.

A fresh request to the [journal DOI](https://doi.org/10.1215/00127094-2018-0029)
and canonical publisher download still did not obtain the final PDF.
Authors' pages still link v1. **G0 remains open**; 38 versus 51 pages does
not establish a mathematical change. The 17 sourceIssues record predecessor
findings and selected G2 rechecks, all version-qualified. “new” means only
that no correction was located in the limited listed search, not priority
or an allegation about the unavailable final text. No independent-review
verdict is added.

At Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 the actual statements,
proofs and relevant standing hypotheses were read for:

- traceForm_dualSubmodule_adjoin, Submodule.traceDual and
  Submodule.traceDual_span_of_basis, in
  Mathlib/RingTheory/DedekindDomain/Different.lean, especially 57–112 and
  592–631. The integrally closed hypothesis is on the base ring, not the
  order. Module.Basis.traceDual_powerBasis_eq in Trace/Basic.lean:610 was
  also read as compatible basis evidence, not counted as another item.
- HenselianRing.is_henselian and IsAdicComplete.henselianRing, in
  Mathlib/RingTheory/Henselian.lean:88–178.
- IsLocalRing.length_restrictScalars, in
  Mathlib/RingTheory/LocalRing/Length.lean:54–81. This is an extended-natural
  length identity; finite-length/residue-degree conversions remain needed.

The inspected Submodule.natAbs_det_basis_change is over **Z**, not a general
finite-residue DVR; it is not claimed to close the local index adapter.
GN.2/GN.3 reviewed coverage rows were read at blob
5e708cfc74a51b10e62149113872fe4e00eb5846 and the owner description checked.
Library searches did not locate the exact local-order counting endpoints;
this is bounded evidence, not proof that generic ingredients are absent.
GN.2 takes the coefficient-DVR, conductor and isotypic stabilizer adapters;
GN.3 takes local counting. No new carrier, definition or roadmap is
introduced; the existing finite-field Part II is unchanged.

### L1. Ordinary trace dual and the conductor

Let O=Z_ell, K=Q_ell, F=K(theta), R=O[theta], S=O_F,
f=minpoly_K(theta) monic integral irreducible, beta=f'(theta), and
delta=v_ell(disc f). Characteristic zero gives separability. Use the ordinary
field trace, not Yun's modified pairing without its scaling.

The pinned identity gives R^vee=beta^(-1)R. Traces of integral elements are
integral, so S⊆R^vee and beta S⊆R. The determinant of multiplication by beta
is Norm(beta)=±disc(f), hence #S/beta S=ell^delta and length_O(S/R)≤delta.
For R⊆M⊆S, N=beta M^vee is an R-ideal in R, and

    length_O(R/N)=length_O(R^vee/M^vee)=length_O(M/R)≤delta.

Dual bases or the Smith factors of the inclusion prove the middle equality.
N represents the **dual homothety class**, not necessarily M's own class.
Trace duality is an involution on full-lattice homothety classes.

The mathematical DVR calculation used here and in L5 is explicit:
diagonalize an injective equal-rank free-lattice map with factors pi^a_i.
Its quotient has length sum a_i, cardinality Q^(sum a_i), and determinant
valuation sum a_i. The exact pinned finite-DVR adapter remains unmatched;
the Z-only cardinality theorem is not a substitute.

### L2. Correct residue field

The finite O-algebra R is complete and local: otherwise a coprime
factorization modulo ell would lift, contradicting irreducibility of f.
Write k_R=F_(ell^s), not necessarily F_ell. Lift the separable irreducible
polynomial of the residue of theta to a monic polynomial h over O.
Hensel lifting in R gives w≡theta with h(w)=0. Then O_0=O[w] is the
unramified coefficient DVR with residue k_R. Put t=theta−w∈rad R.

We have R=O_0[t]. The radical and ell-adic topologies on this finite local
algebra agree, so t is topologically nilpotent; continuous evaluation gives
O_0[[T]]→R, T↦t, surjectively already on polynomials. This includes t=0.
For a finite R-module A, scalar restriction gives

    length_O(A)=s·length_(O_0)(A).

A colength bound delta becomes floor(delta/s). We do not assert a quotient
of Z_ell[[T]] for s>1. The generic Hensel theorem supplies lifting, not the
whole coefficient-DVR and topological evaluation construction; those
adapters remain planned.

### L3. Weighted partitions, including zero

For Q=#k_R, Yun Proposition 4.13 counts ideals of colength j in O_0[[T]] by
H_Q(j)=sum_(lambda partition of j) Q^(j−length(lambda)).
H_Q(0)=1. For j≥1, inject partitions into ordered compositions by retaining
their nonincreasing order. There are binom(j−1,k−1) compositions of length k,
so

    H_Q(j)≤sum_(k=1)^j binom(j−1,k−1)Q^(j−k)=(Q+1)^(j−1).
    sum_(j=0)^a H_Q(j)≤1+((Q+1)^a−1)/Q≤(Q+1)^a≤Q^(2a).

Pullback injects R-ideals into power-series ideals without changing
O_0-colength. With Q=ell^s and a=floor(delta/s), there are at most
ell^(2delta) R-ideals of O-colength ≤delta. At delta=0 the candidate is R.
No false weak-composition bound from LT (13) is used.

### L4. Rank-one classes

Scale M⊂F so SM=S. Some element of M is an S-unit; divide by it to arrange
R⊆M⊆S. L1 sends the dual class to a small-colength ideal. Duality permutes
homothety classes, so

    C_1 := #(F^× \ {full R-lattices in F}) ≤ ell^(2delta).

For later flag quotients choose trace duals of the finite list of small
ideals as representatives. The factor beta is only a scalar. Claiming the
small ideals directly represent the original classes would omit the
duality step.

### L5. Refine the existing extension-determinant node

Fix gamma-stable U_i⊂V_i. Put W=Hom_K(V_2,V_1),
M=Hom_O(U_2,U_1), F(T)=gamma_1 T−T gamma_2.
An O-splitting identifies graph extensions with ker(F:W/M→W/M);
changing the splitting changes T by M. Rational commuting shears translate
by ker(F:W→W). The snake sequence identifies the quotient with
ker(M/FM→W/FW).

Semisimplicity gives W=ker F⊕W', W'=im F. For M'=M∩W',

    FM'⊆FM⊆M',  ker(M/FM→W/FW)=M'/FM.

There is a **surjection** M'/FM'→M'/FM, not the printed inclusion.
The lattice M' is full in W' and F is invertible there. The index calculation
in L1 bounds the shear quotient by ell^(v_ell det(F|W')).

For V_1=F^(i−1), V_2=F, the nonzero differences of distinct roots of f each
occur i−1 times, giving valuation (i−1)delta. Equal-root directions are
removed by commuting shears, not counted as finite raw graph fibers.
This is added to the existing item, not duplicated as a new theorem.

### L6. Repeated blocks

Use the standard F-coordinate flag in F^n. A block-diagonal
GL_(n−1)(F)×F^× element normalizes the intersection and projected quotient
to their finite orbit lists. L5 bounds the shear orbits for each pair by
ell^((n−1)delta). Parabolic orbits surject onto full centralizer orbits:

    C_n≤C_(n−1)C_1 ell^((n−1)delta)
       ≤ell^((n(n−1)/2+2n)delta)≤ell^(2n²delta), n≥1.

At delta=0 the bound is one. This **quadratic** multiplicity replacement
does not prove the printed linear ell^(4n delta) bound.
The original local-orbit-source item stays withheld.

### L7. Distinct isotypic factors

Write charpoly(gamma)=product_i f_i^n_i,
delta_i=v_ell disc(f_i), rho_ij=v_ell Res(f_i,f_j).
Across distinct isotypic summands the Sylvester operator is invertible;
its determinant contributes n_i n_j rho_ij once per unordered pair.
This reproves Yun's graph-fiber argument using full repeated characteristic
polynomials, not its regular-semisimple statement beyond its hypotheses.

Combining with L6 gives

    C_gamma≤ell^[sum_i (n_i(n_i−1)/2+2n_i)delta_i
                  +sum_(i<j)n_i n_j rho_ij]≤ell^(2Delta),
    Delta=sum_i n_i²delta_i+2sum_(i<j)n_i n_j rho_ij.

Delta is the valuation of the product of **ordered unequal-root
differences with multiplicities**. Valuations are nonnegative.
The ordinary discriminant vanishes for repeated roots and is not used.

### L8. Only the adelic local-orbit factor

For a monic integral polynomial of degree m whose roots have modulus
sqrt(p), the product of ordered unequal-root differences is nonzero,
integral and Galois invariant. Its absolute value D_* is a positive
integer with v_ell(D_*)=Delta_ell. All but finitely many local counts are one:

    product_ell C_(gamma,ell)≤D_*²≤(2sqrt(p))^(2m(m−1)).

For m=2g this is (2sqrt(p))^(4g(2g−1))=exp(O_p(g²)).
This bounds only the restricted-product **local centralizer orbit** factor.
It is not the rational adelic class-set count or the global abelian-variety
count. The application uses the inherited prime-field F,V reduction;
semilinear centralizers over nonprime fields are not covered.

### L9. Isotypic stabilizer by a congruence kernel

Normalize R^n⊆M⊆S^n by choosing an S-basis from M after saturation;
the images of an S-generating set span the residue vector space.
Stab(M)⊆GL_n(S) because SM=S^n. For
g∈ker(GL_n(S)→GL_n(S/beta S)),

    (g−1)M⊆beta S^n⊆R^n⊆M.

The same holds for g^(-1), so gM=M. Bounding the finite reduction image by
all matrices gives

    [GL_n(S):Stab(M)]≤#(S/beta S)^(n²)=ell^(n²delta).

At delta=0 the whole group stabilizes M; no positive-colength hypothesis is
hidden. This avoids the ill-defined p.12 orbit map: for ell=3,
F=Q_3(i), R=Z_3[3i], M=S=Z_3[i], the units **1 and −1 in R** give the
same orbit point but maps evaluated at i differ by 2i modulo R.
The target exists since S⊆R^vee. Using i as the group element would fail
the printed GL_1(R) hypothesis, so that is not the example used.

Only the isotypic case is proved here. In general, a blockwise
minimal-polynomial conductor may introduce n_i²-weighted cross-resultants
and lose the desired O(g²) exponent. A compatible sharper flag/stabilizer
bound and rational class-set glue remain required for (20). G2 stays partial.

### Validation and remaining gaps

The embedded standard-library Python was run: 176 weighted-partition tests,
992 residue-degree cases, 6144 multiplicity/resultant cases, 28 exact
trace-dual examples, all 6561 matrices over F_9 (5760 invertible, stabilizer
48, orbit 120), the unit-of-R counterexample and 30 finite shear cases.
These are regressions, not proofs for arbitrary fields or dimensions.

G0–G8 and the 19 original withheld claims remain, with G2 narrowed by L1–L9.
The final journal comparison, full mass theorem, quaternionic scope,
enhanced limiting law and original external supplier proofs are not closed.
No Lean file was requested, written or compiled. The paper schema and three-file intake checks pass against the complete
catalogue (3 files, 0 problems). Preservation checks retain all 113 original
IDs/statuses/statements, original routes, 37 API/test blocks, all 19 withheld
items and the historical report/handoff. The 24 selected edges have known
endpoints and are acyclic; no local paths were found. Publication was
rebased by API onto fresh snapshot 5db325c698954f89a2b5c8524b297ce8fb066399;
relevant protocols and GN coverage/description hashes are unchanged.

### Reproducible finite checks

```python
"""Finite regression checks for the LT18 local replacement; not proofs."""
from fractions import Fraction as Q
from itertools import product
from math import comb

def partitions(n, largest=None):
    if n == 0:
        yield ()
        return
    largest=min(n, n if largest is None else largest)
    for a in range(largest, 0, -1):
        for rest in partitions(n-a,a):
            yield (a,)+rest

cases=0
for q in (2,3,4,5,8,9,16,25):
    running=1
    for j in range(1,23):
        exact=sum(q**(j-len(lam)) for lam in partitions(j))
        comp=sum(comb(j-1,k-1)*q**(j-k) for k in range(1,j+1))
        assert comp==(q+1)**(j-1)
        assert exact<=comp
        running+=exact
        assert running<=(q+1)**j<=q**(2*j)
        cases+=1
print("PASS:",cases,"weighted partition/composition/cumulative cases; colength zero=1")

residue=0
for ell in (2,3,5,7):
    for s in range(1,9):
        for delta in range(31):
            assert (ell**s+1)**(delta//s)<=ell**(2*delta)
            residue+=1
print("PASS:",residue,"residue-degree/length conversions")

exponents=0
for ni in product(range(1,9),repeat=3):
    for ds in ((0,0,0),(1,1,1),(0,3,2),(7,0,1)):
        for rs in ((0,0,0),(1,2,3),(5,0,7)):
            diag=sum(n*n*d for n,d in zip(ni,ds))
            cross=ni[0]*ni[1]*rs[0]+ni[0]*ni[2]*rs[1]+ni[1]*ni[2]*rs[2]
            refined=sum((n*(n-1)//2+2*n)*d for n,d in zip(ni,ds))+cross
            Delta=diag+2*cross
            assert refined<=2*Delta
            exponents+=1
for n in range(1,101):
    assert sum(range(n))+2*n==n*(n-1)//2+2*n
    assert n*(n-1)//2+2*n<=2*n*n
assert comb(1,1)==1 and 0**1==0  # source composition bound fails at delta=0,n=1
print("PASS:",exponents,"multiplicity/resultant exponent cases and zero-discriminant branch")

def eye(n):
    return [[Q(i==j) for j in range(n)] for i in range(n)]
def mm(A,B):
    return [[sum(a*b for a,b in zip(row,col)) for col in zip(*B)] for row in A]
def det(A):
    a=[list(map(Q,row)) for row in A]
    ans=Q(1)
    for j in range(len(a)):
        k=next((k for k in range(j,len(a)) if a[k][j]),None)
        if k is None:return Q(0)
        if k!=j:a[k],a[j]=a[j],a[k];ans=-ans
        v=a[j][j];ans*=v
        for k in range(j+1,len(a)):
            z=a[k][j]/v
            a[k]=[x-z*y for x,y in zip(a[k],a[j])]
    return ans
def inv(A):
    n=len(A);a=[list(map(Q,row))+e for row,e in zip(A,eye(n))]
    for j in range(n):
        k=next(k for k in range(j,n) if a[k][j])
        a[k],a[j]=a[j],a[k]
        v=a[j][j];a[j]=[x/v for x in a[j]]
        for k in range(n):
            if k!=j:
                z=a[k][j];a[k]=[x-z*y for x,y in zip(a[k],a[j])]
    return [row[n:] for row in a]
dual_cases=0
for r in range(1,8):
    for a in (2,3,5,7):
        # f=X^r-a is Eisenstein, so this is a field order.
        C=[[Q(0) for _ in range(r)] for _ in range(r)]
        for j in range(r-1):C[j+1][j]=1
        C[0][r-1]=a
        powers=[eye(r)]
        for k in range(2*r):
            powers.append(mm(powers[-1],C))
        tr=[sum(M[i][i] for i in range(r)) for M in powers]
        G=[[tr[i+j] for j in range(r)] for i in range(r)]
        assert det(G)
        D=[[r*x for x in row] for row in powers[r-1]] # multiplication by f'(theta)
        B=mm(D,inv(G))
        assert all(x.denominator==1 for row in B for x in row)
        assert abs(det(B))==1
        assert abs(det(D))==abs(det(G))
        assert mm(G,inv(G))==eye(r)
        dual_cases+=1
print("PASS:",dual_cases,"exact trace-dual/codifferent and norm-discriminant cases")

# F_9 = F_3[i], i^2=-1; coordinate subspace F_3^2 in F_9^2.
def add(x,y):return ((x%3+y%3)%3)+3*((x//3+y//3)%3)
def neg(x):return (-x%3)+3*((-(x//3))%3)
def mul(x,y):
    a,b=x%3,x//3;c,d=y%3,y//3
    return ((a*c-b*d)%3)+3*((a*d+b*c)%3)
gl=stab=0
for a,b,c,d in product(range(9),repeat=4):
    determinant=add(mul(a,d),neg(mul(b,c)))
    if determinant:
        gl+=1
        if all(x<3 for x in (a,b,c,d)):stab+=1
assert (gl,stab)==(5760,48)
assert gl//stab==120<=3**8
print("PASS: GL2(F9)=5760, F3-plane stabilizer=48, orbit=120 <= 3^8")

# In R=Z_3[3i] subset S=Z_3[i], both 1 and -1 are R-units.
# They give the same orbit point S, but at m=i the maps modulo R differ.
assert (2 % 3) != 0  # 2i is not in R; reduction detects its i coefficient.
assert mul(2, 2) == 1  # -1 is a unit even in the smaller residue field F_3.
print("PASS: the orbit-map counterexample uses two units of R, not merely of S")

# Repeated eigenvalues are quotiented by commuting shears, not counted as finite raw fibers.
shears=0
for ell,s,eigs in product((2,3),(1,2,3),((0,0),(0,1),(1,1),(0,2),(1,3))):
    mod=ell**s
    differences=[a-b for a in eigs for b in eigs]
    zero_count=differences.count(0)
    # Product of independent one-coordinate kernel counts over Z/ell^s.
    kernel=1;valuation=0
    for d in differences:
        kernel*=sum(d*x%mod==0 for x in range(mod))
        if d:
            dd=abs(d);v=0
            while dd%ell==0:dd//=ell;v+=1
            valuation+=v
    quotient=kernel//mod**zero_count
    assert quotient<=ell**valuation
    shears+=1
print("PASS:",shears,"finite Sylvester-kernel/shear-quotient tests")
```

---

## Historical report from PR #1652 (unchanged)

# Lipnowski–Tsimerman: finite-field abelian-variety counts

Partial checkpoint by **Codex — codex-c83e7a**, 21 September 2026. Refs #1332.

This is a source-qualified extraction and routing proposal, not a formalization. It records 113 items: 8 library imports, 26 planned imports and 79 missing items. Ten routes assign 60 missing items and 25 planned source items without duplication. The remaining 19 missing items are explicitly withheld. All 37 definitions/constructions have a consumer-derived API and at least three discriminating acceptance tests in the JSON.

## What was read

The [public preprint](https://arxiv.org/pdf/1511.02212v1), dated 6 November 2015, was read completely: all 38 pages, §§0–5.7.3 and the bibliography. Both [Tsimerman's page](https://www.math.toronto.edu/jacobt/) and [Lipnowski's page](https://sites.google.com/site/michaellipnowski/) point to this version. Crossref identifies the [published article](https://doi.org/10.1215/00127094-2018-0029) as Duke Math. J. 167(18) (2018), 3403–3453, hence 51 pages. **No match between the preprint and the final text has been established.** The canonical publisher full-text and download links returned security-check HTML, not a PDF. The differences below are findings about the public v1 only.

The supplementary primary reading is [Conrad, *Polarizations*](https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf), all ten pages, and [Yun, *Orbital integrals and Dedekind zeta functions*, v2](https://arxiv.org/abs/1303.2420), introduction and §§1.3–1.5 plus §§4.8–4.13, including the complete proofs of Lemma 4.9 and Proposition 4.13. The rest of Yun is not claimed read. Main-paper pages 5, 10, 15, 18, 27, 30 and 36 were also visually checked to rule out extraction artifacts in the problematic formulas.

Source files were freshly downloaded on 2026-09-21. SHA-256 values and exact access timestamps are in `source.files`:

- https://arxiv.org/pdf/1511.02212: `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a`; 38 pages; all 38 pages.
- https://arxiv.org/pdf/1303.2420: `a9f560f9c7ed334ff4895cde2676476cd430e0efa7c14e3d6d508df5326bc347`; 19 pages; selected sections specified above.
- https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf: `7156a718e879f7cc752a460ad61c14dbcfd2978a13149b7024c9809ac487af6b`; 10 pages; all 10 pages.

## The mathematical dependency chain

For fixed prime p, the paper separates the unpolarized count B(p,g) from the principally polarized count A(p,g). Both are unweighted counts of **F_p-isomorphism classes**. Neither is the coarse moduli point count nor the stack mass Σ1/|Aut|. The large difference comes from many inequivalent principal polarizations on a fixed underlying variety.

The unpolarized branch first bounds Frobenius polynomials, hence isogeny classes, then describes each isogeny class by rational orbits on prime-to-p Tate lattices and p-adic Dieudonné lattices. Local centralizer orbits and global adelic class sets give separate factors. The prime-field restriction matters: F and V are Q_p-linear for F_p, whereas nonprime finite fields require semilinear centralizers. Tate-module Frobenius conventions must be compared explicitly with geometric Frobenius on cohomology; purity by itself does not give semisimplicity.

The polarized branch imports duals, the rigidified Poincaré bundle, Mumford's homomorphism, rational Néron–Severi space and Rosati positivity. A fixed principal polarization identifies other principal polarizations with positive integral units modulo Rosati congruence. The model-ring construction then leads to definite hermitian lattices. A mass formula counts all projective classes with automorphism weights; Gram matrices count free classes without weights. The Steinitz/class-group obstruction and the finite automorphism bound are therefore real proof steps.

The statistical branch distinguishes unconditional statements from Conjecture 5.2. The conjecture compares logarithmic polarization counts with model-ring orbit counts only for products of matrix algebras over CM fields. The paper's large elliptic-factor, spacing and enhanced Cohen–Lenstra conclusions require additional checks described below. Definition 5.16's joint limit must exist and be tight before it is a probability measure.

## Source gaps and repairs

**G0 — Final version.** Obtain a legitimate final or author-accepted 2018 version and reconcile all numbered results. A 38-versus-51-page difference can reflect typesetting; it neither proves a mathematical change nor licenses assuming equality. Keep all identifiers stable and record exact changed statements.

**G1 — Polynomial and discriminant constants.** Lemma 2.1 fails literally at g=1,q=2: the five polynomials X²−aX+2 with −2≤a≤2 already exceed 2√2. X²−q also shows why the root-radius condition alone does not force reciprocal coefficients. A checked replacement for reciprocal polynomials is (4g+1)^g q^(g(g+1)/4), obtained from the first g integral power sums, the bound |s_k|≤2gq^(k/2), Newton identities and reciprocity. The resulting isogeny-class logarithmic upper bound retains coefficient 1/4.

The discriminant in (26) is a squared Vandermonde product, giving exponent d(d−1), not binomial(d,2). In (28), powers of 2 raised to multiples of g² cannot be absorbed into o_g(1) when p is fixed. Thus the 17/2 coefficient is not exported. A useful existing substitute is Tau Ceti's h_K≤|D_K|4^[K:Q], which directly gives the coarse exp(O_p(g²)) class-number scale after the corrected discriminant bound; the sharper analytic constants need not be reimplemented for that weaker goal.

**G2 — Local orders and repeated eigenvalues.** Yun Lemma 4.9 counts a fiber with prescribed *flag quotients*, uses full characteristic polynomials in the resultant and counts unordered pairs of blocks once. It does not identify a fiber with fixed intersections in every summand. Yun also makes a residue-field reduction before treating R as a quotient of O[[X]]. For example, an unramified quadratic O_F/Z_ℓ cannot be a quotient of Z_ℓ[[X]], whose unique residue field is F_ℓ. The v1 weak-composition estimate in (13) fails already at δ=0. Dualizing the lattice sandwich, repeated-eigenvalue shear quotients, stabilizer representative choices and multiplicities all remain to close. The statement of Yun for regular semisimple orbital integrals is not a bound for arbitrary repeated blocks without further argument.

**G3 — Polarization normalization.** Conrad Example 2.2 verifies (1,φ_L)*P_A=[2]*L⊗L^(−2), whose NS class is 2[L]. The v1 equality with L is not literal. Its Φ_f=(1/2)f^(−1)φ_L is consistent with D_f(a,1) only after rationalizing NS; Φ_f([L₀])=1/2 and D_f(1,1)=2[L₀]. The principal-polarization orbit map uses f^(−1)λ. Moreover Remark 4.8's unqualified reduced-trace equality fails when End⁰(A)=Q: geometric trace of 1 is 2g and reduced trace is 1. The JSON retains the actual Tate-representation trace and does not copy the incorrect identity.

**G4 — Hermitian masses.** Equation (39)'s displayed factorial product has logarithm (1/2)[K:Q]n²log n+O([K:Q]n²), whereas (51) prints coefficient 1. This is visible in the PDF, and elementary summation checks it. The relative quadratic discriminant also has 4p sin²θ rather than p sin²θ; its O_p(d) logarithmic scale survives. The step (49) from upper bounds for residues to a two-sided bound for their quotient is not justified by those upper bounds alone. Acquire Gan–Yu's actual measure and local-density formula, including its dyadic domain, and the needed analytic estimates before accepting (39), (51), (54)–(56) or the 0.99 threshold. An asymptotic implication also needs an explicit sufficiently-large-g quantifier absorbing uniform O_p(g²) terms.

**G5 — Conditional scope and real Frobenius.** Conjecture 5.2 assumes CM-field endomorphism factors. The real Weil number with field Q(√p) produces the definite quaternionic exception already treated separately in §3.2.2. Corollary 5.13 needs a bound for varieties involving that factor, or an appropriately stated extra hypothesis. Strong approximation also needs its noncompactness hypotheses; at real ramified places reduced norms have positivity restrictions, so the class-set identification must use the correct narrow/norm-image quotient rather than automatically an ordinary class group.

**G6 — Small-prime counterexample.** Over F₂, the smooth curve E: y²+xy=x³+x²+1 has discriminant 1, #E(F₂)=2 and #E(F₄)=8. Both point groups are 2-groups, contradicting the literal v1 Lemma 5.19. Direct enumeration over F₂[t]/(t²+t+1) gives one and seven affine points, respectively. For p≥7 the source argument has a safe repair: the Hasse interval at p contains only the p-power p; trace a=1 then gives #E(F_(p²))=p(p+2), not a p-power. No p=2 conclusion is exported. The final paper may have corrected this; it was not acquired.

**G7 — Statistical normalization and limits.** With 2g cyclic eigenangle gaps, two eigenvalues each repeated h times force at least 2h−2 zero gaps, hence mass at least h/g−1/g, not h/g. State a limiting discrepancy bound in a specified metric. The finite-g matrix laws in Definition 5.16 exist, but the general joint limit and normalization are extra theorems. The odd-prime union bound in Example 5.17 proves a positive liminf, not convergence. Theorem 0.3 retains both “no repeated factors” and “coprime to X²−p”; it does not alone prove that every kind of squarefree isogeny class has negligible probability.

**G8 — Remaining source and extraction closure.** Read the original Tate–Honda and Waterhouse proofs, Jacobowitz's dyadic classification, Gan–Yu, Lang's cone theorem, the analytic residue/regulator estimates, norm-unit/class-group comparison, Serre's finite-group bound and Friedman–Washington. Expand the informal §1 stack/cohomology discussion and its Euler-characteristic suppliers, Remark 2.3's lower bound and the local/global proof interiors into atomic items. The source explicitly says §1 is not used later; an orbifold Euler characteristic must not be used as an ordinary rational Betti-number identity. The general trace-formula owner (upstream PR196, cited by the atlas) needs an exact current stage locator; DWP.7's weight bounds are already a checked planned import. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 has no direct reviewed-audit row at this snapshot, so its absence evidence uses the explicitly cross-referencing A4/A3 reviewed audits plus whole-library searches; this does not pretend that an unaudited packet was reviewed.

## Routes and library evidence

1. **AbelianSchemesAndArithmeticModuli** (source; 15 items). A2 already owns duals, Poincaré bundles, polarizations and Rosati. Add the explicitly normalized NS and orbit dictionary there; use Conrad to repair v1 graph-pullback and rationalization errors.

2. **AbelianSchemesAndArithmeticModuli** (source; 1 items). Tate-module realizations are already an A4 target; finite-field full faithfulness is a separate consumer.

3. **AbelianSchemesAndArithmeticModuli** (source; 6 items). Import the existing field Hom/End carriers and add only the already planned arithmetic, semisimple and Rosati-cone targets.

4. **FiniteFlatGroupsAndIntegralPadicHodgeTheory** (source; 1 items). The existing Dieudonné owner fixes covariance and F,V. A new finite-field application must consume it, not reconstruct it.

5. **GeometryOfNumbersAndQuadraticArithmetic** (source; 13 items). GN.2 explicitly owns integral/hermitian lattices, local invariants, genera and local-global theory. Existing rational Z-lattices and CM fields are reused; O_L-projective lattices and dyadic norm ideals are not already built.

6. **GeometryOfNumbersAndQuadraticArithmetic** (source; 15 items). GN.3 owns arithmetic quotient counts, local densities and mass. Add the checked Yun local inputs and weighted-to-unweighted comparison, while the disputed exact estimates remain outside the route.

7. **AdelicAlgebraicGroups** (source; 1 items). Strong approximation is an existing owner target. Keep the definite quaternion rank-one exception and norm-image obstructions visible.

8. **ArithmeticStatistics** (source; 3 items). ST.0 owns arithmetic families and weighted/unweighted measures; define these counts on actual F_p-isomorphism classes.

9. **ArithmeticStatistics** (source; 9 items). ST.5 explicitly owns random-matrix laws and function-field statistics. Conjectures stay hypotheses, and the enhanced limit is a separate existence task. No disputed 0.99 endpoint is routed here.

10. **AbelianSchemesAndArithmeticModuliPartIIFiniteFields** (part-ii; 21 items). A1–A6 construct relative geometry and realizations but have no Honda–Tate/Waterhouse classification or prime-field lattice-counting layers. This extension consumes them; PEL moduli and statistical models remain with their existing owners.

The sole proposed Part II ends at the explicit finite-field classification and counting suppliers in its brief. It imports the existing abelian-variety carrier and A2–A4/A6, R07.2, GN.2–GN.3 and AA.4. **PELModuli M1–M6 retains ownership of the polarized moduli stack and the rational-object/coarse-point distinction.** ArithmeticStatistics retains the measures and conditional distribution endpoints. No second general mass-formula, Picard, Dieudonné or CM foundation is proposed.

The complete 211-record atlas portfolio was searched and its blob identities checked against the current snapshot. Relevant full owner descriptions, the new-roadmap records, the available packet and the reviewed `data/library-coverage.json` were inspected. The six new roadmap records concern the analytic/Habiro/Witt programme and Lawrence–Venkatesh; none supplies this finite-field classification. Reserved identifiers have no collision. The JacobianChallenge Layer E audit distinguishes built field-level abelian varieties from the absent dual/polarization and general multiplication-isogeny theory; A2/A4/A6, GN.2/GN.3, PEL, AA.4 and ST.0/ST.5 audits make the same boundaries explicit.

The pinned source declarations were opened and their statements read. The eight library items import: AbelianVariety/dim/smooth; IsIsogeny/isIsogeny_iff; WittVector.Isocrystal and its morphisms; NumberField.IsCMField; intrinsic CM conjugation and embedding identities; the real-right-limit analytic class number formula; Tau Ceti's uniform class-number bound; and Matrix.card_GL_field/card_matrix. Witt vectors or a one-dimensional isocrystal classification do not supply Dieudonné classification of abelian varieties; Hodge polarizations do not supply geometric polarizations.

## Validation

`check_paper.py` and `intake.py check-files` were run on the actual named files. Custom checks require those files to exist, check unique IDs and route ownership, validate real stage/parent/area IDs, verify all primary-source hashes and every D/C API/test block, and reject accidental local paths. Mathematical checks independently enumerate the F₂/F₄ elliptic counterexample and finite matrix groups, evaluate Yun's partition counts including colength zero, test the corrected reciprocal-polynomial bound in genus one, the weak-composition failure, the factorial leading coefficient, convex concentration on integer compositions, cyclic zero-gap multiplicities and the p≥7 repair.

These are finite and analytic sanity checks, not Lean proofs. No Lean file is requested by this paper issue and no Lean compilation was performed. The JSON deliberately remains `partial`; passing a schema checker does not certify source closure.

## Item index

Full statements, qualifications, library declarations, existing stage IDs, APIs and tests are in the adjacent JSON. “Withheld” means missing and absent from every proposed route.

| Item | Kind | Status | Locator |
|---|---|---|---|
| `abelian-variety` — Abelian variety over a field | definition | library | §0; §3 setup |
| `unpolarized-count` — Unweighted abelian-variety count | definition | planned | §0 p.1 |
| `ppav-count` — Unweighted principally polarized count | definition | planned | §0 pp.1–2 |
| `polarization-fiber` — Number of polarizations on a fixed variety | definition | missing | §4.4; Conjecture 5.2 |
| `main-unpolarized-source` — Source main unpolarized estimate | theorem | missing / withheld | Theorem 0.1; §3.2.3 (28) |
| `main-repeated-source` — Source squarefree-isogeny probability | theorem | missing / withheld | Theorem 0.3; Proposition 4.17 |
| `main-elliptic-source` — Source conditional large elliptic factor | theorem | missing / withheld | Theorem 0.2; Corollary 5.13 |
| `trace-formula` — Compactly supported trace formula | theorem | missing / withheld | §1 (1)–(2) |
| `weights-source` — Weights used in the point-count heuristic | theorem | planned | §1 p.3 |
| `euler-source` — Orbifold Euler characteristic heuristic | theorem | missing / withheld | §1 pp.4–5 |
| `isogeny` — Isogeny of abelian varieties | definition | library | §3 setup |
| `rational-endomorphism` — Rational endomorphism algebra | definition | planned | §3 pp.6–7 |
| `poincare-decomposition` — Isogeny decomposition and semisimplicity | theorem | planned | §3.2.2; Proposition 4.16 |
| `tate-module` — Prime-to-characteristic Tate module | definition | planned | §3 setup |
| `tate-hom` — Tate full faithfulness over finite fields | theorem | missing | §3 lattice classification; [25] |
| `weil-polynomial` — Frobenius polynomial and reciprocity | definition | missing | §2; §4.3 |
| `isogeny-polynomial` — Frobenius polynomial determines the isogeny class | theorem | missing | Corollary 2.2, Tate input |
| `honda-tate` — Honda–Tate simple isogeny classification | theorem | missing | §0; §3.2.2; Proposition 4.14 |
| `power-sum-count` — A safe reciprocal-polynomial counting bound | theorem | missing | §2 Lemma 2.1, repaired elementary bound |
| `power-sum-source` — Printed polynomial-count constant | theorem | missing / withheld | §2 Lemma 2.1 |
| `isogeny-class-upper` — Asymptotic count of isogeny classes | theorem | missing | Corollary 2.2 with repaired power-sum-count |
| `isocrystal` — Frobenius isocrystal carrier | definition | library | §3 p-adic realization |
| `dieudonne-lattice` — Integral Dieudonné realization | definition | planned | §3 setup |
| `marked-lattice-space` — Prime-to-p and p lattice spaces | definition | missing | §3 equations (5)–(6) |
| `marked-quasi-isogeny` — Marked quasi-isogenies classified by lattices | theorem | missing | §3 (5)–(6) |
| `forget-marking` — Isomorphism classes as rational orbits | theorem | missing | §3 (7) |
| `prime-p-centralizer` — The prime-field p-component reduction | theorem | missing | Remark 3.2 |
| `local-order` — Local monogenic order | definition | missing | §3.1.2 |
| `saturation-normalization` — Normalized lattice sandwiches | theorem | missing | §3.1.2 |
| `flag-fiber` — Stable lattice with prescribed flag quotients | definition | missing | §3.1.3; Yun §4.8–4.9 |
| `extension-shear` — Centralizer shears identify equivalent extensions | theorem | missing | Lemma 3.1 and proof |
| `yun-resultant-fiber` — Resultant cardinality of a disjoint-spectrum fiber | theorem | missing | Yun Lemma 4.9 pp.14–15; LT §3.1.1 |
| `extension-determinant-bound` — Bound after removing zero eigenspaces | theorem | missing | §3.1.4 pp.8–10 |
| `punctual-hilbert-count` — Finite-colength ideal count | definition | missing | Yun §4.12–4.13 |
| `yun-partition-formula` — Yun finite-colength partition formula | theorem | missing | Yun Proposition 4.13 pp.16–17 |
| `hilbert-crude-bound` — Crude partition upper bound | theorem | missing | LT §3.1.5; Yun Proposition 4.13 |
| `local-orbit-source` — Unclosed local orbit estimate | theorem | missing / withheld | §§3.1.5–3.1.6 |
| `stabilizer-depth-source` — Unclosed integral stabilizer-index bound | theorem | missing / withheld | §3.2.1 (16)–(20) |
| `adelic-class-set` — Adelic class set of the endomorphism group | definition | missing | §3.2 (15) |
| `strong-approximation` — Strong approximation supplier | theorem | planned | §3.2.2 before (21) |
| `nonabelian-class-comparison` — Class-set comparison by reduced norms | theorem | missing | §3.2.2 (21) |
| `class-formula` — Analytic class number formula | theorem | library | §3.2.2 (22) |
| `coarse-class-bound` — Available uniform class-number bound | theorem | library | Coarser available replacement for §3.2.2 |
| `weil-discriminant-bound` — Correct elementary discriminant estimate | theorem | missing | §3.2.2 (26), corrected exponent |
| `regulator-source` — Skoruppa input awaiting original proof | theorem | missing / withheld | §3.2.2 (23), [24] |
| `residue-source` — Louboutin input awaiting original proof | theorem | missing / withheld | §3.2.2 (24), [18] |
| `dual-poincare` — Dual variety and rigidified Poincaré bundle | definition | planned | §4.1; Conrad §1 |
| `polarization` — Polarization as a positive symmetric morphism | definition | planned | Definition 4.1; Conrad Definitions 2.1,3.2 |
| `mumford-map` — Mumford homomorphism of a line bundle | construction | planned | §4.1; Conrad Example 2.2 |
| `graph-pullback` — Correct graph-pullback normalization | theorem | missing | Conrad Example 2.2 pp.6–7, correcting LT §4.1 |
| `phi-kernel` — Kernel of the Mumford map | theorem | missing | §4.1 (1)–(2); Conrad Lemma 2.3 and p.8 |
| `phi-ample-isogeny` — Ample line bundles induce isogenies | theorem | planned | §4.1 (3); Conrad Remark 2.4 |
| `finite-field-polarization-descent` — Line-bundle realization over a finite field | theorem | missing | Remark 4.2; Conrad Theorem 2.6 |
| `polarized-isomorphism` — Isomorphism of symmetric morphisms | definition | planned | Definition 4.3 |
| `phi-pullback` — Pullback covariance | theorem | planned | Remark 4.4 (29) |
| `rosati` — Rosati involution | definition | planned | Definition 4.5; Conrad §3 |
| `ns-rational` — Rational Néron–Severi space | definition | missing | §4.2 with rationalization made explicit |
| `ns-rosati-map` — Normalized Néron–Severi/Rosati map | construction | missing | §4.2, Lemma 4.6 with rational domain corrected |
| `endomorphism-trace` — Geometric endomorphism trace | definition | planned | Definition 4.7; Conrad Definition 3.3 |
| `degree-polynomial` — Degree characteristic polynomial | theorem | planned | §4.3, Mumford §19 Theorem 4 |
| `rosati-positivity` — Positive Rosati trace pairing | theorem | planned | §4.3; Conrad Theorem 3.4 pp.9–10 |
| `positive-ample` — Ample classes and positive symmetric elements | theorem | missing | Proposition 4.9 |
| `real-cone` — Real ample-cone matrix description | theorem | missing | Proposition 4.10 |
| `polarization-orbits` — Polarizations as Rosati-conjugacy orbits | theorem | missing | Proposition 4.11 |
| `integer-matrix-example` — No-CM elliptic-power orbit example | theorem | missing | Example 4.12 |
| `cm-field` — CM field and maximal real subfield | definition | library | §4.4.1; Definition 5.1 |
| `cm-conjugation` — Intrinsic CM conjugation | definition | library | Definition 5.1 |
| `cm-unit-orbits` — Polarizations for a maximal CM endomorphism order | theorem | missing | Example 4.13 |
| `prime-field-end-algebra` — Commutative endomorphisms in the nonreal prime-field case | theorem | missing | Proposition 4.14(1) |
| `waterhouse-orders` — Realization of nonreal prime-field orders | theorem | missing | Proposition 4.14(2), Waterhouse Theorem 6.1 |
| `squarefree-pol-count` — Squarefree nonreal polarization bound | theorem | missing | Proposition 4.16 |
| `model-ring` — Model ring with positive involution | definition | missing | Definition 5.1 |
| `model-orbit-count` — Positive-unit model orbit count | definition | missing | Definition 5.1; Conjecture 5.2 |
| `model-comparison-conjecture` — Conjectural comparison with the model ring | theorem | missing | Conjecture 5.2 |
| `unit-norm-label` — Totally positive unit norm labels | definition | missing | §5.2 |
| `unitary-group` — Unitary group of a definite hermitian space | definition | missing | §5.2 |
| `hermitian-lattice` — Integral projective hermitian lattice | definition | planned | Definition 5.3 |
| `hermitian-dual` — Dual and unimodularity | definition | planned | Definition 5.3 |
| `gram-orbit-bijection` — Free unimodular lattices and Gram congruence | theorem | missing | Proposition 5.4 |
| `norm-ideal` — Norm ideal of a local hermitian lattice | definition | missing | Definition 5.5 |
| `local-hermitian-classification` — Local unimodular classification input | theorem | planned | Proposition 5.6 and following paragraph |
| `hermitian-genus` — Genus of a hermitian lattice | definition | planned | §5.3 (37) |
| `genus-double-cosets` — Hermitian genus as a unitary class set | theorem | missing | §5.3 (37) |
| `hermitian-mass` — Weighted hermitian genus mass | definition | planned | §5.4 (38) |
| `tamagawa-mass` — Unitary Tamagawa mass formula | theorem | planned | §5.4 (38) |
| `density-source` — Unverified simplified local-density formula | theorem | missing / withheld | §5.4 (39) |
| `relative-discriminant` — Elementary CM relative-discriminant bound | theorem | missing | §5.4.1 (41), corrected factor |
| `factorial-asymptotic` — Factorial product asymptotic | theorem | missing | §5.4.3, elementary audit of (39) to (51) |
| `mass-asymptotic-source` — Source leading mass asymptotic | theorem | missing / withheld | §§5.4.3–5.5 |
| `gl-card` — Finite general linear group cardinality | theorem | library | Lemma 5.8; Example 5.17 |
| `finite-integral-group` — Minkowski finite integral group bound | theorem | missing | Lemma 5.8 and full proof |
| `mass-cardinality-comparison` — Passing from mass to class count | theorem | missing | §5.4.4 (52)–(53) |
| `free-projective-comparison` — Free versus projective mass classes | theorem | missing | Remark 5.7; (54) |
| `model-count-source` — Source model-ring logarithmic bound | theorem | missing / withheld | §5.4.5 (55) |
| `convex-concentration` — Convex mass-concentration inequality | theorem | missing | Lemma 5.9 |
| `model-concentration-source` — Source model concentration threshold | theorem | missing / withheld | Proposition 5.10 |
| `split-prime-density` — Density of primes splitting in a class-number-one CM field | theorem | missing | Lemma 5.11 proof |
| `cm-elliptic-existence` — Elliptic curve with class-number-one endomorphisms | theorem | missing | Lemma 5.11 proof |
| `elliptic-power-source` — Source elliptic-power asymptotic | theorem | missing / withheld | Lemma 5.11 (56) |
| `spacing-measure` — Normalized eigenangle spacing measure | definition | missing | §5.6, expanded convention |
| `spacing-source` — Source random-matrix discrepancy conclusion | theorem | missing / withheld | Corollary 5.14 |
| `cl-measure` — Cohen–Lenstra probability measure | definition | planned | §5.7.1 |
| `friedman-washington` — Random integral matrices and Cohen–Lenstra | theorem | planned | §5.7.1 [9] |
| `enhanced-cl` — Proposed enhanced Cohen–Lenstra law | definition | missing | Definition 5.16 |
| `cl-two-prime` — Two-extension zero-cokernel probability at two | theorem | missing | Example 5.17, first case |
| `cl-odd-prime` — Uniform positive bound at odd primes | theorem | missing | Example 5.17, second case |
| `enhanced-cl-conjecture` — Source enhanced-statistics conjecture | theorem | missing | Conjecture 5.18 |
| `elliptic-pgroups-source` — False small-prime lemma in the public preprint | theorem | missing / withheld | Lemma 5.19 |
| `elliptic-pgroups-large` — Large-prime repair of the elliptic lemma | theorem | missing | Lemma 5.19, explicitly restricted elementary repair |
| `point-count-isogeny` — Point counts are isogeny invariant | theorem | missing | Corollary 5.20 proof |
| `enhanced-failure-source` — Source failure of enhanced Cohen–Lenstra | theorem | missing / withheld | Corollary 5.20 |
| `reduced-trace-source` — Unqualified reduced-trace identification in v1 | theorem | missing / withheld | Remark 4.8 |
| `ramification-count` — Ramified-prime count from the relative discriminant | theorem | missing | §5.4.2 (44), sharper elementary bound |
