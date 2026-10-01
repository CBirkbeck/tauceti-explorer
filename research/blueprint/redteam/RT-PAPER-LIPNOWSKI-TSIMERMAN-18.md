# Red team: Lipnowski–Tsimerman (2018)

Complete audit report for issue #4198. Codex, `codex-rtOQ9t`, 1 October 2026.
Snapshot: `e508b927bce6919d8995e466a10c43d5f74149b8`. Five findings: **two high and three medium**.

This session did not write or review the target. The two deliverables report
findings for independent verification; they do not edit the accepted extraction.

## Sources and scope

Read the entire 38-page [LT v1](https://arxiv.org/pdf/1511.02212v1), SHA-256
`5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a`.
Read [Lee v3](https://arxiv.org/pdf/2002.04420), pp.1–9 through Theorem 3.4,
SHA-256 `2521898dfcd96c22950c026058b0b4e68e147aa89989964649eb317718fbbd3b`.
The latter URL served the 1 June 2020 version, confirmed on its first page and
in [arXiv’s history](https://arxiv.org/abs/2002.04420).
Images checked: LT pp.14,24,27,36; Lee pp.3,6,9.

The LT publisher PDF returned a security page and Lee’s publisher full text
was unavailable. Findings about source text apply to these preprints, not to
unread journal pages. The optional 45/4 theorem is **not disproved**: finding /2
disproves an estimate in the proof the extraction cites.

All 184 items, 13 routes, 17 prerequisites, 22 existing source corrections and
the accepted review were read. The current reader overview, routes, corrections
and gaps were compared with the JSON. Historical continuation appendices are
not claimed freshly rechecked in full. Supplier proofs are imports under §16;
their absence and blueprint-level API/test detail are not findings.

## Findings

### 1. high — error

**Where:** PAPER-LIPNOWSKI-TSIMERMAN-18/model-ring; /model-comparison-conjecture; source route to GeometryOfNumbersAndQuadraticArithmetic:GN.2.

The model-ring definition adds distinctness of the CM fields. Distinct simple isogeny factors can have isomorphic CM endomorphism fields, and their factors must remain separate in the product ring.

**Evidence.** LT arXiv:1511.02212v1, Definition 5.1, p.24, says "a collection of CM-fields"; Conjecture 5.2 distinguishes the simple abelian factors, not their endomorphism fields. Over F_5 the smooth curves E: y²=x³+x and E′: y²=x³+4x have respectively 4 and 8 points (direct enumeration including infinity), hence Frobenius polynomials X²−2X+5 and X²+2X+5. They are ordinary and not F_5-isogenous, while both Frobenius fields are Q(i). Their rational endomorphism algebra is Q(i)×Q(i). The two model factors cannot be merged into M_2(Q(i)), which is noncommutative and has a different center. Both curves have the F_5-defined order-four automorphism (x,y)↦(−x,2y), so their endomorphism orders are Z[i]. Thus the required integral model is Z[i]×Z[i].

**Fix.** Remove "distinct" from model-ring. Index the CM fields and ranks by simple isogeny factors, allowing repeated isomorphism classes of fields and preserving separate central idempotents. Propagate this convention to the model comparison and GN.2 route; use E×E′ over F_5 as a regression example. Do not merge factors merely because their fields are isomorphic.

### 2. high — error

**Where:** PAPER-LIPNOWSKI-TSIMERMAN-18/main-unpolarized-source note; sourceIssues E7 and E21; finite-field Part II route brief T2; corresponding current reader sections.

The extraction promotes Lee’s 45/4 bound as an optional corrected target without recording a false intermediate estimate in the version of Lee it read. Lee v3 equation (11) does not hold for repeated Frobenius roots. This is a proof-support finding, not a counterexample to the final 45/4 counting theorem.

**Evidence.** Lee, arXiv:2002.04420v3, p.3 defines d′ using unequal root values "counted with multiplicity". On p.6, Lemma 3.1 bounds a full Vandermonde product, but (11) claims |d′(A_0)|≤(2g)^(2g) p^binom(2g,2). Take E/F_2: y²+y=x³. Its points are infinity, (0,0), (0,1), and it is smooth, so its Frobenius polynomial is X²+2. For A_0=E^g the two roots ±i√2 each occur g times. The 2g² ordered unequal-root pairs give |d′(A_0)|=(2√2)^(2g²)=2^(3g²). At g=16 this is 2^768, whereas the asserted bound is 32^32·2^496=2^656. More generally log_2|d′|/g²=3, contradicting even the claimed 2+o(1) asymptotic. Lee p.8 Corollary 3.3 and p.9 Theorem 3.4 explicitly use (11). The full Vandermonde has zero factors when roots repeat; deleting those factors is not justified by its upper bound. The existing E19 concerns a different ordered-pair factor in LT and does not record this problem.

**Fix.** Add a sourceIssue scoped to Lee v3 §3.2 (11), with the E^16 counterexample and propagation to Corollary 3.3/Theorem 3.4’s displayed proof. Amend E7/E21 and the optional T2 enhancement to distinguish the source’s stated theorem from a verified proof route. Keep the independently corrected 2^(34g²)p^((69/4)g²(1+o(1))) route. Require a multiplicity-sensitive replacement or a separate repeated-factor argument before adopting 45/4 on this evidence. Do not mark Lee’s final theorem false or attribute the defect to unread published pages; compare the IMRN version when obtainable.

### 3. medium — error

**Where:** PAPER-LIPNOWSKI-TSIMERMAN-18/model-count-source; /model-concentration-source; routes to GeometryOfNumbersAndQuadraticArithmetic:GN.3 and ArithmeticStatistics:ST.5.

The corrected orbit estimate and concentration statement omit the p-Weil-field restriction that makes their constants uniform. They quantify over arbitrary model rings, although the model-ring definition imposes no relation between its CM fields and p.

**Evidence.** LT v1 p.27 §5.4.1 (40) bounds discriminants using a p-Weil generator; the printed K/L notation slips, but the required CM field is L=Q(w), w a p-Weil number. The extraction’s mass-asymptotic-source correctly retains "arising from a p-Weil number". Its model-count-source instead assumes only Σ[K_i:Q]n_i=g, then claims O_p(g²); its note explicitly says the error uses p-Weil discriminant bounds. Model-concentration-source further asserts one g_0 depending only on p for every such model ring. Arbitrary CM fields of a fixed degree have no discriminant bound in terms of p and degree, so that uniform inference is unavailable. For example, at p=2 the definition admits Q(√−163), which is not generated by a 2-Weil number: a quadratic 2-Weil generator would have integral trace t with |t|≤2√2 and discriminant t²−8, yielding only Q(√−1), Q(√−2) or Q(√−7).

**Fix.** Keep the general model-ring definition, but add explicitly to model-count-source and model-concentration-source that every L_i is generated by a p-Weil number, with the same fixed p. Alternatively state and use an explicit uniform discriminant hypothesis with its constant. Carry the restriction into GN.3/ST.5 applications and the design brief. This concerns theorem hypotheses, not a demand to reproduce Gan–Yu or other supplier proofs in an extraction.

### 4. medium — missing

**Where:** PAPER-LIPNOWSKI-TSIMERMAN-18/nonabelian-class-comparison; sourceIssues; current reader source-correction list.

The extraction corrects the quaternionic class-set comparison and its compact subgroup in an item note, but neither discrepancy is registered in sourceIssues as required by §18. The ordinary-to-narrow class-group change is mathematically substantive.

**Evidence.** LT v1 p.14 §3.2.2 defines U_0,d from GL_(4d)(Ẑ), then (21), d>1, has the ordinary Cl(O_(Q(√p))). The extraction replaces these by ∏_(v finite) GL_(2d)(O_(K_0,v)) and Cl⁺(K_0), explicitly calling its item a corrected supplier. At a finite K_0-place, D_0 splits as M_2(K_0,v); as a Q_ℓ-group this is restriction of scalars, not GL_(4d). Reduced norms of global invertible matrices over the totally definite quaternion algebra are positive at both real places. At p=3, K_0=Q(√3) has class number one by the quadratic Minkowski bound √12/2<2, but narrow class number two: a norm −1 unit would solve x²−3y²=−1, impossible modulo 3. Hence ordinary and narrow class groups cannot be interchanged in the asserted bijection. E1–E21 and E-MILNE68-NEWTON-ABSCISSA contain neither discrepancy; G5’s historical mention is not a sourceIssue.

**Fix.** Register two version-scoped source corrections, or one clearly split entry: correct the finite maximal compact and replace the d>1 ordinary class group by the narrow one. Retain the existing corrected item and separate d=1 class set. Explain that the bounded narrow/ordinary ratio does not change the coarse fixed-p exponential conclusion. Scope to LT v1 p.14 until the journal text is compared.

### 5. medium — error

**Where:** PAPER-LIPNOWSKI-TSIMERMAN-18/elliptic-pgroups-large note; sourceIssues E17 correction; current reader E17.

E17 correctly excludes p=2 but incorrectly says the printed proof is wrong for every p. The displayed proof works for every p≥5; the problem is its unqualified use of the Hasse intervals at small primes.

**Evidence.** LT v1 p.36 Lemma 5.19 writes #E(F_p)=p+1−a, #E(F_(p²))=p²+1−b and then assumes "a = 1 and b = 1" under the two p-group hypotheses. For p≥5, 1<p+1−2√p≤#E(F_p)≤p+1+2√p<p², so the only possible p-power is p. Also p<(p−1)²≤#E(F_(p²))≤(p+1)²<p³, forcing the p-power p². Thus a=b=1, and the correct identity b=a²−2p gives the printed contradiction p=(a²−b)/2=0. The extraction cites this same identity as a reason the argument is wrong for every p, although it validates the contradiction in that range. At p=3 the first interval admits 1, requiring separate treatment; the existing corrected odd-prime theorem and F_2 counterexample remain valid.

**Fix.** Replace the universal rejection of the proof with its precise p≥5 validity and small-prime gap. Preserve the existing all-odd-p repaired theorem, its separate argument for p=3 and the genuine p=2 counterexample. Synchronize the item note, E17 and current reader; leave attributed historical checkpoint reports clearly historical.

## Reproducible finite checks

The point counts include infinity. Smoothness for the two F_5 curves follows
from their nonzero short-Weierstrass discriminants. For y²+y=x³ over F_2,
the affine derivative with respect to y is 1, and its point at infinity is
smooth. The point counts then determine the degree-two Frobenius polynomials.

```python
for a, expected in [(1, 4), (4, 8)]:
    points = [(x, y) for x in range(5) for y in range(5)
              if (y*y - x*x*x - a*x) % 5 == 0]
    assert len(points) + 1 == expected
    print(a, points, 'trace', 5 - len(points))
points = [(x, y) for x in range(2) for y in range(2)
          if (y*y + y - x*x*x) % 2 == 0]
assert points == [(0, 0), (0, 1)]
g = 16
lhs_log2 = 3*g*g
rhs_log2 = 2*g*5 + g*(2*g-1)  # 32^(32) * 2^binom(32,2)
assert (lhs_log2, rhs_log2, lhs_log2-rhs_log2) == (768, 656, 112)
```

For finding /2, the general logarithmic ratio is
`3g² − [2g log₂(2g) + g(2g−1)] = g² + g − 2g log₂(2g)`.
Thus this is not merely a small-dimension failure removable by changing an
eventual threshold. The replacement can be a weaker multiplicity-aware bound;
the report does not invent a repaired 45/4 proof.

For finding /5, the Hasse interval argument is symbolic for every p≥5, not
an inference from a finite search. The p=2 counterexample already registered
by the extraction remains a genuine error in the unqualified source lemma.

## Library and ownership checks

The fresh atlas has 2907 stages and 8322 stage edges. Destination descriptions
read: A2/A4/A6, R07.2, GN.2/GN.3, AA.4, ST.0/ST.5, M6, AN.4, RG2.3.
Reviewed coverage was consulted for the abelian, GN.3, statistics, PEL,
analytic and adelic stages. The fields/model orbits remain GN.2/GN.3,
finite-field arithmetic remains the proposed abelian-schemes Part II, and
conditional statistics remain ST.5. No new duplication finding is asserted.

Actual pinned statements were spot-checked in:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:
  `NumberTheory/NumberField/CMField.lean` lines 60–178,
  `NumberTheory/NumberField/DedekindZeta.lean` lines 35–89,
  `GroupTheory/DoubleCoset.lean` lines 73–126.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:
  `NumberTheory/EffectiveBounds/ClassNumber/Basic.lean` lines 65–95.

These imports match their stated scope. A field carrier and its conjugation
do not impose pairwise distinctness on a product of fields. The existing
class-number formula and coarse bound do not supply a missing uniform
discriminant hypothesis. This was a spot check, not a fresh statement audit
of all 61 citations.

## Correction searches and limitations

On 1 October 2026, checked the arXiv version histories, the
[Lipnowski](https://sites.google.com/site/michaellipnowski/) and
[Tsimerman](https://www.math.toronto.edu/~jacobt/) pages,
[Lee’s research page](https://sites.google.com/view/jungin-lee/research),
and title/DOI searches for corrections. No correction of the specific Lee
(11) or LT (21) problems was located in that limited search. This is not a
priority claim. The version-of-record comparison remains outstanding.
Lee §4, Conrad and the other supplier proofs are not claimed independently
read in this audit. Existing corrections E1–E21 and the Milne entry are not
being resubmitted as new findings.

## Validation

The exact point-count and exponent checks above passed. No Lean file was
requested or compiled; no Lake build or language server was started.
`check_redteam.py` passed; `intake.py check-files` reported two files and zero
problems. The staged whitespace check passed before commit.
