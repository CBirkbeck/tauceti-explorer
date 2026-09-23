# PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23: extraction and routing

Issue [#1248](https://github.com/CBirkbeck/tauceti-explorer/issues/1248). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged partial checkpoint of Codex session codex-a71f92 ([#1905](https://github.com/CBirkbeck/tauceti-explorer/pull/1905)).
- **The paper.** Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma, *Irreducibility of random polynomials: general measures*, Inventiones Mathematicae 233 (2023), 1041–1120 (doi 10.1007/s00222-023-01193-6; arXiv 2007.14567).
- **Items.** The result has **133 items: 15 library, 3 planned and 115 missing**.
  - Items /1–/130 are those of the checkpoint; /131–/133 are added here.
  - Seven routes own the missing items, each exactly once: two Part IIs and five source routes.
- **Mistakes.** Twenty-five are recorded under `sourceIssues` (E1–E25).

## What the paper proves

A random monic polynomial A = Tⁿ + a_{n−1}T^{n−1} + ⋯ + a₀ has independent coefficients a_j drawn from laws μ_j on ℤ, and a₀ ≠ 0.
- **Small factors (Theorem 2).** For a fixed law μ with ‖μ‖_∞ ≤ 1 − ε and support in [−H, H], A has no divisor of positive degree ≤ θn with probability 1 − n^{−c}, for some θ = θ(H, ε) > 0.
- **Irreducibility with probability 1 − n^{−c}.** This holds for uniform coefficients on N ≥ 35 consecutive integers (Theorem 1(a)), for laws of small ℓ²-norm (Theorem 3 and Corollary 1(b)), for odd powers k^d (Theorem 4) and for most random coefficient sets (Theorem 5).
- **Galois group.** In all these cases the Galois group is A_n or S_n (Theorem 6). As a result A is (n − 2)-fold irreducible (Corollary 2).
- **Positive probability.** For 2 ≤ N ≤ 34 consecutive integers (Theorem 1(b)) and for arithmetic progressions (Theorem 3.5), A is irreducible with probability at least δ > 0.

The engine has four parts:
- joint equidistribution of the reductions A mod p, for four primes p, in 𝔽_p[T] beyond the square-root barrier (Proposition 2.3, §§4–6);
- the anatomy of polynomials over 𝔽_p with a Brun sieve (Proposition 2.2, §§8–10);
- Konyagin's exclusion of small factors (Proposition 2.1, §7);
- a Łuczak–Pyber theorem for random partitions, fed by a Frobenius element at a possibly ramified prime (Propositions 2.4 and 12.1, §§11–12).

## This continuation (cc-442dc5)

**What was read and recomputed.**
- The arXiv v3 TeX source was read in full, with its PDF. Statement and equation numbers were simulated from the TeX counters and matched to the PDF.
- The author PDF of 24 May 2023 (the checkpoint's download) was compared with v3 word by word. They agree apart from the date and the arXiv stamp, and arXiv marks v3 as the final version. The published Inventiones PDF is paywalled and was not seen, so the locators follow v3.
- Recomputed:
  - α(210) for every N from 35 to 33729, the range of the paper's Mathematica check. The maximum is 0.99211, at N = 35, and agrees with the checkpoint's exact certificate C1.
  - The optimal exponents γ(s) behind Table 1 and behind the ±1 case of Theorem 3.5, at 60 digits (/132).
  - The counterexample to Remark 2.2(b) (E17), and the arithmetic in E4 and E5.

**Four gaps in the proofs are repaired here.** The details are in the section *Repairs* below.
- **E12, Lemma 12.9.** The checkpoint left this open. Two changes close it:
  - Case 2b uses five long parts, whose block orbits are disjoint, and the fact that at most three cycles exceed n/4.
  - Case 3 uses a strengthened E₅ with four long parts. Lemma 12.6's own proof gives the strengthened E₅ with the same probability bound.
  - This affects /108, /113 and /117.
- **E18, Theorem 4.** Proposition 2.1 holds for supports up to exp(Cn^{1/3}), with n₀ depending on C (/131). With C = d, Theorem 4 holds as printed.
- **E19, Lemma 3.7.** The change of variables q = Q₁R₁ must keep Q₁ and R₁ as products of primes from [x/2, x].
- **Lemma 9.2(b).** The paper leaves the proof for general f to the reader; it is written out in /83 (the checkpoint's gate S11).

**Three items are added.**
- /131: the support extension above.
- /132: the Table 1 and ±1 certificates. This closes the checkpoint's gate S2.
- /133: Remark 3.3, the Galois group for coefficients in an arithmetic progression. It was the only result-stating remark without an item.

**The findings.**
- The checkpoint's eighteen findings were each checked against v3. Several were corrected:
  - E1: the proof of Theorem 7 is correct; only the statement lost its negation.
  - E3: Corollary 2 has no part (a).
  - E4 affects the explicit θ in the statement of Theorem 2.
  - E11: the quotation and the reason now match the text.
  - E13: the quotation now matches Remark 3.2, and the case d = 1 is added.
  - E12 and E18 now carry repairs.
- Seven findings are new (E19–E25).

**Spacing.** The checkpoint's strings had lost the spaces before digits and variables ("Theorem7 withs=1", "ofρ"). These are restored throughout the result and this report; the wording is otherwise the checkpoint's.

**Why the status is now complete.**
- Every numbered statement, every result-stating remark and every theorem cited in a proof is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- The checkpoint's completion gates are closed or deferred, and the result records each resolution:
  - closed: S2, S3, S11, S12, S14 and S15;
  - unavailable: S1, the paywalled published version;
  - deferred: S4–S10 and S13. These asked for the proofs of cited suppliers (Mignotte, Dobrowolski, Kolmogorov–Rogozin, Smati, Rosen, Koukoulopoulos's book) and for Remark 3.2's sketch to be re-derived. An extraction states such theorems as items and lists their sources as prerequisites; re-deriving them is the work of the routes' design and blueprint jobs.

## Sources and provenance

Primary proof read: [arXiv:2007.14567v3](https://arxiv.org/pdf/2007.14567v3), submitted 2 June 2023, PDF dated 5 June 2023, all 65 pages, §§1–12, remarks, footnotes and references. SHA-256: `adb1359df46f92d608009b32f45939672e08b1e3fe052587b035431e70d5d3e1`.

Published metadata: [Inventiones Mathematicae 233 (2023), 1041–1120](https://link.springer.com/article/10.1007/s00222-023-01193-6). The article landing page, abstract, references and numerical footnote were compared. The publisher PDF is paywalled (it returned an HTML page), so the published pagination was not seen.

The [author PDF](https://dms.umontreal.ca/~koukoulo/documents/publications/irreducible.pdf), dated 24 May 2023, was also acquired: SHA-256 `fea6a6d8c18ad4b787be100a643e72ca1d9106905c459d6c3c36450b76c509b2`. This continuation compared it with v3 word by word: they agree apart from the date and the arXiv stamp. All locators refer to v3. The arXiv history, publisher page, [author publication list](https://dms.umontreal.ca/~koukoulo/) and title/id correction searches revealed no correction; this is limited search evidence, not a claim that no correction exists. No authors were contacted.

Page images were checked for ambiguous statements on pp. 3,5,13,14,16,19–23,25,28,36,53,58,60,63. In particular Lemma 12.5 uses (t/4)log n and √n/3, not 4t or √(n/3).

## Main-result map

The JSON gives exact statements, locators, hypotheses, dependencies and proof steps. Important distinctions:

- The polynomial is monic, the n lower coefficients are independent, and the constant coefficient is conditioned to be nonzero where specified. Conditioning changes μ₀ only; it does not justify discarding this event from arbitrary unconditional estimates.
- Theorem 1(a): N≥35 consecutive coefficient values, n≥max(n₀,(log H)^3), irreducibility probability≥1−n^(−c). Theorem 1(b):2≤N≤34, only an absolute positive lower bound.
- Theorem 2 excludes small factors for general nonconcentrated iid laws; it does not assert irreducibility. The printed log-height exponent 5 is not proved (E4); the proof gives θ=cε/(log H)^9 under n≥Cε^(−20000)(log H)^1000000.
- Theorem 3 has the precise l2-square condition min(H^(−4/5),n^(1/16)/H)/(log H)^2. Corollary 1 translates it to arbitrary finite coefficient sets. Theorem 4's odd-power sets have coefficients up to H^d; the range n≥(log H)^3 is recovered through /131 (E18).
- Theorem 5 has two probability spaces: a random coefficient set, then the polynomial law. Its good-set event is chosen before quantifying over all sufficiently large degrees.
- Theorem 6 concludes A_n **or** S_n, not always S_n. Corollary 2's justified scope excludes Theorem 2 (E3). The random-partition proof is repaired at Lemma 12.9 (E12).
- Full cycle types include fixed points; factor degrees include multiplicities. Frobenius existence at a ramified prime is available in Tau Ceti, while the merging theorem is new work.
- Nonconstant divisor events exclude units; the smooth part excludes T; arithmetic progression evaluation must treat zero separately. Transitivity of the action on distinct roots implies irreducibility only with separability.

### Coverage by proof block

| Source block | Main item numbers |
|---|---|
| §§1–2: laws, main results, Fourier master criteria | 1–12,16,24,26–45,124–126 |
| §3: coefficient families and quantitative applications | 25,46–58,122–123,127–130,132–133 |
| §§4–6: Laurent characters, torus, equidistribution | 13–15,17–23,118–119 |
| §7: small factors, concentration and Mahler measure | 59–71,120–121,131 |
| §8: polynomial Brun sieve | 72–76 |
| §§9–10: smooth factors and four-prime irreducibility | 77–85,27–28 |
| §11: partitions and ramified Frobenius | 86–102 |
| §12: random partitions and permutation groups | 103–117 |

Every numbered theorem, corollary, proposition, lemma, claim and definition has an item, as do the remarks that state results (2.1, 2.2, 3.2, 3.3) and every theorem cited in a proof.

## Library and atlas audit

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Atlas inspection base: `7c07323ec6973a5cce9967017e7cea307d678716`. The reviewed audit was read for ST, SV, FF, CA.6, AN.2, PM and the relevant upstream Galois layers. Actual statements—not just names—were read for every library credit.

| Pinned source | Read lines | Credited items |
|---|---|---|
| mathlib: Mathlib/Probability/ProbabilityMassFunction/Constructions.lean | 32–102;267–291 | 3 |
| mathlib: Mathlib/Analysis/Polynomial/MahlerMeasure.lean | 48–90;126–135;212–274;295–307;418–440 | 66,67,68,120,121 |
| mathlib: Mathlib/FieldTheory/PolynomialGaloisGroup.lean | 142–230 | 86 |
| mathlib: Mathlib/GroupTheory/Perm/Cycle/Type.lean | 530–594 | 88 |
| mathlib: Mathlib/Algebra/Group/AddChar.lean | 316–349 | 119 |
| mathlib: Mathlib/Data/ZMod/Basic.lean | 881–913 | 118 |
| mathlib: Mathlib/NumberTheory/LSeries/PrimesInAP.lean | 421;436–465 | 57 |
| tauceti: TauCeti/GroupTheory/Perm/Partition.lean | 76–100 | 88 |
| tauceti: TauCeti/RingTheory/Polynomial/FactorDegrees.lean | 48–75;116–167 | 89 |
| tauceti: TauCeti/FieldTheory/GaloisGroups/Orbits.lean | 170–198 | 87 |
| tauceti: TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean | 47–88 | 98 |
| tauceti: TauCeti/NumberTheory/NumberField/Frobenius.lean | 78–102 | 97 |

The JSON records each source hash. Searches in both pins and atlas packets, decompositions, links and reserved IDs did not locate the paper's general-measure theorem, Kolmogorov–Rogozin, Dobrowolski or the required random-partition criterion. Absence is a search conclusion at these pins, not a claim about later libraries.

Built facts include PMF filtering, Mahler measure and its root/L1/L2 bounds, a basic factor coefficient estimate, the Galois action, full cycle types, factor-degree partitions, finite-field Frobenius orbit sizes, ramified Frobenius lifts, scalar CRT, additive-character orthogonality and Dirichlet primes in progressions. These are **not** replanned. The sharper Mignotte estimate, PNT, large sieve and Dobrowolski are not inferred from superficially related declarations. Generic characteristic functions and uniform PMFs already exist; missing items are the paper-specific adapters.

## Routing decisions

### 1. Arithmetic statistics, counting fields and Selmer distributions, Part II: random polynomials of growing degree

Type: part-ii, parent ArithmeticStatistics, area algebraicnt. 70 items. ST.0–5 organize height/discriminant-ordered number fields, Selmer averages and class-group laws; they do not plan growing-degree independent-coefficient polynomial laws. The new probability space and uniform n,H,μ estimates need new layers. PM supplies generic concentration; this route owns only its polynomial applications.

Build on Arithmetic statistics, counting fields and Selmer distributions (ArithmeticStatistics), importing its counting/probability conventions without recasting these laws as discriminant-ordered fields. The endpoints are the exact statements in items 29–41, 44–45, 52, 123 and 133; keep all conditioning, n/H ranges and absolute versus d-dependent constants. Specifically obtain probability≥1−n^(−c) for irreducibility of uniform consecutive N-element coefficient intervals when N≥35 and n≥max(n₀,(log H)^3); for 2≤N≤34 obtain an absolute positive lower bound. Import the exact Fourier certificate 47 and the Table 1 and ±1 certificates 132 (use γ below the optimal γ(s), not the rounded printed values). For general iid laws with mass≤1−ε, the presently justified small-factor cutoff is cεn/(log H)^9 under n≥Cε^(−20000)(log H)^1000000; the paper's exponent 5 remains E4, not a proved target. The l2 criterion is ||μ||₂²≤min(H^(−4/5),n^(1/16)/H)/(log H)^2. Odd-power sets, random sets and the other endpoints must retain their item-specific hypotheses and gates. Construct monic coefficient PMFs, CRT joint reductions, σ,δ,Δ, smooth/rough parts excluding T, additive statistics and conditional-law adapters with the APIs/tests in each definition. Prove small-factor exclusion, Fourier equidistribution, four-prime summability and the partition law bounds before applications. Import Finite fields, character sums, finite rings and coding interfaces (FiniteFieldsAndCharacterSums) for residue duality and prime-polynomial estimates; Sieve methods, prime gaps and prime patterns (SieveMethodsAndPrimePatterns) for both large sieves and Brun; Classical arithmetic, sequences, polynomials and reciprocity (ClassicalArithmeticCompletion) for sharper Mignotte and Dobrowolski; Analytic number theory, zeta functions and prime distribution (AnalyticNumberTheory) for prime and totient estimates; Probabilistic, metric and ergodic number theory (ProbabilisticAndMetricNumberTheory) for concentration. Import the proposed PolynomialGaloisGroupsPartIIRandomPartitions only for the deterministic/group criterion; it must not import this route's final Galois theorem in return. The imprimitive-group step (E12) and the odd-power height range (E18) are repaired here: item 117 and item 131, which extends the small-factor estimate to supports exp(Cn^(1/3)). No exponentially small reducibility error, universal S_n rather than A_n-or-S_n, or general-law irreducibility is claimed. Suggested eventual module: TauCeti/Probability/RandomPolynomial/GeneralMeasures.lean; no Lean file is delivered by this paper job.

### 2. Galois groups of polynomials, Part II: ramified merging and random partitions

Type: part-ii, parent tauceti:TauCetiRoadmap/PolynomialGaloisGroups, area grouptheory. 22 items. The upstream roadmap already owns permutation representations, block systems and good-prime Frobenius specialization. The new layer is bounded equal-part merging at ramified primes and a quantitative random-partition obstruction to proper transitive subgroups; none of the existing carriers is re-planned.

Extend Galois groups of polynomials (tauceti:TauCetiRoadmap/PolynomialGaloisGroups), importing its layers 0,1,5 and 9. Reuse the pinned Polynomial.Gal action, fullCycleType, factorDegrees, arithmetic Frobenius existence at ramified primes and finite-field orbit/factor theorems. Prove item 100: for irreducible integral monic A and every prime p, some Galois element has cycle type obtained by merging equal parts of the mod-p factorization partition, with each merged block bounded by the maximum factor multiplicity. Do not replace this by an unramified-prime assertion. Then build the arbitrary partition-law criterion 103, with all three probability premises, C,t,κ,δ and ε∈(0,δ/2). Its endpoint is ν(Merge(ρ;n^θ)∩T_n≠∅)≪(log n)^2n^(−κ(δ/4−θ/2)) uniformly 0≤θ≤δ/2−ε; T_n is the union of proper transitive subgroups excluding A_n and S_n. E₁ controls only pairs of parts ≤n/4, so the imprimitive case follows item 117: the block orbits of five long parts are disjoint and at most three cycles exceed n/4, and E₅ is strengthened to four long parts not divisible by any r≥2 (item 108), with the same probability bound (item 113). Define multiset subset and equal-part merging precisely; expose all E₁–E₅ thresholds, fixed points, multiplicity and min-support conventions. Import AnalyticNumberTheory divisor/Mertens estimates and the original primitive-group minimum-degree theorem, not an unproved Jordan-theorem shortcut. ArithmeticStatisticsPartIIRandomPolynomials supplies concrete coefficient-law instances only AFTER this arbitrary-law criterion; avoid a roadmap-level circular final theorem. Also prove the distinct-root, k-fold-irreducibility versus k-transitivity adapter and its (n−2)-fold consequence for n≥3. The construction must test identity/full cycle type, repeated mod-p factors, unit polynomial and nonseparable counterexamples. Suggested eventual modules: TauCeti/GroupTheory/Perm/RandomPartitions.lean and TauCeti/FieldTheory/GaloisGroups/RamifiedMerging.lean; no new Lean is claimed here.

### 3. FiniteFieldsAndCharacterSums

Type: source, layers FiniteFieldsAndCharacterSums:FF.1, FiniteFieldsAndCharacterSums:FF.3, FiniteFieldsAndCharacterSums:FF.4. 9 items. FF.1/4 own exact additive-character and finite harmonic-analysis interfaces. Reuse the LaurentSeries carrier and generic character orthogonality; supply residue-pairing nondegeneracy, normalized finite-coordinate torus integration and rational-frequency adapters, not duplicate generic Fourier transforms. FF.3 receives prime-polynomial enumeration and its factorization-based proof, including degree 1. BKK is a consumer/source locator, not a replacement for Rosen's full proof.

### 4. SieveMethodsAndPrimePatterns

Type: source, layers SieveMethodsAndPrimePatterns:SV.0, SieveMethodsAndPrimePatterns:SV.1, SieveMethodsAndPrimePatterns:SV.2. 6 items. SV.0 owns explicit density/remainder data and Bonferroni, SV.1 the Brun bound, and SV.2 the additive and polynomial-Farey large sieves. The vector-polynomial local factor and exclusion of T must be explicit; there is no independence assumption between reductions unless proved by the coefficient law. Reuse generic finite-sum/character APIs.

### 5. ClassicalArithmeticCompletion

Type: source, layers ClassicalArithmeticCompletion:CA.3, ClassicalArithmeticCompletion:CA.6. 4 items. CA.3/6 own integral factor bounds and quantitative Mahler/house estimates. Import existing Mahler measure, multiplicativity, root formula, Landau and basic Mignotte coefficient bounds. Only the sharper sqrt(m)-exponent factor norm, its evaluation adapter, Dobrowolski and prime-power degree-drop input remain; no general Lehmer lower bound is asserted.

### 6. AnalyticNumberTheory

Type: source, layers AnalyticNumberTheory:AN.2, AnalyticNumberTheory:AN.5. 5 items. AN.2 owns prime counts and counts of fixed-size products of medium primes; AN.5 supplies inverse-totient/divisor/Mertens estimates. Already-built Dirichlet infinitude is imported, not replanned and not confused with PNT. The items state these suppliers as the paper uses them; their proofs belong to the layers' blueprints.

### 7. ProbabilisticAndMetricNumberTheory

Type: source, layers ProbabilisticAndMetricNumberTheory:PM.0. 2 items. PM.0 owns arithmetic probability/characteristic-function interfaces. Add the concentration function and general real independent-sum bound there as a reusable supplier; do not invent a random-polynomial-specific Kolmogorov–Rogozin theorem. The reviewed audit says generic probability/moments are built, not that this concentration estimate is built. Other consumers include bounded-digit and additive-arithmetic laws; the polynomial root projection remains in the random-polynomial Part II.

The three items added here go to the first route: /131 and /132 feed Theorems 4, 1(b) and 3.5, and /133 is a Galois-group endpoint of the same kind as Theorem 6.

## Mistakes found (`sourceIssues`)

The result records twenty-five mistakes, E1–E25, each with a quotation, a correction and the reason. The locators are to arXiv v3; the author version of 24 May 2023 has the same text and pages. No erratum was found (arXiv, Crossref, the Springer page, the author's list and a web search).

**Stated results that need a change (`affects`: a stated result).**
- **E1, Theorem 7.** The statement bounds the probability that A has *no* divisor of degree ≤ θn; the negation is lost. The proof is correct.
- **E2, Theorem 8.** P must be a product of four distinct primes. With P = 1 condition (b) is vacuous and Tⁿ − 1 would be a counterexample.
- **E3, Corollary 2.** The corollary cites Theorems 1–5, but Theorem 6 does not cover the setting of Theorem 2, where only small factors are excluded.
- **E4, Theorem 2.** The proof has P² ≤ (3x)⁸, not (3x)⁴. It gives θ = c′ε/(log H)⁹, not the stated (log H)⁵. The rest of the theorem stands.
- **E13, Remark 3.2.** The remark needs three hypotheses:
  - the push-forward law, or f injective on {1, …, N};
  - f mod p non-constant for every p | Q;
  - d ≥ 2 for the final bound.
- **E17, Remark 2.2(b).** The Hölder step bounds a 2s-th moment, and both comparisons are false. For P = 210 and μ uniform on 1, …, 210 with weight 3/4 on the even integers, γ(1) < γ(2).

**Gaps and errors in proofs (`affects`: the proof).** Each has a repair.
- E5: Theorem 4 needs H ≥ 3P(P − 1), not H ≥ P²/3.
- E6: the m = 0 term in Lemma 3.2.
- E7: A(N) = 0 in Lemma 3.3.
- E8: Lemma 7.2 needs the complex case of the concentration bound, and it gets it by a real projection.
- E11: Lemma 11.5's hypothesis on μ₀ is more than Proposition 2.4 provides.
- E12: Lemma 12.9.
- E18: the height range of Theorem 4.
- E19: the change of variables in Lemma 3.7.

**Errors with no consequence (`affects`: nothing).**
- E16: irreducibility and transitivity are equivalent only for separable polynomials.
- E20: the γ column of Table 1 is rounded to nearest. Fifteen printed values exceed γ(s), and the ±1 value equals γ(735).
- E21: the constant in the Dobrowolski bound is Cantor–Straus's or Louboutin's, not Dobrowolski's.
- E22: the count of the set 𝒟(n^{1/10}) does not follow from the stated count.

**Misprints.**
- E9: n^{−2/5} should be n^{−7/20} in §10.
- E10: P ≤ n⁴ should be P ≤ n^{1/4} in §3.7.
- E14: C₂ = 2 should be C₂ = 3 in Lemma 9.3.
- E15: H√n should be H√(n + 1) in Lemma 3.4.
- E23: a sign and a constant in Lemma 9.3.
- E24: n^{κα} ≥ n^{1/40} is reversed in Lemma 12.8.
- E25: log log(3N) should be log log(100N) in Lemma 3.1.

**Where each comes from.**
- The checkpoint's E1–E18 keep their numbers. E1, E3, E4, E11, E12, E13 and E18 are revised as described above.
- E19–E25 are new.
- The kind or reach of E9, E14, E15 and E16 is now "nothing": the correction changes no argument.

## Repairs

**Lemma 12.9, Cases 2b and 3 (E12; /108, /113, /117).**

*The gap.* Cases 2b and 3 find a companion cycle, of length mk (k a part, m ≤ n^θ), in the union X of the blocks met by a long cycle L. From r′ | mk they conclude that gcd(k, ℓ) is large and invoke E₁. But E₁ only concerns pairs of parts ≤ n/4, and X can have up to n points, so k may exceed n/4.

*The repair* uses three observations:
- X is a single orbit of g on blocks.
- Distinct long parts ℓ ≠ ℓ′ have disjoint X_ℓ, X_ℓ′. Otherwise r′_ℓ divides both ℓ and ℓ′, and r′_ℓ is > n^α in Case 2 and > n^{1−3α} in Case 3, against E₁.
- g has at most three cycles longer than n/4.

*Case 2* (n^{δ/2} < r < n^{1−α}):
- E₁ and E₃ give five distinct parts ℓ in [n^{1−α}, n/log n].
- At most one of them has s′_ℓ = s: two such would share the factor s > n^α.
- At most three of the X_ℓ contain a cycle longer than n/4.
- So some ℓ has s′_ℓ < s, and every cycle of X_ℓ ∖ L_ℓ has length ≤ n/4. For such a cycle k ≤ n/4, and the printed argument gives gcd(k, ℓ) > n^α, a contradiction.

*Case 3* (n^{1−α} ≤ r < n) needs four parts ℓ ∈ [n^{1−2α}, n/log n] not divisible by s.
- The printed E₅ gives one. The strengthened E₅ of /108 asks for four; the rest of the argument is the same.
- The strengthened E₅ has the same probability bound (/113). On E₁ ∩ E₃, a modulus r ≥ n^{κα} divides at most one of the ≥ (αt/2) log n long parts. For r ≤ n^{κα}, fewer than four good parts means Σ f_r ≤ 3 ≤ tL_r, which is the event Lemma 12.6 already bounds by ≪ (log n)^κ n^{−2κα(1−1/r)}.

**Support extension for Theorem 4 (E18; /131).** The coefficients k^d are as large as H^d, while the proof of Theorem 4 checks only n ≥ (log H)³.
- Condition (a) of Theorems 7 and 8 enters only through Proposition 2.1, used in §10.
- In §7 put H = ⌊exp(Cn^{1/3})⌋. Claim 7.1 and the height bound (7.1) need only n ≤ H.
- The Dobrowolski prime satisfies p ≤ 2L(m) log(2Hn) ≪ Cn^{1/3}(log n)³. Hence P(D | A) ≤ (1 − n^{−1/10})^{⌊(n−1)/p⌋} ≤ exp(−cn^{17/30}/(C(log n)³)).
- The number of candidates is at most exp(O(Cn^{8/15})) (E22).
- Since 8/15 < 17/30, the union bound is o(n^{−7/20}) for n ≥ n₀(C). With C = d, Theorem 4 holds in the printed range, with n₀ depending on d as the theorem allows.

**Lemma 3.7 (E19).** After Cauchy–Schwarz the proof enlarges the sum to all coprime Q₁ ≤ x^{i₁}, R₁ ≤ x^{j₁}. The change of variables q = Q₁R₁ then counts each q once for every factorization in range, up to 2^{ω(q)} times. The fix is to keep Q₁ and R₁ in 𝒩_{i₁}(x) and 𝒩_{j₁}(x), where every q has at most C(4, 2) = 6 factorizations.

**Lemma 9.2(b) for general f (/83).** The paper writes "We leave the details to the reader". Rankin's trick gives

S ≤ e^{−stL_f} ∏_{deg I ≤ m} (1 + e^{sf(I)}/‖I‖ + Σ_{ν≥2} ν^{C₁s}‖I‖^{−ν}),

using f(I^ν) ≤ C₁ log ν.
- For 0 ≤ s = log t ≤ log C₂, the terms with ν ≥ 2 contribute O_{C₁,C₂}(1).
- Also Σ_{deg I ≤ m} e^{sf(I)}/‖I‖ = (e^s − 1)L_f(m) + log m + O(1).
- Hence S ≪ m·exp(−(st − e^s + 1)L_f(m)), and s = log t gives S ≪ m·e^{−(t log t − t + 1)L_f(m)}.

## Exact certificate C1

For a uniform interval of N consecutive integers,
|μhat(k/P)|=|sin(πNk/P)|/(N|sin(πk/P)|) for k≠0 mod P; the zero frequency is 1. Translation only changes phase. Take P=210. In each residue class N mod 210 the numerator is constant in absolute value and the denominator grows with N. Therefore the maxima over all N≥35 are bounded by the finite representatives 35,…,244.

Machin's identity and alternating arctangent sums bound π rationally. On[0,π/2], monotonicity and alternating sine sums bound each sine; symmetry reduces indices to 0,…,105, and sin(π/2)=1 is exact. Every conversion to an integer upper bound rounds outward. Coset frequencies are (kR+ℓQ) mod P for QR=P, so the program checks every relevant shifted coset, not only unshifted frequencies.

The run checked **76,860** rational inequalities and proved α_210(N)^2<997/1000 for every N≥35. The maximal certified squared ratio occurs at (N,Q,ℓ)=(35,210,0) and is
`516743182104045877204829623329219066012252358425457799019700942140351121/525000000000000000000000000000000000000000000000000000000000000000000000`.
This is an upper bound, not an assertion of an exact trigonometric value. Script SHA-256: `f4a7f37a912e84ce1d34476a8ca9c90c92fa1a087d153dcb6aab81c9b0ef2cb2`.

Run the following complete Python3 program; it uses only the standard library and no floating-point assertions.

```python
"""Exact-rational certificate: alpha_210(N)<1 for every integer N>=35.

No floating-point arithmetic is used in the assertions. Machin's identity
pi=16 atan(1/5)-4 atan(1/239), alternating series, and sin monotonicity on
[0,pi/2] supply the bounds. See the accompanying report for residue reduction.
"""
from fractions import Fraction as F
from math import factorial
import json

D = 10**35
P = 210

def atan_bounds(q, m):
    s = sum((F((-1)**j, (2*j+1)*q**(2*j+1)) for j in range(m)), F(0))
    t = s + F((-1)**m, (2*m+1)*q**(2*m+1))
    return min(s,t), max(s,t)

a,b = atan_bounds(5,40)
c,d = atan_bounds(239,12)
pi_lo,pi_hi = 16*a-4*d,16*b-4*c
assert F(3141592653589793238462643383279502884,10**36) < pi_lo < pi_hi < F(3141592653589793238462643383279502885,10**36)

def ceil(x):
    return -(-x.numerator//x.denominator)

def sine_series(x, m):
    return sum(((-1)**j*x**(2*j+1)/factorial(2*j+1) for j in range(m)), F(0))

lo,hi = [0]*106,[0]*106
for k in range(1,105):
    lower = sine_series(pi_lo*k/P,32)
    upper = sine_series(pi_hi*k/P,31)
    lo[k],hi[k] = int(lower*D),ceil(upper*D)
    assert 0 < lo[k] <= hi[k] <= D
lo[105]=hi[105]=D

def sine_index(k):
    k %= P
    return min(k,P-k)

divisors=[q for q in range(2,P+1) if P%q==0]
checks=0
worst=(F(0),None)
for N in range(35,245):
    value=[D]+[ceil(F(D*hi[sine_index(N*k)],N*lo[sine_index(k)])) for k in range(1,P)]
    for Q in divisors:
        R=P//Q
        for ell in range(R):
            S=sum(value[(k*R+ell*Q)%P] for k in range(Q))
            ratio=F(S*S,Q*D*D)
            assert ratio < 1,(N,Q,ell)
            checks+=1
            if ratio>worst[0]:
                worst=(ratio,(N,Q,ell,S))
assert worst[0] < F(997,1000)
print(json.dumps({'checks':checks,'N_range':[35,244],'worst_N_Q_ell_S':worst[1],
                  'certified_alpha_squared_upper':'997/1000',
                  'worst_squared_rational':str(worst[0]),'arithmetic':'exact Fraction and integer'},indent=2))
```

This certificate does not cover Table 1 or the ±1 case; the next section does.

## Certificates for Table 1 and the ±1 case (/132, E20)

For 2 ≤ N ≤ 34 the proof of Theorem 1(b) needs, for each N, some s and some γ ≥ 1/2 with α(s, γ; 210) < 1; Table 1 lists them.
- Write S(Q, c) for the sum of |μ̂(j/210)|^s over j ≡ c mod 210/Q.
- The largest admissible γ is γ(s), the minimum of 1 − log S(Q, c)/log Q over Q | 210, Q > 1 and classes c with S(Q, c) > 0.
- This holds because the frequencies k/Q + ℓ/R, k mod Q, are the residue class ℓQ mod R, and ℓQ runs over all classes.

The script below computes γ(s) at 60 digits.
- Every γ(s_N) exceeds 1/2. The smallest margin is 4.5·10⁻⁴, at N = 3. So Theorem 1(b) stands.
- The printed γ are γ(s_N) rounded to nearest. For N = 2, 10–14, 17, 18, 21, 22, 26–28, 33 and 34 the printed value exceeds γ(s_N), and then α(s, γ; 210) lies between 1.000003 and 1.000028.
- For the ±1 case of Theorem 3.5 (P = 1155, s = 735) the printed γ = 0.500019700732702471… is γ(735) itself, where α = 1 exactly. Any smaller γ works. The printed δ = 0.00068053 survives, since −log(1 − γ(735)/735) = 0.000680530420…

The floating-point check of α(210) for 35 ≤ N ≤ 33729 (maximum 0.99211 at N = 35) uses |μ̂(k/210)| = |sin(πrk/210)|/(N sin(πk/210)) with r = N mod 210. The trivial bound of the paper covers N ≥ 33730, with a margin of 5.9·10⁻⁶ at N = 33730.

```python
#!/usr/bin/env python3
"""Optimal Fourier exponents behind Table 1 (proof of Theorem 1(b)) and the {-1,1} case of Theorem 3.5 of
Bary-Soroker-Koukoulopoulos-Kozma, recomputed in 60-digit decimal arithmetic (standard library only).

gamma(s) is the largest gamma with max_{QR=P,Q>1} max_l Q^(gamma-1) sum_{k mod Q} |muhat(k/Q+l/R)|^s <= 1.
The frequencies (kR+lQ)/P, k mod Q, form the residue class lQ mod R, and lQ runs over every class mod R, so
gamma(s) = min over Q|P, Q>1 and classes c mod R with S>0 of 1 - log S / log Q, where S = sum_{j=c mod R} |muhat(j/P)|^s.
"""
from decimal import Decimal as D, getcontext

getcontext().prec = 60

def pi():
    # Machin: pi = 16 atan(1/5) - 4 atan(1/239)
    def atan_inv(x):
        x = D(x)
        s, t, k, sign = D(0), 1 / x, 1, 1
        while True:
            term = t / k
            if term < D(10) ** -70:
                return s
            s += sign * term
            t /= x * x
            k += 2
            sign = -sign
    return 16 * atan_inv(5) - 4 * atan_inv(239)

PI = pi()

def sin(x):
    x = x % (2 * PI)
    s, term, k = D(0), x, 1
    while abs(term) > D(10) ** -70:
        s += term
        term = -term * x * x / ((k + 1) * (k + 2))
        k += 2
    return s

def cos(x):
    return sin(x + PI / 2)

def gamma_opt(F, P, s):
    g = D(1)
    for Q in [q for q in range(2, P + 1) if P % q == 0]:
        R = P // Q
        sums = [D(0)] * R
        for j in range(P):
            sums[j % R] += F[j] ** s
        for S in sums:
            if S > 0:
                g = min(g, 1 - S.ln() / D(Q).ln())
    return g

TABLE = {2: (134, "0.50057"), 3: (50, "0.50045"), 4: (27, "0.502094"), 5: (17, "0.503402"), 6: (12, "0.50681"),
         7: (9, "0.51024"), 8: (7, "0.51308"), 9: (5, "0.505506"), 10: (4, "0.50552"), 11: (4, "0.52351"),
         12: (3, "0.51283"), 13: (3, "0.52792"), 14: (3, "0.54188"), 15: (2, "0.50645"), 16: (2, "0.51852"),
         17: (2, "0.52986"), 18: (2, "0.54055"), 19: (2, "0.55066"), 20: (2, "0.56025"), 21: (2, "0.56938"),
         22: (2, "0.57808"), 23: (2, "0.58639"), 24: (2, "0.59435"), 25: (2, "0.60198"), 26: (2, "0.60932"),
         27: (2, "0.61638"), 28: (2, "0.62318"), 29: (2, "0.62974"), 30: (2, "0.63608"), 31: (2, "0.64221"),
         32: (2, "0.64815"), 33: (2, "0.65391"), 34: (2, "0.65949")}

if __name__ == "__main__":
    P = 210
    over = []
    for N, (s, printed) in TABLE.items():
        F = [D(1)] + [abs(sin(PI * N * k / P) / (N * sin(PI * k / P))) for k in range(1, P)]
        g = gamma_opt(F, P, s)
        assert g > D("0.5"), N
        flag = D(printed) > g
        if flag:
            over.append(N)
        print(f"N={N:2d} s={s:3d} gamma(s)={str(g)[:12]} printed={printed:9s} printed>gamma(s): {flag}")
    print("rows whose printed gamma exceeds gamma(s):", over)
    F = [abs(cos(2 * PI * k / 1155)) for k in range(1155)]
    g = gamma_opt(F, 1155, 735)
    theta = g / 735
    print("pm1: gamma(735) =", str(g)[:22], " printed 0.500019700732702471")
    print("     -log(1-theta) =", str(-(1 - theta).ln())[:22], " > 0.00068053:", -(1 - theta).ln() > D("0.00068053"))
```

## Validation

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are consecutive, and every prerequisite resolves. Every missing item is routed exactly once; the three planned items /55, /56 and /69 are named by source routes, as the protocol allows.
- **Findings.** Every `sourceIssues` locator was checked against the text layer of the v3 PDF.
- **Scripts.** The table script above and the checkpoint's certificate C1 are embedded. The float check of α(210) is described in the certificate section.

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check the repair of Lemma 12.9 (E12) and the support extension /131 (E18).
- Check the reach of E4: Theorem 2 as stated promises θ = c′ε/(log H)⁵.
- The cited suppliers were not re-read. Their statements enter as items (/48–/51, /55–/58, /62, /65, /69–/70, /73, /115, /128–/130) and their sources as prerequisites:
  - Mignotte 1988; Dobrowolski 1979; Kolmogorov 1958 and Rogozin 1961; Smati 1992;
  - Rosen's *Number theory in function fields*; Koukoulopoulos's *The distribution of prime numbers*;
  - Bary-Soroker–Kozma 2020; Łuczak–Pyber 1993; Granville 1990.
- The published pagination was not seen; the locators follow arXiv v3.
