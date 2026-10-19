# PAPER-NGODAC-21: extraction and routing

Tuan Ngo Dac, *On Zagier–Hoffman's conjectures in positive characteristic*,
Annals of Mathematics 194 (2021), 361–392,
[article page](https://annals.math.princeton.edu/2021/194-1/p06).
The mathematical locators below refer to the
[HAL manuscript hal-03298790v1](https://hal.science/hal-03298790/document),
using its printed page numbers, unless another source is named.

**Complete extraction; proof closure and implementation are not claimed.** The
[result](PAPER-NGODAC-21.result.json) contains **116 items: 7 library, 92 planned
and 17 missing refinements**, **305 internal dependency edges**, **five source
routes**, and **16 source issues, E1–E16**. Every missing item has exactly one
route. “Planned” means an identified target or explicit supporting argument in
a current accepted packet; its `plannedEvidence` gives the node and scope.
It does not mean that the target has been implemented or its proof gaps closed.

This revision implements the 17 confirmed findings of
[RT-PAPER-NGODAC-21](../redteam/RT-PAPER-NGODAC-21.result.json), following the
[verifier](../redteam/RT-PAPER-NGODAC-21.review.json). The
[fixes report](../redteam/RT-PAPER-NGODAC-21.fixes.md) gives each change and the
maintainer's remaining cross-file alignment. Finding /17 was rejected. Codex,
session codex-CkQxH4, performed this fix for
[issue #5687](https://github.com/CBirkbeck/tauceti-explorer/issues/5687) on
19 October 2026. The original extraction and independent review provenance
remain in the JSON; this fix is not a new independent review.

## Source and reading boundary

The manuscript was dated 29 March 2021 and deposited on HAL on 24 July 2021.
Historical workers read it completely and recorded SHA-256
`f6bf74f188aad7602293e47b2c963243a036649cb591a4dc7ca13556e90d971d`.
This fix obtained a fresh public HAL PDF, 27 pages including the cover, with
SHA-256 `3141c9337b19447ee970498d30fd10cdcdb6333bb54f8a264440adf3ec513096`.
The hashes differ; byte identity is not asserted. Fresh reading covered printed
pp. 3–9, 16–18 and 20–24, including the affected definitions, recursion,
independence argument and theorem ranges. The Annals landing page was checked;
the published full text was not obtained. Manuscript findings are not asserted
to persist in every published version.

Fresh external reading used [Papanikolas v2](https://arxiv.org/abs/math/0506078v2),
§2.2.5 p. 8, §§3.1–3.2 pp. 9–11, §§3.3.1–3.3.5 p. 12 and §§4.1.4–4.1.6
p. 22, and [Chang v4](https://arxiv.org/abs/1207.2326v4), Theorem 2.2.1 p. 5,
§3.1 pp. 6–7, Theorem 3.4.5 p. 9, Lemma 5.3.1 pp. 14–15 and Theorem 5.5.1
p. 18. Version hashes and access dates are in `sourceVersions`. These are
selected readings, not complete extractions of the external papers. Earlier
readings of ABP, CPY and Thakur, including the author's correction of the
shuffle proof, retain their historical provenance in `additionalSources`.
All source descriptions here and in `sourceIssues` use our own words.

## Mathematical scope and theorem dependence

Write q=p^e≥2, A=F_q[θ], K=F_q(θ), and distinguish t from θ. Normalize the
infinity norm by |θ|=q. Indices have positive integer entries, with empty-index
value 1. Coordinates are zero-padded for comparisons and coordinate addition;
zero is not an allowed entry. Multiple zeta sums use monic polynomials of
strictly decreasing degrees. A first entry of 1 is permitted.

At weight w, I^T_w has entries at most q and last entry below q, I^0_w has all
entries below q, and I′_w has no entry divisible by q. The last condition is
about q, not p: at q=4 an entry of 2 is allowed. These are index sets; their
cardinality is not a claim that evaluation is injective.

| Result and locator | Conclusion | Range |
| --- | --- | --- |
| Theorem A, p. 3; proof p. 16 | I^T_w spans Z_w over K | Every w>0 |
| Theorem B, p. 3; proof pp. 18–22 | I^0_w is K-linearly independent | Every w>0 |
| Corollary C, p. 4 | I^T_w=I^0_w gives a basis | 1≤w≤q |
| Theorem 6.2, pp. 22–24 | I′_w is K-linearly independent | q>2, 1≤w≤2q−2 |
| Theorem D, p. 4; conclusion p. 24 | I^T_w is a basis, dim_K Z_w=d(w) | Every q, 1≤w≤2q−2 |

Lemma 6.1, p. 22, supplies |I′_w|=|I^T_w|=d(w). Its block bijection replaces
mq+b, 1≤b<q, by m copies of q followed by b. Thus Theorem D uses **Theorem A,
Theorem 6.2 and Lemma 6.1**; for q=2 its range is already Corollary C.
Theorems A and B alone yield the basis only through weight q. For q=3,w=4,
I^0_w has five indices whereas I^T_w has six, including (3,1). The later
all-weight basis results in the shared Part II are not attributed to this
2021 paper.

The counting sequence has d(0)=1, d(w)=2^(w−1) for 1≤w<q,
d(q)=2^(q−1)−1 and d(w)=Σ_{i=1}^q d(w−i) for w>q. Theorem B also yields the
lower bound counted by compositions with parts in 1,…,q−1. Chang's linear
independence descent upgrades the relevant K-independent MZV families to
K̄-independent families; algebraic independence is not required here.

## Contracts that the source routes refine

Chen's equal-degree product has coefficients

Δ_i(a,b)=(-1)^(a−1) binom(i−1,a−1)+(-1)^(b−1) binom(i−1,b−1)

in F_p when 0<i<a+b and (q−1)|i, and zero otherwise (p. 6).
The extraction retains its direct proof outline: separate diagonal monic pairs,
reindex distinct pairs by their nonzero lower-degree difference, apply the
explicit two-variable partial-fraction identity, and sum finite-field units.
The existing `FiniteField.sum_pow_units` supplies the last step. At q=3,
Δ_2(2,2)=−2=1, so S_d(2)^2=S_d(4)+S_d(2,2).

The simultaneous fix/trunc/mix recursion is the specified recursion (2.2)–(2.4),
p. 6, with realization identities (2.5)–(2.7), pp. 7–8, for every integer
cutoff. It combines equal indices and removes coefficients that vanish in
F_p. Arbitrary choices of existential product expansions would not define
Todd's operations. The recursion's API exports these realizations, weight and
depth bounds, and prefix-dominance bounds. For example,
trunc((1),(1))=[(2)] at q=2, but [(2)]+2[(1,1)] at q=3. At q=3,
fix((2),(2))=[(4)]+[(2,2)]. Remark 2.2(1), p. 8, leaves a stronger general
uniqueness question open.

The dominance-calculus node now supplies the recursive products, BC support
and reduction-progress arguments. Proposition 3.2, pp. 15–16, uses the finite
fixed-weight composition space to terminate reduction. Propositions 2.12 and
2.13, pp. 12–14, require the separate j=0 repair recorded as E3. Todd's
relation-completeness assertion remains conjectural at this source's scope.
Corollary 2.7, p. 9, gives a sufficient condition for B's singleton expansion;
its converse fails in characteristic 2 when the head exponents coincide.

The binary-relation predicate is stated for all d∈Z (p. 8). At d=−1 it forces
the shifted coefficient β_(w) of the depth-one index to vanish, since
S_0(w)=1 and deeper sums vanish. The fundamental relation R₁ has shifted index
(1,q−1), so satisfies that boundary. We make no claim that restricting to d≥0
is strictly weaker for these positive-weight K-coefficient families: summing
those equations and applying Chang's Theorem 2.2.1 separates their MZV part
from the constant β_(w).

The Anderson–Thakur generating series exports **α_n,H_n∈A[t]**, together with
the θ/t interchange (§4.2 p. 17). Our H_n is Chang's H_{n−1}; Γ_n uses the
base-q digits of n−1. Chang's Theorem 5.5.1, p. 18, states the integral
polynomials, coefficient bound and interpolation, citing Anderson–Thakur 1990
(3.7.3)–(3.7.4) and 2009 (2.4.1). The source's (3.7.3) citation is retained
in `AT-bound`. At q=2, α_3=θ+t² and H_3=t+θ². G4 keeps the original
interpolation/generating-function proof-reading boundary explicit.

For the independence proof, proper prefixes and suffixes of I^0 and I′ remain
in their families (Remark 5.1 and Lemma 6.1(2), p. 22). The closure node now
supplies prefix elimination, the non-q-divisible tail argument and Theorem
6.2. I^T is not prefix-closed: (q,1) belongs but (q) does not. In the elimination
of maximal prefix weights, specialization along θ^(q^N), followed by q^N-th
roots, uses **K̄-linear independence of the lower-weight prefix MZVs** obtained
by induction and Chang's Theorem 3.4.5. The empty prefix has L(∅)=1.

For Ψ^(−1)=ΦΨ and X^(−1)=ΦX over Frac(T), Ψ⁻¹X is fixed. Therefore the
comparison needs **Frac(T)^σ=F_q(t)**, not only K̄(t)^σ=F_q(t).
Papanikolas Lemma 3.3.2, p. 12, and §4.1.6, p. 22, give the analytic constants
and fundamental-matrix argument. The fixed-field node now feeds both
trivialization uniqueness and the polynomial fixed-row corollary. Its exact
current supplier is DM.8/analytic-fixed-fields; an accepted target is not a
proved analytic instance.

## Period conventions and the lower-layer supplier

Choose ρ^(q−1)=−θ and U=∏_{i≥1}(1−θ^(1−q^i))^(−1)∈K∞^×. The numerical
Carlitz period is π_P=θρU in Papanikolas §3.3.4, p. 12. Put π_N=ρ^qU=−π_P.
The HAL manuscript p. 17 and Chang (3.1.3), p. 7, use π_N. For this same root,

Ω(t)=ρ^(−q)∏_{i≥1}(1−t/θ^(q^i)),
Ω(θ)=1/π_N=−1/π_P.

Rewriting a weight-w period denominator with π_P contributes (−1)^w.
The `AT-interpolation` and `L-theta` contracts specify π_N. Odd characteristic
and odd weight detect the sign; in characteristic 2 the conventions coincide.
Eulerian membership and homogeneous same-weight relations are invariant.
This is a normalization adapter, not a new source error.

DM.2 supplies the numerical root product independently of Ω's auxiliary
variable. Its valuation is −q/(q−1), and U has valuation zero. Thus for n>0,
π_N^n∈K∞ precisely when (q−1)|n: necessity follows from the integer valuation
of a K∞ element and gcd(q,q−1)=1; sufficiency follows from ρ^(q−1)=−θ.
This explicitly supplies `period-power` without an upward import from DM.8.
The analytic Ω target, including E membership, zeros and twist equation, has
DM.8 as the chosen owner. No dependency on `entire-from-equation` is added.

## Scalar descent and degree estimates

The Part II MZ.4 owns the §6 arithmetic input. For a q-power-stable subring
R⊆E, B,F∈R[t], B monic of positive t-degree m, and a polynomial solution
δ^(1)=Bδ+F in E[t], comparison of the t^(j+m) coefficient expresses δ_j
using F's coefficients and δ-coefficients with indices strictly above j.
Descending induction proves δ∈R[t]. This does not require R to be perfect.
The positive-degree hypothesis excludes the Artin–Schreier counterexample
B=F=1, R=F_2, δ∈F_4∖F_2.

For δ^(1)=(t−θ^q)^m(δ+G) in A[t], deg_θ G≤M, let N=deg_θ δ. If
N>max(M,qm/(q−1)), comparison gives qN=qm+N, a contradiction. Thus δ=0 or
N≤max(M,floor(qm/(q−1))). Applied to (6.3)–(6.4), p. 23, this yields
δ_1,δ_2∈A[t], deg_θ δ_2≤q and deg_θ δ_1≤floor(qw/(q−1)). Monic division by
(t−θ)^w stays in A[t]; viewing the quotient over F_q[t][θ] gives the precise
affine or quadratic forms used on p. 24. This repairs E11 without claiming to
have newly read Kuan–Lin's proof.

The sibling Im–Kim–Le /33 bound uses a character and a different forcing
polynomial; Chang–Chen–Mishiba /33–34 uses localized-rational and coupled-system
forms. They share MZ.4 ownership but their hypotheses and bounds must be
compared before specialization. Our stable-subring descent is already an
accepted MZ.4 target; our forcing-G degree bound remains a source refinement.

## Ownership and pinned-library evidence

The read-only current check used TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current base DM.0 and DM.8
packets and the existing six-stage Part II packet have accepted reviews. The
historical extraction's absent-Part-II and partial-DM.8 observations describe
older snapshots. Its old proposal becomes a source route; no second Part II
is requested. The reviewed DM.0–DM.8 library audit and sibling routes/reviews
were inspected. Upstream ArithmeticDirichletSeries and ConformalMapping README examples and
the OperatorTheory family overview were read, along with AdicSpaces' relevant
interface.

| Source route | Chosen owner and imported interface |
| --- | --- |
| 1 | DM.0: Carlitz denominator products |
| 2 | DM.2: C∞, numerical Carlitz period/root product and period-power criterion |
| 3 | DM.4: algebraic inverse coefficient twist and effective dual-motive convention |
| 4 | DM.8: analytic twist, specialized E, Ω, exact analytic constants, CPY denominator theorem and ABP lifting/proof estimates |
| 5 | Existing Part II MZ.0–MZ.5: indices, sums, recursive relations, tuple factorials, interpolation, scalar arithmetic and the separate theorem ranges |

The algebraic positive twist works over any characteristic-p field; inverse
iteration requires a perfect coefficient field. It fixes t. DM.4 therefore
needs no analytic DM.8 twist. DM.6 supplies neither tuple factorials nor small
power sums in these routes. Every route includes an `itemStages` assignment.
Transitive checks found no higher-layer or Part II supplier for the items
owned by DM.0, DM.2 or DM.4.

The pinned baseline remains Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Actual pinned statements underpin
the existing infinity-completion, restricted-series, skew-polynomial,
finite-field unit-sum and high-degree Riemann–Roch citations. This fix also
read the Gauss-norm and generic restricted-completeness declarations with
their surrounding assumptions:

- `PowerSeries.gaussNorm` and `gaussNorm_add_le_max`,
  `Polynomial.gaussNorm` and `gaussNorm_coe_powerSeries`, and
  `TauCeti.PowerSeries.hasGaussNorm_of_isRestricted` and
  `gaussNorm_mul_of_isRestricted` supply boundedness, the ultrametric inequality,
  polynomial compatibility and multiplicativity at radius one. Their normed,
  ultrametric and multiplicative-norm assumptions must be instantiated for C∞.
- `TauCeti.Huber.completeSpace_weightedRestrictedSubring_one_weight` supplies
  completeness over a complete commutative uniform nonarchimedean ring. The
  comparison of its one-variable uniformity with the Gauss-norm model and the
  C∞ instances remain obligations; generic completeness is already present.

General Tate algebra and topology interfaces are imported from upstream
AdicSpaces Layer 0 §§0.4–0.5. Current Tau Ceti additionally supplies
Weierstrass preparation, unit detection and the principal-ideal result in
`PowerSeries/Weierstrass/Preparation.lean` and `Ideal.lean`; the current DM.8
packet already imports them. Their complete ultrametric normed-base and
positive-radius assumptions were read. They are not re-planned here.
The specialized E condition includes both entire root decay and finite
coefficient-field degree. Generic norm/completeness results do not alone
supply E or ABP.

**Maintainer alignment:** Im–Kim–Le's `tate-algebra-E-and-a-of-t` specialized
E component, `omega-and-carlitz-period`, `cpy-common-denominator`, and the
[k],D_k component of `anderson-thakur-polynomials` should import DM.8, DM.8,
DM.8 and DM.0 respectively. Keep its numerical period at DM.2, and renaming,
factorials and small power sums in Part II. Its ordinary Tate theory already
has a separate upstream import. These are chosen common owners, not a claim
that the existing sibling route agrees. The accepted DM.2/omega node and all
its analytic consumers also need coordinated relocation to DM.8. Those files
are outside this issue's deliverables. The fixes report preserves the exact
mapping and review boundaries for that work.

## Remaining proof and source obligations

G3 concerns prime-power valuation/nonvanishing at Part II MZ.0. G4 concerns
Carlitz generating functions and Anderson–Thakur interpolation, shared by
MZ.0 and MZ.3. Their sourced statements can be planned while their original
proof-reading obligations remain recorded. G5 concerns the DM.2/DM.8 analytic
instances and upstream comparisons. G6 is DM.8's exact-constant-field
norm/divisor comparison for its existing Riemann–Roch input; G7 is DM.8's
constant-level ABP auxiliary estimates. Part II imports the ABP theorem and
does not reconstruct these proof internals. G8 records manuscript/journal
reconciliation and is not a mathematical proof leaf. No formalisation is
claimed for any of these suppliers.

## Source issues

All sixteen historical findings and their independent-review records are
retained. The JSON's `printed` fields now give paraphrases with locators.
The period-sign adapter above adds no source issue.

| ID | Version and locator | Recorded correction or repair |
| --- | --- | --- |
| E1 | HAL p. 9, before Proposition 2.5 | Sum R(j) over the cutoff variable |
| E2 | HAL p. 10, before Proposition 2.8 | Relation coefficients lie in K |
| E3 | HAL p. 12, Proposition 2.12 | Sum directly when j=0; B* requires a positive parameter |
| E4 | HAL p. 18, Theorem 4.2 | Require nonzero determinant coefficient c |
| E5 | HAL p. 18, start of §5 | Use Chang Theorem 3.4.5 for independence descent |
| E6 | HAL p. 26, reference [28] | Todd page range 264–287 |
| E7 | Chang v4 p. 15, Lemma 5.3.1 | Analytic-to-entire input is ABP Proposition 3.1.3 |
| E8 | Thakur 2010 p. 1980, reference [11] | Correct Relations bibliography to IMRN 2009, 2318–2346 |
| E9 | Thakur 2010 p. 1979, Theorem 3 proof | Use the author's known corrected simultaneous induction |
| E10 | CPY specified corrected PDF p. 6, Proposition 2.2.1 | Start with rational matrix entries before denominator descent |
| E11 | HAL p. 23, after (6.4) | Establish A[t] integrality before θ-coefficient comparison |
| E12 | HAL p. 22, Theorem 6.2 proof | Base range includes w=q |
| E13 | HAL p. 4, §1.3 | Bounds concern dim_K Z_w, not the defined count d(w) |
| E14 | HAL p. 7, Proposition 2.1 proof | Match the double-primed coefficient families |
| E15 | HAL p. 21, §5.2 | Orbit specialization uses (5.4) |
| E16 | HAL pp. 21–23, maximal-prefix arguments | Exclude singleton relations using nonvanishing first |

## Validation for this fix

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-NGODAC-21.result.json`
and `python3 research/blueprint/intake.py check-files` on the three deliverables
pass, as does `git diff --check`. Fresh structural checks cover all 116 items,
all 305 edges and the complete topological order, exact-once missing-item
routing, the five existing owner routes, and all 92 accepted packet-node
references. Each required supplier/consumer edge from the verifier was checked.

Fresh mathematical diagnostics used exact rational functions over F_2(θ) and
F_3(θ). Both input tuples ranged over weights 1–3, at cutoffs −1,0,1,2:
**1,176 exact fix/trunc/mix realization identities** and **294 formal support
checks** passed. Forty family enumerations (q=2,3,4,5; weights 1–10) verified
the counts and block bijection. The corrected Chen coefficient, q=2/q=3
recursion examples, d=−1 boundary, q=2 AT coefficient and period-sign parity
were checked separately. These finite diagnostics are not proofs. Older,
broader diagnostic records in the JSON are marked historical and were not
rerun for this fix. No Lean file is a deliverable; none was elaborated.
