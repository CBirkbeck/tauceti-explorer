# PAPER-BENNETT-SIKSEK-20 — extraction and routing

Codex, session codex-a71f92; issue #1119. This continues merged checkpoint #1232, retaining IDs 01–49.

## Outcome and scope

The extraction is complete: 151 items, comprising 9 pinned-library items, 12 already-planned items and 130 missing items. Each missing item has exactly one route. There are five source routes, three Part II continuations and one new application roadmap. “Complete” describes extraction and ownership, not a closed blueprint or a formalized theorem. Original-proof acquisition, computational certification and the paper's sharper unverified numerical threshold remain explicit design obligations.

The published theorem is an effectively computable absolute bound on **prime** exponents: for sufficiently large k, a primitive solution of
\[
\prod_{0\leq i<k}(n+id)=y^\ell,\qquad \gcd(n,d)=1
\]
has yd=0 or \(\ell\leq\exp(10^k)\). Its consequence is finiteness for each fixed sufficiently large length k. This is not the Erdős nonexistence conjecture, finiteness over all lengths at once, or an algorithm listing every solution.

The entire publisher PDF was read, including the Granville addendum, all references, and the historical/extension discussion. The machine-readable inventory gives the individual exact statements and locators. Historical claims that do not enter the proof are identified as such. The optional Varnavides alternative mentioned on p.381 is not substituted for the proof actually given; the smooth-multiplier extension of §11 is an announcement, not an invented quantified theorem.

## Sources and evidence

Access date throughout: 2026-09-21. Full-paper reading is asserted only for Bennett–Siksek. The following original-source passages were also inspected; this does not assert that all their proofs have been checked.

| Source | Version and passages inspected | SHA-256 |
| --- | --- | --- |
| [Bennett–Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) | Published Annals 191 (2020), 355–392; all 38 pages, §§1–12 and references | 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf |
| [Kraus](https://doi.org/10.4153/CJM-1997-056-2) | Published 1997, pp.1143–1146, Theorems 3–4, small-prime recognition and proof of Theorem 3/start of Theorem 4 | 3d9dc061cdfea2cbdd7525b35ad1ec3d9b0cf97e68277f97ad174c40faca4874 |
| [Martin](https://personal.math.ubc.ca/~gerg/papers/downloads/DSCFN.pdf) | Published 2005, pp.298–302, dimension conventions and Theorem 2 | ef07b4915f8b98809c07b325ba95b5b1d87bebc97c09bf4820aac3e1d98ee847 |
| [Lemos](https://arxiv.org/pdf/1702.01985v2) | March 2017 v2, introduction and Theorem 1.1; published reference DOI 10.1090/tran/7198 | ce889428aa4d6cbe1f30fcb504591063927fdaa96baa1bdf598596bbc02bd043 |
| [Bennett–Skinner](https://personal.math.ubc.ca/~bennett/BS.pdf) | Published 2004, Lemma 2.1, Corollary 2.2, Corollary 3.1 and relevant local/irreducibility proof | 9fa607a29e78ec9aaf465d20ae4aee39dc0378b8dda7c9a8cde18b65b366309c |
| [Bennett–Martin–O'Bryant–Rechnitzer](https://arxiv.org/pdf/1802.00085) | Downloaded arXiv manuscript; Propositions 1.10–1.12 and §6.1 proof of Proposition 1.11 | e51f8b8f63486c2259efe076d367504f08dda0fe9e99dc35bf36de544ffc0601 |
| [Bombieri](https://www.numdam.org/item/AST_1987__18__1_0.pdf) | Astérisque 18, 1987 reprint; §2 pp.14–15 and §5 pp.39–40 | c1969cbf67bd01678a607fab403e206ec9bf979d15ff8ea9908a21492081622a |
| [Platt](https://arxiv.org/pdf/1305.3087) | §7, Theorems 7.1–7.2 and accompanying computational discussion | 8fd109aa21345bc3feac4fde2faa7dfb51b4ef1fc9a430f643323612a39ef417 |
| [Ramaré–Rumely](https://ramare-olivier.github.io/Maths/rumely.pdf) | Author-hosted published article; Theorem 1 p.398, §5.1, Table 1 p.419, modulus 8 row | 94bd522a40cfa72da87c5d8acc35f5e8e8ce2ea3347acdda5e1114eb880e553d |
| [Rosser–Schoenfeld](https://denisevellachemla.eu/Rosser-Schoenfeld-1962.pdf) | Mirror of the original 31-page 1962 article; pp.69–70, Theorems 1,5,6,8; p.70 inspected as an image | 8e37b06f82e09421bceb2502578c47b61469141f0287e6acedb70e01765ab556 |
| [Darmon–Granville](https://www.math.mcgill.ca/darmon/pub/Articles/Research/12.Granville/pub12.pdf) | Author-hosted published article; entire §2.1 pp.520–521, Corollary 2.1 and genus/finite-cover proof | 2a77462524aebdce6a34c540e99afb3913c2c6113b597af9792bed6c82376aca |

Kraus was downloaded from the Cambridge publisher DOI landing route. The Bennett–Skinner digest was checked against the downloaded published PDF.

The Schoenfeld publisher PDF returned 403. Its uniform theta bound is transcribed from Bennett–Siksek's explicit display; obtaining the original concluding note is still required. The main paper's “p.160” locator cannot be right for an article on pp.337–360.

Rahman's linked PDF returned empty content and the former MIT URL returned 404. The exact bound is quoted in Bennett–Siksek (36), whose page image was read; no independent proof-verification claim is made. Attempts to obtain Iwaniec–Kowalski's relevant chapters returned front matter or an author excerpt of Chapter 11, not §§5 or 12. Those are not presented as evidence for the unavailable proofs. Graham–Ringrose was not independently read. The prerequisite register names these source-acquisition tasks.

## Baseline and nonduplication audit

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Actual positive statements were read in the pinned Lean files:

| Items | Files and exact scope |
| --- | --- |
| 03 | Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean: WeierstrassCurve and b₂,b₄,b₆,b₈,Δ; not the specialized Frey discriminants |
| 46 | Mathlib/Combinatorics/Additive/Corner/Roth.lean, read completely: roth_3ap_theorem_nat and cornersTheoremBound; qualitative density threshold, not Rahman's numerical bound |
| 54 | TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean: HeckeRing.GL2.Newform and qExpansion_coeff_one; Hecke eigenconditions are initially away from the level |
| 66 | TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean, read completely: pointCount, frobeniusTrace and frobeniusTrace_eq_card_point; not Hasse |
| 70 | Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean: the actual definition and prime/prime-power values |
| 71,93,147 | Mathlib/NumberTheory/DirichletCharacter/Basic.lean and NumberTheory/MulChar/Basic.lean: conductor, primitivity, primitive inducing character, changeLevel recovery, quadratic values and product-conductor divisibility |
| 138 | Mathlib/NumberTheory/Chebyshev.lean: ordinary psi/theta definitions, not PNT or the sharp numerical estimates |

The nine “library” records count packages of already-existing infrastructure, not nine new formalization achievements. Readback hashes of the pinned Stirling and Tau Ceti Newform files matched the local baseline copies.

Near misses matter. Mathlib's theta upper bound is weaker than 1.000081x. Its psi-minus-theta asymptotic does not by itself give the paper's finite threshold. The Stirling file supplies a sharp successive-difference estimate and its limit, but not the packaged global upper bound in item 141: telescope and pass to the limit. Tau Ceti's quadratic twist equations/isomorphisms do not already prove the finite-field trace identity. Fundamental-discriminant arithmetic and prime-discriminant characters do not supply the full rational-squareclass/primitive-conductor classification. The FLT-four theorem is not the quartic descent \(T^4+V^4=2U^2\). The conditional PNT transfer does not discharge its own analytic hypotheses.

Reviewed coverage entries read include AUDIT-06 AN.2/AN.3/AN.5; SV.2; AUDIT-16 AC.2 and ModularForms Layers 8/8G; EllipticCurves Layer 3; AUDIT-09 CM.3/CM.4; and AUDIT-19 FF.1. They distinguish already-built character/point-count infrastructure from missing Hasse, supersingularity, coefficient fields, zero-free regions, explicit formulas and large-sieve estimates. Broad stage scope was not treated as evidence that a particular new numerical inequality was already a target.

Roadmap descriptions were read for the actual suppliers: ArithmeticDirichletSeries, EllipticCurveModularity, SerreWeightAndLevelOptimisation, AnalyticNumberTheory, SieveMethodsAndPrimePatterns, FiniteFieldsAndCharacterSums, EffectiveDiophantineMethods, ComplexMultiplicationAndExplicitReciprocity, and relevant EllipticCurves/ModularForms layers. At least two relevant upstream documents were read in full. Searches also covered new roadmap definitions, packets, reviewed decompositions, reserved IDs and link ownership. The ClassicalSerreModularity decomposition mentions a Rosser–Schoenfeld consecutive-prime ratio, but does not own the precise estimates extracted here. EllipticCurves' existing Kraus theorem is a different, integral-model theorem.

The atlas has no existing Frey/progression, short smooth-modulus or Legendre-character continuation matching these targets. Accepted elliptic-link ownership is respected: no scheme geometry is inserted into the equation-level elliptic roadmap. Retired FoundationsAndLibraryIntegration and a merely conceptual “ZerosOfLFunctions” name are not used as suppliers.

## Why the nine routes

The JSON contains the exhaustive per-item assignments and design briefs.

1. **SerreWeightAndLevelOptimisation, source:** reduced-level and removed-prime comparison contracts belong to R20.2–R20.4/R20.6. The progression-specific coefficient-prime adapter remains local (150).
2. **AnalyticNumberTheory, source:** generic character/conductor, zero-free, density, explicit-formula, prime-count, divisor and numerical summation inputs. The progression-specific mu bound (64) stays in the application, consuming generic Euler-product item 151; this prevents a dependency back from the analytic supplier.
3. **SieveMethodsAndPrimePatterns, source:** the finite Gram/duality inequality of item 45 belongs to SV.2.
4. **AdditiveCombinatorics, source:** only the stronger numerical Roth threshold is new. The library's existing qualitative theorem is reused.
5. **ComplexMultiplicationAndExplicitReciprocity, source:** CM.4 supplies the finite residual Cartan-normalizer adapter; CM.3 already plans singular-modulus integrality.
6. **EllipticCurveModularity, Part II — effective residual comparisons:** Kraus's threshold/realization, Martin's sharp dimension bound, uniform two-torsion irreducibility consequences and Lemos's restricted uniformity theorem. This extends the parent's qualitative modularity; it does not prove modularity again.
7. **EllipticCurves, Part II — Legendre models, descent and character interfaces:** generic Legendre normalization, finite-field coordinate descent, explicit torsion tests and twist trace. These are not the parent's global Selmer or pointed-twist classification.
8. **SieveMethodsAndPrimePatterns, Part II — short sums at smooth moduli:** individual Graham–Ringrose-type bounds, conductor bookkeeping, CRT packing and product-character cancellation. A large-sieve average alone does not state this theorem.
9. **New ErdosProgressionPowers:** precisely the progression-specific modular method and its two endgames. The maintainer's arithmetic-geometric emphasis is preserved. EffectiveDiophantineMethods' certified algorithms do not already plan this finiteness/large-exponent contradiction.

The new application imports all the reusable results. Its generic suppliers do not import its final theorem, hypothetical progression solution or chosen Frey family. The source routes add exact contracts to proposed layers; they are not claimed as existing implementations. New/Part II IDs are proposals, not existing atlas stages.

## Corrections and proof obligations

These distinctions are mandatory for downstream design. A numerical or algebraic diagnostic is not a Lean proof.

### D1. The first discriminant

For \(y^2=x(x-a)(x+c)\), \(a+b+c=0\), the pinned convention gives
\[
\Delta=16(abc)^2,\qquad c_4=16(a^2-bc).
\]
The printed \(64(abc)^2\) on p.361 is false; the progression-coordinate factor is \(2^6/g^6\), not \(2^8/g^6\). Odd valuations are unaffected. This does not change the general \(v_2(N_E)\leq8\) conductor bound or provide a false minimal-discriminant identity at 2.

### D2–D3. Divisors, modulus and conductor

The universal printed \(\tau(q)\leq q^{1/\log\log(3q)}\) is false: q=120 gives 16 on the left and about 14.89 on the right. Use effective eventual subpower bounds; they suffice for §§8 and 12.

For the product of distinct primitive quadratic characters, set \(M=\operatorname{lcm}(N_1,N_2)\), let eta be the primitive inducing character of conductor M1, and let M2 be the product of primes dividing M but not M1. Then
\[
\chi_1(m)\chi_2(m)=\eta(m)1_{(m,M_2)=1},\quad
(M_1,M_2)=1,\quad M_1M_2\mid M,\quad M_2\mid\gcd(N_1,N_2).
\]
M is not necessarily the primitive conductor. The characters of discriminants 8 and -8 multiply to the primitive character of conductor 4, while the ambient modulus is 8. Nor is \(M=M_1M_2\) generally true at 2.

### D4–D6. Signs and addendum divisibility

The factorization with positive Ai and signed yi uses odd ell; it is not valid unchanged for negative terms and even exponent. Ai contains all powers of primes below k, not merely their ell-power-free residues.

A residue-class count is at most k/r+1, even for r>k. In §12 sum the +1 terms: with q<=k^4 and \(\tau(q)\ll q^{1/12}\), their total is \(O(k^{1/3}(\log k)^{61})\), negligible against \(k/(\log k)^{1/4}\).

Only \(N_a^{odd}\mid A_iA_jA_h\) is justified, not equality with the largest odd squarefree divisor. Together with \(N_a\leq8N_a^{odd}\), this gives the product-of-gcd lower bound needed by the addendum.

### D7–D9. Constants and endpoints

The Gram contradiction compares \(1/68<0.1239^2\). The paper first sets its symbol to \(0.1239^2\), then squares it again in the printed last comparison. The latter inequality is false.

Proposition 9.1 excludes an open-left prime interval. Keep that endpoint in the maximal-family construction. For the remaining conductors use \(P(N)\leq(\log k)^{1-10^{-4}}\) and apply Proposition 7.2 with c1=1/20000, giving the strict inequality it requires.

For general \(0<c_1<1\), the quoted PNT denominator gives decay exponent \(\min(c_1,1/2)\), not c1 throughout. The actual small c1 used in §10 is unaffected.

### D10. The addendum explicit formula

Restore the zero-height restriction in Landau–Page, and require a primitive **nonprincipal** character in Proposition 12.2. Keep T, not a stray Q, as the truncation height. Uniformly bounding \(\sum1/|\rho|\) is unsafe near a zero approaching 0.

Subtract the two explicit formulas first. A zero contributes
\[
\frac{k^\rho-(k/2)^\rho}{\rho}
 =\int_{k/2}^k t^{\rho-1}\,dt,
\]
whose absolute value is at most \(Ck^\beta\min(1,1/|\rho|)\). Local zero counting bounds the sum of the latter weights by \(O(\log^2(q(T+2)))\). Constants independent of x cancel; endpoint and parity terms must be carried explicitly. Outside Q(k), \(k^\beta\leq k/\log^3 k\). For q<=k^4 and the chosen T this yields \(O(k/\log k)\), including the truncation error. The exact original explicit-formula proof/edition still has to be obtained before blueprint execution; item 139 states the required repaired interface, not a claim of library availability.

### D11–D14. Other essential interfaces

In §4 use the original index range 0,...,k-1. For the two-term case, p is in (k/2,k], not necessarily >=k as in Lemma 3.4. Directly use
\(c_4=16\kappa(4\kappa d^2-3A)\): p divides A but not \(\kappa dB\), hence c4 is a p-unit and the positive discriminant valuation is divisible by ell. This supplies the actual local hypothesis (136).

The sieve excludes primes **greater than** \(k^{7/16}\), not greater than or equal to it. Keep the weak largest-prime bound.

The PNT input is used only for nonprincipal conductor N>1. The displayed principal N=1 formula with a factor \((\log N)^4\) would have zero error and must not be exported.

In Theorem 6 the later factors may be principal of nontrivial modulus; “modulus” cannot be replaced by “conductor.” Handle M2=1 explicitly and discard modulus-one CRT factors. A weakened packing bound \(r\leq\lceil10c_2\rceil+4\) suffices for an effective positive cancellation exponent.

### D15. Correct the order-four point

The printed second coordinate on p.371 fails even at p=5, t=v=2, i=3, lambda=3: it gives (x,y)=(4,4), but \(y^2=1\) and \(x(x-2)(x-2\lambda)=4\) in F5.

A valid replacement is
\[
P=(4itv+2\lambda,\;8itv(t+iv)).
\]
Put r=2t and s=2iv; then \(r^2=2\lambda\), \(s^2=2\lambda-2\). The standard halving formulas give \(x=r^2+rs\), \(y=rs(r+s)\), so membership and \(2P=(2\lambda,0)\) follow directly. Here t+iv cannot vanish because \(t^2+v^2=1/2\). The third descent coordinate remains 4itv, so the subsequent argument is unchanged. Exact modular tests checked all such t,v and both roots i for primes below 200: 2,504 membership/doubling cases passed.

### D16. The printed Roth comparison fails

The quoted threshold gives
\[
\log\log K_0(10^{-5})=132\log(2)\,10^5
 \approx9.1495\,10^6>10^6.
\]
Thus the claimed comparison on p.384 does not follow. Item 47 preserves the literal Proposition 9.1 statement and marks this proof gap. Item 149 supplies the same four simultaneous conclusions at the sufficient threshold \(\exp(\exp(10^7))\). All preceding estimates still hold, and the quoted Roth bound now applies. The main theorem has an unspecified effective k0, so its target is unchanged. No claim is made that the sharper proposition is false; only that the supplied numerical argument fails.

## Two short quantitative repairs

Let \(L=\log k\), y=\(k^{7/16}\), and \(S(x)=\sum_{p\leq x}\log p/p\). Rosser–Schoenfeld Theorem 6 gives
\[
S(k)-S(y)>\frac9{16}L-\frac{23}{14L}.
\]
Therefore
\[
\sum_{y<p\leq k}v_p((k-1)!)\log p
 \geq(k-1)(S(k)-S(y))-\theta(k)
 >\frac9{16}kL-5k
\]
at the working threshold: the loss is bounded by
\(9L/16+23(k-1)/(14L)+1.000081k<5k\).
Combined with explicit Stirling this gives the paper's \(k^{.44k}\) bound. No unspecified O(1) is used to justify a fixed constant.

For the character margin, it suffices to discard the nonnegative lower-end prime-power mass and bound
\[
\psi(k)-\theta(k)
 \leq1.000081\left(\sqrt{k}+\frac{\log k}{\log2}k^{1/3}\right).
\]
After division by k the terms decrease for k>=2*10^10. At the left endpoint, use \(\sqrt{k}>140000\), \(k^{2/3}>7000000\), and \(\log_2 k<35\); the resulting bound is less than .000013. The available margin is exactly
\((1-3(.002811))/8-.1239=.000045875\).
This proves item 79 without assuming the uninspected sharper prime-power theorem. These are mathematical inequalities; the scratch tests only check their numerical arithmetic.

## A simultaneous addendum witness

The final paragraph of the paper needs one triple with both avoidance and small conductor. Here is an explicit proof, not an assertion that two independent choices coincide.

First prove the Erdős deletion lemma. For each p<k dividing some Ai in J, choose an index ip of maximum p-valuation. For every other i,
\(v_p(A_i)\leq v_p(i-i_p)\), because p cannot divide d and the difference of the progression terms is (i-ip)d. Summing these valuations gives at most
\(v_p(i_p!)+v_p((k-1-i_p)!)\leq v_p((k-1)!)\).
Deleting at most pi(k) indices therefore leaves a product dividing (k-1)!.

Delete additionally the exceptional indices of Proposition 12.3. In the original partition into consecutive disjoint triples (0,1,2), (3,4,5), ..., at most one block per deleted index is lost. Effectively for all sufficiently large k, more than 2k/7 blocks survive. Their combined Ai-product divides (k-1)!, so the sum of their logarithmic products is at most k log k. One surviving block has product at most \(k^{7/2}\), whence \(N_a\leq8k^{7/2}\leq k^4\) for k>=64.

It is the same surviving block that avoids all bad indices. If its conductor were in Q(k), odd-conductor divisibility would force one of the three gcds to be at least \(N_a^{1/3}/2\), making that index bad. This contradiction supplies items 125–127. It uses neither Roth nor short smooth-modulus sums, but still imports the common Frey/character construction, explicit formula and effective exceptional-set estimates.

## Design preparation and tests

Every new definition/construction must receive an API and unit tests in its eventual blueprint: projection and nonzero lemmas for solutions; signed factorization uniqueness/support/valuation APIs; bounds and membership for indexed triples/quadruples; normalization and singular-parameter rejection for Legendre models; conductor/change-level and nonunit-zero identities for characters; endpoint and membership lemmas for sieve/exceptional sets; and simultaneous projections from each selected witness. No downstream proof may unfold an unexplained object or assume that independent witnesses agree.

Priority proof-preparation tasks are: the rational-isogeny consequences in 59–60; the weight/conductor bridge 150; original Kraus/Martin/Lemos proof trees; the quartic descent in 81; the exact IK/Graham–Ringrose/Rahman sources; computational certificates behind Platt, BMOR and Ramaré–Rumely; and the corrected explicit formula. Platt's bounded-height GRH alone permits a real zero at 1/2, so Theorem 7.2's separate nonvanishing is essential. No computational certificate was rerun or checked in Lean.

Checks performed:

- The paper checker reports no errors.
- Every missing item is assigned exactly once; new/Part II names and galaxy IDs were checked; no baseline/planned item is assigned to a new roadmap.
- Exact-integer tests cover 552 first-Frey and 3,971 second-Frey discriminant specializations.
- Exact finite-field tests cover the corrected order-four coordinates and j=1728 point-count assertions at primes below 200.
- Arithmetic regressions cover the false divisor estimate, corrected Gram margin, prime-power margin, density estimates, failed/corrected Roth threshold and finite small-conductor prime-product checks.
- Relevant atlas inputs were compared against current main; no mathematical ownership change was found in the intervening commits.

These tests are diagnostics, not proof certificates. No Lean file belongs to this paper job; Lean compilation is not applicable. The next independent review should particularly challenge the repairs, exact uniformity hypotheses, source-threshold distinction and boundaries of the three proposed continuations.

## Corrections by the independent review

The independent review (REV-PAPER-BENNETT-SIKSEK-20, `research/blueprint/reviews/REV-PAPER-BENNETT-SIKSEK-20.md`) accepted this extraction and corrected the JSON in place:

- **Items:** item 86 split, with its conductor bound now new item 152; items 33 (Tau Ceti `WeierstrassCurve.Affine.μ`) and 73 (RankZeroOneBSD BSD.0) are no longer missing; item 61 is missing rather than planned; item 06 now cites R19.1.
- **Route 2:** retargeted to AN.2, AN.3 and AN.5 after the accepted restructure RS-07.
- **Route 8:** now a source of ExponentialSumsAndCircleMethod ES.0 instead of a Part II.
- **Routes 10–12:** new source routes to ClassicalArithmeticCompletion, ComputationalNumberTheory and ArithmeticGaloisRepresentations R01.3.

Where the text above counts items or routes, the corrected JSON is authoritative. It has 152 items (11 library, 12 planned, 129 missing), nine source routes, two Part II continuations and one new roadmap.
