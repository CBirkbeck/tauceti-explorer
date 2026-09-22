# Bary-Soroker–Koukoulopoulos–Kozma: general coefficient measures

Partial extraction checkpoint for #1248. Codex, session codex-a71f92, 22 September 2026.

## Outcome and limits

The paper proves irreducibility and alternating-or-symmetric Galois-group results for random monic integral polynomials as degree grows, under general coefficient laws. The central mechanism is quantitative joint equidistribution modulo four primes, combined with exclusion of small factors and estimates for smooth polynomial parts. The Galois argument also works at ramified primes by merging equal parts of the factorization partition.

This checkpoint contains **130 items: 15 library, 3 planned, 112 missing**. Every missing item has exactly one route. All 40 definitions have a consumer, three planning API contracts and three proposed tests. The dependency graph is acyclic. There are two Part II proposals and five source routes. The full v3 has been read, but complete proof closure is **not** claimed: the JSON's S1–S15 gates and the handoff identify what remains.

An executable exact-rational certificate below supplies a genuine additional check: the Fourier maximum for every consecutive interval of size N≥35 is strictly below one. This is not a Lean formalization. The 120 proposed Lean-style tests were not compiled or run.

## Sources and provenance

Primary proof read: [arXiv:2007.14567v3](https://arxiv.org/pdf/2007.14567v3), submitted 2 June 2023, PDF dated 5 June 2023, all 65 pages, §§1–12, remarks, footnotes and references. SHA-256: `adb1359df46f92d608009b32f45939672e08b1e3fe052587b035431e70d5d3e1`.

Published metadata: [Inventiones Mathematicae 233 (2023), 1041–1120](https://link.springer.com/article/10.1007/s00222-023-01193-6). The article landing page, abstract, references and numerical footnote were compared. The publisher PDF request returned HTML, so no comparison of the complete 80-page typeset proof is asserted.

The [author PDF](https://dms.umontreal.ca/~koukoulo/documents/publications/irreducible.pdf), dated 24 May 2023, was also acquired: SHA-256 `fea6a6d8c18ad4b787be100a643e72ca1d9106905c459d6c3c36450b76c509b2`. It was not fully collated. All findings below refer specifically to v3. The arXiv history, publisher page, [author publication list](https://dms.umontreal.ca/~koukoulo/) and title/id correction searches revealed no correction; this is limited search evidence, not a claim that no correction exists. No authors were contacted.

Page images were checked for ambiguous statements on pp3,5,13,14,16,19–23,25,28,36,53,58,60,63. In particular Lemma12.5 uses (t/4)log n and √n/3, not 4t or √(n/3).

## Main-result map

The JSON gives exact statements, locators, hypotheses, dependencies and proof steps. Important distinctions:

- The polynomial is monic, the n lower coefficients are independent, and the constant coefficient is conditioned to be nonzero where specified. Conditioning changes μ₀ only; it does not justify discarding this event from arbitrary unconditional estimates.
- Theorem1(a): N≥35 consecutive coefficient values, n≥max(n₀,(log H)^3), irreducibility probability≥1−n^(−c). Theorem1(b):2≤N≤34, only an absolute positive lower bound.
- Theorem2 excludes small factors for general nonconcentrated iid laws; it does not assert irreducibility. The printed log-height exponent5 has an arithmetic gap. The checked weaker route gives θ=cε/(log H)^9 under n≥Cε^(−20000)(log H)^1000000.
- Theorem3 has the precise l2-square condition min(H^(−4/5),n^(1/16)/H)/(log H)^2. Corollary1 translates it to arbitrary finite coefficient sets. Theorem4's positive odd-power sets require the fixed-d height repair E18.
- Theorem5 has two probability spaces: a random coefficient set, then the polynomial law. Its good-set event is chosen before quantifying over all sufficiently large degrees.
- Theorem6 concludes A_n **or** S_n, not always S_n. Corollary2(a)'s justified scope excludes Theorem2. The random-partition proof still has the large-part obligation E12.
- Full cycle types include fixed points; factor degrees include multiplicities. Frobenius existence at a ramified prime is available in Tau Ceti, while the merging theorem is new work.
- Nonconstant divisor events exclude units; the smooth part excludes T; arithmetic progression evaluation must treat zero separately. Transitivity of the action on distinct roots implies irreducibility only with separability.

### Coverage by proof block

| Source block | Main item numbers |
|---|---|
| §§1–2: laws, main results, Fourier master criteria | 1–12,16,24,26–45,124–126 |
| §3: coefficient families and quantitative applications | 25,46–58,122–123,127–130 |
| §§4–6: Laurent characters, torus, equidistribution | 13–15,17–23,118–119 |
| §7: small factors, concentration and Mahler measure | 59–71,120–121 |
| §8: polynomial Brun sieve | 72–76 |
| §§9–10: smooth factors and four-prime irreducibility | 77–85,27–28 |
| §11: partitions and ramified Frobenius | 86–102 |
| §12: random partitions and permutation groups | 103–117 |

This covers every numbered theorem/proposition/lemma, but is not an assertion that every background construction or imported proof has a complete fine-grained decomposition.

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

Type: part-ii. 67 items. ST.0–5 organize height/discriminant-ordered number fields, Selmer averages and class-group laws; they do not plan growing-degree independent-coefficient polynomial laws. The new probability space and uniform n,H,μ estimates need new layers. PM supplies generic concentration; this route owns only its polynomial applications.

Build on Arithmetic statistics, counting fields and Selmer distributions (ArithmeticStatistics), importing its counting/probability conventions without recasting these laws as discriminant-ordered fields. The endpoints are the exact statements in items29–41,44–45,52 and123; keep all conditioning, n/H ranges and absolute versus d-dependent constants. Specifically obtain probability≥1−n^(−c) for irreducibility of uniform consecutive N-element coefficient intervals when N≥35 and n≥max(n₀,(logH)^3); for2≤N≤34 obtain an absolute positive lower bound. Import the exact Fourier certificate47. For general iid laws with mass≤1−ε, the presently justified small-factor cutoff is cεn/(logH)^9 under n≥Cε^(−20000)(logH)^1000000; the paper's exponent5 remains E4, not a proved target. The l2 criterion is ||μ||₂²≤min(H^(−4/5),n^(1/16)/H)/(logH)^2. Odd-power sets, random sets and the other endpoints must retain their item-specific hypotheses and gates. Construct monic coefficient PMFs, CRT joint reductions, σ,δ,Δ, smooth/rough parts excluding T, additive statistics and conditional-law adapters with the APIs/tests in each definition. Prove small-factor exclusion, Fourier equidistribution, four-prime summability and the partition law bounds before applications. Import Finite fields, character sums, finite rings and coding interfaces (FiniteFieldsAndCharacterSums) for residue duality and prime-polynomial estimates; Sieve methods, prime gaps and prime patterns (SieveMethodsAndPrimePatterns) for both large sieves and Brun; Classical arithmetic, sequences, polynomials and reciprocity (ClassicalArithmeticCompletion) for sharper Mignotte and Dobrowolski; Analytic number theory, zeta functions and prime distribution (AnalyticNumberTheory) for prime and totient estimates; Probabilistic, metric and ergodic number theory (ProbabilisticAndMetricNumberTheory) for concentration. Import the proposed PolynomialGaloisGroupsPartIIRandomPartitions only for the deterministic/group criterion; it must not import this route's final Galois theorem in return. Keep E12-gated Galois and E18-gated height applications conditional until repaired. No exponentially small reducibility error, universal S_n rather than A_n-or-S_n, or general-law irreducibility is claimed. Suggested eventual module: TauCeti/Probability/RandomPolynomial/GeneralMeasures.lean; no Lean file is delivered by this paper job.

### 2. Galois groups of polynomials, Part II: ramified merging and random partitions

Type: part-ii. 22 items. The upstream roadmap already owns permutation representations, block systems and good-prime Frobenius specialization. The new layer is bounded equal-part merging at ramified primes and a quantitative random-partition obstruction to proper transitive subgroups; none of the existing carriers is re-planned.

Extend Galois groups of polynomials (tauceti:TauCetiRoadmap/PolynomialGaloisGroups), importing its layers0,1,5 and9. Reuse the pinned Polynomial.Gal action, fullCycleType, factorDegrees, arithmetic Frobenius existence at ramified primes and finite-field orbit/factor theorems. Prove item100: for irreducible integral monic A and every prime p, some Galois element has cycle type obtained by merging equal parts of the mod-p factorization partition, with each merged block bounded by the maximum factor multiplicity. Do not replace this by an unramified-prime assertion. Then build the arbitrary partition-law criterion103, with all three probability premises, C,t,κ,δ and ε∈(0,δ/2). Its endpoint is ν(Merge(ρ;n^θ)∩T_n≠∅)≪(logn)^2n^(−κ(δ/4−θ/2)) uniformly0≤θ≤δ/2−ε; T_n is the union of proper transitive subgroups excluding A_n and S_n. The bound is a gated target until E12 is resolved: E₁ restricts BOTH parts to≤n/4 and cannot be used on an unrestricted auxiliary cycle. Define multiset subset and equal-part merging precisely; expose all E₁–E₅ thresholds, fixed points, multiplicity and min-support conventions. Import AnalyticNumberTheory divisor/Mertens estimates and the original primitive-group minimum-degree theorem, not an unproved Jordan-theorem shortcut. ArithmeticStatisticsPartIIRandomPolynomials supplies concrete coefficient-law instances only AFTER this arbitrary-law criterion; avoid a roadmap-level circular final theorem. Also prove the distinct-root, k-fold-irreducibility versus k-transitivity adapter and its (n−2)-fold consequence for n≥3. The construction must test identity/full cycle type, repeated mod-p factors, unit polynomial and nonseparable counterexamples. Suggested eventual modules: TauCeti/GroupTheory/Perm/RandomPartitions.lean and TauCeti/FieldTheory/GaloisGroups/RamifiedMerging.lean; no new Lean is claimed here.

### 3. FiniteFieldsAndCharacterSums

Type: source. 9 items. FF.1/4 own exact additive-character and finite harmonic-analysis interfaces. Reuse the LaurentSeries carrier and generic character orthogonality; supply residue-pairing nondegeneracy, normalized finite-coordinate torus integration and rational-frequency adapters, not duplicate generic Fourier transforms. FF.3 receives prime-polynomial enumeration and its factorization-based proof, including degree1. BKK is a consumer/source locator, not a replacement for Rosen's full proof.

Layers: FiniteFieldsAndCharacterSums:FF.1,FiniteFieldsAndCharacterSums:FF.3,FiniteFieldsAndCharacterSums:FF.4. The JSON lists the exact item ownership.

### 4. SieveMethodsAndPrimePatterns

Type: source. 6 items. SV.0 owns explicit density/remainder data and Bonferroni, SV.1 the Brun bound, and SV.2 the additive and polynomial-Farey large sieves. The vector-polynomial local factor and exclusion of T must be explicit; there is no independence assumption between reductions unless proved by the coefficient law. Reuse generic finite-sum/character APIs.

Layers: SieveMethodsAndPrimePatterns:SV.0,SieveMethodsAndPrimePatterns:SV.1,SieveMethodsAndPrimePatterns:SV.2. The JSON lists the exact item ownership.

### 5. ClassicalArithmeticCompletion

Type: source. 4 items. CA.3/6 own integral factor bounds and quantitative Mahler/house estimates. Import existing Mahler measure, multiplicativity, root formula, Landau and basic Mignotte coefficient bounds. Only the sharper sqrt(m)-exponent factor norm, its evaluation adapter, Dobrowolski and prime-power degree-drop input remain; no general Lehmer lower bound is asserted.

Layers: ClassicalArithmeticCompletion:CA.3,ClassicalArithmeticCompletion:CA.6. The JSON lists the exact item ownership.

### 6. AnalyticNumberTheory

Type: source. 5 items. AN.2 owns prime counts and counts of fixed-size products of medium primes; AN.5 supplies inverse-totient/divisor/Mertens estimates. Already-built Dirichlet infinitude is imported, not replanned and not confused with PNT. The items here are source contracts with original proofs still gated.

Layers: AnalyticNumberTheory:AN.2,AnalyticNumberTheory:AN.5. The JSON lists the exact item ownership.

### 7. ProbabilisticAndMetricNumberTheory

Type: source. 2 items. PM.0 owns arithmetic probability/characteristic-function interfaces. Add the concentration function and general real independent-sum bound there as a reusable supplier; do not invent a random-polynomial-specific Kolmogorov–Rogozin theorem. The reviewed audit says generic probability/moments are built, not that this concentration estimate is built. Other consumers include bounded-digit and additive-arithmetic laws; the polynomial root projection remains in the random-polynomial Part II.

Layers: ProbabilisticAndMetricNumberTheory:PM.0. The JSON lists the exact item ownership.

These are provisional design briefs, not edits to roadmap files. The arbitrary-law group criterion must be proved independently and then instantiated by the random-polynomial layer; no circular final-theorem import is permitted.

## Source findings awaiting independent review

The machine-readable records E1–E18 include precise v3 locators, minimal printed expressions, corrected contracts, reasons and correction-search provenance. They deliberately distinguish misprints, false steps and unresolved proof obligations. None has been self-marked confirmed.

### E1: misprint; affects a stated result

arXiv:2007.14567v3, Theorem7 p13 and its proof p14.

The preceding propositions bound presence of small factors, and the last deduction is irreducibility from absence of factors through n/2. Units must be excluded throughout.

Correction/required work: Bound the event that a nonconstant divisor of degree≤θn exists; equivalently bound the complement below by1−C₁n^(−c). In the proof's last paragraph insert the missing negation as well.

### E2: gap; affects a stated result

arXiv:2007.14567v3, Theorem8 p16.

An arbitrary integer P cannot supply the four-prime criterion. In particular P=1 makes the frequency conditions vacuous, allowing the deterministic reducible polynomial T^n−1. Item31 adds the missing hypothesis.

Correction/required work: Require P to be a product of four distinct primes, as used in its proof and the subsection heading.

### E3: gap; affects a stated result

arXiv:2007.14567v3, Corollary2(a) p5.

Theorem6 only supplies alternating/symmetric Galois groups in those regimes; Theorem2 excludes small factors but does not establish irreducibility. No counterexample to a possible stronger theorem is claimed.

Correction/required work: Restrict the cited regimes to Theorems1(a),3,4,5, or supply a new proof for Theorem2.

### E4: error; affects the proof

arXiv:2007.14567v3, Proof of Theorem2, §3.5 p25.

There are four primes in P. For example x=10 and P=11·13·17·19=46189 already violate the displayed comparison. This disproves that arithmetic step, not the stronger main theorem by itself.

Correction/required work: The available bound P≤(3x)^4 yields order εlogx/x^9, not x^5. Item34 records the weaker parameter cε/(logH)^9; the printed exponent5 needs another argument.

### E5: error; affects the proof

arXiv:2007.14567v3, Proof of Theorem4, §3.3 pp22–23.

The second inequality is equivalent to H≥3P(P−1). The printed lower bound on H does not imply it. Only the unspecified height threshold changes.

Correction/required work: Take H≥3P(P−1), or increase the constant H₀(d) accordingly.

### E6: error; affects the proof

arXiv:2007.14567v3, Lemma3.2 proof p20, m=0 contribution.

A monic degree-zero polynomial is1, so the claimed number p^(−1) is not a count. For m≥1 the p^(m−1) formula is valid. The extra O(1/n) is absorbed by the lemma's error.

Correction/required work: Count constant monic cofactors separately: there is exactly one when its required constant coefficient is1, and none otherwise. Bound this boundary contribution by O(1/n).

### E7: gap; affects the proof

arXiv:2007.14567v3, Lemma3.3 proof p21, evaluation at N.

A(N)=0 is possible: with Nset={−2,−1}, A=T^n−T^(n−1)−…−T−2 vanishes at2. A zero factor value is divisible by every prime but need not have absolute value≥p. Base-N uniqueness bounds the omitted slice contribution and the exponential error is absorbed by O(1/n).

Correction/required work: Exclude the unique possible polynomial with A(N)=0 in each fixed-a₀ coefficient slice before using the nonzero multiple-of-p bound; restore its probability at most N^(1−n).

### E8: gap; affects the proof

arXiv:2007.14567v3, Lemma7.2 proof p36.

The invoked Kolmogorov–Rogozin result is for real variables. Avoiding finitely many real lines chooses L; the atom bound at this common δ is ||μ_j||∞ and the common δ cancels. This supplies the complex-root case without a new complex concentration theorem.

Correction/required work: First choose a real linear functional L:ℂ→ℝ with L(z^j)≠0 for each j, and use X_j=a_jL(z^j), δ<min_j|L(z^j)|/2 in the real concentration inequality.

### E9: misprint; affects the proof

arXiv:2007.14567v3, Proof of Proposition2.2, §10 p53.

Combining with the other two errors permits c=min(7/20,c₁,ε/20); the eventual qualitative power saving is unchanged.

Correction/required work: Use the small-factor error O(n^(−7/20)) actually given by Proposition2.1.

### E10: misprint; affects nothing

arXiv:2007.14567v3, Proof of Theorem6, §3.7 p28.

Theorem8 requires n≥P^4 and the earlier parameter choices provide that stronger bound. This is not a license to apply the theorem with P as large as n^4.

Correction/required work: P≤n^(1/4).

### E11: gap; affects the proof

arXiv:2007.14567v3, Lemma11.5 p58 versus Proposition2.4 p15.

The application does not assume anticoncentration for μ₀, whereas the lemma as stated does. Since m=ceil(10(logn)^3), replacing m by m−1 in the exponent preserves the claimed O(1/n) estimate. The original stronger-hypothesis lemma is not false.

Correction/required work: Use the lemma with the weaker assumption only for1≤j<n, and prove the same O(1/n) bound using the m−1 positive-index coefficients.

### E12: gap; affects the proof

arXiv:2007.14567v3, Lemma12.9 Cases2b and3, p63.

E₁ controls pairs only when both parts are≤n/4. The auxiliary cycle length is mk with k∈ρ, but the proof does not bound k≤n/4 before invoking E₁. Item117 and its Galois consumers remain gated. This is an unresolved proof obligation, not a counterexample to the lemma.

Correction/required work: Supply an argument handling the auxiliary part k>n/4, or a stronger good event with a proved probability bound. Do not silently enlarge E₁.

### E13: error; affects a stated result

arXiv:2007.14567v3, Remark3.2, p23.

Uniform image-set measure differs from pushforward when values collide: f(x)=x(x−3), x=1,2,3 gives values−2,−2,0 with different masses. Also f=5x mod5 has5 roots at b=0, exceeding degree1. Item122 makes both hypotheses explicit.

Correction/required work: For the Fourier identity use the pushforward of the uniform input law, or require f injective on that input set. For the root count require squarefree Q and that f modp is nonconstant for every p|Q; omit primes dividing all nonconstant coefficients.

### E14: misprint; affects the proof

arXiv:2007.14567v3, Lemma9.3 proof p49.

Lemma9.2 is stated for C₂≥3. The chosen t lies in(1,2), so C₂=3 satisfies that premise without changing the argument's required t-range.

Correction/required work: Use C₂=3 in the invocation of Lemma9.2.

### E15: misprint; affects the proof

arXiv:2007.14567v3, Lemma3.4 proof p20.

A degree-n polynomial has n+1 coefficients. Taking all coefficients equal toH attains H√(n+1). Item51's final coarse constant is a target pending the external Mignotte input and a checked constant absorption.

Correction/required work: Use ||A||₂≤H√(n+1) and absorb sqrt(1+1/n) into the displayed slack constants.

### E16: error; affects a stated result

arXiv:2007.14567v3, Introduction p4; §11.1 p54.

(T²−2)² is reducible overℚ but has transitive Galois action on its two distinct roots. Item87 imports the pinned theorem with separability. The uses starting from irreducibility are unaffected.

Correction/required work: Require separability and positive degree for the iff on the distinct root set; irreducible characteristic-zero polynomials meet these hypotheses.

### E17: error; affects a stated result

arXiv:2007.14567v3, Remark2.2(b), p14.

Take P=210 and μ=(3/4)Unif(even residues)+(1/4)Unif(odd residues). Its only nonzero Fourier moduli are1 at0 and1/2 at105. The optimal exponent is γ(s)=1−log₂(1+2^(−s)). Thus γ(1)<γ(2), contradicting u=v=2. The printed Hölder step applies powers us and vs to both factors and bounds a 2s moment, not the required s moment.

Correction/required work: Replace these comparisons by monotonicity of γ, monotonic decrease of θ, and weighted concavity of γ as stated in item125.

### E18: gap; affects the proof

arXiv:2007.14567v3, Theorem4 and its proof §3.3 pp22–23.

The set{k^d:1≤k≤H} has maximum coefficient H^d. The master bound suppμ⊂[−exp(n^(1/3)),exp(n^(1/3))] does not follow from n≥(logH)^3 for d>1. The expected repair changes constants depending on fixed d, but it has not been checked here.

Correction/required work: Track the coefficient height H^d, or extend the master support estimate with a fixed-d constant before recovering this n-range. Pending that work, n≥(d logH)^3 gives the direct stronger hypothesis.

E4 and E12 do not by themselves disprove the stronger advertised main theorems. The extraction preserves those as unresolved targets rather than silently asserting them. For E17, by contrast, the explicit probability law disproves the printed auxiliary comparison. The corrected moment monotonicity and weighted Hölder concavity are recorded in item125.

## Exact certificate C1

For a uniform interval of N consecutive integers,
|μhat(k/P)|=|sin(πNk/P)|/(N|sin(πk/P)|) for k≠0 modP; the zero frequency is1. Translation only changes phase. Take P=210. In each residue class N mod210 the numerator is constant in absolute value and the denominator grows with N. Therefore the maxima over all N≥35 are bounded by the finite representatives35,…,244.

Machin's identity and alternating arctangent sums bound π rationally. On[0,π/2], monotonicity and alternating sine sums bound each sine; symmetry reduces indices to0,…,105, and sin(π/2)=1 is exact. Every conversion to an integer upper bound rounds outward. Coset frequencies are (kR+ℓQ) modP for QR=P, so the program checks every relevant shifted coset, not only unshifted frequencies.

The run checked **76,860** rational inequalities and proved α_210(N)^2<997/1000 for every N≥35. The maximal certified squared ratio occurs at(N,Q,ℓ)=(35,210,0) and is
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

This certificate does **not** check Table1 or the Littlewood decimal δ=.00068053. In particular rounding γ to1/2 is insufficient to justify that printed decimal. Those computations remain S2.

## Remaining source acquisition and validation

- M. Mignotte, An inequality about irreducible factors of integer polynomials, JNT30 (1988),156–166, Theorem1′ and subsequent remarks. [Source/locator](https://www.sciencedirect.com/science/article/pii/0022314X88900145). S7: the sharper factor l2 norm with sqrt(m) exponent used in items51,58 is not the already-built basic coefficient bound. Full source not read; missing proof closure.
- E. Dobrowolski, On a question of Lehmer and the number of irreducible factors of a polynomial, Acta Arith.34(1979),391–401. [Source/locator](https://www.impan.pl/en/publishing-house/journals-and-series/acta-arithmetica/all/34/4/102213/on-a-question-of-lehmer-and-the-number-of-irreducible-factors-of-a-polynomial). S10: CA.6 plans a lower bound but this exact quantitative input and the degree-drop supplier for Claim7.4 still need full decomposition; no new duplicate roadmap.
- A. Kolmogorov(1958) and B. Rogozin(1961), concentration inequalities, BKK references19,33,34. [Source/locator](https://doi.org/10.1137/1106009). S8: general real-variable concentration theorem62; read also https://doi.org/10.1137/1106010 and http://www.numdam.org/item/?id=AIHP_1958__16_1_27_0 before closing the proof. These exact supplier proofs were not covered by the PM audit.
- A. Smati, Evaluation effective du nombre d'entiers n tels que φ(n)≤x, Acta Arith.61(1992),143–159. [Source/locator](https://doi.org/10.4064/aa-61-2-143-159). S9: inverse-totient counting65, required for cyclotomic exclusion64. Full supplier proof not acquired.
- M. Rosen, Number theory in function fields, GTM210(2002), Proposition2.1 and Theorem4.8. [Source/locator](https://arxiv.org/pdf/2007.14567v3). S5: BKK pp20,40 and reference35 identify the precise book suppliers for73 and130; link is the citing paper, NOT a claim of access to Rosen's proof. Obtain the book/full proofs or derive and verify them from pinned finite-field APIs.
- D. Koukoulopoulos, The distribution of prime numbers, GSM203(2019), Theorems1.11,3.4 and7.11 as cited by BKK. [Source/locator](https://arxiv.org/pdf/2007.14567v3). S4,S6: source locator is BKK's reference22; acquire complete divisor, prime-counting, Mertens and large-sieve proofs with uniformity. These directions have owners AN/SV but the exact supplier proofs are not closed by this extraction.
- L. Bary-Soroker and G. Kozma, Irreducible polynomials of bounded height, Duke Math.J.169(2020),579–598. [Source/locator](https://projecteuclid.org/euclid.dmj/1578646813). Referenced proof architecture and earlier cyclotomic/noncyclotomic exclusions; compare the exact degree-drop and primitive-group suppliers, without treating a predecessor theorem as the general-measure theorem.
- T. Łuczak and L. Pyber, On random generation of the symmetric group, CPC2(1993),505–512; S. Eberhard, K. Ford and D. Koukoulopoulos, Permutations contained in transitive subgroups, Discrete Analysis2016:12. [Source/locator](https://doi.org/10.1017/S0963548300000869). S12: original random-partition/primitive subgroup input, with later complete source https://doi.org/10.19086/da.849. The primitive minimum-degree estimate needs its actual supplier; E12 is not resolved merely by citing these works.
- K. Ford, Integers with a divisor in(y,2y], CRM Proc.46(2008); P. Meisner, Erdos' Multiplication Table Problem for Function Fields and Symmetric Groups. [Source/locator](https://arxiv.org/abs/1804.08483). S13: Remark3.2's near-half-degree exclusion and square-coefficient extension123 are sketches, not a closed theorem proof. Acquire these arguments, including https://bookstore.ams.org/crmp-46/ and the changed two-prime summability threshold.

The repository paper checker and intake path/JSON checks pass. Additional checks verify unique IDs, resolved acyclic dependencies, exactly-once missing-item routing,40 definition APIs with120 proposed tests, and the executable certificate. These structural checks cannot certify the mathematical proofs.

No Lean file was requested, changed or compiled. The handoff gives the next mathematical work; the result remains `partial`.
