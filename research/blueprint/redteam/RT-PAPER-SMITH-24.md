# RT-PAPER-SMITH-24: red team of the extraction of Smith, *Algebraic integers with conjugates in a prescribed distribution*

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4052).

**Target.** `PAPER-SMITH-24` extracts Alexander Smith, *Algebraic integers with conjugates in a prescribed distribution*, [Annals of Mathematics 200 (2024), no. 1](https://doi.org/10.4007/annals.2024.200.1.2), arXiv:2111.12660. The extraction has:

- 56 items: 3 library, 5 planned, 48 missing;
- 4 routes: a new roadmap `LogarithmicPotentialTheoryAndAlgebraicIntegers` (38 items) and three source routes, to GN.1 (2 items), CA.3/CA.6 (4 items) and FaltingsFinitenessAndIsogenyTheorems R28.4 (4 items);
- 0 source issues.

**Who did what.**

- Claude Code `cc-7b31c4` wrote the extraction (issue #1081, commit bcada41d, 22 September 2026). It replaced a 155-item partial checkpoint by Codex `codex-c83e7a`/`codex-a71f92`, continued by Claude Code `cc-fb70e5`.
- Claude Code `cc-d67081` wrote the review `REV-PAPER-SMITH-24` (issue #1082, commit a8ac123c). It accepted all four routes with no change.
- The separate errata record, `ERRATA-PAPER-SMITH-24`, is by `cc-fb70e5`, and its review by `cc-442dc5`.
- I did none of these. The string `cc-f805bf` occurs in none of the target files.

**Disclosure.** This session wrote **FIX-RT-AUDIT-07**, the library-audit fixes for ArithmeticStatistics and DiophantineApproximationAndTranscendence:

- It changed the ST.0 verdict and its Northcott entry.
- It changed DT.0's Weil-height entry and the `Polynomial.finite_mahlerMeasure_le` citation.

Finding 3 says that items 6 and 51 wrongly cite ArithmeticStatistics:ST.0 as a planner. That finding rests on ST.0's stage text and its packet, not on the audit entries I edited. No finding touches DT.0, heights or Mahler measure.

**Result: 7 findings: 3 high, 2 medium, 2 low.** The machine-readable file is [RT-PAPER-SMITH-24.result.json](RT-PAPER-SMITH-24.result.json).

- **Where the work is sound.**
  - The statements of Theorems 1.1, 1.5 and 5.11 and of Corollary 1.3 match the paper, with all their hypotheses.
  - Example 5.16's numbers reproduce.
  - The eight library citations resolve at the pins and are apt.
  - The new-roadmap route is justified: neither library and no atlas stage has logarithmic potential theory.
  - Routes 2 and 3 go to blueprints that are still pending.
- **Where it breaks.**
  - *Mistakes.* It says the paper has no mistakes, although seven are confirmed on record, and three items copy the uncorrected text.
  - *Omissions.* Many cited results the proofs rest on have no item, the weighted potential theory behind Lemma 2.7 among them.
  - *Ownership.* The Honda–Tate route is never applied and duplicates an owner.
  - *Statuses.* Resultants and weak* compactness are already in Mathlib.
  - *Scope.* The new roadmap's brief is narrower than the potential theory other roadmaps import from it.

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v2 (16 March 2024), the latest version | [arxiv.org/pdf/2111.12660v2](https://arxiv.org/pdf/2111.12660v2) | `99b3855a…35a9` (matches the recorded hash) |

- **Fetched:** 30 September 2026.
- **Reading.**
  - I read the whole text myself: pp.1–47 and the references.
  - Pages 16, 24 and 27 were checked on rendered images.
  - The published Annals text is paywalled and was not collated. Every locator is to arXiv v2.
- **Errata.** None is published:
  - arXiv has v1 and v2 only, with no journal reference;
  - Crossref records no update for the DOI, and a Crossref query for an erratum finds none.
- **Candidate mistakes I rejected.**
  - Lemma 2.7 needs lim‖w^n P_n‖^{1/n} = 1 but the proof of Theorem 1.5 bounds only the limsup. The liminf ≥ 1 is automatic: for this weight F_w = 0, and ‖w^n P‖ ≥ e^{−nF_w} for monic P.
  - In Corollary 3.7, min‖w^nQ_i‖ ≤ n^C exp(nI/2) follows only when I(µ) ≥ 0. But I(µ) > 0 is the case being ruled out, so the proof stands (as REV-ERRATA noted).
  - Lemma 3.8 drops the factor exp((n − m/2)I(µ)). It is absorbed into n^{−Cn} because |I(µ)| is fixed.
  - In the proof of Proposition 4.1, 'for all x ∈ Σ' in the mean-value bound is only used on [α − n^{−C₀}, α + n^{−C₀}] ⊆ Σ, where it holds.

## High

### 1. sourceIssues is empty although E1–E7 are confirmed, and three items copy uncorrected text

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-SMITH-24.result.json: sourceIssues (empty), summary, items PAPER-SMITH-24/1, /23, /37; research/blueprint/papers/PAPER-SMITH-24.md, sections 'Checks run on the paper's claims' and 'Mistakes found in the source'; PAPER-SMITH-24.review.json notes

**What is wrong.**

The extraction records sourceIssues: [] and states 'No mistakes were found' ('Mistakes found in the source: None'), but seven mistakes in this paper are already on record and confirmed. research/blueprint/errata/PAPER-SMITH-24.json (ERRATA-PAPER-SMITH-24, written 22 September 2026 10:45, before the final extraction commit bcada41d at 15:53 the same day) records E1–E5, and REV-ERRATA-PAPER-SMITH-24 (23 September 13:18, before REV-PAPER-SMITH-24 at 17:10) confirmed all five and added E6–E7. All seven are in research/errata/REGISTER.md. PROTOCOL.md §18 says an extraction lists every mistake found under sourceIssues and that 'Items and nodes use the corrected statements'. Three items instead copy the uncorrected text. Item 1 defines λ_SSS as 'the least real number such that for every ε > 0 there are only finitely many totally positive algebraic integers α with tr(α) < (λ_SSS − ε)deg(α)' (E1). The property passes to every smaller number, so no least such number exists, and the definition routed to CA.6 is ill-posed. Item 23 takes λ_i to be 'the least real with λ_iK containing i + 1 linearly independent integer polynomials' (E3). K is symmetric, so every sufficiently negative λ qualifies and no least one exists. Item 37 asserts U^{µ*ν_ε} − U^µ ≤ log((ε²+2ε^{3/2}+ε)/(ε−ε²)) 'uniformly in z, ε and µ' 'for a Borel measure µ' (E4). This is false for mass > 1: for µ = Mδ₀ and z ∈ [ε², ε], (5.1) gives U^{µ*ν_ε}(z) − U^µ(z) = M·(U^{ν_ε}(z) + log|z|) = M·log(...) > log(...) when M > 1. The review accepted with 'The extraction records no sourceIssues … I did not read all 47 pages hunting for mistakes', and did not consult the errata record written for the same paper.

**Evidence.**

Paper (arXiv 2111.12660v2, SHA-256 99b3855a…35a9, fetched 30 September 2026). p.1: 'Take λSSS to be the least real number such that, for any ǫ > 0, there are only finitely many totally positive algebraic integers α satisfying tr(α) < (λSSS − ǫ) deg(α).' p.14, Proposition 3.4: 'take λi to be the least real number so λi K contains at least i + 1 linearly independent integer polynomials'. p.33, Notation 5.3: 'Given any other Borel measure µ … we can conclude that (5.5) U^{µ∗νǫ}(z) − U^µ(z) ≤ log((ǫ²+2ǫ^{3/2}+ǫ)/(ǫ−ǫ²)) ≤ Cǫ^{1/2}, where C > 0 does not depend on z, ǫ, or µ.' research/blueprint/errata/PAPER-SMITH-24.json: E1–E7, each with review.verdict 'confirmed' (by REV-ERRATA-PAPER-SMITH-24). git: fef665df (errata, 2026-09-22 10:45), bcada41d (extraction, 2026-09-22 15:53), cd75813b (errata review, 2026-09-23 13:18), a8ac123c (extraction review, 2026-09-23 17:10). PAPER-SMITH-24.md: '**No mistakes were found**, so `sourceIssues` is empty.' PROTOCOL.md §18: 'A paper extraction … list[s] every mistake found in their sources under `sourceIssues` … Items and nodes use the corrected statements.'

**Fix.**

In PAPER-SMITH-24.result.json, set sourceIssues to E1–E7 of research/blueprint/errata/PAPER-SMITH-24.json with their review objects, together with the new slips of RT-PAPER-SMITH-24/7 once they are verified. Correct E2's locator while copying: its '(2.14)' and the P_{n,µ} identity are in the proof of Proposition 2.12 on p.11, not of Proposition 2.5. Add sourceVersions (arXiv v2, its URL, SHA-256 and read date; the Annals text not collated). Correct the three items. Item 1: 'λ_SSS is the supremum (greatest) of the real λ such that for every ε > 0 only finitely many totally positive α have tr(α) < (λ − ε)deg(α); equivalently the least limit point of tr(α)/deg(α)'. Item 23: 'the least nonnegative real λ_i'. Item 37: 'U^{µ*ν_ε}(z) − U^µ(z) ≤ µ(Σ)·log((ε²+2ε^{3/2}+ε)/(ε−ε²)) ≤ µ(Σ)Cε^{1/2}', noting that every use has µ(Σ) ≤ 1. Rewrite the report's 'Checks run' and 'Mistakes found in the source' sections and the summary sentence 'No mistakes were found in the source'. Point to the errata record, and add a sentence to the review note.

### 2. Many results the proofs invoke have no item

- **Kind:** missing.
- **Where:** research/blueprint/papers/PAPER-SMITH-24.result.json: items (no item), prerequisites, route 1 brief (LogarithmicPotentialTheoryAndAlgebraicIntegers), route 2 (GN.1), route 3 (CA.3); PAPER-SMITH-24.md opening paragraph

**What is wrong.**

The report says that 'the results quoted from Saff–Totik, Ransford, Fekete–Szegő, Robinson, Smyth, Serre, Honda and Tate, and Banaszczyk–Litvak–Pajor–Szarek are recorded as items'. Many theorems the proofs invoke have no item, and the route 1 brief does not name most of them.
(a) Lemma 2.7, the last step of Theorem 1.5, rests on weighted potential theory. It needs admissible weights, the weighted extremal measure, and the modified Robin constant [24, Def. I.1.1, Thm I.1.3]. It needs the identification that for w = exp(U^µ) the extremal measure is µ and F_w = 0 [24, Thm I.3.1], asymptotically extremal monic polynomials with roots in Σ [24, Thm III.1.9], and the zero-distribution theorem [24, Thm III.4.2]. Item 14 records only the statement of Lemma 2.7, and the brief names no weighted theory.
(b) The principle of domination [24, Thm II.3.2] is used in the proof of Proposition 2.5, in Lemma 5.10 and in Proposition 5.17.
(c) Frostman's theorem: U^{µ_Σ} ≤ −log κ everywhere, with equality off a capacity-zero subset of Σ [24, (I.1.4), (I.1.9)]. It is used in (5.2), (5.8), Lemma 5.10 and Theorem 5.11. The brief names 'the Frostman inequality', but no item does.
(d) The lower semicontinuity of the energy under weak* convergence [24, Thm I.6.8] is used in Proposition 5.7.
(e) Polar sets: a countable set has capacity zero, and a measure of finite energy does not charge it. This is used in the proof of Proposition 2.5, together with the passage to a compact finite union of intervals of capacity > 1 inside Σ.
(f) The balayage of δ₀ onto [a,b] [24, (II.4.47)] is used in Lemma 5.2(1).
(g) The Remez-type inequality of Erdélyi [9, Theorem 1] is behind Lemma 2.8 and Corollary 3.3, and Lemma 2.8 is used throughout §§3–4.
(h) The flatness theorem for simplices (and polytopes) [5, Corollary 2.5] is the engine of Theorem 3.2. Item 21 is only its application, and item 52 is Minkowski.
(i) The multivariate Gregory–Newton formula [25] is used in Lemma 2.10: a nonzero polynomial of total degree ≤ d does not vanish at some nonnegative integer point with coordinate sum ≤ d.
(j) Library inputs are not inventoried: the hyperplane separation theorem (Theorem 5.11, Proposition 5.17), Tietze extension (Lemma 5.4) and the determinantal discriminant (Lemma 2.10).
Prerequisites omit Erdélyi [9] and Salzer [25]. The previous partial version of this file (commit d26bcb34, 155 items) had items for most of these: energy lower semicontinuity, Frostman inequalities, domination of potentials, 'Finite energy annihilates polar sets', 'Countable sets are polar', weighted external field, weighted monic lower bound, weighted zero distribution, Remez inequality, integer grid nonvanishing, and the Banaszczyk transference and polytope ℓ bounds. The rewrite in bcada41d dropped them without saying so.

**Evidence.**

Paper p.7–8, proof of Lemma 2.7: 'in the language of [24, Definition I.1.1], the function wµ is an admissible weight. From [24, Theorem III.1.9], there is an infinite sequence of real monic polynomials … By [24, Theorem I.3.1], the extremal measure associated to the weight wµ is µ, and the modified Robin constant is 0 … The result then follows from [24, Theorem III.4.2].' p.8: 'The following consequence of the Remez inequality … Applying the Remez-type inequality [9, Theorem 1]'. p.9: 'An application of the multivariate Gregory–Newton formula [25, (2) and (3)]'. p.13: 'We can conclude from the flatness theorem for simplices [5, Corollary 2.5]'. p.32: 'By [24, (II.4.47)], ν is the balayage'; '(5.2) … by [24, (I.1.4) and (I.1.9)]'. p.36: 'Following [24, Theorem I.6.8], the monotone convergence theorem shows I(µ) ≤ 0'; 'A countable collection of points has zero capacity'; 'From the principle of domination [24, Theorem II.3.2]'. p.38: 'By the principle of domination [24, Theorem II.3.2], this inequality holds for all z ∈ C.' p.39: 'By the hyperplane separation theorem [16, Theorem 4e]'. p.33–34: 'the Tietze extension theorem [37, Theorem 15.8]'. Pinned Mathlib 082e2d3: geometric_hahn_banach_open (Mathlib/Analysis/LocallyConvex/Separation.lean:95, a disjoint open convex s and convex t are separated by a continuous linear functional); ContinuousMap.exists_extension (Mathlib/Topology/TietzeExtension.lean:77); Polynomial.discr (Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:930, defined through the determinant of sylvesterDeriv). None of these names occurs in PAPER-SMITH-24.result.json, and neither Erdélyi nor Salzer is among its 14 prerequisites. git show d26bcb34:research/blueprint/papers/PAPER-SMITH-24.result.json lists the dropped items.

**Fix.**

Add missing items with exact statements and locators. The potential-theory items go to route 1 and are listed in its brief: (a) the weighted-potential package, as definition and theorem items for S–T I.1.1, I.1.3, I.3.1, III.1.9 and III.4.2, on which item 14 depends; (b) domination; (c) Frostman; (d) lower semicontinuity of I; (e) polar sets and capacity of increasing Borel unions; (f) balayage onto an interval. Route 1 also takes (g) the Remez-type inequality (Erdélyi 1992, Theorem 1), unless a real-analysis owner is found. The flatness theorem for simplices and polytopes (BLPS Corollary 2.5) goes to route 2 at GN.1, beside item 21. The Gregory–Newton nonvanishing lemma goes to route 3 at CA.3, beside item 17. Add three library items: hyperplane separation (mathlib:geometric_hahn_banach_open), Tietze (mathlib:ContinuousMap.exists_extension) and the Sylvester discriminant (mathlib:Polynomial.discr). Add Erdélyi, 'Remez-type inequalities on the size of generalized polynomials', J. London Math. Soc. (2) 45 (1992) 255–264, and Salzer, 'Note on interpolation for a function of several variables', Bull. AMS 51 (1945) 279–280, to prerequisites. Correct the report's claim that every quoted result is an item. Replace research/blueprint/handoff/PAPER-SMITH-24.md, which still describes the discarded 155-item checkpoint, with a note that the extraction is complete.

### 4. Route 4 is never applied, has the wrong direction, and duplicates the owner of Honda–Tate

- **Kind:** duplicate.
- **Where:** research/blueprint/papers/PAPER-SMITH-24.result.json: route 4 (source, FaltingsFinitenessAndIsogenyTheorems:R28.4; items PAPER-SMITH-24/5, /43, /44, /53); route 1 brief ('Honda–Tate theory … from FaltingsFinitenessAndIsogenyTheorems R28.4')

**What is wrong.**

Route 4 fails in three ways. (a) It is never applied. A source route only adds the paper to the named roadmap's blueprint job, and BP-FaltingsFinitenessAndIsogenyTheorems finished on 24 September 2026. Its packet has no Honda–Tate node, so items 5, 43, 44 and 53 are planned nowhere. That includes Corollary 1.3, a headline result. This is the defect of RT-PAPER-ANDRE-18-B/1, which was confirmed. (b) R28.4 has the wrong direction. It is Faltings's semisimplicity and isogeny theorem over a number field, not finite-field theory, and the roadmap tells workers to 'Fix the number field'. (c) Honda–Tate now has an owner. The accepted extraction PAPER-LIPNOWSKI-TSIMERMAN-18 routes 'Honda–Tate simple isogeny classification' and 'Tate full faithfulness over finite fields' (items honda-tate, tate-hom, route 10, accepted) to the Part II AbelianSchemesAndArithmeticModuliPartIIFiniteFields, whose design job is pending (issue #3351). Route 4 plans the same theorem a second time, in another roadmap.

**Evidence.**

research/blueprint/queue.json: 'BP-FaltingsFinitenessAndIsogenyTheorems' state 'done', finishedAt '2026-09-24T14:46:06Z', scope R28.1–R28.6. research/blueprint/make_queue.py lines 912–914: a source route only appends to ADDED_SOURCES; lines 561–566: added_sources(rid) is read when a blueprint job's text is generated. research/blueprint/packets/FaltingsFinitenessAndIsogenyTheorems.json and data/decompositions/FaltingsFinitenessAndIsogenyTheorems.json: 0 occurrences of 'Honda' or 'Smith'. content/campaign/FaltingsFinitenessAndIsogenyTheorems/README.md line 19: 'Fix the number field and dimension in finiteness statements'. research/blueprint/papers/PAPER-LIPNOWSKI-TSIMERMAN-18.result.json: item honda-tate 'Simple F_q-isogeny classes correspond to conjugacy classes of q-Weil algebraic integers π …', route 10 part-ii 'Abelian Schemes And Arithmetic Moduli, Part II: finite-field isogeny classes', which also carries tate-hom. Its review.json accepts all 13 routes (commit b8376663, 24 September 2026). research/blueprint/redteam/RT-PAPER-ANDRE-18-B.review.json: '/1 confirmed … high is right'. Paper p.40: 'Proof. This follows from Honda–Tate theory [14]; see [15, Proposition 2.1].'

**Fix.**

Replace route 4. Item 53 becomes planned at AbelianSchemesAndArithmeticModuliPartIIFiniteFields, citing PAPER-LIPNOWSKI-TSIMERMAN-18/honda-tate and /tate-hom. Items 5, 43 and 44 are the paper's applications, and they need λ(Σ, F) from route 1, so move them to route 1. Add Kadets's reduction ([15, Proposition 2.1]: #A(F_q)^{1/dim A} = exp ∫log|q + 1 − x| dµ_P, with P the minimal polynomial of π + q/π) to item 43's statement or as its own item. Route 1's brief then imports Honda–Tate and Tate's theorem from AbelianSchemesAndArithmeticModuliPartIIFiniteFields, and the Weil bound from DeligneWeightsAndPurity DWP.1 and WeightsInEtaleCohomology R34.2, instead of from R28.4. If a separate source route into the pending DESIGN-AbelianSchemesAndArithmeticModuliPartII is preferred, it may carry items 5, 43 and 44 instead, provided that Part II imports λ(Σ, F) from route 1.

## Medium

### 3. Items 48, 51, 6, 52 and 56 have the wrong status

- **Kind:** library-claim.
- **Where:** research/blueprint/papers/PAPER-SMITH-24.result.json: items PAPER-SMITH-24/48 (planned: CA.3, NumberFieldArithmetic layer 3, PolynomialGaloisGroups layer 3), /51 (planned: OptimalTransport layer 1, ArithmeticStatistics:ST.0), /6 (planned: ST.0, OptimalTransport layer 1), /52 (planned: GN.0, GN.1), /56 (missing); route 1 brief imports

**What is wrong.**

Several statuses are wrong at the pinned commits. (1) Item 48 is marked planned, but its content is in Mathlib: algebraic integers, minimal polynomials, the resultant res(P,Q) = ∏Q(α_i) and its nonvanishing for coprime polynomials. The reviewed library audit marks CA.3's 'Resultants' and 'Discriminants' targets as present in both libraries. (2) Item 51 is marked planned, but the weak* compactness of the probability measures on a compact space is a Mathlib instance (Prokhorov.lean). OptimalTransport layer 1 consumes Prokhorov and does not plan it. ArithmeticStatistics:ST.0 plans nothing about measures on ℝ or weak* topologies: its stage text is about arithmetic families, height orderings and weighted counts, and none of the 37 nodes of its packet concerns a topology on measures. (3) Item 6's weak* topology on probability measures is Mathlib's ProbabilityMeasure topology with its integral characterisation. Only the counting measure µ_P is new, and it has no owner in item 6's planned list. (4) Item 52 bundles Blichfeldt with Minkowski's first and second theorems as 'planned'. The paper uses only the second, which GN.1's packet plans (nodes minkowski-second-lower, minkowski-second-upper). The first theorem and Blichfeldt are in Mathlib, and the reviewed audit of GN.1 says so. (5) Item 56's single-interval case, the arcsine law, is in the libraries up to an affine change of variable: Mathlib's Polynomial.Chebyshev.measureT (density (1 − x²)^{−1/2} on (−1, 1]) and Tau Ceti's TauCeti.chebyshevMeasureT_univ (total mass π). The extraction cites neither. Disclosure: this red team's session wrote FIX-RT-AUDIT-07, which changed the library audit of ArithmeticStatistics:ST.0 (Northcott, and the ST.0 verdict). Part (2) rests on ST.0's stage text and packet, not on that audit entry.

**Evidence.**

Pinned Mathlib 082e2d3: Polynomial.resultant (Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:134, 'the determinant of the Sylvester matrix of f and g'); Polynomial.resultant_eq_prod_eval (same file :478, 'If f splits with leading coeff a and degree n, then Res(f, g) = aⁿ * ∏ g(α)'); Polynomial.resultant_eq_zero_iff (:908, over a field 'resultant f g = 0 ↔ (f ≠ 0 ∨ g ≠ 0) ∧ ¬ IsCoprime f g'); minpoly (Mathlib/FieldTheory/Minpoly/Basic.lean:41); IsIntegral (Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean:53). Mathlib/MeasureTheory/Measure/Prokhorov.lean:175–176 '/-- In a compact space, the space of probability measures is also compact. -/ instance [CompactSpace E] : CompactSpace (ProbabilityMeasure E)', and :183 isCompact_setOfPred_finiteMeasure_le_of_isCompact (finite measures of mass ≤ C carried by a compact K form a compact set). MeasureTheory.ProbabilityMeasure (Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:103) and ProbabilityMeasure.tendsto_iff_forall_integral_tendsto (:364). MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure (Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:65, 'The Minkowski Convex Body Theorem'). Polynomial.Chebyshev.measureT (Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Orthogonality.lean:49). Tau Ceti f790474: TauCeti.chebyshevMeasureT_univ (TauCeti/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Measure.lean:46). data/library-coverage.json, ClassicalArithmeticCompletion:CA.3: target 'Resultants', library 'both', 'Sylvester-matrix resultant with the root-product formula for split polynomials, vanishing over a field iff not coprime'. GN.1: 'Minkowski's first (convex body) theorem' library 'mathlib'; 'Minkowski's second theorem' 'absent'. research/blueprint/atlas/roadmaps/ArithmeticStatistics.json ST.0: 'Define arithmetic families, equivalence relations, height/discriminant orderings, local conditions and weighted versus unweighted counts.' The OptimalTransport layer 1 text: 'Prove relative compactness by Prokhorov', which consumes the Mathlib theorem.

**Fix.**

Item 48: status library, citing mathlib:Polynomial.resultant, mathlib:Polynomial.resultant_eq_prod_eval, mathlib:Polynomial.resultant_eq_zero_iff, mathlib:minpoly and mathlib:IsIntegral, and drop the planned list. Item 51: status library, citing the CompactSpace (ProbabilityMeasure E) instance of Mathlib/MeasureTheory/Measure/Prokhorov.lean and mathlib:isCompact_setOfPred_finiteMeasure_le_of_isCompact, and drop ST.0. Item 6: split it. The weak* topology becomes library (mathlib:MeasureTheory.ProbabilityMeasure, mathlib:MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto). The counting measure µ_P becomes a missing item in route 1. Drop ST.0. Item 52: restrict it to Minkowski's second theorem, planned at GN.1, and cite the first theorem as mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure. Item 56: cite mathlib:Polynomial.Chebyshev.measureT and tauceti:TauCeti.chebyshevMeasureT_univ for the single interval, keeping the finite-union density missing. In route 1's brief, import these from the libraries instead of from ArithmeticStatistics ST.0.

### 5. Route 1's brief confines the atlas's potential theory to the real line

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-SMITH-24.result.json: route 1 brief ('Plan logarithmic potential theory on compact subsets of the real line …') and items PAPER-SMITH-24/8, /36

**What is wrong.**

Route 1 makes LogarithmicPotentialTheoryAndAlgebraicIntegers the atlas's owner of logarithmic potential theory. Its brief, though, restricts the theory to compact subsets of ℝ, which is narrower than both the paper and the other consumers. The paper defines U^µ, I(µ), κ_Σ and the equilibrium measure for compact Σ ⊂ ℂ (Definition 2.1). It uses potentials as functions on ℂ ((5.1), (5.8), (5.12) 'for all z ∈ C', and (5.17), a hypothesis 'for all z ∈ ℂ'). An accepted route of another extraction, PAPER-CALEGARI-DIMITROV-TANG-25 (route 2, ArithmeticAlgebraizationAndHolonomyBounds), states that its potential-theoretic form (2.5.28) 'imports capacity and equilibrium measures of compact sets from the owner of logarithmic potential theory', for compact K ⊂ D̄(0,1) ⊂ ℂ. PROTOCOL.md §15 asks that a missing general notion be planned 'once, in the most general form those uses require'. A real-line-only design would leave CDT's import unowned, or force a second theory of capacity.

**Evidence.**

Paper p.5, Definition 2.1: 'Choose a compact subset Σ of C. Given a Borel measure µ supported on Σ, we define the potential function U^µ : C → R ∪ {∞} …'. PAPER-SMITH-24.result.json route 1 brief: 'Plan logarithmic potential theory on compact subsets of the real line and its application …'. PAPER-CALEGARI-DIMITROV-TANG-25.result.json route 2 brief: 'the potential-theoretic form (2.5.28) of §2.5.27. That form imports capacity and equilibrium measures of compact sets from the owner of logarithmic potential theory'. Its item potential-generalization-2.5.27: 'For compact K ⊂ D̄(0,1) with transfinite diameter d(K) and equilibrium measure μ_K …', with the note 'imports capacity and equilibrium measures of general compact sets rather than defining them'. Its review accepts route 2.

**Fix.**

Change the brief to: 'Plan logarithmic potential theory for compact subsets of ℂ — potentials, energy, capacity (= transfinite diameter = Chebyshev constant), equilibrium measures, Frostman, domination, polar sets, lower semicontinuity of energy, balayage and the weighted theory of RT-PAPER-SMITH-24/2 — and specialise to compact subsets of ℝ for the Chebyshev-polynomial, Hölder and coefficient-adjustment layers and the arithmetic theorems.' State item 8 for Σ ⊂ ℂ, as printed. Name PAPER-CALEGARI-DIMITROV-TANG-25's ArithmeticAlgebraizationAndHolonomyBounds as a consumer.

## Low

### 6. Items 32 and 54 blur the source

- **Kind:** error.
- **Where:** research/blueprint/papers/PAPER-SMITH-24.result.json: items PAPER-SMITH-24/32 (statement), /54 (statement), /43 (note)

**What is wrong.**

Two item statements weaken or blur the source. Item 32 (Lemma 4.5) records '|T(y_i)/T̃_r(y_i)| ≥ 1/2'. The paper proves the signed statement T(y_i)/T̃_r(y_i) ≥ 1/2, and Lemma 4.7 needs the sign: T must change sign between y_i and y_{i+1} because T̃_r does. The absolute-value form does not give this. Item 54 says that Frobenius eigenvalues are Weil q-numbers and 'for the real ones this places the conjugates in [−2√q, 2√q]', and item 43's note says 'for real Weil numbers these lie in [−2√q, 2√q]'. The only real Weil q-numbers are ±√q. The object whose conjugates lie in [−2√q, 2√q] is the totally real algebraic integer π + q/π = π + π̄, and #A(F_q) = ∏(q + 1 − x_i) over its conjugates (with multiplicity). That is what makes Σ = [−2√q, 2√q] and F(x) = log|q + 1 − x| the right data in Proposition 5.12.

**Evidence.**

Paper p.24, Lemma 4.5: 'and so that T(yi)/T̃r(yi) ≥ 1/2 for 1 ≤ i ≤ r + k1' (checked on the page image). p.26, proof of Lemma 4.7: 'For i in S, the root of T in the interval [yi, yi+1] is unique, so T(yi) and T(yi+1) have opposite signs.' p.4: 'the study of Weil numbers reduces to the study of totally real algebraic integers whose conjugates lie in certain intervals'. PAPER-SMITH-24.result.json item 54: 'for the real ones this places the conjugates in [−2√q, 2√q]'.

**Fix.**

Item 32: replace '|T(y_i)/T̃_r(y_i)| ≥ 1/2' by 'T(y_i)/T̃_r(y_i) ≥ 1/2 (so T(y_i) has the sign of T̃_r(y_i))'. Item 54: 'every complex absolute value of a Frobenius eigenvalue π is √q, so x = π + q/π is a totally real algebraic integer with all conjugates in [−2√q, 2√q], and #A(F_q) = ∏_i (q + 1 − x_i) over the conjugates of x counted with multiplicity'. Change item 43's note to match.

### 7. Four slips in the proofs are not recorded

- **Kind:** missing.
- **Where:** research/blueprint/papers/PAPER-SMITH-24.result.json: sourceIssues (after RT-PAPER-SMITH-24/1); new mistakes at Proposition 3.6 (p.16), Lemma 4.4 (p.24) and Lemma 4.7 (p.27) of arXiv v2

**What is wrong.**

Four further slips, none in the errata record, and none affecting a stated result. (a) Proof of Lemma 4.4, p.24: 'since T_{r+3k0}/T̃_r is a monic polynomial with roots contained in Σ' is false in general. Take Σ = [−2,−1] ∪ [1,2] (k₀ = 2) and r odd. By the uniqueness in Lemma 4.2, T_n(−x) = (−1)^n T_n(x), so the odd-degree T_{r+6} vanishes at 0 ∉ Σ. The pruned T̃_r keeps only roots in Σ (S̃ ⊆ S ∩ Σ), so 0 is a root of the quotient. The conclusion |T̃_r(y_i)| ≫ |T_{r+3k₀}(y_i)| still holds: every root of T_{r+3k₀} lies between x₀ and x_{r+3k₀}, so the monic quotient of degree 3k₀ is bounded on Σ by (max Σ − min Σ)^{3k₀}. Kind error, affects nothing. (b) Proof of Lemma 4.7, p.27: 'Q0 has a root in every interval (v_{i,j}, v_{i,j+1}) for j in [0, D−1)' should be j ∈ [0, D − 1], that is 0 ≤ j < D. There are D + 1 points v_{i,0} < ⋯ < v_{i,D}. The next sentence ('Since Q0 has degree Dr, the root in this interval must be unique') needs D intervals for each of the r indices i ∈ S, and the end of the proof says '0 ≤ j < D'. Misprint. (c) Proof of Proposition 3.6, p.16: 'so log‖w^{n+1}P_k‖ ≪ log n for all k ≤ n' should be 'k ≤ n + 1'. P_k is defined for 1 ≤ k ≤ n + 1, and the next display uses max over k ≤ n + 1. Misprint. (d) Proof of Lemma 4.7, p.27: 'we also know that |(Q − ka)(α)| is less than this bound for some α for all k satisfying 0 ≤ k ≤ N/a' is false at k = 0, since Q itself satisfies (4.8). With 1 ≤ k ≤ N/a the pigeonhole count gives only N < (n + 1)a. The printed (4.9), N ≤ na, is still true by a different count. The shifts N′ ∈ [0, N) that violate (4.8) form a union of at most n open intervals of length a = 2·(the bound), one per root α, and by minimality of N they cover [0, N), so N ≤ na. Kind error, affects nothing.

**Evidence.**

Paper pages 16, 24 and 27, checked on page images of arXiv 2111.12660v2 (SHA-256 99b3855a…35a9, fetched 30 September 2026). p.24: 'since Tr+3k0/T̃r is a monic polynomial with roots contained in Σ. So Lemma 4.2 gives |T̃r(yi)| ≫ κ^r'. p.27: 'we thus see that Q0 has a root in every interval (vi,j, vi,j+1) for j in [0, D−1) and i in S. Since Q0 has degree Dr, the root in this interval must be unique'; later 'Applying this for all i in S and 0 ≤ j < D'. p.16: 'so log ||w^{n+1}_µ Pk||_Σ ≪ log n for all k ≤ n.' p.27: 'Since N was chosen to be minimal, we also know that |(Q − ka)(α)| is less than this bound for some α for all k satisfying 0 ≤ k ≤ N/a. By the pigeonhole principle, we thus have (4.9) N ≤ na'. Definition 4.6 (4.8): 'N is the minimal nonnegative real number for which this polynomial satisfies |Q(α)| ≥ n^{−1}C2^{−1}κ^{Dr}'. No existing correction: arXiv lists v1 (24 November 2021) and v2 (16 March 2024) only; the Crossref record of DOI 10.4007/annals.2024.200.1.2 has no update-to, relation or updated-by (checked 30 September 2026); research/blueprint/errata/PAPER-SMITH-24.json has none of these four.

**Fix.**

Record the four slips as PAPER-SMITH-24/E8–E11 in sourceIssues (and in research/blueprint/errata/PAPER-SMITH-24.json through its next errata update), with 'known': 'new' and searched: arXiv versions, Crossref, the errata record. (a) kind error, affects nothing: correction 'the roots of T_{r+3k₀} lie in [min Σ, max Σ], so |T_{r+3k₀}/T̃_r| ≤ (max Σ − min Σ)^{3k₀} on Σ'. (b) misprint: 'j in [0, D−1]'. (c) misprint: 'for all k ≤ n + 1'. (d) kind error, affects nothing: 'for all k with 1 ≤ k ≤ N/a; since the violating shifts form a union of at most n open intervals of length a covering [0, N), N ≤ na'. The published Annals text was not collated, so scope each to arXiv v2.

## What I checked

- Authorship. The extraction PAPER-SMITH-24 is by Claude Code session cc-7b31c4 (issue #1081; final commit bcada41d, 22 September 2026). It replaced an earlier partial extraction by Codex codex-c83e7a and codex-a71f92, with a continuation by Claude Code cc-fb70e5 (commits 70ec6166, e036bc8c, d26bcb34). The review REV-PAPER-SMITH-24 is by Claude Code cc-d67081 (issue #1082, commit a8ac123c). The errata job is by cc-fb70e5 and its review by cc-442dc5. The string cc-f805bf occurs in none of PAPER-SMITH-24.result.json, .md, .review.json, REV-PAPER-SMITH-24.md, the errata files or the handoff.
- Disclosure. This session wrote FIX-RT-AUDIT-07, the library-audit fixes for ArithmeticStatistics and DiophantineApproximationAndTranscendence. That work changed the audit of ArithmeticStatistics:ST.0 (its verdict, and Northcott) and of DT.0 (Weil heights, and the Polynomial.finite_mahlerMeasure_le citation). Finding 3 part (2) concerns items citing ST.0 as a planner. It rests on ST.0's stage text and packet, not on the audit entries this session edited. No finding touches DT.0, heights or Mahler measure. CA.6, the owner of route 3, imports DT.0, but no finding depends on that.
- Source. arXiv 2111.12660v2 (https://arxiv.org/pdf/2111.12660v2), fetched 30 September 2026, SHA-256 99b3855a176ddb280630f50cbed23039c1348417aad31d817f34c3b60f4a35a9, matching the recorded hash. The arXiv abstract page and API list v1 (24 November 2021) and v2 (16 March 2024) only, with no journal reference. Crossref for DOI 10.4007/annals.2024.200.1.2 has no update-to, relation or updated-by, and a Crossref bibliographic query for an erratum finds none. The published Annals text was not consulted.
- The whole paper read with pdftotext (pp.1–47): §1, §2 (Definitions 2.1–2.11, Lemmas 2.3, 2.7, 2.8, 2.10, Propositions 2.5, 2.12), §3 (Theorems 3.1, 3.2, Corollaries 3.3, 3.7, Propositions 3.4–3.6, Lemma 3.8), §4 (Proposition 4.1, §4.1, Lemmas 4.2, 4.4, 4.5, 4.7–4.9, Definitions 4.3, 4.6, the proof of Proposition 4.1), §5 (Notations 5.1, 5.3, 5.8, Lemmas 5.2, 5.4, 5.10, Definition 5.5, Remarks 5.6, 5.14, Propositions 5.7, 5.12, 5.13, 5.15, 5.17, Theorem 5.11, Examples 5.9, 5.16) and the references. Pages 16, 24 and 27 were rendered as images to confirm the printed text of RT-PAPER-SMITH-24/7.
- Computations checked line by line: Lemma 2.3's constant C₀(η⁻¹ + 2(1−η)⁻¹ + log 3), including the I₂ layer-cake step; (2.6) from Definition 2.11; (2.9), (2.11)–(2.15) and (2.7) in Proposition 2.12; in Theorem 3.2, integrality of the b_ij (Gauss's lemma for Q = (z − α_i)Q_i) and the √2 realification; Proposition 3.4's volume (Vol K = 2^{m+1}∏v_i⁻¹∏|α_i − α_j|⁻¹ and Minkowski's second theorem); Proposition 3.5's energy identity; D = ∏_{i<j}|α_i − α_j|⁻¹ in Proposition 3.6; Corollary 3.7, where the case I(µ) < 0 is the conclusion; (3.9)–(3.11) and the mod-2 independence of H_j in Lemma 3.8, with the dropped exp((n − m/2)I(µ)) absorbed into n^{−Cn}; the extremal argument of Theorem 3.1 (monotonicity of m_k, the choice of k, (3.14)–(3.17)); §4.1 (the 4R − 2 tail, (4.4)–(4.5), Eisenstein at 2, the norm limit); Lemma 4.4's classes; the λ_i < 2/D bound and the choice of D in Lemma 4.5; Definition 4.6's coefficient ranges; Lemma 4.7's IVT count and (4.9)–(4.10); Lemma 4.8 (4.13)–(4.15); Lemma 4.9; the separation and δ bounds in the proof of Proposition 4.1.
- §5 checked: ν_{[a,b]} as the pushforward of the arcsine law of [1/b, 1/a] under t ↦ 1/t (Jacobian); (5.1)–(5.4) and U^ν(0) = log((a+2√ab+b)/(4ab)) via the Green function of [c,d] at 0; (5.5) with its mass factor (E4); the support and weak* claims of Notation 5.3 and Lemma 5.4; B ≥ 0 and (5.8)–(5.10) for sweetened measures; Proposition 5.7 (capacity (2C₀−2)/4 > 1); the proof of Proposition 2.5 (the domination step and the sweetener bound γ_k log_κ(2κC)) and the E6 and E7 corrections; Lemma 5.10 (R = L/(κ−1), (5.12)–(5.14) and the final inequality, using M > κ); Theorem 5.11 (the separation, the signs of a₀, a_i and E5); the translation and reflection in Proposition 5.13 and its Taylor step; Proposition 5.15's resultant identity log|res(Q,Q_i)| = deg Q_i log|c| + n∫log|Q_i| dµ_Q; Proposition 5.17's convex-combination and domination argument.
- Example 5.16 recomputed at 40 digits: C = −1.2858523×10⁻⁷, ∫log|x| dµ = 1.4512796×10⁻⁶, ∫x dµ = 1.8983031191782…, cap[a,b] = 1.0809308 > 1. A 200,000-node quadrature in θ (t = c + r cos θ) gives U^µ(z) + γ log|z| equal to C on [a,b] up to the quadrature error (about 2×10⁻⁶ at z = 0.5, 2, 4) and far below C off [a,b] (−0.93 at z = 6, −0.90 at z = −1, −0.49 at z = 0.05). Corollary 1.3's constants are 1 ∓ 1.89831.
- All 56 items were compared with the paper's statements and hypotheses, including Theorems 1.1 and 1.5 (countably many components, capacity > 1, Σ ⊂ ℝ), Corollary 1.3 (square q ≥ C), Notation 5.8 (closed Σ, growth condition (5.11), capacity > 1), Theorem 5.11, and Propositions 5.12, 5.13, 5.15 and 5.17. Discrepancies are recorded in findings 1 and 6.
- All seven errata E1–E7 (research/blueprint/errata/PAPER-SMITH-24.json) re-checked at their locators; I agree with each confirmation. E2's locator names Proposition 2.5, but the passage is in the proof of Proposition 2.12 (noted in finding 1's fix).
- Library declarations read at the pins (Mathlib 082e2d3, Tau Ceti f790474). The extraction's own citations: Polynomial.IsPrimitive, Polynomial.content, Polynomial.content_dvd_coeff, Polynomial.IsPrimitive.Int.dvd_iff_map_cast_dvd_map_cast, Polynomial.IsEisensteinAt and .irreducible (which requires primitivity and positive degree, both satisfied by the monic R_n), MeasureTheory.lintegral_lintegral_swap, lintegral_prod and lintegral_iSup. All resolve and are apt. Declarations bearing on the findings: Polynomial.resultant, resultant_eq_prod_eval, resultant_eq_zero_iff and discr; minpoly; IsIntegral; the CompactSpace (ProbabilityMeasure E) instance and isCompact_setOfPred_finiteMeasure_le_of_isCompact; ProbabilityMeasure and tendsto_iff_forall_integral_tendsto; exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure; geometric_hahn_banach_open; ContinuousMap.exists_extension; Polynomial.Chebyshev.measureT; TauCeti.chebyshevMeasureT_univ; TauCeti.map_cos_chebyshevAngleMeasure.
- Searches of declarations.tsv for potential-theoretic names (equilibrium, capacity, logPotential, Frostman, transfinite, Remez, Chebyshev constant): none in either library, so the potential theory is indeed missing. Searches for Honda, Weil number, successive minima and flatness: no library declarations (Minkowski's second theorem is absent, as the GN.1 audit says).
- Every cited layer was read: GeometryOfNumbersAndQuadraticArithmetic GN.0 and GN.1 (stage text, and the packet's 49 GN.1 nodes, including minkowski-second-lower and minkowski-second-upper); ClassicalArithmeticCompletion CA.3 and CA.6 (stage text, packet nodes and library audit targets); ArithmeticStatistics ST.0 (stage text, 37 packet nodes, audit); Tau Ceti OptimalTransport layer 1; WeightsInEtaleCohomology R34.1 and R34.2; DeligneWeightsAndPurity DWP.1 and DWP.10; FaltingsFinitenessAndIsogenyTheorems (roadmap summary, R28.4, content/campaign README, packet and integrated decomposition). DWP.1 plans the Weil estimate for abelian varieties, so item 54's planned status is right.
- Ownership and duplication. Other extractions were searched for Honda–Tate, capacity, equilibrium measures, Fekete, Bilu/Rumely, equidistribution and totally positive items. PAPER-LIPNOWSKI-TSIMERMAN-18 owns Honda–Tate and Tate over finite fields (finding 4). PAPER-CALEGARI-DIMITROV-TANG-25 imports capacity from the owner of logarithmic potential theory (finding 5). Its Fekete Lemma 2.5.3 is the circle's Vandermonde maximum, not the transfinite-diameter theorem, so there is no duplication. The PAPER-DEMARCO-KRIEGER-YE-20 and PAPER-YUAN-26 equidistribution items concern adelic and non-archimedean measures owned by ArithmeticDynamics and ArakelovGeometry, which is not this paper's material. There are no cycles among the four routes: route 1 imports CA.3, CA.6 and GN.1, and none of them imports route 1.
- Queue state for applying the routes. BP-ClassicalArithmeticCompletion and BP-GeometryOfNumbersAndQuadraticArithmetic are pending, so routes 2 and 3 will be applied. BP-FaltingsFinitenessAndIsogenyTheorems is done, so route 4 will not (finding 4). DESIGN-LogarithmicPotentialTheoryAndAlgebraicIntegers (issue #3372) and DESIGN-AbelianSchemesAndArithmeticModuliPartII (#3351) are pending.
- Prerequisites: the 14 entries against the paper's bibliography. Every entry is used by the paper. Erdélyi [9] and Salzer [25] are used but missing (finding 2). Klee [16], DiBenedetto [8] and Willard [37] are textbook or library inputs, and Hilbert [13], Amoroso [4] and Pritsker [21] are only cited as precedents.
- The review REV-PAPER-SMITH-24 (review.json and REV-PAPER-SMITH-24.md) was read. It reproduced the negative atlas searches and accepted with no change. It missed findings 1–5: it did not consult the errata record, and it did not open the library for items 48 and 51 or the ST.0 packet.

## Checks run

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-SMITH-24.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
