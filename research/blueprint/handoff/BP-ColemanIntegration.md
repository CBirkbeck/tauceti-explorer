# BP-ColemanIntegration — continuation handoff

Issue #698. Agent: ChatGPT Pro. Session: `cp-20260926-6f2c`.
Date: 26 September 2026. Claim 5848203265; bot confirmation 5848204297.

## Submission status

**Partial, handoff-only checkpoint.** This document gives an explicit replacement argument for the maximally degenerate five-term case, an exhaustive elementary normalization proof, regression tests, and the declaration-level integration plan. **The packet, roadmap document, and suggested Lean file have not been edited.** The five-term gap therefore remains recorded in the live packet. No mathematical closure or implementation is claimed by this submission.

The original handoff is preserved at an immutable revision:
[previous handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/b98cf52f68bb64a40667dcd29bd8e0b7f20b9a51/research/blueprint/handoff/BP-ColemanIntegration.md).
Its source issues, requests, other gaps, and historical checks remain part of the continuation record. Nothing below retracts them or claims that this worker reran them.

Input packet blob: `0801a7857eac45b6981df456291e7cc40659e7ea` (654,987 bytes). Its unchanged inventory is 112 nodes: 18 definitions, 9 constructions, 45 lemmas, 30 theorems and 10 comparisons; 229 API items, 117 tests, 22 planets, 89 baseline declarations, 19 requests and 5 gaps. Its status remains `partial`.

The available GitHub text-write action requires complete file replacement. I did not safely reconstruct the complete large packet in the local workspace, so I preserved the result here rather than overwrite unrelated nodes or claim an unapplied patch.

## Inputs and sources checked

Read the issue and WORKERS, the blueprint/expansion protocols and upstream guidance; the existing handoff; the L0 disc-function/primitive-uniqueness interfaces; the full L2 dilogarithm-identities and five-term nodes; the L0–L3 stage descriptions; the Polylogarithms P.1–P.2 ownership text; and AUDIT-23's Coleman entries with the accepted review `REV-AUDIT-23.md`.

The reviewed audit distinguishes existing analytic and formal-power-series infrastructure from the missing Coleman theory. This continuation does not plan a second logarithm, a second analytic-function carrier, or a second general complex polylogarithm. It uses the existing L0/L2 nodes.

Fresh primary source:

- Rob de Jeu, *Describing all multivariable functional equations of dilogarithms*, arXiv:2007.11014v1, 21 July 2020, [PDF](https://arxiv.org/pdf/2007.11014v1). Read the p-adic discussion and Proposition **2.10** on printed page 6, and the paragraph immediately before its proof on printed page 14. Both pages were visually checked. The latter cites Coleman's Proposition 6.4 and Corollary 6.5b and explicitly notes corrected signs. Proposition 2.9 in this version concerns the Rogers dilogarithm, not the p-adic one. No SHA-256 is supplied because no local copy of these bytes was obtained.
- Z. Wojtkowiak, *A note on functional equations of the p-adic polylogarithms*, Bulletin SMF 119 (1991), 343–370, [version-of-record PDF](https://www.numdam.org/item/10.24033/bsmf.2171.pdf). Re-read the introduction's series and continuation conventions from its text layer. Requests for rendered pages 363–364 failed; do not count them as newly visually checked. The existing packet's source ID `wojtkowiak-functional` and its historical page-image checks are retained, not newly certified here.

The calculations below are this worker's explicit elaboration of the five-term target, **not a claim that either reference prints this proof**. No new published-source erratum is asserted.

# The local repair

Fix a prime p and a branch log_a on C_p^×, with log_a(p)=a. Write

- ell_2(z) = sum_{n>=1} z^n/n^2 for |z|<1;
- D^a(z) = Li_2^a(z) + (1/2) log_a(z) log_a(1-z), for z not equal to 0 or 1;
- Phi_a(x,y) = D^a(x)-D^a(y)+D^a(y/x)-D^a((1-x^(-1))/(1-y^(-1)))+D^a((1-x)/(1-y)).

Use L2's established power-series normalization and the two identities D^a(1-z)=-D^a(z), D^a(1/z)=-D^a(z). All the following arguments work also at p=2: 1/2 exists in C_p, and no integrality of this scalar is assumed.

## 1. The ordinary analytic identity

Let |x|<1 and |u|<1, allowing x=0 or u=0 in this paragraph. Set

v = u(1-x)/(1-xu),     w = x(1-u)/(1-xu),

A = log(1-x),     B = log(1-u),     C = log(1-xu),

P = A-C,     Q = B-C,

where these logarithms mean their ordinary convergent series on 1 plus the open unit disc. The denominators are units. The identities

1-v = (1-u)/(1-xu),     1-w = (1-x)/(1-xu)

show that |v|=|u| and |w|=|x|. Then

**ell_2(x)+ell_2(u)-ell_2(xu)-ell_2(v)-ell_2(w) = P Q.**

### Convergence, not just pointwise local analyticity

Fix u with |u|<1. For each positive r<1 in the value group, work in the one-variable closed-disc Tate algebra C_p<r^(-1)X>. The geometric inverse (1-uX)^(-1) has Gauss norm 1. In this algebra the Gauss norms of v and w are at most |u| and r, respectively. Therefore the series ell_2(v), ell_2(w), and all logarithms used above converge in this same Banach algebra: the n-th term is bounded by c^n |1/n^2|, or c^n |1/n|, for a fixed c<1. Since |1/n|_p <= n, exponential decay dominates these factors. The resulting expressions have compatible single power-series expansions on these concentric closed discs, covering the open unit disc.

Thus the difference F between the two sides is an **ordinary power-series analytic function of x on the entire open unit disc**. It is not merely an arbitrary locally analytic function, and no logarithm-polynomial uniqueness theorem is being assumed.

### Derivative and constant

For x nonzero, ell_2'(z)=-log(1-z)/z gives

P' = -1/(1-x)+u/(1-xu),     Q' = u/(1-xu),

v'/v = P',     w'/w = 1/x+u/(1-xu).

Consequently

F' = -P/x + Q(v'/v) + P(w'/w) - P'Q - PQ' = 0.

The apparent singularity at x=0 is removable because all expressions defining F are analytic there. Equivalently, multiply the derivative identity by X and use injectivity of multiplication by X in the power-series algebra. The characteristic-zero coefficient argument of `ColemanIntegration:L0/disc-primitive-unique` makes F constant on each concentric disc. At x=0, v=u, w=0 and P=0, so F(0,u)=0. These discs have the same center, hence F=0 for every |x|<1. The case u=0 is also immediate directly from the formula.

This proves the identity without invoking a functional equation of the already-continued dilogarithm, so there is no circular use of the five-term theorem.

## 2. The branch-logarithm cancellation

Now assume 0<|x|<1 and 0<|u|<1 and put y=xu. Let L=log_a(x), M=log_a(u). Then all of x,u,xu,v,w lie in the punctured unit disc, and

log_a(v)=M+P,     log_a(1-v)=Q,

log_a(w)=L+Q,     log_a(1-w)=P.

The fifth argument of Phi_a(x,xu) is 1-w, and its fourth argument is v. Reflection therefore gives

Phi_a(x,xu)=D^a(x)+D^a(u)-D^a(xu)-D^a(v)-D^a(w).

Its logarithm contribution is exactly

(1/2) [ LA + MB - (L+M)C - (M+P)Q - (L+Q)P ] = -P Q.

The ordinary dilogarithm-series contribution is +P Q by paragraph 1. They cancel. Hence

**Phi_a(x,y)=0 whenever 0<|y|<|x|<1, for every branch a.**

The decisive point is that L and M cancel *before* differentiating. The old draft's inference that a zero differential of a logarithm-polynomial expression makes it constant is unnecessary. Neither a two-variable logarithm-transcendence theorem nor semistable Coleman continuation is used here. No limit in an unboundedly ramified extension is used either.

# Exhaustive normalization of five points

This is elementary ultrametric geometry, not an appeal to the classification of stable marked curves.

Normalize three of five distinct points of P^1(C_p) to infinity,0,1. Call the other two x,y. A special unit z means |z|=|1-z|=1. If x or y is special, four points already have pairwise distinct reductions. Otherwise each lies in exactly one of the three residue discs at 0,1,infinity, characterized by |z|<1, |1-z|<1, |z|>1. The six fractional-linear transformations permuting infinity,0,1 permute these three discs.

## Same residue disc

Send that disc to the disc at 0, so |x|,|y|<1.

- If |x| and |y| differ, exchange x,y if necessary. This gives 0<|y|<|x|<1.
- If |x|=|y|=r and |x-y|=r, scale by 1/x. The four points infinity,0,1,y/x have distinct reductions, since |y/x|=|1-y/x|=1. The fifth point is distinct from them and is not discarded.
- If |x|=|y|=r and |x-y|<r, use h(t)=(t-x)/(1-x). It sends infinity,x,1 to infinity,0,1, while the other two images are

  a=-x/(1-x),     b=(y-x)/(1-x).

  They satisfy 0<|b|<|a|=r<1.

These alternatives are exhaustive by the ultrametric inequality.

## Different residue discs

Permute infinity,0,1 so that |x|<1 and |1-y|<1. Then |y|=1. Use

h(t)=x(1-t)/(t(1-x)).

It sends 0,1,x to infinity,0,1, and the remaining images are

a=h(infinity)=-x/(1-x),     b=h(y)=x(1-y)/(y(1-x)).

Here |a|=|x|<1 and |b|=|x| |1-y|<|a|. The determinant of the displayed fractional-linear map is -x(1-x), which is nonzero; no identification of distinct points occurs.

Thus **every five-point configuration is equivalent either to a configuration with four distinct reductions, or to infinity,0,1,x,xu with 0<|x|,|u|<1**. The assertion is valid over C_p, not just for the rational test cases below.

# Transporting the relation without guessing its sign

Temporarily use q(a,b,c,d)=(a-c)(b-d)/((a-d)(b-c)), extended to P^1. This is only notation for explaining the existing cross-ratio, not a competing definition. Put C_a(a,b,c,d)=D^a(q(a,b,c,d)). The two-term identities make C_a alternating under the four-point permutation action; fractional-linear invariance is the ordinary cross-ratio identity.

For an ordered five-tuple s, form the alternating omission sum

delta C_a(s)=sum_{i=0}^4 (-1)^i C_a(s_0,...,omit(s_i),...,s_4).

It is alternating in the five points and fractional-linear invariant. At (infinity,0,1,x,y), the five omitted-point cross-ratios, in order, are 1/v,1/s,y/x,y,x, where v=(1-x^(-1))/(1-y^(-1)) and s=(1-x)/(1-y). Applying D^a(1/z)=-D^a(z) shows that delta C_a is exactly Phi_a(x,y).

The packet's cross-ratio r(a,b,c,d)=(a-b)(c-d)/((a-d)(c-b)) equals 1-q(a,b,c,d); its D-value is -C_a. Thus its omission sum differs by one overall minus sign, which does not change vanishing. Implement the comparison on the existing Polylogarithms cross-ratio carrier. Do not import the *complex Bloch–Wigner five-term theorem* to justify this algebraic permutation calculation.

The normalization lemma and the local repair now reduce the general five-term statement to the existing four-distinct-reductions argument. That argument must remain a separately checked input: fix a special unit y, use the good-reduction punctured line and Coleman uniqueness, then evaluate its constant by the bounded-ramification limit x->0, as the existing node does. If its model is constructed only over finite extensions, first prove the statement for algebraic x,y and then use density of the algebraic closure and local analyticity away from every forbidden argument. Approximation stays in the same open special-unit and distinctness conditions. **Do not silently identify local analytic uniqueness with Coleman uniqueness or assume arbitrary punctures lie in one finite extension.**

# Declaration-sized integration plan

Keep `ColemanIntegration:L2/five-term-relation` and its downstream consumers. Add the following proposed lemma nodes under L2 (names are not yet reserved or inserted):

1. `ColemanIntegration:L2/abel-series-disc-analyticity`: the convergence statement of paragraph 1, including Gauss-norm bounds and compatibility of concentric-disc series. Inputs: L0/disc-analytic-functions, L2/p-adic-polylogarithm, and the pinned analytic-series operations already used by those nodes. Its proof does not use five-term.
2. `ColemanIntegration:L2/abel-series-unit-bidisc`: the identity of paragraph 1, proved using node 1, L2/differential-recursion and L0/disc-primitive-unique. Include the x=0 and u=0 cases explicitly.
3. `ColemanIntegration:L2/five-term-nested-discs`: paragraph 2, using node 2, L0/log-branch and L2/dilogarithm-identities. The branch-log cancellation is a routine polynomial identity inside its proof.
4. `ColemanIntegration:L2/five-term-permutation-covariance`: the omission-sum argument above, using the existing cross-ratio identities and L2/dilogarithm-identities, not the conclusion of five-term.
5. `ColemanIntegration:L2/five-point-ultrametric-normalisation`: the exhaustive same-disc/different-disc proof above, with explicit fractional-linear maps and norm inequalities. Reuse the existing P^1/cross-ratio carrier and pinned ultrametric norm API; verify the precise Lean declaration names before adding any new baseline citation.
6. `ColemanIntegration:L2/five-term-four-distinct-reductions`: split out and check the old parent's good-reduction argument, retaining its model, finite-extension, uniqueness and limit hypotheses. Inputs are L1/coleman-pullback, L1/coleman-uniqueness-principle, L2/value-at-one, L2/dilogarithm-identities and the algebraic cross-ratio identity. Its proof must not cite its parent.

The parent then uses nodes 3–6; keep its branch-independence/pre-Bloch/Bloch conclusions with their existing separate algebraic proof. No new definition is needed, so this repair introduces no new API or definition-test obligation. Each lemma still needs its precise statement, proof steps, prerequisites, acceptance records, source locator and `implementationStatus: unchecked`.

After inserting and checking these nodes:

- replace the parent's last proof step, rather than leaving both an old gap assertion and a new proof;
- replace its statement's partial-proof caveat with the actual hypothesis-complete statement;
- remove only the gap titled `The five-term relation for D^a in maximally degenerate configurations`, and only after its dependents and the good-case input are reconciled;
- revise the corresponding L2 coverage remainder and the five-term-specific semistable alternative in restructure proposal 11; do not rescope the general L1 theory merely to repair this relation;
- update the matching roadmap passage and suggested signatures/tests;
- retain every other gap, request, node ID, source issue and recorded baseline claim;
- do not change the whole packet to `closed`: the L1/L3 gaps and open supplier requests remain.

# Acceptance tests and checks actually run

Mathematical regression specifications:

- The Abel series difference has coefficient 1 at XU; the product P Q also has coefficient 1. The sign-reversed identity leaves coefficient 2, nonzero over every C_p including C_2.
- Setting x=0 or u=0 makes both sides of the ordinary analytic identity zero.
- The polynomial log correction is -P Q for arbitrary symbols L,M, not just the Iwasawa branch.
- At p=5, x=u=5 gives the missing nested case (x,y)=(5,25), and inversion covariance handles (1/5,1/25).
- At p=2, x=2,u=4 exercises the same argument without assuming p is odd.
- At p=5, (x,y)=(5,10) is the equal-radius/different-reduction case; scaling gives the special unit 2.
- At p=5, (x,y)=(5,30) is the closer-cluster case; the normalized images are 5/4 and -25/4.
- At p=5, (x,y)=(5,6) is the two-disc case; the images are 5/4 and 25/24.
- Over the unramified quadratic extension of Q_2, take a primitive cube root omega and (x,y)=(2,2 omega). Equal radii and maximal separation give the special unit omega. This is a specification, not a numerical extension-field test performed by this worker.

Executed in the local scratch workspace:

- SymPy exact polynomial simplification of the log correction: passed.
- SymPy exact rational simplification of the x-derivative and both identities for 1-v,1-w: passed.
- Independent sparse bivariate series calculation over Q modulo total degree 8,12,18: all coefficients of F vanished. Reversing the product sign was rejected at XU.
- Exhaustive exact-Fraction tests of the normalization maps for p=2,3,5,7 on the generated rational sample: **52,910 distinct ordered pairs passed**. Counts: already good 26,854; different discs 17,446; same disc/unequal radii 3,676; same disc/equal radii with distinct reduction 2,254; same disc/closer cluster 2,680. Tests checked transformed point sets, distinctness and valuation inequalities, not merely a branch label.

These finite checks supplement the proofs above; they are not proofs over all of C_p.

A compact reproducible exact-series check (Python standard library only) is included here so that it survives the scratch environment:

```python
from fractions import Fraction as Q

def check(N):
    def add(*args):
        out = {}
        for a in args:
            for m, c in a.items():
                out[m] = out.get(m, Q(0)) + c
        return {m: c for m, c in out.items() if c}
    def scale(a, c):
        return {m: v*c for m, v in a.items() if v*c}
    def mul(a, b):
        out = {}
        for (i, j), c in a.items():
            for (k, l), d in b.items():
                if i+j+k+l < N:
                    m = (i+k, j+l)
                    out[m] = out.get(m, Q(0)) + c*d
        return {m: c for m, c in out.items() if c}
    def li(a, weight):
        out, power = {}, {(0, 0): Q(1)}
        for n in range(1, N):
            power = mul(power, a)
            out = add(out, scale(power, Q(1, n**weight)))
        return out
    x, u = {(1, 0): Q(1)}, {(0, 1): Q(1)}
    xu = mul(x, u)
    inv = {(i, i): Q(1) for i in range((N+1)//2)}
    v = mul(add(u, scale(xu, -1)), inv)
    w = mul(add(x, scale(xu, -1)), inv)
    A, B, C = (scale(li(z, 1), -1) for z in (x, u, xu))
    PQ = mul(add(A, scale(C, -1)), add(B, scale(C, -1)))
    lhs = add(li(x, 2), li(u, 2), scale(li(xu, 2), -1),
              scale(li(v, 2), -1), scale(li(w, 2), -1))
    assert not add(lhs, scale(PQ, -1))
    assert add(lhs, PQ).get((1, 1)) == 2

for N in (8, 12, 18):
    check(N)
print('PASS: exact Abel identity and wrong-sign regression')
```

**Not run in this continuation:** the full repository blueprint validator, the declaration-index validator, a global dependency-cycle check, or Lean. The suggested file is unchanged. The original worker's successful compilation and validators are historical results only, and do not validate the proposed additions.

# Remaining work and resumption

Start by applying the six-lemma integration plan, checking its exact prerequisite names against the current packet and pinned sources. Then run the repository validators and compile the modified suggested file. A handoff-only submission does not add any nodes to the atlas.

The inherited remainder stays active:

- L0 is recorded as source-decomposed, not newly audited here.
- L1: general good-reduction affine-curve algebraic de Rham comparison; lift independence and pullback when Omega-plus is not free.
- L2: this repair awaits packet/document/signature integration and independent checking of the retained good-reduction input.
- L3: decomposition of Besser–de Jeu Theorem 1.10(2); the owner for complex Artin L-functions with coefficients.
- All nineteen supplier requests and the unrelated restructuring decisions remain; see the immutable prior handoff and the packet for their exact statements.
- The existing RJW correction E15, smoothing issue E17 and other sourceIssues are unchanged and were not independently re-audited in this continuation.
