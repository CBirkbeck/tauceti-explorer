# FIX-RT-PAPER-GAMBURD-MAGEE-RONAN-19

Codex `codex-J6LwjP`, 30 September 2026. Refs #4984. Bot comment 5916678042 confirmed claim 5916675446; the full issue was reread after confirmation. Base `99c76ec`. The issue excerpts three findings, but the full verifier confirms seven; this report addresses all seven.

## Result

The extraction has 50 stable items (original 1–43 retained; 44–50 added), with 1 library, 1 planned and 48 missing. Four routes contain 5/20/22/1 missing items. There are 20 prerequisites and 18 source issues. Only the four assigned deliverables and this job's handoff are edited. No upstream roadmap or generated queue is changed.

This fixes the extraction and its source/version/ownership records. It does not complete future C¹, spectral, uniform-renewal or polynomial-counting proofs. Those have explicit owners and open obligations. The independent REV-FIX job must review the new work; the earlier independent preprint review is preserved as history.

## Seven verified findings

1. **/1 — published collation.** Read all 59 publisher pages, including references, and compare the recorded defects against v3. E7 and E11 are fully corrected in Annals Lemmas 29–30 and (3.28), pp.784–786. E2/E4/E5/E8/E17 are partly corrected, with the surviving components narrowed in their active fields. E9's (5.1) comparison remains printed, but its (5.9)/(5.10) proof slips, and E17's (5.5) proof slips, belong to the preprint supplement expressly cited on Annals p.802. Every original item now has dual locators. Annals inserted Examples 16–17, shifting subsequent result numbers by two. All original 17 issue objects, including their review objects, remain verbatim inside `versionHistory`; active published findings do not inherit those verdicts. The review Markdown is annotated by this fix worker and retains the old first-person review under a dated historical heading. Fresh scopes, dates, URLs and hashes are in `sourceVersions`. No old worker is credited with reading Annals.

2. **/2 — Tauberian supplier.** Item 41 now contains the application hypotheses, residue and uniformity obligation. New item 48 refers to PAPER-WOOD-19/286, simple-pole case, and coalesces with exactly its accepted route 10 owner/title/area. Since no supplier stage exists, it remains missing with a prerequisite/gap and `DESIGN-ArithmeticDirichletSeriesPartII` dependency, not planned at a bare roadmap id. Route 4 records shared ownership to satisfy exact-once missing-item routing; it is not a second scalar theorem plan. The transfer design proves nonnegativity, monotonicity, local finiteness, transform convergence, boundary continuation and the pole coefficient B(w)=hβ(w)/(β|λ′β|), with νβ(1)=νβ(hβ)=1. The ratio ≥3/2 supplies λ′β≤−log(3/2)λβ<0. Uniform-in-w convergence remains an explicit analytic/contour or uniform-Tauberian obligation; continuity plus pointwise limits is insufficient. The Kato item also states the needed complementary resolvent hypothesis, and its inverse formula is restricted away from λ_s=1. E16's active explanation now includes the missing s⁻¹ factor correctly.

3. **/3 — unsupported imports.** Fresh pinned reads confirm Mathlib's real and complex p-series declarations, `spectralRadius`, and `mellin`. `ContDiffMapSupportedIn` is globally smooth and zero off K, not the needed C¹(K); new item 46 specifies relative-interior differentiability, continuous boundary derivatives, affine-span convention, value-plus-derivative norm, a closed-jet completeness construction and composition. New item 47 gives complex bilateral/zero-extension/renewal/Mellin adapters, sharing the one-sided convention with the Tauberian supplier. It includes convergence, holomorphy and change-of-variable obligations, with Mellin parameter −s. Tau Ceti's real-parameter transform of measures on ℝ≥0 remains existing work, not a substitute for this complex transform. No generic transform is planned twice.

4. **/4 — split the Gauss example.** Item 30 is narrowed to PM.4's base Gauss map and normalized density 1/((1+x)log 2). Item 44 covers multiplication by (x+1)^s conjugating the GMR branch weight to (x+A+1)^(−s), for complex Re s>1 and positive real bases. Item 45 covers the missing C¹ spectral theorem as the n=3 specialization of route 3. The unnormalized Gauss eigenfunction 1/(1+x), probability density, and GMR eigenfunction x+1 are distinguished. The PM.4 reviewed audit and packet do not prove this spectral coverage.

5. **/5 — prerequisite register.** Added PP90 Theorem 2.2 (finite-type comparison), ITM50 (two-norm method), the original Pollicott Rauzy notes with their unfulfilled access request, Baladi (background) and Lalley 1988 (historical precursor). The sixth new prerequisite is the scalar Wood supplier. The chosen RPF proof route adapts Liverani's cone method to countably many summable branches; the adaptation is not discharged by a bibliography entry. Annals p.808 labels the Rauzy notes [Pol] and *Apollonian circle packings* [Pol14], while its body cites [Pol14] on pp.797/799. The verifier's correction of the original finding is respected: these are not equated. The later Aimino–Pollicott survey was not substituted for the unobtained original. Lalley 1988's publisher metadata gives pp.699–709, whereas v3's bibliography prints 699–710; this is recorded rather than silently attributing a fresh full read.

6. **/6 — Jacobian typo.** New E18 records w₂/(2−w_i)² in row 3 column i, for i>3, of both v3 p.46 and Annals Table 1 p.804. The derivative is w₃/(2−w_i)². Both page images were inspected. Exact differentiation of the projective map confirms the subsequent column sum (1+2β(w)−2w_i)/(2−w_i)², so the norm bound is unaffected. E18 has no copied review verdict. Its `known:new` is accompanied by a dated, bounded search record, not an assertion of exhaustive novelty. Item 43 and the reader are synchronized.

7. **/7 — existing reuse and canonical jobs.** Items 1 and 5 explicitly reuse CA.4's `positive-markoff-triples`, `markoff-vieta-involution`, `markoff-descent-inequality` and `markoff-root-generation` for n=a=3,k=0. General (n,a,k) items 1–5 remain missing. The n=3,a=1 specialization coalesces with Ghosh–Sarnak's source contract. The current packet is already partial after merged PR #5217, so no redundant reopening is requested. Its full GMR source decomposition is still absent and lies outside this issue's allowed files. `blueprintRequests` records the exact continuation and #1025 queue refresh, jointly with the Chen/Ghosh–Sarnak maintenance. Three canonical design jobs replace obsolete job references; accepted paper-route ids remain aliases. Dependencies are acyclic: scalar supplier → transfer theory → Markoff dynamics, and CA.4 → Markoff dynamics. These timing updates do not retroactively invalidate the original ownership choice.

## Additional published inventory and consistency fixes

Full reading found published Examples 16–17 absent from the 43-item preprint inventory. Items 49–50 add the Chebyshev orbit construction and polynomial degree-count endpoint to route 2. Example 17 explicitly defers a detailed proof, so it is an open source obligation rather than a consequence asserted from the integer-count theorem. The Chebyshev item claims closure and the orbit inclusion, not that all possible index triples are in one orbit.

The active E6 correction now carries the dependence on k′ already required by its historical review. The E8 explanation notes failure for every s>1. E16's residue includes both s⁻¹ and the stated normalization. The current summary and reader replace stale 43-item/three-route claims. Historical growth and random contraction checks are explicitly historical; they are not reported as freshly rerun.

## Source and library evidence

| Text | Actual reading in this fix | SHA-256 |
| --- | --- | --- |
| [Published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p02-s.pdf) | Full pp.751–809, including references; images pp.777,784,785,801,802,804 | `c5e7ebb5322cdfd455735f13c2b420dba318089b382a3f78f40628efc838215a` |
| [arXiv v3 PDF](https://arxiv.org/pdf/1603.06267v3) | Focused pp.17,18,20–22,25,28–30,42–44,49,53,56; p.55 bibliography excerpt; p.46 image | `965e264e260ca42bbaa5a65f789e5cc6eb6117d70d7219603a3b855d29ba997a` |

The full historical v3 readings retain their original 22/23 September attributions. The current published reading is dated 30 September 2026. The published revision is 21 January 2019; online publication was 28 October 2019. Bounded title/erratum and publisher checks found no explicit separate correction notice. Partial corrections are classified as such even though the errata collector's coarse `known` categorization cannot split a mixed entry; exact surviving scopes are in the active fields and `sourceCollation`.

Pinned declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: `Real.summable_one_div_nat_rpow` (Analysis/PSeries.lean:317), `Complex.summable_one_div_nat_cpow` (Analysis/PSeriesComplex.lean:25), `mellin` (Analysis/MellinTransform.lean:91), `ContDiffMapSupportedIn` (Analysis/Distribution/ContDiffMapSupportedIn.lean:97–101) and `spectralRadius` (Analysis/Normed/Algebra/Spectrum.lean:82). Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` supplies its different `laplaceTransform` in Analysis/CompletelyMonotone/Laplace/Representation.lean:73. Audits for PM.4 and the arithmetic Dirichlet-series parent were read. No existing sharp generic scalar theorem or complex function-transform supplier stage was falsely marked built.

## Maintainer continuation

- Extend the existing partial CA.4 packet with exact source items GMR/1–5, reusing its coefficient-three nodes and the n=3,a=1 Ghosh–Sarnak specialization. The general source needs carrier/move, exceptional-family, positive-reduction and descent contracts before it can be imported unconditionally by the Markoff design.
- Refresh #1025 from accepted sources jointly with CHEN-24/5 and GHOSH-SARNAK-22/2, already noted by PR #5217. The live body read for this fix did not mention GMR/Ghosh–Sarnak. Do not create another infrastructure job for the same refresh.
- Wire the pending canonical Tauberian supplier to transfer theory, then transfer theory to Markoff dynamics; preserve proposal aliases for coalescence. No edits to upstream Tau Ceti roadmaps are requested.

## Validation

- Paper checker: pass, 50 items, four routes.
- §18 `source_issues.check_issues` and `check_errata.versions_checked`: pass. The standalone errata CLI expects an errata-v1 ledger, so these are its applicable checks for this extraction.
- Intake `check-files` on all five changed files: pass.
- Original item ids and original 17 issue/review histories preserved; every missing item routed exactly once; no other status routed; canonical dependency graph acyclic; assigned-file scope and whitespace: pass.
- Fresh regression output: 160 complex/real conjugacy cases; 20 exact telescoping sums with tails; 300 exact derivatives and column sums; four exact resolvent cases; rigorous exclusion of the false spectral upper bound; 121 polynomial equation/Vieta identities.
- No blueprint packet or suggested Lean file is assigned here. No Lean compilation was attempted, and no pinned build/project/cache/LSP was created.

## Reproduce fresh calculations

Python 3 standard library only. These are finite regressions supporting the corrected formulas, not proofs of infinite-dimensional spectral or asymptotic theorems. Save and run the following code. Source downloads and scratch are removed after PR submission; this code and the source hashes preserve the reproducible evidence.

```python
from fractions import Fraction as F
import cmath
import math

# Branchwise conjugacy, including nonreal parameters; no sum exchange assumed.
cases = 0
for x in [0, .1, .5, .9, 1]:
    for s in [1.1, 2, 2+3j, 1.5-2j]:
        for A in [0, 1, 2, 4, 10, 30, 100, 1000]:
            t = 1/(x+A+1)
            f = 1+t+1j*t*t
            lhs = (x+1)**(-s)*((x+1)/(x+A+2))**s*(t+1)**s*f
            rhs = (x+A+1)**(-s)*f
            assert abs(lhs-rhs) < 1e-12*max(1, abs(rhs))
            cases += 1
print('Gauss conjugacy:', cases, 'complex/real branch checks')

# Exact finite telescoping verifies the Gauss s=2 eigenfunction and tail.
for x in map(F, [0, F(1,10), F(1,2), F(9,10), 1]):
    for N in [1, 2, 10, 100]:
        total = sum(1/((x+k)*(x+k+1)) for k in range(1,N+1))
        assert total == 1/(1+x)-1/(N+1+x)
assert math.log(2) != 1  # integral of 1/(1+x), before probability normalization
print('Gauss eigenfunction: 20 exact sums with exact tails')

# Exact directional dual numbers differentiate the projective map itself.
class D:
    def __init__(self, v, d=0): self.v,self.d=F(v),F(d)
    def __add__(self,o):
        if not isinstance(o,D): o=D(o)
        return D(self.v+o.v,self.d+o.d)
    __radd__=__add__
    def __neg__(self): return D(-self.v,-self.d)
    def __sub__(self,o): return self+-asD(o)
    def __rsub__(self,o): return asD(o)+-self
    def __truediv__(self,o):
        o=asD(o)
        return D(self.v/o.v,(self.d*o.v-self.v*o.d)/(o.v*o.v))
def asD(o): return o if isinstance(o,D) else D(o)
count=0
for d in range(4,9):  # d=n-2; i>3 in the displayed one-based pattern
    for scale in range(1,21):
        w=[F(k,scale*4*d*(d+1)) for k in range(1,d+1)]
        beta=sum(w)
        assert beta<=F(1,2) and max(w)<=1-beta
        for i in range(3,d):
            z=[D(v,int(j==i)) for j,v in enumerate(w)]
            numerators=[v for j,v in enumerate(z) if j!=i]+[1-sum(z)]
            column=[(v/(2-z[i])).d for v in numerators]
            assert column[2] == w[2]/(2-w[i])**2
            assert column[2] != w[1]/(2-w[i])**2
            assert sum(map(abs,column)) == (1+2*beta-2*w[i])/(2-w[i])**2
            count+=1
print('Published Jacobian:',count,'exact derivatives and column sums')

for lam in [F(-1,2),F(1,3),F(2,3),F(3,2)]:
    assert 1/(1-lam)==lam/(1-lam)+1
    assert 1/(1-lam)!=1/(1-lam)+1
# Rigorous integral bound on the omitted positive p-series tail.
N=10000
series=sum(F(1,k*k) for k in range(3,N+1))
assert 2*(series+F(1,N))<1<4*series
print('Resolvent: 4 exact cases; false spectral upper bound excluded')

# Integer polynomial arithmetic, not just evaluations at selected integers.
def add(p,q):
    r=[0]*max(len(p),len(q))
    for j,v in enumerate(p):r[j]+=v
    for j,v in enumerate(q):r[j]+=v
    while len(r)>1 and r[-1]==0:r.pop()
    return r
def neg(p):return [-v for v in p]
def mul(p,q):
    r=[0]*(len(p)+len(q)-1)
    for i,a in enumerate(p):
        for j,b in enumerate(q):r[i+j]+=a*b
    while len(r)>1 and r[-1]==0:r.pop()
    return r
P=[[2],[0,1]]
for k in range(1,20):P.append(add(mul([0,1],P[-1]),neg(P[-2])))
count=0
for h in range(11):
    for i in range(11):
        a,b,c=P[h],P[i],P[h+i]
        residual=add(add(add(mul(a,a),mul(b,b)),mul(c,c)),neg(add(mul(mul(a,b),c),[4])))
        assert residual==[0]
        assert add(mul(a,b),neg(c))==P[abs(h-i)]
        count+=1
print('Published Chebyshev example:',count,'exact polynomial equations and Vieta identities')

```
