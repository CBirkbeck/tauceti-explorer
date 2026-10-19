# Rank-zero and rank-one BSD, BSD.9: comparison tests and public endpoints

This document plans stage BSD.9 of RankZeroOneBSD, *Reusable comparison tests and endpoint signatures*. It continues
the accepted packet `RankZeroOneBSD--BSD.7`, whose thirty BSD.9 declarations (the 11a3, 37a1 and 32a2 models and
points, the Mellin formulas with explicit tails, the dyadic gate and the four example applications) stay as they are;
this document cites them by id. It adds twenty declarations. Nothing here is claimed formalised.

## What the stage asks, and how it is read

BSD.9 asks for four separate public signatures (rank equality, finite Ш, a fixed-prime formula, the full formula under
a complete certificate); tests on rank-zero and rank-one curves, a CM curve, a nonsemistable curve and a curve with a
rational p-isogeny, with every source's side conditions proved before its theorem is applied; a Mellin or
modular-symbol expression for the central value or derivative with rigorous error bounds, kept apart from the
arithmetic descent; verified height, period and torsion conventions; and a negative test in which an unproved 2-part
blocks only the full formula.

The parent packet left one item: to supply and replay the interval enclosures and the finite descent, local, period,
saturation and Ш certificates of the three test curves. On 2026-10-16 the maintainer dropped ComputationalNumberTheory
CN.4 and ruled that explicit modular-curve and 32a2 data become hypotheses of the final theorems, with no computation
as a target (`research/blueprint/upstream/drops.json`; the instructions of FIX-PKG-RankZeroOneBSD~adv2). This
follow-up therefore plans the general theorems that those replays would use, and restates the applications with every
numerical and descent datum as a hypothesis. The parent's two computation targets, `analytic-fixture-enclosures` (the
only BSD.9 declaration resting on CN.4) and `fixture-finite-arithmetic`, are superseded; three others keep their
statements with their computational inputs turned into hypotheses. The packet records each disposition
(`inheritedTargets`, `supersededNodes`, `partiallyRestatedNodes`) and the edges an assembly applies
(`refinementEdges`).

## Conventions

- E is an elliptic curve over ℚ given by a Weierstrass equation; a_n = `E.LFunction n` is Mathlib's coefficient
  (local factor 1 − a_pT + pT² at good p, 1 − T, 1 + T, 1 at split, nonsplit and additive p).
- `ellipticL E` is BSD.0's entire continuation of the L-series, `rootNumber E` the sign of its functional equation,
  `analyticRank E` its order at s = 1 and `leadingTerm E` the leading Taylor coefficient. A formal Dirichlet series
  evaluated at s = 1 is never used.
- Ω_E is the full real Néron period (both real components when Δ > 0), equal to EllipticCurves Layer 7's integral
  2∫_{D_W>0} dx/√D_W (GZ.0). Reg_BSD is the regulator of the x-height ĥ(P) = lim h(x(nP))/n², which is upstream's
  current normalisation and twice the pinned Tau Ceti height; in rank r the two regulators differ by 2^r.
- bsdDefect E = leadingTerm E·#E(ℚ)_tors²/(Ω_E·Reg_BSD·#Ш(E/ℚ)·∏c_ℓ) ∈ ℚ_{>0} (BSD.5) for analyticRank E ≤ 1; the
  full formula is bsdDefect E = 1 and its p-part is v_p(bsdDefect E) = 0.
- E₁(x) = ∫_x^∞ e^{−t}t^{−1}dt is the incomplete gamma function Γ(0, x) of QSeriesPartitionsAndMockModularForms QM.3.
- With β = 2π/√N and ρ = e^{−β}: S₀(M) = 2Σ_{n≤M}(a_n/n)e^{−βn}, S₁(M) = 2Σ_{n≤M}(a_n/n)E₁(βn),
  T₀(M) = 4ρ^{M+1}/(1−ρ), T₁(M) = 4ρ^{M+1}/(β(M+1)(1−ρ)).
- The test curves are 11a3: y² + y = x³ − x² (Δ = −11), 37a1: y² + y = x³ − x (Δ = 37) and 32a2: y² = x³ − x
  (Δ = 64, j = 1728). Their L-function coefficients from point counts begin a_2, a_3, a_5, a_7 = −2, −1, 1, −2 (11a3),
  −2, −3, −2, −1 (37a1) and 0, 0, −2, 0 (32a2); a_11(11a3) = 1 (split) and a_37(37a1) = −1 (nonsplit).

## Public endpoints

The stage asks for four separate public signatures. Rank equality and finiteness of Ш hold for every curve of analytic rank at most one and take no other input; the p-part is a named proposition with one public declaration per source branch; the full formula needs a complete certificate. The comparison node shows that these are the conclusions of the statement-only BSD milestone of EllipticCurves Layer 7, read with the roadmap's own L-function and regulator.

<a id="prime-part-formula"></a>
### The p-part of the Birch–Swinnerton-Dyer formula

`RankZeroOneBSD:BSD.9/prime-part-formula` · definition · planet: “p-part of the BSD formula”

For an elliptic curve E/ℚ with h : analyticRank E ≤ 1 and a natural prime p, PrimePartFormula E h p is the proposition padicValRat p (bsdDefect E) = 0, where bsdDefect E ∈ ℚ_{>0} is the rational BSD defect of BSD.5 (leading term times #E(ℚ)_tors² divided by Ω_E·Reg_BSD(E/ℚ)·#Ш(E/ℚ)·∏_ℓ c_ℓ(E)). Unfolded, it says v_p(L\*/(Ω_E Reg_BSD)) = v_p(∏_ℓ c_ℓ(E)) + v_p(#Ш(E/ℚ)) − 2·v_p(#E(ℚ)_tors), where L\*/(Ω_E Reg_BSD) is the positive rational number of BSD.5 and L\* = leadingTerm E. It concerns one prime only: it is not the full formula, and at p = 2 it depends on using Reg_BSD (the x-height normalisation) rather than the pinned halved regulator.

**Hypotheses.**

- E/ℚ is elliptic and analyticRank E ≤ 1, so that bsdDefect E is defined and Ш(E/ℚ) is finite (BSD.4).
- p is a natural prime; the regulator is GZ.0's Reg_BSD and the period is the full real Néron period.

**Proof sketch.**

- Define the proposition by the valuation of BSD.5's bsdDefect; no new arithmetic object is introduced.
- Unfold with padicValRat.mul, padicValRat.div and padicValRat.pow, using that every factor of the defect is a nonzero rational (positivity from BSD.5/leading-term-positivity, finiteness from BSD.4); this gives the valuation identity and its equivalence with the printed form of Keller–Yin Theorem C and CGS Theorem D, since v_p(#Ш(E/ℚ)) = v_p(#Ш(E/ℚ)[p^∞]).
- Isogeny invariance: BSD.5/defect-isogeny-invariance gives equal defects for ℚ-isogenous curves.
- Full formula: positive-rational-reconstruction (BSD.8) gives (∀ p prime, PrimePartFormula E h p) ↔ bsdDefect E = 1.

**Sources.**

- [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/pdf/2402.12781v2), Theorem C, p.5; Theorem 4.2.1, p.42: The p-part of BSD is printed as an equality of p-adic valuations of L\*/(Ω Reg) and of Tam·#Ш[p^∞]/#tors²; the definition is that equality, transported to the rational defect.
- [Mazur's main conjecture at Eisenstein primes](https://arxiv.org/pdf/2303.04373v2), Theorem D, pp.4–5: The same p-adic valuation identity, with the Néron period over all of E(ℝ) and without a torsion term because the local exclusion makes the torsion order prime to p.
- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, first paragraph: A fixed-prime leading-term formula is one of the four separate public signatures.

*Needs:* `RankZeroOneBSD:BSD.5/rational-bsd-defect` (The rational BSD defect); `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem` (Analytic rank at most one: rank equals analytic rank and Sha is finite); `RankZeroOneBSD:BSD.5/defect-isogeny-invariance` (Isogeny invariance of the rational BSD defect); `RankZeroOneBSD:BSD.5/leading-term-positivity` (Positivity of the leading term in analytic rank at most one); `RankZeroOneBSD:BSD.8/positive-rational-reconstruction` (Reconstruction of a positive rational from all prime valuations); `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator` (The BSD regulator, and Tau Ceti's regulator); Mathlib `padicValRat`; Mathlib `padicValRat.mul`; Mathlib `padicValRat.div`; Mathlib `padicValRat.pow`.

**Uses.**

- RankZeroOneBSD BSD.6 and BSD.7 branch theorems: each concludes v_p(bsdDefect E) = 0 for one named range of primes; the public fixed-prime endpoint restates these conclusions as PrimePartFormula.
- RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch: dispatches a prime to the branch whose hypotheses it satisfies.
- Keller–Yin Theorem C; CGS Theorem D: the printed conclusions are this proposition.
- PeriodsAndSpecialValues (consumer named in the roadmap's handoff): re-exports named p-part results separately from rank equality and the full formula.

**API.**

- `WeierstrassCurve.BSD.PrimePartFormula` (data): PrimePartFormula E h p :⇔ padicValRat p (bsdDefect E) = 0, for h : analyticRank E ≤ 1 and p prime.
- `WeierstrassCurve.BSD.primePartFormula_iff_valuation` (characterisation): PrimePartFormula E h p ↔ v_p(L\*/(Ω_E Reg_BSD)) = v_p(∏c_ℓ) + v_p(#Ш(E/ℚ)) − 2·v_p(#E(ℚ)_tors).
- `WeierstrassCurve.BSD.primePartFormula_iff_primary` (compatibility): PrimePartFormula E h p ↔ v_p(L\*/(Ω_E Reg_BSD)) = v_p(Tam(E)·#Ш(E/ℚ)[p^∞]/#E(ℚ)_tors²), the form printed by Keller–Yin Theorem C and, for p prime to the torsion, CGS Theorem D.
- `WeierstrassCurve.BSD.primePartFormula_of_isogenous` (functoriality): If E and E′ are ℚ-isogenous then PrimePartFormula E h p ↔ PrimePartFormula E′ h′ p.
- `WeierstrassCurve.BSD.forall_primePartFormula_iff` (characterisation): (∀ p prime, PrimePartFormula E h p) ↔ bsdDefect E = 1.
- `WeierstrassCurve.BSD.primePartFormula_of_bsdDefect_eq_one` (simp): bsdDefect E = 1 → PrimePartFormula E h p for every prime p.

**Unit tests.**

- `WeierstrassCurve.BSD.primePartFormula_test_torsion_square` (computation): If L\*/(Ω_E Reg_BSD) = 1/25, #E(ℚ)_tors = 5, ∏c_ℓ = 1 and #Ш(E/ℚ) = 1 (the 11a3 data), then PrimePartFormula E h 5 holds: −2 = 0 + 0 − 2. With #tors instead of #tors² the two sides would be −2 and −1.
- `WeierstrassCurve.BSD.primePartFormula_test_away_from_support` (degenerate): If p divides neither numerator nor denominator of L\*/(Ω_E Reg_BSD) and divides none of ∏c_ℓ, #Ш(E/ℚ), #E(ℚ)_tors, then PrimePartFormula E h p holds.
- `WeierstrassCurve.BSD.primePartFormula_test_odd_not_full` (non-example): The positive rational 2 has valuation zero at every odd prime and valuation one at 2: a proposition defined as 'the defect is a 2-power' or 'all odd p-parts hold' is strictly weaker than bsdDefect E = 1.
- `WeierstrassCurve.BSD.primePartFormula_test_ky_form` (compatibility): primePartFormula_iff_primary: the definition agrees with the printed Keller–Yin identity, in which #Ш[p^∞] replaces #Ш.
- `WeierstrassCurve.BSD.primePartFormula_test_dyadic_regulator` (non-example): In rank one, replacing Reg_BSD by the pinned regulator (half of it) changes v_2 of the left side by one and leaves every odd valuation unchanged; the dyadic formula must use Reg_BSD.

**Checks.**

- The torsion order enters squared: a definition with #E(ℚ)_tors to the first power fails the 11a3 data check.
- The statement at all odd primes does not imply the statement at 2 (dyadic-gate countermodels).

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="ec-bsd-statement-compatibility"></a>
### The roadmap's L-function, rank and quotient against the EllipticCurves BSD statement

`RankZeroOneBSD:BSD.9/ec-bsd-statement-compatibility` · comparison

Let E/ℚ be elliptic. (i) ellipticL E is entire and equals E.LSeries on Re s > 3/2, so it is an admissible analytic hypothesis of the statement-only Birch–Swinnerton-Dyer milestone of EllipticCurves Layer 7 (an analytic function on a connected open set containing s = 1 and part of the half-plane of convergence, agreeing with the actual Dirichlet series there). (ii) Every admissible continuation G on a connected open set U equals ellipticL E on U, so the order of vanishing and the leading coefficient L^{(r)}(1)/r! of that statement are analyticRank E and leadingTerm E. (iii) If analyticRank E ≤ 1, BSD.4 discharges the statement's finiteness hypothesis on Ш(E/ℚ); the statement's quotient Ω(E)·Reg(E/ℚ)·#Ш·∏_p c_p/#E(ℚ)_tors², with Layer 7's explicit-integral period and Layer 6's x-height regulator, is the denominator Ω_E·Reg_BSD·#Ш·∏c_ℓ/#tors² of BSD.5's defect. Hence the statement's rank equality holds for E, and its leading-coefficient identity holds if and only if bsdDefect E = 1.

**Hypotheses.**

- E/ℚ elliptic; (iii) assumes analyticRank E ≤ 1.
- Normalisation: Layer 6 of current EllipticCurves fixes ĥ(P) = lim h(x(nP))/n², whose regulator is Reg_BSD. At the Tau Ceti pin f790474 the canonical height is half of that; a statement instantiated with the pinned regulator differs by the factor 2^r (GZ.0/height-convention-dictionary).

**Proof sketch.**

- (i) BSD.0/actual-l-function: entire, and equal to E.LSeries for Re s > 3/2; that half-plane lies in the half-plane of absolute convergence, and ℂ is connected.
- (ii) On its half-plane of convergence the Dirichlet series is analytic and, by the identity theorem from Re s > 3/2, equals ellipticL E there. G agrees with the series on a nonempty open subset of U, so Mathlib's AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq gives G = ellipticL E on U; orders at 1 and iterated derivatives at 1 coincide.
- (iii) BSD.4/analytic-rank-at-most-one-theorem gives finiteness and the rank equality; GZ.0/real-period-components identifies Layer 7's integral 2∫_{D_W>0}dx/√D_W with the full Néron period; GZ.0/bsd-regulator identifies the x-height regulator with Reg_BSD; compare with the definition of bsdDefect.

**Sources.**

- [Roadmap: elliptic curves (TauCetiRoadmap EllipticCurves README)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/34dcf0e2b60d68a705742ee408e5392ddabbd00a/TauCetiRoadmap/EllipticCurves/README.md), Layer 7, the stretch item on the BSD quotient and the statement-only milestone: The upstream statement fixes the analytic hypothesis as a continuation of the actual Dirichlet series on a connected open set and the quotient with the explicit-integral period; this node shows the roadmap's objects meet it.
- [Roadmap: elliptic curves (TauCetiRoadmap EllipticCurves README)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/34dcf0e2b60d68a705742ee408e5392ddabbd00a/TauCetiRoadmap/EllipticCurves/README.md), Layer 6, the canonical-height milestone: Upstream pins ĥ(P) = lim h(x(nP))/n² and states the regulator and BSD quotient against it.
- [Uniqueness of analytic continuation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Analytic/Uniqueness.lean), AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq: Two analytic functions on a preconnected open set that agree near one point agree everywhere on it.

*Needs:* `RankZeroOneBSD:BSD.0/actual-l-function` (The actual L-function of an elliptic curve over ℚ); `RankZeroOneBSD:BSD.0/analytic-rank` (Analytic rank and the leading coefficient at s = 1); `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem` (Analytic rank at most one: rank equals analytic rank and Sha is finite); `RankZeroOneBSD:BSD.5/rational-bsd-defect` (The rational BSD defect); `GrossZagierAndArithmeticHeights:GZ.0/real-period-components` (Full real period, identity-component period and c∞); `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator` (The BSD regulator, and Tau Ceti's regulator); `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary` (The dictionary of height conventions); Mathlib `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`; TauCetiRoadmap EllipticCurves Layer 6; TauCetiRoadmap EllipticCurves Layer 7.

**Checks.**

- An arbitrary analytic germ at s = 1 is not admissible: two germs can differ while only ellipticL E agrees with the Dirichlet series.
- Counting c∞ again on top of Layer 7's period would divide the quotient by 2 on curves with Δ > 0.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="public-rank-endpoint"></a>
### Public endpoint: rank equals analytic rank

`RankZeroOneBSD:BSD.9/public-rank-endpoint` · application

For every elliptic curve E/ℚ with analyticRank E ≤ 1, Module.finrank ℤ (E(ℚ)/E(ℚ)_tors) = analyticRank E; equivalently the rank-equality conclusion of EllipticCurves Layer 7's BSD statement holds for E. The declaration takes no hypothesis on Ш, Tamagawa numbers, periods, torsion, Heegner indices or prime-valuation certificates.

**Hypotheses.**

- E/ℚ elliptic with analyticRank E ≤ 1; nothing else.

**Proof sketch.**

- Apply BSD.4/analytic-rank-at-most-one-theorem and read it through ec-bsd-statement-compatibility (ii).

**Sources.**

- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, first paragraph: Analytic-rank equality is a separate public signature.

*Needs:* `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem` (Analytic rank at most one: rank equals analytic rank and Sha is finite); [The roadmap's L-function, rank and quotient against the EllipticCurves BSD statement](#ec-bsd-statement-compatibility) (`ec-bsd-statement-compatibility`); Tau Ceti `WeierstrassCurve.Affine.PointModTorsion`; Mathlib `Module.finrank`.

**Checks.**

- A missing dyadic or other exceptional prime-part input leaves this endpoint unchanged (dyadic-branch-exclusion).
- With root number −1 and L′(E,1) > 0 (the 37a1 data) it gives rank one; with L(E,1) > 0 it gives rank zero.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="public-sha-endpoint"></a>
### Public endpoint: Ш is finite

`RankZeroOneBSD:BSD.9/public-sha-endpoint` · application

For every elliptic curve E/ℚ with analyticRank E ≤ 1, the whole group Ш(E/ℚ) is finite; so EllipticCurves Layer 7's BSD quotient of E is defined without its finiteness hypothesis. The conclusion contains no cardinality, exponent or annihilator of Ш.

**Hypotheses.**

- E/ℚ elliptic with analyticRank E ≤ 1; nothing else.

**Proof sketch.**

- Apply the finiteness half of BSD.4/analytic-rank-at-most-one-theorem; ec-bsd-statement-compatibility (iii) identifies the group with Layer 7's Ш.

**Sources.**

- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, first paragraph: Finite Sha is a separate public signature.

*Needs:* `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem` (Analytic rank at most one: rank equals analytic rank and Sha is finite); [The roadmap's L-function, rank and quotient against the EllipticCurves BSD statement](#ec-bsd-statement-compatibility) (`ec-bsd-statement-compatibility`); TauCetiRoadmap EllipticCurves Layer 7.

**Checks.**

- The endpoint does not supply #Ш: exact orders need the separate arguments of odd-sha-from-heegner-index, a prime-part formula or a descent hypothesis.
- A missing dyadic input leaves this endpoint unchanged.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="public-fixed-prime-endpoint"></a>
### Public endpoint: the formula at one prime

`RankZeroOneBSD:BSD.9/public-fixed-prime-endpoint` · application

Let E/ℚ be elliptic with h : analyticRank E ≤ 1 and p prime. Each of the following, with exactly the hypotheses of its node, proves PrimePartFormula E h p: the rank-zero ordinary/multiplicative branch, the rank-zero supersingular branch, the Jetchev–Skinner–Wan rank-one branch, Castella's Theorem A′ and the BSTW rank-one branch (BSD.6), the Castella–Grossi–Skinner and Keller–Yin good Eisenstein branches (BSD.7), and an exceptional-prime computation of v_p(bsdDefect E) (BSD.8). There is one public declaration per branch; no public signature takes a disjunction of branches whose hypotheses could be discharged by an unproved claim that p is good, large or irreducible.

**Hypotheses.**

- E/ℚ elliptic, analyticRank E ≤ 1, p prime, plus the full hypothesis list of the chosen branch.

**Proof sketch.**

- For each branch, compose its conclusion v_p(bsdDefect E) = 0 with the definition of PrimePartFormula.
- The dispatch BSD.8/source-qualified-prime-part-dispatch already proves the conclusion branch by branch; this node fixes the public names and signatures.

**Sources.**

- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, first paragraph: A fixed-prime leading-term formula is a separate public signature, and each source's side conditions are proved before its theorem is applied.

*Needs:* [The p-part of the Birch–Swinnerton-Dyer formula](#prime-part-formula) (`prime-part-formula`); `RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch` (Source-qualified fixed-prime dispatch); `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part` (The p-part of BSD in rank zero at ordinary and multiplicative primes (Skinner–Urban, Skinner)); `RankZeroOneBSD:BSD.6/rank-zero-supersingular-p-part` (The p-part of BSD in rank zero at supersingular primes); `RankZeroOneBSD:BSD.6/jsw-rank-one-p-part` (The p-part of BSD in analytic rank one (Jetchev–Skinner–Wan)); `RankZeroOneBSD:BSD.6/castella-multiplicative-rank-one-p-part` (The p-part of BSD at multiplicative primes in analytic rank one (Castella's corrected Theorem A′)); `RankZeroOneBSD:BSD.6/bstw-rank-one-p-part` (BSTW supersingular rank-one p-part); `RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd` (CGS good Eisenstein prime-part BSD); `RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd` (Keller–Yin good Eisenstein prime-part BSD); `RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter` (Exceptional-prime leading-term certificate adapter).

**Checks.**

- At p = 2 none of the seven named branches applies (dyadic-branch-exclusion).
- On curves with rational p-torsion at a good odd p only the Keller–Yin branch applies at p (rational-torsion-eisenstein-ordinary).

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="public-full-endpoint"></a>
### Public endpoint: the full leading-term formula from a complete certificate

`RankZeroOneBSD:BSD.9/public-full-endpoint` · application

Let E/ℚ be elliptic with h : analyticRank E ≤ 1, and let c be a Rat.PrimeValuationCertificate for bsdDefect E. Then both conclusions of EllipticCurves Layer 7's BSD statement hold for E: the rank equality and the identity leadingTerm E = Ω_E·Reg_BSD(E/ℚ)·#Ш(E/ℚ)·∏_ℓ c_ℓ(E)/#E(ℚ)_tors². Equivalently PrimePartFormula E h p for every prime p.

**Hypotheses.**

- E/ℚ elliptic, analyticRank E ≤ 1, a complete finite certificate for the actual defect.

**Proof sketch.**

- BSD.8/elliptic-endpoint gives the real identity; ec-bsd-statement-compatibility (iii) identifies it with Layer 7's leading-coefficient identity; public-rank-endpoint gives the other conclusion.
- BSD.8/certificate-all-primes gives v_p(bsdDefect E) = 0 at every prime, i.e. the equivalent form.

**Sources.**

- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, first paragraph; BSD.8: The full leading-term formula is exposed only under a complete certificate.

*Needs:* [The roadmap's L-function, rank and quotient against the EllipticCurves BSD statement](#ec-bsd-statement-compatibility) (`ec-bsd-statement-compatibility`); [The p-part of the Birch–Swinnerton-Dyer formula](#prime-part-formula) (`prime-part-formula`); [Public endpoint: rank equals analytic rank](#public-rank-endpoint) (`public-rank-endpoint`); `RankZeroOneBSD:BSD.8/elliptic-endpoint` (Full leading term under the actual defect certificate); `RankZeroOneBSD:BSD.8/certificate-all-primes` (A finite certificate controls every prime).

**Checks.**

- The rank and Ш endpoints do not consume this one; deleting the certificate's dyadic entry blocks only this endpoint (missing-exception-fixture).
- With supplied data giving bsdDefect E = 1 exactly, the canonical certificate ofAllPrimes applies (conditional-full-formula).

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

## Analytic certificates as theorems

The parent packet stated the Mellin formulas with explicit tails (BSD.9/mellin-central-tail-bounds) and asked for replayed interval certificates for three curves. Under the maintainer's decision those replays are not targets. What is planned is the mathematics a replay uses: a coefficient bound, two-sided bounds and a series for the exponential integral, a criterion that turns one explicit finite-sum inequality into the analytic rank and an enclosure of the leading term, and Manin's closing-the-path formula, whose denominator turns an enclosure of L(E,1)/Ω_E into its exact rational value.

<a id="coefficient-bound"></a>
### Coefficient bound for the L-series of an elliptic curve

`RankZeroOneBSD:BSD.9/coefficient-bound` · lemma

For E/ℚ elliptic and every n ≥ 1, the coefficient a_n = E.LFunction n of Mathlib's formal Euler product satisfies |a_n| ≤ σ₀(n)·√n, where σ₀(n) is the number of divisors of n. Since σ₀(n) ≤ 2√n, also |a_n| ≤ 2n.

**Hypotheses.**

- E/ℚ elliptic; a_n is Mathlib's coefficient, defined through the minimal model and its reductions.

**Proof sketch.**

- The Euler product makes n ↦ a_n multiplicative, and σ₀ is multiplicative (Nat.Coprime.card_divisors_mul).
- Good p: the local factor is 1 − a_pT + pT²; with the roots α, β of X² − a_pX + p one has a_{p^k} = Σ_{i=0}^k α^iβ^{k−i}, and the Hasse bound |a_p| ≤ 2√p (EllipticCurves Layer 3) gives |α| = |β| = √p, so |a_{p^k}| ≤ (k+1)p^{k/2} = σ₀(p^k)p^{k/2} (ArithmeticFunction.sigma_zero_apply_prime_pow).
- Bad p: the local factor is 1 − T, 1 + T or 1, so a_{p^k} = a_p^k with a_p ∈ {1, −1, 0} and |a_{p^k}| ≤ 1.
- Multiply over the prime powers of n. For σ₀(n) ≤ 2√n pair each divisor d ≤ √n with n/d.

**Sources.**

- [The L-function of a Weierstrass curve](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean), WeierstrassCurve.localPolynomial and WeierstrassCurve.LFunction: The local polynomial is 1 − aT + qT² at good reduction and 1 − T, 1 + T, 1 at split, nonsplit and additive reduction; the L-function is the Euler product of their inverses.
- [Algorithms for Modular Elliptic Curves, Chapter II: Modular symbol algorithms](https://johncremona.github.io/book/fulltext/chapter2.pdf), §2.8, equation (2.8.3), p.29: The Dirichlet series of a rational newform has the Euler product with good and bad factors of this shape.
- [Arithmetic functions: σ and divisor counts](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/Misc.lean), sigma_zero_apply_prime_pow; Nat.Coprime.card_divisors_mul: σ₀(p^i) = i + 1 and σ₀ is multiplicative.

*Needs:* Mathlib `WeierstrassCurve.LFunction`; Mathlib `WeierstrassCurve.localPolynomial`; Mathlib `ArithmeticFunction.sigma`; Mathlib `ArithmeticFunction.sigma_zero_apply_prime_pow`; Mathlib `Nat.Coprime.card_divisors_mul`; TauCetiRoadmap EllipticCurves Layer 3.

**Checks.**

- Equality |a_p| = σ₀(p)√p is impossible for an integer a_p and p prime; the bound is attained only up to the Hasse slack (e.g. a_2 = −2 for 37a1, where 2√2 ≈ 2.83).
- The weaker |a_n| ≤ √n fails: a_2 = −2 for 11a3.

*Lean:* `WeierstrassCurve.BSD.abs_LFunction_le_sigma_mul_sqrt`, `abs_LFunction_le_two_mul` and `sigma_zero_le_two_mul_sqrt` (typed).

<a id="exponential-integral-bounds"></a>
### Series and inequalities for the exponential integral

`RankZeroOneBSD:BSD.9/exponential-integral-bounds` · lemma

For x > 0 let E₁(x) = Γ(0, x) = ∫_x^∞ e^{−t}t^{−1} dt, the upper incomplete gamma function of QSeriesPartitionsAndMockModularForms QM.3 at s = 0. Then: (i) E₁(x) = −γ − log x + Σ_{n≥1} (−1)^{n+1}x^n/(n·n!), the series converging absolutely, with γ Euler's constant; (ii) for K ≥ x the terms x^n/(n·n!) decrease for n ≥ K, so truncating the series after any n ≥ K errs by at most the first omitted term; (iii) x/(x+1) < x·e^x·E₁(x) < (x+1)/(x+2) and ½·log(1+2/x) < e^x E₁(x) < log(1+1/x); in particular e^{−x}/(x+1) < E₁(x) < e^{−x}/x; (iv) E₁ is positive and strictly decreasing on (0, ∞). With Mathlib's bounds 1/2 < γ < 2/3 and its monotone sequences converging to γ, (i)–(iii) bound E₁ at a positive real argument between explicit elementary expressions.

**Hypotheses.**

- x > 0 real. The function is QM.3's Γ(0, ·); no second exponential-integral carrier is introduced.

**Proof sketch.**

- (i) Put Ein(x) = Σ_{n≥1}(−1)^{n+1}x^n/(n·n!) = ∫_0^x (1 − e^{−t})t^{−1}dt (termwise integration). The function E₁(x) + log x − Ein(x) has derivative zero on (0, ∞), and its limit at 0⁺ is −γ by the integral representation of γ (Mathlib's eulerMascheroniConstant via the derivative of Γ at 1, Real.eulerMascheroniConstant_eq_neg_deriv).
- (ii) The ratio of consecutive terms is x·n/((n+1)²) ≤ x/(n+1) < 1 once n + 1 > x; apply the alternating-series estimate.
- (iii) e^x E₁(x) = ∫_0^∞ e^{−u}/(x+u) du; Jensen's inequality for the convex u ↦ 1/(x+u) against the probability density e^{−u} gives the lower bound 1/(x+1); the remaining two-sided bounds are DLMF 6.8.1–6.8.3.
- (iv) The integrand is positive and the derivative is −e^{−x}/x < 0.

**Sources.**

- [NIST Digital Library of Mathematical Functions, Chapter 6: Exponential, Logarithmic, Sine, and Cosine Integrals](https://dlmf.nist.gov/6.6), §6.6, equation 6.6.2: The power series of E₁ about 0, with the −γ − ln z leading terms.
- [NIST Digital Library of Mathematical Functions, Chapter 6: Exponential, Logarithmic, Sine, and Cosine Integrals](https://dlmf.nist.gov/6.6), §6.8, inequalities 6.8.1–6.8.3: Two-sided bounds for e^x E₁(x) and x e^x E₁(x) for real x > 0.
- [Algorithms for Modular Elliptic Curves, Chapter II: Modular symbol algorithms](https://johncremona.github.io/book/fulltext/chapter2.pdf), §2.13, equation (2.13.3), p.43: G₁(x) is the exponential integral, evaluated by this series for small x and a continued fraction for large x.
- [The Euler–Mascheroni constant](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean), one_half_lt_eulerMascheroniConstant; eulerMascheroniConstant_lt_two_thirds: Explicit bounds on γ.

*Needs:* `QSeriesPartitionsAndMockModularForms:QM.3/upper-incomplete-gamma` (The upper incomplete gamma function Γ(s, x)); Mathlib `Real.eulerMascheroniConstant`; Mathlib `Real.one_half_lt_eulerMascheroniConstant`; Mathlib `Real.eulerMascheroniConstant_lt_two_thirds`; Mathlib `Real.eulerMascheroniConstant_eq_neg_deriv`; Mathlib `MeasureTheory.integral`; Mathlib `Real.exp`; Mathlib `Real.log`.

**Checks.**

- At x = 1: the bounds give 0.1839 < E₁(1) < 0.2707 (from (iii), first form), consistent with E₁(1) = 0.21938…
- Dropping the minus sign in front of γ in (i) changes E₁(x) by 2γ > 1 and violates (iii) at x = 1.

*Lean:* `exp_neg_div_add_one_lt_expIntegral`, `expIntegral_lt_exp_neg_div` and `hasSum_expIntegral_series` (typed, with E₁ written as the integral).

<a id="explicit-nonvanishing-criterion"></a>
### Explicit nonvanishing criterion for L(E,1) and L′(E,1)

`RankZeroOneBSD:BSD.9/explicit-nonvanishing-criterion` · theorem · planet: “Explicit nonvanishing criterion for L(E,1)”

Let E/ℚ be elliptic of conductor N, β = 2π/√N, ρ = e^{−β}, a_n = E.LFunction n and M ≥ 1. Put S₀(M) = 2Σ_{n≤M}(a_n/n)e^{−βn}, S₁(M) = 2Σ_{n≤M}(a_n/n)E₁(βn), T₀(M) = 4ρ^{M+1}/(1−ρ) and T₁(M) = 4ρ^{M+1}/(β(M+1)(1−ρ)). (i) If rootNumber E = 1 then |ellipticL E 1 − S₀(M)| ≤ T₀(M); if moreover |S₀(M)| > T₀(M), then analyticRank E = 0 and leadingTerm E lies in [S₀(M) − T₀(M), S₀(M) + T₀(M)]. (ii) If rootNumber E = −1 then ellipticL E 1 = 0 and |deriv (ellipticL E) 1 − S₁(M)| ≤ T₁(M); if moreover |S₁(M)| > T₁(M), then analyticRank E = 1 and leadingTerm E lies in [S₁(M) − T₁(M), S₁(M) + T₁(M)]. (iii) An inequality |S| + T < δ bounds the value by δ and never proves vanishing. The theorem contains no computation: its hypothesis is an inequality between explicit real numbers, which outward rational bounds on e^{−βn} and on E₁(βn) (exponential-integral-bounds) reduce to finitely many rational inequalities.

**Hypotheses.**

- E/ℚ elliptic; N its conductor (the level of F_E, R29.4/exact-conductor); rootNumber E the sign of BSD.0's functional equation; M ≥ 1.

**Proof sketch.**

- Mellin expressions: BSD.9/mellin-central-tail-bounds (Cremona Propositions 2.11.1 and 2.13.1) gives L(E,1) = 2Σ_{n≥1}(a_n/n)e^{−βn} when the sign is +1 and L′(E,1) = 2Σ_{n≥1}(a_n/n)E₁(βn) when it is −1; BSD.0/root-number-parity gives L(E,1) = 0 in the second case.
- Tails: by coefficient-bound |a_n/n| ≤ 2, so the value tail is at most 2Σ_{n>M}2ρ^n = 4ρ^{M+1}/(1−ρ); by exponential-integral-bounds E₁(βn) < e^{−βn}/(βn) ≤ ρ^n/(β(M+1)) for n > M, so the derivative tail is at most 4ρ^{M+1}/(β(M+1)(1−ρ)).
- If |S| > T, the true value lies in [S − T, S + T], which excludes 0; BSD.0's analyticRank_eq_zero_iff and analyticRank_eq_one_iff give the order, and leadingTerm E is the value or the first derivative.

**Sources.**

- [Algorithms for Modular Elliptic Curves, Chapter II: Modular symbol algorithms](https://johncremona.github.io/book/fulltext/chapter2.pdf), Proposition 2.11.1, p.37; Proposition 2.13.1 and (2.13.3), p.43: The value series when the Fricke eigenvalue gives sign +1, and the r-th derivative series with G_r; G₁ is the exponential integral.
- [Algorithms for Modular Elliptic Curves, Chapter II: Modular symbol algorithms](https://johncremona.github.io/book/fulltext/chapter2.pdf), §2.13, p.44: Cremona notes that a sufficiently precise evaluation decides r = 1 when L(f,1) = 0, while no approximation by itself proves vanishing.
- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, second paragraph: Rigorous tails and approximation bounds, then a certified nonzero enclosure; numerical evidence is not a proof.

*Needs:* `RankZeroOneBSD:BSD.9/mellin-central-tail-bounds` (Central Mellin formulas with explicit tails); [Coefficient bound for the L-series of an elliptic curve](#coefficient-bound) (`coefficient-bound`); [Series and inequalities for the exponential integral](#exponential-integral-bounds) (`exponential-integral-bounds`); `RankZeroOneBSD:BSD.0/analytic-rank` (Analytic rank and the leading coefficient at s = 1); `RankZeroOneBSD:BSD.0/root-number-parity` (Root-number parity of the analytic rank); `RankZeroOneBSD:BSD.0/completed-l-function` (The completed L-function and the root number); `EllipticCurveModularity:R29.4/exact-conductor` (The level of a newform attached to E is the conductor of E); Mathlib `Real.exp`; Mathlib `Real.sqrt`; Mathlib `Real.pi`.

**Checks.**

- Diagnostic values (not proofs) with M = 5 and a_n from point counts: conductor 11 (11a3, sign +1): S₀ ≈ 0.25384, T₀ ≈ 5.4·10⁻⁵; conductor 37 (37a1, sign −1): S₁ ≈ 0.30544, T₁ ≈ 2.0·10⁻³; conductor 32 (32a2, sign +1): S₀ ≈ 0.65554, T₀ ≈ 7.6·10⁻³. The hypothesis |S| > T holds in each case with a wide margin.
- Using the value formula when the sign is −1 is not licensed: the theorem has no conclusion there, and L(E,1) = 0 comes from the sign alone.

*Lean:* the sums and tails are the typed definitions `centralBeta`, `centralValueSum`, `centralDerivativeSum`, `centralValueTail`, `centralDerivativeTail` with `centralValueTail_pos`, `centralDerivativeTail_pos`, `centralValueTail_succ_lt`; the conclusions need `ellipticL` and are not typed.

<a id="manin-closing-the-path"></a>
### Manin's closing-the-path formula for L(E,1)/Ω

`RankZeroOneBSD:BSD.9/manin-closing-the-path` · theorem · planet: “Manin's closing-the-path formula”

Let E/ℚ be elliptic of conductor N with newform F_E = Σ a_n qⁿ, ω_f = 2πi F_E(z)dz, Λ_f ⊂ ℂ the lattice of periods of ω_f over H₁(X₀(N),ℤ), Ω₀ its least positive real element and Ω(f) = 2Ω₀ if Λ_f is rectangular and Ω₀ otherwise. Then: (i) L(E,1) = ⟨{0,∞}, ω_f⟩, the integral of ω_f along the imaginary axis; (ii) for every prime p ∤ N, (1 + p − a_p)·L(E,1) = Σ_{k=0}^{p−1}⟨{0, k/p}, ω_f⟩, where each {0, k/p} is a closed cycle on X₀(N), so the right side is a real element of Λ_f; (iii) 1 + p − a_p > 0 by the Hasse bound. Consequently L(E,1)/Ω(f) ∈ (1/(2(1 + p − a_p)))·ℤ for every p ∤ N, and L(E,1)/Ω(f) ∈ (1/D)·ℤ with D = 2·gcd_{p∈S}(1 + p − a_p) for any finite nonempty set S of primes not dividing N.

**Hypotheses.**

- E/ℚ elliptic; p prime with p ∤ N. Ω(f) is the period of the newform, not of E: the two are compared through the Manin constant (exact-rank-zero-quotient).

**Proof sketch.**

- (i) Mellin transform at s = 1: the twisted Mellin formula of ModularSymbolsPadicLFunctions L1 with trivial character and j = 0, together with R29.6/l-function-continuation (L(E,s) = L(F_E,s)).
- (ii) The Hecke operator T_p on modular symbols (L0/hecke-operators) sends {0,∞} to (1 + p){0,∞} minus the sum of the {0, k/p}; integrating ω_f, which is a T_p-eigendifferential with eigenvalue a_p, gives the identity. For p ∤ N the cusps k/p are Γ₀(N)-equivalent to 0, so each path closes up and its period lies in Λ_f (L0/period-symbol).
- Reality: the involution at infinity (L0/involution-at-infinity) sends {0, k/p} to {0, (p−k)/p} and the period to its complex conjugate, so the sum is real; Λ_f ∩ ℝ = ℤΩ₀ and Ω(f) ∈ {Ω₀, 2Ω₀}.
- (iii) a_p = a_p(E) at p ∤ N (R29.4/bad-euler-factors) and |a_p| ≤ 2√p < p + 1.

**Sources.**

- [Algorithms for Modular Elliptic Curves, Chapter II: Modular symbol algorithms](https://johncremona.github.io/book/fulltext/chapter2.pdf), §2.8, (2.8.7)–(2.8.9), p.30, and (2.8.10), p.31: L(f,1) is the period of the modular symbol {0,∞}; applying T_p and integrating gives (1 + p − a_p)L(f,1) as a sum of integral real periods, whence L(f,1)/Ω(f) = n/(2(1 + p − a_p)) with n an integer.
- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, second paragraph: A modular-symbol expression for the actual central value.

*Needs:* `ModularSymbolsPadicLFunctions:L0/period-symbol` (The period symbol of a cusp form); `ModularSymbolsPadicLFunctions:L0/hecke-operators` (Hecke operators on modular symbols); `ModularSymbolsPadicLFunctions:L0/involution-at-infinity` (The involution at infinity); `ModularSymbolsPadicLFunctions:L1/twisted-mellin-formula` (The twisted Mellin formula for modular symbols); `EllipticCurveModularity:R29.3/newform-of-E` (The newform F_E attached to E); `EllipticCurveModularity:R29.4/bad-euler-factors` (All local factors agree); `EllipticCurveModularity:R29.6/l-function-continuation` (Analytic continuation and functional equation of L(E, s)); TauCetiRoadmap EllipticCurves Layer 3.

**Checks.**

- For 11a1 and p = 2: a_2 = −2, so 1 + p − a_p = 5 and L(E,1)/Ω(f) ∈ (1/10)ℤ; the value is 1/5.
- For conductor 32 and p = 3: a_3 = 0, so L(E,1)/Ω(f) ∈ (1/8)ℤ.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="exact-rank-zero-quotient"></a>
### An exact value of L(E,1)/Ω_E from a denominator and an enclosure

`RankZeroOneBSD:BSD.9/exact-rank-zero-quotient` · theorem

Let E/ℚ be elliptic of conductor N, φ: X₀(N) → E an optimal modular parametrisation with Manin constant c_φ (φ\*ω_E = c_φ·ω_f), and S a finite nonempty set of primes not dividing N; put D = 2|c_φ|·gcd_{p∈S}(1 + p − a_p). Then Ω_E = |c_φ|·Ω(f) and L(E,1)/Ω_E ∈ (1/D)·ℤ. Hence, if rationals a < b satisfy b − a ≤ 1/D and a < L(E,1)/Ω_E < b, then L(E,1)/Ω_E is the unique element of (1/D)ℤ in the open interval (a, b). For a curve E′ that is ℚ-isogenous to E, L(E′,1) = L(E,1), and L(E′,1)/Ω_{E′} is obtained from L(E,1)/Ω_E by the rational period ratio Ω_E/Ω_{E′}.

**Hypotheses.**

- φ optimal (φ_\* : H₁(X₀(N),ℤ) → H₁(E(ℂ),ℤ) surjective); c_φ the Manin constant of GZ.3; Ω_E the full real Néron period.
- For E′ the period ratio is a supplied comparison (BSD.8/local-isogeny-certificate-adapter, BSD.9/fixture-11-isogeny-period), not deduced from the isogeny degree alone.

**Proof sketch.**

- Optimality gives Λ_E = c_φ·Λ_f for the period lattice of the Néron differential, so the rectangularity and the least real periods correspond and Ω_E = |c_φ|·Ω(f) (GZ.0/real-period-components for the full period).
- Apply manin-closing-the-path for each p ∈ S and take the gcd.
- Two distinct elements of (1/D)ℤ differ by at least 1/D ≥ b − a, so at most one lies in (a, b).
- Isogenous curves have the same L-function (BSD.0 ellipticL_eq_of_isogenous).

**Sources.**

- [Algorithms for Modular Elliptic Curves, Chapter II: Modular symbol algorithms](https://johncremona.github.io/book/fulltext/chapter2.pdf), §2.8, (2.8.10), p.31, and the discussion following it: For the optimal curve the rational number L(f,1)/Ω(f) has the displayed denominator; the curve's own period differs by the Manin constant.
- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9 and BSD.5: Rationality with an explicit denominator turns an enclosure into an exact value.

*Needs:* [Manin's closing-the-path formula for L(E,1)/Ω](#manin-closing-the-path) (`manin-closing-the-path`); `GrossZagierAndArithmeticHeights:GZ.3/manin-constant` (Manin constant); `GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit` (Integral Manin constant and p-unit range); `EllipticCurveModularity:R29.5/modular-parametrisation` (The modular parametrisation X₀(N) → E); `GrossZagierAndArithmeticHeights:GZ.0/real-period-components` (Full real period, identity-component period and c∞); `RankZeroOneBSD:BSD.5/rank-zero-rationality` (Rationality of L(E,1)/Ω_E); `RankZeroOneBSD:BSD.0/actual-l-function` (The actual L-function of an elliptic curve over ℚ).

**Checks.**

- For 11a1 (optimal; c_φ = 1) and S = {2}: D = 10, and any enclosure of width at most 1/10 around 0.2 gives L(11a1,1)/Ω = 1/5. With Ω(11a3) = 5Ω(11a1) this gives L(11a3,1)/Ω(11a3) = 1/25.
- Without the Manin constant the denominator can be wrong by c_φ: the theorem does not apply to a non-optimal parametrisation without its own index.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

## Side conditions of the named branches

Before a branch theorem is applied to a curve, its hypotheses are checked. Three general statements cover the test curves: rational p-torsion at a good odd prime makes p an ordinary Eisenstein prime inside Keller–Yin's range and outside every other branch; a CM curve meets no BSD.6 branch at any prime; and no named branch reaches p = 2.

<a id="rational-torsion-eisenstein-ordinary"></a>
### Rational p-torsion at a good odd prime

`RankZeroOneBSD:BSD.9/rational-torsion-eisenstein-ordinary` · theorem

Let E/ℚ be elliptic, p an odd prime of good reduction and P ∈ E(ℚ) of order p. Then: (i) reduction modulo p is injective on E(ℚ)[p], so p divides #Ẽ(𝔽_p) = p + 1 − a_p, hence a_p ≡ 1 (mod p) and E is ordinary at p; (ii) ⟨P⟩ is the kernel of a cyclic ℚ-rational p-isogeny with trivial kernel character, and by the Weil pairing E[p]^ss ≅ 𝔽_p ⊕ 𝔽_p(ω), so E[p] is reducible and p is an Eisenstein prime; (iii) every cyclic ℚ-rational p-isogeny of E has kernel character 1 or ω (a kernel other than ⟨P⟩ is a complement of ⟨P⟩, isomorphic to μ_p), so the hypothesis φ|G_p ≠ 1, ω of BSD.7/cgs-eisenstein-prime-bsd fails for every choice; (iv) the hypotheses of BSD.7/ky-eisenstein-prime-bsd hold whenever analyticRank E ≤ 1, while no BSD.6 branch applies at p: the irreducible-residual branches fail by (ii), the supersingular ones by (i), and Castella's needs multiplicative reduction at p.

**Hypotheses.**

- E/ℚ elliptic, p odd prime, E has good reduction at p, P ∈ E(ℚ) of exact order p.

**Proof sketch.**

- (i) The reduction-injectivity theorem of EllipticCurves Layer 6 (torsion injects at good odd p); then a_p = p + 1 − #Ẽ(𝔽_p) ≡ 1 mod p, and a_p ≢ 0 mod p means ordinary.
- (ii) EllipticCurves Layer 1 constructs the isogeny with kernel ⟨P⟩; the Galois group acts trivially on the rational points; the Weil pairing (Layer 2) has determinant ω, so the quotient character is ω.
- (iii) If C ≠ ⟨P⟩ is another rational cyclic subgroup, E[p] = ⟨P⟩ ⊕ C and C ≅ E[p]/⟨P⟩ has character ω.
- (iv) Compare with the hypothesis lists of the BSD.6 and BSD.7 nodes.

**Sources.**

- [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/pdf/2402.12781v2), Theorem C, p.5, and §0.3, p.5: Theorem C needs only a good prime p > 2 and a cyclic p-isogeny; the examples have rational p-torsion and lie outside the earlier local hypothesis.
- [Mazur's main conjecture at Eisenstein primes](https://arxiv.org/pdf/2303.04373v2), Theorem A, p.2, and Theorem D, pp.4–5: The isogeny character must satisfy φ|G_p ≠ 1, ω, which rational p-torsion violates.
- [Roadmap: elliptic curves (TauCetiRoadmap EllipticCurves README)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/34dcf0e2b60d68a705742ee408e5392ddabbd00a/TauCetiRoadmap/EllipticCurves/README.md), Layer 6, torsion subgroup item: Torsion injects into the reduction at a good odd prime.

*Needs:* TauCetiRoadmap EllipticCurves Layer 6; TauCetiRoadmap EllipticCurves Layer 2; TauCetiRoadmap EllipticCurves Layer 1; TauCetiRoadmap EllipticCurves Layer 3; `RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd` (CGS good Eisenstein prime-part BSD); `RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd` (Keller–Yin good Eisenstein prime-part BSD); Mathlib `WeierstrassCurve.Affine.Point`; Mathlib `orderOf`.

**Checks.**

- 11a3 and p = 5: a_5 = 1 ≡ 1 mod 5 and #Ẽ(𝔽_5) = 5; Keller–Yin applies, CGS does not.
- Keller–Yin §0.3 lists the smallest examples 19a3 (p = 3), 11a3 (p = 5) and 26b2 (p = 7).

*Lean:* part (i) is typed as `prime_dvd_card_reduction_of_addOrderOf` and `trace_modEq_one_of_addOrderOf` for an integral model with p ∤ Δ; parts (ii)–(iv) are not typed.

<a id="cm-branch-range"></a>
### Which named branches can apply to a CM curve

`RankZeroOneBSD:BSD.9/cm-branch-range` · theorem

Let E/ℚ be elliptic with complex multiplication (End_ℚ̄(E) ≠ ℤ). Then j(E) ∈ ℤ, E has potentially good reduction at every prime and multiplicative reduction at none, and E has at least one prime of bad reduction, which is therefore additive; so E is not semistable, and no quadratic twist of E is semistable. Consequently, at every prime p, none of the five BSD.6 branches applies to E (each needs semistability, a twist of a semistable curve, or a multiplicative prime), and the BSD.7 branches apply only at good odd primes p where E has a rational p-isogeny. For 32a2 (y² = x³ − x, CM by ℤ[i], additive at 2), whose ℚ-isogeny class has only isogenies of 2-power degree, no named branch applies at any prime: its full formula can only come from an exact computation of the whole defect.

**Hypotheses.**

- E/ℚ elliptic with CM. The statement about 32a2 additionally uses its isogeny class, a supplied datum.

**Proof sketch.**

- CM j-invariants are algebraic integers (CM.3/integrality), hence in ℤ for E/ℚ; v_p(j) ≥ 0 at every p is potential good reduction (CM.5/cm-reduction-dictionary; EllipticCurves Layer 4), which excludes multiplicative reduction.
- A bad prime exists: by R29.3/R29.4 the newform F_E has level N equal to the conductor; if N = 1 then F_E would be a nonzero weight-2 form of level one, contradicting Mathlib's ModularForm.levelOne_weight_two_rank_zero.
- A quadratic twist of E also has CM, so the same argument shows it is not semistable.
- Compare with the hypotheses of the BSD.6 and BSD.7 nodes; for 32a2 the absence of an odd-degree rational isogeny makes E[p] irreducible at every odd p.

**Sources.**

- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, first paragraph: A CM curve and a nonsemistable curve are among the tests, and each source's side conditions are checked before its theorem is applied.
- [Dimension formula for level-one modular forms](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean), ModularForm.levelOne_weight_two_rank_zero: Modular forms of weight two and level one are zero.
- [Algorithms for Modular Elliptic Curves: Table 1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, class 32A, p.111: The class of 32a2 consists of curves linked by isogenies of degree 2 and 4 (comparison data, not a proof).

*Needs:* `ComplexMultiplicationAndExplicitReciprocity:CM.3/integrality` (Integrality of singular moduli and class polynomials); `ComplexMultiplicationAndExplicitReciprocity:CM.5/cm-reduction-dictionary` (Potential good reduction and the split/non-split dichotomy); TauCetiRoadmap EllipticCurves Layer 4; `EllipticCurveModularity:R29.3/newform-of-E` (The newform F_E attached to E); `EllipticCurveModularity:R29.4/exact-conductor` (The level of a newform attached to E is the conductor of E); Mathlib `ModularForm.levelOne_weight_two_rank_zero`; `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part` (The p-part of BSD in rank zero at ordinary and multiplicative primes (Skinner–Urban, Skinner)); `RankZeroOneBSD:BSD.6/rank-zero-supersingular-p-part` (The p-part of BSD in rank zero at supersingular primes); `RankZeroOneBSD:BSD.6/jsw-rank-one-p-part` (The p-part of BSD in analytic rank one (Jetchev–Skinner–Wan)); `RankZeroOneBSD:BSD.6/castella-multiplicative-rank-one-p-part` (The p-part of BSD at multiplicative primes in analytic rank one (Castella's corrected Theorem A′)); `RankZeroOneBSD:BSD.6/bstw-rank-one-p-part` (BSTW supersingular rank-one p-part); `RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd` (CGS good Eisenstein prime-part BSD); `RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd` (Keller–Yin good Eisenstein prime-part BSD); `RankZeroOneBSD:BSD.9/fixture-32` (Concrete 32a2 Weierstrass model).

**Checks.**

- The automorphism (x, y) ↦ (−x, iy) of y² = x³ − x over ℚ(i) squares to [−1] (parent node fixture-32-cm-additive).
- A CM curve can satisfy a BSD.7 branch: if E has a rational p-isogeny at a good odd p (as some CM curves do), the Keller–Yin hypotheses can hold.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="dyadic-branch-exclusion"></a>
### No named branch reaches the prime 2

`RankZeroOneBSD:BSD.9/dyadic-branch-exclusion` · lemma

Each of the seven named prime-part branches (five in BSD.6, two in BSD.7) requires p ≥ 3. Hence, for every E/ℚ with analyticRank E ≤ 1, PrimePartFormula E h 2 can come only from an exact dyadic computation (BSD.8/exceptional-prime-part-adapter) or from a proof that bsdDefect E = 1. By dyadic-gate, PrimePartFormula at every odd prime does not imply the full formula. The rank and Ш endpoints are unaffected: an unproved dyadic part blocks only the full-formula endpoint.

**Hypotheses.**

- E/ℚ elliptic with analyticRank E ≤ 1.

**Proof sketch.**

- Read p ≥ 3 (or p > 3, p ≥ 5) from the hypotheses of the seven branch nodes.
- Combine with BSD.8/source-qualified-prime-part-dispatch, whose only remaining case is the exceptional-prime adapter, and with dyadic-gate.

**Sources.**

- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, last sentence of the second paragraph: An unproved residual 2-part prevents full-formula assembly while leaving rank equality and finite Sha unaffected.

*Needs:* [The p-part of the Birch–Swinnerton-Dyer formula](#prime-part-formula) (`prime-part-formula`); [Public endpoint: rank equals analytic rank](#public-rank-endpoint) (`public-rank-endpoint`); [Public endpoint: Ш is finite](#public-sha-endpoint) (`public-sha-endpoint`); `RankZeroOneBSD:BSD.9/dyadic-gate` (The remaining dyadic equality under all odd-prime equalities); `RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch` (Source-qualified fixed-prime dispatch); `RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter` (Exceptional-prime leading-term certificate adapter); `RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part` (The p-part of BSD in rank zero at ordinary and multiplicative primes (Skinner–Urban, Skinner)); `RankZeroOneBSD:BSD.6/rank-zero-supersingular-p-part` (The p-part of BSD in rank zero at supersingular primes); `RankZeroOneBSD:BSD.6/jsw-rank-one-p-part` (The p-part of BSD in analytic rank one (Jetchev–Skinner–Wan)); `RankZeroOneBSD:BSD.6/castella-multiplicative-rank-one-p-part` (The p-part of BSD at multiplicative primes in analytic rank one (Castella's corrected Theorem A′)); `RankZeroOneBSD:BSD.6/bstw-rank-one-p-part` (BSTW supersingular rank-one p-part); `RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd` (CGS good Eisenstein prime-part BSD); `RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd` (Keller–Yin good Eisenstein prime-part BSD).

**Checks.**

- 11a3 (good at 2), 37a1 (good at 2) and 32a2 (additive at 2) all need a separate dyadic input for the full formula.
- The public rank and Ш endpoints have no dyadic hypothesis.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

## Ш from the Heegner index

Exact Ш orders need an annihilator (BSD.8). The Heegner-index bound supplies one at the odd primes where the Galois image is large and the index is prime to the prime; Gross's example X₀(37)/w₃₇ shows how the whole group is then reduced to one 2-descent statement.

<a id="odd-sha-from-heegner-index"></a>
### Odd primary Sha vanishing from the Heegner index

`RankZeroOneBSD:BSD.9/odd-sha-from-heegner-index` · theorem

Let E/ℚ be elliptic of conductor N with a fixed modular parametrisation, K imaginary quadratic with D_K ∉ {−3, −4} and every prime dividing N split in K, y_K ∈ E(K) the Heegner point (HE.1), of infinite order, and I_K = [E(K) : ℤy_K]. Let ℓ be an odd prime with ℓ ∤ I_K. (a) If E has no CM and Gal(ℚ(E[ℓ])/ℚ) ≅ GL₂(𝔽_ℓ), then Ш(E/K)[ℓ] = 0. (b) In general, if ℓ ∈ B(E) (the odd primes not dividing the discriminant of End_ℚ̄(E) at which the ℓ-adic image is as large as possible, HE.7), then v_ℓ(#Ш(E/K)) ≤ 2·v_ℓ(I_K) = 0. In either case Ш(E/K)[ℓ^∞] = 0, hence Ш(E/ℚ)[ℓ^∞] = 0 and Ш(E^K/ℚ)[ℓ^∞] = 0.

**Hypotheses.**

- The classical Heegner hypotheses of HE.7/classical-full-sha-finiteness; y_K non-torsion; ℓ odd with ℓ ∤ I_K.
- (a) needs no CM and surjective mod-ℓ image; (b) needs ℓ ∈ B(E).

**Proof sketch.**

- ℓ ∤ I_K implies y_K ∉ ℓE(K): if y_K = ℓQ then Q has order ℓ in E(K)/ℤy_K, because y_K has infinite order.
- (a) HE.6/gross-clean-mod-p-descent: Sel_ℓ(E/K) is generated by the Kummer image of y_K, so Ш(E/K)[ℓ] = 0.
- (b) HE.7/classical-square-index-error-bound: #Ш(E/K) divides d_E·I_K² with v_ℓ(d_E) = 0 for ℓ ∈ B(E).
- A torsion ℓ-primary group with no element of order ℓ is zero; BSD.1/odd-selmer-sha-decomposition splits Ш(E/K)[ℓ^∞] as Ш(E/ℚ)[ℓ^∞] ⊕ Ш(E^K/ℚ)[ℓ^∞].

**Sources.**

- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem 1.3, p.236; Proposition 2.1, p.237: Kolyvagin's bound of #Ш(E/K) by an exceptional integer times I_K², and the clean statement that Ш(E/K) has no ℓ-torsion when the mod-ℓ image is GL₂ and ℓ does not divide y_K.
- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9 and BSD.8: Whole-Sha conclusions need a proved annihilator; here the annihilator is a power of 2 at the primes covered.

*Needs:* `HeegnerPointEulerSystems:HE.6/gross-clean-mod-p-descent` (Gross’s clean mod-p descent); `HeegnerPointEulerSystems:HE.7/classical-square-index-error-bound` (Classical square-index bound); `HeegnerPointEulerSystems:HE.7/classical-full-sha-finiteness` (Classical full Sha finiteness); `HeegnerPointEulerSystems:HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation` (Heegner point family); `RankZeroOneBSD:BSD.5/heegner-index` (The Heegner index); `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition` (Odd-primary Selmer and Sha over a quadratic field).

**Checks.**

- If ℓ | I_K the theorem gives nothing at ℓ: the index bound is only an upper bound (Gross Conjecture 1.2 is not used).
- The prime 2 is excluded: the 2-primary part needs a separate argument (a 2-descent or the comparison BSD.1/two-primary-comparison).

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="gross-37a-sha-vanishing"></a>
### Sha of the curve X₀(37)/w₃₇ from a Heegner point of index one

`RankZeroOneBSD:BSD.9/gross-37a-sha-vanishing` · theorem · planet: “Sha of X₀(37)/w₃₇ from the Heegner index”

Let E: y² + y = x³ − x (37a1, the quotient X₀(37)/w₃₇) and P = (0, 0). Assume: (h1) E(ℚ) = ℤP; (h2) there is an imaginary quadratic K with D_K ∉ {−3, −4} in which 37 splits whose Heegner index I_K = [E(K) : ℤy_K] is a power of 2 (for instance y_K = ±P with [E(K) : E(ℚ)] a power of 2; Gross writes y_K = m_K·P and I_K = ±m_K); (h3) Gal(ℚ(E[ℓ])/ℚ) ≅ GL₂(𝔽_ℓ) for ℓ = 3, 5, 7; (h4) Ш(E/ℚ)[2] = 0. Then Ш(E/ℚ) = 0. If in addition E(ℚ)_tors = 0, c₃₇ = 1 and analyticRank E = 1, then bsdDefect E = L′(E,1)/(Ω_E·ĥ_x(P)), and the full formula for E is the single real identity L′(E,1) = Ω_E·ĥ_x(P), with ĥ_x the x-height canonical height.

**Hypotheses.**

- The four hypotheses (h1)–(h4) are supplied data, not computations of this roadmap; Gross reports (h1) and that y_K ∈ E(ℚ) for this curve.
- For ℓ ≥ 11 the mod-ℓ image is GL₂(𝔽_ℓ) because E is semistable (Mazur's theorem, quoted by Gross p.237); (h3) covers the remaining odd primes.

**Proof sketch.**

- Every odd ℓ satisfies ℓ ∤ I_K by (h2); E has no CM (j = 110592/37 ∉ ℤ); odd-sha-from-heegner-index (a) gives Ш(E/ℚ)[ℓ^∞] = 0 for every odd ℓ.
- From (h4), the 2-primary part is zero: a nonzero element of a 2-primary torsion group has a multiple of order 2.
- With (h1), Reg_BSD(E/ℚ) = ĥ_x(P) (GZ.0/bsd-regulator); substitute #Ш = 1, #tors = 1 and c₃₇ = 1 in BSD.5's defect.

**Sources.**

- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Example after Theorem 1.3, p.236, and its continuation on p.237: For X₀(37)/w₃₇ with the degree-two parametrisation, c = 1 and m₃₇ = 1; y_K lies in E(ℚ), which is infinite cyclic generated by (0,0); writing y_K = m_K·P gives I_K = ±m_K.
- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Proposition 2.1 and the paragraph before it, p.237: The clean odd-prime descent under a GL₂ mod-ℓ image, and Mazur's theorem for semistable curves at ℓ ≥ 11.

*Needs:* [Odd primary Sha vanishing from the Heegner index](#odd-sha-from-heegner-index) (`odd-sha-from-heegner-index`); `RankZeroOneBSD:BSD.5/heegner-index` (The Heegner index); `RankZeroOneBSD:BSD.5/rational-bsd-defect` (The rational BSD defect); `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator` (The BSD regulator, and Tau Ceti's regulator); `RankZeroOneBSD:BSD.9/point-37` (Actual 37 fixture point).

**Checks.**

- Gross records c = 1 and m₃₇ = 1 for this curve, so his Conjecture 1.2 predicts #Ш(E/K) = I_K²; Kolyvagin's refinement (t_{E/K} a power of 2, equal to 1 when I_K is odd) is reported there and is not used here.
- If y_K = ±3P instead, the theorem gives nothing at ℓ = 3.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

## Conditional applications to 11a3, 37a1 and 32a2

The three test curves cover rank zero and rank one, rational torsion and a rational 5-isogeny (11a3), a rank-one curve with a known generator (37a1), and a CM curve with additive reduction (32a2). Every numerical, descent and local datum is a hypothesis; the conclusions show how the endpoints, the side-condition theorems and the Heegner-index theorem combine, and the Checks show which wrong input each step detects.

<a id="conditional-fixture-ranks"></a>
### Ranks and finite Sha of the three test curves from analytic data

`RankZeroOneBSD:BSD.9/conditional-fixture-ranks` · application

Let E₁₁: y² + y = x³ − x² (11a3), E₃₇: y² + y = x³ − x (37a1) and E₃₂: y² = x³ − x (32a2, the parent's fixture32). Assume their conductors are 11, 37, 32 and their root numbers +1, −1, +1, and assume for some M ≥ 1 the finite-sum inequalities |S₀(M)| > T₀(M), |S₁(M)| > T₁(M), |S₀(M)| > T₀(M) of explicit-nonvanishing-criterion respectively (or directly L(E₁₁,1) > 0, L′(E₃₇,1) > 0, L(E₃₂,1) > 0). Then the analytic ranks are 0, 1, 0, the ranks of the Mordell–Weil groups are 0, 1, 0, and each Ш(E/ℚ) is finite. For the two semistable curves the root numbers follow from a₁₁(E₁₁) = 1 (split) and a₃₇(E₃₇) = −1 (nonsplit) by the local formula of BSD.0; for E₃₂ the sign is a supplied datum.

**Hypotheses.**

- The conductor, root-number and inequality data are hypotheses; their computation is not a target of this roadmap.

**Proof sketch.**

- explicit-nonvanishing-criterion gives the analytic ranks; public-rank-endpoint and public-sha-endpoint give the rest.
- BSD.0's rootNumber_eq_prod_local: for prime conductor ℓ with multiplicative reduction the sign is a_ℓ.

**Sources.**

- [Algorithms for Modular Elliptic Curves: worked examples](https://johncremona.github.io/book/fulltext/examples.pdf), Worked examples for N = 11 and N = 37: The two semistable curves, their signs and approximate central values or derivatives (comparison data).
- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, first paragraph: Rank-zero and rank-one curves; numerical evidence of analytic rank is not a proof of a nonzero derivative.

*Needs:* [Explicit nonvanishing criterion for L(E,1) and L′(E,1)](#explicit-nonvanishing-criterion) (`explicit-nonvanishing-criterion`); [Public endpoint: rank equals analytic rank](#public-rank-endpoint) (`public-rank-endpoint`); [Public endpoint: Ш is finite](#public-sha-endpoint) (`public-sha-endpoint`); `RankZeroOneBSD:BSD.0/completed-l-function` (The completed L-function and the root number); `RankZeroOneBSD:BSD.9/fixture-32` (Concrete 32a2 Weierstrass model).

**Checks.**

- M = 5 suffices for all three numerically (values listed in explicit-nonvanishing-criterion).
- An interval containing 0, or root number −1 without a nonzero derivative, establishes neither rank.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="conditional-eisenstein-five"></a>
### The 5-part on 11a3 through Keller–Yin

`RankZeroOneBSD:BSD.9/conditional-eisenstein-five` · application

For E₁₁ (11a3): good reduction at 5 (Δ = −11), a rational point of order 5 (the EllipticCurves worked example E(ℚ)_tors ≅ ℤ/5), and analyticRank E₁₁ = 0 (conditional-fixture-ranks) give, by rational-torsion-eisenstein-ordinary, an ordinary Eisenstein prime 5 at which Keller–Yin applies and CGS does not; hence PrimePartFormula E₁₁ h 5. With the additional data L(E₁₁,1)/Ω = 1/25 (exact-rank-zero-quotient), #E₁₁(ℚ)_tors = 5 and c₁₁ = 1, the formula gives v₅(#Ш(E₁₁/ℚ)) = 0, i.e. Ш(E₁₁/ℚ)[5^∞] = 0.

**Hypotheses.**

- The torsion point, the reduction type at 5 and 11, and the exact quotient are supplied data or upstream results; no point count or isogeny construction is a target here.

**Proof sketch.**

- Apply rational-torsion-eisenstein-ordinary with p = 5, then public-fixed-prime-endpoint with the Keller–Yin branch.
- primePartFormula_iff_valuation: −2 = 0 + v₅(#Ш) − 2.

**Sources.**

- [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/pdf/2402.12781v2), §0.3, p.5: 11a3 is the smallest example with rational 5-torsion and rank zero covered by Theorem C.
- [Roadmap: elliptic curves (TauCetiRoadmap EllipticCurves README)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/34dcf0e2b60d68a705742ee408e5392ddabbd00a/TauCetiRoadmap/EllipticCurves/README.md), Worked examples, torsion and rank on named curves: E(ℚ)_tors ≅ ℤ/5 for 11.a3 is certified upstream by Nagell–Lutz.

*Needs:* [Rational p-torsion at a good odd prime](#rational-torsion-eisenstein-ordinary) (`rational-torsion-eisenstein-ordinary`); [Public endpoint: the formula at one prime](#public-fixed-prime-endpoint) (`public-fixed-prime-endpoint`); [The p-part of the Birch–Swinnerton-Dyer formula](#prime-part-formula) (`prime-part-formula`); [Ranks and finite Sha of the three test curves from analytic data](#conditional-fixture-ranks) (`conditional-fixture-ranks`); [An exact value of L(E,1)/Ω_E from a denominator and an enclosure](#exact-rank-zero-quotient) (`exact-rank-zero-quotient`); `RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd` (Keller–Yin good Eisenstein prime-part BSD); `RankZeroOneBSD:BSD.9/fixture-11-isogeny-period` (Five-isogeny and torsion-square comparison).

**Checks.**

- The trivial kernel character equals 1 at G₅, so the CGS branch cannot be used.
- Replacing #tors² by #tors would predict v₅(#Ш) = −1, which is impossible; the torsion square is essential.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="conditional-sha-vanishing-fixtures"></a>
### Ш = 0 for the three test curves under explicit hypotheses

`RankZeroOneBSD:BSD.9/conditional-sha-vanishing-fixtures` · application

Under the following supplied hypotheses, #Ш(E/ℚ) = 1 for the three curves. E₃₇: (h1)–(h4) of gross-37a-sha-vanishing. E₁₁: the data of conditional-eisenstein-five (giving the 5-part); a Heegner field K for E₁₁ whose Heegner point has index I_K prime to every odd ℓ ≠ 5; surjective mod-ℓ image for the odd ℓ ≠ 5 (for ℓ ≥ 11 Mazur's theorem, E₁₁ being semistable); and Ш(E₁₁/ℚ)[2] = 0. E₃₂ (CM by ℤ[i]): a Heegner field K (2 split, D_K ≡ 1 mod 8) whose Heegner index is a power of 2; every odd ℓ in B(E₃₂); and Ш(E₃₂/ℚ)[2] = 0. The analytic hypotheses of conditional-fixture-ranks and these arithmetic hypotheses are distinct inputs: neither implies the other.

**Hypotheses.**

- All index, image and 2-descent statements are supplied data.

**Proof sketch.**

- E₃₇: gross-37a-sha-vanishing.
- E₁₁ at 5: conditional-eisenstein-five. At odd ℓ ≠ 5: odd-sha-from-heegner-index (a) for E₁₁ (5 is excluded from (a) because E₁₁[5] is reducible). At 2: the descent hypothesis.
- E₃₂ at odd ℓ: odd-sha-from-heegner-index (b), since E₃₂ has CM. At 2: the descent hypothesis.
- Combine the primary parts; finiteness is public-sha-endpoint.

**Sources.**

- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem 1.3, p.236; Proposition 2.1, p.237: The index bound reduces the odd part of Ш to the Heegner index and the exceptional primes.
- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9, second paragraph: Keep the analytic certificate distinct from the arithmetic descent certificate.

*Needs:* [Sha of the curve X₀(37)/w₃₇ from a Heegner point of index one](#gross-37a-sha-vanishing) (`gross-37a-sha-vanishing`); [Odd primary Sha vanishing from the Heegner index](#odd-sha-from-heegner-index) (`odd-sha-from-heegner-index`); [The 5-part on 11a3 through Keller–Yin](#conditional-eisenstein-five) (`conditional-eisenstein-five`); [Public endpoint: Ш is finite](#public-sha-endpoint) (`public-sha-endpoint`); `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition` (Odd-primary Selmer and Sha over a quadratic field).

**Checks.**

- The analytic enclosure of conditional-fixture-ranks gives no information on #Ш; a 2-Selmer computation alone gives no odd primary part.
- For E₁₁ the odd-prime Heegner argument cannot reach ℓ = 5; Keller–Yin is needed there.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

<a id="conditional-full-formula"></a>
### The full formula for the three test curves under explicit data

`RankZeroOneBSD:BSD.9/conditional-full-formula` · application

Assume for E₁₁, E₃₇, E₃₂: rational leading quotients L\*/(Ω Reg_BSD) = 1/25, 1, 1/8; torsion orders 5, 1, 4; Tamagawa products 1, 1, 2; #Ш = 1, 1, 1 (conditional-sha-vanishing-fixtures); full real Néron periods; regulators 1, ĥ_x(P), 1 (P the saturated generator of E₃₇(ℚ)). Then bsdDefect = (1/25)·25/1 = 1, 1·1/1 = 1 and (1/8)·16/2 = 1, so PrimeValuationCertificate.ofAllPrimes applies and public-full-endpoint gives the full formula for each curve. The quotient data may be supplied by exact-rank-zero-quotient (rank zero) and by an exact value of L′(E₃₇,1)/(Ω ĥ_x(P)).

**Hypotheses.**

- Every numerical entry is a hypothesis about the actual invariant, not its definition and not a computation target.

**Proof sketch.**

- Substitute in BSD.5's definition of bsdDefect; build the certificate with BSD.8/certificate-from-all-primes; apply public-full-endpoint.
- In rank zero the regulator is the empty determinant 1 (Tau Ceti regulator_eq_one_of_finrank_eq_zero and GZ.0/bsd-regulator).

**Sources.**

- [Algorithms for Modular Elliptic Curves: Table 1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, rows 11A3, 37A1, 32A2: Torsion orders, Tamagawa numbers and ranks used as comparison data for the hypotheses.
- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8–BSD.9: Full-formula corollaries only under a complete certificate.

*Needs:* [Public endpoint: the full leading-term formula from a complete certificate](#public-full-endpoint) (`public-full-endpoint`); [Ш = 0 for the three test curves under explicit hypotheses](#conditional-sha-vanishing-fixtures) (`conditional-sha-vanishing-fixtures`); [An exact value of L(E,1)/Ω_E from a denominator and an enclosure](#exact-rank-zero-quotient) (`exact-rank-zero-quotient`); `RankZeroOneBSD:BSD.5/rational-bsd-defect` (The rational BSD defect); `RankZeroOneBSD:BSD.8/certificate-from-all-primes` (Canonical certificate from all prime valuations); `RankZeroOneBSD:BSD.9/fixture-period-height-comparisons` (Fixture periods, heights and regulator conventions); Tau Ceti `WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`; `GrossZagierAndArithmeticHeights:GZ.0/bsd-regulator` (The BSD regulator, and Tau Ceti's regulator).

**Checks.**

- With quotient 1/2 on E₃₂ the defect is 4; with torsion order counted once on E₁₁ it is 1/5; counting c∞ again on E₃₇ halves it. Each wrong input is detected by the defect itself.
- Rank equality and finite Ш do not imply these data.

*Lean:* not typed at the pins; listed in the closing comment of the suggested file.

## Inherited declarations

The parent's BSD.9 declarations and what happens to each:


- `RankZeroOneBSD:BSD.9/away-from-prime` (A prime defect is invisible at every other prime): retained unchanged.
- `RankZeroOneBSD:BSD.9/prime-obstruction` (No complete certificate for a prime defect): retained unchanged.
- `RankZeroOneBSD:BSD.9/dyadic-gate` (The remaining dyadic equality under all odd-prime equalities): retained unchanged.
- `RankZeroOneBSD:BSD.9/fixture-11` (Concrete 11a3 Weierstrass model): retained as cited; the package defers it to the EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- `RankZeroOneBSD:BSD.9/fixture-11-discriminant` (11a3 discriminant calculation): retained as cited; the package defers it to the EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- `RankZeroOneBSD:BSD.9/fixture-11-elliptic` (11a3 ellipticity and affine point domain): retained as cited; the package defers it to the EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- `RankZeroOneBSD:BSD.9/fixture-37` (Concrete 37a1 Weierstrass model): retained as cited; the package defers it to the EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- `RankZeroOneBSD:BSD.9/fixture-37-discriminant` (37a1 discriminant calculation): retained as cited; the package defers it to the EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- `RankZeroOneBSD:BSD.9/fixture-37-elliptic` (37a1 ellipticity and affine point domain): retained as cited; the package defers it to the EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- `RankZeroOneBSD:BSD.9/fixture-32` (Concrete 32a2 Weierstrass model): retained unchanged.
- `RankZeroOneBSD:BSD.9/fixture-32-discriminant` (32a2 discriminant calculation): retained unchanged.
- `RankZeroOneBSD:BSD.9/fixture-32-elliptic` (32a2 ellipticity and affine point domain): retained unchanged.
- `RankZeroOneBSD:BSD.9/point-11` (Actual 11 fixture point): retained as cited; the package defers it to the EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- `RankZeroOneBSD:BSD.9/point-11-order` (Order of the 11 fixture point): retained as cited; the package defers it to the EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- `RankZeroOneBSD:BSD.9/point-37` (Actual 37 fixture point): retained as cited; the package defers it to the EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- `RankZeroOneBSD:BSD.9/point-37-order` (Order of the 37 fixture point): retained as cited; the package defers it to the EllipticCurves worked examples (11.a3 torsion, 37.a1 rank).
- `RankZeroOneBSD:BSD.9/point-32` (Actual 32 fixture point): retained unchanged.
- `RankZeroOneBSD:BSD.9/point-32-order` (Order of the 32 fixture point): retained unchanged.
- `RankZeroOneBSD:BSD.9/fixture-11-good-five` (Rational five-torsion theorem-range test): retained with computational inputs restated as hypotheses.
- `RankZeroOneBSD:BSD.9/fixture-32-cm-additive` (CM and additive dyadic fixture): retained with computational inputs restated as hypotheses.
- `RankZeroOneBSD:BSD.9/fixture-period-height-comparisons` (Fixture periods, heights and regulator conventions): retained unchanged.
- `RankZeroOneBSD:BSD.9/mellin-central-tail-bounds` (Central Mellin formulas with explicit tails): retained unchanged.
- `RankZeroOneBSD:BSD.9/analytic-fixture-enclosures` (Certified central values for the three fixtures): superseded.
- `RankZeroOneBSD:BSD.9/fixture-finite-arithmetic` (Finite descent and saturation for the three fixtures): superseded.
- `RankZeroOneBSD:BSD.9/fixture-11-isogeny-period` (Five-isogeny and torsion-square comparison): retained unchanged.
- `RankZeroOneBSD:BSD.9/rank-equality-example` (Rank equality comparison example): retained unchanged.
- `RankZeroOneBSD:BSD.9/whole-sha-finiteness-example` (Whole Sha finiteness comparison example): retained unchanged.
- `RankZeroOneBSD:BSD.9/fixed-prime-example` (Fixed prime BSD comparison example): retained unchanged.
- `RankZeroOneBSD:BSD.9/full-bsd-example` (Full BSD certificate comparison examples): retained with computational inputs restated as hypotheses.
- `RankZeroOneBSD:BSD.9/missing-exception-fixture` (Missing exceptional prime regression): retained unchanged.

Superseded declarations:

- `RankZeroOneBSD:BSD.9/analytic-fixture-enclosures`, replaced by `explicit-nonvanishing-criterion`, `conditional-fixture-ranks`: Its target is a replayed numerical interval computation resting on ComputationalNumberTheory CN.4, which the maintainer dropped on 2026-10-16; the mathematics is the general criterion, and the three curves' inequalities become hypotheses.
- `RankZeroOneBSD:BSD.9/fixture-finite-arithmetic`, replaced by `odd-sha-from-heegner-index`, `gross-37a-sha-vanishing`, `conditional-sha-vanishing-fixtures`: Finite descents, saturation searches and annihilator replays are computations, not targets (maintainer decision 2026-10-16); the general Heegner-index and prime-part theorems that turn such data into Ш orders are planned here, the data become hypotheses.

Declarations kept with their computational inputs restated as hypotheses:

- `RankZeroOneBSD:BSD.9/fixture-11-good-five`, with `rational-torsion-eisenstein-ordinary`, `conditional-eisenstein-five`: Keep the statement; its point count mod 5 and isogeny construction become hypotheses, and the range test is the general rational-torsion theorem.
- `RankZeroOneBSD:BSD.9/fixture-32-cm-additive`, with `cm-branch-range`, `conditional-full-formula`: Keep the model facts; the dyadic Tate-algorithm trace, conductor and torsion become hypotheses of the conditional applications, and the branch consequences of CM are the general theorem cm-branch-range.
- `RankZeroOneBSD:BSD.9/full-bsd-example`, with `conditional-full-formula`: Its inputs become the explicit data hypotheses of conditional-full-formula; replace its prerequisite fixture-finite-arithmetic accordingly.

Edges for the assembly (input → consumer):

- `coefficient-bound` → `RankZeroOneBSD:BSD.9/mellin-central-tail-bounds`: Promotes the coefficient estimate used in the parent's tail proof to its own lemma.
- `exponential-integral-bounds` → `RankZeroOneBSD:BSD.9/mellin-central-tail-bounds`: Supplies the bound E₁(x) < e^{−x}/x used in the derivative tail.
- `conditional-fixture-ranks` → `RankZeroOneBSD:BSD.9/rank-equality-example`: Replaces the prerequisite analytic-fixture-enclosures.
- `conditional-fixture-ranks` → `RankZeroOneBSD:BSD.9/whole-sha-finiteness-example`: Replaces the prerequisite analytic-fixture-enclosures.
- `conditional-fixture-ranks` → `RankZeroOneBSD:BSD.9/fixture-11-good-five`: Replaces the prerequisite analytic-fixture-enclosures.
- `conditional-eisenstein-five` → `RankZeroOneBSD:BSD.9/fixed-prime-example`: The general range test and the Keller–Yin instance.
- `conditional-sha-vanishing-fixtures` → `RankZeroOneBSD:BSD.9/full-bsd-example`: Replaces the prerequisite fixture-finite-arithmetic.
- `conditional-full-formula` → `RankZeroOneBSD:BSD.9/full-bsd-example`: The explicit-data form of the application.
- `exact-rank-zero-quotient` → `RankZeroOneBSD:BSD.9/fixture-11-isogeny-period`: Supplies the exact N = 11 modular-symbol ratio L(11a1,1)/Ω = 1/5 that the parent imports.
- `cm-branch-range` → `RankZeroOneBSD:BSD.9/fixture-32-cm-additive`: The CM and nonsemistability consequences for the named branches.
- `dyadic-branch-exclusion` → `RankZeroOneBSD:BSD.9/missing-exception-fixture`: Shows that no named branch can supply the deleted dyadic entry.

Planets: Its planet 'Certified rank zero and one examples' leaves the atlas with the node; the layer's analytic planet is now 'Explicit nonvanishing criterion for L(E,1)'. With this packet's four planets and the parent's two remaining BSD.9 planets (fixture-11-good-five, fixture-32-cm-additive) the layer shows six.

## Dependencies on other roadmaps

Within RankZeroOneBSD the layer uses BSD.0 (the L-function, root number and analytic rank), BSD.1 (the odd decomposition of Ш over a quadratic field), BSD.4 (rank and finiteness), BSD.5 (the defect, rationality and the Heegner index), BSD.6–BSD.7 (the named prime-part branches) and BSD.8 (certificates and the dispatch). Other roadmaps: GrossZagierAndArithmeticHeights GZ.0 (period and height conventions) and GZ.3 (the Manin constant); EllipticCurveModularity R29.3–R29.6 (the newform, conductor, local factors, parametrisation and functional equation); ModularSymbolsPadicLFunctions L0–L1 (period symbols, Hecke operators, the involution at infinity, the Mellin formula); HeegnerPointEulerSystems HE.1, HE.6, HE.7 (Heegner points, Gross's clean descent, the square-index bound); ComplexMultiplicationAndExplicitReciprocity CM.3, CM.5 (integrality of CM j-invariants, potential good reduction); QSeriesPartitionsAndMockModularForms QM.3 (the incomplete gamma function). Requests to TauCetiRoadmap EllipticCurves:

- TauCetiRoadmap EllipticCurves Layer 1: The cyclic ℚ-rational isogeny with a given rational kernel, and the dual isogeny. (for `rational-torsion-eisenstein-ordinary`).
- TauCetiRoadmap EllipticCurves Layer 2: The Weil pairing with determinant the cyclotomic character, and the torsion subgroup API. (for `rational-torsion-eisenstein-ordinary`).
- TauCetiRoadmap EllipticCurves Layer 3: The Hasse bound |a_p| ≤ 2√p for the Frobenius trace a_p = p + 1 − #Ẽ(𝔽_p), and finite-field point counts. (for `coefficient-bound`, `manin-closing-the-path`, `rational-torsion-eisenstein-ordinary`).
- TauCetiRoadmap EllipticCurves Layer 4: Reduction types (good, split and nonsplit multiplicative, additive) and potential good reduction ⇔ v_p(j) ≥ 0. (for `cm-branch-range`).
- TauCetiRoadmap EllipticCurves Layer 6: Reduction-injectivity of the rational torsion at good odd primes; the x-height canonical height and regulator normalisation. (for `ec-bsd-statement-compatibility`, `rational-torsion-eisenstein-ordinary`).
- TauCetiRoadmap EllipticCurves Layer 7: Ш(E/ℚ), the BSD quotient with the explicit-integral real period, and the statement-only BSD milestone over ℚ with its analytic hypothesis. (for `ec-bsd-statement-compatibility`, `public-sha-endpoint`).

## Acceptance tests of the layer

- Rank zero with the empty regulator: on 11a3 and 32a2 the regulator is 1 in both normalisations (Tau Ceti `regulator_eq_one_of_finrank_eq_zero`).
- Rank one with an index-square calculation: on 37a1, replacing the generator P by 2P multiplies the height by 4, and a Heegner index divisible by 3 leaves the 3-part of Ш undecided (`gross-37a-sha-vanishing`).
- Rational torsion: the torsion square turns the analytic valuation v_5(1/25) = −2 into v_5(#Ш) = 0 on 11a3 (`conditional-eisenstein-five`); the CGS branch is excluded there, Keller–Yin applies.
- An unresolved 2-part blocks only the full formula: no named branch reaches p = 2 (`dyadic-branch-exclusion`), the positive rationals 2 and 1/4 pass every odd test (`dyadic-gate`), and the rank and Ш endpoints take no dyadic input.
- Analytic evidence is not arithmetic evidence: the nonvanishing criterion gives no information on Ш, and a 2-Selmer computation gives no odd primary part (`conditional-sha-vanishing-fixtures`).

## Sources

- [Rank-zero and rank-one Birch–Swinnerton-Dyer theory](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), Tau Ceti Atlas; content/campaign/RankZeroOneBSD/README.md at the atlas snapshot; accessed 2026-10-19. Read: BSD.0–BSD.9 stage texts; Source and review contracts; September 2026 implementation handoff.
- [Roadmap: elliptic curves (TauCetiRoadmap EllipticCurves README)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/34dcf0e2b60d68a705742ee408e5392ddabbd00a/TauCetiRoadmap/EllipticCurves/README.md), Tau Ceti contributors; TauCetiRoadmap main at 34dcf0e2b60d68a705742ee408e5392ddabbd00a (2026-10-19); accessed 2026-10-19. Read: Layer 6 (Mordell–Weil, canonical-height normalisation, torsion and Nagell–Lutz); Layer 7 (Selmer, Sha, BSD quotient and statement-only milestone); Layer 8; Worked examples.
- [Algorithms for Modular Elliptic Curves, Chapter II: Modular symbol algorithms](https://johncremona.github.io/book/fulltext/chapter2.pdf), John E. Cremona; Second edition (1997), corrected author online edition; SHA-256 432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94; accessed 2026-10-19. Read: §2.8 pp.29–31; §2.11 pp.37–38; §2.12 pp.41–42; §2.13 pp.42–44.
- [Algorithms for Modular Elliptic Curves: worked examples](https://johncremona.github.io/book/fulltext/examples.pdf), John E. Cremona; Second edition (1997), corrected author online edition; SHA-256 20a4118e6cd82e9d9adc59070fa039594f09888f26a1259e1ebe18426484878c; accessed 2026-10-19. Read: N = 11 and N = 37 examples (comparison data only).
- [Algorithms for Modular Elliptic Curves: Table 1](https://johncremona.github.io/book/fulltext/table1.pdf), John E. Cremona; Second edition (1997), corrected author online edition; accessed 2026-10-19. Read: rows 11A3, 37A1, 32A2 and class 32A, as already registered by the BSD.7 packet; comparison data, not proofs.
- [Kolyvagin's work on modular elliptic curves](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Benedict H. Gross; L-functions and Arithmetic (Durham, 1989), LMS Lecture Note Series 153 (1991), 235–256; scanned copy; SHA-256 60b310c58a3494860c5967a03569a7d30033e9074d9d3d9a0d5bc2dfedd46b32; accessed 2026-10-19. Read: §1 pp.235–237 (Conjecture 1.2, Theorem 1.3, the X₀(37)/w₃₇ example); §2 opening and Proposition 2.1, p.237.
- [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/pdf/2402.12781v2), Timo Keller, Mulun Yin; arXiv:2402.12781v2 (30 October 2024); SHA-256 bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a; accessed 2026-10-19. Read: Introduction §§0.1–0.3 pp.2–6 (Theorems B, C, D; examples); §4.2 Theorem 4.2.1 and its proof, pp.42–43.
- [Mazur's main conjecture at Eisenstein primes](https://arxiv.org/pdf/2303.04373v2), Francesc Castella, Giada Grossi, Christopher Skinner; arXiv:2303.04373v2 (15 October 2025); SHA-256 5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90; accessed 2026-10-19. Read: §1 Theorem A, p.2; §1.2 Theorem D and the examples, pp.4–5.
- [NIST Digital Library of Mathematical Functions, Chapter 6: Exponential, Logarithmic, Sine, and Cosine Integrals](https://dlmf.nist.gov/6.6), N. M. Temme (chapter author); F. W. J. Olver et al. (eds.); online edition, §§6.6 and 6.8 as served on 2026-10-19; accessed 2026-10-19. Read: §6.6 power series, equation 6.6.2 (page SHA-256 c3456db84f1daac38a2c036ddf94e15759cf1aa3630c842d88a7cc04c70ebaff); §6.8 inequalities 6.8.1–6.8.3, https://dlmf.nist.gov/6.8 (page SHA-256 84aed707eca909906a8abb8ed0e90d410162a33dd68bca5057f7e0af99171383).
- [The L-function of a Weierstrass curve](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean), Thomas Browning (Mathlib); Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; accessed 2026-10-19. Read: localPolynomial, localEulerFactor, LFunction, LSeries.
- [Arithmetic functions: σ and divisor counts](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/Misc.lean), Mathlib contributors; Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; accessed 2026-10-19. Read: sigma_zero_apply, sigma_zero_apply_prime_pow, Nat.Coprime.card_divisors_mul.
- [The Euler–Mascheroni constant](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean), Mathlib contributors; Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; accessed 2026-10-19. Read: eulerMascheroniConstant and its bounds; GammaDeriv.lean eulerMascheroniConstant_eq_neg_deriv.
- [Dimension formula for level-one modular forms](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean), Mathlib contributors; Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; accessed 2026-10-19. Read: levelOne_weight_two_rank_zero, dimension_level_one.
- [Uniqueness of analytic continuation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Analytic/Uniqueness.lean), Mathlib contributors; Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; accessed 2026-10-19. Read: AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq.
