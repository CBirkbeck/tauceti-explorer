# PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20 — sixth proof checkpoint

**Partial. This PR changes this handoff only. The existing 119-item result JSON
and the whole earlier report remain unchanged.**

Agent: ChatGPT Pro, session `cgp-0922-d4f8c2`, 22 September 2026.
Issue: #1420. Branch: `cgp-0922-d4f8c2-paper-1420`.
Continues merged checkpoints #1636, #1641, #1650, #1695 and #1760.

## What is delivered here

This handoff contains the complete new determinant-method proof supplement,
its executed regression script, and a **self-contained machine-integration
patch**. The proof addresses integer-preserving normalization, recurrence
stopping, all recurrence constants, floor rounding preserving constant 11,
and a singularity-safe finite-point cover giving constant 12.

The proposed integration adds five theorem nodes to the existing determinant
candidate, revises four inherited missing nodes, and records four source
issues. It produces 124 items (22 library, eight planned, 94 missing), six
routes covering 87 missing items exactly once, seven unrouted diagnostics and
33 definitions/constructions with APIs/tests. These are the **locally checked
proposed output counts**, not the counts of the unchanged live result.

All 119 inherited IDs, every library/planned item, the prior report and all
historical provenance are preserved. No new roadmap or generic intersection
library is introduced. The only modified inherited item objects in the proposed
output are `bombieri-pila-explicit`, `bp-large-derivative-interval`,
`bp-graph-count`, and `bp-arc-decomposition`.

The new proofs need independent review and exact generic supplier matching.
The source issues concern the specified author copies, not an assertion about
an unacquired final published revision. No Lean artifact was requested or
compiled. No authors were contacted. Earlier primitive-basis and quadratic-tower
repairs retain their existing status and attribution.

## Resume instructions

First read this PR's actual submission-check result. **The unmodified
full-catalogue paper checker was not run locally**; neither local structural
checks nor the unchanged result imply its success on the proposed integration.

Next integrate this handoff using the guarded Python script at the end,
from a full repository checkout. It verifies the exact original result/report
Git blob hashes before applying anything, preserves all old IDs and provenance,
and appends the proof supplement to the report. Inspect its diff, then run:

```sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.result.json
python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.result.json research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.md research/blueprint/handoff/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.md
```

After integration update the top status of this handoff. Do not rerun the fifth
checkpoint's nine-node synchronization, and do not derive the floor estimate or
recurrence constants from scratch: the full argument is below. A baseline hash
mismatch means another checkpoint landed; rebase the patch by inspecting the
actual differences rather than bypassing the guard or overwriting other work.

The existing gaps remain, with G7 now narrowed mathematically:

- G0: obtain and compare the final 2019-revised/2020 text.
- G1/G2: match and independently check the prior primitive-prefix and quadratic
  class-field replacement suppliers; preserve the trace metric, squared base
  class factor, infinite ramification and nonsplit unramified branch. The
  literal one-factor genus claim remains diagnostic.
- G3–G6: original Brumer–Kramer and HV proof interiors; arithmetic-torus/resolvent
  transfer; hyperelliptic discriminant/model issues; and del Pezzo height and
  singular-fiber inputs remain as in the previous handoff/result.
- G7: integrate the five nodes below, independently check BP1–BP6, and match
  exact Taylor/interpolation/rank/root-count, implicit/inverse-function,
  branch-continuation and proper Bézout suppliers at the pins. The stronger
  O(d²) whole-curve decomposition is not proved by our 8d³ finite-point cover,
  but is not needed for this replacement's constant 12.
- G8/G9: the original counting sources, function-field q-uniformity,
  epsilon/degree conventions, characteristic two and inseparability remain.
- G10: the four proposed source records do not complete the earlier
  genus/hyperelliptic/function-field source-issue inventory.

WORKERS permits this partial checkpoint. Do not approve this session's own
work, merge manually, or `/unclaim` a submitted job. Normal intake releases
an incomplete job after merging its checkpoint.

<!-- BP-SUPPLEMENT-BEGIN -->

---

## Sixth checkpoint: integer parameters and singular-point coverage

**Author:** ChatGPT Pro, `cgp-0922-d4f8c2`, 22 September 2026.
**Status:** partial paper extraction; proposed proof repairs, not independently
accepted or formalized. This continues merged checkpoints #1636, #1641,
#1650, #1695 and #1760 on issue #1420. The five proposed items and their guarded integration patch are supplied in
this handoff. The result JSON is not changed by this proof checkpoint. After
integration the complete earlier report remains before this supplement, with
its authorship and historical reading/validation claims preserved.

### Source and ownership boundary

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

### BP1. Normalize by integer translations, and stop below lattice scale

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

### BP2. The Taylor argument and its dimensionless parameter

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

### BP3. Iteration with an explicit stopping index

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

### BP4. All constants in the determinant recurrence

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

### BP5. Round down without changing the constant eleven

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

### BP6. Include singularities and boundaries without an endpoint shortcut

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

### BP7. Four source-issue records, with version and verification limits

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

### BP8. Machine integration, checks and the remaining closure boundary

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

#### Reproducible regression script

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

<!-- BP-SUPPLEMENT-END -->

## Guarded machine-integration patch

The following is data, not a claim that the live extraction is already updated.
The script below it applies these changes to the exact checked baseline.

<!-- BP-PATCH-BEGIN -->
```json
{
  "baseResultBlob": "ceec6960b756d275354f00c58e429cf0e498c583",
  "baseReportBlob": "48f7b052bab8574c85fc0ef4d6ddb467fa56edc1",
  "replaceItems": [
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bombieri-pila-explicit",
      "kind": "theorem",
      "name": "Coefficient-uniform Bombieri–Pila plane-curve estimate",
      "statement": "Let C be an absolutely irreducible affine plane curve of total degree d ≥ 2, and let N ≥ exp(d^6). The number of integral points on C in [0,N] × [0,N] is at most N^(1/d) exp(12 sqrt(d log N log log N)).",
      "locator": "Bombieri–Pila, The number of integral points on arcs and ovals, Theorem 5, author preprint p.17; cited in BSTTTZ §4 p.6",
      "status": "missing",
      "note": "The selected original proof path consists of the extracted determinant, auxiliary-curve and derivative-partition items. The sixth-checkpoint supplement BP1–BP6 adds the integer-parameter proof of constant 11 and an explicit 8d^3 cover of the integer points, including singular/boundary points; log(8d^3)≤sqrt(d log N loglog N) gives constant 12. This replacement does not assume smoothness of C or coefficient-height bounds. Proper Bézout, analytic branch continuation and exact generic supplier matching remain G7; no Lean implementation or independent review is claimed."
    },
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-large-derivative-interval",
      "kind": "theorem",
      "name": "Large derivative implies short interval",
      "statement": "Let k≥1 be an integer, A,N>0, a≤b, and g∈C^k([a,b]). If |g^(i)(x)|≤i! A^(i/k)N^(1−i) for 0≤i<k and |g^(k)(x)|≥k! A N^(1−k) throughout [a,b], then b−a≤2 A^(−1/k)N.",
      "locator": "Bombieri–Pila Lemma 7 p.14",
      "status": "missing",
      "note": "The sixth-checkpoint supplement BP2 gives the complete Taylor argument with t=(b−a)A^(1/k)/N. The identity t^k−Σ_(i=1)^(k−1)t^i−2=(t−2)Σ_(i=0)^(k−1)t^i gives t≤2, including k=1 and the degenerate interval. Source issue E1 records the printed opposite exponent. Exact Taylor supplier matching and Lean elaboration remain unclaimed."
    },
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-graph-count",
      "kind": "theorem",
      "name": "Coefficient-uniform algebraic graph bound",
      "statement": "Let d≥2 be an integer, N≥exp(d^6), and f a C-infinity real function on a neighbourhood of a compact interval I⊂[0,N]. If |f′|≤1 on I and F(x,f(x))=0 for an absolutely irreducible real plane polynomial F of total degree d, its graph over I has at most N^(1/d)exp(11√(d log N loglog N)) integral points.",
      "locator": "Bombieri–Pila Theorem 4 pp.15–17",
      "status": "missing",
      "note": "The sixth-checkpoint supplement BP1–BP5 supplies integer-only normalization, contraction stopping, the H+K inequalities and delta=floor(2 sqrt(log N/(d loglog N))). It proves the exact constant 11 conditional on the extracted determinant/partition inputs. Use q≤p, not the printed reverse inequality. G7 now concerns exact generic supplier matching and independent verification, not an unwritten integer-rounding argument. No Lean proof or independent acceptance is claimed."
    },
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-arc-decomposition",
      "kind": "theorem",
      "name": "Plane curve decomposes into bounded-slope arcs",
      "statement": "An absolutely irreducible degree-d plane curve in a square decomposes into O(d²) smooth graph pieces, each with slope at most one relative to one coordinate axis, together with O(d²) exceptional points.",
      "locator": "Bombieri–Pila Theorem 5 proof p.17",
      "status": "missing",
      "note": "The source claims a stronger O(d²) whole-curve decomposition, whose exact singular/end-point treatment is not verified by the sixth checkpoint. The new bp-explicit-graph-cover instead proves an 8d³ cover of the finite integer-point set and suffices for constant 12; it is not asserted to prove this stronger original item. Keep this original target for possible later refinement, not as a premise of the replacement route."
    }
  ],
  "appendItems": [
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-integer-normalization",
      "kind": "theorem",
      "name": "Integer-preserving normalization of a bounded-slope graph",
      "statement": "Let N≥1 and let g be C-infinity near a compact interval I of length at most N, with |g′|≤1. If its graph has at least two integral points, restrict I to the interval between their least and greatest integer abscissae. Integer translations of the two coordinates then put the new interval inside [0,N] and the graph inside [0,N]×[−N,N], preserving every counted integral point, total degree and absolute irreducibility of a defining polynomial.",
      "locator": "BP1 of the sixth-checkpoint supplement; expands Bombieri–Pila Theorem 4 proof, author preprint pp.15–16.",
      "status": "missing",
      "note": "Choose the vertical integer nearest the midpoint of the range; the new absolute value is ≤N/2+1/2≤N. Zero/one-point cases are separate. No arbitrary real translation of the lattice is allowed. For 0<N<1 use at most one integer abscissa instead. This is a lemma about the existing real interval and polynomial carriers, not a new definition. Tests: noninteger original interval endpoints; graph y=x+M for large integer M; N=1 and the zero/one-point branches. Owner: IntegralPointDeterminantMethods."
    },
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-contraction-iteration",
      "kind": "theorem",
      "name": "Stopping a determinant recurrence below lattice scale",
      "statement": "Let G:(0,∞)→[0,∞), α>0, H≥0, K≥1 and 0<λ<1 with Kλ^α=1/2. Suppose G(x)≤Hx^α+KG(λx) for x≥1 and G(x)≤1 for 0<x<1. Then G(N)≤(2H+K)N^α≤2(H+K)N^α for every N≥1.",
      "locator": "BP3 of the sixth-checkpoint supplement; Bombieri–Pila Theorem 4 recurrence, author preprint pp.16–17.",
      "status": "missing",
      "note": "For the least m with λ^mN<1, iterate m times. The residual term K^m equals 2^(−m)λ^(−mα) and is ≤2^(1−m)KN^α≤KN^α because λ^mN≥λ. The geometric sum is ≤2. Tests: N=1; λ^(m−1)N=1 with strict termination only at the next step; H=0. This numerical recurrence uses existing real powers and finite sums; no new generic owner."
    },
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-recurrence-constants",
      "kind": "theorem",
      "name": "Uniform determinant recurrence constants",
      "statement": "Let integers d≥2 and δ≥2d satisfy D=d(δ−d+1), p=d(δ(δ+1)−d(d−1))/2 and 0≤q≤p. Put α=2p/(D(D−1)), K=2d^4δ², λ=(2K)^(−1/α), A=(2/λ)^(D−1), X=(D^p A^q)^(2/(D(D−1))) and H=4d^5δ³X. Then Kλ^α=1/2 and H+K≤δ^(9dδ)/2. Consequently a graph-count function satisfying the preceding recurrence obeys G(N)≤N^(1/d)exp(4 log(N)/δ+9dδ log δ) for N≥1.",
      "locator": "BP4 of the sixth-checkpoint supplement; Bombieri–Pila Theorem 4 proof, author preprint pp.16–17.",
      "status": "missing",
      "note": "Use 1/d≤α≤1/d+4/δ≤2, D≤dδ and X≤(DA)^α. The full inequality chain is in BP4, not a numerical approximation. Choose the worst case q=p when taking a maximum over polynomials, so H is uniform in their leading monomials. Derivative partitions give at most K intervals; the small-norm contribution is ≤HN^α and the remaining pieces have length ≤λN. Source issue E2 corrects the printed p≤q. Tests: d=2, δ=4; every possible leading Y-degree; the q=0 and q=p endpoints."
    },
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-integer-optimization",
      "kind": "theorem",
      "name": "Integer parameter giving the Bombieri–Pila constant eleven",
      "statement": "For an integer d≥2 and N≥exp(d^6), put L=log N, ell=log L, S=sqrt(d L ell), x=2 sqrt(L/(d ell)) and δ=floor x. Then δ≥2d and 4L/δ+9dδ log δ≤11S.",
      "locator": "BP5 of the sixth-checkpoint supplement; repairs the unstated integer rounding in Bombieri–Pila Theorem 4, author preprint p.17.",
      "status": "missing",
      "note": "The proof is analytic, not inferred from testing: δ≥3x/4 and δ≥L^(1/4); E(t)=4L/t+9dt log t has E′(t)≥(17/36)d ell+9d>0 on [δ,x]. Thus E(δ)≤E(x)=S[11+(9/ell)log(4/(d ell))]≤11S. BP5 proves all threshold inequalities, using log d≤d/2. Source issue E3 records the gap, not a false theorem. Tests: d=2 and log N=64; both sides of integer jumps of x; large d at the threshold."
    },
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-explicit-graph-cover",
      "kind": "theorem",
      "name": "A singularity-safe cover for the integral-point theorem",
      "statement": "For N>0 and an absolutely irreducible real plane polynomial F of total degree d≥2, its integral zeros in [0,N]² are covered by at most 8d³ sets, each either a singleton or contained in a C-infinity graph on a compact subinterval of [0,N] with absolute slope at most one relative to one coordinate axis. Each graph satisfies F, or F with coordinates exchanged. For N≥exp(d^6), the constant-eleven graph bound therefore implies the constant-twelve plane-curve bound.",
      "locator": "BP6 of the sixth-checkpoint supplement; replacement for the abbreviated final passage of Bombieri–Pila Theorem 5, author preprint p.17.",
      "status": "missing",
      "note": "Use proper Bézout on F_Y, F_X+F_Y and F_X−F_Y, and horizontal boundary intersections. There are at most Q=3d(d−1)+2d critical abscissae. Each open strip has at most d simple analytic root graphs; invert steep ones, and restrict each to the compact hull of its finitely many integer points. Critical vertical fibers contribute at most d points each. The total is ≤d(Q+1)+d(Q+2)≤8d³; log(8d³)≤sqrt(d log N loglog N) absorbs it. No smoothness at the original singular endpoints is assumed. Generic proper-intersection/Bézout stays with SF.5; exact root-continuation and analytic inverse-function supplier matching remains G7. This does not prove the stronger O(d²) whole-curve claim. Tests: singular cusp Y²=X³; steep graphs needing axis exchange; integral points on critical/boundary vertical fibers. Owner: IntegralPointDeterminantMethods."
    }
  ],
  "appendSourceReadSection": "ChatGPT Pro cgp-0922-d4f8c2: the February 2017 main-paper author copy, all parsed pages including references, with the p.4 volume display visually checked; Bombieri–Pila selected determinant foundations pp.1–6 and all of §3 pp.10–17 read, with printed pp.3,14,17 visually checked. The original-source formulas are distinguished from the new BP1–BP6 replacement arguments. No new PDF byte hash, full reading of unrelated prerequisite interiors, or acquisition of the final 2020 publisher revision is claimed.",
  "appendSourceAccessNote": " Sixth checkpoint (2026-09-22): selected proof path reread; BP1–BP6 now supply an explicit integer rounding and singular-point cover. The quoted byte hash remains the earlier worker’s measurement, not a fresh download hash.",
  "summary": "Partial sixth checkpoint: 124 stable-identified items (22 library, 8 planned, 94 missing), retaining all 119 inherited IDs and the preceding proof/history. Five new determinant-method lemmas supply integer-preserving normalization, recurrence stopping and constants, the floor-parameter proof of constant 11, and an explicit singularity-safe 8d^3 integer-point cover giving constant 12. Four structured source issues record three Bombieri–Pila proof corrections and the main author-copy complex-volume factor. Six routes cover 87 missing items exactly once; seven diagnostics stay unrouted. Final-source acquisition, other original proof interiors, exact generic suppliers and independent verification remain gaps; no Lean implementation or complete extraction is claimed.",
  "routeBriefAppend": " Sixth-checkpoint refinement: use bp-integer-normalization, bp-contraction-iteration and bp-recurrence-constants, then delta=floor(2 sqrt(log N/(d loglog N))) with the derivative-monotonicity proof in bp-integer-optimization to obtain constant 11 without changing the threshold. For constant 12 use the explicit 8d^3 finite-integer-point graph cover rather than assuming the stronger O(d^2) whole-curve decomposition. Retain singular/critical fibers, horizontal boundaries, noninteger interval endpoints, inverse steep graphs and the strict N<1 stopping case. E1–E3 record the source-level corrections; G7 now retains exact generic supplier matching and independent verification. Earlier wording asking for an unwritten rounding proof is superseded by this refinement.",
  "replaceGaps": [
    {
      "id": "G7",
      "detail": "The sixth-checkpoint supplement BP1–BP6 and five new machine items now give the integer-preserving normalization, recurrence stopping, full H+K inequality chain, integer delta rounding with constant 11, and an explicit 8d^3 cover yielding constant 12. This does not verify the stronger original O(d^2) whole-curve decomposition. Remaining: exact pinned Taylor/interpolation/rank/root-count and analytic implicit/inverse-function interfaces; proper Bézout supplier closure in SF.5; a fully formal branch-continuation argument; and independent review of the replacement proof. No Lean implementation or acceptance is claimed."
    },
    {
      "id": "G10",
      "detail": "Still not a complete extraction of every proof input. The fourth-checkpoint basis and quadratic-relative replacements are now synchronized, but exact generic supplier matching, torus class-group infrastructure, HV and hyperelliptic descent interiors, del Pezzo geometry, the counting originals and the existing source-issue documentation obligations remain. G0 and G3–G9 are not closed by this synchronization. Sixth checkpoint adds structured sourceIssues E1–E4 and the five G7 proof nodes. This is not a complete source-issue inventory: earlier relative-genus, hyperelliptic, characteristic-two and function-field-counting observations still require their own verified records and source-version checks. G0 and G3–G9 remain distinct; the new determinant arguments do not close the entire paper."
    }
  ],
  "sourceIssues": [
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/E1",
      "kind": "misprint",
      "locator": "Bombieri–Pila, The number of integral points on arcs and ovals, Oxford author preprint, Lemma 7 proof, printed p.14 (PDF index 13).",
      "printed": "lambda = ell A^(-1/k)/N",
      "correction": "Use lambda = ell A^(1/k)/N, where ell is the interval length. Then Taylor gives lambda^k≤lambda^(k−1)+...+lambda+2.",
      "reason": "Divide the Taylor inequality by N. The k-th-order term is ell^k A/N^k, the k-th power of the corrected dimensionless quantity. The polynomial identity in supplement BP2 proves lambda≤2, retaining the stated interval bound.",
      "affects": "the proof",
      "known": "new",
      "searched": [
        "Web search on 2026-09-22: Bombieri Pila \"arcs and ovals\" erratum",
        "Web search on 2026-09-22: \"Bombieri\" \"Pila\" \"Since p\"",
        "Read the Oxford-hosted author preprint at https://people.maths.ox.ac.uk/pila/Ovals.pdf, especially printed pp.14–17; no existing correction was located in these searches."
      ]
    },
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/E2",
      "kind": "misprint",
      "locator": "Bombieri–Pila Oxford author preprint, Theorem 4 proof, printed p.17 (PDF index 16), just before the estimate for H+K.",
      "printed": "Since p ≤ q",
      "correction": "Since q ≤ p.",
      "reason": "For the selected monomials X^i Y^j, q=Σj while p=Σ(i+j), and i≥0. Since A>1 this gives A^q≤A^p, the direction needed in the next estimate. Supplement BP4 writes out the entire subsequent bound.",
      "affects": "the proof",
      "known": "new",
      "searched": [
        "Web search on 2026-09-22: Bombieri Pila \"arcs and ovals\" erratum",
        "Web search on 2026-09-22: \"Bombieri\" \"Pila\" \"Since p\"",
        "Read the Oxford-hosted author preprint at https://people.maths.ox.ac.uk/pila/Ovals.pdf, especially printed pp.14–17; no existing correction was located in these searches."
      ]
    },
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/E3",
      "kind": "gap",
      "locator": "Bombieri–Pila Oxford author preprint, Theorem 4 proof, printed p.17 (PDF index 16), final choice of the monomial cutoff δ.",
      "printed": "δ = 2 sqrt(log N/(d log log N))",
      "correction": "Take the floor of the displayed real number and prove the threshold and error inequalities; supplement BP5 proves δ≥2d and 4 log N/δ+9dδ log δ≤11 sqrt(d log N log log N).",
      "reason": "The monomial cutoff used to define D and p must be an integer. The printed real choice alone does not supply an admissible cutoff or justify the exact constant. Monotonicity of the objective between its floor and that real choice proves that rounding down preserves the estimate; the stated theorem and threshold need not change.",
      "affects": "the proof",
      "known": "new",
      "searched": [
        "Web search on 2026-09-22: Bombieri Pila \"arcs and ovals\" erratum",
        "Web search on 2026-09-22: \"Bombieri\" \"Pila\" \"Since p\"",
        "Read the Oxford-hosted author preprint at https://people.maths.ox.ac.uk/pila/Ovals.pdf, especially printed pp.14–17; no existing correction was located in these searches."
      ]
    },
    {
      "id": "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/E4",
      "kind": "misprint",
      "locator": "BSTTTZ, Taniguchi author copy dated 18 February 2017, proof of Theorem 2.1, printed p.4 (PDF index 3), product formula for the volume of B.",
      "printed": "sqrt(pi) |Disc(K)|^(1/(2n)) |alpha|_v^(-1/m)",
      "correction": "For every complex place, square the whole displayed factor: its disc contributes pi R_v^2, not sqrt(pi) R_v. The body volume is 2^r pi^s sqrt(D_K)/N(I).",
      "reason": "A complex coordinate is two real dimensions. With K=Q(i), I=O_K and alpha=1, the radius is sqrt(2); the disc area is 2pi rather than sqrt(2pi). The latter is below the Minkowski threshold 4 in the ordinary metric, whereas the correct area is above it. The existing balanced-body item already uses the corrected formula, so the theorem and its route are unchanged.",
      "affects": "the proof",
      "known": "new",
      "searched": [
        "Web search on 2026-09-22: \"Bounds on 2-torsion in class groups\" corrigendum",
        "Read and visually inspected https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf, printed p.4. No existing correction located in the search.",
        "AMS final article/PDF paths and the author publication page were attempted but did not yield the final revision; this record makes no claim about its typography."
      ]
    }
  ],
  "sourceIssueBoundary": "E1–E4 refer only to the exact author-copy versions and locators given. The known=new marker means that the recorded limited searches found no existing correction, not a priority claim. These are proposed source-issue records, not independently verified errata; the final BSTTTZ publisher text remains unacquired. No authors were contacted.",
  "verification": {
    "agent": "ChatGPT Pro",
    "session": "cgp-0922-d4f8c2",
    "issue": 1420,
    "date": "2026-09-22",
    "continues": [
      1636,
      1641,
      1650,
      1695,
      1760
    ],
    "baseResultBlob": "ceec6960b756d275354f00c58e429cf0e498c583",
    "baseReportBlob": "48f7b052bab8574c85fc0ef4d6ddb467fa56edc1",
    "stableIds": "All 119 inherited IDs retained, all 22 library and eight planned item objects unchanged, five new theorem items. The four modified inherited missing items are enumerated below. Source-file hashes, pins, prerequisites and earlier verification are preserved; the entire previous Markdown report is preserved as a contiguous historical text.",
    "modifiedInheritedItems": [
      "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bombieri-pila-explicit",
      "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-large-derivative-interval",
      "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-graph-count",
      "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/bp-arc-decomposition"
    ],
    "libraryBoundary": "No new library or planned classification is made. The oversized data/library-coverage.json reader returned empty content; the relevant accepted REV-AUDIT-01 review was read instead, along with the SchemeAndStackFoundations atlas record and the complete upstream AlgebraicCurves roadmap. Exact generic determinant, Taylor, real-root continuation and Bézout declarations remain G7, rather than being inferred from the audit or a name search.",
    "ownership": "Read WORKERS, PROTOCOL including sections 15/16/18, BROWSER_AGENTS, UPSTREAM_GUIDE, expansion PROTOCOL, the live issue/handoff and complete inherited result/report. Read complete completed-EffectiveBounds and AlgebraicCurves roadmaps and SchemeAndStackFoundations stage descriptions. The five lemmas refine the inherited IntegralPointDeterminantMethods candidate only. Generic algebraic geometry remains with SF.5; no new roadmap, intersection library or stronger O(d^2) proof is claimed. Earlier catalogue-wide screens retain their historical attribution.",
    "checks": "Local baseline UTF-8 Git-blob hashes matched both current files exactly. JSON parse, all stable IDs, preservation of library/planned objects and provenance, unique routing, explicit gaps, definition API/tests and source-issue schema were checked. Reproducible script in the report passed 19,720 exact monomial cases, Taylor identities for k=1..30, piece-count inequalities for d=2..300, 1,188 high-precision threshold/floor-jump cases and 348 recurrence-constant chains. Finite regressions are not proofs. The unmodified full-catalogue check_paper.py and intake check-files were not run locally: no full repository clone/catalogue was available. The full-catalogue check must run on the PR that integrates this patch; its real outcome must be read from the workflow and recorded in the PR discussion, not inferred from these tests.",
    "lean": "No Lean artifact requested or compiled. No independent review or complete-source acceptance is claimed."
  }
}
```
<!-- BP-PATCH-END -->

### Apply from the repository root

```python
import copy
import hashlib
import json
from pathlib import Path

job = "PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20"
root = Path("research/blueprint")
handoff = (root / "handoff" / (job + ".md")).read_text(encoding="utf-8")

def between(start, end):
    return handoff.split(start, 1)[1].split(end, 1)[0]

patch_text = between("<!-- BP-PATCH-BEGIN -->", "<!-- BP-PATCH-END -->")
patch = json.loads(patch_text.split("```json", 1)[1].rsplit("```", 1)[0])
supplement = between("<!-- BP-SUPPLEMENT-BEGIN -->", "<!-- BP-SUPPLEMENT-END -->")
result_path = root / "papers" / (job + ".result.json")
report_path = root / "papers" / (job + ".md")

def blob(data):
    return hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()

original_bytes = result_path.read_bytes()
report_bytes = report_path.read_bytes()
assert blob(original_bytes) == patch["baseResultBlob"], "Result changed: rebase, do not overwrite."
assert blob(report_bytes) == patch["baseReportBlob"], "Report changed: rebase, do not overwrite."
original = json.loads(original_bytes)
data = copy.deepcopy(original)
replacement = {i["id"]: i for i in patch["replaceItems"]}
assert len(replacement) == 4
assert set(replacement) <= {i["id"] for i in original["items"]}
data["items"] = [replacement.get(i["id"], i) for i in data["items"]]
data["items"].extend(patch["appendItems"])
source = data["source"]
source["readSections"].append(patch["appendSourceReadSection"])
source["additionalSource"]["accessNote"] += patch["appendSourceAccessNote"]
route = next(r for r in data["routes"] if r["roadmap"] == "IntegralPointDeterminantMethods")
route["items"].extend(i["id"] for i in patch["appendItems"])
route["brief"] += patch["routeBriefAppend"]
gaps = {g["id"]: g for g in patch["replaceGaps"]}
data["gaps"] = [gaps.get(g["id"], g) for g in data["gaps"]]
for key in ("summary", "sourceIssues", "sourceIssueBoundary"):
    data[key] = patch[key]
data.setdefault("verificationHistory", []).append(copy.deepcopy(data["verification"]))
data["verification"] = patch["verification"]
assert len(data["items"]) == 124
assert len({i["id"] for i in data["items"]}) == 124
assert {i["id"] for i in original["items"]} <= {i["id"] for i in data["items"]}
assert [i for i in original["items"] if i["status"] != "missing"] == [i for i in data["items"] if i["status"] != "missing"]
assert data["source"]["files"] == original["source"]["files"]
assert data["source"]["pins"] == original["source"]["pins"]
assert data["prerequisites"] == original["prerequisites"]
notice = ("> **Sixth-checkpoint integration.** The five determinant-method nodes and\n"
          "> four proposed source issues are now in the 124-item partial result.\n"
          "> The supplement at the end gives the proof and its limitations;\n"
          "> earlier 110-item/pending-synchronization notices are historical.\n\n")
new_report = notice + report_bytes.decode("utf-8") + supplement
assert report_bytes.decode("utf-8") in new_report
result_path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
report_path.write_text(new_report, encoding="utf-8")
print("Applied guarded integration; run the full repository checks and inspect the diff.")
```
