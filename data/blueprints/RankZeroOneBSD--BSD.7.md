# Rank-zero and rank-one BSD: Eisenstein primes and exact certificates

This document plans BSD.7, BSD.7a, BSD.8 and BSD.9. It continues the sixteen-declaration rational certificate core, imports the actual elliptic-curve and BSD objects from their owners, and gives a target-level proof chain for each endpoint. All four stages are **planned**. The planning pass is complete; the stages are not closed, and no declaration is claimed implemented. The seven explicit gaps and supplier contracts below are part of the plan.

The accepted RS-30 restructuring is binding. BSD.7 owns Eisenstein-prime **BSD formulas**; BSD.7a owns their independent **main-conjecture proofs**. BSD.8 assembles complete prime certificates for an individual curve or a specified family. BSD.9 owns the actual comparison fixtures and distinct public endpoints. HE.8b, Modular Iwasawa Main Conjectures L6 and Elliptic Periods and Special Values PS.6 consume these results. Their reexports cannot prove the independent results here.

## Objects and conventions

An elliptic curve is an actual Weierstrass curve over ℚ, with its minimal Néron differential and its existing point group. The analytic function is BSD.0’s entire continuation of the actual Euler-product L-function. Its order of vanishing defines analytic rank; a formal Dirichlet-series sum at 1 does not define the central value. BSD.4 supplies rank equality and finiteness of the **whole** Sha group at analytic rank at most one. These conclusions give neither its exact cardinality nor an effective exponent bound.

BSD.5 supplies the positive rational defect

\[
 d_E=\frac{L^*(E,1)\,\#E(\mathbf Q)_{\rm tors}^{,2}}
 {\Omega_E\,\operatorname{Reg}_{\rm BSD}(E/\mathbf Q)\,
  \#\Sha(E/\mathbf Q)\,\prod_\ell c_\ell(E)}\in\mathbf Q_{>0}.
\]

Here \(L^*\) is the leading Taylor coefficient. The full real period is
\(\Omega_E=c_\infty\Omega_E^+\), where \(c_\infty=1\) for negative discriminant and 2 for positive discriminant. Count this component factor once. The BSD regulator uses the full free Mordell–Weil lattice, with regulator 1 in rank zero. At the pinned Tau Ceti commit its Néron–Tate pairing is half the BSD pairing, so the imported GZ.0 convention dictionary gives
\(\operatorname{Reg}_{\rm BSD}=2^r\operatorname{Reg}_{\rm Tau}\).
For a nontorsion point in rank one,
\(I_{\rm full}=I_{\rm free}\#E(K)_{\rm tors}\) and
\(h_{\rm BSD}(P)=I_{\rm free}^2\operatorname{Reg}_{\rm BSD}\), with the separate field-degree height normalization retained. A full-group index cannot be put into this height identity without dividing by torsion squared.

The mathematical fixed-prime endpoint is \(v_p(d_E)=0\). The final rational gate uses Mathlib’s integer-valued `padicValRat`. That function assigns valuation zero to rational zero, so positivity is essential: both 0 and −1 defeat a reconstruction rule that omits it. The canonical support is the union of prime factors of the reduced numerator’s absolute value and the positive denominator. A finite valuation certificate has a set of primes, proofs of their primality, a proof that this set covers the actual support, and a zero-valuation proof at every listed prime. It does not store its desired conclusion as a field.

## BSD.7: exact good Eisenstein-prime formulas

For CGS Theorem D, take an odd prime of good reduction and an actual cyclic p-isogeny kernel character φ with \(\phi|G_p\ne1,\omega\). Reducible good residual representation implies ordinarity; the local exclusion also proves local p-torsion vanishes. For analytic rank zero or one, the theorem proves \(v_p(d_E)=0\). Global semistability and a non-CM hypothesis are not added to its final statement.

Keller–Yin Theorem C/4.2.1 permits **every odd good Eisenstein prime**, including local characters 1 and ω and rational p-torsion. Its formula retains the torsion-square denominator. This is a separate theorem chain through a chosen nonsplit invariant-free lattice, the exceptional local character computations, corrected residual λ formulas, lattice transfer and Appendix B’s torsion-sensitive control. It is not obtained by deleting a hypothesis from CGS. Its source is the verified v2 preprint; no unverified journal version is asserted.

The rank-zero route uses the integral cyclotomic equality and exact control. The ordinary interpolation factor \((1-\alpha_p^{-1})^2\), global/local torsion and Néron periods cancel through the control calculation. A main conjecture after inverting p leaves the relevant valuation undecided. The CGLS/Greenberg–Vatsal prototype has an additional kernel-character condition: ramified and even, or unramified and odd. Its rank-one prototype has the opposite parity condition. Those restrictions remain on the prototype nodes; the newer cyclotomic argument supplies the wider theorem.

For rank one, BSD.2 chooses an imaginary quadratic K satisfying the Heegner and split-p conditions with \(L(E^K,1)\ne0\). Root number alone is insufficient. The actual Gross–Zagier, BDP and anticyclotomic control identities give
\(v_p(d_E)+v_p(d_{E^K})=0\). The rank-one defect is the **negative** twist defect. The printed CGLS equation (5.7) has the wrong sign; the source register records this and the full-index height correction. Since the rank-zero twist defect vanishes, the desired rank-one valuation vanishes.

These BSD nodes concern good reduction. Keller–Yin’s multiplicative main-conjecture and p-converse statements do not establish an unproved BSD formula at a bad prime.

## BSD.7a: independent integral main-conjecture chains

The generic Selmer, Iwasawa, Euler-system and cohomological carriers belong to their supplier roadmaps. This stage specializes them to the actual curve, residual extension and lattice. It distinguishes ordinary, ordinary-relaxed, ordinary-strict, and Greenberg conditions, with the strict and unrestricted split-p places fixed. Primitive/imprimitive comparison uses exactly the finite set \(S=\Sigma\setminus\{v,\bar v,\infty\}\). Euler corrections are determinants on inertia invariants, evaluated at the source tautological Frobenius. Neither an infinite sum over places nor an archimedean factor occurs.

The CGLS residual comparison uses the actual nonsplit residual sequence, not just its semisimplification. Together with the Kriz p-depleted CM congruence and character-module main conjectures, it independently gives anticyclotomic μ=0 and equality of λ. Equal μ and λ alone do not identify distinguished polynomials: a proved containment is still needed.

CGS supplies a Kolyvagin bound uniform as characters approach 1. The constants do not grow with the congruence exponent. This repairs the augmentation localization in the early HE.8 weak divisibility, leaving a containment over Λ[1/p]. The independent μ/λ computation then removes the coefficient-prime ambiguity. Poitou–Tate and actual logarithm reciprocity identify the corresponding Greenberg/BDP and Heegner index-square directions. The resulting CGS Greenberg and index-square equalities are integral and remove the older CGLS `(Sel)` corank-one condition.

Keller–Yin requires a different local calculation when a character is 1 or ω. The trivial local restriction kernel is cofree of rank one; the cyclotomic local dual has rank one and projective dimension at most one but needs two generators. Finite Λ-submodules cannot simply be discarded in a Fitting calculation. On the chosen nonsplit lattice, the globally trivial character contributes
\(\operatorname{char}(X_1)=(T L_1)\), so \(\lambda(X_1)=\lambda(L_1)+1\). This exactly cancels the algebraic residual formula’s extra +1. The chosen lattice and analytic ordering of characters need not coincide. Fixed p-power lattice/class factors are retained until the invariant comparison justifies their removal.

The KY uniform bound is stated separately, without the CGS character exclusions. Its integral Kolyvagin divisibility includes the coefficient height-one prime. The Greenberg/unramified equality is integral in Λⁿʳ, with a finite restriction kernel accounting for their height-one equivalence. A source discrepancy is explicit: Introduction Theorem B prints its index-square equality in Λ, while §3.0.8 uses the undefined label Λᵃᶜ, which CGLS uses for Λ[1/p]. The plan retains the weaker coefficient-ring assertion and asks for an integral two-way class/lattice comparison before exporting the stronger statement. This does not turn the separately stated integral IMC2 into a rational theorem.

The cyclotomic proof needs an additional **integral** input. Wüthrich’s distinguished isogenous curve \(E_\bullet\), étale lattice comparison, integral Kato element and integral ordinary divisibility belong to Kato L4. Its present rationalized ordinary-divisibility node is insufficient. The request lists Theorem 4, Proposition 8, Theorem 13, Theorem 16, Lemma 17 and Corollary 18 precisely, including the nonfree cohomology example. Their local assumption is semistable reduction at p; good p satisfies it even if another prime is additive. Ferrero–Washington belongs to Integral Iwasawa Theory L4.

CGS’s specialized actual Beilinson–Flach class has two independent normalized Coleman reciprocity images. Its class is constructed from KLZ’s motivic classes, never defined as a preimage of the predicted L-function. The two consumed reciprocity APIs are promoted to separate lemma nodes. Poitou–Tate compares BF-index, Greenberg and ordinary containments direction by direction. The nontrivial-twist Euler-system bound is initially rational. Wüthrich plus high-power congruence supplies the μ inequality that repairs integrality; anticyclotomic equality and nonzero augmentation control make the remaining quotient a unit. Cyclotomic μ is allowed to be positive. Untwisting and odd quadratic splitting then give the integral equality over ℚ; both individual integral containments are needed to descend the product equality.

The elliptic-unit proofs used for the character functions are genuinely missing from the atlas. A Katz construction cannot supply Rubin, Hida–Tilouine or Hida’s μ theorem. The owner proposal below aligns with the identical HE.7s proposal and records its unread primary proofs as a gap. HE.8b and MIMC L6 are downstream outputs throughout this argument.

## BSD.8: complete finite certificates and arithmetic producers

A positive rational with valuation zero at every prime is 1. The canonical-support constructor and the exception-set constructor therefore produce complete certificates only from genuine inside and outside proofs. For an explicit finite exceptional set S, each p in S needs a source-qualified theorem instance or a certified arithmetic calculation; every prime outside S also needs a proved theorem range or support cover. “Sufficiently large” is not an outside proof for a particular supplied S without a proved bound.

The arithmetic adapters keep four obligations separate. A finite pⁿ-Selmer presentation computes Sha[pⁿ] through the actual Kummer exact sequence and full Mordell–Weil quotient. Identifying it with Sha[p∞] requires a proved exponent bound. A positive annihilator of the whole finite Sha group, including all exceptional constants, permits a finite reconstruction over its prime divisors. A rank-one point requires a complete saturation or height/index-bound search to identify the full free lattice. Local Tamagawa and isogeny computations require exact minimal-model/component-group and differential/kernel/cokernel traces, including residue characteristics 2 and 3.

After modular-symbol or Gross–Zagier rationality identifies the actual defect, these adapters can certify excluded valuations on an individual curve or specified family. Analytic Sha entries in databases are not arithmetic certificates. The final family theorem quantifies a complete certificate for every actual parameter curve; neither its exceptions nor its bounds need be uniform across the family.

## BSD.9: actual comparison fixtures and endpoint tests

| Fixture | Actual coefficient tuple | Discriminant | Intended arithmetic target | Purpose |
|---|---|---:|---|---|
| 11a3 | (0,−1,1,0,0) | −11 | rank 0, torsion 5, Tamagawa product 1 | Rational 5-torsion and good Eisenstein p=5 |
| 37a1 | (0,0,1,−1,0) | 37 | rank 1, torsion 1, Tamagawa product 1 | Actual free generator, height and regulator |
| 32a2 | (0,0,0,−1,0) | 64 | rank 0, torsion 4, Tamagawa product 2 | CM by ℤ[i], additive dyadic reduction |

These are actual Mathlib models and actual affine points, not carriers with predicted invariants. Exact addition gives order 5 for (0,0) on 11a3, order 2 on 32a2, and infinite order on 37a1: its eighth multiple has x-coordinate 21/25. The explicit short integral model X=4x, Y=8y+4 has equation Y²=X³−16X+16 and X(8P)=84/25, which Lutz–Nagell excludes for rational torsion. The 37 point still needs a saturation certificate before it computes the full regulator. On 11a3, the four affine points over 𝔽₅ plus O give a₅=1. Its trivial kernel character fails CGS’s exclusion and tests the broader KY theorem. On 32a2, the three rational roots give the nonzero 2-torsion points; the dyadic Tate trace gives type III and c₂=2. The automorphism over ℚ(i) and the imported endomorphism classification supply actual CM.

The analytic tests use convergent Mellin formulas. For \(\beta=2\pi/\sqrt N\) and \(\rho=e^{-\beta}\), root number +1 gives
\(L(E,1)=2\sum(a_n/n)e^{-\beta n}\), and root number −1 gives
\(L'(E,1)=2\sum(a_n/n)E_1(\beta n)\), with
\(E_1(x)=\int_x^\infty e^{-t}/t\,dt\).
Hasse and multiplicativity give \(|a_n|\le n^2\). After terms through M, the absolute tails are bounded by

\[
 \frac{2\rho^{M+1}((M+1)-M\rho)}{(1-\rho)^2},\qquad
 \frac{2\rho^{M+1}}{\beta(1-\rho)}.
\]

The acceptance intervals are 1/4<L(11a3,1)<3/10, 1/4<L′(37a1,1)<1/3 and 3/5<L(32a2,1)<7/10. Exact coefficient/root-number identification and outward rational elementary-function/E₁ replay, including every finite-sum error and infinite tail, must prove them. Source decimals select the intervals; they are not nonvanishing proofs. CN.4 supplies generic interval arithmetic and is requested to extend its validated elementary-function exports.

Finite arithmetic certificates target Sha order 1 for each fixture, but this target remains conditional on a proved whole-Sha annihilator and complete primary presentations. Gross’s 37 example and Theorem 1.3 retain the exceptional power of 2; Conjecture 1.2 is not a Sha-cardinality theorem. The 11a3/11a1 five-isogeny comparison tests exact Néron differential and full-period transport: Ω(11a3)=5Ω(11a1), so the optimal model’s exact modular-symbol ratio 1/5 becomes 1/25 on 11a3. Its torsion-square factor 25 is essential.

The four public applications are distinct: rank equality, whole-Sha finiteness, a fixed-prime formula, and the full formula from a complete certificate. Removing an unresolved exceptional prime blocks the last application. The positive rational countermodels 2 and 1/4 have zero valuation at all odd primes and nonzero dyadic valuation, so neither admits a complete certificate.

## Declaration plan

Each entry below is a declaration target with its exact hypotheses, direct prerequisites, proof steps and acceptance check. Definitions and constructions additionally list their use-derived API and discriminating tests. Stage requests are precise contracts, not assertions that those libraries are already implemented. The accompanying packet records the same inventory and library destinations.

### RankZeroOneBSD:BSD.7

#### CGLS rank-one anticyclotomic control

Declaration: `RankZeroOneBSD:BSD.7/cgls-torsion-free-control` (theorem).

Assume E has good ordinary reduction at odd split p, rank E(K)=1, finite Ш(E/K)[p∞], and E(ℚ_p)[p]=0. If F_E generates char of the primitive anticyclotomic Greenberg dual and P∈E(K) is nontorsion, then #ℤ_p/F_E(0)=#Ш(E/K)[p∞]·( #(ℤ_p/(((1−a_p+p)/p)log_ω P)) / [E(K):ℤP]_p )²·∏_{w|N}c_w(E/K)_p. The full index equals free index times torsion order; local vanishing makes the torsion order a p-unit in this branch.

Hypotheses: K has Heegner/split/discriminant conditions. p>2, good ordinary, E(ℚ_p)[p]=0; rank E(K)=1; finite p-primary Sha; P nontorsion.

Proof plan:

1. Specialize SIC’s anticyclotomic descent and its global-to-local image with the actual local conditions.
2. Apply CGLS Theorem 5.1.1’s weakening of JSW residual irreducibility to E(K)[p]=0, justified by K_v=ℚ_p.
3. Compute the local Kummer/logarithm cokernel and the full lattice index, retaining the ordinary factor (1−a_p+p)/p and all K-primes over N.

Direct prerequisites: `SelmerIwasawaCohomology:L3`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `RankZeroOneBSD:BSD.5/heegner-index`, `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`.

Acceptance: The control theorem is not applied unchanged to X₁(11) at p=5.

Sources: [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 5.1.1, p.571. The control formula uses the full index and depends on local torsion vanishing.

#### Keller–Yin control with rational torsion

Declaration: `RankZeroOneBSD:BSD.7/ky-torsion-control` (theorem). Planet: **Anticyclotomic control with torsion**.

In KY Appendix B’s weight-two rank-one setting, drop residual irreducibility but retain the stated rank, local nonzero and finite BK-Sha hypotheses. Put δ_v=coker(H¹_f(K,T)→H¹_f(K_v,T)/tors). Then #Sel_ac(W)=#Ш_BK(W/K)·#δ_v², and #O/f_ac^Σ(0)=#Sel_ac(W)·C^Σ(W)/(#H⁰(K,W)·#H⁰(K,W)^∨), with C^Σ the exact product of both p-place H⁰ orders and the listed unramified/removed local H¹ factors. Keep the global localization image G, since surjectivity can fail. For an elliptic E and P nontorsion the primitive specialization is #ℤ_p/f_E(0)=#Ш(E/K)[p∞]·( #(ℤ_p/(((1−a_p+p)/p)log_ω P))/(I_free,p·#E(K)_tors,p) )²·∏_{w|N}c_w(E/K)_p.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. rank E(K)=1 and finite Ш(E/K)[p∞]; nonzero localization; source Appendix B’s weight-two local/dual hypotheses; correct translation of its S and Σ.

Proof plan:

1. Use the integral local finite condition modulo torsion for δ_v; correct the printed codomain typo by the immediately following (B.1).
2. Follow B.0.1/B.0.2’s snake-lemma control using G=image(loc) and both finite global H⁰ denominators; compute coinvariants as well as invariants.
3. Remove the same finite local factors and substitute the full index I=I_free·#tors as in §4.2; local and global torsion cannot be dropped before cancellation.

Direct prerequisites: `SelmerIwasawaCohomology:L3`, `SelmerIwasawaCohomology:L2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `RankZeroOneBSD:BSD.5/heegner-index`, `RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization`.

Acceptance: If p divides E(K)_tors, its contribution is −2v_p(#tors) in the Sha/log control equation.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Appendix B Propositions B.0.1–B.0.2, (B.1)–(B.2); §4.2, p.42. The localization-image diagram replaces the earlier assumed surjectivity and retains torsion corrections.

#### Greenberg–Vatsal rank-zero prototype

Declaration: `RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype` (theorem).

Let A/ℚ have good ordinary reduction at p>2 and an actual cyclic p-isogeny whose kernel character is ramified at p and even, or unramified at p and odd. If L(A,1)≠0 then v_p(L(A,1)/Ω_A)=v_p(#Ш(A/ℚ)·Tam(A)/#A(ℚ)_tors²). The torsion denominator remains in the source statement. The parity/ramification restrictions are retained; the CGS cyclotomic route supplies the wider rank-zero case.

Hypotheses: The exact parity/ramification hypothesis above; p odd good ordinary; nonzero actual central value.

Proof plan:

1. Use the source Greenberg–Vatsal ordinary main-conjecture input and its integral period comparison, as requested from MIMC/ModularSymbols.
2. Apply exact rank-zero control and the finite-Sha conclusion of BSD.4 to the actual curve.
3. Identify the rational positive leading-term quotient with BSD.5’s defect, including the torsion square and full real period.

Direct prerequisites: `ModularIwasawaMainConjectures:L0`, `SelmerIwasawaCohomology:L3`, `ModularSymbolsPadicLFunctions:L3`, `RankZeroOneBSD:BSD.5/rational-bsd-defect`, `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`.

Acceptance: The trivial kernel character is unramified and even, so it fails this prototype.

Sources: [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 5.1.4, p.573. This is the routed prototype; it is not a universal good Eisenstein theorem.

#### Rank-zero defect from integral cyclotomic equality

Declaration: `RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect` (comparison).

For an actual E/ℚ with analyticRank E=0 and an odd good ordinary p, an integral cyclotomic main-conjecture equality in the Néron-period MSD normalization, together with exact cyclotomic control including global/local torsion and Euler factors, implies v_p(bsdDefect E)=0. The interpolation factor (1−α_p⁻¹)² is retained on both sides until control cancels it; full real period versus positive period contributes c∞, a p-unit for odd p.

Hypotheses: analyticRank E=0; p odd good ordinary; the stated integral main-conjecture equality and exact control are proved for this E.

Proof plan:

1. Apply MSD interpolation at the trivial character, using actual L(E,1)≠0 and Néron positive period.
2. Apply the torsion-sensitive rank-zero control theorem with its H⁰ and local factor terms. Match the ordinary Euler factor and torsion-square denominator.
3. Use GZ.0’s full-period component formula and BSD.5’s actual defect identity.

Direct prerequisites: `SelmerIwasawaCohomology:L3`, `ModularIwasawaMainConjectures:L0`, `ModularSymbolsPadicLFunctions:L3`, `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`, `RankZeroOneBSD:BSD.5/rational-bsd-defect`, `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`.

Acceptance: A rational main conjecture alone leaves a possible coefficient-prime error.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), §1.2 proof of Theorem D; §2.1 Proposition 2.1.1. The rank-zero argument of CGLS §5.1 is upgraded using the new integral cyclotomic equality.

#### Rank-one twist comparison with torsion

Declaration: `RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison` (comparison).

If analyticRank E=1 and K is selected with L(E^K,1)≠0 and the odd-p Heegner/split conditions, then the anticyclotomic main-conjecture equality, exact control and actual Gross–Zagier/BDP formulas imply v_p(bsdDefect E)+v_p(bsdDefect E^K)=0. In height/index terms use I_free=[E(K)/tors:ℤP̄], I=I_free·#E(K)_tors and h_BSD(P)=I_free²Reg_BSD(E/K). Thus the rank-one defect equals the negative of the rank-zero twist defect; the printed CGLS (5.7) sign and full-index height identity are corrected.

Hypotheses: p odd good ordinary, rank E(K)=1, finite whole Sha from BSD.4, L(E^K,1)≠0; source main-conjecture and either the CGLS or KY control hypotheses verified.

Proof plan:

1. Choose K by BSD.2 with split p and twist nonvanishing. Import actual base-change L factorization and Heegner nonvanishing, avoiding a root-number-only argument.
2. Apply the squared BDP logarithm reciprocity and the appropriate exact control, using the full/free index conversion from BSD.5.
3. Apply Gross–Zagier and the height, quadratic-regulator, period, Tamagawa, odd Sha and torsion decompositions. Add the two defect valuations to zero, retaining the minus sign on transfer to E^K.

Direct prerequisites: `RankZeroOneBSD:BSD.2/heegner-field-selection`, `RankZeroOneBSD:BSD.5/rational-bsd-defect`, `RankZeroOneBSD:BSD.0/base-change-central-identities`, `RankZeroOneBSD:BSD.5/heegner-index-height-formula`, `RankZeroOneBSD:BSD.1/quadratic-regulator-comparison`, `RankZeroOneBSD:BSD.1/odd-part-bsd-over-K`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `RankZeroOneBSD:BSD.7/cgls-torsion-free-control`, `RankZeroOneBSD:BSD.7/ky-torsion-control`.

Acceptance: A nonzero twist defect δ produces −δ on the rank-one side, not +δ. The regulator formula uses the free index; full index includes torsion.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), §4.2 pp.42–43; corrected CGLS §5.3 (5.5)–(5.7). KY explicitly gives the negative twist-defect relation and the torsion terms.

#### CGLS rank-one Eisenstein BSD prototype

Declaration: `RankZeroOneBSD:BSD.7/cgls-rank-one-prototype` (theorem).

For analytic rank one, p>2 good ordinary, an actual p-isogeny kernel character φ with φ|G_p≠1,ω and φ ramified at p and odd, or unramified at p and even, v_p(bsdDefect E)=0. This is the source Theorem F/5.3.1 branch. Its opposite parity/ramification condition ensures the rank-zero quadratic twist satisfies Greenberg–Vatsal.

Hypotheses: The exact rank-one local exclusion and parity/ramification conditions above.

Proof plan:

1. Select K with L(E^K,1)≠0, using BSD.2.
2. Apply the CGLS prototype anticyclotomic equality, whose (Sel) is supplied by analytic rank one over K and whole-Sha finiteness.
3. Use rank-one-twist-defect-comparison and greenberg-vatsal-rank-zero-prototype for E^K with its changed parity.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/cgls-prototype-main-conjecture`, `RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison`, `RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype`, `RankZeroOneBSD:BSD.2/heegner-field-selection`, `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`.

Acceptance: The parity hypothesis is opposite to the GV rank-zero one.

Sources: [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 5.3.1, pp.576–577. The prototype keeps its parity restriction; CGS replaces the rank-zero input.

#### CGS good Eisenstein prime-part BSD

Declaration: `RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd` (theorem). Planet: **CGS Eisenstein prime-part BSD**.

Let E/ℚ be elliptic, p>2 a prime of good reduction, and φ the actual rational p-isogeny kernel character with φ|G_p≠1,ω. If analyticRank E∈{0,1}, then v_p(bsdDefect E)=0, equivalently v_p(L*(E,1)/(Ω_E Reg_BSD))=v_p(Tam(E)·#Ш(E/ℚ)[p∞]/#E(ℚ)_tors²). The local exclusion proves the torsion denominator is a p-unit, but it remains in this general interface. There is no global semistability or CM hypothesis added.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. analyticRank E is zero or one.

Proof plan:

1. Prove ordinarity and local p-torsion vanishing by eisenstein-ordinary-local-exclusion.
2. At rank zero combine cgs-cyclotomic-main-conjecture with cyclotomic-rank-zero-defect; this removes the older GV parity restriction.
3. At rank one choose K with a nonzero rank-zero twist; use cgs-anticyclotomic-main-conjecture, torsion-free control and rank-one-twist-defect-comparison. Apply the same rank-zero theorem to the twist.
4. Use BSD.5’s exact positive rational defect identity and whole-Sha finiteness to express the formula.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect`, `RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison`, `RankZeroOneBSD:BSD.5/rational-bsd-defect`.

Acceptance: A rational p-torsion point fails the CGS local character check.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Introduction Theorem D and §1.2 proof, pp.4–5. This is the exact CGS branch, with its actual local character hypothesis.

#### Keller–Yin good Eisenstein prime-part BSD

Declaration: `RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd` (theorem). Planet: **Keller–Yin Eisenstein prime-part BSD**.

Let E/ℚ be elliptic with analyticRank E∈{0,1}, and p>2 a prime of good reduction at which E has an actual cyclic p-isogeny. Then v_p(bsdDefect E)=0, equivalently v_p(L*(E,1)/(Ω_E Reg_BSD))=v_p(Tam(E)·#Ш(E/ℚ)[p∞]/#E(ℚ)_tors²). Rational p-torsion and local characters 1/ω are allowed. This is the verified KY v2 preprint Theorem C/4.2.1, not a deletion of hypotheses from CGS.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. analyticRank E is zero or one.

Proof plan:

1. Use KY’s corrected residual lattice, local cohomology and μ/λ arguments to prove its anticyclotomic and cyclotomic equalities on the actual original curve.
2. At rank zero apply torsion-sensitive cyclotomic-rank-zero-defect. At rank one use ky-torsion-control and rank-one-twist-defect-comparison with the full free-index/torsion correction.
3. The rank-zero twist has the same good Eisenstein property and its defect valuation vanishes by the new rank-zero route; conclude the negative twist defect is zero.
4. Express the result using the actual BSD.5 defect, retaining torsion squared.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality`, `RankZeroOneBSD:BSD.7/ky-torsion-control`, `RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect`, `RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison`, `RankZeroOneBSD:BSD.5/rational-bsd-defect`.

Acceptance: The X₁(11) curve at p=5 uses this branch with a nonunit torsion denominator.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Theorem C, p.4; Theorem 4.2.1 and proof, pp.41–43. The elliptic endpoint applies to every odd good Eisenstein prime with analytic rank at most one.

### RankZeroOneBSD:BSD.7a

#### Ordinarity and local invariants at a good Eisenstein prime

Declaration: `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion` (lemma).

Good reduction and a G_ℚ-stable line in E[p] imply ordinary reduction at p. Under CGS’s local exclusion both residual characters differ from 1 on G_p, so E(ℚ_p)[p]=0 and hence E(ℚ)[p]=0; for split p, E(K)[p]=0. In the Keller–Yin branch ordinarity still holds but this vanishing is not asserted.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

Proof plan:

1. Use the supersingular inertia description to exclude a residual one-dimensional G_p-subrepresentation; import the local representation classification.
2. Use φψ=ω. If either φ or ψ were trivial locally, φ would be 1 or ω. A local invariant vector would yield a trivial composition factor.
3. Restrict along K_v=ℚ_p to deduce E(K)[p]=0 only in the excluded-character case.

Direct prerequisites: `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `SelmerIwasawaCohomology:L2`.

Acceptance: A rational p-torsion point has character 1 and fails the CGS exclusion even when reduction is good ordinary.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), §1 Introduction and §3.4, before Lemma 3.4.1. The residual local exclusions justify precisely the no-invariants hypotheses used in CGS; KY removes them by a different lattice argument.

#### Ordinary, Greenberg and unramified Eisenstein Selmer comparisons

Declaration: `RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization` (comparison).

Specialize the imported Selmer structures to T_pE, its ordinary filtration and the cyclotomic/two-variable/anticyclotomic towers. Keep ordinary, ordinary-relaxed, ordinary-strict, and Greenberg (strict at v, unrestricted at v̄) distinct. For the KY unramified versus Greenberg comparison, restriction has the finite cyclic kernel of Lemma 1.3.6, so characteristic ideals agree after localization at height one; this does not identify integral Fitting ideals or finite control groups.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

Proof plan:

1. Instantiate SIC’s kernels and inverse limits with arithmetic Frobenius and the inverse tautological action.
2. Identify the finite restriction kernel from KY Lemma 1.3.6 and take the Pontryagin dual with the involution.
3. Use the source’s exact local conditions, not a name-based identification of different Selmer modules.

Direct prerequisites: `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L3`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`.

Acceptance: The strict/unrestricted places must not be interchanged without the induced conjugation/involution. A finite Λ-module can have unit characteristic ideal and nonunit Fitting ideal.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), §1.3 Lemmas 1.3.3–1.3.6; §3.0.8; §4.2. Finite differences disappear from characteristic ideals only at height one and still enter control.

#### Primitive and imprimitive Euler factors

Declaration: `RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison` (comparison).

Let Σ contain the bad primes, v,v̄,∞ and have all finite places split in K. Put S=Σ∖{v,v̄,∞}. For each w∈S define the source Euler factor from P_w(V,X)=det(1−Frob_w X|V^{I_w}) evaluated at the inverse tautological Frobenius. The primitive/imprimitive characteristic relation is char X^S=char X·∏_{w∈S}(P_w), and analytic removal multiplies by the same finite factors. Thus μ and λ corrections are those of exactly S, before cancellation; the assertion requires the source’s global-to-local surjectivity and H⁰ hypotheses.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Proof plan:

1. Apply SIC’s primitive/imprimitive exact sequence under the verified invariants and surjectivity conditions.
2. Identify the local quotient characteristic polynomial with CGS Proposition 3.3.1/CGLS §1.5; add its μ,λ only after proving torsion.
3. Match CGS Definitions 2.5.3–2.5.5, then cancel the same nonzero finite Euler product in the domain.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization`, `ModularIwasawaMainConjectures:L0`, `AutomorphicPadicLFunctions:L0`, `SelmerIwasawaCohomology:L3`.

Acceptance: No infinite sum over all w∤p or archimedean Euler factor enters the λ formula.

Sources: [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Published §1.5, pp.537–538; Theorem 1.5.1. Only the finite S-indexed sum is used; the extraction’s E18 correction is retained.

#### CGLS residual extension and algebraic Iwasawa invariants

Declaration: `RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison` (theorem).

Under CGS conditions the strict-at-v, unrestricted-at-v̄ anticyclotomic dual X_E is torsion, μ(X_E)=0 and λ(X_E)=λ(X_φ)+λ(X_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(E))). The proof uses the actual residual extension E[p], residual Selmer comparison, and no finite Λ-submodules; it does not replace E[p] by its semisimplification as a representation.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Proof plan:

1. Use the long exact cohomology sequence of 0→𝔽_p(φ)→E[p]→𝔽_p(ψ)→0 and the source local surjectivity/invariant vanishings to obtain the residual Selmer exact sequence (CGLS Proposition 1.4.1).
2. Use the elliptic-unit main-conjecture input for character modules and their μ=0. Identify residual dimension with λ using Proposition 1.4.2 and Corollary 1.4.3, whose no-finite-submodule proof is an input to this identification.
3. Remove imprimitive factors using finite-euler-factor-comparison, retaining only S.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison`, `SelmerIwasawaCohomology:L2`, `AutomorphicPadicLFunctions:L3`.

Acceptance: Splitting the residual representation without checking the connecting map is rejected.

Sources: [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), §1.4 Propositions 1.4.1–1.4.2, Corollary 1.4.3; Theorem 1.5.1, p.538. The theorem asserts cotorsion, μ=0 and the finite corrected λ formula.

#### Kriz congruence and analytic Iwasawa invariants

Declaration: `RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence` (theorem).

For the ordinary weight-two newform f_E with reducible residual representation, compare its p-depleted q-expansion at CM points with the Eisenstein series attached to the residual characters. With the source’s integral periods and Euler factors, its anticyclotomic BDP function has μ=0 and λ(L_E)=λ(L_φ)+λ(L_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(E))). In KY’s local 1/ω case the analytic ordering of characters is relabelled so the first is unramified at p; it need not equal the ordering of the nonsplit lattice.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

Proof plan:

1. Apply CGLS Theorem 2.2.1/Kriz’s congruence to the p-depleted forms, including integral CM evaluation and the unit periods; KY Theorem 2.2.1 proves that p-depletion kills the otherwise unmatched constant term.
2. Factor the Eisenstein CM values into the two Katz character functions and finite Euler factors.
3. Use the proposed elliptic-unit/Katz μ theorem under its exact hypotheses, then apply CGLS Theorem 2.2.2 or KY Theorem 2.2.2.

Direct prerequisites: `AutomorphicCongruences:L0`, `PadicFamilies:L0`, `AutomorphicPadicLFunctions:L3`, `RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison`.

Acceptance: A change of lattice ordering cannot silently change the analytic character convention.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), §2.2 Theorems 2.2.1–2.2.2; compare CGLS §2.2. The congruence is for actual forms and CM values, including the broader character case.

#### CGLS equality of anticyclotomic Iwasawa invariants

Declaration: `RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants` (theorem).

Under CGS conditions μ(X_E)=μ(L_E)=0 and λ(X_E)=λ(L_E), with the same primitive anticyclotomic Greenberg module and squared BDP normalization. This is an independent residual/congruence computation; it gives equality of characteristic ideals only when combined with a proved one-sided divisibility.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Proof plan:

1. Use cgls-residual-character-comparison and kriz-eisenstein-congruence.
2. Import equality of the character-module and Katz-function characteristic ideals from the elliptic-unit supplier, including its exceptional character conventions.
3. Cancel precisely the matching finite Euler correction terms.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison`, `RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence`.

Acceptance: Equal μ and λ alone do not imply equal distinguished polynomials.

Sources: [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 2.2.3, p.545. This invariant equality is independent of the Heegner-system divisibility.

#### Uniform near-trivial Kolyvagin bound

Declaration: `RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound` (theorem). Planet: **Uniform Kolyvagin bound**.

Under CGS’s ordinary Heegner setup and E(K)[p]=0, let R be the integers of a finite extension Φ/ℚ_p and α an anticyclotomic character with α≡1 modulo ϖ^m. There are constants M₀,C≥0 depending only on T_pE and rank_ℤp R, independent of m and α in this neighborhood, such that for m≥M₀ and an actual κ∈KS(T_pE⊗R(α),F_ord,L_E) with κ₁≠0: the compact Selmer group has R-rank one, H¹_F(K,A)≅Φ/R⊕M⊕M for a finite M, and length_R M≤length_R(H¹_F(K,T)/Rκ₁)+C.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. E(K)[p]=0; the propagated ordinary self-dual local conditions and CGS’s admissible Kolyvagin primes/ideals are used.

Proof plan:

1. Specialize the generic error-tolerant descent of ES.4 to CGS §6.2’s two-copy structure, keeping finite error constants.
2. Use the residual truncated comparison at level m and complex conjugation. CGS §6.3 chooses primes controlling two eigenspaces with the fixed restriction error C₁+C₂.
3. Follow §6.4’s two-step decrease of the largest elementary divisors; this is the new bounded-error argument, not the earlier bound whose error grows with m.
4. Pass to the finite and divisible parts with the same uniform C.

Direct prerequisites: `EulerSystemsAndKolyvaginSystems:ES.4`, `EulerSystemsAndKolyvaginSystems:ES.8`, `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `SelmerIwasawaCohomology:L2`.

Acceptance: The constants remain fixed as m grows; replacing them with C(α)≥m fails the augmentation argument.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Theorem 6.1.1 and §§6.2–6.4, pp.21–28. Uniformity is the reason specialization can approach augmentation.

#### Heegner divisibility including augmentation

Declaration: `RankZeroOneBSD:BSD.7a/augmentation-inclusive-heegner-divisibility` (theorem).

For the actual early HE.8 Λ-adic Heegner Kolyvagin system κ^Hg with κ₁≠0, under CGS conditions S_ord(K∞⁻) has Λ-rank one and X_ord(K∞⁻) is pseudo-isomorphic to Λ⊕M⊕M, with M torsion and char_Λ(M) dividing char_Λ(S_ord/Λκ₁) in Λ[1/p]. The height-one prime (γ−1) is included; the prime (p) is still not included by this assertion.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Proof plan:

1. Import the actual Heegner classes, local conditions and nonzero bottom class from early HE.8, not an anticyclotomic equality.
2. Apply the existing weak torsion-localized bound away from augmentation.
3. Apply uniform-near-trivial-kolyvagin-bound along characters approaching 1 to bound the augmentation length and remove its inversion (CGS Theorems 6.5.1–6.5.2).

Direct prerequisites: `RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`.

Acceptance: No inference about the p-height-one length is made from a rational divisibility.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Theorems 6.5.1–6.5.2, p.28. The new argument includes augmentation but the theorem still states Λ[1/p].

#### Heegner index and BDP ideal comparison

Declaration: `RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison` (comparison).

Under ordinary Heegner conditions, nonzero actual Heegner class and the source H⁰/rank hypotheses, Poitou–Tate and the integral p-adic logarithm reciprocity identify the two directions of the Heegner index-square characteristic divisibility with the corresponding directions for the Greenberg dual and the squared BDP function. KY’s transfer from the geometric lattice to its chosen lattice contributes the fixed p^{t+N} factors of Theorem 3.0.8; they are retained until μ/λ comparison removes them.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use either CGS no-invariants data or the chosen KY residual-invariant-free lattice, and the actual rank-one compact Selmer group.

Proof plan:

1. Use SIC’s strict/relaxed Poitou–Tate sequence and GZ.9’s actual Heegner logarithm formula with its Euler factor and isogeny/differential compatibility.
2. Identify κ∞ and κ₁ as generators of the same Λ-line as in CGLS Remark 4.1.3; a scalar change is justified by lattice comparison.
3. Take characteristic ideals in the correct unramified coefficient extension, track involution and the square, and record both implication directions separately.

Direct prerequisites: `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`, `SelmerIwasawaCohomology:L2`, `ModularIwasawaMainConjectures:L0`.

Acceptance: A square-root BDP measure is not substituted for the squared L_E in the Greenberg equality.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.8 proof, pp.39–40; CGLS Proposition 4.2.1. Comparison cannot silently normalize away the p-power from changing lattices.

#### CGS anticyclotomic Greenberg main conjecture

Declaration: `RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture` (theorem). Planet: **Eisenstein anticyclotomic main conjecture**.

Under CGS conditions X_Gr(E/K∞⁻) is Λ-torsion and char_Λ X_Gr extended to Λ^ur equals the principal ideal of L_p^BDP(f_E/K) in the source’s squared normalization. The conclusion has no (Sel) corank-one assumption and is integral, including augmentation and the p-height-one prime.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Proof plan:

1. Translate augmentation-inclusive-heegner-divisibility to a one-sided Greenberg/BDP divisibility via heegner-reciprocity-ideal-comparison.
2. Use cgls-equal-iwasawa-invariants: μ=0 removes the remaining p-power ambiguity, and equality of λ makes the integral quotient a unit.
3. Conclude both ideal containments; this removes the earlier CGLS (Sel) restriction by the uniform bound.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/augmentation-inclusive-heegner-divisibility`, `RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison`, `RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants`.

Acceptance: The CGLS prototype alone cannot supply this unconditional-in-(Sel) equality.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Theorem 6.5.3, p.29; compare CGLS Theorem 4.2.2. The improved proof removes (Sel), not the residual local exclusion.

#### CGS Heegner index-square equality

Declaration: `RankZeroOneBSD:BSD.7a/cgs-heegner-index-square-equality` (theorem).

Under CGS conditions the compact and dual ordinary anticyclotomic Selmer groups have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λκ∞)^2 integrally. The class is the actual geometric early HE.8 class, with its source lattice; κ∞ is not defined by this equality.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Proof plan:

1. Apply cgs-anticyclotomic-main-conjecture and both directions of heegner-reciprocity-ideal-comparison.
2. Use μ=0 to remove the p-power ambiguity from the older index-square corollary.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison`.

Acceptance: Its exact characteristic equality includes the p-height-one prime.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Corollary 6.5.4, p.29. This is an output of BSD.7a for HE.8b and MIMC L6, never an input from them.

#### Keller–Yin local character cohomology

Declaration: `RankZeroOneBSD:BSD.7a/ky-local-character-corrections` (theorem).

For KY’s induced discrete character module M_θ over the anticyclotomic Λ, the local unramified condition at the distinguished p-place has a cofree rank-one kernel for θ|G_p=1, whereas for θ|G_p=ω the restriction kernel is zero and the relevant local H¹ dual has projective dimension at most one, rank one and two generators. The latter is not asserted Λ-free. For θ=ω finite submodules may occur, and the residual-to-p-torsion identification requires the source’s actual diagrams.

Hypotheses: When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. θ is one of the finite-order residual character lifts used in KY §1.1; the full induced module and inverse tautological action are used.

Proof plan:

1. Apply local inflation–restriction and duality with the decomposed p-place; compute invariants case by case (KY Proposition 1.1.3).
2. Use the finite cyclic restriction kernel calculation and the residual diagrams of §1.2 instead of the earlier no-invariants/free-local-module shortcut.
3. Carry these kernels to the global-to-local comparison and retain the finite-submodule errors.

Direct prerequisites: `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L3`, `ArithmeticGaloisDuality:R02.4`.

Acceptance: Rank one plus projective dimension at most one is insufficient to replace a two-generator module by Λ.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Proposition 1.1.3; Lemma 1.2.4 and Theorem 1.2.5. These are the separate trivial and cyclotomic local cases absent from the CGS branch.

#### Keller–Yin nonsplit residual lattice

Declaration: `RankZeroOneBSD:BSD.7a/ky-ribet-lattice` (theorem).

For KY’s ordinary Eisenstein weight-two representation V, choose a stable lattice T with nonsplit residual extension 0→𝔽_p(φ)→T/pT→𝔽_p(ψ)→0 and H⁰(K,T/pT)=0. In the local 1/ω case orient it with φ|G_p=ω and ψ|G_p=1, while φ|G_K may equal ω. The chosen lattice need not be T_p of the original E. For an elliptic curve realize it by an isogenous curve and retain the source’s p-power index between lattices.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use Ribet’s lattice lemma for the irreducible characteristic-zero representation; do not require E[p] irreducible.

Proof plan:

1. Apply KY Proposition 1.3.1 (Ribet lattice) with the ordinary local orientation.
2. Verify that the nonsplit extension has no invariant vector even when its quotient is trivial.
3. Use elliptic Tate-module/isogeny correspondence to relate the chosen lattice to the original curve; preserve the finite p-power quotient and induced Selmer maps.

Direct prerequisites: `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `ArithmeticGaloisRepresentations:R01.1`, `RankZeroOneBSD:BSD.7a/ky-local-character-corrections`.

Acceptance: A curve with rational p-torsion can use the theorem after lattice/isogeny comparison; it cannot be declared residual-invariant-free itself.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Proposition 1.3.1; beginning of §1.4; Remark 3.0.9. Vanishing is obtained on a chosen nonsplit lattice, not assumed for every isogenous curve.

#### Keller–Yin trivial-character augmentation correction

Declaration: `RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture` (comparison).

For the character Iwasawa modules in KY, μ(X_θ)=0. For θ|G_K≠1, char X_θ=(L_θ); in the trivial character case char X_1=(T·L_1), where T=γ−1. Consequently λ(X_1)=λ(L_1)+1. No p∤h_K, nonanomalous-prime, or p>3 hypothesis is added: the requisite Rubin/de Shalit specialization must provide precisely this version.

Hypotheses: When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use the full character modules and period-normalized Katz functions of KY Theorem 1.2.2.

Proof plan:

1. Import Rubin’s elliptic-unit comparison and Hida’s μ theorem from the proposed elliptic-unit owner.
2. Retain the trivial-isotypic global unit/augmentation term in de Shalit III.1.10/Yager’s specialization, rather than applying the nontrivial character formula unchanged.
3. Read μ and λ from the factor T and the nonzero character function.

Direct prerequisites: `AutomorphicPadicLFunctions:L3`, `ModularIwasawaMainConjectures:L0`, `SelmerIwasawaCohomology:L3`.

Acceptance: The λ correction is one, whereas multiplication by T does not change μ.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 1.2.2; proof of Theorem 2.2.3 and Remark 2.2.4. The extra augmentation accounts for the global trivial-character λ correction.

#### Keller–Yin residual extension and corrected lambda formula

Declaration: `RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda` (theorem).

For KY’s chosen nonsplit lattice with φ|G_p=ω, the primitive X_f is torsion with μ=0. If φ|G_K≠ω, λ(X_f)=λ(X_φ)+λ(X_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(f))). If φ|G_K=ω (so ψ|G_K=1), the left side is λ(X_f)+1. The same +1 occurs in the imprimitive relation λ(X_f^S)+1=λ(X_φ^S)+λ(X_ψ^S). S is finite and excludes v,v̄,∞.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The chosen lattice is as in ky-ribet-lattice; the generic non-1/ω case is supplied by the CGLS comparison.

Proof plan:

1. Compute the residual Selmer extension through the Greenberg/unramified restriction maps, retaining the finite cyclic local kernel of Lemma 1.3.6.
2. Use the Perrin–Riou five-term comparison in KY §1.4 and its finite-module corrections, rather than λ=dimension(X/p) without checking finite submodules.
3. Distinguish the ψ globally trivial case and carry its one-dimensional correction. Remove only the finite S Euler factors (Theorem 1.5.1).

Direct prerequisites: `RankZeroOneBSD:BSD.7a/ky-ribet-lattice`, `RankZeroOneBSD:BSD.7a/ky-local-character-corrections`, `RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture`, `RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison`, `SelmerIwasawaCohomology:L3`.

Acceptance: When ψ is globally trivial the uncorrected sum of λ invariants is off by one.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Theorems 1.4.1 and 1.5.1; Appendix A finite terms. The +1 is not suppressed by the fact that finite modules have unit characteristic ideal.

#### Keller–Yin equality of analytic and algebraic invariants

Declaration: `RankZeroOneBSD:BSD.7a/ky-equal-iwasawa-invariants` (theorem).

For every good ordinary weight-two Eisenstein form in KY’s setting, μ(X_f)=μ(L_f)=0 and λ(X_f)=λ(L_f). In the globally trivial-character case the algebraic +1 in ky-residual-extension-lambda cancels the character main conjecture’s λ(X_1)=λ(L_1)+1. The result is not obtained by imposing the CGS local exclusion.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

Proof plan:

1. Use ky-residual-extension-lambda for the chosen lattice and kriz-eisenstein-congruence with its analytic relabelling.
2. Use ky-trivial-character-main-conjecture for the globally trivial constituent and the nontrivial character formulas for the others.
3. Cancel the same finite S factors and the explicit augmentation correction.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda`, `RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture`, `RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence`.

Acceptance: The correction survives even though finite global torsion does not change a characteristic ideal.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 2.2.3 and Remark 2.2.4. The equality uses the exceptional character formula, not only the CGLS argument.

#### Keller–Yin integral Kolyvagin divisibility and lattice transfer

Declaration: `RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound` (theorem).

On KY’s residual-invariant-free lattice, for a nonzero actual Heegner Kolyvagin system the ordinary compact and dual Selmer groups have Λ-rank one, X is pseudo-isomorphic to Λ⊕M⊕M and char(M) divides char(S/Λκ₁) at every height-one prime, including (ϖ). The canonical geometric system transfers as κ_n^Hg=p^t κ_n, and comparison with its limiting class retains the fixed additional p^N. These exponents are independent of the approaching character but cannot be set to zero without proof.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The chosen lattice has H⁰(K,T/pT)=0 and the actual transferred Heegner system has nonzero initial class.

Proof plan:

1. Apply the nontrivial-character bound KY Theorem 3.0.1 and uniform near-trivial bound Theorem 3.0.2; Proposition 3.0.3 bounds the scalar-image constant.
2. Use KY Theorem 3.0.5 to include the coefficient height-one prime via specialization over ramified extensions; keep the dual two-copy structure.
3. Apply Theorem 3.0.6 to the actual geometric lattice, keeping t+N in the resulting characteristic divisibility.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/ky-ribet-lattice`, `RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound`, `EulerSystemsAndKolyvaginSystems:ES.4`, `EulerSystemsAndKolyvaginSystems:ES.8`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

Acceptance: The older HE weak divisibility after inverting p is not a substitute for this integral assertion.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Theorems 3.0.1–3.0.2, Proposition 3.0.3, Theorems 3.0.5–3.0.6. This includes the integral height-one length and compares the actual lattices.

#### Keller–Yin anticyclotomic Greenberg main conjecture

Declaration: `RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality` (theorem). Planet: **Keller–Yin anticyclotomic main conjecture**.

For KY’s weight-two good Eisenstein setup, the unramified Selmer dual X_f (and height-one-equivalent Greenberg dual) is Λ-torsion and char_Λ(X_f)Λ^nr=(L_f). First prove this on the chosen invariant-free lattice, then transfer to the original elliptic curve as in Remark 3.0.9. Local rational p-torsion is allowed. The equality is integral, and no unproved general finite-submodule vanishing is asserted.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

Proof plan:

1. Translate ky-integral-kolyvagin-bound through heegner-reciprocity-ideal-comparison, yielding the source’s divisibility with p^{t+N}.
2. Use independently proved μ=0 and λ equality from ky-equal-iwasawa-invariants; the fixed p-power changes μ but not the distinguished factor, so the actual characteristic ideals coincide.
3. Use the lattice/isogeny characteristic comparison and the finite Greenberg/unramified restriction difference to return to the original curve.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison`, `RankZeroOneBSD:BSD.7a/ky-equal-iwasawa-invariants`, `RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization`.

Acceptance: A rational p-torsion original curve is accepted only with the proved transfer maps.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.8 (IMC2) and Remark 3.0.9, pp.39–40. The result is the integral BDP/Greenberg equality in completed unramified coefficients.

#### Keller–Yin Heegner index-square equality

Declaration: `RankZeroOneBSD:BSD.7a/ky-heegner-index-square-equality` (theorem).

In the same KY setup the compact and dual ordinary Selmer groups have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λκ∞)^2 in the coefficient ring labelled Λ^ac in §3.0.8, with κ∞ the transferred actual Heegner class. Theorem B in the Introduction instead states Λ; record this internal ring discrepancy and require an integral two-way class/lattice comparison before exporting the stronger integral statement. The weaker rationalized index-square equality is retained; the integral Greenberg IMC2 is a separate output.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

Proof plan:

1. Use ky-anticyclotomic-greenberg-equality and the reverse implication of heegner-reciprocity-ideal-comparison.
2. Return through the explicit lattice maps in the coefficient ring of the proved two-way comparison. Resolve the Theorem B/§3.0.8 ring discrepancy through the stated integral comparison gap.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality`, `RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison`.

Acceptance: The characteristic equality refers to the actual κ∞ line and retains the coefficient ring of the verified comparison.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Introduction Theorem B, p.5; Theorem 3.0.8 (IMC1), p.40. This is a BSD.7a output for the downstream HE.8b application.

#### Distinguished Wüthrich lattice and integral Kato input adapter

Declaration: `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input` (comparison).

For an elliptic curve E/ℚ and an odd good ordinary Eisenstein p, use Wüthrich’s distinguished E_• in its isogeny class: T_f=T_pE_• and the lattice of all modular symbols agrees with its Néron lattice after tensoring with ℤ_p. The cyclic X₁(N)-optimal quotient isogeny is étale. Kato’s z₀ is integral in H¹_Iw(T_pE_•) even in the nonfree maximal-ideal case, L_p^MSD(E) is integral, and char X_ord(E/ℚ∞) divides (L_p^MSD(E)) as integral ideals. The supplier is the requested Wüthrich addition to Kato L4, with Ferrero–Washington; Kato’s existing rational node is insufficient.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

Proof plan:

1. Import Wüthrich Theorem 4 and Proposition 8 for E_• and the actual lattice, valid at odd primes where reduction at that prime is semistable (not a global semistability hypothesis).
2. Import Theorem 13’s integral z₀ including the rational-torsion/nonfree case, and Theorem 16’s integral divisibility with Lemma 17’s isogeny comparison.
3. Apply Corollary 18 at good ordinary p. Record the split-multiplicative augmentation factor separately; it supplies no bad-prime BSD claim here.

Direct prerequisites: `KatoEulerSystems:L4`, `IntegralIwasawaTheory:L4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

Acceptance: The assumptions concern reduction at p. Additive reduction elsewhere does not disqualify the input. For split multiplicative p the extra augmentation I is retained, without inferring a BSD formula.

Sources: [wuthrich](https://ems.press/content/serial-article-files/26230?nt=1), Theorems 4,13,16; Proposition 8; Lemma 17; Corollary 18. The required containment is integral at the coefficient prime, including reducible representations.

#### Integral Rankin functions and specialization normalization

Declaration: `RankZeroOneBSD:BSD.7a/integral-two-variable-functions` (comparison).

Compare CGS’s actual two-variable Perrin–Riou Rankin function L_PR and Greenberg function L_Gr to the imported p-adic functions. Normalize L_PR with (deg π/c_π²)H_p(f), H_p(f)=(1−p/α_p²)(1−1/α_p²), and L_Gr with h_K times the anticyclotomic Katz factor. Cyclotomic projection of L_PR has ideal equal to the product of the Néron-period MSD functions of E and E^K; anticyclotomic projection of L_Gr has ideal equal to the squared BDP function. The CM-family congruence ideal and h_K factor must be supplied integrally, with Hida–Tilouine/Rubin input, rather than assumed units.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. α_p is the ordinary unit root; the modular parametrization and Néron differential are fixed.

Proof plan:

1. Import the actual Rankin interpolation from ModularSymbols/AutomorphicPadicLFunctions and the CM Hida family/congruence module from PadicFamilies.
2. Apply CGS Definitions 2.2.2 and 2.4.3 and Lemma 2.4.4, retaining deg π, the Manin constant, h_K and the Katz congruence factor.
3. Verify Propositions 2.2.4 and 2.4.5 with the same integral periods and squared BDP convention.

Direct prerequisites: `AutomorphicPadicLFunctions:L3`, `PadicFamilies:L0`, `PadicFamilies:L1`, `AutomorphicCongruences:L0`, `ModularSymbolsPadicLFunctions:L3`, `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`.

Acceptance: No condition p∤h_K is inserted to bypass the integral congruence argument.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), §§2.2–2.4, Definitions 2.2.2/2.4.3, Lemma 2.4.4, Propositions 2.2.4/2.4.5. The Katz/CM congruence input removes a genuine integral denominator, not just a rational scalar.

#### Beilinson–Flach class and two integral reciprocity laws

Declaration: `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity` (construction).

Construct the actual CGS class BF_α in H¹_ord,rel(K,T_f(α) completed-tensor Λ_K) from the KLZ Beilinson–Flach classes specialized to the CM family, as in CGS Theorem 4.1.1 (BSTW §5). On T_f=T_pE_•, rescale the two Coleman maps as in Corollary 4.1.3 to injective Λ_K-linear maps with pseudo-null cokernel whose images of p⁻loc_v̄ BF_α and loc_v BF_α are respectively L_PR(E_•(α)/K) and L_Gr(f(α)/K). Neither BF nor a map is defined by assigning those predicted images.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use CGS’s CM Hida family, crystalline twists α, distinguished lattice and specified ordinary local conditions; retain all interpolation/coefficient choices.

Proof plan:

1. Construct and specialize the motivic KLZ classes through the imported cohomology and family APIs; verify the norm and local conditions of the actual classes. This source-specific construction is owned here, with a recorded implementation gap for the missing class interfaces.
2. Apply CGS Theorem 4.1.1 for both explicit reciprocity laws on I_f and I_g^cusp, including injectivity and pseudo-null cokernel.
3. Use deg(π_•)I_f=ℤ_p (Lemma 4.1.2), the ordinary integral de Rham comparison and the exact CM congruence ideal to rescale both maps (Corollary 4.1.3).

Direct prerequisites: `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`, `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`, `EulerSystemsAndKolyvaginSystems:ES.2`, `PadicHodgeRegulators:L3`, `PadicFamilies:L1`, `ArithmeticGaloisDuality:R02.1`, `SelmerIwasawaCohomology:L3`.

Uses:

- **CGS Proposition 4.2.1 and Theorem 4.3.1**: The two actual localization maps relate BF-index, ordinary and Greenberg characteristic containments.
- **CGS §7.2**: Nonzero twisted images and integral normalizations supply the cyclotomic reverse bound.

API:

- `EisensteinBF.class` (data): The actual specialized motivic Beilinson–Flach cohomology class, not a chosen inverse image of an L-function.
- `EisensteinBF.ordinary_local` (characterisation): The class lies in the ordinary-relaxed Selmer group with the source strict/relaxed places.
- `EisensteinBF.coleman_PR` (compatibility): The rescaled Coleman map on p⁻loc_v̄ sends the actual class to the integrally normalized L_PR.
- `EisensteinBF.coleman_Gr` (compatibility): The rescaled Coleman map on loc_v sends the same actual class to L_Gr with its Katz congruence factor.
- `EisensteinBF.twist_congruence` (compatibility): After the specified twist automorphism, congruent characters produce congruent images modulo the same coefficient power.

Unit tests:

- `EisensteinBF.test_PR_projection`: Cyclotomic projection of the PR image agrees with the product of MSD functions of E_• and E_•^K in their Néron periods.
- `EisensteinBF.test_Gr_projection`: Anticyclotomic projection of the Gr image agrees with the squared BDP normalization, including the nonunit Katz/congruence factor.
- `EisensteinBF.test_zero_image`: If an injective Coleman projection has nonzero reciprocal L-image then the actual localized class is nonzero; the zero class cannot pass.
- `EisensteinBF.test_lattice_rescaling`: Changing the distinguished quotient differential rescales class/map and period modules by the computed factors, preserving both laws together.

Acceptance: Both reciprocity images are checked on the same actual class and lattice, before any characteristic equality.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Theorem 4.1.1, Lemma 4.1.2, Corollary 4.1.3, pp.17–18. Both maps and their actual common class carry the integral normalization used by the main-conjecture comparison.

#### Beilinson–Flach divisibility comparison

Declaration: `RankZeroOneBSD:BSD.7a/bf-poitou-tate-divisibility-comparison` (comparison).

Under CGS Proposition 4.2.1’s H⁰, torsion and nonzero L-function conditions, the BF-index containment for the ordinary-relaxed compact Selmer group and ordinary-strict dual is equivalent direction by direction to the Greenberg/L_Gr containment and to the ordinary/L_PR containment. All characteristic ideals use the same Λ_K, inverse action and primitive/imprimitive convention. A rational BF bound remains rational until its p-power is removed.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. E_•(K)[p]=0, the relevant projected L_PR and L_Gr are nonzero, and the torsion/rank hypotheses in CGS Proposition 4.2.1 hold.

Proof plan:

1. Apply the two strict/relaxed Poitou–Tate exact sequences to the actual BF class.
2. Use injectivity and pseudo-null cokernels of both normalized Coleman maps from beilinson-flach-integral-reciprocity.
3. Take height-one characteristic lengths in each exact sequence, record both containment directions, and keep any inversion of p in the coefficient ring.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/bf-pr-reciprocity`, `RankZeroOneBSD:BSD.7a/bf-greenberg-reciprocity`, `SelmerIwasawaCohomology:L2`, `ModularIwasawaMainConjectures:L0`.

Acceptance: An equality for one projected Selmer group cannot be imported from downstream MIMC L6.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Proposition 4.2.1, pp.18–19. This is an equivalence of proved containments, not an assumed main conjecture.

#### Nontrivial-twist rational Beilinson–Flach bound

Declaration: `RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound` (theorem).

For CGS’s nontrivial crystalline anticyclotomic α with BF_α≠0 and its verified Euler-system representation hypotheses, S_ord,rel has Λ-rank one, X_ord,str is torsion and its characteristic ideal contains the BF-index characteristic ideal over Λ_K[1/p]. The source checks irreducibility of V_pE⊗Ind_K^ℚ α in characteristic zero and a rank-one σ-coinvariant condition; it does not assume residual irreducibility of E[p].

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. α is nontrivial and crystalline as in §4.3, BF_α≠0; the auxiliary σ and Euler-system hypotheses of Theorem 4.3.1 are verified.

Proof plan:

1. Use the actual BF Euler system and its projection to the initial class.
2. Verify the representation hypotheses by CGS’s non-CM/Serre argument and the explicit σ, not the clean irreducible residual MR theorem.
3. Apply the imported error-tolerant Euler-system bound to obtain the containment only after inverting p.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`, `EulerSystemsAndKolyvaginSystems:ES.4`, `EulerSystemsAndKolyvaginSystems:ES.8`, `ArithmeticGaloisRepresentations:R01.1`.

Acceptance: The coefficient-prime length is still unresolved by this node.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Theorem 4.3.1 and its proof, pp.19–20. The theorem supplies only the rational bound at this point.

#### Congruent twists and integral characteristic series

Declaration: `RankZeroOneBSD:BSD.7a/congruent-characteristic-series` (theorem).

For α≡1 modulo ϖ^m, the finite-S imprimitive L-functions of E and E(α) are congruent after the twist automorphism γ↦α(γ)γ. Under the source torsion and no-finite-submodule hypotheses, their ordinary Selmer characteristic generators are congruent modulo the same ϖ^m up to units. The proof identifies Fitting with characteristic ideals only after the finite-submodule condition, and compares actual residual Selmer modules.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. The primitive ordinary Selmer dual is torsion and E(K)[p]=0 for Proposition 3.4.4; use the finite imprimitive S of the relevant tower.

Proof plan:

1. Use CGS Lemma 2.5.1 for the analytic congruence.
2. Use residual coefficient/cohomology comparison and the imprimitive global-to-local surjectivity to compare Selmer modules modulo ϖ^m.
3. Apply Proposition 3.4.3’s no-finite-submodule assertion and Proposition 3.4.4’s Fitting comparison; retain the unit choice of generators.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison`, `RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization`, `SelmerIwasawaCohomology:L3`, `ModularIwasawaMainConjectures:L0`.

Acceptance: A finite Λ-submodule cannot be discarded while taking Fitting ideals.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Lemma 2.5.1; Propositions 3.4.3–3.4.4. Large-power congruence controls μ and λ only after integral characteristic generators have been justified.

#### Twisted control and augmentation comparison

Declaration: `RankZeroOneBSD:BSD.7a/twisted-control-augmentation-comparison` (comparison).

For a sufficiently near-trivial crystalline α with nonzero BDP specialization, under CGS Proposition 3.4.2’s conditions, the cyclotomic and anticyclotomic Greenberg characteristic generators specialize at augmentation with equal p-valuations. Their common expression retains the finite twisted Greenberg Selmer cardinality, #H⁰(K_v,W_{α⁻¹})² and every p-primary local Tamagawa term. Nonzero BDP specialization supplies BK corank one and nonzero ordinary localization; these are proved before applying control.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. E(K)[p]=0, the twisted BK Selmer group has corank one and the ordinary localization is nonzero as required by Lemma 3.4.1.

Proof plan:

1. Choose α away from the finitely many zeros of the nonzero BDP function.
2. Use actual Heegner reciprocity and the Kolyvagin bound to prove Lemma 3.4.1’s rank/local nonvanishing hypotheses.
3. Apply Proposition 3.4.2 to both towers and compare their finite terms; this is equality up to p-adic unit, not equality of arbitrary chosen generators.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `SelmerIwasawaCohomology:L3`, `RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture`.

Acceptance: No local H⁰ factor is dropped merely because E(K)[p]=0.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Lemma 3.4.1; Proposition 3.4.2; §7.2 Step 2. These are the precise specialization hypotheses needed for the unit-quotient argument.

#### Integral twisted cyclotomic equality

Declaration: `RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality` (theorem).

For the near-trivial nontrivial crystalline twists used by CGS §7.2, char X_ord(E_•(α)/K∞⁺)=(L_PR(E_•(α)/K)^+) integrally. First the BF bound is rational. Wüthrich’s untwisted integral containment and congruence give the μ inequality that removes its p-power denominator. The anticyclotomic equality and twisted control then show the remaining quotient has a nonzero unit augmentation, hence is a unit. Cyclotomic μ is allowed to be positive.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Proof plan:

1. Use nontrivial-twist-rational-bf-bound and bf-poitou-tate-divisibility-comparison to obtain the rational ordinary/Greenberg containments.
2. Use distinguished-lattice-integral-input plus congruent-characteristic-series for m large to compare μ and make the containment integral (CGS Lemma 7.2.2).
3. Compare the nonzero augmentation values with twisted-control-augmentation-comparison and the anticyclotomic main conjecture. A quotient of integral power series with unit augmentation is a unit (SU Lemma 3.2).
4. Translate the resulting Greenberg equality back to ordinary/L_PR using the two-way BF comparison.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound`, `RankZeroOneBSD:BSD.7a/bf-poitou-tate-divisibility-comparison`, `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`, `RankZeroOneBSD:BSD.7a/congruent-characteristic-series`, `RankZeroOneBSD:BSD.7a/twisted-control-augmentation-comparison`, `ModularIwasawaMainConjectures:L0`.

Acceptance: A rational containment plus specialization at a zero augmentation does not establish equality.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), §7.2 Lemmas 7.2.1–7.2.2 and (7.10)–(7.11). The μ inequality repairs integrality; anticyclotomic μ=0 is not reused as a cyclotomic μ=0 claim.

#### CGS integral cyclotomic main conjecture

Declaration: `RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture` (theorem). Planet: **Eisenstein cyclotomic main conjecture**.

Under CGS’s good Eisenstein local exclusion, X_ord(E/ℚ∞) is Λ_ℚ-torsion and char_Λℚ X_ord(E/ℚ∞)=(L_p^MSD(E/ℚ)) integrally with Néron real periods. No μ=0 hypothesis or conclusion is imposed on the cyclotomic functions.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

Proof plan:

1. Use congruent-characteristic-series and integral-twisted-cyclotomic-equality for arbitrarily close twists to equate μ and λ of the untwisted imprimitive ordinary characteristic and L_PR generators; combine with Wüthrich’s integral containment to get equality over K∞⁺ (Theorem 7.2.3).
2. Apply odd-p quadratic Shapiro splitting of the ordinary Selmer dual and the exact Néron-period product specialization of integral-two-variable-functions.
3. Use Wüthrich’s individual integral containments for E and E^K. Equality of their product forces both quotients to be units. Return from E_• using the proved isogeny comparison.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality`, `RankZeroOneBSD:BSD.7a/congruent-characteristic-series`, `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`, `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`, `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `SelmerIwasawaCohomology:L3`.

Acceptance: The result is an output to MIMC L6; that stage’s reexport cannot be its input.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Theorems 7.2.3 and 7.1.1, pp.30–31. Both integral individual containments are essential to descend product equality.

#### Keller–Yin integral cyclotomic main conjecture

Declaration: `RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture` (theorem). Planet: **Keller–Yin cyclotomic main conjecture**.

For every odd good Eisenstein p of an elliptic curve E/ℚ, including local or global rational p-torsion, X_ord(E/ℚ∞) is Λ_ℚ-torsion and char X_ord=(L_p^MSD(E/ℚ)) with its integral Néron-period normalization. This is KY Theorem 3.0.10 in weight two.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

Proof plan:

1. Repeat the CGS three-step cyclotomic argument using ky-anticyclotomic-greenberg-equality in place of the locally excluded CGS equality.
2. Work on the chosen residual-invariant-free isogenous lattice where the congruence and finite-submodule hypotheses hold; use ky-ribet-lattice and Wüthrich’s distinguished integral comparison to return to the original curve.
3. Keep the original curve’s periods, torsion, p-power isogeny factors and finite control terms; a rational lattice comparison alone does not preserve the integral endpoint.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality`, `RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs`, `RankZeroOneBSD:BSD.7a/ky-ribet-lattice`, `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`, `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`, `SelmerIwasawaCohomology:L3`.

Acceptance: The original E may have rational p-torsion; the intermediate chosen lattice need not.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.10, p.41. KY substitutes its anticyclotomic theorem and lattice transfer into CGS, rather than deleting a hypothesis from CGS’s statement.

#### CGLS anticyclotomic prototype

Declaration: `RankZeroOneBSD:BSD.7a/cgls-prototype-main-conjecture` (theorem).

Under the CGS local exclusion and Heegner/split/discriminant conditions, and additionally corank_ℤp Sel_{p∞}(E/K)=1, the CGLS primitive Greenberg dual is Λ-torsion with char(X_E)Λ^ur=(L_E), where L_E is squared BDP. Its Heegner index-square consequence is initially stated in Λ^ac=Λ[1/p] in the published Corollary 4.2.3. This prototype retains (Sel); the stronger CGS equality above removes it by a new proof.

Hypotheses: E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. The additional (Sel) condition of CGLS: corank_ℤp Sel_{p∞}(E/K)=1.

Proof plan:

1. Use the early Heegner weak divisibility and its source corank-one augmentation upgrade.
2. Translate to Greenberg/BDP using heegner-reciprocity-ideal-comparison.
3. Use cgls-equal-iwasawa-invariants to obtain the integral Greenberg equality, and record the published rational index-square consequence without silently upgrading its coefficient ring.

Direct prerequisites: `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`, `RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison`, `RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants`.

Acceptance: An analytic rank-two E cannot be fed to this source by omitting (Sel).

Sources: [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 4.2.2 and Corollary 4.2.3, pp.569–570. The routed Theorem C/Corollary D prototype has an extra corank condition.

#### Keller–Yin cyclotomic input transfer

Declaration: `RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs` (comparison).

On the actual invariant-free KY lattice, establish the cohomological, finite-submodule, twisted congruence and Coleman/Poitou–Tate inputs needed for the three-step CGS cyclotomic argument, now permitting local characters 1/ω. Use KY’s anticyclotomic equality in the specialization step and Wüthrich’s distinguished integral lattice in the individual containment step. Track the maps between these two lattices rather than identifying them. The original curve’s integral Néron-period ordinary characteristic comparison is part of this transfer, not a consequence of rational isogeny comparison alone.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Chosen KY lattice and actual comparison maps to the distinguished E_• lattice; every rank, H⁰, surjectivity and no-finite-submodule condition used in the CGS argument must be verified on the lattice where it is applied.

Proof plan:

1. KY Theorem 3.0.10 cites substitution of its 3.0.8/3.0.9 into CGS. Verify the §3.4 control and finite-submodule conditions through the exceptional local character diagrams of KY §§1.1–1.4.
2. Construct the actual transferred BF specialization and compare both Coleman images, twist congruences and integral characteristic/Fitting generators; preserve every p-power index.
3. Use the independent KY anticyclotomic equality, the integral Wüthrich individual bound and nonzero augmentation control to repeat CGS’s rational-bound/integral-repair/unit-quotient argument. The remaining source-to-interface verification is recorded explicitly as a gap.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/ky-ribet-lattice`, `RankZeroOneBSD:BSD.7a/ky-local-character-corrections`, `RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality`, `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`, `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L3`, `PadicHodgeRegulators:L3`, `ModularIwasawaMainConjectures:L0`.

Acceptance: A CGS lemma requiring φ|G_p≠1,ω cannot be applied to the KY branch merely by changing its name.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.10 proof, p.41; §1.4 lattice independence; Remark 3.0.9. This records the adaptation obligation; the narrower CGS-hypothesis lemmas are not theorem inputs for an exceptional local character.

#### Keller–Yin uniform near-trivial bound

Declaration: `RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound` (theorem).

For KY’s chosen stable self-dual weight-two lattice T with H⁰(K,T/pT)=0 and the actual ordinary conditions, let α≡1 mod ϖ^m. Constants M₀,C depend only on the representation/lattice and rank of the coefficient extension, not on m or α in this neighborhood. If m≥M₀ and κ₁ is nontorsion, the compact Selmer group has rank one, the discrete group is Φ/R⊕M_α⊕M_α, and length_R M_α≤length_R(S/Rκ₁)+C. This generalization requires the chosen nonsplit lattice but not CGS’s local exclusions on its characters.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The invariant-free lattice and propagated ordinary local/dual conditions are verified; an actual Kolyvagin system with nontorsion κ₁ is supplied.

Proof plan:

1. Use ky-ribet-lattice for the cohomological H⁰ hypothesis.
2. Use KY Lemma 3.0.3’s scalar-image argument (Bogomolov/Ribet) to bound the source C₁ on the representation; retain this supplier requirement explicitly.
3. Adapt the two-copy bounded-error descent of CGS §§6.2–6.4 to the KY lattice as Theorem 3.0.2 specifies; the error remains independent of m.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/ky-ribet-lattice`, `ArithmeticGaloisRepresentations:R01.1`, `EulerSystemsAndKolyvaginSystems:ES.4`, `EulerSystemsAndKolyvaginSystems:ES.8`, `SelmerIwasawaCohomology:L2`.

Acceptance: The lattice can be invariant-free when the original curve has rational p-torsion.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), Theorems 3.0.1–3.0.2, Lemma 3.0.3 and Remark 3.0.4, pp.35–36. This is the KY version; the narrower CGS-hypothesis theorem is not used on an exceptional local character.

#### EisensteinBF.coleman_PR

Declaration: `RankZeroOneBSD:BSD.7a/bf-pr-reciprocity` (lemma).

The normalized injective Coleman map with pseudo-null cokernel sends p⁻loc_v̄ BF_α to L_PR(E_•(α)/K), with exactly the distinguished lattice and integral degree/CM congruence-ideal normalizations of Corollary 4.1.3. This promotes the consumed compatibility API to a separate declaration.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The actual class, map, periods and coefficient-extension choices of beilinson-flach-integral-reciprocity.

Proof plan:

1. Apply CGS Theorem 4.1.1 to the actual KLZ specialization.
2. Use Lemma 4.1.2 and integral-two-variable-functions to rescale the map, retaining the source factors as in Corollary 4.1.3.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`, `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`.

Acceptance: The image equality uses the actual same class as the other reciprocity law.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Corollary 4.1.3, p.18. The actual localization/map compatibility is used by the characteristic-ideal comparison.

#### EisensteinBF.coleman_Gr

Declaration: `RankZeroOneBSD:BSD.7a/bf-greenberg-reciprocity` (lemma).

The normalized injective Coleman map with pseudo-null cokernel sends loc_v BF_α to L_Gr(f(α)/K), with exactly the distinguished lattice and integral degree/CM congruence-ideal normalizations of Corollary 4.1.3. This promotes the consumed compatibility API to a separate declaration.

Hypotheses: E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The actual class, map, periods and coefficient-extension choices of beilinson-flach-integral-reciprocity.

Proof plan:

1. Apply CGS Theorem 4.1.1 to the actual KLZ specialization.
2. Use Lemma 4.1.2 and integral-two-variable-functions to rescale the map, retaining the source factors as in Corollary 4.1.3.

Direct prerequisites: `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`, `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`.

Acceptance: The image equality uses the actual same class as the other reciprocity law.

Sources: [cgs](https://arxiv.org/pdf/2303.04373v2), Corollary 4.1.3, p.18. The actual localization/map compatibility is used by the characteristic-ideal comparison.

### RankZeroOneBSD:BSD.8

#### Prime support of a rational number

Declaration: `RankZeroOneBSD:BSD.8/prime-support` (definition). Planet: **Prime support**.

For q in Q, Rat.primeSupport(q) is Nat.primeFactors(|q.num|) union Nat.primeFactors(q.den), using the existing reduced numerator and positive denominator. It is a finite set of natural numbers, not a set of arbitrary places. At q=0 its value is empty by the existing zero convention.

Proof plan:

1. Take the union of the two existing finite prime-factor sets. The construction is deterministic and uses the canonical rational numerator and denominator; it makes no choice of a factorization or rational representative.

Direct prerequisites: `mathlib:Nat.primeFactors`.

Uses:

- **BSD.8 finite-support assembly**: Provides a finite, exact cover of all potentially nonzero rational prime valuations.
- **BSD.9 zero and sign regression tests**: Makes the degenerate conventions visible rather than hiding them in a positivity wrapper.

API:

- `Rat.mem_primeSupport` (characterisation): For q nonzero, p belongs to its support exactly when p is prime and divides its absolute numerator or denominator.
- `Rat.primeSupport_zero` (simp): The prime support of zero is empty.
- `Rat.primeSupport_one` (simp): The prime support of one is empty.
- `Rat.primeSupport_neg` (compatibility): Negation leaves prime support unchanged.
- `Rat.primeSupport_inv` (compatibility): Inversion leaves prime support unchanged, including at zero.
- `Rat.primeSupport_mul_subset` (relation): The support of a product is contained in the union of the supports of its factors; equality is not asserted because cancellation is possible.

Unit tests:

- `Rat.primeSupport_test_six_thirtyfive`: The support of 6/35 is {2,3,5,7}.
- `Rat.primeSupport_test_zero`: The support of 0 is empty; this does not imply 0=1.
- `Rat.primeSupport_test_cancellation`: The support of 2 times 1/2 is empty although the union of the two individual supports is {2}.
- `Rat.primeSupport_test_negative`: The support of -6/35 equals the support of 6/35.

Acceptance: Changing a displayed fraction by a common nonzero factor does not change its rational prime support.

Sources: [mathlib-prime-fin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), primeFactors; mem_primeFactors; primeFactors_zero. Compose the existing natural-number construction; do not reimplement factorization.

#### Membership in rational prime support

Declaration: `RankZeroOneBSD:BSD.8/support-membership` (lemma).

For q nonzero and p natural, p belongs to Rat.primeSupport(q) if and only if p is prime and either p divides |q.num| or p divides q.den.

Hypotheses: q is a nonzero rational number.

Proof plan:

1. Unfold the union defining prime support. Apply Nat.mem_primeFactors to each summand. Nonzero q gives nonzero absolute numerator; the canonical denominator is positive. Remove these two nonzero conditions and distribute the shared primality condition.

Direct prerequisites: `RankZeroOneBSD:BSD.8/prime-support`, `mathlib:Nat.mem_primeFactors`.

Acceptance: At q=6/35, 5 belongs to the support and 4 does not. The nonzero hypothesis prevents treating every prime as a divisor contributing to the support of zero.

Sources: [mathlib-prime-fin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), mem_primeFactors. Apply the exact membership theorem to both canonical integers.

#### Zero valuation in the reduced numerator and denominator

Declaration: `RankZeroOneBSD:BSD.8/zero-numerator-denominator` (lemma).

For a prime p and any rational q with v_p(q)=0, both the natural valuation of |q.num| and that of q.den are zero.

Hypotheses: p is prime. v_p(q)=0; q may be zero.

Proof plan:

1. Use Rat.num_or_den_zero_padicVal to obtain that at least one of the numerator and denominator valuations is zero.
2. Unfold padicValRat. Its vanishing equates the two natural valuations after integer coercion. In each branch, substitute the known zero and deduce that the other valuation is zero.

Direct prerequisites: `mathlib:Rat.num_or_den_zero_padicVal`, `mathlib:padicValRat`, `mathlib:padicValInt`.

Acceptance: The result also holds for q=0 under the library convention. It must not be applied to an unreduced numerator/denominator pair.

Sources: [mathlib-padic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean), Rat.num_or_den_zero_padicVal; padicValRat. Reducedness prevents cancellation between two positive numerator and denominator valuations.

#### Prime valuation and exact support

Declaration: `RankZeroOneBSD:BSD.8/zero-iff-outside-support` (comparison).

For a nonzero rational q and a prime p, v_p(q)=0 if and only if p does not belong to Rat.primeSupport(q).

Hypotheses: q is nonzero. p is prime.

Proof plan:

1. For the forward implication, apply zero-numerator-denominator. Use dvd_iff_padicValNat_ne_zero, separately for the nonzero absolute numerator and the positive denominator, to exclude both divisibilities. Apply support-membership.
2. For the reverse implication, support-membership excludes both divisibilities. The same baseline equivalence gives zero for both natural valuations. Subtract them in the definition of padicValRat. Install Fact p.Prime locally when applying the baseline valuation lemma.

Direct prerequisites: `RankZeroOneBSD:BSD.8/support-membership`, `RankZeroOneBSD:BSD.8/zero-numerator-denominator`, `mathlib:dvd_iff_padicValNat_ne_zero`, `mathlib:padicValRat`, `mathlib:padicValInt`.

Acceptance: For q=1/2, the valuation at 2 is -1 and 2 is in the support; negative valuations are not discarded.

Sources: [mathlib-padic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean), dvd_iff_padicValNat_ne_zero. Both uses retain the nonzero natural-argument hypothesis.; [mathlib-prime-fin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), mem_primeFactors. Identifies the two possible supports.

#### Empty prime support and rational units of absolute value one

Declaration: `RankZeroOneBSD:BSD.8/empty-support-units` (lemma).

For nonzero q in Q, Rat.primeSupport(q) is empty if and only if q=1 or q=-1.

Hypotheses: q is nonzero.

Proof plan:

1. A union is empty exactly when each of its finite sets is empty. Apply Nat.primeFactors_eq_empty to the absolute numerator and denominator.
2. Their nonzero properties eliminate the zero alternatives. Thus the absolute numerator and denominator are both one; the canonical rational normal form gives q=1 or q=-1. Conversely, substitute either value in the definition.

Direct prerequisites: `RankZeroOneBSD:BSD.8/prime-support`, `mathlib:Nat.primeFactors_eq_empty`.

Acceptance: Both 1 and -1 must occur. The unrestricted implication with q=0 is false.

Sources: [mathlib-prime-fin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), primeFactors_eq_empty. Apply twice, retaining nonzero q to eliminate the zero numerator.

#### Reconstruction of a positive rational from all prime valuations

Declaration: `RankZeroOneBSD:BSD.8/positive-rational-reconstruction` (theorem). Planet: **All-prime reconstruction**.

For q in Q with 0<q, q=1 if and only if v_p(q)=0 for every prime natural p.

Hypotheses: q is strictly positive.

Proof plan:

1. If q=1, use padicValRat.one at every prime.
2. Conversely q is nonzero. Every member of primeSupport(q) is prime by support-membership, and zero-iff-outside-support contradicts its membership if all prime valuations vanish. Hence the support is empty.
3. Apply empty-support-units. Strict positivity eliminates the alternative q=-1.

Direct prerequisites: `RankZeroOneBSD:BSD.8/support-membership`, `RankZeroOneBSD:BSD.8/zero-iff-outside-support`, `RankZeroOneBSD:BSD.8/empty-support-units`, `mathlib:padicValRat.one`.

Acceptance: Reject the conclusion for q=0 and q=-1 when positivity is removed. Testing only odd primes leaves q=2 undecided.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8. This is only the rational reconstruction step, not a theorem establishing positivity or rationality of the BSD quotient.; [mathlib-prime-fin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), primeFactors_eq_empty. The proof reduces reconstruction to prime-factor uniqueness at one.

#### Finite certificate of rational prime-valuation vanishing

Declaration: `RankZeroOneBSD:BSD.8/finite-prime-certificate` (definition). Planet: **Finite-support certificate**.

Rat.PrimeValuationCertificate(q) consists of a finite set primes of natural numbers, proofs that every member is prime, that Rat.primeSupport(q) is contained in primes, and that v_p(q)=0 for every member p. It stores no equality q=1, no positivity assumption, and no unproved assertion that a partial list covers the support.

Proof plan:

1. Form the structure using the existing finite-set and valuation types and the explicit primeSupport construction. Constructor fields have the stated mathematical content. Extensionality reduces to equality of the finite sets, since the other fields are proofs.

Direct prerequisites: `RankZeroOneBSD:BSD.8/prime-support`, `mathlib:padicValRat`.

Uses:

- **BSD.8 individual-curve and family assembly**: Separates finitely many local proofs from a proof of support coverage.
- **BSD.9 missing-prime tests**: Rejects partial local evidence without conflating it with rank or Sha finiteness.

API:

- `Rat.PrimeValuationCertificate.primes` (data): The finite set used by this certificate.
- `Rat.PrimeValuationCertificate.prime_mem` (projection): Every member of primes is prime.
- `Rat.PrimeValuationCertificate.covers` (projection): The canonical support is contained in primes.
- `Rat.PrimeValuationCertificate.localZero` (projection): The valuation vanishes at every member of primes.
- `Rat.PrimeValuationCertificate.ext` (extensionality): Certificates for the same q with equal finite sets are equal.
- `Rat.PrimeValuationCertificate.zeroValuation` (characterisation): A certificate implies zero valuation at every prime, including outside its finite set.
- `Rat.PrimeValuationCertificate.eq_one` (compatibility): A certificate for strictly positive q implies q=1.

Unit tests:

- `Rat.PrimeValuationCertificate.test_one`: A certificate for 1 exists with empty finite set.
- `Rat.PrimeValuationCertificate.test_zero`: A certificate for 0 exists with empty finite set, but the positivity input is false.
- `Rat.PrimeValuationCertificate.test_negative_one`: A certificate for -1 exists; its existence alone is not a full-formula certificate.
- `Rat.PrimeValuationCertificate.test_two`: There is no certificate for 2.
- `Rat.PrimeValuationCertificate.test_quarter`: There is no certificate for 1/4, whose missing dyadic valuation is negative.

Acceptance: An empty list is not evidence of coverage for q=2. Zero and -1 can have such valuation certificates but cannot pass positive reconstruction.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8. The data consist of finite support coverage and checked local valuations; positivity is a separate hypothesis of reconstruction.

#### Canonical certificate from all prime valuations

Declaration: `RankZeroOneBSD:BSD.8/certificate-from-all-primes` (construction).

Given a rational q and a proof that v_p(q)=0 for every prime p, construct Rat.PrimeValuationCertificate.ofAllPrimes(q) with finite set exactly Rat.primeSupport(q). No nonzero or sign hypothesis is needed.

Hypotheses: All prime valuations of q vanish.

Proof plan:

1. Choose the canonical support as the finite set; support coverage is reflexive.
2. Its members are prime by Nat.mem_primeFactors, even when the numerator is zero. The supplied all-prime assertion gives every local proof.

Direct prerequisites: `RankZeroOneBSD:BSD.8/finite-prime-certificate`, `mathlib:Nat.mem_primeFactors`.

Uses:

- **BSD.8 independently proved all-prime family theorems**: Turns a universal valuation theorem into the same certificate type as finite exceptional-prime arguments.

API:

- `Rat.PrimeValuationCertificate.ofAllPrimes` (constructor): Construct the certificate from the all-prime vanishing hypothesis.
- `Rat.PrimeValuationCertificate.ofAllPrimes_primes` (simp): Its finite set is exactly Rat.primeSupport(q).
- `Rat.PrimeValuationCertificate.ofAllPrimes_proof_independent` (extensionality): The constructed certificate is independent of the chosen proof of all-prime vanishing.

Unit tests:

- `Rat.PrimeValuationCertificate.ofAllPrimes_test_one`: For q=1 the chosen finite set is empty.
- `Rat.PrimeValuationCertificate.ofAllPrimes_test_zero`: For q=0 the chosen finite set is empty.
- `Rat.PrimeValuationCertificate.ofAllPrimes_test_negative_one`: For q=-1 the chosen finite set is empty without providing positivity.

Acceptance: The chosen set is canonical rather than an unspecified finite witness.

Sources: [mathlib-prime-fin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean), mem_primeFactors. Primality of each member is unconditional.; [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8. Packages genuine all-prime input, not a new proof of it.

#### A finite certificate controls every prime

Declaration: `RankZeroOneBSD:BSD.8/certificate-all-primes` (lemma).

For any rational q, any Rat.PrimeValuationCertificate(q), and any prime p, v_p(q)=0.

Hypotheses: A finite prime-valuation certificate for q is supplied. p is prime.

Proof plan:

1. If q=0 use padicValRat.zero. Otherwise split on membership of p in the certificate finite set.
2. Inside the set use localZero. Outside it, covers implies p is outside canonical support. Apply zero-iff-outside-support to nonzero q.

Direct prerequisites: `RankZeroOneBSD:BSD.8/finite-prime-certificate`, `RankZeroOneBSD:BSD.8/zero-iff-outside-support`, `mathlib:padicValRat.zero`.

Acceptance: The outside-set branch must be justified by covers. The statement also applies at the zero convention without producing equality to one.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8. This theorem proves that exclusion from the actual coverage field, rather than assuming that the displayed finite list is exhaustive.

#### Positive reconstruction from a finite certificate

Declaration: `RankZeroOneBSD:BSD.8/certificate-reconstruction` (theorem).

For strictly positive q in Q, a Rat.PrimeValuationCertificate(q) implies q=1.

Hypotheses: q is strictly positive. A finite prime-valuation certificate for q is supplied.

Proof plan:

1. Use certificate-all-primes to get the valuation statement at every prime. Apply positive-rational-reconstruction with the supplied strict positivity.

Direct prerequisites: `RankZeroOneBSD:BSD.8/certificate-all-primes`, `RankZeroOneBSD:BSD.8/positive-rational-reconstruction`.

Acceptance: Neither a certificate for -1 nor one for 0 supplies the positivity hypothesis.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8. This supplies the algebraic identity only after the positive rational defect has been identified by its owner.

#### Certificate from an exceptional-prime set and an outside theorem

Declaration: `RankZeroOneBSD:BSD.8/certificate-from-exceptions` (construction).

Given q in Q, a finite set S of primes, vanishing of v_p(q) on S, and vanishing at every prime outside S, construct Rat.PrimeValuationCertificate.ofExceptionSet(q,S) with finite set S. Its support coverage is proved, not an extra unverified field.

Hypotheses: Every member of S is prime. v_p(q)=0 for each p in S. For every prime p outside S, v_p(q)=0.

Proof plan:

1. For q=0 the canonical support is empty, so coverage is immediate.
2. For q nonzero and p in canonical support, support-membership gives primality. If p were outside S, the outside theorem and zero-iff-outside-support would contradict membership. This proves coverage.
3. Use the given primality and inside vanishing statements for the remaining fields.

Direct prerequisites: `RankZeroOneBSD:BSD.8/finite-prime-certificate`, `RankZeroOneBSD:BSD.8/support-membership`, `RankZeroOneBSD:BSD.8/zero-iff-outside-support`.

Uses:

- **BSD.8 exceptional 2, 3, and bad primes**: Combines the named source-qualified branches with independent exceptional-prime calculations only after their ranges cover all primes.

API:

- `Rat.PrimeValuationCertificate.ofExceptionSet` (constructor): Construct the certificate from inside and outside prime-valuation proofs.
- `Rat.PrimeValuationCertificate.ofExceptionSet_primes` (simp): Its finite set equals the supplied S.
- `Rat.PrimeValuationCertificate.ofExceptionSet_proof_independent` (extensionality): For fixed q and S the constructed certificate is independent of the primality, inside and outside proofs.

Unit tests:

- `Rat.PrimeValuationCertificate.ofExceptionSet_test_empty`: For q=1 and S empty the supplied global outside theorem gives the empty certificate.
- `Rat.PrimeValuationCertificate.ofExceptionSet_test_enlarged`: For q=1 and S={2,3}, correct inside and outside proofs produce a certificate with exactly {2,3}, not the minimal support.
- `Rat.PrimeValuationCertificate.ofExceptionSet_test_negative_one`: For q=-1 and S={2}, correct prime data produce a valuation certificate, still without positivity.

Acceptance: The outside theorem has to cover every prime outside S, not just every sufficiently large prime beyond a second unstated exception set.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8. The inside and outside proofs remain distinct inputs; deriving support coverage does not manufacture any missing prime-part theorem.

#### Transfer of a certified rational quotient to a real identity

Declaration: `RankZeroOneBSD:BSD.8/real-identity` (comparison).

Let A,B be real numbers with B nonzero. If q is a strictly positive rational number, its canonical real image equals A/B, and q has a finite prime-valuation certificate, then A=B.

Hypotheses: B is nonzero. q is strictly positive. The real image of q is exactly A/B. A finite prime-valuation certificate for q is supplied.

Proof plan:

1. Apply certificate-reconstruction to obtain q=1.
2. Transport this equality through the canonical rational-to-real map. The identified quotient is one. Multiply by nonzero B using field algebra.

Direct prerequisites: `RankZeroOneBSD:BSD.8/certificate-reconstruction`.

Acceptance: The theorem does not assert that arbitrary A/B is rational. It also does not identify A or B with elliptic-curve invariants.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8. An exact rational-to-real identification is indispensable; numerical recognition of a quotient is not this hypothesis.

#### Full leading term under the actual defect certificate

Declaration: `RankZeroOneBSD:BSD.8/elliptic-endpoint` (application).

For an actual elliptic curve E/ℚ of analytic rank at most one, a Rat.PrimeValuationCertificate for BSD.5’s bsdDefect E proves the full real identity L*(E,1)=Ω_E Reg_BSD(E/ℚ) #Ш(E/ℚ) ∏c_ℓ(E)/#E(ℚ)_tors². Its hypotheses include the proved analytic-rank bound and a complete certificate, not just finitely many observed p-parts.

Hypotheses: analyticRank E≤1. A complete finite valuation certificate for the actual bsdDefect E.

Proof plan:

1. Import rational-bsd-defect, its positivity and exact real quotient, including rank equality and whole-Sha finiteness from BSD.4.
2. Apply real-identity to the certificate and the positive arithmetic denominator.

Direct prerequisites: `RankZeroOneBSD:BSD.5/rational-bsd-defect`, `RankZeroOneBSD:BSD.8/real-identity`.

Acceptance: An arbitrary rational carrying the same label is not an admissible substitute for d_E. Keep rank equality and whole-Sha finiteness as separate public results.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8. The theorem is conditional on a complete certificate for the actual curve defect; it is not unrestricted rank-zero/one BSD.

#### Rational valuation with torsion square

Declaration: `RankZeroOneBSD:BSD.8/torsion-square-valuation` (lemma).

For a prime p and nonzero rationals q,a,t, v_p(q·t²/a)=v_p(q)+2v_p(t)−v_p(a). In an elliptic defect comparison q is the rational leading-term quotient after period/regulator rationality, t is the actual torsion order and a is the finite Sha–Tamagawa product. The sign of the torsion correction is positive in the defect and negative in the arithmetic leading term.

Hypotheses: p prime; q,a,t nonzero rational numbers.

Proof plan:

1. Use padicValRat.mul, pow and div with the nonzero arguments; convert the natural exponent 2 to the integer coefficient.
2. Apply the identity only after BSD.5 provides the rational leading-term quotient.

Direct prerequisites: `mathlib:padicValRat.mul`, `mathlib:padicValRat.pow`, `mathlib:padicValRat.div`.

Acceptance: For q=1/25,t=5,a=1, the valuation at 5 is zero; omitting t² yields −2.

Sources: [mathlib-padic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean), padicValRat.mul; padicValRat.pow; padicValRat.div. The pinned valuation algebra keeps denominator valuations and the square.

#### Finite Selmer cardinality and Sha torsion

Declaration: `RankZeroOneBSD:BSD.8/selmer-cardinality-adapter` (comparison).

For E/ℚ with known Mordell–Weil rank r, exact torsion group and m=p^n>1, a verified finite presentation of Sel_m and the actual Kummer exact sequence give #Ш(E/ℚ)[m]=#Sel_m/(m^r·#E(ℚ)_tors/mE(ℚ)_tors). To conclude the p-primary order from this finite layer one must also prove that p^n annihilates Ш[p∞]. Finiteness alone does not make n=1 sufficient.

Hypotheses: m=p^n, p prime, n≥1; exact finite Sel_m presentation and correct actual local Kummer images; rank and torsion verified.

Proof plan:

1. Import EllipticCurves Layer 7’s exact 0→E(ℚ)/mE(ℚ)→Sel_m→Ш[m]→0, not a new Selmer definition.
2. Use the actual finite generated Mordell–Weil decomposition from Layer 6 to compute the quotient cardinality; a subgroup of finite index is not automatically the full free lattice.
3. Take cardinalities of the verified finite presentation. With an independent exponent bound identify Ш[m] with Ш[p∞].

Direct prerequisites: `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, `ArithmeticGaloisDuality:R02.4`.

Acceptance: A p-Selmer count can detect Sha[p] without measuring the higher p-power exponent.

Sources: [cremona3](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.6 2-descent, exact sequence following the quartic Selmer description. The generic Kummer cardinality is the consumer adapter; finite descent is not confused with full Sha.

#### Certified Sha annihilator and finite descent

Declaration: `RankZeroOneBSD:BSD.8/sha-annihilator-adapter` (theorem). Planet: **Certified finite descent**.

For an analytic-rank-at-most-one actual E, take a proved positive integer B annihilating the whole Ш(E/ℚ), obtained from an explicit bounded-error Kolyvagin descent or another independently certified arithmetic bound. For each prime p|B, verified Sel_{p^{v_p(B)}} data determine #Ш[p∞] by selmer-cardinality-adapter. Their product is the whole Sha order; for p∤B the p-primary group vanishes. A claimed annihilator must include all exceptional, dyadic and bad-prime constants.

Hypotheses: A theorem proves B>0 and [B]Ш(E/ℚ)=0, not just predicted order or abstract finiteness. Each listed finite Selmer presentation is certified with its local images and actual Mordell–Weil quotient.

Proof plan:

1. Import the all-prime arithmetic descent from HE.7 and the explicit error constants/annihilator promised for the particular curve or family; record a gap where no numerical annihilator producer has been established.
2. Factor B with the baseline primeFactors/factorization API. Apply selmer-cardinality-adapter at the full exponent.
3. Use primary decomposition for the finite group to reconstruct its cardinality and prove outside-prime vanishing.

Direct prerequisites: `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`, `HeegnerPointEulerSystems:HE.7`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `RankZeroOneBSD:BSD.8/selmer-cardinality-adapter`, `mathlib:Nat.primeFactors`.

Acceptance: A bound proved only away from a finite set does not certify an annihilator of the whole group.

Sources: [gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Theorem 1.3 and discussion of the exceptional factor, printed pp.237–239. The bound has exceptional constants, particularly powers of 2; the conjectural exact Sha index formula is not used.

#### Certified free lattice and saturation index

Declaration: `RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter` (comparison).

For actual points P₁,…,P_r on E/ℚ, a certified rank bound and linear independence identify their subgroup as finite index, not as the full Mordell–Weil free lattice. A proved height bound plus finite complete search, or certified q-saturation for every prime dividing a proved index bound, supplies the exact index I_free. In rank one h_BSD(P)=I_free²Reg_BSD(E), while [E(ℚ):ℤP]=I_free·#tors.

Hypotheses: Actual points and torsion subgroup; exact rank r; a proved height/index bound and a complete finite enumeration or all required saturation proofs.

Proof plan:

1. Import EllipticCurves Layer 6’s saturation and height-comparison algorithms, with their termination bounds.
2. Use Cremona Proposition 3.5.1’s explicit height comparison to bound possible divisors/generators; exclude them by exact rational arithmetic and a complete search.
3. Apply BSD.5’s free-index height identity with GZ.0’s BSD regulator normalization.

Direct prerequisites: `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, `RankZeroOneBSD:BSD.5/heegner-index-height-formula`, `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`.

Acceptance: Replacing a generator by 2P multiplies its height by 4 but does not change Reg_BSD of the full lattice.

Sources: [cremona3](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.5, Proposition 3.5.1 and rank-one generator criterion. A rank-one point is not certified as a generator from its nonzero height alone.

#### Local Tamagawa certificate adapter

Declaration: `RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter` (comparison).

For the actual integral minimal models at every bad prime ℓ of E, a verified Tate-algorithm trace determines the reduction type, conductor exponent and component-group order c_ℓ. The finite Tamagawa product is over the support of the minimal discriminant; every good-prime factor is one. Dyadic, ternary and additive cases use their own residue-characteristic branches and exact minimality proofs.

Hypotheses: Integral models with certified local minimality and a complete bad-prime list; exact Tate-algorithm traces including ℓ=2,3.

Proof plan:

1. Import EllipticCurves Layer 4 and Néron-model component groups rather than defining c_ℓ by a table.
2. Replay each integral coordinate change and residue calculation; identify the component group cardinality, not only its Kodaira symbol.
3. Prove all primes outside the discriminant support have good reduction and c_ℓ=1, then form the finite product.

Direct prerequisites: `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `NeronModelsAndSemistableAbelianVarieties:R11.4`, `mathlib:Nat.primeFactors`.

Acceptance: An additive prime at 2 is not certified by the ℓ≥5 table.

Sources: [cremona3](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.2 Tate algorithm and local information. The adapter consumes an exact local trace with small-characteristic branches.

#### Exact local isogeny comparison

Declaration: `RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter` (comparison).

For an actual ℚ-isogeny φ:E→E′ and its dual, certified kernel, cokernel and differential indices at each relevant place, with global Mordell–Weil/torsion and Sha terms, verify the Cassels arithmetic quotient comparison. Transport a proved p-part/full certificate via BSD.5’s bsdDefect-isogeny invariance. The local data are not replaced by isogeny degree alone, especially at p dividing deg φ and at additive or dyadic places.

Hypotheses: Actual isogeny and dual; exact finite local/global index calculations and the source’s finite-Sha hypotheses.

Proof plan:

1. Import EllipticCurves Layers 1/4/7’s differential, local Kummer and Cassels comparison APIs.
2. Compute local cokernels and kernel orders on the actual models, with Néron differential pullback and full real components.
3. Use defect-isogeny-invariance, which combines the arithmetic comparison with equality of all analytic local factors.

Direct prerequisites: `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `RankZeroOneBSD:BSD.5/defect-isogeny-invariance`.

Acceptance: Isogenous curves may have different torsion and Tamagawa numbers and different real periods.

Sources: [wuthrich](https://ems.press/content/serial-article-files/26230?nt=1), Lemma 17, p.398; Theorem 4 lattice construction. The arithmetic and analytic period changes must match integrally.

#### Exceptional-prime leading-term certificate adapter

Declaration: `RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter` (comparison).

For a specific E and a prime p excluded from the available named prime-part theorems, exact rational leading-term/period/regulator comparison, finite Sha/descent data, torsion order and all local Tamagawa factors compute v_p(bsdDefect E). A valuation-zero conclusion requires the computed equality, including p=2,3 or bad/additive p. Such data are certificate producers for a curve or specified family; they are not a uniform all-E exceptional-prime theorem.

Hypotheses: Actual positive rational defect and exact analytic rational quotient; certified whole-Sha p-primary data, torsion, free lattice and local invariants.

Proof plan:

1. At rank zero import BSD.5 modular-symbol rationality and its actual period comparison; at rank one import its Gross–Zagier/free-index rationality.
2. Use sha-annihilator-adapter, mordell-weil-saturation-adapter and local-tamagawa-certificate-adapter, or an exact isogeny transfer with all indices verified.
3. Apply torsion-square-valuation and exact integer factorization; produce a proof that the resulting integer is zero rather than a numerical approximation to the real leading term.

Direct prerequisites: `RankZeroOneBSD:BSD.5/rational-bsd-defect`, `RankZeroOneBSD:BSD.5/rank-zero-rationality`, `RankZeroOneBSD:BSD.5/rank-one-rationality`, `RankZeroOneBSD:BSD.8/sha-annihilator-adapter`, `RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter`, `RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter`, `RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter`, `RankZeroOneBSD:BSD.8/torsion-square-valuation`.

Acceptance: A database’s analytic Sha order is not admitted as a finite-Sha proof.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8 exceptional-prime contract. Exact arithmetic producers discharge primes outside the named theorem ranges.

#### Source-qualified fixed-prime dispatch

Declaration: `RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch` (application).

For an actual curve E of analytic rank at most one and a prime p, a verified instance of a named BSD.6 branch, cgs-eisenstein-prime-bsd, ky-eisenstein-prime-bsd, or exceptional-prime-part-adapter proves v_p(bsdDefect E)=0. The instance includes every source hypothesis; no disjunction is discharged by an unproved blanket claim that p is good, large or irreducible.

Hypotheses: E actual elliptic; analyticRank E≤1; p prime; one exact source-qualified branch or a complete arithmetic certificate applies.

Proof plan:

1. Match the actual residual representation/isogeny and local reduction to the chosen source branch.
2. Apply its defect-valuation conclusion and normalize it through BSD.5.
3. Retain the branch witness as the provenance for the finite certificate entry.

Direct prerequisites: `RankZeroOneBSD:BSD.6`, `RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd`, `RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd`, `RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter`, `RankZeroOneBSD:BSD.5/rational-bsd-defect`.

Acceptance: Good irreducible reduction alone is insufficient for the rank-zero ramification-qualified branch.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.6–BSD.8 named branches. Every fixed-prime certificate has an identified proof range.

#### Individual full BSD from a finite exceptional set

Declaration: `RankZeroOneBSD:BSD.8/individual-full-bsd-from-exceptions` (theorem). Planet: **Full BSD from prime certificates**.

For an actual E/ℚ with analyticRank E≤1, let S be an explicit finite set of primes. Prove v_p(bsdDefect E)=0 for every p∈S, and prove the same for every prime p∉S using source-qualified theorem ranges or a certified arithmetic bound. Then the exact leading-term BSD formula holds for E. The outside theorem proves support coverage; alternatively supply the canonical numerator/denominator support cover directly. Both constructions require every listed localZero proof.

Hypotheses: S finite, all members prime; actual defect positivity; all inside and all outside valuations vanish.

Proof plan:

1. Use certificate-from-exceptions to prove the actual support lies in S; no unverified support field remains.
2. Apply elliptic-endpoint to the resulting complete certificate.
3. When the outside range is p>B, include every prime ≤B together with all other named exclusions; simply recording “sufficiently large” is not an outside proof for a supplied S.

Direct prerequisites: `RankZeroOneBSD:BSD.8/certificate-from-exceptions`, `RankZeroOneBSD:BSD.8/elliptic-endpoint`, `RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch`.

Acceptance: Omitting a possibly nonzero dyadic valuation blocks this theorem.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8 full-formula assembly. The complete finite certificate is the final logical gate.

#### Full BSD for an explicitly certified family

Declaration: `RankZeroOneBSD:BSD.8/family-full-bsd-from-certificates` (theorem).

For a specified parameter type A and an actual elliptic curve E_a/ℚ for each a, if every E_a has analyticRank≤1 and a supplied complete Rat.PrimeValuationCertificate for bsdDefect E_a, then the full leading-term formula holds for every a. If S_a and source-qualified inside/outside proofs construct the certificate, they may depend on a. No uniform theorem on all residual exceptional primes is assumed.

Hypotheses: A specified family of actual curves; proved rank bound and complete certificate for each parameter.

Proof plan:

1. Apply individual-full-bsd-from-exceptions or elliptic-endpoint pointwise.
2. Expose the parameter-dependent bad-prime set, reduction/isogeny data, and certified exceptional valuations in the family theorem’s hypotheses.

Direct prerequisites: `RankZeroOneBSD:BSD.8/individual-full-bsd-from-exceptions`, `RankZeroOneBSD:BSD.8/elliptic-endpoint`.

Acceptance: A theorem proving only all sufficiently large p for every a does not satisfy this contract.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8 individual/family boundary. The quantified certificate is part of the family proof, not a predicted global BSD theorem.

### RankZeroOneBSD:BSD.9

#### A prime defect is invisible at every other prime

Declaration: `RankZeroOneBSD:BSD.9/away-from-prime` (lemma).

For distinct primes p and ell, the rational number p has valuation zero at ell.

Hypotheses: p and ell are primes. p is different from ell.

Proof plan:

1. Nat.Prime.dvd_iff_eq implies ell does not divide p, since ell is not one and the primes differ.
2. Apply padicValNat.eq_zero_of_not_dvd, then padicValRat.of_nat.

Direct prerequisites: `mathlib:Nat.Prime.dvd_iff_eq`, `mathlib:padicValNat.eq_zero_of_not_dvd`, `mathlib:padicValRat.of_nat`.

Acceptance: With p=2 this verifies all odd-prime checks even though the rational defect is not one. With p=3 the same issue affects an omitted triadic check.

Sources: [mathlib-prime-basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Prime/Basic.lean), Nat.Prime.dvd_iff_eq. Different primes cannot divide one another.; [mathlib-padic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean), padicValRat.of_nat. Move the divisibility calculation to the rational valuation.

#### No complete certificate for a prime defect

Declaration: `RankZeroOneBSD:BSD.9/prime-obstruction` (application).

For every prime p, Rat.PrimeValuationCertificate(p), where p is cast to Q, is uninhabited.

Hypotheses: p is prime.

Proof plan:

1. Suppose a certificate were supplied. The rational p is positive, so certificate-reconstruction would give p=1. Primality gives p>1, a contradiction.

Direct prerequisites: `RankZeroOneBSD:BSD.8/certificate-reconstruction`.

Acceptance: Combine with away-from-prime for p=2: all odd-prime checks pass, but no complete certificate exists. The primitive baseline padicValRat.self gives the missing valuation as one.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9 acceptance tests. A rational countermodel tests the logical gate; it is not an elliptic curve or a claim about its Sha.

#### The remaining dyadic equality under all odd-prime equalities

Declaration: `RankZeroOneBSD:BSD.9/dyadic-gate` (comparison).

For strictly positive q in Q, assume v_p(q)=0 for every odd prime p. Then q=1 if and only if v_2(q)=0.

Hypotheses: q is strictly positive. All odd-prime valuations of q vanish.

Proof plan:

1. Use Nat.forall_prime_iff_two_and_odd to combine the supplied odd-prime results with a dyadic equality, or extract that equality from all-prime vanishing.
2. Apply positive-rational-reconstruction in both directions.

Direct prerequisites: `RankZeroOneBSD:BSD.8/positive-rational-reconstruction`, `mathlib:Nat.forall_prime_iff_two_and_odd`.

Acceptance: For q=2 and q=1/4 the dyadic hypothesis fails although every odd-prime test succeeds. For q=1 both sides hold.

Sources: [mathlib-prime-basic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Prime/Basic.lean), forall_prime_iff_two_and_odd. Instantiate the existing prime split with vanishing of the rational valuation.

#### Concrete 11a3 Weierstrass model

Declaration: `RankZeroOneBSD:BSD.9/fixture-11` (definition).

Define fixture11 as the actual Mathlib WeierstrassCurve over ℚ with coefficient tuple (0,−1,1,0,0). Its invariants are Δ=−11, c₄=16 and j=−4096/11. It is nonsingular and supplies the rank zero with rational 5-torsion test. Labels are descriptive; changing the model changes the period and differential data.

Proof plan:

1. Use the existing five-field Mathlib structure, its invariant polynomials and toAffine.
2. Evaluate b₂,b₄,b₆,b₈,c₄,Δ by exact rational arithmetic; nonzero Δ gives IsElliptic.
3. Evaluate the affine equation and partial derivatives at (0,0), proving Nonsingular rather than merely Equation.

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.Affine.Nonsingular`.

Uses:

- **BSD.9 analytic and arithmetic comparisons**: Instantiate actual L-functions, points, local models and periods on this curve; no free carrier of predicted invariants.

API:

- `WeierstrassCurve.BSD.fixture11_coefficients` (characterisation): (a₁,a₂,a₃,a₄,a₆)=(0,−1,1,0,0)
- `WeierstrassCurve.BSD.fixture11_discriminant` (simp): Δ=−11
- `WeierstrassCurve.BSD.fixture11_elliptic` (simp): fixture11.IsElliptic
- `WeierstrassCurve.BSD.fixture11_origin_nonsingular` (simp): fixture11.toAffine.Nonsingular 0 0

Unit tests:

- `WeierstrassCurve.BSD.fixture11_test_equation`: (0,0) satisfies y²+y=x³−x²
- `WeierstrassCurve.BSD.fixture11_test_not_optimal_model`: a₄=0, a₆=0; this is 11a3, not 11a1
- `WeierstrassCurve.BSD.fixture11_test_real_components`: Δ<0, so c∞=1

Acceptance: Exact rational arithmetic distinguishes the models and proves Δ≠0.

Sources: [cremona-table1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 11a3. The model coefficients, not the database label, define the fixture.

#### 11a3 discriminant calculation

Declaration: `RankZeroOneBSD:BSD.9/fixture-11-discriminant` (lemma).

The actual coefficient polynomial gives fixture11.Δ=−11.

Proof plan:

1. Unfold the five coefficients and Mathlib Δ; reduce the rational polynomial.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-11`, `mathlib:WeierstrassCurve.Δ`.

Acceptance: The result is nonzero and has the stated sign.

Sources: [cremona-table1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 11a3. The model coefficients, not the database label, define the fixture.

#### 11a3 ellipticity and affine point domain

Declaration: `RankZeroOneBSD:BSD.9/fixture-11-elliptic` (lemma).

fixture11 is elliptic and fixture11.toAffine.Nonsingular 0 0 holds.

Proof plan:

1. Apply the nonzero-discriminant criterion.
2. For (0,0), evaluate the equation and at least one nonzero partial derivative.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-11-discriminant`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.Affine.Nonsingular`.

Acceptance: A proof of Equation alone does not construct a Mathlib affine point.

Sources: [cremona-table1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 11a3. The model coefficients, not the database label, define the fixture.

#### Concrete 37a1 Weierstrass model

Declaration: `RankZeroOneBSD:BSD.9/fixture-37` (definition).

Define fixture37 as the actual Mathlib WeierstrassCurve over ℚ with coefficient tuple (0,0,1,−1,0). Its invariants are Δ=37, c₄=48 and j=110592/37. It is nonsingular and supplies the rank one with a certified free generator test. Labels are descriptive; changing the model changes the period and differential data.

Proof plan:

1. Use the existing five-field Mathlib structure, its invariant polynomials and toAffine.
2. Evaluate b₂,b₄,b₆,b₈,c₄,Δ by exact rational arithmetic; nonzero Δ gives IsElliptic.
3. Evaluate the affine equation and partial derivatives at (0,0), proving Nonsingular rather than merely Equation.

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.Affine.Nonsingular`.

Uses:

- **BSD.9 analytic and arithmetic comparisons**: Instantiate actual L-functions, points, local models and periods on this curve; no free carrier of predicted invariants.

API:

- `WeierstrassCurve.BSD.fixture37_coefficients` (characterisation): (a₁,a₂,a₃,a₄,a₆)=(0,0,1,−1,0)
- `WeierstrassCurve.BSD.fixture37_discriminant` (simp): Δ=37
- `WeierstrassCurve.BSD.fixture37_elliptic` (simp): fixture37.IsElliptic
- `WeierstrassCurve.BSD.fixture37_origin_nonsingular` (simp): fixture37.toAffine.Nonsingular 0 0

Unit tests:

- `WeierstrassCurve.BSD.fixture37_test_equation`: (0,0) satisfies y²+y=x³−x
- `WeierstrassCurve.BSD.fixture37_test_positive_discriminant`: Δ>0, so c∞=2
- `WeierstrassCurve.BSD.fixture37_test_distinct_from_11`: a₂=0 and Δ=37, excluding the rank-zero fixture

Acceptance: Exact rational arithmetic distinguishes the models and proves Δ≠0.

Sources: [cremona-table1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 37a1. The model coefficients, not the database label, define the fixture.; [gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Printed p.236, equation and point of X₀(37)/w₃₇. The printed example gives the same actual curve and point.

#### 37a1 discriminant calculation

Declaration: `RankZeroOneBSD:BSD.9/fixture-37-discriminant` (lemma).

The actual coefficient polynomial gives fixture37.Δ=37.

Proof plan:

1. Unfold the five coefficients and Mathlib Δ; reduce the rational polynomial.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-37`, `mathlib:WeierstrassCurve.Δ`.

Acceptance: The result is nonzero and has the stated sign.

Sources: [cremona-table1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 37a1. The model coefficients, not the database label, define the fixture.; [gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Printed p.236, equation and point of X₀(37)/w₃₇. The printed example gives the same actual curve and point.

#### 37a1 ellipticity and affine point domain

Declaration: `RankZeroOneBSD:BSD.9/fixture-37-elliptic` (lemma).

fixture37 is elliptic and fixture37.toAffine.Nonsingular 0 0 holds.

Proof plan:

1. Apply the nonzero-discriminant criterion.
2. For (0,0), evaluate the equation and at least one nonzero partial derivative.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-37-discriminant`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.Affine.Nonsingular`.

Acceptance: A proof of Equation alone does not construct a Mathlib affine point.

Sources: [cremona-table1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 37a1. The model coefficients, not the database label, define the fixture.; [gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Printed p.236, equation and point of X₀(37)/w₃₇. The printed example gives the same actual curve and point.

#### Concrete 32a2 Weierstrass model

Declaration: `RankZeroOneBSD:BSD.9/fixture-32` (definition).

Define fixture32 as the actual Mathlib WeierstrassCurve over ℚ with coefficient tuple (0,0,0,−1,0). Its invariants are Δ=64, c₄=48 and j=1728. It is nonsingular and supplies the CM and additive dyadic reduction test. Labels are descriptive; changing the model changes the period and differential data.

Proof plan:

1. Use the existing five-field Mathlib structure, its invariant polynomials and toAffine.
2. Evaluate b₂,b₄,b₆,b₈,c₄,Δ by exact rational arithmetic; nonzero Δ gives IsElliptic.
3. Evaluate the affine equation and partial derivatives at (0,0), proving Nonsingular rather than merely Equation.

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.Affine.Nonsingular`.

Uses:

- **BSD.9 analytic and arithmetic comparisons**: Instantiate actual L-functions, points, local models and periods on this curve; no free carrier of predicted invariants.

API:

- `WeierstrassCurve.BSD.fixture32_coefficients` (characterisation): (a₁,a₂,a₃,a₄,a₆)=(0,0,0,−1,0)
- `WeierstrassCurve.BSD.fixture32_discriminant` (simp): Δ=64
- `WeierstrassCurve.BSD.fixture32_elliptic` (simp): fixture32.IsElliptic
- `WeierstrassCurve.BSD.fixture32_origin_nonsingular` (simp): fixture32.toAffine.Nonsingular 0 0
- `WeierstrassCurve.BSD.fixture32_j` (simp): j=1728

Unit tests:

- `WeierstrassCurve.BSD.fixture32_test_three_two_torsion_roots`: x³−x has the three distinct rational roots −1,0,1
- `WeierstrassCurve.BSD.fixture32_test_dyadic_discriminant`: v₂(Δ)=6, while c₄=48
- `WeierstrassCurve.BSD.fixture32_test_real_components`: Δ>0, so c∞=2

Acceptance: Exact rational arithmetic distinguishes the models and proves Δ≠0.

Sources: [cremona-table1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 32a2. The model coefficients, not the database label, define the fixture.

#### 32a2 discriminant calculation

Declaration: `RankZeroOneBSD:BSD.9/fixture-32-discriminant` (lemma).

The actual coefficient polynomial gives fixture32.Δ=64.

Proof plan:

1. Unfold the five coefficients and Mathlib Δ; reduce the rational polynomial.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-32`, `mathlib:WeierstrassCurve.Δ`.

Acceptance: The result is nonzero and has the stated sign.

Sources: [cremona-table1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 32a2. The model coefficients, not the database label, define the fixture.

#### 32a2 ellipticity and affine point domain

Declaration: `RankZeroOneBSD:BSD.9/fixture-32-elliptic` (lemma).

fixture32 is elliptic and fixture32.toAffine.Nonsingular 0 0 holds.

Proof plan:

1. Apply the nonzero-discriminant criterion.
2. For (0,0), evaluate the equation and at least one nonzero partial derivative.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-32-discriminant`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.Affine.Nonsingular`.

Acceptance: A proof of Equation alone does not construct a Mathlib affine point.

Sources: [cremona-table1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, printed pp.109–112, row 32a2. The model coefficients, not the database label, define the fixture.

#### Actual 11 fixture point

Declaration: `RankZeroOneBSD:BSD.9/point-11` (definition).

Define point11 by the actual Mathlib Affine.Point.some constructor at (0,0), using fixture-11-elliptic. Its additive order is 5 (zero denotes infinite order). Addition gives 2P=(1,−1), 3P=(1,0), 4P=(0,−1), 5P=O.

Proof plan:

1. Construct Point.some from the Nonsingular proof; import the existing AddCommGroup law.
2. Evaluate the Weierstrass chord/tangent law at the listed points, taking all denominator and exceptional cases into account.
3. For 37 transport by X=4x,Y=8y+4 to the short integral model Y²=X³−16X+16 and use Lutz–Nagell on X(8P)=84/25; for 11 and 32 use the listed order and nonidentity tests.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-11-elliptic`, `mathlib:WeierstrassCurve.Affine.Point`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `mathlib:orderOf`.

Uses:

- **BSD.9 rank, torsion and saturation comparisons**: Supply actual points and exact multiples; point37 still needs a full-lattice saturation proof, not just infinite order.

API:

- `WeierstrassCurve.BSD.point11_nonzero` (characterisation): P≠O
- `WeierstrassCurve.BSD.point11_order` (characterisation): addOrderOf P=5
- `WeierstrassCurve.BSD.point11_coordinates` (characterisation): P is the actual point (0,0) on fixture11

Unit tests:

- `WeierstrassCurve.BSD.point11_test_double`: 2P=(1,−1)
- `WeierstrassCurve.BSD.point11_test_order_five`: 5P=O and P≠O
- `WeierstrassCurve.BSD.point11_test_not_two_torsion`: 2P≠O

Acceptance: All points and multiples refer to the specified model.

Sources: [cremona3](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.

#### Order of the 11 fixture point

Declaration: `RankZeroOneBSD:BSD.9/point-11-order` (lemma).

For the actual point11, addOrderOf point11=5.

Proof plan:

1. Use the concrete multiples and nonidentity tests of point-11.
2. For 37 first transport by X=4x,Y=8y+4 to Y²=X³−16X+16, then invoke Lutz–Nagell on X(8P)=84/25; for finite prime order, rule out order one.

Direct prerequisites: `RankZeroOneBSD:BSD.9/point-11`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `mathlib:orderOf`.

Acceptance: Infinite order is distinguished from a missing order calculation.

Sources: [cremona3](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.

#### Actual 37 fixture point

Declaration: `RankZeroOneBSD:BSD.9/point-37` (definition).

Define point37 by the actual Mathlib Affine.Point.some constructor at (0,0), using fixture-37-elliptic. Its additive order is 0 (zero denotes infinite order). Addition gives 2P=(1,0), 3P=(−1,−1), 4P=(2,−3); x(8P)=21/25; under X=4x,Y=8y+4 on Y²=X³−16X+16, X(8P)=84/25.

Proof plan:

1. Construct Point.some from the Nonsingular proof; import the existing AddCommGroup law.
2. Evaluate the Weierstrass chord/tangent law at the listed points, taking all denominator and exceptional cases into account.
3. For 37 transport by X=4x,Y=8y+4 to the short integral model Y²=X³−16X+16 and use Lutz–Nagell on X(8P)=84/25; for 11 and 32 use the listed order and nonidentity tests.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-37-elliptic`, `mathlib:WeierstrassCurve.Affine.Point`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `mathlib:orderOf`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

Uses:

- **BSD.9 rank, torsion and saturation comparisons**: Supply actual points and exact multiples; point37 still needs a full-lattice saturation proof, not just infinite order.

API:

- `WeierstrassCurve.BSD.point37_nonzero` (characterisation): P≠O
- `WeierstrassCurve.BSD.point37_order` (characterisation): addOrderOf P=0 (infinite order)
- `WeierstrassCurve.BSD.point37_coordinates` (characterisation): P is the actual point (0,0) on fixture37

Unit tests:

- `WeierstrassCurve.BSD.point37_test_double`: 2P=(1,0)
- `WeierstrassCurve.BSD.point37_test_infinite_order`: 8P has x-coordinate 21/25; the explicit short integral model has X(8P)=84/25, so Lutz–Nagell excludes torsion
- `WeierstrassCurve.BSD.point37_test_not_torsion_generator`: No nonzero integer multiple of P is O

Acceptance: All points and multiples refer to the specified model.

Sources: [cremona3](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.; [gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Printed p.236, E(ℚ)=ℤP and P=(0,0). The example identifies a free generator; the blueprint also requires replayable saturation.

#### Order of the 37 fixture point

Declaration: `RankZeroOneBSD:BSD.9/point-37-order` (lemma).

For the actual point37, addOrderOf point37=0.

Proof plan:

1. Use the concrete multiples and nonidentity tests of point-37.
2. For 37 first transport by X=4x,Y=8y+4 to Y²=X³−16X+16, then invoke Lutz–Nagell on X(8P)=84/25; for finite prime order, rule out order one.

Direct prerequisites: `RankZeroOneBSD:BSD.9/point-37`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `mathlib:orderOf`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

Acceptance: Infinite order is distinguished from a missing order calculation.

Sources: [cremona3](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.; [gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Printed p.236, E(ℚ)=ℤP and P=(0,0). The example identifies a free generator; the blueprint also requires replayable saturation.

#### Actual 32 fixture point

Declaration: `RankZeroOneBSD:BSD.9/point-32` (definition).

Define point32 by the actual Mathlib Affine.Point.some constructor at (0,0), using fixture-32-elliptic. Its additive order is 2 (zero denotes infinite order). Addition gives 2P=O; the other nonzero rational 2-torsion points are (1,0),(−1,0).

Proof plan:

1. Construct Point.some from the Nonsingular proof; import the existing AddCommGroup law.
2. Evaluate the Weierstrass chord/tangent law at the listed points, taking all denominator and exceptional cases into account.
3. For 37 transport by X=4x,Y=8y+4 to the short integral model Y²=X³−16X+16 and use Lutz–Nagell on X(8P)=84/25; for 11 and 32 use the listed order and nonidentity tests.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-32-elliptic`, `mathlib:WeierstrassCurve.Affine.Point`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `mathlib:orderOf`.

Uses:

- **BSD.9 rank, torsion and saturation comparisons**: Supply actual points and exact multiples; point37 still needs a full-lattice saturation proof, not just infinite order.

API:

- `WeierstrassCurve.BSD.point32_nonzero` (characterisation): P≠O
- `WeierstrassCurve.BSD.point32_order` (characterisation): addOrderOf P=2
- `WeierstrassCurve.BSD.point32_coordinates` (characterisation): P is the actual point (0,0) on fixture32

Unit tests:

- `WeierstrassCurve.BSD.point32_test_double_zero`: 2P=O
- `WeierstrassCurve.BSD.point32_test_three_distinct_points`: (−1,0),(0,0),(1,0) are distinct nonzero 2-torsion points
- `WeierstrassCurve.BSD.point32_test_sum_two_other_points`: (1,0)+(−1,0)=P

Acceptance: All points and multiples refer to the specified model.

Sources: [cremona3](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.

#### Order of the 32 fixture point

Declaration: `RankZeroOneBSD:BSD.9/point-32-order` (lemma).

For the actual point32, addOrderOf point32=2.

Proof plan:

1. Use the concrete multiples and nonidentity tests of point-32.
2. For 37 first transport by X=4x,Y=8y+4 to Y²=X³−16X+16, then invoke Lutz–Nagell on X(8P)=84/25; for finite prime order, rule out order one.

Direct prerequisites: `RankZeroOneBSD:BSD.9/point-32`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `mathlib:orderOf`.

Acceptance: Infinite order is distinguished from a missing order calculation.

Sources: [cremona3](https://johncremona.github.io/book/fulltext/chapter3.pdf), §3.3 torsion tests and §3.5 generators. Explicit addition, reduction and integral-coordinate tests are proofs, unlike a table of predicted orders.

#### Rational five-torsion theorem-range test

Declaration: `RankZeroOneBSD:BSD.9/fixture-11-good-five` (theorem). Planet: **Rational torsion at an Eisenstein prime**.

fixture11 has good ordinary reduction at p=5, with #E(𝔽₅)=5 and a₅=1, and the actual point11 gives a rational cyclic 5-isogeny kernel. Its character is 1 at G₅. Therefore Keller–Yin’s good Eisenstein hypotheses apply and CGS’s local exclusion fails. Once the certified rank-zero analytic bound is supplied, the 5-part of the actual BSD defect vanishes by ky-eisenstein-prime-bsd.

Proof plan:

1. Reduce the nonsingular model modulo 5; enumerate its four affine points and O exactly.
2. Use point-11-order to construct the rational kernel/isogeny via EllipticCurves Layer 1, and read the trivial Galois action.
3. Apply ky-eisenstein-prime-bsd with analytic-fixture-enclosures. Check Δ=−11 gives good reduction and a₅ is a 5-adic unit.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-11-discriminant`, `RankZeroOneBSD:BSD.9/point-11-order`, `RankZeroOneBSD:BSD.9/analytic-fixture-enclosures`, `RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

Acceptance: No local torsion-free control formula may be substituted in this example.

Sources: [ky](https://arxiv.org/pdf/2402.12781v2), §0.3, p.5, example 11a3; Theorem C. A rational p-torsion example is in KY’s range and out of CGS’s local range.

#### CM and additive dyadic fixture

Declaration: `RankZeroOneBSD:BSD.9/fixture-32-cm-additive` (theorem). Planet: **CM curve with additive reduction**.

For fixture32, exact local minimality and the dyadic Tate algorithm give conductor 32, Kodaira type III at 2 and c₂=2; all other c_ℓ=1. The automorphism (x,y)↦(−x,iy) over ℚ(i) squares to [−1], and the imported characteristic-zero endomorphism classification identifies End(E_ℚ̄)=ℤ[i]. Thus this actual CM curve is not semistable. Its full rational torsion group is (ℤ/2)², established from the three displayed points and reduction bounds.

Proof plan:

1. Replay the residue-characteristic-two minimality and Tate-algorithm trace, not the ℓ≥5 classification.
2. Verify the automorphism on the actual equation, its group-law compatibility and square; use the CM endomorphism-ring theorem.
3. Combine point32 and the other two roots with prime-to-good-reduction torsion bounds at two odd good primes to exclude further rational torsion.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-32`, `RankZeroOneBSD:BSD.9/point-32-order`, `RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `ComplexMultiplicationAndExplicitReciprocity:CM.1`.

Acceptance: The good-Eisenstein BSD theorem is not used at the bad prime 2.

Sources: [cremona-table1](https://johncremona.github.io/book/fulltext/table1.pdf), Table 1, p.111, row 32A2. The additive dyadic trace and full torsion calculation must be certified separately from the table.

#### Fixture periods, heights and regulator conventions

Declaration: `RankZeroOneBSD:BSD.9/fixture-period-height-comparisons` (comparison).

On fixture11, c∞=1, and on fixture37 and fixture32, c∞=2. Their actual BSD real periods are Ωfull=c∞Ωpositive. Rank zero gives Reg_BSD=1 using the existing Tau Ceti rank-zero regulator theorem; the convention adapter Reg_BSD=2^r Reg_Tau has no effect at r=0 and doubles the rank-one regulator. On fixture37, if point37 is a saturated generator, Reg_BSD=h_BSD(point37); replacing it by 2point37 multiplies the point height by four and must not replace the regulator of the full lattice.

Hypotheses: Actual rank certificates, invariant differentials, and a saturated free generator in rank one.

Proof plan:

1. Use the discriminant signs with GZ.0 real-period-components.
2. Apply Tau Ceti’s regulator_eq_one_of_finrank_eq_zero under its actual finitely-generated PointModTorsion hypotheses; import GZ.0’s convention dictionary rather than replanning the regulator.
3. Use BSD.5’s free-index formula and rank-one saturation to compute the actual regulator; count c∞ only once.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-11-discriminant`, `RankZeroOneBSD:BSD.9/fixture-37-discriminant`, `RankZeroOneBSD:BSD.9/fixture-32-discriminant`, `RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter`, `GrossZagierAndArithmeticHeights:GZ.0/real-period-components`, `GrossZagierAndArithmeticHeights:GZ.0/height-convention-dictionary`, `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero`.

Acceptance: A missing real-component factor is detected on both Δ>0 fixtures; a missing factor two in rank-one pairing is detected on fixture37.

Sources: [gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Printed p.236, period and free generator of the 37 curve. The convention dictionary, not a numerical height, supplies the factor in the BSD regulator.

#### Central Mellin formulas with explicit tails

Declaration: `RankZeroOneBSD:BSD.9/mellin-central-tail-bounds` (lemma).

For the actual modular form of E of conductor N, write β=2π/√N, ρ=exp(−β) and a_n for its exact Fourier coefficients. If the root number is +1 then L(E,1)=2Σ_{n≥1}(a_n/n)exp(−βn). If it is −1 then L′(E,1)=2Σ_{n≥1}(a_n/n)E₁(βn), with E₁(x)=∫_x^∞exp(−t)/t dt. For |a_n|≤n² and a cutoff M, the absolute tails are bounded respectively by 2ρ^(M+1)((M+1)−Mρ)/(1−ρ)² and 2ρ^(M+1)/(β(1−ρ)). These concern the actual analytic continuation, never the raw Dirichlet series evaluated at 1.

Hypotheses: E modular, N>0, actual functional equation/root number; M≥0; exact coefficient bounds from Hasse and multiplicativity.

Proof plan:

1. Import the modularity/functional-equation and actual-L interfaces. Split the Mellin transform at 1/√N and substitute the functional equation, keeping its sign convention.
2. Differentiate the completed Mellin formula in the sign −1 case; use Cremona Proposition 2.13.1, whose E₁ is the indicated integral.
3. Bound E₁(x)≤exp(−x)/x for x>0; sum Σ_{n>M}nρ^n and Σ_{n>M}ρ^n explicitly. Hasse plus multiplicativity gives |a_n|≤d(n)√n≤n².

Direct prerequisites: `RankZeroOneBSD:BSD.0/actual-l-function`, `RankZeroOneBSD:BSD.0/completed-l-function`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`.

Acceptance: Swapping the root-number sign swaps the value and derivative formulas and fails the fixture test.

Sources: [cremona2](https://johncremona.github.io/book/fulltext/chapter2.pdf), §§2.8,2.12 and Proposition 2.13.1, pp.41–45. The exponential-integral formula and explicit tails turn truncation into a proof obligation.

#### Certified central values for the three fixtures

Declaration: `RankZeroOneBSD:BSD.9/analytic-fixture-enclosures` (theorem). Planet: **Certified rank zero and one examples**.

Replay exact rational interval certificates for the actual L-functions of fixture11, fixture37 and fixture32: 1/4<L(fixture11,1)<3/10, 1/4<L′(fixture37,1)<1/3 and 3/5<L(fixture32,1)<7/10. Their root numbers are respectively +1,−1,+1; the second sign forces L(fixture37,1)=0. The bounds then prove analytic ranks 0,1,0. The listed intervals are acceptance targets, not claims of completed interval proofs.

Hypotheses: Exact modular-form identification, conductor/root-number certificates and rigorous interval replay for π, square roots, exponentials and E₁ at each finite argument.

Proof plan:

1. Use the exact coefficient recurrence and finite-field point counts through a cutoff such as M=40, including the bad-prime coefficient cases.
2. Evaluate each finite sum using outward rational enclosures for elementary functions and a proved E₁ quadrature/tail bound; add mellin-central-tail-bounds. Record the rational bounds and all rounding errors in the certificate.
3. Use the BSD.0 analytic-rank definition and the functional equation to conclude the orders of vanishing. A floating-point sum is only a diagnostic.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-11`, `RankZeroOneBSD:BSD.9/fixture-37`, `RankZeroOneBSD:BSD.9/fixture-32`, `RankZeroOneBSD:BSD.9/mellin-central-tail-bounds`, `RankZeroOneBSD:BSD.0/analytic-rank`, `ComputationalNumberTheory:CN.4`.

Acceptance: Certificates must enclose every finite-sum error and the infinite tail; no raw LSeries at 1 or decimal nonzero test is allowed.

Sources: [cremona-examples](https://johncremona.github.io/book/fulltext/examples.pdf), N=11 and N=37 worked computations; compare Chapter 2 §2.13. Published decimal output selects broad target intervals but does not certify nonvanishing.

#### Finite descent and saturation for the three fixtures

Declaration: `RankZeroOneBSD:BSD.9/fixture-finite-arithmetic` (theorem).

Construct replayable arithmetic certificates for fixture11, fixture37 and fixture32 proving respectively rank/torsion/Tamagawa data (0,5,1), (1,1,1), (0,4,2), with point37 a saturated free generator. A full-Sha certificate additionally supplies a proved annihilator B of the whole Sha group and complete Selmer presentations for every p^n needed by B; the target Sha order is 1 in each fixture. This target must be derived, not read from analytic-Sha tables. If an annihilator or a primary presentation is absent, only the certified primary components are output.

Hypotheses: Actual models and points; exact local traces, descent presentations, rank and saturation bounds; a proved whole-Sha exponent bound for any whole-Sha assertion.

Proof plan:

1. Use analytic-fixture-enclosures and BSD.4 for rank equality and whole-Sha finiteness, but not an effective exponent bound.
2. Apply the Selmer-cardinality and Sha-annihilator adapters to each required p^n; finite Selmer computations with an unproved exponent do not finish this step.
3. Replay local-tamagawa-certificate-adapter and the torsion/reduction computations; use mordell-weil-saturation-adapter on point37.
4. Gross Theorem 1.3 bounds Sha by tI² with exceptional power of 2; retain that factor, and use actual 2-primary descent if necessary. Gross Conjecture 1.2 is not used as a theorem.

Direct prerequisites: `RankZeroOneBSD:BSD.9/analytic-fixture-enclosures`, `RankZeroOneBSD:BSD.9/point-11-order`, `RankZeroOneBSD:BSD.9/point-37-order`, `RankZeroOneBSD:BSD.9/fixture-32-cm-additive`, `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`, `RankZeroOneBSD:BSD.8/selmer-cardinality-adapter`, `RankZeroOneBSD:BSD.8/sha-annihilator-adapter`, `RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter`, `RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter`.

Acceptance: A 2-Selmer rank bound alone does not certify the odd primary components or the whole Sha order.

Sources: [gross](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf), Printed pp.235–239, Conjecture 1.2 versus Theorem 1.3. The power-of-two qualification must survive into the whole-Sha certificate.

#### Five-isogeny and torsion-square comparison

Declaration: `RankZeroOneBSD:BSD.9/fixture-11-isogeny-period` (comparison).

For fixture11=11a3 and the actual optimal curve 11a1, construct the cyclic five-isogeny and dual. With minimal Néron differentials and full real periods, verify Ω(11a3)=5Ω(11a1), c₁₁(11a3)=1, c₁₁(11a1)=5 and both rational torsion orders 5. The exact modular-symbol ratio L(11a1,1)/Ω(11a1)=1/5 then gives L(fixture11,1)/Ω(fixture11)=1/25. The arithmetic quotient has the same change; the p=5 torsion-square denominator cannot be dropped.

Hypotheses: Actual isogeny/differential and local/global index certificates on both models; exact modular-symbol period comparison.

Proof plan:

1. Use point11’s kernel with EllipticCurves Layer 1; replay the isogeny formulas, minimal differential scaling and map on real components.
2. Import the exact N=11 modular-symbol computation and verify its optimal-model period; transport it through the actual isogeny.
3. Use local-isogeny-certificate-adapter and torsion-square-valuation. The two ratios are exact; decimal period ratios are insufficient.

Direct prerequisites: `RankZeroOneBSD:BSD.9/point-11-order`, `RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter`, `RankZeroOneBSD:BSD.8/torsion-square-valuation`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `RankZeroOneBSD:BSD.5/rank-zero-rationality`.

Acceptance: Replacing torsion² by torsion changes the predicted 5-adic valuation by one; deleting torsion changes it by two.

Sources: [cremona-examples](https://johncremona.github.io/book/fulltext/examples.pdf), N=11 worked example, period and L-value. The optimal curve’s ratio must be transferred to the specific isogenous fixture.

#### Rank equality comparison example

Declaration: `RankZeroOneBSD:BSD.9/rank-equality-example` (application).

The actual fixtures have algebraic/analytic ranks 0,1,0 by applying BSD.4 to the certified analytic bounds.

Hypotheses: The exact certificates and source hypotheses listed by the prerequisite nodes.

Proof plan:

1. Apply the imported rank theorem to each actual curve.

Direct prerequisites: `RankZeroOneBSD:BSD.9/analytic-fixture-enclosures`, `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`.

Acceptance: The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9 distinct comparison endpoints. Rank, whole-Sha finiteness, one prime part and the full formula are separate outputs.

#### Whole Sha finiteness comparison example

Declaration: `RankZeroOneBSD:BSD.9/whole-sha-finiteness-example` (application).

The whole Sha groups of the three actual fixtures are finite, independently of any exact cardinality certificate.

Hypotheses: The exact certificates and source hypotheses listed by the prerequisite nodes.

Proof plan:

1. Apply BSD.4’s whole-Sha conclusion; no finite index or p-primary datum replaces it.

Direct prerequisites: `RankZeroOneBSD:BSD.9/analytic-fixture-enclosures`, `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`.

Acceptance: The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9 distinct comparison endpoints. Rank, whole-Sha finiteness, one prime part and the full formula are separate outputs.

#### Fixed prime BSD comparison example

Declaration: `RankZeroOneBSD:BSD.9/fixed-prime-example` (application).

For fixture11 at p=5, the KY theorem proves the actual prime part despite rational 5-torsion. A generic fixed-prime endpoint retains the named branch and its hypotheses, including every reduction/ramification exception.

Hypotheses: The exact certificates and source hypotheses listed by the prerequisite nodes.

Proof plan:

1. Use the range-tested KY instance; do not infer all primes from this one instance.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-11-good-five`, `RankZeroOneBSD:BSD.8/source-qualified-prime-part-dispatch`.

Acceptance: The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9 distinct comparison endpoints. Rank, whole-Sha finiteness, one prime part and the full formula are separate outputs.

#### Full BSD certificate comparison examples

Declaration: `RankZeroOneBSD:BSD.9/full-bsd-example` (application).

For each actual fixture, its proved complete prime certificate yields the full leading-term formula. Construct this certificate only after exact modular-symbol or Gross–Zagier/period/free-index comparison, finite arithmetic certificates and every exceptional valuation are available. This application is conditional on those concrete replayed inputs; it is not proved by rank equality or Sha finiteness alone.

Hypotheses: The exact certificates and source hypotheses listed by the prerequisite nodes.

Proof plan:

1. Compute the actual rational defect with exact analytic/arithmetic comparisons.
2. Use exceptional-prime-part-adapter at every prime in its canonical support and construct PrimeValuationCertificate.
3. Apply elliptic-endpoint.

Direct prerequisites: `RankZeroOneBSD:BSD.9/fixture-finite-arithmetic`, `RankZeroOneBSD:BSD.9/fixture-period-height-comparisons`, `RankZeroOneBSD:BSD.9/fixture-11-isogeny-period`, `RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter`, `RankZeroOneBSD:BSD.8/elliptic-endpoint`.

Acceptance: The full-formula application consumes a complete certificate; the preceding three applications do not supply it.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.9 distinct comparison endpoints. Rank, whole-Sha finiteness, one prime part and the full formula are separate outputs.

#### Missing exceptional prime regression

Declaration: `RankZeroOneBSD:BSD.9/missing-exception-fixture` (theorem).

In an actual fixture proof, deleting the dyadic or any other exceptional localZero entry invalidates the full-formula application unless a separate proof recovers it. The positive rational countermodels q=2 and q=1/4 have zero valuation at every odd prime and nonzero dyadic valuation; their certificate type is empty. Thus odd-prime results and whole-Sha finiteness alone cannot satisfy the final gate.

Proof plan:

1. Use dyadic-gate and the exact positive rational countermodels.
2. Check the full-bsd-example dependency still requires all support-covered entries, including the bad additive prime 2 for fixture32.

Direct prerequisites: `RankZeroOneBSD:BSD.9/dyadic-gate`, `RankZeroOneBSD:BSD.9/full-bsd-example`, `RankZeroOneBSD:BSD.9/fixture-32-cm-additive`.

Acceptance: Removing one undecided exceptional prime must fail the certificate construction.

Sources: [roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md), BSD.8–BSD.9 missing-prime acceptance. The finite support certificate has no exception-erasing constructor.

## Pinned library reuse

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each listed statement and its hypotheses were read at the pinned commit. The reviewed library audit supplies the stage boundary; it does not replace reading these declarations.

| Declaration | Existing content used |
|---|---|
| `mathlib:padicValRat` | Integer-valued rational valuation, defined as numerator valuation minus denominator valuation; its value at zero is zero. |
| `mathlib:padicValInt` | Natural-valued integer valuation, defined using the absolute value of the integer. |
| `mathlib:Rat.num_or_den_zero_padicVal` | For any rational q and prime p, the valuation of q.num or q.den is zero. |
| `mathlib:dvd_iff_padicValNat_ne_zero` | For a prime p and nonzero natural n, p divides n exactly when its natural valuation is nonzero. |
| `mathlib:padicValRat.zero` | For every natural p, the valuation of rational zero is zero. |
| `mathlib:padicValRat.one` | For every natural p, the valuation of rational one is zero. |
| `mathlib:padicValRat.neg` | Negation preserves the rational valuation. |
| `mathlib:padicValRat.of_nat` | Rational valuation of a natural cast equals its natural valuation. |
| `mathlib:padicValRat.self` | For 1 < p, the valuation at p of the rational p is one. |
| `mathlib:padicValNat.eq_zero_of_not_dvd` | Nondivisibility of a natural n by p implies valuation zero. |
| `mathlib:Nat.primeFactors` | The finite set of prime factors of a natural number; at zero it is empty. |
| `mathlib:Nat.mem_primeFactors` | Membership means primality, divisibility, and nonzero natural argument. |
| `mathlib:Nat.primeFactors_eq_empty` | The prime-factor set is empty exactly for zero and one. |
| `mathlib:Nat.Prime.dvd_iff_eq` | If p is prime and a is not one, a divides p exactly when p equals a. |
| `mathlib:Nat.forall_prime_iff_two_and_odd` | An assertion holds at every prime exactly when it holds at two and every odd prime. |
| `mathlib:padicValRat.mul` | Under Fact p.Prime and nonzero q,r, v_p(qr)=v_p(q)+v_p(r). |
| `mathlib:padicValRat.pow` | Under Fact p.Prime, v_p(q^k)=k*v_p(q), including the library zero convention. |
| `mathlib:padicValRat.div` | Under Fact p.Prime and nonzero q,r, v_p(q/r)=v_p(q)−v_p(r). |
| `mathlib:WeierstrassCurve` | Actual five-coefficient Weierstrass model over a type R. |
| `mathlib:WeierstrassCurve.Δ` | Integral polynomial discriminant of the actual coefficients. |
| `mathlib:WeierstrassCurve.IsElliptic` | Ellipticity is invertibility of the discriminant; over a field this is its nonvanishing. |
| `mathlib:WeierstrassCurve.Affine.Nonsingular` | The affine equation with at least one nonzero partial derivative. |
| `mathlib:WeierstrassCurve.Affine.Point` | Actual nonsingular affine points plus zero; the group law has an AddCommGroup instance. |
| `mathlib:orderOf` | Multiplicative minimal-period definition and its generated additive addOrderOf: least positive n with n•a=0, or zero for infinite additive order. The declaration index lists the source orderOf name. |
| `tauceti:WeierstrassCurve.Affine.regulator_eq_one_of_finrank_eq_zero` | With Field, AdmissibleAbsValues, DecidableEq, IsElliptic and Module.Finite ℤ PointModTorsion, finrank zero implies regulator=1. |

## Supplier contracts

Existing fine-node imports are listed with the consuming declarations. Where no sufficient fine node exists, these stage requests specify the missing statement. They do not ask the supplier to reproduce the Eisenstein BSD proof.

### `ArithmeticGaloisDuality:R02.1`

Continuous cohomology and Pontryagin duality with compact/discrete coefficients, involutions, inverse limits, finite cyclic restriction kernels and local H⁰ cardinalities. Preserve finite terms that characteristic ideals cannot see.

Consumers: `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`.

### `ArithmeticGaloisDuality:R02.4`

Poitou–Tate comparison for the stated ordinary-relaxed/strict and Greenberg Selmer structures, with two independent Coleman localizations, finite terms and exact characteristic-ideal orientation.

Consumers: `RankZeroOneBSD:BSD.7a/ky-local-character-corrections`, `RankZeroOneBSD:BSD.8/selmer-cardinality-adapter`.

### `ArithmeticGaloisRepresentations:R01.1`

Stable integral lattices and Ribet’s nonsplit residual-lattice lemma for an irreducible two-dimensional characteristic-zero representation; chosen quotient/subcharacters at p, H⁰ and finite p-power isogeny/lattice indices. Include the characteristic-zero irreducibility and scalar-image/open-image (Bogomolov/Ribet or Serre) inputs in KY Lemma 3.0.3 and CGS Theorem 4.3.1, with actual hypotheses and a finite bound C₁. Extend this direction as a Part II if its present exports do not suffice.

Consumers: `RankZeroOneBSD:BSD.7a/ky-ribet-lattice`, `RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound`, `RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound`.

### `AutomorphicCongruences:L0`

Kriz’s Eisenstein congruence for actual ordinary weight-two modular forms, integral p-depleted CM evaluations, residual characters and all Euler/period factors; include the trivial-character constant-term correction.

Consumers: `RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence`, `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`.

### `AutomorphicPadicLFunctions:L0`

Primitive/imprimitive p-adic interpolation and finite Euler factors for the actual modular, Rankin and CM characters, with the normalization and coefficient rings of CGS §§2.5 and 4.1.

Consumers: `RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison`.

### `AutomorphicPadicLFunctions:L3`

Actual Katz p-adic L-functions and integral CM periods/congruence ideals; precise interface to the proposed elliptic-unit IMC supplier for character characteristic ideals and μ=0. Katz construction/interpolation alone does not provide Rubin/Hida–Tilouine/Hida proofs. The absent owner is a separately recorded gap.

Consumers: `RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison`, `RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence`, `RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture`, `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`.

### `ComplexMultiplicationAndExplicitReciprocity:CM.1`

Characteristic-zero endomorphism classification for the actual elliptic curve y²=x³−x: an origin-preserving automorphism squaring to [−1] gives the full order ℤ[i], not only an abstract action. Import the existing CM curves/ideal-action carriers.

Consumers: `RankZeroOneBSD:BSD.9/fixture-32-cm-additive`.

### `ComputationalNumberTheory:CN.4`

Validated rational interval replay for π, positive square roots, exp and E₁(x)=∫_x^∞e^(−t)/t dt, including quadrature and tail errors, on the actual Mellin finite sums. Import existing rational interval product/reciprocal/rounding nodes and extend elementary-function evaluators as a Part II if needed.

Consumers: `RankZeroOneBSD:BSD.9/analytic-fixture-enclosures`.

### `EulerSystemsAndKolyvaginSystems:ES.2`

Actual KLZ motivic Beilinson–Flach norm-compatible classes and their cohomological realization for the modular/CM Rankin pair, with specialization lattice index ϖ^r, auxiliary c,m and ordinary local condition. Extend this Euler-system construction direction as a Part II if needed; BSD.7a specializes the actual classes, not classes defined as inverse images of predicted L-functions.

Consumers: `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`.

### `EulerSystemsAndKolyvaginSystems:ES.4`

Generic Beilinson–Flach/Kolyvagin descent and finite-level Selmer bounds, retaining the source H⁰/lattice/character hypotheses, the powers of p and uniform error constants. No Eisenstein BSD theorem is requested from this owner.

Consumers: `RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound`, `RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound`.

### `EulerSystemsAndKolyvaginSystems:ES.8`

Generic inverse-limit Kolyvagin systems and index-square characteristic divisibility with the augmentation prime included when uniform near-trivial bounds justify it; preserve the distinction between Λ, Λ[1/p] and Λ[1/p,1/(γ−1)].

Consumers: `RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound`, `RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound`.

### `HeegnerPointEulerSystems:HE.7`

Arithmetic Kolyvagin bounds with explicit whole-Sha annihilator/exponent and finite exceptional-prime data for a supplied actual Heegner curve/point. Finiteness alone supplies no computable exponent; import reviewed integral/dyadic arithmetic descent before extracting a numerical bound.

Consumers: `RankZeroOneBSD:BSD.8/sha-annihilator-adapter`.

### `IntegralIwasawaTheory:L4`

Ferrero–Washington Dirichlet μ=0 and Weierstrass/characteristic/Fitting comparison for finitely generated torsion Λ modules, including no-finite-submodule hypotheses. Cyclotomic elliptic μ=0 is not assumed.

Consumers: `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`.

### `KatoEulerSystems:L4`

Wüthrich (Doc.Math.19(2014)) Theorem 4, Proposition 8, Theorem 13, Theorem 16, Lemma 17 and Corollary 18: distinguished isogenous E_• and its étale lattice; integral Kato zeta element even when H¹(T)_0 is nonfree; integral char(X_ord) divisibility by the primitive Mazur–Swinnerton-Dyer p-adic L-function at odd good ordinary reducible p, and exact period/isogeny transfer. This extends the present ordinary-selmer-divisibility, which yields only a rationalized bound in its stated range.

Consumers: `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`.

### `ModularIwasawaMainConjectures:L0`

Actual cyclotomic/two-variable/anticyclotomic characteristic-ideal, primitive local-condition and p-adic-L normalization dictionary. L6 is a consumer of the independent Eisenstein equalities and is not a proof input.

Consumers: `RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison`, `RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison`, `RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture`, `RankZeroOneBSD:BSD.7a/bf-poitou-tate-divisibility-comparison`, `RankZeroOneBSD:BSD.7a/congruent-characteristic-series`, `RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality`, `RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype`, `RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect`, `RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs`.

### `ModularSymbolsPadicLFunctions:L3`

Integral Mazur–Swinnerton-Dyer modular-symbol p-adic L-function, exact primitive Euler/period interpolation, including the fixed p-power-period lattice and isogeny comparisons needed by Wüthrich and the cyclotomic control step.

Consumers: `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`, `RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype`, `RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect`.

### `NeronModelsAndSemistableAbelianVarieties:R11.4`

Actual component-group order and finite Tamagawa support; small-residue-characteristic Tate traces, minimal differentials, local isogeny kernels/cokernels and full real-component comparison.

Consumers: `RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter`.

### `PadicFamilies:L0`

Actual ordinary Hida/CM families and integral Eisenstein/CM evaluations used in Kriz’s congruence, with coefficient ideals and constant-term effects.

Consumers: `RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence`, `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`.

### `PadicFamilies:L1`

Integral CM congruence ideals and their Katz factorization with h_K and ordinary factors retained; the exact primitive Rankin/Greenberg specializations of CGS §2.5.

Consumers: `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`, `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`.

### `PadicHodgeRegulators:L3`

Both KLZ explicit reciprocity laws for the actual integral Beilinson–Flach class and the Perrin–Riou/Greenberg Coleman maps, with pseudo-null cokernel and CGS degree, congruence ideal and CM normalization factors.

Consumers: `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`, `RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs`.

### `SelmerIwasawaCohomology:L2`

Actual Bloch–Kato/ordinary/unramified cohomological local conditions, Kummer/torsion comparison, and finite H⁰/local logarithm control terms. Include nonsurjective global localization images rather than assuming local torsion vanishes.

Consumers: `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization`, `RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison`, `RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison`, `RankZeroOneBSD:BSD.7a/ky-local-character-corrections`, `RankZeroOneBSD:BSD.7a/bf-poitou-tate-divisibility-comparison`, `RankZeroOneBSD:BSD.7/ky-torsion-control`, `RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs`, `RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound`.

### `SelmerIwasawaCohomology:L3`

Iwasawa Selmer kernels and Pontryagin duals in the three towers, primitive/imprimitive exact sequences, cotorsion/no-finite-submodule and characteristic-ideal comparisons. Preserve the finite cyclic unramified/Greenberg restriction kernel and its finite-level control contributions.

Consumers: `RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization`, `RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison`, `RankZeroOneBSD:BSD.7a/ky-local-character-corrections`, `RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture`, `RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda`, `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`, `RankZeroOneBSD:BSD.7a/congruent-characteristic-series`, `RankZeroOneBSD:BSD.7a/twisted-control-augmentation-comparison`, `RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.7/cgls-torsion-free-control`, `RankZeroOneBSD:BSD.7/ky-torsion-control`, `RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype`, `RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect`, `RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`

Actual isogenies, duals, cyclic-kernel quotients and invariant differential pullbacks on the fixed models; no isogeny-degree-only substitute for local/global period indices.

Consumers: `RankZeroOneBSD:BSD.7a/ky-ribet-lattice`, `RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`, `RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter`, `RankZeroOneBSD:BSD.9/point-37`, `RankZeroOneBSD:BSD.9/point-37-order`, `RankZeroOneBSD:BSD.9/fixture-11-good-five`, `RankZeroOneBSD:BSD.9/fixture-11-isogeny-period`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`

Actual torsion subgroup and prime-to-good-reduction bounds, rational cyclic isogeny kernels, Tate modules and the integral-coordinate torsion criterion used to exclude torsion on fixture37.

Consumers: `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `RankZeroOneBSD:BSD.7a/ky-ribet-lattice`, `RankZeroOneBSD:BSD.9/point-11`, `RankZeroOneBSD:BSD.9/point-11-order`, `RankZeroOneBSD:BSD.9/point-37`, `RankZeroOneBSD:BSD.9/point-37-order`, `RankZeroOneBSD:BSD.9/point-32`, `RankZeroOneBSD:BSD.9/point-32-order`, `RankZeroOneBSD:BSD.9/fixture-32-cm-additive`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

Exact finite-field point counts, Hasse bounds, Frobenius traces and multiplicative/prime-power Fourier coefficient recurrence, including bad-prime branches.

Consumers: `RankZeroOneBSD:BSD.9/fixture-11-good-five`, `RankZeroOneBSD:BSD.9/fixture-32-cm-additive`, `RankZeroOneBSD:BSD.9/mellin-central-tail-bounds`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

Actual good ordinary/residual local classification, minimal Weierstrass models and Tate algorithm including p=2,3/additive cases, logarithm and Néron local factors.

Consumers: `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `RankZeroOneBSD:BSD.7/cgls-torsion-free-control`, `RankZeroOneBSD:BSD.7/ky-torsion-control`, `RankZeroOneBSD:BSD.8/local-tamagawa-certificate-adapter`, `RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`

Mordell–Weil finite generation, rank/descent comparison, explicit height-index bounds and complete finite saturation/search certificates for the actual rank-one free lattice.

Consumers: `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`, `RankZeroOneBSD:BSD.8/selmer-cardinality-adapter`, `RankZeroOneBSD:BSD.8/mordell-weil-saturation-adapter`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`

Actual finite m-Selmer groups and Kummer–Sha exact sequence, torsion quotient and complete descent presentations. Supply exact cardinalities, not a database analytic-Sha entry.

Consumers: `RankZeroOneBSD:BSD.8/selmer-cardinality-adapter`, `RankZeroOneBSD:BSD.8/sha-annihilator-adapter`, `RankZeroOneBSD:BSD.8/local-isogeny-certificate-adapter`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`

Actual newform L-function analytic continuation and functional equation, Mellin splitting at 1/√N and derivative formula; compare to BSD.0 actual-l-function, retaining the root-number sign.

Consumers: `RankZeroOneBSD:BSD.9/mellin-central-tail-bounds`.

## Ownership proposals

### split: RankZeroOneBSD, AutomorphicPadicLFunctions, HeegnerPointEulerSystems

RT-AREA-iwasawa-1/5: construction of Katz functions is not an owner of imaginary-quadratic elliptic units or their IMC proofs; align with HE.7s’s identical supplier proposal.

Create “Elliptic units and the Iwasawa main conjectures for imaginary quadratic fields”: EU.0 integral elliptic-unit distributions, norm/conductor relations; EU.1 their rank-one Euler system and unit/class-group modules; EU.2 Rubin 1991/1994 two-variable CM main conjecture with exact prime/coefficient hypotheses; EU.3 Hida–Tilouine 1994 Theorem 0.3 anticyclotomic specialization; EU.4 Hida 2010 anticyclotomic Katz μ=0. Import Katz from AP L3, generic Euler systems from ES.3/ES.8 and CM.1–CM.4 reciprocity. Export to BSD.7a and HE.7s’s Rubin/Iwasawa source alternative; keep the reviewed direct Nekovář HE.7 route without an artificial unit dependency. No new supplier id is asserted before that design exists.

### rescope: KatoEulerSystems, RankZeroOneBSD

Integral Eisenstein divisibility is stronger than the present rationalized ordinary-selmer-divisibility node.

Extend KatoEulerSystems L4, or Kato Euler systems, Part II if size requires it, with Wüthrich Theorem 4/Proposition 8 distinguished étale lattice, Theorem 13 integral zeta element including nonfree H¹(T)_0, Theorem 16 integral ordinary bound, Lemma 17 exact isogeny invariance and Corollary 18 integral MSD function. Import Ferrero–Washington from IntegralIwasawaTheory L4. Export the stated integral bound to independent BSD.7a; do not route its proof through MIMC L6 or HE.8b consumers.

### rescope: ComputationalNumberTheory, RankZeroOneBSD

CN.4’s interval arithmetic is the existing generic owner; actual exp/sqrt/π/E₁ evaluators are required for the central-value replay.

Extend ComputationalNumberTheory CN.4, or Certified computational number theory and arithmetic data, Part II if size requires it, with outward rational elementary-function and exponential-integral enclosures. BSD.9 owns the curve-specific Mellin tail bound and actual fixture replay; it imports generic validated numerics rather than defining another interval carrier.

## Source register and version control

These are the versions and passages actually read. The register distinguishes published PDFs, preprints and corrected author copies. The new elliptic-unit owner’s primary proofs have not been acquired; their precise verification obligations are recorded as a gap. Tables and source decimals are acceptance data, never proof certificates.

- **mathlib-padic**: Mathlib contributors, *p-adic Valuation*. Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. [Source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean). Accessed 2026-10-06. Read: padicValInt and padicValRat definitions; padicValRat zero/one/neg/of_nat/self; dvd_iff_padicValNat_ne_zero; Rat.num_or_den_zero_padicVal.

- **mathlib-prime-fin**: Mathlib contributors, *Prime numbers: finite sets of factors*. Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. [Source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/PrimeFin.lean). Accessed 2026-10-06. Read: primeFactors through primeFactors_eq_empty; lines 35-90.

- **mathlib-prime-basic**: Mathlib contributors, *Prime numbers*. Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. [Source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Prime/Basic.lean). Accessed 2026-10-06. Read: Nat.Prime.dvd_iff_eq; Nat.forall_prime_iff_two_and_odd.

- **roadmap**: Tau Ceti Atlas contributors, *Rank-zero and rank-one Birch-Swinnerton-Dyer theory*. Repository source blob 039d9b3c1977e929ae2076f76f3ec8ced8a7503a. [Source](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/RankZeroOneBSD/README.md). Accessed 2026-10-06. Read: Introduction and ownership boundary; BSD.5; BSD.7, BSD.7a, BSD.8, BSD.9; Source and review contracts.

- **cgs**: Francesc Castella, Giada Grossi, Christopher Skinner, *Mazur's main conjecture at Eisenstein primes*. arXiv:2303.04373v2, 15 October 2025; version actually read. [Source](https://arxiv.org/pdf/2303.04373v2). Accessed 2026-10-06. SHA-256 `5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90`. Read: Introduction Theorems A–D and §1.2 proof of D; §§2–4 definitions, congruences, control, Beilinson–Flach reciprocity and comparison; §6.1 uniform bound, §§6.2–6.4 Selmer structures and proof; §6.5 anticyclotomic equalities; §7.2 three-step integral cyclotomic descent.

- **ky**: Timo Keller, Mulun Yin, *On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction*. arXiv:2402.12781v2, 30 October 2024; preprint, not a verified published version. [Source](https://arxiv.org/pdf/2402.12781v2). Accessed 2026-10-06. SHA-256 `bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a`. Read: Introduction A–C; §§1.1–1.5 local and global character Selmer groups, residual extensions, λ corrections; §2.2 analytic congruence and trivial-character correction; §3.0 integral Kolyvagin bound, lattice comparison, IMC1/IMC2 and cyclotomic corollary; §4.2 elliptic BSD including torsion; Appendix B B.0.1–B.0.2 and final elliptic specialization.

- **cgls**: Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, *On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*. Inventiones mathematicae 227 (2022), 517–580; published author PDF. [Source](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf). Accessed 2026-10-06. SHA-256 `d1c1afe0e91cd43851918d6999481bbfa7a34ec8473a3817468f769a13783f38`. Read: §§1.2–1.5 character modules and algebraic comparison; §2.2 Kriz congruence and invariant equality; §§3.2–3.4 error-controlled bounds as used by CGS; §§4.1–4.2 anticyclotomic prototype and (Sel) dependence; §5.1 control and Greenberg–Vatsal; §5.3 rank-one formula, (5.7) and height/index normalization.

- **wuthrich**: Christian Wüthrich, *On the integrality of modular symbols and Kato’s Euler system for elliptic curves*. Documenta Mathematica 19 (2014), 381–402; DOI 10.4171/DM/450. [Source](https://ems.press/content/serial-article-files/26230?nt=1). Accessed 2026-10-06. SHA-256 `8fc88f778138f495b24de8a16b5520af76446df610b0d46ad93776eb43a27db5`. Read: Theorems 3,4 and Proposition 8 distinguished lattice; §3.2 including nonfree cohomology example 11a3; Theorem 13 integral zeta element; Theorem 16, Lemma 17, proof using Ferrero–Washington, Corollary 18.

- **gross**: Benedict H. Gross, *Kolyvagin’s work on modular elliptic curves*. L-functions and Arithmetic (Durham 1989), Cambridge University Press 1991, pp.235–256; scanned printed text. [Source](https://wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf). Accessed 2026-10-06. SHA-256 `60b310c58a3494860c5967a03569a7d30033e9074d9d3d9a0d5bc2dfedd46b32`. Read: Printed pp.235–239 inspected as images (scan has no extractable text); p.236 equation of X₀(37)/w₃₇ and P=(0,0); Theorem 1.3 and its exceptional power of 2; Conjecture 1.2 kept conjectural.

- **cremona2**: John E. Cremona, *Algorithms for Modular Elliptic Curves: chapter2*. Second edition (1997), corrected author online edition. [Source](https://johncremona.github.io/book/fulltext/chapter2.pdf). Accessed 2026-10-06. SHA-256 `432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94`. Read: §2.8 Mellin transform and sign conventions; §2.12 convergent central-value sum; §2.13 Proposition 2.13.1 and exponential integral.

- **cremona3**: John E. Cremona, *Algorithms for Modular Elliptic Curves: chapter3*. Second edition (1997), corrected author online edition. [Source](https://johncremona.github.io/book/fulltext/chapter3.pdf). Accessed 2026-10-06. SHA-256 `c4843b80ae1b6b91795b9952d782912542dd8d6b17c1940cd1a881fa6fdd9c26`. Read: §3.2 Tate algorithm and local invariants; §3.3 torsion and reduction injectivity; §3.5 saturation and canonical-height index; §3.6 rank/descent and 2-Selmer exact sequence.

- **cremona-examples**: John E. Cremona, *Algorithms for Modular Elliptic Curves: examples*. Second edition (1997), corrected author online edition. [Source](https://johncremona.github.io/book/fulltext/examples.pdf). Accessed 2026-10-06. SHA-256 `20a4118e6cd82e9d9adc59070fa039594f09888f26a1259e1ebe18426484878c`. Read: N=11 modular-symbol ratio for the optimal curve and its period lattice; N=37 newform and derivative; numerical output used only as target selection.

- **cremona-table1**: John E. Cremona, *Algorithms for Modular Elliptic Curves: Table 1*. Second edition (1997), corrected author online edition; rows are acceptance data, not proofs. [Source](https://johncremona.github.io/book/fulltext/table1.pdf). Accessed 2026-10-06. SHA-256 `022659f0962bf5bca2d3b53f509f5b5ae518fdb98d165a738ebaa65367b222ee`. Read: Printed pp.109–112: 11a3, 19a3, 26b2, 32a2, 37a1 models and invariants.

- **cremona-table4**: John E. Cremona, *Algorithms for Modular Elliptic Curves: Table 4*. Second edition (1997), corrected author online edition; numerical/analytic Sha entries are not proofs. [Source](https://johncremona.github.io/book/fulltext/table4.pdf). Accessed 2026-10-06. SHA-256 `7b575b5438e7eceab80b78ecbe70bc2322e361f9d5d1f09713b58f83d8081610`. Read: First table page: 11,19,26B,32,37A central values/derivative and exact modular-symbol ratios; E6 checks rank-zero 19A and 26B.

The Keller–Yin author copy at [the author’s page](https://web.math.ucsb.edu/~mulun/files/Eisenstein.pdf) was compared for the examples, Appendix B codomain and coefficient-ring discrepancy (SHA-256 `83028d184418fafcd7c70e09b958203fd3ba83d86d2e8ecc807ba4d8e358719f`). The CGLS author preprint was compared for the known §5.3 corrections (SHA-256 `2bd32832411151a628136b245eada847f2f1b2e04872391bbe630e8e1a54819b`). Neither comparison substitutes for a verified version of record.

### Source corrections

The following findings require independent review. Nodes use the corrected or explicitly qualified statements. Preprint findings are scoped to the checked versions and are not accusations about an unseen published article.

#### RankZeroOneBSD/E3 — misprint

Published author PDF, §5.3, p.577, equation (5.7).

Printed expression/claim: ord_p(L′(E,1)/(Reg(E/ℚ)Ω_E∏c_ℓ(E)))−ord_p(#Ш(E/ℚ)) = ord_p(L(E^K,1)/(Ω_E^K∏c_ℓ(E^K)))−ord_p(#Ш(E^K/ℚ)).

Correction: The displayed right-hand defect valuation is negated: δ_p(E)=−δ_p(E^K).

Reason: The K-factorization and the index-square/control comparison give δ_p(E)+δ_p(E^K)=0. The proof still concludes because the twist valuation is zero.

Reach: the proof. Existing correction: PAPER-CASTELLA-ETAL-22/E35; Keller–Yin arXiv v2 §4.2 explicitly corrects the sign.. Searched: The accepted CGLS paper extraction E35; CGLS published author PDF and author preprint; Keller–Yin v2 §4.2, p.43.

#### RankZeroOneBSD/E4 — error

Published author PDF, §5.3, p.577, height equality before (5.6).

Printed expression/claim: ĥ(P_K)=[E(K):ℤ·P_K]²·Reg(E/K).

Correction: Use the free quotient index I_free, or divide the square of the full index by #E(K)_tors²; separately retain the height’s K/ℚ convention factor.

Reason: The full index is I_free·#tors. The regulator is computed on the free lattice; a torsion summand cannot multiply a point’s height. The p-part final result in the torsion-free CGS/CGLS range survives.

Reach: the proof. Existing correction: PAPER-CASTELLA-ETAL-22/E36; Keller–Yin v2 §4.2, p.42 includes the torsion denominator.. Searched: The accepted CGLS paper extraction E36; CGLS published author PDF and preprint; Keller–Yin v2 §4.2 torsion correction.

#### RankZeroOneBSD/E5 — misprint

arXiv:2402.12781v2, Appendix B, p.56, Proposition B.0.1; also author copy inspected.

Printed expression/claim: δ_v=coker{H¹_FBK(K,T)→H¹_f(K,W)/H¹(K_v,T)_tors}.

Correction: The codomain is the integral local group H¹_f(K_v,T)/H¹_f(K_v,T)_tors, as in the next displayed exact sequence (B.1).

Reason: Localization of integral cohomology has local integral codomain. The printed global W group cannot be quotiented by the indicated local T subgroup; (B.1) gives the correctly typed intended object.

Reach: the proof. Existing correction: new. Searched: arXiv abstract/version list (v2 remains the accessible latest version); Author copy at web.math.ucsb.edu/~mulun/files/Eisenstein.pdf (same typo); Searches for 2402.12781 erratum/correction and Keller Yin Appendix B correction; no correction located.

#### RankZeroOneBSD/E6 — error

arXiv:2402.12781v2, §0.3, p.5, examples; also author copy inspected.

Printed expression/claim: 19a3 has torsion subgroup Z/3 and rank 1. ... 26b2 has torsion subgroup Z/7 and rank 1.

Correction: Both 19a3 and 26b2 have rank zero. Their rational torsion orders 3 and 7 are unchanged; use a separate certified rank-one fixture such as 37a1.

Reason: Cremona Table 1 lists r=0 for both actual models; their exact nonzero rank-zero modular-symbol ratios give analytic rank zero. The source’s general Theorem C is unaffected by the mistaken illustrative ranks.

Reach: a stated result. Existing correction: new. Searched: arXiv v2/current abstract/version list; Author PDF example paragraph, same ranks; Cremona corrected Table 1 and Table 4; LMFDB 19a3 rank; Searches Keller Yin 19a3 rank / 26b2 rank erratum; no correction located.

#### RankZeroOneBSD/E7 — misprint

arXiv:2402.12781v2, §1.2, proof of Theorem 1.2.2, pp.14–15.

Printed expression/claim: ker(χ)=K_cyc, the cyclotomic Z_p-extension of K, is linearly disjoint from K_cyc.

Correction: Use the disjointness of the anticyclotomic Z_p-extension K_∞ and K_cyc. Distinguish the fixed field of ker χ from K_cyc by the finite cyclotomic part; only openness of χ(G_K∞) is needed.

Reason: An infinite extension is not linearly disjoint from itself. The preceding and following argument only needs the cyclotomic character to have infinite/open image on the anticyclotomic tower so a finite-order twist cannot make it trivial.

Reach: the proof. Existing correction: new. Searched: arXiv v2 pp.14–15; Author copy corresponding paragraph; Searches for 2402.12781 erratum/correction; no correction located.

#### RankZeroOneBSD/E8 — gap

arXiv:2402.12781v2, Introduction Theorem B p.5 versus §3.0.8 (IMC1) p.40; same discrepancy in author copy.

Printed expression/claim: Theorem B: holds in Λ. Theorem 3.0.8 (IMC1): holds in Λ^ac.

Correction: Clarify the coefficient ring and verify the integral two-way index comparison if the stronger introductory Λ statement is intended. Retain the weaker rationalized statement until this verification; IMC2 remains integral in Λ^nr.

Reason: The two statements identified as the same theorem give different ring labels; Λ^ac is not defined in this v2 text, while CGLS uses it for Λ[1/p]. Inverting p removes a substantive height-one assertion. The integral Kolyvagin bound alone does not identify the actual class/lattice scalar in both directions.

Reach: a stated result. Existing correction: new. Searched: arXiv v2 Theorem B and full §3.0.8; CGLS definition of Λ^ac; KY author copy, same discrepancy; Searches 2402.12781 Lambda correction / Keller Yin erratum; no correction located.

## Coverage and remaining refinements

- **RankZeroOneBSD:BSD.7 — planned**: Refine actual defect/finite control interfaces and supplier rank-zero/twist comparisons; independently verify all integral period and torsion factors. Instantiate the good CGS and broader KY theorem branches without extending them to bad reduction.
- **RankZeroOneBSD:BSD.7a — planned**: Create the proposed elliptic-unit owner and verify the four primary source inputs under actual characters; implement requested Wüthrich/KLZ/early-Heegner/duality exports and exact integral lattice transfer. Review the source-specific residual, augmentation and μ/λ chains.
- **RankZeroOneBSD:BSD.8 — planned**: Refine exact descent, whole-Sha exponent, local/isogeny and saturation certificate producers; connect the actual BSD.5 defect API to the rational certificate core. A particular exceptional prime remains unresolved until its actual certificate is supplied.
- **RankZeroOneBSD:BSD.9 — planned**: Supply/replay all stated rigorous central-value enclosures and finite arithmetic, local, period, saturation and whole-Sha certificates for the three fixtures; expose actual endpoint signatures when their provider APIs exist.

### Explicit gaps

#### Imaginary-quadratic elliptic-unit main-conjecture owner

RT-AREA-iwasawa-1/5 is not solved by a Katz construction or by a request to a nonexistent stage. The proposed EU.0–EU.4 owner must acquire and verify integral elliptic-unit distributions/norm relations, Rubin 1991/1994, Hida–Tilouine Invent.117(1994) Theorem 0.3, and Hida Annals2010 anticyclotomic Katz μ=0. Check every coefficient, splitting, conductor and exceptional-character hypothesis in the character instances actually used by CGLS/CGS/KY. This packet does not claim to have read those four proofs.

Consumers: `RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison`, `RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence`, `RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants`, `RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture`, `RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda`, `RankZeroOneBSD:BSD.7a/ky-equal-iwasawa-invariants`.

#### Integral arithmetic lattice and reciprocity exports

The published Wüthrich inputs have been read and are precisely requested from KatoL4, but no suitable integral baseline interface exists. Early Heegner classes/KS local conditions, KLZ actual BF reciprocity, p-power isogeny transfer and Poitou–Tate supplier exports must be refined as the stated requests require. Weak rational/localized Heegner or Kato bounds cannot discharge these integral equalities.

Consumers: `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`, `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`, `RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality`.

#### Exact arithmetic fixture certificates

Replay finite Selmer presentations, proved whole-Sha annihilators including every exceptional primary component, local minimal/Tamagawa traces, isogeny/differential indices and the rank-one saturation search for 11a3/37a1/32a2. Target Sha order 1 is an acceptance value awaiting those proofs, not a theorem imported from analytic-Sha tables. Exact period/modular-symbol or Gross–Zagier comparisons must produce the actual rational defect before exceptional valuations are certified.

Consumers: `RankZeroOneBSD:BSD.8/sha-annihilator-adapter`, `RankZeroOneBSD:BSD.8/exceptional-prime-part-adapter`, `RankZeroOneBSD:BSD.9/fixture-finite-arithmetic`, `RankZeroOneBSD:BSD.9/fixture-11-isogeny-period`, `RankZeroOneBSD:BSD.9/full-bsd-example`.

#### Actual central-value interval replay

The source Mellin formulas and explicit infinite-tail bounds are planned. The finite rational interval replay for elementary functions and E₁, exact coefficient lists/root numbers, and proof of the three listed enclosures still require CN.4 exports and fixture certificates. No source decimal is a proof of a nonzero value or derivative.

Consumers: `RankZeroOneBSD:BSD.9/mellin-central-tail-bounds`, `RankZeroOneBSD:BSD.9/analytic-fixture-enclosures`.

#### Keller–Yin index-square coefficient ring

The verified v2 Introduction Theorem B states its equality in Λ, whereas §3.0.8 (IMC1) and (IMC1′) print Λ^ac without a matching definition in that version. The CGLS predecessor uses Λ^ac=Λ[1/p]. Verify an integral two-way Heegner/Greenberg index comparison with the actual transferred lattice and p^{t+N} factors before exporting the stronger integral index-square statement. The integral KY IMC2 and its BSD consumer are kept separately; the discrepancy does not weaken their printed statements.

Consumers: `RankZeroOneBSD:BSD.7a/ky-heegner-index-square-equality`, `RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison`.

#### Keller–Yin cyclotomic adaptation interfaces

KY Theorem 3.0.10’s short substitution proof must be expanded at the actual lattice/interface boundary: check CGS §3.4 H⁰/control and no-finite-submodule hypotheses, transfer both BF/Coleman images and finite-power congruences, and compare the chosen invariant-free and distinguished Wüthrich lattices integrally. Narrower CGS nodes have the local exclusion and do not suffice for 1/ω. The target theorem is sourced, but these exact adaptation exports require refinement; its prerequisite chains terminate here and in the stated supplier contracts.

Consumers: `RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs`, `RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture`.

#### Concrete arithmetic Lean interfaces

At the exact pinned baseline, the actual BSD.0 L-function/analytic rank, BSD.5 rational defect and periods/whole-Sha interfaces, Iwasawa Selmer modules, Coleman/BF classes and effective descent/interval certificates are not available together as Lean APIs. Their mathematical signatures remain definitive in this packet/reader. The suggested file omits them by name; it uses actual baseline curves/points and rational certificate interfaces, never arbitrary Prop-valued arithmetic stand-ins.

Consumers: `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `RankZeroOneBSD:BSD.7a/eisenstein-selmer-normalization`, `RankZeroOneBSD:BSD.7a/finite-euler-factor-comparison`, `RankZeroOneBSD:BSD.7a/cgls-residual-character-comparison`, `RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence`, `RankZeroOneBSD:BSD.7a/cgls-equal-iwasawa-invariants`, `RankZeroOneBSD:BSD.7a/uniform-near-trivial-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/augmentation-inclusive-heegner-divisibility`, `RankZeroOneBSD:BSD.7a/heegner-reciprocity-ideal-comparison`, `RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.7a/cgs-heegner-index-square-equality`, `RankZeroOneBSD:BSD.7a/ky-local-character-corrections`, `RankZeroOneBSD:BSD.7a/ky-ribet-lattice`, `RankZeroOneBSD:BSD.7a/ky-trivial-character-main-conjecture`, `RankZeroOneBSD:BSD.7a/ky-residual-extension-lambda`, `RankZeroOneBSD:BSD.7a/ky-equal-iwasawa-invariants`, `RankZeroOneBSD:BSD.7a/ky-integral-kolyvagin-bound`, `RankZeroOneBSD:BSD.7a/ky-anticyclotomic-greenberg-equality`, `RankZeroOneBSD:BSD.7a/ky-heegner-index-square-equality`, `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input`, `RankZeroOneBSD:BSD.7a/integral-two-variable-functions`, `RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity`, `RankZeroOneBSD:BSD.7a/bf-poitou-tate-divisibility-comparison`, `RankZeroOneBSD:BSD.7a/nontrivial-twist-rational-bf-bound`, `RankZeroOneBSD:BSD.7a/congruent-characteristic-series`, `RankZeroOneBSD:BSD.7a/twisted-control-augmentation-comparison`, `RankZeroOneBSD:BSD.7a/integral-twisted-cyclotomic-equality`, `RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.7a/cgls-prototype-main-conjecture`, `RankZeroOneBSD:BSD.7/cgls-torsion-free-control`, `RankZeroOneBSD:BSD.7/ky-torsion-control`, `RankZeroOneBSD:BSD.7/greenberg-vatsal-rank-zero-prototype`, `RankZeroOneBSD:BSD.7/cyclotomic-rank-zero-defect`, `RankZeroOneBSD:BSD.7/rank-one-twist-defect-comparison`, `RankZeroOneBSD:BSD.7/cgls-rank-one-prototype`, `RankZeroOneBSD:BSD.7/cgs-eisenstein-prime-bsd`, `RankZeroOneBSD:BSD.7/ky-eisenstein-prime-bsd`, `RankZeroOneBSD:BSD.7a/ky-cyclotomic-proof-inputs`, `RankZeroOneBSD:BSD.7a/ky-uniform-near-trivial-bound`, `RankZeroOneBSD:BSD.7a/bf-pr-reciprocity`, `RankZeroOneBSD:BSD.7a/bf-greenberg-reciprocity`, `RankZeroOneBSD:BSD.8/elliptic-endpoint`, `RankZeroOneBSD:BSD.9/full-bsd-example`.

### Atlas planets

| Stage | Planets |
|---|---|
| RankZeroOneBSD:BSD.7 | Anticyclotomic control with torsion; CGS Eisenstein prime-part BSD; Keller–Yin Eisenstein prime-part BSD |
| RankZeroOneBSD:BSD.7a | Uniform Kolyvagin bound; Eisenstein anticyclotomic main conjecture; Keller–Yin anticyclotomic main conjecture; Eisenstein cyclotomic main conjecture; Keller–Yin cyclotomic main conjecture |
| RankZeroOneBSD:BSD.8 | Prime support; All-prime reconstruction; Finite-support certificate; Certified finite descent; Full BSD from prime certificates |
| RankZeroOneBSD:BSD.9 | Rational torsion at an Eisenstein prime; CM curve with additive reduction; Certified rank zero and one examples |

The suggested file contains the rational core, torsion-square valuation and actual curve/point signatures against the pinned Mathlib. Its omission inventory names the arithmetic, Iwasawa and applied analytic signatures requiring provider APIs. The document and packet remain definitive. Elaboration checks interfaces with intentional proof placeholders; it does not implement any proof or validate the arithmetic fixture certificates.
