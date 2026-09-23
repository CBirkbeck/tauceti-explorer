# Current independent-review disposition: revise

Codex, session `codex-7e92bd`, 23 September 2026; review issue [#1421](https://github.com/CBirkbeck/tauceti-explorer/issues/1421).

The extraction is **partial**, with **152 items: 38 library, 8 planned, 106 missing**. Every missing item is assigned once, but unresolved proof suppliers and unproved corrections prevent acceptance. Only route 6 (the two quantitative GN.5 primitive-basis adapters) is accepted; routes 1–5 require revision. See the [independent review](../reviews/REV-PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.md) and the separate route-verdict JSON.

The clear fixes are applied in the result JSON: reuse the implemented class-group two-rank/cardinality interface and primitive-vector engine; import existing polynomial-resolvent/order owners; withdraw the asserted hyperelliptic and fixed-q Sedunova corrections as established theorems; and restore explicit G0–G10 boundaries. The norm-curve, quadratic-tower, determinant-rounding and first Picard-bound replacements have been checked mathematically at the scope described in the review.

There are now **17 source findings: 16 confirmed, E8 rejected**. E8's weaker alternative theorem does not prove the source's stronger claim false. E9 disproves a Selmer bound, not a Mordell–Weil rank bound, and does not establish a correction for every hyperelliptic model. E10 was checked also in Sedunova's published article. E12 records the already-repaired squarefree norm-curve degree error; E13 records the unexcluded bad-reduction step; E14–E17 record literal slips in HV and Tsimerman supplier versions. All findings are limited to the versions actually read.

A later-dated MPG copy is text-identical to arXiv v1 apart from its date and does not resolve the final JAMS comparison. No assertion is made that the final paper is unavailable everywhere. All 106 named library references were read at the pins, with 54 file byte checks. No consumer Lean file was compiled and no new formalization is claimed.

## Historical extraction report (preserved)

The text below is preserved for provenance, including earlier reading and validation claims. Its heading that calls the extraction complete and its assertions that the hyperelliptic/fixed-q repairs hold are **superseded** by the current disposition above and the corrected result JSON.

# Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao (2020): bounds on 2-torsion in class groups, extraction and routing

Issue [#1420](https://github.com/CBirkbeck/tauceti-explorer/issues/1420). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoints, whose report follows below as history.
- **The paper.** M. Bhargava, A. Shankar, T. Taniguchi, F. Thorne, J. Tsimerman and Y. Zhao, *Bounds on 2-torsion in class groups of number fields and integral points on elliptic curves*, J. Amer. Math. Soc. 33 (2020), 1087–1099.
  - Taniguchi's author copy (18 February 2017) was re-fetched.
  - The JAMS text is not openly available, and arXiv has only v1.
- **Items.** The result has **152 items: 37 library, 8 planned and 107 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Eleven are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**The seven unrouted items are now routed, with corrected statements.**
- Index-two case of Theorem 1.1 (E8): through the Klüners–Wang h_2(F)² bound.
- Theorem 1.3(a) and (b) (E9): with Disc(C) in place of Disc(K).
- Theorem 7.1, second assertion (E11): recorded as a claim that is not established.
- Sedunova's bound (E10): with a q-dependent constant.
- The §5.4 del Pezzo count and Tsimerman's torus transfer, as cited inputs.

**New findings.**
- **E8 (gap, affects the proof).** §4 asserts h_2(K) ≪ h_2(F)·2^t "by genus theory" when [K:F] = 2. The proved relative bound squares h_2(F). By induction it still gives Theorem 1.1 with δ_n = 1/(2n), but not the claimed D_K^(1/4+ε).
- **E9 (error, affects a stated result).** Theorem 1.3 with |Disc(K)| is false.
  - The counterexample: for y² = x³ − N²x, K ≅ Q³ has Disc(K) = 1 and h_2(K) = 1, while the 2-Selmer ranks of the congruent-number curves are unbounded (Heath-Brown).
  - The correction: the ε-factor must be |Disc(C)|^ε. The Disc(C) form, which the remark after the theorem allows, holds.
- **E10 (error in the cited Sedunova, Theorem 1).** The printed ≪_{d,ε} is not uniform in q. For Y² = X and n = 2 there are q² points against the bound q^(3/2+3ε).
- **E11 (gap, affects a stated result).** Theorem 7.1's second assertion is proved in one sentence by analogy with §4 using Sedunova's bound. That input has an ε-loss and a q-dependent constant, so the printed ε-free bound depending only on n is not established.

**Reclassified to affect nothing.** E1–E4, the Bombieri–Pila and volume-formula slips.

**Gaps.**
- G2, G5 and G9 are recorded as findings.
- G0 is unavailable.
- The others are deferred as cited suppliers' proofs or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), Bombieri–Pila, The number of integral points on arcs and ovals, Oxford author preprint, Lemma 7 proof, printed p.14 (PDF index 13).. *Printed:* lambda = ell A^(-1/k)/N *Correction:* Use lambda = ell A^(1/k)/N, where ell is the interval length. Then Taylor gives lambda^k≤lambda^(k−1)+...+lambda+2.
- **E2** (misprint; affects nothing), Bombieri–Pila Oxford author preprint, Theorem 4 proof, printed p.17 (PDF index 16), just before the estimate for H+K.. *Printed:* Since p ≤ q *Correction:* Since q ≤ p.
- **E3** (gap; affects nothing), Bombieri–Pila Oxford author preprint, Theorem 4 proof, printed p.17 (PDF index 16), final choice of the monomial cutoff δ.. *Printed:* δ = 2 sqrt(log N/(d log log N)) *Correction:* Take the floor of the displayed real number and prove the threshold and error inequalities; supplement BP5 proves δ≥2d and 4 log N/δ+9dδ log δ≤11 sqrt(d log N log log N).
- **E4** (misprint; affects nothing), BSTTTZ, Taniguchi author copy dated 18 February 2017, proof of Theorem 2.1, printed p.4 (PDF index 3), product formula for the volume of B.. *Printed:* sqrt(pi) |Disc(K)|^(1/(2n)) |alpha|_v^(-1/m) *Correction:* For every complex place, square the whole displayed factor: its disc contributes pi R_v^2, not sqrt(pi) R_v. The body volume is 2^r pi^s sqrt(D_K)/N(I).
- **E5** (misprint; affects nothing), BSTTTZ, arXiv:1701.02458v1, §5.1, printed p.7, the sentence introducing the curves E_(±,A,B,C); the corresponding place in the February 2017 author copy was not checked. *Printed:* where |A| <= |Disc(K)|^(1/3), B <= |Disc(K)|^(2/3), and C <= |Disc(K)| *Correction:* |B| <= |Disc(K)|^(2/3) and |C| <= |Disc(K)|.
- **E6** (misprint; affects nothing), BSTTTZ, arXiv:1701.02458v1, §7, Remark 7.2, printed p.10, the displayed class number formula (checked on a page image); the corresponding place in the February 2017 author copy was not checked. *Printed:* |Pic^0(C)(k)| = |k|^g log|k| Res_(s=1) zeta_C(s) *Correction:* |Pic^0(C)(k)| = |k|^g (1 - |k|^(-1)) log|k| Res_(s=1) zeta_C(s).
- **E7** (misprint; affects nothing), BSTTTZ, arXiv:1701.02458v1, §7, Remark 7.3, printed p.10 (checked on a page image); the corresponding place in the February 2017 author copy was not checked. *Printed:* Pic^0(C)(k)[2] subset Pic^0(C)(kbar)[2] and the latter group has size 2^(2g), or 2^g if the characteristic is 2 *Correction:* ... or at most 2^g if the characteristic is 2.
- **E8** (gap; affects the proof), Author copy §4, first paragraph, p.6 (index-two case of the proof of Theorem 1.1). *Printed:* by genus theory, the 2-torsion in the class group of K is bounded by the 2-torsion in the class group of F multiplied by O(2^t) … we obtain a bound of O_ε(|Disc(K)|^{1/4+ε}) *Correction:* Use the relative bound that is proved, h_2(K) ≤ 4^{e−1} h_2(F)² (Klüners–Wang, arXiv:2003.12161, Theorem 2.1, with e counting ramified places including real ones). With Theorem 1.1 for F (or Gauss genus theory when F is quadratic) and D_F ≤ D_K^{1/2}, this gives h_2(K) ≪ D_K^{1/2−1/(2n)+ε} for n > 4 and D_K^ε when n = 4, so Theorem 1.1 is unaffected; the D_K^{1/4+ε} bound for this case is not established.
- **E9** (error; affects a stated result), Author copy Theorem 1.3 and the paragraph before it, pp.2–3; same statement in arXiv v1. *Printed:* |Sel_2(Jac(C))| = O_ε(|Disc(K)|^ε h_2(K)); (a) |Sel_2(Jac(C))| = O_ε(|Disc(K)|^{1/2−δ_n+ε}); (b) rank(Jac(C)) < c_ε + (1/2−δ_n+ε) log_2|Disc(K)| *Correction:* The ε-factor must be |Disc(C)|^ε: |Sel_2(Jac C)| ≪_{n,ε} |Disc(C)|^ε h_2(K) ≪ |Disc(C)|^ε |Disc(K)|^{1/2−δ_n+ε}. Theorem 1.3 holds in the Disc(C) form that the remark after Theorem 1.3 allows.
- **E10** (error; affects a stated result), Sedunova, On the Bombieri–Pila method over function fields, arXiv:1506.08757v1, Theorem 1, p.1 (cited by BSTTTZ for Theorem 7.1). *Printed:* |S| ≪_{d,ε} |I|^{1/d+ε}, where I is the set of X ∈ F_q[T] with deg X ≤ n and |I| = q^{n+1} *Correction:* Allow the implied constant to depend on q, or state the bound for fixed q.
- **E11** (gap; affects a stated result), Author copy Theorem 1.7 and Theorem 7.1, second assertion, with its one-sentence proof, pp.3 and 11–12. *Printed:* if C admits a degree n map to P¹ over k, then |Pic⁰(C)(k)[2]| ≪_n |k|^{(1−1/n)g} *Correction:* Treat the second assertion as not established. The cited input has an ε-loss and a q-dependent constant (E10), so the analogy with §4 can give at most an ε-lossy bound whose constant depends on |k|, and the function-field version of §4 is not written out.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G0** (unavailable). The JAMS text is not openly available; the author copy and arXiv v1 were read.
- **G1** (deferred). The lattice-minimum and free-quotient inputs are cited suppliers.
- **G2** (recorded). E8; the Klüners–Wang replacement is routed.
- **G3** (deferred). Brumer–Kramer and Helfgott–Venkatesh are cited suppliers.
- **G4** (deferred). Tsimerman's torus transfer is a cited supplier, now routed.
- **G5** (recorded). E9: Theorem 1.3 holds with Disc(C), not Disc(K).
- **G6** (deferred). §5.4 is a sketch resting on Helfgott–Venkatesh Corollary 3.9, a cited supplier; the item is routed.
- **G7** (deferred). The determinant-method application declarations are implementation work.
- **G8** (deferred). Baily, Cohn, Bhargava–Shnidman and Cohen–Morra are cited suppliers.
- **G9** (recorded). E10 (Sedunova's uniformity) and E11 (Theorem 7.1, second assertion).
- **G10** (deferred). Exact supplier matching is design work; every numbered statement is an item and every missing item is routed.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## Eleventh checkpoint: square minors, monomial derivatives and coordinate fibers

Codex — codex-c83e7a; issue #1420; 23 September 2026. **Partial checkpoint.**

This continuation supplies three genuinely remaining parts of G7: a complete reduction from rectangular full column rank to a nonzero square row minor; the scaled product/monomial derivative estimates, including the constant monomial; and nonzero coordinate specialization with its degree and finite-root bounds. These are proof plans on the existing carriers, not Lean implementations. The previous Taylor/interpolation adapters R1–R6 are consumed unchanged.

There are **152 items: 37 library, eight planned and 107 missing**. The same six routes take 100 missing items exactly once, leaving the same seven diagnostic claims withheld. Fourteen items are added: seven narrowly scoped library suppliers and seven missing application adapters. All 138 inherited IDs, statuses and statements are retained. Five old items acquire notes/dependencies; 31 old inline API/test blocks are converted to structured lists while retaining the original prose. All 34 definitions/constructions now have structured APIs and at least three tests. The seven sourceIssue objects, paper prerequisites and five unrelated route objects remain unchanged. The full prior report is retained below without alteration.

### Fresh reading and ownership

Freshly retrieved and read the complete February 18, 2017 [Taniguchi author copy](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf), all thirteen pages and references. SHA-256 is `bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec`, 291,000 bytes. It is still not a verified copy of the final 2020 revision. G0 survives; no new publisher-text acquisition is claimed.

Freshly retrieved [Bombieri–Pila's Oxford author preprint](https://people.maths.ox.ac.uk/pila/Ovals.pdf), SHA-256 `a46f75e55ddc055050f7924dbea2e5c5655aee32e5e15091eff74d3fc2bbe408`, 202,885 bytes, twenty-two pages. Read pp.1–6 and all §3 on pp.10–17. No fresh reading of pp.7–9 or §4, and no fresh visual page inspection, is claimed. The selected proof path is sufficient for the adapters below.

Read the existing completed EffectiveBounds roadmap, SF.5's current description and reviewed AUDIT01 entry, and relevant AUDIT03 EffectiveBounds entries. The completed arithmetic bounds are imports, not work to plan again. SF.5 retains proper intersection and Bézout. No independent accepted owner for the new application adapters was found in the parsed paper inventory. The already proposed `IntegralPointDeterminantMethods` receives them; no new matrix, polynomial, differentiation or interpolation carrier is introduced. Other inherited library classifications remain inherited, not freshly certified wholesale.

### M1. Select a square minor by expanding a retraction

Let A have rows indexed by a finite set S and columns by a finite type M of cardinality D, over a field K. Suppose rank(A)=D. Rank-nullity gives ker(A)=0. The exact pinned `LinearMap.exists_leftInverse_of_injective` produces a linear retraction, whose coordinate matrix B satisfies BA=I_D by `LinearMap.toMatrix'_comp`.

The i-th row of BA is the finite sum Σ_s B_(i,s) A_(s,−). Expand the determinant using its row multilinearity:

`1 = det(BA) = Σ_(ρ:M→S) (∏_i B_(i,ρ(i))) det(A_(ρ(i),j)).`

This is an immediate instance of `MultilinearMap.map_sum` and `map_smul_univ` for `Matrix.detRowAlternating`; it does not presume an unmatched rectangular Cauchy–Binet theorem. Some summand is nonzero. Its determinant is nonzero, and `Matrix.det_zero_of_row_eq` shows that ρ cannot repeat a row index. Thus ρ is injective and selects the required square minor.

When D=0, the unique map M→S is injective and the empty determinant is one. When S is empty and D>0, full column rank is impossible. Repeated point indices in the original evaluation matrix are allowed; a nonzero selected minor simply avoids equal rows. There is no assertion that the first D rows work. For example, rows (1,0),(0,0),(0,1) require selecting rows one and three.

This proves the exact step left open after the tenth checkpoint's rectangular kernel equivalence. The generic linear algebra stays with Mathlib; the application proof is `bp-full-rank-row-minor`.

### D1. Normalize Leibniz before estimating

Retain the established setting: N>0, nonempty compact I⊂[0,N], an open neighbourhood U of I, and C^k functions on U. Ordinary derivatives at the endpoints are justified by this neighbourhood hypothesis. For r≤k, divide the pinned binary Leibniz formula by r!:

`(fg)^(r)/r! = Σ_(i=0)^r (f^(i)/i!)(g^(r−i)/(r−i)!).`

The cancellation follows from `Nat.choose_mul_factorial_mul_factorial`, after casting into R; factorials are nonzero. If B_f=||f||_(N,k;I), each summand has absolute value at most B_f B_g N^(2−r). Multiplication by N^(r−1) and summation over r+1 terms gives

`N^(r−1)|(fg)^(r)|/r! ≤ N(k+1) B_f B_g.`

Taking the maximum over r and x gives the binary product bound. Induction on m≥1, using closure of C^k functions under products, yields

`||∏_(j=1)^m f_j||_(N,k;I) ≤ N^(m−1)(k+1)^(m−1) ∏_j||f_j||_(N,k;I).`

The base case m=1 is equality. No division by a norm occurs. For k=0 and constant functions the N power is necessary: both sides equal |∏c_j|/N. The empty product is deliberately separate.

### D2. The constant monomial has its own norm

The actual iterated derivatives of id are x, one, and then zero. Hence ||id||≤1 on I⊂[0,N], including k=0; equality holds when k≥1. Apply D1 to i copies of id and j copies of f, for i+j≥1:

`||x^i f^j|| ≤ ((k+1)N)^(i+j−1) H^j`, where H=||f||.

This allows i=0 or j=0. For i=j=0 the norm is exactly 1/N. Substituting zero factors into D1 would incorrectly give 1/((k+1)N). The proof must retain the constant separately even though the determinant endpoint below has the same stated constant as the source.

### D3. Recover the determinant constant without losing the constant column

Let M consist of D≥2 distinct monomials, with p=Σ(i+j), q=Σj, and let z∈{0,1} record whether the constant monomial occurs. Set k=D−1. By D2,

`∏_(i,j)∈M ||x^i f^j|| ≤ N^(p−D) D^(p−D+z) H^q.`

These are integer exponents; N and D are positive, so negative values cause no truncated-natural-subtraction mistake. The derivative determinant bound from checkpoint ten multiplies this by

`D! N^(D(3−D)/2) |V(x_1,...,x_D)|.`

Use the sharper elementary inequality D!≤D^(D−1), keeping the first factor 1 instead of bounding all D factors by D. Since z≤1,

`D! D^(p−D+z) ≤ D^p.`

Thus for abscissae in an interval of length L, the Vandermonde bound gives

`|det(x_r^i f(x_r)^j)| ≤ L^(D(D−1)/2) D^p H^q N^(p−D(D−1)/2).`

This proves the source's constant with or without the constant monomial. It is a derivation of the displayed inequality, not a claim that Proposition 1 covers the empty product.

For integral points the matrix is integral. M1 selects a nonzero square minor from a full-rank block, so its absolute determinant is at least one. The upper bound then forces D^p H^q>0. Taking the positive D(D−1)/2-th root gives exactly

`L ≥ (D^p H^q)^(−2/(D(D−1))) N^(1−2p/(D(D−1))).`

If H=0 and q>0, a column containing a positive Y exponent is identically zero, so full rank cannot occur. If q=0 use H^0=1. These checks justify the division and keep the zero-factor case from becoming an unstated hypothesis. Repeated abscissae have zero determinant and are handled before the distinct-node bound.

### S1. An irreducible nonlinear curve has no zero coordinate specialization

Let F∈K[X,Y] be irreducible of total degree d≥2 over a field K, and a∈K. Suppose F(a,Y) is identically zero. Use the existing `MvPolynomial.finSuccEquiv` and one-variable `uniqueAlgEquiv` to regard F as a polynomial in X over K[Y]. The ring-valued factor theorem `Polynomial.dvd_iff_isRoot` gives

`F=(X−a)G`.

The factor X−a is not a unit: evaluation at X=a would send an inverse identity to 0=1. Irreducibility therefore makes G a unit. The exact reduced-ring polynomial-unit theorem says G is a nonzero scalar. Consequently F has total degree at most one, a contradiction. Exchange the variables for F(X,a). Absolute irreducibility and characteristic zero are unnecessary for this algebraic step.

Both hypotheses matter. The degree-one polynomial X−a has a zero vertical specialization, as does the reducible degree-two polynomial (X−a)Y. The singular specialization Y² of the irreducible curve Y²−X at a=0 is nonzero and is allowed.

### S2–S3. Degree control before finite-root counting

Write F as the finite sum of its supported monomials c_(i,j)X^iY^j. The pinned `MvPolynomial.le_totalDegree` bounds i+j by d for every supported exponent. The Y^j coefficient of F(a,Y) is Σ_i c_(i,j)a^i; for j>d every term vanishes. The exact `Polynomial.natDegree_le_iff_coeff_eq_zero` therefore gives natDegree(F(a,Y))≤d. This remains true even if specialization is zero; cancellation can lower degree but cannot raise it.

Now use S1 to exclude zero specialization before applying the pinned root-count theorem. More than d distinct roots would imply the specialized polynomial is zero, a contradiction. Thus each finite set of zeros on any vertical or horizontal line has cardinality at most d. This supplies the critical-fiber and boundary-line counts in BP6, including repeated roots and singular points. It supplies neither a smooth root parametrization nor Bézout for two arbitrary curves.

### Exact library evidence and remaining work

The JSON's new `verification.declarationsRead` records the declarations and module/line ranges read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: linear retraction and coordinate composition; determinant alternating multilinearity and finite-sum/scalar expansion; iterated Leibniz and the identity derivatives; the factorial identity; the ring-valued factor theorem; reduced-ring polynomial units; actual polynomial coordinate equivalences; coefficient total-degree bounds; and the finite-root theorem. The missing composite adapters remain classified missing. The Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`; targeted searches in its matrix/linear-algebra files did not identify a competing application result. Absence of a matching name alone is not proof of global library absence.

G7 now retains proper Bézout in SF.5, smooth root continuation over open strips, inverse-graph construction, recursive supplier matching and independent verification. The earlier 8d³ finite integral-point cover still depends on those geometric interfaces. This continuation does not promote the source's abbreviated O(d²) whole-curve cover. G0 and G1–G6/G8–G10 remain distinct; no global extraction completion is claimed.

The publication guard refreshed 554 input blobs at `db84182bbf4c428cfeab9ed13767aeff7b4e4ae1`. The concurrent Shende–Tsimerman update was screened: its theta/cohomology/Hecke refinements introduce no competing determinant or coordinate-fiber owner. A second guard refresh screened the Anglès–Ngo Dac–Tavares Ribeiro22 regulator/Fitting-ideal refinements; no route or supplier used here changed. The three inherited deliverable blobs still match the claim snapshot.

### Validation

The standalone script below passes **9,520 exact assertions**. It checks finite rectangular matrices and their left-inverse determinant expansions, repeated-row cancellation, normalized truncated derivative products, the factorial constant, the explicit polynomial division identity under specialization, degree bounds and representative finite root counts. These are diagnostics supporting the written general arguments, not proofs of arbitrary smooth-function estimates or final-version identity.

Paper and three-file intake checks pass. Preservation checks cover all inherited IDs/statuses/statements, the unchanged seven source issues and seven withheld claims, the five untouched routes, and contiguity of the entire old report. Every newly missing item routes exactly once; all structured D/C API/test blocks and the selected dependency graph pass (740 structural assertions; 53 selected edges). No Lean was authored or compiled. Suggested design-job homes are `TauCeti/NumberTheory/IntegralPointBounds/MonomialDeterminant.lean` and `PlaneCurveFibers.lean`, importing the current generic carriers and the existing geometry owners.

```python
from fractions import Fraction as Q
from itertools import product,permutations,combinations
from math import factorial
from random import Random
import json
rng=Random(142023);counts={}
def check(k,b):
    assert b,k
    counts[k]=counts.get(k,0)+1
def det(a):
    n=len(a);s=Q(0)
    for p in permutations(range(n)):
        v=Q((-1)**sum(p[i]>p[j] for i in range(n) for j in range(i+1,n)))
        for i in range(n):v*=a[i][p[i]]
        s+=v
    return s
def rank(a,n):
    a=[list(map(Q,r)) for r in a];r=0
    for j in range(n):
        i=next((i for i in range(r,len(a)) if a[i][j]),None)
        if i is None:continue
        a[r],a[i]=a[i],a[r];v=a[r][j];a[r]=[x/v for x in a[r]]
        for i in range(len(a)):
            if i!=r:
                v=a[i][j];a[i]=[x-v*y for x,y in zip(a[i],a[r])]
        r+=1
    return r
def inverse(a):
    n=len(a);w=[[Q(x) for x in row]+[Q(i==j) for j in range(n)] for i,row in enumerate(a)]
    for j in range(n):
        i=next(i for i in range(j,n) if w[i][j]);w[i],w[j]=w[j],w[i];v=w[j][j];w[j]=[x/v for x in w[j]]
        for i in range(n):
            if i!=j:
                v=w[i][j];w[i]=[x-v*y for x,y in zip(w[i],w[j])]
    return [r[n:] for r in w]
for m in range(6):
 for n in range(4):
  for _ in range(15):
    a=[[rng.randrange(-2,3) for j in range(n)] for i in range(m)]
    minors=[(s,det([a[i] for i in s])) for s in combinations(range(m),n)]
    good=[s for s,d in minors if d]
    check('full_rank_minor',(rank(a,n)==n)==bool(good))
    if not good:continue
    s=good[0];inv=inverse([a[i] for i in s]);b=[[Q(0)]*m for _ in range(n)]
    for i in range(n):
     for j in range(n):b[i][s[j]]=inv[i][j]
    check('left_inverse',all(sum(b[i][h]*a[h][j] for h in range(m))==int(i==j) for i in range(n) for j in range(n)))
    total=Q(0)
    for rho in product(range(m),repeat=n):
        dd=det([a[i] for i in rho]);coef=Q(1)
        for i in range(n):coef*=b[i][rho[i]]
        total+=coef*dd
        if len(set(rho))<n:check('repeated_rows',dd==0)
    check('multilinear_expansion',total==1)
def mul(a,b,k):return [sum((a[j]*b[i-j] for j in range(i+1) if j<len(a) and i-j<len(b)),Q(0)) for i in range(k+1)]
for k in range(7):
 for m in range(1,6):
  for _ in range(40):
    N=Q(rng.randrange(1,9),rng.randrange(1,5));jets=[[Q(rng.randrange(-4,5),rng.randrange(1,5)) for r in range(k+1)] for j in range(m)]
    norms=[max(N**(r-1)*abs(a[r]) for r in range(k+1)) for a in jets]
    c=[Q(1)]+[Q(0)]*k;bound=N**(m-1)*(k+1)**(m-1)
    for a,B in zip(jets,norms):c=mul(c,a,k);bound*=B
    for r in range(k+1):check('normalized_product',N**(r-1)*abs(c[r])<=bound)
for D in range(1,31):
    check('factorial_constant',factorial(D)<=D**(D-1))
    for z in [0,1]:check('constant_column_absorption',Q(factorial(D),D**(D-z))<=1)
# Multivariate polynomials represented by exponent->rational coefficient solely for diagnostics.
def clean(f):return {a:c for a,c in f.items() if c}
def add(f,g):
    h=f.copy()
    for a,c in g.items():h[a]=h.get(a,Q(0))+c
    return clean(h)
def pmul(f,g):
    h={}
    for (i,j),a in f.items():
     for (k,l),b in g.items():h[i+k,j+l]=h.get((i+k,j+l),Q(0))+a*b
    return clean(h)
def spec(f,a):
    h={}
    for (i,j),c in f.items():h[0,j]=h.get((0,j),Q(0))+c*a**i
    return clean(h)
for d in range(1,7):
 for _ in range(50):
    f=clean({(i,j):Q(rng.randrange(-3,4)) for i in range(d+1) for j in range(d+1-i)})
    a=Q(rng.randrange(-3,4),rng.randrange(1,4));g={}
    for (i,j),c in f.items():
     for t in range(i):g[i-1-t,j]=g.get((i-1-t,j),Q(0))+c*a**t
    s=spec(f,a)
    check('factor_theorem',add(pmul({(1,0):Q(1),(0,0):-a},g),s)==f)
    check('specialization_degree',all(j<=d for i,j in s))
    sw={(j,i):c for (i,j),c in f.items()};ss=spec(sw,a)
    check('horizontal_degree',all(j<=d for i,j in ss))
for a in range(-8,9):
    check('vertical_counterexample',spec({(1,1):Q(1),(0,1):Q(-a)},Q(a))=={})
    for f in [{(0,2):Q(1),(1,0):Q(-1)},{(2,0):Q(1),(0,2):Q(1),(0,0):Q(1)}]:
        s=spec(f,Q(a));check('irreducible_examples',bool(s))
        roots=[y for y in range(-10,11) if sum(c*Q(y)**j for (i,j),c in s.items())==0]
        check('fiber_roots',len(roots)<=max(j for i,j in s))
print(json.dumps({'total':sum(counts.values()),'counts':counts},sort_keys=True))
```

---

## Historical report retained contiguously

> Current status (23 September 2026): partial tenth checkpoint, 138 items.
> See the final report section for the rectangular-kernel, repeated-Rolle and
> Taylor adapters. Earlier checkpoint counts and remaining-work notices are historical.

> Seventh-checkpoint integration (Codex, codex-a71f92, 2026-09-22).
> The current partial result has 129 items: 27 library, 8 planned, 94 missing.
> BP1–BP6 and the four proposed source issues from #1817 are now integrated;
> five exact Mathlib suppliers and their adapter boundaries are added below.
> Historical item counts and “not yet integrated” notices remain attributed
> to their checkpoints and are superseded by this notice and the final section.

## BSTTTZ: torsion feedback, determinant methods and finite-field sections

> **Fourth-checkpoint notice — 22 September 2026.** ChatGPT Pro, session
> `cgp-0922-6e8b41`, adds the final section “Fourth checkpoint: primitive bases
> and quadratic towers”. It supplies direct replacement arguments for G1 and
> the main-theorem use of G2, together with nine proposed extraction entries.
> **Status remains partial.** The 110-item result JSON is deliberately unchanged;
> synchronization of these new entries, routes and gap descriptions remains in
> the handoff. The third-checkpoint report below is preserved as historical
> work, including its source-reading and validation claims, which belong to
> that earlier worker. No fresh byte hashes, full rereading of all its sources,
> repository-checker success, Lean elaboration or independent review are claimed
> by the fourth checkpoint. Its new proofs require independent checking.

### Third-checkpoint report (preserved)

**Partial third checkpoint; not ready for acceptance.** Issue #1420. Codex,
session `codex-c83e7a`, 21 September 2026. Continues Codex's PR #1636 and
GPT-6 Astra Pro's PR #1641. All **35 inherited item IDs remain**. The expanded
inventory contains **110 items: 22 library, 7 planned and 81 missing**.
Five proposed routes cover **73 missing items and one planned item**; eight
unresolved claims have explicit gaps instead of executable routes. All 31
definitions/constructions have an API outline and at least three discriminating
acceptance tests. No Lean implementation or independent review is claimed.

This continuation adds the selected original Bombieri–Pila proof chain, cubic
feedback and elliptic consequences, quartic resolvents and counting targets,
and the finite-field section-count proof. It replaces several previously
unexamined prerequisites with actual pinned library imports. Original source
closure and the final published-version comparison remain incomplete.

### Source identity and reading boundary

The target is Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao,
*Bounds on 2-torsion in class groups of number fields and integral points on
elliptic curves*, JAMS 33 (2020), 1087–1099,
[DOI 10.1090/jams/945](https://doi.org/10.1090/jams/945).
The mathematical source used here is Taniguchi's author copy dated
18 February 2017. Every page, including references, was read afresh; its
pages 5, 6, 8, 11 and 12 were visually inspected after local rendering.
Locators below are **author-copy page numbers**.

Freshly measured bytes, all acquired on 21 September 2026:

| Source | PDF pages | SHA-256 |
| --- | ---: | --- |
| [taniguchi](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf) | 13 | `bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec` |
| [arxiv](https://arxiv.org/pdf/1701.02458) | 12 | `99ee35275ecb42c52cd8bbc615538dbe6094326fb72894e88ef82c0b89286871` |
| [bombieri-pila](https://people.maths.ox.ac.uk/pila/Ovals.pdf) | 22 | `a46f75e55ddc055050f7924dbea2e5c5655aee32e5e15091eff74d3fc2bbe408` |
| [helfgott-venkatesh](https://arxiv.org/pdf/math/0405180) | 23 | `bfb29584474ac4a580da9a1fa1b0279faa283f301c0481f43a0919cbaa102255` |
| [tsimerman](https://arxiv.org/pdf/1103.5619v3) | 32 | `4cd8527c28b94f98df53738c9805a8ff5c84a94d3754c873b804d33dbdea7aed` |
| [sedunova](https://arxiv.org/pdf/1506.08757v1) | 8 | `7b7117e414c126f41cb3b5fe22044034652e0b97d2e12660b0afdc7b5228b3f0` |

The arXiv v1 hash was remeasured, but its full reading is inherited from #1636.
The February copy includes §5.4, absent from arXiv v1. The earlier MPG
preprint hash `04e4e52e2e7d2902cfe6ef7c37793650b5a7c3128554cdc3a7a577fb176deb9d`
is retained as an inherited measurement, not a newly downloaded version.
Fresh [MPG item metadata](https://pure.mpg.de/rest/items/item_3277755)
identifies file_3277756 as a public preprint and file_3277757 as the restricted
publisher version. Thus the public deposit's 2020 recompilation date does not
make it the final article. Public AMS and author-page retrieval still did not
produce the revised publisher text. Bibliographic identity is not a
mathematical version comparison; **G0 remains**.

Additional reading was bounded and is not represented as a complete reading
of every prerequisite paper:

- Bombieri–Pila: §2 pp.1–6, giving determinant/interpolation foundations, and
  the complete §3 pp.10–17 leading to Theorem 5. Later analytic-curve material
  of §2 and smooth-curve §4 are not claimed fully read.
- Helfgott–Venkatesh: Theorem 3.8 and proof, Definition 1, Corollaries 3.9 and
  3.11, Proposition 3.10 and adjacent remarks. Earlier repulsion, sphere-packing
  and positive-height proof interiors remain to audit.
- Tsimerman v3: the negligible-factor definition and Theorem 4.7; §5 Theorem
  5.1 through Corollary 5.7 with their proofs; §6's quartic/cubic module argument.
  The preceding analytic/class-formation closure remains open.
- Sedunova v1: the entire eight-page source, especially Theorem 1 and its
  determinant proof. The arXiv stamp is June 2015, while the downloaded body
  says August 2018. This is recorded rather than silently treated as a later
  arXiv revision.

### Baseline and ownership corrections

Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. This continuation reread the
actual statements for all ten inherited Mathlib library items: class groups,
class number, infinite places, discriminant, mixed embedding, covolumes,
both Minkowski forms and the small-norm ideal-class representative.
The covolume formula takes an invertible fractional ideal; the compact
Minkowski theorem needs a discrete lattice and a nontrivial real vector space.
Complex places use ordinary modulus with multiplicity two in the norm product.

New exact imports, with their source files at the pins:

| Imported interface | Actual declaration and scope |
| --- | --- |
| Norm tower | `Algebra.norm_norm`, `Algebra.norm_eq_norm_adjoin`, Mathlib `RingTheory/Norm/Transitivity.lean`; finite/free scalar-tower machinery, not a newly defined norm |
| Projective cardinality | `Projectivization.card_of_finrank`, `Projectivization.card''`, Mathlib `LinearAlgebra/Projectivization/Cardinality.lean`; quotient by every nonzero scalar |
| Explicit 2-descent | `WeierstrassCurve.Affine.selmerGroup₂`, `mem_selmerGroup₂_iff`, `range_μ_le_selmerGroup₂`, Tau Ceti `AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean` |
| Rank inequality | `WeierstrassCurve.Affine.pow_rank_le_card_of_range_μ_le`, same file; requires a finite subgroup containing the descent image |
| Mordell–Weil | `WeierstrassCurve.Affine.fg_point_of_numberField`, `MordellWeil/FinitelyGenerated.lean` |
| Canonical height | `WeierstrassCurve.Affine.Point.canonicalHeight`, its convergence and bounded-difference theorem, `AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` |
| Function-field divisors | `TauCeti.Divisor`, `TauCeti.Divisor.degree`, `TauCeti.Divisor.principal`, under `FieldTheory/FunctionField/Divisor/` |
| Degree-zero classes | `TauCeti.Divisor.degreeClass`, `degreeClass_divisorClass`, `divisorClass_eq_zero_iff`; use the existing quotient and degree kernel |
| Finite class group | `TauCeti.Divisor.finite_ker_degreeClass`, `RiemannRoch/ClassNumber.lean`; no exact-constants hypothesis for this finiteness theorem |
| Sections and effective representatives | `TauCeti.riemannRochSpace`, `TauCeti.Divisor.dim`, `degree_add_one_sub_genus_le_dim`, `exists_isEffective_linearlyEquivalent_add_nsmul` |
| High-degree RR | `TauCeti.Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree`, `Consequences/HighDegree.lean`; exact constants, integer inequality `deg D≥2g−1` |

Reviewed audit entries read: AUDIT-01 (AlgebraicCurves Layers 3–5 and
JacobianChallenge E), AUDIT-02 (GN), AUDIT-03 (completed EffectiveBounds),
AUDIT-11 (EllipticCurves Layers 6–7), AUDIT-20 (FA.1). They distinguish
implemented divisor RR from the missing scheme Picard comparison, and the
built explicit Selmer carrier from still-missing general cohomological Selmer
machinery. The rank-cardinality lemma does **not** establish finiteness of
the Selmer subgroup by itself.

Full owner documents read: GN, completed EffectiveBounds, ED, RP, ST, FA
and JacobianChallenge. Complete relevant sections read: upstream
AlgebraicCurves Layer 5 and EllipticCurves Layers 6–7. The 211 atlas records,
new-roadmap catalogue, reserved IDs and available packet were screened.
The earlier full LD reading is retained from #1641; LD.6 excludes the algebraic
part and does not supply this Bombieri–Pila theorem. Remaining proof-interior
supplier checks for HV and arithmetic tori are explicitly G3/G4.

The [Couveignes result](PAPER-COUVEIGNES-20.result.json) already proposes
`EffectiveBoundsCompactModels`, with the same completed parent. Its route was
read in full: it concerns short multi-equation field models and degree-sensitive
field counts. Share measure/reduction imports and any compatible short-integer
lemma; do not treat an unreviewed proposal as an installed supplier. Its target
is different from the present torsion power saving. Neither candidate may own
a duplicate general reduced-basis theory.

### Lattice boundary retained from the previous checkpoint

For the §2 weighted body, each complex disc contributes `pi R_v²`; hence
the volume is `2^r pi^s sqrt(D_K)/N(I)`. It is at least
`2^n covol(I^(-1))`. Equality in the all-real case requires the compact,
non-strict Minkowski theorem. The proof uses only `c^m=1`, so it includes
the identity class and every class whose order divides m.

The literal reduced-basis item remains **unrouted G1**: the source compares
through index n−2 and uses the last index n−1 in its proof. Original Siegel
verification must include extending primitive 1, the metric and product
constants, and n=2. The general reduction supplier stays GN.1/GN.3.
Likewise, the printed relative-genus bound with only one base factor h₂(F)
remains **unrouted G2**, requiring capitulation, ambiguous-class and unit
terms. The restricted proof below consumes these recorded lattice inputs;
it does not settle either gap.

### Preserved no-index-two proof: no subfield of index two

Here `K` has degree `n ≥ 3`, `D=|Disc(K)| ≥ 1`, and `R=D^(1/n)`. Define

```text
B_K(T) = {β ∈ O_K : |β|_v ≤ T at every infinite place v}.
```

All implicit constants depend only on the displayed degree, scale or epsilon,
not on the field. The following preserves the detailed proof expansion from PR #1641. Statements described as repairs or expansions are not attributed to
the source as verbatim named lemmas.

#### 3.1 All 2-torsion classes, including the identity

The proof of Theorem 2.1 uses only that the chosen class is killed by `m`:
it starts with `I^m=(α)` and then takes `J=κI`, `β=ακ^m`. It therefore gives
the same balanced generator when the exact order divides `m`. In particular
for every `c ∈ Cl(K)[2]`, choose `J_c` and a nonzero `β_c ∈ B_K(R)` with
`J_c²=(β_c)`.

If `β_c=β_d`, then `J_c²=J_d²`. Unique factorization of nonzero integral
ideals gives `J_c=J_d`, hence `c=d`. Thus this choice is an injection into
the nonzero balanced elements of **absolute square norm**. Indeed,
`|N(β_c)|=N(J_c)²`; there is no reason for the signed field norm itself to
be nonnegative. Both signs must be retained in the curve count below.

#### 3.2 Variable-radius counts and exceptional subfields

The lattice argument also gives a useful form with a varying radius. For a
degree-`d` field `F` and `T ≥ D_F^(1/d)`,

```text
#B_F(T) ≪_d T^d / sqrt(D_F).
```

The controlled-basis lemma and largest-minimum estimate put a fundamental
parallelepiped in `B_F(C_d T)`. Its translates by the points of `B_F(T)`
are disjoint up to boundaries and lie in `B_F((C_d+1)T)`. Divide the latter
volume by `2^(-s_F)sqrt(D_F)`. For `F=Q`, count the integers directly.
This argument is uniform in `T/D_F^(1/d)`; it is not a fixed-field
asymptotic with an uncontrolled error term.

Suppose now that `K` has no `F` with `[K:F]=2`, and consider `β` for which
`e=[K:Q(β)]` is even. Then `e≥4`. Put `F=Q(β)` and `d=n/e`. The
relative-discriminant identity gives `D_F^e ≤ D`, so
`D_F^(1/d) ≤ D^(1/n)=R`. An embedding of `F` extends to one of `K`, so
a balanced `β` is in `B_F(R)`. The displayed estimate gives

```text
#B_F(R) ≪_n D^(1/e) / sqrt(D_F) ≤ C_n D^(1/4).
```

There are only a degree-bounded number of subfields: the normal closure has
Galois group of order at most `n!`, and its subgroups are at most `2^(n!)`.
Summing therefore gives `O_n(D^(1/4))` for the entire even-index locus.
In odd degree it is empty. Neither the discriminant tower nor the subfield
count is proposed as a new foundational owner; import the genuine supplier
when completing the library audit.

#### 3.3 Keep the unreduced norm curve

For each `β ∈ O_K`, use the **monic** convention

```text
P_β(X) = N_K/Q(X−β) = q_β(X)^e,
q_β = minpoly_Q(β),             e=[K:Q(β)].
```

The characteristic polynomial of multiplication on `O_K` defines the
integral polynomial. Restriction of scalars from `Q(β)`, or the norm tower,
gives the power identity. Since `q_β` is separable, each root has multiplicity
`e`. Consequently `P_β` is a square over `C[X]` precisely when `e` is even;
in that case its monic square root is in `Z[X]`.

If `e` is odd, then `P_β` is not a square in `C(X)`. For either sign `s`,
the monic quadratic `Y²−sP_β(X)` is irreducible over `C(X)`. Gauss's lemma
then makes it irreducible in `C[X,Y]`. Its total plane degree is **n**, even
when it is singular because `e>1`.

This resolves the squarefree-degree problem without changing the cited
input. The squarefree part has degree `[Q(β):Q]`, which can be smaller than
`n`; it cannot be assigned degree `n` in Bombieri–Pila. Instead apply the
original theorem to the **unreduced norm curve**, which really has degree
`n` and is absolutely irreducible. The theorem permits singularities. For
example, for rational `β=a` and odd `n≥3`, `Y²=(X−a)^n` is a singular
irreducible degree-`n` curve, while its squarefree part is linear. The two
models must not be confused for a coefficient-uniform plane-degree bound.

#### 3.4 Count translation classes without assuming long boundary fibers

A direct division of `#B_K(R)` by `R` is unjustified: some fibers of the
original box can be very short. Instead choose one `β_L ∈ B_K(R)` for
each coset `L ∈ O_K/Z` that meets it. The map

```text
(L,m) ↦ β_L+m,                  |m| ≤ floor(R),
```

is injective and lands in `B_K(2R)`. Distinct cosets are disjoint, and within
one coset distinct integers give distinct elements. The inherited coarse
box estimate, applied at scale two, yields

```text
# {L : L meets B_K(R)}
 ≤ #B_K(2R)/(2 floor(R)+1)
 ≪_n D^(1/2)/R
 = D^(1/2−1/n).
```

All these sets are finite by the lattice discreteness and boundedness
already used in the box count. This proof deals with boundary fibers without
requiring a new projection-lattice estimate.

#### 3.5 The rectangle, both signs, and the final exponent

Fix a representative `β_0 ∈ B_K(R)` in a coset of odd generated-field
index. That index is constant on the coset because
`Q(β_0+m)=Q(β_0)`. Write a counted element as `α=β_0−m`, with
`α ∈ B_K(R)`, `α≠0`. Any embedding gives `|m|≤2R`. Set
`y=sqrt(|N(α)|)`, a positive integer. The product formula with the correct
complex multiplicities gives `y≤sqrt(D)`.

Since `P_β0(m)=(-1)^nN(α)`, one of the two equations

```text
y² = P_β0(m),       y² = −P_β0(m)
```

holds. This maps the counted elements injectively into the disjoint union
of the two signed curves in the rectangle `|m|≤2R`, `0<y≤sqrt(D)`.
For `n≥3` and `D≥1`, the rectangle lies in an integer-translated square
of side `O_n(sqrt(D))`. Both curves are absolutely irreducible of total
degree `n`. The original Bombieri–Pila epsilon bound therefore yields
`O_(n,ε)(D^(1/(2n)+ε))` points in this coset (rescale epsilon if necessary).

Multiply by the translation-class bound and add the even-index exception:

```text
# {0 ≠ β ∈ B_K(R) : |N(β)| is a square}
 ≪_(n,ε) D^(1/2−1/n) D^(1/(2n)+ε) + D^(1/4)
 ≪_(n,ε) D^(1/2−1/(2n)+ε).
```

The last inequality uses `n≥3`. Combining with the injection of §3.1 gives

```text
|Cl(K)[2]| ≪_(n,ε) D_K^(1/2−1/(2n)+ε)
```

**when K has no subfield of index two**. This includes all odd degrees.
It is not a proof of the omitted index-two reduction, nor of the sharper
cubic/quartic exponent. The full extraction must still read the original
relative-genus estimate with its dependence on base class groups, units
and ramified primes. A quadratic-over-Q API is not that relative theorem.

### Original determinant-method proof now extracted

The selected chain is evaluation rank deficiency → nonzero integer minor →
Vandermonde/derivative bound → separation of successive blocks → auxiliary
curves → proper Bézout intersections. Restrict monomials to avoid the leading
degree-d term of the original polynomial. For integer δ≥2d, their number is
`D=d(δ−d+1)` and degree sum is
`p=d(δ(δ+1)−d(d−1))/2`. The exponent `2p/(D(D−1))` approaches 1/d.
Derivative level-set bounds partition the graph; intervals with a large
derivative are short. Iterating the resulting recurrence gives Theorem 4;
decomposition into bounded-slope graph pieces gives Theorem 5, including
singular curves.

Two literal proof typos are now visible. In Lemma 7 the dimensionless length
must be `|I| A^(1/k)/N`, not `|I| A^(-1/k)/N`. In the final estimate the
monomial sums satisfy **q≤p**, whereas the preprint prints the reverse.
The final choice of δ must also be an integer. These are **G7**: the exact
constants 11 and 12 require a checked rounding argument; the theorem is a
source target, not a completed formal proof. The selected API and test cases
now give the next worker concrete proof obligations.

### Cubic feedback and elliptic consequences

For cubic K, the translation count gives O(D_K^(1/6)) signed norm curves.
Their integral coefficients satisfy `|A|≪D^(1/3)`, `|B|≪D^(2/3)`,
`|C|≪D`, and their model discriminants are O(D²). A nonrational element
of a cubic field is primitive, so its cubic norm polynomial is separable.
The rational-generator case is singular and must be removed: if J²=(a),
a is rational and |N(a)| is square, then |a|=m² and J=(m), so this contributes
only the identity class. For the negative sign, X=−x turns the equation
into a monic cubic with the signs of A and C changed.

With natural logarithms, the constants are

```
u = sqrt(3)/2
b = ((1+u)/(2u)) log((1+u)/(2u))
  - ((1-u)/(2u)) log((1-u)/(2u))
a = 1 / (6(1-b/log 2))
c = a*b/log 2
```

Numerical checks give b≈0.2782386677, a≈0.2784337427 and
c≈0.1117670760. In particular b/log 2<1 and a=1/6+c.
The inequality
`H≤C_eta D^(1/6+eta) exp((b+eta)log₂ H)` therefore yields
`H≪epsilon D^(a+epsilon)` by choosing eta small enough and dividing
by `1−(b+eta)/log 2`. Rounded decimals are not theorem constants.

HV Theorem 3.8 includes both height and rank, with S containing every
infinite place and every prime dividing the chosen integral-model
discriminant. At t=0 it gives the packing endpoint. Corollary 3.11 plus
prime-support absorption gives the all-integral-point theorem quoted as
BSTTTZ Theorem 5.1. `A^omega(m)≪epsilon m^epsilon` follows by splitting
small and large primes, and absorbs the prefactors only **after** choosing S.
The explicit b-dependent feedback then uses Brumer–Kramer. Its original
Proposition 7.1 and following remark are still **G3**; the quotation in
BSTTTZ is not a claimed original-source reading.

Tau Ceti's implemented height is `lim h_x(2^nP)/(2·4^n)`, matching HV.
The upstream roadmap prose requests twice this normalization. Moreover,
the existing bounded-difference theorem has a constant depending on the
curve. It does not supply the uniform leading coefficient for a varying
family needed by §5.4. Thus the del Pezzo exponent remains **G6**, alongside
singular fibers and primitive weighted representatives.

The main elliptic conclusions are now separate items: Selmer cardinality
exponent a, rank at most `C_epsilon+(a+epsilon)log₂|Delta|`, and integral-point
exponent c. All use the chosen integral-model discriminant. Hyperelliptic
Theorem 1.3(a) and (b) are separate but **unrouted G5**: the printed bound
uses the étale algebra discriminant while model bad primes can also come
from the polynomial-order index and twists. A split cubic algebra can stay
fixed while the curve model's bad primes change. This observation identifies
an omitted dependency, not a claimed counterexample to the final article.

### Quartic transfer and field counts

Tsimerman's selected argument compares the F₂ permutation modules on four
embeddings and three pair partitions. Quotienting the four-dimensional
module by its sum line and then taking its even-weight image gives a
two-dimensional module, isomorphic to the three-partition module modulo
its sum line. Other factors are trivial. The isomorphism was checked on all
24 permutations and all eight representatives of the latter quotient.
Restricting this construction to a transitive subgroup of S₄ explains why
reducible cubic resolvents require étale product algebras, not an assumption
that the resolvent is a field.

This finite check does not prove the arithmetic transfer. Tsimerman's class
quantity is only defined up to discriminant-negligible factors, relative to
the splitting field. Its torus exact-sequence theorem, Brauer–Siegel inputs,
conversion to D_K and discriminant-preserving resolvent order still need
full closure and owner screening (**G4**). A composite acquisition node is
left unrouted and explicitly awaits splitting; it is not presented as a
completed atomic extraction.

The counting targets are routed to existing ST.0/ST.1/ST.3. Baily's weighted
quartic sum uses `h₂(K)(log D_K)²(X/D_K)^(1/2)`. A cubic family count
O_F(T^(1/2)), together with the pointwise cubic torsion bound, gives
O_(F,epsilon)(X^(1/2+a+epsilon)) by dyadic summation. Cohn supplies the cyclic
cubic input for A₄ quartics; the fixed-quadratic-resolvent cubic asymptotic
supplies the S₄ variant. The latter constant depends on the quadratic field
F. A favorable leading constant does not make convergence uniform in F.
Baily, Cohn and the two fixed-resolvent originals remain to acquire (**G8**).

### Finite-field proof and the gonality boundary

Let C/k be smooth, projective and geometrically integral, k finite of order
q, with genus g. Use the planned degree-one-divisor theorem to obtain a
divisor E of degree g; this does not assume C(k) nonempty. The divisor-class
interpretation of Pic⁰(C)(k) additionally uses the existing Picard comparison
target and Br(k)=0. These planned inputs are not falsely marked implemented.

For V=L(2E), take the subset of nonzero f whose principal divisor has every
coefficient even. It is stable under **all** k×, not only square constants.
It need not be a vector subspace and does not mean that f is a square in k(C).
The projective class of f maps to the class of half its principal divisor.
This has degree zero and is killed by two.

For c=[D] in 2-torsion, Riemann's inequality produces an effective divisor
D₊ linearly equivalent to E−D. Since 2D is principal, choose f with
`div(f)=2D₊−2E`. Then f lies in the chosen subset and its half-divisor class
is −c=c. This proves **surjectivity**. Uniqueness up to scalars holds for a
fixed principal divisor, not for all choices of D₊ in one class; no unjustified
canonical injection is used.

Implemented high-degree RR gives `dim L(2E)=g+1`, including g=0. The
implemented projective-space formula then proves the target
`#Pic⁰(C)(k)[2]≤(q^(g+1)−1)/(q−1)`. This argument has no characteristic
restriction. In characteristic two the geometric 2-torsion point group has
size 2^f for p-rank f≤g, not invariably 2^g; the group-scheme rank is 2^(2g).
Those general abelian-variety results belong to the existing Jacobian Layer E.

The stronger gonality assertion remains **unrouted G9**. Sedunova's theorem
has an epsilon loss absent from the displayed claim in BSTTTZ. Its literal
q-independent constant also fails a simple test: with I the polynomials of
degree at most two, |I|=q³, and the absolutely irreducible smooth parabola
Y²=X, every linear Y gives a pair in I². There are exactly q² such pairs,
whereas `|I|^(1/2+epsilon)=q^(3/2+3epsilon)`. For epsilon<1/6 a constant
independent of q cannot hold as q varies. This does not exclude an estimate
for fixed q or with additional q factors/thresholds. Resolve the correct
uniformity, epsilon handling, degree convention, bad-reduction exclusions
and coordinate-change cost; then separately treat inseparable maps and
characteristic two. The one-line analogy in the main paper is not a proof.

### Proposed ownership and acyclic dependencies

1. **EffectiveBoundsClassGroupTorsion**, Part II of the completed EffectiveBounds
   roadmap: balanced representatives, the norm-curve bound, cubic feedback,
   quartic transfer and the resulting elliptic discriminant applications.
2. **IntegralPointDeterminantMethods**, new direction: original coefficient-uniform
   plane-curve bound, importing generic polynomial, analysis and SF.5 intersection
   theory. Pila–Wilkie and pointwise finiteness do not supply it.
3. **EllipticCurvesPartIIIntegralPointBounds**, Part II of upstream EllipticCurves:
   HV and Brumer–Kramer tools. It does not depend on the improved torsion theorem;
   those final applications live in the consuming EffectiveBounds extension.
4. **ArithmeticStatistics**, source for ST.0/ST.1/ST.3: resolvent-weighted counts
   and the A₄/fixed-resolvent S₄ consequences, importing pointwise torsion.
5. **FunctionFieldArithmeticPartIITorsionBounds**, Part II of FA: quantitative
   Picard 2-torsion by projective sections, importing its already-built RR
   foundation and the existing degree-one/Picard suppliers.

These are proposals, not accepted designs. The result's briefs specify
endpoints, suppliers, tests and suggested Lean homes. They exclude G1/G2/G4's
unresolved acquisition nodes and G5/G6/G9's unverified claims. The complete
G0–G10 register and the handoff are part of the checkpoint, not optional caveats.

### Validation

The unmodified paper checker and intake file checks are run against the full
available atlas catalogue before submission. Custom structural checks preserve
all 35 old IDs, verify unique routing, ensure every unrouted missing item is
listed in a gap, and require an API plus three tests for all 31 definitions.
Meaningful finite checks cover the S₄ quotient-module map, projective scalar
orbits over F₂/F₃/F₅ in dimensions zero through four, the Sedunova parabola
example over F₂/F₃/F₅/F₇, and restricted-monomial counts/exponents for degrees
two through eight. Floating-point calculations check the displayed constants
and feedback identities; they are not certified real inequalities in Lean.
No Lean artifact was requested, produced or compiled.

---

### Fourth checkpoint: primitive bases and quadratic towers

**Author:** ChatGPT Pro, `cgp-0922-6e8b41`, 22 September 2026.
**Status:** proof/extraction supplement; machine synchronization pending.
The following replaces two missing steps in the proposed main-theorem route.
It is not a claim that every proof input of the paper has now been extracted,
that the published revision has been checked, or that anything is formalized.

#### A. Source and baseline boundary for this supplement

The main source passages are §§3–4, printed pp.5–6 of the February 2017
[Taniguchi author copy](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf).
The basis paragraph on p.5 was visually checked. The direct argument in B
below is our replacement proof, not a transcription or verification of
Siegel, *Lectures on the Geometry of Numbers*, Lecture X §6.

The new arithmetic source is Jürgen Klüners and Jiuya Wang,
*ℓ-torsion bounds for the class group of number fields with an ℓ-group as
Galois group*, [arXiv:2003.12161v2](https://arxiv.org/abs/2003.12161v2),
13 October 2020, Theorem 2.1 and proof, PDF pp.3–4. Those pages were read
and visually checked. It is a **later auxiliary source**, not a source
silently attributed to the original 2017 proof. No fresh PDF byte hash was
measured in this session. The article's eventual publication is
Proc. Amer. Math. Soc. 150 (2022), 2793–2805, DOI 10.1090/proc/15882.

The actual pinned statement `NumberField.mixedEmbedding.covolume_integerLattice`
was read in Mathlib `NumberTheory/NumberField/Discriminant/Basic.lean`,
lines 124–132 at `082e2d37e8b0463410cdb532e111cd43d5a66174`. It says
`covol(O_K)=2^(-s) sqrt(D_K)` for the ordinary mixed-space measure. The
adjacent ideal-covolume statement was also read. Other library imports in
this report retain their earlier workers' provenance, rather than a new
claim that this session reread all of them.

Reviewed AUDIT-02 distinguishes the existing covolume/first-Minkowski API
from the **missing** successive-minimum/second-Minkowski and higher-rank
reduced-basis theory. The GN atlas extract was read. For generic primitive
basis reduction use GN.5, importing GN.0/GN.1; do not force this elementary
argument through GN.3's mass formulas or higher-rank adelic reduction.

The complete completed-EffectiveBounds document and the relevant upstream
ClassFieldTheory purpose, ownership, Layers 12–13 and regression-test
passages were read. Hilbert class fields, their ordinary-class-group
quotients, maximal-unramified properties and conjugation/uniqueness remain
**planned imports** from
`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.
The accepted REV-AUDIT-03 confirms that Hilbert/ray/ring class fields are
not implemented at the pins. The large combined library-coverage file could
not be read through the browser; the split reviewed audit records were used.
This is not a new class-field-theory roadmap.

#### B. G1: a direct primitive-prefix basis proof

##### B1. Fix the metric before declaring that 1 is shortest

For signature `(r,s)`, put `n=r+2s` and define on the existing mixed space

```text
||x||_tr² = Σ_real |x_v|² + 2 Σ_complex |x_v|².
```

This is the ordinary Euclidean norm after multiplying both real coordinates
of every complex factor by `sqrt(2)`. If `||·||_0` is the unweighted mixed
Euclidean norm, then

```text
||x||_0 ≤ ||x||_tr ≤ sqrt(2) ||x||_0.
```

The linear change of coordinates has determinant `2^s`. Consequently the
covolume of the integer lattice for the **metric-induced Euclidean volume**
is `sqrt(D_K)`. For the unchanged ordinary product measure it is still
`2^(-s)sqrt(D_K)`; these are different normalizations, not conflicting formulas.

For `0 ≠ α ∈ O_K`, its nonzero integral norm has absolute value at least
one. AM–GM applied to the squared absolute values at all `n` embeddings,
with each complex pair counted twice, gives

```text
||α||_tr² / n ≥ |N_K/Q(α)|^(2/n) ≥ 1.
```

Thus `||1||_tr=sqrt(n)` is a shortest nonzero lattice length. Also 1 is
primitive: an algebraic integer lying in Q is an integer, so
`O_K ∩ Q·1 = Z·1`. Neither of these assertions should be justified by
silently using the product sup norm or omitting the complex multiplicity.

##### B2. Primitive-prefix extension in a general lattice

Let Λ be a full lattice in a positive-dimensional Euclidean space of
real dimension n. Let u be a primitive lattice vector and suppose
`||u|| ≤ A λ_1`, with `A≥1`. There is a Z-basis `b_0,...,b_(n−1)` with
`b_0=u` and, for every `i` and every lattice vector w outside the preceding
rational span,

```text
||b_i|| ≤ c_i ||w||,
c_0=A,
c_i=1+(1/2)Σ_(j<i)c_j   (i≥1).
```

For `i≥1`, `c_i=((A+2)/2)(3/2)^(i−1)`. In particular when u is shortest,
`c_i=(3/2)^i` at **every** index, including `i=n−1`.

Here is the construction and proof. Maintain a saturated prefix
`L_i=Z b_0+...+Z b_(i−1)` of Λ. The quotient Λ/L_i is free. Choose b_i
of minimal Euclidean length among the vectors whose nonzero image in that
quotient is primitive. Candidates exist by choosing a quotient basis and
lifting one vector. A minimum exists because a bounded ball has only
finitely many lattice points: first fix any candidate and minimize in the
finite set of candidates no longer than it. The enlarged prefix remains
saturated. At rank n the quotient is both finite and torsion-free, hence
zero; the resulting vectors form a basis.

Given w outside the preceding span, write its nonzero image in the free
quotient as `d u_bar`, where `d≥1` and `u_bar` is primitive. Lift `u_bar`
and adjust the lift by integer multiples of the prefix vectors. Rounding
the resulting rational coefficients to nearest integers gives a candidate
of the form

```text
u' = w/d + Σ_(j<i) t_j b_j,       |t_j|≤1/2.
```

Minimality and the triangle inequality give

```text
||b_i|| ≤ ||w||/d + (1/2)Σ_(j<i)||b_j||
        ≤ (1+(1/2)Σ_(j<i)c_j)||w||.
```

The inductive comparisons apply to the same w because it is outside each
earlier span. The initial comparison follows from `λ_1≤||w||`. This proves
the recurrence without needing the independent short vectors to generate
a saturated subgroup themselves.

Every later basis vector is a valid primitive-extension candidate at every
earlier stage. Therefore the selected lengths from `b_1` onwards are
nondecreasing. When u is shortest, the entire basis, including b_0, is
nondecreasing. No such order claim is needed for a merely A-short u.

##### B3. Product bound and the last minimum

Choose `i+1` independent lattice vectors realizing `λ_(i+1)`. One is
outside the i-dimensional preceding span, so

```text
||b_i|| ≤ c_i λ_(i+1).
```

Use the existing planned GN.1 second-Minkowski theorem, with v_n the
Euclidean volume of the unit ball, and Hadamard's determinant inequality:

```text
covol(Λ) ≤ Π_i ||b_i||
         ≤ (Π_i c_i)(2^n/v_n)covol(Λ).
```

Attainment of the successive minima and the lattice/basis determinant
identification belong to the GN.0/GN.1 supplier contract, not a second
private lattice library. The primitive-prefix API itself belongs to GN.5.

Apply B1–B3 with `u=1`, `A=1`. Writing the other basis vectors as
`v_1,...,v_(n−1)` gives

```text
Π_(i=1)^(n−1)||v_i||_tr ≍_n sqrt(D_K),
||v_i||_tr ≤ (3/2)^i ||w||_tr
  whenever w lies outside span_Q(1,v_1,...,v_(i−1)).
```

This includes the comparison at the last index that the previous checkpoint
could not certify. For n=2 it directly bounds the only nonconstant basis
vector by `C_2 sqrt(D_K)`.

For n≥3, use the already extracted nondegeneracy of the top-coordinate
multiplication matrix and select a nonzero permutation term. Every product
`v_i v_π(i)` in this term is outside the penultimate rational span. The
last-index comparison and submultiplicativity of the trace norm give,
with `L=||v_(n−1)||_tr`,

```text
L^(n−2) ≪_n Π_(i=1)^(n−2)||v_i||_tr².
```

Multiplying by L² and using the product bound yields `L^n≪_n D_K`.
The whole basis therefore has trace lengths at most `C_n D_K^(1/n)`.
There are n independent such vectors, giving the same upper bound for
`λ_n`. The norm comparison in B1 transports the result to the ordinary
mixed Euclidean metric. It does **not** claim that the basis is sorted
simultaneously in both metrics.

The top-coordinate matrix argument itself remains the earlier one: a
nonzero kernel vector r would make the codimension-one rational span
invariant under multiplication by the nonrational r; then `[Q(r):Q]`
would divide both n and n−1. No trace-form/nondegeneracy substitution is
being made.

#### C. G2: replace the unverified genus assertion, rather than hide it

For a number field F let
`r_2(F)=dim_F2(Cl(F)/2Cl(F))=log_2 #Cl(F)[2]`.
These cardinalities agree for a finite abelian group. Their Galois modules
are **not** thereby canonically or equivariantly identified.

For a quadratic extension E/F, let t be the number of ramified places of
F, **including real places that become complex**, and let `e=max(t,1)`.
The quadratic specialization of Klüners–Wang Theorem 2.1 is

```text
r_2(E) ≤ 2(r_2(F)+e−1),
h_2(E) ≤ 4^(e−1) h_2(F)^2.
```

The squared base factor is essential to what is actually being used here.
This does not certify the author's earlier displayed one-factor formula,
or its advertised `D_E^(1/4+epsilon)` conclusion in arbitrary even degree.

##### C1. The equivariance issue and the correct class-field quotient

Put `A=Cl(E)/2Cl(E)` and let σ be the nontrivial automorphism of E/F.
Set `T=σ−1` and `V=A/TA`. In characteristic two, `T²=0`. If
`s=dim_F2 V`, rank-nullity and `im T⊆ker T` give

```text
r_2(E)=dim A ≤ 2(dim A−rank T)=2s.
```

The use of A rather than the torsion subgroup matters. For a concrete test,
on `B=Z/4 × Z/2` the involution

```text
σ(x,y)=(x,y+x mod 2)
```

fixes B[2] pointwise, whereas on B/2B it has a nontrivial unipotent block.
Both groups have four elements, but the numbers of fixed points are four
and two. This rules out a generally valid equivariant replacement based
only on their equal orders.

Use the ordinary Hilbert class field correspondence to let H/E be the
maximal everywhere-unramified elementary abelian 2-extension, with
`Gal(H/E)=A`. The characteristic quotient by `2Cl(E)` and functoriality
under conjugation make H/F Galois. Let M be the fixed field of TA. The
subspace TA is stable, so M/F is Galois and

```text
1 → V → G=Gal(M/F) → C2 → 1.
```

The conjugation action on V is trivial by construction. Since the quotient
is cyclic, this central extension is abelian: G is generated by V and one
lift of the quotient generator. Thus `|G|=2^(s+1)`, V has exponent two,
and the subgroup `2G` has order at most two. This last assertion follows
by squaring that one lift; it does not assume the extension splits.

These field constructions use the existing ordinary Hilbert class field,
not a narrow-class-field surrogate. In particular M/E is unramified at
finite places and split at real places.

##### C2. Ramified and unramified branches

If `t>0`, choose one ramified place of F. Its inertia group in M/F
maps isomorphically onto the order-two inertia group in E/F, because
M/E is everywhere unramified. It supplies an order-two lift outside V.
Consequently G splits as `V × C2` and is elementary abelian of rank s+1.
For each ramified place of F its inertia subgroup has order two; as G is
abelian, choosing a place above it does not change that subgroup. Let I
be the subgroup generated by these at most t inertia generators. Then
`dim I≤t` and `M^I/F` is everywhere unramified. Ordinary class field theory
makes `G/I` a quotient of Cl(F), so

```text
s+1−t ≤ dim(G/I) ≤ r_2(F).
```

This proves `s≤r_2(F)+t−1`, including when only an infinite place ramifies.

If `t=0`, M/F itself is everywhere unramified. G need not be elementary
abelian: a cyclic order-four factor is possible. Nevertheless G is a
quotient of Cl(F), and `|2G|≤2` gives

```text
s ≤ log_2 |G/2G| ≤ r_2(F).
```

Combining the two branches with `r_2(E)≤2s` proves the displayed relative
rank bound. This treatment does not drop capitulation or unit factors
from an ambiguous-class formula; it uses the full ordinary class-field
correspondence instead.

##### C3. Uniformity as the base field varies

Let `m=[F:Q]`. Every finite ramified prime of F divides the relative
discriminant Δ_(E/F); over each rational prime there are at most m primes
of F. There are at most m infinite places that can ramify. Therefore

```text
t ≤ m ω(N_F/Q Δ_(E/F)) + m ≤ m ω(D_E)+m,
D_E = D_F² N_F/Q Δ_(E/F).
```

The already extracted prime-support estimate, with its constant allowed
to depend on m and η, gives for every η>0

```text
h_2(E) ≪_(m,η) D_E^η h_2(F)^2.
```

This statement is uniform over all quadratic E/F with `[F:Q]=m`.
The real-place contribution is a degree-dependent constant. The norm of
the relative discriminant, the absolute field discriminant, and the
number of prime ideals of F are distinct quantities and must stay so
in the API.

##### C4. Why the squared factor still suffices

Start with `h_2(Q)=1`. Applying C3 to a quadratic field over Q gives
`h_2(K)≪_η D_K^η`, a weaker-than-optimal genus estimate that is enough
as the quadratic base case.

Write `α_d=1/2−1/(2d)` for `d≥2`. Proceed by strong induction on the
absolute degree. If a degree-n field K has no index-two subfield, the
preserved norm-curve argument gives `h_2(K)≪_(n,ε)D_K^(α_n+ε)`.
If it has a subfield F with `[K:F]=2`, put `m=n/2<n`. For m≥2 the
inductive bound and C3 yield

```text
h_2(K) ≪_(n,η) D_K^η D_F^(2α_m+2η)
       ≤ C_(n,η) D_K^(α_m+2η),
α_n−α_m=1/(2n)>0.
```

Here `D_F²≤D_K`, and all relevant exponents are nonnegative. Choose η
small enough relative to the final ε; for example η=ε/4 already leaves
the positive degree gain unused. The case m=1 is the quadratic base case.
This proves the required degree-dependent main bound, without using the
unverified one-factor genus assertion. For a quartic field with a quadratic
subfield, use the stronger quadratic base estimate in C3 to obtain
`h_2(K)≪_εD_K^ε`; the remaining quartic branch still needs the separate
resolvent transfer recorded under G4.

The generic `h_2(Q)=1`, quotient/finite-rank identities, primitive-submodule
extension, inertia-in-towers and discriminant-tower interfaces must still
be matched to exact pinned declarations or supplier requests during machine
synchronization/blueprint closure. They are not falsely marked newly
implemented by this proof note.

#### D. Proposed extraction entries and ownership

These entries are **not yet in the result JSON**. Each suffix below means
`PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/<suffix>`. Their locator is the
named subsection of this supplement, together with the original source
locator where supplied. Retain all inherited IDs when integrating them.

**`trace-metric-normalization` — construction, missing; B1.**
On the existing mixed embedding, construct the trace-weighted Euclidean
metric by the explicit diagonal real linear equivalence. Its squared norm
counts complex coordinates twice, its integer-lattice covolume for the
induced Euclidean measure is `sqrt(D_K)`, and 1 is a primitive shortest
vector of length `sqrt(n)`.
API: `traceNorm_sq`, `traceNorm_eq_norm_scaled`, `norm_le_traceNorm`,
`traceNorm_le_sqrtTwo_mul_norm`, `traceCovolume_integerLattice`,
`traceNorm_one`, `sqrt_degree_le_traceNorm_of_integral_ne_zero`, and the
primitive-vector statement. These are planning names, not existing Lean
citations. Tests: Q has length/covolume one; Q(i) has trace basis lengths
`sqrt(2)` and trace covolume two, but ordinary covolume one; metric
comparison remains valid for a mixed signature and explicitly changes
both real coordinates of each complex factor. Suggested owner:
EffectiveBoundsClassGroupTorsion, importing existing covolume and GN APIs.

**`primitive-prefix-extension` — theorem, missing; B2.**
A full rank-n Euclidean lattice and primitive A-short initial vector admit
a basis with the all-index comparison and constants c_i in B2. The proof
is shortest primitive extension, quotient-coordinate rounding, induction.
Test the last index; reject a nonprimitive initial vector such as 2 in Z;
for a shortest initial vector verify all c_i equal `(3/2)^i`.
Suggested owner: source within GN.5; no new roadmap.

**`reduced-basis-product` — theorem, missing; B3.**
The basis just constructed satisfies
`covol Λ≤Π||b_i||≤(Πc_i)(2^n/v_n)covol Λ`. Proof: compare to each
successive minimum, then second Minkowski and Hadamard. The rank-one
case and positive n are explicit; no unproved equality of a merely
independent set with an integral basis. Suggested owner: GN.5, importing
GN.0/GN.1.

**`hilbert-class-field-input` — theorem, planned; C1–C2.**
The ordinary Hilbert class field correspondence identifies finite abelian
everywhere-unramified extensions with quotients of the ordinary class group,
compatibly with conjugation. Import its elementary-2 quotient and
maximal-unramified property from upstream ClassFieldTheory Layer 13.
A narrow class group instead permits real-place ramification and is not
an interchangeable carrier. The layer's named Hilbert-class-group
isomorphism is planned, not a declaration asserted present at the pins.

**`quadratic-coinvariant-extension` — construction, missing; C1.**
For quadratic E/F construct A, T, H, and M as above, using the ordinary
Hilbert class field supplier. Export the finite extension G with kernel
`V=A/TA`, trivial conjugation on V and `|2G|≤2`.
API: the induced involution on `Cl(E)/2Cl(E)`; `T_sq_zero`; the stable
subgroup TA; fixed-field and restriction maps; the exact sequence;
`commutative_G`; `card_G`; and `card_twoG_le_two`. These are planning
interfaces, not new public class-field carriers. Tests: the Z/4×Z/2
involution must distinguish torsion and quotient actions; the unramified
branch must allow nonsplit C4; a ramified place must furnish an actual
order-two inertia lift, not an arbitrary lift. Suggested owner:
EffectiveBoundsClassGroupTorsion, consuming the existing CFT supplier.

**`quadratic-relative-rank` — theorem, missing; C2.**
For every quadratic E/F, with t counting finite and infinite ramified
places, `r_2(E)≤2(r_2(F)+max(t,1)−1)`. Source: Klüners–Wang v2,
Theorem 2.1, pp.3–4; quotient-module proof expanded in C1–C2. Keep the
`t=0` branch rather than replacing max(t,1) by t. Suggested owner:
EffectiveBoundsClassGroupTorsion.

**`ramified-place-support` — theorem, missing; C3.**
For `[F:Q]=m` and quadratic E/F,
`t≤m ω(N Δ_(E/F))+m≤m ω(D_E)+m`.
Proof: support of the relative discriminant, at most m primes above a
rational prime, and at most m real places. Suggested owner:
EffectiveBoundsClassGroupTorsion, importing ramification/discriminant
suppliers rather than defining them again.

**`quadratic-relative-torsion` — theorem, missing; C3.**
For every m≥1 and η>0 there is a constant C_(m,η) such that
`h_2(E)≤C_(m,η)D_E^η h_2(F)^2` for all quadratic E/F of base degree m.
Proof: exponentiate the relative-rank bound, use ramified-place support
and the already extracted prime-support loss. Suggested owner:
EffectiveBoundsClassGroupTorsion. Uniformity includes varying F.

**`all-degree-torsion-induction` — theorem, missing; C4.**
Given the no-index-two norm-curve bound and the preceding quadratic
estimate, derive for each n≥3 and ε>0 the uniform bound
`h_2(K)≪_(n,ε)D_K^(1/2−1/(2n)+ε)`, using the quadratic `D^ε` base case.
The induction is on absolute degree, not on a presumed tower down to Q.
Suggested owner: EffectiveBoundsClassGroupTorsion. It does not by itself
prove the sharper cubic or nonquadratic-subfield quartic exponent.

The existing `reduced-integral-basis` ID should now state its sorted basis
in the **trace metric**, cite B1–B3 as a replacement argument and receive
an EffectiveBounds Part-II route. Its original-source locator remains
recorded as motivation, with Siegel unread. Update `largest-minimum`,
`two-torsion-general` and the route brief accordingly. Keep the literal
`relative-genus-source-claim` unrouted and diagnostic; it is no longer a
premise of the replacement main-bound route.

Suggested homes for the later design: generic primitive-prefix reduction
under `TauCeti/NumberTheory/GeometryOfNumbers/`; number-field metric and
torsion bounds under `TauCeti/NumberTheory/EffectiveBounds/`. No Suggested.lean
is produced by this paper checkpoint. Exact generic declaration audits and
any additional sublemma nodes remain part of the machine/blueprint work.

After the nine additions and routing the old basis node, expected totals
are 119 items (22 library, 8 planned, 89 missing), six routes and 33
construction/definition entries. Recompute rather than copy these counts.
The present unchanged JSON still contains the earlier 110 items.

#### E. Regression tests and remaining verification

The following local script was actually executed in this session. Its
finite tests do not certify the infinite lattice or class-field arguments,
and are not a substitute for Lean proofs or the repository checker.

```python
from fractions import Fraction
from itertools import product

c = [Fraction(1)]
for i in range(1, 31):
    c.append(1 + sum(c) / 2)
    assert c[i] == Fraction(3, 2) ** i

B = list(product(range(4), range(2)))
sigma = lambda a: (a[0], (a[1] + a[0]) % 2)
assert all(sigma(sigma(a)) == a for a in B)
torsion = [a for a in B if (2 * a[0]) % 4 == 0]
assert all(sigma(a) == a for a in torsion)
Q = list(product(range(2), range(2)))
sigma_q = lambda a: (a[0], (a[1] + a[0]) % 2)
assert len(torsion) == len(Q) == 4
assert sum(sigma_q(a) == a for a in Q) == 2

def rank(cols):
    basis = {}
    for x in cols:
        while x:
            k = x.bit_length() - 1
            if k in basis:
                x ^= basis[k]
            else:
                basis[k] = x
                break
    return len(basis)

def apply(cols, x):
    y = 0
    for i, col in enumerate(cols):
        if (x >> i) & 1:
            y ^= col
    return y

counts = []
for n in range(5):
    seen = 0
    for cols in product(range(1 << n), repeat=n):
        if all(apply(cols, col) == 0 for col in cols):
            assert n <= 2 * (n - rank(cols))
            seen += 1
    counts.append(seen)
assert counts == [1, 1, 4, 22, 316]

alpha = lambda d: Fraction(1, 2) - Fraction(1, 2 * d)
for m in range(2, 101):
    assert alpha(2 * m) - alpha(m) == Fraction(1, 4 * m)
print('PASS: recurrence, inequivalent actions, square-zero matrices, exponents')
```

The source-version problem G0 remains: attempted AMS reads did not return
the revised article, and publication metadata alone does not establish
mathematical agreement. G3–G10 retain the substantive source/closure
obligations recorded in the handoff. G1 now has a direct proof candidate;
G2 has a later-source replacement for the main theorem, not verification
of the literal stronger claim. Neither repair has an independent review.

Only the finite regression checks above ran locally. A local clone was
not obtainable in this environment, so `scripts/check_paper.py` and the
full-catalogue intake checks were **not run locally by this session**.
This report and the handoff are the submitted checkpoint; the unchanged
machine extraction must be synchronized and validated before these new
entries can be regarded as integrated. No Lean file was compiled.

---

### Sixth checkpoint: integer parameters and singular-point coverage

**Author:** ChatGPT Pro, `cgp-0922-d4f8c2`, 22 September 2026.
**Status:** partial paper extraction; proposed proof repairs, not independently
accepted or formalized. This continues merged checkpoints #1636, #1641,
#1650, #1695 and #1760 on issue #1420. The five proposed items and their guarded integration patch are supplied in
this handoff. The result JSON is not changed by this proof checkpoint. After
integration the complete earlier report remains before this supplement, with
its authorship and historical reading/validation claims preserved.

#### Source and ownership boundary

The source is Bombieri–Pila, *The number of integral points on arcs and ovals*,
[Oxford author preprint](https://people.maths.ox.ac.uk/pila/Ovals.pdf), especially
§3, printed pp.10–17. The selected determinant foundations on pp.1–6 and the
whole §3 proof chain were read in this session. Printed pp.3,14,17 were visually
checked. The February 2017 [BSTTTZ author copy](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf)
was read through its parsed pages, including references, and its printed p.4
volume display was visually checked. The existing PDF byte hashes are preserved
as earlier workers' measurements: no fresh hash is claimed. The final
2019-revised/2020 publisher text was not obtained, so G0 remains. No complete
new reading of all the other prerequisite papers is claimed.

The arguments BP1–BP6 are our explicit expansions/replacements for the selected
proof, not unnamed lemmas attributed verbatim to the source. In particular BP6
bounds a cover of the **finite set of integral points** by `8d^3` pieces. It does
not claim the source's stronger `O(d^2)` whole-curve decomposition, nor smoothness
at singular endpoints. This weaker, explicit cover still gives the published
constant 12 under its stated threshold.

All five new theorems refine the already proposed
`IntegralPointDeterminantMethods` direction. Generic proper intersection/Bézout
remains an input from `SchemeAndStackFoundations:SF.5`; this is not a second
intersection-theory roadmap. The complete completed-EffectiveBounds and
AlgebraicCurves roadmaps, SchemeAndStackFoundations stage descriptions, and the
accepted `REV-AUDIT-01` were read. The combined `data/library-coverage.json`
reader returned empty content, not a usable full audit. The reviewed audit and
roadmap documents do not prove that every generic lemma below is implemented;
exact pinned declaration matching stays in G7. No library/planned item has been
reclassified or newly asserted present. The old library pins remain unchanged.

#### BP1. Normalize by integer translations, and stop below lattice scale

For a compact interval `I` of length at most `N`, let `g` be smooth on a
neighbourhood of `I` with `|g'|≤1`. Its integral graph points have distinct integer
abscissae, so there are at most `floor(N)+1` of them. Define `G_d(N)` as the
maximum possible count over this class of graphs satisfying an absolutely
irreducible real polynomial of total degree `d≥2`. Counts form a nonempty,
bounded subset of the natural numbers, so this maximum is legitimate, without
a compactness claim about the family of polynomials. Single-point restrictions
of `y=x^d` show that the class is nonempty. For `0<N<1`, `G_d(N)≤1` directly.

For `N≥1`, handle zero or one counted point separately. Otherwise restrict the
domain to the compact interval between the least and greatest integer abscissae
of **all** counted points. Translate the left endpoint to zero by an integer.
The interval is now in `[0,N]`; its graph's oscillation is at most `N`. Choose
an integer nearest the midpoint of the range of `g` and subtract it. The new
absolute height is at most `N/2+1/2≤N`. Both translations preserve the integer
lattice, total polynomial degree, the top homogeneous part and absolute
irreducibility. An arbitrary real translation would not preserve the counted
lattice and must not be used.

Restrictions to derivative-partition intervals admit the same argument after
choosing their integer-point hulls. Empty or singleton pieces can simply be
charged to an upper bound at least one. Below `N=1`, do **not** reuse the
height-normalization inequality: stop with the elementary one-abscissa bound.
This gives the hypotheses needed for the recurrence's strict small-scale base
case, even when original or partition endpoints are not integers.

#### BP2. The Taylor argument and its dimensionless parameter

Let `k≥1` be an integer, `A,N>0`, `a≤b`, and `g∈C^k([a,b])`. Suppose

```text
|g^(i)(x)| ≤ i! A^(i/k) N^(1−i)     (0≤i<k),
|g^(k)(x)| ≥ k! A N^(1−k).
```

The degenerate interval is immediate. Otherwise Taylor's theorem at the two
endpoints, followed by the triangle inequality, gives, for `l=b−a`,

```text
l^k A N^(1−k) ≤ Σ_(i=1)^(k−1) l^i A^(i/k) N^(1−i) + 2N.
```

Set `t=l A^(1/k)/N`, with a **positive** exponent on `A`. After dividing by
`N`, the inequality is `t^k≤Σ_(i=1)^(k−1)t^i+2`. The exact identity

```text
t^k − Σ_(i=1)^(k−1)t^i − 2 = (t−2) Σ_(i=0)^(k−1)t^i
```

has a strictly positive right-hand sum for `t≥0`, so `t≤2`. Consequently
`l≤2A^(−1/k)N`, as required. This also handles `k=1`, where the first sum is
empty. The negative exponent in the source's definition of its dimensionless
parameter is a misprint, not a change to the stated interval estimate.

#### BP3. Iteration with an explicit stopping index

Suppose `G:(0,∞)→[0,∞)`, `α>0`, `H≥0`, `K≥1`, and `0<λ<1`, with

```text
K λ^α = 1/2,
G(x) ≤ H x^α + K G(λx)        for x≥1,
G(x) ≤ 1                      for 0<x<1.
```

Fix `N≥1` and let `m≥1` be the least integer for which `λ^m N<1`. Then
`λ^(m−1)N≥1`, so `λ^mN≥λ`. Iterating exactly `m` times gives

```text
G(N) ≤ H N^α Σ_(j=0)^(m−1) 2^(−j) + K^m.
```

The remainder is controlled without hiding a scale-dependent constant:

```text
K^m = 2^(−m) λ^(−mα)
    ≤ 2^(−m) λ^(−α) N^α
    = 2^(1−m) K N^α
    ≤ K N^α.
```

Thus `G(N)≤(2H+K)N^α≤2(H+K)N^α`. The strict inequality in the stopping
condition matters when an iterate equals exactly one.

#### BP4. All constants in the determinant recurrence

For integers `d≥2`, `δ≥2d`, use the source's restricted monomials. Their number
and total degree sum are

```text
D = d(δ−d+1),
p = d(δ(δ+1)−d(d−1))/2,
α = 2p/(D(D−1)) = (δ+d)/(dδ−d²+d−1).
```

These formulas give `1/d≤α≤1/d+4/δ≤2` and `D≤dδ`. If `q` is the sum of
their `Y`-degrees, then `0≤q≤p`, term by term. The source prints the reverse
inequality immediately before using `A^q≤A^p`.

Choose

```text
K = 2d^4δ²,       B = 2K = 4d^4δ²,
λ = B^(−1/α),    A = (2/λ)^(D−1),
X = (D^p A^q)^(2/(D(D−1))),
H = 4d^5δ³ X.
```

Here `Kλ^α=1/2`, `A>1` and `X≥1`. When taking a maximum over all defining
polynomials, use the worst case `q=p`, so `H` is genuinely uniform in the
leading monomial; no coefficient-dependent parameter is concealed.

For clarity, the already extracted derivative-partition argument has the
following interface. There are at most `2d²(D−1)²≤K` intervals. On a piece
where the derivatives through order `D−1` satisfy the scaled bound `A`, the
auxiliary-curve/determinant estimate gives at most
`dδ(XN^α+1)≤2dδ XN^α` points for `N≥1`. On a remaining piece, take the
first derivative order `k` crossing its threshold. BP2, applied with parameter
`A^(k/(D−1))`, bounds its length by
`2 A^(−1/(D−1))N=λN`. Summing gives
`G_d(N)≤H N^α+K G_d(λN)`. Shared endpoints may be counted twice in this
upper bound; singular endpoints are not part of these smooth graph inputs.
BP1 handles integer normalization and the exceptional zero/one-point cases.

The numerical estimate for `H+K` is as follows. Since `X≤(DA)^α` and
`K≤d^5δ³X`,

```text
H+K ≤ 5d^5δ³(DA)^α
    = 5d^5δ³ D^α 2^(α(D−1)) B^(D−1)
    ≤ 5d³δ³ (4B)^D.
```

For the last step use `D^α≤(dδ)²` and `2^(α(D−1))≤4^(D−1)`; the ratio
of the resulting left side to the displayed right side is at most
`d²(dδ)²/(4B)=1/16`. Next,

```text
5d³δ³ (4B)^D
 ≤ 5d³δ³ (16d^4δ²)^(dδ)
 ≤ (d^4δ^5)^(dδ)
 ≤ 2^(−4dδ) δ^(9dδ)
 ≤ δ^(9dδ)/2.
```

The middle absorption is explicit: `δ≥4`, so `δ³/16≥δ`; also `dδ≥8`
and `d≤δ/2`, whence
`5d³δ³≤(5/8)δ^6≤δ^8≤δ^(dδ)≤(δ³/16)^(dδ)`.
The penultimate inequality uses `d^4≤δ^4/16`. BP3 now gives

```text
G_d(N) ≤ N^(1/d) exp(4 log(N)/δ + 9dδ log δ)       (N≥1).
```

This is an inequality chain in real arithmetic; the finite regressions below
are checks on it, not its proof. The source-level determinant, proper Bézout
and derivative-level-set suppliers are still explicit inputs, not newly
formalized theorems asserted by this calculation.

#### BP5. Round down without changing the constant eleven

Assume `N≥exp(d^6)`. Set

```text
L = log N,       ell = log L,
S = sqrt(d L ell),
x = 2 sqrt(L/(d ell)),
δ = floor x.
```

First verify admissibility. We have `L≥d^6≥64` and `ell≥6 log d`.
The function `L/log L` increases for `L>e`. At `L=d^6`, the inequality
`d^6/(6 log d)≥d³` follows from `d³≥6 log d`; the latter follows from
`log d≤d/2` and `d²≥3`. Hence `x≥2d≥4`, so `δ≥2d` and
`δ≥x−1≥3x/4`.

We also need `δ≥L^(1/4)`. It suffices that `(3/4)x≥L^(1/4)`, equivalently
`sqrt L≥(4/9)d log L`. The function `sqrt L/log L` increases for `L>e²`.
At the lower endpoint this reduces to `d²≥(8/3)log d`, again following from
`log d≤d/2` and `d≥2`. Thus `log δ≥ell/4`.

Let `E(t)=4L/t+9dt log t`. For `δ≤t≤x`,

```text
E'(t) = −4L/t² + 9d(log t+1)
      ≥ −(16/9)d ell + (9/4)d ell + 9d
      = (17/36)d ell + 9d > 0.
```

Therefore rounding down cannot increase this objective:

```text
E(δ) ≤ E(x)
     = S [11 + (9/ell) log(4/(d ell))]
     ≤ 11S,
```

because `d ell≥12 log 2>4`. This supplies an **integer** monomial cutoff
at the original threshold and preserves the exact constant 11. It is not an
asymptotic claim about a negligible rounding error. Combining with BP4 proves
the stated graph bound, conditional on its extracted proof suppliers.

#### BP6. Include singularities and boundaries without an endpoint shortcut

Let `F∈R[X,Y]` be absolutely irreducible of total degree `d≥2`. Work in the
closed square `[0,N]²`, `N>0`. The three polynomials

```text
F_Y,        F_X+F_Y,        F_X−F_Y
```

are nonzero and have degree at most `d−1`. Indeed, a zero constant-directional
derivative in characteristic zero would make `F` a polynomial in a single
linear coordinate; over `C` that is incompatible with absolute irreducibility
and `d≥2`. Thus none shares a component with `F`. Proper Bézout bounds their
union of intersections with `F` by `3d(d−1)` points. This set contains every
singular point. Add the intersections with the two horizontal lines `Y=0,N`,
at most `2d` points, since neither line can be a component.

Write `Q=3d(d−1)+2d`. Cut the horizontal axis at the interior abscissae of
these points and at `0,N`. There are at most `Q+1` open vertical strips. In
a strip, all curve points inside the square have `F_Y≠0`. The real roots in
`0<Y<N` are simple and cannot cross one another or the horizontal boundary.
The implicit-function theorem, ordering the roots, and continuation therefore
give at most `d` analytic root graphs across that strip. Continuation uses the
bounded height interval: a branch cannot escape to infinity, and any finite
limit either remains a simple interior root or hits an excluded critical or
boundary abscissa. This explains the compactness step; it does not pretend a
source declaration for it has already been matched at the pin.

On each connected graph the slope cannot equal `1` or `−1`. Hence it is
either always between `−1` and `1`, or is always greater than `1`, or always
less than `−1`. In the latter two cases the graph is strictly monotone;
exchange the axes and use the inverse-function theorem. Its inverse slope has
absolute value less than one and the swapped polynomial retains degree and
absolute irreducibility.

Do **not** assert smooth extension at the open strip's endpoints. Instead,
its integer points are finite. With at least two, restrict the chosen smooth
graph to the closed interval from the first to last of these points in the
chosen independent coordinate. This lies strictly inside the branch's domain,
so the restricted function is smooth on a neighbourhood. A one-point branch
is a singleton; an empty branch contributes nothing. The result covers the
finite integral-point set, rather than all of the original real curve.

At every critical or boundary vertical fiber, `F(t,Y)` is not the zero
polynomial: otherwise `X−t` divides `F`. Each such fiber contributes at most
`d` points. Thus a cover using graphs or singletons has size at most

```text
d(Q+1) + d(Q+2) = 6d³−2d²+3d ≤ 8d³.
```

For `N≥exp(d^6)`, `log(8d³)≤S`. One direct check is
`log(8d³)=3log2+3log d≤3d≤d³≤S`; the last inequality follows from
`S²≥6d^7 log d≥d^6`. Charge each singleton to the graph bound (which is at
least one) and apply BP5 to every remaining piece. The total is at most

```text
8d³ N^(1/d) exp(11S) ≤ N^(1/d) exp(12S).
```

This includes singular integral points, points on critical fibers, and the
square's boundary. The `8d³` count is an explicit replacement sufficient for
this theorem, **not** verification of the stronger original `O(d²)` whole-curve
claim, which remains separately identified in `bp-arc-decomposition`.

#### BP7. Four source-issue records, with version and verification limits

The proposed result has `sourceIssues` E1–E4 with the protocol's fields. E1 is the
incorrect exponent in the dimensionless Taylor parameter; E2 is the reversed
comparison between monomial degree sums; E3 is the unprovided integer-rounding
argument. These concern the Oxford Bombieri–Pila author preprint and affect
the proof, not a changed statement of its final bound.

E4 concerns the February 2017 BSTTTZ author copy, printed p.4. A complex disc
of radius `R_v` contributes `pi R_v²`, not `sqrt(pi) R_v`. The displayed
factor must be squared as a whole. For `K=Q(i)`, `I=O_K`, `alpha=1`, the
radius is `sqrt(2)` and the actual area is `2pi`. The printed `sqrt(2pi)`
is below the ordinary-lattice Minkowski threshold four, whereas the correct
area is above it. For signature `(r,s)` the correct volume is
`2^r pi^s sqrt(D_K)/N(I)`, already used in the inherited balanced-body item.
No change to that item's route or theorem is needed.

The recorded searches were for `Bombieri Pila "arcs and ovals" erratum`,
`"Bombieri" "Pila" "Since p"`, and
`"Bounds on 2-torsion in class groups" corrigendum`, alongside the actual
source-page readings. They did not locate an existing correction. Attempted
AMS final-text retrieval and author publication pages did not supply the final
revision. Consequently `known: new` in the structured records denotes only
this documented search outcome, **not** a claim of priority or a claim that
the errors survive in every published version. The records themselves still
need independent verification. No author was contacted, and the broader source
issue inventory in G10 is not complete merely because four entries now exist.

#### BP8. Machine integration, checks and the remaining closure boundary

Five theorem entries, all missing and routed only to the existing determinant
candidate, are specified by the integration patch:

```text
bp-integer-normalization
bp-contraction-iteration
bp-recurrence-constants
bp-integer-optimization
bp-explicit-graph-cover
```

All 119 inherited IDs are retained. Only four inherited missing-item objects
are changed: `bombieri-pila-explicit`, `bp-large-derivative-interval`,
`bp-graph-count`, and `bp-arc-decomposition`. Every inherited library/planned
item object is unchanged. The locally constructed proposed extraction has **124 items: 22 library, eight
planned and 94 missing**. Six routes take **87 missing items exactly once**;
seven explicit diagnostic items remain unrouted. The 33 definition/construction
entries retain their API outlines and at least three tests. The previous
verification object is preserved verbatim in `verificationHistory`, and
original pins, prerequisites and source-file hashes remain unchanged.

Both complete baseline files were reconstructed locally and verified by their
Git blob hashes before editing: result
`ceec6960b756d275354f00c58e429cf0e498c583`, report
`48f7b052bab8574c85fc0ef4d6ddb467fa56edc1`. The integration script preserves the complete prior report as historical
text and appends this supplement; its top notice distinguishes the new
integration from the earlier 110-item/pending-synchronization notices.

Local checks covered UTF-8/JSON parsing, ID preservation, the four-item change
boundary, unchanged library/planned objects, source/pin/prerequisite and
verification preservation, route uniqueness, explicitly unrouted diagnostics,
definition API/tests, and the source-issue schema. The script below was actually
run and passed: **19,720** exact restricted-monomial cases; Taylor identities for
`k=1..30`; cover counts for `d=2..300`; **1,188** high-precision threshold and
floor-jump tests; and **348** recurrence-constant chains. Its largest tested
`E(delta)/S` was approximately `9.8990730442`, below 11. These regressions are
not proofs of the universal inequalities or of any analytic/geometric input.

The unmodified full-catalogue `scripts/check_paper.py` and intake `check-files`
were **not run locally**: no complete clone/catalogue was available. The actual
Swarm submission workflow runs both against the repository; its real result
must be read and recorded in the PR discussion. Local tests are not a substitute
for that workflow. No Lean file was requested, produced or compiled.

After machine integration, G7 is narrowed to exact generic supplier matching,
formal proof-interior closure and independent checking; the integer-parameter
and constant arguments are supplied here, not left unwritten. G0 and G1–G6/G8–G10 retain their separate obligations.
In particular this checkpoint does not complete the paper, acquire the final
publisher text, verify every previous diagnostic, or prove the stronger
whole-curve decomposition. Source reading, a written replacement argument,
finite tests, successful structural CI and independent acceptance are different
things and must remain so in the next handoff.

##### Reproducible regression script

```python
"""Finite regression checks; not proofs or Lean elaboration."""
from fractions import Fraction as Q
import math
import mpmath as mp
mp.mp.dps = 80

# Exact restricted-monomial combinatorics and exponent inequalities.
count = 0
for d in range(2, 31):
    for delta in range(2*d, 2*d+40):
        D = d * (delta-d+1)
        p = Q(d * (delta*(delta+1)-d*(d-1)), 2)
        alpha = 2*p/(D*(D-1))
        assert p.denominator == 1
        assert Q(1,d) <= alpha <= Q(1,d)+Q(4,delta) <= 2
        assert D <= d*delta
        for leading_y in range(d+1):
            leading_x = d-leading_y
            M = [(a,b) for a in range(delta+1) for b in range(delta+1-a)
                 if d <= a+b and not (a >= leading_x and b >= leading_y)]
            assert len(M) == D
            assert sum(a+b for a,b in M) == p
            q = sum(b for a,b in M)
            assert 0 <= q <= p
            count += 1

# Exact Taylor polynomial identity and explicit curve-piece count.
for k in range(1, 31):
    for t in [Q(0), Q(1,3), Q(1), Q(2), Q(7,3), Q(10)]:
        assert t**k-sum(t**i for i in range(1,k))-2 == (t-2)*sum(t**i for i in range(k))
for d in range(2, 301):
    qcrit = 3*d*(d-1)+2*d
    pieces = d*(qcrit+1) + d*(qcrit+2)
    assert pieces <= 8*d**3

# High-precision tests at threshold and near floor jumps. Logarithmic domain avoids enormous N.
rounding_tests=0
largest_ratio=mp.mpf(0)
for d in range(2,101):
    logs=[mp.mpf(d)**6 * factor for factor in (1, mp.mpf('1.000001'), 2, 10, 100, 10**6)]
    # Solve x(L)=j for the first few admissible j and test both sides of the jump.
    L0=mp.mpf(d)**6
    x0=2*mp.sqrt(L0/(d*mp.log(L0)))
    for j in range(int(mp.floor(x0))+1, int(mp.floor(x0))+4):
        target=mp.mpf(j)**2*d/4
        L=mp.findroot(lambda z:z/mp.log(z)-target,(L0,2*L0))
        assert L>=L0
        logs.extend([L*(1-mp.mpf('1e-40')), L*(1+mp.mpf('1e-40'))])
    for L in logs:
        ell=mp.log(L); x=2*mp.sqrt(L/(d*ell)); delta=mp.floor(x)
        S=mp.sqrt(d*L*ell)
        E=lambda t:4*L/t+9*d*t*mp.log(t)
        assert delta >= 2*d
        assert delta >= mp.mpf(3)*x/4
        assert delta >= mp.root(L,4)
        assert E(delta) <= E(x)*(1+mp.mpf('1e-60'))
        assert E(delta) <= 11*S
        assert mp.log(8*d**3) <= S
        largest_ratio=max(largest_ratio,E(delta)/S)
        rounding_tests+=1

# Evaluate all constant-chain steps in log coordinates, avoiding overflow.
constant_tests=0
for d in range(2,31):
    for delta in (2*d,2*d+1,3*d,10*d):
        D=d*(delta-d+1); p=mp.mpf(d)*(delta*(delta+1)-d*(d-1))/2
        alpha=2*p/(D*(D-1)); B=mp.mpf(4)*d**4*delta**2
        logA=(D-1)*(mp.log(2)+mp.log(B)/alpha)
        K=2*d**4*delta**2
        for q in (mp.mpf(0),p/2,p):
            logH=mp.log(4*d**5*delta**3)+2*(p*mp.log(D)+q*logA)/(D*(D-1))
            logHK=logH+mp.log1p(mp.exp(mp.log(K)-logH))
            bounds=[mp.log(5*d**5*delta**3)+alpha*(mp.log(D)+logA),
                    mp.log(5*d**3*delta**3)+D*mp.log(16*d**4*delta**2),
                    d*delta*mp.log(d**4*delta**5),
                    -mp.log(2)+9*d*delta*mp.log(delta)]
            prev=logHK
            for nxt in bounds:
                assert prev <= nxt
                prev=nxt
            constant_tests+=1
print(f'PASS: {count} exact monomial cases; Taylor identity k=1..30; arc count d=2..300')
print(f'PASS: {rounding_tests} high-precision threshold/floor-jump tests; max E(delta)/S={mp.nstr(largest_ratio,12)} < 11')
print(f'PASS: {constant_tests} high-precision H+K chains')

```

---

### Seventh checkpoint: integrated proof supplement and exact generic suppliers

Author: Codex, `codex-a71f92`, 22 September 2026. Continues issue #1420 and
the handoff-only proof checkpoint #1817. This is partial, unreviewed extraction
work. No Lean file was compiled.

#### What changed, and what did not

The four replacement items and five new missing theorem nodes in #1817's
guarded patch are now in the result JSON. All 119 earlier IDs, the 22 inherited
library objects, eight planned objects, source hashes, pins and earlier
verification records are retained. The entire earlier report is retained
above, followed by the sixth-checkpoint supplement with its authorship. The
five new library nodes are *generic suppliers*, not implementations of the
Bombieri–Pila theorems.

There are now 129 items (27 library, 8 planned, 94 missing), six routes,
87 missing targets routed exactly once and seven deliberately unrouted
diagnostic targets. All 33 definition/construction items retain their API and
test notes. The selected G7 graph records 17 supplier/consumer edges; it is
not a complete dependency graph of the entire paper. No new roadmap owner
is proposed: determinant methods retains its inherited candidate;
intersection theory remains with SF.5 and generic basis reduction with GN.5.

#### Fresh source checks

The [Taniguchi author PDF](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf)
was downloaded afresh, read through all 13 pages including references, and
p.4 was visually checked. SHA-256:
`bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec`.

The [Oxford Bombieri–Pila PDF](https://people.maths.ox.ac.uk/pila/Ovals.pdf)
was downloaded afresh; pp.1–6 and all of §3, pp.10–17, were read, and pp.14,17
were visually checked. SHA-256:
`a46f75e55ddc055050f7924dbea2e5c5655aee32e5e15091eff74d3fc2bbe408`.
These match the inherited records. The remaining BP sections were not read
in this checkpoint.

The displayed exponent in Lemma 7 and the direction of the p,q inequality
are as recorded in E1,E2. E3 concerns the integer admissibility of the
chosen cutoff, not a counterexample to Theorem 4. The missing square in the
main p.4 complex-place volume display is also visible. E1–E4 and their
limited novelty-search history originate with #1817; this worker checked
the displayed formulas and correction arguments, but did not conduct an
independent errata review or repeat all those searches. No `review` verdict
is added.

Public AMS final-PDF access again failed, and the public author pages did not
supply a verified final revision. G0 remains: no claim here about the
typography or mathematical agreement of the revised/published 2020 article.

#### Exact supplier interfaces at the prescribed Mathlib pin

All five statements below were read in the source tree at
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The generic endpoints are already
implemented; the named consuming adapters are not claimed implemented.

| JSON item suffix | Exact declaration(s) | Consumer and remaining adaptation |
| --- | --- | --- |
| `bp-taylor-supplier` | [`taylor_mean_remainder_lagrange_iteratedDeriv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/Taylor.lean#L348) | BP2 uses n=k−1 on unequal endpoints. Convert the Taylor-within coefficients to ordinary derivatives under neighbourhood smoothness; handle equal endpoints separately. The generic remainder does not prove the scaled inequality. |
| `bp-interpolation-supplier` | [`Lagrange.eval_interpolate_at_node`, `degree_interpolate_lt`, `eq_interpolate_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Lagrange.lean#L320) | Interpolate at distinct abscissae. Existence/uniqueness does not itself give the repeated-Rolle derivative witnesses or factorial bounds in the derivative determinant estimate. |
| `bp-vandermonde-supplier` | [`Matrix.det_vandermonde`, `det_vandermonde_ne_zero_iff`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Vandermonde.lean#L219) | Gives the product of differences and the distinct-node criterion, not the analytic bound on the evaluation determinant. |
| `bp-finite-root-supplier` | [`Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Roots.lean#L740) | Contraposition bounds each finite set of roots of a *nonzero* specialization. Still prove F(a,Y)≠0 and natDegree≤d, and exclude identically constant derivative-level equations in polynomial branches. |
| `bp-mean-value-supplier` | [`Convex.norm_image_sub_le_of_norm_deriv_le`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/MeanValue.lean#L728) | BP1 specializes to real functions, C=1 and a compact interval. Neighbourhood smoothness supplies endpoint differentiability. Compact range extrema and nearest-integer translation are separate inputs. |

These distinctions matter at the edge cases. Empty interpolation has
polynomial degree bottom, not natural degree less than zero. Repeated
abscissae violate the interpolation hypothesis. The zero polynomial vanishes
everywhere even though its stored root multiset is empty. A complex or real
mean-value norm bound requires actual differentiability at the endpoints
in the cited version. No wrapper definition or duplicate generic roadmap is
needed for any of these suppliers.

#### Proof audit boundaries

BP1's interval must be restricted to the hull of integer abscissae and
translated by integers. Its range diameter is at most N, and translating by
the integer nearest the range midpoint bounds absolute height by
N/2+1/2≤N for N≥1. This is why an arbitrary real translation is not harmless.

In BP3 use the *least* m with λ^m N<1. Then λ^m N≥λ and
K^m=2^(−m)λ^(−mα)≤2^(1−m)K N^α≤K N^α.
The non-strict stopping condition would mishandle an endpoint at lattice scale.

In BP4, q is the sum of Y-exponents and p the sum of total degrees, so q≤p.
Taking q=p supplies constants uniform in the leading monomial. In BP5,
δ=floor(x) is admissible and E is increasing on [δ,x]; the floor bound is
proved in the preceding supplement, not extrapolated from numerical tests.

BP6 covers finitely many integer points, not the stronger original O(d²)
whole-curve decomposition. Bézout cuts, root simplicity, continuation within
each open strip and inversion of steep branches remain real proof interfaces.
In particular, no smooth extension through a singular endpoint is inferred
from the local implicit function theorem: take the compact hull of the finite
integer-point set inside each smooth branch. The degree-root supplier covers
only the fiber count, not this continuation argument.

The relevant SF.5 and GN.0/GN.1/GN.5 entries of the reviewed library coverage
were read, together with the full SF, GN and completed EffectiveBounds
roadmaps. The audit's partial intersection infrastructure is not an exact
Bézout declaration. The inherited catalogue-wide ownership screen is not
claimed freshly repeated for unrelated routes.

#### Validation

The reproducible script in the sixth-checkpoint supplement was rerun with
Python and mpmath 1.3.0 at 80 decimal digits. It passed:

- 19,720 exact restricted-monomial cases.
- Taylor identities for k=1,…,30 and the piece-count inequality for d=2,…,300.
- 1,188 threshold/floor-jump cases; largest sampled E(δ)/S was 9.8990730442.
- 348 H+K constant-chain cases.

These tests are regression evidence, not proofs. The full-catalogue check
was run against repository snapshot
`a527ccdb2a6c6ae0a1971482ca9cfa4dd9b005f7`, using its complete
`data/atlas.json` and proposed-roadmap catalogue, not empty lookup tables:

```text
python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.result.json
research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.result.json: ok

python3 research/blueprint/intake.py check-files [the result, report and handoff]
3 file(s), 0 problem(s)
```

Custom preservation checks also passed: both baseline blob hashes; all 119
inherited IDs; exactly the four permitted replacements; all 30 inherited
library/planned objects unchanged; original source files, pins and
prerequisites unchanged; earlier verification retained; full historical
report contiguous; counts 129 and 27/8/94; six routes with 87 missing targets
routed once and seven diagnostics withheld; 33 unchanged definition/API/test
notes; 17 selected edges with valid endpoints and no cycle; four source
issues with no invented review verdict. The inherited prerequisite `why`
text remains historical; the current G7 detail supersedes its earlier
rounding-status sentence.

No Lean elaboration or independent review is claimed. G0 and the unresolved
parts of G1–G10 remain explicit. Passing repository checks does not establish
mathematical completeness.

### Eighth checkpoint: the Taylor endpoint adapter

> **Eighth-checkpoint notice — 22 September 2026.** Claude Code, session
> `cc-7b31c4`. This checkpoint adds one section and edits one item note. No
> item is added or removed, no id changes, no route changes, and no
> `sourceIssues`, `gaps`, `verification` or `selectedProofEdges` entry is
> touched. The 129-item result and all seven earlier checkpoints stand; the
> obsolete guarded patch was not reapplied.

Resume item 2 of the previous handoff asked for a genuinely remaining G7
interface to be closed against the prescribed Mathlib pin
`082e2d37e8b0463410cdb532e111cd43d5a66174`, and named four candidates. This
section closes the first of them, the **Taylor-within endpoint conversion**,
and shows that the remaining adaptation recorded for `bp-taylor-supplier` in
the seventh checkpoint's supplier table was over-stated.

#### What the previous note said, and what is actually needed

The seventh checkpoint recorded, for `bp-taylor-supplier`:

> BP2 uses n=k−1 on unequal endpoints. Convert the Taylor-within coefficients
> to ordinary derivatives under neighbourhood smoothness; handle equal
> endpoints separately. The generic remainder does not prove the scaled
> inequality.

Three separate things are bundled there. The first two are now closed; only
the third remains, and its suppliers are identified below.

Note first that the *remainder* side needs no conversion at all. At the pin,
`taylor_mean_remainder_lagrange_iteratedDeriv`
(`Mathlib/Analysis/Calculus/Taylor.lean:348`) already produces an **ordinary**
iterated derivative:

```
lemma taylor_mean_remainder_lagrange_iteratedDeriv {f : ℝ → ℝ} {x x₀ : ℝ} {n : ℕ}
    (hx : x₀ ≠ x) (hf : ContDiffOn ℝ (n + 1) f (uIcc x₀ x)) :
    ∃ x' ∈ uIoo x₀ x, f x - taylorWithinEval f n (uIcc x₀ x) x₀ x =
      iteratedDeriv (n + 1) f x' * (x - x₀) ^ (n + 1) / (n + 1)!
```

Its own proof converts at `x'`, which is interior, using
`Icc_mem_nhds_iff`. What is left in BP2 is therefore the *polynomial* side:
`taylorWithinEval f n (uIcc x₀ x) x₀ x` has coefficients
`taylorCoeffWithin f j (uIcc x₀ x) x₀ = (j!)⁻¹ • iteratedDerivWithin j f (uIcc x₀ x) x₀`
(`Taylor.lean:62`), evaluated at the **endpoint** `x₀`, where `uIcc x₀ x` is
not a neighbourhood.

#### The endpoint is not an obstruction

The conversion lemma at the pin,
`Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean:70`, is

```
theorem iteratedDerivWithin_eq_iteratedDeriv (hs : UniqueDiffOn 𝕜 s)
    (h : ContDiffAt 𝕜 n f x) (hx : x ∈ s) :
    iteratedDerivWithin n f s x = iteratedDeriv n f x
```

and its underlying `iteratedFDerivWithin_eq_iteratedFDeriv`
(`ContDiff/Defs.lean:1040`) has the same three hypotheses. **Neither requires
`s` to be a neighbourhood of `x`.** The smoothness hypothesis is on the
*function* at the point, not on the set. Since `x₀ ∈ uIcc x₀ x` always, and
`uniqueDiffOn_uIcc` (`TangentCone/Real.lean:102`) gives
`UniqueDiffOn ℝ (uIcc x₀ x)` from `x₀ ≠ x` alone, the conversion applies at the
endpoint as soon as `f` is `ContDiffAt ℝ j f x₀`.

This gives the adapter BP2 needs.

**T1 (endpoint form of the Taylor polynomial).** Let `x₀ ≠ x` be reals, let `U`
be open with `uIcc x₀ x ⊆ U`, and let `f : ℝ → ℝ` be `C^{n+1}` on `U`. Then

  `taylorWithinEval f n (uIcc x₀ x) x₀ x = Σ_{j=0}^{n} (j!)⁻¹ · iteratedDeriv j f x₀ · (x − x₀)^j`,

and there is `x' ∈ uIoo x₀ x` with

  `f x − Σ_{j=0}^{n} (j!)⁻¹ · iteratedDeriv j f x₀ · (x − x₀)^j
      = iteratedDeriv (n+1) f x' · (x − x₀)^{n+1} / (n+1)!`.

*Proof.* `UniqueDiffOn ℝ (uIcc x₀ x)` by `uniqueDiffOn_uIcc` from `x₀ ≠ x`.
For `j ≤ n+1`, openness of `U` and `ContDiffOn ℝ (n+1) f U` give
`ContDiffAt ℝ j f x₀` (`ContDiffOn.contDiffAt`, `ContDiff/Defs.lean:963`, with
`U ∈ 𝓝 x₀`). Hence `iteratedDerivWithin j f (uIcc x₀ x) x₀ = iteratedDeriv j f x₀`
for every such `j`, by the lemma just quoted. Feeding this into
`taylorCoeffWithin` and inducting with `taylorWithinEval_succ`
(`Taylor.lean:87`), with base case `taylor_within_zero_eval`
(`Taylor.lean:100`), rewrites the Taylor polynomial as the displayed ordinary
sum. The remainder is then `taylor_mean_remainder_lagrange_iteratedDeriv`
applied with `hf : ContDiffOn ℝ (n+1) f (uIcc x₀ x)`, which follows by
restriction from `U`. ∎

**T2 (equal endpoints).** If `x = x₀` then
`taylorWithinEval f n (uIcc x₀ x) x₀ x₀ = f x₀` by `taylorWithinEval_self`
(`Taylor.lean:109`), so both sides of T1's first display equal `f x₀`, the
remainder is zero, and no point `x'` is needed. The `x₀ ≠ x` hypothesis of the
two cited Taylor lemmas is therefore not a gap in BP2; it is discharged by a
one-line separate case, as the previous note anticipated but did not carry out.

#### What genuinely remains, with its suppliers

Only the third clause of the old note survives: the generic remainder is an
equality at one unknown interior point, whereas BP2 uses the inequality

  `|f x − Σ_{j≤n} (j!)⁻¹ f^{(j)}(x₀)(x − x₀)^j| ≤ (sup_{uIcc x₀ x} |f^{(n+1)}|) · |x − x₀|^{n+1}/(n+1)!`.

Passing from T1 to this needs a supremum over `uIcc x₀ x`, and the suppliers
for that step are also present at the pin:

| Step | Exact declaration | Remaining adaptation |
| --- | --- | --- |
| `iteratedDeriv (n+1) f` is continuous on `U` | `ContDiffOn.continuousOn_iteratedDerivWithin` (`IteratedDeriv/Defs.lean:147`) with `IsOpen.uniqueDiffOn` (`TangentCone/Basic.lean:291`), then the same conversion as in T1 at every point of the open `U` | none beyond instantiating `m = n+1 ≤ n+1` |
| the supremum is attained | `IsCompact.exists_isMaxOn` (`Topology/Order/Compact.lean:246`) with `isCompact_Icc` (`Topology/Order/Compact.lean:55`) and `uIcc x₀ x` nonempty | the statement is about `IsMaxOn`; converting it to a numerical bound on `|f^{(n+1)}|` needs the max of the absolute value, i.e. apply it to `fun y => |iteratedDeriv (n+1) f y|` |

With those two, BP2's scaled inequality follows from T1 by taking absolute
values. Note the hypothesis actually used throughout is `C^{n+1}` smoothness
on an **open set containing** `uIcc x₀ x`, which is strictly stronger than the
`ContDiffOn ℝ (n+1) f (uIcc x₀ x)` hypothesis of the cited remainder lemma. BP2
has it, because there `f` is a polynomial or an algebraic branch on an open
strip; a blueprint must not silently weaken T1 back to `ContDiffOn` on the
closed interval, since without `ContDiffAt` at `x₀` the conversion lemma does
not apply and the coefficients genuinely stay `iteratedDerivWithin`.

#### Boundaries of this checkpoint

No Lean was written or compiled; every citation above is a statement read in
the source tree at the prescribed pin, with file and line. The three other
interfaces named in resume item 2 — rectangular evaluation-rank/kernel
equivalence, the repeated-Rolle derivative witness with its factorial bounds,
and nonzero specialization/degree bounds — are untouched, as are G1–G6 and
G8–G10, the Bézout and branch-continuation interfaces of BP6, and the
acquisition of an authorized final 2019/2020 version. E1–E4 remain proposed,
not accepted, and this worker did not review them. The regression script of
the sixth checkpoint was not rerun in this checkpoint; its recorded results
stand unchanged.

### Ninth checkpoint: the publisher text, and three misprints in arXiv v1

Claude Code, session `cc-d67081`, 2026-09-22. This checkpoint adds no items and
changes no item, route, gap (except G0's detail), prerequisite or boundary other
than `sourceIssueBoundary`. It closes resume item 3 of the eighth handoff with a
negative result, and records three new proposed source issues found by reading
arXiv v1 independently of the inherited extraction.

#### Resume item 3: the final publisher text is not reachable

The eighth handoff asked for an authorized final 2019-revised or 2020 version,
noting that public AMS retrieval had failed for the seventh checkpoint and was
not retried. It was retried on 2026-09-22, and it fails for a structural reason
rather than a transient one, which is worth recording so that later checkpoints
do not spend effort on it again:

- Crossref's record for `10.1090/jams/945` lists two full-text links,
  `https://www.ams.org/jams/2020-33-04/S0894-0347-2020-00945-6/S0894-0347-2020-00945-6.pdf`
  and the accepted manuscript `.../jams945_AM.pdf`. Both return **HTTP 403** to a
  direct request, and with a browser user agent and the article page as referrer
  they return the AMS application shell rather than a PDF.
- The DOI resolves to `https://pubs.ams.org/journals/jams/2020-33-04/S0894-0347-2020-00945-6`,
  whose only link matching the article is
  `/Account/Login?returnUrl=…ProductCode=jams…pii=s0894-0347-2020-00945-6`.
- The AMS metadata served on that page records the journal's open-access type as
  `GREEN` — self-archiving permitted, publisher text restricted. JAMS is not in
  the AMS free-after-five-years programme.

So the public route to this paper is exactly the author copies the earlier
checkpoints used, and G0 stands. G0's detail now carries this evidence. The arXiv
listing was rechecked at the same time: still only v1, no withdrawal or comment.

#### Three misprints in arXiv v1 (E5–E7)

arXiv:1701.02458v1 (12 pp., SHA-256 `99ee35275ecb42c52cd8bbc615538dbe6094326fb72894e88ef82c0b89286871`,
accessed 2026-09-22T18:06:05Z) was read in full. Most of what an independent
reading turns up is already in this file, and deliberately so: the √π volume
display is E4; the `i ≤ n−2` restriction in the quoted Minkowski reduced basis
property is why `reduced-integral-basis` carries its own statement with the
comparison at `i = n−1`; the loose description of the trace length is answered by
`trace-metric-normalization`, which fixes the factor 2 at complex places; the
unreferenced genus-theory step is `relative-genus-source-claim` with G2; and the
two facts §7 uses silently — a k-rational divisor of degree g, and the
identification of Pic⁰(C)(k) with degree-zero rational divisor classes — are
already the items `degree-one-divisor` and `picard-divisor-comparison`.

Three places appear to be recorded nowhere in this file:

- **E5, §5.1 p.7.** The coefficient bounds of the auxiliary curves are printed as
  `|A| ≤ |Disc(K)|^{1/3}, B ≤ |Disc(K)|^{2/3}, C ≤ |Disc(K)|`. A, B and C come
  from expanding `f_β(m) = Norm(β − m)` over a box symmetric about the origin, so
  all three take both signs, and `|Disc(E)| ≪ |Disc(K)|²` needs absolute values
  on all three.
- **E6, Remark 7.2 p.10.** The class number formula is printed as
  `|Pic⁰(C)(k)| = |k|^g log|k| · Res_{s=1} ζ_C(s)`, omitting the factor
  `1 − |k|^{-1}`. From `Z(T) = P(T)/((1−T)(1−|k|T))` the residue at `s = 1` is
  `P(|k|^{-1})/((1 − |k|^{-1}) log|k|)`, and the functional equation gives
  `P(|k|^{-1}) = |k|^{−g}P(1)`. The factor lies in `[1/2, 1)`, so the remark,
  which compares only growth in g, is unaffected.
- **E7, Remark 7.3 p.10.** In characteristic 2 the 2-torsion of the Jacobian over
  k̄ is said to have size `2^g`; it has size at most `2^g`, namely `2^f` for the
  2-rank f, which is g exactly in the ordinary case and 0 for a supersingular
  Jacobian. Only the upper bound is used, and the conclusion that Theorem 7.1
  beats this bound only for `k = F_3` is correct as it stands.

All three were checked on page images rendered from the v1 PDF. They are located
in **arXiv v1 only**: the February 2017 author copy behind E1–E4 and the
publisher text were not consulted for them, and a reviewer must re-locate them
before treating them as errata against another version.

#### Boundaries of this checkpoint

No Lean was written or compiled. No item was added, removed or edited, and the
item list is byte-identical to the base blob; the checks below were run on the
edited file. This worker did **not** review the inherited items, routes, gaps or
the proposed issues E1–E4, did not repeat their novelty searches, and did not
touch G1–G10 beyond G0's detail. The arithmetic of `feedback-constants` was
recomputed independently in passing and agrees with the recorded test intervals
(β = .27823867, a = .27843374, c = .11176708), as does the exponent
`1/2 + a = .77843374` of Theorem 1.4; this is a spot check, not a review of that
item. The four decimal constants printed in the paper are correct.

### Tenth checkpoint: rectangular kernels and analytic determinant adapters

Codex, session `codex-a71f92`, 23 September 2026. This is a partial
continuation of #1420 and PR #1964, not an independent review. All 129 inherited
item IDs and the entire preceding report survive. Six inherited item objects
are refined, and nine are added: three exact generic library suppliers and six
missing application adapters. The result has **138 items: 30 library, eight
planned and 100 missing**. Six routes take 93 missing items exactly once; the
same seven diagnostic source claims remain deliberately unrouted. This does
not meet the protocol's complete-extraction criterion.

This section supersedes the earlier G7 status sentences about the
rank/kernel, derivative-witness and Taylor adapters. It does not supersede
the other checkpoints' mathematical work or silently convert missing
application lemmas into library declarations. In particular, the eighth
checkpoint's Taylor endpoint proof is credited and integrated, not rediscovered.
Its suggestion that a supremum upper bound completes BP2 requires a
distinction: BP2's short-interval argument uses a **lower bound** at the
Taylor witness. Both directions are stated separately below.

#### Reading, pins and ownership

The freshly retrieved February 18, 2017 author copy was read completely,
including all §§1–7 and references. Its SHA-256 is
`bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec`.
The [Oxford Bombieri–Pila author preprint](https://people.maths.ox.ac.uk/pila/Ovals.pdf)
was freshly retrieved with SHA-256
`a46f75e55ddc055050f7924dbea2e5c5655aee32e5e15091eff74d3fc2bbe408`;
pp.1–6 and all of §3, pp.10–17, were read. Its pp.7–9, §4 and appendix are
not claimed read in this continuation. No new visual inspection or authorized
final-publisher-text comparison was performed. The main-paper DOI and author
publication metadata identify JAMS 33 (2020), 1087–1099; they do not prove that
the 2017 mathematical text agrees with the final revision. G0 survives, and
the already repeated publisher-access attempts were not used as the substance
of another checkpoint.

Every new generic declaration claim was checked in the source at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti remains pinned at
`f790474821cf4256814db967cb154e7af3d0c369`.
The current upstream Completed/EffectiveBounds and AlgebraicCurves documents
were read completely. Their historical statements about library absence were
not treated as the current audit: the relevant reviewed EffectiveBounds and
SF.0/SF.5 audit rows were inspected separately. SF.5 still owns proper
intersection and Bézout; the upstream function-field curve roadmap neither
supplies this determinant method nor gets re-planned. The inherited proposed
IntegralPointDeterminantMethods route receives the six application adapters.
No new polynomial, matrix, interpolation or derivative carrier is introduced.

Targeted pinned-library searches found no exact repeated-Rolle interpolation
witness or rectangular monomial-evaluation theorem already supplying these
applications. The generic results below do supply their components. A
catalogue search for this candidate and its specific adapters found no
separate accepted owner; the existing six-route split is retained, not
redesigned. This continuation does not re-audit every inherited library or
planned item.

#### R1. Rectangular evaluation and supported coefficients

Let F be a field, M a finite **set** of exponent vectors for two variables,
S any finite point-index type, and z:S→F². We use MvPolynomial (Fin 2) F,
not a private polynomial carrier. For c:M→F define

Φ_M(c) = Σ_(m∈M) monomial m(c_m),  A_(s,m)=z_s^m.

The coefficient of exponent e in Φ_M(c) is c_e when e∈M and zero
otherwise, by the actual coefficient-of-sum and coefficient-of-monomial
identities. Thus Φ_M(c)=0 exactly when c=0. Conversely, the existing
monomial basis reconstructs any polynomial Q from its coefficient vector.
If support Q⊆M, the reconstruction may be indexed by M. This proves the
linear equivalence from F^M to the supported-polynomial subspace. The
evaluation-of-sum and evaluation-of-monomial identities give

eval_(z_s)(Φ_M(c)) = Σ_(m∈M)c_m z_s^m = (A.mulVec c)_s.

This coefficient/evaluation compatibility is promoted to
`bp-supported-coefficient-equivalence`, since the rank/kernel theorem
consumes it. The monomial-system definition now has structured API, uses and
four tests; the old terse note is not the only specification.

At the pin, Matrix.rank A is the finrank of the range of A.mulVecLin.
Apply rank-nullity to this map F^M→F^S. The finite-function-space dimension
is |M|, so

rank A + dim_F ker A = |M|.

The kernel is finite-dimensional, and positive finrank is equivalent to
having a nonzero element. Combining the two displayed identities proves

rank A < |M|  iff  a nonzero Q supported in M vanishes at every z_s.

Nothing here assumes |S|=|M|. Duplicated points repeat rows harmlessly.
Duplicated exponent **indices** would instead destroy coefficient
injectivity, which is why M is a Finset, not a list with repeated monomials.
For M=∅ there is no nonzero supported polynomial and rank<0 is false.
For S=∅ and M nonempty the evaluation map has zero target, and any monomial
with coefficient 1 witnesses the equivalence.

This closes the mathematical rectangular rank/kernel reduction with exact
generic interfaces; the derived statement remains missing as an application
declaration. It does **not** also claim the distinct assertion that a
full-column-rank rectangular matrix has a nonzero D-by-D row minor.
Bombieri–Pila Lemmas 2 and 4 need that selection step, which remains G7.

#### R2. Repeated Rolle without a fictitious common point

For n≥1 let a_0<...<a_n be real nodes, U an open set containing their closed
hull, and h a C^n function on U vanishing at every node. For each r<n,
the rth derivative is continuous and differentiable on U. This follows from
the pinned within-derivative continuity/differentiability statements:
open sets have UniqueDiffOn, and within and ordinary iterated derivatives
agree on an open set. Their equality on a neighbourhood also justifies the
differentiability transfer, not just a pointwise rewriting.

Apply the HasDerivAt version of Rolle between each pair of consecutive
zeros. There are n resulting zeros of h', each strictly between its two
predecessors, so they are distinct and ordered. Repeat between consecutive
zeros of h', then h'', and so on. After n rounds a zero of h^(n) lies
strictly between a_0 and a_n. Every closed interval used is contained in U,
and each differentiability order is strictly below n when another derivative
is taken. This is the item `bp-iterated-rolle`.

The HasDerivAt hypothesis matters. The totalized derivative operator may be
zero at a nondifferentiable point; using that value would not justify the
analytic argument. For n=0 the original value is zero at the sole node,
but there need not be an interior point. The zero-order case is separate.

#### R3. The factorial-normalized interpolation witness

Let p interpolate f at a_0,...,a_n, with f C^n on the same open U.
The pinned Lagrange statements give degree p≤n and p(a_i)=f(a_i).
Polynomial evaluation is smooth, so h=f−p meets R2.

Analytic differentiation of polynomial evaluation agrees with formal
polynomial differentiation. Iterating that identity, the coefficient formula
at the pin says that coefficient m of derivative^[n] p is

(m+n).descFactorial(n) · coeff_(m+n) p.

For m>0 it vanishes by the degree bound; for m=0 it is n! coeff_n p.
Thus p^(n) is the constant n! coeff_n p. At R2's point ξ,

0 = f^(n)(ξ) − n! coeff_n p.

Factorials are nonzero in ℝ, so coeff_n p=f^(n)(ξ)/n!. If the normalized
derivative has absolute value ≤B on the interval, so does this coefficient.
For n=0 use the constant singleton interpolant instead.

This is `bp-interpolation-derivative-witness`. In the determinant
application there is one such argument for **each prefix length and each
column**. The witness is ξ_(r,j), not a single ξ for the whole matrix.
For example, interpolating x² and x³ at 0,1 produces slope 1 in both
columns, but their derivative witnesses are 1/2 and 1/√3 respectively.
No common point works. The cubic polynomial test also catches a lost
factorial: coeff_3 X³=1 but its third derivative is 6.

#### R4. Newton factorization and the determinant exponent

Use zero-based indices 0,...,D−1. For arbitrary column values Y_(i,j),
let p_(r,j) be their interpolant at x_0,...,x_r and set
B_(r,j)=coeff_r p_(r,j). Let

W_r(X)=∏_(t<r)(X−x_t),  L_(i,r)=W_r(x_i).

These are explicit expressions in the existing polynomial carrier, not a
new Newton-polynomial structure. We first prove

p_(r,j)=p_(r−1,j)+B_(r,j)W_r  for r≥1.

Indeed the difference has degree<r, because W_r is monic of degree r and
the degree-r coefficient cancels. It vanishes at the first r nodes.
The existing interpolation uniqueness theorem therefore makes it zero.
For r=0 the interpolant is the constant B_(0,j). Induction gives
p_(D−1,j)=Σ_(r<D)B_(r,j)W_r, and evaluation gives Y=L B.

When i<r, L_(i,r)=0. Its diagonal entry is ∏_(t<i)(x_i−x_t).
The pinned determinant-of-product and lower-triangular determinant
identities give

det Y = [∏_(t<i)(x_i−x_t)] det B = V det B.

This is `bp-newton-determinant-factorization`, the algebraic
content of the source's Proposition 2 in the library's interpolation
vocabulary. It works for singular value matrices too.

For the analytic application, order the nodes increasingly; a permutation
only changes the determinant sign. R3 gives, separately for each entry,

|B_(r,j)| ≤ N^(1−r) ||f_j||_(N,D−1;I).

The r=0 entry uses f_j(x_0). Expanding the D-by-D determinant into D!
terms, every term contains each column once, while its total power of N is

Σ_(r=0)^(D−1)(1−r)=D(3−D)/2.

Therefore

|det(f_j(x_i))| ≤ |V| D! N^(D(3−D)/2) ∏_j ||f_j||_(N,D−1;I).

All exponent subtraction is in integers/reals, never truncated naturals.
For D=1 this is |f_1(x_0)|≤N||f_1||_(N,0). For repeated nodes use the
zero determinant directly instead of attempting interpolation. No division
by a potentially zero norm occurs. The structured proof of
`bp-derivative-determinant` records these steps. The separate
normalized product/monomial estimates feeding integral determinant
separation still require their detailed adapter decomposition.

#### R5. Taylor endpoints and the lower-bound argument

The eighth checkpoint's T1–T2 become `bp-taylor-endpoint`.
For unequal a,b and C^(n+1) smoothness on an open U containing uIcc(a,b),
uniqueDiffOn_uIcc supplies unique derivatives on that interval. Openness of
U gives ContDiffAt at the endpoint a. The within-to-ordinary conversion
requires membership in the interval, not that this interval itself be a
neighbourhood of a. Expanding taylorWithinEval with its zero and successor
formulas therefore yields ordinary coefficients f^(j)(a)/j!. Restricting
smoothness to the interval then applies the library Taylor remainder,
whose derivative at its interior witness is already ordinary.

When a=b, Taylor self-evaluation and the ordinary finite sum both equal
f(a). The remainder is zero. There is no claim of a witness in the empty
open interval and no invalid UniqueDiffOn argument for a singleton.

For BP Lemma 7, assume k≥1, A,N>0, a≤b and neighbourhood C^k smoothness.
The derivative hypotheses are

|g^(i)| ≤ i! A^(i/k)N^(1−i)  (0≤i<k),
|g^(k)| ≥ k! A N^(1−k).

The degenerate interval is immediate. Otherwise let l=b−a>0 and use Taylor
of order k−1. Taking the absolute value of its remainder and applying the
**lower** derivative bound at its unknown point ξ gives

A N^(1−k) l^k
≤ |g(b)−g(a)−Σ_(i=1)^(k−1)g^(i)(a)l^i/i!|
≤ 2N+Σ_(i=1)^(k−1)A^(i/k)N^(1−i)l^i.

Thus t=l A^(1/k)/N satisfies t^k≤2+Σ_(i=1)^(k−1)t^i. Since

t^k−Σ_(i=1)^(k−1)t^i−2=(t−2)Σ_(i=0)^(k−1)t^i

and the last sum is positive for t≥0, one has t≤2, including k=1.
Consequently l≤2A^(−1/k)N. This confirms the correction already recorded
as proposed source issue E1; it adds no new review verdict.

This proof does not use an upper bound on sup |g^(k)| to infer a short
interval. The ordinary endpoint statement is explicitly scoped to
neighbourhood smoothness. The source's broader classical closed-interval
notation is not silently identified with Mathlib's ContDiffOn on a closed
set and its potentially different ordinary endpoint derivatives. The
compact graph hulls in the chosen proof lie inside smooth open branches;
constructing those branches is still a separate G7 obligation.

#### R6. The genuine absolute-maximum upper bound

The upper-bound theorem is useful in its own right and for the norm
interface. Smoothness on the open U makes f^(n+1) continuous there, by
the pinned within-derivative continuity theorem and open-set conversion.
The function x↦|f^(n+1)(x)| is therefore continuous on the compact,
nonempty interval uIcc(a,b), including when a=b. Apply the exact compact
maximum theorem to this **absolute-value function**, obtaining an attained
value M≥0 with |f^(n+1)(x)|≤M throughout the interval.

For unequal endpoints, R5's remainder equality now gives

|f(b)−Σ_(j=0)^n f^(j)(a)(b−a)^j/j!|
≤ M |b−a|^(n+1)/(n+1)!.

For equal endpoints both sides are zero. This is
`bp-taylor-absolute-bound`. Applying the same maximum argument
to each r≤k and then taking a finite maximum justifies attainment in the
refined scaled-derivative-norm definition. Its structured API includes the
normalized derivative bound, simultaneous interval/scale dilation, and the
source's normalized product estimate; the latter is not claimed supplied
by compactness.

The distinction between max |h| and |max h| is material. For f(x)=−x³,
a=1, b=2 and n=1, the remainder has magnitude 4. The maximum of |f''|
is 12, giving the valid bound 6; the absolute value of the maximum of
f'' is only 6, giving the false proposed bound 3.

#### Exact generic supplier ledger

The result's verification.declarationsRead records the full 34-entry ledger
with paths, locators, supplied statements and the pin. The main interfaces are:

| Application | Existing supplier | Adapter boundary |
| --- | --- | --- |
| Supported polynomial coefficients and evaluation | MvPolynomial monomial basis, coefficient-sum/monomial and eval₂-sum/monomial identities | Restricted finite support and rectangular matrix orientation are proved in R1. |
| Rank deficiency | Matrix.rank, LinearMap.finrank_range_add_finrank_ker, finite-function dimension and positive-dimension criterion | No square assumption; nonzero row-minor selection is separate. |
| Repeated Rolle | exists_hasDerivAt_eq_zero; iterated-derivative continuity, differentiability and open-set conversion | Ordered interleaving induction is R2. |
| Interpolation coefficient | Lagrange evaluation/degree/uniqueness; Polynomial.deriv and coeff_iterate_derivative | R3 retains factorials, zero order and entrywise witnesses. |
| Determinant factorization | Lagrange uniqueness; Matrix.det_mul and det_of_isLowerTriangular | R4 uses one explicit lower-triangular Newton evaluation matrix. |
| Taylor endpoints | Taylor remainder, uniqueDiffOn_uIcc, ContDiffAt and within/ordinary conversion | Open-neighbourhood hypothesis and equal-endpoint branch stay explicit. |
| Absolute maximum | IsCompact.exists_isMaxOn and isCompact_Icc | Apply to the absolute derivative, not its signed maximum. |

The three new library items state only rank-nullity, the HasDerivAt Rolle
theorem and real-valued maximum attainment. The six composed application
statements retain status missing. No Lean artifact was written or compiled.

#### Checks and remaining work

A scratch-only standard-library Python script uses exact rational arithmetic,
not floating-point sampling, and passes **11,765 diagnostic assertions**.
It checks rank-nullity and kernel vectors for small rectangular matrices,
including empty dimensions; supported monomial evaluation at repeated
points; interpolation and Newton factorization for deterministic value
matrices of dimensions one through five; polynomial derivative factorials;
the signed-maximum counterexample; the zero-order branch; and the geometric
sum identity including k=1. These finite checks neither prove the real
analytic statements nor establish completeness.

Repository checks and preservation checks are recorded in the handoff and
verification block. G0–G10 remain. G7 now asks specifically for the
full-rank-to-row-minor interface, normalized monomial/product-bound
decomposition, nonzero specialization and degree estimates, SF.5 proper
Bézout closure, analytic root continuation and inverse graphs, full recursive
supplier accounting and independent verification. It does not ask a future
worker to redo the endpoint or repeated-Rolle arguments as though they had
never been supplied.

No new source issue was added. E1–E7 remain unchanged and proposed; no
independent verdict is invented. The older relative-genus, torus,
hyperelliptic, del Pezzo, original counting-source and function-field
uniformity gaps are not resolved by this determinant-method continuation.
